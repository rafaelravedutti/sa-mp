#include <a_samp>
#include <dudb>
#include <dini>
#include <a_sampmysql>

//Cores

#define COLOR_GRAD1 		  		0xB4B5B7AA
#define COLOR_VERDE_AQUA            0x20B2AAAA
#define COLOR_ROSA2                 0xDDA0DDAA
#define COLOR_ORANGE 				0xFF9900AA
#define COLOR_PURPLE 				0x800080AA
#define COLOR_AZULPLUS          	0x4169FFAA
#define COLOR_VERDECLARO       		0x7FFF00AA
#define COLOR_UNLOGGED         		0xAAAAAAAA
#define COLOR_PALHA            		0xF0E68CAA
#define COLOR_ROSA             		0xFF00FFAA
#define COLOR_EMERGENCIA       		0xD06050AA
#define COLOR_GREEN            		0x33AA33AA
#define COLOR_RED              		0xAA3333AA
#define COLOR_RED2             		0xFF0000AA
#define COLOR_YELLOW           		0xFFFF00AA
#define COLOR_WHITE            		0xFFFFFFAA
#define COLOR_GRAY             		0xAFAFAFAA
#define COLOR_DESEMPREGADO     		0x666666AA
#define COLOR_BARMAN           		0x8B4513AA
#define COLOR_ASSASSINO        		0xA52A2AAA
#define COLOR_VENDEDOR_DE_CARROS  	0x009900AA
#define COLOR_CORRETOR         		0x8FBC8FAA
#define COLOR_SEGURAN«A        		0xADD8E6AA
#define COLOR_MOTORISTA  	   		0x33CCFFAA
#define COLOR_MOTORISTA_DE_ONIBUS 	0xF5F5DCAA
#define COLOR_CAMINHONEIRO    		0xE4E4E4AA
#define COLOR_CACADOR          		0xA0522DAA
#define COLOR_PESCADOR         		0xE9967AAA
#define COLOR_ENTREGADOR_PIZZA 		0xF0E68CAA
#define COLOR_TAXISTA          		0xFFFF00AA
#define COLOR_MOTOTAXI         		0xFFC000AA
#define COLOR_TAXI_AEREO       		0xFFA500AA
#define COLOR_INSTRUTOR	       		0xDC143CFF
#define COLOR_TRAFICANTE       		0x878009FF
#define COLOR_JORNALISTA      	 	0x800080AA
#define COLOR_PARAMEDICO       		0xF4EED7AA
#define COLOR_ADVOGADO         		0x18585EAA
#define COLOR_COP_MILITAR      		0x0000FFAA
#define COLOR_COP_RODOVIARIO   		0x1F9FBFAA
#define COLOR_COP_FLORESTAL    		0x45804FAA
#define COLOR_COP_SWAT         		0x00C7FFAA
#define COLOR_COP_NARCOTICOS   		0x057ABDAA
#define COLOR_JUIZ             		0x7FFF00AA
#define COLOR_SHERIFF          		0x81694CAA
#define COLOR_LIXEIRO          		0xAFAFAFFF
#define COLOR_TRANSPORTE_DE_VALORES 0x83BFBFAA
#define COLOR_CONTRABANDISTA   		0xFF6347AA
#define COLOR_RECEITA_FEDERAL  		0xB8860BAA
#define COLOR_AGRICULTOR      		0xFFE4C4AA
#define COLOR_LADRAO_DE_CARROS 		0xFF4500AA
#define COLOR_ASSALTANTE      		0x800000AA
#define COLOR_FRENTISTA          	0xFF7F50AA
#define COLOR_LOCADOR_DE_CARROS 	0xADFF2FAA
#define COLOR_PEDREIRA         		0xBC8F8FAA
#define COLOR_VENDEDOR_DE_ARMAS    	0x10F441AA
#define COLOR_MECANICO              0x677594FF
#define COLOR_PROSTITUTA            0xFF00FFAA

//Profissıes

#define DESEMPREGADO          1//feito
#define BARMAN                2//feito
#define ASSASSINO             3//feito
#define VENDEDOR_DE_CARROS    4//feito
#define CORRETOR              5//feito
#define SEGURAN«A             6//feito
#define MOTORISTA			  7//feito
#define MOTORISTA_DE_ONIBUS   8//feito
#define CAMINHONEIRO          9//feito
#define CACADOR               10//feito
#define PESCADOR              11//feito
#define ENTREGADOR_PIZZA      12//feito
#define TAXISTA               13//feito
#define MOTOTAXI              14//feito
#define TAXI_AEREO            15//feito
#define INSTRUTOR			  16//feito
#define TRAFICANTE            17//feito
#define JORNALISTA            18//feito
#define PARAMEDICO            19//feito
#define ADVOGADO              20//feito
#define COP_MILITAR           21//feito
#define COP_RODOVIARIO        22//feito
#define COP_FLORESTAL         23//feito
#define COP_SWAT              24//feito
#define COP_NARCOTICOS        25//feito
#define JUIZ                  26//feito
#define SHERIFF               27//feito
#define LIXEIRO               28//feito
#define TRANSPORTE_DE_VALORES 29//feito
#define CONTRABANDISTA        30//feito
#define RECEITA_FEDERAL       31//feito
#define AGRICULTOR            32//feito
#define LADRAO_DE_CARROS      33//feito
#define ASSALTANTE            34//feito
#define FRENTISTA             35//feito
#define LOCADOR_DE_CARROS     36//feito
#define PEDREIRA              37//feito
#define VENDEDOR_DE_ARMAS     38//feito
#define MECANICO              39//feito
#define PROSTITUTA            40//feito

//Carros
#define QTCARS                  145
//Desmanche
#define MAX_DESMANCHEVEICULO	19
//Zonas
#define MAX_PLAYERS_ 200
//Casino
#define MAX_CASINO      3
new Float:AreaProibida[MAX_CASINO][4] = {
	{1928.1771,987.5739, 1970.5675,1042.8369},
	{2171.3618,1584.2649, 2279.4915,1628.6199},
	{1117.5068,-11.2747, 1142.4843,12.5986}
};
//Loteria
#define PRECO_TICKET 100 // $100 dolares
//Pra nunca mais crashar o servidor em caso de caracteres especiais
#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256
//define's do velocimetro
#define SPEED   KMPH
#define SLOTS 4
#define CONTRABANDOINI 1
#define CONTRABANDONAVIO 2
#define CONTRABANDONAVIO2 3
#define CONTRABANDORAMPA 4
#define CONTRABANDOFINAL 5
#define NACAMA 1

forward AplicarGasosa(playerid,vehicleid,amount);
forward GatesCoordChecker();
forward ApplyTuningForVehicle(vehicleid);
forward SetPlayerFree(playerid);
forward AvancoLigacao(plcaller,plcalled);
forward CheckFuel();
forward writelog(log[]);
forward TempoPrisao();
forward Taxi();
forward IsNumeric(const string[]);
forward KeyT();
forward ATaxi();
forward ColocarNoVeiculoMot(playerid,vehid);
forward MTaxi();
forward OnPlayerPressKey2(playerid,key);
forward Speed();
forward Caca(playerid);
forward Pesca(playerid);
forward Fazenda(playerid);
forward LeiteA(playerid);
forward Prostituir(playerid);
forward Strip(playerid);
forward Strip3(playerid);
forward Strip4(playerid);
forward PlayerPlaySoundEx(playerid,soundid);
forward minrand(min, max);
forward LogarPlayer(playerid);
forward GetClosestHospital(playerid);
forward Tempo();
forward Bancos(playerid);
forward GetPlayerDistanceToPoint(playerid,Float:x,Float:y);
forward Assalto(playerid);
forward Calma(playerid);
forward open(playerid);
forward Casino();
forward IsStringAName(string[]);
forward GetPlayerID(string[]);
forward CarrosParaAlugar(vehiclemodel_carrosalugar);
forward TempoAlugando(playerid);
forward Desmanche(playerid);
forward LoteriaComeco();
forward strtik(const string[], &index);
forward isPlayerInArea(playerID, Float:data[4]);
forward update_zones();
forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
forward VoteKickTimer();
forward ClearVote(kickedid);
forward Radar();
forward sequestrar();
forward ContrabandoNavio();
forward Desmancheveiculo();
forward OpenGate(gateid);
forward CloseGate(gateid);
forward OnPlayerKeyStateChange2(playerid,newkeys,oldkeys);
forward SetarPosicaoDoVeiculo(vehid,Float:X,Float:Y,Float:Z,Float:ang);
forward AltClientMessage(playerid,color,const message[]);
public AltClientMessage(playerid,color,const message[]) SendClientMessage(playerid,color,message);
forward AcaoEspecial(playerid,actionid);
public AcaoEspecial(playerid,actionid) SetPlayerSpecialAction(playerid,actionid);
public SetarPosicaoDoVeiculo(vehid,Float:X,Float:Y,Float:Z,Float:ang){
	SetVehiclePos(vehid,X,Y,Z);
	SetVehicleZAngle(vehid,ang);
}
public ColocarNoVeiculoMot(playerid,vehid) PutPlayerInVehicle(playerid,vehid,0);
forward CriarVeiculo(m,Float:x,Float:y,Float:z,Float:r,c,d,e);
forward CPD_CPHandler();
forward Placa(vehicleid);

//veiculos

static seta = 1318;
static lombada = 3865;
static vaca = 16442;

static VEH_MONSTER = 	444; //1
static VEH_CARCOPCS = 	599; //2
static VEH_HYDRA = 		520; //3
static VEH_HPV1000 = 	523; //4
static VEH_SABRE = 		475; //5
static VEH_FCR900 = 	521; //6
static VEH_TAXI = 		420; //7
static VEH_ONIBUS = 	437; //8
static VEH_TURISMO = 	451; //9
static VEH_NRG500 = 	522; //10
static VEH_PHOENIX = 	603; //11
static VEH_SUPERGT = 	506; //12
static VEH_ANDROMADA = 	592; //13
static VEH_MANANA = 	410; //14
static VEH_URANUS =     558; //15
static VEH_GREENWOOD = 	492; //16
static VEH_SLAMVAN = 	535; //17
static VEH_LIXEIRO = 	408; //18
static VEH_CARROFORTE = 428; //19
static VEH_LIMUSINE = 	409; //20
static VEH_MAVERICK = 	487; //21
static VEH_SAVANNA = 	567; //22
static VEH_RCCAM = 		594; //23
static VEH_ADMIRAL = 	445; //24
static VEH_BANSHEE = 	429; //25
static VEH_BFINJECT = 	524; //26
static VEH_BLADE = 		536; //27
static VEH_BLISTAC = 	496; //28
static VEH_BOBCAT = 	422; //29
static VEH_BUFFALO = 	402; //30
static VEH_BULLET = 	541; //31
static VEH_FLASH = 		565; //32
static VEH_INFERNUS = 	411; //33
static VEH_JESTER = 	559; //34
static VEH_LANDSTAL = 	400; //35
static VEH_MESA = 		500; //36
static VEH_STRATUM = 	561; //37
static VEH_TRATOR =     531; //38
static VEH_SANCHEZ =    468; //39
static VEH_BF400 = 		581; //40
static VEH_FAGGIO = 	462; //41
static VEH_PCJ600 = 	461; //42
static VEH_AT400 = 		577; //43
static VEH_SHAMAL = 	519; //44
static VEH_RDTRAIN = 	515; //45
static VEH_ENGATE = 	535; //46
static VEH_ELEGY = 		562; //47
static VEH_JETMAX = 	493; //48
static VEH_MARQUIS = 	484; //49
static VEH_REEFER = 	453; //50
static VEH_FREEWAY = 	463; //51
static VEH_BIKE = 		509; //52
static VEH_MTBIKE =     510; //53
static VEH_BMX =        481; //54
static VEH_NEWSVAN =    582; //55
static VEH_WALTON =     478; //56
static VEH_SPARROW =    469; //57
static VEH_CABBIE =     438; //58
static VEH_AMBULANCIA = 416; //59
static VEH_TRAM =       449; //60
static VEH_JOURNEY =    508; //61
static VEH_DUMPER =     406; //62
static VEH_PIZZABOY =   448; //63
static VEH_DODO =       593; //64
static VEH_ELEGANT =    507; //65
static VEH_RCBARON =    464; //66
static VEH_RCGOBLIN =   501; //67
static VEH_REBOQUE =    525; //68
static VEH_MAJESTIC =   517; //69
static VEH_PETROLTANK = 514; //70
static VEH_PETROLTRAI = 584; //71
static VEH_ARTICTRAI =  435; //72
static VEH_HELIPOLICE = 497; //73

//#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

//TEXTDRAWS
new Text:tdDesmanche;
new Text:Bemvindo;
new Text:Bemvindo2;
new Text:Bemvindo3;
new Text:Banco;
new Text:Hotel;
new Text:Posto;
new Text:Delegacia;
new Text:Hospital;
new Text:tdCaca;
new Text:tdCoopCaca;
new Text:tdPesca;
new Text:tdCoopPesca;
new Text:tdAreaCarga;
new Text:tdAreaDescarga;
new Text:tdPlant;
new Text:tdLeite;
new Text:tdColheita;
new Text:tdForte;
new Text:tdPdCarga;
new Text:tdConstrucao;
new Text:td247;
new Text:tdRecarga;
new Text:tdLixao;
new Text:tdStrip;
new Text:GasTD[MAX_PLAYERS];
//---
new AluguelFornecedor[MAX_PLAYERS];
new Alarme[MAX_VEHICLES];
new Dono[MAX_VEHICLES][MAX_STRING];
new GPV[MAX_VEHICLES];
new CellCredits[MAX_PLAYERS];
new AreaDesmanche[MAX_PLAYERS];
new AreaHotel[MAX_PLAYERS];
new AreaDeleg[MAX_PLAYERS];
new AreaHosp[MAX_PLAYERS];
new ftlog[256];
new Float:ppos[MAX_PLAYERS][3];
new PLAYERLIST_authed[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new AreaCreditos[MAX_PLAYERS];
new MissaoLixeiro[MAX_PLAYERS] = 0;
new LixoColetado[MAX_PLAYERS] = 0;
new AreaLixao[MAX_PLAYERS] = 0;
new PrisaoTimer[MAX_PLAYERS][2];
new TempoCalma[MAX_PLAYERS] = 0;
new EsperaTempoPassar[MAX_PLAYERS] = 0;
//Pesca
new AreaPesca[MAX_PLAYERS] = 0;
new Piracema = 0;
new AreaCoopPesca[MAX_PLAYERS] = 0;
new PescaInProgress[MAX_PLAYERS] = 0;
new QtPescas[MAX_PLAYERS] = 0;
//CaÁa
new TemporadaCaca = 1;
new AreaCaca[MAX_PLAYERS] = 0;
new AreaCoopCaca[MAX_PLAYERS] = 0;
new CacaInProgress[MAX_PLAYERS] = 0;
new QtCacas[MAX_PLAYERS] = 0;
//Sequestro
new Sequestro[MAX_PLAYERS] = 0;
new Cativeiro[MAX_PLAYERS] = 0;
new TempoSequestro[MAX_PLAYERS];
//Caminhoneiros
new AreaCarga[MAX_PLAYERS] = 0;
new AreaDescarga[MAX_PLAYERS] = 0;
new Carregamento[MAX_PLAYERS] = 0;
//Aluguel de carros
new CarroAlugado[MAX_PLAYERS] = 0;
new TempoAlugar[MAX_PLAYERS] = 0;
new TmpAlugar[MAX_PLAYERS] = 0;
new JogadorNoCarro[MAX_PLAYERS] = 0;
new OferecerCarro[MAX_PLAYERS] = 0;
new alugado1;
new alugado2;
new alugado3;
new alugado4;
new alugado5;
new alugado6;
new alugado7;
new alugado8;
new alugado9;
new Pickup_EntradaCPD;
new Pickup_SaidaCPD;
new Float:CPD_CPPositions[6][3] = {
    {362.7719,173.7793,1008.3828}, // COORDENADA PRINCIPIANTE CP
	{361.8476,205.0786,1008.3828}, // CHECK_LEVEL20
	{355.6021,161.8357,1019.9844}, // CP_LEVEL 40
	{362.6747,171.6730,1025.7891}, // ANTEPENULTIMO_CP
	{362.8526,151.2095,1025.7964}, // PENULTIMO_CP
	{354.8842,172.7762,1025.7964} // ULTIMO_CP
};
new ExPoints[MAX_PLAYERS];
new CPD_CPHandling[MAX_PLAYERS];
//Roubo
new TempoAssalto[MAX_PLAYERS] = 0;
//Desmanche
new TempoDesmanche[MAX_PLAYERS] = 0;
//gate
new Float:rx;
new Float:ry;
new Float:rz;
new PortaoFechando[3];
new PortaoAbrindo[3];
new PortaoTimer[3];
new ContagemPortao[3];
new PortaoAberto[3];
//Fazenda
new AreaFazenda[MAX_PLAYERS] = 0;
new AreaCoopFazenda[MAX_PLAYERS] = 0;
new FazendaInProgress[MAX_PLAYERS] = 0;
new QtMilho[MAX_PLAYERS] = 0;
new Leite[MAX_PLAYERS] = 0;
new LeiteInProgress[MAX_PLAYERS] = 0;
new QtLeite[MAX_PLAYERS] = 0;
//Transporte
new AreaForte[MAX_PLAYERS] = 0;
new Carga[MAX_PLAYERS] = 0;
//Contrabando
new Contrabando[MAX_PLAYERS];
new CheckpointStatus[MAX_PLAYERS];
new ContrabandoPassar[MAX_PLAYERS] = 0;
new Receita[MAX_PLAYERS] = 0;
new nCheckpointStatus[MAX_PLAYERS];
//Vededor de Armas
new Armas[MAX_PLAYERS];
new Armaoferecida[MAX_PLAYERS] = 0;
//Pedeira
new PedreiraCarga[MAX_PLAYERS] = 0;
new Construcao[MAX_PLAYERS] = 0;
new Pedras[MAX_PLAYERS] = 0;
//defines de coisas
new Menu:Bombshop;
new Menu:Bombshopveh;
new Menu:CPD_First;
new Menu:CPD_Second;
new Menu:CPD_Third;
new Menu:CPD_Fourth;
new Menu:CPD_Fifth;
new Menu:CPD_Sixth;
new AreaBombShop[MAX_PLAYERS];
new DebugKeys[MAX_PLAYERS] = 0;
new Escondido[MAX_PLAYERS] = 0;
new Veiculo[MAX_PLAYERS];
//new Bonde;
new Previsao;
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
new worldMinute;
new worldTime;
new Bebida[MAX_PLAYERS] = 0;
new Maconha[MAX_PLAYERS] = 0;
new Heroina[MAX_PLAYERS] = 0;
new Cocaina[MAX_PLAYERS] = 0;
new Velo[MAX_PLAYERS];
new Velocidade[MAX_PLAYERS];
new Perseguicao[MAX_PLAYERS] = 0;
new Chave[MAX_PLAYERS] = 0;
//Prostituta
new Transacama[MAX_PLAYERS] = 0;
new AreaStrip[MAX_PLAYERS];
new Prostitutacama[MAX_PLAYERS];
new Strip2[MAX_PLAYERS] = 0;
new Prostitutacama2[MAX_PLAYERS];
//Loteria
new Aposta[MAX_PLAYERS][6];
new Acertos[MAX_PLAYERS];
new bool:PlayerDentro[MAX_PLAYERS];
//Reboque
new Reboques=0;
new isTowtruck[MAX_PLAYERS];
//Casino
new AreaCasino[MAX_PLAYERS];
//Zonas
new zoneupdates[MAX_PLAYERS_];
new player_zone[MAX_PLAYERS_];
new zoneupdate;
//Celular
new CellTimer[MAX_PLAYERS];
new Chamando[MAX_PLAYERS];
new CobrancaCall[MAX_PLAYERS];
new EmLigacao[MAX_PLAYERS];
new CalledID[MAX_PLAYERS];
new LastPN;
new LastCar;
new RingTone[MAX_PLAYERS];
new gdebug = 1;
new BigEar[MAX_PLAYERS];
enum pInfo
{
	pPnumber,
	pPhousekey,
};
new PlayerInfo[MAX_PLAYERS][pInfo];
new celular[MAX_PLAYERS];
new Agenda[MAX_PLAYERS];
//Mortes lvl
new Kills[MAX_PLAYERS];
new Gates[4];
//VoteKick
new KickVote[MAX_PLAYERS];
new VoteKick[MAX_PLAYERS];
new LastVote[MAX_PLAYERS];
new numplayers = 0;
public CriarVeiculo(m,Float:x,Float:y,Float:z,Float:r,c,d,e){
	new resid,tmp[256],own[256];
	resid = CreateVehicle(m,x,y,z,r,c,d,600000);
	if(e == -1){
		set(own,"Governo");
	} else {
	    set(own,PlayerName(e));
	}
	set(Dono[resid],own);
    format(tmp,256,"%d.vinfo",resid);
    dini_Create(tmp);
    dini_Set(tmp,"dono",own);
	switch(m){
	    case 481,509,510,594:
	        {
	            dini_IntSet(tmp,"gasolina",-1);
	            GPV[resid]=-1;
			}
		default:
		    {
		        dini_IntSet(tmp,"gasolina",100);
		        GPV[resid]=100;
			}
	}
}
//[Arrays necess·rias]
new Float:Celas[][] = {
	{227.6684,110.1895,999.0156},
	{223.0134,110.3193,999.0156},
	{219.3730,110.2772,999.0156},
	{214.9654,109.4626,999.0156}
};


//Lixeiras
new Float:LixeirasCheckpoints[74][3] = {
	{-161.0533,1174.8231,19.7422},
	{-169.9686,1170.0933,19.7500},
	{-89.5499,1127.7946,19.7422},
	{-219.0813,1165.2712,19.7422},
	{-168.9296,1027.2073,19.7344},
	{-122.5816,1080.0015,19.7788},
	{-2488.3569,2539.0354,18.0562},
	{2255.8774,2527.1499,10.8203},
	{2262.2607,2564.5474,10.8202},
	{2544.5713,2318.8320,10.8133},
	{2515.2197,2316.5542,10.8203},
	{2551.1072,2244.9885,10.8203},
	{2597.4719,2077.3086,10.8203},
	{2597.2158,2071.3884,10.8130},
	{2597.1104,2044.9716,10.8203},
	{2675.5828,1705.6161,10.8203},
	{2675.1670,1666.3903,10.8203},
	{2675.4636,1826.3031,10.8203},
	{2657.7800,1940.8837,10.8203},
	{2179.8164,1419.4374,10.8203},
	{1678.4476,1166.3718,10.8203},
	{1687.4487,1251.3823,10.7490},
	{1519.2963,979.4398,10.8203},
	{1519.4396,972.1034,10.8203},
	{1558.8448,969.7551,10.8203},
	{1667.0028,912.7361,10.7148},
	{1637.2725,892.1777,10.7225},
	{1633.1637,665.1866,10.8203},
	{1665.8140,2056.2122,10.8203},
	{1660.8794,2085.2131,10.8203},
	{1664.2474,2108.1174,10.8203},
	{724.8134,-465.3358,16.3359},
	{780.9294,-595.2310,16.3359},
	{195.1865,-180.0826,1.5781},
	{160.5844,-175.5925,1.5781},
	{253.9077,-160.7479,1.5703},
	{253.8341,-153.9057,1.5703},
	{255.5944,-133.8832,1.5781},
	{260.1812,-133.7466,1.5781},
	{266.9190,-134.0600,1.5781},
	{245.0523,-43.5894,1.5853},
	{343.1069,-78.5039,1.4234},
	{345.3282,-102.9888,1.3436},
	{1416.9526,270.7458,19.5618},
	{1352.1171,203.1920,19.5547},
	{1369.9030,199.2469,19.5547},
	{1299.1567,220.7018,19.5547},
	{2273.0247,64.2270,26.4844},
	{654.6854,-440.0193,16.3359},
	{694.5139,-455.8463,16.3359},
	{653.7773,-497.6555,16.3359},
	{666.7076,-623.6600,16.3359},
	{777.5923,1866.4501,4.8751},
	{2491.7952,-1655.3499,13.3762},
	{2399.7366,-1722.5333,13.1659},
	{2177.8809,-1343.1554,23.9844},
	{805.7858,-1057.6353,24.7345},
	{1068.4235,-1132.6014,23.8281},
	{539.5020,-1261.1362,16.4641},
	{498.0841,-1294.5765,15.6489},
	{401.2081,-1339.0613,14.2121},
	{545.0730,-1518.8091,14.4370},
	{951.6190,-978.9124,38.8653},
	{1075.7140,-963.9644,42.3192},
	{1146.1953,-959.1254,42.5880},
	{1245.9070,-943.1398,42.4271},
	{1780.9406,-1180.0648,23.8281},
	{1723.9698,-1270.5125,13.5469},
	{1461.4204,-1488.4612,13.5469},
	{1698.8551,-1720.3446,13.1159},
	{1919.9664,-2123.1597,13.5849},
	{1919.7251,-2088.1360,13.5803},
	{1337.6675,-1773.3949,13.5469},
	{1337.6957,-1842.7949,13.5469}
};
//[Arrays necess·rias]
new ProfLevel[] = {
	0,
	0,
	0,
	10,
	100,
	100,
	20,
	30,
	20,
	30,
	10,
	10,
	0,
	0,
	0,
	20,
	90,
	50,
	30,
	40,
	100,
	90,
	90,
	80,
	110,
	90,
	150,
	140,
	10,
	40,
	60,
	70,
	50,
	40,
	30,
	30,
	70,
    20,
    60,
    70,
    50
};
new ProfExtName[][] = {
	"Inv·lida",
	"Desempregado",
	"Barman",
	"Assassino",
	"Vendedor de carros",
	"Corretor",
	"SeguranÁa",
	"Motorista Particular",
	"Motorista De ‘nibus",
	"Caminhoneiro",
	"CaÁador",
	"Pescador",
	"Entregador De Pizza",
	"Taxista",
	"Mototaxista",
	"Taxista AÈreo",
	"Instrutor De DireÁ„o",
	"Traficante",
	"Jornalista",
	"ParamÈdico",
	"Advogado",
	"Cop Militar",
	"Cop Rodovi·rio",
	"Cop Florestal",
	"Cop Elite/SWAT",
	"Cop Narcoticos",
	"Juiz",
	"Xerife",
	"Lixeiro",
	"Transporte De Valores",
	"Contrabandista",
	"Receita Federal",
 	"Agricultor",
 	"Ladr„o De Carros",
 	"Assaltante",
 	"Frentista",
 	"Locador De Carros",
 	"Pedreira",
 	"Vendedor De Armas",
 	"Mec‚nico",
 	"Prostituta"
};
new ProfGT[][] = {
	"Invòlida",
	"Desempregado",
	"Barman",
	"Assassino",
	"Vendedor de carros",
	"Corretor",
	"Seguranúa",
	"Motorista Particular",
	"Motorista de ßnibus",
	"Caminhoneiro",
	"Caúador",
	"Pescador",
	"Entregador de Pizza",
	"Taxista",
	"Mototaxista",
	"Taxista Aûreo",
	"Instrutor de Direúöo",
	"Traficante",
	"Jornalista",
	"Paramûdico",
	"Advogado",
	"Pol¢cia Militar",
	"Pol¢cia Rodoviòria",
	"Pol¢cia Florestal",
	"Pol¢cia SWAT",
	"Pol¢cia Narc¶ticos",
	"Juiz",
	"Xerife",
	"Lixeiro",
	"Transporte De Valores",
	"Contrabandista",
	"Receita Federal",
 	"Agricultor",
 	"Ladröo de Carros",
 	"Assaltante",
 	"Frentista",
 	"Locador De Carros",
 	"Pedreira",
 	"Vendedor De Armas",
 	"Mecanico",
 	"Prostituta"
};
new IntSalario[] = {
	0,
	350,
	800,
	400,
	350,
	350,
	1000,
	2000,
	2000,
	1500,
	2000,
	1500,
	900,
	2000,
	1000,
	1500,
	850,
	1000,
	1500,
	1000,
	1000,
	1500,
	1400,
	1800,
	2000,
	2000,
	4000,
	4500,
	1000,
	1200,
	800,
	3000,
	1200,
	1000,
	600,
	1200,
	1000,
	1500,
	1400,
	1000,
	800
};
new StringsSalario[][] = {
	"invalido",
	"Seu seguro desemprego foi depositado, nao vai procurar emprego? $350",
	"O BAR para o qual vocÍ trabalha depositou seu sal·rio: $800",
	"A AgÍncia de crimes de San Andreas depositou seu sal·rio $400",
	"A revendedora [MPA] veÌculos depositou seu sal·rio: $350",
	"A imobiliaria San fierro imoveis depositou seu sal·rio: $350",
	"A SegurityLife depositou seu sal·rio: $1000",
	"A empresa LuxLimosine depositou seu sal·rioo: $2000",
	"A Companhia de Onib˚s depositou seu sal·rio: $2000",
	"A cooperativa de caminhoneiros depositou seu sal·rio mensal: $1500",
	"Sal·rio da cooperativa recebido: $2000",
	"A cooperativa ja depositou seu sal·rio: $1500",
	"A pizzaria depositou seu sal·rio: $900",
	"Seu sal·rio governamental foi depositado: $2000",
	"VocÍ recebeu seu sal·rio depostiado pela companhia: $1000",
	"A companhia de taxi areo depositou seu sal·rio: $1500",
	"A Auto-escola ja depostiou seu sal·rio: $850",
	"VocÍ ja recebeu a grana da boca de fumo que vocÍ comanda: $1000",
	"A editora do jornal FOLHA DE SAN ANDREAS depositou seu sal·rio: $1500",
	"O hospital depositou seu sal·rio: $1000",
	"Seu sal·rio governamental foi depositado: $1000",
	"Seu sal·rio governamental foi depositado: $1200",
	"Seu sal·rio governamental foi depositado: $1400",
	"Seu sal·rio governamental foi depositado: $1800",
	"Seu sal·rio governamental foi depositado: $2000",
	"Seu sal·rio governamental foi depositado: $2000",
	"Seu sal·rio governamental foi depositado: $4000",
	"A prefeitura de Fort Carson depositou seu sal·rio: $4500",
	"O lix„o de San Andreas depositou seu sal·rio: $1000",
	"A Central 24/7 depositou seu sal·rio: $1200",
	"Contrabando lhe gerou: $800",
	"A prefeitura de Fort Carson depositou seu sal·rio: 3000",
	"A fazenda depositou seu sal·rio: $1200",
	"O seu desmanche rendeu: $1000",
	"A partilha dos roubos deu: $600",
	"A Motos S/A LTDA depositou seu sal·rio: $1200",
	"A San Andreas Company CAR depositou seu sal·rio: $1000",
	"A Pedreira de SA depositou seu sal·rio: $1500",
	"A Ammu Nation depositou seu sal·rio: $1400",
	"A Pay 'n' Spray depositou seu sal·rio: $1000",
	"A Boate depositou seu sal·rio: $800"
};
new ProfColors[] = {
	COLOR_UNLOGGED,
	COLOR_DESEMPREGADO,
	COLOR_BARMAN,
	COLOR_ASSASSINO,
	COLOR_VENDEDOR_DE_CARROS,
	COLOR_CORRETOR,
	COLOR_SEGURAN«A,
	COLOR_MOTORISTA,
	COLOR_MOTORISTA_DE_ONIBUS,
	COLOR_CAMINHONEIRO,
	COLOR_CACADOR,
	COLOR_PESCADOR,
	COLOR_ENTREGADOR_PIZZA,
	COLOR_TAXISTA,
	COLOR_MOTOTAXI,
	COLOR_TAXI_AEREO,
	COLOR_INSTRUTOR,
	COLOR_TRAFICANTE,
	COLOR_JORNALISTA,
	COLOR_PARAMEDICO,
	COLOR_ADVOGADO,
	COLOR_COP_MILITAR,
	COLOR_COP_RODOVIARIO,
	COLOR_COP_FLORESTAL,
	COLOR_COP_SWAT,
	COLOR_COP_NARCOTICOS,
	COLOR_JUIZ,
	COLOR_SHERIFF,
    COLOR_LIXEIRO,
    COLOR_TRANSPORTE_DE_VALORES,
    COLOR_CONTRABANDISTA,
    COLOR_RECEITA_FEDERAL,
    COLOR_AGRICULTOR,
    COLOR_LADRAO_DE_CARROS,
    COLOR_ASSALTANTE,
    COLOR_FRENTISTA,
    COLOR_LOCADOR_DE_CARROS,
    COLOR_PEDREIRA,
    COLOR_VENDEDOR_DE_ARMAS,
    COLOR_MECANICO,
    COLOR_PROSTITUTA
};
new Float:Hospitais[5][4] = {
	    {-2651.6501,634.1177,14.4531,180.0},//Hospital de SF
		{1173.5842,-1324.5615,15.1953,15.19},
		{2031.9415,-1404.3578,17.2614,17.2614},
		{1582.5615,1768.7921,10.8203,93.7454},
		{-320.7639,1065.8195,19.7422,136.0}
};
new Float:ProfPos[41][3] = {
	{223.0134,110.3193,999.0156},//Nothing
	{-152.1129,1191.0045,19.7422},//Desempregado
	{-86.6516,1378.5789,10.2734},//Barman
	{-2179.8931,610.6476,35.1641},//Assassino
	{-1641.7799,1203.8638,7.2498},//Vendedor
	{-177.9783,1111.1385,19.7422},//Corretor
	{-152.1129,1191.0045,19.7422},//SeguranÁa
	{-152.1129,1191.0045,19.7422},//Motorista
	{-148.5886,1196.7148,19.5938},//MOnibus
	{634.2159,1682.4813,6.9922},//Caminhoneiro
	{-367.1192,1167.3363,19.7422},//CaÁador
	{-641.5233,866.1360,2.0000},//Pescador
	{162.3515,1163.7163,14.7709},//EPizza
	{-209.0711,1096.2046,19.5965},//Taxi
	{-152.1129,1191.0045,19.7422},//MTaxi
	{-152.1129,1191.0045,19.7422},//ATaxi
	{-141.9775,1141.4825,19.7422},//Instrutor
	{1.4458,1375.5756,9.1719},//Traficante
	{-310.8573,1513.5563,75.3594},//Jornalista
	{-320.7639,1065.8195,19.7422},//ParamÈdico
	{-204.2881,1120.1758,19.7422},//Advogado
	{-204.2438,980.7769,19.1387},//PolÌcia Militar
	{-299.1079,860.0412,10.0216},//PolÌcia Rodovi·ria
	{-210.5957,999.9250,19.6665},//PolÌcia Florestal
	{-204.2438,980.7769,19.1387},//PolÌcia Swat/Elite
	{-204.2438,980.7769,19.1387},//PolÌcia Narcoticos
	{-204.2881,1120.1758,19.7422},//Juiz
	{-204.1645,984.9893,19.3585},//Xerife
	{-1859.1014,-1650.5037,26.6171},//Lixeiro
	{2546.9211,1963.0864,10.8203},//Transporte de Valores
	{1784.0015,-1887.9911,13.3922},//Contrabandista
	{1481.0403,-1768.0181,18.7958},//Receita Federal
	{-1060.5527,-1195.2561,129.5891},//Agricultor
	{-2.6073,1191.3276,19.3594},//Ladr„o de carros
	{-2.6073,1191.3276,19.3594},//Assaltante
	{-301.3666,1164.5613,19.9462},//FRENTISTA
	{-1641.7799,1203.8638,7.2498},//Locador de Carros
	{817.2215,856.4513,12.7891},//Pedreira
	{2399.0503,-1965.6858,13.5469},//Vendedor de Armas
	{-100.3231,1106.6963,19.7422},//Mec‚nico
	{694.1411,1934.5900,5.5391}
};
new ProfSkin[] = {
	0,//Nothing
	0,//Desempregado
	171,//Barman
	127,//Assassino
	187,//Vendedor
	59,//Corretor
	165,//SeguranÁa
	255,//Motorista Particular
	112,//Motorista De Onibus
	95,//Caminhoneiro
	58,//CaÁador
	128,//Pescador
	155,//Entregador De Pizza
	234,//Taxista
	52,//Moto-Taxi
	61,//Aero-Taxi
	188,//Instrutor
	28,//Traficante
	37,//Jornalista
	276,//Paramedico
	147,//Advogado
	282,//COP Militar
	283,//COP Rodovi·rio
	288,//COP Florestal
 	285,//COP Swat
 	126,//COP NarcÛticos
	57,//Juiz
	34,//Sheriff
	137,//Lixeiro
	71,//Transportador De Valores
	127,//Contrabandista
	165,//Receita Federal
	159,//Agricultor
	22,//Ladr„o De Carros
	19,//Assaltante
	59,//FRENTISTA
	147,//Locador De Carros
	27,//Pedreira
	179,//Vendedor de Armas
	50,//Mec‚nico
	246//Prostituta
};
new WeatherName[][] = {
	"Super ensolarado, 40 graus",
	"Ensolarado, 30 graus",
	"Super ensolarado, com smog, 35 graus",
	"Ensolarado, com smog, 29 graus",
	"Nublado, 25 graus",
	"Ensolarado, 30 graus",
	"Super ensolarado, 40 graus",
	"Nublado, 25 graus",
	"Tempestade, ventos fortes e trovıes, 20 graus",
	"Neblina, 15 graus",
	"Ensolarado, 35 graus",
	"Super ensolarado, 45 graus",
	"Nublado, 30 graus",
	"Super ensolarado, 38 graus",
	"Ensolarado, 28 graus",
	"Nublado, 24 graus",
	"Chuvoso, 22 graus",
	"Super ensolarado, 50 graus",
	"Ensolarado, 40 graus",
	"Tempestade de areia, 45 graus"
};
//Armas Nomes
new weaponname[][] = {
	"M„o livre",
	"Soco InglÍs",
	"Taco de Golfe",
	"Cacetete",
	"Faca",
	"Taco de Baseball",
	"Shovel",
	"Taco de Sinuca",
	"Katana",
	"Motosserra",
	"Vibrador roxo de duas pontas",
	"Vibrador branco grande",
	"Vibrador branco mÈdio",
	"Vibrador prata pequeno",
	"Flores",
	"Bengala",
	"Granada",
	"Teargas",
	"Coquetel Molotov",
	"LanÁa Foguetes",
	"LanÁa-Foguetes Tele-guiado",
	"Hydra Rocket",
	"Pistola",
	"Silenced Pistol",
	"Desert Eagle",
	"Escopeta Calibre 12",
	"Escopeta de Cano Serrado",
	"Escopeta de Combate",
	"Micro Uzi",
	"MP5",
	"AK47",
	"M4",
	"Tec9",
	"Country Rifle"
};
new valorarma[] = {
	0,
	500,
	600,
	650,
	750,
	350,
	400,
	300,
	800,
	1000,
	100,
	100,
	100,
	100,
	100,
	150,
	300,
	300,
	0,
	0,
	0,
	0,
	800,
	1000,
	3000,
	1800,
	6000,
	7500,
	8000,
	5500,
	7500,
	9000,
	8000,
	4000
};
new armamuni[] = {
	0,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	4,
	4,
	0,
	0,
	0,
	0,
	100,
	100,
	100,
	46,
	80,
 	80,
 	300,
 	300,
  	150,
  	150,
  	300,
  	80,
  	0
};

new ProfWeapons[][8] = {
	{0,0,0,0,0,0,0,0},//nothing
	{41,500,5,0,0,0,0,0},//desempregado
	{2,1,41,100,0,0,0,0},//barman
	{6,1,4,1,23,350,0,0},//assassino
	{2,1,14,5,0,0,0,0},//vendedor
	{15,1,41,500,14,1,0,0},//corretor
	{24,350,3,1,0,0,0,0},//seguranÁa
	{5,1,41,500,0,0,0,0},//motorista particular
	{42,400,5,1,0,0,0,0},//motorista de onibus
	{41,500,5,1,0,0,0,0},//caminhoneiro
	{33,100,4,1,0,0,0,0},//caÁador
	{4,1,42,500,0,0,0,0},//pescador
	{46,1,5,1,41,500,14,1},//entregador
	{42,500,5,0,0,0,0,0},//taxista
	{5,1,42,100,14,1,0,0},//mototaxi
   	{24,100,42,100,46,1,0,0},//taxi aereo
	{14,1,42,1,5,1,0,0},//instrutor
	{22,355,41,600,4,1,0,0},//traficante
	{2,1,46,1,5,1,0,0},//jornalista
	{41,500,5,1,0,0,0,0},//paramÈdico
	{14,1,15,1,24,60,0,0},//advogado
	{3,1,24,500,25,100,0,0},//cop militar
	{3,1,24,500,32,300,25,100},//rodoviario
	{3,1,24,500,32,300,25,100},//florestal
	{29,300,24,500,27,100,31,300},//swat
	{3,1,24,500,25,100,0,0},//cop narcoticos
	{15,1,22,300,0,0,0,0},//juÌz
	{24,500,32,300,25,100,0,0},//xerife
	{32,400,24,60,7,1,0,0},//lixeiro
	{24,60,25,80,0,0,0,0},//transporte valores
	{28,400,4,1,23,80,0,0},//contrabandista
	{27,400,3,1,24,100,0,0},//receita
	{33,80,6,1,0,0,0,0},//agricultor
	{22,100,1,1,28,500,0,0},//ladrao carros
	{29,400,24,60,4,1,0,0},//assaltante
	{29,460,22,60,5,1,4,1},//frentista
	{29,400,5,1,24,80,0,0},//locador
	{42,400,5,1,22,100,0,0},//pedreira
	{29,460,24,60,0,0,0,0},//vendedor armas
	{29,460,22,60,5,1,4,1},//mecanico
	{29,460,22,60,5,1,4,1}
};

//[/Arrays necess·rias]
new carrosalugar[] =
{
	560
};
//Desmanche
new Veiculoprocurado;
new Veiculosprocurados[MAX_DESMANCHEVEICULO] = {
	463,
	461,
	411,
	468,
	541,
	424,
	402,
	415,
	562,
	587,
	565,
	521,
	434,
	559,
 	400,
 	522,
 	535,
 	560,
 	451
};
new Veiculosprocuradosnome[MAX_DESMANCHEVEICULO][32] = {
	"Freeway",
	"PCJ-600",
	"Infernus",
	"Sanchez",
	"Bullet",
	"BjInject",
	"Buffalo",
	"Cheetah",
	"Elegy",
	"Euros",
	"Flash",
	"FCR-900",
	"HotKnife",
	"Jester",
	"Landstal",
	"Nrg-500",
	"Slamvam",
	"Sultan",
	"Turismo"
};
// ZONES
enum zoneinfo {
	zone_name[27],
    Float:zone_minx,
    Float:zone_miny,
    Float:zone_minz,
    Float:zone_maxx,
    Float:zone_maxy,
    Float:zone_maxz
}
new Float:zones[][zoneinfo] = {
{ "'The Big Ear'",                -410.00,  1403.30,    -3.00,  -137.90,  1681.20,   200.00},
{ "Aldea Malvada",               -1372.10,  2498.50,     0.00, -1277.50,  2615.30,   200.00},
{ "Angel Pine",                  -2324.90, -2584.20,    -6.10, -1964.20, -2212.10,   200.00},
{ "Arco del Oeste",               -901.10,  2221.80,     0.00,  -592.00,  2571.90,   200.00},
{ "Avispa Country Club",         -2646.40,  -355.40,     0.00, -2270.00,  -222.50,   200.00},
{ "Avispa Country Club",         -2831.80,  -430.20,    -6.10, -2646.40,  -222.50,   200.00},
{ "Avispa Country Club",         -2361.50,  -417.10,     0.00, -2270.00,  -355.40,   200.00},
{ "Avispa Country Club",         -2667.80,  -302.10,   -28.80, -2646.40,  -262.30,    71.10},
{ "Avispa Country Club",         -2470.00,  -355.40,     0.00, -2270.00,  -318.40,    46.10},
{ "Avispa Country Club",         -2550.00,  -355.40,     0.00, -2470.00,  -318.40,    39.70},
{ "Back o Beyond",               -1166.90, -2641.10,     0.00,  -321.70, -1856.00,   200.00},
{ "Battery Point",               -2741.00,  1268.40,    -4.50, -2533.00,  1490.40,   200.00},
{ "Bayside",                     -2741.00,  2175.10,     0.00, -2353.10,  2722.70,   200.00},
{ "Bayside Marina",              -2353.10,  2275.70,     0.00, -2153.10,  2475.70,   200.00},
{ "Beacon Hill",                  -399.60, -1075.50,    -1.40,  -319.00,  -977.50,   198.50},
{ "Blackfield",                    964.30,  1203.20,   -89.00,  1197.30,  1403.20,   110.90},
{ "Blackfield",                    964.30,  1403.20,   -89.00,  1197.30,  1726.20,   110.90},
{ "Blackfield Chapel",            1375.60,   596.30,   -89.00,  1558.00,   823.20,   110.90},
{ "Blackfield Chapel",            1325.60,   596.30,   -89.00,  1375.60,   795.00,   110.90},
{ "Blackfield Intersection",      1197.30,  1044.60,   -89.00,  1277.00,  1163.30,   110.90},
{ "Blackfield Intersection",      1166.50,   795.00,   -89.00,  1375.60,  1044.60,   110.90},
{ "Blackfield Intersection",      1277.00,  1044.60,   -89.00,  1315.30,  1087.60,   110.90},
{ "Blackfield Intersection",      1375.60,   823.20,   -89.00,  1457.30,   919.40,   110.90},
{ "Blueberry",                     104.50,  -220.10,     2.30,   349.60,   152.20,   200.00},
{ "Blueberry",                      19.60,  -404.10,     3.80,   349.60,  -220.10,   200.00},
{ "Blueberry Acres",              -319.60,  -220.10,     0.00,   104.50,   293.30,   200.00},
{ "Caligula's Palace",            2087.30,  1543.20,   -89.00,  2437.30,  1703.20,   110.90},
{ "Caligula's Palace",            2137.40,  1703.20,   -89.00,  2437.30,  1783.20,   110.90},
{ "Calton Heights",              -2274.10,   744.10,    -6.10, -1982.30,  1358.90,   200.00},
{ "Chinatown",                   -2274.10,   578.30,    -7.60, -2078.60,   744.10,   200.00},
{ "City Hall",                   -2867.80,   277.40,    -9.10, -2593.40,   458.40,   200.00},
{ "Come-A-Lot",                   2087.30,   943.20,   -89.00,  2623.10,  1203.20,   110.90},
{ "Commerce",                     1323.90, -1842.20,   -89.00,  1701.90, -1722.20,   110.90},
{ "Commerce",                     1323.90, -1722.20,   -89.00,  1440.90, -1577.50,   110.90},
{ "Commerce",                     1370.80, -1577.50,   -89.00,  1463.90, -1384.90,   110.90},
{ "Commerce",                     1463.90, -1577.50,   -89.00,  1667.90, -1430.80,   110.90},
{ "Commerce",                     1583.50, -1722.20,   -89.00,  1758.90, -1577.50,   110.90},
{ "Commerce",                     1667.90, -1577.50,   -89.00,  1812.60, -1430.80,   110.90},
{ "Conference Center",            1046.10, -1804.20,   -89.00,  1323.90, -1722.20,   110.90},
{ "Conference Center",            1073.20, -1842.20,   -89.00,  1323.90, -1804.20,   110.90},
{ "Cranberry Station",           -2007.80,    56.30,     0.00, -1922.00,   224.70,   100.00},
{ "Creek",                        2749.90,  1937.20,   -89.00,  2921.60,  2669.70,   110.90},
{ "Dillimore",                     580.70,  -674.80,    -9.50,   861.00,  -404.70,   200.00},
{ "Doherty",                     -2270.00,  -324.10,    -0.00, -1794.90,  -222.50,   200.00},
{ "Doherty",                     -2173.00,  -222.50,    -0.00, -1794.90,   265.20,   200.00},
{ "Downtown",                    -1982.30,   744.10,    -6.10, -1871.70,  1274.20,   200.00},
{ "Downtown",                    -1871.70,  1176.40,    -4.50, -1620.30,  1274.20,   200.00},
{ "Downtown",                    -1700.00,   744.20,    -6.10, -1580.00,  1176.50,   200.00},
{ "Downtown",                    -1580.00,   744.20,    -6.10, -1499.80,  1025.90,   200.00},
{ "Downtown",                    -2078.60,   578.30,    -7.60, -1499.80,   744.20,   200.00},
{ "Downtown",                    -1993.20,   265.20,    -9.10, -1794.90,   578.30,   200.00},
{ "Downtown Los Santos",          1463.90, -1430.80,   -89.00,  1724.70, -1290.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1430.80,   -89.00,  1812.60, -1250.90,   110.90},
{ "Downtown Los Santos",          1463.90, -1290.80,   -89.00,  1724.70, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1384.90,   -89.00,  1463.90, -1170.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1250.90,   -89.00,  1812.60, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1170.80,   -89.00,  1463.90, -1130.80,   110.90},
{ "Downtown Los Santos",          1378.30, -1130.80,   -89.00,  1463.90, -1026.30,   110.90},
{ "Downtown Los Santos",          1391.00, -1026.30,   -89.00,  1463.90,  -926.90,   110.90},
{ "Downtown Los Santos",          1507.50, -1385.20,   110.90,  1582.50, -1325.30,   335.90},
{ "East Beach",                   2632.80, -1852.80,   -89.00,  2959.30, -1668.10,   110.90},
{ "East Beach",                   2632.80, -1668.10,   -89.00,  2747.70, -1393.40,   110.90},
{ "East Beach",                   2747.70, -1668.10,   -89.00,  2959.30, -1498.60,   110.90},
{ "East Beach",                   2747.70, -1498.60,   -89.00,  2959.30, -1120.00,   110.90},
{ "East Los Santos",              2421.00, -1628.50,   -89.00,  2632.80, -1454.30,   110.90},
{ "East Los Santos",              2222.50, -1628.50,   -89.00,  2421.00, -1494.00,   110.90},
{ "East Los Santos",              2266.20, -1494.00,   -89.00,  2381.60, -1372.00,   110.90},
{ "East Los Santos",              2381.60, -1494.00,   -89.00,  2421.00, -1454.30,   110.90},
{ "East Los Santos",              2281.40, -1372.00,   -89.00,  2381.60, -1135.00,   110.90},
{ "East Los Santos",              2381.60, -1454.30,   -89.00,  2462.10, -1135.00,   110.90},
{ "East Los Santos",              2462.10, -1454.30,   -89.00,  2581.70, -1135.00,   110.90},
{ "Easter Basin",                -1794.90,   249.90,    -9.10, -1242.90,   578.30,   200.00},
{ "Easter Basin",                -1794.90,   -50.00,    -0.00, -1499.80,   249.90,   200.00},
{ "Easter Bay Airport",          -1499.80,   -50.00,    -0.00, -1242.90,   249.90,   200.00},
{ "Easter Bay Airport",          -1794.90,  -730.10,    -3.00, -1213.90,   -50.00,   200.00},
{ "Easter Bay Airport",          -1213.90,  -730.10,     0.00, -1132.80,   -50.00,   200.00},
{ "Easter Bay Airport",          -1242.90,   -50.00,     0.00, -1213.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1213.90,   -50.00,    -4.50,  -947.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1315.40,  -405.30,    15.40, -1264.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1354.30,  -287.30,    15.40, -1315.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1490.30,  -209.50,    15.40, -1264.40,  -148.30,    25.40},
{ "Easter Bay Chemicals",        -1132.80,  -768.00,     0.00,  -956.40,  -578.10,   200.00},
{ "Easter Bay Chemicals",        -1132.80,  -787.30,     0.00,  -956.40,  -768.00,   200.00},
{ "El Castillo del Diablo",       -464.50,  2217.60,     0.00,  -208.50,  2580.30,   200.00},
{ "El Castillo del Diablo",       -208.50,  2123.00,    -7.60,   114.00,  2337.10,   200.00},
{ "El Castillo del Diablo",       -208.50,  2337.10,     0.00,     8.40,  2487.10,   200.00},
{ "El Corona",                    1812.60, -2179.20,   -89.00,  1970.60, -1852.80,   110.90},
{ "El Corona",                    1692.60, -2179.20,   -89.00,  1812.60, -1842.20,   110.90},
{ "El Quebrados",                -1645.20,  2498.50,     0.00, -1372.10,  2777.80,   200.00},
{ "Esplanade East",              -1620.30,  1176.50,    -4.50, -1580.00,  1274.20,   200.00},
{ "Esplanade East",              -1580.00,  1025.90,    -6.10, -1499.80,  1274.20,   200.00},
{ "Esplanade East",              -1499.80,   578.30,   -79.60, -1339.80,  1274.20,    20.30},
{ "Esplanade North",             -2533.00,  1358.90,    -4.50, -1996.60,  1501.20,   200.00},
{ "Esplanade North",             -1996.60,  1358.90,    -4.50, -1524.20,  1592.50,   200.00},
{ "Esplanade North",             -1982.30,  1274.20,    -4.50, -1524.20,  1358.90,   200.00},
{ "Fallen Tree",                  -792.20,  -698.50,    -5.30,  -452.40,  -380.00,   200.00},
{ "Fallow Bridge",                 434.30,   366.50,     0.00,   603.00,   555.60,   200.00},
{ "Fern Ridge",                    508.10,  -139.20,     0.00,  1306.60,   119.50,   200.00},
{ "Financial",                   -1871.70,   744.10,    -6.10, -1701.30,  1176.40,   300.00},
{ "Fisher's Lagoon",              1916.90,  -233.30,  -100.00,  2131.70,    13.80,   200.00},
{ "Flint Intersection",           -187.70, -1596.70,   -89.00,    17.00, -1276.60,   110.90},
{ "Flint Range",                  -594.10, -1648.50,     0.00,  -187.70, -1276.60,   200.00},
{ "Fort Carson",                  -376.20,   826.30,    -3.00,   123.70,  1220.40,   200.00},
{ "Foster Valley",               -2270.00,  -430.20,    -0.00, -2178.60,  -324.10,   200.00},
{ "Foster Valley",               -2178.60,  -599.80,    -0.00, -1794.90,  -324.10,   200.00},
{ "Foster Valley",               -2178.60, -1115.50,     0.00, -1794.90,  -599.80,   200.00},
{ "Foster Valley",               -2178.60, -1250.90,     0.00, -1794.90, -1115.50,   200.00},
{ "Frederick Bridge",             2759.20,   296.50,     0.00,  2774.20,   594.70,   200.00},
{ "Gant Bridge",                 -2741.40,  1659.60,    -6.10, -2616.40,  2175.10,   200.00},
{ "Gant Bridge",                 -2741.00,  1490.40,    -6.10, -2616.40,  1659.60,   200.00},
{ "Ganton",                       2222.50, -1852.80,   -89.00,  2632.80, -1722.30,   110.90},
{ "Ganton",                       2222.50, -1722.30,   -89.00,  2632.80, -1628.50,   110.90},
{ "Garcia",                      -2411.20,  -222.50,    -0.00, -2173.00,   265.20,   200.00},
{ "Garcia",                      -2395.10,  -222.50,    -5.30, -2354.00,  -204.70,   200.00},
{ "Garver Bridge",               -1339.80,   828.10,   -89.00, -1213.90,  1057.00,   110.90},
{ "Garver Bridge",               -1213.90,   950.00,   -89.00, -1087.90,  1178.90,   110.90},
{ "Garver Bridge",               -1499.80,   696.40,  -179.60, -1339.80,   925.30,    20.30},
{ "Glen Park",                    1812.60, -1449.60,   -89.00,  1996.90, -1350.70,   110.90},
{ "Glen Park",                    1812.60, -1100.80,   -89.00,  1994.30,  -973.30,   110.90},
{ "Glen Park",                    1812.60, -1350.70,   -89.00,  2056.80, -1100.80,   110.90},
{ "Green Palms",                   176.50,  1305.40,    -3.00,   338.60,  1520.70,   200.00},
{ "Greenglass College",            964.30,  1044.60,   -89.00,  1197.30,  1203.20,   110.90},
{ "Greenglass College",            964.30,   930.80,   -89.00,  1166.50,  1044.60,   110.90},
{ "Hampton Barns",                 603.00,   264.30,     0.00,   761.90,   366.50,   200.00},
{ "Hankypanky Point",             2576.90,    62.10,     0.00,  2759.20,   385.50,   200.00},
{ "Harry Gold Parkway",           1777.30,   863.20,   -89.00,  1817.30,  2342.80,   110.90},
{ "Hashbury",                    -2593.40,  -222.50,    -0.00, -2411.20,    54.70,   200.00},
{ "Hilltop Farm",                  967.30,  -450.30,    -3.00,  1176.70,  -217.90,   200.00},
{ "Hunter Quarry",                 337.20,   710.80,  -115.20,   860.50,  1031.70,   203.70},
{ "Idlewood",                     1812.60, -1852.80,   -89.00,  1971.60, -1742.30,   110.90},
{ "Idlewood",                     1812.60, -1742.30,   -89.00,  1951.60, -1602.30,   110.90},
{ "Idlewood",                     1951.60, -1742.30,   -89.00,  2124.60, -1602.30,   110.90},
{ "Idlewood",                     1812.60, -1602.30,   -89.00,  2124.60, -1449.60,   110.90},
{ "Idlewood",                     2124.60, -1742.30,   -89.00,  2222.50, -1494.00,   110.90},
{ "Idlewood",                     1971.60, -1852.80,   -89.00,  2222.50, -1742.30,   110.90},
{ "Jefferson",                    1996.90, -1449.60,   -89.00,  2056.80, -1350.70,   110.90},
{ "Jefferson",                    2124.60, -1494.00,   -89.00,  2266.20, -1449.60,   110.90},
{ "Jefferson",                    2056.80, -1372.00,   -89.00,  2281.40, -1210.70,   110.90},
{ "Jefferson",                    2056.80, -1210.70,   -89.00,  2185.30, -1126.30,   110.90},
{ "Jefferson",                    2185.30, -1210.70,   -89.00,  2281.40, -1154.50,   110.90},
{ "Jefferson",                    2056.80, -1449.60,   -89.00,  2266.20, -1372.00,   110.90},
{ "Julius Thruway East",          2623.10,   943.20,   -89.00,  2749.90,  1055.90,   110.90},
{ "Julius Thruway East",          2685.10,  1055.90,   -89.00,  2749.90,  2626.50,   110.90},
{ "Julius Thruway East",          2536.40,  2442.50,   -89.00,  2685.10,  2542.50,   110.90},
{ "Julius Thruway East",          2625.10,  2202.70,   -89.00,  2685.10,  2442.50,   110.90},
{ "Julius Thruway North",         2498.20,  2542.50,   -89.00,  2685.10,  2626.50,   110.90},
{ "Julius Thruway North",         2237.40,  2542.50,   -89.00,  2498.20,  2663.10,   110.90},
{ "Julius Thruway North",         2121.40,  2508.20,   -89.00,  2237.40,  2663.10,   110.90},
{ "Julius Thruway North",         1938.80,  2508.20,   -89.00,  2121.40,  2624.20,   110.90},
{ "Julius Thruway North",         1534.50,  2433.20,   -89.00,  1848.40,  2583.20,   110.90},
{ "Julius Thruway North",         1848.40,  2478.40,   -89.00,  1938.80,  2553.40,   110.90},
{ "Julius Thruway North",         1704.50,  2342.80,   -89.00,  1848.40,  2433.20,   110.90},
{ "Julius Thruway North",         1377.30,  2433.20,   -89.00,  1534.50,  2507.20,   110.90},
{ "Julius Thruway South",         1457.30,   823.20,   -89.00,  2377.30,   863.20,   110.90},
{ "Julius Thruway South",         2377.30,   788.80,   -89.00,  2537.30,   897.90,   110.90},
{ "Julius Thruway West",          1197.30,  1163.30,   -89.00,  1236.60,  2243.20,   110.90},
{ "Julius Thruway West",          1236.60,  2142.80,   -89.00,  1297.40,  2243.20,   110.90},
{ "Juniper Hill",                -2533.00,   578.30,    -7.60, -2274.10,   968.30,   200.00},
{ "Juniper Hollow",              -2533.00,   968.30,    -6.10, -2274.10,  1358.90,   200.00},
{ "K.A.C.C. Military Fuels",      2498.20,  2626.50,   -89.00,  2749.90,  2861.50,   110.90},
{ "Kincaid Bridge",              -1339.80,   599.20,   -89.00, -1213.90,   828.10,   110.90},
{ "Kincaid Bridge",              -1213.90,   721.10,   -89.00, -1087.90,   950.00,   110.90},
{ "Kincaid Bridge",              -1087.90,   855.30,   -89.00,  -961.90,   986.20,   110.90},
{ "King's",                      -2329.30,   458.40,    -7.60, -1993.20,   578.30,   200.00},
{ "King's",                      -2411.20,   265.20,    -9.10, -1993.20,   373.50,   200.00},
{ "King's",                      -2253.50,   373.50,    -9.10, -1993.20,   458.40,   200.00},
{ "LVA Freight Depot",            1457.30,   863.20,   -89.00,  1777.40,  1143.20,   110.90},
{ "LVA Freight Depot",            1375.60,   919.40,   -89.00,  1457.30,  1203.20,   110.90},
{ "LVA Freight Depot",            1277.00,  1087.60,   -89.00,  1375.60,  1203.20,   110.90},
{ "LVA Freight Depot",            1315.30,  1044.60,   -89.00,  1375.60,  1087.60,   110.90},
{ "LVA Freight Depot",            1236.60,  1163.40,   -89.00,  1277.00,  1203.20,   110.90},
{ "Las Barrancas",                -926.10,  1398.70,    -3.00,  -719.20,  1634.60,   200.00},
{ "Las Brujas",                   -365.10,  2123.00,    -3.00,  -208.50,  2217.60,   200.00},
{ "Las Colinas",                  1994.30, -1100.80,   -89.00,  2056.80,  -920.80,   110.90},
{ "Las Colinas",                  2056.80, -1126.30,   -89.00,  2126.80,  -920.80,   110.90},
{ "Las Colinas",                  2185.30, -1154.50,   -89.00,  2281.40,  -934.40,   110.90},
{ "Las Colinas",                  2126.80, -1126.30,   -89.00,  2185.30,  -934.40,   110.90},
{ "Las Colinas",                  2747.70, -1120.00,   -89.00,  2959.30,  -945.00,   110.90},
{ "Las Colinas",                  2632.70, -1135.00,   -89.00,  2747.70,  -945.00,   110.90},
{ "Las Colinas",                  2281.40, -1135.00,   -89.00,  2632.70,  -945.00,   110.90},
{ "Las Payasadas",                -354.30,  2580.30,     2.00,  -133.60,  2816.80,   200.00},
{ "Las Venturas Airport",         1236.60,  1203.20,   -89.00,  1457.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1203.20,   -89.00,  1777.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1143.20,   -89.00,  1777.40,  1203.20,   110.90},
{ "Las Venturas Airport",         1515.80,  1586.40,   -12.50,  1729.90,  1714.50,    87.50},
{ "Last Dime Motel",              1823.00,   596.30,   -89.00,  1997.20,   823.20,   110.90},
{ "Leafy Hollow",                -1166.90, -1856.00,     0.00,  -815.60, -1602.00,   200.00},
{ "Lil' Probe Inn",                -90.20,  1286.80,    -3.00,   153.80,  1554.10,   200.00},
{ "Linden Side",                  2749.90,   943.20,   -89.00,  2923.30,  1198.90,   110.90},
{ "Linden Station",               2749.90,  1198.90,   -89.00,  2923.30,  1548.90,   110.90},
{ "Linden Station",               2811.20,  1229.50,   -39.50,  2861.20,  1407.50,    60.40},
{ "Little Mexico",                1701.90, -1842.20,   -89.00,  1812.60, -1722.20,   110.90},
{ "Little Mexico",                1758.90, -1722.20,   -89.00,  1812.60, -1577.50,   110.90},
{ "Los Flores",                   2581.70, -1454.30,   -89.00,  2632.80, -1393.40,   110.90},
{ "Los Flores",                   2581.70, -1393.40,   -89.00,  2747.70, -1135.00,   110.90},
{ "Los Santos International",     1249.60, -2394.30,   -89.00,  1852.00, -2179.20,   110.90},
{ "Los Santos International",     1852.00, -2394.30,   -89.00,  2089.00, -2179.20,   110.90},
{ "Los Santos International",     1382.70, -2730.80,   -89.00,  2201.80, -2394.30,   110.90},
{ "Los Santos International",     1974.60, -2394.30,   -39.00,  2089.00, -2256.50,    60.90},
{ "Los Santos International",     1400.90, -2669.20,   -39.00,  2189.80, -2597.20,    60.90},
{ "Los Santos International",     2051.60, -2597.20,   -39.00,  2152.40, -2394.30,    60.90},
{ "Marina",                        647.70, -1804.20,   -89.00,   851.40, -1577.50,   110.90},
{ "Marina",                        647.70, -1577.50,   -89.00,   807.90, -1416.20,   110.90},
{ "Marina",                        807.90, -1577.50,   -89.00,   926.90, -1416.20,   110.90},
{ "Market",                        787.40, -1416.20,   -89.00,  1072.60, -1310.20,   110.90},
{ "Market",                        952.60, -1310.20,   -89.00,  1072.60, -1130.80,   110.90},
{ "Market",                       1072.60, -1416.20,   -89.00,  1370.80, -1130.80,   110.90},
{ "Market",                        926.90, -1577.50,   -89.00,  1370.80, -1416.20,   110.90},
{ "Market Station",                787.40, -1410.90,   -34.10,   866.00, -1310.20,    65.80},
{ "Martin Bridge",                -222.10,   293.30,     0.00,  -122.10,   476.40,   200.00},
{ "Missionary Hill",             -2994.40,  -811.20,     0.00, -2178.60,  -430.20,   200.00},
{ "Montgomery",                   1119.50,   119.50,    -3.00,  1451.40,   493.30,   200.00},
{ "Montgomery",                   1451.40,   347.40,    -6.10,  1582.40,   420.80,   200.00},
{ "Montgomery Intersection",      1546.60,   208.10,     0.00,  1745.80,   347.40,   200.00},
{ "Montgomery Intersection",      1582.40,   347.40,     0.00,  1664.60,   401.70,   200.00},
{ "Mulholland",                   1414.00,  -768.00,   -89.00,  1667.60,  -452.40,   110.90},
{ "Mulholland",                   1281.10,  -452.40,   -89.00,  1641.10,  -290.90,   110.90},
{ "Mulholland",                   1269.10,  -768.00,   -89.00,  1414.00,  -452.40,   110.90},
{ "Mulholland",                   1357.00,  -926.90,   -89.00,  1463.90,  -768.00,   110.90},
{ "Mulholland",                   1318.10,  -910.10,   -89.00,  1357.00,  -768.00,   110.90},
{ "Mulholland",                   1169.10,  -910.10,   -89.00,  1318.10,  -768.00,   110.90},
{ "Mulholland",                    768.60,  -954.60,   -89.00,   952.60,  -860.60,   110.90},
{ "Mulholland",                    687.80,  -860.60,   -89.00,   911.80,  -768.00,   110.90},
{ "Mulholland",                    737.50,  -768.00,   -89.00,  1142.20,  -674.80,   110.90},
{ "Mulholland",                   1096.40,  -910.10,   -89.00,  1169.10,  -768.00,   110.90},
{ "Mulholland",                    952.60,  -937.10,   -89.00,  1096.40,  -860.60,   110.90},
{ "Mulholland",                    911.80,  -860.60,   -89.00,  1096.40,  -768.00,   110.90},
{ "Mulholland",                    861.00,  -674.80,   -89.00,  1156.50,  -600.80,   110.90},
{ "Mulholland Intersection",      1463.90, -1150.80,   -89.00,  1812.60,  -768.00,   110.90},
{ "North Rock",                   2285.30,  -768.00,     0.00,  2770.50,  -269.70,   200.00},
{ "Ocean Docks",                  2373.70, -2697.00,   -89.00,  2809.20, -2330.40,   110.90},
{ "Ocean Docks",                  2201.80, -2418.30,   -89.00,  2324.00, -2095.00,   110.90},
{ "Ocean Docks",                  2324.00, -2302.30,   -89.00,  2703.50, -2145.10,   110.90},
{ "Ocean Docks",                  2089.00, -2394.30,   -89.00,  2201.80, -2235.80,   110.90},
{ "Ocean Docks",                  2201.80, -2730.80,   -89.00,  2324.00, -2418.30,   110.90},
{ "Ocean Docks",                  2703.50, -2302.30,   -89.00,  2959.30, -2126.90,   110.90},
{ "Ocean Docks",                  2324.00, -2145.10,   -89.00,  2703.50, -2059.20,   110.90},
{ "Ocean Flats",                 -2994.40,   277.40,    -9.10, -2867.80,   458.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -222.50,    -0.00, -2593.40,   277.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -430.20,    -0.00, -2831.80,  -222.50,   200.00},
{ "Octane Springs",                338.60,  1228.50,     0.00,   664.30,  1655.00,   200.00},
{ "Old Venturas Strip",           2162.30,  2012.10,   -89.00,  2685.10,  2202.70,   110.90},
{ "Palisades",                   -2994.40,   458.40,    -6.10, -2741.00,  1339.60,   200.00},
{ "Palomino Creek",               2160.20,  -149.00,     0.00,  2576.90,   228.30,   200.00},
{ "Paradiso",                    -2741.00,   793.40,    -6.10, -2533.00,  1268.40,   200.00},
{ "Pershing Square",              1440.90, -1722.20,   -89.00,  1583.50, -1577.50,   110.90},
{ "Pilgrim",                      2437.30,  1383.20,   -89.00,  2624.40,  1783.20,   110.90},
{ "Pilgrim",                      2624.40,  1383.20,   -89.00,  2685.10,  1783.20,   110.90},
{ "Pilson Intersection",          1098.30,  2243.20,   -89.00,  1377.30,  2507.20,   110.90},
{ "Pirates in Men's Pants",       1817.30,  1469.20,   -89.00,  2027.40,  1703.20,   110.90},
{ "Playa del Seville",            2703.50, -2126.90,   -89.00,  2959.30, -1852.80,   110.90},
{ "Prickle Pine",                 1534.50,  2583.20,   -89.00,  1848.40,  2863.20,   110.90},
{ "Prickle Pine",                 1117.40,  2507.20,   -89.00,  1534.50,  2723.20,   110.90},
{ "Prickle Pine",                 1848.40,  2553.40,   -89.00,  1938.80,  2863.20,   110.90},
{ "Prickle Pine",                 1938.80,  2624.20,   -89.00,  2121.40,  2861.50,   110.90},
{ "Queens",                      -2533.00,   458.40,     0.00, -2329.30,   578.30,   200.00},
{ "Queens",                      -2593.40,    54.70,     0.00, -2411.20,   458.40,   200.00},
{ "Queens",                      -2411.20,   373.50,     0.00, -2253.50,   458.40,   200.00},
{ "Randolph Industrial Estate",   1558.00,   596.30,   -89.00,  1823.00,   823.20,   110.90},
{ "Redsands East",                1817.30,  2011.80,   -89.00,  2106.70,  2202.70,   110.90},
{ "Redsands East",                1817.30,  2202.70,   -89.00,  2011.90,  2342.80,   110.90},
{ "Redsands East",                1848.40,  2342.80,   -89.00,  2011.90,  2478.40,   110.90},
{ "Redsands West",                1236.60,  1883.10,   -89.00,  1777.30,  2142.80,   110.90},
{ "Redsands West",                1297.40,  2142.80,   -89.00,  1777.30,  2243.20,   110.90},
{ "Redsands West",                1377.30,  2243.20,   -89.00,  1704.50,  2433.20,   110.90},
{ "Redsands West",                1704.50,  2243.20,   -89.00,  1777.30,  2342.80,   110.90},
{ "Regular Tom",                  -405.70,  1712.80,    -3.00,  -276.70,  1892.70,   200.00},
{ "Richman",                       647.50, -1118.20,   -89.00,   787.40,  -954.60,   110.90},
{ "Richman",                       647.50,  -954.60,   -89.00,   768.60,  -860.60,   110.90},
{ "Richman",                       225.10, -1369.60,   -89.00,   334.50, -1292.00,   110.90},
{ "Richman",                       225.10, -1292.00,   -89.00,   466.20, -1235.00,   110.90},
{ "Richman",                        72.60, -1404.90,   -89.00,   225.10, -1235.00,   110.90},
{ "Richman",                        72.60, -1235.00,   -89.00,   321.30, -1008.10,   110.90},
{ "Richman",                       321.30, -1235.00,   -89.00,   647.50, -1044.00,   110.90},
{ "Richman",                       321.30, -1044.00,   -89.00,   647.50,  -860.60,   110.90},
{ "Richman",                       321.30,  -860.60,   -89.00,   687.80,  -768.00,   110.90},
{ "Richman",                       321.30,  -768.00,   -89.00,   700.70,  -674.80,   110.90},
{ "Robada Intersection",         -1119.00,  1178.90,   -89.00,  -862.00,  1351.40,   110.90},
{ "Roca Escalante",               2237.40,  2202.70,   -89.00,  2536.40,  2542.50,   110.90},
{ "Roca Escalante",               2536.40,  2202.70,   -89.00,  2625.10,  2442.50,   110.90},
{ "Rockshore East",               2537.30,   676.50,   -89.00,  2902.30,   943.20,   110.90},
{ "Rockshore West",               1997.20,   596.30,   -89.00,  2377.30,   823.20,   110.90},
{ "Rockshore West",               2377.30,   596.30,   -89.00,  2537.30,   788.80,   110.90},
{ "Rodeo",                          72.60, -1684.60,   -89.00,   225.10, -1544.10,   110.90},
{ "Rodeo",                          72.60, -1544.10,   -89.00,   225.10, -1404.90,   110.90},
{ "Rodeo",                         225.10, -1684.60,   -89.00,   312.80, -1501.90,   110.90},
{ "Rodeo",                         225.10, -1501.90,   -89.00,   334.50, -1369.60,   110.90},
{ "Rodeo",                         334.50, -1501.90,   -89.00,   422.60, -1406.00,   110.90},
{ "Rodeo",                         312.80, -1684.60,   -89.00,   422.60, -1501.90,   110.90},
{ "Rodeo",                         422.60, -1684.60,   -89.00,   558.00, -1570.20,   110.90},
{ "Rodeo",                         558.00, -1684.60,   -89.00,   647.50, -1384.90,   110.90},
{ "Rodeo",                         466.20, -1570.20,   -89.00,   558.00, -1385.00,   110.90},
{ "Rodeo",                         422.60, -1570.20,   -89.00,   466.20, -1406.00,   110.90},
{ "Rodeo",                         466.20, -1385.00,   -89.00,   647.50, -1235.00,   110.90},
{ "Rodeo",                         334.50, -1406.00,   -89.00,   466.20, -1292.00,   110.90},
{ "Royal Casino",                 2087.30,  1383.20,   -89.00,  2437.30,  1543.20,   110.90},
{ "San Andreas Sound",            2450.30,   385.50,  -100.00,  2759.20,   562.30,   200.00},
{ "Santa Flora",                 -2741.00,   458.40,    -7.60, -2533.00,   793.40,   200.00},
{ "Santa Maria Beach",             342.60, -2173.20,   -89.00,   647.70, -1684.60,   110.90},
{ "Santa Maria Beach",              72.60, -2173.20,   -89.00,   342.60, -1684.60,   110.90},
{ "Shady Cabin",                 -1632.80, -2263.40,    -3.00, -1601.30, -2231.70,   200.00},
{ "Shady Creeks",                -1820.60, -2643.60,    -8.00, -1226.70, -1771.60,   200.00},
{ "Shady Creeks",                -2030.10, -2174.80,    -6.10, -1820.60, -1771.60,   200.00},
{ "Sobell Rail Yards",            2749.90,  1548.90,   -89.00,  2923.30,  1937.20,   110.90},
{ "Spinybed",                     2121.40,  2663.10,   -89.00,  2498.20,  2861.50,   110.90},
{ "Starfish Casino",              2437.30,  1783.20,   -89.00,  2685.10,  2012.10,   110.90},
{ "Starfish Casino",              2437.30,  1858.10,   -39.00,  2495.00,  1970.80,    60.90},
{ "Starfish Casino",              2162.30,  1883.20,   -89.00,  2437.30,  2012.10,   110.90},
{ "Temple",                       1252.30, -1130.80,   -89.00,  1378.30, -1026.30,   110.90},
{ "Temple",                       1252.30, -1026.30,   -89.00,  1391.00,  -926.90,   110.90},
{ "Temple",                       1252.30,  -926.90,   -89.00,  1357.00,  -910.10,   110.90},
{ "Temple",                        952.60, -1130.80,   -89.00,  1096.40,  -937.10,   110.90},
{ "Temple",                       1096.40, -1130.80,   -89.00,  1252.30, -1026.30,   110.90},
{ "Temple",                       1096.40, -1026.30,   -89.00,  1252.30,  -910.10,   110.90},
{ "The Camel's Toe",              2087.30,  1203.20,   -89.00,  2640.40,  1383.20,   110.90},
{ "The Clown's Pocket",           2162.30,  1783.20,   -89.00,  2437.30,  1883.20,   110.90},
{ "The Emerald Isle",             2011.90,  2202.70,   -89.00,  2237.40,  2508.20,   110.90},
{ "The Farm",                    -1209.60, -1317.10,   114.90,  -908.10,  -787.30,   251.90},
{ "The Four Dragons Casino",      1817.30,   863.20,   -89.00,  2027.30,  1083.20,   110.90},
{ "The High Roller",              1817.30,  1283.20,   -89.00,  2027.30,  1469.20,   110.90},
{ "The Mako Span",                1664.60,   401.70,     0.00,  1785.10,   567.20,   200.00},
{ "The Panopticon",               -947.90,  -304.30,    -1.10,  -319.60,   327.00,   200.00},
{ "The Pink Swan",                1817.30,  1083.20,   -89.00,  2027.30,  1283.20,   110.90},
{ "The Sherman Dam",              -968.70,  1929.40,    -3.00,  -481.10,  2155.20,   200.00},
{ "The Strip",                    2027.40,   863.20,   -89.00,  2087.30,  1703.20,   110.90},
{ "The Strip",                    2106.70,  1863.20,   -89.00,  2162.30,  2202.70,   110.90},
{ "The Strip",                    2027.40,  1783.20,   -89.00,  2162.30,  1863.20,   110.90},
{ "The Strip",                    2027.40,  1703.20,   -89.00,  2137.40,  1783.20,   110.90},
{ "The Visage",                   1817.30,  1863.20,   -89.00,  2106.70,  2011.80,   110.90},
{ "The Visage",                   1817.30,  1703.20,   -89.00,  2027.40,  1863.20,   110.90},
{ "Unity Station",                1692.60, -1971.80,   -20.40,  1812.60, -1932.80,    79.50},
{ "Valle Ocultado",               -936.60,  2611.40,     2.00,  -715.90,  2847.90,   200.00},
{ "Verdant Bluffs",                930.20, -2488.40,   -89.00,  1249.60, -2006.70,   110.90},
{ "Verdant Bluffs",               1073.20, -2006.70,   -89.00,  1249.60, -1842.20,   110.90},
{ "Verdant Bluffs",               1249.60, -2179.20,   -89.00,  1692.60, -1842.20,   110.90},
{ "Verdant Meadows",                37.00,  2337.10,    -3.00,   435.90,  2677.90,   200.00},
{ "Verona Beach",                  647.70, -2173.20,   -89.00,   930.20, -1804.20,   110.90},
{ "Verona Beach",                  930.20, -2006.70,   -89.00,  1073.20, -1804.20,   110.90},
{ "Verona Beach",                  851.40, -1804.20,   -89.00,  1046.10, -1577.50,   110.90},
{ "Verona Beach",                 1161.50, -1722.20,   -89.00,  1323.90, -1577.50,   110.90},
{ "Verona Beach",                 1046.10, -1722.20,   -89.00,  1161.50, -1577.50,   110.90},
{ "Vinewood",                      787.40, -1310.20,   -89.00,   952.60, -1130.80,   110.90},
{ "Vinewood",                      787.40, -1130.80,   -89.00,   952.60,  -954.60,   110.90},
{ "Vinewood",                      647.50, -1227.20,   -89.00,   787.40, -1118.20,   110.90},
{ "Vinewood",                      647.70, -1416.20,   -89.00,   787.40, -1227.20,   110.90},
{ "Whitewood Estates",             883.30,  1726.20,   -89.00,  1098.30,  2507.20,   110.90},
{ "Whitewood Estates",            1098.30,  1726.20,   -89.00,  1197.30,  2243.20,   110.90},
{ "Willowfield",                  1970.60, -2179.20,   -89.00,  2089.00, -1852.80,   110.90},
{ "Willowfield",                  2089.00, -2235.80,   -89.00,  2201.80, -1989.90,   110.90},
{ "Willowfield",                  2089.00, -1989.90,   -89.00,  2324.00, -1852.80,   110.90},
{ "Willowfield",                  2201.80, -2095.00,   -89.00,  2324.00, -1989.90,   110.90},
{ "Willowfield",                  2541.70, -1941.40,   -89.00,  2703.50, -1852.80,   110.90},
{ "Willowfield",                  2324.00, -2059.20,   -89.00,  2541.70, -1852.80,   110.90},
{ "Willowfield",                  2541.70, -2059.20,   -89.00,  2703.50, -1941.40,   110.90},
{ "Yellow Bell Station",          1377.40,  2600.40,   -21.90,  1492.40,  2687.30,    78.00},
{ "Los Santos",                     44.60, -2892.90,  -242.90,  2997.00,  -768.00,   900.00},
{ "Las Venturas",                  869.40,   596.30,  -242.90,  2997.00,  2993.80,   900.00},
{ "Bone County",                  -480.50,   596.30,  -242.90,   869.40,  2993.80,   900.00},
{ "Tierra Robada",               -2997.40,  1659.60,  -242.90,  -480.50,  2993.80,   900.00},
{ "Tierra Robada",               -1213.90,   596.30,  -242.90,  -480.50,  1659.60,   900.00},
{ "San Fierro",                  -2997.40, -1115.50,  -242.90, -1213.90,  1659.60,   900.00},
{ "Red County",                  -1213.90,  -768.00,  -242.90,  2997.00,   596.30,   900.00},
{ "Flint County",                -1213.90, -2892.90,  -242.90,    44.60,  -768.00,   900.00},
{ "Whetstone",                   -2997.40, -2892.90,  -242.90, -1213.90, -1115.50,   900.00}};

// Mysql

new mysql = 0;

forward MoneyGrubScoreUpdate();

main()
{
	print("\n---------------------------------------------");
	print("                 MPA RevolutioN RPG");
	print("----------------------------------------------\n");
	worldTime = 12;
	writelog("\n--------------------------------------------------------");
	writelog(" MPA RevolutioN RPG vers„o 0.3 Alpha 1 carregado!");
 	writelog(" UMA PARCERIA ENTRE:                 ");
 	writelog("          Texugo      ");
 	writelog("  Matraka        Dani Piresk  ");
	writelog("--------------------------------------------------------\n");
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	return name;

}

public KeyT()
{
        for(new i=0;i<MAX_PLAYERS;i++)
        {
            if(IsPlayerConnected(i))
            {
                new tmpkeys[2],oldkeys[2];
                GetPlayerKeys(i,oldkeys[i],tmpkeys[0],tmpkeys[1]);
     			OnPlayerPressKey2(i,oldkeys[i]);
            }
        }
}

public writelog(log[])
{
	fixchars(log);
	if(!fexist("MPARPGLog.txt")){
	    dini_Create("MPARPGLog.txt");
	} else {
		new File:logstr;
		logstr = fopen("MPARPGLog.txt", io_append);
        fwrite(logstr, log);
        fwrite(logstr, "\r\n");
        fclose(logstr);
	}
}

public GetClosestHospital(playerid)
{
	if(!IsPlayerConnected(playerid)){
	    return -1;
	}
	new Float:prevdist = 100000.000;
	new prevhosp;
	for(new hospid; hospid < 5; hospid++){
	    new Float:dist;
	    dist = GetPlayerDistanceToPoint(playerid,Hospitais[hospid][0],Hospitais[hospid][1]);
		if((dist < prevdist)){
		    prevdist = dist;
		    prevhosp = hospid;
		}
	}
	return prevhosp;
}

stock AddPlayerHealth(playerid,Float:h)
{
	if(!IsPlayerConnected(playerid)) return 0;
	new Float:x;
	GetPlayerHealth(playerid,x);
	if(x+h < 100) SetPlayerHealth(playerid,x+h);
	if(x+h >= 100) SetPlayerHealth(playerid,100);
	return 0;
}

stock GetDistanceToCar(playerid,carid)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetVehiclePos(carid,x2,y2,z2);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(tmpdis);
}

stock GetDistanceBetweenPlayers(playerid,playerid2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetPlayerPos(playerid2,x2,y2,z2);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(tmpdis);
}

stock GetPlayerDistanceToPointEx(playerid,Float:x2,Float:y2,Float:z2)
{
	new Float:x1,Float:y1,Float:z1;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(tmpdis);
}

stock GetDistanceToObject(playerid,objectid)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetObjectPos(objectid,x2,y2,z2);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(tmpdis);
}

stock LogarPlayer(playerid)
{
	if(mysql == 1){
    	new resultline[1024];
    	new contador;
    	new field[128], field2[256];
    	new  wantedlvl, creditos, acc_state, skin, gasoline, prisao, prof, Float:x, Float:y, Float:z, Float:ang;
		new string[256];
		format(string, sizeof(string),"SELECT wantedlvl,creditos,acc_state,skin,gasoline,prisao,prof,x,y,z,ang FROM players WHERE nickname = '%s '", PlayerName(playerid));
		if(samp_mysql_query(string) == 0){
		    printf("Erro na Linha 1694");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline);
			wantedlvl = strval(field2);
			while(samp_mysql_strtok(field2, "|", "")==1)
			{
				contador++;
				contador%=10;
				if(contador == 1){
					creditos = strval(field2);
				}

				if(contador == 2){
					acc_state = strval(field2);
				}

				if(contador == 3){
					skin = strval(field2);
				}

				if(contador == 4){
					gasoline = strval(field2);
				}

				if(contador == 5){
					prisao = strval(field2);
				}

				if(contador == 6){
					prof = strval(field2);
				}

				if(contador == 7){
					x = Float:floatstr(field2);
				}

				if(contador == 8){
					y = Float:floatstr(field2);
				}

				if(contador == 9){
					z = Float:floatstr(field2);
				}

				if(contador == 0){
					ang = Float:floatstr(field2);
				}
			}
			CellCredits[playerid] = creditos;
			GivePlayerMoney(playerid, acc_state - GetPlayerMoney(playerid));
			SetSpawnInfo(playerid, 1, skin, x, y, z, ang, 0, 0, 0, 0, 0, 0);
			Profissao[playerid] = prof;
			Petrol[playerid] = gasoline;
			SetPlayerWantedLevel(playerid,wantedlvl);
			SendClientMessage(playerid, COLOR_GREEN, "Logado");
			if(prisao == 1 || Procurados[playerid] == 1){
				Procurados[playerid] = 0;
				new cela;
				Presos[playerid] = 1;
				cela = random(3);
				SetPlayerFacingAngle(playerid,0);
				SetPlayerInterior(playerid,10);
				PrisaoTimer[playerid][1]=1;
				PrisaoTimer[playerid][0]=SetTimerEx("SetPlayerFree",5*60*1000,0,"d",playerid);
				SetPlayerPos(playerid,Celas[cela][0],Celas[cela][1],Celas[cela][2]);
				SendClientMessage(playerid,COLOR_RED,"VocÍ deve ter cometido algum crime, por isso foi preso.");
				SendClientMessage(playerid,COLOR_RED,"Para sair mais cedo da pris„o, vocÍ pode pagar a fianÁa de $1500,");
				SendClientMessage(playerid,COLOR_RED,"escrevendo /fianca.");
			}
			else{
				SpawnPlayer(playerid);
			}
		}
	}
}

stock SendClientMessagePolicia(text_color, string_text[])
{
    for(new i=0;i<MAX_PLAYERS;i++)
    {
        if(IsPlayerConnected(i))
        {
            if(Profissao[i] == COP_SWAT || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_MILITAR || Profissao[i] == COP_NARCOTICOS || Profissao[i] == SHERIFF)
            {
            SendClientMessage(i, text_color, string_text);
            }
        }
    }
}

stock SendClientMessageJuiz(text_color, string_text[])
{
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(Profissao[i] == JUIZ || IsPlayerAdmin(i))
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}
stock SendClientMessageVendedor(text_color, string_text[])
{
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(Profissao[i] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(i))
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}
stock SendClientMessageCarros(text_color, string_text[])
{
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(Profissao[i] == LOCADOR_DE_CARROS)
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}
stock SendClientMessageAdmin(text_color, string_text[])
{
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(IsPlayerAdmin(i))
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}

stock SendClientMessageLadrao(text_color, string_text[])
{
    for(new i=0;i<MAX_PLAYERS;i++)
    {
        if(IsPlayerConnected(i))
        {
            if(Profissao[i] == LADRAO_DE_CARROS || RECEITA_FEDERAL)
            {
            SendClientMessage(i, text_color, string_text);
            }
        }
    }
}

public SetPlayerFree(playerid){
	new skin;
	if(mysql == 1){
    	new resultline[1024];
    	new field[128];
    	new string[255];
    	format(string, sizeof(string),"SELECT skin FROM players WHERE nickname = '%s '", PlayerName(playerid));
        samp_mysql_select_db("infernusgroup01");
		if(samp_mysql_query(string) == 0){
		    printf("Erro na Linha 1856");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
			skin = strval(field);
		}
	}
    Presos[playerid] = 0;
    SetSpawnInfo(playerid,0,skin,-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
    SpawnPlayer(playerid);
    SendClientMessage(playerid,COLOR_GREEN,"VocÍ foi solto, mas se cometer mais crimes, pagar· novamente.");
    Contrabando[playerid] = 0;
	Receita[playerid] = 0;
	SetPlayerWantedLevel(playerid, 0);
	if(mysql == 1){
		new string[255];
		format(string, sizeof(string), "UPDATE players SET wantedlvl = 0, prisao = 0 WHERE nickname = '%s '", PlayerName(playerid));
		samp_mysql_select_db("infernusgroup01");
		if(samp_mysql_query(string) == 0){
	    	printf("Erro na linha 10081");
		}
	}
}

public OnPlayerKeyStateChange(playerid,newkeys,oldkeys){
	if(newkeys == 16){
	    if(IsPlayerInAnyVehicle(playerid) && GetPlayerInterior(playerid) == 0){
	        TogglePlayerControllable(playerid,1);
	        RemovePlayerFromVehicle(playerid);
		}
	}
	if((newkeys==KEY_ACTION)&&(IsPlayerInAnyVehicle(playerid))&&(GetPlayerState(playerid)==PLAYER_STATE_DRIVER)){
	    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 525){
	        if(Profissao[playerid] == MECANICO){
			new Float:pX,Float:pY,Float:pZ;
			GetPlayerPos(playerid,pX,pY,pZ);
			new Float:vX,Float:vY,Float:vZ;
			new Found=0;
			new vid=0;
			while((vid<MAX_VEHICLES)&&(!Found))
   				{
   				vid++;
   				GetVehiclePos(vid,vX,vY,vZ);
   				if  ((floatabs(pX-vX)<7.0)&&(floatabs(pY-vY)<7.0)&&(floatabs(pZ-vZ)<7.0)&&(vid!=GetPlayerVehicleID(playerid)))
   				    {
   				    Found=1;
   				    if	(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
   				        {
   				        DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
   				        }
   				    AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
   				    SendClientMessage(playerid,COLOR_MECANICO,"Carro rebocado!");
   				    }
       			}
			if  (!Found)
			    {
			    SendClientMessage(playerid,COLOR_RED,"Sem carro!");
			    }
		    }
	    }
	}
}
public OnPlayerPressKey2(playerid,key)
{
	new texto[256];
	if(DebugKeys[playerid] == 1 && key != 0){
		format(texto,sizeof(texto),"DEBUG: Tecla pressionada: %d",key);
		SendClientMessage(playerid,COLOR_COP_SWAT,texto);
	}
/*	if(key & KEY_SECONDARY_ATTACK){
	    new distance = GetDistanceToCar(playerid,Bonde);
	    if(distance < 20){
	        PutPlayerInVehicle(playerid,Bonde,0);
		}
	}*/
/*	if(key & KEY_FIRE && !IsPlayerInAnyVehicle(playerid)){
	    new Float:x,Float:y,Float:z;
		GetPlayerPos(playerid, x, y, z);
		for(new bom=5;bom>0;bom--){
			GetXYInFrontOfPlayer(playerid, x, y, 50);
			CreateExplosion(x, y, z+(bom*3), 1, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-5);
			CreateExplosion(x, y, z+(bom*3), 2, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-10);
			CreateExplosion(x, y, z+(bom*3), 3, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-15);
			CreateExplosion(x, y, z+(bom*3), 4, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-20);
			CreateExplosion(x, y, z+(bom*3), 5, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-25);
			CreateExplosion(x, y, z+(bom*3), 6, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-30);
			CreateExplosion(x, y, z+(bom*3), 7, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-35);
			CreateExplosion(x, y, z+(bom*3), 8, 4900.0);
			GetXYInFrontOfPlayer(playerid, x, y, 50-40);
			CreateExplosion(x, y, z+(bom*3), 9, 4900.0);
 		}
	}*/
}

public OnGameModeInit()
{
	print("Carregando GameMode RPG");
	writelog("\r\n");
	EnableZoneNames(1);
	AllowInteriorWeapons(1);
	EnableStuntBonusForAll(0);
	EnableTirePopping(1);
	new Segundo,Minuto,Hora,Dia,Mes,Ano, msg[256];
	gettime(Hora,Minuto,Segundo);
	getdate(Ano,Mes,Dia);
	format(msg,sizeof(msg),"Gamemode iniciado em %d/%d/%d ‡s %d:%d:%d.",Dia,Mes,Ano,Hora,Minuto,Segundo);
	writelog(msg);
	writelog("Carregando MPARRPG...");
	SetGameModeText("MPAÆ RevolutioN RPG");
	
//|------------------------------------[ TEXTDRAWS ]--------------------------------------------------
	Bemvindo = TextDrawCreate(320,200,"~r~Bem-vindo ao ~n~ ~b~MPA RevolutioN RPG");
	TextDrawColor(Bemvindo,0xFFF000FF);
	TextDrawAlignment(Bemvindo,2);
	TextDrawFont(Bemvindo,0);
	TextDrawLetterSize(Bemvindo,2.5,2.5);
	//txtdr2
	Bemvindo2 = TextDrawCreate(320,240,"~w~Comandos principais: ~n~ /ajuda - Ajuda sobre o RPG ~n~ /aprender - Aprenda mais sobre o RPG ~n~ /profs - Lista de profiss®es ~n~ Para mais comandos, digite /comandos ~n~ ~n~ ~n~ ~y~Infernus Development Group ~n~ ~r~Sua diversöo, Nosso objetivo ~n~ ~n~ ~b~Visite o nosso site: WWW.GTABRASIL.NET");
	TextDrawColor(Bemvindo2,COLOR_GREEN);
	TextDrawAlignment(Bemvindo2,2);
	TextDrawFont(Bemvindo2,1);
	TextDrawSetOutline(Bemvindo2,1);
//	TextDrawLetterSize(Bemvindo2,1,1);
	TextDrawSetShadow(Bemvindo2,0);
	//site-announce
	Bemvindo3 = TextDrawCreate(320,400,"Visite nosso site: WWW.GTABRASIL.NET ~n~WWW.MPACLAN.COM");
	TextDrawColor(Bemvindo3,COLOR_COP_NARCOTICOS);
	TextDrawSetOutline(Bemvindo3,1);
	TextDrawSetShadow(Bemvindo3,1);
	TextDrawAlignment(Bemvindo3,2);
	//banco-td
	Banco = TextDrawCreate(5,300,"Banco");
	TextDrawColor(Banco,COLOR_GREEN);
	TextDrawAlignment(Banco,0);
	TextDrawFont(Banco,0);
	TextDrawLetterSize(Banco,2,2);
	//posto-td
	Posto = TextDrawCreate(5,300,"~b~Posto");
	TextDrawColor(Posto,COLOR_WHITE);
	TextDrawAlignment(Posto,0);
	TextDrawFont(Posto,0);
	TextDrawLetterSize(Posto,2,2);
	//hotel-td
	Hotel = TextDrawCreate(320,180,"~b~Hotel");
	TextDrawColor(Hotel,COLOR_WHITE);
	TextDrawAlignment(Hotel,2);
	TextDrawFont(Hotel,0);
	TextDrawLetterSize(Hotel,3,3);
	//hospital-td
	Hospital = TextDrawCreate(5,300,"Hospital");
	TextDrawColor(Hospital,COLOR_WHITE);
	TextDrawAlignment(Hospital,0);
	TextDrawFont(Hospital,0);
	TextDrawLetterSize(Hospital,2,2);
	//24/7-td
	td247 = TextDrawCreate(5,300,"Loja de Utilidades ~n~$1,99");
	TextDrawColor(td247,COLOR_PALHA);
	TextDrawFont(td247,3);
	TextDrawLetterSize(td247,2,2);
	//lixao-td
	tdLixao = TextDrawCreate(5,300,"Lixöo ou ~n~ Ferro-Velho");
	TextDrawColor(tdLixao,COLOR_TRAFICANTE);
	TextDrawFont(tdLixao,0);
	TextDrawLetterSize(tdLixao,2,2);
	//delegacia-td
	Delegacia = TextDrawCreate(5,300,"Delegacia");
	TextDrawColor(Delegacia,COLOR_YELLOW);
	TextDrawAlignment(Delegacia,0);
	TextDrawFont(Delegacia,0);
	TextDrawLetterSize(Delegacia,2,2);
	//area caÁa-td
	tdCaca = TextDrawCreate(5,300,"Årea de Caúa");
	TextDrawColor(tdCaca,COLOR_RED);
	TextDrawAlignment(tdCaca,0);
	TextDrawFont(tdCaca,0);
	TextDrawLetterSize(tdCaca,2,2);
	//coopcaca-td
	tdCoopCaca = TextDrawCreate(5,300,"Cooperativa de Caúa");
	TextDrawColor(tdCoopCaca,COLOR_RED);
	TextDrawAlignment(tdCoopCaca,0);
	TextDrawFont(tdCoopCaca,0);
	TextDrawLetterSize(tdCoopCaca,2,2);
	//desmanche
	tdDesmanche = TextDrawCreate(5,300,"Beco do desmanche");
	TextDrawColor(tdDesmanche,COLOR_RED);
	TextDrawAlignment(tdDesmanche,0);
	TextDrawFont(tdDesmanche,0);
	TextDrawLetterSize(tdDesmanche,2,2);
	//pesca-td
	tdPesca = TextDrawCreate(5,300,"Årea de Pesca");
	TextDrawColor(tdPesca,COLOR_GREEN);
	TextDrawAlignment(tdPesca,0);
	TextDrawFont(tdPesca,0);
	TextDrawLetterSize(tdPesca,2,2);
	//cooppesca-td
	tdCoopPesca = TextDrawCreate(5,300,"Cooperativa de Pesca");
	TextDrawColor(tdCoopPesca,COLOR_GREEN);
	TextDrawAlignment(tdCoopPesca,0);
	TextDrawFont(tdCoopPesca,0);
	TextDrawLetterSize(tdCoopPesca,2,2);
	//areacarga-td
	tdAreaCarga = TextDrawCreate(5,300,"Årea de Carga");
	TextDrawColor(tdAreaCarga,COLOR_GREEN);
	TextDrawAlignment(tdAreaCarga,0);
	TextDrawFont(tdAreaCarga,0);
	TextDrawLetterSize(tdAreaCarga,2,2);
	//areadescarga-td
	tdAreaDescarga = TextDrawCreate(5,300,"Årea de Descarga");
	TextDrawColor(tdAreaDescarga,COLOR_GREEN);
	TextDrawAlignment(tdAreaDescarga,0);
	TextDrawFont(tdAreaDescarga,0);
	TextDrawLetterSize(tdAreaDescarga,2,2);
	//plant
	tdPlant = TextDrawCreate(5,300,"Årea de Plantio");
	TextDrawColor(tdPlant,COLOR_GREEN);
	TextDrawAlignment(tdPlant,0);
	TextDrawFont(tdPlant,0);
	TextDrawLetterSize(tdPlant,2,2);
	//leite
	tdLeite = TextDrawCreate(5,300,"Curral das Vaca");
	TextDrawColor(tdLeite,COLOR_RED);
	TextDrawAlignment(tdLeite,0);
	TextDrawFont(tdLeite,0);
	TextDrawLetterSize(tdLeite,2,2);
	//venda-milho
	tdColheita = TextDrawCreate(5,300,"Venda do milho/Leite");
	TextDrawColor(tdColheita,COLOR_GREEN);
	TextDrawAlignment(tdColheita,0);
	TextDrawFont(tdColheita,0);
	TextDrawLetterSize(tdColheita,2,2);
	//forte-td
	tdForte = TextDrawCreate(5,300,"Årea Forte");
	TextDrawColor(tdForte,COLOR_RED);
	TextDrawAlignment(tdForte,0);
	TextDrawFont(tdForte,0);
	TextDrawLetterSize(tdForte,2,2);
	//pedreira-td
	tdPdCarga = TextDrawCreate(5,300,"Pedreira");
	TextDrawColor(tdPdCarga,COLOR_GREEN);
	TextDrawAlignment(tdPdCarga,0);
	TextDrawFont(tdPdCarga,0);
	TextDrawLetterSize(tdPdCarga,2,2);
	//construÁ„o
	tdConstrucao = TextDrawCreate(5,300,"Construúöo");
	TextDrawColor(tdConstrucao,COLOR_GREEN);
	TextDrawAlignment(tdConstrucao,0);
	TextDrawFont(tdConstrucao,0);
	TextDrawLetterSize(tdConstrucao,2,2);
	//area-recarga
	tdRecarga = TextDrawCreate(5,300,"Årea de Recarga");
	TextDrawColor(tdRecarga,COLOR_PALHA);
	TextDrawAlignment(tdRecarga,0);
	TextDrawFont(tdRecarga,0);
	TextDrawLetterSize(tdRecarga,2,2);
	//Boate
	tdStrip = TextDrawCreate(5,300,"Boate de Strip");
	TextDrawColor(tdStrip,COLOR_ROSA);
	TextDrawAlignment(tdStrip,0);
	TextDrawFont(tdStrip,0);
	TextDrawLetterSize(tdStrip,2,2);

//|------------------------------------[ VEÕCULOS ]--------------------------------------------------
	AddPlayerClass(34, -1958.5107, 293.6747, 35.4688, 269.1425, 0, 0, 0, 0, 0, 0);
	alugado1 =  137;	// SF LocaÁ„o 1
	alugado2 =  138;	// SF LocaÁ„o 2
	alugado3 =  139; 	// SF LocaÁ„o 3
	alugado4 =  140;	// SF LocaÁ„o 4
	alugado5 =  141;	// SF LocaÁ„o 5
	alugado6 = 	142;	// SF LocaÁ„o 6
	alugado7 = 	143;	// SF LocaÁ„o 7
	alugado8 = 	144;	// SF LocaÁ„o 8
	alugado9 =	145;	// SF LocaÁ„o 9
//|------------------------------------[ PICKUPS ]----------------------------------------------------
	AddStaticPickup(1274,1,-1746.1521,962.3468,24.8906);//cifrao hotel sf
	AddStaticPickup(1274,1,-1974.1283,117.5247,27.6875);//cifrao train station sf
	AddStaticPickup(1274,1,-2446.8564,522.0898,30.2816);//cifrao sa federal mint
	AddStaticPickup(1274,1,1721.8188,-1718.9016,13.5341);//cifrao atrium
	AddStaticPickup(1274,1,398.1302,-1805.6890,7.8380);//cifrao praia
	AddStaticPickup(1274,1,1309.5111,-1370.3267,13.5731);//cifrao los santos
	AddStaticPickup(1274,1,-1600.3402,872.6577,9.2298);//cifrao novo
	AddStaticPickup(1274,1,1022.5526,-1122.4902,23.8712);//cifrao teatro chines
	AddStaticPickup(1274,1,2091.0146,2053.3230,10.8203);
	AddStaticPickup(1274,1,2408.9451,1987.9479,10.8203);
	AddStaticPickup(1274,1,-2446.6597,522.3193,30.2520);
	AddStaticPickup(1274,1,-2443.2886,752.7733,35.1786);
	AddStaticPickup(362,2,1420.2501,2881.3828,10.8203);//minigun
	AddStaticPickup(350,2,-1609.9634,674.0835,-5.2422); // shotgun
	AddStaticPickup(356,2,-1608.0623,674.1035,-5.2422); // m4
	AddStaticPickup(355,2,-1603.5215,674.7878,-5.2422); // ak47
	AddStaticPickup(348,2,-1609.7281,679.0164,-5.2422); // desert eagle
    AddStaticPickup(357,2,-1608.2559,678.6394,-5.2422); //minigun
    AddStaticPickup(372,2,-1606.7788,678.6942,-5.2422); // tec-9
    AddStaticPickup(353,2,-1603.8494,678.8831,-5.2422); // mp5
    AddStaticPickup(343,2,-1605.1569,678.0090,-5.2422); // gas
    AddStaticPickup(1272,1,-1600.4955,863.6196,7.6875); //
    AddStaticPickup(1240,2,-2655.5859,637.5977,14.4531); //
    AddStaticPickup(1274,1,-184.7314,1133.2028,19.7422); //cirao banco fort carson
    AddStaticPickup(1253,1,-318.5863,1535.5477,75.5625); //jornal
    AddStaticPickup(367,2,-312.4564,1515.9036,75.3594); //jornal
	AddStaticPickup(1273,1,-89.8880,1228.2251,19.7422); // abertura do jogo
    AddStaticPickup(1272,1,-136.1065,1117.6442,20.1966);//ccasa azul
    AddStaticPickup(1272,1,-124.3766,976.3793,19.8335);//ccasa azul
    AddStaticPickup(1273,1,-36.3056,1213.9467,19.3523);//ccasa 2
    AddStaticPickup(1273,1,12.7107,1220.0530,19.3407);//ccasa 3
    AddStaticPickup(1273,1,88.7463,1182.0117,18.6641);//ccasa 4
    AddStaticPickup(1273,1,13.8687,1188.6925,19.3158);//ccasa 5
	AddStaticPickup(1244,1,1389.0552,1768.4464,10.8203);//Aero-Gas
    AddStaticPickup(1244,1,-1248.6545,-96.2660,14.1484);//Aero-Gas
    AddStaticPickup(1244,1,1422.8640,-2432.5745,13.0956);//Aero-Gas
    Pickup_EntradaCPD = CreatePickup(seta,2,-6.295575, 1485.665283, 12.723469);
    Pickup_SaidaCPD = CreatePickup(seta,2,389.7861,171.6789,1008.3828);

//|-------------------[ BOMBAS DE GASOLINA ]------------------------
	//CAIXAS ELETRONICOS
	CreateObject(2754,-180.69,1137.54,19.5969,0,0,0);//FORT-CARSON
	CreateObject(2754,2181.86,1124.14,11.9969,0,0,0);//LV-COMEALOT
	CreateObject(2754,-1740.67,964.274,24.275,0,0,270);//SF-HOTEL
	CreateObject(2754,-1975.37,116.479,27.2672,0,0,90);//SF-STATION
	CreateObject(2754,-2437.48,525.369,29.7703,0,0,180);//SF-SAFM
	CreateObject(1676,72.9045,1215.9448,19.75,0,0,75); //gas
    CreateObject(1676,66.9647,1216.9437,19.75,0,0,75); //gas
	CreateObject(1676,73.7226,1219.1602,19.75,0,0,75); // bomba1
	CreateObject(1676,67.9190,1220.9857,19.75,0,0,75); // bomba 2
    CreateObject(1229,-179.2676,1194.9072,19.5828,0,0,0); //cones
    CreateObject(1229,-147.9481,1193.2756,19.7422,0,0,0); //cones
	CreateObject(1238,-128.1259,985.5732,19.1,0,0,0);//cone2moto
	CreateObject(1238,-127.5543,990.3529,19.1,0,0,0);//cone2moto
	CreateObject(1238,-126.7438,995.5588,19.1,0,0,0);//cone2moto
	CreateObject(1238,-125.5149,1003.4517,19.1,0,0,0);//cone2moto
	CreateObject(1238,-125.1488,1011.4898,19.1,0,0,0);//cone2moto
	CreateObject(1238,-128.0773,1018.4604,19.1,0,0,0);//cone2moto
    CreateObject(1238,-142.6764,1001.7578,19,0,0,0);//cone2
	CreateObject(1238,-142.2496,997.0837,19,0,0,0);//cone2
	CreateObject(1238,-139.8457,991.6938,19,0,0,0);//cone2
	CreateObject(1238,-138.4230,986.5345,19,0,0,0);//cone2
	CreateObject(1238,-141.2153,1008.1278,19,0,0,0);//cone2moto
	CreateObject(1238,-141.7244,1012.3967,19,0,0,0);//cone2moto
	CreateObject(1238,-136.5029,1019.0707,19,0,0,0);//cone2moto
	CreateObject(1238,-130.7449,1021.7218,19,0,0,0);//cone2moto
	CreateObject(vaca,-1093.0337,-1275.2739,129.2188,0,0,0); // vaca1
	CreateObject(vaca,-1090.6830,-1273.4948,129.2188,0,0,0); // vaca2
	CreateObject(vaca,-1092.2952,-1270.1226,129.2188,0,0,0); // vaca3
	CreateObject(vaca,-1098.5670,-1272.1857,129.2188,0,0,0); // vaca4
	CreateObject(vaca,-1094.9755,-1277.0985,129.2188,0,0,0); // vaca5
	CreateObject(vaca,-1085.9725,-1277.5209,129.2188,0,0,0); // vaca6
	CreateObject(vaca,-1083.4242,-1272.7769,129.2188,0,0,0); // vaca7
	CreateObject(vaca,-1098.8875,-1274.7876,129.2188,0,0,0); // vaca8
	CreateObject(vaca,-1086.1898,-1270.3119,129.2188,0,0,0); // vaca9
	CreateObject(4139, 2885.090576, -354.703461, 7.405446, 0, 0, 9.4538);
	CreateObject(4146, 2975.538086, -372.186768, 7.150093, 0, 0, 10.3132);
	CreateObject(4146, 3073.393555, -374.017914, 6.864894, 0.8594, 0, 11.1727);
	CreateObject(4589, 3173.719971, -345.809937, 7.248188, 0, 0, 9.4538);
	CreateObject(4651, 3281.751221, -361.691315, 9.651163, 0.8594, 355.7028, 9.4538);
	CreateObject(4651, 3378.052734, -472.269318, 15.276228, 0.8594, 4.2972, 190.6907);
	CreateObject(4823, 3542.176270, -587.351868, 42.182240, 0, 359.1406, 99.6946);
	CreateObject(4651, 3683.080078, -724.806335, 63.086342, 0, 0, 189.0765);
	CreateObject(4146, 3788.188721, -772.708862, 63.033340, 0, 0, 8.5944);
	CreateObject(4651, 3893.740967, -728.709839, 53.411591, 351.4056, 0, 278.3536);
	CreateObject(8419, 2.986192, 1511.216797, 23.540054, 0, 0, 270.6186);
	/*OBJETOS com bug
	CreateObject(9518,-173.128,967.85,21.4125,0,-357.4,-90);
	CreateObject(669,-177.775,983.122,18.6797,0,0,0);
	CreateObject(3865,-195.475,991.798,17.6672,0,125.501,90);
	CreateObject(3865,-190.375,991.898,17.6672,0,132.627,-90);
	CreateObject(9310,-229.526,1037.87,25.2719,0,0.996514,-90);
	CreateObject(3359,-174.061,997.47,18.4031,0,0,90);
	CreateObject(16500,-178.472,996.144,20.4031,180,180,8.65143e-06);
	*/
//|--------------------------[ LOMBADAS ]------------------------------
	CreateObject(lombada,-41.9534,1199.1,16.75,180,180,0);//lombada 1-1
	CreateObject(lombada,-41.9534,1197.9,16.75,0,180,0);//lombada 1-2
	CreateObject(lombada,-147.343,1197.84,17.15,0,0,0);//lombada 2-1
	CreateObject(lombada,-147.343,1198.64,17.15,0,0,180);//lombada 2-2
	CreateObject(lombada,-65.2218,1068.95,17.15,0,0,-90);//lombada 3-1
	CreateObject(lombada,-65.8218,1068.95,17.15,0,0,90);//lombada 3-2
	CreateObject(lombada,-34.6339,1098.77,17.15,180,0,0);//lombada 4-1
	CreateObject(lombada,-34.6339,1097.97,17.15,0,0,0);//lombada 4-2
	CreateObject(lombada,-132.974,1097.92,17.2,0,0,0);//lombada 5-1
	CreateObject(lombada,-132.974,1098.72,17.2,180,0,0);/*lombada 5-2
    CreateObject(lombada, 1496.763, -1732.586, 11.166, 0, 0, 0);
	CreateObject(lombada, 1206.097, -1354.198, 11.061, 0, 0, 90);
	CreateObject(lombada, 1195.629, -1354.238, 11.011, 0, 0, 270);
	CreateObject(lombada, 1714.780, -1366.729, 11.016, 0, 0, 90);
	CreateObject(lombada, 2448.998, -1658.858, 10.863, 0, 0, 0);
	CreateObject(lombada, 1961.842, -2132.977, 10.966, 0, 0, 90);
	CreateObject(lombada, 1529.822, -1643.653, 11.066, 0, 0, 90);
	CreateObject(lombada, 1482.223, -1592.370, 11.066, 0, 0, 180);
	CreateObject(lombada, 1647.731, 1814.472, 8.330, 0, 0, 270);
	CreateObject(lombada, 1531.349, 1873.085, 8.505, 0, 0, 180);
	CreateObject(lombada, 1883.633, 2173.238, 8.305, 0, 0, 360);
	CreateObject(lombada, 2227.389, 2478.708, 8.413, 0, 0, 270);
	CreateObject(lombada, 2257.733, 2413.147, 8.263, 0, 0, 360);
	CreateObject(lombada, 2456.079, 2233.429, 8.338, 0, 0, 360);
	CreateObject(lombada, 2588.867, 2233.124, 8.305, 0, 0, 360);
	CreateObject(lombada, 2579.009, 1953.363, 8.405, 0, 0, 360);
	CreateObject(lombada, 1007.124, 1457.381, 8.363, 0, 0, 270);
	CreateObject(lombada, -2006.22, 215.538, 25.323, 0, 0, 90);
	CreateObject(lombada, -2606.56, 544.695, 12.069, 0, 0, 270);
	CreateObject(lombada, -2226.62, 542.691, 32.649, 0, 0, 270);
*/
	//MENU's

	//MENUBOMBSHOP
	Bombshop = CreateMenu("Loja de bombas",2,2,150,100,20);
	if(IsValidMenu(Bombshop)){
	    SetMenuColumnHeader(Bombshop,0,"Produto");
	    SetMenuColumnHeader(Bombshop,1,"Preúo");
		AddMenuItem(Bombshop,0,"Napalm");
		AddMenuItem(Bombshop,1,"$500");
		AddMenuItem(Bombshop,0,"Dinamite");
		AddMenuItem(Bombshop,1,"$450");
		AddMenuItem(Bombshop,0,"Sair");
	}
	//----
	Bombshopveh = CreateMenu("Loja de bombas",2,2,150,100,20);
	if(IsValidMenu(Bombshopveh)){
	    SetMenuColumnHeader(Bombshop,0,"Produto");
	    SetMenuColumnHeader(Bombshop,1,"Preúo");
		AddMenuItem(Bombshopveh,0,"Instalar bomba");
		AddMenuItem(Bombshopveh,1,"$500");
		AddMenuItem(Bombshopveh,0,"Napalm");
		AddMenuItem(Bombshopveh,1,"$500");
		AddMenuItem(Bombshopveh,0,"Dinamite");
		AddMenuItem(Bombshopveh,1,"$450");
		AddMenuItem(Bombshopveh,0,"Sair");
	}

	CPD_First = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_First)){
	    SetMenuColumnHeader(CPD_First,0,"Nome");
	    SetMenuColumnHeader(CPD_First,1,"Salòrio");
	    AddMenuItem(CPD_First,0,"Desempregado");
		AddMenuItem(CPD_First,1,"$350");
		AddMenuItem(CPD_First,0,"Barman");
		AddMenuItem(CPD_First,1,"$800");
		AddMenuItem(CPD_First,0,"Entregador de Pizza");
		AddMenuItem(CPD_First,1,"$1400");
		AddMenuItem(CPD_First,0,"Mototaxista");
		AddMenuItem(CPD_First,1,"$1400");
		AddMenuItem(CPD_First,0,"Taxista");
		AddMenuItem(CPD_First,1,"$1400");
		AddMenuItem(CPD_First,0,"Assassino");
		AddMenuItem(CPD_First,1,"$400");
		AddMenuItem(CPD_First,0,"Caúador");
		AddMenuItem(CPD_First,1,"$2000");
		AddMenuItem(CPD_First,0,"Pescador");
		AddMenuItem(CPD_First,1,"$1400");
	}
	CPD_Second = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Second)){
		SetMenuColumnHeader(CPD_Second,0,"Nome");
	    SetMenuColumnHeader(CPD_Second,1,"Salòrio");
	    AddMenuItem(CPD_Second,0,"Taxi Aereo");
	    AddMenuItem(CPD_Second,1,"$1500");
	    AddMenuItem(CPD_Second,0,"Seguranúa");
	    AddMenuItem(CPD_Second,1,"$1000");
	    AddMenuItem(CPD_Second,0,"Motorista de Onibus");
	    AddMenuItem(CPD_Second,1,"$2000");
	    AddMenuItem(CPD_Second,0,"Pedreira");
	    AddMenuItem(CPD_Second,1,"$1500");
	    AddMenuItem(CPD_Second,0,"Motorista");
	    AddMenuItem(CPD_Second,1,"$2000");
		AddMenuItem(CPD_Second,0,"Jornalista");
	    AddMenuItem(CPD_Second,1,"$1500");
	    AddMenuItem(CPD_Second,0,"Caminhoneiro");
	    AddMenuItem(CPD_Second,1,"$1500");
	    AddMenuItem(CPD_Second,0,"Assaltante");
	    AddMenuItem(CPD_Second,1,"$600");
	    AddMenuItem(CPD_Second,0,"Frentista");
	    AddMenuItem(CPD_Second,1,"$1200");
	    AddMenuItem(CPD_Second,0,"Paramedico");
	    AddMenuItem(CPD_Second,1,"$1000");
	    AddMenuItem(CPD_Second,0,"Transporte de Valores");
	    AddMenuItem(CPD_Second,1,"$1200");
	    AddMenuItem(CPD_Second,0,"Ladrao de Carros");
  	    AddMenuItem(CPD_Second,1,"$1000");
	}
	CPD_Third = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Third)){
		SetMenuColumnHeader(CPD_Third,0,"Nome");
	    SetMenuColumnHeader(CPD_Third,1,"Salòrio");
	    AddMenuItem(CPD_Third,0,"Prostituta");
	    AddMenuItem(CPD_Third,1,"$800");
	    AddMenuItem(CPD_Third,0,"Agricultor");
	    AddMenuItem(CPD_Third,1,"$1200");
	    AddMenuItem(CPD_Third,0,"Traficante");
	    AddMenuItem(CPD_Third,1,"$1000");
	    AddMenuItem(CPD_Third,0,"Vendedor de Armas");
	    AddMenuItem(CPD_Third,1,"$1400");
	    AddMenuItem(CPD_Third,0,"Receita Federal");
	    AddMenuItem(CPD_Third,1,"$2000");
	    AddMenuItem(CPD_Third,0,"Contrabandista");
	    AddMenuItem(CPD_Third,1,"$800");
	    AddMenuItem(CPD_Third,0,"Locador de Carros");
	    AddMenuItem(CPD_Third,1,"$1000");
	    AddMenuItem(CPD_Third,0,"Mecanico");
	    AddMenuItem(CPD_Third,1,"$1000");
	}
	CPD_Fourth = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Fourth)){
		SetMenuColumnHeader(CPD_Fourth,0,"Nome");
	    SetMenuColumnHeader(CPD_Fourth,1,"Salòrio");
	    AddMenuItem(CPD_Fourth,0,"Cop Florestal");
	    AddMenuItem(CPD_Fourth,1,"$2000");
	    AddMenuItem(CPD_Fourth,0,"Instrutor de Carros");
	    AddMenuItem(CPD_Fourth,1,"$850");
	    AddMenuItem(CPD_Fourth,0,"Cop Militar");
	    AddMenuItem(CPD_Fourth,1,"$1200");
	    AddMenuItem(CPD_Fourth,0,"Cop Rodoviario");
	    AddMenuItem(CPD_Fourth,1,"$1400");
	    AddMenuItem(CPD_Fourth,0,"Cop Narcoticos");
	    AddMenuItem(CPD_Fourth,1,"$1800");
	    AddMenuItem(CPD_Fourth,0,"Advogado");
	    AddMenuItem(CPD_Fourth,1,"$1000");
	}
	    
	CPD_Fifth = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Fifth)){
		SetMenuColumnHeader(CPD_Fifth,0,"Nome");
	    SetMenuColumnHeader(CPD_Fifth,1,"Salòrio");
	    AddMenuItem(CPD_Fifth,0,"Cop Swat");
	    AddMenuItem(CPD_Fifth,1,"$2000");
	    AddMenuItem(CPD_Fifth,0,"Corretor");
	    AddMenuItem(CPD_Fifth,1,"$350");
	    AddMenuItem(CPD_Fifth,0,"Vendedor de Carros");
	    AddMenuItem(CPD_Fifth,1,"$350");
	}
	
	CPD_Sixth = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Sixth)){
		SetMenuColumnHeader(CPD_Sixth,0,"Nome");
	    SetMenuColumnHeader(CPD_Sixth,1,"Salòrio");
	    AddMenuItem(CPD_Sixth,0,"Sheriff");
	    AddMenuItem(CPD_Sixth,1,"$4500");
	    AddMenuItem(CPD_Sixth,0,"Juiz");
	    AddMenuItem(CPD_Sixth,1,"$3000");
	}
	    
	    
	Gates[0] = CreateObject(968, 1544.687866, -1630.546875, 13.165515, 0, 269.4727, 269.9995);
	Gates[1] = CreateObject(968, 2238.198730, 2450.429932, 10.597424, 0, 269.4727, 269.9996);
	Gates[2] = CreateObject(968, -1572.189331, 658.876709, 6.887374, 0, 269.4727, 269.9995);
	Gates[3] = CreateObject(968, -1701.452271, 687.616211, 24.592068, 0, 269.4727, 269.9995);
	//----
	SetTimer("KeyT",100,1);
	SetTimer("CPD_CPHandler",1000,1);
	SetTimer("GatesCoordChecker",1000,1);
	SetTimer("Bancos", 1000, 1);
//	SetTimer("GasSaving",120000,1);
	SetTimer("CheckFuel", 50000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("Tempo", 900, 1);
	SetTimer("Speed",900,1);
	SetTimer("Radar",1000,1);
	SetTimer("Casino", 5013, 1);
	SetTimer("LoteriaComeco",500000, 1);
	SetTimer("VoteKickTimer", 1000, 1);
	SetTimer("sequestrar", 60000, 1);
	LoadPickups("pickups.rpg");
	LoadCell("celulares.rpg");
	for(new i; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
		    SetPlayerTime(i,12,0);
		}
	}
//Carros no mysql e conex„o:
	if(samp_mysql_connect("localhost", "root", "dani@1010") == 1){//Mysql
//	if(samp_mysql_connect("200.157.179.60", "infernusgroup01", "zyj4599op99") == 1){//Mysql
		mysql = 1;
		new resultline[1024];
    	new contador;
    	new field[128], field2[128], id, modelid, Float:x, Float:y, Float:z, Float:ang, cor1, cor2,don[MAX_PLAYER_NAME], gaso;
		new string[256];
		format(string, sizeof(string),"SELECT id,modelid,x,y,z,ang,cor1,cor2,dono,gasolina FROM cars ORDER BY id");
		samp_mysql_select_db("infernusgroup01");
		if(samp_mysql_query(string) == 0){
		    printf("Erro na Linha 2519");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
			id = strval(field);
			while(samp_mysql_strtok(field2, "|", "")==1) //From 2nd call to the end you MUST call strtok without resultline
			{
				contador++;
				contador%=9;
				if(contador == 1){
					modelid = strval(field2);
				}
				if(contador == 2){
					x = Float:floatstr(field2);
				}
				if(contador == 3){
					y = Float:floatstr(field2);
				}
				if(contador == 4){
					z = Float:floatstr(field2);
				}
				if(contador == 5){
					ang = Float:floatstr(field2);
				}
				if(contador == 6){
					cor1 = strval(field2);
				}
				if(contador == 7){
					cor2 = strval(field2);
				}
				if(contador == 8){
					set(don,field2);
				}
				if(contador == 0){
					gaso = strval(field2);
				}
			}
			switch(modelid){
			    case 481,509,510,594,599,523:
		        {
		            GPV[id]=-1;
				}
				default:
			    {
					GPV[id] = gaso;
				}
			}
			AddStaticVehicleEx(modelid, x, y, z, ang, cor1, cor2, 90000);
			Dono[id] = don;
			SetTimerEx("Placa",2000,false,"d",id);
			SetTimerEx("ApplyTuningForVehicle",4000,false,"d",id);
		}
	}
/*	if(!fexist("revo.tmp")){
	    CreateStartupVehicleFiles();
	    dini_Create("revo.tmp");
	} else {
	    LoadGas();
	}
	LoadRcars("carrosmpa.rpg");*/
	return 1;
}

public Placa(vehicleid)
{
	if(mysql == 1){
		new resultline[1024];
    	new query[256];
    	new field[128], placa[7];
		samp_mysql_select_db("infernusgroup01");
		new string[256];
		format(string, sizeof(string), "SELECT placa FROM cars WHERE id = %d", vehicleid);
		samp_mysql_real_escape_string(string, query);
		if(samp_mysql_query(query) == 0){
		    printf("Erro na Linha 398");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
		    set(placa, field);
			if(placa[0] != 0){
       	        SetVehicleNumberPlate(vehicleid, placa);
       	        SetVehicleToRespawn(vehicleid);
       	    }
		}
	}
}
/*
stock CreateStartupVehicleFiles()
{
	new tmp[256];
	for(new v=1;v<QTCARS+1;v++){
	    format(tmp,256,"%d.vinfo",v);
	    dini_Create(tmp);
	    dini_Set(tmp,"dono","Governo");
	    Dono[v] = "Governo";
		switch(GetVehicleModel(v)){
		    case 481,509,510,594,599,523:
		        {
		            dini_IntSet(tmp,"gasolina",-1);
		            GPV[v]=-1;
				}
			default:
			    {
			        dini_IntSet(tmp,"gasolina",100);
			        GPV[v]=100;
				}
		}
	}

}
*/
stock LoadCell(pattern[])
{
	new msg[256];
	if(!fexist(pattern)){
	    format(msg,256,"Carregando Lista de celulares... Arquivo %s n„o encontrado, criado automaticamente para o salvamento dos celulares.",pattern);
	    writelog(msg);
	    dini_Create(pattern);
	    dini_IntSet(pattern,"LastPN",1000);
	    LastPN = 1000;
	    return 1;
	}
	if(!dini_Isset(pattern,"LastPN")){
		dini_IntSet(pattern,"LastPN",1000);
		LastPN = 1000;
		return 1;
	}
	LastPN = dini_Int(pattern,"LastPN");
	format(msg,256,"Carregando Lista de celulares... OK.\n⁄ltimo n˙mero carregado: %d",LastPN);
	return 1;
}
stock LoadPickups(pattern[])
{
	new tmp[256],File:temp,Float:X,Float:Y,Float:Z;
	if(!fexist(pattern)){
		new msg[256];
	    format(msg,256,"Carregando lista de Pickups... Arquivo %s n„o encontrado.\nPara o salvamento de pickups, o arquivo %s foi criado.",pattern,pattern);
	    writelog(msg);
	    dini_Create(pattern);
	    return 1;
	}
   	new QtPickups;
   	new string[256],index;
	temp = fopen(pattern, io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		format(string, sizeof(string), "%f, %f, %f", X, Y, Z);
		CreatePickup(1272, 1, Float:X, Float:Y, Float:Z);
		QtPickups++;
	}
	fclose(temp);
	writelog("Carregando lista de Pickups... OK!");
	format(tmp,sizeof(tmp),"%d Pickups carregados.",QtPickups);
	writelog(tmp);
	return 1;
}
stock LoadRcars(pattern[])
{
	new tmp[256],tmp2[256],File:temp,modelid,Float:X,Float:Y,Float:Z,Float:ang,Cor1,Cor2,resveh,strveh[256];
	if(!fexist(pattern)){
	    new msg[256];
	    format(msg,256,"Carregando lista de veÌculos... Arquivo %s n„o encontrado.\nPara o salvamento de veÌculos, o arquivo %s foi criado.",pattern,pattern);
	    writelog(msg);
		dini_Create(pattern);
		return 1;
	}
    new QtCars,index;
	temp = fopen(pattern, io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid    = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		ang        = Float:floatstr(strtok(tmp, index));
		Cor1       = strval(strtok(tmp, index));
		Cor2       = strval(strtok(tmp, index));
		QtCars++;
		resveh = CreateVehicle(modelid, X, Y, Z, ang, Cor1, Cor2, -1);
		LastCar = resveh;
		format(strveh,256,"%d",resveh);
		format(tmp2,256,"%d.vinfo",resveh);
		if(!fexist(tmp2)){
		    dini_Create(tmp2);
		    dini_Set(tmp2,"dono","Governo");
		    Dono[resveh] = "Governo";
			switch(modelid){
			    case 481,509,510,594,599,523:
		        {
		            dini_IntSet(tmp2,"gasolina",-1);
		            GPV[resveh]=-1;
				}
				default:
			    {
			        dini_IntSet(tmp2,"gasolina",100);
			        GPV[resveh]=100;
				}
			}
		} else {
			set(Dono[resveh],dini_Get(tmp2,"dono"));
		}
	}
	fclose(temp);
	writelog("Carregando lista de ve√≠culos... OK!");
	format(tmp,sizeof(tmp),"%d ve√≠culos carregados.",QtCars);
	writelog(tmp);
	ApplyTuningForAllVehicles();
	return 1;
}
stock ApplyTuningForAllVehicles(){
	new pattern[256] = "1.vinfo";
	new contagem = 1;
	while(fexist(pattern)){
	    ApplyTuningForVehicle(contagem);
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
}
public ApplyTuningForVehicle(vehicleid){
/*	new tmp[256];
	format(tmp,256,"%d.vinfo",vehicleid);
	if(!fexist(tmp)) return 0;
	if(dini_Isset(tmp,"paintjob")) ChangeVehiclePaintjob(vehicleid,dini_Int(tmp,"paintjob"));
	for(new ts=1; ts<18; ts++){
	    new tmp2[256];
	    format(tmp2,256,"tun%d",ts);
	    if(dini_Isset(tmp,tmp2)) AddVehicleComponent(vehicleid,dini_Int(tmp,tmp2));
	}
	return 1;
*/
	if(vehicleid > 0){
		if(mysql == 1){
		    new resultline[1024];
    		new query[256], contador;
    		new field[128], field2[128];
    		new id,pintura,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17;
			samp_mysql_select_db("infernusgroup01");
			samp_mysql_real_escape_string("SELECT id,pintura,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17 FROM cars", query);
			if(samp_mysql_query(query) == 0){
			    printf("Erro na linha 2739");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				id = strval(field);
				while(samp_mysql_strtok(field2, "|", "")==1) //From 2nd call to the end you MUST call strtok without resultline
				{
					contador++;
					contador%=18;
					if(contador == 1){
						pintura = strval(field2);
					}
					if(contador == 2){
						t1 = strval(field2);
					}
					if(contador == 3){
						t2 = strval(field2);
					}
					if(contador == 4){
						t3 = strval(field2);
					}
					if(contador == 5){
						t4 = strval(field2);
					}
					if(contador == 6){
						t5 = strval(field2);
					}
					if(contador == 7){
						t6 = strval(field2);
					}
					if(contador == 8){
						t7 = strval(field2);
					}
					if(contador == 9){
						t8 = strval(field2);
					}
					if(contador == 10){
						t9 = strval(field2);
					}
					if(contador == 11){
						t10 = strval(field2);
					}
					if(contador == 12){
						t11 = strval(field2);
					}
					if(contador == 13){
						t12 = strval(field2);
					}
					if(contador == 14){
						t13 = strval(field2);
					}
					if(contador == 15){
						t14 = strval(field2);
					}
					if(contador == 16){
						t15 = strval(field2);
					}
					if(contador == 17){
						t16 = strval(field2);
					}
					if(contador == 0){
						t17 = strval(field2);
					}
				}
            	if(vehicleid == id){
				    if(pintura != 0){
				        ChangeVehiclePaintjob(vehicleid, pintura);
			    	}
			    	if(t1 != 0){
	   					AddVehicleComponent(vehicleid, t1);
	   				}
			    	if(t2 != 0){
 	  					AddVehicleComponent(vehicleid, t2);
	   				}
		    		if(t3 != 0){
   						AddVehicleComponent(vehicleid, t3);
   					}
		    		if(t4 != 0){
   						AddVehicleComponent(vehicleid, t4);
   					}
		    		if(t5 != 0){
   						AddVehicleComponent(vehicleid, t5);
   					}
		    		if(t6 != 0){
   						AddVehicleComponent(vehicleid, t6);
   					}
		    		if(t7 != 0){
   						AddVehicleComponent(vehicleid, t7);
   					}
		    		if(t8 != 0){
   						AddVehicleComponent(vehicleid, t8);
   					}
		    		if(t9 != 0){
   						AddVehicleComponent(vehicleid, t9);
   					}
		    		if(t10 != 0){
   						AddVehicleComponent(vehicleid, t10);
   					}
		   	 		if(t11 != 0){
   						AddVehicleComponent(vehicleid, t11);
   					}
		    		if(t12 != 0){
   						AddVehicleComponent(vehicleid, t12);
   					}
		    		if(t13 != 0){
   						AddVehicleComponent(vehicleid, t13);
   					}
		    		if(t14 != 0){
   						AddVehicleComponent(vehicleid, t14);
   					}
		    		if(t15 != 0){
   						AddVehicleComponent(vehicleid, t15);
   					}
		    		if(t16 != 0){
   						AddVehicleComponent(vehicleid, t16);
   					}
		    		if(t17 != 0){
   						AddVehicleComponent(vehicleid, t17);
   					}
   				}
   			}
   		}
	}
	return 1;
}
/*
stock SavePaintjob(vehicle,paintjob)
{
	new tmp[256];
	format(tmp,256,"%d.vinfo",vehicle);
	dini_IntSet(tmp,"paintjob",paintjob);
	return 1;
}
forward GasSaving();
public GasSaving() SaveGas();
stock SaveTuning(vehicleid,slot,componentid)
{
	new tmp[256],tmp2[5];
	format(tmp,256,"%d.vinfo",vehicleid);
	if(!fexist(tmp)) return 0;
	format(tmp2,5,"tun%d",slot);
	dini_IntSet(tmp,tmp2,componentid);
	return 1;
}
*/
public OnVehicleMod(vehicleid, componentid)
{
	new campo[256];
	switch(componentid)
	{
	 	case 1018,1019,1020,1021,1022,1028,1029,1034,1037,1043,1044,1045,1046,1059,1064,1065,1066,1089,1092,1104,1105,1113,1114,1126,1127,1129,1132,1135,1136: format(campo, sizeof(campo), "t1");
	    case 1004,1005,1011,1012: format(campo, sizeof(campo), "t2");
	    case 1006,1032,1033,1035,1038,1053,1054,1055,1061,1067,1068,1088,1091,1103,1128,1130,1131: format(campo, sizeof(campo), "t3");
		case 1025,1073,1074,1075,7076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1096,1097,1098: format(campo, sizeof(campo), "t4");
	    case 1087: format(campo, sizeof(campo), "t5");
	    case 1008,1009,1010: format(campo, sizeof(campo), "t6");
	    case 1117,1152,1153,1155,1157,1160,1165,1167,1169,1170,1171,1172,1173,1174,1176,1179,1181,1182,1185,1188,1189,1190,1191: format(campo, sizeof(campo), "t7");
	    case 1140,1141,1148,1149,1150,1151,1154,1156,1159,1161,1166,1168,1175,1177,1178,1180,1183,1184,1186,1187,1192,1193: format(campo, sizeof(campo), "t8");
	    case 1013,1024: format(campo, sizeof(campo), "t9");
		case 1000,1001,1002,1003,1014,1015,1016,1023,1049,1050,1058,1060,1138,1139,1146,1147,1158,1162,1163,1164: format(campo, sizeof(campo), "t10");
	    case 1007,1017,1026,1027,1030,1031,1036,1039,1040,1041,1042,1047,1048,1051,1052,1056,1057,1062,1063,1069,1070,1071,1072,1090,1093,1094,1095,1099,1101,1102,1106,1107,1108,1118,1119,1120,1121,1122,1124,1133,1134,1137: format(campo, sizeof(campo), "t11");
	    case 1109,1110: format(campo, sizeof(campo), "t12");
	    case 1115,1116: format(campo, sizeof(campo), "t13");
     	case 1086: format(campo, sizeof(campo), "t14");
		case 1142, 1143, 1144, 1145: format(campo, sizeof(campo), "t15");
    	case 1111, 1112: format(campo, sizeof(campo), "t16");
		case 1100, 1123: format(campo, sizeof(campo), "t17");
	}
	if(mysql == 1){
		new string5[MAX_STRING];
    	format(string5, sizeof(string5), "UPDATE cars SET %s = %d  WHERE id = %d", campo, componentid, vehicleid);
    	samp_mysql_select_db("infernusgroup01");
    	if(samp_mysql_query(string5) == 0){
		    printf("Erro na linha 2914");
		}
    }
	return 1;
}
/*
stock SaveGas()
{
	new pattern[256];
	new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    dini_IntSet(pattern,"gasolina",GPV[contagem]);
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
	return 1;
}

stock LoadGas()
{
	new pattern[256];
	new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    GPV[contagem] = dini_Int(pattern,"gasolina");
	    contagem++;
	    set(Dono[contagem],dini_Get(pattern,"dono"));
	    format(pattern,256,"%d.vinfo",contagem);
	}
	return 1;
}
*/
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerColor(playerid,COLOR_UNLOGGED);
	SetPlayerPos(playerid,-225.1628,1402.7882,27.7734);
	SetPlayerInterior(playerid,18);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid,-227.5080,1400.1602,27.7734);
	SetPlayerCameraLookAt(playerid,-225.1628,1402.7882,27.7734);
	ApplyAnimation(playerid,"PED","WALK_DRUNK",4.1,1,1,1,1,1);
	if(PLAYERLIST_authed[playerid] == 1){
		LogarPlayer(playerid);
	}
	return 1;
}

public OnGameModeExit()
{
	writelog("MPARRPG finalizado. Fechando log e salvando estatÌsticas dos usu·rios...");
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
		    if(IsPlayerInAnyVehicle(i)){
		    	RemovePlayerFromVehicle(i);
		    }
			if (PLAYERLIST_authed[i] == 1) {
			// Was loggedin, so save the data!
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET acc_state = '%d ', gasoline = '%d ' WHERE nickname = '%s '", GetPlayerMoney(i), Petrol[i], PlayerName(i));
					if(samp_mysql_query(string2) == 0){
	   				 	printf("Erro na linha 2960");
					}
				}
				new msg[256];
				format(msg,sizeof(msg),"Salvando dados de %s (ID %d)... OK!",udb_decode(PlayerName(i)),i);
				writelog(msg);
				printf("Dados de %s (ID: %d) salvos com sucesso\n",PlayerName(i),i);
			}
		}
	}
	writelog("Salvando estatÌsticas dos usu·rios... ConcluÌdo!");
	writelog("MPARRPG finalizado com sucesso");
	mysql = 0;
	samp_mysql_close();
	print("Saindo do GameMode RPG");
	
	return 1;
}

public OnPlayerConnect(playerid)
{
    SetPlayerMapIcon(playerid, 1, 1556.1224,-1629.2106,13.1586, 30, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 2, 1181.4885,-1309.3250,13.4093, 22, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 3, 1022.5409,-1123.1603,23.6471, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 4, 1721.1100,-1718.5043,13.3080, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 5, -1859.2200,-1654.0905,26.8412, 23, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 6, -1736.4275,-582.8713,35.9542, 5, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 8, -1972.6488,121.8071,37.1555, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 9, -2060.0562,278.3264,35.5171, 11, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 10, -2662.1035,618.6307,14.6341, 22, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 11, -1743.4098,956.4698,25.5861, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 12, -1665.5760,1212.6101,33.2029, 55, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 13, -224.4546,984.7741,26.8839, 30, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 14, -2431.5830,1544.0275,32.0368, 23, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 15, -661.0384,875.0275,5.2076, 17, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 16, -121.2929,857.6016,21.0554, 55, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 17, -1616.1891,665.1757,7.3632, 30, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 18, -307.6538,1050.7843,26.4270, 22, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 19, -363.2198,1168.8317,19.8351, 19, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 20, -141.3534,1126.0513,20.0552, 36, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 21, -184.8373,1132.3842,19.4750, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 22, 623.3184,860.1561,-42.9534, 11, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 23, 2583.7615,1976.8402,10.8203, 51, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 24, 2277.0449,2452.5984,10.9448, 30, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 25, 2181.1938,1117.3713,12.7725, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 26, 1716.5208,1601.4703,10.1434, 5, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 27, 1583.7100,1833.9187,10.9483, 22, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 28, -1061.9409,-1220.5979,129.0004, 51, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 29, -1127.2666,-1015.1935,129.0007, 17, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 30, -2180.8816,610.9266,35.1641, 43, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 31, -2443.2886,752.7733,35.1786, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 32, 2091.0146,2053.3230,10.8203, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 33,2408.9451,1987.9479,10.8203, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 34,-2046.7181,-1598.5377,154.4048, 19, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 35,1960.5984,-2173.7485,13.4622, 5, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 36,-1928.9037,245.6663,41.0469, 27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 37,-2713.0405,215.9057,4.2495, 27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 38,2644.6877,-2038.3588,13.5500, 27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 39,1041.6371,-1028.2263,31.6374, 27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 40,2385.0122,1046.4485,19.0494, 27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 41,661.1511,1717.6909,7.1875,51, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 42,-64.4272,-1133.7277,0.8575,51, 0xE6E6E6E6);
	
	TextDrawShowForPlayer(playerid,Bemvindo);
	TextDrawShowForPlayer(playerid,Bemvindo2);
	TextDrawShowForPlayer(playerid,Bemvindo3);
	
	new randphone = 1000 + random(8999);
	PlayerInfo[playerid][pPnumber] = randphone;
    Agenda[playerid] = 0;
    numplayers++;
    Kills[playerid]=0;
   	Contrabando[playerid] = 0;
	Receita[playerid] = 0;
    celular[playerid] = 0;
   	LastVote[playerid] = 255;
   	KickVote[playerid] = 0;
	VoteKick[playerid] = 0;
    zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	PlayerDentro[playerid]=false;
	Acertos[playerid]=0;
	MissaoLixeiro[playerid] = 0;
	DebugKeys[playerid] = 0;
	TogglePlayerClock(playerid,1);
	SetPlayerTime(playerid,worldTime,worldMinute);
	PLAYERLIST_authed[playerid] = 0;
	Escondido[playerid] = 0;
	AreaBanco[playerid] = 0;
	AreaCreditos[playerid] = 0;
	SetPlayerColor(playerid,COLOR_UNLOGGED);
	new msg[256];
	format(msg,sizeof(msg),"SERVIDOR: %s entrou no servidor.",PlayerName(playerid));
	SendClientMessageToAll(COLOR_COP_SWAT,msg);
	format(msg,sizeof(msg),"%s entra no servidor, com o ID %d.",udb_decode(PlayerName(playerid)),playerid);
	writelog(msg);
//		GameTextForPlayer(playerid, "Bem vindo ao MPA RevolutioN RPG!~n~ ~r~ coders: Grupo Infernus", 5000, 6);
	SendClientMessage(playerid, COLOR_TAXI_AEREO, "MPAÆ RevolutioN RPG v0.2 0.3 Alpha 1: Fort Carson town ");
	SendClientMessage(playerid, COLOR_PALHA, "Quer ajuda? /ajuda");
	SendClientMessage(playerid, COLOR_PALHA, "Comandos? /comandos");
	SendClientMessage(playerid, COLOR_PALHA, "RecÈm-chegado? /aprender");
	SendClientMessage(playerid, COLOR_RED2, "0.3 Alpha 1 Version Extras:");
	SendClientMessage(playerid, COLOR_PALHA, "Sistema de Level e Loja de customizaÁ„o");
	if(mysql == 1){
		new string[256];
   		new resultline[1024];
   		format(string, sizeof(string),"SELECT * FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	samp_mysql_select_db("infernusgroup01");
   		samp_mysql_query(string);
		samp_mysql_store_result();
		new a = 0;
		if(samp_mysql_fetch_row(resultline)==1){
   			SendClientMessage(playerid, COLOR_GREEN, "VocÍ j· est· registrado aqui. FaÁa login com /logar [senha]");
			a = 1;
		}
		if(samp_mysql_fetch_row(resultline)==0 && a != 1){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· registrado. Registresse com /registrar [senha]");
		}
	}
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(!PLAYERLIST_authed[playerid]) SendClientMessage(playerid,COLOR_RED2,"Registre-se ou logue-se antes de entrar com spawn.");
	else LogarPlayer(playerid);
    return 0;
}

public OnPlayerDisconnect(playerid, reason)
{
    numplayers--;
   	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	PLAYERLIST_authed[playerid] = 0;
	if(EmLigacao[playerid] == 1){
	    EmLigacao[playerid]=0;
	    EmLigacao[CalledID[playerid]]=0;
	    SetPlayerSpecialAction(CalledID[playerid],SPECIAL_ACTION_STOPUSECELLPHONE);
	    SendClientMessage(CalledID[playerid],COLOR_RED,"LigaÁ„o terminada.");
		if(CobrancaCall[playerid] == 0){
		    KillTimer(CellTimer[CalledID[playerid]]);
		}
		if(CobrancaCall[playerid] == 1){
		    KillTimer(CellTimer[playerid]);
		}
	}
	new msg[256];
	switch(reason)
	{
		case 0:
			{
	    		format(msg,sizeof(msg),"SERVIDOR: %s deixou o servidor (Queda de conex„o)",PlayerName(playerid));
		    	SendClientMessageToAll(COLOR_COP_SWAT,msg);
			}
		case 1:
		    {
			    format(msg,sizeof(msg),"SERVIDOR: %s deixou o servidor (Vontade prÛpria)",PlayerName(playerid));
	    		SendClientMessageToAll(COLOR_COP_SWAT,msg);
			}
		case 2:
		    {
			    format(msg,sizeof(msg),"SERVIDOR: %s deixou o servidor (Kickado/Banido)",PlayerName(playerid));
	    		SendClientMessageToAll(COLOR_COP_SWAT,msg);
			}
	}
	switch (PLAYERLIST_authed[playerid])
    {
        case 0:
			{
				format(msg,sizeof(msg),"%d (ID: %d) deixou o servidor sem se registrar/logar.",udb_decode(PlayerName(playerid)),playerid);
				writelog(msg);
				printf("Jogador %s (ID: %d) deixou o servidor sem se registrar/logar",PlayerName(playerid),playerid);
			}
		case 1:
		    {
				format(msg,sizeof(msg),"%s (ID %d) est· deixando o servidor. Salvando dados.",udb_decode(PlayerName(playerid)),playerid);
				writelog(msg);
				if(mysql == 1){
					new string[255];
					format(string, sizeof(string), "UPDATE players SET acc_state = %d, gasoline = %d, creditos = %d WHERE nickname = '%s '", GetPlayerMoney(playerid), Petrol[playerid], CellCredits[playerid], PlayerName(playerid));
					if(samp_mysql_query(string) == 0){
	   				 	printf("Erro na linha 3142");
					}
				}
		 		printf("Jogador %s (ID: %d) deixou o servidor. Seus dados foram salvos com sucesso.",PlayerName(playerid),playerid);
			}
    }
	return 1;
}

public OnPlayerSpawn(playerid)
{
   	zoneupdates[playerid] = 1;
	player_zone[playerid] = -1;
	if(!zoneupdate) zoneupdate = SetTimer("update_zones",1000,4);
	TextDrawHideForPlayer(playerid,Bemvindo);
	TextDrawHideForPlayer(playerid,Bemvindo2);
	TextDrawHideForPlayer(playerid,Bemvindo3);
	SetPlayerColor(playerid,ProfColors[Profissao[playerid]]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][0],ProfWeapons[Profissao[playerid]][1]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][2],ProfWeapons[Profissao[playerid]][3]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][4],ProfWeapons[Profissao[playerid]][5]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][6],ProfWeapons[Profissao[playerid]][7]);

    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid,		 0);
	if(PLAYERLIST_authed[playerid] == 0){
		SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		SetPlayerFacingAngle(playerid, 90.0000);
    	return 1;
	}
	new prisao;
	if(mysql == 1){
    	new resultline[1024];
    	new field[128];
		new string[256];
		format(string, sizeof(string),"SELECT prisao FROM players WHERE nickname = '%s '", PlayerName(playerid));
        samp_mysql_select_db("infernusgroup01");
		if(samp_mysql_query(string) == 0){
		    printf("Erro na Linha 3180");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline);
			prisao = strval(field);
		}
	}
	if(prisao == 1 || Procurados[playerid]){
		LogarPlayer(playerid);
    	return 1;
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SendDeathMessage(killerid,playerid,reason);
   	GameTextForPlayer(playerid,"~w~Foi pro saco", 5000,2);
	new hosp = GetClosestHospital(playerid);
	new skin, din;
	if(mysql == 1){
    	new resultline[1024];
    	new field[128], field2[128];
    	new string[255];
    	format(string, sizeof(string),"SELECT skin,bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
        samp_mysql_select_db("infernusgroup01");
		if(samp_mysql_query(string) == 0){
		    printf("Erro na Linha 1856");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
			skin = strval(field);
			while(samp_mysql_strtok(field2, "|", "")==1) //From 2nd call to the end you MUST call strtok without resultline
			{
			    din = strval(field2);
   			}
		}
	}
	SetSpawnInfo(playerid, 1, skin,Hospitais[hosp][0],Hospitais[hosp][1],Hospitais[hosp][2],Hospitais[hosp][3],0,0,0,0,0,0); //
	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	Contrabando[playerid] = 0;
	Receita[playerid] = 0;
	Chave[playerid] = 0;
    new string[256];
    Kills[killerid]++;
    SendClientMessage(playerid, COLOR_RED, "VocÍ foi encontrado quase morto e foi levado ao Hospital. O valor do tratamento foi de $100");
	if(mysql == 1){
		new string2[255];
		format(string2, sizeof(string2), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din-120, PlayerName(playerid));
		if(samp_mysql_query(string2) == 0){
		 	printf("Erro na linha 3236");
		}
	}
	if(Procurados[playerid] == 1){
	    SetSpawnInfo(playerid, 1, skin, 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
		if(mysql == 1){
			new string2[255];
			format(string2, sizeof(string2), "UPDATE players SET prisao = 1 WHERE nickname = '%s '", PlayerName(playerid));
			if(samp_mysql_query(string2) == 0){
			 	printf("Erro na linha 3247");
			}
		}
	}
    if(killerid != INVALID_PLAYER_ID) {
        if(GetPlayerWantedLevel(playerid) > 0){
            SendClientMessage(killerid,COLOR_GREEN,"VocÍ ganhou uma graninha da polÌcia por ter matado esse cara.");
            GivePlayerMoney(killerid,GetPlayerWantedLevel(playerid)*300);
		}
		if(Profissao[killerid] == COP_MILITAR || Profissao[killerid] == COP_RODOVIARIO || Profissao[killerid] == COP_SWAT) {
		    SetPlayerWantedLevel(killerid, 0);
		    SetPlayerWantedLevel(playerid, 0);
			if(mysql == 1){
				new string2[255];
				format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 0 WHERE nickname = '%s '", PlayerName(killerid));
				if(samp_mysql_query(string2) == 0){
			 		printf("Erro na linha 3247");
				}
			}
	    }
	    if((Profissao[playerid] == SHERIFF  || Profissao[playerid] == JUIZ) && Chave[killerid] == 0){
		 	SendClientMessage(killerid, COLOR_GREEN, "VocÍ matou o Juiz/Sheriff, roubou a chave da cadeia, agora pode libertar 1 pessoa!");
		 	SendClientMessage(killerid, COLOR_GREEN, "Basta usar /soltarpreso [id]");
		 	SendClientMessage(playerid, COLOR_JUIZ, "O Assassino roubou a chave da pris„o. Comunique a polÌcia!!");
			Chave[killerid] = 1;
		}
		if((Profissao[killerid] == COP_MILITAR || Profissao[killerid] == COP_SWAT || Profissao[killerid] == SHERIFF) && Chave[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ foi morto por um policial e a chave da cadeia foi tomada de vocÍ!");
			SendClientMessage(killerid, COLOR_GREEN, "Bom trabalho! VocÍ tirou a chave da cadeia desse vagabundo!");
			Chave[playerid] = 0;
		}
	}
	if(Profissao[killerid] == ASSASSINO){
		if(GetPlayerMoney(playerid) < 10000){
    		AcrescentarExPoints(killerid,2);
    		GivePlayerMoney(killerid,GetPlayerMoney(playerid));
    		ResetPlayerMoney(playerid);
			SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 2 Pontos por ter matado um jogador com mais de $10.000");
			return 1;
		}
		else if(GetPlayerMoney(playerid) < 30000){
 			AcrescentarExPoints(killerid,3);
 	    	GivePlayerMoney(killerid,GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
  		    SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 3 Pontos por ter matado um jogador com mais de $30.000");
			return 1;
		}
		else if(GetPlayerMoney(playerid) < 50000){
   			AcrescentarExPoints(killerid,4);
			GivePlayerMoney(killerid,GetPlayerMoney(playerid));
    		ResetPlayerMoney(playerid);
    		SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 4 Pontos por ter matado um jogador com mais de $50.000");
			return 1;
		}
		else if(GetPlayerMoney(playerid) < 100000){
   			AcrescentarExPoints(killerid,5);
 			GivePlayerMoney(killerid,GetPlayerMoney(playerid));
	    	ResetPlayerMoney(playerid);
    		SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 5 Pontos por ter matado um jogador com mais de $100.000");
			return 1;
		}
	}
	switch(Kills[killerid])
	{
	    case 2:
	        {
				format(string, sizeof(string), "O Jogador %s agora tem 1 Estrela de Procurado por 2 mortes.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_RODOVIARIO, string);
				SendClientMessage(killerid, COLOR_RED, "VocÍ agora tem 1 Estrela de Procurado por 2 mortes.");
			    SetPlayerWantedLevel(killerid, 1);
				SetPlayerWantedLevel(playerid, 0);
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 1 WHERE nickname = '%s '", PlayerName(killerid));
					if(samp_mysql_query(string2) == 0){
				 		printf("Erro na linha 3247");
					}
				}
			}
		case 5:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 2 Estrelas de Procurado por 5 mortes e ainda n„o foi pego.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_RODOVIARIO, string);
				SendClientMessage(killerid, COLOR_RED, "Bom...vocÍ agora tem 2 Estrelas de Procurado por 5 mortes.");
				SetPlayerWantedLevel(killerid, 2);
				SetPlayerWantedLevel(playerid, 0);
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 2 WHERE nickname = '%s '", PlayerName(killerid));
					if(samp_mysql_query(string2) == 0){
				 		printf("Erro na linha 3247");
					}
				}
			}
		case 7:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 3 Estrelas de Procurado por 7 mortes. Est· fazendo os cops de MARIQUINHAS!",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "ExÌmio matador! VocÍ agora tem 3 Estrelas de Procurado por 7 mortes.");
				SetPlayerWantedLevel(killerid, 3);
				SetPlayerWantedLevel(playerid, 0);
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 3 WHERE nickname = '%s '", PlayerName(killerid));
					if(samp_mysql_query(string2) == 0){
				 		printf("Erro na linha 3247");
					}
				}
			}
		case 12:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 4 Estrelas de Procurado por 12 mortes. Nada?",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "J· comeÁou a botar medo nos cops. VocÍ agora tem 4 Estrelas de Procurado por 12 mortes.");
				SetPlayerWantedLevel(killerid, 4);
				SetPlayerWantedLevel(playerid, 0);
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 4 WHERE nickname = '%s '", PlayerName(killerid));
					if(samp_mysql_query(string2) == 0){
				 		printf("Erro na linha 3247");
					}
				}
			}
		case 18:
			{
				format(string, sizeof(string), "O Jogador %s agora tem 5 Estrelas de Procurado por 18 mortes. O Xerife j· est· irritado com sua imcompetÍncia.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "AtÈ os admins se rendem ao seu poder! VocÍ agora tem 5 Estrelas de Procurado por 18 mortes.");
				SetPlayerWantedLevel(killerid, 5);
				SetPlayerWantedLevel(playerid, 0);
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 5 WHERE nickname = '%s '", PlayerName(killerid));
					if(samp_mysql_query(string2) == 0){
				 		printf("Erro na linha 3247");
					}
				}
			}
		case 25:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 6 Estrelas de Procurado por 25 mortes. Fim de Carreira!",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "Daqui vocÍ n„o passa! VocÍ agora tem 6 Estrelas de Procurado por 25 mortes.");
				SetPlayerWantedLevel(killerid, 6);
				SetPlayerWantedLevel(playerid, 0);
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 6 WHERE nickname = '%s '", PlayerName(killerid));
					if(samp_mysql_query(string2) == 0){
				 		printf("Erro na linha 3247");
					}
				}
			}
	}
	return 1;
}
public OnVehicleSpawn(vehicleid)
{
	SetTimerEx("ApplyTuningForVehicle",10000,false,"d",vehicleid);
	printf("OnVehicleSpawn(%d)", vehicleid);
	return 1;
}

public OnVehiclePaintjob(vehicleid,paintjobid)
{
	if(mysql == 1){
		new string5[MAX_STRING];
    	format(string5, sizeof(string5), "UPDATE cars SET pintura = %d  WHERE id = %d", paintjobid, vehicleid);
        samp_mysql_select_db("infernusgroup01");
    	if(samp_mysql_query(string5) == 0){
		    printf("Erro na linha 3315");
		}
    }
	return 1;
}

public OnVehicleRespray(vehicleid,color1,color2)
{
	if(mysql == 1){
		new string5[MAX_STRING];
    	format(string5, sizeof(string5), "UPDATE cars SET cor1 = %d, cor2 = %d WHERE id = %d", color1, color2, vehicleid);
        samp_mysql_select_db("infernusgroup01");
    	if(samp_mysql_query(string5) == 0){
		    printf("Erro na linha 3328");
		}
    }
    return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
  	printf("OnVehicleDeath(%d, %d)", vehicleid, killerid);
	return 1;
}
public OnPlayerText(playerid,text[])
{
	fixchars(text);
	if(EmLigacao[playerid]==1){
		new tmp[256];
		format(tmp,256,"%s [SERVI«O DE TELEFONIA M”VEL]",text);
		fixchars(tmp);
		SendPlayerMessageToPlayer(CalledID[playerid],playerid,tmp);
		SendPlayerMessageToPlayer(playerid,playerid,tmp);
		return 0;
	}
	return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == Pickup_EntradaCPD){
	    SetPlayerInterior(playerid,3);
	    SetPlayerFacingAngle(playerid,90);
	    SetPlayerPos(playerid,387.9047,171.1747,1008.3828);
	    DestroyPickup(pickupid);
	    Pickup_EntradaCPD=CreatePickup(seta,2,-6.295575,1485.665283,12.723469);
	}
	if(pickupid == Pickup_SaidaCPD){
		SetPlayerInterior(playerid,0);
		SetPlayerFacingAngle(playerid,168.6);
		SetPlayerPos(playerid,-6.2390,1483.1963,12.7500);
	    DestroyPickup(pickupid);
	    Pickup_SaidaCPD = CreatePickup(seta,2,389.7861,171.6789,1008.3828);
	}
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
	new name[MAX_PLAYER_NAME];
	cmd = strtok(cmdtext, idx);
//A«’ES
	if(strcmp(cmd,"/imitate321",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256],plid,msg[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/imitate [id] [msg]");
		    return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/imitate [id] [msg]");
		    return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid,COLOR_RED,"ID inv·lido!");
		    return 1;
		} else {
		    if(plid < 10){
		        strmid(msg,cmdtext,11,256);
		        SendPlayerMessageToAll(plid,msg);
			}
			else if(plid > 10 && plid < 100){
				strmid(msg,cmdtext,12,256);
				SendPlayerMessageToAll(plid,msg);
			}
			else {
			    strmid(msg,cmdtext,13,256);
			    SendPlayerMessageToAll(plid,msg);
			}
		}
		return 1;
	}
	if(strcmp(cmd,"/mundovirtual",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256], vw;
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid,COLOR_RED,"/mundovirtual [id]");
	        return 1;
		}
		vw = strval(tmp);
		SetPlayerVirtualWorld(playerid,vw);
		SendClientMessage(playerid,COLOR_WHITE,"definido.");
		return 1;
	}
	if(strcmp(cmd,"/worldtime",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/worldtime [horas]");
			return 1;
		}
		if(strval(tmp) > 23 || strval(tmp) < 0){
		    SendClientMessage(playerid,COLOR_RED,"Valores de 0 ‡ 23");
		    return 1;
		} else {
		    worldTime = strval(tmp);
		    SetWorldTime(worldTime);
		    return 1;
		}
	}
	if(strcmp(cmd,"/debugkeys",true)==0){
	    if(DebugKeys[playerid] == 0)
		{
	        DebugKeys[playerid] = 1;
	        return 1;
		} else {
		    DebugKeys[playerid] = 0;
		    return 1;
		}
	}
	// HANDSUP
 	if(strcmp(cmd, "/render", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		  SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
          return 1;
    	}
	}

    // Drunk
	if(strcmp(cmd, "/bebado", true) == 0) {
    	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
        	ApplyAnimation(playerid,"PED", "WALK_DRUNK",4.0,0,1,0,0,0);
        	SendClientMessage(playerid, 0xFF0000FF, "VocÍ est· bÍbado?");
     		return 1;
 		}
    }
	// Place a Bomb
    if (strcmp("/plantarbomba", cmdtext, true) == 0) {
	      ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Cuidado. Um policial pode ver.");
		  return 1;
	}
	// Police Arrest
    if (strcmp("/gunarrest", cmdtext, true) == 0) {
	      ApplyAnimation( playerid,"ped", "ARRESTgun", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "You are arresting someone with your gun");
		  return 1;
    }
    // Lay Down
    if (strcmp("/lay", cmdtext, true) == 0) {
          ApplyAnimation(playerid,"BEACH", "bather", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "You are laying down");
		  return 1;
    }
	// Take Cover
    if (strcmp("/cover", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "ped", "cower", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "You are taking cover");
		  return 1;
	}
	// Punheta
	if (strcmp("/punheta", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "PAULNMAC", "wank_in", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Huhu!");
		  return 1;
	}
	// Kiss
    if (strcmp("/beijar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Que coisa hein! hehe");
		  return 1;
	}
	// Crack Dieing
    if (strcmp("/crack", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Est· duendo ? Manera...");
		  return 1;
	}
	// Mijar
    if (strcmp("/mijar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "PAULNMAC", "Piss_in", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Mijando em praÁa p˙blica ? Olha os cops!!");
		  return 1;
	}
	// Sit
    if (strcmp("/sentar", cmdtext, true) == 0) {
          ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 1, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Sentado.");
		  return 1;
    }
	// Fuck U
    if (strcmp("/fu", cmdtext, true) == 0) {
	      ApplyAnimation( playerid,"ped", "fucku", 4.1, 0, 1, 1, 1, 1 );
          SendClientMessage(playerid, 0xFF0000FF, "Fode esse cara mesmo! V· para a *QP");
		  return 1;
    }
	// Dodge
	if(strcmp("/esconder-se",cmdtext,true)==0 && Escondido[playerid]==0)
	{
	    ClearAnimations(playerid);
	    ApplyAnimation(playerid,"DODGE","Cover_Dive_01"	,4.1,0,1,1,1,1);
		for(new i; i<MAX_PLAYERS; i++){
		    ShowPlayerNameTagForPlayer(playerid,i,0);
		}
		Escondido[playerid] = 1;
		SendClientMessage(playerid,COLOR_GREEN,"Hum, ninguÈm est· te vendo agora!");
		return 1;
	}
	if(strcmp("/aparecer",cmdtext,true)==0 && Escondido[playerid]==1)
	{
	    ClearAnimations(playerid);
		for(new i; i<MAX_PLAYERS; i++){
		    ShowPlayerNameTagForPlayer(playerid,i,1);
		}
		Escondido[playerid] = 1;
		SendClientMessage(playerid,COLOR_GREEN,"Hum, est„o te vendo agora!");
		return 1;
	}
 	if(strcmp(cmdtext, "/conversar", true) == 0){
    	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
        	ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,1,1,1,1,1);
        	SendClientMessage(playerid, 0xFFC000AA, "VocÍ Est· conversando.. cuidado para n„o ficar falando sozinho");
        	return 1;
     	}
	}

	// Mulher Fumando
    if (strcmp("/fumar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "SMOKING", "F_smklean_loop", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Fuma fuma fuma, folha de bananeira");
		  return 1;
	}
	// Homem Fumando
    if (strcmp("/fumar2", cmdtext, true, 4) == 0) {
          ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Fuma na boa, sÛ de brincadeira!");
		  return 1;
	}
	if (strcmp("/dodge", cmdtext, true, 6) == 0)
    {
    switch (cmdtext[7])
    {
        case '1':{ ApplyAnimation( playerid,"DODGE", "Cover_Dive_01", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Dive
        case '2':{ ApplyAnimation( playerid,"DODGE", "Cover_Dive_02", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Dive
        case '3':{ ApplyAnimation( playerid,"DODGE", "Crushed", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Block then dive
        case '4':{ ApplyAnimation( playerid,"DODGE", "Crush_Jump", 4.1, 0, 1, 1, 1, 1 ); return 1; } // Block then dive
    }
    return 1;
}

    // Idle Chat
    if(strcmp(cmd, "/chat", true) == 0){
    	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
        	ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,1,1,1,1,1);
        	SendClientMessage(playerid, 0xFF0000FF, "You are now talking");
        	return 1;
     	}
	}
//FUN«’ES DE OBJETOS

	if(strcmp(cmd,"/sair-rc",true)==0){
	    if(IsPlayerInAnyVehicle(playerid)){
			new model = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(model == 501 || model == 464){
			    DestroyVehicle(GetPlayerVehicleID(playerid));
			    SendClientMessage(playerid,COLOR_RED,"VeÌculo destruÌdo");
			    return 1;
			}
			else{
			    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo RC!");
			    return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo RC!");
		    return 1;
		}
	}
	if(!strcmp(cmd,"/alarme",true)){
	    if(IsPlayerInAnyVehicle(playerid)){
	        if(!strcmp(Dono[GetPlayerVehicleID(playerid)],PlayerName(playerid),true)){
	            Alarme[GetPlayerVehicleID(playerid)]==1;
				SendClientMessage(playerid,COLOR_AZULPLUS,"Alarme ligado");
				SendClientMessage(playerid,COLOR_AZULPLUS,"Para desativar digite: /desativaralarme");
				return 1;
			}
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o È o dono desse carro!");
			return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
		return 1;
	}
	if(!strcmp(cmd,"/desativaralarme",true)){
	    if(IsPlayerInAnyVehicle(playerid)){
	        if(!strcmp(Dono[GetPlayerVehicleID(playerid)],PlayerName(playerid),true)){
	            Alarme[GetPlayerVehicleID(playerid)]==0;
				SendClientMessage(playerid,COLOR_AZULPLUS,"Alarme desligado");
				SendClientMessage(playerid,COLOR_AZULPLUS,"Para ativar digite: /alarme");
				return 1;
			}
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o È o dono desse carro!");
			return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
		return 1;
	}
	if(strcmp(cmd,"/acaoespecial",true)==0){
	    new tmp[256];
	    new actid;
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)){
			SendClientMessage(playerid,COLOR_RED,"/acaoespecial [actionid]");
			return 1;
		}
		actid = strval(tmp);
		SetPlayerSpecialAction(playerid,actid);
		SendClientMessage(playerid,COLOR_GREEN,"Feito.");
		return 1;
	}
	if(strcmp(cmd,"/setobjrotz",true)==0){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new objid;
	        new rot;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/setobjrotz [objid] [rot]");
	            return 1;
			}
			objid = strlen(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/setobjrotz [objid] [rot]");
			    return 1;
			}
			rot = strlen(tmp);
			if(!IsValidObject(objid)){
			    SendClientMessage(playerid,COLOR_RED,"Objeto n„o v·lido, especifique outro.");
			    return 1;
			} else {
			    if(rot < 0 || rot > 360){
			        SendClientMessage(playerid,COLOR_RED,"Valores de RotaÁ„o Z: 0-360");
			        return 1;
				} else {
					new Float:rX,
						Float:rY,
						Float:rZ;
					GetObjectRot(objid,rX,rY,rZ);
					SetObjectRot(objid,rX,rY,rot);
					SendClientMessage(playerid,COLOR_GREEN,"Feito.");
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Ei, no que vocÍ est· mechendo?");
		    return 1;
		}
	}
	if(strcmp(cmd,"/getobjrot",true)==0){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new objid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
				SendClientMessage(playerid,COLOR_RED,"/getobjrot [objid]");
				return 1;
			}
			objid = strlen(tmp);
			if(!IsValidObject(objid)){
			    SendClientMessage(playerid,COLOR_RED,"Objeto n„o v·lido, especifique outro.");
			    return 1;
			} else {
			    new Float:rX,
			        Float:rY,
			        Float:rZ;
				GetObjectRot(objid,rX,rY,rZ);
				format(tmp,sizeof(tmp),"RotaÁ„o X: %d / Y: %d / Z: %d",floatround(rX),floatround(rY),floatround(rZ));
				SendClientMessage(playerid,COLOR_GREEN,tmp);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Ei, no que vocÍ est· mechendo?");
		    return 1;
		}
	}

	if(strcmp(cmd, "/soltarpreso", true) == 0) {
	 	    new tmp[256];
			new plid;
			new string[256];
			tmp = strtok(cmdtext, idx);
     		if(Chave[playerid] == 0){
	        	SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem a chave da cadeia!");
	        	return 1;
	        }
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/soltar [id]");
				return 1;
			}
	        plid = strval(tmp);
	     	if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(Presos[plid] == 0){
				    SendClientMessage(playerid,COLOR_RED,"O jogador n„o est· preso!");
					return 1;
				} else {
					new skin;
					if(mysql == 1){
    					new resultline[1024];
    					new field[128];
    					new string2[255];
    					format(string2, sizeof(string2),"SELECT skin FROM players WHERE nickname = '%s '", PlayerName(plid));
        				samp_mysql_select_db("infernusgroup01");
						if(samp_mysql_query(string2) == 0){
						    printf("Erro na Linha 3853");
						}
						samp_mysql_store_result();
						while(samp_mysql_fetch_row(resultline)==1)
						{
							samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
							skin = strval(field);
						}
					}
				    SetSpawnInfo(plid,0,skin,-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				    SpawnPlayer(plid);
				    format(string, sizeof(string), "O % conseguiu a chave da cadeia, e fez vocÍ fugir!",PlayerName(playerid));
   			        SendClientMessage(plid, COLOR_RED2, string);
				    SendClientMessage(playerid,COLOR_GREEN,"Fuga consedida!");
					if(mysql == 1){
						new string2[255];
						format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 0, prisao = 0 WHERE nickname = '%s '", PlayerName(plid));
						samp_mysql_select_db("infernusgroup01");
						if(samp_mysql_query(string2) == 0){
	    					printf("Erro na linha 3871");
						}
					}
				    Presos[plid] = 0;
				    Contrabando[playerid] = 0;
					Receita[playerid] = 0;
					SetPlayerWantedLevel(plid, 0);
					Chave[playerid] = 0;
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		}

//FUN«’ES DE COP FLORESTAL

	if(strcmp(cmd, "/piracemaon",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COLOR_RED,"A piracema j· est· ativada!");
				return 1;
	        } else {
	            SendClientMessageToAll(COLOR_RED,"A piracema est· ativada, quem for pego pescando ser· preso.");
	            SendClientMessage(playerid,COLOR_WHITE,"Feito.");
	            Piracema = 1;
	        	return 1;
	        }
	    } else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
	    }
	}

	if(strcmp(cmd,"/piracemaoff",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COLOR_RED,"A piracema n„o est· ativada!");
				return 1;
			} else {
			    SendClientMessageToAll(COLOR_GREEN,"A piracema agora est· desativada. Pode pescar ‡ vontade!");
			    SendClientMessage(playerid,COLOR_WHITE,"Feito.");
			    Piracema = 0;
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
	if(strcmp(cmd,"/prenderpesca",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
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
			        SendClientMessage(playerid,COLOR_RED,"A piracema n„o est· ativada para vocÍ efetuar a pris„o!");
					return 1;
				} else {
				    if(PescaInProgress[plid] == 0){
				        SendClientMessage(playerid,COLOR_RED,"O jogador n„o est· pescando!");
						return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) > 21){
					        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar a pris„o!");
							return 1;
						} else {
							if(mysql == 1){
								new string[255];
								format(string, sizeof(string), "UPDATE players SET prisao = 1 WHERE nickname = '%s '", PlayerName(plid));
                                samp_mysql_select_db("infernusgroup01");
								if(samp_mysql_query(string) == 0){
								 	printf("Erro na linha 3247");
								}
							}
						    LogarPlayer(plid);
						    AcrescentarExPoints(playerid,1);
							return 1;
						}
					}
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso");
			return 1;
		}
	}
	if(strcmp(cmd,"/verpesca",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
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
   			        SendClientMessage(playerid,COLOR_GREEN,"O jogador n„o est· pescando");
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_GREEN,"O jogador est· pescando");
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
	if(strcmp(cmd,"/cacaon",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COLOR_RED,"A temporada de caÁa j· est· ativada!");
				return 1;
			} else {
			    SendClientMessageToAll(COLOR_GREEN,"A temporada de caÁa agora est· ativada. Pode caÁar ‡ vontade!");
			    SendClientMessage(playerid,COLOR_WHITE,"Feito.");
			    TemporadaCaca = 1;
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
	if(strcmp(cmd,"/cacaoff",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COLOR_RED,"A temporada de caÁa j· est· desativada!");
	        	return 1;
	        } else {
	            SendClientMessageToAll(COLOR_RED,"A temporada de caÁa est· desativada, quem for pego caÁando ser· preso.");
	            SendClientMessage(playerid,COLOR_WHITE,"Feito.");
	            TemporadaCaca = 0;
	        	return 1;
	        }

	    } else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
	    }
	}
	if(strcmp(cmd,"/vercaca",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
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
   			        SendClientMessage(playerid,COLOR_GREEN,"O jogador n„o est· caÁando.");
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_GREEN,"O jogador est· caÁando.");
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
	if(strcmp(cmd,"/prendercaca",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
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
			        SendClientMessage(playerid,COLOR_RED,"A temporada de caÁa est· ativada, por isso vocÍ n„o pode prendÍ-lo!");
					return 1;
				} else {
				    if(CacaInProgress[plid] == 0){
				        SendClientMessage(playerid,COLOR_RED,"O jogador n„o est· caÁando!");
						return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) > 21){
					        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar a pris„o!");
							return 1;
						} else {
							if(mysql == 1){
								new string[255];
								format(string, sizeof(string), "UPDATE players SET prisao = 1 WHERE nickname = '%s '", PlayerName(plid));
								if(samp_mysql_query(string) == 0){
			 						printf("Erro na linha 3247");
								}
							}
						    LogarPlayer(plid);
						    AcrescentarExPoints(playerid,1);
							return 1;
						}
					}
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso");
			return 1;
		}
	}

//PESCADOR

	if(strcmp(cmd, "/venderpesca", true) == 0) {
	    new msg[256];
	    new quantia;
	    if(AreaCoopPesca[playerid] == 1){
	    	if(QtPescas[playerid] == 0){
	        	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem nenhuma pesca, como poder· vender?");
	        	format(msg,sizeof(msg),"%s usou o comando /venderpesca sem nenhuma pesca acumulada.",udb_decode(PlayerName(playerid)));
	        	writelog(msg);
	        	return 1;
			} else {
		    	if(Profissao[playerid] == PESCADOR) {
		   			quantia = QtPescas[playerid]*130;
		   			GivePlayerMoney(playerid,quantia);
					format(msg,sizeof(msg),"VocÍ vendeu %d pesca(s) por $130 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COLOR_GREEN, msg);
					format(msg,sizeof(msg),"%s vendeu %d pesca(s) na profiss„o de pescador e ganhou $%d.",udb_decode(PlayerName(playerid)),QtPescas[playerid],quantia);
					writelog(msg);
					QtPescas[playerid] = 0;
					AcrescentarExPoints(playerid,1);
					return 1;
				}
				else {
				    quantia = QtPescas[playerid]*100;
				    GivePlayerMoney(playerid,quantia);
				    format(msg,sizeof(msg),"VocÍ vendeu %d pesca(s) por $100 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COLOR_GREEN, msg);
					format(msg,sizeof(msg),"%s vendeu %d pesca(s) sem ser pescador e ganhou $%d.",udb_decode(PlayerName(playerid)),QtPescas[playerid],quantia);
					writelog(msg);
					QtPescas[playerid] = 0;
					return 1;
				}
			}
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na Cooperativa de Pesca.");
			return 1;
		}
	}
	if(strcmp(cmd,"/vendercaca",true) == 0) {
	    if(Profissao[playerid] == CACADOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopCaca[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na Cooperativa de CaÁa.");
				return 1;
			} else {
			    if(QtCacas[playerid] == 0){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem caÁas acumuladas.");
					return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtCacas[playerid]*100;
					format(msg, sizeof(msg),"VocÍ vendeu %d caÁa(s) por $100 cada e faturou $%d com a venda.",QtCacas[playerid],quantia);
					SendClientMessage(playerid,COLOR_CACADOR,msg);
					GivePlayerMoney(playerid,quantia);
					format(msg,sizeof(msg),"%s vendeu %d caÁa(s) e ganhou $%d.",udb_decode(PlayerName(playerid)),QtCacas[playerid],quantia);
					writelog(msg);
					QtCacas[playerid] = 0;
					AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
			format(ftlog,sizeof(ftlog),"%s tentou usar o comando /vendercaca sem estar na profissao adequada.");
			writelog(ftlog);
			return 1;
		}
	}

//FUN’ES DE CAMIONEIRO

	if(strcmp(cmd,"/descarregar",true) == 0){
	    new msg[256];
	    if(Profissao[playerid] == CAMINHONEIRO || IsPlayerAdmin(playerid)){
	        if(AreaDescarga[playerid] == 1){
	            if(Carregamento[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"Seu veÌculo n„o est· carregado!");
					return 1;
				} else {
				    Carregamento[playerid] = 0;
				    SendClientMessage(playerid,COLOR_GREEN,"Seu veÌculo foi descarregado.");
				    SendClientMessage(playerid,COLOR_GREEN,"VocÍ ganhou $250 dolares pela carga.");
				    GivePlayerMoney(playerid,250);
				    AcrescentarExPoints(playerid,1);
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· na ·rea de carga");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
	        format(msg,sizeof(msg),"%d usou o comando /descarregar sem ser caminhoneiro.",udb_decode(PlayerName(playerid)));
	        writelog(msg);
			return 1;
		}
	}
	if(strcmp(cmd, "/carregar", true) == 0) {
	    if(Profissao[playerid] == CAMINHONEIRO || IsPlayerAdmin(playerid)){
	        if(AreaCarga[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == VEH_RDTRAIN){
				    if(Carregamento[playerid] == 0){
				    	SendClientMessage(playerid,COLOR_CAMINHONEIRO,"VeÌculo carregado!");
				    	SendClientMessage(playerid,COLOR_CAMINHONEIRO,"Para descarreg·-lo, v· a ·rea de descarga, RS Haul (perto de um posto)");
				    	Carregamento[playerid] = 1;
						return 1;
					} else {
				        SendClientMessage(playerid,COLOR_CAMINHONEIRO,"Seu caminh„o j· est· carregado!");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um caminh„o ROADTRAIN!");
					return 1;
				}
	        } else {
	            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na ·rea de carga!");
				return 1;
			}
	    }
	    else{
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
	    	return 1;
	    }
	}
//PEDREIRA
	if(strcmp(cmd, "/carregarcaminhao", true) == 0) {
	    if(Profissao[playerid] == PEDREIRA || IsPlayerAdmin(playerid)){
	        if(PedreiraCarga[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == VEH_DUMPER){
				    if(Pedras[playerid] == 0){
				    	SendClientMessage(playerid,COLOR_PEDREIRA,"VeÌculo carregado!");
				    	SendClientMessage(playerid,COLOR_PEDREIRA,"Para descarreg·-lo, v· atÈ a obra de SF!");
				    	Pedras[playerid] = 1;
						return 1;
					} else {
				        SendClientMessage(playerid,COLOR_PEDREIRA,"Seu caminh„o j· est· carregado!");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um caminh„o DUMPER!");
					return 1;
				}
	        } else {
	            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na ·rea de carregamento de carga!");
				return 1;
			}
	    }
	    else{
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
	    	return 1;
	    }
	}

	if(strcmp(cmd,"/descarregarcaminhao",true) == 0){
	    new msg[256];
	    if(Profissao[playerid] == PEDREIRA || IsPlayerAdmin(playerid)){
	        if(Construcao[playerid] == 1){
	            if(Pedras[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"Seu caminh„o n„o est· carregado!");
					return 1;
				} else {
				    Pedras[playerid] = 0;
				    SendClientMessage(playerid,COLOR_PEDREIRA,"Seu caminh„o foi descarregado.");
				    SendClientMessage(playerid,COLOR_PEDREIRA,"VocÍ ganhou $300 dolares pelo frete");
				    GivePlayerMoney(playerid,300);
				    AcrescentarExPoints(playerid,1);
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· na ·rea de carga");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
	        format(msg,sizeof(msg),"%d usou o comando /descarregarcaminhao sem ser caminhoneiro.",udb_decode(PlayerName(playerid)));
	        writelog(msg);
			return 1;
		}
	}
//FUN«’ES TRAFICANTE

	if(strcmp(cmd, "/heroina", true) == 0) {
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
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Doses de 1 ‡ 7");
				return 1;
			} else {
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COLOR_RED, "O jogador que vocÍ indicou n„o est· conectado.");
			    	return 1;
			    } else {
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COLOR_RED, "Chege mais perto para aplicar a injeÁ„o.");
						return 1;
					} else {
			        	if(Heroina[plid] == 7){
			        	  	SendClientMessage(playerid,COLOR_RED, "VocÍ quer matar seu cliente!");
							return 1;
						} else {
					    	Heroina[plid] = mili;
					    	SendClientMessage(playerid,COLOR_TRAFICANTE, "Vendeu o bagulho!");
		    	            AddPlayerHealth(plid,100);
					    	format(msg,sizeof(msg),"VocÍ est· agora com %d ml de de heroÌna no sangue.",mili);
					    	SendClientMessage(plid,COLOR_WHITE,msg);
					    	AcrescentarExPoints(playerid,1);
							return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
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
	            SendClientMessage(playerid, COLOR_RED,"/maconha [id] [quantidade]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/maconha [id] [quantidade]");
				return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· louco? Quer matar o seu cliente? Doses de 1 a 10");
				return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Doses de 1 ‡ 7");
				return 1;
			} else {
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COLOR_RED, "O jogador que vocÍ indicou n„o est· conectado.");
			    	return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COLOR_RED, "Chege mais perto para vender o bagulho.");
						return 1;
					} else {
			        	if(Maconha[plid] == 10){
			        	  	SendClientMessage(playerid,COLOR_RED, "VocÍ quer matar seu cliente!");
							return 1;
						} else {
					    	Maconha[plid] = mili;
					    	SendClientMessage(playerid,COLOR_TRAFICANTE, "Miss„o cumprida!");
				            AddPlayerHealth(plid,100);
					    	format(msg,sizeof(msg),"Est· concentrada em seu pulm„o %d doses de maconha.",mili);
					    	SendClientMessage(plid,COLOR_WHITE,msg);
					    	AcrescentarExPoints(playerid,1);
							return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
		return 1;
		}
	}
	if(strcmp(cmd, "/cocaina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
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
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Doses de 1 ‡ 7");
				return 1;
			} else {
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COLOR_RED, "O jogador que vocÍ indicou n„o est· conectado.");
			    	return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COLOR_RED, "Chege mais perto para vender o bagulho.");
						return 1;
					} else {
			        	if(Cocaina[plid] == 7){
			        	  	SendClientMessage(playerid,COLOR_RED, "VocÍ quer matar seu cliente!");
							return 1;
						} else {
					    	Cocaina[plid] = mili;
					    	SendClientMessage(playerid,COLOR_TRAFICANTE, "Vendeu o bagulho!");
		    	            AddPlayerHealth(plid,100);
					    	format(msg,sizeof(msg),"Seu pulm„o est· carregado com %d doses de cocaÌna.",mili);
					    	SendClientMessage(plid,COLOR_WHITE,msg);
					    	AcrescentarExPoints(playerid,1);
							return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
		}
		return 1;
		}

	if(strcmp(cmd, "/setcomb", true) == 0) {
		if(Profissao[playerid] == FRENTISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
			new msg[256];
			new petroleo;
			new plid, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/setgas [id] [quantidade]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setgas [id] [quantidade]");
				return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COLOR_RED, "Quantidade inv·lida. Os valores devem ser de 1 ‡ 100.");
				return 1;
			}
			if(IsPlayerConnected(plid) && IsPlayerInAnyVehicle(playerid) == 0){
				if((Petrol[plid] + comb) < 100){
			    	petroleo = Petrol[plid] + comb;
					if(mysql == 1){
						new string2[255];
						format(string2, sizeof(string2), "UPDATE players SET gasoline = '%d ' WHERE nickname = '%s '",petroleo, PlayerName(plid));
                        samp_mysql_select_db("infernusgroup01");
						if(samp_mysql_query(string2) == 0){
						}
					}
					Petrol[plid] = petroleo;
					format(msg,sizeof(msg),"Seu tanque foi abastecido com %d Litros de combustÌvel, totalizando %d litros",comb,petroleo);
					SendClientMessage(plid,COLOR_GREEN,msg);
					SendClientMessage(playerid,COLOR_GREEN,"CombustÌvel fornecido.");
					format(msg,sizeof(msg),"O %s (ID %d) colocou %d Litros de combustÌvel no tanque de %s (ID %d),totalizando %d litros",udb_decode(PlayerName(playerid)),playerid,comb,udb_decode(PlayerName(plid)),plid,petroleo);
					writelog(msg);
					printf("O %s (ID %d) colocou %d Litros de combustÌvel no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
					return 1;
				}
				else if((Petrol[plid] + comb) >= 100){
					if(mysql == 1){
						new string2[255];
						format(string2, sizeof(string2), "UPDATE players SET gasoline = '100 ' WHERE nickname = '%s '", PlayerName(plid));
						if(samp_mysql_query(string2) == 0){
			 				printf("Erro na linha 4500");
						}
					}
					petroleo = 100 - Petrol[plid];
					Petrol[plid] = 100;
					format(msg,sizeof(msg),"Seu tanque foi completado, colocando %d Litros",petroleo);
					SendClientMessage(plid,COLOR_GREEN,msg);
					SendClientMessage(playerid,COLOR_GREEN,"Combustivel fornecido.");
					printf("O %s (ID %d) completou o tanque de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
					return 1;
				}
			}
			if(IsPlayerConnected(plid) && IsPlayerInAnyVehicle(playerid) == 1){
			    new vehicleid;
				vehicleid = GetPlayerVehicleID(playerid);
				if((GPV[vehicleid] + comb) < 100){
			    	petroleo = GPV[vehicleid] + comb;
					if(mysql == 1){
						new string2[255];
						format(string2, sizeof(string2), "UPDATE cars SET gasolina = '%d ' WHERE id = d",petroleo, vehicleid);
						if(samp_mysql_query(string2) == 0){
			 				printf("Erro na linha 4522");
						}
					}
					GPV[vehicleid] = petroleo;
					format(msg,sizeof(msg),"Seu tanque foi abastecido com %d Litros de combustÌvel, totalizando %d litros",comb,petroleo);
					SendClientMessage(plid,COLOR_GREEN,msg);
					SendClientMessage(playerid,COLOR_GREEN,"CombustÌvel fornecido.");
					format(msg,sizeof(msg),"O %s (ID %d) colocou %d litros de combustÌvel no tanque de %s (ID %d),totalizando %d litros",udb_decode(PlayerName(playerid)),playerid,comb,udb_decode(PlayerName(plid)),plid,petroleo);
					writelog(msg);
					printf("O %s (ID %d) colocou %d litros de combustÌvel no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
					return 1;
				}
				else if((GPV[vehicleid] + comb) >= 100){
					if(mysql == 1){
						new string2[255];
						format(string2, sizeof(string2), "UPDATE cars SET gasolina = '100 ' WHERE id = %d", vehicleid);
						if(samp_mysql_query(string2) == 0){
			 				printf("Erro na linha 4540");
						}
					}
					petroleo = 100 - GPV[vehicleid];
					GPV[vehicleid] = 100;
					format(msg,sizeof(msg),"Seu tanque foi completado, colocando %d Litros",petroleo);
					SendClientMessage(plid,COLOR_GREEN,msg);
					SendClientMessage(playerid,COLOR_GREEN,"Combustivel fornecido.");
					printf("O %s (ID %d) completou o tanque de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
					return 1;
				}
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
			}
			return 1;
		}
		else{
		    new msg[256];
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o!");
		    printf("O jogador %s (ID %d) tentou modificar o combustÌvel de alguÈm, mas n„o possui permiss„o",PlayerName(playerid),playerid);
		    format(msg,sizeof(msg),"%s (ID %d) quis dar uma de admin (/setcomb), mas se deu mal!",udb_decode(PlayerName(playerid)),playerid);
		}
		return 1;
	}
	
	if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	   	// The command shouldn't work if an account with this
    	// nick already exists
    	new a=0;
    	if(mysql == 1){
    		new string[256];
    		format(string, sizeof(string),"SELECT * FROM players WHERE nickname = '%s '", PlayerName(playerid));
        	samp_mysql_select_db("infernusgroup01");
    		if (samp_mysql_query(string) == 0) {
			}
			samp_mysql_store_result();
            new resultline[1024];
			if(samp_mysql_fetch_row(resultline) == 1){
				SendClientMessage(playerid, COLOR_RED, "T· querendo se registrar duas vezes???");
				a=1;
				return 1;
			}
			// The command shouldn't work if we already are authed
		}
    	if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "T· querendo registrar-se logado???");
			return 1;
		}
			
    	// Did he forgot the password?
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Ei, vocÍ esqueceu de mencionar uma senha. Use /registrar [senha]");
			return 1;
		}

    	// We save the money to the accstate
    	if(a==0){
    	    PLAYERLIST_authed[playerid] = 1;
			if(mysql == 1){
				new string2[256], string3[256];
				format(string2, sizeof(string2), "INSERT INTO players values('%s ',NULL,0,0,0,3,0,26,5000,15,0,0,0,0,1,0,-152.1129,1191.0045,19.7422,318.7636,0,0,0,0)", PlayerName(playerid));
		    	format(string3, sizeof(string3), "UPDATE players SET pwdhash = '%s ' WHERE nickname = '%s '", tmp, PlayerName(playerid));
	    		if(samp_mysql_query(string2) == 1 && samp_mysql_query(string3) == 1){
					Petrol[playerid] = 15;
					Profissao[playerid] = 1;
					TextDrawHideForPlayer(playerid,Bemvindo);
					TextDrawHideForPlayer(playerid,Bemvindo2);
					TextDrawHideForPlayer(playerid,Bemvindo3);
					SetSpawnInfo(playerid, 1, 26, -152.1129, 1191.0045, 19.7422, 318.7636, 0, 0, 0, 0, 0, 0);
					SpawnPlayer(playerid);
					SendClientMessage(playerid, COLOR_JUIZ, "Registrado e logado.");
					SendClientMessage(playerid, COLOR_GREEN, "VocÍ tÍm $5000 no banco, e acabou de chegar em ");
         			SendClientMessage(playerid, COLOR_GREEN, "Fort Carson, procure um Hotel para se hospedar.");
        			SendClientMessage(playerid, COLOR_GREEN, "Mas antes vai ao banco retirar o dinheiro.");
					SendClientMessage(playerid, COLOR_ROSA, "digite /regras1 e /regras2");
	        		GameTextForPlayer(playerid,"~g~ Fort Carson City", 5000,0);
					return 1;
				}
			}
		}
 	}

	if(strcmp(cmd, "/logar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);

		// The command shouldn't work if we already are authed
	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· logado n„o precisa logar novamente.");
			return 1;
		}

	    // Did he forgot the password?
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "VocÍ tem senha. /logar [senha]");
			return 1;
		}
		new a[MAX_PLAYERS] = 0;
		if(mysql == 1){
		    new string[256];
		    new resultline[1024];
 			format(string, sizeof(string),"SELECT pwdhash FROM players WHERE nickname = '%s ' and pwdhash = '%s '", PlayerName(playerid), tmp);
			samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string) == 0)
			{
			    print("Erro na linha 4623");
			}
			samp_mysql_store_result();
			if(samp_mysql_fetch_row(resultline)==1){
			    LogarPlayer(playerid);
				PLAYERLIST_authed[playerid] = 1;
				TextDrawHideForPlayer(playerid,Bemvindo);
				TextDrawHideForPlayer(playerid,Bemvindo2);
				TextDrawHideForPlayer(playerid,Bemvindo3);
				new msg[256];
				format(msg,sizeof(msg),"O jogador %s acabou de se logar.",PlayerName(playerid));
				writelog(msg);
				printf("O jogador %s (ID %d) acabou de se logar",PlayerName(playerid),playerid);
				a[playerid] = 1;
				return 1;
			}
			
			if(samp_mysql_fetch_row(resultline)==0 && a[playerid] == 0){
				SendClientMessage(playerid, COLOR_RED, "Senha incorreta ou vocÍ n„o est· registrado!");
				return 1;
			}
		}
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
				SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/ID inv·lido");
				return 1;
			}
			if(IsPlayerConnected(plid) == 1) {
				LogarPlayer(plid);
				SendClientMessage(playerid,COLOR_GREEN,"Feito.");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È admin, portanto, n„o tem permiss„o para fazer isso.");				return 1;
		}
	}


    if(strcmp(cmd, "/ajuda", true) == 0) {
    	SendClientMessage(playerid, COLOR_WHITE, "/comandos /comandos2 /comandos3 /comandos4 : Comandos desse gamemode");
        SendClientMessage(playerid, COLOR_WHITE, "/registrar [senha] : Registrar-se");
        SendClientMessage(playerid, COLOR_WHITE, "/logar [senha] : Logar-se");
        SendClientMessage(playerid, COLOR_WHITE, "/aprender : Mostra uma breve explicaÁ„o sobre o RPG.");
        SendClientMessage(playerid, COLOR_WHITE, "ATEN«√O: profissıes s„o por experiÍncia, ter· que ir no -sine- para mais info /level.");
        SendClientMessage(playerid, COLOR_WHITE, "/profs /profs2 /profs3 /profs4 /profs5 vÍ as profissıes deste RPG Mode");
        SendClientMessage(playerid, COLOR_WHITE, "Ajuda com o celular ? digite /celularinfo para mais informaÁıes.");
		SendClientMessage(playerid, COLOR_WHITE, "/creditos : VÍ os creditos do RPG Mode");
		return 1;
	}
    if(strcmp(cmd, "/celularinfo", true) == 0) {
       	SendClientMessage(playerid, COLOR_GRAY,   "O comando /PM [id] foi desabilitado dando origem a um novo recurso,");
        SendClientMessage(playerid, COLOR_YELLOW, "o celular, nele vocÍ faz ligaÁıes e recebe-las para qualquer player com o custo de $1 o crÈdito");
        SendClientMessage(playerid, COLOR_YELLOW, "primeiramente ter· que comprar 1 celular com o comando /celular no valor de $500.");
        SendClientMessage(playerid, COLOR_GREEN,  "ATEN«√O: apenas os players que tiverem celular poderam receber mensagens e envia-las");
        SendClientMessage(playerid, COLOR_GREEN,  "ATEN«√O: para vocÍ ver o n˙mero de outro player ter· que comprar uma lista telefÙnica com o comando:");
        SendClientMessage(playerid, COLOR_YELLOW, "/lista no valor de $500, para saber o n˙mero de um outro player digite /numero [nick] assim vocÍ ");
        SendClientMessage(playerid, COLOR_YELLOW, "poder· enviar mensagens pelo comando /sms [n˙merodoplayer] [texto].");
        SendClientMessage(playerid, COLOR_WHITE,  "Coloque /celularinfo2 para mais info!");
        return 1;
	}
    if(strcmp(cmd, "/celularinfo2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ,   "ATEN«√O: Para enviar mensagens vocÍ precisa de crÈditos v· em uma loja 24/7 e compre");
        SendClientMessage(playerid, COLOR_JUIZ,   "crÈditos pelo comando /recarga [creditos], para ver o saldo digite /saldocell, ESSE comando n„o precisa estar na 24/7");
        SendClientMessage(playerid, COLOR_JUIZ,   "Para ligar digite: /chamar [n˙mero/do/jogador], È um chat restrito!");
        SendClientMessage(playerid, COLOR_JUIZ,   "VocÍ tambÈm pode ligar a COBRAR /chamar9090 [n˙mero/do/jogador]!");
        SendClientMessage(playerid, COLOR_JUIZ,   "para desligar digite /desligar");
  		SendClientMessage(playerid, COLOR_YELLOW, "Para qualquer d˙vida contate um ADMIN e pergunte-o sobre o sistema");
  		return 1;
    }
    if(strcmp(cmd, "/level", true) == 0) {
    	SendClientMessage(playerid, COLOR_WHITE, "O Sistema de Level, tem como proveito deixar o servidor sem admins e autÙnomo junto com o /votarkick.");
        SendClientMessage(playerid, COLOR_WHITE, "Ao nascer, ficar· marcado um CheckPoint no seu radar, indicando a posiÁ„o para onde deve ir atr·s de emprego.");
        SendClientMessage(playerid, COLOR_WHITE, "Chegando l·, vocÍ encontrar· profissıes por sala. Logo ao entrar vocÍ se depar· com um CP de profs atÈ nivel 10. ");
        SendClientMessage(playerid, COLOR_WHITE, "Caso esteja disposto a ver outras profs. Existe 1 sala a direita da entrada, com profissıes de nivel 20 atÈ 40.");
        SendClientMessage(playerid, COLOR_WHITE, "Caso esteja disposto a ver as outras profissıes, a esqueda da entrada existe uma escadaria.");
		SendClientMessage(playerid, COLOR_WHITE, "Aonde vocÍ encontrar· as profissıes de niveis superiores.");
		return 1;
	}
    if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_COP_SWAT, "MPAÆ RevolutioN RPG Release Candidate 2");
	    SendClientMessage(playerid, COLOR_YELLOW, " ");
	    SendClientMessage(playerid, COLOR_RED2, "Mode especialmente desenvolvido para servidores MPAÆ");
	    SendClientMessage(playerid, COLOR_RED2, "Scripting: MPA Clan - Grupo Infernus de ProgramaÁ„o");
	 	SendClientMessage(playerid, COLOR_JUIZ,   "Integrantes: [MPA]matraka, [MPA]DaniPiresk, [MPA]Texugo, [MPA]Allan, [MPA]Smurf e [MPA]VanCy");
 	 	SendClientMessage(playerid, COLOR_YELLOW, "Colaborador: [MPA]kaxoro.");
		SendClientMessage(playerid, COLOR_WHITE, "Agradecimentos especiais: /agradecimentos");
		return 1;
	}
	if(!strcmp(cmd,"/agradecimentos",true)) {
	    SendClientMessage(playerid, COLOR_COP_SWAT, "Agradecimentos especiais:");
	    SendClientMessage(playerid, COLOR_YELLOW, " ");
	    SendClientMessage(playerid, COLOR_WHITE, "Agradecemos ao clan GT por ter iniciado a histÛria do RPG brasileiro com profissıes.");
	    SendClientMessage(playerid, COLOR_WHITE, "Sem ele, nÛs terÌamos que jogar DM, corrida ou ainda no estilo The Godfather.");
	    SendClientMessage(playerid, COLOR_JUIZ,  "Agradecemos ao DracoBlue pelos magnÌficos sistemas DUDB e DINI,");
	    SendClientMessage(playerid, COLOR_JUIZ,  "que nos permite controlar as contas de usu·rio e mais outras coisas.");
	    SendClientMessage(playerid, COLOR_YELLOW, "Agradecemos ‡ equipe do SA:MP por nos trazer a possibilidade de jogar esse magnÌfico jogo online.");
	    SendClientMessage(playerid, COLOR_RED2, "E principalmente, ‡ Rockstar Games e subsidi·rias, por ter criado um jogo fant·stico como o GTA San Andreas!");
	    return 1;
	}
	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_GRAY,  "MPAÆ RevolutioN RPG Release Candidate 2");
	    SendClientMessage(playerid, COLOR_WHITE, "Como diz o nome, esse gamemode È um RPG, que simula a vida real.");
	    SendClientMessage(playerid, COLOR_WHITE, "Aqui vocÍ poder· trabalhar e receber seu sal·rio. Com seu sal·rio, poder·.");
	    SendClientMessage(playerid, COLOR_WHITE, "comprar propriedades, casas e carros. Na vida real existem crimes, aqui tambÈm.");
		SendClientMessage(playerid, COLOR_WHITE, "Se vocÍ cometer crimes, vai pagar. Se dirigir sem habilitaÁ„o, poder· pegar multa.");
		SendClientMessage(playerid, COLOR_WHITE, "H· trÍs tipo de habilitaÁıes: terrestre, nautica e aerea. … necess·ria a compra de");
		SendClientMessage(playerid, COLOR_WHITE, "combustÌvel para poder andar com os veÌculos do gamemode.");
		SendClientMessage(playerid, COLOR_WHITE, "Espero que divirta-se com nosso gamemode. S„o os votos do clan MPA - Grupo Infernus!");
		SendClientMessage(playerid, COLOR_MOTORISTA, "Comandos??? /ajuda ou /comandos /comandos2 /comandos3 /comandos4.");
		return 1;
	}
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_MOTORISTA, 	"Comandos do MPAÆ RevolutioN RPG - Parte I");
		SendClientMessage(playerid, COLOR_RED2, 		"/profs  /profs2 /profs3 /profs4 /profs5 : mostra as profissıes do RPG.");
		SendClientMessage(playerid, COLOR_MECANICO,     "/level : ver como funciona o sistema de level.");
		SendClientMessage(playerid, COLOR_COP_SWAT, 	"/190 [denuncia] : Faz uma denuncia ‡ policia.");
		SendClientMessage(playerid, COLOR_EMERGENCIA, 	"/192 : Chama uma ambul‚ncia ao local");
		SendClientMessage(playerid, COLOR_RED, 			"/trancar : Tranca seu carro. | /destrancar : Destranca seu carro.");
		SendClientMessage(playerid, COLOR_SEGURAN«A, 	"/procurados : VÍ a lista de procurados pela policia | /presos : VÍ aa lista de presos.");
		SendClientMessage(playerid, COLOR_GREEN, 		"/say [texto] : Manda mensagem para pessoas proximas a vocÍ.");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/comandos2 ver a segunda lista de comandos");
		return 1;
	}
    if(strcmp(cmd, "/comandos2", true) == 0) {
        SendClientMessage(playerid, COLOR_MOTORISTA, 	"Comandos do MPAÆ RevolutioN RPG - Parte II");
       	SendClientMessage(playerid, COLOR_ASSALTANTE,   "/banco : ver os comandos dos Bancos");
		SendClientMessage(playerid, COLOR_COP_MILITAR, 	"/abastecer [litros] : Abastecer (vocÍ deve estar no posto para usar este comando).");
        SendClientMessage(playerid, COLOR_WHITE, 		"/pagar[id][quantidade] :Pagar corretor ou vendedor de carros.| /motorista: solicitar um motorista particular");
        SendClientMessage(playerid, COLOR_ADVOGADO, 	"/advogado: solicitar um advogado | /defesa [id] [valor ex:500k] : para pagar advogado por defende-lo .");
        SendClientMessage(playerid, COLOR_COP_SWAT,     "/ci [IDdoCOP] : mostra os documentos para o polÌcial.");
        SendClientMessage(playerid, COLOR_PALHA,        "REVO-SENA : /revosena [num1] [num2] [num3] [num4] [num5] [num6] - ATEN«√O: Os n˙meros v„o de 1 a 60!");
        SendClientMessage(playerid, COLOR_PALHA,       	"REVO-SENA : /revosena-surpresinha : gera os n˙meros automaticamente sem precisar escolher.");
        SendClientMessage(playerid, COLOR_YELLOW,       "/comandos3 ver a terceira lista de comandos");
        return 1;
    }
    if(strcmp(cmd, "/comandos3", true) == 0) {
        SendClientMessage(playerid, COLOR_MOTORISTA, 		"Comandos do MPAÆ RevolutioN RPG - Parte III");
        SendClientMessage(playerid, COLOR_YELLOW, 			"/taxi : Chama um taxi. | /taxiaero : chama um taxi-avi„o");
        SendClientMessage(playerid, COLOR_SEGURAN«A,		"/telepizza [local] : pede ao pizzaboy uma pizza.");
        SendClientMessage(playerid, COLOR_RED2, 			"/veiculos ver os carros que podem ser comprados e os preÁos do MPA REV. RPG.");
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,"/pedirarma [arma/ou/nomeparecido], pede uma arma ao vendedor de armas.");
        SendClientMessage(playerid, COLOR_PALHA,			"/acoes : ver as acÁıes do jogo!");
      	SendClientMessage(playerid, COLOR_WHITE,			"/votarkick [id] : insatisfeito com um jogador ?");
        SendClientMessage(playerid, COLOR_UNLOGGED,     	"/profissao : ver os comandos de sua profiss„o.");
        SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos4 ver a terceira lista de comandos");
        return 1;
	}
	if(strcmp(cmd, "/comandos4", true) == 0) {
	    SendClientMessage(playerid, COLOR_MOTORISTA, 		"Comandos do MPAÆ RevolutioN RPG - Parte IV");
	    SendClientMessage(playerid, COLOR_ADVOGADO,			"/armas : ver os preÁos das armas do MPA.");
        SendClientMessage(playerid, COLOR_JUIZ,				"/soltarpreso [id] : VocÍ matou um JUIZ/SHERIFF, ganhou a chave da cadeia pode libertar 1 preso!");
        SendClientMessage(playerid, COLOR_MECANICO,			"/mecanico : Chama um Mecanico para onde vocÍ est·!");
        SendClientMessage(playerid, COLOR_AZULPLUS,         "/portedearmas : ver o porte de arma do server.");
        SendClientMessage(playerid, COLOR_VERDECLARO,       "/meuskin : troca o skin automaticamente.");
        SendClientMessage(playerid, COLOR_GREEN, 			"/horas : Mostra o hor·rio em SA.");
        SendClientMessage(playerid, COLOR_INSTRUTOR,        "/carteiras : ver o valor das habilitaÁıes.");
        SendClientMessage(playerid, COLOR_WHITE,            "/novidades , /novidades2 , /revolution , revolution2 , /revolution3 : para ver as novidades.");
        return 1;
    }
    if(strcmp(cmd, "/novidades", true) == 0) {
		SendClientMessage(playerid, COLOR_MECANICO,			"NovidadeS MPAÆ RevolutioN RPG - Parte I");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Nosso mode vem equipado de 40 profissıes para saber como funciona basta digitar /level.");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Sistema de skins autom·tica /meuskin [id/da/skin]");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Que tal apostar uma graninha e concorrer a $200.000 ? V· em uma loja 24/7 e se informe!");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Est· querendo ver os veÌculos e os preÁos do server? /veÌculos e veja os veÌculos disponÌveis.");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Est· querendo fazer algo ilÌcito e precisa de armas? Veja nossas armas em /armas e /armas2.");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Logo em seguida digite /pedirarma [arma/ou/nomeparecido]");
		SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "/novidades 2 Para ver a lista das NovidadeS MPAÆ RevolutioN RPG - Parte II");
		return 1;
	}
   	if(strcmp(cmd, "/novidades2", true) == 0) {
   		SendClientMessage(playerid, COLOR_MECANICO,			"NovidadeS MPAÆ RevolutioN RPG - Parte II");
   	    SendClientMessage(playerid, COLOR_AZULPLUS,         "Quer ver as aÁıes disponÌveis no jogo ? /acoes");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Insatisfeito com algum jogador? Inicie uma votaÁ„o /votarkick [id/do/jogador].");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Mate o Juiz/Sheriff e ganhe a chave da cadeia /soltarpreso");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Seu carro est· prestes a explodir? Chame um reboque /mecanico");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Quer ver seu porte de armas? /portedearmas");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "V· na concecion·ria de San Fierro e veja os carros para locaÁ„o!");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,  "Digite /revolution e veja porque o RevolutioN È o RevolutioN!");
        return 1;
    }
   	if(strcmp(cmd, "/revolution", true) == 0) {
   	    SendClientMessage(playerid, COLOR_AZULPLUS, 		"Aqui est„o as novidades que fazem do RevolutioN a verdadeira revoluÁ„o!");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Cansado de esperar dar gmx para aparecer seu carro? No revolution");
   	    SendClientMessage(playerid, COLOR_WHITE,             "n„o precisa de gmx para aparecer.");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Comprava 1 casa e n„o sabia se morava outra pessoa ali, agora no revolution");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Sua casa ganha 1 Ìcone informando que ali j· mora gente.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora vocÍ tem seu carro! Comprando o carro do vendedor vocÍ pode ativar o alarme");
	    SendClientMessage(playerid, COLOR_WHITE,             "e quando sentir falta dele avise a polÌcia que ligar· o radar e achar· seu carro");
   	    SendClientMessage(playerid, COLOR_WHITE,             "aonde estiver");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "Digite /revolution2 e veja porque o RevolutioN È o RevolutioN!");
        return 1;
    }
	if(strcmp(cmd, "/revolution2", true) == 0) {
        SendClientMessage(playerid, COLOR_AZULPLUS, 		"Aqui est„o as novidades que fazem do RevolutioN a verdadeira revoluÁ„o!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora os carros n„o d„o mais respawn, para reaver 1 carro chame um reboque.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Celular com: /celular /sms /lista /numero /chamar /atender /desligar /espera");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora todos os carros vem com g·s! Ao iniciar o mode todos tem 100lts");
        SendClientMessage(playerid, COLOR_WHITE,             "Quando fechar o mode os litros deixados nos carros ser„o salvos!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Sem grana para 1 casa? Fique hospedado no Hotel /hotelinfo");
	    SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "Digite /revolution3 e veja porque o RevolutioN È o RevolutioN!");
	    return 1;
	}
	if(strcmp(cmd, "/revolution3", true) == 0) {
        SendClientMessage(playerid, COLOR_AZULPLUS, 		"Aqui est„o as novidades que fazem do RevolutioN a verdadeira revoluÁ„o!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Todas as profs vem com mais de 2 comandos! Exato atÈ assassino!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Em toda San Andreas h· radares fixos multando quem andar acima da velocidade.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Previs„o do tempo altera o plantio se chover a colheita sai mais r·pido.");
	    SendClientMessage(playerid, COLOR_RED2,              "Tuning, vocÍ pode tunar seu veiculo e salv·-lo. Basta ser o dono.");
	    SendClientMessage(playerid, COLOR_RED2,              "V· a uma oficina aplique os componentes desejados! E pronto est· salvo!");
		return 1;
	}
    if(strcmp(cmd, "/armas", true) == 0) {
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,	"Armas do MPAÆ RevolutioN RPG - Parte I");
        SendClientMessage(playerid, COLOR_MECANICO,				"DescriÁ„o: ID - Nome da Arma - Valor");
        SendClientMessage(playerid, COLOR_WHITE,				"1 - Soco InglÍs - $500 | 2 - Taco de Golfe - $600 	  | 3 - Cacetete - $650");
        SendClientMessage(playerid, COLOR_WHITE,				"4 - Faca - $750 		| 5 - Taco de Baseball - $350 | 6 - Shovel - $400");
		SendClientMessage(playerid, COLOR_WHITE,				"7 - Taco de Sinuca - $300 | 8 - Katana - $800 | 9 - Motoserra - $1000");
		SendClientMessage(playerid, COLOR_WHITE,				"10 - Vibrador roxo - $100 | 11 - Vibrador branco grande - $100 | 12 - Vibrador branco mÈdio - $100");
		SendClientMessage(playerid, COLOR_WHITE,				"13 - Vibrador prata pequeno - $100 | 14 - Flores - $100 | 15 - Bengala - $150 | 16 - Granada - $300");
        SendClientMessage(playerid, COLOR_WHITE,				"17 - Gas - $300 | 22 - Pistola - $600 | 23 - Pistola com Silenciador - $1000");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,		"/armas2 - Lista II do MPAÆ RevolutioN RPG");
        return 1;
    }
    if(strcmp(cmd, "/armas2", true) == 0) {
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,	"Armas do MPAÆ RevolutioN RPG - Parte II");
        SendClientMessage(playerid, COLOR_MECANICO,				"DescriÁ„o: ID - Nome da Arma - Valor");
		SendClientMessage(playerid, COLOR_WHITE,				"24 - Desert Eagle - $3000 | 25 - Escopeta Calibre 12 - $1800 | 26 - Escopeta de Cano Serrado - $6000");
		SendClientMessage(playerid, COLOR_WHITE,				"27 - Escopeta de Combate - $7500 | 28 - Micro Uzi - $8000 | 29 - MP5 - $5500");
        SendClientMessage(playerid, COLOR_WHITE,				"30 - AK47 - $7500 | 31 - M4 - $9000 | 32 - Tec9 - $8000 | 33 - Country Rifle - 4000");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,       "Fim da Lista das ARMAS do MPAÆ RevolutioN RPG.");
        return 1;
	}
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Comandos do Banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/extrato : checa seu o saldo banc·rio./trasnferir [id]: transfere ‡ uma conta");
        SendClientMessage(playerid, COLOR_YELLOW, "/cell : checa seu o saldo banc·rio atravÈs do seu celular, custo $5.");
        SendClientMessage(playerid, COLOR_YELLOW, "VocÍ precisa estar em um banco para usar esses comandos, menos o /cell.");
        SendClientMessage(playerid, COLOR_YELLOW, "Bancos: em todas cidades, consulte o mapa no site.");
		return 1;
	}
    if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_UNLOGGED,			"Lista de profissıes MPAÆ RevolutioN RPG");
        SendClientMessage(playerid, COLOR_DESEMPREGADO,		"1 - Desempregado (Sal·rio: $350)");
        SendClientMessage(playerid, COLOR_BARMAN, 			"2 - Barman (Sal·rio: $900 + as bebidas que vende)");
    	SendClientMessage(playerid, COLOR_ASSASSINO, 		"3 - Assassino (ganha o que roubar da vÌtima)");
        SendClientMessage(playerid, COLOR_UNLOGGED,   		"4 - Vendedor de carros (Sal·rio: $350 + comiss„o) PROFISS√O LIMITADA");
		SendClientMessage(playerid, COLOR_CORRETOR, 		"5 - Corretor de imoveis Sal·rio: $350 + comiss„o)");
	    SendClientMessage(playerid, COLOR_SEGURAN«A,		"6 - SeguranÁa (Sal·rio: $2000 + o que o patr„o pagar)");
        SendClientMessage(playerid, COLOR_MOTORISTA,		"7 - Motorista Particular (Sal·rio: $2000 + o que o patr„o pagar)");
    	SendClientMessage(playerid, COLOR_MOTORISTA_DE_ONIBUS,	"8 - Motorista de Ùnibus (Sal·rio: $2000)");
    	SendClientMessage(playerid, COLOR_UNLOGGED,     	"Para mais profissıes, digite /profs2");
    	return 1;
    }
    if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COLOR_UNLOGGED,     	"Lista de profissıes MPAÆ RevolutioN RPG - Parte II");
		SendClientMessage(playerid, COLOR_CAMINHONEIRO,		"9  - Caminhoneiro (Sal·rio: $1500 + o frete pelas cargas)");
    	SendClientMessage(playerid, COLOR_CACADOR, 			"10 - CaÁador (Sal·rio: $1000 + o caÁas que vender)");
        SendClientMessage(playerid, COLOR_PESCADOR, 		"11 - Pescador (Sal·rio: $1500 + o que ganha na pesca)");
	    SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "12 - Entregador de pizza (Sal·rio: $900 + o que o vender)");
        SendClientMessage(playerid, COLOR_TAXISTA, 			"13 - Taxista (Sal·rio: $2000)");
	    SendClientMessage(playerid, COLOR_MOTOTAXI, 		"14 - Mototaxista (Sal·rio: $1000)");
        SendClientMessage(playerid, COLOR_TAXI_AEREO, 		"15 - Aerotaxista (Sal·rio: $1500)");
        SendClientMessage(playerid, COLOR_INSTRUTOR, 		"16 - Instrutor de direÁ„o (Sal·rio: $350 + comiss„o)");
        SendClientMessage(playerid, COLOR_UNLOGGED,		    "Para mais profissıes, digite /profs3");
		return 1;
	}
	if(strcmp(cmd, "/profs3", true) == 0) {
		SendClientMessage(playerid, COLOR_UNLOGGED,  		"Lista de profissıes MPAÆ RevolutioN RPG - Parte III");
        SendClientMessage(playerid, COLOR_TRAFICANTE, 		"17 - Traficante(Sal·rio: $1200 + o que o vender)");
    	SendClientMessage(playerid, COLOR_JORNALISTA, 		"18 - Jornalista Sal·rio: $1000)");
        SendClientMessage(playerid, COLOR_PARAMEDICO, 		"19 - ParamÈdico(Sal·rio: $1000 + mais pagamento do plant„o)");
        SendClientMessage(playerid, COLOR_ADVOGADO,   		"20 - Advogado (Sal·rio: $1000 + honorarios)");
	    SendClientMessage(playerid, COLOR_COP_MILITAR,  	"21 - PolÌcia militar (Sal·rio: $1200) PROFISSAO LIMITADA");
		SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "22 - PolÌcia rodovi·ria (Sal·rio: $1400) PROFISSAO LIMITADA");
        SendClientMessage(playerid, COLOR_COP_FLORESTAL,    "23 - PolÌcia florestal (Sal·rio: $1800) PROFISSAO LIMITADA");
		SendClientMessage(playerid, COLOR_COP_SWAT,  		"24 - PolÌcia Swat(Sal·rio: $2000) PROFISSAO LIMITADA");
		SendClientMessage(playerid, COLOR_UNLOGGED,         "Para mais profissıes, digite /profs4");
		return 1;
	}
	if(strcmp(cmd, "/profs4", true)==0){
	    SendClientMessage(playerid, COLOR_UNLOGGED,  	    "Lista de profissıes MPAÆ RevolutioN RPG - Parte IV");
        SendClientMessage(playerid, COLOR_COP_NARCOTICOS,   "25 - PolÌcia NarcÛticos(Sal·rio: $2000) PROFISSAO LIMITADA");
        SendClientMessage(playerid, COLOR_JUIZ,   			"26 - Juiz(Sal·rio: $3000) PROFISSAO LIMITADA");
     	SendClientMessage(playerid, COLOR_SHERIFF,   		"27 - Xerife (Sal·rio: $4500) PROFISSAO LIMITADA");
     	SendClientMessage(playerid, COLOR_LIXEIRO,   		"28 - Lixeiro(Sal·rio: $1000) + o que coletar");
     	SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES,   "29 - Transporte de Valores(Sal·rio: $800 + o que depositar)");
     	SendClientMessage(playerid, COLOR_CONTRABANDISTA,   "30 - Contrabandista(Sal·rio: $800 + contrabando)");
     	SendClientMessage(playerid, COLOR_RECEITA_FEDERAL,  "31 - Receita Federal(Sal·rio: $3000) PROFISSAO LIMITADA");
     	SendClientMessage(playerid, COLOR_AGRICULTOR,   	"32 - Agricultor(Sal·rio: $1200 + o que plantar)");
     	SendClientMessage(playerid, COLOR_UNLOGGED, 	    "Para mais profissıes, digite /profs5");
		return 1;
	}
	if(strcmp(cmd, "/profs5", true)==0){
	    SendClientMessage(playerid, COLOR_UNLOGGED,   		"Lista de profissıes MPAÆ RevolutioN RPG - Parte V");
	    SendClientMessage(playerid, COLOR_LADRAO_DE_CARROS, "33 -Ladr„o de Carros(Sal·rio: $1000 + carros que roubar)");
     	SendClientMessage(playerid, COLOR_ASSALTANTE,   	"34 - Assaltante(Sal·rio: $600 + o que assaltar e roubar)");
     	SendClientMessage(playerid, COLOR_LOCADOR_DE_CARROS,"36 - Locador de Carros(Sal·rio: $1000 + os carros que locar)");
     	SendClientMessage(playerid, COLOR_PEDREIRA,   		"37 - Carregador da Pedreira(Sal·rio: $1500 + o que descarregar na obra.)");
     	SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,"38 - Vendedor de Armas(Sal·rio: $1400 + as 10 por cento das armas que vender.)");
     	SendClientMessage(playerid, COLOR_MECANICO,         "39 - Mec‚nico(Sal·rio: $1000 + os consertos)");
       	SendClientMessage(playerid, COLOR_ROSA, 	  		"40 - Prostituta(Sal·rio: $800 + transas e strips)");
       	SendClientMessage(playerid, COLOR_COP_MILITAR, 	  	"_*_*_*_*_*_*_*_*_*_*_*_*_*_*BOM JOGO_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*");
	   	return 1;
     }
	if(strcmp(cmd, "/regras1", true) == 0) {
	    SendClientMessage(playerid, COLOR_RED2, "REGRAS - para jogadores e administradores.");
        SendClientMessage(playerid, COLOR_JUIZ,	"  1∫ N„o È permitido o uso de cheats, trapaÁas, para jogadores INCLUSIVE ADMs.");
        SendClientMessage(playerid, COLOR_JUIZ, "  2∫ Nenhum jogador pode se apossar de algum veÌculo sem ter pago pelo mesmo.");
        SendClientMessage(playerid, COLOR_JUIZ, "  3∫ … necess·ria habilitaÁ„o para dirigir, e a compra de carros È possÌvel somente");
        SendClientMessage(playerid, COLOR_JUIZ, "  se o jogador tiver uma casa.");
    	SendClientMessage(playerid, COLOR_JUIZ, "  4∫ Nenhum jogador pode possuir mais de 4 veÌculos, afim de n„o pesar o mode.");
        SendClientMessage(playerid, COLOR_JUIZ, "  No total o mode suporta apenas 70 tipos diferentes de veÌculos. ");
        SendClientMessage(playerid, COLOR_JUIZ, "  5∫ Valores de casas: 5k 10k 20k 40k 60k 80k 100k e 200k.");
        SendClientMessage(playerid, COLOR_JUIZ, "  6∫ Valores dos carros: vide tabela padr„o.");
		return 1;
	}
	if(strcmp(cmd, "/regras2", true) == 0) {
	    SendClientMessage(playerid, COLOR_JUIZ, "  7∫ Profissıes elitizadas ser„o setadas como promoÁ„o, NENHUM jogadoras receber· sem provar");
        SendClientMessage(playerid, COLOR_JUIZ, "  a competÍncia na profiss„o concedida: isto inclui: todas profissıes policiais");
        SendClientMessage(playerid, COLOR_JUIZ, "  8∫ Deve-se respeitar a lÛgica do RPG, n„o È permitido um numÈro desequilibrado de profissıes.");
        SendClientMessage(playerid, COLOR_JUIZ, "  9∫ A n„o obediÍncia destas regras dispostas implicar· desde advertÍncia ‡ exclus„o permanente do servidor. ");
        SendClientMessage(playerid, COLOR_JUIZ, "  10∫ Skin para: Policiais, Advogados, Xerife e Juiz sao predeterminadas, alteraÁıes somente para: Cop 280 ‡ 285.Demais: 147,164,166,37. ");
		SendClientMessage(playerid, COLOR_JUIZ, "  11∫ Nenhum jogador poder· setar a casa de outro no ar, isso poder· acarretar na perca do emprego e atÈ mesmo em banimento do servidor.");
		SendClientMessage(playerid, COLOR_WHITE,  "  A finalidade das regras s„o afim de garantir organizaÁ„o, e claro, divers„o no mode MPA© RevolutioN RPG.");
		return 1;
	}
	if(strcmp(cmd, "/acoes", true) == 0) {
	    SendClientMessage(playerid, COLOR_WHITE, "/mundovirtual  | /render | /bebado | /cover | /crack");
        SendClientMessage(playerid, COLOR_WHITE, "/plantarbomba  | /beijar | /fumar  |/fumar2 | /gunarrest");
        SendClientMessage(playerid, COLOR_WHITE, "/sentar | /fu  | /punheta | /esconder-se | /aparecer | /mijar ");
        SendClientMessage(playerid, COLOR_WHITE, "/dodge | /rcglobin | /rcbaron | /sair-rc.");
		return 1;
	}
	if(strcmp(cmd, "/hotelinfo", true) == 0) {
    	SendClientMessage(playerid, COLOR_VERDE_AQUA, "O hotel serve como moradia tempor·ria. Para ficar hospedado digite /hotel");
        SendClientMessage(playerid, COLOR_VERDE_AQUA, "O custo da hospedagem È $1500 dolares, poder· ficar hospedado atÈ ter");
        SendClientMessage(playerid, COLOR_VERDE_AQUA, "condiÁıes financeiras para poder comprar primeiramente 1 casa e logo em seguida 1 carro");
        return 1;
    }
    if(strcmp(cmd, "/veiculos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"VeÌculos do MPA RevolutioN RPG -  escolha um estilo de carro");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/sedans     -    /aereos");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/4portas    -    /barcos");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/muscle     -    /lowriders");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/esportivos -    /recreacionais");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/corrida    -    /motos");
		SendClientMessage(playerid, COLOR_GREEN, 		"/pesados");
		return 1;
	}
    if(strcmp(cmd, "/sedans", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Sedans do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/587 - Euros 75000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/602 - Alpha 55000");
		SendClientMessage(playerid, COLOR_ORANGE,       "/562 - Elegy 50000");
		SendClientMessage(playerid, COLOR_ORANGE,       "/565 - Flash 45000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/517 - Majestic 35000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/496 - Blista Compact 35000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/439 - Stallion 29000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/410 - Manana 4000");
		return 1;
	}
    if(strcmp(cmd, "/aereos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"AÈreos do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/519 - Shamal 1545000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/487 - Maverick 845000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/593 - Dodo 845000");
		return 1;
	}
    if(strcmp(cmd, "/4portas", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"4 Portas do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/409 - Stretch 80000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/445 - Admiral 35000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/405 - Sentinel 35000");
		return 1;
	}
    if(strcmp(cmd, "/barcos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Barcos do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Barco  -  PreÁo");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/493 - Jetmax 608000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/453 - Reefer 180000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/473 - Dinghy 50000");
		return 1;
	}
    if(strcmp(cmd, "/muscle", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Muscles do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/402 - Buffalo 95000");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/603 - Phoenix 75000");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/475 - Sabre 19000");
		return 1;
	}
	if(strcmp(cmd, "/esportivos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Esportivos do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/560 - Sultan  105000");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/559 - Jester  85000");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/529 - Banshee 50000");
		return 1;
	}
	if(strcmp(cmd, "/corrida", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Carros Esportivos e de Corrrida do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/411 - Infernus 450000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/451 - Turismo 350000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/541 - Bullet 300000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/415 - Cheetah 255000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/480 - Comet 160000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/434 - Hotknife 120000");
		return 1;
	}
   	if(strcmp(cmd, "/recreacionais", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"VeÌculos Recreacionais do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/444 - Monster 115000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/424 - BF Injection 15000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/471 - Quad 9000");
		return 1;
	}
	if(strcmp(cmd, "/pesados", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"VeÌculos Pesados do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_GREEN, 		"/444 - Monster 115000");
		SendClientMessage(playerid, COLOR_GREEN, 		"/515 - RoadTrain 67000");
		SendClientMessage(playerid, COLOR_GREEN, 		"/400 - Landstalker 30000");
		return 1;
	}
	if(strcmp(cmd, "/lowriders", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Low Riders do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_WHITE, 		"/535 - Slamvan 25000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/536 - Blade 20000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/534 - Remington 20000");
		return 1;
	}
	if(strcmp(cmd, "/motos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Motos do MPA RevolutioN RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_WHITE, 		"/522 - NRG500  60000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/521 - FCR-900 35000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/461 - PCJ-600 10000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/463 - Freeway 15000 ");
		SendClientMessage(playerid, COLOR_WHITE, 		"/468 - Sanchez 10000 ");
		SendClientMessage(playerid, COLOR_WHITE, 		"/462 - Faggio 2000");
		return 1;
	}
	if(strcmp(cmd, "/carteiras", true) == 0) {
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "Terrestre - $800");
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "Na˙tica - $1200");
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "AÈrea - $2000");
	    return 1;
	}
//LIXEIRO
	if(strcmp(cmd,"/coletarlixo",true)==0){
	    if(Profissao[playerid] == LIXEIRO || IsPlayerAdmin(playerid)){
	        if(MissaoLixeiro[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"VocÍ j· est· na miss„o de coleÁ„o de lixo!");
				return 1;
			}
			else {
				SendClientMessage(playerid,COLOR_RED,"A sua miss„o agora È:");
				SendClientMessage(playerid,COLOR_RED2,"Colete os resÌduos de 10 lixeiras e em seguida,");
				SendClientMessage(playerid,COLOR_RED2,"transporte o caminh„o atÈ o lix„o e deposite o lixo l·");
				SendClientMessage(playerid,COLOR_RED2,"com o comando /lixao.");
				MissaoLixeiro[playerid] = 1;
				new randtrash = random(73);
				SetPlayerCheckpoint(playerid,LixeirasCheckpoints[randtrash][0],LixeirasCheckpoints[randtrash][1],LixeirasCheckpoints[randtrash][2],3.0);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Apenas lixeiros podem usufruir desse comando.");
			return 1;
		}
	}
	if(strcmp(cmd,"/lixao",true)==0){
	    if(Profissao[playerid] == LIXEIRO || IsPlayerAdmin(playerid)){
	        if(MissaoLixeiro[playerid] == 0){
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· na miss„o de coleÁ„o de lixo!");
				return 1;
			} else {
			    if(LixoColetado[playerid] < 10){
			        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem lixo suficiente para descarregar.");
			        return 1;
				} else {
					if(AreaLixao[playerid] == 0){
					    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um lix„o!");
					    return 1;
					} else {
						if(GetVehicleModel(GetPlayerVehicleID(playerid)) != VEH_LIXEIRO){
						    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um caminh„o Trashmaster!");
						    return 1;
						} else {
						    MissaoLixeiro[playerid] = 0;
						    LixoColetado[playerid] = 0;
						    SendClientMessage(playerid,COLOR_RED2,"Miss„o cumprida!");
						    GivePlayerMoney(playerid,1000);
						    AcrescentarExPoints(playerid,1);
						    return 1;
						}
					}
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Apenas lixeiros podem usufruir desse comando.");
		    return 1;
		}
	}
	
//Celular
	if(!strcmp(cmd, "/chamar",true)){
	    new tmp[256],cellowner[256],str[256],encontrado;
	    tmp = strtok(cmdtext,idx);
	    //new numero;
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Uso correto: /chamar [n˙mero-do-celular]");
		    return 1;
		}
		if(!mysql) return 0;
   		new resultline[1024];
   		new string[255];
   		new field[128];
		new numero;
		format(string, sizeof(string),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
		if(samp_mysql_query(string) == 0) printf("Erro na query 1 do comando /chamar");
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline);
			numero = strval(field);
		}
		if(!numero){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
		    return 1;
		}
		format(string, sizeof(string),"SELECT nickname FROM players WHERE phonenumb = '%s '", tmp);
		if(samp_mysql_query(string) == 0) printf("Erro na query 2 do comando /chamar");
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(cellowner, "|", resultline);
			encontrado = 1;
		}
		if(encontrado == 0){
		    SendClientMessage(playerid,COLOR_RED,"mySQL error: N˙mero inexistente.");
		    return 1;
		}
		strdel(cellowner,strlen(cellowner)-1,strlen(cellowner));
		//debugger on
		new dbgstr[256];
		format(dbgstr,sizeof dbgstr,"Propriet·rio do celular: %s",cellowner);
		SendClientMessage(playerid,COLOR_RED,dbgstr);
		print (dbgstr);
		//debugger off
		new calledid = GetPlayerID(cellowner);
		if(calledid == INVALID_PLAYER_ID){
		    SendClientMessage(playerid,COLOR_RED,"O propriet·rio desse celular n„o est· conectado!");
		    return 1;
		}
		if(calledid == playerid){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pode ligar para si mesmo!");
		    return 1;
		}
		if(CellCredits[playerid] == 0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem crÈditos suficientes para originar uma chamada. MÌnimo: 2");
		    return 1;
		}
		if(EmLigacao[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ j· est· em uma ligaÁ„o!");
			return 1;
		}
		if(EmLigacao[calledid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"O jogador j· est· em uma ligaÁ„o!");
		    return 1;
		}
		SendClientMessage(playerid,COLOR_YELLOW,"Chamando...");
		SendClientMessage(calledid,COLOR_RED2,"Seu celular est· tocando! Para atendÍ-lo, digite /atender. Caso contr·rio, digite /recusarchamada.");
		format(str,256,"Originador da chamada: %s",PlayerName(playerid));
		SendClientMessage(calledid,COLOR_YELLOW,str);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		Chamando[playerid]=1;
		Chamando[calledid]=1;
		CalledID[playerid]=calledid;
		CalledID[calledid]=playerid;
		CobrancaCall[playerid]=1;
		CobrancaCall[calledid]=0;
		return 1;
	}
	
	if(!strcmp(cmd, "/chamar9090",true)){
	    new tmp[256],cellowner[256],str[256];
	    new calledid = GetPlayerID(cellowner);
	    tmp = strtok(cmdtext,idx);
		new numero;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string[255];
    		format(string, sizeof(string),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string) == 0){
			    printf("Erro na Linha 5251");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				numero = strval(field);
			}
		}
	    if(numero==0){
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
	        return 1;
		}
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Uso correto: /chamar9090 [n˙mero-do-celular]");
		    return 1;
		}
		if(!dini_Isset("celulares.rpg",tmp)){
		    SendClientMessage(playerid,COLOR_RED,"N˙mero de celular inexistente.");
		    return 1;
		}
		cellowner = dini_Get("celulares.rpg",tmp);
		if(!IsStringAName(cellowner)){
		    SendClientMessage(playerid,COLOR_RED,"O propriet·rio desse celular n„o est· conectado!");
		    return 1;
		}
		if(CellCredits[calledid] == 0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem crÈditos suficientes para originar uma chamada. MÌnimo: 2");
		    return 1;
		}
		if(EmLigacao[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ j· est· em uma ligaÁ„o!");
			return 1;
		}
		if(EmLigacao[calledid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"O jogador j· est· em uma ligaÁ„o!");
		    return 1;
		}
		SendClientMessage(playerid,COLOR_YELLOW,"Chamando...");
		SendClientMessage(calledid,COLOR_RED2,"LigaÁ„o a cobrar! Para atendÍ-la, digite /atendercobrar. Caso contr·rio, digite /recusarchamada.");
		format(str,256,"Originador da chamada: %s",PlayerName(playerid));
		SendClientMessage(calledid,COLOR_YELLOW,str);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		Chamando[playerid]=1;
		Chamando[calledid]=1;
		CalledID[playerid]=calledid;
		CalledID[calledid]=playerid;
		CobrancaCall[playerid]=1;
		CobrancaCall[calledid]=0;
		return 1;
	}
	if(!strcmp(cmd,"/atendercobrar",true)){
	    if(Chamando[playerid]==0){
	        SendClientMessage(playerid,COLOR_RED,"NinguÈm est· lhe chamando!");
	        return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"Pronto!");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SendClientMessage(CalledID[playerid],COLOR_RED,"Quem vocÍ chamava aceitou sua ligaÁ„o! Pode conversar!");
		Chamando[playerid]=0;
		Chamando[CalledID[playerid]]=0;
		EmLigacao[playerid]=1;
		EmLigacao[CalledID[playerid]]=1;
		if(CobrancaCall[playerid] == 0){
			CellTimer[playerid]=SetTimerEx("AvancoLigacao",60000,false,"dd",CalledID[playerid],playerid);
		} else {
		    CellTimer[CalledID[playerid]]=SetTimerEx("AvancoLigacao",60000,false,"dd",playerid,CalledID[playerid]);
		}
		return 1;
	}
	if(!strcmp(cmd,"/atender",true)){
	    if(Chamando[playerid]==0){
	        SendClientMessage(playerid,COLOR_RED,"NinguÈm est· lhe chamando!");
	        return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"Pronto!");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SendClientMessage(CalledID[playerid],COLOR_RED,"Quem vocÍ chamava aceitou sua ligaÁ„o! Pode conversar!");
		Chamando[playerid]=0;
		Chamando[CalledID[playerid]]=0;
		EmLigacao[playerid]=1;
		EmLigacao[CalledID[playerid]]=1;
		if(CobrancaCall[playerid] == 0){
			CellTimer[CalledID[playerid]]=SetTimerEx("AvancoLigacao",60000,false,"dd",CalledID[playerid],playerid);
		} else {
		    CellTimer[playerid]=SetTimerEx("AvancoLigacao",60000,false,"dd",playerid,CalledID[playerid]);
		}
		return 1;
	}
	if(!strcmp(cmd,"/recusarchamada",true)){
	    if(Chamando[playerid]==0){
	        SendClientMessage(playerid,COLOR_RED,"NinguÈm est· lhe chamando!");
			return 1;
		}
		SendClientMessage(playerid,COLOR_YELLOW,"Chamada cancelada!");
		SendClientMessage(CalledID[playerid],COLOR_RED,"Seu pedido de ligaÁ„o foi recusado!");
		SetPlayerSpecialAction(CalledID[playerid],SPECIAL_ACTION_STOPUSECELLPHONE);
		Chamando[playerid]=0;
		Chamando[CalledID[playerid]]=0;
		return 1;
	}
	if(!strcmp(cmd,"/desligar",true)){
	    if(EmLigacao[playerid] == 0){
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em uma ligaÁ„o!");
	        return 1;
		}
		if(CobrancaCall[playerid] == 0){
		    KillTimer(CellTimer[CalledID[playerid]]);
		}
		if(CobrancaCall[playerid] == 1){
		    KillTimer(CellTimer[playerid]);
		}
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetPlayerSpecialAction(CalledID[playerid],SPECIAL_ACTION_STOPUSECELLPHONE);
		SendClientMessage(playerid,COLOR_RED,"Chamada desligada!");
		SendClientMessage(CalledID[playerid],COLOR_RED,"Chamada desligada");
		EmLigacao[playerid]=0;
		EmLigacao[CalledID[playerid]]=0;
		return 1;
	}
	if(strcmp(cmd, "/sms", true) == 0){
	 	new tmp[256],tmp2[256],cellowner[256];
	 	new string[256];
		tmp = strtok(cmdtext, idx);
		new numero;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
			    printf("Erro na Linha 5384");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				numero = strval(field);
			}
		}
	    if(numero==0){
			SendClientMessage(playerid, COLOR_YELLOW, "VocÍ n„o tem celular!");
			return 1;
		}
		if(!strlen(tmp)){
			SendClientMessage(playerid,COLOR_RED,"Uso: /sms [n˙mero-celular] [texto]");
			return 1;
		}
		strmid(tmp2,cmdtext,10,256);
		if(!strlen(tmp2)){
		    SendClientMessage(playerid,COLOR_RED,"Uso: /sms [n˙mero-celular] [texto]");
		    return 1;
		}
		if(!dini_Isset("celulares.rpg",tmp)){
		    SendClientMessage(playerid,COLOR_YELLOW,"N˙mero de celular inexistente");
		    return 1;
		}
		cellowner = dini_Get("celulares.rpg",tmp);
		if(!IsStringAName(cellowner)){
		    SendClientMessage(playerid,COLOR_RED,"O propriet·rio desse celular n„o est· conectado!");
		    return 1;
		}
		if(CellCredits[playerid] == 0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem crÈditos o suficiente para mandar um SMS.");
		    return 1;
		}
		new calledid = GetPlayerID(cellowner);
		CellCredits[playerid]--;
		SendClientMessage(calledid,COLOR_YELLOW,"Nova mensagem de texto recebida!");
		format(string, sizeof(string), "De: %s (%d). Conte˙do: %s", PlayerName(playerid),numero,tmp2);
		SendClientMessage(calledid,COLOR_WHITE,string);
		SendClientMessage(playerid, COLOR_WHITE, "Mensagem Enviada");
		format(string, sizeof(string), "Agora lhe sobraram %d crÈditos.", CellCredits[playerid]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}
	
	if(!strcmp(cmd,"/comprarlevel",true)){
	    new tmp[256],lvl;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Uso: /comprarlevel [quantidade]");
		    return 1;
		}
		lvl = strval(tmp);
		if(lvl*300 > GetPlayerMoney(playerid)){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem dinheiro suficiente");
		    return 1;
		}
		new XL;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string[255];
    		format(string, sizeof(string),"SELECT xl FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string) == 0){
			    printf("Erro na Linha 5450");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				XL = strval(field);
			}
		}
		if(AreaCreditos[playerid]==1){
			format(tmp,256,"VocÍ comprou %d level. Seu Experience Level agora È %d",lvl,XL+lvl);
			SendClientMessage(playerid,COLOR_GREEN,tmp);
			if(mysql == 1){
				new string[255];
				format(string, sizeof(string), "UPDATE players SET xl = %d WHERE nickname = '%s '", XL+lvl, PlayerName(playerid));
				if(samp_mysql_query(string) == 0){
			 		printf("Erro na linha 5466");
				}
			}
			GivePlayerMoney(playerid,-lvl*10000);
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em uma loja 24/7");
		    return 1;
		}
	}

    if(strcmp(cmd, "/recarga", true) == 0) {
		new tmp[256];
		new creditos;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_WHITE, "Uso: /recarga [quantidade]");
			return 1;
		}
	    creditos = strval(tmp);
	    if(creditos > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem todo esse dinheiro.");
			return 1;
		}
		new numero;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string[255];
    		format(string, sizeof(string),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string) == 0){
			    printf("Erro na Linha 5499");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				numero = strval(field);
			}
		}
	    if(numero==0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
		    return 1;
		}
	    if(AreaCreditos[playerid] == 1){
	        if(creditos + CellCredits[playerid] < 100){
	            CellCredits[playerid] = creditos+CellCredits[playerid];
				if(mysql == 1){
					new string[255];
					format(string, sizeof(string), "UPDATE players SET creditos = %d WHERE nickname = '%s '", CellCredits[playerid], PlayerName(playerid));
					if(samp_mysql_query(string) == 0){
			 			printf("Erro na linha 5519");
					}
				}
			    format(tmp, sizeof(tmp), "Seu celular foi recarregado. Um total de %d crÈditos foi colocado.", creditos);
				SendClientMessage(playerid, COLOR_GREEN, tmp);
				GivePlayerMoney(playerid, - creditos);
				return 1;
			}
			new credi;
			if(mysql == 1){
    			new resultline[1024];
    			new field[128];
    			new string[255];
    			format(string, sizeof(string),"SELECT creditos FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    	samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string) == 0){
			    	printf("Erro na Linha 5536");
				}
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
					credi = strval(field);
				}
			}
			if(creditos + credi > 99){
			    new quantia;
			    quantia = 100 - CellCredits[playerid];
			    CellCredits[playerid] = 100;
				if(mysql == 1){
					new string[255];
					format(string, sizeof(string), "UPDATE players SET creditos = 100 WHERE nickname = '%s '", PlayerName(playerid));
					if(samp_mysql_query(string) == 0){
			 			printf("Erro na linha 5553");
					}
				}
				format(tmp, sizeof(tmp),"Seu celular foi recarregado por completo. Um total de %d crÈditos foi colocado.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, tmp);
				GivePlayerMoney(playerid, - quantia);
				return 1;
			}
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Todas as lojas 24/7 tem a funÁ„o de /recarga pra o celuar");
			return 1;
		}
	}

	if(strcmp(cmd, "/cellcreditos", true) == 0) {
 		new string[256];
		new numero;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
			    printf("Erro na Linha 5580");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				numero = strval(field);
			}
		}
	    if(numero==0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
		    return 1;
		}
		else{
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			new credi;
			if(mysql == 1){
    			new resultline[1024];
    			new field[128];
    			new string2[255];
    			format(string2, sizeof(string2),"SELECT creditos FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    	samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string2) == 0){
			    	printf("Erro na Linha 5604");
				}
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
					credi = strval(field);
				}
			}
			format(string, sizeof(string), "[SERVI«O DE TELEFONIA M”VEL]: VocÍ tem %d crÈditos.", credi, playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SetTimerEx("AcaoEspecial",6000,0,"dxs",playerid,COLOR_COP_SWAT,string);
			return 1;
		}
	}

    if(strcmp(cmd, "/vercreditos", true) == 0) {
		new numero;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string[255];
    		format(string, sizeof(string),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string) == 0){
			    printf("Erro na Linha 5630");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				numero = strval(field);
			}
		}
	    if(numero==0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
			return 1;
		}
		new string[256];
		format(string, sizeof(string), "VocÍ tem %d crÈditos", CellCredits[playerid]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}

	if (strcmp(cmd, "/numero", true) == 0){
	    new tmp[256],encontrado;
		new agen;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT agenda FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
			    printf("Erro na Linha 5659");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				agen = strval(field);
			}
		}
		if (agen == 1)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /numero [nome]");
				return 1;
			}
			new query2[256],field[128],resultline[1024],phone;
			format(query2,256,"SELECT phonenumb FROM players WHERE nickname = '%s '", tmp);
			if(samp_mysql_query(query2)==0) print("Erro na query 2 do comando /numero");
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				phone = strval(field);
				encontrado=1;
				new tmp2[256];
				format(tmp2,256,"Nome: %s - N˙mero: %d",tmp,phone);
				SendClientMessage(playerid,COLOR_GREEN,tmp2);
			}
			if(!encontrado) SendClientMessage(playerid,COLOR_RED,"mySQL error: N„o foram encontrados resultados para seus critÈrios de pesquisa");
		} else {
			SendClientMessage(playerid, COLOR_GRAD1, "VocÍ n„o tem uma lista telefÙnica!");
			return 1;
		}
		return 1;
	}
	
	if (strcmp(cmd, "/lista", true) == 0){
        if(GetPlayerMoney(playerid) < 500){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar.");
			return 1;
		}
		new agen;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string[255];
    		format(string, sizeof(string),"SELECT agenda FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string) == 0){
			    printf("Erro na Linha 5716");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				agen = strval(field);
			}
		}
		if(agen == 1){
			SendClientMessage(playerid, COLOR_WHITE, "VocÍ j· tem uma lista telefÙnica.");
			return 1;
		}
		new string[256];
   		GivePlayerMoney(playerid,-500);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		Agenda[playerid] = 1;
		format(string, sizeof(string), "Lista TelefÙnica comprada, agora vocÍ poder· ver n˙meros telefÙnicos.");
		SendClientMessage(playerid, COLOR_ROSA, string);
		SendClientMessage(playerid, COLOR_WHITE, "USO: Coloque /numero [nome].");
        if(mysql == 1){
			new string2[255];
			format(string2, sizeof(string2), "UPDATE players SET agenda = 1 WHERE nickname = '%s '", PlayerName(playerid));
			if(samp_mysql_query(string2) == 0){
				printf("Erro na linha 3247");
			}
		}
		return 1;
	}
	
//VOTAR KICK

	if(strcmp(cmd, "/votarkick", true) == 0){
	    new tmp[256];
	    new string[256];
		tmp = strtok(cmdtext, idx);
	 	if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /votarkick [id do jogador/Parte do nome]");
			return 1;
		}
		if(IsStringAName(tmp)){
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(IsPlayerAdmin(giveplayerid) >= 3){
			SendClientMessage(playerid, COLOR_GRAD1, "Administradores nao podem ser tirados do jogo");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid) == 1){
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			VoteKick[giveplayerid] = 1;
			KickVote[giveplayerid] = 1;
			format(string, sizeof(string), "[VOTEKICK] %s comecou uma votacao para tirar %s do jogo, coloque /votar %d pra votar [VOTEKICK]",sendername, giveplayer,giveplayerid);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			SendClientMessageToAll(COLOR_ASSALTANTE, string);
		}
		else
		{
				format(string, sizeof(string), "   %d nao e um jogador ativo.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/votar", true) == 0){
	    new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /votar [id do jogador]");
			return 1;
		}
		if(IsStringAName(tmp)){
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (VoteKick[giveplayerid] == 0){
			SendClientMessage(playerid, COLOR_GRAD1, "Nao ha voto em progresso para esse jogador");
			return 1;
		}
		if (LastVote[playerid] == giveplayerid){
			SendClientMessage(playerid, COLOR_RED, "VocÍ pode votar somente para 1 jogador");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			KickVote[giveplayerid]++;
			LastVote[playerid] = giveplayerid;
			SendClientMessage(playerid, COLOR_GREEN, "Seu voto foi processado, obrigado por votar!");
		}
		else
		{
			format(string, sizeof(string), "%d nao e um jogador ativo.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}

//COMANDOS PARA TODOS JOGADORES

	if(strcmp(cmd, "/taxi", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_TAXISTA, "Os taxistas foram informados");
	    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == TAXISTA){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um taxi em:  %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_TAXISTA, string);
		        }
       		}
		return 1;
	}

	if(strcmp(cmd, "/taxiaereo", true)==0){
		new string[256];
		SendClientMessage(playerid, COLOR_TAXI_AEREO, "Os pilotos j· foram informados");
		for(new i=0; i<MAX_PLAYERS; i++){
			if(Profissao[i] == TAXI_AEREO){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um taxiaÈreo em:  %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_TAXI_AEREO, string);
		        }
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
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SendClientMessage(playerid,COLOR_COP_SWAT,"Os policiais foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_SWAT){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_SWAT, string);
		        }
			}
            return 1;
		}
 	}
	if(strcmp(cmd, "/192", true)==0){
		new string[256];
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		SendClientMessage(playerid,COLOR_COP_SWAT,"Os paramedicos j· foram informados");
		for(new i=0; i<MAX_PLAYERS; i++){
			if(Profissao[i] == PARAMEDICO){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um AMBUL¬NCIA nas proximidade de: %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_EMERGENCIA, string);
			}
   		}
		return 1;
	}
	if(strcmp(cmd, "/mecanico", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_MECANICO, "Reboque/Mec‚nico chamado.");
	    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == MECANICO){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um Mec‚nico em:  %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_MECANICO, string);
			}
       	}
		return 1;
	}
	if (strcmp(cmdtext, "/trancar", true)==0){
		new State;
		new Float:X;
		new Float:Y;
		new Float:Z;
		if(IsPlayerInAnyVehicle(playerid)){
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COLOR_RED,"VocÍ sÛ pode trancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				if(i != playerid && !IsPlayerAdmin(i))
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COLOR_ROSA, "VeÌculo trancado!");
			GetPlayerPos(playerid,X,Y,Z);

		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em nenhum veÌculo!");
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
				SendClientMessage(playerid,COLOR_RED,"VocÍ sÛ pode destrancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
			}
			SendClientMessage(playerid, COLOR_ROSA, "VeÌculo destrancado!");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1057,X,Y,Z);
		}
		else
		{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em nenhum veÌculo!");
		}
		return 1;
	}
	if(strcmp(cmdtext, "/presos", true)==0){
		new string[256], QtImprise;
	    SendClientMessage(playerid, COLOR_YELLOW, "Lista de presos");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Presos[i] == 1){
				format(string, sizeof(string), "%d: %s", i, PlayerName(i));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				QtImprise++;
				return 1;
			}
		}
		if(QtImprise <= 0){
		    SendClientMessage(playerid,COLOR_RED,"N„o h· nenhum preso no momento.");
		    return 1;
		} else {
			format(string,sizeof(string),"Total de presos: %d",QtImprise);
			SendClientMessage(playerid,COLOR_PALHA,string);
			return 1;
		}
	}

	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_YELLOW, "Lista de procurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Procurados[i] == 1){
				format(string, sizeof(string), "%d: %s - %d estrelas", i, PlayerName(i), GetPlayerWantedLevel(i));
				SendClientMessage(i, COLOR_YELLOW, string);
				return 1;
			}
		}
		return 1;
	}

	if(strcmp(cmd, "/horas", true) == 0) {
		new Ptmess[256];
		if(worldMinute < 10){
 			format(Ptmess, sizeof(Ptmess), "Agora s„o %d:0%d", worldTime, worldMinute);
		}
		if(worldMinute > 10){
		    format(Ptmess,sizeof(Ptmess),"Agora s„o %d:%d",worldTime,worldMinute);
		}
    	SendClientMessage(playerid,COLOR_GREEN,Ptmess);
 		return 1;
  	}

//FUN«’ES BANCO

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
				format(string, sizeof(string), "VocÍ enviou a %s(id: %d) a import‚ncia de $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "VocÍ recebeu $%d de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s acaba de transferir $%d para %s",sendername,moneys,giveplayer);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Valor inv·lido.");
			}
		}
		else {
			format(string, sizeof(string), "%d n„o est· online.", giveplayerid);
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
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem todo esse dinheiro. Ou est· tentando enviar $0.");
			return 1;
		}
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, 0 - quantidade);
			new din;
			if(mysql == 1){
    			new resultline[1024];
    			new field[128];
    			new string[255];
    			format(string, sizeof(string),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	    	samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string) == 0){
			    	printf("Erro na Linha 6063");
				}
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
					din = strval(field);
				}
			}
			if(mysql == 1){
				new string[255];
				format(string, sizeof(string), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din + quantidade, PlayerName(playerid));
				if(samp_mysql_query(string) == 0){
		 			printf("Erro na linha 6077");
				}
			}
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "VocÍ precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "todas cidades vocÍ encontra uma agÍncia, onde tiver um $ È o banco. ");
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
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode sacar esta quantia");
			return 1;
		}
		new din;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	   	samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
		    	printf("Erro na Linha 6111");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				din = strval(field);
			}
		}
		if(quantidade > din){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem esta quantia no banco");
			return 1;
		}
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, quantidade);
			if(mysql == 1){
				new string2[255];
				format(string2, sizeof(string2), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din - quantidade, PlayerName(playerid));
				if(samp_mysql_query(string2) == 0){
		 			printf("Erro na linha 6130");
				}
			}
			format(string, sizeof(string), "VocÍ retirou $%d do banco. seu saldo atual È de $%d", quantidade, din - quantidade);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "VocÍ precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos:em todas cidades tem uma agÍncia geralmente na praÁa ou av.principal.");
			return 1;
		}
	}
    if(strcmp(cmd, "/extrato", true) == 0) {
		new string[256];
		new din;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	   	samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
		    	printf("Erro na Linha 6153");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				din = strval(field);
			}
		}
        if(AreaBanco[playerid] == 1){
			format(string, sizeof(string), "VocÍ tem %d em sua conta.", din);
			SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "VocÍ precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos:em todas cidades tem uma agÍncia geralmente na praÁa ou av.principal.");
			return 1;
		}
	}

	if(strcmp(cmd, "/saldocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 5){
            SendClientMessage(playerid, COLOR_YELLOW, "Custo: $5");
			return 1;
		}
		new din;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	   	samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
		    	printf("Erro na Linha 6189");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				din = strval(field);
			}
		}
		else{
		    GivePlayerMoney(playerid, 0 - 5);
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			format(string, sizeof(string), "Mensagem de MPA Bankline: VocÍ tem %d em sua conta.", din, playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SetTimerEx("AcaoEspecial",6000,0,"dxs",playerid,COLOR_COP_SWAT,string);
			return 1;
		}
	}

	if(!strcmp(cmd,"/verlevel",true)){
	    new tmp[256],lvl;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT xl FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	   	samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
		    	printf("Erro na Linha 6217");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				lvl = strval(field);
			}
		}
	    format(tmp,256,"Seu Level de Experiencia: %d",lvl);
	    SendClientMessage(playerid,COLOR_GREEN,tmp);
	    return 1;
	}
//FUN«√O PARA SABER O ID DO VEICULO DO JOGADOR

	if(strcmp(cmd, "/idveiculo", true) == 0) {
	    new id;
	    new modelo;
	    new msg[256];
	    id = GetPlayerVehicleID(playerid);
		modelo = GetVehicleModel(id);
	    format(msg, sizeof(msg), "O id de seu veÌculo È %d", modelo);
		SendClientMessage(playerid, COLOR_GREEN, msg);
		return 1;
	}
//abastecer

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
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar.");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) == 1){
			if(GPV[GetPlayerVehicleID(playerid)] == -1){
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pode abastecer esse veÌculo!");
			}
			new currentgas = GPV[GetPlayerVehicleID(playerid)];
			if(AreaPosto[playerid] == 1){
				if(quantidade + currentgas < 100){
			    	SetTimerEx("AplicarGasosa",quantidade*1000,0,"ddd",playerid,GetPlayerVehicleID(playerid),quantidade+currentgas);
			    	TogglePlayerControllable(playerid,0);
			    	format(string, sizeof(string), "Espere o abastecimento completar. Ser„o colocados %d litros.", quantidade);
					SendClientMessage(playerid, COLOR_GREEN, string);
					GivePlayerMoney(playerid, - quantidade);
					format(string,256,"No total, seu tanque ter· %d litros de combustÌvel.",quantidade+currentgas);
					SendClientMessage(playerid,COLOR_YELLOW,string);
					return 1;
				}
				if(quantidade + currentgas > 99){
			    	new quantia;
			    	quantia = 100 - currentgas;
					SetTimerEx("AplicarGasosa",quantia*1000,0,"ddd",playerid,GetPlayerVehicleID(playerid),100);
			    	TogglePlayerControllable(playerid,0);
					format(string, sizeof(string), "Espere o abastecimento completar. Seu tanque ser· enchido com %d litros.", quantia);
					SendClientMessage(playerid, COLOR_GREEN, string);
					GivePlayerMoney(playerid, - quantia);
					return 1;
				}
				return 1;
			}
			else{
		    	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um posto, consulte o mapa no fÛrum para saber sua localizaÁ„o");
				return 1;
			}
		}
		if(IsPlayerInAnyVehicle(playerid) == 0){
			new currentgas = Petrol[playerid];
			if(AreaPosto[playerid] == 1){
				if(quantidade + currentgas < 100){
			    	SetTimerEx("AplicarGasosa",quantidade*1000,0,"ddd",playerid,GetPlayerVehicleID(playerid),quantidade+currentgas);
			    	TogglePlayerControllable(playerid,0);
			    	format(string, sizeof(string), "Espere o abastecimento completar. Ser„o colocados %d litros.", quantidade);
					SendClientMessage(playerid, COLOR_GREEN, string);
					GivePlayerMoney(playerid, - quantidade);
					format(string,256,"No total, seu tanque ter· %d litros de combustÌvel.",quantidade+currentgas);
					SendClientMessage(playerid,COLOR_YELLOW,string);
					return 1;
				}
				if(quantidade + currentgas > 99){
			    	new quantia;
			    	quantia = 100 - currentgas;
					SetTimerEx("AplicarGasosa",quantia*1000,0,"ddd",playerid,GetPlayerVehicleID(playerid),100);
			    	TogglePlayerControllable(playerid,0);
					format(string, sizeof(string), "Espere o abastecimento completar. Seu tanque ser· enchido com %d litros.", quantia);
					SendClientMessage(playerid, COLOR_GREEN, string);
					GivePlayerMoney(playerid, - quantia);
					return 1;
				}
				return 1;
			}
			else{
		    	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um posto, consulte o mapa no fÛrum para saber sua localizaÁ„o");
				return 1;
			}
		}
	}

//funÁ„o de corretor de imÛveis
	if(strcmp(cmd,"/colocargas",true)==0){
	    if(Profissao[playerid] == FRENTISTA || IsPlayerAdmin(playerid)){
			new tmp[256],plid,quantidade,string[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"Sintaxe incorreta. USO: /colocargas [id] [quantia]");
			    return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"Sintaxe incorreta. USO: /colocargas [id] [quantia]");
			    return 1;
			}
			quantidade = strval(tmp);
			if(!IsPlayerInAnyVehicle(plid)){
			    SendClientMessage(playerid,COLOR_RED,"O jogador n„o est· em um veÌculo!");
			    return 1;
			}
			if(GPV[GetPlayerVehicleID(plid)] == -1){
			    SendClientMessage(playerid,COLOR_RED,"Este veÌculo n„o pode ser abastecido!");
			    return 1;
			}
			new currentgas = GPV[GetPlayerVehicleID(plid)];
			if(quantidade + currentgas < 100){
			    GPV[GetPlayerVehicleID(plid)] = quantidade+currentgas;
			    format(string, sizeof(string), "Seu carro foi abastecido e um total de %d litros foi colocado. N„o gaste ‡ toa!", quantidade);
				SendClientMessage(plid, COLOR_GREEN, string);
				GivePlayerMoney(plid,- quantidade);
				GivePlayerMoney(playerid,quantidade);
				SendClientMessage(playerid,COLOR_YELLOW,"Miss„o cumprida!");
				TogglePlayerControllable(plid,1);
				return 1;
			}
			if(quantidade + currentgas > 99){
			    new quantia;
			    quantia = 100 - currentgas;
			    GPV[GetPlayerVehicleID(plid)] = 100;
				format(string, sizeof(string), "O tanque de seu carro est· cheio, foram colocados %d litros. N„o gaste ‡ toa!", quantia);
				SendClientMessage(plid, COLOR_GREEN, string);
				GivePlayerMoney(plid, - quantia);
				GivePlayerMoney(playerid,quantia);
    			AcrescentarExPoints(playerid,1);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Vou te dar um conselho, vocÍ nem deveria estar mexendo nesse comando...");
			return 1;
		}
	}
	if(strcmp(cmd, "/transarcama", true) == 0) {
		if(Profissao[playerid] == PROSTITUTA || IsPlayerAdmin(playerid)){
			new tmp[256];
    	    new plid;
	        tmp = strtok(cmdtext, idx);
	        plid = strval(tmp);
			if(!strlen(tmp)){
		    	SendClientMessage(playerid, COLOR_RED,"/transarcama [plid]");
				return 1;
			}
			if(AreaStrip[playerid] == 0){
				SendClientMessage(playerid, COLOR_RED,"VocÍ n„o est· na boate.");
				return 1;
			}
		   	if(!IsPlayerConnected(plid)){
	       		SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}
			if(GetPlayerMoney(plid) < 300){
	        	SendClientMessage(playerid, COLOR_RED, "Ele n„o tem dinheiro para pagar!");
				return 1;
			}
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		       	SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
			else {
				SendClientMessage(plid, COLOR_ROSA, "A prostituta est· lhe oferecendo uma transa numa cama bem confort·vel!");
				SendClientMessage(plid, COLOR_ROSA, "Se quizer transar com a prostituta basta digitar /aceitotransar se n„o /naotransar.");
				Transacama[plid] = 1;
				Prostitutacama[plid] = playerid;
				SendClientMessage(playerid, COLOR_ROSA, "A proposta foi enviada! Aguarde.");
				return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/aceitotransar", true) == 0){
		if(GetPlayerMoney(playerid) < 300){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para transar com a prostituta");
			return 1;
		}
	    if(Transacama[playerid] == 1){
	        Transacama[playerid] = 0;
	        SendClientMessage(playerid, COLOR_ROSA, "VocÍ aceitou a prosposta da prostituta!");
	        SetPlayerPos(Prostitutacama[playerid], 2206.5156,-1071.4319,1051.0058);
	        SetPlayerPos(playerid, 2205.2402,-1076.3251,1050.4844);
	        SetPlayerInterior(playerid,1);
	        SetPlayerInterior(Prostitutacama[playerid],1);
	        SendClientMessage(playerid, COLOR_ROSA2, "Para -meter- digite /meter");
	        SendClientMessage(playerid, COLOR_ROSA2, "Para sair basta entrar no CheckPoint que est· prÛximo a porta!");
	   	    SetPlayerCheckpoint(playerid,2211.9827,-1076.0026,1050.4844,3.0);
	        nCheckpointStatus[playerid] = NACAMA;
	        SetTimerEx("Prostituir",1000,0,"d",Prostitutacama[playerid]);
			return 1;
		}
		if(Transacama[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o fechou acordo com a prostituta!");
	        return 1;
	    }
	}
	if(strcmp(cmd, "/naotransar", true) == 0){
	    if(Transacama[playerid] == 1){
	        Transacama[playerid] = 0;
	        SendClientMessage(playerid, COLOR_GREEN, "VocÍ n„o aceitou a proposta!");
	        return 1;
	    }
		if(Transacama[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o fechou acordo com a prostituta!");
	        return 1;
	    }
	}
	if(strcmp(cmd, "/mudarposicao", true) == 0){
		if(Profissao[playerid] == PROSTITUTA || IsPlayerAdmin(playerid)){
			new tmp[256];
		  	tmp = strtok(cmdtext, idx);
	    	new animacao;
			if(!strlen(tmp)) {
				SendClientMessage(playerid,COLOR_ROSA,"/mudarposicao [1-4]");
				return 1;
			}
			animacao = strval(tmp);
			if(animacao < 1 || animacao > 4) {
				SendClientMessage(playerid,COLOR_ROSA,"/mudarposicao [1-4]");
				return 1;
			}
			if(animacao == 1) {
				ApplyAnimation(playerid,"benchpress","gym_bp_up_B",4.1,0,1,1,1,1);
 			} else if(animacao == 2) {
				ApplyAnimation(playerid,"MD_END","END_SC1_SMO",4.1,0,1,1,1,1);
			} else if(animacao == 3) {
				ApplyAnimation(playerid,"FINALE","FIN_Land_Car",4.1,0,1,1,1,1);
			} else if(animacao == 4) {
				ApplyAnimation(playerid,"FINALE","FIN_Land_Die",4.1,0,1,1,1,1);
			}
			return 1;
		}
		return 0;
	}
	if(strcmp(cmd, "/meter", true) == 0){
		if(GetDistanceBetweenPlayers(playerid,Prostitutacama[playerid]) > 5){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
			return 1;
		}
		SendClientMessage(playerid, COLOR_ROSA,"Para transar n„o mexe a c‚mera e fique apertando -W- respectivamente.");
		ApplyAnimation(playerid,"WAYFARER","WF_Back",4.1,0,1,1,1,1);
		return 1;
	}
	if(strcmp(cmd, "/strip-tease", true) == 0) {
		if(Profissao[playerid] == PROSTITUTA || IsPlayerAdmin(playerid)){
			new tmp[256];
    	    new plid;
	        tmp = strtok(cmdtext, idx);
	        plid = strval(tmp);
			if(!strlen(tmp)){
		    	SendClientMessage(playerid, COLOR_RED,"/strip-tease [plid]");
				return 1;
			}
			if(AreaStrip[playerid] == 0){
				SendClientMessage(playerid, COLOR_RED,"VocÍ n„o est· na boate.");
				return 1;
			}
		   	if(!IsPlayerConnected(plid)){
	       		SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}
			if(GetPlayerMoney(plid) < 200){
	        	SendClientMessage(playerid, COLOR_RED, "Ele n„o tem dinheiro para pagar!");
				return 1;
			}
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		       	SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
			else {
				SendClientMessage(plid, COLOR_ROSA, "A prostituta est· lhe oferecendo um strip tease na boate.");
				SendClientMessage(plid, COLOR_ROSA, "Se quizer assistir basta digitar /aceitostrip se n„o /recusarstrip.");
				Strip2[plid] = 1;
				Prostitutacama2[plid] = playerid;
				SendClientMessage(playerid, COLOR_ROSA, "A proposta foi enviada! Aguarde.");
				return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/aceitostrip", true) == 0){
		if(Strip2[playerid] == 1){
			Strip2[playerid] = 0;
			SendClientMessage(playerid, COLOR_ROSA,"O show vai comeÁar");
	        SetPlayerPos(Prostitutacama2[playerid], 1215.7838,-33.6097,1001.3904);
	        SetPlayerPos(playerid, 1213.3975,-34.0230,1000.9531);
	        SetPlayerInterior(playerid,3);
	        SetPlayerInterior(Prostitutacama2[playerid],3);
	        GivePlayerMoney(Prostitutacama2[playerid], 200);
			GivePlayerMoney(playerid, -200);
			SendClientMessage(playerid, COLOR_ROSA2,"VocÍ pagou para a prostituta $200 pelo strip!");
			AcrescentarExPoints(playerid,1);
	        SetTimerEx("Strip",2000,0,"d",Prostitutacama2[playerid]);
			return 1;
		}
		if(Strip2[playerid] == 0){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o fechou acordo com a prostituta!");
	   		return 1;
		}
	}
	if(strcmp(cmd, "/recusarstrip", true) == 0){
	    if(Strip2[playerid] == 1){
	        Strip2[playerid] = 0;
	        SendClientMessage(playerid, COLOR_GREEN, "VocÍ n„o aceitou a proposta!");
	        return 1;
	    }
		if(Strip2[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o fechou acordo com a prostituta!");
	        return 1;
	    }
	}

	if(strcmp(cmd, "/casa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new nome[256];
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/casa [nick]");
				return 1;
			}
			if(mysql == 1){
		        new Float:X, Float:Y, Float:Z, Float: ang;
		        new File:temp;
	      		new string[256], string2[255];
				GetPlayerPos(playerid, X, Y, Z);
				GetPlayerFacingAngle(playerid, ang);
				format(string2, sizeof(string2), "UPDATE players SET x = %f, y = %f, z = %f, ang = %f WHERE nickname = '%s '", X, Y, Z, ang, tmp);
        		samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string2) == 0){
		 			printf("Erro na linha 6570");
				}
			    SendClientMessage(playerid, COLOR_GREEN, "Casa vendida");
				printf("%s acaba de vender um imÛvel para %s",PlayerName(playerid),tmp);
				format(string, sizeof(string), "%f, %f, %f, //%s\r\n", X, Y, Z, nome);
  				temp = fopen("pickups.rpg", io_append);
  	 			fwrite(temp, string);
				fclose(temp);
				AcrescentarExPoints(playerid,1);
     	    	return 1;
    	    } else {
    	        SendClientMessage(playerid,COLOR_RED,"ERRO NA BASE DE DADOS");
    	        return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o!");
			return 1;
		}
	}

//HOTEL
	if(strcmp(cmd, "/hotel", true) == 0) {
		if(AreaHotel[playerid] == 1){
			if(GetPlayerMoney(playerid) < 1500){
       			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem com vocÍ $1500 para pagar.");
				return 1;
			} else {
				if(mysql == 1) {
	    			new Float:X, Float:Y, Float:Z, Float:ang;
	    			GetPlayerPos(playerid, X, Y, Z);
	    			GetPlayerFacingAngle(playerid,ang);
	    			new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET x = %f, y = %f, z = %f, ang = %f WHERE nickname = '%s '", X, Y, Z, ang, PlayerName(playerid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
		 				printf("Erro na linha 6607");
					}
	    			GivePlayerMoney(playerid,-1500);
	    			SendClientMessage(playerid, COLOR_GREEN, "Agora vocÍ est· hospedado aqui. Obrigado por escolher este Hotel.");
		           	SendClientMessage(playerid, COLOR_GREEN, "VocÍ ficar· hospedado atÈ ter um emprego e condiÁıes de comprar sua casa.");
					return 1;
        		}
			}
		} else {
    		SendClientMessage(playerid, COLOR_RED, "Ei...vocÍ n„o est· em um Hotel.");
       		SendClientMessage(playerid, COLOR_WHITE, "Procure na avenida principal de Fort Carson, onde");
       		SendClientMessage(playerid, COLOR_WHITE, "tiver uma casa verde com a inscriÁ„o Hotel na tela, h· vagas");
    		return 1;
       	}
    }

//pagar corretor ou vendedor

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
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem esse dinheiro! Ou n„o est· querendo pagar de forma justa.");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    new lucros;
				lucros = pagamento + pagamento/10;
 			    GivePlayerMoney(plid, lucros);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "VocÍ vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COLOR_GREEN, string);
				return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ est· tentando pagar alguem que n„o È coretor e nem vendedor!");
			return 1;
		}
	}

	if(strcmp(cmd, "/ci", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[5];
	    new prof, skin;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Documentos mostrados.");
			return 1;
		}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
			if(mysql == 1){
    			new resultline[1024];
    			new contador;
    			new field[128], field2[256];
    			new string2[256];
				format(string2, sizeof(string2),"SELECT skin,habaerea,habterre,habnauti,porte,passport FROM players WHERE nickname = '%s '", PlayerName(playerid));
 				samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string2) == 0){
		    		printf("Erro na Linha 6689");
				}
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline);
					skin = strval(field2);
					while(samp_mysql_strtok(field2, "|", "")==1)
					{
						contador++;
						contador%=5;
						if(contador == 1){
					    	hab[2] = strval(field2);
						}
					
						if(contador == 2){
							hab[0] = strval(field2);
						}

						if(contador == 3){
							hab[1] = strval(field2);
						}

						if(contador == 4){
							hab[3] = strval(field2);
						}

						if(contador == 0){
							hab[4] = strval(field2);
						}
					}
				}
			}
			format(string, sizeof(string), "Identidade de: %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Skin :: %d", skin);
			SendClientMessage(plid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Prof de %s :: %d", PlayerName(plid), ProfExtName[prof]);
			SendClientMessage(plid, COLOR_YELLOW, string);
			if(hab[0] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o de Carros e Motos: N√O");
			}
			if(hab[0] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o N·utica: N√O");
			}
			if(hab[1] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o N·utica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o AÈrea: N√O");
			}
			if(hab[2] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o AÈrea: SIM");
			}
            if(hab[3] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT1: N√O");
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT2: N√O");
			}
			if(hab[3] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT1: SIM");
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT2: N√O");
			}
			if(hab[3] == 2){
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT1: SIM");
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT2: SIM");
			}
			if(hab[4] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "Passaporte: N√O");
			}
			if(hab[4] == 1){
			    SendClientMessage(plid, COLOR_YELLOW, "Passaporte: SIM");
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
	
// AGRICULTURA
    if(strcmp(cmd, "/plantarmilho", true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
	        if(AreaFazenda[playerid] == 0){
	            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na FAZENDA.");
				return 1;
			} else {
			    if(FazendaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COLOR_RED, "A colheita ainda n„o est· pronta... AGUARDE.");
					return 1;
				} else {
					SendClientMessage(playerid, COLOR_GREEN, "Espere a colheita e o ensacamento para poder ir vender.");
			    	FazendaInProgress[playerid] = 1;
			    	SetTimerEx("Fazenda",36000,0,"d",playerid);
			    	AcrescentarExPoints(playerid,1);
					return 1;
				}
            }
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/vendermilho",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na Fazenda.");
				return 1;
			} else {
			    if(QtMilho[playerid] == 0){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem milho para vender.");
					return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtMilho[playerid]*200;
					format(msg, sizeof(msg),"VocÍ vendeu %d sacas (%d Kg) de milho por $200 cada e faturou $%d com a venda.",QtMilho[playerid],QtMilho[playerid]*60,quantia);
					SendClientMessage(playerid,COLOR_WHITE,msg);
					GivePlayerMoney(playerid,quantia);
					QtMilho[playerid] = 0;
					AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/tirarleite", true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
	        if(Leite[playerid] == 0){
	            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· no CURRAL.");
				return 1;
			} else {
			    if(LeiteInProgress[playerid] == 1){
				    SendClientMessage(playerid, COLOR_RED, "VocÍ t· tirando o leite da vaca. Aguarde");
					return 1;
				} else {
				    ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 1, 0, 0, 0);
					SendClientMessage(playerid, COLOR_AGRICULTOR, "CÍ t· tirando o leite pera um pedaÁo aÌ.");
					SendClientMessage(playerid, COLOR_AGRICULTOR, "CÍ j· sai de baixo da vaca. Calminha sÙ!");
			    	LeiteInProgress[playerid] = 1;
			    	SetTimerEx("LeiteA",36000,0,"d",playerid);
			    	AcrescentarExPoints(playerid,1);
					return 1;
				}
            }
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/venderleite",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na Venda do Milho/Leite");
				return 1;
			} else {
			    if(QtLeite[playerid] == 0){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem leite para vender!");
					return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtLeite[playerid]*200;
					format(msg, sizeof(msg),"VocÍ vendeu %d engradados (%d Lts) de leite por $200 cada e faturou $%d com a venda.",QtLeite[playerid],QtLeite[playerid]*60,quantia);
					SendClientMessage(playerid,COLOR_WHITE,msg);
					GivePlayerMoney(playerid,quantia);
					QtLeite[playerid] = 0;
					AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}
//FUN«√O DE INSTRUTOR

	if(strcmp(cmd, "/habaerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/aero [id].");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET habaerea = 1 WHERE nickname = '%s '", PlayerName(plid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 6894");
					}
				}
			    SendClientMessage(playerid, COLOR_GREEN, "HabilitaÁ„o de direÁ„o aerea concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "VocÍ recebeu a habilitaÁ„o de direÁ„o aerea.");
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a executar este comando.");
			return 1;
		}
	}


	if(strcmp(cmd, "/habterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/terrestre [id].");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET habterre = 1 WHERE nickname = '%s '", PlayerName(plid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 6930");
					}
				}
			    SendClientMessage(playerid, COLOR_GREEN, "HabilitaÁ„o de direÁ„o terrestre concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "VocÍ recebeu a habilitaÁ„o de direÁ„o de carros e motos.");
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a executar este comando.");
			return 1;
		}
	}

	if(strcmp(cmd, "/habnautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/nautica [id].");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET habnauti = 1 WHERE nickname = '%s '", PlayerName(plid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 6964");
					}
				}
			    SendClientMessage(playerid, COLOR_GREEN, "HabilitaÁ„o de direÁ„o n·utica concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "VocÍ recebeu a habilitaÁ„o de direÁ„o n·utica.");
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a executar este comando.");
			return 1;
		}
	}



//taxi aÈreo

	if(strcmp(cmd, "/artaxi", true) == 0 && IsPlayerConnected(playerid)) {
        if(Profissao[playerid] == TAXI_AEREO){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/artaxi [id]");
				return 1;
			}
        	plid = strval(tmp);
          	if((GetPlayerVehicleID(playerid) ==1 && GetPlayerVehicleID(plid) ==1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)||(GetPlayerVehicleID(playerid) ==2 && GetPlayerVehicleID(plid) ==2 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)){
	            SendClientMessage(playerid, COLOR_GREEN, "A viagem aÈrea comeÁou a ser tarifada");
            	SendClientMessage(plid, COLOR_GREEN, "A viagem aÈrea comeÁou a ser tarifada");
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
                AcrescentarExPoints(playerid,1);
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, " Ei...vocÍ nao est· pilotando um helicÛptero de taxiaÈreo.");
			    SendClientMessage(playerid, COLOR_RED, " Os helicÛpteros encontram-se ao lado da prefeitura.");
             	RemovePlayerFromVehicle(playerid);
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È piloto de taxi aÈreo.");
			return 1;
		}
    }

//funÁ„o juiz

	if(strcmp(cmd, "/veredicto", true)==0){
		if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
	    	strmid(tmp, cmdtext, 10, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/veredicto [ nome do reu e sentenÁa ]");
				return 1;
			}
	 		SendClientMessage(playerid, COLOR_JUIZ, "VocÍ fez a sentenÁa no tribunal e determinou.");
			format(string, sizeof(string), "O Juiz Dr.%s sentenciou %s ", PlayerName(playerid), tmp);
			SendClientMessageToAll(COLOR_JUIZ, string);
			AcrescentarExPoints(playerid,1);
			return 1;
		} else {
	       SendClientMessage(playerid, COLOR_RED, " Ei...VocÍ n„o È Juiz, sua profissao È outra");
 	       return 1;
		}
	}
	if(strcmp(cmd, "/passaporte", true) == 0) {
	    if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/passaporte[id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET passport = 1 WHERE nickname = '%s '", PlayerName(plid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 7054");
					}
				}
			   	SendClientMessage(playerid, COLOR_JUIZ, "Passaporte nacional concedido.");
			   	SendClientMessage(plid, COLOR_GREEN, "O juiz lhe concedeu passaporte, agora vocÍ tem");
               	SendClientMessage(plid, COLOR_GREEN, "livre circulaÁ„o alem dos limites de Fort Carson.");
               	AcrescentarExPoints(playerid,1);
			   	return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a conceder porte de armas.");
			return 1;
		}
	}

//SHERIFF

	if (strcmp(cmd, "/ordem", true)==0){
		if(Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
		    strmid(tmp, cmdtext, 8, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/ordem [ qual ordem aos oficiais? ]");
				return 1;
			}
		    SendClientMessage(playerid, COLOR_GREEN, "VocÍ enviou uma ordem aos policiais de Fort Carson.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		       if(Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO ||Profissao[i] == JUIZ || Profissao[i] == COP_SWAT){
					format(string, sizeof(string), "O Xerife %s ordenou aos policiais: %s ", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_RODOVIARIO, string);
		        }
			}
			return 1;
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...vocÍ n„o È Xerif,sua profissao È outra");
    	}
	}
	if(strcmp(cmd, "/porte1", true) == 0) {
	    if(Profissao[playerid] == SHERIFF   || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/porte1 [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET porte = 1 WHERE nickname = '%s '", PlayerName(plid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 7112");
					}
				}
			    SendClientMessage(playerid, COLOR_JUIZ, "Porte de armas CAT 1, concedido.");
			    SendClientMessage(plid, COLOR_GREEN, "VocÍ recebeu porte de armas CAT1, armas leves.");
                SendClientMessage(plid, COLOR_GREEN, "digite /portedearmas e veja quais armas vocÍ pode usar.");
                AcrescentarExPoints(playerid,1);
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a conceder porte de armas.");
			return 1;
		}
	}
	if(strcmp(cmd, "/porte2", true) == 0) {
	    if(Profissao[playerid] == SHERIFF   || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/porte2 [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET porte = 2 WHERE nickname = '%s '", PlayerName(plid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 7146");
					}
				}
			    SendClientMessage(playerid, COLOR_TAXI_AEREO, "Porte de armas CAT 2, concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "VocÍ recebeu porte de armas CAT2, armas pesadas");
                SendClientMessage(plid, COLOR_GREEN, "digite /portedearmas e veja quais armas vocÍ pode usar.");
                AcrescentarExPoints(playerid,1);
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a conceder porte de armas.");
			return 1;
		}
	}
 	if(strcmp(cmd, "/portedearmas", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "Lista de armas permitidas em Fort Carson-SA. S„o duas categorias armas leves e armas pesadas");
	    SendClientMessage(playerid, COLOR_GREEN, "qualquer cidad„o de Fort Carson que usar armas sem porte ser· preso, e aguardar· o julgamento.");
	    SendClientMessage(playerid, COLOR_PALHA, "CAT1:armas leves: Pistola Colt 45 c/ ou sem silenciador,Country shotgun(de cano longo).");
	    SendClientMessage(playerid, COLOR_PALHA, "Desert eagle, Rifle.");
		SendClientMessage(playerid, COLOR_PALHA, "CAT2: AK47 Assault Rifle,M4 Assalut Rifle,MP5,Combat Knife,SPAZ-12 Shotgun ");
    	SendClientMessage(playerid, COLOR_PALHA, "Decreto n∫1925/2007 armas permitidas SHERIFF  Smurf. Fort Carson /SA");
		return 1;
	}
// FunÁ„o> jornalista
	if(strcmp(cmd,"/noticia",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COLOR_RED,"/noticia [texto]");
				return 1;
			} else {
			    format(msg,sizeof(msg),"NotÌcias de San Andreas, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    SendClientMessageToAll(COLOR_ROSA,tmp);
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}

	}
// funÁıes do advogado

	if(strcmp(cmd, "/defesa", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/defesa [id] [ quantia ex:5000k ]");
			return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/defesa [id] [ quantia ex:5000k ]");
			return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == ADVOGADO){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem esse dinheiro! verifique se tem no banco esta quantia");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/3);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "VocÍ defendeu o rÈu e cobrou pela causa $ %d  e recebeu $ %d pelos seus honor·rios", pagamento, pagamento/3);
				SendClientMessage(plid, COLOR_GREEN, string);
				AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...ele n„o È advogado");
		    return 1;
		}
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
	}

	if(strcmp(cmd, "/processo", true)==0){
		if(Profissao[playerid] == ADVOGADO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
		    strmid(tmp, cmdtext, 10, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/processo [ nome do reu e descriÁ„o da causa ]");
				return 1;
			}
			SendClientMessage(playerid, COLOR_ADVOGADO, "VocÍ fez a defesa do seu cliente e o processo est· em andamento, aguarde a sentenÁa do juiz");
			for(new i=0; i<MAX_PLAYERS; i++){
				if(Profissao[i] == JUIZ || IsPlayerAdmin(playerid)){
					format(string, sizeof(string), "O Dr.%s entrou com um petiÁ„o em defesa do rÈu  %s ", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_JUIZ, string);
					AcrescentarExPoints(playerid,1);
		    	}
			}
			return 1;
		} else {
			SendClientMessage(playerid, COLOR_RED, " Ei...vocÍ n„o È advogado,sua profissao È outra");
			return 1;
		}
	}

//ALUGUEL DE CARROS:

    if(strcmp(cmd, "/alugarcarro", true) == 0) {
      	if(Profissao[playerid] == LOCADOR_DE_CARROS || IsPlayerAdmin(playerid)){
	        new tmp[256];
    	    new plid;
	        tmp = strtok(cmdtext, idx);
	        plid = strval(tmp);

			if(!strlen(tmp)){
		    	SendClientMessage(playerid, COLOR_RED,"/alugarcarro [plid]");
				return 1;
			}
			if(Profissao[plid] == LOCADOR_DE_CARROS){
		    	SendClientMessage(playerid, COLOR_RED,"VocÍ È vendedor n„o pode alugar para vocÍ!");
				return 1;
			}
			if(JogadorNoCarro[plid] != 1){
				SendClientMessage(playerid,COLOR_RED, "Ele n„o est· no carro, peÁa para ele entra no carro a se alugado!");
				return 1;
			}

	  		if(TempoAlugar[plid] > 0 && CarroAlugado[plid] == 1){
				SendClientMessage(playerid,COLOR_RED, "Ele j· est· com um carro alugado!");
				return 1;
			}

			if(!IsPlayerConnected(plid)){
	        	SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}

			if(GetDistanceBetweenPlayers(playerid,plid) > 20){
			    SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}

			else {
				SendClientMessage(plid, COLOR_GREEN, "Alguem est· lhe oferecendo o carro que vocÍ est·,");
				SendClientMessage(plid, COLOR_GREEN, "se quizer alug·-lo, digite: '/alugar' se n„o: '/naoalugar'");
				OferecerCarro[plid] = 1;
				SendClientMessage(playerid, COLOR_GREEN, "Espere o jogador digitar /alugar para concretizar a oferta.");
				AluguelFornecedor[plid] = playerid;
				return 1;
			}
		}
	}
	if(strcmp(cmd, "/alugar", true) == 0){
	    if(OferecerCarro[playerid] == 1){
	        new string[256];
	        CarroAlugado[playerid] = 1;
	        OferecerCarro[playerid] = 0;
	        TempoAlugar[playerid] = 1;
	        TogglePlayerControllable(playerid, 1);
	        SendClientMessage(playerid, COLOR_GREEN, "VocÍ alugou o carro, corra porque o tempo est· passando!");
	        format(string, sizeof(string), "O Jogador %s aceitou sua oferta e com isso vocÍ recebeu $1000 pela locaÁ„o.",PlayerName(playerid));
	        SendClientMessageCarros(COLOR_LOCADOR_DE_CARROS, string);
	        GivePlayerMoney(AluguelFornecedor[playerid], 1000);
	        SetTimerEx("TempoAlugando",300000,0,"d",playerid);
	        AcrescentarExPoints(playerid,1);
	        return 1;
		}
		if(OferecerCarro[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "NinguÈm est· lhe oferencendo um carro nesse momento!!");
	        return 1;
	    }
	}
	if(strcmp(cmd, "/naoalugar", true) == 0){
	    if(OferecerCarro[playerid] == 1){
	        OferecerCarro[playerid] = 0;
	        SendClientMessage(playerid, COLOR_GREEN, "Pronto! VocÍ n„o alugou o carro!");
			RemovePlayerFromVehicle(playerid);
	        TogglePlayerControllable(playerid, 1);
	        return 1;
	    }
		if(OferecerCarro[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "NinguÈm est· lhe oferencendo um carro nesse momento!!");
	        return 1;
	    }
	}

	if(strcmp(cmd, "/sair", true) == 0){
	    if(JogadorNoCarro[playerid] == 1){
	        SendClientMessage(playerid, COLOR_GREEN, "Saiu do carro de aluguel!");
			RemovePlayerFromVehicle(playerid);
	        TogglePlayerControllable(playerid, 1);
	        return 1;
	    }
		if(JogadorNoCarro[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "N„o est· no carro de aluguel!!");
	        return 1;
	    }
	}
//TRANSPORTADOR DE VALORES
	if(strcmp(cmd, "/transportar", true) == 0) {
		if(Profissao[playerid] == TRANSPORTE_DE_VALORES || IsPlayerAdmin(playerid)){
		     if(AreaForte[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == VEH_CARROFORTE){
					   if(Carga[playerid] == 0){
				    	SendClientMessage(playerid,COLOR_GREEN,"VeÌculo Forte Carregado!");
				    	SendClientMessage(playerid,COLOR_GREEN,"Para deixar a grana v· atÈ o banco mais prÛximo!");
				    	Carga[playerid] = 1;
						return 1;
						} else {
				        SendClientMessage(playerid,COLOR_RED,"Carro Forte Carregado");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um CARRO FORTE");
					return 1;
				}
	     	   } else {
	            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na ·rea de carga");
				return 1;
			}
	    }
	    else{
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
	    	return 1;
	    }
	}
	if(strcmp(cmd,"/depositargrana",true) == 0){
	    new msg[256];
	    if(Profissao[playerid] == TRANSPORTE_DE_VALORES || IsPlayerAdmin(playerid)){
	        if(AreaBanco[playerid] == 1){
	            if(Carga[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"Seu veÌculo n„o tem grana!");
					return 1;
				} else {
				    Carga[playerid] = 0;
				    SendClientMessage(playerid,COLOR_GREEN,"Dinheiro depositado.");
				    GivePlayerMoney(playerid,100);
				    AcrescentarExPoints(playerid,1);
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em nenhum BANCO");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
	        format(msg,sizeof(msg),"%d usou o comando /depositargrana sem ser transportador.",udb_decode(PlayerName(playerid)));
	        writelog(msg);
			return 1;
		}
	}
	if(strcmp(cmd, "/escolta", true) == 0) {
	    if(Profissao[playerid] == TRANSPORTE_DE_VALORES || IsPlayerAdmin(playerid)){
	   		if(Carga[playerid] == 1){
	       	    new string[256];
	       	    SetTimerEx("AcaoEspecial",1,0,"dd",playerid,SPECIAL_ACTION_USECELLPHONE);
            	SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
				SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "Escolta solicitada!");
				format(string,sizeof(string),"O transportador de valores %s precisa de escolta para transportar o dinheiro",name);
				SendClientMessagePolicia(COLOR_COP_SWAT,string);
				return 1;
			}
		}
	}
///FUN’ES PARA POLICIAIS
	if(strcmp(cmd, "/reforco", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
            new string[256];
            SetTimerEx("AcaoEspecial",1,0,"dd",playerid,SPECIAL_ACTION_USECELLPHONE);
            SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SendClientMessage(playerid, COLOR_COP_SWAT, "PolÌcia avisada!");
			format(string,sizeof(string),"%s precisa de reforÁo nas proximidades de:  %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
			SendClientMessagePolicia(COLOR_COP_SWAT, string);
			ApplyAnimation(playerid,"PED", "phone_out", 4.0, 0, 0, 0, 0, 0);
			return 1;
		}
	}
	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new distancia;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/prender [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
	    		distancia = GetDistanceBetweenPlayers(playerid, plid);
			    if(distancia > 15){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
					return 1;
				} else {
					Presos[plid] = 1;
					if(mysql == 1){
						new string2[255];
						format(string2, sizeof(string2), "UPDATE players SET prisao = 1 WHERE nickname = '%s '", PlayerName(plid));
        				samp_mysql_select_db("infernusgroup01");
						if(samp_mysql_query(string2) == 0){
			 				printf("Erro na linha 7471");
						}
					}
					LogarPlayer(plid);
					format(string, sizeof(string), "VocÍ foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEGURAN«A, string);
      		        SendClientMessage(playerid, COLOR_GREEN, "Pris„o concluida");
          		  	GameTextForPlayer(plid, "~r~ preso!", 5000,0);
					format(string, sizeof(string), "%s prendeu %s", PlayerName(playerid), PlayerName(plid));
					SendClientMessageJuiz(COLOR_JUIZ, string);
					AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È policial");
			return 1;
		}
	}

	if(strcmp(cmd, "/exame", true) == 0) {
	    if(Profissao[playerid] == COP_NARCOTICOS || IsPlayerAdmin(playerid)){
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
			        SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_YELLOW,"Resultados do exame anti-dopping:");
				    format(msg, sizeof(msg), "Heroina : %d doses",Heroina[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    format(msg, sizeof(msg), "Maconha : %d doses",Maconha[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    format(msg, sizeof(msg), "CocaÌna : %d doses",Cocaina[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    SendClientMessage(playerid,COLOR_YELLOW,"Exame anti-dopping concluÌdo!");
					return 1;
				}
			}
			else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}
    if(strcmp(cmd, "/fianca", true) == 0) {
        if(Presos[playerid] == 0){
            SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· preso!");
			return 1;
		} else {
			new din, skin;
			if(mysql == 1){
    			new resultline[1024];
    			new field[128], field2[128];
    			new string2[255];
    			format(string2, sizeof(string2),"SELECT skin,bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	   		samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string2) == 0){
		    		printf("Erro na Linha 7545");
				}
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
					skin = strval(field);
					while(samp_mysql_strtok(field2, "|", "")==1) //From 2nd call to the end you MUST call strtok without resultline
					{
			    		din = strval(field2);
   					}
				}
			}
		    if(din < 1500){
		        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem toda essa quantia no banco!");
		    	return 1;
		    } else {
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET bankmoney = %d,prisao = 0 WHERE nickname = '%s '", din - 1500, PlayerName(playerid));
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 7566");
					}
				}
				Presos[playerid] = 0;
				PrisaoTimer[playerid][1]=0;
				KillTimer(PrisaoTimer[playerid][0]);
				SetSpawnInfo(playerid,1,skin,-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				SpawnPlayer(playerid);
				SendClientMessage(playerid, COLOR_GREEN, "VocÍ pagou a fianÁa no valor de $1500 e foi solto.");
				return 1;
			}
		}
	}

	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
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
				    SendClientMessage(playerid,COLOR_RED,"O jogador n„o est· preso!");
					return 1;
				} else {
					if(mysql == 1){
						new string2[255];
						format(string2, sizeof(string2), "UPDATE players SET wantedlvl = 0,prisao = 0 WHERE nickname = '%s '", PlayerName(plid));
        				samp_mysql_select_db("infernusgroup01");
						if(samp_mysql_query(string2) == 0){
			 				printf("Erro na linha 7601");
						}
					}
					new skin;
					if(mysql == 1){
    					new resultline[1024];
    					new field[128];
    					new string[255];
    					format(string, sizeof(string),"SELECT skin FROM players WHERE nickname = '%s '", PlayerName(plid));
						if(samp_mysql_query(string) == 0){
						    printf("Erro na Linha 7611");
						}
						samp_mysql_store_result();
						while(samp_mysql_fetch_row(resultline)==1)
						{
							samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
							skin = strval(field);
						}
					}
				    Presos[plid] = 0;
				    SetSpawnInfo(plid,0,skin,-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				    SpawnPlayer(plid);
				    SendClientMessage(plid,COLOR_GREEN,"VocÍ foi solto, mas se cometer mais crimes, pagar· novamente.");
	   				PrisaoTimer[playerid][1]=0;
					KillTimer(PrisaoTimer[playerid][0]);
				    format(tmp,sizeof(tmp),"VocÍ foi solto por %s",PlayerName(playerid));
				    SendClientMessage(plid,COLOR_GREEN,tmp);
				    SendClientMessage(playerid,COLOR_GREEN,"Libertado");
				    Contrabando[playerid] = 0;
					Receita[playerid] = 0;
					SetPlayerWantedLevel(plid, 0);
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È policial");
			return 1;
		}
	}
	if(strcmp(cmd, "/cone", true) == 0) {
 		if(Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || IsPlayerAdmin(playerid)){
 		    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
 		        SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar fora do carro");
 		        return 1;
 		    }
          	new Float:X, Float:Y, Float:Z;
            GetPlayerPos(playerid,X, Y, Z);
			CreateObject(1238,X, Y, Z, 0, 0, 0);
            SendClientMessage(playerid, COLOR_GREEN, "Voce adicionou um cone neste local");
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Voce nao È Policial Rodoviario");
            return 1;
		}
	}
	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || IsPlayerAdmin(playerid)){
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
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· querendo multar de forma justa.");
				return 1;
			}
			distancia = GetDistanceBetweenPlayers(playerid, plid);
		 	if(distancia > 15){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "VocÍ recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(playerid, COLOR_GREEN, "Multa dada.");
				new din;
				if(mysql == 1){
    				new resultline[1024];
    				new field[128];
    				new string2[255];
    				format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(plid));
    	   			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
		    			printf("Erro na Linha 7702");
					}
					samp_mysql_store_result();
					while(samp_mysql_fetch_row(resultline)==1)
					{
						samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
						din = strval(field);
					}
				}
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din - quant, PlayerName(plid));
					if(samp_mysql_query(string2) == 0){
		 				printf("Erro na linha 7715");
					}
				}
				GivePlayerMoney(playerid, 50);
				AcrescentarExPoints(playerid,1);
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È policial");
			return 1;
		}
	}
	if (strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS ||	 IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/procurar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 1;
                format(string, sizeof(string), "O Jogador %s foi colocado na lista de procurados pelo oficial: %s",PlayerName(plid),PlayerName(playerid));
				SendClientMessageToAll(COLOR_COP_MILITAR,string);
				format(string, sizeof(string), "VocÍ est· sendo perseguido pela policia, VocÍ foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SetPlayerWantedLevel(plid,GetPlayerWantedLevel(plid)+1);
				if(mysql == 1){
					new wantedlvl;
    				new resultline[1024];
    				new field[128];
    				new string2[255];
    				format(string2, sizeof(string2),"SELECT wantedlvl FROM players WHERE nickname = '%s '", PlayerName(plid));
        			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
					    printf("Erro na Linha 7757");
					}
					samp_mysql_store_result();
					while(samp_mysql_fetch_row(resultline)==1)
					{
						samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
						wantedlvl = strval(field);
					}
					new string3[255];
					format(string3, sizeof(string3), "UPDATE players SET wantedlvl = %d WHERE nickname = '%s '", wantedlvl+1, PlayerName(plid));
					if(samp_mysql_query(string3) == 0){
			 			printf("Erro na linha 7753");
					}
				}
				return 1;
			} else {
	            SendClientMessage(playerid, COLOR_RED, "Comando desconhecido pelo mode.");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È policial");
			return 1;
		}
	}

	if (strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/desprocurar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 0;
			 	format(string, sizeof(string), "O Jogador %s foi removido da lista de procurados pelo oficial: %s",plid,PlayerName(playerid));
				SendClientMessageToAll(COLOR_COP_MILITAR,string);
				SendClientMessage(plid, COLOR_GREEN, "VocÍ foi retirado da lista de procurados");
				SetPlayerWantedLevel(plid, 0);
				if(mysql == 1){

					new string3[255];
					format(string3, sizeof(string3), "UPDATE players SET wantedlvl = '0 ' WHERE nickname = '%s '", PlayerName(plid));
					if(samp_mysql_query(string3) == 0){
			 			printf("Erro na linha 7742");
					}
				}
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}
//Roubo ao banco
    if(strcmp(cmd, "/roubar", true) == 0) {
	    if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
        	if(AreaBanco[playerid] == 1){
				if(TempoAssalto[playerid] == 0){
				    new string[256];
					GivePlayerMoney(playerid, 1000);
					SendClientMessage(playerid, COLOR_ASSALTANTE, "Roubo feito!");
					SendClientMessagePolicia(COLOR_COP_SWAT, string);
					TempoAssalto[playerid]++;
					AcrescentarExPoints(playerid,1);
					SetTimerEx("Assalto",600000,false,"%d",playerid);
					return 1;
				} else {
					SendClientMessage(playerid,COLOR_RED,"VocÍ j· assaltou espere a poeira baixar para assaltar novamente!");
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· na ·rea de um banco!");
			    return 1;
			}
		} else {
	    	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È assaltante!");
			return 1;
		}
	}

	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || IsPlayerAdmin(playerid)){
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
			        SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
					return 1;
				}
				if(distancia <= 20){
					format(string, sizeof(string), "O exame do bafÙmetro mostrou: %d mg de alcool no sangue do suspeito.", Bebida[plid]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					SendClientMessage(plid, COLOR_GRAY, string);
					return 1;
				}
			} else {
	            SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È policial");
			return 1;
		}
	}
//Vendedor de Armas

	if(strcmp(cmd, "/venderarma", true) == 0) {
        if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, weaponid;
			new venda;
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
			if(Profissao[plid] == VENDEDOR_DE_ARMAS){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender armas para vocÍ!");
				return 1;
			}
			weaponid= strval(tmp);
			if(weaponid< 1 || weaponid > 16 && weaponid< 22 || weaponid > 33){
			    SendClientMessage(playerid, COLOR_RED, "0-46 s„o os ids de armas.");
				return 1;
			}
			else{
			   if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					 if(IsPlayerConnected(plid)){
     				 if(GetPlayerMoney(plid) >= valorarma[weaponid]){
					 Armas[plid] =weaponid;
      				 GivePlayerWeapon(plid, weaponid, armamuni[weaponid]);
					 format(string, sizeof(string), "VocÍ compro a arma: %s pelo valor de %d",weaponname[weaponid], valorarma[weaponid] );
   			         SendClientMessage(plid, COLOR_JUIZ, string);
   			         venda = valorarma[weaponid] + valorarma[weaponid]/10;
   			         GivePlayerMoney(playerid, venda);
   			         GivePlayerMoney(plid, 0-valorarma[weaponid]);
			         SendClientMessage(playerid, COLOR_GREEN, "Arma vendida!!");
			         AcrescentarExPoints(playerid,1);
				 	 return 1;
					 }
					 else{
						SendClientMessage(playerid, COLOR_RED, "O jogador n„o tem dinheiro para pagar a arma!");
						return 1;
					 }
		 			 }
					 else{
					 SendClientMessage(playerid, COLOR_RED, "Chegue mais perto para entregar a arma.");
					 return 1;
					 }
				 }
			 }
			if(Profissao[playerid] != VENDEDOR_DE_ARMAS){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È vendedor de armas!");
			return 1;
		}
	}
}
	if(strcmp(cmd, "/sequestrar", true) == 0) {
	    if(Profissao[playerid] == ASSASSINO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
	    	new distancia;
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/sequestrar [id]");
				return 1;
			}
	        plid = strval(tmp);
         	if(Sequestro[plid] == 1) {
				SendClientMessage(playerid, COLOR_RED, "Esta Pessoa j· est· Sequestrada!");
				return 1;
			}
			if(Cativeiro[plid] == 1) {
				SendClientMessage(playerid, COLOR_RED, "Esta Pessoa j· est· no Cativeiro!");
				return 1;
			}
			if(Profissao[plid] == ASSASSINO){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode se auto-sequestrar!");
				return 1;
			}
	        if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1) {
		    	if(distancia > 20) {
		    	    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");				return 1;
				}
				if(distancia <= 20 && Sequestro[plid] != 1 && Cativeiro[plid] != 1) {
   					SendClientMessage(playerid, COLOR_GREEN, "Pessoa Sequestrada!");
					Sequestro[plid] = 1;
					AcrescentarExPoints(playerid,1);
					SendClientMessage(plid, COLOR_RED, "VocÍ est· sendo Perseguido para fugir digite /fugir!");
					SendClientMessage(plid, COLOR_RED, "Se n„o FUGIR ou Matar o SEQUESTRADOR ser· sequestrado em 10 minutos!");				return 1;
				}			return 1;
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador no est· conectado/logado");
			}		return 1;
		}
		if(Profissao[playerid] != ASSASSINO){
		    SendClientMessage(playerid, COLOR_GREEN, "VocÍ n„o È Assasino!");		return 1;
		}	return 1;
	}

    if(strcmp(cmd, "/resgate", true) == 0 && Cativeiro[playerid] == 1) {
		Sequestro[playerid] = 0;
		Cativeiro[playerid] = 0;
		LogarPlayer(playerid);
		SendClientMessage(playerid, COLOR_GREEN, "VocÍ pagou o resgate no valor de $5000 e foi solto.");
		new din;
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255];
    		format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	   	samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
		    	printf("Erro na Linha 8012");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				din = strval(field);
			}
			new string3[255];
			format(string3, sizeof(string3), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din - 5000, PlayerName(playerid));
			if(samp_mysql_query(string3) == 0){
		 		printf("Erro na linha 8023");
			}
		}
		for(new i; i < MAX_PLAYERS; i++)
   		{
   		    if(Profissao[i] == ASSASSINO){
				GivePlayerMoney(i, 5000);
				SendClientMessage(i, COLOR_GREEN, "VocÍ recebeu a fuga no valor de $5000!");
			}
		}	return 1;
	}

	//celular
	if(strcmp(cmd, "/roubarcelular", true) == 0) {
	    if(Profissao[playerid] == ASSASSINO || IsPlayerAdmin(playerid)) {
	        new plid,numeroalvo,tmp[256];
			tmp=strtok(cmdtext,idx);
            if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/roubarcelular [id]");
				return 1;
			}
			plid=strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado!");
			    return 1;
			}
			if(GetDistanceBetweenPlayers(playerid,plid) > 25){
			    SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar o roubo");
			    return 1;
			}
  			if(mysql == 1){
				new numero, resultline[1024], field[128], stringv[255], stringd[256];
				format(stringd, sizeof(stringd),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(plid));
				if(samp_mysql_query(stringd) == 0) printf("Erro na query stringd do comando /roubarcelular");
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
					numeroalvo = strval(field);
				}
				if(numeroalvo == 0){
				    SendClientMessage(playerid,COLOR_RED,"O jogador n„o tem celular!");
				    return 1;
				}
	    		format(stringv, sizeof(stringv),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
				if(samp_mysql_query(stringv) == 0) printf("Erro na query stringv do comando /roubarcelular");
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
					numero = strval(field);
				}
		    	if(numero!=0){
					SendClientMessage(playerid, COLOR_WHITE, "VocÍ j· tem celular, ent„o vocÍ ganhou seu valor em dinheiro.");
					new stringb[255],stringc[256];
					format(stringc, sizeof(stringc), "SELECT bankmoney FROM players WHERE nickname = '%s '",PlayerName(playerid));
					if(samp_mysql_query(stringc) == 0) printf("Erro na query stringc do comando roubar celular");
					samp_mysql_store_result();
					new bankmoney;
					while(samp_mysql_fetch_row(resultline)==1)
					{
					    new temp[256];
						samp_mysql_strtok(temp, "|", resultline); //first call of strtok MUST contain resultline
						bankmoney = strval(temp);
					}
					format(stringb, sizeof(stringb), "UPDATE players SET bankmoney = '%d ' WHERE nickname = '%s '", bankmoney+500, PlayerName(playerid));
					if(samp_mysql_query(stringb) == 0) printf("Erro na query stringb do comando roubar celular");
					format(stringb, sizeof(stringb), "UPDATE players SET phonenumb = '0 ' WHERE nickname = '%s '", PlayerName(plid));
					if(samp_mysql_query(stringb) == 0) printf("Erro na query stringb (2) do comando celular");
				} else {
					new string[256], stringb[256];
					format(string, sizeof(string), "UPDATE players SET phonenumb = '%d ' WHERE nickname = '%s '", numeroalvo, PlayerName(playerid));
					if(samp_mysql_query(string) == 0) printf("Erro na query string do comando roubar celular");
					format(stringb, sizeof(stringb), "UPDATE players SET phonenumb = '0 ' WHERE nickname = '%s '", PlayerName(plid));
					if(samp_mysql_query(stringb) == 0) printf("Erro na query stringb (3) do comando celular");
				}
				format(tmp,256,"VocÍ teve seu celular saqueado. Suspeito: %s",PlayerName(playerid));
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È assasino!");
		}
		return 1;
	}

	if(strcmp(cmd, "/sequestrar", true) == 0) {
	    if(Profissao[playerid] == ASSASSINO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
	    	new distancia;
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/sequestrar [id]");
				return 1;
			}
	        plid = strval(tmp);
         	if(Sequestro[plid] == 1) {
				SendClientMessage(playerid, COLOR_RED, "Esta Pessoa j· est· Sequestrada!");
				return 1;
			}
			if(Cativeiro[plid] == 1) {
				SendClientMessage(playerid, COLOR_RED, "Esta Pessoa j· est· no Cativeiro!");
				return 1;
			}
			if(Profissao[plid] == ASSASSINO){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode se auto-sequestrar!");
				return 1;
			}
	        if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1) {
		    	if(distancia > 20) {
		    	    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");				return 1;
				}
				if(distancia <= 20 && Sequestro[plid] != 1 && Cativeiro[plid] != 1) {
   					SendClientMessage(playerid, COLOR_GREEN, "Pessoa Sequestrada!");
					Sequestro[plid] = 1;
					AcrescentarExPoints(playerid,1);
					SendClientMessage(plid, COLOR_RED, "VocÍ est· sendo Perseguido para fugir digite /fugir!");
					SendClientMessage(plid, COLOR_RED, "Se n„o FUGIR ou Matar o SEQUESTRADOR ser· sequestrado em 10 minutos!");				return 1;
				}			return 1;
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador no est· conectado/logado");
			}		return 1;
		}
		if(Profissao[playerid] != ASSASSINO){
		    SendClientMessage(playerid, COLOR_GREEN, "VocÍ n„o È Assasino!");		return 1;
		}	return 1;
	}

	if(strcmp(cmd, "/fugir", true) == 0) {
		Sequestro[playerid] = 0;
		SendClientMessage(playerid, COLOR_GREEN, "VocÍ pagou a fuga no valor de $1500 e conseguiu fugir.");
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255], din;
    		format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(playerid));
    	   	samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
		    	printf("Erro na Linha 8046");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				din = strval(field);
			}
			new string3[255];
			format(string3, sizeof(string3), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din - 1500, PlayerName(playerid));
			if(samp_mysql_query(string3) == 0){
		 		printf("Erro na linha 8057");
			}
		}		for(new i; i < MAX_PLAYERS; i++)
   		{
   		    if(Profissao[i] == ASSASSINO){
				GivePlayerMoney(i, 1500);
				SendClientMessage(i, COLOR_GREEN, "VocÍ recebeu a fuga no valor de $1500!");
			}
		}	return 1;
	}

	if(strcmp(cmd, "/radar", true) == 0) {
	    if(Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || IsPlayerAdmin(playerid) == 1){
		    new tmp[256];
		    new plid;
			new distancia, velocidade, desconto, exesso;
		    distancia = GetDistanceBetweenPlayers(playerid, plid);
            velocidade = Velo[plid];
            exesso = velocidade - 120;
 			desconto = exesso*30;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/radar [id]"); return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(distancia > 50){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!"); return 1;
				}
				if(distancia <= 50){
				    if(velocidade < 120){
				        new string[MAX_STRING];
						format(string, sizeof(string), "O RADAR mostra: %d KpH de velocidade no carro de %s!", velocidade, PlayerName(plid));
						SendClientMessage(playerid, COLOR_YELLOW, string); return 1;
					}
					if(velocidade > 120){
						if(mysql == 1){
    						new resultline[1024];
    						new field[128];
    						new string2[255], din;
    						format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(plid));
    	   					samp_mysql_select_db("infernusgroup01");
							if(samp_mysql_query(string2) == 0){
		    					printf("Erro na Linha 8012");
							}
							samp_mysql_store_result();
							while(samp_mysql_fetch_row(resultline)==1)
							{
								samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
								din = strval(field);
							}
							new string3[255];
							format(string3, sizeof(string3), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din - desconto, PlayerName(plid));
							if(samp_mysql_query(string3) == 0){
		 						printf("Erro na linha 8023");
							}
						}
						new string2[MAX_STRING];
					    format(string2, MAX_STRING, "O RADAR mostrou que %s estava a %d KpH e foi dada a multa de $%d para esta pessoa!", PlayerName(plid), velocidade, desconto);
						SendClientMessage(playerid, COLOR_RED, string2);
	        			new string[MAX_STRING];
					    format(string, sizeof(string), "VocÍ passou no radar de um policial rodovirio a %d KpH, e levou uma multa de $%d por estar acima da velocidade pemitida!", velocidade, desconto);
						SendClientMessage(plid, COLOR_RED, string); return 1;
					} return 1;
				} return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador no est conectado/logado"); return 1;
			}
		}
		if(Profissao[playerid] != COP_MILITAR || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_SWAT){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o  policial"); return 1;
		} return 1;
	}
	
	if (strcmp(cmd, "/pedirarma", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 10, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pedirarma [arma]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == VENDEDOR_DE_ARMAS){
					format(string, sizeof(string), "%s pediu a arma: %s", PlayerName(playerid), tmp);
					SendClientMessageVendedor(COLOR_JUIZ, string);
				    SendClientMessage(playerid, COLOR_COP_SWAT, "Pedido de arma enviado!");
		        }
			}
            return 1;
		}
 	}
    if(strcmp(cmd, "/oferecerarma", true) == 0) {
      	if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
        new tmp[256];
        new plid,weaponid;
        new string[256];
        tmp = strtok(cmdtext, idx);
        plid = strval(tmp);

		if(!strlen(tmp)){
	    	SendClientMessage(playerid, COLOR_RED,"/oferecerarma [id] [idarma]");
			return 1;
		}
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/oferecerarma [id] [idarma]");
			return 1;
		}
		plid = strval(tmp);
        tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/oferecerarma [id] [idarma]");
			return 1;
		}
		weaponid= strval(tmp);
		if(weaponid< 1 || weaponid > 16 && weaponid< 22 || weaponid > 33){
		    SendClientMessage(playerid, COLOR_RED, "1-16 e 22-33 s„o os ids de armas.");
			return 1;
		}
		if(!IsPlayerConnected(plid)){
        	SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
			return 1;
		}

		else {
			format(string, sizeof(string), "O Vendedor de armas %s est· lhe oferecendo a arma: %s pelo valor de %d",PlayerName(playerid),weaponname[weaponid]);
   			SendClientMessage(plid, COLOR_JUIZ, string);
			SendClientMessage(plid, COLOR_GREEN, "Para vocÍ poder comprar a arma tem que chegar perto dele.");
			SendClientMessage(plid, COLOR_GREEN, "Caso esteja interessado na arma digite: /comprararma e o vendedor ir· vender a arma.");
			SendClientMessage(plid, COLOR_GREEN, "Caso contr·rio digite: /recusararma.");
			SendClientMessage(playerid, COLOR_GREEN, "Arma Oferecida!!");
			Armaoferecida[plid] = 1;
			return 1;
		}
	}
}
	if(strcmp(cmd, "/comprararma", true) == 0){
	    if(Armaoferecida[playerid] == 1){
	        new string[256];
	        for(new i=0; i<MAX_PLAYERS; i++){
            SendClientMessage(playerid, COLOR_GREEN, "Pedido enviado aguarde o vendedor");
            format(string, sizeof(string), "O Jogador %s aceitou sua oferta de arma",PlayerName(i));
   			SendClientMessageVendedor(COLOR_JUIZ, string);
   			SendClientMessageVendedor(COLOR_GREEN, "Para vender chegue perto do comprador.");
 			Armaoferecida[playerid] = 0;
	        return 1;
  		    }
			if(Armaoferecida[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "NinguÈm est· lhe oferencendo arma!");
	        return 1;
	    }
	}
}
//Loteria
	if(strcmp(cmd, "/revosena-surpresinha",true)==0){
	    if(AreaCreditos[playerid] == 1){
	        if(GetPlayerMoney(playerid) < PRECO_TICKET){
	            SendClientMessage(playerid,COLOR_RED,"Infelizmente vocÍ n„o tem dinheiro para comprar um bilhete.");
	            return 1;
			}
			new rand1, rand2, rand3, msg[256];
			rand1 = minrand(1,20);
			rand2 = minrand(1,20);
			while(rand2 == rand1){
				rand2 = minrand(1,20);
			}
			rand3 = minrand(1,60);
			while(rand3 == rand2 || rand3 == rand2){
	    		rand3 = minrand(1,20);
			}
			SendClientMessage(playerid,COLOR_RED2,"...:::MPA Loterias:::...");
			SendClientMessage(playerid,COLOR_YELLOW,"N˙meros automaticamente gerados por nosso sistema:");
			format(msg,256,"%d %d %d",rand1,rand2,rand3);
			SendClientMessage(playerid,COLOR_PALHA,msg);
			SendClientMessage(playerid,COLOR_RED2,"Obrigado pela preferÍncia e boa sorte!");
			PlayerDentro[playerid]=true;
			Aposta[playerid][0]=rand1;
			Aposta[playerid][1]=rand2;
			Aposta[playerid][2]=rand3;
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em uma loja 24/7!");
		    return 1;
		}
	}
	        
	if(strcmp(cmd, "/revosena", true) == 0) {
	    if(AreaCreditos[playerid] == 1){
	    new no1[256], no2[256], no3[256];
		no1 = strtok(cmdtext, idx);
		no2 = strtok(cmdtext, idx);
		no3 = strtok(cmdtext, idx);

		if(!strlen(no1) || !strlen(no2) || !strlen(no3)){
			return SendClientMessage(playerid, COLOR_PALHA, "USE: /revosena [1] [2] [3]");
		}
		if(PlayerDentro[playerid] == true){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ j· tem um bilhete!");
		    return 1;
		}
		if(GetPlayerMoney(playerid) >= PRECO_TICKET){
		    GivePlayerMoney(playerid, -1*PRECO_TICKET );
		    PlayerDentro[playerid]=true;
		    Aposta[playerid][0]=strval(no1);
		    Aposta[playerid][1]=strval(no2);
		    Aposta[playerid][2]=strval(no3);
		    new string[256];
		    format(string, sizeof(string), "Seus n˙meros da loteria: %d, %d, %d", strval(no1), strval(no2), strval(no3));
            return SendClientMessage(playerid, COLOR_PALHA, string);
		} else {
		    new string[256];
		    format(string, sizeof(string), "Sem grana! O Ticket custa: %d",PRECO_TICKET);
            SendClientMessage(playerid, COLOR_PALHA, string);
  		    return 1;
		}
	}
}
//funÁ„o usada pelo adm para setar profissıes

	if(strcmp(cmd, "/setjob", true) == 0 && IsPlayerConnected(playerid)) {
		if(IsPlayerAdmin(playerid) == 1) {
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
	            if(IsPlayerInAnyVehicle(plid)){
					SendClientMessage(playerid,COLOR_RED,"N„o È possÌvel setar a profiss„o de alguÈm que esteja em um veÌculo.");
					return 1;
				} else {
	        		if(prof > 0 && prof < 41 ){
						if(mysql == 1){
							new string2[255];
							format(string2, sizeof(string2), "UPDATE players SET skin = %d,prof = %d WHERE nickname = '%s '", ProfSkin[prof], prof, PlayerName(plid));
							if(samp_mysql_query(string2) == 0){
							 	printf("Erro na linha 8308");
							}
						}
						format(string, sizeof(string), "VocÍ mudou a profiss„o de %s para %s." , PlayerName(plid), ProfExtName[prof]);
						SendClientMessage(playerid, COLOR_GREEN, string);
						SendClientMessage(plid, COLOR_GREEN, "digite /profissao.");
	        	     	SendClientMessage(plid, COLOR_ROSA, "digite /regras1 e /regras2");
	            		SendClientMessage(playerid, COLOR_ROSA, "digite /regras1 e /regras2");
						Profissao[plid] = prof;
						LogarPlayer(plid);
						SetPlayerPos(plid,ProfPos[prof][0],ProfPos[prof][1],ProfPos[prof][2]);
						format(string,sizeof(string),"~w~%s",ProfGT[prof]);
						GameTextForPlayer(plid,string,3000,3);
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "Essa n„o È uma profisss„o v·lida!");
						return 1;
					}
   				}
			} else {
			    SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}

	if (strcmp(cmd, "/angulo", true)==0){
		new Float:angulo;
		new msg[256];
		GetPlayerFacingAngle(playerid, angulo);
		format(msg, sizeof(msg), "¬ngulo: %d", floatround(angulo));
		SendClientMessage(playerid,COLOR_GREEN,msg);
		return 1;
	}

	if (strcmp(cmd, "/pt", true)==0){
		new tmp[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pt [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == Profissao[playerid]){
					SendPlayerMessageToPlayer(i,GetPlayerColor(playerid),tmp);
					SendClientMessage(playerid, GetPlayerColor(playerid), tmp);
					return 1;
				}
			}
		}
	}

//descriÁ„o de profissıes

	if (strcmp(cmdtext, "/profissao", true)==0){
	    if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_RED2, "Barman - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/cerveja [id] [teor] : Vender cerveja, pode ser detectado  no  sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/whisk [id] [teor] : Vender whisk, pode detectar no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/pinga [id] [teor] : Vender pinga, pode ser detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/guarana [id] [copos] : Vender guaran·, n„o È detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_GREEN, "Cuidado! Se a policia pegar o seu cliente dirigindo bÍbado, ele vai preso! Avise-o.");
  	    }
  	      else if(Profissao[playerid] == ASSASSINO) {
			SendClientMessage(playerid, COLOR_RED2, "Assassino - Comandods:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/sequestrar [id] : sequestra 1 pessoa para ganhar $$!");
			SendClientMessage(playerid, COLOR_WHITE, "/roubarcelular [id-do-jogador] : rouba o celular de uma pessoa ou se j· possuir ganha o valor do celular em $$!");
			SendClientMessage(playerid, COLOR_WHITE, "Apenas mate e ganhe $$");
		}
          else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_RED2,  "Vendedor de VeÌculos - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/setcar [id-do-carro] [id-do-jogador] [cor1] [cor2] : Vende um carro (esteja com ele na posiÁ„o de spawn).");
			SendClientMessage(playerid, COLOR_WHITE, "/trocardono [id]: troca o dono do veÌculo");
			SendClientMessage(playerid, COLOR_WHITE, "AtenÁ„o: Na hora de setar carros, NUNCA use ‚ngulo, pois o servidor poder· travar.");
			SendClientMessage(playerid, COLOR_WHITE, "N„o se preocupe quanto ao ‚ngulo, pois o nosso script o pega para vocÍ!");
        }
          else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_RED2, "Corretor de ImÛveis - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/casa [nick] : Seta a casa para alguÈm (esteja na posiÁao exterior ‡ casa).");
        }
          else if(Profissao[playerid] == SEGURAN«A) {
			SendClientMessage(playerid, COLOR_RED2, "SeguranÁa - Comandos:");
 	    	SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
 	    	SendClientMessage(playerid, COLOR_WHITE, "Sem comandos especiais, procure um jornalista e anuncie seus serviÁos.");
  	   }
          else if(Profissao[playerid] == MOTORISTA) {
		    SendClientMessage(playerid, COLOR_RED2, "Motorista Particular - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "Sem comandos especiais, seus clientes poder„o digitar /motorista para solicitar um, como vocÍ.");
       }
          else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		    SendClientMessage(playerid, COLOR_RED2, "Motorista de ‘nibus - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "Tarifa autom·tica, ao entrar o passageiro pagar·.");
       }
	      else if(Profissao[playerid] == CAMINHONEIRO) {
		    SendClientMessage(playerid, COLOR_RED2, "Caminhoneiro - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/carregar: para carregar o caminhao, antes de seguir viagem");
	    	SendClientMessage(playerid, COLOR_WHITE, "/descarregar: ao chegar no local de destino descarregue o caminh„o e receba o frete.");
       }
          else if(Profissao[playerid] == CACADOR) {
		    SendClientMessage(playerid, COLOR_RED2, "CaÁador - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/cacar : ComeÁar a caÁar, esteja na ¡rea de CaÁa.");
        	SendClientMessage(playerid, COLOR_WHITE, "/vendercaca : Vende seu pescado para a Cooperativa de CaÁa, estando nela.");
       }
          else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COLOR_RED2, "Pescador - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ");
	    	SendClientMessage(playerid, COLOR_WHITE, "/pescar : Joga a rede para pescar, vocÍ deve estar na ·rea de pesca.");
        	SendClientMessage(playerid, COLOR_WHITE, "/venderpesca : Vende seu pescado em uma cooperativa, vocÍ deve estar em uma.");
       }
	      else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
		    SendClientMessage(playerid, COLOR_RED2, "Entregador de Pizza - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/pizza: para vender uma pizza ‡ um cliente");
	    	SendClientMessage(playerid, COLOR_WHITE, "Para pedir uma pizza, os clientes podem digitar /telepizza.");
       }
  	      else if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_RED2, "Taxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/ttaxi [id] : ComeÁa a rodar o taxÌmetro (o passageiro tem que estar no seu carro).");
			SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de taxi pelo comando /taxi");
  	   }
          else if(Profissao[playerid] == MOTOTAXI) {
			SendClientMessage(playerid, COLOR_RED2,  "Mototaxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/mtaxi [id] : ComeÁa a cobranÁa da viagem.");
	        SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de mototaxi pelo comando /mototaxi [local].");
	   }
	      else if(Profissao[playerid] == TAXI_AEREO) {
			SendClientMessage(playerid, COLOR_RED2,  "Mototaxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/artaxi [id] : A viagem comeÁara a ser tarifada para o passsageiro.");
		    SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de taxi aereo pelo comando /taxiaereo [local]");
       }
	      else if(Profissao[playerid] == INSTRUTOR) {
			SendClientMessage(playerid, COLOR_RED2, "Instrutor de DireÁ„o - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ");
			SendClientMessage(playerid, COLOR_WHITE, "/habaerea : Habilita uma pessoa a dirigir veÌculos aereos (aviıes e helicopteros).");
			SendClientMessage(playerid, COLOR_WHITE, "/habterrestre : Habilita uma pessoa a dirigir veÌculos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_WHITE, "/habnautica : Habilita uma pessoa a dirigir veÌculos nauticos (barcos).");
			SendClientMessage(playerid, COLOR_WHITE, "/carteiras : ver o valor das carteiras.");
	   }
          else if(Profissao[playerid] == TRAFICANTE) {
			SendClientMessage(playerid, COLOR_RED2, "Traficante - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/maconha [id] [teor] : Vender  maconha, pode ser detectado  no  sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/cocaina [id] [teor] : Vender  cocaina, pode detectar no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/heroina [id] [teor] : Vender heroÌna, pode ser detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/Cuidado! Se a organizaÁ„o NARC”TICOS te pegar em flagrante vendendo drogas, vocÍ ser· preso!");
  	   }
          else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COLOR_RED2, "Jornalista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/noticia: publicar uma noticia. Ex:empregos(informado pelo ADM), e o que acontence em de San Andreas");
       }
          else if(Profissao[playerid] == PARAMEDICO) {
		    SendClientMessage(playerid, COLOR_RED2, "ParamÈdico - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/curativo [id]: faz o tratamento necess·rio ao paciente.");
            SendClientMessage(playerid, COLOR_WHITE, "/192: telefone de emergencia, para chamar uma ambulancia.");
	   }
 	      else if(Profissao[playerid] == ADVOGADO) {
			SendClientMessage(playerid, COLOR_RED2, "Advogado - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
            SendClientMessage(playerid, COLOR_WHITE, "/advogado: este È comando utilizado pelos seus clientes para entrar em contato com vocÍ.");
            SendClientMessage(playerid, COLOR_WHITE, "/defesa: recebe pela defesa judicial,seus honor·rios ser„o 40% do valor da causa [informe seu cliente].");
            SendClientMessage(playerid, COLOR_WHITE, "/processo: entrar com a petiÁ„o e faz a defesa de seu cliente, feito isto aguarde o senteÁa do juiz.");
       }
	      else if(Profissao[playerid] == COP_MILITAR) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Militar - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : ve o nÌvel de alcool no sangue de alguem | /multar [id] [quantia] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render | /reforco: pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede reforÁo a todos os cops.");
      }
	      else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_RED2,  "Policial Rodovi·rio - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prende [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : ve o nÌvel de alcool no sangue de alguem | /multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render | /reforco: pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/cone: cria um cone para a blitz policial.");
  	  }
          else if(Profissao[playerid] == COP_FLORESTAL) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Florestal - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/prendercaca: apreende uma caÁa feita ilegalemnte.| /verpesca: para saber se a pessoa est· pescando ou n„o");
            SendClientMessage(playerid, COLOR_WHITE, "/prenderpesca apreende uma pesca feita ilegalemnte./vercaca: para saber se a pessoa est· pescando ou n„o.");
			SendClientMessage(playerid, COLOR_WHITE, "/piracemaon: comeÁa o perÌodo da piracema|/piracemaoff: finaliza periodo da piracema.");
        	SendClientMessage(playerid, COLOR_WHITE, "/cacaon: legaliza perido de caÁa|/cacaoff: finaliza periodo de caÁa.");
	        SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	  }
	      else if(Profissao[playerid] == COP_SWAT) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Elite/SWAT - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
			SendClientMessage(playerid, COLOR_WHITE, "/exame [id] : ve o nÌvel de intorpecentes no sangue de alguem | /radar: liga o radar movel.");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : ve o nÌvel de alcool no sangue de alguem | /multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render | /reforco: pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/cone: cria um cone para a blitz policial.");
	   }
  	      else if(Profissao[playerid] == COP_NARCOTICOS) {
  	        SendClientMessage(playerid, COLOR_RED2, "NarcÛticos - Comandos:");
  			SendClientMessage(playerid, COLOR_WHITE, "/exame [id] : Ver se o indÌviduo tem droga no corpo.");
        	SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
	        SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render | /reforco: pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede reforÁo a todos os cops.");
	  }
          else if(Profissao[playerid] == JUIZ) {
		    SendClientMessage(playerid, COLOR_RED2, "JuÌz - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia atÈ o tÈrmino do julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar[id] : apÛs seu veredicto, vocÍ usa este comando para determinar a soltura do rÈu..");
			SendClientMessage(playerid, COLOR_WHITE, "/veredicto: Para determianr a senteÁa do rÈu culpado ou inocente.| /armas para ver porte de armas");
   	  }
          else if(Profissao[playerid] == SHERIFF  ) {
		    SendClientMessage(playerid, COLOR_RED2, "Xerife - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia atÈ o tÈrmino do julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar[id] : vocÍ usa este comando para tirar da cadeia o criminoso.");
			SendClientMessage(playerid, COLOR_WHITE, "/ordem: Para ordenar outros oficiais a comprirem uma miss„o.| /armas para ver porte de armas.");
        	SendClientMessage(playerid, COLOR_WHITE, "/porte1: Concede porte de armas na categoria 1 armas leves.para policia militar e civis confi·veis.");
	        SendClientMessage(playerid, COLOR_WHITE, "/porte2: Concede porte de armas na categoria 2 armas pesadas,somente Swat e Cop rodovi·rio.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede reforÁo a todos os cops.");
		}
  	      else if(Profissao[playerid] == LIXEIRO) {
  	        SendClientMessage(playerid, COLOR_RED2, "Lixeiro - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/coletarlixo : Iniciar miss„o de coleÁ„o de lixo.");
        	SendClientMessage(playerid, COLOR_WHITE, "/lixao : Deposita o lixo coletado com \"/coletarlixo\" no Lix„o.");
		}
  	      else if(Profissao[playerid] == TRANSPORTE_DE_VALORES) {
 	        SendClientMessage(playerid, COLOR_RED2, "Transportador de Valores - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/transportar : Transporta a grana do Banco Central 24/7 de LV para os outros bancos.");
        	SendClientMessage(playerid, COLOR_WHITE, "/depositargrana : Deposita a grana em qualquer banco estando no mesmo.");
        	SendClientMessage(playerid, COLOR_WHITE, "/escolta : Pede ajuda a polÌcia para escoltar o dinheiro.");
	  }
  	      else if(Profissao[playerid] == CONTRABANDISTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Contrabandista - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
		 	SendClientMessage(playerid, COLOR_WHITE, "/contrabando : Inicia o contrabando na Ponte principal de SF perto da boate do Jizzys.");
		 	SendClientMessage(playerid, COLOR_WHITE, "/cancelarcontrabando : cancela o contrabando!");
	  }
  	      else if(Profissao[playerid] == RECEITA_FEDERAL) {
 	        SendClientMessage(playerid, COLOR_RED2, "Receita Federal - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
 			SendClientMessage(playerid, COLOR_WHITE, "/apreendercontrabando [id] : Cancela o contrabando de mercadoria! Na maioria das vezes ocorre em SF.");
 			SendClientMessage(playerid, COLOR_WHITE, "No navio ancorado perto da Ponte e da boate.");
	  }
  	      else if(Profissao[playerid] == AGRICULTOR) {
 	        SendClientMessage(playerid, COLOR_RED2, "Agricultor - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/plantarmilho : Planta o milho no campo.");
          	SendClientMessage(playerid, COLOR_WHITE, "/vendermilho : Vende o milho colhido na FAZENDA.");
	  }
  	      else if(Profissao[playerid] == LADRAO_DE_CARROS) {
 	        SendClientMessage(playerid, COLOR_RED2, "Ladr„o de Carros - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/desmanche : Vende o carro para o desmanche");
  			SendClientMessage(playerid, COLOR_WHITE, "/veiculosdesmanche : mostra o veÌculo que o beco quer!");
	  }
  	      else if(Profissao[playerid] == ASSALTANTE) {
 	        SendClientMessage(playerid, COLOR_RED2, "Assaltante - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/roubar : Chegue em um banco, digite depois fuja.");
        	SendClientMessage(playerid, COLOR_WHITE, "Para roubar Carros-Fortes, basta entrar nele quanto estiver carregado de $$.");
	  }
	      else if(Profissao[playerid] == FRENTISTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "FRENTISTA - Comandos:");
 	        SendClientMessage(playerid, COLOR_WHITE, "/colocargas [id] [quantia] : Coloca gasolina no carro de um jogador, sujeito a cobranÁa.");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	  }
  	      else if(Profissao[playerid] == LOCADOR_DE_CARROS) {
 	        SendClientMessage(playerid, COLOR_RED2, "Locador de carros - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/alugarcarro [id] : Quando um pessoa pedir um carro ofereÁa os disponÌveis na");
        	SendClientMessage(playerid, COLOR_WHITE, "locadora quando a pessoa entrar no carro digite e ele pensar·.");
	  }
  	      else if(Profissao[playerid] == PEDREIRA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Carregador da Pedreira - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/carregarcaminhao : Carrega o caminh„o na Pedreira!");
        	SendClientMessage(playerid, COLOR_WHITE, "/descarregarcamminhao : Descarrega o caminh„o na obra que fica em SF!");
	  }
	      else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
 	        SendClientMessage(playerid, COLOR_RED2, "Vendedor de Armas  - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/venderarma [id] [idarma] : Vende alguma arma para o jogador.");
        	SendClientMessage(playerid, COLOR_WHITE, "/oferecerarma [id] [idarma] : Oferece alguma arma ao jogador ele tem que estar perto para receber.");
        	SendClientMessage(playerid, COLOR_WHITE, "/armas : ver o id e o valor das armar");
	  }
		  else if(Profissao[playerid] == MECANICO) {
		    SendClientMessage(playerid,COLOR_RED2,"Mec‚nico - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
		    SendClientMessage(playerid,COLOR_WHITE,	"/consertarcarro : Conserta o carro em que vocÍ estiver dirigindo.");
		    SendClientMessage(playerid,COLOR_WHITE,	"/pintarcarro : Pinta o carro com cores diferentes!");
		    SendClientMessage(playerid,COLOR_WHITE,	"AtenÁ„o: Como os carros n„o d„o RESPAWN, vocÍ tem que fazer o reboque deles.");
		    SendClientMessage(playerid,COLOR_WHITE,	"VocÍ pode alternar em n„o cobrar ou cobrar. Se cobrar ser· pago $50. Para rebocar basta");
		    SendClientMessage(playerid,COLOR_WHITE,	"chegar com o Reboque na frente do veÌculo e apertar CTRL, automaticamente o carro ser· guinchado.");
	  }
 		  else if(Profissao[playerid] == PROSTITUTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Prostituta  - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/strip-tease [id]: Oferece um strip-tease na boate!");
        	SendClientMessage(playerid, COLOR_WHITE, "/transarcama [id]: Oferece uma transa na cama de um hotel.");
        	SendClientMessage(playerid, COLOR_WHITE, "/mudarposicao [1-4]: Troca a posiÁ„o na hora do sexo!");
	  }
	      else{
			SendClientMessage(playerid, COLOR_GREEN, "Profiss„o sem comandos especiais");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_GREEN, "Desculpe-nos, sua profiss„o n„o tem nenhum comando especial ainda, estamos trabalhando para isto.");
		}
		return 1;
	}
	
	if(strcmp(cmd,"/consertarcarro",true)==0){
	    if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	        if(IsPlayerInAnyVehicle(playerid)){
	            new vehid = GetPlayerVehicleID(playerid);
				new Float:X,Float:Y,Float:Z,Float:ang;
				GetVehiclePos(vehid,X,Y,Z);
				GetVehicleZAngle(vehid,ang);
				SetVehicleToRespawn(vehid);
				SetTimerEx("ColocarNoVeiculoMot",350,0,"dd",playerid,vehid);
				SetTimerEx("SetarPosicaoDoVeiculo",450,0,"dffff",vehid,X,Y,Z,ang);
				AcrescentarExPoints(playerid,1);
			} else {
			    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o È mec‚nico!");
		}
		return 1;
	}
    if(strcmp(cmd,"/pintarcarro",true)==0){
		if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
			if(IsPlayerInAnyVehicle(playerid)){
	            new vehid = GetPlayerVehicleID(playerid);
	           	new rand = random(126)+0;
				new rand1 = random(126)+0;
				ChangeVehicleColor(vehid,rand,rand1);
				SendClientMessage(playerid,COLOR_MECANICO,"Cor colocada");
				AcrescentarExPoints(playerid,1);
  			} else {
			    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o È mec‚nico!");
		}
		return 1;
	}

	if (strcmp(cmd, "/say", true)==0){
		new tmp[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/say [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(GetDistanceBetweenPlayers(playerid, i) < 10){
					SendPlayerMessageToPlayer(i,playerid,tmp);
					return 1;
				}
			}
			return 1;
		}
	}

	if(strcmp(cmd, "/m", true)==0){
		if(Profissao[playerid] == SHERIFF 	|| IsPlayerAdmin(playerid)) {
			new tmp[256];
			new string[256];
		    strmid(tmp, cmdtext,3, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/m [texto]");
				return 1;
			}
			format(string, sizeof(string), "~r~ %s", tmp);
	        GameTextForAll(string,5000,0);
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"N„o tens permiss„o!");
		    return 1;
		}
	}
//moto taxi
	if(strcmp(cmd, "/punheteiro",true)==0 && IsPlayerInAnyVehicle(playerid)){
	    DestroyVehicle(GetPlayerVehicleID(playerid));
	    SendClientMessage(playerid,COLOR_RED,"DONE");
	    return 1;
	}
	if(strcmp(cmd, "/matrakeitions",true)==0 && IsPlayerInAnyVehicle(playerid)){
	    new id = GetPlayerVehicleID(playerid);
	    new model = GetVehicleModel(id);
	    switch(model){
	        case 581,523,462,521,463,522,461,448,468,586: AddVehicleComponent(id,1010);
		}
		return 1;
	}
	if(strcmp(cmd, "/mototaxi", true) == 0 && IsPlayerConnected(playerid)) {
		if(Profissao[playerid] == MOTOTAXI || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/mototaxi [id]");
			}
			plid = strval(tmp);
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo != VEH_FCR900 && PLAYER_STATE_DRIVER){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· dirigindo uma moto autorizada para mototaxistas.");
				SendClientMessage(playerid, COLOR_RED, "Use motos do modelo FCR900, no local de exame moto-escola tem uma.");
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COLOR_GREEN, "O moto-taxÌmetro comeÁou a rodar");
			        SendClientMessage(plid, COLOR_GREEN, "O moto-taxÌmetro j· est· rodando. A corrida est· sendo cobrada a partir de agora.");
			        MTaximetro[plid][0] = 1;
					MTaximetro[plid][1] = playerid;
					AcrescentarExPoints(playerid,1);
				}
				else {
				    SendClientMessage(playerid, COLOR_RED, "O passageiro n„o est· na sua moto, ou vocÍ n„o È o condutor.");
				}
			}
	    } else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È mototaxista.");
		}
	}

//TAXIAEREO

	if(strcmp(cmd, "/ataxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXI_AEREO || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/ataxi [id]");
			}
			plid = strval(tmp);
			new modelo;
		 	modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo != VEH_MAVERICK){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· pilotando uma aeronave autorizada para sua profiss„o.");
				SendClientMessage(playerid, COLOR_RED, "Use apenas helicÛpteros Maverick.");
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COLOR_GREEN, "O aero-taxÌmetro comeÁou a rodar");
			        SendClientMessage(plid, COLOR_GREEN, "O aero-taxÌmetro j· est· rodando. A corrida est· sendo cobrada a partir de agora.");
			        ATaximetro[plid][0] = 1;
					ATaximetro[plid][1] = playerid;
					AcrescentarExPoints(playerid,1);
  		            return 1;
				}
				else {
                SendClientMessage(playerid, COLOR_RED, "O passageiro n„o est· na sua aeronave, ou vocÍ n„o È o condutor.");
				}
				return 1;
			}
	    } else {
        	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È taxista aÈreo.");
			return 1;
		}
	}

//TAXISTA

	if(strcmp(cmd, "/ttaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/staxi [id]");
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COLOR_GREEN, "O taxÌmetro comeÁou a rodar.");
                SendClientMessage(plid, COLOR_GREEN, "O taxÌmetro comeÁou a rodar. A bandeirada de $20 foi cobrada.");
                GivePlayerMoney(playerid,20);
                GivePlayerMoney(plid,-20);
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
                AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
		        SendClientMessage(playerid, COLOR_RED, "O passageiro n„o est· dentro do seu carro ou vocÍ n„o È o motorista.");
			}
			return 1;
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem nÌvel suficiente.");
			return 1;
		}
	}

// ENTREGADOR DE PIZZA
	if(strcmp(cmd,"/pizza",true)==0){
	    if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
	       	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == VEH_PIZZABOY){
			new tmp[256];
	    	new plid;
	    	tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
	        	SendClientMessage(playerid,COLOR_RED,"/pizza [id]");
				return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		        	SendClientMessage(playerid,COLOR_RED,"Chegue mais perto.");
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_ENTREGADOR_PIZZA,"Pizza entregue.");
				    SendClientMessage(plid,COLOR_ENTREGADOR_PIZZA,"VocÍ se deliciou com uma pizza da Well Stacked Pizza Co.");
				    GivePlayerMoney(playerid,100);
				    GivePlayerMoney(plid,-20);
				    AddPlayerHealth(plid,100);
				    AcrescentarExPoints(playerid,1);
					return 1;
				}
    		} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
				return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em uma moto para entrega de pizza!");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}

//PESCADOR

	if(strcmp(cmd, "/pescar", true) == 0) {
	    if(PescaInProgress[playerid] == 1) {
	    	SendClientMessage(playerid, COLOR_RED, "Calminha aÍ... VocÍ j· est· pescando!");
	    	return 1;
	    } else {
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid,X,Y,Z);
			if((X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425) || (X >= -604.5089&& X <= -499.5553 && Y >= 1365.5953 && Y <= 1495.0166)){
				SendClientMessage(playerid,COLOR_GREEN,"VocÍ lanÁou a rede de pesca. Espere ela voltar para concluir a pesca.");
				SendClientMessage(playerid,COLOR_GREEN,"Enquanto ela n„o vem, fique apreciando a paisagem.");
				PescaInProgress[playerid] = 1;
				SetTimerEx("Pesca",36000,0,"d",playerid);
				AcrescentarExPoints(playerid,1);
				return 1;
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· na ·rea de pesca, consulte nosso site para uma referÍncia.");
				return 1;
			}
		}
	}


//CA«ADOR

	if(strcmp(cmd, "/cacar", true) == 0) {
	    if(Profissao[playerid] == CACADOR || IsPlayerAdmin(playerid)){
	        if(AreaCaca[playerid] == 0){
	            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na ·rea de caÁa, consulte nossa site para uma referÍncia.");
				return 1;
			} else {
			    if(CacaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COLOR_RED, "Calminha aÍ... A sua presa n„o morreu ainda!");
					return 1;
				} else {
					SendClientMessage(playerid, COLOR_GREEN, "VocÍ È um exÌmio caÁador! Espere a presa exalar seus ˙ltimos ares de vida,");
					SendClientMessage(playerid, COLOR_GREEN, "para poder vendÍ-la.");
			    	CacaInProgress[playerid] = 1;
			    	SetTimerEx("Caca",36000,0,"d",playerid);
			    	AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
/*	if(strcmp(cmdtext, "/openb", true) == 0) {
		if(PortaoAberto == 0 && PortaoAbrindo == 0){
				SendClientMessage(playerid, COLOR_RED,"Sem chance!");
				return 1;
			}else{
			    PortaoAbrindo = 1;
				PortaoTimer=SetTimerEx("open",50, 0, "d", playerid);
				return 1;
 			}
		}
*/

//funÁıes do barman

	if(strcmp(cmd, "/cerveja", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/ceveja [id] [quantidade]");
			return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/cerveja [id] [quantidade]");
			return 1;
			}
			teor = strval(tmp);
			if(teor < 1 || teor > 50){
			    SendClientMessage(playerid, COLOR_RED, " Copos de chopp: de 10 a 50.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "VocÍ tomou uma cerja geladinha mas no nÌvel de alcool no seu sangue agora È de: %d mg", teor);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Uma cerveja gelada saindo...");
			            AddPlayerHealth(plid, 30);
			            GivePlayerMoney(plid, -60);
			            GivePlayerMoney(playerid, 160);
			            AcrescentarExPoints(playerid,1);
						return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto para entregar o bagulho!!.");
				    return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...VocÍ n„o tem permiss„o para isso,sua profissao È outra");
			return 1;
		}
	}

//guarana
	if(strcmp(cmd, "/guarana", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			new TeorPreco[7] = {0,4,8,12,16,20,24};
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/guarana [id] [quantidade]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/guarana [id] [quantidade]");
				return 1;
			}
			teor = strval(tmp);
			if(teor < 1 || teor > 6){
			    SendClientMessage(playerid, COLOR_RED, "Ei ele quer tomar um guarana, nao vender, teor de 1 a 6.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid, plid) > 20){
				SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!!.");
				return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"O jogador n„o est· conectado!");
			    return 1;
			}
		    Bebida[plid] = teor;
			format(string, sizeof(string), "VocÍ bebeu 1 guarana Kuat, e deminuiu: %d mg, do teor de alcool do seu sangue.", teor);
            SendClientMessage(plid, COLOR_GREEN, string);
            SendClientMessage(playerid, COLOR_GREEN, "Guarana Vendido.");
            AddPlayerHealth(plid, 80);
            GivePlayerMoney(plid, - TeorPreco[teor]);
            AcrescentarExPoints(playerid,1);
			return 1;
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...VocÍ n„o tem permiss„o para isso,sua profissao È outra");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/whisk", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/whisk [id] [quantidade]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/whisk [id] [quantidade]");
				return 1;
			}
			teor = strval(tmp);
			if(teor < 1 || teor > 5){
			    SendClientMessage(playerid, COLOR_RED, "Ei ele quer tomar um drink, nao encher a cara. TaÁas de 2 e 5.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "VocÍ bebeu um bom whisk 12 anos mas o nivel de alcool no seu sangue agora È de: %d mg", teor);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Dose de whisk vendida");
			            AddPlayerHealth(plid, 80);
			            GivePlayerMoney(plid, -200);
			            GivePlayerMoney(playerid, 300);
			            AcrescentarExPoints(playerid,1);
						return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
					    return 1;
					}
				}
				else{
					SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!!.");
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...VocÍ n„o tem permiss„o para isso, sua profissao È outra");
			return 1;
		}
	}
	if(strcmp(cmd, "/pinga", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/pinga [id] [quantidade]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/pinga [id] [quantidade]");
				return 1;
			}
			teor = strval(tmp);
			if(teor < 1 || teor > 7){
			    SendClientMessage(playerid, COLOR_RED, "Se esse pinguÁo encher a cara vai te dar problemas. Venda somente de 1 a 7 copos.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor*200;
						format(string, sizeof(string), "VocÍ tomou uma pinga da boa, mas o teor de alcool no seu sangue È de : %d mg", teor*200);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Pinga vendida.");
			            AddPlayerHealth(plid, 60);
			            GivePlayerMoney(plid, -100);
			            GivePlayerMoney(playerid, 200);
			            AcrescentarExPoints(playerid,1);
						if(teor > 3 && teor < 7){
						    ClearAnimations(plid);
						    ApplyAnimation(plid,"PED", "WALK_DRUNK",10,0,1,0,0,0);
						    SendClientMessage(plid,COLOR_RED,"VocÍ bebeu demais e agora est· tonto.");
						    return 1;
						}
						if(teor == 7){
						    ClearAnimations(plid);
						    ApplyAnimation(plid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
						    PlayerPlaySoundEx(playerid,1169);
						    SendClientMessage(plid,COLOR_RED,"VocÍ bebeu demais e acabou vomitando.");
						    return 1;
						}
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe!!.");
				    return 1;
				}
			}
		} else {
 	    	SendClientMessage(playerid, COLOR_RED, " Ei...VocÍ n„o tem permiss„o para isso,sua profissao È outra");
        	return 1;
		}
	}
//Comprar Celular
	if(strcmp(cmd, "/celular", true) == 0) {
	    if(GetPlayerMoney(playerid) < 500){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar.");
			return 1;
		}
		new phone;
		new numero;
		if(!mysql) return 0;
   		new resultline[1024];
   		new field[128];
   		new string[255];
   		format(string, sizeof(string),"SELECT phonenumb FROM players WHERE nickname = '%s '", PlayerName(playerid));
   	    samp_mysql_select_db("infernusgroup01");
		if(samp_mysql_query(string) == 0){
		    printf("Erro na query 1 do comando /celular");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
			numero = strval(field);
		}
	    if(numero!=0){
			SendClientMessage(playerid, COLOR_WHITE, "VocÍ j· tem celular.");
			return 1;
		}
		SendClientMessage(playerid,COLOR_RED2,"Aguarde, processando...");
		GivePlayerMoney(playerid,-500);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		phone = random(8999)+1000;
		new query[256];
		format(query, sizeof(query),"SELECT * FROM players WHERE phonenumb = '%d '", phone);
		if(!samp_mysql_query(query)) print("Erro na query 2 do comando /celular");
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1) {
		    phone = random(8999)+1000;
		    if(!samp_mysql_query(query)) print("Erro na query 3 do comando /celular");//Refaz a query atÈ o n˙mero n„o ser igual
			samp_mysql_store_result();
		}
		format(string, sizeof(string), "Celular obtido. Seu numero: %d", phone);
		SendClientMessage(playerid, COLOR_ROSA, string);
		new string2[255];
		format(string2, sizeof(string2), "UPDATE players SET phonenumb = '%d ' WHERE nickname = '%s '", phone, PlayerName(playerid));
		if(samp_mysql_query(string2) == 0) printf("Erro na linha 3236");
		return 1;
	}
	
// LADR√O DE CARROS
	if(strcmp(cmd, "/desmanche", true) == 0) {
	    new vehicleid = GetPlayerVehicleID(playerid);
	    new i;
	    new Float:X, Float:Y, Float:Z;
	    new wantedVehicle = -1;
		GetPlayerPos(playerid,X,Y,Z);
		for(i=0;i<MAX_DESMANCHEVEICULO;i++) {
			if(Veiculosprocurados[i]==Veiculoprocurado) {
				wantedVehicle = i;
				break;
			}
		}
		if(wantedVehicle>=0) {
	    	if(Profissao[playerid] == LADRAO_DE_CARROS || IsPlayerAdmin(playerid)){
	    		if(TempoDesmanche[playerid] == 1) {
			   		SendClientMessage(playerid, COLOR_RED, "VocÍ j· entregou um carro aqui. Espere um pouco para entregar de novo!");
	    		}
				if(IsPlayerInAnyVehicle(playerid) && TempoDesmanche[playerid] == 0){
   			   		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == Veiculoprocurado){
						if(AreaDesmanche[playerid] == 1){
		   					SendClientMessage(playerid,COLOR_GREEN,"Aew mano, seu carro vale 2000.");
							GivePlayerMoney(playerid, 2000);
							SendClientMessage(playerid,COLOR_WHITE,"VocÍ entregou o carro ao desmanche por 2000 \"pratas\".");
							SetVehicleToRespawn(vehicleid);
				   			TempoDesmanche[playerid] = 1;
				   			AcrescentarExPoints(playerid,1);
							SetTimerEx("Desmanche",300000,false,"d",playerid);
    						return 1;
						} else {
				     	    SendClientMessage(playerid,COLOR_AZULPLUS,"Agente quer esse veÌculo maluco!!!");
							return 1;
						}
					} else {
				 	    SendClientMessage(playerid,COLOR_RED,"Meu irm„o tu num t· na ·rea!!!!");
						return 1;
					}
	       		} else {
	           		SendClientMessage(playerid, COLOR_RED, "Maluco nem em veÌculo tu t·!");
					return 1;
				}
	   		}
		    else{
	        	SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
	    		return 1;
	    	}
		}
	}
	
	if (strcmp(cmd, "/veiculosdesmanche", true) == 0) {
	    if(Profissao[playerid] == LADRAO_DE_CARROS || IsPlayerAdmin(playerid)){
			new Nomeveiculo[32];
			new string[256];
			Nomeveiculo = "";
			for(new i=0; i <MAX_DESMANCHEVEICULO; i++) {
				if(Veiculosprocurados[i]==Veiculoprocurado) {
					format(Nomeveiculo, sizeof(Nomeveiculo), "%s",Veiculosprocuradosnome[i]);
				}
			}
			if(strlen(Nomeveiculo)==0) {
				format(string, sizeof(string), "NÛs num tamo atr·s de nada maluco!");
			} else {
				format(string, sizeof(string), "O beco ta afim de desmanchar um(a) %s.",Nomeveiculo);
			}
			SendClientMessage(playerid, COLOR_AZULPLUS, string);
			return 1;
		}
	}
// ENFERMEIRO

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
			    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado");
				return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 10){
			    	SendClientMessage(playerid, COLOR_GREEN, "Miss„o cumprida, vocÍ fez o tratamento no paciente!");
			    	SendClientMessage(plid, COLOR_WHITE, "Um paramÈdico fez o tratamento necess·rio em vocÍ!");
			    	AddPlayerHealth(plid,100);
			    	GivePlayerMoney(plid,-20);
			    	GivePlayerMoney(playerid,20);
			    	AcrescentarExPoints(playerid,1);
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_RED,"N„o È possivel fazer o tratamento, t„o longe assim do paciente!");
				}
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Apenas paramÈdicos podem fazer isso!");
		}
		return 1;
	}

//diskgas
	if(strcmp(cmd, "/diskgas", true) == 0) {
		new tmp[256];
		new string[256];
	    tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/diskgas [litros]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_FRENTISTA, "Obrigado por ligar para o dikgas.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == FRENTISTA){
					format(string, sizeof(string), "%s pediu %s litros de g·s.", PlayerName(playerid), tmp);
                    SendClientMessage(i, COLOR_FRENTISTA, string);
		        }
			}
			return 1;
		}
	}

// TELE-PIZZA
	if (strcmp(cmd, "/telepizza", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext,11, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pizza [qual? local de entrega]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "Obrigado por ligar para o tele-pizza.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == ENTREGADOR_PIZZA){
					format(string, sizeof(string), "%s pediu uma pizza: %s", PlayerName(playerid), tmp);
                    SendClientMessage(i, COLOR_ENTREGADOR_PIZZA, string);
		        }
			}
			return 1;
		}
	}
//Contrabando
 	if(strcmp(cmd, "/contrabando", true) == 0) {
		if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
			if(Contrabando[playerid] == 1) {
				SendClientMessage(playerid, COLOR_GRAD1, "VocÍ j· est· na miss„o.");
				return 1;
			}
			RingTone[playerid] = 20;
			SetPlayerCheckpoint(playerid,-2328.99,1527.79,0.25,4.0);
			SendClientMessage(playerid, COLOR_PALHA, "Contrabando!!");
			Contrabando[playerid] = 1;
			Receita[playerid] = 1;
			SendClientMessage(playerid, COLOR_CONTRABANDISTA, "Prossiga para o navio.");
			CheckpointStatus[playerid] = CONTRABANDOINI;
  			SetTimer("ContrabandoNavio",360000,false);
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ nao È contrabandista");
		}
		return 1;
	}
   	if(strcmp(cmd, "/cancelarcontrabando", true) == 0) {
   		if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
			if(Contrabando[playerid] == 1) {
			Contrabando[playerid] = 0;
			Receita[playerid] = 0;
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_GREEN, "Contrabando cancelado.");
			return 1;
			} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ nao È contrabandista");
			return 1;
		}
	}
}
	
	if(strcmp(cmd, "/apreendercontrabando", true) == 0) {
		if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
 	    	new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/apreendercontrabando [id]");
				return 1;
			}
        	plid = strval(tmp);
   			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
   			    if(Receita[plid] == 0){
   			        SendClientMessage(playerid, COLOR_RED, "O Jogador n„o est· contrabandeando!");
					return 1;
				}
			    if(GetDistanceBetweenPlayers(playerid, plid)){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe!");
					return 1;
				}
				Presos[plid] = 1;
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET prisao = 1 WHERE nickname = '%s '", PlayerName(plid));
					if(samp_mysql_query(string2) == 0){
					 	printf("Erro na linha 3247");
					}
				}
				LogarPlayer(plid);
    			SendClientMessage(playerid, COLOR_RECEITA_FEDERAL, "Mercadoria apreendida e contrabandista preso!");
				GameTextForPlayer(playerid,"~y~Missöo cumprida! ~n~ ~n~ $500",3000,3);
    			SendClientMessage(plid, COLOR_RECEITA_FEDERAL, "A Receita Federal aprendeu a mercadoria e vocÍ tambÈm foi preso!");
       		  	GameTextForPlayer(plid, "~w~ PRESO!", 5000,0);
       		  	GivePlayerMoney(playerid, 3000);
       		  	DisablePlayerCheckpoint(plid);
       		  	AcrescentarExPoints(playerid,1);
				return 1;
			} else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È da Receita Federal!");
			return 1;
		}
	}
    if(strcmp(cmd, "/meuskin", true) == 0) {
    	new tmp[256];
		new skin;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/meuskin [id]");
			return 1;
		}
    	skin = strval(tmp);
		if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
			SendClientMessage(playerid, COLOR_RED, "ID de skin inv·lido!");
			return 1;
		}
       	if(IsPlayerConnected(playerid)){
			if(mysql == 1){
				new string2[255];
				format(string2, sizeof(string2), "UPDATE players SET skin = %d WHERE nickname = '%s '", skin, PlayerName(playerid));
				if(samp_mysql_query(string2) == 0){
			 		printf("Erro na linha 9368");
				}
			}
		    SetPlayerSkin(playerid,skin);
            SendClientMessage(playerid, COLOR_GREEN, "Nova skin colocada!");
            return 1;
    	} else {
			SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/trocardono", true)==0) {
	    if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
	        if(IsPlayerInAnyVehicle(playerid)){
				new tmp[256], plid, vid, vf[256];
				tmp = strtok(cmdtext,idx);
				if(!strlen(tmp)){
				    SendClientMessage(playerid,COLOR_RED,"/trocardono [id]");
				    return 1;
				}
				plid = strval(tmp);
				if(plid==playerid && !IsPlayerAdmin(playerid)){
				    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pode mudar a documentaÁ„o do carro para si mesmo");
				    return 1;
				}
				if(!IsPlayerConnected(plid)){
				    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado");
				    return 1;
				}
				vid=GetPlayerVehicleID(playerid);
				format(vf,256,"%d.vinfo",vid);
				set(Dono[vid],PlayerName(plid));
				dini_Set(vf,"dono",PlayerName(plid));
				SendClientMessage(playerid,COLOR_RED,"DocumentaÁ„o trocada com sucesso");
				return 1;
			}
			else {
			    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
			    return 1;
			}
		}
		else {
		    SendClientMessage(playerid,COLOR_RED,"EPA! VocÍ n„o tem permiss„o para mexer nesse comando!");
		    return 1;
		}
	}

	if(strcmp(cmd, "/setcar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, Float:ang, plid, cor1[256], cor2;

			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		    carid = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [id-do-jogador] [cor1] [cor2]");
				return 1;
			}
			if(!IsNumeric(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"O comando pede o ID, n„o o nick do jogador!");
			    SendClientMessage(playerid,COLOR_RED,"/setcar [id] [id-do-jogador] [cor1] [cor2]");
			    return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado");
			    return 1;
			}
			if(plid==playerid && !IsPlayerAdmin(playerid)){
			    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pode setar um carro para vocÍ mesmo!");
			    return 1;
			}
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [id-do-jogador] [cor1] [cor2]");
				return 1;
			}
			set(cor1,tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [id-do-jogador] [cor1] [cor2]");
				return 1;
			}
			cor2 = strval(tmp);
			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        if(IsNumeric(cor1)){
				        new string[256];
				        new File:temp;
				        new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X, Y, Z);
						GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
						if(mysql == 1){
					    	//Numero de carros j· salvos no mysql
							new id;
							{
					    		samp_mysql_select_db("infernusgroup01");
					    		if(samp_mysql_query("SELECT * FROM cars") == 0){
					    	 	   printf("Erro na linha 8836");
					    		}
								samp_mysql_store_result();
								id = samp_mysql_num_rows();
							}
							//Criar novo carro
							{
								new string2[255];
								format(string2, sizeof(string2), "INSERT INTO cars values(%d, %d, %f, %f, %f, %f, %d, %d, '%s ', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)", id+1+QTCARS, carid, X, Y, Z, ang, cor1, cor2, PlayerName(plid));
								if(samp_mysql_query(string2) == 0){
					    		   printf("Erro na linha 8845");
					    		}
							}
							//Placa
							{
								new n = random(8999) + 1000;
								new l = random(26);
								new l2 = random(26);
								new l3 = random(26);
								new string1[MAX_STRING], string2[MAX_STRING];
								format(string, sizeof(string)," %d ",l);
   								format(string1, sizeof(string1)," %d ",l2);
								format(string2, sizeof(string2)," %d ",l3);
   								new string3[255], tm[MAX_STRING];
								strcat(string3, udb_decode(string)); strcat(string3, udb_decode(string1)); strcat(string3, udb_decode(string2)); strcat(string3,"-"); valstr(tm,n);strcat(string3, tm);
								if(!dini_Isset("placas.ini", string3)){
									temp = fopen("placas.ini", io_append);
									new string4[MAX_STRING];
									strcat(string4, string3); strcat(string4, "\r\n");
									fwrite(temp, string4);
									fclose(temp);
									new string5[MAX_STRING];
						    		format(string5, sizeof(string5), "UPDATE cars SET placa = '%s ' WHERE id = %d", string3, 1+id+QTCARS);
						    		if(samp_mysql_query(string5) == 0){
					    	    		printf("Erro na linha 8871");
					    			}
						    	}
							}
						}
						LastCar++;
						AcrescentarExPoints(playerid,1);
            	        SendClientMessage(playerid, COLOR_GREEN, "Carro salvo");
            	        SetTimerEx("CriarVeiculo",10000,false,"dffffddd",carid,X,Y,Z,ang,strval(cor1),cor2,plid);
						return 1;
			        } else {
				    	SendClientMessage(playerid,COLOR_RED,"Acho que vocÍ n„o entendeu o comando. Uma breve explicaÁ„o:");
				   		SendClientMessage(playerid,COLOR_PALHA,"Agora o MPA RevolutioN RPG n„o precisa mais de ‚ngulo para setar carros,");
			    		SendClientMessage(playerid,COLOR_PALHA,"pois agora o nosso script pega o ‚ngulo para vocÍ!");
					    SendClientMessage(playerid,COLOR_PALHA,"Menos complicaÁ„o para vocÍ, na hora de setar carros");
					    SendClientMessage(playerid,COLOR_YELLOW,"MPA Clan - Infernus Development Group: Sua divers„o, nosso objetivo.");
			    		SendClientMessage(playerid,COLOR_RED," ");
					    SendClientMessage(playerid,COLOR_RED,"Sintaxe do comando: /setcar [id] [id-do-jogador] [cor1] [cor2]");
					    return 1;
			        }
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em nenhum veÌculo e assim n„o pode setar um carro.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/setarplaca", true) == 0 && IsPlayerAdmin(playerid) == 1) {
	    new tmp[256];
	    new id, novo;

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/setarplaca [id] [gravar=1/update=0]");
			return 1;
		}
	    id = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/setarplaca [id]");
			return 1;
		}
	    novo = strval(tmp);


	    if(id == 0 || id > 700){
			SendClientMessage(playerid, COLOR_RED, "O id deve ser maior que 0 e menor ou igual a 700!");
			return 1;
		}

		if(novo == 0){
			new n = random(8999) + 1000;
			new l = random(26);
			new l2 = random(26);
			new l3 = random(26);
			new string[MAX_STRING], string1[MAX_STRING], string2[MAX_STRING];
			format(string, sizeof(string)," %d ",l);
  			format(string1, sizeof(string1)," %d ",l2);
			format(string2, sizeof(string2)," %d ",l3);
   			new string3[255], tm[MAX_STRING];
			strcat(string3, udb_decode(string)); strcat(string3, udb_decode(string1)); strcat(string3, udb_decode(string2)); strcat(string3,"-"); valstr(tm,n);strcat(string3, tm);
			if(!dini_Isset("placas.ini", string3)){
				new File:temp;
				temp = fopen("placas.ini", io_append);
				new string4[MAX_STRING];
				strcat(string4, string3); strcat(string4, "\r\n");
				fwrite(temp, string4);
				fclose(temp);
				new string5[MAX_STRING];
				format(string5, sizeof(string5), "UPDATE cars SET placa = '%s ' WHERE id = %d", string3, id);
                samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string5) == 0){
				    printf("Erro na linha 8987");
				}
			}
			SendClientMessage(playerid, COLOR_GREEN, "Deve ter setado a placa!");
			return 1;
		}
		if(novo != 0){
			new n = random(8999) + 1000;
			new l = random(26);
			new l2 = random(26);
			new l3 = random(26);
			new string[MAX_STRING], string1[MAX_STRING], string2[MAX_STRING];
			format(string, sizeof(string)," %d ",l);
			format(string1, sizeof(string1)," %d ",l2);
			format(string2, sizeof(string2)," %d ",l3);
   			new string3[255], tm[MAX_STRING];
			strcat(string3, udb_decode(string)); strcat(string3, udb_decode(string1)); strcat(string3, udb_decode(string2)); strcat(string3,"-"); valstr(tm,n);strcat(string3, tm);
			if(!dini_Isset("placas.ini", string3)){
				new File:temp;
				temp = fopen("placas.ini", io_append);
				new string4[MAX_STRING];
				strcat(string4, string3); strcat(string4, "\r\n");
				fwrite(temp, string4);
				fclose(temp);
				new string5[MAX_STRING];
			   	format(string5, sizeof(string5), "INSERT INTO cars values(%d, 0, 0, 0, 0, 0, 0, 0, 0, '%s ', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)", id, string3);
                samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string5) == 0){
				    printf("Erro na linha 9015");
				}
			}
			SendClientMessage(playerid, COLOR_GREEN, "Deve ter setado a placa!");
			return 1;
		}
	}

	if(strcmp(cmd, "/setgcar", true) == 0) {
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, Float:ang, cor1[256], cor2;

			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		    carid = strval(tmp);
		    
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setgcar [id] [cor1] [cor2]");
				return 1;
			}
			set(cor1,tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setgcar [id] [cor1] [cor2]");
				return 1;
			}
			cor2 = strval(tmp);
			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        if(IsNumeric(cor1)){
				        new string[256];
				        new File:temp;
				        new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X, Y, Z);
						GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
						format(string, sizeof(string), "%d %f %f %f %f %s %d //Setado por: %s, em: %s\r\n", carid, X, Y, Z, ang, cor1, cor2, PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
						temp = fopen("gcars.rpg", io_append);
    	                fwrite(temp, string);
        	            fclose(temp);
						if(mysql == 1){
					    	//Numero de carros j· salvos no mysql
							new id;
							{
					    		samp_mysql_select_db("infernusgroup01");
					    		if(samp_mysql_query("SELECT * FROM cars") == 0){
					    	 	   printf("Erro na linha 8836");
					    		}
								samp_mysql_store_result();
								id = samp_mysql_num_rows();
							}
							//Criar novo carro
							{
								new string2[255];
								format(string2, sizeof(string2), "INSERT INTO cars values(%d, %d, %f, %f, %f, %f, %d, %d, '%s ', 0, '-1 ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)", id+1+QTCARS, carid, X, Y, Z, ang, strval(cor1), cor2, "Governo");
								if(samp_mysql_query(string2) == 0){
					    		   printf("Erro na linha 8845");
					    		}
							}
							//Placa
							{
								new n = random(8999) + 1000;
								new l = random(26);
								new l2 = random(26);
								new l3 = random(26);
								new string1[MAX_STRING], string2[MAX_STRING];
								format(string, sizeof(string)," %d ",l);
   								format(string1, sizeof(string1)," %d ",l2);
								format(string2, sizeof(string2)," %d ",l3);
   								new string3[255], tm[MAX_STRING];
								strcat(string3, udb_decode(string)); strcat(string3, udb_decode(string1)); strcat(string3, udb_decode(string2)); strcat(string3,"-"); valstr(tm,n);strcat(string3, tm);
								if(!dini_Isset("placas.ini", string3)){
									temp = fopen("placas.ini", io_append);
									new string4[MAX_STRING];
									strcat(string4, string3); strcat(string4, "\r\n");
									fwrite(temp, string4);
									fclose(temp);
									new string5[MAX_STRING];
						    		format(string5, sizeof(string5), "UPDATE cars SET placa = '%s ' WHERE id = %d", string3, 1+id+QTCARS);
						    		if(samp_mysql_query(string5) == 0){
					    	    		printf("Erro na linha 8871");
					    			}
						    	}
							}
						}
        	            LastCar++;
            	        SendClientMessage(playerid, COLOR_GREEN, "Carro salvo");
            	        SetTimerEx("CriarVeiculo",10000,false,"dffffddd",carid,X,Y,Z,ang,strval(cor1),cor2,-1);
						return 1;
			        } else {
				    	SendClientMessage(playerid,COLOR_RED,"Acho que vocÍ n„o entendeu o comando. Uma breve explicaÁ„o:");
				   		SendClientMessage(playerid,COLOR_PALHA,"Agora o MPA RevolutioN RPG n„o precisa mais de ‚ngulo para setar carros,");
			    		SendClientMessage(playerid,COLOR_PALHA,"pois agora o nosso script pega o ‚ngulo para vocÍ!");
					    SendClientMessage(playerid,COLOR_PALHA,"Menos complicaÁ„o para vocÍ, na hora de setar carros");
					    SendClientMessage(playerid,COLOR_YELLOW,"MPA Clan - Infernus Development Group: Sua divers„o, nosso objetivo.");
			    		SendClientMessage(playerid,COLOR_RED," ");
					    SendClientMessage(playerid,COLOR_RED,"Sintaxe do comando: /setcar [id] [id-do-jogador] [cor1] [cor2]");
					    return 1;
			        }
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em nenhum veÌculo e assim n„o pode setar um carro.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso");
			return 1;
		}
	}
	SendClientMessage(playerid,COLOR_RED,"Comando desconhecido pelo gamemode");
	return 1;
}



public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(Veiculo[playerid] == vehicleid){
	    DestroyVehicle(Veiculo[playerid]);
	    Veiculo[playerid] = -1;
	    return 1;
	}
	printf("OnPlayerExitVehicle(%d, %d)", playerid, vehicleid);
	return 1;
}

public sequestrar()
{
	new i;
	new sequestro;
	new string[MAX_STRING];

 	for(i=0; i<MAX_PLAYERS; i++) {
        if(Sequestro[i] == 1){
			TempoSequestro[i]++;
			TempoSequestro[i]%=11;
		 	sequestro = 10 - TempoSequestro[i];

		 	if(sequestro > 0){
		 	    format(string, MAX_STRING, "VocÍ vai ser sequestrado em %d minutos!", sequestro);
		 	    SendClientMessage(i, COLOR_RED, string);
		 	}

			if(sequestro == 0){
				SetPlayerInterior(i, 10);
				SetPlayerPos(i, 6.091180, -29.271898,1003.549988);
				SetPlayerFacingAngle(i, 0);
				Sequestro[i] = 0;
				Cativeiro[i] = 1;
				SendClientMessage(i, COLOR_RED,"VocÍ Foi SEQUESTRADO!");
				SendClientMessage(i, COLOR_RED,"Para Poder sair pague o resgate com o Comando /resgate!");
			}
		}
	}
} 
public Radar()
{
	new exesso, desconto, velocidade;
    new string[256];
	for (new i=0, Float:x, Float:y, Float:z; i < MAX_PLAYERS; i++)
	{
	    GetPlayerPos(i, x, y, z);
	    //curtime++;
		if((x >= -1579.6100 && x <= -1518.3700 && y >= 566.3600 && y <= 571.3600 && z >= 5.0000 && z <= 20.0000) || (x >= -2015.7600 && x <= -1984.4200 && y >= 513.6700 && y <= 518.6700 && z >= 30.8000 && z <= 41.5000)
		|| (x >= 1891.6900 && x <= 1896.6900 && y >= -1761.9500 && y <= -1737.0700 && z >= 10.0000 && z <= 20.0000) || (x >= 2032.0900 && x <= 2092.2700 && y >= 1652.1500 && y <= 1657.1500 && z >= 8.0000 && z <= 23.0000)){
            velocidade = Velocidade[i]; // jah arrumei!
            exesso = velocidade - 80;
 			desconto = exesso*30;
		    if(velocidade > 80 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
        		format(string, sizeof(string), "VocÍ passou no radar a %d KpH, e levou uma multa de $%d por estar acima da velocidade pemitida!", velocidade, desconto);
				SendClientMessage(i, COLOR_RED, string);
				if(mysql == 1){
    				new resultline[1024];
    				new field[128];
    				new string2[255], din;
    				format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(i));
    	   			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
		    			printf("Erro na Linha 9813");
					}
					samp_mysql_store_result();
					while(samp_mysql_fetch_row(resultline)==1)
					{
						samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
						din = strval(field);
					}
					new string3[255];
					format(string3, sizeof(string3), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din - desconto, PlayerName(i));
					if(samp_mysql_query(string3) == 0){
		 				printf("Erro na linha 9824");
					}
				}
			}
			if(velocidade < 80 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
				format(string, sizeof(string), "VocÍ passou no radar a %d KpH!", velocidade);
				SendClientMessage(i, COLOR_GREEN, string);
			}
		}
		if((x >= -1344.2700 && x <= -1339.2700 && y >= -826.4300 && y <= -781.1400 && z >= 60.0000 && z <= 100.0000) || (x >= 1076.5900 && x <= 1081.5900 && y >= 763.8400 && y <= 868.2700 && z >= 5.0000 && z <= 20.0000)
		|| (x >= 1975.6600 && x <= 1980.6600 && y >= -1527.1400 && y <= -1490.0000 && z >= 2.0000 && z <= 12.0000)){
            velocidade = Velocidade[i]; // jah arrumei!
            exesso = velocidade - 120;
 			desconto = exesso*30;
		    if(velocidade > 120 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
        		format(string, sizeof(string), "VocÍ passou no radar a %d KpH, e levou uma multa de $%d por estar acima da velocidade pemitida!", velocidade, desconto);
				SendClientMessage(i, COLOR_RED, string);
				if(mysql == 1){
    				new resultline[1024];
    				new field[128];
    				new string2[255], din;
    				format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(i));
    	   			samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
		    			printf("Erro na Linha 9813");
					}
					samp_mysql_store_result();
					while(samp_mysql_fetch_row(resultline)==1)
					{
						samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
						din = strval(field);
					}
					new string3[255];
					format(string3, sizeof(string3), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din - desconto, PlayerName(i));
					if(samp_mysql_query(string3) == 0){
		 				printf("Erro na linha 9824");
					}
				}
			}
			if(velocidade < 120 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
				format(string, sizeof(string), "VocÍ passou no radar a %d KpH!", velocidade);
				SendClientMessage(i, COLOR_GREEN, string);
			}
		}
  	}
}

stock OnPlayerEnterVehicleAsPassenger(playerid,vehicleid)
{
	if(GetVehicleModel(vehicleid) == VEH_ONIBUS)
	{
	    for(new i; i<MAX_PLAYERS; i++)
	    {
	        if(IsPlayerInVehicle(i,vehicleid) && GetPlayerState(i)== PLAYER_STATE_DRIVER)
	        {
				new money = GetPlayerMoney(playerid);
				if(money < 10){
				    SendClientMessage(playerid,COLOR_RED,"A passagem custa 10 dÛlares.");
				    RemovePlayerFromVehicle(playerid);
				    return 1;
				}
				if(money > 9){
				    SendClientMessage(playerid,COLOR_GREEN,"Passagem paga.");
				    GivePlayerMoney(playerid,-10);
				    GivePlayerMoney(i,10);
				    SendClientMessage(i,COLOR_GREEN,"VocÍ recebeu 10 dÛlares pela passagem do novo passageiro.");
				    return 1;
				}
			}
		}
	}
	printf("OnPlayerEnterVehicleAsPassenger( %s (%d),ID: %d, Modelo: %d)", PlayerName(playerid), playerid, vehicleid, GetVehicleModel(vehicleid));
	return 1;
}

stock OnPlayerEnterVehicleAsDriver(playerid,vehicleid)
{
	if(GPV[vehicleid] == -1) return 1;
	if(GPV[vehicleid] == 0 && Petrol[playerid] == 0)
	{
	    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pode andar sem combustÌvel! Das duas uma:");
	    SendClientMessage(playerid,COLOR_RED,"Ou vocÍ sai do veÌculo com a tecla de saÌda (geralmente F ou Enter)");
	    SendClientMessage(playerid,COLOR_RED,"ou peÁa a um frentista para abastecer seu carro.");
	    TogglePlayerControllable(playerid,0);
	    return 1;
	}
	if(GPV[vehicleid] == 0 && Petrol[playerid] != 0)
	{
	    SendClientMessage(playerid,COLOR_RED,"VocÍ tinha um pouco de gasolina guardado, e colocou em se carro.");
        GPV[vehicleid] = Petrol[playerid];
        Petrol[playerid] = 0;
	    return 1;
	}
	GPV[vehicleid]--;
	new str[256];
	format(str,256,"~r~Combust¢vel: ~s~%d~b~l",GPV[vehicleid]);
	GameTextForPlayer(playerid,str,500,1);
	if(!strcmp(PlayerName(playerid),Dono[vehicleid],true)){
		SendClientMessage(playerid,COLOR_GREEN,"Esse carro È seu, vocÍ pode ligar o alarme dele com /alarme.");
		return 1;
	}
	if(strcmp(PlayerName(playerid),Dono[vehicleid],true)){
		if(strcmp(PlayerName(playerid),"Governo",true)){
 		    format(str,256,"Esse carro pertence a %s.",Dono[vehicleid]);
		    SendClientMessage(playerid,COLOR_RED,str);
		}
	}
	if(Alarme[vehicleid] == 1){
	    SendClientMessage(playerid,COLOR_RED,"O alarme desse carro estava ligado.");
	    SendClientMessage(playerid,COLOR_RED,"VocÍ foi morto pelo sistema de seguranÁa.");
	    SetPlayerHealth(playerid,0);
	    return 1;
	}
	/*switch(GasTD[playerid]){
		case 0:
		    {
		        GasTD[playerid] = TextDrawCreate(480,450,str);
			}
		default:
		    {
		        TextDrawDestroy(GasTD[playerid]);
		        GasTD[playerid] = TextDrawCreate(480,450,str);
			}
	}
	TextDrawUseBox(GasTD[playerid],1);
	TextDrawColor(GasTD[playerid],COLOR_JUIZ);
	TextDrawFont(GasTD[playerid],0);
	TextDrawAlignment(GasTD[playerid],0);
	TextDrawLetterSize(GasTD[playerid],2,2);
	TextDrawTextSize(GasTD[playerid],60,30);
	TextDrawBoxColor(GasTD[playerid],0x000000AA);
	TextDrawSetShadow(GasTD[playerid],2);
	TextDrawShowForPlayer(playerid,GasTD[playerid]);
	*/
	printf("OnPlayerEnterVehicleAsDriver( %s (%d),ID: %d, Modelo: %d)", PlayerName(playerid), playerid, vehicleid, GetVehicleModel(vehicleid));
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	TogglePlayerControllable(playerid,1);
	if(GetPlayerMenu(playerid) == CPD_First && IsValidMenu(CPD_First)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,1);
	        case 1: AplicarProfissao(playerid,2);
	        case 2: AplicarProfissao(playerid,12);
	        case 3: AplicarProfissao(playerid,14);
	        case 4: AplicarProfissao(playerid,13);
	        case 5: AplicarProfissao(playerid,3);
	        case 6: AplicarProfissao(playerid,10);
	        case 7: AplicarProfissao(playerid,11);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Second && IsValidMenu(CPD_Second)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,15);
	        case 1: AplicarProfissao(playerid,6);
	        case 2: AplicarProfissao(playerid,8);
	        case 3: AplicarProfissao(playerid,37);
	        case 4: AplicarProfissao(playerid,7);
	        case 5: AplicarProfissao(playerid,18);
	        case 6: AplicarProfissao(playerid,9);
	        case 7: AplicarProfissao(playerid,34);
	        case 8: AplicarProfissao(playerid,35);
	        case 9: AplicarProfissao(playerid,19);
	        case 10: AplicarProfissao(playerid,29);
	        case 11: AplicarProfissao(playerid,33);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Third && IsValidMenu(CPD_Third)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,40);
	        case 1: AplicarProfissao(playerid,32);
	        case 2: AplicarProfissao(playerid,17);
	        case 3: AplicarProfissao(playerid,38);
	        case 4: AplicarProfissao(playerid,31);
	        case 6: AplicarProfissao(playerid,30);
	        case 7: AplicarProfissao(playerid,36);
	        case 8: AplicarProfissao(playerid,39);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Fourth && IsValidMenu(CPD_Fourth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,40);
	        case 1: AplicarProfissao(playerid,16);
	        case 2: AplicarProfissao(playerid,21);
	        case 3: AplicarProfissao(playerid,22);
	        case 4: AplicarProfissao(playerid,25);
	        case 6: AplicarProfissao(playerid,20);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Sixth && IsValidMenu(CPD_Sixth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,24);
	        case 1: AplicarProfissao(playerid,5);
	        case 2: AplicarProfissao(playerid,4);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Fifth && IsValidMenu(CPD_Fifth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,27);
	        case 1: AplicarProfissao(playerid,26);
		}
	}
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate==PLAYER_STATE_DRIVER){
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 525){
	        isTowtruck[playerid]=1;
	        Reboques++;
		    }
		else
		    {
		    if(Reboques>0){
		    	}
		    }
	    }
	if(newstate == PLAYER_STATE_DRIVER){
		new string[256];
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 523){
			switch(Profissao[playerid])
 			{
 				case COP_SWAT,COP_MILITAR,COP_NARCOTICOS,SHERIFF:
 					{
 						SendClientMessage(playerid, COLOR_GREEN, "[CENTRAL COP]Dirija sua viatura com cuidado.");
 					}
 				default:
 					{
 						SendClientMessage(playerid, COLOR_RED2, "Esse carro pertence ao Departamento de PolÌcia, para ser removida a estrela de procurado, saia do carro!");
						SendClientMessage(playerid, COLOR_COP_SWAT, "PolÌcia atr·s de vocÍ!!");
						format(string, sizeof(string), "O Jogador %s entrou em uma viatura, v· atr·s dele!",PlayerName(playerid));
						SendClientMessagePolicia(COLOR_COP_SWAT, string);
  						SetPlayerWantedLevel(playerid,1);
   						Perseguicao[playerid] = 1;
   					}
				}
			}
		}
	if((newstate==PLAYER_STATE_ONFOOT)&&(isTowtruck[playerid]==1)){
	    isTowtruck[playerid]=0;
	    Reboques--;
		}
	if(newstate == PLAYER_STATE_DRIVER){
	    new string[256];
      	new model = GetPlayerVehicleID(playerid);
        if(model == alugado1 || model == alugado2 || model == alugado3 || model == alugado4 || model == alugado5 || model == alugado6 || model == alugado7 || model == alugado8 || model == alugado9){
            if(CarroAlugado[playerid] == 0){
        		SendClientMessage(playerid, COLOR_RED2, "Esse carro È um CARRO DE ALUGUEL,");
            	SendClientMessage(playerid, COLOR_RED,  "Veja se tÍm algum Locador de Carros");
            	SendClientMessage(playerid, COLOR_RED,  "Ou fale com um admin para aluga-lÛ!");
      			SendClientMessage(playerid, COLOR_LOCADOR_DE_CARROS,"Para sair do carro digite /sair");
   			 	format(string, sizeof(string), "O Jogador %s entrou num carro de aluguel ofereÁa seu serviÁo com o /alugarcarro [id].",PlayerName(playerid));
      			SendClientMessageCarros(COLOR_LOCADOR_DE_CARROS, string);
				TogglePlayerControllable(playerid, 0);
				JogadorNoCarro[playerid] = 1;
			}
			else if(CarroAlugado[playerid] == 1){
			    SendClientMessage(playerid, COLOR_GREEN, "Aproveite bem, seu tempo nesse carro È de 5 minutos");
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER){
	    OnPlayerEnterVehicleAsDriver(playerid,GetPlayerVehicleID(playerid));
	}
	if(newstate == PLAYER_STATE_PASSENGER){
	    OnPlayerEnterVehicleAsPassenger(playerid,GetPlayerVehicleID(playerid));
	}
	if(newstate == PLAYER_STATE_ONFOOT){
	    switch(GasTD[playerid]){
	        case 0: GasTD[playerid] = Text:0;
			default:
			    {
					TextDrawDestroy(GasTD[playerid]);
					GasTD[playerid] = Text:0;
			    }
		}
		if(Perseguicao[playerid] == 1){
		    new string[256];
            SendClientMessage(playerid,COLOR_GREEN,"VocÍ saiu do veÌculo, n„o est· sendo mais procurado!");
            SetPlayerWantedLevel(playerid,0);
            format(string, sizeof(string), "O Jogador %s saiu do carro da polÌcia conforme solicitado, n„o precisa mais ir atr·s dele!",PlayerName(playerid));
			SendClientMessagePolicia(COLOR_COP_SWAT, string);
            Perseguicao[playerid] = 0;
            return 1;
 		}
		if(Carregamento[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ perdeu sua carga por ter saÌdo do veÌculo.");
		    Carregamento[playerid] = 0;
			return 1;
		}
		else if(Carga[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ perdeu sua carga por ter saÌdo do carro-forte.");
		    Carga[playerid] = 0;
			return 1;
		}
		else if(Pedras[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ perdeu sua carga por ter saÌdo do caminh„o");
		    Pedras[playerid] = 0;
			return 1;
		}
	    else if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COLOR_GREEN, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COLOR_RED, "VocÍ recebeu o valor da corrida atÈ aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
			return 1;
		}
		else if(ATaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COLOR_PALHA, "Espero que tenha gostado da viagem. Volte sempre.");
		    SendClientMessage(ATaximetro[playerid][1], COLOR_GREEN, "VocÍ recebeu o valor da viagem aÈrea atÈ aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(ATaximetro[playerid][1], PrecoCorrida[playerid]);
		    PrecoCorrida[playerid] = 0;
		    ATaximetro[playerid][1] = 0;
		    ATaximetro[playerid][0] = 0;
			return 1;
		}
		else if(MTaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COLOR_GREEN, "Espero que tenha gostado do passeio. Volte sempre.");
		    SendClientMessage(MTaximetro[playerid][1], COLOR_GREEN, "VocÍ recebeu o valor da corrida atÈ aqui.");
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

public CarrosParaAlugar(vehiclemodel_carrosalugar) {
	for(new i_carrosalugar = 0; i_carrosalugar <= sizeof(carrosalugar); i_carrosalugar++) {
	    if(carrosalugar[i_carrosalugar] == vehiclemodel_carrosalugar) return 1;
	}
	return 0;
}
public TempoAlugando(playerid) {
	TmpAlugar[playerid]++;
	TempoAlugar[playerid] = 0;
	CarroAlugado[playerid] = 0;
    OferecerCarro[playerid] = 0;
    RemovePlayerFromVehicle(playerid);
	SendClientMessage(playerid,COLOR_GREEN,"O aluguel acabou.!");
	SendClientMessage(playerid,COLOR_GREEN,"Se quiser alugue o carro de novo!");
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
public OnPlayerEnterCheckpoint(playerid)
{
 	if (gdebug >=1){printf("OnPlayerEnterCheckpoint %d",playerid);}
	switch (CheckpointStatus[playerid])
	{
		case CONTRABANDOINI:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Pegue o ~r~produto", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Entre no navio e pegue seu produto falsificado.");
		   		SetPlayerPos(playerid,-2329.10,1530.41,17.33);
		   		DisablePlayerCheckpoint(playerid);
		   		SetPlayerCheckpoint(playerid,-2372.10,1551.64,2.12,1.4);
				CheckpointStatus[playerid] = CONTRABANDONAVIO;
			}
 		case CONTRABANDONAVIO:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Va para o ~r~ponto", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Pule daqui e va ate outro ponto indicado, cuidado pra nao molhar a mercadoria.");
			   	DisablePlayerCheckpoint(playerid);
	  			SetPlayerCheckpoint(playerid,-2436.35,1528.98,17.34,1.4);
				CheckpointStatus[playerid] = CONTRABANDONAVIO2;
			}
   		case CONTRABANDONAVIO2:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		SendClientMessage(playerid, COLOR_GREEN, "Corra para a rampa.");
		   		DisablePlayerCheckpoint(playerid);
	   			SetPlayerPos(playerid,-2436.29,1524.75,18.19);
	   			SetPlayerCheckpoint(playerid,-2650.08,1361.02,7.31,1.4);
				CheckpointStatus[playerid] = CONTRABANDORAMPA;
			}
		case CONTRABANDORAMPA:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Suba a ~r~rampa", 5000, 1);
      			SendClientMessage(playerid, COLOR_GREEN, "Jogue o produto no mar, um pescador ira pegar depois. Cuidado para nao cair.");
		   		DisablePlayerCheckpoint(playerid);
		   		SetPlayerCheckpoint(playerid,-2659.74,1530.51,54.97,1.4);
				CheckpointStatus[playerid] = CONTRABANDOFINAL;
			}
		case CONTRABANDOFINAL:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~r~Cuidado...", 5000, 1);
		   		SetPlayerPos(playerid,-2659.69,1534.64,54.42);
		   		SendClientMessage(playerid, COLOR_GREEN, "VocÍ caiu no mar e se molhou, mas conseguiu salvar o produto, o chefe te deu $1000.");
		   		DisablePlayerCheckpoint(playerid);
		   		Contrabando[playerid] = 0;
		   		Receita[playerid] = 0;
		   		GivePlayerMoney(playerid,2000);
				DisablePlayerCheckpoint(playerid);
				AcrescentarExPoints(playerid,1);
 			}
	}
	switch (nCheckpointStatus[playerid])
	{
		case NACAMA:
		    {
				SendClientMessage(playerid, COLOR_ROSA2, "VocÍ entrou no checkpoint e saiu do sexo");
				SendClientMessage(Prostitutacama[playerid], COLOR_ROSA2, "Seu cliente saiu do sexo e vocÍ voltou para a porta da boate!");
		  		DisablePlayerCheckpoint(playerid);
		  		SetPlayerPos(playerid,694.0500,1951.5970,5.5432);
		  		SetPlayerInterior(playerid,0);
		  		SetPlayerPos(Prostitutacama[playerid],693.5875,1962.9760,5.5391);
		  		SetPlayerInterior(Prostitutacama[playerid],0);
		  		SendClientMessage(playerid, COLOR_ROSA2, "Foi paga uma quantia de $400 pelo sexo.");
		  		SendClientMessage(Prostitutacama[playerid], COLOR_ROSA2,"VocÍ recebeu seu pagamento!");
		  		GivePlayerMoney(Prostitutacama[playerid], 800);
	        	GivePlayerMoney(playerid, -400);
				TextDrawHideForPlayer(playerid,tdStrip);
			    AreaStrip[playerid] = 0;
			    AcrescentarExPoints(Prostitutacama[playerid],1);
			}
		}
	if(MissaoLixeiro[playerid] == 1){
	    if(IsPlayerInAnyVehicle(playerid)){
	        SendClientMessage(playerid,COLOR_RED,"Saia do caminh„o para coletar o lixo daqui");
	        return 1;
		} else {
		    if(LixoColetado[playerid] < 9){
		    	SendClientMessage(playerid,COLOR_RED2,"Lixo coletado.");
			    DisablePlayerCheckpoint(playerid);
				new rt = random(73);
				SetPlayerCheckpoint(playerid,LixeirasCheckpoints[rt][0],LixeirasCheckpoints[rt][1],LixeirasCheckpoints[rt][2],3.0);
				SendClientMessage(playerid,COLOR_RED2,"Ainda tem mais latas para coletar!");
				LixoColetado[playerid]++;
				return 1;
			} else {
			    DisablePlayerCheckpoint(playerid);
			    SendClientMessage(playerid,COLOR_RED2,"ParabÈns, vocÍ completou a miss„o de coletar lixo!");
			    SendClientMessage(playerid,COLOR_RED2,"Agora v· atÈ o lix„o e descarregue.");
			    LixoColetado[playerid]++;
			    return 1;
			}
		}
	}
	switch(CPD_CPHandling[playerid]){
	    case 1: {
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - atÈ nÌvel 10");
	        ShowMenuForPlayer(CPD_First,playerid);
	        TogglePlayerControllable(playerid,0);
	    }
	    case 2: {
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - 20 atÈ nÌvel 40");
	        ShowMenuForPlayer(CPD_Second,playerid);
	        TogglePlayerControllable(playerid,0);
	    }
        case 3: {
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - 50 atÈ nÌvel 70");
	        ShowMenuForPlayer(CPD_Third,playerid);
	        TogglePlayerControllable(playerid,0);
	    }
	    case 4: {
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - 80 atÈ nÌvel 90");
	        ShowMenuForPlayer(CPD_Fourth,playerid);
	        TogglePlayerControllable(playerid,0);
	    }
	    case 5: {
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - nÌvel 100");
	        ShowMenuForPlayer(CPD_Fifth,playerid);
	        TogglePlayerControllable(playerid,0);
	    }
	    case 6: {
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - 140 atÈ nÌvel 150");
	        ShowMenuForPlayer(CPD_Sixth,playerid);
	        TogglePlayerControllable(playerid,0);
		}
	}
	if(AreaBombShop[playerid] == 1){
		SendClientMessage(playerid, COLOR_GREEN, "VocÍ entrou na loja de bombas!");
		if(IsPlayerInAnyVehicle(playerid)){
		    ShowMenuForPlayer(Bombshopveh,playerid);
			return 1;
		}
		if(!IsPlayerInAnyVehicle(playerid)){
		    ShowMenuForPlayer(Bombshop,playerid);
		    return 1;
		}
		return 1;
	}
	return 1;
}
public ContrabandoNavio() {
	for(new i=0; i<MAX_PLAYERS; i++){
		if(Contrabando[i] == 360000){
		 ContrabandoPassar[i]++;
		}
		if(Contrabando[i] == 0) {
		}
	}
}
public Desmanche(playerid) {
	TempoDesmanche[playerid] = 0;
	SendClientMessage(playerid,COLOR_YELLOW,"Tempo de espera do desmanche terminado.");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("Jogador de ID %d (%s) deixou um checkpoint", playerid, PlayerName(playerid));
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	TogglePlayerControllable(playerid,1);
	return 1;
}

stock AplicarProfissao(playerid,profid)
{
	if(!PLAYERLIST_authed[playerid]) return -1;
	new XL;
	if(mysql == 1){
   		new resultline[1024];
   		new field[128];
   		new string2[255];
   		format(string2, sizeof(string2),"SELECT xl FROM players WHERE nickname = '%s '", PlayerName(playerid));
   	   	samp_mysql_select_db("infernusgroup01");
		if(samp_mysql_query(string2) == 0){
	    	printf("Erro na Linha 6111");
		}
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)==1)
		{
			samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
			XL = strval(field);
		}
	}
	if(XL < ProfLevel[profid]){
		new tmp[256];
		format(tmp,256,"Seu level n„o È suficiente para a profiss„o %s. MÌnimo de level: %d, o seu: %d",ProfExtName[profid],ProfLevel[profid],udb_getXL(PlayerName(playerid)));
		SendClientMessage(playerid,COLOR_RED,tmp);
		return 1;
	} else {
	    new string[256];
		if(mysql == 1){
			new string2[255];
			format(string2, sizeof(string2), "UPDATE players SET skin = %d,prof = %d WHERE nickname = '%s '", ProfSkin[profid], profid, PlayerName(playerid));
			if(samp_mysql_query(string2) == 0){
			 	printf("Erro na linha 10383");
			}
		}
	    SendClientMessage(playerid,COLOR_GREEN,"Profiss„o aplicada. Digite /profissao para saber como agir agora!");
		new msg[256];
		format(msg,256,"SERVIDOR: O jogador %s agora È %s.",PlayerName(playerid),ProfExtName[profid]);
		SendClientMessage(playerid,COLOR_COP_SWAT,msg);
		Profissao[playerid] = profid;
		LogarPlayer(playerid);
		SetPlayerPos(playerid,ProfPos[profid][0],ProfPos[profid][1],ProfPos[profid][2]);
		format(string,sizeof(string),"~w~%s",ProfGT[profid]);
		GameTextForPlayer(playerid,string,3000,3);
		return 1;
	}
}
public CPD_CPHandler()
{
	for(new i; i<MAX_PLAYERS; i++){
		new Float:prevdist = 100000.000;
		new prevcp;
		for(new cpid; cpid < 6; cpid++){
		    new Float:dist;
		    dist = GetPlayerDistanceToPointEx(i,CPD_CPPositions[cpid][0],CPD_CPPositions[cpid][1],CPD_CPPositions[cpid][2]);
			if((dist < prevdist)){
			    prevdist = dist;
			    prevcp = cpid;
			}
		}
		if(GetPlayerDistanceToPointEx(i,CPD_CPPositions[prevcp][0],CPD_CPPositions[prevcp][1],CPD_CPPositions[prevcp][2]) < 30) {
		    if(CPD_CPHandling[i] != prevcp+1){
			    SetPlayerCheckpoint(i,CPD_CPPositions[prevcp][0],CPD_CPPositions[prevcp][1],CPD_CPPositions[prevcp][2],2.0);
			    CPD_CPHandling[i] = prevcp+1;
			}
		} else {
		    CPD_CPHandling[i] = 0;
		    DisablePlayerCheckpoint(i);
		}
	}
}
stock AcrescentarExPoints(playerid,points)
{
	if(ExPoints[playerid]+points > 4){
		if(mysql == 1){
    		new resultline[1024];
    		new field[128];
    		new string2[255], XL;
    		format(string2, sizeof(string2),"SELECT xl FROM players WHERE nickname = '%s '", PlayerName(playerid));
    		samp_mysql_select_db("infernusgroup01");
			if(samp_mysql_query(string2) == 0){
				printf("Erro na Linha 10433");
			}
			samp_mysql_store_result();
			while(samp_mysql_fetch_row(resultline)==1)
			{
				samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
				XL = strval(field);
			}
			new string3[255];
			format(string3, sizeof(string3), "UPDATE players SET xl = %d WHERE nickname = '%s '", XL+1, PlayerName(playerid));
			if(samp_mysql_query(string3) == 0){
				printf("Erro na linha 10444");
			}
		}
	    SendClientMessage(playerid,COLOR_GREEN,"VocÍ alcanÁou 5 Experience Points e subiu mais um Level");
	    ExPoints[playerid]=ExPoints[playerid]-5;
	} else {
	    ExPoints[playerid]=ExPoints[playerid]+points;
	}
	return 1;
}
public GatesCoordChecker()
{
	new Float:X, Float:Y, Float:Z;
	for(new p; p<4; p++){
	    new Plocalizado;
	    for(new i; i<MAX_PLAYERS; i++){
			if(IsPlayerConnected(i) && Profissao[i] == COP_SWAT){
			    GetPlayerPos(i,X,Y,Z);
				if(GetDistanceToObject(i,Gates[p]) < 10) {
					Plocalizado=1;
				}
			}
		}
		if(Plocalizado == 1){
			if(PortaoAbrindo[p] == 0 && PortaoAberto[p] == 0){
			    PortaoAbrindo[p]=1;
				SetTimerEx("OpenGate",50,0,"d",p);
			}
		} else {
		    if(PortaoFechando[p] == 0 && PortaoAberto[p] == 1){
		        PortaoFechando[p]=1;
		        SetTimerEx("CloseGate",50,0,"d",p);
			}
		}
	}
	return 1;
}

public AplicarGasosa(playerid,vehicleid,amount)
{
	SendClientMessage(playerid,COLOR_GREEN,"VeÌculo abastecido!");
	GPV[vehicleid]=amount;
	TogglePlayerControllable(playerid,1);
	return 1;
}

public Bancos(playerid)
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {

			if((X >= 1700.1732 && X <= 1741.9966 && Y >= -1721.5967 && Y <= -1605.9054) || (X >= 273.1707 && X <= 277.4148 && Y >= -197.0651 && Y <=-193.6782) || (X >= -2482.7346 && X <= -2386.7249 && Y >= 461.5373 && Y <= 552.1155) || (X >= 972.7372 && X <= 1072.9083 && Y >= -1133.2140 && Y <= -1110.8668) || (X >=1312.7900  && X <= 1308.4067&& Y >= -1367.9095 && Y <= -1371.5090) || (X >= -1602.2081 && X <= -1598.3412 && Y >= 871.0275 && Y <= 873.9095)){
			    if(AreaBanco[i] == 0){
			    	SendClientMessage(i, COLOR_GREEN, "Banco MPA- Comandos:");
					SendClientMessage(i, COLOR_GREEN, "/depositar, /sacar, /extrato");
					SendClientMessage(i, COLOR_GREEN, "/saldocell - Saldo via celular, custo: $5");
			        AreaBanco[i] = 1;
					TextDrawShowForPlayer(i,Banco);
				}
			}
			else if((X >= -189.6245 && X <=-181.2027  && Y >= 1130.2980 && Y <= 1137.0016) || (X >=1308.1733 && X <=1312.2943  && Y >= -1373.0317 && Y <= -1368.2721) || (X >= 2172.9221 && X <= 2190.9502 && Y >= 1105.2529 && Y <= 1126.5010) || (X >= -832.2738 && X <= -824.9122 && Y >= 1492.7100 && Y <= 1503.3075) || (X >= 385.5901 && X <= 409.1007 && Y >= -1823.7596 && Y <= -1797.2906) || (X >= -1785.4990 && X <= -1714.4250 && Y >= 929.3326 && Y <= 974.9125)){
			    if(AreaBanco[i] == 0){
			    	SendClientMessage(i, COLOR_GREEN, "Banco MPA- Comandos:");
					SendClientMessage(i, COLOR_GREEN, "/depositar, /sacar, /extrato");
					SendClientMessage(i, COLOR_GREEN, "/saldocell - Saldo via celular, custo: $5");
			        AreaBanco[i] = 1;
					TextDrawShowForPlayer(i,Banco);
				}
			}
			else if((X >= -1978.6537 && X <= -1961.9292 && Y >= 113.2442 && Y <= 162.6734) || (X >= -2482.7346 && X <= -2386.7249 && Y >= 461.5373 && Y <= 552.1155)){
			    if(AreaBanco[i] == 0){
			    	SendClientMessage(i, COLOR_GREEN, "Banco MPA- Comandos:");
					SendClientMessage(i, COLOR_GREEN, "/depositar, /sacar, /extrato");
					SendClientMessage(i, COLOR_GREEN, "/saldocell - Saldo via celular, custo: $5");
			        AreaBanco[i] = 1;
					TextDrawShowForPlayer(i,Banco);
				}
			}
			
			else if((X >= -37.2183 && X <= -14.1099 && Y >= -91.8006 && Y <= -74.6845) || (X >= -34.6621 && X <= -2.6782 && Y >= -31.4095 && Y <= -25.6232) || (X >= -36.5483 && X <= -17.2655 && Y >= -57.9948 && Y <= -49.2967)){
				if(AreaCreditos[i] == 0) {
				    TextDrawShowForPlayer(i,td247);
					SendClientMessage(i, COLOR_PALHA, "Loja de utilidades 1,99 24/7 - Comandos:");
					SendClientMessage(i, COLOR_GREEN, "/celular = para compra do celular | /lista = para compra da lista telefÙnica");
					SendClientMessage(i, COLOR_GREEN, "/recarga = recarga dos crÈditos do seu celular.");
					SendClientMessage(i, COLOR_GREEN, "/revosena [num1] [num2] [num3] [num4] [num5] [num6]");
					SendClientMessage(i, COLOR_GREEN, "/revosena-surpresinha = Loteria de n˙meros gerados automaticamentes.");
					AreaCreditos[i] = 1;
				}
			}
			else if((X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425)||(X >= -604.5089&& X <= -499.5553 && Y >= 1365.5953 && Y <= 1495.0166)){
			    if(AreaPesca[i] == 0){
		    		TextDrawShowForPlayer(i,tdPesca);
                	AreaPesca[i] = 1;
				}
            }
			else if((X >= -185.0819 && X <= -181.3076 && Y >= 1128.8409 && Y <= 1137.8021 || X >= 2085.2280 && X <= 2097.5901 && Y >= 2039.6287 && Y <= 2059.9014 || X >= 2403.0515 && X <= 2413.5774 && Y >= 1978.4894 && Y <= 1987.9479 || X >= -2453.4795 && X <= -2432.7678 && Y >= 738.0231 && Y <= 755.7155)){
			    if(AreaBanco[i] == 0){
			    	SendClientMessage(i, COLOR_GREEN, "Banco MPA- Comandos:");
					SendClientMessage(i, COLOR_GREEN, "/depositar, /sacar, /extrato");
					SendClientMessage(i, COLOR_GREEN, "/saldocell - Saldo via celular, custo: $5");
			        AreaBanco[i] = 1;
					TextDrawShowForPlayer(i,Banco);
				}
			}
			else if((X >=-105.8169 && X <=-60.5226 && Y >=1209.1315 && Y <= 1238.4594) || (X >=-49.8968 && X <=29.5630&& Y >=1209.8110 && Y <= 1240.4807) || (X >= -9.7603 && X <= 27.8653 && Y >=1158.2960 && Y <= 1192.9319) || (X >=63.8030&& X <= 107.1460 && Y >=1152.9720 && Y <= 1189.1528)){
			    if(AreaHotel[i] == 0){
					TextDrawShowForPlayer(i,Hotel);
					SendClientMessage(i,COLOR_VERDE_AQUA,"VocÍ entrou na ·rea de um hotel. Para mais informaÁıes, digite /hotelinfo");
					AreaHotel[i] = 1;
				}
			}
            else if(X >= -231.1121 && X <=-208.7958 && Y >= 972.6275 && Y <= 1000.6964){
                if(AreaDeleg[i] == 0){
					TextDrawShowForPlayer(i,Delegacia);
	         		AreaDeleg[i] = 1;
				}
            }

			else if(X >= -1939.2307 && X <= -1734.4812 && Y >= -1738.5444 && Y <= -1544.6968){
			    if(AreaLixao[i] == 0){
			        TextDrawShowForPlayer(i,tdLixao);
			        AreaLixao[i] = 1;
				}
			}

			else if(X >= -342.2708 && X <=-294.6999 && Y >= 1011.9537&& Y <=1071.6453){
				if(AreaHosp[i] == 0){
					TextDrawShowForPlayer(i,Hospital);
					AreaHosp[i] = 1;
				}
			}

			else if(X >= -128.211 && X <= -113.188 && Y >= 851.6620 && Y <= 860.889){
			    if(AreaDesmanche[i] == 0){
			        TextDrawShowForPlayer(i,tdDesmanche);
			        AreaDesmanche[i] = 1;
				}
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675) || (X >= 590.5313 && X <= 635.5209 && Y >= 1674.5238 && Y <= 1707.7955 || (X >= 1374.8701 && X <= 1390.7919 && Y >= 460.7597 && Y <= 461.7661))){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >=-94.9835 && X <= -89.6581 && Y >= -1184.5673 && Y <= -1147.5620) ||(X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 2629.4885  && X <=2649.0012 && Y >=1093.5876 && Y <=1117.8594)|| (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) ||(X >= 53.4239 && X <= 90.0274 && Y >= 1204.0210 && Y <= 1224.3071) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if( (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 1368.9551 && X <= 1408.8533 && Y >= 1763.6663 && Y <= 1776.5144) || (X >= -1274.6521 && X <= -1220.1176 && Y >= -91.9231 && Y <= -101.3978) || (X >= 1364.6108 && X <= 1464.9171 && Y >= -2473.7749 && Y <= -2406.1863)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= -1610.9099 && X <= -1496.5111 && Y >= 1279.2794 && Y <= 1295.2489)|| (X >= -669.5583 && X <= -570.1441 && Y >= 868.4940 && Y <= 889.6298)){
			    if(AreaCoopPesca[i] == 0){
					TextDrawShowForPlayer(i,tdCoopPesca);
                	AreaCoopPesca[i] = 1;
				}
			}
			else if((X >= -1340.3522 && X <= -1382.2689 && Y >= 2033.8461 && Y <= 2117.5579)){
			    if(AreaCoopPesca[i] == 0){
					TextDrawShowForPlayer(i,tdCoopPesca);
                	AreaCoopPesca[i] = 1;
				}
			}
        	else if(X >= -2062.2964 && X <= -2020.8334 && Y >= -1616.9932 && Y <= -1510.9994){
			    if(AreaCaca[i] == 0){
					TextDrawShowForPlayer(i,tdCaca);
                	AreaCaca[i] = 1;
				}
			}
			else if((X >= -2822.2483 && X <= -2804.7324 && Y >= -1533.1261 && Y <= -1533.1261)||(X >= -414.1279 && X <= -344.1221 && Y >= 1156.0779 && Y <= 1184.7921)){
			    if(AreaCoopCaca[i] == 0){
					TextDrawShowForPlayer(i,tdCoopCaca);
                	AreaCoopCaca[i] = 1;
				}
			}
			else if(X >= 603.8560 && X <= 698.5577 && Y >= 1712.9468 && Y <= 1722.0671){
				if(AreaCarga[i] == 0){
				    TextDrawShowForPlayer(i,tdAreaCarga);
				    AreaCarga[i] = 1;
				}
			}
			else if(X >= -70.6976 && X <= -40.9113 && Y >= -1159.8073 && Y <= -1101.6296){
				if(AreaDescarga[i] == 0){
				    TextDrawShowForPlayer(i,tdAreaDescarga);
				    AreaDescarga[i] = 1;
				}
			}
			else if(X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717){
			    if(AreaFazenda[i] == 0){
			    	TextDrawShowForPlayer(i,tdPlant);
				    AreaFazenda[i] = 1;
				}
			}
			else if(X >= -1098.3835 && X <= -1080.9955 && Y >= -1280.2528 && Y <= -1268.6240){
			    if(Leite[i] == 0){
			    	TextDrawShowForPlayer(i,tdLeite);
				    Leite[i] = 1;
				}
			}
		    else if(X >= -1086.2097 && X <= -1040.9519 && Y >= -1232.5966 && Y <= -1156.6401){
		        if(AreaCoopFazenda[i] == 0){
		            TextDrawShowForPlayer(i,tdColheita);
					AreaCoopFazenda[i] = 1;
				}
			}
		    else if(X >= 2520.7192 && X <= 2597.7166 && Y >= 1962.3511 && Y <= 2001.7731){
		        if(AreaForte[i] == 0){
					TextDrawShowForPlayer(i,tdForte);
					AreaForte[i] = 1;
				}
			}
			else if(X >= -2135.8237 && X <= -2018.0640 && Y >= 198.6757 && Y <= 308.0062){
				if(Construcao[i] == 0){
  					TextDrawShowForPlayer(i,tdConstrucao);
			    	Construcao[i] = 1;
				}
			}
		    else if(X >= 600.7289 && X <= 697.5099 && Y >= 817.7690 && Y <= 876.9632){
			    if(PedreiraCarga[i] == 0){
			        TextDrawShowForPlayer(i,tdPdCarga);
			   		PedreiraCarga[i] = 1;
				}
			}
		    else if(X >= 1205.7113 && X <= 1216.2025 && Y >= -40.9615 && Y <= -26.0245){
			    if(AreaStrip[i] == 0){
					TextDrawShowForPlayer(i,tdStrip);
					new name[MAX_PLAYER_NAME];
		   			if(Profissao[i] == PROSTITUTA){
						GetPlayerName(playerid,name,sizeof(name));
						SendClientMessage(i,COLOR_ROSA, "VocÍ pode danÁar aqui para seus clientes basta digitar /strip-tease [id].");
					   	AreaStrip[i] = 1;
					}
				}
			}
			else {
			    if(AreaDesmanche[i] == 1){
			        TextDrawHideForPlayer(i,tdDesmanche);
			        AreaDesmanche[i] = 0;
				}
				if(AreaLixao[i] == 1){
				    TextDrawHideForPlayer(i,tdLixao);
				    AreaLixao[i] = 0;
				}
				if(AreaCoopFazenda[i] == 1){
				    TextDrawHideForPlayer(i,tdColheita);
				    AreaCoopFazenda[i] = 0;
				}
				if(AreaFazenda[i] == 1){
				    TextDrawHideForPlayer(i,tdPlant);
				    AreaFazenda[i] = 0;
				}
				if(Leite[i] == 1){
				    TextDrawHideForPlayer(i,tdLeite);
				    Leite[i] = 0;
				}
				if(AreaBanco[i] == 1) {
					TextDrawHideForPlayer(i,Banco);
					AreaBanco[i] = 0;
				}
				if(AreaPosto[i] == 1) {
				    TextDrawHideForPlayer(i,Posto);
				    AreaPosto[i] = 0;
				}
				if(AreaForte[i] == 1){
					TextDrawHideForPlayer(i,tdForte);
					AreaForte[i] = 0;
				}
				if(AreaDeleg[i] == 1){
				    TextDrawHideForPlayer(i,Delegacia);
				    AreaDeleg[i] = 0;
				}
				if(AreaHosp[i] == 1){
				    TextDrawHideForPlayer(i,Hospital);
				    AreaHosp[i] = 0;
				}
				if(AreaPesca[i] == 1) {
				    TextDrawHideForPlayer(i,tdPesca);
				    AreaPesca[i] = 0;
				}
				if(AreaCoopPesca[i] == 1) {
				    TextDrawHideForPlayer(i,tdCoopPesca);
				    AreaCoopPesca[i] = 0;
				}
				if(AreaCaca[i] == 1) {
				    TextDrawHideForPlayer(i,tdCaca);
				    AreaCaca[i] = 0;
				}
				if(AreaCoopCaca[i] == 1){
					TextDrawHideForPlayer(i,tdCoopCaca);
					AreaCoopCaca[i] = 0;
				}
				if(AreaHotel[i] == 1){
					TextDrawHideForPlayer(i,Hotel);
					AreaHotel[i] = 0;
				}
			    if(PedreiraCarga[i] == 1){
			        TextDrawHideForPlayer(i,tdPdCarga);
			   		PedreiraCarga[i] = 0;
				}
				if(Construcao[i] == 1){
  					TextDrawHideForPlayer(i,tdConstrucao);
			    	Construcao[i] = 0;
				}
				if(AreaCreditos[i] == 1){
				    TextDrawHideForPlayer(i,td247);
				    AreaCreditos[i] = 0;
				}
				if(AreaCarga[i] == 1){
				    TextDrawHideForPlayer(i,tdAreaCarga);
				    AreaCarga[i] = 0;
				}
				if(AreaStrip[i] == 1){
			        TextDrawHideForPlayer(i,tdStrip);
			        AreaStrip[i] = 0;
				}
				if(AreaDescarga[i] == 1){
				    TextDrawHideForPlayer(i,tdAreaDescarga);
				    AreaDescarga[i] = 0;
				}
				if(AreaBombShop[i] == 1) {
				    AreaBombShop[i] = 0;
				}
			}
		}
	}
}

public LoteriaComeco()
{
	new rand1, rand2, rand3;
	rand1 = minrand(1,20);
	rand2 = minrand(1,20);
	while(rand2 == rand1){
		rand2 = minrand(1,20);
	}
	rand3 = minrand(1,20);
	while(rand3 == rand2 || rand3 == rand2){
	    rand3 = minrand(1,20);
	}
	new string[256];
	format(string, sizeof(string), "REVO-SENA - Resultado do concurso: %d, %d, %d", rand1, rand2, rand3);
	SendClientMessageToAll(COLOR_PALHA, string);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i) && PlayerDentro[i])
	    {
			for(new j = 0; j < 5; j++)
			{
			    if(Aposta[i][j] == rand1 || Aposta[i][j] == rand2 || Aposta[i][j] == rand3)
			    {
			        Acertos[i]++;
			    }
			}
			for(new j = 0; j < 5; j++)
		    Aposta[i][j]=0;
			if(Acertos[i] > 0)
			{
			    format(string, sizeof(string), "Seu palpite estava com os numÈros corretos! VocÍ venceu e ganhou $200.000");
			    SendClientMessage(i, COLOR_PALHA, string);
		    	GivePlayerMoney(i,100000);
			    Acertos[i]=0;
			}
			PlayerDentro[i]=false;
			SetTimer("LoteriaComeco",30000,false);
	    }
	}
}
public strtik(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ','))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ',') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return 1;
}
public Assalto(playerid){
	TempoAssalto[playerid]=0;
	new rand = random(1);
	new string[256];
	if(rand == 1){
	    SendClientMessage(playerid, COLOR_RED, "AVISO : Os policiais est„o atr·s de vocÍ!");
		format(string, sizeof(string), "%s suspeito de assaltar um banco nas proximidades de:  %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
		SendClientMessagePolicia(COLOR_COP_SWAT, string);
		return 1;
	}
	else {
        SendClientMessage(playerid,COLOR_GREEN, "Que jogada, roubo bem articulado. Os cops nem sabem aonde procurar!");
        return 1;
	}
}
public Calma() {
	for(new i=0; i<MAX_PLAYERS; i++){
		if(TempoCalma[i] == 60000){
		 EsperaTempoPassar[i]++;
		}
		if(TempoCalma[i] == 0) {
		}
	}
}
public Desmancheveiculo() {
	for(new i;i<MAX_PLAYERS;i++){
	    if(Profissao[i] != LADRAO_DE_CARROS) return 1;
		new string[256];
		new n = random(MAX_DESMANCHEVEICULO);
		format(string, sizeof(string),"Aew! Maluco t· afim de discolar um carro pra nÛs ? Que tal um(a) %s?", Veiculosprocuradosnome[n]);
		SendClientMessage(i,COLOR_AZULPLUS, string);
		Veiculoprocurado = Veiculosprocurados[n];
	}
	return 1;
}

public Pesca(playerid)
{
	QtPescas[playerid]++;
	PescaInProgress[playerid] = 0;
	SendClientMessage(playerid,COLOR_GREEN,"Sua rede voltou. Se quiser continuar pescando, fique a vontade.");
	SendClientMessage(playerid,COLOR_GREEN,"Se n„o, v· a cooperativa de pescas e venda seu pescado.");
}

public Caca(playerid)
{
	QtCacas[playerid]++;
	CacaInProgress[playerid] = 0;
	SendClientMessage(playerid,COLOR_GREEN,"Sua caÁa est· pronta para ser vendida!");
	SendClientMessage(playerid,COLOR_GREEN,"Se quiser continuar caÁando, fique a vontade.");
	SendClientMessage(playerid,COLOR_GREEN,"Se n„o, v· a cooperativa de caÁa e venda sua caÁa.");
}
public Fazenda(playerid)
{
	QtMilho[playerid]++;
	FazendaInProgress[playerid] = 0;
	SendClientMessage(playerid,COLOR_AGRICULTOR,"A colheita e o ensacamento est„o completos. Se quiser continuar plantando, fique a vontade.");
	SendClientMessage(playerid,COLOR_GREEN,"Caso contr·rio, v· atÈ a ·rea de venda do milho e o venda.");
}
public LeiteA(playerid)
{
	QtLeite[playerid]++;
	LeiteInProgress[playerid] = 0;
	ApplyAnimation( playerid,"ped", "fucku", 4.1, 0, 1, 1, 1, 1 );
	SendClientMessage(playerid,COLOR_AGRICULTOR,"CÍ tirÙ todo o leite da vaca. V· vender l· na fazenda cumpade.Se quiser continuar pegando nas teta.");
	SendClientMessage(playerid,COLOR_AGRICULTOR,"Caso adverso, v· atÈ a ·rea de venda do milho/leite e o venda.");
}
public Prostituir(playerid)
{
	ApplyAnimation(playerid,"benchpress","gym_bp_up_B",4.1,0,1,1,1,1);
	SendClientMessage(playerid, COLOR_ROSA, "Para mudar de posiÁ„o digite /mudarposicao");
}
public Strip(playerid)
{
	ApplyAnimation(playerid,"STRIP","strip_A",4.1,0,1,1,1,10);
	SetTimerEx("Strip3",2000,0,"d",playerid);
}
public Strip3(playerid)
{
	ApplyAnimation(playerid,"STRIP","STR_A2B",4.1,0,1,1,1,10);
	SetTimerEx("Strip4",2000,0,"d",playerid);
}
public Strip4(playerid)
{
	ApplyAnimation(playerid,"STRIP","STR_Loop_C",4.1,0,1,1,1,10);
	SendClientMessage(playerid, COLOR_ROSA2, "Acabou o strip-tease.");
}
public GetPlayerID(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
			//printf("GetP:testname = %s : string = %s",testname,string);
			if(strcmp(testname, string, true, strlen(string)) == 0)
			{
				//printf("TRUE GetP:testname = %s : string = %s playerid %d",testname,string, i);
				return i;
			}
		}
	}
	return INVALID_PLAYER_ID;
}
public minrand(min, max)
{
	return random(max - min) + min;
}
public Casino()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i)) {
	        for(new j=0; j < MAX_CASINO; j++) {
	            if(isPlayerInArea(i,AreaProibida[j])) {
					AreaCasino[i]++;
					GameTextForPlayer(i,"~r~SAIA DO CASINO~n~ ~g~Caso contròrio ~b~Morra!",10000,5);
					if(AreaCasino[i] > 3) {
						SetPlayerHealth(i,0);
						SendClientMessage(i,COLOR_RED2,"VocÍ foi avisado!");
						ResetPlayerMoney(i);
					}
				}
     		}
       	}
	}
}
public CheckFuel()
{
	new str[32];
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1)
		{
			if(GetPlayerState(i) == 2)
	 		{
				new Vi = GetPlayerVehicleID(i);
				if(GPV[Vi] == -1) return 1;
				if(GPV[Vi] == 0){
				    SendClientMessage(i,COLOR_RED,"VocÍ n„o pode andar sem gasolina!");
				    SendClientMessage(i,COLOR_RED,"Saia do veiculo com a tecla de saÌda (geralmente F ou Enter),");
				    SendClientMessage(i,COLOR_RED,"peÁa para um frentista abastecer seu veÌculo ou ainda tente");
				    SendClientMessage(i,COLOR_RED,"empurrar seu carro ao posto mais prÛximo e abastecer seu carro l·!");
				    TogglePlayerControllable(i,0);
				    return 1;
				}
				GPV[Vi]--;
     			if(mysql == 1){
					new string[255];
					format(string, sizeof(string), "UPDATE cars SET gasolina = %d WHERE id = %d", GPV[Vi], Vi);
					samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string) == 0){
					    printf("Erro na linha 10081");
					}
				}
				format(str,256,"~r~Combust¢vel: ~s~%d~b~l",GPV[Vi]);
				GameTextForPlayer(i,str,500,1);
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


public IsStringAName(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
			//printf("IsS:testname = %s : string = %s",testname,string);
			if(strcmp(testname, string, true, strlen(string)) == 0)
			{
				//printf("TRUE IsS:testname = %s : string = %s",testname,string);
				return 1;
			}
		}
	}
	return 0;
}
public AvancoLigacao(plcaller,plcalled)
{
	CellCredits[plcaller]--;
	if(CellCredits[plcaller] == 0){
	    SendClientMessage(plcaller,COLOR_RED,"VocÍ n„o tem mais crÈditos para continuar nessa chamada!");
		EmLigacao[plcaller]=0;
		EmLigacao[plcalled]=0;
		SetPlayerSpecialAction(plcaller,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetPlayerSpecialAction(plcalled,SPECIAL_ACTION_STOPUSECELLPHONE);
		return 1;
	}
	SendClientMessage(plcaller,COLOR_RED,"Mais um minuto se passou...");
	new msg[256];
	format(msg,256,"Agora seu saldo È: %d crÈditos.",CellCredits[plcaller]);
	SendClientMessage(plcaller,COLOR_AZULPLUS,msg);
	CellTimer[plcaller]=SetTimerEx("AvancoLigacao",60000,false,"dd",plcaller,plcalled);
	return 1;
}

public update_zones() {
 new line1[10];
 new line2[10];

 for(new i=0; i<MAX_PLAYERS_; i++) {
  if(IsPlayerConnected(i) && zoneupdates[i] == 1) {
   if(IsPlayerInZone(i,player_zone[i])) {  }
   else {

    new player_zone_before;
    player_zone_before = player_zone[i];
    player_zone[i] = -1;


    for(new j=0; j<sizeof(zones);j++) {
     if(IsPlayerInZone(i,j) && player_zone[i] == -1) {
/*
      if(player_zone_before == -1) GameTextForPlayer(i,zones[j][zone_name],1500,1);
   	  else  if(strcmp(zones[j][zone_name],zones[player_zone_before][zone_name],true) != 0) GameTextForPlayer(i,zones[j][zone_name],1500,1);
*/
      player_zone[i] = j;
      format(line1,10,"p%dzone",i);
      format(line2,10,"%d",j);


     }
    }



    if(player_zone[i] == -1) player_zone[i] = player_zone_before;
   }
  }
 }
}
IsPlayerInZone(playerid, zoneid) {
 if(zoneid == -1) return 0;
 new Float:x, Float:y, Float:z;
 GetPlayerPos(playerid,x,y,z);
 if(x >= zones[zoneid][zone_minx] && x < zones[zoneid][zone_maxx]
 && y >= zones[zoneid][zone_miny] && y < zones[zoneid][zone_maxy]
 && z >= zones[zoneid][zone_minz] && z < zones[zoneid][zone_maxz]
 && z < 900.0) return 1;
 return 0;
}

public OpenGate(gateid)
{
	if(ContagemPortao[gateid] < 90){
	    ContagemPortao[gateid]++;
		GetObjectRot(Gates[gateid],rx,ry,rz);
		SetObjectRot(Gates[gateid],rx,ry+1.0,rz);
		PortaoTimer[gateid]=SetTimerEx("OpenGate",50, 0, "d", gateid);
	} else {
		ContagemPortao[gateid] = 0;
		KillTimer(PortaoTimer[gateid]);
		PortaoAbrindo[gateid]=0;
		PortaoAberto[gateid]=1;
	}
}

public CloseGate(gateid)
{
	if(ContagemPortao[gateid] < 90){
	    ContagemPortao[gateid]++;
		GetObjectRot(Gates[gateid],rx,ry,rz);
		SetObjectRot(Gates[gateid],rx,ry-1.0,rz);
		PortaoTimer[gateid]=SetTimerEx("CloseGate",50,0,"d",gateid);
	} else {
	    ContagemPortao[gateid] = 0;
	    KillTimer(PortaoTimer[gateid]);
	    PortaoFechando[gateid]=0;
	    PortaoAberto[gateid]=0;
	}
}


public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 180){
	            TempoPreso[i] = 0;
				if(mysql == 1){
					new string2[255];
					format(string2, sizeof(string2), "UPDATE players SET prisao = 0 WHERE nickname = '%s '", PlayerName(i));
					if(samp_mysql_query(string2) == 0){
			 			printf("Erro na linha 11156");
					}
				}
				Presos[i] = 0;
				new skin;
				if(mysql == 1){
   					new resultline[1024];
   					new field[128];
   					new string2[255];
   					format(string2, sizeof(string2),"SELECT skin FROM players WHERE nickname = '%s '", PlayerName(i));
       				samp_mysql_select_db("infernusgroup01");
					if(samp_mysql_query(string2) == 0){
					    printf("Erro na Linha 3853");
					}
					samp_mysql_store_result();
					while(samp_mysql_fetch_row(resultline)==1)
					{
						samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
						skin = strval(field);
					}
				}
				SetSpawnInfo(i,0,skin,-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
	    		SpawnPlayer(i);
	            SendClientMessage(i, COLOR_YELLOW, "VocÍ foi solto, mas se cometer algum crime outra vez, j· sabe...");
			}
			else {
			    TempoPreso[i]++;
			}
		}
	}
}
public VoteKickTimer()
{
	if (gdebug >= 3){printf("DEBUG VoteKickTimer()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
		{
		if(IsPlayerConnected(i) == 1 && VoteKick[i] > 0)
		{
			VoteKick[i]++;
			//printf("VoteKick %d VoteKick[%d] KickVote[%d]",i,VoteKick[i],KickVote[i]);
			if(IsPlayerConnected(i) == 1 && VoteKick[i] == 8)
			{
				if(KickVote[i] >= numplayers/4)
				{
					new string[128];
					new accused[MAX_PLAYER_NAME];
					GetPlayerName(i, accused, sizeof(accused));
					format(string, sizeof(string), "VOTO: %s foi votado para sair do server",accused);
					SendClientMessageToAll(COLOR_RED,string);
					ClearVote(i);
					Kick(i);
				}
				else
				{
					new string[128];
					new accused[MAX_PLAYER_NAME];
					GetPlayerName(i, accused, sizeof(accused));
					format(string, sizeof(string), "VOTO FALHOU: %s nao saira do server",accused);
					SendClientMessageToAll(COLOR_RED,string);
					ClearVote(i);
				}
			}
		}
	}
}

public ClearVote(kickedid)
{
	KickVote[kickedid] = 0;
	VoteKick[kickedid] = 0;
	for(new j = 0; j <= MAX_PLAYERS; j++)
	{
		if(IsPlayerConnected(j) == 1 && LastVote[j] == kickedid)
		{
			LastVote[j] = 255;
		}
	}
}


public Taxi() {
	for(new i=0; i<MAX_PLAYERS; i++){
		if(Taximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 3){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 3;
				format(string, sizeof(string), "O taxÌmetro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COLOR_RED, "VocÍ n„o tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(Taximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				Taximetro[i][1] = 0;
				Taximetro[i][0] = 0;
			}
		}
		if(ATaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 15){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 15;
				format(string, sizeof(string), "O aero-taxÌmetro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 15){
				SendClientMessage(i, COLOR_RED, "VocÍ n„o tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(Taximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				ATaximetro[i][1] = 0;
				ATaximetro[i][0] = 0;
			}
		}
		if(MTaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 5){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 5;
				format(string, sizeof(string), "O moto-taxÌmetro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 5){
				SendClientMessage(i, COLOR_RED, "VocÍ n„o tem mais dinheiro para o taxi, vai ficar aqui.");
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
public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if (gdebug >= 3){printf("DEBUG ProxDetector()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Trigger Radius
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(!BigEar[i])
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
				if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				{
					SendClientMessage(i, col1, string);
				}
				else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				{
					SendClientMessage(i, col2, string);
				}
				else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				{
					SendClientMessage(i, col3, string);
				}
				else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				{
					SendClientMessage(i, col4, string);
				}
				else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendClientMessage(i, col5, string);
				}
			}
			else
			{
				SendClientMessage(i, col1, string);
			}
		}
	}
	return 1;
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
			format(tmpstr,256,"~h~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~w~~h~~w~%d ~b~km/h ~n~ ",floatround(((dis/1000.0)*60.0)*60.0));
            if(IsPlayerInAnyVehicle(i)){
				GameTextForPlayer(i,tmpstr,1000,3);
				Velocidade[i] = floatround(((dis/1000.0)*60.0)*60.0);
			}
            ppos[i][0] = x;
            ppos[i][1] = y;
            ppos[i][2] = z;
		}
	}
}

public GetPlayerDistanceToPoint(playerid,Float:x,Float:y)
{
	new Float:x1,Float:y1,Float:z1;
	new Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2));
	return floatround(tmpdis);
}
public OnPlayerPrivmsg(playerid, recieverid, text[])
{
    SendClientMessage(playerid, COLOR_ASSALTANTE,   "|-------------------------ATEN«√O--------------------------|");
    SendClientMessage(playerid, COLOR_ASSALTANTE,   "|-------------------------ATEN«√O--------------------------|");
	SendClientMessage(playerid, COLOR_SEGURAN«A, 	"O COMANDO /PM FOI DESABILITADO PARA MAIS INFORMA«’ES DIGITE:");
	SendClientMessage(playerid, COLOR_GREEN,		 "/celularinfo");
	return 0;
}


public IsNumeric(const string[]) //By Mike
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
	    if (string[i] > '9' || string[i] < '0') return 0;
	}
	return 1;
}



public PlayerPlaySoundEx(playerid,soundid)
{
	new Float:X,
	    Float:Y,
	    Float:Z;
	GetPlayerPos(playerid,X,Y,Z);
	PlayerPlaySound(playerid,soundid,X,Y,Z);
}

stock Salario()
{
	for(new i; i<MAX_PLAYERS; i++) {
	    if(IsPlayerConnected(i)) {
			SendClientMessage(i, ProfColors[Profissao[i]], StringsSalario[Profissao[i]]);
			if(mysql == 1){
				new resultline[1024];
				new field[128];
    			new string2[255], din;
    			format(string2, sizeof(string2),"SELECT bankmoney FROM players WHERE nickname = '%s '", PlayerName(i));
    			samp_mysql_select_db("infernusgroup01");
				if(samp_mysql_query(string2) == 0){
					printf("Erro na Linha 11419");
				}
				samp_mysql_store_result();
				while(samp_mysql_fetch_row(resultline)==1)
				{
					samp_mysql_strtok(field, "|", resultline); //first call of strtok MUST contain resultline
					din = strval(field);
				}
				new string3[255];
				format(string3, sizeof(string3), "UPDATE players SET bankmoney = %d WHERE nickname = '%s '", din+IntSalario[Profissao[i]], PlayerName(i));
				if(samp_mysql_query(string3) == 0){
		 			printf("Erro na linha 11431");
				}
			}
		}
	}

}

public Tempo()
{
	if(worldMinute > 59){
		worldMinute = 0;
		worldTime++;
		worldTime%=24;
	}
	if(worldMinute < 60){
	    worldMinute++;
	}
	new texto[256];
	SetWorldTime(worldTime);
/*
	format(texto, sizeof(texto), "~w~%d:00~y~hs", worldTime);
	GameTextForAll(texto, 4000, 1);
*/
	if(worldMinute==1){
	    switch(worldTime)
	    {
	        case 21:
	        {
	    		SendClientMessageToAll(COLOR_WHITE,"NotÌcias de San Andreas, previs„o do tempo para amanh„:");
			    Previsao = random(19);
			    format(texto,sizeof(texto),"%s",WeatherName[Previsao]);
			    SendClientMessageToAll(COLOR_GREEN,texto);
			}
			case 15:
			{
				Desmancheveiculo();
		 	}
			case 6:
			{
				    SetWeather(Previsao);
			}
			case 0:
			{
				Salario();
			}
		}
	}
}


