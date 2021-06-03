//////////////////////////////////////////////////////////////////////////////////
// The End Of The Line, based on Last GTA San Andreas' Mission      			//
// Developed by Virtual Life Team                                               //
//////////////////////////////////////////////////////////////////////////////////


#include <a_samp>


#define MAX_SLOTS 					30

#define COLOR_GOLD      			0xF7D931AA
#define COLOR_BROWN                 0x8B4513AA
#define COLOR_LIGHT_BROWN           0x81694CAA
#define COLOR_BLUE            		0xA9CDE6AA
#define COLOR_BLACK                 0x050000AA
#define COLOR_TURQUOISE       		0x00CED1AA
#define COLOR_GRAD	 		  		0xB4B5B7AA
#define COLOR_AQUA_GREEN            0x20B2AAAA
#define COLOR_ORANGE 				0xFF9900AA
#define COLOR_PURPLE 				0x800080AA
#define COLOR_BLUE_PLUS          	0x4169FFAA
#define COLOR_LIGHT_GREEN      		0x90FAACAA
#define COLOR_DARK_GREEN            0x336600AA
#define COLOR_PALHA            		0xF0E68CAA
#define COLOR_PINK             		0xFF00FFAA
#define COLOR_CLEAR_PINK            0xFF91ECAA
#define COLOR_GREEN 				0x00FF00AA
#define COLOR_RED              		0xAA3333AA
#define COLOR_LIGHT_RED        		0xFF0000AA
#define COLOR_YELLOW           		0xFFFF00AA
#define COLOR_WHITE            		0xFFFFFFAA
#define COLOR_GRAY             		0xE1E2E7AA
#define COLOR_LIGHT_YELLOW          0xFFFFB3AA
#define COLOR_GROVES 				0x33AA33AA
#define COLOR_VAGOS 				0xFFFF00AA
#define COLOR_BALLAS 				0x9400D3AA
#define COLOR_AZTECAS 				0x00EEEEAA
#define COLOR_RIFAS                 0x6495EDAA
#define COLOR_POLICIA               0x00C7FFAA

//TEAMS
enum TeamInfo
{
	tName[32],
	tScore,
	tWeapon1,
	tAmmo1,
	tWeapon2,
	tAmmo2,
	tWeapon3,
	tAmmo3,
	tColor,
	Float:tCamPosX,
	Float:tCamPosY,
	Float:tCamPosZ,
	Float:tCamLookX,
	Float:tCamLookY,
	Float:tCamLookZ,
	Float:tCamAng,
	Float:tPosX,
	Float:tPosY,
	Float:tPosZ
}

new Teams[][TeamInfo] = {
	{"Grove Street", 			0, 	24,	200, 32, 900, 30, 600, COLOR_GROVES,  2543.5681, -1306.1575, 1025.0703, 2543.1694, -1302.4550, 1025.0703, 177.5771, 2540.7493, -1319.2189, 1031.4219},
	{"Vagos", 		 			0, 	24, 400, 32, 900, 30, 600, COLOR_VAGOS,   2557.5132, -1300.9229, 1044.1250, 2557.5054, -1295.8612, 1044.1250, 173.6253, 2548.4497, -1290.9288, 1044.1250},
	{"Ballas", 					0, 	24, 200, 30, 600, 26, 200, COLOR_BALLAS,  2575.7498, -1286.5709, 1065.3672, 2576.0339, -1281.4425, 1065.3672, 176.6885, 2551.1794, -1294.6721, 1060.9844},
	{"Varrios Los Aztecas", 	0, 	23, 400, 32, 900, 27, 200, COLOR_AZTECAS, 2570.4160, -1288.9082, 1037.7805, 2566.8816, -1288.5444, 1037.7734, 269.1929, 2570.5115, -1286.0521, 1037.7734},
	{"Rifas", 					0, 	22, 400, 29, 500, 26, 200, COLOR_RIFAS,   2547.3398, -1299.5156, 1054.6406, 2547.3616, -1293.4711, 1054.6406, 177.3386, 2563.6436, -1294.3796, 1054.6406},
	{"Policia",                 0,  24, 200, 29, 500, 31, 600, COLOR_POLICIA, 2552.4041, -1281.1863, 1031.4219, 2558.5381, -1281.4590, 1031.4219, 101.2914, 2555.1091, -1282.9255, 1031.4219}
};

//PLAYERS
enum PlayerData
{
	pPassword[128],
	pKills,
	pDeaths,
	pMoney
}

new pData[MAX_SLOTS][PlayerData];
//---
new Logado[MAX_SLOTS] = 0;
new Text:PlayerText[MAX_SLOTS];

forward UpdatePlayers();

main()
{
	printf("\n\n-------------------------------------------------------------\n-------------------- The End Of The Line --------------------\n-------------------------------------------------------------\n\n");
}

stock PlayerFile(playerid)
{
	new path[128];
	format(path, sizeof path, "%s.pl", PlayerName(playerid));
	return path;
}

public OnGameModeInit()
{
	DisableInteriorEnterExits();
	AllowInteriorWeapons(1);
	SetGameModeText("The End Of The Line");
	SendRconCommand("mapname Crack's Citadel");
	
	AddStaticVehicle(601, 2562.5103, -1283.7488, 1031.4219, 180.2288, 4, 4);
	
	LinkVehicleToInterior(0, 2);

	//GROVE STREET
    AddPlayerClass(0, Teams[0][tPosX], Teams[0][tPosY], Teams[0][tPosZ], 0.0, Teams[0][tWeapon1], Teams[0][tAmmo1], Teams[0][tWeapon2], Teams[0][tAmmo2], Teams[0][tWeapon3], Teams[0][tAmmo3]);
    AddPlayerClass(270, Teams[0][tPosX], Teams[0][tPosY], Teams[0][tPosZ], 0.0, Teams[0][tWeapon1], Teams[0][tAmmo1], Teams[0][tWeapon2], Teams[0][tAmmo2], Teams[0][tWeapon3], Teams[0][tAmmo3]);
    AddPlayerClass(105, Teams[0][tPosX], Teams[0][tPosY], Teams[0][tPosZ], 0.0, Teams[0][tWeapon1], Teams[0][tAmmo1], Teams[0][tWeapon2], Teams[0][tAmmo2], Teams[0][tWeapon3], Teams[0][tAmmo3]);
    AddPlayerClass(106, Teams[0][tPosX], Teams[0][tPosY], Teams[0][tPosZ], 0.0, Teams[0][tWeapon1], Teams[0][tAmmo1], Teams[0][tWeapon2], Teams[0][tAmmo2], Teams[0][tWeapon3], Teams[0][tAmmo3]);
    AddPlayerClass(107, Teams[0][tPosX], Teams[0][tPosY], Teams[0][tPosZ], 0.0, Teams[0][tWeapon1], Teams[0][tAmmo1], Teams[0][tWeapon2], Teams[0][tAmmo2], Teams[0][tWeapon3], Teams[0][tAmmo3]);

	//VAGOS
	AddPlayerClass(108, Teams[1][tPosX], Teams[1][tPosY], Teams[1][tPosZ], 0.0, Teams[1][tWeapon1], Teams[1][tAmmo1], Teams[1][tWeapon2], Teams[1][tAmmo2], Teams[1][tWeapon3], Teams[1][tAmmo3]);
    AddPlayerClass(109, Teams[1][tPosX], Teams[1][tPosY], Teams[1][tPosZ], 0.0, Teams[1][tWeapon1], Teams[1][tAmmo1], Teams[1][tWeapon2], Teams[1][tAmmo2], Teams[1][tWeapon3], Teams[1][tAmmo3]);
    AddPlayerClass(110, Teams[1][tPosX], Teams[1][tPosY], Teams[1][tPosZ], 0.0, Teams[1][tWeapon1], Teams[1][tAmmo1], Teams[1][tWeapon2], Teams[1][tAmmo2], Teams[1][tWeapon3], Teams[1][tAmmo3]);
    
    //BALLAS
    AddPlayerClass(102, Teams[2][tPosX], Teams[2][tPosY], Teams[2][tPosZ], 0.0, Teams[2][tWeapon1], Teams[2][tAmmo1], Teams[2][tWeapon2], Teams[2][tAmmo2], Teams[2][tWeapon3], Teams[2][tAmmo3]);
    AddPlayerClass(103, Teams[2][tPosX], Teams[2][tPosY], Teams[2][tPosZ], 0.0, Teams[2][tWeapon1], Teams[2][tAmmo1], Teams[2][tWeapon2], Teams[2][tAmmo2], Teams[2][tWeapon3], Teams[2][tAmmo3]);
    AddPlayerClass(104, Teams[2][tPosX], Teams[2][tPosY], Teams[2][tPosZ], 0.0, Teams[2][tWeapon1], Teams[2][tAmmo1], Teams[2][tWeapon2], Teams[2][tAmmo2], Teams[2][tWeapon3], Teams[2][tAmmo3]);
    AddPlayerClass(271, Teams[2][tPosX], Teams[2][tPosY], Teams[2][tPosZ], 0.0, Teams[2][tWeapon1], Teams[2][tAmmo1], Teams[2][tWeapon2], Teams[2][tAmmo2], Teams[2][tWeapon3], Teams[2][tAmmo3]);
    AddPlayerClass(269, Teams[2][tPosX], Teams[2][tPosY], Teams[2][tPosZ], 0.0, Teams[2][tWeapon1], Teams[2][tAmmo1], Teams[2][tWeapon2], Teams[2][tAmmo2], Teams[2][tWeapon3], Teams[2][tAmmo3]);

	//VARRIOS LOS AZTECAS
	AddPlayerClass(114, Teams[3][tPosX], Teams[3][tPosY], Teams[3][tPosZ], 0.0, Teams[3][tWeapon1], Teams[3][tAmmo1], Teams[3][tWeapon2], Teams[3][tAmmo2], Teams[3][tWeapon3], Teams[3][tAmmo3]);
	AddPlayerClass(115, Teams[3][tPosX], Teams[3][tPosY], Teams[3][tPosZ], 0.0, Teams[3][tWeapon1], Teams[3][tAmmo1], Teams[3][tWeapon2], Teams[3][tAmmo2], Teams[3][tWeapon3], Teams[3][tAmmo3]);
	AddPlayerClass(116, Teams[3][tPosX], Teams[3][tPosY], Teams[3][tPosZ], 0.0, Teams[3][tWeapon1], Teams[3][tAmmo1], Teams[3][tWeapon2], Teams[3][tAmmo2], Teams[3][tWeapon3], Teams[3][tAmmo3]);
	AddPlayerClass(292, Teams[3][tPosX], Teams[3][tPosY], Teams[3][tPosZ], 0.0, Teams[3][tWeapon1], Teams[3][tAmmo1], Teams[3][tWeapon2], Teams[3][tAmmo2], Teams[3][tWeapon3], Teams[3][tAmmo3]);
	
	//RIFAS
	AddPlayerClass(173, Teams[4][tPosX], Teams[4][tPosY], Teams[4][tPosZ], 0.0, Teams[4][tWeapon1], Teams[4][tAmmo1], Teams[4][tWeapon2], Teams[4][tAmmo2], Teams[4][tWeapon3], Teams[4][tAmmo3]);
	AddPlayerClass(174, Teams[4][tPosX], Teams[4][tPosY], Teams[4][tPosZ], 0.0, Teams[4][tWeapon1], Teams[4][tAmmo1], Teams[4][tWeapon2], Teams[4][tAmmo2], Teams[4][tWeapon3], Teams[4][tAmmo3]);
	AddPlayerClass(175, Teams[4][tPosX], Teams[4][tPosY], Teams[4][tPosZ], 0.0, Teams[4][tWeapon1], Teams[4][tAmmo1], Teams[4][tWeapon2], Teams[4][tAmmo2], Teams[4][tWeapon3], Teams[4][tAmmo3]);
	
	//POLICIA
	AddPlayerClass(280, Teams[5][tPosX], Teams[5][tPosY], Teams[5][tPosZ], 0.0, Teams[5][tWeapon1], Teams[5][tAmmo1], Teams[5][tWeapon2], Teams[5][tAmmo2], Teams[5][tWeapon3], Teams[5][tAmmo3]);
    AddPlayerClass(284, Teams[5][tPosX], Teams[5][tPosY], Teams[5][tPosZ], 0.0, Teams[5][tWeapon1], Teams[5][tAmmo1], Teams[5][tWeapon2], Teams[5][tAmmo2], Teams[5][tWeapon3], Teams[5][tAmmo3]);
    AddPlayerClass(285, Teams[5][tPosX], Teams[5][tPosY], Teams[5][tPosZ], 0.0, Teams[5][tWeapon1], Teams[5][tAmmo1], Teams[5][tWeapon2], Teams[5][tAmmo2], Teams[5][tWeapon3], Teams[5][tAmmo3]);
	
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    PlayerText[i] = TextDrawCreate(21, 125, " ");
		TextDrawAlignment(PlayerText[i], 0);
		TextDrawFont(PlayerText[i], 1);
		TextDrawLetterSize(PlayerText[i], 0.5 ,3);
		TextDrawSetProportional(PlayerText[i], 1);
	}
	
	SetTimer("UpdatePlayers", 1000, true);
}

public UpdatePlayers()
{
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    if(IsPlayerConnected(i) && Logado[i] != 0)
	    {
	    	GivePlayerMoney(i, -GetPlayerMoney(i) + pData[i][pMoney]);
	    	SetPlayerScore(i, pData[i][pKills]);
		}
	}
}

public OnGameModeExit()
{
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    TextDrawDestroy(PlayerText[i]);
	}
}

stock SendPlayerText(playerid, color, string[])
{
	TextDrawHideForPlayer(playerid, PlayerText[playerid]);
	TextDrawSetString(PlayerText[playerid], string);
	TextDrawColor(PlayerText[playerid], color);
	TextDrawShowForPlayer(playerid, PlayerText[playerid]);
}

stock RemovePlayerText(playerid)
{
    TextDrawSetString(PlayerText[playerid], " ");
	TextDrawHideForPlayer(playerid, PlayerText[playerid]);
	TextDrawColor(PlayerText[playerid], 0xFFFFFF00);
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	return name;
}

stock ClearPlayerChat(playerid, lines)
{
	for(new ln = 0; ln < lines; ln++)
	{
	    SendClientMessage(playerid, COLOR_WHITE, " ");
	}
}

public OnPlayerConnect(playerid)
{
	RemovePlayerText(playerid);
	Logado[playerid] = 0;
	SetPlayerColor(playerid, COLOR_WHITE);
	new msg[128];
	format(msg, sizeof msg, "%s entrou no servidor.", PlayerName(playerid));
	SendClientMessageToAll(COLOR_BLUE_PLUS, msg);
	ClearPlayerChat(playerid, 10);
	SendClientMessage(playerid, COLOR_WHITE,			"Bem Vindo ao The End Of The Line.");
	if(!fexist(PlayerFile(playerid)))
	{
		SendClientMessage(playerid, COLOR_BLUE,        	"Registre-se no jogo, use /registrar [senha]");
	}
	else
	{
	    SendClientMessage(playerid, COLOR_BLUE,        	"Logue-se no jogo, use /logar [senha]");
	}
}

public OnPlayerRequestSpawn(playerid)
{
	if(!Logado[playerid])
	{
	    if(fexist(PlayerFile(playerid)))
	    {
	    	SendClientMessage(playerid, COLOR_TURQUOISE, "Você deve autenticar-se para começar o jogo.");
	    	return 0;
		}
		SendClientMessage(playerid, COLOR_TURQUOISE, "Você decidiu não se registrar, seus dados não serão salvos.");
		Logado[playerid] = -1;
		pData[playerid][pMoney] = 0;
		pData[playerid][pKills] = 0;
		pData[playerid][pDeaths] = 0;
	}
	return 1;
}

stock SavePlayer(playerid)
{
	if(!IsPlayerConnected(playerid) || Logado[playerid] != 1) return ;
	new File:pfile = fopen(PlayerFile(playerid), io_write);
	new save[128];
	format(save, sizeof save, "%s %d %d %d", pData[playerid][pPassword], pData[playerid][pKills], pData[playerid][pDeaths], pData[playerid][pMoney]);
	fwrite(pfile, save);
	fclose(pfile);
	printf("Dados de %s salvos.", PlayerName(playerid));
}

stock LoadPlayer(playerid)
{
	if(!fexist(PlayerFile(playerid))) return ;
	new File:pfile = fopen(PlayerFile(playerid), io_read);
	new read[128], index;
	fread(pfile, read, sizeof read);
	pData[playerid][pPassword] = strtok(read, index);
	pData[playerid][pKills] = strval(strtok(read, index));
	pData[playerid][pDeaths] = strval(strtok(read, index));
	pData[playerid][pMoney] = strval(strtok(read, index));
	fclose(pfile);
	printf("Dados de %s carregados.", PlayerName(playerid));
}

stock GivePlayerMoneyEx(playerid, amount)
{
	pData[playerid][pMoney] += amount;
}

stock GetPlayerMoneyEx(playerid)
{
	return pData[playerid][pMoney];
}

stock ResetPlayerMoneyEx(playerid)
{
	pData[playerid][pMoney] = 0;
}

public OnPlayerDisconnect(playerid, reason)
{
	Logado[playerid] = 0;
    new msg[128];
    if(reason == 0)
    {
		format(msg, sizeof msg, "%s caiu do servidor.", PlayerName(playerid));
	}
	else if(reason == 1)
	{
	    format(msg, sizeof msg, "%s saiu do servidor.", PlayerName(playerid));
	}
	else
	{
	    format(msg, sizeof msg, "%s foi kickado/banido do servidor.", PlayerName(playerid));
	}
	SendClientMessageToAll(COLOR_BLUE_PLUS, msg);
}

public OnPlayerRequestClass(playerid, classid)
{
	RemovePlayerText(playerid);
	new team;
	if(classid < 5)
	{
	    team = 0;
	}
	else if(classid < 8)
	{
	    team = 1;
	}
	else if(classid < 13)
	{
	    team = 2;
	}
	else if(classid < 17)
	{
	    team = 3;
	}
	else if(classid < 20)
	{
	    team = 4;
	}
	else
	{
	    team = 5;
	}
	SetPlayerTeam(playerid, team);
	SetPlayerCameraPos(playerid, Teams[team][tCamPosX], Teams[team][tCamPosY], Teams[team][tCamPosZ]);
	SetPlayerCameraLookAt(playerid, Teams[team][tCamLookX], Teams[team][tCamLookY], Teams[team][tCamLookZ]);
	SetPlayerFacingAngle(playerid, Teams[team][tCamAng]);
	SendPlayerText(playerid, Teams[team][tColor], Teams[team][tName]);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid, 2);
	RemovePlayerText(playerid);
	new team = GetPlayerTeam(playerid);
	SetPlayerColor(playerid, Teams[team][tColor]);
	SetVehicleParamsForPlayer(0, playerid, 0, 1);
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new team = GetPlayerTeam(playerid);
	SetSpawnInfo(playerid, team, GetPlayerSkin(playerid), Teams[team][tPosX], Teams[team][tPosY], Teams[team][tPosZ], 0.0, Teams[team][tWeapon1], Teams[team][tAmmo1], Teams[team][tWeapon2], Teams[team][tAmmo2], Teams[team][tWeapon3], Teams[team][tAmmo3]);
	if(GetPlayerTeam(killerid) == GetPlayerTeam(playerid))
	{
	    SendClientMessage(killerid, COLOR_LIGHT_RED, "Você e sua equipe foram punidos pelo seu ato! Parabéns ¬¬'");
	    pData[killerid][pKills]--;
	    Teams[GetPlayerTeam(killerid)][tScore]--;
	    GivePlayerMoneyEx(killerid, -1000);
	}
	else
	{
		pData[killerid][pKills]++;
		if(pData[killerid][pKills] % 10 == 0 && pData[killerid][pKills] > 0)
		{
		    SetPlayerArmour(killerid, 100);
		    SendClientMessage(killerid, COLOR_LIGHT_YELLOW, "Continue assim... Você recebeu um colete por matar 10 jogadores.");
		}
		Teams[GetPlayerTeam(killerid)][tScore]++;
		GivePlayerMoneyEx(killerid, 1000 + GetPlayerMoneyEx(playerid));
		ResetPlayerMoneyEx(playerid);
	}
	pData[playerid][pDeaths]++;
	SendDeathMessage(killerid, playerid, reason);
}

