#include <a_objects>
#include <a_samp>
#include <a_players>
#include <dutils>
#include <dudb>
#include <dini>
#include <a_vehicles>
#include <c_vehicleinfo>
#include <string>

                                                                                                /*
|-------------------------------------------------------------------------------------------------|
|.:DADOS:.                                                                                        |
|MODE                                                                                             |
|Name: [MPA]Furious RPG                                                                           |
|Clan: [MPA]                                                                                      |
|CODERS                                                                                           |
|Projeto Inicial: SolidNuts, Hitman e Luigui                                                      |
|Scripter Oficial:[MPA]Rafael                                                                     |
|Scripters Primários:[MPA]Rafael,[MPA]Rodrigo e [MPA]matraka                                      |
|Scripters:[MPA]Rafael,[MPA]Guilherme,[MPA]matraka,[MPA]Rodrigo,[MPA]Texugo e [MPA]Mike_Jones     |
|-------------------------------------------------------------------------------------------------|
                                                                                                 */
//Cores
#define COR_DESEMPREGADO        0x808080AA
#define COR_INSTRUTOR           0xF78654AA
#define COR_TAXISTA             0xFFEA96AA
#define COR_COP_CIVIL           0x0000FFAA
#define COR_COP_ELITE           0x00C7FFAA
#define COR_ASSASSINO           0x96FFE0AA
#define COR_VENDEDOR            0x27F940AA
#define COR_COP_RODOVIARIO      0x00CED3AA
#define COR_SEGURANCA           0x02C7EAAA
#define COR_BARMAN              0x6D9666AA
#define COR_CORRETOR            0xDEB887AA
#define COR_PESCADOR            0x0C8B87AA
#define COR_MOTORISTA           0x72B55EAA
#define COR_MOTORISTA_ONIBUS    0x66E3DfAA
#define COR_JUIZ                0xFBE682AA
#define COR_LADRAO              0x6A95AEAA
#define COR_ASSALTANTE          0xB70347AA
#define COR_GENIO_DO_CRIME      0x191A1AAA
#define COR_JUIZ_DE_CORRIDA     0x81E366AA
#define COR_BOMBEIRO            0x438B8AAA
#define COR_MESTRE_DO_ROUBO     0xFFFFFFAA
#define COR_INSTRUTOR_LADRAO    0x8B0C0CAA
#define COR_INSTRUTOR_COP       0x9A6697AA
#define COR_DETETIVE            0xFB6E57AA
#define COR_EXERCITO            0x575F04AAA
#define COR_JORNALISTA          0xC2C4C3AA
#define COR_ADVOGADO            0x5E3030AA
#define COR_POLICIAL_NARCOTICOS 0x057ABDAA
#define COR_MECANICO            0x00BC6FAA
#define COR_MEDICO              0x7FFF00AA
#define COR_ESTADUAL            0x00FFE4AA
#define COR_FEDERAL             0xDEB887AA
#define COR_PREFEITO            0x54956AAA
#define COR_GOVERNADOR          0x48D2FFAA
#define COR_PRESIDENTE          0x24FA7FAA
#define COR_SEGURANCA_DE_CARROS 0xFBE682AA
#define COR_LADRAO_DE_CARROS    0x7EFBC1AA
#define COR_CONFISCADOR_CARROS  0x00FFFFAA
#define COR_TRAFICANTE          0xFFD200AA
#define COR_COP_FBI             0x04A2FCAA
#define COR_POLICIA_FLORESTAL   0x45804FAA
#define COR_IBAMA               0xD7B323AA
#define COR_CACADOR             0xCD853FAA
#define COR_MOTORISTA_FUGA      0xB4BFFFAA
#define COR_ONIBUS_VIAGEM       0xABDADAAA
#define COR_PUTA                0xF4D6FEAA
#define COR_CAFETAO             0x1AB5E7AA
#define COR_VENDEDOR_DE_ARMAS   0x92C2D2AA
#define COR_TAXI_AEREO          0x767437AA
#define COR_MOTOTAXISTA         0x3A6300AA
#define COR_ALUGUEL_DE_CARROS   0x183B3CAA
#define COR_INVISIVEL           0xFFFFFF00
#define COR_VERDEC              0x00FDA1AA
#define COR_VERDED              0x55EfA8AA
#define COR_NADA                0xAAAAAAAA
#define COR_GARI                0x1F4B2BAA
#define COR_AMARELOB            0xF0E68CAA
#define COR_AZULB               0x057ABDAA
#define COR_PRETO               0x000000FAA
#define COR_VERDEB              0x45804FAA
#define COR_AZUL                0x0000FFAA
#define COR_VERDE               0x33AA33AA
#define COR_VERMELHO            0xAA3333AA 
#define COR_AMARELO             0xFFFF00AA
#define COR_BRANCO              0xFFFFFFAA
#define COR_CINZA               0xAFAFAFAA
//Profissoes
#define DESEMPREGADO          1///feito
#define TAXISTA               2///feito
#define VENDEDOR_DE_CARROS    3///feito
#define CORRETOR              4///feito
#define ASSASSINO             5///feito
#define BARMAN                6///feito
#define JUIZ                  7///feito
#define SEGURANÇA             8///feito(sem comandos)
#define MOTORISTA_PARTICULAR  9///feito
#define COP_CIVIL             10//feito
#define COP_RODOVIARIO        11//feito
#define POLICIAL_NARCOTICOS   12//feito
#define DETETIVE              13//feito
#define PESCADOR              14//feito
#define INSTRUTOR_DE_DIRECAO  15//feito
#define LADRAO                16//feito
#define MOTORISTA_DE_ONIBUS   17//feito
#define ASSALTANTE            18//feito
#define MESTRE_DO_ROUBO       19//feito
#define JUIZ_DE_CORRIDA       20//feito
#define BOMBEIRO              21//feito
#define GENIO_DO_CRIME        22//feito
#define INSTRUTOR_LADRAO      23//feito(sem comandos)
#define INSTRUTOR_COP         24//feito(sem comandos)
#define COP_ELITE             25//feito
#define JORNALISTA            26//feito
#define ADVOGADO              27//feito
#define MEDICO                28//feito
#define COP_FBI               29//feito
#define MECANICO              30//feito
#define ESTADUAL              31//feito
#define FEDERAL               32//feito
#define PREFEITO              33//feito
#define GOVERNADOR            34//feito
#define PRESIDENTE            35//feito
#define SEGURANCA_DE_CARROS   36//feito
#define LADRAO_DE_CARROS      37//feito
#define CONFISCADOR_CARROS    38//feito
#define TRAFICANTE            39//feito
#define EXERCITO              40//feito
#define POLICIA_FLORESTAL     41//feito
#define IBAMA                 42//feito
#define CACADOR               43//feito
#define MOTORISTA_FUGA        44//feito
#define ONIBUS_VIAGEM         45//feito
#define PUTA                  46//feito
#define CAFETAO               47//feito
#define VENDEDOR_DE_ARMAS     48//feito
#define TAXISTA_AEREO         49//feito
#define MOTOTAXISTA           50//feito
#define ALUGUEL_DE_CARROS     51//feito

//Veiculos
#define VEH_LIMOSINE 409//limosine
#define VEH_GUINCHO 525//carro guincho
//CHECKPOINTS
#define CHECKPOINT_NONE         0
#define CHECKPOINT_TERMINAL     1
#define CHECKPOINT_TERMINAL2    2
#define CHECKPOINT_TERMINAL3    3
#define CHECKPOINT_TERMINAL4    4
#define CHECKPOINT_TERMINAL5    5
#define CHECKPOINT_TERMINAL6    6
#define CHECKPOINT_TERMINAL7    7
#define CHECKPOINT_VIAGEMSFLV   8
#define CHECKPOINT_VIAGEMSFLV2  9
#define CHECKPOINT_VIAGEMLVSF  10
#define CHECKPOINT_VIAGEMLVSF2 11
//profissao
new profname[][] = {
"Invalida",
"Desempregado",
"Taxista",
"Vendedor De Veiculos",
"Corretor De Imóveis",
"Assassino",
"Barman",
"Juiz",
"Segurança Particular",
"Motorista Particular",
"Policial Civil",
"Policial Rodoviario",
"Narcoticos",
"Detetive",
"Pescador",
"Instrutor De Direçao",
"Ladrao",
"Motorista de Onibus",
"Assaltante",
"Mestre do Roubo",
"Juiz De Corrida",
"Bombeiro",
"Genio Do Crime",
"Ensinador Do Crime",
"Instrutor Militar",
"SWAT",
"Jornalista",
"Advogado",
"Medico",
"FBI",
"Mecanico",
"Deputado Estadual",
"Deputado Federal",
"Prefeito",
"Governador",
"Presidente",
"Segurança de Carros",
"Ladrao de Carros",
"Fiscalizador de Transito",
"Traficante",
"Exercito",
"Policia Florestal",
"IBAMA",
"Cacador",
"Motorista de Fuga",
"Onibus de Viagem",
"Puta",
"Cafetao",
"Vendedor de Armas",
"Taxista Aereo",
"Mototaxista",
"Locador de Carros"
};
new COR_PROFISSAO [51] = {
0x808080AA,0xF78654AA,0x6C1605AA,0x0000FFAA,
0x00C7FFAA,0xDEDEBBAA,0x27F940AA,0x00CED3AA,0x609356AA,0x6D9666AA,0xDEB887AA,0x0C8B87AA,0x569392AA,
0x66E3DfAA,0xFBE682AA,0x6A95AEAA,0xB70347AA,0x191A1AAA,0x81E366AA,0x438B8AAA,0xFFFFFFAA,0x8B0C0CAA,0x9A6697AA,0x003D3FAA,0x575F04AAA,
0x1200FFAA,0x5E3030AA,0x057ABDAA,0x8B750CAA,0x7FFF00AA,0x00FFE4AA,0xDEB887AA,0x54956AAA,0x48D2FFAA,
0x24FA7FAA,0xFBE682AA,0xB70347AA,0x00FFFFAA,0xFFD200AA,0x04A2FCAA,0x45804FAA,0x1A4D23AA,0xCD853FAA,0xFF6D01AA,
0x253033AA,0xF4D6FEAA,0x1AB5E7AA,0x92C2D2AA,0x767437AA,0x3A6300AA,0x183B3CAA};
//Para desativar o comando /camuflar

#define UDB GETGASOLINE
#define CallCost 1
#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1
#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256

new gPlayerCheckpointStatus[MAX_PLAYERS];
new Float:ppos[MAX_PLAYERS][3];
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new Petrol[MAX_VEHICLES];
new Color1[MAX_PLAYERS];
new Color2[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new alugueis[MAX_PLAYERS] = 0;
new Votacoes[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new Galao[MAX_PLAYERS] = 0;
new worldTime;
new despeja;
new alarme[MAX_VEHICLES] = 0;
new Menu:menumain;
new Menu:radares;
new Menu:menuportao;
new Menu:Terminais;
new Bebida[MAX_PLAYERS] = 0;
new AreaDesmanche[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS];
new AreaLimosine[MAX_PLAYERS] = 0;
new Maconha[MAX_PLAYERS] = 0;
new Heroina[MAX_PLAYERS] = 0;
new Cocaina[MAX_PLAYERS] = 0;
new bagulho[MAX_PLAYERS] = 0;
new crack[MAX_PLAYERS] = 0;
new AreaHospital[MAX_PLAYERS] = 0;
new AreaDelegacia[MAX_PLAYERS] = 0;
new AreaAluguel[MAX_PLAYERS] = 0;
new AreaTrafico[MAX_PLAYERS] = 0;
new AreaCarga[MAX_PLAYERS] = 0;
new AreaDescarga[MAX_PLAYERS] = 0;
new AreaAeroporto[MAX_PLAYERS] = 0;
new AreaMercado[MAX_PLAYERS] = 0;
new AreaCaca[MAX_PLAYERS] = 0;
new AreaCoopCaca[MAX_PLAYERS] = 0;
new CacaInProgress[MAX_PLAYERS] = 0;
new AreaCoopPesca[MAX_PLAYERS] = 0;
new PescaInProgress[MAX_PLAYERS] = 0;
new Passagem[MAX_PLAYERS] = 0;
new AreaHotel[MAX_PLAYERS] = 0;
new Calling[MAX_PLAYERS];
new Answered[MAX_PLAYERS];
new Callerid[MAX_PLAYERS];
new temporadavotos[MAX_PLAYERS] = 0;
new votosabertos[MAX_PLAYERS] = 0;
new Qtvotos[MAX_PLAYERS] = 0;
new voto[MAX_PLAYERS] = 0;
new Aluguel[MAX_PLAYERS] = 0;
new carroaluguel;
new AreaRadar[MAX_PLAYERS] = 0;
new AreaVenda[MAX_PLAYERS] = 0;
new Radaron[MAX_PLAYERS];
new devolucao[MAX_PLAYERS];
new Velocidade[MAX_PLAYERS];
new Mudo[MAX_PLAYERS] = 0;
new assalto[MAX_PLAYERS] = 0;
new carx;
new TempoDesmanche[MAX_PLAYERS] = 0;
new lavagem[MAX_VEHICLES];
new tune[MAX_VEHICLES];
new nitro[MAX_VEHICLES];
new stereo[MAX_VEHICLES];
new hidraulica[MAX_VEHICLES];
new frontalien[MAX_VEHICLES];
new spoileralien[MAX_VEHICLES];
new wheelswitch[MAX_VEHICLES];
new rearalien[MAX_VEHICLES];
new sideskirtalien[MAX_VEHICLES];
new roffalien[MAX_VEHICLES];
new exhaustalien[MAX_VEHICLES];
new jesterroof[MAX_VEHICLES];
new jesterside[MAX_VEHICLES];
new jesterexhaust[MAX_VEHICLES];
new jesterspoiler[MAX_VEHICLES];
new jesterrear[MAX_VEHICLES];
new jesterfront[MAX_VEHICLES];
new wangwheals[MAX_VEHICLES];
new dias;
new segunda[MAX_PLAYERS] = 0;
new terca[MAX_PLAYERS] = 0;
new quarta[MAX_PLAYERS] = 0;
new quinta[MAX_PLAYERS] = 0;
new sexta[MAX_PLAYERS] = 0;
new sabado[MAX_PLAYERS] = 0;
new domingo[MAX_PLAYERS] = 0;
new portao1;
new portao2;
new portaotrafico;
new Qtmortes[MAX_PLAYERS] = 0;
new antialarm[MAX_PLAYERS] = 0;
new aposta[MAX_PLAYERS] = 0;
new sorteio;
new numeroselecionado[MAX_PLAYERS] = 0;


forward apostar(playerid,numero);
forward MoneyGrubScoreUpdate();
forward MoneyGrubScoreUpdate();
forward TempoPrisao();
forward Taxi();
forward Pesca();
forward CheckFuel();
forward LogarPlayer(playerid);
forward Bancos();
forward MTaxi();
forward UpdateSpeed();
forward GetDistanceBetweenPlayers(playerid, playerid2);
forward Tempo();
forward Speed();
forward TimeFunction(playerid);
forward Hotel(playerid);
forward PhoneCut();
forward sethome(playerid);
forward pintar(veiculo,cor1,cor2);
forward votacaoon(plid1,plid2);
forward fimvotacao(plid1,plid2,vencedor);
forward Radar();
forward sacar(playerid);
forward depositar(playerid);
forward tunacao(vehicleid,componentid);
forward GetVehicleName(vehicleid);
forward Semana();
forward setcar(carid,X,Y,Z,ang,cor1,cor2);
forward dar(playerid,plid);
forward chupar(playerid,plid);
forward alugarlimo(playerid,car);
forward atraso(playerid,car);
forward camuflar(plid);
forward contagem();
forward contagem2();
forward contagem3();
forward contagem4();
forward contagem5();
forward locar(plid,car);
forward carrostrancados();
forward FuelDown();
forward setprof(plid);
forward desmanche(playerid);
forward assaltar(playerid);
forward consertar(vehicle,plid,angulo);
forward mortealarme(playerid,vehicleid);
forward parcelamento(playerid,plid,quant,pagamento);



main()
{
	print("\n|--------------------------------------------------------------------------|");
	print("|                        [MPA]Furious RPG Brasil                           |  ");
	print("|__________________________________________________________________________|  ");
	print("|                                                                          |  ");
	print("|      Uma parceria entre Rafael, Matraka, Rodrigo, Guilherme e Texugo     |  ");
	print("|--------------------------------------------------------------------------|\n");
	worldTime = 12;
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
 	new tmp[MAX_STRING];
  	set(tmp,udb_encode(name));
	return tmp;

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
		SendClientMessage(playerid,COR_VERMELHO,"Você deve ter cometido algum crime, por isso foi preso.");
		SendClientMessage(playerid,COR_VERMELHO,"Para sair mais cedo da prisão, você pode pagar a fiança de $1500,");
		SendClientMessage(playerid,COR_VERMELHO,"escrevendo /fianca.");
	}
	else{
		SpawnPlayer(playerid);
	}

}

public OnGameModeInit()
{
	print("GameModeInit()");
	SetGameModeText("[MPA]Furious® RPG");
	
	AddPlayerClass(270,-1958.9502,133.0608,27.6875,266.2009,0,0,0,0,0,0);//Banco de Inicio
    AddStaticVehicle(411,-1989.4811,268.4922,34.9027,92.2924,0,101); //Wang Cars
    AddStaticVehicle(415,-1991.1659,258.7904,34.9485,270.8439,0,101); //Wang Cars
    AddStaticVehicle(562,-1987.7681,306.1960,34.8362,270.7137,86,16); //Wang Cars
    AddStaticVehicle(522,-1932.2791,276.0281,40.6235,178.2758,86,16); //Wang Cars
    AddStaticVehicle(507,-1765.5890,936.3613,24.5647,268.8457,7,7); //Banco
    AddStaticVehicle(507,-1754.5854,936.2137,24.5669,269.5272,7,7); //Banco
    AddStaticVehicle(507,-1745.7629,936.1410,24.5664,269.5272,7,7); //Banco
    AddStaticVehicle(596,-1588.2479,748.0393,-5.4903,359.9998,0,1); //Delegacia
	AddStaticVehicle(523,-1584.0217,749.4910,-5.6655,180.9966,0,0); //Delegacia
	AddStaticVehicle(523,-1579.8461,749.0732,-5.6571,181.8757,0,0); //Delegacia
	AddStaticVehicle(596,-1574.2565,742.4983,-5.5206,88.9996,0,1); //Delegacia
	AddStaticVehicle(523,-1573.5985,734.6492,-5.6689,90.0025,0,0); //Delegacia
	AddStaticVehicle(497,-1679.5951,706.1432,30.7954,90.5114,0,1); //Delegacia
	AddStaticVehicle(437,-1988.5007,162.0946,27.6508,0.0000,1,1); //Companhia de Onibus
	AddStaticVehicle(437,-1988.3359,131.3477,27.6943,0.0000,1,1); //Companhia de Onibus
	AddStaticVehicle(410,-2089.6643,-83.5934,34.7976,359.9729,6,6); //auto escola
	AddStaticVehicle(410,-2081.2825,-83.4888,34.8086,4.0901,6,6); //auto escola
	AddStaticVehicle(461,-2022.3977,-124.3720,34.7832,179.9717,6,6); //auto escola
	AddStaticVehicle(487,-2032.2460,-155.6209,35.4656,0.0060,1,6); //auto escola
	AddStaticVehicle(475,-2088.8313,-156.0123,35.0983,359.9812,6,6); //auto escola
	AddStaticVehicle(475,-2092.4036,-145.2734,35.0986,0.0400,6,6); //auto escola
	AddStaticVehicle(475,-2092.3503,-132.4997,35.0966,0.4676,6,6); //auto escola
	AddStaticVehicle(487,-1829.1174,1300.2819,59.8817,204.0558,54,29); // mavmoto
	AddStaticVehicle(453,-1556.1755,1260.8345,-0.5926,234.7669,69,69); // barco pesca
	AddStaticVehicle(453,-1565.1833,1259.7523,-0.5379,227.8785,69,69); // barcopesca
	AddStaticVehicle(453,-1578.2352,1260.0367,-0.0551,228.0564,69,69); // barco pesca
	AddStaticVehicle(493,-1474.4727,687.5856,-0.2037,268.8839,6,6); // barco escola
	AddStaticVehicle(453,-1473.3943,703.5046,-0.4342,272.7462,6,6); // barco escola
	AddStaticVehicle(420,-1703.0906,1003.9794,17.3778,91.1514,6,1); //Companhia de Taxi
	AddStaticVehicle(420,-1687.7856,999.6074,17.3444,270.7191,6,1); //Companhia de taxi
	AddStaticVehicle(409,-1816.4678,1311.4034,50.2892,275.5558,1,1); //Companhia de Motoristas e Limosines
	AddStaticVehicle(409,-1829.7208,1289.6337,50.2512,110.5457,1,1); //Companhia de Motoristas e Limosines
	AddStaticVehicle(433,-1307.1633,456.9036,7.5909,89.9428,0,0); //Companhia de Caminhoes
	AddStaticVehicle(433,-1306.5189,463.9994,7.6436,89.6543,0,0); //Companhia de Caminhoes
	AddStaticVehicle(433,-1306.5568,460.6202,7.6451,90.4466,0,0); //Companhia de Caminhoes
	AddStaticVehicle(433,-1309.4952,444.8434,7.6132,55.0000,0,0); //Companhia de Caminhoes
	AddStaticVehicle(433,-1307.2222,447.7583,7.5937,54.9896,0,0); //Companhia de Caminhoes
	AddStaticVehicle(470,-1241.5155,445.2168,7.1593,326.9936,44,44); //carro
	AddStaticVehicle(470,-1232.7764,451.6962,7.1680,89.9980,0,0); // carro
	AddStaticVehicle(425,-1403.2001,465.2320,7.7642,181.0000,0,0); // hunter
	AddStaticVehicle(425,308.9300,1990.3328,18.2170,180.0703,0,0); // hunter
	AddStaticVehicle(425,309.5915,2056.1018,18.1976,180.0104,0,0); // hunter
	AddStaticVehicle(522,61.1946,1218.0421,18.4049,359.0378,86,16); // Posto
    AddStaticVehicle(448,172.1389,1182.3597,14.3580,81.4454,0,0); //pizzaria
    AddStaticVehicle(448,173.6868,1185.7911,14.3574,76.7980,0,0); // pizzaria
    AddStaticVehicle(409,-2621.3655,1337.4897,7.0069,313.7213,1,1); //Limosine do Caligulas
    AddStaticVehicle(598,2281.9001,2476.4099,10.5708,181.1453,0,1); //Delegacia
    AddStaticVehicle(598,2270.8464,2476.3936,10.6100,183.1438,0,1); //Delegacia
    AddStaticVehicle(598,2260.7954,2444.2747,10.5998,358.3361,0,1); //Delegacia
    AddStaticVehicle(523,2252.6882,2442.7351,10.3979,358.5258,0,0); //Delegacia
    AddStaticVehicle(523,2256.0098,2476.7568,10.3849,2.1371,0,0); //Delegacia
    AddStaticVehicle(490,2314.7742,2479.9255,3.4288,96.0243,0,0); //Delegacia
    AddStaticVehicle(490,2241.4177,2471.6741,3.4009,89.0155,0,0); //Delegacia
    AddStaticVehicle(490,2249.9888,2431.2312,3.4013,180.2238,0,0); //Delegacia
    AddStaticVehicle(482,834.5739,864.8542,12.9172,101.4198,85,85); //Pedreira
    AddStaticVehicle(599,-211.5923,998.9701,19.8102,265.9510,0,1); //Delegacia
    AddStaticVehicle(599,-210.4849,992.4020,19.7031,85.7844,0,1); //Delegacia
    AddStaticVehicle(599,-210.0757,985.7761,19.5688,90.3507,0,1); //Delegacia
    AddStaticVehicle(599,-228.2726,998.1651,19.7698,2.5886,0,1); //Delegacia
    AddStaticVehicle(599,-224.2261,998.5828,19.7920,183.1427,0,1); //Delegacia
    AddStaticVehicle(420,1707.0450,1439.5723,10.4482,181.6170,6,1); //Companhia de Taxi
    AddStaticVehicle(420,1709.6818,1409.5857,10.3460,189.1655,6,1); //Companhia de Taxi
    AddStaticVehicle(420,1713.2173,1394.6326,10.3240,196.5280,6,1); //Companhia de Taxi
    AddStaticVehicle(420,1708.8661,1451.0898,10.5262,161.0646,6,1); //Companhia de Taxi
    AddStaticVehicle(549,1981.5435,2059.2979,10.5174,353.6805,89,35); //Oficina
    AddStaticVehicle(562,2172.1643,1988.8639,10.4647,89.9129,116,1); //Wang Cars
    AddStaticVehicle(420,2074.9873,1162.1514,10.4525,180.4084,6,1); //Companhia de Taxi
    AddStaticVehicle(420,2074.9050,1173.0806,10.4547,180.4099,6,1); //Companhia de Taxi
    AddStaticVehicle(421,-1659.0063,457.9328,7.0660,136.5239,30,1); //Posto
    AddStaticVehicle(551,2107.2866,1398.2526,10.6526,176.9154,14,1); //auto escola
    AddStaticVehicle(551,2113.6096,1398.1202,10.6630,181.8968,14,1); //auto escola
    AddStaticVehicle(533,2127.2407,1425.4150,10.5294,270.4365,59,1); //auto escola
    AddStaticVehicle(533,2141.5369,1425.5233,10.5294,270.4357,59,1); //auto escola
    AddStaticVehicle(533,2092.0366,1403.9025,10.5294,355.2268,59,1); //auto escola
    AddStaticVehicle(522,2163.1565,1389.1322,10.3832,266.9648,6,25); //auto escola
    AddStaticVehicle(437,1451.5852,2608.0847,10.8050,90.1412,79,7); //Rodoviaria
    AddStaticVehicle(437,1417.9706,2608.0007,10.8050,90.1413,79,7); //Rodoviaria
    AddStaticVehicle(437,-1984.1387,-872.5995,32.1589,1.8554,1,1); //Rodoviaria
    AddStaticVehicle(437,-1985.0377,-844.9527,32.1595,1.7447,1,1); //Rodoviaria
    AddStaticVehicle(525,-2033.8861,178.8392,28.6900,88.2688,6,6); //Oficina
    AddStaticVehicle(533,-137.4019,1123.7744,19.4591,94.2418,59,1); //auto escola
    AddStaticVehicle(533,-137.1779,1129.4609,19.4590,91.5449,59,1); //auto escola
    AddStaticVehicle(533,-148.6749,1113.4774,19.4552,175.5570,59,1); //auto escola
    AddStaticVehicle(533,-148.8656,1126.7777,19.4513,178.2830,59,1); //auto escola
    AddStaticVehicle(533,-214.6069,1215.3269,19.4512,182.9801,59,1); //Oficina
    AddStaticVehicle(533,-214.6069,1215.3269,19.4512,182.9801,59,1); // OFICINA
    AddStaticVehicle(431,-168.3059,1018.0724,19.8412,274.8784,0,0); //Rodoviaria
    AddStaticVehicle(431,-169.4577,1011.3378,19.8436,270.7800,0,0); //Rodoviaria
    AddStaticVehicle(525,-228.6867,1222.7145,19.6121,270.4553,22,30); //Oficina
    AddStaticVehicle(416,-305.2730,1032.4888,19.7445,88.2596,1,3); // Hospital
    AddStaticVehicle(416,-304.2343,1020.0436,19.7431,270.8546,1,3); // Hospital
    AddStaticVehicle(423,-80.8225,1077.5436,19.7632,181.3302,1,17); // Sorveteria
    AddStaticVehicle(407,93.6946,1173.2385,18.8977,260.9060,58,0); // Departamento de Bombeiros
    AddStaticVehicle(407,93.0780,1165.4402,18.8922,91.6301,58,0); // Departamento de Bombeiros
    AddStaticVehicle(407,-2052.5762,83.4358,28.6310,269.3641,58,0); // Departamento de Bombeiros
    AddStaticVehicle(407,-2053.5928,93.0611,28.6238,87.8078,58,0); // Departamento de Bombeiros
    AddStaticVehicle(542,-94.7943,1221.5508,19.4802,357.1290,61,0); // Hotel
    AddStaticVehicle(418,-30.9063,1166.5474,19.5011,180.3358,117,227); //Restaurante
    AddStaticVehicle(506,-186.3302,1132.2968,19.3677,1.2079,6,6); //Banco
    AddStaticVehicle(455,0.9061,1039.6506,20.2411,270.8083,84,58); //Companhia de Caminhoes
    AddStaticVehicle(500,-251.3173,1182.5977,19.8477,272.5623,40,84); //Morador da Casa
    AddStaticVehicle(407,-798.8485,1517.9941,27.1459,77.9222,58,0); //Departamento de bombeiros
    AddStaticVehicle(522,-828.1953,1446.9080,13.6442,72.1553,86,16); //Hotel
    AddStaticVehicle(542,-865.2045,1544.6859,22.7289,94.4628,61,0); //Carro sem dono
    AddStaticVehicle(542,2192.1492,2503.5032,10.5638,357.0247,61,0);//Posto
    AddStaticVehicle(522,2186.2415,1676.2576,10.6643,180.2621,86,16); //Caligulas
    AddStaticVehicle(416,-655.1944,1443.5889,13.7670,179.4314,1,3); //Hospital
    AddStaticVehicle(525,-747.4199,1439.6127,16.0349,176.1869,4,4); //Oficina
    AddStaticVehicle(506,-799.8674,1478.5431,20.8521,183.0957,6,6); //Carro do governo
    AddStaticVehicle(599,-723.6768,1550.8132,40.4700,344.2940,0,1); //Delegacia
    AddStaticVehicle(599,-729.0935,1552.1915,39.9158,343.2258,0,1); //Delegacia
    AddStaticVehicle(431,-751.8373,1587.4849,27.0613,60.6843,0,0); //Companhia de onibus
    AddStaticVehicle(431,-752.1641,1627.8704,27.2177,259.7656,0,0); //Rodoviaria
    AddStaticVehicle(416,-2572.7256,658.1282,14.6016,87.8018,125,125); // Hospital
    AddStaticVehicle(416,-2589.6438,623.2825,14.6083,89.5855,125,125); // Hospital
    AddStaticVehicle(416,-2546.0017,632.2606,14.6023,270.0818,125,125); // Hospital
    AddStaticVehicle(416,-2545.8591,657.3478,14.6092,92.6846,125,125); // Hospital
    AddStaticVehicle(544,-2052.2947,74.8714,28.6294,273.3037,3,3); // departamento de bombeiros
    AddStaticVehicle(525,1613.5758,2217.0820,10.6981,270.3585,6,6); // Posto
    AddStaticVehicle(411,1983.8820,2263.8018,20.1601,1.2326,0,0); // Carro do Governo
    AddStaticVehicle(609,1746.8749,2345.8274,10.8890,269.2831,0,0); // carro de arrombamento
    AddStaticVehicle(603,1666.5952,1808.6858,10.6584,353.7187,0,0); // $hody used autos
    AddStaticVehicle(442,1584.8021,1801.5531,10.6554,181.2161,0,0); // Carro da funeraria
    carroaluguel = AddStaticVehicle(504,-1665.7111,1224.1819,20.9466,40.9238,0,0); // Agencia de alugueis otto cars
    carroaluguel = AddStaticVehicle(492,-1680.5042,1210.2413,20.9380,50.2592,0,0); // Agencia de alugueis otto cars
    carroaluguel = AddStaticVehicle(491,-1658.3174,1206.0847,20.8698,2.0899,0,0); // Agencia de alugueis otto cars
    carroaluguel = AddStaticVehicle(411,-1678.6064,1210.7205,13.4010,44.3841,4,4); // Agencia de alugueis otto cars
    carroaluguel = AddStaticVehicle(415,-1667.7877,1222.8989,13.4468,282.5329,1,1); // Agencia de alugueis otto cars
    carroaluguel = AddStaticVehicle(402,-1646.4025,1206.4597,13.5070,234.7827,6,6); // Agencia de alugueis otto cars
    carroaluguel = AddStaticVehicle(421,-1659.4150,1219.4540,13.5543,301.7943,0,0); // Agencia de alugueis otto cars
    carroaluguel = AddStaticVehicle(474,-1668.8802,1206.8923,7.0173,320.1071,0,0); // Agencia de alugueis otto cars
    AddStaticVehicle(428,-1929.5757,585.0803,35.2528,0.7647,103,0); // Agencia de Seguranças de SF
    AddStaticVehicle(428,-1935.4110,585.6714,35.2412,359.6793,103,0); // Agencia de Seguranças de SF
    AddStaticVehicle(428,-1941.4701,585.9758,35.2329,359.3401,103,0); // Agencia de Seguranças de SF
    carx = AddStaticVehicle(451,-2714.3953,196.1324,4.0351,179.7363,0,0); // Wheel arch angels
    portaotrafico = CreateObject(7657, -2122.220703, -80.644669, 36.037155, 0, 0, 0);//portao da fabrica de drogas
    portao1 = CreateObject(975, -1770.112793, 979.835083, 24.182503, 0, 0, 270);//portao do estacionamento 1
    portao2 = CreateObject(975, -1770.122803, 988.664185, 24.182503, 0, 0, 270);//portao do estacionamento 2
	CreateObject(2754,-1973.910156,116.928040,27.589643,0,0,270);//maquina do banco
    CreateObject(2754,-2447.650391,522.882629,30.269331,0,0,180);//maquina do banco
    CreateObject(2754,-1746.611572,963.392334,24.784956,0,0,90);//maquina do banco
    CreateObject(2754,-180.600586,1135.615234,19.644331,0,0,0);//maquina do banco
    CreateObject(3865,-2006.717041,619.894043,32.755894,0,0,270);//quebra molas
    CreateObject(3865,-2001.424072,620.079651,32.756248,0,0,90);//quebra molas
    CreateObject(3865,-2111.487793,731.253601,66.997780,0,0,0);//quebra molas
    CreateObject(3865,-2139.136475,786.375671,67.122787,0,0,90);//quebra molas
    CreateObject(3865,-2146.561768,786.255981,67.122787,0,0,270);//quebra molas
    CreateObject(3865,-2222.083496,731.230225,46.799339,0,0,0);//quebra molas
    CreateObject(3865,-2226.735596,485.381958,32.549339,0,0,270);//quebra molas
    CreateObject(3865,-2146.852783,250.311203,32.705589,0,0,270);//quebra molas
    CreateObject(3865,-2120.186523,109.898170,32.755592,0,0,0);//quebra molas
    CreateObject(3865,-2107.081299,57.837120,32.672775,0,0,90);//quebra molas
    CreateObject(3865,-2067.942139,-70.494415,32.655586,0,0,0);//quebra molas
    CreateObject(3865,-2277.833008,-70.479614,32.647774,0,0,0);//quebra molas
    CreateObject(3865,-2139.114990,626.716553,49.774338,0,0,90);//quebra molas
    CreateObject(3865,-2146.770996,626.587158,49.774338,0,0,270);//quebra molas
    CreateObject(3865,-275.440979,1134.981445,17.102724,0,0,90);//quebra molas
    CreateObject(3865,-256.565948,1098.422119,17.152723,0,0,0);//quebra molas
    CreateObject(3865,-174.459763,1198.431519,17.094175,0,0,0);//quebra molas
    CreateObject(3865,-93.344093,1198.121094,17.095541,0,0,0);//quebra molas
    CreateObject(3865,-65.869827,1183.039307,17.102724,0,0,270);//quebra molas
    CreateObject(3865,-52.789108,1148.605347,17.124454,0,0,0);//quebra molas
    CreateObject(3865,-3.615129,1098.441528,17.127724,0,0,0);//quebra molas
    CreateObject(3865,-43.394524,1023.385986,17.077724,0,0,0);//quebra molas
    CreateObject(3865,-107.177963,1098.014038,17.252722,0,0,0);//quebra molas
    CreateObject(3865,-275.686310,1034.885986,17.102724,0,0,270);//quebra molas
    CreateObject(3865,-213.109131,1018.517761,17.102724,0,0,0);//quebra molas
    CreateObject(1412, -2078.769775, -275.086975, 35.594273, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2073.595703, -275.090454, 35.594273, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2068.412109, -275.082977, 35.594273, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2063.236084, -275.088440, 35.594273, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2058.057617, -275.090454, 35.601353, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2052.889160, -275.086792, 35.601353, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2047.703491, -275.091736, 35.594273, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2042.974365, -273.645172, 35.594273, 0, 0, 33.75);//pista da auto escola
    CreateObject(1412, -2041.841553, -269.826080, 35.594273, 0, 0, 112.5);//pista da auto escola
    CreateObject(1412, -2043.823975, -265.049561, 35.594273, 0, 0, 112.5);//pista da auto escola
    CreateObject(1412, -2042.373413, -263.658356, 35.594273, 0, 0, 337.5);//pista da auto escola
    CreateObject(1412, -2037.846436, -266.117584, 35.594273, 0, 0, 326.25);//pista da auto escola
    CreateObject(1412, -2034.736328, -265.132721, 35.594273, 0, 0, 67.5);//pista da auto escola
    CreateObject(1412, -2036.111572, -261.746674, 35.594273, 0, 0, 337.5);//pista da auto escola
    CreateObject(1412, -2040.905273, -259.765961, 35.594273, 0, 0, 337.5);//pista da auto escola
    CreateObject(1412, -2045.697632, -257.785767, 35.594273, 0, 0, 337.5);//pista da auto escola
    CreateObject(1412, -2049.937988, -258.602539, 35.594273, 0, 0, 45);//pista da auto escola
    CreateObject(1412, -2053.602539, -262.279175, 35.601353, 0, 0, 45);//pista da auto escola
    CreateObject(1412, -2053.062988, -265.141327, 35.594273, 0, 0, 157.5);//pista da auto escola
    CreateObject(1412, -2053.197266, -266.647461, 35.594273, 0, 0, 191.2501);//pista da auto escola
    CreateObject(1412, -2058.339355, -267.148743, 35.594273, 0, 0, 180);//pista da auto escola
    CreateObject(1412, -2063.494629, -267.143188, 35.601353, 0, 0, 180);//pista da auto escola
    CreateObject(1412, -2068.668457, -267.141113, 35.594273, 0, 0, 180);//pista da auto escola
    CreateObject(1412, -2073.850830, -267.141388, 35.594273, 0, 0, 180);//pista da auto escola
    CreateObject(1412, -2078.294434, -265.279968, 35.594273, 0, 0, 135);//pista da auto escola
    CreateObject(1412, -2083.173096, -273.272583, 35.594273, 0, 0, 315);//pista da auto escola
    CreateObject(1412, -2086.816650, -269.606232, 35.594273, 0, 0, 315);//pista da auto escola
    CreateObject(1412, -2089.169678, -265.247314, 35.594273, 0, 0, 281.25);//pista da auto escola
    CreateObject(1412, -2089.649902, -260.160706, 35.594273, 0, 0, 270);//pista da auto escola
    CreateObject(1412, -2080.082275, -260.868896, 35.594273, 0, 0, 90);//pista da auto escola
    CreateObject(1412, -2080.051025, -255.702576, 35.594273, 0, 0, 90);//pista da auto escola
    CreateObject(1412, -2089.667236, -254.980316, 35.594273, 0, 0, 270);//pista da auto escola
    CreateObject(1412, -2089.665527, -249.776718, 35.594273, 0, 0, 270);//pista da auto escola
    CreateObject(1412, -2080.052734, -250.506592, 35.594273, 0, 0, 90);//pista da auto escola
    CreateObject(1412, -2077.419922, -247.921997, 35.594273, 0, 0, 0);//pista da auto escola
    CreateObject(1412, -2089.670410, -244.609467, 35.594273, 0, 0, 270);//pista da auto escola
    CreateObject(1412, -2087.116211, -242.011490, 35.594273, 0, 0, 180);//pista da auto escola
    CreateObject(1412, -2081.944336, -242.009796, 35.594273, 0, 0, 180);//pista da auto escola
    CreateObject(1412, -2077.420410, -242.016296, 35.594273, 0, 0, 180);//pista da auto escola
    CreateObject(16337, -2036.058838, -264.480286, 35.205029, 0, 0, 157.5);//pista da auto escola
    CreateObject(1697, -2041.155884, -261.926880, 35.747181, 0, 0, 67.5);//pista da auto escola
    CreateObject(1238, -2018.080933, -167.975479, 34.638493, 0, 0, 0);//pista da auto escola
    CreateObject(1238, -2024.872559, -167.708771, 34.638493, 0, 0, 0);//pista da auto escola
    CreateObject(1238, -2031.762817, -167.096207, 34.638493, 0, 0, 0);//pista da auto escola
    CreateObject(1238, -2038.288330, -173.047913, 34.645573, 0, 0, 0);//pista da auto escola
    CreateObject(1238, -2032.251465, -176.804901, 34.638493, 0, 0, 0);//pista da auto escola
    CreateObject(1238, -2025.556152, -177.177750, 34.638493, 0, 0, 0);//pista da auto escola
    CreateObject(1238, -2018.639526, -176.541321, 34.638493, 0, 0, 0);//pista da auto escola
    CreateObject(9186, -2063.019775, -266.581635, 38.872627, 0, 0, 11.25);//pista da auto escola
    CreateObject(9185, -2083.634033, -239.524765, 38.865547, 0, 0, 0.0001);//pista da auto escola
    CreateObject(8644, -2091.443604, -248.611725, 37.846043, 0, 0, 202.5);//pista da auto escola
    CreateObject(8618, -2074.079346, -265.067322, 47.326218, 0, 0, 0);//pista da auto escola
    CreateObject(8530, -2039.266235, -269.404755, 39.334579, 0, 0, 22.5);//pista da auto escola
    CreateObject(8332, -2077.686768, -256.505188, 36.376064, 0, 0, 270.0001);//pista da auto escola
    CreateObject(8327, -2087.503174, -274.420471, 38.246452, 0, 0, 337.5);//pista da auto escola
    CreateObject(8323, -2094.034424, -253.804031, 40.144310, 0, 0, 0);//pista da auto escola
    CreateObject(7914, -2057.293945, -276.920959, 37.656349, 0, 0, 180);//pista da auto escola
    CreateObject(7912, -2047.854126, -253.954575, 37.649269, 0, 0, 0);//pista da auto escola
    CreateObject(7905, -2040.635498, -272.504211, 38.865547, 0, 0, 213.75);//pista da auto escola
    CreateObject(7911, -2073.659180, -276.908997, 37.649269, 0, 0, 180);//pista da auto escola
    CreateObject(7910, -2039.937256, -258.951691, 37.649269, 0, 0, 337.5);//pista da auto escola
    CreateObject(7909, -2055.614746, -257.358521, 37.656349, 0, 0, 11.25);//pista da auto escola
    CreateObject(1634, -2031.590576, -266.321655, 35.492622, 0, 0, 67.5);//pista da auto escola
    CreateObject(3471, -2029.324097, -262.439819, 35.594852, 0, 0, 337.5);//pista da auto escola
    CreateObject(3471, -2032.690918, -270.602539, 35.601933, 0, 0, 348.75);//pista da auto escola
    AddVehicleComponent(carx,1010);
    AddVehicleComponent(carx,1087);

    

    UsePlayerPedAnims();
    EnableTirePopping(1);
    
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(nitro[i] == 1){
    AddVehicleComponent(i,1010);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(stereo[i] == 1){
    AddVehicleComponent(i,1086);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(hidraulica[i] == 1){
    AddVehicleComponent(i,1087);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(frontalien[i] == 1){
    AddVehicleComponent(i,1171);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(spoileralien[i] == 1){
    AddVehicleComponent(i,1147);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(wheelswitch[i] == 1){
    AddVehicleComponent(i,1080);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(rearalien[i] == 1){
    AddVehicleComponent(i,1149);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(sideskirtalien[i] == 1){
    AddVehicleComponent(i,1040);
    AddVehicleComponent(i,1036);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(roffalien[i] == 1){
    AddVehicleComponent(i,1038);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(exhaustalien[i] == 1){
    AddVehicleComponent(i,1038);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(jesterroof[i] == 1){
    AddVehicleComponent(i,1068);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(jesterside[i] == 1){
    AddVehicleComponent(i,1069);
    AddVehicleComponent(i,1071);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(jesterexhaust[i] == 1){
    AddVehicleComponent(i,1066);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(jesterspoiler[i] == 1){
    AddVehicleComponent(i,1158);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(jesterrear[i] == 1){
    AddVehicleComponent(i,1159);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(jesterfront[i] == 1){
    AddVehicleComponent(i,1160);
    return 1;
	}
  }
    for(new i=0; i<MAX_VEHICLES; i++) {
    if(wangwheals[i] == 1){
    AddVehicleComponent(i,1160);
    return 1;
	}
  }

/*
Componentes de Veiculo:
nitro
stereo
hidraulica
frontalien
spoileralien
wheelswitch
rearalien
sideskirtalien
roffalien
exhaustalien
jesterroof
jesterside
jesterexhaust
jesterspoiler
jesterrear
jesterfront
wangwheals
*/
    for(new f=0; f<MAX_PLAYERS; f++){
    for(new a=0; a<MAX_VEHICLES; a++){
    if(a == carroaluguel){
    if(Profissao[f] != ALUGUEL_DE_CARROS || Aluguel[f] != a){
    SetVehicleParamsForPlayer(a,f, 0, 1);
    }

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

    cAddStaticVehicle(modelid, X, Y, Z, ang, Cor1, Cor2);
    }
    fclose(temp);
    SetTimer("TimeFunction", 1000, 1);
    SetTimer("Bancos", 500, 1);
    SetTimer("CheckFuel", 50000, 1);
    SetTimer("MoneyGrubScoreUpdate", 1000, 1);
    SetTimer("TempoPrisao", 1000, 1);
    SetTimer("Taxi", 5000, 1);
    SetTimer("ATaxi", 5000, 1);
    SetTimer("MTaxi", 5000, 1);
    SetTimer("Tempo", 60000, 1);
    SetTimer("Speed",1000,true);

    menumain = CreateMenu("Estacionamento",1,30.0,140.0,220.0,0.0);
	AddMenuItem(menumain,0,"Abrir Portao do Estacionamento");
	AddMenuItem(menumain,0,"Fechar Portao do Estacionamento");
	AddMenuItem(menumain,0,"Sair");
	
    radares = CreateMenu("Radares",1,30.0,140.0,220.0,0.0);
	AddMenuItem(radares,0,"Ativar Radares da Cidade");
	AddMenuItem(radares,0,"Desativar Radares da Cidade");
	AddMenuItem(radares,0,"Sair");
	
	menuportao = CreateMenu("Portao",1,30.0,140.0,220.0,0.0);
	AddMenuItem(menuportao,0,"Abrir Portao de Trafico");
	AddMenuItem(menuportao,0,"Fechar Portao de Trafico");
	AddMenuItem(menuportao,0,"Sair");
	
	Terminais = CreateMenu("Terminais",1,30.0,140.0,220.0,0.0);
	AddMenuItem(Terminais,0,"Circuito de SF");
	AddMenuItem(Terminais,0,"Sair");

    for(new i = 0;i<20;i++) {
	}
	return 1;
    }
  }
}
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	PlayerPlaySound(playerid, 1185, 0.0, 0.0, 0.0);
    SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,-2173.1484,-270.9155,35.3203);
	SetPlayerFacingAngle(playerid, 181.9282);
	SetPlayerCameraPos(playerid,-2173.0645,-274.8441,35.3203);
	SetPlayerCameraLookAt(playerid,-2173.1484,-270.9155,35.3203);
	GameTextForPlayer(playerid,"~w~[MPA]FURIOUS RPG BRASIL. ~b~CODERS:[MPA] CLAN", 5000,3);
	return 1;
}

public OnGameModeExit()
{
    for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			if(PLAYERLIST_authed[i] == 1) {
				udb_setAccState(PlayerName(i),GetPlayerMoney(i));
				new Float:health;
				GetPlayerHealth(i, health);
				udb_setHealth(PlayerName(i), health);
				printf("Os dados de %s (ID: %d) foram salvos com sucesso\n",PlayerName(i),i);
				DestroyMenu(menumain);
	            DestroyMenu(radares);
	            DestroyMenu(menuportao);
	            DestroyMenu(Terminais);
			}
		}
	}
	print("Saindo do [MPA]Furious® RPG");
	return 1;
}

public OnPlayerConnect(playerid)
{
	printf("%s entrou no servidor",PlayerName(playerid));
    SetPlayerColor(playerid,COR_NADA);
	Profissao[playerid] = 0;
	Log[playerid] = 0;
	ApplyAnimation(playerid, "SMOKING", "F_smklean_loop", 4.0, 0, 0, 0, 0, 0);
	new msg[256];
	format(msg,sizeof(msg),"SERVIDOR: %s entrou no servidor.",PlayerName(playerid));
	SendClientMessageToAll(COR_VERDED,msg);
	GameTextForPlayer(playerid, "~b~Bem vindo ao ~w~MPA Furious RPG Mode", 20000, 6);
	SendClientMessage(playerid, COR_BRANCO, "[MPA]Furious RPG Mode");
	SendClientMessage(playerid, COR_VENDEDOR, "Para ajuda inicial digite /ajuda");
	SendClientMessage(playerid, COR_VENDEDOR, "Para os comandos do RPG digite /comandos");
	SendClientMessage(playerid, COR_VENDEDOR, "Para uma breve explicação sobre o RPG digite /aprender");
	SendClientMessage(playerid, COR_VENDEDOR, "Para ver os criadores desse mode digite /creditos");
	SendClientMessage(playerid, COR_VENDEDOR, "Para ver as profissoes do mode digite /profs");
	if (!udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COR_AMARELOB, "Voce nao esta registrado faça registro com /registrar");
	}
	if (udb_Exists(PlayerName(playerid))) {
    format(msg,sizeof(msg),"Bem vindo novamente %s digite /entrar para se logar.",PlayerName(playerid));
    SendClientMessage(playerid,COR_AMARELOB,msg);
	}
    new Text: gText2;
    gText2 = TextDrawCreate(10.0, 434.5,"MPA Furious RPG BRASIL");
    TextDrawFont(gText2,3);
    TextDrawColor(gText2, COR_VENDEDOR);
    TextDrawBackgroundColor(gText2, 126);
    TextDrawShowForPlayer(playerid, gText2);
	SetPlayerMapIcon(playerid,1,-1982.3353,126.7816,27.6875,52,0xF5F5F5F5); // banco
    SetPlayerMapIcon(playerid,2,-2036.1665,174.9400,28.8359,27,0xF5F5F5F5); // OFICINA
    SetPlayerMapIcon(playerid,3,-1968.9993,286.2070,35.1719,55,0xF5F5F5F5); // WANG CARS
    SetPlayerMapIcon(playerid,4,-2027.2357,-93.6293,35.1641,36,0xF5F5F5F5); // AUTO ESCOLA
    SetPlayerMapIcon(playerid,5,-2524.9568,336.0891,19.6932,53,0xF5F5F5F5); // ESTACIONAMENTO
    SetPlayerMapIcon(playerid,6,-2757.6206,372.5691,4.3436,25,0xF5F5F5F5); // CASA BRANCA
    SetPlayerMapIcon(playerid,7,-2712.9155,198.1953,4.3281,55,0xF5F5F5F5); // AUTO TUNING
    SetPlayerMapIcon(playerid,8,-2648.2092,-26.0830,6.1328,31,0xF5F5F5F5); // CASA
    SetPlayerMapIcon(playerid,9,-2722.9187,-314.0563,7.1837,31,0xF5F5F5F5); // CASA
    SetPlayerMapIcon(playerid,10,-1745.0042,960.2429,24.8828,52,0xF5F5F5F5); // BANCO
    SetPlayerMapIcon(playerid,11,-1777.6088,970.7198,24.7344,53,0xF5F5F5F5); // ESTACIONAMENTO DO BANCO
    SetPlayerMapIcon(playerid,12,-2403.8145,972.3829,44.8510,63,0xF5F5F5F5); // POSTO
    SetPlayerMapIcon(playerid,13,-2651.5891,631.6143,14.4545,22,0xF5F5F5F5); // HOSPITAL
    SetPlayerMapIcon(playerid,15,-1571.1511,662.1107,6.7581,30,0xF5F5F5F5); // DELEGACIA
    SetPlayerMapIcon(playerid,16,-1681.8098,418.3568,6.7451,63,0xF5F5F5F5); // POSTO
    SetPlayerMapIcon(playerid,17,-2025.0167,66.8148,28.4352,20,0xF5F5F5F5); // BOMBEIRO
    SetPlayerMapIcon(playerid,18,-1973.4220,-858.1516,32.0234,34,0xF5F5F5F5); // RODOVIARIA
    SetPlayerMapIcon(playerid,19,2237.6768,2453.6729,10.7541,30,0xF5F5F5F5); // DELEGACIA
    SetPlayerMapIcon(playerid,20,2200.9346,2471.4326,10.8203,63,0xF5F5F5F5); // POSTO
    SetPlayerMapIcon(playerid,21,2095.2546,2484.0063,11.0781,31,0xF5F5F5F5); // CASA
    SetPlayerMapIcon(playerid,22,1881.1199,2290.5486,10.9799,31,0xF5F5F5F5); // CASA
    SetPlayerMapIcon(playerid,23,1939.6676,2216.2678,10.7159,53,0xF5F5F5F5); // ESTACIONAMENTO
    SetPlayerMapIcon(playerid,24,2251.6997,2038.3525,10.8203,53,0xF5F5F5F5); // ESTACIONAMENTO
    SetPlayerMapIcon(playerid,25,2317.7253,1928.4097,5.3125,53,0xF5F5F5F5); // ESTACIONAMENTO
    SetPlayerMapIcon(playerid,26,2193.8088,1676.9948,12.3672,25,0xF5F5F5F5); // CALIGULAS
    SetPlayerMapIcon(playerid,27,2114.2124,1407.2158,10.8203,36,0xF5F5F5F5); // AUTO ESCOLA
    SetPlayerMapIcon(playerid,28,2094.9063,1159.2699,11.6484,52,0xF5F5F5F5); // BANCO
    SetPlayerMapIcon(playerid,29,2116.5845,920.3513,10.8203,63,0xF5F5F5F5); // POSTO
    SetPlayerMapIcon(playerid,30,2787.6831,912.2609,10.4904,27,0xF5F5F5F5); // OFICINA
    SetPlayerMapIcon(playerid,31,832.2372,830.9782,11.7428,11,0xF5F5F5F5); // PEDREIRA
    SetPlayerMapIcon(playerid,32,-141.4270,1123.5546,19.7500,36,0xF5F5F5F5); // AUTO ESCOLA
    SetPlayerMapIcon(playerid,33,-212.7862,1214.8997,19.8906,27,0xF5F5F5F5); // OFICINA
    SetPlayerMapIcon(playerid,34,-213.4346,979.4687,19.3326,30,0xF5F5F5F5); // DELEGACIA
    SetPlayerMapIcon(playerid,35,-181.8393,1133.6884,19.7422,52,0xF5F5F5F5); // BANCO
    SetPlayerMapIcon(playerid,36,69.2585,1213.8500,18.8128,63,0xF5F5F5F5); // POSTO
    SetPlayerMapIcon(playerid,37,-97.5807,1084.5090,19.7422,17,0xF5F5F5F5); // SORVETERIA
    SetPlayerMapIcon(playerid,38,-316.7072,1052.6274,20.3403,22,0xF5F5F5F5); // HOSPITAL
    SetPlayerMapIcon(playerid,39,-179.8009,1088.0155,19.7422,49,0xF5F5F5F5); // BAR
    SetPlayerMapIcon(playerid,40,-2163.0459,-225.0843,36.5156,16,0xF5F5F5F5); // TRAFICO


    Calling[playerid] = -1;
	Answered[playerid] = 0;
	Callerid[playerid] = 0;
	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	SetPlayerColor(playerid, COR_CINZA);
	return false;
    }

public OnPlayerDisconnect(playerid,reason)
{
    printf("%s saiu do servidor",PlayerName(playerid));
    if (PLAYERLIST_authed[playerid] == 1) {
	// Was loggedin, so save the data!
		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		new Float:health;
		GetPlayerHealth(playerid, health);
		udb_setHealth(PlayerName(playerid), health);
		PLAYERLIST_authed[playerid] = 0;
        new msg[256];
		switch (reason)

	{
 	case 0:
  	{
		format(msg,sizeof(msg),"SERVIDOR:%s saiu do servidor (Conexão Perdida)", PlayerName(playerid));
		SendClientMessageToAll(COR_VERDED, msg);
	}
	case 1:
 	{
		format(msg,sizeof(msg), "SERVIDOR:%s saiu do servidor (Propria vontade)", PlayerName(playerid));
		SendClientMessageToAll(COR_VERDED, msg);
	}
	case 2:
 	{
		format(msg,sizeof(msg), "SERVIDOR:%s saiu do servidor (Kickado)", PlayerName(playerid));
		SendClientMessageToAll(COR_VERDED, msg);
		}
	}
}
    return 1;
    }

public OnPlayerSpawn(playerid)
{
                if(Profissao[playerid] == DESEMPREGADO) {
					SetPlayerColor(playerid, COR_DESEMPREGADO); // Cinza
					return 1;
				}
				else if(Profissao[playerid] == TAXISTA) {
					SetPlayerColor(playerid, COR_TAXISTA); // Amarelo
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
					SetPlayerColor(playerid, COR_VENDEDOR); // Verde
					return 1;
				}
				else if(Profissao[playerid] == CORRETOR) {
					SetPlayerColor(playerid, COR_CORRETOR); // Marfin
					return 1;
				}
				else if(Profissao[playerid] == ASSASSINO) {
					SetPlayerColor(playerid, COR_ASSASSINO); // Vermelho
                    GivePlayerWeapon (playerid,24,50);
                    GivePlayerWeapon (playerid,4,0);
					return 1;
				}
				else if(Profissao[playerid] == BARMAN) {
					SetPlayerColor(playerid, COR_BARMAN); // Bege
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == JUIZ) {
					SetPlayerColor(playerid, COR_JUIZ); // verde
                    GivePlayerWeapon (playerid,24,50);
					return 1;
				}
				else if(Profissao[playerid] == SEGURANÇA) {
					SetPlayerColor(playerid, COR_SEGURANCA); // Azul claro
                    GivePlayerWeapon (playerid,24,50);
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
					SetPlayerColor(playerid, COR_MOTORISTA); // Laranja
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == COP_CIVIL) {
					SetPlayerColor(playerid, COR_COP_CIVIL); // Azul
                    GivePlayerWeapon (playerid,32,200);
					return 1;
				}
				else if(Profissao[playerid] == COP_RODOVIARIO) {
					SetPlayerColor(playerid, COR_COP_RODOVIARIO); // Azul
                    GivePlayerWeapon (playerid,24,50);
                    GivePlayerWeapon (playerid,4,0);
					return 1;
				}
				else if(Profissao[playerid] == COP_ELITE) {
					SetPlayerColor(playerid, COR_COP_ELITE); // Azul Claro
                    GivePlayerWeapon(playerid,4,0);
                    GivePlayerWeapon(playerid,32,200);
                    GivePlayerWeapon(playerid,31,200);
					return 1;
				}
				else if(Profissao[playerid] == PESCADOR) {
					SetPlayerColor(playerid, COR_PESCADOR); // Bege
					return 1;
				}
				else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
					SetPlayerColor(playerid, COR_INSTRUTOR); // VClaro
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
					SetPlayerColor(playerid, COR_MOTORISTA_ONIBUS); // Claro
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
                else if(Profissao[playerid] == LADRAO) {
	                SetPlayerColor(playerid,COR_LADRAO);//Verde
                    GivePlayerWeapon(playerid,24,50);
                    GivePlayerWeapon(playerid,4,0);
                    return 1;
				}
                else if(Profissao[playerid] == ASSALTANTE) {
                    SetPlayerColor(playerid, COR_ASSALTANTE); //Laranja
                    GivePlayerWeapon(playerid,30,100);
                    GivePlayerWeapon(playerid,5,0);
                    return 1;
				}
                else if(Profissao[playerid] == GENIO_DO_CRIME) {
                    SetPlayerColor(playerid, COR_GENIO_DO_CRIME); //Claro
                    GivePlayerWeapon(playerid,30,100);
                    GivePlayerWeapon(playerid,25,50);
                    GivePlayerWeapon(playerid,18,1);
                    return 1;
				}
                else if(Profissao[playerid] == JUIZ_DE_CORRIDA) {
                    SetPlayerColor(playerid, COR_JUIZ_DE_CORRIDA); //Azul Claro
                    GivePlayerWeapon(playerid,24,50);
                    return 1;
				}
                else if(Profissao[playerid] == BOMBEIRO) {
                    SetPlayerColor(playerid, COR_BOMBEIRO); // Roxo
                    GivePlayerWeapon(playerid,42,600);
                    GivePlayerWeapon(playerid,23,50);
                    return 1;
				}
                else if(Profissao[playerid] == MESTRE_DO_ROUBO) {
                    SetPlayerColor(playerid, COR_MESTRE_DO_ROUBO); // Preto
                    GivePlayerWeapon(playerid,30,120);
                    GivePlayerWeapon(playerid,4,0);
                    return 1;
				}
                else if(Profissao[playerid] == INSTRUTOR_COP) {
	                SetPlayerColor(playerid,COR_INSTRUTOR_COP);//Azul
	                GivePlayerWeapon(playerid,26,100);
                    GivePlayerWeapon(playerid,24,50);
                    GivePlayerWeapon(playerid,4,0);
                    return 1;
				}
                else if(Profissao[playerid] == INSTRUTOR_LADRAO) {
	                SetPlayerColor(playerid,COR_INSTRUTOR_LADRAO);//Vermelho
	                GivePlayerWeapon(playerid,26,100);
                    GivePlayerWeapon(playerid,24,50);
                    GivePlayerWeapon(playerid,4,0);
                    return 1;
				}
                else if(Profissao[playerid] == DETETIVE) {
	                SetPlayerColor(playerid,COR_DETETIVE);//Claro
	                GivePlayerWeapon(playerid,4,0);
                    GivePlayerWeapon(playerid,43,50);
                    return 1;
				}
                else if(Profissao[playerid] == EXERCITO) {
	                SetPlayerColor(playerid,COR_EXERCITO);//Verde Claro
	                GivePlayerWeapon(playerid,8,0);
                    GivePlayerWeapon(playerid,27,60);
                    GivePlayerWeapon(playerid,16,1);
                    return 1;
                }
                else if(Profissao[playerid] == JORNALISTA) {
	                SetPlayerColor(playerid,COR_JORNALISTA);//Roxo
	                GivePlayerWeapon(playerid,5,0);
                    return 1;
                }
                else if(Profissao[playerid] == ADVOGADO) {
	                SetPlayerColor(playerid,COR_ADVOGADO);//Bege
                    GivePlayerWeapon(playerid,4,0);
				    return 1;
			    }
			    else if(Profissao[playerid] == POLICIAL_NARCOTICOS) {
	                SetPlayerColor(playerid,COR_POLICIAL_NARCOTICOS);//Marfin
                    GivePlayerWeapon(playerid,4,0);
					GivePlayerWeapon(playerid,32,500);
				}
			    else if(Profissao[playerid] == MECANICO) {
	                SetPlayerColor(playerid,COR_MECANICO);//Laranja Escuro
	                GivePlayerWeapon(playerid,7,0);
	            }
			    else if(Profissao[playerid] == MEDICO) {
	                SetPlayerColor(playerid,COR_MEDICO);//Verde Claro
	                GivePlayerWeapon(playerid,4,0);
	                return 1;
                }
                else if(Profissao[playerid] == ESTADUAL) {
					SetPlayerColor(playerid, COR_ESTADUAL);//Amarelo
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == FEDERAL) {
					SetPlayerColor(playerid, COR_FEDERAL);//Vermelho
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == PREFEITO) {
					SetPlayerColor(playerid, COR_PREFEITO);//Verde Claro
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == GOVERNADOR) {
					SetPlayerColor(playerid, COR_GOVERNADOR);//Roxo
                    GivePlayerWeapon (playerid,5,0);
					return 1;
				}
				else if(Profissao[playerid] == PRESIDENTE) {
					SetPlayerColor(playerid, COR_PRESIDENTE);//Verde escuro
                    GivePlayerWeapon (playerid,5,0);
                    GivePlayerWeapon (playerid,24,10);
                    return 1;
                }
				else if(Profissao[playerid] == SEGURANCA_DE_CARROS) {
					SetPlayerColor(playerid, COR_SEGURANCA_DE_CARROS);//Azul
                    GivePlayerWeapon (playerid,32,200);
                    GivePlayerWeapon (playerid,4,0);
                    return 1;
                }
				else if(Profissao[playerid] == LADRAO_DE_CARROS) {
					SetPlayerColor(playerid, COR_LADRAO_DE_CARROS);//Laranja
                    GivePlayerWeapon (playerid,32,250);
                    return 1;
                }
				else if(Profissao[playerid] == CONFISCADOR_CARROS) {
					SetPlayerColor(playerid, COR_CONFISCADOR_CARROS);//Vermelho
                    GivePlayerWeapon (playerid,4,0);
                    GivePlayerWeapon (playerid,24,50);
                    return 1;
                }
	            else if(Profissao[playerid] == TRAFICANTE) {
                    SetPlayerColor(playerid, COR_TRAFICANTE); //Vermelho
	                GivePlayerWeapon(playerid,30,100);
	                GivePlayerWeapon(playerid,23,355);
                    return 1;
                }
	            else if(Profissao[playerid] == COP_FBI) {
                    SetPlayerColor(playerid, COR_COP_FBI); //Azul Escuro
	                GivePlayerWeapon(playerid,29,250);
	                GivePlayerWeapon(playerid,24,100);
                    return 1;
                }
	            else if(Profissao[playerid] == IBAMA) {
	                SetPlayerColor(playerid,COR_IBAMA);//Verde
                    GivePlayerWeapon(playerid,4,0);
					GivePlayerWeapon(playerid,29,250);
					return 1;
				}
	            else if(Profissao[playerid] == POLICIA_FLORESTAL) {
	                SetPlayerColor(playerid,POLICIA_FLORESTAL);//Preto
                    GivePlayerWeapon(playerid,4,0);
					GivePlayerWeapon(playerid,29,250);
					return 1;
                }
	            else if(Profissao[playerid] == CACADOR) {
	                SetPlayerColor(playerid, COR_CACADOR); //Bege
	                GivePlayerWeapon(playerid,33,100);
                }
	            else if(Profissao[playerid] == MOTORISTA_FUGA) {
	                SetPlayerColor(playerid, COR_MOTORISTA_FUGA); //
	                GivePlayerWeapon(playerid,24,100);
                }
	            else if(Profissao[playerid] == ONIBUS_VIAGEM) {
	                SetPlayerColor(playerid, COR_ONIBUS_VIAGEM); //
	                GivePlayerWeapon(playerid,6,0);
				 	return 1;
				}
                else if(Profissao[playerid] == PUTA) {
	                SetPlayerColor(playerid, COR_PUTA);//Verde Claro
                    GivePlayerWeapon(playerid,4,0);
					GivePlayerWeapon(playerid,24,100);
					return 1;
                }
	            else if(Profissao[playerid] == CAFETAO) {
	                SetPlayerColor(playerid, COR_CAFETAO);//Verde Escuro
                    GivePlayerWeapon(playerid,4,0);
					GivePlayerWeapon(playerid,23,100);
					return 1;
				}
				else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
					SetPlayerColor(playerid, COR_VENDEDOR_DE_ARMAS);//
                    GivePlayerWeapon(playerid,32,250);
                    GivePlayerWeapon(playerid,4,0);
					return 1;
				}
                else if(Profissao[playerid] == TAXISTA_AEREO) {
					SetPlayerColor(playerid, COR_TAXI_AEREO);//
					return 1;
				}
				else if(Profissao[playerid] == MOTOTAXISTA) {
					SetPlayerColor(playerid, COR_MOTOTAXISTA);//
					return 1;
				}
				else if(Profissao[playerid] == ALUGUEL_DE_CARROS) {
					SetPlayerColor(playerid, COR_ALUGUEL_DE_CARROS);//
					GivePlayerWeapon(playerid,32,250);
					return 1;
				}
                else{
	                SetPlayerColor(playerid, COR_NADA);
	            }
                PrecoCorrida[playerid] = 0;
	            SetPlayerInterior(playerid,0);
	            if(PLAYERLIST_authed[playerid] == 0){
		            SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		            SetPlayerFacingAngle(playerid, 90.0000);
		            TogglePlayerControllable(playerid, 0);
		            TogglePlayerClock(playerid,1);
    	            return 1;
            	}
           		if(udb_getPrisao(PlayerName(playerid)) == 1){
                TogglePlayerControllable(playerid, 0);
		        SetPlayerInterior(playerid, 0);
                SendClientMessage(playerid, COR_VERMELHO, "Você cometeu algum crime e por isso foi preso, você ficará 5 horas na cadeia.");
                SendClientMessage(playerid, COR_VERMELHO, "(Lembrete: Cada hora no jogo equivale a um minuto real).");
                SendClientMessage(playerid, COR_AMARELO, "Caso você queira sair da prisao mais cedo, você pode pagar a fiança (/fianca) por $1500.");
                Presos[playerid] = 1;
	            return 1;
            	}
                else{
	                TogglePlayerControllable(playerid, 1);
	                TogglePlayerClock(playerid,1);
	            }

	            return 1;
}


public OnPlayerDeath(playerid, killerid, reason)
{
	new msg[256];
    if(Qtmortes[playerid] == 2){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
    SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 4){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 6){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
    SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 8){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 10){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 12){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 14){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 16){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 18){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Qtmortes[playerid] == 20){
    SetPlayerWantedLevel(killerid,GetPlayerWantedLevel(killerid)+1);
    Procurados[killerid] = 1;
    format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(killerid),GetPlayerWantedLevel(killerid)+1);
	SendClientMessageToAll(COR_COP_ELITE, msg);
	}
	if(Procurados[playerid] == 1){
	    Procurados[playerid] = 0;
	    Presos[playerid] = 1;
		udb_setPrisao(PlayerName(playerid), 1);
		LogarPlayer(playerid);
		SetPlayerWantedLevel(playerid, 0);
	}
	if(killerid == INVALID_PLAYER_ID) {
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
        ResetPlayerMoney(playerid);
        SetPlayerWantedLevel(playerid, 0);
        Qtmortes[killerid] ++;
	}
	else{
		SendDeathMessage(killerid,playerid,reason);
		if (GetPlayerMoney(playerid) > 0)  {
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
			SetPlayerWantedLevel(playerid, 0);
			Qtmortes[killerid] ++;
		}
 	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	Petrol[vehicleid] = Petrol[vehicleid] + 1;
	if(nitro[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1010);
	nitro[vehicleid] = true;
	return 1;
    }
    if(stereo[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1086);
	stereo[vehicleid] = true;
	return 1;
    }
    if(hidraulica[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1087);
	hidraulica[vehicleid] = true;
	return 1;
    }
    if(frontalien[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1171);
	frontalien[vehicleid] = true;
	return 1;
    }
    if(spoileralien[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1147);
	spoileralien[vehicleid] = true;
	return 1;
    }
    if(wheelswitch[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1080);
	wheelswitch[vehicleid] = true;
	return 1;
    }
    if(rearalien[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1149);
	rearalien[vehicleid] = true;
	return 1;
    }
    if(sideskirtalien[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1040);
	AddVehicleComponent(vehicleid,1036);
	sideskirtalien[vehicleid] = true;
	return 1;
    }
    if(roffalien[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1038);
	roffalien[vehicleid] = true;
	return 1;
    }
    if(exhaustalien[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1038);
	exhaustalien[vehicleid] = true;
	return 1;
    }
    if(jesterroof[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1068);
	jesterroof[vehicleid] = true;
	return 1;
    }
    if(jesterside[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1069);
	AddVehicleComponent(vehicleid,1071);
	jesterside[vehicleid] = true;
	return 1;
    }
    if(jesterexhaust[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1066);
	jesterexhaust[vehicleid] = true;
	return 1;
    }
    if(jesterspoiler[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1158);
	jesterspoiler[vehicleid] = true;
	return 1;
    }
    if(jesterrear[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1159);
	jesterrear[vehicleid] = true;
	return 1;
    }
    if(jesterfront[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1160);
	jesterfront[vehicleid] = true;
	return 1;
    }
    if(wangwheals[vehicleid] == 1){
	AddVehicleComponent(vehicleid,1160);
	wangwheals[vehicleid] = true;
	return 1;
    }
    return 1;
  }


public OnVehicleDeath(vehicleid, killerid)
{
    
}
public OnPlayerText(playerid, text[])
{
    if (Mudo[playerid] == 1)
	{
	return 0;
	}
	
    fixchars(text);
	if (Calling[playerid] > -1 && Answered[playerid] == 1)
	{
    	new string[256];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(Calling[playerid], COR_CONFISCADOR_CARROS, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(playerid, COR_CONFISCADOR_CARROS, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		return 0;
	}
	printf("%s id %d enviou uma mensagem: %s",PlayerName(playerid),playerid,text);
	return 1;
}


public OnPlayerCommandText(playerid, cmdtext[])
{
    fixchars(cmdtext);
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
			SendClientMessage(playerid, COR_INSTRUTOR, "Você já esta registrado");
			return 1;
		}

		// The command shouldn't work if we already are authed
    	if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_INSTRUTOR, "Você já está registrado!");
			return 1;
		}

    	// Did he forgot the password?
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COR_INSTRUTOR, "/registrar [senha]");
			return 1;
		}

    	// We save the money to the accstate
    	else{
    	    PLAYERLIST_authed[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*senha*/,0 /*creditos*/, 0 /*grana*/,0 /*skin*/, 5000 /*gbanco*/, 0/*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 1 /*prof*/, ""/*clantag*/, -1958.9502/*X*/, 133.0608/*Y*/, 27.6875/*Z*/, 266.2009/*ang*/, 100.0 /*hp*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			new File: temp;
			new string[256];
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			SetPlayerColor(playerid, COR_DESEMPREGADO);
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SendClientMessage(playerid, COR_AMARELOB, "Registrado e logado.");
			SendClientMessage(playerid, COR_AMARELOB, "Você têm $5000 no banco para começar a viver.");
			PlayerPlaySound(playerid,1186,0.0,0.0,0.0);
            format(string, sizeof(string), "|| %s ||", PlayerName(playerid));
			temp = fopen("cadastros", io_append);
            fwrite(temp, string);
            fclose(temp);
			new msg[256];
	        format(msg,sizeof(msg),"SERVIDOR: %s acabou de se registrar.",PlayerName(playerid));
	        SendClientMessageToAll(COR_VERDED,msg);
			return 1;
		}
 	}

    if(strcmp(cmd, "/entrar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    // The command shouldn't work if an account with this
	    // nick does not exists
	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COR_COP_ELITE, "Hum, acho que você não entendeu. VOCÊ NÃO ESTÁ REGISTRADO!");
			return 1;
		}

		// The command shouldn't work if we already are authed
	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_COP_ELITE, "Logar-se duas vezes??? Impossível aqui.");
			return 1;
		}

	    // Did he forgot the password?
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COR_COP_ELITE, "Você tem senha. /entrar [senha]");
			return 1;
		}

	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
			PLAYERLIST_authed[playerid] = 1;
			PlayerPlaySound(playerid,1186,0.0,0.0,0.0);
			LogarPlayer(playerid);
			printf("O jogador %s (ID %d) acabou de se logar",PlayerName(playerid),playerid);
			SendClientMessage(playerid, COR_MEDICO, "Senha Correta");
			new msg[256];
	        format(msg,sizeof(msg),"SERVIDOR: %s acabou de se logar.",PlayerName(playerid));
	        SendClientMessageToAll(COR_VERDED,msg);
			return 1;
		}
		else {
	       // Login was incorrect
			SendClientMessage(playerid, COR_COP_ELITE, "SENHA INCORRETA!");
	    }
		return 1;
	}

	if(strcmp(cmd, "/casa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_BRANCO, "/casa [nick]");
				return 1;
			}
    		if (udb_Exists(tmp)) {
		        new Float:X, Float:Y, Float:Z;
		        new File:temp;
		        new string[256];
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(tmp, X, Y, Z);
			    udb_setAng(tmp, 0);
			    AddStaticPickup(1272,1,X,Y,Z);
	            format(string, sizeof(string), "%d %d %f %f %f //%s\r\n", 1272, 1, X, Y, Z, tmp);
	            temp = fopen("icones.rpg", io_append);
	            SetTimerEx("pickupname",1000,1,"sfff",tmp,X,Y,Z);
                fwrite(temp, string);
                fclose(temp);
			    SendClientMessage(playerid, COR_BRANCO, "Casa salva");
    	    	return 1;
    	    }
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
			return 1;
		}
	}
    if(strcmp(cmd, "/hotel", true) == 0) {
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/hotel");
				return 1;
			}
			if(GetPlayerMoney(playerid) < 2000){
			SendClientMessage(playerid, COR_BRANCO ,"Dinheiro Insuficiente para se hospedar aqui");
			return 1;
			}
    		if (udb_Exists(tmp)) {
				if(AreaHotel[playerid] == 1){
		        new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(PlayerName(playerid),X, Y, Z);
			    udb_setAng(PlayerName(playerid),0);
			    GivePlayerMoney(playerid, - 2000);
			    AreaHotel[playerid] = 1;
			    SendClientMessage(playerid, COR_BRANCO, "Voce se hospedou em um hotel prepare-se para as despesas");
    	    	return 1;
    	    }
		}
		    else{
		        SendClientMessage(playerid, COR_VERMELHO, "Voce nao esta em um Hotel");
		    	return 1;
	        	}
	}

	if (strcmp("/estacionamento", cmdtext, true, 10) == 0){
	   new j;
	   j = GetDistanceBetweenPlayers(playerid,portao1);
	   if(j < 10){
       if(Profissao[playerid] == SEGURANCA_DE_CARROS || IsPlayerAdmin(playerid)){
       TogglePlayerControllable(playerid, false);
	   ShowMenuForPlayer(menumain, playerid);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você nao possue permissao");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Chegue mais perto para abrir o estacionamento");
		   return 1;
		   }
	}
    if (strcmp("/portao", cmdtext, true, 10) == 0){
       new j;
	   j = GetDistanceBetweenPlayers(playerid,portao1);
	   if(j < 10){
       if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
       TogglePlayerControllable(playerid, false);
	   ShowMenuForPlayer(menuportao, playerid);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você nao possue permissao");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Chegue mais perto para abrir o portao");
		   return 1;
		   }
	}
	if(strcmp(cmd, "/retirar", true) == 0) {
	new tmp[256];
	tmp = strtok(cmdtext,idx);
	return 1;
	}
	if(AreaHotel[playerid] == 1){
	udb_setPosition(PlayerName(playerid),-1958.9502, 133.0608, 27.6875);
	udb_setAng(PlayerName(playerid),266.2009);
	AreaHotel[playerid] = 0;
	SendClientMessage(playerid, COR_BRANCO, "Voce se retirou do seu hotel agora estara começando no banco de SF novamente");
	return 1;
	}

	if(strcmp(cmd, "/silenciar", true) == 0) {
	    if(IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	        SendClientMessage(playerid, COR_VERMELHO, "/silenciar [id]");
	        return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
			return 1;
			}
	    	SendClientMessage(playerid, COR_AZUL, "Pronto");
	    	SendClientMessage(plid, COR_BRANCO, "Voce foi silenciado por um admin");
	    	new msg[256];
            format(msg,sizeof(msg),"%s foi silenciado.",PlayerName(plid));
	        SendClientMessageToAll(0xFFFFFAA,msg);
		    Mudo[plid] = 1;
			}
	}

	if(strcmp(cmd, "/desilenciar", true) == 0) {
	    if(IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        new msg[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
            SendClientMessage(playerid, COR_VERMELHO, "/desilenciar [id]");
	        return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
            SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
			return 1;
			}
	    	SendClientMessage(playerid, COR_AZUL, "Pronto");
            format(msg,sizeof(msg),"%s agora pode falar a vontade.",PlayerName(plid));
	        SendClientMessageToAll(0x888888AA,msg);
		    Mudo[plid] = 0;
			}
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
	   SendClientMessage(playerid, COR_BRANCO, "/sms [id] [mensagem]");
	   return 1;
	   }
	   if(GetPlayerMoney(playerid) < 5){
	   SendClientMessage(playerid, COR_VERDE, "Voce nao possue dinheiro para mandar uma SMS");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   GivePlayerMoney(playerid,0 - 5);
	   SendClientMessage(playerid, COR_BRANCO, "SMS enviada");
	   format(msg,sizeof(msg),"SMS enviada por %s.",PlayerName(playerid));
       SendClientMessage(plid,0x888888AA,msg);
       SendClientMessage(plid,0xFFFFFAAA,o);
       return 1;
       }
	}

    if(strcmp(cmd, "/bagulho", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/bagulho  [quantidade]");
				return 1;
			}
			mili = strval(tmp);
			if(mili > 15){
			    SendClientMessage(playerid, COR_VERMELHO, "Você nao carrega mais que 15 bagulhos no bolso");
				return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Entao esta tudo ok !!! Você nao pagou mas nao levou nada tambem");
				return 1;
			    }else{
			        if(AreaTrafico[playerid] == 0){
						SendClientMessage(playerid,COR_VERMELHO, "Você tem que estar na area de trafico.");
						return 1;
					} else {
			        	if(bagulho[playerid] + mili > 15){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você ja tem bagulho suficiente no bolso");
							return 1;
						} else {
					    	bagulho[playerid] = mili;
					    	GivePlayerMoney(playerid,0 - mili*25);
					    	format(msg,sizeof(msg),"Você recebeu %d bagulhos e pagou %d.",mili,mili*25);
					    	SendClientMessage(playerid,COR_BRANCO,msg);
							return 1;
						}
					}
			   }
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
    if(strcmp(cmd,"/culpado",true) == 0) {
	    if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
	    new tmp[256];
	    new plid;
	    new msg[256];
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	    SendClientMessage(playerid, COR_JUIZ, "/culpado [id]");
	    return 1;
	    }
	    if(IsPlayerConnected(plid)){
	    format(msg,sizeof(msg),"O Juiz %s declarou %s Culpado.",PlayerName(playerid),PlayerName(plid));
	    SendClientMessageToAll(COR_JUIZ, msg);
	    return 1;
	    }
    }
 }
    if(strcmp(cmd,"/locar",true) == 0) {
	   if(Profissao[playerid] == ALUGUEL_DE_CARROS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new distancia;
	   new car;
	   new tempo;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   car = GetPlayerVehicleID(playerid);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "/locar [id] [tempo]");
	   return 1;
	   }
	   tempo = strval(tmp);
	   tmp = strtok(cmdtext,idx);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "/locar [id] [tempo]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
       if(distancia < 10){
       if(IsPlayerInVehicle(playerid,carroaluguel)){
       if(PLAYERLIST_authed[playerid] == 1){
       alugueis[plid] = 1;
       SetVehicleParamsForPlayer(car,plid, 0, 0);
       Aluguel[plid] = car;
       Aluguel[plid] = 1;
       SetTimerEx("locar",60000*tempo,0,"dd",plid,car);
       return 1;
       }
    }
       else{
		  SendClientMessage(playerid, COR_BRANCO, "Voce tem que estar num carro de aluguel");
		  return 1;
		  }
       }
	   else{
		  SendClientMessage(playerid, COR_BRANCO, "Voce esta muito longe chegue mais perto");
		  return 1;
		  }
	   }
	   else{
		  SendClientMessage(playerid, COR_BRANCO, "Jogador nao conectado/logado");
		  return 1;
		  }
	   }
       else{
		  SendClientMessage(playerid, COR_BRANCO, "Voce nao tem permissao");
          return 1;
          }
	}
    if(strcmp(cmd,"/julgar",true) == 0) {
	    if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
	    new tmp[256];
	    new plid;
	    new tmx[256];
	    new msg[256];
	    strmid(tmx, cmdtext,9, strlen(cmdtext));
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)){
	    SendClientMessage(playerid, COR_JUIZ, "/julgar [id] [julgamento]");
	    return 1;
	    }
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	    SendClientMessage(playerid, COR_JUIZ, "/julgar [id] [julgamento]");
	    return 1;
	    }
	    if(IsPlayerConnected(plid)){
	    format(msg,sizeof(msg),"O Juiz %s declarou o julgamento de %s:%s",PlayerName(playerid),PlayerName(plid));
	    SendClientMessageToAll(COR_BRANCO,msg);
	    SendClientMessageToAll(COR_JUIZ,tmx);
	    return 1;
	    }
   }
 }
    if(strcmp(cmd, "/pedirprof", true) == 0) {
		 new tmp[256];
		 new plid;
		 new job;
		 new string[256];
		 tmp = strtok(cmdtext,idx);
		 plid = strval(tmp);
		 if(!strlen(tmp)){
		 SendClientMessage(playerid, COR_BRANCO, "/pedirprof [id] [id da prof]");
		 return 1;
		 }
		 tmp = strtok(cmdtext,idx);
		 job = strval(tmp);
		 if(!strlen(tmp)){
		 SendClientMessage(playerid, COR_BRANCO, "/pedirprof [id] [id da prof]");
		 return 1;
		 }
		 if(IsPlayerConnected(plid)){
		 if(IsPlayerAdmin(plid)){
         if(job > 0 && job < 70){
         format(string,sizeof(string),"%s esta pedindo profissao de %s (id: %d)",PlayerName(playerid),profname[job],job);
         SendClientMessage(playerid, COR_MEDICO, "Profissao pedida");
         SendClientMessage(plid, COR_MEDICO,string);
         return 1;
         }
         else{
			 SendClientMessage(playerid, COR_MEDICO,"Profissao Invalida");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COR_MEDICO, "Peça profissoes apenas para admins");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COR_MEDICO, "Jogador nao conectado/logado");
			 return 1;
			 }
    }
    if(strcmp(cmd, "/setskin", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/setskin [id] [amount]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setskin [id] [amount]");
				return 1;
			}
			skin = strval(tmp);
			if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
				SendClientMessage(playerid, COR_VERMELHO, "Skin ID Inválido!");
				return 1;
			}
			if(IsPlayerConnected(plid)){
			    udb_setSkin(PlayerName(plid), skin);
				SendClientMessage(playerid, COR_BRANCO, "Skin Setado.");
				SendClientMessage(plid, COR_BRANCO, "Seu skin foi comprado!");
				SetPlayerPos(plid, -1958.5107, 293.6747, 35.4688);
				LogarPlayer(plid);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
			return 1;
		}
  }

    if  (strcmp(cmdtext, "/nitro", true)==0)
     {
     if(IsPlayerAdmin(playerid)){
     new veiculo;
     veiculo = GetPlayerVehicleID(playerid);
     if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1010);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar nitro neste carro");
        nitro[veiculo] = 1;
        return 1;
        }
	 }
  }
    if  (strcmp(cmdtext, "/stereo", true)==0)
     {
     if(IsPlayerAdmin(playerid)){
     new veiculo;
     veiculo = GetPlayerVehicleID(playerid);
     if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1086);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar stereo neste carro");
        stereo[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/hidraulica", true)==0)
     {
     if(IsPlayerAdmin(playerid)){
     new veiculo;
     veiculo = GetPlayerVehicleID(playerid);
     if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1087);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar hidraulica neste carro");
        hidraulica[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/frontalien", true)==0)
     {
     if(IsPlayerAdmin(playerid)){
     new veiculo;
     veiculo = GetPlayerVehicleID(playerid);
     if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1171);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar front alien neste carro");
        frontalien[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/spoileralien", true)==0)
     {
     if(IsPlayerAdmin(playerid)){
     new veiculo;
     veiculo = GetPlayerVehicleID(playerid);
     if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1147);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar spoiler alien neste carro");
        spoileralien[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/wheelswitch", true)==0)
     {
     if(IsPlayerAdmin(playerid)){
     new veiculo;
     veiculo = GetPlayerVehicleID(playerid);
     if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1080);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar rodas switch neste carro");
        wheelswitch[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/rearalien", true)==0)
     {
     if(IsPlayerAdmin(playerid)){
      new veiculo;
      veiculo = GetPlayerVehicleID(playerid);
      if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1149);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar rear alien neste carro");
        rearalien[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/sideskirtalien", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1040);
        AddVehicleComponent(veiculo,1036);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar side skirt alien neste carro");
        sideskirtalien[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/roffalien", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1038);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar side skirt alien neste carro");
        roffalien[veiculo] = 1;
        return 1;
        }
	 }
  }


    if  (strcmp(cmdtext, "/exhaustalien", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1038);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar exhaust alien neste carro");
        exhaustalien[veiculo] = 1;
        return 1;
        }
	 }
  }


    if  (strcmp(cmdtext, "/jesterroof", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1068);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar jester roof scop neste carro");
        jesterroof[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/jesterside", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1069);
        AddVehicleComponent(veiculo,1071);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar jester side skirt neste carro");
        jesterside[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/jesterexhaust", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1066);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar jester side skirt neste carro");
        jesterexhaust[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/jesterspoiler", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1158);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar jester spoiler neste carro");
        jesterspoiler[veiculo] = 1;
        return 1;
        }
	 }
  }

    if  (strcmp(cmdtext, "/jesterrear", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1159);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar jester rear bumper neste carro");
        jesterrear[veiculo] = 1;
        return 1;
        }
	 }
  }


    if  (strcmp(cmdtext, "/jesterfront", true)==0)
     {
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1160);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar jester front bumper neste carro");
        jesterfront[veiculo] = 1;
        return 1;
        }

  }

    if  (strcmp(cmdtext, "/wangwheals", true)==0)
     {
        if(IsPlayerAdmin(playerid)){
        new veiculo;
        veiculo = GetPlayerVehicleID(playerid);
        if (IsPlayerInVehicle(playerid,veiculo))
        {
        AddVehicleComponent(veiculo,1160);
        SendClientMessage(playerid,0xFFFFFFAA,"Voce acabou de botar whang wheals neste carro");
        wangwheals[veiculo] = 1;
        return 1;
        }
	  }
    }
   
    if(strcmp(cmdtext, "/tunacoes", true) == 0) {
	    SendClientMessage(playerid,0xFFFFFFAA,"Tunaçoes de veiculos PARTE 1:");
        SendClientMessage(playerid,0xFFA500AA,"/nitro $5000");
        SendClientMessage(playerid,0xFFA500AA,"/stereo $1000");
        SendClientMessage(playerid,0xFFA500AA,"/hidraulica $10000");
        SendClientMessage(playerid,0xFFA500AA,"/frontalien $8000");
	    SendClientMessage(playerid,0xFFA500AA,"/spoileralien $6000");
        SendClientMessage(playerid,0xFFFFFFAA,"Digite /tunacoes2 para mais tunacoes");
        return 1;
	}
    if(strcmp(cmdtext, "/tunacoes2", true) == 0) {
    	SendClientMessage(playerid,0xFFFFFFAA,"Tunaçoes de veiculos PARTE 2:");
        SendClientMessage(playerid,0xFFA500AA,"/wheelswitch $3000");
        SendClientMessage(playerid,0xFFA500AA,"/rearalien $7500");
        SendClientMessage(playerid,0xFFA500AA,"/sideskirtalien $6000");
        SendClientMessage(playerid,0xFFA500AA,"/roffalien $2000");
	    SendClientMessage(playerid,0xFFA500AA,"/exhaustalien $3500");
        SendClientMessage(playerid,0xFFFFFFAA,"Digite /tunacoes3 para mais tunacoes");
        return 1;
	}
    if(strcmp(cmdtext, "/tunacoes3", true) == 0) {
	    SendClientMessage(playerid,0xFFFFFFAA,"Tunaçoes de veiculos PARTE 3:");
        SendClientMessage(playerid,0xFFA500AA,"/jesterroof $7000");
        SendClientMessage(playerid,0xFFA500AA,"/jesterside $6500");
        SendClientMessage(playerid,0xFFA500AA,"/jesterexhaust $4000");
        SendClientMessage(playerid,0xFFA500AA,"/jesterspoiler $3000");
	    SendClientMessage(playerid,0xFFA500AA,"/jesterrear $5000");
        SendClientMessage(playerid,0xFFFFFFAA,"Digite /tunacoes4 para mais tunacoes");
        return 1;
	}
    if(strcmp(cmdtext, "/tunacoes4", true) == 0) {
	    SendClientMessage(playerid,0xFFFFFFAA,"Tunaçoes de veiculos PARTE 3:");
        SendClientMessage(playerid,0xFFA500AA,"/jesterfront $6000");
        SendClientMessage(playerid,0xFFA500AA,"/wangwheals $3700");
        SendClientMessage(playerid,0xFFFFFFAA,"Aguarde mais tunaçoes para veiculos sendo feitas");
        return 1;
	}

    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COR_AZULB, "/comandos : comandos do RPG");
        SendClientMessage(playerid, COR_AZULB, "/registrar [senha] : se registra");
        SendClientMessage(playerid, COR_AZULB, "/entrar [senha] : se loga no jogo");
        SendClientMessage(playerid, COR_AZULB, "/aprender : Mostra uma breve explicação sobre o RPG.");
        SendClientMessage(playerid, COR_AZULB, "/creditos : Vê os creditos do RPG Mode");
        SendClientMessage(playerid, COR_AZULB, "/acoes : Vê as açoes do RPG Mode");
		return 1;
	}
	
	if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COR_TRAFICANTE, "[MPA]Furious RPG MODE");
	    SendClientMessage(playerid, COR_BRANCO, "Projeto inicial: SolidNuts, TheHitman, Luigui e DaMNeD");
        SendClientMessage(playerid, COR_BRANCO, "Projeto atual: [MPA]Rafael, [MPA]matraka, [MPA]Guilherme, [MPA]Rodrigo e [MPA]Texugo");
        SendClientMessage(playerid, COR_BRANCO, "Ajuda: [MPA]Mike_Jones ");
		SendClientMessage(playerid, COR_BRANCO, "Testes: [MPA]Rodrigo, [MPA]Guilherme e [MPA]Rafael ");
	    SendClientMessage(playerid, COR_BRANCO, "Idéias: [MPA]Guilherme, [MPA]Rafael, [MPA]Texugo, [NNF]JnR e [MPA]MtS ");
        SendClientMessage(playerid, COR_BRANCO, "Agradecimentos: [MPA]JouisxP, [NNF]JnR e [MPA]MtS");
        SendClientMessage(playerid, COR_MOTORISTA, "Para ajuda digite /ajuda");
		return 1;
	}
	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COR_JUIZ, "[MPA]Furious RPG Mode");
	    SendClientMessage(playerid, COR_INSTRUTOR, "Este servidor é um RPG, ou seja, simula como se fosse a vida real.");
	    SendClientMessage(playerid, COR_INSTRUTOR, "Nele você arranja um emprego para ganhar dinheiro para pode comprar sua casa, carros, etc.");
	    SendClientMessage(playerid, COR_INSTRUTOR, "Como na vida real, existem crimes, como roubo e morte, e neste mode a policia irá te prender caso você cometa algum crime.");
		SendClientMessage(playerid, COR_INSTRUTOR, "Você também só pode dirigir com habilitação (terrestre para carros e motos, naútica para barcos e a aérea para helicópteros e aviões).");
		SendClientMessage(playerid, COR_INSTRUTOR, "Caso a policia te pegue andando sem habilitação, você vai tomar uma multa e poderá até ser preso.");
		SendClientMessage(playerid, COR_INSTRUTOR, "Espero que você se divirta neste servidor.");
		SendClientMessage(playerid, COR_MOTORISTA, "Digite /ajuda ou /comandos para visualizar os comandos.");
		return 1;
    }
	if(strcmp(cmd, "/acoes", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /dance :Dançar [Style:1,2 ou 3]");
        SendClientMessage(playerid, COR_COP_ELITE, " /renderse :Levantar as Maos");
        SendClientMessage(playerid, COR_COP_ELITE, " /bebado :Voce anda bebado");
        SendClientMessage(playerid, COR_COP_ELITE, " /bomba :Planta Bomba");
        SendClientMessage(playerid, COR_COP_ELITE, " /apreensao :prender alguem com seu injetor");
        SendClientMessage(playerid, COR_COP_ELITE, " /rir : da risada");
        SendClientMessage(playerid, COR_COP_ELITE, " /lookout :lookout do roubo");
        SendClientMessage(playerid, COR_BRANCO, " digite /acoes2 para mais açoes.");
        return 1;
    }
	if(strcmp(cmd, "/acoes2", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /robar : robar um lugar");
        SendClientMessage(playerid, COR_COP_ELITE, " /punheta : bate punheta");
        SendClientMessage(playerid, COR_COP_ELITE, " /punheta2 : bate punheta");
        SendClientMessage(playerid, COR_COP_ELITE, " /coparrest : prende alguem");
        SendClientMessage(playerid, COR_COP_ELITE, " /prendido :  voce e preso");
        SendClientMessage(playerid, COR_COP_ELITE, " /ferido : voce e ferido");
        SendClientMessage(playerid, COR_COP_ELITE, " /golpeado : voce é golpeado");
        SendClientMessage(playerid, COR_BRANCO, " digite /acoes3 para mais açoes.");
        return 1;
    }
	if(strcmp(cmd, "/acoes3", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /fumar : para fumar");
        SendClientMessage(playerid, COR_COP_ELITE, " /olhar : para olhar");
        SendClientMessage(playerid, COR_COP_ELITE, " /colocar : para colocar");
        SendClientMessage(playerid, COR_COP_ELITE, " /takecover : TAKECOVER");
        SendClientMessage(playerid, COR_COP_ELITE, " /vomitar :  para vomitar");
        SendClientMessage(playerid, COR_COP_ELITE, " /comer : para comer");
        SendClientMessage(playerid, COR_COP_ELITE, " /acenar : para acenar");
        SendClientMessage(playerid, COR_BRANCO, " digite /acoes4 para mais açoes.");
        return 1;
    }
    if(strcmp(cmd, "/acoes4", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /slapass : Ass Slapping");
        SendClientMessage(playerid, COR_COP_ELITE, " /rastejar : para rastejar");
        SendClientMessage(playerid, COR_COP_ELITE, " /vdroga : para vender droga");
        SendClientMessage(playerid, COR_COP_ELITE, " /beijar : para beijar");
        SendClientMessage(playerid, COR_COP_ELITE, " /crack :  Dieing of Crack");
        SendClientMessage(playerid, COR_COP_ELITE, " /mijar : para mijar");
        SendClientMessage(playerid, COR_COP_ELITE, " /smoke : Male Smoking");
        SendClientMessage(playerid, COR_BRANCO, " digite /acoes5 para mais açoes.");
        return 1;
    }
    if(strcmp(cmd, "/acoes5", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /sentar : para sentar");
        SendClientMessage(playerid, COR_COP_ELITE, " /xingar : para xingar");
        SendClientMessage(playerid, COR_COP_ELITE, " /strip : para fazer um strip");
        SendClientMessage(playerid, COR_COP_ELITE, " /abomba1 : acoes de bomba");
        SendClientMessage(playerid, COR_COP_ELITE, " /abomba2 : acoes de bomba");
        SendClientMessage(playerid, COR_COP_ELITE, " /abomba3 : acoes de bomba");
        SendClientMessage(playerid, COR_COP_ELITE, " /abomba4 : acoes de bomba");
        SendClientMessage(playerid, COR_BRANCO, "Digite /acoes6 para mais açoes.");
        return 1;
	}
	if(strcmp(cmd, "/acoes6", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /abomba5 : acoes de bomba");
        SendClientMessage(playerid, COR_COP_ELITE, " /abomba6 : acoes de bomba");
        SendClientMessage(playerid, COR_COP_ELITE, " /animbox : acoes de BOX");
        SendClientMessage(playerid, COR_COP_ELITE, " /animball : acoes de BASEBALL");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfire : acoes de FOGO");
        SendClientMessage(playerid, COR_COP_ELITE, " /animbeach : acoes de BEACH");
        SendClientMessage(playerid, COR_COP_ELITE, " /animinf : acoes de BF_injection");
        SendClientMessage(playerid, COR_BRANCO, "Digite /acoes7 para mais açoes.");
        return 1;
	}
	if(strcmp(cmd, "/acoes7", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /animcamera : acoes de CAMERA");
        SendClientMessage(playerid, COR_COP_ELITE, " /agang : acoes de GANG");
        SendClientMessage(playerid, COR_COP_ELITE, " /animped : acoes de PED");
        SendClientMessage(playerid, COR_COP_ELITE, " /animpara : acoes de PARACHUTE");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfat : acoes de FAT");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfightb : acoes de FIGHTB");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfightc : acoes de FIGHTC");
        SendClientMessage(playerid, COR_BRANCO, "Digite /acoes8 para mais açoes.");
        return 1;
	}
	if(strcmp(cmd, "/acoes8", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, " Açoes do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfightd : acoes de FIGHTD");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfighte : acoes de FIGHTE");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfinale : acoes de FINALE");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfinale2 : acoes de FINALE2");
        SendClientMessage(playerid, COR_COP_ELITE, " /animfinalef : acoes de FINALE FIRE");
        SendClientMessage(playerid, COR_COP_ELITE, " /animflowers : acoes de FLOWERS");
        SendClientMessage(playerid, COR_COP_ELITE, " /animghands : acoes de GHANDS");
        SendClientMessage(playerid, COR_BRANCO, "Essas sao as açoes do [MPA]Furious RPG.");
        return 1;
	}
	if(strcmp(cmd, "/armas", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_AZUL, "1 Brass Knuckles $120");
		SendClientMessage(playerid, COR_AZUL, "2 Golf Club $150|| 3 Night Stick $100");
		SendClientMessage(playerid, COR_AZUL, "4 Knife $150|| 5 Baseball Bat$100");
		SendClientMessage(playerid, COR_AZUL, "6 Shovel $50 || 7 Pool cue$50");
		SendClientMessage(playerid, COR_AZUL, "8 Katana $100|| 9 Chainsaw $150");
        SendClientMessage(playerid, COR_BRANCO, "Para mais armas digite /armas2");
		return 1;
    }
    if(strcmp(cmd, "/armas2", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_VERMELHO, "10 Purple Dildo $100");
		SendClientMessage(playerid, COR_VERMELHO, "11 White Dildo $100||12 Long White Dildo $100");
		SendClientMessage(playerid, COR_VERMELHO, "13 White Dildo $100 ||14 Flowers $200");
		SendClientMessage(playerid, COR_VERMELHO, "15 Cane $400||16 Grenades $5000 ");
		SendClientMessage(playerid, COR_VERMELHO, "17 TearGas $300 ||18 Molotovs $3000");
        SendClientMessage(playerid, COR_BRANCO, "Para mais armas digite /armas3");
		return 1;
    }
    if(strcmp(cmd, "/armas3", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MOTORISTA, "22 Pistol $500");
		SendClientMessage(playerid, COR_MOTORISTA, "23 Silenced Pistol $800 || 24 Desert Eagle $700");
		SendClientMessage(playerid, COR_MOTORISTA, "25 Shotgun $1200||26 Sawn Off Shotgun $ 1300");
		SendClientMessage(playerid, COR_MOTORISTA, "27 Combat Shotgun $1700 || 28 Micro Uzi (Mac 10) $ 900");
		SendClientMessage(playerid, COR_MOTORISTA, "29 MP5 $1400|| 30 AK47 $ 1500");
        SendClientMessage(playerid, COR_BRANCO, "Para mais armas digite /armas4");
		return 1;
    }
    if(strcmp(cmd, "/armas4", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_ASSALTANTE, "31 M4 $1500 || 32 Tec9 $900");
		SendClientMessage(playerid, COR_ASSALTANTE, "33 Rifle $1200 || 34 Sniper Rifle $1000");
        SendClientMessage(playerid, COR_BRANCO, "Essas sao algumas armas do nosso mode ");
		return 1;
	}
    if(strcmp(cmd, "/novidades", true) == 0) {
		SendClientMessage(playerid, COR_DESEMPREGADO, "novidades do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Agora voce podera tambem perder suas habilitações por andar");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "com carros roubados ou sem carteira");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Se for das Carreiras /policia e /ladrao e quiser promoção pague um");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Instrutor Militar ou Ensinador do Crime para fazer seu teste");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Contrate um Detetive para investigar e lhe ajudar no tribunal");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Quebra Molas nas cidades de San Fierro e Fort Carson");
		SendClientMessage(playerid, COR_DESEMPREGADO, "Para mais novidades digite /novidades2");
		return 1;
    }
    if(strcmp(cmd, "/novidades2", true) == 0) {
		SendClientMessage(playerid, COR_DESEMPREGADO, "novidades do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Cada vez que voce for Presidente livre a cidade");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "do crime para ganhar mais votos do povo.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Voce roubou alguem ou um banco e a policia esta chegando");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "chame um motorista de fuga para fugir");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Peça a um juiz de corridas para organizar eventos mas é");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "claro que quem entrar no evento tera que pagar");
        SendClientMessage(playerid, COR_DESEMPREGADO, "Para mais novidades digite /novidades3");
		return 1;
    }
    if(strcmp(cmd, "/novidades3", true) == 0) {
		SendClientMessage(playerid, COR_DESEMPREGADO, "novidades do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Voce podera ser sequestrado e pedir resgate a policia");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "ou voce mesmo paga-lo para o sequestrador");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "voce poderá perder as habilitaçoes por um Fiscalizador de Transito");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Agora terao votaçoes politicas voce ira votar nos Bancos de SF ou LV");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Esta cansado pra viajar??? Compre uma passagem com um Onibus de Viagem");
		SendClientMessage(playerid, COR_DESEMPREGADO, "tudo isso e muito mais aqui no [MPA]Furious RPG. DIVIRTA-SE");
		return 1;
    }
    if(strcmp(cmd, "/admcmds", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/setprof [id] [id da prof]: Da profissao a alguem.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/setskin [id] [skinid] : Nao muito util pois ja tem o /comprarskin.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/silenciar : Dexa alguem mudo.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/desilenciar : Dexa alguem falar.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/matar [id] : Mata alguem.");
		SendClientMessage(playerid, COR_BRANCO, "Digite /admcmds2 para mais comandos de admin");
        return 1;
    }
    if(strcmp(cmd, "/admcmds2", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/paralisar: Paralisa um jogador.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/desparalisar : Desparalisa um jogador.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/destruir : Destroi o carro de um jogador OBS:ele tem que estar dentro dele.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/spvehicle : Spawna o carro de um jogador OBS:ele tem que estar dentro dele.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/spawnid : Spawna um jogador.");
		SendClientMessage(playerid, COR_BRANCO, "Digite /admcmds3 para mais comandos de admin");
        return 1;
    }
    if(strcmp(cmd, "/admcmds3", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/criarcarro [id do carro] : Cria um carro.");
		SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/dinheiro [id] [quantia] : Da dinheiro pra alguem.");
		SendClientMessage(playerid, COR_BRANCO, "Estes sao os comandos de admins do server");
        return 1;
    }
    if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/profs : mostra as profissoes do RPG.");
		SendClientMessage(playerid, COR_MEDICO, "/transferir : Envia dinheiro a algum jogador.");
		SendClientMessage(playerid, COR_MEDICO, "/trancar : Tranca seu carro.");
		SendClientMessage(playerid, COR_MEDICO, "/destrancar : Destranca seu carro.");
		SendClientMessage(playerid, COR_MEDICO, "/documentos [id] : Mostra seus documentos.");
		SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos2");
        return 1;
    }
    if(strcmp(cmd, "/comandos2", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/relogio : Mostra o horário em SF.");
		SendClientMessage(playerid, COR_MEDICO, "/profissao : Comandos de sua profissão.");
		SendClientMessage(playerid, COR_MEDICO, "/taxi [lugar] : Chama um taxi.");
		SendClientMessage(playerid, COR_MEDICO, "/banco : Comandos do Banco.");
		SendClientMessage(playerid, COR_MEDICO, "/abastecer [litros] : Compra gasolina (você deve estar no posto para usar este comando).");
        SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos3");
		return 1;
	}
	if(strcmp(cmd, "/comandos3", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(playerid, COR_MEDICO, "/presos : Vê a lista de pessoas presas.");
		SendClientMessage(playerid, COR_MEDICO, "/procurados : Vê a lista de procurados pela policia");
		SendClientMessage(playerid, COR_MEDICO, "/pescar : Joga a rede pra pescar, você deve estar na área de pesca.");
		SendClientMessage(playerid, COR_MEDICO, "/say [texto] : Manda mensagem para pessoas proximas a você.");
        SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos4");
		return 1;
    }
    if(strcmp(cmd, "/comandos4", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/armas : Ve a lista de armas.");
        SendClientMessage(playerid, COR_MEDICO, "/diskdroga [local] : Pedir droga.");
        SendClientMessage(playerid, COR_MEDICO, "/acoes : Ve a lista de ações.");
        SendClientMessage(playerid, COR_MEDICO, "/comprarskin [id do skin] : Muda seu skin(personagem) por $50.");
        SendClientMessage(playerid, COR_MEDICO, "/bombeiro [local] : Chamar Bombeiro para o local.");
        SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos5");
		return 1;
	}
	if(strcmp(cmd, "/comandos5", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/esmola [id]:  : Para pedir esmola.");
		SendClientMessage(playerid, COR_MEDICO, "/gorjeta [id] : Para pedir gorjeta.");
		SendClientMessage(playerid, COR_MEDICO, "/aumento [id] : Para pedir aumento.");
		SendClientMessage(playerid, COR_MEDICO, "/mostrarpassagem [id] : Para mostrar passagem");
		SendClientMessage(playerid, COR_MEDICO, "/ddroga [local]: Denunciar trafico de droga.");
		SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos6");
        return 1;
    }
	if(strcmp(cmd, "/comandos6", true) == 0) {
        SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
        SendClientMessage(playerid, COR_MEDICO, "/dcaca [local] : Denunciar caça.");
        SendClientMessage(playerid, COR_MEDICO, "/dpesca [local] : Denunciar pesca.");
        SendClientMessage(playerid, COR_MEDICO, "/pputa [local] : Pedir puta.");
        SendClientMessage(playerid, COR_MEDICO, "/diskpassagem [local] : Pedir passagem.");
		SendClientMessage(playerid, COR_MEDICO, "/diskarma [local]:  : Pedir arma.");
		SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos7");
		return 1;
	}
	if(strcmp(cmd, "/comandos7", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/192 [local] : Chamar médico.");
		SendClientMessage(playerid, COR_MEDICO, "/darma [local] : Denunciar Trafico de Armas");
		SendClientMessage(playerid, COR_MEDICO, "/ligar [id] : Ligar do celular pra alguem");
		SendClientMessage(playerid, COR_MEDICO, "/atender : Para atender o celular");
		SendClientMessage(playerid, COR_MEDICO, "/desligar : Para desligar o celular");
		SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos8");
        return 1;
    }
    if(strcmp(cmd, "/comandos8", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/veiculos : Ve a lista de veiculos.");
		SendClientMessage(playerid, COR_MEDICO, "/tunacoes : Ve a lista de tunaçoes.");
		SendClientMessage(playerid, COR_MEDICO, "/carona : Para pedir carona.");
		SendClientMessage(playerid, COR_MEDICO, "/sms [id] [mensagem] : Manda uma SMS para algum jogador por $5.");
        SendClientMessage(playerid, COR_MEDICO, "/admcmds : Ve os comandos de admins do server.");
		SendClientMessage(playerid, COR_BRANCO, "Para mais comandos digite /comandos9");
        return 1;
    }
    if(strcmp(cmd, "/comandos9", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MEDICO, "/buygalao : Compra um galao.");
		SendClientMessage(playerid, COR_MEDICO, "/colocar : Coloca a gasolina que há no galão.");
		SendClientMessage(playerid, COR_MEDICO, "/pedirprof [id] [profissao] : Pede profissao a um admin do server.");
		SendClientMessage(playerid, COR_BRANCO, "Esses sao os comandos do [MPA]Furious RPG");
        return 1;
    }
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COR_AZUL, "Comandos do Banco");
        SendClientMessage(playerid, COR_BRANCO, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COR_BRANCO, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COR_BRANCO, "/extrato : checa seu o saldo bancário..");
        SendClientMessage(playerid, COR_BRANCO, "/extratocell : checa seu o saldo bancário através do seu celular, custo $20.");
        SendClientMessage(playerid, COR_BRANCO, "Você precisa estar em um banco para usar esses comandos, menos o /bscell.");
        SendClientMessage(playerid, COR_BRANCO, "Bancos: Hotel, Car Shop, SF Train Station e SA Federal Mint,Forst Caston e Las Venturas.");
		return 1;
	}
	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Profissões do [MPA]Furious RPG:");
        SendClientMessage(playerid, COR_DESEMPREGADO, "1 - Desempregado (Salário: $350)");
        SendClientMessage(playerid, COR_TAXISTA, "2 - Taxista (Salário: $900)");
        SendClientMessage(playerid, COR_VENDEDOR, "3 - Vendedor de carros (Salário: $600 + os carros que vende) Limitada");
        SendClientMessage(playerid, COR_CORRETOR, "4 - Corretor de Imoveis (Salário: $600 + as casas que vende) Limitada");
        SendClientMessage(playerid, COR_BARMAN, "6 - Barman (Salário: $800 + as bebidas que vende)");
        SendClientMessage(playerid, COR_JUIZ, "7 - Juiz (Salário: $2000 - Mensalão) Limitada");
		SendClientMessage(playerid, COR_VERDEB, "Digite /profs2 para mais profissoes)");
		return 1;
	}

    if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Profissões do [MPA]Furious RPG:");
		SendClientMessage(playerid, COR_SEGURANCA, "8 - Seguranca(Salario:$1000)");
        SendClientMessage(playerid, COR_MOTORISTA, "9 - Motorista Particular(Salario:$1000)");
        SendClientMessage(playerid, COR_DETETIVE, "13 - Detetive(Salario:$2000 + Serviços) Limitada");
        SendClientMessage(playerid, COR_PESCADOR, "14 - Pescador(Salario:$800 + o que ganha na pesca)");
        SendClientMessage(playerid, COR_INSTRUTOR, "15 - Instrutor de Direçao(Salario:$600 + Carteiras) Limitada");
        SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "17 - Motorista de Onibus (Salario:$900)");
        SendClientMessage(playerid, COR_JUIZ_DE_CORRIDA, "20 - Juiz de Corrida (Salario:$2000 + Eventos) Limitada");
		SendClientMessage(playerid, COR_VERDEB, "Digite /profs3 para mais profissoes)");
	    return 1;
	}

    if(strcmp(cmd, "/profs3", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Profissões do [MPA]Furious RPG:");
		SendClientMessage(playerid, COR_BOMBEIRO, "21 - Bombeiro (Salario:$1500)");
		SendClientMessage(playerid, COR_INSTRUTOR_LADRAO, "23 - Ensinador do Crime (Salario:$1000 + Testes) Limitada");
        SendClientMessage(playerid, COR_INSTRUTOR_COP, "24 - Instrutor Militar (Salario:$1000 + Testes) Limitada");
        SendClientMessage(playerid, COR_JORNALISTA, "26 - Jornalista (Salario:$1200) Limitada");
        SendClientMessage(playerid, COR_ADVOGADO, "27 - Advogado (Salario:$1500 + honorarios)");
        SendClientMessage(playerid, COR_MEDICO, "28 - Medico (Salario:$800 + o que vender)");
        SendClientMessage(playerid, COR_MECANICO, "30 - Mecanico (Salario:$800 + Gasolina,Consertos e Pintura)");
		SendClientMessage(playerid, COR_VERDEB, "Digite /profs4 para mais profissoes");
		return 1;
    }

    if(strcmp(cmd, "/profs4", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Profissões do [MPA]Furious RPG:");
		SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "36 - Segurança de Carros (Salario:$1000 + Serviços)");
        SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "37 - Ladrão de Carros (Salario:$700 + Carros que roubar) Limitada");
        SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "38 - Fiscalizador de Transito(Salario:$1000 + Fiscalizaçoes) Limitada");
        SendClientMessage(playerid, COR_TRAFICANTE, "39 - Traficante (Salario:$1200 + as drogas que vender) Limitada");
        SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "41 - Policia Florestal (Salario:$2500) Limitada");
        SendClientMessage(playerid, COR_IBAMA, "42 - IBAMA (Salario:$2500) Limitada");
        SendClientMessage(playerid, COR_CACADOR, "43 - Caçador (Salario:$1000 + Caças)");
		SendClientMessage(playerid, COR_VERDEB, "Digite /profs5 para mais profissoes");
	    return 1;
    }

    if(strcmp(cmd, "/profs5", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Profissões do [MPA]Furious RPG:");
        SendClientMessage(playerid, COR_MOTORISTA_FUGA, "44 - Motorista de Fuga (Salario:$900)");
        SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "45 - Onibus de Viagem (Salario:$1100 + Viagens) Limitada");
        SendClientMessage(playerid, COR_PUTA, "46 - Puta (Salario:$3000 + Trepadas) Limitada");
        SendClientMessage(playerid, COR_CAFETAO, "47 - Cafetão (Salario:$3000) Limitada");
        SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "48 - Vendedor de Armas (Salario:$800 + a venda de armas) Limitada");
        SendClientMessage(playerid, COR_TAXI_AEREO, "49 - Taxista Aereo (Salario:$1000 + Passageiros)");
        SendClientMessage(playerid, COR_MOTOTAXISTA, "50 - MotoTaxista (Salario:$1000 + Passageiros)");
		SendClientMessage(playerid, COR_VERDEB, "Digite /profs6 para mais profissoes");
		return 1;
    }
    if(strcmp(cmd, "/profs6", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Profissões do [MPA]Furious RPG:");
        SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "51 - Locador de Carros (Salario:$1500 + Alugueis de veiculos)");
		SendClientMessage(playerid, COR_VERDEB, "Para mais profissoes digite /policia /ladrao e /politica");
		return 1;
    }
	if(strcmp(cmd, "/ladrao", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Carreira Criminal do [MPA]Furious");
		SendClientMessage(playerid, COR_ASSASSINO, "5 - Assassino (Salário: $500 + o dinheiro de quem matar) Limitada");
		SendClientMessage(playerid, COR_LADRAO, "16 - Ladrao(Salario:$1200) Limitada");
        SendClientMessage(playerid, COR_ASSALTANTE, "18 - Assaltante(Salario:$2000) Limitada");
        SendClientMessage(playerid, COR_MESTRE_DO_ROUBO, "19 - Mestre do Roubo(Salario:$3000) Limitada");
        SendClientMessage(playerid, COR_GENIO_DO_CRIME, "22 - Genio do Crime(Salario:$5000) Limitada");
        SendClientMessage(playerid, COR_VERDEB, "Para ser promovido peça a um Instrutor Criminal para fazer o teste");
	    return 1;
    }

	if(strcmp(cmd, "/policia", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Carreira Policial do [MPA]Furious");
		SendClientMessage(playerid, COR_COP_CIVIL, "10 - Policia Civil(Salario:$1200) Limitada");
        SendClientMessage(playerid, COR_COP_RODOVIARIO, "11 - Policia Rodoviaria(Salario:$2000) Limitada");
        SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS,"12 - Policial Narcoticos(Salario:$2500) Limitada");
        SendClientMessage(playerid, COR_COP_ELITE, "25 - SWAT(Salario:$3000) Limitada");
        SendClientMessage(playerid, COR_COP_FBI, "29 - FBI(Salario:$4500) Limitada");
		SendClientMessage(playerid, COR_EXERCITO, "40 - Exercito(Salario:$8000) Limitada");
		SendClientMessage(playerid, COR_VERDEB, "Para ser promovido peça a um Instrutor Militar para fazer o teste");
		return 1;
	}

    if(strcmp(cmd, "/politica", true) == 0) {
        SendClientMessage(playerid, COR_VERDEB, "Carreira Politica do [MPA]Furious");
		SendClientMessage(playerid, COR_ESTADUAL, "31 - Deputado Estadual (Salário: $2000) Limitada");
        SendClientMessage(playerid, COR_FEDERAL, "32 - Deputado Federal (Salário: $2500) Limitada");
        SendClientMessage(playerid, COR_PREFEITO, "33 - Prefeito (Salário: $4000) Limitada");
        SendClientMessage(playerid, COR_GOVERNADOR, "34 - Governador (Salário: $6000) Limitada");
        SendClientMessage(playerid, COR_PRESIDENTE, "35 - Presidente (Salário: $8000) Limitada");
        SendClientMessage(playerid, COR_VERDEB, "Para ser promovido Trabalhe bem e ganhe a confiança do povo");
		return 1;
    }
    if(strcmp(cmdtext, "/veiculos", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Preços dos carros:");
	    SendClientMessage(playerid,COR_AMARELOB,"Carros pesados:  /carros1");
        SendClientMessage(playerid,COR_AMARELOB,"Carros de Luxo de 2 portas:  /carros2");
        SendClientMessage(playerid,COR_AMARELOB,"Carros de luxo de 4 portas:  /carros3");
	  	SendClientMessage(playerid,COR_AMARELOB,"Muscle cars:  /carros4");
	  	SendClientMessage(playerid,COR_AMARELOB,"Carros de rua:  /carros5");
	  	SendClientMessage(playerid,COR_AMARELOB,"Carros de alta performance:  /carros6");
	  	SendClientMessage(playerid,COR_AMARELOB,"Caminhões:  /carros7");
	  	SendClientMessage(playerid,COR_VERDEB,"Para mais Carros digite /veiculos2");
	    return 1;
	}
    if(strcmp(cmdtext, "/veiculos2", true) == 0) {
	    SendClientMessage(playerid,COR_AMARELOB,"Lowriders:  /carros8");
        SendClientMessage(playerid,COR_AMARELOB,"Recreacionais:  /carros9");
        SendClientMessage(playerid,COR_AMARELOB,"Motos:  /carros10");
        SendClientMessage(playerid,COR_AMARELOB,"Carros publicos:  /carros11");
        SendClientMessage(playerid,COR_AMARELOB,"Carros do Governo:  /carros12");
	  	SendClientMessage(playerid,COR_AMARELOB,"Veiculos Aéreos:  /carros13");
	  	SendClientMessage(playerid,COR_AMARELOB,"Veiculos Navais:  /carros14");
	  	SendClientMessage(playerid,COR_VERDEB,"Estes sao os veiculos do [MPA]Furious RPG mode");
        return 1;
	}
    if(strcmp(cmdtext, "/carros1", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Carros pesados:");
	    SendClientMessage(playerid,COR_AMARELOB,"400 - Landstalker $10000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros2", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Carros de Luxo de 2 portas:");
	    SendClientMessage(playerid,COR_AMARELOB,"602 - Alpha $22000");
        SendClientMessage(playerid,COR_AMARELOB,"496 - Blista Compact $12000");
        SendClientMessage(playerid,COR_AMARELOB,"410 - Manana $6000");
        SendClientMessage(playerid,COR_AMARELOB,"517 - Majestic $29000");
        SendClientMessage(playerid,COR_AMARELOB,"439 - Stallion $24000");
    	SendClientMessage(playerid,COR_AMARELOB,"587 - Euros $32000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros3", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Carros de Luxo de 4 portas:");
	    SendClientMessage(playerid,COR_AMARELOB,"445 - Admiral $17000");
        SendClientMessage(playerid,COR_AMARELOB,"405 - Sentinel $23000");
        SendClientMessage(playerid,COR_AMARELOB,"409 - Stretch $60000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros4", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Muscle cars:");
	    SendClientMessage(playerid,COR_AMARELOB,"402 - Buffalo $35000");
        SendClientMessage(playerid,COR_AMARELOB,"603 - Phoenix $52000");
        SendClientMessage(playerid,COR_AMARELOB,"475 - Sabre $10000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros5", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Carros de rua:");
        SendClientMessage(playerid,COR_AMARELOB,"559 - Jester $50000");
        SendClientMessage(playerid,COR_AMARELOB,"560 - Sultan $42000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros6", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Carros de alta performance:");
        SendClientMessage(playerid,COR_AMARELOB,"541 - Bullet $45000");
        SendClientMessage(playerid,COR_AMARELOB,"415 - Cheetah $74000");
        SendClientMessage(playerid,COR_AMARELOB,"480 - Comet $65000");
        SendClientMessage(playerid,COR_AMARELOB,"434 - Hotknife $60000");
	  	SendClientMessage(playerid,COR_AMARELOB,"411 - Infernus $90000");
	  	SendClientMessage(playerid,COR_AMARELOB,"451 - Turismo $83000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros7", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Caminhões:");
        SendClientMessage(playerid,COR_AMARELOB,"515 - RoadTrain $43000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros8", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Lowriders:");
        SendClientMessage(playerid,COR_AMARELOB,"536 - Blade $25000");
        SendClientMessage(playerid,COR_AMARELOB,"534 - Remington $26000");
        SendClientMessage(playerid,COR_AMARELOB,"535 - Slamvan $30000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros9", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Recreacionais:");
        SendClientMessage(playerid,COR_AMARELOB,"424 - BF Injection $18000");
        SendClientMessage(playerid,COR_AMARELOB,"444 - Monster $40000");
        SendClientMessage(playerid,COR_AMARELOB,"471 - Quad $6000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros10", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Motos:");
        SendClientMessage(playerid,COR_AMARELOB,"461 - PCJ-600 $10000");
        SendClientMessage(playerid,COR_AMARELOB,"521 - FCR-900 $20000");
        SendClientMessage(playerid,COR_AMARELOB,"463 - Freeway $12000");
        SendClientMessage(playerid,COR_AMARELOB,"468 - Sanchez $10000");
	  	SendClientMessage(playerid,COR_AMARELOB,"462 - Faggio $5000");
	  	SendClientMessage(playerid,COR_AMARELOB,"522 - NRG-500 $30000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros11", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Carros públicos:");
        SendClientMessage(playerid,COR_AMARELOB,"420 - Taxi $10000");
	  	SendClientMessage(playerid,COR_AMARELOB,"437 - Coach $15000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros12", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Carros do Governo:");
        SendClientMessage(playerid,COR_AMARELOB,"433 - Barracks $30000");
        SendClientMessage(playerid,COR_AMARELOB,"523 - HPV-1000 $10000");
        SendClientMessage(playerid,COR_AMARELOB,"470 - Patriot $60000");
        SendClientMessage(playerid,COR_AMARELOB,"596 - Police $10000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros13", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Veiculos Aéreos:");
        SendClientMessage(playerid,COR_AMARELOB,"425 - Hunter $130000");
        SendClientMessage(playerid,COR_AMARELOB,"487 - Maverick $70000");
        SendClientMessage(playerid,COR_AMARELOB,"497 - Police Maverick $75000");
        SendClientMessage(playerid,COR_AMARELOB,"593 - Dodo $80000");
	  	SendClientMessage(playerid,COR_AMARELOB,"519 - Shamal $132000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros14", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Veiculos Navais:");
        SendClientMessage(playerid,COR_AMARELOB,"453 Reefer - $40000");
	  	SendClientMessage(playerid,COR_AMARELOB,"493 - Jetmax $40000");
	  	SendClientMessage(playerid,COR_AMARELOB,"473 - Dinghy $50000");
        return 1;
	}


	if (strcmp(cmd, "/taxi", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/taxi [aonde]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_AMARELO, "Os taxistas foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TAXISTA){
					format(string, sizeof(string), "%s pede um taxi. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_AMARELO, string);
		        }
			}
			return 1;
		}
	}
	if(strcmp(cmd, "/examead", true) == 0) {
	    if(Profissao[playerid] == POLICIAL_NARCOTICOS || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid,COR_VERMELHO,"/examead [id]");
				return 1;
			}
			plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
			        SendClientMessage(playerid,COR_VERMELHO,"Você está muito longe, chegue mais perto!");
					return 1;
				} else {
				    SendClientMessage(playerid,COR_AMARELO,"Resultados do exame anti-dopping:");
				    format(msg, sizeof(msg), "Heroina : %d doses",Heroina[plid]);
				    SendClientMessage(playerid,COR_BRANCO,msg);
				    format(msg, sizeof(msg), "Maconha : %d doses",Maconha[plid]);
				    SendClientMessage(playerid,COR_BRANCO,msg);
				    format(msg, sizeof(msg), "Cocaína : %d doses",Cocaina[plid]);
				    SendClientMessage(playerid,COR_BRANCO,msg);
				    format(msg, sizeof(msg), "Crack : %d doses",crack[plid]);
				    SendClientMessage(playerid,COR_BRANCO,msg);
				    SendClientMessage(playerid,COR_COP_ELITE,"Exame anti-dopping concluído!");
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
			}
			return 1;
		} else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		}
		return 1;
	}
	if (strcmp(cmd, "/190", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/190 [denuncia]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_COP_ELITE, "Os policiais foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}
	
	if(strcmp(cmdtext, "/disfarcar", true)==0){
	   new tmp[256];
	   if(Profissao[playerid] == DETETIVE){
	   tmp = strtok(cmdtext,idx);
	   SetPlayerColor(playerid, COR_BRANCO);
	   GivePlayerMoney(playerid,0-100);
	   SendClientMessage(playerid, COR_BRANCO, "Voce se disfarçou e pagou $100 pelo seu disfarçe");
	   return 1;
   	   }
	   else{
	   SendClientMessage(playerid, COR_JUIZ, "Voce nao é detetive");
	   return 1;
	   }
    }
	if(strcmp(cmdtext, "/revelar", true)==0){
	   if(Profissao[playerid] == DETETIVE){
	   SetPlayerColor(playerid, COR_DETETIVE);
	   SendClientMessage(playerid, COR_BRANCO, "Voce revelou seu disfarce e jogou fora o resto de tempo que voce tinha");
	   return 1;
	   }
	   else{
	   SendClientMessage(playerid, COR_JUIZ, "Voce nao é detetive");
	   return 1;
	   }
	}
    if(strcmp(cmdtext, "/confiscar", true)==0){
	   if(Profissao[playerid] == CONFISCADOR_CARROS){
			new tmp[256];
			new plid;
			new distancia;
			distancia = GetDistanceBetweenPlayers(playerid,plid);
			tmp = strtok(cmdtext,idx);
			plid = strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/confiscar [id]");
			return 1;
			}
			if(distancia > 10){
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "Chegue mais perto para confiscar um carro");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			if(IsPlayerInAnyVehicle(plid)){
			SetVehicleParamsForPlayer(GetPlayerVehicleID(plid),plid, 0, 1);
			RemovePlayerFromVehicle(plid);
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "Carro confiscado");
			SendClientMessage(plid, COR_CONFISCADOR_CARROS, "Seu carro foi confiscado por um Fiscalizador de transito");
			return 1;
			}
		  }
		    else{
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo nenhum veiculo!");
			    return 1;
		}
	}
 }

	if (strcmp(cmdtext, "/liberar", true)==0){
      if(Profissao[playerid] == CONFISCADOR_CARROS){
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
				}
			}
			SendClientMessage(playerid, COR_BRANCO, "Veículo liberado");
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo nenhum veiculo!");
			return 1;
		    }
	    }
    }
    if (strcmp("/comunicar", cmdtext, true, 10) == 0){
          if(Profissao[playerid] == PRESIDENTE || IsPlayerAdmin(playerid)){
			 new tmp[256];
			 new string[256];
			 tmp = strtok(cmdtext,idx);
			 strmid(tmp,cmdtext, 10, strlen(cmdtext));
			 if(!strlen(tmp)){
			 SendClientMessage(playerid, COR_PRESIDENTE, "/comunicar [mensagem]");
			 return 1;
			 }
			 format(string,sizeof(string),"O Presidente %s faz um comunicado ao povo",PlayerName(playerid));
			 SendClientMessageToAll(COR_GOVERNADOR,string);
			 SendClientMessageToAll(COR_PRESIDENTE,tmp);
			 return 1;
			 }
			 else{
				 SendClientMessage(playerid, COR_PRESIDENTE, "Voce nao tem permissao");
				 return 1;
				 }
    }
	if(strcmp(cmd, "/cone", true) == 0) {
        if(Profissao[playerid] == COP_RODOVIARIO) {
            new Float:X, Float:Y, Float:Z;
            GetPlayerPos(playerid,X, Y,Z);
			CreateObject(1238,X, Y,Z -200, 0, 0, 0);
            SendClientMessage(playerid, COR_COP_RODOVIARIO, "Voce adicionou um cone neste local");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "Voce nao é Policial Rodoviario");
            return 1;
		}
	}
	if(strcmp(cmd, "/barreira", true) == 0) {
	  if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_FBI || Profissao[playerid] == COP_ELITE || Profissao[playerid] == EXERCITO){
	  new tmp[256];
	  new Float:X,Float:Y,Float:Z;
	  tmp = strtok(cmdtext,idx);
	  GetPlayerPos(playerid,X,Y,Z);
	  CreateObject(1228,X,Y,Z,0,0,0);
	  SendClientMessage(playerid, COR_COP_ELITE, "Barreira Criada");
	  return 1;
	  }
	}
	if(strcmp(cmd, "/criarcarro", true) == 0) {
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new car;
			tmp = strtok(cmdtext,idx);
			car = strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "/criarcarro [id do carro]");
			return 1;
			}
			if(car > 399 && car < 611){
            new Float:X, Float:Y, Float:Z;
            GetPlayerPos(playerid,X, Y,Z);
			CreateVehicle(car,X + 2.5, Y, Z + 1.0,0,0,0,false);
            SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "Veiculo criado");
            printf("Admin %s criou um carro (id: %d )",PlayerName(playerid),car);
			return 1;
			}
			else{
			SendClientMessage(playerid, COR_JUIZ, "Carro Invalido");
			return 1;
			}
		 }
         else{
			SendClientMessage(playerid, COR_JUIZ, "Voce nao tem permissao");
			return 1;
			}
	  }
   
   
    if(strcmp(cmd, "/desprender", true) == 0) {
	    if(Profissao[playerid] == GENIO_DO_CRIME){
		    new tmp[256];
		    new plid;
            new distancia;
        	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_GENIO_DO_CRIME, "/desprender [id]");
			return 1;
			}
            if(distancia > 10){
            SendClientMessage(playerid, COR_GENIO_DO_CRIME, "Você está muito longe, chegue mais perto!");
        	return 1;
			}
			if(Presos[playerid] == 1){
			SendClientMessage(playerid, COR_GENIO_DO_CRIME, "Você nao pode soltar alguem enquanto estiver preso");
			return 1;
			}
            plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
		    Presos[plid] = 0;
            udb_setPrisao(PlayerName(plid), 0);
		    LogarPlayer(plid);
		    SendClientMessage(playerid, COR_GENIO_DO_CRIME, "Jogador solto agora fuja antes que os policias cheguem");
		    SendClientMessage(plid, COR_GENIO_DO_CRIME, "Um Genio do Crime lhe tirou da prisao");
			return 1;
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
				return 1;
			}
		}
   }
    
    if (strcmp(cmd, "/infoputa", true)==0){
   	    if(Profissao[playerid] == CAFETAO){
		    new tmp[256];
		    new string[256];
		    new dinheiro;
		    strmid(tmp,cmdtext, 9, strlen(cmdtext));
		    if(!strlen(tmp)) {
		    SendClientMessage(playerid, COR_CAFETAO, "/infoputa [local] [valor]");
		    return 1;
		    }
		    dinheiro = strval(tmp);
		    if(!strlen(tmp)){
		    SendClientMessage(playerid, COR_CAFETAO, "/infoputa [local] [valor]");
		    return 1;
		    }
		    else{
		    SendClientMessage(playerid, COR_CAFETAO, "As Putas foram informadas");
		    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == PUTA) {
		    format(string,sizeof(string), "%s Quer alguma puta em %s,oferecendo:$%d", PlayerName(playerid),tmp,dinheiro);
		    SendClientMessage(i,COR_BOMBEIRO,string);
		    return 1;
	        }
     	   }
     	 }
       }
    }
    if (strcmp(cmd, "/chamarbombeiros", true)==0){
	    	if(Profissao[playerid] == BOMBEIRO){
		    new tmp[256];
		    new string[256];
		    strmid(tmp,cmdtext, 9, strlen(cmdtext));
		    if(!strlen(tmp)) {
		    SendClientMessage(playerid, COR_BOMBEIRO, "/chamarbombeiros [local]");
		    return 1;
		    }
            else{
		    SendClientMessage(playerid, COR_BOMBEIRO, "Os outros bombeiros foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == BOMBEIRO) {
		    format(string,sizeof(string), "%s Esta pedindo mais bombeiros para ajuda-lo Local:%d", PlayerName(playerid),tmp);
		    SendClientMessage(i,COR_BOMBEIRO,string);
		    return 1;
		 }
	   }
	  }
	}
  }
    if (strcmp(cmd, "/bombeiro", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 9, strlen(cmdtext));
		 if(!strlen(tmp)) {
		    SendClientMessage(playerid, COR_BOMBEIRO, "/bombeiro [local]");
		    return 1;
		    }
         else{
		 SendClientMessage(playerid, COR_COP_ELITE, "Os Bombeiros foram informados");
		 for(new i=0; i<MAX_PLAYERS; i++){
		 if(Profissao[i] == BOMBEIRO) {
		 format(string,sizeof(string), "%s Ligou o alarme de incendio em %s", PlayerName(playerid),tmp);
		 SendClientMessage(i,COR_BOMBEIRO,string);
		 return 1;
		 }
         
	   }
	  }
	}
	if (strcmp(cmd, "/trazer", true)==0){
	 if(IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COR_BRANCO, "/trazer [id]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
	  new Float:X ,Float:Y ,Float:Z;
	  GetPlayerPos(playerid, X, Y, Z);
	  SetPlayerPos(plid,X,Y,Z);
	  SendClientMessage(playerid, COR_BRANCO, "Voce trouxe alguem");
	  SendClientMessage(plid, COR_BRANCO, "Um admin lhe levou até ele");
	  return 1;
      }
      else{
          SendClientMessage(playerid, COR_BRANCO, "Jogador nao conectado/logado");
          return 1;
          }
	 }
	 else{
         SendClientMessage(playerid, COR_BRANCO, "Voce nao tem permissão");
         return 1;
         }
     }
    
    if (strcmp(cmd, "/ir", true)==0){
	 if(IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COR_BRANCO, "/ir [id]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
	  new Float:X ,Float:Y ,Float:Z;
	  GetPlayerPos(plid, X, Y, Z);
	  SetPlayerPos(playerid,X,Y,Z);
	  SendClientMessage(playerid, COR_BRANCO, "Voce foi ate alguem");
	  SendClientMessage(plid, COR_BRANCO, "Um admin foi ate voce");
	  return 1;
      }
      else{
          SendClientMessage(playerid, COR_BRANCO, "Jogador nao conectado/logado");
          return 1;
          }
	 }
	 else{
         SendClientMessage(playerid, COR_BRANCO, "Voce nao tem permissão");
         return 1;
         }
     }
   
    if (strcmp(cmd, "/diskdroga", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 10, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/diskdroga [local]");
		 return 1;
		 }
	 	 else{
		    SendClientMessage(playerid, COR_COP_ELITE, "Os Traficantes foram informados");
            for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == TRAFICANTE) {
		    format(string,sizeof(string), "%s Pediu droga. Local: %s", PlayerName(playerid),tmp);
		    SendClientMessage(i,COR_BOMBEIRO,string);
		    return 1;
            }
	     }
            return 1;
	  }
	}

    if (strcmp(cmd, "/contagem", true)==0){
	   if(Profissao[playerid] == JUIZ_DE_CORRIDA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new string[256];
	   tmp = strtok(cmdtext,idx);
	   for(new i=0; i<MAX_PLAYERS; i++){
       format(string,sizeof(string), "Contagem feita por %s", PlayerName(playerid));
       SendClientMessage(i,COR_JUIZ_DE_CORRIDA,string);
       GameTextForAll("~y~5",2000,6);
       SetTimer("contagem",1000,false);
       return 1;
       }
	  }
	   return 1;
	}
    if (strcmp(cmd, "/darma", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 6, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/darma [local]");
		 return 1;
		 }
	 	 else{
           SendClientMessage(playerid, COR_COP_ELITE, "Os narcoticos foram informados");
           for(new i=0; i<MAX_PLAYERS; i++){
		   if(Profissao[i] == POLICIAL_NARCOTICOS) {
		   format(string,sizeof(string), "%s Percebeu Trafico de armas. Local: %s", PlayerName(playerid),tmp);
	       SendClientMessage(i,COR_BOMBEIRO,string);
	       return 1;
		 }
	  }
	       return 1;
	  }
	}
	if(strcmp(cmd, "/ligar", true) == 0)
		{
		new tmp[256];
		new plid;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_BRANCO, "/ligar [id]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COR_VERMELHO, "Voce deve estar logado para ligar");
			return 1;
		}
		if (GetPlayerMoney(playerid) < CallCost)
		{
			SendClientMessage(playerid, COR_VERMELHO, "Voce não tem dinheiro para uma ligação");
			return 1;
		}
		
		if (giveplayerid == playerid)
		{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não pode ligar para voce mesmo");
		    return 1;
		}
		if (!(IsPlayerConnected(giveplayerid)))
		{
		    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
		    return 1;
		}
		if (Calling[playerid] > -1)
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "Voce esta no telefone com %s!", giveplayer);
			SendClientMessage(playerid, COR_COP_ELITE, string);
			return 1;
		}
		if (Calling[giveplayerid] > -1)
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "%s ja esta no telefone, tente mais tarde.", giveplayer);
			SendClientMessage(playerid, COR_VERMELHO, string);
			return 1;
		}
		else
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s esta te ligando digite /atender para atender o celular ou /desligar para desligar o celular", sendername);
		SendClientMessage(giveplayerid, COR_VERMELHO, string);
		format(string, sizeof(string), "Você esta falando com %s", giveplayer);
		SendClientMessage(playerid, COR_COP_ELITE, string);
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
		    SendClientMessage(playerid, COR_VERMELHO, "Voce deve estar logado para atender uma chamada de telefone");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COR_VERMELHO, "Ninguem está te ligando");
		    return 1;
		}
		if (Answered[playerid] == 1)
		{
		    SendClientMessage(playerid, COR_VERMELHO, "Voce ja esta no telefone");
		    return 1;
		}
		else
		GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s esta te chamando", sendername);
		SendClientMessage(Calling[playerid], COR_AZUL, string);
		format(string, sizeof(string), "Você aceitou a chamada de %s's call", giveplayer);
        SendClientMessage(playerid, COR_AZUL, string);
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
		    SendClientMessage(playerid, COR_AZUL, "Voce deve estar logado para desligar uma chamada");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COR_AZUL, "Voce não esta no celular");
		    return 1;
		}
		else
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s Desligou o telefone", sendername);
			SendClientMessage(Calling[playerid], COR_VERMELHO, string);
			format(string, sizeof(string), "Voce desligou a chamada com %s", giveplayer);
			SendClientMessage(playerid, COR_VERMELHO, string);
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

    if (strcmp(cmd, "/ddroga", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 7, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/ddroga [local]");
		 return 1;
		 }
	 	 else{
           SendClientMessage(playerid, COR_COP_ELITE, "Os Narcoticos foram informados");
           for(new i=0; i<MAX_PLAYERS; i++){
		   if(Profissao[i] == POLICIAL_NARCOTICOS) {
		   format(string,sizeof(string), "%s Percebeu Trafico. Local: %s", PlayerName(playerid),tmp);
		   SendClientMessage(i,COR_BOMBEIRO,string);
		   return 1;
         }
      }
       }
	  }
  
	
    if (strcmp(cmd, "/dcaca", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 6, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/dcaca [local]");
		 return 1;
		 }
	 	 else{
           SendClientMessage(playerid, COR_COP_ELITE, "Os Policiais Florestais foram informados");
           for(new i=0; i<MAX_PLAYERS; i++){
		   if(Profissao[i] == POLICIA_FLORESTAL) {
	       format(string,sizeof(string), "%s Percebeu caça. Local: %s", PlayerName(playerid),tmp);
		   SendClientMessage(i,COR_BOMBEIRO,string);
		   return 1;
		 }
	  }
	       return 1;
	  }
	}
    if(strcmp(cmd, "/placa", true)==0){
	  if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
		new tmp[256];
		new plid;
		new car;
		new msg[256];
		tmp = strtok(cmdtext,idx);
		strmid(tmp,cmdtext, 7, strlen(cmdtext));
		if(!strlen(tmp)){
		SendClientMessage(playerid,COR_MECANICO, "/placa [id] [nome]");
		return 1;
		}
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid,COR_MECANICO, "/placa [id] [nome]");
		return 1;
		}
		car = GetPlayerVehicleID(plid);
		if(IsPlayerInVehicle(plid,car)){
		if(IsPlayerConnected(plid)){
		SetVehicleNumberPlate(car,tmp);
		SendClientMessage(playerid, COR_MECANICO, "Placa mudada");
		format(msg,sizeof(msg),"%s mudou sua placa para %s",PlayerName(playerid),tmp);
		SendClientMessage(plid,COR_AMARELOB,msg);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "Jogador nao conectado/logado");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "O jogador indicado tem que estar em um veiculo");
			return 1;
			}
	  }
	  else{
		  SendClientMessage(playerid, COR_MECANICO, "Voce nao tem permissao");
          return 1;
          }
	}
	if (strcmp(cmd, "/dpesca", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 7, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/dpesca [local]");
		 return 1;
		 }
	 	 else{
		 SendClientMessage(playerid, COR_COP_ELITE, "Os IBAMAS foram informados");
         for(new i=0; i<MAX_PLAYERS; i++){
         if(Profissao[i] == IBAMA) {
		 format(string,sizeof(string), "%s Percebeu Pesca. Local: %s", PlayerName(playerid),tmp);
		 SendClientMessage(i,COR_BOMBEIRO,string);
		 return 1;
		 }
	  }
	  }
	}
	if (strcmp(cmd, "/evacuar", true)==0){
	  if(Profissao[playerid] == BOMBEIRO){
		new string[256];
		for(new i=0; i<MAX_PLAYERS; i++){
		format(string,sizeof(string), "O Bombeiro %s mandou todos se afastarem do fogo ate a chegada dos bombeiros", PlayerName(playerid));
	    SendClientMessage(i,COR_BOMBEIRO,string);
	    return 1;
	    }
	  }
   }
    if (strcmp(cmd, "/corrida", true)==0){
	   if(Profissao[playerid] == JUIZ_DE_CORRIDA){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 8, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/corrida [local]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERDEC, "O povo foi informado da sua corrida");
		    for(new i=0; i<MAX_PLAYERS; i++){
					format(string, sizeof(string), "%s ira fazer uma corrida em: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_AMARELOB, string);
		        }
			}
		}
       return 1;
    }
    if (strcmp(cmd, "/evento", true)==0){
	   if(Profissao[playerid] == JUIZ_DE_CORRIDA){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 7, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/evento [local]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_AMARELOB, "O povo foi informado de seu evento");
		    for(new i=0; i<MAX_PLAYERS; i++){
					format(string, sizeof(string), "%s ira fazer um evento em: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_VERDEC, string);
		        }
			}
		}
       return 1;
    }
    if (strcmp(cmd, "/pputa", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 6, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/pputa [local]");
		 return 1;
		 }
	 	 else{
           SendClientMessage(playerid, COR_COP_ELITE, "Os Cafetoes foram informados");
           for(new i=0; i<MAX_PLAYERS; i++){
		   if(Profissao[i] == CAFETAO) {
	       format(string,sizeof(string), "%s Pediu uma PUTA. Local: %s", PlayerName(playerid),tmp);
		   SendClientMessage(i,COR_BOMBEIRO,string);
		   return 1;
		 }
	  }
	       return 1;
	  }
	}
    if (strcmp(cmd, "/diskpassagem", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 13, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/diskpassagem [local]");
		 return 1;
		 }
	 	 else{
           SendClientMessage(playerid, COR_COP_ELITE, "Os Motoristas da Rodoviaria foram informados");
           for(new i=0; i<MAX_PLAYERS; i++){
		   if(Profissao[i] == ONIBUS_VIAGEM) {
		   format(string,sizeof(string), "%s Pediu uma passagem. Local: %s", PlayerName(playerid),tmp);
		   SendClientMessage(i,COR_BOMBEIRO,string);
		   return 1;
		 }
	  }
	       return 1;
	  }
	}
    
    if(strcmp(cmd,"/apostar",true)==0){
			new tmp[256];
			new numero;
			new msg[256];
			tmp = strtok(cmdtext,idx);
			numero = strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "/apostar [numero da aposta]");
			return 1;
			}
			if(aposta[playerid] == 0){
			if(numero < 25){
			if(AreaBanco[playerid] == 1){
			aposta[playerid] = 1;
			numeroselecionado[playerid] = numero;
			format(msg,sizeof(msg),"Voce apostou no numero %d.", numero);
		    SendClientMessage(playerid, COR_COP_ELITE,msg);
		    SetTimerEx("apostar",1,1000,"dd",playerid,numero);
		    return 1;
		    }
		    else{
				SendClientMessage(playerid, COR_BRANCO, "Voce tem que estar no banco para fazer apostas");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_BRANCO, "Numero invalido, numeros de 0 a 25");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_BRANCO, "Você ja apostou espere os resultados para apostar novamente");
				return 1;
				}
    }
    if(strcmp(cmd, "/sequestrar", true)==0){
	  if(Profissao[playerid] == GENIO_DO_CRIME || Profissao[playerid] == ASSASSINO || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new distance;
	   tmp = strtok(cmdtext,idx);
	   distance = GetDistanceBetweenPlayers(playerid,plid);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, GENIO_DO_CRIME, "/sequestrar [id]");
	   return 1;
	   }
	   if(distance > 10){
	   SendClientMessage(playerid, COR_JUIZ, "Voce esta muito longe chegue mais perto");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   SetPlayerPos(plid,-2366.4233,1538.6921,2.1172);
	   SetPlayerPos(playerid,-2366.4233,1538.6921,2.1172);
	   TogglePlayerControllable(plid, 0);
	   SendClientMessage(playerid, COR_GENIO_DO_CRIME, "Voce sequestrou um jogador");
	   SendClientMessage(plid, COR_GENIO_DO_CRIME, "Voce foi sequestrado,ficará aqui até chamar a SWAT ou pagar resgate");
	   return 1;
	   }
   }

}




    if(strcmp(cmd, "/resgatar", true)==0){
        if(Profissao[playerid] == COP_ELITE) {
        new tmp[256];
        new plid;
        new distancia;
        tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		distancia = GetDistanceBetweenPlayers(playerid,plid);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_COP_ELITE, "/resgatar [id]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(distancia < 10){
		SendClientMessage(playerid, COR_COP_ELITE, "Resgate feito");
		SendClientMessage(plid, COR_COP_ELITE, "Voce foi resgatado cuidado pra nao ser pego da proxima vez");
		TogglePlayerControllable(plid, 1);
		return 1;
		}
		else{
           SendClientMessage(playerid, COR_JUIZ, "Voce esta muito longe chegue mais perto.");
		   return 1;
	       }
        }
        else{
           SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado.");
		   return 1;
	       }
		}
        else{
           SendClientMessage(playerid, COR_JUIZ, "Voce nao tem permissão.");
		   return 1;
	       }
    }

    if(strcmp(cmd, "/desequestrar", true)==0){
        if(Profissao[playerid] == GENIO_DO_CRIME) {
        new tmp[256];
        new plid;
        new distancia;
        tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		distancia = GetDistanceBetweenPlayers(playerid,plid);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_COP_ELITE, "/desequestrar [id]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(distancia < 10){
		SendClientMessage(playerid, COR_COP_ELITE, "Sequestro Eliminado");
		SendClientMessage(plid, COR_COP_ELITE, "O Sequestrador lhe soltou pelo resgate ser pago");
		TogglePlayerControllable(plid, 1);
		return 1;
		}
		else{
           SendClientMessage(playerid, COR_JUIZ, "Voce esta muito longe chegue mais perto.");
		   return 1;
	       }
        }
        else{
           SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado.");
		   return 1;
	       }
		}
        else{
           SendClientMessage(playerid, COR_JUIZ, "Voce nao tem permissão.");
		   return 1;
	       }
    }
    
    if (strcmp(cmd, "/diskarma", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 9, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/diskarma [local]");
		 return 1;
		 }
	 	 else{
		    SendClientMessage(playerid, COR_COP_ELITE, "Os Vendedores de Armas foram informados");
            for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == VENDEDOR_DE_ARMAS) {
		    format(string,sizeof(string), "%s Pediu uma arma. Local: %s", PlayerName(playerid),tmp);
		    SendClientMessage(i,COR_BOMBEIRO,string);
		    return 1;
		 }
	  }
	        return 1;
      }
	}
    if (strcmp(cmd, "/192", true)==0){
		 new tmp[256];
		 new string[256];
		 strmid(tmp,cmdtext, 4, strlen(cmdtext));
		 if(!strlen(tmp)) {
		 SendClientMessage(playerid, COR_BOMBEIRO, "/192 [local]");
		 return 1;
		 }
	 	 else{
		    SendClientMessage(playerid, COR_COP_ELITE, "Os Médicos foram informados");
            for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == MEDICO) {
		    format(string,sizeof(string), "%s Pediu uma arma. Local: %s", PlayerName(playerid),tmp);
		    SendClientMessage(i,COR_BOMBEIRO,string);
		    return 1;
		 }
	  }
	        return 1;
	  }
	}
    if(strcmp(cmd, "/mostrarpassagem", true) == 0) {
			  new tmp[256];
			  new plid;
			  new msg[256];
			  tmp = strtok(cmdtext,idx);
			  plid = strval(tmp);
			  if(!strlen(tmp)){
			  SendClientMessage(playerid, COR_BRANCO, "/mostrarpassagem [id]");
			  return 1;
			  }
			  if(IsPlayerConnected(plid)){
			  if(Passagem[playerid] == 0){
			  format(msg,sizeof(msg),"Passagem de %s nao encontrada.",PlayerName(playerid));
    	      SendClientMessage(plid,COR_BRANCO,msg);
    	      return 1;
    	      }
    	      else if(Passagem[playerid] == 1){
			  format(msg,sizeof(msg),"Passagem de %s encontrada.",PlayerName(playerid));
    	      SendClientMessage(plid,COR_BRANCO,msg);
			  return 1;
			  }
		   }
		      else{
		          SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
		          return 1;
		      }
	          return 1;
    }
    if(strcmp(cmd, "/verpassagem", true) == 0) {
	   if(Profissao[playerid] == ONIBUS_VIAGEM){
			  new tmp[256];
			  new plid;
			  new msg[256];
			  tmp = strtok(cmdtext,idx);
			  plid = strval(tmp);
			  if(!strlen(tmp)){
			  SendClientMessage(playerid, COR_BRANCO, "/verpassagem [id]");
			  return 1;
			  }
			  if(IsPlayerConnected(plid)){
			  if(Passagem[plid] == 0){
			  format(msg,sizeof(msg),"Passagem de %s nao encontrada.",PlayerName(playerid));
    	      SendClientMessage(playerid,COR_BRANCO,msg);
    	      return 1;
    	      }
    	      else if(Passagem[plid] == 1){
			  format(msg,sizeof(msg),"Passagem de %s encontrada.",PlayerName(playerid));
    	      SendClientMessage(playerid,COR_BRANCO,msg);
			  return 1;
			  }
		   }
		      else{
		          SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
		          return 1;
		      }
	          return 1;
	          }
    }
    if(strcmp(cmd, "/passagem", true) == 0) {
	    if(Profissao[playerid] == ONIBUS_VIAGEM || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/passagem [id]");
				return 1;
			}
			
			else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_ONIBUS_VIAGEM, "O jogador que você indicou não está conectado.");
				    return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para vender a passagem.");
						return 1;
						}
						else {
							Passagem[plid] = 1;
					    	SendClientMessage(playerid,COR_ONIBUS_VIAGEM, "Passagem Vendida!");
					    	format(msg,sizeof(msg),"Voce recebeu uma passagem de %s.",PlayerName(playerid));
					    	SendClientMessage(plid,COR_BRANCO,msg);
						}
					}
				}
			}
		else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
			return 1;
		}
		return 1;
	}
	if (strcmp("/setcar", cmdtext, true, 10) == 0){
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, plid, cor1, cor2;
			tmp = strtok(cmdtext, idx);
		    carid = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_JUIZ, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			plid = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_JUIZ, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			cor1 = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_JUIZ, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
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
					format(string, sizeof(string), "%s %d %f %f %f %f %d %d // Local:\r\n",  PlayerName(plid), carid, X, Y, Z, ang, cor1, cor2);
					temp = fopen("furiousrpg.carros", io_append);
                   	fwrite(temp, string);
                   	fclose(temp);
                   	SetTimerEx("SetCar",10000,0,"dffffdd",carid,X,Y,Z,ang,cor1,cor2);
                   	format(string, sizeof(string), "Você vendeu um veículo(id: %d) para %s, dentro de 10 segundos ele aparecerá.", carid, PlayerName(plid));
                   	SendClientMessage(playerid, COR_COP_ELITE, string);
                   	format(string, sizeof(string), "%s te vendeu um veículo(id: %d).", PlayerName(playerid),carid);
					SendClientMessage(plid, COR_COP_ELITE, string);
                   	format(string, sizeof(string), "* %s setou um veículo(id: %d) para %s.", PlayerName(playerid),carid,PlayerName(plid));
					SendClientMessageToAll(COR_COP_ELITE, string);
					printf("O Jogador %s setou um veiculo(id: %d) para %s.", PlayerName(playerid),carid,PlayerName(plid));
					return 1;
					}
					else{
				    	SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado.");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_JUIZ, "Você precisa estar em um veiculo para vender.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_JUIZ, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		}
		if(Profissao[playerid] != VENDEDOR_DE_CARROS){
			SendClientMessage(playerid, COR_JUIZ, "Você não é Vendedor de Carros e Skins");
			return 1;
		}
	}
    if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "São %d:00 horas na região de SF", worldTime);
		SendClientMessage(playerid, COR_CONFISCADOR_CARROS, string);
		format(string, sizeof(string), "São %d:00 horas na região de FC", worldTime - 3);
		SendClientMessage(playerid, COR_CONFISCADOR_CARROS, string);
		format(string, sizeof(string), "São %d:00 horas na região de LV", worldTime - 5);
		SendClientMessage(playerid, COR_CONFISCADOR_CARROS, string);
		return 1;
	}
	if(strcmp(cmd, "/recolherpass", true) == 0) {
	    if(Profissao[playerid] == ONIBUS_VIAGEM || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/passagem [id]");
				return 1;
			}

			else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_ONIBUS_VIAGEM, "O jogador que você indicou não está conectado.");
				    return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_ONIBUS_VIAGEM, "Chege mais perto para recolher a passagem.");
						return 1;
						}
						else {
							Passagem[plid] = 0;
					    	SendClientMessage(playerid,COR_ONIBUS_VIAGEM, "Passagem Recolhida!");
					    	format(msg,sizeof(msg),"Sua passagem foi recolhida por %s.",PlayerName(playerid));
					    	SendClientMessage(plid,COR_BRANCO,msg);
						}
					}
				}
			}
		else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/colete", true) == 0) {
	if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COR_BRANCO, "/colete [id]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
      SetPlayerArmour(plid,100);
      SendClientMessage(playerid, COR_JUIZ, "Colete Vendido");
      SendClientMessage(plid, COR_JUIZ, "Voce recebeu um colete");
      return 1;
      }
	}
	  else{
	  SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
  	  return 1;
	  }
	}
    if(strcmp(cmd, "/matar", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COR_AMARELOB, "/matar [id]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
	  SetPlayerHealth(plid,0);
	  SendClientMessage(playerid, COR_BRANCO, "Morte feita");
	  SendClientMessage(plid, COR_BRANCO, "Voce foi morto por um admin");
	  return 1;
	  }
   }
      else{
	      SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
	      return 1;
	   }
 }
	if(strcmp(cmd, "/dinheiro", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new tmx[256];
	   new plid;
	   new quantia;
	   tmp = strtok(cmdtext,idx);
	   tmx = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "/dinheiro [id] [quantia]");
	   return 1;
	   }
	   quantia = strval(tmx);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "/dinheiro [id] [quantia]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   GivePlayerMoney(plid,quantia);
	   new string[256];
	   SendClientMessage(plid, COR_BRANCO, "Um admin lhe entregou uma grana");
	   SendClientMessage(playerid, COR_BRANCO, "Grana entregue");
	   format(string,sizeof(string)," O admin %s deu $%d para %s",PlayerName(playerid),quantia,PlayerName(plid));
	   SendClientMessageToAll(COR_COP_ELITE,string);
	   return 1;
	   }
    }
	   else{
	       SendClientMessage(playerid, COR_BRANCO, "Jogador nao conectado/logado");
	       return 1;
	       }
	}

    if(strcmp(cmd, "/paralisar", true) == 0) {
	   if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "Selecione um jogador para utizilar esse comando");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   TogglePlayerControllable(plid,0);
	   SendClientMessage(playerid, COR_BRANCO, "Você paralisou um jogador");
	   SendClientMessage(playerid, COR_BRANCO, "Você foi paralisado por um admin");
	   return 1;
	   }
	 }
	   else{
		   SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
		   return 1;
		 }
	}
	if(strcmp(cmd, "/desparalisar", true) == 0) {
	   if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "Selecione um jogador para utizilar esse comando");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   TogglePlayerControllable(plid,1);
	   SendClientMessage(playerid, COR_BRANCO, "Você desparalisou um jogador");
	   SendClientMessage(playerid, COR_BRANCO, "Você foi desparalisado por um admin");
	   return 1;
	   }
	 }
	   else{
	       SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
		   return 1;
		 }
	}
	if(strcmp(cmd, "/spvehicle", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new car;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "/spvehicle [id]");
	   return 1;
	   }
	   car = GetPlayerVehicleID(plid);
	   if(IsPlayerConnected(plid)){
	   if(IsPlayerInVehicle(plid,car)){
	   SetVehicleToRespawn(car);
	   SendClientMessage(playerid, COR_AMARELOB, "Carro spawnado");
	   SendClientMessage(plid, COR_AMARELOB, "Seu carro foi spawnado por um admin");
	   return 1;
	   }
   	 }
   	   else{
		   SendClientMessage(playerid, COR_JUIZ, " O jogador nao esta em um veiculo");
		   return 1;
		   }
       }
    }

	if(strcmp(cmd, "/spawnid", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "/spid [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   LogarPlayer(plid);
	   SendClientMessage(playerid, COR_AZUL, "Spawn feito");
	   SendClientMessage(plid, COR_AZUL, "Voce foi spawnado por um admin");
	   return 1;
	   }
    }
	   else{
	   SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
	   return 1;
	   }
	}
    if(strcmp(cmd, "/destruir", true) == 0) {
	   if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new carro;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "Selecione um jogador para usar esse comando");
	   return 1;
	   }
	   carro = GetPlayerVehicleID(plid);
	   if(IsPlayerConnected(plid)){
	   if(IsPlayerInVehicle(plid,carro)){
	   SetVehicleHealth(carro,0);
	   SendClientMessage(playerid, COR_BRANCO, "Carro Destruido");
	   SendClientMessage(plid, COR_BRANCO, "Seu veiculo foi destruido por um admin");
	   return 1;
	   }
	}
	   else{
	       SendClientMessage(playerid, COR_JUIZ, "O jogador nao esta em um veiculo");
	       return 1;
	   }
    }
       else{
	       SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
	       return 1;
	   }
   }
    if(strcmp(cmd, "/votacaoon", true) == 0) {
   if(IsPlayerAdmin(playerid)){
       new tmp[256];
       new tmo[256];
       new plid1;
       new plid2;
       for(new i=0; i<MAX_PLAYERS; i++){
       tmp = strtok(cmdtext,idx);
       plid1 = strval(tmp);
       if(!strlen(tmp)){
       SendClientMessage(playerid, COR_BRANCO, "/votacaoon [id1] [id2]");
       return 1;
       }
       tmo = strtok(cmdtext,idx);
       plid2 = strval(tmo);
       if(!strlen(tmo)){
       SendClientMessage(playerid, COR_BRANCO, "/votacaoon [id1] [id2]");
       return 1;
       }
       if(IsPlayerConnected(i)){
       if(plid1 != plid2){
       if(IsPlayerConnected(plid1)){
       if(IsPlayerConnected(plid2) && PLAYERLIST_authed[playerid] == 1){
	   Votacoes[plid1] = 1;
	   Votacoes[plid2] = 1;
       temporadavotos[i] = 1;
       votosabertos[plid1] = 1;
       votosabertos[plid2] = 1;
       new msg[256];
       format(msg,sizeof(msg),"Votaçoes politicas abertas entre %s e %s.",PlayerName(plid1),PlayerName(plid2));
  	   SendClientMessageToAll(COR_BRANCO,msg);
  	   SetTimerEx("votacaoon",1500000,1,"dd",plid1,plid2);
       return 1;
       }
	   else{
	       SendClientMessage(playerid, COR_JUIZ, "Jogador 2 nao conectado/logado");
	       return 1;
	       }
       }
       else{
	       SendClientMessage(playerid, COR_JUIZ, "Jogador 1 nao conectado/logado");
	       return 1;
	       }
       }
       else{
           SendClientMessage(playerid, COR_JUIZ, "Nao da pra elegir 1 pessoa 2 vezes né");
	       return 1;
	       }
       }
	 }
   }
   return 1;
}

    if(strcmp(cmd,"/votar",true) == 0) {
		new tmp[256];
		new plid;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/votar [id]");
		return 1;
		}
		if(temporadavotos[playerid] != 1){
		SendClientMessage(playerid, COR_BRANCO, "Nao estamos na temporada de votos espere ate ela para votar");
		return 1;
		}
        if(Profissao[playerid] == ESTADUAL || Profissao[playerid] == FEDERAL || Profissao[playerid] == PREFEITO || Profissao[playerid] == GOVERNADOR || Profissao[playerid] == PRESIDENTE){
        SendClientMessage(playerid, COR_BRANCO, "Politicos nao podem votar");
        return 1;
        }
		if(votosabertos[plid] != 1){
		SendClientMessage(playerid, COR_BRANCO, "O jogador que voce quer votar nao esta elegido para votaçoes por enquanto");
		return 1;
		}
		if(voto[playerid] == 1){
		SendClientMessage(playerid, COR_BRANCO, "Voce ja votou agora basta esperar os resultados");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(AreaBanco[playerid] == 1){
		Qtvotos[plid]++;
		voto[playerid] = 1;
		SendClientMessage(playerid, COR_GOVERNADOR, "Obrigado por colaborar os resultados dos votos sairão no jornal");
		return 1;
		}
    }
		else{
		SendClientMessage(playerid, COR_JUIZ, "Voce tem que estar em um banco para votar");
    	return 1;
		}
    }
		
    if(strcmp(cmd, "/assaltar", true) == 0) {
	  if(Profissao[playerid] == ASSALTANTE || Profissao[playerid] == MESTRE_DO_ROUBO || Profissao[playerid] == GENIO_DO_CRIME){
		    new tmp[256];
		    new string[256];
		    tmp = strtok(cmdtext,idx);
            if(AreaBanco[playerid] == 1 || AreaMercado[playerid] == 1){
		    if(assalto[playerid] == 0){
		    GivePlayerMoney(playerid,1000);
		    assalto[playerid] = 1;
		    SendClientMessage(playerid, COR_ASSALTANTE, "Assalto Concluido");
		    format(string,sizeof(string),"AVISO AOS POLICIAIS: %s acabou de assaltar um banco ou mercado e foi posto na lista dos procurados, é bom vocês agirem logo",PlayerName(playerid));
		    SendClientMessageToAll(COR_GOVERNADOR,string);
		    SetTimerEx("assaltar",300000,false,"d",playerid);
		    return 1;
		    }
	        else{
			    SendClientMessage(playerid, COR_ASSALTANTE, "Espere mais tempo para assaltar novamente");
			    return 1;
			    }
		    }
	        else{
			    SendClientMessage(playerid, COR_ASSALTANTE, "Voce deve estar em um banco ou mercado para usar este comando");
			    return 1;
			    }
	  }
	  else{
		  SendClientMessage(playerid, COR_ASSALTANTE, "Você nao tem permissão");
		  return 1;
		  }
	}
    if(strcmp(cmd, "/roubar", true) == 0) {
		  if(Profissao[playerid] == LADRAO || Profissao[playerid] == MOTORISTA_FUGA || Profissao[playerid] == ASSALTANTE || Profissao[playerid] == MESTRE_DO_ROUBO || Profissao[playerid] == GENIO_DO_CRIME){
			 new tmp[256];
			 new plid;
			 new distancia;
			 new grana;
			 tmp = strtok(cmdtext,idx);
			 distancia = GetDistanceBetweenPlayers(playerid,plid);
			 plid = strval(tmp);
			 if(!strlen(tmp)){
			 SendClientMessage(playerid, COR_LADRAO, "/roubar [id]");
			 return 1;
			 }
			 grana = GetPlayerMoney(plid);
			 if(grana < 150){
			 SendClientMessage(playerid, COR_LADRAO, "O jogador que voce quer roubar nao possue esse dinheiro nas mãos");
			 return 1;
			 }
			 if(IsPlayerConnected(plid)){
			 if(distancia > 10){
			 GivePlayerMoney(playerid,150);
			 GivePlayerMoney(plid, 0 - 150);
			 SendClientMessage(playerid, COR_LADRAO, "Roubo Concluido");
			 SendClientMessage(plid, COR_LADRAO, "Voce foi roubado em $150 melhor chamar a policia");
			 return 1;
			 }
			 else{
			     SendClientMessage(playerid, COR_LADRAO, "Voce esta muito longe chegue mais perto");
   	             return 1;
				 }
			 }
			 else{
			     SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
   	             return 1;
				 }
          }

          if(strcmp(cmd, "/tiraraero", true) == 0) {
            if(Profissao[playerid] == CONFISCADOR_CARROS || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção aerea removida.");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção aerea excluida.");
			    SendClientMessage(plid, COR_INSTRUTOR, "Você perdeu a habilitação de direção aerea.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
            if(Profissao[playerid] != CONFISCADOR_CARROS){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}
   }
	if(strcmp(cmd, "/desmanche", true) == 0){
	    new veiculo = GetPlayerVehicleID(playerid);
	    if(TempoDesmanche[playerid] == 0){
		if(Profissao[playerid] == LADRAO_DE_CARROS || Profissao[playerid] == MOTORISTA_FUGA || Profissao[playerid] == MESTRE_DO_ROUBO){
            if(IsPlayerInAnyVehicle(playerid)){
	 			if(AreaDesmanche[playerid] == 1){
	  			GivePlayerMoney(playerid,1000);
	  			SetVehicleToRespawn(veiculo);
	  			TempoDesmanche[playerid] = 1;
	  			SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "Carro enviado para o desmanche voce recebeu $1000 pelo trabalho");
				SetTimerEx("desmanche",500000,false,"d",playerid);
                return 1;
		  	    }
				else{
					 SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "Voce não esta no desmanche");
					 return 1;
	            	 }
            }
            else{
			    SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "Voce tem que estar em um veiculo");
			    return 1;
     	        }
        }
	    else{
            SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "Voce nao tem permissão");
	        return 1;
	        }
        }
    }
   	if(strcmp(cmd, "/vendercarro", true) == 0){
	    new veiculo = GetPlayerVehicleID(playerid);
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
       		if(IsPlayerInAnyVehicle(playerid)){
	 			if(AreaVenda[playerid] == 1){
	 			GivePlayerMoney(playerid,2000);
	  			DestroyVehicle(veiculo);
				if(lavagem[veiculo] != 0){
	  			SendClientMessage(playerid, COR_VENDEDOR, "Carro Vendido voce ganhou $2000 pela venda");
				SendClientMessage(playerid, COR_VENDEDOR, "Obrigado pela lavagem do carro você recebeu $150 a mais por isto");
				GivePlayerMoney(playerid,150);
				return 1;
				}
				else{
					 SendClientMessage(playerid, COR_VENDEDOR, "Só aceitamos carros limpos");
					 return 1;
	            	 }
                }
                else{
                    SendClientMessage(playerid, COR_VENDEDOR, "Voce nao esta na area de venda");
                    return 1;
   	                }
                }
            else{
                SendClientMessage(playerid, COR_VENDEDOR, "Voce nao esta em um veiculo");
                return 1;
                }
          }
    }
    if(strcmp(cmd,"/arma",true)==0)
	{
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS){
	        new plid[256], weapon[256], ammo[256];
	        plid = strtok(cmdtext,idx);
	        weapon = strtok(cmdtext,idx);
	        ammo = strtok(cmdtext,idx);
	        if(!strlen(plid) || !strlen(weapon)){
	            SendClientMessage(playerid,COR_VERMELHO,"Ei, especifique ao menos um jogador e uma arma!");
	            return 1;
			}
			if(strval(weapon) < 1 || strval(weapon) > 46 || strval(weapon) == 39 || strval(weapon) == 38 || strval(weapon) == 37 || strval(weapon) == 36 || strval(weapon) == 35|| strval(weapon) == 40){
			    SendClientMessage(playerid,COR_VERMELHO,"Arma inválida.");
			    return 1;
			} else {
				if(!IsPlayerConnected(strval(plid))){
				    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado.");
				    return 1;
				} else {
				    SendClientMessage(playerid,COR_BRANCO,"Comando executado com sucesso.");
				    if(!strval(ammo)){
				        GivePlayerWeapon(strval(plid),strval(weapon),100);
					} else {
					    GivePlayerWeapon(strval(plid),strval(weapon),strval(ammo));
				        }
					}
				}
			}
		}



	if(strcmp(cmd, "/tirarterrestre", true) == 0) {
	    if(Profissao[playerid] == CONFISCADOR_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção terrestre removida.");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção terrestre concedida.");
			    SendClientMessage(plid, COR_INSTRUTOR, "Você perdeu a habilitação de direção de carros e motos.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != CONFISCADOR_CARROS){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}
	if(strcmp(cmd, "/radar", true) == 0) {
	   if(Profissao[playerid] == CONFISCADOR_CARROS || IsPlayerAdmin(playerid)){
	   TogglePlayerControllable(playerid,false);
	   ShowMenuForPlayer(radares,playerid);
	   return 1;
	   }
	}
    if(strcmp(cmd, "/tirarnautica", true) == 0) {
		if(Profissao[playerid] == CONFISCADOR_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção náutica removida.");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção náutica excluida.");
			    SendClientMessage(plid, COR_INSTRUTOR, "Você perdeu a habilitação de direção náutica.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}
	

    if(strcmp(cmd,"/esmola",true)==0){
	    	new tmp[256];
	    	new msg[256];
            new plid;
	    	strmid(tmp,cmdtext,7,strlen(cmdtext));
            plid = strval(tmp);
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"Uso: /esmola [id]");
			    return 1;
			    }
            if(IsPlayerConnected(plid)){
				format(msg,sizeof(msg),"%s esta lhe pedindo esmola.", PlayerName(playerid));
			    SendClientMessage(plid, COR_COP_ELITE,msg);
                }
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
				}
			return 1;
			}
    if(strcmp(cmd,"/carona",true)==0){
	    	new tmp[256];
	    	new msg[256];
            new plid;
	    	strmid(tmp,cmdtext,7,strlen(cmdtext));
            plid = strval(tmp);
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"Uso: /carona [id]");
			    return 1;
			    }
            if(IsPlayerConnected(plid)){
				format(msg,sizeof(msg),"%s esta lhe pedindo carona.", PlayerName(playerid));
			    SendClientMessage(plid, COR_COP_ELITE,msg);
                }
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
				}
			return 1;
			}
    if(strcmp(cmd,"/aumento",true)==0){
	    	new tmp[256];
	    	new msg[256];
            new plid;
	    	strmid(tmp,cmdtext,8,strlen(cmdtext));
            plid = strval(tmp);
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"Uso: /aumento [id]");
			    return 1;
			    }
            if(IsPlayerConnected(plid)){
				format(msg,sizeof(msg),"%s esta lhe pedindo aumento.", PlayerName(playerid));
			    SendClientMessage(plid, COR_COP_ELITE,msg);
                }
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
				}
			return 1;
			}

    if(strcmp(cmd,"/gorjeta",true)==0){
	    	new tmp[256];
	    	new msg[256];
            new plid;
	    	strmid(tmp,cmdtext,8,strlen(cmdtext));
            plid = strval(tmp);
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"Uso: /gorjeta [id]");
		    	return 1;
			    }
            if(IsPlayerConnected(plid)){
				format(msg,sizeof(msg),"%s esta lhe pedindo gorjeta.", PlayerName(playerid));
			    SendClientMessage(plid, COR_COP_ELITE,msg);
                }
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
				}
			return 1;
			}

    if(strcmp(cmd, "/comprarskin", true) == 0) {
	   new tmp[256];
	   new skin;
	   new dinheiro;
	   tmp = strtok(cmdtext,idx);
	   skin = strval(tmp);
	   dinheiro = GetPlayerMoney(playerid);
	   if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==273 || skin==274 || skin==289 || skin>=300){
       SendClientMessage(playerid,COR_BRANCO, "skin invalido");
	   return 1;
	   }
	   if(dinheiro < 50){
	   SendClientMessage(playerid, COR_BRANCO, "Você nao possue dinheiro para uma skin");
	   return 1;
	   }
	   udb_setSkin(PlayerName(playerid),skin);
	   SetPlayerSkin(playerid,skin);
	   SendClientMessage(playerid,COR_AMARELOB, "Sua skin foi comprada por $50");
	   GivePlayerMoney(playerid,0-50);
	   return 1;
	   }

    if(strcmp(cmdtext, "/trancar", true)==0){
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COR_COP_ELITE, "Veículo Trancado");
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo nenhum veiculo!");
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
			SendClientMessage(playerid, COR_COP_ELITE, "Veículo Destrancado");
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo nenhum veiculo!");
			return 1;
		}
	}

	if(strcmp(cmd, "/transferir", true) == 0) {
		new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "Uso: /transferir [id-do-jogador] [quantidade]");
			return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "Uso: /transferir [id-do-jogador] [quantidade]");
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
				SendClientMessage(playerid, COR_AMARELO, string);
				format(string, sizeof(string), "Você recebeu $%d de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COR_AMARELO, string);
			}
			else {
				SendClientMessage(playerid, COR_AMARELO, "Valor inválido.");
			}
		}
		else {
			format(string, sizeof(string), "%d não está online.", giveplayerid);
			SendClientMessage(playerid, COR_AMARELO, string);
		}
		return 1;
	}

	if(strcmp(cmd, "/depositar", true) == 0) {
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "Uso: /depositar [quantidade]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COR_VERMELHO, "Você não tem todo esse dinheiro. Ou está tentando enviar $0.");
			return 1;
		}
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, 0 - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
            TogglePlayerControllable(playerid,0);
            SetTimerEx("depositar",11000,false,"d",playerid);
            ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COR_AMARELO, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint,Forst Caston e Las Venturas.");
			return 1;
		}
	}

    if(strcmp(cmd, "/sacar", true) == 0) {
        new string[256];
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "Uso: /sacar [quantidade]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COR_VERMELHO, "Você não pode querer depositar com esse comando");
			return 1;
		}
		if(quantidade > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não pode tem essa quantidade no banco");
			return 1;
		}
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Você retirou $%d do banco. seu saldo atual é de $%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_AMARELO, string);
			TogglePlayerControllable(playerid,0);
			SetTimerEx("sacar",11000,false,"d",playerid);
			ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COR_AMARELO, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint ,Forst Caston e Las Venturas.");
			return 1;
		}
	}
	if(strcmp(cmd, "/alarme", true) == 0) {
	   if(Profissao[playerid] == SEGURANCA_DE_CARROS){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_AMARELOB,"/alarme [id]");
	   return 1;
	   }
	   new carro = GetPlayerVehicleID(plid);
	   if(IsPlayerInVehicle(plid,carro)){
	   if(IsPlayerConnected(plid)){
	   alarme[carro] = 1;
	   antialarm[plid] = carro;
	   SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "Alarme instalado");
	   SendClientMessage(plid, COR_SEGURANCA_DE_CARROS, "Seu carro agora tem alarme");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_BRANCO, "Jogador nao conectado/logado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_BRANCO, "O jogador nao esta num veiculo");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_BRANCO, "Voce nao tem permissao");
		   return 1;
		   }
    }
    if(strcmp(cmd, "/dalarme", true) == 0) {
	  if(Profissao[playerid] == LADRAO_DE_CARROS){
	   if(IsPlayerInAnyVehicle(playerid)){
	   alarme[GetPlayerVehicleID(playerid)] = 0;
	   SendClientMessage(playerid, COR_VERDE, "Alarme destruido");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid,COR_BRANCO, "Voce nao esta num veiculo");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid,COR_BRANCO, "Voce nao tem permissao");
		   return 1;
		   }
	}
    if(strcmp(cmd, "/talarme", true) == 0) {
	   if(Profissao[playerid] == SEGURANCA_DE_CARROS){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_AMARELOB,"/talarme [id]");
	   return 1;
	   }
	   new carro = GetPlayerVehicleID(plid);
	   if(IsPlayerInVehicle(plid,carro)){
	   if(IsPlayerConnected(plid)){
	   alarme[carro] = 0;
	   SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "Alarme removido");
	   SendClientMessage(plid, COR_SEGURANCA_DE_CARROS, "Seu carro nao possue mais alarme");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_BRANCO, "Jogador nao conectado/logado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_BRANCO, "O jogador nao esta num veiculo");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_BRANCO, "Voce nao tem permissao");
		   return 1;
		   }
    }
	if(strcmp(cmd, "/devolverlimo", true) == 0) {
	   if(Profissao[playerid] == MOTORISTA_PARTICULAR){
	   new tmp[256];
	   new car;
	   new modelo;
	   cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
	   if(modelo == VEH_LIMOSINE){
	   tmp = strtok(cmdtext,idx);
	   car = GetPlayerVehicleID(playerid);
	   if(AreaLimosine[playerid] == 1){
	   if(IsPlayerInVehicle(playerid,car)){
       devolucao[playerid] --;
	   GivePlayerMoney(playerid,150);
	   DestroyVehicle(car);
	   SendClientMessage(playerid, COR_BRANCO, "Limosine Devolvida");
	   SendClientMessage(playerid, COR_MOTORISTA, "Obrigado por lavar nossas limosines você recebeu $150 pelo bom trabalho");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_MOTORISTA, "Voce tem que estar numa limosine");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_MOTORISTA, "Voce nao esta em um carro");
		   return 1;
		   }
       }
       else{
		  SendClientMessage(playerid, COR_MOTORISTA, "Voce nao esta na companhia de limosines");
		  return 1;
		  }
	   }
	   else{
		   SendClientMessage(playerid, COR_MOTORISTA, "Voce nao é motorista particular");
		   return 1;
		   }
    }
    if(strcmp(cmd, "/lavar", true) == 0) {
	   if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new car;
	   new distancia;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_MECANICO, "Uso: /lavar [id]");
	   return 1;
	   }
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   if(distancia > 10){
	   SendClientMessage(playerid, COR_MECANICO, "Voce esta muito longe chegue mais perto");
	   return 1;
	   }
	   car = GetPlayerVehicleID(plid);
	   if(IsPlayerInVehicle(plid,car)){
	   if(IsPlayerConnected(plid)){
	   SendClientMessage(playerid, COR_MECANICO, "Carro lavado");
	   SendClientMessage(plid, COR_MECANICO, "Seu carro foi lavado por um mecanico");
	   return 1;
	   }
	 }
	   else{
	       SendClientMessage(playerid, COR_MECANICO, "Jogador nao conectado/logado");
	       return 1;
	       }
       }
	   else{
	       SendClientMessage(playerid, COR_MECANICO, "O jogador indicado nao esta em um carro");
	       return 1;
		   }
	   }


	if(strcmp(cmd, "/lavarlimo", true) == 0) {
	   if(Profissao[playerid] == MOTORISTA_PARTICULAR){
	   new tmp[256];
	   new car;
	   new modelo;
	   tmp = strtok(cmdtext,idx);
	   car = GetPlayerVehicleID(playerid);
	   cGetVehicleModelID(car,modelo);
	   if(AreaLimosine[playerid] == 1){
       if(modelo == 409){
       GivePlayerMoney(playerid,100);
       SendClientMessage(playerid, COR_MOTORISTA, "Limosine lavada!! Você recebeu $100 pelo trabalho");
       lavagem[car] = 1;
       return 1;
       }
       else{
		   SendClientMessage(playerid, COR_MOTORISTA, "Voce nao esta numa limosine");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_MOTORISTA, "Voce nao esta na companhia de limosine");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_MOTORISTA, "Voce nao tem permissao");
		   return 1;
		   }
    }
    if(strcmp(cmd, "/alugarlimo", true) == 0) {
	  if(Profissao[playerid] == MOTORISTA_PARTICULAR || IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new car;
	  tmp = strtok(cmdtext,idx);
	  car = CreateVehicle(409,-1974.1918,724.8635,45.0975,266.6841,0,0,0);
	  devolucao[playerid] ++;
	  if(AreaLimosine[playerid] == 1){
	  udb_setBankMoney(PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)) - 400);
      SendClientMessage(playerid, COR_MOTORISTA, "Limosine alugada por $400 o dinheiro foi retirado do banco, nao esqueça de devolver a Limosine");
      SetTimerEx("alugarlimo",600000,1,"dd",car,playerid);
      return 1;
      }
	  else{
	      SendClientMessage(playerid, COR_MOTORISTA, "Voce nao esta na companhia de limosines");
	      return 1;
	      }
      }
      else{
		  SendClientMessage(playerid, COR_MOTORISTA, "Voce nao é motorista");
		  return 1;
		  }
	}
    if(strcmp(cmd, "/extrato", true) == 0) {
		new string[256];
        if(AreaBanco[playerid] == 1){
			format(string, sizeof(string), "Você tem %d na conta %d", udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COR_COP_ELITE, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COR_AMARELO, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint,Forst Caston e Las Venturas.");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/extratocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 20){
            SendClientMessage(playerid, COR_AMARELO, "Custo: $20");
			return 1;
		}
		else{
		    GivePlayerMoney(playerid, 0 - 20);
			format(string, sizeof(string), "Mensagem de Celular: Você tem %d na conta %d", udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COR_BRANCO, string);
			return 1;
		}
	}

	if(strcmp(cmd, "/abastecer", true) == 0) {
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			new tmp[256];
			new quantidade;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "Uso: /abastecer [litros]");
				return 1;
			}
		    quantidade = strval(tmp);
		    if(quantidade <= -100 || GetPlayerMoney(playerid) < quantidade){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não tem dinheiro para pagar. Ou você está querendo tirar combustível do veículo.");
				return 1;
			}
			if(AreaPosto[playerid] == 1){
				if(quantidade + Petrol[GetPlayerVehicleID(playerid)] < 0){
				    Petrol[GetPlayerVehicleID(playerid)] = Petrol[GetPlayerVehicleID(playerid)] + quantidade;
				    format(string, sizeof(string), "Colocamos %d litros de combustível.", quantidade);
					SendClientMessage(playerid, COR_BRANCO, string);
					return 1;
				}
				if(quantidade + Petrol[GetPlayerVehicleID(playerid)] >= 0){
				    new quantia;
				    quantia = 0 - Petrol[GetPlayerVehicleID(playerid)];
				    Petrol[GetPlayerVehicleID(playerid)] = 0;
					format(string, sizeof(string), "Enchemos o tanque, colocados %d litros.", quantia);
					SendClientMessage(playerid, COR_BRANCO, string);
					GivePlayerMoney(playerid, - quantia);
					return 1;
				}
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está no posto, consulte o mapa para ver a localização do posto mais proximo.");
				return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você precisa estar em um veículo para usar este comando.");
			return 1;
		}
	}
	if(strcmp(cmd,"/colocar",true) == 0){
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			if(Galao[playerid] == 0){
				SendClientMessage(playerid,COR_VERMELHO,"O Galão de Combustivel está vazio!");
				return 1;
			} else {
				Galao[playerid] = 0;
				SendClientMessage(playerid,COR_BRANCO,"Você colocou um galão de 15 litros no tanque do carro, agora vá até o posto e abasteça.");
				Petrol[GetPlayerVehicleID(playerid)] = Petrol[GetPlayerVehicleID(playerid)] + 15;
				return 1;
			}
 			} else {
				SendClientMessage(playerid,COR_VERMELHO,"Você precisa estar em um veículo para usar este comando.");
				return 1;
			}
		}

	if(strcmp(cmd, "/buygalao", true) == 0) {
		if(Galao[playerid] == 0){
			if(AreaPosto[playerid] == 1){
				SendClientMessage(playerid,COR_BRANCO,"Você comprou um galão com 15 litros de combustivel.");
				SendClientMessage(playerid,COR_BRANCO,"Para colocar entre no carro e digite '/colocar'.");
				GivePlayerMoney(playerid, -15);
				Galao[playerid] = 1;
				return 1;
			} else {
				SendClientMessage(playerid,COR_VERMELHO,"Você não está no posto!");
	    		return 1;
  			}
		} else {
			SendClientMessage(playerid,COR_VERMELHO,"Seu galão de combustivel já está cheio!");
			return 1;
		}
	}
    if(strcmp(cmd, "/pagarparcelado", true) == 0) {
	   new tmp[256];
	   new plid;
	   new distancia;
	   new quant;
	   new parcela;
	   new pagamento;
	   new string[256];
	   new msg[256];
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERDE, "/pagarparcelado [id] [quantia] [parcelas]");
	   return 1;
	   }
	   quant = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERDE, "/pagarparcelado [id] [quantia] [parcelas]");
	   return 1;
	   }
	   parcela = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERDE, "/pagarparcelado [id] [quantia] [parcelas]");
	   return 1;
	   }
	   pagamento = quant/15;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   if(quant >= 500){
	   if(IsPlayerConnected(plid)){
	   if(Profissao[plid] == CORRETOR || Profissao[plid] == VENDEDOR_DE_CARROS){
	   if(GetPlayerMoney(playerid) > quant){
	   if(distancia < 10){
	   GivePlayerMoney(plid,pagamento);
	   GivePlayerMoney(playerid,0 - quant);
	   format(msg,sizeof(msg),"Voce agora esta pagando por %d parcelas de %d para %s",parcela,quant,PlayerName(plid));
	   format(string,sizeof(string),"%s lhe pagou %d !! %d foi para voce e %d para sua agencia, o pagamento sera feito em %d parcelas",PlayerName(playerid),quant,pagamento,quant - pagamento,parcela);
	   SetTimerEx("parcelamento",240000,parcela - 1,"dddd",playerid,plid,quant,pagamento);
	   SendClientMessage(plid,COR_MECANICO,string);
	   SendClientMessage(playerid,COR_MECANICO,msg);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Voce esta muito longe chegue mais perto");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Voce nao possue essa grana nas maos");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Voce esta tentando pagar alguem que nao é corretor e nem vendedor");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador nao conectado/logado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Voce so pode pagar parcelado mais de $500");
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
			SendClientMessage(playerid, COR_VERMELHO, "/pagar [id] [amount]");
			return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/jobpay [id] [amount]");
			return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == VENDEDOR_DE_CARROS || Profissao[plid] == CORRETOR){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem esse dinheiro! ou não está querendo pagar de forma justa.");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/10);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COR_MEDICO, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COR_MEDICO, string);
				return 1;
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
				return 1;
			}
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COR_AZUL, "Você está tentando pagar a alguem que não é corretor e nem vendedor!");
			return 1;
		}
	}

	if(strcmp(cmd, "/documentos", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[3];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "Documentos mostrados.");
			return 1;
		}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
		    hab[2] = udb_getHabaerea(PlayerName(playerid));
		    hab[0] = udb_gethabterre(PlayerName(playerid));
		    hab[1] = udb_getHabnauti(PlayerName(playerid));
			format(string, sizeof(string), "Identidade de: %s", PlayerName(playerid));
			SendClientMessage(playerid, COR_AMARELO, string);
			format(string, sizeof(string), "Skin :: %d", udb_getSkin(PlayerName(playerid)));
			SendClientMessage(playerid, COR_AMARELO, string);
			if(hab[0] == 0){
			    SendClientMessage(plid, COR_AZUL, "Habilitação de Carros e Motos: NÂO");
			}
			if(hab[0] == 1){
			    SendClientMessage(plid, COR_INSTRUTOR, "Habilitação de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(plid, COR_AZUL, "Habilitação Náutica: NÂO");
			}
			if(hab[1] == 1){
			    SendClientMessage(plid, COR_INSTRUTOR, "Habilitação Náutica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(plid, COR_AZUL, "Habilitação Aérea: NÂO");
			}
			if(hab[2] == 1){
			    SendClientMessage(plid, COR_INSTRUTOR, "Habilitação Aérea: SIM");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COR_AMARELO, string);
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não existe");
		}
		return 1;
	}

	if(strcmp(cmd, "/sethaero", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção aerea concedida.");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção aerea concedida.");
			    SendClientMessage(plid, COR_INSTRUTOR, "Você recebeu a habilitação de direção aerea.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}


	if(strcmp(cmd, "/sethterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção terrestre concedida.");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção terrestre concedida.");
			    SendClientMessage(plid, COR_INSTRUTOR, "Você recebeu a habilitação de direção de carros e motos.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}
    
	if(strcmp(cmd, "/sethnautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção náutica concedida.");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_INSTRUTOR, "Habilitação de direção náutica concedida.");
			    SendClientMessage(plid, COR_INSTRUTOR, "Você recebeu a habilitação de direção náutica.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}
    
	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == POLICIAL_NARCOTICOS || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == COP_FBI || Profissao[playerid] == EXERCITO|| Profissao[playerid] == PREFEITO || Profissao[playerid] == GOVERNADOR || Profissao[playerid] == PRESIDENTE  || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new distancia;
	    	new string[256];
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/prender [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(distancia > 10){
			        SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(distancia <= 10){
					Presos[plid] = 1;
				    udb_setPrisao(PlayerName(plid), 1);
					LogarPlayer(plid);
					format(string, sizeof(string), "Você foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COR_SEGURANCA, string);
				    SendClientMessage(playerid, COR_VERDE, "Prisão concluida");
					return 1;
				}
				return 1;
			}
			else{
    	        SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
			}
			return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != POLICIAL_NARCOTICOS || Profissao[playerid] != COP_FBI || Profissao[playerid] != EXERCITO||  Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
		return 1;
	}
	



		
    if(strcmp(cmd, "/fianca", true) == 0) {
		Presos[playerid] = 0;
		udb_setPrisao(PlayerName(playerid), 0);
		LogarPlayer(playerid);
		SendClientMessage(playerid, COR_AZUL, "Você pagou a fiança no valor de $1500 e foi solto.");
		udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 1500);
		return 1;
	}
    if (strcmp("/noticia", cmdtext, true, 10) == 0){
		if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
          new tmp[256];
		  new msg[256];
		  tmp = strtok(cmdtext,idx);
          strmid(tmp,cmdtext,8, strlen(cmdtext));
          if(!strlen(tmp)){
          SendClientMessage(playerid, COR_JORNALISTA, "/noticia [texto]");
          return 1;
          }
          format(msg,sizeof(msg),"Jornal do %s informando a todos:",PlayerName(playerid));
          SendClientMessageToAll(COR_AMARELOB,msg);
          SendClientMessageToAll(COR_BRANCO,tmp);
          return 1;
        }
		else{
			 SendClientMessage(playerid,COR_MOTORISTA,"Voce nao tem permissao");
			 return 1;
			 }
	}
	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == COP_ELITE || Profissao[playerid] == PREFEITO || Profissao[playerid] == GOVERNADOR || Profissao[playerid] == PRESIDENTE || Profissao[playerid] == COP_FBI || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/soltar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    Presos[plid] = 0;
			    udb_setPrisao(PlayerName(plid), 0);
			    LogarPlayer(plid);
			    new msg[256];
			    format(msg,sizeof(msg),"%s lhe tirou da prisão",PlayerName(playerid));
			    SendClientMessage(plid, COR_BRANCO,msg);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != COP_ELITE || Profissao[playerid] != PREFEITO || Profissao[playerid] != GOVERNADOR || Profissao[playerid] != PRESIDENTE || Profissao[playerid] != COP_FBI){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
	}
	if(strcmp(cmd,"/anunciar",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,10,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/anunciar [texto]");
				return 1;
			} else {
			    format(msg,sizeof(msg),"Anuncio feito por %s:",PlayerName(playerid));
			    SendClientMessageToAll(COR_JORNALISTA,msg);
			    GameTextForAll(tmp,5000,0);
			}
			return 1;
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
		}
		return 1;
	}
    if (strcmp("/noticia", cmdtext, true, 10) == 0){
          if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
			 new tmp[256];
			 new msg[256];
			 tmp = strtok(cmdtext,idx);
			 strmid(tmp,cmdtext,8, strlen(cmdtext));
			 if(!strlen(tmp)){
			 SendClientMessage(playerid, COR_PRESIDENTE, "/noticia [texto]");
			 return 1;
			 }
			 if(Profissao[playerid] != JORNALISTA || !IsPlayerAdmin(playerid)){
			 SendClientMessage(playerid, COR_PRESIDENTE,"Voce nao tem permissao");
			 return 1;
			 }
			 else{
			 format(msg,sizeof(msg),"Jornal do %s informando",PlayerName(playerid));
			 SendClientMessageToAll(COR_ADVOGADO,msg);
			 SendClientMessageToAll(COR_JORNALISTA,tmp);
			 return 1;
			 }
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
				SendClientMessage(playerid, COR_VERMELHO, "/setprof [id] [prof]");
				return 1;
			}
        	plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setprof [id] [prof]");
				return 1;
			}
        	prof = strval(tmp);
        	if(IsPlayerConnected(plid)){
            	if(prof > 0 && prof < 70){
					udb_setProf(PlayerName(plid), prof);
					format(string, sizeof(string), "Você mudou a profissão de %s para %s(id:%d)", PlayerName(plid),profname[prof],prof);
					SendClientMessage(playerid, COR_MEDICO, string);
					format(string, sizeof(string), "Você mudou sua profissao para %s para mais informaçoes digite /trabalho e /profissao", profname[prof]);
					new msg[256];
					format(msg,256,"~w~ %s",profname[prof]);
					GameTextForPlayer(plid,msg,5000,0);
					SendClientMessage(plid, COR_MEDICO, string);
					Profissao[plid] = prof;
					LogarPlayer(plid);
					TogglePlayerControllable(plid,0);
					SetTimerEx("setprof",1000,false,"d",plid);
					return 1;
				}
				else{
			    	SendClientMessage(playerid, COR_VERMELHO, "Essa não é uma profisssão válida!");
				}
				return 1;
			}
			else{
		    	SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
			}
		}
		else
		{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
		}
		return 1;
	}

	if (strcmp(cmd, "/pt", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 3, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pt [texto]");
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

	if (strcmp(cmd, "/profissao", true)==0){
		if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Taxista");
			SendClientMessage(playerid, COR_TAXISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_TAXISTA, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Vendedor de Carros");
			SendClientMessage(playerid, COR_VENDEDOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VENDEDOR, "/setcar [id-do-carro] [rotação] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, COR_VENDEDOR, "/setskin [id-da-pessoa] [id-do-skin] : Vende um skin para alguma pessoa.");
			SendClientMessage(playerid, COR_VENDEDOR, "/vendercarro : Vende um carro recebendo $2000 OBS:voce tem que estar na area de venda.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Corretor de Imoveis");
			SendClientMessage(playerid, COR_CORRETOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_CORRETOR, "/casa [nick] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Barman");
			SendClientMessage(playerid, COR_BARMAN, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_BARMAN, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Juiz");
			SendClientMessage(playerid, COR_JUIZ, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_JUIZ, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_JUIZ, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_JUIZ, "/julgar [id] [julgamento] : Decide o julgamento de alguem.");
			SendClientMessage(playerid, COR_JUIZ, "/culpado [id] : Declara alguem culpado.");
			SendClientMessage(playerid, COR_JUIZ, "/inocente [id] : Declara alguem inocente.");
		}
		else if(Profissao[playerid] == COP_CIVIL) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão Policia Civil");
			SendClientMessage(playerid, COR_COP_CIVIL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_COP_CIVIL, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COR_COP_CIVIL, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/barreira : Adiciona uma barreira no local onde estiver.");
		}	
		else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão Policia Rodoviaria");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/barreira : Adiciona uma barreira no local onde estiver.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/cone : Adiciona um cone no local onde estiver.");
			
        }
		else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - SWAT");
			SendClientMessage(playerid, COR_COP_ELITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_COP_ELITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_COP_ELITE, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_COP_ELITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COR_COP_ELITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_ELITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_ELITE, "/multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_COP_ELITE, "/resgatar [id] :Resgata alguem do sequestro.");
			SendClientMessage(playerid, COR_COP_ELITE, "/barreira : Adiciona uma barreira no local onde estiver.");
		}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Instrutor de Direção");
			SendClientMessage(playerid, COR_INSTRUTOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_INSTRUTOR, "/sethaero : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COR_INSTRUTOR, "/sethterrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COR_INSTRUTOR, "/sethnautica : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
        }
		else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Pescador");
		    SendClientMessage(playerid, COR_PESCADOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_PESCADOR, "/pescar : Joga a rede para pesca, para isso é preciso estar na área de pesca.");
		    SendClientMessage(playerid, COR_PESCADOR, "/vendepesca : Vende todas as suas pescas acumuladas, é preciso estar na cooperativa de pesca.");
		    SendClientMessage(playerid, COR_PESCADOR, "Se você vender sua pesca como pescador, ganhará $30 de lucro em cada pesca.");
		}
		else if(Profissao[playerid] == EXERCITO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Exercito");
			SendClientMessage(playerid, COR_EXERCITO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_EXERCITO, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_EXERCITO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_EXERCITO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_EXERCITO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_EXERCITO, "/multar [id] [amount] : Multar uma pessoa.");
            SendClientMessage(playerid, COR_EXERCITO, "/barreira : Adiciona uma barreira no local onde estiver.");
		}
		else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COR_BRANCO, "Jornalista - Comandos - Jornalista");
		    SendClientMessage(playerid, COR_JORNALISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_JORNALISTA, "/noticia [texto] : Publica uma notícia.");
		    SendClientMessage(playerid, COR_JORNALISTA, "/anunciar [texto] : Publica um anuncio.");
		}
		else if(Profissao[playerid] == POLICIAL_NARCOTICOS) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissao - Narcoticos");
		    SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/examead [id] :  Faz o exame anti-dopping em um jogador.");
		    SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "/prender [id] : Prende uma pessoa na cadeia para aguardar o julgamento.");
		}
		else if(Profissao[playerid] == MEDICO) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissao - Médico");
		    SendClientMessage(playerid, COR_MEDICO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_MEDICO, "/enchervida [ID] : Enche a vida do jogador(a)");
        }
        else if(Profissao[playerid] == ESTADUAL) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Deputado Estadual");
			SendClientMessage(playerid, COR_ESTADUAL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_ESTADUAL, "/procurar [id]: Bota alguem na lista de procurados");
			SendClientMessage(playerid, COR_ESTADUAL, "/desprocurar : Tira alguem da lista de procurados");
        }
		else if(Profissao[playerid] == FEDERAL) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Deputado Federal");
			SendClientMessage(playerid, COR_FEDERAL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_FEDERAL, "/procurar [id] :Bota alguem na lista de procurados");
            SendClientMessage(playerid, COR_FEDERAL, "/desprocurar [id] :Tira alguem da lista de procurados");
        }
		else if(Profissao[playerid] == PREFEITO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Prefeito");
			SendClientMessage(playerid, COR_PREFEITO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_PREFEITO, "/prender [id] :  Prende alguem");
			SendClientMessage(playerid, COR_PREFEITO, "/soltar [id] : Solta alguem da prisão");
			SendClientMessage(playerid, COR_PREFEITO, "/procurar [id] :Bota alguem na lista de procurados");
            SendClientMessage(playerid, COR_PREFEITO, "/desprocurar [id] :Tira alguem da lista de procurados");
        }
		else if(Profissao[playerid] == GOVERNADOR) {
            SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Governador");
		    SendClientMessage(playerid, COR_GOVERNADOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_GOVERNADOR, "/prender [id] : Prende alguem");
		    SendClientMessage(playerid, COR_GOVERNADOR, "/soltar [id] : Solta alguem da prisão");
		    SendClientMessage(playerid, COR_GOVERNADOR, "/procurar [id] :Bota alguem na lista de procurados");
            SendClientMessage(playerid, COR_GOVERNADOR, "/desprocurar [id] :Tira alguem da lista de procurados");
        }
		else if(Profissao[playerid] == PRESIDENTE) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Presidente");
		    SendClientMessage(playerid, COR_PRESIDENTE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_PRESIDENTE, "/prender [id] : Prende alguem");
		    SendClientMessage(playerid, COR_PRESIDENTE, "/soltar [id] : Solta alguem da prisão");
		    SendClientMessage(playerid, COR_PRESIDENTE, "/procurar [id] : Bota alguem na lista de procurados");
            SendClientMessage(playerid, COR_PRESIDENTE, "/desprocurar [id] : Tira alguem da lista de procurados");
            SendClientMessage(playerid, COR_PRESIDENTE, "/comunicar [mensagem] :Comunica algo ao povo");
        }
		else if(Profissao[playerid] == LADRAO) {
            SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Ladrão");
		    SendClientMessage(playerid, COR_LADRAO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_LADRAO, "/roubar [id] [quantia] : Roubar alguem");
		    SendClientMessage(playerid, COR_LADRAO, "/estrupar [id] : Estrupa uma puta sem precisar paga-la");
		}
		else if(Profissao[playerid] == ASSALTANTE) {
            SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Assaltante");
		    SendClientMessage(playerid, COR_ASSALTANTE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_ASSALTANTE, "/roubar [id] [quantia] : Roubar alguem");
		    SendClientMessage(playerid, COR_ASSALTANTE, "/estrupar [id] : Estrupa uma puta sem precisar paga-la");
        }
		else if(Profissao[playerid] == MESTRE_DO_ROUBO) {
            SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Mestre do Roubo");
		    SendClientMessage(playerid, COR_MESTRE_DO_ROUBO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_MESTRE_DO_ROUBO, "/roubar [id] [quantia] : Roubar alguem");
            SendClientMessage(playerid, COR_MESTRE_DO_ROUBO, "/desmanche : Entrega um carro para o desmanche");
            SendClientMessage(playerid, COR_MESTRE_DO_ROUBO, "/estrupar [id] : Estrupa uma puta sem precisar paga-la");
		}
		else if(Profissao[playerid] == GENIO_DO_CRIME) {
            SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Genio do Crime");
		    SendClientMessage(playerid, COR_GENIO_DO_CRIME, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_GENIO_DO_CRIME, "/roubar [id] : Roubar alguem");
            SendClientMessage(playerid, COR_GENIO_DO_CRIME, "/desprender [id]  : Tira alguem da cadeia sem permissão da policia OBS:se usado em voce mesmo sera demitido");
            SendClientMessage(playerid, COR_GENIO_DO_CRIME, "/sequestrar [id]  : Para sequestrar alguem");
            SendClientMessage(playerid, COR_GENIO_DO_CRIME, "/desequestrar [id]  : Tira alguem do sequestro");
            SendClientMessage(playerid, COR_GENIO_DO_CRIME, "/estrupar [id] : Estrupa uma puta sem precisar paga-la");
		}
		if(Profissao[playerid] == TRAFICANTE) {
	        SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Traficante");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/cocaina [id] [quantidade] : Vende cocaína para um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/heroina [id] [quantidade] : Aplica uma injeção de heroína em um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/maconha [id] [quantidade] : Vende maconha para um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/crack [id] [quantidade] : Vende crack para um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/bagulho [quantidade] : Compra um bagulho para vender as drogas.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/portao : Ve as opções do portao da fabrica de drogas.");
         }
		else if(Profissao[playerid] == COP_FBI) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - FBI");
			SendClientMessage(playerid, COR_COP_FBI, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_COP_FBI, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_COP_FBI, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_COP_FBI, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_FBI, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_FBI, "/multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_COP_FBI, "/barreira : Adiciona uma barreira no local onde estiver.");
         }
		else if(Profissao[playerid] == MECANICO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Mecanico");
			SendClientMessage(playerid, COR_MECANICO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MECANICO, "/consertar [id]: Conserta um carro (Voce tem que estar dentro dele).");
			SendClientMessage(playerid, COR_MECANICO, "/pintar [cor1] [cor2] :  Pinta um carro (Voce tem que estar dentro dele).");
			SendClientMessage(playerid, COR_MECANICO, "/gasolina [id] : Vende gasolina para alguem.");
			SendClientMessage(playerid, COR_MECANICO, "/lavar [id] : Lava o carro de alguem.");
			SendClientMessage(playerid, COR_MECANICO, "/placa [id] [nome] : Troca a placa do carro de alguem.");
         }
		else if(Profissao[playerid] == POLICIA_FLORESTAL) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Policia Florestal");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/multar [id] :  Multa Alguem.");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
         }
		else if(Profissao[playerid] == CONFISCADOR_CARROS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Fiscal de Carros e Habilitações");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/confiscar [id] :  Confisca o carro de algum jogador.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/liberar : Libera um carro OBS: tem que estar dentro dele.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/tiraraero [id]: Tira a habilitação Aerea de alguem.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/tirarterrestre [id] :  Tira a habilitação Terrestre de alguem.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/tirarnautica [id] : Tira a habilitação Nautica de alguem.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/multar [id] [quantia] : multa quem estiver em alta velocidade ou sem carteira.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "/radar : Vê as opçoes de radares.");
		 }
		else if(Profissao[playerid] == IBAMA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - IBAMA");
			SendClientMessage(playerid, COR_IBAMA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_IBAMA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_IBAMA, "/multar [id] : Multa alguem.");
			SendClientMessage(playerid, COR_IBAMA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_IBAMA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
        }
		else if(Profissao[playerid] == PUTA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Puta");
			SendClientMessage(playerid, COR_PUTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_PUTA, "/dar [id] : Da pra alguem.");
			SendClientMessage(playerid, COR_PUTA, "/chupar [id] : Chupa o pênis de alguem.");
        }
		else if(Profissao[playerid] == ONIBUS_VIAGEM) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Onibus de Viagem");
			SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/passagem [id] : Vende uma passagem para alguem");
            SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/recolherpass [id] : Recolhe a passagem de alguem");
            SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/verpassagem [id] : Ve se alguem tem passagem ou nao");
            SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/progressosflv : Ve o progresso da viagem de SF até LV");
            SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "/progressolvsf [id] : Ve o progresso da viagem de LV até SF");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Vendedor de Armas");
			SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/arma [id] [id da arma]  : Vender Arma para alguem");
            SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/colete [id] : Vender Colete para alguem");
			SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/armas   : Vê a Lista de Armas :");
			SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/armas2  : Vê a Lista de Armas :");
            SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/armas3  : Vê a Lista de Armas :");
            SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/armas4  : Vê a Lista de Armas :");
            SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/armas5  : Vê a Lista de Armas :");
        }
		else if(Profissao[playerid] == CAFETAO){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Cafetao");
			SendClientMessage(playerid, COR_CAFETAO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_CAFETAO, "/infoputa [local] [grana] : Avisa as putas pra irem para um lugar oferecendo grana");
		}
		else if(Profissao[playerid] == MOTORISTA_FUGA){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Motorista de Fuga");
			SendClientMessage(playerid, COR_MOTORISTA_FUGA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_MOTORISTA_FUGA, "/roubar [id] : Para roubar alguem");
            SendClientMessage(playerid, COR_MOTORISTA_FUGA, "/desmanche : Vende algum carro pro desmanche");
        }
		else if(Profissao[playerid] == SEGURANCA_DE_CARROS){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Segurança de Carros");
			SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "/estacionamento : Abre e Fecha os portoes do estacionamento do banco de SF");
			SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "/alarme [id] : Bota alarme num carro");
			SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "/talarme [id] : Tira alarme de um carro");
        }
		else if(Profissao[playerid] == LADRAO_DE_CARROS){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Ladrão de Carros");
			SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "/desmanche : Entrega um carro pro desmanche");
			SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "/dalarme : Destroi um alarme de um carro");
        }
        else if(Profissao[playerid] == ADVOGADO) {
	        SendClientMessage(playerid, COR_BRANCO, "Advogado - Comandos:");
	        SendClientMessage(playerid, COR_ADVOGADO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_ADVOGADO, "/defender [texto]  : manda uma mensagem de defesa.");
	        SendClientMessage(playerid, COR_ADVOGADO, "/acusar [texto]  : Acusa o jogador.");
	        SendClientMessage(playerid, COR_ADVOGADO, "/pedir [texto] : pedi algo ex:Condicional.");
	        SendClientMessage(playerid, COR_ADVOGADO, "/processo [ nome do réu e descrição da causa ] - para entrar em um caso.");
        }
		else if(Profissao[playerid] == DETETIVE){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Detetive");
			SendClientMessage(playerid, COR_DETETIVE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_DETETIVE, "/disfarcar : Se disfarça  para investigar o crime");
			SendClientMessage(playerid, COR_DETETIVE, "/revelar : sai do seu disfarçe");
        }
		else if(Profissao[playerid] == INSTRUTOR_LADRAO){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Ensinador do Crime");
			SendClientMessage(playerid, COR_INSTRUTOR_LADRAO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_INSTRUTOR_LADRAO, "Sua profissão não tem nenhum comando especial!");
        }
		else if(Profissao[playerid] == INSTRUTOR_COP){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Instrutor Militar");
			SendClientMessage(playerid, COR_INSTRUTOR_COP, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_INSTRUTOR_COP, "Sua profissão não tem nenhum comando especial!");
        }
		else if(Profissao[playerid] == JUIZ_DE_CORRIDA){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Juiz De Corrida");
			SendClientMessage(playerid, COR_JUIZ_DE_CORRIDA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_JUIZ_DE_CORRIDA, "/evento [local] : Organiza evento em um lugar");
			SendClientMessage(playerid, COR_JUIZ_DE_CORRIDA, "/corrida [local] : Organiza corrida em um lugar");
        }
		else if(Profissao[playerid] == BOMBEIRO){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Bombeiro");
			SendClientMessage(playerid, COR_BOMBEIRO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_BOMBEIRO, "/evacuar : Pede a todos os cidadaos evacuarem do fogo");
			SendClientMessage(playerid, COR_BOMBEIRO, "/chamarbombeiros [local] : Pede reforços de bombeiro para o local de incendio");
        }
		else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Motorista de Onibus");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/terminais : Ve as opçoes de terminais");
        }
		else if(Profissao[playerid] == SEGURANÇA){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Segurança");
			SendClientMessage(playerid, COR_SEGURANCA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_SEGURANCA, "Sua profissão não tem nenhum comando especial!");
        }
		else if(Profissao[playerid] == ASSASSINO){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Assassino");
			SendClientMessage(playerid, COR_ASSASSINO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_ASSASSINO, "/sequestrar [id] : Sequestra alguem");
            SendClientMessage(playerid, COR_ASSASSINO, "/estrupar [id] : Estrupa uma puta sem precisar pagar nada");
        }
		else if(Profissao[playerid] == DESEMPREGADO){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Desempregado");
			SendClientMessage(playerid, COR_DESEMPREGADO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_DESEMPREGADO, "Sua profissão não tem nenhum comando especial!");
        }
		else if(Profissao[playerid] == TAXISTA_AEREO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Taxista Aereo");
			SendClientMessage(playerid, COR_TAXI_AEREO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_TAXI_AEREO, "/ataxi [id] : Liga o Taximetro OBS: O Passageiro tem que estar em seu veiculo aereo");
		}
		else if(Profissao[playerid] == MOTOTAXISTA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Mototaxista");
			SendClientMessage(playerid, COR_MOTOTAXISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MOTOTAXISTA, "/mtaxi [id] : Liga o Taximetro OBS: O Passageiro tem que estar em sua moto");
		}
		else if(Profissao[playerid] == MOTORISTA_PARTICULAR){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Motorista Particular");
			SendClientMessage(playerid, COR_MOTORISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MOTORISTA, "/alugarlimo : Aluga uma limosine OBS:Você tem que estar na companhia de limosines");
			SendClientMessage(playerid, COR_MOTORISTA, "/devolverlimo : Devolve uma limosine para a companhia de limosines");
			SendClientMessage(playerid, COR_MOTORISTA, "/lavarlimo : Lava uma limosine OBS:Voce tem que estar na companhia ou lavar com um mecanico");
        }
        else if(Profissao[playerid] == ALUGUEL_DE_CARROS){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - Locador de Carros");
			SendClientMessage(playerid, COR_MOTORISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MOTORISTA, "/locar [id] [tempo] : Loca carro por um tempo em minutos para alguem");
            SendClientMessage(playerid, COR_MOTORISTA, "/alugueis : Vê a lista de pessoas que locaram um carro");
		}
		
		return 1;
	}
	if (strcmp(cmd, "/trabalho", true)==0){
		if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Taxista");
			SendClientMessage(playerid, COR_TAXISTA, "Isso é muito simples pegue os passageiros e leve ate o local desejado");
			SendClientMessage(playerid, COR_TAXISTA, "Os passageiros pedirão taxi atraves do /taxi que lhe informara o local.");
            SendClientMessage(playerid, COR_TAXISTA, "Quando um Passageiro estiver em seu taxi digite /taxi para ativar o Taximetro.");
		}
		   
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Vendedor de Carros");
			SendClientMessage(playerid, COR_VENDEDOR, "Venda carros para os outros.Va na posição onde o carro deve ficar faça /setcar");
			SendClientMessage(playerid, COR_VENDEDOR, "/setcar [id-do-carro]Id do veiculo voce acha esses ids facilmente em sites de clans de SA-MP .");
		 	SendClientMessage(playerid, COR_VENDEDOR, "[rotação]a rotação do carro [nick]O nome de quem vai ficar o carro [cor1] [cor2]os ids das cores que voce acha com os ids tambem");
            SendClientMessage(playerid, COR_VENDEDOR, "OBS:Preços Altos ou Baixos Poderão te demitir desta profissao.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Corretor de Imoveis");
			SendClientMessage(playerid, COR_CORRETOR, "é muito simples venda casas setando exatamente na posição onde voce estiver com /casa");
			SendClientMessage(playerid, COR_CORRETOR, "OBS:Preços Altos ou Baixos Poderão te demitir desta profissao.");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Barman");
			SendClientMessage(playerid, COR_BARMAN, "Isso é muito simples venda bebidas aos outros com /selldrink");
			SendClientMessage(playerid, COR_BARMAN, "Sugestão:Venda as bebidas por 50 ou 100 dolares");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Juiz");
			SendClientMessage(playerid, COR_JUIZ, "Decida crimes no tribunal e decida quem sera preso (para prender faça /prender)");
			SendClientMessage(playerid, COR_JUIZ, "e decida quem estara livre da prisão(/soltar para soltar alguem da prisao).");
			SendClientMessage(playerid, COR_JUIZ, "OBS:ajudas nos tribunais serao dadas apenas por Advogados e Detetives.");
		}
		else if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == COP_FBI || Profissao[playerid] == EXERCITO) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um policial");
			SendClientMessage(playerid, COR_COP_CIVIL, "Livre as pessoas dos crimes das cidades que sao feitas provavelmente pelas profissoes");
			SendClientMessage(playerid, COR_COP_CIVIL, "do Comando /ladrao e de multas a quem nao tem carteira de motorista ou dirige rapido ou devagar.");
		}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Instrutor de Direção");
			SendClientMessage(playerid, COR_INSTRUTOR, "Organize testes da auto escola venda as habilitaçoes.");
			SendClientMessage(playerid, COR_INSTRUTOR, "OBS :em testes de Habilitação terrestre nao é preciso respeitar sinais de transito.");
        }
		else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COR_BRANCO, "Como ser um Pescador");
		    SendClientMessage(playerid, COR_PESCADOR, "Pesque muitos peixes e venda pois voce lucra mais quando é pescador");
		    SendClientMessage(playerid, COR_PESCADOR, "OBS:Tente pescar sem os IBAMAS perceberem pois o que vale nessa profissao é a pescaria.");
        }
		else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COR_BRANCO, "Como ser um Jornalista");
		    SendClientMessage(playerid, COR_JORNALISTA, "Entreviste muitas pessoas.Fale muitas noticias sobre o crime e ate sobre a hora");
		    SendClientMessage(playerid, COR_JORNALISTA, "OBS:Pessoas Ricas gostam de ter sua propria entrevista.");
		}
		else if(Profissao[playerid] == POLICIAL_NARCOTICOS) {
		    SendClientMessage(playerid, COR_BRANCO, "Como ser um Narcotico");
		    SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Livre o povo das drogas e das armas. Prendendo traficantes e vendedor de armas,multando e prendendo quem usa as drogas");
		    SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "OBS:Isso depende da quantia que voce descobre usando o comando /examead.");
		}
		else if(Profissao[playerid] == MEDICO) {
		    SendClientMessage(playerid, COR_BRANCO, "Como ser um  Médico");
		    SendClientMessage(playerid, COR_BRANCO, "Nao é dificil ser medico apenas vender curativos que pedirao com o comando /192");
        }
        else if(Profissao[playerid] == ESTADUAL || Profissao[playerid] == FEDERAL || Profissao[playerid] == PREFEITO || Profissao[playerid] == GOVERNADOR || Profissao[playerid] == PRESIDENTE) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Politico");
			SendClientMessage(playerid, COR_PRESIDENTE, "Ganhe os votos do povo Alertando cops,mandando anuncios com jornalistas para");
            SendClientMessage(playerid, COR_PRESIDENTE, "Ficarem longe das drogas");
			SendClientMessage(playerid, COR_PRESIDENTE, "OBS:Nao seixe que os outros jogadores que nao sao das profissoes /ladrao se envolvam em crimes");
        }
		else if(Profissao[playerid] == LADRAO || Profissao[playerid] == ASSALTANTE || Profissao[playerid] == MESTRE_DO_ROUBO || Profissao[playerid] == GENIO_DO_CRIME || Profissao[playerid] == ASSASSINO) {
            SendClientMessage(playerid, COR_BRANCO, "Como ser um Criminoso");
		    SendClientMessage(playerid, COR_LADRAO, "Cometa crimes pela cidade matando,roubando etc...(coisas que atrapalhem eles no rpg)");
		    SendClientMessage(playerid, COR_LADRAO, "OBS:A promoção vem atraves do roubo e da quantia de mortos,faça teste com um Ensinador do Crime");
		}
		if(Profissao[playerid] == TRAFICANTE) {
	        SendClientMessage(playerid, COR_BRANCO, "Como ser um  Traficante");
	        SendClientMessage(playerid, COR_TRAFICANTE, "Compre bagulhos para vender drogas com os seguintes comandos");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/cocaina [id] [quantidade] : Vende cocaína para um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/heroina [id] [quantidade] : Aplica uma injeção de heroína em um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/maconha [id] [quantidade] : Vende maconha para um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/crack [id] [quantidade] : Vende crack para um jogador.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "Sugestao:Venda as drogas por 50 ou 100 a dose.");
         }
		else if(Profissao[playerid] == MECANICO) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Mecanico");
			SendClientMessage(playerid, COR_MECANICO, "Conserte,pinte e bote gasolina nos veiculos");
			SendClientMessage(playerid, COR_MECANICO, "Sugestao: Conserte um veiculo por 150 ate 300 dolares.");
			SendClientMessage(playerid, COR_MECANICO, "Sugestao: Pinte um veiculo por 150 ate 300 dolares.");
			SendClientMessage(playerid, COR_MECANICO, "Sugestao: De gasolina a alguem pelo dobro do que ela ira pagar no posto.");
         }
		else if(Profissao[playerid] == POLICIA_FLORESTAL) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Guarda Florestal");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "Prenda,multe os caçadores que estiverem caçando fora da epoca");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "OBS:Prender ou Multar é dependido do que caçar.");
         }
		else if(Profissao[playerid] == CONFISCADOR_CARROS) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Fiscal de Carros e Habilitações");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "Confisque os carros daqueles que estao sem habilitaçoes e andando rapido");
            SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "Tire as habilitaçoes de quem estiver andando rapido,atropelando ou andando com carro roubado.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "Sugestao: Assim que Confiscar um veiculo peça para o dono lhe pagar para devolver seu carro.");
			SendClientMessage(playerid, COR_CONFISCADOR_CARROS, "Sugestao: Cobre de 50 a 150 dolares pela devolução.");
		 }
		else if(Profissao[playerid] == IBAMA) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um IBAMA");
			SendClientMessage(playerid, COR_IBAMA, "prenda ou multe quem estiver pescando fora da epoca OBS:dependente da quantidade");
			SendClientMessage(playerid, COR_IBAMA, "Sugestoes:Passe muitas vezes pela area de pesca.");
        }
		else if(Profissao[playerid] == PUTA) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser uma Puta");
			SendClientMessage(playerid, COR_PUTA, "O cafetao lhe mandara para alguem para voce dar ou chupar.Veja os comandos no /profissao");
			SendClientMessage(playerid, COR_PUTA, "OBS:Se voce dar voce ganha 1000 dolares");
			SendClientMessage(playerid, COR_PUTA, "OBS:Se voce chupar voce ganha 1200 dolares.");
        }
		else if(Profissao[playerid] == ONIBUS_VIAGEM) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Onibus de Viagem");
			SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "Venda passagens de onibus e tenha total contato com as rodoviarias do mapa");
			SendClientMessage(playerid, COR_ONIBUS_VIAGEM, "Sugestão: Cobre 200 dolares pela passagem");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Vendedor de Armas");
			SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "Venda as armas e fuja para nao denunciarem o trafico para os policiais");
			SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "Mesmo tendo uma lista de preços venda por mais barato para roubar a freguesia de outro vendedor");
            SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "OBS:Sugestoes de Preçoes sendo feitas no /arma :");
        }
		else if(Profissao[playerid] == TAXISTA_AEREO){
		    SendClientMessage(playerid, COR_BRANCO, "Como ser um Taxista Aereo:");
		    SendClientMessage(playerid, COR_TAXI_AEREO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_TAXI_AEREO, "/ataxi [id] : Começa a rodar o taxímetro aéreo (o passageiro tem que estar no seu veículo);");
		}
		else if(Profissao[playerid] == MOTOTAXISTA){
		    SendClientMessage(playerid, COR_BRANCO, "Como ser um Mototaxista:");
		    SendClientMessage(playerid, COR_MOTOTAXISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_MOTOTAXISTA, "/mtaxi [id] : Começa a rodar o moto-taxímetro (o passageiro tem que estar em sua moto.");
		}
		else if(Profissao[playerid] == CAFETAO){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Cafetao");
			SendClientMessage(playerid, COR_CAFETAO, "Contrate putas para melhorar o clube quando alguem pedir uma");
			SendClientMessage(playerid, COR_CAFETAO, "Contrate um bom motorista para que lhe peçam mais pelo bom serviço");
		}
		else if(Profissao[playerid] == MOTORISTA_FUGA){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Motorista de Fuga");
			SendClientMessage(playerid, COR_MOTORISTA_FUGA, "Combine taticas com ladrao ajudando eles nos roubos");
			SendClientMessage(playerid, COR_MOTORISTA_FUGA, "e saiba um bom lugar para se esconder e fugir da policia");
        }
		else if(Profissao[playerid] == SEGURANCA_DE_CARROS){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Segurança de Carros");
			SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "Proteja se carro dos ladroes de carros e peça gorjeta com");
			SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "/gorjeta para seu chefe caso ele nao lhe pague nao proteja mais o carro dele");
        }
		else if(Profissao[playerid] == LADRAO_DE_CARROS){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Ladrão de Carros");
			SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "Roube carros e mande par ao desmanche com /desmanche");
			SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "Dica: Se descobrir onde fica o desmanche nao conte para os outros ladroes de carros");
        }
		else if(Profissao[playerid] == ADVOGADO){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Advogado");
			SendClientMessage(playerid, COR_ADVOGADO, "Seja um bom defensor e explique ao Juiz mesmo seu cliente se for culpado");
			SendClientMessage(playerid, COR_ADVOGADO, "Tente o defendo pois quanto melhor defensor voce for mais sera contratado e recebera");
        }
		else if(Profissao[playerid] == DETETIVE){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Detetive");
			SendClientMessage(playerid, COR_DETETIVE, "Ajude os outros no tribunal tirando fotos do crime e dizendo EU TENHO PROVAS");
			SendClientMessage(playerid, COR_DETETIVE, "mas nao sao apenas tribunais comunique aos admins os cheaters e lhe daremos um bom pagamento");
			SendClientMessage(playerid, COR_DETETIVE, "OBS:Nos comunique as provas pelo msn e caso seja de algum cheater ´podera sair no site");
        }
		else if(Profissao[playerid] == INSTRUTOR_LADRAO){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Ensinador do Crime");
			SendClientMessage(playerid, COR_INSTRUTOR_LADRAO, "Faça testes de ladroes para promoção quanto maior nivel mais dificil serao os testes");
			SendClientMessage(playerid, COR_INSTRUTOR_LADRAO, "Dica:Cobre de:assassino pra ladrao:$1000,ladrao pra assaltante:$1300,aassaltante pra mestre do roubo:$1600 e assim vai...");
        }
		else if(Profissao[playerid] == INSTRUTOR_COP){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Instrutor Militar");
			SendClientMessage(playerid, COR_INSTRUTOR_COP, "Faça testes de policiais para promoção quanto maior nivel mais dificil serao os testes");
			SendClientMessage(playerid, COR_INSTRUTOR_COP, "Dica:Cobre de:Militar pra Rodoviario:$1000,Rodoviario pra SWAT:$1300,SWAT pra FBI:$1600 e assim vai...");
        }
		else if(Profissao[playerid] == JUIZ_DE_CORRIDA){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Juiz De Corrida");
			SendClientMessage(playerid, COR_JUIZ_DE_CORRIDA, "/pt [texto] : Organize eventos de corrida ou ate outro tipo.");
			SendClientMessage(playerid, COR_JUIZ_DE_CORRIDA, "Dica:peça que todos lhe paguem uma quantia.No final voce e o vencedor dividem o premio");
        }
		else if(Profissao[playerid] == BOMBEIRO){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Bombeiro");
			SendClientMessage(playerid, COR_BOMBEIRO, "Livre a cidade do fogo e ajude aqueles que estao perdidos sem nenhum carro(POR UMA GRANA É CLARO)");
			SendClientMessage(playerid, COR_BOMBEIRO, "Sugestao: a cada perdido cobre $300 ate $600 para ir ate ele");
        }
		else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Motorista de Onibus");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "Apenas pegue os onibus da cidade e va passando por ela entregando passageiros nos lugares");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "Dica:Cobre $50 de entrada para o onibus");
        }
		else if(Profissao[playerid] == SEGURANÇA){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Segurança");
			SendClientMessage(playerid, COR_SEGURANCA, "Defenda seu chefe dos crimes que ocorrem pela cidade e nao deixe chegarem na casa do seu chefe de jeito nenhum");
			SendClientMessage(playerid, COR_SEGURANCA, "Dica:Cobre de $700 a $1000 para ser contratado");
        }
		else if(Profissao[playerid] == DESEMPREGADO){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Desempregado");
			SendClientMessage(playerid, COR_DESEMPREGADO, "apenas peça um emprego ou esmola com /esmola");
        }
		else if(Profissao[playerid] == MOTORISTA_PARTICULAR){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Motorista Particular");
			SendClientMessage(playerid, COR_MOTORISTA, "Leve seu chefe aos lugares que ele quiser caso ele nao tenha lugar voce mesmo de ideia a ele");
			SendClientMessage(playerid, COR_MOTORISTA, "Dica:Cobre de $700 a $900 para ser contratado");
		}
		else if(Profissao[playerid] == ALUGUEL_DE_CARROS){
			SendClientMessage(playerid, COR_BRANCO, "Como ser um Locador de Carros");
			SendClientMessage(playerid, COR_MOTORISTA, "Quando os outros quiserem alugar carros va la e faça seu preço");
			SendClientMessage(playerid, COR_MOTORISTA, "Dica:Loque carros por $1000 cada");
        }
		
	    return 1;
	    }

    if(strcmp(cmd, "/enchervida", true) == 0) {
	    if(Profissao[playerid] == MEDICO) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/curativo [id]");
                return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_MEDICO, "Missão cumprida!");
			    	SendClientMessage(plid, COR_BRANCO, "Um paramédico encheu sua barra de saúde!");
			    	SetPlayerHealth(plid,100);
			    	GivePlayerMoney(plid,-20);
			    	GivePlayerMoney(playerid,20);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para aplicar o curativo!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas médicos podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd,"/progressosflv",true)==0){
	   if(Profissao[playerid] == ONIBUS_VIAGEM){
	   DisablePlayerCheckpoint(playerid);
	   SetPlayerCheckpoint(playerid,-182.4270,1019.6400,19.6817,2.5);
	   gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMSFLV;
	   SendClientMessage(playerid, COR_VERDE, "Vá para o checkpoint na rodoviaria de Forst Cason");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_AZUL, "Voce nao tem permissao");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/progressolvsf",true)==0){
	   if(Profissao[playerid] == ONIBUS_VIAGEM){
	   DisablePlayerCheckpoint(playerid);
	   SetPlayerCheckpoint(playerid,-182.4270,1019.6400,19.6817,2.5);
	   gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMSFLV;
	   SendClientMessage(playerid, COR_VERDE, "Vá para o checkpoint na rodoviaria de Forst Cason");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_AZUL, "Voce nao tem permissao");
		   return 1;
		   }
	}
	if (strcmp(cmd, "/terminais", true)==0){
		if(Profissao[playerid] == MOTORISTA_DE_ONIBUS){
		ShowMenuForPlayer(Terminais,playerid);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_BRANCO, "Voce nao tem permissao");
			return 1;
			}
	}
	if (strcmp(cmd, "/dar", true)==0){
	  if(Profissao[playerid] == PUTA){
		new tmp[256];
		new plid;
		new distance;
		new carro;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/dar [id]");
		return 1;
		}
		distance = GetDistanceBetweenPlayers(playerid,plid);
		if(distance > 10){
		SendClientMessage(playerid, COR_JUIZ, "Voce esta muito longe chegue mais perto");
		return 1;
		}
		if(GetPlayerMoney(plid) < 1000){
		SendClientMessage(playerid, COR_BRANCO, "Esse jogador nao possue grana para pagar");
		return 1;
		}
		carro = GetPlayerVehicleID(plid);
		if(IsPlayerConnected(plid)){
		if(IsPlayerInVehicle(plid,carro)){
		if(IsPlayerInVehicle(playerid,carro)){
		SetPlayerHealth(plid, 100);
		GivePlayerMoney(plid,0 - 1000);
		GivePlayerMoney(playerid,1000);
		SendClientMessage(playerid, COR_BRANCO, "O Sexo começou");
		SendClientMessage(plid, COR_BRANCO, "Voce esta comendo uma puta");
		SetTimerEx("dar",8000,false,"dd",playerid,plid);
		TogglePlayerControllable(playerid,0);
		TogglePlayerControllable(plid,0);
	    return 1;
		}
		else{
		    SendClientMessage(playerid, COR_JUIZ, "Voce deve estar em um carro");
		    return 1;
		    }
	    }
        else{
		    SendClientMessage(playerid, COR_JUIZ, "O jogador indicado nao esta em um carro");
		    return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
		    return 1;
		    }
	   }
       else{
		    SendClientMessage(playerid, COR_JUIZ, "Voce nao tem permissão");
		    return 1;
		    }
	 }
    if (strcmp(cmd, "/estrupar", true)==0){
    if(Profissao[playerid] == ASSASSINO || Profissao[playerid] == LADRAO || Profissao[playerid] == ASSALTANTE || Profissao[playerid] == MESTRE_DO_ROUBO || Profissao[playerid] == GENIO_DO_CRIME){
		new tmp[256];
		new plid;
		new veiculo;
		new distancia;
		distancia = GetDistanceBetweenPlayers(playerid,plid);
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/estrupar [id]");
		return 1;
		}
		if(Profissao[plid] != PUTA){
		SendClientMessage(playerid, COR_JUIZ, "O Jogador indicado nao é Puta");
		return 1;
		}
		if(distancia > 10){
		SendClientMessage(playerid, COR_JUIZ, "Voce esta muito longe chegue mais perto");
		return 1;
		}
		veiculo = GetPlayerVehicleID(plid);
		if(IsPlayerConnected(plid)){
		if(IsPlayerInVehicle(playerid,veiculo)){
		if(IsPlayerInVehicle(plid,veiculo)){
		SendClientMessage(playerid, COR_BRANCO, "Voce estrupou uma puta e nao precisou pagar nada");
		SendClientMessage(plid, COR_BRANCO, "Voce foi estrupada e nao recebeu nada é melhor os cafetoes nao saberem disso hein");
		return 1;
		}
	  }
		else{
		SendClientMessage(playerid, COR_JUIZ, "O jogador nao esta num veiculo");
		return 1;
		}
	}
  }
    return 1;
 }
		
	if (strcmp(cmd, "/chupar", true)==0){
	  if(Profissao[playerid] == PUTA){
		new tmp[256];
		new plid;
		new distance;
		new carro;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/chupar [id]");
		return 1;
		}
		distance = GetDistanceBetweenPlayers(playerid,plid);
		if(distance > 10){
		SendClientMessage(playerid, COR_JUIZ, "Voce esta muito longe chegue mais perto");
		return 1;
		}
		if(GetPlayerMoney(plid) < 1200){
		SendClientMessage(playerid, COR_BRANCO, "Esse jogador nao possue grana para pagar");
		return 1;
		}
		carro = GetPlayerVehicleID(plid);
		if(IsPlayerConnected(plid)){
		if(IsPlayerInVehicle(plid,carro)){
		if(IsPlayerInVehicle(playerid,carro)){
		SetPlayerHealth(plid, 100);
		GivePlayerMoney(plid,0 - 1200);
		GivePlayerMoney(playerid,1200);
		SendClientMessage(playerid, COR_BRANCO, "O Sexo começou");
		SendClientMessage(plid, COR_BRANCO, "Uma puta esta chupando seu penis");
		SetTimerEx("chupar",8000,false,"dd",playerid,plid);
		TogglePlayerControllable(playerid,0);
		TogglePlayerControllable(plid,0);
		return 1;
		}
		else{
		    SendClientMessage(playerid, COR_JUIZ, "Voce deve estar em um carro");
		    return 1;
		    }
	    }
        else{
		    SendClientMessage(playerid, COR_JUIZ, "O jogador indicado nao esta em um carro");
		    return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COR_JUIZ, "Jogador nao conectado/logado");
		    return 1;
		    }
       }
       else{
		    SendClientMessage(playerid, COR_JUIZ, "Voce nao tem permissão");
		    return 1;
		    }
	 }
      
	if (strcmp(cmdtext, "/presos", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_AMARELO, "Lista de presos");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Presos[i] == 1){
				format(string, sizeof(string), "%d: %s", i, PlayerName(i));
				SendClientMessage(i, COR_AMARELO, string);
				return 1;
			}
		}
		return 1;
	}

	if (strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == ESTADUAL || Profissao[playerid] == FEDERAL || Profissao[playerid] == PREFEITO || Profissao[playerid] == GOVERNADOR || Profissao[playerid] == PRESIDENTE || Profissao[playerid] == COP_FBI || Profissao[playerid] == POLICIA_FLORESTAL || Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
		    new msg[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando nao encontrado.");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 1;
				format(msg, sizeof(msg), "%s agora esta com %d niveis de procurados", PlayerName(plid),GetPlayerWantedLevel(plid)+1);
				SendClientMessageToAll(COR_COP_ELITE, msg);
				format(string, sizeof(string), "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COR_COP_ELITE, string);
				SetPlayerWantedLevel(plid,GetPlayerWantedLevel(plid)+1);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando nao encontrado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE || Profissao[playerid] != ESTADUAL || Profissao[playerid] != FEDERAL || Profissao[playerid] != PREFEITO || Profissao[playerid] != GOVERNADOR || Profissao[playerid] != PRESIDENTE || Profissao[playerid] != COP_FBI || Profissao[playerid] != POLICIA_FLORESTAL || Profissao[playerid] != IBAMA){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
	}
    if (strcmp(cmd, "/guinchar", true)==0){
		new tmp[256];
		new car;
		new plid;
		new distancia;
		distancia = GetDistanceBetweenPlayers(playerid,plid);
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/guinchar [id]");
		return 1;
		}
		car = GetPlayerVehicleID(plid);
		new modelo;
		cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
		if(modelo == VEH_GUINCHO){
		if(IsPlayerInVehicle(plid,car)){
		if(distancia < 5){
		GetVehicleTrailer(GetPlayerVehicleID(playerid));
		AttachTrailerToVehicle(GetPlayerVehicleID(playerid),car);
		SendClientMessage(playerid, COR_MECANICO, "Guinchado com sucesso");
		SendClientMessage(plid, COR_MECANICO, "Seu carro foi guinchado");
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "Chegue mais perto");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "O jogador nao esta num veiculo");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "Voce tem que estar num carro guincho");
			return 1;
			}
	}
	if (strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == FEDERAL || Profissao[playerid] == PREFEITO || Profissao[playerid] == GOVERNADOR || Profissao[playerid] == PRESIDENTE || Profissao[playerid] == ESTADUAL || Profissao[playerid] == COP_FBI || Profissao[playerid] == POLICIA_FLORESTAL || Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando nao encontrado.");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 0;
				SendClientMessage(playerid, COR_POLICIAL_NARCOTICOS, "Excluido da lista com suscesso.");
				SendClientMessage(plid, COR_POLICIAL_NARCOTICOS, "Você foi retirado da lista de procurados");
                SetPlayerWantedLevel(plid,0);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando nao encontrado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE || Profissao[playerid] != FEDERAL || Profissao[playerid] != PREFEITO || Profissao[playerid] != GOVERNADOR || Profissao[playerid] != PRESIDENTE || Profissao[playerid] != ESTADUAL || Profissao[playerid] != COP_FBI || Profissao[playerid] != POLICIA_FLORESTAL || Profissao[playerid] != IBAMA){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
	}
    if(strcmp(cmd, "/crack", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/crack [id] [quantidade]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/crack [id] [quantidade]");
				return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Você está louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Te peguei, bichinho! Querendo enganar o freguês, não? Doses de 1 à 7");
			}
			if(mili > bagulho[playerid]){
			    SendClientMessage(playerid, COR_VERMELHO, "Você nao possue bagulho suficiente");
			}
			else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
				    return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para vender o crack.");
					} else {
			        	if(crack[plid] == 7){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
							return 1;
						} else {
					    	crack[plid] = mili;
					    	SendClientMessage(playerid,COR_BRANCO, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Você está agora com %d doses de crack no sangue",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
                            ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0); // Deal Drugs
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		}
		return 1;
	}
	if (strcmp("/camuflar", cmdtext, true, 10) == 0){
		if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
		new tmp[256];
		new plid;
		new tempo;
		new distance;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		distance = GetDistanceBetweenPlayers(playerid,plid);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/camuflar [id] [tempo]");
		return 1;
		}
		tempo = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "/camuflar [id] [tempo]");
		return 1;
		}
		if(distance > 10){
		SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "Voce esta muito longe chegue mais perto");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(tempo > 0 && tempo < 10){
		SetPlayerColor(plid,COR_INVISIVEL);
		SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "Jogador Camuflado");
		new msg[256];
		format(msg,sizeof(msg),"Voce foi camuflado por %d minutos nao desperdice este tempo",tempo);
 	    SendClientMessage(plid,COR_VENDEDOR_DE_ARMAS,msg);
		SetTimerEx("camuflar",tempo*1000,false,"d",plid);
		return 1;
		}
     }
		else{
		    SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "Tempo apenas de 1 a 9 minutos");
		    return 1;
		    }
	    }
	    return 1;
    }
    if(strcmp(cmd, "/heroina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/heroina [id] [quantidade]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/heroina [id] [quantidade]");
				return 1;
			}
			if(mili > bagulho[playerid]){
			    SendClientMessage(playerid, COR_VERMELHO, "Você nao possue bagulho suficiente");
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Você está louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Te peguei, bichinho! Querendo enganar o freguês, não? Doses de 1 à 7");
				return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			    	return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para aplicar a injeção.");
						return 1;
					} else {
			        	if(Heroina[plid] == 7){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
							return 1;
						} else {
					    	Heroina[plid] = mili;
					    	SendClientMessage(playerid,COR_BRANCO, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Você está agora com %d doses de heroína no sangue",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
                            ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0); // Deal Drugs
							return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	if (strcmp(cmd, "/processo", true)==0){
		if(Profissao[playerid] == ADVOGADO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
	    	strmid(tmp, cmdtext, 10, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/processo [ nome do réu e descrição da causa ]");
			    return 1;
			}
		    SendClientMessage(playerid, COR_ADVOGADO, "Voce fez a defesa do seu cliente e o processo está em andamento, aguarde a sentença do juiz");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == JUIZ || IsPlayerAdmin(playerid)){
					format(string, sizeof(string), "O Dr.%s entrou com um petição em defesa do réu %s.", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_JUIZ, string);
				    return 1;
		        }
			    return 1;
			    }
		} else {
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
		    return 1;
		}
	}
	if(strcmp(cmd,"/defender",true)==0){
	    if(Profissao[playerid] == ADVOGADO || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,10,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/defender [texto]");
		    	return 1;
			} else {
			    format(msg,sizeof(msg),"O advogado, %s DEFENDE:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,msg);
			    SendClientMessageToAll(COR_BRANCO,tmp);
			    return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
		    return 1;
		}
	}


    if(strcmp(cmd,"/acusar",true)==0){
	    if(Profissao[playerid] == ADVOGADO || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,7,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/acusar [texto]");
			    return 1;
			} else {
			    format(msg,sizeof(msg),"O advogado, %s ACUSA:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,msg);
			    SendClientMessageToAll(COR_BRANCO,tmp);
			    return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
		    return 1;
		}
	}

    if(strcmp(cmd,"/pedir",true)==0){
	    if(Profissao[playerid] == ADVOGADO || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,7,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/pedir [texto]");
			    return 1;
			} else {
			    format(msg,sizeof(msg),"O advogado, %s pede:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,msg);
			    SendClientMessageToAll(COR_BRANCO,tmp);
			    return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/maconha", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/maconha [id] [quantidade]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/maconha [id] [quantidade]");
				return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Você está louco? Quer matar o seu cliente? Doses de 1 a 10");
				return 1;
			}
			if(mili > bagulho[playerid]){
			    SendClientMessage(playerid, COR_VERMELHO, "Você nao possue bagulho suficiente");
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Te peguei, bichinho! Querendo enganar o freguês, não? Doses de 1 à 7");
				return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			   		return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para vender o bagulho.");
						return 1;
					} else {
			        	if(Maconha[plid] == 10){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
							return 1;
						} else {
					    	Maconha[plid] = mili;
					    	SendClientMessage(playerid,COR_BRANCO, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Está concentrada em seu pulmão %d doses de maconha.",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
                            ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0); // Deal Drugs
							return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	if(strcmp(cmd, "/cocaina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/cocaina [id] [quantidade]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/cocaina [id] [quantidade]");
				return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Você está louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			if(mili > bagulho[playerid]){
			    SendClientMessage(playerid, COR_VERMELHO, "Você nao possue bagulho suficiente");
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Te peguei, bichinho! Querendo enganar o freguês, não? Doses de 1 à 7");
				return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			   	 	return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para vender o bagulho.");
						return 1;
					} else {
			        	if(Cocaina[plid] == 7){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
							return 1;
						} else {
					    	Cocaina[plid] = mili;
					    	SendClientMessage(playerid,COR_BRANCO, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Seu pulmão está carregado com %d doses de cocaína.",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
                            ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0); // Deal Drugs
							return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_VERMELHO, "Lista de procurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Procurados[i] == 1){
				format(string, sizeof(string), "id: %d: nome: %s nivel: %d", i,GetPlayerWantedLevel(i));
				SendClientMessage(playerid, COR_AMARELOB, string);
				return 1;
			}
		}
	}
	if (strcmp(cmdtext, "/alugueis", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "Lista de locadores");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(alugueis[i] == 1){
				format(string, sizeof(string), "%d: %s",i, PlayerName(i));
				SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, string);
				return 1;
			}
		}
	}
	if (strcmp(cmdtext, "/votacao", true)==0){
		if(IsPlayerAdmin(playerid)){
		new string[256];
	    SendClientMessage(playerid, COR_AMARELO, "Votações");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Votacoes[i] == 1){
				format(string, sizeof(string), "%d %s :%d votos", i, PlayerName(i),Qtvotos[i]);
				SendClientMessage(playerid, COR_AMARELO, string);
				return 1;
			}
		}
	}
 }
	

    if (strcmp("/pintar", cmd, true) == 0) 	{
		new tmp[256];
		new id, vehicleid, color1, color2, currentState;
		if(Profissao[playerid] != 30 || !IsPlayerAdmin(playerid))
		{
			SendClientMessage(playerid, COR_MECANICO, "Você não é um Mecânico!");
		}

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
        {
			SendClientMessage(playerid, COR_MECANICO, "Faltou colocar os dados: PlayerID - Cor 1 - Cor 2!");
			SendClientMessage(playerid, COR_MECANICO, "Como usar :: /pintar [playerid] [cor1] [cor2]");
		}
		currentState = GetPlayerState(strval(tmp));
		if( (currentState != PLAYER_STATE_DRIVER) )
		{
			SendClientMessage(playerid, COR_MECANICO, "O jogador não está em um veículo.");
		}

		id = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COR_MECANICO, "Faltou colocar os dados: Cor 1 - Cor 2!");
			SendClientMessage(playerid, COR_MECANICO, "Como usar :: /pintar [playerid] [cor1] [cor2]");
		}

		color1 = strval(tmp);
		tmp = strtok(cmdtext, idx);

		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COR_MECANICO, "Faltou colocar os dados: Cor 2!");
			SendClientMessage(playerid, COR_MECANICO, "Como usar :: /pintar [playerid] [cor1] [cor2]");
			return 1;
		}


		color2 = strval(tmp);
		vehicleid = GetPlayerVehicleID(id);
		ChangeVehicleColor(vehicleid, color1, color2);
		SendClientMessage(playerid, COR_MECANICO, "Você pintou um veículo.");
		SendClientMessage(id, COR_MECANICO, "Seu veículo foi pintado, aproveite.");
		return 1;
	}

    if(strcmp(cmd, "/consertar", true) == 0) {
	        if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
                new tmp[256];
                new vehicle;
                new plid;
                new distance;
                tmp = strtok(cmdtext, idx);
                distance = GetDistanceBetweenPlayers(playerid,plid);
                if(!strlen(tmp)){
				SendClientMessage(playerid, COR_MECANICO, "/consertar [id]");
				return 1;
				}
				vehicle= GetPlayerVehicleID(plid);
				plid = strval(tmp);
				if(distance < 10){
				if(IsPlayerConnected(plid)){
				if(IsPlayerInVehicle(plid,vehicle)) {
				new Float:X,Float:Y,Float:Z,Float: ang;
				new angulo;
				GetPlayerPos(playerid,X,Y,Z);
                angulo = GetVehicleZAngle(vehicle,ang);
				SetVehicleToRespawn(vehicle);
                SetVehicleHealth(vehicle,1000);
                SendClientMessage(playerid, COR_MECANICO, "Consertando.");
                SendClientMessage(plid, COR_MECANICO, "Aguarde veiculo sendo arrumado.");
                SetTimerEx("consertar",5000,false,"ddf",vehicle,plid,angulo);
                GameTextForPlayer(plid,"ARRUMANDO",5000,6);
                return 1;
                }
                else{
                    SendClientMessage(playerid, COR_MECANICO, "O jogador indicado nao esta em um veiculo");
                    return 1;
                    }
                }
                else{
                    SendClientMessage(playerid, COR_MECANICO, "Jogador nao conectado/logado");
                    return 1;
                    }
				}
                else{
                    SendClientMessage(playerid, COR_MECANICO, "Voce esta muito longe chegue mais perto");
                    return 1;
                    }
		}


	    if(strcmp(cmd, "/cacar", true) == 0) {
	    if(Profissao[playerid] == CACADOR || IsPlayerAdmin(playerid)){
	        if(AreaCaca[playerid] == 0){
	            SendClientMessage(playerid, COR_VERMELHO, "Você não está na área de caça, consulte nossa site para uma referência.");
				return 1;
			} else {
			    if(CacaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COR_VERMELHO, "Calminha aê... A sua presa não morreu ainda!");
					return 1;
				} else {
					SendClientMessage(playerid, COR_CACADOR, "Você é um exímio caçador! Espere a presa exalar seus últimos ares de vida,");
					SendClientMessage(playerid, COR_CACADOR, "para poder vendê-la.");
			    	CacaInProgress[playerid] = 1;
			    	SetTimer("Caca",36000,false);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
			return 1;
		    }
	    }
	    
	    }
            if(strcmp(cmd, "/say", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/say [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(GetDistanceBetweenPlayers(playerid, i) < 10){
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_CINZA, string);
					SendClientMessage(playerid, COR_CINZA, string);
					return 1;
				}
			}
		}
	}

	        if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_FBI || Profissao[playerid] == POLICIA_FLORESTAL || Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new quant;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multar [id] [quantidade]");
				return 1;
			}
        	plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multar [id] [quantidade]");
				return 1;
			}
        	quant = strval(tmp);
 			if(quant > 1000 || quant <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Você não está querendo multar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COR_VERDE, string);
				SendClientMessage(playerid, COR_VERDE, "Multa dada.");
				udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quant);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
			    return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE || Profissao[playerid] != COP_FBI || Profissao[playerid] != EXERCITO || Profissao[playerid] != POLICIA_FLORESTAL || Profissao[playerid] != IBAMA){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
		return 1;
	}


			if(strcmp(cmd, "/staxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/staxi [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COR_BRANCO, "O taxímetro começou a rodar");
                SendClientMessage(plid, COR_BRANCO, "O taxímetro começou a rodar");
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está dentro do seu carro ou você não é o motorista.");
				return 1;
			}
		}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}

           	

            if(strcmp(cmd, "/selldrink", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/selldrink [id] [teor de alcool]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/selldrink [id] [teor de alcool]");
				return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoolico invalido, Os teores devem ser entre 2 e 7.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Você bebeu um drink com teor alcoolico: %d", teor);
			            SendClientMessage(playerid, COR_AZUL, string);
			            SendClientMessage(playerid, COR_AZUL, "Drink Vendido e tomado");
						return 1;
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
					return 1;
				}
			}
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
			return 1;
		}
	}
	if(strcmp(cmd, "/pescar", true) == 0) {
	    if(PescaInProgress[playerid] == 1) {
	    SendClientMessage(playerid, COR_VERMELHO, "Calminha aê... Você já está pescando!");
	    }
		if(PescaInProgress[playerid] == 0){
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		if(X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425){
			SendClientMessage(playerid,COR_BRANCO,"Você lançou a rede de pesca. Espere ela voltar para concluir a pesca.");
			SendClientMessage(playerid,COR_BRANCO,"Enquanto ela não vem, fique apreciando a paisagem.");
			PescaInProgress[playerid] = 1;
			SetTimer("Pesca",36000,false);
			return 1;
			}
			else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não está na área de pesca, consulte nosso site para uma referência.");
			return 1;
			}
		}
		return 1;
	}
    if(strcmp(cmd, "/pintar", true) == 0) {
        if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, cor1, cor2;
			new carro;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/pintar [id] [cor1] [cor2]");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/pintar [id] [cor1] [cor2]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/pintar [id] [cor1] [cor2]");
				return 1;
			}
			cor1 = strval(tmp);
			if(cor1 < 0 || cor1 > 126){
			    SendClientMessage(playerid, COR_VERMELHO, "Cor invalida, As cores são de 0 a 126.");
				return 1;
			}
			cor2 = strval(tmp);
			if(cor2 < 0 || cor2 > 126){
			    SendClientMessage(playerid, COR_VERMELHO, "Cor invalida, As cores são de 0 a 126.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    carro = GetPlayerVehicleID(plid);
					    if(IsPlayerInVehicle(plid,carro)){
					    Color1[carro] = cor1;
					    Color2[carro] = cor2;
						format(string, sizeof(string), "%s pintou seu carros das cores: %d e %d.", cor1, cor2);
			            SendClientMessage(plid, COR_BRANCO, string);
			            SendClientMessage(playerid, COR_BRANCO, "Carro pintado.");
			            ChangeVehicleColor(carro, cor1, cor2);
						return 1;
                        }
				        else{
					        SendClientMessage(playerid, COR_VERMELHO, "O jogador indicado nao esta em um veiculo!");
					    	return 1;
					    }
                    }
				    else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto.");
					return 1;
				}
			}
		 }
		if(Profissao[playerid] != MECANICO){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
			return 1;
			}
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
				SendClientMessage(playerid, COR_VERMELHO, "/bafometro [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(distancia > 20){
			        SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(distancia <= 20){
					format(string, sizeof(string), "O bafômetro mostra: %s no sangue", Bebida[plid]);
					SendClientMessage(playerid, COR_AMARELO, string);
				    SendClientMessage(playerid, COR_COP_FBI, "Prisão concluida");
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
		return 1;
	}
	SendClientMessage(playerid,COR_AMARELOB,"Comando nao identificado pelo gamemode");
	return 1;
  }
public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
    SendClientMessage(playerid, COR_MEDICO,"|-------------------------ATENÇÃO--------------------------|");
	SendClientMessage(playerid, COR_MEDICO,"O comando /pm foi desabilitado!");
	SendClientMessage(playerid, COR_COP_ELITE,"use /ligar ou /sms para mensagens privadas");
	return 0;
}
public apostar(playerid,numero)
{
  for(new i=0; i<MAX_PLAYERS; i++){
  new string[256];
  new msg[256];
  sorteio++;
  sorteio%=24;
  SetWorldTime(sorteio);
  if(sorteio == 24){
  new iRandomNumber;
  iRandomNumber = random(25);
  if(numeroselecionado[playerid] == iRandomNumber){
  SendClientMessageToAll(COR_BRANCO,"Resultado da FuriouSena:");
  format(string,sizeof(string),"Numero sorteado:%d !!! Parabens %s.",iRandomNumber,PlayerName(i));
  SendClientMessageToAll(COR_COP_ELITE,msg);
  GivePlayerMoney(i,6000);
  aposta[i] = 0;
  }
  else if(numeroselecionado[playerid] != iRandomNumber){
  SendClientMessageToAll(COR_BRANCO,"Resultado da FuriouSena:");
  format(msg,sizeof(msg),"Nenhum vencedor o numero premiado foi %d.",iRandomNumber);
  SendClientMessageToAll(COR_COP_ELITE,msg);
  aposta[i] = 0;
  }
 }
}
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(antialarm[playerid] != vehicleid){
	if(alarme[vehicleid] == 1){
	SendClientMessage(playerid, COR_MEDICO, "Este carro possue alarme fuja ou sera abatido");
	SetTimerEx("mortealarme",10000,false,"dd",vehicleid,vehicleid);
	return 1;
	}
}
    printf("%s entrou em um veiculo (id:%d)",PlayerName(playerid),vehicleid);
    return 1;
}
public FuelDown()
	{
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	Petrol[GetPlayerVehicleID(i)]--;
	}
	return 1;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
    printf("%s saiu de um veiculo (id:%d)",PlayerName(playerid),vehicleid);
    return 1;
}
public locar(plid,car)
{
     SetVehicleParamsForPlayer(car,plid, 0, 1);
	 Aluguel[plid] = 0;
	 SendClientMessage(plid, COR_ALUGUEL_DE_CARROS, "Seu tempo acabou se quiser mais peça a um locador de carros");
	 return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new modelo;
	cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
	if(IsPlayerConnected(playerid) == 1 && modelo != 510 && modelo != 509){
		if(newstate == PLAYER_STATE_DRIVER){
			if(Petrol[GetPlayerVehicleID(playerid)] <= -100){
				Petrol[GetPlayerVehicleID(playerid)] = -100;
				TogglePlayerControllable(playerid, 0);
				SendClientMessage(playerid, COR_MEDICO, "Este veículo não tem combustivel! Vá até o posto e compre um galão de combustível.");
				SendClientMessage(playerid, COR_MEDICO, "Digite '/sair' para  do veiculo ou digite '/colocar' para colocar um galao de combustivel neste veiculo.");
    	    	return 0;
			}
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT){
	    if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COR_COP_ELITE, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COR_COP_ELITE, "Você recebeu o valor da corrida até aqui.");
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
public setcar(carid, X, Y, Z, ang, cor1,cor2){

	   CreateVehicle(carid,X,Y,Z,ang,cor1,cor2,-1);
}
public setprof(plid)
{
  if(IsPlayerConnected(plid)){
  SetPlayerHealth(plid,100);
  TogglePlayerControllable(plid,1);
  return 1;
  }
  return 1;
}

public tunacao(vehicleid,componentid)
{
      for(new i=0; i<MAX_PLAYERS; i++){
	  vehicleid = 1;
	  new veiculo;
	  veiculo = GetPlayerVehicleID(i);


	  if(nitro[vehicleid] == 1){
	  componentid = 1010;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(stereo[vehicleid] == 1){
	  componentid = 1086;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(hidraulica[vehicleid] == 1){
	  componentid = 1087;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(frontalien[vehicleid] == 1){
	  componentid = 1171;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(spoileralien[vehicleid] == 1){
	  componentid = 1147;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(wheelswitch[vehicleid] == 1){
	  componentid = 1080;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(rearalien[vehicleid] == 1){
	  componentid = 1149;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(sideskirtalien[vehicleid] == 1){
	  componentid = 1140 && 1036;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(roffalien[vehicleid] == 1){
	  componentid = 1038;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(exhaustalien[vehicleid] == 1){
	  componentid = 1038;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(jesterroof[vehicleid] == 1){
	  componentid = 1068;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(jesterside[vehicleid] == 1){
	  componentid = 1069 && 1071;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(jesterexhaust[vehicleid] == 1){
	  componentid = 1066;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(jesterspoiler[vehicleid] == 1){
	  componentid = 1158;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(jesterrear[vehicleid] == 1){
	  componentid = 1159;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(jesterfront[vehicleid] == 1){
	  componentid = 1160;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(wangwheals[vehicleid] == 1){
	  componentid = 1160;
	  AddVehicleComponent(vehicleid,componentid);
	  tune[veiculo] = 1;
	  }
	  if(tune[veiculo] != 0){
	  tune[veiculo] ++;
	  }
   }
}
public pintar(veiculo,cor1,cor2)
{
  ChangeVehicleColor(veiculo,cor1,cor2);
  ChangeVehiclePaintjob(veiculo,cor1);
}
public OnPlayerEnterCheckpoint(playerid)
{
  printf("Jogador de ID %d (%s) entrou em um checkpoint",playerid, PlayerName(playerid));
  switch (gPlayerCheckpointStatus[playerid])
	{
	case CHECKPOINT_TERMINAL :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2679.8501,558.8384,14.5030,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL2;
	}
    case CHECKPOINT_TERMINAL2 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2246.3533,-136.8764,35.3203,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL3;
	}
    case CHECKPOINT_TERMINAL3 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-1975.9673,-751.0164,32.2266,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
	GivePlayerMoney(playerid,150);
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL4;
	}
	case CHECKPOINT_TERMINAL4 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2174.8452,-46.8932,35.3125,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL5;
	}
	case CHECKPOINT_TERMINAL5 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2154.7961,252.1680,35.3125,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL6;
	}
	case CHECKPOINT_TERMINAL6 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-1986.2688,141.6903,27.6875,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL7;
	}
	case CHECKPOINT_TERMINAL7 :
	{
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AMARELOB, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
	GivePlayerMoney(playerid,150);
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	}
	case CHECKPOINT_VIAGEMSFLV :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,1434.8029,2611.4238,10.8203,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Va agora para a rodoviaria de Las Venturas");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMSFLV2;
	}
	case CHECKPOINT_VIAGEMSFLV2 :
	{
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo agora voce recebeu $150 e mais o dinheiro dos passageiros");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	GivePlayerMoney(playerid,150);
	}
	case CHECKPOINT_VIAGEMLVSF :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-1977.7321,-860.4664,32.0312,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Va ate a rodoviaria de San Fierro agora");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMLVSF2;
	GivePlayerMoney(playerid,150);
	}
	case CHECKPOINT_VIAGEMLVSF2 :
	{
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo agora voce recebeu $150 e mais o dinheiro dos passageiros");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	GivePlayerMoney(playerid,150);
	}
  }
}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("OnPlayerLeaveCheckpoint(%d)", playerid);
	return 1;
}


public sethome(playerid)
{
 new Float:X, Float:Y, Float:Z;
 GetPlayerPos(playerid, X, Y, Z);
 AddStaticPickup(1272,1,X,Y,Z);
}
public dar(playerid,plid)
{
       if(IsPlayerConnected(playerid)){
       if(IsPlayerConnected(plid)){
       TogglePlayerControllable(playerid,1);
       TogglePlayerControllable(plid,1);
       SendClientMessage(plid, COR_BRANCO, "Sexo finalizado");
       SendClientMessage(playerid, COR_BRANCO, "Sexo finalizado");
       RemovePlayerFromVehicle(playerid);
       RemovePlayerFromVehicle(plid);
       return 1;
       }
    }
	   return 1;
}
public chupar(playerid,plid)
{
       if(IsPlayerConnected(playerid)){
	   if(IsPlayerConnected(plid)){
       TogglePlayerControllable(playerid,1);
       TogglePlayerControllable(plid,1);
       SendClientMessage(plid, COR_BRANCO, "Sexo finalizado");
       SendClientMessage(playerid, COR_BRANCO, "Sexo finalizado");
       RemovePlayerFromVehicle(playerid);
       RemovePlayerFromVehicle(plid);
       return 1;
       }
	}
	   return 1;
}
public contagem()
{
   GameTextForAll("~y~4",2000,6);
   SetTimer("contagem2",2000,false);
   return 1;
}
   
public contagem2()
{
       GameTextForAll("~y~3",2000,6);
       SetTimer("contagem3",2000,false);
       return 1;
}
public contagem3()
{
 GameTextForAll("~y~2",2000,6);
 SetTimer("contagem4",2000,false);
 return 1;
}
public contagem4()
{
 GameTextForAll("~y~1",2000,6);
 SetTimer("contagem5",2000,false);
 return 1;
}
public contagem5()
{
 GameTextForAll("~r~GO",2000,6);
 return 1;
}
public OnPlayerExitedMenu(playerid)
{
	TogglePlayerControllable(playerid, true);
}
public OnPlayerSelectedMenuRow(playerid, row)
{
        new Menu:Current = GetPlayerMenu(playerid);
        if(Current == menumain) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);abrirestacionamento(playerid);TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);fecharestacionamento(playerid);TogglePlayerControllable(playerid, true);}
    	case 2:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
		}
     }
		else if(Current == radares) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);radaron();TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);radaroff();TogglePlayerControllable(playerid, true);}
    	case 2:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
		}
     }
		else if(Current == menuportao) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);abrirportaotrafico(playerid);TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);fecharportaotrafico(playerid);TogglePlayerControllable(playerid, true);}
    	case 2:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
    	}
	  }
        else if(Current == Terminais) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);ligarterminal(playerid);TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
      }
}
stock ligarterminal(playerid)
{
  DisablePlayerCheckpoint(playerid);
  SetPlayerCheckpoint(playerid,-1750.8685,955.9368,24.7422,2.5);
  gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL;
  SendClientMessage(playerid, COR_AZUL, "Siga até os checkpoints para ir aos terminais");
}
stock abrirportaotrafico(playerid)
{
   MoveObject(portaotrafico,-2112.549805, -80.643799, 36.044720, 2);
   SendClientMessage(playerid, COR_TRAFICANTE, "Portoes abertos");
}
stock fecharportaotrafico(playerid)
{
   MoveObject(portaotrafico,-2122.220703, -80.644669, 36.037155, 2);
   SendClientMessage(playerid, COR_TRAFICANTE, "Portoes fechados");
}
stock radaron()
{
    for(new i=0; i<MAX_PLAYERS; i++){
    Radaron[i] = 1;
    SendClientMessage(i,COR_CONFISCADOR_CARROS, "Os radares da cidade foram ligados se alguem andar em alta velocidade pela rua sera multado");
	}
}
stock radaroff()
{
    for(new i=0; i<MAX_PLAYERS; i++){
    Radaron[i] = 0;
    SendClientMessage(i, COR_CONFISCADOR_CARROS, "Os radares da cidade foram desligados agora todos podem preparar os nitros de seus carros a vontade");
	}
}
stock fecharestacionamento(playerid){

	   MoveObject(portao1,-1770.112793, 979.835083, 24.182503, 2);
	   MoveObject(portao2,-1770.122803, 988.664185, 24.182503, 2);
	   SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "Portoes fechados");
}
stock abrirestacionamento(playerid){

       MoveObject(portao1,-1770.123779, 975.467773, 24.213446, 2);
	   MoveObject(portao2,-1770.137329, 994.080383, 24.182503, 2);
	   SendClientMessage(playerid, COR_SEGURANCA_DE_CARROS, "Portoes abertos");
}
public assaltar(playerid)
{
    if(IsPlayerConnected(playerid)){
    if(assalto[playerid] == 1){
    assalto[playerid] = 0;
    SendClientMessage(playerid, COR_ASSALTANTE, "AVISO: você ja pode assaltar o banco ou o mercado novamente");
    }
  }
}
public desmanche(playerid)
{
    if(TempoDesmanche[playerid] == 1){
    if(IsPlayerConnected(playerid)){
    TempoDesmanche[playerid] = 0;
    SendClientMessage(playerid, COR_LADRAO_DE_CARROS, "AVISO: você ja pode voltar a entregar carros ao desmanche");
    }
  }
}
public parcelamento(playerid,plid,quant,pagamento)
{
   new string[256];
   new msg[256];
   if(IsPlayerConnected(plid)){
     if(IsPlayerConnected(playerid)){
     udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quant);
     GivePlayerMoney(plid,pagamento);
     format(string,sizeof(string),"%s pagou seus %d, voce recebeu %d e sua agencia recebeu o resto",PlayerName(playerid),quant,pagamento);
     SendClientMessage(plid,COR_BRANCO,string);
     format(msg,sizeof(msg),"Seu parcelamento continua e voce pagou %d o dinheiro foi retirado do banco",quant);
     SendClientMessage(playerid, COR_COP_ELITE,msg);
     }
  }
}
public Bancos()
{
	new Float:X, Float:Y, Float:Z;

	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			if(X >= 1700.1732 && X <= 1741.9966 && Y >= -1721.5967 && Y <= -1605.9054){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 972.7372 && X <= 1072.9083 && Y >= -1133.2140 && Y <= -1110.8668){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 2172.9221 && X <= 2190.9502 && Y >= 1105.2529 && Y <= 1126.5010){
			    if(AreaBanco[i] == 0) {
			        DisablePlayerCheckpoint(i);
			        GameTextForPlayer(i,"~w~BANCO",3000,0);
			        AreaBanco[i] = 1;
				}
			}
			else if(X >= 385.5901 && X <= 409.1007 && Y >= -1823.7596 && Y <= -1797.2906){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1785.4990 && X <= -1714.4250 && Y >= 929.3326 && Y <= 974.9125){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1978.6537 && X <= -1961.9292 && Y >= 113.2442 && Y <= 162.6734){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2482.7346 && X <= -2386.7249 && Y >= 461.5373 && Y <= 552.1155){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 1951.4363 && X <= 1961.4280 && Y >= 1339.6191 && Y <= 1346.2188){
			    if(AreaBanco[i] == 0) {
			        DisablePlayerCheckpoint(i);
			        GameTextForPlayer(i,"~w~BANCO",3000,0);
			        AreaBanco[i] = 1;
				}
			}
			else if(X >= 2426.7166 && X <= 2445.3423 && Y >= 1671.3499 && Y <= 1687.3812){
			    if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 2500.3918 && X <= 2700.3918 && Y >= 1700.9388 && Y <= 2100.9388){
			        if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
                    AreaBanco[i] = 1;
				}
			}
			else if(X >= 1500.1808 && X <= 1800.1808 && Y >= 1300.0188 && Y <= 1600.0188){
			        if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
                    AreaBanco[i] = 1;
				}
			}
			else if(X >= 1400.9611 && X <= 1550.9611 && Y >= 2100.5972 && Y <= 2400.5972){
			    	if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
                    AreaBanco[i] = 1;
				}
			}
			else if(X >= 2094.3782 && X <= 2098.2041 && Y >= 1157.7740 && Y <= 1161.5521){
			    	if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
                    AreaBanco[i] = 1;
				}
			}
			else if(X >= -182.7750 && X <= -180.7443 && Y >= 1134.8240 && Y <= 1135.9829){
			    	if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
                    AreaBanco[i] = 1;
				}
			}
			else if(X >= -830.4357 && X <= -826.0613 && Y >= 1499.3967 && Y <= 1502.4084){
			    	if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					GameTextForPlayer(i,"~w~BANCO",3000,0);
                    AreaBanco[i] = 1;
				}
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
            }
           	else if((X >= -1448.0480 && Y <= -1451.9598 && X <= -1220.6431 && Y >= -1547.6027)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
					AreaPosto[i] = 1;
			}
			else if((X >= 68.0616 && X <= 72.5413 && Y >= 1216.2677 && Y <= 1220.9563)){
                    GameTextForPlayer(i,"~b~POSTO",3000,0);
				    AreaPosto[i] = 1;
			}
			else if(X >= -1610.9099 && X <= -1496.5111 && Y >= 1279.2794 && Y <= 1295.2489){
                    GameTextForPlayer(i,"~g~COOPERATIVA DE PESCA",3000,0);
				    AreaCoopPesca[i] = 1;
			}
			else if(X >= -2062.2964 && X <= -2020.8334 && Y >= -1616.9932 && Y <= -1510.9994){
                    GameTextForPlayer(i,"~r~AREA DE CAÇA",3000,0);
					AreaCaca[i] = 1;
			}
			
			else if(X >= -1592.0328 && X <= -1572.4073 && Y >= 40.3967 && Y <= 62.7747){
                    GameTextForPlayer(i,"~y~DESMANCHE",3000,0);
					AreaDesmanche[i] = 1;
			}
			else if(X >= -2824.2483 && X <= -2801.2568 && Y >= -1534.1261 && Y <= -1510.1261){
                    GameTextForPlayer(i,"~b~COOPERATIVA DE CAÇA",3000,0);
					AreaCoopCaca[i] = 1;
			}
			else if(X >= -622.7689 && X <= -466.2803 && Y >= -562.3403 && Y <= -468.5563){
                    GameTextForPlayer(i,"~g~AREA DE CARGA",3000,0);
					AreaCarga[i] = 1;
			}
			else if(X >= -70.6976 && X <= -40.9113 && Y >= -1159.8073 && Y <= -1101.6296){
				if(AreaDescarga[i] == 0) {
                    GameTextForPlayer(i,"~w~AREA DE DESCARGA",3000,0);
					AreaDescarga[i] = 1;
				}
			}
            else if(X >= -1555.4890 && X <= -1542.7485 && Y >= -440.4771 && Y <= -426.9335){
				if(AreaAeroporto[i] == 0) {
                    GameTextForPlayer(i,"~y~AEROPORTO",3000,0);
					AreaAeroporto[i] = 1;
				}
			}
			else if(X >= -2606.4307 && X <= -2594.6824 && Y >= 1327.9158 && Y <= 1339.5546){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*1*/
				}
			}
			else if(X >= -2215.0361 && X <= -2208.7178 && Y >= 1324.7434 && Y <= 1339.7783){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*2*/
				}
			}
			else if(X >= -1978.4377 && X <= -1973.3818 && Y >= 1288.7751 && Y <= 1288.9655){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*3*/
				}
			}
			else if(X >= -1978.1754 && X <= -1972.3431 && Y >= 1279.7661 && Y <= 1285.8601){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*4*/
				}
			}
			else if(X >= -1890.7643 && X <= -1877.3749 && Y >= 1132.4297 && Y <= 1133.8512){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*5*/
				}
			}
			else if(X >= -2011.6628 && X <= -1997.0009 && Y >= 782.1808 && Y <= 782.8787){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*6*/
				}
			}
			else if(X >= -2151.3376 && X <= -2134.8833 && Y >= 526.5551 && Y <= 530.8201){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*7*/
				}
			}
			else if(X >= -2108.3706 && X <= -2103.7710 && Y >= 315.8866 && Y <= 324.7085){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*8*/
				}
			}
			else if(X >= -2010.4415 && X <= -1997.2301 && Y >= 363.0030 && Y <= 363.8209){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*9*/
				}
			}
			else if(X >= -2781.1699 && X <= -2774.7734 && Y >= 462.9915 && Y <= 463.0585){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*10*/
				}
			}
			else if(X >= -2721.5723 && X <= -2715.2126 && Y >= 572.7213 && Y <= 558.7436){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*11*/
				}
			}
			else if(X >= -2548.7087 && X <= -2543.7185 && Y >= 703.9271 && Y <= 712.9588){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*12*/
				}
			}
			else if(X >= -2531.5413 && X <= -2521.7644 && Y >= 821.6251 && Y <= 827.0449){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*13*/
				}
			}
			else if(X >= -2479.9121 && X <= -2475.7048 && Y >= 912.9851 && Y <= 913.1282){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*14*/
				}
			}
			else if(X >= -1765.1848 && X <= -1759.5828 && Y >= 911.2502 && Y <= 938.1314){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*15*/
				}
			}
			else if(X >= -1721.6741 && X <= -1706.9513 && Y >= 805.0636 && Y <= 805.1318){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*16*/
				}
			}
			else if(X >= -1608.3539 && X <= -1604.9110 && Y >= 724.1099 && Y <= 738.5641){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*17*/
				}
			}
			else if(X >= -2011.5265 && X <= -1996.7944 && Y >= 582.7819 && Y <= 588.7749){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*18*/
				}
			}
			else if(X >= -1625.8806 && X <= -1604.9390 && Y >= 427.4234 && Y <= 447.9202){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*19*/
				}
			}
			else if(X >= -8.7048 && X <= -2.5727 && Y >= 1203.1498 && Y <= 1203.2510){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*20*/
				}
			}
			else if(X >= -70.2448 && X <= -60.7134 && Y >= 1179.2515 && Y <= 1179.7310){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*21*/
				}
			}
			else if(X >= -42.0447 && X <= -34.8634 && Y >= 1093.6133 && Y <= 1103.2422){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*22*/
				}
			}
			else if(X >= -20.4331 && X <= -10.7560 && Y >= 1042.2537 && Y <= 1043.3009){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*23*/
				}
			}
			else if(X >= -305.8265 && X <= -295.4340 && Y >= 1053.7714 && Y <= 1058.4374){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*24*/
				}
			}
			else if(X >= -334.8043 && X <= -328.7150 && Y >= 1143.3896 && Y <= 1143.5027){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*25*/
				}
			}
			else if(X >= -829.6514 && X <= -826.8742 && Y >= 1437.7278 && Y <= 1437.9860){
			    	if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~r~HOTEL",3000,0);
					SendClientMessage(i, COR_BRANCO, "Voce esta em um hotel digite /hotel para ficar aqui");
                    AreaHotel[i] = 1;
				}
			}
			else if(X >= -1848.1218 && X <= -1831.0234 && Y >= 117.0933 && Y <= 134.7023){
			    	if(AreaBanco[i] == 0) {
					GameTextForPlayer(i,"~g~area de venda",3000,0);
                    AreaVenda[i] = 1;
				}
			}
			else if(X >= -2189.6699 && X <= -2139.2532 && Y >= -241.4000 && Y <= -226.4995){
			    	if(AreaTrafico[i] == 0) {
					GameTextForPlayer(i,"~r~area de trafico",3000,0);
                    AreaTrafico[i] = 1;
				}
			}
			else if(X >= -1987.1302 && X <= -1917.1047 && Y >= 639.5455 && Y <= 723.5545){
			    	if(AreaLimosine[i] == 0) {
					GameTextForPlayer(i,"~p~companhia de limosine",3000,0);
                    AreaLimosine[i] = 1;
				}
			}
			else if(X >= -1680.2588 && X <= -1644.0610 && Y >= 1202.5491 && Y <= 1223.7969){
			    	if(AreaAluguel[i] == 0) {
					GameTextForPlayer(i,"~l~area de aluguel",3000,0);
                    AreaAluguel[i] = 1;
				}
			}
			else if(X >= -2672.4089 && X <= -2613.1201 && Y >= 631.0959 && Y <= 631.2515){
			    	if(AreaHospital[i] == 0) {
					GameTextForPlayer(i,"~y~Hospital",3000,0);
                    AreaHospital[i] = 1;
				}
			}
			else if(X >= -1640.4901 && X <= -1573.1110 && Y >= 687.5545 && Y <= 687.6561){
			    	if(AreaDelegacia[i] == 0) {
					GameTextForPlayer(i,"~r~Delegacia",3000,0);
                    AreaDelegacia[i] = 1;
				}
			}
			else if(X >= -323.9807 && X <= -309.9444 && Y >= 1061.5651 && Y <= 1062.4645){
			    	if(AreaHospital[i] == 0) {
					GameTextForPlayer(i,"~y~Hospital",3000,0);
                    AreaHospital[i] = 1;
				}
			}
			else if(X >= -93.6182 && X <= -85.6024 && Y >= 1225.5551 && Y <= 1229.1606){
			    	if(AreaHotel[i] == 0) {
					GameTextForPlayer(i,"~p~Hotel",3000,0);
					SendClientMessage(i, COR_MEDICO, "Voce esta num hotel para se hospedar digite /hotel");
					SendClientMessage(i, COR_MEDICO, "OBS: Você ira pagando $700 de despeja");
                    AreaHotel[i] = 1;
				}
			}
			else if(X >= 10.1433 && X <= 12.7759 && Y >= 1218.0850 && Y <= 1226.6731){
			    	if(AreaHotel[i] == 0) {
					GameTextForPlayer(i,"~p~Hotel",3000,0);
					SendClientMessage(i, COR_MEDICO, "Voce esta num hotel para se hospedar digite /hotel");
					SendClientMessage(i, COR_MEDICO, "OBS: Você ira pagando $700 de despeja");
                    AreaHotel[i] = 1;
				}
			}
			else if(X >= 86.3387 && X <= 89.8250 && Y >= 1180.8751 && Y <= 1184.8682){
			    	if(AreaHotel[i] == 0) {
					GameTextForPlayer(i,"~p~Hotel",3000,0);
					SendClientMessage(i, COR_MEDICO, "Voce esta num hotel para se hospedar digite /hotel");
					SendClientMessage(i, COR_MEDICO, "OBS: Você ira pagando $700 de despeja");
                    AreaHotel[i] = 1;
				}
			}
			else {
			    if(AreaBanco[i] == 1) {
					DisablePlayerCheckpoint(i);
					AreaBanco[i] = 0;
				}
				if(AreaPosto[i] == 1) {
				    AreaPosto[i] = 0;
                }
				if(AreaDescarga[i] == 1) {
				    AreaDescarga[i] = 0;
				}
				if(AreaCarga[i] == 1){
				    AreaCarga[i] = 0;
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
				if(AreaDesmanche[i] == 1) {
				    AreaDesmanche[i] = 0;
                }
				if(AreaAeroporto[i] == 1) {
				    AreaAeroporto[i] = 0;
                }
				if(AreaRadar[i] == 1) {
				    AreaRadar[i] = 0;
                }
				if(AreaHotel[i] == 1) {
				    AreaHotel[i] = 0;
                }
                if(AreaTrafico[i] == 1) {
				    AreaTrafico[i] = 0;
                }
				if(AreaVenda[i] == 1) {
				    AreaVenda[i] = 0;
                }
				if(AreaHospital[i] == 1) {
				    AreaHospital[i] = 0;
                }
				if(AreaDelegacia[i] == 1) {
				    AreaDelegacia[i] = 0;
                }
				if(AreaAluguel[i] == 1) {
				    AreaAluguel[i] = 0;
                }
				if(AreaLimosine[i] == 1) {
				    AreaLimosine[i] = 0;

				}
			}
		}
	}
}


public votacaoon(plid1,plid2)
{
      for(new i=0; i<MAX_PLAYERS; i++) {
	  votosabertos[plid1] = 1;
	  votosabertos[plid2] = 2;
	  temporadavotos[i] = 1;
	  SetTimerEx("fimvotacao",10000,1,"dd",plid1,plid2);
	  }
}
public fimvotacao(plid1,plid2,vencedor)
{
      for(new i=0; i<MAX_PLAYERS; i++) {
	  if(votosabertos[plid1] == 1){
      if(votosabertos[plid2] == 1){
      }
      if(IsPlayerConnected(i)){
	  if(Qtvotos[plid1] < Qtvotos[plid2]){
	  plid2 = vencedor;
	  return 1;
	  }
	  if(Qtvotos[plid1] > Qtvotos[plid2]){
	  plid1 = vencedor;
	  return 1;
      }
      new msg[256];
      format(msg,sizeof(msg),"O vencedor foi:%s.",PlayerName(vencedor));
      SendClientMessageToAll(COR_BRANCO,msg);
      temporadavotos[i] = 0;
      voto[i] = 0;
      votosabertos[plid1] = 0;
      votosabertos[plid2] = 0;
      return 1;
      }
      if(Qtvotos[plid2] == Qtvotos[plid1]){
      SendClientMessage(i, COR_BRANCO, "Nenhum Vencedor nesta temporada de votaçoes. Depois sera feita outra eleição para decidir");
      temporadavotos[i] = 0;
      voto[i] = 0;
      votosabertos[plid1] = 0;
      votosabertos[plid2] = 0;
      }
    }
  }
      return 1;
}
public camuflar(plid)
{
  if(IsPlayerConnected(plid)){
  COR_PROFISSAO[plid] = udb_getProf(PlayerName(plid));
  SendClientMessage(plid, COR_AMARELOB, "Seu tempo acabou caso queira mais fale com um vendedor de armas");
  }
}
public Semana()
{
    dias++;
    dias%=24;
	SetWorldTime(dias);

	for(new i=0; i<MAX_PLAYERS; i++) {

		if(dias==0){
		if(IsPlayerConnected(i)){
		GameTextForAll("~y~SEGUNDA FEIRA",10000,6);
		segunda[i] = 1;
		}
	}
		if(dias==7){
		if(IsPlayerConnected(i)){
		GameTextForAll("~y~TERÇA FEIRA",10000,6);
		terca[i] = 1;
		}
	}
		if(dias==14){
		if(IsPlayerConnected(i)){
		GameTextForAll("~y~QUARTA FEIRA",10000,6);
		quarta[i] = 1;
		}
	}
		if(dias==21){
		if(IsPlayerConnected(i)){
		GameTextForAll("~y~QUINTA FEIRA",10000,6);
		quinta[i] = 1;
		}
	}
		if(dias==28){
		if(IsPlayerConnected(i)){
		GameTextForAll("~y~SEXTA FEIRA",10000,6);
		sexta[i] = 1;
		}
		if(dias==35){
		if(IsPlayerConnected(i)){
		GameTextForAll("~y~SABADO",10000,6);
		sabado[i] = 1;
		}
	}
		if(dias==42){
		if(IsPlayerConnected(i)){
		GameTextForAll("~y~DOMINGO",10000,6);
		domingo[i] = 1;
		}
	 }
   }
 }
}
stock CheckFuel()
{
	for(new i=0; i<MAX_PLAYERS; i++){
 		new id;
	    new modelo;
	    id = GetPlayerVehicleID(i);
		cGetVehicleModelID(id,modelo);
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1 && modelo != 509 && modelo != 510){
			if(Petrol[GetPlayerVehicleID(i)] < -90 || Petrol[GetPlayerVehicleID(i)] >= -90){
			SendClientMessage(i,COR_VERMELHO,"Atenção: seu combustível está quase acabando. Vá ao posto mais próximo e abasteça");
			return 1;
			}
		}
	}
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{

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

public alugarlimo(playerid,car)
{
  if(devolucao[playerid] > 0){
  SendClientMessage(playerid, COR_MOTORISTA, "Sua Limosine nao foi devolvida ainda se você nao devolver logo poderá ser preso");
  SetTimerEx("atraso",300000,1,"dd",playerid,car);
  }
}
public atraso(playerid,car)
{
  if(devolucao[playerid] > 0){
  SendClientMessage(playerid, COR_MOTORISTA, "Você nao devolveu a limosine e foi botado na lista dos procurados");
  new string[256];
  format(string, sizeof(string), "%s foi posto na lista dos procurados por roubar uma limosine", PlayerName(playerid));
  SendClientMessageToAll(COR_COP_ELITE,string);
  Procurados[playerid] = 1;
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
					SendClientMessage(i, COR_VERMELHO, "CHAMADA PERDIDA: Voce nao possue mais dinheiro para continuar essa ligação");
					SendClientMessage(Calling[i], COR_VERMELHO, "CHAMADA PERDIDA: O telefone de quem estava na outra chamada foi desligado por falta de créditos");
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

public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 180000){
	            TempoPreso[i] = 0;
				udb_setPrisao(PlayerName(i), 0);
				Presos[i] = 0;
				SetSpawnInfo(i,0,udb_getSkin(PlayerName(i)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
	    		SpawnPlayer(i);
	            SendClientMessage(i, COR_AMARELO, "Você foi solto, mas se fizer algum crime outra vez, já sabe...");
			}
			else {
			    TempoPreso[i]++;
			}
		}
	}
}

public sacar(playerid){
  if(IsPlayerConnected(playerid)){
  TogglePlayerControllable(playerid,1);
  return 1;
  }
  return 1;
}
public depositar(playerid){
  if(IsPlayerConnected(playerid)){
  TogglePlayerControllable(playerid,1);
  return 1;
  }
  return 1;
}
public mortealarme(playerid,vehicleid)
{
		if(antialarm[playerid] != vehicleid){
        if(IsPlayerInVehicle(playerid,vehicleid)){
        if(IsPlayerConnected(playerid)){
        if(alarme[vehicleid] == 1){
        SetPlayerHealth(playerid,0);
        SendClientMessage(playerid, COR_AZUL, "Voce morreu por nao sair de um carro com alarme");
        return 1;
        }
	 }
  }
}
        return 1;
}

public GetDistanceBetweenPlayers(playerid,playerid2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	new Float:dis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetPlayerPos(playerid2,x2,y2,z2);
	dis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(dis);
}

public carrostrancados()
{
        for(new a=0; a<MAX_VEHICLES; a++){
        for(new i=0; i<MAX_PLAYERS; i++){
        if(Profissao[i] != ALUGUEL_DE_CARROS){
        if(a == carroaluguel){
        SetVehicleParamsForPlayer(a,i, 0, 1);
        }
      }
    }
  }
}
public consertar(vehicle,plid,angulo)
{
   new Float:X, Float:Y, Float:Z;
   GetPlayerPos(plid,X,Y,Z);
   if(IsPlayerConnected(plid)){
   SetVehiclePos(vehicle,X + 2.5, Y, Z + 1.0);
   SetVehicleZAngle(vehicle,angulo);
   SendClientMessage(plid, COR_MECANICO, "Seu veiculo foi consertado.");
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
				SendClientMessage(i, COR_AMARELO, string);
				SendClientMessage(Taximetro[i][1], COR_BRANCO, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
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


public Hotel(playerid)
{
	despeja++;
	despeja%=30;
	SetWorldTime(worldTime);
	
	if(AreaHotel[playerid] == 1){
    if(despeja==30){
    if(IsPlayerConnected(playerid)){
    new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	udb_setPosition(PlayerName(playerid),X, Y, Z);
    udb_setAng(PlayerName(playerid),0);
    udb_setBankMoney(PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)) - 800);
    SendClientMessage(playerid, COR_MEDICO, "AVISO");
    SendClientMessage(playerid, COR_BRANCO, "Voce pagou uma despeja de $800 por causa do seu hotel");
    }
  }
}
}
 
public Radar(){
    for(new i=0;i<MAX_PLAYERS;i++){
    new Float:x,Float:y,Float:z;
    new
    Float:xOff = ppos[i][0] - x,
    Float:yOff = ppos[i][1] - y,
    Float:zOff = ppos[i][2] - z,
    Float:dis = floatsqroot((xOff * xOff) + (yOff * yOff) + (zOff * zOff));
    if(AreaRadar[i] == 1){
    if(Radaron[i] == 1){
    Velocidade[i] = floatround(((dis/1000.0)*60.0)*60.0);
    if(Velocidade[i] > 130 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
    SendClientMessage(i,COR_VERMELHO,"Voce passou em um radar ligado com velocidade alta e levou uma multa de $50.");
    GivePlayerMoney(i,-50);
				    }
		  }
    ppos[i][0] = x;
    ppos[i][1] = y;
    ppos[i][2] = z;
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
			new Float: Health;
			format(tmpstr,256,"~h~~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~w~Veloc¢metro: ~h~~b~%d ~y~km/h ~n~~w~Combust¢vel: ~h~~b~%d ~w~litros ~n~ ~w~Saude:~h~~b~%f",floatround(((dis/1000.0)*60.0)*60.0),Petrol[GetPlayerVehicleID(i)]+100),GetPlayerHealth(GetPlayerVehicleID(i),Health);
            if(IsPlayerInAnyVehicle(i)){
				GameTextForPlayer(i,tmpstr,1000,3);
				Velocidade[i] = floatround(((dis/1000.0)*60.0)*60.0);
				if(Velocidade[i] > 130 && GetPlayerState(i) == PLAYER_STATE_DRIVER && Radaron[i] == 1 && AreaRadar[i] == 1){
				    SendClientMessage(i,COR_VERMELHO,"Você passou por um radar em alta velocidade e levou uma multa de $100.");
				    GivePlayerMoney(i,-100);
				}
			}
            ppos[i][0] = x;
            ppos[i][1] = y;
            ppos[i][2] = z;
		}
	}
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
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "Seu seguro desemprego foi depositado : $350. Arranja um emprego e para com essa de pedir esmola duma vez!");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 350);
				}
				else if(Profissao[i] == TAXISTA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "A companhia de taxi lhe pagou seu salario: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == VENDEDOR_DE_CARROS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono da sua agencia lhe depositou seu salario: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 600);
				}
				else if(Profissao[i] == CORRETOR) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono da sua agencia lhe depositou seu salario: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 600);
                }
				else if(Profissao[i] == ASSASSINO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "Seu Salario foi depositado: $500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 500);
				}
				else if(Profissao[i] == BARMAN) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono do bar lhe depositou seu salario: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
				else if(Profissao[i] == SEGURANÇA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "Sua companhia lhe depositou seu salario: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == MOTORISTA_PARTICULAR) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "Sua companhia lhe depositou seu salario: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == COP_CIVIL) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_RODOVIARIO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
				else if(Profissao[i] == COP_ELITE) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
				else if(Profissao[i] == PESCADOR) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "A companhia de pesca lhe pagou seu salario: $750");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 750);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "A auto escola lhe pagou seu salario: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 600);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "A agencia de onibus lhe depositou seu salario: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
                }
                else if(Profissao[i] == LADRAO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Seu salario foi depositado: $1200");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
                }
                else if(Profissao[i] == ASSALTANTE) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Seu salario foi depositado: $2000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
                }
                else if(Profissao[i] == MESTRE_DO_ROUBO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Seu salario foi depositado: $3000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
                }
                else if(Profissao[i] == GENIO_DO_CRIME) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Seu salário foi depositado: $5000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 5000);
                }
                else if(Profissao[i] == JUIZ_DE_CORRIDA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "A companhia de corridas lhe depositou seu salario: $2400");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2400);
                }
                else if(Profissao[i] == BOMBEIRO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O departamento de bombeiros lhe pagou seu salario: $1500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
                }
                else if(Profissao[i] == INSTRUTOR_COP) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, " O governo lhe pagou seu salario: $1000"),
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
                else if(Profissao[i] == INSTRUTOR_LADRAO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Seu salario foi depositado: $1000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
                else if(Profissao[i] == DETETIVE) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "A sua agencia secreta lhe pagou seu salario: $2000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
				else if(Profissao[i] == EXERCITO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $8000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 8000);
                }
				else if(Profissao[i] == JORNALISTA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "A agencia de noticias lhe depositou seu salario: $1200");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
                }
				else if(Profissao[i] == ADVOGADO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "A companhia de advogados lhe depositou: $1500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
                }
				else if(Profissao[i] == POLICIAL_NARCOTICOS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O governo depositou seu salario: $2500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
                }
				else if(Profissao[i] == MECANICO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O dono da oficina lhe depositou seu salario: $800");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
			    else if(Profissao[i] == MEDICO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O dono do Hospital de SF lhe pagou seu salario: $800");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
                }
                else if(Profissao[i] == ESTADUAL) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Voce recebeu seu salario: $2000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
                else if(Profissao[i] == FEDERAL) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Voce recebeu seu salario: $2500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
				}
		        else if(Profissao[i] == PREFEITO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Voce recebeu seu salario: $4000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4000);
                }
		        else if(Profissao[i] == GOVERNADOR) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Voce recebeu seu salario: $6000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 6000);
                }
	            else if(Profissao[i] == PRESIDENTE) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Voce recebeu seu salario: $8000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 8000);
                }
	            else if(Profissao[i] == SEGURANCA_DE_CARROS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $1000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
	            else if(Profissao[i] == LADRAO_DE_CARROS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Seu salario foi depositado: $700");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 700);
                }
	            else if(Profissao[i] == CONFISCADOR_CARROS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "Seu salario foi depositado: $1000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
	            else if(Profissao[i] == TRAFICANTE) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O chefe da sua boca de fumo lhe pagou: $1200");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
                }
	            else if(Profissao[i] == COP_FBI) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $4500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4500);
                }
	            else if(Profissao[i] == IBAMA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $2500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
                }
	            else if(Profissao[i] == POLICIA_FLORESTAL) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
                    SendClientMessage(i, COR_AMARELOB, "O governo lhe pagou seu salario: $2500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
                }
				else if(Profissao[i] == CACADOR) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "A cooperativa de caça depositou seu salário: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
				else if(Profissao[i] == MOTORISTA_FUGA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "Seu salario foi depositado: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == ONIBUS_VIAGEM) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "A rodoviaria depositou seu salario: $1100");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1100);
                }
				else if(Profissao[i] == PUTA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono do clube lhe pagou seu salario: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
                }
				else if(Profissao[i] == CAFETAO) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono do clube lhe depositou seu salario: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
                }
				else if(Profissao[i] == VENDEDOR_DE_ARMAS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono da ammu-nation lhe pagou seu salario: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                 }
				else if(Profissao[i] == TAXISTA_AEREO) {
				    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono da companhia de taxi lhe depositou seu salario: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
				else if(Profissao[i] == MOTOTAXISTA) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono da companhia de taxi lhe depositou seu salario: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
                }
				else if(Profissao[i] == ALUGUEL_DE_CARROS) {
                    SendClientMessage(i, COR_MEDICO, "Dia de Pagamento");
					SendClientMessage(i, COR_AMARELOB, "O dono da sua locadora lhe depositou seu salario: $1500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
                }
			}
		}
	}
}
