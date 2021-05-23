/* Feito por MrS Wax*/

#include <a_samp>

#pragma tabsize 0

#define amarelo 0xFFFF00AA
#define verde 0x33FF33AA
#define vermelho 0xFF0000AA
#define vermelhoescuro 0xAA3333AA
#define branco 0xFFFFFFAA
#define rosa 0xCCFF00FFAA
#define azul 0x057ABDAA
#define cinza 0xC0C0C0AA
#define yellow 0xFFFF00AA
#define laranja 0xFFA500AA
#define MAX_DISTANCE 3.0
#define Groove 1
#define Ballas 2
new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new ball;
new team[MAX_PLAYERS];
new golsgroove;
new golsballas;
new seconds;
new roundend;
new Float:MaxDistance = 0.0;
forward NewGame();
forward OnPlayerKickBall(playerid);
forward OnPlayerSuperKickBall(playerid);
forward BallTimer();
forward ScoreUpdate();
forward TimerPlacar();
forward RoundRestart();
forward RoundStart();

new Float:RandomGrooveSpawns[6][3] = {
{1515.5165,-2534.3459,13.5469},
{1514.8876,-2545.4417,13.5469},
{1501.5033,-2544.7197,13.5469},
{1501.6718,-2534.1772,13.5469},
{1502.2603,-2522.9031,13.5469},
{1514.5271,-2523.1055,13.5469}
};

new Float:RandomBallasSpawns[5][3] = {
{1470.3724,-2541.6189,13.5469},
{1470.3053,-2534.1667,13.5469},
{1470.0365,-2523.6919,13.5469},
{1481.7841,-2523.8152,13.5469},
{1481.5870,-2533.9114,13.5469}
};

enum PLAYER_INFOS
{
	Float:Pos[3]
};


enum BALL_INFOS
{
	Float:BallPos[3]
};

new
	PlayerInfo[MAX_PLAYERS][PLAYER_INFOS],
	BallInfo[BALL_INFOS]
;

main()

{

	print("\n----------------------------------");

	print("  Soccer Mania v1.0 por Waxhunter");

	print("----------------------------------\n");

}

public OnGameModeInit()
{
	MaxDistance = MAX_DISTANCE;
    SetTimer("ScoreUpdate", 2000, 1);
    SetTimer("TimerPlacar", 1000, 1);
    SetTimer("BallTimer", 100, 1);
    SetGameModeText("Soccer Mania v1.0");
	SendRconCommand("mapname Estadio de Futebol");
	UsePlayerPedAnims();
	SetWorldTime(20);
    CreateObject(3452, 1477.169434, -2567.308838, 15.696301, 0.0000, 0.0000, 0.0000);
	CreateObject(3452, 1506.579346, -2567.292480, 15.696295, 0.0000, 0.0000, 0.0000);
	CreateObject(3453, 1447.143555, -2561.840088, 15.721302, 0.0000, 0.0000, 270.0000);
	CreateObject(3453, 1446.185547, -2511.935303, 15.696295, 0.0000, 0.0000, 180.0000);
	CreateObject(3452, 1475.438843, -2505.531006, 15.696293, 0.0000, 0.0000, 180.0000);
	CreateObject(3452, 1440.719360, -2532.716309, 15.721292, 0.0000, 0.0000, 270.0000);
	CreateObject(987, 1467.328125, -2552.704834, 12.546876, 0.0000, 0.0000, 180.0000);
	CreateObject(987, 1455.643188, -2552.603516, 12.546875, 0.0000, 0.0000, 90.0000);
	CreateObject(987, 1455.706787, -2540.543457, 12.546875, 0.0000, 0.0000, 90.0000);
	CreateObject(987, 1455.799438, -2528.640381, 12.546875, 0.0000, 0.0000, 90.0000);
	CreateObject(987, 1455.822876, -2516.812500, 12.546875, 0.0000, 0.0000, 0.0000);
	CreateObject(987, 1467.811157, -2516.964844, 12.546875, 0.0000, 0.0000, 0.0000);
	CreateObject(987, 1479.176025, -2552.736816, 12.546875, 0.0000, 0.0000, 180.0001);
	CreateObject(987, 1491.039795, -2552.910889, 12.546875, 0.0000, 0.0000, 180.0001);
	CreateObject(987, 1502.971558, -2552.969482, 12.521876, 0.0000, 0.0000, 180.0000);
	CreateObject(987, 1514.828125, -2553.182861, 12.421877, 0.0000, 0.0000, 180.0000);
	CreateObject(987, 1526.845093, -2553.128174, 12.546875, 0.0000, 0.0000, 180.8595);
	CreateObject(987, 1479.637207, -2516.803955, 12.546875, 0.0000, 0.0000, 0.0000);
	CreateObject(987, 1526.974609, -2541.163330, 12.621874, 0.0000, 0.0000, 270.0000);
	CreateObject(987, 1527.174072, -2529.317139, 12.546875, 0.0000, 0.0000, 270.0000);
	CreateObject(987, 1491.803345, -2517.107178, 12.546875, 0.0000, 0.0000, 0.0000);
	CreateObject(987, 1503.776978, -2517.253174, 12.546875, 0.0000, 0.0000, 0.0000);
	CreateObject(987, 1515.606812, -2517.277588, 12.546875, 0.0000, 0.0000, 0.0000);
	CreateObject(987, 1527.265991, -2517.502441, 12.546875, 0.0000, 0.0000, 270.0000);
	CreateObject(3453, 1532.901245, -2510.959717, 15.679092, 0.0000, 0.0000, 90.0001);
	CreateObject(3452, 1504.990845, -2505.482178, 15.679121, 0.0000, 0.0000, 180.0000);
	CreateObject(3453, 1533.802490, -2560.950684, 15.746294, 0.0000, 0.0000, 0.0001);
	CreateObject(3452, 1539.283936, -2537.321045, 15.671301, 0.0000, 0.0000, 90.0000);
	CreateObject(13651, 1521.101685, -2545.184326, 7.376526, 0.0000, 0.0000, 90.0000);
	CreateObject(13650, 1492.460571, -2538.615234, 24.467480, 0.0000, 0.0000, 0.0000);
	CreateObject(13630, 1543.783936, -2497.807861, 25.220282, 0.0000, 0.0000, 225.0000);
	CreateObject(13629, 1428.645996, -2572.653564, 25.212469, 0.0000, 0.0000, 213.7500);
	CreateObject(7617, 1553.341919, -2534.496094, 33.717697, 0.0000, 0.0000, 270.0000);
	CreateObject(13651, 1387.578735, -2545.715088, 7.251525, 0.0000, 0.0000, 90.0000);
	CreateObject(7617, 1422.631592, -2535.603027, 33.335579, 0.0000, 0.0000, 270.0000);
	CreateObject(7417, 1532.081177, -2349.349365, 33.294388, 0.0000, 0.0000, 270.0000);
	CreateObject(7983, 1605.212646, -2703.976807, 40.484272, 0.0000, 0.0000, 258.7500);
	CreateObject(3864, 1453.600586, -2554.198975, 18.643902, 0.0000, 0.0000, 225.0000);
	CreateObject(3864, 1453.733398, -2515.223877, 19.183945, 0.0000, 0.0000, 135.0000);
	CreateObject(3864, 1528.341553, -2554.914551, 18.643902, 0.0000, 0.0000, 303.7500);
	CreateObject(3864, 1529.040894, -2516.246826, 18.421442, 0.0000, 0.0000, 45.0000);
	CreateObject(3864, 1492.331543, -2514.349365, 19.113590, 0.0000, 0.0000, 90.0000);
	CreateObject(3864, 1492.149902, -2555.985352, 18.643902, 0.0000, 0.0000, 270.0000);
	CreateObject(16776, 1413.798340, -2480.655029, 21.655548, 0.0000, 0.0000, 22.5003);
	CreateObject(4008, 1396.047607, -2619.109619, 26.270334, 0.0000, 0.0000, 247.5000);
	CreateObject(4028, 1374.229004, -2524.493164, 26.029152, 0.0000, 0.0000, 270.0000);
	CreateObject(4113, 1465.747559, -2658.551758, 37.276859, 0.0000, 0.0000, 0.0000);
	CreateObject(4550, 1405.104980, -2700.144287, -42.123199, 0.0000, 0.0000, 0.0000);
	CreateObject(4564, 1368.340454, -2432.100830, 24.592413, 0.0000, 0.0000, 315.0000);
	CreateObject(4603, 1628.254395, -2542.465332, 26.401016, 0.0000, 0.0000, 90.0000);
	CreateObject(4681, 1295.980835, -2569.091797, -0.400314, 0.0000, 0.0000, 0.0000);
	CreateObject(5767, 1692.209717, -2449.231445, 55.169113, 0.0000, 0.0000, 326.2500);
	ball = CreateObject(1598, 1492.003418, -2535.410156, 12.851875, 0.0000, 0.0000, 0.0000);
	CreateObject(7617, 1463.395142, -2533.922852, 7.659539, 180.3776, 0.0000, 270.0000);
	CreateObject(7617, 1520.683960, -2535.483154, 7.634527, 179.5182, 0.0000, 269.1406);
	AddPlayerClass(105,0.0,0.0,0.0,0,0,0,0,0,0,0);
	AddPlayerClass(106,0.0,0.0,0.0,0,0,0,0,0,0,0);
	AddPlayerClass(107,0.0,0.0,0.0,0,0,0,0,0,0,0);
	AddPlayerClass(102,0.0,0.0,0.0,0,0,0,0,0,0,0);
	AddPlayerClass(103,0.0,0.0,0.0,0,0,0,0,0,0,0);
	AddPlayerClass(104,0.0,0.0,0.0,0,0,0,0,0,0,0);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(classid == 0)
	{
	SetPlayerPos(playerid,1601.0653,-2507.8120,79.0416);
	SetPlayerFacingAngle(playerid, 285);
	PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
	SetPlayerCameraPos(playerid,1606.1522,-2506.6602,84.0416);
	SetPlayerCameraLookAt(playerid,1601.0653,-2507.8120,79.0416);
	GameTextForPlayer(playerid, "~g~Groove Street", 2000, 5);
	SetPlayerColor(playerid,verde);
	team[playerid] = Groove;
	}
	if(classid == 1)
	{
	SetPlayerPos(playerid,1601.0653,-2507.8120,79.0416);
	SetPlayerFacingAngle(playerid, 285);
	PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
	SetPlayerCameraPos(playerid,1606.1522,-2506.6602,84.0416);
	SetPlayerCameraLookAt(playerid,1601.0653,-2507.8120,79.0416);
	GameTextForPlayer(playerid, "~g~Groove Street", 2000, 5);
	SetPlayerColor(playerid,verde);
	team[playerid] = Groove;
	}
	if(classid == 2)
	{
	SetPlayerPos(playerid,1601.0653,-2507.8120,79.0416);
	SetPlayerFacingAngle(playerid, 285);
	PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
	SetPlayerCameraPos(playerid,1606.1522,-2506.6602,84.0416);
	SetPlayerCameraLookAt(playerid,1601.0653,-2507.8120,79.0416);
	GameTextForPlayer(playerid, "~g~Groove Street", 2000, 5);
	SetPlayerColor(playerid,verde);
	team[playerid] = Groove;
	}
	if(classid == 3)
	{
	SetPlayerPos(playerid,1601.0653,-2507.8120,79.0416);
	SetPlayerFacingAngle(playerid, 285);
	PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
	SetPlayerCameraPos(playerid,1606.1522,-2506.6602,84.0416);
	SetPlayerCameraLookAt(playerid,1601.0653,-2507.8120,79.0416);
	GameTextForPlayer(playerid, "~p~Ballas", 2000, 5);
	SetPlayerColor(playerid,rosa);
	team[playerid] = Ballas;
	}
	if(classid == 4)
	{
	SetPlayerPos(playerid,1601.0653,-2507.8120,79.0416);
	SetPlayerFacingAngle(playerid, 285);
	PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
	SetPlayerCameraPos(playerid,1606.1522,-2506.6602,84.0416);
	SetPlayerCameraLookAt(playerid,1601.0653,-2507.8120,79.0416);
	GameTextForPlayer(playerid, "~p~Ballas", 2000, 5);
	SetPlayerColor(playerid,rosa);
	team[playerid] = Ballas;
	}
	if(classid == 5)
	{
	SetPlayerPos(playerid,1601.0653,-2507.8120,79.0416);
	SetPlayerFacingAngle(playerid, 285);
	PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
	SetPlayerCameraPos(playerid,1606.1522,-2506.6602,84.0416);
	SetPlayerCameraLookAt(playerid,1601.0653,-2507.8120,79.0416);
	GameTextForPlayer(playerid, "~p~Ballas", 2000, 5);
	SetPlayerColor(playerid,rosa);
	team[playerid] = Ballas;
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
    new string[256];
	new plname[MAX_PLAYER_NAME];
	SendClientMessage(playerid, verde, "Bem Vindo ao SoccerMania!");
	SendClientMessage(playerid, azul, "GM de Futebol");
	SendClientMessage(playerid, vermelho, "Para ver os créditos, digite /creditos");
	SendClientMessage(playerid, branco, "Para aprender a jogar, digita /ajuda");
	SendClientMessage(playerid, amarelo, "Seja bem vindo!");
	GetPlayerName(playerid,plname,sizeof(plname));
	format(string,sizeof(string),"%s entrou no server!!!",plname);
	SendClientMessageToAll(cinza,string);
	return 1;
}
public OnPlayerSpawn(playerid)
{
	if(team[playerid] == Groove)
	{
	new rand = random(sizeof(RandomGrooveSpawns));
	SetPlayerPos(playerid, RandomGrooveSpawns[rand][0], RandomGrooveSpawns[rand][1], RandomGrooveSpawns[rand][2]);
	SetPlayerFacingAngle(playerid, 90);
	}
	if(team[playerid] == Ballas)
	{
	new rand = random(sizeof(RandomBallasSpawns));
	SetPlayerPos(playerid, RandomBallasSpawns[rand][0], RandomBallasSpawns[rand][1], RandomBallasSpawns[rand][2]);
	SetPlayerFacingAngle(playerid, 270);
	}
	Narracao("[NARRAÇÃO] O jogo foi recomeçado pois um novo jogador está em campo!");
	RoundRestart();
	PlayerPlaySound(playerid,1184,1434.5226,-839.0411,92.0761);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new pName[MAX_PLAYER_NAME];
    new string[256];
    switch(reason)
    {
        case 0: format(string, sizeof(string), "%s saiu do server.(Crashou)", pName);
        case 1: format(string, sizeof(string), "%s saiu do server.(Saiu)", pName);
        case 2: format(string, sizeof(string), "%s saiu do server.(Kickado/Banido)", pName);
    }
    SendClientMessageToAll(cinza, string);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
if(strcmp(cmdtext, "/ajuda", true) == 0)
	{
 	SendClientMessage(playerid, branco, "Soccer Mania:");
 	SendClientMessage(playerid, branco, "Para jogar no soccer mania, é muito simples.");
 	SendClientMessage(playerid, branco, "Chegue perto da bola e fique pressionando F para conduzi-la e");
 	SendClientMessage(playerid, branco, "pressione MOUSE1 para chutar. Para roubar a bola de um inimigo use o mesmo esquema.");
	return 1;
	}
if(strcmp(cmdtext, "/creditos", true) == 0)
	{
	SendClientMessage(playerid, branco, "Créditos Soccermania:");
	SendClientMessage(playerid, branco, "Feito por [MrS]Wax");
	SendClientMessage(playerid, branco, "Agradecimentos ao MrS clan");
	return 1;
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(roundend == 1)
	{
	return 1;
	}
	GetObjectPos(ball, BallInfo[BallPos][0], BallInfo[BallPos][1], BallInfo[BallPos][2]);
	GetPlayerPos(playerid, PlayerInfo[playerid][Pos][0], PlayerInfo[playerid][Pos][1], PlayerInfo[playerid][Pos][2]);
	if(newkeys & KEY_SECONDARY_ATTACK && Distance(PlayerInfo[playerid][Pos],BallInfo[BallPos]) < MaxDistance)
	{
	OnPlayerKickBall(playerid);
	}
	if(newkeys & KEY_FIRE && Distance(PlayerInfo[playerid][Pos],BallInfo[BallPos]) <= MaxDistance)
	{
	OnPlayerSuperKickBall(playerid);
	ApplyAnimation(playerid,"FIGHT_D","FightD_1",4.1,0,1,1,0,0);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	if (IsPlayerConnected(i))
	{
	PlayerPlaySound(i,1130,PlayerInfo[playerid][Pos][0], PlayerInfo[playerid][Pos][1], PlayerInfo[playerid][Pos][2]);
	}
	}
	}
	return 1;
}

stock Float:Distance(Float:vector1[], Float:vector2[])
{
	new Float:dX = vector1[0] - vector2[0],
		Float:dY = vector1[1] - vector2[1],
		Float:dZ = vector1[2] - vector2[2];

	return (dX*dX + dY*dY + dZ*dZ);
}

stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{

    new Float:a;

    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);

    if (GetPlayerVehicleID(playerid)) {
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }

    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}

public OnPlayerKickBall(playerid)
{
	new Float:px, Float:py;
	new nomechutador[MAX_PLAYER_NAME];
	GetPlayerName(playerid, nomechutador, sizeof(nomechutador));
	GetXYInFrontOfPlayer(playerid, px, py, 6.0);
	MoveObject(ball, px, py, 12.851875, 6.0);
}

public OnPlayerSuperKickBall(playerid)
{
	new Float:px, Float:py;
	new kickstring[256];
	new nomechutador[MAX_PLAYER_NAME];
	GetPlayerName(playerid, nomechutador, sizeof(nomechutador));
	GetXYInFrontOfPlayer(playerid, px, py, 16.0);
	MoveObject(ball, px, py, 12.851875, 22.5);
	format(kickstring,sizeof(kickstring),"[NARRAÇÃO] %s chutou a bola!", nomechutador);
	Narracao(kickstring);
}
	
stock Narracao(msg[])
{
SendClientMessageToAll(azul, msg);
}
	
public BallTimer()
{
new Float:x, Float:y, Float:z;
GetObjectPos(ball, x, y, z);
	if(x >= 1456.3499 && y <= -2517.3630 && x <= 1526.4229 && y >= -2552.5833)
	{
		if(x >= 1462.2386 && y <= -2529.6934 && x <= 1464.5449 && y >= -2537.8811)
			{
			Narracao("[NARRAÇÃO] Gol para a equipe da Groove Street!");
			golsgroove++;
			SetObjectPos(ball, 1492.003418, -2535.410156, 12.851875);
			StopObject(ball);
			GameTextForAll("~w~Gol!!!",2500,6);
			SetTimer("RoundRestart",3000,0);
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
			if (IsPlayerConnected(i))
			{
			PlayerPlaySound(i,1097,1434.5226,-839.0411,92.0761);
			}
			}
			roundend = 1;
			return 1;
			}
		if(x >= 1519.5790 && y <= -2531.2393 && x <= 1521.8778 && y >= -2539.4614)
			{
			Narracao("[NARRAÇÃO] Gol para a equipe dos Ballas!");
			golsballas++;
			SetObjectPos(ball, 1492.003418, -2535.410156, 12.851875);
			StopObject(ball);
			GameTextForAll("~w~Gol!!!",2500,6);
			SetTimer("RoundRestart",3000,0);
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
			if (IsPlayerConnected(i))
			{
			PlayerPlaySound(i,1097,1434.5226,-839.0411,92.0761);
			}
			}
			roundend = 1;
			return 1;
			}
		else
		{
		return 1;
		}
	}
	else
	{
	Narracao("[NARRAÇÃO] A bola foi para fora! Por isso ela foi setada para o meio do campo!");
	SetObjectPos(ball,1492.003418, -2535.410156, 12.851875);
	StopObject(ball);
	return 1;
	}
}

public ScoreUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			if(team[i] == Groove)
			{
			SetPlayerScore(i, golsgroove);
			}
			if(team[i] == Ballas)
			{
			SetPlayerScore(i, golsballas);
			}
		}
	}
}

public TimerPlacar()
{
TextDrawDestroy(Textdraw0);
TextDrawDestroy(Textdraw1);
TextDrawDestroy(Textdraw2);
new stringgroove[256];
new stringballas[256];
format(stringgroove,sizeof(stringgroove),"~g~Groove: %d",golsgroove);
format(stringballas,sizeof(stringballas),"~p~Ballas: %d",golsballas);
Textdraw0 = TextDrawCreate(504.000000,369.000000,"Placar");
Textdraw1 = TextDrawCreate(504.000000,394.000000,stringgroove);
Textdraw2 = TextDrawCreate(504.000000,408.000000,stringballas);
TextDrawUseBox(Textdraw0,1);
TextDrawBoxColor(Textdraw0,0x00000099);
TextDrawTextSize(Textdraw0,620.000000,20.000000);
TextDrawUseBox(Textdraw1,1);
TextDrawBoxColor(Textdraw1,0x00000099);
TextDrawTextSize(Textdraw1,620.000000,0.000000);
TextDrawUseBox(Textdraw2,1);
TextDrawBoxColor(Textdraw2,0x00000099);
TextDrawTextSize(Textdraw2,620.000000,0.000000);
TextDrawAlignment(Textdraw0,0);
TextDrawAlignment(Textdraw1,0);
TextDrawAlignment(Textdraw2,0);
TextDrawBackgroundColor(Textdraw0,0x000000ff);
TextDrawBackgroundColor(Textdraw1,0x000000ff);
TextDrawBackgroundColor(Textdraw2,0x000000ff);
TextDrawFont(Textdraw0,2);
TextDrawLetterSize(Textdraw0,0.399999,2.400000);
TextDrawFont(Textdraw1,2);
TextDrawLetterSize(Textdraw1,0.299999,1.200000);
TextDrawFont(Textdraw2,2);
TextDrawLetterSize(Textdraw2,0.299999,1.200000);
TextDrawColor(Textdraw0,0xffffffff);
TextDrawColor(Textdraw1,0xffffffff);
TextDrawColor(Textdraw2,0xffffffff);
TextDrawSetOutline(Textdraw0,1);
TextDrawSetOutline(Textdraw1,1);
TextDrawSetOutline(Textdraw2,1);
TextDrawSetProportional(Textdraw0,1);
TextDrawSetProportional(Textdraw1,1);
TextDrawSetProportional(Textdraw2,1);
TextDrawSetShadow(Textdraw0,1);
TextDrawSetShadow(Textdraw1,1);
TextDrawSetShadow(Textdraw2,1);
TextDrawShowForAll(Textdraw0);
TextDrawShowForAll(Textdraw1);
TextDrawShowForAll(Textdraw2);
}

public RoundRestart()
{
roundend = 0;
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
	if(team[i] == Groove)
	{
	new rand = random(sizeof(RandomGrooveSpawns));
	SetPlayerPos(i, RandomGrooveSpawns[rand][0], RandomGrooveSpawns[rand][1], RandomGrooveSpawns[rand][2]);
	SetPlayerFacingAngle(i, 90);
	SetCameraBehindPlayer(i);
	}
	if(team[i] == Ballas)
	{
	new rand = random(sizeof(RandomBallasSpawns));
	SetPlayerPos(i, RandomBallasSpawns[rand][0], RandomBallasSpawns[rand][1], RandomBallasSpawns[rand][2]);
	SetPlayerFacingAngle(i, 270);
	SetCameraBehindPlayer(i);
	}
if(golsgroove >= 10)
{
SetTimer("NewGame",1000,0);
return 1;
}
if(golsballas >= 10)
{
SetTimer("NewGame",1000,0);
return 1;
}
TogglePlayerControllable(i, false);
}
}
SetTimer("RoundStart",1000,0);
return 1;
}
public RoundStart()
{
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
PlayerPlaySound(i,1184,1434.5226,-839.0411,92.0761);
}
}
new string[256];
if(seconds == 0)
{
seconds = 3;
format(string, sizeof(string), "~y~%d", seconds);
GameTextForAll(string, 1200, 5);
SetTimer("RoundStart", 1000, 0);
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
PlayerPlaySound(i,1056,1434.5226,-839.0411,92.0761);
}
}
return 1;
}
if(seconds == 3)
{
seconds = 2;
format(string, sizeof(string), "~y~%d", seconds);
GameTextForAll(string, 1200, 5);
SetTimer("RoundStart", 1000, 0);
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
PlayerPlaySound(i,1056,1434.5226,-839.0411,92.0761);
}
}
return 1;
}
if(seconds == 2)
{
seconds = 1;
format(string, sizeof(string), "~y~%d", seconds);
GameTextForAll(string, 1200, 5);
SetTimer("RoundStart", 1000, 0);
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
PlayerPlaySound(i,1056,1434.5226,-839.0411,92.0761);
}
}
return 1;
}
if(seconds == 1)
{
format(string, sizeof(string), "~y~%d", seconds);
GameTextForAll(string, 1200, 5);
SetTimer("RoundStart", 1000, 0);
seconds = 995;
return 1;
}
if(seconds == 995)
{
format(string, sizeof(string), "~y~GOGOGO!", seconds);
GameTextForAll(string, 1200, 5);
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
PlayerPlaySound(i,1057,1434.5226,-839.0411,92.0761);
}
}
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
TogglePlayerControllable(i, true);
}
}
seconds = 0;
}
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
PlayerPlaySound(i,1142,1434.5226,-839.0411,92.0761);
}
}
return 1;
}

public NewGame()
{
if(golsgroove > golsballas)
{
GameTextForAll("~g~Groove Street ~w~Venceu!!!", 3000, 0);
}
if(golsballas > golsgroove)
{
GameTextForAll("~p~Ballas ~w~Venceu!!!", 3000, 0);
}
if(golsgroove == golsballas)
{
GameTextForAll("~w~Empate!", 3000, 0);
}
golsgroove = 0;
golsballas = 0;
for(new i = 0; i < MAX_PLAYERS; i++)
{
if (IsPlayerConnected(i))
{
TogglePlayerControllable(i,false);
}
}
SetTimer("RoundStart",2500,0);
return 1;
}

public OnGameModeExit()
{
	return 1;
}
public OnPlayerRequestSpawn(playerid)
{
	return 1;
}
public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	return 1;
}
public OnPlayerInfoChange(playerid)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}
