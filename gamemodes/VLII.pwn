/*****************************************************************************************************

									Virtual Society RPG
					
  							Copyright (C) 2010 Virtual Society Team
 			        			    All rights reserved
		   	      		
       					  			 Project leaders:
								 Jairo Marques aka Texugo
								Rafael Ravedutti aka HDisk
								
        						   Virtual Society Team:
								         Michael
			         					Guilherme
								         Brutows
									 	 Keninho
							             Ventania
									     Lorenzo
									     Osorkon
									    
								    Special Thanks to:
								      Rockstar Games
									    SA:MP Team
                                      Brazucas'Server
									    
*****************************************************************************************************/

#include <a_samp>

#define SERVER_DIRECTORY        		"Virtual Society RPG/"
#define BAN_FILE_PATH                   "Virtual Society RPG/BannedUsers.ini"
#define BAN_BUFFER_FILE_PATH            "Virtual Society RPG/BannedUsers.buf"
#define ACTION_REPORT_FILE_PATH         "Virtual Society RPG/Actions.ini"
#define CHAT_REPORT_FILE_PATH         	"Virtual Society RPG/Chat.ini"
#define GLOBAL_FILE_PATH                "Virtual Society RPG/World/Global.ini"
#define SERVER_VEHICLES_FILE_PATH       "Virtual Society RPG/World/ServerVehicles.ini"
#define GANGZONES_FILE_PATH             "Virtual Society RPG/World/GangZones.ini"
#define GANGS_FILE_PATH                 "Virtual Society RPG/World/Gangs.ini"
#define CELLPHONE_FILE_PATH             "Virtual Society RPG/World/CellPhones.ini"

#define HSYS_SEP_CHAR                   '='
#define HSYS_SEP_CHAR_STRING            "="

#define reportf(%1,%2,%3)                                                                                   \
										do                                                                  \
										{                                                            		\
											new msg[256];                                           		\
											format(msg, sizeof msg, (%1), %3);                  			\
											report(msg, %2);                                                \
										}                                              						\
										while(FALSE_VAR)

#define SetPlayerColour                 SetPlayerColor
#define GetPlayerColour                 GetPlayerColor
#define ChangeVehicleColour             ChangeVehicleColor
#define TextDrawColour                  TextDrawColor
#define TextDrawBoxColour               TextDrawBoxColor
#define TextDrawBackgroundColour        TextDrawBackgroundColor

//Cores padrões
#define COLOUR_YELLOW            		0xFFFF00AA
#define COLOUR_LIGHT_YELLOW      		0xFFFFE0AA
#define COLOUR_DARK_GOLD                0xEEAD0EAA
#define COLOUR_GOLD              		0xFFD700AA
#define COLOUR_WHITE             		0xFFFFFFAA
#define COLOUR_BLACK                    0x000000AA
#define COLOUR_GRAY              		0xB5B5B5AA
#define COLOUR_RED               		0xFF0000AA
#define COLOUR_ORANGE            		0xFF4500AA
#define COLOUR_BLUE              		0x0000FFAA
#define COLOUR_ROYAL_BLUE        		0x4169E1AA
#define COLOUR_SKY_BLUE          		0x87CEFAAA
#define COLOUR_LIGHT_BLUE    			0xADD8E6AA
#define COLOUR_PINK  					0xFFC0CBAA
#define COLOUR_PURPLE        			0xA020F0AA
#define COLOUR_AZURE         			0xE0EEEEAA
#define COLOUR_GREEN             		0x00FF00AA
#define COLOUR_LIGHT_GREEN       		0x98FB98AA

//Tipos de report
#define REPORT_DEFAULT                  0
#define REPORT_CHAT                     1
#define REPORT_ACTION                   2

//Cores de administradores
#define COLOUR_ADMIN                    COLOUR_ROYAL_BLUE
#define COLOUR_REPORT_DEFAULT           COLOUR_ADMIN
#define COLOUR_REPORT_CHAT              COLOUR_SKY_BLUE
#define COLOUR_REPORT_ACTION            COLOUR_ORANGE

//Cores dos empregos
#define COLOUR_DESEMPREGADO      		0x696969AA
#define COLOUR_TAXISTA           		0xFFFFE0AA
#define COLOUR_BARMAN            		0xF0E68CAA
#define COLOUR_PIZZABOY          		0xF5DEB3AA
#define COLOUR_LIXEIRO                  0x8B795EAA
#define COLOUR_FRENTISTA         		0xE0EEEEAA
#define COLOUR_MAQUINISTA      			0x9AC0CDAA
#define COLOUR_CAMINHONEIRO             0xE4E4E4AA
#define COLOUR_JORNALISTA               0xFFFFFFAA
#define COLOUR_MECANICO                 0xCAE1FFAA
#define COLOUR_PARAMEDICO        		0xFFC0CBAA
#define COLOUR_POLICIAL_MILITAR  		0xADD8E6AA
#define COLOUR_ADVOGADO                 0x9ACD32AA
#define COLOUR_POLICIAL_SWAT     		0x87CEFAAA
#define COLOUR_TRAFICANTE        		0xCD6600AA
#define COLOUR_DELEGADO          		0x4169E1AA
#define COLOUR_JUIZ             		0x7FFF00AA

//Empregos
#define DESEMPREGADO              		1
#define TAXISTA                   		2
#define BARMAN                          3
#define PIZZABOY                        4
#define LIXEIRO                         5
#define FRENTISTA                   	6
#define MAQUINISTA            			7
#define CAMINHONEIRO                    8
#define JORNALISTA                      9
#define MECANICO                        10
#define PARAMEDICO                      11
#define POLICIAL_MILITAR                12
#define ADVOGADO                        13
#define POLICIAL_SWAT          			14
#define TRAFICANTE             			15
#define DELEGADO               			16
#define JUIZ                            17

//Areas
#define AREA_NULL                       0
#define AREA_GAS_STATION           		1
#define AREA_HOSPITAL             		2
#define AREA_CUSTOM_SHOP            	3
#define AREA_MOD_SHOP                   4
#define AREA_POLICE_DEPARTMENT          5
#define AREA_CAR_DEALER        			6
#define AREA_TRIBUNAL                   7

//Virtual Worlds específicos
#define HISTORY_VIRTUAL_WORLD           501

//Interiores
#define INT_BANK                        0
#define INT_24/7_SHOP                   1
#define INT_LOTTERY                     2
#define INT_HORSE_LOTTERY               3
#define INT_DISCO                       4
#define INT_STRIP_CLUB                  5
#define INT_RESTAURANT                  6
#define INT_BAR                         7
#define INT_BINCO                		8
#define INT_VICTIM                      9
#define INT_SUB_URBAN                   10
#define INT_GUN_SHOP                    11
#define INT_DONUTS_SHOP                 12
#define INT_PIZZARIA                 	13
#define INT_CLUCKIN_BELL                14
#define INT_BURGER_SHOT                 15
#define INT_POLICE_DEPARTMENT           16
#define INT_TRIBUNAL                    17
#define INT_INSURER                     18
#define INT_REAL_ESTATE                 19
#define INT_QUESTIONING                 20
#define INT_TOY_SHOP                    21

//Map Icons
#define MAX_MAP_ICONS                   32
#define MAP_ICON_RADIUS                 300.0

//Checkpoints
#define CHECKPOINT_NONE                 0
#define CHECKPOINT_AMMUNATION          	1
#define CHECKPOINT_DONUTS               2
#define CHECKPOINT_PIZZA                3
#define CHECKPOINT_CHICKEN              4
#define CHECKPOINT_BURGER               5
#define CHECKPOINT_DRINKS               6
#define CHECKPOINT_RESTAURANT           7
#define CHECKPOINT_24/7_SHOP            8
#define CHECKPOINT_TOY_SHOP             9

//Cargos de gangue
#define GANGPOST_NONE                   0
#define GANGPOST_SOLDIER                1
#define GANGPOST_PILOT                  2
#define GANGPOST_SCOUT                  3
#define GANGPOST_ROCKET                 4
#define GANGPOST_TRAFFICKER             5
#define GANGPOST_TOWER                  6
#define GANGPOST_SWORD_ARM              7
#define GANGPOST_LEADER                 8

//Dialogs
#define DIALOG_REGISTER_LOGIN           1
#define DIALOG_INVITE                   2

//Slots
#define MAX_SLOTS               		50

//Casas
#define MAX_HOUSES                      400
#define HOUSE_RADIUS                    4.0

//Skill level
#define MAX_SKILL_LEVEL                 900

//Celular
#define NO_CELL_PHONE                   0

//Armas
#define MAX_DROPPED_WEAPONS             100
#define DROPPED_WEAPON_TIME             200000
#define DROPPED_WEAPON_DISTANCE         2.0

//Tuning
#define SPOILERS                    	0
#define ROOFSCOOPS                  	1
#define HOODS                       	2
#define SIDESKIRTS                  	3
#define NITROS                      	4
#define LAMPS                       	5
#define EXHAUSTS                    	6
#define WHEELS                      	7
#define STEREO                      	8
#define HYDRAULICS                  	9
#define BULLBARS                    	10
#define REARBULLBARS                	11
#define FRONTBULLBARS               	12
#define FRONTBUMPERS                	13
#define REARBUMPERS                 	14
#define VENTS                     		15
#define FRONTSIGN                   	16
#define PAINTJOBS                   	17

//Propostas
#define INVITE_NONE                     0
#define INVITE_GANG                     1
#define INVITE_REPAIR                   2

//Login
#define IsPlayerLogged(%1)             	(Login[%1] != 0)

//Tempo
#define CurrentHour     				(CurrentTime / 60)
#define CurrentMinute   				(CurrentTime % 60)

//Updates
#define UPDATE_MONEY                    1
#define UPDATE_WEAPONS                  2
#define UPDATE_STATUS                   4

//Preco da gasolina (por litro)
#define FUEL_COST                       2

//Flags de veiculos
#define VFROZEN_NO_GAS      			1
#define VFROZEN_NO_KEY      			2
#define VFROZEN_PAINT                   4
#define VFROZEN_REPAIR                  8
#define VFROZEN_FUEL                    16

//Veiculos de trabalho
#define IsJobVehicle(%1,%2)             IsJobVehicleEx(%1, %2, sizeof %2)
#define IsPlayerInJobVehicle(%1,%2)     IsPlayerInJobVehicleEx(%1, %2, sizeof %2)
#define GetPlayerJobVehicle(%1,%2)      GetPlayerJobVehicleEx(%1, %2, sizeof %2)

#define SetJobVehiclesParamsForPlayer(%1,%2,%3)                                                                 \
										do    																	\
										{                               										\
						    				if(%3)                												\
										        SetVehiclesParamsForPlayer(%1, sizeof %1, %2, 0, 0);    		\
											else                                                            	\
											    SetVehiclesParamsForPlayer(%1, sizeof %1, %2, 0, 1);     		\
											}                                                                   \
										while(FALSE_VAR)

//Funcoes matemáticas
#define mod(%1)     					(%1 > 0 ? %1 : -%1)

//Variáveis constantes estáticas
static const 		COMMANDS_PER_LIST  	=	8;
static const bool:	FALSE_VAR 			= 	false;

//Cameras
enum camInfo
{
	Float:CameraPosX,
	Float:CameraPosY,
	Float:CameraPosZ,
	Float:CameraLookAtX,
	Float:CameraLookAtY,
	Float:CameraLookAtZ
}

new Cameras[][camInfo] = {
	{2042.6848, -1404.6050, 68.8817,  2000.6848, -1398.6050, 69.8817},
	{1866.8502, -1775.1092, 29.2311,  1854.8231, -1759.1296, 32.2311},
	{1661.5819, -1702.5007, 30.6002,  1643.1673, -1710.3048, 33.6004},
	{1258.1088, -2014.5166, 61.1217,  1265.2869, -1995.8491, 69.1217},
	{312.1636,  -2210.8625, 56.4740,  312.5242,  -2190.8657, 59.4739},
	{723.2746,  -1495.9520, 4.7723,   723.9611,  -1515.9401, 1.7724},
	{978.6209,  -1197.3568, 60.3330,  998.3764,  -1194.2395, 63.3328},
	{1805.8369, -1301.4531, 121.4892, 1787.0469, -1294.6019, 124.4890},
	{1678.8044, -1241.5515, 129.8754, 1690.5507, -1257.7386, 132.8747},
	{1418.5927, -988.1676,  62.1543,  1420.3472, -968.2446,  59.1542},
	{2170.1069, -1051.8825, 64.6203,  2151.0822, -1058.0520, 70.6205}
};

//Itens
enum itemInfo
{
	itemName[64],
	itemValue
}

new Itens[][itemInfo] = {
	{"Celular",				500},
	{"Visao-Noturna",    	300},
	{"Galao",               200},
	{"Mochila",             300}
};

//Explosivos
enum explosiveInfo
{
	expName[64],
	expValue,
	expLimit
}

new Explosives[][explosiveInfo] = {
    {"Bomba-Relogio",    			500,   		1},
	{"Bomba c/ sensor aprox.",     	700,   		1},
	{"Bomba Remota",     			700,   		1},
	{"Bomba de gas",                100,        2},
	{"Flash",           			200,    	2},
	{"Rojao",           			100,    	2}
};

//Banco
new Float:CashDesks[][4] = {
	{2316.6157,    -12.5012,   26.7421,    267.0591},
	{2316.5209,    -9.8417,    26.7421,    267.6858},
	{2316.6196,    -4.6564,    26.7421,    270.1925},
	{2316.6164,    -1.9108,    26.7421,    272.3858},
	{2308.8811,    -2.1851,    26.7421,    90.3608},
	{2309.1923,    -8.6288,    26.7421,    91.3008}
};

//Armas
enum weaponInfo
{
	wName[64],
	wValue,
	wAmmo,
	wAmmoLimit,
	wObjectId,
	wSkill,
	wSlot
}
            
new Weapons[][weaponInfo] = {
	{"Mão livre",							0,			0,			-1,			0,				-1,								0},
	{"Soco Inglês",							50,			0,			-1,			331,			-1,								0},
	{"Taco de Golfe",						300,		0,			-1,			333,			-1,								1},
	{"Cacetete",							100,		0,			-1,			334,			-1,								1},
	{"Faca",								300,		0,			-1,			335,			-1,								1},
	{"Taco de Baseball",					200,		0,			-1,			336,			-1,								1},
	{"Shovel",								150,		0,			-1,			337,			-1,								1},
	{"Taco de Sinuca",						100,		0,			-1,			338,			-1,								1},
	{"Katana",								300,		0,			-1,			339,			-1,								1},
	{"Motosserra",							500,		0,			-1,			341,			-1,								1},
	{"Vibrador roxo de duas pontas",		50,			0,			-1,			321,			-1,								10},
	{"Vibrador branco grande",				50,			0,			-1,			322,			-1,								10},
	{"Vibrador branco médio",				50,			0,			-1,			323,			-1,								10},
	{"Vibrador prata pequeno",				50,			0,			-1,			324,			-1,								10},
	{"Flores",								50,			0,			-1,			325,			-1,								10},
	{"Bengala",								50,			0,			-1,			326,			-1,								10},
	{"Granada",								600,		1,			3,			342,			-1,								8},
	{"Bomba de gás",						200,		1,			3,			343,			-1,								8},
	{"Molotov",								500,		1,			3,			344,			-1,								8},
	{"Lança Foguetes",						0,			0,			-1,			0,				-1,								8},
	{"Lança-Foguetes Tele-guiado",			0,			0,			-1,			0,				-1,								-1},
	{"Hydra Rocket",						0,			0,			-1,			0,				-1,								-1},
	{"Pistola 9mm",							200,		10,			90,			346,			WEAPONSKILL_PISTOL,				2},
	{"Pistola 9mm c/ silenciador",			250,		10,			90,			347,			WEAPONSKILL_PISTOL_SILENCED,	2},
	{"Desert Eagle",						400,		12,			60,			348,			WEAPONSKILL_DESERT_EAGLE,		2},
	{"Escopeta Calibre 12",					600,		10,			30,			349,			WEAPONSKILL_SHOTGUN,			3},
	{"Escopeta de Cano Serrado",			700,		16,			64,			350,			WEAPONSKILL_SAWNOFF_SHOTGUN,	3},
	{"Escopeta de Combate",					600,		15,			60,			351,			WEAPONSKILL_SPAS12_SHOTGUN,		3},
	{"Micro Uzi",							400,		50,			350,		352,			WEAPONSKILL_MICRO_UZI,			4},
	{"MP5",									400,		60,			360,		353,			WEAPONSKILL_MP5,				4},
	{"AK47",								600,		30,			150,		355,			WEAPONSKILL_AK47,				5},
	{"M4",									600,		30,			150,		356,			WEAPONSKILL_M4,					5},
	{"Tec9",								400,		50,			350,		372,			WEAPONSKILL_MICRO_UZI,			4},
	{"Country Rifle",						700,		10,			30,			357,			WEAPONSKILL_SNIPERRIFLE,		6},
	{"Sniper Rifle",                        800,		10,			30,			358,			WEAPONSKILL_SNIPERRIFLE,		6},
	{"Bazuca",                     			1000,		1,			3,			359,			-1,								7},
	{"Canhao",        						1200,		1,			3,			360,			-1,								7},
	{"Lança Chamas",                        1000,		20,			120,		361,			-1,								7},
	{"Minigun",                             5000,		30,			150,		362,			-1,								7},
	{"Sachtel Charges",                     500,		1,			3,			363,			-1,								8},
	{"Detonador",                           0,			0,			-1,			0,				-1,								12},
	{"Spray",                               200,		50,			150,		365,			-1,								9},
	{"Extintor de incendio",                200,		50,			150,		366,			-1,								9},
	{"Camera",                              50,			5,			20,			367,			-1,								9},
	{"Nightvision",                         300,		0,			-1,			0,				-1,								11},
	{"Heatvision",                          300,		0,			-1,			0,				-1,								11},
	{"Paraquedas",                          50,			0,			-1,			371,			-1,								11}
};

new WeaponSlots[][] = {
	"Soco ingles",
	"Armas brancas",
	"Revolveres",
	"Escopetas",
	"Uzi",
	"Rifles",
	"Snipers",
	"Anti-Tanque/Minigun",
	"Granadas",
	"Diversas",
	"Itens",
	"Equipamentos",
	"Detonador"
};

new HandgunObject[MAX_SLOTS];
new Float:HandgunObjectOffsetX[MAX_SLOTS];

enum droppedweaponInfo
{
	dwWeaponId,
	dwAmmo,
	dwObjectId,
	dwTimer,
	dwExist
}

new DroppedWeapons[MAX_DROPPED_WEAPONS][droppedweaponInfo];
new DroppedWeapon[MAX_SLOTS] = 0;

//Speaks
new Speaks[][128] = {
	{" "},
	{"Affirmative!"},
	{"Negative!"},
	{"Go go go!"},
	{"Need help!"},
	{"Team, fall back!"},
	{"Cover me!"},
	{"Follow me!"},
	{"Enemy down!"},
	{"Regroup team!"},
	{"Taking fire, need assistance!"},
	{"You take the point."},
	{"Enemy spotted!"},
	{"Mission completed, sir!"}
};

new SpeakId[MAX_SLOTS] = 0;
new SpeakTimer[MAX_SLOTS] = 0;
new Radio[MAX_SLOTS] = 0;

//Mochila
new BackpackObject[MAX_SLOTS];

//Alimentos
new DonutsFlavor[][64] = {
	"Creme",
	"Chocolate",
	"Morango",
	"Baunilha"
};

new PizzasFlavor[][64] = {
	"Calabresa",
	"Frango c/ catupiry",
	"Atum",
	"Milho",
	"Strogonoff",
	"Palmito"
};

new ChickensFlavor[][64] = {
    "Frango ao molho",
    "Frango a milanesa",
	"Sanduiche de frango",
	"Espetinho de frango",
	"Salada"
};

new BurgersFlavor[][64] = {
	"X-Burger",
	"X-Salada",
	"X-Calabresa",
	"X-Frango",
	"X-Bacon",
	"X-Egg",
	"Cachorro quente"
};

enum drinkInfo
{
	drinkName[64],
	drinkAction
}

new Drink[][drinkInfo] = {
	{"Refrigerante",    SPECIAL_ACTION_DRINK_SPRUNK},
	{"Cerveja",    		SPECIAL_ACTION_DRINK_BEER},
	{"Whisky",    		SPECIAL_ACTION_DRINK_WINE}
};

new Food[][64] = {
    "File",
    "Alcatra",
	"Lasanha",
	"Peixe",
	"Strogonoff",
	"Salada"
};

//Areas
enum areaInfo
{
	areaName[64],
	areaId,
	Float:areaRadi,
	Float:areaX,
	Float:areaY,
	Float:areaZ,
	areaMapIconId,
	areaPickupId
}

new Areas[][areaInfo] = {
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		327.9709,    	-1513.6151,    	36.0390,	22,		1240},
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		1172.8804,    	-1323.5629,    	15.3993,	22,		1240},
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		2024.9023,    	-1402.1883,    	17.2065,	22,		1240},
	{"Oficina", 			AREA_CUSTOM_SHOP, 		10.0,		2129.3134,    	-1135.6182,    	25.6255,	27},
	{"Tuning Life",         AREA_MOD_SHOP,          10.0,       1653.8280,		-1837.3652,		14.0000,    27,     3096},
	{"Posto",               AREA_GAS_STATION,   	10.0,		1942.3759,    	-1772.7578,    	13.6406,	55},
	{"Posto",               AREA_GAS_STATION,   	10.0,		1003.9216,    	-937.5537,    	42.3281,	55},
	{"Posto",               AREA_GAS_STATION,       10.0,       -90.9226,    	-1168.8415,    	2.4227,     55}
};

new Area[MAX_SLOTS] = 0;

//Empregos
enum jobInfo
{
	jobName[64],
	jobPayday,
	jobColour,
	jobLevel,
	jobHabT,
	jobHabN,
	jobHabA,
	jobSkins[4]
}

new Jobs[][jobInfo] = {
	{"None",                    0,          COLOUR_GRAY,                    0,      0,  0,  0,      {0}},
	{"Desempregado",			0,			COLOUR_DESEMPREGADO,			0,		0,	0,	0,		{0}},
	{"Taxista",         		500,    	COLOUR_TAXISTA,          		0,		1,	0,	0,		{0}},
	{"Barman",          		500,    	COLOUR_BARMAN,           		0,		0,	0,	0,		{171, 189}},
	{"Pizzaboy",            	600,    	COLOUR_PIZZABOY,         		0,		1,	0,	0,		{155, 209}},
	{"Lixeiro",                 500,        COLOUR_LIXEIRO,                 10,     1,  0,  0,      {16}},
	{"Frentista",       		400,    	COLOUR_FRENTISTA,        		20,		0,	0,	0,		{0}},
	{"Maquinista",   			400,    	COLOUR_MAQUINISTA, 				30,		1,	0,	0,		{0}},
	{"Caminhoneiro",            500,        COLOUR_CAMINHONEIRO,            30,		1,	0,	0,		{0}},
	{"Jornalista",              700,    	COLOUR_JORNALISTA,             	50,		1,	0,	1,		{0}},
	{"Mecanico",                600,    	COLOUR_MECANICO,             	50,		1,	0,	0,		{50,  268}},
	{"Paramedico",      		700,    	COLOUR_PARAMEDICO,       		60,		1,	0,	0,		{274, 275, 276}},
	{"Policial Militar",    	600,    	COLOUR_POLICIAL_MILITAR, 		60,		1,	0,	0,		{280, 281, 282}},
	{"Advogado",                1000,	    COLOUR_ADVOGADO,                70,		0,	0,	0,		{0}},
	{"Policial SWAT",       	1500,   	COLOUR_POLICIAL_SWAT,    		80,		1,	0,	1,		{285}},
	{"Traficante",          	1000,   	COLOUR_TRAFICANTE,       		80,		0,	0,	0,		{28,  29,  30}},
	{"Delegado",            	3000,   	COLOUR_DELEGADO,         		100,	1,	0,	1,		{125, 126}},
	{"Juiz",                    4000,   	COLOUR_JUIZ,                 	100,	0,	0,	0,		{187}}
};

//Comandos de profissoes
enum jCmdInfo
{
	jCmd[128],
	jDescription[128],
	jJobs[6]
}

new JobCommands[][jCmdInfo] = {
	{"/r [texto]", 													"Comunica-se com seus companheiros de profissão.", 						{TAXISTA, PARAMEDICO, POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO, MAQUINISTA}},
    {"/pegarlata", 													"Inicia a coleta de latas pela cidade.",  								{DESEMPREGADO}},
	{"/minhaslatas", 												"Ver a quantidade de latas que você coletou.",  						{DESEMPREGADO}},
	{"/pararcoleta",    											"Finaliza a coleta de latas pela cidade.",  							{DESEMPREGADO}},
	{"/venderlatas",    											"Vende as latas coletadas.",  											{DESEMPREGADO}},
	{"/taximetro [id]",												"Inicia o taximetro para um passageiro.",  								{TAXISTA}},
	{"/entregas",    												"Inicia a entrega de pacotes pela cidade.",  							{TAXISTA}},
	{"/pararentregas",  											"Finaliza a entrega de pacotes pela cidade.",  							{TAXISTA}},
	{"/informarservico",    										"Informar seu serviço de transporte.",  								{TAXISTA}},
	{"/abastecerveiculo [litros]", 									"Abastecer um veiculo próximo a você.",  								{FRENTISTA}},
	{"/frete",														"Iniciar o frete de um posto até a refinaria.", 						{FRENTISTA}},
	{"/bebida [id] [cerveja/whisky/refrigerante]", 					"Oferecer uma bebida a um jogador.",  									{BARMAN}},
	{"/entregarbebidas",											"Abastecer um local com bebidas.",  									{BARMAN}},
	{"/abastecimentos",												"Verificar os locais que necessitam bebidas.",  						{BARMAN}},
	{"/curativo [id]",												"Aplicar curativo em um jogador.",  									{PARAMEDICO}},
	{"/tratamento [id]",											"Realiza o tratamento para remover alcool e drogas no sangue.", 		{PARAMEDICO}},
	{"/salvar [id]",												"Salvar um jogador, ele deve estar inconsciente.",  					{PARAMEDICO}},
	{"/vacinar [id]",												"Vacinar um jogador contra a gripe suína.",  							{PARAMEDICO}},
	{"/venderremedio [id] [quantidade]",							"Vende remédios para a gripe suína para um jogador.",  					{PARAMEDICO}},
	{"/pegarkit",													"Pegar o kit médico para poder realizar curativos e tratamentos.",  	{PARAMEDICO}},
    {"/policia",													"Ver os policiais conectados no servidor e seus cargos.",				{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/prender [id]",												"Aprisionar um jogador.",  												{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/bafometro [id]",												"Realizar o teste do bafometro em um jogador.",  						{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/multar [pessoa/veiculo] [id] [quantidade]",					"Aplicar uma multa em um jogador ou veiculo.",  						{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/fiscalizar [id] [armas/celular/chavesmestras/porte/skin]",	"Fiscalizar objetos de um jogador.",  									{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/revistar [id]",												"Revistar um jogador.",  												{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/apreenderveiculo",											"Apreender um veículo por dívidas.",  									{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/checarficha [id]",											"Checar a ficha criminal de um jogador.",  								{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
	{"/algemar [id]",												"Algemar um jogador.",  												{POLICIAL_MILITAR, POLICIAL_SWAT, DELEGADO}},
    {"/localizar [id]",												"Localizar um jogador procurado.",  									{POLICIAL_SWAT, DELEGADO}},
	{"/soltar [id]",												"Libertar um jogador da prisão.", 	 									{POLICIAL_SWAT, DELEGADO}},
    {"/procurar [id]",												"Colocar um jogador na lista de procurados.",  							{DELEGADO}},
	{"/desprocurar [id]",											"Remover um jogador da lista de procurados.",  							{DELEGADO}},
    {"/promover [id]",												"Promover um jogador na carreira policial.",  							{DELEGADO}},
    {"/rebaixar [id]",												"Rebaixar um jogador na carreira policial.",  							{DELEGADO}},
	{"/pegardroga",													"Criar o CheckPoint para adquirir drogas para vender.",  				{TRAFICANTE}},
	{"/venderdroga [id] [maconha/cocaina/heroina] [quantidade]",	"Vender drogas para um jogador.",  										{TRAFICANTE}},
	{"/assaltar",													"Iniciar um assalto em um Banco.",										{TRAFICANTE}},
	{"/desmanche",													"Vender um veículo para o desmanche.",									{TRAFICANTE}},
	{"/desmanchevalor",												"Ver a atual oferta do desmanche.",  									{TRAFICANTE}},
	{"/roubar [id]",												"Tenta assaltar um jogador.",	  										{TRAFICANTE}},
    {"/abastecermobilete",											"Abastecer sua mobilete com 5 pizzas, você deve estar na Pizzaria.",	{PIZZABOY}},
	{"/pizza [id]",													"Vender pizza para um jogador.",  										{PIZZABOY}},
	{"/entregarpizza",												"Iniciar as entregas automáticas de pizza",  							{PIZZABOY}},
	{"/pararentregas",												"Parar as entregas automáticas de pizza",  								{PIZZABOY}},
    {"/consertar [id]",												"Consertar um veículo.",  												{MECANICO}},
	{"/pintar [cor 1] [cor 2]",										"Pintar um veículo.",  													{MECANICO}},
	{"/instalar [kit/fume/airbag]",									"Instalar acessórios em um veículo",  									{MECANICO}}
};

//Empresas
enum companyInfo
{
	cType[64],
	cName[64],
	cFile[64],
	cValue,
	cJob,
	Float:cX,
	Float:cY,
	Float:cZ,
	cMapIconId
}

new Companies[][companyInfo] = {
	{"None",            					"None",                				"None",				0,              DESEMPREGADO,           0.0, 			0.0,			0.0},
	{"Companhia de Taxi",					"Life Taxi and Cia",          		"Taxi",				80000,			TAXISTA,				1742.4248,    	-1863.8626,    	13.5745,	42},
	{"Bar",	 								"Beber, cair e beber denovo",  		"Bar",				60000,			BARMAN,					2322.8696,    	-1646.3642,    	14.8270},
	{"Pizzaria", 							"A vida é massa",        			"Pizza",			60000,			PIZZABOY,				2098.5437,    	-1806.6945,    	13.5546},
	{"Lixao",                               "Cof Cof",                          "Trash",            50000,          LIXEIRO,                2191.3544,    	-1970.7531,    	13.5599,    51},
	{"Posto",								"Life's Fuel", 						"Fuel",				120000,			FRENTISTA,				1930.1732,    	-1786.1994,    	13.5468},
	{"Hospital",							"Guardians Life",           		"Hospital",			0,				PARAMEDICO,         	2036.6701,    	-1409.8912,    	17.1640},
	{"Delegacia",	      					"Defenders of the law",				"Police",			0,				POLICIAL_MILITAR,   	1545.6605,    	-1675.6268,    	13.5607},
	{"Noticiario",                          "Life's News",                      "News",             120000,         JORNALISTA,             732.8124,    	-1358.3757,    	23.5792,    58},
	{"Oficina",			    				"Alegria do carro",					"Custom",			75000,			MECANICO,               2131.8483,    	-1150.6437,    	24.1351},
	{"Companhia de Transportes Publicos",  	"Carona do Estado",					"Transport",		0,              MAQUINISTA,   			1753.6323,    	-1894.3092,    	13.5571,	56},
	{"Laboratorio de drogas",             	"Palacio do Crack",					"Crack",			150000,         TRAFICANTE,             2154.9685,    	-1012.8515,    	62.9597,	16},
	{"Advocacia",   						"Life & Advogados Associados",		"Lawyer",			140000,         ADVOGADO,               1207.4970,    	-1438.9748,    	13.3828,	60},
	{"Tribunal",                			"Ordem e Justiça",  				"Tribunal",			0,              JUIZ,                   1481.4100,    	-1750.1783,    	15.4453}
};

new Company[MAX_SLOTS] = 0;

//Interiores
enum intInfo
{
	intName[64],
	intMapIconId,
	intPickupId,
	Float:intX,
	Float:intY,
	Float:intZ,
	intInt
}

new Ints[][intInfo] = {
    {"Banco",					52,			1274,			2304.9233,			-16.1500,			26.7422,			0},
    {"24/7",   					61,			1314,       	-25.6997,    		-141.5493,    		1003.5468,      	16},
	{"Loteria",					25,			1274,			-2158.9619,			643.1372,			1052.3750,			1},
	{"Loteria de Cavalos",		25,			1274,			834.6589,			7.5835,				1004.1870,			3},
	{"Discoteca",				48,			1318,			493.3904,			-24.8727,			1000.6797,			17},
	{"Boate",					21,			1240,			1204.7952,    		-13.8479,    		1000.9218,			2},
	{"Restaurante",				50,			2804,			681.5834,    		-451.5157,    		-25.6171,			1},
	{"Bar",						49,			1543,			-229.2940,    		1401.1772,    		27.7656,			18},
	{"Binco",					45,			1275,			207.6461,    		-111.2516,    		1005.1328,			15},
	{"Victim",					45,			1275,			227.3106,    		-8.0155,    		1002.2109,			5},
	{"Sub Urban",               45,         1275,           203.9669,    		-50.6596,    		1001.8046,          1},
	{"Ammu Nation",				6,			355,			315.6814,			-143.6524,			999.6016,			7},
	{"Loja de Donuts",			10,			2222,			376.9800,			-193.3057,			1000.6328,			17},
	{"Pizzaria",				29,			2220,			372.2168,    		-133.5224,    		1001.4921,			5},
	{"Cluckin Bell",			14,			2217,			364.8025,    		-11.5283,    		1001.8515,			9},
	{"Burger Shot",				10,			2212,			362.8225,    		-75.1082,    		1001.5078,    		10},
	{"Delegacia",				30,			1247,			246.7658,    		62.3306,   			1003.6406,			6},
	{"Tribunal",				42,			1247,			246.4103,			107.3036,			1003.2188,			10},
	{"Seguradora",				59,			1240,			2161.0681,    		1602.3133,    		999.9813,			1},
	{"Imobiliaria",          	62,         1277,           2161.0681,    		1602.3133,    		999.9813,          	1},
	{"Interrogatorio",          0,          1247,           322.0925,    		302.3671,    		999.1484,          	5},
	{"Loja de Brinquedos",      55,         1277,           -2240.7797,    		137.2012,    		1035.4140,          6}
};
		    
enum enterInfo
{
	intId,
	Float:enterX,
	Float:enterY,
	Float:enterZ,
	enterVirtualWorld,
	enterInt,
	enterPrev
}

new Enters[][enterInfo] = {
    {INT_BANK,					1778.9866,		-1663.1512,		14.4378,		1},
    {INT_BANK,					1309.9051,    	-1367.6707,    	13.5386,		2},
    {INT_BANK,					2861.1401,    	-1440.1130,    	10.9375,		3},
    {INT_BANK,					419.7694,    	-1428.4282,    	32.4906,		4},
	{INT_24/7_SHOP,				1929.2303,    	-1776.2890,    	13.5468,		1},
	{INT_24/7_SHOP,				1833.7675,    	-1842.4935,    	13.5781,		2},
	{INT_24/7_SHOP,				1352.5648,    	-1759.2410,    	13.5078,		3},
	{INT_24/7_SHOP,				1315.5538,    	-897.6950,    	39.5781,		4},
	{INT_24/7_SHOP,				1000.5819,    	-919.8594,    	42.3281,		5},
	{INT_24/7_SHOP,             -78.6046,    	-1169.6219,    	2.1435,         6},
	{INT_LOTTERY,    	 		1739.3049,		-1582.2778,		14.1538},
	{INT_HORSE_LOTTERY,     	1631.8197,		-1172.9270,		24.0843},
	{INT_DISCO,     			1836.9982,		-1682.4395,		13.3245},
	{INT_STRIP_CLUB,     		2421.4727,		-1219.2466,		25.5617},
	{INT_RESTAURANT,     		1578.5620,    	-1781.2532,    	13.2820},
	{INT_BAR,     				2309.9421,		-1643.3970,		14.8270},
	{INT_BINCO,     			2244.3374,		-1665.5439,		15.4766},
	{INT_VICTIM,                461.6965,    	-1500.8066,    	31.0454},
	{INT_GUN_SHOP,     			1368.7594,		-1279.9406,		13.5469,		1},
	{INT_GUN_SHOP,     			2400.3770,		-1981.9899,		13.5469,		2},
	{INT_DONUTS_SHOP,    		1038.0264,		-1340.7273,		13.7450},
	{INT_CLUCKIN_BELL,    		928.9063,    	-1352.7833,    	13.3437,		1},
	{INT_CLUCKIN_BELL,    		2419.7690,    	-1509.0211,    	24.0000,		2},
	{INT_CLUCKIN_BELL,    		2397.7150,    	-1899.1584,    	13.5468,		3},
	{INT_PIZZARIA,    			2105.1533,    	-1806.5140,    	13.5546},
	{INT_BURGER_SHOT,    		810.4860,    	-1616.1186,    	13.5468,		1},
	{INT_BURGER_SHOT,    		1199.3444,    	-918.3958,    	43.1207,		2},
	{INT_POLICE_DEPARTMENT,    	1555.3104,		-1675.4611,		16.1953},
	{INT_TRIBUNAL,    			1481.1106,		-1770.5613,		18.7958},
	{INT_INSURER,               288.0831,    	-1601.6064,    	32.7656,		1},
	{INT_REAL_ESTATE,           1381.3723,    	-1088.7031,    	27.4076,		2},
	{INT_QUESTIONING,           246.3487,    	88.0000,    	1003.6406,      0,	6,	-4},
	{INT_TOY_SHOP,              816.0571,    	-1386.0935,    	13.5971}
};

new Enter[MAX_SLOTS] = 0;
new Door[MAX_SLOTS] = 0;

//Checkpoints
enum cpInfo
{
	cpId,
	Float:cpX,
	Float:cpY,
	Float:cpZ,
	Float:cpSize,
	Float:cpRadi,
	cpInt,
	cpVirtualWorld
}

new Checkpoints[][cpInfo] = {
	{CHECKPOINT_AMMUNATION,		307.9372,	-141.4641,	999.6016,	2.0,	10.0,	7},
	{CHECKPOINT_DONUTS,         379.2017,	-184.1104,	1000.6328,  2.0,    10.0,   17},
	{CHECKPOINT_PIZZA,        	373.6723,   -118.8036,  1001.4921,  2.0,    10.0,   5},
	{CHECKPOINT_CHICKEN,        369.4777,   -6.0215,    1001.8515,  2.0,    10.0,   9},
	{CHECKPOINT_BURGER,         376.7625,   -67.4363,   1001.5078,  2.0,    10.0,   10},
	{CHECKPOINT_DRINKS,         499.9699,   -20.6398,   1000.6796,  2.0,    10.0,   17},
	{CHECKPOINT_DRINKS,     	1215.8127,  -13.3527,   1000.9218,  2.0,    10.0,   2},
	{CHECKPOINT_DRINKS,         -224.9938,  1404.3552,  27.7734,  	2.0,    10.0,   18},
	{CHECKPOINT_RESTAURANT,     679.0607,   -456.7506,  -25.6098,   2.0,    10.0,   1},
	{CHECKPOINT_24/7_SHOP,      -22.1761,   -138.6281,  1003.5468,  2.0,    10.0,   16},
	{CHECKPOINT_TOY_SHOP,       -2236.8002, 130.1802,   1035.4140,  2.0,    10.0,   6}
};

new Checkpoint[MAX_SLOTS];
new CheckpointStatus[MAX_SLOTS];

//Dias
new Days[][64] = {
    "Domingo",
	"Segunda-Feira",
	"Terca-Feira",
	"Quarta-Feira",
	"Quinta-Feira",
	"Sexta-Feira",
	"Sabado"
};

//Gangues
new GangPosts[][64] = {
	"None",
	"Soldado",
	"Piloto",
	"Olheiro",
	"Fogueteiro",
	"Traficante",
	"Torre",
	"Braco direito",
	"Lider"
};
	
enum gangcolourInfo
{
	gColourName[64],
	gColourHex
}

new GangColours[][gangcolourInfo] = {
	{"Branco", 				0xFFFFFF55},
	{"Preto",   			0x00000055},
	{"Vermelho",   			0xFF000055},
	{"Vermelho-Escuro",     0x8B000055},
	{"Verde",   			0x00FF0055},
	{"Verde-Claro",         0x90EE9055},
	{"Verde-Escuro",        0x00640055},
	{"Azul",        		0x0000FF55},
	{"Azul-Claro",      	0xADD8E655},
	{"Azul-Escuro",     	0x4169E155},
	{"Azul-Ceu",          	0x87CEFA55},
	{"Navy",                0x00008055},
	{"Aqua",                0x7FFFD455},
	{"Ciano",               0x00FFFF55},
	{"Magenta",             0xFF00FF55},
	{"Amarelo",     		0xFFFF0055},
	{"Cinza",       		0xB5B5B555},
	{"Laranja",     		0xFF450055},
	{"Rosa",        		0xFFC0CB55},
	{"Dourado",     		0xFFD70055},
	{"Roxo",            	0xA020F055},
	{"Marrom",              0x8B451355}
};

enum gangzoneInfo
{
	gzName[27],
	Float:gzMinX,
	Float:gzMinY,
	Float:gzMaxX,
	Float:gzMaxY,
	gzId,
	gzAttacker,
	gzScore,
	gzTimer
}

new GangZones[][gangzoneInfo] = {
	{"Commerce",					1323.90,	-1842.20,   1701.90, 	-1722.20},
	{"Commerce",                    1323.90, 	-1722.20,   1440.90, 	-1577.50},
	{"Commerce",                    1370.80, 	-1577.50,   1463.90, 	-1384.90},
	{"Commerce",                    1463.90, 	-1577.50,   1667.90, 	-1430.80},
	{"Commerce",                    1583.50, 	-1722.20,   1758.90, 	-1577.50},
	{"Commerce",                    1667.90, 	-1577.50,   1812.60, 	-1430.80},
	{"East Beach",                  2632.80, 	-1852.80,   2959.30, 	-1668.10},
	{"East Beach",                  2632.80, 	-1668.10,   2747.70, 	-1393.40},
	{"East Beach",                  2747.70, 	-1668.10,   2959.30, 	-1498.60},
	{"East Beach",                  2747.70, 	-1498.60,   2959.30, 	-1120.00},
	{"East Los Santos",             2421.00, 	-1628.50,   2632.80, 	-1454.30},
	{"East Los Santos",             2222.50, 	-1628.50,   2421.00, 	-1494.00},
	{"East Los Santos",             2266.20, 	-1494.00,   2381.60, 	-1372.00},
	{"East Los Santos",             2381.60, 	-1494.00,   2421.00, 	-1454.30},
	{"East Los Santos",             2281.40, 	-1372.00,   2381.60, 	-1135.00},
	{"East Los Santos",             2381.60, 	-1454.30,   2462.10, 	-1135.00},
	{"East Los Santos",             2462.10, 	-1454.30,   2581.70, 	-1135.00},
	{"Ganton",                      2222.50, 	-1852.80,   2632.80, 	-1722.30},
	{"Ganton",                      2222.50, 	-1722.30,   2632.80, 	-1628.50},
	{"Glen Park",                   1812.60, 	-1449.60,   1996.90, 	-1350.70},
	{"Glen Park",                   1812.60, 	-1100.80,   1994.30,  	-973.30},
	{"Glen Park",                   1812.60, 	-1350.70,   2056.80, 	-1100.80},
	{"Idlewood",                    1812.60, 	-1852.80,   1971.60, 	-1742.30},
	{"Idlewood",                    1812.60, 	-1742.30,   1951.60, 	-1602.30},
	{"Idlewood",                    1951.60, 	-1742.30,   2124.60, 	-1602.30},
	{"Idlewood",                    1812.60, 	-1602.30,   2124.60, 	-1449.60},
	{"Idlewood",                    2124.60, 	-1742.30,   2222.50, 	-1494.00},
	{"Idlewood",                    1971.60, 	-1852.80,   2222.50, 	-1742.30},
	{"Jefferson",                   2124.60, 	-1494.00,   2266.20, 	-1449.60},
	{"Jefferson",                   2056.80, 	-1372.00,   2281.40, 	-1210.70},
	{"Jefferson",                   2056.80, 	-1210.70,   2185.30, 	-1126.30},
	{"Jefferson",                   2185.30, 	-1210.70,   2281.40, 	-1154.50},
	{"Jefferson",                   2056.80, 	-1449.60,   2266.20, 	-1372.00},
	{"Las Colinas",                 1994.30, 	-1100.80,   2056.80, 	-920.80},
	{"Las Colinas",                 2056.80, 	-1126.30,   2126.80,  	-920.80},
	{"Las Colinas",                 2185.30, 	-1154.50,   2281.40,  	-934.40},
	{"Las Colinas",                 2126.80, 	-1126.30,   2185.30,  	-934.40},
	{"Las Colinas",                 2747.70, 	-1120.00,   2959.30,  	-945.00},
	{"Las Colinas",                 2632.70, 	-1135.00,   2747.70,  	-945.00},
	{"Las Colinas",                 2281.40, 	-1135.00,   2632.70,  	-945.00},
	{"Little Mexico",               1701.90, 	-1842.20,   1812.60, 	-1722.20},
	{"Little Mexico",               1758.90, 	-1722.20,   1812.60, 	-1577.50},
	{"Los Flores",                  2581.70, 	-1454.30,   2632.80, 	-1393.40},
	{"Los Flores",                  2581.70, 	-1393.40,   2747.70, 	-1135.00},
	{"Playa del Seville",           2703.50, 	-2126.90,   2959.30, 	-1852.80},
	{"Unity Station",               1692.60, 	-1971.80,   1812.60, 	-1932.80},
	{"Verdant Bluffs",              930.20, 	-2488.40,   1249.60, 	-2006.70},
	{"Verdant Bluffs",              1073.20, 	-2006.70,   1249.60, 	-1842.20},
	{"Verdant Bluffs",              1249.60, 	-2179.20,   1692.60, 	-1842.20},
	{"Willowfield",                 1970.60, 	-2179.20,   2089.00, 	-1852.80},
	{"Willowfield",                 2089.00, 	-2235.80,   2201.80, 	-1989.90},
	{"Willowfield",                 2089.00, 	-1989.90,   2324.00, 	-1852.80},
	{"Willowfield",                 2201.80, 	-2095.00,   2324.00, 	-1989.90},
	{"Willowfield",                 2541.70, 	-1941.40,   2703.50, 	-1852.80},
	{"Willowfield",                 2324.00, 	-2059.20,   2541.70, 	-1852.80},
	{"Willowfield",                 2541.70, 	-2059.20,	2703.50, 	-1941.40}
};

new GangAttackTimer[MAX_SLOTS];
new GangAttack[MAX_SLOTS] = 0;
new Zone[MAX_SLOTS] = 0;

//Tuning
new Menu:mCusto;
new Menu:mTuning;
new Menu:mCurrentTune;
new RowComponents[20];
new Tunes[17];
new TunnerID = -1;
new TuneVehicle = -1;
new TuneComponent = 0;
new TuneTimer;
new Paintjob = 0;

enum TuneInfo
{
	tuneName[64],
	tuneValue,
	tuneSlot
}

new SimilarComponents[][2] = {
	{1007, 1017},
	{1026, 1027},
	{1030, 1031},
	{1036, 1040},
	{1039, 1041},
	{1042, 1099},
	{1047, 1051},
	{1048, 1052},
	{1056, 1062},
	{1057, 1063},
	{1069, 1071},
	{1070, 1072},
	{1090, 1094},
	{1093, 1095},
	{1106, 1124},
	{1107, 1108},
	{1118, 1120},
	{1119, 1121},
	{1122, 1101},
	{1133, 1102},
	{1143, 1142},
	{1145, 1144}
};

new Components[][TuneInfo] = {
	{"Pro", 								900, 				SPOILERS},
	{"Win", 								750, 				SPOILERS},
	{"Drag", 								800, 				SPOILERS},
	{"Alpha", 								600, 				SPOILERS},
	{"Champ Scoop", 						600, 				HOODS},
	{"Fury Scoop", 							800, 				HOODS},
	{"Roof Scoop", 							180, 				ROOFSCOOPS},
	{"Sideskirt", 							400, 				SIDESKIRTS},
	{"Nitro 2x", 							500, 				NITROS},
	{"Nitro 5x", 							1000, 				NITROS},
	{"Nitro 10x", 							2000, 				NITROS},
	{"Race Scoop", 							1300, 				HOODS},
	{"Worx Scoop", 							1250, 				HOODS},
	{"Round Fog", 							650, 				LAMPS},
	{"Champ", 								1600, 				SPOILERS},
	{"Race", 								1580, 				SPOILERS},
	{"Worx", 								1400, 				SPOILERS},
	{"Sideskirt", 							400, 				SIDESKIRTS},
	{"Upswept", 							800, 				EXHAUSTS},
	{"Twin", 								600, 				EXHAUSTS},
	{"Large", 								500, 				EXHAUSTS},
	{"Medium", 								300, 				EXHAUSTS},
	{"Small", 								350, 				EXHAUSTS},
	{"Fury", 								500, 				SPOILERS},
	{"Square Fog", 							500, 				LAMPS},
	{"Off Road", 							1200, 				WHEELS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien Roof", 							800, 				ROOFSCOOPS},
	{"X-Flow Roof", 						600, 				ROOFSCOOPS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"X-Flow Roof", 						600, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien Roof", 							800, 				ROOFSCOOPS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Chrome", 								900, 				SIDESKIRTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"X-Flow", 								600, 				ROOFSCOOPS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"X-Flow", 								600, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"X-Flow", 								600, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Shadow", 								700, 				WHEELS},
	{"Mega", 								1030, 				WHEELS},
	{"Rimshine", 							1800, 				WHEELS},
	{"Wires", 								1560,	 			WHEELS},
	{"Classic", 							1650, 				WHEELS},
	{"Twist", 								1900, 				WHEELS},
	{"Cutter", 								1100, 				WHEELS},
	{"Switch", 								2100, 				WHEELS},
	{"Grove", 								1230, 				WHEELS},
	{"Import", 								1050, 				WHEELS},
	{"Dollar", 								1760, 				WHEELS},
	{"Trancer", 							1350, 				WHEELS},
	{"Atomic", 								1550, 				WHEELS},
	{"Stereo", 								350, 				STEREO},
	{"Hydraulics", 							1600, 				HYDRAULICS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow",	 							600, 				ROOFSCOOPS},
	{"Alien", 								1300,		 		EXHAUSTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750,	 			SIDESKIRTS},
	{"Ahab", 								1700, 				WHEELS},
	{"Virtual",								850, 				WHEELS},
	{"Access", 								1200, 				WHEELS},
	{"Chrome", 								900, 				SIDESKIRTS},
	{"Chrome Grill", 						1200, 				BULLBARS},
	{"Chrome Flames", 						1700, 				SIDESKIRTS},
	{"Chrome Strip", 						1400, 				SIDESKIRTS},
	{"Convertible", 						1300, 				ROOFSCOOPS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome Arches", 						1500, 				SIDESKIRTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Chrome", 								2180, 				REARBULLBARS},
	{"Slamin", 								2100, 				REARBULLBARS},
	{"Little Sign 1",					 	1000, 				FRONTSIGN},
	{"Little Sign 2", 						1200, 				FRONTSIGN},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome", 								2200, 				FRONTBULLBARS},
	{"Slamin", 								2100, 				FRONTBULLBARS},
	{"Chrome", 								1800, 				FRONTBUMPERS},
	{"Chrome Trim", 						600, 				SIDESKIRTS},
	{"Wheelcovers", 						750, 				SIDESKIRTS},
	{"Chrome Trim", 						600, 				SIDESKIRTS},
 	{"Wheelcovers", 						750, 				SIDESKIRTS},
 	{"Chrome Flames", 						1700, 				SIDESKIRTS},
 	{"Bullbar Chrome Bars", 				1300,			 	BULLBARS},
 	{"Chrome Arches", 						1500, 				SIDESKIRTS},
	{"Bullbar Chrome Lights", 				1000, 				BULLBARS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Vinyl Hardtop", 						3400, 				ROOFSCOOPS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Hardtop", 							3000, 				ROOFSCOOPS},
	{"Softtop", 							3300, 				ROOFSCOOPS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
 	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1000,		 		SPOILERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Oval", 								900, 				VENTS},
	{"Oval", 								900, 				VENTS},
	{"Square", 								600, 				VENTS},
	{"Square", 								600, 				VENTS},
	{"X-Flow", 								1400, 				SPOILERS},
	{"Alien", 								1000, 				SPOILERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"X-Flow",	 							1800, 				REARBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Alien", 								1800, 				FRONTBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow",	 							1800, 				REARBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								1800, 				REARBUMPERS},
	{"Alien", 								1800, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1800, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1800, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1300, 				FRONTBUMPERS},
	{"Chrome", 								1200, 				FRONTBUMPERS},
	{"Slamin", 								1300,	 			FRONTBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1300, 				REARBUMPERS}
};

new CarMods[][15] = {
	{400, 1018, 1019, 1020, 1021, 1013, 1024, 0,    0,    0,    0,    0,    0,    0,    0},     //Landstalker
	{401, 1001, 1003, 1004, 1005, 1006, 1013, 1019, 1020, 1007, 1017, 1142, 1143, 1144, 1145},  //Bravura
	{404, 1019, 1020, 1021, 1013, 1007, 1017, 1000, 1002, 1016, 0,    0,    0,    0,    0},     //Perenial
	{405, 1018, 1019, 1020, 1021, 1000, 1001, 1014, 1023, 0,    0,    0,    0,    0,    0},     //Sentinel
	{410, 1019, 1020, 1021, 1013, 1024, 1001, 1003, 1023, 1007, 1017, 0,    0,    0,    0},     //Manana
	{415, 1018, 1019, 1001, 1003, 1023, 1007, 1017, 0,    0,    0,    0,    0,    0,    0},     //Cheetah
	{418, 1020, 1021, 1006, 1002, 1016, 0,    0,    0,    0,    0,    0,    0,    0,    0},     //Moonbeam
	{420, 1004, 1005, 1019, 1021, 1001, 1003, 0,    0,    0,    0,    0,    0,    0,    0},     //Taxi
	{421, 1018, 1019, 1020, 1021, 1000, 1014, 1016, 1023, 0,    0,    0,    0,    0,    0},     //Washington
	{422, 1013, 1019, 1020, 1021, 1007, 1017, 0,    0,    0,    0,    0,    0,    0,    0},    	//Bobcat
	{426, 1004, 1005, 1019, 1021, 1001, 1003, 1006, 0,    0,    0,    0,    0,    0,    0},     //Premier
	{436, 1019, 1020, 1021, 1022, 1006, 1013, 1001, 1003, 1007, 1017, 0,    0,    0,    0},     //Previon
	{439, 1142, 1143, 1144, 1145, 1013, 1001, 1003, 1023, 1007, 1017, 0,    0,    0,    0},     //Stallion
	{477, 1018, 1019, 1020, 1021, 1006, 1007, 1017, 0,    0,    0,    0,    0,    0,    0},     //ZR-350
	{478, 1004, 1005, 1012, 1020, 1021, 1022, 1013, 1024, 0,    0,    0,    0,    0,    0},     //Walton
	{489, 1004, 1005, 1018, 1019, 1020, 1013, 1024, 1006, 1000, 1002, 1016, 0,    0,    0},     //Rancher
	{491, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1021, 1003, 1014, 1023, 1007, 1017, 0},     //Virgo
	{492, 1004, 1005, 1000, 1006, 1016, 0,    0,    0,    0,    0,    0,    0,    0,    0},     //Greenwood
	{496, 1001, 1002, 1003, 1006, 1011, 1019, 1020, 1023, 1007, 1017, 1142, 1143, 0,    0},    	//Blista Compact
	{500, 1019, 1020, 1021, 1013, 1024, 0,    0,    0,    0,    0,    0,    0,    0,    0},     //Mesa
	{516, 1004, 1018, 1019, 1020, 1021, 1000, 1002, 1015, 1016, 1007, 1017, 0,    0,    0},     //Nebula
	{517, 1007, 1017, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1002, 1003, 1016, 1023, 0},     //Majestic
	{518, 1001, 1005, 1006, 1013, 1018, 1020, 1023, 1142, 1143, 1144, 1145, 0,    0,    0},     //Buccaneer
	{527, 1018, 1020, 1021, 1001, 1014, 1015, 1007, 1017, 0,    0,    0,    0,    0,    0},     //Cadrona
	{529, 1011, 1012, 1018, 1019, 1020, 1006, 1001, 1003, 1023, 1007, 1017, 0,    0,    0},     //Willard
	{534, 1100, 1101, 1106, 1122, 1123, 1124, 1125, 1126, 1127, 1178, 1179, 1180, 1185, 0},    	//Remington
	{535, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 0},    	//Slamvan
	{536, 1103, 1104, 1105, 1107, 1108, 1128, 1181, 1182, 1183, 1184, 0,    0,    0,    0},    	//Blade
	{540, 1004, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1006, 1024, 1001, 1023, 1007, 1017},  //Vincent
	{542, 1018, 1019, 1020, 1021, 1014, 1015, 1144, 1145, 0,    0,    0,    0,    0,    0},     //Clover
	{546, 1004, 1142, 1143, 1144, 1145, 1018, 1019, 1006, 1024, 1001, 1002, 1023, 1007, 1017},  //Intruder
	{547, 1142, 1143, 1018, 1019, 1020, 1021, 1000, 1003, 1016, 0,    0,    0,    0,    0},     //Primo
	{549, 1011, 1012, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1001, 1003, 1023, 1007, 1017},  //Tampa
	{550, 1004, 1005, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1001, 1003, 1023, 1007, 1017},  //Sunrise
	{551, 1005, 1006, 1018, 1019, 1020, 1021, 1002, 1003, 1016, 1023, 0,    0,    0,    0},     //Merit
	{558, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1163, 1164, 1165, 1166, 1167, 1168},  //Uranus
    {559, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1072, 1158, 1159, 1160, 1161, 1162, 1173}, 	//Jester
	{560, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1138, 1139, 1140, 1141, 1169, 1170}, 	//Sultan
	{561, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1154, 1155, 1156, 1157}, 	//Stratum
	{562, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1146, 1147, 1148, 1149, 1171, 1172}, 	//Elegy
	{565, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1150, 1151, 1152, 1153}, 	//Flash
    {567, 1102, 1129, 1130, 1131, 1132, 1133, 1186, 1187, 1188, 1189, 0,    0,    0,    0},    	//Savanna
	{575, 1042, 1043, 1044, 1099, 1074, 1075, 1076, 1077, 0,    0,    0,    0,    0,    0},    	//Broadway
	{576, 1134, 1135, 1136, 1137, 1190, 1191, 1192, 1193, 0,    0,    0,    0,    0,    0},    	//Tornado
	{580, 1018, 1020, 1001, 1006, 1023, 1007, 1017, 0,    0,    0,    0,    0,    0,    0},     //Stafford
	{585, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1013, 1006, 1001, 1003, 1023, 1007, 1017},  //Emperor
	{589, 1004, 1005, 1144, 1145, 1018, 1020, 1013, 1024, 1006, 1000, 1016, 1007, 1017, 0},     //Club
	{600, 1004, 1005, 1018, 1020, 1022, 1006, 1013, 1007, 1017, 0,    0,    0,    0,    0},     //Picador
	{603, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1013, 1001, 1006, 1023, 1007, 1017, 0}      //Phoenix
};

//Veiculos
enum vehicleInfo
{
	vehModel[64],
	vehValue
}

new Vehicles[212][vehicleInfo] = {
	{"Landstalker",					60000},
	{"Bravura",						32500},
	{"Buffalo",						75000},
	{"Linerunner",					0},
	{"Perenial",					15000},
	{"Sentinel",					40000},
	{"Dumper",						0},
	{"Firetruck",					0},
	{"Trashmaster",					0},
	{"Limosine",					10000},
	{"Manana",						15000},
	{"Infernus",					220000},
	{"Voodoo",						35000},
	{"Pony",						0},
	{"Mule",						0},
	{"Cheetah",						150000},
	{"Ambulance",					0},
	{"Leviathan",					0},
	{"Moonbeam",					0},
	{"Esperanto",					40000},
	{"Taxi",						0},
	{"Washington",					45000},
	{"Bobcat",						25000},
	{"Whoopee",						0},
	{"BF Injection",				30000},
	{"Hunter",						0},
	{"Premier",						45000},
	{"Enforcer",					0},
	{"Securicar",					0},
	{"Banshee",						100000},
	{"Predator",					0},
	{"Bus",							0},
	{"Rhino",						0},
	{"Barracks",					0},
	{"Hotknife",					100000},
	{"Trailer",						0},
	{"Previon",						25000},
	{"Coach",						0},
	{"Taxi",						0},
	{"Stallion",					30000},
	{"Rumpo",						0},
	{"RC Bandit",					800},
	{"Romero",						0},
	{"Packer",						0},
	{"Monster",						0},
	{"Admiral",						40000},
	{"Squalo",						250000},
	{"Seasparrow",					0},
	{"Pizzaboy",					0},
	{"Tram",						0},
	{"Trailer",						0},
	{"Turismo",						200000},
	{"Speeder",						300000},
	{"Reefer",						0},
	{"Tropic",						200000},
	{"Flatbed",						0},
	{"Yankee",						0},
	{"Caddy",						0},
	{"Solair",						40000},
	{"Berkley's RC Van",			0},
	{"Skimmer",						300000},
	{"PCJ-600",						25000},
	{"Faggio",						5000},
	{"Freeway",						30000},
	{"RC Baron",					1000},
	{"RC Raider",					1000},
	{"Glendale",					0},
	{"Oceanic",						30000},
	{"Sanchez",						20000},
	{"Sparrow",						23000},
	{"Patriot",						0},
	{"Quad",						0},
	{"Coastguard",					0},
	{"Dinghy",						25000},
	{"Hermes",						30000},
	{"Sabre",						30000},
	{"Rustler",						0},
	{"ZR-350",						150000},
	{"Walton",						0},
	{"Regina",						0},
	{"Comet",						100000},
	{"BMX",							1000},
	{"Burrito",						0},
	{"Camper",						15000},
	{"Marquis",						400000},
	{"Baggage",						0},
	{"Dozer",						0},
	{"Maverick",					650000},
	{"News Chopper",				0},
	{"Rancher",						70000},
	{"FBI Rancher",					0},
	{"Virgo",						0},
	{"Greenwood",					35000},
	{"Jetmax",						400000},
	{"Hotring",						0},
	{"Sandking",					0},
	{"Blista Compact",				35000},
	{"Police Maverick",				0},
	{"Boxville",					0},
	{"Benson",						0},
	{"Mesa",						0},
	{"RC Goblin",					1000},
	{"Hotring Racer A",				0},
	{"Hotring Racer B",				0},
	{"Bloodring Banger",			0},
	{"Rancher",						0},
	{"Super GT",					250000},
	{"Elegant",						37000},
	{"Journey",						0},
	{"Bike",						500},
	{"Mountain Bike",				2000},
	{"Beagle",						0},
	{"Cropduster",					0},
	{"Stunt",						0},
	{"Tank",						0},
	{"Roadtrain",					70000},
	{"Nebula",						40000},
	{"Majestic",					35000},
	{"Buccaneer",					50000},
	{"Shamal",						0},
	{"Hydra",						0},
	{"FCR-900",						60000},
	{"NRG-500",						15000},
	{"HPV1000",						0},
	{"Cement Truck",				0},
	{"Reboque",						0},
	{"Fortune",						0},
	{"Cadrona",						0},
	{"FBI Truck",					0},
	{"Willard",						0},
	{"Forklift",					0},
	{"Tractor",						0},
	{"Combine Harvester",			0},
	{"Feltzer",						60000},
	{"Remington",					40000},
	{"Slamvan",						45000},
	{"Blade",						40000},
	{"Freight",						0},
	{"Streak",						0},
	{"Vortex",						0},
	{"Vincent",						45000},
	{"Bullet",						250000},
	{"Clover",						30000},
	{"Sadler",						0},
	{"Firetruck",					0},
	{"Hustler",						0},
	{"Intruder",					45000},
	{"Primo",						40000},
	{"Cargobob",					0},
	{"Tampa",						0},
	{"Sunrise",						70000},
	{"Merit",						80000},
	{"Utility",						0},
	{"Nevada",						0},
	{"Yosemite",					0},
	{"Windsor",						0},
	{"Monster",						0},
	{"Monster",						0},
	{"Uranus",						80000},
	{"Jester",						100000},
	{"Sultan",						120000},
	{"Stratum",						100000},
	{"Elegy",						100000},
	{"Raindance",					0},
	{"RC Tiger",					1500},
	{"Flash",						70000},
	{"Tahoma",						50000},
	{"Savanna",						45000},
	{"Bandito",						0},
	{"Freight Flat",				0},
	{"Streak Carriage",				0},
	{"Kart",						0},
	{"Mower",						0},
	{"Dune",						0},
	{"Sweeper",						0},
	{"Broadway",					0},
	{"Tornado",						0},
	{"AT-400",						0},
	{"DFT-30",						0},
	{"Huntley",						0},
	{"Stafford",					0},
	{"BF-400",						25000},
	{"Newsvan",						0},
	{"Tug",							0},
	{"Trailer",						0},
	{"Emperor",						40000},
	{"Wayfarer",					50000},
	{"Euros",						70000},
	{"Hotdog",						0},
	{"Club",						30000},
	{"Freight Box",					0},
	{"Trailer",						0},
	{"Andromada",					0},
	{"Dodo",						0},
	{"RC Cam",						500},
	{"Launch",						0},
	{"Police Car",					0}, // Los Santos
	{"Police Car",					0}, // San Fierro
	{"Police Car",					0}, // Las Venturas
	{"Police Ranger",				0},
	{"Picador",						0},
	{"SWAT Tank",					0},
	{"Alpha",						70000},
	{"Phoenix",						80000},
	{"Glendale",					0},
	{"Sadler",						0},
	{"Luggage",						0},
	{"Luggage",						0},
	{"Stairs",						0},
	{"Boxville",					0},
	{"Farm Trailer",				0},
	{"Trailer",                     0}
};

new Trailers[] = {
	435, 450, 584, 606, 607, 608, 611
};

new RCs[] = {
	441, 464, 465, 501, 564, 594
};

new Bikes[] = {
    448, 461, 462, 463, 468, 481, 509, 510,
    521, 522, 581, 586
};

new Airs[] = {
    417, 425, 447, 460, 469, 476, 487, 488,
	497, 511, 512, 513, 519, 520, 548, 553,
	563, 577, 592, 593,
};

new Boats[] = {
	430, 446, 452, 453, 454, 472, 473, 484,
	493, 595
};
	
new ServerVehicles, PlayerVehicles;
new CTMVehicle[MAX_SLOTS];

//Veiculos de historia
new TAXI_HISTORY[2];

//Veiculos de trabalho
new TAXI[14];
new ON_SALE[25];
new POLICE_CAR[17];
new SCOOTER[19];
new BUS[10];
new TRAIN[1];
new AMBULANCE[16];
new TOWTRUCK[13];
new ROADTRAIN[10];
new TRASHMASTER[11];
new NEWS[10];

//Casas
enum houseInfo
{
	hPickup
}

new Houses[MAX_HOUSES][houseInfo];
new House[MAX_SLOTS] = 0;
new ServerHouses;

enum hintInfo
{
	hintValue,
	Float:hintX,
	Float:hintY,
	Float:hintZ,
	hintInt
}

new HouseInteriors[][hintInfo] = {
	{10000,		243.7243,   	304.9308,		999.1484,		1},
	{15000,		266.5161,   	305.0509,   	999.1484,    	2},
	{20000,		2233.9179,  	-1115.2563,    	1050.8828,    	5},
	{25000,		2218.3828,		-1075.9064,    	1050.4843,   	1},
    {30000,		2282.7851,  	-1140.2812,    	1050.8984,    	11},
	{35000,		223.2462,   	1287.0926,    	1082.1406,    	1},
	{40000,		-42.5199,   	1405.4766,    	1084.4296,    	8},
	{45000,		-68.8037,   	1351.1984,    	1080.2109,    	6},
	{50000,		226.7863,   	1240.0343,    	1082.1406,    	2},
    {60000,		260.6613,   	1237.3254,    	1084.2578,    	9},
	{65000,		2807.5625,  	-1174.7185,    	1025.5703,    	8},
    {70000,		2495.8149,  	-1692.0858,		1014.7421,  	3},
	{75000,		295.0417,   	1472.2667,    	1080.2578,    	15},
	{80000,		22.7217,    	1403.3471,    	1084.4370,    	5},
	{90000,		2365.4287,  	-1135.5949,    	1050.8825,    	8},
	{95000,		-283.4481,  	1470.9569,    	1084.3750,    	15},
	{100000,	2237.4951,  	-1081.5001,    	1049.0234,    	2},
	{120000,	2196.8322,  	-1204.3868,    	1049.0234,    	6},
	{140000,	82.9235,		1322.2895,    	1083.8662,    	9},
	{160000,	226.3100,   	1114.3680,    	1080.9930,    	5},
	{180000,	2317.6428,  	-1026.7320,    	1050.2177,    	9},
	{200000,	234.2822,   	1063.7336,    	1084.2122,    	6},
	{250000,	2324.6508,  	-1149.5426,   	1050.7100,    	12},
	{300000,	140.2712,   	1365.9282,    	1083.8593,    	5},
	{500000,	1260.7875,  	-785.2482,    	1091.9062,    	5}
};

//Textdraws
new Text:tdintro[MAX_SLOTS] 		= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdspeak[MAX_SLOTS]         =       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdzone[MAX_SLOTS] 			= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdhouse[MAX_SLOTS] 		= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdctm[MAX_SLOTS]           =       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdspeed[MAX_SLOTS]         =       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdvinfo[MAX_SLOTS] 		= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdhealthbar[MAX_SLOTS]   	=       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdgasmeter[100] 			= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdvelo[15] 				= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdgas[2] 					= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdhealth;
new Text:tdlogo;
new Text:tdweek;
new Text:tdblack;
new Text:tdwhite;
new Text:tdred;
new Text:tdgray;
new Text:tdlightgray;
new Text:tdgreen;
new Text:tdjoin;
new Text:tdexit;
new Text:tdvehicle;
new Text:tdgun;
new Text:tdarrows;

//Login
new Login[MAX_SLOTS] = 0;

//VoteKick
new VoteKickTimer;
new VoteKickPlayer = -1;
new Votes = 0;
new Voted[MAX_SLOTS] = 0;
new PlayerCount = 0;

//Banco
new Menu:Bank[2];
new BankOpc[MAX_SLOTS] = 0;

//Armas
new Menu:Guns[8];
new Weapon[MAX_SLOTS] = 0;

//Brinquedos
new Menu:Toys;

//Menus (alimentação)
new Menu:Donuts;
new Menu:Pizzas;
new Menu:Chickens;
new Menu:Burgers;
new Menu:Foods;
new Menu:Drinks;
new Menu:Restaurant;

//Restaurante
new InRestaurant[MAX_SLOTS] = 0;

//Bomba-Remota
new RemoteBomb[MAX_SLOTS] = 0;

//Manco
new Limp[MAX_SLOTS] = 0;

//Morte
new Dying[MAX_SLOTS] = 0;
new DieTimer[MAX_SLOTS];

//Pintura
new PaintTimer[MAX_SLOTS];
new PaintStage[MAX_SLOTS];
new PaintColours[MAX_SLOTS];

//Introducao
new IntroductionPart[MAX_SLOTS] = 0;

//Carregamento
new CarryObject[MAX_SLOTS] = 0;

//Pizzaboy
new PizzaDelivery[MAX_SLOTS] = 0;

//Veiculos
new VCounter[MAX_SLOTS] = 0;

//Travas
new WorkVehicle[MAX_SLOTS] = 0;

//Saúde/Colete
new pUpdate[MAX_SLOTS];
new pMoney[MAX_SLOTS];
new pWeapons[MAX_SLOTS][5];
new Float:pHealth[MAX_SLOTS];
new Float:pArmour[MAX_SLOTS];

//Dança
new DanceTimer[MAX_SLOTS];
new DanceStyle[MAX_SLOTS];
new DanceOff[MAX_SLOTS];

//Tempo
new Counter[MAX_SLOTS] = 0;
new CurrentDay;
new CurrentTime;

//Invite
new Invite[MAX_SLOTS] = 0;
new InviteSender[MAX_SLOTS] = 0;
new InviteParams[MAX_SLOTS] = 0;

//Portoes
enum gateInfo
{
	gModel,
	gStyle,
	Float:gX,
	Float:gY,
	Float:gZ,
	Float:gRX,
	Float:gRY,
	Float:gRZ,
	
	//Just used in style 1
	Float:gOpenX,
	Float:gOpenY,
	Float:gOpenZ,
	Float:gOpenS,
	//--------------------
	
	gObjectId,
	gParams
}

new Gates[][gateInfo] = {
    {10184, 1,  1597.0823,  -1665.2662,     7.3906,     0.0,    0.0,    270.0610,   1581.4394,   -1665.2662,   7.3906,  5.0},
	{968, 	3,	1544.6845,	-1630.9524,		13.1828, 	0.0, 	270.0, 	270.0000}
	//{2920,	2,	1544.6845,	-1630.9524,		13.1828,	90.0,	0.0,	179.3906}
};

//Veiculos
new VFuelText[MAX_SLOTS] = 0;
new VHealthText[MAX_SLOTS] = 0;
new VFrozenFlags[MAX_SLOTS] = 0;

//Velocímetro
new Float:VCoords[MAX_SLOTS][2];

//Agachar
new bool:Crouch[MAX_SLOTS] = false;

//Admin
new bool:DisableReport[MAX_SLOTS] = false;

//Forwards
forward ShowTextForPlayer(playerid, content[], Float:X, Float:Y, colour, font, Float:sizeX, Float:sizeY, shadow, alignment, time);
forward ShowTextForAll(content[], Float:X, Float:Y, colour, font, Float:sizeX, Float:sizeY, shadow, alignment, time);
forward DestroyTextDraw(textid);
forward TakeObject(objectid);
forward StopAnimation(playerid);
forward Introducing(playerid);
forward SolveTextBlack(playerid, alpha);
forward DissolveTextBlack(playerid, alpha);
forward DissolveTextWhite(playerid, alpha);
forward ShowTextRed(playerid);
forward HideTextRed(playerid);
forward ShowTextGray(playerid);
forward HideTextGray(playerid);
forward ShowTextLightGray(playerid);
forward HideTextLightGray(playerid);
forward DamageAnimation(playerid, Float:damage);
forward DamageAnimationGetUp(playerid, getupid);
forward DamageEnd(playerid);
forward Limping(playerid);
forward Die(playerid, spawn);
forward RestartDance(playerid);
forward Dancing(playerid);
forward RestartStripTease(playerid);
forward Stripping(playerid);
forward CreateDroppedWeapon(weaponid, ammo, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ);
forward DeleteDroppedWeapon(id);
forward CreateExplosionT(Float:X, Float:Y, Float:Z, type, Float:radius);
forward ExplodeBomb(objectid, Float:X, Float:Y, Float:Z);
forward ExplodeApproxBomb(objectid, Float:X, Float:Y, Float:Z, count);
forward GasEffect(objectid, Float:X, Float:Y, Float:Z);
forward FlashEffect(objectid, Float:X, Float:Y, Float:Z);
forward RocketEffect(objectid, Float:X, Float:Y, Float:Z, stage);
forward SpeakRadio(playerid, speakid);
forward Speak(playerid, speak[]);
forward AttackTerritory(playerid);
forward GangZoneWar(zoneid, domain, attacker);
forward SetGateParams(gateid, params);
forward OpenGate(gateid);
forward CloseGate(gateid);
forward UpdatePlayers();
forward Time();
forward Speedometer();
forward Gasometer();
forward Fueling(playerid, vehicleid, start, amount, textid);
forward Repairing(playerid, vehicleid, value, textid);
forward Painting(playerid, vehicleid);
forward MapIconHandler();
forward ZoneHandler();
forward HouseHandler();
forward GateHandler();
forward CheckpointHandler();
forward DroppedWeaponHandler();
forward CTMHandler();
forward AreaHandler();
forward VoteKick();
forward UpdateTuneCamera();
forward UpdateCrouch();
forward UpdatePlayerCrouch(playerid);

//Callbacks
forward OnPlayerChangeWeapon(playerid, weaponid);
forward OnPlayerDamage(playerid, Float:damage);

main()
{
	print("\n");
	print("-----------------------------------------------------------------");
	print("---------------------- Virtual Society RPG ----------------------");
	print("-------------- Copyright(c) 2010 Virtual Society Team -----------");
	print("---------------------- All rights reserved ----------------------");
	print("-----------------------------------------------------------------");
	print("\n");
}

stock operator%(Float:oper1, Float:oper2)
{
	return floatround(oper1, floatround_floor) % floatround(oper2, floatround_floor);
}

stock operator%(oper1, Float:oper2)
{
	return oper1 % floatround(oper2, floatround_floor);
}

stock operator%(Float:oper1, oper2)
{
	return floatround(oper1, floatround_floor) % oper2;
}

stock report(const string[], report_type = REPORT_DEFAULT)
{
	new File:log;
	new msg[128];
	new colour;
	
 	if(report_type == REPORT_DEFAULT)
	{
	    format(msg, sizeof msg, "[REPORT]-> %s", string);
	    colour = COLOUR_REPORT_DEFAULT;
	}

	else if(report_type == REPORT_CHAT)
	{
	    log = fopen(CHAT_REPORT_FILE_PATH, io_append);
	   	fwrite(log, string);
	   	fwrite(log, "\r\n");
	   	fclose(log);
		   	
	    format(msg, sizeof msg, "[CHAT REPORT]-> %s", string);
	   	colour = COLOUR_REPORT_CHAT;
	}

	else if(report_type == REPORT_ACTION)
	{
	    log = fopen(ACTION_REPORT_FILE_PATH, io_append);
	   	fwrite(log, string);
	   	fwrite(log, "\r\n");
	   	fclose(log);
		   	
    	format(msg, sizeof msg, "[ACTION REPORT]-> %s", string);
	    colour = COLOUR_REPORT_ACTION;
	}
	
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    if(IsPlayerConnected(i) && IsPlayerAdmin(i) && !DisableReport[i])
	        SendClientMessage(i, colour, msg);
	}
}

stock hSetString(const filename[], const key[], const value[])
{
    new File:fpr, File:fpw;
    new read[128], buf[128];
	new bool:wrote;
    
	if(!fexist(filename))
	{
	    fpw = fopen(filename, io_write);
	    fclose(fpw);
	}
	
	format(buf, sizeof buf, "%s.buf", filename);
	fremove(buf);

	fpw = fopen(buf, io_write);
	fpr = fopen(filename, io_read);
	
	while(fread(fpr, read, sizeof read))
	{
	    new hkey[128], index;
	    
	    index = 0;
	    hkey = strtok(read, index, HSYS_SEP_CHAR);
	    
		if(strcmp(key, hkey, true) == 0)
		{
		    if(!wrote)
      		{
		    	new wtext[128];
		    	format(wtext, sizeof wtext, "%s%c%s\r\n", key, HSYS_SEP_CHAR, value);
		    	fwrite(fpw, wtext);
   			}
			
			wrote = true;
		}
		
		else
		    fwrite(fpw, read);
	}
	
	if(!wrote)
 	{
	    new wtext[128];
    	format(wtext, sizeof wtext, "%s%c%s\r\n", key, HSYS_SEP_CHAR, value);
    	fwrite(fpw, wtext);
 	}
	
	fclose(fpr);
	fclose(fpw);

	if(fcopytextfile(buf, filename))
		return fremove(buf);

	return false;
}

stock hGetString(const filename[], const key[])
{
	new ret[128];
	ret[0] = 0;
	
    if(!fexist(filename))
		return ret;
	
	new File:fp, read[128];
	
	fp = fopen(filename, io_read);
	
	while(fread(fp, read, sizeof read))
	{
		new hkey[128], index;
		
		index = 0;
		hkey = strtok(read, index, HSYS_SEP_CHAR);
		
		if(strcmp(key, hkey, true) == 0)
		{
			fclose(fp);
			
			while(read[index] == HSYS_SEP_CHAR)
				++index;
				
			strmid(ret, read, index, strlen(read));
			StripNewLine(ret);
			return ret;
		}
	}
	
	fclose(fp);
	return ret;
}

stock hUnset(const filename[], const key[])
{
	new File:fpr, File:fpw;
	new buf[128], read[128];
	
    if(!fexist(filename))
	{
	    fpw = fopen(filename, io_write);
	    fclose(fpw);
	}
	
	format(buf, sizeof buf, "%s.buf", filename);
	fremove(buf);
	
	fpw = fopen(buf, io_write);
	fpr = fopen(filename, io_read);
	
	while(fread(fpr, read, sizeof read))
	{
	    new hkey[128], index;
	    
	    index = 0;
	    hkey = strtok(read, index, HSYS_SEP_CHAR);
	    
		if(strcmp(key, hkey, true) != 0)
		    fwrite(fpw, read);
	}
	
	fclose(fpr);
	fclose(fpw);
	
	if(fcopytextfile(buf, filename))
		return fremove(buf);
		
	return false;
}

stock hSetInt(const filename[], const key[], value)
{
	new stringize[128];
	valstr(stringize, value);
	return hSetString(filename, key, stringize);
}

stock hGetInt(const filename[], const key[])
	return strval(hGetString(filename, key));

stock hSetFloat(const filename[], const key[], Float:value)
{
	new stringize[128];
	format(stringize, sizeof stringize, "%f", value);
	return hSetString(filename, key, stringize);
}

stock Float:hGetFloat(const filename[], const key[])
	return floatstr(hGetString(filename, key));

// ------------ Functions by DracoBlue ------------ //
stock StripNewLine(string[])
{
	new len = strlen(string);
	if (string[0]==0) return ;
	if ((string[len - 1] == '\n') || (string[len - 1] == '\r')) {
		string[len - 1] = 0;
		if (string[0]==0) return ;
		if ((string[len - 2] == '\n') || (string[len - 2] == '\r')) string[len - 2] = 0;
	}
}

stock fcopytextfile(const oldname[], const newname[]) {
	new File:ohnd,File:nhnd;
	if (!fexist(oldname)) return false;
	ohnd=fopen(oldname,io_read);
	nhnd=fopen(newname,io_write);
	new tmpres[128];
	while (fread(ohnd,tmpres)) {
		StripNewLine(tmpres);
		format(tmpres,sizeof(tmpres),"%s\r\n",tmpres);
		fwrite(nhnd,tmpres);
	}
	fclose(ohnd);
	fclose(nhnd);
	return true;
}

stock strtok(const string[], &index, seperator=' ')
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

// ------------ Functions by kyeman ------------ //
stock PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}
// --------------------------------------------- //

// ------------ Functions by Y_Less ------------ //
stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}

stock GetXYInBackOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    a = (a + 180) % 360;
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}

stock GetXYInRightOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    a = (a + 270) % 360;
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}

stock GetXYInLeftOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    a = (a + 90) % 360;
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}
// ---------------------------------------------- //

stock fcreate(const filename[])
{
	if(!fexist(filename))
	{
	    new File:fp;
	    fp = fopen(filename, io_write);
	    fclose(fp);
	}
}

stock encode_vehicle_data(fuel, exist)
	return ((fuel & 127) << 1) | (exist & 1);

stock decode_vehicle_data(value, &fuel, &exist)
{
	fuel = (value >> 1) & 127;
	exist = (value & 1);
}

stock encode_vehicle_colours(colour1, colour2)
	return ((colour1 & 0xFFFF) << 16) | (colour2 & 0xFFFF);
	
stock decode_vehicle_colours(value, &colour1, &colour2)
{
	colour1 = (value >> 16) & 0xFFFF;
	colour2 = (value & 0xFFFF);
}

stock encode_gate_params(open, status)
	return ((open & 1) << 1) | (status & 1);

stock decode_gate_params(value, &open, &status)
{
	open = (value >> 1) & 1;
	status = value & 1;
}

stock encode_gang_data(id, post)
	return (id << 5) | (post & 31);
	
stock decode_gang_data(value, &id, &post)
{
	id = (value >> 5);
	post = (value & 31);
}

stock encode_gun(id, ammo)
	return (ammo << 6) | (id & 63);
    
stock decode_gun(value, &id, &ammo)
{
	id = (value & 63);
	ammo = (value >> 6);
}

stock encode_player_habs(terrestrial, nautical, air)
	return ((terrestrial & 1) << 2) | ((nautical & 1) << 1) | (air & 1);
	
stock decode_player_habs(value, &terrestrial, &nautical, &air)
{
	terrestrial = (value >> 2) & 1;
	nautical = (value >> 1) & 1;
	air = (value & 1);
}

stock IsNumeric(const string[])
{
	for(new n = 0; n < strlen(string); n++)
	{
		if(string[n] < '0' || string[n] > '9')
		    return false;
	}

	return true;
}

stock NumericToRoman(number)
{
	new Romans[][16] = {
	    " ",		"I",		"II",		"III",
		"IV",		"V",		"VI",		"VII",
		"VIII",		"IX",		"X",		"XI",
		"XII",		"XIII",		"XIV",		"XV",
		"XVI",		"XVII",		"XVIII",	"XIX",
		"XX",       "XXI",      "XXII",     "XXIII",
		"XXIV",     "XXV",      "XXVI",     "XXVII",
		"XXVIII",   "XXIX",		"XXX",		"XXXI",
		"XXXII",    "XXXIII",   "XXXIV",    "XXXV",
		"XXXVI",    "XXXVII",   "XXXVIII",  "XXXIX",
		"XL",     	"XLI",    	"XLII",   	"XLIII",
		"XLIV",   	"XLV",    	"XLVI",   	"XLVII",
		"XLVIII", 	"XLIX",   	"L"
	};
	
	if(number < 0 || number > sizeof Romans - 1)
	    number = 0;
	    
	return Romans[number];
}

stock IsNotSpecialString(const string[])
{
	for(new n = 0; n < strlen(string); n++)
	{
		if((string[n] < 'a' || string[n] > 'z') && (string[n] < 'A' || string[n] > 'Z') && (string[n] < '0' || string[n] > '9') && string[n] != '_' && string[n] != ' ' && string[n] != ''')
			return false;
	}
	
	return true;
}

stock GetPlayerId(playername[])
{
	new name[MAX_PLAYER_NAME];
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        GetPlayerName(n, name, MAX_PLAYER_NAME);
	        
	        if(strcmp(name, playername, true) == 0)
	            return n;
	    }
	}
	
	return INVALID_PLAYER_ID;
}

stock Float:GetDistance(Float:X1, Float:Y1, Float:Z1, Float:X2, Float:Y2, Float:Z2)
	return floatsqroot(		floatpower(X1 - X2, 2) +
							floatpower(Y1 - Y2, 2) +
							floatpower(Z1 - Z2, 2)	);

stock Float:GetDistance2D(Float:X1, Float:Y1, Float:X2, Float:Y2)
{
    return floatsqroot(		floatpower(X1 - X2, 2) +
							floatpower(Y1 - Y2, 2)  );
}

stock GetPlayerInt(playerid)
{
	if(Enter[playerid] == -1)
		return -1;
		
	return Enters[Enter[playerid]][intId];
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	return name;
}

stock GetPlayerXFilePath(playerid)
{
	new xpath[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	format(xpath, sizeof xpath, #SERVER_DIRECTORY "Players/Data1/%s.ini", name);
	return xpath;
}

stock GetPlayerKFilePath(playerid)
{
	new kpath[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	format(kpath, sizeof kpath, #SERVER_DIRECTORY "Players/Data2/%s.ini", name);
	return kpath;
}

stock GetVehicleFilePath(vehicleid)
{
	new vpath[128];
	format(vpath, sizeof vpath, #SERVER_DIRECTORY "World/Vehicles/%d.veh", vehicleid - ServerVehicles);
	return vpath;
}

stock GetGangFilePath(gangid)
{
    new gpath[128];
	format(gpath, sizeof gpath, #SERVER_DIRECTORY "World/Gangs/%d.gng", gangid);
	return gpath;
}

stock GetHouseFilePath(houseid)
{
	new hpath[128];
	format(hpath, sizeof hpath, #SERVER_DIRECTORY "World/Houses/%d.hse", houseid);
	return hpath;
}

stock GetCompanyFilePath(company)
{
	new cpath[128];
	format(cpath, sizeof cpath, #SERVER_DIRECTORY "World/Companies/%s.com", Companies[company][cFile]);
	return cpath;
}

stock GetCompanyNameFilePath(const company[])
{
	new cpath[128];
	format(cpath, sizeof cpath, #SERVER_DIRECTORY "World/Companies/%s.com", company);
	return cpath;
}

stock IsServerVehicle(vehicleid)
{
	return (vehicleid < ServerVehicles);
}

stock IsPlayerVehicle(vehicleid)
{
	return (vehicleid >= ServerVehicles);
}

stock IsJobVehicleEx(vehicleid, array[], size)
{
    for(new n = 0; n < size; n++)
	{
	    if(vehicleid == array[n])
	        return true;
	}

	return false;
}

stock IsPlayerInJobVehicleEx(playerid, array[], size)
{
	for(new n = 0; n < size; n++)
	{
	    if(IsPlayerInVehicle(playerid, array[n]))
	    {
	        return true;
	    }
	}
	
	return false;
}

stock GetPlayerJobVehicleEx(playerid, array[], size)
{
	for(new n = 0; n < size; n++)
	{
	    if(IsPlayerInVehicle(playerid, array[n]))
	    {
	        return n;
	    }
	}

	return -1;
}

stock SetVehiclesParamsForPlayer(array[], size, playerid, objective, doorslocked)
{
	for(new n = 0; n < size; n++)
	    SetVehicleParamsForPlayer(array[n], playerid, objective, doorslocked);
}
													
stock ChangePlayerJob(playerid, jobid)
{
	if(jobid > 0 && jobid < sizeof Jobs)
	{
	    new admin = IsPlayerAdmin(playerid);
	    
	    SetPlayerSkin(playerid, hGetInt(GetPlayerXFilePath(playerid), "Skin"));
	    SetPlayerColour(playerid, Jobs[jobid][jobColour]);
	    
		SetJobVehiclesParamsForPlayer(TAXI, 		playerid, 	admin || jobid == TAXISTA);
		SetJobVehiclesParamsForPlayer(POLICE_CAR, 	playerid, 	admin || jobid == POLICIAL_MILITAR || jobid == POLICIAL_SWAT || jobid == DELEGADO);
		SetJobVehiclesParamsForPlayer(SCOOTER, 		playerid, 	admin || jobid == PIZZABOY);
		SetJobVehiclesParamsForPlayer(BUS, 			playerid, 	admin || jobid == MAQUINISTA);
		SetJobVehiclesParamsForPlayer(TRAIN, 		playerid, 	admin || jobid == MAQUINISTA);
		SetJobVehiclesParamsForPlayer(AMBULANCE, 	playerid, 	admin || jobid == PARAMEDICO);
		SetJobVehiclesParamsForPlayer(NEWS, 		playerid, 	admin || jobid == JORNALISTA);
		SetJobVehiclesParamsForPlayer(TOWTRUCK,		playerid, 	admin || jobid == MECANICO);
		SetJobVehiclesParamsForPlayer(ROADTRAIN, 	playerid, 	admin || jobid == CAMINHONEIRO);
       	SetJobVehiclesParamsForPlayer(TRASHMASTER, 	playerid, 	admin || jobid == LIXEIRO);
        
        if(!IsPlayerAdmin(playerid))
	    {
        	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsServerVehicle(GetPlayerVehicleID(playerid)))
        	{
        	    RemovePlayerFromVehicle(playerid);
        	}
		}
	}
}

stock SendPlayerInvite(playerid, senderid, params, id, title[], info[], button1[], button2[])
{
	if(Invite[playerid] != INVITE_NONE)
	{
	    if(senderid != INVALID_PLAYER_ID)
	    	SendClientMessage(senderid, COLOUR_GRAY, "Esse jogador já está com uma proposta em andamento.");
	    	
		return 1;
	}
	
	Invite[playerid] = id;
	InviteSender[playerid] = senderid;
	InviteParams[playerid] = params;
	
	ShowPlayerDialog(playerid, DIALOG_INVITE, DIALOG_STYLE_MSGBOX, title, info, button1, button2);
	return 0;
}

stock SaveGlobalData()
{
    hSetInt(GLOBAL_FILE_PATH, "CurrentTime", CurrentTime);
	hSetInt(GLOBAL_FILE_PATH, "CurrentDay", CurrentDay);
}

stock LoadGlobalData()
{
	CurrentTime = hGetInt(GLOBAL_FILE_PATH, "CurrentTime");
	CurrentDay = hGetInt(GLOBAL_FILE_PATH, "CurrentDay");
}

stock IsBallInBasket()
{
	new Float:X, Float:Y, Float:Z;
	
	GetObjectPos(Basketball, X, Y, Z);
	
	if(GetDistance(X, Y, Z, 2290.7009, -1541.0992, 28.8750) < 0.4076025)
	    return 1;
	
	if(GetDistance(X, Y, Z, 2290.5039, -1514.7758, 28.8750) < 0.4076025)
	    return 2;
	    
	return 0;
}

stock SaveVehiclePos(vehicleid, Float:X, Float:Y, Float:Z, Float:A)
{
	new str[128];
	format(str, sizeof str, "%.4f,%.4f,%.4f,%.4f", X, Y, Z, A);
	hSetString(GetVehicleFilePath(vehicleid), "Position", str);
}

stock LoadVehiclePos(vehicleid, &Float:X, &Float:Y, &Float:Z, &Float:A)
{
	new str[128], idx = 0;

	str = hGetString(GetVehicleFilePath(vehicleid), "Position");

	X = floatstr(strtok(str, idx, ','));
	Y = floatstr(strtok(str, idx, ','));
	Z = floatstr(strtok(str, idx, ','));
	A = floatstr(strtok(str, idx, ','));
}

stock SetHealth(playerid, Float:health)
{
	if(health > 100.0)
		health = 100.0;
		
    pUpdate[playerid] |= UPDATE_STATUS;
	pHealth[playerid] = health;
}

stock AddHealth(playerid, Float:health)
{
    pUpdate[playerid] |= UPDATE_STATUS;
	pHealth[playerid] += health;
	
	if(pHealth[playerid] > 100.0)
		pHealth[playerid] = 100.0;
}

stock Float:GetHealth(playerid)
	return pHealth[playerid];
	
stock SetArmour(playerid, Float:armour)
{
	if(armour > 100.0)
	    armour = 100.0;
	    
    pUpdate[playerid] |= UPDATE_STATUS;
	pArmour[playerid] = armour;
}

stock Float:GetArmour(playerid)
	return pArmour[playerid];

stock GivePlayerMoneyEx(playerid, amount)
{
	pUpdate[playerid] |= UPDATE_MONEY;
	pMoney[playerid] += amount;
}

stock ResetPlayerMoneyEx(playerid)
{
    pUpdate[playerid] |= UPDATE_MONEY;
    pMoney[playerid] = 0;
}

stock GetPlayerMoneyEx(playerid)
	return pMoney[playerid];

stock IsPlayerCop(playerid)
{
	new jobid;
	jobid = hGetInt(GetPlayerXFilePath(playerid), "Job");
	return (jobid == POLICIAL_MILITAR || jobid == POLICIAL_SWAT || jobid == DELEGADO);
}

stock SavePlayerPos(playerid, Float:X, Float:Y, Float:Z, Float:A)
{
	new str[128];
	format(str, sizeof str, "%.4f,%.4f,%.4f,%.4f", X, Y, Z, A);
	hSetString(GetPlayerXFilePath(playerid), "Position", str);
}

stock LoadPlayerPos(playerid, &Float:X, &Float:Y, &Float:Z, &Float:A)
{
	new str[128], idx = 0;

	str = hGetString(GetPlayerXFilePath(playerid), "Position");
	
	X = floatstr(strtok(str, idx, ','));
	Y = floatstr(strtok(str, idx, ','));
	Z = floatstr(strtok(str, idx, ','));
	A = floatstr(strtok(str, idx, ','));
}

stock UpdatePlayerSpawn(playerid)
{
	new Float:X, Float:Y, Float:Z, Float:A;
	
	LoadPlayerPos(playerid, X, Y, Z, A);
	SetSpawnInfo(playerid, 0, hGetInt(GetPlayerXFilePath(playerid), "Skin"), X, Y, Z, A, 0, 0, 0, 0, 0, 0);
}

stock SetPlayerDrunkLevelEx(playerid, drunklevel)
{
	if(drunklevel >= 5000)
	    TextDrawHideForPlayer(playerid, tdweek);
	
	else
	    TextDrawShowForPlayer(playerid, tdweek);
	
	SetPlayerDrunkLevel(playerid, drunklevel);
}

stock SavePlayerCounter(playerid)
{
	new kpath[128], cur, jobtime;
	
	kpath = GetPlayerKFilePath(playerid);
	cur = hGetInt(kpath, "Counter");
	jobtime = hGetInt(kpath, "JobCounter") - Counter[playerid];
	
	if(jobtime < 0)
	    jobtime = 0;
	
 	hSetInt(kpath, "JobCounter", jobtime);
	hSetInt(kpath, "Counter", cur + Counter[playerid]);
	Counter[playerid] = 0;
}

stock GetPlayerCounter(playerid)
{
    SavePlayerCounter(playerid);
	return hGetInt(GetPlayerKFilePath(playerid), "Counter");
}

stock BanPlayer(playerid, reason[])
{
	new File:fp, IP[128], name[MAX_PLAYER_NAME], date[6], wtext[256];
	
	GetPlayerIp(playerid, IP, sizeof IP);
	GetPlayerName(playerid, name, sizeof name);

	fp = fopen(BAN_FILE_PATH, io_append);
	gettime(date[0], date[1], date[2]);
	getdate(date[5], date[4], date[3]);

	format(wtext, sizeof wtext, "[%s %s] // %s (%d/%d/%d - %d:%d:%d)\r\n", name, IP, reason, date[3], date[4], date[5], date[0], date[1], date[2]);
	fwrite(fp, wtext);
	fclose(fp);
	reportf("%s - Banido (%s)", REPORT_ACTION, PlayerName(playerid), reason);
	Kick(playerid);
}

stock UnbanPlayer(playername[])
{
	if(!fexist(BAN_FILE_PATH))
		return false;
	
	new File:fp, File:buf;
	new tmp[256];
	
	fp = fopen(BAN_FILE_PATH, io_read);
	buf = fopen(BAN_BUFFER_FILE_PATH, io_write);
	
	while(fread(fp, tmp, sizeof tmp))
	{
	    new read[128], uname[128], idx = 0;
	    
	    strmid(read, tmp, strfind(tmp, "[", true) + 1, strfind(tmp, "]", true));
	    uname = strtok(read, idx);
	    
		if(strcmp(uname, playername, true))
		    fwrite(buf, tmp);
	}
	
	fclose(buf);
	fclose(fp);
	
	if(fcopytextfile(BAN_BUFFER_FILE_PATH, BAN_FILE_PATH))
		return fremove(BAN_BUFFER_FILE_PATH);
		
	return false;
}

stock CheckBan(playerid)
{
	if(!fexist(BAN_FILE_PATH))
		return;

	new File:fp;
	new tmp[256], IP[128], name[MAX_PLAYER_NAME];

	fp = fopen(BAN_FILE_PATH, io_read);
	GetPlayerName(playerid, name, sizeof name);
 	GetPlayerIp(playerid, IP, sizeof IP);
	    
	while(fread(fp, tmp, sizeof tmp))
	{
	    new read[128], uname[128], uIP[128];
	    new idx = 0;
	    
	    strmid(read, tmp, strfind(tmp, "[", true) + 1, strfind(tmp, "]", true));
	    uname = strtok(read, idx);
	    uIP = strtok(read, idx);
	    
	    if(strcmp(uname, name, true) == 0 || strcmp(uIP, IP, true) == 0)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_YELLOW, "Você está banido do Virtual Society RPG Server.");
	        Kick(playerid);
	    }
	}
	
	fclose(fp);
}
	
stock AddStaticServerVehicle(modelid, Float:X, Float:Y, Float:Z, Float:ang, colour1, colour2, respawn_delay, virtual_world = 0)
{
	new id, vkey[128], vexist;
	
	id = AddStaticVehicleEx(modelid, X, Y, Z, ang, colour1, colour2, respawn_delay);
	
	if(virtual_world != 0)
	    SetVehicleVirtualWorld(id, virtual_world);
	
	valstr(vkey, id);
	
	vexist = hGetInt(SERVER_VEHICLES_FILE_PATH, vkey) & 1;
	
	if(vexist == 0)
		hSetInt(SERVER_VEHICLES_FILE_PATH, vkey, encode_vehicle_data(100, 1));

	return id;
}

stock CreatePlayerVehicle(const owner[], modelid, Float:X, Float:Y, Float:Z, Float:ang, colour1, colour2)
{
	new vpath[128], id, plate[128];
	
	id = CreateVehicle(modelid, X, Y, Z, ang, colour1, colour2, -1);
	vpath = GetVehicleFilePath(id);
	format(plate, sizeof plate, "VLR %d", id);
	
	hSetString(vpath, "Owner", owner);
	hSetString(vpath, "NumberPlate", plate);
	hSetInt(vpath, "Tun0", 0xFFFFFFFF);
	hSetInt(vpath, "Tun1", 0xFFFFFFFF);
	hSetInt(vpath, "Tun2", 0xFFFFFFFF);
	hSetInt(vpath, "Tun3", 0xFFFFFFFF);
	hSetInt(vpath, "Model", modelid);
	hSetInt(vpath, "Paintjob", -1);
	hSetInt(vpath, "Fuel", 100);
	hSetInt(vpath, "Colours", encode_vehicle_colours(colour1, colour2));
	hSetInt(vpath, "Params", 0);
    SaveVehiclePos(id, X, Y, Z, ang);
    
	++PlayerVehicles;
	return id;
}

stock LoadPlayerVehicles()
{
	new vpath[128];
	
	PlayerVehicles = ServerVehicles;
	vpath = GetVehicleFilePath(PlayerVehicles);
	
	while(fexist(vpath))
	{
		new vehid, Float:X, Float:Y, Float:Z, Float:A, colour1, colour2;

		LoadVehiclePos(PlayerVehicles, X, Y, Z, A);
		decode_vehicle_colours(hGetInt(vpath, "Colours"), colour1, colour2);
		
		vehid = CreateVehicle(hGetInt(vpath, "Model"), X, Y, Z, A, colour1, colour2, -1);
		LoadVehicleComponents(vehid);
		
	    ++PlayerVehicles;
        vpath = GetVehicleFilePath(PlayerVehicles);
	}
	
	PlayerVehicles = PlayerVehicles - ServerVehicles;
}

stock SetVehicleFuel(vehicleid, amount)
{
	if(IsServerVehicle(vehicleid))
	{
	    new vkey[128];
		valstr(vkey, vehicleid);
  		hSetInt(SERVER_VEHICLES_FILE_PATH, vkey, encode_vehicle_data(amount, 1));
	}

	else
	    hSetInt(GetVehicleFilePath(vehicleid), "Fuel", amount);
	    
	for(new n = 0; n < MAX_SLOTS; n++)
	{
		if(IsPlayerConnected(n) && IsPlayerLogged(n) && GetPlayerState(n) == PLAYER_STATE_DRIVER && IsPlayerInVehicle(n, vehicleid))
		{
		    UpdatePlayerFuelText(n);
		    if(VFrozenFlags[n] & VFROZEN_NO_GAS && amount > 0)
		    {
		        VFrozenFlags[n] &= ~VFROZEN_NO_GAS;
		        
		        if(VFrozenFlags[n] == 0)
		        {
		            TogglePlayerControllable(n, true);
		            TextDrawHideForPlayer(n, tdvehicle);
		        }
		    }
		}
	}
}

stock GetVehicleFuel(vehicleid)
{
    if(IsServerVehicle(vehicleid))
	{
	    new vkey[128], fuel, exist;
		valstr(vkey, vehicleid);
		decode_vehicle_data(hGetInt(SERVER_VEHICLES_FILE_PATH, vkey), fuel, exist);
  		return fuel;
	}

	else
	    return hGetInt(GetVehicleFilePath(vehicleid), "Fuel");
}

stock SetVehicleColours(vehicleid, colour1, colour2)
{
	if(IsServerVehicle(vehicleid))
	    return;
	    
	hSetInt(GetVehicleFilePath(vehicleid), "Colours", encode_vehicle_colours(colour1, colour2));
}

stock SetVehicleColoursEncoded(vehicleid, value)
{
	if(IsServerVehicle(vehicleid))
	    return;
	    
 	hSetInt(GetVehicleFilePath(vehicleid), "Colours", value);
}

stock GetVehicleColours(vehicleid, &colour1, &colour2)
{
    if(IsServerVehicle(vehicleid))
    {
        colour1 = colour2 = 0;
	    return;
	}
	
	decode_vehicle_colours(hGetInt(GetVehicleFilePath(vehicleid), "Colours"), colour1, colour2);
}

stock GetVehicleColoursEncoded(vehicleid)
{
	if(IsServerVehicle(vehicleid))
	    return 0;
	    
	return hGetInt(GetVehicleFilePath(vehicleid), "Colours");
}

stock GetVehicles()
{
	return (ServerVehicles + PlayerVehicles);
}

stock IsTrailerModel(modelid)
{
    for(new t = 0; t < sizeof Trailers; t++)
	{
		if(modelid == Trailers[t])
		    return true;
	}

	return false;
}

stock IsRCModel(modelid)
{
    for(new rc = 0; rc < sizeof RCs; rc++)
	{
		if(modelid == RCs[rc])
		    return true;
	}

	return false;
}

stock IsBikeModel(modelid)
{
	for(new bk = 0; bk < sizeof Bikes; bk++)
	{
		if(modelid == Bikes[bk])
		    return true;
	}
	
	return false;
}

stock IsAirModel(modelid)
{
    for(new air = 0; air < sizeof Airs; air++)
	{
		if(modelid == Airs[air])
		    return true;
	}

	return false;
}

stock IsBoatModel(modelid)
{
    for(new bt = 0; bt < sizeof Boats; bt++)
	{
		if(modelid == Boats[bt])
		    return true;
	}

	return false;
}

stock RandomCTMCarModel()
{
	new m;

	do
	    m = random(sizeof Vehicles) + 400;
	while(Vehicles[m - 400][vehValue] <= 0 || IsBikeModel(m) || IsAirModel(m) || IsBoatModel(m) || IsRCModel(m) || IsTrailerModel(m));
	
	return m;
}

stock RandomCTMBikeModel()
{
    new m;

	do
		m = Bikes[random(sizeof Bikes)] - 400;
	while(Vehicles[m][vehValue] <= 0);

	return m+400;
}

stock RandomCTMAirModel()
{
    new m;

	do
		m = Airs[random(sizeof Airs)] - 400;
	while(Vehicles[m][vehValue] <= 0);

	return m+400;
}

stock RandomCTMBoatModel()
{
    new m;

	do
		m = Boats[random(sizeof Boats)] - 400;
	while(Vehicles[m][vehValue] <= 0)

	return m+400;
}

stock SaveVehiclePaintjob(vehicleid, paintjobid)
{
	if(IsPlayerVehicle(vehicleid))
		hSetInt(GetVehicleFilePath(vehicleid), "Paintjob", paintjobid);
}

stock IsValidVehicleComponent(componentid)
	return (componentid > 999 && componentid < 1194);

stock SaveVehicleComponent(vehicleid, componentid, slot)
{
	new vpath[128], key[128], seq, value, mask;
	
	vpath = GetVehicleFilePath(vehicleid);
	mask = 0xFFFFFFFF;
	seq = slot % 4;
	format(key, sizeof key, "Tun%d", slot / 4);
    value = hGetInt(vpath, key);
    mask &= ~(0xFF << (seq * 8));
	value = (value & mask) | ((componentid - 1000) << (seq * 8));
	
	hSetInt(vpath, key, value);
}

stock GetVehicleComponent(vehicleid, slot)
{
    new vpath[128], key[128], value, seq;

	vpath = GetVehicleFilePath(vehicleid);
	seq = slot % 4;
	format(key, sizeof key, "Tun%d", slot / 4);
	value = hGetInt(vpath, key);
	
	return (value >> (seq * 8)) + 1000;
}

stock DeleteVehicleComponent(vehicleid, slot)
	SaveVehicleComponent(vehicleid, 0xFF, slot);

stock LoadVehicleComponents(vehicleid)
{
	new vpath[128], key[128], tuning, componentid;
	
	vpath = GetVehicleFilePath(vehicleid);
	
	for(new part = 0; part < 4; part++)
	{
	    format(key, sizeof key, "Tun%d", part);
	    tuning = hGetInt(vpath, key);
	    
	    for(new t = 0; t < 4; t++)
	    {
	        componentid = (tuning & 0xFF) + 1000;
	        
	        if(IsValidVehicleComponent(componentid))
	            AddVehicleComponent(vehicleid, componentid);
	            
			tuning >>= 8;
    	}
	}
	
	componentid = hGetInt(vpath, "Paintjob");
	
	if(componentid != -1)
	    ChangeVehiclePaintjob(vehicleid, componentid);
}

stock RemoveVehiclePaintjob(vehicleid)
{
	new colours, colour1, colour2;
	
	if(IsServerVehicle(vehicleid))
	    colours = encode_vehicle_colours(random(300), random(300));
	else
		colours = hGetInt(GetVehicleFilePath(vehicleid), "Colours");
	
	decode_vehicle_colours(colours, colour1, colour2);
	ChangeVehiclePaintjob(vehicleid, -1);
	ChangeVehicleColour(vehicleid, colour1, colour2);
}

stock ShowTuningMainMenu(playerid)
{
	new modelid, count = 0;
	
	if(TunnerID != playerid)
	{
	    if(VFrozenFlags[playerid] != 0)
	    {
	        ShowTextForPlayer(playerid, "Voce deve estar desparalisado.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 3000);
		    return 1;
	    }
	    
	    if(TunnerID != -1 && TunnerID != playerid)
		{
		    ShowTextForPlayer(playerid, "Ja ha alguem modificando um veiculo.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 3000);
		    return 1;
		}
		
	    new vehid;
	    
    	if(!IsPlayerInAnyVehicle(playerid))
		{
		    ShowTextForPlayer(playerid, "Voce nao esta em um veiculo.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 3000);
		    return 1;
		}
		
		vehid = GetPlayerVehicleID(playerid);
		
		if(IsServerVehicle(vehid))
		{
		    ShowTextForPlayer(playerid, "Voce nao pode modificar um veiculo do servidor.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 3000);
		    return 1;
		}
		
		modelid = GetVehicleModel(vehid);
		
		if(	modelid == 509 || modelid == 581 || modelid == 481 || modelid == 462 || modelid == 521 || modelid == 463 || modelid == 510 ||
			modelid == 522 || modelid == 461 || modelid == 448 || modelid == 468 || modelid == 586 || modelid == 523 || modelid == 520 ||
			modelid == 435 || modelid == 450 || modelid == 591 || modelid == 606 || modelid == 607 || modelid == 610 || modelid == 584 ||
			modelid == 608 || modelid == 611 || modelid == 472 || modelid == 473 || modelid == 493 || modelid == 595 || modelid == 484 ||
			modelid == 453 || modelid == 452 || modelid == 446 || modelid == 454 || modelid == 539 || modelid == 538 || modelid == 537 ||
			modelid == 590 || modelid == 569 || modelid == 570 || modelid == 449 || modelid == 441 || modelid == 464 || modelid == 594 ||
	 		modelid == 501 || modelid == 465 || modelid == 564	)
		{
		    ShowTextForPlayer(playerid, "Modelo invalido para modificacao.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 3000);
	    	return 1;
		}
		
		TunnerID = playerid;
		TuneVehicle = GetPlayerVehicleID(playerid);
		InitPlayerTune(playerid);
	}
	
	modelid = GetVehicleModel(TuneVehicle);
	
	DestroyMenu(mTuning);
	mTuning = CreateMenu("Componentes", 2, 2, 150, 100, 20);
	SetMenuColumnHeader(mTuning, 0, "Parte:");

	if(!IsValidMenu(mTuning))
		return 0;
	
	if(	modelid == 536 || modelid == 575 || modelid == 576 || modelid == 534 || modelid == 535 || modelid == 567 || modelid == 562 ||
		modelid == 565 || modelid == 558 || modelid == 559 || modelid == 560 || modelid == 561	)
	{
	    AddMenuItem(mTuning, 0, "Pintura");
	    Tunes[count++] = PAINTJOBS;
	}
	
	for(new m = 0; m < sizeof CarMods; m++)
	{
	    if(CarMods[m][0] == modelid)
	    {
	        for(new t = 1; t < 15; t++)
	        {
	            new slot;

				slot = GetComponentSlot(CarMods[m][t]);
	            
	            if(IsValidVehicleComponent(CarMods[m][t]) && slot != WHEELS && slot != NITROS && slot != STEREO && slot != HYDRAULICS)
	            {
					new bool:added;

					added = false;
					
					for(new c = 0; c < count; c++)
					{
					    if(slot == Tunes[c])
					        added = true;
					}
					
					if(!added)
					{
					    if(slot == SPOILERS)
					    {
					    	AddMenuItem(mTuning, 0, "Aerofolio");
					    	Tunes[count++] = SPOILERS;
						}
						
						else if(slot == ROOFSCOOPS)
					    {
					    	AddMenuItem(mTuning, 0, "Roofscoop");
					    	Tunes[count++] = ROOFSCOOPS;
						}
						
						else if(slot == HOODS)
					    {
					    	AddMenuItem(mTuning, 0, "Capo");
					    	Tunes[count++] = HOODS;
						}
						
						else if(slot == SIDESKIRTS)
					    {
					    	AddMenuItem(mTuning, 0, "Saias laterais");
					    	Tunes[count++] = SIDESKIRTS;
						}
						
						else if(slot == LAMPS)
					    {
					    	AddMenuItem(mTuning, 0, "Lampada");
					    	Tunes[count++] = LAMPS;
						}
						
						else if(slot == EXHAUSTS)
					    {
					    	AddMenuItem(mTuning, 0, "Escapamento");
					    	Tunes[count++] = EXHAUSTS;
						}
						
						else if(slot == BULLBARS)
					    {
					    	AddMenuItem(mTuning, 0, "Barras");
					    	Tunes[count++] = BULLBARS;
						}
						
						else if(slot == REARBULLBARS)
					    {
					    	AddMenuItem(mTuning, 0, "Barras traseiras");
					    	Tunes[count++] = REARBULLBARS;
						}
						
						else if(slot == FRONTBULLBARS)
					    {
					    	AddMenuItem(mTuning, 0, "Barras fronteiras");
					    	Tunes[count++] = FRONTBULLBARS;
						}
						
						else if(slot == FRONTBUMPERS)
					    {
					        AddMenuItem(mTuning, 0, "Parachoque fronteiro");
					        Tunes[count++] = FRONTBUMPERS;
					    }
					    
					    else if(slot == REARBUMPERS)
					    {
					        AddMenuItem(mTuning, 0, "Parachoque traseiro");
					        Tunes[count++] = REARBUMPERS;
					    }
					    
					    else if(slot == VENTS)
					    {
					        AddMenuItem(mTuning, 0, "Respiradouros");
					        Tunes[count++] = VENTS;
					    }
					    
					    else if(slot == FRONTSIGN)
					    {
					        AddMenuItem(mTuning, 0, "Sinal fronteiro");
					        Tunes[count++] = FRONTSIGN;
					    }
					}
				}
	        }
	        
	        break;
	    }
	}
	
	AddMenuItem(mTuning, 0, "Rodas");
	Tunes[count++] = WHEELS;
	AddMenuItem(mTuning, 0, "Nitro");
	Tunes[count++] = NITROS;
	AddMenuItem(mTuning, 0, "Estereo");
	Tunes[count++] = STEREO;
	AddMenuItem(mTuning, 0, "Hidraulica");
	Tunes[count++] = HYDRAULICS;
	AddMenuItem(mTuning, 0, "Sair");
	
	for(new ct = count; ct < 17; ct++)
	    Tunes[ct] = -1;

	ShowMenuForPlayer(mTuning, playerid);
	TogglePlayerControllable(playerid, false);
	return 1;
}

stock InitPlayerTune(playerid)
{
    PlayerPlaySound(playerid, 1183, 0, 0, 0);
    SetPlayerInterior(playerid, 1);
    LinkVehicleToInterior(TuneVehicle, 1);
	SetPlayerPos(playerid, 608.7222, -24.7236, 1000.9203);
	SetPlayerFacingAngle(playerid, 0.0);
	SetVehiclePos(TuneVehicle, 615.0339, -3.8868, 1001.0250);
	SetVehicleZAngle(TuneVehicle, 270.2918);
	TogglePlayerControllable(playerid, false);
	TuneTimer = SetTimer("UpdateTuneCamera", 100, false);
}

stock StopPlayerTune(playerid)
{
    PlayerPlaySound(playerid, 1184, 0, 0, 0);
	KillTimer(TuneTimer);
    SetPlayerInterior(playerid, 0);
    LinkVehicleToInterior(TuneVehicle, 0);
    PutPlayerInVehicle(playerid, TuneVehicle, 0);
    SetVehiclePos(TuneVehicle, 1656.5331, -1826.1304, 13.6534);
    SetVehicleZAngle(TuneVehicle, 82.6385);
	TunnerID = -1;
	TuneVehicle = -1;
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, true);
}

stock ShowPaintjobCostMenu(playerid, paintjobid)
{
	ChangeVehiclePaintjob(TuneVehicle, paintjobid);
    DestroyMenu(mCusto);
    
    mCusto = CreateMenu("Pintura", 2, 2, 150, 100, 20);
    SetMenuColumnHeader(mCusto, 0, "Pintura");
	SetMenuColumnHeader(mCusto, 1, "Valor:");
    AddMenuItem(mCusto, 0, "Comprar");
    AddMenuItem(mCusto, 1, "$1000");
    AddMenuItem(mCusto, 0, "Cancelar");
    
    ShowMenuForPlayer(mCusto, playerid);
    TogglePlayerControllable(playerid, false);
    TuneComponent = paintjobid;
    Paintjob = true;
}

stock ShowTuningCostMenu(playerid, componentid)
{
    new s[32];
    
    format(s, 32, "$%d", GetComponentValue(componentid));
    AddVehicleComponent(TuneVehicle, componentid);
	DestroyMenu(mCusto);
	
	mCusto = CreateMenu("Componente", 2, 2, 150, 100, 20);
	SetMenuColumnHeader(mCusto, 0, Components[componentid - 1000][tuneName]);
	SetMenuColumnHeader(mCusto, 1, "Valor:");
	AddMenuItem(mCusto, 0, "Comprar");
	AddMenuItem(mCusto, 1, s);
	AddMenuItem(mCusto, 0, "Cancelar");
	
	ShowMenuForPlayer(mCusto, playerid);
	TogglePlayerControllable(playerid, false);
	TuneComponent = componentid;
	Paintjob = false;
}

stock GetComponentValue(componentid)
{
    if(!IsValidVehicleComponent(componentid))
		return 0;

	return Components[componentid - 1000][tuneValue];
}

stock GetComponentSlot(componentid)
{
	if(!IsValidVehicleComponent(componentid))
		return -1;
		
	return Components[componentid - 1000][tuneSlot];
}

stock CreateGang(const name[], leaderid, colour)
{
	new gpath[128], id;
	
	id = 1;
	gpath = GetGangFilePath(id);
	    
	while(fexist(gpath))
	{
	    if(hGetInt(gpath, "Deleted") == 1)
		    break;
		    
	    id = id + 1;
	    gpath = GetGangFilePath(id);
	}
	
	hSetString(gpath, "Name", name);
	hSetString(gpath, "Leader", PlayerName(leaderid));
	hSetInt(gpath, "Colour", colour);
	hSetInt(gpath, "Deleted", 0);
	hSetInt(gpath, "Conquered", 0);
	PutPlayerInGang(leaderid, id, GANGPOST_LEADER);
	return id;
}

stock GetGangColour(gangid)
	return GangColours[hGetInt(GetGangFilePath(gangid), "Colour")][gColourHex];

stock GetGangID(const name[])
{
	new gpath[128], id;
	
	id = 1;
	gpath = GetGangFilePath(id);
	
	while(fexist(gpath))
	{
	    if(hGetInt(gpath, "Deleted") == 0 && strcmp(hGetString(gpath, "Name"), name, true) == 0)
	        return id;
	        
	    id = id + 1;
	    gpath = GetGangFilePath(id);
	}
	
	return -1;
}
	
stock PutPlayerInGang(playerid, gangid, post)
	hSetInt(GANGS_FILE_PATH, PlayerName(playerid), encode_gang_data(gangid, post));

stock GetPlayerGang(playerid)
{
	new id, post;
	decode_gang_data(hGetInt(GANGS_FILE_PATH, PlayerName(playerid)), id, post);
	return id;
}

stock GetPlayerGangPost(playerid)
{
    new id, post;
	decode_gang_data(hGetInt(GANGS_FILE_PATH, PlayerName(playerid)), id, post);
	return post;
}

stock RemovePlayerFromGang(playerid)
	hUnset(GANGS_FILE_PATH, PlayerName(playerid));

stock UpdatePlayerZoneText(playerid)
{
	if(tdzone[playerid] == Text:INVALID_TEXT_DRAW)
	    return;

    new string[128], domain, zoneid;

    zoneid = Zone[playerid];
    domain = GetZoneDomain(zoneid);

	if(domain != 0)
	{
 		format(string, sizeof string, "~b~%s ~n~~l~%s", GangZones[zoneid][gzName], hGetString(GetGangFilePath(domain), "Name"));
 		
 		if(GangZones[zoneid][gzAttacker] == 0)
 		    format(string, sizeof string, "%s Territory", string);
 		    
		else
		    format(string, sizeof string, "%s ~n~~r~~h~vs ~n~~l~%s", string, hGetString(GetGangFilePath(GangZones[zoneid][gzAttacker]), "Name"));
	}
	else
		format(string, sizeof string, "~b~%s ~n~~l~Empty Territory", GangZones[zoneid][gzName]);

	TextDrawSetString(tdzone[playerid], string);
}

stock SetZoneDomain(zoneid, id)
{
	new zkey[128];
	valstr(zkey, zoneid);
	hSetInt(GANGZONES_FILE_PATH, zkey, id);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid)
			UpdatePlayerZoneText(n);
	}
	
	UpdateGangZone(zoneid);
}

stock GetZoneDomain(zoneid)
{
    new zkey[128];
	valstr(zkey, zoneid);
	return hGetInt(GANGZONES_FILE_PATH, zkey);
}

stock RemoveZoneDomain(zoneid)
{
    new zkey[128];
	valstr(zkey, zoneid);
	hUnset(GANGZONES_FILE_PATH, zkey);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid)
			UpdatePlayerZoneText(n);
	}
	
	UpdateGangZone(zoneid);
}

stock ShowGangZones(playerid)
{
    new domain;
    
	for(new z = 0; z < sizeof GangZones; z++)
	{
	    GangZoneStopFlashForPlayer(playerid, GangZones[z][gzId]);
	    GangZoneHideForPlayer(playerid, GangZones[z][gzId]);
	    
	    domain = GetZoneDomain(z);
	    
	    if(domain != 0)
	    {
			GangZoneShowForPlayer(playerid, GangZones[z][gzId], GetGangColour(domain) & 0xFFFFFF55);
			
			if(GangZones[z][gzAttacker] != 0)
		    	GangZoneFlashForPlayer(playerid, GangZones[z][gzId], COLOUR_RED);
		}
	}
}

stock UpdateGangZone(zoneid)
{
	new domain;
	
	GangZoneStopFlashForAll(GangZones[zoneid][gzId]);
	GangZoneHideForAll(GangZones[zoneid][gzId]);

	domain = GetZoneDomain(zoneid);
	
	if(domain != 0)
	{
	    GangZoneShowForAll(GangZones[zoneid][gzId], GetGangColour(domain) & 0xFFFFFF55);

		if(GangZones[zoneid][gzAttacker] != 0)
	    	GangZoneFlashForAll(GangZones[zoneid][gzId], COLOUR_RED);
	}
}

stock FinishWar(zoneid)
{
	GangZones[zoneid][gzAttacker] = 0;
	GangZones[zoneid][gzScore] = 0;
	KillTimer(GangZones[zoneid][gzTimer]);

	UpdateGangZone(zoneid);

	for(new n = 0; n < MAX_SLOTS; n++)
	{
 		if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid)
			UpdatePlayerZoneText(n);
	}
}

stock DeleteGang(id)
{
	new File:fpw, File:fpr, data[128], value, idx, gangid, post;

	fpw = fopen("gangs.buf", io_write);
	fpr = fopen(GANGS_FILE_PATH, io_read);
	
	while(fread(fpr, data, sizeof data))
	{
	    idx = 0;
	    strtok(data, idx, HSYS_SEP_CHAR);
	    value = strval(strtok(data, idx));
	    decode_gang_data(value, gangid, post);
	    
		if(gangid != id)
		    fwrite(fpw, data);
	}
	
	fclose(fpw);
	fclose(fpr);
	
	if(fcopytextfile("gangs.buf", GANGS_FILE_PATH))
		fremove("gangs.buf");
		
	for(new z = 0; z < sizeof GangZones; z++)
	{
	    if(GetZoneDomain(z) == id)
	        RemoveZoneDomain(z);
	}
	
	hSetInt(GetGangFilePath(id), "Deleted", 1);
}

stock SaveHousePos(houseid, Float:X, Float:Y, Float:Z, Float:A)
{
	new str[128];
	format(str, sizeof str, "%.4f,%.4f,%.4f,%.4f", X, Y, Z, A);
	hSetString(GetHouseFilePath(houseid), "Position", str);
}

stock LoadHousePos(houseid, &Float:X, &Float:Y, &Float:Z, &Float:A)
{
	new str[128], idx = 0;

	str = hGetString(GetHouseFilePath(houseid), "Position");

	X = floatstr(strtok(str, idx, ','));
	Y = floatstr(strtok(str, idx, ','));
	Z = floatstr(strtok(str, idx, ','));
	A = floatstr(strtok(str, idx, ','));
}

stock CreateHouse(const owner[], value, Float:X, Float:Y, Float:Z, Float:A, onsale = 0)
{
	new hpath[128], id;
	
	id = 0;
	hpath = GetHouseFilePath(id);
	
	while(fexist(hpath))
	{
	    if(hGetInt(hpath, "Deleted") == 1)
		    break;
	    
	    id = id + 1;
	    hpath = GetHouseFilePath(id);
	}
	
	if(id > MAX_HOUSES)
	    return -1;
	    
	if(id >= ServerHouses)
	    ServerHouses = id + 1;
	    
	hSetString(hpath, "Owner", owner);
	hSetInt(hpath, "Value", value);
	SaveHousePos(id, X, Y, Z, A);
	hSetInt(hpath, "OnSale", onsale);
	hSetInt(hpath, "Deleted", 0);
	
	if(Houses[id][hPickup] != -1)
	    DestroyPickup(Houses[id][hPickup]);
	    
	Houses[id][hPickup] = CreatePickup((!onsale) ? 1272 : 1273, 1, X, Y, Z);
	return id;
}

stock PutHouseOnSale(id, onsale)
{
	new Float:X, Float:Y, Float:Z, Float:A;
	
	if(Houses[id][hPickup] != -1)
		DestroyPickup(Houses[id][hPickup]);

	LoadHousePos(id, X, Y, Z, A);
    Houses[id][hPickup] = CreatePickup((!onsale) ? 1272 : 1273, 1, X, Y, Z);
    hSetInt(GetHouseFilePath(id), "OnSale", onsale);
}

stock PutPlayerOnHouse(playerid, houseid)
{
	new Float:X, Float:Y, Float:Z, Float:A;
	
	LoadHousePos(houseid, X, Y, Z, A);
	SavePlayerPos(playerid, X, Y, Z, A);
	hSetInt(GetPlayerXFilePath(playerid), "House", houseid);
	UpdatePlayerSpawn(playerid);
}

stock GetPlayerHouse(playerid)
	return hGetInt(GetPlayerXFilePath(playerid), "House");

stock RemovePlayerFromHouse(playerid)
{
    SavePlayerPos(playerid, 1686.0055, -2239.6494, 13.5469, 176.8181);
    hSetInt(GetPlayerXFilePath(playerid), "House", -1);
	UpdatePlayerSpawn(playerid);
}

stock DeleteHouse(id)
{
    if(Houses[id][hPickup] != -1)
	    DestroyPickup(Houses[id][hPickup]);
	    
	Houses[id][hPickup] = -1;
	hSetInt(GetHouseFilePath(id), "Deleted", 1);
}

stock LoadHouses()
{
	new hpath[128], id;
	new Float:X, Float:Y, Float:Z, Float:A;
	
	id = 0;
	hpath = GetHouseFilePath(id);
	
	while(id < MAX_HOUSES)
	{
	    if(!fexist(hpath))
	        break;
	        
		LoadHousePos(id, X, Y, Z, A);
		
		if(hGetInt(hpath, "Deleted") == 0)
			Houses[id][hPickup] = CreatePickup((!hGetInt(hpath, "OnSale")) ? 1272 : 1273, 1, X, Y, Z);
		else
		    Houses[id][hPickup] = -1;

		ServerHouses = id = id + 1;
		hpath = GetHouseFilePath(id);
	}
}

stock GetHouses()
	return (ServerHouses);

stock CreateCellPhone(const owner[])
{
	new cell_owner[128], number_key[128];
	new number;

	number = 1000 + random(5);
	valstr(number_key, number);
	cell_owner = GetCellPhoneOwner(number_key);

	while(strlen(cell_owner) != 0)
	{
	    number += random(5);
		valstr(number_key, number);
		cell_owner = GetCellPhoneOwner(number_key);
	}
	
	hSetString(CELLPHONE_FILE_PATH, owner, number_key);
	return number;
}

stock GetPlayerCellPhone(playerid)
	return hGetInt(CELLPHONE_FILE_PATH, PlayerName(playerid));

stock GetCellPhoneOwner(const number[])
{
    new File:fcell, data[128];
    
	fcell = fopen(CELLPHONE_FILE_PATH, io_read);

	while(fread(fcell, data, sizeof data))
	{
	    new buffer[128], sep;

        StripNewLine(data);
	    sep = strfind(data, HSYS_SEP_CHAR_STRING, true);
	    strmid(buffer, data, sep+1, strlen(data));

	    if(strcmp(buffer, number, true) == 0)
		{
		    strmid(buffer, data, 0, sep);
		    fclose(fcell);
		    return buffer;
		}
	}

	fclose(fcell);
	return data;
}

stock AddPlayerContact(playerid, const name[], const number[])
{
	new kpath[128], key[128], data[128], str[128];
	new c;
	
	kpath = GetPlayerKFilePath(playerid);
	format(str, sizeof str, "%s->%s", name, number);

	for(c = 1;; c++)
	{
		format(key, sizeof key, "Contact%d", c);
		data = hGetString(kpath, key);
		
		if(!strlen(data))
		{
		    hSetString(kpath, key, str);
		    return c;
		}
	}
	
	return -1;
}

stock GetPlayerContact(playerid, contact, name[], number[])
{
	new key[128], data[128];
	new n, o;
	
	n = o = 0;
	format(key, sizeof key, "Contact%d", contact);
	data = hGetString(GetPlayerKFilePath(playerid), key);
	
	if(!strlen(data))
	{
	    name[0] = number[0] = '\0';
	    return 0;
	}
	
	while(n < strlen(data))
	{
	    if(data[n] == '-' && data[n+1] == '>')
	        break;
	        
	    name[n] = data[n];
	    ++n;
	}
	name[n] = '\0';
	
	n += 2;
	
	while(n < strlen(data))
	{
	    number[o++] = data[n++];
	}
	number[o++] = '\0';
	
	return 1;
}

stock RemovePlayerCellPhone(playerid)
	hUnset(CELLPHONE_FILE_PATH, PlayerName(playerid));

public OnGameModeInit()
{
	print("Iniciando Virtual Society RPG...\n");
	SetGameModeText("Virtual Society RPG");
	SendRconCommand("hostname Virtual Society RPG Server");
	SendRconCommand("mapname Los Santos");
	SendRconCommand("loadfs hcam");
	SendRconCommand("loadfs adminspec");
	SendRconCommand("loadfs vltools");
	
	print("Configuracoes de servidor definidas.");
	
	EnableTirePopping(true);
	AllowInteriorWeapons(true);
	ShowNameTags(false);
	EnableZoneNames(false);
	ShowPlayerMarkers(false);
	EnableStuntBonusForAll(false);
	DisableInteriorEnterExits();
	
	print("Configuracoes de jogo definidas.");
	
	ServerVehicles = 1;
	ServerHouses = CurrentTime = CurrentDay = 0;
	
	if(fexist(GLOBAL_FILE_PATH))
	    LoadGlobalData();
	
	SetWorldTime(CurrentHour);
	
	print("Dados globais definidos.");

	fcreate(BAN_FILE_PATH);
	fcreate(ACTION_REPORT_FILE_PATH);
	fcreate(CHAT_REPORT_FILE_PATH);
	fcreate(GLOBAL_FILE_PATH);
	fcreate(SERVER_VEHICLES_FILE_PATH);
	fcreate(GANGZONES_FILE_PATH);
	fcreate(GANGS_FILE_PATH);
	fcreate(CELLPHONE_FILE_PATH);

	print("Arquivos essenciais do servidor criados.");
	
    //----------------------------------------------CLASSES----------------------------------------------
    
    AddPlayerClass(240, -1983.3894, 152.8307, 27.6875, 86.9105, 0, 0, 0, 0, 0, 0);
    
    print("Classes definidas.");
	
	//----------------------------------------------VEÍCULOS----------------------------------------------

	//Taxis da história
	TAXI_HISTORY[0] = AddStaticServerVehicle(420, -1994.0032, 157.1385, 27.3179, 180.9080, 6, 1, -1, HISTORY_VIRTUAL_WORLD);
	TAXI_HISTORY[1] = AddStaticServerVehicle(420, -1447.8182, -281.7279, 13.7789, 66.3621, 6, 1, -1, HISTORY_VIRTUAL_WORLD);
	
	//Concessionária
    ON_SALE[0] = AddStaticServerVehicle(RandomCTMCarModel(), 523.0317, -1285.6986, 16.9693, 224.3670, random(300), random(300), -1);
	ON_SALE[1] = AddStaticServerVehicle(RandomCTMCarModel(), 527.1592, -1283.5313, 17.0428, 221.3689, random(300), random(300), -1);
	ON_SALE[2] = AddStaticServerVehicle(RandomCTMCarModel(), 530.2834, -1279.9467, 16.9853, 218.5538, random(300), random(300), -1);
	ON_SALE[3] = AddStaticServerVehicle(RandomCTMCarModel(), 533.6448, -1277.0543, 16.9467, 219.8068, random(300), random(300), -1);
	ON_SALE[4] = AddStaticServerVehicle(RandomCTMCarModel(), 537.5171, -1273.4572, 16.9584, 221.2893, random(300), random(300), -1);
	ON_SALE[5] = AddStaticServerVehicle(RandomCTMCarModel(), 541.0671, -1271.2107, 17.1185, 222.1353, random(300), random(300), -1);
	ON_SALE[6] = AddStaticServerVehicle(RandomCTMCarModel(), 544.2247, -1268.4381, 16.9711, 217.3420, random(300), random(300), -1);
	ON_SALE[7] = AddStaticServerVehicle(RandomCTMCarModel(), 549.1544, -1265.6058, 17.0240, 217.4697, random(300), random(300), -1);
	ON_SALE[8] = AddStaticServerVehicle(RandomCTMCarModel(), 561.9513, -1266.1251, 17.0053, 104.6485, random(300), random(300), -1);
	ON_SALE[9] = AddStaticServerVehicle(RandomCTMCarModel(), 562.6890, -1270.3535, 16.9219, 101.4287, random(300), random(300), -1);
	ON_SALE[10] = AddStaticServerVehicle(RandomCTMCarModel(), 564.0649, -1275.0378, 17.0123, 105.3904, random(300), random(300), -1);
	ON_SALE[11] = AddStaticServerVehicle(RandomCTMCarModel(), 565.0479, -1279.5303, 16.9682, 104.7820, random(300), random(300), -1);
	ON_SALE[12] = AddStaticServerVehicle(RandomCTMCarModel(), 566.1403, -1283.9686, 16.9651, 102.4760, random(300), random(300), -1);
	ON_SALE[13] = AddStaticServerVehicle(RandomCTMCarModel(), 552.1501, -1290.4183, 17.0286, 5.6902, random(300), random(300), -1);
	ON_SALE[14] = AddStaticServerVehicle(RandomCTMCarModel(), 546.5675, -1290.3252, 17.0598, 1.9372, random(300), random(300), -1);
	ON_SALE[15] = AddStaticServerVehicle(RandomCTMCarModel(), 540.9741, -1290.6298, 17.0048, 3.3713, random(300), random(300), -1);
	ON_SALE[16] = AddStaticServerVehicle(RandomCTMCarModel(), 535.9780, -1291.0809, 16.9018, 3.2596, random(300), random(300), -1);
	ON_SALE[17] = AddStaticServerVehicle(RandomCTMCarModel(), 531.1604, -1291.6782, 16.8667, 6.3699, random(300), random(300), -1);
	ON_SALE[18] = AddStaticServerVehicle(RandomCTMCarModel(), 525.7900, -1291.7200, 16.8673, 4.6144, random(300), random(300), -1);
	ON_SALE[19] = AddStaticServerVehicle(RandomCTMBikeModel(), 516.3486, -1302.4760, 16.8060, 100.3939, random(300), random(300), -1);
	ON_SALE[20] = AddStaticServerVehicle(RandomCTMBikeModel(), 516.4780, -1298.9739, 16.9104, 98.0437, random(300), random(300), -1);
	ON_SALE[21] = AddStaticServerVehicle(RandomCTMBikeModel(), 500.1251, -1305.2465, 16.8389, 314.5018, random(300), random(300), -1);
	ON_SALE[22] = AddStaticServerVehicle(RandomCTMBikeModel(), 505.1902, -1312.2517, 16.7817, 326.2239, random(300), random(300), -1);
	ON_SALE[23] = AddStaticServerVehicle(RandomCTMBikeModel(), 507.6706, -1295.6622, 16.7819, 207.3555, random(300), random(300), -1);
	ON_SALE[24] = AddStaticServerVehicle(RandomCTMBikeModel(), 501.4510, -1300.6454, 16.7823, 234.5764, random(300), random(300), -1);

	//Taxis
	TAXI[0] = AddStaticServerVehicle(438, 819.1214, -1331.0079, 13.4143, 269.7436, 6, 76, 1500);
	TAXI[1] = AddStaticServerVehicle(438, 831.4522, -1331.0288, 13.4109, 269.8347, 6, 76, 1500);
	TAXI[2] = AddStaticServerVehicle(438, 1731.8976, -1859.9222, 13.4936, 270.0624, 6, 76, 1500);
	TAXI[3] = AddStaticServerVehicle(438, 1751.7062, -1859.8851, 13.4937, 269.6627, 6, 76, 1500);
	TAXI[4] = AddStaticServerVehicle(438, 1764.4209, -1859.4241, 13.4925, 272.2686, 6, 76, 1500);
	TAXI[5] = AddStaticServerVehicle(420, 1602.3820, -2323.9858, 13.2405, 268.1321, 6, 1, 1500);
	TAXI[6] = AddStaticServerVehicle(420, 1590.0577, -2323.4314, 13.2433, 270.2686, 6, 1, 1500);
	TAXI[7] = AddStaticServerVehicle(420, 1673.9122, -2323.7222, 13.2412, 271.2279, 6, 1, 1500);
	TAXI[8] = AddStaticServerVehicle(420, 1664.6428, -2323.8582, 13.2406, 271.0942, 6, 1, 1500);
	TAXI[9] = AddStaticServerVehicle(420, 1691.2306, -2249.2820, 13.2406, 92.7289, 6, 1, 1500);
	TAXI[10] = AddStaticServerVehicle(420, 1702.7806, -2248.9688, 13.2395, 91.1600, 6, 1, 1500);
	TAXI[11] = AddStaticServerVehicle(420, 1714.4613, -2249.0461, 13.2408, 89.9985, 6, 1, 1500);
	TAXI[12] = AddStaticServerVehicle(420, 1622.0067, -2248.9336, 13.1951, 90.6844, 6, 1, 1500);
	TAXI[13] = AddStaticServerVehicle(420, 1632.3693, -2248.9099, 13.1889, 90.3802, 6, 1, 1500);
    
	//Viaturas policiais
	POLICE_CAR[0] = AddStaticServerVehicle(596, 1602.4550, -1692.0828, 5.6119, 87.6407, 0, 1, 1500);
	POLICE_CAR[1] = AddStaticServerVehicle(596, 1595.7861, -1710.6042, 5.6111, 180.9565, 0, 1, 1500);
	POLICE_CAR[2] = AddStaticServerVehicle(596, 1602.5198, -1704.5690, 5.6110, 268.2650, 0, 1, 1500);
	POLICE_CAR[3] = AddStaticServerVehicle(596, 1578.8854, -1710.8158, 5.6119, 4.2028, 0, 1, 1500);
	POLICE_CAR[4] = AddStaticServerVehicle(596, 1583.3650, -1709.7899, 5.6105, 0.6656, 0, 1, 1500);
	POLICE_CAR[5] = AddStaticServerVehicle(599, 1528.8562, -1688.0713, 6.0859, 268.7318, 0, 1, 1500);
	POLICE_CAR[6] = AddStaticServerVehicle(599, 1545.5343, -1684.3622, 6.0858, 271.6546, 0, 1, 1500);
	POLICE_CAR[7] = AddStaticServerVehicle(599, 1528.5190, -1684.2440, 6.0801, 271.2212, 0, 1, 1500);
	POLICE_CAR[8] = AddStaticServerVehicle(601, 1526.6083, -1646.1589, 5.6493, 181.0309, 1, 1, 1500);
	POLICE_CAR[9] = AddStaticServerVehicle(601, 1530.5721, -1645.4734, 5.6494, 180.0574, 1, 1, 1500);
	POLICE_CAR[10] = AddStaticServerVehicle(601, 1534.4719, -1644.5435, 5.6494, 181.6775, 1, 1, 1500);
	POLICE_CAR[11] = AddStaticServerVehicle(490, 1544.1970, -1659.1174, 6.0174, 90.1346, 0, 0, 1500);
	POLICE_CAR[12] = AddStaticServerVehicle(490, 1544.2947, -1655.3331, 6.0150, 89.0285, 0, 0, 1500);
	POLICE_CAR[13] = AddStaticServerVehicle(528, 1546.3007, -1671.9025, 5.9359, 271.3317, 0, 0, 1500);
	POLICE_CAR[14] = AddStaticServerVehicle(497, 1548.2708, -1609.3802, 13.5598, 266.4010, 0, 1, 1500);
	POLICE_CAR[15] = AddStaticServerVehicle(596, 1535.6702, -1677.3376, 13.1029, 182.2982, 0, 1, 1500);
	POLICE_CAR[16] = AddStaticServerVehicle(596, 1535.7382, -1668.7234, 13.1053, 179.9176, 0, 1, 1500);

	//Mobiletes de pizzas
	SCOOTER[0] = AddStaticServerVehicle(448, 2420.4075, -1506.1901, 23.6005, 225.0573, 1, 1, 1500);
	SCOOTER[1] = AddStaticServerVehicle(448, 2421.1982, -1502.3376, 23.5958, 224.3240, 1, 1, 1500);
	SCOOTER[2] = AddStaticServerVehicle(448, 2106.0051, -1823.7356, 13.1554, 149.8786, 3, 3, 1500);
	SCOOTER[3] = AddStaticServerVehicle(448, 2109.7458, -1823.9795, 13.1564, 165.3501, 3, 3, 1500);
	SCOOTER[4] = AddStaticServerVehicle(448, 2112.8423, -1823.9657, 13.1563, 162.9039, 3, 3, 1500);
	SCOOTER[6] = AddStaticServerVehicle(448, 925.7306, -1367.1132, 12.9862, 104.8732, 1, 1, 1500);
	SCOOTER[7] = AddStaticServerVehicle(448, 925.7845, -1370.7955, 12.9870, 107.2265, 1, 1, 1500);
	SCOOTER[8] = AddStaticServerVehicle(448, 925.7827, -1373.9515, 12.9919, 115.9917, 1, 1, 1500);
	SCOOTER[5] = AddStaticServerVehicle(448, 925.7880, -1377.5436, 12.9965, 111.0582, 1, 1, 1500);
	SCOOTER[9] = AddStaticServerVehicle(448, 1194.5109, -918.1219, 42.7635, 169.9314, 1, 1, 1500);
	SCOOTER[10] = AddStaticServerVehicle(448, 1192.2605, -918.1891, 42.7941, 159.0664, 1, 1, 1500);
	SCOOTER[11] = AddStaticServerVehicle(448, 1189.9200, -918.3164, 42.8225, 162.4739, 1, 1, 1500);
	SCOOTER[12] = AddStaticServerVehicle(448, 2107.9373, -1789.3097, 13.1599, 36.5274, 3, 3, 1500);
	SCOOTER[13] = AddStaticServerVehicle(448, 2113.0754, -1789.7708, 13.1563, 32.7196, 3, 3, 1500);
	SCOOTER[14] = AddStaticServerVehicle(448, 2119.3191, -1789.6335, 13.1539, 44.7330, 3, 3, 1500);
	SCOOTER[15] = AddStaticServerVehicle(448, 2386.4348, -1940.7319, 13.1463, 20.9274, 1, 1, 1500);
	SCOOTER[16] = AddStaticServerVehicle(448, 2384.2422, -1940.7759, 13.1462, 34.3919, 1, 1, 1500);
	SCOOTER[17] = AddStaticServerVehicle(448, 811.5091, -1622.5645, 13.1460, 320.0887, 1, 1, 1500);
	SCOOTER[18] = AddStaticServerVehicle(448, 811.4879, -1625.6501, 13.1471, 319.9782, 1, 1, 1500);

	//Ônibus
	BUS[0] = AddStaticServerVehicle(437, 1776.0012, -1900.8937, 13.5197, 359.5530, 3, 3, 1500);
	BUS[1] = AddStaticServerVehicle(437, 1780.5214, -1886.9775, 13.5053, 269.8320, 12, 5, 1500);
	BUS[2] = AddStaticServerVehicle(437, 1797.6726, -1887.0562, 13.5146, 269.6795, 10, 12, 1500);
	BUS[3] = AddStaticServerVehicle(437, 1804.8771, -1904.5969, 13.5126, 359.6853, 1, 0, 1500);
	BUS[4] = AddStaticServerVehicle(437, 1804.8460, -1917.3571, 13.5271, 359.8046, 0, 1, 1500);
	BUS[5] = AddStaticServerVehicle(437, 1776.0072, -1930.1928, 13.5191, 359.1499, 0, 0, 1500);
	BUS[6] = AddStaticServerVehicle(437, 1775.9615, -1914.3555, 13.5239, 359.0487, 2, 3, 1500);
	BUS[7] = AddStaticServerVehicle(437, 1786.7838, -1930.4063, 13.5207, 0.8778, 4, 7, 1500);
	BUS[8] = AddStaticServerVehicle(437, 1795.2592, -1930.3631, 13.5208, 1.3984, 12, 10, 1500);
	BUS[9] = AddStaticServerVehicle(437, 1804.3299, -1930.3337, 13.5208, 359.9374, 12, 10, 1500);

	//Trens
	TRAIN[0] = AddStaticServerVehicle(538, 1721.6516, -1953.7332, 13.9973, 89.7698, 1, 1, 1500);
	
	//Ambulâncias
	AMBULANCE[0] = AddStaticServerVehicle(416, 2008.2649, -1410.5100, 17.1400, 268.3522, 1, 3, 1500);
	AMBULANCE[1] = AddStaticServerVehicle(416, 2018.3779, -1410.5839, 17.1416, 272.0816, 1, 3, 1500);
	AMBULANCE[2] = AddStaticServerVehicle(416, 2036.9752, -1420.8744, 17.1415, 179.3431, 1, 3, 1500);
	AMBULANCE[3] = AddStaticServerVehicle(416, 2036.8904, -1432.9705, 17.2389, 179.5465, 1, 3, 1500);
	AMBULANCE[4] = AddStaticServerVehicle(416, 2036.7858, -1441.9711, 17.5422, 178.9464, 1, 3, 1500);
	AMBULANCE[5] = AddStaticServerVehicle(416, 1177.9268, -1339.1553, 14.0499, 268.5952, 1, 3, 1500);
	AMBULANCE[6] = AddStaticServerVehicle(416, 1177.7775, -1308.9033, 13.9982, 269.9618, 1, 3, 1500);
	AMBULANCE[7] = AddStaticServerVehicle(416, 1147.5266, -1312.9993, 13.8235, 1.6091, 1, 3, 1500);
	AMBULANCE[8] = AddStaticServerVehicle(416, 1147.5448, -1346.3115, 13.7885, 358.9389, 1, 3, 1500);
	AMBULANCE[9] = AddStaticServerVehicle(416, 299.9828, -1490.0820, 24.7430, 56.8459, 248, 26, 1500);
	AMBULANCE[10] = AddStaticServerVehicle(416, 301.4958, -1504.5507, 24.7465, 234.5104, 248, 26, 1500);
	AMBULANCE[11] = AddStaticServerVehicle(416, 293.3556, -1512.4993, 24.7427, 57.5819, 248, 26, 1500);
	AMBULANCE[12] = AddStaticServerVehicle(416, 295.3580, -1540.6005, 24.7428, 54.8311, 248, 26, 1500);
	AMBULANCE[13] = AddStaticServerVehicle(416, 278.1984, -1535.1519, 24.7441, 52.7579, 248, 26, 1500);
	AMBULANCE[14] = AddStaticServerVehicle(416, 281.5615, -1531.1526, 24.7434, 53.0637, 248, 26, 1500);
	AMBULANCE[15] = AddStaticServerVehicle(416, 298.9799, -1535.9163, 24.7432, 235.2808, 248, 26, 1500);

	//Reboques
	TOWTRUCK[0] = AddStaticServerVehicle(525, 2067.7021, -1880.4147, 13.4281, 1.5090, 0, 0, 1500);
	TOWTRUCK[1] = AddStaticServerVehicle(525, 2061.6379, -1881.1895, 13.4259, 4.3092, 0, 0, 1500);
	TOWTRUCK[2] = AddStaticServerVehicle(525, 2056.7617, -1881.2979, 13.4236, 359.1190, 0, 0, 1500);
	TOWTRUCK[3] = AddStaticServerVehicle(525, 2066.9209, -1865.5039, 13.4193, 272.7908, 0, 0, 1500);
	TOWTRUCK[4] = AddStaticServerVehicle(525, 1012.4976, -1007.5508, 31.9744, 0.9826, 17, 20, 1500);
	TOWTRUCK[5] = AddStaticServerVehicle(525, 1052.5576, -1028.1654, 31.9762, 90.7874, 17, 20, 1500);
	TOWTRUCK[6] = AddStaticServerVehicle(525, 2136.4192, -1122.1799, 25.3064, 264.0780, 17, 20, 1500);
	TOWTRUCK[7] = AddStaticServerVehicle(525, 2118.6643, -1123.9805, 25.2307, 179.7233, 17, 20, 1500);
	TOWTRUCK[8] = AddStaticServerVehicle(525, 2116.9741, -1155.8420, 24.2278, 178.7871, 17, 20, 1500);
	TOWTRUCK[9] = AddStaticServerVehicle(525, 2121.4861, -1156.4104, 23.9862, 5.2446, 17, 20, 1500);
	TOWTRUCK[10] = AddStaticServerVehicle(525, 1630.6492, -1844.8137, 13.4027, 2.2147, 6, 6, 1500);
	TOWTRUCK[11] = AddStaticServerVehicle(525, 1604.2238, -1836.8903, 13.3784, 90.3636, 6, 6, 1500);
    TOWTRUCK[12] = AddStaticServerVehicle(525, 1603.9979, -1825.0229, 13.3390, 271.6223, 6, 6, 1500);

	//Caminhões
	ROADTRAIN[0] = AddStaticServerVehicle(515, -25.9091, -1125.6276, 2.0959, 156.6339, 1, 1, 1500);
	ROADTRAIN[1] = AddStaticServerVehicle(515, -31.9627, -1122.5128, 2.0941, 159.2668, 1, 1, 1500);
	ROADTRAIN[2] = AddStaticServerVehicle(515, -41.1079, -1154.1105, 2.0997, 333.7027, 0, 0, 1500);
	ROADTRAIN[3] = AddStaticServerVehicle(515, -46.7881, -1151.2979, 2.1006, 334.2426, 0, 0, 1500);
	ROADTRAIN[4] = AddStaticServerVehicle(515, -54.1436, -1147.3413, 2.1026, 335.0638, 0, 0, 1500);
	ROADTRAIN[5] = AddStaticServerVehicle(515, -64.3376, -1143.3712, 2.0912, 334.5053, 3, 3, 1500);
	ROADTRAIN[6] = AddStaticServerVehicle(515, -76.9244, -1107.1552, 2.0981, 341.7137, 3, 3, 1500);
	ROADTRAIN[7] = AddStaticServerVehicle(515, -71.8078, -1108.9504, 2.0943, 336.4194, 4, 4, 1500);
	ROADTRAIN[8] = AddStaticServerVehicle(515, -64.4729, -1111.6241, 2.0977, 341.3115, 5, 5, 1500);
	ROADTRAIN[9] = AddStaticServerVehicle(515, -84.3087, -1137.0539, 2.0970, 65.5803, 6, 6, 1500);

	//Caminhões de Lixo
	TRASHMASTER[0] = AddStaticServerVehicle(408, 2193.1089, -1998.9708, 14.0980, 0.6164, 26, 26, 1500);
	TRASHMASTER[1] = AddStaticServerVehicle(408, 2192.5977, -1988.6586, 14.1027, 358.8533, 26, 26, 1500);
	TRASHMASTER[2] = AddStaticServerVehicle(408, 2183.7729, -1976.1185, 14.0879, 271.5020, 26, 26, 1500);
	TRASHMASTER[3] = AddStaticServerVehicle(408, 2172.1758, -1976.4158, 14.1002, 270.6591, 26, 26, 1500);
	TRASHMASTER[4] = AddStaticServerVehicle(408, 2134.8611, -1992.3157, 14.1159, 46.7634, 26, 26, 1500);
	TRASHMASTER[5] = AddStaticServerVehicle(408, 2109.8235, -1977.1097, 14.0963, 84.5820, 26, 26, 1500);
	TRASHMASTER[6] = AddStaticServerVehicle(408, 2163.6826, -1971.4028, 14.1084, 89.2430, 26, 26, 1500);
	TRASHMASTER[7] = AddStaticServerVehicle(408, 2199.6853, -2008.7858, 14.0966, 204.4687, 26, 26, 1500);
	TRASHMASTER[8] = AddStaticServerVehicle(408, 2176.6897, -1989.8345, 14.0799, 225.5070, 26, 26, 1500);
	TRASHMASTER[9] = AddStaticServerVehicle(408, 2188.8103, -1957.3350, 14.0817, 312.1083, 26, 26, 1500);
	TRASHMASTER[10] = AddStaticServerVehicle(408, 2196.0942, -1951.3110, 14.1013, 314.1055, 26, 26, 1500);

    //Veículos de Jornal
    NEWS[0] = AddStaticServerVehicle(582, 784.3352, -1334.6821, 13.5970, 180.9193, 28, 1, 1500);
	NEWS[1] = AddStaticServerVehicle(582, 784.9918, -1381.4732, 13.7454, 179.1368, 28, 1, 1500);
	NEWS[2] = AddStaticServerVehicle(582, 771.2732, -1383.0634, 13.7487, 271.4456, 28, 1, 1500);
	NEWS[3] = AddStaticServerVehicle(582, 770.9789, -1332.1108, 13.6019, 268.7138, 28, 1, 1500);
	NEWS[4] = AddStaticServerVehicle(582, 759.2692, -1373.3521, 13.6101, 179.7464, 28, 1, 1500);
	NEWS[5] = AddStaticServerVehicle(582, 783.6256, -1370.2388, 13.6036, 269.3164, 28, 1, 1500);
	NEWS[6] = AddStaticServerVehicle(582, 782.3480, -1356.6580, 13.6003, 90.7807, 28, 1, 1500);
	NEWS[7] = AddStaticServerVehicle(582, 782.7422, -1342.7020, 13.5944, 92.3662, 28, 1, 1500);
	NEWS[8] = AddStaticServerVehicle(488, 740.1388, -1336.7260, 13.7178, 269.2817, 28, 1, 1500);
	NEWS[9] = AddStaticServerVehicle(488, 739.2801, -1347.8876, 13.6882, 269.7373, 28, 1, 1500);

    ServerVehicles = CreateVehicle(400, 0.0, 0.0, 0.0, 0.0, 0, 0, 0);
    DestroyVehicle(ServerVehicles);
	
    //Veículos dos jogadores
    LoadPlayerVehicles();
    
    printf("Veiculos carregados [Servidor: %d] [Jogadores: %d] [Total: %d]", ServerVehicles, PlayerVehicles, GetVehicles());
    
    //----------------------------------------------ENTRADAS----------------------------------------------

	for(new i = 0; i < sizeof Ints; i++)
	    AddStaticPickup(Ints[i][intPickupId], 1, Ints[i][intX], Ints[i][intY], Ints[i][intZ]);
	
	for(new e = 0; e < sizeof Enters; e++)
	{
	    new int;

		int = Enters[e][intId];
	    
	    AddStaticPickup(Ints[Enters[e][intId]][intPickupId], 1, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ]);
	    Create3DTextLabel(Ints[int][intName], COLOUR_GREEN | 0xFF, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ] + 0.7, 30.0, 0);
	}
	
	print("Entradas (Pickups e Textos 3D) criadas.");
	
	//----------------------------------------------EMPRESAS----------------------------------------------
	
	for(new i = 0; i < sizeof Companies; i++)
	{
	    AddStaticPickup(1239, 1, Companies[i][cX], Companies[i][cY], Companies[i][cZ]);
	    Create3DTextLabel(Jobs[Companies[i][cJob]][jobName], COLOUR_WHITE | 0xFF, Companies[i][cX], Companies[i][cY], Companies[i][cZ] + 0.7, 30.0, 0);
	}
	
	print("Empresas (Pickups e Textos 3D) criadas.");
	
	//----------------------------------------------AREAS----------------------------------------------

	for(new a = 0; a < sizeof Areas; a++)
	{
		if(Areas[a][areaPickupId] != 0)
		{
	    	AddStaticPickup(Areas[a][areaPickupId], 1, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ]);
	    	Create3DTextLabel(Areas[a][areaName], COLOUR_GREEN | 0xFF, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ] + 0.7, 30.0, 0);
		}
	}

	print("Areas (Pickups e Textos 3D) criadas.");
	
	//---------------------------------------------GANGZONES--------------------------------------------
	
	for(new z = 0; z < sizeof GangZones; z++)
	    GangZones[z][gzId] = GangZoneCreate(GangZones[z][gzMinX], GangZones[z][gzMinY], GangZones[z][gzMaxX], GangZones[z][gzMaxY]);
	
	//----------------------------------------------OBJETOS---------------------------------------------

	//Porta do restaurante
	CreateObject(1508, 683.0581, -450.4232, -24.9171, 0.0, 0.0, 89.0463);
	
	//Porta da seguradora
	CreateObject(1506, 2160.3830, 1603.3161, 998.9749, 0.0, 0.0, 270.8801);
	
	//Delegacia
	CreateObject(997, 1544.6853, -1622.5495, 12.6468, 0.0, 0.0, 89.5565);
	CreateObject(997, 1544.5142, -1636.4052, 12.6543, 0.0, 0.0, 90.1831);
	CreateObject(1553, 1590.9246, -1665.2662, 11.0906, 0.0, 0.0, 0.0962);
	CreateObject(1553, 1593.6812, -1665.2662, 11.0906, 0.0, 0.0, 0.0962);
	CreateObject(1553, 1596.4378, -1665.2662, 11.0906, 0.0, 0.0, 0.0962);
	CreateObject(1553, 1599.1944, -1665.2662, 11.0906, 0.0, 0.0, 0.0962);
	CreateObject(1553, 1601.951, -1665.2662, 11.0906, 0.0, 0.0, 0.0962);
	CreateObject(1553, 1604.7076, -1665.2662, 11.0906, 0.0, 0.0, 0.0962);

	//Posto
	CreateObject(1244, 998.6035, -937.6003, 42.0796, 0.0, 0.0, 97.4488);
	CreateObject(1244, 1002.1929, -937.3178, 42.0796, 0.0, 0.0, 97.4488);
	CreateObject(1244, 1005.5864, -936.6509, 42.0796, 0.0, 0.0, 97.4488);
	CreateObject(1244, 1008.8067, -936.3103, 42.0796, 0.0, 0.0, 97.4488);

	//Basquete
	CreateObject(2114, 2290.3447, -1528.3322, 26.0750, 0.0, 0.0, 268.0926);
	
	//Capture The Flag
	CreateObject(2914, -972.5143, 1061.2030, 1344.6754, 0.0, 0.0, 268.6724);
	CreateObject(2993, -1133.0777, 1057.6383, 1345.4157, 0.0, 0.0, 86.0442);
	CreateObject(1464, -1062.4813, 1076.5786, 1340.2015, 355.0, 3.0, 143.5320);
	CreateObject(1464, -1043.5224, 1041.4187, 1340.1715, 355.0, 1.0, 319.2903);

	//Portões
	for(new g = 0; g < sizeof Gates; g++)
	    Gates[g][gObjectId] = CreateObject(Gates[g][gModel], Gates[g][gX], Gates[g][gY], Gates[g][gZ], Gates[g][gRX], Gates[g][gRY], Gates[g][gRZ]);
	
	print("Objetos criados.");

	//----------------------------------------------CASAS----------------------------------------------
	
	//Casas
	LoadHouses();

	printf("Casas carregadas [Total: %d]", ServerHouses);
	
	//----------------------------------------------MENUS----------------------------------------------
	
	Bank[0] = CreateMenu("Opcoes", 2, 2, 150, 100, 20);
	
	if(IsValidMenu(Bank[0]))
	{
	    AddMenuItem(Bank[0], 0, "Sacar");
	    AddMenuItem(Bank[0], 0, "Depositar");
	}
	
	Bank[1] = CreateMenu("Quantidade", 2, 2, 150, 100, 20);
	
	if(IsValidMenu(Bank[1]))
	{
	    SetMenuColumnHeader(Bank[1], 0, "Saldo:");
	    AddMenuItem(Bank[1], 0, "$1,00");
	    AddMenuItem(Bank[1], 0, "$5,00");
	    AddMenuItem(Bank[1], 0, "$10,00");
	    AddMenuItem(Bank[1], 0, "$50,00");
	    AddMenuItem(Bank[1], 0, "$100,00");
	    AddMenuItem(Bank[1], 0, "$500,00");
	    AddMenuItem(Bank[1], 0, "$1000,00");
	    AddMenuItem(Bank[1], 0, "$5000,00");
	    AddMenuItem(Bank[1], 0, "$10000,00");
	    AddMenuItem(Bank[1], 0, "$50000,00");
	    AddMenuItem(Bank[1], 0, "$100000,00");
	}
	
	Guns[0] = CreateMenu("Armas", 1, 30.0, 140.0, 220.0, 0.0);
	
	if(IsValidMenu(Guns[0]))
	{
	    for(new g = 2; g < 7; g++)
	        AddMenuItem(Guns[0], 0, WeaponSlots[g]);
	    
	    AddMenuItem(Guns[0], 0, "Explosivos");
	    AddMenuItem(Guns[0], 0, "Outros");
	}
	
	for(new m = 1; m < 6; m++)
	{
	    Guns[m] = CreateMenu(WeaponSlots[m+1], 2, 30.0, 140.0, 220.0, 0.0);
	    
	    if(IsValidMenu(Guns[m]))
	    {
	        SetMenuColumnHeader(Guns[m], 0, "Arma:");
	    	SetMenuColumnHeader(Guns[m], 1, "Valor:");
	    
	        for(new g = 0; g < sizeof Weapons; g++)
	        {
	            if(!IsForbiddenWeapon(g) && Weapons[g][wSlot] == m+1)
	            {
	                new cost[128];
	                format(cost, sizeof cost, "$%d,00", Weapons[g][wValue]);
					AddMenuItem(Guns[m], 0, Weapons[g][wName]);
					AddMenuItem(Guns[m], 1, cost);
	            }
	        }
		}
	}
	
	Guns[6] = CreateMenu("Explosivos", 2, 30.0, 140.0, 220.0, 0.0);
 	
	if(IsValidMenu(Guns[6]))
	{
	    SetMenuColumnHeader(Guns[6], 0, "Explosivo:");
 		SetMenuColumnHeader(Guns[6], 1, "Valor:");
 	
		for(new exp = 0; exp < sizeof Explosives; exp++)
		{
		    new cost[128];
		    format(cost, sizeof cost, "$%d,00", Explosives[exp][expValue]);
		    AddMenuItem(Guns[6], 0, Explosives[exp][expName]);
		    AddMenuItem(Guns[6], 1, cost);
		}
	}
	
	Guns[7] = CreateMenu("Outros", 2, 30.0, 140.0, 220.0, 0.0);
	
	if(IsValidMenu(Guns[7]))
	{
	    SetMenuColumnHeader(Guns[7], 0, "Item:");
 		SetMenuColumnHeader(Guns[7], 1, "Valor:");
 	
		AddMenuItem(Guns[7], 0, "Colete");
		AddMenuItem(Guns[7], 1, "$300,00");
	}
	
	Toys = CreateMenu("Brinquedos", 2, 30.0, 140.0, 220.0, 0.0);
	
	if(IsValidMenu(Toys))
	{
	    SetMenuColumnHeader(Toys, 0, "Brinquedo:");
 		SetMenuColumnHeader(Toys, 1, "Valor:");
 		
	    for(new rc = 0; rc < sizeof RCs; rc++)
	    {
	        new id, cost[128];
	        
	        id = RCs[rc] - 400;
	        format(cost, sizeof cost, "$%d,00", Vehicles[id][vehValue]);
	        
	        AddMenuItem(Toys, 0, Vehicles[id][vehModel]);
	        AddMenuItem(Toys, 1, cost);
	    }
	    
	    AddMenuItem(Toys, 0, "Recarregar");
     	AddMenuItem(Toys, 1, "$200,00");
	}
	
	Donuts = CreateMenu("Menu", 2, 30.0, 140.0, 220.0, 0.0);

 	if(IsValidMenu(Donuts))
 	{
 	    SetMenuColumnHeader(Donuts, 0, "Donut:");
 		SetMenuColumnHeader(Donuts, 1, "Valor:");
 	
 		for(new d = 0; d < sizeof DonutsFlavor; d++)
 		{
 		    AddMenuItem(Donuts, 0, DonutsFlavor[d]);
 		    AddMenuItem(Donuts, 1, "$40");
 		}
	}
	
	Pizzas = CreateMenu("Menu", 2, 30.0, 140.0, 220.0, 0.0);
	
	if(IsValidMenu(Pizzas))
 	{
 	    SetMenuColumnHeader(Pizzas, 0, "Pizza:");
 		SetMenuColumnHeader(Pizzas, 1, "Valor:");

 		for(new p = 0; p < sizeof PizzasFlavor; p++)
 		{
 		    AddMenuItem(Pizzas, 0, PizzasFlavor[p]);
 		    AddMenuItem(Pizzas, 1, "$40");
 		}
	}
	
	Chickens = CreateMenu("Menu", 2, 30.0, 140.0, 220.0, 0.0);

	if(IsValidMenu(Chickens))
 	{
 	    SetMenuColumnHeader(Chickens, 0, "Alimento:");
 		SetMenuColumnHeader(Chickens, 1, "Valor:");

 		for(new c = 0; c < sizeof ChickensFlavor; c++)
 		{
 		    AddMenuItem(Chickens, 0, ChickensFlavor[c]);
 		    AddMenuItem(Chickens, 1, "$40");
 		}
	}
	
	Burgers = CreateMenu("Menu", 2, 30.0, 140.0, 220.0, 0.0);

	if(IsValidMenu(Burgers))
 	{
 	    SetMenuColumnHeader(Burgers, 0, "Sanduiche:");
 		SetMenuColumnHeader(Burgers, 1, "Valor:");

 		for(new b = 0; b < sizeof BurgersFlavor; b++)
 		{
 		    AddMenuItem(Burgers, 0, BurgersFlavor[b]);
 		    AddMenuItem(Burgers, 1, "$40");
 		}
	}
	
	Foods = CreateMenu("Menu", 2, 30.0, 140.0, 220.0, 0.0);

	if(IsValidMenu(Foods))
 	{
 	    SetMenuColumnHeader(Foods, 0, "Comida:");
 		SetMenuColumnHeader(Foods, 1, "Valor:");

 		for(new f = 0; f < sizeof Food; f++)
 		{
 		    AddMenuItem(Foods, 0, Food[f]);
 		    AddMenuItem(Foods, 1, "$40");
 		}
	}
	
	Drinks = CreateMenu("Menu", 2, 30.0, 140.0, 220.0, 0.0);
	
	if(IsValidMenu(Drinks))
 	{
 	    SetMenuColumnHeader(Drinks, 0, "Bebida:");
 		SetMenuColumnHeader(Drinks, 1, "Valor:");

 		for(new d = 0; d < sizeof Drink; d++)
 		{
 		    AddMenuItem(Drinks, 0, Drink[d][drinkName]);
 		    AddMenuItem(Drinks, 1, "$20");
 		}
	}
	
	Restaurant = CreateMenu("Menu", 2, 30.0, 140.0, 220.0, 0.0);
	
	if(IsValidMenu(Restaurant))
 	{
 	    SetMenuColumnHeader(Restaurant, 0, "Item:");
 		AddMenuItem(Restaurant, 0, "Comidas");
 		AddMenuItem(Restaurant, 0, "Bebidas");
 	}
 	
	print("Menus criados.");
	
	//----------------------------------------------TEXTDRAWS----------------------------------------------
	
	tdlogo = TextDrawCreate(10.0, 430.5, "~b~Virtual ~y~Society ~w~~h~R~r~P~g~G");
    TextDrawFont(tdlogo, 1);
    TextDrawLetterSize(tdlogo, 0.6, 1.5);
    TextDrawSetShadow(tdlogo, 1);
    TextDrawColour(tdlogo, COLOUR_WHITE);
    TextDrawBackgroundColour(tdlogo, 0x00000099);
    
    tdweek = TextDrawCreate(608.0, 0.8, Days[CurrentDay]);
	TextDrawAlignment(tdweek, 3);
	TextDrawFont(tdweek, 3);
	TextDrawLetterSize(tdweek, 0.5, 2.0);
	TextDrawColour(tdweek, 0xFFFFFFE7);
	TextDrawSetOutline(tdweek, 1);
	TextDrawSetProportional(tdweek, 1);

    tdblack = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdblack, true);
	TextDrawBoxColour(tdblack, 0x000000FF);
	TextDrawSetShadow(tdblack, 0);
	TextDrawLetterSize(tdblack, 1.0, 100.0);
	TextDrawTextSize(tdblack, 645.0, 480.0);
	
	tdwhite = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdwhite, true);
	TextDrawBoxColour(tdwhite, 0xFFFFFFFF);
	TextDrawSetShadow(tdwhite, 0);
	TextDrawLetterSize(tdwhite, 1.0, 100.0);
	TextDrawTextSize(tdwhite, 645.0, 480.0);
	
	tdred = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdred, true);
	TextDrawBoxColour(tdred, 0xFF000066);
	TextDrawSetShadow(tdred, 0);
	TextDrawLetterSize(tdred, 1.0, 100.0);
	TextDrawTextSize(tdred, 645.0, 480.0);
	
	tdgray = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdgray, true);
	TextDrawBoxColour(tdgray, 0xAAAAAAAA);
	TextDrawSetShadow(tdgray, 0);
	TextDrawLetterSize(tdgray, 1.0, 100.0);
	TextDrawTextSize(tdgray, 645.0, 480.0);
	
	tdlightgray = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdlightgray, true);
	TextDrawBoxColour(tdlightgray, 0xBBBBBB66);
	TextDrawSetShadow(tdlightgray, 0);
	TextDrawLetterSize(tdlightgray, 1.0, 100.0);
	TextDrawTextSize(tdlightgray, 645.0, 480.0);
	
	tdgreen = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdgreen, true);
	TextDrawBoxColour(tdgreen, 0x00FF0044);
	TextDrawSetShadow(tdgreen, 0);
	TextDrawLetterSize(tdgreen, 1.0, 100.0);
	TextDrawTextSize(tdgreen, 645.0, 480.0);
    
    tdjoin = TextDrawCreate(320.0, 408.0, "~w~Pressione ~y~ALT ~w~para entrar.");
    TextDrawColour(tdjoin, 0xFFFFFFFF);
    TextDrawFont(tdjoin, 1);
    TextDrawLetterSize(tdjoin, 0.5, 1.0);
    TextDrawAlignment(tdjoin, 2);
    
    tdexit = TextDrawCreate(320.0, 408.0, "~w~Pressione ~y~ALT ~w~para sair.");
    TextDrawColour(tdexit, 0xFFFFFFFF);
    TextDrawFont(tdexit, 1);
    TextDrawLetterSize(tdexit, 0.5, 1.0);
    TextDrawAlignment(tdexit, 2);
    
    tdvehicle = TextDrawCreate(320.0, 418.0, "~w~Pressione ~b~Enter ~w~ou ~b~F ~w~para sair do veiculo.");
    TextDrawColour(tdvehicle, 0xFFFFFFFF);
    TextDrawFont(tdvehicle, 1);
    TextDrawLetterSize(tdvehicle, 0.5, 1.0);
    TextDrawAlignment(tdvehicle, 2);
    
    tdgun = TextDrawCreate(320.0, 420.0, "~w~Pressione ~g~Espaco ~w~para pegar a arma.");
    TextDrawColour(tdgun, 0xFFFFFFFF);
    TextDrawFont(tdgun, 1);
    TextDrawLetterSize(tdgun, 0.5, 1.0);
    TextDrawAlignment(tdgun, 2);

    tdarrows = TextDrawCreate(139.0, 295.0, "~<~                      ~>~");
	TextDrawAlignment(tdarrows, 0);
	TextDrawBackgroundColour(tdarrows, 0x000000FF);
	TextDrawFont(tdarrows, 3);
	TextDrawLetterSize(tdarrows, 0.9, 2.6);
	TextDrawColour(tdarrows, 0xFFFFFFFF);
	TextDrawSetOutline(tdarrows, 1);
	TextDrawSetProportional(tdarrows, 1);
	TextDrawSetShadow(tdarrows, 1);
    
    tdgas[0] = TextDrawCreate(156.0, 349.0, "  ~y~F~n~~w~3/4~n~1/2~n~1/4~n~  ~r~E");
	TextDrawAlignment(tdgas[0], 0);
	TextDrawBackgroundColour(tdgas[0], 0x000000FF);
	TextDrawFont(tdgas[0], 1);
	TextDrawLetterSize(tdgas[0], 0.5, 1.5);
	TextDrawColour(tdgas[0], 0xFFFFFFFF);
	TextDrawSetOutline(tdgas[0], 1);
	TextDrawSetProportional(tdgas[0], 1);
	TextDrawSetShadow(tdgas[0], 1);
	
	tdgas[1] = TextDrawCreate(191.5, 354.0, "_");
	TextDrawUseBox(tdgas[1], true);
 	TextDrawBoxColour(tdgas[1], 0x00000066);
 	TextDrawLetterSize(tdgas[1], 1.0, 6.5);
    TextDrawTextSize(tdgas[1], 194.5, 390.0);
    TextDrawSetShadow(tdgas[1], 0);
    
    tdhealth = TextDrawCreate(219.0, 392.0, "_");
	TextDrawUseBox(tdhealth, true);
 	TextDrawBoxColour(tdhealth, 0x00000066);
 	TextDrawLetterSize(tdhealth, 0.0, 0.5);
    TextDrawTextSize(tdhealth, 319.0, 0.0);
    
    print("Textdraws criados.");
    
    //----------------------------------------------TIMERS----------------------------------------------
    
    SetTimer("UpdateCrouch", 250, true);
    SetTimer("Speedometer", 500, true);
    SetTimer("UpdatePlayers", 500, true);
    SetTimer("Gasometer", 1000, true);
    SetTimer("Time", 1000, true);
	SetTimer("AreaHandler", 1000, true);
	SetTimer("ZoneHandler", 1000, true);
	SetTimer("DroppedWeaponHandler", 1500, true);
	SetTimer("HouseHandler", 2000, true);
	SetTimer("GateHandler", 2000, true);
	SetTimer("CheckpointHandler", 3000, true);
	SetTimer("MapIconHandler", 3000, true);
	SetTimer("CTMHandler", 3000, true);
	
	print("Timers globais definidos.");
	
	//--------------------------------------------------------------------------------------------------
	
	print("Virtual Society RPG iniciado...\n");
	return 1;
}

public OnGameModeExit()
{
    print("Finalizando Virtual Society RPG...");

	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(IsPlayerLogged(i))
	        {
	        	SavePlayerData(i);
	        	Login[i] = 0;
	    	}
	    	
			if(HandgunObject[i] != -1)
			{
				DestroyObject(HandgunObject[i]);
				HandgunObject[i] = -1;
			}
			
			if(tdintro[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdintro[i]);
				
            if(tdspeak[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdspeak[i]);
				
			if(tdzone[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdzone[i]);
				
            if(tdhouse[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdhouse[i]);
				
            if(tdctm[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdctm[i]);

			if(tdspeed[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdspeed[i]);
				
            if(tdvinfo[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdvinfo[i]);
				
            if(tdhealthbar[i] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdhealthbar[i]);
			
			TogglePlayerClock(i, false);
		}
	}
	    
	KillTimer(TuneTimer);
	
	for(new g = 0; g < sizeof tdgasmeter; g++)
	{
	    if(tdgasmeter[g] != Text:INVALID_TEXT_DRAW)
	    	TextDrawDestroy(tdgasmeter[g]);
	}
	
	for(new g = 0; g < sizeof tdgas; g++)
	{
	    if(tdgas[g] != Text:INVALID_TEXT_DRAW)
			TextDrawDestroy(tdgas[g]);
	}
	
    for(new v = 0; v < sizeof tdvelo; v++)
    {
        if(tdvelo[v] != Text:INVALID_TEXT_DRAW)
			TextDrawDestroy(tdvelo[v]);
	}
	
	TextDrawDestroy(tdhealth);
    TextDrawDestroy(tdlogo);
    TextDrawDestroy(tdweek);
    TextDrawDestroy(tdblack);
    TextDrawDestroy(tdwhite);
    TextDrawDestroy(tdred);
    TextDrawDestroy(tdgray);
    TextDrawDestroy(tdlightgray);
    TextDrawDestroy(tdgreen);
    TextDrawDestroy(tdjoin);
    TextDrawDestroy(tdexit);
    TextDrawDestroy(tdvehicle);
    TextDrawDestroy(tdgun);
    TextDrawDestroy(tdarrows);
    
    for(new g = 0; g < sizeof Guns; g++)
        DestroyMenu(Guns[g]);

	DestroyMenu(Bank[0]);
	DestroyMenu(Bank[1]);
	DestroyMenu(Donuts);
	DestroyMenu(Pizzas);
	DestroyMenu(Chickens);
	DestroyMenu(Burgers);
	DestroyMenu(Drinks);
	
	for(new z = 0; z < sizeof GangZones; z++)
	{
	    KillTimer(GangZones[z][gzTimer]);
        GangZoneDestroy(GangZones[z][gzId]);
    }
    
	print("Virtual Society RPG finalizado.");
	return 1;
}

stock ShowLoginDialog(playerid)
{
	if(fexist(GetPlayerXFilePath(playerid)))
	    ShowPlayerDialog(playerid, DIALOG_REGISTER_LOGIN, DIALOG_STYLE_INPUT, "Virtual Society RPG", "Bem-vindo, entre com a sua senha para continuar:", "Autenticar", "Cancelar");
	else
	    ShowPlayerDialog(playerid, DIALOG_REGISTER_LOGIN, DIALOG_STYLE_INPUT, "Virtual Society RPG", "Bem-vindo, registre uma senha para continuar:", "Registrar", "Cancelar");
}

public OnPlayerConnect(playerid)
{
    SetPlayerColour(playerid, COLOUR_WHITE);
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);
	
	SetPlayerColour(playerid, COLOUR_GRAY);
	Login[playerid] = 0;
	Company[playerid] = 0;
	BankOpc[playerid] = 0;
	IntroductionPart[playerid] = 0;
	DanceTimer[playerid] = 0;
	DanceStyle[playerid] = 0;
	DanceOff[playerid] = 0;
	PaintTimer[playerid] = 0;
	PaintStage[playerid] = 0;
	PaintColours[playerid] = 0;
	VCounter[playerid] = 0;
	VFrozenFlags[playerid] = 0;
	VFuelText[playerid] = -1;
	VHealthText[playerid] = -1;
	RemoteBomb[playerid] = -1;
	HandgunObject[playerid] = -1;
	CarryObject[playerid] = -1;
	Enter[playerid] = -1;
	Door[playerid] = -1;
	DroppedWeapon[playerid] = -1;
	House[playerid] = -1;
	WorkVehicle[playerid] = -1;
	Radio[playerid] = -1;
	GangAttack[playerid] = -1;
	Zone[playerid] = -1;
	Invite[playerid] = INVITE_NONE;
	Area[playerid] = AREA_NULL;
	Checkpoint[playerid] = -1;
	CheckpointStatus[playerid] = CHECKPOINT_NONE;
	DisableReport[playerid] = false;
	
	pUpdate[playerid] = 0;
	pHealth[playerid] = 100.0;
	pArmour[playerid] = 0.0;

    tdintro[playerid] = Text:INVALID_TEXT_DRAW;
  	tdzone[playerid] = Text:INVALID_TEXT_DRAW;
  	tdhouse[playerid] = Text:INVALID_TEXT_DRAW;
  	tdctm[playerid] = Text:INVALID_TEXT_DRAW;
  	tdspeed[playerid] = Text:INVALID_TEXT_DRAW;
  	tdvinfo[playerid] = Text:INVALID_TEXT_DRAW;
  	tdhealthbar[playerid] = Text:INVALID_TEXT_DRAW;
  	
    CheckBan(playerid);
	
    for(new ln = 0; ln < 30; ln++)
		SendClientMessage(playerid, COLOUR_WHITE, " ");
}

public OnPlayerDisconnect(playerid, reason)
{
    SetPlayerColour(playerid, COLOUR_WHITE);
    
	switch(reason)
	{
	    case 0:
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 54);
	    case 1:
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);
	    case 2:
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 3);
	}
	
	if(IsPlayerLogged(playerid))
	{
	    SavePlayerData(playerid);
		Login[playerid] = 0;
	}
	
	if(HandgunObject[playerid] != -1)
	{
		DestroyObject(HandgunObject[playerid]);
		HandgunObject[playerid] = -1;
	}
	
	if(RemoteBomb[playerid] != -1)
	{
	    DestroyObject(RemoteBomb[playerid]);
	    RemoteBomb[playerid] = -1;
	}
	
	if(TunnerID == playerid)
		StopPlayerTune(playerid);

    KillTimer(GangAttackTimer[playerid]);
	KillTimer(SpeakTimer[playerid]);
	KillTimer(DanceTimer[playerid]);
	KillTimer(PaintTimer[playerid]);
	KillTimer(DieTimer[playerid]);
	
	if(tdintro[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdintro[playerid]);
		tdintro[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdspeak[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdspeak[playerid]);
	    tdspeak[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdzone[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdzone[playerid]);
	    tdzone[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdhouse[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdhouse[playerid]);
	    tdhouse[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdctm[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdctm[playerid]);
	    tdctm[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdspeed[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdspeed[playerid]);
	    tdspeed[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdvinfo[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdvinfo[playerid]);
	    tdvinfo[playerid] = Text:INVALID_TEXT_DRAW;
	}

    if(tdhealthbar[playerid] != Text:INVALID_TEXT_DRAW)
	{
		TextDrawDestroy(tdhealthbar[playerid]);
	    tdhealthbar[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	DeletePlayerFuelText(playerid);
    
    for(new g = 0; g < sizeof tdgas; g++)
    	TextDrawHideForPlayer(playerid, tdgas[g]);

	for(new v = 0; v < sizeof tdvelo; v++)
        TextDrawHideForPlayer(playerid, tdvelo[v]);
            
	TextDrawHideForPlayer(playerid, tdhealth);
    TextDrawHideForPlayer(playerid, tdlogo);
    TextDrawHideForPlayer(playerid, tdweek);
    TextDrawHideForPlayer(playerid, tdblack);
    TextDrawHideForPlayer(playerid, tdwhite);
    TextDrawHideForPlayer(playerid, tdred);
    TextDrawHideForPlayer(playerid, tdgray);
    TextDrawHideForPlayer(playerid, tdlightgray);
    TextDrawHideForPlayer(playerid, tdgreen);
    TextDrawHideForPlayer(playerid, tdjoin);
    TextDrawHideForPlayer(playerid, tdexit);
    TextDrawHideForPlayer(playerid, tdvehicle);
    TextDrawHideForPlayer(playerid, tdgun);
    TextDrawHideForPlayer(playerid, tdarrows);
	
	TogglePlayerClock(playerid, false);
}

public OnPlayerRequestClass(playerid, classid)
{
	new cam;

	cam = random(sizeof Cameras);
	SetPlayerCameraPos(playerid, Cameras[cam][CameraPosX], Cameras[cam][CameraPosY], Cameras[cam][CameraPosZ]);
	SetPlayerCameraLookAt(playerid, Cameras[cam][CameraLookAtX], Cameras[cam][CameraLookAtY], Cameras[cam][CameraLookAtZ]);
	
	PlayerPlaySound(playerid, 1185, 0.0, 0.0, 0.0);
	ShowLoginDialog(playerid);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(!IsPlayerLogged(playerid))
	{
	    SendClientMessage(playerid, COLOUR_GRAY, "Você deve se registrar ou logar para começar a jogar...");
	    return 0;
	}
	
	GameTextForPlayer(playerid, "~b~Virtual ~y~Society ~w~~h~R~r~P~g~G", 4000, 0);
	return 1;
}

public OnPlayerSpawn(playerid)
{
    new xpath[128];
    
    xpath = GetPlayerXFilePath(playerid);
    
   	PreloadAnimLib(playerid, "BOMBER");
	PreloadAnimLib(playerid, "RAPPING");
   	PreloadAnimLib(playerid, "SHOP");
  	PreloadAnimLib(playerid, "BEACH");
   	PreloadAnimLib(playerid, "SMOKING");
   	PreloadAnimLib(playerid, "DANCING");
   	PreloadAnimLib(playerid, "STRIP");
  	PreloadAnimLib(playerid, "FOOD");
  	PreloadAnimLib(playerid, "ON_LOOKERS");
	PreloadAnimLib(playerid, "DEALER");
	PreloadAnimLib(playerid, "CRACK");
	PreloadAnimLib(playerid, "CARRY");
	PreloadAnimLib(playerid, "COP_AMBIENT");
	PreloadAnimLib(playerid, "KNIFE");
	PreloadAnimLib(playerid, "MD_END");
	PreloadAnimLib(playerid, "UZI");
	PreloadAnimLib(playerid, "TEC");
	PreloadAnimLib(playerid, "ROCKET");
	PreloadAnimLib(playerid, "SHOTGUN");
	PreloadAnimLib(playerid, "COLT45");
	PreloadAnimLib(playerid, "CAMERA");
	PreloadAnimLib(playerid, "POLICE");
	PreloadAnimLib(playerid, "PARK");
	PreloadAnimLib(playerid, "INT_HOUSE");
	PreloadAnimLib(playerid, "FOOD");
	PreloadAnimLib(playerid, "PED");
	PreloadAnimLib(playerid, "RYDER");
	PreloadAnimLib(playerid, "SUNBATHE");
	PreloadAnimLib(playerid, "HAIRCUTS");
	PreloadAnimLib(playerid, "MISC");
	PreloadAnimLib(playerid, "GYMNASIUM");
	PreloadAnimLib(playerid, "FAT");
	PreloadAnimLib(playerid, "POOL");
	PreloadAnimLib(playerid, "MUSCULAR");
	
	TextDrawHideForPlayer(playerid, tdgray);
	TextDrawHideForPlayer(playerid, tdlightgray);
	TextDrawHideForPlayer(playerid, tdlogo);
	
	if(IntroductionPart[playerid] == 0)
	{
    	TextDrawShowForPlayer(playerid, tdlogo);
    	TextDrawShowForPlayer(playerid, tdweek);
    	TogglePlayerClock(playerid, true);
    }

    if(Dying[playerid] == 1)
    {
		new Float:X, Float:Y, Float:Z;
		
		SetHealth(playerid, 1.0);
		GetPlayerPos(playerid, X, Y, Z);
		SetPlayerCameraPos(playerid, X, Y, Z - 0.5);
		SetPlayerCameraLookAt(playerid, X, Y, Z + 100.0);
		SetPlayerDrunkLevelEx(playerid, 50000);
		TogglePlayerControllable(playerid, false);
		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 10.0, 0, 1, 1, 1, -1);
		ShowTextLightGray(playerid);
		DieTimer[playerid] = SetTimerEx("Die", 40000, false, "dd", playerid, true);
    }
    
    pUpdate[playerid] = UPDATE_STATUS | UPDATE_MONEY | UPDATE_WEAPONS;
    ChangePlayerJob(playerid, hGetInt(xpath, "Job"));
    ShowGangZones(playerid);
    Login[playerid] = 1;
}

stock SavePlayerData(playerid)
{
    new xpath[128];

	xpath = GetPlayerXFilePath(playerid);

 	hSetInt(xpath, "Money", pMoney[playerid]);
  	hSetInt(xpath, "Handgun", encode_gun(pWeapons[playerid][0], pWeapons[playerid][1]));
  	hSetInt(xpath, "Lightgun", encode_gun(pWeapons[playerid][2], pWeapons[playerid][3]));
  	hSetInt(xpath, "Steel", pWeapons[playerid][3]);
   	hSetFloat(xpath, "Health", pHealth[playerid]);
   	hSetFloat(xpath, "Armour", pArmour[playerid]);
	SavePlayerCounter(playerid);
}

stock GetPlayerItens(playerid)
{
	return hGetInt(GetPlayerXFilePath(playerid), "Itens");
}

stock IsPlayerThereItem(playerid, itemid)
{
	return GetPlayerItens(playerid) & itemid;
}

stock AttachPlayerBackpack(playerid)
{
	DettachPlayerBackpack(playerid);
	BackpackObject[playerid] = CreateObject(371, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	AttachObjectToPlayer(BackpackObject[playerid], playerid, 0, -0.2, 0.2, 0, 0, 0);
}

stock DettachPlayerBackpack(playerid)
{
	DestroyObject(BackpackObject[playerid]);
}

stock IsValidSkin(skinid)
{
    return !(skinid == 3   || skinid == 4   || skinid == 5   || skinid == 6   || skinid == 8   || skinid == 42  || skinid == 65  ||
			 skinid == 74  || skinid == 86  || skinid == 119 || skinid == 149 || skinid == 208 || skinid == 273 || skinid == 274 ||
			 skinid == 289 || skinid >= 300);
}

stock IsForbiddenWeapon(weaponid)
{
	return (weaponid == 16 || weaponid == 18 || weaponid == 19 || weaponid == 20 || weaponid == 21 || weaponid == 26 ||
			weaponid == 28 || weaponid == 32 || weaponid == 35 || weaponid == 36 || weaponid == 37 || weaponid == 38 ||
			weaponid == 39 || weaponid == 40 || weaponid == 41 || weaponid == 42 || weaponid == 43 || weaponid == 44 ||
			weaponid == 45);
}

stock GivePlayerExplosive(playerid, explosiveid)
{
	new kpath[128];
	new explosives, amount, mask;
	
	kpath = GetPlayerKFilePath(playerid);
	explosives = hGetInt(kpath, "Explosives");
	amount = (explosives >> (explosiveid * 2)) & 3;
	mask = 0xFFFFFFFF;
	
	if(amount < 0)
	    amount = 0;
	    
	if(amount >= Explosives[explosiveid][expLimit])
	    return 1;

	amount = (amount + 1) & 3;
	mask &= ~(3 << (explosiveid * 2));
	explosives = (explosives & mask) | (amount << (explosiveid * 2));
 	hSetInt(kpath, "Explosives", explosives);
	return 0;
}

stock TakePlayerExplosive(playerid, explosiveid)
{
    new kpath[128];
	new explosives, amount, mask;

	kpath = GetPlayerKFilePath(playerid);
	explosives = hGetInt(kpath, "Explosives");
	amount = (explosives >> (explosiveid * 2)) & 3;
	mask = 0xFFFFFFFF;

	if(amount > Explosives[explosiveid][expLimit])
	    amount = Explosives[explosiveid][expLimit];

	if(amount <= 0)
	    return;
	    
	amount = (amount - 1) & 3;
	mask &= ~(3 << (explosiveid * 2));
	explosives = (explosives & mask) | (amount << (explosiveid * 2));
 	hSetInt(kpath, "Explosives", explosives);
}

stock GetPlayerExplosive(playerid, explosiveid)
{
    return (hGetInt(GetPlayerKFilePath(playerid), "Explosives") >> (explosiveid * 2)) & 3;
}

stock RemovePlayerExplosive(playerid, explosiveid)
{
    new kpath[128];
	new mask;

	kpath = GetPlayerKFilePath(playerid);
	mask = 0xFFFFFFFF & (~(3 << (explosiveid * 2)));
	
	hSetInt(kpath, "Explosives", hGetInt(kpath, "Explosives") & mask);
}

stock RemovePlayerExplosives(playerid)
	hSetInt(GetPlayerKFilePath(playerid), "Explosives", 0);

public CreateDroppedWeapon(weaponid, ammo, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ)
{
	new id;

	for(id = 0; id < MAX_DROPPED_WEAPONS; id = id + 1)
	{
	    if(DroppedWeapons[id][dwExist] == 0)
		    break;
	}

	DroppedWeapons[id][dwObjectId] = CreateObject(Weapons[weaponid][wObjectId], X, Y, Z, rX, rY, rZ);
	DroppedWeapons[id][dwWeaponId] = weaponid;
	DroppedWeapons[id][dwAmmo] = ammo;
	DroppedWeapons[id][dwExist] = 1;
	DroppedWeapons[id][dwTimer] = SetTimerEx("DeleteDroppedWeapon", DROPPED_WEAPON_TIME, false, "d", id);
	return id;
}

public DeleteDroppedWeapon(id)
{
	DestroyObject(DroppedWeapons[id][dwObjectId]);
	KillTimer(DroppedWeapons[id][dwTimer]);
	DroppedWeapons[id][dwObjectId] = DroppedWeapons[id][dwWeaponId] = DroppedWeapons[id][dwAmmo] = DroppedWeapons[id][dwExist] = 0;
}

stock GivePlayerWeaponEx(playerid, weaponid, ammo)
{
	if(weaponid == 0 || ammo == 0)
	    return -1;
	    
    new slot;

    slot = Weapons[weaponid][wSlot];

	if(slot == 0 || slot == 1 || slot == 10)
	{
	    if(pWeapons[playerid][4] != 0)
	        return 4;
	        
	    pWeapons[playerid][4] = weaponid;
	    ammo = 1;
	}
	else
	{
		if(slot == 3 || slot == 4 || slot == 5 || slot == 6 || slot == 7)
		{
		    if(pWeapons[playerid][0] != weaponid && pWeapons[playerid][0] != 0 && pWeapons[playerid][1] > 0)
			    return 2;
			
            if(pWeapons[playerid][1] + ammo > Weapons[weaponid][wAmmoLimit])
	    	{
	        	if(pWeapons[playerid][1] > Weapons[weaponid][wAmmoLimit] - Weapons[weaponid][wAmmo])
	        	    return 1;
	        	else
	        	   	ammo = Weapons[weaponid][wAmmoLimit] - pWeapons[playerid][1];
	    	}
			    
			if(weaponid == pWeapons[playerid][0])
			    pWeapons[playerid][1] += ammo;
			else
				pWeapons[playerid][1] = ammo;
				
            pWeapons[playerid][0] = weaponid;
		}
		
		else if(slot == 2)
		{
		    if(pWeapons[playerid][2] != weaponid && pWeapons[playerid][2] != 0 && pWeapons[playerid][3] > 0)
			    return 3;
			
            if(pWeapons[playerid][3] + ammo > Weapons[weaponid][wAmmoLimit])
	    	{
	        	if(pWeapons[playerid][3] > Weapons[weaponid][wAmmoLimit] - Weapons[weaponid][wAmmo])
	        	    return 1;
	        	else
	        	   	ammo = Weapons[weaponid][wAmmoLimit] - pWeapons[playerid][3];
	    	}
	    	
			if(weaponid == pWeapons[playerid][2])
			    pWeapons[playerid][3] += ammo;
			else
				pWeapons[playerid][3] = ammo;

            pWeapons[playerid][2] = weaponid;
		}
		
		else
			return -1;
	}
	
	GivePlayerWeapon(playerid, weaponid, ammo);
	return 0;
}

stock SavePlayerWeapons(playerid)
{
	new weaponid, ammo;
	
	for(new gun = 0; gun < 4; gun += 2)
	{
		if(pWeapons[playerid][gun] == 0 || pWeapons[playerid][gun+1] == 0)
		    pWeapons[playerid][gun] = pWeapons[playerid][gun+1] = 0;
		    
		else
		{
		    GetPlayerWeaponData(playerid, Weapons[pWeapons[playerid][gun]][wSlot], weaponid, ammo);

			if(pWeapons[playerid][gun] != weaponid)
			    pWeapons[playerid][gun] = weaponid;
			    
			if(pWeapons[playerid][gun+1] > ammo)
			    pWeapons[playerid][gun+1] = ammo;
			    
            if(pWeapons[playerid][gun+1] > Weapons[weaponid][wAmmoLimit])
			    pWeapons[playerid][gun+1] = Weapons[weaponid][wAmmoLimit];
			    
			if(pWeapons[playerid][gun+1] <= 0)
			    pWeapons[playerid][gun] = pWeapons[playerid][gun+1] = 0;
		}
	}
}

public SpeakRadio(playerid, speakid)
{
    if(tdspeak[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawDestroy(tdspeak[playerid]);
		tdspeak[playerid] = Text:INVALID_TEXT_DRAW;
	}

	SpeakId[playerid] = 0;

	if(speakid < 1 || speakid > sizeof Speaks - 1)
		return;
		
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerWeapon(playerid) != 0)
	{
 		switch(speakid)
   		{
     		case 1: //Affirmative!
       			ApplyAnimation(playerid, "UZI", "UZI_fire", 4.1, 0, 1, 1, 1, 1);
          	case 2: //Negative!
           		ApplyAnimation(playerid, "ROCKET", "RocketFire", 4.1, 0, 1, 1, 1, 1);
           	case 3: //Go go go!
            	ApplyAnimation(playerid, "POLICE", "CopTraf_Away", 4.1, 0, 1, 1, 1, 1);
           	case 4: //Need help!
            	ApplyAnimation(playerid, "SHOTGUN", "shotgun_fire", 4.1, 0, 1, 1, 1, 1);
            case 5: //Team, fall back!
            	ApplyAnimation(playerid, "POLICE", "CopTraf_Come", 4.1, 0, 1, 1, 1, 1);
            case 6: //Cover me!
            	ApplyAnimation(playerid, "COLT45", "colt45_fire_2hands", 4.1, 0, 1, 1, 1, 1);
            case 7: //Follow me!
            	ApplyAnimation(playerid, "COLT45", "colt45_reload", 4.1, 0, 1, 1, 1, 1);
           	case 8: //Enemy down!
            	ApplyAnimation(playerid, "COLT45", "colt45_fire", 4.1, 0, 1, 1, 1, 1);
			case 9: //Regroup team
   				ApplyAnimation(playerid, "COLT45", "colt45_reload", 4.1, 0, 1, 1, 1, 1);
			case 10: //Taking fire, need assistance!
   				ApplyAnimation(playerid, "TEC", "TEC_reload", 4.1, 0, 1, 1, 1, 1);
			case 11: //You take the point!
			{
   				if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DUCK)
		    		ApplyAnimation(playerid, "CAMERA", "camcrch_cmon", 4.1, 0, 1, 1, 1, 1);
					
				else
    				ApplyAnimation(playerid, "CAMERA", "camstnd_cmon", 4.1, 0, 1, 1, 1, 1);
			}
			case 12: //Enemy spotted!
			    ApplyAnimation(playerid, "CAMERA", "piccrch_out", 4.1, 0, 1, 1, 1, 1);
			case 13: //Mission completed, sir!
			    ApplyAnimation(playerid, "COLT45", "colt45_fire_2hands", 4.1, 0, 1, 1, 1, 1);
	    }
	}
	
	Speak(playerid, Speaks[speakid]);
}

public Speak(playerid, speak[])
{
	if(Radio[playerid] != -1)
	{
    	new string[128];
    	new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
	
		format(string, sizeof string, "[Radio] %s: %s", PlayerName(playerid), speak);
		GetPlayerPos(playerid, X, Y, Z);
	
		for(new n = 0; n < MAX_SLOTS; n++)
		{
		    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Radio[playerid] == Radio[n])
		    {
		        GetPlayerPos(n, PX, PY, PZ);

		        if(GetDistance(X, Y, Z, PX, PY, PZ) < 100.0)
		    		SendClientMessage(n, COLOUR_DARK_GOLD, string);
			}
		}
	}
	
	SetPlayerChatBubble(playerid, speak, COLOUR_DARK_GOLD, 30.0, 5000);
}

public AttackTerritory(playerid)
{
	GangAttack[playerid] = Zone[playerid];
	SendClientMessage(playerid, COLOUR_SKY_BLUE, "Use: '/gangue atacar' para iniciar um ataque nesse território.");
}

public GangZoneWar(zoneid, domain, attacker)
{
	new id, dscore, ascore, cscore;
	new bool:attack, bool:defense, bool:police;
	
	dscore = GangZones[zoneid][gzScore] & 0xFFF;
	ascore = GangZones[zoneid][gzScore] >> 8;
	cscore = GangZones[zoneid][gzScore] >> 16;
	attack = defense = police = false;
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid && Dying[n] == 0)
	    {
	        id = GetPlayerGang(n);
	        
	        if(id == attacker)
			    attack = true;
			
	        else if(id == domain)
	            defense = true;
			
			else if(IsPlayerCop(n))
			    police = true;
	    }
	}
	
	if(!attack)
	    ++dscore;
	    
	if(!defense)
	    ++ascore;
	
	if(police && !attack && !defense)
		++cscore;
				
	if(dscore >= 4)
	{
	    FinishWar(zoneid);
	    return;
	}
	
	if(ascore >= 12)
	{
		SetZoneDomain(zoneid, attacker);
	    FinishWar(zoneid);
	    return;
	}
	
	if(cscore >= 4)
	{
	    RemoveZoneDomain(zoneid);
    	FinishWar(zoneid);
    	return;
	}
	
	ascore &= 0xFFFF;
	dscore &= 0xFFFF;
	cscore &= 0xFFFF;
	GangZones[zoneid][gzScore] = (cscore << 16) | (dscore << 8) | ascore;
}

public SetGateParams(gateid, params)
	Gates[gateid][gParams] = params;

public OpenGate(gateid)
{
	switch(Gates[gateid][gStyle])
	{
	    case 1:
	    {
	        new time;
	        
	        time = floatround(GetDistance(Gates[gateid][gOpenX], Gates[gateid][gOpenY], Gates[gateid][gOpenZ], Gates[gateid][gX], Gates[gateid][gY], Gates[gateid][gZ]) / Gates[gateid][gOpenS]) * 1000;
            MoveObject(Gates[gateid][gObjectId], Gates[gateid][gOpenX], Gates[gateid][gOpenY], Gates[gateid][gOpenZ], Gates[gateid][gOpenS]);
			SetTimerEx("SetGateParams", time, false, "dd", gateid, encode_gate_params(1, 0));
		}

	    case 2:
	    {
	        new Float:rX, Float:rY, Float:rZ;

	        GetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			rX -= 1.0;
	        
			if(rX <= Gates[gateid][gRX] - 90.0)
			{
			    Gates[gateid][gParams] = encode_gate_params(1, 0);
			    SetObjectRot(Gates[gateid][gObjectId], Gates[gateid][gRX] - 90.0, Gates[gateid][gRY], Gates[gateid][gRZ]);
			    return;
			}
			
			else
			{
			    SetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			    SetTimerEx("OpenGate", 10, false, "d", gateid);
			}
	    }
	    
	    case 3:
	    {
	        new Float:rX, Float:rY, Float:rZ;

	        GetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			rY += 1.0;

			if(rY >= Gates[gateid][gRY] + 90.0)
			{
			    Gates[gateid][gParams] = encode_gate_params(1, 0);
			    SetObjectRot(Gates[gateid][gObjectId], Gates[gateid][gRX], Gates[gateid][gRY] + 90.0, Gates[gateid][gRZ]);
			    return;
			}
			
			else
			{
			    SetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			    SetTimerEx("OpenGate", 10, false, "d", gateid);
			}
	    }
	}
	
	Gates[gateid][gParams] = encode_gate_params(1, 1);
}

public CloseGate(gateid)
{
    switch(Gates[gateid][gStyle])
	{
	    case 1:
	    {
	        new time;

	        time = floatround(GetDistance(Gates[gateid][gOpenX], Gates[gateid][gOpenY], Gates[gateid][gOpenZ], Gates[gateid][gX], Gates[gateid][gY], Gates[gateid][gZ]) / Gates[gateid][gOpenS]) * 1000;
			MoveObject(Gates[gateid][gObjectId], Gates[gateid][gX], Gates[gateid][gY], Gates[gateid][gZ], Gates[gateid][gOpenS]);
			SetTimerEx("SetGateParams", time, false, "dd", gateid, encode_gate_params(0, 0));
	    }

	    case 2:
	    {
            new Float:rX, Float:rY, Float:rZ;

	        GetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			rX += 1.0;

			if(rX >= Gates[gateid][gRX])
			{
			    Gates[gateid][gParams] = encode_gate_params(0, 0);
			    SetObjectRot(Gates[gateid][gObjectId], Gates[gateid][gRX], Gates[gateid][gRY], Gates[gateid][gRZ]);
			    return;
			}
			
			else
			{
			    SetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			    SetTimerEx("CloseGate", 10, false, "d", gateid);
			}
	    }
	    
	    case 3:
	    {
	        new Float:rX, Float:rY, Float:rZ;

	        GetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			rY -= 1.0;

			if(rY <= Gates[gateid][gRY])
			{
			    Gates[gateid][gParams] = encode_gate_params(0, 0);
			    SetObjectRot(Gates[gateid][gObjectId], Gates[gateid][gRX], Gates[gateid][gRY], Gates[gateid][gRZ]);
			    return;
			}

			else
			{
			    SetObjectRot(Gates[gateid][gObjectId], rX, rY, rZ);
			    SetTimerEx("CloseGate", 10, false, "d", gateid);
			}
	    }
	}
	
	Gates[gateid][gParams] = encode_gate_params(0, 1);
}

public OnPlayerEnterCheckpoint(playerid)
{
	switch(CheckpointStatus[playerid])
	{
	    case CHECKPOINT_NONE:
	    {
	        DisablePlayerCheckpoint(playerid);
	        return 1;
	    }

		case CHECKPOINT_AMMUNATION:
		{
		    SetPlayerCameraPos(playerid, 314.9799, -134.0405, 1000.6016);
		    SetPlayerCameraLookAt(playerid, 317.0170, -132.7189, 1000.6016);
		    ShowMenuForPlayer(Guns[0], playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_DONUTS:
		{
		    ShowMenuForPlayer(Donuts, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_PIZZA:
		{
		    ShowMenuForPlayer(Pizzas, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_CHICKEN:
		{
		    ShowMenuForPlayer(Chickens, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_BURGER:
		{
		    ShowMenuForPlayer(Burgers, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_DRINKS:
		{
		    ShowMenuForPlayer(Drinks, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_RESTAURANT:
		{
		    InRestaurant[playerid] = 1;
            ShowMenuForPlayer(Restaurant, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_24/7_SHOP:
		{

		}
		
		case CHECKPOINT_TOY_SHOP:
		{
		    ShowMenuForPlayer(Toys, playerid);
		    TogglePlayerControllable(playerid, false);
		}
	}
	
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:mid = GetPlayerMenu(playerid);

	if(!IsValidMenu(mid))
	    return 0;
	
	if(mid == mCurrentTune)
	{
	    if(RowComponents[row] == 500)
		{
		    new w = 0, count = 0;
		    
		    DestroyMenu(mCurrentTune);
	    	mCurrentTune = CreateMenu("Componentes", 2, 2, 150, 100, 20);
	    	SetMenuColumnHeader(mCurrentTune, 0, "Componentes:");
	    	
		    for(new t = 0; t < sizeof Components; t++)
		    {
		        if(Components[t][tuneSlot] == WHEELS)
		        {
					w++;
					
					if(w > 10)
					{
				    	AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
				    	AddMenuItem(mCurrentTune, 1, " ");
				    	RowComponents[count++] = t + 1000;
					}
				}
		    }
		    
		    AddMenuItem(mCurrentTune, 0, "Anterior");
		    AddMenuItem(mCurrentTune, 1, "<-");
		    RowComponents[count++] = 499;
		    ShowMenuForPlayer(mCurrentTune, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		else if(RowComponents[row] == 499)
		{
		    new w = 0, count = 0;
		    
		    DestroyMenu(mCurrentTune);
	    	mCurrentTune = CreateMenu("Componentes", 2, 2, 150, 100, 20);
		    SetMenuColumnHeader(mCurrentTune, 0, "Componentes:");
		    
		    for(new t = 0; t < sizeof Components; t++)
		    {
		        if(Components[t][tuneSlot] == WHEELS)
		        {
		            AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
		            AddMenuItem(mCurrentTune, 1, " ");
		            RowComponents[count++] = t + 1000;
		            w++;
		            
		            if(w >= 10)
		            {
		                AddMenuItem(mCurrentTune, 0, "Proximo");
		                AddMenuItem(mCurrentTune, 1, "->");
		                RowComponents[count++] = 500;
		                break;
		            }
		        }
		    }
		    
		    ShowMenuForPlayer(mCurrentTune, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		else
		{
			if(!Paintjob)
				ShowTuningCostMenu(playerid, RowComponents[row]);
			else
			    ShowPaintjobCostMenu(playerid, RowComponents[row]);
		}
		return 1;
	}
	
	else if(mid == mCusto)
	{
	    switch(row)
	    {
	        case 0:
	        {
	            if(!Paintjob)
				{
					new slot, value;
					
					slot = GetComponentSlot(TuneComponent);
					if(GetVehicleComponent(TuneVehicle, slot) == TuneComponent)
					{
					    ShowTextForPlayer(playerid, "Esse veiculo ja possui esse componente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 3000);
					    ShowTuningMainMenu(playerid);
				        return 1;
					}
					
					value = GetComponentValue(TuneComponent);
				    if(GetPlayerMoneyEx(playerid) < value)
				    {
				        ShowTextForPlayer(playerid, "Dinheiro insuficiente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
				        ShowTuningMainMenu(playerid);
				        return 1;
				    }
				    
				    AddVehicleComponent(TuneVehicle, TuneComponent);
				    SaveVehicleComponent(TuneVehicle, TuneComponent, slot);
				    GivePlayerMoneyEx(playerid, -value);
				    ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
	            	ShowTextForPlayer(playerid, "Componente aplicado.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 1000);
				    return 1;
				}
				
				else
				{
				    if(GetPlayerMoneyEx(playerid) < 1000)
				    {
				        ShowTextForPlayer(playerid, "Dinheiro insuficiente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
				        ShowTuningMainMenu(playerid);
				        return 1;
				    }
				    
				    Paintjob = false;
				    ChangeVehiclePaintjob(TuneVehicle, TuneComponent);
				    SaveVehiclePaintjob(TuneVehicle, TuneComponent);
				    GivePlayerMoneyEx(playerid, -1000);
				    ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
				    return 1;
				}
	        }
	        case 1:
	        {
	            if(!Paintjob)
				{
	            	RemoveVehicleComponent(TuneVehicle, TuneComponent);
	            	ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
	            	LoadVehicleComponents(TuneVehicle);
	            	return 1;
				}
				
				else
				{
				    Paintjob = false;
				    RemoveVehiclePaintjob(TuneVehicle);
	            	ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
				    LoadVehicleComponents(TuneVehicle);
				    return 1;
				}
	        }
	    }
	}
	
	else if(mid == mTuning)
	{
	    if(Tunes[row] == -1 || TuneVehicle == -1)
	    {
	        StopPlayerTune(playerid);
			return 1;
	    }
	    
	    DestroyMenu(mCurrentTune);
	    mCurrentTune = CreateMenu("Componentes", 2, 2, 150, 100, 20);
	    SetMenuColumnHeader(mCurrentTune, 0, "Componentes:");
	    
	    if(!IsValidMenu(mCurrentTune))
	    {
	        StopPlayerTune(playerid);
	        SendClientMessage(playerid, COLOUR_GRAY, "Ocorreu um erro na exibição do menu, tente novamente.");
	        return 1;
	    }
	    
		new count = 0, w =0;
		new slot = Tunes[row];
		
		if(slot == WHEELS)
		{
		    for(new t = 0; t < sizeof Components; t++)
		    {
		        if(Components[t][tuneSlot] == slot)
		        {
		            AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
		            AddMenuItem(mCurrentTune, 1, " ");
		            RowComponents[count++] = t + 1000;
		            w++;
		            
		            if(w >= 10)
		            {
		                AddMenuItem(mCurrentTune, 0, "Proximo");
		                AddMenuItem(mCurrentTune, 1, "->");
		                RowComponents[count++] = 500;
		                break;
		            }
		        }
		    }
		}
		
		else if(slot == NITROS || slot == STEREO || slot == HYDRAULICS)
		{
			for(new t = 0; t < sizeof Components; t++)
			{
		    	if(Components[t][tuneSlot] == slot)
		    	{
		            AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
		            RowComponents[count++] = t + 1000;
		    	}
			}
			
			Paintjob = false;
		}
		
		else if(slot == PAINTJOBS)
		{
			AddMenuItem(mCurrentTune, 0, "Pintura 1");
			RowComponents[count++] = 0;
			AddMenuItem(mCurrentTune, 0, "Pintura 2");
			RowComponents[count++] = 1;
			AddMenuItem(mCurrentTune, 0, "Pintura 3");
			RowComponents[count++] = 2;
		    Paintjob = true;
		}
		
		else
		{
		    new modelid = GetVehicleModel(TuneVehicle);
		    
		    for(new m = 0; m < sizeof CarMods; m++)
		    {
				if(CarMods[m][0] == modelid)
				{
				    for(new t = 1; t < 15; t++)
				    {
				        new comp;

						comp = CarMods[m][t];
				        
				        if(!IsValidVehicleComponent(comp))
							break;
				        
				        if(GetComponentSlot(comp) == slot)
				        {
				        	new bool:issimilar = false;
				        	
            				for(new c = 0; c < count; c++)
	           				{
								if(!issimilar)
								{
	              					if(RowComponents[c] == comp)
		                			{
                   						issimilar = true;
			            	    	}
	                				else
			            	    	{
                   						for(new s = 0; s < sizeof SimilarComponents; s++)
	        							{
 							        		if((SimilarComponents[s][0] == comp || SimilarComponents[s][1] == comp) && (SimilarComponents[s][0] == RowComponents[c] || SimilarComponents[s][1] == RowComponents[c]))
 							        		    issimilar = true;
				        				}
              						}
								}
				        	}
				        	
							if(!issimilar)
							{
							    AddMenuItem(mCurrentTune, 0, Components[comp - 1000][tuneName]);
		           	 			RowComponents[count++] = comp;
							}
						}
				    }
				    break;
				}
		    }

			Paintjob = false;
		}

		if(count < 1)
		{
		    TogglePlayerControllable(playerid, true);
	        SendClientMessage(playerid, COLOUR_GRAY, "Ocorreu um erro na exibição do menu, tente novamente.");
	        return 1;
		}
		
		ShowMenuForPlayer(mCurrentTune, playerid);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	if(mid == Bank[0])
	{
	    new string[128];
	    
	    switch(row)
	    {
	    	case 0:
	    	{
	    	    BankOpc[playerid] = 1;
				format(string, sizeof string, "$%s,00", hGetString(GetPlayerXFilePath(playerid), "Bank"));
				SetMenuColumnHeader(Bank[1], 1, string);
				ShowMenuForPlayer(Bank[1], playerid);
				TogglePlayerControllable(playerid, false);
	    	}
	    	
	    	case 1:
	    	{
	    	    BankOpc[playerid] = 2;
	    	    format(string, sizeof string, "$%s,00", hGetString(GetPlayerXFilePath(playerid), "Bank"));
				SetMenuColumnHeader(Bank[1], 1, string);
	    	    ShowMenuForPlayer(Bank[1], playerid);
    		    TogglePlayerControllable(playerid, false);
	    	}
		}
	}
	
	else if(mid == Bank[1])
	{
 		new BankAmount[] = {
		 	1, 5, 10, 50, 100, 500, 1000,
		 	5000, 10000, 50000, 100000
 		};
 		
  		if(BankOpc[playerid] == 1)
    	{
   			if(hGetInt(GetPlayerXFilePath(playerid), "Bank") < BankAmount[row])
   			    ShowTextForPlayer(playerid, "Voce nao possui essa quantidade para sacar.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
    		
	        else
	        {
	        	GivePlayerMoneyEx(playerid, BankAmount[row]);
				hSetInt(GetPlayerXFilePath(playerid), "Bank", hGetInt(GetPlayerXFilePath(playerid), "Bank") - BankAmount[row]);
    		}
		}
		
		else if(BankOpc[playerid] == 2)
		{
  			if(GetPlayerMoneyEx(playerid) < BankAmount[row])
       			ShowTextForPlayer(playerid, "Voce nao possui essa quantidade para depositar.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
          	
           	else
	        {
         		GivePlayerMoneyEx(playerid, -BankAmount[row]);
				hSetInt(GetPlayerXFilePath(playerid), "Bank", hGetInt(GetPlayerXFilePath(playerid), "Bank") + BankAmount[row]);
    		}
		}
		
		else
		{
		    TogglePlayerControllable(playerid, true);
		    return 0;
		}
		
		new string[128];
		format(string, sizeof string, "$%s,00", hGetString(GetPlayerXFilePath(playerid), "Bank"));
		SetMenuColumnHeader(Bank[1], 1, string);
		ShowMenuForPlayer(Bank[1], playerid);
		TogglePlayerControllable(playerid, false);
		ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 1, 1);
	}
	
	if(mid == Guns[0])
	{
	    ShowMenuForPlayer(Guns[row+1], playerid);
	    TogglePlayerControllable(playerid, false);
	    return 1;
	}
	
	for(new g = 1; g < 6; g++)
	{
	    if(mid == Guns[g])
	    {
	        new count = 0;
			
	        for(new gun = 0; gun < sizeof Weapons; gun++)
	        {
	            if(!IsForbiddenWeapon(gun) && Weapons[gun][wSlot] == g+1)
	            {
	                if(row == count)
	                {
						if(GetPlayerMoneyEx(playerid) < Weapons[gun][wValue])
						{
						    ShowTextForPlayer(playerid, "Dinheiro insuficiente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
						    break;
						}
						
						new res;
						
						res = GivePlayerWeaponEx(playerid, gun, Weapons[gun][wAmmo]);
						
						if(res == 0)
						{
						    GivePlayerMoneyEx(playerid, -Weapons[gun][wValue]);
						    ShowTextForPlayer(playerid, "Arma adquirida.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 1500);
						}
						
						if(res == 1)
						    ShowTextForPlayer(playerid, "Essa arma ja possui o numero maximo de cartuchos.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
						
						if(res == 2)
						    ShowTextForPlayer(playerid, "Voce nao pode carregar mais de uma arma pesada.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
						
						if(res == 3)
						    ShowTextForPlayer(playerid, "Voce nao pode carregar mais de uma arma leve.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
						
	                    break;
	                }
	                
					count++;
	            }
	        }
	        
	        ShowMenuForPlayer(Guns[g], playerid);
			TogglePlayerControllable(playerid, false);
			return 1;
	    }
	}
	
	if(mid == Guns[6])
	{
	    if(GetPlayerMoneyEx(playerid) < Explosives[row][expValue])
		    ShowTextForPlayer(playerid, "Dinheiro insuficiente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
		
		else
		{
		    new res;
		    
		    res = GivePlayerExplosive(playerid, row);
		    
		    if(res == 0)
		    {
		    	GivePlayerMoneyEx(playerid, -Explosives[row][expValue]);
                ShowTextForPlayer(playerid, "Explosivo adquirido.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 1500);
			}
			
			if(res == 1)
			    ShowTextForPlayer(playerid, "Voce ja possui a quantidade maxima desse explosivo.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 3000);
		}

	    ShowMenuForPlayer(Guns[6], playerid);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	if(mid == Guns[7])
	{
	    if(GetPlayerMoneyEx(playerid) < 300)
		{
		    ShowTextForPlayer(playerid, "Dinheiro insuficiente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
		}
		else
		{
		    GivePlayerMoneyEx(playerid, -300);
			SetArmour(playerid, 100.0);
			ShowTextForPlayer(playerid, "Colete adquirido.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 1500);
		}
	    
	    ShowMenuForPlayer(Guns[7], playerid);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	if(mid == Donuts)
	{
  		if(!GivePlayerFood(playerid, "Donut servido, evite ficar próximo a fogo, para não queimar a rosca -.-'", 40, 15.0, Donuts))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
  		}
  		
		return 1;
	}
	
	if(mid == Pizzas)
	{
  		if(!GivePlayerFood(playerid, "Pizza servida, bom apetite.", 40, 15.0, Pizzas))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
  		}
  		
		return 1;
	}
	
	if(mid == Chickens)
	{
  		if(!GivePlayerFood(playerid, "Comida servida, bom apetite.", 40, 15.0, Chickens))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
  		}
  		
		return 1;
	}
	
	if(mid == Burgers)
	{
  		if(!GivePlayerFood(playerid, "Sanduiche servido, bom apetite.", 40, 15.0, Burgers))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
  		}
  		
		return 1;
	}
	
	if(mid == Foods)
	{
		if(!GivePlayerFood(playerid, "Comida servida, bom apetite.", 20, 15.0, Foods))
		{
		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
		}

		return 1;
	}
	
	if(mid == Drinks)
	{
		if(!GivePlayerFood(playerid, "Bebida servida, para beber pressione LMB.", 20, 4.0, Menu:INVALID_MENU))
		{
		    SetPlayerSpecialAction(playerid, Drink[row][drinkAction]);
		}
		
		InRestaurant[playerid] = 0;
		return 1;
	}
	
	if(mid == Restaurant)
	{
		switch(row)
		{
		    case 0: ShowMenuForPlayer(Foods, playerid);
		    case 1: ShowMenuForPlayer(Drinks, playerid);
		}
		
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	return 1;
}

stock GivePlayerFood(playerid, const message[], value, Float:health, Menu:menu)
{
    if(IsValidMenu(menu))
	{
	    ShowMenuForPlayer(menu, playerid);
  		TogglePlayerControllable(playerid, false);
	}
	
	else
	    TogglePlayerControllable(playerid, true);
	    
	if(GetPlayerMoneyEx(playerid) < value)
	{
	    ShowTextForPlayer(playerid, "Dinheiro insuficiente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
		return 1;
	}
	
	else
	{
		AddHealth(playerid, health);
		GivePlayerMoneyEx(playerid, -value);
		SendClientMessage(playerid, COLOUR_LIGHT_YELLOW, message);
	}

	return 0;
}

public OnPlayerExitedMenu(playerid)
{
	new Menu:mid = GetPlayerMenu(playerid);

    if(mid == mCusto || mid == mCurrentTune)
	{
	    new Float:x, Float:y, Float:z;
	    
	    GetVehiclePos(TuneVehicle, x, y, z);
	    
	    if(!Paintjob)
	    	RemoveVehicleComponent(TuneVehicle, TuneComponent);
	    	
		else
			RemoveVehiclePaintjob(TuneVehicle);
			
		Paintjob = 0;
       	TogglePlayerControllable(playerid, false);
	    ShowTuningMainMenu(playerid);
	    LoadVehicleComponents(TuneVehicle);
     	return 1;
	}
	
	if(mid == mTuning)
	    StopPlayerTune(playerid);
	
	if(mid == Guns[0])
	{
	    SetCameraBehindPlayer(playerid);
		TogglePlayerControllable(playerid, true);
		return 1;
	}
	
	for(new g = 1; g < sizeof Guns; g++)
	{
	    if(mid == Guns[g])
	    {
	        ShowMenuForPlayer(Guns[0], playerid);
			TogglePlayerControllable(playerid, false);
			return 1;
	    }
	}
	
	if(mid == Restaurant)
	    InRestaurant[playerid] = 0;

	if(InRestaurant[playerid] == 1)
	{
	    ShowMenuForPlayer(Restaurant, playerid);
	    TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	if(mid == Bank[1])
	{
		BankOpc[playerid] = 0;
		ShowMenuForPlayer(Bank[0], playerid);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	BankOpc[playerid] = 0;
	TogglePlayerControllable(playerid, true);
	return 1;
}

public OnObjectMoved(objectid)
{

}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{

}

public OnPlayerDeath(playerid, killerid, reason)
{
    new pxpath[128], pkpath[128];
    new pgang;
	new Float:X, Float:Y, Float:Z, Float:A;
	
	pxpath = GetPlayerXFilePath(playerid);
	pkpath = GetPlayerKFilePath(playerid);
	pgang = GetPlayerGang(playerid);
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, A);
	SavePlayerWeapons(playerid);
	
	if(killerid != INVALID_PLAYER_ID)
	{
	    if(GetPlayerState(killerid) == PLAYER_STATE_DRIVER)
	    {
	        if(!IsPlayerAdmin(killerid))
	        {
	        	new string[128];
	        
	        	SendClientMessage(playerid, COLOUR_RED, "--> Você foi kickado do servidor por Drive-by Kill (matar alguém dirigindo).");
	        	Kick(killerid);
	        	format(string, sizeof string, "%s foi kickado do servidor. Motivo: Drive-by Kill", PlayerName(killerid));
	        	SendClientMessageToAll(COLOUR_RED, string);
			}
		}
		
		else
		{
	    	new kxpath[128], kkpath[128];
	    	new kgang, kzone;
	    
	    	kxpath = GetPlayerXFilePath(killerid);
			kkpath = GetPlayerKFilePath(killerid);
			kgang = GetPlayerGang(killerid);
	    	kzone = Zone[killerid];
	
			if(Weapons[reason][wSkill] != -1)
			{
			    new skill_key[128], cur_level;

			    format(skill_key, sizeof skill_key, "SkillLevel%d", Weapons[reason][wSkill]);
			    cur_level = hGetInt(kkpath, skill_key);

			    if(cur_level != MAX_SKILL_LEVEL)
			    {
			        cur_level += 20;

			    	if(cur_level > MAX_SKILL_LEVEL)
						cur_level = MAX_SKILL_LEVEL;

		        	hSetInt(kkpath, skill_key, cur_level);
		        	SetPlayerSkillLevel(killerid, reason, cur_level);
				}
			}
		
			if(kzone != -1 && kgang != 0 && pgang != 0 && kgang != pgang)
			{
			    if(GetZoneDomain(kzone) == pgang)
			    {
			        if(GangZones[kzone][gzAttacker] == 0)
			        {
						KillTimer(GangZones[kzone][gzTimer]);
						GangZoneFlashForAll(GangZones[kzone][gzId], COLOUR_RED);
						GangZones[kzone][gzAttacker] = kgang;
						GangZones[kzone][gzScore] = 0;
						GangZones[kzone][gzTimer] = SetTimerEx("GangZoneWar", 5000, true, "ddd", kzone, pgang, kgang);
				
						for(new n = 0; n < MAX_SLOTS; n++)
						{
						    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == kzone)
								UpdatePlayerZoneText(n);
						}

						SendClientMessage(killerid, COLOUR_SKY_BLUE, "Você iniciou um ataque nesse território, mantenha-se nele para conclui-lo.");
					}
					
					else if(GangZones[kzone][gzAttacker] == kgang)
					{
					    new ppost;
					    
					    ppost = GetPlayerGangPost(playerid);
					    
					    if(ppost == GANGPOST_LEADER)
					    {
					        SetZoneDomain(kzone, kgang);
					        FinishWar(kzone);
					    }
					}
			    }
			    
			    else if(GetZoneDomain(kzone) == kgang)
			    {
			        new ppost;

					ppost = GetPlayerGangPost(playerid);

					if(ppost == GANGPOST_LEADER)
			        	FinishWar(kzone);
			    }
			}
		}
	}

    if(Dying[playerid] == 0)
    {
        new speak;
        
		speak = random(3);

		if(speak == 0)
			Speak(playerid, "Oooohhh, forgive... me.");
		if(speak == 1)
		    Speak(playerid, "Oooohhhh, I can't fight... anymore, ahhh.");
		if(speak == 2)
		    Speak(playerid, "Ahhhhh, I just can't... resist, ohhhh.");

   		HideTextGray(playerid);
		HideTextRed(playerid);
		Dying[playerid] = 1;
		Limp[playerid] = 0;
		SetSpawnInfo(playerid, 0, hGetInt(pxpath, "Skin"), X, Y, Z, A, 0, 0, 0, 0, 0, 0);
	}
	
	else
	    Die(playerid, false);
}

public UpdateCrouch()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        if(Crouch[n] != (GetPlayerSpecialAction(n) == SPECIAL_ACTION_DUCK))
			    UpdatePlayerCrouch(n);
	    }
	}
}

public UpdatePlayerCrouch(playerid)
{
    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DUCK)
    {
    	if(HandgunObject[playerid] != -1)
	       	AttachObjectToPlayer(HandgunObject[playerid], playerid, 0.175 + HandgunObjectOffsetX[playerid], -0.175, -0.15, 0, 45.0, 180);
	       	
        if(CarryObject[playerid] != -1)
        	AttachObjectToPlayer(CarryObject[playerid], playerid, 0.0, 0.5, -0.2, 0.0, 0.0, 0.0);
        	
		Crouch[playerid] = true;
    }
    
    else
    {
    	if(HandgunObject[playerid] != -1)
    		AttachObjectToPlayer(HandgunObject[playerid], playerid, 0.175 + HandgunObjectOffsetX[playerid], -0.175, 0.30, 0, 45.0, 180);
    		
        if(CarryObject[playerid] != -1)
        	AttachObjectToPlayer(CarryObject[playerid], playerid, 0.0, 0.5, 0.4, 0.0, 0.0, 0.0);
        	
		Crouch[playerid] = false;
    }
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_LOOK_BEHIND && Radio[playerid] != -1 && Dying[playerid] == 0)
	{
	    KillTimer(SpeakTimer[playerid]);
	    SpeakId[playerid] = (SpeakId[playerid] + 1) % sizeof Speaks;
	    SpeakTimer[playerid] = SetTimerEx("SpeakRadio", 2000, false, "dd", playerid, SpeakId[playerid]);
	    
		if(tdspeak[playerid] != Text:INVALID_TEXT_DRAW)
		    TextDrawSetString(tdspeak[playerid], Speaks[SpeakId[playerid]]);

		else
		{
		    tdspeak[playerid] = TextDrawCreate(32.0, 318.0, Speaks[SpeakId[playerid]]);
		    TextDrawColour(tdspeak[playerid], COLOUR_DARK_GOLD);
		    TextDrawFont(tdspeak[playerid], 1);
		    TextDrawLetterSize(tdspeak[playerid], 0.53, 1.5);
		    TextDrawSetShadow(tdspeak[playerid], 1);
		    TextDrawAlignment(tdspeak[playerid], 1);
		    TextDrawShowForPlayer(playerid, tdspeak[playerid]);
		}
		
		return 0;
	}
	
	if(newkeys & KEY_SECONDARY_ATTACK && VFrozenFlags[playerid] != 0)
	{
	    TogglePlayerControllable(playerid, true);
	    TextDrawHideForPlayer(playerid, tdvehicle);
	    RemovePlayerFromVehicle(playerid);
	    return 1;
	}
	
	if(newkeys & KEY_SPRINT && !(oldkeys & KEY_SPRINT) && DroppedWeapon[playerid] != -1)
	{
		new id, res;
		
		id = DroppedWeapon[playerid];
		res = GivePlayerWeaponEx(playerid, DroppedWeapons[id][dwWeaponId], DroppedWeapons[id][dwAmmo]);

		if(res == 0)
		{
		    DeleteDroppedWeapon(id);
		    ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 1, -1);
		    SetTimerEx("StopAnimation", 1000, false, "d", playerid);
		}
		
		if(res == 1)
		    ShowTextForPlayer(playerid, "Voce ja possui o numero maximo de cartuchos.", 318.0, 300.0, COLOUR_RED, 1, 0.4, 1.7, 1, 2, 1000);

		if(res == 2)
		    ShowTextForPlayer(playerid, "Voce ja possui uma arma pesada.", 318.0, 300.0, COLOUR_RED, 1, 0.5, 1.5, 1, 2, 1000);

		if(res == 3)
		    ShowTextForPlayer(playerid, "Voce ja possui uma arma leve.", 318.0, 300.0, COLOUR_RED, 1, 0.5, 1.5, 1, 2, 1000);

		if(res == 4)
		    ShowTextForPlayer(playerid, "Voce ja possui uma arma branca.", 318.0, 300.0, COLOUR_RED, 1, 0.5, 1.5, 1, 2, 1000);
			
		return 1;
	}
	
	if(newkeys & KEY_HANDBRAKE && !(oldkeys & KEY_HANDBRAKE))
	{
	    if(Area[playerid] == AREA_MOD_SHOP)
	    {
	        ShowTuningMainMenu(playerid);
	        return 1;
	    }
	}
	
    if(newkeys & KEY_WALK && !(oldkeys & KEY_WALK))
	{
		if(Door[playerid] != -1)
		{
		    new int;

			int = Enters[Door[playerid]][intId];

            TextDrawHideForPlayer(playerid, tdjoin);
			SetPlayerInterior(playerid, Ints[int][intInt]);
			SetPlayerPos(playerid, Ints[int][intX], Ints[int][intY], Ints[int][intZ]);
			SetPlayerVirtualWorld(playerid, Enters[Door[playerid]][enterVirtualWorld]);
			Enter[playerid] = Door[playerid];
			Door[playerid] = -1;
			return 1;
		}

		if(Enter[playerid] != -1)
		{
		    new int, prev;
			new Float:X, Float:Y, Float:Z;

            int = Enters[Enter[playerid]][intId];
            prev = Enter[playerid] + Enters[Enter[playerid]][enterPrev];
			GetPlayerPos(playerid, X, Y, Z);

			if(GetDistance(X, Y, Z, Ints[int][intX], Ints[int][intY], Ints[int][intZ]) > 2.5)
			    return 1;

            TextDrawHideForPlayer(playerid, tdexit);
			SetPlayerInterior(playerid, Enters[Enter[playerid]][enterInt]);
			SetPlayerPos(playerid, Enters[Enter[playerid]][enterX], Enters[Enter[playerid]][enterY], Enters[Enter[playerid]][enterZ]);

			if(prev > -1 && prev != Enter[playerid] && prev < sizeof Enters)
			{
				SetPlayerVirtualWorld(playerid, Enters[prev][enterVirtualWorld]);
				Enter[playerid] = prev;
			}
			
			else
			{
			    SetPlayerVirtualWorld(playerid, 0);
			    Enter[playerid] = -1;
			}
			
			return 1;
		}
		
		if(House[playerid] != -1)
		{
		    new hpath[128];
	    	new value, int;

		   	hpath = GetHouseFilePath(House[playerid]);
			value = hGetInt(hpath, "Value");
			int = -1;
			
            for(new house = 0; house < sizeof HouseInteriors; house++)
			{
			    if(HouseInteriors[house][hintValue] == value)
			    {
			        int = house;
			        break;
			    }
			}

			if(int != -1)
			{
		    	if(GetPlayerInterior(playerid) != 0)
		    	{
					new Float:X, Float:Y, Float:Z, Float:HX, Float:HY, Float:HZ, Float:HA;

					GetPlayerPos(playerid, X, Y, Z);
					LoadHousePos(House[playerid], HX, HY, HZ, HA);

					if(GetDistance(X, Y, Z, HouseInteriors[int][hintX], HouseInteriors[int][hintY], HouseInteriors[int][hintZ]) > 2.5)
					    return 1;
				    
	                TextDrawHideForPlayer(playerid, tdexit);
	                SetPlayerVirtualWorld(playerid, 0);
					SetPlayerInterior(playerid, 0);
					SetPlayerPos(playerid, HX, HY, HZ);
					SetPlayerFacingAngle(playerid, HA);
					House[playerid] = -1;
				}

				else
				{
				    TextDrawHideForPlayer(playerid, tdjoin);
					TextDrawDestroy(tdhouse[playerid]);
	   				tdhouse[playerid] = Text:INVALID_TEXT_DRAW;
					SetPlayerVirtualWorld(playerid, House[playerid] + 1);
					SetPlayerInterior(playerid, HouseInteriors[int][hintInt]);
					SetPlayerPos(playerid, HouseInteriors[int][hintX], HouseInteriors[int][hintY], HouseInteriors[int][hintZ]);
				}
			}
			
			return 1;
		}
	}
	
	if(newkeys & KEY_SUBMISSION && !(oldkeys & KEY_SUBMISSION) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    new vehid;
	    
	    vehid = GetPlayerVehicleID(playerid);
	    
	    if(IsPlayerVehicle(vehid))
     	{
     	    new vpath[128], kit;
     	    
     	    vpath = GetVehicleFilePath(vehid);
     	    
     	    kit = hGetInt(vpath, "Params") & 3;
     	    
     	    if(kit != 2 && kit != 3)
     	    {
     	        SendClientMessage(playerid, COLOUR_GRAY, "Esse veículo não está com as travas acionadas.");
     	        return 1;
     	    }
     	    
     	    kit = ((kit + 1) % 2) + 2;
     	    hSetInt(vpath, "Params", hGetInt(vpath, "Params") | (kit & 3));
     	    
	    	if(kit == 3)
	    	{
	            new owner[128];
	            
				owner = hGetString(vpath, "Owner");
				
				for(new n = 0; n < MAX_SLOTS; n++)
				{
				    if(n != playerid && !IsPlayerAdmin(n) && strcmp(PlayerName(n), owner, true) != 0)
				        SetVehicleParamsForPlayer(vehid, n, 0, 1);
				}
				
				ShowTextForPlayer(playerid, "Veiculo trancado.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 500);
	        }
	        else if(kit == 2)
	        {
	            for(new n = 0; n < MAX_SLOTS; n++)
    				SetVehicleParamsForPlayer(vehid, n, 0, 0);
				
				ShowTextForPlayer(playerid, "Veiculo destrancado.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 500);
	        }
	    }
	    else
	    {
	        if(WorkVehicle[playerid] != vehid)
	        {
	            for(new n = 0; n < MAX_SLOTS; n++)
			    {
			        if(n != playerid)
    					SetVehicleParamsForPlayer(vehid, n, 0, 0);
				}

				WorkVehicle[playerid] = vehid;
				ShowTextForPlayer(playerid, "Veiculo trancado.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 500);
			}
			else
			{
			    for(new n = 0; n < MAX_SLOTS; n++)
    				SetVehicleParamsForPlayer(vehid, n, 0, 0);

				WorkVehicle[playerid] = -1;
				ShowTextForPlayer(playerid, "Veiculo destrancado.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 500);
			}
	    }
	}
	
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	UpdatePlayerCrouch(playerid);
	
	if(oldstate == PLAYER_STATE_DRIVER)
	{
	    DeletePlayerFuelText(playerid);
            
	    for(new g = 0; g < sizeof tdgas; g++)
            TextDrawHideForPlayer(playerid, tdgas[g]);
            
        for(new v = 0; v < sizeof tdvelo; v++)
            TextDrawHideForPlayer(playerid, tdvelo[v]);

        if(tdspeed[playerid] != Text:INVALID_TEXT_DRAW)
	   		TextDrawDestroy(tdspeed[playerid]);
	   		
        if(tdvinfo[playerid] != Text:INVALID_TEXT_DRAW)
	   		TextDrawDestroy(tdvinfo[playerid]);
	   		
        if(tdhealthbar[playerid] != Text:INVALID_TEXT_DRAW)
	   		TextDrawDestroy(tdhealthbar[playerid]);
	   		
		TextDrawHideForPlayer(playerid, tdhealth);
		VHealthText[playerid] = -1;
		VFrozenFlags[playerid] = 0;
	}
	
	if(IsPlayerInAnyVehicle(playerid))
 	{
     	if(CarryObject[playerid] != -1)
     	{
         	DestroyObject(CarryObject[playerid]);
         	CarryObject[playerid] = -1;
     	}
	        
		if(HandgunObject[playerid] != -1)
		{
		    DestroyObject(HandgunObject[playerid]);
			HandgunObject[playerid] = -1;
		}
   	}
	    
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    new string[256], owner[128], plate[128];
		new vehid;
		new Float:Z;
		
		vehid = GetPlayerVehicleID(playerid);
        
        for(new g = 0; g < sizeof tdgas; g++)
            TextDrawShowForPlayer(playerid, tdgas[g]);

        for(new v = 0; v < sizeof tdvelo; v++)
            TextDrawShowForPlayer(playerid, tdvelo[v]);

		TextDrawShowForPlayer(playerid, tdhealth);
		
        if(IsServerVehicle(vehid))
		{
     		owner = ("Servidor");
       		format(plate, sizeof plate, "VLR %d", vehid);
       	}

		else
  		{
    		new vpath[128];
    		
      		vpath = GetVehicleFilePath(vehid);
   			owner = hGetString(vpath, "Owner");
      		plate = hGetString(vpath, "NumberPlate");
        }
	        
		format(string, sizeof string, "~y~~h~Modelo: ~w~%s~n~~y~~h~Proprietario: ~w~%s~n~~y~~h~Placa: ~w~%s",   Vehicles[GetVehicleModel(vehid)-400][vehModel],
		                                                                                                        owner,
		                                                                                                        plate);

		tdspeed[playerid] = TextDrawCreate(269.0, 403.0, "0km/h");
 		TextDrawAlignment(tdspeed[playerid], 2);
 		TextDrawLetterSize(tdspeed[playerid], 0.58, 1.3);
 		TextDrawSetOutline(tdspeed[playerid], 0);
 		TextDrawColour(tdspeed[playerid], 0xFFFFFFFF);
 		TextDrawBackgroundColour(tdspeed[playerid], -0xFFFFFFFF);
 		TextDrawSetShadow(tdspeed[playerid], 0);
 		TextDrawUseBox(tdspeed[playerid], true);
 		TextDrawBoxColor(tdspeed[playerid], 0x0000FFFF);
 		TextDrawTextSize(tdspeed[playerid], 0.0, 100.0);

        tdvinfo[playerid] = TextDrawCreate(219.0, 349.0, string);
 		TextDrawAlignment(tdvinfo[playerid], 1);
 		TextDrawLetterSize(tdvinfo[playerid], 0.34, 1.4);
 		TextDrawSetProportional(tdvinfo[playerid], 1);
 		TextDrawSetOutline(tdvinfo[playerid], 2);
 		TextDrawColour(tdvinfo[playerid], 0x000000BE);
 		TextDrawBackgroundColour(tdvinfo[playerid], -0x0000FFF5);
 		TextDrawSetShadow(tdvinfo[playerid], 0);

        TextDrawShowForPlayer(playerid, tdspeed[playerid]);
 	    TextDrawShowForPlayer(playerid, tdvinfo[playerid]);
	    UpdatePlayerFuelText(playerid);
		UpdatePlayerHealthText(playerid);
		GetVehiclePos(vehid, VCoords[playerid][0], VCoords[playerid][1], Z);
	}
	
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	    if(oldstate == PLAYER_STATE_DRIVER)
	    {
			if(PizzaDelivery[playerid] == 1)
			{
			    CarryObject[playerid] = CreateObject(1582, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			    AttachObjectToPlayer(CarryObject[playerid], playerid, 0.0, 0.5, 0.4, 0.0, 0.0, 0.0);
			    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 1, 1, 1, 1);
			    ShowTextForPlayer(playerid, "Leve a pizza ate a porta.", 318.0, 309.0, COLOUR_BLUE, 1, 0.4, 1.7, 0, 2, 3000);
			}
	    }
	    
	    Weapon[playerid] = -1;
	    WorkVehicle[playerid] = -1;
	}
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!IsPlayerLogged(playerid))
	{
	    ShowTextForPlayer(playerid, "Voce deve efetuar login para fazer isso.", 318.0, 309.0, COLOUR_RED, 1, 0.4, 1.7, 0, 2, 2000);
	    return 1;
	}
	
    new cmd[128], idx, pjob;
    
    idx = 0;
    
	if(strcmp(cmdtext, "/ajuda", true) == 0 || strcmp(cmdtext, "/help", true) == 0)
	{
	    SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Comandos principais:");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/a [texto] - /c [texto] - /g [texto] - /status [categoria] - /animacoes - /emprego - /casa");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/veiculo - /radio - /comandos - /documentos [id] - /vdocumentos - /item - /gangue");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/ligar [numero/nome] - /sms [numero] [texto] - /desligar - /adicionarcontato [nome] [numero]");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/apagarcontato [nome/numero] - /vercontatos - /teclas - /votekick [id] [motivo] - /votar");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/gps [desligar/local] - /usarskin [pessoal/trabalho]");
	    return 1;
	}
	
	if(strcmp(cmdtext, "/teclas", true) == 0 || strcmp(cmdtext, "/keys", true) == 0)
	{
	    SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Teclas de jogo:");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "[ALT]: utilizada para entrar e sair de lugares.");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "[2]: utilizada em um veículo para acionar ou desacionar suas travas.");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "[Espaco]: utilizada para pegar armas no chão.");
	    return 1;
	}
	
	cmd = strtok(cmdtext, idx);
	pjob = hGetInt(GetPlayerXFilePath(playerid), "Job");
	
	if(!IsPlayerAdmin(playerid))
	{
		for(new j = 0; j < sizeof JobCommands; j++)
		{
		    new offset_idx = 0;
			if(strcmp(cmd, strtok(JobCommands[j][jCmd], offset_idx), true) == 0)
			{
				new bool:ok;
				
				ok = false;
			    for(new jid = 0; jid < 6; jid++)
		    	{
					if(pjob == JobCommands[j][jJobs][jid])
					{
					    ok = true;
					    break;
					}
				}
				
				if(!ok)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não tem permissão para usar esse comando.");
			        return 1;
				}
			    
			    break;
			}
		}
	}
	
	if(strcmp(cmd, "/dancar", true) == 0)
	{
		new dance_style;

		if(IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode dançar dentro de um veículo.");
		    return 1;
		}
		
		dance_style = strval(strtok(cmdtext, idx));

	    if(dance_style == 1)
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
	        
       	else if(dance_style == 2)
    	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
    	    
       	else if(dance_style == 3)
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
			
    	else if(dance_style == 4)
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
	        
		else if(dance_style == 5)
		{
  			KillTimer(DanceTimer[playerid]);
	        TogglePlayerControllable(playerid, false);
	   		ApplyAnimation(playerid, "DANCING", "dnce_M_d", 4.1, 1, 1, 1, 1, -1);
	   		DanceStyle[playerid] = 0;
	   		DanceOff[playerid] = 0;
	   		DanceTimer[playerid] = SetTimerEx("Dancing", 100, true, "d", playerid);
	   		ShowTextForPlayer(playerid, "Pressione ~g~Enter ~w~para parar de dancar.", 318.0, 309.0, COLOUR_WHITE, 1, 0.4, 1.7, 1, 2, 5000);
		}
		
		else if(dance_style == 6)
		{
		    KillTimer(DanceTimer[playerid]);
	        TogglePlayerControllable(playerid, false);
		    ApplyAnimation(playerid, "STRIP", "STR_Loop_A", 4.1, 1, 1, 1, 1, -1);
	   		DanceOff[playerid] = 0;
	   		DanceTimer[playerid] = SetTimerEx("Stripping", 100, true, "d", playerid);
	   		ShowTextForPlayer(playerid, "Pressione ~g~Enter ~w~para parar de dancar.", 318.0, 309.0, COLOUR_WHITE, 1, 0.4, 1.7, 1, 2, 5000);
		}
		
		else
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /dancar [1-6]");
		
		return 1;
	}
	
	if(strcmp(cmd, "/plantar", true) == 0)
	{
	    new exp[128], Float:X, Float:Y, Float:Z, Float:A, obj;
	    
	    exp = strtok(cmdtext, idx);
	    
		if(strlen(exp) > 0)
		{
		    GetPlayerPos(playerid, X, Y, Z);
		    GetPlayerFacingAngle(playerid, A);
		    
		    X += 0.5 * floatsin(-A, degrees);
		    Y += 0.5 * floatcos(-A, degrees);
		    Z -= 0.94;
		    
		    if(strcmp(exp, "bomba-relogio", true) == 0)
		    {
		        new seconds;

				seconds = strval(strtok(cmdtext, idx));
				
		        if(seconds < 15 || seconds > 90)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "USO: /plantar bomba-relogio [15~90 segundos]");
		            return 1;
		        }
		        
		        if(GetPlayerExplosive(playerid, 0) == 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma bomba relogio.");
					return 1;
		        }
		        
		        TakePlayerExplosive(playerid, 0);
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
		        obj = CreateObject(1252, X, Y, Z, 90.0, 90.0, A);
		        SetTimerEx("ExplodeBomb", seconds * 1000, false, "dfff", obj, X, Y, Z);
		        SendClientMessage(playerid, COLOUR_RED, "The bomb has been planted!");
		        return 1;
		    }
		    
		    if(strcmp(exp, "bomba-aprox", true) == 0)
		    {
		        if(GetPlayerExplosive(playerid, 1) == 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma bomba c/ sensor aprox.");
					return 1;
		        }
		        
		        if(IsPlayerInAnyVehicle(playerid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não pode plantar uma bomba c/ sensor aprox. em um veículo.");
					return 1;
		        }
		        
                TakePlayerExplosive(playerid, 1);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
                obj = CreateObject(1252, X, Y, Z, 90.0, 90.0, A);
                SetTimerEx("ExplodeApproxBomb", 15000, false, "dfffd", obj, X, Y, Z, 0);
                SendClientMessage(playerid, COLOUR_RED, "Team, fall back!");
		        return 1;
		    }
		    
		    if(strcmp(exp, "bomba-remota", true) == 0)
		    {
		        if(RemoteBomb[playerid] != -1)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você já está com uma bomba remota plantada, use /explodir");
					return 1;
		        }
		        
		        if(GetPlayerExplosive(playerid, 2) == 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma bomba c/ sensor aprox.");
					return 1;
		        }

		        if(IsPlayerInAnyVehicle(playerid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não pode plantar uma bomba c/ sensor aprox. em um veículo.");
					return 1;
		        }

                TakePlayerExplosive(playerid, 2);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
                obj = CreateObject(1252, X, Y, Z, 90.0, 90.0, A);
                RemoteBomb[playerid] = obj;
                SendClientMessage(playerid, COLOUR_RED, "Bomba plantada, use /explodir");
		        return 1;
		    }
		    
		    if(strcmp(exp, "bomba-gas", true) == 0)
		    {
		        if(GetPlayerExplosive(playerid, 3) == 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma bomba de gás.");
					return 1;
		        }

		        if(IsPlayerInAnyVehicle(playerid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não pode plantar uma bomba de gás em um veículo.");
					return 1;
		        }

		        TakePlayerExplosive(playerid, 3);
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
		        obj = CreateObject(343, X, Y, Z, 0.0, 0.0, A);
		        SetTimerEx("GasEffect", 5000, false, "dfff", obj, X, Y, Z);
		        SendClientMessage(playerid, COLOUR_RED, "Need backup!");
		        return 1;
		    }
		    
		    if(strcmp(exp, "flash", true) == 0)
		    {
		        if(GetPlayerExplosive(playerid, 4) == 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma flash.");
					return 1;
		        }
		        
		        if(IsPlayerInAnyVehicle(playerid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não pode plantar uma flash em um veículo.");
					return 1;
		        }
		        
		        TakePlayerExplosive(playerid, 4);
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
		        obj = CreateObject(343, X, Y, Z, 0.0, 0.0, A);
		        SetTimerEx("FlashEffect", 15000, false, "dfff", obj, X, Y, Z);
		        SendClientMessage(playerid, COLOUR_RED, "Cover me!");
		        return 1;
		    }
		    
		    if(strcmp(exp, "rojao", true) == 0)
		    {
		        if(GetPlayerExplosive(playerid, 5) == 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui um rojão.");
					return 1;
		        }

		        if(IsPlayerInAnyVehicle(playerid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não pode plantar um rojão em um veículo.");
					return 1;
		        }
                
		        TakePlayerExplosive(playerid, 5);
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
		        obj = CreateObject(354, X, Y, Z, 0.0, 90.0, A);
		        SetTimerEx("RocketEffect", 8000, false, "dfffd", obj, X, Y, Z, 0);
		        SendClientMessage(playerid, COLOUR_RED, "Go go go!");
		        return 1;
		    }
		}

		SendClientMessage(playerid, COLOUR_GRAY, "USO: /plantar [bomba-relogio/bomba-aprox/bomba-remota/bomba-gas/flash/rojao]");
		return 1;
	}
	
	if(strcmp(cmd, "/explodir", true) == 0)
	{
	    new bombid;
		new Float:BX, Float:BY, Float:BZ;
	    
	    bombid = RemoteBomb[playerid];
	    
	    if(bombid == -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você deve plantar uma bomba-remota para explodi-la.");
			return 1;
	    }
	    
	    GetObjectPos(bombid, BX, BY, BZ);
		ExplodeBomb(bombid, BX, BY, BZ);
		RemoteBomb[playerid] = -1;
		SendClientMessage(playerid, COLOUR_RED, "CAAAAAAAAAAABBBBBBBBUUUUUUUUUUUMMMMMMMMMM!!!!!!!!!!");
		return 1;
	}
	
	if(strcmp(cmd, "/largararma", true) == 0)
	{
	    if(IsPlayerInAnyVehicle(playerid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar fora do veículo para largar a arma.");
			return 1;
	    }
	    
	    new gun[128];
		new Float:fixX, Float:fixY, Float:fixZ, Float:X, Float:Y, Float:Z, Float:A;
	    
	    gun = strtok(cmdtext, idx);
	    
	    SavePlayerWeapons(playerid);
	    
	    if(strlen(gun) > 0)
	    {
	        GetPlayerPos(playerid, fixX, fixY, fixZ);
	        GetPlayerFacingAngle(playerid, A);
	        fixX += 0.2 * floatsin(-A, degrees);
	        fixY += 0.2 * floatcos(-A, degrees);
	        X = fixX + 0.8 * floatsin(-A, degrees);
	        Y = fixY + 0.8 * floatcos(-A, degrees);
	        Z = fixZ - 0.95;
	        
	        if(strcmp(gun, "pesada", true) == 0)
	        {
	            if(pWeapons[playerid][0] == 0 || pWeapons[playerid][1] == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma arma pesada.");
	                return 1;
	            }
	            
	            if(HandgunObject[playerid] != -1)
	            {
	                DestroyObject(HandgunObject[playerid]);
					HandgunObject[playerid] = -1;
	            }
	            
	            if(Weapons[pWeapons[playerid][0]][wObjectId] != 0)
	            {
	                new id;
	                
					id = CreateDroppedWeapon(pWeapons[playerid][0], pWeapons[playerid][1], fixX, fixY, fixZ, 270.0, 0.0, 0.0);
					MoveObject(DroppedWeapons[id][dwObjectId], X, Y, Z, 4.1);
				}
				
				pWeapons[playerid][0] = pWeapons[playerid][1] = 0;
	        }
	        else if(strcmp(gun, "leve", true) == 0)
	        {
	            if(pWeapons[playerid][2] == 0 || pWeapons[playerid][3] == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma arma leve.");
	                return 1;
	            }
	            
	            if(Weapons[pWeapons[playerid][2]][wObjectId] != 0)
	            {
	                new id;

					id = CreateDroppedWeapon(pWeapons[playerid][2], pWeapons[playerid][3], fixX, fixY, fixZ, 270.0, 0.0, 0.0);
					MoveObject(DroppedWeapons[id][dwObjectId], X, Y, Z, 4.1);
				}
				
				pWeapons[playerid][2] = pWeapons[playerid][3] = 0;
	        }
	        else if(strcmp(gun, "branca", true) == 0)
	        {
	            if(pWeapons[playerid][4] == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma arma branca.");
	                return 1;
	            }
	            
	            if(Weapons[pWeapons[playerid][4]][wObjectId] != 0)
	            {
	            	new id;

					id = CreateDroppedWeapon(pWeapons[playerid][4], 1, fixX, fixY, fixZ, 270.0, 0.0, 0.0);
					MoveObject(DroppedWeapons[id][dwObjectId], X, Y, Z, 4.1);
				}
				
				pWeapons[playerid][4] = 0;
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /largararma [leve/pesada/branca]");
				return 1;
	        }
	        
	        pUpdate[playerid] |= UPDATE_WEAPONS;
	        ResetPlayerWeapons(playerid);
	        return 1;
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /largararma [leve/pesada/branca]");
		return 1;
	}
	

	if(strcmp(cmd, "/gangue", true) == 0)
	{
	    new gang_cmd[128];
	    
	    gang_cmd = strtok(cmdtext, idx);
	    
	    if(strlen(gang_cmd) > 0)
	    {
	        if(strcmp(gang_cmd, "criar", true) == 0)
	        {
                new gname[128], colour[128];
				new gcolour;

    	        gcolour = -1;
				colour = strtok(cmdtext, idx);

				if(strlen(colour) > 0)
				{
			    	for(new c = 0; c < sizeof GangColours; c++)
			    	{
				        if(strcmp(GangColours[c][gColourName], colour, true) == 0)
			    	    {
			    	        gcolour = c;
				            break;
				        }
				    }
				}

				if(gcolour == -1)
				{
			    	SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue criar [cor] [nome] - CORES DISPONÍVEIS:");
			    	SendClientMessage(playerid, COLOUR_GRAY, "branco, preto, vermelho, vermelho-escuro, verde, verde-claro, verde-escuro");
				    SendClientMessage(playerid, COLOUR_GRAY, "azul, azul-claro, azul-escuro, azul-ceu, navy, aqua, ciano, magenta, amarelo");
				    SendClientMessage(playerid, COLOUR_GRAY, "cinza, laranja, rosa, dourado, roxo, marrom");
	    	        return 1;
				}

				strmid(gname, cmdtext, idx, strlen(cmdtext));

				if(!strlen(gname))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue criar [cor] [nome]");
		            return 1;
				}

				if(!IsNotSpecialString(gname))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Use apenas os caracteres \"A-Z, a-z, 0-9, ', espaço ou _\" no nome da gangue.");
		            return 1;
				}

				CreateGang(gname, playerid, gcolour);
				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Gangue criada.");
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "excluir", true) == 0)
	        {
	            new gangid;

	            gangid = GetPlayerGang(playerid);

				if(gangid == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
        			return 1;
				}

				if(GetPlayerGangPost(playerid) != GANGPOST_LEADER)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
        			return 1;
				}

				DeleteGang(gangid);
				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Gangue excluida.");
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "convidar", true) == 0)
	        {
	            new tmp[128], string[128];
	            new plid, id, postid;
	            
				id = GetPlayerGang(playerid);
				
				if(id == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}
				
	            postid = GetPlayerGangPost(playerid);
	            
	            if(postid != GANGPOST_LEADER && postid != GANGPOST_SWORD_ARM && postid != GANGPOST_TOWER)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é líder, braco direito nem torre da sua gangue.");
	            	return 1;
				}
	            
	            tmp = strtok(cmdtext, idx);
	            
	            if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue convidar [id]");
				    return 1;
				}
				
				plid = strval(tmp);
				
				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador não conectado/logado.");
	            	return 1;
				}
				
				if(plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-convidar.");
				    return 1;
				}
				
				if(GetPlayerGang(plid) != 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador já está em uma gangue.");
				    return 1;
				}
				
				format(string, sizeof string, "Deseja entrar na gangue %s?", hGetString(GetGangFilePath(id), "Name"));
				
				if(!SendPlayerInvite(plid, playerid, id, INVITE_GANG, "Proposta de Gangue", string, "Sim", "Nao"))
					SendClientMessage(playerid, COLOUR_SKY_BLUE, "Proposta de gangue enviada.");
					
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "definircargo", true) == 0)
	        {
				new tmp[128], string[128];
				new plid, postid, id, gangid, gangpostid;

				gangid = GetPlayerGang(playerid);
				
				if(gangid == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}
				
				gangpostid = GetPlayerGangPost(playerid);
				
				if(gangpostid != GANGPOST_LEADER && gangpostid != GANGPOST_SWORD_ARM && gangpostid != GANGPOST_TOWER)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é líder, braco direito nem torre da sua gangue.");
	            	return 1;
				}
				
				tmp = strtok(cmdtext, idx);
				
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue definircargo [id] [cargo]");
				    return 1;
				}
				
				plid = strval(tmp);
				
				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador não conectado/logado.");
				    return 1;
				}
				
				if(plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode alterar o seu próprio cargo.");
				    return 1;
				}
				
				id = GetPlayerGang(plid);
				
				if(gangid != id)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na mesma gangue que o jogador.");
				    return 1;
				}
				
				postid = -1;
				strmid(tmp, cmdtext, idx, strlen(cmdtext));
				
				if(strlen(tmp) > 0)
				{
				    for(new p = 0; p < sizeof GangPosts; p++)
				    {
				        if(strcmp(GangPosts[p], tmp, true) == 0)
				        {
				            postid = p;
				            break;
				        }
				    }
				}
				
				if(postid < 1 || postid == GANGPOST_LEADER)
				{
                    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue definircargo [id] [cargo] - CARGOS DISPONÍVEIS:");
                    SendClientMessage(playerid, COLOUR_GRAY, "soldado, piloto, olheiro, fogueteiro, traficante, torre, braco direito");
				    return 1;
				}
				
				if(gangpostid != GANGPOST_LEADER)
				{
				    if(postid == GANGPOST_TOWER || postid == GANGPOST_SWORD_ARM)
				    {
				        SendClientMessage(playerid, COLOUR_GRAY, "Você não pode definir ninguém como braco direito ou torre.");
				        return 1;
				    }
				    
				    new xpostid;
				    
				    xpostid = GetPlayerGangPost(plid);
				    
					if(xpostid == GANGPOST_LEADER || xpostid == GANGPOST_SWORD_ARM || xpostid == GANGPOST_TOWER)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode alterar o cargo de um líder, torre ou braco direito.");
				        return 1;
					}
				}
				
				PutPlayerInGang(plid, id, postid);
				format(string, sizeof string, "Cargo de %s definido para %s.", PlayerName(plid), GangPosts[postid]);
				SendClientMessage(playerid, COLOUR_SKY_BLUE, string);
				format(string, sizeof string, "%s definiu seu cargo na gangue para %s.", PlayerName(playerid), GangPosts[postid]);
				SendClientMessage(plid, COLOUR_SKY_BLUE, string);
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "definirlider", true) == 0)
	        {
	            new tmp[128], string[128];
				new plid, id, gangid, gangpostid;

				gangid = GetPlayerGang(playerid);

				if(gangid == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}

				gangpostid = GetPlayerGangPost(playerid);

				if(gangpostid != GANGPOST_LEADER)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
	            	return 1;
				}

				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue definirlider [id]");
				    return 1;
				}

				plid = strval(tmp);

				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador não conectado/logado.");
				    return 1;
				}

				if(plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você já é o líder.");
				    return 1;
				}

				id = GetPlayerGang(plid);

				if(gangid != id)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na mesma gangue que o jogador.");
				    return 1;
				}
				
				PutPlayerInGang(plid, id, GANGPOST_LEADER);
				PutPlayerInGang(playerid, gangid, GANGPOST_SOLDIER);
				format(string, sizeof string, "Cargo de lider da gangue definido para %s, seu cargo foi definido para soldado.", PlayerName(plid));
				SendClientMessage(playerid, COLOUR_SKY_BLUE, string);
				SendClientMessage(plid, COLOUR_SKY_BLUE, "Você recebeu o cargo de líder da sua gangue.");
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "expulsar", true) == 0)
	        {
	            new tmp[128], string[128];
				new plid, id, gangid, gangpostid;
				
				gangid = GetPlayerGang(playerid);
				
				if(gangid == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
				    return 1;
				}
				
				gangpostid = GetPlayerGangPost(playerid);
				
				if(gangpostid != GANGPOST_LEADER)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
				    return 1;
				}
				
				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue expulsar [id]");
					return 1;
				}

				plid = strval(tmp);
				
				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador não conectado/logado.");
				    return 1;
				}

				if(plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-expulsar.");
				    return 1;
				}
				
				id = GetPlayerGang(plid);
				
				if(gangid != id)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na mesma gangue que o jogador.");
				    return 1;
				}
				
				RemovePlayerFromGang(plid);
				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Jogador expulso da gangue.");
				format(string, sizeof string, "Você foi expulso da sua gangue por %s.", PlayerName(playerid));
				SendClientMessage(plid, COLOUR_SKY_BLUE, string);
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "sair", true) == 0)
	        {
	            new id;
	            
	            id = GetPlayerGang(playerid);
	            
	            if(id == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}
				
				if(GetPlayerGangPost(playerid) == GANGPOST_LEADER)
	        	{
	            	SendClientMessage(playerid, COLOUR_GRAY, "Você é o líder da sua gangue.");
	            	return 1;
	        	}
	        	
	        	RemovePlayerFromGang(playerid);
	        	SendClientMessage(playerid, COLOUR_SKY_BLUE, "Você saiu da sua gangue.");
	        	return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "conquistar", true) == 0)
	        {
	            new gpath[128];
	            new zoneid, id;
	            
	            id = GetPlayerGang(playerid);
	            
				if(id == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}
				
				if(Zone[playerid] == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um território de gangue.");
	            	return 1;
				}
				
				zoneid = Zone[playerid];
	            gpath = GetGangFilePath(id);
	            
	            if(GetPlayerGangPost(playerid) != GANGPOST_LEADER)
	        	{
	            	SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
	            	return 1;
	        	}
	        	
	            if(hGetInt(gpath, "Conquered") != 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não tem permissão para conquistar territórios no momento.");
	                return 1;
	            }
	            
	            if(GetZoneDomain(zoneid) != 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Esse território já possui dono.");
	                return 1;
	            }
	            
	            SetZoneDomain(zoneid, id);
	            hSetInt(gpath, "Conquered", 1);
	            SendClientMessage(playerid, COLOUR_SKY_BLUE, "Território conquistado.");
	            return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "atacar", true) == 0)
	        {
	            new zoneid, id;

	            id = GetPlayerGang(playerid);
	            
	            if(id == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
	            }
	            
	            zoneid = GangAttack[playerid];
	            
	            if(zoneid == -1)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não pode começar um ataque.");
	            	return 1;
	            }
	            
	            
	        }
	        
	        else if(strcmp(gang_cmd, "renderse", true) == 0)
	        {
	            new zoneid, id;

	            id = GetPlayerGang(playerid);

				if(id == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}

				if(Zone[playerid] == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um território de gangue.");
	            	return 1;
				}

				zoneid = Zone[playerid];

	            if(GetPlayerGangPost(playerid) != GANGPOST_LEADER)
	        	{
	            	SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
	            	return 1;
	        	}
	        	
	        	if(GetZoneDomain(zoneid) == id)
	        	{
	        	    SetZoneDomain(zoneid, GangZones[zoneid][gzAttacker]);
	        	    FinishWar(zoneid);
	        	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "Ataque cancelado.");
	        	    return 1;
	        	}
	        	
				else if(GangZones[zoneid][gzAttacker] == id)
				{
				    FinishWar(zoneid);
				    SendClientMessage(playerid, COLOUR_SKY_BLUE, "Você perdeu o seu território por render-se.");
				    return 1;
				}
				
				SendClientMessage(playerid, COLOUR_GRAY, "Sua gangue não faz parte dessa guerra.");
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "nome", true) == 0)
	     	{
	     	    new gname[128];
				new postid, id;

				postid = GetPlayerGangPost(playerid);
	            id = GetPlayerGang(playerid);

    	        if(id == 0)
    	        {
    	            SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
    	            return 1;
	            }

    	        if(postid != GANGPOST_LEADER)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
	                return 1;
	            }

        	    strmid(gname, cmdtext, idx, strlen(cmdtext));
				if(!strlen(gname))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue nome [novo nome]");
		            return 1;
				}

				if(!IsNotSpecialString(gname))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Use apenas os caracteres \"A-Z, a-z, 0-9, ', espaço ou _\" no nome da gangue.");
	       			return 1;
				}

				hSetString(GetGangFilePath(id), "Name", gname);
				for(new n = 0; n < MAX_SLOTS; n++)
				{
				    if(IsPlayerConnected(n) && IsPlayerLogged(n) && GetZoneDomain(Zone[n]) == id)
						UpdatePlayerZoneText(n);
				}

				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Nome da gangue alterado.");
   				return 1;
     		}

	    	else if(strcmp(gang_cmd, "cor", true) == 0)
     		{
	    	    new colour[128];
				new postid, id, gcolour;

	           	gcolour = -1;
				colour = strtok(cmdtext, idx);
				postid = GetPlayerGangPost(playerid);
	            id = GetPlayerGang(playerid);

	            if(id == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	                return 1;
	            }

	            if(postid != GANGPOST_LEADER)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
	                return 1;
	            }

				if(strlen(colour) > 0)
				{
		    		for(new c = 0; c < sizeof GangColours; c++)
		    		{
			        	if(strcmp(GangColours[c][gColourName], colour, true) == 0)
	    	   	 		{
		    		        gcolour = c;
				            break;
				        }
				    }
				}

				if(gcolour == -1)
				{
				   	SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue cor [nova cor] - CORES DISPONÍVEIS:");
				   	SendClientMessage(playerid, COLOUR_GRAY, "branco, preto, vermelho, vermelho-escuro, verde, verde-claro, verde-escuro");
				    SendClientMessage(playerid, COLOUR_GRAY, "azul, azul-claro, azul-escuro, azul-ceu, navy, aqua, ciano, magenta, amarelo");
				    SendClientMessage(playerid, COLOUR_GRAY, "cinza, laranja, rosa, dourado, roxo, marrom");
		            return 1;
				}

				hSetInt(GetGangFilePath(id), "Colour", gcolour);
				for(new z = 0; z < sizeof GangZones; z++)
				{
				    if(GetZoneDomain(z) == id)
				        UpdateGangZone(z);
				}

				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Cor da gangue alterada.");
   				return 1;
     		}
	    }
	    
     	
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "criar, excluir, convidar, definircargo, definirlider, expulsar, sair,");
	    SendClientMessage(playerid, COLOUR_GRAY, "conquistar, renderse, nome, cor");
	    return 1;
	}
	
	if(strcmp(cmd, "/casa", true) == 0)
	{
	    new house_cmd[128];
	    
	    house_cmd = strtok(cmdtext, idx);
	    
	    if(strlen(house_cmd) > 0)
	    {
	        if(strcmp(house_cmd, "comprar", true) == 0)
			{
			    new hpath[128], string[128];
				new value, onsale, houseid, ownerid;
			    
			    houseid = House[playerid];
			    
			    if(houseid == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma casa.");
				    return 1;
				}
				
				hpath = GetHouseFilePath(houseid);
				
				if(hGetInt(hpath, "Deleted") == 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma casa.");
				    return 1;
				}
				
				onsale = hGetInt(hpath, "OnSale");
				
				if(!onsale)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Essa casa não está a venda.");
				    return 1;
				}
				
				value = hGetInt(hpath, "Value");
				
				if(GetPlayerMoneyEx(playerid) < value)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro para comprar.");
				    return 1;
				}
				
				if(onsale == 1)
				{
				    ownerid = GetPlayerId(hGetString(hpath, "Owner"));
				    
				    if(ownerid == INVALID_PLAYER_ID)
				    {
				        SendClientMessage(playerid, COLOUR_GRAY, "O proprietário deve estar conectado para você efetuar a compra.");
				    	return 1;
				    }
				    
				    format(string, sizeof string, "Sua casa N°%d foi comprada por %s.", houseid + 1, PlayerName(playerid));
				    SendClientMessage(ownerid, COLOUR_ROYAL_BLUE, string);
				    
				    if(GetPlayerHouse(ownerid) == houseid)
						RemovePlayerFromHouse(ownerid);
				}
				
				hSetString(hpath, "Owner", PlayerName(playerid));
				GivePlayerMoneyEx(playerid, -value);
				PutPlayerOnHouse(playerid, houseid);
				PutHouseOnSale(houseid, 0);
				SendClientMessage(playerid, COLOUR_ROYAL_BLUE, "Casa adquirida, você agora irá nascer aqui.");
				return 1;
			}

			else if(strcmp(house_cmd, "vender", true) == 0)
			{
			    new hpath[128], string[128];
			    new houseid, onsale;

                houseid = House[playerid];
                
			    if(houseid == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma casa.");
				    return 1;
				}

				hpath = GetHouseFilePath(houseid);

				if(hGetInt(hpath, "Deleted") == 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma casa.");
				    return 1;
				}

				if(strcmp(PlayerName(playerid), hGetString(hpath, "Owner"), true))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário da casa.");
				    return 1;
				}

				onsale = hGetInt(hpath, "OnSale");
				
				if(!onsale)
				{
			    	
			    	format(string, sizeof string, "Casa N°%d colocada a venda.", houseid + 1);
					SendClientMessage(playerid, COLOUR_ROYAL_BLUE, string);
				}
				
				else
				{
				    format(string, sizeof string, "Casa N°%d retirada de venda.", houseid + 1);
					SendClientMessage(playerid, COLOUR_ROYAL_BLUE, string);
				}
				
				PutHouseOnSale(houseid, !onsale);
				return 1;
			}
			
			else if(strcmp(house_cmd, "nascer", true) == 0)
			{
			    new hpath[128];
			    new houseid;
			    
			    houseid = House[playerid];
			    
			    if(houseid == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma casa.");
				    return 1;
				}

				hpath = GetHouseFilePath(houseid);

				if(hGetInt(hpath, "Deleted") == 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma casa.");
				    return 1;
				}
				
				if(strcmp(PlayerName(playerid), hGetString(hpath, "Owner"), true))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário da casa.");
				    return 1;
				}
				
				PutPlayerOnHouse(playerid, houseid);
				SendClientMessage(playerid, COLOUR_ROYAL_BLUE, "Você agora irá nascer aqui.");
				return 1;
			}
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /casa [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "comprar, vender, nascer");
	    return 1;
	}
	
	if(strcmp(cmd, "/veiculo", true) == 0)
	{
	    new vehicle_cmd[128];

	    vehicle_cmd = strtok(cmdtext, idx);

	    if(strlen(vehicle_cmd) > 0)
	    {
			if(strcmp(vehicle_cmd, "comprar", true) == 0)
			{
			    return 1;
			}
			
			else if(strcmp(vehicle_cmd, "vender", true) == 0)
			{
				return 1;
			}
			
			else if(strcmp(vehicle_cmd, "estacionar", true) == 0)
			{
				new vehid;
				new Float:X, Float:Y, Float:Z, Float:A;
				
				if(!IsPlayerInAnyVehicle(playerid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
				    return 1;
				}
				
				vehid = GetPlayerVehicleID(playerid);
				
				if(IsServerVehicle(vehid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode estacionar um veículo do servidor.");
				    return 1;
				}
				
				if(strcmp(PlayerName(playerid), hGetString(GetVehicleFilePath(vehid), "Owner"), true))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário do veículo.");
				    return 1;
				}
				
				GetVehiclePos(vehid, X, Y, Z);
				GetVehicleZAngle(vehid, A);
				SaveVehiclePos(vehid, X, Y, Z, A);
				SendClientMessage(playerid, COLOUR_GREEN, "Veículo estacionado.");
				return 1;
			}
	    }

	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /veiculo [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "comprar, vender, estacionar");
	    return 1;
	}
	
	if(strcmp(cmd, "/oficina", true) == 0)
	{
	    new workshop_cmd[128];
	    new vehid;
	    
	    if(Area[playerid] != AREA_CUSTOM_SHOP)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma oficina.");
		    return 1;
	    }
	    
	    workshop_cmd = strtok(cmdtext, idx);
	    
	    if(strlen(workshop_cmd) > 0)
	    {
	    	if(strcmp(workshop_cmd, "consertar", true) == 0)
	    	{
	    	    new string[128];
	    	    new pay;
	    	    new Float:health;
	    	    
	    	    if(VFrozenFlags[playerid] & VFROZEN_REPAIR)
	    	    {
	    	        SendClientMessage(playerid, COLOUR_GRAY, "Você já está consertando um veículo.");
		            return 1;
	    	    }
	    	    
	    	    if(!IsPlayerInAnyVehicle(playerid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
		            return 1;
		        }
		        
				vehid = GetPlayerVehicleID(playerid);
		        GetVehicleHealth(vehid, health);
		        
		        if(health >= 1000.0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Esse veículo já está íntegro.");
		            return 1;
		        }
		        
		        pay = floatround(1000.0 - health) / 2;
		        
		        if(GetPlayerMoneyEx(playerid) < pay)
		        {
		            format(string, sizeof string, "Você não possui dinheiro. Custo: $%d,00 dólares.", pay);
		    		SendClientMessage(playerid, COLOUR_GRAY, string);
		    		return 1;
		        }

                format(string, sizeof string, "Deseja consertar seu veiculo?\nValor:$%d,00 dólares", pay);
                SendPlayerInvite(playerid, INVALID_PLAYER_ID, (pay << 16) | (vehid & 0xFFFF), INVITE_REPAIR, "Proposta de conserto", string, "Sim", "Nao");
	    	    return 1;
	    	}
	    
	    	else if(strcmp(workshop_cmd, "pintar", true) == 0)
	    	{
	    	    if(VFrozenFlags[playerid] & VFROZEN_PAINT)
	    	    {
	    	        SendClientMessage(playerid, COLOUR_GRAY, "Você já está pintando um veículo.");
	    	        return 1;
	    	    }

		        if(!IsPlayerInAnyVehicle(playerid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
		            return 1;
		        }

		        vehid = GetPlayerVehicleID(playerid);

		        KillTimer(PaintTimer[playerid]);
		        VFrozenFlags[playerid] |= VFROZEN_PAINT;
		        TogglePlayerControllable(playerid, false);
		        PaintTimer[playerid] = SetTimerEx("Painting", 100, true, "dd", playerid, vehid);
		        PaintStage[playerid] = 0;
		        PaintColours[playerid] = GetVehicleColoursEncoded(vehid);
		        TextDrawShowForPlayer(playerid, tdarrows);
		        ShowTextForPlayer(playerid, "Pressione ~g~Espaco ~w~para concluir.", 318.0, 309.0, COLOUR_WHITE, 1, 0.4, 1.7, 1, 2, 5000);
		        return 1;
		    }
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /oficina [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "consertar, pintar");
	    return 1;
	}
	
	if(strcmp(cmd, "/abastecer", true) == 0)
	{
	    new tmp[128], string[128];
	    new pay, vehid, fuel;
	    new Text:tdfuel;
	    
	    if(Area[playerid] != AREA_GAS_STATION)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um posto.");
		    return 1;
		}
		
        if(VFrozenFlags[playerid] & VFROZEN_FUEL)
   	    {
          	SendClientMessage(playerid, COLOUR_GRAY, "Você já está abastecendo um veículo.");
 	        return 1;
   	    }
	    	    
		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
		    return 1;
		}
		
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /abastecer [valor a pagar ou completar]");
		    return 1;
		}
		
		vehid = GetPlayerVehicleID(playerid);
		fuel = GetVehicleFuel(vehid);
		
		if(fuel == 100)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Esse veículo já está com o tanque completo.");
		    return 1;
		}
		
		if(fuel > 100)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Esse veículo não pode ser abastecido.");
		    return 1;
		}
		
		if(strcmp(tmp, "completar", true) == 0)
			pay = 100 * FUEL_COST;

		else
		    pay = strval(tmp);

        if(pay < FUEL_COST)
		{
		    format(string, sizeof string, "Valor acima de $%d,00 dólares.", FUEL_COST);
            SendClientMessage(playerid, COLOUR_GRAY, string);
		    return 1;
		}
		
		if((pay / FUEL_COST) + fuel > 100)
		    pay = (100 - fuel) * FUEL_COST;
		    
		if(GetPlayerMoneyEx(playerid) < pay)
		{
			format(string, sizeof string, "Você não possui dinheiro. Custo: $%d,00 dólares.", pay);
		    SendClientMessage(playerid, COLOUR_GRAY, string);
		    return 1;
		}
		
		tdfuel = TextDrawCreate(21.0, 125.0, " ");
		TextDrawAlignment(tdfuel, 0);
		TextDrawFont(tdfuel, 1);
		TextDrawLetterSize(tdfuel, 0.5, 1.5);
		TextDrawColour(tdfuel, COLOUR_WHITE);
		TextDrawSetProportional(tdfuel, 1);
		TextDrawSetShadow(tdfuel, 1);
		
		TextDrawShowForPlayer(playerid, tdfuel);
		VFrozenFlags[playerid] |= VFROZEN_FUEL;
		TogglePlayerControllable(playerid, false);
		GivePlayerMoneyEx(playerid, -pay);
		SetTimerEx("Fueling", 300, false, "ddddd", playerid, vehid, fuel, pay / FUEL_COST, _:tdfuel);
		return 1;
	}
	
	if(strcmp(cmd, "/radio", true) == 0)
	{
	    new radio_cmd[128];

	    radio_cmd = strtok(cmdtext, idx);

	    if(strlen(radio_cmd) > 0)
	    {
	    	if(strcmp(radio_cmd, "sintonizar", true) == 0)
	    	{
	    	    new string[128];
	    	    new station;
	    	    
	    	    station = strval(strtok(cmdtext, idx));
	    	    
	    	    if(station < 1000 || station > 9999)
	    	    {
	    	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /radio sintonizar [1000~9999]");
	    	        return 1;
	    	    }
	    	    
	    	    if(Radio[playerid] == station)
	    	    {
	    	        SendClientMessage(playerid, COLOUR_GRAY, "Seu rádio já está sintonizado nessa estação.");
	    	        return 1;
	    	    }
	    	    
	    	    Radio[playerid] = station;
	    	    format(string, sizeof string, "[Radio] Radio sintonizado na estação %d.", station);
	    	    SendClientMessage(playerid, COLOUR_DARK_GOLD, string);
	    	    return 1;
	    	}
	    	
	    	else if(strcmp(radio_cmd, "falar", true) == 0)
	    	{
	    	    new text[128];

                if(Radio[playerid] == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Seu rádio está desligado.");
	    	        return 1;
				}

				strmid(text, cmdtext, idx, strlen(cmdtext));
				Speak(playerid, text);
	    	    return 1;
	    	}
	    	
	    	else if(strcmp(radio_cmd, "estacao", true) == 0)
	    	{
	    	    new string[128];
	    	    
                if(Radio[playerid] == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Seu rádio está desligado.");
	    	        return 1;
				}
				
				format(string, sizeof string, "[Radio] Atual estação: %d", Radio[playerid]);
				SendClientMessage(playerid, COLOUR_DARK_GOLD, string);
	    	    return 1;
	    	}
	    	
	    	else if(strcmp(radio_cmd, "desligar", true) == 0)
	    	{
				if(Radio[playerid] == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Seu rádio já está desligado.");
	    	        return 1;
				}

				Radio[playerid] = -1;
				SendClientMessage(playerid, COLOUR_DARK_GOLD, "[Radio] Radio desligado!");
	    	    return 1;
	    	}
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /radio [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "sintonizar, falar, estacao, desligar");
	    return 1;
	}
	
	if(strcmp(cmd, "/usarskin", true) == 0)
	{
	    new tmp[128];
	    
	    tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
 		{
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /usarskin [pessoal/trabalho]");
	        return 1;
	    }
	    
	    if(strcmp(tmp, "pessoal", true) == 0)
	    {
	        SetPlayerSkin(playerid, hGetInt(GetPlayerXFilePath(playerid), "Skin"));
	        SendClientMessage(playerid, COLOUR_GREEN, "Skin pessoal adquirida.");
	        return 1;
	    }
	    
	    else if(strcmp(tmp, "trabalho", true) == 0)
	    {
	        new rand, com, aux;
	        
	        if(pjob == DESEMPREGADO)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você está desempregado no momento...");
	            return 1;
	        }
	        
	        aux = -1;
	        com = Company[playerid];
	        
	        if(com == -1)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você está na sua agência de trabalho.");
	            return 1;
	        }
	        
	        if(IsPlayerCop(playerid))
	        {
	            aux = pjob;
	            pjob = POLICIAL_MILITAR;
			}
			
	        if(Companies[com][cJob] != pjob)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você está na sua agência de trabalho.");
	            return 1;
	        }
	        
	        if(aux != -1)
	            pjob = aux;
	            
	        if(Jobs[pjob][jobSkins][0] == 0)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Sua profissão não possui uma skin específica.");
	            return 1;
	        }
			
			do
				rand = random(4);
			while(Jobs[pjob][jobSkins][rand] == 0);
			
			SetPlayerSkin(playerid, Jobs[pjob][jobSkins][rand]);
			SendClientMessage(playerid, COLOUR_GREEN, "Skin de trabalho adquirida.");
			return 1;
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /usarskin [pessoal/trabalho]");
	    return 1;
	}
	
	if(strcmp(cmd, "/assinar", true) == 0)
	{
	    new xpath[128], c, jobid, habt, habn, haba;
	    
	    c = Company[playerid];
	    
	    if(c == 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma empresa para assinar um contrato.");
	        return 1;
	    }
	    
	    SavePlayerCounter(playerid);
		
		if(hGetInt(GetPlayerKFilePath(playerid), "JobCounter") > 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Seu prazo de contrato com a outra empresa ainda não terminou.");
	        return 1;
		}
		
		xpath = GetPlayerXFilePath(playerid);
	    jobid = Companies[c][cJob];
	    
	    decode_player_habs(hGetInt(xpath, "Hab"), habt, habn, haba);
	    
		if(habt == 0 && Jobs[jobid][jobHabT] == 1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve ter carteira de habilitação terrestre para assinar um contrato com essa empresa.");
	        return 1;
		}
		
		if(habn == 0 && Jobs[jobid][jobHabN] == 1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve ter carteira de habilitação naútica para assinar um contrato com essa empresa.");
	        return 1;
		}
		
		if(haba == 0 && Jobs[jobid][jobHabA] == 1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve ter carteira de habilitação aérea para assinar um contrato com essa empresa.");
	        return 1;
		}
		
		if(hGetInt(xpath, "Level") < Jobs[jobid][jobLevel])
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não tem experiência suficiente para assinar um contrato com essa empresa.");
	        return 1;
		}
		
		hSetInt(GetPlayerKFilePath(playerid), "JobCounter", 720);
		hSetInt(xpath, "Job", jobid);
		ChangePlayerJob(playerid, jobid);
		SendClientMessage(playerid, COLOUR_GREEN, "Contrato assinado! Você só poderá mudar de profissão novamente após 720 horas (minutos reais).");
		return 1;
	}

	if(strcmp(cmd, "/emprego", true) == 0)
	{
	    new listid, cmds, results;
	    new string[128];
	    new bool:sent;
	    
	    listid = strval(strtok(cmdtext, idx));

		if(listid <= 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Lista invalida, as listas iniciam pelo ID 1.");
		    return 1;
		}
		
  		cmds = COMMANDS_PER_LIST * (listid - 1);
  		results = 0;
		sent = false;
	    
		for(new j = 0; j < sizeof JobCommands; j++)
		{
		    for(new jid = 0; jid < 6; jid++)
		    {
		        if(pjob == JobCommands[j][jJobs][jid])
		        {
			    	if(results >= cmds)
			    	{
			    	    if(!sent)
			    	    {
			    	        format(string, sizeof string, "Comandos de %s - [ Parte %s ]:", Jobs[pjob][jobName], NumericToRoman(listid));
			    	        SendClientMessage(playerid, COLOUR_WHITE, string);
			    	        sent = true;
			    	    }
			    	    
						format(string, sizeof string, "%s - %s", JobCommands[j][jCmd], JobCommands[j][jDescription]);
						SendClientMessage(playerid, Jobs[pjob][jobColour], string);
					}

					results++;
					break;
				}
			}
			
			if(results >= cmds + COMMANDS_PER_LIST)
   				break;
		}
        
		if(results <= cmds)
		{
			
			format(string, sizeof string, "USO: /emprego [1-%d]", (results / COMMANDS_PER_LIST) + 1);
			SendClientMessage(playerid, COLOUR_GRAY, string);
		}
		
		else if(results - cmds == COMMANDS_PER_LIST)
		{
		    format(string, sizeof string, "Para ver a próxima lista digite: /emprego %d", listid + 1);
		    SendClientMessage(playerid, COLOUR_WHITE, string);
		}
		
		return 1;
	}
	
	if(strcmp(cmd, "/item", true) == 0)
	{
	    new item_cmd[128];

	    item_cmd = strtok(cmdtext, idx);

	    if(strlen(item_cmd) > 0)
	    {
	        if(strcmp(item_cmd, "comprar", true) == 0)
	        {
	            new item[128], itemid = -1, itens;
	            
	            if(GetPlayerInt(playerid) != INT_24/7_SHOP)
	    		{
	        		SendClientMessage(playerid, COLOUR_GRAY, "Você não está na loja de itens pessoais!");
	        		return 1;
	    		}
	    		
				item = strtok(cmdtext, idx);

				for(new it = 0; it < sizeof Itens; it++)
				{
		    		if(strcmp(Itens[it][itemName], item, true) == 0)
		    		{
		    		    itemid = it;
		    		    break;
		    		}
				}
		
		        if(itemid == -1)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "USO: /item comprar [item]");
		    		return 1;
				}

				itens = GetPlayerItens(playerid);

				if(itens & itemid)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você já possui este item!");
		    		return 1;
				}

				if(GetPlayerMoneyEx(playerid) < Itens[itemid][itemValue])
				{
		    		new string[128];
		    		format(string, sizeof string, "Você não possui dinheiro para adquirir este item [Valor: $%d,00 dólares]", Itens[itemid][itemValue]);
		    		SendClientMessage(playerid, COLOUR_GRAY, string);
					return 1;
				}

				GivePlayerMoneyEx(playerid, -Itens[itemid][itemValue]);
				hSetInt(GetPlayerXFilePath(playerid), "Itens", itens | itemid);

				new string[128];
				format(string, sizeof string, "Item adquirido [Item: %s] [Valor: $%d,00 dólares]", Itens[itemid][itemName], Itens[itemid][itemValue]);
				SendClientMessage(playerid, COLOUR_GREEN, string);
				return 1;
	        }
	        
	        else if(strcmp(item_cmd, "vender", true) == 0)
	        {
	            if(GetPlayerInt(playerid) != INT_24/7_SHOP)
	    		{
	        		SendClientMessage(playerid, COLOUR_GRAY, "Você não está na loja de itens pessoais!");
	        		return 1;
	    		}
	    		
	    		new item[128], itemid = -1, itens;

				item = strtok(cmdtext, idx);

				for(new it = 0; it < sizeof Itens; it++)
				{
				    if(strcmp(Itens[it][itemName], item, true) == 0)
				    {
				        itemid = it;
		    		    break;
		    		}
				}

				if(itemid == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /item vender [item]");
				    return 1;
				}

				itens = GetPlayerItens(playerid);

				if(!(itens & itemid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui este item!");
				    return 1;
				}

				hSetInt(GetPlayerXFilePath(playerid), "Itens", itens & (~itemid));
				GivePlayerMoneyEx(playerid, Itens[itemid][itemValue] / 2);

				new string[128];
				format(string, sizeof string, "Item vendido [Item: %s] por $%d,00 dólares.", Itens[itemid][itemName], Itens[itemid][itemValue] / 2);
				SendClientMessage(playerid, COLOUR_GREEN, string);
        		return 1;
	        }
	        
	        else if(strcmp(item_cmd, "ceder", true) == 0)
	        {
	            new item[128], plid, itemid = -1, itens, plid_itens;
	            
				item = strtok(cmdtext, idx);

				if(!strlen(item))
				{
					SendClientMessage(playerid, COLOUR_GRAY, "USO: /item ceder [id] [item]");
		    		return 1;
				}

				plid = strval(item);
		
				if(!IsPlayerConnected(plid))
				{
					SendClientMessage(playerid, COLOUR_GRAY, "Jogador não conectado/logado.");
		    		return 1;
				}

				new Float:X1, Float:Y1, Float:Z1, Float:X2, Float:Y2, Float:Z2;
				
				GetPlayerPos(playerid, X1, Y1, Z1);
				GetPlayerPos(plid, X2, Y2, Z2);

				if(GetDistance(X1, Y1, Z1, X2, Y2, Z2) > 15.0)
				{
					SendClientMessage(playerid, COLOUR_GRAY, "Você está muito longe, chegue mais perto do outro jogador.");
					return 1;
				}

				item = strtok(cmdtext, idx);

				for(new it = 0; it < sizeof Itens; it++)
				{
				    if(strcmp(Itens[it][itemName], item, true) == 0)
				    {
				        itemid = it;
				        break;
				    }
				}

				if(itemid == -1)
				{
					SendClientMessage(playerid, COLOUR_GRAY, "USO: /item ceder [id] [item]");
				    return 1;
				}

				itens = GetPlayerItens(playerid);

				if(!(itens & itemid))
				{
					SendClientMessage(playerid, COLOUR_GRAY, "Você não possui este item!");
		    		return 1;
				}

				plid_itens = GetPlayerItens(plid);

				if(plid_itens & itemid)
				{
					SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador já possui este item!");
					return 1;
				}

				hSetInt(GetPlayerXFilePath(playerid), "Itens", itens & (~itemid));
				hSetInt(GetPlayerXFilePath(plid), "Itens", plid_itens | itemid);

				new string[128];
				format(string, sizeof string, "Item cedido [Item: %s] para %s.", Itens[itemid][itemName], PlayerName(plid));
				SendClientMessage(playerid, COLOUR_GREEN, string);
				format(string, sizeof string, "%s lhe cedeu um item [Item: %s]", PlayerName(playerid), Itens[itemid][itemName]);
				SendClientMessage(plid, COLOUR_GREEN, string);
		        return 1;
	        }
		}

		SendClientMessage(playerid, COLOUR_GRAY, "USO: /item [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "comprar, vender, ceder");
	    return 1;
	}
	
	if(strcmp(cmd, "/banco", true) == 0)
	{
	    if(GetPlayerInt(playerid) != INT_BANK)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um Banco.");
	        return 1;
		}
		
		new cash_desk;
		
		cash_desk = random(sizeof CashDesks);

		SetPlayerPos(playerid, CashDesks[cash_desk][0], CashDesks[cash_desk][1], CashDesks[cash_desk][2]);
		SetPlayerFacingAngle(playerid, CashDesks[cash_desk][3]);
		SetCameraBehindPlayer(playerid);
		ShowMenuForPlayer(Bank[0], playerid);
  		TogglePlayerControllable(playerid, false);
        return 1;
	}
	
	if(strcmp(cmd, "/votekick", true) == 0)
	{
	    if(VoteKickPlayer != -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Já há uma votação em andamento, aguarde...");
		    return 1;
	    }
	    
	    PlayerCount = 0;
	    
	    for(new i = 0; i < MAX_SLOTS; i++)
	    {
	        if(IsPlayerConnected(i))
	            PlayerCount++;
	    }
	    
	    PlayerCount /= 2;
	    
	    if(PlayerCount < 2)
	    {
	        PlayerCount = 0;
	        SendClientMessage(playerid, COLOUR_GRAY, "É necessário mais jogadores para iniciar uma votação...");
		    return 1;
	    }
	    
	    new tmp[128];
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /votekick [id] [motivo]");
		    return 1;
		}
		
		new plid = strval(tmp);
		
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador não conectado/logado.");
		    return 1;
		}
		
		new motivo[128];
		
		if(plid < 10)
			strmid(motivo, cmdtext, 12, strlen(cmdtext));
			
		else if(plid < 100)
			strmid(motivo, cmdtext, 13, strlen(cmdtext));
			
		else
			strmid(motivo, cmdtext, 14, strlen(cmdtext));
		
		if(!strlen(motivo))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /votekick [id] [motivo]");
		    return 1;
		}
		
		new string[128];

		format(string, sizeof string, "[VOTEKICK] %s iniciou uma votação para kickar %s [Votos necessários: %d]", PlayerName(playerid), PlayerName(plid), PlayerCount);
		SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
		format(string, sizeof string, "[VOTEKICK] Motivo: %s", motivo);
		SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
		SendClientMessageToAll(COLOUR_WHITE, "Use /votar para votar.");

		VoteKickPlayer = plid;
		VoteKickTimer = SetTimer("VoteKick", 30000, false);
		Votes = 1;
		Voted[playerid] = 1;
		
		SendClientMessage(playerid, COLOUR_GREEN, "Seu voto já foi dado, agora somente aguarde...");
		return 1;
	}
	
	if(strcmp(cmd, "/votar", true) == 0)
	{
	    if(VoteKickPlayer == -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Não há nenhuma votação em andamento.");
		    return 1;
	    }
	    
	    if(Voted[playerid] == 1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você já votou, aguarde o fim da votação...");
		    return 1;
	    }
	    
	    Voted[playerid] = 1;
	    Votes++;
	    
	    new string[128];
	    
	    format(string, sizeof string, "[VOTEKICK] Votos: %d/%d", Votes, PlayerCount);
	    SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
	    
	    if(Votes >= PlayerCount)
	    {
			format(string, sizeof string, "[VOTEKICK] Votação para kickar %s sucedida, jogador kickado.", PlayerName(VoteKickPlayer));
			SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
			Kick(VoteKickPlayer);
			Votes = 0;
			VoteKickPlayer = -1;
			
			for(new i = 0; i < MAX_SLOTS; i++)
	    		Voted[i] = 0;
			
			PlayerCount = 0;
			KillTimer(VoteKickTimer);
	    }
	    
	    return 1;
	}
	
	if(strcmp(cmd, "/a", true) == 0)
	{
		new msg[256], colour;
		strmid(msg, cmdtext, 3, strlen(cmdtext));
		
		if(!strlen(msg))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /a [mensagem]");
		    return 1;
		}
		
		if(IsPlayerAdmin(playerid))
		{
		    format(msg, sizeof msg, "[ADMIN CHAT] %s: %s", PlayerName(playerid), msg);
		    colour = COLOUR_ADMIN;
		}
		else
		{
		    format(msg, sizeof msg, "[ADMIN HELP] %s: %s", PlayerName(playerid), msg);
		    colour = COLOUR_GOLD;

			SendClientMessage(playerid, colour, msg);
		}
		
		for(new n = 0; n < MAX_SLOTS; n++)
		{
		    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerAdmin(n))
			{
		        SendClientMessage(n, colour, msg);
		    }
		}
		
		return 1;
	}
	
	if(strcmp(cmd, "/admin", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não é administrador!");
	        return 1;
	    }
	    
	    new adm_cmd[128], adm_tmp[128];
	    adm_cmd = strtok(cmdtext, idx);
	    
		if(!strlen(adm_cmd))
		    return 1;
		
		if(strcmp(adm_cmd, "say", true) == 0)
	    {
	        strmid(adm_tmp, cmdtext, idx, strlen(cmdtext));
	        
	        if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin say [mensagem]");
			    return 1;
			}
			
			new msg[128];
	        format(msg, sizeof msg, "* (Admin) %s: %s", PlayerName(playerid), adm_tmp);
	        SendClientMessageToAll(COLOUR_ADMIN, msg);
	        return 1;
	    }
	    
	    if(strcmp(adm_cmd, "report", true) == 0)
	    {
	        DisableReport[playerid] = !DisableReport[playerid];
	        
			if(DisableReport[playerid])
			    ShowTextForPlayer(playerid, "Report mode [OFF].", 318.0, 309.0, COLOUR_RED, 1, 0.5, 1.5, 1, 2, 1000);
			else
			    ShowTextForPlayer(playerid, "Report mode [ON].", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 1000);

			return 1;
	    }
	    
	    else if(strcmp(adm_cmd, "banir", true) == 0)
	    {
	        new plid;
	        
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin banir [id/nome] [motivo]");
			    return 1;
			}
			
			if(IsNumeric(adm_tmp))
				plid = strval(adm_tmp);

			else
			{
			    plid = INVALID_PLAYER_ID;
			    
			    for(new n = 0; n < MAX_SLOTS; n++)
			    {
			        if(IsPlayerConnected(n) && strcmp(PlayerName(n), adm_tmp, true) == 0)
			            plid = n;
			    }
			}
			
			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			strmid(adm_tmp, cmdtext, idx, strlen(cmdtext));
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin banir [id] [motivo]");
			    return 1;
			}
			
			RemovePlayerCellPhone(plid);
			BanPlayer(plid, adm_tmp);
	    }
	    
	    else if(strcmp(adm_cmd, "desbanir", true) == 0)
	    {
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin desbanir [usuario]");
			    return 1;
			}
			
			UnbanPlayer(adm_tmp);
	    }
	    
	    else if(strcmp(adm_cmd, "kickar", true) == 0)
	    {
	        new plid;
	        
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin kickar [id]");
			    return 1;
			}
			
			plid = strval(adm_tmp);
			
			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			Kick(strval(adm_tmp));
	    }
	    
	    else if(strcmp(adm_cmd, "arma", true) == 0)
	    {
	        new plid, weaponid, ammo, res;
	        
            adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin arma [id] [id da arma] [municao]");
			    return 1;
			}
			
			plid = strval(adm_tmp);
			
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin arma [id] [id da arma] [municao]");
			    return 1;
			}

			weaponid = strval(adm_tmp);
			
			if(weaponid < 1 || IsForbiddenWeapon(weaponid) || weaponid > 46)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Arma inválida.");
			    return 1;
			}
		
		    adm_tmp = strtok(cmdtext, idx);
		    
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin arma [id] [id da arma] [municao]");
			    return 1;
			}

			ammo = strval(adm_tmp);
			
			if(ammo < 0)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Municao acima de 0");
			    return 1;
			}

			res = GivePlayerWeaponEx(plid, weaponid, ammo);
			
			if(res == 1)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Essa arma já possui o número máximo de cartuchos.");
			    return 1;
			}
			
			if(res == 2)
			{
		    	SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador já possui uma arma pesada.");
			    return 1;
			}
			
			if(res == 3)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador já possui uma arma leve.");
			    return 1;
			}
			
			if(res == 4)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador já possui uma arma branca.");
			    return 1;
			}
	    }
	    
	    else if(strcmp(adm_cmd, "ir", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);
	        
	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin ir [id]");
	            return 1;
	        }
	        
	        plid = strval(adm_tmp);
	        
	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }
	        
	        new Float:x, Float:y, Float:z;
	        GetPlayerPos(plid, x, y, z);
	        
	        if(!IsPlayerInAnyVehicle(playerid) || GetPlayerInterior(plid) != 0)
	        	SetPlayerPos(playerid, x, y, z);
	        	
			else
			    SetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);
			    
	        SetPlayerInterior(playerid, GetPlayerInterior(plid));
	        SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(plid));
	        Enter[playerid] = Enter[plid];
	        House[playerid] = House[plid];
	        Door[playerid] = -1;
	    }
	    
	    else if(strcmp(adm_cmd, "trazer", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin trazer [id]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

	        new Float:x, Float:y, Float:z;
	        GetPlayerPos(playerid, x, y, z);
	        
	        if(!IsPlayerInAnyVehicle(plid) || GetPlayerInterior(playerid) != 0)
	        	SetPlayerPos(plid, x, y, z);

			else
			    SetVehiclePos(GetPlayerVehicleID(plid), x, y, z);
			    
	        SetPlayerInterior(plid, GetPlayerInterior(playerid));
	        SetPlayerVirtualWorld(plid, GetPlayerVirtualWorld(playerid));
	        Enter[plid] = Enter[playerid];
	        House[plid] = House[playerid];
	        Door[plid] = -1;
	    }
	    
	    else if(strcmp(adm_cmd, "empregar", true) == 0)
	    {
	        new plid, jobid = 0;
	        
	        adm_tmp = strtok(cmdtext, idx);
	        
	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin empregar [id] [emprego]");
	            return 1;
	        }

	        plid = strval(adm_tmp);
	        
	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }
	        
	        strmid(adm_tmp, cmdtext, idx, strlen(cmdtext));
			
			if(IsNumeric(adm_tmp))
			{
			    jobid = strval(adm_tmp);
			}
			else
			{
				for(new j = 1; j < sizeof Jobs; j++)
				{
				    if(strcmp(adm_tmp, Jobs[j][jobName], true) == 0)
				    {
				        jobid = j;
				        break;
				    }
				}
			}
			
			if(jobid <= 0 || jobid >= sizeof Jobs)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Emprego inválido.");
	            return 1;
			}
			
			hSetInt(GetPlayerXFilePath(plid), "Job", jobid);
			ChangePlayerJob(plid, jobid);
	    }
	    
	    else if(strcmp(adm_cmd, "skill", true) == 0)
	    {
	        new kpath[128], key[128];
			new plid, skill, level;
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin skill [id] [skill] [level]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin skill [id] [skill] [level]");
	            return 1;
	        }

	        if(strcmp(adm_tmp, "pistol", true) == 0)
	            skill = WEAPONSKILL_PISTOL;
            else if(strcmp(adm_tmp, "pistolsilenced", true) == 0)
	            skill = WEAPONSKILL_PISTOL_SILENCED;
            else if(strcmp(adm_tmp, "deagle", true) == 0)
	            skill = WEAPONSKILL_DESERT_EAGLE;
            else if(strcmp(adm_tmp, "shotgun", true) == 0)
	            skill = WEAPONSKILL_SHOTGUN;
            else if(strcmp(adm_tmp, "sawnoffshotgun", true) == 0)
	            skill = WEAPONSKILL_SAWNOFF_SHOTGUN;
            else if(strcmp(adm_tmp, "spas12shotgun", true) == 0)
	            skill = WEAPONSKILL_SPAS12_SHOTGUN;
            else if(strcmp(adm_tmp, "microuzi", true) == 0)
	            skill = WEAPONSKILL_MICRO_UZI;
            else if(strcmp(adm_tmp, "mp5", true) == 0)
	            skill = WEAPONSKILL_MP5;
            else if(strcmp(adm_tmp, "ak47", true) == 0)
	            skill = WEAPONSKILL_AK47;
            else if(strcmp(adm_tmp, "m4", true) == 0)
	            skill = WEAPONSKILL_M4;
            else if(strcmp(adm_tmp, "sniper", true) == 0)
	            skill = WEAPONSKILL_SNIPERRIFLE;
			else
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin skill [id] [skill] [level]");
			    SendClientMessage(playerid, COLOUR_GRAY, "SKILLS: pistol, pistolsilenced, deagle, shotgun, sawnoffshotgun,");
			    SendClientMessage(playerid, COLOUR_GRAY, "SKILLS: spas12shotgun, microuzi, mp5, ak47, m4, sniper");
	            return 1;
			}
	        
	        adm_tmp = strtok(cmdtext, idx);
	        
	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin skill [id] [skill] [level]");
	            return 1;
	        }
	        
			level = strval(adm_tmp);
			
			if(level < 0)
			    level = 0;
			else if(level > MAX_SKILL_LEVEL)
			    level = MAX_SKILL_LEVEL;
			    
			kpath = GetPlayerKFilePath(plid);
			format(key, sizeof key, "SkillLevel%d", skill);
			hSetInt(kpath, key, level);
	        SetPlayerSkillLevel(plid, skill, level);
	    }
	    
	    else if(strcmp(adm_cmd, "dinheiro", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);
	        
	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin dinheiro [id] [quantidade]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

			adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin dinheiro [id] [quantidade]");
	            return 1;
	        }
	        
	        GivePlayerMoneyEx(plid, strval(adm_tmp));
	    }
	    
	    else if(strcmp(adm_cmd, "vida", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin vida [id] [quantidade]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

			adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin vida [id] [quantidade]");
	            return 1;
	        }

	        SetHealth(plid, floatstr(adm_tmp));
	    }
	    
	    else if(strcmp(adm_cmd, "colete", true) == 0)
	    {
	        new plid;

	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin colete [id] [quantidade]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

			adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin colete [id] [quantidade]");
	            return 1;
	        }

	        SetArmour(plid, floatstr(adm_tmp));
	    }
	    
	    else if(strcmp(adm_cmd, "paralisar", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin paralisar [id]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }
	        
	        TogglePlayerControllable(plid, false);
		}
		
		else if(strcmp(adm_cmd, "desparalisar", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin desparalisar [id]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

	        TogglePlayerControllable(plid, true);
	        ClearAnimations(plid);
		}
		
		else if(strcmp(adm_cmd, "level", true) == 0)
	    {
			new plid;
			
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin level [id] [level]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin level [id] [level]");
	            return 1;
	        }
	        
	        hSetInt(GetPlayerXFilePath(plid), "Level", strval(adm_tmp));
		}
		
		else if(strcmp(adm_cmd, "skin", true) == 0)
	    {
	        new plid, skinid;
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin skin [id] [skin]");
	            return 1;
	        }

	        plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin skin [id] [skin]");
	            return 1;
	        }

			skinid = strval(adm_tmp);
			
			SetPlayerSkin(plid, skinid);
	        hSetInt(GetPlayerXFilePath(plid), "Skin", skinid);
		}
	    
	    else if(strcmp(adm_cmd, "veiculo", true) == 0)
	    {
	        new plid, modelid;
	        new Float:X, Float:Y, Float:Z, Float:A;

            adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin veiculo [id] [modelo]");
	            return 1;
	        }

	        plid = strval(adm_tmp);
	        
	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin veiculo [id] [modelo]");
	            return 1;
	        }
	        
	        if(IsNumeric(adm_tmp))
	        {
	        	modelid = strval(adm_tmp);
	        
	            if(modelid < 400)
	                modelid += 400;
			}
			
			else
			{
			    modelid = -1;
			    
			    for(new m = 0; m < sizeof Vehicles; m++)
			    {
			        if(strcmp(Vehicles[m][vehModel], adm_tmp, true) == 0)
			            modelid = m+400;
			    }
			}
	        
	        if(modelid <= 399 || modelid >= 400 + sizeof Vehicles)
	       	{
	       	    SendClientMessage(playerid, COLOUR_GRAY, "Modelo inválido.");
	       	    return 1;
       		}
       		
       		if(Vehicles[modelid - 400][vehValue] <= 0)
       		{
       		    SendClientMessage(playerid, COLOUR_GRAY, "Modelo indisponível para venda.");
	       	    return 1;
       		}
	        	
	        if(IsPlayerInAnyVehicle(playerid))
	        {
				new vehid;
				
				vehid = GetPlayerVehicleID(playerid);
				
				GetVehiclePos(vehid, X, Y, Z);
				GetVehicleZAngle(vehid, A);
	        }
	        
	        else
	        {
	            GetPlayerPos(playerid, X, Y, Z);
	            GetPlayerFacingAngle(playerid, A);
	        }
	        
	        X += 3.0 * floatsin(-A, degrees);
	        Y += 3.0 * floatcos(-A, degrees);
	        A = (A + 90) % 360.0;
	        
	        CreatePlayerVehicle(PlayerName(plid), modelid, X, Y, Z, A, random(400), random(400));
	    }
	    
	    else if(strcmp(adm_cmd, "combustivel", true) == 0)
	    {
	        new amount;
	        
	        if(!IsPlayerInAnyVehicle(playerid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em um veiculo para utilizar esse comando.");
	            return 1;
	        }
	        
	        adm_tmp = strtok(cmdtext, idx);
	        
	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin combustivel [quantidade]");
	            return 1;
	        }
	        
			if(strcmp(adm_tmp, "ilimitada", true) != 0)
			{
	        	amount = strval(adm_tmp);
	        
	        	if(amount < 0 || amount > 100)
	        	{
	        	    SendClientMessage(playerid, COLOUR_GRAY, "Quantidade de 0 a 100 ou ilimitada.");
	        	    return 1;
	        	}
			}
			
			else
			    amount = 127;
			    
			SetVehicleFuel(GetPlayerVehicleID(playerid), amount);
	    }
	    
	    else if(strcmp(adm_cmd, "explodir", true) == 0)
	    {
	        new type;
	        new Float:distance, Float:radius, Float:X, Float:Y, Float:Z, Float:A;
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin explodir [tipo] [distancia] [raio]");
	            return 1;
	        }
	        
	        type = strval(adm_tmp);
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin explodir [tipo] [distancia] [raio]");
	            return 1;
	        }
	        
	        distance = floatstr(adm_tmp);
	        
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin explodir [tipo] [distancia] [raio]");
	            return 1;
	        }

	        radius = floatstr(adm_tmp);
	        
	        if(!IsPlayerInAnyVehicle(playerid))
	        {
	        	GetPlayerPos(playerid, X, Y, Z);
	        	GetPlayerFacingAngle(playerid, A);
			}
			
			else
			{
			    new vehid;
			    
			    vehid = GetPlayerVehicleID(playerid);
			    
			    GetVehiclePos(vehid, X, Y, Z);
			    GetVehicleZAngle(vehid, A);
			}
			
			CreateExplosion(	X + distance * floatsin(-A, degrees),
								Y + distance * floatcos(-A, degrees),
								Z,
								type,
								radius	);
	    }
	    
	    else if(strcmp(adm_cmd, "spawnar", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin spawnar [id]");
	            return 1;
			}
			
			plid = strval(adm_tmp);
			
			if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            return 1;
	        }
	        
	        UpdatePlayerSpawn(plid);
	        SpawnPlayer(plid);
	    }
	    
	    else if(strcmp(adm_cmd, "vspawnar", true) == 0)
	    {
	        if(IsPlayerInAnyVehicle(playerid))
	            SetVehicleToRespawn(GetPlayerVehicleID(playerid));

	        else
	        {
	            new vid;
	            new Float:X, Float:Y, Float:Z, Float:VX, Float:VY, Float:VZ, Float:dis = 5.0, Float:vdis;
	            
	            vid = -1;
	            GetPlayerPos(playerid, X, Y, Z);
	            
	            for(new v = 0; v < GetVehicles(); v++)
	            {
	                GetVehiclePos(v, VX, VY, VZ);
	                vdis = GetDistance(X, Y, Z, VX, VY, VZ);
	                
	                if(vdis < dis)
	                {
	                    dis = vdis;
	                    vid = v;
	                }
	            }
	            
	            if(vid == -1)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar próximo ou dentro de um veículo.");
	                return 1;
				}
				
				SetVehicleToRespawn(vid);
	        }
	    }
	    
	    else if(strcmp(adm_cmd, "goto", true) == 0)
	    {
	        new place[128];
	        new int;
			new bool:found;
			new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ, Float:dis;
	        
	        int = -1;
	        found = false;
	        strmid(place, cmdtext, idx, strlen(cmdtext));
	        
	        if(!strlen(place))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin goto [local]");
	            return 1;
	        }
	        
	        GetPlayerPos(playerid, PX, PY, PZ);
	        
	        for(new i = 0; i < sizeof Ints; i++)
	        {
	            if(strcmp(Ints[i][intName], place, true) == 0)
	            {
	                int = i;
	                break;
	            }
	        }
	        
	        if(int != -1)
	        {
	            new Float:edis;
	            
	            for(new e = 0; e < sizeof Enters; e++)
	            {
	                if(Enters[e][intId] == int)
	                {
						if(found)
						{
						    edis = GetDistance(Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ], PX, PY, PZ);
						    
						    if(edis < dis)
						        dis = edis;
						        
							else
							    continue;
						}
						else
						    dis = GetDistance(Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ], PX, PY, PZ);
						
						X = Enters[e][enterX];
		    			Y = Enters[e][enterY];
					    Z = Enters[e][enterZ];
					    
					    found = true;
	                }
	            }
	        }
	        
	        if(!found)
	        {
	            new Float:adis;
	            
	        	for(new a = 0; a < sizeof Areas; a++)
	        	{
	                if(strcmp(Areas[a][areaName], place, true) == 0)
	        	    {
						if(found)
						{
						    adis = GetDistance(Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ], PX, PY, PZ);
						    
						    if(adis < dis)
						        dis = adis;
						        
							else
							    continue;
						}
						
						else
							dis = GetDistance(Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ], PX, PY, PZ);

						X = Areas[a][areaX];
						Y = Areas[a][areaY];
						Z = Areas[a][areaZ];
						
						found = true;
	        	    }
	        	}
			}
			
			if(!found)
	        {
	        	for(new c = 0; c < sizeof Companies; c++)
	        	{
	        	    if(strcmp(Companies[c][cType], place, true) == 0)
	        	    {
	        	        X = Companies[c][cX];
	        	        Y = Companies[c][cY];
	        	        Z = Companies[c][cZ];

	        	        found = true;
	        	        break;
	        	    }
	        	}
			}
			
			if(!found)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Local inválido.");
			    return 1;
			}
			
			SetPlayerInterior(playerid, 0);
			
			if(IsPlayerInAnyVehicle(playerid))
			    SetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
			    
			else
				SetPlayerPos(playerid, X, Y, Z);
	    }
	    
        else if(strcmp(adm_cmd, "anunciar", true) == 0)
	    {
	        new text[128];
	        
			strmid(text, cmdtext, idx, strlen(cmdtext));
			
			if(!strlen(text))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin anunciar [texto]");
	            return 1;
			}

			ShowTextForAll(text, 320.0, 130.0, COLOUR_WHITE, 1, 0.7, 2.0, 1, 2, 5000);
	    }

        else if(strcmp(adm_cmd, "zone", true) == 0)
	    {
			new string[128];
			
			format(string, sizeof string, "Zone: %d", Zone[playerid]);
			SendClientMessage(playerid, COLOUR_SKY_BLUE, string);
	    }
	    
        else if(strcmp(adm_cmd, "casa", true) == 0)
	    {
	        new value, int;
			new Float:X, Float:Y, Float:Z, Float:A;

	        if(IsPlayerInAnyVehicle(playerid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você deve sair do veiculo para utilizar esse comando.");
	            return 1;
	        }

	        value = strval(strtok(cmdtext, idx));
	        int = -1;

	        for(new house = 0; house < sizeof HouseInteriors; house++)
	        {
				if(HouseInteriors[house][hintValue] == value)
				{
				    int = house;
				    break;
				}
	        }

	        if(int == -1)
	        {
	        	SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin casa [valor] - VALORES DISPONÍVEIS:");
				SendClientMessage(playerid, COLOUR_GRAY, "10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 50000, 60000, 65000, 70000, 75000,");
				SendClientMessage(playerid, COLOUR_GRAY, "80000, 90000, 95000, 100000, 120000, 140000, 160000, 180000, 200000, 250000, 300000, 500000");
				return 1;
			}

	        GetPlayerPos(playerid, X, Y, Z);
	        GetPlayerFacingAngle(playerid, A);
	        CreateHouse(PlayerName(playerid), value, X, Y, Z, A, 2);
	    }
	    
	    else if(strcmp(adm_cmd, "vercasa", true) == 0)
	    {
	        new value, int;
	        
	        value = strval(strtok(cmdtext, idx));
	        int = -1;
	        
	        for(new house = 0; house < sizeof HouseInteriors; house++)
	        {
	            if(HouseInteriors[house][hintValue] == value)
	            {
	                int = house;
	                break;
	            }
	        }
	
	        if(int == -1)
	        {
	        	SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin vercasa [valor] - VALORES DISPONÍVEIS:");
				SendClientMessage(playerid, COLOUR_GRAY, "10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 50000, 60000, 65000, 70000, 75000,");
				SendClientMessage(playerid, COLOUR_GRAY, "80000, 90000, 95000, 100000, 120000, 140000, 160000, 180000, 200000, 250000, 300000, 500000");
				return 1;
			}

			SetPlayerInterior(playerid, HouseInteriors[int][hintInt]);
			SetPlayerPos(playerid, HouseInteriors[int][hintX], HouseInteriors[int][hintY], HouseInteriors[int][hintZ]);
	    }
	    
	    else if(strcmp(adm_cmd, "valorizarcasa", true) == 0)
	    {
	        new houseid, value, int;

			houseid = House[playerid];

			if(houseid == -1)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma casa.");
			    return 1;
			}

            value = strval(strtok(cmdtext, idx));
	        int = -1;

	        for(new house = 0; house < sizeof HouseInteriors; house++)
	        {
				if(HouseInteriors[house][hintValue] == value)
				{
				    int = house;
				    break;
				}
	        }

	        if(int == -1)
	        {
	        	SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin valorizarcasa [valor] - VALORES DISPONÍVEIS:");
				SendClientMessage(playerid, COLOUR_GRAY, "10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 50000, 60000, 65000, 70000, 75000,");
				SendClientMessage(playerid, COLOUR_GRAY, "80000, 90000, 95000, 100000, 120000, 140000, 160000, 180000, 200000, 250000, 300000, 500000");
				return 1;
			}
			
			hSetInt(GetHouseFilePath(houseid), "Value", value);
	    }
	    
	    else if(strcmp(adm_cmd, "apagarcasa", true) == 0)
	    {
			new houseid;
			
			houseid = House[playerid];
			
			if(houseid == -1)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma casa.");
			    return 1;
			}
			
			DeleteHouse(houseid);
	    }
	    
	    else
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin [comando] - COMANDOS DISPONÍVEIS:");
			SendClientMessage(playerid, COLOUR_GRAY, "say, report, banir, desbanir, kickar, arma, ir, trazer, empregar, skill,");
			SendClientMessage(playerid, COLOUR_GRAY, "dinheiro, vida, colete, paralisar, desparalisar, level, skin, veiculo, combustivel,");
			SendClientMessage(playerid, COLOUR_GRAY, "explodir, spawnar, vspawnar, goto, anunciar, zone, casa, vercasa, valorizarcasa,");
			SendClientMessage(playerid, COLOUR_GRAY, "apagarcasa");
			return 1;
	    }

		reportf("Admin Command: %s -> %s", REPORT_DEFAULT, PlayerName(playerid), cmdtext);
	    SendClientMessage(playerid, COLOUR_GREEN, "Feito.");
	    return 1;
	}
	
	SendClientMessage(playerid, COLOUR_WHITE, "Comando inexistente.");
	return 1;
}

public OnPlayerText(playerid, text[])
{
    if(!IsPlayerLogged(playerid))
	{
	    ShowTextForPlayer(playerid, "Voce deve efetuar login para fazer isso.", 318.0, 309.0, COLOUR_RED, 1, 0.4, 1.7, 0, 2, 2000);
	    return 0;
	}
	
	new string[128];
	new colour;
	new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
	
	GetPlayerPos(playerid, X, Y, Z);
	format(string, sizeof string, "* %s: %s", PlayerName(playerid), text);
	colour = GetPlayerColour(playerid);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    GetPlayerPos(n, PX, PY, PZ);
	    
	    if(GetDistance(X, Y, Z, PX, PY, PZ) < 30.0)
	        SendClientMessage(n, colour, string);
	}
	
	return 0;
}

public UpdatePlayers()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        if(pHealth[n] <= 0.0 || pHealth[n] > 100.0)
	        	pHealth[n] = 100.0;
				        
	        if(pUpdate[n] & UPDATE_STATUS)
            {
                SetPlayerHealth(n, pHealth[n]);
                SetPlayerArmour(n, pArmour[n]);
				pUpdate[n] &= ~UPDATE_STATUS;
            }
            
            else
            {
				new Float:data;
				
				GetPlayerHealth(n, data);
				if(data != pHealth[n])
				{
					if(data > pHealth[n])
					{
					    reportf("%s - Vida +%.2f (sem razao)", REPORT_ACTION, PlayerName(n), data - pHealth[n]);
					    SetPlayerHealth(n, pHealth[n]);
					}

					else
					{
					    new Float:aux;
					    
					    aux = pHealth[n];
					    pHealth[n] = data;
					    OnPlayerDamage(n, aux - data);
					}
				}
				
				GetPlayerArmour(n, data);
				if(data != pArmour[n])
				{
				    if(data > pArmour[n])
				    {
				        reportf("%s - Colete +%.2f (sem razao)", REPORT_ACTION, PlayerName(n), data - pArmour[n]);
					    SetPlayerArmour(n, pArmour[n]);
				    }
				    
				    else
				        pArmour[n] = data;
				}
            }
            
            if(pUpdate[n] & UPDATE_MONEY)
            {
                GivePlayerMoney(n, -GetPlayerMoney(n) + pMoney[n]);
                pUpdate[n] &= ~UPDATE_MONEY;
            }
            
            else
            {
				new money;

				money = GetPlayerMoney(n);
			
    			if(pMoney[n]!= money)
    			{
					new sub;
				
					sub = money - pMoney[n];
				
					if(sub > 0)
    		    		reportf("%s - Dinheiro +$%d,00 (sem razao)", REPORT_ACTION, PlayerName(n), sub);
    		    	
					else
					    reportf("%s - Dinheiro -$%d,00 (sem razao)", REPORT_ACTION, PlayerName(n), -sub);
				    
    		    	GivePlayerMoney(n, -money + pMoney[n]);
    			}
			}
    
            if(pUpdate[n] & UPDATE_WEAPONS)
            {
				ResetPlayerWeapons(n);
				GivePlayerWeapon(n, pWeapons[n][0], pWeapons[n][1]);
				GivePlayerWeapon(n, pWeapons[n][2], pWeapons[n][3]);
				GivePlayerWeapon(n, pWeapons[n][4], 1);
                pUpdate[n] &= ~UPDATE_WEAPONS;
            }
            
            else
            {
            	new weaponid;
            
            	weaponid = GetPlayerWeapon(n);
            
				if(Weapon[n] == -1 || (weaponid != Weapon[n] && weaponid != 119))
				{
				    if(Weapon[n] == -1)
				        Weapon[n] = 0;
			        
				    OnPlayerChangeWeapon(n, weaponid);
				    Weapon[n] = weaponid;
				}
			}
		}
	}
}

public OnPlayerChangeWeapon(playerid, weaponid)
{
	if(!IsPlayerAdmin(playerid) && IsForbiddenWeapon(weaponid))
	{
	    new str[128];
	    format(str, sizeof str, "Posse de arma proibida [%s - ID: %d]", Weapons[weaponid][wName], weaponid);
	    BanPlayer(playerid, str);
	    return;
	}
	
	SavePlayerWeapons(playerid);
	if(Weapons[pWeapons[playerid][0]][wObjectId] != 0 && pWeapons[playerid][1] > 0)
	{
		if(HandgunObject[playerid] != -1)
		{
			DestroyObject(HandgunObject[playerid]);
			HandgunObject[playerid] = -1;
		}
	    
	    if(pWeapons[playerid][0] != weaponid)
	    {
			HandgunObject[playerid] = CreateObject(Weapons[pWeapons[playerid][0]][wObjectId], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			
			if(pWeapons[playerid][0] == 27)
			    HandgunObjectOffsetX[playerid] = 0.1;
			    
			else
			    HandgunObjectOffsetX[playerid] = 0.0;
			
			UpdatePlayerCrouch(playerid);
		}
	}
}

public OnPlayerDamage(playerid, Float:damage)
{
	if(Limp[playerid] != 0)
	    return 0;
	    
	new Float:health;
	health = GetHealth(playerid);
	
	if(health < 25.0)
	{
	    if(Limp[playerid] != 2)
	    {
	    	HideTextRed(playerid);
			Limp[playerid] = 2;
	   		ShowTextGray(playerid);
	   		SetPlayerDrunkLevelEx(playerid, 40000);
	   		SetTimerEx("Limping", 3000, false, "d", playerid);
		}
	}
	
	else
	{
	    ShowTextRed(playerid);

		if(damage < 10.0)
		    SetTimerEx("HideTextRed", 400, false, "d", playerid);

		else
		{
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        Limp[playerid] = 1;
				SetTimerEx("StopAnimation", 200, false, "d", playerid);
		    	SetTimerEx("DamageAnimation", 500, false, "df", playerid, damage);
			}
			
			else
			    SetTimerEx("HideTextRed", 3000, false, "d", playerid);
		}
	}
	
	return 1;
}

public DamageAnimation(playerid, Float:damage)
{
	new anim;

	if(damage >= 25.0)
	{
	    new getupid;
	    
	    anim = random(4);
	    
		if(anim == 0)
		{
		    getupid = 1;
			ApplyAnimation(playerid, "PED", "KO_shot_face", 4.1, 0, 1, 1, 1, 3000);
		}
		
		else if(anim == 1)
		{
		    getupid = 0;
		    ApplyAnimation(playerid, "PED", "KO_shot_stom", 4.1, 0, 1, 1, 1, 3000);
		}
		
		else if(anim == 2)
		{
		    getupid = 0;
		    ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.1, 0, 1, 1, 1, 3000);
		}
		
		else
		{
		    getupid = 1;
		    ApplyAnimation(playerid, "KNIFE", "knife_hit_3", 4.1, 0, 1, 1, 1, 3000);
		}
		
		SetPlayerDrunkLevelEx(playerid, 50000);
		SetTimerEx("DamageAnimationGetUp", 3000, false, "dd", playerid, getupid);
	}
	
	else
	{
	    anim = random(3);
	    
	    if(anim == 0)
			ApplyAnimation(playerid, "MD_END", "END_SC1_PLY", 4.1, 0, 1, 1, 1, -1);
			
		else if(anim == 1)
			ApplyAnimation(playerid, "MD_END", "END_SC1_RYD", 4.1, 0, 1, 1, 1, -1);
			
		else
			ApplyAnimation(playerid, "MD_END", "END_SC1_SWE", 4.1, 0, 1, 1, 1, -1);
        	
        SetPlayerDrunkLevelEx(playerid, 50000);
        SetTimerEx("DamageEnd", 5000, false, "d", playerid);
	}
}

public DamageAnimationGetUp(playerid, getupid)
{
	if(getupid == 0)
		ApplyAnimation(playerid, "PED", "getup_front", 4.1, 0, 1, 1, 1, -1);

	else
	    ApplyAnimation(playerid, "PED", "getup", 4.1, 0, 1, 1, 1, -1);
	    
	SetTimerEx("DamageEnd", 1500, false, "d", playerid);
}

public DamageEnd(playerid)
{
    Limp[playerid] = 0;
    SetPlayerDrunkLevelEx(playerid, 0);
    HideTextRed(playerid);
    ClearAnimations(playerid);
}

public Limping(playerid)
{
	if(Limp[playerid] == 2)
	{
		new Float:health;
		health = GetHealth(playerid);
	
		if(health < 25.0)
		{
		    if(!IsPlayerInAnyVehicle(playerid))
		    	ApplyAnimation(playerid, "RYDER", "RYD_Die_PT1", 4.1, 1, 1, 1, 1, 1);
		    	
		    SetTimerEx("Limping", 5000, false, "d", playerid);
		    return;
		}
	}
	    
	Limp[playerid] = 0;
	HideTextGray(playerid);
}

public Die(playerid, spawn)
{
    new hospid;
	new Float:X, Float:Y, Float:Z, Float:dis;

	GetPlayerPos(playerid, X, Y, Z);
    hospid = -1;
	for(new h = 0; h < sizeof Areas; h++)
	{
	    if(Areas[h][areaId] == AREA_HOSPITAL)
	    {
	        new Float:pdis;

			pdis = GetDistance(X, Y, Z, Areas[h][areaX], Areas[h][areaY], Areas[h][areaZ]);

			if(pdis < dis || hospid == -1)
   			{
      			dis = pdis;
         		hospid = h;
	        }
   		}
	}

	if(hospid != -1)
 		SetSpawnInfo(playerid, 0, hGetInt(GetPlayerXFilePath(playerid), "Skin"), Areas[hospid][areaX], Areas[hospid][areaY], Areas[hospid][areaZ], 180.0, 0, 0, 0, 0, 0, 0);
 		
    Dying[playerid] = 0;
	KillTimer(DieTimer[playerid]);
    HideTextLightGray(playerid);
    ClearAnimations(playerid);
	SetCameraBehindPlayer(playerid);
	SetPlayerDrunkLevelEx(playerid, 0);
	SetHealth(playerid, 100.0);
	
	if(spawn)
		SpawnPlayer(playerid);
}

public RestartDance(playerid)
    DanceTimer[playerid] = SetTimerEx("Dancing", 100, true, "d", playerid);
    
public Dancing(playerid)
{
	new key, up_down, left_right;

	GetPlayerKeys(playerid, key, up_down, left_right);

	if(key & KEY_SECONDARY_ATTACK)
	{
	    KillTimer(DanceTimer[playerid]);
	    TogglePlayerControllable(playerid, true);
	    ClearAnimations(playerid);
	    return;
	}

	if(up_down != 0)
	{
	    KillTimer(DanceTimer[playerid]);

	    new rand;

		if(up_down == KEY_UP)
		{
	    	rand = random(2);
	    	
	    	switch(rand)
	    	{
	    	    case 0:
	            	ApplyAnimation(playerid, "DANCING", "bd_clap", 4.1, 0, 1, 1, 1, 1);
	            	
				case 1:
			    	ApplyAnimation(playerid, "DANCING", "bd_clap1", 4.1, 0, 1, 1, 1, 1);
	    	}
	    	
	    	DanceTimer[playerid] = SetTimerEx("RestartDance", 2700, false, "d", playerid);
		}
		else
		{
		    rand = random(4);
		    
		    switch(rand)
	    	{
				case 0:
				    ApplyAnimation(playerid, "DANCING", "DAN_Left_A", 4.1, 0, 1, 1, 1, 1);
				    
				case 1:
				    ApplyAnimation(playerid, "DANCING", "DAN_Down_A", 4.1, 0, 1, 1, 1, 1);
				    
				case 2:
        	    	ApplyAnimation(playerid, "DANCING", "DAN_Right_A", 4.1, 0, 1, 1, 1, 1);
        	    	
				case 3:
					ApplyAnimation(playerid, "DANCING", "DAN_Up_A", 4.1, 0, 1, 1, 1, 1);
	    	}
	    	
	    	DanceTimer[playerid] = SetTimerEx("RestartDance", 1000, false, "d", playerid);
		}
	    
	    DanceOff[playerid] = 1;
	    return;
	}

	if(left_right != 0)
	{
	    if(left_right == KEY_RIGHT)
	    	DanceStyle[playerid] = (DanceStyle[playerid] + 1) % 7;
		else
		    DanceStyle[playerid] = (DanceStyle[playerid] - 1) % 7;
		    
	    DanceOff[playerid] = 1;
	}

	if(DanceOff[playerid] == 1)
	{
	    DanceOff[playerid] = 0;

	    switch(DanceStyle[playerid])
	    {
	        case 0:
	            ApplyAnimation(playerid, "DANCING", "dnce_M_d", 4.1, 1, 1, 1, 1, -1);
	            
			case 1:
			    ApplyAnimation(playerid, "DANCING", "dance_loop", 4.1, 1, 1, 1, 1, -1);
			    
			case 2:
			    ApplyAnimation(playerid, "DANCING", "dnce_M_a", 4.1, 1, 1, 1, 1, -1);
			    
			case 3:
			    ApplyAnimation(playerid, "DANCING", "dnce_M_b", 4.1, 1, 1, 1, 1, -1);
			    
			case 4:
			    ApplyAnimation(playerid, "DANCING", "dnce_M_c", 4.1, 1, 1, 1, 1, -1);
			    
			case 5:
			    ApplyAnimation(playerid, "DANCING", "dnce_M_e", 4.1, 1, 1, 1, 1, -1);
			    
			case 6:
			    ApplyAnimation(playerid, "DANCING", "DAN_Loop_A", 4.1, 1, 1, 1, 1, -1);
	    }
	}

	return;
}

public RestartStripTease(playerid)
    DanceTimer[playerid] = SetTimerEx("Stripping", 100, true, "d", playerid);

public Stripping(playerid)
{
    new key, up_down, left_right;

	GetPlayerKeys(playerid, key, up_down, left_right);

	if(key & KEY_SECONDARY_ATTACK)
	{
	    KillTimer(DanceTimer[playerid]);
	    TogglePlayerControllable(playerid, true);
	    ClearAnimations(playerid);
	    return;
	}

	if(up_down == KEY_UP)
	{
	    KillTimer(DanceTimer[playerid]);
	    ApplyAnimation(playerid, "STRIP", "STR_C2", 4.1, 0, 1, 1, 1, 1);
		DanceTimer[playerid] = SetTimerEx("RestartStripTease", 5000, false, "d", playerid);
		DanceOff[playerid] = 1;
		return;
	}

	if(up_down == KEY_DOWN)
	{
	    KillTimer(DanceTimer[playerid]);
	    ApplyAnimation(playerid, "STRIP", "STR_A2B", 4.1, 0, 1, 1, 1, 1);
		DanceTimer[playerid] = SetTimerEx("RestartStripTease", 4500, false, "d", playerid);
		DanceOff[playerid] = 1;
		return;
	}

	if(left_right == KEY_LEFT)
	{
	    KillTimer(DanceTimer[playerid]);
	    ApplyAnimation(playerid, "STRIP", "STR_C1", 4.1, 0, 1, 1, 1, 1);
		SetTimerEx("RestartStripTease", 5500, false, "d", playerid);
		DanceOff[playerid] = 1;
		return;
	}

	if(left_right == KEY_RIGHT)
	{
	    KillTimer(DanceTimer[playerid]);
	    ApplyAnimation(playerid, "STRIP", "STR_B2C", 4.1, 0, 1, 1, 1, 1);
		SetTimerEx("RestartStripTease", 5000, false, "d", playerid);
		DanceOff[playerid] = 1;
		return;
	}

	if(DanceOff[playerid] == 1)
	{
	    DanceOff[playerid] = 0;
	    ApplyAnimation(playerid, "STRIP", "STR_Loop_A", 4.1, 1, 1, 1, 1, -1);
	}
}

public CreateExplosionT(Float:X, Float:Y, Float:Z, type, Float:radius)
	CreateExplosion(X, Y, Z, type, radius);

public ExplodeBomb(objectid, Float:X, Float:Y, Float:Z)
{
	DestroyObject(objectid);
	
	CreateExplosion(X, Y, Z, 7, 100.0);
	CreateExplosion(X, Y, Z + 6.0, 7, 100.0);
	CreateExplosion(X + 5.0, Y, Z, 7, 100.0);
	CreateExplosion(X, Y + 5.0, Z + 6.0, 7, 100.0);
	CreateExplosion(X - 5.0, Y, Z, 7, 100.0);
	CreateExplosion(X, Y - 5.0, Z + 6.0, 7, 100.0);
	SetTimerEx("CreateExplosionT", 400,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 7, 100.0);
	SetTimerEx("CreateExplosionT", 400,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 7, 100.0);
	SetTimerEx("CreateExplosionT", 400,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 7, 100.0);
	SetTimerEx("CreateExplosionT", 400,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 7, 100.0);
	SetTimerEx("CreateExplosionT", 800,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 7, 100.0);
	SetTimerEx("CreateExplosionT", 800,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 7, 100.0);
	SetTimerEx("CreateExplosionT", 800,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 7, 100.0);
	SetTimerEx("CreateExplosionT", 800,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 7, 100.0);
	SetTimerEx("CreateExplosionT", 1200, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 7, 100.0);
	SetTimerEx("CreateExplosionT", 1200, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 7, 100.0);
	SetTimerEx("CreateExplosionT", 1600, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 7, 100.0);
	SetTimerEx("CreateExplosionT", 1600, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 7, 100.0);
}

public ExplodeApproxBomb(objectid, Float:X, Float:Y, Float:Z, count)
{
	new bool:explode;
	
	explode = true;
	
	if(count < 150)
	{
	    explode = false;
	    
    	for(new n = 0; n < MAX_SLOTS; n++)
    	{
    	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
    	    {
    	        new Float:PX, Float:PY, Float:PZ;

	            GetPlayerPos(n, PX, PY, PZ);

				if(GetDistance(PX, PY, PZ, X, Y, Z) < 12.0)
				{
				    explode = true;
				    break;
				}
	        }
	    }
	}
    
    if(explode)
    {
        ExplodeBomb(objectid, X, Y, Z);
		return;
	}
	
	SetTimerEx("ExplodeApproxBomb", 1000, false, "dfffd", objectid, X, Y, Z, count+1);
}

public GasEffect(objectid, Float:X, Float:Y, Float:Z)
{
	new id;

    DestroyObject(objectid);
    
    id = CreateObject(2780, X, Y, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 20000, false, "d", id);
    id = CreateObject(2780, X, Y + 5.0, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15000, false, "d", id);
    id = CreateObject(2780, X + 5.0, Y, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15000, false, "d", id);
    id = CreateObject(2780, X, Y - 5.0, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15000, false, "d", id);
    id = CreateObject(2780, X - 5.0, Y, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15000, false, "d", id);
}

public FlashEffect(objectid, Float:X, Float:Y, Float:Z)
{
    DestroyObject(objectid);
    
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && GetPlayerSkin(n) != 285)
	    {
	        new time;
	        new Float:PX, Float:PY, Float:PZ, Float:PA, Float:dis, Float:adis;
	        
	        GetPlayerPos(n, PX, PY, PZ);
	        GetPlayerFacingAngle(n, PA);
	        dis = GetDistance(PX, PY, PZ, X, Y, Z);
	        PX += floatsin(-PA, degrees);
	        PY += floatcos(-PA, degrees);
	        adis = GetDistance(PX, PY, PZ, X, Y, Z);
	                            
			if(dis <= 79.0 && dis > adis)
			{
			    time = floatround(((dis - adis) * 10.0) + (20.0 - dis) / 4.0) * 1000;
			    TextDrawColour(tdwhite, 0xFFFFFFFF);
			    TextDrawShowForPlayer(n, tdwhite);
			    SetTimerEx("DissolveTextWhite", time, false, "dd", n, 0xFF);
			}
	    }
	}
}

public RocketEffect(objectid, Float:X, Float:Y, Float:Z, stage)
{
	if(stage == 0)
	{
	    SetTimerEx("CreateExplosionT", 350, false, "fffdf", X, Y, Z + 25.0, 11, 0.0);
	    SetTimerEx("CreateExplosionT", 600, false, "fffdf", X, Y, Z + 50.0, 11, 0.0);
	    SetTimerEx("CreateExplosionT", 850, false, "fffdf", X, Y, Z + 75.0, 11, 0.0);
	    Z += 100.0;
	    MoveObject(objectid, X, Y, Z, 100.0);
	}
	
	else if(stage == 1 || stage == 2 || stage == 3 || stage == 4)
	{
	    new id, time;
	    new Float:RX, Float:RY, Float:RZ;
		
	    for(new rockets = 0; rockets < 6; rockets++)
	    {
	        RX = random(51) - 25.0;
	        RY = random(51) - 25.0;
	        RZ = random(51);
	        
	        id = CreateObject(354, X, Y, Z, 0.0, 0.0, 0.0);
	        time = floatround((mod(RX) + mod(RY) + RZ) / 40.0) * 1000;
	        
	        RX += X;
	        RY += Y;
	        RZ = Z - RZ;
	        
	        MoveObject(id, RX, RY, RZ, 40.0);
	        SetTimerEx("TakeObject", time, false, "d", id);
	        SetTimerEx("CreateExplosionT", time + 50, false, "fffdf", RX, RY, RZ, 11, 0.0);
	    }
	    
	    Z -= 10.0;
	    CreateExplosion(X, Y, Z + 20.0, 11, 0.0);
	    MoveObject(objectid, X, Y, Z, 10.0);
	}
	
	else if(stage == 5)
	    DestroyObject(objectid);

	if(stage < 5)
    	SetTimerEx("RocketEffect", 1000, false, "dfffd", objectid, X, Y, Z, stage + 1);
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_REGISTER_LOGIN)
	{
	    new xpath[128], kpath[128];
	    
	    if(!response)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Solicitação de registro/login cancelada, você foi kickado do servidor!");
	        SpawnPlayer(playerid);
	        Kick(playerid);
	        PlayerPlaySound(playerid, 1186, 0.0, 0.0, 0.0);
	        return 0;
	    }
	    
	    if(IsPlayerLogged(playerid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você já está autenticado.");
			return 0;
	    }
	    
	    if(!strlen(inputtext))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Digite uma senha...");
		    ShowLoginDialog(playerid);
			return 0;
	    }

		xpath = GetPlayerXFilePath(playerid);
		kpath = GetPlayerKFilePath(playerid);
		
	    if(!fexist(xpath) || !fexist(kpath))
	    {
	        hSetString(xpath, "Password", inputtext);
	        hSetInt(xpath, "Job", DESEMPREGADO);
	        hSetInt(xpath, "Level", 0);
	        hSetInt(xpath, "House", -1);
	        hSetInt(xpath, "Hab", 0);
			hSetInt(xpath, "Bank", 2000);
			hSetInt(xpath, "Skin", 240);
			hSetInt(xpath, "Itens", 0);
			hSetInt(xpath, "Money", 0);
			hSetInt(xpath, "Handgun", 0);
			hSetInt(xpath, "Lightgun", 0);
			hSetInt(xpath, "Steel", 0);
			hSetFloat(xpath, "Health", 100.0);
			hSetFloat(xpath, "Armour", 0.0);
			
			hSetInt(kpath, "Counter", 0);
			hSetInt(kpath, "JobCounter", 0);
			
			for(new skill = 0; skill < 11; skill++)
			{
			    new skill_key[128];
	    		format(skill_key, sizeof skill_key, "SkillLevel%d", skill);
				hSetInt(kpath, skill_key, 0);
				SetPlayerSkillLevel(playerid, skill, 0);
			}
			
			SavePlayerPos(playerid, 1686.0055, -2239.6494, 13.5469, 176.8181);
			SetSpawnInfo(playerid, 0, 240, -1983.3894, 152.8307, 27.6875, 86.9105, 0, 0, 0, 0, 0, 0);
			
			pMoney[playerid] = 0;
			
			for(new w = 0; w < 5; w++)
			    pWeapons[playerid][w] = 0;
			    
			pHealth[playerid] = 100.0;
			pArmour[playerid] = 0.0;
			
			for(new ln = 0; ln < 30; ln++)
				SendClientMessage(playerid, COLOUR_WHITE, " ");
		
		    TogglePlayerControllable(playerid, false);
			IntroductionPart[playerid] = 1;
			TextDrawShowForPlayer(playerid, tdblack);
			SetTimerEx("Introducing", 2000, false, "d", playerid);
	    }
	    
	    else
	    {
	        if(strcmp(inputtext, hGetString(xpath, "Password"), false) != 0)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Senha incorreta!");
	            ShowLoginDialog(playerid);
	            return 0;
	        }
	        
	        for(new ln = 0; ln < 30; ln++)
				SendClientMessage(playerid, COLOUR_WHITE, " ");
				
            for(new skill = 0; skill < 11; skill++)
			{
			    new skill_key[128];
	    		format(skill_key, sizeof skill_key, "SkillLevel%d", skill);
				SetPlayerSkillLevel(playerid, skill, hGetInt(kpath, skill_key));
			}
			
			UpdatePlayerSpawn(playerid);
			pMoney[playerid] = hGetInt(xpath, "Money");
			decode_gun(hGetInt(xpath, "Handgun"), pWeapons[playerid][0], pWeapons[playerid][1]);
			decode_gun(hGetInt(xpath, "Lightgun"), pWeapons[playerid][2], pWeapons[playerid][3]);
			pWeapons[playerid][4] = hGetInt(xpath, "Steel");
			pHealth[playerid] = hGetFloat(xpath, "Health");
			pArmour[playerid] = hGetFloat(xpath, "Armour");
			
			if(pHealth[playerid] <= 0.0 || pHealth[playerid] > 100.0)
				pHealth[playerid] = 100.0;
				
			SendClientMessage(playerid, COLOUR_GREEN, "Você foi autenticado com sucesso.");
	    }
	    
	    PlayerPlaySound(playerid, 1186, 0.0, 0.0, 0.0);
	    SpawnPlayer(playerid);
	    return 1;
 	}
 	
 	if(dialogid == DIALOG_INVITE)
 	{
 	    new string[128];
		        
 	    if(response)
 	    {
 	        if(Invite[playerid] == INVITE_GANG)
 	    	{
 	    	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "Você aceitou fazer parte da gangue.");
                format(string, sizeof string, "%s aceitou fazer parte da sua gangue.", PlayerName(playerid));
				SendClientMessage(InviteSender[playerid], COLOUR_SKY_BLUE, string);
				PutPlayerInGang(playerid, InviteParams[playerid], GANGPOST_SOLDIER);
 	    	}
 	    	
 	    	else if(Invite[playerid] == INVITE_REPAIR)
 	    	{
 	    	    new pay, vehid;
 	    	    
 	    	    pay = InviteParams[playerid] >> 16;
 	    	    vehid = InviteParams[playerid] & 0xFFFF;
 	    	    
 	    	    if(GetPlayerMoneyEx(playerid) < pay)
	 	    	    ShowTextForPlayer(playerid, "Dinheiro insuficiente.", 318.0, 309.0, COLOUR_RED, 2, 0.4, 1.7, 1, 2, 1500);
				    
				else
				{
				    new Text:tdrepair;
				    
 	    	    	tdrepair = TextDrawCreate(21.0, 125.0, " ");
					TextDrawAlignment(tdrepair, 0);
					TextDrawFont(tdrepair, 1);
					TextDrawLetterSize(tdrepair, 0.5, 1.5);
					TextDrawColour(tdrepair, COLOUR_WHITE);
					TextDrawSetProportional(tdrepair, 1);
					TextDrawSetShadow(tdrepair, 1);

			        TextDrawShowForPlayer(playerid, tdrepair);
					VFrozenFlags[playerid] |= VFROZEN_REPAIR;
					TogglePlayerControllable(playerid, false);
					GivePlayerMoneyEx(playerid, -pay);
			        SetTimerEx("Repairing", 150, false, "dddd", playerid, vehid, 0, _:tdrepair);
				}
	     	}
 	    }
 	    
 	    else
 	    {
            if(Invite[playerid] == INVITE_GANG)
 	    	{
 	    	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "Você recusou fazer parte da gangue.");
				format(string, sizeof string, "%s recusou fazer parte da sua gangue.", PlayerName(playerid));
				SendClientMessage(InviteSender[playerid], COLOUR_SKY_BLUE, string);
 	    	}
 	    }
 	    
 	    InviteSender[playerid] = INVALID_PLAYER_ID;
 	    InviteParams[playerid] = 0;
 	    Invite[playerid] = INVITE_NONE;
 	    return 1;
 	}
 	
    return 0;
}

public Introducing(playerid)
{
	if(!IsPlayerConnected(playerid) || !IsPlayerLogged(playerid))
	    return;
	    
	new time = 0;
	
	for(new ln = 0; ln < 30; ln++)
		SendClientMessage(playerid, COLOUR_WHITE, " ");
				
	if(IntroductionPart[playerid] <= 0)
	{
	    TextDrawHideForPlayer(playerid, tdblack);
	    SetCameraBehindPlayer(playerid);
	    UpdatePlayerSpawn(playerid);
	    TextDrawShowForPlayer(playerid, tdweek);
	    TogglePlayerClock(playerid, true);
	    TogglePlayerControllable(playerid, true);
	    return;
	}

	if(IntroductionPart[playerid] == 1)
	{
	    TogglePlayerControllable(playerid, false);
	    SetPlayerVirtualWorld(playerid, HISTORY_VIRTUAL_WORLD);
        SetPlayerCameraPos(playerid, -1988.0491, 150.4515, 27.5391);
        SetPlayerCameraLookAt(playerid, -1983.3894, 152.8307, 27.6875);
		tdintro[playerid] = TextDrawCreate(320.0, 130.0, "Virtual Society Team presents");
		TextDrawFont(tdintro[playerid], 1);
		TextDrawLetterSize(tdintro[playerid], 0.5, 1.2);
		TextDrawAlignment(tdintro[playerid], 2);
		TextDrawColour(tdintro[playerid], COLOUR_WHITE);
		TextDrawShowForPlayer(playerid, tdintro[playerid]);
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 2)
	{
	    TextDrawSetString(tdintro[playerid], " ");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 3)
	{
	    TextDrawSetString(tdintro[playerid], "A Virtual Society Team production");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 4)
	{
	    TextDrawSetString(tdintro[playerid], " ");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 5)
	{
	    TextDrawSetString(tdintro[playerid], "Project leaders:~n~Jairo Marques aka Texugo~n~Rafael Ravedutti aka HDisk");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 6)
	{
	    TextDrawSetString(tdintro[playerid], " ");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 7)
	{
	    TextDrawSetString(tdintro[playerid], "Virtual Society Team integrants:~n~Michael~n~Brutows~n~Keninho~n~Ventania~n~Lorenzo~n~Guilherme~n~Osorkon");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 8)
	{
	    TextDrawSetString(tdintro[playerid], " ");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 9)
	{
	    TextDrawSetString(tdintro[playerid], "Special Thanks:~n~Rockstar Games~n~SA:MP Team~n~Brazucas'Server");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 10)
	{
	    TextDrawDestroy(tdintro[playerid]);
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 11)
	{
	    tdintro[playerid] = TextDrawCreate(320.0, 130.0, "~b~Virtual ~y~Society ~w~~h~R~r~P~g~G");
	    TextDrawFont(tdintro[playerid], 1);
	    TextDrawLetterSize(tdintro[playerid], 2.2, 4.8);
		TextDrawAlignment(tdintro[playerid], 2);
		TextDrawColour(tdintro[playerid], COLOUR_WHITE);
		TextDrawShowForPlayer(playerid, tdintro[playerid]);
		time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 12)
	{
	    TextDrawDestroy(tdintro[playerid]);
	    time = 1500;
	}
	
	else if(IntroductionPart[playerid] == 13)
	{
	    TextDrawShowForPlayer(playerid, tdlogo);
        SetTimerEx("DissolveTextBlack", 10, false, "dd", playerid, 0xFF);
        time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 14)
	{
	    ShowTextForPlayer(playerid, "San Fierro - Cranberry Station - 1993", 320.0, 130.0, COLOUR_WHITE, 1, 0.5, 1.2, 1, 2, 2000);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 15)
	{
	    TextDrawDestroy(tdintro[playerid]);
	    tdintro[playerid] = TextDrawCreate(370.0, 400.0, "Alo!");
		TextDrawFont(tdintro[playerid], 1);
		TextDrawLetterSize(tdintro[playerid], 0.5, 1.5);
		TextDrawSetShadow(tdintro[playerid], 1);
		TextDrawAlignment(tdintro[playerid], 2);
		TextDrawColour(tdintro[playerid], COLOUR_WHITE);
		TextDrawShowForPlayer(playerid, tdintro[playerid]);
	    time = 1000;
	}
	
	else if(IntroductionPart[playerid] == 16)
	{
		TextDrawSetString(tdintro[playerid], "~b~Hei, cara, como vai?");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 17)
	{
		TextDrawSetString(tdintro[playerid], "Heei, Rafael, tudo bem, mas poderia ~n~estar melhor...");
	    time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 18)
	{
		TextDrawSetString(tdintro[playerid], "~b~Pois e, sinto muito pelo que houve, ~n~vou sentir sua falta amigo...");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 19)
	{
		TextDrawSetString(tdintro[playerid], "Eu tambem vou, ser expulso de Liberty City, ~n~nao poderia ter sido pior para mim...");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 20)
	{
		TextDrawSetString(tdintro[playerid], "~b~Ah cara, esses mafiosos vao pagar algum dia. ~n~Eai, ja fez planos?");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 21)
	{
		TextDrawSetString(tdintro[playerid], "Sim, estou em San Fierro, vou pegar um aviao e ~n~recomecar minha vida em Los Santos.");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 22)
	{
		TextDrawSetString(tdintro[playerid], "~b~Hmm, boa sorte amigo, vou realmente sentir ~n~sua falta.");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 23)
	{
		TextDrawSetString(tdintro[playerid], "Eu tambem, Rafael... Ate mais, amigo, mande ~n~abracos ao Jairo por mim!");
	    time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 24)
	{
		TextDrawSetString(tdintro[playerid], "~b~OK, ate mais...");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 25)
	{
	    TextDrawDestroy(tdintro[playerid]);
	    tdintro[playerid] = Text:INVALID_TEXT_DRAW;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		time = 2000;
	}

	else if(IntroductionPart[playerid] == 26)
	{
	    SetPlayerCameraPos(playerid, -1982.8894, 153.3307, 27.6875);
        SetPlayerCameraLookAt(playerid, -1994.0032, 157.1385, 27.3179);
		time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 27)
	{
	    SetTimerEx("SolveTextBlack", 10, false, "dd", playerid, 0x00);
		SetTimerEx("DissolveTextBlack", 1000 + (100 * 0x10), false, "dd", playerid, 0xFF);
		time = 2500;
	}
	
	else if(IntroductionPart[playerid] == 28)
	{
	    PutPlayerInVehicle(playerid, TAXI_HISTORY[1], 2);
	    SetPlayerCameraPos(playerid, -1452.4569, -277.4644, 13.6411);
        SetPlayerCameraLookAt(playerid, -1447.8182,	-281.7279, 13.7789);
		time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 29)
	{
	    ShowTextForPlayer(playerid, "Valeu, parceiro.", 370.0, 400.0, COLOUR_WHITE, 1, 0.5, 1.5, 1, 2, 1500);
	    RemovePlayerFromVehicle(playerid);
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 30)
	{
	    SetPlayerCameraPos(playerid, -1447.8805, -285.5394, 15.0000);
        SetPlayerCameraLookAt(playerid, -1442.6841, -275.5715, 15.1484);
        SetPlayerFacingAngle(playerid, 337.5115);
	    time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 31)
	{
	    SetTimerEx("SolveTextBlack", 10, false, "dd", playerid, 0x00);
		SetTimerEx("DissolveTextBlack", 1000 + (100 * 0x10), false, "dd", playerid, 0xFF);
		time = 2500;
	}
	
	else if(IntroductionPart[playerid] == 32)
	{
	    SetPlayerPos(playerid, 1686.0055, -2239.6494, 13.5469);
	    SetPlayerFacingAngle(playerid, 176.8181);
		SetPlayerCameraPos(playerid, 1589.3588, -2300.8518, 13.5336);
        SetPlayerCameraLookAt(playerid, 1626.7275, -2332.2927, 13.5469);
		ShowTextForPlayer(playerid, "Los Santos International Airport - 1993", 320.0, 130.0, COLOUR_WHITE, 1, 0.5, 1.2, 1, 2, 2000);
        time = 7500;
	}
	
	else if(IntroductionPart[playerid] == 33)
	{
	    SetPlayerVirtualWorld(playerid, 0);
		SetPlayerCameraPos(playerid, 1702.7306, -2240.2883, 13.5396);
        SetPlayerCameraLookAt(playerid, 1686.0055, -2239.6494, 13.5469);
        IntroductionPart[playerid] = -1;
        time = 4000;
	}
	
	++IntroductionPart[playerid];
 	SetTimerEx("Introducing", time, false, "d", playerid);
}

public ShowTextForPlayer(playerid, content[], Float:X, Float:Y, colour, font, Float:sizeX, Float:sizeY, shadow, alignment, time)
{
	new Text:td;
	
	td = TextDrawCreate(X, Y, content);
	TextDrawColour(td, colour);
	TextDrawFont(td, font);
	TextDrawLetterSize(td, sizeX, sizeY);
	TextDrawSetShadow(td, shadow);
	TextDrawAlignment(td, alignment);
	TextDrawShowForPlayer(playerid, td);
	
	SetTimerEx("DestroyTextDraw", time, false, "d", _:td);
}

public ShowTextForAll(content[], Float:X, Float:Y, colour, font, Float:sizeX, Float:sizeY, shadow, alignment, time)
{
	new Text:td;

	td = TextDrawCreate(X, Y, content);
	TextDrawColour(td, colour);
	TextDrawFont(td, font);
	TextDrawLetterSize(td, sizeX, sizeY);
	TextDrawSetShadow(td, shadow);
	TextDrawAlignment(td, alignment);
	TextDrawShowForAll(td);

	SetTimerEx("DestroyTextDraw", time, false, "d", _:td);
}

public DestroyTextDraw(textid)
	TextDrawDestroy(Text:textid);

public SolveTextBlack(playerid, alpha)
{
	new nalpha;

	nalpha = alpha + 0x11;
	
	if(nalpha > 0xEE)
	{
	    TextDrawHideForPlayer(playerid, tdblack);
	    TextDrawBoxColour(tdblack, 0x000000FF);
	    TextDrawShowForPlayer(playerid, tdblack);
	    return;
	}
	
	TextDrawHideForPlayer(playerid, tdblack);
	TextDrawBoxColour(tdblack, 0x00 | nalpha);
	TextDrawShowForPlayer(playerid, tdblack);
	
	SetTimerEx("SolveTextBlack", 100, false, "dd", playerid, nalpha);
}

public DissolveTextBlack(playerid, alpha)
{
	new nalpha;

	nalpha = alpha - 0x11;
	
	if(nalpha < 0x11)
	{
	    TextDrawHideForPlayer(playerid, tdblack);
	    TextDrawBoxColour(tdblack, 0x000000FF);
	    return;
	}
	
	TextDrawHideForPlayer(playerid, tdblack);
	TextDrawBoxColour(tdblack, 0x00 | nalpha);
	TextDrawShowForPlayer(playerid, tdblack);
	
	SetTimerEx("DissolveTextBlack", 100, false, "dd", playerid, nalpha);
}

public DissolveTextWhite(playerid, alpha)
{
	new nalpha;

	nalpha = alpha - 0x11;

	if(nalpha < 0x11)
	{
	    TextDrawHideForPlayer(playerid, tdwhite);
	    TextDrawBoxColour(tdwhite, 0xFFFFFFFF);
	    return;
	}

	TextDrawHideForPlayer(playerid, tdwhite);
	TextDrawBoxColour(tdwhite, 0xFFFFFF00 | nalpha);
	TextDrawShowForPlayer(playerid, tdwhite);

	SetTimerEx("DissolveTextWhite", 100, false, "dd", playerid, nalpha);
}

public ShowTextRed(playerid)
{
	TextDrawShowForPlayer(playerid, tdred);
}

public HideTextRed(playerid)
{
    TextDrawHideForPlayer(playerid, tdred);
}

public ShowTextGray(playerid)
{
	HideTextGray(playerid);
	TextDrawShowForPlayer(playerid, tdgray);
}

public HideTextGray(playerid)
{
    TextDrawHideForPlayer(playerid, tdgray);
}

public ShowTextLightGray(playerid)
{
	HideTextLightGray(playerid);
	TextDrawShowForPlayer(playerid, tdlightgray);
}

public HideTextLightGray(playerid)
{
    TextDrawHideForPlayer(playerid, tdlightgray);
}

public TakeObject(objectid)
	DestroyObject(objectid);
	
public StopAnimation(playerid)
	ClearAnimations(playerid);
	
public VoteKick()
{
    new string[128];
    
	if(Votes >= PlayerCount)
	{
	    format(string, sizeof string, "[VOTEKICK] Votação para kickar %s sucedida, jogador kickado do servidor.", PlayerName(VoteKickPlayer));
	    SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
	    Kick(VoteKickPlayer);
	}
	else
	{
	    format(string, sizeof string, "[VOTEKICK] Votação para kickar %s falhada, a quantidade de votos necessária não foi atendida.", PlayerName(VoteKickPlayer));
		SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
	}
	
	Votes = 0;
	VoteKickPlayer = -1;
	
	for(new i = 0; i < MAX_SLOTS; i++)
	    Voted[i] = 0;
	
	PlayerCount = 0;
	KillTimer(VoteKickTimer);
}

public Speedometer()
{
    for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerInAnyVehicle(n) && GetPlayerState(n) == PLAYER_STATE_DRIVER)
	    {
	        new string[128];
			new vehid;
	        new Float:V, Float:VP[3];
	        
	        vehid = GetPlayerVehicleID(n);
			GetVehiclePos(vehid, VP[0], VP[1], VP[2]);
			V = GetDistance2D(VP[0], VP[1], VCoords[n][0], VCoords[n][1]) * 2 * 3.6;
			format(string, sizeof string, "%dkm/h", floatround(V));
			TextDrawSetString(tdspeed[n], string);
			
			for(new p = 0; p < 2; p++)
			    VCoords[n][p] = VP[p];
	    }
	}
}

public Gasometer()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerInAnyVehicle(n) && GetPlayerState(n) == PLAYER_STATE_DRIVER)
	    {
	        new vehid, F;
	        new Float:H;
	        
	        vehid = GetPlayerVehicleID(n);
	        F = GetVehicleFuel(vehid);
	        GetVehicleHealth(vehid, H);
	        VCounter[n] = (VCounter[n] + 1) % 60;

			if(F == 0)
			{
			    if(!(VFrozenFlags[n] & VFROZEN_NO_GAS))
			    {
			        if(VFrozenFlags[n] == 0)
			        {
			    		TogglePlayerControllable(n, false);
			    		TextDrawShowForPlayer(n, tdvehicle);
					}
					
					VFrozenFlags[n] |= VFROZEN_NO_GAS;
			    	ShowTextForPlayer(n, "Veiculo sem combustivel.", 318.0, 300.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 3000);
				}
			}
			
	        else if(VCounter[n] == 0)
	        {
	            if(F > 0 && F <= 100)
	            {
	            	F = F - 1;
	            	SetVehicleFuel(vehid, F);
	            }
			}
			
			if(floatround(H) != VHealthText[n])
			    UpdatePlayerHealthText(n);
	    }
	}
}

public Fueling(playerid, vehicleid, start, amount, textid)
{
	new string[128];
	new liters, total;

	liters = random(3) + 1;

	if(amount < liters)
	    liters = amount;

	amount -= liters;
	total = GetVehicleFuel(vehicleid) + liters;

	if(total > 100)
	    total = 100;

	SetVehicleFuel(vehicleid, total);

	if(amount)
	{
	    format(string, sizeof string, "~b~Litros: ~w~%d~b~L~n~Total: ~w~%d~b~L~n~Preco: ~w~$%d,00", total - start, total, (total - start) * FUEL_COST);
	    TextDrawSetString(Text:textid, string);
		SetTimerEx("Fueling", 300, false, "ddddd", playerid, vehicleid, start, amount, textid);
	}
	
	else
	{
	    TextDrawDestroy(Text:textid);
	    ShowTextForPlayer(playerid, "Veiculo abastecido.", 318.0, 309.0, COLOUR_GREEN, 1, 0.5, 1.5, 1, 2, 2000);
	    VFrozenFlags[playerid] &= ~VFROZEN_FUEL;
	    
	    if(VFrozenFlags[playerid] == 0)
	    	TogglePlayerControllable(playerid, true);
	}
}

public Repairing(playerid, vehicleid, value, textid)
{
	new string[128];
	new Float:health, Float:total;
	
	GetVehicleHealth(vehicleid, health);
	total = health + 10.0;
	
	if(total >= 1000.0)
	{
	    TextDrawDestroy(Text:textid);
	    SetVehicleHealth(vehicleid, 1000.0);
	    RepairVehicle(vehicleid);
	    VFrozenFlags[playerid] &= ~VFROZEN_REPAIR;
	    
	    if(VFrozenFlags[playerid] == 0)
	    	TogglePlayerControllable(playerid, true);
	}
	
	else
	{
		value += 5;
		format(string, sizeof string, "~g~Integridade: ~w~%d~g~%%~n~Preco: ~w~$%d,00", floatround(total / 10.0), value);
		TextDrawSetString(Text:textid, string);
		SetVehicleHealth(vehicleid, total);
		SetTimerEx("Repairing", 150, false, "dddd", playerid, vehicleid, value, textid);
	}
}

public Painting(playerid, vehicleid)
{
	new colours[2], stage, key, up_down, left_right;

	if(!IsPlayerInVehicle(playerid, vehicleid))
	{
	    KillTimer(PaintTimer[playerid]);
	    PaintStage[playerid] = 0;
	    GetVehicleColours(vehicleid, colours[0], colours[1]);
	    ChangeVehicleColour(vehicleid, colours[0], colours[1]);
	    TextDrawHideForPlayer(playerid, tdarrows);
	    return;
	}

	GetPlayerKeys(playerid, key, up_down, left_right);

	if(left_right != 0)
	{
	    stage = PaintStage[playerid];
	    decode_vehicle_colours(PaintColours[playerid], colours[0], colours[1]);

		if(left_right == KEY_RIGHT)
			colours[stage] = (colours[stage] + 1) % 300;
		
		if(left_right == KEY_LEFT)
		    colours[stage] = (colours[stage] - 1) % 300;
		    
		PaintColours[playerid] = encode_vehicle_colours(colours[0], colours[1]);
	    ChangeVehicleColour(vehicleid, colours[0], colours[1]);
	}
	
	if(key & KEY_SPRINT)
	{
	    PaintStage[playerid]++;
		PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
		
		if(PaintStage[playerid] >= sizeof colours)
		{
		    VFrozenFlags[playerid] &= ~VFROZEN_PAINT;
		    
		    if(VFrozenFlags[playerid] == 0)
		        TogglePlayerControllable(playerid, true);
		        
		    KillTimer(PaintTimer[playerid]);
		    PaintStage[playerid] = 0;
		    SetVehicleColoursEncoded(vehicleid, PaintColours[playerid]);
		    TextDrawHideForPlayer(playerid, tdarrows);
	    	return;
		}
	}
}

stock DeletePlayerFuelText(playerid)
{
	new textid;
    new bool:delete;

	textid = VFuelText[playerid];
	
	if(textid == -1)
	    return;
	    
	if(tdgasmeter[textid] == Text:INVALID_TEXT_DRAW)
	    return;
	    
	delete = true;

	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid)
	    {
	        if(GetPlayerState(n) == PLAYER_STATE_DRIVER && VFuelText[n] == textid)
	        {
	            delete = false;
	            break;
	        }
	    }
	}

    TextDrawHideForPlayer(playerid, tdgasmeter[textid]);
    
	if(delete)
	{
	    TextDrawDestroy(tdgasmeter[textid]);
	    tdgasmeter[textid] = Text:INVALID_TEXT_DRAW;
	}
	
	VFuelText[playerid] = -1;
}

stock UpdatePlayerFuelText(playerid)
{
	new fuel;
	
	if(IsPlayerInAnyVehicle(playerid))
	{
	    fuel = GetVehicleFuel(GetPlayerVehicleID(playerid));
	    
		if(fuel < 0)
		    fuel = 0;
		    
		if(fuel >= sizeof tdgasmeter)
	    	fuel = sizeof tdgasmeter - 1;
	    
	    if(VFuelText[playerid] == fuel)
	        return;
	        
        DeletePlayerFuelText(playerid);
        if(tdgasmeter[fuel] == Text:INVALID_TEXT_DRAW)
		{
			tdgasmeter[fuel] = TextDrawCreate(184.0, 410.0 - (fuel * 0.65), "-");
 			TextDrawFont(tdgasmeter[fuel], 1);
 			TextDrawBoxColour(tdgasmeter[fuel], COLOUR_WHITE);
 			TextDrawLetterSize(tdgasmeter[fuel], 1.3, 1.0);
 			TextDrawSetShadow(tdgasmeter[fuel], 0);
		}
		
		TextDrawShowForPlayer(playerid, tdgasmeter[fuel]);
 		VFuelText[playerid] = fuel;
	}
	
	else
	    DeletePlayerFuelText(playerid);
}

stock UpdatePlayerHealthText(playerid)
{
	new colour;
	new Float:health;
	
	if(tdhealthbar[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawDestroy(tdhealthbar[playerid]);
	    tdhealthbar[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(IsPlayerInAnyVehicle(playerid))
	{
	    GetVehicleHealth(GetPlayerVehicleID(playerid), health);
	    
	    if(health < 250.0)
	        health = 250.0;
	        
	    colour = 	(floatround((1000.0 - health) / 2.94117647) & 0xFF) << 24 |
					(floatround((health - 250.0) / 2.94117647) & 0xFF) << 16 | 0x77;
					
		tdhealthbar[playerid] = TextDrawCreate(219.5, 393.0, "_");
		TextDrawUseBox(tdhealthbar[playerid], true);
 		TextDrawBoxColour(tdhealthbar[playerid], colour);
 		TextDrawLetterSize(tdhealthbar[playerid], 0.0, 0.3);
    	TextDrawTextSize(tdhealthbar[playerid], 218.0 + (0.133333333 * (health - 250.0)), 0.0);
    	TextDrawShowForPlayer(playerid, tdhealthbar[playerid]);
    	VHealthText[playerid] = floatround(health);
	}
}

public CheckpointHandler()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
			new Float:X, Float:Y, Float:Z, Float:dis, cpid;

			cpid = -1;
            dis = 1000.000;
			GetPlayerPos(n, X, Y, Z);

			for(new cp = 0; cp < sizeof Checkpoints; cp++)
			{
			    new Float:d, world;

				if(GetPlayerInterior(n) != Checkpoints[cp][cpInt])
					continue;

				world = Checkpoints[cp][cpVirtualWorld];

				if(world != 0 && GetPlayerVirtualWorld(n) != world)
				    continue;

				d = GetDistance(X, Y, Z, Checkpoints[cp][cpX], Checkpoints[cp][cpY], Checkpoints[cp][cpZ]);

				if(d < dis && d < Checkpoints[cp][cpRadi])
				{
				    cpid = cp;
					dis = d;
				}
			}

			if(cpid != Checkpoint[n])
			{
			    DisablePlayerCheckpoint(n);
                Checkpoint[n] = cpid;

			    if(cpid != -1)
			    {
					CheckpointStatus[n] = Checkpoints[cpid][cpId];
			    	SetPlayerCheckpoint(n, Checkpoints[cpid][cpX], Checkpoints[cpid][cpY], Checkpoints[cpid][cpZ], Checkpoints[cpid][cpSize]);
				}

				else
					CheckpointStatus[n] = CHECKPOINT_NONE;
			}
	    }
	}
}

public MapIconHandler()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
			new Float:X, Float:Y, Float:Z, mi;
			
			GetPlayerPos(n, X, Y, Z);

			for(new x = 0; x < MAX_MAP_ICONS; x++)
			    RemovePlayerMapIcon(n, x);
			    
			for(new area = 0; area < sizeof Areas; area++)
			{
			    if(mi >= MAX_MAP_ICONS)
			        break;

                if(Areas[area][areaMapIconId] != 0)
			    {
			    	if(GetDistance(X, Y, Z, Areas[area][areaX], Areas[area][areaY], Areas[area][areaZ]) < MAP_ICON_RADIUS)
			    	{
			        	SetPlayerMapIcon(n, mi, Areas[area][areaX], Areas[area][areaY], Areas[area][areaZ], Areas[area][areaMapIconId], 0xE6E6E6E6);
						mi = mi + 1;
					}
				}
			}
			
			for(new company = 0; company < sizeof Companies; company++)
			{
			    if(mi >= MAX_MAP_ICONS)
			        break;

                if(Companies[company][cMapIconId] != 0)
			    {
			    	if(GetDistance(X, Y, Z, Companies[company][cX], Companies[company][cY], Companies[company][cZ]) < MAP_ICON_RADIUS)
			    	{
			        	SetPlayerMapIcon(n, mi, Companies[company][cX], Companies[company][cY], Companies[company][cZ], Companies[company][cMapIconId], 0xE6E6E6E6);
						mi = mi + 1;
					}
				}
			}
			
			for(new enter = 0; enter < sizeof Enters; enter++)
			{
			    if(mi >= MAX_MAP_ICONS)
			        break;
			        
			    new int;

				int = Enters[enter][intId];

                if(Ints[int][intMapIconId] != 0)
			    {
			    	if(GetDistance(X, Y, Z, Enters[enter][enterX], Enters[enter][enterY], Enters[enter][enterZ]) < MAP_ICON_RADIUS)
			    	{
			        	SetPlayerMapIcon(n, mi, Enters[enter][enterX], Enters[enter][enterY], Enters[enter][enterZ], Ints[int][intMapIconId], 0xE6E6E6E6);
						mi = mi + 1;
					}
				}
			}
	    }
	}
}

public CTMHandler()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        new vid, model;
	        new Float:X, Float:Y, Float:Z, Float:VX, Float:VY, Float:VZ, Float:dis;
	        
	        vid = -1;
	        dis = 5.0;
	        GetPlayerPos(n, X, Y, Z);
	        
	       	for(new v = 0; v < sizeof ON_SALE; v++)
	       	{
	       	    new Float:vdis;

	            GetVehiclePos(ON_SALE[v], VX, VY, VZ);
	            vdis = GetDistance(X, Y, Z, VX, VY, VZ);

	            if(vdis < dis)
	            {
	                dis = vdis;
	                vid = v;
	            }
		        
		        if(vid != CTMVehicle[n])
		        {
		            CTMVehicle[n] = vid;
		            model = GetVehicleModel(ON_SALE[vid]) - 400;
		            
		            if(tdctm[n] != Text:INVALID_TEXT_DRAW)
		            {
		                TextDrawDestroy(tdctm[n]);
						tdctm[n] = Text:INVALID_TEXT_DRAW;
					}
					
					if(vid != -1)
					{
					    new string[128];
					    
					    format(string, sizeof string, "~y~~h~Modelo: ~w~%s~n~~y~~h~Valor: ~w~$%d,00 dolares~n~~g~Uso: /veiculo comprar",	Vehicles[model][vehModel],
					                                                                                                        				Vehicles[model][vehValue] );
					                                                                                                        
					    tdctm[n] = TextDrawCreate(22.0, 107.0, string);
					    TextDrawFont(tdctm[n], 1);
						TextDrawLetterSize(tdctm[n], 0.3, 1.3);
						TextDrawAlignment(tdctm[n], 1);
						TextDrawSetShadow(tdctm[n], 1);
						TextDrawUseBox(tdctm[n], true);
						TextDrawBoxColour(tdctm[n], 0x000000AA);
						TextDrawTextSize(tdctm[n], 213.0, 0.0);
					    TextDrawShowForPlayer(n, tdctm[n]);
					}
				}
			}
	    }
	}
}

public AreaHandler()
{
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    if(IsPlayerConnected(i) && IsPlayerLogged(i))
	    {
	        new Float:X, Float:Y, Float:Z;

			GetPlayerPos(i, X, Y, Z);
	        	
	        if(IsPlayerInAnyVehicle(i))
	        {
	            if(Door[i] != -1)
	            {
	            	Door[i] = -1;
	            	TextDrawHideForPlayer(i, tdjoin);
				}
				
				if(Company[i] != 0)
				    Company[i] = 0;
	        }
	        
	        else
	        {
				if(Door[i] != -1)
				{
				    if(GetDistance(X, Y, Z, Enters[Door[i]][enterX], Enters[Door[i]][enterY], Enters[Door[i]][enterZ]) > 2.5)
				    {
				        Door[i] = -1;
				        TextDrawHideForPlayer(i, tdjoin);
					}
				}
				else
				{
				    for(new e = 0; e < sizeof Enters; e++)
				    {
				        if(GetDistance(X, Y, Z, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ]) <= 2.5)
				        {
				            Door[i] = e;
				            TextDrawShowForPlayer(i, tdjoin);
						}
				    }
				}
			
				if(Enter[i] != -1)
				{
			    	new int;

					int = Enters[Enter[i]][intId];
			    
			    	TextDrawHideForPlayer(i, tdexit);
			    
       				if(GetDistance(X, Y, Z, Ints[int][intX], Ints[int][intY], Ints[int][intZ]) <= 2.5)
       				    TextDrawShowForPlayer(i, tdexit);
				}
			
				if(Company[i] == 0)
	        	{
	        		for(new c = 1; c < sizeof Companies; c++)
	        		{
	    	    	    if(GetDistance(X, Y, Z, Companies[c][cX], Companies[c][cY], Companies[c][cZ]) <= 10.0)
		        	    {
		        	        new jobid, string[128], SN[4][64];

		        	        Company[i] = c;
		        	        jobid = Companies[c][cJob];

							if(hGetInt(GetPlayerXFilePath(i), "Job") == jobid)
							    break;

	        		        SN[0] = (Companies[c][cValue] == 0) ? ("Sim") : ("Não");
	    	    	        SN[1] = (Jobs[jobid][jobHabT] == 1) ? ("Sim") : ("Não");
		        	        SN[2] = (Jobs[jobid][jobHabN] == 1) ? ("Sim") : ("Não");
		        	        SN[3] = (Jobs[jobid][jobHabA] == 1) ? ("Sim") : ("Não");

	        		        format(string, sizeof string, "------ [ %s \"%s\" ] ------", Companies[c][cType], Companies[c][cName]);
	        		        SendClientMessage(i, COLOUR_LIGHT_YELLOW, string);
	        		        format(string, sizeof string, "[INFORMACOES] Emprego: %s - Salário: $%d,00 dólares - Público: %s - Tempo de contrato: 720h (minutos reais)", Jobs[jobid][jobName], Jobs[jobid][jobPayday], SN[0]);
	        		        SendClientMessage(i, COLOUR_WHITE, string);
	        		        format(string, sizeof string, "[REQUISITOS] Experiência profissional: %d - Habilitação terrestre: %s - Habilitação naútica: %s - Habilitação aérea: %s", Jobs[jobid][jobLevel], SN[1], SN[2], SN[3]);
	    	    	        SendClientMessage(i, COLOUR_WHITE, string);
		        	        SendClientMessage(i, COLOUR_LIGHT_YELLOW, "Para assinar um contrato com a empresa digite /assinar");
		        	        break;
		            	}
		        	}
				}

				else
				{
				    if(GetDistance(X, Y, Z, Companies[Company[i]][cX], Companies[Company[i]][cY], Companies[Company[i]][cZ]) > 10.0)
				        Company[i] = 0;
				}
	        }
	        
	        if(Area[i] != AREA_NULL)
	        {
	            new bool:inarea;
	            
	            inarea = false;
	            
	            for(new a = 0; a < sizeof Areas; a++)
	            {
					if(!inarea && Areas[a][areaId] == Area[i])
					{
	                	if(GetDistance(X, Y, Z, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ]) < Areas[a][areaRadi])
	                	    inarea = true;
					}
	            }
	            
	            if(!inarea)
					Area[i] = AREA_NULL;
	        }
	        
	        else
	        {
	            for(new a = 0; a < sizeof Areas; a++)
	            {
            		if(GetDistance(X, Y, Z, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ]) < Areas[a][areaRadi])
            		{
            		    Area[i] = Areas[a][areaId];

						if(Area[i] == AREA_CUSTOM_SHOP)
            		        ShowTextForPlayer(i, "Uso: ~b~~h~/oficina ~w~para customizar ~n~seu veiculo", 606.0, 126.0, COLOUR_WHITE, 1, 0.3, 1.1, 1, 3, 4000);

						else if(Area[i] == AREA_MOD_SHOP)
            		        ShowTextForPlayer(i, "Pressione ~b~~h~Espaco ~w~para modificar ~n~seu veiculo", 606.0, 126.0, COLOUR_WHITE, 1, 0.3, 1.1, 1, 3, 4000);

						else if(Area[i] == AREA_GAS_STATION)
							ShowTextForPlayer(i, "Uso: ~g~/abastecer ~w~para ~n~abastecer seu veiculo", 606.0, 126.0, COLOUR_WHITE, 1, 0.3, 1.1, 1, 3, 4000);
            		    
            		    break;
					}
	            }
	        }
		}
	}
}

public ZoneHandler()
{
	new Float:X, Float:Y, Float:Z;

	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        if(GetPlayerInterior(n) != 0)
	        {
	            if(Zone[n] != -1)
	            {
	                Zone[n] = -1;
				    TextDrawDestroy(tdzone[n]);
				    tdzone[n] = Text:INVALID_TEXT_DRAW;
	            }
	            
				continue;
	        }
	        
			GetPlayerPos(n, X, Y, Z);

			if(Zone[n] != -1)
   			{
				if(	X < GangZones[Zone[n]][gzMinX] ||
				    X > GangZones[Zone[n]][gzMaxX] ||
				    Y < GangZones[Zone[n]][gzMinY] ||
				    Y > GangZones[Zone[n]][gzMaxY]      )
				{
				    Zone[n] = -1;
				    GangAttack[n] = -1;
				    KillTimer(GangAttackTimer[n]);
				    TextDrawDestroy(tdzone[n]);
				    tdzone[n] = Text:INVALID_TEXT_DRAW;
				}
			}

			else
			{
				for(new z = 0; z < sizeof GangZones; z++)
				{
					if( X >= GangZones[z][gzMinX] &&
					    X <= GangZones[z][gzMaxX] &&
					    Y >= GangZones[z][gzMinY] &&
					    Y <= GangZones[z][gzMaxY]   	)
					{
					    if(tdzone[n] != Text:INVALID_TEXT_DRAW)
					    	TextDrawDestroy(tdzone[n]);

						new pgang, domain, amount;
						
						Zone[n] = z;
						pgang = GetPlayerGang(n);
						domain = GetZoneDomain(z);
					    
					    if(pgang != 0 && pgang != domain)
					    {
					    	for(new p = 0; p < MAX_SLOTS; p++)
					    	{
					    	    if(GetPlayerGang(p) == domain)
					    	    {
					    	        if(Zone[p] == z)
					    	        {
					    	            amount = 0;
					    	            break;
					    	        }
					    	        
					    	        amount = amount + 1;
								}
					    	}
					    
					    	if(amount > 2)
					    	{
								SendClientMessage(n, COLOUR_SKY_BLUE, "Você pode atacar esse território, apenas permaneça nele...");
								GangAttack[n] = -1;
								GangAttackTimer[n] = SetTimerEx("AttackTerritory", 60000, false, "d", n);
					    	}
						}
						
					    tdzone[n] = TextDrawCreate(638.0, 341.0, " ");
						TextDrawAlignment(tdzone[n], 3);
						TextDrawBackgroundColour(tdzone[n], 0xFFFFFF99);
						TextDrawFont(tdzone[n], 1);
						TextDrawLetterSize(tdzone[n], 0.4, 1.2);
						TextDrawColour(tdzone[n], 0xFFFFFFFF);
						TextDrawSetOutline(tdzone[n], 1);
						TextDrawSetProportional(tdzone[n], 1);
						TextDrawSetShadow(tdzone[n], 1);
					    TextDrawShowForPlayer(n, tdzone[n]);
						UpdatePlayerZoneText(n);
					    break;
					}
				}
			}
		}
	}
}

public DroppedWeaponHandler()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
		if(IsPlayerConnected(n) && IsPlayerLogged(n))
		{
		    if(IsPlayerInAnyVehicle(n))
	    	{
	    	    if(DroppedWeapon[n] != -1)
	    	    {
	    	        DroppedWeapon[n] = -1;
	    	        TextDrawHideForPlayer(n, tdgun);
	    	    }
	    	}
	    	
	    	else
	    	{
		    	new dw;
		    	new Float:dis, Float:X, Float:Y, Float:Z, Float:OX, Float:OY, Float:OZ;
		    
		    	GetPlayerPos(n, X, Y, Z);
		    
		    	if(DroppedWeapon[n] != -1)
		    	{
		    	    dw = DroppedWeapon[n];
		    	    GetObjectPos(DroppedWeapons[dw][dwObjectId], OX, OY, OZ);
		    	    
		    	    dis = GetDistance(X, Y, Z, OX, OY, OZ);

			        if(dis > DROPPED_WEAPON_DISTANCE)
			        {
			            DroppedWeapon[n] = -1;
				        TextDrawHideForPlayer(n, tdgun);
			        }
			    }

			    else
			    {
			    	dw = -1;
			    	dis = DROPPED_WEAPON_DISTANCE;

			    	for(new id = 0; id < MAX_DROPPED_WEAPONS; id++)
			    	{
			    	    if(DroppedWeapons[id][dwExist] == 1)
			    	    {
			    	        new Float:odis;

				            GetObjectPos(DroppedWeapons[id][dwObjectId], OX, OY, OZ);

				            odis = GetDistance(X, Y, Z, OX, OY, OZ);

							if(odis <= dis)
							{
							    dw = id;
							    dis = odis;
							}
				        }
				    }

				    if(dw != -1)
				    {
				        DroppedWeapon[n] = dw;
				        TextDrawShowForPlayer(n, tdgun);
				    }
				}
			}
		}
	}
}

public HouseHandler()
{
	new hpath[128];
	new Float:X, Float:Y, Float:Z, Float:dis;
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        GetPlayerPos(n, X, Y, Z);
	        
	        if(GetPlayerInterior(n) == 0)
	        {
	            new Float:HX, Float:HY, Float:HZ, Float:HA;
	            
				if(House[n] != -1)
				{
					LoadHousePos(House[n], HX, HY, HZ, HA);

					dis = GetDistance(X, Y, Z, HX, HY, HZ);
				                	
					if(dis > HOUSE_RADIUS)
					{
					    House[n] = -1;
						TextDrawHideForPlayer(n, tdjoin);
					    TextDrawDestroy(tdhouse[n]);
					    tdhouse[n] = Text:INVALID_TEXT_DRAW;
					}
				}
			
				else
				{
				    if(tdhouse[n] != Text:INVALID_TEXT_DRAW)
				        TextDrawDestroy(tdhouse[n]);
			        
	        		dis = HOUSE_RADIUS;
	        
					for(new id = 0; id < GetHouses(); id++)
					{
	        		    hpath = GetHouseFilePath(id);

			            if(hGetInt(hpath, "Deleted") == 0)
			            {
			                new Float:hdis;

		                    LoadHousePos(id, HX, HY, HZ, HA);
	                    
		                    hdis = GetDistance(X, Y, Z, HX, HY, HZ);
             									
							if(hdis <= dis)
							{
							    House[n] = id;
							    dis = hdis;
							}
		            	}
					}
				
					if(House[n] != -1)
					{
					    new string[128], onsale;
				    
					    hpath = GetHouseFilePath(House[n]);
					    onsale = hGetInt(hpath, "OnSale");
				    
					    if(onsale != 2)
					    {
					        new SN[128];
					    	SN = onsale ? ("Sim") : ("Nao");
				    		format(string, sizeof string, "~b~Proprietario:~n~~w~%s~n~~b~Valor:~n~~w~$%d,00~n~~b~A venda:~n~~w~%s", hGetString(hpath, "Owner"),
       																																hGetInt(hpath, "Value"),
				    	                                                                                                        	SN);
						}
						else
						{
						    format(string, sizeof string, "~g~Casa a venda~n~~b~Valor:~n~~w~$%d,00~n~~b~Tratar com:~n~~w~%s", 		hGetInt(hpath, "Value"),
																																	hGetString(hpath, "Owner"));
						}
				    
				    	tdhouse[n] = TextDrawCreate(23, 213, string);
						TextDrawTextSize(tdhouse[n], 140.0, 0.0);
						TextDrawAlignment(tdhouse[n], 0);
						TextDrawFont(tdhouse[n], 3);
						TextDrawLetterSize(tdhouse[n], 0.5, 1.5);
						TextDrawColour(tdhouse[n], COLOUR_WHITE);
						TextDrawSetProportional(tdhouse[n], 1);
						TextDrawSetShadow(tdhouse[n], 1);
						TextDrawUseBox(tdhouse[n], true);
						TextDrawBoxColour(tdhouse[n], 0x000000AA);
						TextDrawShowForPlayer(n, tdhouse[n]);
						TextDrawShowForPlayer(n, tdjoin);
					}
				}
			}
			
			else
			{
				if(House[n] != -1)
				{
			    	new value, int;
			    	
			    	hpath = GetHouseFilePath(House[n]);
			    	value = hGetInt(hpath, "Value");
			    	int = -1;
			    	
			    	for(new house = 0; house < sizeof HouseInteriors; house++)
			    	{
			    	    if(HouseInteriors[house][hintValue] == value)
			    	    {
			    	        int = house;
			    	        break;
			    	    }
			    	}
			    	
					if(int != -1)
					{
					    TextDrawHideForPlayer(n, tdexit);
					    
					    if(GetDistance(X, Y, Z, HouseInteriors[int][hintX], HouseInteriors[int][hintY], HouseInteriors[int][hintZ]) <= 2.5)
					        TextDrawShowForPlayer(n, tdexit);
					}
				}
			}
		}
	}
}

public GateHandler()
{
	new Float:X, Float:Y, Float:Z, open, status, nclose;
	
	for(new g = 0; g < sizeof Gates; g++)
	{
	    nclose = 0;
	    decode_gate_params(Gates[g][gParams], open, status);
	    
	    if(status == 0)
	    {
	        for(new n = 0; n < MAX_SLOTS; n++)
			{
  				if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    		{
	    		    if((g == 0 || g == 1) && !IsPlayerCop(n))
	    		        continue;
	    		        
	    		    GetPlayerPos(n, X, Y, Z);

					if(GetDistance(X, Y, Z, Gates[g][gX], Gates[g][gY], Gates[g][gZ]) < 10.0)
   					{
   					    if(open == 0)
  		    				OpenGate(g);
						else
						    nclose = 1;
						    
						break;
					}
	    		}
			}
			
			if(open == 1 && nclose == 0)
			    CloseGate(g);
		}
	}
}

public UpdateTuneCamera()
{
	KillTimer(TuneTimer);

	if(TuneVehicle == -1 || TunnerID == -1)
		return;

	new Float:vPos[3], Float:dis, Float:X, Float:Y, Float:Z, Float:fX, Float:fY, Float:ang;
	
	GetVehiclePos(TuneVehicle, vPos[0], vPos[1], vPos[2]);
	
	X = 615.0339;
	Y = -3.8868;
	Z = 1001.0250;
	
	dis = GetDistance(vPos[0], vPos[1], vPos[2], X, Y, Z);
	
	if(GetPlayerInterior(TunnerID) != 1 || dis > 3.0)
	{
	    SetPlayerInterior(TunnerID, 1);
    	LinkVehicleToInterior(TuneVehicle, 1);
		SetPlayerPos(TunnerID, 608.7222, -24.7236, 1000.9203);
		SetVehiclePos(TuneVehicle, X, Y, Z);
		SetVehicleZAngle(TuneVehicle, 270.2918);
		TogglePlayerControllable(TunnerID, false);
	}
	
	GetPlayerFacingAngle(TunnerID, ang);
	
	fX = X + (7.5 * floatsin(-ang, degrees));
	fY = Y + (7.5 * floatcos(-ang, degrees));
	
	SetPlayerCameraPos(TunnerID, fX, fY, Z + 1.0);
	SetPlayerCameraLookAt(TunnerID, X, Y, Z);
	SetPlayerFacingAngle(TunnerID, ang + 0.3);
	
	TuneTimer = SetTimer("UpdateTuneCamera", 5, false);
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	for(new os = 0; os < sizeof ON_SALE; os++)
	{
	    if(vehicleid == ON_SALE[os])
	    {
	        SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	        return 1;
	    }
	}
	
	if(!IsPlayerAdmin(forplayerid))
	{
	    if(IsPlayerVehicle(vehicleid))
	    {
	        new vpath[128], kit;

            vpath = GetVehicleFilePath(vehicleid);
			kit = hGetInt(vpath, "Params") & 3;

			if(kit == 3)
			{
			    if(strcmp(PlayerName(forplayerid), hGetString(vpath, "Owner"), true))
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
			}
	    }
	    
	    else
	    {
			new jobid;
				
			jobid = hGetInt(GetPlayerXFilePath(forplayerid), "Job");
				
			if(	(IsJobVehicle(vehicleid, TAXI) 				&& 		jobid != TAXISTA) ||
   				(IsJobVehicle(vehicleid, POLICE_CAR) 		&& 		jobid != POLICIAL_MILITAR && jobid != POLICIAL_SWAT && jobid != DELEGADO) ||
       			(IsJobVehicle(vehicleid, SCOOTER) 			&& 		jobid != PIZZABOY) ||
          		(IsJobVehicle(vehicleid, BUS) 				&& 		jobid != MAQUINISTA) ||
            	(IsJobVehicle(vehicleid, TRAIN) 			&& 		jobid != MAQUINISTA) ||
             	(IsJobVehicle(vehicleid, AMBULANCE) 		&& 		jobid != PARAMEDICO) ||
             	(IsJobVehicle(vehicleid, NEWS) 				&& 		jobid != JORNALISTA) ||
              	(IsJobVehicle(vehicleid, TOWTRUCK) 			&& 		jobid != MECANICO) ||
              	(IsJobVehicle(vehicleid, ROADTRAIN) 		&& 		jobid != CAMINHONEIRO) ||
               	(IsJobVehicle(vehicleid, TRASHMASTER) 		&& 		jobid != LIXEIRO))
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
			else
			{
			    for(new n = 0; n < MAX_SLOTS; n++)
			    {
					if(	n != forplayerid && IsPlayerConnected(n) && IsPlayerLogged(n) &&
						WorkVehicle[n] == vehicleid && IsPlayerInVehicle(n, vehicleid)	)
					{
					    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
					    break;
					}
			    }
			}
	    }
	}

	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{

}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	SendClientMessage(playerid, COLOUR_RED, "Essa loja não funciona aqui, vá na Tuning Life.");
	RemoveVehicleComponent(vehicleid, componentid);
	LoadVehicleComponents(vehicleid);
	return 1;
}

public Time()
{
	CurrentTime++;

	new hour, mins;
	
	hour = CurrentHour;
	mins = CurrentMinute;
	
    for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IntroductionPart[n] == 0)
	    {
	        if(mins == 0)
				++Counter[n];
			
			SetPlayerTime(n, hour, mins);
   		}
	}
		
	if(mins == 0)
	{
	    if(CurrentTime >= 1440)
	    {
	        CurrentTime = 0;
			CurrentDay = (CurrentDay + 1) % 7;
			TextDrawSetString(tdweek, Days[CurrentDay]);
		}
		
		SaveGlobalData();
	    SetWorldTime(hour);
	}
}
