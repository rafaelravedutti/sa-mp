//-------------This code was designed by tAxI aka Necrioss------------//
//-------------------email <::> cptnsausage@hotmail.com--------------------//
//---------If you are having problems please feel free to contact me-------//

/*
	tAxI's RPG/Freeroam World - GM Package for SA-MP Multiplayer Modification
    of Grand Theft Auto - San Andreas.

    Copyright (C) 2007  Chris Johnstone (tAxI/Necrioss)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

#include <a_samp>
#include <dudb>
#include <time>
#include <file>
#include <float>
#pragma tabsize 0
#pragma dynamic 145000

#define V_FILE_LOAD "tAxI_SYS_SETUP/tAxI_vehicles_setup.tAxI"
#define B_FILE_LOAD "tAxI_SYS_SETUP/tAxI_businesses_setup.tAxI"
#define V_FILE_SAVE "tAxI_SYS_SAVE/tAxI_vehicles_perm.tAxI"
#define B_FILE_SAVE "tAxI_SYS_SAVE/tAxI_businesses_perm.tAxI"
#define P_FILE "tAxI_SYS_PLAYERS/%s.tAxI"
#define B_ICON 1272
#define B_ICON_TYPE 2
#define PD_TIMER 1800000
#define CALL_UNIT_COST 1
#define DEFAULT_OWNER "[null]"
#define V_LIMIT 700
#define B_LIMIT 250
#define GasMax 100
#define RunOutTime 30000
#define COLOR_AQUA 0x7CFC00AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x0AFF0AAA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_DARKRED 0x660000AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_BRIGHTRED 0xFF0000AA
#define COLOR_INDIGO 0x4B00B0AA
#define CP_STATION1   0
#define CP_STATION2   1
#define CP_STATION3   2
#define CP_STATION4   3
#define CP_STATION5   4
#define CP_STATION6   5
#define CP_STATION7   6
#define CP_STATION8   7
#define CP_STATION9   8
#define CP_STATION10  9
#define CP_STATION11  10
#define CP_STATION12  11
#define CP_STATION13  12
#define CP_STATION14  13
#define CP_STATION15  14
#define CP_STATION16  15
#define CP_LVSTATION  16
#define CP_VMSTATION  17
#define CP_LSSTATION  18
#define CP_SFSTATION  19
#define CP_BANK 		20
#define CP_BANK_2 		21
#define CP_BANK_3 		22

#define TEAM_BALLA 0
#define TEAM_GROVE 1
#define TEAM_VAGO 2
#define TEAM_AZTEC 3
#define TEAM_TRIAD 4
#define TEAM_FIRE 5
#define TEAM_MEDIC 6
#define TEAM_COP 7
#define TEAM_CIV 8
#define TEAM_ARMY 9

new Text:vehiclehpbar[12];

new Float:PlayerRandomSpawn[9][4] = {
{2031.2622,1343.2483,10.8203,270.1700},
{2017.6318,1545.4016,10.8292,269.8567},
{1704.9874,1454.4901,10.8166,266.0967},
{2140.9788,2281.4158,10.8203,267.0366},
{2294.7498,2421.5452,10.8203,181.1824},
{2179.7900,1286.4680,10.8203,270.4599},
{2176.1526,1119.2438,12.6617,63.0313},
{2027.6475,1007.7634,10.8203,271.0866},
{2390.8379,986.6993,10.8203,46.7612}
};

forward SetPlayerRandomSpawn(playerid);

enum bInfo
{
	name[256],
	owner[256],
	bought,
	cost,
	profit,
	cashbox,
 	Float:xpos,
    Float:ypos,
    Float:zpos,
}

new BizInfo[B_LIMIT][bInfo];

enum pInfo
{
	name[256],
	vowned,
	vowner,
	bowner,
	bowned,
	pass,
	pcash,
	bank,
	logged,
	admin,
	team,
	frozen,
	jailed,
	vhpb,
}
	
new PlayerInfo[MAX_PLAYERS][pInfo];

#define MAX_ACTIVE_MM_ICONS 32
new MMstreamcount[MAX_PLAYERS];
new MIactive[MAX_PLAYERS][B_LIMIT];
new MIidnum[MAX_PLAYERS][B_LIMIT];

enum mmapinfo
{
	mmodel,
	Float:mx_spawn,
	Float:my_spawn,
	Float:mz_spawn,
	Float:mspawndist,
	mvalid,
};
new MapIconInfo[B_LIMIT][mmapinfo];

enum vInfo
{
	model,
	Float:x_spawn,
	Float:y_spawn,
	Float:z_spawn,
 	Float:za_spawn,
 	color_1,
 	color_2,
 	owner[256],
	vehiclecost,
	vused,
	bought,
	secure,
	asecure,
	buybar,
	name[256],
	mod1,
	mod2,
	mod3,
	mod4,
	mod5,
	mod6,
	mod7,
	mod8,
	mod9,
	mod10,
	mod11,
	mod12,
	mod13,
	mod14,
	mod15,
	mod16,
	mod17,
	paintjob,
 	gas,
 	modding,
};

new bizmsg[MAX_PLAYERS];
new VehicleInfo[V_LIMIT][vInfo];
new bizcount;
new vehcount;


new Menu:vehiclemain;
new Menu:playervm;
new Menu:buysell;
new Menu:secure1;
new Menu:secure2;
new Menu:templock;
new Menu:adminm;
new Menu:asecure1;
new Menu:asecure2;
new Menu:speedom;
new Menu:buyable;
new Menu:healthbar;

new VehicleName[212][0] = {
   "Landstalker",
   "Bravura",
   "Buffalo",
   "Linerunner",
   "Pereniel",
   "Sentinel",
   "Dumper",
   "Firetruck",
   "Trashmaster",
   "Stretch",
   "Manana",
   "Infernus",
   "Voodoo",
   "Pony",
   "Mule",
   "Cheetah",
   "Ambulance",
   "Leviathan",
   "Moonbeam",
   "Esperanto",
   "Taxi",
   "Washington",
   "Bobcat",
   "Mr Whoopee",
   "BF Injection",
   "Hunter",
   "Premier",
   "Enforcer",
   "Securicar",
   "Banshee",
   "Predator",
   "Bus",
   "Rhino",
   "Barracks",
   "Hotknife",
   "Trailer", //artict1
   "Previon",
   "Coach",
   "Cabbie",
   "Stallion",
   "Rumpo",
   "RC Bandit",
   "Romero",
   "Packer",
   "Monster Truck",
   "Admiral",
   "Squalo",
   "Seasparrow",
   "Pizzaboy",
   "Tram",
   "Trailer", //artict2
   "Turismo",
   "Speeder",
   "Reefer",
   "Tropic",
   "Flatbed",
   "Yankee",
   "Caddy",
   "Solair",
   "Berkley's RC Van",
   "Skimmer",
   "PCJ-600",
   "Faggio",
   "Freeway",
   "RC Baron",
   "RC Raider",
   "Glendale",
   "Oceanic",
   "Sanchez",
   "Sparrow",
   "Patriot",
   "Quad",
   "Coastguard",
   "Dinghy",
   "Hermes",
   "Sabre",
   "Rustler",
   "ZR-350",
   "Walton",
   "Regina",
   "Comet",
   "BMX",
   "Burrito",
   "Camper",
   "Marquis",
   "Baggage",
   "Dozer",
   "Maverick",
   "News Chopper",
   "Rancher",
   "FBI Rancher",
   "Virgo",
   "Greenwood",
   "Jetmax",
   "Hotring",
   "Sandking",
   "Blista Compact",
   "Police Maverick",
   "Boxville",
   "Benson",
   "Mesa",
   "RC Goblin",
   "Hotring Racer", //hotrina
   "Hotring Racer", //hotrinb
   "Bloodring Banger",
   "Rancher",
   "Super GT",
   "Elegant",
   "Journey",
   "Bike",
   "Mountain Bike",
   "Beagle",
   "Cropdust",
   "Stunt",
   "Tanker", //petro
   "RoadTrain",
   "Nebula",
   "Majestic",
   "Buccaneer",
   "Shamal",
   "Hydra",
   "FCR-900",
   "NRG-500",
   "HPV1000",
   "Cement Truck",
   "Tow Truck",
   "Fortune",
   "Cadrona",
   "FBI Truck",
   "Willard",
   "Forklift",
   "Tractor",
   "Combine",
   "Feltzer",
   "Remington",
   "Slamvan",
   "Blade",
   "Freight",
   "Streak",
   "Vortex",
   "Vincent",
   "Bullet",
   "Clover",
   "Sadler",
   "Firetruck", //firela
   "Hustler",
   "Intruder",
   "Primo",
   "Cargobob",
   "Tampa",
   "Sunrise",
   "Merit",
   "Utility",
   "Nevada",
   "Yosemite",
   "Windsor",
   "Monster Truck", //monstera
   "Monster Truck", //monsterb
   "Uranus",
   "Jester",
   "Sultan",
   "Stratum",
   "Elegy",
   "Raindance",
   "RC Tiger",
   "Flash",
   "Tahoma",
   "Savanna",
   "Bandito",
   "Freight", //freiflat
   "Trailer", //streakc
   "Kart",
   "Mower",
   "Duneride",
   "Sweeper",
   "Broadway",
   "Tornado",
   "AT-400",
   "DFT-30",
   "Huntley",
   "Stafford",
   "BF-400",
   "Newsvan",
   "Tug",
   "Trailer", //petrotr
   "Emperor",
   "Wayfarer",
   "Euros",
   "Hotdog",
   "Club",
   "Trailer", //freibox
   "Trailer", //artict3
   "Andromada",
   "Dodo",
   "RC Cam",
   "Launch",
   "Police Car (LSPD)",
   "Police Car (SFPD)",
   "Police Car (LVPD)",
   "Police Ranger",
   "Picador",
   "S.W.A.T. Van",
   "Alpha",
   "Phoenix",
   "Glendale",
   "Sadler",
   "Luggage Trailer", //bagboxa
   "Luggage Trailer", //bagboxb
   "Stair Trailer", //tugstair
   "Boxville",
   "Farm Plow", //farmtr1
   "Utility Trailer" //utiltr1
};

new	heavycar[24][0] = {
	{406},
	{444},
	{556},
	{557},
	{573},
	{601},
	{407},
	{427},
	{433},
	{434},
	{499},
	{498},
	{482},
	{431},
	{524},
	{578},
	{455},
	{403},
	{414},
	{443},
	{515},
	{428},
	{408},
	{456}
};
new	boat[11][0] = {
	{472},
	{473},
	{493},
	{595},
	{484},
	{430},
	{453},
	{452},
	{446},
	{454},
	{539}
};
new	mbike[11][0] = {
	{581},
	{521},
	{462},
	{463},
	{468},
	{471},
	{586},
	{522},
	{523},
	{461},
	{448}
};
new	pbike[3][0] = {
	{481},
	{509},
	{510}
};
new	splane[6][0] = {
	{593},
	{512},
	{513},
	{460},
	{464},
	{465}
};
new	mplane[2][0] = {
	{519},
	{511}
};
new	lplane[2][0] = {
	{553},
	{592}
};
new milair[4][0] = {
	{520},
	{476},
	{447},
	{425}
};
new sheli[4][0] = {
	{487},
	{488},
	{469},
	{497}
};
new lheli[3][0] = {
	{417},
	{548},
	{563}
};
new gPlayerClass[MAX_PLAYERS];
new tmpname[256];
new Count[MAX_PLAYERS];
new passenger[MAX_PLAYERS];
new speedo[MAX_PLAYERS];
new messaged[MAX_PLAYERS];
new aMessage[MAX_PLAYERS];
new tempid[MAX_PLAYERS];
new lockmess[V_LIMIT];
new securemess[V_LIMIT];
new carmess[999];

enum SavePlayerPosEnum
{
    Float:LastX,
    Float:LastY,
    Float:LastZ
}
new SavePlayerPos[MAX_PLAYERS][SavePlayerPosEnum];

new Float:ta, Float:tb, Float:tc;
new PlayerInterior[MAX_PLAYERS];
new tuned;
new cseconds,cstring[256];
new Filling[MAX_PLAYERS];
new spoiler[20][0] = {
	{1000},
	{1001},
	{1002},
	{1003},
	{1014},
	{1015},
	{1016},
	{1023},
	{1058},
	{1060},
	{1049},
	{1050},
	{1138},
	{1139},
	{1146},
	{1147},
	{1158},
	{1162},
	{1163},
	{1164}
};

new nitro[3][0] = {
    {1008},
    {1009},
    {1010}
};

new fbumper[23][0] = {
    {1117},
    {1152},
    {1153},
    {1155},
    {1157},
    {1160},
    {1165},
    {1167},
    {1169},
    {1170},
    {1171},
    {1172},
    {1173},
    {1174},
    {1175},
    {1179},
    {1181},
    {1182},
    {1185},
    {1188},
    {1189},
    {1192},
    {1193}
};

new rbumper[22][0] = {
    {1140},
    {1141},
    {1148},
    {1149},
    {1150},
    {1151},
    {1154},
    {1156},
    {1159},
    {1161},
    {1166},
    {1168},
    {1176},
    {1177},
    {1178},
    {1180},
    {1183},
    {1184},
    {1186},
    {1187},
    {1190},
    {1191}
};

new exhaust[28][0] = {
    {1018},
    {1019},
    {1020},
    {1021},
    {1022},
    {1028},
    {1029},
    {1037},
    {1043},
    {1044},
    {1045},
    {1046},
    {1059},
    {1064},
    {1065},
    {1066},
    {1089},
    {1092},
    {1104},
    {1105},
    {1113},
    {1114},
    {1126},
    {1127},
    {1129},
    {1132},
    {1135},
    {1136}
};

new bventr[2][0] = {
    {1042},
    {1044}
};

new bventl[2][0] = {
    {1043},
    {1045}
};

new bscoop[4][0] = {
	{1004},
	{1005},
	{1011},
	{1012}
};

new rscoop[13][0] = {
    {1006},
    {1032},
    {1033},
    {1035},
    {1038},
    {1053},
    {1054},
    {1055},
    {1061},
    {1067},
    {1068},
    {1088},
    {1091}
};

new lskirt[21][0] = {
    {1007},
    {1026},
    {1031},
    {1036},
    {1039},
    {1042},
    {1047},
    {1048},
    {1056},
    {1057},
    {1069},
    {1070},
    {1090},
    {1093},
    {1106},
    {1108},
    {1118},
    {1119},
    {1133},
    {1122},
    {1134}
};

new rskirt[21][0] = {
    {1017},
    {1027},
    {1030},
    {1040},
    {1041},
    {1051},
    {1052},
    {1062},
    {1063},
    {1071},
    {1072},
    {1094},
    {1095},
    {1099},
    {1101},
    {1102},
    {1107},
    {1120},
    {1121},
    {1124},
    {1137}
};

new hydraulics[1][0] = {
    {1087}
};

new base[1][0] = {
    {1086}
};

new rbbars[2][0] = {
    {1109},
    {1110}
};

new fbbars[2][0] = {
    {1115},
    {1116}
};

new wheels[17][0] = {
    {1025},
    {1073},
    {1074},
    {1075},
    {1076},
    {1077},
    {1078},
    {1079},
    {1080},
    {1081},
    {1082},
    {1083},
    {1084},
    {1085},
    {1096},
    {1097},
    {1098}
};

new lights[2][0] = {
	{1013},
	{1024}
};

new Calling[MAX_PLAYERS];
new Answered[MAX_PLAYERS];
new Callerid[MAX_PLAYERS];

new Float:Pickup[23][3] = {
{2109.2126,917.5845,10.8203}, //fuelstations
{2640.1831,1103.9224,10.8203},
{611.8934,1694.7921,6.7193},
{-1327.5398,2682.9771,49.7896},
{-2413.7427,975.9317,45.0031},
{-1672.3597,414.2950,6.8866},
{-2244.1365,-2560.6294,31.6276},
{-1603.0166,-2709.3589,48.2419},
{1939.3275,-1767.6813,13.2787},
{-94.7651,-1174.8079,1.9979},
{1381.6699,462.6467,19.8540},
{657.8167,-559.6507,16.0630},
{-1478.2916,1862.8318,32.3617},
{2147.3054,2744.9377,10.5263},
{2204.9602,2480.3494,10.5278},
{1590.9493,2202.2637,10.5247},
{1561.5695,1448.6895,10.3636},
{366.4071,2535.3784,16.8363},
{1969.3317,-2303.8423,13.2547},
{-1299.7939,-26.2385,13.8556},
{-22.2549,-55.6575,1003.5469},//banks
{-23.0664,-90.0882,1003.5469},
{-33.9593,-29.0792,1003.5573}
};

forward ScoreUpdate();
forward IsPlayerNameOnline(compname[]);
forward fillcheck();
forward ParkVehicle(vehicleid);
forward resetmessage();
forward FuelDown();
forward Fill();
forward resetcount();
forward announcer();
forward CheckGas();
forward BackupInfo();
forward GetDriverID(vehicleid);
forward ModVehicle(vehicleid);
forward SaveComponent(vehicleid,componentid);
forward SavePaintjob(vehicleid,paintjobid);
forward SaveColors(vehicleid,color1,color2);
forward PhoneCut();
forward KickTimer(playerid);
forward CallVehicleToPlayer(playerid);
forward RestartVehicle(vehicleid);
forward ctimer();
forward ResetText(playerid);
forward PayDay();
forward VHPBarUpdate();
forward minimapstreamer();




main()
{
    printf(" ");
 	printf(" ");
	print("\n----------------------------------");
	print("tAxI's RPG/Freeroam World [v0.2.7b]");
	print("----------------------------------\n");
}

public OnPlayerExitedMenu(playerid)
{
	TogglePlayerControllable(playerid, true);
	return 1;
}

public PhoneCut()
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (Calling[i] > -1 && Answered[i] == 1 && Callerid[i] == 1)
			{
				if (GetPlayerMoney(i) >= CALL_UNIT_COST)
				{
					GivePlayerMoney(i, -CALL_UNIT_COST);
				}
				if (GetPlayerMoney(i) < CALL_UNIT_COST)
				{
					SendClientMessage(i, COLOR_BRIGHTRED, "CUT OFF: You don't have enough cash to continue this call");
					SendClientMessage(Calling[i], COLOR_BRIGHTRED, "CUT OFF: Your recipient's phone has been cut off due to lack of credit");
					Calling[Calling[i]] = -1;
					Answered[Calling[i]] = 0;
					Calling[i] = -1;
					Answered[i] = 0;
					Callerid[i] = 0;
				}
			}
		}
	}
	return 1;
}

public minimapstreamer()
{
	for(new j = 0;j<MAX_PLAYERS;j++) {
 		if(IsPlayerConnected(j)) {
			for(new K = 1;K<B_LIMIT;K++) {
			    if(MapIconInfo[K][mvalid] == 1) {
					if(MIactive[j][K] == 0) {
					   	if(MMstreamcount[j] < MAX_ACTIVE_MM_ICONS) {
							if(IsPlayerClose(j,MapIconInfo[K][mx_spawn],MapIconInfo[K][my_spawn],MapIconInfo[K][mz_spawn],MapIconInfo[K][mspawndist]) == 1) {
								SetPlayerMapIcon(j,MIidnum[j][K],MapIconInfo[K][mx_spawn],MapIconInfo[K][my_spawn],MapIconInfo[K][mz_spawn],MapIconInfo[K][mmodel],1);
								MMstreamcount[j]++;
								MIactive[j][K] = 1;
							}
						}
					}
					else if(IsPlayerClose(j,MapIconInfo[K][mx_spawn],MapIconInfo[K][my_spawn],MapIconInfo[K][mz_spawn],MapIconInfo[K][mspawndist]) == 0) {
						RemovePlayerMapIcon(j,MIidnum[j][K]);
						MIactive[j][K] = 0;
						MMstreamcount[j]--;
					}
				}
			}
		}
	}
}

stock IsPlayerClose(playerid,Float:x,Float:y,Float:z,Float:MAX)
{
	new Float:PPos[3];
	GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
	if (PPos[0] >= floatsub(x, MAX) && PPos[0] <= floatadd(x, MAX)
	&& PPos[1] >= floatsub(y, MAX) && PPos[1] <= floatadd(y, MAX)
	&& PPos[2] >= floatsub(z, MAX) && PPos[2] <= floatadd(z, MAX))
	{
		return 1;
	}
	return 0;
}

stock CreateStreamMapIcon(markermodel,Float:x,Float:y,Float:z,Float:spawn_distance)
{
	for(new i = 1;i<B_LIMIT;i++) {
		if(MapIconInfo[i][mvalid] == 0) {
			MapIconInfo[i][mmodel] = markermodel;
			for(new j=0;j<MAX_PLAYERS;j++) {
				MIidnum[j][i] = i;
			}
			MapIconInfo[i][mx_spawn] = x;
			MapIconInfo[i][my_spawn] = y;
			MapIconInfo[i][mz_spawn] = z;
			MapIconInfo[i][mspawndist] = spawn_distance;
			MapIconInfo[i][mvalid] = 1;
			return i;
		}
	}
	return 0;
}

public OnPlayerText(playerid, text[])
{
	if (Calling[playerid] > -1 && Answered[playerid] == 1)
	{
    	new string[256];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(Calling[playerid], COLOR_YELLOW, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		return 0;
	}
	return 1;
}

public PayDay()
{
    SendClientMessageToAll(COLOR_LIGHTBLUE,"PAYDAY: All business earnings have been updated and all players have recieved a rebate of $10000");
	for (new i = 0; i < MAX_PLAYERS; i++) {
	    if(IsPlayerConnected(i)) {
	    	GivePlayerMoney(i,10000);
	    	if(PlayerInfo[i][bowner] == 1) {
	    		SendClientMessage(i,COLOR_LIGHTBLUE,"To collect you business' earnings return to your business and type '/cashbox'");
			}
		}
	}
	for (new i = 0; i < bizcount; i++) {
	    if(BizInfo[i][bought] == 1) {
	    	new cbmon = BizInfo[i][cashbox], pmon = BizInfo[i][profit];
	    	BizInfo[i][cashbox] = cbmon+pmon;
		}
	}
}

public OnGameModeInit()
{
    SetGameModeText("tAxI's RPG/Freeroam World [v0.2.7b]");
    printf(" ");
 	printf(" ");
    print(">------------------------------------------------");
	print("tAxI's Vehicle System Is Initialising, Please Wait...");
	printf(">------------------------------------------------");
	printf(" ");
    SetTimer("FuelDown", RunOutTime, 1);
    SetTimer("CheckGas", 500, 1);
    SetTimer("Fill", 200, 1);
    SetTimer("fillcheck", 100, 1);
    SetTimer("BackupInfo",120000,1);
    SetTimer("PhoneCut",1000,1);
    SetTimer("ScoreUpdate",1000,1);
    SetTimer("ctimer",1000,1);
    SetTimer("PayDay",PD_TIMER,1);
    SetTimer("minimapstreamer",250,1);
    
    print(">------------------------------------------------");
    vehcount = CountVehicles(V_FILE_LOAD);
    bizcount = CountBusinesses(B_FILE_LOAD);
    new vehmes[256];
	format(vehmes,sizeof(vehmes),"Verifying %s (Complete) - %d Vehicle Spawns Verified!", V_FILE_LOAD, vehcount);
	printf(vehmes);
	print(">------------------------------------------------");
	printf(" ");
	print(">------------------------------------------------");
	LoadVehicles();
    print(" ");
    print(">------------------------------------------------");
    for(new c=1;c<=vehcount;c++)
	{
	 	VehicleInfo[c][gas] = GasMax;
	 	new strings[256];
	 	format(strings,sizeof(strings),"Fuelling Up Vehicle ID: %d / Type: %s", c, VehicleName[GetVehicleModel(c)-400][0]);
		printf(strings);
 	}
 	print(">------------------------------------------------");
 	print(" ");
 	print(">------------------------------------------------");
 	for(new c=1;c<=vehcount;c++)
	{
	 	ModVehicle(c);
	 	new strings[256];
	 	format(strings,sizeof(strings),"Checking Vehicle File For saved Mods - Vehicle ID: %d / Type: %s", c, VehicleName[GetVehicleModel(c)-400][0]);
		printf(strings);
 	}
 	print(">------------------------------------------------");
 	printf(" ");
	print(">------------------------------------------------");
	format(tmpname,sizeof(tmpname),"     %d Vehicles Were Tuned On Server Load!     ",tuned);
  	printf(" ");
	print(">------------------------------------------------");
	printf(tmpname);
	print(">------------------------------------------------");
	format(tmpname,sizeof(tmpname),"    %d Vehicles Were Refuelled On Server Load!   ",vehcount);
  	printf(" ");
	print(">------------------------------------------------");
	printf(tmpname);
	print(">------------------------------------------------");
 	printf(" ");
	print(">------------------------------------------------");
	print("tAxI's Vehicle System Status - 100% - System Ready...");
	print(">------------------------------------------------");
	print(" ");
	print(" ");
	print(">------------------------------------------------");
	print("Loading Businesses...Please Wait...");
	print(" ");
	LoadBusinesses();
	for(new i=0;i<bizcount;i++) {
        if(BizInfo[i][bought] == 0) {
            CreateStreamMapIcon(31,BizInfo[i][xpos],BizInfo[i][ypos],BizInfo[i][zpos],250);
		}
		else {
		    CreateStreamMapIcon(32,BizInfo[i][xpos],BizInfo[i][ypos],BizInfo[i][zpos],250);
		}
	}
	for(new i=0;i<20;i++) {
		CreateStreamMapIcon(55,Pickup[i][0],Pickup[i][1],Pickup[i][2],250);
	}
	print(">------------------------------------------------");
 	new bizmess[256];
 	format(bizmess,256,"%d Businesses Successfully loaded and created",bizcount);
 	printf(bizmess);
 	print(">------------------------------------------------");
 	printf("");
	print(">------------------------------------------------");
	print("tAxI's Business System Status - 100% - System Ready...");
	print(">------------------------------------------------");
	print(" ");
	print(" ");
	
	//vehicle Menu System! Trial Version!
	
	vehiclemain = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(vehiclemain,0,"Player Vehicle Menu");
	AddMenuItem(vehiclemain,0,"Vehicle Admin System");
	AddMenuItem(vehiclemain,0,"<exit>");
	
	playervm = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(playervm,0,"Refuel Vehicle");
	AddMenuItem(playervm,0,"Temp Lock");
	AddMenuItem(playervm,0,"Vehicle Health Bar");
	AddMenuItem(playervm,0,"Dash Board Settings");
	AddMenuItem(playervm,0,"Vehicle Ownership");
	AddMenuItem(playervm,0,"Call Your Vehicle");
	AddMenuItem(playervm,0,"Park Your Vehicle");
	AddMenuItem(playervm,0,"Vehicle Security");
	AddMenuItem(playervm,0,"<back>");
	
	adminm = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(adminm,0,"Sell Current Vehicle");
	AddMenuItem(adminm,0,"Set Purchase Status");
	AddMenuItem(adminm,0,"Set Admin Protection");
	AddMenuItem(adminm,0,"<back>");
	
	buysell = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(buysell,0,"Buy This Vehicle");
	AddMenuItem(buysell,0,"Sell This Vehicle");
	AddMenuItem(buysell,0,"<back>");
	
	secure1 = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(secure1,0,"Switch On Alarm");
	AddMenuItem(secure1,0,"Switch Off Alarm");
	AddMenuItem(secure1,0,"<back>");
	
	secure2 = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(secure2,0,"Lethal Mode");
	AddMenuItem(secure2,0,"Non-Lethal Mode");
	AddMenuItem(secure2,0,"<back>");
	
	asecure1 = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(asecure1,0,"Switch On Admin Security");
	AddMenuItem(asecure1,0,"Switch Off Admin Security");
	AddMenuItem(asecure1,0,"<back>");

	asecure2 = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(asecure2,0,"Lethal Mode");
	AddMenuItem(asecure2,0,"Non-Lethal Mode");
	AddMenuItem(asecure2,0,"<back>");
	
	templock = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(templock,0,"Lock Vehicle");
	AddMenuItem(templock,0,"Unlock Vehicle");
	AddMenuItem(templock,0,"<back>");
	
	speedom = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(speedom,0,"Switch On Dashboard");
	AddMenuItem(speedom,0,"Switch Off Dashboard");
	AddMenuItem(speedom,0,"<back>");
	
	buyable = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(buyable,0,"Set To Buyable");
	AddMenuItem(buyable,0,"Set To Unbuyable");
	AddMenuItem(buyable,0,"<back>");
	
	healthbar = CreateMenu("tAxI-XVM",1,440,140,150,40);
	AddMenuItem(healthbar,0,"Switch On");
	AddMenuItem(healthbar,0,"Switch Off");
	AddMenuItem(healthbar,0,"<back>");
	
	EnableTirePopping(1);
	
 	AddPlayerClass(102,832.2958,-1080.4476,24.2969,107.7328,0,0,0,0,0,0); //balla
    AddPlayerClass(103,832.2958,-1080.4476,24.2969,107.7328,0,0,0,0,0,0); //balla
    AddPlayerClass(104,832.2958,-1080.4476,24.2969,107.7328,0,0,0,0,0,0); //balla
    AddPlayerClass(105,2495.2207,-1687.3169,13.5152,107.7328,0,0,0,0,0,0); //grove
    AddPlayerClass(106,2495.2207,-1687.3169,13.5152,107.7328,0,0,0,0,0,0); //grove
    AddPlayerClass(107,2495.2207,-1687.3169,13.5152,107.7328,0,0,0,0,0,0); //grove
    AddPlayerClass(108,2459.0442,-949.4450,80.0800,107.7328,0,0,0,0,0,0); //vago
    AddPlayerClass(110,2459.0442,-949.4450,80.0800,107.7328,0,0,0,0,0,0); //vago
    AddPlayerClass(114,1761.7893,-1892.7225,13.5551,107.7328,0,0,0,0,0,0); //azteca
    AddPlayerClass(115,1761.7893,-1892.7225,13.5551,107.7328,0,0,0,0,0,0); //azteca
    AddPlayerClass(116,1761.7893,-1892.7225,13.5551,107.7328,0,0,0,0,0,0); //azteca
    AddPlayerClass(122,1499.2067,-937.3587,37.4407,107.7328,0,0,0,0,0,0); //Triad
    AddPlayerClass(123,1499.2067,-937.3587,37.4407,107.7328,0,0,0,0,0,0); //Triad
    AddPlayerClass(274,1499.2067,-937.3587,37.4407,107.7328,0,0,0,0,0,0); //Medic
    AddPlayerClass(275,1499.2067,-937.3587,37.4407,107.7328,0,0,0,0,0,0); //Medic
    AddPlayerClass(277,1499.2067,-937.3587,37.4407,107.7328,0,0,0,0,0,0); //Fireman
    AddPlayerClass(280,1552.5618,-1675.3375,16.1953,107.7328,0,0,0,0,0,0); //Cop
    AddPlayerClass(281,1552.5618,-1675.3375,16.1953,107.7328,0,0,0,0,0,0); //Cop
    AddPlayerClass(283,1552.5618,-1675.3375,16.1953,107.7328,0,0,0,0,0,0); //Cop
    AddPlayerClass(287,1552.5618,-1675.3375,16.1953,112.5582,0,0,0,0,0,0); //Army
    AddPlayerClass(286,1552.5618,-1675.3375,16.1953,112.5582,0,0,0,0,0,0); //Swat
	AddPlayerClass(214,1552.5618,-1675.3375,16.1953,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(215,1552.5618,-1675.3375,16.1953,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(216,1552.5618,-1675.3375,16.1953,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(251,1552.5618,-1675.3375,16.1953,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(253,1552.5618,-1675.3375,16.1953,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(254,1552.5618,-1675.3375,16.1953,269.1425,0,0,24,300,-1,-1);
	AddPlayerClass(255,1552.5618,-1675.3375,16.1953,269.1425,0,0,24,300,-1,-1);
	
	//-----------Vehicle healthbar stuff :D
	
 	vehiclehpbar[0] = TextDrawCreate(549.0, 50.0, "KABOOM!");
	TextDrawUseBox(vehiclehpbar[0], true);
	TextDrawBoxColor(vehiclehpbar[0], COLOR_BRIGHTRED);
	TextDrawSetShadow(vehiclehpbar[0],0);
	TextDrawTextSize(vehiclehpbar[0], 625, 0);

	vehiclehpbar[1] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[1], true);
	TextDrawBoxColor(vehiclehpbar[1], COLOR_BRIGHTRED);
	TextDrawSetShadow(vehiclehpbar[1],0);
	TextDrawTextSize(vehiclehpbar[1], 551, 0);

	vehiclehpbar[2] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[2], true);
	TextDrawBoxColor(vehiclehpbar[2], COLOR_BRIGHTRED);
	TextDrawSetShadow(vehiclehpbar[2],0);
	TextDrawTextSize(vehiclehpbar[2], 556, 0);

	vehiclehpbar[3] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[3], true);
	TextDrawBoxColor(vehiclehpbar[3], COLOR_BRIGHTRED);
	TextDrawSetShadow(vehiclehpbar[3],0);
	TextDrawTextSize(vehiclehpbar[3], 561, 0);

	vehiclehpbar[4] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[4], true);
	TextDrawBoxColor(vehiclehpbar[4], COLOR_YELLOW);
	TextDrawSetShadow(vehiclehpbar[4],0);
	TextDrawTextSize(vehiclehpbar[4], 566, 0);

	vehiclehpbar[5] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[5], true);
	TextDrawBoxColor(vehiclehpbar[5], COLOR_YELLOW);
	TextDrawSetShadow(vehiclehpbar[5],0);
	TextDrawTextSize(vehiclehpbar[5], 571, 0);

	vehiclehpbar[6] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[6], true);
	TextDrawBoxColor(vehiclehpbar[6], COLOR_YELLOW);
	TextDrawSetShadow(vehiclehpbar[6],0);
	TextDrawTextSize(vehiclehpbar[6], 576, 0);

	vehiclehpbar[7] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[7], true);
	TextDrawBoxColor(vehiclehpbar[7], COLOR_YELLOW);
	TextDrawSetShadow(vehiclehpbar[7],0);
	TextDrawTextSize(vehiclehpbar[7], 581, 0);

	vehiclehpbar[8] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[8], true);
	TextDrawBoxColor(vehiclehpbar[8], COLOR_GREEN);
	TextDrawSetShadow(vehiclehpbar[8],0);
	TextDrawTextSize(vehiclehpbar[8], 586, 0);

	vehiclehpbar[9] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[9], true);
	TextDrawBoxColor(vehiclehpbar[9], COLOR_GREEN);
	TextDrawSetShadow(vehiclehpbar[9],0);
	TextDrawTextSize(vehiclehpbar[9], 591, 0);

	vehiclehpbar[10] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[10], true);
	TextDrawBoxColor(vehiclehpbar[10], COLOR_GREEN);
	TextDrawSetShadow(vehiclehpbar[10],0);
	TextDrawTextSize(vehiclehpbar[10], 596, 0);

	vehiclehpbar[11] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[11], true);
	TextDrawBoxColor(vehiclehpbar[11], COLOR_GREEN);
	TextDrawSetShadow(vehiclehpbar[11],0);
	TextDrawTextSize(vehiclehpbar[11], 602, 0);

	SetTimer("VHPBarUpdate",250,1);
	
	//---------------------------------------------------------
	
    for(new i = 0;i<20;i++) {
    	AddStaticPickup(1239,B_ICON_TYPE,Pickup[i][0],Pickup[i][1],Pickup[i][2]);
	}
	for(new i = 20;i<23;i++) {
    	AddStaticPickup(1274,B_ICON_TYPE,Pickup[i][0],Pickup[i][1],Pickup[i][2]);
	}
	
	return 1;
}

public VHPBarUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		TextDrawHideForPlayer(i,vehiclehpbar[0]);
		TextDrawHideForPlayer(i,vehiclehpbar[1]);
		TextDrawHideForPlayer(i,vehiclehpbar[2]);
		TextDrawHideForPlayer(i,vehiclehpbar[3]);
		TextDrawHideForPlayer(i,vehiclehpbar[4]);
		TextDrawHideForPlayer(i,vehiclehpbar[5]);
		TextDrawHideForPlayer(i,vehiclehpbar[6]);
		TextDrawHideForPlayer(i,vehiclehpbar[7]);
		TextDrawHideForPlayer(i,vehiclehpbar[8]);
		TextDrawHideForPlayer(i,vehiclehpbar[9]);
		TextDrawHideForPlayer(i,vehiclehpbar[10]);
		TextDrawHideForPlayer(i,vehiclehpbar[11]);
		if(IsPlayerInAnyVehicle(i) == 1 && PlayerInfo[i][vhpb] == 1){
			new vehicleid;
			vehicleid = GetPlayerVehicleID(i);
			new Float:vhp;
			GetVehicleHealth(vehicleid,vhp);
			if(vhp >= 0 && vhp <= 249){
			    TextDrawShowForPlayer(i,vehiclehpbar[0]);
			}
			if(vhp >= 250 && vhp <= 317){
			    TextDrawShowForPlayer(i,vehiclehpbar[1]);
			}
			else if(vhp >= 318 && vhp <= 385){
				TextDrawShowForPlayer(i,vehiclehpbar[2]);
			}
			else if(vhp >= 386 && vhp <= 453){
				TextDrawShowForPlayer(i,vehiclehpbar[3]);
			}
			else if(vhp >= 454 && vhp <= 521){
				TextDrawShowForPlayer(i,vehiclehpbar[4]);
			}
			else if(vhp >= 522 && vhp <= 589){
				TextDrawShowForPlayer(i,vehiclehpbar[5]);
			}
			else if(vhp >= 590 && vhp <= 657){
				TextDrawShowForPlayer(i,vehiclehpbar[6]);
			}
			else if(vhp >= 658 && vhp <= 725){
				TextDrawShowForPlayer(i,vehiclehpbar[7]);
			}
			else if(vhp >= 726 && vhp <= 793){
				TextDrawShowForPlayer(i,vehiclehpbar[8]);
			}
			else if(vhp >= 794 && vhp <= 861){
				TextDrawShowForPlayer(i,vehiclehpbar[9]);
			}
			else if(vhp >= 862 && vhp <= 929){
				TextDrawShowForPlayer(i,vehiclehpbar[10]);
			}
			else if(vhp >= 930 && vhp <= 1000){
				TextDrawShowForPlayer(i,vehiclehpbar[11]);
			}
		}
	}
	return 1;
}


public ctimer()
{
    if (cseconds)
    {
        format(cstring,6,"~w~%d", cseconds-1);
        GameTextForAll(cstring,1100,4);
        SoundForAll(1056);
        cseconds --;
        if (!cseconds)
        {
            GameTextForAll("~r~GO GO GO!!!",2000,4);
            SoundForAll(1057);
            for (new i = 0; i < MAX_PLAYERS; i ++)
    		{
        		if (IsPlayerConnected(i)) SetTimer("resetcount",2000,0);
   			}
        }
    }
}

stock SoundForAll(sound)
{
    for (new i = 0; i <= MAX_PLAYERS; i ++)
    {
        if (IsPlayerConnected(i) == 1) {
			PlayerPlaySound(i,sound,0.0,0.0,0.0);
		}
    }
}

public SetPlayerRandomSpawn(playerid)
{
	new rand = random(sizeof(PlayerRandomSpawn));
	SetPlayerPos(playerid, PlayerRandomSpawn[rand][0], PlayerRandomSpawn[rand][1], PlayerRandomSpawn[rand][2]);
	SetPlayerFacingAngle(playerid,PlayerRandomSpawn[rand][3]);
	return 1;
}

stock SetupPlayerForClassSelection(playerid)
{
	SetPlayerPos(playerid, 2182.2908,1285.7317,42.9620);
	SetPlayerFacingAngle(playerid, 89.8567);
	SetPlayerCameraPos(playerid, 2177.5269,1285.3782,44.0867);
	SetPlayerCameraLookAt(playerid, 2182.2908,1285.7317,42.9620);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
  SetPlayerClass(playerid, classid);
  SetupPlayerForClassSelection(playerid);
  gPlayerClass[playerid] = classid;
  switch (classid) {
    case 0: {
    GameTextForPlayer(playerid,"~p~Balla",700,6);
	}
    case 1: {
    GameTextForPlayer(playerid,"~p~Balla",700,6);
	}
    case 2: {
    GameTextForPlayer(playerid,"~p~Balla",700,6);
	}
    case 3: {
    GameTextForPlayer(playerid,"~g~Grove",700,6);
	}
    case 4: {
    GameTextForPlayer(playerid,"~g~Grove",700,6);
	}
    case 5: {
    GameTextForPlayer(playerid,"~g~Grove",700,6);
	}
    case 6: {
    GameTextForPlayer(playerid,"~y~Vago",700,6);
	}
    case 7: {
    GameTextForPlayer(playerid,"~y~Vago",700,6);
    }
    case 8: {
    GameTextForPlayer(playerid,"~h~~b~Azteca",700,6);
    }
    case 9: {
    GameTextForPlayer(playerid,"~h~~b~Azteca",700,6);
    }
    case 10: {
    GameTextForPlayer(playerid,"~h~~b~Azteca",700,6);
    }
    case 11: {
    GameTextForPlayer(playerid,"~r~Triad",700,6);
    }
    case 12: {
    GameTextForPlayer(playerid,"~r~Triad",700,6);
    }
    case 13: {
    GameTextForPlayer(playerid,"~b~Medic",700,6);
    }
    case 14: {
    GameTextForPlayer(playerid,"~b~Medic",700,6);
    }
    case 15: {
    GameTextForPlayer(playerid,"~r~Fireman",700,6);
    }
    case 16: {
    GameTextForPlayer(playerid,"~b~Cop",700,6);
    }
    case 17: {
    GameTextForPlayer(playerid,"~b~Cop",700,6);
    }
    case 18: {
    GameTextForPlayer(playerid,"~b~Cop",700,6);
    }
    case 19: {
    GameTextForPlayer(playerid,"~g~Army",700,6);
    }
    case 20: {
    GameTextForPlayer(playerid,"~b~Swat",700,6);
    }
    case 21: {
    GameTextForPlayer(playerid,"~w~Civilian",700,6);
    }
    case 22: {
    GameTextForPlayer(playerid,"~w~Civilian",700,6);
    }
    case 23: {
    GameTextForPlayer(playerid,"~w~Civilian",700,6);
    }
    case 24: {
    GameTextForPlayer(playerid,"~w~Civilian",700,6);
    }
    case 25: {
    GameTextForPlayer(playerid,"~w~Civilian",700,6);
    }
    case 26: {
    GameTextForPlayer(playerid,"~w~Civilian",700,6);
    }
    case 27: {
    GameTextForPlayer(playerid,"~w~Civilian",700,6);
    }
  }
	return 1;
}

SetPlayerClass(playerid, classid)
{
  switch(classid) {

    case 0: {
    PlayerInfo[playerid][team] = TEAM_BALLA;
	}
    case 1: {
    PlayerInfo[playerid][team] = TEAM_BALLA;
	}
    case 2: {
    PlayerInfo[playerid][team] = TEAM_BALLA;
	}
    case 3: {
    PlayerInfo[playerid][team] = TEAM_GROVE;
	}
    case 4: {
    PlayerInfo[playerid][team] = TEAM_GROVE;
	}
    case 5: {
    PlayerInfo[playerid][team] = TEAM_GROVE;
	}
    case 6: {
    PlayerInfo[playerid][team] = TEAM_VAGO;
	}
    case 7: {
    PlayerInfo[playerid][team] = TEAM_VAGO;
    }
    case 8: {
    PlayerInfo[playerid][team] = TEAM_AZTEC;
    }
    case 9: {
    PlayerInfo[playerid][team] = TEAM_AZTEC;
    }
    case 10: {
    PlayerInfo[playerid][team] = TEAM_AZTEC;
    }
    case 11: {
    PlayerInfo[playerid][team] = TEAM_TRIAD;
    }
    case 12: {
    PlayerInfo[playerid][team] = TEAM_TRIAD;
    }
    case 13: {
    PlayerInfo[playerid][team] = TEAM_MEDIC;
    }
    case 14: {
    PlayerInfo[playerid][team] = TEAM_MEDIC;
    }
    case 15: {
    PlayerInfo[playerid][team] = TEAM_FIRE;
    }
    case 16: {
    PlayerInfo[playerid][team] = TEAM_COP;
    }
    case 17: {
    PlayerInfo[playerid][team] = TEAM_COP;
    }
    case 18: {
    PlayerInfo[playerid][team] = TEAM_COP;
    }
    case 19: {
    PlayerInfo[playerid][team] = TEAM_ARMY;
    }
    case 20: {
    PlayerInfo[playerid][team] = TEAM_COP;
    }
    case 21: {
    PlayerInfo[playerid][team] = TEAM_CIV;
    }
    case 22: {
    PlayerInfo[playerid][team] = TEAM_CIV;
    }
    case 23: {
    PlayerInfo[playerid][team] = TEAM_CIV;
    }
    case 24: {
    PlayerInfo[playerid][team] = TEAM_CIV;
    }
    case 25: {
    PlayerInfo[playerid][team] = TEAM_CIV;
    }
    case 26: {
    PlayerInfo[playerid][team] = TEAM_CIV;
    }
    case 27: {
    PlayerInfo[playerid][team] = TEAM_CIV;
    }
  }
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SendDeathMessage(killerid,playerid,reason);
    new moneytemp;
	moneytemp = GetPlayerMoney(playerid);
	ResetPlayerMoney(playerid);
    GivePlayerMoney(killerid,moneytemp/2);
	return 1;
}

public KickTimer(playerid)
{
	if(PlayerInfo[playerid][logged] == 0) {
	    SendClientMessage(playerid,COLOR_BRIGHTRED, "You have been kicked from the server for Login Timeout!");
	    Kick(playerid);
	    new kickmess[256];
	    format(kickmess,sizeof(kickmess),"%s was kicked from the server. Reason: Login Timeout!",PlayerInfo[playerid][name]);
        SendClientMessage(playerid,COLOR_BRIGHTRED,kickmess);
	}
}

public OnPlayerSpawn(playerid)
{
    if(PlayerInfo[playerid][logged] == 0) {
        SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
		SendClientMessage(playerid,COLOR_YELLOW, "You have not logged in yet!");
 		SendClientMessage(playerid,COLOR_YELLOW, "Please register your current player name with '/register [password]' and login with '/login [password]'");
 		SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
	}
    SetPlayerColor(playerid,COLOR_GREY);
 	switch(PlayerInfo[playerid][team]) {
	  case TEAM_BALLA: {
	   GivePlayerWeapon(playerid,32,100);
	   GivePlayerWeapon(playerid,25,100);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_BRIGHTRED);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_GROVE: {
	   GivePlayerWeapon(playerid,28,200);
	   GivePlayerWeapon(playerid,30,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_BRIGHTRED);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_VAGO: {
	   GivePlayerWeapon(playerid,31,200);
	   GivePlayerWeapon(playerid,32,100);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_WHITE);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_AZTEC: {
	   GivePlayerWeapon(playerid,27,100);
	   GivePlayerWeapon(playerid,30,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_BLUE);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_TRIAD: {
	   GivePlayerWeapon(playerid,27,100);
	   GivePlayerWeapon(playerid,30,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_YELLOW);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_MEDIC: {
	   GivePlayerWeapon(playerid,27,100);
	   GivePlayerWeapon(playerid,28,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_LIGHTBLUE);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_FIRE: {
	   GivePlayerWeapon(playerid,27,100);
	   GivePlayerWeapon(playerid,28,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_PINK);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_COP: {
	   GivePlayerWeapon(playerid,24,100);
	   GivePlayerWeapon(playerid,31,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_BLUE);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_ARMY: {
	   GivePlayerWeapon(playerid,24,100);
	   GivePlayerWeapon(playerid,31,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_GREEN);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	  case TEAM_CIV: {
	   GivePlayerWeapon(playerid,28,200);
	   GivePlayerWeapon(playerid,30,200);
	   GivePlayerWeapon(playerid,4,1);
	   SetPlayerColor(playerid,COLOR_ORANGE);
	   if(PlayerInfo[playerid][logged] == 1 && PlayerInfo[playerid][bowner] == 1) {
   			SetPlayerPos(playerid,BizInfo[PlayerInfo[playerid][bowned]][xpos],BizInfo[PlayerInfo[playerid][bowned]][ypos],BizInfo[PlayerInfo[playerid][bowned]][zpos]);
    		SendClientMessage(playerid,COLOR_GREEN,"You have been spawned at the entrance to your business");
    		return 1;
    	}
	   SetPlayerRandomSpawn(playerid);
	  }
	}
	GivePlayerWeapon(playerid,4,1);
	return 1;
}


stock CountVehicles(filename[]) {
    new File:VehicleFile;
    new blank[256];
    new count = 0;
    if (fexist(V_FILE_SAVE)) {
        VehicleFile = fopen(V_FILE_SAVE);
        while(fread(VehicleFile, blank, sizeof blank)) {
            count++;
        }
        fclose(VehicleFile);
    }
    else {
        VehicleFile = fopen(filename);
        while(fread(VehicleFile, blank, sizeof blank)) {
            count++;
        }
        fclose(VehicleFile);
    }

    return count;
}

stock CountBusinesses(filename[]) {
    new File:BusinessFile;
    new blank[256];
    new count = 0;
    if (fexist(B_FILE_SAVE)) {
        BusinessFile = fopen(B_FILE_SAVE);
        while(fread(BusinessFile, blank, sizeof blank)) {
            count++;
        }
        fclose(BusinessFile);
    }
    else {
        BusinessFile = fopen(filename);
        while(fread(BusinessFile, blank, sizeof blank)) {
            count++;
        }
        fclose(BusinessFile);
    }

    return count;
}

stock split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;

	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return 1;
}

stock SetupVehiclesFile()
{
    new File: file;
    file = fopen(V_FILE_SAVE, io_write);
    new SplitDiv[99][V_LIMIT];
	new filestring[256];
	file = fopen(V_FILE_LOAD, io_read);
	new carcost[V_LIMIT];
	for(new vehicleid=1;vehicleid<=vehcount;vehicleid++)
	{
		if (file)
		{
			fread(file, filestring);
		 	split(filestring, SplitDiv, ',');
			VehicleInfo[vehicleid][model] = strval(SplitDiv[0]);
			VehicleInfo[vehicleid][x_spawn] = floatstr(SplitDiv[1]);
			VehicleInfo[vehicleid][y_spawn] = floatstr(SplitDiv[2]);
			VehicleInfo[vehicleid][z_spawn] = floatstr(SplitDiv[3]);
			VehicleInfo[vehicleid][za_spawn] = floatstr(SplitDiv[4]);
			VehicleInfo[vehicleid][color_1] = strval(SplitDiv[5]);
			VehicleInfo[vehicleid][color_2] = strval(SplitDiv[6]);
			CreateVehicle(VehicleInfo[vehicleid][model], VehicleInfo[vehicleid][x_spawn], VehicleInfo[vehicleid][y_spawn], VehicleInfo[vehicleid][z_spawn], VehicleInfo[vehicleid][za_spawn], VehicleInfo[vehicleid][color_1], VehicleInfo[vehicleid][color_2],20000);
			carcost[vehicleid] = 50000;
    		for(new s=0; s<24; s++) {
     			if(VehicleInfo[vehicleid][model] == heavycar[s][0]) {
       				carcost[vehicleid] = 100000;
   	        	}
			}
			for(new a=0; a<11; a++) {
     			if(VehicleInfo[vehicleid][model] == boat[a][0]) {
       				carcost[vehicleid] = 50000;
   	   		     }
			}
			for(new b=0; b<11; b++) {
	     		if(VehicleInfo[vehicleid][model] == mbike[b][0]) {
   	    			carcost[vehicleid] = 40000;
	   	        }
			}
			for(new d=0; d<3; d++) {
   		  		if(VehicleInfo[vehicleid][model] == pbike[d][0]) {
       				carcost[vehicleid] = 3000;
   	   		     }
			}
			for(new e=0; e<6; e++) {
    	 		if(VehicleInfo[vehicleid][model] == splane[e][0]) {
       				carcost[vehicleid] = 500000;
   	        	}
			}
			for(new f=0; f<2; f++) {
     			if(VehicleInfo[vehicleid][model] == mplane[f][0]) {
       					carcost[vehicleid] = 1500000;
   	    	    }
			}
			for(new v=0; v<2; v++) {
     			if(VehicleInfo[vehicleid][model] == lplane[v][0]) {
       				carcost[vehicleid] = 2000000;
   	    	    }
			}
			for(new n=0; n<4; n++) {
     			if(VehicleInfo[vehicleid][model] == milair[n][0]) {
       				carcost[vehicleid] = 4000000;
   	        	}
			}
			for(new j=0; j<4; j++) {
     			if(VehicleInfo[vehicleid][model] == sheli[j][0]) {
       				carcost[vehicleid] = 750000;
   	        	}
			}
			for(new k=0; k<3; k++) {
     			if(VehicleInfo[vehicleid][model] == lheli[k][0]) {
       				carcost[vehicleid] = 1250000;
   	        	}
			}
			VehicleInfo[vehicleid][vehiclecost] = carcost[vehicleid];
			VehicleInfo[vehicleid][vused] = 0;
			VehicleInfo[vehicleid][bought] = 0;
			VehicleInfo[vehicleid][secure] = 0;
			VehicleInfo[vehicleid][asecure] = 0;
			VehicleInfo[vehicleid][buybar] = 0;
			VehicleInfo[vehicleid][mod1] = 0;
			VehicleInfo[vehicleid][mod2] = 0;
			VehicleInfo[vehicleid][mod3] = 0;
			VehicleInfo[vehicleid][mod4] = 0;
			VehicleInfo[vehicleid][mod5] = 0;
			VehicleInfo[vehicleid][mod6] = 0;
			VehicleInfo[vehicleid][mod7] = 0;
			VehicleInfo[vehicleid][mod8] = 0;
			VehicleInfo[vehicleid][mod9] = 0;
			VehicleInfo[vehicleid][mod10] = 0;
			VehicleInfo[vehicleid][mod11] = 0;
			VehicleInfo[vehicleid][mod12] = 0;
			VehicleInfo[vehicleid][mod13] = 0;
			VehicleInfo[vehicleid][mod14] = 0;
			VehicleInfo[vehicleid][mod15] = 0;
			VehicleInfo[vehicleid][mod16] = 0;
			VehicleInfo[vehicleid][mod17] = 0;
			VehicleInfo[vehicleid][paintjob] = -1;
			strmid(VehicleInfo[vehicleid][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
            strmid(VehicleInfo[vehicleid][name], VehicleName[GetVehicleModel(vehicleid)-400][0], 0, strlen(VehicleName[GetVehicleModel(vehicleid)-400][0]), 255);
			new addmess[256];
			format(addmess,sizeof(addmess),"--:: Vehicle %d (%s) successfully spawned ::--",vehicleid,VehicleInfo[vehicleid][name]);
			print(addmess);
		}
	}
	fclose(file);
	print(">------------------------------------------------");
	print(" ");
	print(">------------------------------------------------");
	print("Initialising Vehicle File System - Please Wait For Confirmation...");
	print(" ");
	SaveVehicles();
	print(" ");
	print("Vehicle File System 100% Initialised...");
	print(">------------------------------------------------");
	printf(" ");
}

public Fill()
 {
  for(new i=0;i<MAX_PLAYERS;i++)
   {
	if(Filling[i] == 1)
	  {
        VehicleInfo[GetPlayerVehicleID(i)][gas]++;
        GivePlayerMoney(i,-2);
      }
   }
  return 1;
 }

stock LoadVehicles()
{
	if(fexist(V_FILE_SAVE)) {
        new SplitDiv[99][V_LIMIT];
		new filestring[256];
		new File: file = fopen(V_FILE_SAVE, io_read);
		if (file) {
	    	for(new vehicleid = 1;vehicleid<=vehcount;vehicleid++)
			{
		    	fread(file, filestring);
				split(filestring, SplitDiv, ',');
				VehicleInfo[vehicleid][model] = strval(SplitDiv[0]);
				VehicleInfo[vehicleid][x_spawn] = floatstr(SplitDiv[1]);
				VehicleInfo[vehicleid][y_spawn] = floatstr(SplitDiv[2]);
				VehicleInfo[vehicleid][z_spawn] = floatstr(SplitDiv[3]);
				VehicleInfo[vehicleid][za_spawn] = floatstr(SplitDiv[4]);
				VehicleInfo[vehicleid][color_1] = strval(SplitDiv[5]);
				VehicleInfo[vehicleid][color_2] = strval(SplitDiv[6]);
				VehicleInfo[vehicleid][vehiclecost] = strval(SplitDiv[7]);
				VehicleInfo[vehicleid][bought] = strval(SplitDiv[8]);
				VehicleInfo[vehicleid][secure] = strval(SplitDiv[9]);
				VehicleInfo[vehicleid][asecure] = strval(SplitDiv[10]);
				VehicleInfo[vehicleid][vused] = 0;
				VehicleInfo[vehicleid][buybar] = strval(SplitDiv[12]);
				VehicleInfo[vehicleid][mod1] = strval(SplitDiv[13]);
				VehicleInfo[vehicleid][mod2] = strval(SplitDiv[14]);
				VehicleInfo[vehicleid][mod3] = strval(SplitDiv[15]);
				VehicleInfo[vehicleid][mod4] = strval(SplitDiv[16]);
				VehicleInfo[vehicleid][mod5] = strval(SplitDiv[17]);
				VehicleInfo[vehicleid][mod6] = strval(SplitDiv[18]);
				VehicleInfo[vehicleid][mod7] = strval(SplitDiv[19]);
				VehicleInfo[vehicleid][mod8] = strval(SplitDiv[20]);
				VehicleInfo[vehicleid][mod9] = strval(SplitDiv[21]);
				VehicleInfo[vehicleid][mod10] = strval(SplitDiv[22]);
				VehicleInfo[vehicleid][mod11] = strval(SplitDiv[23]);
				VehicleInfo[vehicleid][mod12] = strval(SplitDiv[24]);
				VehicleInfo[vehicleid][mod13] = strval(SplitDiv[25]);
				VehicleInfo[vehicleid][mod14] = strval(SplitDiv[26]);
				VehicleInfo[vehicleid][mod15] = strval(SplitDiv[27]);
				VehicleInfo[vehicleid][mod16] = strval(SplitDiv[28]);
				VehicleInfo[vehicleid][mod17] = strval(SplitDiv[29]);
				VehicleInfo[vehicleid][paintjob] = strval(SplitDiv[32]);
				strmid(VehicleInfo[vehicleid][owner], SplitDiv[30], 0, strlen(SplitDiv[30]), 255);
				strmid(VehicleInfo[vehicleid][name], SplitDiv[31], 0, strlen(SplitDiv[31]), 255);
			 	CreateVehicle(VehicleInfo[vehicleid][model], VehicleInfo[vehicleid][x_spawn], VehicleInfo[vehicleid][y_spawn], VehicleInfo[vehicleid][z_spawn], VehicleInfo[vehicleid][za_spawn], VehicleInfo[vehicleid][color_1], VehicleInfo[vehicleid][color_2],20000);
				new addmess[256];
				format(addmess,sizeof(addmess),"--:: Vehicle %d (%s) successfully spawned - owner: %s ::--",vehicleid,VehicleInfo[vehicleid][name],VehicleInfo[vehicleid][owner]);
				print(addmess);
			}
		}
		fclose(file);
	}
	else {
		SetupVehiclesFile();
	}
}

stock LoadBusinesses()
{
	if(fexist(B_FILE_SAVE)) {
        new SplitDiv[99][B_LIMIT];
		new filestring[256];
		new File: file = fopen(B_FILE_SAVE, io_read);
		if (file) {
	    	for(new bizid = 0;bizid<bizcount;bizid++)
			{
		    	fread(file, filestring);
				split(filestring, SplitDiv, ',');
				BizInfo[bizid][xpos] = floatstr(SplitDiv[0]);
				BizInfo[bizid][ypos] = floatstr(SplitDiv[1]);
				BizInfo[bizid][zpos] = floatstr(SplitDiv[2]);
				strmid(BizInfo[bizid][owner], SplitDiv[3], 0, strlen(SplitDiv[3]), 255);
				strmid(BizInfo[bizid][name], SplitDiv[4], 0, strlen(SplitDiv[4]), 255);
				BizInfo[bizid][bought] = strval(SplitDiv[5]);
				BizInfo[bizid][cost] = strval(SplitDiv[6]);
				BizInfo[bizid][profit] = strval(SplitDiv[7]);
				BizInfo[bizid][cashbox] = strval(SplitDiv[8]);
			 	AddStaticPickup(B_ICON,B_ICON_TYPE, BizInfo[bizid][xpos], BizInfo[bizid][ypos], BizInfo[bizid][zpos]);
				new addmess[256];
				format(addmess,sizeof(addmess),"--:: Business %d (%s) successfully spawned - owner: %s ::--",bizid,BizInfo[bizid][name],BizInfo[bizid][owner]);
				print(addmess);
			}
		}
		fclose(file);
	}
	else {
		SetupBizFile();
	}
}

stock SaveBusinesses()
{
	new filestring[256];
	new File: bfile = fopen(B_FILE_SAVE, io_write);
	    for(new bizid = 0;bizid<bizcount;bizid++)
     	{
			format(filestring, sizeof(filestring), "%f,%f,%f,%s,%s,%d,%d,%d,%d\n",
			BizInfo[bizid][xpos],
			BizInfo[bizid][ypos],
			BizInfo[bizid][zpos],
			BizInfo[bizid][owner],
			BizInfo[bizid][name],
			BizInfo[bizid][bought],
			BizInfo[bizid][cost],
			BizInfo[bizid][profit],
			BizInfo[bizid][cashbox]
			);
			fwrite(bfile, filestring);
		}
		fclose(bfile);
}

stock SetupBizFile()
{
    new File: file;
    new SplitDiv[99][B_LIMIT];
	new filestring[256];
	file = fopen(B_FILE_LOAD, io_read);
	for(new bizid=0;bizid<bizcount;bizid++)
	{
		if (file)
		{
			fread(file, filestring);
		 	split(filestring, SplitDiv, ',');
			BizInfo[bizid][xpos] = floatstr(SplitDiv[0]);
			BizInfo[bizid][ypos] = floatstr(SplitDiv[1]);
			BizInfo[bizid][zpos] = floatstr(SplitDiv[2]);
			strmid(BizInfo[bizid][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
			strmid(BizInfo[bizid][name], SplitDiv[3], 0, strlen(SplitDiv[3]), 255);
			BizInfo[bizid][bought] = 0;
			BizInfo[bizid][cost] = strval(SplitDiv[4]);
			BizInfo[bizid][profit] = strval(SplitDiv[5]);
			BizInfo[bizid][cashbox] = 0;
            AddStaticPickup(B_ICON,B_ICON_TYPE, BizInfo[bizid][xpos], BizInfo[bizid][ypos], BizInfo[bizid][zpos]);
			new addmess[256];
			format(addmess,sizeof(addmess),"--:: Business %d (%s) successfully spawned ::--",bizid,BizInfo[bizid][name]);
			print(addmess);
		}
	}
	fclose(file);
	print(">------------------------------------------------");
	print(" ");
	print(">------------------------------------------------");
	print("Initialising Business File System - Please Wait For Confirmation...");
	print(" ");
	SaveBusinesses();
	print(" ");
	print("Business File System 100% Initialised...");
	print(">------------------------------------------------");
	printf(" ");
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
 if(pickupid < bizcount) {
		new bizowner[25];
		format(bizowner,256,"%s",BizInfo[pickupid][owner]);
		if(strcmp(BizInfo[pickupid][owner],DEFAULT_OWNER,false) == 0) {
	    	format(bizowner,256,"Not Owned");
		}
		new bizmes[256];
		format(bizmes,256,"~n~~n~~r~Business: ~g~%s~n~~r~Price: ~g~$%d ~r~~n~~r~Profit: ~g~$%d/hr ~n~~r~Owner: ~g~%s",BizInfo[pickupid][name],BizInfo[pickupid][cost],BizInfo[pickupid][profit]*2,bizowner);
    	GameTextForPlayer(playerid,bizmes,5000,3);
		bizmsg[playerid] = 1;
		SetTimerEx("ResetText",5000,0,"i",playerid);
		return 1;
	}
	new upto = bizcount+20;
 	if(pickupid < upto) {
    	GameTextForPlayer(playerid,"~g~Type ~r~/fuelhelp ~g~to see how to refill.",5000,3);
		bizmsg[playerid] = 1;
		SetTimerEx("ResetText",5000,0,"i",playerid);
		return 1;
	}
 	upto = bizcount+23;
 	if(pickupid < upto) {
    	GameTextForPlayer(playerid,"~b~Type ~y~/bankhelp ~b~to see how to use the bank.",5000,3);
		bizmsg[playerid] = 1;
		SetTimerEx("ResetText",5000,0,"i",playerid);
		return 1;
	}
	return 1;
}

public ResetText(playerid)
{
	bizmsg[playerid] = 0;
}

stock CloseToGas(playerid)
{
    new Float:maxdis = 15.0;
	new Float:ppos[3];
    GetPlayerPos(playerid, ppos[0], ppos[1], ppos[2]);
    for(new i = 0;i<16;i++) {
    	if (ppos[0] >= floatsub(Pickup[i][0], maxdis) && ppos[0] <= floatadd(Pickup[i][0], maxdis)
    	&& ppos[1] >= floatsub(Pickup[i][1], maxdis) && ppos[1] <= floatadd(Pickup[i][1], maxdis)
    	&& ppos[2] >= floatsub(Pickup[i][2], maxdis) && ppos[2] <= floatadd(Pickup[i][2], maxdis))
    	{
        	return i;
    	}
	}
	maxdis = 20.0;
	for(new i = 16;i<20;i++) {
    	if (ppos[0] >= floatsub(Pickup[i][0], maxdis) && ppos[0] <= floatadd(Pickup[i][0], maxdis)
    	&& ppos[1] >= floatsub(Pickup[i][1], maxdis) && ppos[1] <= floatadd(Pickup[i][1], maxdis)
    	&& ppos[2] >= floatsub(Pickup[i][2], maxdis) && ppos[2] <= floatadd(Pickup[i][2], maxdis))
    	{
        	return i;
    	}
	}
	return 999;
}

stock CloseToBank(playerid)
{
    new Float:maxdis = 20.0;
	new Float:ppos[3];
    GetPlayerPos(playerid, ppos[0], ppos[1], ppos[2]);
	for(new i = 20;i<23;i++) {
    	if (ppos[0] >= floatsub(Pickup[i][0], maxdis) && ppos[0] <= floatadd(Pickup[i][0], maxdis)
    	&& ppos[1] >= floatsub(Pickup[i][1], maxdis) && ppos[1] <= floatadd(Pickup[i][1], maxdis)
    	&& ppos[2] >= floatsub(Pickup[i][2], maxdis) && ppos[2] <= floatadd(Pickup[i][2], maxdis))
    	{
        	return i;
    	}
	}
	return 999;
}

stock ClosestBiz(playerid)
{
    new Float:ppos[3];
    new Float:maxdis = 7.0;
    GetPlayerPos(playerid, ppos[0], ppos[1], ppos[2]);
    for(new i = 0;i<bizcount;i++) {
    	if (ppos[0] >= floatsub(BizInfo[i][xpos], maxdis) && ppos[0] <= floatadd(BizInfo[i][xpos], maxdis)
    	&& ppos[1] >= floatsub(BizInfo[i][ypos], maxdis) && ppos[1] <= floatadd(BizInfo[i][ypos], maxdis)
    	&& ppos[2] >= floatsub(BizInfo[i][zpos], maxdis) && ppos[2] <= floatadd(BizInfo[i][zpos], maxdis))
    	{
        	return i;
    	}
	}
	return 999;
}


stock SaveVehicles()
{
	new filestring[256];
	new File: vfile = fopen(V_FILE_SAVE, io_write);
	    for(new vehicleid = 1;vehicleid<=vehcount;vehicleid++)
     	{
			format(filestring, sizeof(filestring), "%d,%f,%f,%f,%f,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,%s,%d\n",
			VehicleInfo[vehicleid][model],
			VehicleInfo[vehicleid][x_spawn],
			VehicleInfo[vehicleid][y_spawn],
			VehicleInfo[vehicleid][z_spawn],
			VehicleInfo[vehicleid][za_spawn],
			VehicleInfo[vehicleid][color_1],
			VehicleInfo[vehicleid][color_2],
			VehicleInfo[vehicleid][vehiclecost],
			VehicleInfo[vehicleid][bought],
			VehicleInfo[vehicleid][secure],
			VehicleInfo[vehicleid][asecure],
			VehicleInfo[vehicleid][vused],
			VehicleInfo[vehicleid][buybar],
			VehicleInfo[vehicleid][mod1],
			VehicleInfo[vehicleid][mod2],
			VehicleInfo[vehicleid][mod3],
			VehicleInfo[vehicleid][mod4],
			VehicleInfo[vehicleid][mod5],
			VehicleInfo[vehicleid][mod6],
			VehicleInfo[vehicleid][mod7],
			VehicleInfo[vehicleid][mod8],
			VehicleInfo[vehicleid][mod9],
			VehicleInfo[vehicleid][mod10],
			VehicleInfo[vehicleid][mod11],
			VehicleInfo[vehicleid][mod12],
			VehicleInfo[vehicleid][mod13],
			VehicleInfo[vehicleid][mod14],
			VehicleInfo[vehicleid][mod15],
			VehicleInfo[vehicleid][mod16],
			VehicleInfo[vehicleid][mod17],
			VehicleInfo[vehicleid][owner],
			VehicleInfo[vehicleid][name],
			VehicleInfo[vehicleid][paintjob]
			);
			fwrite(vfile, filestring);
		}
		fclose(vfile);
}

stock ModVehicle(vehicleid)
{
    new tuned2 = 0;
	if(VehicleInfo[vehicleid][mod1] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod1]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod2] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod2]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod3] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod3]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod4] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod4]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod5] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod5]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod6] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod6]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod7] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod7]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod8] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod8]);
		tuned2 = 1;
 	}
	if(VehicleInfo[vehicleid][mod9] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod9]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod10] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod10]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod11] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod11]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod12] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod12]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod13] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod13]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod14] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod14]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod15] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod15]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod16] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod16]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][mod17] != 0) {
		AddVehicleComponent(vehicleid,VehicleInfo[vehicleid][mod17]);
		tuned2 = 1;
	}
	if(VehicleInfo[vehicleid][color_1] > -1 || VehicleInfo[vehicleid][color_2] > -1) {
		ChangeVehicleColor(vehicleid,VehicleInfo[vehicleid][color_1],VehicleInfo[vehicleid][color_2]);
		tuned2 = 1;
 	}
	if(VehicleInfo[vehicleid][paintjob] > -1) {
		ChangeVehiclePaintjob(vehicleid,VehicleInfo[vehicleid][paintjob]);
		tuned2 = 1;
 	}
	if(tuned2 == 1) {
	    tuned++;
	}
}

stock IsPlayerNameOnline(compname[])
{
	new playername[MAX_PLAYER_NAME];
    for(new i=0;i<=MAX_PLAYERS;i++) {
        if(IsPlayerConnected(i)) {
            GetPlayerName(i, playername, sizeof(playername));
            if(strcmp(playername,compname,false) == 0) {
                return i;
			}
		}
	}
	return 1000;
}

public OnPlayerConnect(playerid)
{
	new fname[256],playername[256],string[256];
	GetPlayerName(playerid, playername, sizeof(playername));
	format(string, sizeof(string), "^^^ %s has joined the server.(Connect) ^^^", playername);
	SendClientMessageToAll(COLOR_GREY, string);
 	format(fname,sizeof(fname),P_FILE,udb_encode(playername));
		if(!fexist(fname)) {
	    	SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
			format(string, sizeof(string), "Welcome %s, to the new tAxi's RPG/Freeroam World!", playername);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
			SendClientMessage(playerid,COLOR_YELLOW, "You have been given $25000 starting money since you have no saved money as of yet!");
        	SendClientMessage(playerid,COLOR_YELLOW, "You can register your current player name with '/register [password]'");
        	SendClientMessage(playerid,COLOR_ORANGE, "You must register and login to gain access to money, bank and vehicle saving options!");
        	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Type /help to get started and type /credits for a list of ppl who contributed.");
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
			GivePlayerMoney(playerid,25000);
	}
    if(fexist(fname)) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
			format(string, sizeof(string), "Welcome %s, to the new tAxi's RPG/Freeroam World!", playername);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
			format(string,sizeof(string),"The name %s, is already registered on this server. Please login or you will be disconnected in 30 seconds!",playername);
        	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "-----------------------------------------------------------------------------------------------------------------------");
			SetTimerEx("KickTimer",30000,0,"i",playerid);
		}
    speedo[playerid] = 1;
	Filling[playerid] = 0;
	PlayerInfo[playerid][logged] = 0;
	PlayerInfo[playerid][vhpb] = 1;
	Calling[playerid] = -1;
	Answered[playerid] = 0;
	Callerid[playerid] = 0;
}

stock ChangeMapIconModel(streamid,newmodel)
{
	for(new i = 0;i<MAX_PLAYERS;i++) {
	    if(IsPlayerConnected(i)) {
			new iconid = MIidnum[i][streamid];
    		MapIconInfo[streamid][mmodel] = newmodel;
    		if(MIactive[i][streamid] == 1) {
        		RemovePlayerMapIcon(i,iconid);
				SetPlayerMapIcon(i,iconid,MapIconInfo[streamid][mx_spawn],MapIconInfo[streamid][my_spawn],MapIconInfo[streamid][mz_spawn],MapIconInfo[streamid][mmodel],1);
			}
		}
	}
}



stock LoadPlayer(playerid)
{
    new fname[256],playername[256],filestring[256];
 	new SplitDiv[99][V_LIMIT];
	new File: file;
	GetPlayerName(playerid, playername, sizeof(playername));
 	format(fname,sizeof(fname),P_FILE,udb_encode(playername));
 	if(fexist(fname)) {
 	    file = fopen(fname, io_read);
		if (file) {
 			fread(file, filestring);
			split(filestring, SplitDiv, ',');
			strmid(PlayerInfo[playerid][name], SplitDiv[0], 0, strlen(SplitDiv[0]), 255);
			PlayerInfo[playerid][vowned] = strval(SplitDiv[1]);
			PlayerInfo[playerid][vowner] = strval(SplitDiv[2]);
			PlayerInfo[playerid][pass] = strval(SplitDiv[3]);
			PlayerInfo[playerid][pcash] = strval(SplitDiv[4]);
			PlayerInfo[playerid][bank] = strval(SplitDiv[5]);
			PlayerInfo[playerid][admin] = strval(SplitDiv[6]);
			PlayerInfo[playerid][bowner] = strval(SplitDiv[7]);
			PlayerInfo[playerid][bowned] = strval(SplitDiv[8]);
			fclose(file);
		}
 	}
}

stock SavePlayer(playerid)
{
    new fname[256],playername[256],filestring[256];
	new File: file;
	GetPlayerName(playerid, playername, sizeof(playername));
 	format(fname,sizeof(fname),P_FILE,udb_encode(playername));
 	if(!fexist(fname)) {}
 	else {
	    file = fopen(fname, io_write);
	    if(file) {
	        PlayerInfo[playerid][pcash] = GetPlayerMoney(playerid);
  			format(filestring,sizeof(filestring),"%s,%d,%d,%d,%d,%d,%d,%d,%d",playername,PlayerInfo[playerid][vowned],PlayerInfo[playerid][vowner],PlayerInfo[playerid][pass],PlayerInfo[playerid][pcash],PlayerInfo[playerid][bank],PlayerInfo[playerid][admin],PlayerInfo[playerid][bowner],PlayerInfo[playerid][bowned]);
   			fwrite(file,filestring);
	   		fclose(file);
		}
	}
}

stock CreatePlayer(playerid)
{
	new fname[256],playername[256],filestring[256];
 	new SplitDiv[99][V_LIMIT];
	new File: file;
	GetPlayerName(playerid, playername, sizeof(playername));
 	format(fname,sizeof(fname),P_FILE,udb_encode(playername));
	    file = fopen(fname, io_write);
	    if(file) {
  			format(filestring,sizeof(filestring),"%s,0,0,%d,%d,0,0,0,0",playername,PlayerInfo[playerid][pass],PlayerInfo[playerid][pcash]);
   			fwrite(file,filestring);
	   		fclose(file);
		}
   		file = fopen(fname, io_read);
		if (file) {
			fread(file, filestring);
			split(filestring, SplitDiv, ',');
			strmid(PlayerInfo[playerid][name], SplitDiv[0], 0, strlen(SplitDiv[0]), 255);
			PlayerInfo[playerid][vowned] = strval(SplitDiv[1]);
			PlayerInfo[playerid][vowner] = strval(SplitDiv[2]);
			PlayerInfo[playerid][pass] = strval(SplitDiv[3]);
			PlayerInfo[playerid][pcash] = strval(SplitDiv[4]);
			PlayerInfo[playerid][bank] = strval(SplitDiv[5]);
			PlayerInfo[playerid][admin] = strval(SplitDiv[6]);
			PlayerInfo[playerid][bowner] = strval(SplitDiv[7]);
			PlayerInfo[playerid][bowned] = strval(SplitDiv[8]);
			fclose(file);
		}
}

stock ResetOfflinePlayerFileV(pname[])
{
    new fname[256],intname[256];
    format(intname,sizeof(intname),"%s",pname);
    format(fname,sizeof(fname),P_FILE,udb_encode(intname));
    new SplitDiv[99][V_LIMIT];
	new filestring[256];
	new tmp1,tmp2,tmp3;
	new tmp5,tmp6;
	new tmp4[256];
	new File: file = fopen(fname, io_read);
		if (file) {
			fread(file, filestring);
			split(filestring, SplitDiv, ',');
			strmid(tmp4, SplitDiv[3], 0, strlen(SplitDiv[3]), 255);
			tmp1 = strval(SplitDiv[4]);
			tmp2 = strval(SplitDiv[5]);
			tmp3 = strval(SplitDiv[6]);
			tmp5 = strval(SplitDiv[7]);
			tmp6 = strval(SplitDiv[8]);
			fclose(file);
	}
	file = fopen(fname, io_write);
  	if(file) {
  		format(filestring,sizeof(filestring),"%s,0,0,%s,%d,%d,%d,%d,%d",pname,tmp4,tmp1,tmp2,tmp3,tmp5,tmp6);
   		fwrite(file,filestring);
	   	fclose(file);
	}
}

stock ResetOfflinePlayerFileB(pname[])
{
    new fname[256],intname[256];
    format(intname,sizeof(intname),"%s",pname);
    format(fname,sizeof(fname),P_FILE,udb_encode(intname));
    new SplitDiv[99][V_LIMIT];
	new filestring[256];
	new tmp1,tmp2,tmp3;
	new tmp5,tmp6;
	new tmp4[256];
	new File: file = fopen(fname, io_read);
		if (file) {
			fread(file, filestring);
			split(filestring, SplitDiv, ',');
			tmp5 = strval(SplitDiv[1]);
			tmp6 = strval(SplitDiv[2]);
			strmid(tmp4, SplitDiv[3], 0, strlen(SplitDiv[3]), 255);
			tmp1 = strval(SplitDiv[4]);
			tmp2 = strval(SplitDiv[5]);
			tmp3 = strval(SplitDiv[6]);
			fclose(file);
	}
	file = fopen(fname, io_write);
  	if(file) {
  		format(filestring,sizeof(filestring),"%s,%d,%d,%s,%d,%d,%d,0,0",pname,tmp5,tmp6,tmp4,tmp1,tmp2,tmp3);
   		fwrite(file,filestring);
	   	fclose(file);
	}
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    for(new d=0; d<3; d++) {
  		if(GetVehicleModel(vehicleid) == pbike[d][0]) {
 			speedo[playerid] = 2;
       }
	}
	passenger[playerid] = ispassenger;
	if(passenger[playerid] == 0) {
	        if(PlayerInfo[playerid][logged] == 1) {
    	   		 if (strcmp(VehicleInfo[vehicleid][owner],PlayerInfo[playerid][name],false) == 0) {
					new string[256];
					format(string, sizeof(string), "Welcome to your %s %s, please drive carefully!", VehicleInfo[vehicleid][name], PlayerInfo[playerid][name]);
					SendClientMessage(playerid, COLOR_GREEN, string);
					return 1;
				}
    	    	if (strcmp(VehicleInfo[vehicleid][owner],DEFAULT_OWNER,false) == 0) {
               		 if(VehicleInfo[vehicleid][buybar] == 1) {
                		new string[256];
			        	format(string,sizeof(string),"This %s has been set as non-buyable by server administration!", VehicleInfo[vehicleid][name]);
			        	SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			        	return 1;
			    	}
			    	new string[256];
    	        	format(string, sizeof(string), "This %s is for sale and costs $%d, type /vmenu to see vehicle options.",VehicleInfo[vehicleid][name], VehicleInfo[vehicleid][vehiclecost]);
    	        	SendClientMessage(playerid, COLOR_YELLOW, string);
    	        	return 1;
				}
   				else {
    	        	new string[256];
    	        	format(string, sizeof(string), "This %s belongs to %s, and cannot be purchased.", VehicleInfo[vehicleid][name], VehicleInfo[vehicleid][owner]);
    	        	SendClientMessage(playerid, COLOR_BRIGHTRED, string);
    	        	return 1;
				}
			}
			else {
			    new playername[256];
			    GetPlayerName(playerid,playername,sizeof(playername));
			    if (strcmp(VehicleInfo[vehicleid][owner],playername,false) == 0) {
					new string[256];
					format(string, sizeof(string), "Welcome to your %s %s, please drive carefully! Remember, you must be logged in to acces vehicle controls.", VehicleInfo[vehicleid][name], playername);
					SendClientMessage(playerid, COLOR_GREEN, string);
					return 1;
				}
    	    	if (strcmp(VehicleInfo[vehicleid][owner],DEFAULT_OWNER,false) == 0) {
               		 if(VehicleInfo[vehicleid][buybar] == 1) {
                		new string[256];
			        	format(string,sizeof(string),"This %s has been set as non-buyable by server administration!", VehicleInfo[vehicleid][name]);
			        	SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			        	return 1;
			    	}
			    	new string[256];
    	        	format(string, sizeof(string), "This %s is for sale and costs $%d, You must be logged in to purchase a vehicle.",VehicleInfo[vehicleid][name], VehicleInfo[vehicleid][vehiclecost]);
    	        	SendClientMessage(playerid, COLOR_YELLOW, string);
    	        	return 1;
				}
   				else {
    	        	new string[256];
    	        	format(string, sizeof(string), "This %s belongs to %s, and cannot be purchased.", VehicleInfo[vehicleid][name], VehicleInfo[vehicleid][owner]);
    	        	SendClientMessage(playerid, COLOR_BRIGHTRED, string);
    	        	return 1;
				}
			}
    }
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER) {
	    new string[256];
        if(VehicleInfo[GetPlayerVehicleID(playerid)][asecure] == 1) {
            if(PlayerInfo[playerid][admin] > 0) {
				format(carmess,sizeof(carmess),"This %s is currently set for admin use only. It will eject anyone who is not an admin.",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
                SendClientMessage(playerid,COLOR_ORANGE,carmess);
 		    	return 1;
			}
     		GetPlayerPos(playerid,ta,tb,tc);
     		SetPlayerPos(playerid,ta,tb,tc+5);
 			format(string, sizeof(string), "This %s has been set to allow admin/moderator control only and you are prohibited from using it.",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			return 1;
		}
		if(VehicleInfo[GetPlayerVehicleID(playerid)][asecure] == 2) {
		    if(PlayerInfo[playerid][admin] > 0) {
		        format(carmess,sizeof(carmess),"This %s is currently set for admin use only. It will kill anyone who is not an admin.",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
                SendClientMessage(playerid,COLOR_ORANGE,carmess);
 		    	return 1;
			}
			new Float:pos[3];
			GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
			CreateExplosion(pos[0],pos[1],pos[2],4,6);
 			format(string, sizeof(string), "Server administration has set this %s to kill anyone who try's to drive it...R.I.P loser!",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "%s just tried to steal an admin only %s and was Blown up by the Car Bomb...R.I.P loser!",PlayerInfo[playerid][name],VehicleInfo[GetPlayerVehicleID(playerid)][name]);
			SendClientMessageToAll(COLOR_ORANGE, string);
			return 1;
		}
		if(VehicleInfo[GetPlayerVehicleID(playerid)][secure] == 0) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
			SendClientMessage(playerid, COLOR_GREEN, "Your vehicle security system is currently deactivated.");
		    	return 1;
			}
		}
	 	if(VehicleInfo[GetPlayerVehicleID(playerid)][secure] == 1) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
			SendClientMessage(playerid, COLOR_GREEN, "Your vehicle security system is currently set to eject intruders.");
		    	return 1;
			}
			if(PlayerInfo[playerid][admin] > 0) {
			    format(string, sizeof(string), "The owner of this %s (%s), has secured this vehicle but as ADMIN you can still use it.",VehicleInfo[GetPlayerVehicleID(playerid)][name],VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
				SendClientMessage(playerid, COLOR_ORANGE, string);
				return 1;
			}
     		GetPlayerPos(playerid,ta,tb,tc);
     		SetPlayerPos(playerid,ta,tb,tc+5);
 			format(string, sizeof(string), "The owner of this %s (%s), has secured this vehicle and you are prohibited from using it.", VehicleInfo[GetPlayerVehicleID(playerid)][name],VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			return 1;
		}
 		if(VehicleInfo[GetPlayerVehicleID(playerid)][secure] == 2) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
			SendClientMessage(playerid, COLOR_GREEN, "Your vehicle security system is currently set to kill intruders.");
		    	return 1;
			}
			if(PlayerInfo[playerid][admin] > 0) {
			    format(string, sizeof(string), "The owner of this %s (%s), has set the vehicle to kill intruders but as ADMIN you can still use it.", VehicleInfo[GetPlayerVehicleID(playerid)][name],VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
				SendClientMessage(playerid, COLOR_ORANGE, string);
				return 1;
			}
			new Float:pos[3];
			GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
			CreateExplosion(pos[0],pos[1],pos[2],4,6);
 			format(string, sizeof(string), "The owner of this %s (%s), has set this vehicle to kill anyone who try's to drive it...R.I.P loser!",VehicleInfo[GetPlayerVehicleID(playerid)][name],VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			format(string, sizeof(string), "%s just tried to steal %s's %s and was blown up by the Car Bomb...R.I.P loser!",PlayerInfo[playerid][name],VehicleInfo[GetPlayerVehicleID(playerid)][owner],VehicleInfo[GetPlayerVehicleID(playerid)][name]);
			SendClientMessageToAll(COLOR_LIGHTBLUE, string);
			return 1;
		}
	}
	return 1;
}

public ScoreUpdate()
{
	new playername[MAX_PLAYER_NAME];
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			GetPlayerName(i, playername, sizeof(playername));
			PlayerInfo[i][pcash] = GetPlayerMoney(i);
			SetPlayerScore(i, PlayerInfo[i][pcash]);
		}
	}
}

public OnVehicleDeath(vehicleid)
{
	SetTimerEx("RestartVehicle",11000,0,"i",vehicleid);
}

public OnVehicleMod(vehicleid,componentid)
{
	SaveComponent(vehicleid,componentid);
	return 1;
}

public OnVehiclePaintjob(vehicleid,paintjobid)
{
    SavePaintjob(vehicleid,paintjobid);
    return 1;
}

public OnVehicleRespray(vehicleid,color1,color2)
{
   SaveColors(vehicleid,color1,color2);
    return 1;
}

public CallVehicleToPlayer(playerid)
{
	new vehicleid = PlayerInfo[playerid][vowned];
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid,x,y,z);
	GetPlayerFacingAngle(playerid, a);
	x += (3 * floatsin(-a, degrees));
	y += (3 * floatcos(-a, degrees));
    DestroyVehicle(vehicleid);
	CreateVehicle(VehicleInfo[vehicleid][model],x,y,z-0.35,a+90,VehicleInfo[vehicleid][color_1],VehicleInfo[vehicleid][color_2],1000);
	format(carmess,sizeof(carmess),"Your %s has been successfully transported to your location!",VehicleInfo[vehicleid][name]);
	SendClientMessage(playerid, COLOR_GREEN, carmess);
	ModVehicle(vehicleid);
}

public RestartVehicle(vehicleid)
{
    DestroyVehicle(vehicleid);
	CreateVehicle(VehicleInfo[vehicleid][model],VehicleInfo[vehicleid][x_spawn],VehicleInfo[vehicleid][y_spawn],VehicleInfo[vehicleid][z_spawn],VehicleInfo[vehicleid][za_spawn],VehicleInfo[vehicleid][color_1],VehicleInfo[vehicleid][color_2],1000);
	VehicleInfo[vehicleid][gas] = 100;
	ModVehicle(vehicleid);
}

public FuelDown()
 {
  for(new i=0;i<MAX_PLAYERS;i++)
   {
    for(new d=0; d<3; d++) {
  		if(GetVehicleModel(GetPlayerVehicleID(i)) == pbike[d][0]) {
 			return 1;
       }
	}
	if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
    	VehicleInfo[GetPlayerVehicleID(i)][gas]--;
	}
   }
  return 1;
}

public resetcount()
{
	for (new i = 0; i < MAX_PLAYERS; i ++)
	{
		if (IsPlayerConnected(i)) Count[i] = 0;
	}
}

public announcer()
{
	for(new i=0;i<MAX_PLAYERS;i++) {
		if(IsPlayerConnected(i) && aMessage[i] == 1) {
		    aMessage[i] = 0;
		    return 1;
		}
	}
	return 1;
}

public CheckGas()
 {
  new string[256];
  for(new i=0;i<MAX_PLAYERS;i++)
   {
      if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i))
       {
          if(speedo[i] == 1 && aMessage[i] == 0 && Count[i] == 0 && bizmsg[i] == 0)
	        {
	        new Float:x,Float:y,Float:z;
            new Float:distance,value;
            new filename[256];
            format(filename, sizeof(filename), "%d", GetPlayerVehicleID(i));
            GetPlayerPos(i, x, y, z);
            distance = floatsqroot(floatpower(floatabs(floatsub(x,SavePlayerPos[i][LastX])),2)+floatpower(floatabs(floatsub(y,SavePlayerPos[i][LastY])),2)+floatpower(floatabs(floatsub(z,SavePlayerPos[i][LastZ])),2));
            value = floatround(distance * 11000);
            format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Vehicle: ~g~%s~n~~b~MpH: ~g~%d ~r~/ ~b~KpH: ~g~%d ~n~~r~Fuel: ~g~%d/100",VehicleInfo[GetPlayerVehicleID(i)][name],floatround(value/2200),floatround(value/1400),VehicleInfo[GetPlayerVehicleID(i)][gas]);
	        GameTextForPlayer(i,string,850,3);
            SavePlayerPos[i][LastX] = x;
            SavePlayerPos[i][LastY] = y;
            SavePlayerPos[i][LastZ] = z;
			}
			if(speedo[i] == 2 && aMessage[i] == 0 && Count[i] == 0)
	        {
	        new Float:x,Float:y,Float:z;
            new Float:distance,value;
            new filename[256];
            format(filename, sizeof(filename), "%d", GetPlayerVehicleID(i));
            GetPlayerPos(i, x, y, z);
            distance = floatsqroot(floatpower(floatabs(floatsub(x,SavePlayerPos[i][LastX])),2)+floatpower(floatabs(floatsub(y,SavePlayerPos[i][LastY])),2)+floatpower(floatabs(floatsub(z,SavePlayerPos[i][LastZ])),2));
            value = floatround(distance * 11000);
            format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~Vehicle: ~g~%s~n~MpH: ~g~%d ~r~/ ~b~KpH: ~g~%d ~n~~g~Fuel: ~r~N/A",VehicleInfo[GetPlayerVehicleID(i)][name],floatround(value/2200),floatround(value/1400));
	        GameTextForPlayer(i,string,850,3);
            SavePlayerPos[i][LastX] = x;
            SavePlayerPos[i][LastY] = y;
            SavePlayerPos[i][LastZ] = z;
			}
		   if(VehicleInfo[GetPlayerVehicleID(i)][gas] == 0 && messaged[i] == 0 && Filling[i] == 0)
		   {
			 format(carmess, sizeof(carmess), "Your %s's fuel has dropped to 0% and it was towed away. Enjoy the walk!",VehicleInfo[GetPlayerVehicleID(i)][name]);
			 SendClientMessage(i,COLOR_BRIGHTRED,carmess);
			 messaged[i] = 1;
			 VehicleInfo[GetPlayerVehicleID(i)][gas] = 100;
			 SetVehicleToRespawn(GetPlayerVehicleID(i));
			 SetTimer("resetmessage",7000,0);
			 return 1;
		   }
		   if(GetPlayerMoney(i) <= 2 && Filling[i] == 1) {
		    Filling[i] = 0;
			 SendClientMessage(i,COLOR_BRIGHTRED, "You do not have sufficient money to continue filling your vehicle!");
			 return 1;
		   }
	   }
   }
  return 1;
 }

public fillcheck()
{
	for(new i=0;i<MAX_PLAYERS;i++) {
		if(VehicleInfo[GetPlayerVehicleID(i)][gas] > 99 && Filling[i] == 1)
		   {
			 Filling[i] = 0;
			 format(carmess, sizeof(carmess), "Your %s's tank is now full. Have a nice day!",VehicleInfo[GetPlayerVehicleID(i)][name]);
             SendClientMessage(i,COLOR_GREEN,carmess);
		   }
		   if(CloseToGas(i) == 999 && Filling[i] == 1) {
		    Filling[i] = 0;
		    SendClientMessage(i,COLOR_BRIGHTRED,"You left the refuelling area and the tank is not yet full!");
		}
	}
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	passenger[playerid] = 0;
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
   new cmd[256];
   new idx;
   new string[256];
   cmd = strtok(cmdtext, idx);
   new tmp[256];
   new playername[256];
   new moneys[MAX_PLAYERS];
   new giveplayer[256];
   new giveplayerid;
   new sendername[256];
   new playermoney[MAX_PLAYERS];
   
   if(strcmp(cmd, "/vmenu", true) == 0)
	{
	    TogglePlayerControllable(playerid, false);
		ShowMenuForPlayer(vehiclemain, playerid);
		return 1;
	}
   if(strcmp(cmd, "/login", true) == 0) {
		if(PlayerInfo[playerid][logged] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are already Logged On");
		    return 1;
		}
	    tmp = strtok(cmdtext, idx);
 		GetPlayerName(playerid, playername, sizeof(playername));
	    if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /login [password]");
		}
		else {
			new fname[256];
		    format(fname,sizeof(fname),P_FILE,udb_encode(playername));
			if (fexist(fname)) {
			    LoadPlayer(playerid);
			    if(PlayerInfo[playerid][pass] == udb_hash(tmp)) {
			        ResetPlayerMoney(playerid);
			        GivePlayerMoney(playerid,PlayerInfo[playerid][pcash]);
			        PlayerInfo[playerid][logged] = 1;
					format(string, sizeof(string), "You are now logged in as %s", playername);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				}
				else {
				    SendClientMessage(playerid, COLOR_BRIGHTRED, "Incorrect password!");
				}
			}
			else {
			    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not yet registered...Please /register [password] to register your username.");
			}
			
		}

		return 1;
	}

	if(strcmp(cmd, "/register", true) == 0) {
	    tmp = strtok(cmdtext, idx);
 		GetPlayerName(playerid, playername, sizeof(playername));
        if(20 < strlen(tmp) || strlen(tmp) < 5) {
			SendClientMessage(playerid, COLOR_YELLOW, "Password length must be 5-20 characters long.");
			return 1;
		}
	    if(!strlen(tmp))
			SendClientMessage(playerid, COLOR_YELLOW, "USAGE: /register [password]");

		else {
		    new fname[256];
		    format(fname,sizeof(fname),P_FILE,udb_encode(playername));
			if (!fexist(fname)) {
			    PlayerInfo[playerid][pcash] = GetPlayerMoney(playerid);
			    PlayerInfo[playerid][pass] = udb_hash(tmp);
			    CreatePlayer(playerid);
				format(string, sizeof(string), "--- %s (id: %d) created account. Password: %s.", playername, playerid, tmp);
				printf(string);
				format(string, sizeof(string), "Account %s created! You can now login with the password: %s.", playername, tmp);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
			else {
				format(string, sizeof(string), "%s is already registered on this server, you can login with /login [password].", playername);
				SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
		}

		return 1;
	}
	
	if(strcmp(cmd, "/setpass", true) == 0) {
	    tmp = strtok(cmdtext, idx);
 		GetPlayerName(playerid, playername, sizeof(playername));
 		if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(20 < strlen(tmp) || strlen(tmp) < 5) {
			SendClientMessage(playerid, COLOR_YELLOW, "Password length must be 5-20 symbols.");
			return 1;
		}
		if(!strlen(tmp))
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /setpass [password]");
		else {
		    new fname[256];
		    format(fname,sizeof(fname),P_FILE,udb_encode(playername));
			if (fexist(fname)) {
			    if (PlayerInfo[playerid][logged] == 1) {
			        PlayerInfo[playerid][pass] = udb_hash(tmp);
					SavePlayer(playerid);
			        SendClientMessage(playerid, COLOR_BRIGHTRED, "You have successfully changed your password!");
				}
				else {
					SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to change your password.");
				}
			}
			else {
			    format(string, sizeof(string), "%s - Ther is no such account.", playername);
				SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
		}

		return 1;
	}

	if(strcmp(cmd, "/deposit", true) == 0) {
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
	    if(CloseToBank(playerid) == 999) {
	        SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a 24/7 in order to use banking!");
			return 1;
	    }
		new tmp8[256];
	    tmp8 = strtok(cmdtext, idx);

	    if(!strlen(tmp8)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /deposit [amount]");
			return 1;
	    }
	    moneys[playerid] = strval(tmp8);
	    if(moneys[playerid] < 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must enter an amount greater than 0!");
			return 1;
		}

		if(GetPlayerMoney(playerid) < moneys[playerid]) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You don't have the money for that!");
			return 1;
		}
		GivePlayerMoney(playerid, 0-moneys[playerid]);
		PlayerInfo[playerid][bank] = PlayerInfo[playerid][bank]+moneys[playerid];
		format(string, sizeof(string), "You have deposited $%d, your current balance is $%d.", moneys[playerid], PlayerInfo[playerid][bank]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		SavePlayer(playerid);
		return 1;
	}
	if(strcmp(cmd, "/withdraw", true) == 0) {
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
	    if(CloseToBank(playerid) == 999) {
	        SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a 24/7 in order to use banking!");
			return 1;
	    }
	    new tmp9[256];
	    tmp9 = strtok(cmdtext, idx);
	    if(!strlen(tmp9)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /withdraw [amount]");
			return 1;
	    }
	    moneys[playerid] = strval(tmp9);
	    if(moneys[playerid] < 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must enter an amount greater than 0!");
			return 1;
		}
  		if(moneys[playerid] > PlayerInfo[playerid][bank]) {
    		SendClientMessage(playerid, COLOR_BRIGHTRED, "You don't have the money for that!");
			return 1;
     	}
		GivePlayerMoney(playerid, moneys[playerid]);
		PlayerInfo[playerid][bank] = PlayerInfo[playerid][bank]-moneys[playerid];
		format(string, sizeof(string), "You have withdrawn $%d, your current balance is $%d.", moneys[playerid], PlayerInfo[playerid][bank]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		SavePlayer(playerid);
		return 1;
   	}
	if(strcmp(cmd, "/balance", true) == 0) {
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
		if(CloseToBank(playerid) == 999) {
	        SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a 24/7 in order to use banking!");
			return 1;
	    }
		format(string, sizeof(string), "You have $%d in the bank.", PlayerInfo[playerid][bank]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}
 	if(strcmp(cmd, "/givecash", true) == 0) {
      tmp = strtok(cmdtext, idx);
      if(!strlen(tmp)) {
         SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /givecash [playerid] [amount]");
         return 1;
      }
      giveplayerid = strval(tmp);
      tmp = strtok(cmdtext, idx);
      if(!strlen(tmp)) {
         SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /givecash [playerid] [amount]");
         return 1;
      }
       moneys[playerid] = strval(tmp);
      if (IsPlayerConnected(giveplayerid)) {
         GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
         GetPlayerName(playerid, sendername, sizeof(sendername));
         playermoney[playerid] = GetPlayerMoney(playerid);
         if (moneys[playerid] > 0 && playermoney[playerid] >= moneys[playerid]) {
            GivePlayerMoney(playerid, (0 - moneys[playerid]));
            GivePlayerMoney(giveplayerid, moneys[playerid]);
            format(string, sizeof(string), "You have sent %s (id: %d), $%d.", giveplayer,giveplayerid, moneys[playerid]);
            SendClientMessage(playerid, COLOR_GREEN, string);
            format(string, sizeof(string), "You have recieved $%d from %s (id: %d).", moneys[playerid], sendername, playerid);
            SendClientMessage(giveplayerid, COLOR_GREEN, string);
            printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys[playerid], giveplayer, giveplayerid);
         }
         else {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Invalid transaction amount.");
         }
      }
      else {
            format(string, sizeof(string), "ID:%d is not an active player.", giveplayerid);
            SendClientMessage(playerid, COLOR_BRIGHTRED, string);
         }
      return 1;
   }
	if(strcmp(cmd, "/buybiz", true) == 0) {
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be on foot in order to purchase a business!");
			return 1;
		}
		if(ClosestBiz(playerid) == 999) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not close enough to any of the current business icons to use this command");
            return 1;
		}
		if (strcmp(BizInfo[ClosestBiz(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
			format(string, sizeof(string), "You already own this Business (%s)", BizInfo[ClosestBiz(playerid)][name]);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			return 1;
		}
		if(BizInfo[ClosestBiz(playerid)][bought] == 1) {
			format(string, sizeof(string), "This Business (%s) is owned by %s, and is not for sale!", BizInfo[ClosestBiz(playerid)][name], BizInfo[ClosestBiz(playerid)][owner]);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			return 1;
		}
		if(PlayerInfo[playerid][bowner] == 1) {
  			SendClientMessage(playerid, COLOR_BRIGHTRED, "You can only own ONE Business at a time! You must sell your other Business first!");
     		return 1;
		}
			new cash[MAX_PLAYERS];
			cash[playerid] = GetPlayerMoney(playerid);
			if(cash[playerid] >= BizInfo[ClosestBiz(playerid)][cost]) {
			    new stringa[256];
	   	 		strmid(BizInfo[ClosestBiz(playerid)][owner], PlayerInfo[playerid][name], 0, strlen(PlayerInfo[playerid][name]), 255);
                BizInfo[ClosestBiz(playerid)][bought] = 1;
                PlayerInfo[playerid][bowner] = 1;
                PlayerInfo[playerid][bowned] = ClosestBiz(playerid);
				GivePlayerMoney(playerid, -BizInfo[ClosestBiz(playerid)][cost]);
				format(stringa, sizeof(stringa), "You just bought this Business (%s) for $%d. Your Business will earn you $%d/hour", BizInfo[ClosestBiz(playerid)][name], BizInfo[ClosestBiz(playerid)][cost],BizInfo[ClosestBiz(playerid)][profit]*2);
				SendClientMessage(playerid, COLOR_GREEN, stringa);
				SavePlayer(playerid);
				new iconid = ClosestBiz(playerid)+1;
    			ChangeMapIconModel(iconid,32);
				return 1;
			}
			if(cash[playerid] < BizInfo[ClosestBiz(playerid)][cost]) {
			    new string6[256];
				format(string6, sizeof(string6), "You do not have $%d and cannot afford this Business (%s)!", BizInfo[ClosestBiz(playerid)][cost],BizInfo[ClosestBiz(playerid)][name]);
				SendClientMessage(playerid, COLOR_BRIGHTRED, string6);
				return 1;
			}
			return 1;
	}
	if(strcmp(cmd, "/sellbiz", true) == 0) {
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be on foot in order to sell a business!");
			return 1;
		}
		if(ClosestBiz(playerid) == 999) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not close enough to any of the current business icons to use this command");
			return 1;
		}
		if(PlayerInfo[playerid][bowner] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not currently own any business!");
			return 1;
		}
  		if (strcmp(BizInfo[ClosestBiz(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
    		PlayerInfo[playerid][bowned] = 0;
			PlayerInfo[playerid][bowner] = 0;
			strmid(BizInfo[ClosestBiz(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
			BizInfo[ClosestBiz(playerid)][bought] = 0;
			new cbmon = BizInfo[ClosestBiz(playerid)][cashbox],bmon = PlayerInfo[playerid][bank];
			BizInfo[ClosestBiz(playerid)][cashbox] = 0;
			PlayerInfo[playerid][bank] = cbmon+bmon;
			GivePlayerMoney(playerid, BizInfo[ClosestBiz(playerid)][cost]);
			format(string, sizeof(string), "You just sold your Business (%s) for $%d, the money that was in the cashbox ($%d) has been transferred to your personal bank account!!!", BizInfo[ClosestBiz(playerid)][name], BizInfo[ClosestBiz(playerid)][cost],cbmon);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SavePlayer(playerid);
			new iconid = ClosestBiz(playerid)+1;
			ChangeMapIconModel(iconid,31);
			return 1;
  		}
  		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "What are you trying to pull here, you don't own this Business!!!");
			return 1;
		}
	}
	if(strcmp(cmd, "/cashbox", true) == 0) {
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be on foot in order to collect a business' earnings!");
			return 1;
		}
		if(ClosestBiz(playerid) == 999) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not close enough to any of the current business icons to use this command");
			return 1;
		}
		if(PlayerInfo[playerid][bowner] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not currently own any business!");
			return 1;
		}
  		if (strcmp(BizInfo[ClosestBiz(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
			new cbmon = BizInfo[ClosestBiz(playerid)][cashbox],bmon = PlayerInfo[playerid][bank];
			PlayerInfo[playerid][bank] = cbmon+bmon;
			format(string, sizeof(string), "The earnings for your Business (%s - $%d), have been wired to your personal bank account!!!", BizInfo[ClosestBiz(playerid)][name], BizInfo[ClosestBiz(playerid)][cashbox]);
			SendClientMessage(playerid, COLOR_GREEN, string);
			BizInfo[ClosestBiz(playerid)][cashbox] = 0;
			SavePlayer(playerid);
			return 1;
  		}
  		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "What are you trying to pull here, you don't own this Business!!!");
			return 1;
		}
	}
	if(strcmp(cmd, "/asellbiz", true) == 0) {
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be on foot in order to sell a business!");
			return 1;
		}
		if(ClosestBiz(playerid) == 999) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not close enough to any of the current business icons to use this command");
			return 1;
		}
   	    if (PlayerInfo[playerid][admin] > 0) {
    	    if (strcmp(BizInfo[ClosestBiz(playerid)][owner],DEFAULT_OWNER,false) == 0) {
				format(string,sizeof(string),"This Business (%d) does not have an owner yet!",BizInfo[ClosestBiz(playerid)][name]);
 				SendClientMessage(playerid,COLOR_BRIGHTRED,string);
				return 1;
			}
			new file[256];
			new vehicleID = GetPlayerVehicleID(playerid);
			format(file,sizeof(file),P_FILE,udb_encode(BizInfo[ClosestBiz(playerid)][owner]));
			if(fexist(file)) {
			    tempid[playerid] = IsPlayerNameOnline(BizInfo[ClosestBiz(playerid)][owner]);
			    if(tempid[playerid] >= 0 && tempid[playerid] <= MAX_PLAYERS) {
                    BizInfo[ClosestBiz(playerid)][bought] = 0;
					strmid(BizInfo[ClosestBiz(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
                    new cbmon = BizInfo[ClosestBiz(playerid)][cashbox],bmon = PlayerInfo[playerid][bank];
					PlayerInfo[tempid[playerid]][bank] = cbmon+bmon;
					BizInfo[ClosestBiz(playerid)][cashbox] = 0;
					PlayerInfo[tempid[playerid]][bowned] = 0;
					PlayerInfo[tempid[playerid]][bowner] = 0;
					format(string, sizeof(string), "You just sold %s's Business (%s).", PlayerInfo[tempid[playerid]][name], BizInfo[ClosestBiz(playerid)][name]);
					SendClientMessage(playerid, COLOR_ORANGE, string);
					format(string, sizeof(string), "Admin (%s) has just sold your Business (%s)! Your cashbox money was sent to your personal bank account", PlayerInfo[playerid][name],BizInfo[ClosestBiz(playerid)][name]);
                    SendClientMessage(tempid[playerid], COLOR_ORANGE, string);
					new iconid = ClosestBiz(playerid)+1;
    				ChangeMapIconModel(iconid,31);
					return 1;
				}
				else {
				    ResetOfflinePlayerFileB(VehicleInfo[vehicleID][owner]);
					format(string, sizeof(string), "You just sold %s's Business (%s).", PlayerInfo[tempid[playerid]][name], BizInfo[ClosestBiz(playerid)][name]);
					SendClientMessage(playerid, COLOR_ORANGE, string);
                    BizInfo[ClosestBiz(playerid)][bought] = 0;
                    BizInfo[ClosestBiz(playerid)][cashbox] = 0;
					strmid(BizInfo[ClosestBiz(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
                    new iconid = ClosestBiz(playerid)+1;
    				ChangeMapIconModel(iconid,31);
					return 1;
				}
			}
			if(!fexist(file)) {
				format(string, sizeof(string), "You just sold %s's Business (%s). The player file was not found and cannot be altered.", PlayerInfo[tempid[playerid]][name], BizInfo[ClosestBiz(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, string);
				BizInfo[ClosestBiz(playerid)][bought] = 0;
				BizInfo[ClosestBiz(playerid)][cashbox] = 0;
				strmid(BizInfo[ClosestBiz(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
                new iconid = ClosestBiz(playerid)+1;
    			ChangeMapIconModel(iconid,31);
				return 1;
			}
		}
		SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not a server administrator and cannot use this command!");
		return 1;
	}
	if(strcmp(cmd, "/giveadmin", true) == 0) {
   	    if(PlayerInfo[playerid][logged] == 0) {
   	        SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
   	    }
   	    if(IsPlayerAdmin(playerid) == 0) {
   	        SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged on to the server RCON to use this command!");
   	        SendClientMessage(playerid, COLOR_BRIGHTRED, "Type /rcon login [rcon password] to login to the server rcon!");
   	        SendClientMessage(playerid, COLOR_BRIGHTRED, "After you have given yourself admin, this will no longer be neccessary.");
  			return 1;
   	    }
   	    if(IsPlayerAdmin(playerid) == 1 && PlayerInfo[playerid][logged] == 1) {
   	        PlayerInfo[playerid][admin] = 2;
   	        SavePlayer(playerid);
   	        SendClientMessage(playerid,COLOR_ORANGE,"You are now registered and saved as the primary Server Owner!");
   	        return 1;
   	    }
   	    return 1;
   	}
   	if(strcmp(cmd, "/setadmin", true) == 0) {
	  new level[MAX_PLAYERS];
      tmp = strtok(cmdtext, idx);
      giveplayerid = strval(tmp);
	  GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
	  GetPlayerName(playerid, sendername, sizeof(sendername));
      if(!strlen(tmp)) {
         SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /setadmin [playerid] [level] (0: No Admin / 1: Server Admin / 2: Server Owner)");
         return 1;
      }
      tmp = strtok(cmdtext, idx);
      if(!strlen(tmp)) {
         SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /setadmin [playerid] [level] (0: No Admin / 1: Server Admin / 2: Server Owner)");
         return 1;
      }
      if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if (PlayerInfo[playerid][admin] < 2) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use this command!");
            return 1;
  		}
  		if(PlayerInfo[giveplayerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "The Player ID you specified is not currently logged in, they must register and login to recieve admin powers");
			return 1;
		}
      level[playerid] = strval(tmp);
      if(level[playerid] < 0) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Invalid Admin Level (0: No Admin / 1: Server Admin / 2: Server Owner)");
            return 1;
      }
      if(level[playerid] > 2) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "Invalid Admin Level (0: No Admin / 1: Server Admin / 2: Server Owner)");
            return 1;
      }
      if(level[playerid] == PlayerInfo[giveplayerid][admin]) {
            format(string, sizeof(string), "That player already has level %d Server Admin privelages.", level[playerid]);
            SendClientMessage(playerid, COLOR_BRIGHTRED, string);
            return 1;
      }
      if (IsPlayerConnected(giveplayerid)) {
         GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
         GetPlayerName(playerid, sendername, sizeof(sendername));
         format(string, sizeof(string), "Admin/Moderator %s (id: %d), gave %s (id: %d) level %d Server Admin powers.",sendername,playerid,giveplayer,giveplayerid,level[playerid]);
         SendClientMessageToAll(COLOR_ORANGE, string);
         format(string, sizeof(string), "You have given %s (id: %d), level %d Server Admin powers.", giveplayer,giveplayerid, level[playerid]);
         SendClientMessage(playerid, COLOR_ORANGE, string);
         format(string, sizeof(string), "You were made a level %d admin by Server Admin %s (id: %d).", level[playerid], sendername, playerid);
         SendClientMessage(giveplayerid, COLOR_ORANGE, string);
         PlayerInfo[giveplayerid][admin] = level[playerid];
         SavePlayer(giveplayerid);
      }
      else {
            format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
            SendClientMessage(playerid, COLOR_BRIGHTRED, string);
         }
      return 1;
   }
	if(strcmp(cmd, "/tele", true) == 0) {
		new telename[MAX_PLAYER_NAME];
		new teleid;
		new Float:pX, Float:pY, Float:pZ;
		tmp = strtok(cmdtext, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /tele [teleportee id] [destination id]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /tele [teleportee id] [destination id]");
			return 1;
		}
 		teleid = strval(tmp);

		if (IsPlayerConnected(giveplayerid) && IsPlayerConnected(teleid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			GetPlayerName(teleid, telename, sizeof(telename));
			GetPlayerPos(teleid, pX,pY,pZ);
			SetPlayerPos(giveplayerid, pX,pY,pZ);
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) teleported %s (id: %d) to %s (id: %d)", sendername,playerid,giveplayer,giveplayerid,telename,teleid);
			SendClientMessageToAll(COLOR_ORANGE, string);
			format(string, sizeof(string), "You teleported %s (id: %d) to %s (id: %d).", giveplayer,giveplayerid,telename,teleid);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "You have been teleported to %s (id: %d) by Admin/Moderator %s (id: %d).", telename,teleid,sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_ORANGE, string);
		}
		if (!IsPlayerConnected(giveplayerid)) {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}
		if (!IsPlayerConnected(teleid)) {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", teleid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}

		return 1;
	}
   if(strcmp(cmd, "/ban", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /ban [playerid]");
			return 1;
		}
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 10) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][admin] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot ban a fellow admin or moderator!");
		    return 1;
		}

		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) banned %s (id: %d).", sendername,playerid,giveplayer,giveplayerid);
			SendClientMessageToAll(COLOR_BRIGHTRED,string);
			format(string, sizeof(string), "%s (id: %d) has been banned.", giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			format(string, sizeof(string), "You were banned by Admin/Moderator %s (id: %d).", sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_BRIGHTRED, string);
			Ban(giveplayerid);
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/countdown", true) == 0) {
	    new seconds;
		tmp = strtok(cmdtext, idx);
		seconds = strval(tmp);
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
		if (!seconds)
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "You must enter a duration in seconds.");
  		if (seconds > 20) {
  			SendClientMessage(giveplayerid, COLOR_BRIGHTRED, "You must enter a duration between 1 and 20 seconds");
  			return 1;
  		}

    	else if (cseconds)
        	SendClientMessage(playerid, COLOR_BRIGHTRED, "A countdown is already running.");

    	else
    	{
        	format(cstring,40,"You started a countdown of %d seconds.",seconds);
        	SendClientMessage(playerid,COLOR_LIGHTBLUE, cstring);
        	cseconds = seconds+1;
        	Count[playerid] = 1;
    	}
    	return 1;
	}
   if(strcmp(cmd, "/kick", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /kick [playerid]");
			return 1;
		}
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][admin] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot kick a fellow admin or moderator!");
		    return 1;
		}
		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) kicked %s (id: %d).", sendername,playerid,giveplayer,giveplayerid);
			SendClientMessageToAll(COLOR_BRIGHTRED,string);
			format(string, sizeof(string), "%s (id: %d) has been kicked.", giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			format(string, sizeof(string), "You were kicked by Admin/Moderator %s (id: %d).", sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_BRIGHTRED, string);
			Kick(giveplayerid);
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}
		return 1;
	}
   if(strcmp(cmd, "/jail", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /jail [playerid]");
			return 1;
		}
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "That player is already in jail!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][admin] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot jail a fellow admin or moderator!");
		    return 1;
		}

		if (IsPlayerConnected(giveplayerid)) {
		    PlayerInfo[giveplayerid][jailed] = 1;
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			SetPlayerInterior(giveplayerid,6);
			TogglePlayerControllable(giveplayerid,0);
			SetPlayerPos(giveplayerid,265.1273,77.6823,1001.0391);
			SetPlayerFacingAngle(playerid,271.3259);
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) jailed %s (id: %d).", sendername,playerid,giveplayer,giveplayerid);
			SendClientMessageToAll(COLOR_ORANGE,string);
			format(string, sizeof(string), "%s (id: %d) has been jailed.", giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "You were jailed by Admin/Moderator %s (id: %d).", sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_ORANGE, string);
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}
		return 1;
	}

	if(strcmp(cmd, "/unjail", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /unjail [playerid]");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][jailed] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "That player is not in jail!");
		    return 1;
		}
		if (IsPlayerConnected(giveplayerid)) {
  			if(IsPlayerConnected(giveplayerid)) {
  		    	PlayerInfo[giveplayerid][jailed] = 0;
  				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				SetPlayerInterior(giveplayerid,0);
				TogglePlayerControllable(giveplayerid,1);
				SetPlayerPos(giveplayerid,2283.2024,2424.1245,10.8203);
				format(string, sizeof(string), "Admin/Moderator %s (id: %d) released %s (id: %d) from jail.", sendername,playerid,giveplayer,giveplayerid);
				SendClientMessageToAll(COLOR_ORANGE, string);
				format(string, sizeof(string), "%s (id: %d) has been released from jail.", giveplayer,giveplayerid);
				SendClientMessage(playerid, COLOR_ORANGE, string);
				format(string, sizeof(string), "You were released from jail by Admin/Moderator %s (id: %d).", sendername,playerid);
				SendClientMessage(giveplayerid, COLOR_ORANGE, string);
			}
			else {
				format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
				SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
	   	}
		return 1;
	}
	if(strcmp(cmd, "/freeze", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][admin] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot freeze a fellow admin or moderator!");
		    return 1;
		}
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /freeze [playerid]");
			return 1;
		}

		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			TogglePlayerControllable(giveplayerid, 0);
			PlayerInfo[playerid][frozen] = 1;
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) froze %s (id: %d).", sendername,playerid,giveplayer,giveplayerid);
			SendClientMessageToAll(COLOR_ORANGE, string);
			format(string, sizeof(string), "%s (id: %d) has been frozen.", giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "You were frozen by Admin/Moderator %s (id: %d).", sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_ORANGE, string);
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}

		return 1;
	}

	if(strcmp(cmd, "/unfreeze", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][admin] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot freeze a fellow admin or moderator!");
		    return 1;
		}
		if(PlayerInfo[playerid][frozen] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "That player has not been frozen!");
		    return 1;
		}
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /unfreeze [playerid]");
			return 1;
		}

		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			TogglePlayerControllable(giveplayerid, 1);
			PlayerInfo[playerid][frozen] = 0;
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) unfroze %s (id: %d).", sendername,playerid,giveplayer,giveplayerid);
			SendClientMessageToAll(COLOR_ORANGE, string);
			format(string, sizeof(string), "%s (id: %d) has been unfrozen.", giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "You were unfrozen by Admin/Moderator %s (id: %d).", sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_ORANGE, string);
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}

		return 1;
	}
	if(strcmp(cmd, "/givemoney", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] < 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /givemoney [playerid] [amount]");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /givemoney [playerid] [amount]");
			return 1;
		}
 		moneys[playerid] = strval(tmp);
		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			GetPlayerMoney(playerid);
			GivePlayerMoney(giveplayerid, moneys[playerid]);
			format(string, sizeof(string), "You have given $%d to %s (id: %d).",moneys[playerid],giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "You have been given $%d from Admin/Moderator %s (id: %d).", moneys[playerid], sendername, playerid);
			SendClientMessage(giveplayerid, COLOR_ORANGE, string);
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}

		return 1;
	}
	if(strcmp(cmd, "/disarm", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] < 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][admin] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot disarm a fellow admin or moderator!");
		    return 1;
		}
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /disarm [playerid]");
			return 1;
		}

		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			ResetPlayerWeapons(giveplayerid);
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) has disarmed %s (id: %d).", sendername,playerid,giveplayer,giveplayerid);
			SendClientMessageToAll(COLOR_ORANGE, string);
			format(string, sizeof(string), "You have disarmed %s (id: %d).", giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) disarmed you.", sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_ORANGE, string);
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}

		return 1;
	}
	if(strcmp(cmd, "/announce", true) == 0)
        {

        tmp = strtok(cmdtext, idx, strlen(cmdtext));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
 		if (!strlen(tmp))
  		{
  			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /announce [message]");
    		return 1;
      	}
      	if (2 < strlen(tmp) && strlen(tmp) < 31)
   		{
  			format(string, sizeof(string), "~w~%s", tmp);
			GameTextForAll(string, 5000, 3);
			for(new i=0;i<MAX_PLAYERS;i++) {
				if(IsPlayerConnected(i)) {
		    		aMessage[i] = 1;
		    		SetTimer("announcer",5000,0);
				}
			}
		}
 		else
  		{
			if (strlen(tmp) < 2)
			{
 				format(string, sizeof(string), "- %s - is too short!", tmp);
   				SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
			if (strlen(tmp) == 2)
			{
            	format(string, sizeof(string), "- %s - is too short!", tmp);
           		SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
			if (strlen(tmp) > 31)
			{
           		format(string, sizeof(string), "- %s - is too long!", tmp);
           		SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
			if (strlen(tmp) == 31)
			{
				format(string, sizeof(string), "- %s - is too long!", tmp);
  				SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			}
		}
        return 1;
	}
	if(strcmp(cmd, "/murder", true) == 0) {
		tmp = strtok(cmdtext, idx);
		giveplayerid = strval(tmp);
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][logged] == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
			return 1;
		}
		if(PlayerInfo[playerid][admin] < 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    return 1;
		}
		if(PlayerInfo[giveplayerid][admin] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot murder a fellow admin or moderator!");
		    return 1;
		}
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "USAGE: /murder [playerid]");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			SetPlayerHealth(giveplayerid, -999);
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) murdered %s (id: %d).", sendername,playerid,giveplayer,giveplayerid);
			SendClientMessageToAll(COLOR_ORANGE, string);
			format(string, sizeof(string), "You have murdered %s (id: %d).", giveplayer,giveplayerid);
			SendClientMessage(playerid, COLOR_ORANGE, string);
			format(string, sizeof(string), "Admin/Moderator %s (id: %d) murdered you.", sendername,playerid);
			SendClientMessage(giveplayerid, COLOR_ORANGE, string);
			return 1;
		}
		else {
			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/slap", true) == 0)
 		{
 		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this command");
		    return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /slap [playerid] [object]");
			return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx, strlen(cmdtext));
		if (!strlen(tmp))
		{
  			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /slap [playerid] [object]");
       		return 1;
    	}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
 			format(string, sizeof(string), "%s bitch slaps %s across the face with a %s", sendername, giveplayer, tmp);
  			SendClientMessageToAll(COLOR_INDIGO, string);
			for(new i=0; i < MAX_PLAYERS; i++) {
   				new Float:fx, Float:fy, Float:fz;
				GetPlayerPos(i, fx,fy,fz);
				PlayerPlaySound(i, 1190, fx,fy,fz);
    		}
    		return 1;
		}
		else
		{
 			format(string, sizeof(string), "ID:%d is not an active player ID number.", giveplayerid);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/achat", true) == 0)
        {
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][logged] == 0) {
				SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this command!");
				return 1;
			}
			if(PlayerInfo[playerid][admin] < 1) {
		    	SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use that command!");
		    	return 1;
			}
        	tmp = strtok(cmdtext, idx, strlen(cmdtext));
         	if (!strlen(tmp))
          	{
          		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /achat [message]");
            	return 1;
             }
             for (new i = 0; i <MAX_PLAYERS; i++)
             {
            	if(IsPlayerConnected(i))
				{
            		if (PlayerInfo[i][admin] > 0)
           			{
                 		format(string, sizeof(string), "Admin Chat (%s): %s", playername, tmp);
                  		SendClientMessage(i, COLOR_AQUA, string); }
                   	}
				}
                return 1;
        }
        if(strcmp(cmd, "/admins", true) == 0) {
        new online;
        new lColour;
        SendClientMessage(playerid, COLOR_ORANGE, "Current Admins Online");
        for (new i = 0; i < MAX_PLAYERS; i++) {
            online = 0;
            GetPlayerName(i, sendername, sizeof(sendername));
        	if (IsPlayerConnected(i)){
         		if (PlayerInfo[i][logged] == 1){
           			GetPlayerName(i, sendername, sizeof(sendername));
              		if (PlayerInfo[i][admin] == 1) {
                		format(string, sizeof(string), "%s - Server Admin", sendername);
                  		lColour = COLOR_AQUA;
                    }
                    else if (PlayerInfo[i][admin] == 2) {
                    	format(string, sizeof(string), "%s - Server Owner", sendername);
                     	lColour = COLOR_BRIGHTRED;
                    }
                    online++;
                    }
                    if (online == 1) {
                        SendClientMessage(playerid, lColour, string);
                	}
        			if (online == 0) {
                        SendClientMessage(playerid, COLOR_BRIGHTRED, "There are currently no admins online!");
                	}
                	return 1;

			}
		}

   	}
   	if(strcmp(cmd, "/call", true) == 0)
		{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Usage: /call [playerid]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if (PlayerInfo[playerid][logged] != 1)
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to make a phone call!");
			return 1;
		}
		if (GetPlayerMoney(playerid) < CALL_UNIT_COST)
		{
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have enough money to make a phone call!");
			return 1;
		}
		if (giveplayerid == playerid)
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You cannot call yourself!");
		    return 1;
		}
		if (!(IsPlayerConnected(giveplayerid)))
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "Inactive player id!");
		    return 1;
		}
		if (Calling[playerid] > -1)
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "You are already on the phone to %s!", giveplayer);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			return 1;
		}
		if (Calling[giveplayerid] > -1)
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "%s is already on the phone, try again later", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 1;
		}
		else
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s is ringing you, type /answer to answer the call or /hangup to ignore it", sendername);
			SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "You are ringing %s", giveplayer);
			SendClientMessage(playerid, COLOR_GREEN, string);
   			Calling[playerid] = giveplayerid;
   			Calling[giveplayerid] = playerid;
			Callerid[playerid] = 1;
		    return 1;
	}
	if(strcmp(cmd, "/answer", true) == 0)
		{
		if (PlayerInfo[playerid][logged] != 1)
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to answer a phone call!");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "Nobody is calling you!");
		    return 1;
		}
		if (Answered[playerid] == 1)
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "You are already on the phone!");
		    return 1;
		}
		else
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s has answered your call, talk away", sendername);
			SendClientMessage(Calling[playerid], COLOR_GREEN, string);
			format(string, sizeof(string), "You have answered %s's call, talk away", giveplayer);
			SendClientMessage(playerid, COLOR_GREEN, string);
   			Answered[playerid] = 1;
   			Answered[Calling[playerid]] = 1;
			Callerid[Calling[playerid]] = 1;
		    return 1;
	}
	if(strcmp(cmd, "/hangup", true) == 0)
		{
		if (PlayerInfo[playerid][logged] != 1)
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to hang up a phone call!");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not on the phone!");
		    return 1;
		}
		else
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s has hung up the phone on you", sendername);
			SendClientMessage(Calling[playerid], COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "You have hung up on %s", giveplayer);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
   			new bCalling = Calling[playerid];
   			Calling[playerid] = -1;
   			Answered[playerid] = 0;
			Callerid[playerid] = 0;
   			Calling[bCalling] = -1;
   			Answered[bCalling] = 0;
			Callerid[bCalling] = 0;
		}
		    return 1;
	}
	if(strcmp(cmd, "/help", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "----- tAxI's RPG/Freeroam [World v0.2.7b] -----");
		SendClientMessage(playerid, COLOR_YELLOW, "For BUSINESS help please type /bizhelp.");
		SendClientMessage(playerid, COLOR_YELLOW, "For CELLPHONE help please type /cellhelp.");
		SendClientMessage(playerid, COLOR_YELLOW, "For BANK commands please type /bankhelp.");
		SendClientMessage(playerid, COLOR_YELLOW, "For XVM(vehicle) SYSTEM info, please type /vehiclehelp.");
		SendClientMessage(playerid, COLOR_YELLOW, "For ADMIN commands, please type /adminhelp.");
		SendClientMessage(playerid, COLOR_YELLOW, "For GENERAL commands, please type /commands.");
		SendClientMessage(playerid, COLOR_YELLOW, "For FUEL SYSTEM info and the location of the refuelling stations, please type /fuelhelp.");
		SendClientMessage(playerid, COLOR_ORANGE, "All your stats are saved permanently, including your own car and any mods you make to it!");
		SendClientMessage(playerid, COLOR_ORANGE, "Type /credits to see a list of the ppl who contributed to this script.");
		return 1;
	}
	if(strcmp(cmd, "/bizhelp", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Business System Help ----------");
		SendClientMessage(playerid, COLOR_YELLOW, "Businesses are indicated on the map by the yellow circle icons and in the gameworld by a spinning blue house pickup.");
		SendClientMessage(playerid, COLOR_YELLOW, "Type /buybiz to purchase the business. Must be within 7-8m of business icon.");
		SendClientMessage(playerid, COLOR_YELLOW, "Type /sellbiz to sell your business. Must be within 7-8m of business icon.");
		SendClientMessage(playerid, COLOR_YELLOW, "Type /cashbox to transfer you business' earnings to your personal bank account. Must be within 7-8m of business icon.");
		return 1;
	}
	if(strcmp(cmd, "/cellhelp", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Cellphone System Help ----------");
		SendClientMessage(playerid, COLOR_YELLOW, "Every person has their own cellphone - calls cost $1/second.");
		SendClientMessage(playerid, COLOR_YELLOW, "To make a call - /call [player id].");
		SendClientMessage(playerid, COLOR_YELLOW, "To answer a call - /answer.");
		SendClientMessage(playerid, COLOR_YELLOW, "To end a call - /hangup.");
		return 1;
	}
	if(strcmp(cmd, "/fuelhelp", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Fuel System Help ----------");
		SendClientMessage(playerid, COLOR_YELLOW, "Fuel stations are located in all the fuel stations for ground vehicles!");
		SendClientMessage(playerid, COLOR_YELLOW, "For airborne and large vehicles, the refuelling stations are located in all of the airports (inc verdant meadows)...just");
		SendClientMessage(playerid, COLOR_YELLOW, "look for the little grey vehicle icons on ur minimap to locate the refuelling areas.");
		SendClientMessage(playerid, COLOR_YELLOW, "Refuel vehicle - /vmenu");
		return 1;
	}
	if(strcmp(cmd, "/commands", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- General Commands ----------");
		SendClientMessage(playerid, COLOR_YELLOW, "You can use the /register and /login and /setpass to manage your user account.");
		SendClientMessage(playerid, COLOR_YELLOW, "To see what admins are online type /admins");
		SendClientMessage(playerid, COLOR_YELLOW, "To start a countdown type /countdown [time]");
		SendClientMessage(playerid, COLOR_YELLOW, "To slap another player type /slap [player id] [object]");
		return 1;
	}
	if(strcmp(cmd, "/adminhelp", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Admin Help ----------");
		SendClientMessage(playerid, COLOR_ORANGE, "To become the server owner you must login to rcon and type /giveadmin");
		SendClientMessage(playerid, COLOR_YELLOW, "Admin help part 1 - /ahelp1");
		SendClientMessage(playerid, COLOR_YELLOW, "Admin help part 2 - /ahelp2");
		SendClientMessage(playerid, COLOR_YELLOW, "Admin help part 3 - /ahelp3");
		return 1;
	}
	if(strcmp(cmd, "/ahelp1", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Admin Help 1 ----------");
		SendClientMessage(playerid, COLOR_YELLOW, "Use Admin Chat - /achat [message]");
		SendClientMessage(playerid, COLOR_YELLOW, "To use the vehicle admin system enter a vehicle and type /vmenu");
		SendClientMessage(playerid, COLOR_YELLOW, "Jail or Unjail a player - /jail [player id] or /unjail [player id]");
		SendClientMessage(playerid, COLOR_YELLOW, "Teleport anyone to any other person - /tele [teleportee id] [destination id]");
		return 1;
	}
    if(strcmp(cmd, "/ahelp2", true) == 0) {
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Admin Help 2----------");
		SendClientMessage(playerid, COLOR_YELLOW, "Kick a player - /kick [player id]");
		SendClientMessage(playerid, COLOR_YELLOW, "Disarm a player - /disarm [player id]");
		SendClientMessage(playerid, COLOR_YELLOW, "Murder a player - /murder [player id]");
		SendClientMessage(playerid, COLOR_YELLOW, "Make an announcement - /announce [message]");
		SendClientMessage(playerid, COLOR_YELLOW, "Give player money - /givemoney [player id] [amount]");
		SendClientMessage(playerid, COLOR_YELLOW, "Freeze or Unfreeze a player - /freeze [player id] or /unfreeze [player id]");
		return 1;
	}
	if(strcmp(cmd, "/ahelp3", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Admin Help 3 ----------");
        SendClientMessage(playerid, COLOR_ORANGE, "You are able to use all of the level one command and also the following:");
		SendClientMessage(playerid, COLOR_YELLOW, "Ban a player - /ban [player id]");
		SendClientMessage(playerid, COLOR_YELLOW, "Reset any business owned in-game - /asellbiz");
		SendClientMessage(playerid, COLOR_YELLOW, "Set player admin level (server owner only) - /setadmin [player id] [admin level] - 0: None / 1: Server Admin / 2: Server Owner");
		return 1;
	}
	if(strcmp(cmd, "/bankhelp", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Bank Help ----------");
		SendClientMessage(playerid, COLOR_YELLOW, "You must be at a ATM area (located in the 24/7 shops):");
		SendClientMessage(playerid, COLOR_YELLOW, "Deposit Amount - /deposit [amount]");
		SendClientMessage(playerid, COLOR_YELLOW, "Withdraw Amount - /withdraw [amount]");
		SendClientMessage(playerid, COLOR_YELLOW, "Check Balance - /balance");
		SendClientMessage(playerid, COLOR_YELLOW, "Give Cash - /givecash [recipient id] [amount] - sends a specified amount of money to the specified player id");
		SendClientMessage(playerid, COLOR_ORANGE, "Bank will not be reset when you die or reconnect.");
		return 1;
	}
    if(strcmp(cmd, "/vehiclehelp", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "---------- Vehicle Help ----------");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "In order to gain access to your vehicles controls please type /vmenu - can be used in or outside your owned vehicle.");
		return 1;
	}
	if(strcmp(cmd, "/credits", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "----- tAxI's RPG/Freeroam [World v0.2.7b] Credits -----");
		SendClientMessage(playerid, COLOR_YELLOW, "Script designer and concept - tAxI aka Necrioss (email <::> cptnsausage@hotmail.com)");
		SendClientMessage(playerid, COLOR_YELLOW, "Original code for Vehicle HP bar was made by Mr-Tape - Highly modified by tAxI aka Necrioss");
		SendClientMessage(playerid, COLOR_GREEN, "If you wish to use this script or any parts of it in your own gamemode please feel free but you must GIVE CREDIT!!!");
		return 1;
	}
	return 0;
}

public SaveComponent(vehicleid,componentid)
{
    new playerid = GetDriverID(vehicleid);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    	    if (strcmp(VehicleInfo[vehicleid][owner],PlayerInfo[playerid][name],false) == 0) {
				for(new s=0; s<20; s++) {
     				if(componentid == spoiler[s][0]) {
       					VehicleInfo[vehicleid][mod1] = componentid;
   	        		}
				}
				for(new s=0; s<3; s++) {
     				if(componentid == nitro[s][0]) {
       					VehicleInfo[vehicleid][mod2] = componentid;
   	        		}
				}
				for(new s=0; s<23; s++) {
     				if(componentid == fbumper[s][0]) {
       					VehicleInfo[vehicleid][mod3] = componentid;
   	        		}
				}
				for(new s=0; s<22; s++) {
     				if(componentid == rbumper[s][0]) {
       					VehicleInfo[vehicleid][mod4] = componentid;
   	        		}
				}
				for(new s=0; s<28; s++) {
     				if(componentid == exhaust[s][0]) {
       					VehicleInfo[vehicleid][mod5] = componentid;
   	        		}
				}
				for(new s=0; s<2; s++) {
     				if(componentid == bventr[s][0]) {
       					VehicleInfo[vehicleid][mod6] = componentid;
   	        		}
				}
				for(new s=0; s<2; s++) {
     				if(componentid == bventl[s][0]) {
       					VehicleInfo[vehicleid][mod7] = componentid;
   	        		}
				}
				for(new s=0; s<4; s++) {
     				if(componentid == bscoop[s][0]) {
       					VehicleInfo[vehicleid][mod8] = componentid;
   	        		}
				}
				for(new s=0; s<13; s++) {
     				if(componentid == rscoop[s][0]) {
       					VehicleInfo[vehicleid][mod9] = componentid;
   	        		}
				}
				for(new s=0; s<21; s++) {
     				if(componentid == lskirt[s][0]) {
       					VehicleInfo[vehicleid][mod10] = componentid;
   	        		}
				}
				for(new s=0; s<21; s++) {
     				if(componentid == rskirt[s][0]) {
       					VehicleInfo[vehicleid][mod11] = componentid;
   	        		}
				}
				for(new s=0; s<1; s++) {
     				if(componentid == hydraulics[s][0]) {
       					VehicleInfo[vehicleid][mod12] = componentid;
   	        		}
				}
				for(new s=0; s<1; s++) {
     				if(componentid == base[s][0]) {
       					VehicleInfo[vehicleid][mod13] = componentid;
   	        		}
				}
				for(new s=0; s<2; s++) {
     				if(componentid == rbbars[s][0]) {
       					VehicleInfo[vehicleid][mod14] = componentid;
   	        		}
				}
				for(new s=0; s<2; s++) {
     				if(componentid == fbbars[s][0]) {
       					VehicleInfo[vehicleid][mod15] = componentid;
   	        		}
				}
				for(new s=0; s<17; s++) {
     				if(componentid == wheels[s][0]) {
       					VehicleInfo[vehicleid][mod16] = componentid;
   	        		}
				}
				for(new s=0; s<2; s++) {
     				if(componentid == lights[s][0]) {
       					VehicleInfo[vehicleid][mod17] = componentid;
   	        		}
				}
				return 1;
			}
	}
	return 0;
}

stock SavePaintjob(vehicleid,paintjobid)
{
    new playerid = GetDriverID(vehicleid);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    	    if (strcmp(VehicleInfo[vehicleid][owner],PlayerInfo[playerid][name],false) == 0) {
				VehicleInfo[vehicleid][paintjob] = paintjobid;
				return 1;
			}
	}
	return 0;
}

stock SaveColors(vehicleid,color1,color2)
{
    new playerid = GetDriverID(vehicleid);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    	    if (strcmp(VehicleInfo[vehicleid][owner],PlayerInfo[playerid][name],false) == 0) {
				VehicleInfo[vehicleid][color_1] = color1;
    	        VehicleInfo[vehicleid][color_2] = color2;
				return 1;
			}
	}
	return 0;
}

stock GetDriverID(vehicleid)
{
    for(new i=0; i<V_LIMIT; i++) {
        if(IsPlayerConnected(i)) {
            if(IsPlayerInAnyVehicle(i)) {
                if(GetPlayerVehicleID(i) == vehicleid) {
					return i;
                }
            }
        }
    }
    return -1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
    new Menu:Current = GetPlayerMenu(playerid);
    if(Current == vehiclemain) {
    	switch(row){
        	case 0:ShowMenuForPlayer(playervm, playerid);
        	case 1:ShowMenuForPlayer(adminm, playerid);
        	case 2:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
		}
	}
	else if(Current == playervm) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);refuel(playerid);TogglePlayerControllable(playerid, true);}
		case 1:ShowMenuForPlayer(templock, playerid);
		case 2:ShowMenuForPlayer(healthbar, playerid);
		case 3:ShowMenuForPlayer(speedom, playerid);
		case 4:ShowMenuForPlayer(buysell, playerid);
		case 5:{callcar(playerid);HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
        case 6:{HideMenuForPlayer(Current, playerid);park(playerid);TogglePlayerControllable(playerid, true);}
        case 7:ShowMenuForPlayer(secure1, playerid);
        case 8:ShowMenuForPlayer(vehiclemain, playerid);
		}
	}
	else if(Current == adminm) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);asellcar(playerid);TogglePlayerControllable(playerid, true);}
		case 1:ShowMenuForPlayer(buyable, playerid);
		case 2:ShowMenuForPlayer(asecure1, playerid);
		case 3:ShowMenuForPlayer(vehiclemain, playerid);
		}
	}
	else if(Current == templock) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);lock(playerid);TogglePlayerControllable(playerid, true);}
		case 1:{HideMenuForPlayer(Current, playerid);unlock(playerid);TogglePlayerControllable(playerid, true);}
        case 2:ShowMenuForPlayer(playervm, playerid);
        }
	}
	else if(Current == speedom) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);dashboardon(playerid);TogglePlayerControllable(playerid, true);}
        case 1:{HideMenuForPlayer(Current, playerid);dashboardoff(playerid);TogglePlayerControllable(playerid, true);}
        case 2:ShowMenuForPlayer(playervm, playerid);
        }
	}
	else if(Current == buysell) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);buycar(playerid);TogglePlayerControllable(playerid, true);}
        case 1:{HideMenuForPlayer(Current, playerid);sellcar(playerid);TogglePlayerControllable(playerid, true);}
        case 2:ShowMenuForPlayer(playervm, playerid);
        }
	}
	else if(Current == secure1) {
	switch(row){
	    case 0:ShowMenuForPlayer(secure2, playerid);
	    case 1:{HideMenuForPlayer(Current, playerid);unsecure(playerid);TogglePlayerControllable(playerid, true);}
	    case 2:ShowMenuForPlayer(playervm, playerid);
	    }
	}
	else if(Current == secure2) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);securekill(playerid);TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);securekick(playerid);TogglePlayerControllable(playerid, true);}
	    case 2:ShowMenuForPlayer(secure1, playerid);
	    }
	}
	else if(Current == buyable) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);setbuy(playerid);TogglePlayerControllable(playerid, true);}
		case 1:{HideMenuForPlayer(Current, playerid);setunbuy(playerid);TogglePlayerControllable(playerid, true);}
	    case 2:ShowMenuForPlayer(adminm, playerid);
	    }
	}
	else if(Current == asecure1) {
	switch(row){
	    case 0:ShowMenuForPlayer(asecure2, playerid);
	    case 1:{HideMenuForPlayer(Current, playerid);aunsecure(playerid);TogglePlayerControllable(playerid, true);}
	    case 2:ShowMenuForPlayer(adminm, playerid);
	    }
	}
	else if(Current == asecure2) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);asecurekill(playerid);TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);asecurekick(playerid);TogglePlayerControllable(playerid, true);}
	    case 2:ShowMenuForPlayer(asecure1, playerid);
	    }
	}
	else if(Current == healthbar) {
	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);PlayerInfo[playerid][vhpb] = 1;TogglePlayerControllable(playerid, true);SendClientMessage(playerid,COLOR_GREEN,"Vehicle HP Bar is now active!");}
	    case 1:{HideMenuForPlayer(Current, playerid);PlayerInfo[playerid][vhpb] = 0;TogglePlayerControllable(playerid, true);SendClientMessage(playerid,COLOR_BRIGHTRED,"Vehicle HP Bar is now in-active!");}
	    case 2:ShowMenuForPlayer(playervm, playerid);
	    }
	}
}

public OnPlayerDisconnect(playerid,reason)
{
    new playername[MAX_PLAYER_NAME], string[256];
    switch(reason)
    {
        case 0:
        {
             GetPlayerName(playerid, playername, sizeof(playername));
             format(string, sizeof(string), "^^^ %s has left the server.(Timeout) ^^^", playername);
             SendClientMessageToAll(COLOR_GREY, string);
        }
        case 1:
        {
             GetPlayerName(playerid, playername, sizeof(playername));
             format(string, sizeof(string), "^^^ %s has left the server.(Leaving) ^^^", playername);
             SendClientMessageToAll(COLOR_GREY, string);
        }
        case 2:
        {
             GetPlayerName(playerid, playername, sizeof(playername));
             format(string, sizeof(string), "^^^ %s has left the server.(Kicked) ^^^", playername);
             SendClientMessageToAll(COLOR_GREY, string);
        }
    }
}

public OnGameModeExit()
{
    DestroyMenu(vehiclemain);
    DestroyMenu(playervm);
    DestroyMenu(buysell);
    DestroyMenu(secure1);
    DestroyMenu(secure2);
    DestroyMenu(templock);
    DestroyMenu(adminm);
    DestroyMenu(asecure1);
    DestroyMenu(asecure2);
    DestroyMenu(speedom);
    DestroyMenu(buyable);
	return 1;
}

public BackupInfo()
{
	SaveVehicles();
	SaveBusinesses();
}

stock buycar(playerid)
{
		new string[256];
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this feature");
		    return 1;
		}
  		if(passenger[playerid] == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in the drivers' seat of this vehicle to buy it!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle in order to buy one!");
			return 1;
		}
		if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "This vehicle is currently set as un-buyable!");
			return 1;
		}
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
			format(string, sizeof(string), "You already own this %s, %s", VehicleInfo[GetPlayerVehicleID(playerid)][name], PlayerInfo[playerid][name]);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			return 1;
		}
		if(VehicleInfo[GetPlayerVehicleID(playerid)][bought] == 1) {
			format(string, sizeof(string), "This %s is owned by %s, and is not for sale!", VehicleInfo[GetPlayerVehicleID(playerid)][name], VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			return 1;
		}
		if(PlayerInfo[playerid][vowner] == 1) {
  			SendClientMessage(playerid, COLOR_BRIGHTRED, "You can only own ONE vehicle at a time! You must sell your other vehicle first!");
     		return 1;
		}
			new cash[MAX_PLAYERS];
			cash[playerid] = GetPlayerMoney(playerid);
			if(cash[playerid] >= VehicleInfo[GetPlayerVehicleID(playerid)][vehiclecost]) {
			    new stringa[256];
	   	 		strmid(VehicleInfo[GetPlayerVehicleID(playerid)][owner], PlayerInfo[playerid][name], 0, strlen(PlayerInfo[playerid][name]), 255);
                VehicleInfo[GetPlayerVehicleID(playerid)][bought] = 1;
                PlayerInfo[playerid][vowner] = 1;
                PlayerInfo[playerid][vowned] = GetPlayerVehicleID(playerid);
				GivePlayerMoney(playerid, -VehicleInfo[GetPlayerVehicleID(playerid)][vehiclecost]);
				format(stringa, sizeof(stringa), "You just bought this %s for $%d. Your %s currently has %d/100 of its fuel remaining!", VehicleInfo[GetPlayerVehicleID(playerid)][name], VehicleInfo[GetPlayerVehicleID(playerid)][vehiclecost],VehicleInfo[GetPlayerVehicleID(playerid)][name],VehicleInfo[GetPlayerVehicleID(playerid)][gas]);
				SendClientMessage(playerid, COLOR_GREEN, stringa);
				SavePlayer(playerid);
				return 1;
			}
			if(cash[playerid] < VehicleInfo[GetPlayerVehicleID(playerid)][vehiclecost]) {
			    new string6[256];
				format(string6, sizeof(string6), "You do not have $%d and cannot afford this %s!", VehicleInfo[GetPlayerVehicleID(playerid)][vehiclecost],VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_BRIGHTRED, string6);
				return 1;
			}
			return 1;
}
	
stock sellcar(playerid)
{
        new string[256];
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this feature");
		    return 1;
		}
		if(passenger[playerid] == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in the drivers' seat of your vehicle to sell it!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be inside your vehicle in order to sell it");
			return 1;
		}
  		new vehicleID = GetPlayerVehicleID(playerid);
  		if (strcmp(VehicleInfo[vehicleID][owner],PlayerInfo[playerid][name],false) == 0) {
			SetVehicleToRespawn(vehicleID);
			SetVehicleVirtualWorld(vehicleID,10);
			SetTimerEx("RestartVehicle",5000,0,"i",vehicleID);
    		PlayerInfo[playerid][vowned] = 0;
			PlayerInfo[playerid][vowner] = 0;
			strmid(VehicleInfo[vehicleID][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
			VehicleInfo[vehicleID][bought] = 0;
			VehicleInfo[vehicleID][secure] = 0;
			GivePlayerMoney(playerid, VehicleInfo[vehicleID][vehiclecost]);
			format(string, sizeof(string), "You just sold your %s for $%d, enjoy the walk!!", VehicleInfo[vehicleID][name], VehicleInfo[vehicleID][vehiclecost]);
			SendClientMessage(playerid, COLOR_BRIGHTRED, string);
			SavePlayer(playerid);
			return 1;
  		}
  		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "What are you trying to pull here, you don't own the vehicle!!!");
			return 1;
		}
}
	
stock asellcar(playerid)
{
        new string[256];
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(passenger[playerid] == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in the drivers seat to use this feature");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle in order to use this feature");
			return 1;
		}
   	    if (PlayerInfo[playerid][admin] > 0) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],DEFAULT_OWNER,false) == 0) {
				format(string,sizeof(string),"This %d does not have an owner yet!",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
 				SendClientMessage(playerid,COLOR_ORANGE,string);
				return 1;
			}
			new file[256];
			new vehicleID = GetPlayerVehicleID(playerid);
			SetVehicleToRespawn(vehicleID);
			SetVehicleVirtualWorld(vehicleID,10);
			SetTimerEx("RestartVehicle",5000,0,"i",vehicleID);
			format(file,sizeof(file),P_FILE,udb_encode(VehicleInfo[vehicleID][owner]));
			if(fexist(file)) {
			    tempid[playerid] = IsPlayerNameOnline(VehicleInfo[vehicleID][owner]);
			    if(tempid[playerid] >= 0 && tempid[playerid] <= MAX_PLAYERS) {
			        strmid(VehicleInfo[vehicleID][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
					PlayerInfo[tempid[playerid]][vowned] = 0;
					PlayerInfo[tempid[playerid]][vowner] = 0;
					VehicleInfo[vehicleID][bought] = 0;
					format(string, sizeof(string), "You just sold %s's %s.", PlayerInfo[tempid[playerid]][name], VehicleInfo[vehicleID][name]);
					SendClientMessage(playerid, COLOR_ORANGE, string);
					format(string, sizeof(string), "Admin (%s) has just sold your %s!", PlayerInfo[playerid][name], VehicleInfo[vehicleID][name]);
                    SendClientMessage(tempid[playerid], COLOR_ORANGE, string);
					return 1;
				}
				else {
				    ResetOfflinePlayerFileV(VehicleInfo[vehicleID][owner]);
					format(string, sizeof(string), "You just sold %s's %s.", VehicleInfo[vehicleID][owner], VehicleInfo[vehicleID][name]);
					SendClientMessage(playerid, COLOR_ORANGE, string);
                    VehicleInfo[vehicleID][bought] = 0;
					strmid(VehicleInfo[vehicleID][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
					return 1;
				}
			}
			if(!fexist(file)) {
				format(string, sizeof(string), "You just sold %s's %s. The player file was not found and cannot be altered.", VehicleInfo[vehicleID][owner], VehicleInfo[vehicleID][name]);
				SendClientMessage(playerid, COLOR_GREEN, string);
                VehicleInfo[vehicleID][bought] = 0;
				strmid(VehicleInfo[vehicleID][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
				return 1;
			}
		}
		SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not a server administrator and cannot use this feature!");
		return 1;
}
	
stock setbuy(playerid)
{
        new string[256];
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(passenger[playerid] == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in the drivers seat to use this feature");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle in order to use this feature");
			return 1;
		}
		if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "This vehicle is already set as buyable!");
			return 1;
		}
   	    if (PlayerInfo[playerid][admin] > 0) {
   	        if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 1) {
   	        	format(string,sizeof(string),"You have set this %s to buyable!", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
   	        	SendClientMessage(playerid,COLOR_ORANGE,string);
				VehicleInfo[GetPlayerVehicleID(playerid)][buybar] = 0;
				return 1;
			}
		}
		SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not a server administrator and cannot use this feature!");
		return 1;
}
	
stock setunbuy(playerid)
{
        new string[256];
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(passenger[playerid] == 1) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in the drivers seat to use this feature");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 0) {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle in order to use this feature");
			return 1;
		}
		if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "This vehicle is already set as un-buyable!");
			return 1;
		}
   	    if (PlayerInfo[playerid][admin] > 0) {
   	    	VehicleInfo[GetPlayerVehicleID(playerid)][bought] = 0;
			VehicleInfo[GetPlayerVehicleID(playerid)][secure] = 0;
			VehicleInfo[GetPlayerVehicleID(playerid)][buybar] = 1;
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],DEFAULT_OWNER,false) == 0) {
                strmid(VehicleInfo[GetPlayerVehicleID(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
				format(string,sizeof(string),"You have set this %s to non-buyable!",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
 				SendClientMessage(playerid,COLOR_ORANGE,string);
				return 1;
			}
			new file[256];
			format(file,sizeof(file),P_FILE,VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
			if(fexist(file)) {
			    tempid[playerid] = IsPlayerNameOnline(VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
			    if(tempid[playerid] >= 0 || tempid[playerid] <= MAX_PLAYERS) {
			        strmid(VehicleInfo[GetPlayerVehicleID(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
					PlayerInfo[tempid[playerid]][vowned] = 0;
					PlayerInfo[tempid[playerid]][vowner] = 0;
					format(string, sizeof(string), "You just sold %s's %s and set it to non-buyable.", PlayerInfo[tempid[playerid]][name], VehicleInfo[GetPlayerVehicleID(playerid)][name]);
					SendClientMessage(playerid, COLOR_ORANGE, string);
					format(string, sizeof(string), "Admin (%s) has just sold your %s and set it to non-buyable!", PlayerInfo[playerid][name], VehicleInfo[GetPlayerVehicleID(playerid)][name]);
                    SendClientMessage(tempid[playerid], COLOR_ORANGE, string);
					return 1;
				}
				else {
				    ResetOfflinePlayerFileV(VehicleInfo[GetPlayerVehicleID(playerid)][owner]);
					format(string, sizeof(string), "You just sold %s's %s and set it to non-buyable.", VehicleInfo[GetPlayerVehicleID(playerid)][owner], VehicleInfo[GetPlayerVehicleID(playerid)][name]);
					SendClientMessage(playerid, COLOR_ORANGE, string);
					strmid(VehicleInfo[GetPlayerVehicleID(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
					return 1;
				}
			}
			if(!fexist(file)) {
				format(string, sizeof(string), "You just sold %s's %s and set it to non-buyable. The player file was not found and cannot be altered.", VehicleInfo[GetPlayerVehicleID(playerid)][owner], VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_ORANGE, string);
				strmid(VehicleInfo[GetPlayerVehicleID(playerid)][owner], DEFAULT_OWNER, 0, strlen(DEFAULT_OWNER), 255);
				return 1;
			}
		}
		SendClientMessage(playerid, COLOR_BRIGHTRED, "You are not a server administrator and cannot use this feature!");
		return 1;
}
	
stock lock(playerid)
{
		if(IsPlayerInAnyVehicle(playerid))
		{
		    new filename[256];
			format(filename, sizeof(filename), "%d", GetPlayerVehicleID(playerid));

			new State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COLOR_YELLOW,"You need to be in the drivers seat.");
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
			format(lockmess,sizeof(lockmess),"Your %s is now locked.",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
			SendClientMessage(playerid,COLOR_GREEN, lockmess);
			new Float:pX, Float:pY, Float:pZ;
			GetPlayerPos(playerid,pX,pY,pZ);
			PlayerPlaySound(playerid,1056,pX,pY,pZ);
		}
		else
		{
			SendClientMessage(playerid, COLOR_YELLOW, "You are not in a vehicle.");
		}
		return 1;
}


stock unlock(playerid)
{
		if(IsPlayerInAnyVehicle(playerid))
		{
		    new filename[256];
			format(filename, sizeof(filename), "%d", GetPlayerVehicleID(playerid));

			new State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COLOR_YELLOW, "You need to be in the drivers seat.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
			}
			format(lockmess,sizeof(lockmess),"Your %s is now unlocked.",VehicleInfo[GetPlayerVehicleID(playerid)][name]);
			SendClientMessage(playerid,COLOR_GREEN, lockmess);
			new Float:pX, Float:pY, Float:pZ;
			GetPlayerPos(playerid,pX,pY,pZ);
			PlayerPlaySound(playerid,1057,pX,pY,pZ);
		}
		else
		{
			SendClientMessage(playerid, COLOR_YELLOW, "You are not in a vehicle.");
		}
		return 1;
}
	
stock securekick(playerid)
{
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this feature");
		    return 1;
		}
  		if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 1) {
    		SendClientMessage(playerid, COLOR_BRIGHTRED, "This vehicle is un-buyable and these features will not work!");
			return 1;
    	}
		if(PlayerInfo[playerid][vowner] == 0) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "You must first own a vehicle before you can use this feature!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
				VehicleInfo[GetPlayerVehicleID(playerid)][secure] = 1;
				format(securemess,sizeof(securemess),"You have set your %s as secure, no other player will be able to use it even when you are offline.", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, securemess);
				return 1;
			}
			else {
				SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not own this vehicle and cannot secure it!");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle to use this feature");
			return 1;
		}
}
	
stock asecurekick(playerid)
{

	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if (PlayerInfo[playerid][admin] > 0) {
			if(IsPlayerInAnyVehicle(playerid)) {
				VehicleInfo[GetPlayerVehicleID(playerid)][asecure] = 1;
				format(securemess,sizeof(securemess),"You have set this %s as admin only.", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, securemess);
				return 1;
			}
			else {
				SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle to use this feature");
				return 1;
			}
		}
		else {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use this feature!");
			return 1;
		}
}
	
stock asecurekill(playerid)
{
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)) {
            if (PlayerInfo[playerid][admin] > 0) {
				VehicleInfo[GetPlayerVehicleID(playerid)][asecure] = 2;
				format(securemess,sizeof(securemess),"You have set this %s as admin only with lethal protection.", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, securemess);
				return 1;
			}
			else {
				SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use this feature!");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle to use this feature");
			return 1;
		}
}

stock aunsecure(playerid)
{
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)) {
            if (PlayerInfo[playerid][admin] > 0) {
                VehicleInfo[GetPlayerVehicleID(playerid)][asecure] = 0;
				format(securemess,sizeof(securemess),"You have set this %s as accessable to everyone.", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, securemess);
				return 1;
			}
			else {
				SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not have permission to use this feature!");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle to use this feature");
			return 1;
		}
}
	
stock unsecure(playerid)
{
        if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this feature");
		    return 1;
		}
  		if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 1) {
    		SendClientMessage(playerid, COLOR_BRIGHTRED, "This vehicle is un-buyable and these features will not work!");
			return 1;
    	}
		if(PlayerInfo[playerid][vowner] == 0) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "You must first own a vehicle before you can use this feature!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
				VehicleInfo[GetPlayerVehicleID(playerid)][secure] = 0;
				format(securemess,sizeof(securemess),"You have set your %s as accessable to everyone.", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, securemess);
				return 1;
			}
			else {
			    SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not own this vehicle and cannot secure it!");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle to use this feature");
			return 1;
		}
}

stock securekill(playerid)
{
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this feature");
		    return 1;
		}
  		if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 1) {
    		SendClientMessage(playerid, COLOR_BRIGHTRED, "This vehicle is un-buyable and these features will not work!");
			return 1;
    	}
		if(PlayerInfo[playerid][vowner] == 0) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "You must first own a vehicle before you can use this feature!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
				VehicleInfo[GetPlayerVehicleID(playerid)][secure] = 2;
				format(securemess,sizeof(securemess),"You have set your %s as secure with lethal protection, no other player will be able to use it even when you are offline.", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, securemess);
				return 1;
			}
			else {
				SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not own this vehicle and cannot secure it!");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle to use this feature");
			return 1;
		}
}
	
stock callcar(playerid)
{
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this feature");
		    return 1;
		}
		if(PlayerInterior[playerid] > 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must outside to call a vehicle to you!");
			return 1;
		}
		if(PlayerInfo[playerid][vowner] == 0) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "You must first own a vehicle before you can use this feature!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 1) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "You can't call a vehicle to you if you are in one!");
			return 1;
		}
		if(VehicleInfo[PlayerInfo[playerid][vowned]][modding] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "Vehicle currently Busy, try again in a few seconds!");
			return 1;
		}
   		for(new i=0; i < MAX_PLAYERS; i++) {
			if (IsPlayerConnected(i) == 1) {
				if (IsPlayerInAnyVehicle(i) == 1) {
					if (GetPlayerVehicleID(i) == PlayerInfo[playerid][vowned]) {
					    if(GetPlayerInterior(i) == 1) {
					        SendClientMessage(playerid, COLOR_BRIGHTRED, "Vehicle currently Busy, try again in a few seconds!");
							return 1;
					    }
						SendClientMessage(i, COLOR_BRIGHTRED, "This vehicle has been recalled by its owner, enjoy the walk!");
					}
				}
			}
		}
		SendClientMessage(playerid, COLOR_ORANGE, "Your vehicle is on its way, It will take about 5 seconds to get to you...");
		SetVehicleToRespawn(PlayerInfo[playerid][vowned]);
		SetVehicleVirtualWorld(PlayerInfo[playerid][vowned],10);
		SetTimerEx("CallVehicleToPlayer",5000,0,"i",playerid);
		return 1;
}
	
stock park(playerid)
{
	    if(PlayerInfo[playerid][logged] == 0) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be logged in to use this feature");
		    return 1;
		}
		if(PlayerInfo[playerid][jailed] == 1) {
		    SendClientMessage(playerid, COLOR_BRIGHTRED, "You are in jail and cannot use this feature");
		    return 1;
		}
  		if(VehicleInfo[GetPlayerVehicleID(playerid)][buybar] == 1) {
    		SendClientMessage(playerid, COLOR_BRIGHTRED, "This vehicle is un-buyable and these features will not work!");
			return 1;
    	}
		if(PlayerInfo[playerid][vowner] == 0) {
            SendClientMessage(playerid, COLOR_BRIGHTRED, "You must first own a vehicle before you can use this feature!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)) {
    	    if (strcmp(VehicleInfo[GetPlayerVehicleID(playerid)][owner],PlayerInfo[playerid][name],false) == 0) {
				new Float:spx,Float:spy,Float:spz;
                new Float:spa;
                GetVehiclePos(GetPlayerVehicleID(playerid),spx,spy,spz);
                GetVehicleZAngle(GetPlayerVehicleID(playerid),spa);
                VehicleInfo[GetPlayerVehicleID(playerid)][x_spawn] = spx;
				VehicleInfo[GetPlayerVehicleID(playerid)][y_spawn] = spy;
				VehicleInfo[GetPlayerVehicleID(playerid)][z_spawn] = spz;
				VehicleInfo[GetPlayerVehicleID(playerid)][za_spawn] = spa;
				format(securemess,sizeof(securemess),"You have just parked your %s at your current location...it will respawn here in future!", VehicleInfo[GetPlayerVehicleID(playerid)][name]);
				SendClientMessage(playerid, COLOR_GREEN, securemess);
				return 1;
			}
			else {
				SendClientMessage(playerid, COLOR_BRIGHTRED, "You do not own this vehicle and cannot park it!");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_BRIGHTRED, "You must be in a vehicle to use this feature");
			return 1;
		}
}

stock refuel(playerid)
{
       if(CloseToGas(playerid) != 999 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	   {
	   	   if(GetPlayerMoney(playerid) >= 20)
	   	   {
             SendClientMessage(playerid,COLOR_YELLOW,"Your vehicle is being refuelled. Please wait for confirmation that your tank is full...");
			 Filling[playerid] = 1;
			 return 1;
		   }
		   if(GetPlayerMoney(playerid) <= 2) {
		    SendClientMessage(playerid,COLOR_BRIGHTRED,"You do not have enough money to use this fuel refill point!");
		    Filling[playerid] = 0;
		    return 1;
		   }

	   }
	   else {
	        SendClientMessage(playerid,COLOR_BRIGHTRED,"You must be driving a vehicle and also near to a refuelling icon to use this feature!");
            SendClientMessage(playerid,COLOR_BRIGHTRED,"These can be found in all Gas Stations or within any airport in San Andreas.");
            SendClientMessage(playerid,COLOR_BRIGHTRED,"Fuel Stations locations are given by the grey vehicle icons on your minimap radar.");
	   }
      return 1;
}
     
stock dashboardon(playerid)
{
	for(new d=0; d<3; d++) {
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == pbike[d][0]) {
			speedo[playerid] = 2;
		}
		else {
		    speedo[playerid] = 1;
		}
	}
	SendClientMessage(playerid,COLOR_GREEN,"Your dashboard display is now switched ON!");
	return 1;
}

stock dashboardoff(playerid)
{
	speedo[playerid] = 0;
	SendClientMessage(playerid,COLOR_BRIGHTRED,"Your dashboard display is now switched OFF!");
	return 1;
}
