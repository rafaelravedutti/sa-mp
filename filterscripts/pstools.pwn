/***************************************************************************

	Paradise Society RPG Edition Tools
							   
	Copyright (C) 2010 Rafael aka Saturnus
	All rights reserved
					    				
****************************************************************************/

#include <a_samp>

//Cores
#define COLOR_YELLOW            		0xFFFF00AA
#define COLOR_LIGHT_YELLOW      		0xFFFFE0AA
#define COLOR_GOLD              		0xFFD700AA
#define COLOR_WHITE             		0xFFFFFFAA
#define COLOR_GRAY              		0xB5B5B5AA
#define COLOR_RED               		0xFF0000AA
#define COLOR_ORANGE            		0xFF4500AA
#define COLOR_BLUE              		0x0000FFAA
#define COLOR_ROYAL_BLUE        		0x4169E1AA
#define COLOR_SKY_BLUE          		0x87CEFAAA
#define COLOR_LIGHT_BLUE    			0xADD8E6AA
#define COLOR_PINK  					0xFFC0CBAA
#define COLOR_PURPLE        			0xA020F0AA
#define COLOR_AZURE         			0xE0EEEEAA
#define COLOR_GREEN             		0x00FF00AA
#define COLOR_LIGHT_GREEN       		0x98FB98AA

//Objetos
stock SetPlayerHoldingObject(playerid, modelid, bone, Float:X, Float:Y, Float:Z, Float:RX, Float:RY, Float:RZ)
	return SetPlayerAttachedObject(playerid, MAX_PLAYER_ATTACHED_OBJECTS - 1, modelid, bone, X, Y, Z, RX, RY, RZ);

stock StopPlayerHoldingObject(playerid)
	return RemovePlayerAttachedObject(playerid, MAX_PLAYER_ATTACHED_OBJECTS - 1);
	
stock IsPlayerHoldingObject(playerid)
	return IsPlayerAttachedObjectSlotUsed(playerid, MAX_PLAYER_ATTACHED_OBJECTS - 1);
	
enum weatherInfo
{
	weatherName[64],
	weatherValue
}

new Weathers[][weatherInfo] = {
    {"Ensolarado", 1},
    {"Super-Ensolarado", 0},
	{"Chuvoso", 16},
	{"Nublado", 4},
	{"Tempestade", 8},
	{"Tempestade-Areia", 19}
};

enum interiorsInfo
{
	interiorId,
	Float:interiorX,
	Float:interiorY,
	Float:interiorZ,
	Float:interiorA
}

new Interiors[][interiorsInfo] = {
	{5,		770.8033,		-0.7033,		1000.7267,		22.8599},
	{3,		974.0177,		-9.5937,		1001.1484,		22.6045},
	{3,		961.9308,		-51.9071,		1001.1172,		95.5381},
	{3,		830.6016,		5.9404,			1004.1797,		125.8149},
	{3,		1037.8276,		0.3970,			1001.2845,		353.9335},
	{3,		1212.1489,		-28.5388,		1000.9531,		170.5692},
	{18,	1290.4106,		1.9512,			1001.0201,		179.9419},
	{1,		1412.1472,		-2.2836,		1000.9241,		114.6610},
	{9,		1527.0468,		-12.0236,		1002.0971,		350.0013},
	{0,		2547.1853,		2824.2493,		10.8203,		262.7038},
	{3,		612.2191,		-123.9028,		997.9922,		266.5704},
	{3,		512.9291,		-11.6929,		1001.5653,		198.7669},
	{3,		418.4666,		-80.4595,		1001.8047,		343.2358},
	{3,		386.5259,		173.6381,		1008.3828,		63.7399},
	{3,		288.4723,		170.0647,		1007.1794,		22.0477},
	{3,		206.4627,		-137.7076,		1003.0938,		10.9347},
	{3,		-100.2674,		-22.9376,		1000.7188,		17.2850},
	{3,		-201.2236,		-43.2465,		1002.2734,		45.8613},
	{17,	-202.9381,		-6.7006,		1002.2734,		204.2693},
	{17,	-17.9142,		-173.4321,		1003.5469,		45.1436},
	{5,		454.9853,		-107.2548,		999.4376,		309.0195},
	{5,		372.5565,		-131.3607,		1001.4922,		354.2285},
	{17,	378.0260,		-190.5155,		1000.6328,		141.0245},
	{7,		315.2440,		-140.8858,		999.6016,		7.4226},
	{5,		225.0306,		-9.1838,		1002.2180,		85.5322},
	{2,		611.3536,		-77.5574,		997.9995,		320.9263},
	{10,	246.0688,		108.9703,		1003.2188,		0.2922},
	{10,	6.0856, 		-28.8966,		1003.5494,		5.0365},
	{7,		773.7318,		-74.6957,		1000.6542,		5.2304},
	{1,		621.4528,		-23.7289,		1000.9219,		15.6789},
	{31,	445.6003,		-6.9823,		1000.7344,		172.2105},
	{1,		285.8361,		-39.0166,		1001.5156,		0.7529},
	{1,		204.1174,		-46.8047,		1001.8047,		357.5777},
	{1,		245.2307,		304.7632,		999.1484,		273.4364},
	{3,		290.6230,		309.0622,		999.1484,		89.9164},
	{5,		322.5014,		303.6906,		999.1484,		8.1747},
	{1,		-2041.2334,		178.3969,		28.8465,		156.2153},
	{1,		-1402.6613,		106.3897,		1032.2734,		105.1356},
	{7,		-1403.0116,		-250.4526,		1043.5341,		355.8576},
	{2,		1207.5087,		3.6289,			-1000.9219,		214.6596},
	{10,	2016.1156,		1017.1541,		996.8750,		88.0055},
	{1,		-741.8495,		493.0036,		1371.9766,		71.7782},
	{2,		2447.8704,		-1704.4509,		1013.5078,		314.5253},
	{1,		2527.0176,		-1679.2076,		1015.4986,		260.9709},
	{10,	-1129.8909,		1057.5424,		1346.4141,		274.5268},
	{3,		2496.0549,		-1695.1749,		1014.7422,		179.2174},
	{10,	366.0248,		-73.3478,		1001.5078,		292.0084},
	{1,		2233.9363,		1711.8038,		1011.6312,		184.3891},
	{2,		269.6405,		305.9512,		999.1484,		215.6625},
	{2,		414.2987,		-18.8044,		1001.8047,		41.4265},
	{2,		1.1853,			-3.2387,		999.4284,		87.5718},
	{18,	-30.9875,		-89.6806,		1003.5469,		359.8401},
	{18,	161.4048,		-94.2416,		1001.8047,		0.7938},
	{2,		-2638.8232,		1407.3395,		906.4609,		94.6794},
	{2,		1267.8407,		-776.9587,		1091.9063,		231.3418},
	{2,		2536.5322,		-1294.8425,		1044.1250,		254.9548},
	{5,		2350.1597,		-1181.0658,		1027.9766,		99.1864},
	{1,		-2158.6731,		642.0900,		1052.3750,		86.5402},
	{10,	419.8936,		2537.1155,		10.0000,		67.6537},
	{14,	256.9047,		-41.6537,		1002.0234,		85.8774},
	{14,	204.1658,		-165.7678,		1000.5234,		181.7583},
	{12,	1133.3500,		-7.8462,		1000.6797,		165.8482},
	{14,	-1420.4277,		1616.9221,		1052.5313,		159.1255},
	{17,	488.4389,		-11.4271,		1000.6797,		130.6844},
	{18,	1727.2853,		-1642.9451,		20.2254,		172.4193},
	{16,	-202.8420,		-24.0325,		1002.2734,		252.8154},
	{5,		2233.6919,		-1112.8107,		1050.8828,		8.6483},
	{6,		1211.2484,		1049.0234,		359.9410,		170.9341},
	{9,		2319.1272,		-1023.9562,		1050.2109,		167.3959},
	{10,	2261.0977,  	-1137.8833, 	1050.6328,  	266.8800},
	{10,	2267.5454,  	-1210.7793, 	1048.1165,  	87.6738},
	{17,	-944.2402,		1886.1536,		5.0051,			179.8548},
	{16,	-24.6959,		-130.3763,		1003.5469,		178.9616},
	{15,	2217.2810,		-1150.5349,		1025.7969,		273.7328},
	{1,		1.5491,			23.3183,		1199.5938,		359.9054},
	{1,		681.6216,		-451.8933,		-25.6172,		166.1660},
	{3,		234.6087,		1187.8195,		1080.2578,		349.4844},
	{2,		225.5707,		1240.0643,		1082.1406,		96.2852},
	{1,		224.2880,		1289.1907,		1082.1406,		359.8680},
	{5,		239.2819,		1114.1991,		1080.9922,		270.2654},
	{15,	207.5219,		-109.7448,		1005.1328,		358.6200},
	{15,	295.1391,		1473.3719,		1080.2578,		352.9526},
	{15,	327.6742, 		1478.8611, 		1084.4375, 		357.3368},
	{15,	385.5207, 		1471.7783, 		1080.1875, 		93.5925},
	{15,	375.0593, 		1417.7213, 		1081.3281, 		100.3213},
	{15,	-1417.8927,		932.4482,		1041.5313,		0.7013},
	{12,	446.3247,		509.9662,		1001.4195,		330.5671},
	{0,		2306.3826,		-15.2365,		26.7496,		274.4900},
	{0,		2331.8984,		6.7816,			26.5032,		100.2357},
	{0,		663.0588,		-573.6274,		16.3359,		264.9829},
	{18,	-227.5703,		1401.5544,		27.7656,		269.2978},
	{0,		-688.1496,		942.0826,		13.6328,		177.6574},
	{0,		-1916.1268,		714.8617,		46.5625,		152.2839},
	{0,		818.7714,		-1102.8689,		25.7940,		91.1439},
	{0,		255.2083,		-59.6753,		1.5703,			1.4645},
	{2, 	446.6260,		1397.7380, 		1084.3047, 		343.9647},
	{2,		490.8576, 		1400.0381,		1080.2645, 		12.9194},
	{5,		227.3922,		1114.6572,		1080.9985,		267.4590},
	{5,		227.7559,		1114.3844,		1080.9922,		266.2624},
	{4,		261.1165,		1287.2197,		1080.2578,		178.9149},
	{4,		291.7626,		-80.1306,		1001.5156,		290.2195},
	{4,		449.0172,		-88.9894,		999.5547,		89.6608},
	{4,		-27.8440,		-26.6737,		1003.5573,		184.3118},
	{0,		2135.2004,		-2276.2815,		20.6719,		318.5900},
	{4,		306.1966,		307.8190,		1003.3047,		203.1354},
	{10,	24.3769,		1341.1829,		1084.3750,		8.3305},
	{1,		963.0586,		2159.7563,		1011.0303,		175.3130},
	{0,		2548.4807,		2823.7429,		10.8203,		270.6003},
	{0,		215.1515,		1874.0579,		13.1406,		177.5538},
	{4,		221.6766,		1142.4962,		1082.6094,		184.9618},
	{12,	2323.7063,		-1147.6509,		1050.7101,		206.5352},
	{6,		344.9984,		307.1824,		999.1557,		193.6430},
	{12,	411.9707,		-51.9217,		1001.8984,		173.3449},
	{4,		-1421.5618,		-663.8262,		1059.5569,		170.9341},
	{6,		773.8887,		-47.7698,		1000.5859,		10.7161},
	{6,		246.6695,		65.8039,		1003.6406,		7.9562},
	{14,	-1864.9434,		55.7325,		1055.5276,		85.8541},
	{4,		-262.1759,		1456.6158,		1084.3672,		82.4590},
	{5,		22.8610,		1404.9165,		1084.4297,		349.6158},
	{5,		140.3679,		1367.8837,		1083.8621,		349.2372},
	{3,		1494.8589,		1306.4800,		1093.2953,		196.0650},
	{14,	-1813.2130,		-58.0120,		1058.9641,		335.3199},
	{16,	-1401.0670,		1265.3706,		1039.8672,		178.6483},
	{6,		234.2826,		1065.2290,		1084.2101,		4.3864},
	{6,		-68.5145,		1353.8485,		1080.2109,		3.5742},
	{6,		-2240.1028,		136.9730,		1035.4141,		269.0954},
	{6,		297.1440,		-109.8702,		1001.5156,		20.2254},
	{6,		316.5025,		-167.6272,		999.5938,		10.3031},
	{15,	-285.2511,		1471.1970,		1084.3750,		85.6547},
	{6,		-26.8339,		-55.5846,		1003.5469,		3.9528},
	{6,		442.1295,		-52.4782,		999.7167,		177.9394},
	{2,		2182.2017,		1628.5848,		1043.8723,		224.8601},
	{6,		748.4623,		1438.2378,		1102.9531,		0.6069},
	{8,		2807.3604,		-1171.7048,		1025.5703,		193.7117},
	{9,		366.0002,		-9.4338,		1001.8516,		160.5280},
	{1,		2216.1282,		-1076.3052,		1050.4844,		86.4280},
	{1,		2268.5156,		1647.7682,		1084.2344,		99.7331},
	{2,		2236.6997,		-1078.9478,		1049.0234,		2.5706},
	{3,		-2031.1196,		-115.8287,		1035.1719,		190.1877},
	{8,		2365.1089,		-1133.0795,		1050.8750,		177.3947},
	{0,		1168.5120,		1360.1145,		10.9293,		196.5933},
	{9,		315.4544,		976.5972,		1960.8511,		359.6368},
	{10,	1893.0731,		1017.8958,		31.8828,		86.1044},
	{11,	501.9578,		-70.5648,		998.7578,		171.5706},
	{8,		-42.5267,		1408.2300,		1084.4297,		172.0680},
	{11,	2283.3118,		1139.3070,		1050.8984,		19.7032},
	{9,		84.9244,		1324.2983,		1083.8594,		159.5582},
	{9,		260.7421,		1238.2261,		1084.2578,		84.3084},
	{0,		-1658.1656,		1215.0002,		7.2500,			103.9074},
	{0,		-1961.6281,		295.2378,		35.4688,		264.4891},
	{11,	2003.1178,		1015.1948,		33.0080,		351.5789}
};

new VehicleNames[][] = {
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
   	"Trailer",
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
   	"Trailer",
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
   	"Hotring Racer",
   	"Hotring Racer",
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
   	"Tanker",
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
   	"Firetruck",
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
   	"Monster Truck",
   	"Monster Truck",
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
   	"Freight",
   	"Trailer",
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
   	"Trailer",
   	"Emperor",
   	"Wayfarer",
   	"Euros",
   	"Hotdog",
   	"Club",
   	"Trailer",
   	"Trailer",
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
   	"Luggage Trailer",
   	"Luggage Trailer",
   	"Stair Trailer",
   	"Boxville",
   	"Farm Plow",
   	"Utility Trailer"
};

enum objectData
{
	objectId,
	objectModel,
	Float:offsetDis[3],
	Float:offsetRot[3]
}

new PlayerObject[MAX_PLAYERS][objectData];

//Forward's
forward TakePickup(pickupid);
forward TakeObject(objectid);

//---------------------------

public OnFilterScriptInit()
{
	print("  Paradise Society Edition Tools loaded\n");
}

public OnPlayerConnect(playerid)
{

}

public OnPlayerDisconnect(playerid, reason)
{
	if(IsValidObject(PlayerObject[playerid][objectId]))
		DestroyObject(PlayerObject[playerid][objectId]);
}

// ------------ Functions by kyeman ------------ //
stock PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}
// --------------------------------------------- //

// ------------ Functions by DracoBlue ------------ //
strtok(const string[], &index, seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[128];
	while ((index < length) && (string[index] != seperator) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	if ((index < length) && (string[index] == seperator))
	{
		index++;
	}
	return result;
}
// --------------------------------------------- //

stock IsNumeric(const string[])
{
	for(new n = 0; n < strlen(string); n++)
	{
		if(string[n] < '0' || string[n] > '9')
		    return false;
	}
	
	return true;
}

stock IsValidSkin(skin)
{
    if(	skin == 3 || skin == 4 || skin == 5 || skin == 6 || skin == 8 || skin == 42 || skin == 65 || skin == 74 || skin == 86 ||
		skin == 119 || skin == 149 || skin == 208 || skin == 273 || skin == 274 || skin == 289 || skin >= 300) return false;
		
    return true;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!IsPlayerAdmin(playerid))
		return 0;
	
	new cmd[128], idx = 0;
	
	cmd = strtok(cmdtext, idx);
	
	if(strcmp(cmd, "/vajuda", true) == 0)
	{
	    SendClientMessage(playerid, COLOR_WHITE, "Comandos principais:");
	    SendClientMessage(playerid, COLOR_SKY_BLUE, "/v /velocity /spawn /pickup /clima /voar /gotoint");
	    return 1;
	}
	
	if(strcmp(cmd, "/crime", true) == 0)
	{
	    new crime;
	    
	    crime = strval(strtok(cmdtext, idx));
	    
	    if(crime == 0)
	        return 1;
	        
		PlayCrimeReportForPlayer(playerid, playerid, crime);
		return 1;
	}
	
	if(strcmp(cmd, "/v", true) == 0)
	{
	    new vname[128], vid = -1;
	    strmid(vname, cmdtext, 3, strlen(cmdtext));
	    
		if(!strlen(vname))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /v [nome/id do veiculo]");
		    return 1;
		}
		
	    if(IsNumeric(vname))
	    {
	        vid = strval(vname);
	    }
	    else
	    {
	        for(new v = 0; v < sizeof VehicleNames; v++)
	        {
	            if(strcmp(VehicleNames[v], vname, true) == 0)
	            {
	                vid = v + 400;
	                break;
	            }
	        }
	    }
	    
		if(vid == -1 || vid < 400 || vid >= 400 + sizeof VehicleNames)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Erro: veículo inválido.");
		    return 1;
		}
		
		new string[128];
		new veh;
		new Float:X, Float:Y, Float:Z, Float:rot;
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerFacingAngle(playerid, rot);
		
		rot = rot + 180.0;
		if(rot >= 360.0)
		    rot = rot - 360.0;
		    
		veh = CreateVehicle(vid, X + 1, Y + 1, Z, rot, -1, -1, -1);
		format(string, sizeof string, "Veiculo criado [ID: %d]", veh);
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}

    if(strcmp(cmd, "/pickup", true) == 0)
	{
	    new pck, pckmodel, Float:X, Float:Y, Float:Z, Float:A;

		pckmodel = strval(strtok(cmdtext, idx));
	    
		if(pckmodel == 0)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /pickup [modelo]");
		    return 1;
		}

		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerFacingAngle(playerid, A);
		
		X += 2.0 * floatsin(-A, degrees);
		Y += 2.0 * floatcos(-A, degrees);
		
		pck = CreatePickup(pckmodel, 1, X, Y, Z);
		SetTimerEx("TakePickup", 20000, false, "i", pck);
		return 1;
	}
	
	if(strcmp(cmd, "/velocity", true) == 0)
	{
	    new vehid;
	    new Float:VX, Float:VY, Float:VZ;
	    
	    vehid = INVALID_VEHICLE_ID;
	    
	    if(IsPlayerInAnyVehicle(playerid))
	        vehid = GetPlayerVehicleID(playerid);
	    
		VX = floatstr(strtok(cmdtext, idx));
		VY = floatstr(strtok(cmdtext, idx));
		VZ = floatstr(strtok(cmdtext, idx));
		
		if(vehid != INVALID_VEHICLE_ID)
			SetVehicleVelocity(vehid, VX, VY, VZ);
			
		else
		    SetPlayerVelocity(playerid, VX, VY, VZ);
		    
		SendClientMessage(playerid, COLOR_WHITE, "Velocidade alterada.");
		return 1;
	}
	
	if(strcmp(cmd, "/avelocity", true) == 0)
	{
	    new Float:VX, Float:VY, Float:VZ;

		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Você não está em um veículo.");
			return 1;
		}

		VX = floatstr(strtok(cmdtext, idx));
		VY = floatstr(strtok(cmdtext, idx));
		VZ = floatstr(strtok(cmdtext, idx));
		SetVehicleAngularVelocity(GetPlayerVehicleID(playerid), VX, VY, VZ);
	    SendClientMessage(playerid, COLOR_WHITE, "Velocidade angular alterada.");
	    return 1;
	}
	
	if(strcmp(cmd, "/object", true) == 0)
	{
	    new action[128];
	    new model, force, bone, actionid;

		force = strval(strtok(cmdtext, idx));
		
	    if(IsValidObject(PlayerObject[playerid][objectId]))
    		DestroyObject(PlayerObject[playerid][objectId]);

		StopPlayerHoldingObject(playerid);

		action = strtok(cmdtext, idx);
		actionid = -1;
		
		if(strlen(action) > 0)
		{
			if(strcmp(action, "attach", true) == 0)
			    actionid = 1;
		    
			if(strcmp(action, "hold", true) == 0)
			    actionid = 2;
		}
		
		if(actionid == -1)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Ação inválida, use: attach ou hold");
			return 1;
		}
		
		model = strval(strtok(cmdtext, idx));
		
		if(actionid == 2)
			bone = strval(strtok(cmdtext, idx));
			
		if(!force && (!IsValidModel(model) && (model < 331 || model > 371)))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Modelo inválido!");
			return 1;
        }
        
        for(new a = 0; a < 3; a++)
            PlayerObject[playerid][offsetDis][a] = floatstr(strtok(cmdtext, idx));
        
        for(new a = 0; a < 3; a++)
            PlayerObject[playerid][offsetRot][a] = floatstr(strtok(cmdtext, idx));
            
		if(actionid == 1)
		{
		    PlayerObject[playerid][objectModel] = model;
			PlayerObject[playerid][objectId] = CreateObject(model, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

			AttachObjectToPlayer(PlayerObject[playerid][objectId], playerid,   	0.0,
																				PlayerObject[playerid][offsetDis][0],
																				PlayerObject[playerid][offsetDis][1],
																				PlayerObject[playerid][offsetRot][0],
																				PlayerObject[playerid][offsetRot][1],
																				PlayerObject[playerid][offsetRot][2]
																				);
		}
		
		else if(actionid == 2)
		{
			if(bone < 1 || bone > 18)
				return 1;
				
		    SetPlayerHoldingObject(playerid, model,                             bone,
		                                                                        PlayerObject[playerid][offsetDis][0],
																				PlayerObject[playerid][offsetDis][1],
																				PlayerObject[playerid][offsetDis][2],
																				PlayerObject[playerid][offsetRot][0],
																				PlayerObject[playerid][offsetRot][1],
																				PlayerObject[playerid][offsetRot][2]
																				);
		}
		
		return 1;
	}

    if(strcmp(cmd, "/saveobject", true) == 0)
	{
	    if(!IsValidObject(PlayerObject[playerid][objectId]))
	        return 1;
	        
	    new File:fo, text[128], id, M, Float:PX, Float:PY, Float:PZ, Float:RX, Float:RY, Float:RZ, comment[128];

	    if(fexist("savedobjects.txt"))
	        fo = fopen("savedobjects.txt", io_append);
		else
		    fo = fopen("savedobjects.txt", io_write);

		M = PlayerObject[playerid][objectModel];
		GetPlayerPos(playerid, PX, PY, PZ);
		GetPlayerFacingAngle(playerid, RZ);
		
		PX += PlayerObject[playerid][offsetDis][0] * floatsin(-RZ, degrees);
		PY += PlayerObject[playerid][offsetDis][0] * floatcos(-RZ, degrees);
		PZ += PlayerObject[playerid][offsetDis][1];
		RX = PlayerObject[playerid][offsetRot][0];
		RY = PlayerObject[playerid][offsetRot][1];
		RZ += PlayerObject[playerid][offsetRot][2];

		strmid(comment, cmdtext, 12, strlen(cmdtext));

		if(!strlen(comment))
			format(text, sizeof text, "%d,    %.4f,    %.4f,    %.4f,    %.4f,    %.4f,    %.4f\r\n", M, PX, PY, PZ, RX, RY, RZ);

		else
		    format(text, sizeof text, "%d,    %.4f,    %.4f,    %.4f,    %.4f,    %.4f,    %.4f    // %s\r\n", M, PX, PY, PZ, RX, RY, RZ, comment);

		fwrite(fo, text);
		fclose(fo);
		
		id = CreateObject(M, PX, PY, PZ, RX, RY, RZ);
		SetTimerEx("TakeObject", 10000, false, "d", id);
		SendClientMessage(playerid, COLOR_WHITE, "Objeto salvo.");
		return 1;
	}
	
	if(strcmp(cmd, "/savepos", true) == 0)
	{
	    new File:fp, text[128], M, Float:X, Float:Y, Float:Z, Float:A, INT, comment[128];
	    
	    if(fexist("savedpositions.txt"))
	        fp = fopen("savedpositions.txt", io_append);
		else
		    fp = fopen("savedpositions.txt", io_write);
		    
		if(!IsPlayerInAnyVehicle(playerid))
		{
		    M = GetPlayerSkin(playerid);
			GetPlayerPos(playerid, X, Y, Z);
			GetPlayerFacingAngle(playerid, A);
		}
		else
		{
		    new vehid;
		    
		    vehid = GetPlayerVehicleID(playerid);
		    
		    M = GetVehicleModel(vehid);
		    GetVehiclePos(vehid, X, Y, Z);
		    GetVehicleZAngle(vehid, A);
		}
		
		INT = GetPlayerInterior(playerid);
		
		strmid(comment, cmdtext, 9, strlen(cmdtext));
		
		if(!strlen(comment))
			format(text, sizeof text, "%d,    %.4f,    %.4f,    %.4f,    %.4f,    %d\r\n", M, X, Y, Z, A, INT);

		else
		    format(text, sizeof text, "%d,    %.4f,    %.4f,    %.4f,    %.4f,    %d    // %s\r\n", M, X, Y, Z, A, INT, comment);
		    
		fwrite(fp, text);
		fclose(fp);
		SendClientMessage(playerid, COLOR_WHITE, "Posicao salva.");
		return 1;
	}
	
    if(strcmp(cmd, "/gotoint", true) == 0)
	{
		new intid = strval(strtok(cmdtext, idx));
		
		if(intid < 1 || intid > sizeof Interiors)
		{
			new errmsg[128];
			format(errmsg, sizeof errmsg, "USO: /gotoint [1-%d]", sizeof Interiors);
		    SendClientMessage(playerid, COLOR_GRAY, errmsg);
		    return 1;
		}
		
		intid--;
		
		SetPlayerInterior(playerid, Interiors[intid][interiorId]);
		SetPlayerPos(playerid, Interiors[intid][interiorX], Interiors[intid][interiorY], Interiors[intid][interiorZ]);
		SetPlayerFacingAngle(playerid, Interiors[intid][interiorA]);
		return 1;
	}
	
	if(strcmp(cmd, "/clima", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
	    }

	    new tmp[128], weather = -1;

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /clima [clima]");
		    return 1;
	    }

		if(IsNumeric(tmp))
		{
		    weather = strval(tmp);
		}
		else
		{
			for(new w = 0; w < sizeof Weathers; w++)
			{
			    if(strcmp(Weathers[w][weatherName], tmp, true) == 0)
			    {
			        weather = Weathers[w][weatherValue];
			        break;
			    }
			}
		}
		
	    if(weather == -1)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: clima inválido. Uso: ensolarado, super-ensolarado, chuvoso, nublado,");
	        SendClientMessage(playerid, COLOR_GRAY, "tempestade, tempestade-areia");
		    return 1;
	    }

	    SetWeather(weather);
	    SendClientMessage(playerid, COLOR_WHITE, "Feito.");
	    return 1;
	}
	
	return 0;
}

stock IsValidModel(modelid)
{
	// Created by Y_Less.

	static modeldat[] =
	{
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -128,
		-515899393, -134217729, -1, -1, 33554431, -1, -1, -1, -14337, -1, -33,
		127, 0, 0, 0, 0, 0, -8388608, -1, -1, -1, -16385, -1, -1, -1, -1, -1,
		-1, -1, -33, -1, -771751937, -1, -9, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, 33554431, -25, -1, -1, -1, -1, -1, -1,
		-1073676289, -2147483648, 34079999, 2113536, -4825600, -5, -1, -3145729,
		-1, -16777217, -63, -1, -1, -1, -1, -201326593, -1, -1, -1, -1, -1,
		-257, -1, 1073741823, -133122, -1, -1, -65, -1, -1, -1, -1, -1, -1,
		-2146435073, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1073741823, -64, -1,
		-1, -1, -1, -2635777, 134086663, 0, -64, -1, -1, -1, -1, -1, -1, -1,
		-536870927, -131069, -1, -1, -1, -1, -1, -1, -1, -1, -16384, -1,
		-33554433, -1, -1, -1, -1, -1, -1610612737, 524285, -128, -1,
		2080309247, -1, -1, -1114113, -1, -1, -1, 66977343, -524288, -1, -1, -1,
		-1, -2031617, -1, 114687, -256, -1, -4097, -1, -4097, -1, -1,
		1010827263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -32768, -1, -1, -1, -1, -1,
		2147483647, -33554434, -1, -1, -49153, -1148191169, 2147483647,
		-100781080, -262145, -57, 134217727, -8388608, -1, -1, -1, -1, -1, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, -1048577, -1, -449, -1017, -1, -1, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, -1835009, -2049, -1, -1, -1, -1, -1, -1,
		-8193, -1, -536870913, -1, -1, -1, -1, -1, -87041, -1, -1, -1, -1, -1,
		-1, -209860, -1023, -8388609, -2096897, -1, -1048577, -1, -1, -1, -1,
		-1, -1, -897, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1610612737,
		-3073, -28673, -1, -1, -1, -1537, -1, -1, -13, -1, -1, -1, -1, -1985,
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1056964609, -1, -1, -1,
		-1, -1, -1, -1, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-236716037, -1, -1, -1, -1, -1, -1, -1, -536870913, 3, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-1, -1, -1, -1, -1, -2097153, -2109441, -1, 201326591, -4194304, -1, -1,
		-241, -1, -1, -1, -1, -1, -1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, -32768, -1, -1, -1, -2, -671096835, -1, -8388609, -66323585, -13,
		-1793, -32257, -247809, -1, -1, -513, 16252911, 0, 0, 0, -131072,
		33554383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 8356095, 0, 0, 0, 0, 0,
		0, -256, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-268435449, -1, -1, -2049, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		92274627, -65536, -2097153, -268435457, 591191935, 1, 0, -16777216, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 127
	};
	
	if ((modelid >= 0) && ((modelid / 32) < sizeof (modeldat)) && (modeldat[modelid / 32] & (1 << (modelid % 32))))
	{
	    return 1;
	}
	
	return 0;
}

public TakePickup(pickupid)
	DestroyPickup(pickupid);

public TakeObject(objectid)
	DestroyObject(objectid);
