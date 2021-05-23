#include <a_samp>

//RPG Define's
#define RPG_NAME    							"Name RPG"
#define RPG_VERSION     						0.1
#define RPG_SLOGAN      						#RPG_NAME ", Slogan"
#define RPG_CREDITS     						"Rafael"
#define COLOR_ERROR                 			0xBB4444AA
#define DEFAULT_TITLE_COLOR         			0xFF0000AA
#define DEFAULT_SUBTITLE_COLOR      			0x33AA33AA
#define DEFAULT_COLOR               			0xFFFFFFAA
#define SERVER_COLOR             				0xFFFFB3AA
#define CAMERA_CLASS_POSITION       			1958.3783,1343.1572,15.3746
#define CAMERA_CLASS_LOOK           			1958.3783,1343.1572,15.3746
#define CONTINUE_POS_TIMER                      10000
#define MESSAGE_ERROR_LOGGED        			"You are not logged in!"
#define MESSAGE_PLAYER_CONNECT   				"%s has joined the server"
#define MESSAGE_PLAYER_DISCONNECT   			"%s has left the server (%s)"
#define MESSAGE_WRONG_PASSWORD                  "Incorrect password!"
#define MESSAGE_KICK_WRONG_PASSWORD             "You was kicked by not entering with the sure password..."
#define MESSAGE_UNKNOWN_COMMAND                 "Invalid command!"
#define MESSAGE_ALREADY_REGISTERED              "You are already registered"
#define MESSAGE_NOT_REGISTERED                  "You are not registered"

//const static values
static const SHOW_PLAYER_CLASS      =       1;

enum PlayerSaveStats
{
	Password[128],
	Profession,
	Money,
	Float:Health,
	Float:Armour,
	Float:LastPos[4]
}

new TimerContinuePos[MAX_PLAYERS];
new PlayerContinuePos[MAX_PLAYERS] = 0;
new PlayerData[MAX_PLAYERS][PlayerSaveStats];
new PlayerLogged[MAX_PLAYERS] = 0;
new WrongPassword[MAX_PLAYERS] = 0;

forward SavePlayer(playerid);
forward LoadPlayer(playerid);
forward PlayerFileExist(playerid);
forward OnPlayerRegister(playerid, const password[]);
forward OnPlayerLogin(playerid, const password[]);
forward NotContinuePos(playerid);

main()
{
	print("\n----------------------------------");
	printf(" %s, developed by %s",RPG_NAME,RPG_CREDITS);
	print("----------------------------------\n");
}

stock set(dest[], const source[])
{
	for(new i = 0; i < strlen(source); i++) dest[i] = source[i];
	dest[strlen(source)] = EOS;
}

stock strtok(const string[], &index, seperator = ' ')
{
	new res[128], begin_index = index;
	while(string[index] != seperator && index < strlen(string) && index - begin_index < sizeof res)
	{
	    res[index - begin_index] = string[index];
	    index++;
	}
	res[index - begin_index] = EOS;
	if(string[index] == seperator && index < strlen(string)) index++;
	return res;
}

public SavePlayer(playerid)
{
	new File:p_file, data[256], p_filename[40];
	GetPlayerName(playerid, p_filename, sizeof p_filename);
	strcat(p_filename, ".ini");
	p_file = fopen(p_filename, io_write);
	format(data, sizeof data, "Password=%s", PlayerData[playerid][Password]);
	fwrite(p_file, data);
	format(data, sizeof data, "Prof=%d", PlayerData[playerid][Profession]);
	fwrite(p_file, data);
	format(data, sizeof data, "Money=%d", PlayerData[playerid][Money]);
	fwrite(p_file, data);
	format(data, sizeof data, "Health=%f", PlayerData[playerid][Health]);
	fwrite(p_file, data);
	format(data, sizeof data, "Armour=%f", PlayerData[playerid][Armour]);
	fwrite(p_file, data);
	format(data, sizeof data, "LastPos=%f,%f,%f,%d", PlayerData[playerid][LastPos][0], PlayerData[playerid][LastPos][1], PlayerData[playerid][LastPos][2], PlayerData[playerid][LastPos][3]);
	fwrite(p_file, data);
	fclose(p_file);
}

public LoadPlayer(playerid)
{
	new File:p_file, tmp[256], key[128], value[128], p_filename[40];
	GetPlayerName(playerid, p_filename, sizeof p_filename);
	strcat(p_filename, ".ini");
	if(!fexist(p_filename)) return 0;
	p_file = fopen(p_filename, io_read);
	while(fread(p_file, tmp, sizeof tmp))
	{
		strmid(key, tmp, 0, strfind(tmp, "=", true));
		strmid(value, tmp, strfind(tmp, "=", true) + 1, strlen(tmp));
		if(strcmp(key, "Password", true) == 0) PlayerData[playerid][Password] = value;
		if(strcmp(key, "Prof", true) == 0) PlayerData[playerid][Profession] = strval(value);
		if(strcmp(key, "Money", true) == 0) PlayerData[playerid][Money] = strval(value);
		if(strcmp(key, "Health", true) == 0) PlayerData[playerid][Health] = floatstr(value);
		if(strcmp(key, "Armour", true) == 0) PlayerData[playerid][Armour] = floatstr(value);
		if(strcmp(key, "LastPos", true) == 0) for(new i = 0, index; i < 4; i++) PlayerData[playerid][LastPos][i] = floatstr(strtok(value, index, ','));
	}
	fclose(p_file);
	return 1;
}

public PlayerFileExist(playerid)
{
	new p_filename[40];
    GetPlayerName(playerid, p_filename, sizeof p_filename);
	strcat(p_filename, ".ini");
	return fexist(p_filename);
}

stock ExtractPlayerFileValue(playerid, const v_key[])
{
	new File:p_file, p_filename[40], tmp[256], key[128], value[128];
	value[0] = 0;
    GetPlayerName(playerid, p_filename, sizeof p_filename);
	strcat(p_filename, ".ini");
	if(!fexist(p_filename)) return value;
	p_file = fopen(p_filename, io_read);
	while(fread(p_file, tmp, sizeof tmp))
	{
	    strmid(key, tmp, 0, strfind(tmp, "=", true));
	    if(strcmp(v_key, key, true) == 0)
	    {
	        strmid(value, tmp, strfind(tmp, "=", true) + 1, strlen(tmp));
	        break;
	    }
	}
	fclose(p_file);
	return value;
}

public OnGameModeInit()
{
	SetGameModeText(RPG_NAME);
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	print("Ending Gamemode...");
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(SHOW_PLAYER_CLASS) SetPlayerPos(playerid, CAMERA_CLASS_LOOK);
	SetPlayerCameraPos(playerid, CAMERA_CLASS_POSITION);
	SetPlayerCameraLookAt(playerid, CAMERA_CLASS_LOOK);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(PlayerLogged[playerid] == 0)
	{
 		SendClientMessage(playerid, COLOR_ERROR, MESSAGE_ERROR_LOGGED);
 		return 0;
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
    new msg[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	format(msg, sizeof msg, MESSAGE_PLAYER_CONNECT, name);
	SendClientMessageToAll(SERVER_COLOR, msg);
	SendClientMessage(playerid, DEFAULT_TITLE_COLOR, "Welcome to " #RPG_NAME);
	SendClientMessage(playerid, DEFAULT_SUBTITLE_COLOR, "Basic Commands:");
	SendClientMessage(playerid, DEFAULT_COLOR, "/help : to see the commands of help");
	SendClientMessage(playerid, DEFAULT_COLOR, "/commands : to see the Role Play commands.");
	return 1;
}

public OnPlayerRegister(playerid, const password[])
{
	set(PlayerData[playerid][Password], password);
	PlayerLogged[playerid] = 1;
	SavePlayer(playerid);
	SpawnPlayer(playerid);
}

public OnPlayerLogin(playerid, const password[])
{
	if(strcmp(password, ExtractPlayerFileValue(playerid, "Password"), true))
	{
	    WrongPassword[playerid]++;
	    if(WrongPassword[playerid] == 3)
	    {
	        WrongPassword[playerid] = 0;
	        SendClientMessage(playerid, SERVER_COLOR, MESSAGE_KICK_WRONG_PASSWORD);
			Kick(playerid);
	    }
	    SendClientMessage(playerid, COLOR_ERROR, MESSAGE_WRONG_PASSWORD);
	    return 0;
	}
	PlayerLogged[playerid] = 1;
	PlayerContinuePos[playerid] = 1;
	TimerContinuePos[playerid] = SetTimerEx("NotContinuePos", CONTINUE_POS_TIMER, false, "d", playerid);
	LoadPlayer(playerid);
	GivePlayerMoney(playerid, PlayerData[playerid][Money]);
	SetPlayerHealth(playerid, PlayerData[playerid][Health]);
	SetPlayerArmour(playerid, PlayerData[playerid][Armour]);
	SpawnPlayer(playerid);
	return 1;
}

public NotContinuePos(playerid)
{
	if(PlayerContinuePos[playerid]) PlayerContinuePos[playerid] = 0;
	KillTimer(TimerContinuePos[playerid]);
}

public OnPlayerDisconnect(playerid, reason)
{
	new msg[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	format(msg, sizeof msg, MESSAGE_PLAYER_DISCONNECT, name, reason);
	SendClientMessageToAll(SERVER_COLOR, msg);
	SavePlayer(playerid);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
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

public OnPlayerCommandText(playerid, cmdtext[])
{
	new idx, cmd[128];
	cmd = strtok(cmdtext, idx);
	if(strcmp(cmd, "/register", true) == 0)
	{
	    if(PlayerFileExist(playerid)) return SendClientMessage(playerid, COLOR_ERROR, MESSAGE_ALREADY_REGISTERED);
		new pass[128];
		pass = strtok(cmdtext, idx);
		if(!strlen(pass)) return SendClientMessage(playerid, COLOR_ERROR, "SYNTAX: /register [password]");
		if(PlayerLogged[playerid] == 1)
		OnPlayerRegister(playerid, pass);
		return 1;
	}
	if(strcmp(cmd, "/login", true) == 0)
	{
	    if(!PlayerFileExist(playerid)) return SendClientMessage(playerid, COLOR_ERROR, MESSAGE_NOT_REGISTERED);
	    new pass[128];
		pass = strtok(cmdtext, idx);
		if(!strlen(pass)) return SendClientMessage(playerid, COLOR_ERROR, "SYNTAX: /login [password]");
		if(PlayerLogged[playerid] == 1)
		OnPlayerLogin(playerid, pass);
	    return 1;
	}
	if(strcmp(cmd, "/continue", true) == 0)
	{
		if(PlayerContinuePos[playerid] && PlayerLogged[playerid])
		{
		    SetPlayerPos(playerid, PlayerData[playerid][LastPos][0], PlayerData[playerid][LastPos][1], PlayerData[playerid][LastPos][2]);
		    SetPlayerInterior(playerid, floatround(PlayerData[playerid][LastPos][3]));
		    KillTimer(TimerContinuePos[playerid]);
		    return 1;
		}
	}
	SendClientMessage(playerid, SERVER_COLOR, MESSAGE_UNKNOWN_COMMAND);
	return 0;
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

