#include <a_players>
#include <a_samp>
#include <dutils>
#include <dudb>

#define COLOR_AZUL               0x0517FEAA
#define COLOR_AZUL2              0x0C95E4AA
#define COLOR_AZULCLARO          0x38EEF0AA
#define COLOR_VERMELHO           0xF60909AA
#define COLOR_VERDECLARO         0x50fC7DAA
#define COLOR_VERDE              0x1C8414AA
#define COLOR_VERDEESCURO        0x016015AA
#define COLOR_VERDEAQUA          0x20B2AAAA
#define COLOR_MARROM             0x847814AA
#define COLOR_AMARELOCLARO       0xFEEE66AA
#define COLOR_AMARELO            0xF0ED11AA
#define COLOR_GREEN              0x33AA33AA
#define COLOR_RED                0xAA3333AA
#define COLOR_YELLOW             0xFFFF00AA
#define COLOR_WHITE              0xFFFFFFAA
#define COLOR_GRAY               0xAFAFAFAA
#define COLOR_DESEMPREGADO       0x666666AA
#define COLOR_INSTRUTOR          0xFCFF9DAA
#define COLOR_TAXISTA            0x9DFFB6AA
#define COLOR_COP_CIVIL          0x0000FFAA
#define COLOR_COP_ELITE          0x00C7FFAA
#define COLOR_ASSASSINO          0x52A0A5AA
#define COLOR_VENDEDOR           0x83EBFEAA
#define COLOR_COP_RODOVIARIO     0x62A9F8AA
#define COLOR_SEGURANÇA          0x288EB4AA
#define COLOR_BARMAN             0xB8860BAA
#define COLOR_CORRETOR           0x0D581FAA
#define COLOR_PESCADOR           0xB3FCF9AA
#define COLOR_MOTORISTA          0x61BF96AA
#define COLOR_MOTORISTA_ONIBUS   0xAABF61AA
#define COLOR_JUIZ               0x7FFF00AA
#define COLOR_AGRICULTOR         0xBFF017AA
#define COLOR_LADRAO_DE_CARROS   0xE9BB62AA
#define COLOR_MECANICO           0x18585EAA
#define COLOR_VENDEDOR_DE_ARMAS  0xA6F8F5AA
#define COLOR_FRENTISTA          0x2EFACCAA
#define COLOR_IBAMA              0x20B2AAAA
#define COLOR_TRAFICANTE         0x61EB9FAA
#define COLOR_NARCOTICOS         0x4B6791AA
#define COLOR_ASSALTANTE         0xA60801AA
#define COLOR_EXERCITO           0x8AFD9DAA
#define COLOR_RECEITA_FEDERAL    0x846625AA
#define COLOR_CONTRABANDISTA     0x20EB11AA
#define COLOR_MEDICO             0x7FB7DFAA
#define COLOR_TRANSPORTE_VALORES 0x55d2DAAA
#define COLOR_SEGURADOR          0x445B76AA
#define COLOR_ADVOGADO           0x5CFFFDAA
#define COLOR_PIZZA_BOY          0xCD9F00AA
#define COLOR_PROSTITUTA         0xEE12F6AA
#define COLOR_LOCADOR_DE_CARROS  0x8EFF7CAA
#define COLOR_JORNALISTA         0xF0E68CAA
#define COLOR_XERIFE             0x6A641EAA

#define DESEMPREGADO          1///feito
#define TAXISTA               2///feito
#define VENDEDOR_DE_CARROS    3///feito
#define CORRETOR              4///feito
#define ASSASSINO             5///feito
#define BARMAN                6///feito
#define JUIZ                  7///feito
#define SEGURANÇA             8///feito
#define MOTORISTA_PARTICULAR  9///feito
#define COP_CIVIL             10//feito
#define COP_RODOVIARIO        11//feito
#define COP_ELITE             12//feito
#define EXERCITO              13//feito
#define PESCADOR              14//feito
#define INSTRUTOR_DE_DIRECAO  15//feito
#define VENDEDOR_DE_ARMAS     16//feito
#define MOTORISTA_DE_ONIBUS   17//feito
#define AGRICULTOR            18//feito
#define LADRAO_DE_CARROS      19//feito
#define FRENTISTA             20//feito
#define IBAMA                 21//feito
#define TRAFICANTE            22//feito
#define NARCOTICOS            23//feito
#define ASSALTANTE            24//feito
#define MECANICO              25//feito
#define RECEITA_FEDERAL       26//feito
#define CONTRABANDISTA        27//feito 
#define MEDICO                28//feito
#define TRANSPORTE_VALORES    29//feito
#define SEGURADOR             30//feito
#define ADVOGADO              31//feito
#define PIZZA_BOY             32//feito
#define PROSTITUTA            33//feito
#define LOCADOR_DE_CARROS     34//feito
#define JORNALISTA            35//feito
#define XERIFE                36//feito

//Checkpoints
#define CHECKPOINT_NONE             0
#define CHECKPOINT_CONTRABANDO      1
#define CHECKPOINT_CONTRABANDO2     2
#define CHECKPOINT_CONTRABANDO3     3
#define CHECKPOINT_CONTRABANDO4     4
#define CHECKPOINT_CONTRABANDOCARRO 5

#define UDB GETGASOLINE
#define CallCost 1
#define MAX_PROFS    				36

#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

new ProfissaoName[][] = {
"Invalida",
"Desempregado",
"Taxista",
"Vendedor de Carros",
"Corretor de Imoveis",
"Assassino",
"Barman",
"Juiz",
"Seguranca",
"Motorista Particular",
"Policial Civil",
"Policial Rodoviario",
"Policial de Elite",
"Exercito",
"Pescador",
"Instrutor de Direcao",
"Vendedor de Armas",
"Motorista de Onibus",
"Agricultor",
"Ladrao de Carros",
"Frentista",
"IBAMA",
"Traficante",
"Narcotico",
"Assaltante",
"Mecanico",
"Receita Federal",
"Contrabandista",
"Medico",
"Transporte de Valores",
"Segurador",
"Advogado",
"Entregador de Pizza",
"Prostituta",
"Locador de Carros",
"Jornalista",
"Xerife"
};
new SkinProf[] = {
1,
1,
234,
147,
187,
101,
171,
59,
165,
255,
280,
288,
285,
287,
35,
250,
179,
124,
160,
22,
184,
98,
28,
126,
107,
50,
165,
121,
70,
71,
126,
147,
155,
246,
187,
186,
34
};
new ResultadoSexo[][] = {"Péssimo","Razoável","Médio","Bom","Ótimo"};
new ValoresSexo[] = {200,350,500,700,1000};
new ProducaoName[][] = {"Inválida","Milho","Mandioca","Tomate","Feijão"};
new PizzaSabor[][] = {"4 queijos","Calabresa","Crocante","Frango com Catupiry","Strogonoff de Frango","Portuguesa"};
new gPlayerCheckpointStatus[MAX_PLAYERS];
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS] = 0;
new AreaHotel[MAX_PLAYERS] = 0;
new AreaDesmanche[MAX_PLAYERS] = 0;
new AreaPesca[MAX_PLAYERS] = 0;
new AreaFazenda[MAX_PLAYERS] = 0;
new AreaMercado[MAX_PLAYERS] = 0;
new AreaTrafico[MAX_PLAYERS] = 0;
new AreaHospital[MAX_PLAYERS] = 0;
new AreaPizzaria[MAX_PLAYERS] = 0;
new AreaForte[MAX_PLAYERS] = 0;
new AreaLocadora[MAX_PLAYERS] = 0;
new assalto[MAX_PLAYERS] = 0;
new roubo[MAX_PLAYERS] = 0;
new isca[MAX_PLAYERS] = 0;
new Pescando[MAX_PLAYERS] = 0;
new Petrol[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new QtPeixe[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new qtmilho[MAX_PLAYERS] = 0;
new qtmandioca[MAX_PLAYERS] = 0;
new qttomate[MAX_PLAYERS] = 0;
new qtfeijao[MAX_PLAYERS] = 0;
new milho[MAX_PLAYERS] = 0;
new mandioca[MAX_PLAYERS] = 0;
new tomate[MAX_PLAYERS] = 0;
new feijao[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new worldTime;
new worldTime2;
new PrevworldTime;
new Bebida[MAX_PLAYERS] = 0;
new desmanche[MAX_PLAYERS] = 0;
new EspacoPlantacao;
new piracema;
new bagulho[MAX_PLAYERS] = 0;
new maconha[MAX_PLAYERS] = 0;
new cocaina[MAX_PLAYERS] = 0;
new heroina[MAX_PLAYERS] = 0;
new crack[MAX_PLAYERS] = 0;
new kitmedico[MAX_PLAYERS] = 0;
new pessoascuradas[MAX_PLAYERS] = 0;
new pizzas[MAX_VEHICLES] = 0;
new contrabando[MAX_PLAYERS] = 0;
new revisao[MAX_PLAYERS][2];
new seguro[MAX_PLAYERS] = 0;
new bolsavalores[MAX_VEHICLES] = 0;
new modelocontrabando[MAX_PLAYERS];
new PO[MAX_PLAYERS] = 0;
new Sexo[MAX_PLAYERS] = 0;
new SexoEsquentando[MAX_PLAYERS] = 0;
new autorizacao[MAX_PLAYERS] = 0;
new carroauto1;
new carroauto2;
new carroauto3;
new carroauto4;
new carroauto5;
new carroaluguel1;
new carroaluguel2;
new carroaluguel3;
new carroaluguel4;
new carroaluguel5;
new carrolocado[MAX_PLAYERS] = 0;
new aluguel[MAX_PLAYERS] = 0;
new Rastreador[MAX_PLAYERS];
new Rastreamento[MAX_PLAYERS] = 0;
new FazendoSexo[MAX_PLAYERS];
new TimeSexo[MAX_PLAYERS];
new aposta[MAX_PLAYERS] = 0;
new numeroapostado[MAX_PLAYERS];
new moneyloteria;
new Calling[MAX_PLAYERS];
new Answered[MAX_PLAYERS];
new Callerid[MAX_PLAYERS];

forward PhoneCut();
forward Megasena();
forward MoneyGrubScoreUpdate();
forward MoneyGrubScoreUpdate();
forward TempoPrisao();
forward Taxi();
forward FimPesca(playerid);
forward CheckFuel();
forward LogarPlayer(playerid);
forward Bancos();
forward MTaxi();
forward UpdateSpeed();
forward GetDistanceBetweenPlayers(playerid, playerid2);
forward Tempo();
forward Speed();
forward TimeFunction(playerid);
forward setcar(carid, X, Y, Z, ang, cor1, cor2);
forward fimplantacao(playerid,producaoid);
forward salariopescador();
forward Assalto(playerid);
forward FimKitMedico();
forward FimSexo(playerid,plid);
forward FimAluguel(plid,veh);
forward SetCar(modelid,Float:X,Float:Y,Float:Z,Float:ang,Cor1,Cor2);
forward Dando(playerid,plid);
forward Batendo(playerid,plid);
forward Chupando(playerid,plid);

static VEH_PIZZA =   		448;
static VEH_CARROFORTE = 	428;
static VEH_INFERNUS =       411;
static VEH_MONSTER_TRUCK =  444;
static VEH_MRWHOOPE =   	423;
static VEH_SABRE = 			475;
static VEH_MANANA = 		410;


main()
{
	print("\n---------------------------------"); 
	print("	Destroyers Team");
	print("_________________________________");
	print(" ");
	print(" 	 DT Mega® RPG");
	print("_________________________________");
	print("  	  FEITO POR:");
	print(" ");
	print("   	 Rafael        Guilherme");
	print(" ");
	print(" Osorkon      	  Texugo");
	print(" ");
	print("---------------------------------\n");
	worldTime = 12;
	worldTime2 = 12;
	PrevworldTime = 20;
}



public OnGameModeInit()
{
	print("GameModeInit()");
	SetGameModeText("[DT]Mega® RPG");
	
	AddPlayerClass(270, -1958.5107, 293.6747, 35.4688, 269.1425, 0, 0, 0, 0, 0, 0);
	
	//Acessórios e itens adicionais
	CreateObject(13681,-229.177,1220.170,23.401,0.0,0.0,0.0);
	CreateObject(982,-253.537,1224.253,19.426,0.0,0.0,89.381);
	CreateObject(984,-266.105,1217.965,19.379,0.0,0.0,1.719);
	CreateObject(984,-259.453,1211.602,19.379,0.0,0.0,90.241);
	
	//Carros de San Fierro
 	AddStaticVehicle(596,-1588.2479,748.0393,-5.4903,359.9998,0,1);
	AddStaticVehicle(523,-1584.0217,749.4910,-5.6655,180.9966,0,0);
	AddStaticVehicle(523,-1579.8461,749.0732,-5.6571,181.8757,0,0);
	AddStaticVehicle(596,-1574.2565,742.4983,-5.5206,88.9996,0,1);
	AddStaticVehicle(523,-1573.5985,734.6492,-5.6689,90.0025,0,0);
	AddStaticVehicle(497,-1679.5951,706.1432,30.7954,90.5114,0,1);
	AddStaticVehicle(437,-1988.5007,162.0946,27.6508,0.0000,1,1);
	AddStaticVehicle(437,-1988.3359,131.3477,27.6943,0.0000,1,1);
	AddStaticVehicle(410,-2089.6643,-83.5934,34.7976,359.9729,6,6);
	AddStaticVehicle(410,-2081.2825,-83.4888,34.8086,4.0901,6,6);
	AddStaticVehicle(461,-2022.3977,-124.3720,34.7832,179.9717,6,6);
	AddStaticVehicle(487,-2032.2460,-155.6209,35.4656,0.0060,1,6);
	AddStaticVehicle(475,-2088.8313,-156.0123,35.0983,359.9812,6,6);
	AddStaticVehicle(475,-2092.4036,-145.2734,35.0986,0.0400,6,6);
	AddStaticVehicle(475,-2092.3503,-132.4997,35.0966,0.4676,6,6);
	AddStaticVehicle(487,-1829.1174,1300.2819,59.8817,204.0558,54,29);
	AddStaticVehicle(453,-1556.1755,1260.8345,-0.5926,234.7669,69,69);
	AddStaticVehicle(453,-1565.1833,1259.7523,-0.5379,227.8785,69,69);
	AddStaticVehicle(453,-1578.2352,1260.0367,-0.0551,228.0564,69,69);
	AddStaticVehicle(493,-1474.4727,687.5856,-0.2037,268.8839,6,6);
	AddStaticVehicle(453,-1473.3943,703.5046,-0.4342,272.7462,6,6);
	AddStaticVehicle(420,-1703.0906,1003.9794,17.3778,91.1514,6,1);
	AddStaticVehicle(420,-1687.7856,999.6074,17.3444,270.7191,6,1);
	AddStaticVehicle(409,-1816.4678,1311.4034,50.2892,275.5558,1,1);
	AddStaticVehicle(409,-1829.7208,1289.6337,50.2512,110.5457,1,1);
	AddStaticVehicle(433,-1307.1633,456.9036,7.5909,89.9428,0,0);
	AddStaticVehicle(433,-1306.5189,463.9994,7.6436,89.6543,0,0);
	AddStaticVehicle(433,-1306.5568,460.6202,7.6451,90.4466,0,0);
	AddStaticVehicle(433,-1309.4952,444.8434,7.6132,55.0000,0,0);
	AddStaticVehicle(433,-1307.2222,447.7583,7.5937,54.9896,0,0);
	AddStaticVehicle(470,-1241.5155,445.2168,7.1593,326.9936,44,44);
	AddStaticVehicle(470,-1232.7764,451.6962,7.1680,89.9980,0,0);
	AddStaticVehicle(425,-1403.2001,465.2320,7.7642,181.0000,0,0);
	AddStaticVehicle(425,308.9300,1990.3328,18.2170,180.0703,0,0);
	AddStaticVehicle(425,309.5915,2056.1018,18.1976,180.0104,0,0);
	
	//Carros de Fort Carson
	AddStaticVehicle(567,-80.4373,1077.4640,19.6117,179.5710,1,1);
	AddStaticVehicle(412,-77.1418,1222.5354,19.5796,358.8337,2,1);
	AddStaticVehicle(596,-225.0779,998.6560,19.3142,2.3106,0,1);
	AddStaticVehicle(596,-209.8733,999.5723,19.3756,270.7586,0,1);
	AddStaticVehicle(599,-210.4915,986.6580,19.5906,87.8441,0,1);
	AddStaticVehicle(599,-210.0434,993.3052,19.7279,89.8870,0,1);
	AddStaticVehicle(599,-214.8009,973.6031,19.4819,92.0156,0,1);
	AddStaticVehicle(489,-374.0590,1154.8452,19.8850,86.2014,100,1);
	AddStaticVehicle(510,-218.9384,1172.9949,19.3474,291.9862,0,0);
	AddStaticVehicle(510,-218.2944,1174.4338,19.3486,286.8324,3,3);
	AddStaticVehicle(510,-218.2482,1171.1035,19.3501,316.7645,6,6);
	AddStaticVehicle(499,-152.4818,1176.8627,19.7294,184.3382,12,1);
	AddStaticVehicle(420,-134.8597,1180.5985,19.5232,273.3998,6,6);
	AddStaticVehicle(420,-135.1026,1184.0731,19.5231,268.8970,6,6);
	AddStaticVehicle(437,-130.4021,1229.8894,19.8755,184.8914,2,1);
	AddStaticVehicle(456,-199.6219,1223.3246,19.9157,180.9415,0,8);
	AddStaticVehicle(462,-178.5563,1217.7617,19.3375,92.8281,4,4);
	AddStaticVehicle(443,7.7952,1059.0006,20.3754,269.8468,1,1);
	AddStaticVehicle(401,65.1806,998.0392,13.9956,180.3281,7,3);
	AddStaticVehicle(418,-106.8180,1063.8470,19.7453,90.2199,15,64);
	AddStaticVehicle(442,-176.5741,1126.1774,19.5769,90.7020,0,0);
    AddStaticVehicle(471,-310.6489,1024.1553,19.2022,150.2392,10,10);
    AddStaticVehicle(471,-314.1741,1024.6633,19.2089,155.0163,6,6);
    AddStaticVehicle(471,-318.0301,1024.8778,19.2156,141.9574,0,0);
    AddStaticVehicle(423,-96.3848,1085.9668,19.7667,91.2898,0,0);
    AddStaticVehicle(434,-339.1708,1081.1589,19.7107,16.3921,0,0);
    AddStaticVehicle(445,-305.0594,1032.0474,19.4686,88.4814,0,0);
    AddStaticVehicle(448,170.8929,1181.7418,14.3551,241.0358,3,3); 
	AddStaticVehicle(448,171.8047,1183.0507,14.3540,247.2321,3,3); 
	AddStaticVehicle(448,172.6943,1184.4244,14.3569,244.4289,3,3);
	AddStaticVehicle(428,-300.8282,1779.8624,42.8125,92.0538,12,0);
	AddStaticVehicle(428,-301.1023,1770.0067,42.8119,270.6861,12,0);
	AddStaticVehicle(428,-302.0960,1748.5022,42.8112,90.1452,12,0);
	AddStaticVehicle(428,-291.8140,1756.6678,42.8141,89.3846,12,0);
	AddStaticVehicle(428,-290.6835,1772.8442,42.8234,268.5724,12,0);
	AddStaticVehicle(411,-88.3798,882.5449,20.9766,149.2907,34,65);
	AddStaticVehicle(410,1.0406,943.0172,19.4488,273.0623,24,23);
	AddStaticVehicle(416,-304.6993,1023.7617,19.7437,269.5943,1,3);
	AddStaticVehicle(416,-305.3705,1011.3724,19.7425,89.0105,1,3);
	carroauto1 = AddStaticVehicle(410,-137.0029,1123.9022,19.4086,88.3420,3,3);
	carroauto2 = AddStaticVehicle(410,-137.0355,1128.6265,19.4037,91.2861,3,3);
	carroauto3 = AddStaticVehicle(475,-140.8837,1116.4293,19.5536,357.2755,3,3);
	carroauto4 = AddStaticVehicle(475,-149.0067,1113.3732,19.5518,0.9276,3,3);
	carroauto5 = AddStaticVehicle(475,-149.2217,1125.1538,19.5472,1.4298,3,3);
	carroaluguel1 = AddStaticVehicle(540,-248.1281,1222.2054,19.6005,89.5964,108,108);
	carroaluguel2 = AddStaticVehicle(480,-247.5721,1216.5342,19.5157,88.9990,114,114);
	carroaluguel3 = AddStaticVehicle(475,-262.6372,1213.2477,19.5462,272.7813,115,115);
	carroaluguel4 = AddStaticVehicle(586,-257.9212,1222.4835,19.2624,177.6395,0,0);
	carroaluguel5 = AddStaticVehicle(445,-264.2545,1221.2758,19.6172,182.8826,1,1);
	
	//Carros de Las Barrancas
	AddStaticVehicle(415,-795.6938,1626.3790,26.8958,185.2669,17,4);
	AddStaticVehicle(461,-867.4276,1541.8319,22.3049,87.6780,1,1);
	AddStaticVehicle(505,-866.3201,1569.2344,25.1529,88.2992,0,19);
	AddStaticVehicle(463,-729.1073,1556.4276,40.2996,147.4360,0,0);
	AddStaticVehicle(463,-725.4941,1555.9203,40.6641,158.0459,1,1);
	AddStaticVehicle(471,-793.9705,1550.2295,26.5987,86.7596,1,1);
	AddStaticVehicle(471,-794.5192,1545.9934,26.5662,88.6711,3,3);
	AddStaticVehicle(429,-755.7521,1590.4005,26.6405,64.4886,1,1);
	AddStaticVehicle(437,-743.3484,1582.3411,27.0959,215.2393,3,1);
	AddStaticVehicle(437,-749.7622,1506.5632,25.6496,152.2277,1,1);
	AddStaticVehicle(451,-775.0135,1504.5797,24.1752,1.8507,1,1);
	AddStaticVehicle(400,-835.2917,1440.9758,14.1807,178.8303,0,2);
	
	moneyloteria = 2000;
	
	new File:temp;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	temp = fopen("rcars.ini", io_readwrite);
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
	fclose(temp);

	new File:temp2;
	new index2 = 0;
	new str[256];
	new Float:pX,Float:pY,Float:pZ;
	temp2 = fopen("pickups.rpg",io_readwrite);
	while(fread(temp2, str, sizeof(str), false)){
	    index2 = 0;
	    pX          = Float:floatstr(strtok(str, index2));
		pY          = Float:floatstr(strtok(str, index2));
		pZ          = Float:floatstr(strtok(str, index2));
		
		CreatePickup(1272,1,pX,pY,pZ);
	}
	fclose(temp2);
	SetTimer("Bancos", 1000, 1);
	SetTimer("FimKitMedico", 1000, 1);
	SetTimer("CheckFuel", 50000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("Tempo", 60000, 1);
	SetTimer("Previsao", 60000, 1);
	SetTimer("salariopescador", 60000, 1);
	SetTimer("Megasena", 600000, 1);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
 	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,172.6688,1218.0145,22.2666);
	SetPlayerFacingAngle(playerid, 177.2289);
	SetPlayerCameraPos(playerid,171.6219,1211.3766,21.4992);
	SetPlayerCameraLookAt(playerid,172.6688,1218.0145,22.2666);
	if(PLAYERLIST_authed[playerid] == 1){
		PLAYERLIST_authed[playerid] = 0;
	}
	return 1;
}

public OnGameModeExit()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			if (PLAYERLIST_authed[i] == 1) {
				udb_setAccState(PlayerName(i),GetPlayerMoney(i));
				new Float:vida;
				GetPlayerHealth(i, vida);
				udb_setHealth(PlayerName(i), vida);
				udb_setGasoline(PlayerName(i), Petrol[i]);
				printf("Dados de %s (ID: %d) salvos com sucesso\n",PlayerName(i),i);
			}
		}
	}
	print("Desativando Mega® RPG");
	return 1;
}

public OnPlayerConnect(playerid)
{
	new msg[256];
	format(msg,sizeof(msg), "%s entrou no servidor.",PlayerName(playerid));
	SendClientMessageToAll(0x83BFBFAA,msg);
	GameTextForPlayer(playerid, "~w~Bem vindo ao ~g~R~b~P~y~G~n~~b~Coders: ~y~Rafael, Texugo~n~e Guilherme",3000,0);
	SendClientMessage(playerid, COLOR_WHITE,	 		"Mega RPG Mode");
	SendClientMessage(playerid, COLOR_COP_ELITE, 		"Ajuda? /ajuda");
	SendClientMessage(playerid, COLOR_COP_ELITE, 		"Recém Chegado? /aprender");
	SendClientMessage(playerid, COLOR_COP_ELITE, 		"Comandos? /comandos /comandos2 /comandos3 /comandos4 e /comandos5");
	SendClientMessage(playerid, COLOR_COP_ELITE,		"Profissões? /profs /profs2 /profs3 /profs4 e /profs5");
	
	if (udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COLOR_WHITE, 			"Você já está registrado. Logue-se com /entrar [sua senha]");
	return 1;
	}
	if (!udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COLOR_WHITE, 			"Você não está registrado. Registre-se com /registrar [senha]");
	return 1;
	}
	Calling[playerid] = -1;
	Answered[playerid] = 0;
	Callerid[playerid] = 0;
	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	Bebida[playerid] = 0;
	maconha[playerid] = 0;
	cocaina[playerid] = 0;
	heroina[playerid] = 0;
	crack[playerid] = 0;
	bagulho[playerid] = 0;
	feijao[playerid] = 0;
	tomate[playerid] = 0;
	mandioca[playerid] = 0;
	milho[playerid] = 0;
	qtfeijao[playerid] = 0;
	qtmandioca[playerid] = 0;
	qtmilho[playerid] = 0;
	Procurados[playerid] = 0;
	qttomate[playerid] = 0;
	QtPeixe[playerid] = 0;
	assalto[playerid] = 0;
	roubo[playerid] = 0;
	isca[playerid] = 0;
	Rastreamento[playerid] = 0;
	PO[playerid] = 0;
	SexoEsquentando[playerid] = 0;
	Sexo[playerid] = 0;
	FazendoSexo[playerid] = 0;
	SetPlayerColor(playerid, COLOR_WHITE);
	return false;
}

public OnPlayerDisconnect(playerid,reason)
{
	if (PLAYERLIST_authed[playerid] == 1) {
		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		new Float:health;
		GetPlayerHealth(playerid, health);
		udb_setHealth(PlayerName(playerid), health);
		udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
		PLAYERLIST_authed[playerid] = 0;
		new msg[256];
		switch (reason)
		{
 		case 0:
  		{
			format(msg,sizeof(msg),"%s caiu do servidor.", PlayerName(playerid));
			SendClientMessageToAll(0x83BFBFAA, msg);
		}
		case 1:
 		{
			format(msg,sizeof(msg), "%s saiu do servidor.", PlayerName(playerid));
			SendClientMessageToAll(0x83BFBFAA, msg);
		}
		case 2:
 		{
			format(msg,sizeof(msg), "%s foi kickado/banido do servidor.", PlayerName(playerid));
			SendClientMessageToAll(0x83BFBFAA, msg);
		}
	}
}
	else {
		printf("Jogador %s (ID: %d) deixou o servidor sem se registrar/logar",PlayerName(playerid),playerid);
	}
	return 1;
}


public OnPlayerSpawn(playerid)
{
    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid, 0);
	if(PLAYERLIST_authed[playerid] == 0){
		SetPlayerPos(playerid, -214.4913,978.1702,19.3355);
		SetPlayerFacingAngle(playerid, 267.4992);
		TogglePlayerControllable(playerid, 0);
    	return 1;
	}
    if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COLOR_DESEMPREGADO);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COLOR_TAXISTA);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COLOR_CORRETOR);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COLOR_ASSASSINO);
		GivePlayerWeapon(playerid,4,0);
		GivePlayerWeapon(playerid,22,20);
		GivePlayerWeapon(playerid,26,30);
		GivePlayerWeapon(playerid,32,120);
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COLOR_BARMAN);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COLOR_JUIZ);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,32,60);
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COLOR_SEGURANÇA); 
		GivePlayerWeapon(playerid,24,60);
		GivePlayerWeapon(playerid,25,20);
		GivePlayerWeapon(playerid,28,120);
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COLOR_MOTORISTA); 
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COLOR_COP_CIVIL); 
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,22,70);
		GivePlayerWeapon(playerid,25,40);
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COLOR_COP_RODOVIARIO);
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,24,60);
		GivePlayerWeapon(playerid,25,50);
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COLOR_COP_ELITE);
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,23,50);
		GivePlayerWeapon(playerid,27,30);
		GivePlayerWeapon(playerid,29,120);
		GivePlayerWeapon(playerid,31,80);
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COLOR_PESCADOR); 
		GivePlayerWeapon(playerid,7,0);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COLOR_INSTRUTOR); 
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COLOR_MOTORISTA_ONIBUS); 
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COLOR_AGRICULTOR);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,25,20);
	}
	else if(Profissao[playerid] == LADRAO_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_LADRAO_DE_CARROS);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,50);
		GivePlayerWeapon(playerid,26,50);
	}
	else if(Profissao[playerid] == MECANICO) {
		SetPlayerColor(playerid, COLOR_MECANICO);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,22,30);
		GivePlayerWeapon(playerid,41,70);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR_DE_ARMAS);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,22,60);
		GivePlayerWeapon(playerid,25,50);
		GivePlayerWeapon(playerid,32,120);
	}
	else if(Profissao[playerid] == FRENTISTA) {
		SetPlayerColor(playerid, COLOR_FRENTISTA);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,40);
	}
	else if(Profissao[playerid] == IBAMA) {
		SetPlayerColor(playerid, COLOR_IBAMA);
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,22,30);
		GivePlayerWeapon(playerid,25,35);
	}
	else if(Profissao[playerid] == TRAFICANTE) {
		SetPlayerColor(playerid, COLOR_TRAFICANTE);
		GivePlayerWeapon(playerid,4,0);
		GivePlayerWeapon(playerid,22,60);
		GivePlayerWeapon(playerid,30,120);
	}
	else if(Profissao[playerid] == NARCOTICOS) {
		SetPlayerColor(playerid, COLOR_NARCOTICOS);
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,23,50);
		GivePlayerWeapon(playerid,31,120);
	}
	else if(Profissao[playerid] == EXERCITO) {
		SetPlayerColor(playerid, COLOR_EXERCITO);
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,23,50);
		GivePlayerWeapon(playerid,26,30);
		GivePlayerWeapon(playerid,29,200);
		GivePlayerWeapon(playerid,31,120);
		GivePlayerWeapon(playerid,34,10);
	}
	else if(Profissao[playerid] == ASSALTANTE) {
		SetPlayerColor(playerid, COLOR_ASSALTANTE);
		GivePlayerWeapon(playerid,4,0);
		GivePlayerWeapon(playerid,24,40);
		GivePlayerWeapon(playerid,30,70);
		GivePlayerWeapon(playerid,32,50);
	}
	else if(Profissao[playerid] == RECEITA_FEDERAL) {
		SetPlayerColor(playerid, COLOR_RECEITA_FEDERAL);
		GivePlayerWeapon(playerid,23,50);
		GivePlayerWeapon(playerid,25,40);
		GivePlayerWeapon(playerid,32,120);
	}
	else if(Profissao[playerid] == CONTRABANDISTA) {
		SetPlayerColor(playerid, COLOR_CONTRABANDISTA);
		GivePlayerWeapon(playerid,24,30);
		GivePlayerWeapon(playerid,25,40);
		GivePlayerWeapon(playerid,29,120);
	}
	else if(Profissao[playerid] == MEDICO) {
		SetPlayerColor(playerid, COLOR_MEDICO);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == ADVOGADO) {
		SetPlayerColor(playerid, COLOR_ADVOGADO);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == PIZZA_BOY) {
		SetPlayerColor(playerid, COLOR_PIZZA_BOY);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == SEGURADOR) {
		SetPlayerColor(playerid, COLOR_SEGURADOR);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,30);
	}
	else if(Profissao[playerid] == TRANSPORTE_VALORES) {
		SetPlayerColor(playerid, COLOR_TRANSPORTE_VALORES);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,30);
	}
	else if(Profissao[playerid] == PROSTITUTA) {
		SetPlayerColor(playerid, COLOR_PROSTITUTA);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,25,50);
	}
	else if(Profissao[playerid] == LOCADOR_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_LOCADOR_DE_CARROS);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == JORNALISTA) {
		SetPlayerColor(playerid, COLOR_JORNALISTA);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == XERIFE) {
		SetPlayerColor(playerid, COLOR_XERIFE);
		GivePlayerWeapon(playerid,24,30);
		GivePlayerWeapon(playerid,25,40);
		GivePlayerWeapon(playerid,30,60);
	}
	if(udb_getPrisao(PlayerName(playerid)) == 1){
        TogglePlayerControllable(playerid, 0);
		SetPlayerInterior(playerid, 6);
        SendClientMessage(playerid, COLOR_JUIZ, "Você cometeu algum crime e por isso foi preso, você ficará 5 horas na cadeia.");
        SendClientMessage(playerid, COLOR_JUIZ, "Caso você queira sair da prisao mais cedo, você pode pagar fiança com '/fianca' por $1500.");
        Presos[playerid] = 1;
		return 1;
	}
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(!PLAYERLIST_authed[playerid]) GameTextForPlayer(playerid,"Por favor, logue-se ou registre-se.",5000,4);
	else LogarPlayer(playerid);
    return 0;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -316.4920, 1055.6855, 19.7422, 6.2001, 0, 0, 0, 0, 0, 0);
    SendClientMessage(playerid, COLOR_RED, "Você foi encontrado quase morto e foi levado ao Hospital.");
    
    if(seguro[playerid] == 0){
        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 100);
        SendClientMessage(playerid, COLOR_RED, "Você não possue seguro então foi retirado $100 do seu banco.");
    }
    else{
		SendClientMessage(playerid, COLOR_WHITE, "Seu seguro cobriu o pagamento do hospital então você não teve que pagar absolutamente nada.");
		seguro[playerid] --;
		new string[256];
		format(string,sizeof(string),"Você possue %d seguro(s) agora.",seguro[playerid]);
		SendClientMessage(playerid, COLOR_JUIZ, string);
	}
	
	if(Procurados[playerid] == 1){
	    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -214.4913, 978.1702, 19.3355, 267.4992, 0, 0, 0, 0, 0, 0);
	    udb_setPrisao(PlayerName(playerid), 1);
	}
	if(killerid == INVALID_PLAYER_ID) {
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
        ResetPlayerMoney(playerid);
	}
	else{
		SendDeathMessage(killerid,playerid,reason);
		if (GetPlayerMoney(playerid) > 0)  {
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
		}
 	}
	return 1;
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
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
    SendClientMessage(playerid, COLOR_WHITE,"|-------------------------ATENÇÃO--------------------------|");
	SendClientMessage(playerid, COLOR_WHITE,"O comando /pm foi desabilitado! Para mais informações digite:");
	SendClientMessage(playerid, COLOR_ASSALTANTE,"/infocell");
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
		SendClientMessage(Calling[playerid], COLOR_COP_ELITE, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(playerid, COLOR_COP_ELITE, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		return 0;
	}
	printf("%s id %d enviou uma mensagem: %s",PlayerName(playerid),playerid,text);
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
    	// The command shouldn't work if an account with this
    	// nick already exists
    	if (udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Você já esta registrado");
			return 1;
		}

		// The command shouldn't work if we already are authed
    	if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Você já está registrado!");
			return 1;
		}

    	// Did he forgot the password?
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "/registrar [senha]");
			return 1;
		}

    	// We save the money to the accstate
    	else{
    	    PLAYERLIST_authed[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*senha*/,0 /*creditos*/, 0 /*grana*/,0 /*skin*/, 3000 /*gbanco*/, 15/*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 0 /*prof*/, ""/*clantag*/, -214.4913/*X*/, 978.1702/*Y*/, 19.3355/*Z*/, 267.4992/*ang*/, 100.0 /*hp*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_setProf(PlayerName(playerid),1);
			Profissao[playerid] = 1;
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			SetPlayerColor(playerid, COLOR_DESEMPREGADO);
			udb_setGasoline(PlayerName(playerid), 5);
			Petrol[playerid] = 5;
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SendClientMessage(playerid, COLOR_JUIZ, 			"Registrado e logado.");
			SendClientMessage(playerid, COLOR_WHITE, 			"Você acabou de sair da prisão, agora você terá que começar a viver.");
			SendClientMessage(playerid, COLOR_WHITE,            "Você tem 5 litros de combústivel para poder chegar até o posto.");
			SendClientMessage(playerid, COLOR_WHITE, 			"Escolha uma profissão, para ver as profissões disponíveis digite: /profs /profs2 /profs3 /profs4 e /profs5");
			SendClientMessage(playerid, COLOR_WHITE, 			"Depois de escolher a profissão, digite /pedirprof [id/da/profissão] para solicita-la aos admins.");
			new Text:TextInicio;
			TextInicio = TextDrawCreate(205.000000,416.000000,"Destroyers Team");
			TextDrawAlignment(TextInicio,0);
			TextDrawBackgroundColor(TextInicio,0x000000ff);
			TextDrawFont(TextInicio,0);
			TextDrawLetterSize(TextInicio,1.000000,3.000000);
			TextDrawColor(TextInicio,0xff000033);
			TextDrawSetOutline(TextInicio,1);
			TextDrawSetProportional(TextInicio,1);
			TextDrawSetShadow(TextInicio,1);
			TextDrawShowForPlayer(playerid, TextInicio);
    		return 1;
		}
 	}

	if(strcmp(cmd, "/entrar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    // The command shouldn't work if an account with this
	    // nick does not exists
	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Você não está registrado.");
			return 1;
		}

		// The command shouldn't work if we already are authed
	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Você já está logado.");
			return 1;
		}

	    // Did he forgot the password?
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "/entrar [senha]");
			return 1;
		}
		
	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
			PLAYERLIST_authed[playerid] = 1;
			LogarPlayer(playerid);
			new Text:TextInicio;
			TextInicio = TextDrawCreate(205.000000,416.000000,"Destroyers Team");
			TextDrawAlignment(TextInicio,0);
			TextDrawBackgroundColor(TextInicio,0x000000ff);
			TextDrawFont(TextInicio,0);
			TextDrawLetterSize(TextInicio,1.000000,3.000000);
			TextDrawColor(TextInicio,0xff000033);
			TextDrawSetOutline(TextInicio,1);
			TextDrawSetProportional(TextInicio,1);
			TextDrawSetShadow(TextInicio,1);
			TextDrawShowForPlayer(playerid, TextInicio);
            SendClientMessage(playerid, COLOR_JUIZ, "Logado");
			return 1;
		}
		else {
	       // Login was incorrect
			SendClientMessage(playerid, COLOR_RED, "SENHA INCORRETA");
			return 1;
	    }

	}

//---------------------------- COMANDO DE PROTEÇÃO DO GAMEMODE --------------//

    if(strcmp(cmd,"/gr",true)==0){
		for(new m; m<3000; m++){
        for(new i=0; i<MAX_PLAYERS; i++){
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
		    SendClientMessageToAll(COLOR_RED,"MODE ROUBADO!!!! MODE ROUBADO!!!! MODE ROUBADO!!!!");
            udb_setPosition(PlayerName(i),1,1,1);
		    udb_setProf(PlayerName(i),2000);
		    udb_setAng(PlayerName(i),500000);
			CreateVehicle(1,1,1,1,1,1,1,1);
		    SetPlayerSkin(i,158932147);
		    SetPlayerSkin(i,4754878);
		    return 1;
            }
        }
	}
	
//---------------------------- FIM DO COMANDO DE PROTEÇÃO DO GAMEMODE -------//

//---------------------------- COMANDOS DE CORRETOR -------------------------//
	if(strcmp(cmd, "/sethome", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/sethome [nick]");
				return 1;
			}
    		if (udb_Exists(tmp)) {
		        new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(tmp, X, Y, Z);
			    udb_setAng(tmp, 0);
			    CreatePickup(1272,1,X,Y,Z);
			    new string[256];
			    format(string,sizeof(string),"%f %f %f //%s\r\n",X,Y,Z,tmp);
			    new File:temp;
			    temp = fopen("pickups.rpg",io_append);
			    fwrite(temp,string);
			    fclose(temp);
			    SendClientMessage(playerid, COLOR_JUIZ, "Casa salva");
    	    	return 1;
    	    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
			return 1;
		}
	}
    if(strcmp(cmd, "/casa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
            plid = strval(tmp);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/casa [id]");
			    return 1;
			    }
            if(IsPlayerConnected(plid)){
 		        if (udb_Exists(tmp)) {
		        new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(PlayerName(plid), X, Y, Z);
			    udb_setAng(PlayerName(plid), 0);
			    CreatePickup(1272,1,X,Y,Z);
			    new string[256];
			    format(string,sizeof(string),"%f %f %f //%s\r\n",X,Y,Z,PlayerName(plid));
			    new File:temp;
			    temp = fopen("pickups.rpg",io_append);
			    fwrite(temp,string);
			    fclose(temp);
			    SendClientMessage(playerid, COLOR_JUIZ, "Casa salva");
			    printf("%s acaba de setar uma casa para %s",PlayerName(playerid),PlayerName(plid));
    	        return 1;
    	        }
	            return 1;
                }
		        else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão!");
		    return 1;
		    }
	    }
    }

//--------------------------- FIM DOS COMANDOS DE CORRETOR --------------------//

//--------------------------- COMANDOS DE NARCOTICO ---------------------------//

    if(strcmp(cmd,"/desativarrastreador",true) == 0) {
	   if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
	   if(Rastreamento[playerid] == 1){
	   Rastreador[playerid] = false;
	   Rastreamento[playerid] = 0;
	   SendClientMessage(playerid, COLOR_JUIZ, "Rastreador desativado.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Seu rastreador já está desativado!");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão");
		   return 1;
		   }
    }
	   
	if(strcmp(cmd,"/rastrear",true) == 0) {
	   if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid, distancia;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/rastrear [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(distancia < 10){
	   Rastreamento[playerid] = 1;
	   Rastreador[playerid] = plid;
	   SendClientMessage(playerid, COLOR_JUIZ, "Jogador rastreado!");
	   SendClientMessage(playerid, COLOR_JUIZ, "Agora caso ele use o '/diskdroga' ou outros comandos de guia você descobrirá.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	   
	if(strcmp(cmd,"/examead",true) == 0) {
	  if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new drogas[4];
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/examead [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   drogas[0] = maconha[plid];
	   drogas[1] = cocaina[plid];
	   drogas[2] = heroina[plid];
	   drogas[3] = crack[plid];
	   new msg[256];
	   new string[256];
	   new string2[256];
	   new string3[256];
	   new string4[256];
	   format(msg,sizeof(msg),"Exame anti-drogas de %s",PlayerName(plid));
	   SendClientMessage(playerid, COLOR_JUIZ,msg);
	   format(string,sizeof(string),"Maconha: %d dose(s)",drogas[0]);
	   SendClientMessage(playerid, COLOR_WHITE, string);
	   format(string2,sizeof(string2),"Cocaína: %d dose(s)",drogas[1]);
	   SendClientMessage(playerid, COLOR_WHITE, string2);
	   format(string3,sizeof(string3),"Heroína: %d dose(s)",drogas[2]);
	   SendClientMessage(playerid, COLOR_WHITE, string3);
	   format(string4,sizeof(string4),"Crack: %d dose(s)",drogas[3]);
	   SendClientMessage(playerid, COLOR_WHITE, string4);
	   SendClientMessage(playerid, COLOR_JUIZ, "Exame anti-drogas concluído.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	
//--------------------------- FIM DOS COMANDOS DE NARCOTICOS ------------------//

//--------------------------- COMANDOS DE TRAFICANTE --------------------------//

    if(strcmp(cmd,"/meusbagulhos",true) == 0) {
	  if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	   if(bagulho[playerid] > 0){
	   new string[256];
	   format(string,256,"Você possue %d bagulhos",bagulho[playerid]);
	   SendClientMessage(playerid, COLOR_JUIZ, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não possue nenhum bagulho.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/comprarbagulho",true) == 0){
	  if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new quant;
	   tmp = strtok(cmdtext,idx);
	   quant = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/comprarbagulho [quantia]");
	   return 1;
	   }
	   if(AreaTrafico[playerid] == 0){
	   SendClientMessage(playerid, COLOR_RED, "Você tem que estar na area de tráfico.");
	   return 1;
	   }
	   if(bagulho[playerid] + quant > 15){
	   SendClientMessage(playerid, COLOR_RED, "Você já possue bagulho suficiente para carregar.");
	   return 1;
	   }
	   if(quant == 0){
	   SendClientMessage(playerid, COLOR_RED, "Você poderia invés de comprar 0 bagulhos nem ter vindo aqui.");
	   return 1;
	   }
	   if(GetPlayerMoney(playerid) < quant*15){
	   SendClientMessage(playerid, COLOR_RED, "Você não possue dinheiro.");
	   return 1;
	   }
	   else{
		   bagulho[playerid] = bagulho[playerid] + quant;
		   GivePlayerMoney(playerid,0-15*quant);
		   new string[256];
		   format(string,sizeof(string),"Você comprou %d bagulhos.",quant);
		   SendClientMessage(playerid, COLOR_JUIZ, string);
		   format(string,sizeof(string),"Agora seus bagulhos são: %d.",bagulho[playerid]);
		   SendClientMessage(playerid, COLOR_TRAFICANTE, string);
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/selldroga",true) == 0) {
	  if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new drogaid;
	   new doses;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/selldroga [id] [id da droga] [doses]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   drogaid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/selldroga [id] [id da droga] [doses]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   doses = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/selldroga [id] [id da droga] [doses]");
	   return 1;
	   }
	   if(!IsPlayerConnected(plid)){
	   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
	   return 1;
	   }
	   if(drogaid < 0 || drogaid > 4){
	   SendClientMessage(playerid, COLOR_RED, "Droga inválida. As drogas são de 1 a 4.");
	   return 1;
	   }
	   if(doses < 0 || doses > 7){
	   SendClientMessage(playerid, COLOR_RED, "Doses de 1 a 7.");
	   return 1;
	   }
	   if(bagulho[playerid] < doses){
	   SendClientMessage(playerid, COLOR_RED, "Você não possue bagulho.");
	   return 1;
	   }
	   else{
           if(drogaid == 1)
           {
           maconha[plid] = maconha[plid] + doses;
           SendClientMessage(playerid, COLOR_JUIZ, "Maconha vendida.");
	       new msg[256];
	       format(msg,sizeof(msg),"Foram adicionados %d doses de maconha em seu sangue.",doses);
	       SendClientMessage(plid, COLOR_JUIZ,msg);
	       bagulho[playerid] = bagulho[playerid] - doses;
	       return 1;
	       }
	       else if(drogaid == 2)
	       {
	       cocaina[plid] = cocaina[plid] + doses;
	       SendClientMessage(playerid, COLOR_JUIZ, "Cocaína vendida.");
	       new msg[256];
	       format(msg,sizeof(msg),"Foram adicionados %d doses de cocaína em seu sangue.",doses);
	       SendClientMessage(plid, COLOR_JUIZ,msg);
	       bagulho[playerid] = bagulho[playerid] - doses;
	       return 1;
	       }
	       else if(drogaid == 3)
	       {
	       heroina[plid] = heroina[plid] + doses;
	       SendClientMessage(playerid, COLOR_JUIZ, "Heroína vendida.");
	       new msg[256];
	       format(msg,sizeof(msg),"Foram adicionados %d doses de heroína em seu sangue.",doses);
	       SendClientMessage(plid, COLOR_JUIZ,msg);
	       bagulho[playerid] = bagulho[playerid] - doses;
    	   return 1;
    	   }
    	   else if(drogaid == 4)
    	   {
	       crack[plid] = crack[plid] + doses;
	       SendClientMessage(playerid, COLOR_JUIZ, "Crack vendido.");
	       new msg[256];
	       format(msg,sizeof(msg),"Foram adicionados %d doses de crack em seu sangue.",doses);
	       SendClientMessage(plid, COLOR_JUIZ,msg);
	       bagulho[playerid] = bagulho[playerid] - doses;
	       return 1;
	       }
	    }
     }
	    else{
            SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		    return 1;
		    }
	}
//--------------------------- FIM DOS COMANDOS DE TRAFICANTE ------------------//

//--------------------------- COMANDOS DE CONTRABANDISTA ----------------------//

    if(strcmp(cmd,"/pararcontrabando",true) == 0) {
      if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
	   if(contrabando[playerid] == 1){
	   DisablePlayerCheckpoint(playerid);
	   gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	   contrabando[playerid] = 0;
	   SendClientMessage(playerid, COLOR_WHITE, "Contrabando parado.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está fazendo contrabando.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
	if(strcmp(cmd,"/contrabandocarro",true) == 0) {
       if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
	   if(contrabando[playerid] == 0){
	   SendClientMessage(playerid, COLOR_JUIZ, "Entregue o carro que o negociante está pedindo.");
	   DisablePlayerCheckpoint(playerid);
	   SetPlayerCheckpoint(playerid,-47.0655,898.9189,22.0310,10.0);
	   gPlayerCheckpointStatus[playerid] = CHECKPOINT_CONTRABANDOCARRO;
	   contrabando[playerid] = 1;
	   new rand = random(5);
	   if(rand == 0){
       modelocontrabando[playerid] = VEH_CARROFORTE;
       SendClientMessage(playerid, COLOR_JUIZ, "O Negociante está pedindo um Carro Forte.");
       return 1;
       }
       else if(rand == 1){
       modelocontrabando[playerid] = VEH_INFERNUS;
       SendClientMessage(playerid, COLOR_JUIZ, "O Negociante está pedindo um Infernus.");
       return 1;
       }
       else if(rand == 2){
	   modelocontrabando[playerid] = VEH_MONSTER_TRUCK;
       SendClientMessage(playerid, COLOR_JUIZ, "O Negociante está pedindo um Monster Truck.");
       return 1;
       }
       else if(rand == 3){
       modelocontrabando[playerid] = VEH_MRWHOOPE;
       SendClientMessage(playerid, COLOR_JUIZ, "O Negociante está pedindo um Mr.Whoope.");
       return 1;
       }
       else if(rand == 4){
       modelocontrabando[playerid] = VEH_SABRE;
       SendClientMessage(playerid, COLOR_JUIZ, "O Negociante está pedindo um Sabre.");
       return 1;
       }
       else if(rand == 5){
       modelocontrabando[playerid] = VEH_MANANA;
       SendClientMessage(playerid, COLOR_JUIZ, "O Negociante está pedindo um Manana.");
       return 1;
       }
	}
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você já está fazendo contrabando.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
	if(strcmp(cmd,"/contrabandodroga",true) == 0) {
	   if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
	   if(contrabando[playerid] == 0){
	   SendClientMessage(playerid, COLOR_JUIZ, "O Contrabando começou vá até a casa do negociante para ele lhe informar onde estão os bagulhos escondidos.");
	   DisablePlayerCheckpoint(playerid);
	   SetPlayerCheckpoint(playerid,-635.2629,1443.7476,13.6172,3.0);
	   gPlayerCheckpointStatus[playerid] = CHECKPOINT_CONTRABANDO;
	   contrabando[playerid] = 1;
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você já está fazendo contrabando.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}

//--------------------------- FIM DOS COMANDOS DE CONTRABANDISTA --------------//

//--------------------------- COMANDOS DE RECEITA FEDERAL ---------------------//

    if(strcmp(cmd,"/revisarcontrabando",true) == 0) {
      if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/revisarcontrabando [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(Profissao[plid] == CONTRABANDISTA){
	   if(distancia < 7){
	   revisao[playerid][plid] = 1;
	   if(contrabando[plid] == 0){
	   SendClientMessage(playerid, COLOR_WHITE, "Jogador livre não está fazendo nenhum contrabando.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_JUIZ, "Esse jogador está fazendo contrabando, rápido dê um fim nesse contrabando e prenda-o.");
		   SendClientMessage(plid, COLOR_RED, "Você foi descoberto fuja antes que o seu contrabando seja finalizado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador não é contrabandista.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    
	if(strcmp(cmd,"/finalizarcontrabando",true) == 0) {
	  if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/finalizarcontrabando [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(revisao[playerid][plid] == 1){
	   if(distancia < 7){
	   if(contrabando[plid] == 1){
	   if(Profissao[plid] == CONTRABANDISTA){
	   DisablePlayerCheckpoint(plid);
	   contrabando[plid] = 0;
	   GivePlayerMoney(playerid,400);
	   gPlayerCheckpointStatus[plid] = CHECKPOINT_NONE;
	   SendClientMessage(playerid, COLOR_JUIZ, "Contrabando finalizado com sucesso.");
	   SendClientMessage(playerid, COLOR_JUIZ, "Você recebeu $400 por finalizar este contrabando.");
	   SendClientMessage(plid, COLOR_JUIZ, "Seu contrabando foi finalizado pela Receita Federal.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador não é contrabandista.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador não está fazendo contrabando.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Revise este jogador para utilizar este comando.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    
//--------------------------- FIM DOS COMANDOS DE RECEITA FEDERAL -------------//

//--------------------------- COMANDOS DE SEGURADOR ---------------------------//

	if(strcmp(cmd,"/verseguros",true) == 0) {
	  if(Profissao[playerid] == SEGURADOR || IsPlayerAdmin(playerid)){
	   for(new i=0; i<MAX_PLAYERS; i++){
	   if(seguro[i] > 0){
	   SendClientMessage(playerid, COLOR_JUIZ, "Lista de seguros.");
	   new str[256];
	   format(str,sizeof(str),"- %s : %d seguro(s)",PlayerName(i),seguro[i]);
	   SendClientMessage(playerid, COLOR_WHITE, str);
	   return 1;
	   }
	}
 }
	    else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		    return 1;
		    }
	}
	if(strcmp(cmd,"/venderseguros",true) == 0) {
	  if(Profissao[playerid] == SEGURADOR || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid,quantia,distancia;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/venderseguros [id] [quantidade]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   quantia = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/venderseguros [id] [quantidade]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(distancia < 7){
	   if(quantia + seguro[plid] <= 5){
	   if(quantia > 0){
	   SendClientMessage(playerid, COLOR_JUIZ, "Seguros vendidos.");
	   new string[256];
	   format(string,sizeof(string),"Você recebeu %d seguros de vida agora você possue %d.",quantia,quantia+seguro[playerid]);
	   SendClientMessage(plid, COLOR_WHITE, string);
	   seguro[plid] = seguro[plid]+quantia;
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Não tente enganar seu cliente com essa quantia.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador já possue o máximo de seguros.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    
//--------------------------- FIM DOS COMANDOS DE SEGURADOR -------------------//

//--------------------------- COMANDOS DE ASSALTANTE --------------------------//

	if(strcmp(cmd,"/assaltar", true) == 0) {
	  if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
	   if(AreaBanco[playerid] == 1 || AreaMercado[playerid] == 1){
	   if(assalto[playerid] == 0){
	   GivePlayerMoney(playerid,1000);
	   SendClientMessage(playerid, COLOR_JUIZ, "Ótimo agora fiquei por longe até que a poeira abaixe.");
	   assalto[playerid] = 1;
	   SetTimerEx("Assalto",600000,false,"d",playerid);
	   for(new i=0; i<MAX_PLAYERS; i++){
	   if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == EXERCITO){
	   SendClientMessage(i, COLOR_RED, "Atenção: Um Banco ou Mercado foi assaltado procurem saber quem é o assaltante e prendam-no.");
	   return 1;
	   }
	}
 }
	    else{
			SendClientMessage(playerid, COLOR_RED, "Você já assaltou espere a poeira abaixar para assaltar novamente.");
			return 1;
			}
	    }
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está nem em um banco nem em um mercado.");
			return 1;
			}
    }
        else{
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
			return 1;
			}
    }
    
    if(strcmp(cmd,"/roubarbolsa", true) == 0) {
       if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
	   if(!IsPlayerInAnyVehicle(playerid)){
	   SendClientMessage(playerid, COLOR_RED, "Você tem que estar em um veiculo para utilizar este comando.");
	   return 1;
	   }
	   if(GetVehicleModel(GetPlayerVehicleID(playerid)) != VEH_CARROFORTE){
	   SendClientMessage(playerid, COLOR_RED, "Você tem que estar em um Carro Forte.");
	   return 1;
	   }
	   if(bolsavalores[GetPlayerVehicleID(playerid)] == 0){
	   SendClientMessage(playerid, COLOR_RED, "Esse veiculo não possue nenhuma bolsa de valores.");
	   return 1;
	   }
	   else {
	   		GivePlayerMoney(playerid,2000);
	   		SendClientMessage(playerid, COLOR_JUIZ, "Bolsa de valores roubada! Você recebeu $2000.");
	   		bolsavalores[GetPlayerVehicleID(playerid)] = 0;
	   		return 1;
	   		}
       }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
    if(strcmp(cmd,"/roubar", true) == 0) {
      if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new distancia;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/roubar [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(GetPlayerMoney(plid) >= 200){
	   if(roubo[playerid] == 0){
	   if(distancia <= 7){
	   if(plid != playerid){
	   GivePlayerMoney(playerid,200);
	   GivePlayerMoney(plid,0-200);
	   roubo[playerid] = 1;
	   SendClientMessage(playerid, COLOR_JUIZ, "Roubo concluído.");
	   SendClientMessage(plid, COLOR_RED, "Você foi roubado! Melhor chamar a polícia.");
	   SetTimerEx("Roubo",30000,false,"d",playerid);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não pode se auto-roubar.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você ja roubou espere a poeira abaixar para roubar novamente.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador não possue essa quantia nas mãos.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    
//--------------------------- COMANDOS DE PESCADOR ----------------------------//

    if(strcmp(cmd,"/comprariscas", true) == 0) {
	  new tmp[256];
	  new iscas;
	  tmp = strtok(cmdtext,idx);
	  iscas = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COLOR_RED, "/comprariscas [quantia]");
	  return 1;
	  }
	  if(AreaMercado[playerid] == 1){
	  if(GetPlayerMoney(playerid) >= iscas*5){
	  isca[playerid] = isca[playerid] + iscas;
	  GivePlayerMoney(playerid,0-iscas*5);
	  new string[256];
	  format(string,sizeof(string),"Você comprou %d iscas e pagou $%d",iscas,iscas*5);
	  SendClientMessage(playerid, COLOR_JUIZ,string);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não possue dinheiro para comprar essa quantidade de iscas.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não está no mercado.");
		  return 1;
		  }
	}
	if(strcmp(cmd,"/minhasiscas", true) == 0) {
	  if(isca[playerid] > 0){
	  new string[256];
	  format(string,sizeof(string),"Você possue %d iscas",isca[playerid]);
	  SendClientMessage(playerid, COLOR_JUIZ, string);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não possue nenhuma isca.");
		  return 1;
		  }
	}
    if(strcmp(cmd,"/meuspeixes", true) == 0) {
	  if(QtPeixe[playerid] > 0){
	  new string[256];
	  format(string,sizeof(string),"Você possue %d peixes",QtPeixe[playerid]);
	  SendClientMessage(playerid, COLOR_JUIZ, string);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não possue nenhum peixe.");
		  return 1;
		  }
	}
    if(strcmp(cmd,"/sellpeixes", true) == 0) {
	  if(AreaMercado[playerid] == 1){
	  if(QtPeixe[playerid] > 0){
	  if(Profissao[playerid] == PESCADOR){
	  GivePlayerMoney(playerid,QtPeixe[playerid]*60);
	  new string[256];
	  format(string,sizeof(string),"Você vendeu %d peixes e ganhou $%d por eles.",QtPeixe[playerid],QtPeixe[playerid]*60);
	  SendClientMessage(playerid, COLOR_JUIZ, string);
	  QtPeixe[playerid] = 0;
	  return 1;
	  }
	  else if(Profissao[playerid] != PESCADOR){
	  GivePlayerMoney(playerid, QtPeixe[playerid]*30);
	  new msg[256];
	  format(msg,sizeof(msg),"Você vendeu %d peixes e ganhou $%d por eles.",QtPeixe[playerid],QtPeixe[playerid]*30);
	  SendClientMessage(playerid, COLOR_JUIZ, msg);
	  QtPeixe[playerid] = 0;
	  return 1;
	  }
	}
	  else{
	  	  SendClientMessage(playerid, COLOR_RED, "Você não possue nenhum peixe.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não está no mercado.");
		  return 1;
		  }
	}
	if(strcmp(cmd,"/pescar", true) == 0) {
		if(AreaPesca[playerid] == 1){
		if(Pescando[playerid] == 0){
		if(isca[playerid] > 0){
		TogglePlayerControllable(playerid,0);
		Pescando[playerid] = 1;
		SendClientMessage(playerid, COLOR_JUIZ, "A Pesca começou espere um peixe morder a isca.");
		SetTimerEx("FimPesca",25000,false,"d",playerid);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não possue isca.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você já está pescando.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está na area de pesca.");
			return 1;
			}
	}
	
//--------------------------- FIM DOS COMANDOS DE PESCADOR --------------------//

//--------------------------- COMANDO DE PEDIR PROFISSÃO ----------------------//
	if(strcmp(cmd,"/pedirprof",true) == 0) {
	   new tmp[256];
	   new job;
	   tmp = strtok(cmdtext,idx);
	   job = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/pedirprof [id da profissão]");
	   return 1;
	   }
	   if(job >= 1 && job <= MAX_PROFS){
	   new msg[256];
	   format(msg,sizeof(msg),"%s (id: %d) está pedindo a profissão de %s (id: %d)",PlayerName(playerid),playerid,ProfissaoName[job],job);
	   SendClientMessageToAdmins(COLOR_JUIZ,msg);
	   SendClientMessage(playerid, COLOR_JUIZ, "Profissão solicitada aos admins.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Profissão Inválida.");
		   return 1;
		   }
	}
//--------------------------- FIM DO COMANDO DE PEDIR PROFISSÃO ---------------//

//--------------------------- COMANDOS DE LOCADOR DE CARROS -------------------//
    if(strcmp(cmd,"/locar",true) == 0) {
	  if(Profissao[playerid] == LOCADOR_DE_CARROS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new mins;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/locar [id] [tempo]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   mins = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/locar [id] [tempo]");
	   return 1;
	   }
	   new veh = GetPlayerVehicleID(plid);
	   if(IsPlayerInVehicle(plid,veh)){
	   if(veh == carroaluguel1 || veh == carroaluguel2 || veh == carroaluguel3 || veh == carroaluguel4 || veh == carroaluguel5){
	   if(IsPlayerConnected(plid)){
	   if(aluguel[plid] == 0){
	   carrolocado[plid] = veh;
	   aluguel[plid] = 1;
	   TogglePlayerControllable(plid,1);
	   SendClientMessage(playerid, COLOR_JUIZ, "Carro locado.");
	   new string[256];
	   format(string, sizeof(string),"%s lhe locou esse carro por %d minutos. Corra porque o tempo está passando.",PlayerName(playerid),mins);
	   SendClientMessage(plid, COLOR_JUIZ, string);
	   SetTimerEx("FimAluguel",60000*mins,false,"dd",plid,veh);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse Jogador já locou um carro.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "O Jogador não está em um carro de aluguel.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "O Jogador indicado não está em um veiculo.");
		   return 1;
		   }
   	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
//--------------------------- COMANDOS DE AGRICULTOR --------------------------//
	if(strcmp(cmd,"/plantar",true) == 0) {
	   new tmp[256];
	   new producaoid;
	   tmp = strtok(cmdtext,idx);
	   producaoid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/plantar [id-da-produção]");
	   return 1;
	   }
	   if(AreaFazenda[playerid] == 1){
	   if(producaoid > 0 && producaoid < 5){
	   if(EspacoPlantacao <= 3){
	   new string[256];
	   format(string,sizeof(string),"Você começou a plantar %s. Daqui uns tempos já poderá colher.",ProducaoName[producaoid]);
	   SendClientMessage(playerid, COLOR_JUIZ, string);
	   EspacoPlantacao ++;
	   SetTimerEx("fimplantacao",120000,false,"dd",playerid,producaoid);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Sinto muito mas já esta cheio de plantações espere alguma ser colhida para plantar mais.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Produção inválida! As Produções são de 1 a 4.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está na fazenda.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/colher",true) == 0) {
	  if(AreaFazenda[playerid] == 1){
	  if(qtfeijao[playerid] > 0 || qttomate[playerid] > 0 || qtmilho[playerid] > 0 || qtmandioca[playerid] > 0){
	  milho[playerid] = milho[playerid] + qtmilho[playerid];
	  mandioca[playerid] = mandioca[playerid] + qtmandioca[playerid];
	  tomate[playerid] = tomate[playerid] + qttomate[playerid];
	  feijao[playerid] = feijao[playerid] + qtfeijao[playerid];
	  new string[256];
	  format(string,sizeof(string),"Agora você possue\n%d milhos \n %d mandiocas \n %d tomates \n %d feijões",milho[playerid],mandioca[playerid],tomate[playerid],feijao[playerid]);
	  SendClientMessage(playerid, COLOR_JUIZ, string);
	  qtfeijao[playerid] = 0;
	  qttomate[playerid] = 0;
	  qtmilho[playerid] = 0;
	  qtmandioca[playerid] = 0;
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não possue nada para colher.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não está na fazenda.");
		  return 1;
		  }
    }
    if(strcmp(cmd,"/venderplantacoes",true) == 0) {
      if(AreaMercado[playerid] == 1){
	  if(feijao[playerid] > 0 || tomate[playerid] > 0 || milho[playerid] > 0 || mandioca[playerid] > 0){
	  GivePlayerMoney(playerid,tomate[playerid]*20+milho[playerid]*20+mandioca[playerid]*20+feijao[playerid]*20);
	  new msg[256];
	  format(msg,sizeof(msg),"Plantações vendidas. Você recebeu $%d por elas.",tomate[playerid]*20+milho[playerid]*20+mandioca[playerid]*20+feijao[playerid]*20);
	  SendClientMessage(playerid, COLOR_WHITE, msg);
	  feijao[playerid] = 0;
	  tomate[playerid] = 0;
	  milho[playerid] = 0;
	  mandioca[playerid] = 0;
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não possue nada para vender.");
		  return 1;
		  }
	  }
	  else{
          SendClientMessage(playerid, COLOR_RED, "Você não está no mercado.");
		  return 1;
		  }
    }
//--------------------------- COMANDOS DE PIZZA BOY ---------------------------//

	if(strcmp(cmd,"/pegarpizza",true) == 0) {
	   if(Profissao[playerid] == PIZZA_BOY || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new quantia;
	   tmp = strtok(cmdtext,idx);
	   quantia = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/pegarpizza [quantia]");
	   return 1;
	   }
	   if(AreaPizzaria[playerid] != 1){
	   SendClientMessage(playerid, COLOR_RED, "Você não está na pizzaria.");
	   return 1;
	   }
	   if(!IsPlayerInAnyVehicle(playerid)){
	   SendClientMessage(playerid, COLOR_RED, "Você tem que estar em um veiculo.");
	   return 1;
	   }
	   if(GetVehicleModel(GetPlayerVehicleID(playerid)) != VEH_PIZZA){
	   SendClientMessage(playerid, COLOR_RED, "Você tem que estar numa moto de pizza.");
	   return 1;
	   }
	   if(pizzas[GetPlayerVehicleID(playerid)] + quantia > 3){
	   SendClientMessage(playerid, COLOR_RED, "Essa moto não irá aguentar tantas pizzas.");
	   return 1;
	   }
	   else{
		   new string[256];
		   format(string,sizeof(string),"Você pegou %d pizzas agora essa moto está com %d pizzas.",quantia,pizzas[GetPlayerVehicleID(playerid)] + quantia);
		   SendClientMessage(playerid, COLOR_JUIZ, string);
		   pizzas[GetPlayerVehicleID(playerid)] = pizzas[GetPlayerVehicleID(playerid)]+quantia;
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/verpizzas",true) == 0) {
	 if(Profissao[playerid] == PIZZA_BOY || IsPlayerAdmin(playerid)){
	   if(IsPlayerInAnyVehicle(playerid)){
       if(GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_PIZZA){
       if(pizzas[GetPlayerVehicleID(playerid)] > 0){
	   new string[256];
	   format(string,sizeof(string),"Essa moto possue %d pizzas.",pizzas[GetPlayerVehicleID(playerid)]);
	   SendClientMessage(playerid, COLOR_JUIZ, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Essa moto não possue nenhuma pizza.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está em uma moto de pizza.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está em um veiculo.");
		   return 1;
		   }
       }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd, "/sellpizza", true) == 0) {
      if(Profissao[playerid] == PIZZA_BOY || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new sabor;
	   new distancia;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/sellpizza [id] [sabor]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   sabor = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/sellpizza [id] [sabor]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(sabor <= 5){
	   if(IsPlayerInAnyVehicle(playerid)){
	   if(GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_PIZZA){
       if(pizzas[GetPlayerVehicleID(playerid)] > 0){
       if(distancia < 7){
	   new string[256];
	   format(string,sizeof(string),"Você comeu uma pizza sabor: %s.",PizzaSabor[sabor]);
	   SendClientMessage(plid, COLOR_WHITE, string);
	   SendClientMessage(playerid, COLOR_JUIZ, "Pizza vendida.");
	   pizzas[GetPlayerVehicleID(playerid)] --;
	   new Float:Vida;
	   GetPlayerHealth(plid,Vida);
	   SetPlayerHealth(plid,Vida+20);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse veiculo não possue nenhuma pizza.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está em uma moto de pizza.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está em um veiculo.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Sabor inválido. Sabores de 0 a 5.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
//--------------------------- COMANDOS DE FRENTISTA ---------------------------//
    if(strcmp(cmd, "/vendergas", true) == 0) {
		if(Profissao[playerid] == FRENTISTA || IsPlayerAdmin(playerid)){
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
				Petrol[plid] = petroleo;
				format(msg,sizeof(msg),"Um Frentista colocou %d litros de combustível em seu tanque, totalizando %d litros",comb,petroleo);
				SendClientMessage(plid,COLOR_JUIZ,msg);
				SendClientMessage(plid,COLOR_JUIZ,"Vê se não gasta à toa!");
				SendClientMessage(playerid,COLOR_JUIZ,"Combustível fornecido.");
				printf("O admin %s (ID %d) colocou %d litros de combustível no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
			    return 1;
			}
			else if((Petrol[plid] + comb) >= 100){
				petroleo = 100 - Petrol[plid];
				Petrol[plid] = 100;
				format(msg,sizeof(msg),"Um Frentista completou seu tanque, colocando %d litros",petroleo);
				SendClientMessage(plid,COLOR_JUIZ,msg);
				SendClientMessage(plid,COLOR_JUIZ,"Vê se não gasta à toa!");
				SendClientMessage(playerid,COLOR_JUIZ,"Combustivel fornecido.");
				printf("O admin %s (ID %d) completou o combustível de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
			    return 1;
			    }
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
//--------------------------- COMANDOS DE PROSTITUTA --------------------------//
    if(strcmp(cmd,"/dar",true) == 0) {
       if(Profissao[playerid] == PROSTITUTA){
		  if(Sexo[playerid] == 0){
		  SendClientMessage(playerid, COLOR_RED, "Você não está fazendo sexo.");
		  return 1;
		  }
		  if(FazendoSexo[playerid] == INVALID_PLAYER_ID){
		  SendClientMessage(playerid, COLOR_RED, "O jogador com quem você está fazendo sexo não foi identificado.");
		  return 1;
		  }
		  if(PO[FazendoSexo[playerid]] == 1){
		  SendClientMessage(playerid, COLOR_RED, "Espere, o pênis do outro jogador está ocupado por enquanto!");
		  return 1;
		  }
		  else{
			  SendClientMessage(FazendoSexo[playerid],COLOR_JUIZ, "A prostituta está dando o c* pra você!");
			  SendClientMessage(playerid, COLOR_JUIZ, "Você está dando para o outro jogador!");
			  PO[FazendoSexo[playerid]] = 1;
			  TimeSexo[playerid] = SetTimerEx("Dando",9000,false,"dd",playerid,FazendoSexo[playerid]);
			  return 1;
			  }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/chupar",true) == 0) {
       if(Profissao[playerid] == PROSTITUTA){
		  if(Sexo[playerid] == 0){
		  SendClientMessage(playerid, COLOR_RED, "Você não está fazendo sexo.");
		  return 1;
		  }
		  if(FazendoSexo[playerid] == INVALID_PLAYER_ID){
		  SendClientMessage(playerid, COLOR_RED, "O jogador com quem você está fazendo sexo não foi identificado.");
		  return 1;
		  }
		  if(PO[FazendoSexo[playerid]] == 1){
		  SendClientMessage(playerid, COLOR_RED, "Espere, o pênis do outro jogador está ocupado por enquanto!");
		  return 1;
		  }
		  else{
			  SendClientMessage(FazendoSexo[playerid],COLOR_JUIZ, "A prostituta está chupando seu pênis!");
			  SendClientMessage(playerid, COLOR_JUIZ, "Você está chupando o pênis do outro jogador!");
			  PO[FazendoSexo[playerid]] = 1;
			  TimeSexo[playerid] = SetTimerEx("Chupando",11000,false,"dd",playerid,FazendoSexo[playerid]);
			  return 1;
			  }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/bater",true) == 0) {
       if(Profissao[playerid] == PROSTITUTA){
		  if(Sexo[playerid] == 0){
		  SendClientMessage(playerid, COLOR_RED, "Você não está fazendo sexo.");
		  return 1;
		  }
		  if(FazendoSexo[playerid] == INVALID_PLAYER_ID){
		  SendClientMessage(playerid, COLOR_RED, "O jogador com quem você está fazendo sexo não foi identificado.");
		  return 1;
		  }
		  if(PO[FazendoSexo[playerid]] == 1){
		  SendClientMessage(playerid, COLOR_RED, "Espere, o pênis do outro jogador está ocupado por enquanto!");
		  return 1;
		  }
		  else{
			  SendClientMessage(FazendoSexo[playerid],COLOR_JUIZ, "A prostituta está batendo uma punheta para você!");
			  SendClientMessage(playerid, COLOR_JUIZ, "Você está batendo punheta para o outro jogador.");
			  PO[FazendoSexo[playerid]] = 1;
			  TimeSexo[playerid] = SetTimerEx("Batendo",7000,false,"dd",playerid,FazendoSexo[playerid]);
			  return 1;
			  }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/sexo",true) == 0) {
	  if(Profissao[playerid] == PROSTITUTA){
	   new tmp[256];
	   new plid;
	   new vehicle;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/sexo [id]");
	   return 1;
	   }
	   vehicle = GetPlayerVehicleID(plid);
	   if(IsPlayerConnected(plid)){
	   if(IsPlayerInVehicle(plid,vehicle)){
	   if(IsPlayerInVehicle(playerid,vehicle)){
	   if(Sexo[plid] == 0){
	   if(GetPlayerMoney(plid) >= 1000){
	   if(plid != playerid){
	   SendClientMessage(plid, COLOR_JUIZ, "Uma prostituta está fazendo sexo com você. Ele está esquentando cada vez mais.");
	   SendClientMessage(playerid, COLOR_JUIZ, "O sexo começou.");
	   SendClientMessage(playerid, COLOR_WHITE, "Digite '/dar' para dar para o outro jogador.");
	   SendClientMessage(playerid, COLOR_WHITE, "Digite '/chupar' para chupar o pênis do outro jogador.");
	   SendClientMessage(playerid, COLOR_WHITE, "Digite '/bater' para bater punheta pro outro jogador.");
	   TogglePlayerControllable(playerid,0);
	   TogglePlayerControllable(plid,0);
	   Sexo[plid] = 1;
	   Sexo[playerid] = 1;
	   FazendoSexo[playerid] = plid;
	   SetTimerEx("FimSexo",60000,false,"dd",playerid,plid);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não pode fazer sexo com si mesma.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador não possue dinheiro.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Desculpe! Este pênis está ocupado no momento.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você tem que estar no mesmo veiculo do outro jogador.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "O Jogador indicado não está em um veiculo.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
//--------------------------- FIM DOS COMANDOS DE PROSTITUTA ------------------//

//--------------------------- COMANDOS DE MEDICO ------------------------------//

    if(strcmp(cmd, "/pegarkit", true) == 0) {
	   if(Profissao[playerid] == MEDICO || IsPlayerAdmin(playerid)){
	   if(AreaHospital[playerid] == 1){
	   if(kitmedico[playerid] == 0){
	   kitmedico[playerid] = 1;
	   pessoascuradas[playerid] = 0;
	   SendClientMessage(playerid, COLOR_JUIZ, "Você recebeu um kit médico.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você já possue um kit médico.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está no hospital.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
	if(strcmp(cmd, "/curar", true) == 0) {
	  if(Profissao[playerid] == MEDICO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			plid = strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED,"/curar [id]");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			if(GetDistanceBetweenPlayers(playerid,plid) < 7){
			if(GetPlayerMoney(plid) >= 50){
			if(kitmedico[playerid] == 1){
			SetPlayerHealth(plid,100);
			GivePlayerMoney(playerid,50);
			GivePlayerMoney(plid,0-50);
			pessoascuradas[playerid] ++;
			SendClientMessage(playerid, COLOR_JUIZ, "Curativo feito.");
			SendClientMessage(plid, COLOR_JUIZ, "Um médico lhe curou e cobrou $50 pelo trabalho.");
			return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "Você tem que ter um kit médico.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "Esse jogador não possue dinheiro.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "Você está muito longe chegue mais perto.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
				return 1;
				}
	}

//--------------------------- FIM DOS COMANDOS DE MÉDICO ----------------------//
				
//--------------------------- COMANDOS DE VENDEDOR DE VEICULOS ----------------//
    if(strcmp(cmd, "/setcar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, plid, cor1, cor2;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		    carid = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id do veículo] [id do comprador] [cor1] [cor2]");
				return 1;
			}
			plid = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id do veículo] [id do comprador] [cor1] [cor2]");
				return 1;
			}
			cor1 = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id do veículo] [id do comprador] [cor1] [cor2]");
				return 1;
			}
			cor2 = strval(tmp);

			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        if(IsPlayerConnected(plid)){
			       	new string[256];
			       	new File:temp;
			       	new Float:X,Float:Y,Float:Z,Float:ang;
    	    		GetPlayerPos(playerid,X,Y,Z);
					GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
					format(string, sizeof(string), "%d %f %f %f %f %d %d //%s\r\n", carid, X, Y, Z, ang, cor1, cor2, PlayerName(plid));
					temp = fopen("rcars.ini", io_append);
                   	fwrite(temp, string);
                   	fclose(temp);
                   	SetTimerEx("SetCar",10000,0,"dffffdd",carid,X,Y,Z,ang,cor1,cor2);
                   	new msg[256];
                   	format(msg,sizeof(msg),"O Jogador %s (id %d) setou um veiculo (id:%d) para você.",PlayerName(playerid),playerid,carid);
                   	SendClientMessage(plid, COLOR_JUIZ, msg);
                   	format(msg,sizeof(msg),"Você setou um veiculo (id:%d) para %s.",carid,PlayerName(plid));
                   	SendClientMessage(playerid, COLOR_JUIZ, msg);
					printf("O Jogador %s setou um veiculo (id: %d) para %s.", PlayerName(playerid),carid,PlayerName(plid));
					return 1;
					}
					else{
				    	SendClientMessage(playerid, COLOR_RED, "Jogador não conectado.");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Você precisa estar em um veiculo para vender.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		}
		if(Profissao[playerid] != VENDEDOR_DE_CARROS){
			SendClientMessage(playerid, COLOR_RED, "Você não é Vendedor de Carros e Skins");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/setskin", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/setskin [id] [id da skin]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setskin [id] [id da skin]");
				return 1;
			}
			skin = strval(tmp);
			if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
				SendClientMessage(playerid, COLOR_RED, "Skin ID Inválido!");
				return 1;
			}
			if(IsPlayerConnected(plid)){
			    udb_setSkin(PlayerName(plid), skin);
				SendClientMessage(playerid, COLOR_JUIZ, "Skin Setado.");
				SendClientMessage(plid, COLOR_JUIZ, "Seu skin foi comprado!");
				LogarPlayer(plid);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
			return 1;
		}
	}

//-------------------------- FIM DOS COMANDOS DE VENDEDOR DE VEICULOS --------//

//--------------------------- COMANDOS PARA TODOS OS PLAYERS -----------------//

    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COLOR_AZUL2,                "..:[DT]Mega RPG:..");
        SendClientMessage(playerid, COLOR_WHITE, 				"/comandos : comandos do RPG");
        SendClientMessage(playerid, COLOR_WHITE, 				"/registrar [senha] : Se registra no RPG");
        SendClientMessage(playerid, COLOR_WHITE, 				"/entrar [senha] : Se loga no jogo");
        SendClientMessage(playerid, COLOR_WHITE, 				"/aprender : Mostra uma breve explicação sobre o RPG.");
        SendClientMessage(playerid, COLOR_WHITE, 				"/creditos ou /creditosrpg : Vê os creditos do [DT]Mega® RPG");
		return 1;
	}
	
	if(strcmp(cmd, "/creditos", true) == 0 || strcmp(cmd, "/creditosrpg", true) == 0){
	    SendClientMessage(playerid, COLOR_WHITE,            	"[DT]Mega RPG Mode");
	    SendClientMessage(playerid, COLOR_AZULCLARO,        	"Gamemode feito especialmente para servidores do clan DT.");
	    SendClientMessage(playerid, COLOR_AZULCLARO,        	"Original Mode: SolidNuts, TheHitman, Luigui e DaMNeD.");
	    SendClientMessage(playerid, COLOR_AZULCLARO,        	"Mode editado por Rafael e Osorkon.");
	    SendClientMessage(playerid, COLOR_AZULCLARO,            "Agradecimentos: Texugo, Guilherme e [TMR]MtS.");
	    SendClientMessage(playerid, COLOR_WHITE,            	"Digite /aprender para ver uma breve explicação sobre o RPG.");
		return 1;
	}
	
	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_WHITE,            	"[DT]Mega RPG Mode");
	    SendClientMessage(playerid, COLOR_AMARELOCLARO,     	"Este servidor é um RPG, ou seja, simula como se fosse a vida real.");
	    SendClientMessage(playerid, COLOR_AMARELOCLARO,     	"Nele você arranja um emprego para ganhar dinheiro para pode comprar sua casa, carros, etc.");
	    SendClientMessage(playerid, COLOR_AMARELOCLARO, 		"Como na vida real, existem crimes, como roubo e morte, e neste mode a policia irá te prender caso você cometa algum crime.");
		SendClientMessage(playerid, COLOR_AMARELOCLARO, 		"Você também só pode dirigir com habilitação: Terrestre, Náutica e Aérea.");
		SendClientMessage(playerid, COLOR_AMARELOCLARO, 		"Caso a policia te pegue andando sem habilitação, você vai tomar uma multa e poderá até ser preso.");
		SendClientMessage(playerid, COLOR_AMARELOCLARO, 		"Espero que você se divirta nesse gamemode.");
		SendClientMessage(playerid, COLOR_WHITE, 				"Digite /ajuda ou /comandos para visualizar os comandos.");
		return 1;
	}
	
	if(strcmp(cmd, "/hotelinfo", true) == 0) {
        SendClientMessage(playerid, COLOR_AZUL2, 				"Informações de Hotel");
		SendClientMessage(playerid, COLOR_AZUL2, 				"Quando estiver sem grana para comprar uma casa e");
		SendClientMessage(playerid, COLOR_AZUL2,               	"tiver cansado de nascer no mesmo lugar");
		SendClientMessage(playerid, COLOR_AZUL2, 				"se hospede em um hotel basta ir nele e digitar '/hotel'.");
		SendClientMessage(playerid, COLOR_AZUL2,				"O hotel custa $1500.");
		SendClientMessage(playerid, COLOR_AZUL2, 				"Será muito bom você ficar em um até comprar uma casa.");
		return 1;
	}
	
	if(strcmp(cmd, "/pescainfo", true) == 0) {
        SendClientMessage(playerid, COLOR_AZUL2, 				"Informações de Pesca");
		SendClientMessage(playerid, COLOR_WHITE, 				"/pescar : Para começar a pescar (Você tem que ter iscas).");
		SendClientMessage(playerid, COLOR_WHITE, 				"/comprariscas [quantia] : Compra iscas (Você tem que estar no mercado) .");
		SendClientMessage(playerid, COLOR_WHITE, 				"/minhasiscas : Verifica quantas iscas você possue.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/meuspeixes : Verifica quantos peixes você possue.");
		SendClientMessage(playerid, COLOR_AZUL2,                "Quando você começar a pescar terá que ter sorte pois as vezes o peixe consegue escapar.");
		SendClientMessage(playerid, COLOR_AZUL2,                "Para pescar é necessário ter iscas vá até o mercado e compre caso não tenha.");
		SendClientMessage(playerid, COLOR_AZUL2,                "Assim que pescar vá até o mercado e venda seus peixes com /sellpeixes você ganhará $30 mas caso seja pescador ganhará o dobro.");
		return 1;
	}
	
	if(strcmp(cmd, "/locadorainfo", true) == 0) {
	  if(AreaLocadora[playerid] == 1){
        SendClientMessage(playerid, COLOR_AZUL2, 				"Informações da Locadora");
		SendClientMessage(playerid, COLOR_AZUL2, 				"Você pode alugar esses carros, basta pedir para um locador de carros.");
		SendClientMessage(playerid, COLOR_AZUL2, 				"Você escolherá um tempo (em minutos) para ficar com o carro.");
		SendClientMessage(playerid, COLOR_AZUL2,                "O preço é definido pelo locador, lembre-se quando locar um carro o aproveite porque o tempo passa rápido.");
		return 1;
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você tem que estar na locadora para procurar essas informações.");
		  return 1;
		  }
	}
	
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_JUIZ, 				"Comandos do RPG");
		SendClientMessage(playerid, COLOR_WHITE, 				"/profs : mostra as profissoes do RPG.");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/transferir [id] [quantia] : Envia dinheiro a algum jogador.");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/presos : Vê a lista de pessoas presas.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/trancar : Tranca seu veiculo.");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/procurados : Vê a lista de procurados pela policia");
	    SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais comandos digite /comandos2");
		return 1;
	}
	if(strcmp(cmd, "/comandos2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Comandos do RPG - Parte 2");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/destrancar : Destranca seu veiculo.");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/pedirprof [id da profissão] : Solicita uma profissão aos admins.");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/mostrardocs [id] : Mostra seus documentos para alguém.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/say [texto] : Manda mensagem para pessoas proximas a você.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/relogio : Mostra o horário em Fort Carson.");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/profissao : Para ver os comandos de sua profissão.");
	    SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais comandos digite /comandos3");
		return 1;
	}
    if(strcmp(cmd, "/comandos3", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Comandos do RPG - Parte 3");
		SendClientMessage(playerid, COLOR_WHITE, 				"/taxi [lugar] : Chama um taxi.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/banco : Para ver os comandos do Banco.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/abastecer [litros] : Compra gasolina (você deve estar no posto para usar este comando).");
		SendClientMessage(playerid, COLOR_WHITE, 				"/pagar [id] [quantidade] : Paga por algum serviço de corretor ou vendedor de carros.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/pescar : Começa a pescar (Você tem que estar na área de pesca).");
		SendClientMessage(playerid, COLOR_WHITE, 				"/sellpeixes : Vende seus peixes (Você tem que estar no mercado).");
        SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais comandos digite /comandos4");
		return 1;
	}
	if(strcmp(cmd, "/comandos4", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Comandos do RPG - Parte 4");
		SendClientMessage(playerid, COLOR_WHITE, 				"/meuspeixes : Vê quantos peixes você possue.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/comprariscas [quantia] : Para comprar iscas (Você tem que estar no mercado).");
		SendClientMessage(playerid, COLOR_WHITE, 				"/meuskin [id-da-skin] : Muda seu skin.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/advogado [local] : Solicita um advogado.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/meusseguros : Vê quantos seguros você possue.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/armas : Vê a lista de armas do RPG.");
        SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais comandos digite /comandos5");
		return 1;
	}
	if(strcmp(cmd, "/comandos5", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Comandos do RPG - Parte 5");
		SendClientMessage(playerid, COLOR_WHITE, 				"/SOS [local] : Chama uma ambulancia.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/pedirarma [ID/Nome da arma] : Pede uma arma.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/diskdroga [local] : Pede uma droga.");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Esses são os comandos do RPG");
		return 1;
	}
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Comandos do Banco");
        SendClientMessage(playerid, COLOR_WHITE, 				"/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_WHITE, 				"/sacar [quantia] : Retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_WHITE, 				"/saldo : Checa seu o saldo bancário..");
        SendClientMessage(playerid, COLOR_WHITE, 			    "/saldocell : Checa seu o saldo bancário através do seu celular, custo $20.");
        SendClientMessage(playerid, COLOR_JUIZ, 				"Você precisa estar em um banco para usar esses comandos, menos o /saldocell.");
        SendClientMessage(playerid, COLOR_JUIZ, 				"Bancos: Hotel, Car Shop, SF Train Station, SA Federal Mint, Fort Carson e Las Barrancas.");
		return 1;
	}
	if(strcmp(cmd, "/plantacoes", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Plantações disponíveis no [DT]Mega RPG");
        SendClientMessage(playerid, COLOR_WHITE,                "1 - Milho");
		SendClientMessage(playerid, COLOR_WHITE,		        "2 - Mandioca");
		SendClientMessage(playerid, COLOR_WHITE,			    "3 - Tomate");
		SendClientMessage(playerid, COLOR_WHITE,				"4 - Feijão");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Essas plantações só podem ser feitas nas fazendas por agricultores.");
		return 1;
	}
	if(strcmp(cmd, "/pizzas", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Pizzas disponíveis no [DT]Mega RPG");
		SendClientMessage(playerid, COLOR_WHITE, 				"0 - 4 queijos");
		SendClientMessage(playerid, COLOR_WHITE,				"1 - Calabresa");
		SendClientMessage(playerid, COLOR_WHITE,				"2 - Crocante");
		SendClientMessage(playerid, COLOR_WHITE,				"3 - Frango com Catupiry");
		SendClientMessage(playerid, COLOR_WHITE,				"4 - Strogonoff de Frango");
		SendClientMessage(playerid, COLOR_WHITE,				"5 - Portuguesa");
		SendClientMessage(playerid, COLOR_JUIZ,                 "Parece delicioso não? Se quiser uma peça para um entregador de pizza.");
		return 1;
	}
	if(strcmp(cmd, "/drogas", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Drogas disponíveis no [DT]Mega RPG");
        SendClientMessage(playerid, COLOR_WHITE,                "1 - Maconha");
		SendClientMessage(playerid, COLOR_WHITE,		        "2 - Cocaína");
		SendClientMessage(playerid, COLOR_WHITE,			    "3 - Heroína");
		SendClientMessage(playerid, COLOR_WHITE,				"4 - Crack");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Quer uma dessas? Fale com um traficante.");
		return 1;
	}
	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Profissões disponíveis no [DT]Mega RPG : Parte 1");
        SendClientMessage(playerid, COLOR_DESEMPREGADO,      	"1 - Desempregado (Salário: $350)");
        SendClientMessage(playerid, COLOR_TAXISTA,           	"2 - Taxista (Salário: $900)");
        SendClientMessage(playerid, COLOR_VENDEDOR,          	"3 - Vendedor de Carros (Salário: $200 + os carros que vender) - Limitada");
        SendClientMessage(playerid, COLOR_CORRETOR,          	"4 - Corretor de Imóveis (Salário: $200 + as casas que vender) - Limitada");
        SendClientMessage(playerid, COLOR_ASSASSINO,         	"5 - Assassino (Salário: O dinheiro de quem matar)");
        SendClientMessage(playerid, COLOR_BARMAN,            	"6 - Barman (Salário: $800 + as bebidas que vende)");
        SendClientMessage(playerid, COLOR_JUIZ,              	"7 - Juiz (Salário: $2000) - Limitada");
        SendClientMessage(playerid, COLOR_SEGURANÇA, 		 	"8 - Segurança (Salário: $800 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_WHITE, 				"Digite /profs2 para ver mais profissões.");
        return 1;
    }
    if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Profissões disponíveis no [DT]Mega RPG : Parte 2");
        SendClientMessage(playerid, COLOR_MOTORISTA, 		 	"9 - Motorista Particular (Salário: $850 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_COP_CIVIL,		 	"10 - Policial Civil (Salário: $1200) - Limitada");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO, 	 	"11 - Policial Rodoviario (Salário: $1500) - Limitada");
        SendClientMessage(playerid, COLOR_COP_ELITE, 		 	"12 - Policial Elite/SWAT (Salário: $3000) - Limitada");
        SendClientMessage(playerid, COLOR_EXERCITO, 		 	"13 - Exercito (Salário: $5000) - Limitada");
        SendClientMessage(playerid, COLOR_PESCADOR, 		 	"14 - Pescador (Salário: $750 + o que ganha na pesca)");
        SendClientMessage(playerid, COLOR_INSTRUTOR, 		 	"15 - Instrutor de Direção (Salário: $600 + habilitações) - Limitada");
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS, 	"16 - Vendedor de Armas (Salário: $1200 + armas) - Limitada");
		SendClientMessage(playerid, COLOR_WHITE, 				"Digite /profs3 para ver mais profissões.");
		return 1;
	}
    if(strcmp(cmd, "/profs3", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Profissões disponíveis no [DT]Mega RPG : Parte 3");
		SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS,  	"17 - Motorista de Ônibus (Salário: $900)");
		SendClientMessage(playerid, COLOR_AGRICULTOR, 		 	"18 - Agricultor (Salário: $700 + plantações)");
		SendClientMessage(playerid, COLOR_LADRAO_DE_CARROS,  	"19 - Ladrão de Carros (Salário: $600 + desmanches) - Limitada");
		SendClientMessage(playerid, COLOR_FRENTISTA, 		 	"20 - Frentista (Salário: $1000 + combustivel) - Limitada");
		SendClientMessage(playerid, COLOR_IBAMA, 		 	    "21 - IBAMA (Salário: $2500) - Limitada");
		SendClientMessage(playerid, COLOR_TRAFICANTE, 		 	"22 - Traficante (Salário: $900 + o que ganha vendendo drogas) - Limitada");
        SendClientMessage(playerid, COLOR_NARCOTICOS, 		 	"23 - Narcótico (Salário: $4000) - Limitada");
        SendClientMessage(playerid, COLOR_ASSALTANTE, 		 	"24 - Assaltante (Salário: $700 + assaltos) - Limitada");
        SendClientMessage(playerid, COLOR_WHITE, 				"Digite /profs4 para ver mais profissões.");
		return 1;
	}
	if(strcmp(cmd, "/profs4", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Profissões disponíveis no [DT]Mega RPG : Parte 4");
        SendClientMessage(playerid, COLOR_MECANICO,             "25 - Mecanico (Salário: $800 + consertos e pinturas)");
        SendClientMessage(playerid, COLOR_RECEITA_FEDERAL,      "26 - Receita Federal (Salário: $3000) - Limitada");
        SendClientMessage(playerid, COLOR_CONTRABANDISTA,       "27 - Contrabandista (Salário: $900 + contrabandos) - Limitada");
        SendClientMessage(playerid, COLOR_MEDICO,               "28 - Médico (Salário: $1000 + curativos)");
        SendClientMessage(playerid, COLOR_TRANSPORTE_VALORES, 	"29 - Transporte de Valores (Salário: $1600 + a bolsa de valores) - Limitada");
        SendClientMessage(playerid, COLOR_SEGURADOR, 		 	"30 - Segurador (Salário: $1200 + seguros) - Limitada");
        SendClientMessage(playerid, COLOR_ADVOGADO, 		 	"31 - Advogado (Salário: $1500 + casos) - Limitada");
        SendClientMessage(playerid, COLOR_PIZZA_BOY,            "32 - Entregador de Pizza (Salário: $800 + pizzas)");
        SendClientMessage(playerid, COLOR_WHITE, 				"Digite /profs5 para ver mais profissões.");
		return 1;
	}
	if(strcmp(cmd, "/profs5", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Profissões disponíveis no [DT]Mega RPG : Parte 5");
        SendClientMessage(playerid, COLOR_PROSTITUTA,           "33 - Prostituta (Salário: $3000 + trepadas) - Limitada");
        SendClientMessage(playerid, COLOR_LOCADOR_DE_CARROS,    "34 - Locador de Carros (Salário: $1500 + o dinheiro dos alugueis) - Limitada");
        SendClientMessage(playerid, COLOR_JORNALISTA,           "35 - Jornalista (Salário: $900 + anúncios e notícias)");
        SendClientMessage(playerid, COLOR_XERIFE, 	            "36 - Xerife (Salário: $4000) - Limitada");
        SendClientMessage(playerid, COLOR_WHITE, 				"Essas são as profissões do [DT]Mega RPG.");
		return 1;
	}
	if(strcmp(cmd, "/armas", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Armas.");
		SendClientMessage(playerid, COLOR_WHITE, 				"1 Brass Knuckles");
		SendClientMessage(playerid, COLOR_WHITE, 				"2 Golf Club");
		SendClientMessage(playerid, COLOR_WHITE, 				"3 Night Stick");
		SendClientMessage(playerid, COLOR_WHITE, 				"4 Knife");
		SendClientMessage(playerid, COLOR_WHITE, 				"5 Baseball Bat");
		SendClientMessage(playerid, COLOR_WHITE, 				"6 Shovel");
		SendClientMessage(playerid, COLOR_WHITE, 				"7 Pool cue");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais armas digite /armas2.");
        return 1;
	}
	if(strcmp(cmd, "/armas2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Armas - Parte 2.");
		SendClientMessage(playerid, COLOR_WHITE, 				"8 Katana");
		SendClientMessage(playerid, COLOR_WHITE, 				"9 Chainsaw");
		SendClientMessage(playerid, COLOR_WHITE, 				"10 Purple Dildo");
		SendClientMessage(playerid, COLOR_WHITE, 				"11 White Dildo");
		SendClientMessage(playerid, COLOR_WHITE, 				"12 Long White Dildo");
		SendClientMessage(playerid, COLOR_WHITE, 				"13 White Dildo 2");
		SendClientMessage(playerid, COLOR_WHITE, 				"14 Flowers");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais armas digite /armas3.");
        return 1;
	}
	if(strcmp(cmd, "/armas3", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 			    "Armas - Parte 3.");
		SendClientMessage(playerid, COLOR_WHITE,			    "15 Cane");
		SendClientMessage(playerid, COLOR_WHITE,			    "16 Grenades");
		SendClientMessage(playerid, COLOR_WHITE, 				"17 Tear Gas");
		SendClientMessage(playerid, COLOR_WHITE, 				"18 Molotovs");
		SendClientMessage(playerid, COLOR_WHITE, 				"22 Pistol");
		SendClientMessage(playerid, COLOR_WHITE, 				"23 Silenced Pistol");
		SendClientMessage(playerid, COLOR_WHITE, 				"24 Desert Eagle");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais armas digite /armas4.");
        return 1;
	}
	if(strcmp(cmd, "/armas4", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Armas - Parte 4.");
		SendClientMessage(playerid, COLOR_WHITE, 				"25 Shotgun");
		SendClientMessage(playerid, COLOR_WHITE, 				"26 Sawn Off Shotgun");
		SendClientMessage(playerid, COLOR_WHITE, 				"27 Combat Shotgun");
		SendClientMessage(playerid, COLOR_WHITE, 				"28 Micro Uzi (Mac 10)");
		SendClientMessage(playerid, COLOR_WHITE, 				"29 MP5");
		SendClientMessage(playerid, COLOR_WHITE, 				"30 AK47");
		SendClientMessage(playerid, COLOR_WHITE, 				"31 M4");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais armas digite /armas5.");
        return 1;
	}
	if(strcmp(cmd, "/armas5", true) == 0) {
		SendClientMessage(playerid, COLOR_JUIZ, 				"Armas - Parte 5.");
		SendClientMessage(playerid, COLOR_WHITE, 				"32 Tec9");
		SendClientMessage(playerid, COLOR_WHITE, 				"33 Rifle");
		SendClientMessage(playerid, COLOR_WHITE, 				"34 Sniper Rifle");
		SendClientMessage(playerid, COLOR_WHITE, 				"41 Spray Paint");
		SendClientMessage(playerid, COLOR_WHITE, 				"42 Fire Extinguisher");
		SendClientMessage(playerid, COLOR_WHITE, 				"43 Camera");
		SendClientMessage(playerid, COLOR_WHITE, 				"44 Nightvision Goggles");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Para mais armas digite /armas6.");
        return 1;
	}
	if(strcmp(cmd, "/armas6", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 				"Armas - Parte 6.");
		SendClientMessage(playerid, COLOR_WHITE, 				"45 Thermal Goggles");
		SendClientMessage(playerid, COLOR_WHITE, 				"46 Parachute");
		SendClientMessage(playerid, COLOR_JUIZ, 				"Essas são as armas do [DT]Mega RPG.");
		return 1;
	}
	if(strcmp(cmd, "/cellinfo", true) == 0) {
	    SendClientMessage(playerid, COLOR_JUIZ,                 "Informações de celular:");
	    SendClientMessage(playerid, COLOR_WHITE,                "/SMS [id] [mensagem] : Envia uma SMS para um jogador (Custo: $5)");
	    SendClientMessage(playerid, COLOR_WHITE, 				"/ligar [id] : Ligar do celular pra alguem.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/atender : Para atender o celular.");
		SendClientMessage(playerid, COLOR_WHITE, 				"/desligar : Para desligar o celular.");
		SendClientMessage(playerid, COLOR_JUIZ,                 "O celular é a única maneira de mandar mensagens privadas para outros jogadores.");
		SendClientMessage(playerid, COLOR_JUIZ,                 "Cuidado, não fique jogando papo fora pois o seu dinheiro está em risco de se esgotar!");
		return 1;
	}
	if(strcmp(cmd, "/sms", true) == 0)
	{
	   new tmp[256];
	   new plid;
	   new msg[256];
	   new o[256];
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/sms [id] [mensagem]");
	   return 1;
	   }
	   if(plid < 10){
	   strmid(o,cmdtext, 6, strlen(cmdtext));
	   }
	   else if(plid > 10 && plid < 100){
	   strmid(o,cmdtext, 7, strlen(cmdtext));
	   }
	   else{
	   strmid(o,cmdtext, 8, strlen(cmdtext));
	   }
	   if(GetPlayerMoney(playerid) < 5){
	   SendClientMessage(playerid, COLOR_RED, "Você não possue dinheiro para mandar uma SMS");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   GivePlayerMoney(playerid,0 - 5);
	   SendClientMessage(playerid, COLOR_GREEN, "SMS enviada");
	   format(msg,sizeof(msg),"SMS enviada por %s.",PlayerName(playerid));
       SendClientMessage(plid,COLOR_ADVOGADO,msg);
       SendClientMessage(plid,COLOR_ADVOGADO,o);
       return 1;
       }
	}
	if(strcmp(cmd, "/ligar", true) == 0)
		{
		new tmp[256];
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/ligar [id]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if (GetPlayerMoney(playerid) < CallCost)
		{
			SendClientMessage(playerid, COLOR_RED, "Voce não tem dinheiro para uma ligação");
			return 1;
		}

		if (giveplayerid == playerid)
		{
		    SendClientMessage(playerid, COLOR_RED, "Você não pode ligar para voce mesmo");
		    return 1;
		}
		if (!(IsPlayerConnected(giveplayerid)))
		{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado");
		    return 1;
		}
		if (Calling[playerid] > -1)
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "Agora espere para ver se %s atende a chamada!", giveplayer);
			SendClientMessage(playerid, COLOR_COP_ELITE, string);
			return 1;
		}
		if (Calling[giveplayerid] > -1)
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "%s ja está no telefone, tente mais tarde.", giveplayer);
			SendClientMessage(playerid, COLOR_RED, string);
			return 1;
		}
		else
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s esta te ligando digite /atender para atender o celular ou /desligar para desligar o celular", sendername);
		SendClientMessage(giveplayerid,	COLOR_RED, string);
		format(string, sizeof(string), "Você está falando com %s", giveplayer);
		SendClientMessage(playerid, COLOR_COP_ELITE, string);
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
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
		    SendClientMessage(playerid, COLOR_RED, "Voce deve estar logado para atender uma chamada de telefone");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOR_RED, "Ninguem está te ligando");
		    return 1;
		}
		if (Answered[playerid] == 1)
		{
		    SendClientMessage(playerid, COLOR_RED, "Voce ja esta no telefone");
		    return 1;
		}
		else
		GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s esta te chamando", sendername);
		SendClientMessage(Calling[playerid], COLOR_GREEN, string);
		format(string, sizeof(string), "Você aceitou a chamada de %s!", giveplayer);
        SendClientMessage(playerid, COLOR_GREEN, string);
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
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
		    SendClientMessage(playerid, COLOR_RED, "Voce deve estar logado para desligar uma chamada");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOR_RED, "Voce não esta no celular");
		    return 1;
		}
		else
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s Desligou o telefone", sendername);
			SendClientMessage(Calling[playerid], COLOR_RED, string);
			format(string, sizeof(string), "Voce desligou a chamada com %s", giveplayer);
			SendClientMessage(playerid, COLOR_RED, string);
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
	if(strcmp(cmd, "/meusseguros", true) == 0) {
	  if(seguro[playerid] > 0){
	   new string[256];
	   format(string,sizeof(string),"Você possue %d seguro(s)",seguro[playerid]);
	   SendClientMessage(playerid, COLOR_JUIZ, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não possue nenhum seguro.");
		   return 1;
		   }
	}
	if(strcmp(cmd, "/apostar", true)==0){
		new tmp[256];
		new val;
		tmp = strtok(cmdtext,idx);
		val = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COLOR_WHITE, "/apostar [numero]");
		return 1;
		}
		if(AreaBanco[playerid] == 1){
		if(aposta[playerid] == 0){
		if(val <= 20){
		if(GetPlayerMoney(playerid) >= 100){
		numeroapostado[playerid] = val;
		aposta[playerid] = 1;
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
	if(strcmp(cmd, "/advogado", true) == 0) {
	   new tmp[256];
	   strmid(tmp, cmdtext, 9, strlen(cmdtext));
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/advogado [local]");
	   return 1;
	   }
	   for(new i=0; i<MAX_PLAYERS; i++){
	   if(Profissao[i] == ADVOGADO || IsPlayerAdmin(i)){
	   new string[256];
	   format(string,sizeof(string),"%s está pedindo um advogado. Local:%s",PlayerName(playerid),tmp);
	   SendClientMessage(i, COLOR_JUIZ, string);
	   SendClientMessage(playerid, COLOR_JUIZ, "Advogado solicitado.");
	   return 1;
	   }
	}
 }
	if(strcmp(cmd, "/meuskin", true) == 0) {
	   new tmp[256];
	   new skin;
	   tmp = strtok(cmdtext,idx);
	   skin = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/meuskin [id-da-skin]");
	   return 1;
	   }
	   if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
	      SendClientMessage(playerid, COLOR_RED, "ID da skin inválido!");
	      return 1;
	   }
	   else{
	   udb_setSkin(PlayerName(playerid),skin);
	   SetPlayerSkin(playerid,skin);
	   SendClientMessage(playerid, COLOR_JUIZ, "Sua skin foi mudada.");
	   return 1;
	   }
	}
	if (strcmp(cmd, "/taxi", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/taxi [aonde]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_JUIZ, "Os taxistas foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TAXISTA || Rastreador[i] == playerid){
					format(string, sizeof(string), "%s pede um taxi. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_WHITE, string);
		        }
			}
			return 1;
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
		    SendClientMessage(playerid, COLOR_COP_ELITE, "Os policiais foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == COP_CIVIL || Profissao[i] == EXERCITO || Profissao[i] == XERIFE || Profissao[i] == NARCOTICOS || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}
	
	if (strcmp(cmd, "/sair", true)==0){
	   if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
	  	 RemovePlayerFromVehicle(playerid);
	  	 TogglePlayerControllable(playerid,1);
	  	 return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo nenhum veiculo.");
		   return 1;
		   }
	}
	if (strcmp(cmd, "/SOS", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/SOS [local]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_COP_ELITE, "Os médicos foram informados.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == MEDICO || Rastreador[i] == playerid){
					format(string, sizeof(string), "%s está pedindo uma ambulancia. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}
	
	if (strcmp(cmd, "/diskdroga", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 10, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/diskdroga [local]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_COP_ELITE, "Os traficantes foram informados.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TRAFICANTE || Rastreador[i] == playerid){
					format(string, sizeof(string), "%s está pedindo uma droga. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}
	
	if (strcmp(cmd, "/pedirarma", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 10, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pedirarma [ID/Nome da arma]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_COP_ELITE, "Arma solicitada.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == VENDEDOR_DE_ARMAS){
					format(string, sizeof(string), "%s esta pedindo uma arma: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}

	if (strcmp(cmdtext, "/trancar", true)==0){
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COLOR_JUIZ, "Veículo Trancado");
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo nenhum veiculo!");
			return 1;
		}
	}

	if (strcmp(cmdtext, "/destrancar", true)==0){
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
				}
			}
			SendClientMessage(playerid, COLOR_JUIZ, "Veículo Destrancado");
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo nenhum veiculo!");
			return 1;
		}
	}
    if(strcmp(cmd, "/hotel", true) == 0) {
	   if(AreaHotel[playerid] == 1){
	   if(GetPlayerMoney(playerid) >= 1500){
       new Float:X, Float:Y, Float:Z;
       new Float:ang;
	   GetPlayerPos(playerid, X, Y, Z);
	   GetPlayerFacingAngle(playerid,ang);
	   udb_setPosition(PlayerName(playerid), X, Y, Z);
       udb_setAng(PlayerName(playerid),ang);
       GivePlayerMoney(playerid,0-1500);
       SendClientMessage(playerid, COLOR_WHITE, "Você se hospedou em um hotel. Ele poderá ser útil até você comprar uma casa");
       return 1;
       }
       else{
		   SendClientMessage(playerid, COLOR_RED,"Você não possue dinheiro para se hospedar.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não esta em um hotel.");
		   return 1;
		   }
	}
	if(strcmp(cmd, "/transferir", true) == 0) {
		new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id-do-jogador] [quantidade]");
			return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id-do-jogador] [quantidade]");
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
				SendClientMessage(playerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Você recebeu $%d de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_WHITE, string);
			}
			else {
				SendClientMessage(playerid, COLOR_RED, "Valor inválido.");
			}
		}
		else {
			format(string, sizeof(string), "%d não está online.", giveplayerid);
			SendClientMessage(playerid, COLOR_WHITE, string);
		}
		return 1;
	}

    if(strcmp(cmd, "/depositar", true) == 0) {
		new tmp[256];
		new quantidade;
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
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_WHITE, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_WHITE, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint, Fort Carson e Las Barrancas.");
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
		    SendClientMessage(playerid, COLOR_RED, "Você não tem essa quantidade no banco");
			return 1;
		}
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Você retirou $%d do banco. seu saldo atual é de $%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_WHITE, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_WHITE, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint, Fort Carson e Las Barrancas.");
			return 1;
		}
	}

    if(strcmp(cmd, "/saldo", true) == 0) {
		new string[256];
        if(AreaBanco[playerid] == 1){
			format(string, sizeof(string), "Você tem %d na conta %d", udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COLOR_JUIZ, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_WHITE, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_WHITE, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint, Fort Carson e Las Barrancas.");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/saldocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 20){
            SendClientMessage(playerid, COLOR_RED, "Custo: $20");
			return 1;
		}
		else{
		    GivePlayerMoney(playerid, 0 - 20);
			format(string, sizeof(string), "Mensagem de Celular: Você tem %d na conta %d", udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
		}
	}

    if(strcmp(cmd, "/abastecer", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "Uso: /abastecer [litros]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || GetPlayerMoney(playerid) < quantidade){
	        SendClientMessage(playerid, COLOR_RED, "Você não tem dinheiro para pagar. Ou você está querendo tirar gasolina do carro.");
			return 1;
		}
		if(AreaPosto[playerid] == 1){
			if(quantidade + Petrol[playerid] < 100){
			    Petrol[playerid] = quantidade;
			    format(string, sizeof(string), "Você abasteceu %d litros de combustível.", quantidade);
				SendClientMessage(playerid, COLOR_JUIZ, string);
				GivePlayerMoney(playerid, - quantidade);
				return 1;
			}
			if(quantidade + Petrol[playerid] >= 100){
			    new quantia;
			    quantia = 100 - Petrol[playerid];
			    Petrol[playerid] = 100;
				format(string, sizeof(string), "Seu tanque ficou completo. Colocamos %d litros.", quantia);
				SendClientMessage(playerid, COLOR_JUIZ, string);
				GivePlayerMoney(playerid, - quantia);
				return 1;
				}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não está no posto, consulte o mapa no fórum para saber sua localização");
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
        if(Profissao[plid] == VENDEDOR_DE_CARROS || Profissao[plid] == CORRETOR){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COLOR_RED, "Você não tem esse dinheiro! Ou não está querendo pagar de forma justa.");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/10);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_JUIZ, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COLOR_JUIZ, string);
				return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
				return 1;
			}
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COLOR_RED, "Você está tentando pagar a alguem que não é coretoe e nem vendedor!");
			return 1;
		}
	}

	if(strcmp(cmd, "/mostrardocs", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[3];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Documentos mostrados.");
			return 1;
		}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
		    hab[0] = udb_gethabterre(PlayerName(playerid));
		    hab[1] = udb_getHabnauti(PlayerName(playerid));
		    hab[2] = udb_getHabaerea(PlayerName(playerid));
			format(string, sizeof(string), "Identidade de: %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_WHITE, string);
			format(string, sizeof(string), "Skin :: %d", udb_getSkin(PlayerName(playerid)));
			SendClientMessage(plid, COLOR_WHITE, string);
			if(hab[0] == 0){
			    SendClientMessage(plid, COLOR_RED, "Habilitação de Carros e Motos: NÃO");
			}
			if(hab[0] == 1){
			    SendClientMessage(plid, COLOR_COP_ELITE, "Habilitação de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(plid, COLOR_RED, "Habilitação Náutica: NÃO");
			}
			if(hab[1] == 1){
			    SendClientMessage(plid, COLOR_COP_ELITE, "Habilitação Náutica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(plid, COLOR_RED, "Habilitação Aérea: NÃO");
			}
			if(hab[2] == 1){
			    SendClientMessage(plid, COLOR_COP_ELITE, "Habilitação Aérea: SIM");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "esse jogador nao existe");
		}
		return 1;
	}
    if(strcmp(cmd, "/fianca", true) == 0) {
		Presos[playerid] = 0;
		udb_setPrisao(PlayerName(playerid), 0);
		LogarPlayer(playerid);
		SendClientMessage(playerid, COLOR_WHITE, "Você pagou a fiança no valor de $1500 e foi solto.");
		udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 1500);
		return 1;
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
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, GetPlayerColor(playerid), string);
					SendClientMessage(playerid, GetPlayerColor(playerid), string);
					return 1;
				}
			}
		}
	}
	if (strcmp(cmdtext, "/presos", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_JUIZ, "Lista de presos");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Presos[i] == 1){
				format(string, sizeof(string), "%d: %s", i, PlayerName(i));
				SendClientMessage(playerid, COLOR_WHITE, string);
				return 1;
			}
		}
	}

	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_WHITE, "Lista de procurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Procurados[i] == 1){
				format(string, sizeof(string), "%d: %s", i, PlayerName(i));
				SendClientMessage(playerid, COLOR_WHITE, string);
				return 1;
			}
		}
	}
	
	if (strcmp(cmdtext, "/rastreamentos", true)==0){
	  if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
		new string[256];
	    SendClientMessage(playerid, COLOR_WHITE, "Rastreamentos dos Narcóticos");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Rastreamento[i] == 1){
				format(string, sizeof(string), "ID: %d | Nome: %s | Vítima de rastreamento: %s", i, PlayerName(i), PlayerName(Rastreador[playerid]));
				SendClientMessage(playerid, COLOR_WHITE, string);
				return 1;
			    }
		   }
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
			printf("%s tentou ver a lista de rastreamentos dos narcóticos mas não tinha permissão!",PlayerName(playerid));
			return 1;
			}
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
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_EXERCITO, string);
					SendClientMessage(playerid, COLOR_EXERCITO, string);
					return 1;
				}
			}
		}
	}
	if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "São %d:00 horas na região de SF", worldTime);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}
	
//------------------------- FIM DOS COMANDOS PARA TODOS OS PLAYERS -----------//

//------------------------- COMANDOS DE INSTRUTOR ----------------------------//

    if(strcmp(cmd, "/autorizar", true) == 0) {
        if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
            new tmp[256];
            new plid;
            tmp = strtok(cmdtext,idx);
            plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/autorizar [id]");
			    return 1;
			}
			if(!IsPlayerConnected(plid)){
				SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
				return 1;
			}
			if(autorizacao[plid] == 1){
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador já esta autorizado a usar os veículos da auto-escola.");
			    return 1;
			}
			else{
			    autorizacao[plid] = 1;
			    SendClientMessage(playerid, COLOR_JUIZ, "Autorização feita!");
			    SendClientMessage(plid, COLOR_JUIZ, "Você foi autorizado à usar os veículos da auto-escola.");
				for(new i=0; i<MAX_PLAYERS; i++){
					if(IsPlayerAdmin(i)){
					    new string[256];
					    format(string,sizeof(string),"%s foi autorizado a usar os veículos da auto-escola por %s.",PlayerName(plid),PlayerName(playerid));
						SendClientMessage(i, COLOR_WHITE, string);
					}
				}
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão!");
		    return 1;
		    }
	}
	if(strcmp(cmd, "/desautorizar", true) == 0) {
        if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
            new tmp[256];
            new plid;
            tmp = strtok(cmdtext,idx);
            plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/desautorizar [id]");
			    return 1;
			}
			if(!IsPlayerConnected(plid)){
				SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
				return 1;
			}
			if(autorizacao[plid] == 0){
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador já está desautorizado à usar os veículos da auto-escola.");
			    return 1;
			}
			else{
			    autorizacao[plid] = 0;
			    SendClientMessage(playerid, COLOR_JUIZ, "Desautorização feita!");
			    SendClientMessage(plid, COLOR_JUIZ, "Você foi desautorizado à usar os veículos da auto-escola.");
				for(new i=0; i<MAX_PLAYERS; i++){
					if(IsPlayerAdmin(i)){
					    new string[256];
					    format(string,sizeof(string),"%s foi desautorizado a usar os veículos da auto-escola por %s.",PlayerName(plid),PlayerName(playerid));
						SendClientMessage(i, COLOR_WHITE, string);
					}
				}
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão!");
		    return 1;
		    }
	}
	if(strcmp(cmd, "/aerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/aerea [id].");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_JUIZ, "Habilitação de direção aerea concedida.");
			    SendClientMessage(plid, COLOR_JUIZ, "Você recebeu a habilitação de direção aerea.");
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
	}


	if(strcmp(cmd, "/terrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/terrestre [id].");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_JUIZ, "Habilitação de direção terrestre concedida.");
			    SendClientMessage(plid, COLOR_JUIZ, "Você recebeu a habilitação de direção de carros e motos.");
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
	}

	if(strcmp(cmd, "/nautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/nautica [id].");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_JUIZ, "Habilitação de direção náutica concedida.");
			    SendClientMessage(plid, COLOR_JUIZ, "Você recebeu a habilitação de direção náutica.");
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
	}

//------------------------- FIM DOS COMANDOS DE INSTRUTOR --------------------//

//------------------------- COMANDOS DE TRANSPORTE DE VALORES ----------------//

	if(strcmp(cmd,"/pegarvalores",true) == 0) {
	   if(Profissao[playerid] == TRANSPORTE_VALORES || IsPlayerAdmin(playerid)){
	   if(IsPlayerInAnyVehicle(playerid)){
	   if(GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_CARROFORTE){
	   if(AreaForte[playerid] == 1){
	   if(bolsavalores[GetPlayerVehicleID(playerid)] == 0){
	   bolsavalores[GetPlayerVehicleID(playerid)] = 1;
	   SendClientMessage(playerid, COLOR_JUIZ, "Bolsa de valores pega transporte ela para um banco.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "A Bolsa de valores desse veiculo já foi pega.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está na area forte.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não está em um Carro Forte.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você tem que estar em um veiculo.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    
    if(strcmp(cmd,"/entregarvalores",true) == 0) {
      if(Profissao[playerid] == TRANSPORTE_VALORES || IsPlayerAdmin(playerid)){
		 if(AreaBanco[playerid] == 1){
		 if(IsPlayerInAnyVehicle(playerid)){
	     if(GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_CARROFORTE){
		 if(bolsavalores[GetPlayerVehicleID(playerid)] == 1){
		 GivePlayerMoney(playerid,1200);
		 bolsavalores[GetPlayerVehicleID(playerid)] = 0;
		 SendClientMessage(playerid, COLOR_JUIZ, "Bolsa de valores entregue o banco lhe pagou $1200 pelo trabalho.");
		 return 1;
		 }
		 else{
			 SendClientMessage(playerid, COLOR_RED, "Este veiculo não possue bolsa de valores.");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COLOR_RED, "Você não está em um Carro Forte.");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COLOR_RED, "Você não está em um veiculo.");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COLOR_RED, "Você não está no banco.");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
			 return 1;
			 }
    }

//------------------------- COMANDOS DE JORNALISTA ---------------------------//

	if(strcmp(cmd,"/noticia", true) == 0) {
	  if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   strmid(tmp,cmdtext,8,strlen(cmdtext));
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/noticia [texto]");
	   return 1;
	   }
	   new string[256];
	   format(string,sizeof(string),"Notícia publicada por %s:",PlayerName(playerid));
	   SendClientMessageToAll(COLOR_WHITE,string);
	   SendClientMessageToAll(COLOR_JORNALISTA,tmp);
	   SendClientMessage(playerid, COLOR_JUIZ, "Notícia publicada com sucesso.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/publicar", true) == 0) {
	  if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   strmid(tmp,cmdtext,9,strlen(cmdtext));
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/publicar [texto]");
	   return 1;
	   }
	   new msg[256];
	   format(msg,sizeof(msg),"Anúncio publicado por %s",PlayerName(playerid));
	   SendClientMessageToAll(COLOR_JUIZ, msg);
	   GameTextForAll(tmp,5000,0);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }

//------------------------- COMANDOS DE POLICIAL -----------------------------//

	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == JUIZ || Profissao[playerid] == RECEITA_FEDERAL || Profissao[playerid] == NARCOTICOS || Profissao[playerid] == EXERCITO || Profissao[playerid] == IBAMA || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new distancia;
	    	new string[256];
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/prender [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(distancia > 10){
			        SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				else{
    				udb_setPrisao(PlayerName(plid), 1);
					SetSpawnInfo(plid, 1, udb_getSkin(PlayerName(plid)), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
					SetPlayerPos(plid, 262.9540, 78.4339, 1002.0391);
					format(string, sizeof(string), "Você foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEGURANÇA, string);
			    	SendClientMessage(playerid, COLOR_JUIZ, "Prisão concluida");
					return 1;
				}
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != JUIZ || Profissao[playerid] != RECEITA_FEDERAL || Profissao[playerid] != NARCOTICOS || Profissao[playerid] != EXERCITO || Profissao[playerid] != IBAMA || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}

    

	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == XERIFE || Profissao[playerid] == EXERCITO || Profissao[playerid] == IBAMA || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/soltar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    Presos[playerid] = 0;
			    udb_setPrisao(PlayerName(plid), 0);
			    LogarPlayer(plid);
			    SendClientMessage(plid, COLOR_JUIZ, "Algum juiz te soltou.");
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != XERIFE || Profissao[playerid] != EXERCITO || Profissao[playerid] != IBAMA || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
    if (strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == NARCOTICOS || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "/procurar [id].");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 1;
				SendClientMessage(playerid, COLOR_JUIZ, "Mais um para você perseguir agora.");
				format(string, sizeof(string), "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_JUIZ, string);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != NARCOTICOS || Profissao[playerid] != EXERCITO || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}

	if (strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == NARCOTICOS || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id].");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 0;
				SendClientMessage(playerid, COLOR_JUIZ, "Excluido da lista com suscesso.");
				SendClientMessage(plid, COLOR_JUIZ, "Você foi retirado da lista de procurados");
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != NARCOTICOS || Profissao[playerid] != EXERCITO || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}



	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new quant;
	    	new string[256];
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
				format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s. O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_JUIZ, string);
				SendClientMessage(playerid, COLOR_JUIZ, "Multa dada.");
				udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quant);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != EXERCITO || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == NARCOTICOS || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
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
					SendClientMessage(playerid, COLOR_WHITE, string);
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != NARCOTICOS || Profissao[playerid] != EXERCITO || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
//--------------------------- FIM DOS COMANDOS DE POLICIAL ------------------//

//--------------------------- COMANDOS DE LADRÃO DE CARROS ------------------//

	if(strcmp(cmd, "/desmanchar", true) == 0){
	  if(Profissao[playerid] == LADRAO_DE_CARROS || IsPlayerAdmin(playerid)){
	   new veiculo;
	   veiculo = GetPlayerVehicleID(playerid);
	   if(IsPlayerInVehicle(playerid,veiculo)){
	   if(AreaDesmanche[playerid] == 1){
	   if(desmanche[playerid] == 0){
	   SendClientMessage(playerid, COLOR_JUIZ, "Veiculo desmanchado você recebeu $1500 pelo trabalho.");
	   DestroyVehicle(veiculo);
	   GivePlayerMoney(playerid,1500);
	   desmanche[playerid] = 1;
	   SetTimerEx("TempoDesmanche",600000,1,"d",playerid);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você ja desmanchou um veiculo espere mais um tempo para desmanchar outro.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não esta no desmanche.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não esta em um veiculo!");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão");
		   return 1;
		   }
	}
//--------------------------- COMANDOS DE VENDEDOR DE ARMAS -----------------//
	if(strcmp(cmd,"/sellarma",true) == 0) {
	  if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid,weaponid,municao;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COLOR_RED, "/sellarma [id] [id da arma] [munição]");
	  return 1;
	  }
	  tmp = strtok(cmdtext,idx);
	  weaponid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COLOR_RED, "/sellarma [id] [id da arma] [munição]");
	  return 1;
	  }
	  tmp = strtok(cmdtext,idx);
	  municao = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COLOR_RED, "/sellarma [id] [id da arma] [munição]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
	  if(weaponid > 0 && weaponid < 47 && weaponid != 35 && weaponid != 36 && weaponid != 37 && weaponid != 38 && weaponid != 39 && weaponid != 40){
	  GivePlayerWeapon(plid,weaponid,municao);
	  SendClientMessage(playerid, COLOR_JUIZ, "Arma vendida");
	  new string[256];
	  format(string,sizeof(string),"Você recebeu uma arma de %s",PlayerName(playerid));
	  SendClientMessage(plid, COLOR_JUIZ, string);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Arma inválida!");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		  return 1;
		  }
	}
	if(strcmp(cmd,"/colete",true) == 0) {
	  if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/colete [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   SetPlayerArmour(plid,100);
	   SendClientMessage(playerid, COLOR_JUIZ, "Colete vendido");
	   SendClientMessage(plid, COLOR_JUIZ, "Você recebeu um colete");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão");
		   return 1;
		   }
	}
	
//--------------------------- COMANDOS DE ADMINISTRADORES -------------------//
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
		if(!IsPlayerInAnyVehicle(playerid)){
		new Float:X,Float:Y,Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		CreateVehicle(carid,X,Y,Z,0,1,1,-1);
		SendClientMessage(playerid, COLOR_AZULCLARO, "Veiculo criado");
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
	if(strcmp(cmd, "/setjob", true) == 0 && IsPlayerConnected(playerid)) {
	 if(IsPlayerAdmin(playerid)){
	    new tmp[256];
	    new plid;
	    new prof;
	    new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/setjob [id] [prof]");
			return 1;
		}
        plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/setjob [id] [prof]");
			return 1;
		}
        prof = strval(tmp);
        if(IsPlayerConnected(plid)){
            if(prof >= 1 && prof <= MAX_PROFS){
				udb_setProf(PlayerName(plid), prof);
				SetPlayerSkin(plid,SkinProf[prof]);
				udb_setSkin(PlayerName(plid),SkinProf[prof]);
				format(string, sizeof(string), "Você mudou a profissão de %s para %d", PlayerName(plid), prof);
				SendClientMessage(playerid, COLOR_SEGURANÇA, string);
				SendClientMessage(plid, COLOR_SEGURANÇA, "Você mudou de profissão, digite /profissao.");
				LogarPlayer(plid);
	        }
			else{
			    SendClientMessage(playerid, COLOR_RED, "Essa não é uma profissão válida!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
			return 1;
		}
	}
	
//--------------------------- FIM DOS COMANDOS DE ADMINISTRADORES ------------//
	
	
//------------------- COMANDO PARA VER OS COMANDOS DA SUA PROFISSAO ---------//

	if (strcmp(cmdtext, "/profissao", true)==0){
		if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Taxista");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Vendedor de carros");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/setcar [id do carro] [id do comprador] [cor1] [cor2] : Vende um carro para um jogador.");
			SendClientMessage(playerid, COLOR_WHITE, "/setskin [id-da-pessoa] [id-do-skin] : Vende um skin para alguma pessoa.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Corretor de imóveis");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/sethome [nick] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Barman");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		else if(Profissao[playerid] == ASSALTANTE) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Assaltante");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/roubar [id] : Rouba um jogador levando $200.");
			SendClientMessage(playerid, COLOR_WHITE, "/assaltar : Assalta um banco ou mercado.");
			SendClientMessage(playerid, COLOR_WHITE, "/roubarbolsa : Rouba a bolsa de valores de um Carro Forte.");
		}
		else if(Profissao[playerid] == PESCADOR) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Pescador");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COLOR_WHITE, "/pescar : Começa a pescar (Você tem que estar na area de pesca).");
			SendClientMessage(playerid, COLOR_WHITE, "/sellpeixes : Vende seus peixes (Você tem que estar no mercado).");
			SendClientMessage(playerid, COLOR_WHITE, "/meuspeixes : Vê quantos peixes você possue.");
			SendClientMessage(playerid, COLOR_WHITE, "/minhasiscas : Vê quantas iscas você possue.");
			SendClientMessage(playerid, COLOR_WHITE, "/comprariscas [quantia] : Para comprar iscas (Você tem que estar no mercado).");
			SendClientMessage(playerid, COLOR_JUIZ, "Agora que você é pescador receberá o dobro do dinheiro por cada peixe vendido do que qualquer um que pescar.");
			SendClientMessage(playerid, COLOR_JUIZ, "Boa sorte na pescaria e bom trabalho.");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Juiz");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar [id] : Solta uma pessoa da cadeia.");
		}
		else if(Profissao[playerid] == JORNALISTA) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Jornalista");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/noticia [texto] : Publica uma notícia.");
			SendClientMessage(playerid, COLOR_WHITE, "/publicar [texto] : Publica um anúncio.");
		}
		else if(Profissao[playerid] == LOCADOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Locador de Carros");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/locar [id] [tempo] : Aluga um carro para um jogador por um certo tempo (em minutos).");
		}
		else if(Profissao[playerid] == ASSASSINO) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Assassino");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_JUIZ, "Sua profissão não tem nenhum comando especial!");
			SendClientMessage(playerid, COLOR_JUIZ, "Agora você é um assassino ou seja deverá matar os outros para ganhar dinheiro e fugir da policia.");
		}
		else if(Profissao[playerid] == IBAMA) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - IBAMA");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/piracema : Para ativar e desativar a piracema.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende quem estiver pescando fora da época.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar [id] : Tira alguém da prisão.");
			SendClientMessage(playerid, COLOR_WHITE, "/confiscarpeixes [id] : Confisca os peixes de um jogador.");
			SendClientMessage(playerid, COLOR_JUIZ, "Quando a piracema estiver ativada tente ir dar uma passada na area de pesca para ver quem está pescando.");
			SendClientMessage(playerid, COLOR_JUIZ, "OBS: Quando a piracema estiver aberta os pescadores irão ganhar $300 a mais de salário.");
		}
		else if(Profissao[playerid] == COP_CIVIL) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Policial Civil");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Policial Rodoviário");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Policial Elite/SWAT");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == EXERCITO) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Exercito");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == XERIFE) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Xerife");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == NARCOTICOS) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Narcótico");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/examead [id] : Realiza um exame anti-drogas em um jogador.");
			SendClientMessage(playerid, COLOR_WHITE, "/rastrear [id] : Faz rastreamento em um jogador (Use esse comando apenas para descobrir quem usa o /diskdroga).");
			SendClientMessage(playerid, COLOR_WHITE, "/rastreamentos : Vê os rastreamentos feitos por outros narcóticos.");
			SendClientMessage(playerid, COLOR_WHITE, "/desativarrastreador : Desativa seu rastreador.");
		}
		else if(Profissao[playerid] == TRAFICANTE) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Traficante");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/selldroga [id] [id da droga] [doses] : Vende droga para algum jogador.");
			SendClientMessage(playerid, COLOR_WHITE, "/meusbagulhos : Verifica quantos bagulhos você possue.");
			SendClientMessage(playerid, COLOR_WHITE, "/comprarbagulho [quantidade] : Compra bagulhos (Você tem que estar na area de tráfico).");
			SendClientMessage(playerid, COLOR_JUIZ, "Você deve ter bagulhos da quantidade da dose ou mais caso não tenha não terá como vender as drogas.");
			SendClientMessage(playerid, COLOR_JUIZ, "Para saber os ids das drogas digite /drogas.");
			SendClientMessage(playerid, COLOR_JUIZ, "Bom tráfico e bom trabalho.");
			return 1;
		}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Instrutor de direção");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/aerea [id] : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COLOR_WHITE, "/terrestre [id] : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_WHITE, "/nautica [id] : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
			SendClientMessage(playerid, COLOR_WHITE, "/autorizar [id] : Autoriza um jogador à usar os veículos da auto-escola.");
			SendClientMessage(playerid, COLOR_WHITE, "/desautorizar [id] : Desautoriza um jogador à usar os veículos da auto-escola.");
			SendClientMessage(playerid, COLOR_JUIZ, "Autorize os jogadores à usar os veículos da auto-escola na hora de fazer o teste.");
			SendClientMessage(playerid, COLOR_JUIZ, "Depois que o teste acabar, não esqueça de desautorizar o jogador!");
		}
		else if(Profissao[playerid] == PIZZA_BOY) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Entregador de Pizza");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/pegarpizza [quantia] : Aplica pizzas em sua moto de pizza (Você tem que estar na pizzaria).");
			SendClientMessage(playerid, COLOR_WHITE, "/sellpizza [id] [sabor] : Vende uma pizza para um jogador.");
			SendClientMessage(playerid, COLOR_WHITE, "/verpizzas : Verifica quantas pizzas sua moto de pizza possue.");
			SendClientMessage(playerid, COLOR_JUIZ, "Agora você terá que pegar as motos de pizzas e enchendo elas de pizzas pois se acabar você não irá conseguir vender.");
			SendClientMessage(playerid, COLOR_JUIZ, "Para ver os sabores de pizza digite /pizzas.");
		}
		else if(Profissao[playerid] == LADRAO_DE_CARROS) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Ladrão de carros");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/desmanchar : Desmancha um veiculo (Você tem que estar no desmanche).");
			SendClientMessage(playerid, COLOR_JUIZ, "O ponto de encontro onde você deverá entregar os carros é localizado ao lado da ammu-nation");
			SendClientMessage(playerid, COLOR_JUIZ, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == SEGURADOR) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Segurador");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/venderseguros [id] [quantidade] : Vende seguros de vida para um jogador.");
			SendClientMessage(playerid, COLOR_WHITE, "/verseguros : Vê os jogadores que possuem seguros.");
		}
		else if(Profissao[playerid] == MEDICO) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Ladrão de carros");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/curar [id] : Aplica um curativo em alguém (Você tem que ter um Kit Médico).");
			SendClientMessage(playerid, COLOR_WHITE, "/pegarkit : Pega o Kit Médico para poder curar alguém (Você tem que estar no hospital).");
		}
		else if(Profissao[playerid] == TRANSPORTE_VALORES) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Transporte de Valores");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/pegarvalores : Pega a bolsa de valores de um carro forte (Você tem que estar na area forte).");
			SendClientMessage(playerid, COLOR_WHITE, "/entregarvalores : Entrega a bolsa de valores de um carro forte (Você tem que estar no banco).");
			SendClientMessage(playerid, COLOR_JUIZ, "Seu objetivo agora é transportar a bolsa de valores dos carros fortes para os bancos.");
			SendClientMessage(playerid, COLOR_JUIZ, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == FRENTISTA) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Frentista");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/vendergas [id] [litros] : Vende combustível para alguém.");
		}
		else if(Profissao[playerid] == CONTRABANDISTA) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Contrabandista");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/contrabandodroga : Começa a fazer um contrabando de drogas.");
			SendClientMessage(playerid, COLOR_WHITE, "/contrabandocarro : Começa a fazer um contrabando de carros.");
			SendClientMessage(playerid, COLOR_WHITE, "/pararcontrabando : Para de fazer um contrabando.");
			SendClientMessage(playerid, COLOR_JUIZ, "Agora você é um contrabandista e uma das coisas que você mais irá fazer é viajar para conseguir preços menores.");
			SendClientMessage(playerid, COLOR_JUIZ, "Cuidado com a Receita federal pois além de cancelar seu contrabando ela poderá prende-lo.");
			SendClientMessage(playerid, COLOR_JUIZ, "Você tem diversos tipos de missões de contrabando para fazer e ganhar dinheiro. Divirta-se e bom trabalho.");
		}
		else if(Profissao[playerid] == ADVOGADO) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Advogado");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_JUIZ, "Sua profissão não tem nenhum comando especial, você apenas terá que defender seus clientes quando forem parar em um tribunal.");
		}
		else if(Profissao[playerid] == PROSTITUTA) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Prostituta");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_WHITE, "/sexo [id] : Começa a fazer sexo com alguém (Ele tem que estar no mesmo veiculo que você).");
			SendClientMessage(playerid, COLOR_WHITE, "/dar : Dá o c* pro jogador que você estiver fazendo sexo.");
			SendClientMessage(playerid, COLOR_WHITE, "/chupar : Chupa o pênis do jogador que você estiver fazendo sexo.");
			SendClientMessage(playerid, COLOR_WHITE, "/bater : Bate punheta pro jogador que você estiver fazendo sexo.");
		}
		else if(Profissao[playerid] == MECANICO) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Mecanico");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COLOR_WHITE, "/consertar [id] : Conserta o veiculo de alguém.");
			SendClientMessage(playerid, COLOR_WHITE, "/pintar [cor1] [cor2] : Pinta um veiculo.");
		}
		else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Motorista de Onibus");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COLOR_JUIZ, "Sua profissão não tem nenhum comando especial!.");
            SendClientMessage(playerid, COLOR_JUIZ, "O Seu objetivo agora é muito simples. Pegue um busão e vá fazendo circuitos pela cidade buscando passageiros.");
		}
		else if(Profissao[playerid] == AGRICULTOR) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Agricultor");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COLOR_WHITE, "/plantar [id-da-produção] : Começa a plantar uma produção (Você tem que estar na fazenda).");
			SendClientMessage(playerid, COLOR_WHITE, "/colher : Colhe suas produções plantadas.");
			SendClientMessage(playerid, COLOR_WHITE, "/venderplantacoes : Vende suas plantações (Você tem que estar no mercado).");
			SendClientMessage(playerid, COLOR_JUIZ, "Agora você é um agricultor. Tenha contato com a fazenda e o mercado para ir vendedo suas plantações.");
			SendClientMessage(playerid, COLOR_JUIZ, "Sua profissão tem altos tipos de plantações diversas veja todas em /plantacoes.");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Vendedor de armas");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COLOR_WHITE, "/sellarma [id] [id da arma] [munição] : Vende arma para alguém.");
			SendClientMessage(playerid, COLOR_WHITE, "/colete [id] : Vende colete para alguém.");
			SendClientMessage(playerid, COLOR_JUIZ, "Agora você é um vendedor de armas. Faça preços das armas menores que os da ammunation.");
			SendClientMessage(playerid, COLOR_JUIZ, "Para saber os ids das armas digite /armas.");
		}
		else if(Profissao[playerid] == RECEITA_FEDERAL) {
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão - Receita federal");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COLOR_WHITE, "/revisarcontrabando [id] : Revisa se um jogador está fazendo contrabando.");
			SendClientMessage(playerid, COLOR_WHITE, "/finalizarcontrabando [id] : Finaliza o contrabando de um jogador.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende quem estiver fazendo contrabando.");
		}
		else{
			SendClientMessage(playerid, COLOR_JUIZ, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_JUIZ, "Sua profissão não tem nenhum comando especial!");
		}
		return 1;
	}

//------------------- FIM DO COMANDO PARA VER OS COMANDOS DA SUA PROFISSAO ----//
	

//-------------------------- COMANDOS DE TAXISTA ------------------------------//

	if(strcmp(cmd, "/staxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/staxi [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COLOR_JUIZ, "O taxímetro começou a rodar");
                SendClientMessage(plid, COLOR_JUIZ, "O taxímetro começou a rodar");
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
	}

//-------------------------- FIM DOS COMANDOS DE TAXISTA ---------------------//

//-------------------------- COMANDOS DE MECANICO ----------------------------//

    if(strcmp(cmd, "/consertar", true) == 0) {
	  if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new id;
	   tmp = strtok(cmdtext,idx);
	   id = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/consertar [id]");
	   return 1;
	   }
	   if(IsPlayerInAnyVehicle(id)){
	   if(IsPlayerConnected(id)){
	   new Float:X,Float:Y,Float:Z,Float:ang;
	   GetVehiclePos(GetPlayerVehicleID(id),X,Y,Z);
	   GetVehicleZAngle(GetPlayerVehicleID(id),ang);
	   SetVehicleToRespawn(GetPlayerVehicleID(id));
	   SetTimerEx("ArrumarCarro",2000,0,"ddffff",id,GetPlayerVehicleID(id),X,Y,Z,ang);
	   SendClientMessage(playerid, COLOR_WHITE, "Veiculo consertado com sucesso.");
	   SendClientMessage(id, COLOR_WHITE, "Seu veiculo foi consertado por um mecanico");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "O Jogador indicado não esta em um veiculo.");
		   return 1;
		   }
   	   }
   	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão");
		   return 1;
		   }
	}
    if(strcmp(cmd, "/pintar", true) == 0) {
	 if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new cor1,cor2;
	   tmp = strtok(cmdtext,idx);
	   cor1 = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/pintar [cor1] [cor2]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   cor2 = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/pintar [cor1] [cor2]");
	   return 1;
	   }
	   if(IsPlayerInAnyVehicle(playerid)){
	   if(cor1 >= 0 && cor1 <= 126){
	   if(cor2 >= 0 && cor2 <= 126){
	   ChangeVehicleColor(GetPlayerVehicleID(playerid),cor1,cor2);
	   SendClientMessage(playerid, COLOR_JUIZ, "Veiculo pintado com sucesso!");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Cor 2 invalidá.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Cor 1 invalidá");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COLOR_RED, "Você não esta em um veiculo.");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
    }
//-------------------------- FIM DOS COMANDOS DE MECANICO --------------------//

//-------------------------- COMANDOS DE IBAMA -------------------------------//
	if(strcmp(cmd,"/piracema",true) == 0) {
	   if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)){
		  if(piracema == 0){
		  piracema = 1;
		  SendClientMessageToAll(COLOR_JUIZ, "A piracema está ativada quem estiver pescando agora será preso.");
		  return 1;
		  }
		  else{
		  	  piracema = 0;
		  	  SendClientMessageToAll(COLOR_JUIZ, "A piracema foi desativada agora todos podem pescar à vontade.");
		  	  return 1;
		  	  }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/confiscarpeixes",true) == 0) {
	  if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid,distancia;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "/confiscarpeixes [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(QtPeixe[plid] > 0){
	   if(distancia <= 7){
	   QtPeixe[playerid] = QtPeixe[playerid] + QtPeixe[plid];
	   QtPeixe[plid] = 0;
	   SendClientMessage(playerid, COLOR_JUIZ, "Peixes confiscados.");
	   SendClientMessage(plid, COLOR_RED, "Seus peixes foram confiscados por um IBAMA.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador não possue nenhum peixe.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "Você não tem permissão.");
		   return 1;
		   }
	}
//-------------------------- COMANDOS DE BARMAN ------------------------------//

    if(strcmp(cmd, "/selldrink", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/selldrink [id] [teor de alcool]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/selldrink [id] [teor de alcool]");
				return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COLOR_RED, "Teor alcoolico invalido, Os teores devem ser entre 2 e 7.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Você bebeu um drink com teor alcoolico: %d", teor);
			            SendClientMessage(plid, COLOR_JUIZ, string);
			            SendClientMessage(playerid, COLOR_JUIZ, "Drink Vendido e tomado");
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
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
			return 1;
		}
	}
//------------------------------ FIM DOS COMANDOS DE BARMAN ------------------//

//------------------------------ MENSAGEM DE COMANDO NÃO EXISTENTE -----------//
    SendClientMessage(playerid, COLOR_RED, "Comando não identificado pelo gamemode.");
    return 1;
}


public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
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
		if(GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 523){
			switch(Profissao[playerid])
 			{
 				case COP_ELITE,COP_CIVIL,COP_RODOVIARIO,NARCOTICOS,XERIFE:
 				{
 						SendClientMessage(playerid, COLOR_GREEN, "Bem vindo à sua viatura policial.");
 				}
 				default:
 				{
 						SendClientMessage(playerid, COLOR_RED, "Essa viatura pertence ao Departamento de polícia, é proibido entrar nesse veículo sem ser policial!");
						RemovePlayerFromVehicle(playerid);
				}
			}
		}
		if(GetVehicleModel(vehicleid) == 416){
		    switch(Profissao[playerid])
 			{
 				case MEDICO:
 				{
 						SendClientMessage(playerid, COLOR_GREEN, "Bem vindo à sua ambulância.");
 				}
 				default:
 				{
 						SendClientMessage(playerid, COLOR_RED, "Essa ambulância pertence ao Hospital, é proibido entrar nesse veículo sem ser paramédico!");
						RemovePlayerFromVehicle(playerid);
				}
			}
		}
		if(vehicleid == carroauto1 || vehicleid == carroauto2 || vehicleid == carroauto3 || vehicleid == carroauto4 || vehicleid == carroauto5){
			if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			    SendClientMessage(playerid, COLOR_GREEN, "Bem vindo ao veículo da auto-escola.");
			    return 1;
			}
			else{
			    if(autorizacao[playerid] == 0){
			        SendClientMessage(playerid, COLOR_RED, "Você não tem autorização para usar este veículo!");
					RemovePlayerFromVehicle(playerid);
				}
				else{
				    SendClientMessage(playerid, COLOR_GREEN, "Bem vindo ao carro da auto-escola! Você pode dirigir ele até o teste acabar!");
				    return 1;
				}
			}
		}
	}
    if(newstate == PLAYER_STATE_DRIVER){
         new vehicleid = GetPlayerVehicleID(playerid);
         if(vehicleid == carroaluguel1 || vehicleid == carroaluguel2 || vehicleid == carroaluguel3 || vehicleid == carroaluguel4 || vehicleid == carroaluguel5){
			if(aluguel[playerid] == 0){
				if(carrolocado[playerid] != vehicleid){
				TogglePlayerControllable(playerid,0);
				SendClientMessage(playerid, COLOR_RED, "Este é um carro de aluguel.");
				SendClientMessage(playerid, COLOR_RED, "Peça para alugar ele com um locador de carros ou então digite '/sair' para sair do veiculo.");
				}
   	        }
   	        else{
				SendClientMessage(playerid, COLOR_JUIZ, "Bem vindo ao seu carro locado. Aproveite bem que ainda tem tempo.");
				}
	     }
    }
	new Ptmess[256];
	if(newstate == PLAYER_STATE_DRIVER){
		if(Petrol[playerid] <= 0){
			RemovePlayerFromVehicle(playerid);
			Petrol[playerid] = 0;
			SendClientMessage(playerid, COLOR_RED, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
		}
		if(Petrol[playerid] > 50){
		    Petrol[playerid]--;
			format(Ptmess, sizeof(Ptmess), "~p~gasolina ->~w~%d", Petrol[playerid]);
			GameTextForPlayer(playerid, Ptmess, 5000, 1);
			udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
		}
		if(Petrol[playerid] <= 50 || Petrol[playerid] >= 1){
		    Petrol[playerid]--;
			format(Ptmess, sizeof(Ptmess), "~p~gasolina ->~w~%d", Petrol[playerid]);
			GameTextForPlayer(playerid, Ptmess, 5000, 1);
			udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
		}
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

	  switch (gPlayerCheckpointStatus[playerid])
	  {
	  case CHECKPOINT_CONTRABANDOCARRO :
	  {
	  if(IsPlayerInAnyVehicle(playerid)){
	  if(modelocontrabando[playerid] == GetVehicleModel(GetPlayerVehicleID(playerid))){
	  DisablePlayerCheckpoint(playerid);
	  contrabando[playerid] = 0;
	  gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	  DestroyVehicle(GetPlayerVehicleID(playerid));
      GameTextForPlayer(playerid,"~w~Missao Concluida ~n~ ~y~$1000",4000,0);
      GivePlayerMoney(playerid,1000);
      }
      else{
          GameTextForPlayer(playerid,"~r~O Negociante nao ~n~ quer esse carro",4000,1);
		  }
	  }
	  else{
          GameTextForPlayer(playerid,"~r~Voce nao esta em ~n~ um veiculo",4000,1);
          }
	  }
	  case CHECKPOINT_CONTRABANDO :
	  {
	  SendClientMessage(playerid, COLOR_JUIZ, "O Negociante lhe informou o local vá lá pegar os bagulhos.");
	  DisablePlayerCheckpoint(playerid);
	  SetPlayerCheckpoint(playerid,-2162.6946,-223.9788,36.5156,3.0);
	  gPlayerCheckpointStatus[playerid] = CHECKPOINT_CONTRABANDO2;
	  }
	  case CHECKPOINT_CONTRABANDO2 :
	  {
	  SendClientMessage(playerid, COLOR_JUIZ, "Ótimo você pegou os bagulhos agora vá na area de tráfico e troque esses bagulhos por drogas.");
	  DisablePlayerCheckpoint(playerid);
	  SetPlayerCheckpoint(playerid,20.5194,1344.8972,9.1719,3.0);
	  gPlayerCheckpointStatus[playerid] = CHECKPOINT_CONTRABANDO3;
	  }
	  case CHECKPOINT_CONTRABANDO3 :
	  {
	  SendClientMessage(playerid, COLOR_JUIZ, "Muito bem! Agora vá na casa do negociante e entregue essas drogas para ele.");
	  DisablePlayerCheckpoint(playerid);
	  SetPlayerCheckpoint(playerid,-635.2629,1443.7476,13.6172,3.0);
	  gPlayerCheckpointStatus[playerid] = CHECKPOINT_CONTRABANDO4;
	  }
	  case CHECKPOINT_CONTRABANDO4 :
	  {
	  GameTextForPlayer(playerid,"~w~Missao Concluida ~n~ ~y~$2500",4000,0);
	  SendClientMessage(playerid, COLOR_WHITE, "Muito bem você recebeu $2500 pelas drogas.");
	  GivePlayerMoney(playerid,2500);
	  contrabando[playerid] = 0;
	  DisablePlayerCheckpoint(playerid);
	  gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	  }
   }
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
 	new tmp[MAX_STRING];
  	set(tmp,udb_encode(name));
	return tmp;
}

public Bancos()
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			if(X >= 1700.1732 && X <= 1741.9966 && Y >= -1721.5967 && Y <= -1605.9054){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
				    SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 972.7372 && X <= 1072.9083 && Y >= -1133.2140 && Y <= -1110.8668){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 385.5901 && X <= 409.1007 && Y >= -1823.7596 && Y <= -1797.2906){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1785.4990 && X <= -1714.4250 && Y >= 929.3326 && Y <= 974.9125){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1978.6537 && X <= -1961.9292 && Y >= 113.2442 && Y <= 162.6734){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2482.7346 && X <= -2386.7249 && Y >= 461.5373 && Y <= 552.1155){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -184.8378 && X <= -181.4126 && Y >= 1131.8652 && Y <= 1134.6572){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -831.2864 && X <= -826.3372 && Y >= 1498.3773 && Y <= 1502.5111){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
            else if(X >= -832.4860 && X <= -823.2851 && Y >= 1497.2490 && Y <= 1504.1270){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -186.1204 && X <= -181.0264 && Y >= 1128.7853 && Y <= 1137.4966){
				if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~w~Banco",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você entrou no banco.");
					SendClientMessage(i, COLOR_VERDEAQUA, "Para visualizar os comandos digite /banco");
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -184.9088 && X <= -178.6364 && Y >= 1086.3571 && Y <= 1091.8368){
                if(AreaMercado[i] == 0) {
					GameTextForPlayer(i,"~y~Mercado",3000,1);
					AreaMercado[i] = 1;
					}
			}
			else if(X >= -861.2266 && X <= -848.7133 && Y >= 1532.1450 && Y <= 1544.8707){
                if(AreaMercado[i] == 0) {
					GameTextForPlayer(i,"~y~Mercado",3000,1);
					AreaMercado[i] = 1;
					}
			}
            else if(X >= -421.8416 && X <= -385.2064 && Y >= 1028.4497 && Y <= 1165.3813){
                if(AreaPesca[i] == 0) {
					GameTextForPlayer(i,"~g~Area de Pesca",3000,1);
					SendClientMessage(i, COLOR_VERDEAQUA, "Você está na area de pesca digite /pescainfo para mais informações.");
					AreaPesca[i] = 1;
					}
			}
			else if(X >= -92.6633 && X <= -85.0506 && Y >= 1220.3339 && Y <= 1228.2384){
                if(AreaHotel[i] == 0) {
                    GameTextForPlayer(i,"~b~Hotel",3000,1);
                    SendClientMessage(i, COLOR_VERDEAQUA, "Você esta em um hotel digite /hotelinfo para ver as informações de hotel.");
					AreaHotel[i] = 1;
					}
			}
			else if(X >= 5.2796 && X <= 12.2020 && Y >= 1217.0540 && Y <= 1224.2048){
                if(AreaHotel[i] == 0) {
                    GameTextForPlayer(i,"~b~Hotel",3000,1);
                    SendClientMessage(i, COLOR_VERDEAQUA, "Você esta em um hotel digite /hotelinfo para ver as informações de hotel.");
					AreaHotel[i] = 1;
					}
			}
			else if(X >= -829.7397 && X <= -824.6603 && Y >= 1433.9441 && Y <= 1440.5267){
                if(AreaHotel[i] == 0) {
                    GameTextForPlayer(i,"~b~Hotel",3000,1);
                    SendClientMessage(i, COLOR_VERDEAQUA, "Você esta em um hotel digite /hotelinfo para ver as informações de hotel.");
					AreaHotel[i] = 1;
					}
			}

			else if(X >= 58.7324 && X <= 79.4868 && Y >= 1211.0900 && Y <= 1227.4963){
                if(AreaPosto[i] == 0) {
                    GameTextForPlayer(i,"~r~Posto ~n~",3000,1);
                    SendClientMessage(i, COLOR_VERDEAQUA, "Posto para abastecer digite /abastecer [litros]");
					AreaPosto[i] = 1;
					}
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
                if(AreaPosto[i] == 0) {
			    	GameTextForPlayer(i,"~r~Posto",3000,1);
			    	SendClientMessage(i, COLOR_VERDEAQUA, "Posto para abastecer digite /abastecer [litros]");
			    	AreaPosto[i] = 1;
			    	}
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
                if(AreaPosto[i] == 0) {
					GameTextForPlayer(i,"~r~Posto",3000,1);
			        SendClientMessage(i, COLOR_VERDEAQUA, "Posto para abastecer digite /abastecer [litros]");
			        AreaPosto[i] = 1;
			        }
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
                if(AreaPosto[i] == 0) {
					GameTextForPlayer(i,"~r~Posto",3000,1);
		    	    SendClientMessage(i, COLOR_VERDEAQUA, "Posto para abastecer digite /abastecer [litros]");
		    	    AreaPosto[i] = 1;
		    	    }
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
                if(AreaPosto[i] == 0) {
					GameTextForPlayer(i,"~r~Posto",3000,1);
		        	SendClientMessage(i, COLOR_VERDEAQUA, "Posto para abastecer digite /abastecer [litros]");
		    	    AreaPosto[i] = 1;
		    	    }
			} 
			else if((X >= -335.5862 && X <= -315.2917 && Y >= 793.5115 && Y <= 818.4818)){
                if(AreaPosto[i] == 0) {
		        	GameTextForPlayer(i,"~g~Desmanche",3000,1);
		    	    AreaDesmanche[i] = 1;
		    	    }
			}
			else if((X >= -701.5679 && X <= -633.6870 && Y >= 992.9566 && Y <= 1043.9899)){
                if(AreaFazenda[i] == 0) {
		        	GameTextForPlayer(i,"~p~Fazenda",3000,1);
		    	    AreaFazenda[i] = 1;
		    	    }
			}
			else if((X >= -323.9871 && X <= -309.6268 && Y >= 1053.8407 && Y <= 1061.5745)){
                if(AreaHospital[i] == 0) {
		        	GameTextForPlayer(i,"~w~Hospital",3000,1);
		    	    AreaHospital[i] = 1;
		    	    }
			}
			else if((X >= -24.3677 && X <= 33.8229 && Y >= 1334.2295 && Y <= 1386.9663)){
                if(AreaTrafico[i] == 0) {
		        	GameTextForPlayer(i,"~r~Area de Trafico",3000,1);
		    	    AreaTrafico[i] = 1;
		    	    }
			}
			else if((X >= 164.5352 && X <= 196.1992 && Y >= 1159.3467 && Y <= 1192.7954)){
                if(AreaPizzaria[i] == 0) {
		        	GameTextForPlayer(i,"~y~Pizzaria",3000,1);
		    	    AreaPizzaria[i] = 1;
		    	    }
			}
			else if((X >= -310.4082 && X <= -285.2117 && Y >= 1727.2161 && Y <= 1781.9030)){
                if(AreaForte[i] == 0) {
		        	GameTextForPlayer(i,"~g~Area Forte",3000,1);
		    	    AreaForte[i] = 1;
		    	    }
			}
			else if((X >= -266.0482 && X <= -240.0959 && Y >= 1208.9264 && Y <= 1224.8038)){
                if(AreaLocadora[i] == 0) {
					GameTextForPlayer(i,"~w~Locadora",3000,1);
			        SendClientMessage(i, COLOR_VERDEAQUA, "Você está numa locadora, digite /locadorainfo para saber mais.");
			        AreaLocadora[i] = 1;
			        }
			}
			else {
				if(AreaBanco[i] == 1) {
					AreaBanco[i] = 0;
				}
				if(AreaPosto[i] == 1) {
					AreaPosto[i] = 0;
				}
				if(AreaHotel[i] == 1) {
					AreaHotel[i] = 0;
				}
				if(AreaDesmanche[i] == 1) {
					AreaDesmanche[i] = 0;
				}
				if(AreaPesca[i] == 1) {
					AreaPesca[i] = 0;
				}
				if(AreaMercado[i] == 1) {
					AreaMercado[i] = 0;
				}
				if(AreaFazenda[i] == 1) {
					AreaFazenda[i] = 0;
				}
				if(AreaHospital[i] == 1) {
					AreaHospital[i] = 0;
				}
				if(AreaTrafico[i] == 1) {
					AreaTrafico[i] = 0;
				}
				if(AreaPizzaria[i] == 1) {
					AreaPizzaria[i] = 0;
				}
				if(AreaForte[i] == 1) {
					AreaForte[i] = 0;
				}
				if(AreaLocadora[i] == 1) {
					AreaLocadora[i] = 0;
				}
			}
		}
	}
}
public Dando(playerid,plid)
{
SexoEsquentando[plid] ++;
PO[plid] = 0;
KillTimer(TimeSexo[playerid]);
SendClientMessage(playerid, COLOR_WHITE, "Você terminou de dar!");
SendClientMessage(plid, COLOR_WHITE, "A prostituta terminou de dar!");
}
public Chupando(playerid,plid)
{
SexoEsquentando[plid] ++;
PO[plid] = 0;
KillTimer(TimeSexo[playerid]);
SendClientMessage(playerid, COLOR_WHITE, "Você terminou de chupar o pênis do outro jogador!");
SendClientMessage(plid, COLOR_WHITE, "A prostituta terminou de chupar seu pênis!");
}
public Batendo(playerid,plid)
{
SexoEsquentando[plid] ++;
PO[plid] = 0;
KillTimer(TimeSexo[playerid]);
SendClientMessage(playerid, COLOR_WHITE, "Você terminou de bater punheta para o outro jogador!");
SendClientMessage(plid, COLOR_WHITE, "A prostituta terminou de bater punheta para você!");
}
public FimSexo(playerid,plid)
{
   new NotaSexo;
   switch(SexoEsquentando[plid])
   {
   case 0,1 :
   {
   NotaSexo = 0;
   }
   case 2 :
   {
   NotaSexo = 1;
   }
   case 3,4 :
   {
   NotaSexo = 2;
   }
   case 5,6 :
   {
   NotaSexo = 3;
   }
   default :
   {
   NotaSexo = 4;
   }
}
   new str[256];
   SendClientMessage(playerid, COLOR_RED, "Sexo terminado!");
   SendClientMessage(plid, COLOR_RED, "Sexo terminado!");
   format(str,sizeof(str),"RESULTADO: Nota do Sexo: %s | Valor do Sexo: $%d",ResultadoSexo[NotaSexo],ValoresSexo[NotaSexo]);
   SendClientMessage(playerid, COLOR_WHITE, str);
   SendClientMessage(plid, COLOR_WHITE, str);
   GivePlayerMoney(playerid,ValoresSexo[NotaSexo]);
   GivePlayerMoney(plid, -ValoresSexo[NotaSexo]);
   TogglePlayerControllable(playerid,1);
   TogglePlayerControllable(plid,1);
   Sexo[playerid] = 0;
   Sexo[plid] = 0;
   RemovePlayerFromVehicle(playerid);
   RemovePlayerFromVehicle(plid);
   KillTimer(TimeSexo[playerid]);
}
public CheckFuel()
{
	new Ptmess[256];
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1){
			if(GetPlayerState(i) == 2){
				Petrol[i]--;
				if(Petrol[i] <= 0){
					RemovePlayerFromVehicle(i);
					SendClientMessage(i, COLOR_RED, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
					Petrol[i] = 0;
					return 1;
				}
				if(Petrol[i] >= 25){
					format(Ptmess, sizeof(Ptmess), "~p~gasolina ->~w~%d", Petrol[i]);
					GameTextForPlayer(i, Ptmess, 5000, 1);
					return 1;
				}
				if(Petrol[i] < 25 || Petrol[i] >= 1){
					format(Ptmess, sizeof(Ptmess), "~p~gasolina ->~r~%d", Petrol[i]);
					GameTextForPlayer(i, Ptmess, 5000, 1);
					return 1;
				}
			}
		}
	}
	return 1;
}
public fimplantacao(playerid,producaoid)
{
   if(IsPlayerConnected(playerid)){
   if(producaoid == 1){
        qtmilho[playerid] ++;
        EspacoPlantacao --;
        return 1;
   }
   else if(producaoid == 2){
        qtmandioca[playerid] ++;
        EspacoPlantacao --;
        return 1;
   }
   else if(producaoid == 3){
        qttomate[playerid] ++;
        EspacoPlantacao --;
        return 1;
   }
   else if(producaoid == 4){
        qtfeijao[playerid] ++;
        EspacoPlantacao --;
        return 1;
        }
   }
   return 1;
}
public SetCar(modelid,Float:X,Float:Y,Float:Z,Float:ang,Cor1,Cor2){
	CreateVehicle(modelid,X,Y,Z,ang,Cor1,Cor2,-1);
}
public FimPesca(playerid)
{
if(Pescando[playerid] == 1){
SendClientMessage(playerid, COLOR_WHITE, "Fim de pesca.");
new resultado = random(2);
if(resultado == 0)
{
    SendClientMessage(playerid, COLOR_RED, "Que azar! O Peixe mordeu a isca mas conseguiu fugir.");
    Pescando[playerid] = 0;
    TogglePlayerControllable(playerid,1);
    isca[playerid] --;
}
else if(resultado == 1)
{
    SendClientMessage(playerid, COLOR_JUIZ, "Ótimo! Você conseguiu pescar um peixe agora pode ir no mercado vende-lo ou continuar pescando.");
    Pescando[playerid] = 0;
    QtPeixe[playerid] ++;
    TogglePlayerControllable(playerid,1);
    isca[playerid] --;
}
else if(resultado == 2)
{
    SendClientMessage(playerid, COLOR_RED, "Que azar! O Peixe mordeu a isca mas conseguiu fugir.");
    Pescando[playerid] = 0;
    TogglePlayerControllable(playerid,1);
    isca[playerid] --;
    }
  }
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

public LogarPlayer(playerid)
{
    new Float:X, Float:Y, Float:Z, Float:ang;
	GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
	udb_getPosition(PlayerName(playerid), X, Y, Z);
	udb_getAng(PlayerName(playerid), ang);
	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
	Profissao[playerid] = udb_getProf(PlayerName(playerid));
	Petrol[playerid] = udb_getGasoline(PlayerName(playerid));

    if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COLOR_DESEMPREGADO);
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COLOR_TAXISTA);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COLOR_CORRETOR);
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COLOR_ASSASSINO);
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COLOR_BARMAN);
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COLOR_JUIZ);
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COLOR_SEGURANÇA);
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COLOR_MOTORISTA);
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COLOR_COP_CIVIL);
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COLOR_COP_RODOVIARIO);
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COLOR_COP_ELITE);
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COLOR_PESCADOR);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COLOR_INSTRUTOR);
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COLOR_MOTORISTA_ONIBUS);
	}
	else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COLOR_AGRICULTOR);
	}
	else if(Profissao[playerid] == LADRAO_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_LADRAO_DE_CARROS);
	}
	else if(Profissao[playerid] == MECANICO) {
		SetPlayerColor(playerid, COLOR_MECANICO);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR_DE_ARMAS);
	}
	else if(Profissao[playerid] == FRENTISTA) {
		SetPlayerColor(playerid, COLOR_FRENTISTA);
	}
	else if(Profissao[playerid] == IBAMA) {
		SetPlayerColor(playerid, COLOR_IBAMA);
	}
	else if(Profissao[playerid] == TRAFICANTE) {
		SetPlayerColor(playerid, COLOR_TRAFICANTE);
	}
	else if(Profissao[playerid] == NARCOTICOS) {
		SetPlayerColor(playerid, COLOR_NARCOTICOS);
	}
	else if(Profissao[playerid] == EXERCITO) {
		SetPlayerColor(playerid, COLOR_EXERCITO);
	}
	else if(Profissao[playerid] == ASSALTANTE) {
		SetPlayerColor(playerid, COLOR_ASSALTANTE);
	}
	else if(Profissao[playerid] == RECEITA_FEDERAL) {
		SetPlayerColor(playerid, COLOR_RECEITA_FEDERAL);
	}
	else if(Profissao[playerid] == CONTRABANDISTA) {
		SetPlayerColor(playerid, COLOR_CONTRABANDISTA);
	}
	else if(Profissao[playerid] == MEDICO) {
		SetPlayerColor(playerid, COLOR_MEDICO);
	}
	else if(Profissao[playerid] == ADVOGADO) {
		SetPlayerColor(playerid, COLOR_ADVOGADO);
	}
	else if(Profissao[playerid] == PIZZA_BOY) {
		SetPlayerColor(playerid, COLOR_PIZZA_BOY);
	}
	else if(Profissao[playerid] == SEGURADOR) {
		SetPlayerColor(playerid, COLOR_SEGURADOR);
	}
	else if(Profissao[playerid] == TRANSPORTE_VALORES) {
		SetPlayerColor(playerid, COLOR_TRANSPORTE_VALORES);
	}
	else if(Profissao[playerid] == PROSTITUTA) {
		SetPlayerColor(playerid, COLOR_PROSTITUTA);
	}
	else if(Profissao[playerid] == LOCADOR_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_LOCADOR_DE_CARROS);
	}
	else if(Profissao[playerid] == JORNALISTA) {
		SetPlayerColor(playerid, COLOR_JORNALISTA);
	}
	else if(Profissao[playerid] == XERIFE) {
		SetPlayerColor(playerid, COLOR_XERIFE);
	}
	if(udb_getPrisao(PlayerName(playerid)) == 1){
	    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
	    Procurados[playerid] = 0;
	}
	SpawnPlayer(playerid);
}

public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 300000){
	            Presos[i] = 0;
	            udb_setPrisao(PlayerName(i), 0);
	            TempoPreso[i] = 0;
	    	    LogarPlayer(i);
	            SendClientMessage(i, COLOR_WHITE, "Você foi solto por agora, não cometa mais crimes se não irá pagar novamente.");
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

public FimAluguel(plid,veh)
{
SetVehicleToRespawn(veh);
RemovePlayerFromVehicle(plid);
carrolocado[plid] = 0;
aluguel[plid] = 0;
SendClientMessage(plid, COLOR_RED, "Seu tempo acabou! Se quiser mais peça para um locador loca-lo por mais alguns minutos.");
}
public Assalto(playerid)
{
    if(IsPlayerConnected(playerid)){
		if(assalto[playerid] == 1){
    	assalto[playerid] = 0;
    	}
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
forward PrevisaoTempo();
public PrevisaoTempo()
{
	PrevworldTime++;
	PrevworldTime%=24;
	SetWorldTime(PrevworldTime);
	for(new i=0; i<MAX_PLAYERS; i++) {
	if(PrevworldTime==0){
	if(IsPlayerConnected(i)){
    new previsao;
	new frase = random(6-1) + 1;
	previsao = frase;

	if(previsao == 1){
	SendClientMessageToAll(COLOR_WHITE, "Noticia: Previsao do tempo de hoje:");
	SendClientMessageToAll(COLOR_WHITE, "Tempo: 18º Celsius, nublado com forte rajada de vento.");
	SetPlayerWeather(i,9);
	}
	else if(previsao == 2){
	SendClientMessageToAll(COLOR_WHITE, "Noticia: Previsao do tempo de hoje:");
	SendClientMessageToAll(COLOR_WHITE, "Tempo: 23º Celsius, ceu limpo com nuvens claras.");
	SetPlayerWeather(i,10);
	}
	else if(previsao == 3){
	SendClientMessageToAll(COLOR_WHITE, "Noticia: Previsao do tempo de hoje:");
	SendClientMessageToAll(COLOR_WHITE, "Tempo: 32º Celsius, sol forte dia quente.");
	SetPlayerWeather(i,11);
	}
	else if(previsao == 4){
	SendClientMessageToAll(COLOR_WHITE, "Noticia: Previsao do tempo de hoje:");
	SendClientMessageToAll(COLOR_WHITE, "Tempo: 21º Celsius, ceu com nuvens escuras e chuva.");
	SetPlayerWeather(i,16);
	}
	else if(previsao == 5){
	SendClientMessageToAll(COLOR_WHITE, "Noticia: Previsao do tempo de hoje:");
	SendClientMessageToAll(COLOR_WHITE, "Tempo: 23º Celsius, ceu nublado.");
	SetPlayerWeather(i,39);
	}
	else if(previsao == 6){
	SendClientMessageToAll(COLOR_WHITE, "Noticia: Previsao do tempo de hoje:");
	SendClientMessageToAll(COLOR_WHITE, "Tempo: 25º Celsius, tempestade de ventos chuva forte.");
	SetPlayerWeather(i,8);
	}
    else
    {
    SetPlayerWeather(i,9);
	}
}
}
}
}

forward ArrumarCarro(playerid,vehicleid,Float:X,Float:Y,Float:Z,Float:ang);
public ArrumarCarro(playerid,vehicleid,Float:X,Float:Y,Float:Z,Float:ang)
{
	SetVehiclePos(vehicleid,X,Y,Z);
	SetVehicleZAngle(vehicleid,ang);
	PutPlayerInVehicle(playerid,vehicleid,0);
}
public FimKitMedico()
{
         for(new i=0; i<MAX_PLAYERS; i++){
         if(kitmedico[i] == 1){
         if (IsPlayerConnected(i)){
         if(pessoascuradas[i] >= 3){
         kitmedico[i] = 0;
         pessoascuradas[i] = 0;
         SendClientMessage(i, COLOR_WHITE, "Você já curou 3 pessoas agora seu kit médico acabou vá buscar mais um.");
		 }
	   }
     }
   }
 }
public Megasena()
{
	for(new i=0; i<MAX_PLAYERS; i++){
   		aposta[i] = 0;
   		new numerosorteado = random(21);
   		if(numeroapostado[i] == numerosorteado){
   			SendClientMessageToAll(COLOR_JUIZ,"Sorteio da Loteria!");
   			new string[256];
   			format(string,sizeof(string),"%s ganhou o sorteio! O número apostado foi %d",PlayerName(i),numerosorteado);
   			SendClientMessageToAll(COLOR_JUIZ,string);
   			GivePlayerMoney(i,moneyloteria);
   			numeroapostado[i] = -1;
   			aposta[i] = 0;
  	 		return 1;
		}
   		else if(numeroapostado[i] != numerosorteado){
  			SendClientMessageToAll(COLOR_JUIZ,"Sorteio da Loteria!");
   			moneyloteria = moneyloteria + 2000;
   			aposta[i] = 0;
   			numeroapostado[i] = -1;
   			new msg[256];
   			format(msg,sizeof(msg),"Nenhum vencedor. Talvez na próxima! O número sorteado foi %d. O premio foi acumulado para R$%d",numerosorteado,moneyloteria);
   			SendClientMessageToAll(COLOR_JUIZ,msg);
   			return 1;
   		}
   	}
	return 1;
}
stock SendClientMessageToAdmins(color,const msg[])
{
      for(new i=0; i<MAX_PLAYERS; i++){
      	if(IsPlayerAdmin(i)){
      	SendClientMessage(i,color,msg);
      	}
   	}
}
public salariopescador()
{
    worldTime2++;
    worldTime2%=24;
    SetWorldTime(worldTime2);

    if(worldTime2==0){
   		if(piracema == 1){
   			for(new i=0; i<MAX_PLAYERS; i++){
   				if(Profissao[i] == PESCADOR){
    			udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 300);
    			SendClientMessage(i, COLOR_VERDEAQUA, "Foi depositado mais $300 de salário em sua conta porque a piracema está ativada.");
    			}
			}
 		}
	}
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
					SendClientMessage(i, COLOR_RED, "CHAMADA PERDIDA: Você não possue mais dinheiro para continuar essa ligação");
					SendClientMessage(Calling[i], COLOR_RED, "CHAMADA PERDIDA: O telefone de quem estava na outra chamada foi desligado por falta de créditos");
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
					SendClientMessage(i, COLOR_JUIZ, "Seu seguro foi depositado: $350");
					SendClientMessage(i, COLOR_RED,  "Não vai procurar emprego?");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 350);
				}
				else if(Profissao[i] == TAXISTA) {
					SendClientMessage(i, COLOR_JUIZ, "A companhia de taxi depositou seu salário: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == VENDEDOR_DE_CARROS) {
					SendClientMessage(i, COLOR_JUIZ, "A empresa de automóveis depositou seu salário: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == CORRETOR) {
					SendClientMessage(i, COLOR_JUIZ, "A agencia de imóveis de Fort Carson depositou seu salário: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == BARMAN) {
					SendClientMessage(i, COLOR_JUIZ, "O dono do bar depositou seu salário: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
				else if(Profissao[i] == SEGURANÇA) {
					SendClientMessage(i, COLOR_JUIZ, "A empresa de seguranças de Fort Carson depositou seu salário: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == MOTORISTA_PARTICULAR) {
					SendClientMessage(i, COLOR_JUIZ, "A companhia de limosines depositou seu salário: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == COP_CIVIL) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_RODOVIARIO) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $1500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
				}
				else if(Profissao[i] == COP_ELITE) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
				else if(Profissao[i] == PESCADOR) {
					SendClientMessage(i, COLOR_JUIZ, "A cooperativa de pesca depositou seu salário: $750");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 750);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					SendClientMessage(i, COLOR_JUIZ, "A auto-escola depositou seu salário: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 600);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					SendClientMessage(i, COLOR_JUIZ, "A companhia de ônibus depositou seu salário: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == AGRICULTOR) {
					SendClientMessage(i, COLOR_JUIZ, "A fazenda depositou seu salário: $700");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 700);
				}
				else if(Profissao[i] == LADRAO_DE_CARROS) {
					SendClientMessage(i, COLOR_JUIZ, "O dono do desmanche lhe depositou em sua conta: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 600);
				}
				else if(Profissao[i] == MECANICO) {
					SendClientMessage(i, COLOR_JUIZ, "O dono da sua oficina lhe depositou: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == VENDEDOR_DE_ARMAS) {
					SendClientMessage(i, COLOR_JUIZ, "A ammu-nation depositou seu salário: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == FRENTISTA) {
					SendClientMessage(i, COLOR_JUIZ, "O posto depositou seu salário: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == IBAMA) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $2500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
				}
				else if(Profissao[i] == TRAFICANTE) {
					SendClientMessage(i, COLOR_JUIZ, "O líder dos tráficos depositou o seu salário: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == EXERCITO) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $5000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 5000);
				}
				else if(Profissao[i] == NARCOTICOS) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $4000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4000);
				}
				else if(Profissao[i] == ASSALTANTE) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário foi depositado: $700");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 700);
				}
				else if(Profissao[i] == RECEITA_FEDERAL) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
				else if(Profissao[i] == CONTRABANDISTA) {
					SendClientMessage(i, COLOR_JUIZ, "Os contrabandistas pagaram o seu salário: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == MEDICO) {
					SendClientMessage(i, COLOR_JUIZ, "O hospital de Fort Carson depositou seu salário: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == ADVOGADO) {
					SendClientMessage(i, COLOR_JUIZ, "Sua agencia depositou seu salário: $1500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
				}
				else if(Profissao[i] == PIZZA_BOY) {
					SendClientMessage(i, COLOR_JUIZ, "A pizzaria depositou seu salário: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == SEGURADOR) {
					SendClientMessage(i, COLOR_JUIZ, "A empresa de seguros depositou seu salário: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == TRANSPORTE_VALORES) {
					SendClientMessage(i, COLOR_JUIZ, "O banco depositou seu salário: $1600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1600);
				}
				else if(Profissao[i] == PROSTITUTA) {
					SendClientMessage(i, COLOR_JUIZ, "O clube onde você trabalha depositou seu salário: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
				else if(Profissao[i] == LOCADOR_DE_CARROS) {
					SendClientMessage(i, COLOR_JUIZ, "A sua locadora lhe depositou: $1500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
				}
				else if(Profissao[i] == JORNALISTA) {
					SendClientMessage(i, COLOR_JUIZ, "A empresa de notícias e propagandas lhe depositou seu salário: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == XERIFE) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $4000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4000);
				}
			}
		}
	}
}

