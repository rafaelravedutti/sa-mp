#include <a_samp>
#include <dini>
#include <cpstream>

#pragma tabsize 0
//Cores
#define cor_vermelho     0xAA3333AA
#define cor_azul         0x0000BBAA
#define cor_preto        0x000000AA
#define cor_verde        0x33AA33AA
#define cor_cinza        0xAFAFAFAA
#define cor_amarelo      0xFFFF00AA
#define cor_branco       0xFFFFFFAA
//Ingles
#define COLOR_RED        0xAA3333AA
#define COLOR_CINZA      0x666666AA
#define COLOR_GREEN      0x33AA33AA
#define COLOR_SEGURANÇA  0xADD8E6AA
#define COLOR_WHITE      0xFFFFFFAA
//Cores Profissaoes
#define cor_policia   0x33AA33AA
#define cor_ilegais   0x666666AA
#define cor_taxista   0x0000BBAA
#define cor_pizzaboy  0x0000BBAA
#define cor_estudante 0x000000AA
#define cor_vendedor  0xFFFF00AA
//Skin Profissoes
#define skin_desempregado  135
#define skin_taxista       217
#define skin_pizzaboy      115
#define skin_traficante    116
#define skin_ladrao        121
#define skin_rachador      101
#define skin_estudante     59
#define skin_policial      282
#define skin_bope          285
#define skin_juiz          46
#define skin_vendedor      17
#define skin_pescador      35
#define skin_mecanico      50
#define skin_ibama         286
#define skin_seguranca     165
#define skin_jornalista    170
#define skin_corretor      17
#define skin_assasino      223
//Profissao e level
#define desempregado 0
#define taxista     1
#define pizzaboy    2
#define traficante  3
#define ladrao      4
#define rachador    5
#define estudante   6
#define policial    7
#define bope        8
#define juiz        9
#define vende_carro 10
#define pescador    11
#define ibama       12
#define mototaxista 13
#define motorista   14
#define assasino    15
#define jornalista  16
#define segurança   17
#define mecanico    18
#define vende_casa  19
#define hacker      20

//Profs e level
#define TEMPO_SALARIO 10
new Level[MAX_PLAYERS] = { 0, 1, 2, 3, 4 };
new Profissao[MAX_PLAYERS];
forward salario();
//Player
new PlayerLogado[MAX_PLAYERS] = 0;
new Morador[MAX_PLAYERS] = 0;
//Carro
#define TEMPO_GASOLINA 1
new Gas[MAX_VEHICLES] = 0;
new Dono[MAX_VEHICLES][256];
forward TextGasolina();
forward GastandoGasolina();
//Gamemode
new Text:textnormal;
new Text:textveiculo[MAX_VEHICLES];
new Menu:profs;
new Menu:profs2;
new Text:Relogio;
new GranaBanco[MAX_PLAYERS];
new cportao1;
new cportao2;
forward PegarDoenca();
forward Loga(playerid);
forward AumentarLevel();
forward JogadorNoPonto(playerid, Xa, Ya, Za);//By DioguitosBR
forward TextRelogio();
//Checkpoints CPSTREAM
new c_profs;
new c_condominio1;
new c_condominio2;
new c_hotel;
new c_posto1;
new c_posto2;
new banco;
new carro[8];
//Propiedades
forward ComprarProp(playerid);
//Comandos, etc
#define tempo_hotel 10
new alcool[MAX_PLAYERS];
new Preso[MAX_PLAYERS];
new pizza[MAX_PLAYERS];
new droga[MAX_PLAYERS];
new hotel[MAX_PLAYERS];
new Taxi[MAX_PLAYERS][2];
new MTaxi[MAX_PLAYERS][2];
new TimerCondominio;
new actquest[MAX_PLAYERS];//Questao atual do estudante
forward Pergunta(playerid, perguntaid);
forward Hotel();
forward Taximetro(playerid);
forward PararTaximetro(playerid);
forward MTaximetro(playerid);
forward PararMTaximetro(playerid);
forward PlayerNoPonto(Float:radi, playerid, Float:x, Float:y, Float:z);
forward PlayerInArea(playerid,Float:max_x,Float:min_x,Float:max_y,Float:min_y);
forward FecharCondominio();
forward minrand(min, max);

//Pesca
new PT;
new pesca;
new isca[MAX_PLAYERS];
new peixe[MAX_PLAYERS];
new quilos[MAX_PLAYERS];
new AreaPesca;
new Peixes[6][0] = {
{"Dourado"},
{"Lagosta"},
{"Baiacu"},
{"Atum"},
{"Tilapia"},
{"Sardinha"}
};
forward PescarTimer(playerid);

//Horario de trabalho
new HorarioTrab[MAX_PLAYERS];
new Tempo;
new Xp[MAX_PLAYERS];
forward ChecarTrab();
forward UparTempo();
//Sono e Fome
new Sono[MAX_PLAYERS];
new Fome[MAX_PLAYERS];
new Higiene[MAX_PLAYERS];
new TimerP[MAX_PLAYERS];
new Avisado[MAX_PLAYERS];
forward FicarFome();
forward FicarSono();
forward FicarHigiene();
forward PararA(playerid, id);

main()
{
	print("\n------DioguitoS Mini RPG v3.0 Aberto------");
	print("       The Programmer = [KoG]DioguitosBR    ");
	print("------------------------------------------\n");
}

public OnGameModeInit()
{
//Pesca
pesca = 1;
AreaPesca = GangZoneCreate(-2923.87, 1390.945, -2750.05, 1521.128);
//Barcos
new barcos[6];
barcos[0] = AddStaticVehicle(453,-2650.609,1511.060,0.995,0.0,-1,-1);
barcos[1] = AddStaticVehicle(453,-2644.611,1509.009,0.993,0.0,-1,-1);
barcos[2] = AddStaticVehicle(453,-2638.386,1504.244,0.908,0.0,-1,-1);
barcos[3] = AddStaticVehicle(453,-2633.311,1496.462,0.927,0.0,-1,-1);
barcos[4] = AddStaticVehicle(453,-2657.100,1512.368,1.002,0.0,-1,-1);
barcos[5] = AddStaticVehicle(453,-2662.915,1514.137,0.979,0.0,-1,-1);
	Gas[barcos[0]] = 70;
	Gas[barcos[1]] = 70;
	Gas[barcos[2]] = 70;
	Gas[barcos[3]] = 70;
	Gas[barcos[4]] = 70;
	Gas[barcos[5]] = 70;
	Dono[barcos[0]] = "Governo";
	Dono[barcos[1]] = "Governo";
	Dono[barcos[2]] = "Governo";
	Dono[barcos[3]] = "Governo";
	Dono[barcos[4]] = "Governo";
	Dono[barcos[5]] = "Governo";
//Objectos
CreateObject(973,-2677.287,1468.846,7.028,0.0,0.0,-180.000);
CreateObject(973,-2677.294,1468.744,7.885,0.0,0.0,-180.000);
CreateObject(973,-2677.291,1468.661,8.697,0.0,0.0,-180.000);
CreateObject(973,-2681.825,1473.424,7.028,0.0,0.0,90.000);
CreateObject(973,-2681.908,1473.396,7.882,0.0,0.0,90.000);
CreateObject(973,-2681.990,1473.357,8.794,0.0,0.0,-270.000);
CreateObject(973,-2677.218,1478.014,7.028,0.0,0.0,-360.000);
CreateObject(973,-2677.251,1478.070,7.939,0.0,0.0,0.0);
CreateObject(973,-2677.196,1478.152,8.724,0.0,0.0,0.0);
CreateObject(1483,-2680.237,1472.087,8.162,0.0,0.0,0.0);
CreateObject(1483,-2680.311,1474.744,8.162,0.0,0.0,0.0);
CreateObject(1483,-2674.247,1472.295,8.162,0.0,0.0,-180.000);
CreateObject(1483,-2674.194,1474.632,8.162,0.0,0.0,-180.000);
CreateObject(12922,-2672.066,1473.563,7.648,0.0,0.0,90.000);
CreateObject(1412,-2672.892,1471.470,7.461,0.0,0.0,-90.000);
CreateObject(1412,-2672.890,1473.712,7.461,0.0,0.0,-90.000);
	//Outros
	SetGameModeText("DioGuiTos Mini RPG");
	AddPlayerClass(0,-2706.6987,380.4530,4.9688,355.3689,0,0,0,0,0,0);
	//Veiculos
	carro[0] = AddStaticVehicle(420,-2712.4548,410.3003,4.0547,271.0368,1,1);
	carro[1] = AddStaticVehicle(420,-2702.5029,410.3029,4.0479,270.3575,1,1);
	carro[2] = AddStaticVehicle(410,-2694.6628,388.1931,4.0221,265.6740,0,0);
	carro[3] = AddStaticVehicle(410,-2686.3994,388.2470,4.0200,271.4037,0,0);
	carro[4] = AddStaticVehicle(428,-2433.5693,533.1729,30.0958,88.6682,1,1);
	carro[5] = AddStaticVehicle(420,-2419.6365,306.2290,34.7499,194.6416,1,1);
	carro[6] = AddStaticVehicle(420,-2417.0376,316.7410,34.7479,155.4289,1,1);
	carro[7] = AddStaticVehicle(420,-2412.9060,324.4554,34.7476,153.2798,1,1);
	Gas[carro[0]] = 50;
	Gas[carro[1]] = 50;
	Gas[carro[2]] = 50;
	Gas[carro[3]] = 50;
	Gas[carro[4]] = 50;
	Gas[carro[5]] = 50;
	Gas[carro[6]] = 50;
	Gas[carro[7]] = 50;
	Dono[carro[0]] = "Governo";
	Dono[carro[1]] = "Governo";
	Dono[carro[2]] = "Governo";
	Dono[carro[3]] = "Governo";
	Dono[carro[4]] = "Governo";
	Dono[carro[5]] = "Governo";
	Dono[carro[6]] = "Governo";
	Dono[carro[7]] = "Governo";

	//Menu das profissoes
	profs = CreateMenu("Profissoes", 2, 50.0, 180.0, 200.0, 200.0);
	AddMenuItem(profs, 0, "Desempregado");
	AddMenuItem(profs, 1, "$100");
	AddMenuItem(profs, 0, "Taxista");
	AddMenuItem(profs, 1, "$1000");
	AddMenuItem(profs, 0, "MotoTaxista");
	AddMenuItem(profs, 1, "$1000");
	AddMenuItem(profs, 0, "Motorista particular");
	AddMenuItem(profs, 1, "$1500");
	AddMenuItem(profs, 0, "Assasino");
	AddMenuItem(profs, 1, "$900");
	AddMenuItem(profs, 0, "Segurança");
	AddMenuItem(profs, 1, "$1000");
	AddMenuItem(profs, 0, "Mecanico");
	AddMenuItem(profs, 1, "$1000");
	AddMenuItem(profs, 0, "PizzaBoy");
	AddMenuItem(profs, 1, "$800");
	AddMenuItem(profs, 0, "Traficante");
	AddMenuItem(profs, 1, "$500");
	AddMenuItem(profs, 0, "Ladrao");
	AddMenuItem(profs, 1, "$700");
	AddMenuItem(profs, 0, "Pescador");
	AddMenuItem(profs, 1, "$800");
	AddMenuItem(profs, 0, "Proximo menu");

	profs2 = CreateMenu("Profissoes 2", 2, 50.0, 180.0, 200.0, 200.0);
	AddMenuItem(profs2, 0, "Rachador");
	AddMenuItem(profs2, 1, "$1000");
	AddMenuItem(profs2, 0, "Estudante");
	AddMenuItem(profs2, 1, "$1000");
	AddMenuItem(profs2, 0, "Jornalista");
	AddMenuItem(profs2, 1, "$2000");
	AddMenuItem(profs2, 0, "Ibama");
	AddMenuItem(profs2, 1, "$2700");
	AddMenuItem(profs2, 0, "Policial");
	AddMenuItem(profs2, 1, "$1500");
	AddMenuItem(profs2, 0, "Bope");
	AddMenuItem(profs2, 1, "$3000");
	AddMenuItem(profs2, 0, "Juiz");
	AddMenuItem(profs2, 1, "$3500");
	AddMenuItem(profs2, 0, "Vendedor de Carro");
	AddMenuItem(profs2, 1, "$2500");
	AddMenuItem(profs2, 0, "Vendedor de Casa");
	AddMenuItem(profs2, 1, "$2500");
	AddMenuItem(profs2, 0, "Sair do Menu");
	
	
	//TextDraw dos Veiculos
	for(new i; i < sizeof textveiculo; i++)
	{
		textveiculo[i] = TextDrawCreate(159.000000,381.000000,"~g~Ga~r~sol~b~ina: ~r~ ~n~~b~Veiculo: ~r~ ");
		TextDrawUseBox(textveiculo[i],1);
		TextDrawBoxColor(textveiculo[i],0x000000AA);
		TextDrawTextSize(textveiculo[i],480.000000,0.000000);
		TextDrawAlignment(textveiculo[i],0);
		TextDrawBackgroundColor(textveiculo[i],0x000000AA);
		TextDrawFont(textveiculo[i],1);
		TextDrawLetterSize(textveiculo[i],0.395000,1.000000);
		TextDrawColor(textveiculo[i],0xffffffff);
		TextDrawSetOutline(textveiculo[i],1);
		TextDrawSetProportional(textveiculo[i],1);
		TextDrawSetShadow(textveiculo[i],1);
	}
	//TextDraw Relogio
	Relogio = TextDrawCreate(0.0, 0.0,"Horario: %d");
TextDrawFont(Relogio,2);
TextDrawLetterSize(Relogio,1,1);
TextDrawColor(Relogio,0xF6F6F6FF);
TextDrawSetShadow(Relogio,0);
TextDrawSetOutline(Relogio,1);
TextDrawBackgroundColor(Relogio,0x000FF);
TextDrawUseBox(Relogio, 1);
TextDrawBoxColor(Relogio, 0x000FF);

	//TextDraw Dioguitos Mini RPG
	textnormal = TextDrawCreate(0.0, 434.0,"~r~Dio~b~gui~g~toS ~g~M~r~i~g~N~r~i ~y~R~g~P~b~G");
	TextDrawFont(textnormal,3);
	TextDrawLetterSize(textnormal,1,1);
	//TextDrawColor(textnormal,0x000FF);
	TextDrawSetOutline(textnormal,2);
	TextDrawBackgroundColor(textnormal,cor_preto);
	TextDrawUseBox(textnormal,1);
	TextDrawBoxColor(textnormal,cor_preto);
	//Checkpoints CPSTREAM
	pesca = CPS_AddCheckpoint(-2678.6763,1470.4612,7.1875, 2.0,100);
	c_profs = CPS_AddCheckpoint(-2757.168213,374.569336,3.998143,2.0,100);
	c_hotel = CPS_AddCheckpoint(-2418.349609,334.553253,34.839054,2.0,100);
	c_posto1 = CPS_AddCheckpoint(-2029.846680,155.986496,28.496315,2.0,100);
	c_posto2 = CPS_AddCheckpoint(-1674.709106,413.694702,6.840065,2.0,100);
	c_condominio1 = CPS_AddCheckpoint(-3143.9653,466.7766,10.8792, 2.0,100);
	c_condominio2 = CPS_AddCheckpoint(-3129.0381,473.1304,10.8787, 2.0,100);
	banco = CPS_AddCheckpoint(-2446.6104,524.2563,30.2446,2.0,100);
	//Veiculos
	for(new count;count<MAX_VEHICLES;count++) {
	new string[256];
		format(string, sizeof(string),"veiculo_%d.txt",count);
		if(dini_Exists(string)) {
			new Float:x,Float:y,Float:z,Float:a,modelo;
		//	new donov;
			modelo = dini_Int(string,"modelo");
			x = dini_Int(string,"x");
			y = dini_Int(string,"y");
			z = dini_Int(string,"z");
			a = dini_Int(string,"a");
			new carrovend;
	        carrovend = AddStaticVehicle(modelo,x,y,z,a,1,1);
	        Gas[carrovend] = 50;
	        Dono[carrovend] = dini_Get(string,"dono");
		}
	}
	//Pickups
	for(new count; count<MAX_PLAYERS; count++) {
	new string[256];
	format(string, sizeof(string),"pickup_%d.txt",count);
	if(dini_Exists(string)) {
	new Float:X;
	new Float:Y;
	new Float:Z;
	X = dini_Float(string,"X");
	Y = dini_Float(string,"Y");
	Z = dini_Float(string,"Z");
	AddStaticPickup(1273, 23, X, Y, Z);
	}
	}
	//SetTimers
	SetTimer("Hotel", tempo_hotel * 60000, true);
	SetTimer("TextRelogio", 6000, true);
	SetTimer("salario", 600000, true);
	SetTimer("AumentarLevel", 1000, true);
	SetTimer("GastandoGasolina", 60000, true);
	SetTimer("TextGasolina", 3000, 1);
	SetTimer("UparTempo", 60000, true);
	SetTimer("ChecarTrab", 1000, true);
	//Ilha
AddStaticVehicle(522,-2961.849,470.704,4.574,0.0,-1,-1);
CreateObject(18450,-3017.453,469.269,6.532,0.0,4.297,0.0);
CreateObject(18450,-3097.201,469.256,9.535,0.0,0.0,0.0);
CreateObject(17612,-3192.651,469.461,9.973,0.0,0.0,0.0);
CreateObject(3306,-3148.947,491.593,11.338,0.0,0.0,270.000);
CreateObject(3307,-3173.911,491.488,11.338,0.0,0.0,-90.000);
CreateObject(3308,-3200.213,492.635,11.547,0.0,0.0,-90.000);
CreateObject(3309,-3149.053,447.152,11.527,0.0,0.0,90.000);
CreateObject(3310,-3174.539,447.852,12.216,0.0,0.0,-90.000);
CreateObject(3311,-3199.556,447.851,13.064,0.0,0.0,180.000);
CreateObject(3312,-3224.521,491.741,13.066,0.0,0.0,90.000);
CreateObject(3313,-3224.500,447.540,12.953,0.0,0.0,180.000);
CreateObject(973,-3237.006,451.337,10.716,0.0,0.0,-90.000);
CreateObject(973,-3237.039,454.829,10.716,0.0,0.0,-90.000);
CreateObject(973,-3241.285,459.775,10.962,0.0,0.0,0.0);
CreateObject(973,-3236.711,488.010,10.976,0.0,0.0,90.000);
CreateObject(973,-3236.715,483.832,10.976,0.0,0.0,90.000);
CreateObject(973,-3241.534,479.211,10.962,0.0,0.0,-180.000);
CreateObject(3749,-3247.646,469.362,15.816,0.0,0.0,-90.000);
CreateObject(3749,-3137.568,470.296,15.738,0.0,0.0,-90.000);
CreateObject(17639,-3297.509,469.364,9.985,0.0,0.0,0.0);
CreateObject(3306,-3262.282,447.594,11.338,0.0,0.0,90.000);
CreateObject(3307,-3287.302,447.661,11.338,0.0,0.0,90.000);
CreateObject(3308,-3310.905,446.681,11.472,0.0,0.0,90.000);
CreateObject(3309,-3262.798,491.506,11.427,0.0,0.0,-90.000);
CreateObject(3308,-3287.777,491.895,11.647,0.0,0.0,-90.000);
CreateObject(3307,-3311.404,491.165,11.338,0.0,0.0,-90.000);
CreateObject(17639,-3334.543,529.060,10.000,0.0,0.0,-90.000);
CreateObject(3314,-3363.703,487.722,10.869,0.0,0.0,90.000);
CreateObject(3315,-3363.639,520.640,10.869,0.0,0.0,90.000);
CreateObject(3316,-3363.162,541.368,13.213,0.0,0.0,90.000);
CreateObject(3317,-3363.201,566.153,13.213,0.0,0.0,90.000);
CreateObject(3351,-3305.897,520.049,13.488,0.0,0.0,-90.000);
CreateObject(3353,-3305.495,540.912,10.995,0.0,0.0,-90.000);
CreateObject(973,-3347.206,464.281,10.716,0.0,0.0,-90.000);
CreateObject(973,-3347.216,473.633,10.716,0.0,0.0,-90.000);
CreateObject(616,-3256.483,461.497,10.053,0.0,0.0,0.0);
CreateObject(616,-3273.423,477.312,10.057,0.0,0.0,0.0);
CreateObject(616,-3287.554,461.936,10.057,0.0,0.0,0.0);
CreateObject(616,-3288.667,476.830,10.057,0.0,0.0,0.0);
CreateObject(618,-3308.655,460.160,10.391,0.0,0.0,0.0);
CreateObject(618,-3323.327,477.566,10.391,0.0,0.0,0.0);
CreateObject(618,-3343.278,478.488,10.382,0.0,0.0,0.0);
CreateObject(618,-3343.434,501.416,10.406,0.0,0.0,0.0);
CreateObject(620,-3324.718,507.912,10.145,0.0,0.0,0.0);
CreateObject(618,-3343.794,528.252,10.406,0.0,0.0,0.0);
CreateObject(618,-3325.575,531.772,10.406,0.0,0.0,0.0);
CreateObject(618,-3343.358,553.124,10.406,0.0,0.0,0.0);
CreateObject(618,-3327.145,556.028,10.406,0.0,0.0,0.0);
CreateObject(620,-3343.353,578.101,10.132,0.0,0.0,0.0);
CreateObject(620,-3325.219,578.235,10.132,0.0,0.0,0.0);
CreateObject(620,-3325.040,567.724,10.145,0.0,0.0,0.0);
CreateObject(973,-3338.424,577.821,10.739,0.0,0.0,-180.000);
CreateObject(973,-3331.215,577.756,10.733,0.0,0.0,-180.000);
CreateObject(973,-3326.189,572.453,10.918,0.0,0.0,90.000);
CreateObject(973,-3325.399,562.485,10.918,0.0,0.0,95.157);
CreateObject(18228,-2992.649,497.895,7.243,0.0,0.0,-33.750);
CreateObject(18228,-3011.241,444.011,-2.782,0.0,0.0,157.500);
CreateObject(18228,-3043.196,443.910,0.538,0.0,0.0,157.500);
CreateObject(18228,-3026.958,494.480,3.463,0.0,0.0,-33.750);
CreateObject(620,-3067.043,462.437,10.148,0.0,0.0,0.0);
CreateObject(620,-3067.251,475.927,10.148,0.0,0.0,0.0);
CreateObject(620,-3074.659,462.524,10.148,0.0,0.0,0.0);
CreateObject(620,-3082.914,462.347,10.148,0.0,0.0,0.0);
CreateObject(620,-3090.599,462.197,10.148,0.0,0.0,0.0);
CreateObject(620,-3098.413,462.602,10.148,0.0,0.0,0.0);
CreateObject(620,-3107.166,462.385,10.148,0.0,0.0,0.0);
CreateObject(620,-3114.422,462.595,10.148,0.0,0.0,0.0);
CreateObject(620,-3122.946,462.476,10.148,0.0,0.0,0.0);
CreateObject(620,-3123.100,475.632,10.148,0.0,0.0,0.0);
CreateObject(620,-3074.659,475.514,10.148,0.0,0.0,0.0);
CreateObject(620,-3082.691,475.809,10.148,0.0,0.0,0.0);
CreateObject(620,-3091.127,475.992,10.148,0.0,0.0,0.0);
CreateObject(620,-3099.351,475.856,10.148,0.0,0.0,0.0);
CreateObject(620,-3106.219,475.899,10.148,0.0,0.0,0.0);
CreateObject(620,-3114.654,475.735,10.148,0.0,0.0,0.0);
CreateObject(620,-3058.068,476.046,10.148,0.0,0.0,0.0);
CreateObject(620,-3057.784,462.638,10.148,0.0,0.0,0.0);
CreateObject(17639,-3334.010,409.963,10.000,0.0,0.0,-90.000);
CreateObject(3306,-3310.985,416.934,11.465,0.0,0.0,180.000);
CreateObject(3307,-3310.982,391.897,11.515,0.0,0.0,180.000);
CreateObject(3308,-3311.603,368.226,11.424,0.0,0.0,-180.000);
CreateObject(3309,-3356.809,446.157,11.454,0.0,0.0,0.0);
CreateObject(3314,-3362.956,417.554,11.046,0.0,0.0,90.000);
CreateObject(3315,-3362.926,400.693,11.046,0.0,0.0,90.000);
CreateObject(3316,-3362.483,371.602,13.390,0.0,0.0,-270.000);
CreateObject(17639,-3334.031,311.195,10.015,0.0,0.0,-90.000);
CreateObject(3442,-3306.449,339.176,14.340,0.0,0.0,-90.000);
CreateObject(3443,-3311.851,306.616,12.934,0.0,0.0,-90.000);
CreateObject(3444,-3309.034,277.508,12.603,0.0,0.0,0.0);
CreateObject(3445,-3358.151,350.051,13.078,0.0,0.0,90.000);
CreateObject(3446,-3358.109,331.706,13.531,0.0,0.0,-270.000);
CreateObject(3483,-3360.868,307.327,17.081,0.0,0.0,90.000);
CreateObject(3488,-3361.023,282.154,16.588,0.0,0.0,-270.000);
CreateObject(973,-3372.915,271.725,10.944,0.0,0.0,-180.000);
CreateObject(973,-3363.546,271.730,10.944,0.0,0.0,-180.000);
CreateObject(973,-3354.335,271.724,10.944,0.0,0.0,-180.000);
CreateObject(973,-3344.997,271.732,10.944,0.0,0.0,-360.000);
CreateObject(973,-3328.672,264.020,10.933,0.0,0.0,0.0);
CreateObject(973,-3330.533,264.001,10.893,0.0,0.0,0.0);
CreateObject(973,-3337.876,267.990,10.893,0.0,0.0,-56.250);

cportao1 = CreateObject(988,-3136.843,467.304,10.918,0.0,0.0,90.000);
cportao2 = CreateObject(988,-3136.790,472.840,10.918,0.0,0.0,-270.000);

	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	//TextDrawShowForPlayer(playerid, textdrawdioguitos);
	GameTextForPlayer(playerid,"~g~DioguitoS ~b~MiNi ~r~RPG",10000,8);
	SendClientMessage(playerid, cor_verde,"Seja Bem Vindo ao DioguitoS MiNi RPG");
	SendClientMessage(playerid, cor_vermelho,"~E novo? /ajuda e /comandos");
	SendClientMessage(playerid, cor_azul,"~Quer saber os creditos? /creditos");
	SendClientMessage(playerid, cor_amarelo,"~Obrigado Por Jogar no meu nosso Servidor!");
	if(dini_Exists(PlayerName(playerid))) SendClientMessage(playerid, cor_azul, "Você ja tem registro. Por favor faça login com /logar [senha].");
	else SendClientMessage(playerid, cor_azul, "Você não tem registro. Por favor registre-se digitando /registrar [senha].");

	new string[256];
    format(string, sizeof(string), "%s Entrou no servidor :D", PlayerName(playerid));
    SendClientMessageToAll(cor_amarelo, string);
    
    TextDrawShowForPlayer(playerid, Relogio);
   	TextDrawShowForPlayer(playerid, textnormal);
   	
	SetPlayerMapIcon(playerid, 0, -3129.0381, 473.1304, 10.8787, 35, 0);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(PlayerLogado[playerid] == 1) {
  		dini_IntSet(PlayerName(playerid),"Grana", GetPlayerMoney(playerid));
  		dini_IntSet(PlayerName(playerid),"Banco", GranaBanco[playerid]);
  		dini_IntSet(PlayerName(playerid),"Level", Level[playerid]);
  		dini_IntSet(PlayerName(playerid),"Profissao", Profissao[playerid]);
  		dini_IntSet(PlayerName(playerid),"Level", Level[playerid]);
  		dini_IntSet(PlayerName(playerid),"Morador", Morador[playerid]);
  		dini_IntSet(PlayerName(playerid),"Hotel", hotel[playerid]);
  		dini_IntSet(PlayerName(playerid),"Xp", Xp[playerid]);
 	}
 	new string[256];
  switch (reason)    {
    case 0: format(string, sizeof(string), "%s saiu do servidor(Crash)", PlayerName(playerid));
    case 1: format(string, sizeof(string), "%s saiu do servidor(Vontade propia)", PlayerName(playerid));
    case 2: format(string, sizeof(string), "%s saiu do servidor(Kickado/Banido)", PlayerName(playerid));
    }
  SendClientMessageToAll(cor_amarelo, string);
  PlayerLogado[playerid] = 0;
	return 1;
}

public OnPlayerSpawn(playerid)
{
GangZoneShowForPlayer(playerid, AreaPesca, 0x0000FF96);
SpawnArmas(playerid);
SetPlayerInterior(playerid, 0);
	new Float:X;
	new Float:Z;
	new Float:Y;
	X = dini_Int(PlayerName(playerid),"Casa_X");
    Y = dini_Int(PlayerName(playerid),"Casa_Y");
    Z = dini_Int(PlayerName(playerid),"Casa_Z");
    if(X == 0.000000) {
	if(hotel[playerid] == 0) {
	if(Profissao[playerid] == policial || Profissao[playerid] == bope || Profissao[playerid] == juiz) SetPlayerPos(playerid, -1616.938477,678.455261,6.847878);
	else if(Profissao[playerid] == pizzaboy) SetPlayerPos(playerid, -1807.016357,945.046997,24.551003);
	else if(Profissao[playerid] == taxista) SetPlayerPos(playerid, -2717.934814,403.625732,4.324440);
	else if(Profissao[playerid] == vende_carro) SetPlayerPos(playerid, -1968.431030,292.303894,34.832253);
	else if(Profissao[playerid] == pescador) SetPlayerPos(playerid, -2671.3813,1475.3325,7.1875);
	}
	else if(hotel[playerid] == 1) {
	SetPlayerPos(playerid, -2418.349609,334.553253,34.839054);
	}
	}
	else SetPlayerPos(playerid, X, Y, Z);
	
	if(Profissao[playerid] == desempregado) { SetPlayerSkin(playerid, skin_desempregado); }
	if(Profissao[playerid] == taxista) { SetPlayerColor(playerid, cor_taxista); SetPlayerSkin(playerid, skin_taxista); }
	if(Profissao[playerid] == pizzaboy) { SetPlayerColor(playerid, cor_pizzaboy); SetPlayerSkin(playerid, skin_pizzaboy); }
	if(Profissao[playerid] == traficante) { SetPlayerColor(playerid, cor_ilegais); SetPlayerSkin(playerid, skin_traficante); }
	if(Profissao[playerid] == ladrao) { SetPlayerColor(playerid, cor_ilegais); SetPlayerSkin(playerid, skin_ladrao); }
	if(Profissao[playerid] == rachador) { SetPlayerColor(playerid, cor_ilegais); SetPlayerSkin(playerid, skin_rachador); }
	if(Profissao[playerid] == estudante) { SetPlayerColor(playerid, cor_estudante); SetPlayerSkin(playerid, skin_estudante); }
	if(Profissao[playerid] == policial) { SetPlayerColor(playerid, cor_policia); SetPlayerSkin(playerid, skin_policial); }
	if(Profissao[playerid] == bope) { SetPlayerColor(playerid, cor_policia); SetPlayerSkin(playerid, skin_bope); }
	if(Profissao[playerid] == juiz) { SetPlayerColor(playerid, cor_policia); SetPlayerSkin(playerid, skin_juiz); }
	if(Profissao[playerid] == vende_carro) { SetPlayerColor(playerid, cor_vendedor); SetPlayerSkin(playerid, skin_vendedor); }
	if(Profissao[playerid] == pescador)  SetPlayerSkin(playerid, skin_pescador);
	if(Profissao[playerid] == assasino) SetPlayerSkin(playerid, skin_assasino);
	if(Profissao[playerid] == segurança) SetPlayerSkin(playerid, skin_seguranca);
	if(Profissao[playerid] == ibama) SetPlayerSkin(playerid, skin_ibama);
	if(Profissao[playerid] == mototaxista) SetPlayerSkin(playerid, skin_taxista);
	if(Profissao[playerid] == motorista) SetPlayerSkin(playerid, skin_seguranca);
	if(Profissao[playerid] == jornalista) SetPlayerSkin(playerid, skin_jornalista);
	if(Profissao[playerid] == mecanico) SetPlayerSkin(playerid, skin_mecanico);
	if(Profissao[playerid] == vende_casa) SetPlayerSkin(playerid, skin_corretor);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	//SetPlayerPos(playerid, -2653.493164,633.136414,14.113503);
	if(GetPlayerMoney(playerid) <= 800) {
		SendClientMessage(playerid, cor_verde,"Você morreu e como nao tinha dinheiro em mao");
		SendClientMessage(playerid, cor_verde,"os medicos retiraram 800 do banco");
		GranaBanco[playerid]-=800;
	} else GivePlayerMoney(playerid, -800);
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
	if(Profissao[playerid] == estudante) {
		if(actquest[playerid] > 0) {
		    if(actquest[playerid] == 1) {
		        if(!strcmp(text, "45", true)) {
		            SendClientMessage(playerid, 0xFFFF00AA, "Certo.");
		            SendClientMessage(playerid, 0xFF0000AA, "Próxima pergunta:");
		            SetTimerEx("Pergunta", 2000, 0, "ii", playerid, 2);
		        } else {
		            SendClientMessage(playerid, 0xFF0000AA, "Errado! Vai estudar vai!");
		            actquest[playerid] = 0;
		        }
		    } else if(actquest[playerid] == 2) {
		        if(!strcmp(text, "25", true)) {
		            SendClientMessage(playerid, 0xFFFF00AA, "Certo.");
		            SendClientMessage(playerid, 0xFF0000AA, "Próxima pergunta:");
		            SetTimerEx("Pergunta", 2000, 0, "ii", playerid, 3);
		        } else {
		            SendClientMessage(playerid, 0xFF0000AA, "Errado! Vai estudar vai!");
		            actquest[playerid] = 0;
		        }
		    } else if(actquest[playerid] == 3) {
		        if(!strcmp(text, "0", true)) {
		            SendClientMessage(playerid, 0xFFFF00AA, "Certo.");
		            SendClientMessage(playerid, 0xFF0000AA, "A prova terminou! $1000 para você e um emprego");
		            ShowMenuForPlayer(profs, playerid);
		            actquest[playerid] = 0;
		            GivePlayerMoney(playerid, 100000);
		        } else {
		            SendClientMessage(playerid, 0xFF0000AA, "Errado!");
		            actquest[playerid] = 0;
		        }
	        }
	    }
 	}
	return 1;
}

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[256];
	new idx;
	new tmp[256];
	cmd = strtok(cmdtext, idx);
	
		if(strcmp(cmd, "/ajuda", true) == 0) {
		SendClientMessage(playerid, cor_verde,"..:..:Dioguitos MiNi RPG:..:..");
		SendClientMessage(playerid, cor_azul,"/comandos ~ Ve os comandos.");
		SendClientMessage(playerid, cor_vermelho,"/creditos ~ Ve os creditos do rpg.");
		SendClientMessage(playerid, cor_amarelo,"/registrar [senha] ~ Se registra no RPG.");
		SendClientMessage(playerid, cor_verde,"/logar [senha] ~ Se loga no RPG.");
		return 1;
	}

	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, cor_verde,"..:..:Dioguitos MiNi RPG Comandos Parte 1:..:..");
		SendClientMessage(playerid, cor_vermelho,"/saldo ~ Ve seu saldo no banco(tem que estar no banco).");
		SendClientMessage(playerid, cor_vermelho,"/depositar [quantia] ~ Deposita uma quantia no banco(tem que estar no banco).");
		SendClientMessage(playerid, cor_vermelho,"/sacar [quantia] ~ Saca uma quantia no banco(tem que estar no banco).");
		SendClientMessage(playerid, cor_vermelho,"/transferir [id] [quantia] ~ Transfere grana a um jogador.");
		SendClientMessage(playerid, cor_vermelho,"/tbanco [id] [quantia] ~ Deposita grana a conta de um jogador(tem que estar no banco).");
		SendClientMessage(playerid, cor_vermelho,"Para ver mais comandos /comandos2");
		return 1;
	}

	if(strcmp(cmd, "/comandos2", true) == 0) {
		SendClientMessage(playerid, cor_verde,"..:..:Dioguitos MiNi RPG Comandos Parte 2:..:..");
		SendClientMessage(playerid, cor_vermelho,"/cerveja ~ Toma uma cerveja(tem que estar no bar).");
		SendClientMessage(playerid, cor_vermelho,"/guarana ~ Toma um guarana(tem que estar no bar).");
		SendClientMessage(playerid, cor_azul,"/taxi ~ Pede um taxi.");
		SendClientMessage(playerid, cor_vermelho,"/190 ~ Liga para a policia.");
		SendClientMessage(playerid, cor_vermelho,"/abastecer [litros] ~ Abastece seu carro(tem que estar no posto).");
		SendClientMessage(playerid, cor_vermelho,"/droga ~ Pede droga a um traficante(tem que estar perto do traficante).");
		SendClientMessage(playerid, cor_vermelho,"/pizza ~ Pede uma pizza.");
		SendClientMessage(playerid, cor_vermelho,"Para ver mais comandos /comandos3");
		return 1;
	}

	if(strcmp(cmd, "/comandos3", true) == 0) {
	    SendClientMessage(playerid, cor_verde,"..:..:Dioguitos MiNi RPG Comandos Parte 3:..:..");
	    SendClientMessage(playerid, cor_vermelho,"/taxi ~ Pede um taxi.");
	    SendClientMessage(playerid, cor_vermelho,"/hospedar ~ Se hospeda no hotel(Tem que estar no hotel).");
	    SendClientMessage(playerid, cor_vermelho,"/desospedar ~ Se desospeda no hotel(Tem que estar no hotel).");
		SendClientMessage(playerid, cor_vermelho,"/profissao ~ Ve os comandos da sua profissão.");
		SendClientMessage(playerid, cor_vermelho,"/cinfo ~ Ve as informações do condominio.");
		return 1;
	}
	
		if(strcmp(cmd, "/creditos", true) == 0) {
		SendClientMessage(playerid, cor_verde,"..:..:Dioguitos MiNi RPG Creditos:..:..");
		SendClientMessage(playerid, cor_azul,"Programador Principal: [KoG]DioguitosBR");
		SendClientMessage(playerid, cor_vermelho,"Ajuda de:");
		SendClientMessage(playerid, cor_vermelho,"Jabba - www.jabbahax.com");
		SendClientMessage(playerid, cor_vermelho,"Matraka - Jones");
		SendClientMessage(playerid, cor_vermelho,"Texugo - Jairo");
		SendClientMessage(playerid, cor_vermelho,"Rafael");
		SendClientMessage(playerid, cor_vermelho,"Agradecimentos a comunidade Pawn SA-MP Scripting");
		return 1;
	}
	
		if(strcmp(cmd, "/transferir", true) == 0) {
		new plid, quantia, string[256];
    	tmp = strtok(cmdtext, idx);
    	plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
  		quantia = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/transferir [id] [grana]");
				return 1;
			}
 			if(IsPlayerConnected(plid)) {
 			    new PlayerGrana = GetPlayerMoney(playerid);
				if(PlayerGrana >= quantia) {
				GivePlayerMoney(plid, quantia);
				GivePlayerMoney(playerid, quantia);
				format(string,sizeof(string),"%s te transferiu $%d", PlayerName(playerid), quantia);
				SendClientMessage(plid, cor_azul, string);
				} else SendClientMessage(playerid, cor_vermelho,"Você não tem toda essa grana!");
				} else SendClientMessage(playerid, cor_vermelho,"Jogador não conectado");
		return 1;
	}
	
			if(strcmp(cmd, "/tbanco", true) == 0) {
		new plid, quantia, string[256];
    	tmp = strtok(cmdtext, idx);
    	plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
  		quantia = strval(tmp);
  		    new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
  		    if(PlayerNoCheck == banco) {
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/transferir [id] [grana]");
				return 1;
			}
 			if(IsPlayerConnected(plid)) {
 			    new PlayerGrana = GranaBanco[playerid];
				if(PlayerGrana >= quantia) {
				GranaBanco[playerid]-= quantia;
				GranaBanco[plid]+= quantia;
				format(string,sizeof(string),"%s te transferiu $%d por banco", PlayerName(playerid), quantia);
				SendClientMessage(plid, cor_azul, string);
				} else SendClientMessage(playerid, cor_vermelho,"Você não tem toda essa grana!");
				} else SendClientMessage(playerid, cor_vermelho,"Jogador não conectado");
				} else SendClientMessage(playerid, cor_vermelho,"Você tem que estar no banco");
		return 1;
	}
	
	if(strcmp(cmd, "/prova", true) == 0) {
		if(Profissao[playerid] == estudante) {
			if(actquest[playerid] == 0) {
		        SendClientMessage(playerid, 0xFF0000AA, "Perguntas:");
		        SetTimerEx("Pergunta", 1000, 0, "ii", playerid, 1);
				return 1;
		    } else {
		        SendClientMessage(playerid, 0xFF0000AA, "Você já está nas perguntas...");
				return 1;
			}
	    }
	    return 1;
	}
	
	if(strcmp(cmd, "/gas", true) == 0) {
	    if(IsPlayerAdmin(playerid)) {
		for(new i = 0;i<MAX_PLAYERS;i++) Gas[GetPlayerVehicleID(i)]+=15;
		TogglePlayerControllable(playerid,1);
		}
		return 1;
	}
		
	if(strcmp(cmd,"/hospedar", true) == 0) {
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == c_hotel) {
			if(hotel[playerid] == 0) {
			    hotel[playerid]++;
				SendClientMessage(playerid, cor_verde,"Você acaba de se hospedar no hotel! Sera cobrado $500 a cada 10 minutos");
				GivePlayerMoney(playerid, - 500);
			} else if(hotel[playerid] == 1) SendClientMessage(playerid, cor_verde,"Você ja esta hospedado!");
		}
		else if(PlayerNoCheck != c_hotel) SendClientMessage(playerid, cor_verde,"Você não esta em um hotel");
		return 1;
	}
		
	if(strcmp(cmd,"/sairhotel", true) == 0) {
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == c_hotel) {
			if(hotel[playerid] == 0) SendClientMessage(playerid, cor_verde,"Você não esta hospedado!");
			else if(hotel[playerid] == 1) {
			SendClientMessage(playerid, cor_verde,"Você acaba de se desospedar");
			hotel[playerid]--;
			}
		}
		else if(PlayerNoCheck != c_hotel) SendClientMessage(playerid, cor_verde,"Você não esta em um hotel");
		return 1;
	}

		if(strcmp(cmd,"/profissao", true) == 0) {
		if(Profissao[playerid] == pizzaboy) {
		SendClientMessage(playerid, cor_azul,"Pizzaboy - Comandos");
		SendClientMessage(playerid, cor_verde,"/darpizza [id] - Da pizza para alguem.");
		}
		else if(Profissao[playerid] == traficante) {
		SendClientMessage(playerid, cor_azul,"Traficante - Comandos");
		SendClientMessage(playerid, cor_verde,"/venderdroga [id] - Da droga para alguem.");
		}
		else if(Profissao[playerid] == ladrao) {
		SendClientMessage(playerid, cor_azul,"Ladrao - Comandos");
		SendClientMessage(playerid, cor_verde,"/roubar [id] [quantia] - Rouba alguem.");
		}
		else if(Profissao[playerid] == rachador) {
		SendClientMessage(playerid, cor_azul,"Rachador - Comandos");
		SendClientMessage(playerid, cor_verde,"/desafiar [id] - Desafia alguem para o racha.");
		}
		else if(Profissao[playerid] == estudante) {
		SendClientMessage(playerid, cor_azul,"Estudante - Comandos");
		SendClientMessage(playerid, cor_verde,"/prova - Faz a prova");
		}
		else if(Profissao[playerid] == policial) {
		SendClientMessage(playerid, cor_azul,"Policial - Comandos");
		SendClientMessage(playerid, cor_verde,"/prender [id] - Prende alguem.");
		SendClientMessage(playerid, cor_verde,"/soltar [id] - Solta alguem.");
		SendClientMessage(playerid, cor_verde,"/bafometro [id] - Ve a quantia de alcool no sangue de alguem.");
		SendClientMessage(playerid, cor_verde,"Quando você chegar perto do portão da delegacia ele se abrira");
		}
		else if(Profissao[playerid] == bope) {
		SendClientMessage(playerid, cor_azul,"Bope - Comandos");
		SendClientMessage(playerid, cor_verde,"/prender [id] - Prende alguem.");
		SendClientMessage(playerid, cor_verde,"/soltar [id] - Solta alguem.");
		SendClientMessage(playerid, cor_verde,"/bafometro [id] - Ve a quantia de alcool no sangue de alguem.");
		SendClientMessage(playerid, cor_verde,"Quando você chegar perto do portão da delegacia ele se abrira");
		}
		else if(Profissao[playerid] == juiz) {
		SendClientMessage(playerid, cor_azul,"Juiz - Comandos");
		SendClientMessage(playerid, cor_verde,"/prender [id] - Prende alguem.");
		SendClientMessage(playerid, cor_verde,"/soltar [id] - Solta alguem.");
		}
		else if(Profissao[playerid] == vende_carro) {
		SendClientMessage(playerid, cor_azul,"Vendedor de carros - Comandos");
		SendClientMessage(playerid, cor_verde,"/vendercarro [id] [preço] - Vende um carro para alguem");
		}
		else if(Profissao[playerid] == pescador) {
		SendClientMessage(playerid, cor_azul,"Pescador - Comandos");
		SendClientMessage(playerid, cor_verde,"/comprarisca - Compra a isca");
        SendClientMessage(playerid, cor_verde,"/pescar - Pesca na area de pesca");
        SendClientMessage(playerid, cor_verde,"/venderpeixe - Vende o peixe que você pescou");
		}
		else if(Profissao[playerid] == ibama) {
		SendClientMessage(playerid, cor_azul,"Agente do IBAMA - Comandos");
		SendClientMessage(playerid, cor_verde,"/pescaon - Deixa os pescadores pescarem");
        SendClientMessage(playerid, cor_verde,"/pescaoff - Não deixa os pescadores pescarem");
        }
		else if(Profissao[playerid] == mototaxista) {
		SendClientMessage(playerid, cor_azul,"MotoTaxista - Comandos");
		SendClientMessage(playerid, cor_verde,"/mcliente [id] - Liga o taximetro(o jogador tem que estar na sua moto)");
        }
		else if(Profissao[playerid] == jornalista) {
		SendClientMessage(playerid, cor_azul,"Jornalista - Comandos");
		SendClientMessage(playerid, cor_verde,"/materia [materia] - Faz uma materia no jornal");
        }
		else if(Profissao[playerid] == mecanico) {
		SendClientMessage(playerid, cor_azul,"Mecanico - Comandos");
		SendClientMessage(playerid, cor_verde,"/repararv - Repara o veiculo de um cliente");
        SendClientMessage(playerid, cor_verde,"/tunarv - Tuna o veiculo de um cliente");
        }
		else if(Profissao[playerid] == vende_casa) {
		SendClientMessage(playerid, cor_azul,"Corretor de casa - Comandos");
		SendClientMessage(playerid, cor_verde,"/vendercasa [id] [quantia] - Vende uma casa para alguem");
        }
        else {
		SendClientMessage(playerid, cor_verde,"Profissão sem comandos!");
		}
		return 1;
	}
	
	if(strcmp(cmd,"/registrar", true) == 0) {
		tmp = strtok(cmdtext, idx);
    	if (dini_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Servidor: Você ja esta registrado");
			return 1;
		}
    	if (PlayerLogado[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Servidor: Você ja esta logado!");
			return 1;
		}
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Servidor: Uso Correto: /registrar [senha]");
			return 1;
		} else {
			new Float:X = 0;
        	dini_Create(PlayerName(playerid));
        	dini_Set(PlayerName(playerid),"Senha", tmp);
        	dini_IntSet(PlayerName(playerid),"Grana", 0);
        	dini_IntSet(PlayerName(playerid),"Profissao", 0);
        	dini_IntSet(PlayerName(playerid),"Morador", 0);
        	SendClientMessage(playerid, cor_azul, "Registrado e Logado! Você tem $1000 para Começar a Viver");
        	GivePlayerMoney(playerid, 1000);
			dini_FloatSet(PlayerName(playerid), "Casa_X", X);
			dini_FloatSet(PlayerName(playerid), "Casa_Y", X);
			dini_FloatSet(PlayerName(playerid), "Casa_Z", X);
        	Loga(playerid);
	 	}
		return 1;
	}

	if(strcmp(cmd, "/logar", true) == 0 && IsPlayerConnected(playerid)) {
		tmp = strtok(cmdtext, idx);
	    if (!dini_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Servidor: Você não esta registrado.");
			return 1;
		}
	    if (PlayerLogado[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Servidor: Voce ja esta logado.");
			return 1;
		}
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Servidor: Uso correto: /logar [senha]");
			return 1;
		}
		if(strlen(tmp) == strlen(dini_Get(PlayerName(playerid),"Senha"))) {
			Loga(playerid);
			return 1;
		} else {
			SendClientMessage(playerid, COLOR_RED, "Servidor: Errou a senha!");
			return 1;
	    }
	}
	
	if(strcmp(cmd,"/depositar", true) == 0) {
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == banco) {
			tmp = strtok(cmdtext, idx);
			new grana = strval(tmp);
			if(grana <= 0) {
				SendClientMessage(playerid, COLOR_RED, "Você esta tentando depositar um valor nulo!");
				return 1;
			} else AumentarGranaBanco(playerid, grana);
		} else SendClientMessage(playerid, cor_verde,"Você tem que estar em um banco!");
		return 1;
	}
	
	if(strcmp(cmd,"/cerveja", true) == 0) {
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == c_profs) {
			alcool[playerid]++;
			new string[256];
			format(string, sizeof(string), "Você acabou de tomar uma Skol! Você tem %d de alcool no sangue", alcool[playerid]);
			GivePlayerMoney(playerid, -500);
			SendClientMessage(playerid, cor_vermelho, string);
		}
		return 1;
	}
	
	if(strcmp(cmd,"/guarana", true) == 0) {
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == c_profs) {
		    if(alcool[playerid] >= 1)
		    {
			alcool[playerid]--;
			new string[256];
			format(string, sizeof(string), "Você acabou de tomar um Guarana! Seu teor de alcool diminuiu para: %d ", alcool[playerid]);
			GivePlayerMoney(playerid, -500);
			SendClientMessage(playerid, cor_vermelho, string);
			}
			else {
			new string[256];
			format(string, sizeof(string), "Você acabou de tomar um Guarana!");
			GivePlayerMoney(playerid, -500);
			SendClientMessage(playerid, cor_vermelho, string);
			}
		}
		return 1;
	}
	
	if(strcmp(cmd, "/bafometro", true) == 0) {
		new plid,string[256];
		if(Profissao[playerid] == bope || Profissao[playerid] == policial) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/bafometro [id]");
				return 1;
			}
        	plid = strval(tmp);
 			if(IsPlayerConnected(plid)) {
 			    new distanciaa;
				distanciaa = Distancia(playerid, plid);
				if(distanciaa <= 10) {
					format(string, sizeof(string), "%s tem %d miligramas de alcool no sangue", PlayerName(plid), alcool[plid]);
					SendClientMessage(playerid, cor_vermelho, string);
					if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
				}
				return 1;
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e Policial ou Bope!");
		return 1;
 	}
 	
 		if(strcmp(cmd, "/desafiar", true) == 0) {
		new plid,string[256];
		if(Profissao[playerid] == rachador) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/desafiar [id]");
				return 1;
			}
        	plid = strval(tmp);
 			if(IsPlayerConnected(plid)) {
					format(string, sizeof(string), "%s está te chamando para o racha", PlayerName(playerid));
					SendClientMessage(playerid, cor_vermelho, string);
				return 1;
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e rachador!");
		return 1;
 	}
	
	if(strcmp(cmd,"/sacar", true) == 0) {
		tmp = strtok(cmdtext, idx);
		new grana = strval(tmp);
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == banco) {
			if(grana <= 0) {
				SendClientMessage(playerid, COLOR_RED, "Você esta tentando sacar um valor nulo!");
				return 1;
			} else {
				RetirarGranaBanco(playerid,grana);
				GivePlayerMoney(playerid,grana);
			}
		} else SendClientMessage(playerid, cor_verde,"Você tem que estar em um banco!");
		return 1;
	}
	
	if(strcmp(cmd,"/abastecer", true) == 0) {
		tmp = strtok(cmdtext, idx);
		new litros = strval(tmp);
		if(PlayerNoPonto(5.0, playerid, -2029.846680,155.986496,28.496315) || PlayerNoPonto(5.0, playerid, -1674.709106,413.694702,6.840065)) {
			if(litros <= 0 || litros > 100) {
				SendClientMessage(playerid, COLOR_RED, "Você esta tentando colocar 0 litros ou mais de 100!");
				return 1;
			} else {
			    if(Gas[GetPlayerVehicleID(playerid)] + litros < 100) {
				new pagar = litros * 2;
				GivePlayerMoney(playerid, -pagar);
				Gas[GetPlayerVehicleID(playerid)]+=litros;
				new string[256];
				format(string,sizeof(string),"Foram colocados %d litros! Total de litros no tanque: %%d",litros, Gas[GetPlayerVehicleID(playerid)]);
				SendClientMessage(playerid, cor_azul, string);
				}
				else {
				new sobra = 100 - Gas[GetPlayerVehicleID(playerid)];
				new string[256];
				Gas[GetPlayerVehicleID(playerid)] = 100;
				GivePlayerMoney(playerid, - sobra);
				format(string,sizeof(string),"Seu tanque ficou completo, foram colocados %d litros!",sobra);
				SendClientMessage(playerid, cor_azul, string);
				}
			}
		} else SendClientMessage(playerid, cor_verde,"Você tem que estar em um posto!");
		return 1;
	}
	
	if(strcmp(cmd,"/saldo", true) == 0) {
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == banco) {
			new string[256];
			format(string, sizeof(string), "Seu Saldo e: %d.", GranaBanco[playerid]);
			SendClientMessage(playerid, cor_azul, string);
		} else SendClientMessage(playerid, cor_verde,"Você tem que estar em um banco!");
		return 1;
	}
	
	if(strcmp(cmd, "/prender", true) == 0) {
		new plid,string[256];
		if(Profissao[playerid] == bope || Profissao[playerid] == policial || Profissao[playerid] == juiz) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/prender [id]");
				return 1;
			}
        	plid = strval(tmp);
 			if(IsPlayerConnected(plid)) {
 			    new distanciaa;
				distanciaa = Distancia(playerid, plid);
				if(distanciaa <= 10) {
					Preso[plid] = 1;
					format(string, sizeof(string), "Você foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, cor_vermelho, string);
					format(string, sizeof(string), "%s foi preso por %s", PlayerName(plid), PlayerName(playerid));
					SendClientMessageToAll(cor_vermelho, string);
					SetPlayerInterior(plid, 3);
					SetPlayerPos(plid, 197.6661,173.8179,1003.0234);
					if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
				}
				return 1;
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e Policial, Juiz ou do Bope!");
		return 1;
	}
	
	if(strcmp(cmd, "/soltar", true) == 0) {
		new plid,string[256];
		if(Profissao[playerid] == bope || Profissao[playerid] == policial || Profissao[playerid] == juiz) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/soltar [id]");
				return 1;
			}
        	plid = strval(tmp);
 			if(IsPlayerConnected(plid)) {
				Preso[plid] = 0;
				format(string, sizeof(string), "Você foi solto por: %s", PlayerName(playerid));
				SendClientMessage(plid, cor_vermelho, string);
				format(string, sizeof(string), "%s foi solto por %s", PlayerName(plid), PlayerName(playerid));
				SendClientMessageToAll(cor_vermelho, string);
				SpawnPlayer(plid);
				return 1;
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e Policial, Juiz ou do Bope!");
		return 1;
	}
	
	if(strcmp(cmd, "/vendercarro", true) == 0) {
		new Float:x,Float:y,Float:z,Float:a,modelo,veiculoid;
		new plid,quantia,string[256];
		if(Profissao[playerid] == vende_carro) {
			    	tmp = strtok(cmdtext, idx);
    	plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
  		quantia = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/vendercarro [id] [quantia]");
				return 1;
			}
 			if(IsPlayerConnected(plid)) {
 				if(IsPlayerInAnyVehicle(playerid)) {
					veiculoid = GetPlayerVehicleID(playerid);
					GetVehiclePos(veiculoid,x,y,z);
					GetVehicleZAngle(veiculoid,a);
					modelo = GetVehicleModel(veiculoid);
					//aqui
					new count = 0;
					while(Carro_Exists(count)) count++;
					format(string, sizeof(string),"veiculo_%d.txt",count);
					if(!dini_Exists(string)) {
						GivePlayerMoney(plid, - quantia);
						dini_Create(string);
						dini_IntSet(string,"modelo",modelo);
						dini_IntSet(string,"id",veiculoid);
						dini_FloatSet(string,"x",x);
						dini_FloatSet(string,"y",y);
						dini_FloatSet(string,"z",z);
						dini_FloatSet(string,"a",a);
						dini_Set(string,"dono",PlayerName(plid));
						SendClientMessage(playerid, cor_verde,"Carro vendido!");
						new string2[256];
						format(string2, sizeof(string2),"%s setou um carro para você!(ID:%d)(Preço:$%d)", PlayerName(playerid), veiculoid, quantia);
						SendClientMessage(plid, cor_azul, string2);
						if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
					}
				}
			}
		}
		return 1;
	}

	if(strcmp(cmd, "/vendercasa", true) == 0) {
	    new plid, quantia;
	    new string[256];
		if(Profissao[playerid] == vende_casa) {
    	tmp = strtok(cmdtext, idx);
    	plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
  		quantia = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/vendercasa [id] [quantia]");
				return 1;
			}
 			if(IsPlayerConnected(plid)) {
			new count = 0;
			while(Casa_Exists(count)) count++;
			format(string, sizeof(string),"pickup_%d.txt",count);
 			new Float:X, Float:Z, Float:Y;
			GetPlayerPos(playerid, X, Y, Z);
			dini_FloatSet(PlayerName(plid), "Casa_X", X);
			dini_FloatSet(PlayerName(plid), "Casa_Y", Y);
			dini_FloatSet(PlayerName(plid), "Casa_Z", Z);
			dini_Create(string);
			dini_FloatSet(string, "X", X);
			dini_FloatSet(string, "Y", Y);
			dini_FloatSet(string, "Z", Z);
			dini_Set(string, "Dono", PlayerName(plid));
			AddStaticPickup(1273, 23, X, Y, Z);
			SendClientMessage(playerid, cor_verde,"Casa vendida!");
			GivePlayerMoney(plid, - quantia);
			SetPlayerPos(plid, X, Y, Z);
						format(string, sizeof(string),"%s setou uma casa para você!(Preço:$%d)", PlayerName(playerid), quantia);
						SendClientMessage(plid, cor_azul, string);
						if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
					}
				}
		return 1;
	}
	
	
	if(strcmp(cmd, "/darpizza", true) == 0) {
		new plid;
		if(Profissao[playerid] == pizzaboy) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/darpizza [id]");
				return 1;
			}
        	plid = strval(tmp);
 			if(IsPlayerConnected(plid)) {
    			new distanciaa;
				distanciaa = Distancia(playerid, plid);
				if(distanciaa <= 10) {
 					if(pizza[plid] == 1) {
			 			SendClientMessage(plid, cor_vermelho,"Você acaba de receber sua pizza! $200");
			 			GivePlayerMoney(plid, 200);
			 			pizza[plid] = 0;
			 			if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
			 			return 1;
					} else if(pizza[plid] == 0) {
						SendClientMessage(playerid, cor_verde,"Querendo vender pizza para pessoa sem ela querer ne?");
						GivePlayerMoney(playerid, 400);
					}
				}
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e PizzaBoy!");
		return 1;
	}
		
	if(strcmp(cmd, "/venderdroga", true) == 0) {
		new plid;
		if(Profissao[playerid] == traficante) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/venderdroga [id]");
				return 1;
			}
        	plid = strval(tmp);
 			if(IsPlayerConnected(plid)) {
	    		new distanciaa;
				distanciaa = Distancia(playerid, plid);
				if(distanciaa <= 10) {
 					if(droga[plid] == 1) {
			 			SendClientMessage(plid, cor_vermelho,"O Traficante te deu sua cocaina! $300");
			 			GivePlayerMoney(plid, 300);
			 			SetPlayerHealth(plid, 50);
			 			droga[plid] = 0;
			 			if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
			 			return 1;
					} else if(droga[plid] == 0) {
						SendClientMessage(playerid, cor_verde,"Querendo vender droga para pessoa sem ela querer ne?");
						GivePlayerMoney(playerid, 400);
					}
				}
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e traficante!");
		return 1;
	}
		
  	if(strcmp(cmd, "/roubar", true) == 0) {
		new plid,quantia;
		if(Profissao[playerid] == ladrao) {
			    	tmp = strtok(cmdtext, idx);
    	plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
  		quantia = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/roubar [id] [quantia]");
				return 1;
			}
 			if(IsPlayerConnected(plid)) {
	    		new distanciaa;
				distanciaa = Distancia(playerid, plid);
				if(distanciaa <= 10) {
					if(GetPlayerMoney(plid) >= quantia) {
						GivePlayerMoney(plid, - quantia);
						//GivePlayerMoney(playerid, + quantia);
						new string[256];
					   	format(string, sizeof(string), "%s te roubou", PlayerName(playerid));
						SendClientMessage(plid, cor_vermelho, string);
						if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
					}
				}
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e ladrão!");
		return 1;
	}
	
	if(strcmp(cmd, "/190", true) == 0) {
		new string[256];
		for(new i = 0;i<MAX_PLAYERS;i++) {
            if(Profissao[i] == bope || Profissao[i] == policial) {
	        	format(string, sizeof(string), "%s ligou para o 190!", PlayerName(playerid));
				SendClientMessage(i, cor_vermelho, string);
				return 1;
			}
		}
		return 1;
  	}
			
    if(strcmp(cmd, "/droga", true) == 0) {
		new string[256];
	    for(new i = 0;i<MAX_PLAYERS;i++) {
		    if(Profissao[i] == traficante) {
				format(string, sizeof(string), "%s ta querendo droga!", PlayerName(playerid));
				SendClientMessage(i, cor_vermelho, string);
				droga[playerid]++;
				return 1;
			}
		}
		return 1;
	}
			
	if(strcmp(cmd, "/pizza", true) == 0) {
	    for(new i = 0;i<MAX_PLAYERS;i++) {
		    if(Profissao[i] == pizzaboy) {
			    new string[256];
				format(string, sizeof(string), "%s pediu pizza!", PlayerName(playerid));
				SendClientMessage(i, cor_vermelho, string);
				pizza[playerid]++;
				return 1;
			}
		}
		return 1;
	}
	
	if(strcmp(cmd, "/taxi", true) == 0) {
    	for(new i = 0;i<MAX_PLAYERS;i++) {
    		if(Profissao[i] == taxista) {
			    new string[256];
				format(string, sizeof(string), "%s esta pedindo Taxi", PlayerName(playerid));
				SendClientMessage(i, cor_vermelho, string);
				return 1;
			}
		}
		return 1;
	}
	
	if(strcmp(cmd, "/multar", true) == 0) {
		new plid,grana;
		if(Profissao[playerid] == bope || Profissao[playerid] == policial || Profissao[playerid] == juiz) {
    	tmp = strtok(cmdtext, idx);
    	plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
  		grana = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/multar [id] [grana]");
				return 1;
			}
 			if(IsPlayerConnected(plid)) {
	 			if(grana <= 600) {
	 			    new string[256];
					format(string, sizeof(string), "Você foi multando em %d por %s", grana, PlayerName(playerid));
					SendClientMessage(plid, cor_vermelho, string);
					new g = - grana;
					GivePlayerMoney(plid, g);
	    			if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
				}
					return 1;
				}
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e Policial, Juiz ou do Bope!");
		return 1;
	}
	
			if(strcmp(cmd, "/cliente", true) == 0) {
		new plid;
		if(Profissao[playerid] == taxista) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/cliente [id]");
				return 1;
			}
        	plid = strval(tmp);
        	if(Taxi[plid][0] == 1) SendClientMessage(playerid, cor_azul,"Você ja esta tarifando a viajem desse jogador!");
 			if(IsPlayerConnected(plid)) {
 			if(Taxi[plid][0] != 1) {
 			if(GetPlayerVehicleID(playerid) == 420 ||GetPlayerVehicleID(playerid) == 438) {
            if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
			SendClientMessage(plid, cor_verde,"Taximetro ligado! A taxa de largada foi cobrada! $30");
			GivePlayerMoney(plid, - 30);
			GivePlayerMoney(playerid, 30);
   			SetTimerEx("Taximetro", 5000, true, "ii", plid, 1);
   			Taxi[plid][0] = 1;
   			Taxi[plid][1] = playerid;
				}
				}
				}
				return 1;
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e taxista!");
		return 1;
	}
	
			if(strcmp(cmd, "/mcliente", true) == 0) {
		new plid;
		if(Profissao[playerid] == mototaxista) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/mcliente [id]");
				return 1;
			}
        	plid = strval(tmp);
        	if(MTaxi[plid][0] == 1) SendClientMessage(playerid, cor_azul,"Você ja esta tarifando a viajem desse jogador!");
 			if(IsPlayerConnected(plid)) {
 			if(MTaxi[plid][0] != 1) {
            if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
			SendClientMessage(plid, cor_verde,"MotoTaximetro ligado! A taxa de largada foi cobrada! $30");
			GivePlayerMoney(plid, - 30);
			GivePlayerMoney(playerid, 30);
   			SetTimerEx("MTaximetro", 5000, true, "ii", plid, 1);
   			MTaxi[plid][0] = 1;
   			MTaxi[plid][1] = playerid;
				}
				}
				return 1;
			} else SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
		} else SendClientMessage(playerid, cor_verde,"Você não e taxista!");
		return 1;
	}
	
		if(strcmp(cmd, "/cinfo", true) == 0) {
		SendClientMessage(playerid, cor_azul, ".:.Condominio Aquatico Sol Nascente.:.");
		SendClientMessage(playerid, cor_verde, "Para voce virar um morador do Condominio");
		SendClientMessage(playerid, cor_vermelho, "Aquatico Sol Nascente, você devera digitar");
		SendClientMessage(playerid, cor_amarelo, "/virarmorador, e tera que pagar $1000 de inicio");
		SendClientMessage(playerid, cor_azul, "e $500 a cada 20 minutos(minuto real).");
		return 1;
	}
		if(strcmp(cmd, "/virarmorador", true) == 0) {
		if(Morador[playerid] == 1) {
			SendClientMessage(playerid, cor_verde, "Voce ja e morador!");
		}
		else if(GetPlayerMoney(playerid) > 999) {
			SendClientMessage(playerid, cor_vermelho, "Voce acaba de virar morador! Ele esta marcado no Mapa com um Disquete!");
			Morador[playerid] = 1;
			GivePlayerMoney(playerid, - 1000);
		}
		else if(GetPlayerMoney(playerid) <= 999) {
		if(GranaBanco[playerid] > 999) {
		SendClientMessage(playerid, cor_vermelho, "Voce acaba de virar morador! Ele esta marcado no Mapa com um Disquete!");
		Morador[playerid] = 1;
		GivePlayerMoney(playerid, - 1000);
		}
		}
		return 1;
		}
	
	if(strcmp(cmd, "/cabrir", true) == 0) {
	new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
	if(Morador[playerid] == 1) {
	if(PlayerNoCheck == c_condominio1 || PlayerNoCheck == c_condominio2) {
	MoveObject(cportao1, -3136.843,463.380,10.918,5.0);
	MoveObject(cportao2, -3136.715,477.315,10.918,5.0);
	TimerCondominio = SetTimer("FecharCondominio", 8000, 1);
	SendClientMessage(playerid, cor_verde,"Portão aberto! 6 segundos para passar.");
	}
	}
	else if(Morador[playerid] == 0) SendClientMessage(playerid, cor_verde,"Você tem que ser morador para abrir o portao do condominio");
	else if(PlayerNoCheck != c_condominio1 || PlayerNoCheck != c_condominio2) SendClientMessage(playerid, cor_verde,"Você tem que estar perto do condominio");
		return 1;
	}
	
			if(strcmp(cmd, "/comprarisca", true) == 0) {
	    new Isca;
	    tmp = strtok(cmdtext, idx);
    	Isca = strval(tmp);
		if(!strlen(tmp)) {
		SendClientMessage(playerid, cor_verde, "/comprarisca [Numero da isca]");
		return 1;
		}
		if(Profissao[playerid] == pescador) {
			if(Isca == 1) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar a isca de: Minhoca. $30");
			GivePlayerMoney(playerid, - 30);
			isca[playerid] = 1;
			}
			else if(Isca == 2) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar a isca de: Camarao. $50");
			GivePlayerMoney(playerid, - 50);
			isca[playerid] = 2;
			}
			else if(Isca == 3) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar a isca de: Ração. $40");
			GivePlayerMoney(playerid, - 40);
			isca[playerid] = 3;
			}
			else if(Isca == 4) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar uma rede. $70");
			GivePlayerMoney(playerid, - 70);
			isca[playerid] = 4;
			}
			}
		else if(Profissao[playerid] != pescador) {
		if(Isca == 1) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar a isca de: Minhoca. $50");
			GivePlayerMoney(playerid, - 50);
			isca[playerid] = 1;
			}
			else if(Isca == 2) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar a isca de: Camarao. $70");
			GivePlayerMoney(playerid, - 70);
			isca[playerid] = 2;
			}
			else if(Isca == 3) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar a isca de: Ração. $60");
			GivePlayerMoney(playerid, - 60);
			isca[playerid] = 3;
			}
			else if(Isca == 4) {
			SendClientMessage(playerid, cor_amarelo,"Você acaba de comprar uma rede. $90");
			GivePlayerMoney(playerid, - 90);
			isca[playerid] = 4;
			}
			}
		return 1;
	}
		
		if(strcmp(cmd, "/precosisca", true) == 0) {
		new PlayerNoCheck = CPS_GetPlayerCheckpoint(playerid);
		if(PlayerNoCheck == pesca) {
		if(Profissao[playerid] == pescador) {
		SendClientMessage(playerid, cor_verde, "Iscas");
		SendClientMessage(playerid, cor_verde, "1 - Minhoca - $30");
		SendClientMessage(playerid, cor_verde, "2 - Camarão - $50");
		SendClientMessage(playerid, cor_verde, "3 - Ração - $40");
		SendClientMessage(playerid, cor_verde, "4 - Rede - $70");
		}
		else {
		SendClientMessage(playerid, cor_verde, "Iscas - Não pescador");
		SendClientMessage(playerid, cor_verde, "1 - Minhoca - $50");
		SendClientMessage(playerid, cor_verde, "2 - Camarão - $70");
		SendClientMessage(playerid, cor_verde, "3 - Ração - $60");
		SendClientMessage(playerid, cor_verde, "4 - Rede - $90");
		}
		}
		return 1;
		}
		
		if(strcmp(cmd, "/pescar", true) == 0) {
		if(isca[playerid] > 0) {
		if(pesca == 1) {
		if(PlayerInArea(playerid, -2750.05, -2923.87, 1521.128, 1390.945)) {
  		PT = SetTimerEx("PescarTimer", 10000, 0, "ii", playerid);
  		SendClientMessage(playerid, cor_azul,"Rede/isca jogada... Espere um pouco para ela voltar/morder.");
		} else SendClientMessage(playerid, cor_verde,"Você tem que estar na area de pesca!");
		} else if(pesca == 0) SendClientMessage(playerid, cor_verde,"A pesca esta proibida.");
		} else SendClientMessage(playerid, cor_verde,"Você esta sem isca!");
		return 1;
		}
		
if(strcmp(cmd, "/venderpeixe", true) == 0) {
new string[256];
if(CPS_GetPlayerCheckpoint(playerid) == pesca) {
if(Profissao[playerid] == pescador) {
if(HorarioTrab[playerid] == 1) {
			AdicionarXP(playerid, 1);
			SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
		}
if(peixe[playerid] == 0) {
GivePlayerMoney(playerid, 90 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de dourado", 90 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
quilos[playerid] = 0;
peixe[playerid] = 0;
}
if(peixe[playerid] == 1) {
GivePlayerMoney(playerid, 100 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Lagosta", 100 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 2) {
GivePlayerMoney(playerid, 60 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Baiacu", 60 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 3) {
GivePlayerMoney(playerid, 70 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Atum", 70 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 4) {
GivePlayerMoney(playerid, 60 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Tilapia", 60 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 5) {
GivePlayerMoney(playerid, 40 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Sardinha", 40 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
} else {
GivePlayerMoney(playerid, 70 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de dourado", 70 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
quilos[playerid] = 0;
peixe[playerid] = 0;
}
if(peixe[playerid] == 1) {
GivePlayerMoney(playerid, 80 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Lagosta", 80 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 2) {
GivePlayerMoney(playerid, 40 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Baiacu", 40 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 3) {
GivePlayerMoney(playerid, 50 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Atum", 50 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 4) {
GivePlayerMoney(playerid, 40 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Tilapia", 40 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}
if(peixe[playerid] == 5) {
GivePlayerMoney(playerid, 20 * quilos[playerid]);
format(string, sizeof(string),"$%d por %d quilos de Sardinha", 20 * quilos[playerid], quilos[playerid]);
SendClientMessage(playerid, cor_verde, string);
peixe[playerid] = 0;
quilos[playerid] = 0;
}

} else SendClientMessage(playerid, cor_azul,"Você tem que estar na barraca dos pescadores!");
return 1;
}
		
		if(strcmp(cmd, "/pescaon", true) == 0) {
		new string[256];
		if(Profissao[playerid] == ibama) {
		if(pesca == 0) {
		SendClientMessage(playerid, cor_azul,"Pesca autorizada!");
		format(string, sizeof(string),"%s autorizou a pesca", PlayerName(playerid));
		SendClientMessageToAll(cor_vermelho, string);
		pesca = 1;
		if(HorarioTrab[playerid] == 1) {
			AdicionarXP(playerid, 1);
			SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
		}
		}
		else if(pesca == 1) {
		SendClientMessage(playerid, cor_verde,"A pesca ja esta autorizada!");
		}
		}
		else SendClientMessage(playerid, cor_verde,"Você não e do Ibama!");
		return 1;
		}
		
		if(strcmp(cmd, "/pescaoff", true) == 0) {
		new string[256];
		if(Profissao[playerid] == ibama) {
		if(pesca == 1) {
		SendClientMessage(playerid, cor_azul,"Pesca proibida!");
		format(string, sizeof(string),"%s proibiu a pesca", PlayerName(playerid));
		SendClientMessageToAll(cor_vermelho, string);
		pesca = 0;
		if(HorarioTrab[playerid] == 1) {
			AdicionarXP(playerid, 1);
			SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
		}
		}
		else if(pesca == 0) {
		SendClientMessage(playerid, cor_verde,"A pesca ja esta proibida!");
		}
		}
		else SendClientMessage(playerid, cor_verde,"Você não e do Ibama!");
		return 1;
		}
		
	if(!strcmp(cmd, "/materia", true)) {
		new string[256], materia[256];
		if(Profissao[playerid] == jornalista) {
			tmp = strtok(cmdtext, idx);
			materia = tmp;
			while(strlen(tmp) > 0) {
				strcat(materia, " ");
				strcat(materia, tmp);
				tmp = strtok(cmdtext, idx);
			}
			if(!strlen(tmp)) SendClientMessage(playerid, cor_verde, "USE: /materia [materia]");
			format(string, sizeof string, "San Fierro News: %s", materia);
			SendClientMessageToAll(cor_verde, string);
			if(HorarioTrab[playerid] == 1) {
			AdicionarXP(playerid, 1);
			SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
		}
		} else {
			SendClientMessage(playerid, cor_verde, "Você não é Jornalista");
		}
		return 1;
	}
	
		if(strcmp(cmd, "/repararv", true) == 0) {
        new Float:x,Float:y,Float:z,Float:a,veiculoid;
		if(Profissao[playerid] == mecanico) {
		if(IsPlayerInAnyVehicle(playerid)) {
		veiculoid = GetPlayerVehicleID(playerid);
		GetVehiclePos(veiculoid,x,y,z);
		GetVehicleZAngle(veiculoid,a);
		RemovePlayerFromVehicle(playerid);
		DestroyVehicle(veiculoid);
		CreateVehicle(veiculoid, x, y, z, a, 86, 86, 1000);
		if(HorarioTrab[playerid] == 1) {
		AdicionarXP(playerid, 1);
		SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
	}

		}
		} else SendClientMessage(playerid, cor_verde,"Você não e mecanico!");
		return 1;
	}
	
			if(strcmp(cmd, "/tunarv", true) == 0) {
        new veiculoid;
		if(Profissao[playerid] == mecanico) {
		if(IsPlayerInAnyVehicle(playerid)) {
		veiculoid = GetPlayerVehicleID(playerid);
		AddVehicleComponent(veiculoid, 1010);
		AddVehicleComponent(veiculoid, 1073);
		AddVehicleComponent(veiculoid, 1087);
		if(HorarioTrab[playerid] == 1) {
		AdicionarXP(playerid, 1);
		SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
		}
		}
		} else SendClientMessage(playerid, cor_verde,"Você não e mecanico!");
		return 1;
	}
	
	
				if(strcmp(cmd, "/rebocar", true) == 0) {
		if(Profissao[playerid] == mecanico) {
		if(GetPlayerVehicleID(playerid) == 525) {
		new Float:pX,Float:pY,Float:pZ;
		GetPlayerPos(playerid,pX,pY,pZ);
		new Float:vX,Float:vY,Float:vZ;
		new procurado = 0;
		new vid = 0;
		while((vid<MAX_VEHICLES) && (!procurado)) {
   				vid++;
   				GetVehiclePos(vid,vX,vY,vZ);
   				if ((floatabs(pX-vX)<7.0) && (floatabs(pY-vY)<7.0) && (floatabs(pZ-vZ)<7.0) && (vid!=GetPlayerVehicleID(playerid))) {
   				    procurado = 1;
   				    if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) {
   				        DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
   				        }
   				    AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
   				    SendClientMessage(playerid, cor_azul,"Carro rebocado!");
   				    if(HorarioTrab[playerid] == 1) {
					AdicionarXP(playerid, 1);
					SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
					}

   				    }
       			}
			if(!procurado) {
			    SendClientMessage(playerid, cor_verde,"Sem carro!");
			    }
		} else SendClientMessage(playerid, cor_vermelho,"Você não esta em um carro de mecanico!");
		} else SendClientMessage(playerid, cor_verde,"Você não e mecanico!");
		return 1;
	}
	
		if(strcmp(cmd, "/hackear", true) == 0) {
		new plid, quantia, string[256];
		if(Profissao[playerid] == hacker) {
    	tmp = strtok(cmdtext, idx);
    	plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
  		quantia = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, cor_verde, "/hackear [id] [grana]");
                SendClientMessage(playerid, cor_verde, "Caso queira hackear todos no id coloque 999");
			}
			    if(!IsPlayerConnected(plid) && plid != 999) SendClientMessage(playerid, cor_verde, "Jogador nao conectado.");
 			    if(plid != 999) {
 			    if(IsPlayerConnected(plid)) {
 			    if(GranaBanco[plid] >= quantia) {
	 			format(string, sizeof(string),"%s roubou $%d da sua conta bancaria", PlayerName(playerid), quantia);
	 			SendClientMessage(playerid, cor_verde, string);
	 			GranaBanco[plid]-= quantia;
	 			GranaBanco[playerid]+= quantia;
	 			for(new i = 0;i<MAX_PLAYERS;i++) {
	 			if(Profissao[i] == policial || Profissao[i] == bope || Profissao[i] == juiz) {
	 			format(string, sizeof(string),"O hacker %s hackeou %s em $%d", PlayerName(playerid), PlayerName(plid), quantia);
	 			SendClientMessage(i, cor_verde, string);
	 			if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
			}

	 			}
	 			}
	       	    }
				}
				}
				else {
				for(new i = 0;i<MAX_PLAYERS;i++) {
				if(GranaBanco[i] >= quantia) {
				GranaBanco[i]-= quantia;
                GranaBanco[playerid]+= quantia * i;
 			    format(string, sizeof(string),"%s roubou $%d da sua conta bancaria", PlayerName(playerid), quantia);
	 			SendClientMessage(i, cor_verde, string);
	 			if(Profissao[i] == policial || Profissao[i] == bope || Profissao[i] == juiz) {
	 			format(string, sizeof(string),"O hacker %s hackeou todas as contas bancarias!", PlayerName(playerid));
	 			SendClientMessage(i, cor_verde, string);
	 			if(HorarioTrab[playerid] == 1) {
				AdicionarXP(playerid, 1);
				SendClientMessage(playerid, cor_verde,"Você acaba de ganhar 1 Xpoint");
			}
	 			}
				}
				}
				}
		} else SendClientMessage(playerid, cor_verde,"Você não e Hacker!");
		return 1;
	}
	
	
	return SendClientMessage(playerid, cor_verde,"Esse comando não existe!");
}


public OnPlayerInfoChange(playerid)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    TextDrawShowForPlayer(playerid, textveiculo[vehicleid]);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    TextDrawHideForPlayer(playerid, textveiculo[vehicleid]);
	if(Taxi[playerid][0] == 1) {
		SendClientMessage(playerid, cor_azul,"Taximetro parado");
		SendClientMessage(Taxi[playerid][1], cor_vermelho,"Seu cliente foi deixado aqui!");
		PararTaximetro(playerid);
	}
	else if(MTaxi[playerid][0] == 1) {
		SendClientMessage(playerid, cor_azul,"MotoTaximetro parado");
		SendClientMessage(Taxi[playerid][1], cor_vermelho,"Seu cliente foi deixado aqui!");
		PararMTaximetro(playerid);
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	new checkpointid = CPS_GetPlayerCheckpoint(playerid);

	if(checkpointid == c_profs) ShowMenuForPlayer(profs, playerid);
	else if(checkpointid == c_condominio1) {
			SendClientMessage(playerid, cor_verde,"::::...:Condominio Sol Nascente:...::::");
			SendClientMessage(playerid, cor_vermelho,"/cinfo - Ver informações do condominio");
			GameTextForPlayer(playerid, "~r~Co~b~nd~g~om~y~in~p~io ~y~Sol Nascente", 6000, 1);
			if(Morador[playerid] == 1) {
			SendClientMessage(playerid, cor_verde,"/cabrir - Abrir o portão do condominio");
		}
	} else if(checkpointid == c_condominio2) {
			SendClientMessage(playerid, cor_verde,"::::...:Condominio Sol Nascente:...::::");
			SendClientMessage(playerid, cor_vermelho,"/cinfo - Ver informações do condominio");
			GameTextForPlayer(playerid, "~r~Co~b~nd~g~om~y~in~p~io ~y~Sol Nascente", 6000, 1);
			if(Morador[playerid] == 1) {
			SendClientMessage(playerid, cor_verde,"/cabrir - Abrir o portão do condominio");
			}
	} else if(checkpointid == banco) {
		SendClientMessage(playerid, cor_azul,"::::...:Banco Dioguitos:...::::");
		SendClientMessage(playerid, cor_verde,"/saldo | /depositar [quantia] | /sacar [quantia]");
  	  	GameTextForPlayer(playerid, "~r~B~b~a~g~n~y~c~p~o", 6000, 1);
	} else if(checkpointid == c_hotel) {
		SendClientMessage(playerid, cor_azul,"::::...:Hotel Dioguitos:...::::");
		SendClientMessage(playerid, cor_verde,"/hospedar - Hospedar no hotel");
		GameTextForPlayer(playerid, "~r~H~b~o~g~t~y~e~l~l", 6000, 1);
	} else if(checkpointid == c_posto1) {
		SendClientMessage(playerid, cor_azul,"::::...:Posto Dioguitos:...::::");
		SendClientMessage(playerid, cor_verde,"/abastecer [quantia] - Abastecer o veiculo");
		GameTextForPlayer(playerid, "~r~P~b~o~g~s~y~t~l~o", 6000, 1);
	} else if(checkpointid == c_posto2) {
		SendClientMessage(playerid, cor_azul,"::::...:Posto Dioguitos:...::::");
		SendClientMessage(playerid, cor_verde,"/abastecer [quantia] - Abastecer o veiculo");
		GameTextForPlayer(playerid, "~r~P~b~o~g~s~y~t~l~o", 6000, 1);
	}
	
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
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
 new Menu:current;
 current = GetPlayerMenu(playerid);
 if(current == profs) {
 switch(row) {
            case 0: SetarProf(0, playerid);
            case 1: SetarProf(1, playerid);
			case 2: SetarProf(13, playerid);
			case 3: SetarProf(14, playerid);
			case 4: SetarProf(15, playerid);
			case 5: SetarProf(17, playerid);
			case 6: SetarProf(18, playerid);
			case 7: SetarProf(2, playerid);
			case 8: SetarProf(3, playerid);
			case 9: SetarProf(4, playerid);
			case 10: SetarProf(11, playerid);
			case 11: ShowMenuForPlayer(profs2, playerid);
            }
        }
  if(current == profs2) {
  switch(row) {
  case 0: SetarProf(5, playerid);
  case 1: SetarProf(6, playerid);
  case 2: SetarProf(16, playerid);
  case 3: SetarProf(12, playerid);
  case 4: SetarProf(7, playerid);
  case 5: SetarProf(8, playerid);
  case 6: SetarProf(9, playerid);
  case 7: SetarProf(10, playerid);
  case 8: SetarProf(19, playerid);
  }
  }
    return 1;
}


stock SetarProf(profid, playerid)
{
	if(profid == 0) {
	 	SendClientMessage(playerid, cor_verde,"Servidor: Você nao ira querer ser Desempregado ira?");
	} else if(profid == 1) {
     	Profissao[playerid] = 1;
	 	SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Taxista");
		SpawnPlayer(playerid);
	} else if(profid == 2) {
     	Profissao[playerid] = 2;
	 	SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar PizzaBoy");
		SpawnPlayer(playerid);
	} else if(profid == 3 && Level[playerid] > 1) {
     	Profissao[playerid] = 3;
	 	SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Traficante");
		SpawnPlayer(playerid);
	} else if(profid == 4 && Level[playerid] > 1) {
 		Profissao[playerid] = 4;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Ladrao");
		SpawnPlayer(playerid);
	} else if(profid == 5 && Level[playerid] > 2) {
 		Profissao[playerid] = 5;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Rachador");
		SpawnPlayer(playerid);
	} else if(profid == 6 && Level[playerid] > 2) {
	    Profissao[playerid] = 6;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Estudante");
		SpawnPlayer(playerid);
	} else if(profid == 7 && Level[playerid] > 3) {
	    Profissao[playerid] = 7;
 		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Policial");
		SpawnPlayer(playerid);
	} else if(profid == 8 && Level[playerid] > 3) {
	    Profissao[playerid] = 8;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Bope");
		SpawnPlayer(playerid);
	} else if(profid == 9 && Level[playerid] > 3) {
	    Profissao[playerid] = 9;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Juiz");
		SpawnPlayer(playerid);
	} else if(profid == 10 && Level[playerid] > 3) {
	    Profissao[playerid] = 10;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Vendedor de Carro");
		SpawnPlayer(playerid);
	} else if(profid == 11 && Level[playerid] > 1) {
 		Profissao[playerid] = 11;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Pescador");
		SpawnPlayer(playerid);
	} else if(profid == 12 && Level[playerid] > 2) {
 		Profissao[playerid] = 12;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar agente do Ibama");
		SpawnPlayer(playerid);
	} else if(profid == 13) {
 		Profissao[playerid] = 13;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar MotoTaxista");
		SpawnPlayer(playerid);
	} else if(profid == 14) {
 		Profissao[playerid] = 14;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Motorista Particular");
		SpawnPlayer(playerid);
	} else if(profid == 15) {
 		Profissao[playerid] = 15;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Assassino");
		SpawnPlayer(playerid);
	} else if(profid == 16 && Level[playerid] > 2) {
 		Profissao[playerid] = 16;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Jornalista");
		SpawnPlayer(playerid);
	} else if(profid == 17) {
 		Profissao[playerid] = 17;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Segurança");
		SpawnPlayer(playerid);
	} else if(profid == 18) {
 		Profissao[playerid] = 18;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Mecanico");
		SpawnPlayer(playerid);
    } else if(profid == 19 && Level[playerid] > 3) {
 		Profissao[playerid] = 19;
		SendClientMessage(playerid, cor_verde,"Servidor: Você acaba de virar Corretor! Você tera aceso a ilha!");
		Morador[playerid] = 1;
		SpawnPlayer(playerid);
	} else SendClientMessage(playerid, cor_verde,"Servidor: Você não tem experiencia suficiente!");
	return 1;
}

public salario() {
	for(new i=0; i<MAX_PLAYERS; i++) {
		if(Tempo == 0) {
			if(Profissao[i] == desempregado) {
				SendClientMessage(i, cor_azul,"Servidor: Seu fundo desemprego foi depositado - $100");
				AumentarGranaBanco(i, 100);
				return 1;
			} else if(Profissao[i] == taxista) {
				SendClientMessage(i, cor_azul,"Servidor: Seu salario foi depositado - $1000");
				AumentarGranaBanco(i, 1000);
				return 1;
			} else if(Profissao[i] == pizzaboy) {
				SendClientMessage(i, cor_azul,"Servidor: Seu salario foi depositado - $800");
                AumentarGranaBanco(i, 800);
				return 1;
			} else if(Profissao[i] == traficante) {
				SendClientMessage(i, cor_azul,"Servidor: Seus amigos do trafico te deram sua parte - $500");
				AumentarGranaBanco(i, 500);
				return 1;
			} else if(Profissao[i] == ladrao) {
				SendClientMessage(i, cor_azul,"Servidor: Seus amigos ladroes te derem sua parte do Roubo - $700");
				AumentarGranaBanco(i, 700);
				return 1;
			} else if(Profissao[i] == rachador) {
				SendClientMessage(i, cor_azul,"Servidor: Seus parceiros de sua gang de racha te deram sua parte - $1000");
				AumentarGranaBanco(i, 1000);
				return 1;
			} else if(Profissao[i] == estudante) {
				SendClientMessage(i, cor_azul,"Servidor: Sua mesada ta dada! $1000");
				AumentarGranaBanco(i, 1000);
				return 1;
			} else if(Profissao[i] == policial) {
				SendClientMessage(i, cor_azul,"Servidor: Seu salario foi depositado - $1500");
				AumentarGranaBanco(i, 1500);
				return 1;
			} else if(Profissao[i] == bope) {
				SendClientMessage(i, cor_azul,"Servidor: Seu salario foi depositado - $3000");
				AumentarGranaBanco(i, 3000);
				return 1;
			} else if(Profissao[i] == juiz) {
				SendClientMessage(i, cor_azul,"Servidor: Seu salario foi depositado - $3500");
				AumentarGranaBanco(i, 3500);
				return 1;
			} else if(Profissao[i] == vende_carro) {
				SendClientMessage(i, cor_azul,"Servidor: Seu salario foi depositado - $2500");
				AumentarGranaBanco(i, 2500);
				return 1;
			} else if(Profissao[i] == ibama) {
				SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $2700");
				AumentarGranaBanco(i, 2700);
				return 1;
			} else if(Profissao[i] == jornalista) {
                SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $2000");
				AumentarGranaBanco(i, 2000);
			} else if(Profissao[i] == mecanico) {
                SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $1000");
				AumentarGranaBanco(i, 1000);
				return 1;
			} else if(Profissao[i] == segurança) {
                SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $1000");
				AumentarGranaBanco(i, 1000);
			} else if(Profissao[i] == assasino) {
			    SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $900");
				AumentarGranaBanco(i, 900);
			} else if(Profissao[i] == motorista) {
			    SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $1000");
				AumentarGranaBanco(i, 1000);
			} else if(Profissao[i] == mototaxista) {
                SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $1000");
				AumentarGranaBanco(i, 1000);
				return 1;
			} else if(Profissao[i] == pescador) {
			    SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $800");
				AumentarGranaBanco(i, 800);
				return 1;
			} else if(Profissao[i] == vende_casa) {
			    SendClientMessage(i, cor_verde,"Servidor: Seu salario foi depositado - $2500");
				AumentarGranaBanco(i, 2500);
				return 1;
			}
		}
	}
	return 1;
}

public Loga(playerid)
{
  	GivePlayerMoney(playerid, dini_Int(PlayerName(playerid),"Grana"));
  	GranaBanco[playerid] = dini_Int(PlayerName(playerid),"Banco");
  	Level[playerid] = dini_Int(PlayerName(playerid),"Level");
  	Profissao[playerid] = dini_Int(PlayerName(playerid),"Profissao");
  	hotel[playerid] = dini_Int(PlayerName(playerid),"Hotel");
  	Morador[playerid] = dini_Int(PlayerName(playerid),"Morador");
   	SendClientMessage(playerid, cor_azul,"Logado!");
   	Xp[playerid] = dini_Int(PlayerName(playerid),"Xp");
   	SpawnPlayer(playerid);
   	PlayerLogado[playerid] = 1;
	return 1;
}

public PlayerNoPonto(Float:radi, playerid, Float:x, Float:y, Float:z)
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

public GastandoGasolina()
{
	for(new i=0;i<MAX_PLAYERS;i++) {
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i)) {
			Gas[GetPlayerVehicleID(i)]--;
			if(Gas[GetPlayerVehicleID(i)] <= 0) {
				Gas[GetPlayerVehicleID(i)] = 0;
				SendClientMessage(i, cor_verde, "Acabou a gasolina do seu veículo, por favor vá até o posto mais próximo e abasteça-o!");
				SendClientMessage(i, cor_verde, "Digite /sair para sair do veículo");
				TogglePlayerControllable(i,0);
			}
		}
	}
}

public TextGasolina()
{
    new string[256];
    for(new i; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerInAnyVehicle(i) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
        {
            format(string, sizeof string, "~g~Ga~r~sol~b~ina: ~r~%d~n~~r~Do~y~no: ~b~%s",Gas[GetPlayerVehicleID( i)], Dono[GetPlayerVehicleID( i)]);
            TextDrawSetString(textveiculo[GetPlayerVehicleID(i)], string);
        }
    }
}

stock AumentarGranaBanco(playerid,amount) GranaBanco[playerid] += amount;
stock RetirarGranaBanco(playerid,amount)
{
	GranaBanco[playerid] -= amount;
	GivePlayerMoney(playerid, amount);
}

stock PlayerName(playerid)
{
	new nome[MAX_PLAYER_NAME];
	GetPlayerName(playerid, nome, MAX_PLAYER_NAME);
	return nome;
}

public Pergunta(playerid, perguntaid)
{
    if(perguntaid == 1) {
        actquest[playerid] = 1; //questão atual = questão 1
        SendClientMessage(playerid, 0xFFF000AA, "Quanto e 3+4x5?");
        SendClientMessage(playerid, 0xFFFFFFAA, "Escreva:");
    } else if(perguntaid == 2) {
        actquest[playerid] = 2; //questão 2...
        SendClientMessage(playerid, 0xFFF000AA, "Quanto e 5x5-5+5?");
        SendClientMessage(playerid, 0xFFFFFFAA, "Escreva:");
    } else if(perguntaid == 3) {
        actquest[playerid] = 3; //...
        SendClientMessage(playerid, 0xFFF000AA, "Quanto e 10+10-20+10-10?");
        SendClientMessage(playerid, 0xFFFFFFAA, "Escreva:");
    }
}

stock Distancia(playerid,playerid2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2,Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetPlayerPos(playerid2,x2,y2,z2);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(tmpdis);
}

public AumentarLevel()
{
	new string[256];
	for(new i=0; i<MAX_PLAYERS; i++) {
	if(Level[i] < 4) {
	if(Xp[i] == 10) {
	    Xp[i] = 0;
		Level[i]++;
		format(string, sizeof(string), "Você acaba de ganhar 1 level! Agora seu level e de: %d.", Level[i]);
		SendClientMessage(i, cor_verde, string);
	}
	}
	}
	return 1;
}

public Hotel() {
for(new i = 0;i<MAX_PLAYERS;i++) {
if(hotel[i] == 1) {
SendClientMessage(i, cor_vermelho,"Você acaba de pagar mais um dia de hospedagem no hotel! O dinheiro foi retirado do banco");
GranaBanco[i] -= 500;
}
}
return 1;
}

public Taximetro(playerid) {
if(Taxi[playerid][0] == 1) {
if(GetPlayerMoney(playerid) <= 20) {
SendClientMessage(playerid, cor_azul,"Seu dinheiro acabou! Tchau!");
RemovePlayerFromVehicle(playerid);
PararTaximetro(playerid);
}
else {
GivePlayerMoney(Taxi[playerid][1], 20);
GivePlayerMoney(playerid, - 20);
//PararTaximetro(playerid);
}
}
return 1;
}

public MTaximetro(playerid) {
if(MTaxi[playerid][0] == 1) {
if(GetPlayerMoney(playerid) <= 20) {
SendClientMessage(playerid, cor_azul,"Seu dinheiro acabou! Tchau!");
RemovePlayerFromVehicle(playerid);
PararMTaximetro(playerid);
}
else {
GivePlayerMoney(MTaxi[playerid][1], 20);
GivePlayerMoney(playerid, - 20);
//PararTaximetro(playerid);
}
}
return 1;
}

public PararTaximetro(playerid) {
if(Taxi[playerid][0] == 1) { Taxi[playerid][0] = 0; Taxi[playerid][1] = 0; }
return 1;
}

public PararMTaximetro(playerid) {
if(MTaxi[playerid][0] == 1) { MTaxi[playerid][0] = 0; MTaxi[playerid][1] = 0; }
return 1;
}

public FecharCondominio() {
MoveObject(cportao1, -3136.843,467.304,10.918,5.0);
MoveObject(cportao2, -3136.790,472.840,10.918,5.0);
KillTimer(TimerCondominio);
return 1;
}

stock Carro_Exists(carid) {
    new string[256];
	format(string, sizeof(string), "veiculo_%d.txt", carid);
	if(dini_Exists(string)) return 1;
	else return 0;
}

stock Casa_Exists(pickupid) {
    new string[256];
	format(string, sizeof(string), "pickup_%d.txt", pickupid);
	if(dini_Exists(string)) return 1;
	else return 0;
}

stock PlayerInArea(playerid,Float:max_x,Float:min_x,Float:max_y,Float:min_y)
{
	new Float:X;
	new Float:Y;
	new Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(X <= max_x && X >= min_x && Y <= max_y && Y >= min_y) return 1;
	return 0;
}
public minrand(min, max)
{
	return random(max - min) + min;
}

public PescarTimer(playerid) {
if(isca[playerid] > 0) {
if(PlayerInArea(playerid, -2750.05, -2923.87, 1521.128, 1390.945)) {
if(isca[playerid] == 1) {
		new random1 = random(sizeof(Peixes));
		new random2 = minrand(5, 14);
		new string[256];
		format(string, sizeof(string), "Você pegou um: %s de %d quilos", Peixes[random1][0], random2);
		peixe[playerid] = random1;
		quilos[playerid] = random2;
		SendClientMessage(playerid, cor_azul, string);
		isca[playerid] = 0;
		KillTimer(PT);
}
else if(isca[playerid] == 2) {
		new random1 = random(sizeof(Peixes));
		new random2 = minrand(8, 20);
		new string[256];
		format(string, sizeof(string), "Você pegou um: %s de %d quilos", Peixes[random1][0], random2);
		peixe[playerid] = random1;
		quilos[playerid] = random2;
		SendClientMessage(playerid, cor_azul, string);
		isca[playerid] = 0;
		KillTimer(PT);
}
else if(isca[playerid] == 3) {
		new random1 = random(sizeof(Peixes));
		new random2 = minrand(8, 16);
		new string[256];
		format(string, sizeof(string), "Você pegou um: %s de %d quilos", Peixes[random1][0], random2);
		peixe[playerid] = random1;
		quilos[playerid] = random2;
		SendClientMessage(playerid, cor_azul, string);
		isca[playerid] = 0;
		KillTimer(PT);
}
else if(isca[playerid] == 4) {
		new random1 = random(sizeof(Peixes));
		new random2 = minrand(10, 28);
		new string[256];
		format(string, sizeof(string), "Você pegou um: %s de %d quilos", Peixes[random1][0], random2);
		peixe[playerid] = random1;
		quilos[playerid] = random2;
		SendClientMessage(playerid, cor_azul, string);
		isca[playerid] = 0;
		KillTimer(PT);
}
}
}
return 1;
}

stock SpawnArmas(playerid) {
if(Profissao[playerid] == policial) {
GivePlayerWeapon(playerid, 22, 1000);
GivePlayerWeapon(playerid, 25, 200);
GivePlayerWeapon(playerid, 29, 1000);
}
else if(Profissao[playerid] == bope) {
GivePlayerWeapon(playerid, 25, 1000);
GivePlayerWeapon(playerid, 29, 1000);
GivePlayerWeapon(playerid, 31, 1000);
}
else if(Profissao[playerid] == traficante) {
GivePlayerWeapon(playerid, 30, 1000);
GivePlayerWeapon(playerid, 34, 1000);
}
else if(Profissao[playerid] == ladrao) {
GivePlayerWeapon(playerid, 24, 1000);
GivePlayerWeapon(playerid, 32, 1000);
}
else if(Profissao[playerid] == segurança) {
GivePlayerWeapon(playerid, 23, 1000);
GivePlayerWeapon(playerid, 29, 1000);
}
else if(Profissao[playerid] == juiz) {
GivePlayerWeapon(playerid, 33, 1000);
}
else if(Profissao[playerid] == assasino) {
GivePlayerWeapon(playerid, 30, 1000);
GivePlayerWeapon(playerid, 27, 1000);
}
return 1;
}

public UparTempo() {
if(Tempo < 24) {
Tempo++;
} else {
Tempo = 0;
}
SetWorldTime(Tempo);
return 1;
}

public ChecarTrab() {
for(new i = 0; i < MAX_PLAYERS; i++) {
if(Tempo == 6 && HorarioTrab[i] == 0 && Avisado[i] == 0) {
SendClientMessage(i, cor_verde,"Acaba de começar seu turno!");
Avisado[i]++;
HorarioTrab[i] = 1;
}
else if(Tempo == 18 && HorarioTrab[i] == 1 && Avisado[i] == 1) {
SendClientMessage(i, cor_verde,"Acaba de terminar seu turno!");
Avisado[i] = 0;
HorarioTrab[i] = 0;
}
}
return 1;
}
public FicarFome() {
for(new i = 0;i < MAX_PLAYERS;i++) {
Fome[i]++;
if(Fome[i] == 0) {
SendClientMessage(i, cor_verde,"Você esta ficando com fome! Va comer. No cluckin bell basta digitar /comer");
}
else if(Fome[i] == 1) {
SendClientMessage(i, cor_verde,"Va comer logo sua fome esta aumentando. No cluckin bell basta digitar /comer");
}
else if(Fome[i] == 2) {
SendClientMessage(i, cor_vermelho,"Para largar de ser burro e não ir comer, vai perder vida e continuara com fome!");
SetPlayerHealth(i, 80);
}
}
return 1;
}

public FicarSono() {
for(new i = 0;i < MAX_PLAYERS;i++) {
Sono[i]++;
if(Sono[i] == 0) {
SendClientMessage(i, cor_verde,"Você esta ficando com sono! Va para alguma casa e digite /dormir");
}
else if(Sono[i] == 1) {
SendClientMessage(i, cor_verde,"Você esta quase dormindo em pe! Va para alguma casa e digite /dormir");
}
else if(Fome[i] == 2) {
SendClientMessage(i, cor_vermelho,"Você acaba de dormir aonde esta. Daqui a 2 minutos reais você acorda!");
TogglePlayerControllable(i, 0);
TimerP[i] = SetTimerEx("PararA", 120000, 1, "ii", i, 2);
}
}
return 1;
}

public FicarHigiene() {
for(new i = 0;i < MAX_PLAYERS;i++) {
Higiene[i]++;
if(Higiene[i] == 0) {
SendClientMessage(i, cor_verde,"Você esta ficando sem higiene. Va em um restaurante/lanchonete e digite /mijar");
}
else if(Higiene[i] == 1) {
SendClientMessage(i, cor_verde,"Sua higiene esta ficando ruim! Va em um restaurante/lanchonete e digite /mijar");
}
else if(Higiene[i] == 2) {
SendClientMessage(i, cor_vermelho,"Para largar de ser burro e não ir mijar, vai ficar 2 minutos(reais) no Hospital e perdera -$1000 pelo tratamento!");
//SetPlayerPos(i, X, Y, Z);
}
}
return 1;
}

public PararA(playerid, id) {
if(id == 1) {
if(Fome[playerid] > 0) {
SendClientMessage(playerid, cor_verde,"Sua fome acaba de passar!");
Fome[playerid] = 0;
}
}
else if(id == 2) {
if(Sono[playerid] > 0) {
SendClientMessage(playerid, cor_verde,"Seu sono acaba de passar!");
TogglePlayerControllable(playerid, 1);
Sono[playerid] = 0;
}
}
else if(id == 3) {
if(Higiene[playerid] > 0) {
SendClientMessage(playerid, cor_verde,"Sua higiene acaba de aumentar!");
Higiene[playerid] = 0;
}
}
return 1;
}

public TextRelogio()
{
new string[256];
for(new i = 0;i<MAX_PLAYERS;i++) {
			TextDrawHideForPlayer(i, Relogio);
            format(string, sizeof string, "~r~Ho~b~rar~g~io: ~r~%d", Tempo);
            TextDrawSetString(Relogio, string);
            TextDrawShowForPlayer(i, Relogio);
        }
return 1;
}


stock AdicionarXP(playerid, quantia) if(Xp[playerid] < 10) Xp[playerid]+=quantia;

