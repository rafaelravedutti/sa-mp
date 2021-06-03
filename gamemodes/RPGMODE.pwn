#include <a_samp>
#include <dutils>
#include <dudb>
#include <properties>

new PLAYERLIST_authed[MAX_PLAYERS];
new food[200];
new map[200];
new gTeam[MAX_PLAYERS];
new PlayerBank[200];
new bankp;
new phone[200];
new SKIN1[200];
new water[200];
new iswanking[MAX_PLAYERS];
new accept[200];
new CluckinTimer;
new afk[200];
new WSPT;
new LVPDDOOR;
new LVPDDOOR2;
new Text:Textdraw0;
new Text:Textdraw1;

 //Forum Publicity Timer
forward PayDay(playerid);
forward ForumP();
forward ScoreTimer(playerid);
forward SetupPlayerForClassSelection(playerid,classid);
forward Wank(playerid);
forward IsNumeric(const string[]);
forward SetPlayerRandomSpawn(playerid);
forward CluckinJob(playerid);
forward WellSTimer(playerid);
forward BurgerTimer(playerid);
forward Door();
forward Door2();

#define TEAM_Police 1
#define TEAM_Civillian 2
#define TEAM_Beach 3
#define TEAM_Ballas 4
#define TEAM_Groove 5
#define TEAM_VLA 6
#define TEAM_Vagos 7
#define TEAM_TNB 8
#define TEAM_SFR 9
#define TEAM_Triads 10
#define TEAM_Bikers 11
#define TEAM_Mafia 12
#define TEAM_Drug 13
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1
#define COLOR_SYSTEM 0xEFEFF7AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define Called; 0
#define Calling; 1
#define Free 2
#define Talking 3

stock SystemMsg(playerid,msg[])
{
   if ((IsPlayerConnected(playerid))&&(strlen(msg)>0)) {
       SendClientMessage(playerid,COLOR_SYSTEM,msg);
   }
   return 1;
}

stock PlayerName(playerid)
{
  new name[255];
  GetPlayerName(playerid, name, 255);
  return name;
}

dcmd_register(playerid,params[])
{

    // The command shouldn't work if we already are authed
    if (PLAYERLIST_authed[playerid]) return SystemMsg(playerid,"Already logged.");

    // The command shouldn't work if an account with this
    // nick already exists
    if (udb_Exists(PlayerName(playerid))) return SystemMsg(playerid,"Account already exists, please use '/login password'.");

    // Did he forgot the password?
    if (strlen(params)==0) return SystemMsg(playerid,"Correct usage: '/register password'");

    // We save the money to the accstate

	if (udb_Create(PlayerName(playerid),params))
	{
	PLAYERLIST_authed[playerid]=true;
 	dUserSetINT(PlayerName(playerid)).("admin",0);
	dUserSetINT(PlayerName(playerid)).("money",GivePlayerMoney(playerid,50000));
	dUserSetINT(PlayerName(playerid)).("food",0);
	dUserSetINT(PlayerName(playerid)).("map",0);
	dUserSetINT(PlayerName(playerid)).("bank",PlayerBank[playerid]);
	dUserSetINT(PlayerName(playerid)).("water",0);
	dUserSetINT(PlayerName(playerid)).("tut",0);
	dUserSetINT(PlayerName(playerid)).("armor",0);
	SystemMsg(playerid,"Account successfully created... you has been looged automaticly, next time use '/login password' now.");
	}
	return true;
}
dcmd_login(playerid,params[])
{

    // The command shouldn't work if we already are authed
    if (PLAYERLIST_authed[playerid]) return SystemMsg(playerid,"Already Logged.");

    // The command shouldn't work if an account with this
    // nick does not exists
    if (!udb_Exists(PlayerName(playerid))) return SystemMsg(playerid,"Account doesn't exist, please use '/register password'.");

    // Did he forgot the password?
    if (strlen(params)==0) return SystemMsg(playerid,"Correct usage: '/login password'");

    if (udb_CheckLogin(PlayerName(playerid),params))
	{
       // Login was correct

       // Following thing is the same like the missing SetPlayerCommand
       GivePlayerMoney(playerid,dUserINT(PlayerName(playerid)).("money")-GetPlayerMoney(playerid));
	   dUserINT(PlayerName(playerid)).("admin");
	   food[playerid] = dUserINT(PlayerName(playerid)).("food");
	   PlayerBank[playerid] = dUserINT(PlayerName(playerid)).("bank");
	   water[playerid] = dUserINT(PlayerName(playerid)).("water");
	   accept[playerid] = dUserINT(PlayerName(playerid)).("accept");
       SetPlayerArmour(playerid,dUserINT(PlayerName(playerid)).("armor"));
	   if(dUserINT(PlayerName(playerid)).("admin") == 3007)
       {
       SendClientMessage(playerid,COLOR_GREEN,"Welcome ADMIN, remember you can use /admcmd to see a list of admins commands");
       }
       PLAYERLIST_authed[playerid]=true;

       return SystemMsg(playerid,"Successfully authed!");
    }
    // Login was incorrect
    return SystemMsg(playerid,"Login failed!");
 }
dcmd_flip(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("admin") != 3007) return SystemMsg(playerid,"You Must Be An Admin");
{
     new VehicleID, Float:X, Float:Y, Float:Z;
	 GetPlayerPos(playerid, X, Y, Z);
     VehicleID = GetPlayerVehicleID(playerid);
     SetVehiclePos(VehicleID, X, Y, Z);
     SetVehicleZAngle(VehicleID, 0);
     return 1;
}
}
dcmd_vfix(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("admin") != 3007) return SystemMsg(playerid,"You Must Be An Admin");
{
	 new VehicleId;
	 VehicleId = GetPlayerVehicleID(playerid);
     SetVehicleHealth(VehicleId,1000.00);
	 SendClientMessage(playerid,COLOR_GREEN,"Your Car Was repaired...");
	 return 1;
}
}
//ATM
dcmd_buyphone(playerid,params[])
{
new phone1;
#pragma unused params
if(GetPlayerInterior(playerid) != 6) return SendClientMessage(playerid,COLOR_RED,"You must be at 24/7 Stores...");
{
if(GetPlayerMoney(playerid) < 15000) return SendClientMessage(playerid,COLOR_RED,"No Money Dude!");
{
if(phone[playerid] >= 1)
{
SendClientMessage(playerid,COLOR_RED,"You Already Have A Phone");
}
else
{
phone1 = phone[playerid] += 1;
dUserSetINT(PlayerName(playerid)).("phone",phone1);
SendClientMessage(playerid,COLOR_GREEN,"You Just Bought a Phone!");
GivePlayerMoney(playerid,-15000);
}
}
}
return 1;
}
dcmd_buymap(playerid,params[])
{
#pragma unused params
new map1;
if(GetPlayerInterior(playerid) != 6) return SendClientMessage(playerid,COLOR_RED,"You must be at 24/7 stores...");
{
if(GetPlayerMoney(playerid) < 5000) return SendClientMessage(playerid,COLOR_RED,"No Money Dude!");
{
if(map[playerid] >= 1)
{
SendClientMessage(playerid,COLOR_RED,"You Already Have a  Map");
}
else
{
map1 = map[playerid] += 1;
dUserSetINT(PlayerName(playerid)).("map",map1);
SendClientMessage(playerid,COLOR_GREEN,"You Just Bought a Map!");
GivePlayerMoney(playerid,-5000);
}
}
}
return 1;
}
dcmd_buywater(playerid,params[])
{
#pragma unused params
new water1;
if(GetPlayerInterior(playerid) != 6) return SendClientMessage(playerid,COLOR_RED,"You must be at 24/7 stores..");
{
if(GetPlayerMoney(playerid) < 3500) return SendClientMessage(playerid,COLOR_RED,"No Money Dude");
{
if(water[playerid] >= 5)
{
SendClientMessage(playerid,COLOR_RED,"Your Water Slot Is FULL... You Cant Store More Water");
}
else
{
water1 = water[playerid] += 1;
dUserSetINT(PlayerName(playerid)).("water",water1);
SendClientMessage(playerid,COLOR_GREEN,"You Just Bought Some Water And Put It On Your Bag!");
GivePlayerMoney(playerid,-3500);
}
}
}
return 1;
}
dcmd_buyfood(playerid,params[])
{
#pragma unused params
new food1;
if(GetPlayerInterior(playerid) != 6) return SendClientMessage(playerid,COLOR_RED,"You must be at 24/7  stores..");
{
if(GetPlayerMoney(playerid) < 2500) return SendClientMessage(playerid,COLOR_RED,"No Money Dude");
{
if(food[playerid] >= 10)
{
SendClientMessage(playerid,COLOR_RED,"Your food slot is full... you cant store more food");
}
else
{
food1 = food[playerid] += 1;
dUserSetINT(PlayerName(playerid)).("food",food1);
SendClientMessage(playerid,COLOR_GREEN,"You just bought some food and put it into your bag");
GivePlayerMoney(playerid,-2500);
dUserSetINT(PlayerName(playerid)).("food",food1);
}
}
}
return 1;
}
dcmd_dive(playerid,params[])
{
#pragma unused params
if(GetPlayerInterior(playerid) != 0) return SendClientMessage(playerid,COLOR_RED,"You Must Be On The Real World For Use  This Command");
{
if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid,COLOR_RED,"No Money Dude");
{
if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_RED,"You are  in a Car, you cant dive while in a car, use /CARDIVE for dive in a car");
{
new Float:X;
new Float:Y;
new Float:Z;
GetPlayerPos(playerid,X,Y,Z);
SetPlayerPos(playerid,X,Y,Z+1000);
GivePlayerMoney(playerid,-10000);
GivePlayerWeapon(playerid,46,1);
}
}
}
return 1;
}
dcmd_cardive(playerid,params[])
{
#pragma unused params
if(GetPlayerMoney(playerid) < 15000) return SendClientMessage(playerid,COLOR_RED,"No Money Dude");
{
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_RED,"You are not in a car, you must be in a car for use /CARDIVE, use /DIVE for dive without a car");
{
new V;
new Float:X;
new Float:Y;
new Float:Z;
GetPlayerPos(playerid,X,Y,Z);
V = GetPlayerVehicleID(playerid);
SetVehiclePos(V,X,Y,Z+1000);
GivePlayerMoney(playerid,-15000);
}
}
return 1;
}
dcmd_fix(playerid,params[])
{
	if(dUserINT(PlayerName(playerid)).("admin") != 3007) return SendClientMessage(playerid,COLOR_RED,"You Must Be An ADMIN!");
    if(!strlen(params)) return SendClientMessage(playerid,COLOR_RED,"[ERROR] Right Usage: /fix [playerid]");
	new Victim = strval(params);
	if(!IsPlayerConnected(Victim)) return SendClientMessage(playerid,COLOR_RED,"[ERROR] Invlaid Playerid!");
	if(GetPlayerInterior(Victim) != 0) SetPlayerInterior(Victim,0); //...
	SetPlayerPos(Victim,2206.6646,1838.3296,19.6495); //use setvehiclehealth how "orpheus" did it to fix a vehicle
	return 1;
}
dcmd_goto(playerid,params[])
{
new Float:X;
new Float:Y;
new Float:Z;
new Int;
if(dUserINT(PlayerName(playerid)).("admin") != 3007) return SendClientMessage(playerid,COLOR_RED,"You Must Be An ADMIN!");
if(!strlen(params)) return SendClientMessage(playerid,COLOR_RED,"[ERROR] Usage: /goto [ID]");
new Destini = strval(params);
if(!IsPlayerConnected(Destini)) return SendClientMessage(playerid,COLOR_RED,"[ERROR] Invalid Player ID");
GetPlayerPos(Destini,X,Y,Z);
Int = GetPlayerInterior(Destini);
SetPlayerInterior(playerid,Int);
SetPlayerPos(playerid,X+5,Y,Z);
return 1;
}
dcmd_get(playerid,params[])
{
new Float:X;
new Float:Y;
new Float:Z;
new Int;
if(dUserINT(PlayerName(playerid)).("admin") != 3007) return SendClientMessage(playerid,COLOR_RED,"You Must Be An ADMIN!");
if(!strlen(params)) return SendClientMessage(playerid,COLOR_RED,"[ERROR] Usage: /get [ID]");
new Geted = strval(params);
if(!IsPlayerConnected(Geted)) return SendClientMessage(playerid,COLOR_RED,"[ERROR] Imvalid Player ID");
GetPlayerPos(playerid,X,Y,Z);
Int = GetPlayerInterior(playerid);
SetPlayerInterior(Geted,Int);
SetPlayerPos(Geted,X+5,Y,Z);
return 1;
}
dcmd_myfood(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("food") == 0) return SendClientMessage(playerid,COLOR_RED,"You Dont Have Any Food... You Can Buy Some At the ATM'S Stores!");
if(dUserINT(PlayerName(playerid)).("food") == 1) return SendClientMessage(playerid,COLOR_GREEN,"You Have 1 Aliment");
if(dUserINT(PlayerName(playerid)).("food") == 2) return SendClientMessage(playerid,COLOR_GREEN,"You Have 2 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 3) return SendClientMessage(playerid,COLOR_GREEN,"You Have 3 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 4) return SendClientMessage(playerid,COLOR_GREEN,"You Have 4 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 5) return SendClientMessage(playerid,COLOR_GREEN,"You Have 5 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 6) return SendClientMessage(playerid,COLOR_GREEN,"You Have 6 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 7) return SendClientMessage(playerid,COLOR_GREEN,"You Have 7 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 8) return SendClientMessage(playerid,COLOR_GREEN,"You Have 8 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 9) return SendClientMessage(playerid,COLOR_GREEN,"You Have 9 Aliments");
if(dUserINT(PlayerName(playerid)).("food") == 10) return SendClientMessage(playerid,COLOR_GREEN,"You Have 10 Aliments");
return 1;
}
dcmd_commands(playerid,params[])
{
#pragma unused params
SendClientMessage(playerid,COLOR_GREEN,"Your Normal Commands are: /DIVE, /CARDIVE, /MYFOOD,/EAT");
SendClientMessage(playerid,COLOR_GREEN,"Your ATM'S Commands are: /BUYFOOD, /BUYMAP");
SendClientMessage(playerid,COLOR_GREEN,"Your Map Commands are: /MAP, /ATM, /LVAIRPORT, /BANK");
SendClientMessage(playerid,COLOR_GREEN,"Your Bank Commands Are: /WITHDRAW, /DEPOSIT, /BALANCE");
SendClientMessage(playerid,COLOR_GREEN,"Your Properties Commands Are: /BUYPROP, /SELLPROP");
SendClientMessage(playerid,COLOR_GREEN,"Your Job Commands Are: /CKBJOB, WSPJOB");
SendClientMessage(playerid,COLOR_GREEN,"Your Misc Commands Are: /COMMANDS, /EXIT, /AFK");
SendClientMessage(playerid,COLOR_GREEN,"We Will Be Ading More Commands Soon");
return 1;
}
//Map Commands
dcmd_map(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("map") == 0) return SendClientMessage(playerid,COLOR_RED,"You Dont Have A Map, You Can Buy One At ATM'S Stores!");
SendClientMessage(playerid,COLOR_GREEN,"Your Map Locations Are:");
SendClientMessage(playerid,COLOR_GREEN,"/BANK, /AIRPORT, /ATM,");
return 1;
}
dcmd_atm(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("map") == 0) return SendClientMessage(playerid,COLOR_RED,"You Dont Have A Map, You Can Buy One At ATM'S Stores!");
DisablePlayerCheckpoint(playerid);
SetPlayerCheckpoint(playerid,2192.5325,1990.7815,12.2969,3.0);
SendClientMessage(playerid,COLOR_GREEN,"Your Destination Is Now Marked On your Map As A Red Dot!");
return 1;
}
dcmd_lvairport(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("map") == 0) return SendClientMessage(playerid,COLOR_RED,"You Dont Have A Map, You Can Buy One At ATM'S Stores!");
DisablePlayerCheckpoint(playerid);
SetPlayerCheckpoint(playerid,1678.2391,1447.9369,10.7752,3.0);
SendClientMessage(playerid,COLOR_GREEN,"Your Destination Is Now Marked On your Map As A Red Dot!");
return 1;
}
dcmd_bank(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("map") == 0) return SendClientMessage(playerid,COLOR_RED,"You Dont Have A Map, You Can Buy One At ATM'S Stores!");
DisablePlayerCheckpoint(playerid);
SetPlayerCheckpoint(playerid,2091.6118,2055.0095,10.8203,3.0);
SendClientMessage(playerid,COLOR_GREEN,"Your Destination Is Now Marked On Your Map As A Red Dot!");
return 1;
}
dcmd_admcmd(playerid,params[])
{
#pragma unused params
if(dUserINT(PlayerName(playerid)).("admin") != 3007) return SendClientMessage(playerid,COLOR_RED,"You Must Be An ADMIN!");
SendClientMessage(playerid,COLOR_GREEN,"Your ADMIN Commands Are: /FIX, /GOTO, /GET, /FLIP, /VFIX, /ADMCMD");
return 1;
}
//bank
dcmd_deposit(playerid,params[])
{
new index = 0;
new tmp[255];
new string[255];
new moneys;
if(GetPlayerInterior(playerid) != 10) return SendClientMessage(playerid,COLOR_RED,"You Must Be at The BANK!");
tmp = strtok(params, index);
if(!strlen(tmp) || !IsNumeric(tmp)) return SendClientMessage(playerid,COLOR_RED,"[ERROR]: Usage: /deposti amount");
moneys = strval(tmp);
if(moneys < 1) return SendClientMessage(playerid,COLOR_RED,"Invalid Amount!!");
if(GetPlayerMoney(playerid) < moneys)
{
moneys = GetPlayerMoney(playerid);
}
PlayerBank[playerid] += moneys;
format(string,sizeof(string),"You Have Deposti $%d. Your Current Balance is $%d",moneys,PlayerBank[playerid]);
SendClientMessage(playerid,COLOR_GREEN,string);
GivePlayerMoney(playerid,-moneys);
if(PLAYERLIST_authed[playerid] == 1)
{
dUserSetINT(PlayerName(playerid)).("money",GetPlayerMoney(playerid));
dUserSetINT(PlayerName(playerid)).("bank",PlayerBank[playerid]);
}
return 1;
}
dcmd_withdraw(playerid,params[])
{
new index = 0;
new tmp[256];
new string[256];
new moneys;
if(GetPlayerInterior(playerid) != 10) return SendClientMessage(playerid,COLOR_RED,"You Must Be at The BANK!");
tmp = strtok(params, index);
if(!strlen(tmp) || !IsNumeric(tmp)) return SendClientMessage(playerid,COLOR_RED,"[ERROR]: Usage: /withdraw amount");
moneys = strval(tmp);
if(moneys < 1) return SendClientMessage(playerid,COLOR_RED,"Invalid Amoun");
if(moneys > PlayerBank[playerid])
moneys = PlayerBank[playerid];
if(moneys+GetPlayerMoney(playerid) > 100000000)
{
format(string, sizeof(string), "If you would withdraw $%d combined with your current cash $%d you would exceed $100000000.", moneys, GetPlayerMoney(playerid));
SendClientMessage(playerid,COLOR_RED,string);
format(string, sizeof(string), "You can withdraw $%d maximum. Request denied.", 100000000-GetPlayerMoney(playerid));
SendClientMessage(playerid,COLOR_RED,string);
return 1;
}
PlayerBank[playerid] -= moneys;
format(string,sizeof(string),"You have WithDrawn $%d. Your Current Balance is $%d",moneys,PlayerBank[playerid]);
SendClientMessage(playerid,COLOR_GREEN,string);
GivePlayerMoney(playerid,moneys);
if(PLAYERLIST_authed[playerid] == 1)
{
dUserSetINT(PlayerName(playerid)).("money",GetPlayerMoney(playerid));
dUserSetINT(PlayerName(playerid)).("bank",PlayerBank[playerid]);
}
return 1;
}
dcmd_balance(playerid,params[])
{
#pragma unused params
new string[256];
if(GetPlayerInterior(playerid) != 10) return SendClientMessage(playerid,COLOR_RED,"You Must Be At The BANK!");
format(string,sizeof(string),"Your Current Balance is $%d",PlayerBank[playerid]);
SendClientMessage(playerid,COLOR_GREEN,string);
return 1;
}
dcmd_exit(playerid,params[])
{
#pragma unused params
if(GetPlayerInterior(playerid) == 10)
{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2091.6118,2055.0095,10.8203);
SetPlayerFacingAngle(playerid,90.9972);
}
return 1;
}
dcmd_buyclothes(playerid,params[])
{
#pragma unused params
if(GetPlayerInterior(playerid) != 15) return SendClientMessage(playerid,COLOR_RED,"You Must at Binco or Z.I.P Stores!");
SendClientMessage(playerid,COLOR_GREEN,"Use /CLOTHES1, /CLOTHES2... (MAX /CLOTHES5) for see the avaliable clothes!");
return 1;
}
dcmd_clothes1(playerid,params[])
{
#pragma unused params
new skinA;
if(GetPlayerInterior(playerid) != 15) return SendClientMessage(playerid,COLOR_RED,"You Must at Binco or Z.I.P Stores!");
{
if(GetPlayerMoney(playerid) < 25000) return SendClientMessage(playerid,COLOR_RED,"No Money Dude");
{
if(GetPlayerSkin(playerid) != 11) return SetPlayerSkin(playerid,11);
{
if(SKIN1[playerid] >= 1)
{
SendClientMessage(playerid,COLOR_RED,"You Already Own This Clothes");
}
else
{
if(GetPlayerSkin(playerid) == 10)
skinA = SKIN1[playerid] = 1;
SendClientMessage(playerid,COLOR_GREEN,"You Just Bought Some Clothes");
GivePlayerMoney(playerid,-25000);
dUserSetINT(PlayerName(playerid)).("Skin1A",skinA);
}
}
}
}
return 1;
}
dcmd_eat(playerid,params[])
{
new food1;
new Float:health;
#pragma unused params
if(food[playerid] < 1)
{
SendClientMessage(playerid,COLOR_RED,"You Dont Have Any Aliment To eat!");
}
else
{
SendClientMessage(playerid,COLOR_GREEN,"You Eat Some Aliments");
GetPlayerHealth(playerid,health);
SetPlayerHealth(playerid,health+15);
food[playerid] -= 1;
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0); // Eat Burger
dUserSetINT(PlayerName(playerid)).("food",food1);
if(!IsPlayerInAnyVehicle(playerid)) return ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
}
return 1;
}
dcmd_wank(playerid,params[])
{
#pragma unused params
new string[256];
new name[256];
if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_RED,"You Cant Wank On The Car!");
{
if(iswanking[playerid] == 0)
{
GetPlayerName(playerid,name,256);
SetTimerEx("Wank",12900,false,"i",playerid);
iswanking[playerid] = 1;
ApplyAnimation(playerid,"PAULNMAC","wank_out",4.1,1,0,0,0,-1);
format(string,sizeof(string),"%s Wanks Off",name);
SendClientMessageToAll(COLOR_GREEN,string);
}
}
return 1;
}
dcmd_accept(playerid,params[])
{
#pragma unused params
new name[256];
new string[256];
if(dUserINT(PlayerName(playerid)).("accept") == 1)
{
SendClientMessage(playerid,COLOR_RED,"You Have Already Accepted the rulez!");
}
else
{
if(dUserINT(PlayerName(playerid)).("accpet") == 0)
{
GetPlayerName(playerid,name,256);
SendClientMessage(playerid,COLOR_GREEN,"You Have Accepted the Rulez, Welcome to eXtreme RPG!");
format(string,sizeof(string),"%s Is A Newbie Please Be Gentle with Him/Her!",name);
SendClientMessageToAll(COLOR_GREEN,string);
printf("%s Is Now A Newbie!",name);
accept[playerid] = 1;
dUserSetINT(PlayerName(playerid)).("accept",accept[playerid]);
TogglePlayerControllable(playerid,1);
}
}
return 1;
}
dcmd_buyprop(playerid,params[])
{
#pragma unused params
BuyPropertyForPlayer(playerid);
return 1;
}
dcmd_sellprop(playerid,params[])
{
#pragma unused params
SellPropertyForPlayer(playerid);
return 1;
}
dcmd_ckbjob(playerid,params[])
{
#pragma unused params
if(GetPlayerInterior(playerid) != 9) return SendClientMessage(playerid,COLOR_RED,"You Must Be At Cluckin Bell!");
if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_RED,"You Must Be On Foot!");
CluckinTimer = SetTimerEx("CluckinJob",60000,true,"i",playerid);
SetPlayerSkin(playerid,167);
SendClientMessage(playerid,COLOR_YELLOW,"Congratulations now you work at Cluckin-Bell... you will earn 1500$ every 60  Seconds");
return 1;
}
dcmd_afk(playerid,params[])
{
#pragma unused params
new name[256];
new string[256];
if(afk[playerid] == 0)
{
SetPlayerPos(playerid,2027.2997,1555.5198,37.4486);
SetPlayerFacingAngle(playerid,77.2793);
SetPlayerCameraLookAt(playerid,2027.2997,1555.5198,37.4486);
SetPlayerCameraPos(playerid,2031.7429,1554.5121,37.1833);
GetPlayerName(playerid,name,256);
format(string,sizeof(string),"%s Is Now Away From The Keyboard(afk)",name);
SendClientMessageToAll(COLOR_YELLOW,string);
SendClientMessage(playerid,COLOR_YELLOW,"Use /AFK again for be Back");
TogglePlayerControllable(playerid,0);
afk[playerid] = 1;
}
else
{
if(afk[playerid] == 1)
{
TogglePlayerControllable(playerid,1);
SpawnPlayer(playerid);
GetPlayerName(playerid,name,256);
format(string,sizeof(string),"%s is now BACK",name);
SendClientMessageToAll(COLOR_YELLOW,string);
SendClientMessage(playerid,COLOR_YELLOW,"Use /AFK again for being Away From The Keyboard Again");
afk[playerid] = 0;
}
}
return 1;
}
dcmd_wspjob(playerid,params[])
{
#pragma unused params
if(GetPlayerInterior(playerid) != 5) return SendClientMessage(playerid,COLOR_RED,"You Must Be At the Well Stacked Pizza Stores!");
{
if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_RED,"You Must Be On Foot!");
{
WSPT = SetTimerEx("WellSTimer",60000,true,"i",playerid);
SetPlayerSkin(playerid,155);
SendClientMessage(playerid,COLOR_GREEN,"Congratulations... You Now Work At The Well Staked Pizza Local");
}
}
return 1;
}
dcmd_opengate(playerid,params[])
{
#pragma unused params
if(gTeam[playerid] != TEAM_Police) return SendClientMessage(playerid,COLOR_RED,"You Must Be a Cop!");
SendClientMessage(playerid,COLOR_GREEN,"Opening Gate");
MoveObject(LVPDDOOR,2293.823486, 2507.122559, 5.768078,2.00);
SetTimer("Door",15000,false);
return 1;
}
dcmd_opengate2(playerid,params[])
{
#pragma unused params
if(gTeam[playerid] != TEAM_Police) return SendClientMessage(playerid,COLOR_RED,"You Must Be A Cop!");
SendClientMessage(playerid,COLOR_GREEN,"Opening Gate");
MoveObject(LVPDDOOR2,2339.340088, 2450.760986, 8.241816,2.00);
SetTimer("Door2",15000,false);

return 1;
}
// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n-----------------------------------/");
	print("----------ALMIGHTY'S GameMode-------/");
	print("-----------------------------------/\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Almighty GM");
	UsePropertyTextDraw(1);
	SetPayoutFrequency(120);
	AllowAdminTeleport(1);
	UsePlayerPedAnims();
	//LV Spawned Police
	AddPlayerClass(280,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//0
	AddPlayerClass(281,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//1
	AddPlayerClass(282,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//2
    AddPlayerClass(283,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//3
    AddPlayerClass(288,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//4
    AddPlayerClass(284,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//5
    AddPlayerClass(286,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//6
    AddPlayerClass(265,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//7
    AddPlayerClass(266,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//8
    AddPlayerClass(267,2291.0313,2451.6003,10.8203,83.3982,0,0,0,0,0,0);//9
	//Swat
	AddPlayerClass(285,2281.7432,2424.2476,3.4766,349.7106,0,0,0,0,0,0);//10
	//Civialians
	AddPlayerClass(0,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//11
	AddPlayerClass(190,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//12
	AddPlayerClass(191,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//13
	AddPlayerClass(192,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//14
	AddPlayerClass(193,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//15
	AddPlayerClass(194,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//16
	AddPlayerClass(195,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//17
	AddPlayerClass(138,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//18
	AddPlayerClass(139,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//18
	AddPlayerClass(140,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//20
	AddPlayerClass(145,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//21
	AddPlayerClass(146,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//22
	AddPlayerClass(154,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//23
	AddPlayerClass(251,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//24
	AddPlayerClass(92,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//25
	AddPlayerClass(97,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//26
	AddPlayerClass(45,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//27
	AddPlayerClass(18,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//28
	AddPlayerClass(128,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//29
	AddPlayerClass(129,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//30
	AddPlayerClass(130,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//31
	AddPlayerClass(131,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//32
	AddPlayerClass(132,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//33
	AddPlayerClass(133,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//34
	AddPlayerClass(157,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//35
	AddPlayerClass(158,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//36
	AddPlayerClass(159,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//37
	AddPlayerClass(160,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//38
    AddPlayerClass(161,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//39
    AddPlayerClass(162,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//40
    AddPlayerClass(196,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//41
    AddPlayerClass(197,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//42
    AddPlayerClass(198,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//43
    AddPlayerClass(199,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//44
    AddPlayerClass(200,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//45
    AddPlayerClass(201,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//46
    AddPlayerClass(202,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//47
    AddPlayerClass(31,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//48
    AddPlayerClass(32,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//49
    AddPlayerClass(33,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//50
    AddPlayerClass(34,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//51
    AddPlayerClass(258,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//52
    AddPlayerClass(259,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//53
    AddPlayerClass(26,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//53
    AddPlayerClass(51,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//54
    AddPlayerClass(52,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//55
    AddPlayerClass(80,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//56
    AddPlayerClass(81,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//57
    AddPlayerClass(23,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//58
    AddPlayerClass(96,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//59
    AddPlayerClass(99,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//60
    AddPlayerClass(134,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//61
    AddPlayerClass(135,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//62
    AddPlayerClass(137,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//63
    AddPlayerClass(181,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//64
    AddPlayerClass(213,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//65
    AddPlayerClass(212,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//66
    AddPlayerClass(224,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//67
    AddPlayerClass(230,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//68
    AddPlayerClass(239,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//69
    AddPlayerClass(249,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//70
    AddPlayerClass(241,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//71
    AddPlayerClass(242,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//72
    AddPlayerClass(252,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//73
    AddPlayerClass(253,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//74
    AddPlayerClass(255,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//75
    AddPlayerClass(30,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//76
    AddPlayerClass(49,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//77
    AddPlayerClass(57,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//78
    AddPlayerClass(61,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//79
    AddPlayerClass(62,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);///80
    AddPlayerClass(66,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//81
    AddPlayerClass(73,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//82
    AddPlayerClass(77,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//83
    AddPlayerClass(78,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//84
    AddPlayerClass(79,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//85
    AddPlayerClass(82,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//86
    AddPlayerClass(83,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//87
    AddPlayerClass(84,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//88
    AddPlayerClass(10,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//89
    AddPlayerClass(11,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//90
    AddPlayerClass(12,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//91
    AddPlayerClass(13,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//92
    AddPlayerClass(136,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//93
    AddPlayerClass(14,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//94
    AddPlayerClass(142,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//95
    AddPlayerClass(143,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//96
    AddPlayerClass(144,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//97
    AddPlayerClass(15,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//98
    AddPlayerClass(156,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//99
    AddPlayerClass(151,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//100
    AddPlayerClass(168,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//101
    AddPlayerClass(169,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//102
    AddPlayerClass(17,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//103
    AddPlayerClass(170,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//104
    AddPlayerClass(180,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//105
    AddPlayerClass(182,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//106
    AddPlayerClass(54,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//107
    AddPlayerClass(183,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//108
    AddPlayerClass(184,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//109
    AddPlayerClass(263,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//110
    AddPlayerClass(75,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//111
    AddPlayerClass(186,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//112
    AddPlayerClass(185,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//113
    AddPlayerClass(188,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//114
    AddPlayerClass(19,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//115
    AddPlayerClass(216,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//116
    AddPlayerClass(20,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//117
    AddPlayerClass(206,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//118
    AddPlayerClass(21,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//119
    AddPlayerClass(22,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//120
    AddPlayerClass(210,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//121
    AddPlayerClass(214,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//122
    AddPlayerClass(215,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//123
    AddPlayerClass(220,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//124
    AddPlayerClass(221,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//125
    AddPlayerClass(225,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//126
    AddPlayerClass(226,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//127
    AddPlayerClass(222,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//128
    AddPlayerClass(223,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//129
    AddPlayerClass(227,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//130
    AddPlayerClass(231,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//131
    AddPlayerClass(228,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//132
    AddPlayerClass(234,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//133
    AddPlayerClass(76,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//134
    AddPlayerClass(235,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//135
    AddPlayerClass(236,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//136
    AddPlayerClass(89,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//137
    AddPlayerClass(88,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//138
    AddPlayerClass(24,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//139
    AddPlayerClass(218,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//140
    AddPlayerClass(240,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//141
    AddPlayerClass(25,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//142
    AddPlayerClass(250,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//143
    AddPlayerClass(261,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//144
    AddPlayerClass(28,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//145
    AddPlayerClass(40,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//146
    AddPlayerClass(41,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//147
    AddPlayerClass(35,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//148
    AddPlayerClass(37,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//149
    AddPlayerClass(38,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//150
    AddPlayerClass(36,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//151
    AddPlayerClass(44,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//152
    AddPlayerClass(69,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//153
    AddPlayerClass(43,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//154
    AddPlayerClass(46,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//155
    AddPlayerClass(9,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//156
    AddPlayerClass(93,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//157
    AddPlayerClass(39,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//158
    AddPlayerClass(48,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//159
    AddPlayerClass(47,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//160
    AddPlayerClass(262,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//161
    AddPlayerClass(229,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//162
    AddPlayerClass(58,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//163
    AddPlayerClass(59,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//164
    AddPlayerClass(60,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//165
    AddPlayerClass(232,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//166
    AddPlayerClass(233,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//167
    AddPlayerClass(67,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//168
    AddPlayerClass(7,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//169
    AddPlayerClass(72,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//170
    AddPlayerClass(55,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//171
    AddPlayerClass(94,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//172
    AddPlayerClass(95,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//173
    AddPlayerClass(98,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//174
    AddPlayerClass(56,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//175
    
    //Beaches
    AddPlayerClass(152,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//176
    AddPlayerClass(178,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//177
    AddPlayerClass(237,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//178
    AddPlayerClass(238,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//179
    AddPlayerClass(243,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//180
    AddPlayerClass(244,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//181
    AddPlayerClass(207,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//182
    AddPlayerClass(245,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//183
    AddPlayerClass(246,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//184
    AddPlayerClass(85,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//185
    AddPlayerClass(256,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//186
    AddPlayerClass(257,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//187
    AddPlayerClass(64,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//188
    AddPlayerClass(63,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//189
    AddPlayerClass(87,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//190
    AddPlayerClass(90,2510.5891,2120.9509,10.8400,15.6434,0,0,0,0,0,0);//191
    //Gangs
    //Ballas
    AddPlayerClass(102,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//192
    AddPlayerClass(103,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//193
    AddPlayerClass(104,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//194

	//Grove
	AddPlayerClass(105,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//195
	AddPlayerClass(106,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//196
	AddPlayerClass(107,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//197
	AddPlayerClass(269,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//198
	AddPlayerClass(270,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//299
	AddPlayerClass(271,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//200
	
	//Variops los Aztecas
    AddPlayerClass(114,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//201
    AddPlayerClass(115,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//202
    AddPlayerClass(115,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//203
    //Vagos
    AddPlayerClass(108,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//204
    AddPlayerClass(109,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//205
    AddPlayerClass(110,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//206
    //The Nang Boys
    AddPlayerClass(121,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//207
    AddPlayerClass(122,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//208
    AddPlayerClass(123,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//209
    //SF rifa
    AddPlayerClass(173,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//210
    AddPlayerClass(174,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//211
    AddPlayerClass(175,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//112
    ///triads
    AddPlayerClass(117,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//213
    AddPlayerClass(118,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//214
    AddPlayerClass(120,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//215
	//Bikers
	AddPlayerClass(100,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//216
	AddPlayerClass(247,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//217
	AddPlayerClass(248,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//218
	AddPlayerClass(254,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//219
	//Mafia
	AddPlayerClass(111,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//220
	AddPlayerClass(112,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//221
	AddPlayerClass(113,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//222
	AddPlayerClass(125,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//223
	AddPlayerClass(126,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//224
	AddPlayerClass(127,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//225
    //drugs
    AddPlayerClass(29,1958.3783,1343.1572,15.3746,269.1425,0,0,0,0,0,0);//226
    

    

    //El ID 50es el mecanico
	
	
   //cars
   	AddStaticVehicle(451,2040.0520,1319.2799,10.3779,183.2439,16,16);//1
	AddStaticVehicle(429,2040.5247,1359.2783,10.3516,177.1306,13,13);//2
	AddStaticVehicle(421,2110.4102,1398.3672,10.7552,359.5964,13,13);//3
	AddStaticVehicle(411,2074.9624,1479.2120,10.3990,359.6861,64,64);//4
	AddStaticVehicle(477,2075.6038,1666.9750,10.4252,359.7507,94,94);//5
	AddStaticVehicle(541,2119.5845,1938.5969,10.2967,181.9064,22,22);//6
	AddStaticVehicle(541,1843.7881,1216.0122,10.4556,270.8793,60,1);//7
	AddStaticVehicle(402,1944.1003,1344.7717,8.9411,0.8168,30,30);//8
	AddStaticVehicle(402,1679.2278,1316.6287,10.6520,180.4150,90,90);//9
	AddStaticVehicle(415,1685.4872,1751.9667,10.5990,268.1183,25,1);//10
	AddStaticVehicle(411,2034.5016,1912.5874,11.9048,0.2909,123,1);//11
	AddStaticVehicle(411,2172.1682,1988.8643,10.5474,89.9151,116,1);//12
	AddStaticVehicle(429,2245.5759,2042.4166,10.5000,270.7350,14,14);//13
	AddStaticVehicle(477,2361.1538,1993.9761,10.4260,178.3929,101,1);//14
	AddStaticVehicle(550,2221.9946,1998.7787,9.6815,92.6188,53,53);//15
	AddStaticVehicle(558,2243.3833,1952.4221,14.9761,359.4796,116,1);//16
	AddStaticVehicle(587,2276.7085,1938.7263,31.5046,359.2321,40,1);//17
	AddStaticVehicle(587,2602.7769,1853.0667,10.5468,91.4813,43,1);//18
	AddStaticVehicle(603,2610.7600,1694.2588,10.6585,89.3303,69,1);//19
	AddStaticVehicle(587,2635.2419,1075.7726,10.5472,89.9571,53,1);//20
	AddStaticVehicle(437,2577.2354,1038.8063,10.4777,181.7069,35,1);//21
	AddStaticVehicle(535,2039.1257,1545.0879,10.3481,359.6690,123,1);//22
	AddStaticVehicle(535,2009.8782,2411.7524,10.5828,178.9618,66,1);//23
	AddStaticVehicle(429,2010.0841,2489.5510,10.5003,268.7720,1,2);//24
	AddStaticVehicle(415,2076.4033,2468.7947,10.5923,359.9186,36,1);//25
	AddStaticVehicle(487,2093.2754,2414.9421,74.7556,89.0247,26,57);//26
	AddStaticVehicle(506,2352.9026,2577.9768,10.5201,0.4091,7,7);//27
	AddStaticVehicle(506,2166.6963,2741.0413,10.5245,89.7816,52,52);//28
	AddStaticVehicle(411,1960.9989,2754.9072,10.5473,200.4316,112,1);//29
	AddStaticVehicle(429,1919.5863,2760.7595,10.5079,100.0753,2,1);//30
	AddStaticVehicle(415,1673.8038,2693.8044,10.5912,359.7903,40,1);//31
	AddStaticVehicle(402,1591.0482,2746.3982,10.6519,172.5125,30,30);//32
	AddStaticVehicle(603,1580.4537,2838.2886,10.6614,181.4573,75,77);//33
	AddStaticVehicle(550,1555.2734,2750.5261,10.6388,91.7773,62,62);//34
	AddStaticVehicle(535,1455.9305,2878.5288,10.5837,181.0987,118,1);//35
	AddStaticVehicle(477,1537.8425,2578.0525,10.5662,0.0650,121,1);//36
	AddStaticVehicle(451,1433.1594,2607.3762,10.3781,88.0013,16,16);//37
	AddStaticVehicle(603,2223.5898,1288.1464,10.5104,182.0297,18,1);//38
	AddStaticVehicle(558,2451.6707,1207.1179,10.4510,179.8960,24,1);//39
	AddStaticVehicle(550,2461.7253,1357.9705,10.6389,180.2927,62,62);//40
	AddStaticVehicle(558,2461.8162,1629.2268,10.4496,181.4625,117,1);//41
	AddStaticVehicle(477,2395.7554,1658.9591,10.5740,359.7374,0,1);//42
	AddStaticVehicle(404,1553.3696,1020.2884,10.5532,270.6825,119,50);//43
	AddStaticVehicle(400,1380.8304,1159.1782,10.9128,355.7117,123,1);//44
	AddStaticVehicle(418,1383.4630,1035.0420,10.9131,91.2515,117,227);//45
	AddStaticVehicle(404,1445.4526,974.2831,10.5534,1.6213,109,100);//46
	AddStaticVehicle(400,1704.2365,940.1490,10.9127,91.9048,113,1);//47
	AddStaticVehicle(404,1658.5463,1028.5432,10.5533,359.8419,101,101);//48
	AddStaticVehicle(581,1677.6628,1040.1930,10.4136,178.7038,58,1);//49
	AddStaticVehicle(581,1383.6959,1042.2114,10.4121,85.7269,66,1);//50
	AddStaticVehicle(581,1064.2332,1215.4158,10.4157,177.2942,72,1);//51
	AddStaticVehicle(581,1111.4536,1788.3893,10.4158,92.4627,72,1);//52
	AddStaticVehicle(522,953.2818,1806.1392,8.2188,235.0706,3,8);//53
	AddStaticVehicle(522,995.5328,1886.6055,10.5359,90.1048,3,8);//54
	AddStaticVehicle(521,993.7083,2267.4133,11.0315,1.5610,75,13);//55
	AddStaticVehicle(535,1439.5662,1999.9822,10.5843,0.4194,66,1);//56
	AddStaticVehicle(522,1430.2354,1999.0144,10.3896,352.0951,6,25);//57
	AddStaticVehicle(522,2156.3540,2188.6572,10.2414,22.6504,6,25);//58
	AddStaticVehicle(598,2277.6846,2477.1096,10.5652,180.1090,0,1);//59
	AddStaticVehicle(598,2268.9888,2443.1697,10.5662,181.8062,0,1);//60
	AddStaticVehicle(598,2256.2891,2458.5110,10.5680,358.7335,0,1);//61
	AddStaticVehicle(598,2251.6921,2477.0205,10.5671,179.5244,0,1);//62
	AddStaticVehicle(523,2294.7305,2441.2651,10.3860,9.3764,0,0);//63
	AddStaticVehicle(523,2290.7268,2441.3323,10.3944,16.4594,0,0);//64
	AddStaticVehicle(523,2295.5503,2455.9656,2.8444,272.6913,0,0);//65
	AddStaticVehicle(522,2476.7900,2532.2222,21.4416,0.5081,8,82);//66
	AddStaticVehicle(522,2580.5320,2267.9595,10.3917,271.2372,8,82);//67
	AddStaticVehicle(522,2814.4331,2364.6641,10.3907,89.6752,36,105);//68
	AddStaticVehicle(535,2827.4143,2345.6953,10.5768,270.0668,97,1);//69
	AddStaticVehicle(521,1670.1089,1297.8322,10.3864,359.4936,87,118);//70
	AddStaticVehicle(487,1614.7153,1548.7513,11.2749,347.1516,58,8);//71
	AddStaticVehicle(487,1647.7902,1538.9934,11.2433,51.8071,0,8);//72
	AddStaticVehicle(487,1608.3851,1630.7268,11.2840,174.5517,58,8);//73
	AddStaticVehicle(476,1283.0006,1324.8849,9.5332,275.0468,7,6); //74
	AddStaticVehicle(476,1283.5107,1361.3171,9.5382,271.1684,1,6); //75
	AddStaticVehicle(476,1283.6847,1386.5137,11.5300,272.1003,89,91);//76
	AddStaticVehicle(476,1288.0499,1403.6605,11.5295,243.5028,119,117);//77
	AddStaticVehicle(415,1319.1038,1279.1791,10.5931,0.9661,62,1);//78
	AddStaticVehicle(521,1710.5763,1805.9275,10.3911,176.5028,92,3);//79
	AddStaticVehicle(521,2805.1650,2027.0028,10.3920,357.5978,92,3);//80
	AddStaticVehicle(535,2822.3628,2240.3594,10.5812,89.7540,123,1);//81
	AddStaticVehicle(521,2876.8013,2326.8418,10.3914,267.8946,115,118);//82
	AddStaticVehicle(429,2842.0554,2637.0105,10.5000,182.2949,1,3);//83
	AddStaticVehicle(549,2494.4214,2813.9348,10.5172,316.9462,72,39);//84
	AddStaticVehicle(549,2327.6484,2787.7327,10.5174,179.5639,75,39);//85
	AddStaticVehicle(549,2142.6970,2806.6758,10.5176,89.8970,79,39);//86
	AddStaticVehicle(521,2139.7012,2799.2114,10.3917,229.6327,25,118);//87
	AddStaticVehicle(521,2104.9446,2658.1331,10.3834,82.2700,36,0);//88
	AddStaticVehicle(521,1914.2322,2148.2590,10.3906,267.7297,36,0);//89
	AddStaticVehicle(549,1904.7527,2157.4312,10.5175,183.7728,83,36);//90
	AddStaticVehicle(549,1532.6139,2258.0173,10.5176,359.1516,84,36);//91
	AddStaticVehicle(521,1534.3204,2202.8970,10.3644,4.9108,118,118);//92
	AddStaticVehicle(549,1613.1553,2200.2664,10.5176,89.6204,89,35);//93
	AddStaticVehicle(400,1552.1292,2341.7854,10.9126,274.0815,101,1);//94
	AddStaticVehicle(404,1637.6285,2329.8774,10.5538,89.6408,101,101);//95
	AddStaticVehicle(400,1357.4165,2259.7158,10.9126,269.5567,62,1);//96
	AddStaticVehicle(411,1281.7458,2571.6719,10.5472,270.6128,106,1);//97
	AddStaticVehicle(522,1305.5295,2528.3076,10.3955,88.7249,3,8);//98
	AddStaticVehicle(521,993.9020,2159.4194,10.3905,88.8805,74,74);//99
	AddStaticVehicle(415,1512.7134,787.6931,10.5921,359.5796,75,1);//100
	AddStaticVehicle(522,2299.5872,1469.7910,10.3815,258.4984,3,8);//101
	AddStaticVehicle(522,2133.6428,1012.8537,10.3789,87.1290,3,8);//102
	AddStaticVehicle(415,2266.7336,648.4756,11.0053,177.8517,0,1); //103
	AddStaticVehicle(461,2404.6636,647.9255,10.7919,183.7688,53,1); //104
	AddStaticVehicle(506,2628.1047,746.8704,10.5246,352.7574,3,3); //105
	AddStaticVehicle(549,2817.6445,928.3469,10.4470,359.5235,72,39); //106
	AddStaticVehicle(432,280.6046,1947.7534,17.6535,292.7167,43,0); //107
    AddStaticVehicle(432,277.6006,1962.3065,17.6534,244.6249,43,0); //108
    AddStaticVehicle(470,274.2997,1979.4880,17.6381,302.1927,43,0); //109
    AddStaticVehicle(470,276.4110,1989.4384,17.6378,272.5809,43,0); //110
    AddStaticVehicle(470,274.0979,1999.6416,17.6335,240.1509,43,0); //111
    AddStaticVehicle(520,275.8119,2016.7289,18.3641,300.5858,0,0); //112
    AddStaticVehicle(520,276.3031,2030.4640,18.3639,234.3945,0,0); //113
    AddStaticVehicle(415,2266.7336,648.4756,11.0053,177.8517,0,1); //114
	AddStaticVehicle(461,2404.6636,647.9255,10.7919,183.7688,53,1); //115
	AddStaticVehicle(506,2628.1047,746.8704,10.5246,352.7574,3,3); //116
	AddStaticVehicle(549,2817.6445,928.3469,10.4470,359.5235,72,39); //117
	AddStaticVehicle(562,1919.8829,947.1886,10.4715,359.4453,11,1); //118
	AddStaticVehicle(562,1881.6346,1006.7653,10.4783,86.9967,11,1); //119
	AddStaticVehicle(562,2038.1044,1006.4022,10.4040,179.2641,11,1); //120
	AddStaticVehicle(562,2038.1614,1014.8566,10.4057,179.8665,11,1); //121
	AddStaticVehicle(562,2038.0966,1026.7987,10.4040,180.6107,11,1); //122
	AddStaticVehicle(422,9.1065,1165.5066,19.5855,2.1281,101,25); ////123
	AddStaticVehicle(463,19.8059,1163.7103,19.1504,346.3326,11,11); ////124
	AddStaticVehicle(463,12.5740,1232.2848,18.8822,121.8670,22,22); ////125
	AddStaticVehicle(586,69.4633,1217.0189,18.3304,158.9345,10,1); //126
	AddStaticVehicle(586,-199.4185,1223.0405,19.2624,176.7001,25,1); //127
	AddStaticVehicle(476,325.4121,2538.5999,17.5184,181.2964,71,77); //128
	AddStaticVehicle(476,291.0975,2540.0410,17.5276,182.7206,7,6); //129
  	AddStaticVehicle(576,384.2365,2602.1763,16.0926,192.4858,72,1); //130
	AddStaticVehicle(586,423.8012,2541.6870,15.9708,338.2426,10,1); //131
	AddStaticVehicle(586,-244.0047,2724.5439,62.2077,51.5825,10,1); //132
	AddStaticVehicle(586,-311.1414,2659.4329,62.4513,310.9601,27,1); //133
	AddStaticVehicle(605,-340.2598,1177.4846,19.5565,182.6176,43,8); // SMASHED UP CAR 134 PUEDE CAUSAR CRASH!
	AddStaticVehicle(434,-110.8473,1133.7113,19.7091,359.7000,2,2); //hotknife 135 PUEDE CAUSAR CRASH!
    AddStaticVehicle(432,280.6046,1947.7534,17.6535,292.7167,43,0); //136
    AddStaticVehicle(432,277.6006,1962.3065,17.6534,244.6249,43,0); //137
    AddStaticVehicle(470,274.2997,1979.4880,17.6381,302.1927,43,0); //138
    AddStaticVehicle(470,276.4110,1989.4384,17.6378,272.5809,43,0); //139
    AddStaticVehicle(470,274.0979,1999.6416,17.6335,240.1509,43,0); //140
    AddStaticVehicle(520,275.8119,2016.7289,18.3641,300.5858,0,0); //145
    AddStaticVehicle(520,276.3031,2030.4640,18.3639,234.3945,0,0); //146
    AddStaticVehicle(587,-1987.9347,274.7294,34.8005,90.0485,60,1); // jesjer147
    AddStaticVehicle(602,-1987.8972,302.5392,34.8005,90.6657,60,1); // sultan148
    AddStaticVehicle(411,-1958.5787,302.2119,35.1896,70.2600,64,1); //149
    AddStaticVehicle(429,-1957.7386,288.1662,35.1354,123.7848,13,13); //150
    AddStaticVehicle(541,-1951.7734,273.7663,35.0970,70.0362,58,8); //151
    AddStaticVehicle(475,-1950.7637,260.1093,35.2615,40.6265,9,39); //152
	AddStaticVehicle(492,-2011.1948,128.8621,27.3762,356.5728,77,26); //153
    AddStaticVehicle(407,1726.3242,2078.9070,11.0564,273.1336,3,1); // Firetruck! 154
    AddStaticVehicle(416,1603.3068,1823.5874,10.9697,269.1584,1,3); // Ambulancia 155
    AddStaticVehicle(411,1596.9268,1850.8527,10.5470,182.4509,12,1); // 156
    AddStaticVehicle(411,1613.8701,1850.6614,10.5452,359.7687,12,1); // infernus 157
    AddStaticVehicle(592,1476.9312,1758.5229,12.0118,179.8497,1,1); // andromada 158
    AddStaticVehicle(519,1286.2931,1360.7391,11.7389,267.5030,1,1); // shamal 159
    AddStaticVehicle(560,1322.0990,1279.1182,10.5256,1.5521,41,29); // sultan 160
    AddStaticVehicle(560,1328.6270,1280.3264,10.5256,180.4559,41,29); // Sultan 161
    AddStaticVehicle(560,1282.5244,1287.7496,10.5256,92.0175,41,29); // sultan 162
    AddStaticVehicle(427,2312.0256,2429.1436,3.0192,180.8020,0,1); // ENFORCER 163
    AddStaticVehicle(601,2240.0911,2442.3350,3.0194,89.0028,0,1); // SWAT VAN 164
    AddStaticVehicle(427,2242.1611,2471.6396,3.0199,90.8559,0,1); // enforcer 165
    AddStaticVehicle(525,2273.7112,2458.8586,10.5674,357.9828,0,1); // two truck 166
    AddStaticVehicle(522,1044.8906,1358.5823,10.3905,178.9488,7,79); // nrg 167
    AddStaticVehicle(522,1049.6948,1355.1870,10.3896,175.1720,7,79); // nrg 168
    AddStaticVehicle(522,1057.6180,1357.8683,10.3941,187.3818,7,79); // nrg 169
    AddStaticVehicle(522,1084.4958,1356.1691,10.3897,172.5767,7,79); // nrg170

	//pickups
    bankp = CreatePickup(1239,23,2086.2510,2054.7212,11.0579);
 //menues

 //Zones
    //Properties
    AddProperty("Royal Casino", 2088.49, 1450.36, 10.82, 15000, 10000, 500);
    AddProperty("Coin-Laundry", 1937.30, 2301.27, 10.82, 40000, 20000, 5000);
    AddProperty("Sphinx", 2178.33, 1285.05, 10.82, 100000, 50000, 25000);
    AddProperty("Ganton Bridge", -2672.28, 1280.70, 55.94, 2000000, 1000000, 500000);
    AddProperty("Pyramid", 2323.75, 1283.34, 97.50, 1000000, 500000, 250000);
    AddProperty("4-Dragons Casino", 2024.44, 1007.89, 10.82, 50000, 50000, 25000);
    AddProperty("Wang Cars", -1951.43, 305.84, 41.04, 150000, 100000, 55000);
    AddProperty("Desert Gas Producer Station", 152.59, 1427.03, 10.59, 300000, 250000, 200000);
     //timers
    SetTimer("ScoreTimer",1000,true);
    SetTimer("ForumP",120000,true);
	SetTimer("PayDay",900000,true);
	SetTimer("PlayerInArea",1000, 1);
    //objectos
    CreateObject(1634, -1485.586914, 716.337097, 7.051349, 0.0000, 0.0000, 236.2501);
    CreateObject(1634, -1480.824097, 713.192383, 10.584179, 12.8916, 0.8594, 236.2501);
    CreateObject(1660, 1388.641968, 1233.580811, 9.240238, 0.0000, 0.0000, 180.0000);
    CreateObject(1660, 1388.981445, 1207.002197, 8.640247, 0.0000, 0.0000, 0.0001);
    CreateObject(1660, 1388.634277, 1228.420044, 12.593365, 0.0000, 0.0000, 180.0001);
    CreateObject(1515, -468.954803, 2300.716553, 57.540131, 343.6707, 318.7470, 295.3965);
    CreateObject(1833, -450.277283, 2289.766846, 51.975300, 321.3253, 33.5180, 123.2861);
    CreateObject(1681, 185.660858, 2481.454346, 15.512419, 340.2330, 347.1084, 353.1245);
    CreateObject(5153, 870.203857, 2519.835205, 20.615057, 0.0000, 335.9358, 168.7500);
    CreateObject(1634, 2343.778564, 1599.038086, 36.828590, 0.0000, 0.0000, 0.0000);
    CreateObject(1682, 1294.268921, 1579.339233, 55.751102, 0.0000, 0.0000, 270.0000);
    CreateObject(1683, -14.638409, 2492.748779, 20.537014, 19.7670, 32.6586, 173.0384);
    CreateObject(1491, 2294.228271, 2492.951904, 2.268332, 0.0000, 0.0000, 90.0000);
    CreateObject(1518, 1269.533813, 2525.634766, 10.100426, 0.0000, 0.0000, 135.0000);
    CreateObject(1518, 1269.544189, 2525.638916, 10.644818, 0.0000, 0.0000, 135.0000);
    CreateObject(1659, 1271.315308, 2528.576172, 12.330240, 0.0000, 0.0000, 0.0000);
    CreateObject(1700, 1271.291382, 2533.132080, 8.766133, 54.1445, 348.8273, 83.9066);
    LVPDDOOR = CreateObject(971, 2293.845703, 2499.351807, 5.754919, 0.0000, 0.0000, 270.0000);
    //CreateObject(971, 2293.823486, 2507.122559, 5.768078, 0.0000, 0.0000, 270.0000);
    LVPDDOOR2 = CreateObject(971, 2335.223145, 2444.243408, 8.263945, 0.0000, 0.0000, 57.9688);
   //CreateObject(971, 2339.340088, 2450.760986, 8.241816, 0.0000, 0.0000, 57.9688);
    CreateObject(13590, 1065.161011, 1288.919800, 12.196156, 0.0000, 0.0000, 191.2500);
    CreateObject(13636, 1043.434814, 1312.901733, 12.100704, 0.0000, 0.0000, 0.0000);
    CreateObject(13593, 1055.333984, 1305.895996, 10.563171, 0.0000, 0.0000, 90.0000);
    CreateObject(13639, 1059.069946, 1328.926270, 9.663580, 0.0000, 0.0000, 90.0000);
    CreateObject(13641, 1059.440186, 1337.396606, 11.539557, 0.0000, 0.0000, 270.0000);
    CreateObject(18451, 1041.761353, 1346.939697, 10.332739, 0.0000, 0.0000, 90.0000);
    CreateObject(1634, 1095.515259, 1234.105957, 11.117630, 0.0000, 0.0000, 180.0000);
    CreateObject(1634, 1091.647705, 1234.104614, 11.117630, 0.0000, 0.0000, 180.0000);
    CreateObject(1634, 1095.354980, 1228.607666, 15.241327, 24.0642, 0.8594, 180.0000);
    CreateObject(1634, 1091.736694, 1228.691772, 15.272955, 25.7831, 0.0000, 180.0000);
    CreateObject(1634, 1087.259888, 1334.628906, 11.117630, 5.1566, 0.0000, 276.9528);
    CreateObject(1634, 1106.431885, 1334.916504, 11.117630, 5.1566, 0.0000, 85.7029);
    CreateObject(13647, 1170.718262, 1298.404053, 9.816284, 0.0000, 0.0000, 90.0000);
    CreateObject(13648, 1162.961670, 1297.660400, 9.816284, 0.0000, 0.0000, 0.0000);
    CreateObject(13638, 1170.163940, 1331.490356, 10.734940, 0.0000, 1.7189, 180.0000);
    CreateObject(13604, 1126.455444, 1319.625610, 11.528328, 0.0000, 0.0000, 90.0000);
    CreateObject(12956, 1138.274780, 1240.223755, 13.648551, 0.0000, 0.0000, 90.0000);
    CreateObject(1697, 1140.531860, 1352.104248, 11.422192, 0.0000, 0.0000, 90.0000);
    CreateObject(1697, 1160.842529, 1351.024536, 15.172192, 0.0000, 0.0000, 90.0000);
    CreateObject(1697, 1171.059814, 1353.312256, 15.172192, 0.0000, 0.0000, 90.0000);
    CreateObject(3625, 1105.942017, 1281.111328, 12.655489, 0.0000, 0.0000, 90.0000);
    CreateObject(6052, 1110.811401, 1353.949463, 12.567953, 0.0000, 0.0000, 202.5000);
   
   //TextDraw
    Textdraw0 = TextDrawCreate(496.000000,4.000000,"Your Server Name Here");
    Textdraw1 = TextDrawCreate(6.000000,428.000000,"Your Server Page");
    TextDrawAlignment(Textdraw0,0);
    TextDrawAlignment(Textdraw1,0);
    TextDrawBackgroundColor(Textdraw0,0x0000ff33);
    TextDrawBackgroundColor(Textdraw1,0x000000ff);
    TextDrawFont(Textdraw0,0);
    TextDrawLetterSize(Textdraw0,0.599999,1.700000);
    TextDrawFont(Textdraw1,0);
    TextDrawLetterSize(Textdraw1,0.699999,1.700000);
    TextDrawColor(Textdraw0,0xff0000ff);
    TextDrawColor(Textdraw1,0xff0000ff);
    TextDrawSetOutline(Textdraw0,1);
    TextDrawSetOutline(Textdraw1,1);
    TextDrawSetProportional(Textdraw0,1);
    TextDrawSetProportional(Textdraw1,1);
    TextDrawSetShadow(Textdraw0,4);
    TextDrawSetShadow(Textdraw1,10);
    return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid,2181.4744,2201.9915,103.8786);
    SetPlayerCameraPos(playerid,2181.2852,2204.5435,103.8786);
	SetPlayerCameraLookAt(playerid,2181.4744,2201.9915,103.8786);
	SetPlayerFacingAngle(playerid,0.0);
    SetPlayerTeamFromClass(playerid, classid);
    SetupPlayerForClassSelection(playerid,classid);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
  new str[100];
  GetPlayerName(playerid, str, 24);
  format(str, 100, "%s has joined the server.", str);
  SendClientMessageToAll(0x808080AA, str);
  SendClientMessage(playerid,COLOR_GREEN,"Welcome To eXtreme RPG, use /commands foo some commands");
  PLAYERLIST_authed[playerid]=false;
  return false;
}

public OnPlayerDisconnect(playerid,reason)
{
  new Float:armor;
  ResetPlayerPropertyInfo(playerid);
  new ConnectName[30], str[100];
  GetPlayerName(playerid, ConnectName, 30);
  switch (reason)
  {
  case 0: format(str, 256, "%s has left the server! (Timeout)", ConnectName);
  case 1: format(str, 256, "%s has left the server! (Leaving)", ConnectName);
  case 2: format(str, 256, "%s has left the server! (Kicked)", ConnectName);
  }
  SendClientMessageToAll(COLOR_RED, str);
  if (PLAYERLIST_authed[playerid])
  {
     // Was loggedin, so save the data!
  dUserSetINT(PlayerName(playerid)).("money",GetPlayerMoney(playerid));
  dUserSetINT(PlayerName(playerid)).("armor",GetPlayerArmour(playerid,armor));
  }
  PLAYERLIST_authed[playerid]=false;
  return false;
}

public OnPlayerSpawn(playerid)
{
	new string[256];
	new name[256];
	GetPlayerName(playerid,name,256);
	if(!PLAYERLIST_authed[playerid])
	{
	GameTextForPlayer(playerid,"~r~PLEASE REGISTER!",10000,2);
	SetPlayerHealth(playerid,0.0);
	ForceClassSelection(playerid);
	SendClientMessage(playerid,COLOR_RED,"Please Login Before Spawn!");
	}
	if(gTeam[playerid] == TEAM_Drug) return SetPlayerPos(playerid,1541.5452,922.6074,10.8203);
	if(gTeam[playerid] == TEAM_Triads) return SetPlayerPos(playerid,2021.6825,1007.5576,10.8203);
	if(gTeam[playerid] == TEAM_Mafia) return SetPlayerPos(playerid,2190.7332,1675.8595,11.7403);
    TextDrawShowForPlayer(playerid,Textdraw0);
    TextDrawShowForPlayer(playerid,Textdraw1);
    if(gTeam[playerid] == TEAM_Police) return SendClientMessage(playerid,COLOR_RED,"AAA");
	{
	if(accept[playerid] == 0)
	{
	TogglePlayerControllable(playerid,0);
	format(string,sizeof(string),"Welcome To eXtreme RPG %s, before you can play you must read the rules");
	SendClientMessage(playerid,COLOR_YELLOW,string);
	SendClientMessage(playerid,COLOR_YELLOW,"These are the Rules!");
	SendClientMessage(playerid,COLOR_YELLOW,"Dont Spam!, Dont Hack, Dont Ask  For Admin Powers!,");
	SendClientMessage(playerid,COLOR_YELLOW,"Dont be Anoying!, Dont ask for money on main chat!(use /pm),");
	SendClientMessage(playerid,COLOR_YELLOW,"Dont DM Unless you are on a DM zone!, Respect the Admins,");
	SendClientMessage(playerid,COLOR_YELLOW,"Respect the Other Players.");
	SendClientMessage(playerid,COLOR_YELLOW,"If you accept this rulez type '/accept'!");
	}
	}
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

public OnPlayerCommandText(playerid,cmdtext[])
{
  if (strcmp("/pos", cmdtext, true, 10) == 0)
{
           new string1[256];
           new Float:X,Float:Y,Float:Z;
           GetPlayerPos(playerid,X,Y,Z);
           format(string1,sizeof(string1),"Position = X: %.0f , Y: %.0f , Z: %.0f",X,Y,Z);
           SendClientMessage(playerid,0x33FF33AA,string1);
           return 1;
   }
  dcmd(login,5,cmdtext); // because login has 5 characters
  dcmd(register,8,cmdtext); // because register has 8 characters
  if(!PLAYERLIST_authed[playerid]) return SendClientMessage(playerid,COLOR_RED,"You must login before using commands");
  dcmd(map,3,cmdtext);//1
  dcmd(atm,3,cmdtext);//2
  dcmd(dive,4,cmdtext);//3
  dcmd(exit,4,cmdtext);//4
  dcmd(bank,4,cmdtext);//5
  dcmd(buymap,6,cmdtext);//6
  dcmd(myfood,6,cmdtext);//7
  dcmd(buyfood,7,cmdtext);//8
  dcmd(cardive,7,cmdtext);//9
  dcmd(commands,8,cmdtext);//10
  dcmd(lvairport,9,cmdtext);//11
  dcmd(buyphone,8,cmdtext);//12
  dcmd(buywater,8,cmdtext);//13
  dcmd(eat,3,cmdtext);//14
  dcmd(wank,4,cmdtext);//15
  dcmd(accept,6,cmdtext);//16
  dcmd(buyprop,7,cmdtext);//17
  dcmd(sellprop,8,cmdtext);//19
  dcmd(afk,3,cmdtext);//20
  dcmd(opengate,8,cmdtext);
  dcmd(opengate2,9,cmdtext);
  //job
  dcmd(ckbjob,6,cmdtext);
  dcmd(wspjob,6,cmdtext);
  //bank
  dcmd(deposit,7,cmdtext);//+1
  dcmd(balance,7,cmdtext);//+2
  dcmd(withdraw,8,cmdtext);//+3
  //phone commands
    //admins
  dcmd(get,3,cmdtext);//admin 1
  dcmd(fix,3,cmdtext);//admin 2
  dcmd(flip,4,cmdtext); //admin 3
  dcmd(vfix,4,cmdtext); //admin 4
  dcmd(goto,4,cmdtext);//admin 5
  dcmd(admcmd,6,cmdtext);//admin 6
  //clothes
  dcmd(buyclothes,10,cmdtext);
  dcmd(clothes1,8,cmdtext);
  return false;
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
	SendClientMessage(playerid,COLOR_GREEN,"You arrived to your destiny!");
	DisablePlayerCheckpoint(playerid);
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
OnPropertyPickupPickup(playerid, pickupid);
if(pickupid == bankp)
{
SetPlayerInterior(playerid,10);
SetPlayerPos(playerid,246.40,110.84, 1003.22);
SendClientMessage(playerid,COLOR_GREEN,"Welcome to the bank, use /EXIT for exit the bank");
}
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
SetPlayerTeamFromClass(playerid, classid)
{
	if (classid == 0)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 1)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 2)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 3)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 4)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 5)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 6)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 7)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 8)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 9)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 10)
	{
		gTeam[playerid] = TEAM_Police;
	}
	if (classid == 11)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 12)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 13)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 14)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 15)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 16)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 17)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 18)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 19)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 20)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 21)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 22)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 23)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 24)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 25)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 26)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 27)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 28)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 29)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 30)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 31)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 32)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 33)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 34)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 35)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 36)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 37)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 38)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 39)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 40)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 41)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 42)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 43)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 44)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 45)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 46)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 47)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 48)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 49)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 50)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 51)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 52)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 53)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 54)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 55)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 56)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 57)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 58)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 59)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 60)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 61)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 62)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 63)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 64)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 65)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 66)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 67)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 68)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 69)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 70)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 71)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 72)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 73)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 74)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 75)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 76)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 77)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 78)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 79)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 80)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 81)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 82)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 83)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 84)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 85)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 86)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 87)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 88)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 89)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 90)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 91)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 92)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 93)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 94)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 95)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 96)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 97)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 98)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 99)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 101)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 102)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 103)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 104)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 105)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 106)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 107)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 108)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 109)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 100)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 110)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 111)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 112)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 113)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 114)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 115)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 116)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 117)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 118)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 119)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 120)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 121)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 122)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 123)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 124)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 125)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 126)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 127)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 128)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 129)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 130)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 131)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 132)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 133)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 134)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 135)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 136)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 137)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 138)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 139)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 140)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 141)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 142)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 143)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 144)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 145)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 146)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 147)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 148)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 149)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 150)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 151)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 152)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 153)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 154)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 155)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 156)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 157)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 158)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 159)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 160)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 161)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 162)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 163)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 164)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 165)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 166)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 167)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 168)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 169)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 170)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 171)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 172)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 173)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 174)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 175)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 176)
	{
		gTeam[playerid] = TEAM_Civillian;
	}
	if (classid == 177)
	{
		gTeam[playerid] = TEAM_Beach;
	}
	if (classid == 178)
	{
		gTeam[playerid] = TEAM_Beach;
	}
	if (classid == 179)
	{
		gTeam[playerid] = TEAM_Beach;
	}
	if (classid == 190)
	{
		gTeam[playerid] = TEAM_Beach;
	}
	if (classid == 191)
	{
		gTeam[playerid] = TEAM_Beach;
	}
	if (classid == 192)
	{
		gTeam[playerid] = TEAM_Beach;
	}
	if (classid == 193)
	{
		gTeam[playerid] = TEAM_Ballas;
	}
	if (classid == 194)
	{
		gTeam[playerid] = TEAM_Ballas;
	}
	if (classid == 195)
	{
		gTeam[playerid] = TEAM_Ballas;
	}
	if (classid == 196)
	{
		gTeam[playerid] = TEAM_Groove;
	}
	if (classid == 197)
	{
		gTeam[playerid] = TEAM_Groove;
	}
	if (classid == 198)
	{
		gTeam[playerid] = TEAM_Groove;
	}
	if (classid == 199)
	{
		gTeam[playerid] = TEAM_Groove;
	}
	if (classid == 200)
	{
		gTeam[playerid] = TEAM_Groove;
	}
	if (classid == 201)
	{
		gTeam[playerid] = TEAM_Groove;
	}
	if (classid == 202)
	{
		gTeam[playerid] = TEAM_VLA;
	}
	if (classid == 203)
	{
		gTeam[playerid] = TEAM_VLA;
	}
	if (classid == 204)
	{
		gTeam[playerid] = TEAM_VLA;
	}
	if (classid == 205)
	{
		gTeam[playerid] = TEAM_Vagos;
	}
	if (classid == 206)
	{
		gTeam[playerid] = TEAM_VLA;
	}
	if (classid == 207)
	{
		gTeam[playerid] = TEAM_VLA;
	}
	if (classid == 208)
	{
		gTeam[playerid] = TEAM_TNB;
	}
	if (classid == 209)
	{
		gTeam[playerid] = TEAM_VLA;
	}
	if (classid == 210)
	{
		gTeam[playerid] = TEAM_VLA;
	}
	if (classid == 211)
	{
		gTeam[playerid] = TEAM_SFR;
	}
	if (classid == 212)
	{
		gTeam[playerid] = TEAM_SFR;
	}
	if (classid == 213)
	{
		gTeam[playerid] = TEAM_SFR;
	}
	if (classid == 214)
	{
		gTeam[playerid] = TEAM_Triads;
	}
	if (classid == 215)
	{
		gTeam[playerid] = TEAM_Triads;
	}
	if (classid == 216)
	{
		gTeam[playerid] = TEAM_Triads;
	}
	if (classid == 217)
	{
		gTeam[playerid] = TEAM_Bikers;
	}
	if (classid == 218)
	{
		gTeam[playerid] = TEAM_Bikers;
	}
	if (classid == 219)
	{
		gTeam[playerid] = TEAM_Bikers;
	}
	if (classid == 220)
	{
		gTeam[playerid] = TEAM_Bikers;
	}
	if (classid == 221)
	{
		gTeam[playerid] = TEAM_Mafia;
	}
	if (classid == 222)
	{
		gTeam[playerid] = TEAM_Mafia;
	}
	if (classid == 223)
	{
		gTeam[playerid] = TEAM_Mafia;
	}
	if (classid == 224)
	{
		gTeam[playerid] = TEAM_Mafia;
	}
	if (classid == 225)
	{
		gTeam[playerid] = TEAM_Mafia;
	}
	if (classid == 226)
	{
		gTeam[playerid] = TEAM_Mafia;
	}
	if (classid == 227)
	{
		gTeam[playerid] = TEAM_Drug;
	}

}
public ScoreTimer(playerid)
{
for(new i=0; i<MAX_PLAYERS; i++)
{
new NScore = GetPlayerMoney(i);
{
if(IsPlayerConnected(i))
{
SetPlayerScore(i,NScore);
}
}
}
return 1;
}
public PayDay(playerid)
{
for(new i=0; i<MAX_PLAYERS; i++)
if(PLAYERLIST_authed[playerid])
{
SendClientMessage(i,COLOR_GREEN,"Here is your Check of the Day, Enjoy it!");
GameTextForAll("~b~PayDay!",3000,6);
GivePlayerMoney(i,50000);
}
return 1;
}
public ForumP()
{
new rand;
rand = random(8);
switch(rand)
{
case 0:
{
SendClientMessageToAll(COLOR_YELLOW,"Remember to Visit www.extremerpg.tk!");
print("ForumPublicity has just been sended");
}
case 1:
{
SendClientMessageToAll(COLOR_YELLOW,"Found Any Bug? Report it At The Forums!");
print("Bug Publicity has been sended");
}
case 2:
{
SendClientMessageToAll(COLOR_YELLOW,"Found Any Tag Mistach? Report it at the Forums!");
print("Tag Mistach Publicity Sended");
}
case 3:
{
SendClientMessageToAll(COLOR_YELLOW,"Remember to Visit www.extremerpg.tk!");
print("ForumPublicity has just been sended");
}
case 4:
{
SendClientMessageToAll(COLOR_YELLOW,"Remember to Visit www.extremerpg.tk!");
print("ForumPublicity has just been sended");
}
case 5:
{
SendClientMessageToAll(COLOR_YELLOW,"Remember to make publicity of the Server And Site!");
print("Remember form has just been sended");
}
case 6:
{
SendClientMessageToAll(COLOR_YELLOW,"Remember to make publicity of the Server And Site!");
print("Remember form has just been sended");
}
case 7:
{
SendClientMessageToAll(COLOR_YELLOW,"Remember to make publicity of the Server And Site!");
print("Remember form has just been sended");
}
}
return 1;
}
public Wank(playerid)
{
ClearAnimations(playerid);
iswanking[playerid] = 0;
new rand;
new string[256];
new name[256];
GetPlayerName(playerid,name,256);
rand = random(2); //Change 3 to how many events could happen...
switch(rand) //Make it random
{
case 0: 
{
format(string,sizeof(string),"%s Is Now Satisfacted",name);
SendClientMessageToAll(COLOR_GREEN,string);
}
case 1:
{
format(string,sizeof(string),"%s Has Cum On His Own Pants :|",name);
SendClientMessageToAll(COLOR_GREEN,string);
}
}
return 1;
}
public SetupPlayerForClassSelection(playerid,classid)
{
switch (classid)
{
case 0..10:
{
GameTextForPlayer(playerid,"Police",1000,6);
}
case 11..176:
{
GameTextForPlayer(playerid,"~g~Civillians",1000,6);
}
case 177..192:
{
GameTextForPlayer(playerid,"~b~Beaches",1000,6);
}
case 193..195:
{
GameTextForPlayer(playerid,"~w~Gang: Ballas",1000,6);
}
case 196..201:
{
GameTextForPlayer(playerid,"~y~Gang: Grove Street",1000,6);
}
case 202..204:
{
GameTextForPlayer(playerid,"~p~Gang: Varios Los Aztecas",1000,6);
}
case 205..207:
{
GameTextForPlayer(playerid,"~r~Gang: Vagos",1000,6);
}
case 208..210:
{
GameTextForPlayer(playerid,"~g~Gang: The Nang Boys",1000,6);
}
case 211..213:
{
GameTextForPlayer(playerid,"~b~Gang: SF Rifa",1000,6);
}
case 214..216:
{
GameTextForPlayer(playerid,"~W~Gang: Triads",1000,6);
}
case 217..220:
{
GameTextForPlayer(playerid,"~y~Gang: Bikers",1000,6);
}
case 221..226:
{
GameTextForPlayer(playerid,"~p~Gang: Mafia",1000,6);
}
case 227:
{
GameTextForPlayer(playerid,"~r~Drug Dealer",1000,6);
}
}
return 1;
}
public IsNumeric(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++)
	if (string[i] > '9' || string[i] < '0')
    return 0;
	return 1;
}
public CluckinJob(playerid)
{
if(GetPlayerSkin(playerid) == 167)
{
if(GetPlayerInterior(playerid) == 9)
{
GivePlayerMoney(playerid,1000);
SendClientMessage(playerid,COLOR_GREEN,"You Just Earn 1000$");
}
else
{
KillTimer(CluckinTimer);
SendClientMessage(playerid,COLOR_RED,"You Dont Work for Cluckin-Bell Any More!");
}
}
return 1;
}
public WellSTimer(playerid)
{
if(GetPlayerSkin(playerid) ==155) 
{
if(GetPlayerInterior(playerid) == 5)
{
GivePlayerMoney(playerid,1000);
SendClientMessage(playerid,COLOR_GREEN,"You Just Earn 1000$");
}
else
{
KillTimer(WSPT);
SendClientMessage(playerid,COLOR_RED,"You Dont Work For Well Stacked Pizza Any more!");
}
}
return 1;
}
public Door()
{
MoveObject(LVPDDOOR,2293.845703, 2499.351807, 5.754919,2);
return 1;
}
public Door2()
{
MoveObject(LVPDDOOR2,2335.223145, 2444.243408, 8.263945,2);
return 1;
}

