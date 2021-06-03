#include <a_samp>
#include <dutils>
#include <dudb>
#include <uf>
#include <c_vehicleinfo>
//cores
#define COLOR_GREEN             0x33AA33AA
#define COLOR_RED               0xAA3333AA
#define COLOR_YELLOW            0xFFFF00AA
#define COLOR_WHITE             0xFFFFFFAA
#define COLOR_GRAY              0xAFAFAFAA
#define COLOR_UNLOGGED          0xAAAAAAAA
#define COLOR_DESEMPREGADO      0x666666AA
#define COLOR_INSTRUTOR         0xDD0000FF
#define COLOR_TAXISTA           0xFFFF00AA
#define COLOR_TAXISTA_AEREO     0x9ACD32AA
#define COLOR_COP_CIVIL         0x0000FFAA
#define COLOR_COP_ELITE         0x00C7FFAA
#define COLOR_CACADOR           0xA0522DAA
#define COLOR_ASSASSINO         0xAA3333AA
#define COLOR_VENDEDOR          0x009900AA
#define COLOR_COP_RODOVIARIO    0x00CED3AA
#define COLOR_SEGURAN�A         0xADD8E6AA
#define COLOR_BARMAN            0xF08080AA
#define COLOR_CORRETOR          0xDEB887AA
#define COLOR_PESCADOR          0xE9967AAA
#define COLOR_MOTORISTA         0xFF9900AA
#define COLOR_MOTORISTA_ONIBUS  0xF5F5DCAA
#define COLOR_JUIZ              0x7FFF00AA
#define COLOR_TRAFICANTE        0xCD853FAA
#define COLOR_NARCOTICOS        0x057ABDAA
#define COLOR_POLICIA_FLORESTAL 0x45804FAA
#define COLOR_IBAMA             0x1A4D23AA
#define COLOR_CAMINHONEIRO      0xE4E4E4AA
#define COLOR_ADVOGADO          0x462A4BAA
#define COLOR_GARI              0x1F4B2BAA
#define COLOR_VTRANSPORTE       0x00BA35AA
#define COLOR_CONTRABANDISTA    0x6A95AEAA
#define COLOR_RECEITA_FEDERAL   0x5E3030AA
#define COLOR_MOTOTAXISTA       0xFFC000AA
#define COLOR_MOTOBOY           0xD4A157AA
#define COLOR_LADRAO_CARROS     0x69555AAA
#define COLOR_ASSALTANTE        0xB70347AA
#define COLOR_ENTREGADOR_PIZZA  0xF0E68CAA
#define COLOR_JORNALISTA        0x800080AA
#define COLOR_TAXI_AEREO        0xFFA500AA
#define COLOR_AGRICULTOR        0xFF4500AA
#define COLOR_VENDEDOR_ARMAS    0x81CFAB00
#define COLOR_SEQUESTRADOR      0xFF6347AA
//profissao
#define DESEMPREGADO          1//feito
#define TAXISTA               2//feito
#define VENDEDOR_DE_CARROS    3//feito
#define CORRETOR              4//feito
#define ASSASSINO             5//feito
#define BARMAN                6//feito
#define JUIZ                  7//feito
#define SEGURAN�A             8//feito
#define MOTORISTA_PARTICULAR  9//feito
#define COP_CIVIL             10//feito
#define COP_RODOVIARIO        11//feito
#define COP_ELITE             12//feito
#define CACADOR               13//feito
#define PESCADOR              14//feito
#define INSTRUTOR_DE_DIRECAO  15//feito
#define TRAFICANTE            16//feito
#define MOTORISTA_DE_ONIBUS   17//feito
#define JORNALISTA            18//feito
#define CAMINHONEIRO          19//feito
#define NARCOTICOS            20//feito
#define POLICIA_FLORESTAL     21//feito
#define IBAMA                 22//feito
#define ADVOGADO              23//feito
#define PARAMEDICO            24//feito
#define GARI                  25//nada
#define TRANSPORTE_DE_VALORES 26//nada
#define CONTRABANDISTA        27//nada
#define RECEITA_FEDERAL       28//nada
#define MOTOBOY               29//nada
#define MOTOTAXISTA           30//feito
#define TAXISTA_AEREO         31//feito
#define AGRICULTOR            33//feito
#define LADRAO_DE_CARROS      34//nada
#define ASSALTANTE            35//nada
#define ENTREGADOR_PIZZA      36//feito
#define SEGURADOR             37//nada
#define FRENTISTA             38//+/-(se quiser)
#define VENDEDOR_AMBULANTE    39//nada
#define VENDEDOR_ARMAS        40//feito
#define SEQUESTRADOR          41//feito
#define GM                    99//nada
//define's do velocimetro
#define MPS 			0
#define KMPH 			1
#define MPH 			2
#define KNOTS 			3
#define SPEED			KMPH
//veiculos
static VEH_CARCOPCS = 599; //1
static VEH_HPV1000 = 523; //2
static VEH_MANANA = 410; //3
static VEH_SABRE = 475; //4
static VEH_FCR900 = 521; //5
static VEH_TAXI = 420; //6
static VEH_ONIBUS = 437; //7
static VEH_ANDROMADA = 592; //8
static VEH_DODO = 593; //9
static VEH_HUNTER = 425; //10
static VEH_LIMUSINE = 409; //11
static VEH_MAVERICK = 487; //12
static VEH_SAVANNA = 567; //13
static VEH_PCJ600 = 461; //14
static VEH_AT400 = 577; //15
static VEH_SHAMAL = 519; //16
static VEH_RDTRAIN = 515; //17
static VEH_JETMAX = 493; //18
static VEH_REEFER = 453; //19

//#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

//global vars
new Float:ppos[MAX_PLAYERS][3];
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
//pescando
new Piracema = 0;
new AreaCoopPesca[MAX_PLAYERS] = 0;
new PescaInProgress[MAX_PLAYERS] = 0;
new QtPescas[MAX_PLAYERS] = 0;
//ca�a
new TemporadaCaca = 1;
new AreaCaca[MAX_PLAYERS] = 0;
new AreaCoopCaca[MAX_PLAYERS] = 0;
new CacaInProgress[MAX_PLAYERS] = 0;
new QtCacas[MAX_PLAYERS] = 0;
//Fazenda
new AreaFazenda[MAX_PLAYERS] = 0;
new AreaCoopFazenda[MAX_PLAYERS] = 0;
new FazendaInProgress[MAX_PLAYERS] = 0;
new QtMilho[MAX_PLAYERS] = 0;
//caminhoneiros
new AreaCarga[MAX_PLAYERS] = 0;
new AreaDescarga[MAX_PLAYERS] = 0;
new Carregamento[MAX_PLAYERS] = 0;
//---
new Petrol[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new ATaximetro[MAX_PLAYERS][2];
new MTaximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new worldTime;
new VeloMulta = 1;
new Velocidade[MAX_PLAYERS];
new Bebida[MAX_PLAYERS] = 0;
new Maconha[MAX_PLAYERS] = 0;
new Heroina[MAX_PLAYERS] = 0;
new Cocaina[MAX_PLAYERS] = 0;
new Armas[MAX_PLAYERS] = 0;

forward MoneyGrubScoreUpdate();

main()
{
	print("\n---------------------------------------------");
	print("                 MPA PoWeR RPG");
	print(" Uma parceria entre Smurf, Matraka e Guilherme");
	print("----------------------------------------------\n");
	worldTime = 12;
	ShowNameTags(1);
}



public OnGameModeInit()
{
	print("Carregando GameMode RPG");
	SetGameModeText("MPA� PoWeR RPG");

	AddPlayerClass(0, -1958.5107, 293.6747, 35.4688, 269.1425, 0, 0, 0, 0, 0, 0);
 	cAddStaticVehicle(VEH_CARCOPCS,-1588.2479,748.0393,-5.4903,359.9998,0,1); // carcop
	cAddStaticVehicle(VEH_HPV1000,-1584.0217,749.4910,-5.6655,180.9966,0,0); // carcop
	cAddStaticVehicle(VEH_HPV1000,-1579.8461,749.0732,-5.6571,181.8757,0,0); // car cop
	cAddStaticVehicle(VEH_CARCOPCS,-1574.2565,742.4983,-5.5206,88.9996,0,1); // carcop
	cAddStaticVehicle(VEH_HPV1000,-1573.5985,734.6492,-5.6689,90.0025,0,0); // carcop
	cAddStaticVehicle(VEH_MAVERICK,-1679.5951,706.1432,30.7954,90.5114,0,0); // helicop
	cAddStaticVehicle(VEH_ONIBUS,-1988.5007,162.0946,27.6508,0.0000,1,1); // busao
	cAddStaticVehicle(VEH_ONIBUS,-1988.3359,131.3477,27.6943,0.0000,1,1); // busao
	cAddStaticVehicle(VEH_MANANA,-2089.6643,-83.5934,34.7976,359.9729,6,6); // carroescola
	cAddStaticVehicle(VEH_MANANA,-2081.2825,-83.4888,34.8086,4.0901,6,6); // carroescola
	cAddStaticVehicle(VEH_FCR900,-2022.3977,-124.3720,34.7832,179.9717,6,6); // motoescola
	cAddStaticVehicle(VEH_MAVERICK,-2032.2460,-155.6209,35.4656,0.0060,1,6); // heliesc
	cAddStaticVehicle(VEH_SABRE,-2088.8313,-156.0123,35.0983,359.9812,6,6); // carroesc
	cAddStaticVehicle(VEH_SABRE,-2092.4036,-145.2734,35.0986,0.0400,6,6); // carroesc
	cAddStaticVehicle(VEH_SABRE,-2092.3503,-132.4997,35.0966,0.4676,6,6); // carroesc
	cAddStaticVehicle(VEH_MAVERICK,-1829.1174,1300.2819,59.8817,204.0558,54,29); // mavmoto
	cAddStaticVehicle(VEH_REEFER,-1556.1755,1260.8345,-0.5926,234.7669,69,69); // barco pesca
	cAddStaticVehicle(VEH_REEFER,-1565.1833,1259.7523,-0.5379,227.8785,69,69); // barcopesca
	cAddStaticVehicle(VEH_REEFER,-1578.2352,1260.0367,-0.0551,228.0564,69,69); // barco pesca
	cAddStaticVehicle(VEH_JETMAX,-1474.4727,687.5856,-0.2037,268.8839,6,6); // barco escola
	cAddStaticVehicle(VEH_REEFER,-1473.3943,703.5046,-0.4342,272.7462,6,6); // barco escola
	cAddStaticVehicle(VEH_TAXI,-1703.0906,1003.9794,17.3778,91.1514,6,1); // taxi
	cAddStaticVehicle(VEH_TAXI,-1687.7856,999.6074,17.3444,270.7191,6,1); // taxi
	cAddStaticVehicle(VEH_LIMUSINE,-1816.4678,1311.4034,50.2892,275.5558,1,1); // limumoto
	cAddStaticVehicle(VEH_LIMUSINE,-1829.7208,1289.6337,50.2512,110.5457,0,0); // lomumoto
	cAddStaticVehicle(VEH_SAVANNA,-1241.5155,445.2168,7.1593,326.9936,44,44); // carro
	cAddStaticVehicle(VEH_SAVANNA,-1232.7764,451.6962,7.1680,89.9980,0,0); // carro
	cAddStaticVehicle(VEH_HUNTER,-1403.2001,465.2320,7.7642,181.0000,0,0); // hunter
	cAddStaticVehicle(VEH_HUNTER,309.5915,2056.1018,18.1976,180.0104,0,0); // hunter
	cAddStaticVehicle(VEH_AT400,1586.09,1190.73,10.71,180,0,1);//at-400
	cAddStaticVehicle(VEH_ANDROMADA,-1632.3605,-265.8031,15.3416,12.1937,1,1); // andromada
	cAddStaticVehicle(VEH_SHAMAL,-1626.1268,-219.8978,15.0673,339.8286,1,1); // shamal
	cAddStaticVehicle(VEH_DODO,-1708.3000,-247.4316,14.6091,360.0000,0,0); // dodo
	AddStaticPickup(1238,1,-1757.9701,960.9874,24.8828);
	AddStaticPickup(1274,1,-1746.1521,962.3468,24.8906);//cifrao hotel sf
	AddStaticPickup(1274,1,-1974.1283,117.5247,27.6875);//cifrao train station sf
	AddStaticPickup(1274,1,-2446.8564,522.0898,30.2816);//cifrao sa federal mint
	AddStaticPickup(1274,1,1721.8188,-1718.9016,13.5341);//cifrao atrium
	AddStaticPickup(1274,1,398.1302,-1805.6890,7.8380);//cifrao praia
	AddStaticPickup(1274,1,1022.5526,-1122.4902,23.8712);//cifrao teatro chines
	AddStaticPickup(1274,1,1958.0383,1343.7804,15.3746);
	AddStaticPickup(1274,1,2437.0090,1677.0514,10.8203);
	AddStaticPickup(362,2,1420.2501,2881.3828,10.8203);//minigun
	AddStaticPickup(355,2,1420.5509,2880.0674,10.8203); // ak-casa
	AddStaticPickup(355,2,1420.4403,2878.8823,10.8203); // ak-casa 2
	AddStaticPickup(355,2,1420.3854,2878.2087,10.8203); // ak-casa 3
	AddStaticPickup(355,2,1420.3193,2877.3989,10.8203); // ak-casa 4
	AddStaticPickup(355,2,1420.2551,2876.6152,10.8203); // ak-casa 5
	AddStaticPickup(323,2,1420.5574,2871.9189,10.8203); // dildo-casa
	AddStaticPickup(324,2,1420.5702,2871.1716,10.8203); // dildo-casa 2
	AddStaticPickup(372,2,1420.5946,2869.7476,10.8203); // tec9-casa
	AddStaticPickup(372,2,1420.6025,2869.2869,10.8203); // tec9-casa 2
	AddStaticPickup(372,2,1420.6144,2868.5874,10.8203); // tec9-casa 3
	AddStaticPickup(372,2,1420.6254,2867.9458,10.8203); // tec9 casa 4
	AddStaticPickup(365,2,1421.0168,2864.0776,10.8203); // motoserra-casa
	AddStaticPickup(341,2,1420.9180,2863.3215,10.8203); // motosserra casa
	AddStaticPickup(349,2,1423.6455,2861.7571,10.8203); // 12-casa
	AddStaticPickup(349,2,1422.6477,2861.6487,10.8203); // 12-casa 2
	AddStaticPickup(349,2,1420.4092,2861.1465,10.8203); // 12-casa 3
	AddStaticPickup(349,2,1421.7029,2859.5039,10.8203); // 12-casa 4
	AddStaticPickup(349,2,1424.0735,2859.1077,10.8203); // 12-casa 6
	AddStaticPickup(351,2,1430.5070,2880.6848,10.8203); // combat-casa
	AddStaticPickup(351,2,1429.6902,2879.9668,10.8203); // combat-casa 2
	AddStaticPickup(351,2,1427.5771,2881.7117,10.8203); // combat-casa 3
	AddStaticPickup(351,2,1427.4128,2877.2107,10.8203); // combat-casa 4
	AddStaticPickup(351,2,1430.7842,2876.5879,10.8203); // combat-casa 5

	new File:temp;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	temp = fopen("carrosmpa.rpg", io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid    = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		ang        = Float:floatstr(strtok(tmp, index));
		Cor1       = strval(strtok(tmp, index));
		Cor2       = strval(strtok(tmp, index));

		cAddStaticVehicle(modelid, X, Y, Z, ang, Cor1, Cor2);
	}
	fclose(temp);

	SetTimer("Bancos", 500, 1);
	SetTimer("CheckFuel", 50000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("ATaxi", 5000, 1);
	SetTimer("MTaxi", 5000, 1);
	SetTimer("Tempo", 60000, 1);
	SetTimer("Speed",1000,true);
	return 1;
	}
	
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerColor(playerid,COLOR_UNLOGGED);
 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,-1868.1284,59.3926,1055.1921);
	SetPlayerFacingAngle(playerid, 180.0);
	SetPlayerCameraPos(playerid,-1868.1176,56.5010,1055.1975);
	SetPlayerCameraLookAt(playerid,-1868.1284,59.3926,1055.1921);
	if(PLAYERLIST_authed[playerid] == 1){
		PLAYERLIST_authed[playerid] = 0;
	}
	return 1;
}

public OnGameModeExit(playerid)
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
	print("Saindo do GameMode RPG");
	return 1;
}

public OnPlayerConnect(playerid)
{
	SetPlayerColor(playerid,COLOR_UNLOGGED);
	Profissao[playerid] = 0;
	Log[playerid] = 0;
	GameTextForPlayer(playerid, "Bem vindo ao MPA PoWeR RPG!~n~coders: Smurf e Matraka", 5000, 6);
	SendClientMessage(playerid, COLOR_MOTORISTA, "MPA� PoWeR RPG v1.1 final! - compila��o n� 357");
	SendClientMessage(playerid, COLOR_YELLOW, "Quer ajuda? /ajuda");
	SendClientMessage(playerid, COLOR_YELLOW, "Comandos? /comandos");
	SendClientMessage(playerid, COLOR_YELLOW, "Rec�m-chegado? /aprender");
if (udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COLOR_RED, "Voc� j� est� registrado. Fa�a login com /logar [senha]");
	return 1;
}
if (!udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� registrado. Registre-se com /registrar [senha]");
	return 1;
}

	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	return false;
}

public OnPlayerDisconnect(playerid)
{
	if (PLAYERLIST_authed[playerid] == 1) {
	// Was loggedin, so save the data!
		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		new Float:health;
		Presos[playerid] = 0;
		Procurados[playerid] = 0;
		GetPlayerHealth(playerid, health);
		udb_setHealth(PlayerName(playerid), health);
		udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
		PLAYERLIST_authed[playerid] = 0;
		printf("Jogador %s (ID: %d) deixou o servidor. Seus dados foram salvos com sucesso",PlayerName(playerid),playerid);
	}
	else {
printf("Jogador %s (ID: %d) deixou o servidor sem se registrar/logar",PlayerName(playerid),playerid);
return 0;
}
return 1;
}

public OnPlayerSpawn(playerid)
{
    	if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COLOR_DESEMPREGADO); // Cinza
		GivePlayerWeapon(playerid,6,0);
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COLOR_TAXISTA); // Amarelo
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == TAXISTA_AEREO) {
		SetPlayerColor(playerid, COLOR_TAXISTA_AEREO); // Amarelo
		GivePlayerWeapon(playerid,25,100);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == MOTOTAXISTA) {
		SetPlayerColor(playerid, COLOR_MOTOTAXISTA); // Amarelo
		GivePlayerWeapon(playerid,25,100);
        GivePlayerWeapon(playerid,23,500);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR); // Verde
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COLOR_CORRETOR); // Marfin
		GivePlayerWeapon(playerid,15,0);
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COLOR_ASSASSINO); // Vermelho
		GivePlayerWeapon(playerid,4,0);
		GivePlayerWeapon(playerid,23,350);
		GivePlayerWeapon(playerid,26,400);
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COLOR_BARMAN); // Bege
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COLOR_JUIZ); // verde
		GivePlayerWeapon(playerid,15,0);
		GivePlayerWeapon(playerid,22,300);
	}
	else if(Profissao[playerid] == SEGURAN�A) {
		SetPlayerColor(playerid, COLOR_SEGURAN�A); // Azul claro
		GivePlayerWeapon(playerid,24,400);
		GivePlayerWeapon(playerid,26,700);
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COLOR_MOTORISTA); // Laranja
		GivePlayerWeapon(playerid,41,900);
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COLOR_COP_CIVIL); // Azul
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,24,500);
		GivePlayerWeapon(playerid,25,100);
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COLOR_COP_RODOVIARIO); // Azul
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,24,500);
		GivePlayerWeapon(playerid,25,100);
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COLOR_COP_ELITE); // Azul Claro
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,24,500);
		GivePlayerWeapon(playerid,27,100);
	}
	else if(Profissao[playerid] == CACADOR) {
	    SetPlayerColor(playerid, COLOR_CACADOR); //sienna
	    GivePlayerWeapon(playerid,33,100);
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COLOR_PESCADOR); // Bege
		GivePlayerWeapon(playerid,14,0);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COLOR_INSTRUTOR); // VClaro
		GivePlayerWeapon(playerid,14,0);
	}
	else if(Profissao[playerid] == TRAFICANTE) {
	    SetPlayerColor(playerid, COLOR_TRAFICANTE); //burlywood
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COLOR_MOTORISTA_ONIBUS); // Claro
		GivePlayerWeapon(playerid,42,400);
	}
	else if(Profissao[playerid] == NARCOTICOS) {
	    SetPlayerColor(playerid, COLOR_NARCOTICOS);
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	}
	else if(Profissao[playerid] == CAMINHONEIRO) {
	    SetPlayerColor(playerid,COLOR_CAMINHONEIRO);
        GivePlayerWeapon(playerid,25,100);
        GivePlayerWeapon(playerid,5,0);
   	}
	else if(Profissao[playerid] == JORNALISTA) {
	    SetPlayerColor(playerid,COLOR_JORNALISTA);
	    GivePlayerWeapon(playerid,43,20);
	    GivePlayerWeapon(playerid,5,0);
	    GivePlayerWeapon(playerid,28,800);
	}
	else if(Profissao[playerid] == IBAMA) {
	    SetPlayerColor(playerid,COLOR_IBAMA);
	    GivePlayerWeapon(playerid,3,0);
	    GivePlayerWeapon(playerid,22,100);
	}
	else if(Profissao[playerid] == POLICIA_FLORESTAL) {
	    SetPlayerColor(playerid,POLICIA_FLORESTAL);
        GivePlayerWeapon(playerid,3,0);
	    GivePlayerWeapon(playerid,22,100);
	}
	else if(Profissao[playerid] == PARAMEDICO) {
	    SetPlayerColor(playerid,COLOR_WHITE);
	    GivePlayerWeapon(playerid,29,500);
	    GivePlayerWeapon(playerid,28,80);
	}
	else if(Profissao[playerid] == ADVOGADO) {
	    SetPlayerColor(playerid,COLOR_ADVOGADO);
	    GivePlayerWeapon(playerid,24,150);
	}
	else if(Profissao[playerid] == AGRICULTOR) {
	    SetPlayerColor(playerid,COLOR_AGRICULTOR);
	    GivePlayerWeapon(playerid,6,0);
	    GivePlayerWeapon(playerid,25,100);
	}
	else if(Profissao[playerid] == VENDEDOR_ARMAS) {
	    SetPlayerColor(playerid,COLOR_VENDEDOR_ARMAS);
        GivePlayerWeapon(playerid,32,1000);
	    GivePlayerWeapon(playerid,22,100);
	    GivePlayerWeapon(playerid,30,500);
 	}
 	else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
	    SetPlayerColor(playerid,COLOR_ENTREGADOR_PIZZA);
	    GivePlayerWeapon(playerid,23,150);
	    GivePlayerWeapon(playerid,4,0);
	}
	else if(Profissao[playerid] == SEQUESTRADOR) {
	    SetPlayerColor(playerid,COLOR_SEQUESTRADOR);
	    GivePlayerWeapon(playerid,30,600);
	    GivePlayerWeapon(playerid,32,600);
 	}
	else{
	    SetPlayerColor(playerid, COLOR_DESEMPREGADO);
	}
    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid,		 0);
	if(PLAYERLIST_authed[playerid] == 0){
		SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		SetPlayerFacingAngle(playerid, 90.0000);
		TogglePlayerControllable(playerid, 0);
    return 1;
	}
	else{
	    TogglePlayerControllable(playerid, 1);
    return 1;
	}

return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(GetClosestHospital(playerid) == 0){
    	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6501, 634.4510, 14.4531, 180.0000, 0, 0, 0, 0, 0, 0);
    }
    else if(GetClosestHospital(playerid) == 1){
    	SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1173.5842,-1324.5615,15.1953,278.4624,0,0,0,0,0,0);
    }
    else if(GetClosestHospital(playerid) == 2){
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),2031.9415,-1404.3578,17.2614,165.8180,0,0,0,0,0,0);
    }
    else if(GetClosestHospital(playerid) == 3){
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1582.5615,1768.7921,10.8203,93.7454,0,0,0,0,0,0);
    }
    SendClientMessage(playerid, COLOR_RED, "A equipe de enfermeiros tratou de voc� com cuidado e lhe cobrou $100.");
    SendClientMessage(playerid, COLOR_YELLOW, "Nosso hospital faz d�bito autom�tico em conta corrente! xD");
    udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 100);

	if(Procurados[playerid] == 1){
	    Procurados[playerid] = 0;
	    Presos[playerid] = 1;
		udb_setPrisao(PlayerName(playerid), 1);
		LogarPlayer(playerid);
	}
	if(killerid == INVALID_PLAYER_ID) {
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
        SendClientMessage(playerid,COLOR_RED,"Al�m disso, a equipe de m�dicos lhe roubou todo seu dinheiro,");
        SendClientMessage(playerid,COLOR_RED,"enquanto voc� estava inconsciente.");
        ResetPlayerMoney(playerid);
	}
	else{
		SendDeathMessage(killerid,playerid,reason);
		if (GetPlayerMoney(playerid) > 0)  {
		    SendClientMessage(playerid,COLOR_RED,"Al�m disso, seu assassino lhe roubou todo seu dinheiro,");
		    SendClientMessage(playerid,COLOR_RED,"enquanto voc� estava agonizando.");
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

public OnPlayerText(playerid)
{
	printf("OnPlayerText(%d)", playerid);
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
	if(strcmp(cmd, "/piracemaon",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COLOR_RED,"A piracema j� est� ativada!");
	        return 1;
	        } else {
	            SendClientMessageToAll(COLOR_RED,"A piracema est� ativada, quem for pego pescando ser� preso.");
	            SendClientMessage(playerid,COLOR_WHITE,"Feito.");
	            Piracema = 1;
	        return 1;
	        }
	    return 1;
	    } else {
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
	    }
	return 1;
	}
	if(strcmp(cmd,"/temporadacacaoff",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COLOR_RED,"A temporada de ca�a j� est� desativada!");
	        return 1;
	        } else {
	            SendClientMessageToAll(COLOR_RED,"A temporada de ca�a est� desativada, quem for pego ca�ando ser� preso.");
	            SendClientMessage(playerid,COLOR_WHITE,"Feito.");
	            TemporadaCaca = 0;
	        return 1;
	        }
	    return 1;
	    } else {
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
	    }
	return 1;
	}
	if(strcmp(cmd,"/piracemaoff",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COLOR_RED,"A piracema n�o est� ativada!");
			return 1;
			} else {
			    SendClientMessageToAll(COLOR_GREEN,"A piracema agora est� desativada. Pode pescar � vontade!");
			    SendClientMessage(playerid,COLOR_WHITE,"Feito.");
			    Piracema = 0;
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/temporadacacaon",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COLOR_RED,"A temporada de ca�a j� est� ativada!");
			return 1;
			} else {
			    SendClientMessageToAll(COLOR_GREEN,"A temporada de ca�a agora est� ativada. Pode ca�ar � vontade!");
			    SendClientMessage(playerid,COLOR_WHITE,"Feito.");
			    TemporadaCaca = 1;
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/prenderpesca",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/prenderpesca [id]");
			return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(Piracema == 0){
			        SendClientMessage(playerid,COLOR_RED,"A piracema n�o est� ativada para voc� efetuar a pris�o!");
				return 1;
				} else {
				    if(PescaInProgress[plid] == 0){
				        SendClientMessage(playerid,COLOR_RED,"O jogador n�o est� pescando!");
					return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
					        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar a pris�o!");
						return 1;
						} else {
						    udb_setPrisao(PlayerName(plid),1);
						    LogarPlayer(plid);
						return 1;
						}
					return 1;
					}
				return 1;
				}
			return 1;
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/prendercaca",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/prenderpesca [id]");
			return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(TemporadaCaca == 1){
			        SendClientMessage(playerid,COLOR_RED,"A temporada de ca�a est� ativada, por isso voc� n�o pode prend�-lo!");
				return 1;
				} else {
				    if(CacaInProgress[plid] == 0){
				        SendClientMessage(playerid,COLOR_RED,"O jogador n�o est� ca�ando!");
					return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
					        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar a pris�o!");
						return 1;
						} else {
						    udb_setPrisao(PlayerName(plid),1);
						    LogarPlayer(plid);
						return 1;
						}
					return 1;
					}
				return 1;
				}
			return 1;
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/telepizza", true)==0){
	    SendClientMessage(playerid,COLOR_YELLOW,"Uma pizza est� a caminho!");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Profissao[i] == ENTREGADOR_PIZZA || IsPlayerAdmin(i)){
	            new msg[256];
	            format(msg,sizeof(msg),"O jogador %s solicita uma pizza.",PlayerName(playerid));
	            SendClientMessage(i,COLOR_ENTREGADOR_PIZZA,msg);
			return 1;
			}
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/entregarpizza",true)==0){
	    if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
	        	SendClientMessage(playerid,COLOR_RED,"/entregarpizza [id]");
			return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(GetDistanceBetweenPlayers(plid,playerid) > 20){
			        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto.");
				return 1;
				} else {
				    SendClientMessage(playerid,COLOR_ENTREGADOR_PIZZA,"Pizza entregue.");
				    SendClientMessage(plid,COLOR_ENTREGADOR_PIZZA,"Voc� se deliciou com uma pizza da Well Stacked Pizza Co.");
				    GivePlayerMoney(playerid,10);
				    GivePlayerMoney(plid,-10);
				    SetPlayerHealth(plid,100);
				return 1;
				}
			return 1;
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/advogado", true)==0){
 		SendClientMessage(playerid, COLOR_ADVOGADO, "Um dos advogados de San Fierro, ira lhe defender no tribunal de San Andreas.");
   		for(new i=0; i<MAX_PLAYERS; i++){
     		if(IsPlayerConnected(i) && Profissao[i] == ADVOGADO || IsPlayerAdmin(i)){
     		    new string[256];
				format(string, sizeof(string), "O jogador %s solicita um advogado.", PlayerName(playerid));
				SendClientMessage(i, COLOR_ADVOGADO, string);
			return 1;
			}
		return 1;
		}
	return 1;
	}
	if (strcmp(cmd, "/processo", true)==0){
		if(Profissao[playerid] == ADVOGADO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
	    	strmid(tmp, cmdtext, 10, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/processo [ nome do r�u e descri��o da causa ]");
			return 1;
			}
		    SendClientMessage(playerid, COLOR_ADVOGADO, "Voce fez a defesa do seu cliente e o processo est� em andamento, aguarde a senten�a do juiz");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == JUIZ || IsPlayerAdmin(playerid)){
					format(string, sizeof(string), "O Dr.%s entrou com um peti��o em defesa do r�u %s.", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_JUIZ, string);
				return 1;
		        }
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/verpesca",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/verpesca [id]");
			return 1;
			}
			plid = strlen(tmp);
   			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
   			    if(PescaInProgress[plid] == 0){
   			        SendClientMessage(playerid,COLOR_GREEN,"O jogador n�o est� pescando");
				return 1;
				} else {
				    SendClientMessage(playerid,COLOR_GREEN,"O jogador est� pescando");
				return 1;
				}
			return 1;
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/vercaca",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/verpesca [id]");
			return 1;
			}
			plid = strlen(tmp);
   			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
   			    if(CacaInProgress[plid] == 0){
   			        SendClientMessage(playerid,COLOR_GREEN,"O jogador n�o est� ca�ando.");
				return 1;
				} else {
				    SendClientMessage(playerid,COLOR_GREEN,"O jogador est� ca�ando.");
				return 1;
				}
			return 1;
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd,"/vendermilho",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na Fazenda.");
			return 1;
			} else {
			    if(QtMilho[playerid] == 0){
			        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem milho para vender.");
				return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtMilho[playerid]*100;
					format(msg, sizeof(msg),"Voc� vendeu %d ca�a(s) por $100 cada e faturou $%d com a venda.",QtCacas[playerid],quantia);
					SendClientMessage(playerid,COLOR_AGRICULTOR,msg);
					GivePlayerMoney(playerid,quantia);
					QtMilho[playerid] = 0;
				return 1;
				}
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/vendepesca", true) == 0) {
	    new msg[256];
	    new quantia;
	    if(AreaCoopPesca[playerid] == 1){
	    	if(QtPescas[playerid] == 0){
	        	SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem nenhuma pesca, como poder� vender?");
	        	return 1;
			} else {
		    	if(Profissao[playerid] == PESCADOR) {
		   			quantia = QtPescas[playerid]*130;
		   			GivePlayerMoney(playerid,quantia);
					format(msg,sizeof(msg),"Voc� vendeu %d pesca(s) por $130 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COLOR_GREEN, msg);
					QtPescas[playerid] = 0;
					return 1;
				}
				else {
				    quantia = QtPescas[playerid]*100;
				    GivePlayerMoney(playerid,quantia);
				    format(msg,sizeof(msg),"Voc� vendeu %d pesca(s) por $100 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COLOR_GREEN, msg);
					QtPescas[playerid] = 0;
					return 1;
				}
			}
		return 1;
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na Cooperativa de Pesca.");
		}
	return 1;
	}
	if(strcmp(cmd, "/venderarma", true) == 0) {
        if(Profissao[playerid] == VENDEDOR_ARMAS || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, weaponid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/venderarma [id] [arma-id]");
			return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/venderarma [id] [arma-id]");
			return 1;
			}
			weaponid= strval(tmp);
			if(weaponid< 0 || weaponid > 46){
			    SendClientMessage(playerid, COLOR_RED, "0-46 s�o os ids de armas.");
			return 1;
			}
			else{
			   if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					 if(IsPlayerConnected(plid)){
					 Armas[plid] =weaponid;
					 GivePlayerWeapon(playerid, weaponid, 99999);
						format(string, sizeof(string), "Voc� compro a arma: %d", weaponid);
			            SendClientMessage(plid, COLOR_JUIZ, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Arma vendida!!");
					return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
					return 1;
					}
				return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Chegue mais perto para entregar a arma.");
				return 1;
				}
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != VENDEDOR_ARMAS){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o � vendedor de armas!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/vendecaca",true) == 0) {
	    if(Profissao[playerid] == CACADOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopCaca[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na Cooperativa de Ca�a.");
			return 1;
			} else {
			    if(QtCacas[playerid] == 0){
			        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem ca�as acumuladas.");
				return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtCacas[playerid]*100;
					format(msg, sizeof(msg),"Voc� vendeu %d ca�a(s) por $100 cada e faturou $%d com a venda.",QtCacas[playerid],quantia);
					SendClientMessage(playerid,COLOR_GREEN,msg);
					GivePlayerMoney(playerid,quantia);
					QtCacas[playerid] = 0;
				return 1;
				}
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd,"/descarregar",true) == 0){
	    if(Profissao[playerid] == CAMINHONEIRO || IsPlayerAdmin(playerid)){
	        if(AreaDescarga[playerid] == 1){
	            if(Carregamento[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"Seu ve�culo n�o est� carregado!");
				return 1;
				} else {
				    Carregamento[playerid] = 0;
				    SendClientMessage(playerid,COLOR_GREEN,"Seu ve�culo foi descarregado.");
				    GivePlayerMoney(playerid,100);
				return 1;
				}
			return 1;
			} else {
				SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� na �rea de carga");
			return 1;
			}
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/carregar", true) == 0) {
	    if(Profissao[playerid] == CAMINHONEIRO || IsPlayerAdmin(playerid)){
	        if(AreaCarga[playerid] == 1){
				new modelo;
				cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
				if(modelo == VEH_RDTRAIN){
				    if(Carregamento[playerid] == 0){
				    	SendClientMessage(playerid,COLOR_GREEN,"Ve�culo carregado!");
				    	SendClientMessage(playerid,COLOR_GREEN,"Para descarreg�-lo, v� a �rea de descarga, RS Haul (perto de um posto)");
				    	Carregamento[playerid] = 1;
					return 1;
					} else {
				        SendClientMessage(playerid,COLOR_RED,"Seu caminh�o j� est� carregado!");
					return 1;
					}
				return 1;
				} else {
				    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um caminh�o ROADTRAIN!");
				return 1;
				}
	        return 1;
	        } else {
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na �rea de carga!");
			return 1;
			}
	    return 1;
	    }
	    else{
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
	    return 1;
	    }
	return 1;
	}
	if(strcmp(cmd, "/vheroina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COLOR_RED,"/vheroina [id] [quantidade]");
			return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/vheroina [id] [quantidade]");
			return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� louco? Quer matar o seu cliente? Doses de 1 a 7");
			return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Te peguei, bichinho! Querendo enganar o fregu�s, n�o? Doses de 1 � 7");
			return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COLOR_RED, "O jogador que voc� indicou n�o est� conectado.");
			    return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COLOR_RED, "Chege mais perto para aplicar a inje��o.");
					return 1;
					} else {
			        	if(Heroina[plid] == 7){
			        	  	SendClientMessage(playerid,COLOR_RED, "Voc� quer matar seu cliente!");
						return 1;
						} else {
					    	Heroina[plid] = mili;
					    	SendClientMessage(playerid,COLOR_GREEN, "Miss�o cumprida!");
					    	format(msg,sizeof(msg),"Voc� est� agora com %d doses de hero�na no sangue",mili);
					    	SendClientMessage(plid,COLOR_WHITE,msg);
						return 1;
						}
					return 1;
					}
				return 1;
				}
			return 1;
			}
		} else {
		SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/vmaconha", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COLOR_RED,"/vmaconha [id] [quantidade]");
			return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/vmaconha [id] [quantidade]");
			return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� louco? Quer matar o seu cliente? Doses de 1 a 10");
			return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Te peguei, bichinho! Querendo enganar o fregu�s, n�o? Doses de 1 � 7");
			return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COLOR_RED, "O jogador que voc� indicou n�o est� conectado.");
			    return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COLOR_RED, "Chege mais perto para vender o bagulho.");
					return 1;
					} else {
			        	if(Maconha[plid] == 10){
			        	  	SendClientMessage(playerid,COLOR_RED, "Voc� quer matar seu cliente!");
						return 1;
						} else {
					    	Maconha[plid] = mili;
					    	SendClientMessage(playerid,COLOR_GREEN, "Miss�o cumprida!");
					    	format(msg,sizeof(msg),"Est� concentrada em seu pulm�o %d doses de maconha.",mili);
					    	SendClientMessage(plid,COLOR_WHITE,msg);
						return 1;
						}
					return 1;
					}
				return 1;
				}
			return 1;
			}
		} else {
		SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
		if(strcmp(cmd, "/vcocaina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COLOR_RED,"/vcocaina [id] [quantidade]");
			return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/vcocaina [id] [quantidade]");
			return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� louco? Quer matar o seu cliente? Doses de 1 a 7");
			return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Te peguei, bichinho! Querendo enganar o fregu�s, n�o? Doses de 1 � 7");
			return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COLOR_RED, "O jogador que voc� indicou n�o est� conectado.");
			    return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COLOR_RED, "Chege mais perto para vender o bagulho.");
					return 1;
					} else {
			        	if(Cocaina[plid] == 7){
			        	  	SendClientMessage(playerid,COLOR_RED, "Voc� quer matar seu cliente!");
						return 1;
						} else {
					    	Cocaina[plid] = mili;
					    	SendClientMessage(playerid,COLOR_GREEN, "Miss�o cumprida!");
					    	format(msg,sizeof(msg),"Seu pulm�o est� carregado com %d doses de coca�na.",mili);
					    	SendClientMessage(plid,COLOR_WHITE,msg);
						return 1;
						}
					return 1;
					}
				return 1;
				}
			return 1;
			}
		} else {
		SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/setcomb", true) == 0) {
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new msg[256];
			new petroleo;
			new plid, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/setcomb [id] [quantidade]");
			return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcomb [id] [quantidade]");
			return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COLOR_RED, "Quantidade inv�lida. Os valores devem ser de 1 � 100.");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			if((Petrol[plid] + comb) < 100){
			    petroleo = Petrol[plid] + comb;
			    udb_setGasoline(PlayerName(plid), petroleo);
				Petrol[plid] = petroleo;
				format(msg,sizeof(msg),"Um admin colocou %d litros de combust�vel em seu tanque, totalizando %d litros",comb,petroleo);
				SendClientMessage(plid,COLOR_GREEN,msg);
				SendClientMessage(plid,COLOR_GREEN,"V� se n�o gasta � toa!");
				SendClientMessage(playerid,COLOR_GREEN,"Combust�vel fornecido.");
				printf("O admin %s (ID %d) colocou %d litros de combust�vel no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
			return 1;
			}
			else if((Petrol[plid] + comb) >= 100){
			    udb_setGasoline(PlayerName(plid), 100);
				petroleo = 100 - Petrol[plid];
				Petrol[plid] = 100;
				format(msg,sizeof(msg),"Um admin completou seu tanque, colocando %d litros",petroleo);
				SendClientMessage(plid,COLOR_GREEN,msg);
				SendClientMessage(plid,COLOR_GREEN,"V� se n�o gasta � toa!");
				SendClientMessage(playerid,COLOR_GREEN,"Combustivel fornecido.");
				printf("O admin %s (ID %d) completou o combust�vel de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
			return 1;
			}
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado/logado.");
			return 1;
			}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o!");
		    printf("O jogador %s (ID %d) tentou modificar o combust�vel de algu�m, mas n�o possui permiss�o",PlayerName(playerid),playerid);
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	// The command shouldn't work if an account with this
    	// nick already exists
    	if (udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "T� querendo se registrar duas vezes???");
		return 1;
		}

		// The command shouldn't work if we already are authed
    	if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "T� querendo registrar-se logado???");
		return 1;
		}

    	// Did he forgot the password?
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Ei, voc� esqueceu de mencionar uma senha. Use /registrar [senha]");
		return 1;
		}

    	// We save the money to the accstate
    	else{
    	    PLAYERLIST_authed[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*senha*/, 0 /*grana*/, 0 /*skin*/, 5000 /*gbanco*/, 15 /*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 1 /*prof*/, ""/*clantag*/, -1757.9701/*X*/, 960.9874/*Y*/, 24.8828/*Z*/, 180.0000/*ang*/, 100.0 /*hp*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			udb_setGasoline(PlayerName(playerid), 15);
			Petrol[playerid] = 15;
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SetPlayerColor(playerid, COLOR_DESEMPREGADO);
			SendClientMessage(playerid, COLOR_GREEN, "Registrado e logado.");
			SendClientMessage(playerid, COLOR_GREEN, "Voc� t�m $5000 no banco para come�ar a viver + 15l de combust�vel.");
			printf("O jogador %s (ID %d) acabou de se registrar",PlayerName(playerid),playerid);
    	return 1;
		}
 	}

	if(strcmp(cmd, "/logar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    // The command shouldn't work if an account with this
	    // nick does not exists
	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Hum, acho que voc� n�o entendeu. VOC� N�O EST� REGISTRADO!");
		return 1;
		}

		// The command shouldn't work if we already are authed
	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Logar-se duas vezes??? Imposs�vel aqui.");
		return 1;
		}

	    // Did he forgot the password?
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Voc� tem senha. /logar [senha]");
		return 1;
		}

	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
			PLAYERLIST_authed[playerid] = 1;
			LogarPlayer(playerid);
			printf("O jogador %s (ID %d) acabou de se logar",PlayerName(playerid),playerid);
		return 1;
		}
		else {
	       // Login was incorrect
			SendClientMessage(playerid, COLOR_RED, "SENHA INCORRETA!");
		return 1;
	    }
	return 1;
	}

	if(strcmp(cmd, "/logarplayer", true) == 0){
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			    LogarPlayer(playerid);
			    return 1;
			}
			plid = strval(tmp);
			    if(IsPlayerConnected(plid) == 0){
					SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/ID inv�lido");
					return 1;
				}
				else {
					LogarPlayer(plid);
					SendClientMessage(playerid,COLOR_GREEN,"Feito.");
					return 1;
				}
			}
			else {
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o � admin, portanto, n�o tem permiss�o para fazer isso.");
				return 1;

		}
	}

	if(strcmp(cmd, "/casa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/casa [nick]");
			return 1;
			}
    		if (udb_Exists(tmp)) {
		        new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(tmp, X, Y, Z);
			    udb_setAng(tmp, 0);
			    SendClientMessage(playerid, COLOR_GREEN, "Casa salva");
			    printf("%s acaba de setar uma casa para %s",PlayerName(playerid),tmp);
    	    return 1;
    	    }
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o!");
		return 1;
		}
    return 1;
	}
	if(strcmp(cmd, "/curativo", true) == 0) {
	    if(Profissao[playerid] == PARAMEDICO) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COLOR_RED, "/curativo [id]");
			return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado");
			return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COLOR_GREEN, "Miss�o cumprida!");
			    	SendClientMessage(plid, COLOR_WHITE, "Um param�dico encheu sua barra de sa�de!");
			    	SetPlayerHealth(plid,100);
			    	GivePlayerMoney(plid,-20);
			    	GivePlayerMoney(playerid,20);
				return 1;
				} else {
				    SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para aplicar o curativo!");
				return 1;
				}
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Apenas param�dicos podem fazer isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/skin", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/skin [id] [id-skin]");
			return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/skin [id] [id-skin]");
			return 1;
			}
			skin = strval(tmp);
			if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
				SendClientMessage(playerid, COLOR_RED, "ID de skin inv�lido!");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			    udb_setSkin(PlayerName(plid), skin);
				SendClientMessage(playerid, COLOR_GREEN, "Skin fornecida.");
				SendClientMessage(plid, COLOR_GREEN, "Foi fornecida a voc� uma nova skin (n�o, n�o � cerveja n�o!)");
				SetPlayerSkin(plid,skin);
				printf("%s forneceu a %s uma nova skin",PlayerName(playerid),PlayerName(plid));
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado/logado.");
			return 1;
			}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COLOR_YELLOW, "/comandos : Comandos desse gamemode");
        SendClientMessage(playerid, COLOR_YELLOW, "/registrar [senha] : Registrar-se");
        SendClientMessage(playerid, COLOR_YELLOW, "/logar [senha] : Logar-se");
        SendClientMessage(playerid, COLOR_YELLOW, "/aprender : Mostra uma breve explica��o sobre o RPG.");
        SendClientMessage(playerid, COLOR_YELLOW, "/creditos : V� os creditos do RPG Mode");
	return 1;
	}

	if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "MPA� PoWeR RPG beta");
	    SendClientMessage(playerid, COLOR_YELLOW, " ");
	    SendClientMessage(playerid, COLOR_YELLOW, "Mode desenvolvido especialmente para o clan MPA.");
	    SendClientMessage(playerid, COLOR_YELLOW, "Scripting: Matraka, Guilherme, Smurf, Texugo");
		SendClientMessage(playerid, COLOR_YELLOW, "Id�ias: Smurf, Guilherme");
		SendClientMessage(playerid, COLOR_YELLOW, "Beta-Testers: Matraka, Guilherme, Fernando, Smurf");
		SendClientMessage(playerid, COLOR_YELLOW, "Visite nosso site http://mpaclan.gtabrasil.net");
	return 1;
	}

	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_GRAY, "MPA� PoWeR RPG beta");
	    SendClientMessage(playerid, COLOR_WHITE, "Como diz o nome, esse gamemode � um RPG, que simula a vida real..");
	    SendClientMessage(playerid, COLOR_WHITE, "Aqui voc� poder� trabalhar para ganhar dinheiro, e poder comprar casas e carros.");
	    SendClientMessage(playerid, COLOR_WHITE, "Na vida real existem crimes. Se voc� fizer crimes aqui, a pol�cia tentar� te prender.");
		SendClientMessage(playerid, COLOR_WHITE, "Se dirigir sem habilita��o, poder� pegar multa. Note que h� tr�s tipos de habilita��o:");
		SendClientMessage(playerid, COLOR_WHITE, "Terrestre (ve�culos terrestres), n�utica (ve�culos n�uticos) e a�rea (ve�culos a�reos).");
		SendClientMessage(playerid, COLOR_WHITE, "Espero que divirta-se com nosso gamemode. S�o os votos do clan MPA!");
		SendClientMessage(playerid, COLOR_MOTORISTA, "Comandos??? /ajuda ou /comandos.");
	return 1;
	}

	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_MOTORISTA, "Comandos do RPG");
		SendClientMessage(playerid, COLOR_YELLOW, "/profs : mostra as profissoes do RPG. | /190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(playerid, COLOR_YELLOW, "/mandagrana : Envia dinheiro a algum jogador. | /presos : V� a lista de pessoas presas.");
		SendClientMessage(playerid, COLOR_YELLOW, "/trancar : Tranca seu carro. | /procurados : V� a lista de procurados pela policia");
		SendClientMessage(playerid, COLOR_YELLOW, "/destrancar : Destranca seu carro. | /pescar : Joga a rede pra pescar, voc� deve estar na �rea de pesca.");
		SendClientMessage(playerid, COLOR_YELLOW, "/documentos [id] : Mostra seus documentos. | /say [texto] : Manda mensagem para pessoas proximas a voc�.");
		SendClientMessage(playerid, COLOR_YELLOW, "/relogio : Mostra o hor�rio em SF. | /profissao : Comandos de sua profiss�o.");
		SendClientMessage(playerid, COLOR_YELLOW, "/taxi [lugar] : Chama um taxi. | /banco : Comandos do Banco.");
		SendClientMessage(playerid, COLOR_YELLOW, "/abastecer [litros] : Abastecer (voc� deve estar num posto para usar este comando).");
		SendClientMessage(playerid, COLOR_YELLOW, "/pagar [id] [quantidade] : Paga por algum servi�o de corretor ou vendedor de carros.");
	return 1;
	}

	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Comandos do Banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/saldo : checa seu o saldo banc�rio..");
        SendClientMessage(playerid, COLOR_YELLOW, "/saldocell : checa seu o saldo banc�rio atrav�s do seu celular, custo $5.");
        SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esses comandos, menos o /bscell.");
        SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car Shop, SF Train Station e SA Federal Mint.");
	return 1;
	}

	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Profiss�es dispon�veis no .:MPA� PoWeR RPG:.");
        SendClientMessage(playerid, COLOR_DESEMPREGADO, "1 - Desempregado (Sal�rio: $350)");
        SendClientMessage(playerid, COLOR_TAXISTA, "2 - Taxista (Sal�rio: $900)");
        SendClientMessage(playerid, COLOR_VENDEDOR, "3 - Vendedor de ve�culos/skins (Sal�rio: $200 + comiss�o)");
        SendClientMessage(playerid, COLOR_CORRETOR, "4 - Corretor de im�veis (Sal�rio: $200 + comiss�o)");
        SendClientMessage(playerid, COLOR_ASSASSINO, "5 - Assassino (Sal�rio: o dinheiro de quem voc� matar)");
        SendClientMessage(playerid, COLOR_BARMAN, "6 - Barman (Sal�rio: $850 + as bebidas que vender)");
        SendClientMessage(playerid, COLOR_JUIZ, "7 - Juiz (Sal�rio: $2000 menos o dinheiro do mensal�o)");
        SendClientMessage(playerid, COLOR_SEGURAN�A, "8 - Seguran�a (Sal�rio: $850 + o que o patr�o pagar)");
        SendClientMessage(playerid, COLOR_GRAY, "Para mais profiss�es, escreva /profs2");
	return 1;
	}
	if(strcmp(cmd,"/profs2",true)==0){
	    SendClientMessage(playerid, COLOR_GREEN, "Profiss�es dispon�veis no .:MPA� PoWeR RPG:. Parte 2");
	    SendClientMessage(playerid, COLOR_MOTORISTA, "9 - Motorista Particular (Sal�rio: $850 + o que o patr�o pagar)");
	    SendClientMessage(playerid, COLOR_COP_CIVIL, "10 - Pol�cia Civil (Sal�rio: $1200)");
	    SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "11 - Policial Rodovi�rio (Sal�rio: $1200)");
	    SendClientMessage(playerid, COLOR_COP_ELITE, "12 - SWAT/Policial Elite (Sal�rio: $3000)");
	    SendClientMessage(playerid, COLOR_CACADOR, "13 - Ca�ador (Sal�rio: $1000)");
	    SendClientMessage(playerid, COLOR_PESCADOR, "14 - Pescador (Sal�rio: $750 + o que ganha em cada pesca)");
	    SendClientMessage(playerid, COLOR_INSTRUTOR, "15 - Instrutor de Dire��o (Sal�rio: $600 + comiss�o)");
	    SendClientMessage(playerid, COLOR_TRAFICANTE, "16 - Traficante (Sal�rio: $1200 + o que ganhar na venda de drogas)");
	    SendClientMessage(playerid, COLOR_GRAY, "Para mais profiss�es, escreva /profs3");
	return 1;
	}
	if(strcmp(cmd,"/profs3",true)==0){
	    SendClientMessage(playerid, COLOR_GREEN, "Profiss�es dispon�veis no .:MPA� PoWeR RPG:. Parte 3");
	    SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "17 - Motorista de �nibus (Sal�rio: $900)");
	    SendClientMessage(playerid, COLOR_JORNALISTA, "18 - Jornalista (Sal�rio: $1150)");
	    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "19 - Caminhoneiro (Sal�rio: $400 + o que ganha por carga)");
	    SendClientMessage(playerid, COLOR_NARCOTICOS, "20 - Narc�ticos (Sal�rio: $4000)");
	    SendClientMessage(playerid, COLOR_POLICIA_FLORESTAL, "21 - Pol�cia Florestal (Sal�rio: $2500)");
	    SendClientMessage(playerid, COLOR_IBAMA, "22 - IBAMA (Sal�rio: $2500)");
	    SendClientMessage(playerid, COLOR_ADVOGADO, "23 - Advogado (Sal�rio: $1000 + honor�rios)");
        SendClientMessage(playerid, COLOR_WHITE, "24 - Param�dico (Sal�rio: $900 + curativos)");
        SendClientMessage(playerid, COLOR_GRAY, "Para mais profiss�es, escreva /profs4");
   	return 1;
	}
	if(strcmp(cmd,"/profs4",true)==0){
	    SendClientMessage(playerid, COLOR_GREEN, "Profiss�es dispon�veis no .:MPA� PoWeR RPG:. Parte 4");
	    SendClientMessage(playerid, COLOR_AGRICULTOR, "25 - Agricultor (Sal�rio: $500 + o que plantar)");
        SendClientMessage(playerid, COLOR_VENDEDOR_ARMAS, "26 - Vendedor de Armas (Sal�rio: $1300 (pre�o a definir)");
        SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "27 - Entregador de Pizza (Sal�rio: $800");
        SendClientMessage(playerid, COLOR_SEQUESTRADOR, "28 - Sequestrador (Sal�rio: SEQUESTROS");
        SendClientMessage(playerid, COLOR_GRAY, "FIM DAS PROFS .:MPA� PoWeR RPG:.");
   	return 1;
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
		    SendClientMessage(playerid, COLOR_YELLOW, "Os taxistas foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TAXISTA){
					format(string, sizeof(string), "%s pede um taxi. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_YELLOW, string);
		        }
			}
		return 1;
		}
	return 1;
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
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
		return 1;
		}
	return 1;
	}
		if (strcmp(cmd, "/193", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/193 [local]");
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_COP_ELITE, "Os param�dicos foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s est� pedindo uma ambul�ncia urgente. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
		return 1;
		}
	return 1;
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
				SendClientMessage(playerid,COLOR_RED,"Voc� s� pode trancar as portas se estiver dirigindo.");
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
			SendClientMessage(playerid, COLOR_COP_ELITE, "Ve�culo trancado!");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1056,X,Y,Z);
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� em nenhum ve�culo!");
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
				SendClientMessage(playerid,COLOR_RED,"Voc� s� pode destrancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
			}
			SendClientMessage(playerid, COLOR_COP_ELITE, "Ve�culo destrancado!");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1057,X,Y,Z);
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� em nenhum ve�culo!");
		}
	return 1;
	}
	
	if(strcmp(cmd,"/multavelo",true)==0){
		if(IsPlayerAdmin(playerid)){
		    if(VeloMulta == 1){
		        SendClientMessage(playerid,COLOR_RED,"Multa por veloc�metro desligada.");
				VeloMulta = 0;
			return 1;
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Multa por veloc�metro ligada.");
			    VeloMulta = 1;
			return 1;
			}
		return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
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
				format(string, sizeof(string), "Voc� enviou a %s(id: %d) a import�ncia de $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "Voc� recebeu $%d de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s acaba de transferir $%d para %s",sendername,moneys,giveplayer);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Valor inv�lido.");
			}
		}
		else {
			format(string, sizeof(string), "%d n�o est� online.", giveplayerid);
			SendClientMessage(playerid, COLOR_YELLOW, string);
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
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem todo esse dinheiro. Ou est� tentando enviar $0.");
		return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, 0 - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		}
	return 1;
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
	        SendClientMessage(playerid, COLOR_RED, "Ei, psiu! Voc� quer sacar ou depositar???");
		return 1;
		}
		if(quantidade > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem essa quantidade toda no banco!");
		return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Voc� retirou $%d do banco. seu saldo atual � de $%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_YELLOW, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/saldo", true) == 0) {
		new string[256];
        if(IsPlayerInCheckpoint(playerid)){
			format(string, sizeof(string), "Voc� tem %d em sua conta.", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/saldocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 5){
            SendClientMessage(playerid, COLOR_YELLOW, "Custo: $5");
		return 1;
		}
		else{
		    GivePlayerMoney(playerid, 0 - 5);
			format(string, sizeof(string), "Mensagem de MPA Bankline: Voc� tem %d em sua conta.", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/idveiculo", true) == 0 && IsPlayerInAnyVehicle(playerid)) {
	    new id;
	    new modelo;
	    new msg[256];
	    id = GetPlayerVehicleID(playerid);
		cGetVehicleModelID(id,modelo);
	    format(msg, sizeof(msg), "O id de seu ve�culo � %d", modelo);
		SendClientMessage(playerid, COLOR_GREEN, msg);
		return 1;
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
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem dinheiro para pagar. Ou voc� est� querendo tirar combust�vel do tanque.");
		return 1;
		}
		if(AreaPosto[playerid] == 1){
			if(quantidade + Petrol[playerid] < 100){
			    Petrol[playerid] = Petrol[playerid] + quantidade;
			    format(string, sizeof(string), "Voc� comprou %d litros de combust�vel.", quantidade);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantidade);
				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
			return 1;
			}
			if(quantidade + Petrol[playerid] >= 100){
			    new quantia;
			    quantia = 100 - Petrol[playerid];
			    Petrol[playerid] = 100;
				format(string, sizeof(string), "Seu tanque est� cheio, foram colocados %d litros.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantia);
				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
			return 1;
			}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� no posto, consulte o mapa no f�rum para saber sua localiza��o");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/pagar", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pagar [id] [amount]");
		return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pagar [id] [amount]");
		return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == VENDEDOR_DE_CARROS || Profissao[plid] == CORRETOR){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem esse dinheiro! ou n�o est� querendo pagar de forma justa.");
			return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    new lucros;
				lucros = pagamento + pagamento/10;
 			    GivePlayerMoney(plid, lucros);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "Voc� vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
			return 1;
			}
		return 1;
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COLOR_RED, "Voc� est� tentando pagar alguem que n�o � coretor e nem vendedor!");
		return 1;
		}
	return 1;
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
		    hab[2] = udb_getHabaerea(PlayerName(playerid));
		    hab[0] = udb_gethabterre(PlayerName(playerid));
		    hab[1] = udb_getHabnauti(PlayerName(playerid));
			format(string, sizeof(string), "Identidade de: %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Skin :: %d", udb_getSkin(PlayerName(playerid)));
			SendClientMessage(plid, COLOR_YELLOW, string);
			if(hab[0] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "Habilita��o de Carros e Motos: N�O");
			}
			if(hab[0] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "Habilita��o de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "Habilita��o N�utica: N�O");
			}
			if(hab[1] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "Habilita��o N�utica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "Habilita��o A�rea: N�O");
			}
			if(hab[2] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "Habilita��o A�rea: SIM");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COLOR_YELLOW, string);
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador nao existe");
		}
	return 1;
	}

	if(strcmp(cmd, "/habaerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o a�rea concedida.");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o a�rea concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu a habilita��o de dire��o a�rea.");
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
			return 1;
			}
		return 1;
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem n�vel suficiente.");
		return 1;
		}
	return 1;
	}


	if(strcmp(cmd, "/habterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o terrestre concedida.");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o terrestre concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu a habilita��o de dire��o de carros e motos.");
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
			return 1;
			}
		return 1;
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem level o suficiente.");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/habnautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o n�utica concedida.");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o n�utica concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu a habilita��o de dire��o n�utica.");
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
			return 1;
			}
		return 1;
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem level o suficiente.");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/sequestrar", true) == 0) {
	    if(Profissao[playerid] == SEQUESTRADOR || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new distancia;
	    	new string[256];
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/sequestrar [id]");
			return 1;
			}
        	plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(distancia > 20){
			        SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
				return 1;
				}
				if(distancia <= 20){
				    udb_setPrisao(PlayerName(playerid), 1);
					SetSpawnInfo(plid, 1, udb_getSkin(PlayerName(plid)), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
					AddPlayerClass(0,-392.6328,2204.5061,42.4244,280.8241,0,0,0,0,0,0); //
					LogarPlayer(plid);
					format(string, sizeof(string), "Voc� foi sequestrado por: %s, e esta em cativeiro", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEQUESTRADOR, string);
				    SendClientMessage(playerid, COLOR_GREEN, "Sequestro Concluido");
				return 1;
				}
			return 1;
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != SEQUESTRADOR){
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � Assassino");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == NARCOTICOS || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
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
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(distancia > 10){
			        SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
				return 1;
				}
				if(distancia <= 10){
					Presos[plid] = 1;
				    udb_setPrisao(PlayerName(plid), 1);
					LogarPlayer(plid);
					format(string, sizeof(string), "Voc� foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEGURAN�A, string);
				    SendClientMessage(playerid, COLOR_GREEN, "Pris�o concluida");
				return 1;
				}
			return 1;
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/fianca", true) == 0) {
        if(Presos[playerid] == 0){
            SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� preso!");
		return 1;
		} else {
		    if(udb_getBankMoney(PlayerName(playerid)) < 1500){
		        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem toda essa quantia no banco!");
		    return 1;
		    } else {
				udb_setPrisao(PlayerName(playerid), 0);
				Presos[playerid] = 0;
				SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				SpawnPlayer(playerid);
				SendClientMessage(playerid, COLOR_GREEN, "Voc� pagou a fian�a no valor de $1500 e foi solto.");
				udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 1500);
			return 1;
			}
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/soltar [id]");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(Presos[plid] == 0){
				    SendClientMessage(playerid,COLOR_RED,"O jogador n�o est� preso!");
				return 1;
				} else {
				    udb_setPrisao(PlayerName(playerid), 0);
				    Presos[plid] = 0;
				    SetSpawnInfo(plid,0,udb_getSkin(PlayerName(plid)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				    SpawnPlayer(plid);
				    SendClientMessage(plid,COLOR_GREEN,"Voc� foi solto, mas se cometer mais crimes, pagar� novamente.");
				    format(tmp,sizeof(tmp),"Voc� foi solto por %s",PlayerName(playerid));
				    SendClientMessage(plid,COLOR_GREEN,tmp);
				    SendClientMessage(playerid,COLOR_GREEN,"Libertado");
				return 1;
				}
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/setprof", true) == 0 && IsPlayerConnected(playerid)) {
	if(IsPlayerAdmin(playerid) == 1) {
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
            if(prof > 1 && prof < 99){
				udb_setProf(PlayerName(plid), prof);
				format(string, sizeof(string), "Voc� mudou a profiss�o de %s para %d", PlayerName(plid), prof);
				SendClientMessage(playerid, COLOR_GREEN, string);
				SendClientMessage(plid, COLOR_GREEN, "Voc� mudou de profiss�o, digite /profissao.");
				Profissao[plid] = prof;
				LogarPlayer(plid);
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Essa n�o � uma profisss�o v�lida!");
			return 1;
			}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
		return 1;
		}
	}
	else
	{
	SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso!");
	}
	return 1;
	}

	if (strcmp(cmd, "/vehangulo", true)==0){

			new Float:angulo;
			new msg[256];
			GetPlayerFacingAngle(playerid, angulo);
			format(msg, sizeof(msg), " �ngulo: %d", angulo);
			SendClientMessage(playerid,COLOR_GREEN,msg);
			return 1;

	}
	if(strcmp(cmd,"/noticia",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,10,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COLOR_RED,"/noticia [texto]");
			return 1;
			} else {
			    format(msg,sizeof(msg),"Not�cias de San Andreas, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    SendClientMessageToAll(COLOR_WHITE,tmp);
			return 1;
			}
		return 1;
		}else{
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
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
		return 1;
		}
	return 1;
	}

	if (strcmp(cmdtext, "/profissao", true)==0){
	    if(Profissao[playerid] == TRAFICANTE) {
	        SendClientMessage(playerid, COLOR_GREEN, "Traficante - Comandos:");
	        SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
	        SendClientMessage(playerid, COLOR_YELLOW, "/vcocaina [id] [quantidade] : Vende coca�na para um jogador.");
	        SendClientMessage(playerid, COLOR_YELLOW, "/vheroina [id] [quantidade] : Aplica uma inje��o de hero�na em um jogador.");
	        SendClientMessage(playerid, COLOR_YELLOW, "/vmaconha [id] [quantidade] : Vende maconha para um jogador.");
	    }
		else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COLOR_GREEN, "Jornalista - Comandos:");
		    SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/noticia [texto] : Publica uma not�cia.");
		}
		else if(Profissao[playerid] == PARAMEDICO) {
		    SendClientMessage(playerid, COLOR_GREEN, "Param�dico - Comandos:");
		    SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/curativo [id] : Enche a barra de sa�de (health) de algu�m.");
		}
		else if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_GREEN, "Taxista - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/ttaxi [id] : Come�a a rodar o tax�metro (o passageiro tem que estar no seu carro).");
		}
		else if(Profissao[playerid] == TAXISTA_AEREO){
		    SendClientMessage(playerid, COLOR_GREEN, "Taxista A�reo - Comandos:");
		    SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
		    SendClientMessage(playerid, COLOR_YELLOW, "/ataxi [id] : Come�a a rodar o tax�metro a�reo (o passageiro tem que estar no seu ve�culo);");
		}
		else if(Profissao[playerid] == MOTOTAXISTA){
		    SendClientMessage(playerid, COLOR_GREEN, "Mototaxista - Comandos:");
		    SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
		    SendClientMessage(playerid, COLOR_YELLOW, "/mtaxi [id] : Come�a a rodar o moto-tax�metro (o passageiro tem que estar em sua moto.");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_GREEN, "Vendedor de Skins/Carros - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/setcar [id-do-carro] [rota��o] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posi��o de spawn).");
			SendClientMessage(playerid, COLOR_YELLOW, "/skin [id-da-pessoa] [id-do-skin] : Vende um skin para alguma pessoa.");
			SendClientMessage(playerid, COLOR_YELLOW, "FAVOR USAR A LISTA COM OS PRE�OS OFICIAIS DO MOD.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Corretor de Im�veis - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/casa [nick] : Seta a casa para alguem, (esteja na posi�ao exterior � casa).");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_GREEN, "Barman - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COLOR_GREEN, "Juiz - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/soltar [id] : Solta uma pessoa da cadeia.");
		}
		else if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_GREEN, "Pol�cia Rodovi�ria/Civil - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : V� o teor de alcool no sangue de algu�m");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [amount] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COLOR_GREEN, "SWAT/Cop Elite - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : V� o teor de alcool no sangue de algu�m");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [amount] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COLOR_GREEN, "Instrutor de dire��o - Comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_YELLOW, "/habaerea : Habilita uma pessoa a dirigir ve�culos aereos (avi�es e helicopteros).");
			SendClientMessage(playerid, COLOR_YELLOW, "/habterrestre : Habilita uma pessoa a dirigir ve�culos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_YELLOW, "/habnautica : Habilita uma pessoa a dirigir ve�culos nauticos (barcos).");
		}
		else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COLOR_YELLOW, "Pescador - Comandos");
		    SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/pescar : Joga a rede para pesca, para isso � preciso estar na �rea de pesca.");
		    SendClientMessage(playerid, COLOR_YELLOW, "/vendepesca : Vende todas as suas pescas acumuladas, � preciso estar na cooperativa de pesca.");
		    SendClientMessage(playerid, COLOR_YELLOW, "Se voc� vender sua pesca como pescador, ganhar� $30 de lucro em cada pesca.");
		}
		else if(Profissao[playerid] == NARCOTICOS) {
		    SendClientMessage(playerid, COLOR_YELLOW, "Narc�ticos - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid,COLOR_YELLOW,"/examead [id] : Realiza o exame anti-dopping para verificar a presen�a de entorpecentes no sangue");
		    SendClientMessage(playerid,COLOR_YELLOW,"de uma pessoa.");
		    SendClientMessage(playerid,COLOR_YELLOW,"/prender [id] : Prende uma pessoa.");
		}
		else if(Profissao[playerid] == CAMINHONEIRO) {
			SendClientMessage(playerid, COLOR_GREEN, "Caminhoneiro - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/carregar : Carregar o ve�culo que est� carregando (� preciso estar na �rea de carga).");
			SendClientMessage(playerid, COLOR_YELLOW, "/descarregar : Descarrega seu ve�culo (� preciso estar na �rea de descarga).");
		}
		else if(Profissao[playerid] == SEQUESTRADOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Sequestrador - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/sequestrar [id] : Sequestra um(a) jogador e pede resgate pelo sequestro.");
		}
		else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
			SendClientMessage(playerid, COLOR_GREEN, "Entregador de Pizza - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/entregarpizza [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
  		}
  		else if(Profissao[playerid] == VENDEDOR_ARMAS) {
			SendClientMessage(playerid, COLOR_GREEN, "Vendedor de Armas - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/venderarma [id] [idarma] : Vende um arma para um jogador de id 0 a 46.");
		}
		else if(Profissao[playerid] == AGRICULTOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Agricultor - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/plantarmilho : Planta o milho na �REA DA FAZENDA para depois vender na FAZENDA.");
		    SendClientMessage(playerid, COLOR_YELLOW, "/vendermilho : Vende o milho depois de colhido na FAZENDA.");
		}
        else if(Profissao[playerid] == IBAMA) {
			SendClientMessage(playerid, COLOR_GREEN, "Ibama - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/piracemaon : Per�odo de PESCA para os pescadores, LIGADO.");
		    SendClientMessage(playerid, COLOR_YELLOW, "/piracemaoff : Per�odo de PESCA para os pescadores, DESLIGADO.");
		    SendClientMessage(playerid, COLOR_YELLOW, "/prenderpesca [id] : Prende a pesca se foi em per�odo impr�prio(PIRACEMA).");
		    SendClientMessage(playerid, COLOR_YELLOW, "/vercaca [id] : Ver a Ca�a do Ca�ador.");
		    SendClientMessage(playerid, COLOR_YELLOW, "/verpesca [id] : Ver a Pesca do Pescador.");
		 }
		 else if(Profissao[playerid] == VENDEDOR_ARMAS) {
			SendClientMessage(playerid, COLOR_GREEN, "Vendedor de Armas - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/varmas [id] [idarma] : Vende um arma para um jogador de id 0 a 46.");
		}
		else if(Profissao[playerid] == POLICIA_FLORESTAL) {
			SendClientMessage(playerid, COLOR_GREEN, "Pol�cia Florestal - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
		    SendClientMessage(playerid, COLOR_YELLOW, "/temporadacacaon : Temporada de Ca�a, ATIVADA.");
            SendClientMessage(playerid, COLOR_YELLOW, "/temporadacacaoff : Temporada de Ca�a, DESATIVADA.");
            SendClientMessage(playerid, COLOR_YELLOW, "/prendercaca [id] : Prende a Ca�a se foi em per�odo impr�prio.");
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Profiss�o sem comandos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_GREEN, "Sua profiss�o n�o tem nenhum comando especial!");
  }
	return 1;
	}

	if (strcmp(cmdtext, "/presos", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_YELLOW, "Lista de presos");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Presos[i] == 1){
				format(string, sizeof(string), "%d: %s", i, PlayerName(i));
				SendClientMessage(i, COLOR_YELLOW, string);
			return 1;
			}
		}
	return 1;
	}

	if (strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/procurar [id].");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 1;
				SendClientMessage(playerid, COLOR_GREEN, "Colocado na lista de procurados com sucesso.");
				format(string, sizeof(string), "Voc� est� sendo perseguido pela policia, Voc� foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado/logado.");
			return 1;
			}
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o.");
		return 1;
		}
	return 1;
	}

	if (strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/desprocurar [id].");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(Procurados[plid] == 0){
					SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� sendo procurado!");
				return 1;
				} else {
					Procurados[plid] = 0;
					SendClientMessage(playerid, COLOR_GREEN, "Excluido da lista com suscesso.");
					SendClientMessage(plid, COLOR_GREEN, "Voc� foi retirado da lista de procurados");
				return 1;
				}
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado/logado.");
			return 1;
			}
		return 1;
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}

	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_YELLOW, "Lista de procurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Procurados[i] == 1){
				format(string, sizeof(string), "%d: %s", i, PlayerName(i));
				SendClientMessage(i, COLOR_YELLOW, string);
			return 1;
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
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_GRAY, string);
					SendClientMessage(playerid, COLOR_GRAY, string);
				return 1;
				}
			}
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
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
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� querendo multar de forma justa.");
			return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "Voc� recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(playerid, COLOR_GREEN, "Multa dada.");
				udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quant);
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/mtaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == MOTOTAXISTA || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/mtaxi [id]");
			return 1;
			}
			plid = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != VEH_PCJ600){
			    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� dirigindo uma moto autorizada para mototaxistas.");
				SendClientMessage(playerid, COLOR_RED, "Use motos do modelo PCJ-600 para esse tipo de profiss�o.");
			return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COLOR_GREEN, "O moto-tax�metro come�ou a rodar");
			        SendClientMessage(plid, COLOR_GREEN, "O moto-tax�metro j� est� rodando. A corrida est� sendo cobrada a partir de agora.");
			        MTaximetro[plid][0] = 1;
					MTaximetro[plid][1] = playerid;
				return 1;
				}
				else {
				    SendClientMessage(playerid, COLOR_RED, "O passageiro n�o est� na sua moto, ou voc� n�o � o condutor.");
				return 1;
				}
			return 1;
			}
		return 1;
	    } else {
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o � mototaxista.");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/ataxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA_AEREO || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/mtaxi [id]");
			return 1;
			}
			plid = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != VEH_MAVERICK){
			    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� dirigindo uma aeronave autorizada para sua profiss�o.");
				SendClientMessage(playerid, COLOR_RED, "Use apenas helic�pteros Maverick.");
			return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COLOR_GREEN, "O aero-tax�metro come�ou a rodar");
			        SendClientMessage(plid, COLOR_GREEN, "O aero-tax�metro j� est� rodando. A corrida est� sendo cobrada a partir de agora.");
			        ATaximetro[plid][0] = 1;
					ATaximetro[plid][1] = playerid;
				return 1;
				}
				else {
				    SendClientMessage(playerid, COLOR_RED, "O passageiro n�o est� na sua moto, ou voc� n�o � o condutor.");
				return 1;
				}
			return 1;
			}
		return 1;
	    } else {
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o � taxista a�reo.");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/ttaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/ttaxi [id]");
			return 1;
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COLOR_GREEN, "O tax�metro come�ou a rodar.");
                SendClientMessage(plid, COLOR_GREEN, "O tax�metro come�ou a rodar. A bandeirada de $20 foi cobrada.");
                GivePlayerMoney(playerid,20);
                GivePlayerMoney(plid,-20);
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O passageiro n�o est� dentro do seu carro ou voc� n�o � o motorista.");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem n�vel suficiente.");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/pescar", true) == 0) {
	    if(PescaInProgress[playerid] == 1) {
	    SendClientMessage(playerid, COLOR_RED, "Calminha a�... Voc� j� est� pescando!");
	    }
		if(PescaInProgress[playerid] == 0){
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
			if(X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425){
			SendClientMessage(playerid,COLOR_GREEN,"Voc� lan�ou a rede de pesca. Espere ela voltar para concluir a pesca.");
			SendClientMessage(playerid,COLOR_GREEN,"Enquanto ela n�o vem, fique apreciando a paisagem.");
			PescaInProgress[playerid] = 1;
			SetTimer("Pesca",36000,false);
			return 1;
			}
			else {
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� na �rea de pesca, consulte nosso site para uma refer�ncia.");
			return 1;
			}
		}
return 1;
	}
	if(strcmp(cmd, "/cacar", true) == 0) {
	    if(Profissao[playerid] == CACADOR || IsPlayerAdmin(playerid)){
	        if(AreaCaca[playerid] == 0){
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na �rea de ca�a, consulte nossa site para uma refer�ncia.");
			return 1;
			} else {
			    if(CacaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COLOR_RED, "Calminha a�... A sua presa n�o morreu ainda!");
				return 1;
				} else {
					SendClientMessage(playerid, COLOR_GREEN, "Voc� � um ex�mio ca�ador! Espere a presa exalar seus �ltimos ares de vida,");
					SendClientMessage(playerid, COLOR_GREEN, "para poder vend�-la.");
			    	CacaInProgress[playerid] = 1;
			    	SetTimer("Caca",36000,false);
				return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/passagem", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == MOTORISTA_DE_ONIBUS || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/passagem [id]");
			return 1;
			}
			plid = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != VEH_ONIBUS){
			    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� dirigindo um �nibus autorizada para motorista de �nibus.");
				SendClientMessage(playerid, COLOR_RED, "Use o �nibus para esse tipo de profiss�o.");
			return 1;
			}
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			plid = strval(tmp);
			GivePlayerMoney(plid,-10);
			GivePlayerMoney(playerid,10);
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O passageiro n�o est� dentro do seu carro ou voc� n�o � o motorista.");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != MOTORISTA_DE_ONIBUS){
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem n�vel suficiente.");
		return 1;
		}
	return 1;
	}


	if(strcmp(cmd, "/setcar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
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
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rota��o] [nick] [cor1] [cor2]");
			return 1;
			}
			ang = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rota��o] [nick] [cor1] [cor2]");
			return 1;
			}
			set(nome, tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rota��o] [nick] [cor1] [cor2]");
			return 1;
			}
			cor1 = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rota��o] [nick] [cor1] [cor2]");
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
					temp = fopen("carrosmpa.rpg", io_append);
                    fwrite(temp, string);
                    fclose(temp);
                    SendClientMessage(playerid, COLOR_GREEN, "Carro salvo");
				return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� em nenhum ve�culo e assim e assim n�o pode setar um carro.");
				return 1;
				}
			return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != VENDEDOR_DE_CARROS){
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso");
		return 1;
		}
	return 1;
	}
    if(strcmp(cmd, "/plantarmilho", true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
	        if(AreaFazenda[playerid] == 0){
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na FAZENDA.");
			return 1;
			} else {
			    if(FazendaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COLOR_RED, "A colheita ainda n�o est� pronta... AGUARDE.");
				return 1;
				} else {
					SendClientMessage(playerid, COLOR_AGRICULTOR, "Grande ca��dor! Espere ensacar para poder ir vender.");
                    SendClientMessage(playerid, COLOR_GREEN, "para poder vend�-la.");
			    	FazendaInProgress[playerid] = 1;
			    	SetTimer("Fazenda",36000,false);
				return 1;
				}
            }
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "S�o %d:00 horas no estado de San Andreas", worldTime);
		SendClientMessage(playerid, COLOR_GREEN, string);
	return 1;
	}

    if(strcmp(cmd, "/drink", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/drink [id] [teor de alcool]");
			return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/drink [id] [teor de alcool]");
			return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COLOR_RED, "Teor alco�lico invalido. Os teores devem ser entre 2 e 7.");
			return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Voc� bebeu um drink com teor alco�lico n�vel %d", teor);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Miss�o cumprida: Mais um pingu�o feliz!");
					return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
					return 1;
					}
				return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto para entregar a bebida.");
				return 1;
				}
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/examead", true) == 0) {
	    if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid,COLOR_RED,"/examead [id]");
			return 1;
			}
			plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
			        SendClientMessage(playerid,COLOR_RED,"Voc� est� muito longe, chegue mais perto!");
				return 1;
				} else {
				    SendClientMessage(playerid,COLOR_YELLOW,"Resultados do exame anti-dopping:");
				    format(msg, sizeof(msg), "Heroina : %d doses",Heroina[plid]);
				    SendClientMessage(playerid,COLOR_WHITE,msg);
				    format(msg, sizeof(msg), "Maconha : %d doses",Maconha[plid]);
				    SendClientMessage(playerid,COLOR_WHITE,msg);
				    format(msg, sizeof(msg), "Coca�na : %d doses",Cocaina[plid]);
				    SendClientMessage(playerid,COLOR_WHITE,msg);
				    SendClientMessage(playerid,COLOR_GREEN,"Exame anti-dopping conclu�do!");
				return 1;
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
			return 1;
			}
		return 1;
		} else {
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
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
			        SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
				return 1;
				}
				if(distancia <= 20){
					format(string, sizeof(string), "O baf�metro mostra: %d litros de �lcool no sangue", Bebida[plid]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				    SendClientMessage(playerid, COLOR_GREEN, "Avalie se ele deve ser preso ou n�o.");
				return 1;
				}
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso");
		return 1;
		}
	return 1;
	}


SendClientMessage(playerid,COLOR_RED,"Comando desconhecido pelo gamemode");
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
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode andar sem gasolina, v� at� o posto mais pr�ximo e compre.");
        	return 0;
			}
			else
			{
				Petrol[playerid]--;
  				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
        	return 0;
			}
		return 1;
		}
	return 1;
	}
		if(newstate == PLAYER_STATE_ONFOOT){
		if(Carregamento[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"Voc� perdeu sua carga por ter sa�do do ve�culo.");
		    Carregamento[playerid] = 0;
		return 1;
		}
	    else if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COLOR_GREEN, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COLOR_RED, "Voc� recebeu o valor da corrida at� aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
		return 1;
		}
		else if(ATaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COLOR_GREEN, "Obrigado por viajar. Volte sempre.");
		    SendClientMessage(ATaximetro[playerid][1], COLOR_GREEN, "Voc� recebeu o valor da corrida at� aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(ATaximetro[playerid][1], PrecoCorrida[playerid]);
		    PrecoCorrida[playerid] = 0;
		    ATaximetro[playerid][1] = 0;
		    ATaximetro[playerid][0] = 0;
		return 1;
		}
		else if(MTaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COLOR_GREEN, "Espero que tenha gostado do passeio. Volte sempre.");
		    SendClientMessage(MTaximetro[playerid][1], COLOR_GREEN, "Voc� recebeu o valor da corrida at� aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(MTaximetro[playerid][1], PrecoCorrida[playerid]);
		    PrecoCorrida[playerid] = 0;
		    MTaximetro[playerid][1] = 0;
		    MTaximetro[playerid][0] = 0;
		return 1;
		}
	}
return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	printf("Jogador de ID %d (%s) entrou em um checkpoint",playerid, PlayerName(playerid));
	SendClientMessage(playerid, COLOR_GREEN, "Banco:");
	SendClientMessage(playerid, COLOR_GREEN, "Dep�sitos: /depositar");
	SendClientMessage(playerid, COLOR_GREEN, "Saques: /sacar");
	SendClientMessage(playerid, COLOR_GREEN, "Saldo: /saldo");
	SendClientMessage(playerid, COLOR_GREEN, "Saldo pelo celular: /saldocell (custo $5)");
	SendClientMessage(playerid, COLOR_GREEN, "Para visualizar novamente os comandos digite /banco");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("Jogador de ID %d (%s) deixou um checkpoint", playerid, PlayerName(playerid));
	return 1;
}

public PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
 	new tmp[MAX_STRING];
  	set(tmp,udb_encode(name));
	return tmp;
}

public Bancos(playerid)
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			if(X >= 1700.1732 && X <= 1741.9966 && Y >= -1721.5967 && Y <= -1605.9054){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 1721.9133, -1719.0149, 13.5345, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 972.7372 && X <= 1072.9083 && Y >= -1133.2140 && Y <= -1110.8668){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 1022.6587, -1122.4553, 23.8714, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 2172.9221 && X <= 2190.9502 && Y >= 1105.2529 && Y <= 1126.5010){
			    if(AreaBanco[i] == 0) {
			        DisablePlayerCheckpoint(i);
			        SetPlayerCheckpoint(i,2183.9922,1116.0204,12.6484,2.0);
			        AreaBanco[i] = 1;
				}
			}
			else if(X >= 385.5901 && X <= 409.1007 && Y >= -1823.7596 && Y <= -1797.2906){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 398.2190, -1805.7782, 7.8380, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1785.4990 && X <= -1714.4250 && Y >= 929.3326 && Y <= 974.9125){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -1746.1671, 962.5413, 24.8906, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1978.6537 && X <= -1961.9292 && Y >= 113.2442 && Y <= 162.6734){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -1974.0306, 117.4207, 27.6875, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2482.7346 && X <= -2386.7249 && Y >= 461.5373 && Y <= 552.1155){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -2446.5322, 522.0310, 30.2329, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 1951.4363 && X <= 1961.4280 && Y >= 1339.6191 && Y <= 1346.2188){
			    if(AreaBanco[i] == 0) {
			        DisablePlayerCheckpoint(i);
			        SetPlayerCheckpoint(i,1958.0383,1343.7804,15.3746,2.0);
			        AreaBanco[i] = 1;
				}
			}
			else if(X >= 2426.7166 && X <= 2445.3423 && Y >= 1671.3499 && Y <= 1687.3812){
			    if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i,2437.0090,1677.0514,10.8203,2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425){
		    	GameTextForPlayer(i,"�rea de Pesca",3000,4);
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
				GameTextForPlayer(i,"Posto",3000,4);
				AreaPosto[i] = 1;
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    GameTextForPlayer(i,"Posto",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    GameTextForPlayer(i,"Posto",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
		    	GameTextForPlayer(i,"Posto",3000,4);
			    AreaPosto[i] = 1;
			}
			else if(X >= -1610.9099 && X <= -1496.5111 && Y >= 1279.2794 && Y <= 1295.2489){
			    GameTextForPlayer(i,"Cooperativa de Pesca",1000,4);
			    AreaCoopPesca[i] = 1;
			}
			else if(X >= -2062.2964 && X <= -2020.8334 && Y >= -1616.9932 && Y <= -1510.9994){
			    GameTextForPlayer(i,"�rea de Ca�a",1000,4);
			    AreaCaca[i] = 1;
			}
			else if(X >= -2824.2483 && X <= -2801.2568 && Y >= -1534.1261 && Y <= -1510.1261){
			    GameTextForPlayer(i,"Cooperativa de Ca�a",1000,4);
			    AreaCoopCaca[i] = 1;
			} else if(X >= -622.7689 && X <= -466.2803 && Y >= -562.3403 && Y <= -468.5563){
			    GameTextForPlayer(i,"�rea de Carga",1000,4);
			    AreaCarga[i] = 1;
			} else if(X >= -70.6976 && X <= -40.9113 && Y >= -1159.8073 && Y <= -1101.6296){
				GameTextForPlayer(i,"�rea de Descarga",1000,4);
				AreaDescarga[i] = 1;
			}
				else if(X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717){
			    GameTextForPlayer(i,"Planta��o da Fazenda",1000,4);
			    AreaFazenda[i] = 1;
			}
		    	else if(X >= -1118.8129 && X <= -1027.5986 && Y >= -1319.42541 && Y <= -1120.223){
			    GameTextForPlayer(i,"Fazenda, VENDA do Milho",1000,4);
			    AreaCoopFazenda[i] = 1;
			}
			else {
				if(AreaBanco[i] == 1) {
					DisablePlayerCheckpoint(i);
					AreaBanco[i] = 0;
				}
				if(AreaDescarga[i] == 1){
				    AreaDescarga[i] = 0;
				}
				if(AreaCarga[i] == 1){
				    AreaCarga[i] = 0;
				}
				if(AreaPosto[i] == 1) {
				    AreaPosto[i] = 0;
				}
				if(AreaCoopPesca[i] == 1) {
				    AreaCoopPesca[i] = 0;
				}
				if(AreaCaca[i] == 1) {
				    AreaCaca[i] = 0;
				}
				if(AreaCoopCaca[i] == 1) {
				    AreaCoopCaca[i] = 0;
				}
				if(AreaFazenda[i] == 1) {
				    AreaFazenda[i] = 0;
				}
				if(AreaCoopFazenda[i] == 1) {
				    AreaCoopFazenda[i] = 0;
				}
			}
		}
	}
}

public Fazenda() {
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && FazendaInProgress[i] == 1){
			QtMilho[i]++;
			FazendaInProgress[i] = 0;
			SendClientMessage(i,COLOR_GREEN,"Sua ca�a est� pronta para ser vendida!");
			SendClientMessage(i,COLOR_GREEN,"Se quiser continuar plantando, fique a vontade.");
			SendClientMessage(i,COLOR_RED,"Se n�o, v� a cooperativa de ca�a e venda sua ca�a.");
		}
	}
}

public Pesca() {
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && PescaInProgress[i] == 1){
			QtPescas[i]++;
			PescaInProgress[i] = 0;
			SendClientMessage(i,COLOR_GREEN,"Sua rede voltou. Se quiser continuar pescando, fique a vontade.");
			SendClientMessage(i,COLOR_GREEN,"Se n�o, v� a cooperativa de pescas e venda seu pescado.");
		}
	}
}
public Caca() {
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && CacaInProgress[i] == 1){
			QtCacas[i]++;
			CacaInProgress[i] = 0;
			SendClientMessage(i,COLOR_GREEN,"Sua ca�a est� pronta para ser vendida!");
			SendClientMessage(i,COLOR_GREEN,"Se quiser continuar ca�ando, fique a vontade.");
			SendClientMessage(i,COLOR_GREEN,"Se n�o, v� a cooperativa de ca�a e venda sua ca�a.");
		}
	}
}
public CheckFuel()
{
	for(new i=0; i<MAX_PLAYERS; i++){
 		new id;
	    new modelo;
	    id = GetPlayerVehicleID(i);
		cGetVehicleModelID(id,modelo);
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1 && modelo != 594){
			if(GetPlayerState(i) == 2){
				Petrol[i]--;
				udb_setGasoline(PlayerName(i), Petrol[i]);
				if(Petrol[i] <= 0){
					RemovePlayerFromVehicle(i);
					SendClientMessage(i, COLOR_RED, "Voc� n�o pode andar sem combust�vel, v� at� o posto mais pr�ximo e abaste�a.");
					Petrol[i] = 0;
				return 1;
				}
				if(Petrol[i] >= 5){
				return 1;
				}
				if(Petrol[i] < 5 || Petrol[i] >= 5){
				SendClientMessage(i,COLOR_RED,"Aten��o: seu combust�vel est� quase acabando. V� ao posto mais pr�ximo e abaste�a");
				return 1;
				}
			}
		}
	}
return 1;
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
		cela = minrand(1,4);
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
		SendClientMessage(playerid,COLOR_RED,"Voc� deve ter cometido algum crime, por isso foi preso.");
		SendClientMessage(playerid,COLOR_RED,"Para sair mais cedo da pris�o, voc� pode pagar a fian�a de $1500,");
		SendClientMessage(playerid,COLOR_RED,"escrevendo /fianca.");
	}
	else{
		SpawnPlayer(playerid);
	}

}

public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 180){
	            TempoPreso[i] = 0;
				udb_setPrisao(PlayerName(i), 0);
				Presos[i] = 0;
				SetSpawnInfo(i,0,udb_getSkin(PlayerName(i)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
	    		SpawnPlayer(i);
	            SendClientMessage(i, COLOR_YELLOW, "Voc� foi solto, mas se fizer algum crime outra vez, j� sabe...");
			}
			else {
			    TempoPreso[i]++;
			}
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
				format(string, sizeof(string), "O tax�metro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COLOR_RED, "Voc� n�o tem mais dinheiro para o taxi, vai ficar aqui");
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
public ATaxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(ATaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 15){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 15;
				format(string, sizeof(string), "O aero-tax�metro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 15){
				SendClientMessage(i, COLOR_RED, "Voc� n�o tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(Taximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				ATaximetro[i][1] = 0;
				ATaximetro[i][0] = 0;
			}
		}
	}
}
public MTaxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(MTaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 5){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 5;
				format(string, sizeof(string), "O moto-tax�metro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 5){
				SendClientMessage(i, COLOR_RED, "Voc� n�o tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(Taximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				MTaximetro[i][1] = 0;
				MTaximetro[i][0] = 0;
			}
		}
	}
}
public Speed(){
	for(new i=0;i<MAX_PLAYERS;i++){
		if(IsPlayerConnected(i)){
			new Float:x,Float:y,Float:z;
			GetPlayerPos(i,x,y,z);
			new
			Float:xOff = ppos[i][0] - x,
			Float:yOff = ppos[i][1] - y,
			Float:zOff = ppos[i][2] - z,
			Float:dis = floatsqroot((xOff * xOff) + (yOff * yOff) + (zOff * zOff));
			new tmpstr[256];
			format(tmpstr,256,"~h~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~w~Veloc�metro: ~h~~b~%d ~y~km/h~n~~w~Combust�vel: ~h~~b~%d ~w~litros",floatround(((dis/1000.0)*60.0)*60.0),Petrol[i]);
            if(IsPlayerInAnyVehicle(i)){
				GameTextForPlayer(i,tmpstr,1000,3);
				Velocidade[i] = floatround(((dis/1000.0)*60.0)*60.0);
				if(Velocidade[i] > 170 && GetPlayerState(i) == PLAYER_STATE_DRIVER && VeloMulta == 1){
				    SendClientMessage(i,COLOR_RED,"Voc� foi pego dirigindo acima da velocidade, e levou multa.");
				    GivePlayerMoney(i,-100);
				}
			}
            ppos[i][0] = x;
            ppos[i][1] = y;
            ppos[i][2] = z;
		}
	}
}

public GetClosestHospital(playerid)
{
	if(!IsPlayerConnected(playerid)){
	    return -1;
	}
	new Float:prevdist = 100000.000;
	new prevhosp;
	for(new hospid = 0; hospid < 4; hospid++){
	    new Float:dist;
	    if(hospid == 0){
            dist = GetPlayerDistanceToPoint(playerid,-2651.6501,634.1177);
		}
		else if(hospid == 1){
		    dist = GetPlayerDistanceToPoint(playerid,1173.5842,-1324.5615);
		}
		else if(hospid == 2){
		    dist = GetPlayerDistanceToPoint(playerid,2031.9415,-1404.3578);
		}
		else if(hospid == 3){
		    dist = GetPlayerDistanceToPoint(playerid,1582.5615,1768.7921);
		}
		if((dist < prevdist)){
		    prevdist = dist;
		    prevhosp = hospid;
		}
	}
return prevhosp;
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
					SendClientMessage(i, COLOR_YELLOW, "Seu seguro desemprego foi depositado: $350");
					SendClientMessage(i, COLOR_YELLOW, "V� se arranja emprego, vagabundo!");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 350);
				}
				else if(Profissao[i] == TAXISTA) {
					SendClientMessage(i, COLOR_YELLOW, "O sindicato dos taxistas lhe depositou seu sal�rio: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == VENDEDOR_DE_CARROS || Profissao[i] == CORRETOR) {
					SendClientMessage(i, COLOR_YELLOW, "Seu sal�rio governamental foi depositado: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == BARMAN) {
					SendClientMessage(i, COLOR_YELLOW, "O chefe do boteco em que voc� trabalha depositou seu sal�rio: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
					SendClientMessage(i, COLOR_YELLOW, "Seu sal�rio governamental foi depositado: $2000, mas o governo");
					SendClientMessage(i, COLOR_YELLOW, "lhe rouba $200 para manter vivo o projeto do mensal�o.");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1800);
				}
				else if(Profissao[i] == SEGURAN�A || Profissao[i] == MOTORISTA_PARTICULAR) {
					SendClientMessage(i, COLOR_YELLOW, "Seu sal�rio governamental foi depositado: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO) {
					SendClientMessage(i, COLOR_YELLOW, "Seu sal�rio governamental foi depositado: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_ELITE) {
					SendClientMessage(i, COLOR_YELLOW, "Seu sal�rio governamental foi depositado: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
				else if(Profissao[i] == CACADOR) {
					SendClientMessage(i, COLOR_YELLOW, "A cooperativa de ca�a depositou seu sal�rio: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == PESCADOR) {
					SendClientMessage(i, COLOR_YELLOW, "A cooperativa de pesca depositou seu sal�rio: $750");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 750);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					SendClientMessage(i, COLOR_YELLOW, "Seu sal�rio governamental foi depositado: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 400);
				}
				else if(Profissao[i] == TRAFICANTE) {
				    SendClientMessage(i, COLOR_YELLOW, "O chefe de sua boca de fumo depositou em sua conta corrente");
				    SendClientMessage(i, COLOR_YELLOW, "o que o neg�cio est� lhe rendendo: $1200");
				    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					SendClientMessage(i, COLOR_YELLOW, "Seu sal�rio governamental foi depositado: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == CAMINHONEIRO) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio governamental foi depositado: $400");
				    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 400);
				}
				else if(Profissao[i] == NARCOTICOS) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio governamental foi depositado: $4000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 4000);
				}
				else if(Profissao[i] == IBAMA || Profissao[i] == POLICIA_FLORESTAL) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio governamental foi depositado: $2500");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 2500);
				}
				else if(Profissao[i] == JORNALISTA) {
				    SendClientMessage(i,COLOR_YELLOW,"O Departamento de Imprensa e Propaganda depositou");
				    SendClientMessage(i,COLOR_YELLOW,"seu sal�rio: $1150");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1150);
				}
				else if(Profissao[i] == ADVOGADO) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio foi depositado: $1000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == POLICIA_FLORESTAL) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio governamental foi depositado: $2500");
				    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
				}
				else if(Profissao[i] == PARAMEDICO) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio foi depositado: $900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == AGRICULTOR) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio foi depositado: $500");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 500);
				}
				else if(Profissao[i] == VENDEDOR_ARMAS) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio foi depositado: $130");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1300);
				}
				else if(Profissao[i] == ENTREGADOR_PIZZA) {
				    SendClientMessage(i,COLOR_YELLOW,"Seu sal�rio foi depositado: $800");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 800);
				}
				

			}
		}
	}
}
