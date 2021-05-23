//-------------------------------------------------------------------------------------------
//
//|Game Mode														|
//|                       Servidor BRASIL Las Venturas							|
//|             GangZonas                  Stunts          MoneyGrub				|
//| Varios Comandos             4FUN                 ~  o Mais Perfeito GM Atual		|
//|															|
//|Desenvolvido por:												|
//|     Kaike          Devil           [AP]BcO          BnO   [RockstaR]Rell e IlusIOn	|
//|															|
//|Msn para Contato:												|
//|Kaike: kaiki.louco@hotmail.com										|
//|Devil: devil_fodao@hotmail.com										|
//|[AP]BcO: x-bcox@hotmail.com											|
//|BnO: ***Msn não pode ser divulgado***									|
//|[RockstaR]Rell: ***Msn não pode ser divulgado***							|
//|ILusIOn: ***Msn não pode ser divulgado***								|
//
//-----------------------------------------------------------------------------------------

#include <a_samp>
#include <dutils>
#include <dudb>
#include <core>
#include <float>
#include <Y_Objects>

#pragma dynamic 145000
#pragma tabsize 0
#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1
#define COLOR_SYSTEM 0xEFEFF7AA


#define COLOR_GREY	0xAFAFAFAA
#define COLOR_GREEN	0x33AA33AA
#define COLOR_RED	0xAA3333AA
#define Bisque	0xFFE4C4AA
#define Amarelo	0xFFFF00AA
#define COLOR_NOVO	0x33CCFFAA
#define COLOR_YELLOW	0xFFFF00AA
#define COLOR_WHITE	0xFFFFFFAA
#define COLOR_BLUE	0x0000BBAA
#define COLOR_GREEN_MC	0xADFF2FAA
#define COLOR_LIGHTBLUE	0x33CCFFAA
#define COLOR_ORANGE	0xFF9900AA
#define COLOR_LIMON	0x33FF33AA
#define COLOR_GREY	0xAFAFAFAA
#define COLOR_GREEN	0x33AA33AA
#define COLOR_RED	0xAA3333AA
#define COLOR_YELLOW	0xFFFF00AA
#define COLOR_WHITE	0xFFFFFFAA
#define COLOR_BLUE	0x0000BBAA
#define COLOR_LIGHTBLUE	0x33CCFFAA
#define COR_ROSA	0xFF66FFAA
#define COLOR_ORANGE	0xFF9900AA
#define COLOR_GREY	0xAFAFAFAA
#define COLOR_GREEN	0x33AA33AA
#define COLOR_RED	0xAA3333AA
#define COLOR_YELLOW	0xFFFF00AA
#define COLOR_WHITE	0xFFFFFFAA
#define COLOR_RED	0xAA3333AA
#define COLOR_GREY	0xAFAFAFAA
#define COLOR_GREEN	0x33AA33AA
#define COLOR_YELLOW	0xFFFF00AA
#define COLOR_WHITE	0xFFFFFFAA
#define COLOR_BLUE	0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE	0xFF9900AA
#define COLOR_LIME 	0x10F441AA
#define COLOR_MAGENTA 	0xFF00FFFF
#define COLOR_NAVY 	0x000080AA
#define COLOR_AQUA 	0xF0F8FFAA
#define COLOR_CRIMSON 	0xDC143CAA
#define COLOR_FLBLUE 	0x6495EDAA
#define COLOR_BISQUE 	0xFFE4C4AA
#define COLOR_BLACK 	0x000000AA
#define COLOR_CHARTREUSE	0x7FFF00AA
#define COLOR_BROWN 	0xA52A2AAA
#define COLOR_CORAL 	0xFF7F50AA
#define COLOR_GOLD 	0xB8860BAA
#define COLOR_COP		0x3C26C7AA
#define COLOR_GREENYELLOW 0xADFF2FAA
#define COLOR_INDIGO 	0x4B00B0AA
#define COLOR_IVORY 	0xFFFF82AA
#define COLOR_LAWNGREEN 	0x7CFC00AA
#define COLOR_LIMEGREEN 	0x32CD32AA
#define COLOR_MIDNIGHTBLUE 0x191970AA
#define COLOR_MAROON 	0x800000AA
#define COLOR_OLIVE 	0x808000AA
#define COLOR_ORANGERED 0xFF4500AA
#define Pink 	0xFF66FFAA
#define COLOR_SPRINGGREEN 	0x00FF7FAA
#define COLOR_TOMATO	 0xFF6347AA
#define COLOR_YELLOWGREEN 	0xFFFF00AA
#define COLOR_MEDIUMAQUA 	0x83BFBFAA
#define COLOR_MEDIUMMAGENTA 	0x8B008BAA
#define COLOR_BRIGHTRED 	0xDC143CAA
#define COLOR_SYSTEM 	0xEFEFF7AA
#define COLOR_PURPLE 	0x330066AA
#define red 0xFF0000AA


#define PocketMoney 30000  
#define INACTIVE_PLAYER_ID 255
#define GIVECASH_DELAY 5000 
#define TEAM_COPS 21



#define WEAPON_SLOTS	13
#define INVALID_PICKUP	-1
#define MAX_PICKUPS	90
#define PICKUP_TYPE	19



#pragma tabsize 0
#define NUMVALUES 4

#define CP_BANK 	0
#define CP_PIRATE 	1
#define CP_AMMU     2
#define CP_DRAGON   3
#define CP_SEXSHOP  4
#define CP_BAR      5
#define CP_CALIGULA 6
#define CP_ZIP      7
#define CP_BINCO    8
#define CP_TATOO    9
#define CP_BOTIQUE  10

#define CP_GZ_AUTOBASE_LV	11
#define CP_GZ_CONSTRUCAO_LV	12
#define CP_GZ_RECINTO_LV	13
#define CP_GZ_FABRICA_LV	14
#define CP_GZ_AEROPLACE_LV    15
#define CP_GZ_DISNEY_LV   	16
#define CP_GZ_EXERCITO_LV	17
#define CP_GZ_CALIGULAS_LV	18
#define CP_GZ_GOLF_LV		19
#define CP_GZ_LV			20

#define P_DRAGON    0
#define P_SEXSHOP   1
#define P_BAR       2
#define P_CALIGULA  3
#define P_ZIP       4
#define P_BINCO     5
#define P_TATOO     6
#define P_BOTIQUE   7

#define P_GZ_AUTOBASE_LV	8
#define P_GZ_CONSTRUCAO_LV	9
#define P_GZ_RECINTO_LV      10
#define P_GZ_FABRICA_LV		11
#define P_GZ_AEROPLACE_LV     12
#define P_GZ_DISNEY_LV     	13
#define P_GZ_EXERCITO_LV     	14
#define P_GZ_CALIGULAS_LV	15
#define P_GZ_GOLF_LV          16
#define P_GZ_LV               17

#define P_OFFSET	14
#define MAX_GZS	10

forward DestroyPickupEx( p );
forward PayPlayerInGz(playerID, GzID, Float:x1, Float:y1, Float:x2, Float:y2, cash);
forward GzScoreUpdate();
forward BancoDeposito(playerid, moneys);
forward BancoSaca(playerid, moneys);
forward ArmasRespawn(playerid, weaponid);
forward FixHour(hour);
forward RandomMSGs();
forward PayDay();
forward Givecashdelaytimer(playerid);
forward GrubModeReset();
forward SetPlayerRandomSpawn(playerid);
forward SetupPlayerForClassSelection(playerid);
forward GameModeExitFunc();
forward PlayerLeaveGang(playerid);
forward getCheckpointType(playerID);
forward isPlayerInArea(playerID, Float:data[4]);
forward PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash);
forward TimeUpdate();
forward PirateShipScoreUpdate();
forward SystemMsg(playerid,msg[]);
forward checkpointUpdate();
forward PropertyScoreUpdate();
forward SavedUpdate();
forward SendPlayerFormattedText(playerid, const str[], define);
forward SendAllFormattedText(playerid, const str[], define);
forward UpperToLower(text[]);
forward VisibilityUpdate();

enum pickup
{
	creation_time,
	weapon,
	ammo,
	timer
}

new portao2;
new portao;
new timeshift = 0;
new shifthour;
new gTeam[MAX_PLAYERS];
new Arena[MAX_PLAYERS];//1-

new CashScoreOld;
new iSpawnSet[MAX_PLAYERS];
new bank[MAX_PLAYERS];
new bounty[MAX_PLAYERS];
new playerCheckpoint[MAX_PLAYERS];
new gambleWarning[MAX_PLAYERS];
new savePos;
new PLAYERLIST_authed[MAX_PLAYERS];
new wybor[MAX_PLAYERS];
new veiculo[MAX_VEHICLES];


new Menu:respawnGun;
new Menu:respawnPistolas;
new Menu:respawnMicroSMGs;
new Menu:respawnShotguns;
new Menu:respawnSMG;
new Menu:respawnRifles;
new Menu:respawnAssalto;
new Menu:respawnUltilitarios;

new status[MAX_PLAYERS][3];
new vSaldo[1];

new Menu:banco;
new Menu:bancoAcao;
new Menu:bancoDepositar;
new Menu:bancoSacar;
new Menu:bancoSaldo;

new gate2;
new gate1;
new gz = 555;
new GZ[MAX_GZS];
new GZ_EXISTE[MAX_GZS][2];
new gangZonaId[MAX_GZS];
new gangZonaIdAnter[MAX_GZS];

new MSGs[1][256] = {
"SERVER: Para Ver os Criadores desta GameMode(GM) Digite: /creditos"

};

new COLORS[] = {
COLOR_WHITE,
COLOR_RED,
COLOR_BLUE,
COLOR_GREEN,
COLOR_YELLOW,
COLOR_MEDIUMAQUA,
COLOR_LIGHTBLUE,
COLOR_CRIMSON,
COLOR_BRIGHTRED,
COLOR_AQUA,
COLOR_ORANGE,
COLOR_MIDNIGHTBLUE,
COLOR_LIMEGREEN
};

new Float:gRandomPlayerSpawns[5][3] = {
{2297.0002,2451.8662,10.8203},
{2296.7415,2467.9626,10.8203},
{2001.6642,1543.9481,13.5859},
{1956.6538,1342.6417,15.3746},
{2024.8113,1007.8333,10.8203}
};

new Float:gCopPlayerSpawns[2][3] = {
{2297.1064,2452.0115,10.8203},
{2297.0452,2468.6743,10.8203}
};

#define MAX_POINTS 21

new Float:checkCoords[MAX_POINTS][4] = {
{-36.5483,-57.9948, -17.2655,-49.2967},     
{1894.6128,1445.3431, 2084.9739,1637.8186}, 
{284.0546,-86.4384, 302.9315,-56.6674},    
{1925.1511,968.2358, 2019.0715,1067.4276},  
{-115.9544,-24.2706, -99.1631,-7.1391},    
{487.6558,-88.5900, 512.0635, -67.7503},    
{2216.7971,1638.0493, 2255.2097,1714.0806},
{144.9131,-96.0927, 177.4128,-70.7923},    	
{201.4462,-112.4556, 218.5237,-95.1238},   
{-204.7623,-44.0326, -200.2330,-39.8128},  
{416.7485,-84.4242, 422.6890,-74.0611},    
{1017.134948, 1222.946899, 1096.891235, 1361.736572},		//GZ_AUTOBASE_LV
{2372.279052, 1832.521362, 2496.685302, 1962.471801},		//GZ_CONSTRUCAO_LV
{2777.4753, 833.6251, 2894.6955, 1022.9479},			//GZ_RECINTO_LV
{918.294555, 2043.856567, 996.507202, 2182.339599},		//GZ_FABRICA_LV
{1638.5530,1284.3757, 1716.3368,1319.3700},			//GZ_AEROPLACE
{2079.743,978.1417, 2329.653,1171.545}, 
{81.74512,1763.359, 362.0141,2055.306},				//GZ_EXERCITO
{2099.267,1535.143, 2290.605,1728.547},				//GZ_CALIGULAS_LV
{1111.341,2718.771, 1509.635,2842.55},				//GZ_GOLF_LV
{2267.176, 2235.263, 2403.845, 2409.326}				//GZ_LV_
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
{418.5547,-80.1667,1001.8047},
{1040.142578,1305.848266,10.820312},		//GZ_AUTOBASE_LV
{2436.580322,1913.306274,6.163729},			//GZ_CONSTRUCAO_LV
{2814.641357,969.982727,10.750000},			//GZ_RECINTO_LV
{929.612487,2068.309570,10.820312},			//GZ_FABRICA_LV
{1647.4393,1301.9464,10.8203}, 			//GZ_AEROPLACE
{2273.6250,1044.2716,10.8203},			//GZ_DISNEY
{202.9969,1888.7633,17.6481},				//GZ_EXERCITO
{2288.2988,1567.0795,10.8203},			//GZ_CALIGULAS_LV
{1457.4954,2773.3105,10.8203},			//GZ_GOLF_LV
{2360.7122,2377.4851,10.8203}				//GZ_LV_
};


new playerColors[100] = {
0xFF8C13AA,0xC715FFAA,0x20B2AAAA,0xDC143CAA,0x6495EDAA,0xf0e68cAA,0x778899AA,0xFF1493AA,0xF4A460AA,0xEE82EEAA,0xFFD720AA,
0x8b4513AA,0x4949A0AA,0x148b8bAA,0x14ff7fAA,0x556b2fAA,0x0FD9FAAA,0x10DC29AA,0x534081AA,0x0495CDAA,0xEF6CE8AA,0xBD34DAAA,
0x247C1BAA,0x0C8E5DAA,0x635B03AA,0xCB7ED3AA,0x65ADEBAA,0x5C1ACCAA,0xF2F853AA,0x11F891AA,0x7B39AAAA,0x53EB10AA,0x54137DAA,
0x275222AA,0xF09F5BAA,0x3D0A4FAA,0x22F767AA,0xD63034AA,0x9A6980AA,0xDFB935AA,0x3793FAAA,0x90239DAA,0xE9AB2FAA,0xAF2FF3AA,
0x057F94AA,0xB98519AA,0x388EEAAA,0x028151AA,0xA55043AA,0x0DE018AA,0x93AB1CAA,0x95BAF0AA,0x369976AA,0x18F71FAA,0x4B8987AA,
0x491B9EAA,0x829DC7AA,0xBCE635AA,0xCEA6DFAA,0x20D4ADAA,0x2D74FDAA,0x3C1C0DAA,0x12D6D4AA,0x48C000AA,0x2A51E2AA,0xE3AC12AA,
0xFC42A8AA,0x2FC827AA,0x1A30BFAA,0xB740C2AA,0x42ACF5AA,0x2FD9DEAA,0xFAFB71AA,0x05D1CDAA,0xC471BDAA,0x94436EAA,0xC1F7ECAA,
0xCE79EEAA,0xBD1EF2AA,0x93B7E4AA,0x3214AAAA,0x184D3BAA,0xAE4B99AA,0x7E49D7AA,0x4C436EAA,0xFA24CCAA,0xCE76BEAA,0xA04E0AAA,
0x9F945CAA,0xDCDE3DAA,0x10C9C5AA,0x70524DAA,0x0BE472AA,0x8A2CD7AA,0x6152C2AA,0xCF72A9AA,0xE59338AA,0xEEDC2DAA,0xD8C762AA,
0x3FE65CAA
};

new vehName[][] ={
"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster",
"Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulancia","Leviathan","Moonbeam","Esperanto",
"Taxi","Washington","Bobcat","Mr Whoopee","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee",
"Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo",
"RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer",
"Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer",
"PCJ-600","Faggio","Freeway","RC Baron","RC Raider","Glendale","Oceanic","Sanchez","Sparrow","Patriot",
"Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR3 50","Walton","Regina","Comet","BMX",
"Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo",
"Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Maverick Policial","Boxville","Benson","Mesa",
"RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT","Elegant",
"Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain","Nebula","Majestic",
"Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona",
"FBI Truck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight",
"Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob",
"Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A","Monster B","Uranus",
"Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight",
"Trailer","Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford",
"BF-400","Newsvan","Tug","Trailer A","Emperor","Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C",
"Andromada","Dodo","RC Cam","Launch","Carro Policial(LSPD)","Carro Policial (SFPD)","Carro Policial","Police Ranger",
"Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B",
"Stair Trailer","Boxville","Farm Plow","Utility Trailer" };

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
	CP_BOTIQUE,
	CP_GZ_AUTOBASE_LV,
	CP_GZ_CONSTRUCAO_LV,
	CP_GZ_RECINTO_LV,
	CP_GZ_FABRICA_LV,
	CP_GZ_AEROPLACE_LV,
	CP_GZ_DISNEY_LV,
	CP_GZ_EXERCITO_LV,
	CP_GZ_CALIGULAS_LV,
	CP_GZ_GOLF_LV,
	CP_GZ_LV
};

#define MAX_PROPERTIES 18

new propertyNames[MAX_PROPERTIES][32] = {
	"Four Dragons",
	"Sex Shop",
	"Shithole Bar",
	"Caligula",
	"Zip Shop",
	"Binco Shop",
	"Tatoo Parlor",
	"Botique",
	"Gang Zona Auto Base",
	"Gang Zona Construção",
	"Gang Zona Recinto",
	"Gang Zona Fabrica",
	"Gang Zona Aero Place",
	"Gang Zona Disney",
	"Gang Zona Exercito",
	"Gang Zona Caligulas",
	"Gang Zona Golf",
	"Gang Zona Bairro Policial"
};

new propertyValues[MAX_PROPERTIES] = {
	75000,
	25000,
	20000,
	100000,
	15000,
	15000,
	10000,
	20000,
	185000,
	175000,
	200000,
	250000,
	190000,
	270000,
	180000,
	210000,
	190000,
	190000
};

new propertyEarnings[MAX_PROPERTIES] = {
	5000,
	2000,
	1500,
	7000,
	1000,
	1000,
	700,
	1500,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
};

new propertyOwner[MAX_PROPERTIES] = {999,999,999,999,999,999,999,999,999,999,999,999,999,999,999,999,999};

#define MAX_WEAPONS 17
new weaponNames[MAX_WEAPONS][32] = {
	"9 mm",
	"9 mm Silenciada",
	"Desert Eagle",
	"Shotgun",
	"Sawn-off Shotgun",
	"Combat Shotgun",
	"Tec9",
	"Micro SMG",
	"MP5",
	"AK47",
	"M4",
	"Rifle",
	"Sniper Rifle",
	"Granada",
	"Motoserra",
	"Katana",
	"Lata de Spray"
};
new weaponIDs[MAX_WEAPONS] = {
	22,   
	23,     
	24,  
	25,    
	26,     
	27,     
	32,    
	28,     
	29,    
	30,    
	31,    
	33,    
	34,  
	16,   
	9,    
	8,      
 	41    
};
new weaponCost[MAX_WEAPONS] = {
	5000,     
	5000,   
	10000,    
	25000,    
	55000,    
	75000,    
	70000,  
	60000,   
	75000,    
	150000,    
	200000,  
	75000,    
	120000,   
	75000,    
	35000,   
	5000,     
 	25000    
};
new weaponAmmo[MAX_WEAPONS] = {
	300,      
	300,      
	300,    
	100,      
	100,      
	100,     
	1000,     
	1000,     
	1000,    
	1000,   
	1000,     
	300,    
	300,      
	10,      
	1,       
	1,       
 	500      
};
new playerWeapons[MAX_PLAYERS][MAX_WEAPONS];

#define MAX_SAVE 644
new savedInfo[MAX_SAVE][4];
new savedNames[MAX_SAVE][MAX_PLAYER_NAME];
new savedWeapons[MAX_SAVE][MAX_WEAPONS];


#define MAX_GANGS           40
#define MAX_GANG_MEMBERS    12
#define MAX_GANG_NAME       40
new gangMembers[MAX_GANGS][MAX_GANG_MEMBERS];
new gangNames[MAX_GANGS][MAX_GANG_NAME];
new gangInfo[MAX_GANGS][3]; 
new gangBank[MAX_GANGS];
new playerGang[MAX_PLAYERS];
new gangInvite[MAX_PLAYERS];
new gangConta[MAX_GANGS];

new gActivePlayers[MAX_PLAYERS];
new gLastGaveCash[MAX_PLAYERS];

main()
{
		print("\n----------------------------------");
		print("  Servidor BRASIL LVDM 9.0d              \n");
		print("  Desenvolvido por: Kaike, Devil, [AP]BcO, BnO, [Rockstar]Rell e IlusIon    ");
		print("----------------------------------\n");
}

public PlayerLeaveGang(playerid) {
	new string[256];
	new playername[MAX_PLAYER_NAME];
	new gangnum = playerGang[playerid];

    if(gangnum > 0) {
		for(new i = 0; i < gangInfo[gangnum][1]; i++) {
			if(gangMembers[gangnum][i]==playerid) {

			    gangInfo[gangnum][1]--;

      		    for(new j = i; j < gangInfo[gangnum][1]; j++) {
				    gangMembers[gangnum][j]=gangMembers[gangnum][j+1];
	    		}

			    if(gangInfo[gangnum][1]<1) {
			        gangInfo[gangnum][0]=0;
			        gangInfo[gangnum][1]=0;
			        gangBank[gangnum]=0;
       			}

				for(new j = 0; j < gangInfo[gangnum][1]; j++) {
				    GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
					format(string, sizeof(string),"%s Saiu da sua gang.", playername);
					SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
				}

				format(string, sizeof(string),"Você saiu da gang '%s' (id: %d)", gangNames[gangnum], gangnum);
				SendClientMessage(playerid, COLOR_ORANGE, string);

				playerGang[playerid]=0;

				SetPlayerColor(playerid,playerColors[playerid]);

				return;
			}
		}
	} else {
		SendClientMessage(playerid, COLOR_RED, "Você não pode entrar na gang.");
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

public PirateShipScoreUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		PayPlayerInArea(i, 1995.5, 1518.0, 2006.0, 1569.0, 100);
//		{
//            SendClientMessage(i, COLOR_YELLOW, "[INFO]Você esta ganhando dinheiro por estar na area de dinheiro.");
//		}
	}
}

public PayPlayerInGz(playerID, GzID, Float:x1, Float:y1, Float:x2, Float:y2, cash) //ID_GZ
{

	if(IsPlayerConnected(playerID))
	{
		new Float:X, Float:Y, Float:Z, Float:Health, Float:Armour;
//		new GzIdx = gangZonaId[GzID];

		GetPlayerPos(playerID, X, Y, Z);
		GetPlayerHealth(playerID,Health);
		GetPlayerArmour(playerID,Armour);

		if((X >= x1) && (X <= x2) && (Y >= y1) && (Y <= y2))
		{
			if(playerGang[playerID] > 0)
			{
//				for(new i = 0 ; i < gangInfo[GzIdx][1]; i++)
//				{
//					if(gangMembers[GzIdx][i] == playerID)
//					{
					if(gangZonaId[GzID] == playerGang[playerID])
					{
						GivePlayerMoney(playerID, cash);

						if(Health < 105)
						{
							SetPlayerHealth(playerID,Health + 2);
						}
					    if(Armour< 105)
					    {
						    SetPlayerArmour(playerID,Armour + 2);
					    }
					}
					else
					{
						if(GZ_EXISTE[GzID][0] == 1)
						{
							if(Health > 2)
							{
								SetPlayerHealth(playerID,Health - 2.5);
							}
						}
						else
						{
							return 1;
						}
					}
//				}
			}
			else
			{
				if(GZ_EXISTE[GzID][0] == 1)
				{
					if(Health > 2)
					{
						SetPlayerHealth(playerID,Health - 2.5);
					}
				}
				else
				{
					return 1;
				}
			}
		}
		return 1;
	}
	return 0;
}

public GzScoreUpdate()
{
	for(new i = 0 ; i < MAX_PLAYERS ; i++)
	{
		// GZ AUTOBASE_LV
		PayPlayerInGz(i, 0, 1017.134948, 1222.946899, 1096.891235, 1361.736572, 500);
		// GZ CONSTRUCAO_LV
		PayPlayerInGz(i, 1, 2372.279052, 1832.521362, 2496.685302, 1962.471801, 500);
		// GZ RECINTO_LV
		PayPlayerInGz(i, 2, 2777.4753, 833.6251, 2894.6955, 1022.9479, 500);
		// GZ FABRICA_LV
		PayPlayerInGz(i, 3, 918.294555, 2043.856567, 996.507202, 2182.339599, 500);
		// GZ AEROPLACE_LV
		PayPlayerInGz(i, 4, 1638.5530, 1284.3757, 1716.3368, 1319.3700, 500);
		// GZ Disney_LV
		PayPlayerInGz(i, 5, 2079.743, 978.1417, 2329.653, 1171.545, 500);
		// GZ_EXERCITO_LV
		PayPlayerInGz(i, 6, 81.74512, 1763.359, 362.0141, 2055.306, 500);
		// GZ CALIGULAS_LV
		PayPlayerInGz(i, 7, 2099.267, 1535.143, 2290.605, 1728.547, 500);
		//GZ GOLF_LV
		PayPlayerInGz(i, 8, 1111.341, 2718.771, 1509.635, 2842.55, 500);
		//GZ_LV_
		PayPlayerInGz(i, 9, 2267.176, 2235.263, 2403.845, 2409.326, 500);
	}
	return 1;
}

public SystemMsg(playerid,msg[]) {
if ((IsPlayerConnected(playerid))&&(strlen(msg)>0)) {
SendClientMessage(playerid,COLOR_SYSTEM,msg);
}
return 1;
}

stock PlayerName(playerid) {
  new name[255];
  GetPlayerName(playerid, name, 255);
  return name;
}

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

			GivePlayerMoney(owners[i], payments[i]);
		}
	}

}

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


public OnPlayerConnect(playerid)
{

	new Text: gText2;
    gText2 = TextDrawCreate(0.0, 435, "~g~Las Venturas ~y~BRASIL>>The Best                           ~r~Bom Jogo"); //Texto
    TextDrawFont(gText2,1); //Fonte do texto
    TextDrawShowForPlayer(playerid, gText2);
    
    SetPlayerColor(playerid, playerColors[playerid]);

new pName[30], string[256];
GetPlayerName(playerid, pName, 30);
format(string, 256, "' %s '< entrou no Servidor BRASIL!", pName);
SendClientMessageToAll(COLOR_AQUA ,string);
SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);

    SetPlayerMapIcon(playerid, 1, 2204.9468, 1986.2877, 16.7380, 52, 0);
    SetPlayerMapIcon(playerid, 2, 2001.7767, 1544.4070, 13.5859, 9, 0 );
    SetPlayerMapIcon(playerid, 3, 1075.371582, 1280.496582, 10.820312, 60, 0); 
    SetPlayerMapIcon(playerid, 4, 2413.396240, 1918.921020, 6.015625, 61, 0);
    SetPlayerMapIcon(playerid, 5, 2825.226806, 920.533508, 10.750000, 62, 0); 
    SetPlayerMapIcon(playerid, 6, 966.946411, 2127.851562, 10.820312, 58, 0);
    SetPlayerMapIcon(playerid, 7, 1693.910156, 1302.059936, 10.992187, 59, 0); 
    SetPlayerMapIcon(playerid, 8, 2190.0759, 1084.1327, 10.3685, 60, 0); 
    SetPlayerMapIcon(playerid, 9, 1457.4954, 2773.3105, 10.8203, 61, 0); 
    SetPlayerMapIcon(playerid, 10, 1581.8119,-1619.5752,13.3828,30,0); 
    SetPlayerMapIcon(playerid, 11, -1605.0022,666.8316,6.8671,30,0);
    SetPlayerMapIcon(playerid, 12, 2277.0066,2452.1272,10.8203,30,0); 
    SetPlayerMapIcon(playerid, 13, 308.1129,1905.0140,17.2027,58,0); 
    SetPlayerMapIcon(playerid, 14, 2104.9248,2249.4177,10.6952,52,0); 
    SetPlayerMapIcon(playerid, 15, 2187.0225,1674.5431,10.7696,59,0); 
    SetPlayerMapIcon(playerid, 16, 1978.3699,1018.3140,994.4688,44,0); 
    SetPlayerMapIcon(playerid, 17, 2195.8232,2467.2454,10.8203,55,0); // posto 55
    SetPlayerMapIcon(playerid, 18, 1361.7360,1292.1801,10.8203,5,0); // aero 5
    SetPlayerMapIcon(playerid, 19, 2095.8972,1230.7101,28.8371,22,0); // hospital 22
    SetPlayerMapIcon(playerid, 20, 2114.0867,1464.4681,31.1663,25,0); // mafia 
    SetPlayerMapIcon(playerid, 21, 2256.9023,2057.2332,10.8203,23,0); // 
    SetPlayerMapIcon(playerid, 22, 1974.0455,2444.4832,11.1782,53,0);
    SetPlayerMapIcon(playerid, 23 ,2336.5977,2321.4211,10.5224,59,0);
    PlayerPlaySound(playerid,1097, 0.0, 0.0, 0.0);

	SendClientMessage(playerid, COLOR_WHITE,"--------------------------------------------------------------------------------");
    SendClientMessage(playerid, 0x33CCFFAA, "--> Las Venturas BRASIL ~ O melhor GameMode do Brasil <-- ");
	GameTextForPlayer(playerid,"~w~Seja Bem-Vindo ~b~Ao ~g~Las VEnturas BRASIL!",5000,5);
    SendClientMessage(playerid, COR_ROSA,"Para Obter Uma ajuda digite: /ajuda ");
	SendClientMessage(playerid,COLOR_LIGHTBLUE,"Afim de Uma Grana FACIL?Va ate o Barco Pirata e ganhe muita Grana por la! ");
    SendClientMessage(playerid,COLOR_GREEN,"Compre GangZonas com sua gang, para ver os comandos da gang digite: /gang ");
    SendClientMessage(playerid, COR_ROSA,"Duvidas, Sugestoes, Reclamações, Va ate Nossa comunidade e comente!");
	SendClientMessage(playerid,COLOR_ORANGE,"Las Venturas BRASIL: Para Ver os desenvolvedores deste GameMode(GM) digite: /creditos");
	SendClientMessage(playerid,COLOR_RED,"Tenha um Otimo Jogo!");
		SendClientMessage(playerid, COLOR_WHITE,"--------------------------------------------------------------------------------");
	gActivePlayers[playerid]++;
	gLastGaveCash[playerid] = GetTickCount();

	playerCheckpoint[playerid]=999;
	bank[playerid]=0;
	playerGang[playerid]=0;
	gangInvite[playerid]=0;

	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));


	for(new g = 0 ; g < MAX_GZS ; g++)
	{
		if(GZ_EXISTE[g][0] == 1)
	    {
			GangZoneShowForPlayer(playerid, GZ[g], GZ_EXISTE[g][1]);
		}
	}
  PLAYERLIST_authed[playerid]=false;
  return false;
}

public OnPlayerDisconnect(playerid, reason)
{
    new string[256];

    switch(reason)
    {
        case 0: format(string, sizeof(string), "*** %s Saiu do Server Las Venturas BRASIL. (Problemas na conexão)", PlayerName(playerid));
        case 1: format(string, sizeof(string), "*** %s Saiu do Server Las Venturas BRASIL. (Resolveu Sair)", PlayerName(playerid));
        case 2: format(string, sizeof(string), "*** %s saiu do Server Las Venturas BRASIL. (Kickado/Banido)", PlayerName(playerid));
    }
SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);

    SendClientMessageToAll(COLOR_AQUA, string);
    	Object_OnPlayerDisconnect(playerid, reason);
    
	new playername[MAX_PLAYER_NAME];

	gActivePlayers[playerid]--;

	for(new i = 0; i < MAX_PROPERTIES; i++) {
		if(propertyOwner[i]==playerid) {
		    propertyOwner[i] = 999;
		    GivePlayerMoney(playerid, propertyValues[i]);
  		}
	}

	GetPlayerName(playerid, playername, sizeof(playername));
	format(savedNames[savePos], MAX_PLAYER_NAME, "%s",playername);

	savedInfo[savePos][0] = GetPlayerMoney(playerid);
	savedInfo[savePos][1] = bank[playerid];
	savedInfo[savePos][2] = bounty[playerid];
	savedInfo[savePos][3] = 0;

	for(new i = 0; i < MAX_WEAPONS; i++)
		savedWeapons[savePos][i]=playerWeapons[playerid][i];

	savePos++;
	if(savePos >= MAX_SAVE)
	    savePos = 0;

	PlayerLeaveGang(playerid);
	bounty[playerid] = 0;

	for(new i = 0; i < MAX_WEAPONS;i++) {
		playerWeapons[playerid][i]=0;
	}

  if (PLAYERLIST_authed[playerid]) {
    dUserSetINT(PlayerName(playerid)).("money",GetPlayerMoney(playerid));
  }
  PLAYERLIST_authed[playerid]=false;
  return false;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new string[256];
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new cmd[256];
	new giveplayerid, moneys, idx;

	cmd = strtok(cmdtext, idx);

	    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COLOR_RED,"Para se registrar Digite: /registrar [SENHA], Para Logar digite: /logar [SENHA]");
	SendClientMessage(playerid, COLOR_WHITE,"-------------------------------------AJUDA-------------------------------------------");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Use /Comandos - Para lista de comandos.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Use /Comandos2 - Para ver a 2 lista de comandos.");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Use /Teleportes - Para ver os teleportes.");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Use /GangComandos - Para ver os comandos de gang.");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Use /Sobre - Para ver do que se trata o GM.");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "Use /Creditos - Para ver quem criou o GM");
	SendClientMessage(playerid, COLOR_WHITE,"-------------------------------------AJUDA-------------------------------------------");
		 return 1;
	    }
  	    if(strcmp(cmd, "/creditos", true) == 0) {
	SendClientMessage(playerid, COLOR_WHITE,"-------------------------------------CREDITOS-------------------------------------------");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Devil <---------Contato: devil_fodao@hotmail.com");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "[Rockstar]Rell <--------Contato: guerra-mortal@hotmail.com,");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "[CsB]Kaike <--------Contato: kaiki.louco, ");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "[AP]BcO <--------Contato: bco@sundown.net,");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "BNO <--------Contato: xbno@hotmail.com,");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "IluSioN <--------Contato: leonardo-hn@hotmail.com");
	SendClientMessage(playerid, COLOR_WHITE,"-------------------------------------CREDITOS-------------------------------------------");
		 return 1;
	    }
	    if(strcmp(cmd, "/comandos", true) == 0) {
	SendClientMessage(playerid, COLOR_WHITE,"------------------------------------COMANDOS-------------------------------------------");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/Perseguir [id do jogador] [quantia]");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/Recompenca [id do jogador] /Reco");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/Transferir | /Regras | /Cheat | /count [tempo]");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/Reparar - Repare seu carro ");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/Tubo - Para ir a um tubo de Loops!");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/ajato - Compre uma Mochila ajato(Jetpack) custam 10,000");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/salvar-armas /pegar-armas");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "/comandos2 para ver mais comandos");
	SendClientMessage(playerid, COLOR_WHITE,"------------------------------------COMANDOS-------------------------------------------");
		 return 1;
	    }
  	    if(strcmp(cmd, "/comandos2", true) == 0) {
	SendClientMessage(playerid, COLOR_WHITE,"------------------------------------COMANDOS 2-------------------------------------------");
 		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/chatv [texto] - converse dentro do carro");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/flip desvire seu carro");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/horas - veja a hora certa");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/trancar / destrancar - tranque e destranque seu veiculo");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "/AjudaProp - Veja como comprar propriedades e vendelas");
	SendClientMessage(playerid, COLOR_WHITE,"------------------------------------COMANDOS 2-------------------------------------------");
		 return 1;
	    }
	    if(strcmp(cmd, "/gangcomandos", true) == 0) {
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"Comandos de gang:");
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"/gang criar [nome]");
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"/gang entrar");
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"/gang convite [playerid]");
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"/gang sair");
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"/gang kick");
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"/ganginfo [gangid]");
		SendClientMessage(playerid, COLOR_LIGHTBLUE,"! na frente do texto para o chat da gang");
		return 1;
	    }
	    if(!strcmp(cmdtext,"/regras",true)) {
	    SendClientMessage(playerid, COLOR_ORANGE,"Sevidor BRASIL Regras:");
        SendClientMessage(playerid, COLOR_YELLOW,"Não use cheats");
        SendClientMessage(playerid, COLOR_YELLOW,"Não faça DB Spaws e nunca flood mais de 2 vezes");
        SendClientMessage(playerid, COLOR_YELLOW,"Não mate ninguem dentro de interiores");
        SendClientMessage(playerid, COLOR_YELLOW,"Não use minigun ");
        SendClientMessage(playerid, COLOR_YELLOW,"Hydras, Bazucas são permitidas ");
        SendClientMessage(playerid, COLOR_RED,"Se desobedecer as regras levara ban ou kick");
        return 1;
	    }
	    if(strcmp(cmd, "/Teleportes", true) == 0) {
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/DM - Veja a lista de Arenas dm");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Stunts - Veja os campos de Stunt's");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Racer - Todos teleportes de racers");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "EXTRA's - /Avenida, /Ammu, /sanfierro, /lossantos, /wang,");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/transfender, /transfender2, /banco");
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		 return 1;
	    }
	    if(strcmp(cmd, "/DM", true) == 0) {
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes DM<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Arena - Va para arena do Server");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Arenadm[2-3] - Va para uma Arena DM");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Sniper - Va para uma Arena Sniper");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/X1 [1-2-3] - Va para uma Arena X1");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Aguadm - Arena DM em baixo da agua");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/FavelaP [P>Policia] [T>Traficante]");
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes DM<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		 return 1;
	    }
	    if(strcmp(cmd, "/Stunts", true) == 0) {
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes Stunts<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Stunt[2] - Area de stunt's [2] Para motos");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Drop[2] - Duas super Drops");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Superrampa - uma superrampa");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Chilliad - Monte Chilliad");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Desafio - Complete-o");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/tubo -  Um tubo De Loops");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/trace - Um Tubo De Loops Para race");
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes stunts<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		 return 1;
	    }
	    if(strcmp(cmd, "/Racer", true) == 0) {
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes Race<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Drift - Pistas de Drift's");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "/Drag[2] - Pistas de drag");
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Lista De Teleportes RAce<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		 return 1;
	    }
    	if(strcmp(cmd, "/Sobre", true) == 0) {
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.Sobre o GM<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "Este servidor usa um gm LV/DM+MG+LG+GZ 7.0d");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "Ele contem 9 GZ para as gangues comprarem.");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "As GZ são representadas com uma caveirinha azul no mapa");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "O GM tem um infernus invisivel, ele se localiza proximo a avenida.");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "Este GM usa uma das melhores tecnologia em LVDM atualmente.");
		SendClientMessage(playerid, COLOR_YELLOWGREEN, "O GM é sujeito a pequenas modificações, para dar maior conforto a você.");
        SendClientMessage(playerid, COLOR_ORANGE, ">.>.>.>.>.>.>.>.>.>.>.>Sobre o GM<.<.<.<.<.<.<.<.<.<.<.<.<.<.<");
		 return 1;
	    }
	    
    if(strcmp(cmd, "/status", true) == 0)
	{
 		new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USE: /status [playerid]");
			return 1;
		}

		giveplayerid = strval(tmp);

		if(IsPlayerConnected(giveplayerid))
		{
            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
            format(string, sizeof(string), "STATUS: Status de %s:", giveplayer);
			SendClientMessage(playerid, COLOR_GREEN, string);
			format(string, sizeof(string), "Matou: %d", status[giveplayerid][0]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "Morreu: %d", status[giveplayerid][1]);
  			SendClientMessage(playerid, COLOR_WHITE, string);
  			format(string, sizeof(string), "Se Suicidou: %d", status[giveplayerid][2]);
  			SendClientMessage(playerid, COLOR_WHITE, string);
  		}
  		else
  		{
  		    SendClientMessage(playerid, COLOR_RED, "ERRO: ID invalido!");
  		}
		return 1;
	}

	if(strcmp(cmdtext, "/gang zona comprar", true) == 0)
	{
		new property = 999;

		if(IsPlayerInCheckpoint(playerid))
		{
			switch (playerCheckpoint[playerid])
			{
				case CP_GZ_AUTOBASE_LV:
				{
					property = P_GZ_AUTOBASE_LV;
					gz = 0;
				}
				case CP_GZ_CONSTRUCAO_LV:
				{
					property = P_GZ_CONSTRUCAO_LV;
					gz = 1;
				}
				case CP_GZ_RECINTO_LV:
				{
					property = P_GZ_RECINTO_LV;
					gz = 2;
				}
				case CP_GZ_FABRICA_LV:
				{
					property = P_GZ_FABRICA_LV;
					gz = 3;
				}
				case CP_GZ_AEROPLACE_LV:
				{
					property = P_GZ_AEROPLACE_LV;
					gz = 4;
				}
				case CP_GZ_DISNEY_LV:
				{
					property = P_GZ_DISNEY_LV;
					gz = 5;
				}
				case CP_GZ_EXERCITO_LV:
				{
					property = P_GZ_EXERCITO_LV;
					gz = 6;
				}
				case CP_GZ_CALIGULAS_LV:
				{
					property = P_GZ_CALIGULAS_LV;
					gz = 7;
				}
				case CP_GZ_GOLF_LV:
				{
					property = P_GZ_GOLF_LV;
					gz = 8;
				}
				case CP_GZ_LV:
				{
					property = P_GZ_LV;
					gz = 9;
				}
			}

			if(gz == 999 || property == 999)
			{
				SendClientMessage(playerid, COLOR_RED, "[GZ INFO] Vá para o checkpoint e digite /gang zona comprar");
				return 1;
			}

			if(GetPlayerMoney(playerid) < propertyValues[property])
			{
				SendClientMessage(playerid, COLOR_RED, "<GZ INFO> Você não tem dinheiro para comprar essa Gang Zona!");
				return 1;
			}

			if(playerGang[playerid] > 0)
			{
				if(gangZonaId[gz] == playerGang[playerid])
				{
			      SendClientMessage(playerid, COLOR_RED, "[GZ]: Essa Gang Zona já é da tua Gang!");
			      return 1;
			    }

			    new playerCor = gangInfo[playerGang[playerid]][2];
//			    gangInfo[playerGang[playerid]][2] = playerColors[playerid];

				if(GZ_EXISTE[gz][0] == 1)
				{
					GangZoneDestroy(GZ[gz]);
					GZ[gz] = 555;
				}

				if(gangZonaId[gz] > 0)
				{
					gangZonaIdAnter[gz] = gangZonaId[gz];
				}

				switch(gz)
				{
					case 0:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(1017.134948, 1222.946899, 1096.891235, 1361.736572);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 1:
					{

                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(2372.279052, 1832.521362, 2496.685302, 1962.471801);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 2:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(2777.4753, 833.6251, 2894.6955, 1022.9479);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 3:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(918.294555, 2043.856567, 996.507202, 2182.339599);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 4:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(1638.5530, 1284.3757, 1716.3368, 1319.3700);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 5:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(2079.743, 978.1417, 2329.653, 1171.545);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 6:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(81.74512, 1763.359, 362.0141, 2055.306);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 7:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(2099.267, 1535.143, 2290.605, 1728.547);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					case 8:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(1111.341, 2718.771, 1509.635, 2842.55);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}

					case 9:
					{
                        if((!GZ[gz]) || (GZ[gz] == 555))
                        {
							GZ[gz] = GangZoneCreate(2267.176, 2235.263, 2403.845, 2409.326);
    						GangZoneShowForAll(GZ[gz], playerCor);
							gangZonaId[gz] = playerGang[playerid];
							GZ_EXISTE[gz][0] = 1;
							GZ_EXISTE[gz][1] = playerCor;
						}
					}
					default: return 1;
				}
			}
			else
			{
	           SendClientMessage(playerid, COLOR_RED, "[GZ INFO] É preciso estar em uma gang para poder comprar!");
	           return 1;
			}

            if(GZ_EXISTE[gz][0] == 1)
            {
                GivePlayerMoney(playerid, 0-propertyValues[property]);

				format(string, sizeof(string), "A gang %s comprou a %s da gang %s!", gangNames[gangZonaId[gz]], propertyNames[property], gangNames[gangZonaIdAnter[gz]]);
				SendClientMessageToAll(COLOR_GREEN, string);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "[GZ INFO] Necessario estar no checkpoint para poder /gang zona comprar");
			return 1;
		}

		return 1;
	}

if(strcmp(cmdtext,"/subir2", true)==0){
if (IsPlayerAdmin(playerid))
MoveObject(portao2, 1987.026,907.794,33.850, 3.0);
return 1;
}

if(strcmp(cmdtext,"/descer2",true)==0){
if (IsPlayerAdmin(playerid))
MoveObject(portao2, 1987.016,907.800,11.161, 3.0);
return 1;
}

if(strcmp(cmdtext,"/subir", true)==0){
if (IsPlayerAdmin(playerid))
MoveObject(portao, 2000.809,1520.537,587.325, 7.0);
return 1;
}

if(strcmp(cmdtext,"/descer",true)==0){
if (IsPlayerAdmin(playerid))
MoveObject(portao, 2000.822,1520.539,17.630, 7.0);
return 1;
}
    if(strcmp(cmd, "/horas", true) == 0)
    {
	new hour,minuite,second;
	gettime(hour,minuite,second);
	FixHour(hour);
	hour = shifthour;
	format(string, sizeof(string), "~w~|~w~%d:%d~w~|", hour, minuite);
	GameTextForPlayer(playerid, string, 5000, 1);
	return 1;
    }
 	if (strcmp(cmdtext,"/x13", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce e o melhor, prove!", 3000, 5);
	SetPlayerPos(playerid,1890.046,-1316.395,49.069);
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
    format(string, sizeof(string), "[TELEPORTE]*** %s foi para o x1 3( /x13 )", pname);
    SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
	
 	if (strcmp(cmdtext,"/x12", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce e o melhor, prove!", 3000, 5);
	SetPlayerPos(playerid,1531.834,-1131.411,135.488);
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
    format(string, sizeof(string), "[TELEPORTE]*** %s foi para o x1 2( /x12 )", pname);
    SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
	
 	if (strcmp(cmdtext,"/x11", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce e o melhor, prove!", 3000, 5);
	SetPlayerPos(playerid,2069.187,-1422.428,47.992);
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
    format(string, sizeof(string), "[TELEPORTE]*** %s foi para o x1 1( /x11 )", pname);
    SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
 	if (strcmp(cmdtext,"/drag2", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta no drag2!", 3000, 5);
	SetPlayerPos(playerid, 423.533,2524.998,16.250);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Drag2( /drag2 )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
	return 1;
	}
 	if (strcmp(cmdtext,"/esconder", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta no esconder!", 3000, 5);
	SetPlayerPos(playerid, 2087.724,1781.213,76.106);
	return 1;
	}

if(strcmp(cmdtext, "/banco", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~bem vindo ao banco!!!", 3000, 10);
SetVehiclePos(VehicleID,2187.1077,1991.7286,10.820);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2187.1077,1991.7286,10.820);
}
return 1;
}

if(strcmp(cmdtext, "/grana", true) == 0 && IsPlayerAdmin(playerid) == 1){
GivePlayerMoney(playerid,999999999);
return 1;
}

if(strcmp(cmdtext, "/lasventuras", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem vindo a LasVenturas!!!", 2673, 10);
SetVehiclePos(VehicleID,2036.1473,996.9255,10.8203);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para Las Venturas( /lasventuras )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2036.1473,996.9255,10.8203);
}
return 1;
}

if(strcmp(cmdtext, "/lossantos", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem Vindo a LoS Santos", 3000, 10);
SetVehiclePos(VehicleID,2247.0366,-1674.0092,21.0313);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para Los Santos( /lossantos )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2247.0366,-1674.0092,21.0313);
}
return 1;
}

if(strcmp(cmdtext, "/transfender", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"Bem vindo a transfender!!!!!",3000,3);
SetVehiclePos(VehicleID,2386.6179,1035.6927,10.8203);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para a TransFender( /transfender )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2386.6179,1035.6927,10.8203);
}
return 1;
}

if(strcmp(cmdtext, "/transfender2", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Tune seu Veiculo!!!", 2823, 10);
SetVehiclePos(VehicleID,-2705.7302,216.6704,3.7517);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para a TransFender2( /transfender2 )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2705.7302,216.6704,3.7517);
}
return 1;
}
new vehicleid = GetPlayerVehicleID(playerid);

if(strcmp(cmdtext, "/wang", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem Vindo a WANG!!!", 3570, 10);
SetVehiclePos(VehicleID,-1978.9912,287.5680,35.1719);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para Wang( /wang )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-1978.9912,287.5680,35.1719);
}
return 1;
}

if(strcmp(cmdtext, "/tubo", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem Vindo ao Tubo!!!", 3570, 10);
SetVehiclePos(VehicleID,788.4612, -2054.967, 58.3314);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Tubo( /tubo )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,788.4612, -2054.967, 58.3314);
}
return 1;
}

if(strcmp(cmdtext, "/trace", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem Vindo ao TRACE!!!", 3570, 10);
SetVehiclePos(VehicleID,3051.8584, -1893.4186, 48.2275);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Tubo de Race( /trace )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,3051.8584, -1893.4186, 48.2275);
}
return 1;
}

if(strcmp(cmdtext, "/stunt", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem Vindo ao stunt!!!", 3570, 10);
SetVehiclePos(VehicleID,2122.3345, -2507.3535, 13.5469);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Stunt( /stunt )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,2122.3345, -2507.3535, 13.5469);
}
return 1;
}

if(strcmp(cmdtext, "/xdrop", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem Vindo ao xdrop!!!", 3570, 10);
SetVehiclePos(VehicleID,1437.8646, 1268.7703, 167.0062);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Xdrop( /xdrop )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,1437.8646, 1268.7703, 167.0062);
}
return 1;
}


if(strcmp(cmdtext, "/sanfierro", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
if(IsPlayerInAnyVehicle(playerid)) {
new VehicleID;
VehicleID = GetPlayerVehicleID(playerid);
GameTextForPlayer(playerid,"~w~Bem Vindo a San Fierro!!!", 3000, 10);
SetVehiclePos(VehicleID,-2537.7417,-617.0477,132.710);
new pname[MAX_PLAYER_NAME];
GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
format(string, sizeof(string), "[TELEPORTE]*** %s foi para San Fierro( /sanfierro )", pname);
SendClientMessageToAll(COLOR_NOVO, string);
SetPlayerInterior(playerid,0);
}
else{
SetPlayerInterior(playerid,0);
SetPlayerPos(playerid,-2537.7417,-617.0477,132.710);
}
return 1;
}
   
if(strcmp(cmdtext, "/ajato", true) == 0)
{
GivePlayerMoney(playerid, -10000);
if(!IsPlayerInAnyVehicle(playerid)) {
SetPlayerSpecialAction(playerid, 2);
} else {
SendClientMessage(playerid, 0xFFF000AA, "Você não pode usar um jetpack dentro de um veículo!");
}
return 1;
}

   	if(strcmp(cmdtext, "/drag", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	if(IsPlayerInAnyVehicle(playerid)) {
	new VehicleID;
	VehicleID = GetPlayerVehicleID(playerid);
	SetVehiclePos(VehicleID,-2902.460,177.891,4.720);
	GameTextForPlayer(playerid,"~g~Voce esta na corrida", 3000, 5);
	SetPlayerInterior(playerid,0);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Drag( /drag )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
	}
	else{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-2902.460,177.891,4.720);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "%s foi para o Drag( /drag )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
	}
	return 1;
	}
   	if (strcmp(cmdtext,"/favelat", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na favela!TRAFICANTE!", 3000, 5);
	SetPlayerPos(playerid,1997.7008,-1009.3782,30.4624);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi de Traficante Para ( /favelat )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}

	
	if (strcmp(cmdtext,"/favelap", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na favela!POLICIA!", 3000, 5);
	SetPlayerPos(playerid,2211.298,-1169.960,25.657);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi de policial para ( /favelap )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}

if (strcmp(cmdtext, "/trancar", true) == 0)
{
if(IsPlayerInAnyVehicle(playerid))
{
new Stat5 ;
Stat5=GetPlayerState(playerid);
if(Stat5!=PLAYER_STATE_DRIVER)
{
SendClientMessage(playerid,COLOR_RED,"Você não pode trancar esse veículo!");
return 1;
}

new i;
for(i=0;i<MAX_PLAYERS;i++)
{
if(i != playerid)
{
SetVehicleParamsForPlayer(vehicleid,i, 0, 1);
}
}
SendClientMessage(playerid, COLOR_WHITE, "VEÍCULO TRANCADO.");
}
else
{
SendClientMessage(playerid, COLOR_RED, "Você não está em um veículo!");
}
return 1;
}

if (strcmp(cmdtext, "/destrancar", true)==0)
{
if(IsPlayerInAnyVehicle(playerid))
{
new Stat6 ;
Stat6 = GetPlayerState(playerid);
if(Stat6!=PLAYER_STATE_DRIVER)
{
SendClientMessage(playerid,COLOR_RED,"Voce não pode destrancar esse veículo!");
return 1;
}
new i;
for(i=0;i<MAX_PLAYERS;i++)
{
SetVehicleParamsForPlayer(vehicleid,i, 0, 0);
}
SendClientMessage(playerid, COLOR_WHITE, "VEÍCULO DESTRANCADO.");
}
else
{
SendClientMessage(playerid, COLOR_RED, "Você não está em um veículo!");
}
return 1;
}

   	if(strcmp(cmdtext, "/kill", true) == 0)
	{					
	SetPlayerHealth(playerid,0.0);
	new message[265];
	new pname[30];
	GetPlayerName(playerid, pname, sizeof(pname));
	format(message, sizeof(message), "<SUICIDAS> %s Se Matou!", pname);
	SendClientMessageToAll(COLOR_WHITE,message);
    GameTextForPlayer(playerid,"~r~Se matou",4000,1);
    return 1;
 	}
 	if(strcmp(cmd, "/chatv", true) == 0)
	{
	    //new string[256];
	    //new tmp[256];
	    cmd = strtok(cmdtext, idx);
	    GetPlayerName(playerid, sendername, sizeof(sendername));
	    if(!strlen(cmd))
	    {
	        SendClientMessage(playerid, 0xfff000aa, "USE: /chatv [texto]");
	        return 1;
	    }
	    if(IsPlayerInAnyVehicle(playerid))
	    {
	        format(string, sizeof(string), "[VEHICLE CHAT]%s: %s", sendername, cmd);
	        for(new i = 0; i < MAX_PLAYERS; i ++)
	        {
	            if(IsPlayerConnected( i))
	            {
                 	if(IsPlayerInVehicle(i, GetPlayerVehicleID(playerid)))
	                {
	                    SendClientMessage(i,0x33AA33AA, string);
	                }
	            }
	        }
	        return 1;
	    }
	    else
	    {
	        SendClientMessage(playerid, 0xfff000aa, "Você precisa estar em um veículo!");
	        return 1;
	    }
	}

	if(strcmp(cmdtext, "/drift", true) == 0) {
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,2352.6387,1399.1855,42.8203);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Drift( /drift )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
	}
	return 1;
	}
  	if (strcmp(cmdtext,"/aguadm", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na arena de agua!", 3000, 5);
	SetPlayerPos(playerid,-1137.9557,-461.8962,-15.4766);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o aguadm( /aguadm )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
	return 1;
	}

 	if (strcmp(cmdtext,"/x1", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce e o melhor, prove!", 3000, 5);
	SetPlayerPos(playerid,1534.7063,-1357.3258,329.4554);
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
    format(string, sizeof(string), "[TELEPORTE]*** %s foi para x1( /x1 )", pname);
    SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
  	if(strcmp(cmdtext, "/chilliad", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	if(IsPlayerInAnyVehicle(playerid)) {
	new VehicleID;
	VehicleID = GetPlayerVehicleID(playerid);
	SetVehiclePos(VehicleID,-2320.2546,-1627.7273,483.7043);
	GameTextForPlayer(playerid,"~g~Voce esta no chilliad", 3000, 5);
	SetPlayerInterior(playerid,0);
	}
	else{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-2320.2546,-1627.7273,483.7043);
	}
	return 1;
	}
	
  	if (strcmp(cmdtext, "/arenadm", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na arenadm", 3000, 5);
	SetPlayerPos(playerid,-1975.9633,696.0236,145.3203);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Arenadm( /arenadm )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
	
 	if (strcmp(cmdtext, "/arenadm2", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na arenadm2", 3000, 5);
	SetPlayerPos(playerid,-2055.6570,-218.5506,35.3274);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Arenadm2( /arenadm2 )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}

	if(strcmp(cmdtext, "/stunt2", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	if(IsPlayerInAnyVehicle(playerid)) {
	new VehicleID;
	VehicleID = GetPlayerVehicleID(playerid);
	SetVehiclePos(VehicleID,-1371.9689,-248.1584,14.1440);
	GameTextForPlayer(playerid,"~g~Voce esta no stunt 2", 3000, 5);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Stunt 2( /stunt2 )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
	SetPlayerInterior(playerid,0);
	}
	else{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-1371.9689,-248.1584,14.1440);
	}
	return 1;
	}

 	if (strcmp(cmdtext, "/sniper", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na arena sniper", 3000, 5);
	SetPlayerPos(playerid,-880.6713,-2633.7266,97.9993);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o sniper( /sniper )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
	return 1;
	}
	if (strcmp(cmdtext, "/arenadm3", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na arenadm", 3000, 5);
	SetPlayerPos(playerid,-2752.7759,-251.4147,7.1875);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Arenadm3( /arenadm3 )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
	
	if (strcmp(cmdtext, "/abrir2", true)==0){
        SendClientMessage(playerid,0x95000096,"SERVER: Para trancar o Portao use /fechar2.");
		MoveObject (gate2,2561.50, 1483.45, 3.3, 2.0);
		return 1;
	}if (strcmp(cmdtext, "/fechar2", true)==0){
        SendClientMessage(playerid,0x95000096,"SERVER: Portão Fechado");
		MoveObject (gate2,2561.50, 1483.45, 9.00, 2.0);
		return 1;
	}if (strcmp(cmdtext, "/abrir", true)==0){
        SendClientMessage(playerid,0x95000096,"SERVER: Para trancar o Portao use /fechar.");
		MoveObject (gate1,2513.05, 1603.01, 3.3, 2.0);
		return 1;
	}if (strcmp(cmdtext, "/fechar", true)==0){
        SendClientMessage(playerid,0x95000096,"SERVER: Portao trancado");
		MoveObject (gate1,2513.05, 1603.01, 9.00, 2.0);
		return 1;
		}

 	if (strcmp(cmdtext, "/arena", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce esta na arena!", 3000, 5);
	SetPlayerPos(playerid,1350.4232,2153.4683,11.0156);
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Arena( /Arena )", pname);
	SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
	
 	if (strcmp(cmdtext,"/desafio", true)==0)
	{
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	SetPlayerInterior(playerid,0);
	GameTextForPlayer(playerid,"~g~Voce e o melhor, prove!", 3000, 5);
	SetPlayerPos(playerid,2264.034,1162.278,79.315);
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
    format(string, sizeof(string), "[TELEPORTE]*** %s foi para desafio( /desafio )", pname);
    SendClientMessageToAll(COLOR_NOVO, string);
       GivePlayerWeapon(playerid,4,0);
       GivePlayerWeapon(playerid,26,9999);
       GivePlayerWeapon(playerid,31,9999);
       GivePlayerWeapon(playerid,24,9999);
       GivePlayerWeapon(playerid,32,9999);
	return 1;
	}
	
  	if(strcmp(cmdtext, "/stunt2", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	if(IsPlayerInAnyVehicle(playerid)) {
	new VehicleID;
	VehicleID = GetPlayerVehicleID(playerid);
	SetVehiclePos(VehicleID,-2020.722,445.372,139.403);
	GameTextForPlayer(playerid,"~g~Voce esta no stunt", 3000, 5);
	SetPlayerInterior(playerid,0);
	}
	else{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-2020.722,445.372,139.403);
	}
	return 1;
	}

if(strcmp(cmd, "/meuskin", true, 11)==0)
{
cmd = strtok(cmdtext, idx);
if(!strlen(cmd))
{
SendClientMessage(playerid, COLOR_RED, "[ERRO]Digite: /meuskin [ID da Skin]");
return 1;
}
new param2=strval(cmd);
if(param2<7)
{
SendClientMessage(playerid, COLOR_RED, "[ERRO]Digite: /meuskin [ID da Skin]");
return 1;
}
if(param2==8||param2==42||param2==65||param2==74||param2==86||param2==208||param2==289) //||74||86||208||289)
{
return 1;
}
if(param2>264 && param2<274)
{
return 1;
}
if(param2>299)
{
SendClientMessage(playerid, COLOR_RED, "[ERRO] Você so pode escolher um skin de 7 a 299");
return 1;
}
SetPlayerSkin(playerid, param2);
return 1;
}
	
   if(strcmp(cmdtext, "/drop", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
   if(IsPlayerInAnyVehicle(playerid)) {
   new VehicleID;
   VehicleID = GetPlayerVehicleID(playerid);
   SetVehiclePos(VehicleID,3790.545,-1877.194,1802.409);
   SetVehicleZAngle(GetPlayerVehicleID(playerid), 89.0);
   new pname[MAX_PLAYER_NAME];
   GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
   format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Drop( /drop )", pname);
   SendClientMessageToAll(COLOR_NOVO, string);
   ResetPlayerWeapons(playerid);
   SetPlayerInterior(playerid,0);
 }
   else{
       new pname[MAX_PLAYER_NAME];
       GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
       format(string, sizeof(string), "[TELEPORTE]*** %s foi para o Drop( /drop )", pname);
       SendClientMessageToAll(COLOR_NOVO, string);
       ResetPlayerWeapons(playerid);
       SetPlayerInterior(playerid,0);
       SetPlayerPos(playerid,3790.545,-1877.194,1802.409);
       SetPlayerFacingAngle(playerid,190.9207);
}
    return 1;
}

	if(strcmp(cmdtext, "/drop2", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
	if(IsPlayerInAnyVehicle(playerid)) {
	new VehicleID;
	VehicleID = GetPlayerVehicleID(playerid);
	SetVehiclePos(VehicleID,-3099.049,-141.548,2155.232);
	GameTextForPlayer(playerid,"~g~Voce esta na superrampa", 3000, 5);
	SetPlayerInterior(playerid,0);
	}
	else{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-3099.049,-141.548,2155.232);
	}
	return 1;
	}


	
   if(strcmp(cmdtext, "/superrampa", true) == 0) {
    if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui após morrer.!");
   if(IsPlayerInAnyVehicle(playerid)) {
   new VehicleID;
   VehicleID = GetPlayerVehicleID(playerid);
   SetVehiclePos(VehicleID,467.052,-1358.738,2310.878);
   SetVehicleZAngle(GetPlayerVehicleID(playerid), 1.1080);
   new pname[MAX_PLAYER_NAME];
   GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
   format(string, sizeof(string), "[TELEPORTE]*** %s foi descer o Drop( /superrampa )", pname);
   SendClientMessageToAll(COLOR_NOVO, string);
   ResetPlayerWeapons(playerid);
   SetPlayerInterior(playerid,0);
 }
   else{
       new pname[MAX_PLAYER_NAME];
       GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
       format(string, sizeof(string), "[TELEPORTE] %s foi descer o Drop( /superrampa )", pname);
       SendClientMessageToAll(COLOR_NOVO, string);
       ResetPlayerWeapons(playerid);
       SetPlayerInterior(playerid,0);
       SetPlayerPos(playerid,417.138,-1101.635,2261.905);
       SetPlayerFacingAngle(playerid,190.9207);
}
    return 1;
}
if (strcmp("/veiculosnovos", cmdtext, true, 10) == 0)
if(IsPlayerAdmin(playerid)){
for(new v; v<MAX_VEHICLES; v++) SetVehicleToRespawn(v);
return 1;
}

if(strcmp(cmd, "/flip", true) == 0)
{
new Float:X, Float:Y, Float:Z;
if(IsPlayerInAnyVehicle(playerid))

SetCameraBehindPlayer(playerid);
GetPlayerPos(playerid, X, Y, Z);
SetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
SetVehicleZAngle(GetPlayerVehicleID(playerid), 0);
return 1;
}

if(strcmp(cmdtext, "/avenida", true) == 0)
{
if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você só pode sair daqui apos Morrer!");
new cartype = GetPlayerVehicleID(playerid);
new State=GetPlayerState(playerid);
SetPlayerInterior(playerid,0);
{if(State!=PLAYER_STATE_DRIVER)
{SetPlayerPos(playerid,2057.0847,840.1503,6.7337);}
else if(IsPlayerInVehicle(playerid, cartype) == 1)
{SetVehiclePos(cartype,2057.0847,840.1503,6.7337);
SetVehicleZAngle(cartype,1.0333);}
else
{SetPlayerPos(playerid,2057.0847,840.1503,6.7337);}
GameTextForPlayer(playerid," Seja bem vindo a avenida",2500,3);}
return 1;}

if(strcmp(cmdtext, "/ammu", true) == 0)
{
if(Arena[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "ERRO: Você não pode fugir de uma DeathMatch!");
new cartype = GetPlayerVehicleID(playerid);
new State=GetPlayerState(playerid);
SetPlayerInterior(playerid,0);
{if(State!=PLAYER_STATE_DRIVER)
{SetPlayerPos(playerid,2155.5381,943.2191,10.8203);}
else if(IsPlayerInVehicle(playerid, cartype) == 1)
{SetVehiclePos(cartype,2155.5381,943.2191,10.8203);
SetVehicleZAngle(cartype,270.5655);}
else
{SetPlayerPos(playerid,2155.5381,943.2191,10.8203);}
GameTextForPlayer(playerid," Seja bem vindo ao ammunation",2500,3);}
return 1;}


if (strcmp(cmdtext, "/reparar", true)==0) {
if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,COLOR_RED,"ERRO: Voce não esta em um veiculo.");
SetVehicleHealth(GetPlayerVehicleID(playerid),1000.0);
return SendClientMessage(playerid,COLOR_GREEN,"VEICULO REPARADO COM SUCESSO!");
}

if (strcmp(cmdtext, "/cheat", true)==0) {
  SetPlayerInterior(playerid,0);
  SendClientMessage(playerid,COLOR_YELLOW,"Tentado Usar Cheat Né?");
  SendClientMessage(playerid,COLOR_YELLOW,"Isso É Para Você Aprender A");
  SendClientMessage(playerid,COLOR_YELLOW,"Não Tentar Usar Cheats Aqui!");
  SetPlayerHealth(playerid,1);
  GivePlayerMoney(playerid, -35000);
  SetPlayerPos(playerid,-1855.9543,-1618.3403,700.500);
  ResetPlayerWeapons(playerid);
  GivePlayerWeapon(playerid,12,1);

   return 1;
}
	if(strcmp(cmd, "/transferir", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "DIGITE: /transferir [id do jogador] [quantia]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "DIGITE: /transferir [id do jogador] [quantia]");
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
				format(string, sizeof(string), "Voce enviou %s (id: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "Você recebeu $%d de %s (id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s(playerid:%d) transferiu %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Transzaçao invalida.");
			}
		}
		else {
				format(string, sizeof(string), "%d não esta online.", giveplayerid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		return 1;
	}

	if(strcmp(cmd, "/perseguir", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "DIGITE: /perseguir [id do jogador] [quantia]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "DIGITE: /perseguir [id do jogador] [quantia]");
			return 1;
		}
 		moneys = strval(tmp);

	    if(moneys > GetPlayerMoney(playerid)) {
			SendClientMessage(playerid, COLOR_RED, "Você não tem dinheiro!");
			return 1;
	    }
	    if(moneys < 1) {
			SendClientMessage(playerid, COLOR_YELLOW, "Ei o que você esta cansado aqui");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid)==0) {
			SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe.");
			return 1;
		}

		bounty[giveplayerid]+=moneys;
		GivePlayerMoney(playerid, 0-moneys);

		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));

//		format(string, sizeof(string), "You have put a $%d bounty on the head of %s (id: %d).", moneys, giveplayer,giveplayerid);
//		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(string, sizeof(string), "%s Esta com uma recompença de $%d dada por %s (total: $%d).", giveplayer, moneys, sendername, bounty[giveplayerid]);
		SendClientMessageToAll(COLOR_ORANGE, string);

		format(string, sizeof(string), "Você teve uma recompensa de $%d posto sobre você de %s (id: %d).", moneys, sendername, playerid);
		SendClientMessage(giveplayerid, COLOR_RED, string);

		return 1;
	}

	if(strcmp(cmd, "/Recompenca", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "DIGITE: /Recompenca [id do jogador]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "Player %s (id: %d) tem uma recompenca de $%d em sua cabeça.", giveplayer,giveplayerid,bounty[giveplayerid]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		} else {
			SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
		}

		return 1;
	}

	if(strcmp(cmd, "/Recompencas", true) == 0)
	{
//		new tmp[256];
		new x;

		SendClientMessage(playerid, COLOR_GREEN, "Recompenças Atuais:");
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

	if(strcmp(cmd, "/comprar", true) == 0) {
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
				SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um checkpoint pra usar esse comando.");
				return 1;
			}

			if(GetPlayerMoney(playerid) < propertyValues[property]) {
				SendClientMessage(playerid, COLOR_RED, "Você não tem  dinheiro suficiente para comprar essa propriedade.");
				return 1;
			}
			if(propertyOwner[property]==playerid) {
				SendClientMessage(playerid, COLOR_RED, "Você comprou essa propriedade.");
				return 1;
			}

			if(propertyOwner[property] < 999) {
				GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
				GivePlayerMoney(propertyOwner[property], propertyValues[property]);
				format(string, sizeof(string), "[PROPRIEDADE] Sua propriedade %s, foi comprada por %s (id: %d).",propertyNames[property],giveplayer,playerid);
				SendClientMessage(propertyOwner[property], COLOR_RED, string);
			}

			GivePlayerMoney(playerid, 0-propertyValues[property]);

			propertyOwner[property]=playerid;

			format(string, sizeof(string), "Você comprou %s!", propertyNames[property]);
			SendClientMessage(playerid, COLOR_GREEN, string);

		} else {
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar no CheckPoint para comprar.");
			return 1;
		}


		return 1;
	}

	if(strcmp(cmd, "/propriedades", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN, "Propriedades a venda:");
		for(new i = 0; i < MAX_PROPERTIES; i++) {
			if(propertyOwner[i] < 999) {
				GetPlayerName(propertyOwner[i], giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), "%d. %s - %s", i, propertyNames[i], giveplayer);
			} else
				format(string, sizeof(string), "%d. %s - Ninguem", i, propertyNames[i]);

			SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	if(strcmp(cmd, "/gang", true) == 0)
	{
	    new tmp[256];
	    new gangcmd, gangnum;
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COR_ROSA, "USE: /gang [criar/entrar/convite/sair/kick] [nome/id]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(strcmp(tmp, "criar", true)==0)
		    gangcmd = 1;
		else if(strcmp(tmp, "convite", true)==0)
		    gangcmd = 2;
		else if(strcmp(tmp, "entrar", true)==0)
		    gangcmd = 3;
		else if(strcmp(tmp, "sair", true)==0)
		    gangcmd = 4;
		else if(strcmp(tmp, "kick", true)==0)
		    gangcmd = 5;

		tmp = strtok(cmdtext, idx);

		if(gangcmd < 3 && !strlen(tmp))
		{
		    if(gangcmd==0)
				SendClientMessage(playerid, COR_ROSA, "<USE> /gang [criar/entrar/convite/sair] [nome/id]");
			else if(gangcmd==1)
				SendClientMessage(playerid, COR_ROSA, "<USE> /gang [criar] [nome]");
			else if(gangcmd==2)
				SendClientMessage(playerid, COR_ROSA, "<USE> /gang [convite] [playerid]");
			return 1;
		}

		if(gangcmd==1)
		{
		    if(playerGang[playerid]>0)
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Já está em uma gang!");
				return 1;
		    }

			for(new i = 1; i < MAX_GANGS; i++)
			{
				if(gangInfo[i][0]==0)
				{

					format(gangNames[i], MAX_GANG_NAME, "%s", tmp);

					gangInfo[i][0]=1;

					gangInfo[i][1]=1;
				
					gangInfo[i][2]=playerColors[playerid];

				
					gangMembers[i][0] = playerid;
					format(string, sizeof(string),"GANG: Você criou a gang:'%s' (id: %d)", gangNames[i], i);
					SendClientMessage(playerid, COLOR_GREEN, string);

					playerGang[playerid]=i;

					return 1;
				}
			}

			return 1;
		}
		else if(gangcmd==3)
		{
	 		gangnum = gangInvite[playerid];

		    if(playerGang[playerid] > 0)
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Você já está em uma gang!");
				return 1;
		    }

	 		if(gangInvite[playerid] == 0)
		 	{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Você não foi convidado para está gang.");
				return 1;
			}

			if(gangInfo[gangnum][0] == 0)
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Essa gang não existe!");
				return 1;
			}

			if(gangInfo[gangnum][1] < MAX_GANG_MEMBERS)
			{
			    new i = gangInfo[gangnum][1];
				gangInvite[playerid] = 0;
				gangMembers[gangnum][i] = playerid;
			    GetPlayerName(playerid, sendername, MAX_PLAYER_NAME);

				for(new j = 0; j < gangInfo[gangnum][1]; j++)
				{
					format(string, sizeof(string),"GANG: %s Você faz parte da gang.", sendername);
					SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
				}

				gangInfo[gangnum][1]++;
				playerGang[playerid] = gangnum;
				SetPlayerColor(playerid,gangInfo[gangnum][2]);

				format(string, sizeof(string),"GANG: Você entrou na gang:'%s' (id: %d)", gangNames[gangnum], gangnum);
				SendClientMessage(playerid, COLOR_GREEN, string);

				return 1;
			}

			SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Essa gang está cheia.");
			return 1;

		}
		else if(gangcmd==2)
		{
	 		giveplayerid = strval(tmp);

			if(playerGang[playerid]==0)
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Você não está em uma gang!");
				return 1;
			}
//			if(gangMembers[playerGang[playerid]][0] != playerid) {
//				SendClientMessage(playerid, COLOR_MAGENTA, "You need to be the gang leader to send an invite.");
//				return 1;
//			}

			if(IsPlayerConnected(giveplayerid))
			{
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));

				format(string, sizeof(string),"GANG: Você convidou %s.", giveplayer);
				SendClientMessage(playerid, COLOR_GREEN, string);
				format(string, sizeof(string),"GANG: Você recebeu um convite %s para se juntar a gang '%s' (id: %d)", sendername, gangNames[playerGang[playerid]],playerGang[playerid]);
				SendClientMessage(giveplayerid, COLOR_GREEN, string);

				gangInvite[giveplayerid] = playerGang[playerid];

			}
			else
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Esse player não existe!");
			}
		}
		else if(gangcmd==4)
		{
		    PlayerLeaveGang(playerid);
		}
		else if(gangcmd==5)
		{
			giveplayerid = strval(tmp);

			if(playerGang[playerid] == 0)
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Você não está em uma gang!");
				return 1;
			}

			if(playerGang[giveplayerid] != playerGang[playerid])
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Este player não está em sua gang!");
				return 1;
			}

			if(IsPlayerConnected(giveplayerid))
			{
			    gangnum = playerGang[playerid];

				if(gangMembers[gangnum][0] == playerid)
				{
					PlayerLeaveGang(giveplayerid);
				}
				else
				{
				    SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Você não é o Lider da gang, então não pode kickar membros de sua gang!");
				    return 1;
				}

				for(new j = 0; j < gangInfo[gangnum][1]; j++)
				{
					format(string, sizeof(string),"GANG: %s foi kickado da gang.", PlayerName(giveplayerid));
					SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
				}

				format(string, sizeof(string),"GANG: Você foi kickado da gang:'%s' (id: %d)", gangNames[gangnum], gangnum);
				SendClientMessage(giveplayerid, COLOR_ORANGE, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Esse player não existe!");
			}
			return 1;
		}

		return 1;
	}
	if(strcmp(cmd, "/ganginfo", true) == 0)
	{
	    new tmp[256];
	    new gangnum;
	    new strlider[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp) && playerGang[playerid]==0)
		{
			SendClientMessage(playerid, COLOR_YELLOW, "USE: /ganginfo [gangid]");
			return 1;
		}
		else if(!strlen(tmp))
		{
			gangnum = playerGang[playerid];
		}
		else
		{
			gangnum = strval(tmp);
		}

		if(gangInfo[gangnum][0]==0)
		{
			SendClientMessage(playerid, COLOR_MAGENTA, "GANG: Essa gangue não existe");
			return 1;
		}

		format(string, sizeof(string),"GANG: '%s' Membros da gang (id: %d)", gangNames[gangnum], gangnum);
		SendClientMessage(playerid, COLOR_GREEN, string);

		for(new i = 0; i < gangInfo[gangnum][1]; i++)
		{
			if(i == 0)
			{
				strlider = "Lider: ";
			}
			else
			{
                strlider = "";
			}

			GetPlayerName(gangMembers[gangnum][i], giveplayer, sizeof(giveplayer));
			format(string, sizeof(string),"GANG: %s%s (%d)", strlider, giveplayer, gangMembers[gangnum][i]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	if(strcmp(cmd, "/gangs", true) == 0)
	{
		new x;

		SendClientMessage(playerid, COLOR_GREEN, "GANGS CRIADAS");

		for(new i=0; i < MAX_GANGS; i++)
		{
			if(gangInfo[i][0]==1)
			{
				format(string, sizeof(string), "%s%s(%d) - %d Membros", string,gangNames[i],i,gangInfo[i][1]);

				x++;
				if(x > 2)
				{
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    x = 0;
					format(string, sizeof(string), "");
				}
				else
				{
					format(string, sizeof(string), "%s, ", string);
				}
			}
		}

		if(x <= 2 && x > 0)
		{
			string[strlen(string)-2] = '.';
	    	SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	return SendClientMessage(playerid,COLOR_RED,"Servidor BRASIL: Comando Inexistente!");
}
public OnPlayerText(playerid, text[])
{
	if(text[0] == '!')
	{
		if(playerGang[playerid] > 0)
		{
		    new gangChat[256];
		    new senderName[MAX_PLAYER_NAME];
		    new string[256];

//		    for(new i = 1; i < strlen(text)+1; i++)
//				gangChat[i]=text[i];

			strmid(gangChat,text,1,strlen(text));
			GetPlayerName(playerid, senderName, sizeof(senderName));
			format(string, sizeof(string),"GANG CHAT: %s: %s", senderName, gangChat);

			for(new i = 0; i < gangInfo[playerGang[playerid]][1]; i++)
			{
				SendClientMessage(gangMembers[playerGang[playerid]][i], COLOR_AQUA, string);
			}
		}
		return 0;
	}


	UpperToLower(text);

	new string[256];
    format(string,sizeof(string),"[ID:%d]: %s",playerid,text);
	SendPlayerMessageToAll(playerid,string);

	return 0;
}

public OnPlayerSpawn(playerid)
{
    PlayerPlaySound(playerid, 1098, 0.0, 0.0, 0.0);
//	SetVehicleParamsForPlayer(CAR_MARKER_PIRATE,playerid,1,1);
//	SetVehicleParamsForPlayer(CAR_MARKER_STORE,playerid,1,1);

	if(GetPlayerMoney(playerid)>=0)
	{
		GivePlayerMoney(playerid, PocketMoney);
	}
	SetPlayerInterior(playerid,0);
	SetPlayerRandomSpawn(playerid);

	for(new i = 0; i < MAX_WEAPONS; i++) {
		if(playerWeapons[playerid][i] > 0) {
			GivePlayerWeapon(playerid,weaponIDs[i],weaponAmmo[i]*playerWeapons[playerid][i]);
		}
	}

	gambleWarning[playerid]=0;

	return 1;
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

public OnPlayerDeath(playerid, killerid, reason)
{
    new playercash;
	new killedplayer[MAX_PLAYER_NAME];
	new string[256];
	Arena[playerid] = 0;
	
	playercash = GetPlayerMoney(playerid);
	

	if(killerid == INVALID_PLAYER_ID)
	{
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
	}
	 else
	{
    	SendDeathMessage(killerid,playerid,reason);
		if(bounty[playerid] > 0 && (playerGang[killerid] == 0 || playerGang[playerid] != playerGang[killerid])) {
			GetPlayerName(playerid, killedplayer, sizeof(killedplayer));
			format(string, sizeof(string), "Você recebeu a recompensa de $%d por matar %s.", bounty[playerid], PlayerName(playerid));
			SendClientMessage(killerid, COLOR_GREEN, string);

			GivePlayerMoney(killerid, bounty[playerid]);
			bounty[playerid] = 0;
		}
		if(playercash > 0)  {
			GivePlayerMoney(killerid, playercash);
		}
   	}

   	if(playercash > 0)
   	{
	    ResetPlayerMoney(playerid);
    }
    
   	if(killerid == INVALID_PLAYER_ID)
	{
 		status[playerid][2] += 1;
 	}
 	else
  	{
		if((playerGang[killerid] > 0) && (playerGang[playerid] > 0))
		{
		   if(playerGang[killerid] == playerGang[playerid])
		   {
			  if(status[killerid][0] > 0)
			  {
		      	 status[killerid][0] -= 1;
		      }
		   }
		}

		status[killerid][0] += 1;
        status[playerid][1] += 1;
 	}

	if(!status[killerid][0])
	{
	}
	else
	{
		if(status[killerid][0] == 5)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s Ja Matou 5 Pessoas, Parabens, e mate muito mais!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}

		else if(status[killerid][0] == 10)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s Ja Matou 10 Pessoas e axo que vai continuar matando tome cuidado!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 20)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s Esta Virando uma Maquina de Matar ja matou 20 pessoas, esse Quando morrer não vai pro Céu!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 30)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s Ja Matou 30 pessoas, Oque é isso?Chamen o FBI isso é um risco a Humanidade!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 40)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s ja Matou 40, cuidado com ele, axo que ele te mata ate com uma camera fotografica!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 50)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s fez pacto com o Chifrudo, ele ja Matou 50, assim não da peguem ele!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 60)
		{
	 		format(string, sizeof(string), "[BANDIDOS]***%s ja Matou 60, Sera Que ele é da Policia do RJ? Ou ele mata por que quer?!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 70)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s axo que vc é parente do Arnold Schwarzenegger, ja Matou 70, lol!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 80)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s ja matou 80, Axo que ele é o Osama Binladem disfarçado.!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
		else if(status[killerid][0] == 90)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s esta humilhando a todos, ja matou 90 pessoas, esse cara é o melhor!", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);

		}
		else if(status[killerid][0] == 100)
		{
	 		format(string, sizeof(string), "[BANDIDOS]*** %s é de mais matou 100, Ele é Simplesmente o MELHOR tentem encara ele, e fike longe de min... ", PlayerName(killerid));
			SendClientMessageToAll(COLOR_ORANGE, string);
		}
	}
	if(!status[playerid][1])
	{
	}
	else
	{
		if(status[playerid][1] == 5)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já começou morrendo, ja morreu 5 vezes, espero que não continue assim!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}

		else if(status[playerid][1] == 10)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s ja morreu 10 vezes, COmo é cara vai fica ae apanhando ou vai reagir?", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 20)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 20 vezes, Oxe vamos ter que fazer uma vaquinha e te dar uma Bazuka?So assim pra vc mata!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 30)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 30 vezes, melhor vc axa um tutorial de como usar uma arma eim!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 40)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já virou uma alma penada, ja morreu 40 vezes, sem salvação!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 50)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 50 vezes, axo que ele ta sem arma não é possivel morre 50 vezes!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 60)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 60 vezes, Ainda levando pau, kkkkkkkk!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 70)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 70 vezes, Procure o PCC quem sabe eles não te dão alguma dica?!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 80)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 80 vezes, Tem certeza que vc sabe oq signifika: MATAR?!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 90)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 90 vezes, è Realmente ta feio pro seu lado amigo(a)!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
		else if(status[playerid][1] == 100)
		{
	 		format(string, sizeof(string), "[MORTOS]*** %s já morreu 100 vezes, Desisto, vc não tem mais salvação não!!", PlayerName(playerid));
			SendClientMessageToAll(COLOR_RED, string);
		}
	}

		new oldlevel;
	 	new newlevel;
	  	oldlevel = GetPlayerWantedLevel(killerid);
	   	newlevel = oldlevel + 1;

	    if(gTeam[killerid] != TEAM_COPS)
		{
	    SetPlayerWantedLevel(killerid, newlevel);
	    SetPlayerWantedLevel(playerid, 0);
		SendClientMessage(killerid, 0xFF6347AA,"[POLÍCIA] Você está sendo procurado(a) pela Polícia de Las Venturas!");
		}

		else if(GetPlayerWantedLevel(playerid) == 1)
		{
	    if(gTeam[killerid] == TEAM_COPS)
		{
		GivePlayerMoney(killerid,1000);
	 	SetPlayerWantedLevel(playerid, 0);
		SendClientMessage(killerid, COLOR_COP,"[POLÍCIA] Ladrão que mata Ladrão, 100 anos de perdão! [Recompensa: 1.000$]");
		}
	    }
		else if(GetPlayerWantedLevel(playerid) == 2)
		{
	    if(gTeam[killerid] == TEAM_COPS)
		{
	    GivePlayerMoney(killerid,2000);
	  	SetPlayerWantedLevel(playerid, 0);
		SendClientMessage(killerid, COLOR_COP,"[POLÍCIA] Ladrão que mata Ladrão, 100 anos de perdão! [Recompensa: 2.000$]");
		}
	    }
		else if(GetPlayerWantedLevel(killerid) == 3)
		{
	    if(gTeam[killerid] == TEAM_COPS)
		{
	    GivePlayerMoney(killerid,3000);
	  	SetPlayerWantedLevel(playerid, 0);
		SendClientMessage(killerid, COLOR_COP,"[POLÍCIA] Ladrão que mata Ladrão, 100 anos de perdão! [Recompensa: 3.000$]");}
	    }
		else if(GetPlayerWantedLevel(killerid) == 4)
		{
	    if(gTeam[killerid] == TEAM_COPS)
		{
	    GivePlayerMoney(killerid,4000);
	  	SetPlayerWantedLevel(playerid, 0);
		SendClientMessage(killerid, COLOR_COP,"[POLÍCIA] Ladrão que mata Ladrão, 100 anos de perdão! [Recompensa: 4.000$]");}
	    }
		else if(GetPlayerWantedLevel(killerid) == 5)
		{
	    if(gTeam[killerid] == TEAM_COPS)
		{
	    GivePlayerMoney(killerid,5000);
	  	SetPlayerWantedLevel(playerid, 0);
		SendClientMessage(killerid, COLOR_COP,"[POLÍCIA] Ladrão que mata Ladrão, 100 anos de perdão! [Recompensa: 5.000$]");}
	    }
		else if(GetPlayerWantedLevel(killerid) == 6)
		{
	    if(gTeam[killerid] == TEAM_COPS)
		{
	    GivePlayerMoney(killerid,6000);
	  	SetPlayerWantedLevel(playerid, 0);
		SendClientMessage(killerid, COLOR_COP,"[POLÍCIA] Ladrão que mata Ladrão, 100 anos de perdão! [Recompensa: 6.000$]");}
		}
	return 1;
}


public OnPlayerEnterCheckpoint(playerid)
{
	new string[256];
	new ownplayer[MAX_PLAYER_NAME];

	switch(getCheckpointType(playerid))
	{
		case CP_BANK: {
			ShowMenuForPlayer(banco,playerid);
 			TogglePlayerControllable(playerid, 0);
		}
		case CP_PIRATE: {
			SendClientMessage(playerid, COLOR_YELLOW, "[INFO]Você pode andar pelo Navio Pirata para ganhar dinheiro.");
		}
		case CP_AMMU: {
			ShowMenuForPlayer(respawnGun,playerid);
 			TogglePlayerControllable(playerid, 0);
		}
/*		case CP_DRAGON: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can buy the Four Dragons Casino for $75,000 with /buy.");
			SendClientMessage(playerid, COLOR_YELLOW, "You will earn $5,000 regularly.");

		}
		case CP_SEXSHOP: {
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
		case CP_GZ_AUTOBASE_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Auto Base:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $185000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 0;
		}
		case CP_GZ_CONSTRUCAO_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Construção:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $175000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 1;
		}
		case CP_GZ_RECINTO_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Recinto:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $200000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 2;
		}
		case CP_GZ_FABRICA_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Fabrica:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $250000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 3;
		}
		case CP_GZ_AEROPLACE_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Aero Place:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $190000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 4;
		}
		case CP_GZ_DISNEY_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Disney:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $270000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 5;
		}
		case CP_GZ_EXERCITO_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Exercito:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $180000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 6;
        }
 		case CP_GZ_CALIGULAS_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Caligulas:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $210000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 7;
		}
		case CP_GZ_GOLF_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Golf:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $190000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 8;
		}
		case CP_GZ_LV:
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[GZ]: Gang Zona Bairro Policial:");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Valor: $190000, Para comprar digite /gang zona comprar");
			SendClientMessage(playerid, COLOR_YELLOW, "[GZ]: Ganhe dinheiro + recuperação de vida ficando nela");
            gz = 9;
		}
	}

	if(getCheckpointType(playerid) >= P_OFFSET)
	{

        if(gz == 555)
        {
			format(string, sizeof(string), "<PROPRIEDADES> Você pode comprar o %s o $%d com /comprar.", propertyNames[playerCheckpoint[playerid]-P_OFFSET], propertyValues[playerCheckpoint[playerid]-P_OFFSET]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			format(string, sizeof(string), "<PROPRIEDADES> E ficar ganhando $%d regurlamente.", propertyEarnings[playerCheckpoint[playerid]-P_OFFSET]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		if(propertyOwner[playerCheckpoint[playerid]-P_OFFSET] < 999)
		{
			GetPlayerName(propertyOwner[playerCheckpoint[playerid]-P_OFFSET], ownplayer, sizeof(ownplayer));
			format(string, sizeof(string), "[PROPRIEDADE]: Essa propriedade é atualmente de %s.", ownplayer);
			SendClientMessage(playerid, COLOR_RED, string);
		}
		else if(GZ_EXISTE[gz][0] == 1)
		{
			format(string, sizeof(string), "[GZ]: Essa Gang Zona é atualmente da Gang: %s.", gangNames[gangZonaId[gz]]);
			SendClientMessage(playerid, COLOR_RED, string);
		}
    }
}

/*
strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}*/


public OnPlayerRequestClass(playerid, classid)
{
    PlayerPlaySound(playerid,1097, 0.0, 0.0, 0.0);
	if(classid == 0 || classid == 1 || classid == 2 || classid == 3 || classid == 4 || classid == 5 || classid == 6)
	{
		iSpawnSet[playerid] = 1;
	}
	else
	{
		iSpawnSet[playerid] = 0;
	}
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
	SetPlayerCameraPos(playerid, -2672.529541, 1410.453491, 912.723999);
    SetPlayerCameraLookAt(playerid, -2676.433349, 1410.398925, 912.723999);
    SetPlayerPos(playerid, -2676.433349, 1410.398925, 912.723999);
    SetPlayerInterior(playerid, 3);
    SetPlayerFacingAngle(playerid, 266.910003);
		       if(wybor[playerid] == 0){
			ApplyAnimation(playerid,"DANCING","DAN_LOOP_A",4.0,1,0,0,0,-1);
	}else if(wybor[playerid] == 1){
			ApplyAnimation(playerid,"DANCING","DNCE_M_A",4.0,1,0,0,0,-1);
	}else if(wybor[playerid] == 2){
			ApplyAnimation(playerid,"DANCING","DNCE_M_B",4.0,1,0,0,0,-1);
	}else if(wybor[playerid] == 3){
			ApplyAnimation(playerid,"DANCING","DNCE_M_C",4.0,1,0,0,0,-1);
	}else if(wybor[playerid] == 4){
			ApplyAnimation(playerid,"DANCING","DNCE_M_D",4.0,1,0,0,0,-1);
	}else if(wybor[playerid] == 5){
			ApplyAnimation(playerid,"DANCING","DNCE_M_E",4.0,1,0,0,0,-1);
	}
}

public GameModeExitFunc()
{
	GameModeExit();
}

public OnGameModeInit()
{

CreateObject(3997, 3053.711182, -1897.023193, 47.199677, 0.0000, 0.8594, 0.0000);
CreateObject(3997, 3009.993652, -1503.419312, 45.466515, 0.0000, 358.2811, 191.2500);
CreateObject(3997, 1455.434082, 1248.115967, 165.946701, 0.0000, 0.8594, 354.8434);
CreateObject(3997, 1503.134155, 1974.288208, 158.297760, 0.0000, 0.8594, 175.7029);
CreateObject(8040, 3765.612, -1877.323, 1799.874, 0.0, 0.0, 180.000);

CreateObject(980, 2294.268555, 2497.010254, -5.529761, 0.0000, 0.0000, 270.0000);

CreateObject(8417, 784.6934, -2047.0616, 57.7101, 0.0000, 0.0000, 0.0000); // rura



	SetGameModeText("BRASIL - Las Venturas BRASIL");
	SendRconCommand("mapname BRASIL - Las Venturas");
	SetTimer("FlashGzScoreUpdate", 2001, true);
  	SetTimer("RandomMSGs",120000,1);
	SetTimer("FlashGzScoreUpdate", 2001, true);
	ShowPlayerMarkers(1);
	ShowNameTags(1);
    	UsePlayerPedAnims();
    	SetDisabledWeapons(16,17,18,35,36,37,38,39,40,41,42,43,44,45);

        AddPlayerClass(285,1958.3783,1343.1572,15.3746,270.1425,25,50,24,300,4,1);
		AddPlayerClass(281,1958.3783,1343.1572,15.3746,270.1425,25,50,24,300,4,1);
		AddPlayerClass(282,1958.3783,1343.1572,15.3746,270.1425,25,50,24,300,4,1);
		AddPlayerClass(283,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(284,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(280,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(286,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(54,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(254,1958.3783,1343.1572,15.3746,0.0,25,50,24,300,4,1);
		AddPlayerClass(255,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(256,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(257,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(258,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(259,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(260,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(261,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(262,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(263,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(264,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
	    AddPlayerClass(265,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
	    AddPlayerClass(266,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
	    AddPlayerClass(267,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
	    AddPlayerClass(269,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
	    AddPlayerClass(270,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
	    AddPlayerClass(271,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
	    AddPlayerClass(272,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(274,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(275,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(276,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(1,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(2,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(290,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(291,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(292,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(293,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(294,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(295,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(296,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(297,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(298,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(299,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(277,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(278,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(279,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(288,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(47,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(48,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(49,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(50,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(51,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(52,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(53,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(54,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(55,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(56,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(57,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(58,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(59,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(60,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(61,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(62,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(63,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(64,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(66,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(67,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(68,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(69,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(70,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(71,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(72,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(73,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(75,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(76,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(78,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(79,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(80,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(81,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(82,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(83,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(84,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(85,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(87,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(88,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(89,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(91,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(92,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(93,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(95,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(96,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(97,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(98,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(99,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(100,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(101,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(102,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(103,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(104,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(105,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(106,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(107,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(108,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(109,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(110,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(111,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(112,1958.3783,1343.1572,15.3746,269.1425,25,0,24,300,4,1);
		AddPlayerClass(113,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(114,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(115,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(116,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(117,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(118,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(120,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(121,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(122,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(123,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(124,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(125,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(126,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(127,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(128,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(129,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(131,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(133,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(134,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(135,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(136,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(137,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(138,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(139,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(140,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(141,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(142,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(143,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(144,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(145,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(146,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(147,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(148,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(150,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(151,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(152,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(153,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(154,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(155,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(156,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(157,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(158,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(159,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(160,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(161,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(162,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(163,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(164,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(165,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(166,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(167,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(168,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(169,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(170,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(171,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(172,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(173,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(174,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(175,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(176,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(177,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(178,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(179,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(180,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(181,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(182,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(183,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(184,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(185,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(186,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(187,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(188,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(189,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(190,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(191,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(192,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(193,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(194,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(195,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(196,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(197,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(198,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(199,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(200,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(201,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(202,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(203,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(204,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(205,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(206,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(207,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(209,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(210,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(211,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(212,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(213,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(214,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(215,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(216,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(217,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(218,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(219,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(220,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(221,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(222,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(223,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(224,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(225,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(226,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(227,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(228,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(229,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(230,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(231,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(232,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(233,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(234,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(235,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(236,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(237,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(238,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(239,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(240,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(241,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(242,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(243,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(244,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(245,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(246,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(247,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(248,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(249,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(250,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(251,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);
		AddPlayerClass(253,1958.3783,1343.1572,15.3746,269.1425,25,50,24,300,4,1);

	AddPlayerClass(102,2080.9138,1234.9226,10.8203,87.7354,24,300,26,300,32,300); // ballas
	AddPlayerClass(103,2080.9138,1234.9226,10.8203,87.7354,24,300,26,300,32,300); // ballas
	AddPlayerClass(104,2080.9138,1234.9226,10.8203,87.7354,24,300,26,300,32,300); // ballas
	AddPlayerClass(105,2011.8260,1167.7239,10.8203,265.4189,24,300,26,300,32,300); // groves
	AddPlayerClass(106,2011.8260,1167.7239,10.8203,265.4189,24,300,26,300,32,300); // groves
	AddPlayerClass(107,2011.8260,1167.7239,10.8203,265.4189,24,300,26,300,32,300); // groves
	AddPlayerClass(114,1958.2107,1342.6140,15.3746,276.8835,24,300,26,300,32,300); // aztecas
	AddPlayerClass(115,1958.2107,1342.6140,15.3746,276.8835,24,300,26,300,32,300); // aztecas	
	AddPlayerClass(116,1958.2107,1342.6140,15.3746,276.8835,24,300,26,300,32,300); // aztecas
	AddPlayerClass(108,2217.8467,1836.7902,10.8203,98.3052,24,300,26,300,32,300); // vagos
	AddPlayerClass(109,2217.8467,1836.7902,10.8203,98.3052,24,300,26,300,32,300); // vagos
	AddPlayerClass(110,2217.8467,1836.7902,10.8203,98.3052,24,300,26,300,32,300); // vagos

	AddStaticVehicle(403,1865.4496,-2349.4822,14.1680,259.2186,30,1); 
	AddStaticVehicle(591,1852.3140,-2365.8792,14.1725,262.0656,40,1); 
	AddStaticVehicle(403,1864.1525,-2355.2620,14.1874,259.6646,28,1); 
	AddStaticVehicle(591,1853.5797,-2359.5974,14.1633,260.5608,25,1); 
	AddStaticVehicle(403,1862.6393,-2361.0120,14.1744,260.1177,25,1); 
	AddStaticVehicle(591,1855.0759,-2353.6763,14.1737,260.0085,40,1); 
	AddStaticVehicle(403,1861.3846,-2367.0610,14.1839,260.5859,40,1); 
	AddStaticVehicle(591,1856.3413,-2348.1633,14.1743,261.8797,25,1); 
	AddStaticVehicle(411,2352.2371,1405.0573,42.5264,90.2985,0,0); 
	AddStaticVehicle(451,2351.9902,1408.6797,42.5273,90.6677,0,0); 
	AddStaticVehicle(562,2352.1814,1412.2368,42.5270,90.2153,0,0);
	AddStaticVehicle(411,2352.1287,1415.7332,42.5263,90.9367,1,1);
	AddStaticVehicle(451,2352.0107,1419.4139,42.5265,89.3646,1,1); 
	AddStaticVehicle(562,2351.9131,1422.9999,42.5244,89.9354,1,1); 
	AddStaticVehicle(411,2352.0408,1426.4596,42.5258,90.8589,3,3); 
	AddStaticVehicle(451,2351.8635,1430.1411,42.5251,89.4964,3,3); 
	AddStaticVehicle(562,2351.9297,1433.6470,42.5252,89.8994,3,3); 
	AddStaticVehicle(411,2352.1226,1437.2562,42.5229,89.7587,6,6); 
	AddStaticVehicle(451,2351.6555,1440.8265,42.5225,91.3665,6,6); 
	AddStaticVehicle(562,2351.9375,1444.4606,42.5223,88.9476,6,6); 
	AddStaticVehicle(411,2351.8154,1448.0217,42.5220,90.3109,55,55);
	AddStaticVehicle(451,2352.0625,1451.4989,42.5221,89.4194,55,55); 
	AddStaticVehicle(562,2351.6704,1455.0182,42.5217,90.2475,55,55); 
	AddStaticVehicle(411,2351.9219,1458.6002,42.5217,89.8370,106,106); 
	AddStaticVehicle(451,2351.5527,1462.1848,42.5224,90.2472,106,106); 
	AddStaticVehicle(562,2352.0122,1465.7083,42.5226,90.4291,106,106); 
	AddStaticVehicle(411,2352.0566,1469.2733,42.5216,90.1928,86,86); 
	AddStaticVehicle(451,2352.0710,1472.8157,42.5243,90.6432,86,86); 
	AddStaticVehicle(562,2352.4351,1476.5093,42.5271,90.4439,86,86); 
	AddStaticVehicle(411,2351.8518,1480.1700,42.5246,90.6011,126,126); 
	AddStaticVehicle(451,2351.7839,1483.7279,42.5238,89.8509,126,126); 
	AddStaticVehicle(562,2352.4299,1487.2451,42.5270,90.2292,126,126); 
	AddStaticVehicle(403,1865.4496,-2349.4822,14.1680,259.2186,30,1); 
	AddStaticVehicle(591,1852.3140,-2365.8792,14.1725,262.0656,40,1); 
	AddStaticVehicle(403,1864.1525,-2355.2620,14.1874,259.6646,28,1); 
	AddStaticVehicle(591,1853.5797,-2359.5974,14.1633,260.5608,25,1); 
	AddStaticVehicle(403,1862.6393,-2361.0120,14.1744,260.1177,25,1); 
	AddStaticVehicle(591,1855.0759,-2353.6763,14.1737,260.0085,40,1); 
	AddStaticVehicle(403,1861.3846,-2367.0610,14.1839,260.5859,40,1); 
	AddStaticVehicle(591,1856.3413,-2348.1633,14.1743,261.8797,25,1); 
	AddStaticVehicle(535,2002.0654,1542.9290,11.0,180.1496,123,1); 
	AddStaticVehicle(411,2179.1169,1985.1921,9.0,359.2931,116,1); 
	AddStaticVehicle(429,2040.5247,1359.2783,10.3516,177.1306,13,13);
	AddStaticVehicle(411,2074.9624,1479.2120,10.3990,359.6861,64,64);
	AddStaticVehicle(477,2075.6038,1666.9750,10.4252,359.7507,94,94);
	AddStaticVehicle(541,2156.9863,1877.3251,10.3626,355.2554,22,22); 
	AddStaticVehicle(541,1843.7881,1216.0122,10.4556,270.8793,60,1);
	AddStaticVehicle(402,1944.1003,1344.7717,8.9411,0.8168,30,30);
	AddStaticVehicle(402,1679.2278,1316.6287,10.6520,180.4150,90,90);
	AddStaticVehicle(415,1685.4872,1751.9667,10.5990,268.1183,25,1);
	AddStaticVehicle(411,2034.5016,1912.5874,11.9048,0.2909,123,1);
	AddStaticVehicle(477,2361.1538,1993.9761,10.4260,178.3929,101,1);
	AddStaticVehicle(550,2221.9946,1998.7787,9.6815,92.6188,53,53);
	AddStaticVehicle(558,2243.3833,1952.4221,14.9761,359.4796,116,1);
	AddStaticVehicle(587,2276.7085,1938.7263,31.5046,359.2321,40,1);
	AddStaticVehicle(587,2602.7769,1853.0667,10.5468,91.4813,43,1);
	AddStaticVehicle(603,2610.7600,1694.2588,10.6585,89.3303,69,1);
	AddStaticVehicle(587,2635.2419,1075.7726,10.5472,89.9571,53,1);
	AddStaticVehicle(562,2577.2354,1038.8063,10.4777,181.7069,35,1);
	AddStaticVehicle(562,2394.1021,989.4888,10.4806,89.5080,17,1);
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
	AddStaticVehicle(522,1430.2354,1999.0144,10.3896,352.0951,6,25);
	AddStaticVehicle(522,2156.3540,2188.6572,10.2414,22.6504,6,25);
	AddStaticVehicle(598,2277.6846,2477.1096,10.5652,180.1090,0,1);
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
	AddStaticVehicle(476,1283.0006,1324.8849,9.5332,275.0468,7,6); 
	AddStaticVehicle(476,1283.5107,1361.3171,9.5382,271.1684,1,6); 
	AddStaticVehicle(476,1283.6847,1386.5137,11.5300,272.1003,89,91);
	AddStaticVehicle(476,1288.0499,1403.6605,11.5295,243.5028,119,117);
	AddStaticVehicle(415,1319.1038,1279.1791,10.5931,0.9661,62,1);
	AddStaticVehicle(521,1710.5763,1805.9275,10.3911,176.5028,92,3);
	AddStaticVehicle(521,2805.1650,2027.0028,10.3920,357.5978,92,3);
	AddStaticVehicle(535,2822.3628,2240.3594,10.5812,89.7540,123,1);
	AddStaticVehicle(521,2876.8013,2326.8418,10.3914,267.8946,115,118);
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
	AddStaticVehicle(411,2159.9741,1679.5389,10.4185,357.1885,1,1);
	AddStaticVehicle(451,2040.0386,1653.4591,10.3792,359.8302,79,79);
	AddStaticVehicle(437,1710.1481,1405.8374,10.6991,193.6265,79,7); 
	AddStaticVehicle(411,2039.9469,1545.7806,10.3990,180.7205,0,0); 
	AddStaticVehicle(451,1549.6458,1761.7444,10.5272,90.9068,17,17); 
	AddStaticVehicle(451,2074.8157,898.6442,7.4879,359.5331,0,0); 
	AddStaticVehicle(411,1549.9321,1749.8345,10.5497,89.0242,103,103); 
	AddStaticVehicle(451,2154.8567,1930.3225,10.3785,359.1350,1,1); 
	AddStaticVehicle(522,2120.1614,1997.0994,10.2370,180.5200,39,106); 
	AddStaticVehicle(522,2040.0809,1572.1965,10.2358,179.8560,8,82); 
	AddStaticVehicle(522,2040.0068,930.5211,8.9203,178.2754,7,79); 
	AddStaticVehicle(522,2074.6401,1098.9933,10.2407,1.4506,51,118); 
	AddStaticVehicle(577,1585.5986,1190.2456,10.7286,180.1558,8,90); 
	AddStaticVehicle(519,1586.8156,1322.6884,11.7790,82.0903,1,1); 
	AddStaticVehicle(477,2127.8650,2356.0232,10.4247,90.0219,121,1); 
	AddStaticVehicle(587,2507.1523,2129.0764,10.5455,90.2096,53,1); 
	AddStaticVehicle(587,2119.9453,2192.9199,10.3976,180.4125,75,1); 
	AddStaticVehicle(587,1118.0139,2082.1289,10.5448,90.4963,95,1); 
	AddStaticVehicle(587,2074.7827,1007.1943,10.3976,359.4707,43,1); 
	AddStaticVehicle(471,2186.8079,1979.0967,10.3011,89.6490,103,111); 
	AddStaticVehicle(471,2132.1855,987.1296,10.3004,359.0639,74,83); 
	AddStaticVehicle(463,2097.3857,1748.5403,10.2127,331.0270,22,22); 
	AddStaticVehicle(571,2103.2686,2082.4375,10.1041,269.5041,36,2); 
	AddStaticVehicle(571,2103.2310,2092.2458,10.1041,269.1364,36,2); 
	AddStaticVehicle(560,1906.7535,2067.3171,10.5252,90.1521,52,39); 
	AddStaticVehicle(541,2542.4736,1146.9819,10.4454,89.9722,2,1); 
	AddStaticVehicle(541,1687.3281,2054.8601,11.0936,271.7800,22,1); 
	AddStaticVehicle(415,1612.7511,1839.3645,10.5912,179.8788,20,1); 
	AddStaticVehicle(415,2039.9611,1128.5100,10.4433,180.5408,25,1); 
	AddStaticVehicle(415,2440.9790,2017.1779,10.5927,90.3130,20,1); 
	AddStaticVehicle(602,2237.2454,2157.3071,10.6263,89.7384,18,1); 
	AddStaticVehicle(602,2217.0896,1518.3475,10.6269,0.7072,45,45); 
	AddStaticVehicle(506,2154.7847,2073.3750,10.3762,359.2907,3,3); 
	AddStaticVehicle(559,2040.0531,1500.8274,10.3763,179.7427,22,1); 
	AddStaticVehicle(424,2017.2650,1518.3552,10.5358,270.2770,2,2); 
	AddStaticVehicle(601,2275.7725,2426.7134,10.5791,90.0111,1,1); 
	AddStaticVehicle(416,1597.9032,1831.2577,10.9746,359.7894,1,3); 
	AddStaticVehicle(407,2042.8149,2037.7301,11.0573,269.9823,3,1); 
	AddStaticVehicle(406,2122.5503,1327.5961,12.3463,89.2181,1,1); 
	AddStaticVehicle(406,1849.2371,918.0832,12.3337,179.9994,1,1); 
	AddStaticVehicle(537,2864.7500,1255.4480,12.3495,180.0000,121,50); 
	AddStaticVehicle(570,2864.7500,1255.4480,12.3495,180.0000,1,1); 
	AddStaticVehicle(570,2864.7500,1255.4480,12.3495,180.0000,1,1); 
	AddStaticVehicle(570,2864.7500,1255.4480,12.3495,180.0000,1,1); 
	AddStaticVehicle(444,3120.1143,-1919.5477,47.5751,1.0702,32,42); // 
	AddStaticVehicle(444,3119.8828,-1851.5461,47.5786,180.3492,32,42); // 
	AddStaticVehicle(444,3026.8618,-1919.7672,48.9739,359.1466,32,42); // 
	AddStaticVehicle(444,3075.5342,-1916.7117,48.2439,2.7173,32,42); // 
	AddStaticVehicle(444,2989.0808,-1919.3568,49.5318,1.4959,32,42); // 
	AddStaticVehicle(444,2987.1189,-1855.0587,49.5701,175.5320,32,42); // 
	AddStaticVehicle(444,3004.9863,-1851.1771,49.3020,182.4403,32,42); // 
	AddStaticVehicle(444,3069.7290,-1468.4946,44.8759,189.5876,32,42); // 
	AddStaticVehicle(444,3034.1851,-1475.6213,45.9637,197.0765,32,42); // 
	AddStaticVehicle(444,2978.2419,-1487.4061,47.6793,184.2366,32,42); // 
	AddStaticVehicle(444,2939.1072,-1493.4489,48.8663,191.5841,32,42); // 
	AddStaticVehicle(444,770.8682,-2058.0168,59.0502,268.7279,32,66); //
	AddStaticVehicle(444,770.8039,-2048.5679,59.0501,270.2384,32,14); //
	AddStaticVehicle(444,770.2087,-2038.3152,59.0502,270.1417,32,32); //
	AddStaticVehicle(444,800.5687,-2038.1445,59.0502,91.4016,32,36); //
	AddStaticVehicle(444,800.6011,-2048.1790,59.0502,91.3654,32,42); //
	AddStaticVehicle(444,801.2690,-2057.9897,59.0502,88.9257,32,53); //
	AddStaticVehicle(559,-1946.2416,273.2482,35.1302,126.4200,60,1); 
	AddStaticVehicle(558,-1956.8257,271.4941,35.0984,71.7499,24,1); 
	AddStaticVehicle(562,-1952.8894,258.8604,40.7082,51.7172,17,1); 
	AddStaticVehicle(411,-1949.8689,266.5759,40.7776,216.4882,112,1);
	AddStaticVehicle(429,-1988.0347,305.4242,34.8553,87.0725,2,1); 
	AddStaticVehicle(460,-1333.1960,903.7660,1.5568,0.5095,46,32);
	AddStaticVehicle(411,113.8611,1068.6182,13.3395,177.1330,116,1); 
	AddStaticVehicle(567,1112.3754,1747.8737,10.6923,270.9278,102,114); 
	AddStaticVehicle(567,1641.6802,1299.2113,10.6869,271.4891,97,96); 
	AddStaticVehicle(567,2135.8757,1408.4512,10.6867,180.4562,90,96); 
	AddStaticVehicle(567,2461.7380,1345.5385,10.6975,0.9317,114,1); 
	AddStaticVehicle(567,2093.2102,2025.9210,10.5365,88.3264,93,64);
	AddStaticVehicle(567,2785.0261,-1835.0374,9.6874,226.9852,93,64); 
	AddStaticVehicle(567,2787.8975,-1876.2583,9.6966,0.5804,99,81); 
	AddStaticVehicle(598,2277.6675,2459.3044,10.5660,180.2361,1,1); 
	AddStaticVehicle(598,2273.7192,2443.3677,10.5642,180.1955,0,1);  
	AddStaticVehicleEx(522,1094.3090,1331.1816,10.3909,270.7792,0,0,180);
	AddStaticVehicleEx(522,1094.3389,1333.2981,10.3874,268.2021,0,0,180);
	AddStaticVehicleEx(560,743.4614,-1333.2864,13.3980,179.5963,0,0,180);
	AddStaticVehicleEx(522,733.9857,-1349.0807,13.0786,269.5284,0,0,180);
	AddStaticVehicleEx(444,2375.9072,1917.1604,6.3869,271.2040,0,0,180);
	AddStaticVehicleEx(522,2456.0193,1873.3590,7.7358,357.2753,0,0,180);
	AddStaticVehicleEx(522,2844.6602,953.5024,10.3209,83.4449,0,0,180);
	AddStaticVehicleEx(522,2844.8013,956.5333,10.3244,85.3959,0,0,180);
	AddStaticVehicleEx(444,972.3351,2082.4543,11.2167,181.9569,0,0,180);
	AddStaticVehicleEx(444,966.0824,2083.0264,11.1916,180.5991,0,0,180);
	AddStaticVehicle(522,2129.1926,-2462.3215,13.0832,88.0845,7,79); 
	AddStaticVehicle(522,2134.2981,-2458.5723,13.0926,79.5182,7,79); 
	AddStaticVehicle(522,2142.1299,-2460.1262,13.0823,78.1541,7,79); 
	AddStaticVehicle(522,2143.6670,-2470.6387,13.0920,86.8083,7,79); 
	AddStaticVehicle(522,2138.1104,-2483.2097,13.0656,79.9313,7,79); 
	AddStaticVehicle(522,2144.7585,-2484.4714,13.0851,79.3655,7,79); 
	AddStaticVehicle(522,2135.3889,-2489.9619,13.0830,88.0600,7,79); 
	AddStaticVehicle(522,2147.7288,-2491.1663,13.0837,102.3506,7,79); 
	AddStaticVehicle(446,2221.955,495.382,1.015,0.0,-1,-1);
	AddStaticVehicle(446,2241.030,460.818,1.042,270.0,-1,-1);
	AddStaticVehicle(446,2222.984,527.389,-0.513,0.0,-1,-1);
	AddStaticVehicle(446,2161.100,502.125,0.067,0.0,-1,-1);
	AddStaticVehicle(446,2220.902,464.667,1.026,271.0,-1,-1);
	AddStaticVehicle(446,2221.739,456.860,0.997,270.0,-1,-1);
	AddStaticVehicle(559,423.533,2524.998,16.250,89.0,-1,-1);
	AddStaticVehicle(559,423.435,2521.151,16.238,90.0,-1,-1);
	AddStaticVehicle(559,423.429,2516.763,16.238,89.0,-1,-1);
	AddStaticVehicle(559,423.264,2512.547,16.238,89.0,-1,-1);
	AddStaticVehicle(559,423.149,2508.180,16.238,89.0,-1,-1);
	AddStaticVehicle(559,430.912,2516.089,16.238,0.0,-1,-1);
	AddStaticVehicle(416,2088.7236,1251.6112,11.3381,89.5307,1,3); // ambulancia
	AddStaticVehicle(451,2201.7244,1821.6042,10.5274,359.3078,4,5); // 
	AddStaticVehicle(451,2202.5696,1878.6240,10.5273,358.5127,1,8); // 
	AddStaticVehicle(451,2188.9885,1855.8627,10.5276,181.4166,2,3); // 
	AddStaticVehicle(522,3098.8379,-1850.3688,47.0935,182.7747,7,79); // moto
	AddStaticVehicle(522,3109.2896,-1850.0535,46.9299,175.2270,7,79); // moto
	AddStaticVehicle(522,3113.3628,-1921.5876,46.8678,5.1109,7,79); // moto
	AddStaticVehicle(522,3085.2004,-1919.6212,47.2733,357.5040,7,79); // moto
	AddStaticVehicle(522,3040.9299,-1922.1592,47.9698,1.3113,7,79); // moto
	AddStaticVehicle(522,2987.6304,-1909.2826,48.7635,275.3664,7,79); // moto
	AddStaticVehicle(522,3017.3921,-1850.3488,48.3110,176.1545,7,79); // moto
	AddStaticVehicle(522,3023.3872,-1849.4856,48.2266,192.6297,7,79); // moto
	AddStaticVehicle(522,2975.8169,-1558.6367,47.3613,356.8740,7,79); // moto
	AddStaticVehicle(522,2951.2263,-1551.0065,48.0380,280.6971,7,79); // moto
	AddStaticVehicle(522,2946.5999,-1490.2683,47.8249,195.6348,7,79); // moto
	AddStaticVehicle(522,2968.7808,-1486.1301,47.1518,188.9587,7,79); // moto
	AddStaticVehicle(522,3020.9631,-1475.7200,45.5515,179.0193,7,79); // moto
	AddStaticVehicle(522,3073.6792,-1478.9063,44.0159,99.5164,7,79); // moto
	AddStaticVehicle(522,3083.1208,-1538.5339,44.0986,11.4216,7,79); // moto
	AddStaticVehicle(522,3053.4197,-1542.5159,44.9881,11.2507,7,79); // moto
	AddStaticVehicle(451,1394.5251,1299.6969,167.6327,174.0542,0,0); // carrao
	AddStaticVehicle(451,1388.7416,1235.6973,167.6327,355.9092,0,0); // carrao
	AddStaticVehicle(451,1428.2506,1228.1205,167.0338,352.4890,0,0); // carrao
	AddStaticVehicle(451,1442.1256,1229.2096,166.8268,351.5408,0,0); // carrao
	AddStaticVehicle(451,1511.3425,1287.4875,165.8726,176.4801,0,0); // carrao
	AddStaticVehicle(451,1518.1067,1220.1251,165.6781,354.6846,0,0); // carrao
	AddStaticVehicle(427,2284.5498,2038.4546,10.9522,270.5026,0,0); // Bope
	AddStaticVehicle(490,2245.5759,2042.4193,10.4877,270.7340,0,0); // 
	AddStaticVehicle(490,2233.3855,2063.7754,10.9479,178.4034,0,0); // bope
	AddStaticVehicle(428,2217.3545,2059.3560,10.9495,90.1094,0,0); // bope
	AddStaticVehicle(427,2262.6348,2062.8950,10.9522,179.0956,0,0); // 
	AddStaticVehicle(497,2268.9536,2040.1827,14.4717,167.7243,0,0); // policia
	AddStaticVehicle(528,2235.7983,2046.6250,10.8632,89.5832,2,0); // 
	AddStaticVehicle(528,2253.8899,2063.3071,10.8641,179.3090,2,0); // 
	AddStaticVehicle(528,2139.0034,1830.3962,10.7159,335.3402,2,0); // 
	AddStaticVehicle(528,2039.2758,1409.1658,10.7145,181.9185,2,0); // 
	AddStaticVehicle(528,2075.5991,1302.4181,10.7154,1.7144,2,0); // 
	AddStaticVehicle(528,2038.8571,1010.0114,10.7143,179.0206,2,0); // 
	AddStaticVehicle(428,2106.1250,1835.9442,10.7968,150.9558,0,0); // 
	AddStaticVehicle(427,2119.6365,2085.9150,10.8036,181.2213,0,0); // 
	AddStaticVehicle(490,2102.0847,2056.0356,10.9489,270.2866,0,0); // 
	AddStaticVehicle(490,2224.4316,2129.4119,10.9530,270.3862,0,0); //
	AddStaticVehicle(415,2039.0494,950.5674,9.8268,180.1152,3,2); // Cheetah
	AddStaticVehicle(535,2075.5933,1180.5372,10.4430,359.5875,5,0); // slamvan
	AddStaticVehicle(535,2120.2244,1398.2201,10.5773,358.9955,3,3); // Slamvan
	AddStaticVehicle(481,2149.0547,2468.5164,10.3275,181.6812,0,0); // 
	AddStaticVehicle(481,2152.5002,2468.4473,10.3298,1.8333,0,0); // 
	AddStaticVehicle(509,2089.4065,2469.0962,10.3334,177.4763,0,0); // 
	AddStaticVehicle(509,2082.9856,2479.3020,10.3292,5.7694,3,3); // 
	AddStaticVehicle(454,1998.1097,1505.2682,8.7782,87.4073,1,1); // 
	AddStaticVehicle(433,2581.7761,2275.1492,11.2568,270.0155,1,1); // 
	AddStaticVehicle(433,384.1449,1912.8053,18.0773,90.1072,1,1); // lol
	AddStaticVehicle(433,381.5498,1960.3663,18.0773,86.6422,1,1); // lol
	AddStaticVehicle(433,383.2309,1993.0575,18.0815,273.0933,1,1); // lol
	AddStaticVehicle(433,345.4542,1869.0408,18.1928,96.3535,1,1); // 
	AddStaticVehicle(470,344.3622,1859.5676,18.2360,88.4538,1,1); // 
	AddStaticVehicle(470,346.4105,1829.0659,17.6889,92.6204,1,1); // 
	AddStaticVehicle(548,340.1178,1989.5483,19.2251,172.9251,1,1); // 
	AddStaticVehicle(548,309.2301,1811.6407,19.3003,3.5199,1,1); // 
	AddStaticVehicle(432,196.9949,1959.5979,17.6566,266.3682,1,1); // 
	AddStaticVehicle(432,195.8680,2002.2609,17.6625,267.6934,1,1); // 
	AddStaticVehicle(520,279.8994,1990.7952,18.3639,271.7633,0,0); // 
	AddStaticVehicle(520,281.2141,1957.2197,18.3569,266.8848,0,0); // 
	AddStaticVehicle(520,280.0372,2024.3923,18.3639,266.2697,0,0); // 
	AddStaticVehicle(520,308.3060,2048.8306,18.3638,178.6082,0,0); // 
	AddStaticVehicle(535,2061.7139,2479.7529,10.5843,359.4728,3,3); // 
	AddStaticVehicle(535,2153.5054,2475.5784,10.5831,268.9443,6,6); // 
	AddStaticVehicle(434,2076.3276,2468.6958,10.7781,181.0824,1,1); // 
	AddStaticVehicle(434,2091.3923,2480.4080,10.7834,358.8078,1,1); // 
	AddStaticVehicle(568,2049.1707,2479.9121,10.6867,3.2728,0,0); // 
	AddStaticVehicle(568,2152.0745,2494.6206,10.6879,270.8755,0,0); // 
	AddStaticVehicle(588,2035.9546,1196.6758,10.7223,1.8449,0,0); // 
	AddStaticVehicle(598,2260.8013,2460.0969,10.5621,359.9281,0,1); // 
	AddStaticVehicle(528,2291.0425,2477.3960,10.8641,180.4203,2,0); //
	AddStaticVehicle(598,2255.4653,2443.0386,10.5669,359.7079,0,1); // daki pa baico
	AddStaticVehicle(528,2256.7080,2477.3506,10.8666,359.9681,2,0); // 
	AddStaticVehicle(523,2278.5874,2459.8113,10.3834,359.3410,0,0); // 
	AddStaticVehicle(568,1899.1997,2423.9773,10.6846,266.0511,0,0); // 	
	AddStaticVehicle(568,2008.1853,2420.0547,10.6876,274.7185,0,0); // 
	AddStaticVehicle(568,2155.9758,2119.2576,10.5375,178.7755,0,0); // 
	AddStaticVehicle(568,2076.3713,1778.8132,10.5397,155.0563,0,0); // 
	AddStaticVehicle(568,2102.3894,2309.0095,10.6080,352.2816,0,0); // 
	AddStaticVehicle(535,2205.4363,2476.4470,10.5803,4.4640,3,3); // 
	AddStaticVehicle(535,2195.6128,2503.9561,10.5835,0.7904,3,3); // 
	AddStaticVehicle(535,2317.2117,2309.4524,10.5836,180.0818,3,3); // 
	AddStaticVehicle(535,2371.4331,2391.9744,10.5851,91.7700,3,3); // 
	AddStaticVehicle(434,2214.5583,2350.0989,10.6859,133.3856,1,1); // 
	AddStaticVehicle(434,2180.4719,2339.1343,10.6371,96.7663,1,1); // 
	AddStaticVehicle(434,2171.2292,1972.9187,10.7808,270.4029,1,1); // 
	AddStaticVehicle(434,2187.0200,2000.7980,10.7806,271.2369,1,1); // 
	AddStaticVehicle(434,2077.1245,941.7814,9.8505,4.4250,1,1); // 
	AddStaticVehicle(434,2037.6370,1255.2991,10.7048,356.5383,1,1); // 
	AddStaticVehicle(444,2039.0029,1233.6492,11.0807,187.1949,32,42); // 
	AddStaticVehicle(536,1901.9144,2410.8530,10.5578,88.4827,5,5); // 
	AddStaticVehicle(412,1902.9440,2420.0349,10.6570,276.8138,3,3); // 
	AddStaticVehicle(429,1977.4303,2445.6401,10.5000,2.7827,2,2); // 
	AddStaticVehicle(411,3792.4087,-1891.5886,1799.8354,1.2212,2,2); // azul
	AddStaticVehicle(411,3790.8716,-1862.9266,1799.8431,181.7921,4,4); // Verde
	AddStaticVehicle(415,3753.8921,-1862.7197,1799.8790,177.5615,3,3); // Vermeio
	AddStaticVehicle(415,3744.1111,-1890.9628,1799.8796,1.8193,6,6); // Amarelo
	AddStaticVehicle(565,3769.8008,-1891.3160,1799.7333,358.5294,0,0); // 
	AddStaticVehicle(522,3763.4114,-1881.7334,1799.6720,359.6259,5,5); // axul
	AddStaticVehicle(522,3751.1108,-1873.5441,1799.6786,357.4097,4,4); // verde
	AddStaticVehicle(559,3763.6296,-1872.6703,1799.7646,1.1526,126,126); // red

	AddStaticPickup(371, 2, 1710.3359,1614.3585,10.1191); 
	AddStaticPickup(371, 2, 1964.4523,1917.0341,130.9375); 
	AddStaticPickup(371, 2, 2055.7258,2395.8589,150.4766); 
	AddStaticPickup(371, 2, 2265.0120,1672.3837,94.9219); 
	AddStaticPickup(371, 2, 2265.9739,1623.4060,94.9219); 
	AddStaticPickup(1240, 2, 2027.8984,1540.1429,13.1209);
	AddStaticPickup(1240, 2, 2029.8223,1550.5073,13.1209);
	AddStaticPickup(1242, 2, 2237.4761,2458.2991,13.4420);
	AddStaticPickup(1242, 2, 2171.8682,2000.5773,10.8203);
	AddStaticPickup(1241, 2, 2089.9534,1514.5883,10.8203);
	AddStaticPickup(1240, 2 ,2090.9460,1237.4027,11.4114); 


Object_Object();
CreateDynamicObject(1634, 2074.904541, 822.594971, 6.789537, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2070.791504, 822.527222, 6.807756, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2066.618896, 822.553833, 6.782002, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2062.478516, 822.470093, 6.824310, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2058.319336, 822.508301, 6.802071, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2054.132568, 822.524963, 6.780580, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2049.964600, 822.552734, 6.784520, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2045.798340, 822.601257, 6.767775, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2074.839355, 816.920532, 10.304287, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2070.757080, 816.914307, 10.281685, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2066.587402, 816.928162, 10.305397, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2062.583984, 816.900085, 10.343784, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2058.446289, 816.900696, 10.367556, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2054.282227, 816.874207, 10.429983, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2050.171631, 816.823975, 10.441653, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2045.987549, 816.848572, 10.400913, 12.8916, 0.0000, 180.0000);
CreateDynamicObject(1634, 2074.810547, 811.501770, 15.244659, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(1634, 2070.615234, 811.522949, 15.231055, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(1634, 2066.482910, 811.456421, 15.285906, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(1634, 2062.468018, 811.432983, 15.327478, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(1634, 2058.322998, 811.386475, 15.388652, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(1634, 2054.145264, 811.402466, 15.408869, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(1634, 2050.370850, 811.298462, 15.512169, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(1634, 2046.302246, 811.314392, 15.470062, 22.3454, 0.0000, 180.0000);
CreateDynamicObject(621, 2110.074707, 2062.291504, 39.000156, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3887, 2010.409546, 813.444519, 15.154552, 0.0000, 353.1245, 270.0000);
CreateDynamicObject(8493, 2092.557129, 882.536133, 22.914217, 357.4217, 3.4377, 177.4215);
CreateDynamicObject(13592, 2077.536377, 1129.135132, 19.615934, 0.0000, 359.1406, 271.7189);
CreateDynamicObject(16080, 2033.527832, 1199.981812, 9.203638, 359.1406, 6.8755, 78.7500);
CreateDynamicObject(10830, 2190.489990, 1986.917236, 18.352928, 0.0000, 0.0000, 315.0000);
CreateDynamicObject(16395, 2032.972290, 845.442505, 33.836117, 0.8594, 13.7510, 90.0001);
CreateDynamicObject(1736, 2297.192871, 2451.548828, 14.033128, 0.0000, 0.0000, 270.0000);
CreateDynamicObject(3867, 2035.027954, 1689.199829, 24.807550, 0.0000, 0.0000, 90.0000);
CreateDynamicObject(3867, 2034.964478, 1649.258057, 24.807550, 0.0000, 0.0000, 90.0001);
CreateDynamicObject(3461, 2036.826172, 1165.471069, 11.395324, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3528, 2020.393555, 1001.336853, 20.960333, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3864, 2028.481445, 956.616638, 15.396529, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(7073, 2102.845947, 2127.114990, 35.846848, 0.0000, 0.0000, 33.7500);
CreateDynamicObject(7392, 2070.247314, 2128.536865, 27.300171, 0.0000, 0.0000, 315.0000);
CreateDynamicObject(13667, 2088.935059, 1388.925293, 25.709023, 0.0000, 0.0000, 236.2501);
CreateDynamicObject(16776, 1820.706543, 1352.172974, 5.487475, 0.0000, 0.0000, 270.0000);
CreateDynamicObject(16776, 1798.741333, 1359.845703, 4.887772, 0.0000, 0.0000, 90.0000);
CreateDynamicObject(13641, 1806.112915, 1321.198120, 7.336240, 0.0000, 0.0000, 87.4217);
CreateDynamicObject(13641, 1805.387695, 1384.267944, 7.436237, 0.0000, 359.1406, 268.2811);
CreateDynamicObject(1634, 1784.397949, 1302.921509, 6.856693, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 1788.524048, 1302.893311, 6.839311, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 1792.211304, 1244.778931, 6.731691, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1634, 1788.083496, 1244.739868, 6.706691, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13641, 2122.241699, 2046.801025, 11.391119, 0.0000, 0.0000, 90.0000);
CreateDynamicObject(13641, 2121.623047, 2063.738281, 11.391119, 0.0000, 0.0000, 90.0000);
CreateDynamicObject(13641, 2120.759521, 2100.771240, 11.366119, 0.0000, 0.0000, 270.0000);
CreateDynamicObject(1634, 2085.116211, 1559.513062, 10.867635, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1634, 2080.970703, 1559.565430, 10.892633, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1634, 2080.898682, 1565.997070, 10.917634, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2085.057861, 1566.066040, 10.892633, 0.0000, 0.0000, 180.0000);
CreateDynamicObject(1634, 2034.648071, 1425.288452, 11.067631, 2.5783, 0.0000, 180.0000);
CreateDynamicObject(1634, 2034.658569, 1421.360474, 14.656351, 23.2048, 0.0000, 180.0000);
CreateDynamicObject(1634, 2034.692871, 1418.123779, 18.949602, 32.6586, 0.0000, 180.0000);
CreateDynamicObject(1634, 2034.686157, 1415.794556, 23.688082, 44.6907, 0.0000, 180.0000);
CreateDynamicObject(1634, 2085.474121, 1013.539734, 11.142630, 3.4377, 0.0000, 0.0000);
CreateDynamicObject(1634, 2081.313965, 1013.480042, 11.117629, 3.4377, 0.0000, 0.0000);
CreateDynamicObject(1634, 2085.456299, 1018.594238, 15.241318, 23.2048, 0.0000, 0.0000);
CreateDynamicObject(1634, 2081.343018, 1018.597534, 15.208147, 22.3454, 0.0000, 0.0000);
CreateDynamicObject(13592, 2115.914063, 1936.801392, 19.565928, 0.0000, 0.0000, 281.2500);
CreateDynamicObject(1634, 2119.675049, 1925.669678, 10.969193, 4.2972, 0.0000, 188.6716);
CreateDynamicObject(1634, 2123.050781, 1926.160400, 10.969193, 4.2972, 0.0000, 188.6716);
CreateDynamicObject(1634, 2120.304688, 1921.024292, 14.750849, 22.3454, 0.0000, 188.6716);
CreateDynamicObject(1634, 2123.814209, 1921.585693, 14.730281, 22.3454, 0.0000, 188.6716);
CreateDynamicObject(1634, 2085.362549, 1309.167480, 11.117630, 4.2972, 0.0000, 180.0000);
CreateDynamicObject(1634, 2085.379639, 1304.762573, 15.100114, 26.6425, 0.0000, 180.0000);
CreateDynamicObject(1634, 2085.443359, 1301.589478, 20.076160, 38.6747, 0.0000, 180.0000);
CreateDynamicObject(1634, 2081.230713, 1309.201172, 11.117630, 4.2972, 0.0000, 180.0000);
CreateDynamicObject(1634, 2081.302002, 1304.814819, 15.053499, 26.6425, 0.0000, 180.0000);
CreateDynamicObject(1634, 2081.255127, 1301.687012, 20.060045, 38.6747, 0.0000, 180.0000);
CreateDynamicObject(1634, 2015.467163, 2456.601074, 11.214937, 4.2972, 0.8594, 90.0000);
CreateDynamicObject(1634, 2015.507568, 2452.454346, 11.239937, 4.2972, 0.8594, 90.0000);
CreateDynamicObject(1634, 2015.520386, 2448.305420, 11.276140, 4.2972, 0.8594, 90.0000);
CreateDynamicObject(1634, 2010.538452, 2456.513184, 14.937681, 18.9076, 0.0000, 90.0000);
CreateDynamicObject(1634, 2010.540039, 2452.351563, 14.896759, 18.9076, 0.0000, 90.0000);
CreateDynamicObject(1634, 2010.572754, 2448.209717, 14.869700, 18.9076, 0.0000, 90.0000);
CreateDynamicObject(1634, 2139.620117, 1815.770508, 11.042631, 3.4377, 0.0000, 337.5000);
CreateDynamicObject(1634, 2141.258545, 1819.580078, 15.113880, 33.5180, 0.0000, 337.5000);
CreateDynamicObject(1634, 2142.002197, 1821.271240, 19.122595, 44.6907, 0.0000, 337.5000);
CreateDynamicObject(13641, 2142.254395, 1821.708618, 25.248119, 1.7189, 298.9801, 67.5000);
CreateDynamicObject(1634, 2032.112427, 1065.510010, 11.217628, 4.2972, 0.0000, 180.0000);
CreateDynamicObject(1634, 2032.167847, 1061.905396, 15.430328, 35.2369, 0.0000, 180.0000);
CreateDynamicObject(1634, 2032.148682, 1060.368164, 20.306295, 56.7228, 0.0000, 180.0000);
CreateDynamicObject(1634, 2032.146118, 1060.684814, 24.193092, 81.6464, 0.0000, 180.0000);
CreateDynamicObject(1634, 2032.196533, 1062.686890, 29.045933, 94.5380, 0.0000, 180.0000);
CreateDynamicObject(1634, 2032.159302, 1066.113525, 33.493576, 113.4455, 359.1406, 180.0000);
CreateDynamicObject(1634, 2032.121704, 1071.229004, 36.069881, 146.9638, 0.0000, 180.0000);
CreateDynamicObject(1634, 2086.048828, 1711.297363, 11.092630, 2.5783, 0.0000, 337.5000);
CreateDynamicObject(1634, 2087.631348, 1715.175659, 14.958016, 30.9397, 0.0000, 337.5000);
CreateDynamicObject(1634, 2088.772949, 1717.842285, 20.156542, 41.2530, 0.0000, 337.5000);
CreateDynamicObject(13592, 2082.627930, 1712.610107, 29.105009, 6.8755, 65.3171, 249.2189);
CreateDynamicObject(1634, 2122.841309, 830.611572, 6.881692, 0.8594, 0.0000, 270.0000);
CreateDynamicObject(1634, 2171.302734, 832.164551, 7.056693, 3.4377, 0.0000, 90.0000);
CreateDynamicObject(1634, 1940.776489, 856.258667, 6.801961, 0.0000, 0.0000, 90.0000);
CreateDynamicObject(1634, 1940.785767, 852.122742, 6.798986, 0.0000, 0.0000, 90.0000);
CreateDynamicObject(1634, 1940.701050, 847.967773, 6.823986, 0.0000, 0.0000, 90.0000);
CreateDynamicObject(1634, 1895.131226, 855.965515, 8.344061, 0.0000, 0.0000, 270.0000);
CreateDynamicObject(1634, 1895.141479, 851.804321, 8.342909, 0.0000, 0.0000, 270.0000);
CreateDynamicObject(1634, 1895.123047, 847.793396, 8.344332, 0.0000, 0.0000, 270.0000);
CreateDynamicObject(13592, 1787.625854, 855.308044, 19.367510, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13592, 1786.588013, 848.333008, 19.367510, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13592, 1785.580566, 841.584961, 19.424107, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13592, 1784.427368, 834.180420, 19.354614, 0.0000, 0.0000, 0.0000);
//
CreateDynamicObject(18450,3691.241,-1877.027,1778.758,0.0,-30.080,0.0);
CreateDynamicObject(18450,3626.156,-1876.962,1741.048,0.0,-30.080,0.0);
CreateDynamicObject(18450,3557.563,-1876.949,1701.284,0.0,-30.080,0.0);
CreateDynamicObject(18450,3491.165,-1876.956,1657.315,0.0,-36.956,0.0);
CreateDynamicObject(18450,3427.323,-1876.966,1609.275,0.0,-36.956,0.0);
CreateDynamicObject(18450,3357.464,-1876.958,1574.192,0.0,-16.329,0.0);
CreateDynamicObject(18450,3395.242,-1876.944,1588.339,0.0,-27.502,0.0);
CreateDynamicObject(18450,3283.363,-1876.941,1545.641,0.0,-25.783,0.0);
CreateDynamicObject(18450,3212.075,-1876.954,1511.194,0.0,-25.783,0.0);
CreateDynamicObject(18450,3176.446,-1876.957,1493.982,0.0,-25.783,0.0);
CreateDynamicObject(18450,3140.744,-1876.964,1476.936,0.0,-18.048,0.0);
CreateDynamicObject(18450,3141.846,-1876.992,1478.626,0.0,-21.486,0.0);
CreateDynamicObject(18450,3068.325,-1877.011,1444.564,0.0,-30.080,0.0);
CreateDynamicObject(18450,3002.223,-1877.019,1400.063,0.0,-37.815,0.0);
CreateDynamicObject(18450,2939.394,-1877.009,1351.302,0.0,-37.815,0.0);
CreateDynamicObject(18450,2878.147,-1877.007,1303.761,0.0,-37.815,0.0);
CreateDynamicObject(18450,2816.449,-1877.016,1255.876,0.0,-37.815,0.0);
CreateDynamicObject(18450,2761.629,-1877.025,1213.324,0.0,-37.815,0.0);
CreateDynamicObject(18450,2701.657,-1877.017,1160.716,0.0,-44.691,0.0);
CreateDynamicObject(18450,2646.906,-1877.007,1106.543,0.0,-44.691,0.0);
CreateDynamicObject(18450,2591.467,-1876.998,1051.681,0.0,-44.691,0.0);
CreateDynamicObject(18450,2534.942,-1876.976,995.709,0.0,-44.691,0.0);
CreateDynamicObject(18450,2481.326,-1876.987,936.743,0.0,-50.707,0.0);
CreateDynamicObject(18450,2432.500,-1876.998,877.052,0.0,-50.707,0.0);
CreateDynamicObject(18450,2383.269,-1876.983,816.874,0.0,-50.707,0.0);
CreateDynamicObject(18450,2337.084,-1876.981,751.933,0.0,-58.442,0.0);
CreateDynamicObject(18450,2297.643,-1876.982,687.719,0.0,-58.442,0.0);
CreateDynamicObject(18450,2256.316,-1876.974,620.429,0.0,-58.442,0.0);
CreateDynamicObject(18450,2216.011,-1876.988,554.791,0.0,-58.442,0.0);
CreateDynamicObject(18450,2177.145,-1877.013,491.509,0.0,-58.442,0.0);
CreateDynamicObject(18450,2141.771,-1877.048,420.242,0.0,-68.755,0.0);
CreateDynamicObject(18450,2113.308,-1877.051,346.987,0.0,-68.755,0.0);
CreateDynamicObject(18450,2085.731,-1877.046,276.045,0.0,-68.755,0.0);
CreateDynamicObject(18450,2058.108,-1877.063,204.959,0.0,-68.755,0.0);
CreateDynamicObject(18450,2030.834,-1877.064,134.747,0.0,-68.755,0.0);
CreateDynamicObject(18450,2003.157,-1877.058,63.577,0.0,-68.755,0.0);
CreateDynamicObject(18450,1990.246,-1877.062,33.884,0.0,-18.048,0.0);
CreateDynamicObject(18450,1989.127,-1877.065,37.310,0.0,-41.253,0.0);
CreateDynamicObject(18450,1963.068,-1877.068,26.964,0.0,2.578,0.0);
CreateDynamicObject(18450,1968.747,-1877.086,28.383,0.0,-12.032,0.0);
CreateDynamicObject(18450,1992.916,-1877.086,42.161,0.0,-46.410,0.0);
CreateDynamicObject(1225,1925.809,-1883.917,29.594,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.396,-1877.178,29.410,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.444,-1873.733,29.408,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.214,-1871.556,29.418,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.591,-1873.847,29.401,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.936,-1874.487,29.386,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.547,-1875.452,29.403,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.338,-1876.663,29.413,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.197,-1877.947,29.419,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.157,-1878.592,29.421,0.0,0.0,0.0);
CreateDynamicObject(1225,1924.971,-1879.234,29.429,0.0,0.0,0.0);
CreateDynamicObject(1225,1924.990,-1880.472,29.428,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.034,-1881.187,29.426,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.333,-1881.613,29.615,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.408,-1882.252,29.612,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.131,-1882.688,29.624,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.319,-1883.185,30.216,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.438,-1874.419,29.408,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.038,-1872.733,29.426,0.0,0.0,0.0);
CreateDynamicObject(1225,1924.561,-1870.495,29.448,0.0,0.0,0.0);
CreateDynamicObject(1225,1924.040,-1871.229,29.471,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.616,-1872.229,29.400,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.448,-1876.002,29.408,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.872,-1872.929,29.389,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.263,-1875.015,29.416,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.310,-1877.634,29.996,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.025,-1879.365,29.860,0.0,0.0,0.0);
CreateDynamicObject(1225,1924.819,-1879.769,29.436,0.0,0.0,0.0);
CreateDynamicObject(1225,1924.690,-1871.286,29.442,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.389,-1881.350,30.059,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.243,-1882.275,29.619,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.339,-1882.917,29.615,0.0,0.0,0.0);
CreateDynamicObject(1225,1925.860,-1883.276,30.192,0.0,0.0,0.0);
CreateDynamicObject(1225,1907.538,-1887.584,17.022,0.0,0.0,0.0);
CreateDynamicObject(1225,1906.827,-1888.134,16.705,0.0,0.0,0.0);
CreateDynamicObject(1225,2901.744,-1881.111,1322.915,0.0,0.0,0.0);
CreateDynamicObject(1225,3163.084,-1872.661,1488.315,0.0,0.0,0.0);
CreateDynamicObject(1225,3523.917,-1880.023,1682.599,0.0,0.0,0.0);
CreateDynamicObject(18450,1981.957,-1877.087,34.200,0.0,-28.361,0.0);
//
CreateDynamicObject(9767, 2208.003906, 1102.401978, 85.922997, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(10008, 2216.333984, 1065.839966, 97.376999, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(16082, 2209.990967, 1061.609009, 89.634003, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(18368, 2190.314941, 1067.067993, 81.112999, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(1340, 2212.913086, 1077.160034, 92.551003, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1340, 2211.092041, 1077.171021, 92.551003, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3819, 2166.745117, 1075.189941, 79.552002, 0.0000, 0.0000, 157.4995);
CreateDynamicObject(3819, 2166.854980, 1066.312012, 79.626999, 0.0000, 356.5623, 201.7204);
CreateDynamicObject(13642, 2220.208008, 1031.651978, 80.557999, 0.0000, 357.4217, 13.8304);
CreateDynamicObject(3375, 2255.407959, 1041.281006, 82.252998, 0.0000, 0.0000, 11.2520);
CreateDynamicObject(4106, 2287.952881, 1064.889038, 83.913002, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(3867, 2297.002930, 1075.386963, 69.095001, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(5130, 2287.316895, 1065.338989, 78.483002, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(9767, 2306.486084, 1097.172974, 62.525002, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(10008, 2310.722900, 1090.109985, 67.442001, 0.0000, 0.0000, 191.2525);
CreateDynamicObject(9766, 2271.379883, 1105.116943, 66.535004, 0.0000, 0.0000, 247.4997);
CreateDynamicObject(8615, 2237.298096, 1119.812012, 66.341003, 0.0000, 0.0000, 157.4995);
CreateDynamicObject(5130, 2231.995117, 1114.590942, 65.050003, 0.0000, 0.0000, 202.4996);
CreateDynamicObject(11496, 2222.997070, 1114.410034, 59.549000, 0.0000, 0.0000, 157.4995);
CreateDynamicObject(11544, 2218.366943, 1110.254028, 58.688999, 0.0000, 0.0000, 337.4999);
CreateDynamicObject(13749, 2205.355957, 1109.213989, 64.261002, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(18368, 2201.783936, 1099.196045, 66.474998, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(3361, 2219.624023, 1089.863037, 68.810997, 0.0000, 0.0000, 56.2522);
CreateDynamicObject(4106, 2235.429932, 1115.006958, 58.299999, 0.0000, 0.0000, 146.2524);
CreateDynamicObject(9766, 2229.396973, 1106.791992, 45.713001, 13.7501, 0.0000, 326.2528);
CreateDynamicObject(9767, 2243.645996, 1148.609009, 34.862000, 0.0000, 0.0000, 157.4995);
CreateDynamicObject(10009, 2244.180908, 1121.991943, 37.109001, 0.0000, 0.0000, 146.2524);
CreateDynamicObject(970, 2213.752930, 1092.433960, 87.904999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(969, 2187.436035, 1077.406982, 85.637001, 0.0000, 0.0000, 101.2523);
CreateDynamicObject(969, 2186.991943, 1078.902954, 85.734001, 0.0000, 0.0000, 277.8149);
CreateDynamicObject(976, 2235.479004, 1118.041016, 48.025002, 60.1597, 359.1406, 244.0620);
CreateDynamicObject(1632, 2263.770020, 1108.483032, 66.699997, 0.0000, 0.0000, 67.4993);
CreateDynamicObject(3850, 1360.253052, 2192.299072, 10.569000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3850, 1390.687988, 2159.696045, 10.569000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8150, 1359.959961, 2099.617920, 13.207000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8150, 1296.811035, 2162.893066, 13.220000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3819, 1392.685059, 2175.145996, 14.247000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 1392.573975, 2161.878906, 14.247000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 1362.338989, 2194.478027, 14.247000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3819, 1375.748047, 2194.384033, 14.247000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3399, 1390.159058, 2193.591064, 11.842000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(8356, 1408.051025, -2493.660889, 21.174000, 42.9710, 0.0000, 89.9994);
CreateDynamicObject(8356, 1408.390991, -2493.561035, 20.844999, 344.5301, 0.0000, 269.9998);
CreateDynamicObject(8356, 1410.781982, -2493.570068, 20.180000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(8356, 1418.630981, -2493.593994, 20.177999, 339.3735, 0.0000, 269.9998);
CreateDynamicObject(8356, 1428.338989, -2493.535889, 20.177999, 347.9679, 0.0000, 89.9994);
CreateDynamicObject(8357, 1390.140991, -2493.746094, 37.845001, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 1290.854004, -2493.752930, 175.341003, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 1178.402954, -2493.816895, 330.937988, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 1087.130005, -2493.766113, 457.299988, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 967.877991, -2493.621094, 622.372009, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 852.729980, -2493.646973, 781.752991, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 734.518005, -2493.665039, 945.351013, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 627.737976, -2493.561035, 1093.050049, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 508.842010, -2493.531006, 1257.614014, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 412.550995, -2493.616943, 1390.879028, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 303.545013, -2493.769043, 1541.719971, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 188.358994, -2493.832031, 1701.110962, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, 78.692001, -2493.739990, 1852.821045, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -34.441002, -2493.961914, 2009.369019, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -130.164993, -2493.711914, 2141.822998, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -235.156006, -2493.672119, 2287.125000, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -335.601013, -2493.718994, 2426.166016, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -430.617004, -2493.812012, 2557.666992, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -537.698975, -2493.788086, 2705.937988, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -635.525024, -2493.954102, 2841.395020, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -723.651001, -2493.864014, 2963.365967, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -827.184998, -2493.788086, 3106.690918, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -932.372986, -2493.824951, 3252.185059, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -1048.723022, -2493.819092, 3413.174072, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -1166.597046, -2493.679932, 3576.272949, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -1290.456055, -2493.738037, 3747.675049, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -1387.432983, -2493.735107, 3881.920898, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -1484.282959, -2493.709961, 4015.998047, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -1590.652954, -2493.632080, 4163.208008, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8357, -1677.995972, -2493.584961, 4284.095215, 54.1437, 0.0000, 89.9994);
CreateDynamicObject(8040, -1780.286011, -2494.056885, 4371.104004, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8407, -1741.406006, -2504.496094, 4371.813965, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8841, -1812.218018, -2494.258057, 4373.291016, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1655, 1519.369995, -2477.855957, 39.532001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1655, 1519.431030, -2486.650879, 39.551998, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1655, 1519.416016, -2495.450928, 39.546001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1655, 1519.503052, -2504.177002, 39.566002, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(10948, 1564.847046, -2487.623047, 11.421000, 0.0000, 0.0000, 316.1687);
CreateDynamicObject(18261, -2057.467041, -232.384995, 34.887001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(18261, -2058.048096, -209.554001, 34.868999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1503, -1291.814941, 20.320000, 13.393000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(1503, -1290.918945, 21.216999, 14.295000, 14.6096, 1.7180, 315.8593);
CreateDynamicObject(12956, -1448.526001, -92.624001, 16.427000, 0.0000, 0.0000, 11.2520);
CreateDynamicObject(13590, -1381.453979, -284.421997, 25.688000, 0.0000, 0.0000, 56.2522);
CreateDynamicObject(13593, -1439.182007, -105.223999, 13.891000, 11.1718, 0.0000, 134.9995);
CreateDynamicObject(13641, -1428.441040, 64.014000, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1440.449951, 51.277000, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1452.577026, 38.397999, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1464.592041, 25.612000, 14.860000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1493.276001, -6.069000, 14.868000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(13641, -1279.212036, -43.770000, 14.868000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(13641, -1255.968018, -41.813000, 14.868000, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(13641, -1255.470947, -18.549000, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1279.276978, -20.200001, 14.868000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(13643, -1436.162964, -261.167999, 25.733999, 0.0000, 0.0000, 101.2523);
CreateDynamicObject(13645, -1407.197021, -263.997986, 25.180000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13647, -1408.000977, -189.973007, 24.433001, 0.0000, 0.0000, 247.4997);
CreateDynamicObject(13648, -1422.015015, -223.813004, 24.433001, 0.0000, 0.0000, 337.4999);
CreateDynamicObject(16084, -1360.607056, -373.588013, 24.163000, 351.4056, 333.3575, 289.9215);
CreateDynamicObject(16302, -1290.145996, -545.991028, 18.983000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(16367, -1161.526001, -166.005997, 14.757000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(18367, -1359.344971, -386.752991, 39.599998, 0.0000, 0.0000, 11.2520);
CreateDynamicObject(18451, -1321.234009, -560.117981, 13.661000, 0.0000, 0.0000, 303.7527);
CreateDynamicObject(1631, -1429.858032, -159.944000, 25.198000, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(1634, -1328.595947, -260.636993, 14.521000, 6.0152, 0.0000, 134.9995);
CreateDynamicObject(1634, -1331.168945, -263.213989, 17.576000, 26.6417, 0.0000, 134.9995);
CreateDynamicObject(1632, -1324.933960, -257.041992, 12.746000, 347.1084, 0.0000, 134.9995);
CreateDynamicObject(13592, -1324.906982, -261.229004, 26.868999, 0.0000, 55.8625, 45.8587);
CreateDynamicObject(13592, -1319.286987, -266.753998, 27.757999, 0.0000, 55.8625, 45.8587);
CreateDynamicObject(13666, -1340.779053, -307.489014, 29.268000, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(13666, -1336.980957, -306.002991, 29.292999, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(13666, -1333.241943, -304.527008, 29.368000, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(13666, -1329.255981, -303.462006, 29.518000, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(13666, -1325.506958, -302.010010, 29.768000, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(1634, -1320.952026, -307.509003, 25.735001, 0.0000, 0.0000, 202.4996);
CreateDynamicObject(13666, -1344.765991, -308.575989, 29.368000, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(13666, -1348.397949, -310.106995, 29.292999, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(1894, -1210.144043, -230.108994, 13.148000, 0.0000, 0.0000, 123.7523);
CreateDynamicObject(2931, -1388.463013, -290.274994, 23.166000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(3363, -1154.314941, -213.171997, 13.109000, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(3625, -1122.104980, -194.093994, 15.579000, 0.0000, 0.0000, 303.7527);
CreateDynamicObject(13636, -1471.171021, -243.968994, 26.518000, 0.0000, 0.0000, 168.7524);
CreateDynamicObject(13638, -1470.975952, -227.860992, 28.468000, 0.0000, 0.0000, 258.7526);
CreateDynamicObject(13638, -1118.464966, -202.511993, 17.191999, 0.0000, 0.0000, 123.7523);
CreateDynamicObject(13638, -1131.254028, -207.151001, 24.212999, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(13638, -1126.214966, -203.468994, 32.023998, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(13638, -1130.598999, -206.895996, 39.379002, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(13638, -1134.276001, -195.643997, 45.140999, 0.0000, 0.0000, 303.7527);
CreateDynamicObject(13638, -1124.610962, -192.998993, 52.625000, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(13639, -1294.390991, -321.095001, 24.264999, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13640, -1283.493042, -284.842010, 24.757999, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(3627, -1196.291016, -97.474998, 20.833000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(5401, -1663.218018, -171.403000, 15.301000, 1.7180, 23.2039, 44.9993);
CreateDynamicObject(11494, -1186.751953, 29.737000, 13.141000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(11494, -1194.381958, 22.035000, 13.141000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(11494, -1202.137939, 14.395000, 13.141000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(969, -1206.984009, 11.781000, 13.315000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(969, -1201.698975, 18.983999, 10.340000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(969, -1209.084961, 17.780001, 13.315000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(969, -1201.542969, 15.499000, 13.315000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(969, -1201.135010, 19.767000, 10.206000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(969, -1194.715942, 23.709000, 13.315000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(969, -1196.875000, 29.996000, 13.446000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(970, -1187.738037, 28.586000, 13.700000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(3665, -1230.435059, -131.479004, 14.030000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(1655, -1241.838989, -143.485992, 13.924000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(1655, -1228.739990, -142.289993, 13.924000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(1655, -1221.907959, -135.320007, 13.924000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(1655, -1234.479980, -123.367996, 13.949000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(1655, -1241.358032, -130.358002, 13.949000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(1697, -1182.291016, -88.323997, 24.135000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(3776, -1704.659058, -223.787994, 22.200001, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(8342, -1657.302002, -634.172974, 16.249001, 0.0000, 0.0000, 56.2522);
CreateDynamicObject(8342, -1593.683960, -647.697998, 16.249001, 0.0000, 0.0000, 236.2526);
CreateDynamicObject(10009, -1628.244995, -681.229004, 17.709000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(13641, -1528.452026, -21.129000, 14.868000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(13641, -1451.285034, 61.521999, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1463.191040, 48.858002, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1475.208008, 36.063000, 14.860000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1486.839966, 23.287001, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1499.197021, 10.610000, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(13641, -1511.432983, -2.450000, 14.868000, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(5126, -1610.053955, -240.399002, 28.232000, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(1503, -1566.431030, -196.996994, 13.388000, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(1503, -1567.397949, -198.020996, 14.329000, 13.7501, 0.0000, 134.9995);
CreateDynamicObject(16395, -1246.557983, -53.838001, 23.827999, 0.0000, 17.1879, 224.9997);
CreateDynamicObject(16395, -1109.010010, 79.804001, 80.101997, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(16395, -963.645020, 221.365005, 105.764999, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(16481, -1223.953979, -345.614014, 17.570999, 0.0000, 0.0000, 247.4997);
CreateDynamicObject(3256, -1227.766968, -362.286011, 22.504000, 0.0000, 0.0000, 236.2526);
CreateDynamicObject(1632, -1267.178955, -359.518005, 14.224000, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(1634, -1259.332031, -456.875000, 14.216000, 0.0000, 0.0000, 236.2526);
CreateDynamicObject(13592, -1260.396973, -451.375000, 23.590000, 358.2811, 318.7470, 329.6905);
CreateDynamicObject(13592, -1251.707031, -447.423004, 27.139999, 0.0000, 311.0121, 326.2528);
CreateDynamicObject(13592, -1244.453003, -443.191986, 30.587999, 0.0000, 311.0121, 326.2528);
CreateDynamicObject(1634, -2034.581055, 448.945007, 139.714996, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1634, -2037.776978, 448.946991, 142.018005, 15.4690, 0.0000, 89.9994);
CreateDynamicObject(1634, -2039.692993, 448.977997, 144.705994, 34.3766, 0.0000, 89.9994);
CreateDynamicObject(1634, -2041.537964, 448.967010, 149.317993, 61.8786, 0.0000, 89.9994);
CreateDynamicObject(1634, -2029.151978, 448.889008, 163.061996, 136.6496, 0.0000, 89.9994);
CreateDynamicObject(1634, -2027.706055, 448.906006, 162.511993, 156.4166, 0.0000, 89.9994);
CreateDynamicObject(1634, -2024.120972, 448.903992, 161.759003, 177.9026, 0.0000, 89.9994);
CreateDynamicObject(1634, -2019.089966, 448.898987, 158.619003, 195.0913, 0.0000, 89.9994);
CreateDynamicObject(1634, -2016.583984, 448.901001, 156.117996, 211.4206, 0.0000, 89.9994);
CreateDynamicObject(1634, -2015.269043, 448.894012, 153.697998, 224.3121, 0.0000, 89.9994);
CreateDynamicObject(1634, -2014.098999, 448.903992, 148.750000, 240.6414, 0.0000, 89.9994);
CreateDynamicObject(1634, -2015.301025, 448.880005, 142.544006, 266.4245, 0.0000, 89.9994);
CreateDynamicObject(1634, -2016.248047, 448.886993, 142.457001, 291.3482, 0.0000, 89.9994);
CreateDynamicObject(1634, -2019.810059, 448.894012, 140.039001, 305.0992, 0.0000, 89.9994);
CreateDynamicObject(1634, -2024.313965, 448.886993, 138.389999, 324.0068, 0.0000, 89.9994);
CreateDynamicObject(1632, -2030.107056, 448.878998, 138.576996, 346.2490, 0.0000, 89.9994);
CreateDynamicObject(1655, -2066.941895, 491.739014, 139.692001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.958984, 494.817993, 141.703995, 13.7501, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.958984, 497.367004, 144.003006, 26.6417, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.997070, 500.721985, 148.839005, 38.6738, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.995117, 502.428986, 153.539001, 55.8625, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.000000, 502.765015, 158.085007, 78.2079, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.955078, 501.112000, 163.106003, 93.6778, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.929932, 499.368011, 166.246002, 106.5693, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.940918, 495.997986, 169.768997, 116.0231, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.979004, 490.604004, 173.455002, 130.6335, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.011963, 486.445007, 174.973999, 141.8062, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.035889, 481.786011, 175.792999, 155.5572, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.989014, 476.479004, 175.279007, 169.3082, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.197998, 472.046997, 173.981003, 177.9026, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.108887, 466.894989, 171.186005, 191.6535, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.072998, 463.920013, 168.649994, 201.1073, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.072998, 462.617004, 166.639999, 217.4366, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.093994, 461.006989, 163.292999, 227.7499, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.074951, 460.019012, 159.309006, 238.9226, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.086914, 460.260010, 157.632996, 254.3924, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.027100, 461.321991, 152.973007, 266.4245, 0.0000, 0.0000);
CreateDynamicObject(1655, -2067.075928, 462.920013, 149.550003, 281.8944, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.916992, 464.843994, 146.867004, 286.1916, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.947998, 469.509003, 142.511993, 301.6614, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.962891, 479.519012, 138.393005, 335.1795, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.884033, 486.537994, 138.494003, 342.9144, 0.0000, 0.0000);
CreateDynamicObject(1655, -2066.959961, 473.394989, 140.167007, 310.2558, 0.0000, 0.0000);
CreateDynamicObject(13592, -2031.151978, 443.191010, 158.063995, 351.4056, 269.7591, 179.1401);
CreateDynamicObject(988, -2023.901001, 433.420990, 138.684998, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(988, -2028.614014, 434.196014, 135.324005, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(988, -2034.796997, 434.196014, 132.285995, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(988, -2038.866943, 434.196014, 129.315002, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(988, -2042.723999, 434.196014, 126.245003, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(988, -2037.114014, 434.196014, 122.299004, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(988, -2042.322021, 434.196014, 119.134003, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(978, -2026.297974, 432.203003, 136.214996, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, -2032.136963, 433.740997, 133.182999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, -2036.293945, 432.785004, 130.209000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, -2045.540039, 434.196014, 127.119003, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(978, -2034.458984, 433.653992, 123.195999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, -2039.673950, 434.140015, 120.030998, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1634, -2084.780029, 426.972992, 115.889000, 0.0000, 0.0000, 78.7522);
CreateDynamicObject(1634, -2079.063965, 425.834991, 114.164001, 342.8113, 0.0000, 78.7522);
CreateDynamicObject(1634, -2087.627930, 427.539001, 118.178001, 22.3445, 0.0000, 78.7522);
CreateDynamicObject(1634, -2090.542969, 428.138000, 122.532997, 38.6738, 0.0000, 78.7522);
CreateDynamicObject(1634, -2091.834961, 428.410004, 125.561996, 53.2842, 0.0000, 78.7522);
CreateDynamicObject(1634, -2091.823975, 428.393005, 127.712997, 57.5814, 0.0000, 78.7522);
CreateDynamicObject(13641, -2090.997070, 428.252991, 130.445007, 0.8586, 291.2451, 168.7524);
CreateDynamicObject(1225, -2081.052002, 425.601013, 148.628006, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2092.631104, 428.398010, 143.992996, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2087.794922, 420.528015, 146.535995, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2085.697021, 433.333008, 146.169998, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2083.677979, 421.653992, 147.992004, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2081.966064, 430.910004, 147.800995, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2089.908936, 432.420990, 144.658997, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2091.541016, 422.584015, 144.932007, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -2085.658936, 542.072021, 109.351997, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.614014, 465.371002, 115.660004, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.635986, 466.764008, 116.309998, 7.7341, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.666016, 468.216003, 117.180000, 13.7501, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.649902, 469.661011, 118.345001, 21.4851, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.694092, 471.154999, 119.851997, 28.3606, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.724121, 472.056000, 121.327003, 39.5332, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.779053, 472.953003, 123.446999, 49.8465, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.827881, 473.545013, 125.609001, 56.7220, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.870117, 473.884003, 127.560997, 66.1758, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.873047, 473.946014, 128.934006, 73.9107, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.815918, 473.884003, 130.029007, 81.6456, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.840088, 473.950012, 130.358994, 91.0994, 0.0000, 0.0000);
CreateDynamicObject(13645, -2087.875977, 473.122986, 132.091003, 102.2721, 0.0000, 0.0000);
CreateDynamicObject(18367, -2087.654053, 437.291992, 124.752998, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(18367, -2088.156982, 437.438995, 124.790001, 0.0000, 0.0000, 56.2522);
CreateDynamicObject(18367, -2036.906982, 403.257996, 124.766998, 0.0000, 0.0000, 236.2526);
CreateDynamicObject(18367, -2058.420898, 382.270996, 121.563004, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(18367, -2084.823975, 394.678009, 113.821999, 351.4056, 0.0000, 67.4993);
CreateDynamicObject(18367, -2100.212891, 418.838013, 111.061996, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(1632, -2099.297119, 417.299988, 112.988998, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(13641, -2101.437988, 420.109009, 116.535004, 0.0000, 324.7631, 123.7523);
CreateDynamicObject(13647, -2107.729980, 437.252014, 123.066002, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13648, -2148.989990, 437.252014, 123.115997, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(13648, -2187.308105, 437.303986, 123.068001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(16430, 332.911011, -143.940002, 49.007000, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, 365.907990, -143.716995, 22.716000, 0.0000, 23.2039, 0.0000);
CreateDynamicObject(16430, 340.472992, -143.940994, 39.139000, 0.0000, 42.1116, 0.0000);
CreateDynamicObject(16430, 376.609009, -143.921005, 21.070000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(16430, 373.959015, -143.936996, 22.756001, 0.0000, 6.8747, 0.0000);
CreateDynamicObject(16430, 264.835999, -143.884995, 167.718994, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, 190.203003, -143.856003, 297.829010, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, 125.627998, -143.889999, 410.423004, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, 49.884998, -143.875000, 542.495972, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, -19.670000, -143.923004, 663.833008, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, -97.435997, -143.921997, 799.405029, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, -175.492004, -143.949997, 935.539001, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, -252.117004, -143.953995, 1069.159058, 0.0000, 60.1597, 0.0000);
CreateDynamicObject(16430, -345.294006, -143.966003, 1196.405029, 0.0000, 47.2682, 0.0000);
CreateDynamicObject(16430, -448.485992, -143.975998, 1308.157959, 0.0000, 47.2682, 0.0000);
CreateDynamicObject(16430, -553.614014, -143.975006, 1422.000977, 0.0000, 47.2682, 0.0000);
CreateDynamicObject(16430, -659.676025, -143.983002, 1536.854004, 0.0000, 47.2682, 0.0000);
CreateDynamicObject(16430, -765.520996, -143.925995, 1651.449951, 0.0000, 47.2682, 0.0000);
CreateDynamicObject(16430, -870.721008, -143.938995, 1765.349976, 0.0000, 47.2682, 0.0000);
CreateDynamicObject(16430, -1002.181030, -143.916000, 1844.233032, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(16430, -1151.696045, -143.901001, 1883.213989, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(16430, -1303.538940, -143.912994, 1922.842041, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(16430, -1449.290039, -143.860992, 1960.881958, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(16430, -1596.894043, -143.869995, 1999.411987, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(16430, -1747.697998, -143.882996, 2038.762939, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(16430, -1897.171021, -143.884995, 2077.741943, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(16430, -2053.739014, -143.886993, 2102.715088, 0.0000, 3.4369, 0.0000);
CreateDynamicObject(16430, -2210.947021, -143.869995, 2112.169922, 0.0000, 3.4369, 0.0000);
CreateDynamicObject(16430, -2367.947998, -143.830994, 2121.641113, 0.0000, 3.4369, 0.0000);
CreateDynamicObject(16430, -2520.533936, -143.841003, 2130.814941, 0.0000, 3.4369, 0.0000);
CreateDynamicObject(16430, -2678.793945, -143.815994, 2140.330078, 0.0000, 3.4369, 0.0000);
CreateDynamicObject(16430, -2827.872070, -143.822006, 2149.308105, 0.0000, 3.4369, 0.0000);
CreateDynamicObject(16430, -2987.251953, -143.837997, 2154.218018, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8040, -3106.002930, -143.591003, 2155.336914, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8040, 436.085999, -1136.198975, 2262.010010, 0.0000, 0.0000, 97.1155);
CreateDynamicObject(10757, 465.122009, -1146.827026, 2269.622070, 6.0152, 0.0000, 262.1273);
CreateDynamicObject(14467, 421.183990, -1101.371948, 2263.978027, 0.0000, 0.0000, 6.8747);
CreateDynamicObject(8841, 441.625000, -1172.734009, 2264.318115, 0.0000, 0.0000, 6.8747);
CreateDynamicObject(944, 442.523010, -1096.698975, 2262.079102, 0.0000, 0.0000, 6.8747);
CreateDynamicObject(8171, 425.087006, -1054.130005, 2207.052002, 308.4338, 0.0000, 7.7341);
CreateDynamicObject(8171, 419.257996, -1011.200012, 2154.406006, 323.0442, 0.0000, 7.7341);
CreateDynamicObject(8171, 405.697998, -911.476013, 2060.669922, 311.0121, 0.0000, 7.7341);
CreateDynamicObject(8171, 392.940002, -817.447998, 1971.766968, 322.1848, 0.0000, 7.7341);
CreateDynamicObject(8171, 385.941010, -766.065979, 1932.699951, 341.0924, 0.0000, 7.7341);
CreateDynamicObject(8171, 370.009003, -649.127991, 1865.555054, 319.6065, 0.0000, 7.7341);
CreateDynamicObject(8171, 348.958008, -494.173004, 1642.074951, 293.8234, 0.0000, 7.7341);
CreateDynamicObject(8171, 342.812988, -449.407990, 1539.667969, 293.8234, 0.0000, 7.7341);
CreateDynamicObject(8171, 336.717987, -404.756989, 1409.682983, 284.3696, 0.0000, 7.7341);
CreateDynamicObject(8171, 332.372986, -373.002991, 1284.647949, 284.3696, 0.0000, 7.7341);
CreateDynamicObject(8171, 327.200989, -334.959015, 1179.685059, 297.2611, 0.0000, 7.7341);
CreateDynamicObject(8171, 317.306000, -262.265015, 1075.078003, 311.8715, 0.0000, 7.7341);
CreateDynamicObject(8171, 304.664001, -169.537003, 995.077026, 325.6225, 0.0000, 7.7341);
CreateDynamicObject(8171, 289.347992, -56.595001, 944.776001, 346.2490, 0.0000, 7.7341);
CreateDynamicObject(8171, 272.046997, 70.700996, 896.421997, 332.4980, 0.0000, 7.7341);
CreateDynamicObject(8171, 255.727005, 190.834000, 833.299988, 332.4980, 0.0000, 7.7341);
CreateDynamicObject(8171, 239.182007, 312.479004, 778.237000, 339.3735, 0.0000, 7.7341);
CreateDynamicObject(8171, 222.473999, 435.372986, 718.322021, 329.0603, 0.0000, 7.7341);
CreateDynamicObject(8171, 206.919998, 549.893982, 649.028015, 329.0603, 0.0000, 7.7341);
CreateDynamicObject(8171, 191.037003, 666.726013, 578.335999, 329.0603, 0.0000, 7.7341);
CreateDynamicObject(8171, 177.264008, 767.999023, 488.630005, 308.4338, 0.0000, 7.7341);
CreateDynamicObject(8171, 171.363998, 811.564026, 435.179993, 313.5904, 0.0000, 7.7341);
CreateDynamicObject(8171, 164.188995, 864.064026, 379.612000, 313.5904, 0.0000, 7.7341);
CreateDynamicObject(8171, 151.820007, 954.520020, 283.696014, 313.5904, 0.0000, 7.7341);
CreateDynamicObject(8171, 139.365005, 1046.386963, 186.354996, 313.5904, 0.0000, 7.7341);
CreateDynamicObject(8171, 127.237000, 1135.969971, 91.375999, 313.5904, 0.0000, 7.7341);
CreateDynamicObject(8171, 120.682999, 1184.083984, 42.984001, 342.8113, 0.0000, 7.7341);
CreateDynamicObject(8171, 119.087997, 1195.916016, 4.894000, 21.4851, 0.0000, 7.7341);
CreateDynamicObject(1634, 103.524002, 1258.338013, 31.495001, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 107.575996, 1259.113037, 31.544001, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 111.672997, 1259.818970, 31.509001, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 115.682999, 1260.748047, 31.750000, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 99.511002, 1257.401978, 31.275000, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 119.835999, 1261.090942, 31.371000, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 123.900002, 1261.854980, 31.360001, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 127.863998, 1262.203979, 30.914000, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 95.468002, 1256.428955, 31.004999, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(1634, 91.429001, 1255.558960, 30.878000, 25.7823, 0.0000, 10.3124);
CreateDynamicObject(5112, 450.635010, -1239.171021, 2277.018066, 0.0000, 348.8273, 278.3535);
CreateDynamicObject(8040, 466.459991, -1353.126953, 2298.812012, 0.0000, 0.0000, 97.9749);
CreateDynamicObject(8210, 2176.799072, -1108.509033, 27.254999, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(8210, 2171.148926, -1085.762939, 16.820000, 0.0000, 89.3806, 67.4993);
CreateDynamicObject(8229, 2171.310059, -1090.031982, 35.219002, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(8210, 2249.080078, -1147.213989, 27.916000, 0.0000, 0.8586, 267.5017);
CreateDynamicObject(971, 2245.872070, -1073.151001, 44.655998, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(971, 2222.782959, -1053.634033, 48.674000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(971, 2179.599121, -1068.771973, 54.529999, 0.0000, 0.0000, 326.2528);
CreateDynamicObject(972, 2182.364990, -1009.666016, 61.870998, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3399, 2188.936035, -1045.229980, 51.716000, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(18253, 2203.071045, -1058.291992, 54.764000, 0.0000, 0.0000, 47.5776);
CreateDynamicObject(971, 2242.325928, -1081.545044, 44.570999, 0.0000, 0.0000, 202.4996);
CreateDynamicObject(8210, 2185.188965, -990.924011, 70.448997, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(8210, 2147.313965, -983.528992, 64.063004, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(8210, 2119.738037, -977.713013, 59.109001, 0.0000, 349.6868, 348.7528);
CreateDynamicObject(972, 2119.656006, -1009.625977, 60.341999, 0.0000, 0.0000, 72.6559);
CreateDynamicObject(974, 2128.229004, -1008.594971, 66.623001, 0.0000, 0.0000, 345.2349);
CreateDynamicObject(974, 2129.689941, -1008.463989, 67.839996, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(975, 2137.018066, -1008.710999, 67.208000, 0.0000, 0.0000, 342.7368);
CreateDynamicObject(973, 2107.189941, -1001.630005, 62.959999, 0.0000, 90.2400, 263.0498);
CreateDynamicObject(974, 2104.492920, -1002.567017, 60.332001, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(974, 2102.639893, -1000.715027, 60.332001, 0.0000, 0.0000, 247.4997);
CreateDynamicObject(976, 2090.954102, -971.268005, 55.272999, 0.0000, 85.9428, 332.4980);
CreateDynamicObject(983, 2091.874023, -971.065002, 56.091000, 0.0000, 0.0000, 303.7527);
CreateDynamicObject(983, 2079.724121, -968.289001, 56.102001, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(983, 2069.572021, -965.549988, 52.037998, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(971, 2082.590088, -993.335022, 55.243999, 0.0000, 0.0000, 347.0340);
CreateDynamicObject(971, 2065.577881, -991.442993, 49.620998, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(971, 2058.080078, -988.112000, 48.547001, 0.0000, 350.5462, 355.7028);
CreateDynamicObject(972, 2045.978027, -962.572021, 43.112000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(972, 2029.843018, -965.640015, 39.617001, 9.4530, 358.2811, 289.9215);
CreateDynamicObject(972, 2008.724976, -976.351990, 38.345001, 11.1718, 1.7180, 303.7527);
CreateDynamicObject(972, 1999.271973, -983.770996, 38.403000, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(971, 2045.932983, -991.406006, 50.867001, 0.0000, 0.0000, 67.4993);
CreateDynamicObject(971, 2043.931030, -990.184998, 51.033001, 0.0000, 0.0000, 11.2520);
CreateDynamicObject(971, 2036.449951, -993.140991, 48.896999, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(972, 2025.307007, -998.270996, 34.380001, 23.2039, 354.8434, 303.7527);
CreateDynamicObject(972, 2023.734009, -999.627014, 31.400000, 23.2039, 354.8434, 303.7527);
CreateDynamicObject(972, 1993.239990, -995.294006, 29.830999, 0.0000, 0.0000, 326.2528);
CreateDynamicObject(972, 1984.677002, -1008.664978, 26.240000, 8.5935, 0.0000, 327.9717);
CreateDynamicObject(972, 2007.834961, -1009.413025, 27.625999, 13.7501, 0.0000, 303.7527);
CreateDynamicObject(972, 1986.588013, -1026.457031, 24.155001, 0.0000, 0.0000, 247.4997);
CreateDynamicObject(972, 1993.000000, -1029.495972, 25.487000, 0.0000, 0.0000, 337.4999);
CreateDynamicObject(10830, 2217.304932, -1174.822021, 28.558001, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(967, 2234.447998, -1149.639038, 24.851999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(967, 2209.706055, -1144.178955, 24.802999, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(5837, 2224.462891, -1165.430054, 26.018999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(849, 2199.493896, -1117.905029, 24.452999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(850, 2219.510986, -1098.276978, 27.497999, 14.6096, 1.7180, 358.2811);
CreateDynamicObject(853, 2214.701904, -1103.818970, 26.416000, 18.9068, 0.8586, 4.2963);
CreateDynamicObject(910, 2221.737061, -1084.642944, 32.612000, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(913, 2211.978027, -1090.553955, 31.282000, 286.0884, 0.0000, 56.2522);
CreateDynamicObject(922, 2206.205078, -1092.045044, 33.359001, 0.0000, 24.9228, 314.9999);
CreateDynamicObject(926, 2224.155029, -1129.457031, 24.874001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(952, 2236.956055, -1127.141968, 26.138000, 0.0000, 0.0000, 67.4993);
CreateDynamicObject(1338, 2197.048096, -1084.306030, 38.563999, 0.0000, 0.0000, 247.4997);
CreateDynamicObject(1358, 2192.090088, -1083.517944, 40.408001, 0.0000, 0.0000, 67.4993);
CreateDynamicObject(1570, 2215.153076, -1081.078979, 35.069000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(849, 2213.489990, -1129.146973, 24.775000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(14600, 2228.910889, -1111.630005, 26.865000, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(12957, 2203.726074, -1082.849976, 36.674999, 6.0152, 336.7952, 112.4994);
CreateDynamicObject(12954, 2165.982910, -1052.925049, 56.085999, 18.0473, 4.2963, 33.7521);
CreateDynamicObject(3594, 2163.874023, -1001.617981, 62.325001, 0.0000, 0.0000, 303.7527);
CreateDynamicObject(1777, 2153.878906, -1020.479004, 62.526001, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1558, 2176.797119, -999.637024, 62.542000, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(1558, 2177.868896, -999.922974, 62.528999, 0.0000, 0.0000, 78.7522);
CreateDynamicObject(1442, 2188.998047, -1062.645020, 47.372002, 23.2039, 21.4851, 0.0000);
CreateDynamicObject(1441, 2150.121094, -1000.056030, 61.949001, 0.0000, 0.0000, 67.4993);
CreateDynamicObject(1440, 2212.465088, -1119.947998, 25.143999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1439, 2188.214111, -1075.843018, 43.423000, 358.2811, 338.5141, 134.9995);
CreateDynamicObject(1415, 2184.572998, -1008.372986, 61.715000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1372, 2184.457031, -1005.390991, 61.817001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1369, 2162.495117, -1012.557983, 62.161999, 178.7620, 89.3806, 30.9389);
CreateDynamicObject(1365, 1998.006958, -1008.093018, 28.462000, 0.0000, 7.7341, 281.2527);
CreateDynamicObject(1358, 2224.009033, -1133.964966, 25.829000, 0.0000, 0.0000, 56.2522);
CreateDynamicObject(1358, 2130.797119, -994.219971, 59.492001, 352.2651, 0.0000, 44.9993);
CreateDynamicObject(1359, 2172.539063, -1017.002991, 62.631001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1338, 2165.031006, -1016.642029, 62.347000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1265, 2169.327881, -1006.744995, 62.273998, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1265, 2169.341064, -1035.634033, 59.729000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1265, 2179.815918, -1033.380005, 61.326000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1265, 2091.531006, -987.090027, 51.771000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(960, 2170.657959, -1026.515991, 61.750000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(952, 2164.150879, -1036.178955, 60.921001, 0.0000, 0.0000, 112.4994);
CreateDynamicObject(913, 2175.635010, -1046.483032, 56.078999, 0.0000, 0.0000, 236.2526);
CreateDynamicObject(912, 2176.823975, -1047.819946, 55.219002, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(910, 2178.011963, -1044.876953, 56.659000, 2.5775, 18.9068, 296.8772);
CreateDynamicObject(853, 2173.851074, -1042.946045, 56.912998, 16.3285, 7.7341, 0.0000);
CreateDynamicObject(849, 2103.187012, -986.849976, 53.200001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(955, 2171.710938, -1019.986023, 62.134998, 0.0000, 0.0000, 258.7526);
CreateDynamicObject(2866, 2166.002930, -1012.312012, 61.799999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(14878, 2082.573975, -984.888000, 49.917999, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(3577, 2053.784912, -977.520996, 44.917000, 1.7180, 348.8273, 0.0000);
CreateDynamicObject(958, 2156.665039, -1024.834961, 62.450001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(959, 2156.624023, -1024.823975, 62.499001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1233, 2199.103027, -1065.310059, 44.518002, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(14402, 2064.006104, -984.236023, 47.445000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8991, 2041.551025, -979.723022, 41.962002, 19.7662, 0.0000, 281.2527);
CreateDynamicObject(618, 2030.541992, -982.414001, 38.466999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(623, 2022.897949, -1002.206970, 29.493999, 0.0000, 0.0000, 56.2522);
CreateDynamicObject(1711, 2112.233887, -992.528992, 54.448002, 353.1245, 0.0000, 123.7523);
CreateDynamicObject(1728, 2035.352051, -985.448975, 39.502998, 353.9839, 1.7180, 91.1682);
CreateDynamicObject(2096, 2052.743896, -986.411987, 44.287998, 299.8394, 0.0000, 168.7524);
CreateDynamicObject(14890, 2155.791992, -1006.507996, 61.818001, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(2803, 2171.178955, -1014.617004, 62.456001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(14880, 2125.129883, -1002.512024, 58.500999, 0.0000, 0.0000, 78.7522);
CreateDynamicObject(2057, 2176.639893, -1014.242981, 62.101002, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(1644, 2162.093994, -1007.187988, 61.819000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1457, 2220.787109, -1110.364014, 26.520000, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(853, 2180.950928, -1061.258057, 49.868000, 6.0152, 15.4690, 356.5623);
CreateDynamicObject(910, 2190.499023, -1065.915039, 46.631001, 23.2039, 0.0000, 44.9993);
CreateDynamicObject(5112, -2973.306885, 163.772995, -2.181000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5112, -3115.724121, 163.792999, -2.048000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5112, -3254.135986, 163.817993, -2.091000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5112, -3394.739014, 163.813004, -1.963000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5112, -3541.841064, 163.772995, -2.054000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5112, -3668.930908, 163.764999, -1.997000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1655, -3741.289063, 159.272003, 3.175000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1655, -3741.211914, 168.210007, 3.164000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(5112, -3778.200928, 163.843002, -3.532000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5112, -3919.174072, 163.863998, -3.813000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(980, -2923.550049, 154.957993, 6.724000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(980, -2924.070068, 172.630005, 6.913000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(980, -2912.034912, 154.957993, 6.619000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(980, -2912.568115, 172.634995, 6.901000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(980, -2903.908936, 154.947998, 6.618000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(980, -2898.184082, 160.750000, 6.603000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(980, -2906.780029, 178.326996, 6.324000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(980, -2898.178955, 172.044998, 6.595000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(980, -2898.169922, 178.059006, 6.571000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(971, -2902.391113, 183.475998, 5.700000, 359.1406, 358.2811, 0.0000);
CreateDynamicObject(980, -3991.731934, 159.798004, 2.879000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(980, -3991.745117, 167.910004, 2.882000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(762, -3733.000977, 159.988007, 6.287000, 0.0000, 0.0000, 67.4993);
CreateDynamicObject(762, -3730.791992, 168.759003, 5.576000, 0.0000, 0.0000, 303.7527);
CreateDynamicObject(762, -3737.552979, 163.604996, 7.054000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3739.710938, 167.029007, 7.970000, 0.0000, 0.0000, 326.2528);
CreateDynamicObject(762, -3738.154053, 159.667007, 8.626000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3989.354004, 156.029007, 5.208000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3988.718994, 163.292999, 5.019000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3989.072021, 168.712997, 6.229000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3984.250000, 163.960007, 4.451000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3981.164063, 160.085007, 6.523000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3978.039063, 168.287994, 5.889000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(762, -3975.211914, 160.429993, 5.694000, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(1225, -3977.558105, 164.188004, 1.033000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3982.883057, 168.496994, 0.841000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3975.333984, 166.442001, 1.121000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3982.779053, 157.539001, 1.009000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3978.832031, 158.869995, 1.150000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3980.535889, 165.580002, 0.928000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3976.221924, 167.261993, 1.088000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3983.153076, 159.787003, 0.831000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3984.729980, 165.408997, 0.776000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3979.574951, 170.294006, 1.135000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3985.414063, 171.371002, 0.919000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3979.878906, 159.677002, 0.952000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, -3977.602051, 166.261002, 1.037000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(15038, 2159.304932, 941.544006, 10.438000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(15038, 2159.391113, 944.747986, 10.438000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(2780, 2000.620972, 1538.385010, 11.736000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3510, 2156.681885, 924.487976, 9.668000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3510, 2156.903076, 962.596008, 9.268000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1228, 2150.113037, 962.575989, 10.102000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1228, 2145.177002, 962.356995, 10.107000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1282, 2147.541016, 962.531006, 10.371000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1282, 2147.455078, 928.283997, 10.361000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1228, 2144.857910, 928.174988, 10.093000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1228, 2150.181885, 928.142029, 10.093000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1662, 1739.392944, 518.133972, 29.431000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(973, 2028.896973, 1545.380005, 10.661000, 0.0000, 0.0000, 258.7526);
CreateDynamicObject(973, 2025.276001, 1550.834961, 10.685000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(973, 2029.198975, 1545.322998, 11.810000, 0.0000, 0.0000, 258.7526);
CreateDynamicObject(983, 1995.734009, 1541.989990, 13.269000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(983, 1995.953979, 1548.764038, 13.269000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(996, 2188.647949, 1993.743042, 10.569000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(17000, 2197.523926, 2063.717041, 7.465000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(17550, 2126.662109, 2232.796631, 27.724991, 0.8586, 356.5623, 11.2520);
CreateDynamicObject(11095, 2056.199219, 947.286377, 15.099000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(6449, 2193.125000, 504.813995, 8.542000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(6448, 2140.653076, 530.716980, 3.734000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1637, 2183.604004, 541.523987, 5.536000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(1598, 2183.948975, 501.727997, 3.175000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1461, 2220.041992, 521.622986, 1.338000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3620, 2174.708984, 440.177002, 15.671000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3753, 2157.489014, 490.834991, -6.426000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3886, 2217.653076, 496.326996, 1.824000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(10230, 2097.073975, 537.435974, -22.134001, 35.2361, 328.2008, 44.9993);
CreateDynamicObject(10229, 2098.349121, 534.465027, -23.708000, 34.3766, 329.0603, 48.3625);
CreateDynamicObject(11495, 2225.709961, 460.903992, 2.591000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(9822, 2132.152100, 564.328003, -3.386000, 0.0000, 0.0000, 247.4997);
CreateDynamicObject(2669, 2054.235107, 522.416992, -49.165001, 0.0000, 0.0000, 78.7522);
CreateDynamicObject(2678, 2056.770020, 521.177002, -49.299000, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(2678, 2056.720947, 521.494995, -50.398998, 286.0884, 0.0000, 33.7521);
CreateDynamicObject(3565, 2053.906006, 517.013000, -50.844002, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3571, 2057.207031, 526.729004, -47.056999, 343.6707, 67.0352, 0.0000);
CreateDynamicObject(3573, 2070.647949, 527.687988, -44.235001, 18.0473, 335.9358, 36.2502);
CreateDynamicObject(3572, 2063.907959, 508.213989, -55.022999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8886, 2116.919922, 546.905029, -21.198999, 26.6417, 335.0763, 22.4992);
CreateDynamicObject(5855, 2081.693115, 496.592010, -57.215000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5132, 2125.627930, 558.507019, -11.538000, 320.4659, 21.4851, 258.7526);
CreateDynamicObject(975, 2086.291016, 1781.805054, 74.790001, 91.9589, 0.0000, 337.4999);
CreateDynamicObject(5005, 352.845001, 2526.929932, 19.245001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5005, 349.906006, 2477.291016, 19.044001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5005, 187.626999, 2477.371094, 19.086000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5005, 190.031006, 2527.010986, 19.209000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5005, 31.538000, 2527.125000, 19.211000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(5005, 25.028000, 2477.406006, 19.044001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8210, -51.202000, 2502.218994, 18.584999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(979, -40.487000, 2524.301025, 16.325001, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(979, -47.066002, 2518.876953, 16.325001, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(979, -48.495998, 2516.439941, 16.325001, 0.0000, 0.0000, 236.2526);
CreateDynamicObject(979, -50.592999, 2509.097900, 16.325001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(979, -36.199001, 2479.456055, 16.325001, 0.0000, 0.0000, 337.4999);
CreateDynamicObject(979, -42.261002, 2482.636963, 16.325001, 0.0000, 0.0000, 326.2528);
CreateDynamicObject(979, -47.862999, 2487.137939, 16.325001, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(979, -47.620998, 2487.335938, 16.733999, 0.0000, 0.0000, 303.7527);
CreateDynamicObject(979, -36.479000, 2525.816895, 16.325001, 0.0000, 0.0000, 191.2525);
CreateDynamicObject(979, -33.103001, 2478.510010, 16.441000, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(979, -43.034000, 2483.528076, 16.440001, 0.0000, 0.0000, 326.2528);
CreateDynamicObject(979, -50.291000, 2494.306885, 16.325001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(979, -50.577000, 2501.715088, 16.325001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(7939, 29.254999, 2502.844971, 17.045000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(7939, 119.521004, 2502.827881, 17.037001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(7939, 219.216003, 2502.826904, 17.037001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(7939, 316.188995, 2502.822998, 17.037001, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(7939, 371.996002, 2502.840088, 17.037001, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(7657, 432.683990, 2487.739014, 17.209000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(7657, 432.694000, 2507.634033, 17.201000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(7657, 432.705994, 2527.596924, 17.232000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(4106, 426.894012, 2505.397949, 22.753000, 0.0000, 0.0000, 178.6589);
CreateDynamicObject(10009, 426.377991, 2522.904053, 19.420000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(970, 427.462006, 2535.277100, 24.820000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3472, 421.636993, 2502.858887, 14.544000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3374, -28.368000, 2476.282959, 16.986000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3374, -31.945999, 2528.202881, 16.253000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(2780, -50.786999, 2502.379883, 16.792000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(16779, 421.651001, 2502.879883, 20.917000, 0.0000, 93.6778, 0.0000);
CreateDynamicObject(4597, 415.015015, 2520.520996, 15.066000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(4597, 415.013000, 2536.176025, 15.066000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(4597, 414.989990, 2485.010986, 15.066000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(4597, 414.985992, 2469.841064, 15.071000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(17950, 2624.728027, 1134.464966, 12.096000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(2684, 2621.329102, 1129.990967, 11.677000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(14637, 2624.700928, 1131.517944, 11.747000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(14467, 2625.180908, 1130.506958, 17.091999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(10281, 2624.670898, 1137.483032, 10.853000, 0.0000, 345.3896, 0.0000);
CreateDynamicObject(8406, 2617.329102, 1077.583008, 15.469000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(982, 2082.104004, -1421.902954, 48.014999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(982, 2069.351074, -1409.124023, 48.014999, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(982, 2069.386963, -1434.692993, 48.019001, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(982, 2056.560059, -1421.837036, 48.019001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2077.956055, -1405.365967, 48.328999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3819, 2060.795898, -1405.409058, 48.328999, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3819, 2077.983887, -1438.009033, 48.334000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3819, 2060.727051, -1438.135986, 48.334000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3819, 2069.392090, -1438.095947, 48.334000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3819, 2069.393066, -1405.379028, 48.334000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1641, 2069.674072, -1433.775024, 47.331001, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1641, 2069.243896, -1410.136963, 47.331001, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(8661, 1516.626953, -1131.687012, 137.776993, 0.0000, 344.5301, 179.9996);
CreateDynamicObject(982, 1509.967041, -1141.514038, 140.352997, 344.5301, 0.0000, 269.9998);
CreateDynamicObject(982, 1509.897949, -1121.772949, 140.408997, 344.5301, 0.0000, 269.9998);
CreateDynamicObject(984, 1497.511963, -1135.140015, 143.710007, 0.0000, 12.8907, 0.0000);
CreateDynamicObject(984, 1497.545044, -1128.168945, 143.811005, 0.0000, 16.3285, 0.0000);
CreateDynamicObject(984, 1522.152954, -1128.151978, 136.912003, 0.0000, 16.3285, 0.0000);
CreateDynamicObject(984, 1522.270996, -1135.050049, 136.962006, 0.0000, 16.3285, 0.0000);
CreateDynamicObject(3819, 1494.858032, -1137.170044, 143.858002, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3819, 1494.938965, -1126.067993, 143.863007, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3819, 1494.990967, -1131.409058, 143.951996, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(1640, 1520.076050, -1131.291016, 136.830994, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(1640, 1499.337036, -1131.437988, 142.574997, 0.0000, 14.6096, 0.0000);
CreateDynamicObject(969, 1877.425049, -1315.379028, 43.383999, 271.4780, 0.0000, 0.0000);
CreateDynamicObject(969, 1877.711060, -1318.688965, 38.459000, 269.7591, 0.0000, 0.0000);
CreateDynamicObject(969, 1877.526978, -1312.109009, 33.459000, 90.2400, 0.0000, 0.0000);
CreateDynamicObject(1643, 1870.631958, -1315.984985, 48.433998, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1643, 1893.279053, -1316.005981, 48.418999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(8661, 1999.869019, 1532.155029, 585.914978, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(984, 2017.390015, 1532.720947, 586.552002, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(984, 2011.058960, 1526.383057, 586.552002, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(984, 2011.006958, 1539.104004, 586.552002, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(984, 2004.598022, 1532.748047, 586.552002, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(984, 1991.363037, 1538.832031, 586.552002, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(984, 1984.884033, 1532.389038, 586.552002, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(984, 1991.256958, 1526.005981, 586.552002, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(984, 1997.666992, 1532.407959, 586.552002, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 1982.654053, 1532.589966, 586.913025, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3819, 2019.675049, 1532.267944, 586.913025, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2001.229004, 1542.211060, 586.913025, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3819, 1992.637939, 1542.218994, 586.913025, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3819, 2009.854004, 1542.193970, 586.913025, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1642, 2015.850952, 1532.131958, 585.960022, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1642, 2006.229004, 1532.473999, 585.960022, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1642, 1986.264038, 1532.619019, 585.934998, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1642, 1996.220947, 1532.390015, 585.934998, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(976, 2001.000000, 1538.437012, 586.077026, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(976, 2000.946045, 1535.321045, 586.077026, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(973, 941.601013, 2068.981934, 10.661000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3279, 992.755981, 2120.913086, 9.896000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(5822, 965.754028, 2176.792969, 13.395000, 0.0000, 0.0000, 271.7187);
CreateDynamicObject(973, 964.023010, 2136.931885, 19.534000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3279, 1054.921997, 1357.043945, 9.896000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3279, 1080.077026, 1358.104004, 9.896000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3279, 1711.860962, 1315.151001, 9.896000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3279, 2779.767090, 899.849976, 9.974000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3279, 2779.666992, 926.734009, 9.974000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(973, 2802.066895, 913.096985, 10.590000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(7379, 2485.376953, 1783.246948, 11.772000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(7371, 2497.593994, 1903.649048, 11.795000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(7371, 2497.590088, 1950.951050, 11.797000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(7371, 2371.549072, 1842.907959, 13.046000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(8209, 2421.445068, 1962.876953, 13.611000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(973, 2463.833008, 1963.086060, 10.261000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3279, 2492.224121, 1960.098999, 9.896000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3279, 2454.169922, 1913.772949, 9.940000, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(973, 2403.138916, 1913.687012, 11.364000, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(10838, 1797.954956, 862.666016, 27.177000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3511, 2088.618896, 1114.276001, 9.807000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3511, 2088.471924, 1073.680054, 9.807000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3504, 2079.147949, 961.781006, 10.900000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3504, 2079.175049, 960.369995, 10.846000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3504, 2079.206055, 958.947021, 10.793000, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(13295, 2319.321045, 948.315979, 16.344999, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(14780, 2644.263916, 1211.061035, 26.790001, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(14791, 2644.262939, 1200.932007, 27.968000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(14781, 2636.632080, 1222.427979, 27.014000, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3279, 2163.688477, 956.681213, 14.597635, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3279, 2163.458008, 929.307129, 14.572636, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3279, 2108.155029, 955.214783, 14.560438, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3279, 2107.534180, 907.013733, 9.620934, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3279, 2127.151611, 996.635376, 9.645933, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, 2082.179688, 998.779724, 10.226068, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, 2079.033936, 1076.704590, 10.226068, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, 2034.234497, 986.440735, 10.226068, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, 2156.001953, 939.228455, 10.226068, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, 2142.168457, 963.343384, 10.218272, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(2780, 2167.299805, 956.303894, 14.672016, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(2780, 2165.958008, 929.096985, 16.186682, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3267, 2131.628662, 981.409973, 9.380756, 0.0000, 0.0000, 168.7524);
CreateDynamicObject(3461, 2163.407471, 929.391235, 32.225773, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3461, 2163.131592, 956.074219, 32.250771, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3461, 2085.093506, 980.059753, 11.395324, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3461, 2082.985107, 966.349548, 11.395324, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3524, 2080.572754, 871.223206, 8.945313, 0.0000, 0.0000, 258.7526);
CreateDynamicObject(3524, 2034.234497, 876.158630, 9.056223, 0.0000, 0.0000, 78.7522);
CreateDynamicObject(3528, 2158.563477, 956.583618, 12.947926, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3528, 2158.675049, 929.549194, 12.970850, 0.0000, 0.0000, 168.7524);
CreateDynamicObject(16776, 2225.326904, 958.107178, 9.421173, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(1225, 2166.534180, 941.124023, 15.077771, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1225, 2168.579834, 915.977905, 10.226068, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1775, 2098.337158, 941.996216, 10.917349, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3277, 2112.463867, 924.226990, 16.827282, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5130, 2115.813477, 935.367859, 12.809477, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(2745, 2114.541016, 946.854614, 15.943437, 0.0000, 0.0000, 101.2523);
CreateDynamicObject(3279, 2081.326416, 2222.273682, 9.520935, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(11095, 2131.651123, 1843.333130, 14.952923, 0.0000, 0.0000, 258.7469);
CreateDynamicObject(5708, 2133.723877, 1250.588501, 20.517181, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3279, 2107.623047, 1303.171631, 9.895928, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(620, 2088.201660, 940.432739, 9.045429, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(621, 2089.470215, 960.753174, 9.625186, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(620, 2026.757813, 888.683350, 6.841963, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(621, 2025.866089, 901.383667, 7.431612, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(620, 2026.424805, 917.051270, 8.193036, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(621, 2025.819336, 931.454590, 8.632883, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(620, 2026.384155, 960.911499, 9.595636, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1634, 2084.970459, 1587.290771, 10.792636, 0.0000, 359.1406, 0.0000);
CreateDynamicObject(978, 2311.341064, 1387.503662, 42.660534, 0.0000, 0.0000, 44.9993);
CreateDynamicObject(978, 2315.676514, 1393.986328, 42.660534, 0.0000, 0.0000, 67.4993);
CreateDynamicObject(978, 2317.366943, 1401.714233, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.364746, 1411.095703, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.374512, 1420.422363, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.348389, 1439.127930, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.338867, 1448.498779, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.434814, 1457.861572, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.411377, 1467.102661, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.464844, 1476.289063, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.417236, 1485.610107, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.374512, 1494.786133, 42.660534, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2316.479980, 1503.409668, 42.660534, 0.0000, 0.0000, 101.2523);
CreateDynamicObject(978, 2313.252441, 1511.237305, 42.660534, 0.0000, 0.0000, 123.7523);
CreateDynamicObject(978, 2306.896729, 1516.461304, 42.660534, 0.0000, 0.0000, 157.4995);
CreateDynamicObject(978, 2298.594482, 1518.080200, 42.660534, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2289.318359, 1518.137329, 42.660534, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2280.975830, 1517.339478, 42.660534, 0.0000, 0.0000, 191.2525);
CreateDynamicObject(978, 2272.497314, 1515.607788, 42.655819, 0.0000, 0.0000, 191.2525);
CreateDynamicObject(978, 2272.446289, 1393.157593, 36.255821, 0.0000, 0.0000, 337.4999);
CreateDynamicObject(978, 2280.869873, 1391.582153, 36.262096, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2288.711426, 1391.577026, 36.262096, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2296.533203, 1388.417114, 36.262096, 0.0000, 0.0000, 314.9999);
CreateDynamicObject(978, 2304.129395, 1385.397583, 36.262096, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2312.754150, 1387.268188, 36.262096, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(978, 2317.527344, 1389.376831, 36.262096, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(978, 2325.901123, 1391.793579, 36.262096, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2334.997803, 1391.710571, 36.262096, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2342.929688, 1392.850342, 36.262096, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(3524, 2318.023438, 1426.009033, 44.705654, 0.0000, 0.0000, 78.7522);
CreateDynamicObject(3524, 2318.079834, 1433.687622, 44.705654, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2342.837646, 1514.253784, 29.871447, 0.0000, 0.0000, 157.4995);
CreateDynamicObject(978, 2334.828125, 1515.845337, 29.863657, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2326.091309, 1515.846924, 29.863657, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2318.242920, 1518.997559, 29.863657, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(978, 2312.026855, 1521.605713, 29.863657, 0.0000, 0.0000, 168.7524);
CreateDynamicObject(978, 2303.396729, 1521.731934, 29.863657, 0.0000, 0.0000, 191.2525);
CreateDynamicObject(978, 2297.114990, 1518.970215, 29.863657, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(978, 2289.240967, 1515.602661, 29.863657, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2279.973145, 1515.870361, 29.863657, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2272.703369, 1514.391846, 29.871447, 0.0000, 0.0000, 202.4996);
CreateDynamicObject(978, 2272.664795, 1393.111694, 23.471447, 0.0000, 0.0000, 337.4999);
CreateDynamicObject(978, 2281.205811, 1391.437134, 23.465219, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2289.063965, 1391.240723, 23.465219, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2297.543457, 1388.369873, 23.465219, 0.0000, 0.0000, 326.2528);
CreateDynamicObject(978, 2305.043213, 1385.210571, 23.465219, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(978, 2310.678467, 1385.313477, 23.465219, 0.0000, 0.0000, 11.2520);
CreateDynamicObject(978, 2317.439453, 1388.421997, 23.465219, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(978, 2325.803955, 1391.048706, 23.465219, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2334.671143, 1390.833618, 23.465219, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2342.042725, 1392.640991, 23.465219, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(978, 2342.734131, 1514.639404, 17.063631, 0.0000, 0.0000, 157.4995);
CreateDynamicObject(978, 2334.884033, 1515.987305, 17.058969, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2325.678467, 1515.939819, 17.058969, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2317.274170, 1518.563354, 17.058969, 0.0000, 0.0000, 146.2524);
CreateDynamicObject(978, 2310.426758, 1521.404419, 17.058969, 0.0000, 0.0000, 168.7524);
CreateDynamicObject(978, 2303.905518, 1521.479492, 17.058969, 0.0000, 0.0000, 191.2525);
CreateDynamicObject(978, 2297.174072, 1519.125854, 17.058969, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(978, 2288.900391, 1516.532715, 17.058969, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2280.562256, 1516.526489, 17.058969, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2272.004883, 1514.770386, 17.063633, 0.0000, 0.0000, 202.4996);
CreateDynamicObject(978, 2272.325195, 1392.842285, 10.660533, 0.0000, 0.0000, 337.4999);
CreateDynamicObject(978, 2281.069824, 1391.165894, 10.660533, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2289.430908, 1391.175537, 10.660533, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2297.882813, 1388.625000, 10.660533, 0.0000, 0.0000, 326.2528);
CreateDynamicObject(978, 2303.711182, 1387.637573, 10.660533, 0.0000, 0.0000, 22.4992);
CreateDynamicObject(978, 2308.444824, 1389.953247, 10.660533, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(978, 2313.191162, 1394.642944, 10.660533, 0.0000, 0.0000, 56.2522);
CreateDynamicObject(978, 2315.977539, 1401.465088, 10.660533, 0.0000, 0.0000, 78.7522);
CreateDynamicObject(978, 2316.827881, 1409.672852, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2316.797852, 1418.899536, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2316.869385, 1426.351074, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2316.960693, 1434.485596, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2316.916260, 1443.086670, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2316.942139, 1451.968018, 10.660533, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2317.029297, 1461.140381, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2316.981201, 1469.352661, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2320.689697, 1476.220459, 10.660533, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(978, 2328.998291, 1477.829346, 10.660533, 0.0000, 0.0000, 348.7528);
CreateDynamicObject(978, 2335.136963, 1472.715576, 10.660533, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(978, 2336.940918, 1463.876709, 10.660533, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(978, 2336.930420, 1455.341431, 10.660533, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(978, 2336.910645, 1446.085205, 10.660533, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(978, 2336.940674, 1437.178833, 10.660533, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(978, 2336.917236, 1428.448853, 10.660533, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(978, 2332.005127, 1424.965332, 10.660533, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2322.783936, 1425.121094, 10.660533, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2299.708984, 1482.611816, 10.660533, 0.0000, 0.0000, 236.2526);
CreateDynamicObject(978, 2304.966309, 1488.537354, 10.663634, 0.0000, 0.0000, 224.9997);
CreateDynamicObject(978, 2310.971191, 1493.486328, 10.663632, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(978, 2318.407959, 1496.583374, 10.660533, 0.0000, 0.0000, 191.2525);
CreateDynamicObject(978, 2326.762695, 1497.552246, 10.660533, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2334.942383, 1494.976807, 10.660533, 0.0000, 0.0000, 146.2524);
CreateDynamicObject(978, 2341.442139, 1489.753296, 10.660533, 0.0000, 0.0000, 134.9995);
CreateDynamicObject(978, 2345.819824, 1482.970825, 10.660533, 0.0000, 0.0000, 112.4994);
CreateDynamicObject(978, 2348.204834, 1475.142456, 10.660533, 0.0000, 0.0000, 101.2523);
CreateDynamicObject(978, 2349.041992, 1466.460693, 10.660533, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2349.033691, 1457.650146, 10.660533, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2348.983643, 1449.347168, 10.663632, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2348.968750, 1440.303955, 10.663634, 0.0000, 0.0000, 89.1399);
CreateDynamicObject(978, 2348.943848, 1431.223511, 10.663634, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2348.783936, 1422.360596, 10.663634, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2348.785156, 1413.929321, 10.663634, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2348.821045, 1405.342407, 10.663634, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2348.828125, 1396.847412, 10.660533, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(983, 2315.789551, 1386.190674, 10.503867, 0.0000, 0.0000, 213.7525);
CreateDynamicObject(981, 2307.476318, 1382.326904, 10.667342, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(981, 2307.461182, 1524.171143, 10.656982, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(978, 2343.045410, 1424.983398, 9.438651, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2343.059082, 1426.182129, 9.421035, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1290, 2320.367188, 1400.492188, 47.843735, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1290, 2320.075684, 1420.608643, 47.843735, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1290, 2319.689697, 1439.350220, 47.843735, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1290, 2319.671631, 1458.661621, 47.843735, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1290, 2320.224365, 1475.754639, 47.843735, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1290, 2320.002686, 1492.827881, 47.843735, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1290, 2315.902832, 1512.961670, 47.843735, 0.0000, 0.0000, 33.7521);
CreateDynamicObject(1290, 2292.501953, 1520.215942, 47.843735, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(1290, 2272.267578, 1517.952515, 47.839020, 0.0000, 0.0000, 101.2523);
CreateDynamicObject(16151, 2345.798096, 1513.431641, 42.212067, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1281, 2333.519775, 1518.626221, 42.620693, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1281, 2338.922852, 1518.551636, 42.615978, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1281, 2333.621338, 1512.869873, 42.620693, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(1281, 2338.928955, 1512.900879, 42.620693, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3504, 2354.206543, 1510.720947, 43.162678, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3504, 2354.207031, 1508.595947, 43.162678, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3504, 2354.230469, 1506.585815, 43.162678, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(3819, 2327.143066, 1488.426270, 42.818069, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2327.158936, 1479.872559, 42.818069, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2327.260498, 1471.262207, 42.818069, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2327.334229, 1462.687622, 42.818069, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2327.373535, 1454.160522, 42.818069, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2327.489746, 1445.465210, 42.818069, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2331.643066, 1488.431396, 44.593178, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2331.642090, 1479.820190, 44.593178, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2331.756104, 1471.229858, 44.593178, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2331.814941, 1462.711182, 44.593178, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2331.854736, 1454.207886, 44.593178, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2331.972168, 1445.508545, 44.593178, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2336.125488, 1488.388916, 46.368286, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2336.122559, 1479.778809, 46.368286, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2336.239502, 1471.196167, 46.368286, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2336.313721, 1462.594604, 46.368286, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2336.331055, 1454.002319, 46.368286, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2336.460693, 1445.432007, 46.343285, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.164063, 1444.030762, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.156738, 1450.005615, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.161865, 1455.991089, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.167969, 1461.973267, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.178955, 1467.942017, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.166260, 1473.927002, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.151123, 1479.916138, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.146240, 1485.904175, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2339.131348, 1489.652344, 44.187321, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3550, 2335.618896, 1492.312256, 44.187321, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3550, 2329.642090, 1492.332031, 44.187321, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3550, 2335.671631, 1440.742554, 44.187321, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(3550, 2329.682617, 1440.737549, 44.187321, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2317.507568, 1522.764771, 11.112736, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2329.306396, 1522.759766, 11.112736, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2340.714600, 1522.769287, 11.112736, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2345.091309, 1513.257324, 11.112738, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2356.828125, 1513.113037, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.793701, 1501.183105, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.783203, 1489.271973, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.792725, 1477.388428, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.807617, 1465.561401, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.824951, 1453.669678, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.826904, 1441.812866, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.810059, 1429.977051, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.834961, 1418.110107, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.772217, 1406.188599, 11.112743, 0.0000, 0.0000, 269.9998);
CreateDynamicObject(987, 2356.569092, 1394.452637, 11.112743, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2329.329346, 1383.775757, 11.112743, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2341.247559, 1383.761841, 11.112743, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2350.260986, 1383.744019, 11.112743, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2285.531494, 1522.773438, 11.112732, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2273.698975, 1522.787354, 11.112732, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2264.700195, 1522.793335, 11.112732, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2297.066895, 1383.781860, 11.112740, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2285.128174, 1383.821777, 11.112740, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2273.265625, 1383.764648, 11.112740, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2269.609131, 1394.369751, 11.127676, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2257.844727, 1394.409180, 11.112736, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.851563, 1406.241577, 11.300304, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.867432, 1418.097046, 12.034023, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.857910, 1429.905396, 12.764828, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.847900, 1441.749878, 13.505692, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.857422, 1453.662476, 14.252315, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.886230, 1465.543213, 14.978225, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.894531, 1477.453247, 15.715313, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.886475, 1489.405029, 16.454990, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2257.847168, 1501.261230, 17.188757, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(987, 2258.034668, 1513.342407, 17.312534, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2297.492920, 1522.781494, 9.984375, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2309.022705, 1522.824707, 9.820313, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(987, 2317.228516, 1383.828247, 9.984375, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(987, 2305.286865, 1383.772949, 9.820313, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(1432, 2340.680664, 1507.408325, 41.952114, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1432, 2346.571777, 1507.556152, 41.952114, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1432, 2346.104004, 1502.792725, 41.952114, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1432, 2342.300293, 1501.774780, 41.952114, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1432, 2338.565674, 1503.508667, 41.952114, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1432, 2334.671143, 1507.481445, 41.952114, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(978, 2293.327393, 1392.828003, 41.435459, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(978, 2292.559082, 1392.883545, 41.435459, 0.0000, 0.0000, 89.9994);
CreateDynamicObject(973, 2351.674316, 1490.557983, 42.660534, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3819, 2319.723389, 1419.779175, 10.818070, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3819, 2319.708252, 1411.167480, 10.818070, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(3819, 2319.695801, 1402.549683, 10.818070, 0.0000, 0.0000, 179.9996);
CreateDynamicObject(983, 2324.120361, 1421.648071, 10.503867, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(983, 2324.112061, 1415.248047, 10.503867, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(983, 2324.098877, 1408.842163, 10.503867, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(983, 2324.091553, 1402.454834, 10.503867, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(983, 2324.037842, 1396.082642, 10.503867, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(983, 2324.040039, 1392.881348, 10.503867, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13666, 834.263611, -2065.759766, 16.897499, 0.0000, 0.0000, 98.8344);
CreateDynamicObject(13666, 834.301514, -2069.180664, 16.898899, 0.0000, 0.0000, 98.8344);
CreateDynamicObject(13666, 834.367920, -2072.508545, 16.953699, 0.0000, 2.5775, 98.8344);
CreateDynamicObject(13666, 834.282776, -2075.895752, 17.209900, 0.0000, 6.0152, 96.2561);
CreateDynamicObject(13666, 833.944824, -2079.057129, 17.548201, 0.0000, 8.5935, 91.0994);
CreateDynamicObject(13666, 833.427124, -2082.156494, 18.041599, 0.0000, 11.1718, 86.8023);
CreateDynamicObject(13666, 832.688721, -2085.415771, 18.656000, 0.0000, 11.1718, 86.8023);
CreateDynamicObject(13666, 831.888611, -2088.633301, 19.431900, 0.0000, 16.3285, 81.6456);
CreateDynamicObject(13666, 830.867188, -2091.620117, 20.646099, 0.0000, 23.2039, 77.3485);
CreateDynamicObject(13666, 829.926025, -2093.805908, 21.691000, 0.0000, 26.6417, 73.9107);
CreateDynamicObject(13666, 828.683777, -2096.249512, 23.318001, 0.0000, 32.6578, 69.6135);
CreateDynamicObject(13666, 827.086792, -2098.586670, 25.145000, 0.0000, 35.2361, 65.3163);
CreateDynamicObject(13666, 825.314270, -2100.502930, 26.966499, 0.0000, 36.0955, 57.5814);
CreateDynamicObject(13666, 823.365417, -2102.282959, 28.798300, 0.0000, 36.9549, 51.5654);
CreateDynamicObject(13666, 821.508972, -2103.824219, 30.506300, 0.0000, 38.6738, 46.4087);
CreateDynamicObject(13666, 819.228027, -2105.211670, 32.575802, 0.0000, 39.5332, 41.2521);
CreateDynamicObject(13666, 817.193787, -2106.207031, 34.255199, 0.0000, 39.5332, 33.5172);
CreateDynamicObject(13666, 815.265381, -2106.822021, 35.763802, 0.0000, 39.5332, 25.7823);
CreateDynamicObject(13666, 813.464111, -2107.155762, 37.236500, 0.0000, 39.5332, 20.6256);
CreateDynamicObject(13666, 810.901184, -2107.347168, 39.217800, 0.0000, 39.5332, 13.7501);
CreateDynamicObject(13666, 808.447327, -2107.259277, 41.216099, 0.0000, 39.5332, 6.8747);
CreateDynamicObject(13666, 805.761475, -2106.818604, 43.311699, 0.0000, 39.5332, 359.9992);
CreateDynamicObject(13666, 803.202515, -2106.019775, 45.318401, 0.0000, 39.5332, 350.5462);
CreateDynamicObject(13666, 801.075623, -2105.040283, 47.124100, 0.0000, 36.9549, 346.2490);
CreateDynamicObject(13666, 798.549011, -2103.709473, 49.068100, 0.0000, 35.2361, 339.3735);
CreateDynamicObject(13666, 796.215576, -2101.840820, 50.958401, 0.0000, 33.5172, 329.9197);
CreateDynamicObject(13666, 794.427979, -2100.119141, 52.399899, 0.0000, 31.7983, 323.9037);
CreateDynamicObject(13666, 792.498901, -2097.635986, 54.190102, 0.0000, 30.0794, 317.0282);
CreateDynamicObject(13666, 790.739319, -2094.785645, 55.899200, 0.0000, 27.5011, 310.1527);
CreateDynamicObject(13666, 789.578308, -2092.545898, 57.092999, 0.0000, 24.9228, 304.9961);
CreateDynamicObject(13666, 788.706116, -2090.574463, 58.089600, 0.0000, 21.4851, 299.8394);
CreateDynamicObject(13666, 787.850403, -2087.594238, 59.150501, 0.0000, 18.0473, 292.1045);
CreateDynamicObject(13666, 787.395813, -2084.947998, 59.973499, 0.0000, 14.6096, 283.5101);
CreateDynamicObject(13666, 787.330017, -2081.596191, 60.760601, 0.0000, 12.0313, 278.3535);
CreateDynamicObject(13666, 787.671509, -2068.254639, 62.165600, 0.0000, 0.0000, 98.8344);
CreateDynamicObject(13666, 787.382385, -2078.175049, 61.417500, 0.0000, 9.4530, 276.6346);
CreateDynamicObject(13666, 787.493896, -2074.791748, 61.867001, 0.0000, 6.0152, 276.6346);
CreateDynamicObject(13666, 787.638184, -2071.448730, 62.146099, 0.0000, 2.5775, 276.6346);
CreateDynamicObject(11111, 1426.886353, -2497.164795, 23.379700, 315.3093, 0.0000, 269.7591);
CreateDynamicObject(11111, 1384.890259, -2496.987549, 66.177399, 313.5904, 0.0000, 269.7591);
CreateDynamicObject(11111, 1343.818848, -2496.795166, 109.341003, 313.5904, 0.0000, 269.7591);
CreateDynamicObject(11111, 1303.061157, -2496.652588, 152.194000, 313.5904, 0.0000, 269.7591);
CreateDynamicObject(11111, 1252.464966, -2495.583740, 172.133102, 3.4369, 0.0000, 268.0403);
CreateDynamicObject(1632, 1426.333862, -2497.201904, 25.262400, 315.3093, 0.8586, 271.4780);
CreateDynamicObject(1632, 1434.063232, -2497.023438, 23.786900, 335.9358, 0.8586, 271.4780);
CreateDynamicObject(1632, 1442.239990, -2496.931641, 25.579800, 1.7180, 1.7180, 271.4780);
CreateDynamicObject(1632, 1447.845581, -2496.790771, 30.257999, 30.0794, 0.0000, 271.4780);
CreateDynamicObject(4023, 1496.695068, -2611.709473, 24.278099, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1632, 1521.661377, -2624.247559, 15.147000, 19.7662, 0.0000, 179.5183);
CreateDynamicObject(1632, 1521.539551, -2627.927490, 20.558701, 42.9710, 0.0000, 179.5183);
CreateDynamicObject(1633, 1521.506470, -2629.067139, 27.438999, 69.6135, 0.0000, 181.2372);
CreateDynamicObject(1633, 1521.414429, -2628.758545, 33.647202, 85.0834, 4.2963, 181.2372);
CreateDynamicObject(1696, 1492.836914, -2597.043701, 35.957199, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1696, 1498.207520, -2597.051758, 35.957199, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13590, 1780.072021, -2520.689209, 13.822700, 0.0000, 0.0000, 93.5746);
CreateDynamicObject(12956, 1729.309814, -2483.946045, 15.932900, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3287, 2045.691406, -2596.619385, 17.235901, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(3287, 2051.990723, -2596.547119, 17.091101, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(6928, 1976.777466, -2634.583740, 14.413200, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(5126, 2124.841797, -2549.404785, 27.671200, 0.0000, 0.0000, 179.6214);
CreateDynamicObject(13593, 2034.486450, -2599.008545, 13.564700, 14.6096, 0.0000, 269.7591);
CreateDynamicObject(3426, 1629.628418, -2445.177490, 13.295900, 0.0000, 0.0000, 182.9560);
CreateDynamicObject(1632, 1656.110352, -2543.063477, 18.344000, 24.9228, 0.0000, 90.2400);
CreateDynamicObject(16776, 1481.342651, -2601.089111, 36.700802, 0.0000, 0.8586, 52.3217);
CreateDynamicObject(13593, 2061.339844, -2597.901611, 13.408100, 10.3124, 0.0000, 89.2774);
CreateDynamicObject(1632, 1878.906128, -2543.037109, 18.603201, 34.3766, 0.0000, 271.4780);
CreateDynamicObject(1632, 1888.682739, -2543.145752, 18.777100, 34.3766, 0.0000, 92.7152);
CreateDynamicObject(13592, 1409.492188, -2593.011719, 21.642500, 274.0563, 0.0000, 354.8434);
CreateDynamicObject(13592, 1408.378052, -2593.435791, 28.767500, 274.0563, 0.0000, 354.8434);
CreateDynamicObject(13592, 1407.353760, -2593.805908, 35.342499, 274.0563, 0.0000, 354.8434);
CreateDynamicObject(13592, 1406.208740, -2594.205566, 42.596401, 274.0563, 0.0000, 354.8434);
CreateDynamicObject(13592, 1405.101196, -2594.613525, 49.859001, 274.0563, 0.0000, 354.8434);
CreateDynamicObject(13592, 1403.980103, -2595.031250, 57.111500, 274.0563, 0.0000, 354.8434);
CreateDynamicObject(1655, 1394.803345, -2603.250000, 66.831802, 358.2811, 85.9428, 84.2240);
CreateDynamicObject(9241, 1377.615479, -2593.705811, 61.130798, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1632, 1415.949341, -2601.727783, 14.197000, 10.3124, 29.2200, 127.1958);
CreateDynamicObject(18450, 1827.548218, -2381.769775, 24.222799, 0.8586, 18.0473, 290.3856);
CreateDynamicObject(18450, 1801.248779, -2312.205078, 48.444302, 0.8586, 18.0473, 290.3856);
CreateDynamicObject(8420, 1754.596436, -2267.727295, 61.259399, 0.0000, 0.0000, 110.0071);
CreateDynamicObject(1655, 1752.635742, -2308.737061, 63.115398, 11.1718, 0.0000, 171.7834);
CreateDynamicObject(3749, 1786.846924, -2274.841309, 66.719398, 0.0000, 0.0000, 19.7662);
CreateDynamicObject(17565, 1686.758057, -2594.649414, 15.055600, 0.0000, 0.0000, 269.7591);
CreateDynamicObject(13640, 1765.062012, -2235.102783, 61.931198, 0.0000, 0.0000, 21.4851);
CreateDynamicObject(13640, 1744.021851, -2243.576904, 62.231201, 0.0000, 0.0000, 21.4851);
CreateDynamicObject(8420, 1698.682617, -2288.073486, 61.065201, 0.0000, 0.0000, 289.5262);
CreateDynamicObject(13647, 1698.970215, -2285.436279, 61.037800, 0.0000, 0.0000, 20.6256);
CreateDynamicObject(13648, 1735.095215, -2272.055176, 61.031898, 0.0000, 0.0000, 110.0071);
CreateDynamicObject(16304, 1661.489258, -2274.046387, 66.080200, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(13638, 1711.534180, -2316.452393, 63.564201, 0.0000, 0.0000, 109.1476);
CreateDynamicObject(13636, 1706.535767, -2254.115967, 63.322201, 0.0000, 0.0000, 19.0099);
CreateDynamicObject(9241, 1377.781982, -2569.326904, 61.142700, 0.0000, 0.0000, 180.3777);
CreateDynamicObject(11395, 1378.524292, -2556.521484, 69.816498, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1632, 1648.712036, -2543.206299, 18.428200, 24.9228, 0.0000, 268.8997);
CreateDynamicObject(982, 1366.722046, -2589.855713, 62.642502, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(982, 1366.736084, -2589.864258, 63.817402, 0.0000, 180.3777, 0.0000);
CreateDynamicObject(1634, 2069.838135, -2669.776367, 13.404400, 0.0000, 0.0000, 333.3575);
CreateDynamicObject(6873, 1480.585205, -2650.375488, -71.836998, 0.0000, 0.0000, 89.2774);
CreateDynamicObject(1634, 1477.239746, -2622.692871, 36.972301, 14.6096, 0.0000, 104.8504);
CreateDynamicObject(1634, 1472.504028, -2623.887939, 42.931999, 36.0955, 0.0000, 104.8504);
CreateDynamicObject(1634, 1469.864990, -2624.497314, 50.599899, 54.1437, 0.0000, 104.8504);
CreateDynamicObject(1633, 1469.911499, -2624.647949, 59.070400, 76.4890, 0.0000, 98.7312);
CreateDynamicObject(4874, 1506.539795, -2647.961182, 71.324097, 0.0000, 0.0000, 179.5183);
CreateDynamicObject(5822, 1455.671753, -2654.448730, 77.668800, 0.0000, 0.0000, 183.9186);
CreateDynamicObject(5130, 1460.016602, -2636.435791, 66.608299, 0.0000, 0.0000, 41.2521);
CreateDynamicObject(1632, 1500.595581, -2632.825439, 64.169403, 28.3606, 0.0000, 269.7591);
CreateDynamicObject(13592, 1819.901489, -2574.535156, 22.092501, 359.9992, 1.7180, 99.6938);
CreateDynamicObject(13592, 1813.126465, -2574.660889, 22.067499, 359.9992, 1.7180, 99.6938);
CreateDynamicObject(13592, 1806.329834, -2574.768311, 22.017500, 359.9992, 1.7180, 99.6938);
CreateDynamicObject(13592, 1799.560303, -2574.928711, 22.017500, 359.9992, 1.7180, 99.6938);
CreateDynamicObject(13592, 1792.264648, -2575.060303, 21.992500, 359.9992, 1.7180, 99.6938);
CreateDynamicObject(13592, 1784.856323, -2575.215088, 21.942499, 359.9992, 1.7180, 99.6938);
CreateDynamicObject(1655, 1780.428833, -2570.052246, 14.372000, 10.3124, 0.0000, 3.4369);
CreateDynamicObject(1634, 1402.684692, -2660.955322, 13.525000, 0.0000, 0.0000, 340.2330);
CreateDynamicObject(1634, 1347.787964, -2551.638428, 13.422300, 0.0000, 0.0000, 271.4780);
CreateDynamicObject(1655, 1994.151978, -2494.006836, 14.464200, 10.3124, 0.0000, 268.0403);
CreateDynamicObject(1655, 2000.099609, -2494.226074, 20.596600, 35.2361, 0.0000, 268.0403);
CreateDynamicObject(1655, 2003.646240, -2494.394287, 28.103201, 48.9870, 0.0000, 268.0403);
CreateDynamicObject(1655, 2005.054810, -2494.494141, 35.544800, 63.5975, 0.0000, 268.0403);
CreateDynamicObject(1655, 2004.622559, -2494.518066, 43.859600, 77.3485, 0.0000, 268.0403);
CreateDynamicObject(1655, 2001.905640, -2494.495850, 51.196800, 97.1155, 0.0000, 268.0403);
CreateDynamicObject(1655, 1996.214355, -2494.325195, 57.474800, 121.1797, 0.0000, 268.0403);
CreateDynamicObject(1655, 1988.683228, -2493.810791, 61.165100, 140.9468, 0.8586, 265.4620);
CreateDynamicObject(8391, 1395.774780, -2431.324951, 28.960100, 0.0000, 0.0000, 282.6507);
CreateDynamicObject(1655, 1385.654297, -2424.471191, 14.304800, 8.5935, 0.0000, 90.2400);
CreateDynamicObject(1655, 1379.870605, -2424.461914, 19.593000, 30.0794, 0.0000, 90.2400);
CreateDynamicObject(1655, 1375.987793, -2424.422607, 25.912100, 41.2521, 0.0000, 90.2400);
CreateDynamicObject(1655, 1373.593872, -2424.473877, 33.308102, 57.5814, 0.0000, 90.2400);
CreateDynamicObject(1655, 1373.164551, -2424.494141, 41.648399, 71.3324, 0.0000, 90.2400);
CreateDynamicObject(1655, 1369.624512, -2460.229004, 48.677101, 13.7501, 0.0000, 191.6535);
CreateDynamicObject(1655, 1422.353271, -2402.304688, 48.702099, 13.7501, 0.0000, 282.7538);
CreateDynamicObject(4726, 1463.334106, -2396.343262, 49.803902, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(4727, 1463.315918, -2396.398193, 50.127701, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(7979, 1473.276123, -2546.425537, 15.633800, 0.0000, 0.0000, 90.2400);
CreateDynamicObject(10948, 1905.370728, -2250.657959, 62.393398, 0.0000, 0.0000, 89.2774);
CreateDynamicObject(5001, 1947.194702, -2290.480957, 32.918701, 80.7862, 312.7310, 133.2118);
CreateDynamicObject(1633, 1951.494751, -2272.379639, 13.058600, 354.8434, 358.2811, 357.4217);
CreateDynamicObject(1632, 1890.504761, -2273.584473, 59.199799, 16.3285, 0.0000, 87.6617);
CreateDynamicObject(1632, 1886.002808, -2273.401855, 65.116798, 42.1116, 0.0000, 87.6617);
CreateDynamicObject(1632, 1884.591309, -2273.360352, 71.989304, 67.8947, 0.0000, 87.6617);
CreateDynamicObject(1632, 1885.802490, -2273.252441, 79.782898, 85.9428, 0.0000, 94.5372);
CreateDynamicObject(1632, 1911.164917, -2211.925537, 83.174797, 16.3285, 0.0000, 1.7180);
CreateDynamicObject(1632, 1911.111450, -2207.342529, 89.172302, 42.1116, 0.0000, 1.7180);
CreateDynamicObject(1632, 1911.143066, -2205.306152, 96.662498, 61.8786, 0.0000, 358.2811);
CreateDynamicObject(1655, 1847.484131, -2245.543701, 105.724800, 0.0000, 0.0000, 104.7473);
CreateDynamicObject(13638, 1704.099854, -2331.697266, 71.681999, 0.0000, 0.0000, 109.1476);
CreateDynamicObject(13592, 1402.820923, -2595.449707, 64.366898, 274.0563, 0.0000, 354.8434);
CreateDynamicObject(4113, 1377.558105, -2576.031250, 23.350500, 0.0000, 0.0000, 278.3535);
CreateDynamicObject(1684, 1886.183350, -2195.461182, 103.239502, 0.0000, 0.0000, 269.7591);
CreateDynamicObject(1684, 1886.146973, -2205.505859, 103.239502, 0.0000, 0.0000, 269.7591);
CreateDynamicObject(1684, 1886.100830, -2215.551270, 103.245300, 0.0000, 0.0000, 269.7591);
CreateDynamicObject(13638, 1688.669312, -2333.504883, 79.768501, 0.0000, 0.0000, 18.9068);
CreateDynamicObject(13562, 2120.880371, -2549.072998, 44.203701, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1632, 2062.549072, -2548.640381, 14.922000, 17.1879, 0.0000, 268.0403);
CreateDynamicObject(7073, 1978.316528, -2627.284912, 51.815102, 0.0000, 0.0000, 85.9428);
CreateDynamicObject(1632, 1977.298462, -2616.755615, 13.847000, 11.1718, 359.1406, 180.3777);
CreateDynamicObject(1632, 1977.379517, -2622.045166, 20.521999, 43.8304, 359.1406, 180.3777);
CreateDynamicObject(1633, 1977.407593, -2623.667480, 27.269899, 64.4569, 0.0000, 179.5183);
CreateDynamicObject(1633, 1977.413818, -2624.445801, 34.597900, 71.3324, 0.0000, 179.5183);
CreateDynamicObject(1633, 1977.273315, -2624.133789, 41.347198, 82.5051, 0.0000, 179.5183);
CreateDynamicObject(13722, 2045.721436, -2638.500488, 21.983400, 0.0000, 0.0000, 180.3777);
CreateDynamicObject(13831, 2045.705200, -2638.513428, 21.963200, 0.0000, 0.0000, 180.3777);
CreateDynamicObject(3256, 2130.853760, -2513.309570, 13.184600, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(1267, 2139.728271, -2489.103516, 28.611601, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(6066, 2111.718994, -2493.414307, 15.047300, 0.0000, 0.0000, 184.7780);
CreateDynamicObject(1655, 2105.789795, -2493.889404, 13.689200, 2.5775, 0.0000, 274.9158);
CreateDynamicObject(6875, 2137.073486, -2400.591309, 6.795400, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(6066, 2091.997803, -2448.851074, 15.047300, 0.0000, 0.0000, 232.0471);
CreateDynamicObject(1655, 2088.406250, -2453.489014, 13.772000, 2.5775, 0.0000, 322.1848);
CreateDynamicObject(9237, 2095.310059, -2638.382568, 20.532301, 0.0000, 0.0000, 282.6507);
CreateDynamicObject(1632, 1438.716187, -2633.659668, 84.260002, 3.4369, 0.0000, 54.9000);
CreateDynamicObject(4005, 1560.745850, -2382.553223, 20.350100, 0.0000, 0.0000, 3.4369);
CreateDynamicObject(6066, 1565.314575, -2435.892090, 14.954700, 0.0000, 0.0000, 275.0189);
CreateDynamicObject(1655, 1565.649536, -2441.830566, 13.704800, 3.4369, 0.0000, 4.2963);
CreateDynamicObject(6099, 1860.553223, -2657.668945, 21.084499, 0.0000, 0.0000, 0.0000);
CreateDynamicObject(6066, 1860.459229, -2581.176025, 15.022300, 0.0000, 0.0000, 86.9054);
CreateDynamicObject(1655, 1860.693604, -2575.076660, 13.772000, 2.5775, 0.0000, 176.0805);
CreateDynamicObject(1655, 1860.318970, -2633.533203, 36.981800, 2.5775, 0.0000, 0.8586);
CreateDynamicObject(1632, 1389.174683, -2556.167725, 63.270901, 4.2963, 0.0000, 330.7792);
CreateDynamicObject(11111, 1458.462891, -2497.312744, 2.154700, 329.0603, 0.0000, 269.7591);
CreateDynamicObject(1378, 2036.934326, -2373.857666, 36.613098, 0.0000, 0.0000, 312.7310);
CreateDynamicObject(1632, 1983.898193, -2421.146729, 13.847000, 4.2963, 0.0000, 310.9090);
CreateDynamicObject(1632, 1981.232300, -2418.039795, 13.847000, 4.2963, 0.0000, 310.9090);
CreateDynamicObject(1655, 1985.927124, -2416.703369, 17.139999, 30.0794, 0.0000, 311.0121);
CreateDynamicObject(1632, 2020.638306, -2389.098145, 44.242699, 23.2039, 0.0000, 310.9090);
CreateDynamicObject(13666, 3052.515381, -1840.305664, 52.204941, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3052.338135, -1836.969604, 52.176296, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3052.158936, -1833.405029, 52.128571, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.996826, -1829.739746, 51.976429, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.842285, -1826.255005, 51.859589, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.709229, -1822.634766, 51.746838, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.550049, -1819.246826, 51.583370, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.449219, -1816.028076, 51.440907, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.303711, -1812.538208, 51.378212, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.180176, -1808.718262, 51.405933, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3035.882324, -1839.997559, 52.979988, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3035.737793, -1836.406860, 52.974236, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3035.697754, -1832.885254, 52.980530, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3035.569824, -1829.338257, 52.942421, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3035.325684, -1825.600464, 52.977314, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3035.168945, -1821.834839, 53.000053, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3034.936768, -1818.320557, 52.997894, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3034.855469, -1814.870483, 52.917194, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3034.647461, -1811.116089, 52.927166, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3034.500732, -1807.744995, 52.913383, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3034.248291, -1804.018433, 52.889458, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3051.006104, -1804.868896, 51.365555, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3050.839844, -1801.209106, 51.370567, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3050.654297, -1797.701538, 51.384758, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3050.496338, -1793.910034, 51.419392, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3050.256104, -1790.433350, 51.352634, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3050.041504, -1786.828491, 51.352535, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3049.873047, -1783.012329, 51.314941, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3049.771729, -1779.396606, 51.384373, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3049.621826, -1775.631104, 51.307220, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3049.450928, -1772.264282, 51.322983, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3049.306641, -1768.715698, 51.333485, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3049.120605, -1765.409668, 51.340683, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3048.941650, -1761.644531, 51.357754, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3048.764160, -1757.916260, 51.351845, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3048.614258, -1754.118652, 51.358200, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3048.459717, -1750.341675, 51.383377, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3048.302734, -1746.678101, 51.421173, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3047.767090, -1744.952759, 51.466885, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3047.067871, -1742.198853, 51.456131, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3046.225098, -1738.990479, 51.412632, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3045.626465, -1735.470337, 51.421181, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3044.752441, -1732.001709, 51.441811, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3043.812256, -1728.465820, 51.432629, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3042.899170, -1724.929688, 51.458122, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3041.956299, -1721.143799, 51.413338, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3041.064453, -1717.392700, 51.360329, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3040.143799, -1713.646851, 51.341011, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3039.375244, -1710.731201, 51.354790, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3038.533447, -1707.363403, 51.338013, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3037.657959, -1703.961914, 51.357956, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3036.782715, -1700.361084, 51.348366, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3035.820068, -1696.593750, 51.304985, 357.4217, 0.0000, 291.5659);
CreateDynamicObject(13666, 3034.877441, -1693.091675, 51.291039, 0.0000, 358.2811, 292.4998);
CreateDynamicObject(13666, 3033.943848, -1689.359741, 51.166714, 0.0000, 357.4217, 292.4998);
CreateDynamicObject(13666, 3033.005127, -1685.682617, 50.937668, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3032.092773, -1682.074463, 51.017879, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3031.210693, -1678.616455, 51.004082, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3030.325684, -1675.139282, 50.975128, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3029.452637, -1671.744873, 50.994633, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3028.578613, -1668.274048, 50.999519, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3027.749512, -1664.753540, 51.008209, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3026.938965, -1661.381348, 51.016682, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3026.070068, -1657.961792, 51.037071, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3025.163574, -1654.370728, 51.006233, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3024.255615, -1650.845703, 51.018764, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3023.322266, -1647.110718, 50.969742, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3022.645264, -1644.148804, 50.931648, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3021.787598, -1640.822266, 50.930161, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3020.924561, -1636.868896, 50.858173, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3021.206787, -1633.017700, 50.405334, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3021.039551, -1629.755737, 50.405346, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3020.885986, -1625.986328, 50.369377, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3020.673584, -1622.647461, 50.366650, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3020.483154, -1618.878296, 50.339378, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3020.280762, -1615.276733, 50.319221, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3020.077881, -1611.654907, 50.275330, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3019.921875, -1608.275269, 50.229343, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3019.740723, -1604.729736, 50.225266, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3019.572266, -1601.061279, 50.241447, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3019.444336, -1597.649536, 50.235664, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3019.253906, -1594.001587, 50.201061, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3019.114746, -1590.551147, 50.197891, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3018.915771, -1586.916260, 50.171486, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3018.778809, -1583.444214, 50.181419, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3018.595703, -1580.111328, 50.166904, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3018.389404, -1576.603149, 50.176613, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3018.224854, -1573.155518, 50.171062, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3018.044434, -1569.387085, 50.177578, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3017.852295, -1565.487549, 50.207726, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3017.577881, -1561.905762, 50.224880, 358.2811, 0.0000, 281.2527);
CreateDynamicObject(13666, 3017.495117, -1558.169922, 50.344273, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3034.037354, -1800.248047, 52.873199, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3033.865479, -1796.469971, 52.826935, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3033.716064, -1793.051270, 52.842415, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3033.598877, -1789.260620, 52.848919, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3033.406738, -1785.466797, 52.869438, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3033.266357, -1781.802124, 52.827000, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3033.049805, -1777.931274, 52.865067, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3032.906982, -1774.354736, 52.897736, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3032.715820, -1770.530518, 52.924408, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3032.486816, -1766.708130, 52.949898, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3032.287109, -1763.089844, 52.976196, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3032.108398, -1759.467163, 52.997429, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3031.924561, -1755.850708, 52.890621, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3031.782959, -1752.357422, 52.899235, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3031.605713, -1748.987671, 52.840233, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3031.108398, -1746.313599, 52.752182, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3030.246582, -1742.918335, 52.678791, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3029.400879, -1739.514526, 52.655334, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3028.544678, -1736.117188, 52.637398, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3027.649170, -1732.534302, 52.625584, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3026.806641, -1729.257813, 52.629486, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3025.896240, -1725.526367, 52.633995, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3025.017822, -1722.021484, 52.636185, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3024.183350, -1718.508911, 52.554413, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3023.239990, -1714.751343, 52.569332, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3022.312988, -1711.161133, 52.511452, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3021.524170, -1707.780396, 52.414177, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3020.567627, -1704.253052, 52.362968, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3019.710938, -1700.770386, 52.352711, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3018.863281, -1697.492310, 52.257004, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3017.883789, -1693.766846, 52.302399, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3017.017822, -1690.433472, 52.303802, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3016.166016, -1687.046753, 52.285553, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3015.314941, -1683.545532, 52.233681, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3014.502686, -1680.428223, 52.262878, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3013.571289, -1676.812378, 52.260658, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3012.687500, -1673.419678, 52.236370, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3011.779297, -1669.788330, 52.238937, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3010.931396, -1666.291992, 52.231445, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3010.078369, -1662.800049, 52.197678, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3009.259277, -1659.463013, 52.152756, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3008.387451, -1655.845337, 52.172333, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3007.465576, -1652.279419, 52.111740, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3006.665039, -1649.040649, 52.086700, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3006.196533, -1646.128052, 51.939919, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3006.093018, -1642.271240, 51.978317, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3005.911865, -1638.440674, 52.008720, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3005.697754, -1634.860718, 52.012894, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3005.515137, -1631.053223, 52.014503, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3005.312500, -1627.202148, 52.051483, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3005.232910, -1623.626221, 52.037521, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3004.982422, -1620.091064, 51.918442, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3004.842773, -1616.586182, 51.878418, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3004.648193, -1612.854370, 51.885139, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3004.442871, -1609.284180, 51.880184, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3004.305176, -1605.593750, 51.808594, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3004.200684, -1602.007202, 51.814247, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3004.005371, -1598.526978, 51.788773, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3003.817383, -1594.848389, 51.793594, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3003.662109, -1591.393799, 51.735878, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3003.485840, -1587.844849, 51.606628, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3003.353760, -1584.457886, 51.536278, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3003.178711, -1580.977661, 51.580269, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3002.983643, -1577.269043, 51.513969, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3002.821045, -1573.788940, 51.520363, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3002.659180, -1570.155396, 51.444324, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3002.486572, -1566.569092, 51.395546, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3002.306885, -1562.946533, 51.401802, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3002.101074, -1559.201416, 51.378582, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3021.316895, -1638.813477, 50.920414, 0.0000, 0.0000, 292.4998);
CreateDynamicObject(13666, 3020.891113, -1635.009644, 50.631191, 0.0000, 0.0000, 281.2527);
CreateDynamicObject(13666, 3002.006592, -1556.418213, 51.146820, 0.0000, 356.5623, 281.2527);
CreateDynamicObject(13666, 3036.094727, -1843.495483, 52.611370, 0.0000, 5.1558, 281.2527);



	respawnGun = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnGun, 0, "Selecione a classe de armas:");
	AddMenuItem(respawnGun, 0, "Pistolas");  
	AddMenuItem(respawnGun, 0, "Micro SMGs");  
	AddMenuItem(respawnGun, 0, "Shotguns");  	
	AddMenuItem(respawnGun, 0, "SMG");  	
	AddMenuItem(respawnGun, 0, "Rifles");  	
	AddMenuItem(respawnGun, 0, "Assalto");  	
	AddMenuItem(respawnGun, 0, "Utilitarios"); 
	AddMenuItem(respawnGun, 0, "<Sair>");     	

	respawnPistolas = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnPistolas, 0, "Arma	-	Preco");
	AddMenuItem(respawnPistolas, 0, "9 mm 	-	$5000");  				
	AddMenuItem(respawnPistolas, 0, "9 mm Silenciada	-	$5000");  	
	AddMenuItem(respawnPistolas, 0, "Desert Eagle	-	$10000");
	AddMenuItem(respawnPistolas, 0, "<Voltar>");    					

	respawnMicroSMGs = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnMicroSMGs, 0, "Arma	-	Preco");
	AddMenuItem(respawnMicroSMGs, 0, "Tec9	-	$70000");  			
	AddMenuItem(respawnMicroSMGs, 0, "Micro SMG		-	$65000");   
	AddMenuItem(respawnMicroSMGs, 0, "<Voltar>");    			

	respawnShotguns = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnShotguns, 0, "Arma	-	Preco");
	AddMenuItem(respawnShotguns, 0, "Shotgun -	$25000");  			
	AddMenuItem(respawnShotguns, 0, "Saw-off Shotgun - $55000");  	
	AddMenuItem(respawnShotguns, 0, "Combat Shotgun - $75000");  	
	AddMenuItem(respawnShotguns, 0, "<Voltar>");    			

	respawnSMG = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnSMG, 0, "Arma	-	Preco");
	AddMenuItem(respawnSMG, 0, "MP5		-	$75000");  
	AddMenuItem(respawnSMG, 0, "<Voltar>");             

	respawnRifles = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnRifles, 0, "Arma		-	Preco");
	AddMenuItem(respawnRifles, 0, "Rifle	-	$75000");  			
	AddMenuItem(respawnRifles, 0, "Sniper Rifle		-	$120000");  
	AddMenuItem(respawnRifles, 0, "<Voltar>");                      

	respawnAssalto = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnAssalto, 0, "Arma	-	Preco");
	AddMenuItem(respawnAssalto, 0, "AK47	-	$150000");  	
	AddMenuItem(respawnAssalto, 0, "M4		-	$200000");  	
	AddMenuItem(respawnAssalto, 0, "<Voltar>");                

	respawnUltilitarios = CreateMenu("~w~Armas para ~b~Respawn", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(respawnUltilitarios, 0, "Arma	-	Preco");
	AddMenuItem(respawnUltilitarios, 0, "Granada	-	$9999999999");  	
	AddMenuItem(respawnUltilitarios, 0, "Motoserra	-	$35000");  			
	AddMenuItem(respawnUltilitarios, 0, "Katana		-	$5000");  		
	AddMenuItem(respawnUltilitarios, 0, "Lata de Spray		-	$25000");  	
	AddMenuItem(respawnUltilitarios, 0, "<Voltar>");                        

	banco = CreateMenu("Banco", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(banco, 0, "Selecione a conta:");
	AddMenuItem(banco, 0, "Conta Pessoal"); 
	AddMenuItem(banco, 0, "Conta da Gang");  
	AddMenuItem(banco, 0, "<Sair>");     	 

	bancoAcao = CreateMenu("Banco", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(bancoAcao, 0, "Selecione uma opcao:");
	AddMenuItem(bancoAcao, 0, "Depositar"); 
	AddMenuItem(bancoAcao, 0, "Sacar");      
	AddMenuItem(bancoAcao, 0, "Saldo");     
	AddMenuItem(bancoAcao, 0, "<Voltar>");   

	bancoDepositar = CreateMenu("Banco", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(bancoDepositar, 0, "Selecione a quantia a depositar:");
	AddMenuItem(bancoDepositar, 0, "$100"); 	
	AddMenuItem(bancoDepositar, 0, "$1000"); 	
	AddMenuItem(bancoDepositar, 0, "$5000"); 	
	AddMenuItem(bancoDepositar, 0, "$10000"); 	
	AddMenuItem(bancoDepositar, 0, "$30000"); 
	AddMenuItem(bancoDepositar, 0, "$50000"); 
	AddMenuItem(bancoDepositar, 0, "$100000"); 	
	AddMenuItem(bancoDepositar, 0, "$300000"); 	
	AddMenuItem(bancoDepositar, 0, "$500000"); 
	AddMenuItem(bancoDepositar, 0, "<Depositar Tudo>"); 	
	AddMenuItem(bancoDepositar, 0, "<Voltar>"); 		

	bancoSacar = CreateMenu("Banco", 1, 20, 120, 300, 40);
	SetMenuColumnHeader(bancoSacar, 0, "Selecione a quantia a sacar:");
	AddMenuItem(bancoSacar, 0, "$100"); 
	AddMenuItem(bancoSacar, 0, "$1000"); 	
	AddMenuItem(bancoSacar, 0, "$5000"); 	
	AddMenuItem(bancoSacar, 0, "$10000"); 
	AddMenuItem(bancoSacar, 0, "$30000"); 	
	AddMenuItem(bancoSacar, 0, "$50000"); 
	AddMenuItem(bancoSacar, 0, "$100000"); 	
	AddMenuItem(bancoSacar, 0, "$300000"); 	
	AddMenuItem(bancoSacar, 0, "$500000"); 
	AddMenuItem(bancoSacar, 0, "<Sacar Tudo>"); 
	AddMenuItem(bancoSacar, 0, "<Voltar>"); 	

	bancoSaldo = CreateMenu("Banco", 1, 20, 120, 300, 40);

	SetTimer("GzScoreUpdate", 2001, true);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("checkpointUpdate", 1100, 1);
	SetTimer("PirateShipScoreUpdate", 2001, 1);
	SetTimer("PropertyScoreUpdate", 40005, 1);
	SetTimer("SavedUpdate",3600000, 1);
	SetTimer("TimeUpdate",60009, 1);
	SetTimer("VisibilityUpdate", 1500, 1);

	//SetTimer("GameModeExitFunc", gRoundTime, 0);
	
	for(new v;v<MAX_VEHICLES;v++)LinkVehicleToInterior(veiculo[1], 15);
	for(new i=1; i<1;i++){
	LinkVehicleToInterior(i,15);
	}

	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:Current = GetPlayerMenu(playerid);
    new string[256];
	new moneys;

	if(Current == banco)
	{
	    switch(row)
		{
			case 0: 
	        {
   				gangConta[playerGang[playerid]] = 0;
				ShowMenuForPlayer(bancoAcao,playerid);
 				TogglePlayerControllable(playerid, 0);
			}
			case 1: 
	        {
       			if(playerGang[playerid] == 0)
				{
					SendClientMessage(playerid, COLOR_RED, "BANCO: Você não está em uma gang!");
					ShowMenuForPlayer(banco,playerid);
				}
				else
				{
				    gangConta[playerGang[playerid]] = 1;
					ShowMenuForPlayer(bancoAcao,playerid);
 					TogglePlayerControllable(playerid, 0);
 				}
			}
			case 2: //
	        {
				OnPlayerExitedMenu(playerid);
			}
		}
	}
	else if(Current == bancoAcao)
	{
	    switch(row)
		{
			case 0:
	        {
				ShowMenuForPlayer(bancoDepositar,playerid);
			}
			case 1:
	        {
				ShowMenuForPlayer(bancoSacar,playerid);
			}
			case 2: 
	        {
				if(gangConta[playerGang[playerid]] == 1 && playerGang[playerid] > 0)
				{
					//format(string, sizeof(string), "BANCO: O saldo da gang é de: $%d", gangBank[playerGang[playerid]]);
					format(string, sizeof(string), "Saldo da Gang: ~g~$%d", gangBank[playerGang[playerid]]);
				}
				else
				{
					//format(string, sizeof(string), "BANCO: Seu saldo é de: $%d.", bank[playerid]);
					format(string, sizeof(string), "Seu Saldo: ~g~$%d", bank[playerid]);
				}

				SetMenuColumnHeader(bancoSaldo, 0, string);

				if(vSaldo[0] == 0)
				{
					AddMenuItem(bancoSaldo, 0, "<Voltar>");
					vSaldo[0] = 1;
				}

				ShowMenuForPlayer(bancoSaldo,playerid);
			}
			case 3:
	        {
				ShowMenuForPlayer(banco,playerid);
			}
		}
	}
	else if(Current == bancoDepositar)
	{
 		switch(row)
		{
			case 0:
	        {
				BancoDeposito(playerid, 100);
			}
			case 1:
	        {
				BancoDeposito(playerid, 1000);
			}
			case 2:
	        {
				BancoDeposito(playerid, 5000);
			}
			case 3:
	        {
				BancoDeposito(playerid, 10000);
			}
			case 4:
	        {
				BancoDeposito(playerid, 30000);
			}
			case 5:
	        {
				BancoDeposito(playerid, 50000);
			}
			case 6:
	        {
				BancoDeposito(playerid, 100000);
			}
			case 7:
	        {
				BancoDeposito(playerid, 300000);
			}
			case 8:
	        {
				BancoDeposito(playerid, 500000);
			}
			case 9: 
	        {
       			if(GetPlayerMoney(playerid) == 0)
				{
					SendClientMessage(playerid, COLOR_RED, "BANCO: Você não tem dinheiro para depositar!");
					ShowMenuForPlayer(bancoDepositar,playerid);
					return 1;
				}

     			moneys = GetPlayerMoney(playerid);
     			BancoDeposito(playerid, moneys);
			}
			case 10: 
	        {
				ShowMenuForPlayer(bancoAcao,playerid);
			}
		}
	}
	else if(Current == bancoSacar)
	{
		switch(row)
		{
			case 0:
	        {
				BancoSaca(playerid, 100);
			}
			case 1:
	        {
				BancoSaca(playerid, 1000);
			}
			case 2:
	        {
				BancoSaca(playerid, 5000);
			}
			case 3:
	        {
				BancoSaca(playerid, 10000);
			}
			case 4:
	        {
				BancoSaca(playerid, 30000);
			}
			case 5:
	        {
				BancoSaca(playerid, 50000);
			}
			case 6:
	        {
				BancoSaca(playerid, 100000);
			}
			case 7:
	        {
				BancoSaca(playerid, 300000);
			}
			case 8:
	        {
				BancoSaca(playerid, 500000);
			}
			case 9:
	        {
				if(gangConta[playerGang[playerid]] == 1 && playerGang[playerid] > 0)
				{
 					if(gangBank[playerGang[playerid]] == 0)
					{
						SendClientMessage(playerid, COLOR_RED, "BANCO: Não tem dinheiro na conta da gang!");
						ShowMenuForPlayer(bancoSacar,playerid);
						return 1;
					}
					moneys = gangBank[playerGang[playerid]];
				}
				else
				{
	       			if(bank[playerid] == 0)
					{
						SendClientMessage(playerid, COLOR_RED, "BANCO: Você não tem dinheiro no banco!");
						ShowMenuForPlayer(bancoSacar,playerid);
						return 1;
					}
					moneys = bank[playerid];
				}

                BancoSaca(playerid, moneys);
			}
			case 10: 
	        {
				ShowMenuForPlayer(bancoAcao,playerid);
			}
		}
	}
	else if(Current == bancoSaldo)
	{
		switch(row)
		{
			case 0:
	        {
				ShowMenuForPlayer(bancoAcao,playerid);
			}
		}
	}
	else if(Current == respawnGun)
	{
		switch(row)
		{
			case 0: 
	        {
				ShowMenuForPlayer(respawnPistolas,playerid);
			}
			case 1: 
	        {
				ShowMenuForPlayer(respawnMicroSMGs,playerid);
			}
			case 2: 
	        {
				ShowMenuForPlayer(respawnShotguns,playerid);
			}
			case 3:
	        {
				ShowMenuForPlayer(respawnSMG,playerid);
			}
			case 4: 
	        {
				ShowMenuForPlayer(respawnRifles,playerid);
			}
			case 5: 
	        {
				ShowMenuForPlayer(respawnAssalto,playerid);
			}
			case 6: 
	        {
				ShowMenuForPlayer(respawnUltilitarios,playerid);
			}
			case 7:
	        {
				OnPlayerExitedMenu(playerid);
			}
		}
	}
	else if(Current == respawnPistolas)
	{
		switch(row)
		{
			case 0:
	        {
				ArmasRespawn(playerid, 0);
			}
			case 1: 
	        {
				ArmasRespawn(playerid, 1);
			}
			case 2: 
	        {
				ArmasRespawn(playerid, 2);
			}
			case 3: 
	        {
				ShowMenuForPlayer(respawnGun,playerid);
			}
		}
	}
	else if(Current == respawnMicroSMGs)
	{
		switch(row)
		{
			case 0: 
	        {
				ArmasRespawn(playerid, 6);
			}
			case 1: 
	        {
				ArmasRespawn(playerid, 7);
			}
			case 2:
	        {
				ShowMenuForPlayer(respawnGun,playerid);
			}
		}
	}
	else if(Current == respawnShotguns)
	{
		switch(row)
		{
			case 0: 
	        {
				ArmasRespawn(playerid, 3);
			}
			case 1: 
	        {
				ArmasRespawn(playerid, 4);
			}
			case 2: 
	        {
				ArmasRespawn(playerid, 5);
			}
			case 3: 
	        {
				ShowMenuForPlayer(respawnGun,playerid);
			}
		}
	}
	else if(Current == respawnSMG)
	{
		switch(row)
		{
			case 0: 
	        {
				ArmasRespawn(playerid, 8);
			}
			case 1: 
	        {
				ShowMenuForPlayer(respawnGun,playerid);
			}
		}
	}
	else if(Current == respawnRifles)
	{
		switch(row)
		{
			case 0: 
	        {
				ArmasRespawn(playerid, 11);
			}
			case 1: 
	        {
				ArmasRespawn(playerid, 12);
			}
			case 2: 
	        {
				ShowMenuForPlayer(respawnGun,playerid);
			}
		}
	}
	else if(Current == respawnAssalto)
	{
		switch(row)
		{
			case 0: 
	        {
				ArmasRespawn(playerid, 9);
			}
			case 1: 
	        {
				ArmasRespawn(playerid, 10);
			}
			case 2: 
	        {
				ShowMenuForPlayer(respawnGun,playerid);
			}
		}
	}
	else if(Current == respawnUltilitarios)
	{
		switch(row)
		{
			case 0: 
	        {
				ArmasRespawn(playerid, 13);
			}
			case 1: 
	        {
				ArmasRespawn(playerid, 14);
			}
			case 2: 
	        {
				ArmasRespawn(playerid, 15);
			}
			case 3: 
	        {
				ArmasRespawn(playerid, 16);
			}
			case 4: 
	        {
				ShowMenuForPlayer(respawnGun,playerid);
			}
		}
	}
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
    gangConta[playerGang[playerid]] = 0;
    TogglePlayerControllable(playerid, 1);
	return 1;
}
public BancoDeposito(playerid, moneys)
{
    new string[256];

	if(GetPlayerMoney(playerid) < moneys)
	{
		SendClientMessage(playerid, COLOR_RED, "BANCO: Você não tem tudo isso de dinheiro!");
		ShowMenuForPlayer(bancoDepositar,playerid);
		return 1;
	}

	GivePlayerMoney(playerid, 0-moneys);

	if(gangConta[playerGang[playerid]] == 1 && playerGang[playerid] > 0)
 	{
 		gangBank[playerGang[playerid]] += moneys;
 		format(string, sizeof(string), "BANCO: Você depositou na conta da gang $%d, sua gang tem saldo de: $%d.", moneys, gangBank[playerGang[playerid]]);
 	}
 	else
 	{
 	    bank[playerid] += moneys;
		format(string, sizeof(string), "BANCO: Você depositou em sua conta $%d, seu saldo é de: $%d.", moneys, bank[playerid]);
 	}

 	SendClientMessage(playerid, COLOR_YELLOW, string);
 	return ShowMenuForPlayer(bancoDepositar,playerid);
}

public BancoSaca(playerid, moneys)
{
	new string[256];
	new str = 0;

	if(gangConta[playerGang[playerid]] == 1 && playerGang[playerid] > 0)
 	{
		if(gangBank[playerGang[playerid]] < moneys)
		{
			SendClientMessage(playerid, COLOR_RED, "BANCO: Não tem tudo isso na conta da gang!");
		}
	 	else
		{
   			GivePlayerMoney(playerid, moneys);
			gangBank[playerGang[playerid]] -= moneys;
			format(string, sizeof(string), "BANCO: Você sacou da conta da gang $%d, saldo da gang é de: $%d.", moneys, gangBank[playerGang[playerid]]);
			str = 1;
		}
 	}
 	else
 	{
		if(bank[playerid] < moneys)
		{
			SendClientMessage(playerid, COLOR_RED, "BANCO: Você não tem tudo isso em sua conta!");
		}
	 	else
		{
   			GivePlayerMoney(playerid, moneys);
			bank[playerid] -= moneys;
			format(string, sizeof(string), "BANCO: Você sacou de sua conta $%d, saldo atual de: $%d.", moneys, bank[playerid]);
			str = 1;
		}
	}

	if(str == 1)
	{
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}

	return ShowMenuForPlayer(bancoSacar,playerid);
}

public ArmasRespawn(playerid, weaponid)
{
		new string[256];

		if(GetPlayerMoney(playerid) < weaponCost[weaponid])
		{
			SendClientMessage(playerid, COLOR_RED, "Você não tem dinheiro suficiente para comprar essa arma!");
		}
		else
		{
			GivePlayerMoney(playerid, 0-weaponCost[weaponid]);
			GivePlayerWeapon(playerid, weaponIDs[weaponid], weaponAmmo[weaponid]);
			playerWeapons[playerid][weaponid]++;
			format (string, sizeof(string), "Você comprou %s para respawn!",weaponNames[weaponid]);
			SendClientMessage(playerid, COLOR_ORANGE, string);
		}

		return ShowMenuForPlayer(respawnGun,playerid);
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


public RandomMSGs()
{
new string[256];
new random1 = random(sizeof(MSGs));
new random2 = random(sizeof(COLORS));
format(string, sizeof(string), "%s", MSGs[random1]);
SendClientMessageToAll(COLORS[random2],string);
return 1;
}

public FixHour(hour)
{
	hour = timeshift+hour;

	if(hour < 0)
	{
		hour = hour+24;
	}
	else if (hour > 23)
	{
		hour = hour-24;
	}

	shifthour = hour;
	return 1;
}

public UpperToLower(text[])
{
	for(new Char ; Char < strlen(text) ; Char++)
	{
		if(text[Char] > 64 && text[Char] < 91)
  		{
			text[Char] += 32;
		}
	}
	return 1;
}

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	new string[256];
		new PlayerName[MAX_PLAYER_NAME];
	new RecName[MAX_PLAYER_NAME];
	GetPlayerName(recieverid, RecName, sizeof(RecName));
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));

    if(recieverid != playerid)
	{
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	GetPlayerName(recieverid, RecName, sizeof(RecName));
	PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
	PlayerPlaySound(recieverid,1057,0.0,0.0,0.0);
	format(string, sizeof(string), "[PM] Recebida de %s(%i): %s", PlayerName, playerid, text);
	SendClientMessage(recieverid,Amarelo, string);
	format(string, sizeof(string), "[PM] Enviada para %s(%i): %s", RecName, recieverid, text);
	SendClientMessage(playerid,Amarelo, string);
	}
	else
	{
	format(string, sizeof(string), "[ERRO] Esse player não esta Online!", recieverid);
	SendClientMessage(playerid, COLOR_RED, string);
	}
	return 0;

}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new str[256];
    new oldnew;
	if (newstate == 2 || newstate == 3)
    {
    if (oldnew == 0)
    	{
        format(str, sizeof(str), "~g~%s",vehName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
        GameTextForPlayer(playerid, str, 6000, 1);
		}
	}
	return 1;
}

public VisibilityUpdate()
{
	new dist;
	new Float:x, Float:x1, Float:y, Float:y1, Float:tmp;

	for(new i = 0; i < GetMaxPlayers(); i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        GetPlayerPos(i, x, y, tmp);
	        for(new j = 0; j < GetMaxPlayers(); j++)
	        {
	            if(IsPlayerConnected(j) && j != i)
	            {
					GetPlayerPos(j, x1, y1, tmp);
	                dist = floatround(floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2)));
	                if(dist <= 75) SetPlayerMarkerForPlayer(i, j, GetPlayerColor(j));
	                else if(dist <= 90) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x000000EE));
	                else if(dist <= 150) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x000000EE));
	                else if(dist <= 300) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x000000DD));
	                else if(dist <= 400) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x000000CC));
	                else if(dist <= 500) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x000000BB));
	                else if(dist <= 600) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x000000AA));
	                else if(dist <= 700) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000099));
	                else if(dist <= 800) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000088));
	                else if(dist <= 900) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000077));
	                else if(dist <= 1000) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000066));
	                else if(dist <= 1200) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000055));
	                else if(dist <= 1400) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000044));
	                else if(dist <= 1600) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000033));
	                else if(dist <= 2000) SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000022));
	                else SetPlayerMarkerForPlayer(i, j, ((GetPlayerColor(j) & 0xFFFFFF00) | 0x00000011));

	                if(GetPlayerInterior(i) != GetPlayerInterior(j)) SetPlayerMarkerForPlayer(i, j, (GetPlayerColor(j) & 0xFFFFFF00));
				}
			}
		}
	}
}



