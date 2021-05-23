#include <a_samp>

#define FIRST_SKIN      (0)
#define LAST_SKIN       (299)
#define INVALID_SKIN    (32767)

#define SKIN_TEXT_STRING_BUY     	("~g~<    ~h~~r~[  Buy   ]    ~g~> ~n~      ~w~[ Cancel ]")
#define SKIN_TEXT_STRING_CANCEL     ("~g~<    ~w~[  Buy   ]    ~g~> ~n~      ~h~~r~[ Cancel ]")

#define IsPurchasableSkin           IsValidSkin // retirar isso depois

new Text:ClothesText[2];

enum pOptions
{
	OPT_BUY,
	OPT_CANCEL
}

enum _pSkinData
{
	pCurSkin,
	pSaveSkin,
	pKeyTimer,
	pOptions:pOpt
}

new pSkinData[MAX_PLAYERS][_pSkinData];

forward CheckPlayerPressKey(playerid);

//OnGameModeInit
public OnFilterScriptInit()
{
	for(new ct = 0; ct < sizeof(ClothesText); ct++)
	{
	    ClothesText[ct] = TextDrawCreate(21, 125, " ");
		TextDrawAlignment(ClothesText[ct], 0);
		TextDrawFont(ClothesText[ct], 1);
		TextDrawLetterSize(ClothesText[ct], 0.5 ,3);
		TextDrawColor(ClothesText[ct], 0xFFFFFFFF);
		TextDrawSetProportional(ClothesText[ct], 1);
		TextDrawSetShadow(ClothesText[ct], 2);
	}
	
	TextDrawSetString(ClothesText[0], SKIN_TEXT_STRING_BUY);
	TextDrawSetString(ClothesText[1], SKIN_TEXT_STRING_CANCEL);
}

//OnGameModeExit
public OnFilterScriptExit()
{
	for(new ct = 0; ct < sizeof(ClothesText); ct++)
	{
		TextDrawDestroy(ClothesText[ct]);
	}
}

public OnPlayerConnect(playerid)
{
	pSkinData[playerid][pCurSkin] = INVALID_SKIN;
}

public OnPlayerDisconnect(playerid)
{
	if(pSkinData[playerid][pCurSkin] != INVALID_SKIN)
		HidePlayerClothes(playerid);
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp(cmdtext, "/skin", true) == 0)
	{
		ShowPlayerClothes(playerid);
	}
	return 0;
}

stock ShowPlayerClothes(playerid)
{
	pSkinData[playerid][pSaveSkin] = GetPlayerSkin(playerid);
	pSkinData[playerid][pCurSkin] = FIRST_SKIN;
	pSkinData[playerid][pOpt] = OPT_BUY;
	pSkinData[playerid][pKeyTimer] = SetTimerEx("CheckPlayerPressKey", 200, true, "d", playerid);
	SetPlayerSkin(playerid, pSkinData[playerid][pCurSkin]);
	TogglePlayerControllable(playerid, false);
	TextDrawShowForPlayer(playerid, ClothesText[0]);
	
	//Ajeitar as câmeras aqui
	new Float:X, Float:Y, Float:Z, Float:A;
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, A);
	
	SetPlayerCameraPos(playerid, X + 3.0 * floatsin(-A, degrees),
								 Y + 3.0 * floatcos(-A, degrees),
								 Z + 3.0);
								 
	SetPlayerCameraLookAt(playerid, X, Y, Z);
}

stock HidePlayerClothes(playerid)
{
	KillTimer(pSkinData[playerid][pKeyTimer]);
	pSkinData[playerid][pCurSkin] = INVALID_SKIN;
	SetPlayerSkin(playerid, pSkinData[playerid][pSaveSkin]);
	TogglePlayerControllable(playerid, true);
	TextDrawHideForPlayer(playerid, ClothesText[0]);
 	TextDrawHideForPlayer(playerid, ClothesText[1]);
 	SetCameraBehindPlayer(playerid);
}

public CheckPlayerPressKey(playerid)
{
	if(pSkinData[playerid][pCurSkin] != INVALID_SKIN)
	{
		new keys[3];
		GetPlayerKeys(playerid, keys[0], keys[1], keys[2]);
	
	    if(keys[0] == KEY_JUMP)
	    {
	        if(pSkinData[playerid][pOpt] == OPT_BUY)
	        {
				//Checar dinheiro e coisas relacionadas (ou checar no inicio e retirar aqui)
	            pSkinData[playerid][pSaveSkin] = pSkinData[playerid][pCurSkin];
	        }
			HidePlayerClothes(playerid);
	    }
		else if(keys[1] == KEY_UP)
		{
		    pSkinData[playerid][pOpt] = OPT_BUY;
		    TextDrawHideForPlayer(playerid, ClothesText[1]);
		    TextDrawShowForPlayer(playerid, ClothesText[0]);
		}
		else if(keys[1] == KEY_DOWN)
		{
			pSkinData[playerid][pOpt] = OPT_CANCEL;
		    TextDrawHideForPlayer(playerid, ClothesText[0]);
		    TextDrawShowForPlayer(playerid, ClothesText[1]);
		}
		else if(keys[2] == KEY_LEFT)
		{
			pSkinData[playerid][pCurSkin]--;
		    if(!IsPurchasableSkin(pSkinData[playerid][pCurSkin]))
		    {
		        new current_skin = pSkinData[playerid][pCurSkin];
				pSkinData[playerid][pCurSkin] = -INVALID_SKIN;
		        for(new sk = current_skin; sk > FIRST_SKIN; sk--)
				{
				    if(IsPurchasableSkin(sk))
				    {
				        pSkinData[playerid][pCurSkin] = sk;
				        break;
				    }
				}
				
				if(pSkinData[playerid][pCurSkin] == -INVALID_SKIN)
				{
				    for(new sk = LAST_SKIN; ; sk--)
				    {
				        if(IsPurchasableSkin(sk))
				        {
				            pSkinData[playerid][pCurSkin] = sk;
				            break;
				        }
				    }
				}
		    }
		    SetPlayerSkin(playerid, pSkinData[playerid][pCurSkin]);
		}
		else if(keys[2] == KEY_RIGHT)
		{
		    pSkinData[playerid][pCurSkin]++;
		    if(!IsPurchasableSkin(pSkinData[playerid][pCurSkin]))
		    {
		        new current_skin = pSkinData[playerid][pCurSkin];
		        pSkinData[playerid][pCurSkin] = -INVALID_SKIN;
		        for(new sk = current_skin; sk < LAST_SKIN + 1; sk++)
				{
				    if(IsPurchasableSkin(sk))
				    {
				        pSkinData[playerid][pCurSkin] = sk;
				        break;
				    }
				}
				if(pSkinData[playerid][pCurSkin] == -INVALID_SKIN)
				{
				    for(new sk = FIRST_SKIN; ; sk++)
					{
					    if(IsPurchasableSkin(sk))
				        {
				            pSkinData[playerid][pCurSkin] = sk;
				            break;
				        }
					}
				}
		    }
		    SetPlayerSkin(playerid, pSkinData[playerid][pCurSkin]);
		}
	}
	else
	{
		if(pSkinData[playerid][pKeyTimer])
			KillTimer(pSkinData[playerid][pKeyTimer]);
	}
}

stock IsValidSkin(skin)
{
    if (	skin < 0 || skin == 3 || skin == 4 || skin == 5 || skin == 6 || skin == 8 || skin == 42 || skin == 65 || skin == 74 ||
			skin == 86 || skin == 119 || skin == 149 || skin == 208 || skin == 273 || skin == 274 || skin == 289 ||
			skin >= 300	)
			return false;

    return true;
}
