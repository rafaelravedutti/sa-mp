#include <a_samp>
#include <core>
#include <float>

#pragma tabsize 0

#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF9900AA

#define FILTERSCRIPT
#define GIVECASH_DELAY 5000 // Time in ms between /givecash commands.

#define NUMVALUES 4

#define CP_BANK 		0
#define CP_PIRATE 		1
#define CP_SKYSCARPER 	2
#define CP_ZOMBOTECH 	3
#define CP_AMMU     	4
#define CP_AMMU_2     	5
#define CP_BANK_2 		6
#define CP_BANK_3 		7
#define CP_LS_AIR 		8
#define CP_SF_AIR 		9
#define CP_LV_AIR 		10
#define CP_ALAHAM   	11
#define CP_DIDERSACHS   12
#define CP_BAR      	13
#define CP_HAIRSTUD 	14
#define CP_ZIP      	15
#define CP_BINCO    	16
#define CP_TATOO    	17
#define CP_GOLF 		18
#define CP_WANG 		19
#define CP_HOTEL 		20
#define CP_OTTOS 		21
#define CP_DRAGON       22
#define CP_CALIGULA     23
#define CP_SEXSHOP      24
#define CP_CATHAY     	25
#define CP_VERONA     	26
#define CP_ZERORC     	27
#define CP_JIZZYS     	28
#define CP_PIRAMID     	29

#define P_ALAHAM    	0
#define P_DIDERSACHS  	1
#define P_BAR       	2
#define P_HAIRSTUD  	3
#define P_ZIP       	4
#define P_BINCO     	5
#define P_TATOO     	6
#define P_GOLF 			7
#define P_WANG 			8
#define P_HOTEL 		9
#define P_OTTOS 		10
#define P_DRAGON      	11
#define P_CALIGULA   	12
#define P_SEXSHOP    	13
#define P_CATHAY      	14
#define P_VERONA      	15
#define P_ZERORC     	16
#define P_JIZZYS      	17
#define P_PIRAMID     	18

#define P_OFFSET    11


forward PlayerLeaveGang(playerid);
forward getCheckpointType(playerID);
forward isPlayerInArea(playerID, Float:data[4]);
forward PayPlayerInArea(playerID, Float:x1, Float:y1, Float:x2, Float:y2, cash);
forward PirateShipScoreUpdate();
forward GambleUpdate();
forward checkpointUpdate();
forward PropertyScoreUpdate();
forward SendPlayerFormattedText(playerid, const str[], define);
forward SendAllFormattedText(playerid, const str[], define);

forward Givecashdelaytimer(playerid);
new bank[MAX_PLAYERS];
new bounty[MAX_PLAYERS];
new playerCheckpoint[MAX_PLAYERS];
new gambleWarning[MAX_PLAYERS];

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

#define MAX_POINTS 30

new Float:checkCoords[MAX_POINTS][4] = {
{-36.5483,-57.9948, -17.2655,-49.2967},     	//BANK
{1894.6128,1445.3431, 2084.9739,1637.8186}, 	//LV_PIRATE
{1526.1332,-1370.5281,1558.4066,-1346.3019}, 	//LS_SKYSCARPER
{-2020.2151,593.7877,-1882.4504,745.5773}, 		//SF_ZOMBOTECH
{285.5186,-40.8558, 299.3870,-30.2428},     	//AMMUNATION
{284.0546,-86.4384, 302.9315,-56.6674},     	//AMMUNATION_2
{-37.2183,-91.8006, -14.1099,-74.6845},      	//BANK_2
{-34.6621,-31.4095, -2.6782,-25.6232},     		//BANK_3
{1406.4838,-2372.7078,1836.9307,-2205.9673},    //LS_AIRPORT
{-1720.8835,-692.9379,-1229.0609,-244.2898},    //SF_AIRPORT
{1631.2246,1319.9592,1815.6743,1549.8381},      //LV_AIRPORT
{473.8677,-24.4651, 503.5214,-10.7020},  		//ALHAMBRA
{200.4548,-168.0065, 211.3137,-156.5380},     	//DIDERSACHS
{487.6558,-88.5900, 512.0635, -67.7503},    	//BAR
{410.9893,-24.1658,415.1630,-12.6853}, 			//HAIRSTUD
{144.9131,-96.0927, 177.4128,-70.7923},    		//ZIP
{201.4462,-112.4556, 218.5237,-95.1238},    	//BINCO
{-204.7587,-27.0317, -200.2572,-22.7652},   	//TATOO
{-2815.8892,-330.0380,-2637.8352,-202.6930}, 	//SF GOLF CLUB
{-2014.8904,218.3705,-1900.5179,327.4985}, 		//SF WANG CARS
{-1804.7817,904.1232,-1682.8546,979.6241,}, 	//SF HOTEL
{-1681.0754,1168.9130,-1554.2562,1254.3335},  	//OTTO'S AUTOS
{1925.1511,968.2358, 2019.0715,1067.4276},  	//DRAGONS
{2216.7971,1638.0493, 2255.2097,1714.0806}, 	//CALIGULA
{-115.9544,-24.2706, -99.1631,-7.1391},     	//SEXSHOP
{954.5639,-1158.5366,1073.8862,-1086.4647},     //CATHAY
{1020.2889,-1581.0238,1214.4883,-1387.2167},    //VERONA
{-2240.6978,128.3114,-2224.1711,137.5221},     //ZERORC
{-2689.9849,1389.1598,-2631.0308,1431.7599},     //JIZZYS
{2208.6492,2214.2271,1287.3967,1291.3939}     //PIRAMID
};

new Float:checkpoints[MAX_POINTS][3] = {
{-22.2549,-55.6575,1003.5469},
{2000.3132,1538.6012,13.5859},
{1544.3478,	-1356.1665,	329.469},
{-1951.9886,686.6917,46.5625},
{291.1157,-39.9011,1001.5156},
{291.0004,-84.5168,1001.5156},
{-23.0664,-90.0882,1003.5469},
{-33.9593,-29.0792,1003.5573},
{1685.4951,-2333.1021,13.5469},
{-1423.1083,-289.5751,14.1484},
{1677.3966,1447.7908,10.7758},
{475.2822,-18.4801,1003.6953},
{204.0677,-157.7979,1000.5234},
{501.4927,-75.4323,998.7578},
{411.9587,-17.9706,1001.8047},
{161.1875,-79.9915,1001.8047},
{207.5640,-97.8188,1005.2578},
{-201.5237,-26.2863,1002.2734},
{-2724.3921,-314.7957,7.1861},
{-1957.3124,302.8924,35.4688},
{-1754.2139,960.2347,24.8828},
{-1660.4781,1218.4636,7.2500},
{1994.7078,1017.6371,994.8906},
{2235.5408,1679.0402,1008.3594},
{-103.9330,-21.0203,1000.7188},
{1022.7669,-1124.1028,23.8708},
{1129.0569,-1489.0812,22.7690},
{-2233.7097,133.7087,1035.4210},
{-2650.8259,1410.2885,906.2734},
{2211.4485,1288.9395,10.8203} //PIRAMID
};

new checkpointType[MAX_POINTS] = {
	CP_BANK,
	CP_PIRATE,
	CP_SKYSCARPER,
	CP_ZOMBOTECH,
	CP_AMMU,
	CP_AMMU_2,
	CP_BANK_2,
	CP_BANK_3,
	CP_LS_AIR,
	CP_SF_AIR,
	CP_LV_AIR,
	CP_ALAHAM,
	CP_DIDERSACHS,
	CP_BAR,
	CP_HAIRSTUD,
	CP_ZIP,
	CP_BINCO,
	CP_TATOO,
	CP_GOLF,
	CP_WANG,
	CP_HOTEL,
	CP_OTTOS,
	CP_DRAGON,
	CP_CALIGULA,
	CP_SEXSHOP,
	CP_CATHAY,
	CP_VERONA,
	CP_ZERORC,
	CP_JIZZYS,
	CP_PIRAMID
};

#define MAX_PROPERTIES 19

new propertyNames[MAX_PROPERTIES][32] = {
	"LS Alhambra Club",
	"Dider Sachs Boutiques",
	"Ten Green Bottles, Shithole Bar",
	"Hair Studios",
	"Zip Shops",
	"Binco Shops",
	"Tatoo Parlors",
	"SF Country Club",
	"SF Wang Cars",
	"SF Hotel",
	"SF Otto's Autos",
	"LV Four Dragons Casino",
	"LV Caligula Casino",
	"LV Sexshop",
	"LS Kathay Chineese Theatre",
	"LS Verona Mall",
	"SF Zero RC Shop",
	"SF Jizzy's Club",
	"Jerbob92's Pool"
};

new propertyValues[MAX_PROPERTIES] = {
	70000,
	100000,
	20000,
	30000,
	15000,
	15000,
	10000,
	220000,
	170000,
	200000,
	190000,
	75000,
	100000,
	25000,
	130000,
	150000,
	25000,
	70000,
	70000
};

new propertyEarnings[MAX_PROPERTIES] = {
	4500,
	7000,
	1500,
	4000,
	1000,
	1000,
	700,
	14000,
	95000,
	12000,
	10000,
	5000,
	7000,
	2000,
	8500,
	9000,
	1500,
	4500,
	4500
};

new propertyOwner[MAX_PROPERTIES] = {999,999,999,999,999,999,999,999,999,999,999,999,999,999,999,999,999,999,999};

#define MAX_CASINO      3
new Float:gambleAreas[MAX_CASINO][4] = {
	{1928.1771,987.5739, 1970.5675,1042.8369},
	{2171.3618,1584.2649, 2279.4915,1628.6199},
	{1117.5068,-11.2747, 1142.4843,12.5986}
};

#define MAX_GANGS 			32
#define MAX_GANG_MEMBERS	6
#define MAX_GANG_NAME       16
new gangMembers[MAX_GANGS][MAX_GANG_MEMBERS];
new gangNames[MAX_GANGS][MAX_GANG_NAME];
new gangInfo[MAX_GANGS][3]; //0-created,1-members,2-color
new gangBank[MAX_GANGS];
new playerGang[MAX_PLAYERS];
new gangInvite[MAX_PLAYERS];


main()
{
	print("\n--------------------------------------");
	print(" BANK+PROPS+GANGS+BOUNTY");
	print("--------------------------------------\n");
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
					format(string, sizeof(string),"%s has quit your gang.", playername);
					SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
				}

				format(string, sizeof(string),"You have quit the gang '%s' (id: %d)", gangNames[gangnum], gangnum);
				SendClientMessage(playerid, COLOR_ORANGE, string);

				playerGang[playerid]=0;

				SetPlayerColor(playerid,playerColors[playerid]);

				return;
			}
		}
	} else {
		SendClientMessage(playerid, COLOR_RED, "You are not in a gang.");
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


//------------------------------------------------------------------------------------------------------

public PirateShipScoreUpdate()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		PayPlayerInArea(i, 1995.5, 1518.0, 2006.0, 1569.0, 200);
		PayPlayerInArea(i, 1516.1332, -1380.5281, 1568.4066, -1336.3019, 200);
		PayPlayerInArea(i, -1988.4744, 639.1348, -1917.0579, 715.5820, 200);
//		{
//            SendClientMessage(i, COLOR_YELLOW, "You earned money for holding pirate ship area.");
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
					GameTextForPlayer(i,"~r~NO GAMBLING ~g~Gamblers will be ~r~SHOT",10000,5);
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

			format(string, sizeof(string), "You earned $%d from your properties.", payments[i]);
			SendClientMessage(owners[i], COLOR_GREEN, string);
		}
	}

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
	
		if(strcmp(cmd, "/bank", true) == 0 || strcmp(cmd, "/gbank", true) == 0) {
	    new gang;
	    if(strcmp(cmd, "/gbank", true) == 0)
	        gang = 1;

	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK && getCheckpointType(playerid) != CP_BANK_2 && getCheckpointType(playerid) != CP_BANK_3) {
	        SendClientMessage(playerid, COLOR_YELLOW, "You must be at a bank area to use this. ATMs are located in convenience stores.");
			return 1;
		}
		if(gang && playerGang[playerid]==0) {
			SendClientMessage(playerid, COLOR_RED, "You are not in a gang!");
			return 1;
		}

		new tmp[256];
	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /(g)bank [amount]");
			return 1;
	    }
	    moneys = strval(tmp);

	    if(moneys < 1) {
			SendClientMessage(playerid, COLOR_YELLOW, "Hey what are you trying to pull here.");
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
			format(string, sizeof(string), "You have deposited $%d, your gang's balance is $%d.", moneys, gangBank[playerGang[playerid]]);
		else
			format(string, sizeof(string), "You have deposited $%d, your current balance is $%d.", moneys, bank[playerid]);

		SendClientMessage(playerid, COLOR_YELLOW, string);

		return 1;
	}

	//------------------- /withdraw

	if(strcmp(cmd, "/withdraw", true) == 0 || strcmp(cmd, "/gwithdraw", true) == 0) {
	    new gang;

	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK && getCheckpointType(playerid) != CP_BANK_2 && getCheckpointType(playerid) != CP_BANK_3 ) {
	        SendClientMessage(playerid, COLOR_YELLOW, "You must be at a bank area to use this. ATMs are located in convenience stores.");
			return 1;
		}

		if(strcmp(cmd, "/gwithdraw", true) == 0)
		    gang = 1;

		if(gang && playerGang[playerid]==0) {
			SendClientMessage(playerid, COLOR_RED, "You are not in a gang!");
			return 1;
		}

	    new tmp[256];
	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /(g)withdraw [amount]");
			return 1;
	    }
	    moneys = strval(tmp);

	    if(moneys < 1) {
			SendClientMessage(playerid, COLOR_YELLOW, "Hey what are you trying to pull here.");
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
			format(string, sizeof(string), "You have withdrawn $%d, your gang's balance is $%d.", moneys, gangBank[playerGang[playerid]]);
		else
			format(string, sizeof(string), "You have withdrawn $%d, your current balance is $%d.", moneys, bank[playerid]);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		return 1;
   	}

	//------------------- /balance

	if(strcmp(cmd, "/balance", true) == 0 || strcmp(cmd, "/gbalance", true) == 0) {
		new gang;
		if(strcmp(cmd, "/gbalance", true) == 0)
			gang = 1;

	    if(IsPlayerInCheckpoint(playerid) == 0 || getCheckpointType(playerid) != CP_BANK && getCheckpointType(playerid) != CP_BANK_2 && getCheckpointType(playerid) != CP_BANK_3) {
	        SendClientMessage(playerid, COLOR_YELLOW, "You must be at a bank area to use this. ATMs are located in convenience stores.");
			return 1;
		}

		if(gang && playerGang[playerid]==0) {
			SendClientMessage(playerid, COLOR_RED, "You are not in a gang!");
			return 1;
		}

		if(gang)
			format(string, sizeof(string), "Your gang has $%d in the bank.", gangBank[playerGang[playerid]]);
		else
			format(string, sizeof(string), "You have $%d in the bank.", bank[playerid]);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		return 1;
	}



	//------------------- /givecash

	if(strcmp(cmd, "/givecash", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [playerid] [amount]");
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
				format(string, sizeof(string), "You have sent %s (id: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "You have recieved $%d from %s (id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Invalid transaction amount.");
			}
		}
		else {
				format(string, sizeof(string), "%d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		return 1;
	}

	//------------------- /hitman

	if(strcmp(cmd, "/hitman", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /hitman [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /hitman [playerid] [amount]");
			return 1;
		}
 		moneys = strval(tmp);

	    if(moneys > GetPlayerMoney(playerid)) {
			SendClientMessage(playerid, COLOR_RED, "You don't have enough money!");
			return 1;
	    }
	    if(moneys < 1) {
			SendClientMessage(playerid, COLOR_YELLOW, "Hey what are you trying to pull here.");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid)==0) {
			SendClientMessage(playerid, COLOR_RED, "No such player exists.");
			return 1;
		}

		bounty[giveplayerid]+=moneys;
		GivePlayerMoney(playerid, 0-moneys);

		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));


		format(string, sizeof(string), "%s has had a $%d bounty put on his head from %s (total: $%d).", giveplayer, moneys, sendername, bounty[giveplayerid]);
		SendClientMessageToAll(COLOR_ORANGE, string);

		format(string, sizeof(string), "You have had a $%d bounty put on you from %s (id: %d).", moneys, sendername, playerid);
		SendClientMessage(giveplayerid, COLOR_RED, string);

		return 1;
	}

	//------------------- /bounty

	if(strcmp(cmd, "/bounty", true) == 0) {
	    new tmp[256];
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bounty [playerid]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "Player %s (id: %d) has a  $%d bounty on his head.", giveplayer,giveplayerid,bounty[giveplayerid]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		} else {
			SendClientMessage(playerid, COLOR_RED, "No such player exists!");
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
				case CP_ALAHAM:{
					property = P_ALAHAM;
				}
				case CP_DIDERSACHS:{
					property = P_DIDERSACHS;
				}
				case CP_BAR:{
					property = P_BAR;
				}
				case CP_HAIRSTUD:{
					property = P_HAIRSTUD;
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
				case CP_GOLF:{
					property = P_GOLF;
				}
				case CP_WANG:{
					property = P_WANG;
				}
				case CP_HOTEL:{
					property = P_HOTEL;
				}
				case CP_OTTOS:{
					property = P_OTTOS;
				}
				case CP_DRAGON:{
					property = P_DRAGON;
				}
				case CP_CALIGULA:{
					property = P_CALIGULA;
				}
				case CP_SEXSHOP:{
					property = P_SEXSHOP;
				}
				case CP_CATHAY:{
					property = P_CATHAY;
				}
				case CP_VERONA:{
					property = P_VERONA;
				}
				case CP_ZERORC:{
					property = P_ZERORC;
				}
				case CP_JIZZYS:{
					property = P_JIZZYS;
				}
				case CP_PIRAMID:{
					property = P_PIRAMID;
				}
			}

			if(property==999) {
				SendClientMessage(playerid, COLOR_YELLOW, "You need to be in a property checkpoint to /buy it.");
				return 1;
			}

//			property--;

			if(GetPlayerMoney(playerid) < propertyValues[property]) {
				SendClientMessage(playerid, COLOR_RED, "You don't have enough money to buy this property.");
				return 1;
			}
			if(propertyOwner[property]==playerid) {
				SendClientMessage(playerid, COLOR_RED, "You already own this property.");
				return 1;
			}

			if(propertyOwner[property] < 999) {
				GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
				GivePlayerMoney(propertyOwner[property], propertyValues[property]);
				format (string, sizeof(string), "Your property, the %s, has been bought out by %s (id: %d).",propertyNames[property],giveplayer,playerid);
				SendClientMessage(propertyOwner[property], COLOR_RED, string);
			}

			GivePlayerMoney(playerid, 0-propertyValues[property]);

			propertyOwner[property]=playerid;

			format(string, sizeof(string), "You have purchased the %s!", propertyNames[property]);
			SendClientMessage(playerid, COLOR_GREEN, string);

		} else {
			SendClientMessage(playerid, COLOR_YELLOW, "You need to be in a property checkpoint to /buy it.");
			return 1;
		}


		return 1;
	}

	//------------------- /properties

	if(strcmp(cmd, "/properties", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN, "Property Owners List 1:");
		for(new i = 0; i < 8; i++) {
			if(propertyOwner[i] < 999) {
				GetPlayerName(propertyOwner[i], giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), "%d. %s - %s", i, propertyNames[i], giveplayer);
			} else
				format(string, sizeof(string), "%d. %s - None", i, propertyNames[i]);

			SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}

	if(strcmp(cmd, "/properties2", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN, "Property Owners List 2:");
		for(new i = 9; i < 18; i++) {
			if(propertyOwner[i] < 999) {
				GetPlayerName(propertyOwner[i], giveplayer, sizeof(giveplayer));
				format(string, sizeof(string), "%d. %s - %s", i, propertyNames[i], giveplayer);
			} else
				format(string, sizeof(string), "%d. %s - None", i, propertyNames[i]);

			SendClientMessage(playerid, COLOR_YELLOW, string);
		}

		return 1;
	}
	if(strcmp(cmd, "/gang", true) == 0) {
	    new tmp[256];
	    new gangcmd, gangnum;
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gang [create/join/invite/quit] [name/number]");
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
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gang [create/join/invite/quit] [name/number]");
			else if(gangcmd==1)
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gang [create] [name]");
			else if(gangcmd==2)
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gang [invite] [playerID]");
			return 1;
		}

		//Create Gang//
		if(gangcmd==1) {
		    if(playerGang[playerid]>0) {
				SendClientMessage(playerid, COLOR_RED, "You are already in a gang!");
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
					format(string, sizeof(string),"You have created the gang '%s' (id: %d)", gangNames[i], i);
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
				SendClientMessage(playerid, COLOR_RED, "You are already in a gang!");
				return 1;
		    }
	 		if(gangInvite[playerid]==0) {
				SendClientMessage(playerid, COLOR_RED, "You have not been invited to a gang.");
				return 1;
			}
			if(gangInfo[gangnum][0]==0) {
				SendClientMessage(playerid, COLOR_RED, "That gang does not exist!");
				return 1;
			}

			if(gangInfo[gangnum][1] < MAX_GANG_MEMBERS) {
			    new i = gangInfo[gangnum][1];

				gangInvite[playerid]=0;

				gangMembers[gangnum][i] = playerid;

			    GetPlayerName(playerid, sendername, MAX_PLAYER_NAME);
				for(new j = 0; j < gangInfo[gangnum][1]; j++) {
					format(string, sizeof(string),"%s has joined your gang.", sendername);
					SendClientMessage(gangMembers[gangnum][j], COLOR_ORANGE, string);
				}

				gangInfo[gangnum][1]++;
				playerGang[playerid] = gangnum;

				SetPlayerColor(playerid,gangInfo[gangnum][2]);

				format(string, sizeof(string),"You have joined the gang '%s' (id: %d)", gangNames[gangnum], gangnum);
				SendClientMessage(playerid, COLOR_GREEN, string);

				return 1;
			}

			SendClientMessage(playerid, COLOR_RED, "That gang is full.");
			return 1;

		//Invite to Gang//
		} else if (gangcmd==2) {
	 		giveplayerid = strval(tmp);

			if(playerGang[playerid]==0) {
				SendClientMessage(playerid, COLOR_RED, "You are not in a gang!");
				return 1;
			}
//			if(gangMembers[playerGang[playerid]][0]!=playerid) {
//				SendClientMessage(playerid, COLOR_RED, "You need to be the gang leader to send an invite.");
//				return 1;
//			}

			if(IsPlayerConnected(giveplayerid)) {
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));

				format(string, sizeof(string),"You have sent a gang invite to %s.", giveplayer);
				SendClientMessage(playerid, COLOR_GREEN, string);
				format(string, sizeof(string),"You have recieved a gang invite from %s to '%s' (id: %d)", sendername, gangNames[playerGang[playerid]],playerGang[playerid]);
				SendClientMessage(giveplayerid, COLOR_GREEN, string);

				gangInvite[giveplayerid]=playerGang[playerid];

			} else
				SendClientMessage(playerid, COLOR_RED, "No such player exists!");

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
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /ganginfo [number]");
			return 1;
		} else if (!strlen(tmp))
			gangnum = playerGang[playerid];
		else
			gangnum = strval(tmp);

		if(gangInfo[gangnum][0]==0) {
			SendClientMessage(playerid, COLOR_RED, "No such gang exists!");
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
		    new string[256];

//		    for(new i = 1; i < strlen(text)+1; i++)
//				gangChat[i]=text[i];

			strmid(gangChat,text,1,strlen(text));

			format(string, sizeof(string),"%s: %s", gangChat);

			for(new i = 0; i < gangInfo[playerGang[playerid]][1]; i++) {
				SendClientMessage(gangMembers[playerGang[playerid]][i], COLOR_LIGHTBLUE, string);
			}
		}

		return 0;
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------

public OnPlayerEnterCheckpoint(playerid)
{
	new string[256];
	new ownplayer[MAX_PLAYER_NAME];

	switch(getCheckpointType(playerid))
	{
		case CP_BANK: {
			SendClientMessage(playerid, COLOR_YELLOW, "You are at an ATM. To store money use '/bank amount', to withdraw");
			SendClientMessage(playerid, COLOR_YELLOW, "money use '/withdraw amount', and '/balance' to see your balance.");
		}
		case CP_BANK_2: {
			SendClientMessage(playerid, COLOR_YELLOW, "You are at an ATM. To store money use '/bank amount', to withdraw");
			SendClientMessage(playerid, COLOR_YELLOW, "money use '/withdraw amount', and '/balance' to see your balance.");
		}
		case CP_BANK_3: {
			SendClientMessage(playerid, COLOR_YELLOW, "You are at an ATM. To store money use '/bank amount', to withdraw");
			SendClientMessage(playerid, COLOR_YELLOW, "money use '/withdraw amount', and '/balance' to see your balance.");
		}
		case CP_PIRATE: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can hold the Pirate Ship area to gain money.");
		}
		case CP_SKYSCARPER: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can hold the Skyscarper rooftop area to gain money.");
		}
		case CP_ZOMBOTECH: {
			SendClientMessage(playerid, COLOR_YELLOW, "You can hold the Zombotech Corp. lobby area to gain money.");
		}
		case CP_AMMU: {
			SendClientMessage(playerid, COLOR_GREEN, "You can purchase weapons here so that you have them every");
			SendClientMessage(playerid, COLOR_GREEN, "time you spawn. You can purchase more than once for more ammo.");
			SendClientMessage(playerid, COLOR_YELLOW, "Type /buyweapon [weapon number] and /weaponlist for a list of weapons.");
        }
        case CP_AMMU_2: {
			SendClientMessage(playerid, COLOR_GREEN, "You can purchase weapons here so that you have them every");
			SendClientMessage(playerid, COLOR_GREEN, "time you spawn. You can purchase more than once for more ammo.");
			SendClientMessage(playerid, COLOR_YELLOW, "Type /buyweapon [weapon number] and /weaponlist for a list of weapons.");
        }
		case CP_LS_AIR: {
			SendClientMessage(playerid, COLOR_YELLOW, "You are at the Airport. To buy a ticket to the San Fierro type /flysf");
			SendClientMessage(playerid, COLOR_YELLOW, "If you want to fly to the Las Venturas type /flylv. Ticket price - $2500.");

		}
		case CP_SF_AIR: {
			SendClientMessage(playerid, COLOR_YELLOW, "You are at the Airport. To buy a ticket to the Los Santos type /flyls");
			SendClientMessage(playerid, COLOR_YELLOW, "If you want to fly to the Las Venturas type /flylv. Ticket price - $2500.");

		}
		case CP_LV_AIR: {
			SendClientMessage(playerid, COLOR_YELLOW, "You are at the Airport. To buy a ticket to the Los Santos type /flyls");
			SendClientMessage(playerid, COLOR_YELLOW, "If you want to fly to the San Fierro type /flysf. Ticket price - $2500.");

		}
		case CP_DRAGON: {
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
		}
		case CP_PIRAMID: {
		SendClientMessage(playerid, COLOR_YELLOW, "You can buy the Piramid clothes store for $100,000 with /buy.");
		SendClientMessage(playerid, COLOR_YELLOW, "You will earn $7,000 regularly.");
		}
	}
	if(getCheckpointType(playerid)>= P_OFFSET) {
		format(string, sizeof(string), "You can buy the %s for $%d with /buy.", propertyNames[playerCheckpoint[playerid]-P_OFFSET], propertyValues[playerCheckpoint[playerid]-P_OFFSET]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "You will earn $%d regularly.", propertyEarnings[playerCheckpoint[playerid]-P_OFFSET]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		if(propertyOwner[playerCheckpoint[playerid]-P_OFFSET]<999) {
			GetPlayerName(propertyOwner[playerCheckpoint[playerid]-P_OFFSET], ownplayer, sizeof(ownplayer));
			format(string, sizeof(string), "This property is currently owned by %s.", ownplayer);
			SendClientMessage(playerid, COLOR_RED, string);
		}
	}
}


//------------------------------------------------------------------------------------------------------

public OnFilterScriptInit()
{
	SetTimer("checkpointUpdate", 1100, 1);
	SetTimer("PirateShipScoreUpdate", 2001, 1);
	SetTimer("PropertyScoreUpdate", 40005, 1);
	SetTimer("GambleUpdate", 5013, 1);
	SetTimer("SavedUpdate",60017, 1);
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
}

public OnPlayerDeath(playerid, killerid, reason)
{
    new playercash;
	new killedplayer[MAX_PLAYER_NAME];
	new string[256];

	playercash = GetPlayerMoney(playerid);

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
			format(string, sizeof(string), "You earned a bounty of %d for killing %s.", bounty[playerid], killedplayer);
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
 	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

