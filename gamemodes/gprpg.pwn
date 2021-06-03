#include <a_samp>
#include <a_objects>
#include <a_players>
#include <a_vehicles>
#include <datagram>
#include <string>
#include <float>
#include <file>
#include <string>
#include <time>
#pragma tabsize 0

forward SetupPlayerForClassSelection(playerid);
forward CmdLog (string[]);
forward DelPrint(string1[]);
forward SalvarSair(playerid);
forward CasaCheck();
forward Tuning();
forward Passatempo();
forward CasaUpdate();
forward CarroUpdate();
forward Apostas();
forward DisparaAlarmes();
forward PassandoTempos();
forward CameraCasa();
forward LerCasas();
forward LerCarros();
forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
forward split(const strsrc[], strdest[][], delimiter);
forward OnPlayerLogin(playerid,const string[]);
forward TempoVaria();
forward OnPlayerSelectedMenuRow(playerid, row);
forward AntiSaude();
forward Encript(string[]);
forward Decript(string[]);
forward Dinheiro();
forward PingKick(playerid);
forward IsStringAName(string[]);
forward AtualizarVelo();
forward Chat(color,const string[]);
forward GetPlayerID(string[]);
forward MensagemAdmin(color, string[]);
forward ProxDetector(Float:radi, playerid, string[],cor);

//////////////////////DEFINES///////////////////////////
//-----Cores
#define COR_GRAD1 0xB4B5B7FF
#define COR_GRAD2 0xBFC0C2FF
#define COR_GRAD3 0xCBCCCEFF
#define COR_GRAD4 0xD8D8D8FF
#define COR_GRAD5 0xE3E3E3FF
#define COR_GRAD6 0xF0F0F0FF
#define COR_WHITE 0xFFFFFFAA
#define COR_GREEN 0x33AA33AA
#define COR_LARANJA 0xFF8300C8
#define COR_GERAL 0x4682B4AA
#define COR_RED 0xAA3333AA
#define COR_YELLOW 0xFFFF00AA
#define COR_CHAT 0xC8C8C8C8
#define COR_VERDE 0x7FFF00AA
//------------

//-----Defines
#define nunca 10000
#define MAX_STRING 256
//------------

//-----Defines Checkpoints
#define CHECKPOINT_NADA 0
#define CHECKPOINT_INIPOS 30
#define Concessionaria 33
#define Garagem 34
//------------

new Float:AviaoSpawn[5][3] = {
{0.89,30.45,1199.59},
{0.6,27.7,1199.5},
{2.9,26.5,1199.5},
{2.9,28.8,1199.5},
{1.6,33.2,1199.5}
};
new Float:TelefonePublico[20][3] = {
{-1478.4,-266.0,14.1},
{-1480.7,-265.7,14.1},
{-1482.9,-265.4,14.1},
{-1697.0,1334.7,7.1},
{-1688.7,1359.2,7.1},
{-1661.2,1397.7,7.1},
{-2021.8,-41.2,35.3},
{-2469.4,144.6,35.1},
{-2717.2,-312.0,7.1},
{-2764.7,384.8,6.3},
{-2674.4,634.0,14.4},
{-2630.1,696.6,27.9},
{-2446.5,517.3,30.2},
{-2628.4,1407.6,7.0},
{-1770.7,962.9,24.8},
{-2331.2,-164.5,35.5},
{-1967.3,162.3,27.6},
{-1966.2,162.3,27.6},
{-1965.2,162.3,27.6},
{-1964.1,162.3,27.6}
};
new Float:CaiDoAviao[4][3] = {
{-1457.2,-267.9,14.1},
{-1423.0,-287.0,14.1},
{-1402.2,-307.6,14.1},
{-1383.4,-342.5,14.1}
};
new Float:Hospitalspawn[4][3] = {
{-2657.46,695.68,27.94},
{-2643.36,638.79,14.45},
{-2685.75,638.97,14.45},
{-2637.37,695.81,27.94}
};
enum Posicao
{
	Float:UltX,
	Float:UltY,
	Float:UltZ
}
new PosicaoJogador[MAX_PLAYERS][Posicao];
new Text:Velocimetro[MAX_PLAYERS];
new UpdateSeconds;

new NomeDosCarros[][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
	"Blista Compact", "Police Maverick", "Boxvillde", "Benson", "Mesa", "RC Goblin",
	"Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
	"Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
 	"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
	"Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
 	"Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "Utility Trailer"
};

new Tempos[7] =
{0,2,3,8,10,11,16};

new Peds[266][1] = {
{102},//TEAM_BALLAS
{103},
{104},
{105},//TEAM_GROVE
{106},
{107},
{108},//TEAM_VAGOS
{109},
{110},
{114},//TEAM_AZTECAS
{115},
{116},
{121},// TEAM_NANG
{122},
{123},
{124},//TEAM_MAFIA
{125},
{126},
{127},
{111},//TEAM_RMAFIA
{112},
{113},
{117},//TEAM_TRIADS
{118},
{120},
{247},//TEAM_BIKERS
{248},
{100},
{256},
{263},
{262},
{261},
{260},
{259},
{258},
{257},
{256},
{255},
{253},
{252},
{251},
{250},
{249},
{246},
{245},
{244},
{243},
{242},
{241},
{240},
{239},
{238},
{237},
{236},
{235},
{234},
{233},
{232},
{231},
{230},
{229},
{228},
{227},
{226},
{225},
{173},
{174},
{175},
{224},
{223},
{222},
{221},
{220},
{219},
{218},
{217},
{216},
{215},
{214},
{213},
{212},
{211},
{210},
{209},//	{208},
{207},
{206},
{205},
{204},
{203},
{202},
{201},
{200},
{199},
{198},
{197},
{196},
{195},
{194},
{193},
{192},
{191},
{190},
{189},
{188},
{187},
{186},
{185},
{184},
{183},
{182},
{181},
{180},
{179},
{178},
{177},
{176},
{172},
{171},
{170},
{169},
{168},
{167},//	{166},//	{165},//	{164},//	{163},
{162},
{161},
{160},
{159},
{158},
{157},
{156},
{155},
{154},
{153},
{152},
{151},
{150},//	{149},
{148},
{147},
{146},
{145},
{144},
{143},
{142},
{141},
{140},
{139},
{138},
{137},
{136},
{135},
{134},
{133},
{132},
{131},
{130},
{129},
{128},
{101},
{254},
{99},
{98},
{97},
{96},
{264},
{95},
{94},
{93},
{92},
{91},
{90},
{89},
{88},
{87},//	{86},
{85},
{84},
{83},
{82},
{81},
{80},
{79},
{78},
{77},
{76},
{75},//	{74},
{73},
{72},
{69},
{68},
{67},
{66},//	{65},
{64},
{63},
{62},
{61},
{60},
{59},
{58},
{57},
{56},
{55},
{54},
{53},
{52},
{51},
{50},
{49},
{48},
{47},
{46},
{45},
{44},
{43},//	{42},
{41},
{40},
{39},
{38},
{37},
{36},
{35},
{34},
{33},
{32},
{31},
{30},
{29},
{28},
{27},
{26},
{25},
{24},
{23},
{22},
{21},
{20},
{19},
{18},
{17},
{16},
{15},
{14},
{13},
{12},
{11},
{10},
{1},//TRUTH
{2},//MACCER
{290},//ROSE
{291},//PAUL
{292},//CESAR
{293},//OGLOC
{294},//WUZIMU
{187},
{296},//JIZZY
{297},//MADDOGG
{298},//CAT
{299},//ZERO
{71}, //=255 amb
{70},
{274},
{275},
{276}, //==259
{269}, //=260
{270},
{271},
{272},
{277},//TORINO
{278}
//266
};
enum lercarros
{
	id,
	gasolina,
	motor,
	rodas,
	hidraulica,
	nitrogenio,
	vinil,
	ipva,
	explodiu
}
enum lerjogador
{
	senha[128],
	dinheiro,
	chave,
	fezcheat,
	banido,
	carro,
	carroid,
	carronome,
}
enum lercasa
{
	Float:entradax,
	Float:entraday,
	Float:entradaz,
	Float:saidax,
	Float:saiday,
	Float:saidaz,
	saude,
	colete,
	dono[MAX_PLAYER_NAME],
	nomedacasa[MAX_PLAYER_NAME],
	preco,
	interior,
	fechada,
	comprada,
	aluguel,
	alugavel,
	cofre,
	casa,
};

// Simbolos, usado pelo servidor
new InfoCarro[28][lercarros]; // numero de carros
new InfoJogador[MAX_PLAYERS][lerjogador];
new InfoCasa[100][lercasa];// numero de casas
new Logado[MAX_PLAYERS];
new Registrado[MAX_PLAYERS];
new Tutorial[MAX_PLAYERS];
new Numero1[MAX_PLAYERS];
new Numero2[MAX_PLAYERS];
new Numero3[MAX_PLAYERS];
new Aposta[MAX_PLAYERS];
new Ganhador[MAX_PLAYERS];
new TutorialCamT[MAX_PLAYERS];
new TempChave[MAX_PLAYERS];
new Isolado[MAX_PLAYERS];
new JogadorProntoT[MAX_PLAYERS];
new CameraJogador[MAX_PLAYERS];
new ChatReal[MAX_PLAYERS];
new TempoLimiteChat[MAX_PLAYERS];
new CheckpointAtual[MAX_PLAYERS];
new Menu:carros;
new Menu:mtunning;
new Menu:mtunningrodas;
new DisparaAlarme[MAX_PLAYERS];
new TempoComer[MAX_PLAYERS];
new Fome[MAX_PLAYERS];
new TempoHigiene[MAX_PLAYERS];
new Higiene[MAX_PLAYERS];
new TempoRouboCarro[MAX_PLAYERS];
new CheatSuspeito[MAX_PLAYERS];
new FoiMorto[MAX_PLAYERS];
new Mortoporarma[MAX_PLAYERS];
new UltimoCarro[MAX_PLAYERS];
new Telefone[MAX_PLAYERS];
new NoMenu[MAX_PLAYERS];
new TempoHospital[MAX_PLAYERS];
new TempoCemiterio[MAX_PLAYERS];
new Skindojogador[MAX_PLAYERS];
new JogadorNoCarro[MAX_PLAYERS]; //1 = motorista 2 = passageiro
new Menu:menugaragem;
new Menu:menutelefonep;
new pingmaximo;
new Hora,Minuto,Segundo;
new CarrosTotal;
new Acumulado = 0;
//new criptografado[128];
//new bloqueiomode;

main()
{
	print("\n----------------------------------");
	print(" San Fierro Gangsta's Paradise - RPG");
	print("   By Daniel Garcia (Jabba) - Brasil");
	print("----------------------------------\n");
	/*if(fexist("Protecao.ini"))
	{
		new File:arquivo;
		new berra[MAX_STRING];
		arquivo = fopen("Protecao.ini", io_read);
		fread(arquivo,berra);
		printf("Criptografado: %s",berra);
		Encript(berra);
		printf("Descriptografado: %s",berra);
		fclose(arquivo);

		bloqueiomode = 1;
  	}
	else
	{
	    print("     -- Gamemode Protegido Contra Reproducao --");
        print(" ");
        print("       Arquivo 'Protecao.ini' nao encontrado!");
        print("         O jogo nao pode ser inicializado.");
        print(" ");
        print("     ------------------------------------------");
        bloqueiomode = 1;*/
	}
//}

public OnGameModeInit()
{

    LerCasas();
    LerCarros();

	ShowNameTags(1); //mostrar nomes

	ShowPlayerMarkers(0); //esconder no radar

	AllowInteriorWeapons(1); //Permitir armas nos interiores
	
	EnableStuntBonusForAll(0); //Desativar Stunts (Anti Cheat Detecta)
	
	EnableTirePopping(1); //Ativar pneu furado
	
	UsePlayerPedAnims(); //Nao usar animacoes de pedestres, bom para correr
	
	DisableInteriorEnterExits(); //entrada de interiores
	
	SetDisabledWeapons(43,44,45);//Desativar Cameras, visoes noturnas e infra-vermelha

	SetNameTagDrawDistance(15.0); //distancia de mostrar os nomes

	SetGameModeText("[GP]RPG - By Jabba");
	//SIMBOLOS
	pingmaximo = 3000;
	// TIMERS
    SetTimer("AntiSaude", 700, true);
    SetTimer("TempoVaria", 300000, true);
    SetTimer("Dinheiro", 1000, true);
    SetTimer("Passatempo", 60000, true);
	SetTimer("DisparaAlarmes",900,true);
	SetTimer("AtualizarVelo",700, true);
    SetTimer("PassandoTempos",1000,true);
    SetTimer("CasaCheck",1000,true);
    SetTimer("CameraCasa",1500,true);
    SetTimer("Tuning",1000,true);
	// CLASSES
    for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],0.89,30.45,1199.59,269.1425,-1,-1,-1,-1,-1,-1);
	}
	//HORA REAL
	gettime(Hora,Minuto,Segundo);
	SetWorldTime(Hora);
	
	//gangzone
	GangZoneCreate(-2375.0,579.4,-2006.4,805.0);
	GangZoneCreate(-2600.3,-71.8,-2487.8,94.8);
	GangZoneCreate(-2150.5,113.9,-2007.7,321.1);
	GangZoneCreate(-2003.8,848.5,-1898.2,920.9);
	GangZoneCreate(-2640.0,1089.7,-2452.5,1241.5);
	GangZoneCreate(-2844.7,1250.1,-2464.8,1520.2);
	GangZoneCreate(-1792.7,566.8,-1419.8,841.6);
	//Carros Arquivados:
	//Objetos:

	CreateVehicle(537,-1946.7,170.8,25.5,0.000000,1,0,nunca); // trem
	CreateObject(969, -1770.506714, 979.911377, 22.734177, 0, 0, 89.3814);
	CreateObject(967, -1769.579224, 989.230652, 22.479496, 0, 0, 175.3251);//2 garagem sf
	CreateObject(1257, -1474.783691, -267.289886, 14.427629, 0, 0, 80.787);
	CreateObject(1216, -1478.458496, -265.579498, 13.815440, 0, 0, 354.8434);
	CreateObject(1216, -1480.683960, -265.265625, 13.815439, 0, 0, 354.8434);
	CreateObject(1216, -1482.952515, -264.929749, 13.790442, 0, 0, 353.1245);
	CreateObject(2754, -1470.139771, -264.165833, 14.056582, 0, 0, 166.6267);
	
CreateObject(925, -1998.130981, 558.760925, 35.077530, 0, 0, 0);
CreateObject(3361, -2173.256348, 656.430298, 50.036102, 0, 0, 268.8997);
CreateObject(3361, -2173.097168, 666.142822, 50.032135, 0, 0, 89.2774);
CreateObject(16151, -2187.637451, 706.207092, 53.282379, 0, 0, 182.0966);
CreateObject(13817, -2178.868164, 711.663086, 54.576046, 0, 0, 89.3814);
CreateObject(2628, -2173.672852, 710.322327, 52.884666, 0, 0, 0);
CreateObject(2630, -2175.433838, 710.055908, 52.885300, 0, 0, 0);
CreateObject(2627, -2173.433350, 707.492737, 52.891441, 0, 0, 87.6625);
CreateObject(11631, -2187.792725, 696.817810, 54.136528, 0, 0, 87.6625);
CreateObject(976, -2243.340332, 726.065979, 48.427536, 0, 0, 90);
CreateObject(987, -2159.719238, 721.278198, 67.457993, 0, 0, 90.2409);
CreateObject(987, -2159.778809, 733.287292, 67.464775, 0, 0, 90.2409);
CreateObject(1499, -2215.351563, 645.500061, 48.412804, 0, 0, 0);
CreateObject(1966, -2185.132813, 711.553589, 55.652557, 0, 0, 0);
CreateObject(16782, -2188.415527, 696.182312, 54.965515, 0, 1.7189, 0);
CreateObject(971, -2242.449951, 721.231934, 51.990166, 0, 0, 286.9479);
CreateObject(971, -2241.820313, 740.627502, 52.007484, 0, 0, 243.976);
CreateObject(971, -2243.366699, 730.297058, 55.190491, 0, 0, 269.7591);
CreateObject(4100, -2243.285645, 735.361023, 49.998543, 321.3253, 90.2409, 273.197);
CreateObject(971, -2240.950439, 642.471924, 52.015228, 0, 0, 269.7591);
CreateObject(971, -2239.229248, 605.234131, 43.385391, 0, 0, 268.8997);
CreateObject(971, -2211.413330, 579.697083, 37.733917, 0, 0, 0);
CreateObject(14608, -2173.510742, 697.700989, 55.161640, 0, 0, 42.9718);//23 obj mafia

CreateObject(1216, -2021.886719, -40.802227, 35.044399, 0.0000, 0.0000, 0.0000);
CreateObject(1216, -2469.882324, 144.642273, 34.863876, 0.0000, 0.0000, 90.2409);
CreateObject(1216, -2717.564453, -312.327179, 6.872021, 0.0000, 0.0000, 133.2127);
CreateObject(1216, -2765.261230, 384.817474, 6.020127, 0.0000, 0.0000, 90.2409);
CreateObject(1216, -2674.487793, 634.496277, 14.145127, 0.0000, 0.0000, 0.0000);
CreateObject(1216, -2629.628906, 696.653748, 27.632627, 0.0000, 0.0000, 269.7591);
CreateObject(1216, -2447.066650, 517.389709, 30.077309, 0.0000, 0.0000, 85.9437);
CreateObject(1216, -2628.927490, 1407.734131, 6.785752, 0.0000, 0.0000, 73.9116);
CreateObject(1216, -1770.777344, 963.421997, 24.574816, 0.0000, 0.0000, 0.0000);
CreateObject(1216, -2331.290527, -164.057938, 35.246689, 0.0000, 0.0000, 0.0000);//33 obj telef

	//Objects:
//Objects:


	//comando



	//Menus:
	//>>>>>>>> LOJA DE CARROS <<<<<<<
	carros = CreateMenu("Loja de Carros", 2, 200.0, 150.0, 120.0, 50.0);
    SetMenuColumnHeader(carros, 0, "Carro");
	SetMenuColumnHeader(carros, 1, "Preco");
	AddMenuItem(carros, 0, "Infernus");
	AddMenuItem(carros, 0, "Elegy");
	AddMenuItem(carros, 0, "Turismo");
	AddMenuItem(carros, 0, "Super GT");
	AddMenuItem(carros, 0, "Phoenix");
	AddMenuItem(carros, 0, "Banshee");
	AddMenuItem(carros, 0, "Sultan");
	AddMenuItem(carros, 0, "Buffalo");
	AddMenuItem(carros, 0, "Stretch");
	AddMenuItem(carros, 0, "Jester");
	AddMenuItem(carros, 0, "Sair");
	AddMenuItem(carros, 1, "$53221");
	AddMenuItem(carros, 1, "$47175");
	AddMenuItem(carros, 1, "$64359");
	AddMenuItem(carros, 1, "$65470");
	AddMenuItem(carros, 1, "$54537");
	AddMenuItem(carros, 1, "$42212");
	AddMenuItem(carros, 1, "$38950");
	AddMenuItem(carros, 1, "$36450");
	AddMenuItem(carros, 1, "$129789");
	AddMenuItem(carros, 1, "$49521");
	//>>>>>>>> GARAGEM <<<<<<<
	menugaragem = CreateMenu("Garagem", 1, 90.0, 90.0, 90.0, 90.0);
	SetMenuColumnHeader(menugaragem, 0, "Carro");
	AddMenuItem(menugaragem, 0, "Reparar Carro");
	AddMenuItem(menugaragem, 0, "Guinchar Carro");
	AddMenuItem(menugaragem, 0, "Sair");
	//>>>>>>>> TELEFONE PUBLICO <<<<<<<<<
	menutelefonep = CreateMenu("Telefone", 1, 500.0, 200.0, 100.0, 100.0);
	SetMenuColumnHeader(menutelefonep, 0, "Lista");
	AddMenuItem(menutelefonep, 0, "Taxi");
	AddMenuItem(menutelefonep, 0, "Policia");
	AddMenuItem(menutelefonep, 0, "Sair");
	//>>>>>>>> TUNNING <<<<<<<<<<<<<
	mtunning = CreateMenu("Loja", 1, 15.0, 130.0, 120.0, 50.0);
	SetMenuColumnHeader(mtunning, 0, "Tunning");
	AddMenuItem(mtunning, 0, "Rodas");
	AddMenuItem(mtunning, 0, "Pintura");
	AddMenuItem(mtunning, 0, "Vinil");
	AddMenuItem(mtunning, 0, "Mecanica");
	//>>>>>>>>> RODAS <<<<<<<<<<
	mtunningrodas = CreateMenu("Loja", 1, 15.0, 130.0, 120.0, 150.0);
	SetMenuColumnHeader(mtunningrodas, 0, "Rodas");
	AddMenuItem(mtunningrodas, 0, "Rimshine");
	AddMenuItem(mtunningrodas, 0, "Wires");
	AddMenuItem(mtunningrodas, 0, "Classic");
	AddMenuItem(mtunningrodas, 0, "Twist");
	AddMenuItem(mtunningrodas, 0, "Cutter");
	AddMenuItem(mtunningrodas, 0, "Dollar");
	AddMenuItem(mtunningrodas, 0, "Trance");
	AddMenuItem(mtunningrodas, 0, "Proxima Lista");
	AddMenuItem(mtunningrodas, 0, "Voltar");

	
	//pickups
	for(new h = 0; h < sizeof(InfoCasa); h++)
	{
	if(InfoCasa[h][comprada] == 0)
		{
			AddStaticPickup(1273, 1, InfoCasa[h][entradax], InfoCasa[h][entraday], InfoCasa[h][entradaz]);
		}
	if(InfoCasa[h][comprada] == 1)
		{
			AddStaticPickup(1272, 1, InfoCasa[h][entradax], InfoCasa[h][entraday], InfoCasa[h][entradaz]);
		}
	if(InfoCasa[h][alugavel] == 1)
		{
			AddStaticPickup(1239, 1, InfoCasa[h][entradax], InfoCasa[h][entraday], InfoCasa[h][entradaz]);
		}
	}
	return 1;
}
public CasaUpdate()
{
	new idx;
	new File: file2;
	while (idx < sizeof(InfoCasa))
	{
		new coordsstring[MAX_STRING];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%d,%d,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d\n",
		InfoCasa[idx][entradax],
		InfoCasa[idx][entraday],
		InfoCasa[idx][entradaz],
		InfoCasa[idx][saidax],
		InfoCasa[idx][saiday],
		InfoCasa[idx][saidaz],
		InfoCasa[idx][saude],
		InfoCasa[idx][colete],
		InfoCasa[idx][dono],
		InfoCasa[idx][nomedacasa],
		InfoCasa[idx][preco],
		InfoCasa[idx][interior],
		InfoCasa[idx][fechada],
		InfoCasa[idx][comprada],
		InfoCasa[idx][aluguel],
		InfoCasa[idx][alugavel],
		InfoCasa[idx][cofre],
		InfoCasa[idx][casa]);
		if(idx == 0)
		{
			file2 = fopen("casas.cfg", io_write);
		}
		else
		{
			file2 = fopen("casas.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	idx = 0;
	return 1;
}
public CarroUpdate()
{
	new idx;
	new File: file3;
	while (idx < sizeof(InfoCarro))
	{
		new coordsstring[MAX_STRING];
		format(coordsstring, sizeof(coordsstring), "%d,%d,%d,%d,%d,%d,%d,%d\n",
		InfoCarro[idx][id],
		InfoCarro[idx][gasolina],
		InfoCarro[idx][motor],
		InfoCarro[idx][rodas],
		InfoCarro[idx][hidraulica],
		InfoCarro[idx][nitrogenio],
		InfoCarro[idx][vinil],
		InfoCarro[idx][ipva]);
		if(idx == 0)
		{
			file3 = fopen("carrosl.cfg", io_write);
		}
		else
		{
			file3 = fopen("carrosl.cfg", io_append);
		}
		fwrite(file3, coordsstring);
		idx++;
		fclose(file3);
	}
	idx = 0;
	return 1;
}

//------------ PUBLICS -------------

public OnPlayerConnect(playerid)
{
	/*if(bloqueiomode == 1)
	{
		SendClientMessage(playerid, COR_GRAD1, "Gamemode Bloqueado, para desbloquear digite /mode [codigo]");
		SendClientMessage(playerid, COR_GRAD1, "Apos digitar reconecte.");
    	GameTextForPlayer(playerid,"~r~Gamemode Bloqueado",6000,1);
       	return 1;
	}*/
    GameTextForPlayer(playerid,"~g~Gangsters ~w~Paradise~n~~y~By Jabba",6000,1);
	new jogador[MAX_STRING];
    new ip[16];
    GetPlayerName(playerid,jogador,sizeof(jogador));
   	GetPlayerIp(playerid, ip, sizeof(ip));
   	printf("Jogador entrou: ID:(%d) Nome:(%s) IP:(%s)", playerid,jogador,ip);

    InfoJogador[playerid][chave] = 255;
    InfoJogador[playerid][dinheiro] = 0;
    InfoJogador[playerid][fezcheat] = 0;
    InfoJogador[playerid][banido] = 0;
    InfoJogador[playerid][carro] = 0;
	InfoJogador[playerid][carroid] = 0;
	InfoJogador[playerid][carronome] = 0;
    Logado[playerid] = 0;
    FoiMorto[playerid] = 255;
    TempoHospital[playerid] = 255;
    TempoCemiterio[playerid] = 255;
    JogadorNoCarro[playerid] = 255;
    TempChave[playerid] = 255;
    ChatReal[playerid] = 1;
    Isolado[playerid] = 0;
    JogadorProntoT[playerid] = 255;
    CameraJogador[playerid] = 255;
    TempoLimiteChat[playerid] = 0;
    UltimoCarro[playerid] = 0;
    Telefone[playerid] = 255;
    NoMenu[playerid] = 255;
    Skindojogador[playerid] = 0;
    DisparaAlarme[playerid] = 0;
    TempoComer[playerid] = 0;
    Fome[playerid] = 0;
    TempoHigiene[playerid] = 0;
    Higiene[playerid] = 100;
    TempoRouboCarro[playerid] = 255;
    CheatSuspeito[playerid] = 0;
    Registrado[playerid] = 0;
    Numero1[playerid] = 255;
    Numero2[playerid] = 255;
    Numero3[playerid] = 255;
    Aposta[playerid] = 255;
    Ganhador[playerid] = 255;
    Tutorial[playerid] = 255;
    TutorialCamT[playerid] = 255;
    Mortoporarma[playerid] = 0;
    SetPlayerColor(playerid,COR_WHITE);

	//zonas
	GangZoneShowForPlayer(playerid,0,COR_RED);
	GangZoneShowForPlayer(playerid,1,COR_GREEN);
	GangZoneShowForPlayer(playerid,2,COR_GREEN);
	GangZoneShowForPlayer(playerid,3,COR_GREEN);
	GangZoneShowForPlayer(playerid,4,COR_GREEN);
	GangZoneShowForPlayer(playerid,5,COR_RED);
	GangZoneShowForPlayer(playerid,6,COR_GERAL);

    //-----------------------------------------Ler
    new playername[MAX_PLAYER_NAME];
    new string2[MAX_PLAYER_NAME];
    
    GetPlayerName(playerid, playername, sizeof(playername));
    format(string2, sizeof(string2), "%s.ini", playername);
	if(fexist(string2))
	{
	    Registrado[playerid] = 1;
		new File: file = fopen(string2, io_read);
		new valtmp[128];
		fread(file, valtmp);strmid(InfoJogador[playerid][senha], valtmp, 0, strlen(valtmp)-1, 255);
		fread(file, valtmp);InfoJogador[playerid][dinheiro] = strval(valtmp);DelPrint(valtmp);
		fread(file, valtmp);InfoJogador[playerid][chave] = strval(valtmp);DelPrint(valtmp);
		fread(file, valtmp);InfoJogador[playerid][fezcheat] = strval(valtmp);DelPrint(valtmp);
		fread(file, valtmp);InfoJogador[playerid][banido] = strval(valtmp);DelPrint(valtmp);
		fread(file, valtmp);InfoJogador[playerid][carro] = strval(valtmp);DelPrint(valtmp);
		fread(file, valtmp);InfoJogador[playerid][carroid] = strval(valtmp);DelPrint(valtmp);
		fread(file, valtmp);InfoJogador[playerid][carronome] = strval(valtmp);DelPrint(valtmp);
		fclose(file);
		if(InfoJogador[playerid][banido] == 1)
		{
			SendClientMessage(playerid, COR_GREEN, " ");
			SendClientMessage(playerid, COR_RED, "-------------------------------------------");
			SendClientMessage(playerid, COR_GREEN, "     San Fierro RPG - Nome banido");
			SendClientMessage(playerid, COR_GREEN, " ");
			SendClientMessage(playerid, COR_GREEN, "  Se voce acha que foi banido incorretamente");
			SendClientMessage(playerid, COR_GREEN, "     entre no site www.site.com.");
			SendClientMessage(playerid, COR_GREEN, " ");
			SendClientMessage(playerid, COR_RED, "-------------------------------------------");
			SendClientMessage(playerid, COR_GREEN, " ");
			Ban(playerid);
		}
		SendClientMessage(playerid, COR_GRAD1, "Nome registrado. Coloque /login senha.");
	}
	else
	{
	    Registrado[playerid] = 0;
		SendClientMessage(playerid, COR_GRAD1, "Coloque /registrar <senha> para criar uma conta.");
	}
	return 1;
}

public Apostas()
{
	new Numerou = random(100);
	new Numerod = random(100);
	new Numerot = random(100);
	new Ganhadores = 0;
	new str[MAX_STRING];
	for(new i=0;i<MAX_PLAYERS;i++)
 	{
 	if(IsPlayerConnected(i) == 1)
		{
		    if(Numero1[i] != 255)
		    {
		        SendClientMessage(i, COR_CHAT, "---- Resultado da Loteria ----");
		    	format(str,sizeof(str), "Numeros apostados- 1: /%d/ 2: /%d/ 3: /%d/ (Quantidade) $%d",Numero1[i],Numero2[i],Numero3[i],Aposta[i]);
            	SendClientMessage(i, COR_CHAT, str);
            	format(str,sizeof(str), "Numeros sorteados- 1: /%d/ 2: /%d/ 3: /%d/ (Acumulado) $%d",Numerou,Numerod,Numerot,Acumulado);
            	SendClientMessage(i, COR_CHAT, str);
		    }
			if(Numero1[i] == Numerou)
			{
				InfoJogador[i][dinheiro] = InfoJogador[i][dinheiro] + Aposta[i]*10;
				Acumulado = Acumulado - Aposta[i]*10;
				format(str,sizeof(str), "Voce acertou a primeira dezena n.%d, e ganhou $%d!",Numero1[i],Aposta[i]*10);
            	SendClientMessage(i, COR_GREEN, str);
			}
            if(Numero2[i] == Numerod)
			{
				InfoJogador[i][dinheiro] = InfoJogador[i][dinheiro] + Aposta[i]*10;
				Acumulado = Acumulado - Aposta[i]*10;
				format(str,sizeof(str), "Voce acertou a segunda dezena n.%d, e ganhou $%d!",Numero2[i],Aposta[i]*10);
            	SendClientMessage(i, COR_GREEN, str);
			}
			if(Numero3[i] == Numerot)
			{
				InfoJogador[i][dinheiro] = InfoJogador[i][dinheiro] + Aposta[i]*10;
                Acumulado = Acumulado - Aposta[i]*10;
                format(str,sizeof(str), "Voce acertou a terceira dezena n.%d, e ganhou $%d!",Numero3[i],Aposta[i]*10);
            	SendClientMessage(i, COR_GREEN, str);
			}
			if(Numero1[i] == Numerou && Numero2[i] == Numerod && Numero3[i] == Numerot)
			{
				Ganhador[i] = 1;
				Ganhadores = Ganhadores + 1;
			}
			Numero1[i] = 255;
			Numero2[i] = 255;
			Numero3[i] = 255;
			Aposta[i] = 255;
		}
	}
	if(Acumulado < 50000)
	{
    	Acumulado = 50000;
    }
    if(Ganhadores != 0)
    {
    Acumulado = Acumulado/Ganhadores;
	}
    for(new i=0;i<MAX_PLAYERS;i++)
 	{
 	if(IsPlayerConnected(i) == 1)
		{
			if(Ganhador[i] == 1)
			{
				new acu;
    			acu = Acumulado*Ganhadores;
				InfoJogador[i][dinheiro] = InfoJogador[i][dinheiro] + Acumulado;
                format(str,sizeof(str), "Parabens! Voce acertou as tres dezenas e ganhou $%d!",Acumulado);
            	SendClientMessage(i, COR_GREEN, str);
            	if(Ganhadores > 1)
            	{
            		format(str,sizeof(str), "Voce dividiu o premio de %d com %d pessoas.",acu,Ganhadores);
            		SendClientMessage(i, COR_GREEN, str);
            	}
            	else
            	{
            		SendClientMessage(i, COR_GREEN, "Voce ganhou o premio sozinho!");
            	}
            	Ganhador[i] = 255;
			}
		}
	}
}

public OnPlayerDisconnect(playerid, reason)
{
    if(Logado[playerid] == 1)
	{
    SalvarSair(playerid);
    }
    new string[85],jogador[MAX_STRING];
    GetPlayerName(playerid,jogador,sizeof(jogador));
	switch (reason)
	{
    case 0:
   	 {
        format(string,sizeof(string), "%s foi dormir.",jogador);
        printf("Jogador saiu: id:(%d) nome:(%s) Causa:(Perdeu Conexao)", playerid,jogador);
        SendClientMessageToAll(COR_GRAD1,string);
  	  }
    case 1:
  	  {
        format(string,sizeof(string), "%s foi dormir.",jogador);
        printf("Jogador saiu: id:(%d) nome:(%s) Causa:(Livre Vontade)", playerid,jogador);
        SendClientMessageToAll(COR_GRAD1,string);
   	 }
    case 2:
  	  {
        format(string,sizeof(string), "%s foi dormir.",jogador);
        printf("Jogador saiu: id:(%d) nome:(%s) Causa:(Kickado)", playerid,jogador);
        SendClientMessageToAll(COR_GRAD1,string);
  	  }
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(Logado[playerid] == 1)
	{
		if(FoiMorto[playerid] == 255)
		{
			if(Tutorial[playerid] == 255)
			{
					new rand;
					rand = random(sizeof(AviaoSpawn));
					SetPlayerPos(playerid, AviaoSpawn[rand][0], AviaoSpawn[rand][1], AviaoSpawn[rand][2]);
					SetPlayerFacingAngle(playerid, 360.0);
					SetPlayerCheckpoint(playerid,3.82,23.02,1199.60,1.5);
					SetPlayerHealth(playerid, 25.0);
					CheckpointAtual[playerid] = CHECKPOINT_INIPOS;
					SetPlayerInterior(playerid,1);
					return 1;
			}
			if(Tutorial[playerid] == 4)
	    	{
					new rand;
  					rand = random(sizeof(CaiDoAviao));
    				SetPlayerPos(playerid, CaiDoAviao[rand][0], CaiDoAviao[rand][1], CaiDoAviao[rand][2]);
					SetPlayerFacingAngle(playerid, 180.0);
         			SetPlayerInterior(playerid,0);
					SetPlayerVirtualWorld(playerid,0);
					SetPlayerInterior(playerid,0);
					TutorialCamT[playerid] = 255;
					Tutorial[playerid] = 254;
					JogadorProntoT[playerid] = 1;
					return 1;
			}
			if(Tutorial[playerid] == 254)
			{
				if(InfoJogador[playerid][chave] != 255)
	    		{
	    			new casaspawn = InfoJogador[playerid][chave]-1;
	    			SetPlayerVirtualWorld(playerid,casaspawn);
	    			SetPlayerInterior(playerid,InfoCasa[casaspawn][interior]);
	    			SetPlayerPos(playerid,InfoCasa[casaspawn][saidax],InfoCasa[casaspawn][saiday],InfoCasa[casaspawn][saidaz]);
					GameTextForPlayer(playerid, "~w~Lar doce lar", 5000, 1);
					JogadorProntoT[playerid] = 1;
					return 1;
	    		}
	    		else
	    		{
	    			new rand;
					rand = random(sizeof(AviaoSpawn));
					SetPlayerPos(playerid, AviaoSpawn[rand][0], AviaoSpawn[rand][1], AviaoSpawn[rand][2]);
					SetPlayerFacingAngle(playerid, 360.0);
					SetPlayerCheckpoint(playerid,3.82,23.02,1199.60,1.5);
					SetPlayerHealth(playerid, 25.0);
					CheckpointAtual[playerid] = CHECKPOINT_INIPOS;
					SetPlayerInterior(playerid,1);
					JogadorProntoT[playerid] = 1;
					return 1;
	    		}
			}
		}
  		else if(FoiMorto[playerid] == 1)
		{
			if(Tutorial[playerid] == 254)
			{
  				TogglePlayerControllable(playerid, 0);
				SetPlayerPos(playerid,-219.98,1410.57,27.77);
				SetPlayerInterior(playerid,0);
				SetPlayerVirtualWorld(playerid,playerid+1);
				SetPlayerCameraPos(playerid,-2528.85,570.66,59.28);
				SetPlayerCameraLookAt(playerid,-2606.25,613.11,59.33);
				GameTextForPlayer(playerid, "~w~O ~r~Hospital", 5000, 1);
				///////////////////////////////////////////////////////////
 			new string[MAX_STRING];
			new tempoint = TempoHospital[playerid] + Minuto;
			new horahos = Hora;
   			if(tempoint < 60)
			{
       			if(tempoint <= 9)
      				{
						format(string,sizeof(string), "Voce foi gravemente ferido e esta na UTI. Voce saira as %d:0%d horas.",Hora,tempoint);
                		SendClientMessage(playerid, COR_GERAL, string);
					}
				else
					{
					format(string,sizeof(string), "Voce foi gravemente ferido e esta na UTI. Voce saira as %d:%d horas.",Hora,tempoint);
					SendClientMessage(playerid, COR_GERAL, string);
             	   	}
			}
			if(tempoint == 60)
			{
				horahos = Hora + 1;
				format(string,sizeof(string), "Voce foi gravemente ferido e esta na UTI. Voce saira as %d:00 horas.",horahos);
   				SendClientMessage(playerid, COR_GERAL, string);
			}
			if(tempoint > 60)
			{
				horahos = Hora + 1;
				tempoint = tempoint - 60;
				format(string,sizeof(string), "Voce foi gravemente ferido e esta na UTI. Voce saira as %d:0%d horas.",horahos,tempoint);
   				SendClientMessage(playerid, COR_GERAL, string);
			}
			}
			else
	    	{
	    			new rand;
					rand = random(sizeof(AviaoSpawn));
					SetPlayerPos(playerid, AviaoSpawn[rand][0], AviaoSpawn[rand][1], AviaoSpawn[rand][2]);
					SetPlayerFacingAngle(playerid, 360.0);
					SetPlayerCheckpoint(playerid,3.82,23.02,1199.60,1.5);
					SetPlayerHealth(playerid, 25.0);
					CheckpointAtual[playerid] = CHECKPOINT_INIPOS;
					SetPlayerInterior(playerid,1);
					JogadorProntoT[playerid] = 1;
					return 1;
	    	}
			return 1;
		}
		else if(FoiMorto[playerid] == 3)
		{
  			TogglePlayerControllable(playerid, 0);
			SetPlayerPos(playerid,885.92,-1085.82,40.20);
			SetPlayerInterior(playerid,0);
			SetPlayerVirtualWorld(playerid,playerid+1);
			SetPlayerCameraPos(playerid,882.92,-1082.82,44.20);
			SetPlayerCameraLookAt(playerid,863.55,-1093.63,24.30);
			GameTextForPlayer(playerid, "~w~O ~r~Cemiterio", 5000, 1);
			SendClientMessage(playerid, COR_GERAL, "Voce nao resistiu e morreu, voce voltara a vida sendo um zumbi.");
			new varia = random(40);
			if(varia <= 10)
			{
				TempoCemiterio[playerid] = 10;
				SendClientMessage(playerid, COR_WHITE, "Tempo de regeneracao da carne: 10 minutos.");
			}
            if(varia > 10 && varia < 20)
			{
				TempoCemiterio[playerid] = 15;
				SendClientMessage(playerid, COR_WHITE, "Tempo de regeneracao da carne: 15 minutos.");
			}
			if(varia > 20)
			{
				TempoCemiterio[playerid] = 20;
				SendClientMessage(playerid, COR_WHITE, "Tempo de regeneracao da carne: 20 minutos.");
			}
		}
		else if(FoiMorto[playerid] == 2)
		{
			new sphos;
			SetPlayerHealth(playerid, 25.0);
			FoiMorto[playerid] = 0;
  			sphos = random(sizeof(Hospitalspawn));
  			SetPlayerPos(playerid,Hospitalspawn[sphos][0],Hospitalspawn[sphos][1],Hospitalspawn[sphos][2]);
  			SetPlayerFacingAngle(playerid, 360.0);
  			SetPlayerVirtualWorld(playerid,0);
			return 1;
		}
	}
	if (Registrado[playerid] == 0)
		{
			GameTextForPlayer(playerid, "~w~Bem vindo!~n~ Para jogar voce deve criar uma conta, coloque ~n~~r~/registrar (senha)", 20000, 3);
            SendClientMessage(playerid, COR_GRAD1, "Nome nao registrado. Coloque /registrar senha.");
			SetPlayerInterior(playerid,18);
			SetPlayerPos(playerid,-219.98,1410.57,27.77);
			Isolado[playerid] = 1;
    		return 1;
		}
	else if (Logado[playerid] == 0)
		{
			GameTextForPlayer(playerid, "~w~Para jogar voce deve logar, coloque ~n~~g~/login (senha)~w~ para entrar", 20000, 3);
			SendClientMessage(playerid, COR_GRAD1, "Nome registrado. Coloque /login senha.");
			SetPlayerInterior(playerid,18);
			SetPlayerPos(playerid,-219.98,1410.57,27.77);
			Isolado[playerid] = 1;
    		return 1;
		}
	PingKick(playerid);
	return 1;
	
}
public MensagemAdmin(color, string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && IsPlayerAdmin(i))
		{
			SendClientMessage(i, color, string);
		}
	}
}

public Dinheiro()
{
 for(new i=0;i<MAX_PLAYERS;i++)
 	{
 	if(IsPlayerConnected(i) == 1)
		{
		if(InfoJogador[i][dinheiro] < GetPlayerMoney(i))
			{
				new diferenca;
				new grana = GetPlayerMoney(i);
				diferenca = grana - InfoJogador[i][dinheiro];
				GivePlayerMoney(i,-diferenca);
			}
		if(InfoJogador[i][dinheiro] > GetPlayerMoney(i))
			{
				new grana = GetPlayerMoney(i);
				new diferenca;
				diferenca = InfoJogador[i][dinheiro] - grana;
				GivePlayerMoney(i,diferenca);
			}
		}
	}
}


public AntiSaude()
{
	for(new i=0;i<MAX_PLAYERS;i++)
 		{
		  if(IsPlayerConnected(i) == 1)
				{
  					new Float:saudec;
  					new Float:coletec;
					GetPlayerHealth(i, saudec);
					GetPlayerArmour(i, coletec);
					if(saudec > 25.0)
					{
						SetPlayerHealth(i, 25.0);
					}
					if(coletec > 25.0)
					{
						SetPlayerArmour(i, 25.0);
					}
				}
		}
}
public PingKick(playerid)
{
	new pinga;
	new string[MAX_STRING];
	pinga = GetPlayerPing(playerid);
   	if(pinga > pingmaximo)
	{
		format(string,sizeof(string),"Voce foi kickado por ter um ping acima do permitido (Max: %d).",pingmaximo);
		SendClientMessage(playerid, COR_GREEN, string);
		Kick(playerid);
	}
}

public Passatempo()
{
 	Minuto ++;
	if(Minuto == 60)
		{
			Hora ++;
			SetWorldTime(Hora);
			Minuto = 0;
		}
		if(Hora == 24)
		{
			Hora = 0;
		}
    for(new i = 0; i <= MAX_PLAYERS; i++)
	{
 	if(TempoHospital[i] != 255)
 	{
 		if(TempoHospital[i] > 0 && FoiMorto[i] == 1)
		{
			new tempoh = TempoHospital[i];
			TempoHospital[i] = tempoh - 1;
		}
	}
	}
}

public SalvarSair(playerid)
{
    if(Logado[playerid] == 1)
	{
		new string3[32];
		new playername3[MAX_PLAYER_NAME];
		GetPlayerName(playerid, playername3, sizeof(playername3));
		format(string3, sizeof(string3), "%s.ini", playername3);
		new File: pFile = fopen(string3, io_write);
		if (pFile)
		{
			new var[32];
			format(var, 32, "%s\n", InfoJogador[playerid][senha]);fwrite(pFile, var);
			fclose(pFile);
			new File: hFile = fopen(string3, io_append);
			InfoJogador[playerid][dinheiro] = GetPlayerMoney(playerid);
			format(var, 32, "%d dinheiro\n", InfoJogador[playerid][dinheiro]);fwrite(hFile, var);
			format(var, 32, "%d chave\n", InfoJogador[playerid][chave]);fwrite(hFile, var);
			format(var, 32, "%d fezcheat\n", InfoJogador[playerid][fezcheat]);fwrite(hFile, var);
			format(var, 32, "%d banido\n", InfoJogador[playerid][banido]);fwrite(hFile, var);
			format(var, 32, "%d carro\n", InfoJogador[playerid][carro]);fwrite(hFile, var);
			format(var, 32, "%d carroid\n", InfoJogador[playerid][carroid]);fwrite(hFile, var);
			format(var, 32, "%d carronome\n", InfoJogador[playerid][carronome]);fwrite(hFile, var);
			fclose(hFile);
		}
	}
	return 1;
}
public LerCasas()
{
	new arrCoords[18][64];
	new strFromFile2[MAX_STRING];
	new File: file = fopen("casas.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(InfoCasa))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			InfoCasa[idx][entradax] = floatstr(arrCoords[0]);
			InfoCasa[idx][entraday] = floatstr(arrCoords[1]);
			InfoCasa[idx][entradaz] = floatstr(arrCoords[2]);
			InfoCasa[idx][saidax] = floatstr(arrCoords[3]);
			InfoCasa[idx][saiday] = floatstr(arrCoords[4]);
			InfoCasa[idx][saidaz] = floatstr(arrCoords[5]);
			InfoCasa[idx][saude] = strval(arrCoords[6]);
			InfoCasa[idx][colete] = strval(arrCoords[7]);
			strmid(InfoCasa[idx][dono], arrCoords[8], 0, strlen(arrCoords[8]), 255);
			strmid(InfoCasa[idx][nomedacasa], arrCoords[9], 0, strlen(arrCoords[9]), 255);
			InfoCasa[idx][preco] = strval(arrCoords[10]);
			InfoCasa[idx][interior] = strval(arrCoords[11]);
			InfoCasa[idx][fechada] = strval(arrCoords[12]);
			InfoCasa[idx][comprada] = strval(arrCoords[13]);
			InfoCasa[idx][aluguel] = strval(arrCoords[14]);
			InfoCasa[idx][alugavel] = strval(arrCoords[15]);
			InfoCasa[idx][cofre] = strval(arrCoords[16]);
			InfoCasa[idx][casa] = strval(arrCoords[17]);
			printf("Casa:%s Dono:%s Preco:%d Cofre:%d",InfoCasa[idx][nomedacasa],InfoCasa[idx][dono],InfoCasa[idx][preco],InfoCasa[idx][cofre]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}
public LerCarros()
{
	new arrCoords[15][64];
	new strFromFile2[MAX_STRING];
	new File: file = fopen("carros.cfg", io_read);
	if (file)
	{
		new idx;
		new modelo,Float:X, Float:Y, Float:Z, Float:Ang, Cor1, Cor2;
		while (idx < sizeof(InfoCarro))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			modelo = strval(arrCoords[0]);
			X = floatstr(arrCoords[1]);
			Y = floatstr(arrCoords[2]);
			Z = floatstr(arrCoords[3]);
			Ang = floatstr(arrCoords[4]);
			Cor1 = strval(arrCoords[5]);
			Cor2 = strval(arrCoords[6]);
			InfoCarro[idx][id] = idx;
			InfoCarro[idx][gasolina] = strval(arrCoords[7]);
			InfoCarro[idx][motor] = strval(arrCoords[8]);
			InfoCarro[idx][rodas] = strval(arrCoords[9]);
			InfoCarro[idx][hidraulica] = strval(arrCoords[10]);
			InfoCarro[idx][nitrogenio] = strval(arrCoords[11]);
			InfoCarro[idx][vinil] = strval(arrCoords[12]);
			InfoCarro[idx][ipva] = strval(arrCoords[13]);
			InfoCarro[idx][explodiu] = 0;
			
			printf("Carro: %d",InfoCarro[idx][id]);
			CreateVehicle(modelo, X, Y, Z, Ang, Cor1, Cor2,nunca);
			if(InfoCarro[idx][rodas] != 255)
			{
			AddVehicleComponent(idx,InfoCarro[idx][rodas]);
			}
			if(InfoCarro[idx][hidraulica] == 1)
			{
				AddVehicleComponent(idx,1087);
			}
			if(InfoCarro[idx][nitrogenio] == 1)
			{
			    AddVehicleComponent(idx,1010);
			}
			idx++;
		}
		CarrosTotal = idx;
	}
	fclose(file);
	return 1;
}

public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	tempposx = (oldposx -x);
	tempposy = (oldposy -y);
	tempposz = (oldposz -z);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		return 1;
	}
	return 0;
}
public CasaCheck()
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new string[128];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, oldposx, oldposy, oldposz);
			if(oldposx!=0.0 && oldposy!=0.0 && oldposz!=0.0)
			{
				for(new h = 0; h < sizeof(InfoCasa); h++)
				{
					if(PlayerToPoint(2.0, i, InfoCasa[h][entradax], InfoCasa[h][entraday], InfoCasa[h][entradaz]))
					{
						if(InfoCasa[h][comprada] == 1)
						{
							if(InfoCasa[h][alugavel] == 0)
							{
								format(string, sizeof(string), "~n~~n~~n~~n~~w~%s~n~Casa do ~r~%s",InfoCasa[h][nomedacasa],InfoCasa[h][dono]);
							}
							else
							{
								format(string, sizeof(string), "~n~~n~~n~~n~~w~%s~n~Casa do ~r~%s~n~~w~Aluguel: ~g~$%d",InfoCasa[h][nomedacasa],InfoCasa[h][dono],InfoCasa[h][aluguel]);
							}
							GameTextForPlayer(i, string, 5000, 3);
							return 1;
						}
						else
						{
							format(string, sizeof(string), "~w~%s~n~~w~Casa a venda~n~Preco: ~g~$%d",InfoCasa[h][nomedacasa],InfoCasa[h][preco]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
                if(PlayerToPoint(90.0, i, -2816.0,1118.5,28.3))
				{
				GameTextForPlayer(i, "~w~Jabba e Poly: ~r~Love Place", 5000, 1);
				}
			}
		}
	}
	return 1;
}
public split(const strsrc[], strdest[][], delimiter)
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
public DelPrint(string1[])
{
	strmid(string1, string1, 0, strlen(string1)-1, 255);
}

public SetupPlayerForClassSelection(playerid)
{
	SetPlayerInterior(playerid,1);
	SetPlayerPos(playerid,1.81,28.71,1199.59);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,1.81+1.5,28.71,1199.59+0.7);
	SetPlayerCameraLookAt(playerid,1.81,28.71,1199.59+0.7);
}
public OnPlayerRequestClass(playerid, classid)
{
    /*if(bloqueiomode == 1)
	{
    	SetPlayerPos(playerid,-1831.61,1661.90,50.98);
        TogglePlayerControllable(playerid, 0);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,playerid+1);
		SetPlayerCameraPos(playerid,-1831.61,1661.90,103.98);
		SetPlayerCameraLookAt(playerid,-1816.55,1309.36,79.07);
	    return 1;
	}*/
	SetupPlayerForClassSelection(playerid);
	return 1;
}
public IsStringAName(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
		}
	}
	return 0;
}
public GetPlayerID(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
		}
	}
	return INVALID_PLAYER_ID;
}

public ProxDetector(Float:radi, playerid, string[],cor)
{
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Raio
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
	if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))//multi casas ;D
	{
		if(IsPlayerConnected(i) == 1)
		{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendClientMessage(i, cor, string);
				}
		}
	}
	}
	return 1;
}

public TempoVaria()
{
	for(new i=0; i<MAX_PLAYERS; i++)
		{
		new temposv;
    	temposv = random(sizeof(Tempos));
        SetPlayerWeather(i,Tempos[temposv]);
		}
	/*
	* 0 to 7 = different versions of blue skies/clouds
    * 08 = stormy
    * 09 = cloudy and foggy
    * 10 = clear blue sky (falls into 0-7 category)
    * 11 = scorching hot (Los Santos heat waves)
    * 12 to 15 = very dull, colorless, hazy
    * 16 = dull, cloudy, rainy
    * 17 to 18 = scorching hot
    * 19 = sandstorm
    * 20 = foggy/greenish
    * 21 = very dark, gradiented skyline, purple
    * 22 = very dark, gradiented skyline, green
    * 23 to 26 = variations of pale orange
    * 27 to 29 = variations of fresh blue
    * 30 to 32 = variations of dark, cloudy, teal
    * 33 = dark, cloudy, brown
    * 34 = blue/purple, regular
    * 35 = dull brown
    * 36 to 38 = bright, foggy, orange
    * 39 = extremely bright
    * 40 to 42 = blue/purple cloudy
    * 43 = dark toxic clouds
    * 44 = black/white sky
    * 45 = black/purple sky
	*/
}

public CameraCasa()
{
for(new i = 0; i <= MAX_PLAYERS; i++)
	{
	if(IsPlayerConnected(i) == 1)
		{
		if(CameraJogador[i] != 255)
			{
				new casac = InfoJogador[i][chave]-1;
        		new Float:jx, Float:jy, Float:jz;
        		GetPlayerPos(CameraJogador[i], jx, jy, jz);
        		SetPlayerCameraPos(i, InfoCasa[casac][entradax], InfoCasa[casac][entraday],InfoCasa[casac][entradaz]+2.0);
                SetPlayerPos(i,InfoCasa[casac][entradax], InfoCasa[casac][entraday],InfoCasa[casac][entradaz]-30);
				SetPlayerCameraLookAt(i,jx,jy,jz);
			}
		if(CameraJogador[i] == 254)
			{
				new casac = InfoJogador[i][chave]-1;
				SetPlayerCameraPos(i, InfoCasa[casac][entradax], InfoCasa[casac][entraday],InfoCasa[casac][entradaz]+2.0);
				SetPlayerPos(i,InfoCasa[casac][entradax], InfoCasa[casac][entraday],InfoCasa[casac][entradaz]-30);
				SetPlayerCameraLookAt(i,InfoCasa[casac][entradax],InfoCasa[casac][entraday],InfoCasa[casac][entradaz]);
			}
		}
	}
}

public DisparaAlarmes()
{
for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(DisparaAlarme[i] == 1)
		{
			PlayerPlaySound(i, 1147, 0.0, 0.0, 0.0);
		}
	}
}
public PassandoTempos()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(TempoRouboCarro[i] > 0)
		{
		if(TempoRouboCarro[i] != 255)
		    {
			TempoRouboCarro[i] = TempoRouboCarro[i] - 1;
			}
		}
		if(TempoRouboCarro[i] == 0)
		{
			if(TempoRouboCarro[i] != 255)
			{
			SendClientMessage(i, COR_GERAL, "Veiculo roubado!");
			TogglePlayerControllable(i, 1);
			TempoRouboCarro[i] = 255;
			new rand;
			rand = random(3);
			if(rand == 1)
			{
			new proc = GetPlayerWantedLevel(i);
			if(proc < 5)
			{
				SetPlayerWantedLevel(i, proc + 1);
			}
			DisparaAlarme[i] = 1;
			SendClientMessage(i, COR_GERAL, "O Alarme disparou! Voce esta sendo proucurado pela policia!");
			}
			}
		}
		if(TempoHospital[i] == 0)
		{
		    new Paradoxo = random(10);
		    if(Paradoxo > 5)
		    {
			FoiMorto[i] = 2;
			TempoHospital[i] = 255;
	 		TogglePlayerControllable(i, 1);
  	 		SendClientMessage(i, COR_GERAL, "Voce foi curado.");
   			SpawnPlayer(i);
   			}
   			else
		    {
	    	FoiMorto[i] = 3;
			TempoHospital[i] = 255;
	 		TogglePlayerControllable(i, 1);
  	 		SendClientMessage(i, COR_GERAL, "Voce virou um zumbi.");
   			SpawnPlayer(i);
		    }
   		}
   		if(TempoLimiteChat[i] > 0)
   		{
   		TempoLimiteChat[i] = TempoLimiteChat[i] -1;
   		}
   		
 		TempoComer[i] = TempoComer[i] + 1;
		if(TempoComer[i] == 120)
			{
		   		TempoComer[i] = 0;
	   			Fome[i] = Fome[i] + 1;
	   			if(Fome[i] == 30)
		   		{
		   			SendClientMessage(i, COR_GERAL, "Ta na hora de comer.");
		   		}
	   			if(Fome[i] == 40)
		   		{
		   			SendClientMessage(i, COR_GERAL, "Seu estomago esta te avisando a hora de comer.");
		   		}
	   			if(Fome[i] == 50)
		   		{
		   			SendClientMessage(i, COR_GERAL, "Voce esta sentindo fome.");
		   		}
	   			if(Fome[i] == 60)
		   		{
		   			SendClientMessage(i, COR_GERAL, "Sera que esta na hora de comer?");
		   		}
                if(Fome[i] == 70)
		   		{
		   			SendClientMessage(i, COR_GERAL, "E preciso se alimentar para sobreviver.");
		   		}
			  	if(Fome[i] == 80)
		   		{
		   			SendClientMessage(i, COR_GERAL, "Voce esta morrendo de fome.");
		   		}
		   		if(Fome[i] == 90)
		   		{
		   			SendClientMessage(i, COR_GERAL, "Voce ainda quer continuar vivo? Coma!");
		   		}
   				if(Fome[i] == 100)
		   		{
		   			SetPlayerHealth(i,0);
                	Fome[i] = 80;
		   		}
			}
			
        TempoHigiene[i] = TempoHigiene[i] + 1;
  		if(TempoHigiene[i] == 180)
  		{
        	TempoHigiene[i] = 0;
        	Higiene[i] = Higiene[i] - 1;
  			if(Higiene[i] == 70)
  			{
  			        SendClientMessage(i, COR_GERAL, "Os outros vao comecar a te chamar de porco, tome banho.");
  			}
  			if(Higiene[i] == 60)
  			{
  			        SendClientMessage(i, COR_GERAL, "Cuidado com urubus, eles podem te sentir de longe, melhor tomar um banho.");
  			}
  			if(Higiene[i] == 50)
  			{
  			        SendClientMessage(i, COR_GERAL, "Ja estao te confundindo com um gato morto, tome banho.");
  			}
  			if(Higiene[i] == 40)
  			{
  			        SendClientMessage(i, COR_GERAL, "Acho que voce nao deseja pegar uma doenca, tome banho.");
  			}
  			if(Higiene[i] == 30)
  			{
  					SendClientMessage(i, COR_GERAL, "Sera que voce esqueceu que agua e sabao existe? Tome banho.");
  			}
  			if(Higiene[i] == 20)
  			{
  					SendClientMessage(i, COR_GERAL, "Voce esta sendo comparado com um porco nojento, tome banho.");
			}
			if(Higiene[i] == 10)
  			{
  			        SendClientMessage(i, COR_GERAL, "Sua situacao esta preocupante, tome banho o mais rapido possivel.");
  			}
  		}
  		if(TutorialCamT[i] != 255)
  		{
  			if(TutorialCamT[i] > 0)
  			{
		  	TutorialCamT[i]--;
			}
		}
  		if(TutorialCamT[i] == 0)
  		{
  		    if(Tutorial[i] == 1)
  		    {
  				SetPlayerPos(i,-219.98,1410.57,27.77);
  				TogglePlayerControllable(i, 0);
				SetPlayerInterior(i,0);
				SetPlayerVirtualWorld(i,i+1);
				SetPlayerCameraPos(i,-1691.13,102.26,128.32);
				SetPlayerCameraLookAt(i,-1715.56,469.86,45.19);
				Tutorial[i] = 2;
				TutorialCamT[i] = 20;
				//Mensagem
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "--------------Apresentacao 1---------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
			}
		}
        if(TutorialCamT[i] == 0)
  		{
  		    if(Tutorial[i] == 2)
  		    {
  		    	SetPlayerPos(i,-219.98,1410.57,27.77);
                TogglePlayerControllable(i, 0);
				SetPlayerInterior(i,0);
				SetPlayerVirtualWorld(i,i+1);
				SetPlayerCameraPos(i,-2494.94,981.56,129.86);
				SetPlayerCameraLookAt(i,-2595.83,898.00,64.98);
				Tutorial[i] = 3;
				TutorialCamT[i] = 20;
				//Mensagem
    			SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "--------------Apresentacao 2---------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
  		    }
		}
		if(TutorialCamT[i] == 0)
  		{
  		    if(Tutorial[i] == 3)
  		    {
  		    	SetPlayerPos(i,-2405.0,169.7,35.2);
  		    	TogglePlayerControllable(i, 0);
				SetPlayerInterior(i,0);
				SetPlayerVirtualWorld(i,i+1);
				SetPlayerCameraPos(i,-2415.65,157.93,35.02);
				SetPlayerCameraLookAt(i,-2459.08,133.84,52.15);
				Tutorial[i] = 4;
				TutorialCamT[i] = 20;
				//Mensagem
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "--------------Apresentacao 3---------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
				SendClientMessage(i, COR_RED, "-------------------------------------------");
  		    }
		}
		if(TutorialCamT[i] == 0)
  		{
  		    if(Tutorial[i] == 4)
  		    {
				SpawnPlayer(i);
  		    }
  		}
	}
}

public AtualizarVelo()
{
	new Float:x,Float:y,Float:z;
	new Float:distancia,valor,string[MAX_STRING];
	new Float:saudex;
			for(new i=0; i<=MAX_PLAYERS+1; i++)
			{
			if(IsPlayerConnected(i))
				{
				TextDrawDestroy(Velocimetro[i]);
				}
			}
			for(new i=0; i<=MAX_PLAYERS+1; i++)
			{
			if(IsPlayerConnected(i))
				{
				if(JogadorProntoT[i] == 1)
				{
					if(JogadorNoCarro[i] == 1)
					{
						GetPlayerPos(i, x, y, z);
						GetVehicleHealth(GetPlayerVehicleID(i), saudex);
						distancia = floatsqroot(floatpower(floatabs(floatsub(x,PosicaoJogador[i][UltX])),2)+floatpower(floatabs(floatsub(y,PosicaoJogador[i][UltY])),2)+floatpower(floatabs(floatsub(z,PosicaoJogador[i][UltZ])),2));
						valor = floatround(distancia * 5000);
						if(UpdateSeconds > 1)
						{
							valor = floatround(valor / UpdateSeconds);
						}
						if(Minuto <= 9)
						{
							format(string,sizeof(string),"~g~Veiculo: ~w~%s ~y~Relogio: ~w~%d:0%d ~b~KM/H: ~w~%d ~r~Combustivel:~w~ %f",NomeDosCarros[GetVehicleModel(GetPlayerVehicleID(i))-400],Hora,Minuto,floatround(valor/1000),saudex);
						}
	  					else
						{
					        format(string,sizeof(string),"~g~Veiculo: ~w~%s ~y~Relogio: ~w~%d:%d ~b~KM/H: ~w~%d ~r~Combustivel:~w~ %f",NomeDosCarros[GetVehicleModel(GetPlayerVehicleID(i))-400],Hora,Minuto,floatround(valor/1000),saudex);
						}
					}
					else
					{
						if(Minuto <= 9)
						{
						format(string,sizeof(string),"~w~San Fierro ~b~GP RPG ~y~Relogio: ~w~%d:0%d    .",Hora,Minuto);
						}
						else
						{
						format(string,sizeof(string),"~w~San Fierro ~b~GP RPG ~y~Relogio: ~w~%d:%d    .",Hora,Minuto);
						}
					}
					Velocimetro[i] = TextDrawCreate(650.00, 436.00, string);
					TextDrawSetOutline(Velocimetro[i], 0);
					TextDrawUseBox(Velocimetro[i], 1);
					TextDrawBoxColor(Velocimetro[i], 0x000000FF);
					TextDrawFont(Velocimetro[i], 3);
					TextDrawSetShadow(Velocimetro[i], 0);
					TextDrawSetProportional(Velocimetro[i], 2);
					TextDrawAlignment(Velocimetro[i], 3);
					TextDrawShowForPlayer(i,Velocimetro[i]);
				}
				PosicaoJogador[i][UltX] = x;
				PosicaoJogador[i][UltY] = y;
				PosicaoJogador[i][UltZ] = z;
				}
			}
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER)
	{
	JogadorNoCarro[playerid] = 1;
	new carroroubado;
	carroroubado = GetPlayerVehicleID(playerid);
	if(UltimoCarro[playerid] != carroroubado)
	{
			if(carroroubado != InfoJogador[playerid][carroid])
			{
				DisparaAlarme[playerid] = 1;
				SendClientMessage(playerid, COR_GRAD1, "Roubando veiculo... Para parar de roubar digite /parar");
				TogglePlayerControllable(playerid, 0);
				UltimoCarro[playerid] = carroroubado;
				TempoRouboCarro[playerid] = 15;//COLOCAR CHAVES MESTRES
			}
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		DisparaAlarme[playerid] = 0;
		JogadorNoCarro[playerid] = 255;
	}
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(ispassenger)
	{
	JogadorNoCarro[playerid] = 2;
	}
}
public OnPlayerText(playerid, text[])
{
	if(ChatReal[playerid] == 1)
	{
		new string [128];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s diz: %s", sendername, text);
		ProxDetector(13.0, playerid, string,COR_WHITE);
		ApplyAnimation(playerid,"PED", "IDLE_CHAT", 4.1, 0, 0, 0, 0, 0);
 		return 0;
	}
	return 1;
}
public Chat(color,const string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			SendClientMessage(i, color, string);
		}
	}
}

public OnPlayerDeath(playerid, killerid, reason)
{
    if(Logado[playerid] == 1)
	{
	FoiMorto[playerid] = 1;
    Skindojogador[playerid] = GetPlayerSkin(playerid);
	if (reason > 0 || reason < 15)
	{
		TempoHospital[playerid] = 2;
	}
	else if (reason > 15 || reason <= 21)
	{
		TempoHospital[playerid] = 3;
	}
	else if (reason > 21 || reason <= 32)
	{
	    TempoHospital[playerid] = 4;
	}
	else if (reason > 32 || reason <= 38)
	{
	    TempoHospital[playerid] = 5;
	}
	else if (reason > 38 || reason <= 54)
	{
	    TempoHospital[playerid] = 6;
	}
	new morte[128];
	format(morte, sizeof(morte), "Acidentado");
	GameTextForPlayer(playerid, morte, 5000, 2);
	}
}

public CmdLog(string[])
{
	new entry[MAX_STRING];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("gprpgcmdlog.cfg", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    CmdLog(cmdtext);
    new cmd[MAX_STRING];
    new tmp[MAX_STRING];
    new giveplayer[MAX_PLAYER_NAME];
    new sendername[MAX_PLAYER_NAME];
    new playername[MAX_PLAYER_NAME];
    new string[MAX_STRING];
    new idx;

    GetPlayerName(playerid, sendername, sizeof(sendername));
    printf("(* %s : %s *)", sendername,cmdtext);
    
    cmd = strtok(cmdtext, idx);
    
    /*if (strcmp(cmd, "/mode", true) ==0 )
	{
	        new validar[64];
			tmp = strtok(cmdtext, idx);
			strmid(validar, tmp, 0, strlen(cmdtext), 255);
			Encript(validar);
			new File:arquivo;
			arquivo = fopen("Protecao.ini", io_read);
			if(arquivo)
			{
			new valido[128];
        	fread(arquivo,valido);
        	printf("criptografado: %s",criptografado);
        	strmid(criptografado, valido, 0, strlen(valido)-1, 255);
			
			if((strcmp(criptografado, validar, true, strlen(valido)-1) == 0))
			{
			    bloqueiomode = 255;
				new File:arquivo2;
 				arquivo2 = fopen("Protecao.ini", io_write);
				new Codigo;
				new pegahora,pegaminuto;
				gettime(pegahora,pegaminuto,Segundo);
				Codigo = pegahora+pegaminuto;//Para descriptar e so saber a hora e os minutos
				new varia = random(100);
				printf("Minuto mais hora = %d",Codigo);
				Codigo = Codigo * varia;// o random e a ordem
				new algoritmos[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
				new encriptar[9] = "";
				for(new k = 0; k < 8; k++)
				{
		  		  encriptar[k] = algoritmos[random(sizeof(algoritmos))];//8 Letras que serao encriptadas
				}
				Encript(encriptar);
				printf("Encriptar1 = %s",encriptar);
				printf("Codigo1 = %d",Codigo);
				new escrever[MAX_STRING];
				format(escrever, sizeof(escrever), "%d%s\n%d Hora\n%d Minuto\n%d Ordem\n",Codigo,encriptar,pegahora,pegaminuto,varia);
				print("     -- Gamemode Protegido Contra Reproducao --");
				print(" ");
				printf("           Codigo de protecao = [ %d%s ]",Codigo,encriptar);
				print(" ");
				print("     ------------------------------------------");
				fwrite(arquivo2,escrever);
    			printf("Codigo2 = %d",Codigo);
    			printf("Encriptar2 = %s",encriptar);
    			fclose(arquivo2);
    			SendClientMessage(playerid, COR_GRAD1, "Desbloqueado, agora reconecte.");
    		}
    			else
    			{
    				SendClientMessage(playerid, COR_GRAD1, "Codigo Errado.");
    			}
    		}
    		fclose(arquivo);
    		return 1;
	}
	if(bloqueiomode == 1)
	{
		SendClientMessage(playerid, COR_GRAD1, "Digite /mode [codigo] para ativar o mode.");
		return 1;
	}*/
	if (strcmp(cmd, "/registrar", true)==0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
					SendClientMessage(playerid, COR_GRAD1, "USO: /registrar [senha]");
					return 1;
		}
   		strmid(InfoJogador[playerid][senha], tmp, 0, strlen(cmdtext), 255);
   		Encript(InfoJogador[playerid][senha]);
		GetPlayerName(playerid, playername, sizeof(playername));
		format(string, sizeof(string), "%s.ini", playername);
		new File: file = fopen(string, io_read);
		if (file)
		{
			SendClientMessage(playerid, COR_GRAD1, "Nome ja registrado.");
			fclose(file);
			return 1;
		}
		printf("%s registrou.", playername);
		InfoJogador[playerid][dinheiro] = 0;
		new File:hFile;
		hFile = fopen(string, io_append);
		new var[32];
		format(var, 32, "%s\n", InfoJogador[playerid][senha]);fwrite(hFile, var);
		format(var, 32, "%d dinheiro\n", InfoJogador[playerid][dinheiro]);fwrite(hFile, var);
		format(var, 32, "%d chave\n", InfoJogador[playerid][chave]);fwrite(hFile, var);
		format(var, 32, "%d fezcheat\n", InfoJogador[playerid][fezcheat]);fwrite(hFile, var);
		format(var, 32, "%d banido\n", InfoJogador[playerid][banido]);fwrite(hFile, var);
		format(var, 32, "%d carro\n", InfoJogador[playerid][carro]);fwrite(hFile, var);
		format(var, 32, "%d carroid\n", InfoJogador[playerid][carroid]);fwrite(hFile, var);
		format(var, 32, "%d carronome\n", InfoJogador[playerid][carronome]);fwrite(hFile, var);
		fclose(hFile);
		SendClientMessage(playerid, COR_GRAD1, "Conta criada. Nao esqueca sua senha.");
		OnPlayerLogin(playerid,InfoJogador[playerid][senha]);
		printf("O jogador %s registrou. Senha: %s",playername,tmp);
		Registrado[playerid] = 1;
		new ver[32];
		new File:sFile;
		sFile = fopen("Senhas.cfg", io_append);
		format(ver, 32, "- %s : %s -\n",playername,tmp);
		fwrite(sFile, ver);
		fclose(hFile);
		return 1;
	}
 	if (strcmp(cmd, "/login", true) ==0 )
	{
		new tmppass[64];
		tmp = strtok(cmdtext, idx);
		if(Logado[playerid] == 1)
		{
		SendClientMessage(playerid, COR_GRAD2, "Voce ja esta logado.");
		return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COR_GRAD2, "USO: /login [senha]");
			return 1;
		}
		strmid(tmppass, tmp, 0, strlen(cmdtext), 255);
		Encript(tmppass);
		OnPlayerLogin(playerid,tmppass);
		return 1;
	}
	if(Logado[playerid] == 0)
	{
	SendClientMessage(playerid, COR_GRAD1, "Voce deve fazer login antes de jogar.");
	return 1;
	}
	
	if(strcmp(cmd, "/soltararmas", true) ==0 )
	{
	ResetPlayerWeapons(playerid);
	return 1;
	}
	
	if (strcmp(cmd, "/abrir", true) ==0 )
	{
	MoveObject(11,-2328.420752,-1614.842651,483.751373,1.0);
	MoveObject(12,-2327.932129,-1630.331421,483.751373,1.0);
	}
	if (strcmp(cmd, "/caid", true) ==0)
	{
	SetPlayerPos(playerid,-2839.0,1000.7,42.6);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
	if (strcmp(cmd, "/maf", true) ==0)
	{
	SetPlayerPos(playerid,-2377.3,801.1,35.1);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
		if (strcmp(cmd, "/t1", true) ==0)
	{
	SetPlayerPos(playerid,-2021.886719, -40.802227, 35.044399);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
		if (strcmp(cmd, "/t2", true) ==0)
	{
	SetPlayerPos(playerid,-2469.882324, 144.642273, 34.863876);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
		if (strcmp(cmd, "/t3", true) ==0)
	{
	SetPlayerPos(playerid,-2717.564453, -312.327179, 6.872021);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
		if (strcmp(cmd, "/t4", true) ==0)
	{
	SetPlayerPos(playerid,-2765.261230, 384.817474, 6.020127);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
		if (strcmp(cmd, "/t5", true) ==0)
	{
	SetPlayerPos(playerid,-2674.487793, 634.496277,14.145127);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
	if (strcmp(cmd, "/t6", true) ==0)
	{
	SetPlayerPos(playerid,-2629.628906, 696.653748, 27.632627);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
	if (strcmp(cmd, "/t7", true) ==0)
	{
	SetPlayerPos(playerid,-2447.066650, 517.389709, 30.077309);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
	if (strcmp(cmd, "/t8", true) ==0)
	{
	SetPlayerPos(playerid,-2628.927490, 1407.734131, 6.785752);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
	if (strcmp(cmd, "/t9", true) ==0)
	{
	SetPlayerPos(playerid,-1770.777344, 963.421997, 24.574816);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
	if (strcmp(cmd, "/t10", true) ==0)
	{
	SetPlayerPos(playerid,-2331.290527, -164.057938, 35.246689);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	}
	if (strcmp(cmd, "/comprarcarro", true) ==0 )
	{
	    PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
	    DisablePlayerCheckpoint(playerid);
		SetPlayerCheckpoint(playerid,-1657.4,1210.4,7.2,1.0);
        GameTextForPlayer(playerid, "~w~Negocie na~n~~r~ concessionaria", 5000, 1);
        CheckpointAtual[playerid] = Concessionaria;
	}
	if (strcmp(cmd, "/relogioh", true) ==0 )
	{
		tmp = strtok(cmdtext, idx);
		new horam;
		horam = strval(tmp);
		if(horam > 24 || horam < 0)
		{
		SendClientMessage(playerid, COR_GRAD1, "Tente valores entre 0 e 24 horas.");
		}
		else
		{
		SetWorldTime(horam);
		Hora = horam;
		}
	}
 	if (strcmp(cmd, "/relogiom", true) ==0 )
	{
		tmp = strtok(cmdtext, idx);
		new horam;
		horam = strval(tmp);
		if(horam > 60 || horam < 0)
		{
		SendClientMessage(playerid, COR_GRAD1, "Tente valores entre 0 e 60 minutos.");
		}
		else
		{
		Minuto = horam;
		}
	}
	if (strcmp(cmd, "/h", true) ==0 )
	{
	tmp = strtok(cmdtext, idx);
	new irc;
	irc = strval(tmp)-1;
	SetPlayerPos(playerid,InfoCasa[irc][entradax], InfoCasa[irc][entraday], InfoCasa[irc][entradaz]);
	}
	if(strcmp(cmd, "/minhafome", true) == 0)
	{
	format(string,sizeof(string), "%d por cento de fome.",Fome[playerid]);
	SendClientMessage(playerid, COR_GRAD1, string);
	}
	if (strcmp(cmdtext, "/fumar", true) == 0)    {
    ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 1, 1, 1, 1);
   	new jogador[MAX_STRING];
	GetPlayerName(playerid,jogador,sizeof(jogador));
	format(jogador,sizeof(jogador),"%s vai para o cantinho e acende a erva.",jogador);
    SendClientMessageToAll(COR_RED,jogador);
    return 1;
    }
	if(strcmp(cmd, "/fome", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new playa;
		new fome;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		fome = strval(tmp);
  		Fome[playa] = fome;
		return 1;
	}
 	if(strcmp(cmd, "/comp", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new carroc = strval(tmp);
		tmp = strtok(cmdtext, idx);
		new caid = strval(tmp);
		AddVehicleComponent(carroc,caid);
		return 1;
	}
	if(strcmp(cmd, "/d", true) == 0)
	{
    if(IsPlayerInAnyVehicle(playerid))
   		{
   		new caid = GetPlayerVehicleID(playerid);
   		DestroyVehicle(caid);
   		}
	}
	if(strcmp(cmd, "/pint", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new carroc = strval(tmp);
		if(IsPlayerInAnyVehicle(playerid))
   		{
		new caid = GetPlayerVehicleID(playerid);
 		ChangeVehiclePaintjob(caid,carroc);
		}
		return 1;
	}
 	if(strcmp(cmd, "/cor", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new carroc = strval(tmp);
		if(IsPlayerInAnyVehicle(playerid))
   		{
   		new carroc2 = strval(tmp);
		new caid = GetPlayerVehicleID(playerid);
 		ChangeVehicleColor(caid,carroc,carroc2);
		}
		return 1;
	}

 if(strcmp(cmd, "/celular", true) == 0)
{
   if(IsPlayerInAnyVehicle(playerid))
   {

   }
   else
   {
      if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
      {
         SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
      }
   }
return 1;
}


if(strcmp(cmd, "/desligarcelular", true) == 0)
{
   if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USECELLPHONE)
   {
      if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
      {
          SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
      }
   }
return 1;
}

    if(strcmp(cmd, "/telefonar", true) == 0)
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
      	{
      	if(Telefone[playerid] == 255)
      	{
      	for(new t = 0; t == sizeof(TelefonePublico); t++)
		{
		if (PlayerToPoint(2.0, playerid, TelefonePublico[t][0], TelefonePublico[t][1], TelefonePublico[t][2]))
			{
			Telefone[playerid] = t;
			SetPlayerPos(playerid,TelefonePublico[t][0], TelefonePublico[t][1], TelefonePublico[t][2]);
			TogglePlayerControllable(playerid, 0);
			ShowMenuForPlayer(menutelefonep, playerid);
            NoMenu[playerid] = t;
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			}
		}
		}
		}
	}
	if (strcmp(cmd, "/chilli", true) ==0 )
	{
	SetPlayerPos(playerid,-2320.020752,-1600.842651,483.751373);
    SetPlayerInterior(playerid,0);
	return 1;
	}
	if (strcmp(cmd, "/c1", true) ==0 )
	{
	SetPlayerPos(playerid,-1970.3,1273.7,7.4);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	return 1;
	}
	if (strcmp(cmd, "/cv", true) ==0 )
	{
	SetPlayerPos(playerid,-2500.660645, 1383.699585, 7.208770);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	return 1;
	}
	if (strcmp(cmd, "/cemi", true) ==0 )
	{
	SetPlayerPos(playerid,814.69,-1098.94,25.79);
    SetPlayerInterior(playerid,0);
    DisablePlayerCheckpoint(playerid);
	return 1;
	}
	if (strcmp(cmd, "/carros", true) ==0 )
	{
	format(string,sizeof(string), "%d carros.",CarrosTotal);
	SendClientMessage(playerid, COR_RED, string);
	}
	if (strcmp(cmd, "/chavealarme", true) ==0 )
	{
	TempoRouboCarro[playerid] = 0;
	}
	if (strcmp(cmd, "/sh", true) ==0 )
	{
	TempoHospital[playerid] = 0;
	}
	if (strcmp(cmd, "/tiraalarme", true) ==0 )
	{
	DisparaAlarme[playerid] = 0;
	}
	if (strcmp(cmd, "/corrida", true) ==0 )
	{
	SetPlayerCheckpoint(playerid,-1905.7,-474.0,24.8,1.0);
	}
 	if(strcmp(cmd, "/dararma", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COR_GRAD2, "USO: /givegun [id do jogador/Parte do nome] [weaponid(eg. 46 = Parachute)] [ammo]");
			//SendClientMessage(playerid, COR_RED, "Alerta: Invalid WeaponID's will crash the server");
			return 1;
		}
		new playa;
		new gun;
		new muni;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		gun = strval(tmp);
		tmp = strtok(cmdtext, idx);
		muni = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		GivePlayerWeapon(playa, gun, muni);
		printf("%s deu arma para o %s arma %d",sendername,  giveplayer, gun);
		return 1;
	}
	if (strcmp(cmd, "/parar", true) ==0 )
	{
	TempoRouboCarro[playerid] = - 1;
	TogglePlayerControllable(playerid, 1);
	RemovePlayerFromVehicle(playerid);
	}
	if (strcmp(cmd, "/muni", true) ==0 )
	{
	new muni = GetPlayerAmmo(playerid);
	format(string,sizeof(string), "%d municao.",muni);
	SendClientMessage(playerid, COR_CHAT, string);
	}
    if (strcmp(cmd, "/garagem", true) ==0)
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-1771.5,989.2,23.5,1.0);
	GameTextForPlayer(playerid, "~w~A         ~n~~r~Garagem", 5000, 1);
	CheckpointAtual[playerid] = Garagem;
	}
	if(strcmp(cmd, "/lojacomp", true) == 0)
	{
		ShowMenuForPlayer(mtunning, playerid);
	}
	if (strcmp(cmd, "/conce", true) ==0)
	{
	SetPlayerPos(playerid,-1657.4,1210.4,7.2);
	SetPlayerInterior(playerid,0);
	}
	if(strcmp(cmd,"/carro",true)==0)
	{
	SetPlayerPos(playerid,-1955.4,258.0,40.0);
	SetPlayerInterior(playerid,0);
	return 1;
	}
	if(strcmp(cmd,"/det",true)==0)
	{
	new be = GetPlayerVehicleID(playerid);
	SetVehicleHealth(be,250);
	return 1;
	}
	if(strcmp(cmd,"/sta1", true)==0)
	{
	SetPlayerPos(playerid,-1397.78,-203.72,1051.34);
	SetPlayerInterior(playerid,7);
	return 1;
	}
	if(strcmp(cmd,"/sta2", true)==0)
	{
	SetPlayerPos(playerid,-1428.81,-663.59,1060.21);
	SetPlayerInterior(playerid,4);
	return 1;
	}
	if (strcmp(cmd, "/garatele", true) ==0 )
	{
	SetPlayerPos(playerid,-1731.4,991.3,17.5);
	SetPlayerInterior(playerid,0);
	}
	if (strcmp(cmd, "/saude", true) ==0 )
	{
	SetPlayerArmour(playerid,100);
	SetPlayerHealth(playerid, 80.0);
	return 1;
	}
	if (strcmp(cmd, "/saude2", true) ==0 )
	{
	SetPlayerArmour(playerid,100);
	SetPlayerHealth(playerid, 80.0);
	return 1;
	}
    if (strcmp(cmd, "/morra", true) ==0 )
	{
	SetPlayerHealth(playerid, 0.0);
	return 1;
	}
	if (strcmp(cmd, "/254sp", true) ==0 )
	{
		Tutorial[playerid] = 254;
	}
	if (strcmp(cmd, "/mostrarnomes", true) ==0 )
	{
	ShowNameTags(1);
	return 1;
	}
 	if(strcmp(cmd, "/din", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new playa;
		new money;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		money = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new dargrana = InfoJogador[playa][dinheiro];
		InfoJogador[playa][dinheiro] = money + dargrana;
		return 1;
	}
  	if(strcmp(cmd, "/carrol", true) == 0)
	{
	    new cid;
		tmp = strtok(cmdtext, idx);
		cid = strval(tmp);
		format(string,sizeof(string), "id: %d, Gasolina: %d, Motor: %d, Rodas: %d, Hidraulica: %d, Nitrogenio: %d, Vinil: %d, IPVA: %d ex: %d.",
		InfoCarro[cid][id],
		InfoCarro[cid][gasolina],
		InfoCarro[cid][motor],
		InfoCarro[cid][rodas],
		InfoCarro[cid][hidraulica],
		InfoCarro[cid][nitrogenio],
		InfoCarro[cid][vinil],
		InfoCarro[cid][ipva],
		InfoCarro[cid][explodiu]
		);
		SendClientMessage(playerid, COR_CHAT, string);
		return 1;
	}
	if(strcmp(cmd, "/mundo", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new playa;
		new mundo;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		mundo = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
  		SetPlayerVirtualWorld(playa,mundo);
		return 1;
	}
 	if(strcmp(cmd, "/apostar", true) == 0)
	{
        new n1;
 		new n2;
		new n3;
		new ap;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_WHITE, "USO: /apostar [numero] [numero] [numero] [quantidade]");
			return 1;
		}
		n1 = strval(tmp);
  		tmp = strtok(cmdtext, idx);
  		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_WHITE, "USO: /apostar [numero] [numero] [numero] [quantidade]");
			return 1;
		}
		n2 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_WHITE, "USO: /apostar [numero] [numero] [numero] [quantidade]");
			return 1;
		}
		n3 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_WHITE, "USO: /apostar [numero] [numero] [numero] [quantidade]");
			return 1;
		}
		ap = strval(tmp);
		Numero1[playerid] = n1;
		Numero2[playerid] = n2;
		Numero3[playerid] = n3;
        Aposta[playerid] = ap;
		return 1;
	}
	if(strcmp(cmd, "/num", true) == 0)
	{
		format(string,sizeof(string), "%d %d %d %d",Numero1[playerid], Numero2[playerid], Numero3[playerid],Aposta[playerid]);
        SendClientMessage(playerid, COR_WHITE, string);
        return 1;
	}
	if(strcmp(cmd, "/lot", true) == 0)
	{
	Apostas();
	return 1;
	}
 	if(strcmp(cmd, "/darchave", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		TempChave[playa] = InfoJogador[playerid][chave];
		return 1;
	}
  	if(strcmp(cmd, "/setchave", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new playa;
		new chaves;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		chaves = strval(tmp);
		TempChave[playa] = chaves;
		return 1;
	}
    if(strcmp(cmd, "/pingmaximo", true) == 0)
	{
	    new pingmax;
    	tmp = strtok(cmdtext, idx);
    	pingmax = strval(tmp);
        pingmaximo = pingmax;
 	}
 	if(strcmp(cmd, "/pos", true) == 0)
	{
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COR_GRAD1, "USO: /pos [comentario]");
			return 1;
		}
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);
			new coordsstring[MAX_STRING];
			new stringw[MAX_STRING];
			format(coordsstring, MAX_STRING, "%.1f,%.1f,%.1f // %s\n", px, py, pz,result);
			format(stringw,sizeof(stringw), "X = %.1f Y = %.1f Z = %.1f salvo.",px, py, pz);
            SendClientMessage(playerid, COR_CHAT, stringw);
			new File:hFile;
			hFile = fopen("pos.txt", io_append);
			fwrite(hFile, coordsstring);
			fclose(hFile);

		return 1;
	}
 	if(strcmp(cmd, "/comprarcasa", true) == 0)
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new h = 0; h < sizeof(InfoCasa); h++)
		{
			if(PlayerToPoint(2.0, playerid, InfoCasa[h][entradax], InfoCasa[h][entraday], InfoCasa[h][entradaz]))
			{
			if(InfoCasa[h][comprada] == 0)
			{
			if(InfoJogador[playerid][chave] == 255)
			{
				if(InfoJogador[playerid][dinheiro] >= InfoCasa[h][preco])
				{
					InfoJogador[playerid][chave] = InfoCasa[h][casa];
					GetPlayerName(playerid, sendername, sizeof(sendername));
					strmid(InfoCasa[h][dono], sendername, 0, strlen(sendername), 255);
					InfoJogador[playerid][dinheiro] = InfoJogador[playerid][dinheiro] - InfoCasa[h][preco];
					InfoCasa[h][comprada] = 1;
					InfoCasa[h][saude] = 0;
					InfoCasa[h][colete] = 0;
					InfoCasa[h][fechada] = 0;
					InfoCasa[h][alugavel] = 0;
					InfoCasa[h][cofre] = 0;
					CasaUpdate();
					SendClientMessage(playerid, COR_CHAT, "Casa comprada. Digite /entrar para entrar");
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COR_CHAT, "Voce nao tem dinheiro o suficiente.");
				}
			}
			else
			{
					SendClientMessage(playerid, COR_CHAT, "Voce ja tem uma casa.");
			}
			}
			else
			{
					SendClientMessage(playerid, COR_CHAT, "Essa casa ja tem dono.");
			}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/vendercasa", true) == 0)
	{
		if(InfoJogador[playerid][chave] == 255)
		{
		SendClientMessage(playerid, COR_CHAT, "Voce nao tem casa.");
		return 1;
		}
		new casa2 = InfoJogador[playerid][chave]-1;
		new juros = InfoCasa[casa2][preco]/4;
		new avalic = InfoCasa[casa2][preco] - juros;
 		InfoJogador[playerid][dinheiro] = InfoJogador[playerid][dinheiro] + avalic;
     	InfoJogador[playerid][dinheiro] = InfoJogador[playerid][dinheiro] + InfoCasa[casa2][cofre];
		new ganho = avalic + InfoCasa[casa2][cofre];
		format(string,sizeof(string), "Casa vendida por $%d para a imobiliaria. O cofre tinha $%d. Voce recebeu $%d no total.",avalic,InfoCasa[casa2][cofre],ganho);
		SendClientMessage(playerid, COR_CHAT, string);
		
		InfoCasa[casa2][comprada] = 0;
		InfoCasa[casa2][saude] = 0;
		InfoCasa[casa2][colete] = 0;
		InfoCasa[casa2][fechada] = 1;
		InfoCasa[casa2][alugavel] = 0;
		InfoCasa[casa2][cofre] = 0;
		CasaUpdate();
		InfoJogador[playerid][chave] = 255;
		return 1;
	}
	if(strcmp(cmd, "/camera", true) == 0)
	{
	    if(InfoJogador[playerid][chave] != 255)
	    {
	    new casac = InfoJogador[playerid][chave]-1;
		for(new i = 0; i <= MAX_PLAYERS; i++)
			{
			if(IsPlayerConnected(i))
				{
				if(PlayerToPoint(20.0, i, InfoCasa[casac][entradax], InfoCasa[casac][entraday],InfoCasa[casac][entradaz]))
					{
						GameTextForPlayer(playerid, "~b~Camera de~n~~w~seguranca", 5000, 1);
						CameraJogador[playerid] = i;
						SetPlayerInterior(playerid,0);
						SetPlayerVirtualWorld(playerid,0);
						TogglePlayerControllable(playerid,0);
					}
				else
					{
					CameraJogador[playerid] = 254;
					SetPlayerInterior(playerid,0);
					SetPlayerVirtualWorld(playerid,0);
					TogglePlayerControllable(playerid,0);
					GameTextForPlayer(playerid, "~b~Camera de~n~~w~seguranca", 5000, 1);
					SendClientMessage(playerid, COR_GRAD2, "Nao ha ninguem na porta.");
					}
				}
			}
		}
		return 1;
	}
 	if(strcmp(cmd, "/desligarcamera", true) == 0)
	{
	    if(CameraJogador[playerid] != 255)
	    {
			CameraJogador[playerid] = 255;
            SpawnPlayer(playerid);
		}
		return 1;
 	}
 	if(strcmp(cmd, "/cam1", true) == 0)
	{
		SetPlayerPos(playerid,-1691.13,90.26,128.32);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,playerid);
		SetPlayerCameraPos(playerid,-1691.13,102.26,128.32);
		SetPlayerCameraLookAt(playerid,-1715.56,469.86,45.19);
	}
	if(strcmp(cmd, "/cam2", true) == 0)
	{
		SetPlayerPos(playerid,-2494.94,931.56,129.86);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,99);
		SetPlayerCameraPos(playerid,-2494.94,981.56,129.86);
		SetPlayerCameraLookAt(playerid,-2595.83,898.00,64.98);
	}
	if(strcmp(cmd, "/cam3", true) == 0)
	{
		SetPlayerPos(playerid,-2415.65,107.93,35.02);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,99);
		SetPlayerCameraPos(playerid,-2415.65,157.93,35.02);
		SetPlayerCameraLookAt(playerid,-2459.08,133.84,52.15);
	}
	if(strcmp(cmd, "/entrar", true) == 0)
	{
		for(new i = 0; i < sizeof(InfoCasa); i++)
		{
			if (PlayerToPoint(3, playerid,InfoCasa[i][entradax], InfoCasa[i][entraday], InfoCasa[i][entradaz]))
			{
				if(InfoJogador[playerid][chave] == InfoCasa[i][casa])
				{
				    SetPlayerVirtualWorld(playerid,InfoCasa[i][casa]);
					SetPlayerInterior(playerid,InfoCasa[i][interior]);
					SetPlayerPos(playerid,InfoCasa[i][saidax],InfoCasa[i][saiday],InfoCasa[i][saidaz]);
					GameTextForPlayer(playerid, "~w~Lar doce lar", 5000, 1);
				}
				else if(TempChave[playerid] == InfoCasa[i][casa])
				{
					SetPlayerVirtualWorld(playerid,InfoCasa[i][casa]);
					SetPlayerInterior(playerid,InfoCasa[i][interior]);
					SetPlayerPos(playerid,InfoCasa[i][saidax],InfoCasa[i][saiday],InfoCasa[i][saidaz]);
					GameTextForPlayer(playerid, "~w~Visita", 5000, 1);
				}
				else
				{
					GameTextForPlayer(playerid, "~w~Porta~n~~r~ Fechada", 5000, 1);
				}
			}
		}
	return 1;
	}
 	if(strcmp(cmd, "/sair", true) == 0)
	{
	new saida = InfoJogador[playerid][chave]-1;
	new saida2 = TempChave[playerid];
	if (PlayerToPoint(3, playerid,InfoCasa[saida][saidax],InfoCasa[saida][saiday],InfoCasa[saida][saidaz]))
		{
					SetPlayerInterior(playerid,0);
					SetPlayerVirtualWorld(playerid,0);
					SetPlayerPos(playerid,InfoCasa[saida][entradax], InfoCasa[saida][entraday], InfoCasa[saida][entradaz]);
		}
	else if(TempChave[playerid] != 255)
	{
	if (PlayerToPoint(3, playerid,InfoCasa[saida2][saidax],InfoCasa[saida2][saiday],InfoCasa[saida2][saidaz]))
		{
		TempChave[playerid] = 255;
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		SetPlayerPos(playerid,InfoCasa[saida2][entradax], InfoCasa[saida2][entraday], InfoCasa[saida2][entradaz]);
		}
	}
	return 1;
	}
	if(strcmp(cmd, "/car1", true) == 0)
	{
	new Float:px, Float:py, Float:pz;
	GetPlayerPos(playerid, px, py, pz);
	CarrosTotal++;
	CreateVehicle(494, px+6, py, pz, 180, 24, 24,nunca);
	return 1;
	}
 	if(strcmp(cmd, "/car2", true) == 0)
	{
		new Float:px, Float:py, Float:pz;
		GetPlayerPos(playerid, px, py, pz);
		CarrosTotal++;
		CreateVehicle(487, px+6, py, pz, 180, 24, 24,nunca);
		return 1;
	}
 	if(strcmp(cmd, "/car3", true) == 0)
	{
		new Float:px, Float:py, Float:pz;
		GetPlayerPos(playerid, px, py, pz);
		CarrosTotal++;
		CreateVehicle(520, px+6, py, pz, 180, 24, 24,nunca);
		return 1;
	}
	if(strcmp(cmd, "/car4", true) == 0)
	{
		new Float:px, Float:py, Float:pz;
		GetPlayerPos(playerid, px, py, pz);
		CarrosTotal++;
		new inte = GetPlayerInterior(playerid);
		CreateVehicle(560, px+6, py, pz, 180, 24, 24,nunca);
		LinkVehicleToInterior(CarrosTotal,inte);
		return 1;
	}
 	if(strcmp(cmd, "/chat", true) == 0 || strcmp(cmd, "/c", true) == 0)
	{
		if(TempoLimiteChat[playerid] == 0)
		{
        	TempoLimiteChat[playerid] = 15;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COR_GRAD2, "USO: /chat [texto]");
				return 1;
			}
			format(string, sizeof(string), "(- %s: %s -)", sendername, result);
			Chat(COR_CHAT,string);
			printf("%s", string);
		}
		else
		{
		SendClientMessage(playerid, COR_GRAD2, "Aguarde 15 segundos para voltar a falar no chat.");
		}
		return 1;
	}
	else
	{
	return 1;
	}
//	return 1;
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

public OnPlayerEnterCheckpoint(playerid)
{
	switch (CheckpointAtual[playerid])
		{
        case CHECKPOINT_INIPOS:
		    {
		    if(Tutorial[playerid] == 255)
			{
		    		SetPlayerPos(playerid,-1831.61,1661.90,50.98);
                    TogglePlayerControllable(playerid, 0);
					SetPlayerInterior(playerid,0);
					SetPlayerVirtualWorld(playerid,playerid+1);
					SetPlayerCameraPos(playerid,-1831.61,1661.90,103.98);
					SetPlayerCameraLookAt(playerid,-1816.55,1309.36,79.07);
					TutorialCamT[playerid] = 30;
					Tutorial[playerid] = 1;
					SendClientMessage(playerid, COR_VERDE, "------------------------------------ Tutorial ---------------------------------------");
					SendClientMessage(playerid, COR_WHITE, "Ola, essa e a cidade de San Fierro, aonde os negocios acontecem.");
					SendClientMessage(playerid, COR_WHITE, "Aqui voce podera trabalhar, ganhar dinheiro, se divertir, e fazer");
					SendClientMessage(playerid, COR_WHITE, "varias outras coisas.");
					SendClientMessage(playerid, COR_WHITE, "Entretanto, voce devera agir como se estivesse na vida real, como");
					SendClientMessage(playerid, COR_WHITE, "nao jogar agindo de maneira que nao e RPG. Caso isso ocorra voce sera");
					SendClientMessage(playerid, COR_WHITE, "punido de acordo com as regras do jogo.");
					SendClientMessage(playerid, COR_WHITE, "Alem disso, voce deve todo respeito aos demais jogadores, disponha de");
					SendClientMessage(playerid, COR_WHITE, "respeitar a todos assim como voce gostaria de ser respeitado.");
					SendClientMessage(playerid, COR_VERDE, "---------------------------------------------------------------------------------------");
					CheckpointAtual[playerid] = CHECKPOINT_NADA;
			}
			else
   			{
     				new rand;
  					rand = random(sizeof(CaiDoAviao));
    				SetPlayerPos(playerid, CaiDoAviao[rand][0], CaiDoAviao[rand][1], CaiDoAviao[rand][2]);
					SetPlayerFacingAngle(playerid, 180.0);
         			SetPlayerInterior(playerid,0);
					SetPlayerVirtualWorld(playerid,0);
					SetPlayerInterior(playerid,0);
					TutorialCamT[playerid] = 255;
					Tutorial[playerid] = 254;
					JogadorProntoT[playerid] = 1;
					return 1;
   			}
		    }
		case Concessionaria:
		    {
		    ShowMenuForPlayer(carros, playerid);
		    TogglePlayerControllable(playerid,0);
		    DisablePlayerCheckpoint(playerid);
		    CheckpointAtual[playerid] = CHECKPOINT_NADA;
		    }
        case Garagem:
		    {
			if(InfoJogador[playerid][carro] == 0)
				{
					SendClientMessage(playerid, COR_GRAD1, "Voce nao tem carro.");
					DisablePlayerCheckpoint(playerid);
					CheckpointAtual[playerid] = CHECKPOINT_NADA;
				}
		else
			{
			ShowMenuForPlayer(menugaragem, playerid);
			TogglePlayerControllable(playerid,0);
			DisablePlayerCheckpoint(playerid);
			CheckpointAtual[playerid] = CHECKPOINT_NADA;
			}
			}
		}
		return 1;
}
public Encript(string[])
{
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] += (5^x) * (x % 9);
		  if(string[x] > (0xff))
		  {
			  string[x] -= MAX_STRING;
		  }
	  }
	return 1;
}
public Decript(string[])
{
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] -= (5^x) * (x % 9);
		  if(string[x] > (0xff))
		  {
			  string[x] -= 256;
		  }
	  }
	return 1;
}

public OnPlayerLogin(playerid,const string[])
{
	new string2[64];
	new playername2[MAX_PLAYER_NAME];
	new tmp2[MAX_STRING];
	GetPlayerName(playerid, playername2, sizeof(playername2));
	format(string2, sizeof(string2), "%s.ini", playername2);
	new File: file = fopen(string2, io_read);
	if (file)
	{
  new valtmp[128];
		fread(file, valtmp);strmid(InfoJogador[playerid][senha], valtmp, 0, strlen(valtmp)-1, 255);
		if ((strcmp(InfoJogador[playerid][senha], string, true, strlen(valtmp)-1) == 0))
		{
			fread(file, valtmp);InfoJogador[playerid][dinheiro] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);InfoJogador[playerid][chave] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);InfoJogador[playerid][fezcheat] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);InfoJogador[playerid][banido] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);InfoJogador[playerid][carro] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);InfoJogador[playerid][carroid] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);InfoJogador[playerid][carronome] = strval(valtmp);DelPrint(valtmp);
			fclose(file);

			format(string2, sizeof(string2), "Voce acabou de acordar.");
			SendClientMessage(playerid, COR_GRAD1,string2);
			printf("%s fez login no server",playername2);
			
			GetPlayerName(playerid, playername2, sizeof(playername2));
			format(tmp2, sizeof(tmp2), "~w~Bem Vindo ~n~~g~   %s", playername2);
			GameTextForPlayer(playerid, tmp2, 5000, 1);
			Logado[playerid] = 1;
			new jogador[MAX_STRING];
			new textostr[MAX_STRING];
			GetPlayerName(playerid,jogador,sizeof(jogador));
			format(textostr,sizeof(textostr),"%s acabou de acordar.",jogador);
    		SendClientMessageToAll(COR_GRAD1,textostr);
			if(Isolado[playerid] == 1)
			{
			OnPlayerSpawn(playerid);
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COR_GRAD1, "Senha incorreta.");
			printf("%s errou a senha",playername2);
			fclose(file);
		}
		return 1;
	}
	else
	{
		SendClientMessage(playerid, COR_GRAD1, "Voce nao tem uma conta, coloque /registrar <senha>");
	}
	return 1;
}
public OnPlayerSelectedMenuRow(playerid, row)
{
    new Menu:Atual = GetPlayerMenu(playerid);
  	if(Atual == menugaragem)
	{
		switch(row)
		{
		case 0:
		    {
            SendClientMessage(playerid, COR_GRAD1, "Compra efetuada. Seu carro chegara em menos de 24 horas.");
		    }
        case 1:
		    {
            SendClientMessage(playerid, COR_GRAD1, "Compra efetuada. Seu carro chegara em menos de 24 horas.");
		    }
		}
		
      }
	if(Atual == menutelefonep)
	{
		switch(row)
		{
		case 0:
		    {
            SendClientMessage(playerid, COR_GRAD1, "Ligando para a companhia de taxi...");//ligar para 1 taxista online
            ShowMenuForPlayer(menutelefonep, playerid);
		    }
        case 1:
		    {
            SendClientMessage(playerid, COR_GRAD1, "Ligando para a central de policia...");
            ShowMenuForPlayer(menutelefonep, playerid);
		    }
        case 2:
            {
            Telefone[playerid] = 255;
            NoMenu[playerid] = 255;
            TogglePlayerControllable(playerid, 1);
            ApplyAnimation(playerid,"PED", "phone_out", 4.0, 0, 0, 0, 0, 0);
            SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
            }
		}
	}
    if(Atual == mtunning)
	{
	switch(row)
		{
		case 0:
		    {
		    ShowMenuForPlayer(mtunningrodas, playerid);
		    }
		}
	}
	
      return 1;
}
public OnPlayerExitedMenu(playerid)
{
	if(NoMenu[playerid] <= 6)
	{
	ShowMenuForPlayer(menutelefonep, playerid);
	}
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
return 1;
}
public OnVehicleSpawn(vehicleid)
{
	printf("OnVehicleSpawn(%d)", vehicleid);
	InfoCarro[vehicleid][explodiu] = 4;
	return 1;
}

public Tuning()
{
	for(new cid = 0; cid <= sizeof(InfoCarro); cid++)
	{
		if(InfoCarro[cid][explodiu] > 1)
		{
			InfoCarro[cid][explodiu] = InfoCarro[cid][explodiu] - 1;
		}
		if(InfoCarro[cid][explodiu] == 1)
		{
   			if(InfoCarro[cid][rodas] != 255)
			{
				AddVehicleComponent(cid,InfoCarro[cid][rodas]);
			}
			if(InfoCarro[cid][hidraulica] == 1)
			{
				AddVehicleComponent(cid,1087);
			}
			if(InfoCarro[cid][nitrogenio] == 1)
			{
			    AddVehicleComponent(cid,1010);
			}
			InfoCarro[cid][explodiu] = 0;
		}
	}
}
