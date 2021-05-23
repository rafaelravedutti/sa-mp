#include <a_samp>
#include <a_players>
#include <dutils>
#include <dudb>
#include <c_vehicleinfo>
#include <a_objects>
#include <float>
#include <core>

#define CallCost 1
#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256

#define COLOR_GREEN            0x2ff700AA
#define COLOR_RED              0xc70000AA
#define COLOR_YELLOW           0xfdd725AA
#define COLOR_WHITE            0xFFFFFFAA
#define COLOR_GRAY             0xAFAFAFAA
#define COLOR_DESEMPREGADO     0x666666AA
#define COLOR_INSTRUTOR        0xff0000FF
#define COLOR_TAXISTA          0xffee60AA
#define COLOR_COP_CIVIL        0x068de2AA
#define COLOR_SWAT             0x00C7FFAA
#define COLOR_EXERCITO         0x003edbAA
#define COLOR_ASSASSINO        0x000000AA
#define COLOR_VENDEDOR         0xFAFAD2AA
#define COLOR_COP_RODOVIARIO   0x5d96ffAA
#define COLOR_SEGURANÇA        0x79d9a4AA
#define COLOR_BARMAN           0xff8080AA
#define COLOR_CORRETOR         0xBC8F8FAA
#define COLOR_MECANICO         0x9acefbAA
#define COLOR_MOTORISTA        0xfcd82eAA
#define COLOR_VENDEDOR_ARMAS   0x8DC32EAA
#define COLOR_MOTORISTA_ONIBUS 0x029c47AA
#define COLOR_JORNALISTA       0xffffffAA
#define COLOR_JUIZ             0x7FFF00AA
#define COLOR_MEDICO           0x9fe9feAA
#define COLOR_BANCARIO         0x00a90cAA
#define COLOR_TRAFICANTE       0x7a0505AA

#define DESEMPREGADO          1
#define TAXISTA               2
#define BARMAN                3
#define SEGURANÇA             4
#define MOTORISTA_PARTICULAR  5
#define MECANICO              6
#define VENDEDOR_ARMAS        7
#define MOTORISTA_DE_ONIBUS   8
#define JORNALISTA            9
#define MEDICO                10
#define BANCARIO              11
#define VENDEDOR_DE_VEICULOS  12
#define CORRETOR              13
#define ASSASSINO             14
#define TRAFICANTE            15
#define JUIZ                  16
#define COP_CIVIL             17
#define COP_RODOVIARIO        18
#define SWAT                  19
#define EXERCITO              20
#define INSTRUTOR_DE_DIRECAO  21

#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

new OldvehName[][] =
{
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


new nomeprocurado[] [] = {
"Não procurado",
"1 - [Aprendiz do Crime]",
"2 - [Criminoso]",
"3 - [Mafia]",
"4 - [Assassino Frio]",
"5 - [Gangster]",
"6 - [Genio do Crime]"
};
new Mudo[MAX_PLAYERS]=0;
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new Petrol[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new Valores[MAX_PLAYERS] = 0;
new Passagem[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new worldTime;
new Bebida[MAX_PLAYERS] = 0;
new AreaPosto[MAX_PLAYERS];
new AreaEntregarValores[MAX_PLAYERS] = 0;
new AreaEntregaCarros[MAX_PLAYERS] = 0;
new AreaLavagem[MAX_PLAYERS] = 0;
new AreaEntregaLT[MAX_PLAYERS] = 0;
new AreaEntregaCarBar[MAX_PLAYERS] = 0;
new AreaEntregaLimo[MAX_PLAYERS] = 0;
new Calling[MAX_PLAYERS];
new Answered[MAX_PLAYERS];
new Callerid[MAX_PLAYERS];
new assalto[MAX_PLAYERS] = 0;
new bool:Bilhete[MAX_PLAYERS];
new Text:vehiclehpbar[12];
new aposta[MAX_PLAYERS] = 0;
new numeroapostado[MAX_PLAYERS];
new moneyloteria;
new LavagemCarBar;
new LavagemLimo;
new LavagemTaxi;
new vehhouse1;
new vehhouse2;
new vehhouse3;
new vehoffice1;
new vehoffice2;
new vehoffice3;
new vehoffice4;
new vehseg1;
new vehseg2;
new vehseg3;
new vehmoto1;
new vehmoto2;
new vehmoto3;
new vehbar1;
new vehbar2;
new vehcops1;
new vehcops2;
new vehcops3;
new vehcops4;
new vehcops5;
new vehcops6;
new vehcops7;
new vehcops8;
new vehcops9;
new vehcops10;
new vehcops11;
new vehauto1;
new vehauto2;
new vehauto3;
new vehauto4;
new vehauto5;
new vehauto6;
new vehauto7;
new vehauto8;
new vehauto9;
new vehauto10;
new vehbahne1;
new vehbahne2;
new vehbahne3;
new vehbahne4;
new vehnews1;
new vehnews2;
new vehnews3;
new vehnews4;
new vehbahni1;
new vehbahni2;
new vehbahni3;
new vehbahni4;
new vehhospital1;
new vehhospital2;
new vehhospital3;
new vehhospital4;
new vehhospital5;
new vehtaxi1;
new vehtaxi2;
new vehtaxi3;
new vehtaxi4;
new vehtaxi5;
new vehtaxi6;
new vehtaxi7;
new vehtaxi8;
new vehbanco1;
new vehbanco2;
new vehbus1;
new vehbus2;
new vehbus3;
new vehbus4;
new vehcrims1;
new vehcrims2;
new vehcrims3;
new vehcrims4;
new vehcrims5;
new vehcrims6;
new vehammu1;
new vehammu2;
new vehammu3;
new vehbase1;
new vehbase2;
new vehbase3;
new vehbase4;
new vehbase5;
new vehbase6;
new vehbase7;
new vehjuiz1;
new vehjuiz2;

forward Bancos(playerid);
forward LogarPlayer(playerid);
forward TempoPrisao();
forward Taxi();
forward GetDistanceBetweenPlayers(playerid,playerid2);
forward Tempo();
forward PhoneCut();
forward VHPBarUpdate();
forward CellPhoneTimer ();
forward DestroyVehicleEx(vehicleid);
forward MoneyGrubScoreUpdate();
forward sethome(playerid);
forward Assalto(playerid);
forward consertar(vehicle,plid,angulo);
forward Megasena();
forward Anuncio();
forward Anuncio2();
forward CountDown();
forward contagem();
forward contagem2();
forward contagem3();
forward contagem4();
forward contagem5();


main()
{
	print("\n----------------------------------");
	print("  Magnum RPG");
	print("----------------------------------\n");
	worldTime = 12;
}



public OnGameModeInit()
{
	print("GameModeInit()");
	SetGameModeText("Magnum RPG LV");
    UsePlayerPedAnims();
    EnableTirePopping(1);
    AllowInteriorWeapons(1);
    SetTimer("Megasena", 600000, 1);
	SetTimer("Anuncio", 1000000, 1);
	SetTimer("Anuncio2", 1007000, 1);
	moneyloteria = 2000;


	//Jogador da camera
    AddPlayerClass(115,-2670.5679,1410.4138,907.5703,264.1425,0,0,0,0,0,0);
	//Jogador da camera --- Fim

	//Veículos
	//vehbahni
	vehbahni1 = AddStaticVehicle(405,1946.1660,2042.4249,10.6916,358.6889,2,2);
	vehbahni2 = AddStaticVehicle(405,1946.2294,2094.8152,10.6953,0.0995,2,2);
	vehbahni3 = AddStaticVehicle(401,1946.0564,2062.5483,10.6000,359.1416,0,0);
	vehbahni4 = AddStaticVehicle(401,1946.2271,2073.9324,10.5993,359.1411,3,3);

	//vehcops
	vehcops1 = AddStaticVehicle(598,2273.5569,2444.3333,10.5691,1.9817,0,1);
	vehcops2 = AddStaticVehicle(598,2273.8958,2477.6191,10.5682,357.0321,0,1);
	vehcops3 = AddStaticVehicle(598,2256.9358,2442.3372,10.5657,179.6883,0,1);
	vehcops4 = AddStaticVehicle(523,2291.3811,2477.4827,10.3867,180.0423,0,0);
	vehcops5 = AddStaticVehicle(523,2295.1936,2476.2922,10.3931,179.3076,0,0);
	vehcops6 = AddStaticVehicle(599,2313.8337,2485.1807,3.4629,90.6560,0,1);
	vehcops7 = AddStaticVehicle(599,2313.0164,2470.4111,3.4568,266.1597,0,1);
	vehcops8 = AddStaticVehicle(490,2272.8174,2430.0762,3.4009,0.2394,0,0);
	vehcops9 = AddStaticVehicle(490,2289.5178,2432.0776,3.4011,181.3947,0,0);
	vehcops10 = AddStaticVehicle(427,2240.7988,2446.6543,3.6603,270.7307,0,1);
	vehcops11 = AddStaticVehicle(427,2239.7605,2466.1367,3.6546,267.1605,0,1);

	//vehbahne
	vehbahne1 = AddStaticVehicle(401,2142.4082,1397.8372,10.5920,3.1479,3,3); 
	vehbahne2 = AddStaticVehicle(445,2132.8999,1408.8198,10.6953,178.7538,0,0); 
	vehbahne3 = AddStaticVehicle(489,2142.3647,1409.4255,10.9633,358.8957,0,2); 
	vehbahne4 = AddStaticVehicle(404,2103.9583,1398.4353,10.5894,177.6464,0,0);

	//vehoffice
	vehoffice1 = AddStaticVehicle(549,1964.9554,2147.1321,10.5178,93.6246,75,39); 
	vehoffice2 = AddStaticVehicle(525,1964.0243,2169.8674,10.7012,88.9929,0,125); 
	vehoffice3 = AddStaticVehicle(525,1951.3385,2144.7026,10.6982,3.4120,0,3); 
	vehoffice4 = AddStaticVehicle(549,1942.3962,2166.3149,10.5173,181.9214,0,125); 
    
	//vehbanco
	vehbanco1 = AddStaticVehicle(405,2185.9097,1991.4039,10.6952,266.4131,3,3);
	vehbanco2 = AddStaticVehicle(402,2171.1326,1977.9497,10.6525,90.1421,125,0);

	//vehauto
	vehauto1 = AddStaticVehicle(475,1096.0276,1233.4375,10.6236,179.7299,6,6);
	vehauto2 = AddStaticVehicle(475,1096.0172,1244.4154,10.6246,179.8306,6,6);
	vehauto3 = AddStaticVehicle(475,1091.2751,1262.5594,10.6246,176.2764,6,6);
	vehauto4 = AddStaticVehicle(487,1047.1437,1344.7643,10.9982,267.9161,6,0); 
	vehauto5 = AddStaticVehicle(410,1094.1599,1336.9833,10.4731,91.1682,6,6); 
	vehauto6 = AddStaticVehicle(410,1093.8196,1326.5089,10.4751,90.9859,6,6); 
	vehauto7 = AddStaticVehicle(461,1044.5193,1305.1255,10.4069,2.9855,6,6); 
	vehauto8 = AddStaticVehicle(461,1049.5883,1304.7498,10.3967,358.8296,6,6); 
	vehauto9 = AddStaticVehicle(493,1631.5173,569.8721,-0.2855,179.7533,6,0); 
	vehauto10 = AddStaticVehicle(493,1625.7845,569.6095,-0.0570,180.8671,6,0); 

	//vehnews
	vehnews1 = AddStaticVehicle(488,2373.3745,1664.3772,11.0011,272.4090,2,26);
	vehnews2 = AddStaticVehicle(582,2466.2922,1675.9098,10.8714,179.6741,1,1);
	vehnews3 = AddStaticVehicle(582,2510.3623,1661.8591,10.8800,265.9380,0,2);
	vehnews4 = AddStaticVehicle(582,2485.3882,1657.5768,10.8815,178.1065,125,0);

	//vehtaxi
	vehtaxi1 = AddStaticVehicle(420,1864.6603,2241.2463,10.6068,6.2056,6,1); 
	vehtaxi2 = AddStaticVehicle(438,1888.0574,2241.3293,10.8260,356.2267,6,76); 
	vehtaxi3 = AddStaticVehicle(438,1880.6625,2241.4302,10.8239,1.1159,6,76);
	vehtaxi4 = AddStaticVehicle(438,1899.7133,2241.6511,10.8266,1.3669,6,76); 
	vehtaxi5 = AddStaticVehicle(438,1908.0165,2241.1641,10.8260,359.0740,6,76); 
	vehtaxi6 = AddStaticVehicle(420,1871.9828,2241.3616,10.6025,358.1767,6,1);
	vehtaxi7 = AddStaticVehicle(420,1843.9739,2241.2402,10.6025,0.6550,6,1); 
	vehtaxi8 = AddStaticVehicle(420,1853.0668,2240.8418,10.6085,2.4142,6,1); 

	//vehhospital
	vehhospital1 = AddStaticVehicle(416,1625.3534,1818.8691,10.9693,2.7318,1,3); 
	vehhospital2 = AddStaticVehicle(416,1592.0980,1819.3824,10.9701,3.9126,1,3); 
	vehhospital3 = AddStaticVehicle(416,1599.9314,1831.3740,10.9725,178.6040,1,3);
	vehhospital4 = AddStaticVehicle(416,1588.4619,1727.8705,10.9714,179.3256,1,3); 
	vehhospital5 = AddStaticVehicle(416,1625.8940,1728.8646,10.9686,185.2370,1,3); 

	//vehbase
	vehbase1 = AddStaticVehicle(432,133.9472,1849.9563,17.7006,92.9872,1,1);
	vehbase2 = AddStaticVehicle(433,220.4303,1917.1709,18.0775,181.8061,1,1); 
	vehbase3 = AddStaticVehicle(433,194.1393,1917.2959,18.0772,181.3895,1,1);
	vehbase4 = AddStaticVehicle(470,211.0606,1918.6636,17.6310,180.4252,43,0);
	vehbase5 = AddStaticVehicle(470,204.0072,1919.2914,17.6391,182.2571,43,0);
	vehbase6 = AddStaticVehicle(425,278.6382,2025.7174,18.2137,267.3352,43,0);
	vehbase7 = AddStaticVehicle(520,277.6712,1994.3154,18.3639,269.8422,0,0);

	//vehmoto
	vehmoto1 = AddStaticVehicle(409,2423.4805,1132.0814,10.4719,359.7100,1,1);
	vehmoto2 = AddStaticVehicle(409,2423.3967,1115.5658,10.4717,359.7099,1,1);
	vehmoto3 = AddStaticVehicle(409,2423.2366,1123.6617,10.5142,358.2101,1,1);

   //vehbar
	vehbar1 = AddStaticVehicle(405,2443.7117,2057.0872,10.5468,91.6614,1,0);
	vehbar2 = AddStaticVehicle(466,2436.5032,2057.0967,10.4137,90.6940,2,1);

	//vehcrims
	vehcrims1 = AddStaticVehicle(521,925.9478,2080.8652,10.3899,269.0932,2,0);
	vehcrims2 = AddStaticVehicle(402,928.2193,2067.7307,10.6521,271.7605,3,0);
	vehcrims3 = AddStaticVehicle(495,947.0792,2056.5552,11.1707,356.1663,0,2);
	vehcrims4 = AddStaticVehicle(492,943.8807,2082.6873,10.6022,181.4467,83,0);
	vehcrims5 = AddStaticVehicle(471,950.8767,2085.0759,10.3017,176.1080,0,125);
	vehcrims6 = AddStaticVehicle(471,957.9603,2085.1699,10.3019,174.9835,102,1);
	
	//vehammu
	vehammu1 = AddStaticVehicle(521,2161.1462,921.8054,10.3848,183.9482,115,118); 
	vehammu2 = AddStaticVehicle(458,2169.1733,920.8455,10.7059,178.6009,67,2);
	vehammu3 = AddStaticVehicle(400,2182.8171,921.6407,10.9127,178.5392,1,0);

	//vehbus
	vehbus1 = AddStaticVehicle(437,2095.9280,1257.6160,10.9537,0.1575,105,20); 
	vehbus2 = AddStaticVehicle(437,2106.0574,1255.7217,10.9529,358.7354,105,20); 
	vehbus3 = AddStaticVehicle(437,2095.8389,1307.7499,10.9536,0.1266,105,20);
	vehbus4 = AddStaticVehicle(437,2106.3088,1284.6777,10.9542,359.5685,123,20); 

	//vehjuiz
	vehjuiz1 = AddStaticVehicle(409,2034.4639,1907.0732,11.9772,182.7279,0,0);
	vehjuiz2 = AddStaticVehicle(409,2034.3429,1921.8368,11.9790,176.3340,0,0);

	//vehseg
	vehseg1 = AddStaticVehicle(428,2431.1418,1111.4194,10.7970,181.9599,4,75); 
	vehseg2 = AddStaticVehicle(428,2431.1135,1135.0887,10.7956,0.6420,4,75); 
	vehseg3 = AddStaticVehicle(428,2446.9124,1123.2839,10.9448,90.5131,4,75); 

	//vehhouse
	vehhouse1 = AddStaticVehicle(401,1893.9012,2339.2720,10.6118,181.1249,1,2); 
	vehhouse2 = AddStaticVehicle(517,1902.6184,2338.6980,10.6751,185.2603,36,36);
	vehhouse3 = AddStaticVehicle(421,1977.4735,2449.3091,10.7027,181.0218,25,1); 

	//Veiculos Publicos
	AddStaticVehicle(481,2037.3138,2211.4409,10.3385,275.5627,5,0); 
	AddStaticVehicle(481,2037.1764,2212.9712,10.3351,270.9350,125,0); 
	AddStaticVehicle(481,2036.6355,2214.7393,10.3354,270.2825,2,0); 
	AddStaticVehicle(481,2037.1956,2217.2158,10.3346,271.6721,3,0); 
	AddStaticVehicle(481,2111.6399,2208.7100,10.3357,79.1565,12,0); 
	AddStaticVehicle(481,2111.6423,2206.8049,10.3358,80.8902,11,0); 
	AddStaticVehicle(481,2110.8621,2204.7437,10.3379,79.0776,24,0); 
	AddStaticVehicle(481,1611.7828,1861.4678,10.3373,179.8856,1,1); 
	AddStaticVehicle(481,1609.9486,1861.6957,10.3377,180.1493,0,1); 
	AddStaticVehicle(481,1607.5291,1861.4696,10.3374,179.9099,125,1); 
	AddStaticVehicle(481,1605.6991,1861.3486,10.3368,182.1719,122,1); 
	AddStaticVehicle(444,1570.8450,-1265.4540,278.2260,2.3981,0,0);
	AddStaticVehicle(444,1585.3671,-1266.8855,278.2346,5.5270,1,1);
	AddStaticVehicle(444,1594.1412,-1255.1594,278.2209,90.2762,2,2);
	AddStaticVehicle(444,1593.6874,-1234.9283,278.2412,93.3708,3,3);
	AddStaticVehicle(444,1578.3777,-1223.7921,278.2386,177.0357,5,5);
	AddStaticVehicle(444,1562.3866,-1223.0426,278.2302,179.0812,6,6);
	AddStaticVehicle(444,1554.0948,-1236.3461,278.2410,266.9189,7,7);
	AddStaticVehicle(444,1551.6528,-1248.6123,278.2563,269.7950,8,8);
	//Veículos --- Fim

	//Caixas Bancários
	CreateObject(2618, -1973.994263, 116.928520, 26.680391, 0, 0, 180);
    CreateObject(2618, -1746.244141, 963.181519, 23.875704, 0, 0, 11.25);
    CreateObject(2618, -2447.337891, 521.210693, 29.346886, 0, 0, 90);
    CreateObject(2618, -2637.225098, 636.294434, 13.446016, 0, 0, 270);
    CreateObject(2618, -1951.323853, 643.137146, 45.555393, 0, 0, 180);
    CreateObject(2618, -2079.748535, -2448.073730, 29.617891, 0, 0, 315);
    //Caixas Bancários --- Fim

	new File:temp;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	temp = fopen("[TMR]_Veiculos.lgp", io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid    = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		ang        = Float:floatstr(strtok(tmp, index));
		Cor1       = strval(strtok(tmp, index));
		Cor2       = strval(strtok(tmp, index));

		AddStaticVehicle(modelid, X, Y, Z, ang, Cor1, Cor2);
	}
	
 	new ico, num;
	temp = fopen("[TMR]_icones.lgp", io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
	    index = 0;
		ico        = strval(strtok(tmp, index));
		num        = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));


		AddStaticPickup(ico, num, X, Y, Z);
		}
//---------------carro
 	vehiclehpbar[0] = TextDrawCreate(549.0, 50.0, "FOGO");
	TextDrawColor(vehiclehpbar[0], COLOR_ASSASSINO);
	TextDrawUseBox(vehiclehpbar[0], true);
	TextDrawBoxColor(vehiclehpbar[0], COLOR_RED);
	TextDrawSetShadow(vehiclehpbar[0],0);
	TextDrawTextSize(vehiclehpbar[0], 625, 0);

	vehiclehpbar[1] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[1], true);
	TextDrawBoxColor(vehiclehpbar[1], COLOR_MEDICO);
	TextDrawSetShadow(vehiclehpbar[1],0);
	TextDrawTextSize(vehiclehpbar[1], 551, 0);

	vehiclehpbar[2] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[2], true);
	TextDrawBoxColor(vehiclehpbar[2], COLOR_MEDICO);
	TextDrawSetShadow(vehiclehpbar[2],0);
	TextDrawTextSize(vehiclehpbar[2], 556, 0);

	vehiclehpbar[3] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[3], true);
	TextDrawBoxColor(vehiclehpbar[3], COLOR_MEDICO);
	TextDrawSetShadow(vehiclehpbar[3],0);
	TextDrawTextSize(vehiclehpbar[3], 561, 0);

	vehiclehpbar[4] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[4], true);
	TextDrawBoxColor(vehiclehpbar[4], COLOR_SWAT);
	TextDrawSetShadow(vehiclehpbar[4],0);
	TextDrawTextSize(vehiclehpbar[4], 566, 0);

	vehiclehpbar[5] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[5], true);
	TextDrawBoxColor(vehiclehpbar[5], COLOR_SWAT);
	TextDrawSetShadow(vehiclehpbar[5],0);
	TextDrawTextSize(vehiclehpbar[5], 571, 0);

	vehiclehpbar[6] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[6], true);
	TextDrawBoxColor(vehiclehpbar[6], COLOR_SWAT);
	TextDrawSetShadow(vehiclehpbar[6],0);
	TextDrawTextSize(vehiclehpbar[6], 576, 0);

	vehiclehpbar[7] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[7], true);
	TextDrawBoxColor(vehiclehpbar[7], COLOR_SWAT);
	TextDrawSetShadow(vehiclehpbar[7],0);
	TextDrawTextSize(vehiclehpbar[7], 581, 0);

	vehiclehpbar[8] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[8], true);
	TextDrawBoxColor(vehiclehpbar[8], COLOR_EXERCITO);
	TextDrawSetShadow(vehiclehpbar[8],0);
	TextDrawTextSize(vehiclehpbar[8], 586, 0);

	vehiclehpbar[9] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[9], true);
	TextDrawBoxColor(vehiclehpbar[9], COLOR_EXERCITO);
	TextDrawSetShadow(vehiclehpbar[9],0);
	TextDrawTextSize(vehiclehpbar[9], 591, 0);

	vehiclehpbar[10] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[10], true);
	TextDrawBoxColor(vehiclehpbar[10], COLOR_EXERCITO);
	TextDrawSetShadow(vehiclehpbar[10],0);
	TextDrawTextSize(vehiclehpbar[10], 596, 0);

	vehiclehpbar[11] = TextDrawCreate(551.0, 59.0, " ");
	TextDrawUseBox(vehiclehpbar[11], true);
	TextDrawBoxColor(vehiclehpbar[11], COLOR_EXERCITO);
	TextDrawSetShadow(vehiclehpbar[11],0);
	TextDrawTextSize(vehiclehpbar[11], 602, 0);

	SetTimer("VHPBarUpdate",250,1);
// -- settimer --

	fclose(temp);
	
	SetTimer("Bancos", 1000, 1);
	SetTimer("MostrarVelocimetro", 1000, true);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("Tempo", 60000, 1);
    SetTimer("Vcarro",500,1);
    SetTimer("PhoneCut",1000,1);
// -- settimer -- fim --
	
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
			if(IsPlayerInAnyVehicle(i) == 1 && IsPlayerConnected(i) == 1){
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

forward CriarCarro(modelid,Float:X,Float:Y,Float:Z,Float:ang,Cor1,Cor2);
public CriarCarro(modelid,Float:X,Float:Y,Float:Z,Float:ang,Cor1,Cor2) CreateVehicle(modelid,X,Y,Z,ang,Cor1,Cor2,-1);

public OnPlayerRequestClass(playerid, classid)
{
 	SetPlayerInterior(playerid,1);
	SetPlayerPos(playerid,-775.4037,501.3434,1376.5822);
	SetPlayerFacingAngle(playerid, 264.9553);
	SetPlayerCameraPos(playerid,-770.1714,502.7358,1376.5430);
	SetPlayerCameraLookAt(playerid,-775.4037,501.3434,1376.5822);
    PlayerPlaySound(playerid,1185,0.0,0.0,0.0);
	return 1;
}

public OnGameModeExit()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			if (PLAYERLIST_authed[i] == 1) {
			// Was loggedin, so save the data!
				udb_setAccState(PlayerName(i),GetPlayerMoney(i));
				new Float:health;
				GetPlayerHealth(i, health);
				udb_setHealth(PlayerName(i), health);
				udb_setGasoline(PlayerName(i), Petrol[i]);
				printf("Dados de %s (ID: %d) salvos com sucesso\n",PlayerName(i),i);
			}
		}
	}
	print("Magnum RPG finalizando...");
	return 1;
}

public OnPlayerPrivmsg(playerid)
{
    SendClientMessage(playerid,COLOR_GREEN, "O Comando /pm foi desabilitado");
    SendClientMessage(playerid,COLOR_RED, "Digite /celular para saber como mandar mensagens privadas");
    SendClientMessage(playerid,COLOR_RED, "Usando seu Celular");
	return 0;
}

public OnPlayerConnect(playerid)
{

    new nick[MAX_PLAYER_NAME], string[256];
    GetPlayerName(playerid, nick, sizeof(nick));
    format(string, sizeof(string), "%s entrou no servidor.", nick);
    SendClientMessageToAll(COLOR_COP_RODOVIARIO, string);
	new msg[256];
    format(msg,256,"~w~ Bem vindo ~p~ %s", PlayerName(playerid));
    GameTextForPlayer(playerid,msg,5000,0);
 	SendClientMessage(playerid,COLOR_GREEN, "Magnum RPG");
  	SendClientMessage(playerid,COLOR_SWAT, "Quer aprender a jogar o Magnum RPG? digite /aprender.");
  	SendClientMessage(playerid,COLOR_SWAT, "Quer saber os comandos do Magnum RPG? digite /comandos.");
  	SendClientMessage(playerid,COLOR_SWAT, "Quer saber as profissões do Magnum RPG? digite /profs , /profs2 , e as limitadas /profslimitadas , /profslimitadas2");
  	SendClientMessage(playerid,COLOR_RED, "Para ver os admins online no servidor digite /admins.");
	SetPlayerColor(playerid, COLOR_GRAY);
	if (udb_Exists(PlayerName(playerid))) {
    format(string, sizeof(string), "Bem vindo devolta %s, Logue-se com /entrar [senha]", PlayerName(playerid));
    SendClientMessage(playerid,COLOR_WHITE, string);
	return 1;
    }
    if (!udb_Exists(PlayerName(playerid))) {
    format(string, sizeof(string), "Bem vindo %s, Registre-se com /registrar [senha]", PlayerName(playerid));
    SendClientMessage(playerid,COLOR_WHITE, string);
	return 1;
    }
    Mudo[playerid]= 0;
	Calling[playerid] = -1;
	Answered[playerid] = 0;
	Callerid[playerid] = 0;
	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	Petrol[playerid] = udb_getGasoline(PlayerName(playerid));
	return false;
}

public OnPlayerDisconnect(playerid, reason)
{
	if (PLAYERLIST_authed[playerid] == 1) {
	// Was loggedin, so save the data!
	udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
	new Float:health;
	GetPlayerHealth(playerid, health);
	udb_setHealth(PlayerName(playerid), health);
	udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
	PLAYERLIST_authed[playerid] = 0;
	printf("Jogador %s (ID: %d) deixou o servidor. Seus dados foram salvos com sucesso",PlayerName(playerid),playerid);
	}
	else {
	printf("Jogador %s (IvD: %d) deixou o servidor sem se registrar/logar",PlayerName(playerid),playerid);
	}
	new msg[256];
	switch(reason)
	{
	case 0:
	{
	format(msg,sizeof(msg),"%s foi desconectado do servidor. (Caiu)",PlayerName(playerid));
  	SendClientMessageToAll(COLOR_SWAT,msg);
	printf("Jogador %s foi desconectado do servidor. (Caiu)",PlayerName(playerid));
	}
	case 1:
  	{
  	format(msg,sizeof(msg),"%s foi desconectado do servidor. (Saiu)",PlayerName(playerid));
	SendClientMessageToAll(COLOR_SWAT,msg);
	printf("Jogador %s foi desconectado do servidor. (Saiu)",PlayerName(playerid));
	}
	case 2:
  	{
  	format(msg,sizeof(msg),"%s foi desconectado do servidor. (Kickado/Banido)",PlayerName(playerid));
	SendClientMessageToAll(COLOR_SWAT,msg);
	printf("Jogador %s foi desconectado do servidor. (Kickado/Banido)",PlayerName(playerid));
	}
 	}
 	}

public OnPlayerSpawn(playerid)
{
	if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COLOR_DESEMPREGADO);
		GivePlayerWeapon(playerid,5,1);
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COLOR_TAXISTA);
		GivePlayerWeapon(playerid,5,1);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_VEICULOS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COLOR_CORRETOR);
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COLOR_ASSASSINO);
		GivePlayerWeapon(playerid,22,300);
		GivePlayerWeapon(playerid,32,200);
		GivePlayerWeapon(playerid,30,200);
	}
	else if(Profissao[playerid] == TRAFICANTE) {
		SetPlayerColor(playerid, COLOR_TRAFICANTE);
		GivePlayerWeapon(playerid,22,300);
		GivePlayerWeapon(playerid,32,200);
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COLOR_BARMAN);
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COLOR_JUIZ);
		GivePlayerWeapon(playerid,22,300);
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COLOR_SEGURANÇA);
		GivePlayerWeapon(playerid,26,40);
		GivePlayerWeapon(playerid,31,200);
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COLOR_MOTORISTA);
		GivePlayerWeapon(playerid,5,1);
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COLOR_COP_CIVIL);
		GivePlayerWeapon(playerid,22,300);
		GivePlayerWeapon(playerid,25,200);
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COLOR_COP_RODOVIARIO);
		GivePlayerWeapon(playerid,24,60);
		GivePlayerWeapon(playerid,25,200);
	}
	else if(Profissao[playerid] == SWAT) {
		SetPlayerColor(playerid, COLOR_SWAT);
		GivePlayerWeapon(playerid,27,80);
		GivePlayerWeapon(playerid,29,250);
		GivePlayerWeapon(playerid,17,15);
	}
	else if(Profissao[playerid] == EXERCITO) {
		SetPlayerColor(playerid, COLOR_EXERCITO);
		GivePlayerWeapon(playerid,34,50);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,300);
		GivePlayerWeapon(playerid,31,200);
	}
	else if(Profissao[playerid] == MECANICO) {
		SetPlayerColor(playerid, COLOR_MECANICO);
	}
	else if(Profissao[playerid] == VENDEDOR_ARMAS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR_ARMAS);
		GivePlayerWeapon(playerid,24,200);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COLOR_INSTRUTOR);
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COLOR_MOTORISTA_ONIBUS);
		GivePlayerWeapon(playerid,5,1);
	}
	else if(Profissao[playerid] == MEDICO) {
		SetPlayerColor(playerid, COLOR_MEDICO);
	}
	else if(Profissao[playerid] == JORNALISTA) {
		SetPlayerColor(playerid, COLOR_JORNALISTA);
	}
	else if(Profissao[playerid] == BANCARIO) {
		SetPlayerColor(playerid, COLOR_BANCARIO);
	}
	else{
	    SetPlayerColor(playerid, COLOR_DESEMPREGADO);
	}
    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid,		 0);
	if(PLAYERLIST_authed[playerid] == 0){
		SetPlayerPos(playerid, 1403.9967, -808.4649, 92.07614);
		SetPlayerFacingAngle(playerid, 90.0000);
		TogglePlayerControllable(playerid, 0);
        return 1;
	    }
	else{
	    TogglePlayerControllable(playerid, 1);
        return 1;
	    }
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new string[256];
    new morte = random(4);
	if(morte == 0){
	format(string,sizeof(string),"%s foi encontrado caido, quase morto e foi levado para o hospital.",PlayerName(playerid));
	SendClientMessageToAll(COLOR_RED,string);
	}
	else if(morte == 1){
	format(string,sizeof(string),"%s achava que era feito de ferro, e acabou parando no hospital.",PlayerName(playerid));
	SendClientMessageToAll(COLOR_SWAT,string);
	}
	else if(morte == 2){
	format(string,sizeof(string),"Depois do susto, %s foi encaminhado para o hospital.",PlayerName(playerid));
	SendClientMessageToAll(COLOR_JUIZ,string);
	}
	else if(morte == 3){
	format(string,sizeof(string),"Os medicos estão de olho, %s é mais uma vitima.",PlayerName(playerid));
	SendClientMessageToAll(COLOR_YELLOW,string);
	}
    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 1608.3337,1820.6853,10.8280, 4.4951, 0, 0, 0, 0, 0, 0);
    udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 250);
	SendClientMessage(playerid, COLOR_RED, "Foi retirado $250 da sua conta, para pagar o hospital...");
	if(Profissao[killerid] == COP_CIVIL || Profissao[killerid] == COP_RODOVIARIO || Profissao[killerid] == SWAT || Profissao[killerid] == EXERCITO && Profissao[playerid] == ASSASSINO){
	if(assalto[playerid] == 1){
	GivePlayerMoney(killerid,1000);
	SendClientMessage(killerid, COLOR_WHITE, "Você matou o assaltante e recebeu $1000.");
	new msg[256];
	format(msg,sizeof(msg),"O Policial %s capturou o assaltante.",PlayerName(killerid));
	SendClientMessageToAll(COLOR_GREEN,msg);
	assalto[playerid] = 0;
	Presos[playerid] = 1;
	udb_setPrisao(PlayerName(playerid), 1);
	LogarPlayer(playerid);
	}
 }
	if(Procurados[playerid] == 1){
	Procurados[playerid] = 0;
	Presos[playerid] = 1;
 	udb_setPrisao(PlayerName(playerid), 1);
	format(string, sizeof(string), "%s te capturou e você foi preso!", PlayerName(killerid));
	SendClientMessage(playerid, COLOR_SEGURANÇA, string);
 	SendClientMessage(killerid, COLOR_GREEN, "Prisão concluida");
 	new string2[256];
	format(string2,sizeof(string2),"Noticia: %s Estava procurado, e o policial %s captorou ele.",PlayerName(playerid),PlayerName(killerid));
 	SendClientMessageToAll(COLOR_GREEN,string2);
 	LogarPlayer(playerid);
 }
	else{
		SendDeathMessage(killerid,playerid,reason);
		if (GetPlayerMoney(playerid) > 0)  {
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
		}
 	  }
    }

public OnVehicleSpawn(vehicleid)
{
	printf("OnVehicleSpawn(%d)", vehicleid);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	printf("OnVehicleDeath(%d, %d)", vehicleid, killerid);
	return 1;
}

public OnPlayerText(playerid, text[])
{
        if(Mudo[playerid]==1){
		SendClientMessage(playerid, COLOR_GREEN, "Você não pode falar porquê foi silenciado");
        return 0;
        }
        if (Calling[playerid] > -1 && Answered[playerid] == 1)
       	{
        new string[256];
	    new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(Calling[playerid], COLOR_YELLOW, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		return 0;
	    }

        return 1;
        }

public OnPlayerCommandText(playerid, cmdtext[])
{
	new playermoney;
    new cmd[256];
	new giveplayerid, moneys, idx;
    new giveplayer[MAX_PLAYER_NAME];
    new sendername[MAX_PLAYER_NAME];

	cmd = strtok(cmdtext, idx);

	if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	if (udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Você já esta registrado");
			return 1;
			}

    	if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Você já está registrado!");
			return 1;
			}

    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "/registrar [senha]");
			return 1;
			}

    	else{
    	    PLAYERLIST_authed[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*senha*/,0 /*creditos*/, 0 /*grana*/,0 /*skin*/, 5000 /*gbanco*/, 15/*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 1 /*prof*/, ""/*clantag*/,  2097.3484/*X*/, 2222.1196/*Y*/, 10.8203/*Z*/, 176.0210/*ang*/, 100.0/*hp*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			SetPlayerColor(playerid, COLOR_DESEMPREGADO);
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
            PlayerPlaySound(playerid,1186,0.0,0.0,0.0);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_GREEN, "Registrado e logado.");
			SendClientMessage(playerid, COLOR_GREEN, "Você têm $5000 no banco para começar a viver.");
			SendClientMessage(playerid, COLOR_GREEN, "Para as Profissões digite /profs");
			SendClientMessage(playerid, COLOR_GREEN, "Para ganhar dinheiro você precisará de um emprego!");
			udb_setProf(PlayerName(playerid), 1);
  			LogarPlayer(playerid);
			Calling[playerid] = -1;
			Answered[playerid] = 0;
			Callerid[playerid] = 0;
	    	return 1;
			}
 		}
 		
	if(strcmp(cmd, "/entrar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Você não está registrado.");
			return 1;
			}

	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Você já está logado.");
			return 1;
			}
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "/entrar [senha]");
			return 1;
			}
		
	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
            PlayerPlaySound(playerid,1186,0.0,0.0,0.0);
			ClearAnimations(playerid);
			PLAYERLIST_authed[playerid] = 1;
			LogarPlayer(playerid);
			Calling[playerid] = -1;
			Answered[playerid] = 0;
			Callerid[playerid] = 0;
			return 1;
			}
		else {
			SendClientMessage(playerid, COLOR_RED, "Senha Incorreta.");
			return 1;
	    	}
		}
	if(strcmp(cmd, "/setcasa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new tmp[256];
        	new string[256];
        	new File:temp;
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcasa [nick]");
				return 1;
				}
       		if (udb_Exists(tmp)) {
		        new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(tmp, X, Y, Z);
			    udb_setAng(tmp, 0);
			    SendClientMessage(playerid, COLOR_GREEN, "Casa salva");
    	    	GetPlayerPos(playerid, X, Y, Z);
    	    	AddStaticPickup(1272, 1, X, Y, Z);
    	    	format(string, sizeof(string), "%d %d %f %f %f //%s\r\n", 1272, 1, X, Y, Z, tmp);
    	    	temp = fopen("[TMR]_icones.lgp", io_append);
            	fwrite(temp, string);
            	fclose(temp);
            	SendClientMessage(playerid, COLOR_GREEN, "Icone salvo");
   		 	    return 1;
    		    }
			return 1;
			}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
			return 1;
			}
		}
		

//-------------telefone
//-------------telefone
    if(strcmp(cmd, "/chamar", true) == 0)
		{
		new tmp[256];
		new plid;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_GREEN, "/chamar [id]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Voce deve estar logado para ligar");
			return 1;
		}
		if (GetPlayerMoney(playerid) < CallCost)
		{
			SendClientMessage(playerid, COLOR_GREEN, "Voce não tem dinheiro para uma ligação");
			return 1;
		}
		if (giveplayerid == playerid)
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Você não pode ligar para voce mesmo");
		    return 1;
		}
		if (!(IsPlayerConnected(giveplayerid)))
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Jogador não conectado/logado");
		    return 1;
		}
		if (Calling[playerid] > -1)
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "Voce esta no telefone com %s!", giveplayer);
			SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
		}
		if (Calling[giveplayerid] > -1)
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "%s ja esta no telefone, tente mais tarde.", giveplayer);
			SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
		}
		else
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s esta te ligando digite /atender para atender o celular ou /desligar para desligar o celular", sendername);
		SendClientMessage(giveplayerid, COLOR_GREEN, string);
		format(string, sizeof(string), "Aguardando chamada de %s", giveplayer);
		SendClientMessage(playerid, COLOR_GREEN, string);
		Calling[playerid] = giveplayerid;
		Calling[giveplayerid] = playerid;
		Callerid[playerid] = 1;
		return 1;
	}
    if(strcmp(cmd, "/atender", true) == 0)
		{
		new plid;
		new string[256];
		new tmp[256];

		plid = strval(tmp);
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Voce deve estar logado para atender uma chamada de telefone");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Ninguem está te ligando");
		    return 1;
		}
		if (Answered[playerid] == 1)
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Voce ja esta no telefone");
		    return 1;
		}
		else
		GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Atendeu o telefone", sendername);
		SendClientMessage(Calling[playerid], COLOR_GREEN, string);
		format(string, sizeof(string), "Você aceitou a chamada de %s", giveplayer);
		SendClientMessage(playerid, COLOR_GREEN, string);
		Answered[playerid] = 1;
		Answered[Calling[playerid]] = 1;
		Callerid[Calling[playerid]] = 1;
        return 1;
	}

    if(strcmp(cmd, "/desligar", true) == 0)
		{
		new plid;
		new string[256];
		new tmp[256];

		plid = strval(tmp);
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Voce deve estar logado para desligar uma chamada");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOR_GREEN, "Voce não esta no celular");
		    return 1;
		}
		else
		{
		GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Desligou o telefone", sendername);
		SendClientMessage(Calling[playerid], COLOR_GREEN, string);
		format(string, sizeof(string), "Voce desligou a chamada com %s", giveplayer);
		SendClientMessage(playerid, COLOR_GREEN, string);
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

	if(strcmp(cmd, "/sms", true) == 0)
        {
        new tmp[256];
   		new plid;
   		new msg[256];
   		new o[256];
        strmid(o,cmdtext, 6, strlen(cmdtext));
   		tmp = strtok(cmdtext,idx);
   		plid = strval(tmp);
   		if(!strlen(tmp)){
   		SendClientMessage(playerid, COLOR_WHITE, "/sms [id] [mensagem]");
   		return 1;
   		}
   		if(GetPlayerMoney(playerid) < 5){
   		SendClientMessage(playerid, COLOR_GREEN, "Voce nao possue dinheiro para mandar uma SMS");
   		return 1;
   		}
   		if(IsPlayerConnected(plid)){
   		GivePlayerMoney(playerid,0 - 5);
   		SendClientMessage(playerid, COLOR_WHITE, "SMS enviada");
   		format(msg,sizeof(msg),"SMS enviada por %s.",PlayerName(playerid));
        SendClientMessage(plid,0x888888AA,msg);
        SendClientMessage(plid,0xFFFFFAAA,o);
        return 1;
        }
	}

//-------------fim
//-------------fim
    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Magnum RPG");
        SendClientMessage(playerid, COLOR_YELLOW, "/comandos : Para ver os Comandos do jogo");
        SendClientMessage(playerid, COLOR_YELLOW, "/registrar [senha] : Para se Registrar no jogo");
        SendClientMessage(playerid, COLOR_YELLOW, "/entrar [senha] : Para se Logar no jogo");
        SendClientMessage(playerid, COLOR_YELLOW, "/aprender : Mostra uma breve explicação sobre o RPG.");
        SendClientMessage(playerid, COLOR_YELLOW, "/creditos : Vê os creditos do Magnum RPG");
		return 1;
		}

	if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "Magnum RPG");
	    SendClientMessage(playerid, COLOR_JUIZ, "Agradecimentos");
	    SendClientMessage(playerid, COLOR_YELLOW, "Aos originalizadores do RPG brasileiro: SolidNuts, TheHitman, Luigui (Clan |.:GT:.|)");
	    SendClientMessage(playerid, COLOR_SWAT, "Algumas ideias do modes originalizadas pela: Equipe Brazucas'Server.");
	    SendClientMessage(playerid, COLOR_WHITE, "Alguns ajudantes da evolução do mode: Rafael, ph.");
	    SendClientMessage(playerid, COLOR_INSTRUTOR, "Scripters atuais do mode: MtS, TuTi.");
		return 1;
		}
		
	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_JUIZ, "Magnum RPG");
	    SendClientMessage(playerid, COLOR_WHITE, "Esse Gamemode simula a vida real do qual você poderá");
	    SendClientMessage(playerid, COLOR_WHITE, "comprar sua própria casa, seu carro, ter sua profissão,");
	    SendClientMessage(playerid, COLOR_WHITE, "Também há habilitações para dirigir, existem 3 tipos");
		SendClientMessage(playerid, COLOR_WHITE, "Aerea (Aviões e Helicopteros");
		SendClientMessage(playerid, COLOR_WHITE, "Terrestre (Carros e Motos)");
		SendClientMessage(playerid, COLOR_WHITE, "Naútica (Barcos)");
		SendClientMessage(playerid, COLOR_WHITE, "Divirta-se");
		SendClientMessage(playerid, COLOR_JUIZ, "Digite /ajuda ou /comandos para visualizar os comandos.");
		return 1;
		}
		
	if(strcmp(cmd, "/infoterrestre", true) == 0) {
	    SendClientMessage(playerid, COLOR_INSTRUTOR, "Habilitação Terrestre (Carros e Motos)");
	    SendClientMessage(playerid, COLOR_WHITE, "Você primeiro deverá ser liberado com um instrutor para utilizar os veículos da habilitação.");
	    SendClientMessage(playerid, COLOR_WHITE, "A habilitação terrestre está divida em 3 testes entre 3 tipos de veículos:");
	    SendClientMessage(playerid, COLOR_WHITE, "1 - Estacionar o carro entre os outros dois do mesmo modelo (Veículo: Sabre).");
	    SendClientMessage(playerid, COLOR_WHITE, "2 - Dirigir da auto-escola até diversos locais com moto (Veículo: FCR-900).");
	    SendClientMessage(playerid, COLOR_WHITE, "3 - Dirigir da auto-escola até diversos locais com carro (Veículo: Manana).");
		SendClientMessage(playerid, COLOR_INSTRUTOR, "Seguindo esses passos bem feitos você pode receber a habilitação com o custo de $800...");
		return 1;
		}
		
	if(strcmp(cmd, "/infonautica", true) == 0) {
	    SendClientMessage(playerid, COLOR_INSTRUTOR, "Habilitação Naútica (Barcos)");
	    SendClientMessage(playerid, COLOR_WHITE, "Você primeiro deverá ser liberado com um instrutor para utilizar os veículos da habilitação.");
	    SendClientMessage(playerid, COLOR_WHITE, "A habilitação nautica está divida em apenas 1 teste com 1 veículo:");
	    SendClientMessage(playerid, COLOR_WHITE, "1 - Dirigir do local dos barcos da auto-escola até diversos locais com barco (Veículo: Jetmax).");
		SendClientMessage(playerid, COLOR_INSTRUTOR, "Seguindo esses passos bem feitos você pode receber a habilitação com o custo de $1500...");
		return 1;
		}
		
	if(strcmp(cmd, "/infoaerea", true) == 0) {
	    SendClientMessage(playerid, COLOR_INSTRUTOR, "Habilitação Aerea (Helicopteros e Aviões)");
	    SendClientMessage(playerid, COLOR_WHITE, "Você primeiro deverá ser liberado com um instrutor para utilizar os veículos da habilitação.");
	    SendClientMessage(playerid, COLOR_WHITE, "A habilitação aerea está divida em apenas 1 teste com 1 veículo:");
	    SendClientMessage(playerid, COLOR_WHITE, "1 - Dirigir da auto-escola até diversos locais com helicoptero (Veículo: Maverick).");
		SendClientMessage(playerid, COLOR_INSTRUTOR, "Seguindo esses passos bem feitos você pode receber a habilitação com o custo de $1200...");
		return 1;
		}

	if(strcmp(cmd, "/infohabs", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, "Informações de Habilitações");
        SendClientMessage(playerid, COLOR_SWAT, "Para ver as informações da habilitação Aerea digite /infoaerea");
        SendClientMessage(playerid, COLOR_SWAT, "Para ver as informações da habilitação Terrestre digite /infoterrestre");
        SendClientMessage(playerid, COLOR_SWAT, "Para ver as informações da habilitação Nautica digite /infonautica");
        SendClientMessage(playerid, COLOR_JUIZ, "Siga os passos e pagando o custo da habilitação poderá recebe-la com um instrutor.");
    	return 1;
	}
		
	if(strcmp(cmd, "/celular", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, "Celular");
        SendClientMessage(playerid, COLOR_SWAT, "Você tem seu celular e deve usar ele para ter conversas particulares...");
        SendClientMessage(playerid, COLOR_SWAT, "é preciso ter dinheiro para os creditos se você for ligar a não ser que tem liguem você não paga nada!");
        SendClientMessage(playerid, COLOR_COP_CIVIL, "Comandos do Celular");
        SendClientMessage(playerid, COLOR_WHITE, "/sms [id] [mensagem] : Envia uma mensagem de celular para a pessoa...custo $5");
        SendClientMessage(playerid, COLOR_WHITE, "/chamar [id] : Faz uma ligação para uma pessoa.");
        SendClientMessage(playerid, COLOR_WHITE, "/atender : atende o celular.");
        SendClientMessage(playerid, COLOR_WHITE, "/desligar : desliga o celular da conversa.");
        SendClientMessage(playerid, COLOR_JUIZ, "Aproveite essa novidade!");
    	return 1;
	}
	
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_VENDEDOR, "Comandos do Magnum RPG...Parte 1");
		SendClientMessage(playerid, COLOR_GREEN, "/profs(1)(2)(limitadas)(limitadas2) : mostra as profissoes do RPG.");
		SendClientMessage(playerid, COLOR_GREEN, "/transferir : Envia dinheiro a algum jogador.");
		SendClientMessage(playerid, COLOR_GREEN, "/trancar : Tranca seu carro.");
		SendClientMessage(playerid, COLOR_GREEN, "/destrancar : Destranca seu carro.");
		SendClientMessage(playerid, COLOR_GREEN, "/ci [id] : Mostra seus documentos.");
		SendClientMessage(playerid, COLOR_GREEN, "/guia : Vê o Guia telefonico");
		SendClientMessage(playerid, COLOR_VENDEDOR, "Para mais comandos digite /comandos2");
		return 1;
		}

	if(strcmp(cmd, "/comandos2", true) == 0) {
		SendClientMessage(playerid, COLOR_VENDEDOR, "Comandos do Magnum RPG...Parte 2");
		SendClientMessage(playerid, COLOR_GREEN, "/celular : Para ver as opções de celular");
		SendClientMessage(playerid, COLOR_GREEN, "/relogio : Mostra o horário em SF.");
		SendClientMessage(playerid, COLOR_GREEN, "/gas [litros] : Compra gasolina (você deve estar no posto para usar este comando).");
		SendClientMessage(playerid, COLOR_GREEN, "/pagar [id] [quantidade] : Paga por algum serviço de corretor ou vendedor de carros.");
		SendClientMessage(playerid, COLOR_GREEN, "/presos : Vê a lista de pessoas presas.");
		SendClientMessage(playerid, COLOR_GREEN, "/lchat : Limpa seu chat");
		SendClientMessage(playerid, COLOR_VENDEDOR, "Para mais comandos digite /comandos3");
		return 1;
		}
	if(strcmp(cmd, "/comandos3", true) == 0) {
		SendClientMessage(playerid, COLOR_VENDEDOR, "Comandos do Magnum RPG...Parte 3");
		SendClientMessage(playerid, COLOR_GREEN, "/procurados : Vê a lista de procurados pela policia.");
		SendClientMessage(playerid, COLOR_GREEN, "/say [texto] : Manda mensagem para pessoas proximas a você.");
		SendClientMessage(playerid, COLOR_GREEN, "/profissao : Comandos de sua profissão.");
		SendClientMessage(playerid, COLOR_GREEN, "/agenciajob : Para se mudar para a agencia de sua profissão.");
		SendClientMessage(playerid, COLOR_GREEN, "/banco : Comandos do Banco.");
		SendClientMessage(playerid, COLOR_GREEN, "/admins : Para ver os administrados online no servidor.");
		SendClientMessage(playerid, COLOR_VENDEDOR, "Esses são os comandos do Magnum RPG");
		return 1;
		}
	if(strcmp(cmd, "/guia", true) == 0) {
		SendClientMessage(playerid, COLOR_VENDEDOR, "Guia Telefonico do Magnum RPG");
		SendClientMessage(playerid, COLOR_GREEN, "/SOS [lugar] : Solicita equipe Médica");
		SendClientMessage(playerid, COLOR_GREEN, "/taxi [lugar] : Solicita o serviço de Taxista.");
		SendClientMessage(playerid, COLOR_GREEN, "/trafico [lugar] : Solicita o serviço de Vendedor de Armas.");
		SendClientMessage(playerid, COLOR_GREEN, "/mecanico [lugar] : Solicita o serviço de Mecânico.");
		SendClientMessage(playerid, COLOR_GREEN, "/190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(playerid, COLOR_VENDEDOR, "Para solicitar algum serviço use o guia telefonico");
		return 1;
		}
 	if(strcmp(cmd, "/armas", true) == 0) {
		SendClientMessage(playerid, COLOR_SWAT, "Armas do Magnum RPG...Parte 1");
	    SendClientMessage(playerid, COLOR_JUIZ, "1	Brass Knuckles");
	    SendClientMessage(playerid, COLOR_JUIZ, "2	Golf Club");
	    SendClientMessage(playerid, COLOR_JUIZ, "3	Night Stick");
	    SendClientMessage(playerid, COLOR_JUIZ, "4	Knife");
	    SendClientMessage(playerid, COLOR_JUIZ, "5	Baseball Bat");
	    SendClientMessage(playerid, COLOR_JUIZ, "6	Shovel");
		SendClientMessage(playerid, COLOR_SWAT, "Para mais armas digite /armas2");
        return 1;
    }
	if(strcmp(cmd, "/armas2", true) == 0) {
		SendClientMessage(playerid, COLOR_SWAT, "Armas do Magnum RPG...Parte 2");
	    SendClientMessage(playerid, COLOR_JUIZ, "7	Pool cue");
	    SendClientMessage(playerid, COLOR_JUIZ, "8	Katana");
	    SendClientMessage(playerid, COLOR_JUIZ, "9  Chainsaw");
	    SendClientMessage(playerid, COLOR_JUIZ, "10 Purple Dildo");
	    SendClientMessage(playerid, COLOR_JUIZ, "11	White Dildo");
	    SendClientMessage(playerid, COLOR_JUIZ, "12	Long White Dildo");
		SendClientMessage(playerid, COLOR_SWAT, "Para mais armas digite /armas3");
        return 1;
     }
	if(strcmp(cmd, "/armas3", true) == 0) {
		SendClientMessage(playerid, COLOR_SWAT, "Armas do Magnum RPG...Parte 3");
	    SendClientMessage(playerid, COLOR_JUIZ, "13	White Dildo 2");
	    SendClientMessage(playerid, COLOR_JUIZ, "15	Cane");
	    SendClientMessage(playerid, COLOR_JUIZ, "16	Grenades");
	    SendClientMessage(playerid, COLOR_JUIZ, "17	Tear Gas");
	    SendClientMessage(playerid, COLOR_JUIZ, "18	Molotovs");
	    SendClientMessage(playerid, COLOR_JUIZ, "22	Pistol");
		SendClientMessage(playerid, COLOR_SWAT, "Para mais armas digite /armas4");
        return 1;
        }
	if(strcmp(cmd, "/armas4", true) == 0) {
		SendClientMessage(playerid, COLOR_SWAT, "Armas do Magnum RPG...Parte 4");
	    SendClientMessage(playerid, COLOR_JUIZ, "23	Silenced Pistol");
	    SendClientMessage(playerid, COLOR_JUIZ, "24	Desert Eagle");
	    SendClientMessage(playerid, COLOR_JUIZ, "25	Shotgun");
	    SendClientMessage(playerid, COLOR_JUIZ, "26	Sawn Off Shotgun");
	    SendClientMessage(playerid, COLOR_JUIZ, "27	Combat Shotgun");
	    SendClientMessage(playerid, COLOR_JUIZ, "28	Micro Uzi (Mac 10)");
		SendClientMessage(playerid, COLOR_SWAT, "Para mais armas digite /armas5");
        return 1;
        }
	if(strcmp(cmd, "/armas5", true) == 0) {
		SendClientMessage(playerid, COLOR_SWAT, "Armas do Magnum RPG...Parte 5");
	    SendClientMessage(playerid, COLOR_JUIZ, "29	MP5");
	    SendClientMessage(playerid, COLOR_JUIZ, "30	AK47");
	    SendClientMessage(playerid, COLOR_JUIZ, "31	M4");
	    SendClientMessage(playerid, COLOR_JUIZ, "32	Tec9");
	    SendClientMessage(playerid, COLOR_JUIZ, "33	Rifle");
	    SendClientMessage(playerid, COLOR_JUIZ, "34	Sniper Rifle");
		SendClientMessage(playerid, COLOR_SWAT, "Essas armas são compradas com um Vendedor de Armas");
        return 1;
		}

	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_WHITE, "Comandos do Banco");
        SendClientMessage(playerid, COLOR_GREEN, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_GREEN, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_GREEN, "/saldo : checa seu o saldo bancário..");
        SendClientMessage(playerid, COLOR_SWAT, "Você precisa estar em um banco (Lojas 24/7).");
        SendClientMessage(playerid, COLOR_SWAT, "Caso contrario fale com um bancário.");
		return 1;
		}
		
	if(strcmp(cmd, "/loteria", true) == 0) {
        SendClientMessage(playerid, COLOR_WHITE, "Loteria");
        SendClientMessage(playerid, COLOR_GREEN, "Para apostar na loteria você deve estar em um banco e escolher o número...");
        SendClientMessage(playerid, COLOR_GREEN, "Use /apostar [numero] em um banco para fazer sua aposta.");
        SendClientMessage(playerid, COLOR_GREEN, "Os bilhetes custarão $100...");
        SendClientMessage(playerid, COLOR_SWAT, "Cada vez que a loteria não tiver ganhadores, o premio vai se acumulando.");
		return 1;
		}

	if(strcmp(cmd, "/lchat", true) == 0) {
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
        SendClientMessage(playerid, COLOR_WHITE, " ");
		return 1;
		}

	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, "Profissão do Magnum RPG...Parte 1");
        SendClientMessage(playerid, COLOR_DESEMPREGADO, "1 - Desempregado (Salário: $200)");
        SendClientMessage(playerid, COLOR_TAXISTA, "2 - Taxista (Salário: $900)");
        SendClientMessage(playerid, COLOR_BARMAN, "3 - Barman (Salário: $850 + as bebidas que vende)");
        SendClientMessage(playerid, COLOR_SEGURANÇA, "4 - Segurança (Salário: $850 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_MOTORISTA, "5 - Motorista Particular (Salário: $850 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_MECANICO, "6 - Mecânico (Salário: $800 + Consertos e Pinturas)");
        SendClientMessage(playerid, COLOR_WHITE, "Para mais profissões digite /profs2");
		return 1;
		}

	if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, "Profissão do Magnum RPG...Parte 2");
        SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "7 - Vendedor de Armas (Salário: $500 + Armas Vendidas)");
        SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "8 - Motorista de ônibus (Salário: $900)");
        SendClientMessage(playerid, COLOR_JORNALISTA, "9 - Jornalista (Salário: $1200)");
        SendClientMessage(playerid, COLOR_MEDICO, "10 - Médico (Salário: $1200 + Curativos)");
        SendClientMessage(playerid, COLOR_BANCARIO, "11 - Bancario (Salário: $2000 + Serviços de Banco)");
        SendClientMessage(playerid, COLOR_WHITE, "As Profissões que estão na lista devem ser contradas por um admin e não são limitadas!");
        SendClientMessage(playerid, COLOR_JUIZ, "Para ver as profissões limitadas digite /profslimitadas.");
		return 1;
		}
	if(strcmp(cmd, "/profslimitadas", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Profissões Limitadas do Magnum RPG...Parte 1");
        SendClientMessage(playerid, COLOR_VENDEDOR, "12 - Vendedor de Veículos (Salário: $1000 + Comissão)");
        SendClientMessage(playerid, COLOR_CORRETOR, "13 - Corretor de Imóveis (Salário: $1000 + Comissão)");
        SendClientMessage(playerid, COLOR_ASSASSINO, "14 - Assassino (Salário: Assassinatos e Mandatos)");
        SendClientMessage(playerid, COLOR_TRAFICANTE, "15 - Traficante (Salário: $1300 + Drogas)");
        SendClientMessage(playerid, COLOR_JUIZ, "16 - Juiz (Salário: $2300 - Mensalão)");
        SendClientMessage(playerid, COLOR_WHITE, "Para mais profissões limitadas digite /profslimitadas2");
		return 1;
		}
	if(strcmp(cmd, "/profslimitadas2", true) == 0) {
        SendClientMessage(playerid, COLOR_SEGURANÇA, "Profissões Limitadas do Magnum RPG...Parte 2");
        SendClientMessage(playerid, COLOR_COP_CIVIL, "17 - Policial Civil (Salário: $1200)");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "18 - Policial Rodoviário (Salário: $1500)");
        SendClientMessage(playerid, COLOR_SWAT, "19 - Swat (Salário: $2500)");
        SendClientMessage(playerid, COLOR_EXERCITO, "20 - EXERCITO (Salário: $3200)");
		SendClientMessage(playerid, COLOR_INSTRUTOR, "21 - Instrutor de Direção (Salário: $1000)");
        SendClientMessage(playerid, COLOR_GREEN, "As Profissões que estão na lista são limitadas e só serão entregues");
        SendClientMessage(playerid, COLOR_GREEN, "Para jogadores ativos ou se a profissão for necessária e não tiver muitos");
		return 1;
		}

	if (strcmp(cmd, "/taxi", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/taxi [local]");
			return 1;
			}
		else{
		    SendClientMessage(playerid, COLOR_YELLOW, "Os taxistas foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TAXISTA){
					format(string, sizeof(string), "%s pede um taxi. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_YELLOW, string);
					return 1;
		     	    }
			    }
			}
		}
	
	if (strcmp(cmd, "/190", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/190 [denuncia]");
    		return 1;
	    	}
		else{
		    SendClientMessage(playerid, COLOR_SWAT, "Os policiais foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == SWAT || Profissao[i] == EXERCITO){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_SWAT, string);
					return 1;
                    }
                 }
             }
         }
	if (strcmp(cmd, "/trafico", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 8, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/trafico [local]");
    		return 1;
	    	}
		else{
		    SendClientMessage(playerid, COLOR_SWAT, "Os Vendedores de Armas receberam sua informação.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == VENDEDOR_ARMAS){
					format(string, sizeof(string), "%s Solicita trafico de armas no local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_SWAT, string);
					return 1;
                    }
                 }
             }
         }
	if (strcmp(cmd, "/mecanico", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 9, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/mecanico [local]");
    		return 1;
	    	}
		else{
		    SendClientMessage(playerid, COLOR_SWAT, "Os Mecânicos foram informados.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == MECANICO){
					format(string, sizeof(string), "%s Solicita algum Mecânico no local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_SWAT, string);
					return 1;
                    }
                 }
             }
         }
	if (strcmp(cmd, "/sos", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/SOS [local]");
    		return 1;
	    	}
		else{
		    SendClientMessage(playerid, COLOR_SWAT, "A Equipe medica foi informada");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == MEDICO){
					format(string, sizeof(string), "%s Solicita equipe medica no local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_SWAT, string);
					return 1;
                    }
                 }
             }
         }

    if (strcmp(cmdtext, "/trancar", true)==0)
	{
	new State;
	new Float:X;
	new Float:Y;
	new Float:Z;
    if(IsPlayerInAnyVehicle(playerid))
		{
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COLOR_RED,"Você só pode trancar as portas se estiver dirigindo.");
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
			SendClientMessage(playerid, COLOR_GREEN, "Veículo trancado!");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1056,X,Y,Z);
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "Você não está em nenhum veículo!");
		}
	return 1;
	}

	if (strcmp(cmdtext, "/destrancar", true)==0)
	{
	new State;
	new Float:X;
	new Float:Y;
	new Float:Z;
	if(IsPlayerInAnyVehicle(playerid))
		{
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COLOR_RED,"Você só pode destrancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
			}
			SendClientMessage(playerid, COLOR_GREEN, "Veículo destrancado.");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1057,X,Y,Z);
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "Você não está em nenhum veículo!");
		}
	return 1;
	}

	if(strcmp(cmd, "/transferir", true) == 0) {
		new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id] [quantia]");
    		return 1;
	    	}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id] [quantia]");
	    	return 1;
		    }
 		moneys = strval(tmp);
		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys) {
				GivePlayerMoney(playerid, (0 - moneys));
				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "Você enviou %s(id: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "Você recebeu $%d de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				return 1;
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Valor inválido.");
			}
		}
		else {
			format(string, sizeof(string), "%d não está registrado/logado", giveplayerid);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		    }
        	}

	if(strcmp(cmd, "/apostar", true)==0){
		new tmp[256];
		new val;
		tmp = strtok(cmdtext,idx);
		val = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/apostar [numero]");
			return 1;
		}
		if(Bilhete[playerid] == true){
		    SendClientMessage(playerid, COLOR_RED, "Você já tem um bilhete de apostas!");
		    return 1;
		}
		if(AreaBanco[playerid] == 1){
		if(aposta[playerid] == 0){
		if(val <= 20){
		if(GetPlayerMoney(playerid) >= 100){
		numeroapostado[playerid] = val;
		aposta[playerid] = 1;
		Bilhete[playerid] = true;
		GivePlayerMoney(playerid,0-100);
		moneyloteria = moneyloteria + 100;
		new string[256];
		format(string,sizeof(string),"Você apostou no número %d! Boa sorte.",val);
		SendClientMessage(playerid, COLOR_JUIZ,string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não possue $100 para apostar");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Número Invalido! Números de 1 a 20");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você ja apostou! Espere o sorteio para apostar novamente");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você tem que estar no banco para apostar");
			return 1;
			}
	}

    if(strcmp(cmd, "/depositar", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_WHITE, "Uso: /depositar [quantidade]");
    		return 1;
	    	}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COLOR_RED, "Você não tem todo esse dinheiro. Ou está tentando enviar $0.");
		    return 1;
		    }
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, 0 - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
			format(string, sizeof(string), "Você depositou $%d no banco. seu saldo atual é de $%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_YELLOW, string);
		    return 1;
		    }
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
		    return 1;
		    }
	    }

    if(strcmp(cmd, "/sacar", true) == 0) {
        new string[256];
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_WHITE, "Uso: /sacar [quantidade]");
    		return 1;
	    	}
	    quantidade = strval(tmp);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COLOR_RED, "Você não pode querer depositar com esse comando");
	    	return 1;
		    }
		if(quantidade > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COLOR_RED, "Você não pode tem essa quantidade no banco");
	    	return 1;
		    }
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Você retirou $%d do banco. seu saldo atual é de $%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_YELLOW, string);
		    return 1;
		    }
        else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
    		return 1;
	    	}
	    }


    if(strcmp(cmd, "/saldo", true) == 0) {
		new string[256];
        if(AreaBanco[playerid] == 1){
			format(string, sizeof(string), "Você tem %d em sua conta.", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_GREEN, string);
    		return 1;
	    	}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
		    return 1;
		    }
	    }
	
	if(strcmp(cmd, "/extrato", true) == 0) {
	if(IsPlayerAdmin(playerid) || Profissao[playerid] == BANCARIO){
	new string[256];
	new plid;
	new tmp[256];
	tmp = strtok(cmdtext, idx);
	plid = strval(tmp);
	if(!strlen(tmp)){
	SendClientMessage(playerid, COLOR_WHITE, "Uso: /extrato [id]");
	return 1;
	}
	else {
	format(string, sizeof(string), "Mensagem de Celular: Você tem %d em sua conta, serviço feito pelo Bancário %s.", udb_getBankMoney(PlayerName(plid)), PlayerName(playerid));
	SendClientMessage(plid, COLOR_GREEN, string);
 	return 1;
  	}
	}
	}
    if(strcmp(cmd, "/deposito", true) == 0) {
	if(IsPlayerAdmin(playerid) || Profissao[playerid] == BANCARIO){
 	new string[256];
	new tmp[256];
	new plid;
	new quantidade;
	tmp = strtok(cmdtext, idx);
	plid = strval(tmp);
	if(!strlen(tmp)){
	SendClientMessage(playerid, COLOR_WHITE, "Uso: /deposito [id] [quantidade]");
	return 1;
	}
	tmp = strtok(cmdtext, idx);
 	quantidade = strval(tmp);
  	if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
   	SendClientMessage(playerid, COLOR_RED, "O Jogador não tem todo esse dinheiro ou está tentando enviar $0.");
    return 1;
    }
    GivePlayerMoney(plid, 0 - quantidade);
    udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) + quantidade);
	format(string, sizeof(string), "Você depositou $%d no banco. seu saldo atual é de $%d, Serviço feito pelo bancário %s.", quantidade, udb_getBankMoney(PlayerName(plid)),PlayerName(playerid));
	SendClientMessage(plid, COLOR_YELLOW, string);
	SendClientMessage(playerid, COLOR_YELLOW, "Serviço feito.");
	return 1;
 	}
 	}
    if(strcmp(cmd, "/saque", true) == 0) {
	if(IsPlayerAdmin(playerid) || Profissao[playerid] == BANCARIO){
 	new string[256];
	new tmp[256];
	new plid;
	new quantidade;
	tmp = strtok(cmdtext, idx);
 	plid = strval(tmp);
	if(!strlen(tmp)){
	SendClientMessage(playerid, COLOR_WHITE, "Uso: /saque [id] [quantidade]");
	return 1;
	}
	tmp = strtok(cmdtext,idx);
 	quantidade = strval(tmp);
 	if(quantidade < 0){
 	SendClientMessage(playerid, COLOR_RED, "O Comando para fazer o jogador depositar uma quantia é outro");
	return 1;
 	}
	if(quantidade > udb_getBankMoney(PlayerName(plid))){
 	SendClientMessage(playerid, COLOR_RED, "O Jogador não tem essa quantia no banco.");
	return 1;
 	}
 	GivePlayerMoney(plid, quantidade);
  	udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quantidade);
	format(string, sizeof(string), "Você retirou $%d do banco. seu saldo atual é de $%d, Serviço feito pelo bancário %s.", quantidade, udb_getBankMoney(PlayerName(plid)),PlayerName(playerid));
	SendClientMessage(plid, COLOR_YELLOW, string);
	SendClientMessage(playerid, COLOR_YELLOW, "Serviço feito.");
	return 1;
 	}
	}
    if(strcmp(cmd, "/gas", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "Uso: /gas [litros]");
	    	return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || GetPlayerMoney(playerid) < quantidade){
	        SendClientMessage(playerid, COLOR_RED, "Você não tem dinheiro para pagar. Ou você está querendo tirar combustível do tanque.");
	    	return 1;
		}
		if(AreaPosto[playerid] == 1){
			if(quantidade + Petrol[playerid] < 100){
			    Petrol[playerid] = Petrol[playerid] + quantidade;
			    format(string, sizeof(string), "Você comprou %d litros de combustível.", quantidade);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantidade);
				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
				return 1;
	 		}
			if(quantidade + Petrol[playerid] >= 100){
			    new quantia;
			    quantia = 100 - Petrol[playerid];
			    Petrol[playerid] = 100;
				format(string, sizeof(string), "Seu tanque está cheio, foram colocados %d litros.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantia);
				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
			    return 1;
			}
	    	return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não está no posto.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/vendergas", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == MECANICO){
			new tmp[256];
			new msg[256];
			new petroleo;
			new plid, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/vendergas [id] [quantidade]");
		    	return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/vendergas [id] [quantidade]");
		    	return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COLOR_RED, "Quantidade inválida. Os valores devem ser de 1 à 100.");
		    	return 1;
			}
			if(IsPlayerConnected(plid)){
			if((Petrol[plid] + comb) < 100){
			    petroleo = Petrol[plid] + comb;
			    udb_setGasoline(PlayerName(plid), petroleo);
				Petrol[plid] = petroleo;
				format(msg,sizeof(msg),"Um Mecanico colocou %d litros de combustível em seu tanque, totalizando %d litros",comb,petroleo);
				SendClientMessage(plid,COLOR_GREEN,msg);
				SendClientMessage(plid,COLOR_GREEN,"Vê se não gasta à toa!");
				SendClientMessage(playerid,COLOR_GREEN,"Combustível fornecido.");
				printf("O Mecanico %s (ID %d) colocou %d litros de combustível no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
		    	return 1;
			}
			else if((Petrol[plid] + comb) >= 100){
			    udb_setGasoline(PlayerName(plid), 100);
				petroleo = 100 - Petrol[plid];
				Petrol[plid] = 100;
				format(msg,sizeof(msg),"Um admin completou seu tanque, colocando %d litros",petroleo);
				SendClientMessage(plid,COLOR_GREEN,msg);
				SendClientMessage(plid,COLOR_GREEN,"Vê se não gasta à toa!");
				SendClientMessage(playerid,COLOR_GREEN,"Combustivel fornecido.");
				printf("O admin %s (ID %d) completou o combustível de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
		    	return 1;
			}
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		    	return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão!");
		    printf("O jogador %s (ID %d) tentou modificar o combustível de alguém, mas não possui permissão",PlayerName(playerid),playerid);
	    	return 1;
		}
	}
	if(strcmp(cmd, "/pagar", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pagar [id] [quantia]");
    		return 1;
	    	}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pagar [id] [quantia]");
	    	return 1;
	    	}
 		pagamento = strval(tmp);
        if(Profissao[plid] == VENDEDOR_DE_VEICULOS || Profissao[plid] == CORRETOR){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COLOR_RED, "Você não tem esse dinheiro! ou não está querendo pagar de forma justa.");
		    	return 1;
			    }
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/10);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COLOR_GREEN, string);
			    return 1;
			    }
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
		    	return 1;
			    }
		    }
		if(Profissao[plid] != VENDEDOR_DE_VEICULOS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COLOR_RED, "Você está tentando pagaer a alguem que não é corretor e nem vendedor!");
    		return 1;
	    	}
	    return 1;
	    }
	    
	if(strcmp(cmd, "/chutarbus", true) == 0) {
		if(Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
		SendClientMessage(playerid, COLOR_GREEN, "Você não tem permissão.");
		return 1;
		}
	    new tmp[256];
	    new plid;
    	new veiculo;
		veiculo = GetPlayerVehicleID(plid);
		tmp = strtok(cmdtext, idx);
        plid = strval(tmp);
		if(!strlen(tmp)) {
		SendClientMessage(playerid, COLOR_RED, "/chutarbus [id]");
		return 1;
 		}
 		if(Profissao[plid] == MOTORISTA_DE_ONIBUS || IsPlayerAdmin(plid)){
		SendClientMessage(playerid, COLOR_GREEN, "Esse jogador também tem poder sobre o veículo.");
		return 1;
		}
  		if(!IsPlayerConnected(plid)){
    	SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
    	}
		if(veiculo != vehbus1 && veiculo != vehbus2 && veiculo != vehbus3 && veiculo != vehbus4){
		SendClientMessage(playerid, COLOR_GREEN, "O Jogador não está em um Onibus");
		return 1;
		}
		else {
		RemovePlayerFromVehicle(plid);
		SendClientMessage(playerid, COLOR_GREEN, "Jogador removido do veiculo");
		SendClientMessage(plid, COLOR_GREEN, "Você foi removido do onibus");
		return 1;
	    }
		}
		
	if(strcmp(cmd, "/chutartaxi", true) == 0) {
		if(Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
		SendClientMessage(playerid, COLOR_GREEN, "Você não tem permissão.");
		return 1;
		}
	    new tmp[256];
	    new plid;
     	new veiculo;
		veiculo = GetPlayerVehicleID(plid);
		tmp = strtok(cmdtext, idx);
        plid = strval(tmp);
		if(!strlen(tmp)) {
		SendClientMessage(playerid, COLOR_RED, "/chutartaxi [id]");
		return 1;
 		}
 		if(Profissao[plid] == TAXISTA || IsPlayerAdmin(plid)){
		SendClientMessage(playerid, COLOR_GREEN, "Esse jogador também tem poder sobre o veículo.");
		return 1;
		}
  		if(!IsPlayerConnected(plid)){
    	SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
		return 1;
		}
		if(veiculo != vehtaxi1 && veiculo != vehtaxi2 && veiculo != vehtaxi3 && veiculo != vehtaxi4 && veiculo != vehtaxi5 && veiculo != vehtaxi6 && veiculo != vehtaxi7 && veiculo != vehtaxi8){
		SendClientMessage(playerid, COLOR_GREEN, "O Jogador não está em um taxi.");
		return 1;
		}
		else {
		RemovePlayerFromVehicle(plid);
		SendClientMessage(playerid, COLOR_GREEN, "Jogador removido do veiculo");
		SendClientMessage(plid, COLOR_GREEN, "Você foi removido do Taxi");
		return 1;
	    }
		}
		
	if(strcmp(cmd, "/liberar", true) == 0) {
		if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
		SendClientMessage(playerid, COLOR_GREEN, "Você não tem permissão.");
		return 1;
		}
	    new tmp[256];
	    new plid;
     	new veiculo;
		veiculo = GetPlayerVehicleID(plid);
		tmp = strtok(cmdtext, idx);
        plid = strval(tmp);
		if(!strlen(tmp)) {
		SendClientMessage(playerid, COLOR_RED, "/liberar [id]");
		return 1;
 		}
  		if(!IsPlayerConnected(plid)){
    	SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
		return 1;
		}
		if(veiculo != vehauto1 && veiculo != vehauto2 && veiculo != vehauto3 && veiculo != vehauto4 && veiculo != vehauto5 && veiculo != vehauto6 &&
		veiculo != vehauto7 && veiculo != vehauto8 && veiculo != vehauto9 && veiculo != vehauto10){
		SendClientMessage(playerid, COLOR_GREEN, "O Jogador não está em um veiculo da auto escola.");
		return 1;
		}
		else {
  		TogglePlayerControllable(plid,1);
		SendClientMessage(playerid, COLOR_GREEN, "Jogador Liberado.");
		SendClientMessage(plid, COLOR_GREEN, "Você foi liberado à usar o veiculo da auto escola.");
		return 1;
	    }
		}

	if(strcmp(cmd, "/verificarpass", true) == 0) {
		if(Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
		SendClientMessage(playerid, COLOR_GREEN, "Você não tem permissão.");
		return 1;
		}
	    new tmp[256];
	    new plid;
		tmp = strtok(cmdtext, idx);
        plid = strval(tmp);
		if(!strlen(tmp)) {
		SendClientMessage(playerid, COLOR_RED, "/verificarpass [id]");
		return 1;
 		}
  		if(!IsPlayerConnected(plid)){
    	SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
    	}
    	else{
			if(Passagem[plid] == 1){
				SendClientMessage(playerid, COLOR_SWAT, "O Jogador possui passagem");
				return 1;
			}
			if(Passagem[plid] == 0){
				SendClientMessage(playerid, COLOR_SWAT, "O Jogador não possui passagem");
	    		return 1;
	    	}
	    }
	}
		
	if(strcmp(cmd, "/entregarpass", true) == 0) {
		if(Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
		SendClientMessage(playerid, COLOR_GREEN, "Você não tem permissão.");
		return 1;
		}
	    new tmp[256];
	    new plid;
		tmp = strtok(cmdtext, idx);
        plid = strval(tmp);
		if(!strlen(tmp)) {
		SendClientMessage(playerid, COLOR_RED, "/entregarpass [id]");
		return 1;
 		}
  		if(!IsPlayerConnected(plid)){
    	SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
    	return 1;
    	}
    	if(Passagem[plid] == 1){
    	SendClientMessage(playerid,COLOR_GREEN, "O Jogador ja possui passagem");
    	return 1;
    	}
		else {
		Passagem[plid] = 1;
		SendClientMessage(playerid, COLOR_RED, "Passagem entregue!");
		SendClientMessage(plid, COLOR_RED, "Você recebeu uma passagem!");
		return 1;
	    }
		}
		
	if(strcmp(cmd, "/retirarpass", true) == 0) {
		if(Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
		SendClientMessage(playerid, COLOR_GREEN, "Você não tem permissão.");
		return 1;
		}
	    new tmp[256];
	    new plid;
		tmp = strtok(cmdtext, idx);
        plid = strval(tmp);
		if(!strlen(tmp)) {
		SendClientMessage(playerid, COLOR_RED, "/entregarpass [id]");
		return 1;
 		}
  		if(!IsPlayerConnected(plid)){
    	SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
    	}
    	if(Passagem[plid] == 0){
    	SendClientMessage(playerid,COLOR_GREEN, "O Jogador não possui passagem");
    	return 1;
    	}
		else {
		Passagem[plid] = 0;
		SendClientMessage(playerid, COLOR_RED, "Passagem retirada!");
		SendClientMessage(plid, COLOR_RED, "Sua passagem foi retirada!");
		return 1;
	    }
		}
		
	if(strcmp(cmd, "/ci", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[3];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/ci [id]");
    		return 1;
	    	}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
		    hab[2] = udb_getHabaerea(PlayerName(plid));
		    hab[0] = udb_gethabterre(PlayerName(plid));
		    hab[1] = udb_getHabnauti(PlayerName(plid));
			format(string, sizeof(string), "Identidade de %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_JORNALISTA, string);
			format(string, sizeof(string), "Skin :: %d", udb_getSkin(PlayerName(playerid)));
			SendClientMessage(plid, COLOR_JORNALISTA, string);
			if(hab[0] == 0){
			    SendClientMessage(plid, COLOR_GREEN, "Habilitação de Carros e Motos: NÂO");
			}
			if(hab[0] == 1){
			    SendClientMessage(plid, COLOR_SWAT, "Habilitação de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(plid, COLOR_GREEN, "Habilitação Náutica: NÂO");
			}
			if(hab[1] == 1){
			    SendClientMessage(plid, COLOR_SWAT, "Habilitação Náutica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(plid, COLOR_GREEN, "Habilitação Aérea: NÂO");
			}
			if(hab[2] == 1){
			    SendClientMessage(plid, COLOR_SWAT, "Habilitação Aérea: SIM");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COLOR_JORNALISTA, string);
    		return 1;
	    	}
		else{
		    SendClientMessage(playerid, COLOR_RED, "esse jogador nao existe");
		    }
	    return 1;
	    }


	if(strcmp(cmd, "/tiraraerea", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção aerea Retirada.");
		    	return 1;
		    	}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 0);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção aerea Retirada.");
			    SendClientMessage(plid, COLOR_GREEN, "Você perdeu a habilitação de direção aerea.");
    			return 1;
	    		}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
		    	return 1;
	    		}
		    }
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
	    	return 1;
	    	}
	    return 1;
	    }
	if(strcmp(cmd, "/tirarterrestre", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção terrestre retirada.");
			    return 1;
			    }
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 0);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção terrestre retirada.");
			    SendClientMessage(plid, COLOR_GREEN, "Você perdeu a habilitação de direção de carros e motos.");
			    return 1;
			    }
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
		    	return 1;
			    }
	    	}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
    		return 1;
	    	}
	    return 1;
	    }
	if(strcmp(cmd, "/tirarnautica", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção náutica retirada.");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 0);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção náutica retirada.");
			    SendClientMessage(plid, COLOR_GREEN, "Você perdeu a habilitação de direção náutica.");
    			return 1;
	    		}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
		    	return 1;
			    }
		    }
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
	    	return 1;
	    	}
    	return 1;
	    }
	if(strcmp(cmd, "/aerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
	        new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "/aerea [id]");
		    	return 1;
		    	}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção aerea concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção aerea.");
    			return 1;
	    		}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
		    	return 1;
	    		}
		    }
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
	    	return 1;
	    	}
	    return 1;
	    }
	if(strcmp(cmd, "/terrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "/terrestre [id]");
			    return 1;
			    }
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção terrestre concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção de carros e motos.");
			    return 1;
			    }
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
		    	return 1;
			    }
	    	}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
    		return 1;
	    	}
	    return 1;
	    }

	if(strcmp(cmd, "/nautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_GREEN, "/nautica [id]");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção náutica concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção náutica.");
    			return 1;
	    		}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
		    	return 1;
			    }
		    }
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
	    	return 1;
	    	}
    	return 1;
	    }

	if(strcmp(cmd, "/respawnar", true) == 0) {
     if(IsPlayerAdmin(playerid)){
                new tmp[256];
                new veiculo;
				new plid;
				tmp = strtok(cmdtext,idx);
                plid = strval(tmp);
                if(!strlen(tmp)){
                SendClientMessage(playerid,COLOR_MECANICO, "/respawnar [id]");
                return 1;
                }
				veiculo = GetPlayerVehicleID(plid);
                if(IsPlayerInVehicle(plid,veiculo)){
                SetVehicleHealth(veiculo,1000);
				SetVehicleToRespawn(veiculo);
                SendClientMessage(plid,COLOR_MECANICO,"Seu veiculo foi respawnado por um admin!");
				return 1;
                }
	      }
    }
    
	if(strcmp(cmd, "/exportar", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != VENDEDOR_DE_VEICULOS){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
			    if(AreaEntregaCarros[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar na area de entrega de carros na Autos'Bahn");
				return 1;
				}
				if(veiculo != vehbahne1 && veiculo != vehbahne2 && veiculo != vehbahne3 && veiculo != vehbahne4){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve exportar um carro da outra conscecionaria Autos'Bahn para a que você trabalha.");
				return 1;
				}
				else {
				GivePlayerMoney(playerid, 20);
                SetVehicleHealth(veiculo,1000);
				SetVehicleToRespawn(veiculo);
                SendClientMessage(playerid, COLOR_SWAT, "Veiculo Exportado, Você ganhou $20 por isso...");
				return 1;
                }
	      }
	      
	if(strcmp(cmd, "/lavartaxi", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != TAXISTA){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
			    if(AreaLavagem[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar na area de lavagem");
				return 1;
				}
				if(veiculo != vehtaxi1 && veiculo != vehtaxi2 && veiculo != vehtaxi3 && veiculo != vehtaxi4 && veiculo != vehtaxi5 && veiculo != vehtaxi6 && veiculo != vehtaxi7 && veiculo != vehtaxi8){
				SendClientMessage(playerid, COLOR_GREEN, "Você não está em um taxi.");
				return 1;
				}
				if(LavagemTaxi == 1){
				SendClientMessage(playerid,COLOR_GREEN, "Este carro ja está lavado.");
				return 1;
				}
				if(GetPlayerMoney(playerid) < 50){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve ter o dinheiro da lavagem ($50)");
				return 1;
				}
				else {
                SetVehicleHealth(veiculo,1000);
				LavagemTaxi = 1;
				GivePlayerMoney(playerid, - 50);
                SendClientMessage(playerid, COLOR_SWAT, "Lavagem Concluida, agora entregue o Taxi na agencia.");
				return 1;
                }
	      }
	      
	if(strcmp(cmd, "/lavarlimo", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != MOTORISTA_PARTICULAR){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
			    if(AreaLavagem[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar na area de lavagem");
				return 1;
				}
				if(veiculo != vehmoto1 && veiculo != vehmoto2 && veiculo != vehmoto3){
				SendClientMessage(playerid, COLOR_GREEN, "Você não está em uma limosine de sua Agencia.");
				return 1;
				}
				if(LavagemLimo == 1){
				SendClientMessage(playerid,COLOR_GREEN, "Este carro ja está lavado.");
				return 1;
				}
				if(GetPlayerMoney(playerid) < 50){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve ter o dinheiro da lavagem ($50)");
				return 1;
				}
				else {
                SetVehicleHealth(veiculo,1000);
				LavagemLimo = 1;
				GivePlayerMoney(playerid, - 50);
                SendClientMessage(playerid, COLOR_SWAT, "Lavagem Concluida, agora entregue a limosina em sua agencia.");
				return 1;
                }
	      }

	if(strcmp(cmd, "/lavarcarbar", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != BARMAN){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
			    if(AreaLavagem[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar na area de lavagem");
				return 1;
				}
				if(veiculo != vehbar1 && veiculo != vehbar2){
				SendClientMessage(playerid, COLOR_GREEN, "Você não está em um veiculo do Bar.");
				return 1;
				}
				if(GetPlayerMoney(playerid) < 50){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve ter o dinheiro da lavagem ($50)");
				return 1;
				}
				if(LavagemCarBar == 1){
				SendClientMessage(playerid,COLOR_GREEN, "Este carro ja está lavado.");
				return 1;
				}
				else {
                SetVehicleHealth(veiculo,1000);
				LavagemCarBar = 1;
				GivePlayerMoney(playerid, - 50);
                SendClientMessage(playerid, COLOR_SWAT, "Lavagem Concluida, agora entregue o Carro no Bar.");
				return 1;
                }
	      }
	      
	if(strcmp(cmd, "/entregarlimo", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != MOTORISTA_PARTICULAR){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
			    if(AreaEntregaLimo[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar na Agencia de seu emprego");
				return 1;
				}
				if(veiculo != vehmoto1 && veiculo != vehmoto2 && veiculo != vehmoto3){
				SendClientMessage(playerid, COLOR_GREEN, "Você não está em uma limosina da sua agencia.");
				return 1;
				}
				if(LavagemLimo == 0){
				SendClientMessage(playerid,COLOR_GREEN, "Este carro não está lavado.");
				return 1;
				}
				else {
                SetVehicleToRespawn(veiculo);
				LavagemLimo = 0;
				GivePlayerMoney(playerid, 70);
                SendClientMessage(playerid, COLOR_SWAT, "Entrega Concluida, você recebeu $20 por isso + o dinheiro da lavagem que você gastou.");
				return 1;
                }
	      }
	      
	if(strcmp(cmd, "/entregarcarbar", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != BARMAN){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
			    if(AreaEntregaCarBar[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar no Bar");
				return 1;
				}
				if(veiculo != vehbar1 && veiculo != vehbar2){
				SendClientMessage(playerid, COLOR_GREEN, "Você não está em um veiculo do Bar.");
				return 1;
				}
				if(LavagemCarBar == 0){
				SendClientMessage(playerid,COLOR_GREEN, "Este carro não está lavado.");
				return 1;
				}
				else {
                SetVehicleToRespawn(veiculo);
				LavagemCarBar = 0;
				GivePlayerMoney(playerid, 70);
                SendClientMessage(playerid, COLOR_SWAT, "Entrega Concluida, você recebeu $20 por isso + o dinheiro da lavagem que você gastou.");
				return 1;
                }
	      }
	      
	if(strcmp(cmd, "/entregartaxi", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != TAXISTA){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
			    if(AreaEntregaLT[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar na Agencia dos taxistas");
				return 1;
				}
				if(veiculo != vehtaxi1 && veiculo != vehtaxi2 && veiculo != vehtaxi3 && veiculo != vehtaxi4 && veiculo != vehtaxi5 && veiculo != vehtaxi6 && veiculo != vehtaxi7 && veiculo != vehtaxi8){
				SendClientMessage(playerid, COLOR_GREEN, "Você não está em um taxi.");
				return 1;
				}
				if(LavagemTaxi == 0){
				SendClientMessage(playerid,COLOR_GREEN, "Este carro não está lavado.");
				return 1;
				}
				else {
                SetVehicleToRespawn(veiculo);
				LavagemTaxi = 0;
				GivePlayerMoney(playerid, 70);
                SendClientMessage(playerid, COLOR_SWAT, "Entrega Concluida, você recebeu $20 por isso + o dinheiro da lavagem que você gastou.");
				return 1;
                }
	      }
	      
	if(strcmp(cmd, "/sair", true) == 0) {
                new veiculo;
				veiculo = GetPlayerVehicleID(playerid);
				if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, COLOR_GREEN, "Você tem que estar em um veiculo");
				return 1;
				}
				if(veiculo != vehauto1 && veiculo != vehauto2 && veiculo != vehauto3 && veiculo != vehauto4 && veiculo != vehauto5 && veiculo != vehauto6 && veiculo != vehauto7 && veiculo != vehauto8 && veiculo != vehauto9 && veiculo != vehauto10){
				SendClientMessage(playerid, COLOR_GREEN, "O Jogador não está em um veiculo da auto escola.");
				return 1;
				}
				else {
		  		TogglePlayerControllable(playerid,1);
				RemovePlayerFromVehicle(playerid);
				SendClientMessage(playerid, COLOR_GREEN, "Você saiu do veiculo.");
				return 1;
	    		}
	      }

	if(strcmp(cmd, "/pegarvalores", true) == 0) {
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != SEGURANÇA){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
			    if(AreaBanco[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar no banco para tirar os valores de lá.");
				return 1;
				}
				if(Valores[playerid] == 1){
				SendClientMessage(playerid, COLOR_GREEN, "Você ja está com os Valores.");
				return 1;
				}
				else {
				SendClientMessage(playerid, COLOR_GREEN, "Você pegou os valores, agora entregue eles para a The Visage.");
				Valores[playerid] = 1;
				return 1;
                }
	      }
	      
	if(strcmp(cmd, "/entregarvalores", true) == 0) {
		     	if(!IsPlayerAdmin(playerid) && Profissao[playerid] != SEGURANÇA){
				SendClientMessage(playerid, COLOR_GREEN, "Você não pode fazer isso!");
				return 1;
				}
			    if(AreaEntregarValores[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você deve estar na The Visage.");
				return 1;
				}
				if(Valores[playerid] == 0){
				SendClientMessage(playerid, COLOR_GREEN, "Você não está com os Valores.");
				return 1;
				}
				else {
				SendClientMessage(playerid, COLOR_GREEN, "Valores entregues, você recebeu $20 pelo serviço.");
				Valores[playerid] = 0;
				GivePlayerMoney(playerid, 20);
				return 1;
                }
	      }

	if(strcmp(cmdtext, "/irmansao", true) == 0) {
	if(IsPlayerAdmin(playerid)) {
    if(IsPlayerInAnyVehicle(playerid)) {
    new VehicleID;
    VehicleID = GetPlayerVehicleID(playerid);
 	SetVehiclePos(VehicleID,2127.8027,2363.6450,10.8203);
 	SetPlayerInterior(playerid,0);
 	}
	else{
 	SetPlayerInterior(playerid,0);
    SetPlayerPos(playerid,2127.8027,2363.6450,10.8203);
	}
	return 1;
	}
	}

	if(strcmp(cmdtext, "/eventomonster", true) == 0) {
	if(IsPlayerAdmin(playerid)) {
    if(IsPlayerInAnyVehicle(playerid)) {
    new VehicleID;
    VehicleID = GetPlayerVehicleID(playerid);
 	SetVehiclePos(VehicleID,1570.9224,-1237.0981,277.8777);
 	SetPlayerInterior(playerid,0);
 	}
	else{
 	SetPlayerInterior(playerid,0);
    SetPlayerPos(playerid,1570.9224,-1237.0981,277.8777);
	}
	return 1;
	}
	}

	
	if (strcmp("/admincmds", cmd, true) == 0){
	  if(IsPlayerAdmin(playerid)){
    	  SendClientMessage(playerid, COLOR_JUIZ,"Comandos de Administrador...Parte 1");
    	  SendClientMessage(playerid, COLOR_WHITE,"/respawnar [id] : Respawna o veículo que o jogador está.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/anuncio [texto] : Anuncia como administrador.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/limparchat : Para limpar o chat.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/irmansao : Para ir a mansao dos admins.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/v [id do veiculo] : Para criar um veículo.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/setprof [id] [profissão] : Para setar profissão.");
    	  SendClientMessage(playerid, COLOR_JUIZ, "Para mais comandos de administrador digite /admincmds2.");
		  return 1;
		  }
	   }

	if (strcmp("/admincmds2", cmd, true) == 0){
	  if(IsPlayerAdmin(playerid)){
    	  SendClientMessage(playerid, COLOR_JUIZ,"Comandos de Administrador...Parte 2");
    	  SendClientMessage(playerid, COLOR_WHITE,"/matar [id] : Para matar alguem.");
   	      SendClientMessage(playerid, COLOR_WHITE,"/angel : Vai para Angel Pine.");
   	      SendClientMessage(playerid, COLOR_WHITE,"/eventomonster : Vai para o local de Evento de Monster Truck.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/silenciar [id] : Silencia Alguem.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/liberarfala [id] : Libera a fala de alguém.");
    	  SendClientMessage(playerid, COLOR_WHITE,"/contagem : Faz uma contagem ate 5.");
    	  SendClientMessage(playerid, COLOR_JUIZ, "Boa Administração");
		  return 1;
		  }
    }
    
    if (strcmp(cmd, "/contagem", true)==0){
	   if(!IsPlayerAdmin(playerid)){
	   SendClientMessage(playerid, COLOR_GREEN, "Você não tem permissão");
	   return 1;
	   }
	   else {
	   new tmp[256];
	   new string[256];
	   tmp = strtok(cmdtext,idx);
	   for(new i=0; i<MAX_PLAYERS; i++){
       format(string,sizeof(string), "Contagem feita por %s", PlayerName(playerid));
       SendClientMessage(i,COLOR_SWAT,string);
       GameTextForAll("~p~5",2000,6);
       SetTimer("contagem",1000,false);
       return 1;
       }
	   }
	   }
    
	if(strcmp(cmd, "/v", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
		new tmp[256];
		new carid;
		tmp = strtok(cmdtext,idx);
		carid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COLOR_RED, "Uso: /v [id do veiculo]");
		return 1;
		}
		if(carid < 400 || carid > 611){
		SendClientMessage(playerid, COLOR_SWAT, "Veiculo invalido (400 - 611)");
		return 1;
		}
		if(!IsPlayerInAnyVehicle(playerid)){
		new Float:X,Float:Y,Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		CreateVehicle(carid,X,Y+2,Z,0,1,1,10000000);
		SendClientMessage(playerid, COLOR_SWAT, "Veiculo criado");
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você tem que estar fora do veiculo para usar esse comando.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão");
			return 1;
			}
	}
    
    if (strcmp(cmd, "/anuncio", true)==0){
	  if(IsPlayerAdmin(playerid)){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 8, strlen(cmdtext));
		if(!strlen(tmp)) {
		SendClientMessage(playerid, COLOR_RED, "/anuncio [texto]");
 		return 1;
		}
		else{
  		format(string, sizeof(string), "Admin { %s }: %s", PlayerName(playerid),tmp);
    	SendClientMessageToAll(COLOR_SWAT, string);
    	return 1;
  		}
	   	}
	   	}
    
    if (strcmp("/assaltar", cmd, true) == 0){
	  if(Profissao[playerid] == ASSASSINO || IsPlayerAdmin(playerid)){
	  if(assalto[playerid] == 0){
	  if(AreaBanco[playerid] == 1){
	  if(PLAYERLIST_authed[playerid] == 1){
	  Procurados[playerid] = 1;
	  assalto[playerid] = 1;
	  GivePlayerMoney(playerid,1000);
	  SendClientMessage(playerid, COLOR_WHITE,"Você assaltou o banco agora fuja antes que os policiais cheguem.");
	  new msg[256];
	  format(msg,sizeof(msg),"NOTICIA: Um banco foi assaltado por %s é melhor os Policiais agirem rápido",PlayerName(playerid));
	  SendClientMessageToAll(COLOR_SWAT,msg);
	  Procurados[playerid] = 1;
	  SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid) + 3);
	  SetTimerEx("Assalto",1500000,false,"d",playerid);
	  return 1;
	  }
	  return 1;
      }

	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não esta no banco");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você ja assaltou espere mais tempo para assaltar novamente.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não tem permissão");
		  return 1;
		  }
	}

	if (strcmp("/limparchat", cmd, true) == 0){
	  if(IsPlayerAdmin(playerid)){
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
    	  SendClientMessageToAll(COLOR_WHITE," ");
		  return 1;
		 }
	  }
	if(!strcmp(cmd,"/silenciar",true)){
	  if(IsPlayerAdmin(playerid)){
    	  new tmp[256],plid;
		  new string[256];
    	  tmp = strtok(cmdtext,idx);
    	  if(!strlen(tmp)) return 1;
    	  plid = strval(tmp);
    	  if(!IsPlayerConnected(plid)) return 1;
    	  if(Mudo[plid] == 1) return 1;
    	  Mudo[plid]=1;
          format(string, sizeof(string), "%s foi silenciado", PlayerName(plid));
          SendClientMessageToAll(COLOR_COP_RODOVIARIO, string);
    	  return 1;
    	  } else {
    	  SendClientMessage(playerid,0xFFFFFFFF,"Você não tem permissão");
    	  return 1;
    	  }
    	  }
	if(!strcmp(cmd,"/liberarfala",true)){
	  if(IsPlayerAdmin(playerid)){
    	  new tmp[256],plid;
		  new string[256];
    	  tmp = strtok(cmdtext,idx);
    	  if(!strlen(tmp)) return 1;
    	  plid = strval(tmp);
    	  if(!IsPlayerConnected(plid)) return 1;
    	  if(Mudo[plid] == 0) return 1;
    	  Mudo[plid]=0;
          format(string, sizeof(string), "%s agora pode falar", PlayerName(plid));
          SendClientMessageToAll(COLOR_COP_RODOVIARIO, string);
    	  return 1;
    	  } else {
    	  SendClientMessage(playerid,0xFFFFFFFF,"Você não tem permissão");
    	  return 1;
    	  }
    }

	if(strcmp(cmd, "/matar", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COLOR_RED, "/matar [id]");
	    		return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado");
	    		return 1;
			} else {
			    	SendClientMessage(playerid, COLOR_GREEN, "Jogador Morto.");
			    	SendClientMessage(plid, COLOR_WHITE, "Você foi morto por um admin.");
			    	SetPlayerHealth(plid,0);
		    		return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Você não tem permissão!");
	    	return 1;
		}
	}

    if(strcmp(cmd, "/prender", true) == 0) {
	    		if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == JUIZ || Profissao[playerid] == SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	    		new tmp[256];
	    		new plid;
	    		new distancia;
	    		new string[256];
	    		new string2[256];
	    		distancia = GetDistanceBetweenPlayers(playerid, plid);
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/prender [id]");
				return 1;
				}
        		plid = strval(tmp);
			    if(distancia > 10){
       			SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
				return 1;
				}
				if(IsPlayerInAnyVehicle(plid)){
				SendClientMessage(playerid, COLOR_GREEN, "O Jogador está em um veiculo, remova-o do veiculo e depois o prenda");
				return 1;
				}
				if(!IsPlayerConnected(plid)){
    	        SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
				}
				if(Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] == EXERCITO && Profissao[playerid] != SWAT && Profissao[playerid] != JUIZ && IsPlayerAdmin(playerid)){
				SendClientMessage(playerid, COLOR_RED, "Você não é policial");
				return 1;
				}
				if(Presos[plid] == 1){
				SendClientMessage(playerid, COLOR_GREEN, "O Jogador ja está preso");
				return 1;
				}
				else {
				Presos[plid] = 1;
    			udb_setPrisao(PlayerName(plid), 1);
				format(string, sizeof(string), "Você foi preso por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_SEGURANÇA, string);
    			SendClientMessage(playerid, COLOR_GREEN, "Prisão concluida");
   				format(string2,sizeof(string2),"Noticia: %s foi preso por %s",PlayerName(plid),PlayerName(playerid));
			    SendClientMessageToAll(COLOR_GREEN,string2);
			    LogarPlayer(plid);
			    Procurados[plid] = 0;
				return 1;
				}
				}
				}
				
    if(strcmp(cmd, "/fianca", true) == 0) {
	 if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
		new plid;
		new tmp[256];
		new string[256];
 	    plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
        if(!strlen(tmp)) {
	    SendClientMessage(playerid, COLOR_RED, "fianca [id]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(Presos[plid] == 1){
  		Procurados[plid] = 0;
		Presos[plid] = 0;
		SetPlayerWantedLevel(plid, 0);
		udb_setPrisao(PlayerName(plid), 0);
		LogarPlayer(plid);
  		SetSpawnInfo(plid,0,udb_getSkin(PlayerName(plid)),2286.3877,2426.4946,10.8203,174.3664,0,0,0,0,0,0);
		format(string, sizeof(string), "Você pagou a fianca pelo juiz %s num total de $2000, você foi solto e o dinheiro foi retirado de sua conta!", PlayerName(playerid));
		SendClientMessage(plid, COLOR_JUIZ, string);
		format(string, sizeof(string), "Noticia: %s pagou uma fianca de $2000 para o Juiz %s e foi solto...", PlayerName(plid),PlayerName(playerid));
		SendClientMessageToAll(COLOR_WHITE, string);
		udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - 2000);
		udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + 2000);
		return 1;
		}
		else{
		SendClientMessage(playerid, COLOR_JUIZ, "O Jogador não está preso");
		return 1;
		}
	}
		else{
		SendClientMessage(playerid, COLOR_JUIZ, "Jogador não conectado/logado");
		return 1;
		}
	}
		else{
		SendClientMessage(playerid, COLOR_JUIZ, "Você não é Juiz");
		return 1;
		}
    }


 	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/soltar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(Presos[plid] == 0){
				    SendClientMessage(playerid,COLOR_RED,"O jogador não está preso!");
					return 1;
				} else {
					SetPlayerWantedLevel(plid, 0);
				    udb_setPrisao(PlayerName(playerid), 0);
				    Procurados[plid] = 0;
				    Presos[plid] = 0;
				    SetSpawnInfo(plid,0,udb_getSkin(PlayerName(plid)),2286.3877,2426.4946,10.8203,174.3664,0,0,0,0,0,0);
				    SpawnPlayer(plid);
				    SendClientMessage(plid,COLOR_GREEN,"Você foi solto e encaminhado para a delegacia de Angel Pine. Não cometa mais crimes ou tera que pagar!");
				    format(tmp,sizeof(tmp),"Você foi solto por %s",PlayerName(playerid));
				    SendClientMessage(plid,COLOR_GREEN,tmp);
				    SendClientMessage(playerid,COLOR_GREEN,"Solto");
    				format(string,sizeof(string),"Noticia: %s foi solto por %s",PlayerName(plid),PlayerName(playerid));
				    SendClientMessageToAll(COLOR_GREEN,string);
				}
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			}
			return 1;
		}
        if(Profissao[playerid] != EXERCITO || Profissao[playerid] != JUIZ || Profissao[playerid] != SWAT || IsPlayerAdmin(playerid)){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/meuskin", true) == 0) {
	 new tmp[256]; new skin; tmp = strtok(cmdtext,idx); skin = strval(tmp);
	 new msg[256];
	 if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==273 || skin==274 || skin==289 || skin>=300){
	 SendClientMessage(playerid,COLOR_RED, "Skin Inválido"); return 1; } udb_setSkin(PlayerName(playerid),skin);
	 SetPlayerSkin(playerid, skin);
     format(msg,sizeof(msg),"Você mudou sua Skin",skin);
	 SendClientMessage(playerid,COLOR_GREEN,msg);
	 return 1;
     }
	if(strcmp(cmd,"/anunciar",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
			new string[256];
			new msg[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COLOR_RED,"/anunciar [texto]");
		    	return 1;
			} else {
 			format(string, sizeof(string), "~w~%s", tmp);
			GameTextForAll(string, 5000, 0);
            format(msg,sizeof(msg),"Publicado por %s",PlayerName(playerid));
            SendClientMessageToAll(COLOR_JUIZ,msg);
	    	return 1;
			}
		}else{
		SendClientMessage(playerid,COLOR_JUIZ, "Você não tem permissão!");
 		}
	}
	if(strcmp(cmd,"/noticia",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COLOR_RED,"/noticia [texto]");
		    	return 1;
			} else {
			    format(msg,sizeof(msg),"Notícias de San Andreas, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_JUIZ,msg);
			    SendClientMessageToAll(COLOR_WHITE,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COLOR_RED,"Você não tem permissão!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/colete", true) == 0) {
    	if(Profissao[playerid] == VENDEDOR_ARMAS || IsPlayerAdmin(playerid)){
    	 new plid;
    	 new tmp[256];
    	 tmp = strtok(cmdtext,idx);
    	 plid = strval(tmp);
    	 if(!strlen(tmp)){
    	 SendClientMessage(playerid,COLOR_VENDEDOR_ARMAS, "/colete [id]");
    	 return 1;
    	 }
    	 if(IsPlayerConnected(plid)){
    	 SetPlayerArmour(plid,100);
    	 SendClientMessage(plid,COLOR_VENDEDOR_ARMAS, "Foi vendido à você um colete");
    	 SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "Colete Vendido");
    	 return 1;
    	 }
    	 else{
			 SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "Jogador nao conectado/logado");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "Voce nao tem permissao");
			 return 1;
			 }
		 }
	if(strcmp(cmd,"/arma",true)==0)
	   {
	    if(Profissao[playerid] == VENDEDOR_ARMAS || IsPlayerAdmin(playerid)){
	        new plid[256], weapon[256], ammo[256];
	        plid = strtok(cmdtext,idx);
	        weapon = strtok(cmdtext,idx);
	        ammo = strtok(cmdtext,idx);
	        if(!strlen(plid) || !strlen(weapon)){
                SendClientMessage(playerid,COLOR_RED,"/arma [id] [id da arma] [munição]");
	            SendClientMessage(playerid,COLOR_RED,"Se Você não colocar a munição especificada ficará como 1000");
	            return 1;
			}
			if(strval(weapon) < 1 || strval(weapon) > 46 || strval(weapon) == 19 || strval(weapon) == 20 || strval(weapon) == 21 || strval(weapon) == 35  || strval(weapon) == 36 || strval(weapon) == 37 || strval(weapon) == 38 || strval(weapon) == 44 || strval(weapon) == 45 || strval(weapon) == 46 || strval(weapon) == 43 || strval(weapon) == 42 || strval(weapon) == 39 || strval(weapon) == 14 || strval(weapon) > 40 ){
			    SendClientMessage(playerid,COLOR_RED,"Arma inválida, Verifique em /armas as armas disponíveis!");
			    return 1;
			} else {
				if(!IsPlayerConnected(strval(plid))){
				    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
				    return 1;
				} else {
				    SendClientMessage(playerid,COLOR_WHITE,"Arma Vendida.");
				    if(!strval(ammo)){
				        GivePlayerWeapon(strval(plid),strval(weapon),1000);
					} else {
					    GivePlayerWeapon(strval(plid),strval(weapon),strval(ammo));
					    return 1;
					}
				}
			}
		}
	}

	if(strcmp(cmd, "/curativo", true) == 0) {
    	if(Profissao[playerid] == MEDICO || IsPlayerAdmin(playerid)){
    	 new plid;
    	 new tmp[256];
    	 tmp = strtok(cmdtext,idx);
    	 plid = strval(tmp);
    	 if(!strlen(tmp)){
    	 SendClientMessage(playerid,COLOR_MEDICO, "/curativo [id]");
    	 return 1;
    	 }
    	 if(IsPlayerConnected(plid)){
    	 SetPlayerHealth(plid,100);
    	 SendClientMessage(plid,COLOR_MEDICO, "Um Paramédico te curou");
    	 SendClientMessage(playerid, COLOR_MEDICO, "Trabalho Feito");
    	 return 1;
    	 }
    	 else{
			 SendClientMessage(playerid, COLOR_MEDICO, "Jogador nao conectado/logado");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COLOR_MEDICO, "Voce nao tem permissao");
			 return 1;
			 }
		 }
	if(strcmp(cmd, "/tratamento", true) == 0) {
    	if(Profissao[playerid] == MEDICO || IsPlayerAdmin(playerid)){
    	 new plid;
    	 new tmp[256];
    	 tmp = strtok(cmdtext,idx);
    	 plid = strval(tmp);
    	 if(!strlen(tmp)){
    	 SendClientMessage(playerid,COLOR_MEDICO, "/tratamento [id]");
    	 return 1;
    	 }
    	 if(IsPlayerConnected(plid)){
    	 SetPlayerWeather(plid,0);
    	 SendClientMessage(plid,COLOR_MEDICO, "Um Paramédico te curou das ilusoes das drogas");
    	 SendClientMessage(playerid, COLOR_MEDICO, "Trabalho Feito");
    	 return 1;
    	 }
    	 else{
			 SendClientMessage(playerid, COLOR_MEDICO, "Jogador nao conectado/logado");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COLOR_MEDICO, "Voce nao tem permissao");
			 return 1;
			 }
		 }

	if (strcmp(cmd, "/pintar", true)==0){
	new tmp[256];
	new color1;
	new color2;
	tmp = strtok(cmdtext, idx);

	if(!strlen(tmp))
	{
	SendClientMessage(playerid, COLOR_YELLOW, "/pintar [cor 1] [cor 2]");
	return 1;
	}
	color1 = strval(tmp);
	tmp = strtok(cmdtext, idx);
	color2 = strval(tmp);
	
	if(!strlen(tmp))
	{
	SendClientMessage(playerid, COLOR_YELLOW, "/pintar [cor 1] [cor 2]");
	return 1;
	}

   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}

	if(!IsPlayerInAnyVehicle(playerid)) {
	SendClientMessage(playerid, COLOR_RED, "Você tem que estar em um veículo.");
	return 1;
	}
	else {
	ChangeVehicleColor(GetPlayerVehicleID(playerid), color1, color2);
	SendClientMessage(playerid,COLOR_RED, "Veiculo Pintado");
	return 1;
	}
	}
	
	if(strcmp(cmd, "/consertar", true) == 0) {
	        if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
                new tmp[256];
                new vehicle;
                new plid;
                new distance;
                tmp = strtok(cmdtext, idx);
                distance = GetDistanceBetweenPlayers(playerid,plid);
                plid = strval(tmp);
                if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_MECANICO, "/consertar [id]");
				return 1;
				}
				vehicle= GetPlayerVehicleID(plid);
				if(distance > 10){
				SendClientMessage(playerid, COLOR_MECANICO, "Você está muito longe do cliente.");
				return 1;
				}
				if(!IsPlayerConnected(plid)){
				SendClientMessage(playerid, COLOR_MECANICO, "Jogador não conectado");
				return 1;
				}
				if(!IsPlayerInAnyVehicle(plid)) {
				SendClientMessage(playerid, COLOR_MECANICO, "O Jogador não está em um veículo.");
				return 1;
				}
				new Float:X,Float:Y,Float:Z,Float: ang;
				new angulo;
				GetPlayerPos(playerid,X,Y,Z);
                angulo = GetVehicleZAngle(vehicle,ang);
				SetVehicleToRespawn(vehicle);
                SetVehicleHealth(vehicle,1000);
                SendClientMessage(playerid, COLOR_MECANICO, "Consertando.");
                SendClientMessage(plid, COLOR_MECANICO, "Aguarde veiculo sendo arrumado.");
                SetTimerEx("consertar",5000,false,"ddf",vehicle,plid,angulo);
                GameTextForPlayer(plid,"ARRUMANDO",5000,6);
                return 1;
                }
			    }

	if(strcmp(cmdtext, "/dollar", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1083);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/trance", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1084);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}

	if(strcmp(cmdtext, "/classic", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1077);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/atomic", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1085);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}

	if(strcmp(cmdtext, "/atomic", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1085);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}

	if(strcmp(cmdtext, "/import", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1082);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}

	if(strcmp(cmdtext, "/grove", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1081);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}

	if(strcmp(cmdtext, "/switch", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1080);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/cutter", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicicleta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1079);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/twist", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1078);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/wires", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1076);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/rimshine", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1075);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/mega", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1074);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/shadow", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1073);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/stereo", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1086);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}
	
	if(strcmp(cmdtext, "/hidraulica", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1087);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}

	if(strcmp(cmdtext, "/nitro", true)==0){
   	if(!IsPlayerInAnyVehicle(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não está em um veículo");
   	return 1;
   	}
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 462 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 521 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 463 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 522
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 461 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 448 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 468 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 586 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 481
	|| GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 493 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453){
	SendClientMessage(playerid, COLOR_SWAT, "Você não pode tunar uma moto, uma bicileta ou um barco!");
	return 1;
	}
	else {
	new veiculo;
	veiculo = GetPlayerVehicleID(playerid);
   	AddVehicleComponent(veiculo, 1010);
   	SendClientMessage(playerid,COLOR_SWAT, "Componente Adicionado.");
	return 1;
   	}
	}

	if (strcmp("/tunacoes", cmd, true) == 0){
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	SendClientMessage(playerid, COLOR_JUIZ,"Tunações");
 	SendClientMessage(playerid, COLOR_WHITE,"/nitro : Para colocar nitro no carro.");
 	SendClientMessage(playerid, COLOR_WHITE,"/hidraulica : Para colocar hidraulica no carro.");
 	SendClientMessage(playerid, COLOR_WHITE,"/stereo : Para aumentar o grave de um som de um carro.");
 	SendClientMessage(playerid, COLOR_WHITE,"/rodas : Para ver as rodas e coloca-las no carro.");
 	SendClientMessage(playerid, COLOR_JUIZ, "Bom Trabalho.");
 	return 1;
 	}

	if (strcmp("/rodas", cmd, true) == 0){
   	if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
   	SendClientMessage(playerid,COLOR_SWAT, "Você não é mecânico.");
   	return 1;
   	}
	SendClientMessage(playerid, COLOR_JUIZ,"Escolha a Roda e faça o comando.");
 	SendClientMessage(playerid, COLOR_WHITE,"/classic /trance /dollar /atomic");
 	SendClientMessage(playerid, COLOR_WHITE,"/import /grove /switch");
 	SendClientMessage(playerid, COLOR_WHITE,"/twist /wires /cutter");
 	SendClientMessage(playerid, COLOR_WHITE,"/rimshine /mega /shadow");
 	SendClientMessage(playerid, COLOR_JUIZ, "Bom Trabalho.");
 	return 1;
 	}

	if(strcmp(cmd, "/agenciajob", true) == 0) {
		        new prof = Profissao[playerid];
				if(prof == DESEMPREGADO) {
	            SendClientMessage(playerid, COLOR_GREEN, "Você é Desempregado...não tem agencia de seu trabalho.");
				return 1;
				}
				else if(prof == TAXISTA) {
                udb_setPosition(PlayerName(playerid),1876.0150,2235.8267,11.1250);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == BARMAN) {
				udb_setPosition(PlayerName(playerid),2439.2461,2063.3845,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == MOTORISTA_PARTICULAR) {
				udb_setPosition(PlayerName(playerid),2417.4121,1124.3658,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
  				return 1;
				}
				else if(prof == SEGURANÇA) {
				udb_setPosition(PlayerName(playerid),2417.4121,1124.3658,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == MEDICO) {
				udb_setPosition(PlayerName(playerid),1608.5071,1816.6609,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == VENDEDOR_ARMAS) {
				udb_setPosition(PlayerName(playerid),2156.2888,937.4743,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == ASSASSINO) {
				udb_setPosition(PlayerName(playerid),959.7878,2076.2827,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == MECANICO) {
				udb_setPosition(PlayerName(playerid),1963.7262,2156.6448,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == INSTRUTOR_DE_DIRECAO) {
				udb_setPosition(PlayerName(playerid),1059.5508,1240.6605,10.8275);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == CORRETOR) {
				udb_setPosition(PlayerName(playerid),1891.4231,2338.3740,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == EXERCITO) {
				udb_setPosition(PlayerName(playerid),153.3245,1849.5099,17.6406);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == COP_CIVIL) {
				udb_setPosition(PlayerName(playerid),2238.3550,2449.5222,11.0372);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == COP_RODOVIARIO) {
				udb_setPosition(PlayerName(playerid),2238.3550,2449.5222,11.0372);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == SWAT) {
				udb_setPosition(PlayerName(playerid),2238.3550,2449.5222,11.0372);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == VENDEDOR_DE_VEICULOS) {
				udb_setPosition(PlayerName(playerid),1948.3159,2067.8018,11.0610);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == JUIZ) {
				udb_setPosition(PlayerName(playerid),2024.6219,1915.4330,12.3252);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == JORNALISTA) {
				udb_setPosition(PlayerName(playerid),2434.6045,1653.7935,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == MOTORISTA_DE_ONIBUS) {
				udb_setPosition(PlayerName(playerid),2103.7366,1268.5435,10.8128);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == TRAFICANTE) {
				udb_setPosition(PlayerName(playerid),959.7878,2076.2827,10.8203);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				else if(prof == BANCARIO) {
				udb_setPosition(PlayerName(playerid),2193.6189,1992.6411,12.2969);
	            SendClientMessage(playerid, COLOR_GREEN, "Você se mudou para sua agencia de trabalho.");
				return 1;
				}
				}


	if(strcmp(cmd, "/setprof", true) == 0 && IsPlayerConnected(playerid)) {
                if(IsPlayerAdmin(playerid)) {
                new tmp[256];
                new plid;
                new prof;
                new string[256];
                tmp = strtok(cmdtext, idx);
                if(!strlen(tmp)) {
                SendClientMessage(playerid, COLOR_RED, "/setprof [id] [prof]");
                return 1;
                }
                plid = strval(tmp);
                tmp = strtok(cmdtext, idx);
                if(!strlen(tmp)) {
                SendClientMessage(playerid, COLOR_RED, "/setprof [id] [prof]");
                return 1;
                }
                prof = strval(tmp);
                if(IsPlayerConnected(plid)){
                if(prof > 0 && prof < 31){
				if(!IsPlayerInAnyVehicle(plid)){
  				udb_setProf(PlayerName(plid), prof);
				format(string, sizeof(string), "Você mudou a profissão de %s", PlayerName(plid));
				SendClientMessage(playerid, COLOR_GREEN, string);
				SendClientMessage(plid, COLOR_GREEN, "Você mudou de profissão, digite /profissao.");
				SendClientMessage(plid, COLOR_GREEN, "Digite /agenciajob para se mudar para a agencia de sua Profissão.");
				Profissao[plid] = prof;
				LogarPlayer(plid);
				if(prof == DESEMPREGADO) {
				GameTextForPlayer(plid, "~w~Desempregado",5000,0);
				return 1;
				}
				else if(prof == TAXISTA) {
				SetPlayerPos(plid,1876.0150,2235.8267,11.1250);
				GameTextForPlayer(plid, "~w~Taxista",5000,0);
				udb_setSkin(PlayerName(plid),185);
			    SetPlayerSkin(plid, 185);
			    SetPlayerColor(plid,TAXISTA);
				return 1;
				}
				else if(prof == BARMAN) {
				SetPlayerPos(plid,2439.2461,2063.3845,10.8203);
				GameTextForPlayer(plid, "~w~Barman",5000,0);
				udb_setSkin(PlayerName(plid),171);
			    SetPlayerSkin(plid, 171);
			    SetPlayerColor(plid,BARMAN);
				return 1;
				}
				else if(prof == MOTORISTA_PARTICULAR) {
				SetPlayerPos(plid,2417.4121,1124.3658,10.8203);
				GameTextForPlayer(plid, "~w~Motorista Particular",5000,0);
				udb_setSkin(PlayerName(plid),255);
			    SetPlayerSkin(plid, 255);
			    SetPlayerColor(plid,MOTORISTA_PARTICULAR);
  				return 1;
				}
				else if(prof == SEGURANÇA) {
				SetPlayerPos(plid,2417.4121,1124.3658,10.8203);
				GameTextForPlayer(plid, "~w~Seguranca",5000,0);
				udb_setSkin(PlayerName(plid),163);
			    SetPlayerSkin(plid, 163);
			    SetPlayerColor(plid,SEGURANÇA);
				return 1;
				}
				else if(prof == MEDICO) {
				SetPlayerPos(plid,1608.5071,1816.6609,10.8203);
				GameTextForPlayer(plid, "~w~Medico",5000,0);
				udb_setSkin(PlayerName(plid),275);
			    SetPlayerSkin(plid, 275);
			    SetPlayerColor(plid,MEDICO);
				return 1;
				}
				else if(prof == VENDEDOR_ARMAS) {
				SetPlayerPos(plid,2156.2888,937.4743,10.8203);
				GameTextForPlayer(plid, "~w~Vendedor de Armas",5000,0);
				udb_setSkin(PlayerName(plid),179);
			    SetPlayerSkin(plid, 179);
			    SetPlayerColor(plid,VENDEDOR_ARMAS);
				return 1;
				}
				else if(prof == ASSASSINO) {
				SetPlayerPos(plid,959.7878,2076.2827,10.8203);
				GameTextForPlayer(plid, "~w~Assassino",5000,0);
				udb_setSkin(PlayerName(plid),118);
			    SetPlayerSkin(plid, 118);
			    SetPlayerColor(plid,ASSASSINO);
				return 1;
				}
				else if(prof == MECANICO) {
				SetPlayerPos(plid,1963.7262,2156.6448,10.8203);
				GameTextForPlayer(plid, "~w~Mecanico",5000,0);
				udb_setSkin(PlayerName(plid),50);
			    SetPlayerSkin(plid, 50);
			    SetPlayerColor(plid,MECANICO);
				return 1;
				}
				else if(prof == INSTRUTOR_DE_DIRECAO) {
				SetPlayerPos(plid,1059.5508,1240.6605,10.8275);
				GameTextForPlayer(plid, "~w~Instrutor de Direcao",5000,0);
				udb_setSkin(PlayerName(plid),188);
			    SetPlayerSkin(plid, 188);
			    SetPlayerColor(plid,INSTRUTOR_DE_DIRECAO);
				return 1;
				}
				else if(prof == CORRETOR) {
				SetPlayerPos(plid,1891.4231,2338.3740,10.8203);
				GameTextForPlayer(plid, "~w~Corretor de Imoveis",5000,0);
				udb_setSkin(PlayerName(plid),186);
			    SetPlayerSkin(plid, 186);
			    SetPlayerColor(plid,CORRETOR);
				return 1;
				}
				else if(prof == EXERCITO) {
				SetPlayerPos(plid,153.3245,1849.5099,17.6406);
				GameTextForPlayer(plid, "~w~EXERCITO",5000,0);
				udb_setSkin(PlayerName(plid),287);
			    SetPlayerSkin(plid, 287);
			    SetPlayerColor(plid,EXERCITO);
				return 1;
				}
				else if(prof == COP_CIVIL) {
				SetPlayerPos(plid,2238.3550,2449.5222,11.0372);
				GameTextForPlayer(plid, "~w~Policia Civil",5000,0);
				udb_setSkin(PlayerName(plid),281);
			    SetPlayerSkin(plid, 281);
			    SetPlayerColor(plid,COP_CIVIL);
				return 1;
				}
				else if(prof == COP_RODOVIARIO) {
				SetPlayerPos(plid,2238.3550,2449.5222,11.0372);
				GameTextForPlayer(plid, "~w~Policia Rodoviaria",5000,0);
				udb_setSkin(PlayerName(plid),71);
			    SetPlayerSkin(plid, 71);
			    SetPlayerColor(plid,COP_RODOVIARIO);
				return 1;
				}
				else if(prof == SWAT) {
				SetPlayerPos(plid,2238.3550,2449.5222,11.0372);
				GameTextForPlayer(plid, "~w~SWAT",5000,0);
				udb_setSkin(PlayerName(plid),285);
			    SetPlayerSkin(plid, 285);
			    SetPlayerColor(plid,SWAT);
				return 1;
				}
				else if(prof == VENDEDOR_DE_VEICULOS) {
				SetPlayerPos(plid,1948.3159,2067.8018,11.0610);
				GameTextForPlayer(plid, "~w~Vendedor de Veiculos",5000,0);
				udb_setSkin(PlayerName(plid),20);
			    SetPlayerSkin(plid, 20);
			    SetPlayerColor(plid,VENDEDOR_DE_VEICULOS);
				return 1;
				}
				else if(prof == JUIZ) {
				SetPlayerPos(plid,2024.6219,1915.4330,12.3252);
				GameTextForPlayer(plid, "~w~Juiz",5000,0);
				udb_setSkin(PlayerName(plid),187);
			    SetPlayerSkin(plid, 187);
			    SetPlayerColor(plid,JUIZ);
				return 1;
				}
				else if(prof == JORNALISTA) {
				SetPlayerPos(plid,2434.6045,1653.7935,10.8203);
				GameTextForPlayer(plid, "~w~Jornalista",5000,0);
				udb_setSkin(PlayerName(plid),258);
			    SetPlayerSkin(plid, 258);
			    SetPlayerColor(plid,JORNALISTA);
				return 1;
				}
				else if(prof == MOTORISTA_DE_ONIBUS) {
				SetPlayerPos(plid,2103.7366,1268.5435,10.8128);
				GameTextForPlayer(plid, "~w~Motorista de Onibus",5000,0);
				udb_setSkin(PlayerName(plid),17);
			    SetPlayerSkin(plid, 17);
			    SetPlayerColor(plid,MOTORISTA_DE_ONIBUS);
				return 1;
				}
				else if(prof == TRAFICANTE) {
				SetPlayerPos(plid,959.7878,2076.2827,10.8203);
				GameTextForPlayer(plid, "~w~Traficante",5000,0);
				udb_setSkin(PlayerName(plid),29);
			    SetPlayerSkin(plid, 29);
			    SetPlayerColor(plid,TRAFICANTE);
				return 1;
				}
				else if(prof == BANCARIO) {
				SetPlayerPos(plid,2193.6189,1992.6411,12.2969);
				GameTextForPlayer(plid, "~w~Bancario",5000,0);
				udb_setSkin(PlayerName(plid),240);
			    SetPlayerSkin(plid, 240);
			    SetPlayerColor(plid,BANCARIO);
				return 1;
				}
				}
				else{
				SendClientMessage(playerid, COLOR_GREEN, "O Jogador está em um veículo, peça para que ele saia para não haver problemas!");
				return 1;
				}
				}
   				else{
			    SendClientMessage(playerid, COLOR_RED, "Essa não é uma profisssão válida!");
		    	return 1;
                }
       			}
   				else{
                SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
                return 1;
	      		}
	      		}
	      		else{
                SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso!");
                return 1;
                }
   	}

    if(strcmp(cmdtext, "/veiculos", true) == 0){
          SendClientMessage(playerid, COLOR_WHITE, "Veículos no Magnum RPG");
          SendClientMessage(playerid, COLOR_WHITE, "/races");
          SendClientMessage(playerid, COLOR_WHITE, "/motos");
          SendClientMessage(playerid, COLOR_WHITE, "/lowriders");
          SendClientMessage(playerid, COLOR_WHITE, "/aereos");
          SendClientMessage(playerid, COLOR_WHITE, "/vans");
          SendClientMessage(playerid, COLOR_WHITE, "/outros");
          SendClientMessage(playerid, COLOR_WHITE, "/sedans");
          SendClientMessage(playerid, COLOR_WHITE, "/compactos");
          return 1;
}


	if(strcmp(cmdtext, "/motos", true) == 0){
	        SendClientMessage(playerid, COLOR_INSTRUTOR, "Motos");
            SendClientMessage(playerid, COLOR_WHITE, "461 - PCJ-600 - $10000");
	        SendClientMessage(playerid, COLOR_WHITE, "521 - FCR-900 - $40000");
            SendClientMessage(playerid, COLOR_WHITE, "463 - Freeway - $15000");
            SendClientMessage(playerid, COLOR_WHITE, "468 - Sanchez - $10000");
            SendClientMessage(playerid, COLOR_WHITE, "462 - Faggio - $3000");
            SendClientMessage(playerid, COLOR_WHITE, "471 - Quad - $9000");
            SendClientMessage(playerid, COLOR_WHITE, "581 - BF-400 - $5000");
            SendClientMessage(playerid, COLOR_WHITE, "522 - NRG-500 - $60000");
            return 1;
}
	if(strcmp(cmdtext, "/compactos", true) == 0){
			SendClientMessage(playerid, COLOR_INSTRUTOR, "Compactos");
            SendClientMessage(playerid, COLOR_WHITE, "602 - Alpha $55000");
            SendClientMessage(playerid, COLOR_WHITE, "496 - Blista $Compact $30000");
            SendClientMessage(playerid, COLOR_WHITE, "410 - Manana $12000");
            SendClientMessage(playerid, COLOR_WHITE, "517 - Majestic $30000");
            SendClientMessage(playerid, COLOR_WHITE, "439 - Stallion $30000");
            SendClientMessage(playerid, COLOR_WHITE, "587 - Euros $70000");
			return 1;
}
	if(strcmp(cmdtext, "/sedans", true) == 0){
	        SendClientMessage(playerid, COLOR_INSTRUTOR, "Sedans");
            SendClientMessage(playerid, COLOR_WHITE, "445 - Admiral - $30000");
	        SendClientMessage(playerid, COLOR_WHITE, "405 - Sentinel - $50000");
            SendClientMessage(playerid, COLOR_WHITE, "409 - Stretch - $120000");
            SendClientMessage(playerid, COLOR_WHITE, "426 - Premier - $40000");
            return 1;
}
    if(strcmp(cmdtext, "/races", true) == 0){
          SendClientMessage(playerid, COLOR_INSTRUTOR, "Carros de Corrida de Rua");
		  SendClientMessage(playerid, COLOR_WHITE, "561 - Stratum - $90000");
		  SendClientMessage(playerid, COLOR_WHITE, "541 - Bullet - $150000");
          SendClientMessage(playerid, COLOR_WHITE, "415 - Cheetah - $130000");
          SendClientMessage(playerid, COLOR_WHITE, "411 - Infernus - $180000");
          SendClientMessage(playerid, COLOR_WHITE, "560 - Sultan - $105000");
          SendClientMessage(playerid, COLOR_WHITE, "562 - Elegy - $85000");
          SendClientMessage(playerid, COLOR_WHITE, "506 - Super GT - $140000");
          SendClientMessage(playerid, COLOR_WHITE, "558 - Uranus - $85000");
          SendClientMessage(playerid, COLOR_WHITE, "559 - Jester - $90000");
          return 1;
}
    if(strcmp(cmdtext, "/lowriders", true) == 0){
         SendClientMessage(playerid, COLOR_INSTRUTOR, "Lowriders");
         SendClientMessage(playerid, COLOR_WHITE, "536 - Blade - $35000");
		 SendClientMessage(playerid, COLOR_WHITE, "534 - Remington - $40000");
         SendClientMessage(playerid, COLOR_WHITE, "535 - Slamvan - $40000");
         SendClientMessage(playerid, COLOR_WHITE, "575 - Broadway - $50000");
         SendClientMessage(playerid, COLOR_WHITE, "466 - Glendale - $25000");
         SendClientMessage(playerid, COLOR_WHITE, "474 - Hermes - $30000");
         SendClientMessage(playerid, COLOR_WHITE, "567 - Savanna - $40000");
		 SendClientMessage(playerid, COLOR_WHITE, "604 - Glendale (Destruído) - $10000");
         return 1;
}
    if(strcmp(cmdtext, "/vans", true) == 0){
         SendClientMessage(playerid, COLOR_INSTRUTOR, "Vans");
         SendClientMessage(playerid, COLOR_WHITE, "498 - Boxville $35000");
         SendClientMessage(playerid, COLOR_WHITE, "483 - Camper $30000");
         SendClientMessage(playerid, COLOR_WHITE, "440 - Rumpo $25000");
         return 1;
}
    if(strcmp(cmdtext, "/outros", true) == 0){
         SendClientMessage(playerid, COLOR_INSTRUTOR, "Outros carros");
         SendClientMessage(playerid, COLOR_WHITE, "402 - Buffalo - $75000");
         SendClientMessage(playerid, COLOR_WHITE, "444 - Monster Truck - $80000");
         SendClientMessage(playerid, COLOR_WHITE, "495 - Sandking $50000");
         SendClientMessage(playerid, COLOR_WHITE, "489 - Rancher - $30000");
         SendClientMessage(playerid, COLOR_WHITE, "500 - Mesa - $18000");
         return 1;
}
    if(strcmp(cmdtext, "/aereos", true) == 0){
         SendClientMessage(playerid, COLOR_INSTRUTOR, "Aereos");
         SendClientMessage(playerid, COLOR_WHITE, "487 - Maverick $160000");
         SendClientMessage(playerid, COLOR_WHITE, "417 - Leviathan $80000");
         SendClientMessage(playerid, COLOR_WHITE, "548 - Cargobob $62000");
         return 1;
}
	if (strcmp("/cop", cmd, true) == 0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
    	  SendClientMessage(playerid, COLOR_JUIZ,"Como trabalhar bem na carreira policial!");
    	  SendClientMessage(playerid, COLOR_WHITE,"1 - Sempre olhe a lista de procurados poís vai que você passa perto de algum criminoso desinformado!");
    	  SendClientMessage(playerid, COLOR_WHITE,"2 - Atenda as Denúncias das pessoas e investigue-as!");
      	  SendClientMessage(playerid, COLOR_WHITE,"3 - Investigue crimes e mortes e se achar coloque em /procurados!");
    	  SendClientMessage(playerid, COLOR_WHITE,"4 - Veja se alguem dirige bebado usando o bafometro, se dirigir não beba!");
    	  SendClientMessage(playerid, COLOR_JUIZ,"Lembre-se, fique atento com seu serviço!");
		  return 1;
		  }
	   }
	if (strcmp(cmd, "/pt", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 3, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pt [texto]");
			return 1;
			}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == Profissao[playerid]){
					format(string, sizeof(string), "[PROFISSÃO][%s]: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, GetPlayerColor(playerid), string);
					SendClientMessage(playerid, GetPlayerColor(playerid), string);
					return 1;
					}
				}
			}
		}
	if (strcmp(cmdtext, "/profissao", true)==0){
		if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_TAXISTA, "Taxista");
			SendClientMessage(playerid, COLOR_TAXISTA, "Você deve encaminhar as pessoas atravéz de um taxi com o taximetro rodando e ganhar dinheiro, e também pode lavar os taxis em troca de alguns trocados!");
			SendClientMessage(playerid, COLOR_TAXISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_TAXISTA, "/taximetro [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
			SendClientMessage(playerid, COLOR_TAXISTA, "/chutartaxi [id] : Para chutar alguém do taxi.");
			SendClientMessage(playerid, COLOR_TAXISTA, "/lavartaxi : Para lavar um taxi (Você deve estar na area de lavagem no Posto perto do Come-a-Lot)");
			SendClientMessage(playerid, COLOR_TAXISTA, "/entregartaxi : Para entregar o taxi lavado para sua agencia (Você deve estar na porta da agencia, no taxi).");
			SendClientMessage(playerid, COLOR_TAXISTA, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == VENDEDOR_DE_VEICULOS) {
			SendClientMessage(playerid, COLOR_VENDEDOR, "Vendedor de Veículos");
			SendClientMessage(playerid, COLOR_VENDEDOR, "Você deve vender veiculos para as pessoas e cobrar um preço justo, veja em /veiculos");
			SendClientMessage(playerid, COLOR_VENDEDOR, "Não use o serviço para você ou caso contrário sera demitido!");
			SendClientMessage(playerid, COLOR_VENDEDOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_VENDEDOR, "/setcarro [id-do-carro] [rotação] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, COLOR_VENDEDOR, "/exportar : Para exportar um carro da outra Autos'Bahn para a Autos'Bahn que você trabalha.");
			SendClientMessage(playerid, COLOR_VENDEDOR, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_CORRETOR, "Corretor de Imóveis");
			SendClientMessage(playerid, COLOR_CORRETOR, "Você deve vender casas para as pessoas e ganhar dez por cento do valor total!");
			SendClientMessage(playerid, COLOR_CORRETOR, "Não use o serviço para você ou caso contrário sera demitido!");
			SendClientMessage(playerid, COLOR_CORRETOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_CORRETOR, "/setcasa [nick] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
			SendClientMessage(playerid, COLOR_CORRETOR, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_BARMAN, "Barman");
			SendClientMessage(playerid, COLOR_BARMAN, "Você deve vender bebidas e lucrar o valor delas, e também pode lavar os carros do Bar por alguns trocados.");
			SendClientMessage(playerid, COLOR_BARMAN, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_BARMAN, "/cerveja [id] [copos] : Vende uma Cerveja alcoolica e adiciona o teor de alcool no sangue da pessoa");
			SendClientMessage(playerid, COLOR_BARMAN, "/guarana [id] [copos] : Vende um Guarana e retira o teor de alcool no sangue da pessoa");
			SendClientMessage(playerid, COLOR_BARMAN, "/lavarcarbar : Para lavar o carro do Bar (Você deve estar na area de lavagem no Posto perto do Come-a-Lot).");
			SendClientMessage(playerid, COLOR_BARMAN, "/entregarcarbar : Para entregar o carro lavado no Bar (Você deve estar no Bar).");
			SendClientMessage(playerid, COLOR_BARMAN, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COLOR_JUIZ, "Juiz");
			SendClientMessage(playerid, COLOR_JUIZ, "Você deve cuidar de crimes da cidade!");
			SendClientMessage(playerid, COLOR_JUIZ, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_JUIZ, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_JUIZ, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_JUIZ, "/fianca [id] : Da uma Fiança para um Jogador preso em um Total de $2000");
			SendClientMessage(playerid, COLOR_JUIZ, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		    SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "Motorista de Onibus");
		    SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "Você deve encaminhar pessoas pelo onibus e cobrar pelas passagens e depois da viagem retirar as passagens!");
		    SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "/entregarpass [id] : Para entregar uma passagem a alguem.");
		    SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "/retirarpass : Para retirar uma passagem de alguem.");
		    SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "/verificarpass : Para verificar se o jogador tem passagem.");
			SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "/chutarbus : Para chutar alguém de um onibus.");
			SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "Bom Trabalho!");
		}
		else if(Profissao[playerid] == ASSASSINO) {
		    SendClientMessage(playerid, COLOR_ASSASSINO, "Assassino");
		    SendClientMessage(playerid, COLOR_ASSASSINO, "Você deve matar e ganhar dinheiro de formas ilegais.");
		    SendClientMessage(playerid, COLOR_ASSASSINO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COLOR_ASSASSINO, "/assaltar : Para assaltar o banco.");
			SendClientMessage(playerid, COLOR_ASSASSINO, "Bom Trabalho!");
		}
		else if(Profissao[playerid] == TRAFICANTE) {
		    SendClientMessage(playerid, COLOR_TRAFICANTE, "Traficante");
		    SendClientMessage(playerid, COLOR_TRAFICANTE, "Você deve vender drogas e matar pessoas para conseguir dinheiro.");
		    SendClientMessage(playerid, COLOR_TRAFICANTE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COLOR_TRAFICANTE, "/maconha [id] [doses] : Para vender maconha para alguém.");
		    SendClientMessage(playerid, COLOR_TRAFICANTE, "/cocaina [id] [doses] : Para vender cocaina para alguém.");
			SendClientMessage(playerid, COLOR_TRAFICANTE, "Bom Trabalho!");
		}
		else if(Profissao[playerid] == COP_CIVIL) {
			SendClientMessage(playerid, COLOR_COP_CIVIL, "Policial Civil");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "Veja em /cop seu objetivo e dicas para ser um bom policial");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "/prender [id] || /soltar [id] : Prende ou solta uma pessoa da cadeia");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "/procurar [id] || /desprocurar [id] : coloca ou tira o jogador na lista de procurados.");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "/multar [id] [quantia] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "/tiraraerea || /tirarterrestre || /tirarnautica : Tira a habilitação escolhida.");
			SendClientMessage(playerid, COLOR_COP_CIVIL, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "Veja em /cop seu objetivo e dicas para ser um bom policial");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "/prender [id] || /soltar [id] : Prende ou solta uma pessoa da cadeia");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "/procurar [id] || /desprocurar [id] : coloca ou tira o jogador na lista de procurados.");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "/multar [id] [quantia] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "/tiraraerea || /tirarterrestre || /tirarnautica : Tira a habilitação escolhida.");
			SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == SWAT) {
			SendClientMessage(playerid, COLOR_SWAT, "Swat");
			SendClientMessage(playerid, COLOR_SWAT, "Veja em /cop seu objetivo e dicas para ser um bom policial");
			SendClientMessage(playerid, COLOR_SWAT, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_SWAT, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_SWAT, "/prender [id] || /soltar [id] : Prende ou solta uma pessoa da cadeia");
			SendClientMessage(playerid, COLOR_SWAT, "/procurar [id] || /desprocurar [id] : coloca ou tira o jogador na lista de procurados.");
			SendClientMessage(playerid, COLOR_SWAT, "/multar [id] [quantia] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_SWAT, "/tiraraerea || /tirarterrestre || /tirarnautica : Tira a habilitação escolhida.");
			SendClientMessage(playerid, COLOR_SWAT, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == MEDICO) {
			SendClientMessage(playerid, COLOR_MEDICO, "Médico");
			SendClientMessage(playerid, COLOR_MEDICO, "Você deve atender pacientes e cura-los por o preço justo!");
			SendClientMessage(playerid, COLOR_MEDICO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_MEDICO, "/curativo [id] : Aplica o curativo em alguém.");
			SendClientMessage(playerid, COLOR_MEDICO, "/tratamento [id] : Cura alguem das alucinações de drogas.");
			SendClientMessage(playerid, COLOR_MEDICO, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == BANCARIO) {
			SendClientMessage(playerid, COLOR_BANCARIO, "Bancario");
			SendClientMessage(playerid, COLOR_BANCARIO, "Faça serviços de bancos para outras pessoas e cobre o valor, lembrando que eles não precisarão estar no banco!");
			SendClientMessage(playerid, COLOR_BANCARIO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_BANCARIO, "/extrato [id] : Mostra ao jogador quanto de extrato ele tem no banco.");
			SendClientMessage(playerid, COLOR_BANCARIO, "/saque [id] [quantidade] : Faz um saque na conta do jogador.");
			SendClientMessage(playerid, COLOR_BANCARIO, "/deposito [id] [quantidade] : Faz um deposito na conta do jogador.");
			SendClientMessage(playerid, COLOR_BANCARIO, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == EXERCITO) {
			SendClientMessage(playerid, COLOR_EXERCITO, "EXERCITO");
			SendClientMessage(playerid, COLOR_EXERCITO, "Veja em /cop seu objetivo e dicas para ser um bom policial");
			SendClientMessage(playerid, COLOR_EXERCITO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_EXERCITO, "/prender [id] || /soltar [id] : Prende ou solta uma pessoa da cadeia");
			SendClientMessage(playerid, COLOR_EXERCITO, "/procurar [id] || /desprocurar [id] : coloca ou tira o jogador na lista de procurados.");
			SendClientMessage(playerid, COLOR_EXERCITO, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_EXERCITO, "/multar [id] [quantia] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_EXERCITO, "/tiraraerea || /tirarterrestre || /tirarnautica : Tira a habilitação escolhida.");
			SendClientMessage(playerid, COLOR_EXERCITO, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == MECANICO) {
			SendClientMessage(playerid, COLOR_MECANICO, "Mecânico");
			SendClientMessage(playerid, COLOR_MECANICO, "Você deve mecher nos veiculos das pessoas e cobrar a modificação");
			SendClientMessage(playerid, COLOR_MECANICO, "/consertar [id] : Para consertar um veiculo");
			SendClientMessage(playerid, COLOR_MECANICO, "/pintar [cor 1] [cor 2] : Para pintar um veiculo");
			SendClientMessage(playerid, COLOR_MECANICO, "/tunacoes : Para ver opções de tunar um carro.");
		    SendClientMessage(playerid, COLOR_MECANICO, "/vendergas [id] [litros] : Para vender Combustivel para alguém");
			SendClientMessage(playerid, COLOR_MECANICO, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == VENDEDOR_ARMAS) {
			SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "Vendedor de Armas");
			SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "Você deve vender armas e colete e receber o lucro delas, veja a lista de armas em /armas");
			SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "/arma [id] [id da arma] [munição] : Vende uma arma para um jogador");
			SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "/colete [id] : Vende um colete para um jogador");
			SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == JORNALISTA) {
			SendClientMessage(playerid, COLOR_JORNALISTA, "Jornalista");
			SendClientMessage(playerid, COLOR_JORNALISTA, "Você deve publicar noticias, ofereca publicacoes de empregos das pessoas por uma quantia!");
			SendClientMessage(playerid, COLOR_JORNALISTA, "/anunciar [texto] : anuncia uma noticia");
			SendClientMessage(playerid, COLOR_JORNALISTA, "/noticia [texto] : Faz uma noticia sobre o Estado de San Andreas");
			SendClientMessage(playerid, COLOR_JORNALISTA, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COLOR_INSTRUTOR, "Instrutor de Direção");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "Você deve fazer testes para habilitações e ganhar o lucro...");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "/aerea : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "/terrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "/nautica : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "/liberar [id] : Libera alguém para usar os veiculos da auto escola.");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "/infohabs : Para ver as informações das habilitações.");
			SendClientMessage(playerid, COLOR_INSTRUTOR, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
			SendClientMessage(playerid, COLOR_MOTORISTA, "Motorista Particular");
			SendClientMessage(playerid, COLOR_MOTORISTA, "Você deve arranjar um patrão e oferecer seus serviços de motorista para elee dirigir bem, e não causar danos no carro, para ganhar um bom salario...");
			SendClientMessage(playerid, COLOR_MOTORISTA, "e até um bom aumento, e também pode lavar as limosines de sua agencia por alguns trocados.");
			SendClientMessage(playerid, COLOR_MOTORISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_MOTORISTA, "/lavarlimo : Para lavar as limosines de sua Agencia (Você deve estar na area de lavagem no Posto perto do Come-a-Lot).");
			SendClientMessage(playerid, COLOR_MOTORISTA, "/entregarlimo : Para entregar a limosine lavada na sua Agencia (Você deve estar na Agencia).");
			SendClientMessage(playerid, COLOR_MOTORISTA, "Bom Trabalho!");
			}
		else if(Profissao[playerid] == SEGURANÇA) {
			SendClientMessage(playerid, COLOR_SEGURANÇA, "Segurança");
			SendClientMessage(playerid, COLOR_SEGURANÇA, "Você deve arranjar um patrão e oferecer seus serviços de seguro para ele, e também pode entregar valores do banco ate a The Visage.");
			SendClientMessage(playerid, COLOR_SEGURANÇA, "e com suas armas, defende-lo para ganhar um bom salario...e até um bom aumento!");
			SendClientMessage(playerid, COLOR_SEGURANÇA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_SEGURANÇA, "/pegarvalores : Para pegar os valores, você deve estar no banco");
			SendClientMessage(playerid, COLOR_SEGURANÇA, "/entregarvalores : Para entregar os valores, você deve estar na The Visage.");
			SendClientMessage(playerid, COLOR_SEGURANÇA, "Bom Trabalho!");
			}
		 else if(Profissao[playerid] == DESEMPREGADO) {
			SendClientMessage(playerid, COLOR_DESEMPREGADO, "Você deve arranjar um emprego para começar a ganhar bem (mais lute pelo seu emprego,");
			SendClientMessage(playerid, COLOR_DESEMPREGADO, "poderá ser demitido caso queria apenas pelo salário...");
			SendClientMessage(playerid, COLOR_DESEMPREGADO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_DESEMPREGADO, "Bom Trabalho");
			}
		return 1;
		}

	if (strcmp(cmdtext, "/presos", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_JUIZ, "Lista de presos");
	    for(new i=0; i<MAX_PLAYERS; i++){
     	if(Presos[i] == 1){
		format(string, sizeof(string), "ID: %d | Nome: %s", i, PlayerName(i));
		SendClientMessage(playerid, COLOR_GREEN, string);
		}
		}
    	return 1;
		}
		
	if (strcmp(cmdtext, "/admins", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_JUIZ, "Administradores Online");
	    for(new i=0; i<MAX_PLAYERS; i++){
     	if(IsPlayerAdmin(i)){
		format(string, sizeof(string), "ID: %d | Nome: %s", i, PlayerName(i));
		SendClientMessage(playerid, COLOR_GREEN, string);
		}
		}
    	return 1;
		}


	if (strcmp(cmd, "/procurar", true)==0){
		    new tmp[256];
		    new string[256];
		    new plid;
	        plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
	    	if(Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != JUIZ && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
	    	return 1;
			}
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/procurar [id].");
   			return 1;
			}
			if(GetPlayerWantedLevel(plid) == 6){
			SendClientMessage(playerid, COLOR_SWAT, "O Jogador ja tem o maximo de nivel de procurado");
			return 1;
			}
			if(!IsPlayerConnected(plid)){
   			SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
			}
			else {
			Procurados[plid] = 1;
			SendClientMessage(playerid, COLOR_GREEN, "Colocado na lista de procurados com sucesso.");
			format(string, sizeof(string), "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_GREEN, string);
			SetPlayerWantedLevel(plid,GetPlayerWantedLevel(plid) + 1);
			new msg[256];
			format(msg,sizeof(msg),"Noticia: %s esta com %d niveis de procurado agora.",PlayerName(plid),GetPlayerWantedLevel(plid));
			SendClientMessageToAll(COLOR_SWAT,msg);
  			return 1;
			}
			}

	if (strcmp(cmd, "/desprocurar", true)==0){
		    new tmp[256];
		    new string[256];
		    new plid;
	        plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
	    	if(Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != JUIZ && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
	    	return 1;
			}
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/desprocurar [id].");
   			return 1;
			}
			if(Procurados[plid] == 0){
			SendClientMessage(playerid, COLOR_SWAT, "O Jogador não está procurado");
			return 1;
			}
			if(!IsPlayerConnected(plid)){
   			SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
			}
			else {
			SetPlayerWantedLevel(plid,0);
			Procurados[plid] = 0;
			SendClientMessage(playerid, COLOR_GREEN, "Retirado da lista de procurados com sucesso.");
			format(string, sizeof(string), "Você foi retirado da lista de procurados por %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_GREEN, string);
			new msg[256];
			format(msg,sizeof(msg),"Noticia: %s não está mais sendo procurado.",PlayerName(plid));
			SendClientMessageToAll(COLOR_SWAT,msg);
  			return 1;
			}
			}

	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_JUIZ, "Lista de procurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
     	if(Procurados[i] == 1){
		format(string, sizeof(string), "ID: %d | Nome: %s | Nivel de procurado: %s", i, PlayerName(i),nomeprocurado[GetPlayerWantedLevel(i)]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		}
		}
    	return 1;
		}

	if (strcmp(cmd, "/say", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/say [texto]");
			return 1;
			}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(GetDistanceBetweenPlayers(playerid, i) < 10){
					format(string, sizeof(string), "[SAY][%s]: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_GRAY, string);
					SendClientMessage(playerid, COLOR_GRAY, string);
					return 1;
					}
				}
			return 1;
			}
		}

	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == SWAT || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new quant;
	    	new string[256];
			new distancia;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/multar [id] [quantidade]");
				return 1;
				}
        	plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/multar [id] [quantidade]");
				return 1;
				}
        	quant = strval(tmp);
 			if(quant > 1000 || quant <= 0){
				SendClientMessage(playerid, COLOR_RED, "Você não está querendo multar de forma justa.");
				return 1;
				}
			if(IsPlayerConnected(plid)){
			    if(distancia > 10){
			        SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
					return 1;
					}
				if(distancia <= 10){
				format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(playerid, COLOR_GREEN, "Multa dada.");
				udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quant);
				return 1;
				}
	     		else{
			    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
				return 1;
				}
			}
	    	if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != SWAT || IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
			}
	    	return 1;
	    	}
	     }
	if(strcmp(cmd, "/taximetro", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			if(GetVehicleModel(!GetPlayerVehicleID(playerid)) == 420){
			SendClientMessage(playerid, COLOR_TAXISTA, "Você deve estar em um Taxi");
			return 1;
			}
			new tmp[256];
	    	new plid;
     		new veiculo;
			veiculo = GetPlayerVehicleID(plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/taximetro [id]");
				return 1;
				}
  			if(!IsPlayerConnected(plid)){
    		SendClientMessage(playerid, COLOR_RED, "Esse jogador não existe!");
			return 1;
			}
			if(veiculo != vehtaxi1 && veiculo != vehtaxi2 && veiculo != vehtaxi3 && veiculo != vehtaxi4 && veiculo != vehtaxi5 && veiculo != vehtaxi6 && veiculo != vehtaxi7 && veiculo != vehtaxi8){
			SendClientMessage(playerid, COLOR_GREEN, "O Jogador não está em um taxi.");
			return 1;
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COLOR_GREEN, "O taxímetro começou a rodar");
                SendClientMessage(plid, COLOR_GREEN, "O taxímetro começou a rodar");
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
				return 1;
				}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O passageiro não está dentro do seu carro ou você não é o motorista.");
				return 1;
				}
			}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
			return 1;
			}
		return 1;
		}
	if(strcmp(cmd, "/setcarro", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_VEICULOS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, Float:ang, nome[256], cor1, cor2;

			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
		    	return 1;
			}
		    carid = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcarro [id] [ângulo] [nick] [cor1] [cor2]");
		    	return 1;
			}
			ang = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
		 		SendClientMessage(playerid, COLOR_RED, "/setcarro [id] [ângulo] [nick] [cor1] [cor2]");
		    	return 1;
			}
			set(nome, tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcarro [id] [ângulo] [nick] [cor1] [cor2]");
		    	return 1;
			}
			cor1 = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcarro [id] [ângulo] [nick] [cor1] [cor2]");
		    	return 1;
			}
			cor2 = strval(tmp);

			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        new string[256];
			        new File:temp;
			        new Float:X, Float:Y, Float:Z;
					GetPlayerPos(playerid, X, Y, Z);
					format(string, sizeof(string), "%d %f %f %f %f %d %d //%s\r\n", carid, X, Y, Z, ang, cor1, cor2, nome);
					temp = fopen("[TMR]_Veiculos.lgp", io_append);
                    fwrite(temp, string);
                    fclose(temp);
                    SetTimerEx("CriarCarro",10000,0,"dffffdd",carid,X,Y,Z,ang,cor1,cor2);
                    SendClientMessage(playerid, COLOR_GREEN, "Veículo salvo");
			    	return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Você não está em nenhum veículo e assim e assim não pode setar um carro.");
			    	return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
		    	return 1;
			}
		}
		if(Profissao[playerid] != VENDEDOR_DE_VEICULOS){
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
	    	return 1;
		}
    	return 1;
	}

	if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "~w~Horario: ~y~%d~l~:~y~00", worldTime);
		GameTextForAll(string,5000,1);
		return 1;
		}
		
    if(strcmp(cmd, "/cerveja", true) == 0) {
    if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
    new string[256];
	new tmp[256];
	new plid, teor;
	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)){
	SendClientMessage(playerid, COLOR_RED, "/cerveja [id] [copos]");
	return 1;
	}
 	plid = strval(tmp);
 	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, COLOR_RED, "/cerveja [id] [copos]");
	return 1;
	}
	teor = strval(tmp);
	if(teor < 1 || teor > 7){
 	SendClientMessage(playerid, COLOR_RED, "Numero de copos invalido, os copos devem ser entre 1 e 7.");
	return 1;
	}
	else{
 	if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
	if(IsPlayerConnected(plid)){
 	Bebida[plid] = Bebida[plid] + teor;
	format(string, sizeof(string), "Você bebeu %d copos de Cerveja", teor);
 	SendClientMessage(plid, COLOR_GREEN, string);
 	SendClientMessage(playerid, COLOR_GREEN, "Cerveja vendida e tomada");
	return 1;
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
	return 1;
	}
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto para vender a Maconha");
	return 1;
	}
	}
	}
	if(Profissao[playerid] != BARMAN){
 	SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
	return 1;
	}
	return 1;
	}
	
    if(strcmp(cmd, "/guarana", true) == 0) {
    if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
    new string[256];
	new tmp[256];
	new plid, teor;
	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)){
	SendClientMessage(playerid, COLOR_RED, "/guarana [id] [copos]");
	return 1;
	}
 	plid = strval(tmp);
 	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, COLOR_RED, "/guarana [id] [copos]");
	return 1;
	}
	teor = strval(tmp);
	if(teor < 1 || teor > 7){
 	SendClientMessage(playerid, COLOR_RED, "Numero de copos invalido, os copos devem ser entre 1 e 7.");
	return 1;
	}
	else{
 	if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
	if(IsPlayerConnected(plid)){
 	Bebida[plid] = Bebida[plid] - teor;
	format(string, sizeof(string), "Você bebeu %d copos de Guarana", teor);
 	SendClientMessage(plid, COLOR_GREEN, string);
 	SendClientMessage(playerid, COLOR_GREEN, "Guarana vendido e tomado");
	return 1;
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
	return 1;
	}
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto para vender a Maconha");
	return 1;
	}
	}
	}
	if(Profissao[playerid] != BARMAN){
 	SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
	return 1;
	}
	return 1;
	}

    if(strcmp(cmd, "/cocaina", true) == 0) {
    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
    new string[256];
	new tmp[256];
	new plid, doses;
	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)){
	SendClientMessage(playerid, COLOR_RED, "/cocaina [id] [doses]");
	return 1;
	}
 	plid = strval(tmp);
 	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, COLOR_RED, "/cocaina [id] [doses]");
	return 1;
	}
	doses = strval(tmp);
	if(doses < 1 || doses > 10){
 	SendClientMessage(playerid, COLOR_RED, "Numero de doses invalido, As doses devem ser entre 1 e 10.");
	return 1;
	}
	if(doses > 6){
	format(string, sizeof(string), "Você fumou %d doses de Cocaina", doses);
 	SendClientMessage(plid, COLOR_GREEN, string);
	SendClientMessage(plid, COLOR_WHITE, "Você fumou demais e está vendo coisas...chame um médico para te curar.");
	SetPlayerWeather(plid,103);
 	SendClientMessage(playerid, COLOR_GREEN, "Cocaina vendida e fumada.");
	return 1;
	}
	else{
 	if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
	if(IsPlayerConnected(plid)){
	format(string, sizeof(string), "Você fumou %d doses de Cocaina", doses);
 	SendClientMessage(plid, COLOR_GREEN, string);
 	SendClientMessage(playerid, COLOR_GREEN, "Cocaina vendida e fumada.");
	return 1;
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
	return 1;
	}
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto para vender a Cocaina");
	}
	}
	}
	if(Profissao[playerid] != TRAFICANTE){
 	SendClientMessage(playerid, COLOR_RED, "Apenas traficantes podem vender cocaina.");
	return 1;
	}
	return 1;
	}
	
    if(strcmp(cmd, "/maconha", true) == 0) {
    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
    new string[256];
	new tmp[256];
	new plid, doses;
	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)){
	SendClientMessage(playerid, COLOR_RED, "/maconha [id] [doses]");
	return 1;
	}
 	plid = strval(tmp);
 	tmp = strtok(cmdtext, idx);
	if(!strlen(tmp)) {
	SendClientMessage(playerid, COLOR_RED, "/maconha [id] [doses]");
	return 1;
	}
	doses = strval(tmp);
	if(doses < 1 || doses > 10){
 	SendClientMessage(playerid, COLOR_RED, "Numero de doses invalido, As doses devem ser entre 1 e 10.");
	return 1;
	}
	if(doses > 6){
	format(string, sizeof(string), "Você fumou %d doses de Maconha", doses);
 	SendClientMessage(plid, COLOR_GREEN, string);
	SendClientMessage(plid, COLOR_WHITE, "Você fumou demais e está vendo coisas...chame um médico para te curar.");
	SetPlayerWeather(plid,103);
 	SendClientMessage(playerid, COLOR_GREEN, "Maconha vendida e fumada.");
	return 1;
	}
	else{
 	if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
	if(IsPlayerConnected(plid)){
	format(string, sizeof(string), "Você fumou %d doses de Maconha", doses);
 	SendClientMessage(plid, COLOR_GREEN, string);
 	SendClientMessage(playerid, COLOR_GREEN, "Maconha vendida e fumada.");
	return 1;
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
	return 1;
	}
	}
	else{
 	SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto para entregar a bebida.");
	return 1;
	}
	}
	}
	if(Profissao[playerid] != TRAFICANTE){
 	SendClientMessage(playerid, COLOR_RED, "Apenas traficantes podem vender maconha.");
	return 1;
	}
	return 1;
	}

	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
		    new plid;
			new distancia;
		    distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/bafometro [id]");
				return 1;
				}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(distancia > 20){
			        SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
					return 1;
					}
				if(distancia <= 20){
					format(string, sizeof(string), "O bafômetro mostra: %d no sangue", Bebida[plid]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				    SendClientMessage(playerid, COLOR_GREEN, "Prisão concluida");
					return 1;
					}
				return 1;
				}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
				}
			}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != SWAT || Profissao[playerid] != EXERCITO || IsPlayerAdmin(playerid)){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
			}
		return 1;
		}
//-------------fim
//-------------fim
    SendClientMessage(playerid,COLOR_SWAT,"Comando errado seu burro");
    return 1;
}
forward MostrarVelocimetro();

public MostrarVelocimetro()
{
			for(new i=0; i<MAX_PLAYERS; i++){
			new Ptmess[256];
	    	if(IsPlayerInAnyVehicle(i)){
 			if(Petrol[i] >= 25){
			format(Ptmess, sizeof(Ptmess), "~h~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~r~Vei~b~culo ~p~-> ~y~]~w~%s~y~] ~n~ ~r~gas~b~olina ~p~-> ~y~]~w~%d~y~]",OldvehName[GetVehicleModel(GetPlayerVehicleID(i))-400], Petrol[i]);
			GameTextForPlayer(i, Ptmess, 1000, 5);
			}
			if(Petrol[i] < 25 && Petrol[i] >= 1){
			format(Ptmess, sizeof(Ptmess), "~h~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~r~Vei~b~culo ~p~-> ~y~]~w~%s~y~] ~n~ ~r~gas~b~olina ~p~-> ~y~]~w~%d~y~]",OldvehName[GetVehicleModel(GetPlayerVehicleID(i))-400], Petrol[i]);
			GameTextForPlayer(i, Ptmess, 1000, 5);
			}
			}
			}
			}
			
public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}


public sethome(playerid)
{
 new Float:X, Float:Y, Float:Z;
 GetPlayerPos(playerid, X, Y, Z);
 AddStaticPickup(1272,1,X,Y,Z);
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	printf("OnPlayerExitVehicle(%d, %d)", playerid, vehicleid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER){
	new vehicleid = GetPlayerVehicleID(playerid);
	
	//vehcops
    if(vehicleid == vehcops1 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops2 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops3 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops4 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops5 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops6 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops7 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops8 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops9 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops10 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
    if(vehicleid == vehcops11 && Profissao[playerid] != COP_CIVIL && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != SWAT && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas policiais tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehbase
	if(vehicleid == vehbase1 && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas pessoas do exercito tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbase2 && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas pessoas do exercito tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbase3 && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas pessoas do exercito tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbase4 && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas pessoas do exercito tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbase5 && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas pessoas do exercito tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbase6 && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas pessoas do exercito tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbase7 && Profissao[playerid] != EXERCITO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas pessoas do exercito tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehnews
	if(vehicleid == vehnews1 && Profissao[playerid] != JORNALISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas jornalistas tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehnews2 && Profissao[playerid] != JORNALISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas jornalistas tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehnews3 && Profissao[playerid] != JORNALISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas jornalistas tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehnews4 && Profissao[playerid] != JORNALISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas jornalistas tem autorização para andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehmoto
	if(vehicleid == vehmoto1 && Profissao[playerid] != MOTORISTA_PARTICULAR && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas motoristas particulares tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehmoto2 && Profissao[playerid] != MOTORISTA_PARTICULAR && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas motoristas particulares tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehmoto3 && Profissao[playerid] != MOTORISTA_PARTICULAR && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas motoristas particulares tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehbar
	if(vehicleid == vehbar1 && Profissao[playerid] != BARMAN && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas barmans tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbar1 && Profissao[playerid] != BARMAN && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas barmans tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehauto
	if(vehicleid == vehauto1 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto2 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto3 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto4 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto5 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto6 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair..");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto7 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto8 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto9 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	if(vehicleid == vehauto10 && Profissao[playerid] != INSTRUTOR_DE_DIRECAO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Você está em um carro da auto escola, algum instrutor deve te autorizar a usar o veiculo para teste, ou digite /sair para sair.");
 	TogglePlayerControllable(playerid,0);
	return 1;
	}
	
	//vehbus
	if(vehicleid == vehbus1 && Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas motoristas de onibus tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbus2 && Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas motoristas de onibus tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbus3 && Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas motoristas de onibus tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbus4 && Profissao[playerid] != MOTORISTA_DE_ONIBUS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas motoristas de onibus tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	
	//vehbahni
	if(vehicleid == vehbahni1 && Profissao[playerid] != VENDEDOR_DE_VEICULOS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de veiculos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbahni2 && Profissao[playerid] != VENDEDOR_DE_VEICULOS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de veiculos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbahni3 && Profissao[playerid] != VENDEDOR_DE_VEICULOS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de veiculos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbahni4 && Profissao[playerid] != VENDEDOR_DE_VEICULOS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de veiculos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	
	//vehbahne
	if(vehicleid == vehbahne1 && Profissao[playerid] != VENDEDOR_DE_VEICULOS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de veiculos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbahne2 && Profissao[playerid] != VENDEDOR_DE_VEICULOS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de veiculos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbahne3 && Profissao[playerid] != VENDEDOR_DE_VEICULOS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de veiculos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehtaxi
	if(vehicleid == vehtaxi1 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehtaxi2 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehtaxi3 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehtaxi4 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehtaxi5 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehtaxi6 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehtaxi7 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehtaxi8 && Profissao[playerid] != TAXISTA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas taxistas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehcrims
	if(vehicleid == vehcrims1 && Profissao[playerid] != ASSASSINO && Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas assassinos e traficantes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehcrims2 && Profissao[playerid] != ASSASSINO && Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas assassinos e traficantes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehcrims3 && Profissao[playerid] != ASSASSINO && Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas assassinos e traficantes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehcrims4 && Profissao[playerid] != ASSASSINO && Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas assassinos e traficantes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehcrims5 && Profissao[playerid] != ASSASSINO && Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas assassinos e traficantes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehcrims6 && Profissao[playerid] != ASSASSINO && Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas assassinos e traficantes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehhospital
	if(vehicleid == vehhospital1 && Profissao[playerid] != MEDICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas medicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehhospital2 && Profissao[playerid] != MEDICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas medicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehhospital3 && Profissao[playerid] != MEDICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas medicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehhospital4 && Profissao[playerid] != MEDICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas medicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehhospital5 && Profissao[playerid] != MEDICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas medicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehhouse
	if(vehicleid == vehhouse1 && Profissao[playerid] != CORRETOR && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas corretores de imoveis tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehhouse2 && Profissao[playerid] != CORRETOR && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas corretores de imoveis tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehhouse3 && Profissao[playerid] != CORRETOR && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas corretores de imoveis tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehammu
	if(vehicleid == vehammu1 && Profissao[playerid] != VENDEDOR_ARMAS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de armas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehammu2 && Profissao[playerid] != VENDEDOR_ARMAS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de armas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehammu3 && Profissao[playerid] != VENDEDOR_ARMAS && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas vendedores de armas tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehoffice
	if(vehicleid == vehoffice1 && Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas mecanicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehoffice2 && Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas mecanicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehoffice3 && Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas mecanicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehoffice4 && Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas mecanicos tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehseg
	if(vehicleid == vehseg1 && Profissao[playerid] != SEGURANÇA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas seguranças tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehseg2 && Profissao[playerid] != SEGURANÇA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas seguranças tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehseg3 && Profissao[playerid] != SEGURANÇA && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas seguranças tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehjuiz
	if(vehicleid == vehjuiz1 && Profissao[playerid] != JUIZ && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas juizes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	//vehjuiz
	if(vehicleid == vehjuiz2 && Profissao[playerid] != JUIZ && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas juizes tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}

	//vehbanco
	if(vehicleid == vehbanco1 && Profissao[playerid] != BANCARIO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas bancários tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
	if(vehicleid == vehbanco2 && Profissao[playerid] != BANCARIO && !IsPlayerAdmin(playerid)){
	SendClientMessage(playerid, COLOR_SWAT, "Apenas bancários tem autorização de andar neste veículo");
	RemovePlayerFromVehicle(playerid);
	return 1;
	}
 }
 
	if(newstate == PLAYER_STATE_DRIVER){
	    Petrol[playerid] = udb_getGasoline(PlayerName(playerid));
 		new id;
	    new modelo;
	    id = GetPlayerVehicleID(playerid);
		cGetVehicleModelID(id,modelo);
		if(modelo == 594){
		   	 return 1;
		} else {
			if(Petrol[playerid] <= 0){
				RemovePlayerFromVehicle(playerid);
				Petrol[playerid] = 0;
				SendClientMessage(playerid, COLOR_RED, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
        		return 0;
			}
			else
			{
				Petrol[playerid]--;
  				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
			}
		}
		return 1;
	}
	if(newstate == PLAYER_STATE_ONFOOT){
	    if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COLOR_GREEN, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COLOR_RED, "Você recebeu o valor da corrida até aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
			return 1;
			}
		}
	return 1;
	}



public OnPlayerEnterCheckpoint(playerid)
{
	printf("Jogador de ID %d (%s) entrou em um checkpoint",playerid, PlayerName(playerid));
	return 1;
	}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("OnPlayerLeaveCheckpoint(%d)", playerid);
	return 1;
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	return name;
}
public Bancos(playerid)
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			if(X >= -2639.1470 && X <= -2637.8711 && Y >= 636.9918 && Y <= 637.1106){
				if(AreaBanco[i] == 0) {
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2446.8010 && X <= -2445.6614 && Y >= 520.5995 && Y <= 521.9355){
				if(AreaBanco[i] == 0) {
                    GameTextForPlayer(i,"~w~Banco digite /banco ~n~para ver os comandos",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1974.8185 && X <= -1973.3147 && Y >= 117.5223 && Y <= 118.9387){
				if(AreaBanco[i] == 0) {
                    GameTextForPlayer(i,"~w~Banco digite /banco ~n~para ver os comandos",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1746.9470 && X <= -1745.1959 && Y >= 961.1599 && Y <= 962.3677){
				if(AreaBanco[i] == 0) {
                    GameTextForPlayer(i,"~w~Banco digite /banco ~n~para ver os comandos",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1951.9229 && X <= -1950.5121 && Y >= 643.8934 && Y <= 645.0187){
				if(AreaBanco[i] == 0) {
                    GameTextForPlayer(i,"~w~Banco digite /banco ~n~para ver os comandos",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -24.5102 && X <= -21.8252 && Y >= -55.6748 && Y <= -54.1747){
				if(AreaBanco[i] == 0) {
                    GameTextForPlayer(i,"~w~Banco digite /banco ~n~para ver os comandos",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 1873.7195 && X <= 1879.1149 && Y >= 2239.0325 && Y <= 2243.9551){
				GameTextForPlayer(i, "~w~Agencia de Taxi",3000,0);
				AreaEntregaLT[i] = 1;
			}
			else if(X >= 2433.4224 && X <= 2446.6133 && Y >= 2055.6411 && Y <= 2058.5144){
				GameTextForPlayer(i, "~w~Bar",3000,0);
				AreaEntregaCarBar[i] = 1;
			}
			else if(X >= 2421.7485 && X <= 2424.9985 && Y >= 1112.7391 && Y <= 1135.1085){
				GameTextForPlayer(i, "~w~Agencia de Serviços Publicos",3000,0);
				AreaEntregaLimo[i] = 1;
			}
			else if(X >= 2628.9065 && X <= 2638.1230 && Y >= 1067.3809 && Y <= 1079.2269){
				GameTextForPlayer(i, "~w~Area de Lavagem de Carros",3000,0);
				AreaLavagem[i] = 1;
			}
			else if(X >= 2032.8517 && X <= 2036.3346 && Y >= 1914.6959 && Y <= 1926.6584){
				GameTextForPlayer(i, "~g~The Visage",3000,0);
				AreaEntregarValores[i] = 1;
			}
			else if(X >= 1978.5289 && X <= 1993.4915 && Y >= 2046.8833 && Y <= 2057.6892){
				GameTextForPlayer(i, "~w~Area de exportacao de veiculos",3000,0);
				AreaEntregaCarros[i] = 1;
			}
			else if((X >= -1448.0480 && Y <= -1451.9598 && X <= -1220.6431 && Y >= -1547.6027)){
				GameTextForPlayer(i,"~w~Posto digite /gas [litros]",3000,2);
				AreaPosto[i] = 1;
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
				GameTextForPlayer(i,"~w~Posto digite /gas [litros]",3000,0);
				AreaPosto[i] = 1;
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    GameTextForPlayer(i,"~w~Posto digite /gas [litros]",3000,0);
			    AreaPosto[i] = 1;
			}
			else if((X >= -2249.5974 && X <= -2237.2092 && Y >= -2568.4641 && Y <= -2555.4763)){
			    GameTextForPlayer(i,"~w~Posto digite /gas [litros]",3000,0);
			    AreaPosto[i] = 1;
			}
			else if((X >= 2632.0894 && X <= 2647.9346 && Y >= 1101.4668 && Y <= 1111.9521)){
			    GameTextForPlayer(i,"~w~Posto digite /gas [litros]",3000,0);
			    AreaPosto[i] = 1;
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    GameTextForPlayer(i,"~w~Posto digite /gas [litros]",3000,0);
			    AreaPosto[i] = 1;
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
		    	GameTextForPlayer(i,"~w~Posto digite /gas [litros]",3000,0);
			    AreaPosto[i] = 1;
			}
			else if((X >= 232.6500 && X <= 235.5018 && Y >= 1064.1859 && Y <= 1064.3761)){
				SetPlayerPos(i,2127.8027,2363.6450,10.8203);
				SetPlayerInterior(i, 0);
			}
			else if((X >= 2122.3147 && X <= 2132.5037 && Y >= 2373.3511 && Y <= 2378.8567)){
				SetPlayerPos(i,234.0674,1069.4136,1084.1942);
				SetPlayerInterior(i, 6);
			}
			else if((X >= 231.1054 && X <= 233.7572 && Y >= 1084.2107 && Y <= 1085.5994)){
				SetPlayerPos(i,447.4131,1401.3110,1084.3120);
				SetPlayerInterior(i, 2);
			}
			else if((X >= 445.2325 && X <= 448.6263 && Y >= 1397.1904 && Y <= 1399.0612)){
				SetPlayerPos(i,232.2719,1082.7286,1084.2344);
				SetPlayerInterior(i, 6);
			}
			else if((X >= 235.3537 && X <= 236.5169 && Y >= 1084.2512 && Y <= 1085.6917)){
				SetPlayerPos(i,231.0182,1114.3713,1080.9922);
				SetPlayerInterior(i, 5);
			}
			else if((X >= 226.4816 && X <= 228.0898 && Y >= 1113.2648 && Y <= 1115.3136)){
				SetPlayerPos(i,235.8370,1082.7438,1084.2415);
				SetPlayerInterior(i, 6);
			}
			else {
				if(AreaBanco[i] == 1) {
                    DisablePlayerCheckpoint(i);
					AreaBanco[i] = 0;
				}
				if(AreaEntregarValores[i] == 1) {
				    AreaEntregarValores[i] = 0;
				}
				if(AreaEntregaLT[i] == 1) {
				    AreaEntregaLT[i] = 0;
				}
				if(AreaEntregaCarros[i] == 1) {
				    AreaEntregaCarros[i] = 0;
				}
				if(AreaLavagem[i] == 1) {
				    AreaLavagem[i] = 0;
				}
				if(AreaEntregaLimo[i] == 1) {
				    AreaEntregaLimo[i] = 0;
				}
				if(AreaEntregaCarBar[i] == 1) {
				    AreaEntregaCarBar[i] = 0;
				}
				if(AreaLavagem[i] == 1) {
				    AreaLavagem[i] = 0;
				}
				if(AreaEntregaCarros[i] == 1) {
				    AreaEntregaCarros[i] = 0;
				}
				if(AreaPosto[i] == 1) {
				    AreaPosto[i] = 0;
				}
			}
		}
	}
}



	
public Anuncio()
{
	  GameTextForAll("~b~ Mag~w~num ~b~R~y~P~w~G",5000,0);
	  SendClientMessageToAll(COLOR_YELLOW, "Magnum RPG");
	  SendClientMessageToAll(COLOR_GREEN, "Para informações digite /ajuda.");
	  SendClientMessageToAll(COLOR_RED, "Para ver os admins online no servidor digite /admins.");
	  SendClientMessageToAll(COLOR_SWAT, "Divirta-se");
}
public Anuncio2()
{
	  GameTextForAll("~b~ Mag~w~num ~b~R~y~P~w~G",5000,0);
}

public MoneyGrubScoreUpdate()
{
	new CashScore;
	for(new i=0; i<MAX_PLAYERS; i++){
		if (IsPlayerConnected(i)){
   			CashScore = GetPlayerMoney(i);
			SetPlayerScore(i, CashScore);
		}
	}
}

stock LogarPlayer(playerid)
{
    new Float:X, Float:Y, Float:Z, Float:ang, Float:health;
    GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
	udb_getHealth(PlayerName(playerid), health);
	SetPlayerHealth(playerid, health);
	udb_getPosition(PlayerName(playerid), X, Y, Z);
	udb_getAng(PlayerName(playerid), ang);
	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
	Profissao[playerid] = udb_getProf(PlayerName(playerid));
	Petrol[playerid] = udb_getGasoline(PlayerName(playerid));
	SendClientMessage(playerid, COLOR_GREEN, "Logado");
	if(udb_getPrisao(PlayerName(playerid)) == 1 || Procurados[playerid] == 1){
		Procurados[playerid] = 0;
		new cela;
		Presos[playerid] = 1;
		new lugar = random(4-1) + 1;
		cela = lugar;
		SetPlayerFacingAngle(playerid,0);
		if(cela == 1){
		    SetPlayerPos(playerid,227.6684,110.1895,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		else if(cela == 2){
		    SetPlayerPos(playerid,223.0134,110.3193,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		else if(cela == 3){
		    SetPlayerPos(playerid,219.3730,110.2772,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		else if(cela == 4){
		    SetPlayerPos(playerid,214.9654,109.4626,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		SendClientMessage(playerid,COLOR_RED,"Você deve ter cometido algum crime, por isso foi preso.");
		SendClientMessage(playerid,COLOR_RED,"Para sair mais cedo da prisão, você pode pagar a fiança de $2000,");
		SendClientMessage(playerid,COLOR_RED,"com algum Juiz!");
	}
	else{
		SpawnPlayer(playerid);
	}

}

public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 300000){
				SetPlayerWantedLevel(i, 0);
	            Presos[i] = 0;
	            udb_setPrisao(PlayerName(i), 0);
	            TempoPreso[i] = 0;
	    	    LogarPlayer(i);
	            SendClientMessage(i, COLOR_YELLOW, "Você foi solto por agora, não cometa mais crimes se não irá pagar novamente.");
	    		Procurados[i] = 0;
			}
			if(TempoPreso[i] < 10){
			    TempoPreso[i]++;
			}
		}
	}
}

stock GetDistanceBetweenPlayers(playerid,playerid2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	new Float:dis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetPlayerPos(playerid2,x2,y2,z2);
	dis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(dis);
}
public consertar(vehicle,plid,angulo)
{
   new Float:X, Float:Y, Float:Z;
   GetPlayerPos(plid,X,Y,Z);
   if(IsPlayerConnected(plid)){
   SetVehiclePos(vehicle,X,Y,Z-0.8);
   SetVehicleZAngle(vehicle,angulo);
   SendClientMessage(plid, COLOR_MECANICO, "Seu veiculo foi consertado.");
   }
}
public Taxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(Taximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 3){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 3;
				format(string, sizeof(string), "O taxímetro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COLOR_RED, "Você não tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(Taximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				Taximetro[i][1] = 0;
				Taximetro[i][0] = 0;
			}
		}
	}
}

public Megasena()
{
  for(new i=0; i<MAX_PLAYERS; i++){
	 if(Bilhete[i] == true){
   		aposta[i] = 0;
   		new numerosorteado = random(21);
   		if(numeroapostado[i] == numerosorteado){
   			SendClientMessageToAll(COLOR_JUIZ,"Loteria's Magnum. Sorteio!");
			new string[256];
 	  		format(string,sizeof(string),"%s ganhou o sorteio! O número apostado foi %d",PlayerName(i),numerosorteado);
   			SendClientMessageToAll(COLOR_JUIZ,string);
   			GivePlayerMoney(i,moneyloteria);
   			numeroapostado[i] = -1;
			Bilhete[i] = false;
   			return 1;
   		}
   		else if(numeroapostado[i] != numerosorteado){
   			SendClientMessageToAll(COLOR_JUIZ,"Loteria's Magnum. Sorteio!");
   			moneyloteria = moneyloteria + 2000;
   			numeroapostado[i] = -1;
   			new msg[256];
   			format(msg,sizeof(msg),"Nenhum vencedor. Talvez na próxima! O numero sorteado foi %d. O premio foi acumulado para R$%d",numerosorteado,moneyloteria);
   			SendClientMessageToAll(COLOR_JUIZ,msg);
   			Bilhete[i] = false;
   			return 1;
		}
	 }
  }
  return 1;
}
public contagem()
{
   GameTextForAll("~b~4",2000,6);
   SetTimer("contagem2",1000,false);
   return 1;
}

public contagem2()
{
       GameTextForAll("~y~3",2000,6);
       SetTimer("contagem3",1000,false);
       return 1;
}
public contagem3()
{
 GameTextForAll("~g~2",2000,6);
 SetTimer("contagem4",1000,false);
 return 1;
}
public contagem4()
{
 GameTextForAll("~w~1",2000,6);
 SetTimer("contagem5",1000,false);
 return 1;
}
public contagem5()
{
 GameTextForAll("~r~VAI",1000,0);
 return 1;
}

public Assalto(playerid)
{
assalto[playerid] = 0;
}
public PhoneCut()
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (Calling[i] > -1 && Answered[i] == 1 && Callerid[i] == 1)
			{
				if (GetPlayerMoney(i) >= CallCost)
				{
					GivePlayerMoney(i, -CallCost);
				}
				if (GetPlayerMoney(i) < CallCost)
				{
					SendClientMessage(i, COLOR_RED, "Chamada Finalizada: Você não tem mais dinheiro para os créditos...");
					SendClientMessage(Calling[i], COLOR_RED, "Chamada Finalizada: Seu recepiente não tem mais dinheiro para os creditos...");
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

public Tempo()
{
	worldTime++;
	worldTime%=24;
	SetWorldTime(worldTime);
	
	for(new i=0; i<MAX_PLAYERS; i++) {
		if(worldTime==0){
			if(IsPlayerConnected(i)){
				if(Profissao[i] == DESEMPREGADO) {
					SendClientMessage(i, COLOR_DESEMPREGADO, "Seu seguro desemprego foi depositado: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == TAXISTA) {
					SendClientMessage(i, COLOR_TAXISTA, "O sindicato dos Taxistas depositou seu salário: 900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == VENDEDOR_DE_VEICULOS) {
					SendClientMessage(i, COLOR_VENDEDOR, "A Autos'Bahn depositou seu salário: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == CORRETOR) {
					SendClientMessage(i, COLOR_CORRETOR, "Seu chefe lhe pagou seu salario pelos imoveis vendidos: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == MECANICO) {
					SendClientMessage(i, COLOR_MECANICO, "A Oficina depositou seu salário: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == BARMAN) {
					SendClientMessage(i, COLOR_BARMAN, "O Bar depositou seu salário: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: 2300");
					SendClientMessage(i, COLOR_JUIZ, "Mais o governo retira do seu banco -$500 pelo projeto do Mensalão, num total de 1800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1800);
				}
				else if(Profissao[i] == SEGURANÇA) {
					SendClientMessage(i, COLOR_SEGURANÇA, "O Governo depositou seu salário pelo seu serviço de Segurança: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == MOTORISTA_PARTICULAR) {
					SendClientMessage(i, COLOR_MOTORISTA, "O Governo depositou seu salário pelo seu serviço de Motorista: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == COP_CIVIL) {
					SendClientMessage(i, COLOR_COP_CIVIL, "A Delegacia de Las Venturas depositou seu salário $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_RODOVIARIO) {
					SendClientMessage(i, COLOR_COP_RODOVIARIO, "A Delegacia de Las Venturas depositou seu salário: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == SWAT) {
					SendClientMessage(i, COLOR_SWAT, "A Delegacia de Las Venturas depositou seu salário: $2500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
				}
				else if(Profissao[i] == EXERCITO) {
					SendClientMessage(i, COLOR_EXERCITO, "O General depositou seu salário pelo seu serviço de guarda: $3200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3200);
				}
				else if(Profissao[i] == VENDEDOR_ARMAS) {
					SendClientMessage(i, COLOR_VENDEDOR_ARMAS, "Seu Tráfico está indo bem, você ganhou: $500 de salario do seu chefe de tráfico de armas!");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 500);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					SendClientMessage(i, COLOR_INSTRUTOR, "A auto escola depositou seu salário: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					SendClientMessage(i, COLOR_MOTORISTA_ONIBUS, "O Governo pagou o seu serviço da Estação de Ônibus: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == JORNALISTA) {
					SendClientMessage(i, COLOR_JORNALISTA, "O Departamento de San News depositou seu salário: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == MEDICO) {
					SendClientMessage(i, COLOR_MEDICO, "O Hospital depositou seu salário: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
	                }
				else if(Profissao[i] == BANCARIO) {
					SendClientMessage(i, COLOR_BANCARIO, "Os bancos 24/7 depositaram seu salário: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
	                }
				else if(Profissao[i] == TRAFICANTE) {
					SendClientMessage(i, COLOR_TRAFICANTE, "O dono da Boca de Fumo onde você está empregado Depositou seu salário: $1300");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				   }
			}
		}
	}
}
