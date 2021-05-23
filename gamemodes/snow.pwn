#include <a_samp>
#include <a_cam>
#include <walk>

forward SnowTimer();

#define COLOR_GREY 			0xAFAFAFAA
#define COLOR_GREEN 		0x33AA33AA
#define COLOR_RED 			0xAA3333AA
#define COLOR_YELLOW	 	0xFFFF00AA
#define COLOR_PINK 			0xFF66FFAA
#define COLOR_BLUE 			0x0000BBAA
#define COLOR_LIGHTBLUE 	0x33CCFFAA
#define COLOR_DARKRED		0x660000AA
#define COLOR_ORANGE 		0xFF9900AA
#define COLOR_DARKBLUE 		0x244ACCFF
#define COLOR_PURPLE 		0x990099AA
#define COLOR_WHITE 		0xFFFFFFAA
#define COLOR_BLACK 		0x000000FF
// 477.1814,-0.7949,1003.0240 good jail place

main()
{
	print("Server");
	print("------");
	print("Loaded.");
}

new DiscoPick;
new Bomber;
new Bomber2;
new Bomber3;
new BombBusy;
new PlayerInCheckpoint = -1;

new
	Float:gLastX[MAX_PLAYERS],
	Float:gLastY[MAX_PLAYERS],
	Float:gLastZ[MAX_PLAYERS],
	Float:gCurX[MAX_PLAYERS],
	Float:gCurY[MAX_PLAYERS],
	Float:gCurZ[MAX_PLAYERS],
	gLastTick[MAX_PLAYERS],
	gCurTick[MAX_PLAYERS];

new Peds[216][1] = {
{288},//TEAM_ADMIN
{286},{287},{228},{113},{120},{147},{294},{227},{61},{171},
{247},//CIVILIANS DOWN HERE
{248},{100},{256},{263},{262},{261},{260},{259},{258},{257},{256},{255},
{253},{252},{251},{249},{246},{245},{244},{243},{242},{241},{240},{239},
{238},{237},{236},{235},{234},{233},{232},{231},{230},{229},
{226},{225},{173},{174},{175},{224},{223},{222},{221},{220},{219},{218},
{217},{216},{215},{214},{213},{212},{211},{210},{209},
{207},{206},{205},{204},{203},{202},{201},{200},{199},{198},{197},{196},
{195},{194},{193},{192},{191},{190},{189},{185},{184},{183},
{182},{181},{180},{179},{178},{176},{172},{170},{168},{167},{162},
{161},{160},{159},{158},{157},{156},{155},{154},{153},{152},{151},
{146},{145},{144},{143},{142},{141},{140},{139},{138},{137},{136},{135},
{134},{133},{132},{131},{130},{129},{128},{254},{99},{97},{96},{95},{94},
{92},{90},{89},{88},{87},{85},{84},{83},{82},{81},{80},{79},{78},{77},{76},
{75},{73},{72},{69},{68},{67},{66},{64},{63},{62},{58},{57},{56},{55},
{54},{53},{52},{51},{50},{49},{45},{44},{43},{41},{39},{38},{37},{36},{35},
{34},{33},{32},{31},{30},{29},{28},{27},{26},{25},{24},{23},{22},{21},{20},
{19},{18},{17},{16},{15},{14},{13},{12},{11},{10},{1},{2},
{290},//ROSE
{291},//PAUL
{292},//CESAR
{293},//OGLOC
{187},
{296},//JIZZY
{297},//MADDOGG
{298},//CAT
{299}//ZERO
};

new Float:KartRace[][5] =
{
	{-1424.323242, -957.395202, 200.175765},
	{-1433.637451, -958.604309, 200.269577},
	{-1438.225341, -953.564147, 200.959503},
	{-1437.567626, -944.840026, 200.859680},
	{-1423.409423, -944.037292, 200.377502}
}

new OnKartRace;
new KartCount;

#define SNOW_ON 1
#define SNOW_OFF 2

enum pInfo
{
	pSpawned,
	pFirstConnect,
	pPlane,
	FadeColor, Text:FadeScreen,
	Text:LetterboxTop, Text:LetterboxBottom,
	SnowMode, pOnRace, pRacePoint, pFirework
}

new PlayerInfo[MAX_PLAYERS][pInfo];

forward ScreenFade(playerid, color, speed);
forward ScreenFadeColor(playerid, color, speed);
forward Second();
forward Third();
forward BombReloaded();
forward Countdown();
forward FireworkExplode(playerid);

new SnowObject[MAX_PLAYERS][60];

new Kart1,Kart2,Kart3;

public OnGameModeInit()
{
	SetGameModeText("Snowing");
	UsePlayerPedAnims();
	DiscoPick = CreatePickup(1247, 2, -1445.6775,-938.6946,201.3280);
	Bomber = CreateObject(1636, -1419.937378, -943.195984, 200.846786, 11.1727, 359.1406, 180.0000);
	SetTimer("SnowTimer",10*1000,1);
	SetTimer("Third", 3000, 1);
	SetTimer("Second", 1000, 0);
	LoadObjects();
	AddStaticVehicle(510,-1429.2059,-952.5747,205.7525,90.8021,46,46); // moutanin1
	AddStaticVehicle(481,-1429.3170,-948.0965,205.6656,87.8154,3,3); // bmx
	AddStaticVehicle(481,-1429.2045,-947.4758,205.6656,93.1141,3,3); // bmx2
	AddStaticVehicle(481,-1444.3633,-953.4697,205.6668,6.2118,3,3); // bmx
	
	Kart1 = CreateVehicle(571, -1415.997314, -953.038635, 200.377685, 94.049682, -1, -1, -1);
	Kart2 = CreateVehicle(571, -1416.141845, -951.372009, 200.377426, 91.389030, -1, -1, -1);
	Kart3 = CreateVehicle(571, -1415.982421, -949.695922, 200.377716, 85.003623, -1, -1, -1);

	
	AddPlayerClass(29,-1428.6190,-953.5084,200.9259,318.1087,0,0,0,0,0,0);
	
	for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],-1428.6190,-953.5084,200.9259,318.1087,0,0,0,0,0,0);
	}
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		//Fade
	    PlayerInfo[i][FadeScreen] = TextDrawCreate(0.0, 0.0, "_");
		TextDrawFont(PlayerInfo[i][FadeScreen], 1);
		TextDrawLetterSize(PlayerInfo[i][FadeScreen], 0.0, 50.0);
		TextDrawUseBox(PlayerInfo[i][FadeScreen], true);
		TextDrawColor(PlayerInfo[i][FadeScreen], 0);
		TextDrawBoxColor(PlayerInfo[i][FadeScreen], 0);
		PlayerInfo[i][FadeColor] = 0;
		
		//letter box
		PlayerInfo[i][LetterboxTop] = TextDrawCreate(1.000000,1.000000,"_");
		TextDrawUseBox(PlayerInfo[i][LetterboxTop],1);
		TextDrawBoxColor(PlayerInfo[i][LetterboxTop],0x000000ff);
		TextDrawTextSize(PlayerInfo[i][LetterboxTop],642.000000,20.000000);
		TextDrawAlignment(PlayerInfo[i][LetterboxTop],0);
		TextDrawBackgroundColor(PlayerInfo[i][LetterboxTop],0x000000ff);
		TextDrawFont(PlayerInfo[i][LetterboxTop],3);
		TextDrawLetterSize(PlayerInfo[i][LetterboxTop],1.000000,13.000000);
		TextDrawColor(PlayerInfo[i][LetterboxTop],0xffffffff);
		TextDrawSetOutline(PlayerInfo[i][LetterboxTop],1);
		TextDrawSetProportional(PlayerInfo[i][LetterboxTop],1);
		TextDrawSetShadow(PlayerInfo[i][LetterboxTop],1);
		
		PlayerInfo[i][LetterboxBottom] = TextDrawCreate(2.000000,336.000000,"~n~~w~Founder: ~g~Leopard ~n~~n~~n~~n~~n~~n~");
		TextDrawUseBox(PlayerInfo[i][LetterboxBottom],1);
		TextDrawBoxColor(PlayerInfo[i][LetterboxBottom],0x000000ff);
		TextDrawTextSize(PlayerInfo[i][LetterboxBottom],638.000000,3.000000);
		TextDrawAlignment(PlayerInfo[i][LetterboxBottom],0);
		TextDrawBackgroundColor(PlayerInfo[i][LetterboxBottom],0x00ffff00);
		TextDrawFont(PlayerInfo[i][LetterboxBottom],1);
		TextDrawLetterSize(PlayerInfo[i][LetterboxBottom],1.200000,2.000000);
		TextDrawColor(PlayerInfo[i][LetterboxBottom],0xffffffff);
		TextDrawSetOutline(PlayerInfo[i][LetterboxBottom],1);
		TextDrawSetProportional(PlayerInfo[i][LetterboxBottom],1);
		TextDrawSetShadow(PlayerInfo[i][LetterboxBottom],5);
	}
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	new str[40];
	Camera_Join(playerid)
	TextDrawShowForPlayer(playerid, PlayerInfo[playerid][FadeScreen]);
	PlayerInfo[playerid][pPlane] = 	CreatePlayerObject(playerid, 1681, -1377.356812, -1070.650635, 204.177139, 0.0000, 0.0000, 5.000); //start
	for(new o=0; o<60; o++) SnowObject[playerid][o] = CreatePlayerObject(playerid,354,-1428.6190,-953.5084,200.9259,0,0,0);
	PlayerInfo[playerid][pFirstConnect] = 1;
	PlayerInfo[playerid][pSpawned] = 0;
	SetWorldTime(24);
	SetPlayerCheckpoint(playerid, -1419.8820,-942.1124,201.5156, 1);
	format(str, sizeof str, "%s joined!", pName(playerid));
	SendClientMessageToAll(0xFFFFFFAA, str);
	//Preload
	PreloadAnimLib(playerid,"BOMBER");
	PreloadAnimLib(playerid,"RAPPING");
	PreloadAnimLib(playerid,"SHOP");
	PreloadAnimLib(playerid,"BEACH");
	PreloadAnimLib(playerid,"SMOKING");
	PreloadAnimLib(playerid,"FOOD");
	PreloadAnimLib(playerid,"ON_LOOKERS");
	PreloadAnimLib(playerid,"DEALER");
	PreloadAnimLib(playerid,"CRACK");
	PreloadAnimLib(playerid,"CARRY");
	PreloadAnimLib(playerid,"COP_AMBIENT");
	PreloadAnimLib(playerid,"PARK");
	PreloadAnimLib(playerid,"INT_HOUSE");
	PreloadAnimLib(playerid,"FOOD");
	return 1;
}

stock pName(playerid)
{
	new pname[24];
	GetPlayerName(playerid, pname, 24);
	return pname;
}

public OnPlayerDisconnect(playerid, reason)
{
	Camera_Leave(playerid)
	TextDrawHideForPlayer(playerid, PlayerInfo[playerid][FadeScreen]);
	
	TextDrawHideForPlayer(playerid, PlayerInfo[playerid][LetterboxTop]);
	TextDrawHideForPlayer(playerid, PlayerInfo[playerid][LetterboxBottom]);
	DestroyPlayerObject(playerid, PlayerInfo[playerid][pPlane]);
	PlayerInfo[playerid][pSpawned] = 0;
	return 1;
}

PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);
}

public OnPlayerSpawn(playerid)
{
	if(PlayerInfo[playerid][pFirstConnect] == 1)
	{
		
		TextDrawShowForPlayer(playerid, PlayerInfo[playerid][LetterboxTop]);
		TextDrawShowForPlayer(playerid, PlayerInfo[playerid][LetterboxBottom]);
		SetPlayerPos(playerid, 1.7015,31.4009,1199.6012);
		SetPlayerFacingAngle(playerid, 181.9525);
		SetPlayerInterior(playerid, 1);
		TogglePlayerControllable(playerid, 0);
		SetPlayerVirtualWorld(playerid, random(200));
		SetCameraLookAtForPlayer(playerid, 2.0476,31.6332,1199.6012);
		SetCameraPosForPlayer(playerid, 1.2233,24.0943,1199.5938);
		PlayerInfo[playerid][pFirstConnect] = 2;
		ApplyAnimation(playerid,"PED","WALK_player",4.1,1,1,1,1,1);
		SetTimerEx("OnPlayerSpawn", 6*1000, 0, "i", playerid);
		return 1;
	}
	if(PlayerInfo[playerid][pFirstConnect] == 2)
	{
		
		MovePlayerObject(playerid, PlayerInfo[playerid][pPlane], -1384.7786,-1032.9982, 204.175537, 5);
		SetPlayerPos(playerid, -1390.746582, -1030.828979, 108.175537);
		SetPlayerFacingAngle(playerid, 181.9525);
		ApplyAnimation(playerid,"PED","WALK_drunk",4.1,1,1,1,1,1);
		SetPlayerInterior(playerid, 0);
		SetCameraLookAtForPlayer(playerid, -1390.746582, -1030.828979, 204.175537);
		SetCameraPosForPlayer(playerid, -1390.746582, -1036.828979, 250.175537);
		MoveCameraPosForPlayer(playerid, -1396.0170,-1020.1405,211.5781, 2);
		PlayerInfo[playerid][pFirstConnect] = 0;
		SetTimerEx("OnPlayerSpawn", 12*1000, 0, "i", playerid);
		SetTimerEx("Anims", 9*1000, 0, "i", playerid);
		return 1;
	}
	SetPlayerPos(playerid, -1430.3979,-959.3400,200.9261);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	FadePlayerScreenToNormal(playerid, COLOR_BLACK, 10);
	TogglePlayerControllable(playerid, 1);
	TextDrawHideForPlayer(playerid, PlayerInfo[playerid][LetterboxTop]);
	TextDrawHideForPlayer(playerid, PlayerInfo[playerid][LetterboxBottom]);
	ResetCameraForPlayer(playerid);
	PlayerInfo[playerid][pSpawned] = 1;
	StartSnow();
	return 1;
}

forward Anims(playerid);
public Anims(playerid)
{
	ClearAnimations(playerid);
	ApplyAnimation(playerid,"PED","handscower",4.1,0,1,1,0,1);
	SetTimerEx("Anims2", 2*1000, 0, "i", playerid);
}

forward Anims2(playerid);
public Anims2(playerid)
{
	ClearAnimations(playerid);
	ApplyAnimation(playerid,"PED","WALK_player",4.1,1,1,1,1,1);
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(PlayerInCheckpoint >= 0) return 0;
	TogglePlayerControllable(playerid, 0);
	PlayerInCheckpoint = playerid;
	SendClientMessage(playerid, 0xFFFFFFAA, "Press Enter key to get out.");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	PlayerInCheckpoint = -1;
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_FIRE)
	{
		if(PlayerInCheckpoint == playerid)
		{
			if(BombBusy == 1 || BombBusy == 2) return 0;
			ShootBomb(playerid);
			return 1;
		}
	}
	if(newkeys == KEY_SECONDARY_ATTACK)
	{
		if(PlayerInCheckpoint == playerid)
		{
			TogglePlayerControllable(playerid, 1);
			return 1;
		}
	}
/*	if(newkeys & KEY_ACTION && oldkeys & KEY_CROUCH)
	{
		if(!IsValidPlayerObject(playerid, PlayerInfo[playerid][pFirework]))
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
			SetTimerEx("FireworkExplode", 2500, 0, "i", playerid);
			return 1;
		}
		SendClientMessage(playerid, 0xFFFFFFAA, "You already placed an firework!");
		return 1;
	}*/
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER && oldstate == PLAYER_STATE_ONFOOT)
	{
		if(GetPlayerVehicleID(playerid) == Kart1 ||
		GetPlayerVehicleID(playerid) == Kart2 ||
		GetPlayerVehicleID(playerid) == Kart3)
		{
			PlayerInfo[playerid][pOnRace] = GetPlayerVehicleID(playerid);
			OnKartRace++;
			SetPlayerRaceCheckpoint(playerid, 0, KartRace[0][0], KartRace[0][1], KartRace[0][2], KartRace[1][0], KartRace[1][1], KartRace[1][2], 2);
			PlayerInfo[playerid][pRacePoint] = 0;
			if(OnKartRace < 3)
			{
				TogglePlayerControllable(playerid, 0);
				new str[50];
				format(str, sizeof str, "Please wait for %d more players to enter the other karts.", 3-OnKartRace);
				SendClientMessage(playerid, 0xFFFFFFAA, str);
				return 1;
			}
			SetTimer("Countdown", 1000, 0);
		}
	}
	if(newstate == PLAYER_STATE_DRIVER && oldstate == PLAYER_STATE_ONFOOT)
	{
		if(PlayerInfo[playerid][pOnRace] == 1)
		{
			SetVehicleNumberPlate(PlayerInfo[playerid][pOnRace], pName(playerid));
			SetVehicleToRespawn(PlayerInfo[playerid][pOnRace]);
			PlayerInfo[playerid][pOnRace] = 0;
			OnKartRace--;
			DisablePlayerRaceCheckpoint(playerid);
		}
	}
	return 1;
}


public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(PlayerInfo[playerid][pOnRace] > 0)
	{
		PlayerInfo[playerid][pRacePoint]++;
		DisablePlayerRaceCheckpoint(playerid);
		new id = PlayerInfo[playerid][pRacePoint];
		if(PlayerInfo[playerid][pRacePoint] == sizeof KartRace)
		{
			SetPlayerRaceCheckpoint(playerid, 1, KartRace[id][0], KartRace[id][1], KartRace[id][2], KartRace[id+1][0], KartRace[id+1][1], KartRace[id+1][2], 2);
			GameTextForPlayer(playerid, "Last one!", 1, 1000);
			return 1;
		}
		SetPlayerRaceCheckpoint(playerid, 0, KartRace[id][0], KartRace[id][1], KartRace[id][2], KartRace[id+1][0], KartRace[id+1][1], KartRace[id+1][2], 2);
		return 1;
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		if(PlayerInfo[i][pOnRace] == vehicleid)
		{
			SetPlayerHealth(playerid, 0.0);
			SendClientMessage(playerid, 0xFFFFFFAA, "No jack!");
		}
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	PlayerInfo[playerid][pSpawned] = 0;
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid,256.0815,-43.000,1003.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128];
	new idx;
	cmd = strtok(cmdtext, idx);
	if(strcmp(cmd, "/snow", true) == 0)
	{
		new tmp[30];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Usage: \"/snow off/on\"");
			return 1;
		}
		if(strcmp(tmp, "off", true) == 0)
		{
			for(new o=0; o<60; o++) DestroyPlayerObject(playerid, SnowObject[playerid][o]);
			PlayerInfo[playerid][SnowMode] = SNOW_OFF;
			SendClientMessage(playerid, 0xFFFFFFAA, "Turned off.");
			return 1;
		}
		if(strcmp(tmp, "on", true) == 0)
		{
			for(new o=0; o<60; o++) SnowObject[playerid][o] = CreatePlayerObject(playerid,354,-1428.6190,-953.5084,200.9259,0,0,0);
			PlayerInfo[playerid][SnowMode] = SNOW_ON;
			SendClientMessage(playerid, 0xFFFFFFAA, "Turned on.");
			return 1;
		}
	}
	if(strcmp(cmdtext, "/kill", true) == 0)
	{
		SetPlayerHealth(playerid, 0.0);
		return 1;
	}
	if(strcmp(cmdtext, "/firework", true) == 0)
	{
		if(!IsValidPlayerObject(playerid, PlayerInfo[playerid][pFirework]))
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
			SetTimerEx("FireworkExplode", 2500, 0, "i", playerid);
			return 1;
		}
		SendClientMessage(playerid, 0xFFFFFFAA, "You already placed an firework!");
		return 1;
	}
	if(strcmp(cmdtext, "/jetpack", true) == 0)
	{
		SetPlayerSpecialAction(playerid, 2);
		return 1;
	}
	if(strcmp(cmdtext, "/exit", true) == 0)
	{
		if(GetPlayerInterior(playerid) == 17)
		{
			SetPlayerPos(playerid, -1440.1899,-938.4779,201.1846);
			SetPlayerInterior(playerid, 0);
			return 1;
		}
		return 0;
	}
	if(strcmp(cmd, "/sound", true) == 0)
	{
		new tmp[30];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Usage: \"/sound <id>\"");
			return 1;
		}
		PlayerPlaySound(playerid, strval(tmp), 0.0, 0.0, 0.0);
		return 1;
	}
	if(strcmp(cmd, "/dance", true) == 0)
	{
		new tmp[30];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Usage: \"/dance <1-3>\"");
			return 1;
		}	
		new id = strval(tmp);
		if(id == 1)
		{
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
		}
		if(id == 2)
		{
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
		}
		if(id == 3)
		{
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
		}
		return 1;
	}
	if(strcmp(cmdtext, "/spawned", true) == 0)
	{	
		if(PlayerInfo[playerid][pSpawned] == 0) PlayerInfo[playerid][pSpawned] = 1;
		if(PlayerInfo[playerid][pSpawned] == 1) PlayerInfo[playerid][pSpawned] = 0;
		new str[15];
		format(str, sizeof str, "%d", PlayerInfo[playerid][pSpawned]);
		SendClientMessage(playerid, 0xFFFFFFAA, str);
		return 1;
	}
	if(strcmp(cmdtext, "/angle", true) == 0)
	{
		new str[30];
		new Float:angle;
		GetPlayerFacingAngle(playerid, angle);
		format(str, sizeof str, "Angle: %.2f", angle);
		SendClientMessage(playerid, 0xFFFFFFAA, str);
		return 1;
	}
	return 0;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == DiscoPick)
	{
		if(IsPlayerInAnyVehicle(playerid)) return 0;
		SetPlayerPos(playerid, 493.2453, -23.7140, 1000.6797);
		SetPlayerInterior(playerid, 17);
		SendClientMessage(playerid, 0xFFFFFFAA, "Use /exit to exit");
		return 1;
	}
	return 1;
}

public OnObjectMoved(objectid)
{
	if(objectid == Bomber)
	{
		SetObjectPos(Bomber, -1419.937378, -943.195984, 200.846786);
	}
}

public OnPlayerObjectMoved(playerid, objectid)
{
	Camera_ObjectMoved()
	if(objectid ==  PlayerInfo[playerid][pPlane])
	{
		SetPlayerPos(playerid, -1386.5144,-1028.9806,203.0489);
		SetPlayerFacingAngle(playerid, 79.6598);
		SetCameraLookAtForPlayer(playerid, -1386.5144,-1028.9806,203.0489);
		SetCameraPosForPlayer(playerid, -1400.9038,-1036.5081,203.0489);
		return 1;
	}
	return 1;
}
/*
public OnPlayerWalkKey(playerid, mode, key)
{
	new str[100];
	format(str, sizeof str, "OnPlayerWalkKey(%d, %d, %d)", playerid, mode, key);
	SendClientMessage(playerid, 0xFFFFFFAA, str);
	if(mode == vertical)
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "if(mode == vertical)");
		new keys, updown, leftright;
		GetPlayerKeys(playerid, keys, updown, leftright);
		if(keys != KEY_SPRINT)
		{
			if(key & KEY_UP || key & KEY_DOWN)
			{
				ApplyAnimation(playerid,"PED","WALK_player",4.1,1,1,1,1,4);
			}
			else if(key & KEY_RELEASE)
			{
				ApplyRandomStandAnimation(playerid);
			}
		}
		else
		{
			if(key & KEY_UP || key & KEY_DOWN)
			{
				ApplyAnimation(playerid,"PED","run_civi",4.1,1,1,1,1,1);
			}
			else if(key & KEY_RELEASE)
			{
				ApplyRandomStandAnimation(playerid);
			}
		}
	}
}
//This is an real-life walking script, it's not working at the moment.
// Try to fix it! You will get a cookie!
*/

public OnPlayerText(playerid, text[])
{
	ApplyAnimation(playerid,"PED","IDLE_chat",4.1,0,1,1,0,1);
}
	
public OnPlayerUpdate(playerid)
{
	CameraUpdate(playerid);
	if (GetPlayerVehicleID(playerid))
	{
		gLastTick[playerid] = gCurTick[playerid];
		gLastX[playerid] = gCurX[playerid];
		gLastY[playerid] = gCurY[playerid];
		gLastZ[playerid] = gCurZ[playerid];
		GetVehiclePos(GetPlayerVehicleID(playerid), gCurX[playerid], gCurY[playerid], gCurZ[playerid]);
//		gCurTick[playerid] = gLastUpdate[playerid];
		gCurTick[playerid] = GetTickCount();
	}
	return 1;
}

stock ApplyRandomStandAnimation(playerid)
{
	new r = random(3);
	switch(r)
	{
		case 1: ApplyAnimation(playerid,"PED","roadcross",4.1,1,1,1,1,1);
		case 2: ApplyAnimation(playerid,"WUZI","Wuzi_stand_loop",4.1,1,1,1,1,1);
		
	}
}

public Second()
{
	new str[50];
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		format(str, sizeof str, "Speed: %.1f", GetPlayerVehicleSpeed(i));
		GameTextForPlayer(i, str, 1000, 3);
	}
	return 1;
}


public Third()
{
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerToPoint(2, i, -1446.8080,-965.3707,201.6105))
			{
				SetPlayerPos(i, -1435.0981,-964.0001,201.0099);
			}
			if(PlayerToPoint(2, i, -1435.0981,-964.0001,201.0099))
			{
				SetPlayerPos(i, -1446.8080,-965.3707,201.6105);
			}
		}
	}
	StartSnow();
}

PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	tempposx = (oldposx -x);
	tempposy = (oldposy -y);
	tempposz = (oldposz -z);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		return 1;
	}
	return 0;
}
forward ShootBomb(playerid);
public ShootBomb(playerid)
{
	if(BombBusy == 0)
	{
		DestroyObject(Bomber);
		DestroyObject(Bomber2);
		DestroyObject(Bomber3);
		Bomber = CreateObject(1636, -1419.937378, -943.195984, 200.846786, 11.1727, 359.1406, 180.0000);
		MoveObject(Bomber, -1420.0557,-1003.4669,205.9449, 8);
		Bomber = CreateObject(1636, -1419.937378, -943.195984, 200.846786, 11.1727, 359.1406, 180.0000);
		MoveObject(Bomber, -1431.2271,-993.0791,192.3331, 8);
		Bomber = CreateObject(1636, -1419.937378, -943.195984, 200.846786, 11.1727, 359.1406, 180.0000);
		MoveObject(Bomber, -1403.2821,-999.1878,184.1657, 8);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
		BombBusy = 2;
		SetTimer("ShootBomb", 500, 0);
		return 1;
	}
	if(BombBusy == 2)
	{
		CreateExplosion(-1420.1208,-944.4908,201.0938, 12, 1);
		SetTimer("BombReloaded", 3000, 0);
		return 1;
	}
	return 1;
}

public BombReloaded()
{
	SendClientMessage(PlayerInCheckpoint, 0xFFFFFFAA, "Reloaded!");
	StopObject(Bomber);
	SetObjectPos(Bomber, -1402.9137,-1071.0602,235.8559);
	BombBusy = 0;
}

stock StartSnow()
{
	for(new i=0; i<GetMaxPlayers(); i++)
	{
		if(IsPlayerConnected(i) && PlayerInfo[i][pSpawned] == 1)
		{
			new Float:Pos[3],Float:pObjectPos[3];
			Pos[0] = -1430.3979, Pos[1] = -959.3400, Pos[2] = 200.9261
			for(new b=0; b<60; b++)
			{
				if(b < 20) SetPlayerObjectPos(i,SnowObject[i][b],Pos[0]+rand(-30, 30),Pos[1]+rand(-30, 30),Pos[2]+10+rand(-7, 7));
				if(b < 40 && b > 20) SetPlayerObjectPos(i,SnowObject[i][b],Pos[0]+rand(-30, 30),Pos[1]+rand(-30, 30),Pos[2]+10+rand(-7, 7));
				if(b < 50 && b > 40) SetPlayerObjectPos(i,SnowObject[i][b],Pos[0]+rand(-30, 30),Pos[1]+rand(-30, 30),Pos[2]+10+rand(-7, 7));
				if(b > 50) SetPlayerObjectPos(i,SnowObject[i][b],Pos[0]+rand(-30, 30),Pos[1]+rand(-30, 30),Pos[2]+10+rand(-7, 7));
				GetPlayerObjectPos(i,SnowObject[i][b],pObjectPos[0],pObjectPos[1],pObjectPos[2]);
				MovePlayerObject(i,SnowObject[i][b],pObjectPos[0],pObjectPos[1],Pos[2]-6,6);
			}
		}
	}
}

stock LoadObjects()
{
	CreateObject(3917, -1449.288696, -939.677734, 193.676636, 0.0000, 0.0000, 270.0000);
	CreateObject(3917, -1435.788696, -939.727783, 193.676636, 0.0000, 0.0000, 270.0000);
	CreateObject(3917, -1435.788696, -929.227783, 193.676636, 0.0000, 0.0000, 270.0000);
	CreateObject(3917, -1448.788696, -929.327881, 193.676636, 0.0000, 0.0000, 270.0000);
	CreateObject(3917, -1450.788696, -946.077881, 193.676636, 0.0000, 0.0000, 270.0000);
	CreateObject(3917, -1437.788696, -946.077881, 193.676636, 0.0000, 0.0000, 270.0000);
	CreateObject(3917, -1424.787476, -939.504028, 191.201324, 0.0000, 351.4056, 181.4780);
	CreateObject(3917, -1425.161865, -926.503296, 191.201324, 0.0000, 351.4056, 181.4780);
	CreateObject(3917, -1417.161865, -926.479004, 194.151093, 358.2811, 0.0000, 180.6185);
	CreateObject(3917, -1406.912109, -926.403931, 194.151093, 358.2811, 0.0000, 180.6185);
	CreateObject(2773, -1415.869873, -944.036438, 200.610977, 0.0000, 0.0000, 270.0000);
	CreateObject(2773, -1417.769775, -944.036438, 200.610977, 0.0000, 0.0000, 270.0000);
	CreateObject(2773, -1419.695190, -944.036438, 200.610977, 0.0000, 0.0000, 270.0000);
	CreateObject(2773, -1421.021484, -943.160583, 200.610977, 0.0000, 0.0000, 203.8233);
	CreateObject(2773, -1421.421387, -941.311707, 200.610977, 0.0000, 0.0000, 181.4778);
	CreateObject(2773, -1421.421387, -939.387268, 200.610977, 0.0000, 0.0000, 179.7589);
	CreateObject(2773, -1421.421387, -937.462830, 200.710953, 356.5623, 0.0000, 179.7589);
	CreateObject(2773, -1421.421387, -935.538391, 200.885910, 356.5623, 0.0000, 179.7589);
	CreateObject(2773, -1414.682861, -947.037598, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.682861, -948.963013, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.658081, -950.888184, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.658081, -952.838135, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.658081, -954.763306, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.658081, -956.688721, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.658081, -958.613892, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.658081, -960.588867, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1414.658081, -962.588867, 200.610977, 0.0000, 0.0000, 180.0000);
	CreateObject(2773, -1415.058472, -964.439209, 200.610977, 0.0000, 358.2811, 153.3573);
	CreateObject(2773, -1415.634033, -966.288574, 200.610977, 0.0000, 358.2811, 174.8434);
	CreateObject(1465, -1415.665527, -967.073730, 200.817062, 0.0000, 0.0000, 270.0000);
	CreateObject(1521, -1415.683716, -969.874634, 200.846725, 0.0000, 0.0000, 270.0000);
	CreateObject(2633, -1417.650269, -972.117859, 200.662872, 0.0000, 0.0000, 180.0000);
	CreateObject(2633, -1421.900269, -972.117859, 200.662872, 0.0000, 0.0000, 180.0000);
	CreateObject(2633, -1438.200317, -972.117859, 200.662872, 0.0000, 0.0000, 180.0000);
	CreateObject(2633, -1441.549683, -971.342102, 200.662872, 0.0000, 0.0000, 149.9194);
	CreateObject(2633, -1450.251343, -941.216492, 200.662872, 0.0000, 0.0000, 89.6550);
	CreateObject(2633, -1449.500610, -937.517517, 200.662872, 0.0000, 357.4217, 65.5910);
	CreateObject(2633, -1447.274902, -935.067810, 200.662872, 0.0000, 357.4217, 30.3542);
	CreateObject(2633, -1443.948608, -934.117371, 200.662872, 0.0000, 357.4217, 1.1335);
	CreateObject(2633, -1439.899048, -933.992493, 200.662872, 0.8594, 2.5783, 1.1335);
	CreateObject(2633, -1435.649048, -933.992493, 200.562897, 0.8594, 0.0000, 1.1335);
	CreateObject(2633, -1431.424805, -933.992493, 200.562897, 0.8594, 0.0000, 1.1335);
	CreateObject(2633, -1427.625244, -933.892395, 200.187988, 0.8594, 11.1727, 1.1335);
	CreateObject(2633, -1425.326172, -934.768250, 199.712860, 350.5462, 6.8755, 307.8485);
	CreateObject(3399, -1421.701416, -942.531555, 198.914658, 9.4538, 0.0000, 113.2048);
	CreateObject(906, -1423.769775, -932.337524, 200.324249, 0.0000, 0.0000, 326.2500);
	CreateObject(8572, -1417.256470, -965.535278, 200.610657, 0.0000, 0.0000, 269.1406);
	CreateObject(1649, -1446.197632, -963.723572, 203.861450, 0.0000, 0.0000, 182.5783);
	CreateObject(1649, -1446.197632, -963.723572, 203.861450, 0.0000, 0.0000, 2.9566);
	CreateObject(1649, -1443.970459, -965.725525, 203.861450, 0.0000, 0.0000, 89.7592);
	CreateObject(1649, -1443.970459, -965.725525, 203.861450, 0.0000, 0.0000, 270.1378);
	CreateObject(3502, -1446.365967, -965.737366, 198.521225, 270.6186, 359.1406, 359.1406);
	CreateObject(3502, -1435.614258, -964.336975, 196.796280, 258.5865, 356.5623, 274.1602);
	CreateObject(1318, -1437.927490, -965.238159, 202.105682, 0.0000, 0.0000, 0.0000);
	CreateObject(1318, -1447.887329, -966.078552, 202.427155, 180.3777, 0.0000, 6.8755);
	CreateObject(1649, -1443.995483, -969.099670, 203.861450, 0.0000, 0.0000, 90.5158);
	CreateObject(1649, -1442.220459, -972.375427, 203.861450, 0.0000, 0.0000, 148.9577);
	CreateObject(1649, -1438.145142, -973.425964, 203.861450, 0.0000, 359.1406, 179.8971);
	CreateObject(1649, -1424.868896, -973.425964, 203.786469, 0.0000, 359.1406, 180.7565);
	CreateObject(1649, -1417.664185, -973.359497, 203.954407, 0.0000, 359.1406, 179.8971);
	CreateObject(1649, -1415.415649, -971.034180, 203.329559, 0.0000, 359.1406, 265.8405);
	CreateObject(1216, -1436.745850, -961.681946, 200.733215, 0.0000, 0.0000, 180.0000);
	CreateObject(656, -1418.669556, -940.650330, 199.719727, 0.0000, 0.0000, 0.0000);
	CreateObject(906, -1415.493286, -936.012939, 200.324249, 0.0000, 21.4859, 154.3626);
	CreateObject(906, -1413.770996, -938.936890, 200.324249, 0.0000, 24.9237, 259.2140);
	CreateObject(906, -1414.672119, -942.262451, 200.324249, 0.0000, 24.9237, 7.3991);
	CreateObject(3502, -1410.811646, -944.808350, 202.704300, 12.0321, 357.4217, 274.0563);
	CreateObject(4019, -1370.250854, -977.161560, 160.992813, 0.0000, 0.0000, 0.0000);
	CreateObject(2794, -1406.614624, -944.745300, 204.848206, 0.0000, 0.0000, 276.1707);
	CreateObject(1491, -1406.719238, -943.741089, 202.027496, 0.0000, 0.0000, 281.2500);
	CreateObject(1279, -1417.569824, -941.817505, 200.050842, 0.0000, 0.0000, 0.0000);
	CreateObject(1279, -1418.019775, -941.817505, 200.250793, 0.8594, 332.4980, 357.4217);
	CreateObject(1310, -1419.594482, -941.327515, 200.282120, 287.8073, 0.0000, 90.0000);
	CreateObject(1550, -1416.079590, -939.771790, 200.517197, 0.0000, 0.0000, 0.0000);
	CreateObject(1576, -1419.924194, -937.544189, 200.155884, 0.0000, 0.0000, 0.0000);
	CreateObject(1576, -1420.474487, -937.869507, 200.155884, 0.0000, 0.0000, 0.0000);
	CreateObject(1576, -1418.147217, -937.444092, 200.155884, 0.0000, 0.0000, 219.0523);
	CreateObject(1576, -1418.197266, -937.343994, 200.255859, 1.7189, 16.3293, 125.3737);
	CreateObject(1578, -1419.183716, -938.892944, 200.117584, 0.0000, 0.0000, 0.0000);
	CreateObject(1578, -1418.533081, -940.219238, 200.167572, 0.0000, 324.7631, 277.4941);
	CreateObject(1581, -1418.035034, -939.226440, 200.147369, 269.7591, 339.3735, 240.9338);
	CreateObject(1582, -1420.283691, -940.478699, 200.076553, 0.0000, 0.0000, 67.5000);
	CreateObject(1644, -1420.444946, -939.068970, 200.182648, 0.0000, 0.0000, 0.0000);
	CreateObject(2034, -1415.520142, -943.117737, 200.124573, 0.0000, 0.0000, 292.5000);
	CreateObject(2061, -1418.464478, -941.419739, 202.745148, 0.0000, 177.9034, 358.2811);
	CreateObject(2064, -1419.953491, -942.860718, 200.722977, 0.0000, 0.0000, 0.0000);
	CreateObject(2237, -1432.443848, -961.928772, 201.111496, 347.1084, 359.1406, 180.0000);
	CreateObject(11395, -1411.881348, -954.786804, 207.612320, 0.0000, 0.0000, 270.0000);
	CreateObject(10281, -1426.751709, -960.959290, 201.672867, 0.0000, 0.0000, 181.7961);
	CreateObject(9527, -1420.359741, -946.654907, 199.460464, 271.4780, 0.0000, 0.0000);
	CreateObject(8644, -1413.818726, -945.039246, 204.875351, 0.0000, 0.0000, 22.5000);
	CreateObject(7666, -1418.305176, -940.798584, 224.860245, 0.0000, 0.0000, 111.6227);
	CreateObject(7666, -1418.305176, -940.798584, 224.860245, 0.0000, 0.0000, 27.3982);
	CreateObject(7666, -1418.305176, -940.798584, 224.860245, 0.0000, 0.0000, 326.3785);
	CreateObject(7666, -1418.305176, -940.798584, 224.860245, 0.0000, 0.0000, 247.3108);
	CreateObject(3467, -1441.073730, -939.545776, 200.837265, 0.0000, 0.0000, 90.0000);
	CreateObject(12991, -1444.258057, -937.140381, 200.227310, 0.0000, 0.0000, 270.0000);
	CreateObject(1492, -1441.335938, -937.554932, 200.219162, 0.0000, 0.0000, 270.0000);
	CreateObject(10766, -1372.883301, -1053.625488, 200.103592, 0.0000, 0.0000, 180.0000);
	CreateObject(11479, -1443.119263, -978.305359, 199.486359, 0.0000, 0.0000, 3.4377);
	CreateObject(1428, -1448.696777, -964.180969, 202.684067, 308.4338, 2.5783, 225.0000);
	CreateObject(1437, -1452.313965, -967.122131, 202.328339, 290.3856, 0.0000, 282.0321);
	CreateObject(984, -1430.150879, -972.234009, 202.325485, 0.0000, 268.0403, 91.7189);
	CreateObject(984, -1430.253296, -972.746826, 202.825699, 0.0000, 0.0000, 90.0000);
	CreateObject(3867, -1450.090332, -953.081360, 212.425934, 0.0000, 0.0000, 92.9561);
	CreateObject(1475, -1450.869385, -943.542969, 201.384796, 335.9358, 0.0000, 179.0634);
	CreateObject(1232, -1418.414429, -941.119934, 206.362671, 0.0000, 0.0000, 0.0000);
	CreateObject(1232, -1418.414429, -941.119934, 211.362671, 0.0000, 327.3414, 0.0000);
	CreateObject(1232, -1418.414429, -941.119934, 211.362671, 192.5139, 327.3414, 0.0000);
	CreateObject(1232, -1418.914429, -941.119934, 211.362671, 0.0000, 327.3414, 158.9958);
	CreateObject(1232, -1417.963501, -941.119934, 218.362671, 0.0000, 327.3414, 158.9958);
	CreateObject(1232, -1418.754150, -941.720032, 220.681137, 0.0000, 327.3414, 68.9959);
	CreateObject(1232, -1418.754150, -941.720032, 215.406143, 0.0000, 327.3414, 68.9959);
	CreateObject(1232, -1418.654053, -940.969299, 215.406143, 0.0000, 348.8273, 265.7028);
	CreateObject(1232, -1419.878784, -942.069397, 212.906143, 0.0000, 348.8273, 18.2891);
	CreateObject(2780, -1420.682251, -943.814941, 193.566437, 0.0000, 0.0000, 0.0000);
	CreateObject(5400, -1438.690063, -990.924988, 199.773956, 0.0000, 0.0000, 90.6187);
}

// FADING
stock FadePlayerScreenToNormal(playerid, color, speed)
{
    PlayerInfo[playerid][FadeColor] = color;
    TextDrawBoxColor(PlayerInfo[playerid][FadeScreen], color);
	TextDrawShowForPlayer(playerid, PlayerInfo[playerid][FadeScreen]);
	SetTimerEx("ScreenFade", 100, 0, "ddd", playerid, color, speed);
}

stock FadePlayerScreen(playerid, color, speed)
{
	color -= 255;
	PlayerInfo[playerid][FadeColor] = color;
    TextDrawBoxColor(PlayerInfo[playerid][FadeScreen], color);
	TextDrawShowForPlayer(playerid, PlayerInfo[playerid][FadeScreen]);
	SetTimerEx("ScreenFadeColor", 100, 0, "ddd", playerid, color, speed);
}

public ScreenFade(playerid, color, speed)
{
	if (color <= (PlayerInfo[playerid][FadeColor] - 255))
	{
	    TextDrawHideForPlayer(playerid, PlayerInfo[playerid][FadeScreen]);
	   // OnPlayerScreenFade(playerid, color, speed);
	}
	else
	{
		color -= speed;
		if (color <= (PlayerInfo[playerid][FadeColor] - 255)) color = (PlayerInfo[playerid][FadeColor] - 255);
		TextDrawBoxColor(PlayerInfo[playerid][FadeScreen], color);
		TextDrawShowForPlayer(playerid, PlayerInfo[playerid][FadeScreen]);
		SetTimerEx("ScreenFade", 100, 0, "ddd", playerid, color, speed);
 	}
}

public ScreenFadeColor(playerid, color, speed)
{
	if (color >= (PlayerInfo[playerid][FadeColor] + 255))
	{
	   // OnPlayerScreenColorFade(playerid, color, speed);
	}
	else
	{
		color += speed;
		if (color >= (PlayerInfo[playerid][FadeColor] + 255)) return;
		TextDrawBoxColor(PlayerInfo[playerid][FadeScreen], color);
		TextDrawShowForPlayer(playerid, PlayerInfo[playerid][FadeScreen]);
		SetTimerEx("ScreenFadeColor", 100, 0, "ddd", playerid, color, speed);
 	}
}

strtok( const string[], &index, const seperator[] = " " )
{
	new
		index2,
		result[ 30 ];
 
	index2 =  strfind(string, seperator, false, index);
 
 
	if(index2 == -1)
	{
		if(strlen(string) > index)
		{
			strmid(result, string, index, strlen(string), 30);
			index = strlen(string);
		}
		return result; // This string is empty, probably, if index came to an end
	}
	if(index2 > (index + 29))
	{
		index2 = index + 29;
		strmid(result, string, index, index2, 30);
		index = index2;
		return result;
	}
	strmid(result, string, index, index2, 30);
	index = index2 + 1;
	return result;
}

stock GetPlayerVehicleSpeed(playerid)
{
	if (!IsPlayerInAnyVehicle(playerid))
	{
		return _:0.0;
	}
	new
		Float:x = gLastX[playerid] - gCurX[playerid],
		Float:y = gLastY[playerid] - gCurY[playerid],
		Float:z = gLastZ[playerid] - gCurZ[playerid];
	return _:(floatsqroot((x * x) + (y * y) + (z * z)) / (gCurTick[playerid] - gLastTick[playerid]));
	
}

public Countdown()
{
	if(KartCount == 0) KartCount = 3;
	if(KartCount >= 1)
	{
		new str[50];
		for(new i = 0; i < GetMaxPlayers(); i++)
		{
			if(PlayerInfo[i][pOnRace] > 0)
			{
				switch(KartCount)
				{
					case 3: format(str, sizeof str, "~r~%d", KartCount);
					case 2: format(str, sizeof str, "~y~~r~%d", KartCount);
					case 1: format(str, sizeof str, "~y~%d", KartCount);
				}
				GameTextForPlayer(i, str, 1000, 5);
				new Float:x, Float:y, Float:z;
				GetVehiclePos(PlayerInfo[i][pOnRace], x, y, z);
				SetVehiclePos(PlayerInfo[i][pOnRace], x, y, z);
			}
		}
		KartCount--;
		if(KartCount == 1) KartCount = 1337;
		SetTimer("Countdown", 1000, 0);
		return 1;
	}
	if(KartCount == 1337)
	{
		for(new i = 0; i < GetMaxPlayers(); i++)
		{
			if(PlayerInfo[i][pOnRace] > 0)
			{
				GameTextForPlayer(i, "~g~GO!", 1000, 5);
				TogglePlayerControllable(i, 1);
				return 1;
			}
		}
	}
	return 1;
}

public FireworkExplode(playerid)
{
	if(!IsValidPlayerObject(playerid, PlayerInfo[playerid][pFirework]))
	{
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		z=z-1.5;
		PlayerInfo[playerid][pFirework] = CreatePlayerObject(playerid, 1252, x, y, z, 0, 0, 0);
		for(new i = 0; i < GetMaxPlayers(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerToPoint(4, i, x, y, z))
				{
					SendClientMessage(i, 0xFFFFFFAA, "Firework! Take cover!");
					PlayerPlaySound(i, 1134, x, y, z);
				}
			}
		}
		SetTimerEx("FireworkExplode", 2500, 0, "i", playerid);
		return 1;
	}
	new Float:x, Float:y, Float:z;
	GetPlayerObjectPos(playerid, PlayerInfo[playerid][pFirework], x, y, z);
	DestroyPlayerObject(playerid, PlayerInfo[playerid][pFirework]);
	CreateExplosion(x, y, z, 12, 3);
	return 1;
}