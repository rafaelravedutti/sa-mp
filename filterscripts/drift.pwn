#include <a_samp>

new Float:SavePos[MAX_PLAYERS][3];
new bool:Checked[MAX_PLAYERS] = false;
new DriftScore[MAX_PLAYERS] = 0;
new InDrift[MAX_PLAYERS] = 0;
new Text:DriftText[MAX_PLAYERS];

forward Drift();

stock operator%(Float:oper1, Float:oper2)
{
	return floatround(oper1, floatround_floor) % floatround(oper2, floatround_floor);
}
stock operator%(oper1, Float:oper2)
{
	return oper1 % floatround(oper2, floatround_floor);
}
stock operator%(Float:oper1, oper2)
{
	return floatround(oper1, floatround_floor) % oper2;
}

stock CreateDriftTextDraws()
{
	print("   Carregando TextDraw's de Drift, Aguarde...\n");
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
    	DriftText[i] = TextDrawCreate(21, 125, " ");
		TextDrawAlignment(DriftText[i], 0);
		TextDrawBackgroundColor(DriftText[i], 0x00FFFF99);
		TextDrawFont(DriftText[i], 1);
		TextDrawLetterSize(DriftText[i], 0.5 ,3);
		TextDrawColor(DriftText[i], 0x0000FF66);
		TextDrawSetProportional(DriftText[i], 1);
		TextDrawSetShadow(DriftText[i], 2);
	}
	print("   SUCESSO, TextDraws de Drift's carregados...\n\n");
}

stock Float:RadianToDegrees(Float:radnum)
{
	return radnum * 180 / 3.14;
}

stock Float:Positive(Float:num)
{
	return (num < 0) ? -num : num;
}

stock Float:floatpositivemax(Float:value1, Float:value2)
{
    return (Positive(value1) > Positive(value2)) ? value1 : value2;
}

stock Float:floatpositivemin(Float:value1, Float:value2)
{
	return (Positive(value1) < Positive(value2)) ? value1 : value2;
}


public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("   Drifting System\t");
	print("   Developed by Leroy and [BR]Rafael\t");
	print("--------------------------------------\n");
	CreateDriftTextDraws();
	SetTimer("Drift", 200, true);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	if(InDrift[playerid] == 1)
	{
		InDrift[playerid] = 0;
		DriftScore[playerid] = 0;
		TextDrawHideForPlayer(playerid, Text:DriftText[playerid]);
	}
}

public OnPlayerDisconnect(playerid)
{
	if(InDrift[playerid] == 1)
	{
	    InDrift[playerid] = 0;
	    DriftScore[playerid] = 0;
	    TextDrawHideForPlayer(playerid, Text:DriftText[playerid]);
	}
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp(cmdtext, "/entrardrift", true) == 0)
	{
	    SendClientMessage(playerid, 0x33FF44AA, "Você entrou no Drift...");
	    InDrift[playerid] = 1;
	    TextDrawShowForPlayer(playerid, Text:DriftText[playerid]);
	    return 1;
	}
	if(strcmp(cmdtext, "/sairdrift", true) == 0)
	{
	    SendClientMessage(playerid, 0x33FF44AA, "Você saiu do Drift...");
	    InDrift[playerid] = 0;
	    DriftScore[playerid] = 0;
	    TextDrawSetString(DriftText[playerid], " ");
	    TextDrawHideForPlayer(playerid, Text:DriftText[playerid]);
	    return 1;
	}
	return 0;
}

public Drift()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i) && GetPlayerState(i) == PLAYER_STATE_DRIVER && InDrift[i] == 1)
		{
			if(!Checked[i])
			{
			    new Float:offset;
			    GetVehiclePos(GetPlayerVehicleID(i), SavePos[i][0], SavePos[i][1], offset);
				GetVehicleZAngle(GetPlayerVehicleID(i), SavePos[i][2]);
				Checked[i] = true;
			} else {
			    new Float:X, Float:Y, Float:offset;
				GetVehiclePos(GetPlayerVehicleID(i), X, Y, offset);
				if(floatpower(X - SavePos[i][0], 2) + floatpower(Y - SavePos[i][1], 2) > 0.5)
				{
				    new Float:DriftAngle, Float:VehicleAngle;
					//HeadingAngle = atan2(X - SavePos[i][0], Y - SavePos[i][1]);
					GetVehicleZAngle(GetPlayerVehicleID(i), VehicleAngle);
                    DriftAngle = Positive(floatpositivemax(atan(SavePos[i][2]), atan(VehicleAngle)) - floatpositivemin(atan(SavePos[i][2]), atan(VehicleAngle)));
					DriftAngle %= floatpositivemin(atan(SavePos[i][2]), atan(VehicleAngle));
					if(DriftAngle > 1.0) DriftScore[i] += floatround(DriftAngle, floatround_floor);
					new string[256];
					format(string,sizeof(string),"Drift: %.3f~n~Score: %d", DriftAngle, DriftScore[i]);
					TextDrawSetString(Text:DriftText[i], string);
				}
				Checked[i] = false;
			}
		}
	}
}
