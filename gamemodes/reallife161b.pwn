/***

SA:MP REALLIFE GAMEMODE

WRITTEN / MODIFIED BY FORCE4

***/
#include <a_samp>
// for the samp stuff
#include <dutils>
// for the functions dini and dudb need
#include <dudb>
#include <core>
#include <float>

#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1
#define COLOR_SYSTEM 0xAA3333AA

#pragma tabsize 0

#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF9900AA

#define COLOUR_PERSONAL  0x8080FFAA
#define COLOUR_IMPORTANT 0xFF0000AA
#define COLOUR_GLOBAL    0xD0D0FFAA
#define COLOUR_BROADCAST 0x0066CCAA

#define COLOUR_QUERY 0xFFFFFFFF
#define NUM_PLOTS 20

#define GAME_TEXT_STYLE_BIG 6
#define GAME_TEXT_STYLE_SMALL 4

#define PocketMoney 5000  // Amount player recieves on spawn.
#define INACTIVE_PLAYER_ID 255
#define GIVECASH_DELAY5000 // Time in ms between /givecash commands.

#define NUMVALUES 4

#define CP_BANK 	0
#define CP_PIRATE 	1
#define CP_AMMU     2
#define CP_ADMIN    11
#define CP_DRAGON   3
#define CP_SEXSHOP  4
#define CP_BAR      5
#define CP_CALIGULA 6
#define CP_ZIP      7
#define CP_BINCO    8
#define CP_TATOO    9
#define CP_BOTIQUE  10

#define P_DRAGON    0
#define P_SEXSHOP   1
#define P_BAR       2
#define P_CALIGULA  3
#define P_ZIP       4
#define P_BINCO     5
#define P_TATOO     6
#define P_BOTIQUE   7

#define TEAM_COP 1

#define P_OFFSET    3

forward MoneyGrubScoreUpdate();
forward SavePosTimer(playerid);
forward AdminArea(playerid);
forward UpdateSpeed(playerid);
forward SendTextTimer();
forward Givecashdelaytimer(playerid);
//forward GrubModeReset();
forward SetPlayerRandomSpawn(playerid);
forward SetupPlayerForClassSelection(playerid);
forward GameModeExitFunc();
forward SystemMsg(playerid,msg[]);
forward PlayerName(playerid);
forward DisruptTrack(playerid);
forward SetFreeze();
forward BanPlayer();
forward KickPlayer();
forward PlayerLeaveGang(playerid);
forward StartTextTimer(playerid);
forward getCheckpointType(playerID);
forward isPlayerInArea(playerID, Float:data[4]);
forward PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash);
forward TimeUpdate();
forward PirateShipScoreUpdate();
forward GambleUpdate();
forward checkpointUpdate();
forward PropertyScoreUpdate();
forward JobMoney(playerid);
forward SavedUpdate();
forward StartGame(playerid);
forward Float:GetDistanceBetweenPlayers(p1,p2);
forward SetPlayerPosEx(playerid,Float:X,Float:Y,Float:Z,Float:Ang,Int);
forward SendPlayerFormattedText(playerid, const str[], define);
forward SendAllFormattedText(playerid, const str[], define);
forward PutAtPos(playerid);
forward AdminAreaAbuse(playerid);

//------------------------------------------------------------------------------------------------------
//new gTeam[MAX_PLAYERS];


/** SPEED SHOW @ FILE NOW! **/



new speedwarned[MAX_PLAYERS];
new job[MAX_PLAYERS];
new player_op[MAX_PLAYERS];
		new ownedcar[MAX_PLAYERS];
		new owner[MAX_PLAYERS];
new FreezeTimer;
new Frozen[MAX_PLAYERS];
new Float:frozex,Float:frozey,Float:frozez;
new Float:player_plot_x[MAX_PLAYERS][NUM_PLOTS];
new Float:player_plot_y[MAX_PLAYERS][NUM_PLOTS];
//new Float:player_plot_z[MAX_PLAYERS][NUM_PLOTS];

new CashScoreOld;
new iSpawnSet[MAX_PLAYERS];
new bank[MAX_PLAYERS];
new bounty[MAX_PLAYERS];
new playerCheckpoint[MAX_PLAYERS];
new gambleWarning[MAX_PLAYERS];
new savePos;
new worldTime;


new playerColors[100] = {
0xFF8C13FF,0xC715FFFF,0x20B2AAFF,0xDC143CFF,0x6495EDFF,0xf0e68cFF,0x778899FF,0xFF1493FF,0xF4A460FF,0xEE82EEFF,0xFFD720FF,
0x8b4513FF,0x4949A0FF,0x148b8bFF,0x14ff7fFF,0x556b2fFF,0x0FD9FAFF,0x10DC29FF,0x534081FF,0x0495CDFF,0xEF6CE8FF,0xBD34DAFF,
0x247C1BFF,0x0C8E5DFF,0x635B03FF,0xCB7ED3FF,0x65ADEBFF,0x5C1ACCFF,0xF2F853FF,0x11F891FF,0x7B39AAFF,0x53EB10FF,0x54137DFF,
0x275222FF,0xF09F5BFF,0x3D0A4FFF,0x22F767FF,0xD63034FF,0x9A6980FF,0xDFB935FF,0x3793FAFF,0x90239DFF,0xE9AB2FFF,0xAF2FF3FF,
0x057F94FF,0xB98519FF,0x388EEAFF,0x028151FF,0xA55043FF,0x0DE018FF,0x93AB1CFF,0x95BAF0FF,0x369976FF,0x18F71FFF,0x4B8987FF,
0x491B9EFF,0x829DC7FF,0xBCE635FF,0xCEA6DFFF,0x20D4ADFF,0x2D74FDFF,0x3C1C0DFF,0x12D6D4FF,0x48C000FF,0x2A51E2FF,0xE3AC12FF,
0xFC42A8FF,0x2FC827FF,0x1A30BFFF,0xB740C2FF,0x42ACF5FF,0x2FD9DEFF,0xFAFB71FF,0x05D1CDFF,0xC471BDFF,0x94436EFF,0xC1F7ECFF,
0xCE79EEFF,0xBD1EF2FF,0x93B7E4FF,0x3214AAFF,0x184D3BFF,0xAE4B99FF,0x7E49D7FF,0x4C436EFF,0xFA24CCFF,0xCE76BEFF,0xA04E0AFF,
0x9F945CFF,0xDCDE3DFF,0x10C9C5FF,0x70524DFF,0x0BE472FF,0x8A2CD7FF,0x6152C2FF,0xCF72A9FF,0xE59338FF,0xEEDC2DFF,0xD8C762FF,
0x3FE65CFF
};

new Float:gRandomPlayerSpawns[23][3] = {
{1958.3783,1343.1572,15.3746},
{2199.6531,1393.3678,10.8203},
{2483.5977,1222.0825,10.8203},
{2637.2712,1129.2743,11.1797},
{2000.0106,1521.1111,17.0625},
{2024.8190,1917.9425,12.3386},
{2261.9048,2035.9547,10.8203},
{2262.0986,2398.6572,10.8203},
{2244.2566,2523.7280,10.8203},
{2335.3228,2786.4478,10.8203},
{2150.0186,2734.2297,11.1763},
{2158.0811,2797.5488,10.8203},
{1969.8301,2722.8564,10.8203},
{1652.0555,2709.4072,10.8265},
{1564.0052,2756.9463,10.8203},
{1271.5452,2554.0227,10.8203},
{1441.5894,2567.9099,10.8203},
{1480.6473,2213.5718,11.0234},
{1400.5906,2225.6960,11.0234},
{1598.8419,2221.5676,11.0625},
{1318.7759,1251.3580,10.8203},
{1558.0731,1007.8292,10.8125},
//{-857.0551,1536.6832,22.5870},   Out of Town Spawns
//{817.3494,856.5039,12.7891},
//{116.9315,1110.1823,13.6094},
//{-18.8529,1176.0159,19.5634},
//{-315.0575,1774.0636,43.6406},
{1705.2347,1025.6808,10.8203}
};

new Float:gCopPlayerSpawns[2][3] = {
{2297.1064,2452.0115,10.8203},
{2297.0452,2468.6743,10.8203}
};

/*new SkinID[7] = {
	49,
	51,
	68,
	74,
	85,
	47,
    99
};*/


#define MAX_POINTS 11

new Float:checkCoords[MAX_POINTS][4] = {
{-36.5483,-57.9948, -17.2655,-49.2967},     //BANK
{1894.6128,1445.3431, 2084.9739,1637.8186}, //PIRATE
{284.0546,-86.4384, 302.9315,-56.6674},     //AMMUNATION
{1925.1511,968.2358, 2019.0715,1067.4276},  //DRAGON
{-115.9544,-24.2706, -99.1631,-7.1391},     //SEXSHOP
{487.6558,-88.5900, 512.0635, -67.7503},    //BAR
{2216.7971,1638.0493, 2255.2097,1714.0806}, //CALIGULA
{144.9131,-96.0927, 177.4128,-70.7923},    	//ZIP
{201.4462,-112.4556, 218.5237,-95.1238},    //BINCO
{-204.7623,-44.0326, -200.2330,-39.8128},   //TATOO
{416.7485,-84.4242, 422.6890,-74.0611}      //BOTIQUE
};

new Float:checkpoints[MAX_POINTS][3] = {
{-22.2549,-55.6575,1003.5469},
{2000.3132,1538.6012,13.5859},
{291.0004,-84.5168,1001.5156},
{1989.0619,1005.5241,994.4688},
{-103.5525,-22.4661,1000.7188},
{501.4927,-75.4323,998.7578},
{2235.5408,1679.0402,1008.3594},
{161.1875,-79.9915,1001.8047},
{207.5640,-97.8188,1005.2578},
{-203.4864,-41.2045,1002.2734},
{418.5547,-80.1667,1001.8047}
};

new checkpointType[MAX_POINTS] = {
	CP_BANK,
	CP_PIRATE,
	CP_AMMU,
	CP_DRAGON,
	CP_SEXSHOP,
	CP_BAR,
	CP_CALIGULA,
	CP_ZIP,
	CP_BINCO,
	CP_TATOO,
	CP_BOTIQUE
};

#define MAX_PROPERTIES	8

new propertyNames[MAX_PROPERTIES][32] = {
	"Four Dragons",
	"Sex Shop",
	"Shithole Bar",
	"Caligula",
	"Zip Shop",
	"Binco Shop",
	"Tatoo Parlor",
	"Botique"
};

new propertyValues[MAX_PROPERTIES] = {
	75000,
	25000,
	20000,
	100000,
	15000,
	15000,
	10000,
	20000
};

new propertyEarnings[MAX_PROPERTIES] = {
	5000,
	2000,
	1500,
	7000,
	1000,
	1000,
	700,
	1500
};

new propertyOwner[MAX_PROPERTIES] = {999,999,999,999,999,999,999,999};

#define MAX_WEAPONS 7
new weaponNames[MAX_WEAPONS][32] = {
	"Shotgun",
	"Combat Shotgun",
	"Micro Uzi",
	"Tec9",
	"MP5",
	"AK47",
	"M4"
};
new weaponIDs[MAX_WEAPONS] = {
	25,     //Shotgun
	27,     //Combat shotgun
	28,     //Micro Uzi
	32,     //Tec9
	29,     //MP5
	30,     //AK47
	31      //M4
};
new weaponCost[MAX_WEAPONS] = {
	7000,
	15000,
	7000,
	5000,
	15000,
	25000,
	30000
};
new weaponAmmo[MAX_WEAPONS] = {
	15,
	20,
	120,
	120,
	120,
	120,
	120
};
new playerWeapons[MAX_PLAYERS][MAX_WEAPONS];

#define MAX_CASINO      3
new Float:gambleAreas[MAX_CASINO][4] = {
	{1928.1771,987.5739, 1970.5675,1042.8369},
	{2171.3618,1584.2649, 2279.4915,1628.6199},
	{1117.5068,-11.2747, 1142.4843,12.5986}
};

#define MAX_SAVE 64
new savedInfo[MAX_SAVE][4];
new savedNames[MAX_SAVE][MAX_PLAYER_NAME];
new savedWeapons[MAX_SAVE][MAX_WEAPONS];

#define MAX_GANGS 			32
#define MAX_GANG_MEMBERS	6
#define MAX_GANG_NAME       16
new gangMembers[MAX_GANGS][MAX_GANG_MEMBERS];
new gangNames[MAX_GANGS][MAX_GANG_NAME];
new gangInfo[MAX_GANGS][3]; //0-created,1-members,2-color
new gangBank[MAX_GANGS];
new playerGang[MAX_PLAYERS];
new gangInvite[MAX_PLAYERS];

//new 4[MAX_PLAYERS];

//Round code stolen from mike's Manhunt :P
//new gRoundTime = 3600000;                   // Round time - 1 hour
//new gRoundTime = 1200000;					// Round time - 20 mins
//new gRoundTime = 900000;					// Round time - 15 mins
//new gRoundTime = 600000;					// Round time - 10 mins
//new gRoundTime = 300000;					// Round time - 5 mins
//new gRoundTime = 120000;					// Round time - 2 mins
//new gRoundTime = 60000;					// Round time - 1 min

new gActivePlayers[MAX_PLAYERS];
new gLastGaveCash[MAX_PLAYERS];

new banning[MAX_PLAYERS];
new kicking[MAX_PLAYERS];

public SystemMsg(playerid,msg[]) {
   if ((IsPlayerConnected(playerid))&&(strlen(msg)>0)) {
       SendClientMessage(playerid,COLOR_SYSTEM,msg);
   }
   return 1;
}

/*
 * This function will be useful when we need the playername
 * (c) by DracoBlue 2006
 */
stock PlayerName(playerid) {
  new name[255];
  GetPlayerName(playerid, name, 255);
  return name;
}
new PLAYERLIST_authed[MAX_PLAYERS];


//------------------------------------------------------------------------------------------------------

main()
{
		print("\n----------------------------------");
		print("  Welcome on SA:MP RealLife GameMode");
		print("  ");
		print("  Modified by force4.");
		print("  ");
		print("  Help:");
		print("  http://samp-reallife.net.ms");
		print("----------------------------------\n");
}

//------------------------------------------------------------------------------------------------------
strvalfixed(str[])
{
	if (strlen(str)>=50) {
	    printf("Unfortunately, the SA:MP developers are completely incompetent strval(\"%s\")\n",str);
	    return 0;
	}
	return strval(str);
}


GetId(playerid, rest[])
{
	new id = strvalfixed(rest);
	if (id<0 || id >=MAX_PLAYERS || !IsPlayerConnected(id)) {
		SendClientMessage(playerid, COLOUR_PERSONAL, "[ERROR]: Invalid id");
		return INVALID_PLAYER_ID;
	}
	return id;
}

parse_command(cmd_text[], cmd[256], text[256])
{
	new index = strfind(cmd_text," ");

	if (index==-1) {
		memcpy(cmd,cmd_text,0,256);
		text = "";
		return 0;
	}

	strmid(cmd,cmd_text,0,index);
 	strmid(text, cmd_text, index + 1, strlen(cmd_text));

	new pars = 0;

	for (new i=0 ; cmd_text[i] != EOS ; i++)
		if (cmd_text[i]==' ') pars++;

	return pars;
}

public DisruptTrack(playerid)
{
	for (new i=0 ; i<NUM_PLOTS ; i++) {
		player_plot_x[playerid][i] = 0;
		player_plot_y[playerid][i] = 0;
		player_plot_y[playerid][i] = 0;
	}
}

public SetFreeze(){
new Float:lfrozex,Float:lfrozey,Float:lfrozez;
for(new i = 0; i < MAX_PLAYERS; i++) {
if(Frozen[i] == 1){
GetPlayerPos(i,lfrozex,lfrozey,lfrozez);

SetPlayerPos(i, frozex,frozey,frozez);
}
}
}

public BanPlayer(){
for(new i = 0; i < MAX_PLAYERS; i++) {
if(IsPlayerConnected(i)){
if(banning[i] == 1){
Ban(i);
}
}
}
}
public KickPlayer(){
for(new i = 0; i < MAX_PLAYERS; i++) {
if(IsPlayerConnected(i)){
if(kicking[i] == 1){
Kick(i);
}
}
}
}

public PlayerLeaveGang(playerid) {
	new string[256];
	new playername[MAX_PLAYER_NAME];
	new gangnum = playerGang[playerid];

    if(gangnum > 0) {
		for(new i = 0; i < gangInfo[gangnum][1]; i++) {
			if(gangMembers[gangnum][i]==playerid) {

			    //One less gang member
			    gangInfo[gangnum][1]--;

      		    for(new j = i; j < gangInfo[gangnum][1]; j++) {
				    //Shift gang members
				    gangMembers[gangnum][j]=gangMembers[gangnum][j+1];
	    		}

			    //Disband gang if no more members
			    if(gangInfo[gangnum][1]<1) {
			        gangInfo[gangnum][0]=0;
			        gangInfo[gangnum][1]=0;
			        gangBank[gangnum]=0;
       			}

				//Notify other members
				for(new j = 0; j < gangInfo[gangnum][1]; j++) {
				    GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
					format(string, sizeof(string),"[GANG]: %s has quit your gang.", playername);
					SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
				}

				format(string, sizeof(string),"[GANG]: You have quit the gang '%s' (id: %d)", gangNames[gangnum], gangnum);
				SendClientMessage(playerid, COLOR_ORANGE, string);

				playerGang[playerid]=0;

				//SetPlayerColor(playerid,playerColors[playerid]);

				return;
			}
		}
	} else {
		SendClientMessage(playerid, COLOR_RED, "[GANG]: You are not in a gang.");
	}
}

public SendTextTimer()
{
SendClientMessageToAll(COLOR_YELLOW, "[TIP]: Use /mph on to turn on the speedmeter.");
SendClientMessageToAll(COLOR_YELLOW, "[TIP]: Visit our forums: http://samp-reallife.net.ms");
SendClientMessageToAll(COLOR_YELLOW, "[TIP]: /help, /jobhelp, /commands, /rules, /about");
SendClientMessageToAll(COLOR_RED, "[NOTE]: Job-Skin currently deactivated, thats the reason for the crashes.");



}

public SavePosTimer(playerid) {
     new Float:x,Float:y,Float:z;
     GetPlayerPos(playerid,x,y,z);
     dUserSetINT(PlayerName(playerid)).("x",floatround(x));
     dUserSetINT(PlayerName(playerid)).("y",floatround(y));
     dUserSetINT(PlayerName(playerid)).("z",floatround(z));
     
     //for(new i = 0; i < MAX_WEAPONS; i++)
	 //   dUserSetINT(PlayerName(playerid)).("wpon",playerWeapons[playerid][i]);

}


public StartTextTimer(playerid)
{
   if (!PLAYERLIST_authed[playerid]) {
   SendClientMessage(playerid, COLOR_YELLOW, "You have to login first, or create an account.");
   SendClientMessage(playerid, COLOR_YELLOW, "Type /register or /login.");
   GameTextForPlayer(playerid,"~r~Register or login to start the game.",1800,1);
   }
}


public getCheckpointType(playerID) {
	return checkpointType[playerCheckpoint[playerID]];
}

public isPlayerInArea(playerID, Float:data[4])
{
	new Float:X, Float:Y, Float:Z;

	GetPlayerPos(playerID, X, Y, Z);
	if(X >= data[0] && X <= data[2] && Y >= data[1] && Y <= data[3]) {
		return 1;
	}
	return 0;
}

public PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash)
{

	if(IsPlayerConnected(playerID))
	{
		new Float:X, Float:Y, Float:Z;

		GetPlayerPos(playerID, X, Y, Z);
		if(X >= x1 && X <= x2 && Y >= y1 && Y <= y2)
		{
			GivePlayerMoney(playerID, cash);
			return 1;
		}
	}
	return 0;
}
//------------------------------------------------------------------------------------------------------

public TimeUpdate() {
	worldTime++;
	worldTime%=24;
	SetWorldTime(worldTime);
}

//------------------------------------------------------------------------------------------------------

public PirateShipScoreUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		PayPlayerInArea(i, 1995.5, 1518.0, 2006.0, 1569.0, 100);
//		{
//            SendClientMessage(i, COLOR_YELLOW, "[CASH]: You earned money for holding the pirate ship.");
//		}
	}
}

//------------------------------------------------------------------------------------------------------

public GambleUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i)) {
	        for(new j=0; j < MAX_CASINO; j++) {
	            if(isPlayerInArea(i,gambleAreas[j])) {
					gambleWarning[i]++;
					GameTextForPlayer(i,"~r~Gambling is now allowed. ~g~Gamblers will be ~r~SHOT",10000,5);
					if(gambleWarning[i] > 3) {
						SetPlayerHealth(i,0);
						ResetPlayerMoney(i);
					}
				}
     		}
       	}
	}
}

//------------------------------------------------------------------------------------------------------

public checkpointUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i)) {
	        for(new j=0; j < MAX_POINTS; j++) {
	            if(isPlayerInArea(i, checkCoords[j])) {
	                if(playerCheckpoint[i]!=j) {
	                    DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, checkpoints[j][0],checkpoints[j][1],checkpoints[j][2],2);
						playerCheckpoint[i] = j;
					}
	            } else {
	            	if(playerCheckpoint[i]==j) {
	            	    DisablePlayerCheckpoint(i);
	            	    playerCheckpoint[i] = 999;
         	    	}
	            }
	        }
		}
	}
}

//------------------------------------------------------------------------------------------------------

public PropertyScoreUpdate()
{
	new owners[MAX_PROPERTIES];
	new payments[MAX_PROPERTIES];

	for(new i=0; i < MAX_PROPERTIES; i++)
	    owners[i]=999;

	for(new i=0; i < MAX_PROPERTIES; i++)
	{
		if(propertyOwner[i] < 999) {

			for(new j=0; j < MAX_PROPERTIES; j++) {
			    if(owners[j]==propertyOwner[i]) {
			        payments[j]+=propertyEarnings[i];
			        j = MAX_PROPERTIES;
			    } else if (owners[j]==999) {
					owners[j]=propertyOwner[i];
					payments[j]+=propertyEarnings[i];
			        j = MAX_PROPERTIES;
				}
			}

		}
	}

	for(new i=0; i < MAX_PROPERTIES; i++) {
		if(owners[i] < 999 && IsPlayerConnected(owners[i])) {
			new string[256];

			GivePlayerMoney(owners[i], payments[i]);

			format(string, sizeof(string), "[CASH]: You earned $%d from your properties.", payments[i]);
			SendClientMessage(owners[i], COLOR_GREEN, string);
		}
	}

}

public JobMoney(playerid)
{
new money;
money = 250;
 if (job[playerid] != 0) {
 			new string[256];
 			format(string, sizeof(string), "[JOB]: You earned $%d.", money);
			SendClientMessage(playerid, COLOR_GREEN, string);
			GivePlayerMoney(playerid, money);
 }
}

//------------------------------------------------------------------------------------------------------

public SavedUpdate()
{
	for(new i = 0; i < MAX_SAVE; i++) {
		if(savedInfo[i][3] < 5) {
			if(savedInfo[i][3]==4) {
				savedInfo[i][0]=savedInfo[i][1]=savedInfo[i][2]=0;
				savedNames[i][0]=0;
			}
			savedInfo[i][3]++;
		}
	}
}

// Save the player positions in an enum
enum SavePlayerPosEnum {
	Float:LastX,
	Float:LastY,
	Float:LastZ
	}

new SavePlayerPos[MAX_PLAYERS][SavePlayerPosEnum];
//new SpeedMode = 0; // 0 for KPH, 1 for MPH
new UpdateSeconds = 1; // How frequent do you want it to be updated?
//new playername;
// Aight, create the main function
public UpdateSpeed(playerid){

	
	new Float:x,Float:y,Float:z;
	new Float:distance,value,string[256];
	new badplayer[MAX_PLAYER_NAME];
	GetPlayerName(playerid, badplayer, MAX_PLAYER_NAME);
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i)){
			GetPlayerPos(i, x, y, z);
			distance = floatsqroot(floatpower(floatabs(floatsub(x,SavePlayerPos[i][LastX])),2)+floatpower(floatabs(floatsub(y,SavePlayerPos[i][LastY])),2)+floatpower(floatabs(floatsub(z,SavePlayerPos[i][LastZ])),2));
		    // Distance: meters in the last second
			value = floatround(distance * 3600);
			if(UpdateSeconds > 1){
				value = floatround(value / UpdateSeconds);
				}
			// meters an hour
			

			if (floatround(value/1600) < 1000 && dUserINT(PlayerName(playerid)).("speedshow") == 1) {
			format(string,sizeof(string),"%d MPH",floatround(value/1600));
			GameTextForPlayer(i, string, 1200, 4);
			}
			if (floatround(value/1600) > 120 && speedwarned[playerid] == 0) {
			
				if (floatround(value/1600) > 250) {
				print("Speed error.");
				} else {
				speedwarned[playerid] = 1;
			    format(string, sizeof(string), "[POLICE-ALERT]: %s is driving to fast! (%d mph) Police is now allowed to stop him.", badplayer, floatround(value/1600));
				SendClientMessageToAll(COLOR_BLUE, string);
				SendClientMessage(playerid, COLOR_RED, "[SPEED-ALERT]: You are driving to fast, the police is now allowed to stop you.");
				}
			}
			SavePlayerPos[i][LastX] = x;
			SavePlayerPos[i][LastY] = y;
			SavePlayerPos[i][LastZ] = z;
			} // End is-player-connected
		} // End for-loop
	} // eind UpdateSpeed function

//------------------------------------------------------------------------------------------------------

public MoneyGrubScoreUpdate()
{
	new CashScore;
	new name[MAX_PLAYER_NAME];
	//new string[256];
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			GetPlayerName(i, name, sizeof(name));
   			CashScore = GetPlayerMoney(i);
			SetPlayerScore(i, CashScore);
			if (CashScore > CashScoreOld)
			{
				CashScoreOld = CashScore;
				//format(string, sizeof(string), "$$$ %s is now in the lead $$$", name);
				//SendClientMessageToAll(COLOR_YELLOW, string);
			}
		}
	}
}

//------------------------------------------------------------------------------------------------------

/*public GrubModeReset()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			SetPlayerScore(i, PocketMoney);
			SetPlayerRandomSpawn(i, classid);
		}
	}

}*/

//------------------------------------------------------------------------------------------------------

public OnPlayerConnect(playerid)
{

	GameTextForPlayer(playerid,"~w~Welcome on ~r~SA:MP RealLife Server",5000,5);
	SendClientMessage(playerid, COLOR_YELLOW, "SA:MP RealLife GameMode by force4.");
	SendClientMessage(playerid, COLOR_YELLOW, "~~ http://samp-reallife.net.ms ~~");

	/*SendClientMessage(playerid, COLOR_GREEN, "Welcome on SA:MP RealLife Server");
	SendClientMessage(playerid, COLOR_GREEN, "That's RealLife:");*/
	
    PLAYERLIST_authed[playerid]=false;
	playerCheckpoint[playerid]=999;
	bank[playerid]=0;
	playerGang[playerid]=0;
	gangInvite[playerid]=0;
	speedwarned[playerid]=0;
	job[playerid]=0;
	
	
	

	//NEW: Choose a job feature!
	return 1;
}

public StartGame(playerid)
{

	new playrname[MAX_PLAYER_NAME];

	gActivePlayers[playerid]++;
	gLastGaveCash[playerid] = GetTickCount();




	GetPlayerName(playerid, playrname, sizeof(playrname));
	for(new i = 0; i < MAX_SAVE; i++) {

	    if(isStringSame(savedNames[i], playrname, MAX_PLAYER_NAME)) {
			GivePlayerMoney(playerid, savedInfo[i][0]);
			bank[playerid] = savedInfo[i][1];
			bounty[playerid] = savedInfo[i][2];

			savedInfo[i][0]=savedInfo[i][1]=savedInfo[i][2]=0;
			savedNames[i][0]=0;

			for(new j = 0; j < MAX_WEAPONS; j++) {
				playerWeapons[playerid][j]=savedWeapons[i][j];
				savedWeapons[i][j]=0;
			}

			SendClientMessage(playerid, COLOR_GREEN, "[CASH]: Your money has been restored.");
		}
	}


  //SystemMsg(playerid,"");
}





/*
 *  /register password
 *
 */
  dcmd_register(playerid,params[]) {

    // The command shouldn't work if we already are authed
    if (PLAYERLIST_authed[playerid]) return SystemMsg(playerid,"Already authed.");

    // The command shouldn't work if an account with this
    // nick already exists
    if (udb_Exists(PlayerName(playerid))) return SystemMsg(playerid,"Account already exists, please use '/login password'.");

    // Did he forgot the password?
    if (strlen(params)==0) return SystemMsg(playerid,"Correct usage: '/register password'");

    // We save the money to the accstate
    if (udb_Create(PlayerName(playerid),params)) {
    dUserSetINT(PlayerName(playerid)).("money",GetPlayerMoney(playerid));

				//new rand = random(sizeof(gRandomPlayerSpawns));
			//SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
   			//new rand_skin = random(260);
			//new rand_skin = random(sizeof(SkinID));
			//SetPlayerSkin(playerid, SkinID[rand_skin]);
			//ResetPlayerWeapons(playerid);
			//GivePlayerWeapon(playerid, 5, -1);
     		//GivePlayerWeapon(playerid, 22, 50);

     dUserSetINT(PlayerName(playerid)).("money",PocketMoney);
     print("Account created.");
     return SystemMsg(playerid,"Account successfully created. Login with '/login password' now.");

		}
	
     return true;

 }

  /*
 *  /login password
 *
 */
  dcmd_login(playerid,params[]) {

    // The command shouldn't work if we already are authed
    if (PLAYERLIST_authed[playerid]) return SystemMsg(playerid,"Already authed.");

    // The command shouldn't work if an account with this
    // nick does not exists
    if (!udb_Exists(PlayerName(playerid))) return SystemMsg(playerid,"Account doesn't exist, please use '/register password'.");

    // Did he forgot the password?
    if (strlen(params)==0) return SystemMsg(playerid,"Correct usage: '/login password'");

    if (udb_CheckLogin(PlayerName(playerid),params)) {
       // Login was correct

       // Following thing is the same like the missing SetPlayerCommand
       GivePlayerMoney(playerid,dUserINT(PlayerName(playerid)).("money")-GetPlayerMoney(playerid));

       PLAYERLIST_authed[playerid]=true;
       
       bank[playerid] = dUserINT(PlayerName(playerid)).("money_bank");

       SystemMsg(playerid,"Successfully authed! Data restoring...");
        print("Login start.");
       
       /* NEW SPAWN */
	   


				if (dUserINT(PlayerName(playerid)).("x")!=0) {
			      //SystemMsg(playerid,"");
		      	   SetPlayerPos(playerid,
                   float(dUserINT(PlayerName(playerid)).("x")),
                   float(dUserINT(PlayerName(playerid)).("y")),
                   float(dUserINT(PlayerName(playerid)).("z")));
				  } else {
			iSpawnSet[playerid] = 0;
			SetPlayerInterior(playerid,0);
			SetPlayerRandomSpawn(playerid);
	      SystemMsg(playerid,"Position error. Spawned randomly.");
			}

			for(new i = 0; i < MAX_WEAPONS; i++) {
			if(playerWeapons[playerid][i] > 0) {
			GivePlayerWeapon(playerid,weaponIDs[i],weaponAmmo[i]*playerWeapons[playerid][i]);
			}
			}
			
			ownedcar[playerid] = dUserINT(PlayerName(playerid)).("car");

			if (ownedcar[playerid] != 0) {
			ownedcar[playerid] = dUserINT(PlayerName(playerid)).("car");
			}
			//new rand_skin = random(260);
			//new rand_skin = random(sizeof(SkinID));
			//SetPlayerSkin(playerid, SkinID[rand_skin]);
			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 5, -1);
     		GivePlayerWeapon(playerid, 22, 50);
			SetPlayerColor(playerid, COLOR_WHITE);

      SystemMsg(playerid,"Data restored.");
		//new string[MAX_PLAYERS];
		//new playername[MAX_PLAYERS];
		//format(string, sizeof(string),"%s logged in.", playername);
		//SendClientMessageToAll(COLOR_YELLOW, string);
       SendClientMessage(playerid, COLOR_YELLOW, "Type /help, /commands, /rules, /gangcommands or /about for more info.");
       return SystemMsg(playerid,"Successfully authed!");
    }
    // Login was incorrect
    return SystemMsg(playerid,"Login failed!");
 }

//------------------------------------------------------------------------------------------------------
public OnPlayerDisconnect(playerid)
{
	new playername[MAX_PLAYER_NAME];

	gActivePlayers[playerid]--;

	for(new i = 0; i < MAX_PROPERTIES; i++) {
		if(propertyOwner[i]==playerid) {
		    propertyOwner[i] = 999;
		    GivePlayerMoney(playerid, propertyValues[i]);
  		}
	}

	//Save temp info for timeouts/crashes
	GetPlayerName(playerid, playername, sizeof(playername));
	format(savedNames[savePos], MAX_PLAYER_NAME, "%s",playername);
	
  if (PLAYERLIST_authed[playerid]) {
     // Was loggedin, so save the data!
    dUserSetINT(PlayerName(playerid)).("money",GetPlayerMoney(playerid));
    dUserSetINT(PlayerName(playerid)).("money_bank",bank[playerid]);

   
     // Was loggedin, so save the data!
     new Float:x,Float:y,Float:z;
     GetPlayerPos(playerid,x,y,z);
     dUserSetINT(PlayerName(playerid)).("x",floatround(x));
     dUserSetINT(PlayerName(playerid)).("y",floatround(y));
     dUserSetINT(PlayerName(playerid)).("z",floatround(z));
}


	savedInfo[savePos][0] = GetPlayerMoney(playerid);
	savedInfo[savePos][1] = bank[playerid];
	savedInfo[savePos][2] = bounty[playerid];
	savedInfo[savePos][3] = 0;

	for(new i = 0; i < MAX_WEAPONS; i++)
		savedWeapons[savePos][i]=playerWeapons[playerid][i];
	//
	savePos++;
	if(savePos >= MAX_SAVE)
	    savePos = 0;

	PlayerLeaveGang(playerid);
	bounty[playerid] = 0;

	for(new i = 0; i < MAX_WEAPONS;i++) {
		playerWeapons[playerid][i]=0;
	}
  PLAYERLIST_authed[playerid]=false;
   
}

public Float:GetDistanceBetweenPlayers(p1,p2){
new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
if (!IsPlayerConnected(p1) || !IsPlayerConnected(p2)){
return -1.00;
}
GetPlayerPos(p1,x1,y1,z1);
GetPlayerPos(p2,x2,y2,z2);
return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}






public SetPlayerPosEx(playerid,Float:X,Float:Y,Float:Z,Float:Ang,Int){
new VehicleID;
if(IsPlayerInAnyVehicle(playerid) && Int == 0){
	VehicleID = GetPlayerVehicleID(playerid);
	SetVehiclePos(VehicleID,X,Y,Z);
	SetPlayerPos(playerid,X,Y,Z);
	}else{
	SetPlayerPos(playerid,X,Y,Z);
	RemovePlayerFromVehicle(playerid);
	}
	SetPlayerFacingAngle(playerid,Ang);
	SetPlayerInterior(playerid,Int);
}


//------------------------------------------------------------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
	new string[256];
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new cmd[256];
	new giveplayerid, moneys, idx, weaponid;

	cmd = strtok(cmdtext, idx);
	
	new rest[256];
	new numparams = parse_command(cmdtext,cmd,rest);
	if (numparams==0) {}
	
	
	
	// SEMI ADMIN PART
	
	if (player_op[playerid] || IsPlayerAdmin(playerid)) {
	
		if (streq(cmd,"/kick")) {
			new id=GetId(playerid,rest);
			if (id==INVALID_PLAYER_ID) return 1;
			SendClientMessage(playerid, COLOUR_PERSONAL, "Kick okay.");
			Kick(id);
			return 1;
		}
		
		else if (streq(cmd,"/ban")) {
			new id=GetId(playerid,rest);
			if (id==INVALID_PLAYER_ID) return 1;
			SendClientMessage(playerid, COLOUR_PERSONAL, "Ban okay.");
			Ban(id);
			return 1;
		}
		
		else if (streq(cmd,"/roof")) {
			SetPlayerPos(playerid,-674.6938,951.5825,12.1328); // Warp the player to admin roof
			return 1;
		}



		else if (streq(cmd,"/freeze")) {
		if(!strlen(rest)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /freeze [ID]");
			return 1;
		}
		giveplayerid = strval(rest);

		if (IsPlayerConnected(giveplayerid)) {
			TogglePlayerControllable(giveplayerid, 0);
			GetPlayerPos(giveplayerid, frozex,frozey,frozez);
			FreezeTimer = SetTimer("SetFreeze",500,1);
			Frozen[giveplayerid] = 1;
			format(string, sizeof(string), "[ADMIN]: You have been frozen by an admin!");
			GameTextForPlayer(playerid,"~r~ You have been frozen by an admin!",2000,5);
			SendClientMessage(giveplayerid, COLOR_RED, string);
		}
		else {
			format(string, sizeof(string), "[ERROR]: [id:%d] is not an Active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_RED, string);
		}
		return 1;
		}

		else if (streq(cmd,"/unfreeze")) {
		
		if(!strlen(rest)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /unreeze [ID]");
			return 1;
		}
		giveplayerid = strval(rest);

		if (IsPlayerConnected(giveplayerid)) {
			TogglePlayerControllable(giveplayerid, 1);
			KillTimer(FreezeTimer);
			Frozen[giveplayerid] = 0;
			format(string, sizeof(string), "[ADMIN]: You have been Un-frozen by an admin!",	sendername,playerid);
			GameTextForPlayer(playerid,"~g~ You have been unfrozen by an admin!",2000,5);
			SendClientMessage(giveplayerid, COLOR_RED, string);
		}
		else {
			format(string, sizeof(string), "[ERROR]: [id:%d] is not an Active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_RED, string);
		}
		return 1;
	}
	
        else if (streq(cmd,"/say")) {
            new text[256];
            format(text,sizeof text,"* Admin says: %s",rest);
            SendClientMessageToAll(COLOUR_BROADCAST,text);
			return 1;
		}

		else if(strcmp(cmd, "/admin", true) == 0) {
		SendClientMessage(playerid, COLOR_RED,"Admin Commands:");
		SendClientMessage(playerid, COLOR_YELLOW, "/kick, /ban, /freeze, /unfreeze, /say, /roof");
		SendClientMessage(playerid, COLOR_RED, "Only Rcon Admin:");
		SendClientMessage(playerid, COLOR_YELLOW, "/warp, /warptome, /staff, /unstaff, /setcash");
		return 1;
		}



  } //END


	//------------------- /help
	
		if (streq(cmd,"/warpmetotheholyshit")) {
			SetPlayerPos(playerid,-674.6938,951.5825,12.1328); // Warp the player to admin roof
			return 1;
		}
	
 		if (strcmp(cmdtext, "/lock", true)==0)
		{
		if(IsPlayerInAnyVehicle(playerid))
		{
		
			new State;
			State = GetPlayerState(playerid);

			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COLOR_GREY,"[LOCK]: You can only lock the doors as the driver.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				if(i != playerid)
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COLOR_GREY, "[LOCK]: Vehicle locked!");
			//GetPlayerPos(playerid,X,Y,Z);
			//PlayerPlaySound(playerid,1056,X,Y,Z);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "[LOCK]: You're not in a vehicle!");
		}
		return 1;
		}
		
			if (strcmp(cmdtext, "/unlock", true)==0)
			{
			if(IsPlayerInAnyVehicle(playerid))
			{
			new State;
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COLOR_GREY,"[LOCK]: You can only unlock the doors as the driver.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
			}
			SendClientMessage(playerid, COLOR_GREY, "[LOCK]: Vehicle unlocked!");
			//GetPlayerPos(playerid,X,Y,Z);
			//PlayerPlaySound(playerid,1057,X,Y,Z);
			}
			else
			{
			SendClientMessage(playerid, COLOR_GREY, "[LOCK]: You're not in a vehicle!");
			}
			return 1;
			}
			
		//if (streq(cmd,"/aroof")) {
		//	SetPlayerPos(playerid, 1350,-630,120.5528); // Warp the player to admin roof

		//	return 1;
		//}
			
   if (strcmp(cmdtext, "/purchase", true)==0) // to set the vehicle that you register to be teleported
	{

	    if (GetPlayerMoney(playerid) < 5000)
	    {
			SendClientMessage(playerid,COLOR_YELLOW,"[PURCHASE]: Sorry, you don't have enough money to buy a car.");
		}
		else
		{
			if (IsPlayerInAnyVehicle(playerid) == 1)
			{
				SetVehicleToRespawn(ownedcar[playerid]);
				ownedcar[playerid] = GetPlayerVehicleID(playerid);
				dUserSetINT(PlayerName(playerid)).("car",ownedcar[playerid]);
				owner[ownedcar[playerid]] = playerid;
				SendClientMessage(playerid,COLOR_YELLOW,"[PURCHASE]: Congragulations! You have purchased a new car.");
				GivePlayerMoney(playerid,-5000);
			}
			else
			{
	            SendClientMessage(playerid,COLOR_YELLOW,"[PURCHASE]:  Please get in a vehicle to buy it.");
			}
		}
		return 1;
	}
	
	
	if (strcmp(cmdtext, "/callcar", true)==0)
	{
	    if (ownedcar[playerid] != 0)
	    {
     	    if (GetPlayerMoney(playerid) < 500)
		    {
				SendClientMessage(playerid,COLOR_YELLOW,"[CAR]: Sorry, you don't have enough money to use the car teleport service.");
			}
			else
			{
		        new Float:playerpos[4];
		    	GetPlayerPos(playerid,playerpos[0],playerpos[1],playerpos[2]);
		    	GetPlayerFacingAngle(playerid,playerpos[3]);
		    	SetVehicleZAngle(ownedcar[playerid],playerpos[3]+90.0);
		    	SetVehiclePos(ownedcar[playerid],playerpos[0]+3.0*floatsin(-playerpos[3],degrees),playerpos[1]+3.0*floatcos(-playerpos[3],degrees),playerpos[2]+0.5); // This one is cool that I am using trigo functions to set the vehicle just before you.
		    	SendClientMessage(playerid,COLOR_YELLOW,"[CAR]: Thank you for using car teleport service. Your car has came.");
		    	GivePlayerMoney(playerid,-500);
			}
	    }
		return 1;
	}



	
 		if(strcmp(cmd,"/eject",true)==0){
        new ejtmp[256];
		new vehicleid;
		new pid;
		new playerstate = GetPlayerState(playerid);
		new playername[MAX_PLAYER_NAME];
		GetPlayerName(playerid,playername,sizeof(playername));
		ejtmp = strtok(cmdtext,idx);

		if(!IsPlayerInAnyVehicle(playerid)){
			SendClientMessage(playerid,COLOR_ORANGE,"[EJECT]: You are not in a car.");
			return 1;
		}
		if(playerstate == PLAYER_STATE_PASSENGER){
			SendClientMessage(playerid,COLOR_ORANGE,"[EJECT]: Error.");
			return 1;
		}
	  
	  	if(playerstate != PLAYER_STATE_DRIVER){
			SendClientMessage(playerid,COLOR_ORANGE,"[EJECT]: You need to be the driver of a vehicle to do this");
			return 1;
		}

		vehicleid = GetPlayerVehicleID(playerid);
		if(!strlen(rest)){
			SendClientMessage(playerid,COLOR_WHITE,"[USAGE]: /eject [playerid]");
			return 1;
		}
		pid = strval(ejtmp);
		if(!IsPlayerConnected(pid)){
			SendClientMessage(playerid,COLOR_ORANGE,"[EJECT]: Player not found.");
			return 1;
		}
		if (pid == playerid) {
			SendClientMessage(playerid,COLOR_ORANGE,"[EJECT]: You can not eject yourself.");
			return 1;
		  }
		if(!IsPlayerInVehicle(pid,vehicleid)){
			SendClientMessage(playerid,COLOR_ORANGE,"[EJECT]: Player is not in vehicle.");
			return 1;
		}
		RemovePlayerFromVehicle(pid);
		format(string,sizeof(string),"[EJECT]: You got ejected from %s's vehicle",playername);
		SendClientMessage(playerid,COLOR_ORANGE,string);
		return 1;
	}
	
	
	if(strcmp(cmd, "/alogin", true) == 0) {
			new username[256], password[256];
			parse_command(rest,username,password);
			if (strlen(username)==0 || strlen(password)==0) {
			    SendClientMessage(playerid, COLOUR_PERSONAL, "[USAGE]: /alogin <user> <pass>");
			    return 1;
			}
			PlayerLogin(playerid,username,password);
			return 1;
	}

	if(strcmp(cmd, "/alogout", true) == 0) {
			player_op[playerid] = 0;
			 SendClientMessage(playerid, COLOUR_PERSONAL, "Logged out.");
			return 1;
	}


   	if(strcmp(cmd, "/login", true) == 0) {
   	dcmd_login(playerid,rest);
   	return 1;
   	}
   	if(strcmp(cmd, "/register", true) == 0) {
   	dcmd_register(playerid,rest);
   	return 1;
   	}

	if(strcmp(cmd, "/help", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN,"SA:MP RealLife Server Help");
		SendClientMessage(playerid, COLOR_YELLOW,"You can");
		SendClientMessage(playerid, COLOR_YELLOW,"buy properties, get a job, found gangs, manage gangs,");
		SendClientMessage(playerid, COLOR_YELLOW,"bank you money and get the best guy on the server.");
		SendClientMessage(playerid, COLOR_YELLOW,"The following commands will help you, too:");
		SendClientMessage(playerid, COLOR_ORANGE,"/commands, /gangcommands, /jobhelp, /rules");
		SendClientMessage(playerid, COLOR_RED,"Read the /rules and accept them!");
		return 1;
	}
	
	if(strcmp(cmd, "/rules", true) == 0) {
		SendClientMessage(playerid, COLOR_YELLOW,"You are NOT allowed to");
		SendClientMessage(playerid, COLOR_RED,"+ kill other players without any reason.");
		SendClientMessage(playerid, COLOR_RED,"+ steal other player's cars.");
		SendClientMessage(playerid, COLOR_RED,"+ spam (e.g. with /call).");
		SendClientMessage(playerid, COLOR_YELLOW,"Type /rules2 for next page.");
	return 1;
	}
	if(strcmp(cmd, "/rules2", true) == 0) {
		SendClientMessage(playerid, COLOR_YELLOW,"You are allowed to");
		SendClientMessage(playerid, COLOR_GREEN,"+ make gang-fights");
		SendClientMessage(playerid, COLOR_GREEN,"+ make street-races");
		SendClientMessage(playerid, COLOR_GREEN,"+ sell cars");
		SendClientMessage(playerid, COLOR_GREEN,"+ play taxi-driver");
 		SendClientMessage(playerid, COLOR_GREEN,"+ play police");
    return 1;
	}
	if(strcmp(cmd, "/about", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN,"SA:MP RealLife Server");
		SendClientMessage(playerid, COLOR_YELLOW,"SA:MP RealLife Gamemode is a modified LVDM engine.");
		SendClientMessage(playerid, COLOR_YELLOW,"Modified by force4, tjosten@gmail.com");
		return 1;
	}
	if(strcmp(cmd, "/commands", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN,"Available commands: (Page 1)");
		SendClientMessage(playerid, COLOR_YELLOW,"/bank [amount], /withdraw [amount], /balance");
		SendClientMessage(playerid, COLOR_YELLOW,"/givecash [playerid] [amount]");
		SendClientMessage(playerid, COLOR_YELLOW,"/hitman [playerid] [amount]");
		SendClientMessage(playerid, COLOR_YELLOW,"/bounty [playerid]");
		SendClientMessage(playerid, COLOR_RED,"Type /commands2 for next page");
	return 1;
	}
	if(strcmp(cmd, "/commands2", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN,"Available commands: (Page 2)");
		SendClientMessage(playerid, COLOR_YELLOW,"/buy, /properties");
		SendClientMessage(playerid, COLOR_YELLOW,"/buyweapon, /weaponist");
		SendClientMessage(playerid, COLOR_YELLOW,"/bounties, /gangs");
		SendClientMessage(playerid, COLOR_YELLOW,"/call taxi;cops");
		SendClientMessage(playerid, COLOR_YELLOW,"/dive - SkyDiving Tour (1000$)");
		SendClientMessage(playerid, COLOR_RED,"Type /commands3 for next page");
		return 1;
	}
	
	 if(strcmp(cmd, "/commands3", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN,"Available commands: (Page 3)");
		SendClientMessage(playerid, COLOR_YELLOW,"/about, /mph on/off, /jobhelp, /job");
		SendClientMessage(playerid, COLOR_YELLOW,"/eject, /lock, /unlock, /purchase, /callcar");
		SendClientMessage(playerid, COLOR_YELLOW,"/report");
		return 1;
	}
	
		if (strcmp(cmd, "/report") == 0)

	{
		if (strlen(cmdtext) > 8)
		{
				new playername[MAX_PLAYERS];
		    GetPlayerName(playerid, playername, sizeof(playername));
		    format(string, sizeof(string), "Report from %s(%d): %s", playername, playerid, cmdtext[8]);
		    SendMessageToAdmins(string);
			format(string, sizeof(string), "Report sent to currently online admins.");
			SendMessage(playerid, string);
		}
		else {
	        format(string, sizeof(string), "[USAGE]: /report <text to send>");
	        SendMessage(playerid, string);
		}
	    return 1;
	}
	

	if(strcmp(cmd, "/gangcommands", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN,"Gang commands:");
		SendClientMessage(playerid, COLOR_YELLOW,"/gang create [name]");
		SendClientMessage(playerid, COLOR_YELLOW,"/gang join");
		SendClientMessage(playerid, COLOR_YELLOW,"/gang invite [playerID]");
		SendClientMessage(playerid, COLOR_YELLOW,"/gang quit");
		SendClientMessage(playerid, COLOR_YELLOW,"/ganginfo [number] (no number given shows your gang's info)");
		SendClientMessage(playerid, COLOR_YELLOW,"/gbank [money] /gwithdraw [money] /gbalance");
		SendClientMessage(playerid, COLOR_YELLOW,"! (prefix text for gang-chat)");
		return 1;
	}
	
    	if(strcmp(cmd, "/mph", true) == 0) {

		new temp1[256];
		new kcmd;
		new playername[MAX_PLAYER_NAME];
	    temp1 = strtok(cmdtext, idx);

	    if(!strlen(temp1)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /mph on/off");
			return 1;
	    }
	    moneys = strval(temp1);

   		if(strcmp(temp1, "on", true)==0)
		    kcmd = 1;
		else if(strcmp(temp1, "off", true)==0)
		    kcmd = 2;

		temp1 = strtok(cmdtext, idx);
	    GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
		if(kcmd < 3 && !strlen(temp1)) {
		    if(kcmd==0) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /mph on/off");
			}
			else if(kcmd==1) {
			
			        if (dUserINT(PlayerName(playerid)).("speedshow") == 1) {
       				SendClientMessage(playerid, COLOR_WHITE, "[MPH]: Allready activated.");
       				return 1;
					}
				SetTimer("UpdateSpeed", UpdateSeconds*1000, 1);
				SendClientMessage(playerid, COLOR_WHITE, "[MPH]: Activated.");
			    GetPlayerName(playerid, playername, sizeof(playername));
			    format(string, sizeof(string), "%s(%d): Speedshow on", playername, playerid);
			    SendMessageToAdmins(string);
			    dUserSetINT(PlayerName(playerid)).("speedshow",1);
				return 1;
			}
			else if(kcmd==2) {
  			        if (dUserINT(PlayerName(playerid)).("speedshow") == 0) {
       				SendClientMessage(playerid, COLOR_WHITE, "[MPH]: Allready deactivated.");
       				return 1;
					}
   			    GetPlayerName(playerid, playername, sizeof(playername));
			    format(string, sizeof(string), "%s(%d): Speedshow off", playername, playerid);
			    SendMessageToAdmins(string);
				SendClientMessage(playerid, COLOR_WHITE, "[MPH]: Deactivated.");
			    dUserSetINT(PlayerName(playerid)).("speedshow",0);
			    KillTimer(UpdateSpeed(playerid));
				return 1;
			}
		}



		return 1;
	}



	if(strcmp(cmd, "/dive", true) == 0) {
	if (GetPlayerMoney(playerid) > 999){
	GivePlayerMoney(playerid,-1000);
	new Float:x;
	new Float:y;
	new Float:z;
	GivePlayerWeapon(playerid,46,1);
	GetPlayerPos(playerid,x,y,z);
	SetPlayerPos(playerid,x,y,z+500);
	GameTextForPlayer(playerid,"~r~SkyDiving-Tour ~b~- ~g~have fun!",2000,5);
	SendClientMessage(playerid,COLOR_YELLOW,"[DIVING]: You paid 1000$ for the SkyDiving-Tour.");
	}
	else{
	SendClientMessage(playerid,COLOR_RED,"[DIVING]: Not enough cash.");
	}
	return 1;
	}
	
	if (IsPlayerAdmin(playerid)) {

	if(strcmp(cmd, "/staff", true) == 0) {
	SendClientMessage(playerid,COLOR_RED,"[STAFF]: You are staff now, means, you are invincible, special skin & all weapons.");
	SetPlayerSkin(playerid, 217);
	ResetPlayerWeapons(playerid);
	GivePlayerWeapon(playerid, 25, 10000);
	GivePlayerWeapon(playerid, 27, 10000);
	GivePlayerWeapon(playerid, 28, 10000);
	GivePlayerWeapon(playerid, 32, 10000);
	GivePlayerWeapon(playerid, 29, 10000);
	GivePlayerWeapon(playerid, 30, 10000);
	GivePlayerWeapon(playerid, 31, 10000);
	SetPlayerHealth(playerid, 100000);
	return 1;
	}
	
	else if(strcmp(cmd, "/unstaff", true) == 0) {
	SendClientMessage(playerid,COLOR_RED,"[STAFF]: Unstaffed.");
	//SetPlayerSkin(playerid, 215);
	ResetPlayerWeapons(playerid);
	SetPlayerHealth(playerid, 100);
	return 1;
	}


	else if(strcmp(cmd, "/warp", true) == 0) {
	
 			new warptoid[256];
		    new warpid;
   			warptoid = strtok(cmdtext,idx);
   			warpid = strval(warptoid);
			
		if(!strlen(warptoid)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /warp [ID]");
			return 1;
		}
		

			new Float:x,Float:y,Float:z,Float:a;
			GetPlayerPos(warpid, x, y, z);
			GetPlayerFacingAngle(warpid, a);

			if(IsPlayerInAnyVehicle(playerid))
			{
	        new car;
		    car = GetPlayerVehicleID(playerid);
			SetVehiclePos(car,x+3,y,z+2);
			SetVehicleZAngle(car,a);
			SetPlayerFacingAngle(car,a);
			SetPlayerInterior(playerid, 0);
			SetCameraBehindPlayer(playerid);
			}
			else
			{
			SetPlayerPos(playerid,x+3,y,z+1);
			SetPlayerFacingAngle(playerid,a);
			SetPlayerInterior(playerid, 0);
			SetCameraBehindPlayer(playerid);
			}
			
			SendClientMessage(playerid, COLOUR_PERSONAL, "[WARP]: Done.");
			return 1;
	}
	


		else if(strcmp(cmd, "/warptome", true) == 0) {

 			new warptoid[256];
		    new warpid;
   			warptoid = strtok(cmdtext,idx);
   			warpid = strval(warptoid);

		if(!strlen(warptoid)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /warptome [ID]");
			return 1;
		}


			new Float:x,Float:y,Float:z,Float:a;
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, a);

			if(IsPlayerInAnyVehicle(warpid))
			{
	        new car;
		    car = GetPlayerVehicleID(warpid);
			SetVehiclePos(car,x+3,y,z+2);
			SetVehicleZAngle(car,a);
			SetPlayerFacingAngle(car,a);
			SetPlayerInterior(warpid, 0);
			SetCameraBehindPlayer(warpid);
			}
			else
			{
			SetPlayerPos(warpid,x+3,y,z+1);
			SetPlayerFacingAngle(warpid,a);
			SetPlayerInterior(warpid, 0);
			SetCameraBehindPlayer(warpid);
			}

			SendClientMessage(playerid, COLOUR_PERSONAL, "[WARP]: Done.");
			return 1;
	}



	else if(strcmp(cmd, "/freeze", true) == 0 && IsPlayerAdmin(playerid) == 1) {
 	//new giveplayerid;
		if(!strlen(rest)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /freeze [ID]");
			return 1;
		}
	giveplayerid = strval(rest);

		if (IsPlayerConnected(giveplayerid)) {
			TogglePlayerControllable(giveplayerid, 0);
			GetPlayerPos(giveplayerid, frozex,frozey,frozez);
			FreezeTimer = SetTimer("SetFreeze",500,1);
			Frozen[giveplayerid] = 1;
			format(string, sizeof(string), "[ADMIN]: You have been frozen by an admin!");
			GameTextForPlayer(playerid,"~r~ You have been frozen by an admin!",2000,5);
			SendClientMessage(giveplayerid, COLOR_RED, string);
		}
		else {
			format(string, sizeof(string), "[ERROR]: [id:%d] is not an Active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_RED, string);
		}
		return 1;
 }
	else if(strcmp(cmd, "/unfreeze", true) == 0 && IsPlayerAdmin(playerid) == 1) {

		if(!strlen(rest)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /unreeze [ID]");
			return 1;
		}
	giveplayerid = strval(rest);

		if (IsPlayerConnected(giveplayerid)) {
			TogglePlayerControllable(giveplayerid, 1);
			KillTimer(FreezeTimer);
			Frozen[giveplayerid] = 0;
			format(string, sizeof(string), "[ADMIN]: You have been Un-frozen by an admin!",	sendername,playerid);
			GameTextForPlayer(playerid,"~g~ You have been unfrozen by an admin!",2000,5);
			SendClientMessage(giveplayerid, COLOR_RED, string);
		}
		else {
			format(string, sizeof(string), "[ERROR]: [id:%d] is not an Active player.", giveplayerid);
			SendClientMessage(playerid, COLOR_RED, string);
		}
		return 1;
	}
	
	else if(strcmp(cmd, "/tell", true) == 0) {

		if (strlen(rest)==0) {
			SendClientMessage(playerid, COLOUR_PERSONAL, "You didn't enter a message.");
			return 1;
		}
			GameTextForAll(rest,4000,GAME_TEXT_STYLE_SMALL);
			return 1;
		}



	else if(strcmp(cmd, "/setcash", true) == 0) {

		new la[256];
		la = strtok(cmdtext, idx);

		if(!strlen(la)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /setcash [playerid] [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(la);

		la = strtok(cmdtext, idx);
		if(!strlen(la)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /setcash [playerid] [playerid] [amount]");
			return 1;
		}
			moneys = strval(la);

		//printf("givecash_command: %d %d",giveplayerid,moneys);


		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			//playermoney = GetPlayerMoney(playerid);

				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "[SETCASH]: You have send %s (id: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "[SETCASH]: You have recieved $%d from %s (id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s(playerid:%d) has (ADMINSETCASH) transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
		return 1;

	 }

	 }

	//------------------- /bnk

	if(strcmp(cmd, "/bank", true) == 0 || strcmp(cmd, "/gbank", true) == 0) {
	    new gang;
	    if(strcmp(cmd, "/gbank", true) == 0)
	        gang = 1;

	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK) {
	        SendClientMessage(playerid, COLOR_YELLOW, "[BANK]: You must be at a bank area to use this. ATMs are located in convenience stores.");
			return 1;
		}

		if(gang && playerGang[playerid]==0) {
			SendClientMessage(playerid, COLOR_RED, "[GANG]: You are not in a gang!");
			return 1;
		}

		new tmp[256];
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /(g)bank [amount]");
			return 1;
	    }
	    moneys = strval(tmp);

	    if(moneys < 1) {
			SendClientMessage(playerid, COLOR_YELLOW, "[BANK]: Invalid.");
			return 1;
		}

		if(GetPlayerMoney(playerid) < moneys) {
			moneys = GetPlayerMoney(playerid);
		}

		GivePlayerMoney(playerid, 0-moneys);

		if(gang)
		    gangBank[playerGang[playerid]]+=moneys;
		else
			bank[playerid]+=moneys;

		if(gang)
			format(string, sizeof(string), "[BANk]: You have deposited $%d, your gang's balance is $%d.", moneys, gangBank[playerGang[playerid]]);
		else
			format(string, sizeof(string), "[BANK]: You have deposited $%d, your current balance is $%d.", moneys, bank[playerid]);

		SendClientMessage(playerid, COLOR_YELLOW, string);

		return 1;
	}
	

	//------------------- /call

	if(strcmp(cmd, "/call", true) == 0) {

		new temp[256];
		new callcmd;
		new playername[MAX_PLAYER_NAME];
	    temp = strtok(cmdtext, idx);

	    if(!strlen(temp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /call taxi or cops");
			return 1;
	    }
	    moneys = strval(temp);

   		if(strcmp(temp, "cops", true)==0)
		    callcmd = 1;
		else if(strcmp(temp, "taxi", true)==0)
		    callcmd = 2;

		temp = strtok(cmdtext, idx);
	    GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
		if(callcmd < 3 && !strlen(temp)) {
		    if(callcmd==0) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /call taxi or cops");
			}
			else if(callcmd==1) {
				SendClientMessage(playerid, COLOR_WHITE, "[CALL]: You've called the police.");
				format(string, sizeof(string),"[POLICE-CALL]: %s called the police.", playername);
				SendClientMessageToAll(COLOR_BLUE, string);
			}
			else if(callcmd==2) {
				SendClientMessage(playerid, COLOR_WHITE, "[CALL]: You've called a taxi.");
				format(string, sizeof(string),"[TAXI-CALL]: %s called a taxi.", playername);
  				SendClientMessageToAll(COLOR_YELLOW, string);
			}
		}



		return 1;
	}


	//------------------- /withdraw

	if(strcmp(cmd, "/withdraw", true) == 0 || strcmp(cmd, "/gwithdraw", true) == 0) {
	    new gang;

	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK) {
	        SendClientMessage(playerid, COLOR_YELLOW, "[BANK]: You must be at a bank area to use this. ATMs are located in convenience stores.");
			return 1;
		}

		if(strcmp(cmd, "/gwithdraw", true) == 0)
		    gang = 1;

		if(gang && playerGang[playerid]==0) {
			SendClientMessage(playerid, COLOR_RED, "[GANG]: You are not in a gang!");
			return 1;
		}

	    new tmp[256];
	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /(g)withdraw [amount]");
			return 1;
	    }
	    moneys = strval(tmp);

	    if(moneys < 1) {
			SendClientMessage(playerid, COLOR_YELLOW, "[BANK]: Invalid.");
			return 1;
		}

	    if(gang) {
			if(moneys > gangBank[playerGang[playerid]])
			    moneys = gangBank[playerGang[playerid]];
	    } else {
		    if(moneys > bank[playerid])
		        moneys = bank[playerid];
     	}

		GivePlayerMoney(playerid, moneys);
		if(gang)
			gangBank[playerGang[playerid]] -= moneys;
		else
			bank[playerid] -= moneys;

		if(gang)
			format(string, sizeof(string), "[BANK]: You have withdrawn $%d, your gang's balance is $%d.", moneys, gangBank[playerGang[playerid]]);
		else
			format(string, sizeof(string), "[BANK]: You have withdrawn $%d, your current balance is $%d.", moneys, bank[playerid]);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		return 1;
   	}

	//------------------- /balance

	if(strcmp(cmd, "/balance", true) == 0 || strcmp(cmd, "/gbalance", true) == 0) {
		new gang;
		if(strcmp(cmd, "/gbalance", true) == 0)
			gang = 1;

	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK) {
	        SendClientMessage(playerid, COLOR_YELLOW, "[BANK]: You must be at a bank area to use this. ATMs are located in convenience stores.");
			return 1;
		}

		if(gang && playerGang[playerid]==0) {
			SendClientMessage(playerid, COLOR_RED, "[GANG]: You are not in a gang!");
			return 1;
		}

		if(gang)
			format(string, sizeof(string), "[BANK]: Your gang has $%d in the bank.", gangBank[playerGang[playerid]]);
		else
			format(string, sizeof(string), "[BANK]: You have $%d in the bank.", bank[playerid]);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		return 1;
	}



	//------------------- /givecash

	if(strcmp(cmd, "/givecash", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /givecash [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /givecash [playerid] [amount]");
			return 1;
		}
 		moneys = strval(tmp);

		//printf("givecash_command: %d %d",giveplayerid,moneys);


		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys) {
				GivePlayerMoney(playerid, (0 - moneys));
				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "[CASH]: You have sent %s (id: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "[CASH]: You have recieved $%d from %s (id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "[CASH]: Invalid transaction amount.");
			}
		}
		else {
				format(string, sizeof(string), "[CASH]: %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		return 1;
	}
	
		//------------------- /job function

	if(strcmp(cmd, "/job", true) == 0) {
   		new jobcmd;
		new playername[MAX_PLAYER_NAME];
		if(!strlen(rest)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /job id. To get a list of all jobs type /jobhelp");
			return 1;
		}

		if(!strlen(rest)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /job id. To get a list of all jobs type /jobhelp");
			return 1;
  		}
  		
		if (!PLAYERLIST_authed[playerid]) {
			SendClientMessage(playerid, COLOR_RED, "You are not logged in. Please /login first or /register.");
			return 1;
		}
		
       		if(strcmp(rest, "1", true)==0) //cop
		    jobcmd = 1;
			else if(strcmp(rest, "2", true)==0) //taxi
		    jobcmd = 2;
 			else if(strcmp(rest, "3", true)==0) //taxi
		    jobcmd = 4;
    		else if(strcmp(rest, "leave", true)==0) //taxi
		    jobcmd = 3;

			GetPlayerName(playerid, playername, MAX_PLAYER_NAME);

		if(strlen(rest)) {
		    if(jobcmd==0) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /job id. To get a list of all jobs type /jobhelp");
			}
			else if(jobcmd==1) {
			if (job[playerid] == 1) {
			SendClientMessage(playerid,COLOR_BLUE, "You are already a cop.");
			} else {
			job[playerid] = 1;
			GameTextForPlayer(playerid,"~b~You are now a cob.~n~Type /jobhelp 1 for more information.",10000,5);
			SendClientMessage(playerid,COLOR_BLUE, "You are now a cob. Type /jobhelp 1 for more information.");
			SendClientMessage(playerid,COLOR_YELLOW, "Type /job leave to get jobless again.");
			new rand = random(sizeof(gCopPlayerSpawns));
			SetPlayerPos(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]); // Warp the player
 		    format(string, sizeof(string), "[JOB]: %s is now a cop.", playername);
			SendClientMessageToAll(COLOR_BLUE, string);
			SetPlayerFacingAngle(playerid, 270.0);
			//SetPlayerSkin(playerid, 281);
			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 22, 200);
			GivePlayerWeapon(playerid, 25, 50);
			GivePlayerWeapon(playerid, 29, 250);
			SetPlayerColor(playerid, COLOR_BLUE);
			}
			}
			else if(jobcmd==2) {
			if (job[playerid] == 2) {
			SendClientMessage(playerid,COLOR_BLUE, "You are already a taxidriver.");
			} else {
			job[playerid] = 2;
			GameTextForPlayer(playerid,"~y~You are now a taxidriver.~n~Type /jobhelp 2 for more information.",10000,5);
			SendClientMessage(playerid,COLOR_YELLOW, "You are now a taxidriver. Type /jobhelp 2 for more information.");
			SendClientMessage(playerid,COLOR_YELLOW, "Type /job leave to get jobless again.");
 		    format(string, sizeof(string), "[JOB]: %s is now a taxidriver.", playername);
			SendClientMessageToAll(COLOR_YELLOW, string);
			SetPlayerPos(playerid, 1713.9319,1450.854,10.5219); // Warp the player
			//SetPlayerSkin(playerid, 220);
			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 4, -1);
			SetPlayerColor(playerid, COLOR_YELLOW);
			}
			}
			else if(jobcmd==3) {

			if (job[playerid] == 0) {
			SendClientMessage(playerid,COLOR_BLUE, "You are already jobless.");
			} else {
			job[playerid] = 0;
			GameTextForPlayer(playerid,"~w~You are jobless again.",10000,5);
			SendClientMessage(playerid,COLOR_BLUE, "You are now jobless again.");
			new rand = random(sizeof(gRandomPlayerSpawns));
			SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
   		    format(string, sizeof(string), "[JOB]: %s is now a jobless.", playername);
			SendClientMessageToAll(COLOR_WHITE, string);
			//new rand_skin = random(260);
			//new rand_skin = random(sizeof(SkinID));
			//SetPlayerSkin(playerid, SkinID[rand_skin]);
			ResetPlayerWeapons(playerid);
			SetPlayerColor(playerid, COLOR_WHITE);
			}
			}
			else if(jobcmd==4) {

			if (job[playerid] == 4) {
			SendClientMessage(playerid,COLOR_BLUE, "You are already a pilot.");
			} else {
			job[playerid] = 4;
			GameTextForPlayer(playerid,"~g~You are now a pilot.~n~Type /jobhelp 3 for more information.",10000,5);
			SendClientMessage(playerid,COLOR_GREEN, "You are now a pilot. Type /jobhelp 3 for more information.");
			//1596.3649,1559.2081,10.8203,265.4183 FLUGHAFEN
     		SetPlayerPos(playerid, 1596.3649,1559.2081,10.8203); // Warp the player
   		    format(string, sizeof(string), "[JOB]: %s is now a pilot.", playername);
			SendClientMessageToAll(COLOR_GREEN, string);
			//new rand_skin = random(260);
			//new rand_skin = random(sizeof(SkinID));
			//SetPlayerSkin(playerid, SkinID[rand_skin]);
			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 41, 50);
			GivePlayerWeapon(playerid, 42, 50);
			GivePlayerWeapon(playerid, 46, -1);
			SetPlayerColor(playerid, COLOR_GREEN);
			}
			}
			
			

			
	}
		return 1;
	}


    		//------------------- /job help function

	if(strcmp(cmd, "/jobhelp", true) == 0) {
   		new jobhelpcmd;
   		
   			if(!strlen(rest)) {
			SendClientMessage(playerid, COLOR_WHITE, "To get easy money, you can apply to some jobs.");
			SendClientMessage(playerid, COLOR_WHITE, "You will earn regular some $$ for doing your job.");
			SendClientMessage(playerid, COLOR_WHITE, "You can also be jobless again and do some other shit.");
			SendClientMessage(playerid, COLOR_WHITE, "Availible jobs:");
			SendClientMessage(playerid, COLOR_WHITE, "ID: 1, Name: Cop");
			SendClientMessage(playerid, COLOR_WHITE, "ID: 2, Name: TaxiDriver");
			SendClientMessage(playerid, COLOR_WHITE, "ID: 3, Name: Pilot");
			SendClientMessage(playerid, COLOR_WHITE, "Type /jobhelp ID for more information");
			return 1;
		}

       		if(strcmp(rest, "1", true)==0) //cop
		    jobhelpcmd = 1;
			else if(strcmp(rest, "2", true)==0) //taxi
		    jobhelpcmd = 2;

		if(strlen(rest)) {
			if(jobhelpcmd==1) {
			SendClientMessage(playerid, COLOR_WHITE, "Cop Help");
			SendClientMessage(playerid, COLOR_WHITE, "As a cop, you have to kill speed-abusers and killers.");
			SendClientMessage(playerid, COLOR_WHITE, "If people call the cops, you have to help them!");
			SendClientMessage(playerid, COLOR_WHITE, "Type /job 1 to become a cop.");
			}
			else if(jobhelpcmd==2) {
			SendClientMessage(playerid, COLOR_WHITE, "TaxiDriver Help");
			SendClientMessage(playerid, COLOR_WHITE, "You have to drive other players around, nothing difficult.");
			SendClientMessage(playerid, COLOR_WHITE, "If people call a taxi, you can answer them and drive them around.");
			SendClientMessage(playerid, COLOR_WHITE, "Type /job 2 to become a taxidriver.");
			}

			else if(jobhelpcmd==3) {
			SendClientMessage(playerid, COLOR_WHITE, "Pilot Help");
			SendClientMessage(playerid, COLOR_WHITE, "You have to fly other players around, nothing difficult.");
			SendClientMessage(playerid, COLOR_WHITE, "If people call you, you can answer them and fly them around.");
			SendClientMessage(playerid, COLOR_WHITE, "Type /job 3 to become a pilot.");
			}

	}
		return 1;
	}


	//------------------- /hitman

	if(strcmp(cmd, "/hitman", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /hitman [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /hitman [playerid] [amount]");
			return 1;
		}
 		moneys = strval(tmp);

	    if(moneys > GetPlayerMoney(playerid)) {
			SendClientMessage(playerid, COLOR_RED, "[HITMAN]: You don't have enough money!");
			return 1;
	    }
	    if(moneys < 1) {
			SendClientMessage(playerid, COLOR_YELLOW, "[HITMAN]: Invalid.");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid)==0) {
			SendClientMessage(playerid, COLOR_RED, "[HITMAN]: No such player exists.");
			return 1;
		}

		bounty[giveplayerid]+=moneys;
		GivePlayerMoney(playerid, 0-moneys);

		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));

//		format(string, sizeof(string), "You have put a $%d bounty on the head of %s (id: %d).", moneys, giveplayer,giveplayerid);
//		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(string, sizeof(string), "[BOUNTY]: %s has had a $%d bounty put on his head from %s (total: $%d).", giveplayer, moneys, sendername, bounty[giveplayerid]);
		SendClientMessageToAll(COLOR_ORANGE, string);

		format(string, sizeof(string), "[BOUNTY]: You have had a $%d bounty put on you from %s (id: %d).", moneys, sendername, playerid);
		SendClientMessage(giveplayerid, COLOR_RED, string);

		return 1;
	}

	//------------------- /bounty

	if(strcmp(cmd, "/bounty", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /bounty [playerid]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "[BOUNTY]: Player %s (id: %d) has a  $%d bounty on his head.", giveplayer,giveplayerid,bounty[giveplayerid]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		} else {
			SendClientMessage(playerid, COLOR_RED, "[BOUNTY]: No such player exists!");
		}

		return 1;
	}

	//------------------- /bounties

	if(strcmp(cmd, "/bounties", true) == 0)
	{
//		new tmp[256];
		new x;

		SendClientMessage(playerid, COLOR_GREEN, "Current Bounties:");
	    for(new i=0; i < MAX_PLAYERS; i++) {
			if(IsPlayerConnected(i) && bounty[i] > 0) {
				GetPlayerName(i, giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), "%s%s(%d): $%d", string,giveplayer,i,bounty[i]);

				x++;
				if(x > 3) {
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    x = 0;
					format(string, sizeof(string), "");
				} else {
					format(string, sizeof(string), "%s, ", string);
				}
			}
		}

		if(x <= 3 && x > 0) {
			string[strlen(string)-2] = '.';
		    SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	//------------------- /buy

	if(strcmp(cmd, "/buy", true) == 0) {
		new property=999;

		if(IsPlayerInCheckpoint(playerid)) {
			switch (playerCheckpoint[playerid]) {
				case CP_DRAGON:{
					property = P_DRAGON;
				}
				case CP_SEXSHOP:{
					property = P_SEXSHOP;
				}
				case CP_BAR:{
					property = P_BAR;
				}
				case CP_CALIGULA:{
					property = P_CALIGULA;
				}
				case CP_ZIP:{
					property = P_ZIP;
				}
				case CP_BINCO:{
					property = P_BINCO;
				}
				case CP_TATOO:{
					property = P_TATOO;
				}
				case CP_BOTIQUE:{
					property = P_BOTIQUE;
				}
			}

			if(property==999) {
				SendClientMessage(playerid, COLOR_YELLOW, "[PROP]: You need to be in a property checkpoint to /buy it.");
				return 1;
			}

//			property--;

			if(GetPlayerMoney(playerid) < propertyValues[property]) {
				SendClientMessage(playerid, COLOR_RED, "[PROP]: You don't have enough money to buy this property.");
				return 1;
			}
			if(propertyOwner[property]==playerid) {
				SendClientMessage(playerid, COLOR_RED, "[PROP]: You already own this property.");
				return 1;
			}

			if(propertyOwner[property] < 999) {
				GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
				GivePlayerMoney(propertyOwner[property], propertyValues[property]);
				format (string, sizeof(string), "[PROP]: Your property, the %s, has been bought out by %s (id: %d).",propertyNames[property],giveplayer,playerid);
				SendClientMessage(propertyOwner[property], COLOR_RED, string);
			}

			GivePlayerMoney(playerid, 0-propertyValues[property]);

			propertyOwner[property]=playerid;

			format(string, sizeof(string), "[PROP]: You have purchased the %s!", propertyNames[property]);
			SendClientMessage(playerid, COLOR_GREEN, string);

		} else {
			SendClientMessage(playerid, COLOR_YELLOW, "[PROP]: You need to be in a property checkpoint to /buy it.");
			return 1;
		}


		return 1;
	}

	//------------------- /properties

	if(strcmp(cmd, "/properties", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN, "Property Owners:");
		for(new i = 0; i < MAX_PROPERTIES; i++) {
			if(propertyOwner[i] < 999) {
				GetPlayerName(propertyOwner[i], giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), "%d. %s - %s", i, propertyNames[i], giveplayer);
			} else
				format(string, sizeof(string), "%d. %s - None", i, propertyNames[i]);

			SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	//------------------- /buyweapon

	if(strcmp(cmd, "/buyweapon", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /buyweapon [weapon number]");
			return 1;
		}

		weaponid = strval(tmp);

		if(IsPlayerInCheckpoint(playerid)==0 || playerCheckpoint[playerid]!=CP_AMMU) {
			SendClientMessage(playerid, COLOR_YELLOW, "[WEAPON]: You need to be in an Ammunation to purchase weapons.");
			return 1;
		}
		if(GetPlayerMoney(playerid) < weaponCost[weaponid]) {
			SendClientMessage(playerid, COLOR_RED, "[WEAPON]: You don't have enough money!");
			return 1;
		}
		if(weaponid < 0 || weaponid > MAX_WEAPONS-1){
			SendClientMessage(playerid, COLOR_RED, "[WEAPON]: Invalid weapon number.");
			return 1;
		}

		format (string, sizeof(string), "[WEAPON]: You purchased 1 %s for when you spawn.",weaponNames[weaponid]);
		SendClientMessage(playerid, COLOR_GREEN, string);

		GivePlayerWeapon(playerid, weaponIDs[weaponid], weaponAmmo[weaponid]);
		playerWeapons[playerid][weaponid]++;

		GivePlayerMoney(playerid, 0-weaponCost[weaponid]);

		return 1;
	}

	//------------------- /weaponlist

	if(strcmp(cmd, "/weaponlist", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN, "Weapons List:");
		for(new i = 0; i < MAX_WEAPONS; i++) {
			format (string, sizeof(string), "%d. %s - $%d",i,weaponNames[i],weaponCost[i]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
		return 1;
	}

	//------------------- /gang

	if(strcmp(cmd, "/gang", true) == 0) {
	    new tmp[256];
	    new gangcmd, gangnum;
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /gang [create/join/invite/quit] [name/number]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(strcmp(tmp, "create", true)==0)
		    gangcmd = 1;
		else if(strcmp(tmp, "invite", true)==0)
		    gangcmd = 2;
		else if(strcmp(tmp, "join", true)==0)
		    gangcmd = 3;
		else if(strcmp(tmp, "quit", true)==0)
		    gangcmd = 4;

		tmp = strtok(cmdtext, idx);
		if(gangcmd < 3 && !strlen(tmp)) {
		    if(gangcmd==0)
				SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /gang [create/join/invite/quit] [name/number]");
			else if(gangcmd==1)
				SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /gang [create] [name]");
			else if(gangcmd==2)
				SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /gang [invite] [playerID]");
			return 1;
		}

		//Create Gang//
		if(gangcmd==1) {
		    if(playerGang[playerid]>0) {
				SendClientMessage(playerid, COLOR_RED, "[GANG]: You are already in a gang!");
				return 1;
		    }

			for(new i = 1; i < MAX_GANGS; i++) {
				if(gangInfo[i][0]==0) {
				    //name gang
					format(gangNames[i], MAX_GANG_NAME, "%s", tmp);
					//Gang exists
					gangInfo[i][0]=1;
					//There is one member
					gangInfo[i][1]=1;
					//Gang color is player's color
					gangInfo[i][2]=playerColors[playerid];

					//Player is the first gang member
					gangMembers[i][0] = playerid;
					format(string, sizeof(string),"[GANG]: You have created the gang '%s' (id: %d)", gangNames[i], i);
					SendClientMessage(playerid, COLOR_GREEN, string);

					playerGang[playerid]=i;

					return 1;
				}
			}

			return 1;

		//Join Gang//
		} else if (gangcmd==3) {
	 		gangnum = gangInvite[playerid];

		    if(playerGang[playerid]>0) {
				SendClientMessage(playerid, COLOR_RED, "[GANG]: You are already in a gang!");
				return 1;
		    }
	 		if(gangInvite[playerid]==0) {
				SendClientMessage(playerid, COLOR_RED, "[GANG]: You have not been invited to a gang.");
				return 1;
			}
			if(gangInfo[gangnum][0]==0) {
				SendClientMessage(playerid, COLOR_RED, "[GANG]: That gang does not exist!");
				return 1;
			}

			if(gangInfo[gangnum][1] < MAX_GANG_MEMBERS) {
			    new i = gangInfo[gangnum][1];

				gangInvite[playerid]=0;

				gangMembers[gangnum][i] = playerid;

			    GetPlayerName(playerid, sendername, MAX_PLAYER_NAME);
				for(new j = 0; j < gangInfo[gangnum][1]; j++) {
					format(string, sizeof(string),"[GANG]: %s has joined your gang.", sendername);
					SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
				}

				gangInfo[gangnum][1]++;
				playerGang[playerid] = gangnum;

				SetPlayerColor(playerid,gangInfo[gangnum][2]);

				format(string, sizeof(string),"[GANG]: You have joined the gang '%s' (id: %d)", gangNames[gangnum], gangnum);
				SendClientMessage(playerid, COLOR_GREEN, string);

				return 1;
			}

			SendClientMessage(playerid, COLOR_RED, "[GANG]: That gang is full.");
			return 1;

		//Invite to Gang//
		} else if (gangcmd==2) {
	 		giveplayerid = strval(tmp);

			if(playerGang[playerid]==0) {
				SendClientMessage(playerid, COLOR_RED, "[GANG]: You are not in a gang!");
				return 1;
			}
//			if(gangMembers[playerGang[playerid]][0]!=playerid) {
//				SendClientMessage(playerid, COLOR_RED, "You need to be the gang leader to send an invite.");
//				return 1;
//			}

			if(IsPlayerConnected(giveplayerid)) {
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));

				format(string, sizeof(string),"[GANG]: You have sent a gang invite to %s.", giveplayer);
				SendClientMessage(playerid, COLOR_GREEN, string);
				format(string, sizeof(string),"[GANG]: You have recieved a gang invite from %s to '%s' (id: %d)", sendername, gangNames[playerGang[playerid]],playerGang[playerid]);
				SendClientMessage(giveplayerid, COLOR_GREEN, string);

				gangInvite[giveplayerid]=playerGang[playerid];

			} else
				SendClientMessage(playerid, COLOR_RED, "[GANG]: No such player exists!");

		//Leave Gang//
		} else if (gangcmd==4) {
		    PlayerLeaveGang(playerid);
		}

		return 1;
	}

	//------------------- /ganginfo

	if(strcmp(cmd, "/ganginfo", true) == 0) {
	    new tmp[256];
	    new gangnum;
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp) && playerGang[playerid]==0) {
			SendClientMessage(playerid, COLOR_WHITE, "[USAGE:] /ganginfo [number]");
			return 1;
		} else if (!strlen(tmp))
			gangnum = playerGang[playerid];
		else
			gangnum = strval(tmp);

		if(gangInfo[gangnum][0]==0) {
			SendClientMessage(playerid, COLOR_RED, "[GANG]: No such gang exists!");
			return 1;
		}

		format(string, sizeof(string),"'%s' Gang Members (id: %d)", gangNames[gangnum], gangnum);
		SendClientMessage(playerid, COLOR_GREEN, string);

		for(new i = 0; i < gangInfo[gangnum][1]; i++) {
			GetPlayerName(gangMembers[gangnum][i], giveplayer, sizeof(giveplayer));
			format(string, sizeof(string),"%s (%d)", giveplayer, gangMembers[gangnum][i]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	//------------------- /gangs

	if(strcmp(cmd, "/gangs", true) == 0)
	{
		new x;

		SendClientMessage(playerid, COLOR_GREEN, "Current Gangs:");
	    for(new i=0; i < MAX_GANGS; i++) {
			if(gangInfo[i][0]==1) {
				format(string, sizeof(string), "%s%s(%d) - %d members", string,gangNames[i],i,gangInfo[i][1]);

				x++;
				if(x > 2) {
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    x = 0;
					format(string, sizeof(string), "");
				} else {
					format(string, sizeof(string), "%s, ", string);
				}
			}
		}

		if(x <= 2 && x > 0) {
			string[strlen(string)-2] = '.';
		    SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	return 0;
}


//------------------------------------------------------------------------------------------------------

public OnPlayerText(playerid, text[])
{
	if(text[0] == '!') {
		if(playerGang[playerid] > 0) {
		    new gangChat[256];
		    new senderName[MAX_PLAYER_NAME];
		    new string[256];

//		    for(new i = 1; i < strlen(text)+1; i++)
//				gangChat[i]=text[i];

			strmid(gangChat,text,1,strlen(text));

			GetPlayerName(playerid, senderName, sizeof(senderName));
			format(string, sizeof(string),"%s: %s", senderName, gangChat);

			for(new i = 0; i < gangInfo[playerGang[playerid]][1]; i++) {
				SendClientMessage(gangMembers[playerGang[playerid]][i], COLOR_LIGHTBLUE, string);
			}
		}

		return 0;
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerSpawn(playerid)
{
//	SetVehicleParamsForPlayer(CAR_MARKER_PIRATE,playerid,1,1);
//	SetVehicleParamsForPlayer(CAR_MARKER_STORE,playerid,1,1);
	//SendClientMessage(playerid, COLOR_GREEN, "You are jobless at the moment.");
	//SendClientMessage(playerid, COLOR_YELLOW, "Type /job to get a job and /jobhelp for more information.");
	//SendClientMessage(playerid, COLOR_RED, "Type /help for a general help.");

	/*if(GetPlayerMoney(playerid)>=0)
	{
		GivePlayerMoney(playerid, PocketMoney);
	}
	iSpawnSet[playerid] = 0;
	SetPlayerInterior(playerid,0);
	SetPlayerRandomSpawn(playerid);

	for(new i = 0; i < MAX_WEAPONS; i++) {
		if(playerWeapons[playerid][i] > 0) {
			GivePlayerWeapon(playerid,weaponIDs[i],weaponAmmo[i]*playerWeapons[playerid][i]);
		}
	}*/
	//new rand_skin = random(sizeof(SkinID));
	//SetPlayerSkin(playerid, SkinID[rand_skin]);
	GivePlayerMoney(playerid, PocketMoney);
	if (PLAYERLIST_authed[playerid]) {
	 new rand = random(sizeof(gRandomPlayerSpawns));
     dUserSetINT(PlayerName(playerid)).("x",floatround(gRandomPlayerSpawns[rand][0]));
     dUserSetINT(PlayerName(playerid)).("y",floatround(gRandomPlayerSpawns[rand][1]));
     dUserSetINT(PlayerName(playerid)).("z",floatround(gRandomPlayerSpawns[rand][2]));
     SetTimer("PutAtPos",2000,0);
   			GivePlayerWeapon(playerid, 5, -1);
     		GivePlayerWeapon(playerid, 22, 50);
    /* 	iSpawnSet[playerid] = 0;
	SetPlayerInterior(playerid,0);
	SetPlayerRandomSpawn(playerid);*/
	} else {
	
	
	SetPlayerPos(playerid,-372.5452,2127.5845,133.1091);
	gambleWarning[playerid]=0;
	speedwarned[playerid]=0;
	SetPlayerColor(playerid, COLOR_WHITE);
	job[playerid] = 0;
}
	



	

}

public SetPlayerRandomSpawn(playerid)
{
	if (iSpawnSet[playerid] == 1)
	{
		new rand = random(sizeof(gCopPlayerSpawns));
		SetPlayerPos(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
    }
    else if (iSpawnSet[playerid] == 0)
    {
		new rand = random(sizeof(gRandomPlayerSpawns));
		SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
    new playercash;
   	new playercashkiller;
	new killedplayer[MAX_PLAYER_NAME];
	new string[256];

	playercash = GetPlayerMoney(playerid);
	GameTextForPlayer(playerid,"~r~You are death. You money has been resetted.",5000,3);
	speedwarned[playerid] = 0;
	SetPlayerColor(playerid, COLOR_WHITE);
	job[playerid] = 0;
	if(killerid == INVALID_PLAYER_ID)
	{
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
	}
	 else
	{
    	SendDeathMessage(killerid,playerid,reason);
		SetPlayerScore(killerid,GetPlayerScore(killerid)+1);
		if(bounty[playerid] > 0 && (playerGang[killerid] == 0 || playerGang[playerid] != playerGang[killerid])) {
			GetPlayerName(playerid, killedplayer, sizeof(killedplayer));
			format(string, sizeof(string), "[BOUNTY]: You earned a bounty of %d for killing %s.", bounty[playerid], killedplayer);
			SendClientMessage(killerid, COLOR_GREEN, string);

			GivePlayerMoney(killerid, bounty[playerid]);
			bounty[playerid] = 0;
		}
		if(playercash > 0)  {
            playercashkiller = playercash / 2;
			GivePlayerMoney(killerid, playercashkiller);
			ResetPlayerMoney(playerid);
		}
   	}

   	if(playercash > 0)
   	{
	    ResetPlayerMoney(playerid);
    }
 	return 1;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerEnterCheckpoint(playerid)
{
	new string[256];
	new ownplayer[MAX_PLAYER_NAME];

	switch(getCheckpointType(playerid))
	{
		case CP_BANK: {
			SendClientMessage(playerid, COLOR_YELLOW, "[BANK]: To store money use '/bank amount', to withdraw");
			SendClientMessage(playerid, COLOR_YELLOW, "[BANK]: money use '/withdraw amount', and '/balance' to see your balance.");
		}
		case CP_PIRATE: {
			SendClientMessage(playerid, COLOR_YELLOW, "[PIRATE]: You can hold the pirate ship area to gain money.");
		}
		case CP_AMMU: {
			SendClientMessage(playerid, COLOR_GREEN, "[WEAPONS]: You can purchase weapons here so that you have them every");
			SendClientMessage(playerid, COLOR_GREEN, "[WEAPONS]: time you spawn. You can purchase more than once for more ammo.");
			SendClientMessage(playerid, COLOR_YELLOW, "[WEAPONS]: Type /buyweapon [weapon number] and /weaponlist for a list of weapons.");
		}
/*		case CP_ADMIN: {
                	if (!player_op[playerid] || !IsPlayerAdmin(playerid)) {
						   GameTextForPlayer(playerid,"~r~This is the admin roof.~n~KEEP OUT.",1800,1);
	                       SetPlayerPos(playerid,-372.5452,2127.5845,133.1091);
					   }
		}*/
/*		case CP_SEXSHOP: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can buy the Sex Shop for $25,000 with /buy.");
			SendClientMessage(playerid, COLOR_YELLOW, "You will earn $2,000 regularly.");
		}
		case CP_BAR: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can buy the Shithole Bar for $20,000 with /buy.");
			SendClientMessage(playerid, COLOR_YELLOW, "You will earn $1,500 regularly.");
		}
		case CP_CALIGULA: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can buy the Caligula Casino for $100,000 with /buy.");
			SendClientMessage(playerid, COLOR_YELLOW, "You will earn $7,000 regularly.");
		}
		case CP_ZIP: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can buy the Zip clothes store for $15,000 with /buy.");
			SendClientMessage(playerid, COLOR_YELLOW, "You will earn $1,000 regularly.");
		}*/
	}
	if(getCheckpointType(playerid)>= P_OFFSET) {
		format(string, sizeof(string), "[PROP]: You can buy the %s for $%d with /buy.", propertyNames[playerCheckpoint[playerid]-P_OFFSET], propertyValues[playerCheckpoint[playerid]-P_OFFSET]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "[PROP]: You will earn $%d regularly.", propertyEarnings[playerCheckpoint[playerid]-P_OFFSET]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		if(propertyOwner[playerCheckpoint[playerid]-P_OFFSET]<999) {
			GetPlayerName(propertyOwner[playerCheckpoint[playerid]-P_OFFSET], ownplayer, sizeof(ownplayer));
			format(string, sizeof(string), "[PROP]: This property is currently owned by %s.", ownplayer);
			SendClientMessage(playerid, COLOR_RED, string);
		}
	}
}

//------------------------------------------------------------------------------------------------------

/*public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) {


new string[256];
//for (new i=0 ; i<MAX_PLAYERS ; i++) {
	if (IsPlayerConnected(playerid)) {

			vehicleid = GetPlayerVehicleID(playerid);
			format(string, sizeof(string), "admin_vehicle: %d",vehicleid);
			SendClientMessage(playerid, COLOR_RED, string);
			if (vehicleid == 0 || vehicleid == 1 || vehicleid == 2  || vehicleid == 3) {
				if ( !IsPlayerAdmin(playerid) || player_op[playerid] != 1 ) {
					RemovePlayerFromVehicle(playerid);
					SetVehicleParamsForPlayer(vehicleid,playerid,0,1);
					SetPlayerHealth(playerid, 0);
					format(string, sizeof(string), "[WANING]: %d tried to enter admin_vehicle: %d. Autokilled.", playerid, vehicleid);
					SendClientMessage(playerid, COLOR_RED, string);
				}
      			}
			
	}
//}
}*/

public OnPlayerRequestClass(playerid, classid)
{
	//if(classid == 0 || classid == 1 || classid == 2 || classid == 3 || classid == 4 || classid == 5 || classid == 6)
	//{
	//	iSpawnSet[playerid] = 1;
	//}
	//else
	//{
	//iSpawnSet[playerid] = 0;
	//	}
	//SetupPlayerForClassSelection(playerid);
    SendClientMessage(playerid, COLOR_YELLOW, "### Welcome to SA:MP RealLife ###");
    SendClientMessage(playerid, COLOR_YELLOW, "You have to login first, or create an account.");
    SendClientMessage(playerid, COLOR_YELLOW, "Type /register or /login.");
    SendClientMessage(playerid, COLOR_RED, "NOTE: Press SHIFT, first.");
    SetTimer("StartTextTimer",9000,0);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,14);
	//SetPlayerPos(playerid,1958.3783,1343.1572,15.3746);
	SetPlayerFacingAngle(playerid,90.0);
	SetPlayerCameraPos(playerid,1958.3783,1347.1572,16.3746);
	SetPlayerCameraLookAt(playerid,1958.3783,1343.1572,15.3746);
	//GameTextForPlayer(playerid,"~r~Press SHIFT to start the game.",1800,1);
}

public GameModeExitFunc()
{
	GameModeExit();
}

public OnGameModeInit()
{
	SetGameModeText("SA:MP RealLife v1.61b");
    //new count = 1;
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	
	//AddPlayerClass(15,197.9883,162.7670,1004.0,269.1425,0,0,-1,-1,-1,-1);
    //SetPlayerPos(giveplayerid,197.9883,162.7670,1004.0); JAIL!
	AddPlayerClass(176,1958.3783,1343.1572,15.3746,269.1425,0,0,-1,-1,-1,-1);
	//AddPlayerClass(106,1958.3783,1343.1572,15.3746,269.1425,0,0,5,-1,-1,-1);
	//AddPlayerClass(64,1958.3783,1343.1572,15.3746,269.1425,0,0,5,-1,-1,-1);
	
	
	
	// ADMIN CAR START

	//AddStaticVehicle(425,-655.9375,966.9617,12.1328,174.5149,16,16);
	//AddStaticVehicle(425,-656.2793,955.8838,12.1328,169.5015,16,16);
	AddStaticVehicle(425,-661.7071,942.8259,12.1328,263.5024,16,16); //
	//AddStaticVehicle(425,-659.9933,950.8701,12.1328,261.3091,16,16); //
	AddStaticVehicle(425,-658.5433,960.2805,12.1328,261.3091,16,16); //
	//AddStaticVehicle(425,-657.4174,968.0986,12.1328,261.3091,16,16); //
	AddStaticVehicle(425,-656.2652,982.8680,12.1328,261.3091,16,16); //
	//AddStaticVehicle(425,-667.8040,982.1861,12.1328,90.5642,16,16); //
	AddStaticVehicle(425,-678.7743,982.0781,12.1262,90.5642,16,16); //


	
	//ADMIN CAR END
	
	// Player Class's
	/*AddPlayerClass(280,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);*/
	AddPlayerClass(281,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(282,1958.3783,1343.1572,15.3746,270.1425,0,0,24,300,-1,-1);
	AddPlayerClass(283,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(284,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(285,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(286,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(287,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);

	AddPlayerClass(254,1958.3783,1343.1572,15.3746,0.0,0,0,24,300,-1,-1);
	AddPlayerClass(255,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(256,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(257,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(258,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(259,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(260,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(261,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(262,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(263,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(264,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(274,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(275,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(276,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);

	AddPlayerClass(1,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(2,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(290,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(291,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(292,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(293,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(294,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(295,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(296,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(297,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(298,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
    AddPlayerClass(299,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);

	AddPlayerClass(277,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(278,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(279,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(288,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(47,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(48,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(49,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(50,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(51,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(52,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(53,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(54,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(55,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(56,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(57,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(58,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(59,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(60,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(61,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(62,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(63,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(64,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(66,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(67,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(68,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(69,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(70,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(71,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(72,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(73,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(75,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(76,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(78,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(79,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(80,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(81,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(82,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(83,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(84,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(85,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(87,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(88,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(89,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(91,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(92,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(93,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(95,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(96,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(97,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(98,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(99,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(100,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(101,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(102,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(103,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(104,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(105,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(106,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(107,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(108,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(109,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(110,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(111,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(112,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(113,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(114,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(115,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(116,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(117,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(118,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(120,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(121,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(122,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(123,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(124,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(125,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(126,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(127,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(128,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(129,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(131,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(133,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(134,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(135,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(136,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(137,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(138,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(139,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(140,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(141,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(142,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(143,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(144,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(145,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(146,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(147,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(148,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(150,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(151,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(152,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(153,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(154,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(155,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(156,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(157,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(158,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(159,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(160,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(161,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(162,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(163,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(164,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(165,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(166,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(167,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(168,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(169,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(170,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(171,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(172,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(173,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(174,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(175,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(176,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(177,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(178,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(179,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(180,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(181,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(182,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(183,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(184,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(185,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(186,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(187,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(188,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(189,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(190,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(191,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(192,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(193,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(194,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(195,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(196,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(197,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(198,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(199,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(200,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(201,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(202,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(203,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(204,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(205,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(206,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(207,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(209,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(210,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(211,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(212,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(213,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(214,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(215,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(216,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(217,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(218,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(219,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(220,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(221,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(222,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(223,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(224,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(225,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(226,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(227,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(228,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(229,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(230,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(231,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(232,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(233,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(234,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(235,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(236,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(237,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(238,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(239,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(240,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(241,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(242,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(243,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(244,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(245,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(246,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(247,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(248,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(249,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(250,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(251,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(253,1958.3783,1343.1572,15.3746,269.1425,0,0,24,300,-1,-1);

	// Car Spawns

//	AddStaticVehicle(535,2002.0654,1542.9290,11.0,180.1496,123,1); // piratemarker
//	AddStaticVehicle(411,2179.1169,1985.1921,9.0,359.2931,116,1); // 711marker

	AddStaticVehicle(451,2040.0520,1319.2799,10.3779,183.2439,16,16);
	AddStaticVehicle(429,2040.5247,1359.2783,10.3516,177.1306,13,13);
	AddStaticVehicle(421,2110.4102,1398.3672,10.7552,359.5964,13,13);
	AddStaticVehicle(411,2074.9624,1479.2120,10.3990,359.6861,64,64);
	AddStaticVehicle(477,2075.6038,1666.9750,10.4252,359.7507,94,94);
	AddStaticVehicle(541,2119.5845,1938.5969,10.2967,181.9064,22,22);
	AddStaticVehicle(541,1843.7881,1216.0122,10.4556,270.8793,60,1);
	AddStaticVehicle(402,1944.1003,1344.7717,8.9411,0.8168,30,30);
	AddStaticVehicle(402,1679.2278,1316.6287,10.6520,180.4150,90,90);
	AddStaticVehicle(415,1685.4872,1751.9667,10.5990,268.1183,25,1);
	AddStaticVehicle(411,2034.5016,1912.5874,11.9048,0.2909,123,1);
	AddStaticVehicle(411,2172.1682,1988.8643,10.5474,89.9151,116,1);
	AddStaticVehicle(429,2245.5759,2042.4166,10.5000,270.7350,14,14);
	AddStaticVehicle(477,2361.1538,1993.9761,10.4260,178.3929,101,1);
	AddStaticVehicle(550,2221.9946,1998.7787,9.6815,92.6188,53,53);
	AddStaticVehicle(558,2243.3833,1952.4221,14.9761,359.4796,116,1);
	AddStaticVehicle(587,2276.7085,1938.7263,31.5046,359.2321,40,1);
	AddStaticVehicle(587,2602.7769,1853.0667,10.5468,91.4813,43,1);
	AddStaticVehicle(603,2610.7600,1694.2588,10.6585,89.3303,69,1);
	AddStaticVehicle(587,2635.2419,1075.7726,10.5472,89.9571,53,1);
	AddStaticVehicle(562,2577.2354,1038.8063,10.4777,181.7069,35,1);
	AddStaticVehicle(562,2394.1021,989.4888,10.4806,89.5080,17,1);
	AddStaticVehicle(562,1881.0510,957.2120,10.4789,270.4388,11,1);
	AddStaticVehicle(535,2039.1257,1545.0879,10.3481,359.6690,123,1);
	AddStaticVehicle(535,2009.8782,2411.7524,10.5828,178.9618,66,1);
	AddStaticVehicle(429,2010.0841,2489.5510,10.5003,268.7720,1,2);
	AddStaticVehicle(415,2076.4033,2468.7947,10.5923,359.9186,36,1);
	AddStaticVehicle(487,2093.2754,2414.9421,74.7556,89.0247,26,57);
	AddStaticVehicle(506,2352.9026,2577.9768,10.5201,0.4091,7,7);
	AddStaticVehicle(506,2166.6963,2741.0413,10.5245,89.7816,52,52);
	AddStaticVehicle(411,1960.9989,2754.9072,10.5473,200.4316,112,1);
	AddStaticVehicle(429,1919.5863,2760.7595,10.5079,100.0753,2,1);
	AddStaticVehicle(415,1673.8038,2693.8044,10.5912,359.7903,40,1);
	AddStaticVehicle(402,1591.0482,2746.3982,10.6519,172.5125,30,30);
	AddStaticVehicle(603,1580.4537,2838.2886,10.6614,181.4573,75,77);
	AddStaticVehicle(550,1555.2734,2750.5261,10.6388,91.7773,62,62);
	AddStaticVehicle(535,1455.9305,2878.5288,10.5837,181.0987,118,1);
	AddStaticVehicle(477,1537.8425,2578.0525,10.5662,0.0650,121,1);
	AddStaticVehicle(451,1433.1594,2607.3762,10.3781,88.0013,16,16);
	AddStaticVehicle(603,2223.5898,1288.1464,10.5104,182.0297,18,1);
	AddStaticVehicle(558,2451.6707,1207.1179,10.4510,179.8960,24,1);
	AddStaticVehicle(550,2461.7253,1357.9705,10.6389,180.2927,62,62);
	AddStaticVehicle(558,2461.8162,1629.2268,10.4496,181.4625,117,1);
	AddStaticVehicle(477,2395.7554,1658.9591,10.5740,359.7374,0,1);
	AddStaticVehicle(404,1553.3696,1020.2884,10.5532,270.6825,119,50);
	AddStaticVehicle(400,1380.8304,1159.1782,10.9128,355.7117,123,1);
	AddStaticVehicle(418,1383.4630,1035.0420,10.9131,91.2515,117,227);
	AddStaticVehicle(404,1445.4526,974.2831,10.5534,1.6213,109,100);
	AddStaticVehicle(400,1704.2365,940.1490,10.9127,91.9048,113,1);
	AddStaticVehicle(404,1658.5463,1028.5432,10.5533,359.8419,101,101);
	AddStaticVehicle(581,1677.6628,1040.1930,10.4136,178.7038,58,1);
	AddStaticVehicle(581,1383.6959,1042.2114,10.4121,85.7269,66,1);
	AddStaticVehicle(581,1064.2332,1215.4158,10.4157,177.2942,72,1);
	AddStaticVehicle(581,1111.4536,1788.3893,10.4158,92.4627,72,1);
	AddStaticVehicle(522,953.2818,1806.1392,8.2188,235.0706,3,8);
	AddStaticVehicle(522,995.5328,1886.6055,10.5359,90.1048,3,8);
	AddStaticVehicle(521,993.7083,2267.4133,11.0315,1.5610,75,13);
	AddStaticVehicle(535,1439.5662,1999.9822,10.5843,0.4194,66,1);
	AddStaticVehicle(522,1430.2354,1999.0144,10.3896,352.0951,6,25);
	AddStaticVehicle(522,2156.3540,2188.6572,10.2414,22.6504,6,25);
	AddStaticVehicle(598,2277.6846,2477.1096,10.5652,180.1090,0,1);
	AddStaticVehicle(598,2268.9888,2443.1697,10.5662,181.8062,0,1);
	AddStaticVehicle(598,2256.2891,2458.5110,10.5680,358.7335,0,1);
	AddStaticVehicle(598,2251.6921,2477.0205,10.5671,179.5244,0,1);
	AddStaticVehicle(523,2294.7305,2441.2651,10.3860,9.3764,0,0);
	AddStaticVehicle(523,2290.7268,2441.3323,10.3944,16.4594,0,0);
	AddStaticVehicle(523,2295.5503,2455.9656,2.8444,272.6913,0,0);
	AddStaticVehicle(522,2476.7900,2532.2222,21.4416,0.5081,8,82);
	AddStaticVehicle(522,2580.5320,2267.9595,10.3917,271.2372,8,82);
	AddStaticVehicle(522,2814.4331,2364.6641,10.3907,89.6752,36,105);
	AddStaticVehicle(535,2827.4143,2345.6953,10.5768,270.0668,97,1);
	AddStaticVehicle(521,1670.1089,1297.8322,10.3864,359.4936,87,118);
	AddStaticVehicle(487,1614.7153,1548.7513,11.2749,347.1516,58,8);
	AddStaticVehicle(487,1647.7902,1538.9934,11.2433,51.8071,0,8);
	AddStaticVehicle(487,1608.3851,1630.7268,11.2840,174.5517,58,8);
	AddStaticVehicle(476,1283.0006,1324.8849,9.5332,275.0468,7,6); //11.5332
	AddStaticVehicle(476,1283.5107,1361.3171,9.5382,271.1684,1,6); //11.5382
	AddStaticVehicle(476,1283.6847,1386.5137,11.5300,272.1003,89,91);
	AddStaticVehicle(476,1288.0499,1403.6605,11.5295,243.5028,119,117);
	AddStaticVehicle(415,1319.1038,1279.1791,10.5931,0.9661,62,1);
	AddStaticVehicle(521,1710.5763,1805.9275,10.3911,176.5028,92,3);
	AddStaticVehicle(521,2805.1650,2027.0028,10.3920,357.5978,92,3);
	AddStaticVehicle(535,2822.3628,2240.3594,10.5812,89.7540,123,1);
	AddStaticVehicle(521,2876.8013,2326.8418,10.3914,267.8946,115,118);
	AddStaticVehicle(429,2842.0554,2637.0105,10.5000,182.2949,1,3);
	AddStaticVehicle(549,2494.4214,2813.9348,10.5172,316.9462,72,39);
	AddStaticVehicle(549,2327.6484,2787.7327,10.5174,179.5639,75,39);
	AddStaticVehicle(549,2142.6970,2806.6758,10.5176,89.8970,79,39);
	AddStaticVehicle(521,2139.7012,2799.2114,10.3917,229.6327,25,118);
	AddStaticVehicle(521,2104.9446,2658.1331,10.3834,82.2700,36,0);
	AddStaticVehicle(521,1914.2322,2148.2590,10.3906,267.7297,36,0);
	AddStaticVehicle(549,1904.7527,2157.4312,10.5175,183.7728,83,36);
	AddStaticVehicle(549,1532.6139,2258.0173,10.5176,359.1516,84,36);
	AddStaticVehicle(521,1534.3204,2202.8970,10.3644,4.9108,118,118);
	AddStaticVehicle(549,1613.1553,2200.2664,10.5176,89.6204,89,35);
	AddStaticVehicle(400,1552.1292,2341.7854,10.9126,274.0815,101,1);
	AddStaticVehicle(404,1637.6285,2329.8774,10.5538,89.6408,101,101);
	AddStaticVehicle(400,1357.4165,2259.7158,10.9126,269.5567,62,1);
	AddStaticVehicle(411,1281.7458,2571.6719,10.5472,270.6128,106,1);
	AddStaticVehicle(522,1305.5295,2528.3076,10.3955,88.7249,3,8);
	AddStaticVehicle(521,993.9020,2159.4194,10.3905,88.8805,74,74);
	AddStaticVehicle(415,1512.7134,787.6931,10.5921,359.5796,75,1);
	AddStaticVehicle(522,2299.5872,1469.7910,10.3815,258.4984,3,8);
	AddStaticVehicle(522,2133.6428,1012.8537,10.3789,87.1290,3,8);
	AddStaticVehicle(415,2266.7336,648.4756,11.0053,177.8517,0,1); //
	AddStaticVehicle(461,2404.6636,647.9255,10.7919,183.7688,53,1); //
	AddStaticVehicle(506,2628.1047,746.8704,10.5246,352.7574,3,3); //
	AddStaticVehicle(549,2817.6445,928.3469,10.4470,359.5235,72,39); //
	AddStaticVehicle(562,1919.8829,947.1886,10.4715,359.4453,11,1); //
	AddStaticVehicle(562,1881.6346,1006.7653,10.4783,86.9967,11,1); //
	AddStaticVehicle(562,2038.1044,1006.4022,10.4040,179.2641,11,1); //
	AddStaticVehicle(562,2038.1614,1014.8566,10.4057,179.8665,11,1); //
	AddStaticVehicle(562,2038.0966,1026.7987,10.4040,180.6107,11,1); //
	AddStaticVehicle(422,9.1065,1165.5066,19.5855,2.1281,101,25); //
	AddStaticVehicle(463,19.8059,1163.7103,19.1504,346.3326,11,11); //
	AddStaticVehicle(463,12.5740,1232.2848,18.8822,121.8670,22,22); //
	AddStaticVehicle(586,69.4633,1217.0189,18.3304,158.9345,10,1); //
	AddStaticVehicle(586,-199.4185,1223.0405,19.2624,176.7001,25,1); //
	AddStaticVehicle(476,325.4121,2538.5999,17.5184,181.2964,71,77); //
	AddStaticVehicle(476,291.0975,2540.0410,17.5276,182.7206,7,6); //
	AddStaticVehicle(576,384.2365,2602.1763,16.0926,192.4858,72,1); //
	AddStaticVehicle(586,423.8012,2541.6870,15.9708,338.2426,10,1); //
	AddStaticVehicle(586,-244.0047,2724.5439,62.2077,51.5825,10,1); //
	AddStaticVehicle(586,-311.1414,2659.4329,62.4513,310.9601,27,1); //
	AddStaticVehicle(543,596.8064,866.2578,-43.2617,186.8359,67,8); //
	AddStaticVehicle(543,835.0838,836.8370,11.8739,14.8920,8,90); //
	AddStaticVehicle(549,843.1893,838.8093,12.5177,18.2348,79,39); //
	AddStaticVehicle(400,-235.9767,1045.8623,19.8158,180.0806,75,1); //
	AddStaticVehicle(599,-211.5940,998.9857,19.8437,265.4935,0,1); //
	AddStaticVehicle(422,-304.0620,1024.1111,19.5714,94.1812,96,25); //
	AddStaticVehicle(588,-290.2229,1317.0276,54.1871,81.7529,1,1); //
	AddStaticVehicle(451,-290.3145,1567.1534,75.0654,133.1694,61,61); //
	AddStaticVehicle(470,280.4914,1945.6143,17.6317,310.3278,43,0); //
	AddStaticVehicle(470,272.2862,1949.4713,17.6367,285.9714,43,0); //
	AddStaticVehicle(470,271.6122,1961.2386,17.6373,251.9081,43,0); //
	AddStaticVehicle(470,279.8705,1966.2362,17.6436,228.4709,43,0); //
	AddStaticVehicle(433,277.6437,1985.7559,18.0772,270.4079,43,0); //
	AddStaticVehicle(433,277.4477,1994.8329,18.0773,267.7378,43,0); //
	AddStaticVehicle(568,-441.3438,2215.7026,42.2489,191.7953,41,29); //
	AddStaticVehicle(568,-422.2956,2225.2612,42.2465,0.0616,41,29); //
	AddStaticVehicle(568,-371.7973,2234.5527,42.3497,285.9481,41,29); //
	AddStaticVehicle(568,-360.1159,2203.4272,42.3039,113.6446,41,29); //
	AddStaticVehicle(468,-660.7385,2315.2642,138.3866,358.7643,6,6); //
	AddStaticVehicle(460,-1029.2648,2237.2217,42.2679,260.5732,1,3); //
	AddStaticVehicle(419,95.0568,1056.5530,13.4068,192.1461,13,76); //
	AddStaticVehicle(429,114.7416,1048.3517,13.2890,174.9752,1,2); //
	AddStaticVehicle(411,-290.0065,1759.4958,42.4154,89.7571,116,1); //
	AddStaticVehicle(522,-302.5649,1777.7349,42.2514,238.5039,6,25); //
	AddStaticVehicle(522,-302.9650,1776.1152,42.2588,239.9874,8,82); //
	AddStaticVehicle(533,-301.0404,1750.8517,42.3966,268.7585,75,1); //
	AddStaticVehicle(535,-866.1774,1557.2700,23.8319,269.3263,31,1); //
	AddStaticVehicle(550,-799.3062,1518.1556,26.7488,88.5295,53,53); //
	AddStaticVehicle(521,-749.9730,1589.8435,26.5311,125.6508,92,3); //
	AddStaticVehicle(522,-867.8612,1544.5282,22.5419,296.0923,3,3); //
	AddStaticVehicle(554,-904.2978,1553.8269,25.9229,266.6985,34,30); //
	AddStaticVehicle(521,-944.2642,1424.1603,29.6783,148.5582,92,3); //
	AddStaticVehicle(429,-237.7157,2594.8804,62.3828,178.6802,1,2); //
	AddStaticVehicle(463,-196.3012,2774.4395,61.4775,303.8402,22,22); //
	AddStaticVehicle(519,-1341.1079,-254.3787,15.0701,321.6338,1,1); //
	AddStaticVehicle(519,-1371.1775,-232.3967,15.0676,315.6091,1,1); //
	AddStaticVehicle(519,1642.9850,-2425.2063,14.4744,159.8745,1,1); //
	AddStaticVehicle(519,1734.1311,-2426.7563,14.4734,172.2036,1,1); //
	AddStaticVehicle(415,-680.9882,955.4495,11.9032,84.2754,36,1); //
	AddStaticVehicle(460,-816.3951,2222.7375,43.0045,268.1861,1,3); //
	AddStaticVehicle(460,-94.6885,455.4018,1.5719,250.5473,1,3); //
	AddStaticVehicle(460,1624.5901,565.8568,1.7817,200.5292,1,3); //
	AddStaticVehicle(460,1639.3567,572.2720,1.5311,206.6160,1,3); //
	AddStaticVehicle(460,2293.4219,517.5514,1.7537,270.7889,1,3); //
	AddStaticVehicle(460,2354.4690,518.5284,1.7450,270.2214,1,3); //
	AddStaticVehicle(460,772.4293,2912.5579,1.0753,69.6706,1,3); //
	AddStaticVehicle(560,2133.0769,1019.2366,10.5259,90.5265,9,39); //
	AddStaticVehicle(560,2142.4023,1408.5675,10.5258,0.3660,17,1); //
	AddStaticVehicle(560,2196.3340,1856.8469,10.5257,179.8070,21,1); //
	AddStaticVehicle(560,2103.4146,2069.1514,10.5249,270.1451,33,0); //
	AddStaticVehicle(560,2361.8042,2210.9951,10.3848,178.7366,37,0); //
	AddStaticVehicle(560,-1993.2465,241.5329,34.8774,310.0117,41,29); //
	AddStaticVehicle(559,-1989.3235,270.1447,34.8321,88.6822,58,8); //
	AddStaticVehicle(559,-1946.2416,273.2482,35.1302,126.4200,60,1); //
	AddStaticVehicle(558,-1956.8257,271.4941,35.0984,71.7499,24,1); //
	AddStaticVehicle(562,-1952.8894,258.8604,40.7082,51.7172,17,1); //
	AddStaticVehicle(411,-1949.8689,266.5759,40.7776,216.4882,112,1); //
	AddStaticVehicle(429,-1988.0347,305.4242,34.8553,87.0725,2,1); //
	AddStaticVehicle(559,-1657.6660,1213.6195,6.9062,282.6953,13,8); //
	AddStaticVehicle(560,-1658.3722,1213.2236,13.3806,37.9052,52,39); //
	AddStaticVehicle(558,-1660.8994,1210.7589,20.7875,317.6098,36,1); //
	AddStaticVehicle(550,-1645.2401,1303.9883,6.8482,133.6013,7,7); //
	AddStaticVehicle(460,-1333.1960,903.7660,1.5568,0.5095,46,32); //
	AddStaticVehicle(411,113.8611,1068.6182,13.3395,177.1330,116,1); //
	AddStaticVehicle(429,159.5199,1185.1160,14.7324,85.5769,1,2); //
	AddStaticVehicle(411,612.4678,1694.4126,6.7192,302.5539,75,1); //
	AddStaticVehicle(522,661.7609,1720.9894,6.5641,19.1231,6,25); //
	AddStaticVehicle(522,660.0554,1719.1187,6.5642,12.7699,8,82); //
	AddStaticVehicle(567,711.4207,1947.5208,5.4056,179.3810,90,96); //
	AddStaticVehicle(567,1031.8435,1920.3726,11.3369,89.4978,97,96); //
	AddStaticVehicle(567,1112.3754,1747.8737,10.6923,270.9278,102,114); //
	AddStaticVehicle(567,1641.6802,1299.2113,10.6869,271.4891,97,96); //
	AddStaticVehicle(567,2135.8757,1408.4512,10.6867,180.4562,90,96); //
	AddStaticVehicle(567,2262.2639,1469.2202,14.9177,91.1919,99,81); //
	AddStaticVehicle(567,2461.7380,1345.5385,10.6975,0.9317,114,1); //
	AddStaticVehicle(567,2804.4365,1332.5348,10.6283,271.7682,88,64); //
	AddStaticVehicle(560,2805.1685,1361.4004,10.4548,270.2340,17,1); //
	AddStaticVehicle(506,2853.5378,1361.4677,10.5149,269.6648,7,7); //
	AddStaticVehicle(567,2633.9832,2205.7061,10.6868,180.0076,93,64); //
	AddStaticVehicle(567,2119.9751,2049.3127,10.5423,180.1963,93,64); //
	AddStaticVehicle(567,2785.0261,-1835.0374,9.6874,226.9852,93,64); //
	AddStaticVehicle(567,2787.8975,-1876.2583,9.6966,0.5804,99,81); //
	AddStaticVehicle(411,2771.2993,-1841.5620,9.4870,20.7678,116,1); //
	 	 AddStaticVehicleEx(420,1713.9319,1467.8354,10.5219,342.8006,6,1,600); // taxi
		 AddStaticVehicleEx(420,1713.9319,1447.8354,10.5219,342.8006,6,1,600); // taxi
 		 AddStaticVehicleEx(420,1713.9319,1427.8354,10.5219,342.8006,6,1,600); // taxi
		 AddStaticVehicleEx(420,1713.9319,1407.8354,10.5219,342.8006,6,1,600); // taxi
		 AddStaticVehicleEx(420,1713.9319,1387.8354,10.5219,342.8006,6,1,600); // taxi
		 AddStaticVehicleEx(420,1713.9319,1367.8354,10.5219,342.8006,6,1,600); // taxi
		 AddStaticVehicleEx(420,1713.9319,1487.8354,10.5219,342.8006,6,1,600); // taxi
 		 AddStaticVehicleEx(420,1713.9319,1507.8354,10.5219,342.8006,6,1,600); // taxi
   		 AddStaticVehicleEx(420,1713.9319,1527.8354,10.5219,342.8006,6,1,600); // taxi


	AddStaticPickup(371, 15, 1710.3359,1614.3585,10.1191); //para
	AddStaticPickup(371, 15, 1964.4523,1917.0341,130.9375); //para
	AddStaticPickup(371, 15, 2055.7258,2395.8589,150.4766); //para
	AddStaticPickup(371, 15, 2265.0120,1672.3837,94.9219); //para
	AddStaticPickup(371, 15, 2265.9739,1623.4060,94.9219); //para

	// Put this timer somewhere in your OnGameModeInit
	
	SetTimer("AdminArea",3000,1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("checkpointUpdate", 1100, 1);
	SetTimer("PirateShipScoreUpdate", 2001, 1);
	SetTimer("PropertyScoreUpdate", 40005, 1);
	SetTimer("JobMoney", 40005, 1);
	//SetTimer("SavePosTimer", 40005, 1);
	//SetTimer("GambleUpdate", 5013, 1);
	SetTimer("SavedUpdate",60017, 1);
	SetTimer("TimeUpdate",60009, 1);

	//SetTimer("GameModeExitFunc", gRoundTime, 0);
	SetTimer("SendTextTimer", 150000, 1);
	SetTimer("SavePosTimer", 150000, 1);

	return 1;
}

public SendPlayerFormattedText(playerid, const str[], define)
{
	new tmpbuf[256];
	format(tmpbuf, sizeof(tmpbuf), str, define);
	SendClientMessage(playerid, 0xFFFF00AA, tmpbuf);
}

public SendAllFormattedText(playerid, const str[], define)
{
	new tmpbuf[256];
	format(tmpbuf, sizeof(tmpbuf), str, define);
	SendClientMessageToAll(0xFFFF00AA, tmpbuf);
}


isStringSame(const string1[], const string2[], len) {
	for(new i = 0; i < len; i++) {
	    if(string1[i]!=string2[i])
	        return 0;
		if(string1[i] == 0 || string1[i] == '\n')
		    return 1;
	}
	return 1;
}

//Token from SPARKs PTPM.

PlayerLogin(playerid,username[],password[])
{

	if (strlen(password)==0)
	    return;


	new l=strlen(username);

	if (l==0) return;

	for (new i=0 ; i<l ; i++)
		if (username[i]=='.' || username[i]=='/') return;

	new filename[256];

	format(filename,sizeof filename,"userdb/%s.pwd",username);

	new File:passwordfile = fopen(filename, io_read);
	if (!passwordfile) {
		SendClientMessage(playerid,COLOUR_PERSONAL,"Access denied.");
		return;
	}

	new line[256];
	fread(passwordfile, line);
	fclose(passwordfile);


	if (!streq(line,password)) {
		SendClientMessage(playerid,COLOUR_PERSONAL,"Access denied.");
		return;
	}

	new text[256];
	GetPlayerName(playerid,text,sizeof text);
	printf("Player %s id %d opped up using account %s\n",text,playerid,username);
	format (text,sizeof text,"%s is now a serveradministrator. Respect him!",text);
	SendClientMessageToAll(COLOUR_GLOBAL,text);

	player_op[playerid] = 1;
}
streq(str1[],str2[])
{
	if (strlen(str1)!=strlen(str2)) return 0;

	return strcmp(str1,str2,true)==0;
}

public PutAtPos(playerid) {
  if (dUserINT(PlayerName(playerid)).("x")!=0) {
      //SystemMsg(playerid,"");
      SetPlayerPos(playerid,
                   float(dUserINT(PlayerName(playerid)).("x")),
                   float(dUserINT(PlayerName(playerid)).("y")),
                   float(dUserINT(PlayerName(playerid)).("z")));
  }
}
SendMessageToAdmins(const str[])
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
	    if (IsPlayerConnected(i)) {
	        if (IsPlayerAdmin(i) || player_op[i]) {
	            SendClientMessage(i, 0xFF9900AA, str);
	        }
	    }
	}
}

SendMessage(playerid, const str[])
{
	SendClientMessage(playerid, 0xFF9900AA, str);
}

/*public AdminArea(playerid)
{
    new i, Float:X, Float:Y, Float:Z;
    //new Float:phealth;

    for (i = 0; i < MAX_PLAYERS; i++)
    {
        GetPlayerPos(i, X, Y, Z);
        if(X >= 1305.7489 && X <= 1372.4907 && Y >= -666.4764&& Y <= -602.6023) //REPLACE XMIN,XMAX,YMIN,YMAX by your coordinates
        //if((X >= 388.6190 && X <= -7.9993 && Y >= 2147.0618 && Y <= 1655.8849)) //REPLACE XMIN,XMAX,YMIN,YMAX by your coordinates
        //388.6190, -7.9993, 2147.0618, 1655.8849 A51
        {
            if (!IsPlayerAdmin(i) || player_op[i] == 0)
            {
                GameTextForPlayer(i,"~r~You're not allowed in the Admin Area! Please login as Admin to access this area.",5000,5);
                //GetPlayerHealth(i, phealth);
                SetPlayerHealth(i, 0);
            }
        }
    }
}
*/

public AdminArea(playerid)
{
	new i, j, Float:X, Float:Y, Float:Z;
	for (i = 0, j = MAX_PLAYERS; i < j; i++) {
	GetPlayerPos(playerid, X, Y, Z);
	if(X >= -764.5396 && X <= -632.9658 && Y >= 802.6583 && Y <= 1015.8968) { //Replace with your own x/y min/max coords
		if (IsPlayerAdmin(playerid)/*|| Level[playerid] == Admin*/) {
		    //nothing :D
		} else {
			SetTimer("AdminAreaAbuse", 1000, 0);
			GameTextForPlayer(playerid,"~r~You are not allowed to go to the admin Area!",5000,5);
			SendClientMessage(playerid, COLOR_RED, "Please login as Admin to access this area!");
	 		SetPlayerHealth(playerid, -99999999.99);
		}
	}}
}

public AdminAreaAbuse(playerid)
{
		new string[256];
		new name[256];
	    GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	    format(string, sizeof(string), "[WARNING]: %s tried to enter the admin area. Autokilled!", name);
		SendClientMessageToAll(COLOR_RED, string);
		KillTimer(AdminAreaAbuse(playerid));
}


