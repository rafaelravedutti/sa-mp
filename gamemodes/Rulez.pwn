/*______________________________________________________________________________
||          ----                                              ----            ||
||         |     VV           VV    GGGGGGGGG      SSSSSSSSS      |           ||
||         |      VV         VV     GG             SS             |           ||
||         |       VV       VV      GG             SS             |           ||
||         |        VV     VV       GG    GGGGG    SSSSSSSSS      |           ||
||         |         VV   VV        GG       GG           SS      |           ||
||         |          VV VV         GG       GG           SS      |           ||
||         |           VVV          GGGGGGGGGGG    SSSSSSSSS      |           ||
||          ----                                              ----            ||
||                                                                            ||
||         CCCCCCCC    CC               CCCCCCCC    CCCCCCC    CC             ||
||		   CC          CC              CC     CC    CC   CC    CC             ||
||		   CC          CC             CCCCCCCCCC    CC   CC    CC             ||
||		   CC          CC            CC       CC    CC   CC    CC             ||
||		   CCCCCCCC    CCCCCCCCC   CC         CC    CC   CCCCCCCC             ||
||____________________________________________________________________________||
*/

//Include
#include <RulezInclude>

//Musicas
#define SOM_MUSICA1 	          1185 //Musica Rock
#define SOM_DESLIGADO             1184 //Musica desligada
#define SOM_MUSICA2               1076 //Musica Minigame
#define SOM_ALARME                1147 //Alarme de carro

//Defines Variados
#define MAX_BANBOTS               38
#define NUMVALUES                 4
#pragma tabsize                   0
#define CifraoPickup              1274

//Defines missões em veículos
#define Maverick                  487
#define Taxi1                     420
#define Cabbie                    438
#define FCR900                    521
#define Roadtrain                 515

//Cores
#define COR_CHAT                  0x20B2AAAA
#define COR_PRETO                 0x000000AA
#define COR_CINZA2 		  	      0xB4B5B7AA
#define COR_VERMELHO2             0xAA3333AA
#define COR_VERDE                 0x006600AA
#define COR_VERDE2                0x33AA33AA
#define COR_VERDE_AQUA            0x20B2AAAA
#define COR_VERMELHO              0xFF0000AA
#define COR_AMARELO               0xFFFF00AA
#define COR_PALHA            	  0xF0E68CAA
#define COR_BRANCO                0xFFFFFFAA
#define COR_CINZA                 0xAFAFAFAA
#define COR_NAO_LOGADO            0xFFFFFFAA
#define COR_PURPURA               0x330066FF
#define COR_ROSA             	  0xFF00FFAA
#define COR_ROSA2                 0xDDA0DDAA
#define COR_DESEMPREGADO          0xB4B5B7AA
#define COR_HOT_DOG               0x808080AA
#define COR_PADRE                 0xFFFFFFAA
#define COR_INSTRUTOR             0xDD0000FF
#define COR_TAXISTA               0xFFFF00AA
#define COR_B.O.P.E               0x00C7FFAA
#define COR_CAÇADOR               0xA0522DAA
#define COR_ASSASSINO             0xAA333300
#define COR_VENDEDOR_VEICULOS     0x009900AA
#define COR_AZUL 				  0x33CCFFAA
#define COR_COP_RODOVIARIO        0x00CED3AA
#define COR_SEGURANÇA             0xADD8E6AA
#define COR_BARMAN                0xF08080AA
#define COR_CORRETOR              0xDEB887AA
#define COR_PESCADOR              0xE9967AAA
#define COR_MOTORISTA             0xFF9900AA
#define COR_MOTORISTA_ONIBUS      0xF5F5DCAA
#define COR_JUIZ                  0x7FFF00AA
#define COR_TRAFICANTE            0xCD853FAA
#define COR_LABNARCOTICOS         0x057ABDAA
#define COR_I.B.A.M.A             0x1A4D23AA
#define COR_CAMINHONEIRO          0xE4E4E4AA
#define COR_ADVOGADO              0x462A4BAA
#define COR_VENDEDOR_DE_ARMAS     0x10F441AA
#define COR_MOTOBOY               0xFFC000AA
#define COR_AZULPLUS              0x4169FFAA
#define COR_LIMAO                 0xDDDD2357
#define COR_AGRICULTOR            0x99D188AA
#define COR_PRESIDENTE            0x69555AAA
#define COR_PREFEITO              0xF0E68CAA
#define COR_JORNALISTA            0x800080AA
#define COR_TAXI_AEREO            0xFFA500AA
#define COR_EXERCITO              0x575F04AA
#define COR_ENTREGADOR_PIZZA      0x99D188AA
#define COR_MEDICO                0xD9E3E6AA
#define COR_TUNADOR               0x780C54AA
#define COR_DEPUTADO              0x4169FFAA
#define COR_FRENTISTA             0xCD853FAA
#define COR_GM                    0x330066AA
#define COR_DELEGADO              0xAA3333AA
#define COR_MATADOR_DE_ALUGUEL    0x1F4B2B00
#define COR_REI_DO_CRIME          0x69555A00
#define COR_HOMEM_BOMBA           0x20B2AA00
#define COR_ASSALTANTE            0xB7034700
#define COR_S.W.A.T               0x00C7FFAA
#define COR_COP_MILITAR           0xFFA500AA


//Profissões
#define DESEMPREGADO              1  //Completa
#define TAXISTA                   2  //Completa
#define VENDEDOR_VEICULOS         3  //Completa
#define CORRETOR                  4  //Completa
#define ASSASSINO                 5  //Completa
#define BARMAN                    6  //Completa
#define JUIZ                      7  //Completa
#define SEGURANÇA                 8  //Completa
#define MOTORISTA_PARTICULAR      9  //Completa
#define COP_MILITAR               10 //Completa
#define COP_RODOVIARIO            11 //Completa
#define B.O.P.E                   12 //Completa
#define CAÇADOR                   13 //Completa
#define PESCADOR                  14 //Completa
#define INSTRUTOR_DE_DIRECAO      15 //Completa
#define TRAFICANTE                16 //Completa
#define MOTORISTA_DE_ONIBUS       17 //Completa
#define JORNALISTA                18 //Completa
#define CAMINHONEIRO              19 //Completa
#define LABNARCOTICOS             20 //Completa
#define I.B.A.M.A                 21 //Completa
#define ADVOGADO                  22 //Completa
#define PARAMEDICO                23 //Completa
#define HOT_DOG                   24 //Completa
#define MOTOBOY                   25 //Completa
#define TAXISTA_AEREO             26 //Completa
#define ENTREGADOR_PIZZA          27 //Completa
#define PRESIDENTE                28 //Completa
#define PREFEITO                  29 //Completa
#define AGRICULTOR                30 //Completa
#define GOVERNADOR                31 //Completa
#define DEPUTADO                  32 //Completa
#define TUNADOR                   33 //Completa
#define GM                        34 //Completa
#define EXERCITO                  35 //Completa
#define DELEGADO                  36 //Completa
#define MATADOR_DE_ALUGUEL         37 //Completa
#define REI_DO_CRIME              38 //Completa
#define FRENTISTA                 39 //Completa
#define PADRE                     40 //Completa
#define HOMEM_BOMBA               41 //Completa
#define ASSALTANTE                42 //Completa
#define S.W.A.T                   43 //Completa
#define VENDEDOR_DE_ARMAS         44 //Completa

//Velocímetro
enum SalvarPosJogadorEnum {Float:LastX,Float:LastY,Float:LastZ}

//News diversos
new Nome[24], playerip[20];
new LogadoComRcon[MAX_PLAYERS];
new CLPT[MAX_PLAYERS];
new Escuta[MAX_PLAYERS];
new TempoAssalto[MAX_PLAYERS] = 0;
new Combustivel[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][4];
new ATaximetro[MAX_PLAYERS][4];
new MTaximetro[MAX_PLAYERS][4];
new PrecoCorrida[MAX_PLAYERS];
new Silenciado[MAX_PLAYERS];
new worldTime;
new VeloMulta = 0;
new Bebida[MAX_PLAYERS] = 0;
new Maconha[MAX_PLAYERS] = 0;
new Heroina[MAX_PLAYERS] = 0;
new Cocaina[MAX_PLAYERS] = 0;
new Crack[MAX_PLAYERS] = 0;
new TempoProf[MAX_PLAYERS] = 0;
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new Piracema = 0;
new AreaCoopPesca[MAX_PLAYERS] = 0;
new PescaInProgress[MAX_PLAYERS] = 0;
new QtPescas[MAX_PLAYERS] = 0;
new AreaFazenda[MAX_PLAYERS] = 0;
new AreaCoopFazenda[MAX_PLAYERS] = 0;
new FazendaInProgress[MAX_PLAYERS] = 0;
new Float:TelePos[MAX_PLAYERS][6];
new Float:TeleportDest[MAX_PLAYERS][3];
new QtSoja[MAX_PLAYERS] = 0;
new TemporadaCaca = 1;
new AreaCaca[MAX_PLAYERS] = 0;
new AreaCoopCaca[MAX_PLAYERS] = 0;
new CacaInProgress[MAX_PLAYERS] = 0;
new QtCacas[MAX_PLAYERS] = 0;
new AreaCarga[MAX_PLAYERS] = 0;
new AreaDescarga[MAX_PLAYERS] = 0;
new Carregamento[MAX_PLAYERS] = 0;
new PickupBancoE;
new PickupBancoS;
new SalvarPosJogador[MAX_PLAYERS][SalvarPosJogadorEnum];
new VeloSeg;
new AprendendoDirigir[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new Armas[MAX_PLAYERS];
new ServidorTrancado;

//Portões
new Delegacia;

//Forwards
forward VerificadorRcon();
forward Contar(playerid);
forward ChatGlobal(color,const string[]);
forward TecladoNumerico(const string[]);
forward Distancia(Float:radi,playerid,string[],Cor);
forward Fazenda();
forward Bancos(playerid);
forward Pesca();
forward Caca();
forward ChecarCombustivel();
forward LogarJogador(playerid);
forward TempoNaCadeia();
forward Taxi();
forward ATaxi();
forward MTaxi();
forward Velocimetro(playerid);
forward Hospitais(playerid);
forward Horario(playerid);
forward DestruirObjeto(objetoid);
forward CriarExplosao(Float:X,Float:Y,Float:Z,tipo,Float:diam);
forward MensagensRandom();
forward AtualizarZonas();
forward CriarVeiculo(m,Float:x,Float:y,Float:z,Float:r,c,d,e);
forward AcaoEspecial(playerid,actionid);
forward SetarPosicaoDoJogadorComOjbetos(playerid,Float:x,Float:y,Float:z);
forward TempoObjetos();
forward TunarVeiculo(playerid);
forward HorarioTextDraw();
forward CarregarJogador(playerid);
forward AtualizarDinheiro();
forward Clima();
forward VeiculoPolicial(carid);
forward Ambulancia(carid);
forward VerificarProfissao(playerid);
//seta 1318

//Nome dos peixes
new NomePeixes[][] = {
{"Albacora"},
{"Anequim"},
{"Atum"},
{"Bagre"},
{"Baiacú"},
{"Olho-de-boi"},
{"Linguado"},
{"Espadarte"},
{"Papa-Terra"},
{"Tubarão"},
{"Peixe-Espada"},
{"Camarão"}
};

//Munição das armas
new MunicaoArmas[] = {
0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,
4,0,0,0,0,100,100,100,46,80,80,300,
300,150,150,300,80,0
};

//Nome das armas
new ArmasNomes[][] = {
"Mão livre","Soco Inglês","Taco de Golf","Cacetete",
"Faca","Taco de Baseball","Shovel","Taco de Sinuca",
"Katana","Serra Elétrica","Vibrador 2 Pontas Roxão",
"Vibrador branco grande","Vibrador branco médio",
"Vibrador prata pequeno","Flores","Bengala","Granada",
"Granada de Fumaça","Molotov","Bazuca",
"Lança-Mísseis guiado a calor","Hydra Rocket","Pistola",
"Pistola com silenciador","Desert Eagle (Colt 45)","Spaz (12)",
"Escopeta de Cano Serrado","Escopeta de Combate","Uzi",
"MP5","AK-47","M4","Tec 9","Rifle"
};

new SkinProfissao[] = {
0, //Não Logado
0, //Desempregado
142, //Taxista
187, //Vendedor de veículos
153, //Corretor de imóveis
29, //Assassino
171, //Barman
57, //Juiz
164, //Segurança
255, //Motorista Particular
280, //Policial Militar
71, //Policial Rodoviário
166, //Soldado do B.O.P.E
127, //Caçador
35, //Pescador
189, //Instrutor de direção
28, //Traficante
44, //Motorista de Ônibus
125, //Jornalista
40, //Caminhoneiro
70, //Laboratorista de narcóticos
228, //Agente do I.B.A.M.A
186, //Advogado
276, //Paramédico
168, //Vendedor de Hot Dog
100, //Motoboy
61, //Taxista aéreo
155, //Entregador de Pizza
147, //Presidente
98, //Prefeito
161, //Agricultor
240, //Governador
59, //Deputado
50, //Mecânico
293, //Game Master
286, //Soldado do exército
283, //Delegado
73, //Matador de Aluguel
269, //Rei do Crime
32, //Frentista
68, //Padre
112, //Homem-Bomba
186, //Assaltante
285, //Soldado da S.W.A.T
179 //Vendedor de Armas
};

new NomeProfs[] = {
"Nenhuma",
"Desempregado",
"Taxista",
"Vendedor de veículos",
"Corretor de imóveis",
"Assassino",
"Barman",
"Juiz",
"Segunrança",
"Motorista Particular",
"Policial Militar",
"Policial Rodoviário",
"Soldado do B.O.P.E",
"Caçador",
"Pescador",
"Instrutor de direção",
"Traficante",
"Motorista de ônibus",
"Jornalista",
"Caminhoneiro",
"Laboratorista de narcóticos",
"Agente do I.B.A.M.A",
"Advogado",
"Paramédico",
"Vendedor de Hot Dog",
"Motoboy",
"Taxista Aéreo",
"Entregador de pizza",
"Presidente",
"Prefeito",
"Agricultor",
"Governador",
"Deputado",
"Mecânico",
"Game Master",
"Soldado do exército",
"Delegado",
"Matador de Aluguel",
"Rei do Crime",
"Frentista",
"Padre",
"Homem-Bomba",
"Assaltante",
"Soldado da S.W.A.T",
"Vendedor de Armas"
};

//Meses
new Meses[][] = {
"0",
"Janeiro",
"Fevereiro",
"Marco",
"Abril",
"Maio",
"Junho",
"Julho",
"Agosto",
"Setembro",
"Outubro",
"Novembro",
"Dezembro"
};

new SkinsJogador[] = {
1,29,72,250,241,236,233,93,226,223,221,219,
217,206,186,185,181,170,147,143,124,120,101,
56,60,46,23
};


//Banir Bots
new BotBan[MAX_BANBOTS][] = {
"Rocky","Pepe","Arnoldo","SgtPepper","Pepsi","Pepno",
"Azucar","Vino_Toro","Zoquete","Pacman","Batman","AquilesBrinco",
"Manfrey","Sopapeala","Papirola","com1","com2","com3","com4","com5",
"com6","com7","com8","com9","lpt1","lpt2","lpt3","lpt4","lpt5","lpt6",
"lpt7","lpt8","lpt9","nul","clock$","aux","prn","con"
};

//Nome dos carros
new NomeCarros[][] = {
"Landstalker","Bravura","Buffalo","Linerunner","Perenial","Sentinel","Dumper","Caminhao dos Bombeiros","Caminhao de Lixo",
"Limosine","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulancia","Leviathan","Moonbeam","Esperanto",
"Taxi","Washington","Bobcat","Mr Whoopee","BF-Injection","Hunter","Premier","Enforcer","Securicar","Banshee",
"Predator","Onibus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo",
"RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Bonde","Trailer",
"Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer",
"PCJ-600","Faggio","Freeway","RC Baron","RC Raider","Glendale","Oceanic","Sanchez","Sparrow","Patriot",
"Quadriciclo","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX",
"Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","F.B.I Rancher","Virgo",
"Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Maverick da Policia","Boxville","Benson","Mesa",
"RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT","Elegant",
"Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain","Nebula","Majestic",
"Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona",
"F.B.I Truck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight",
"Streak","Vortex","Vincent","Bullet","Clover","Sadler","Caminhao dos Bombeiros","Hustler","Intruder","Primo","Cargobob",
"Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A","Monster B","Uranus",
"Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight",
"Trailer","Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford",
"BF-400","Newsvan","Tug","Trailer A","Emperor","Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C",
"Andromada","Dodo","RC Cam","Launch","Viatura Policial (LSPD)","Viatura Policial (SFPD)","Viatura Policial (LVPD)",
"Ranger da Policia","Picador","S.W.A.T","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B",
"Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};

//Nomes das zonas
new AtualizacoesDeZonas[MAX_PLAYERS];
new ZonaJogador[MAX_PLAYERS];
new AtualizacaoZona;

enum zoneinfo {zone_name[270],Float:zone_minx,Float:zone_miny,
Float:zone_minz,Float:zone_maxx,Float:zone_maxy,Float:zone_maxz}

new Float:zones[][zoneinfo] = {
{"~r~|~w~The Big Ear",-410.00,1403.30,-3.00,-137.90,1681.20, 200.00},
{"~r~|~w~Aldeia Malvada", -1372.10,2498.50, 0.00, -1277.50,2615.30, 200.00},
{"~r~|~w~Angel Pine",-2324.90, -2584.20,-6.10, -1964.20, -2212.10, 200.00},
{"~r~|~w~Arco del Oeste", -901.10,2221.80, 0.00,-592.00,2571.90, 200.00},
{"~r~|~w~Avispa Country Club", -2646.40,-355.40, 0.00, -2270.00,-222.50, 200.00},
{"~r~|~w~Avispa Country Club", -2831.80,-430.20,-6.10, -2646.40,-222.50, 200.00},
{"~r~|~w~Avispa Country Club", -2361.50,-417.10, 0.00, -2270.00,-355.40, 200.00},
{"~r~|~w~Avispa Country Club", -2667.80,-302.10, -28.80, -2646.40,-262.30,71.10},
{"~r~|~w~Avispa Country Club", -2470.00,-355.40, 0.00, -2270.00,-318.40,46.10},
{"~r~|~w~Avispa Country Club", -2550.00,-355.40, 0.00, -2470.00,-318.40,39.70},
{"~r~|~w~Back o Beyond", -1166.90, -2641.10, 0.00,-321.70, -1856.00, 200.00},
{"~r~|~w~Battery Point", -2741.00,1268.40,-4.50, -2533.00,1490.40, 200.00},
{"~r~|~w~Bayside", -2741.00,2175.10, 0.00, -2353.10,2722.70, 200.00},
{"~r~|~w~Bayside Marina",-2353.10,2275.70, 0.00, -2153.10,2475.70, 200.00},
{"~r~|~w~Beacon Hill",-399.60, -1075.50,-1.40,-319.00,-977.50, 198.50},
{"~r~|~w~Blackfield",964.30,1203.20, -89.00,1197.30,1403.20, 110.90},
{"~r~|~w~Blackfield",964.30,1403.20, -89.00,1197.30,1726.20, 110.90},
{"~r~|~w~Blackfield Chapel",1375.60, 596.30, -89.00,1558.00, 823.20, 110.90},
{"~r~|~w~Blackfield Chapel",1325.60, 596.30, -89.00,1375.60, 795.00, 110.90},
{"~r~|~w~Blackfield Intersection",1197.30,1044.60, -89.00,1277.00,1163.30, 110.90},
{"~r~|~w~Blackfield Intersection",1166.50, 795.00, -89.00,1375.60,1044.60, 110.90},
{"~r~|~w~Blackfield Intersection",1277.00,1044.60, -89.00,1315.30,1087.60, 110.90},
{"~r~|~w~Blackfield Intersection",1375.60, 823.20, -89.00,1457.30, 919.40, 110.90},
{"~r~|~w~Blueberry", 104.50,-220.10, 2.30, 349.60, 152.20, 200.00},
{"~r~|~w~Blueberry",19.60,-404.10, 3.80, 349.60,-220.10, 200.00},
{"~r~|~w~Blueberry Acres",-319.60,-220.10, 0.00, 104.50, 293.30, 200.00},
{"~r~|~w~Palacio Caligula's",2087.30,1543.20, -89.00,2437.30,1703.20, 110.90},
{"~r~|~w~Palacio Caligula's",2137.40,1703.20, -89.00,2437.30,1783.20, 110.90},
{"~r~|~w~Calton Heights",-2274.10, 744.10,-6.10, -1982.30,1358.90, 200.00},
{"~r~|~w~ChinaTown", -2274.10, 578.30,-7.60, -2078.60, 744.10, 200.00},
{"~r~|~w~Prefeitura", -2867.80, 277.40,-9.10, -2593.40, 458.40, 200.00},
{"~r~|~w~Come-A-Lot", 2087.30, 943.20, -89.00,2623.10,1203.20, 110.90},
{"~r~|~w~Commerce", 1323.90, -1842.20, -89.00,1701.90, -1722.20, 110.90},
{"~r~|~w~Commerce", 1323.90, -1722.20, -89.00,1440.90, -1577.50, 110.90},
{"~r~|~w~Commerce", 1370.80, -1577.50, -89.00,1463.90, -1384.90, 110.90},
{"~r~|~w~Commerce", 1463.90, -1577.50, -89.00,1667.90, -1430.80, 110.90},
{"~r~|~w~Commerce", 1583.50, -1722.20, -89.00,1758.90, -1577.50, 110.90},
{"~r~|~w~Commerce", 1667.90, -1577.50, -89.00,1812.60, -1430.80, 110.90},
{"~r~|~w~Centro de Conferencias",1046.10, -1804.20, -89.00,1323.90, -1722.20, 110.90},
{"~r~|~w~Centro de Conferencias",1073.20, -1842.20, -89.00,1323.90, -1804.20, 110.90},
{"~r~|~w~Cranberry Station", -2007.80,56.30, 0.00, -1922.00, 224.70, 100.00},
{"~r~|~w~Creek",2749.90,1937.20, -89.00,2921.60,2669.70, 110.90},
{"~r~|~w~Dillimore", 580.70,-674.80,-9.50, 861.00,-404.70, 200.00},
{"~r~|~w~Doherty", -2270.00,-324.10,-0.00, -1794.90,-222.50, 200.00},
{"~r~|~w~Doherty", -2173.00,-222.50,-0.00, -1794.90, 265.20, 200.00},
{"~r~|~w~Centro",-1982.30, 744.10,-6.10, -1871.70,1274.20, 200.00},
{"~r~|~w~Centro",-1871.70,1176.40,-4.50, -1620.30,1274.20, 200.00},
{"~r~|~w~Centro",-1700.00, 744.20,-6.10, -1580.00,1176.50, 200.00},
{"~r~|~w~Centro",-1580.00, 744.20,-6.10, -1499.80,1025.90, 200.00},
{"~r~|~w~Centro",-2078.60, 578.30,-7.60, -1499.80, 744.20, 200.00},
{"~r~|~w~Centro",-1993.20, 265.20,-9.10, -1794.90, 578.30, 200.00},
{"~r~|~w~Centro de Los Angeles",1463.90, -1430.80, -89.00,1724.70, -1290.80, 110.90},
{"~r~|~w~Centro de Los Angeles",1724.70, -1430.80, -89.00,1812.60, -1250.90, 110.90},
{"~r~|~w~Centro de Los Angeles",1463.90, -1290.80, -89.00,1724.70, -1150.80, 110.90},
{"~r~|~w~Centro de Los Angeles",1370.80, -1384.90, -89.00,1463.90, -1170.80, 110.90},
{"~r~|~w~Centro de Los Angeles",1724.70, -1250.90, -89.00,1812.60, -1150.80, 110.90},
{"~r~|~w~Centro de Los Angeles",1370.80, -1170.80, -89.00,1463.90, -1130.80, 110.90},
{"~r~|~w~Centro de Los Angeles",1378.30, -1130.80, -89.00,1463.90, -1026.30, 110.90},
{"~r~|~w~Centro de Los Angeles",1391.00, -1026.30, -89.00,1463.90,-926.90, 110.90},
{"~r~|~w~Centro de Los Angeles",1507.50, -1385.20, 110.90,1582.50, -1325.30, 335.90},
{"~r~|~w~East Beach", 2632.80, -1852.80, -89.00,2959.30, -1668.10, 110.90},
{"~r~|~w~East Beach", 2632.80, -1668.10, -89.00,2747.70, -1393.40, 110.90},
{"~r~|~w~East Beach", 2747.70, -1668.10, -89.00,2959.30, -1498.60, 110.90},
{"~r~|~w~East Beach", 2747.70, -1498.60, -89.00,2959.30, -1120.00, 110.90},
{"~r~|~w~East Los Angeles",2421.00, -1628.50, -89.00,2632.80, -1454.30, 110.90},
{"~r~|~w~East Los Angeles",2222.50, -1628.50, -89.00,2421.00, -1494.00, 110.90},
{"~r~|~w~East Los Angeles",2266.20, -1494.00, -89.00,2381.60, -1372.00, 110.90},
{"~r~|~w~East Los Angeles",2381.60, -1494.00, -89.00,2421.00, -1454.30, 110.90},
{"~r~|~w~East Los Angeles",2281.40, -1372.00, -89.00,2381.60, -1135.00, 110.90},
{"~r~|~w~East Los Angeles",2381.60, -1454.30, -89.00,2462.10, -1135.00, 110.90},
{"~r~|~w~East Los Angeles",2462.10, -1454.30, -89.00,2581.70, -1135.00, 110.90},
{"~r~|~w~Easter Basin",-1794.90, 249.90,-9.10, -1242.90, 578.30, 200.00},
{"~r~|~w~Easter Basin",-1794.90, -50.00,-0.00, -1499.80, 249.90, 200.00},
{"~r~|~w~Aeroporto Easter Bay",-1499.80, -50.00,-0.00, -1242.90, 249.90, 200.00},
{"~r~|~w~Aeroporto Easter Bay",-1794.90,-730.10,-3.00, -1213.90, -50.00, 200.00},
{"~r~|~w~Aeroporto Easter Bay",-1213.90,-730.10, 0.00, -1132.80, -50.00, 200.00},
{"~r~|~w~Aeroporto Easter Bay",-1242.90, -50.00, 0.00, -1213.90, 578.30, 200.00},
{"~r~|~w~Aeroporto Easter Bay",-1213.90, -50.00,-4.50,-947.90, 578.30, 200.00},
{"~r~|~w~Aeroporto Easter Bay",-1315.40,-405.30,15.40, -1264.40,-209.50,25.40},
{"~r~|~w~Aeroporto Easter Bay",-1354.30,-287.30,15.40, -1315.40,-209.50,25.40},
{"~r~|~w~Aeroporto Easter Bay",-1490.30,-209.50,15.40, -1264.40,-148.30,25.40},
{"~r~|~w~Easter Bay Quimicos",-1132.80,-768.00, 0.00,-956.40,-578.10, 200.00},
{"~r~|~w~Easter Bay Quimicos",-1132.80,-787.30, 0.00,-956.40,-768.00, 200.00},
{"~r~|~w~Garganta do Diabo", -464.50,2217.60, 0.00,-208.50,2580.30, 200.00},
{"~r~|~w~Garganta do Diabo", -208.50,2123.00,-7.60, 114.00,2337.10, 200.00},
{"~r~|~w~Garganta do Diabo", -208.50,2337.10, 0.00, 8.40,2487.10, 200.00},
{"~r~|~w~El Corona",1812.60, -2179.20, -89.00,1970.60, -1852.80, 110.90},
{"~r~|~w~El Corona",1692.60, -2179.20, -89.00,1812.60, -1842.20, 110.90},
{"~r~|~w~El Quebrados",-1645.20,2498.50, 0.00, -1372.10,2777.80, 200.00},
{"~r~|~w~Esplanade East",-1620.30,1176.50,-4.50, -1580.00,1274.20, 200.00},
{"~r~|~w~Esplanade East",-1580.00,1025.90,-6.10, -1499.80,1274.20, 200.00},
{"~r~|~w~Esplanade East",-1499.80, 578.30, -79.60, -1339.80,1274.20,20.30},
{"~r~|~w~Esplanade North", -2533.00,1358.90,-4.50, -1996.60,1501.20, 200.00},
{"~r~|~w~Esplanade North", -1996.60,1358.90,-4.50, -1524.20,1592.50, 200.00},
{"~r~|~w~Esplanade North", -1982.30,1274.20,-4.50, -1524.20,1358.90, 200.00},
{"~r~|~w~Fallen Tree",-792.20,-698.50,-5.30,-452.40,-380.00, 200.00},
{"~r~|~w~Fallow Bridge", 434.30, 366.50, 0.00, 603.00, 555.60, 200.00},
{"~r~|~w~Fern Ridge",508.10,-139.20, 0.00,1306.60, 119.50, 200.00},
{"~r~|~w~Financial", -1871.70, 744.10,-6.10, -1701.30,1176.40, 300.00},
{"~r~|~w~Fisher's Lagoon",1916.90,-233.30,-100.00,2131.70,13.80, 200.00},
{"~r~|~w~Flint Intersection", -187.70, -1596.70, -89.00,17.00, -1276.60, 110.90},
{"~r~|~w~Flint Range",-594.10, -1648.50, 0.00,-187.70, -1276.60, 200.00},
{"~r~|~w~Fort Carson",-376.20, 826.30,-3.00, 123.70,1220.40, 200.00},
{"~r~|~w~Foster Valley", -2270.00,-430.20,-0.00, -2178.60,-324.10, 200.00},
{"~r~|~w~Foster Valley", -2178.60,-599.80,-0.00, -1794.90,-324.10, 200.00},
{"~r~|~w~Foster Valley", -2178.60, -1115.50, 0.00, -1794.90,-599.80, 200.00},
{"~r~|~w~Foster Valley", -2178.60, -1250.90, 0.00, -1794.90, -1115.50, 200.00},
{"~r~|~w~Frederick Bridge", 2759.20, 296.50, 0.00,2774.20, 594.70, 200.00},
{"~r~|~w~Golden Gate", -2741.40,1659.60,-6.10, -2616.40,2175.10, 200.00},
{"~r~|~w~Golden Gate", -2741.00,1490.40,-6.10, -2616.40,1659.60, 200.00},
{"~r~|~w~Ganton", 2222.50, -1852.80, -89.00,2632.80, -1722.30, 110.90},
{"~r~|~w~Ganton", 2222.50, -1722.30, -89.00,2632.80, -1628.50, 110.90},
{"~r~|~w~Garcia",-2411.20,-222.50,-0.00, -2173.00, 265.20, 200.00},
{"~r~|~w~Garcia",-2395.10,-222.50,-5.30, -2354.00,-204.70, 200.00},
{"~r~|~w~Ponte Garver", -1339.80, 828.10, -89.00, -1213.90,1057.00, 110.90},
{"~r~|~w~Ponte Garver", -1213.90, 950.00, -89.00, -1087.90,1178.90, 110.90},
{"~r~|~w~Ponte Garver", -1499.80, 696.40,-179.60, -1339.80, 925.30,20.30},
{"~r~|~w~Glen Park",1812.60, -1449.60, -89.00,1996.90, -1350.70, 110.90},
{"~r~|~w~Glen Park",1812.60, -1100.80, -89.00,1994.30,-973.30, 110.90},
{"~r~|~w~Glen Park",1812.60, -1350.70, -89.00,2056.80, -1100.80, 110.90},
{"~r~|~w~Green Palms", 176.50,1305.40,-3.00, 338.60,1520.70, 200.00},
{"~r~|~w~Greenglass College",964.30,1044.60, -89.00,1197.30,1203.20, 110.90},
{"~r~|~w~Greenglass College",964.30, 930.80, -89.00,1166.50,1044.60, 110.90},
{"~r~|~w~Hampton Barns", 603.00, 264.30, 0.00, 761.90, 366.50, 200.00},
{"~r~|~w~Hankypanky Point", 2576.90,62.10, 0.00,2759.20, 385.50, 200.00},
{"~r~|~w~Harry Gold Parkway", 1777.30, 863.20, -89.00,1817.30,2342.80, 110.90},
{"~r~|~w~Hashbury",-2593.40,-222.50,-0.00, -2411.20,54.70, 200.00},
{"~r~|~w~Hilltop Farm",967.30,-450.30,-3.00,1176.70,-217.90, 200.00},
{"~r~|~w~Hunter Quarry", 337.20, 710.80,-115.20, 860.50,1031.70, 203.70},
{"~r~|~w~Idlewood", 1812.60, -1852.80, -89.00,1971.60, -1742.30, 110.90},
{"~r~|~w~Idlewood", 1812.60, -1742.30, -89.00,1951.60, -1602.30, 110.90},
{"~r~|~w~Idlewood", 1951.60, -1742.30, -89.00,2124.60, -1602.30, 110.90},
{"~r~|~w~Idlewood", 1812.60, -1602.30, -89.00,2124.60, -1449.60, 110.90},
{"~r~|~w~Idlewood", 2124.60, -1742.30, -89.00,2222.50, -1494.00, 110.90},
{"~r~|~w~Idlewood", 1971.60, -1852.80, -89.00,2222.50, -1742.30, 110.90},
{"~r~|~w~Jeferson",1996.90, -1449.60, -89.00,2056.80, -1350.70, 110.90},
{"~r~|~w~Jeferson",2124.60, -1494.00, -89.00,2266.20, -1449.60, 110.90},
{"~r~|~w~Jeferson",2056.80, -1372.00, -89.00,2281.40, -1210.70, 110.90},
{"~r~|~w~Jeferson",2056.80, -1210.70, -89.00,2185.30, -1126.30, 110.90},
{"~r~|~w~Jeferson",2185.30, -1210.70, -89.00,2281.40, -1154.50, 110.90},
{"~r~|~w~Jeferson",2056.80, -1449.60, -89.00,2266.20, -1372.00, 110.90},
{"~r~|~w~Julius Thruway East",2623.10, 943.20, -89.00,2749.90,1055.90, 110.90},
{"~r~|~w~Julius Thruway East",2685.10,1055.90, -89.00,2749.90,2626.50, 110.90},
{"~r~|~w~Julius Thruway East",2536.40,2442.50, -89.00,2685.10,2542.50, 110.90},
{"~r~|~w~Julius Thruway East",2625.10,2202.70, -89.00,2685.10,2442.50, 110.90},
{"~r~|~w~Julius Thruway North", 2498.20,2542.50, -89.00,2685.10,2626.50, 110.90},
{"~r~|~w~Julius Thruway North", 2237.40,2542.50, -89.00,2498.20,2663.10, 110.90},
{"~r~|~w~Julius Thruway North", 2121.40,2508.20, -89.00,2237.40,2663.10, 110.90},
{"~r~|~w~Julius Thruway North", 1938.80,2508.20, -89.00,2121.40,2624.20, 110.90},
{"~r~|~w~Julius Thruway North", 1534.50,2433.20, -89.00,1848.40,2583.20, 110.90},
{"~r~|~w~Julius Thruway North", 1848.40,2478.40, -89.00,1938.80,2553.40, 110.90},
{"~r~|~w~Julius Thruway North", 1704.50,2342.80, -89.00,1848.40,2433.20, 110.90},
{"~r~|~w~Julius Thruway North", 1377.30,2433.20, -89.00,1534.50,2507.20, 110.90},
{"~r~|~w~Julius Thruway South", 1457.30, 823.20, -89.00,2377.30, 863.20, 110.90},
{"~r~|~w~Julius Thruway South", 2377.30, 788.80, -89.00,2537.30, 897.90, 110.90},
{"~r~|~w~Julius Thruway West",1197.30,1163.30, -89.00,1236.60,2243.20, 110.90},
{"~r~|~w~Julius Thruway West",1236.60,2142.80, -89.00,1297.40,2243.20, 110.90},
{"~r~|~w~Juniper Hill",-2533.00, 578.30,-7.60, -2274.10, 968.30, 200.00},
{"~r~|~w~Juniper Hollow",-2533.00, 968.30,-6.10, -2274.10,1358.90, 200.00},
{"~r~|~w~K.A.C.C. Military Fuels",2498.20,2626.50, -89.00,2749.90,2861.50, 110.90},
{"~r~|~w~Kincaid Bridge",-1339.80, 599.20, -89.00, -1213.90, 828.10, 110.90},
{"~r~|~w~Kincaid Bridge",-1213.90, 721.10, -89.00, -1087.90, 950.00, 110.90},
{"~r~|~w~Kincaid Bridge",-1087.90, 855.30, -89.00,-961.90, 986.20, 110.90},
{"~r~|~w~King's",-2329.30, 458.40,-7.60, -1993.20, 578.30, 200.00},
{"~r~|~w~King's",-2411.20, 265.20,-9.10, -1993.20, 373.50, 200.00},
{"~r~|~w~King's",-2253.50, 373.50,-9.10, -1993.20, 458.40, 200.00},
{"~r~|~w~LVA Freight Depot",1457.30, 863.20, -89.00,1777.40,1143.20, 110.90},
{"~r~|~w~LVA Freight Depot",1375.60, 919.40, -89.00,1457.30,1203.20, 110.90},
{"~r~|~w~LVA Freight Depot",1277.00,1087.60, -89.00,1375.60,1203.20, 110.90},
{"~r~|~w~LVA Freight Depot",1315.30,1044.60, -89.00,1375.60,1087.60, 110.90},
{"~r~|~w~LVA Freight Depot",1236.60,1163.40, -89.00,1277.00,1203.20, 110.90},
{"~r~|~w~Las Barrancas",-926.10,1398.70,-3.00,-719.20,1634.60, 200.00},
{"~r~|~w~Las Brujas", -365.10,2123.00,-3.00,-208.50,2217.60, 200.00},
{"~r~|~w~Las Colinas",1994.30, -1100.80, -89.00,2056.80,-920.80, 110.90},
{"~r~|~w~Las Colinas",2056.80, -1126.30, -89.00,2126.80,-920.80, 110.90},
{"~r~|~w~Las Colinas",2185.30, -1154.50, -89.00,2281.40,-934.40, 110.90},
{"~r~|~w~Las Colinas",2126.80, -1126.30, -89.00,2185.30,-934.40, 110.90},
{"~r~|~w~Las Colinas",2747.70, -1120.00, -89.00,2959.30,-945.00, 110.90},
{"~r~|~w~Las Colinas",2632.70, -1135.00, -89.00,2747.70,-945.00, 110.90},
{"~r~|~w~Las Colinas",2281.40, -1135.00, -89.00,2632.70,-945.00, 110.90},
{"~r~|~w~Las Payasadas",-354.30,2580.30, 2.00,-133.60,2816.80, 200.00},
{"~r~|~w~Aeroporto de Las Vegas", 1236.60,1203.20, -89.00,1457.30,1883.10, 110.90},
{"~r~|~w~Aeroporto de Las Vegas", 1457.30,1203.20, -89.00,1777.30,1883.10, 110.90},
{"~r~|~w~Aeroporto de Las Vegas", 1457.30,1143.20, -89.00,1777.40,1203.20, 110.90},
{"~r~|~w~Aeroporto de Las Vegas", 1515.80,1586.40, -12.50,1729.90,1714.50,87.50},
{"~r~|~w~Last Dime Motel",1823.00, 596.30, -89.00,1997.20, 823.20, 110.90},
{"~r~|~w~Leafy Hollow",-1166.90, -1856.00, 0.00,-815.60, -1602.00, 200.00},
{"~r~|~w~LIL' PROBE INN",-90.20,1286.80,-3.00, 153.80,1554.10, 200.00},
{"~r~|~w~Linden Side",2749.90, 943.20, -89.00,2923.30,1198.90, 110.90},
{"~r~|~w~Linden Station", 2749.90,1198.90, -89.00,2923.30,1548.90, 110.90},
{"~r~|~w~Linden Station", 2811.20,1229.50, -39.50,2861.20,1407.50,60.40},
{"~r~|~w~Pequeno Mexico",1701.90, -1842.20, -89.00,1812.60, -1722.20, 110.90},
{"~r~|~w~Pequeno Mexico",1758.90, -1722.20, -89.00,1812.60, -1577.50, 110.90},
{"~r~|~w~Los Flores", 2581.70, -1454.30, -89.00,2632.80, -1393.40, 110.90},
{"~r~|~w~Los Flores", 2581.70, -1393.40, -89.00,2747.70, -1135.00, 110.90},
{"~r~|~w~Los Angeles International", 1249.60, -2394.30, -89.00,1852.00, -2179.20, 110.90},
{"~r~|~w~Los Angeles International", 1852.00, -2394.30, -89.00,2089.00, -2179.20, 110.90},
{"~r~|~w~Los Angeles International", 1382.70, -2730.80, -89.00,2201.80, -2394.30, 110.90},
{"~r~|~w~Los Angeles International", 1974.60, -2394.30, -39.00,2089.00, -2256.50,60.90},
{"~r~|~w~Los Angeles International", 1400.90, -2669.20, -39.00,2189.80, -2597.20,60.90},
{"~r~|~w~Los Angeles International", 2051.60, -2597.20, -39.00,2152.40, -2394.30,60.90},
{"~r~|~w~Marina",647.70, -1804.20, -89.00, 851.40, -1577.50, 110.90},
{"~r~|~w~Marina",647.70, -1577.50, -89.00, 807.90, -1416.20, 110.90},
{"~r~|~w~Marina",807.90, -1577.50, -89.00, 926.90, -1416.20, 110.90},
{"~r~|~w~Mercado",787.40, -1416.20, -89.00,1072.60, -1310.20, 110.90},
{"~r~|~w~Mercado",952.60, -1310.20, -89.00,1072.60, -1130.80, 110.90},
{"~r~|~w~Mercado", 1072.60, -1416.20, -89.00,1370.80, -1130.80, 110.90},
{"~r~|~w~Mercado",926.90, -1577.50, -89.00,1370.80, -1416.20, 110.90},
{"~r~|~w~Market Station",787.40, -1410.90, -34.10, 866.00, -1310.20,65.80},
{"~r~|~w~Martin Bridge",-222.10, 293.30, 0.00,-122.10, 476.40, 200.00},
{"~r~|~w~Missionary Hill", -2994.40,-811.20, 0.00, -2178.60,-430.20, 200.00},
{"~r~|~w~Montgomery", 1119.50, 119.50,-3.00,1451.40, 493.30, 200.00},
{"~r~|~w~Montgomery", 1451.40, 347.40,-6.10,1582.40, 420.80, 200.00},
{"~r~|~w~Montgomery Intersection",1546.60, 208.10, 0.00,1745.80, 347.40, 200.00},
{"~r~|~w~Montgomery Intersection",1582.40, 347.40, 0.00,1664.60, 401.70, 200.00},
{"~r~|~w~Mulholland", 1414.00,-768.00, -89.00,1667.60,-452.40, 110.90},
{"~r~|~w~Mulholland", 1281.10,-452.40, -89.00,1641.10,-290.90, 110.90},
{"~r~|~w~Mulholland", 1269.10,-768.00, -89.00,1414.00,-452.40, 110.90},
{"~r~|~w~Mulholland", 1357.00,-926.90, -89.00,1463.90,-768.00, 110.90},
{"~r~|~w~Mulholland", 1318.10,-910.10, -89.00,1357.00,-768.00, 110.90},
{"~r~|~w~Mulholland", 1169.10,-910.10, -89.00,1318.10,-768.00, 110.90},
{"~r~|~w~Mulholland",768.60,-954.60, -89.00, 952.60,-860.60, 110.90},
{"~r~|~w~Mulholland",687.80,-860.60, -89.00, 911.80,-768.00, 110.90},
{"~r~|~w~Mulholland",737.50,-768.00, -89.00,1142.20,-674.80, 110.90},
{"~r~|~w~Mulholland", 1096.40,-910.10, -89.00,1169.10,-768.00, 110.90},
{"~r~|~w~Mulholland",952.60,-937.10, -89.00,1096.40,-860.60, 110.90},
{"~r~|~w~Mulholland",911.80,-860.60, -89.00,1096.40,-768.00, 110.90},
{"~r~|~w~Mulholland",861.00,-674.80, -89.00,1156.50,-600.80, 110.90},
{"~r~|~w~Mulholland Intersection",1463.90, -1150.80, -89.00,1812.60,-768.00, 110.90},
{"~r~|~w~North Rock", 2285.30,-768.00, 0.00,2770.50,-269.70, 200.00},
{"~r~|~w~Ocean Docks",2373.70, -2697.00, -89.00,2809.20, -2330.40, 110.90},
{"~r~|~w~Ocean Docks",2201.80, -2418.30, -89.00,2324.00, -2095.00, 110.90},
{"~r~|~w~Ocean Docks",2324.00, -2302.30, -89.00,2703.50, -2145.10, 110.90},
{"~r~|~w~Ocean Docks",2089.00, -2394.30, -89.00,2201.80, -2235.80, 110.90},
{"~r~|~w~Ocean Docks",2201.80, -2730.80, -89.00,2324.00, -2418.30, 110.90},
{"~r~|~w~Ocean Docks",2703.50, -2302.30, -89.00,2959.30, -2126.90, 110.90},
{"~r~|~w~Ocean Docks",2324.00, -2145.10, -89.00,2703.50, -2059.20, 110.90},
{"~r~|~w~Ocean Flats", -2994.40, 277.40,-9.10, -2867.80, 458.40, 200.00},
{"~r~|~w~Ocean Flats", -2994.40,-222.50,-0.00, -2593.40, 277.40, 200.00},
{"~r~|~w~Ocean Flats", -2994.40,-430.20,-0.00, -2831.80,-222.50, 200.00},
{"~r~|~w~Octane Springs",338.60,1228.50, 0.00, 664.30,1655.00, 200.00},
{"~r~|~w~Old Vegas Strip", 2162.30,2012.10, -89.00,2685.10,2202.70, 110.90},
{"~r~|~w~Palisades", -2994.40, 458.40,-6.10, -2741.00,1339.60, 200.00},
{"~r~|~w~Palomino Creek", 2160.20,-149.00, 0.00,2576.90, 228.30, 200.00},
{"~r~|~w~Paradiso",-2741.00, 793.40,-6.10, -2533.00,1268.40, 200.00},
{"~r~|~w~Pershing Square",1440.90, -1722.20, -89.00,1583.50, -1577.50, 110.90},
{"~r~|~w~Pilgrim",2437.30,1383.20, -89.00,2624.40,1783.20, 110.90},
{"~r~|~w~Pilgrim",2624.40,1383.20, -89.00,2685.10,1783.20, 110.90},
{"~r~|~w~Pilson Intersection",1098.30,2243.20, -89.00,1377.30,2507.20, 110.90},
{"~r~|~w~Pirates in Men's Pants", 1817.30,1469.20, -89.00,2027.40,1703.20, 110.90},
{"~r~|~w~Playa del Seville",2703.50, -2126.90, -89.00,2959.30, -1852.80, 110.90},
{"~r~|~w~Prickle Pine", 1534.50,2583.20, -89.00,1848.40,2863.20, 110.90},
{"~r~|~w~Prickle Pine", 1117.40,2507.20, -89.00,1534.50,2723.20, 110.90},
{"~r~|~w~Prickle Pine", 1848.40,2553.40, -89.00,1938.80,2863.20, 110.90},
{"~r~|~w~Prickle Pine", 1938.80,2624.20, -89.00,2121.40,2861.50, 110.90},
{"~r~|~w~Queens",-2533.00, 458.40, 0.00, -2329.30, 578.30, 200.00},
{"~r~|~w~Queens",-2593.40,54.70, 0.00, -2411.20, 458.40, 200.00},
{"~r~|~w~Queens",-2411.20, 373.50, 0.00, -2253.50, 458.40, 200.00},
{"~r~|~w~Randolph Industrial Estate", 1558.00, 596.30, -89.00,1823.00, 823.20, 110.90},
{"~r~|~w~Redsands East",1817.30,2011.80, -89.00,2106.70,2202.70, 110.90},
{"~r~|~w~Redsands East",1817.30,2202.70, -89.00,2011.90,2342.80, 110.90},
{"~r~|~w~Redsands East",1848.40,2342.80, -89.00,2011.90,2478.40, 110.90},
{"~r~|~w~Redsands West",1236.60,1883.10, -89.00,1777.30,2142.80, 110.90},
{"~r~|~w~Redsands West",1297.40,2142.80, -89.00,1777.30,2243.20, 110.90},
{"~r~|~w~Redsands West",1377.30,2243.20, -89.00,1704.50,2433.20, 110.90},
{"~r~|~w~Redsands West",1704.50,2243.20, -89.00,1777.30,2342.80, 110.90},
{"~r~|~w~Regular Tom",-405.70,1712.80,-3.00,-276.70,1892.70, 200.00},
{"~r~|~w~Richman", 647.50, -1118.20, -89.00, 787.40,-954.60, 110.90},
{"~r~|~w~Richman", 647.50,-954.60, -89.00, 768.60,-860.60, 110.90},
{"~r~|~w~Richman", 225.10, -1369.60, -89.00, 334.50, -1292.00, 110.90},
{"~r~|~w~Richman", 225.10, -1292.00, -89.00, 466.20, -1235.00, 110.90},
{"~r~|~w~Richman",72.60, -1404.90, -89.00, 225.10, -1235.00, 110.90},
{"~r~|~w~Richman",72.60, -1235.00, -89.00, 321.30, -1008.10, 110.90},
{"~r~|~w~Richman", 321.30, -1235.00, -89.00, 647.50, -1044.00, 110.90},
{"~r~|~w~Richman", 321.30, -1044.00, -89.00, 647.50,-860.60, 110.90},
{"~r~|~w~Richman", 321.30,-860.60, -89.00, 687.80,-768.00, 110.90},
{"~r~|~w~Richman", 321.30,-768.00, -89.00, 700.70,-674.80, 110.90},
{"~r~|~w~Robada Intersection", -1119.00,1178.90, -89.00,-862.00,1351.40, 110.90},
{"~r~|~w~Roca Escalante", 2237.40,2202.70, -89.00,2536.40,2542.50, 110.90},
{"~r~|~w~Roca Escalante", 2536.40,2202.70, -89.00,2625.10,2442.50, 110.90},
{"~r~|~w~Rockshore East", 2537.30, 676.50, -89.00,2902.30, 943.20, 110.90},
{"~r~|~w~Rockshore West", 1997.20, 596.30, -89.00,2377.30, 823.20, 110.90},
{"~r~|~w~Rockshore West", 2377.30, 596.30, -89.00,2537.30, 788.80, 110.90},
{"~r~|~w~Rodeo",72.60, -1684.60, -89.00, 225.10, -1544.10, 110.90},
{"~r~|~w~Rodeo",72.60, -1544.10, -89.00, 225.10, -1404.90, 110.90},
{"~r~|~w~Rodeo", 225.10, -1684.60, -89.00, 312.80, -1501.90, 110.90},
{"~r~|~w~Rodeo", 225.10, -1501.90, -89.00, 334.50, -1369.60, 110.90},
{"~r~|~w~Rodeo", 334.50, -1501.90, -89.00, 422.60, -1406.00, 110.90},
{"~r~|~w~Rodeo", 312.80, -1684.60, -89.00, 422.60, -1501.90, 110.90},
{"~r~|~w~Rodeo", 422.60, -1684.60, -89.00, 558.00, -1570.20, 110.90},
{"~r~|~w~Rodeo", 558.00, -1684.60, -89.00, 647.50, -1384.90, 110.90},
{"~r~|~w~Rodeo", 466.20, -1570.20, -89.00, 558.00, -1385.00, 110.90},
{"~r~|~w~Rodeo", 422.60, -1570.20, -89.00, 466.20, -1406.00, 110.90},
{"~r~|~w~Rodeo", 466.20, -1385.00, -89.00, 647.50, -1235.00, 110.90},
{"~r~|~w~Rodeo", 334.50, -1406.00, -89.00, 466.20, -1292.00, 110.90},
{"~r~|~w~Royal Casino", 2087.30,1383.20, -89.00,2437.30,1543.20, 110.90},
{"~r~|~w~Sons em San Andreas",2450.30, 385.50,-100.00,2759.20, 562.30, 200.00},
{"~r~|~w~Santa Flora", -2741.00, 458.40,-7.60, -2533.00, 793.40, 200.00},
{"~r~|~w~Santa Maria Beach", 342.60, -2173.20, -89.00, 647.70, -1684.60, 110.90},
{"~r~|~w~Santa Maria Beach",72.60, -2173.20, -89.00, 342.60, -1684.60, 110.90},
{"~r~|~w~Shady Cabin", -1632.80, -2263.40,-3.00, -1601.30, -2231.70, 200.00},
{"~r~|~w~Shady Creeks",-1820.60, -2643.60,-8.00, -1226.70, -1771.60, 200.00},
{"~r~|~w~Shady Creeks",-2030.10, -2174.80,-6.10, -1820.60, -1771.60, 200.00},
{"~r~|~w~Sobell Rail Yards",2749.90,1548.90, -89.00,2923.30,1937.20, 110.90},
{"~r~|~w~Spinybed", 2121.40,2663.10, -89.00,2498.20,2861.50, 110.90},
{"~r~|~w~Starfish Casino",2437.30,1783.20, -89.00,2685.10,2012.10, 110.90},
{"~r~|~w~Starfish Casino",2437.30,1858.10, -39.00,2495.00,1970.80,60.90},
{"~r~|~w~Starfish Casino",2162.30,1883.20, -89.00,2437.30,2012.10, 110.90},
{"~r~|~w~Templo", 1252.30, -1130.80, -89.00,1378.30, -1026.30, 110.90},
{"~r~|~w~Templo", 1252.30, -1026.30, -89.00,1391.00,-926.90, 110.90},
{"~r~|~w~Templo", 1252.30,-926.90, -89.00,1357.00,-910.10, 110.90},
{"~r~|~w~Templo",952.60, -1130.80, -89.00,1096.40,-937.10, 110.90},
{"~r~|~w~Templo", 1096.40, -1130.80, -89.00,1252.30, -1026.30, 110.90},
{"~r~|~w~Templo", 1096.40, -1026.30, -89.00,1252.30,-910.10, 110.90},
{"~r~|~w~The Camel's Toe",2087.30,1203.20, -89.00,2640.40,1383.20, 110.90},
{"~r~|~w~The Clown's Pocket", 2162.30,1783.20, -89.00,2437.30,1883.20, 110.90},
{"~r~|~w~The Emerald Isle", 2011.90,2202.70, -89.00,2237.40,2508.20, 110.90},
{"~r~|~w~A Fazenda",-1209.60, -1317.10, 114.90,-908.10,-787.30, 251.90},
{"~r~|~w~The Four Dragons Casino",1817.30, 863.20, -89.00,2027.30,1083.20, 110.90},
{"~r~|~w~The High Roller",1817.30,1283.20, -89.00,2027.30,1469.20, 110.90},
{"~r~|~w~The Mako Span",1664.60, 401.70, 0.00,1785.10, 567.20, 200.00},
{"~r~|~w~The Panopticon", -947.90,-304.30,-1.10,-319.60, 327.00, 200.00},
{"~r~|~w~The Pink Swan",1817.30,1083.20, -89.00,2027.30,1283.20, 110.90},
{"~r~|~w~Represa Sherman",-968.70,1929.40,-3.00,-481.10,2155.20, 200.00},
{"~r~|~w~The Strip",2027.40, 863.20, -89.00,2087.30,1703.20, 110.90},
{"~r~|~w~The Strip",2106.70,1863.20, -89.00,2162.30,2202.70, 110.90},
{"~r~|~w~The Strip",2027.40,1783.20, -89.00,2162.30,1863.20, 110.90},
{"~r~|~w~The Strip",2027.40,1703.20, -89.00,2137.40,1783.20, 110.90},
{"~r~|~w~The Visage", 1817.30,1863.20, -89.00,2106.70,2011.80, 110.90},
{"~r~|~w~The Visage", 1817.30,1703.20, -89.00,2027.40,1863.20, 110.90},
{"~r~|~w~Unity Station",1692.60, -1971.80, -20.40,1812.60, -1932.80,79.50},
{"~r~|~w~Vale Secreto",-936.60,2611.40, 2.00,-715.90,2847.90, 200.00},
{"~r~|~w~Verdant Bluffs",930.20, -2488.40, -89.00,1249.60, -2006.70, 110.90},
{"~r~|~w~Verdant Bluffs", 1073.20, -2006.70, -89.00,1249.60, -1842.20, 110.90},
{"~r~|~w~Verdant Bluffs", 1249.60, -2179.20, -89.00,1692.60, -1842.20, 110.90},
{"~r~|~w~Verdant Meadows",37.00,2337.10,-3.00, 435.90,2677.90, 200.00},
{"~r~|~w~Verona Beach",647.70, -2173.20, -89.00, 930.20, -1804.20, 110.90},
{"~r~|~w~Verona Beach",930.20, -2006.70, -89.00,1073.20, -1804.20, 110.90},
{"~r~|~w~Verona Beach",851.40, -1804.20, -89.00,1046.10, -1577.50, 110.90},
{"~r~|~w~Verona Beach", 1161.50, -1722.20, -89.00,1323.90, -1577.50, 110.90},
{"~r~|~w~Verona Beach", 1046.10, -1722.20, -89.00,1161.50, -1577.50, 110.90},
{"~r~|~w~HollyWood",787.40, -1310.20, -89.00, 952.60, -1130.80, 110.90},
{"~r~|~w~HollyWood",787.40, -1130.80, -89.00, 952.60,-954.60, 110.90},
{"~r~|~w~HollyWood",647.50, -1227.20, -89.00, 787.40, -1118.20, 110.90},
{"~r~|~w~HollyWood",647.70, -1416.20, -89.00, 787.40, -1227.20, 110.90},
{"~r~|~w~Whitewood Estates", 883.30,1726.20, -89.00,1098.30,2507.20, 110.90},
{"~r~|~w~Whitewood Estates",1098.30,1726.20, -89.00,1197.30,2243.20, 110.90},
{"~r~|~w~Willowfield",1970.60, -2179.20, -89.00,2089.00, -1852.80, 110.90},
{"~r~|~w~Willowfield",2089.00, -2235.80, -89.00,2201.80, -1989.90, 110.90},
{"~r~|~w~Willowfield",2089.00, -1989.90, -89.00,2324.00, -1852.80, 110.90},
{"~r~|~w~Willowfield",2201.80, -2095.00, -89.00,2324.00, -1989.90, 110.90},
{"~r~|~w~Willowfield",2541.70, -1941.40, -89.00,2703.50, -1852.80, 110.90},
{"~r~|~w~Willowfield",2324.00, -2059.20, -89.00,2541.70, -1852.80, 110.90},
{"~r~|~w~Willowfield",2541.70, -2059.20, -89.00,2703.50, -1941.40, 110.90},
{"~r~|~w~Estacao Yellow Bell",1377.40,2600.40, -21.90,1492.40,2687.30,78.00},
{"~r~|~w~Los Angeles", 44.60, -2892.90,-242.90,2997.00,-768.00, 900.00},
{"~r~|~w~Las Vegas",869.40, 596.30,-242.90,2997.00,2993.80, 900.00},
{"~r~|~w~Bone County",-480.50, 596.30,-242.90, 869.40,2993.80, 900.00},
{"~r~|~w~Tierra Robada", -2997.40,1659.60,-242.90,-480.50,2993.80, 900.00},
{"~r~|~w~Tierra Robada", -1213.90, 596.30,-242.90,-480.50,1659.60, 900.00},
{"~r~|~w~San Francisco",-2997.40, -1115.50,-242.90, -1213.90,1659.60, 900.00},
{"~r~|~w~Red County",-1213.90,-768.00,-242.90,2997.00, 596.30, 900.00},
{"~r~|~w~Flint County",-1213.90, -2892.90,-242.90,44.60,-768.00, 900.00},
{"~r~|~w~Whetstone", -2997.40, -2892.90,-242.90, -1213.90, -1115.50, 900.00}
};

//Mensagens do chat
new Mensagens[][] = {
"Escolha uma profissão, digite /empregos",
"Não mate no banco, área de spawn e hospitais, veja melhor as /regras !!",
"Se precisar reportar alguma coisa ao administrador digite /rep [Texto]",
"Você já escolheu sua profissão? digite /myprof [ID da prof]",
"Descapote seu carro digitando /flip",
"Veja os comandos do jogo digitando /ajuda",
"Olha as regras digitando /regras (Recomendado)",
"Difícil comprar com pouca grana... digite /precos",
"Caso você precise de para-quedas digite /paraquedas",
"Veja quais os administrador estão online digitando /admins",
"Você já escolheu sua profissão? Use /myprof [ID da prof]",
"Digite /precoshab para ver o preço das licensas (com instrutor) e /licensas para comprar.",
"Veja quem ajudou a criar o RPG Rulez, digite /creditosrulez"
};

//Cores do Chat
new Cores[] = {
COR_BRANCO
};

//Objetos
enum object_info {
modeloid,
Float:ox,
Float:oy,
Float:oz,
Float:orx,
Float:ory,
Float:orz,
Float:viewdist
}

new Objects[][object_info] = {

//Auto-Escola
    /*{985,1582.625,-1638.120,14.145,0.0,0.0,0.482,1000.0},
	{987,2424.334,-2095.355,12.547,0.0,0.0,-90.000,1000.0},
	{987,2424.870,-2072.233,12.626,0.0,0.0,-91.719,1000.0},
	{1238,2541.057,-2113.564,12.858,0.0,0.0,0.0,1000.0},
	{1257,2420.214,-2075.987,13.833,0.0,0.0,0.0,1000.0},
	{1366,2408.198,-2075.744,13.167,0.0,0.0,0.0,1000.0},
	{1238,2541.101,-2119.937,12.858,0.0,0.0,0.0,1000.0},
	{1238,2540.993,-2115.331,12.858,0.0,0.0,0.0,1000.0},
	{981,2439.681,-2096.741,13.498,0.0,0.0,-180.000,1000.0},
	{981,2471.269,-2096.692,13.498,0.0,0.0,-180.000,1000.0},
	{981,2505.367,-2096.929,13.498,0.0,0.0,-180.000,1000.0},
	{991,2624.118,-2114.527,13.762,0.0,0.0,90.000,1000.0},
	{1238,2624.890,-2121.489,12.865,0.0,0.0,0.0,1000.0},
	{1238,2629.380,-2121.385,12.865,0.0,0.0,0.0,1000.0},
	{1238,2626.433,-2121.320,12.865,0.0,0.0,0.0,1000.0},
	{1238,2631.084,-2121.293,12.865,0.0,0.0,0.0,1000.0},
	{1238,2627.783,-2121.379,12.865,0.0,0.0,0.0,1000.0},
	{1238,2626.118,-2116.586,12.865,0.0,0.0,0.0,1000.0},
	{1238,2627.875,-2116.670,12.865,0.0,0.0,0.0,1000.0},
	{1238,2629.301,-2116.679,12.865,0.0,0.0,0.0,1000.0},
	{1238,2632.850,-2121.477,12.865,0.0,0.0,0.0,1000.0},
	{1238,2624.519,-2116.565,12.865,0.0,0.0,0.0,1000.0},*/
	{1238,2633.006,-2117.699,12.865,0.0,0.0,0.0,1000.0},
	{1238,2631.203,-2117.155,12.865,0.0,0.0,0.0,1000.0}
};

enum player_info {
	objid[sizeof(Objects)],
	bool:view[sizeof(Objects)]
}

new Player[MAX_PLAYERS][player_info];
bool:IsInReach(Float:x,Float:y,Float:z,Float:x2,Float:y2,Float:z2,Float:dist) {

	x = (x > x2) ? x - x2 : x2 - x;
	if(x > dist) return false;
	y = (y > y2) ? y - y2 : y2 - y;
	if(y > dist) return false;
	z = (z > z2) ? z - z2 : z2 - z;
	if(z > dist) return false;
	return true;
}

//Text Draw
new Text:Velo[MAX_PLAYERS];

main() {

	print("\n==============================================");
	print("#           .::[VGS]RPG Rulez::.            #");
	print("#                                           #");
	print("#                   R                       #");
	print("#                   P                       #");
	print("#                   G                       #");
	print("#                                           #");
	print("#                   R                       #");
	print("#                   U                       #");
	print("#                   L                       #");
	print("#                   E                       #");
	print("#                   Z                       #");
	print("#                                           #");
	print("#          ..:: Coder: Mac ::..             #");
	print("==============================================\n");

}

public OnGameModeInit() {

    SetGameModeText("RPG Rulez | VGS Clan");
    SendRconCommand("mapname Los Santos");
    AllowAdminTeleport(1);
    SetDisabledWeapons(36,35,37,38,44,45);
	SetNameTagDrawDistance(10.0);
	EnableTirePopping(1);
	AllowInteriorWeapons(1);
	UsePlayerPedAnims();
	EnableStuntBonusForAll(0);
	ShowPlayerMarkers(1);
	EnableZoneNames(0);

	//Timer's
	SetTimer("Bancos",500,1);
	SetTimer("ChecarCombustivel",50000,1);
	SetTimer("TempoNaCadeia",1000,1);
	SetTimer("Taxi",5000,1);
	SetTimer("ATaxi",5000,1);
	SetTimer("MTaxi",5000,1);
	SetTimer("MensagensRandom",300000,1);
    SetTimer("VerificadorRcon",500,1);
    SetTimer("Velocimetro",1000,1);
    SetTimer("Horario",2400000,1);
    SetTimer("TempoObjetos",50,1);
    SetTimer("HorarioTextDraw",1000,1);
	SetTimer("Clima",10800000,1);
	SetTimer("AtualizarDinheiro",1000,1);
	
    CarregarPickups("Casas.RPG");

    AddPlayerClass(72,1117.7823,-2036.9849,78.7500,279.5109,0,0,0,0,0,0);

//================================= Veículos ===================================

//------------------------------------------------------------------------------

//================================ Los Santos ==================================

    AddStaticVehicle(603,1735.4683,-1751.7422,13.3502,359.0199,69,1); //Phoenix
    AddStaticVehicle(489,1712.0985,-1727.2043,13.6040,89.0606,14,123); //Rancher
    AddStaticVehicle(515,1742.5697,-1759.9103,14.5772,0.5291,39,78); //RoadTrain
    AddStaticVehicle(584,1743.1643,-1773.5884,14.8024,0.5325,1,1); //Xoomer (Parte do caminhão de gás)
    AddStaticVehicle(437,1783.8998,-1691.1635,13.5834,89.3604,98,20); //Ônibus
    AddStaticVehicle(437,1783.9354,-1697.1990,13.6172,88.6400,6,6); //Ônibus
    AddStaticVehicle(416,2010.9246,-1410.4421,17.1415,268.1629,1,3); //Ambulância
    AddStaticVehicle(416,2035.3507,-1439.6804,17.4760,179.1478,1,3); //Ambulância
    AddStaticVehicle(474,2158.2285,-1799.8569,13.1325,270.9170,81,1); //Hermes
    AddStaticVehicle(518,2157.5591,-1792.3596,13.0259,270.4482,9,39); //Fortune
    AddStaticVehicle(438,2188.2937,-1808.1447,13.3770,359.9593,6,76); //Cabbie
    AddStaticVehicle(438,2188.4937,-1799.6799,13.3769,0.6649,6,76); //Cabbie
    AddStaticVehicle(438,2188.4871,-1791.6948,13.3760,0.6740,6,76); //Cabbie
    AddStaticVehicle(510,1782.1315,-1423.5140,15.3660,35.2948,6,6); //Mountain Bike
    AddStaticVehicle(510,1781.4355,-1423.9713,15.3241,35.2950,5,5); //Mountain Bike
    AddStaticVehicle(481,1780.9174,-1424.3904,15.2740,40.8761,46,46); //BMX
    AddStaticVehicle(544,1750.6758,-1455.5739,13.7830,269.1528,3,1); //Caminhão de Bombeiros
    AddStaticVehicle(500,1719.8713,-1386.1058,13.5587,180.7683,40,84); //Mesa
    AddStaticVehicle(424,1719.8285,-1370.8318,13.2417,182.2816,24,53); //BF-Injection
    AddStaticVehicle(471,1736.5380,-1387.8540,13.0672,44.5718,156,158); //QuadBike
    AddStaticVehicle(510,1782.7882,-1423.0012,15.3659,35.2947,16,16); //Mountain Bike
    AddStaticVehicle(416,1179.8965,-1339.1077,13.9470,271.4211,1,3); //Ambulância
    AddStaticVehicle(402,1841.4713,-1871.1112,13.2214,0.8613,13,13); //Buffalo
    AddStaticVehicle(462,1718.8285,-1375.6873,12.9811,90.4189,10,10); //Lambreta
    AddStaticVehicle(462,1718.8374,-1378.3804,12.9822,87.1501,12,12); //Lambreta
    AddStaticVehicle(462,1718.8088,-1379.5802,12.9751,82.4510,13,13); //Lambreta
    AddStaticVehicle(475,2457.2776,-2077.4253,13.3512,179.8568,6,6); //Sabre Auto-Escola
    AddStaticVehicle(538,1770.0391,-1957.7500,14.8756,90.0000,0,0); //Trem
    AddStaticVehicle(415,1566.2466,-1615.0791,13.1553,177.6205,25,1); //Cheetah Delegacia
    AddStaticVehicle(451,1547.0145,-1614.0721,13.0892,1.8339,125,125); //Turismo Delegacia
    AddStaticVehicle(411,1574.6071,-1614.9186,13.1099,178.7186,64,1); //infernus Delegacia
    AddStaticVehicle(458,1558.4138,-1614.4995,13.2226,0.4480,101,1); //Solair Delegacia
    AddStaticVehicle(596,1601.6357,-1684.2279,5.6118,89.7382,6,1); //Viatura da Policia (LSPD)
    AddStaticVehicle(596,1601.3534,-1696.0166,5.6118,89.4988,6,1); //Viatura da Policia (LSPD)
    AddStaticVehicle(596,1587.5875,-1711.6035,5.6112,180.1600,6,1); //Viatura da Policia (LSPD)
    AddStaticVehicle(596,1574.5422,-1711.4192,5.6119,179.2421,6,1); //Viatura da Policia (LSPD)
    AddStaticVehicle(490,1562.4359,-1709.6222,6.0191,1.6646,0,0); //F.B.I Rancher
    AddStaticVehicle(490,1566.7954,-1709.9875,6.0178,359.4198,0,0); //F.B.I Rancher
    AddStaticVehicle(427,1534.5012,-1644.7712,6.0224,0.0757,0,1); //Enforcer S.W.A.T
    AddStaticVehicle(427,1544.7661,-1662.9482,6.0225,91.3614,0,1); //Enforcer S.W.A.T
    AddStaticVehicle(427,1529.2042,-1688.0055,6.0231,269.3793,0,1); //Enforcer S.W.A.T
    AddStaticVehicle(493,354.9753,-2041.9457,0.0127,72.8535,1,1); //JetMax
    AddStaticVehicle(532,-372.5187,-1360.5237,23.2549,51.1312,0,0); // Combine Havestor
    AddStaticVehicle(531,-448.7231,-1400.7926,21.5611,236.9027,36,2); // Tractor
    AddStaticVehicle(483,-371.0318,-1438.0427,25.7192,88.9099,3,3); // Camper
    AddStaticVehicle(554,-565.9385,-1481.6064,9.8423,36.6740,15,32); // Yosimite

//================================== San Fierro ================================

    AddStaticVehicle(597,-1588.2479,748.0393,-5.4903,359.9998,1,1); //Viatura Policial (SFPD)
	AddStaticVehicle(523,-1584.0217,749.4910,-5.6655,180.9966,6,0); //Viatura Policial (SFPD)
	AddStaticVehicle(523,-1579.8461,749.0732,-5.6571,181.8757,6,0); //Viatura Policial (SFPD)
	AddStaticVehicle(597,-1574.2565,742.4983,-5.5206,88.9996,6,1); //Viatura Policial (SFPD)
	AddStaticVehicle(523,-1573.5985,734.6492,-5.6689,90.0025,6,1); //Viatura Policial (SFPD)
    AddStaticVehicle(601,-1628.3643,651.0035,6.9464,0.3379,0,0); //Tanque da S.W.A.T
    AddStaticVehicle(597,-1605.8036,673.6382,6.9079,179.0647,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(597,-1600.1277,673.6027,6.9104,178.9945,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(597,-1612.0612,673.4278,6.9086,180.2092,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(475,-2089.3955,-153.3617,35.1253,358.6243,16,16); //Sabre escola de pilotagem
    AddStaticVehicle(416,-2543.9534,586.9307,14.6012,270.1252,1,1); //Ambulância no Hospital
    AddStaticVehicle(416,-2543.5486,592.9233,14.6027,269.7417,1,1); //Ambulância no Hospital
    
/*//================================= Ilha Rulez =================================

    AddStaticVehicle(493,3977.8333,-74.3280,-0.0203,308.2810,36,13); //Jetmax
    AddStaticVehicle(473,4030.0977,-121.3384,0.3862,287.5573,56,53); //Dingy
    AddStaticVehicle(409,3955.9797,-200.6194,4.0238,0.5643,1,1); //Limosine (Branca)
    AddStaticVehicle(479,4079.3684,-150.2207,3.9510,90.0237,59,36); //Regina
    AddStaticVehicle(521,4123.6724,-53.3856,3.4607,62.0582,75,13); //FCR-900
    AddStaticVehicle(526,4125.2959,39.4121,3.7469,101.8467,9,39); //Fortune
    AddStaticVehicle(517,4051.9373,71.4782,3.7115,269.9634,36,36); //Majestic
    AddStaticVehicle(510,4082.5203,2.3695,3.9635,274.9492,46,46); //Mountain Bike
    AddStaticVehicle(509,4086.4949,-28.8886,3.2942,1.6075,74,1); //Bike
    AddStaticVehicle(471,4118.5405,-161.0282,3.5395,177.8810,103,111); //Quadriciclo
    AddStaticVehicle(448,4106.1602,-178.0556,3.5366,285.4269,3,6); //Pizzaboy
    AddStaticVehicle(558,3928.8467,-210.0156,3.8250,14.4566,1,1); //Uranus
    AddStaticVehicle(429,3929.9624,-187.3425,3.8998,144.8709,13,13); //Banshee
    AddStaticVehicle(480,3965.0449,-291.3366,4.0885,343.6393,12,12); //Comet
    AddStaticVehicle(434,3945.0244,-292.6578,4.2446,304.5911,12,12); //Hotknife
    AddStaticVehicle(539,3925.9492,-292.7873,3.6303,25.0686,86,70); //Vortex
    AddStaticVehicle(519,4072.6533,182.3005,4.6696,90.2737,1,1); //Shamal
    AddStaticVehicle(485,4045.4729,160.6465,3.6100,356.5513,1,74); //Baggage
    AddStaticVehicle(487,3885.1418,187.2108,6.2466,178.5645,26,57); //Maverick
    AddStaticVehicle(447,3944.6028,225.2528,0.5567,2.4974,75,2); //Seasparrow
    AddStaticVehicle(534,4125.0522,197.0952,3.8423,181.4922,42,42); //Remington
    AddStaticVehicle(493,2888.9792,-270.0068,0.0879,276.3116,36,13); //JetMax (para ir para ilha)
    AddStaticVehicle(493,2889.3311,-277.8873,-0.0137,269.7806,36,13); //JetMax (para ir para ilha)
    AddStaticVehicle(493,2889.3374,-284.5616,0.0448,269.3984,36,13); //JetMax (para ir para ilha)
    AddStaticVehicle(493,3909.0430,-186.7708,-0.1666,101.4484,36,13); //Jetmax (para sair da ilha)
    AddStaticVehicle(529,2864.0952,-277.6433,7.2318,173.0492,42,42); //Willard
    
//============================== Create Objects ================================

//Ilha Rulez
    CreateObject(10766, 4103.797852, 6.137871, 0.731636, 0.0000, 0.0000, 0.0000);
    CreateObject(10766, 4103.396484, -70.472588, 0.714971, 0.0000, 0.0000, 179.5180);
    CreateObject(10766, 4067.660889, 89.028397, 0.741271, 0.0000, 0.0000, 90.0000);
    CreateObject(10766, 3943.641357, 6.106445, 0.890964, 0.0000, 0.0000, 0.0000);
    CreateObject(10766, 3943.333496, -76.340591, 0.913211, 0.0000, 0.0000, 180.0000);
    CreateObject(10766, 4041.584717, -153.185349, 0.940989, 0.0000, 0.0000, 90.0001);
    CreateObject(10766, 3943.528076, -186.795761, 0.969498, 0.0000, 0.0000, 180.0000);
    CreateObject(10766, 4055.028564, 180.749817, 0.774496, 0.0000, 0.0000, 270.0000);
    CreateObject(10766, 3974.957520, 180.763245, 0.773530, 0.0000, 0.0000, 90.0001);
    CreateObject(18449, 4103.875000, 121.239212, 2.752012, 0.0000, 0.0000, 270.0000);
    CreateObject(8357, 4005.599365, 180.361923, 2.763205, 0.0000, 0.0000, 90.0000);
    CreateObject(16771, 4069.916260, 183.308655, 9.294075, 0.0000, 0.0000, 90.0000);
    CreateObject(973, 4047.051025, 152.221817, 3.260028, 0.0000, 0.0000, 0.0000);
    CreateObject(973, 4056.274414, 152.227615, 3.260028, 0.0000, 0.0000, 0.0000);
    CreateObject(973, 4065.657227, 152.223389, 3.260028, 0.0000, 0.0000, 0.0000);
    CreateObject(973, 4074.701172, 152.237137, 3.260027, 0.0000, 0.0000, 0.0000);
    CreateObject(973, 4083.980225, 152.226151, 3.260028, 0.0000, 0.0000, 0.0000);
    CreateObject(973, 4091.665039, 152.215515, 3.260028, 0.0000, 0.0000, 0.0000);
    CreateObject(973, 4038.717773, 152.266129, 3.285028, 0.0000, 0.0000, 0.0000);
    CreateObject(8417, 4118.279297, 176.164703, 3.021385, 0.0000, 180.4820, 0.0000);
    CreateObject(8417, 4127.707031, 176.197495, 2.928627, 0.0000, 180.4820, 0.0000);
    CreateObject(10763, 4114.878418, 182.265625, 35.796421, 0.0000, 0.0000, 135.0000);
    CreateObject(4874, 3901.995361, 189.240616, 5.606513, 0.0000, 0.0000, 0.0000);
    CreateObject(8417, 4055.287354, 89.495583, 2.839630, 0.0000, 179.6226, 0.0000);
    CreateObject(8417, 4068.445068, 89.259521, 2.900740, 0.0000, 179.6226, 0.0000);
    CreateObject(8417, 4104.100098, 3.152988, 2.512329, 0.0000, 179.6226, 270.0000);
    CreateObject(8417, 4102.383789, -23.796701, 2.712330, 0.0000, 179.6226, 270.0000);
    CreateObject(8417, 4102.472656, -57.441521, 2.670665, 0.0000, 179.6226, 90.0001);
    CreateObject(8417, 4099.853027, 19.931498, 2.779990, 0.0000, 180.4820, 180.0000);
    CreateObject(8417, 4100.426758, 1.833805, 2.784263, 0.0000, 180.4820, 180.0000);
    CreateObject(8417, 4105.406250, -18.562439, 2.729246, 0.0000, 180.4820, 180.0000);
    CreateObject(8417, 4103.108887, 35.507423, 2.657612, 0.0000, 180.4820, 180.0000);
    CreateObject(8417, 4102.681641, 20.372612, 2.853235, 0.0000, 180.4820, 180.0000);
    CreateObject(8417, 4102.945801, -84.346817, 2.676141, 0.0000, 180.4820, 90.0000);
    CreateObject(8417, 4103.509277, -79.180664, 2.783229, 0.0000, 180.4820, 90.0000);
    CreateObject(8417, 4057.391357, -153.260681, 2.821682, 0.0000, 179.6226, 358.2811);
    CreateObject(8417, 4028.279297, -153.861786, 2.914343, 0.0000, 179.6226, 180.0000);
    CreateObject(8417, 4056.142578, -153.929153, 2.989344, 0.0000, 179.6226, 90.0000);
    CreateObject(8417, 4033.394287, -154.526031, 2.968086, 0.0000, 179.6226, 90.0000);
    CreateObject(8417, 3943.371826, 29.958256, 2.871659, 0.0000, 179.6226, 270.0000);
    CreateObject(8417, 3943.668945, -11.081665, 2.871659, 0.0000, 179.6226, 90.0000);
    CreateObject(8417, 3944.544189, -29.222816, 2.871659, 0.0000, 179.6226, 270.0001);
    CreateObject(8417, 3944.109863, -68.527473, 2.893905, 0.0000, 179.6226, 90.0001);
    CreateObject(8417, 3943.156494, -86.293091, 2.893905, 0.0000, 179.6226, 270.0003);
    CreateObject(8417, 3943.308594, -127.450455, 2.893905, 0.0000, 179.6226, 90.0001);
    CreateObject(8417, 3943.365479, -192.927261, 2.950192, 0.0000, 179.6226, 270.0001);
    CreateObject(8417, 3943.170410, -234.119095, 2.950192, 0.0000, 179.6226, 90.0000);
    CreateObject(5112, 4104.453613, -32.693199, -1.503388, 0.0000, 0.0000, 90.0000);
    CreateObject(5128, 4104.150879, 92.070503, 2.237946, 0.0000, 0.0000, 0.0000);
    CreateObject(5442, 4104.469238, 61.478878, 3.199910, 0.0000, 0.0000, 270.0000);
    CreateObject(3617, 4081.226318, -55.452873, 5.347268, 0.0000, 0.0000, 90.0000);
    CreateObject(3617, 4081.424072, -33.237427, 5.538933, 0.0000, 0.0000, 90.0000);
    CreateObject(3617, 4081.713379, -11.658421, 5.513933, 0.0000, 0.0000, 90.0000);
    CreateObject(3617, 4082.120117, 10.591072, 5.563933, 0.0000, 0.0000, 90.0000);
    CreateObject(3617, 4082.289063, 32.776909, 5.463933, 0.0000, 0.0000, 90.0000);
    CreateObject(3617, 4081.586914, -78.364082, 5.447268, 0.0000, 0.0000, 90.0000);
    CreateObject(3617, 4124.643555, -85.829308, 5.647269, 0.0000, 0.0000, 270.0000);
    CreateObject(3617, 4124.709961, -63.645115, 5.415211, 0.0000, 0.0000, 270.0000);
    CreateObject(3617, 4124.593750, -40.911915, 5.495232, 0.0000, 0.0000, 270.0000);
    CreateObject(3617, 4124.745605, -17.839775, 5.491780, 0.0000, 0.0000, 270.0000);
    CreateObject(3617, 4124.219727, 4.331793, 5.562698, 0.0000, 0.0000, 270.0000);
    CreateObject(3617, 4123.767090, 27.719097, 5.619648, 0.0000, 0.0000, 270.0000);
    CreateObject(4142, 4074.422607, -114.616646, 3.148265, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4094.521484, -108.267632, 3.748513, 0.0000, 0.0000, 0.0000);
    CreateObject(640, 4114.482422, -108.653564, 3.748513, 0.0000, 0.0000, 0.0000);
    CreateObject(640, 4114.542480, -113.766541, 3.748514, 0.0000, 0.0000, 0.0000);
    CreateObject(640, 4114.563477, -119.088272, 3.748513, 0.0000, 0.0000, 0.0000);
    CreateObject(640, 4094.627930, -113.449326, 3.748513, 0.0000, 0.0000, 0.0000);
    CreateObject(640, 4094.743652, -118.651062, 3.748513, 0.0000, 0.0000, 0.0000);
    CreateObject(622, 4081.739990, -97.106880, 3.254747, 0.0000, 0.0000, 247.5000);
    CreateObject(622, 4121.608398, -172.731293, 3.254747, 0.0000, 0.0000, 22.5000);
    CreateObject(1215, 4113.169922, -162.602646, 3.807381, 0.0000, 0.0000, 0.0000);
    CreateObject(1226, 4088.760986, -144.281769, 6.925899, 0.0000, 0.0000, 78.7500);
    CreateObject(1226, 4115.189453, -139.875641, 6.933143, 0.0000, 0.0000, 0.0000);
    CreateObject(1226, 4116.664063, -95.556396, 6.834496, 0.0000, 0.0000, 258.7500);
    CreateObject(1226, 4117.906250, -59.378162, 6.561513, 0.0000, 0.0000, 281.2500);
    CreateObject(1226, 4116.267090, 1.475304, 6.831579, 0.0000, 0.0000, 281.2500);
    CreateObject(1226, 4110.102539, -10.086584, 7.910614, 0.0000, 0.0000, 348.7500);
    CreateObject(1226, 4098.714844, 16.774786, 7.905838, 0.0000, 0.0000, 180.0000);
    CreateObject(1226, 4088.042480, -27.796665, 6.662039, 0.0000, 0.0000, 90.0001);
    CreateObject(1226, 4088.559326, -64.046288, 6.581996, 0.0000, 0.0000, 90.0001);
    CreateObject(640, 4073.893555, -144.668030, 3.786440, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4066.923584, -144.666092, 3.786452, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4059.233887, -144.574600, 3.787055, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4051.908936, -144.652176, 3.786544, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4044.127441, -144.459793, 3.787811, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4073.881592, -164.426178, 3.668551, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4066.965820, -164.458405, 3.656089, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4060.281494, -164.529663, 3.655620, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4052.929932, -164.667419, 3.654713, 0.0000, 0.0000, 90.0000);
    CreateObject(640, 4045.415527, -164.494370, 3.655852, 0.0000, 0.0000, 90.0000);
    CreateObject(13132, 4068.831543, -137.831924, 6.385587, 0.0000, 0.0000, 90.0000);
    CreateObject(910, 4068.148438, -127.089363, 4.259418, 0.0000, 0.0000, 270.0000);
    CreateObject(16021, 4087.991211, -169.904083, 2.856504, 0.0000, 0.0000, 270.0000);
    CreateObject(4021, 4050.821777, -173.624832, 9.655182, 0.0000, 0.0000, 180.0000);
    CreateObject(1281, 4071.289063, -172.149170, 4.860011, 0.0000, 0.0000, 0.0000);
    CreateObject(1281, 4076.484375, -169.125748, 4.860012, 0.0000, 0.0000, 0.0000);
    CreateObject(1256, 4105.811035, -162.996445, 3.737409, 0.0000, 0.0000, 270.0000);
    CreateObject(1256, 4085.427002, -145.199356, 3.901472, 0.0000, 0.0000, 90.0000);
    CreateObject(4018, 4048.731445, -138.699722, 3.166715, 0.0000, 0.0000, 0.0000);
    CreateObject(5442, 4008.643799, -154.583817, 3.181293, 0.0000, 0.0000, 0.0000);
    CreateObject(640, 4037.839844, -164.524521, 3.655654, 0.0000, 0.0000, 270.0000);
    CreateObject(640, 4031.297607, -164.670731, 3.630560, 0.0000, 0.0000, 270.0000);
    CreateObject(640, 4023.755615, -164.639587, 3.680237, 0.0000, 0.0000, 270.0000);
    CreateObject(640, 4016.965820, -164.764221, 3.724957, 0.0000, 0.0000, 270.0000);
    CreateObject(640, 4010.027832, -164.812836, 3.770655, 0.0000, 0.0000, 270.0000);
    CreateObject(640, 4037.016846, -144.378357, 3.788348, 0.0000, 0.0000, 270.0000);
    CreateObject(640, 4029.865479, -144.366898, 3.771096, 0.0000, 0.0000, 270.0000);
    CreateObject(640, 4011.121338, -144.810806, 3.763452, 0.0000, 0.0000, 270.0000);
    CreateObject(1297, 4012.460205, -143.216309, 6.451840, 0.0000, 0.0000, 78.7500);
    CreateObject(1308, 4012.055176, -136.944336, 3.408931, 0.0000, 0.0000, 0.0000);
    CreateObject(1346, 4009.675293, -138.993881, 4.426949, 0.0000, 0.0000, 0.0000);
    CreateObject(17613, 3942.340332, -200.283600, 3.171015, 0.0000, 0.0000, 270.0000);
    CreateObject(3873, 3944.469482, -257.440308, 20.304010, 0.0000, 0.0000, 11.2500);
    CreateObject(1223, 3954.058594, -222.621338, 3.271521, 0.0000, 0.0000, 123.7499);
    CreateObject(1223, 3928.882324, -223.319214, 3.293789, 0.0000, 0.0000, 67.5000);
    CreateObject(1223, 3927.495605, -179.163940, 3.244746, 0.0000, 0.0000, 315.0000);
    CreateObject(1223, 3963.064209, -195.196304, 3.042409, 0.0000, 0.0000, 180.0000);
    CreateObject(2714, 4066.259766, -144.227325, 4.866031, 0.0000, 0.0000, 0.0000);
    CreateObject(623, 3958.252441, -233.782806, 2.929298, 0.0000, 0.0000, 326.2500);
    CreateObject(623, 3927.960205, -230.684326, 3.229298, 0.0000, 0.0000, 22.5000);
    CreateObject(623, 3926.972656, -174.366287, 3.005253, 0.0000, 0.0000, 225.0000);
    CreateObject(623, 3964.558105, -191.549896, 3.096548, 0.0000, 0.0000, 101.2500);
    CreateObject(632, 3948.300293, -225.566315, 3.753038, 0.0000, 0.0000, 0.0000);
    CreateObject(632, 3948.475342, -231.523026, 3.753039, 0.0000, 0.0000, 0.0000);
    CreateObject(632, 3944.012695, -226.057404, 3.753040, 0.0000, 0.0000, 0.0000);
    CreateObject(632, 3943.915771, -232.619843, 3.753039, 0.0000, 0.0000, 0.0000);
    CreateObject(2631, 3945.434326, -226.946274, 3.352334, 0.0000, 0.0000, 270.0000);
    CreateObject(2631, 3945.403809, -230.306946, 3.352334, 0.0000, 0.0000, 270.0000);
    CreateObject(2631, 3945.395752, -233.645477, 3.352334, 0.0000, 0.0000, 270.0000);
    CreateObject(2631, 3945.322266, -237.089294, 3.352334, 0.0000, 0.0000, 266.5623);
    CreateObject(2631, 3945.114502, -240.567810, 3.352334, 0.0000, 0.0000, 266.5623);
    CreateObject(2631, 3944.906982, -243.542923, 3.355612, 0.0000, 0.0000, 266.5623);
    CreateObject(3461, 3961.525146, -218.476318, 4.667299, 0.0000, 0.0000, 0.0000);
    CreateObject(3461, 3924.080322, -220.743454, 4.652366, 0.0000, 0.0000, 0.0000);
    CreateObject(4563, 3946.458740, 87.566780, 88.537689, 0.0000, 0.0000, 90.0000);
    CreateObject(4564, 3941.679199, -74.792938, 112.077545, 0.0000, 0.0000, 0.0000);
    CreateObject(4564, 3941.590332, 3.635012, 111.569603, 0.0000, 0.0000, 0.0000);
    CreateObject(8417, 3985.159668, -152.658432, 3.387880, 0.0000, 180.4819, 0.0000);
    CreateObject(8417, 3946.079346, -152.644455, 3.320121, 0.0000, 180.4819, 180.0000);
    CreateObject(8417, 3938.321289, -151.912704, 3.318715, 0.0000, 180.4819, 0.0000);
    CreateObject(8417, 3937.752686, -153.081238, 3.289487, 0.0000, 180.4819, 180.0001);
    CreateObject(1309, 3925.996826, -148.700104, 12.933229, 0.0000, 0.0000, 0.0000);
    CreateObject(2789, 4124.520508, 174.811691, 10.553567, 0.0000, 0.0000, 0.0000);
    CreateObject(2790, 4124.580566, 174.836807, 7.220489, 0.0000, 0.0000, 0.0000);
    CreateObject(3462, 3938.873047, -152.140106, 4.866856, 0.0000, 0.0000, 180.0000);
    CreateObject(3471, 3956.511963, -176.039154, 4.559279, 0.0000, 0.0000, 90.0000);
    CreateObject(3471, 3947.875732, -175.414902, 4.559279, 0.0000, 0.0000, 90.0000);
    CreateObject(5811, 3938.762695, -132.776245, 7.555017, 0.0000, 0.0000, 236.2501);
    CreateObject(6958, 3952.740723, -171.381485, 12.171481, 0.0000, 0.0000, 90.0000);
    CreateObject(7304, 3944.656982, -106.131760, 79.567986, 90.2409, 83.3652, 5.1565);
    CreateObject(7597, 4088.464844, 46.519974, 12.566788, 0.0000, 0.0000, 348.7500);
    CreateObject(7610, 3988.737549, -151.323196, 11.465064, 0.0000, 0.0000, 337.5000);
    CreateObject(8292, 3925.513184, -155.757309, 25.532158, 0.0000, 0.0000, 326.2500);
    CreateObject(8292, 3925.221680, -141.024246, 25.492016, 0.0000, 0.0000, 326.2500);
    CreateObject(8292, 3925.351563, -155.822800, 19.573879, 0.0000, 0.0000, 326.2500);
    CreateObject(8292, 3925.363770, -141.057053, 19.542337, 0.0000, 0.0000, 323.6717);
    CreateObject(1256, 3943.992188, -152.282578, 4.040484, 0.0000, 0.0000, 180.0000);
    CreateObject(1256, 3939.679688, -148.153275, 4.005810, 0.0000, 0.0000, 270.0000);
    CreateObject(1256, 3939.491943, -155.802277, 4.007389, 0.0000, 0.0000, 90.0000);
    CreateObject(1256, 3934.826904, -152.212631, 4.046625, 0.0000, 0.0000, 0.0000);
    CreateObject(1231, 3942.444580, -152.610474, 6.098404, 0.0000, 0.0000, 270.0000);
    CreateObject(1231, 3936.405518, -152.534088, 6.104284, 0.0000, 0.0000, 270.0000);
    CreateObject(1258, 3932.124268, -172.296310, 3.942934, 0.0000, 0.0000, 0.0000);
    CreateObject(1278, 3966.793945, -135.112015, 17.768776, 0.0000, 0.0000, 0.0000);
    CreateObject(1288, 3934.310303, -172.126526, 3.878670, 0.0000, 0.0000, 0.0000);
    CreateObject(1342, 3976.743652, -154.944519, 4.531417, 0.0000, 0.0000, 0.0000);
    CreateObject(1346, 3980.098633, -170.656372, 4.820514, 0.0000, 0.0000, 0.0000);
    CreateObject(1346, 3976.032227, -170.447083, 4.854712, 0.0000, 0.0000, 0.0000);
    CreateObject(6289, 3976.761475, -143.243286, 6.087470, 0.0000, 0.0000, 90.0000);
    CreateObject(718, 3954.005371, -135.069046, 3.290113, 0.0000, 0.0000, 0.0000);
    CreateObject(718, 3926.418945, -167.120010, 3.232753, 0.0000, 0.0000, 0.0000);
    CreateObject(718, 3969.567383, -170.351578, 3.407952, 0.0000, 0.0000, 0.0000);
    CreateObject(718, 3994.627686, -169.809357, 3.172187, 0.0000, 0.0000, 0.0000);
    CreateObject(5409, 4048.895508, 85.539154, 7.342060, 0.0000, 0.0000, 0.0000);
    CreateObject(1211, 4117.265625, -5.238216, 3.575809, 0.0000, 0.0000, 0.0000);
    CreateObject(1211, 4089.825195, -12.220894, 3.344937, 0.0000, 0.0000, 0.0000);
    CreateObject(1686, 4071.805176, 83.504196, 3.019425, 0.0000, 0.0000, 0.0000);
    CreateObject(1686, 4071.626709, 86.745865, 3.019425, 0.0000, 0.0000, 0.0000);
    CreateObject(1686, 4071.656982, 90.997047, 3.019425, 0.0000, 0.0000, 0.0000);
    CreateObject(1686, 4071.747559, 93.564606, 3.019425, 0.0000, 0.0000, 0.0000);
    CreateObject(3249, 4120.947754, -154.830292, 2.858720, 0.0000, 0.0000, 270.0000);
    CreateObject(10838, 4102.920410, 113.160645, 19.123196, 0.0000, 0.0000, 270.0000);
    CreateObject(9314, 3997.440186, -139.383575, 5.083844, 0.0000, 0.0000, 90.0000);
    CreateObject(8412, 4113.860840, -154.850510, 14.047918, 0.0000, 0.0000, 0.0000);
    CreateObject(8332, 3976.451904, 87.304337, 12.176883, 0.0000, 0.0000, 90.0000);
    CreateObject(619, 3944.475098, 50.542091, 2.659104, 0.0000, 0.0000, 101.2500);
    CreateObject(619, 3968.014648, -39.030518, 2.787695, 0.0000, 0.0000, 101.2500);
    CreateObject(3467, 4059.469482, 79.682228, 3.609052, 0.0000, 0.0000, 247.5000);
    CreateObject(1267, 4121.996094, -126.680664, 17.823435, 0.0000, 0.0000, 303.7500);
    CreateObject(9189, 4123.558594, -129.669403, 23.753969, 0.0000, 0.0000, 48.4377);
    CreateObject(17513, 4011.835938, -106.214485, -5.032542, 0.0000, 0.0000, 180.0000);
    CreateObject(3819, 4023.551514, -109.643219, 3.841778, 0.0000, 0.0000, 0.0000);
    CreateObject(3819, 4023.363525, -96.424728, 3.816778, 0.0000, 0.0000, 0.0000);
    CreateObject(3819, 4016.076416, -85.212059, 3.791778, 0.0000, 0.0000, 88.2811);
    CreateObject(3819, 4004.462402, -84.642670, 3.941781, 0.0000, 0.0000, 88.2811);
    CreateObject(3819, 3991.810547, -84.556908, 2.491844, 0.0000, 0.0000, 88.2811);
    CreateObject(3819, 3979.404541, -84.451958, 1.910456, 0.0000, 0.0000, 88.2811);
    CreateObject(7307, 3960.048096, 3.759861, 37.665218, 0.0000, 0.0000, 45.0000);
    CreateObject(13667, 3942.494141, -237.323425, 28.727066, 0.0000, 6.8755, 101.2500);*/

//============================== Objetos Móveis ================================
	Delegacia = CreateObject(980,1588.4727,-1637.7144,13.4291,0.0,0.0,0.0);
    
//=============================== Pick Ups =====================================

	//Bancos
    CreatePickup(1274,1,2308.8967,-13.5281,26.7422);//Banco Interior 1
    CreatePickup(1274,1,2316.4956,-7.5782,26.7422);//Banco Interior 2
    PickupBancoE = CreatePickup(CifraoPickup,1,1765.8009,-1364.8420,15.7578); //Entrada Banco
    PickupBancoS = CreatePickup(CifraoPickup,1,2304.8335,-16.5051,26.7422);//Saida Banco
    

//==============================================================================

	new File:temp;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	temp = fopen("Veículos.RPG",io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid = strval(strtok(tmp, index));
		X = Float:floatstr(strtok(tmp, index));
		Y = Float:floatstr(strtok(tmp, index));
		Z = Float:floatstr(strtok(tmp, index));
		ang = Float:floatstr(strtok(tmp, index));
		Cor1 = strval(strtok(tmp, index));
		Cor2 = strval(strtok(tmp, index));
		cAddStaticVehicle(modelid, X, Y, Z, ang, Cor1, Cor2);
	}
	fclose(temp);
	return 1;
}

public AtualizarZonas() {

 new line1[10];
 new line2[10];
 for(new i=0; i<MAX_PLAYERS; i++) {
  if(IsPlayerConnected(i) && AtualizacoesDeZonas[i] == 1) {
   if(IsPlayerInZone(i,ZonaJogador[i])) {
   }else{
    new ZonaJogador_before;
    ZonaJogador_before = ZonaJogador[i];
    ZonaJogador[i] = -1;
    for(new j=0; j<sizeof(zones);j++) {
     if(IsPlayerInZone(i,j) && ZonaJogador[i] == -1) {
      if(ZonaJogador_before == -1) GameTextForPlayer(i,zones[j][zone_name],1000,1);
   	  else  if(strcmp(zones[j][zone_name],zones[ZonaJogador_before][zone_name],true) != 0) GameTextForPlayer(i,zones[j][zone_name],1000,1);
      ZonaJogador[i] = j;
      format(line1,10,"p%dzone",i);
      format(line2,10,"%d",j);
     }
   }
    if(ZonaJogador[i] == -1) ZonaJogador[i] = ZonaJogador_before;
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

public OnPlayerPickUpPickup(playerid, pickupid) {

	if(pickupid == PickupBancoE){
	    SetPlayerPos(playerid,2307.1677,-16.1152,26.7496);
	    SetPlayerInterior(playerid, 0);
	    SetPlayerFacingAngle(playerid, 90.0);
	    DestroyPickup(pickupid);
	    PickupBancoE = CreatePickup(CifraoPickup,2,2304.8335,-16.5051,26.7422);
	}
	
	if(pickupid == PickupBancoS){
		SetPlayerPos(playerid,1767.4991,-1364.4980,15.7578);
		SetPlayerFacingAngle(playerid, 0.0);
	    DestroyPickup(pickupid);
	    PickupBancoS = CreatePickup(CifraoPickup,2,1765.8009,-1364.8420,15.7578);
	}
	return 1;
}

public VerificadorRcon() {

	for(new i; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) && IsPlayerAdmin(i)){
			if(LogadoComRcon[i] == 0){
				new tmp[256],nome[16];
				GetPlayerName(i,nome,16);
				format(tmp,256,"%s Se logou com RCON!",nome);
				SendClientMessageToAll(COR_AZULPLUS,tmp);
				LogadoComRcon[i] = 1;
			   }
	        }
		}
	}

public OnPlayerRequestClass(playerid, classid) {

    SetPlayerColor(playerid,COR_NAO_LOGADO);
	SetPlayerPos(playerid,358.2569,-2031.0972,11.5703);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid,354.7966,-2031.1847,10.7422);
	SetPlayerCameraLookAt(playerid,358.2569,-2031.0972,11.5703);
	PlayerPlaySound(playerid,SOM_MUSICA1,2050.1995,1344.5500,13.2378);
	ApplyAnimation(playerid,"PARK","Tai_Chi_Loop",4.1,1,1,1,1,1);
    
	if(PLAYERLIST_authed[playerid] == 1){
		PLAYERLIST_authed[playerid] = 0;
	}
	return 1;
}

public Horario(playerid) {

    worldTime++;
	worldTime%=24;
	SetWorldTime(worldTime);

    for(new i=0; i<MAX_PLAYERS; i++) {

        if(worldTime==0){
	        if(IsPlayerConnected(i)){
			    if(Profissao[i] == TAXISTA) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == AGRICULTOR) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == VENDEDOR_VEICULOS || Profissao[i] == CORRETOR) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == BARMAN) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$8000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 8000);
				}
				else if(Profissao[i] == SEGURANÇA || Profissao[i] == MOTORISTA_PARTICULAR) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_MILITAR) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
                else if(Profissao[i] == ASSALTANTE) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == B.O.P.E) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
                else if(Profissao[i] == PADRE) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$2500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
				}
				else if(Profissao[i] == CAÇADOR) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == PESCADOR) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$750");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 750);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 600);
				}
				else if(Profissao[i] == TRAFICANTE) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1200");
				    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == CAMINHONEIRO) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$900");
				    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == LABNARCOTICOS) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$4000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 4000);
				}
                else if(Profissao[i] == MATADOR_DE_ALUGUEL) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$4000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 4000);
				}
				else if(Profissao[i] == JORNALISTA) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1150");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1150);
				}
                else if(Profissao[i] == HOMEM_BOMBA) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == ADVOGADO) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == PARAMEDICO) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == GM) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "[INFO ADM]: Salário depositado R$100000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 100000);
				}
                else if(Profissao[i] == FRENTISTA) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$950");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 950);
				}
				else if(Profissao[i] == TAXISTA_AEREO) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1200");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == MOTOBOY) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$1000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == ENTREGADOR_PIZZA) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$900");
					udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == HOT_DOG) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				}
                else if(Profissao[i] == PRESIDENTE) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$9000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 9000);
 				}
				else if(Profissao[i] == DELEGADO) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
			    }
				else if(Profissao[i] == S.W.A.T) {
					GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$3500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3500);
			    }
                else if(Profissao[i] == EXERCITO) {
				    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$4700");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4700);
	            }
				else if(Profissao [i] == PREFEITO) {
                    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$3080");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3080);
                }
                else if(Profissao [i] == REI_DO_CRIME) {
                    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$5000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 5000);
                }
                else if(Profissao [i] == VENDEDOR_DE_ARMAS) {
                    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$2000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
				else if(Profissao [i] == GOVERNADOR) {
                    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$4500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4500);
                }
                else if(Profissao [i] == DEPUTADO) {
                    GameTextForPlayer(i,"~r~|~g~Salario Depositado",5000,1);
					SendClientMessage(i, COR_AMARELO, "|__CONTA BANCÁRIA__|");
					SendClientMessage(i, COR_VERDE, "Seu salário foi depositadado no valor de R$2000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
                   }
			     }
			   }
		     }
		   }


public OnGameModeExit() {

    for(new i = 0; i < MAX_PLAYERS; i++) {
		for(new o = 0; o < sizeof(Objects); o++) {
			if(Player[i][view][o]) {
				Player[i][view][o] = false;
				DestroyPlayerObject(i,Player[i][objid][o]);
			}
		}
	}
	
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
		    if(PLAYERLIST_authed[i] == 1) {

				udb_setAccState(PlayerName(i),GetPlayerMoney(i));
				new Float:health;
				GetPlayerHealth(i, health);
				udb_setHealth(PlayerName(i), health);
				udb_setGasoline(PlayerName(i), Combustivel[i]);
			}
		}
	}
	for(new i=0; i<MAX_PLAYERS; i++) {
	SendClientMessage(i, COR_MOTORISTA, "Servidor Fechado.");
	}
	return 1;
}

stock SendMessageToAdmins(const str[]) {

	for(new i=0; i<MAX_PLAYERS; i++) {
    	if(IsPlayerConnected(i)) {
        	if(IsPlayerAdmin(i)) {
            	SendClientMessage(i, COR_AZULPLUS,str);
        	}
    	}
	}
}

public OnPlayerConnect(playerid) {

    for(new i = 0; i < sizeof(Objects); i++) Player[playerid][view][i] = false;

    ChecarNomeBot(playerid);
    Silenciado[playerid] = 0;
    LogadoComRcon[playerid] = 0;
	AtualizacoesDeZonas[playerid] = 0;
	ZonaJogador[playerid] = -1;
	AprendendoDirigir[playerid] = 0;

	if(ServidorTrancado == 1) {
	Kick(playerid);
	}

	new string[85],pname[24];
    GetPlayerName(playerid,pname,24);
    format(string,sizeof(string),"%s (ID: %d) Entrou no RPG Rulez.",pname,playerid);
    SendClientMessageToAll(COR_VERDE,string);

    SetPlayerMapIcon(playerid,1,384.8622,-2058.4446,10.7181, 9, 0);//Pesca
    SetPlayerMapIcon(playerid,2,1552.4463,-1674.9883,16.1953, 30, 0);//Departamento de Policia
    SetPlayerMapIcon(playerid,3,1942.3804,-1772.8921,13.6406, 55, 0);//Posto de Gasolina
    SetPlayerMapIcon(playerid,4,1003.2129,-936.8316,42.3281, 55, 0);//Posto de Gasolina
    SetPlayerMapIcon(playerid,5,2031.5909,-1407.0050,17.1941, 22, 0);//Hospital
    SetPlayerMapIcon(playerid,6,1177.7185,-1323.7767,14.0845, 22, 0);//Hospital
    SetPlayerMapIcon(playerid,7,-227.5341,-1370.2274,8.2161, 12, 0);//Fazenda
    SetPlayerMapIcon(playerid,8,2500.6445,-843.5143,93.9248, 40, 0);//Caça
    SetPlayerMapIcon(playerid,9,1765.9340,-1364.8499,15.7578, 52,0);//Banco

	SetPlayerColor(playerid,COR_NAO_LOGADO);
	Profissao[playerid] = 0;
	Log[playerid] = 0;

	GameTextForPlayer(playerid,"~b~RPG ~y~Rulez ~g~Brasil",2450,4);

	if(udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COR_AZUL, "Você já está registrado. Logue-se digitando /logar [senha]");
	return 1;
  }

    if(!udb_Exists(PlayerName(playerid))) {
    SendClientMessage(playerid, COR_AZUL, "Bem-Vindo ao RPG Rulez!");
	SendClientMessage(playerid, COR_AZUL, "Você é novo aqui, digite /tutorial");
	SendClientMessage(playerid, COR_AZUL, "Profissões estão disponíveis em /empregos");
	SendClientMessage(playerid, COR_AZUL,"Para ver os comandos use /ajuda");
	SendClientMessage(playerid, COR_AMARELO, "Boa Diversão!");
	SendClientMessage(playerid, COR_AMARELO, " ");
	SendClientMessage(playerid, COR_VERMELHO, "Você não está registrado, por favor registre-se digitando /registrar [senha]");
	return 1;
  }

	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	return 0;
  }

stock ChecarNomeBot(playerid) {

 	new string[256];
	GetPlayerName(playerid, Nome, sizeof(Nome));
	GetPlayerIp(playerid, playerip, sizeof(playerip));
	for(new names = 0; names < MAX_BANBOTS; names++) {
	    if(strcmp(Nome, BotBan[names], true) == 0) {
		    SendClientMessage(playerid, COR_VERMELHO, "Você foi banido. Motivo: Infiltração de BOT's!");
		    format(string, sizeof(string), "IP  %d  banido por tentar colocar BOT's no servidor.",playerip);
		    SendClientMessageToAll(COR_VERMELHO, string);
			Ban(playerid);
		}
	}
}

stock ChecarNome(string1[],string2[]) {

	new NomeJogador;
	if(!strlen(string1) || !strlen(string2))
	   return 0;
	for(new c; c < strlen(string1); c++) {
    	if(!strcmp(string1[c],string2[c],false)) NomeJogador=1;
		else{
		    NomeJogador = 0;
		    break;
		}
	}
	if(NomeJogador==0)
	 return 0;
	else return 1;
}

public TecladoNumerico(const string[]) {

	for (new i = 0, j = strlen(string); i < j; i++) {
	    if (string[i] > '9' || string[i] < '0') return 0;
	}
	return 1;
}

public OnPlayerDisconnect(playerid,reason) {

        for(new i = 0; i < sizeof(Objects); i++) {
		if(Player[playerid][view][i]) {
			Player[playerid][view][i] = false;
			DestroyPlayerObject(playerid,Player[playerid][objid][i]);
		}
	}
		AtualizacoesDeZonas[playerid] = 0;
	    ZonaJogador[playerid] = -1;
	    Silenciado[playerid] = 0;
	    
        new string[85],pname[24];
        switch (reason) {

        case 0: {
        GetPlayerName(playerid,pname,24);
        format(string,sizeof(string), "%s (ID: %d) Se desconectou do RPG Rulez (Perda de Conexão)",pname,playerid);
        SendClientMessageToAll(COR_VERMELHO2, string);
        printf("%s (ID: %d) Se desconectou do RPG Rulez (Perda de Conexao)",PlayerName(playerid),playerid);
        }

        case 1: {
        GetPlayerName(playerid,pname,24);
        format(string,sizeof(string), "%s (ID: %d) Se desconectou do RPG Rulez (Vontade Própria)",pname,playerid);
        SendClientMessageToAll(COR_VERMELHO2, string);
        printf("%s (ID: %d) Se desconectou do RPG Rulez (Vontade Propria)",PlayerName(playerid),playerid);
        }

        case 2: {
        GetPlayerName(playerid,pname,24);
        format(string,sizeof(string), "%s (ID: %d) Se desconectou do RPG Rulez (Kick/Ban)",pname,playerid);
        SendClientMessageToAll(COR_VERMELHO, string);
        printf("%s (ID: %d) Se desconectou do RPG Rulez (Kick/Ban)",PlayerName(playerid),playerid);
        }
      }
        if(PLAYERLIST_authed[playerid] == 1) {

		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		new Float:health;
		Presos[playerid] = 0;
		Procurados[playerid] = 0;
		GetPlayerHealth(playerid, health);
		udb_setHealth(PlayerName(playerid), health);
		udb_setGasoline(PlayerName(playerid), Combustivel[playerid]);
		PLAYERLIST_authed[playerid] = 0;
	    }else{
        printf("%s (ID: %d) Se desconectou do RPG Rulez (Sem Registrar/Logar)",PlayerName(playerid),playerid);
        return 0;
      }
      return 1;
    }

public TempoObjetos() {

	for(new i = 0; i < MAX_PLAYERS; i++)
		if(IsPlayerConnected(i))
		    PlayerObjectUpdate(i);
}

public VerificarProfissao(playerid) {

	if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COR_DESEMPREGADO);
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COR_TAXISTA);
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == VENDEDOR_VEICULOS) {
		SetPlayerColor(playerid, COR_VENDEDOR_VEICULOS);
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COR_CORRETOR);
		GivePlayerWeapon(playerid,15,0);
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COR_ASSASSINO);
		GivePlayerWeapon(playerid,4,0);
		GivePlayerWeapon(playerid,24,350);
		GivePlayerWeapon(playerid,26,400);
		GivePlayerWeapon(playerid,18,5);
		GivePlayerWeapon(playerid,29,900);
	}
    else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COR_BARMAN);
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == S.W.A.T) {
		SetPlayerColor(playerid, COR_S.W.A.T);
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == FRENTISTA) {
		SetPlayerColor(playerid, COR_FRENTISTA);
		GivePlayerWeapon(playerid,2,0);
		GivePlayerWeapon(playerid,22,500);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
		SetPlayerColor(playerid, COR_VENDEDOR_DE_ARMAS);
		GivePlayerWeapon(playerid,31,5000);
		GivePlayerWeapon(playerid,34,5000);
		GivePlayerWeapon(playerid,29,5000);
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COR_JUIZ);
		GivePlayerWeapon(playerid,15,0);
		GivePlayerWeapon(playerid,22,300);
	}
	else if(Profissao[playerid] == PADRE) {
		SetPlayerColor(playerid, COR_PADRE);
	}
    else if(Profissao[playerid] == ASSALTANTE) {
		SetPlayerColor(playerid, COR_ASSALTANTE);
        GivePlayerWeapon(playerid,5,0);
	    GivePlayerWeapon(playerid,22,100);
	    GivePlayerWeapon(playerid,30,1000);
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COR_SEGURANÇA);
		GivePlayerWeapon(playerid,24,400);
		GivePlayerWeapon(playerid,26,700);
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COR_MOTORISTA);
		GivePlayerWeapon(playerid,41,900);
	}

	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COR_COP_RODOVIARIO);
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,24,500);
		GivePlayerWeapon(playerid,25,100);
	}
	else if(Profissao[playerid] == B.O.P.E) {
		SetPlayerColor(playerid, COR_B.O.P.E);
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == HOMEM_BOMBA) {
		SetPlayerColor(playerid, COR_HOMEM_BOMBA);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == REI_DO_CRIME) {
		SetPlayerColor(playerid, COR_REI_DO_CRIME);
		GivePlayerWeapon(playerid,16,1000);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,1000);
		GivePlayerWeapon(playerid,29,1000);
		GivePlayerWeapon(playerid,12,1000);
	}
    else if(Profissao[playerid] == CAÇADOR) {
	    SetPlayerColor(playerid, COR_CAÇADOR);
	    GivePlayerWeapon(playerid,33,100);
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COR_PESCADOR);
		GivePlayerWeapon(playerid,14,0);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COR_INSTRUTOR);
		GivePlayerWeapon(playerid,14,0);
	}
	else if(Profissao[playerid] == TRAFICANTE) {
	    SetPlayerColor(playerid, COR_TRAFICANTE);
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COR_MOTORISTA_ONIBUS);
		GivePlayerWeapon(playerid,42,400);
	}
	else if(Profissao[playerid] == LABNARCOTICOS) {
	    SetPlayerColor(playerid, COR_LABNARCOTICOS);
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	}
	else if(Profissao[playerid] == CAMINHONEIRO) {
	    SetPlayerColor(playerid,COR_CAMINHONEIRO);
	    GivePlayerWeapon(playerid,23,355);
	}
	else if(Profissao[playerid] == JORNALISTA) {
	    SetPlayerColor(playerid,COR_JORNALISTA);
	}
	else if(Profissao[playerid] == I.B.A.M.A) {
	    SetPlayerColor(playerid,COR_I.B.A.M.A);
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	    GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == COP_MILITAR) {
        SetPlayerColor(playerid,COR_COP_MILITAR);
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	    GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == PARAMEDICO) {
	    SetPlayerColor(playerid,COR_BRANCO);
	    GivePlayerWeapon(playerid,23,355);
	}
    else if(Profissao[playerid] == MATADOR_DE_ALUGUEL) {
	    SetPlayerColor(playerid,COR_MATADOR_DE_ALUGUEL);
	    GivePlayerWeapon(playerid,31,99999);
	    GivePlayerWeapon(playerid,30,99999);
	    GivePlayerWeapon(playerid,26,99999);
	}
	else if(Profissao[playerid] == ADVOGADO) {
	    SetPlayerColor(playerid,COR_ADVOGADO);
	    GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == MOTOBOY) {
		SetPlayerColor(playerid, COR_MOTOBOY);
		GivePlayerWeapon(playerid,5,600);
		GivePlayerWeapon(playerid,42,600);

	}
	else if(Profissao[playerid] == TAXISTA_AEREO) {
		SetPlayerColor(playerid, COR_TAXI_AEREO);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
		SetPlayerColor(playerid, COR_ENTREGADOR_PIZZA);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == HOT_DOG) {
		SetPlayerColor(playerid, COR_HOT_DOG);
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,500);
	}
    else if(Profissao[playerid] == PRESIDENTE) {
        SetPlayerColor(playerid, COR_PRESIDENTE);
        GivePlayerWeapon(playerid,35,99999 );
        GivePlayerWeapon(playerid,31,99999);
        GivePlayerWeapon(playerid,4,0);
        GivePlayerWeapon(playerid,16,99999);
    }
   	else if(Profissao[playerid] == 	PREFEITO) {
        SetPlayerColor(playerid, COR_PREFEITO);
        GivePlayerWeapon(playerid,28,99999 );
        GivePlayerWeapon(playerid,30,99999);
        GivePlayerWeapon(playerid,30,100);
        GivePlayerWeapon(playerid,46,99999);
    }
    else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COR_AGRICULTOR);
		GivePlayerWeapon(playerid,4,1);
		GivePlayerWeapon(playerid,33, 99999);
		GivePlayerWeapon(playerid,24, 99999);
	}
    else if(Profissao[playerid] == GOVERNADOR) {
		SetPlayerColor(playerid, COR_B.O.P.E);
	    GivePlayerWeapon(playerid,35,99999 );
        GivePlayerWeapon(playerid,31,99999);
        GivePlayerWeapon(playerid,4,0);
        GivePlayerWeapon(playerid,16,99999);
    }
    else if(Profissao[playerid] == DEPUTADO) {
		SetPlayerColor(playerid, COR_DEPUTADO);
        GivePlayerWeapon(playerid,16,99999);
    }
    else if(Profissao[playerid] == DELEGADO) {
		SetPlayerColor(playerid, COR_DELEGADO);
		GivePlayerWeapon(playerid,10,500);
		GivePlayerWeapon(playerid,23,500);
		GivePlayerWeapon(playerid,30,500);
	}
	else if(Profissao[playerid] == TUNADOR) {
		SetPlayerColor(playerid, COR_TUNADOR);
        GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	    GivePlayerWeapon(playerid,24,500);
        }
    else if(Profissao[playerid] == GM) {
		SetPlayerColor(playerid, COR_GM);
        GivePlayerWeapon(playerid,28,99999);
	    GivePlayerWeapon(playerid,31,99999);
	    GivePlayerWeapon(playerid,34,99999);
	    GivePlayerWeapon(playerid,22,99999);
		GivePlayerWeapon(playerid,8,0);
		SetPlayerArmour(playerid, 100.0);
    }
    else if(Profissao[playerid] == EXERCITO) {
		SetPlayerColor(playerid, COR_EXERCITO);
        GivePlayerWeapon(playerid,29,5000);
	    GivePlayerWeapon(playerid,30,5000);
	    GivePlayerWeapon(playerid,10,5000);
	}
    else{
	    SetPlayerColor(playerid, COR_DESEMPREGADO);
		}

return 1;
}

public OnVehicleSpawn(vehicleid) {
	TunarVeiculo(vehicleid);
    return 1;
  }

public OnPlayerSpawn(playerid) {
	
	SetPlayerInterior(playerid, 0);
	PlayerObjectUpdate(playerid);
	PlayerPlaySound(playerid,SOM_DESLIGADO,2418.3506,1123.9360,10.8203);
	AtualizacoesDeZonas[playerid] = 1;
	ZonaJogador[playerid] = -1;
	
	if(!AtualizacaoZona) AtualizacaoZona = SetTimer("AtualizarZonas",1000,4);
	VerificarProfissao(playerid);
	CarregarJogador(playerid);
	PrecoCorrida[playerid] = 0;
}

public OnPlayerRequestSpawn(playerid) {

	if(!PLAYERLIST_authed[playerid])
	SendClientMessage(playerid, COR_VERMELHO,"/registrar [Senha] ou /logar [Sua senha]");
    //else LogarJogador(playerid);
    return 0;
}

public OnPlayerDeath(playerid, killerid, reason) {

	AtualizacoesDeZonas[playerid] = 0;
	ZonaJogador[playerid] = -1;
	new string[256];
	new Morte = random(5);
	GameTextForPlayer(playerid,"~r~Morto",4000,0);
	SendDeathMessage(killerid,playerid,reason);
	
	if(Morte == 0) {
	SendClientMessage(playerid, COR_VERMELHO2, "|__________ HOSPITAL _________|");
	format(string,sizeof(string),"%s morreu, vamos beber para comemorar!",PlayerName(playerid));
	SendClientMessageToAll(COR_VERMELHO,string);
	}
	else if(Morte == 1) {
	SendClientMessage(playerid, COR_VERMELHO2, "|__________ HOSPITAL _________|");
	format(string,sizeof(string),"%s achou que podia enferentar qualquer coisa, 2 minutos depois estava morto.",PlayerName(playerid));
	SendClientMessageToAll(COR_VERMELHO,string);
	}
	else if(Morte == 2) {
	SendClientMessage(playerid, COR_VERMELHO2, "|__________ HOSPITAL _________|");
	format(string,sizeof(string),"%s morreu, que sua alma descanse em paz, pois a nossa ficou depois de sua morte.",PlayerName(playerid));
	SendClientMessageToAll(COR_AMARELO,string);
	}
	else if(Morte == 3) {
	SendClientMessage(playerid, COR_VERMELHO2, "|__________ HOSPITAL _________|");
	format(string,sizeof(string),"%s virou defunto, nunca mais iremos ter alguem como ele (ainda bem...)",PlayerName(playerid));
	SendClientMessageToAll(COR_VERMELHO,string);
	}
	else if(Morte == 4) {
	SendClientMessage(playerid, COR_VERMELHO2, "|__________ HOSPITAL _________|");
	format(string,sizeof(string),"%s viu a luz no fim do tunel ele estava perto... mas a luz se apagou =(",PlayerName(playerid));
	SendClientMessageToAll(COR_VERMELHO,string);
	}

	if(Hospitais(playerid) == 0) {
    	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)),-2651.6501, 634.4510, 14.4531, 180.0000,0,0,0,0,0,0);
    }
    else if(Hospitais(playerid) == 1) {
    	SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1173.5842,-1324.5615,15.1953,278.4624,0,0,0,0,0,0);
    }
    else if(Hospitais(playerid) == 2) {
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),2031.9415,-1404.3578,17.2614,165.8180,0,0,0,0,0,0);
    }
    else if(Hospitais(playerid) == 3) {
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1582.5615,1768.7921,10.8203,93.7454,0,0,0,0,0,0);
    }
    
	if(Procurados[playerid] == 1){
	    Procurados[playerid] = 0;
	    Presos[playerid] = 1;
		udb_setPrisao(PlayerName(playerid), 1);
		LogarJogador(playerid);
	}
	
	if(killerid == INVALID_PLAYER_ID) {
        SendClientMessage(playerid, COR_BRANCO, " ");
        SendClientMessage(playerid,COR_AZUL,"Hospital: Você agora está bem, mas a consulta foi cobrada na quantia de R$50!");
		GivePlayerMoney(playerid, -50);

	}else{
	
		new anivel;
 	    new bnivel;
  	    anivel = GetPlayerWantedLevel(killerid);
   	    bnivel = anivel +1;
		if(GetPlayerMoney(playerid) > 0)  {
            SetPlayerWantedLevel(killerid, bnivel);
            SetPlayerWantedLevel(playerid, 0);
            Procurados[killerid] = 1;
			SendClientMessage(killerid, COR_VERMELHO2, "Seu nível de procurado foi aumentado por cometer um assasinato!!");
			format(string, sizeof(string), "Hospital: %s matou você! Tenha mais cuidado da próxima vez.",PlayerName(killerid));
			SendClientMessage(playerid, COR_VERMELHO2, string);
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
		}
 	}
    return 1;
}


public CriarVeiculo(m,Float:x,Float:y,Float:z,Float:r,c,d,e) CreateVehicle(m,x,y,z,r,c,d,e);
public AcaoEspecial(playerid,actionid) SetPlayerSpecialAction(playerid,actionid);
public DestruirObjeto(objetoid) DestroyObject(objid);
public CriarExplosao(Float:X,Float:Y,Float:Z,tipo,Float:diam) CreateExplosion(X,Y,Z,tipo,diam);


PlayerObjectUpdate(playerid) {

	new Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	for(new i = 0; i < sizeof(Objects); i++) {
	    if(!Player[playerid][view][i]) {
	        if(IsInReach(pos[0],pos[1],pos[2],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist])) {
	            Player[playerid][view][i] = true;
	            Player[playerid][objid][i] = CreatePlayerObject(playerid,Objects[i][modeloid],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][orx],Objects[i][ory],Objects[i][orz]);
	        }
	    } else if(!IsInReach(pos[0],pos[1],pos[2],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist])) {
            Player[playerid][view][i] = false;
            DestroyPlayerObject(playerid,Player[playerid][objid][i]);
	    }
	}
}

public SetarPosicaoDoJogadorComOjbetos(playerid,Float:x,Float:y,Float:z) {

	for(new i = 0; i < sizeof(Objects); i++) {
	    if(!Player[playerid][view][i]) {
	        if(IsInReach(x,y,z,Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist])) {
	            Player[playerid][view][i] = true;
	            Player[playerid][objid][i] = CreatePlayerObject(playerid,Objects[i][modeloid],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][orx],Objects[i][ory],Objects[i][orz]);
	        }
	    }else if(!IsInReach(x,y,z,Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist])) {
            Player[playerid][view][i] = false;
            DestroyPlayerObject(playerid,Player[playerid][objid][i]);
	    }
	}
	SetPlayerPos(playerid,Float:x,Float:y,Float:z);
}

public OnPlayerCommandText(playerid, cmdtext[]) {

	new cmd[256];
	new giveplayerid,idx;
    new giveplayer[MAX_PLAYER_NAME];
    new sendername[MAX_PLAYER_NAME];
    new dinheirojogador;
    new quantiadinheiro;

    cmd = strtok(cmdtext, idx);
    
	if(strcmp(cmd, "/piracemaon",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COR_VERMELHO,"Já é época de piracema!");
	            return 1;
	        }else{
	            SendClientMessageToAll(COR_VERMELHO,"Época de piracema, quem for pego pescando será preso.");
	            SendClientMessage(playerid,COR_VERDE,"Feito.");
	            Piracema = 1;
	            return 1;
	        }
	    }else{
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
	    }
	}
	
	if(strcmp(cmd,"/piracemaoff",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COR_VERMELHO,"A piracema não está ativada!");
			    return 1;
			}else{
			    SendClientMessageToAll(COR_VERDE,"Época de piracema acabou... Pode Pescar Avontade!");
			    SendClientMessage(playerid,COR_BRANCO,"Feito.");
			    Piracema = 0;
			    return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
		    return 1;
		}
	}
	
	if(strcmp(cmd, "/destruirveiculo",true)==0 && IsPlayerInAnyVehicle(playerid)){
       if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
	    DestroyVehicle(GetPlayerVehicleID(playerid));
	    SendClientMessage(playerid, COR_VERDE,"Veículo destruido com sucesso!");
	    return 1;
		}
	}

    if(strcmp(cmd, "/mododeus", true) == 0){
        if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
	       SetPlayerHealth(playerid, 9999999999);
	       SendClientMessage(playerid, COR_VERDE, "Você está em modo Deus.");
	       return 1;
	   }
	}

    if(strcmp(cmd, "/mododeus", true) == 0){
        if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
	       SetPlayerHealth(playerid, 100);
	       SendClientMessage(playerid, COR_VERDE, "Você não está mais em modo Deus.");
	       return 1;
	   }
	}
	
	if (strcmp(cmd, "/colete", true) == 0){
         if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
	        SetPlayerArmour(playerid, 100);
            return 1;
        }
    }

    if(strcmp(cmd,"/adg", true)==0){
         if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
        MoveObject(Delegacia,1584.28,-1638.1670,14.8792,5);
        SendClientMessage(playerid,COR_COP_MILITAR, "Garagem da delegacia: Aberta!");
        return 1;
    		}
       }
       
    if(strcmp(cmd,"/fdg", true)==0){
         if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
        MoveObject(Delegacia,1588.4727,-1637.7144,13.4291,5);
        SendClientMessage(playerid,COR_COP_MILITAR, "Garagem da delegacia: Fechada!");
        return 1;
    		}
       }

    if(strcmp(cmd, "/pintar", true) == 0) {
        if(Profissao[playerid] == TUNADOR || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
        new tmp[256];
        new cor1,cor2;
        new veiculo;
        tmp = strtok(cmdtext,idx);
        cor1 = strval(tmp);
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp)) {
        SendClientMessage(playerid, COR_VERMELHO, "/pintar [Cor1] [Cor2]");
        return 1;
      }
        cor2 = strval(tmp);
        veiculo = GetPlayerVehicleID(playerid);
        if(IsPlayerInVehicle(playerid,veiculo)){
        ChangeVehicleColor(veiculo,cor1,cor2);
        SendClientMessage(playerid,COR_VERDE,"Veiculo Pintado com sucesso.");
        return 1;
      }
    }
  }

    if(strcmp(cmd, "/assaltarbanco", true) == 0) {
	    if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)) {
        	if(AreaBanco[playerid] == 1){
				if(TempoAssalto[playerid] == 0) {
        		    GivePlayerMoney(playerid, 1000);
					SendClientMessage(playerid, COR_ASSALTANTE, "Banco roubado, você conseguiu R$1000!");
     				TempoAssalto[playerid]++;
 					SetTimerEx("Assalto",600000,false,"%d",playerid);
					return 1;
				}else{
					SendClientMessage(playerid, COR_VERMELHO,"Você acaba de assaltar um banco e não está feliz? espere 10 minutos.");
					return 1;
				}
				}else{
			    SendClientMessage(playerid, COR_VERMELHO,"Você não está em um banco!");
			    return 1;
			}
		}else{
	    	SendClientMessage(playerid, COR_VERMELHO2, "Você não é assaltante!");
			return 1;
		}
	}

    if(strcmp(cmd, "/jetpack", true) == 0) {
	   if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
       if(!IsPlayerInAnyVehicle(playerid)) {
       SetPlayerSpecialAction(playerid, 2);
       }else{
       SendClientMessage(playerid, COR_VERMELHO, "Você não pode usar um jetpack dentro de um veículo!");
      }
      return 1;
    }
  }

    if(strcmp(cmd, "/silenciar", true) == 0) {
       new ID;
       new tmp[256];
       new string[256];
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
		
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) return SendClientMessage(playerid, COR_VERMELHO, "/silenciar [ID]");
			ID = strval(tmp);

			Silenciado[ID] = 1;

			format(string, sizeof(string), "Você silenciou %s (ID: %d)",PlayerName(ID),ID);
			SendClientMessage(playerid, COR_AMARELO, string);

			SendClientMessage(ID, COR_VERMELHO, "Um admin silenciou você (não pode falar no chat)");
		}
		else return SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		return 1;
	}

    if(strcmp(cmd, "/desmutar", true) == 0) {
		new ID;
		new tmp[256];
        new string[256];
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
		
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) return SendClientMessage(playerid, COR_VERMELHO, "/desmutar [ID]");
			ID = strval(tmp);

			Silenciado[ID] = 0;

			format(string, sizeof(string),"Você desmutou %s (ID: %d)",PlayerName(ID),ID);
			SendClientMessage(playerid, COR_AMARELO, string);

			SendClientMessage(ID, COR_AMARELO, "Você foi desmutado (pode falar agora no chat).");
			
		}
		else return SendClientMessage(playerid, COR_VERMELHO, "Você não é tem permissão.");
		return 1;
	}
         
    if(strcmp(cmd,"/plantarbomba",true) == 0){
       new dinid,Float:x,Float:y,Float:z;
	   if (IsPlayerAdmin(playerid) || Profissao[playerid] == HOMEM_BOMBA || Profissao[playerid] == GM){
       if(IsPlayerInAnyVehicle(playerid)){
           SendClientMessage(playerid,COR_VERMELHO,"Não é possível plantar uma bomba dentro de um veículo!");
           return 1;
         }
       GetPlayerPos(playerid,x,y,z);
       ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0,0,0,0,0,0);
       SetTimerEx("CriarExplosao",8000,false,"fffdf",x,y,z,2,200.0);
       dinid = CreateObject(1654,x,y,z-0.8,0,0,0);
       SetTimerEx("DestruirObjeto",8000,false,"d",dinid);
       SendClientMessage(playerid,COR_AMARELO,"Bomba: Plantada, saia de perto ou irá morrer.");
       return 1;
       }
   }
   
	if(strcmp(cmd, "/setarskin", true) == 0) {
		if(Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
			new ID, Skin;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/setarskin [ID jogador] [ID Skin]");
				return 1;
			}
		    ID = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setarskin [ID jogador] [ID Skin]");
				return 1;
			}
			Skin = strval(tmp);
			if(Skin==3 || Skin==4 || Skin==5 || Skin==6 || Skin==8 || Skin==42 || Skin==65 || Skin==74 || Skin==86 || Skin==119 || Skin==149 || Skin==208 || Skin==273 || Skin==274 || Skin==289 || Skin>=300 || Skin>=51313531){
				SendClientMessage(playerid, COR_VERMELHO, "Skin ID Inválido!");
				return 1;
			}
			if(IsPlayerConnected(ID)){
			    udb_setSkin(PlayerName(ID), Skin);
				SendClientMessage(playerid, COR_VERDE, "A skin foi setada com sucesso!");
				SendClientMessage(ID, COR_VERDE, "Você acaba de receber uma nova skin!");
	            format(string, sizeof(string), "Agora você usa skin ID: %d", Skin);
	            SendClientMessage(ID, COR_VERDE, string);
				SetPlayerSkin(ID, Skin);
				return 1;
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}

	if(strcmp(cmd,"/temporadacacaoff",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        if(TemporadaCaca == 1){
	            SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça já está desativada!");
	            return 1;
	        }else{
	            SendClientMessageToAll(COR_VERMELHO,"Temporada de caça desativada, quem for pego caçando será preso.");
	            SendClientMessage(playerid,COR_BRANCO,"Feito.");
	            TemporadaCaca = 0;
	            return 1;
	        }
	    }else{
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
	    }
	}

	if(strcmp(cmd, "/flip",true) == 0) {
	   new Float:X, Float:Y, Float:Z;
       if(IsPlayerInAnyVehicle(playerid))
          SetCameraBehindPlayer(playerid);
          GetPlayerPos(playerid, X, Y, Z);
          SetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
          SetVehicleZAngle(GetPlayerVehicleID(playerid), 0);
          return 1;
       }
	
	if(strcmp(cmd,"/temporadacacaon",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A ||  Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        if(TemporadaCaca == 0){
	            SendClientMessage(playerid,COR_VERMELHO,"Já estamos em temporada de caça!");
		    	return 1;
			}else{
			    SendClientMessageToAll(COR_VERDE,"Temporada de caça começou... Pode caçar à vontade!");
			    SendClientMessage(playerid,COR_BRANCO,"Feito.");
			    TemporadaCaca = 1;
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/plantarsoja", true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	        if(AreaFazenda[playerid] == 0){
	            SendClientMessage(playerid, COR_VERMELHO, "Você não está na área da fazenda, vá até o C rosa no mapa.");
				return 1;
			}else{
			    if(FazendaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COR_VERMELHO, "Espere um pouco, a soja ainda não está pronta para ser colhida.");
					return 1;
				}else{
					SendClientMessage(playerid, COR_VERDE, "Soja plantada!");
                    SendClientMessage(playerid, COR_VERDE, "Agora espere terminar de crescer (10 minutos).");
			    	FazendaInProgress[playerid] = 1;
			    	SetTimer("Fazenda",360000,false);
					return 1;
				}
            }
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
			return 1;
		}

	}
	
	if(strcmp(cmd,"/vendersoja",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não está na Fazenda.");
	            return 1;
			} else {
			    if(QtSoja[playerid] == 0){
			        SendClientMessage(playerid, COR_VERMELHO, "Você não plantou soja, use /plantarsoja para isto.");
					return 1;
     			}else{
					new string[256];
					new quantia;
					quantia = QtSoja[playerid]*400;
					format(string, sizeof(string),"Você vendeu %d saco(s) de Soja por R$400 cada um e faturou R$%d com a venda.",QtSoja[playerid],quantia);
					SendClientMessage(playerid,COR_AGRICULTOR,string);
					GivePlayerMoney(playerid,quantia);
					QtSoja[playerid] = 0;
					return 1;
   			    }

			}

		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
			return 1;
         }
	  }
	
	if(strcmp(cmd,"/prenderpesca",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A ||  Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COR_VERMELHO,"/prenderpesca [ID]");
		    	return 1;
			}
			ID = strlen(tmp);
			if(IsPlayerConnected(ID) && PLAYERLIST_authed[ID] == 1){
			    if(Piracema == 0){
			        SendClientMessage(playerid,COR_VERMELHO,"A piracema não está ativada para você efetuar a prisão!");
			    	return 1;
				} else {
				    if(PescaInProgress[ID] == 0){
				        SendClientMessage(playerid,COR_VERMELHO,"O jogador não está pescando!");
				    	return 1;
					} else {
					    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
					        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para efetuar a prisão!");
					    	return 1;
						} else {
						    udb_setPrisao(PlayerName(ID),1);
						    LogarJogador(ID);
					    	return 1;
						}
					}
				}
			}else{
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso");
	    	return 1;
		}
	}
	
	if(strcmp(cmd,"/godcoff", true) == 0) {
         if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
	        if(IsPlayerInAnyVehicle(playerid)) {
            SetVehicleHealth(GetPlayerVehicleID(playerid),1000);
            SendClientMessage(playerid, COR_VERDE, "Seu carro não está mais em modo deus");
        }else{
            SendClientMessage(playerid,COR_VERMELHO,"Você não está em um veiculo!");
            }
            return 1;
         }
	  }
	  
    if(strcmp(cmd, "/godc", true) == 0){
         if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
	        if(IsPlayerInAnyVehicle(playerid)) {
            SetVehicleHealth(GetPlayerVehicleID(playerid),999999);
            SendClientMessage(playerid, COR_VERDE, "Seu carro está em modo deus");
            }else{
            SendClientMessage(playerid,COR_VERMELHO,"Você não está em um veiculo!");
            }
            return 1;
         }
	  }
	  
    if(strcmp(cmd,"/prendercaca",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A ||  Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COR_VERMELHO,"/prenderpesca [id]");
		    	return 1;
			}
			ID = strlen(tmp);
			if(IsPlayerConnected(ID) && PLAYERLIST_authed[ID] == 1){
			    if(TemporadaCaca == 1){
			        SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça está ativada, por isso você não pode prendê-lo!");
			    	return 1;
				} else {
				    if(CacaInProgress[ID] == 0){
				        SendClientMessage(playerid,COR_VERMELHO,"O jogador não está caçando!");
				    	return 1;
					} else {
					    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
					        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para efetuar a prisão!");
					    	return 1;
						} else {
						    udb_setPrisao(PlayerName(ID),1);
						    LogarJogador(ID);
					    	return 1;
						}
					}
				}
			}else{
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/telepizza", true)==0){
	    SendClientMessage(playerid,COR_AMARELO,"Entregadores de Pizza foram informaos.");
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Profissao[i] == ENTREGADOR_PIZZA || IsPlayerAdmin(i) || Profissao[i] == GM){
	            new string[256];
	            format(string,sizeof(string),"O jogador %s solicita uma pizza.",PlayerName(playerid));
	            SendClientMessage(i,COR_ENTREGADOR_PIZZA,string);
		     	return 1;
			}
	    	return 1;
		}
    	return 1;
	}
	
    if(strcmp(cmd, "/acoes", true) == 0) {
	    SendClientMessage(playerid, COR_AMARELO, "|________________Animações do RPG Rulez _________________|");
		SendClientMessage(playerid, COR_AZUL, "/conversar  /rir  /sentar  /beijar  /render  /vomitar  /punheta  /mijar");
		SendClientMessage(playerid, COR_AZUL, "/taichi /fumar  /fumar2 /fumar3   /dormir  /apontar  /dançar [1 à 4]");
		SendClientMessage(playerid, COR_AZUL, "/acenar  /deitar  /bebado  /cruzarbraços  /noiado  /vaisifude /creu /comer");
		return 1;
	 }
	 
	if(strcmp(cmd, "/creu", true) == 0) {
		 ApplyAnimation(playerid,"CHOPPA","CHOPPA_back",4.1,1,1,1,1,1);
         return 1;
    }
    if(strcmp(cmd, "/vaisifude", true) == 0) {
		 ApplyAnimation(playerid,"PED","fucku",4.0,0,0,0,0,0);
         return 1;
    }
	if (strcmp("/noiado", cmd, true, 6) == 0) {
          ApplyAnimation(playerid, "CRACK", "crckdeth2",4.0,1,0,0,0,0);
		  return 1;
	}
    if (strcmp("/cruzarbraços", cmd, true) == 0) {
          ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0,0,1,1,1,-1);
		  return 1;
	}
    if(strcmp(cmd, "/bebado", true) == 0) {
		ApplyAnimation(playerid,"PED","WALK_DRUNK",4.1,1,1,1,1,1);
		return 1;
    }
    if(strcmp(cmd, "/deitar", true) == 0) {
		     ApplyAnimation(playerid, "BEACH", "bather",4.0,1,0,0,0,0);
             return 1;
    	   }
	if(strcmp(cmd, "/acenar", true) == 0) {
		     ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop",4.1,1,1,1,1,1);
             return 1;
    	   }
	if(strcmp(cmd, "/render", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		     SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
             return 1;
    	   }}
    if(strcmp(cmd, "/handsup", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
  	  		return 1;
		  }}
	if(strcmp(cmd, "/renderse", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
  	  		return 1;
		}
	}
	if(strcmp(cmd, "/taichi", true) == 0) {
		ApplyAnimation(playerid,"PARK","Tai_Chi_Loop",4.1,0,1,1,1,1);
		return 1;
    	}

	if(strcmp(cmd, "/dormir", true) == 0) {
		ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R",4.1,0,1,1,1,1);
		return 1;
    	}

	if(strcmp(cmd, "/apontar", true) == 0) {
		ApplyAnimation(playerid,"PED","gang_gunstand",4.1,0,1,1,1,1);
		return 1;
    	}
    if (strcmp(cmd,"/mijar", true) == 0) {
          ApplyAnimation(playerid, "PAULNMAC","Piss_in",3.0,0,0,0,0,0);
          SendClientMessage(playerid, COR_VERDE, "Ahhhhhh que alívio finalmente tirando a água do joelho...");
		  return 1;
	}
	if (strcmp(cmd,"/punheta", true) == 0) {
          ApplyAnimation(playerid, "PAULNMAC", "wank_in",4.1,0,1,1,1,1);
          SendClientMessage(playerid, COR_VERMELHO, "Velocidade 1, próxima velocidade /punheta2");
		  return 1;
	}
	if (strcmp(cmd,"/punheta2", true) == 0) {
          ApplyAnimation(playerid,"PAULNMAC","wank_loop",4.1,1,1,1,1,1);
          SendClientMessage(playerid, COR_AMARELO, "Velocidade 2, próxima velocidade /punheta3");
		  return 1;
	}
	if (strcmp(cmd,"/punheta3", true) == 0) {
          ApplyAnimation(playerid,"PAULNMAC","wank_out",4.1,0,1,1,1,1);
          SendClientMessage(playerid, COR_VERDE, "Velocidade máxima!!");
		  return 1;
	}
	if (strcmp("/fumar3", cmd, true, 4) == 0) {
          ApplyAnimation(playerid,"SMOKING","M_smk_in",4.1,0,1,1,1,1);
		  return 1;
    }
   	if (strcmp("/fumar2", cmd, true, 4) == 0) {
          ApplyAnimation(playerid,"SMOKING", "M_smklean_loop",10.0,0,0,0,0,0);
		  return 1;
 		  }
	if (strcmp("/vomitar", cmd, true) == 0) {
		      ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0,0,0,0,0,0);
			  return 1;
		}
    if (strcmp("/comer", cmd, true) == 0) {
	      ApplyAnimation(playerid, "FOOD", "EAT_Burger",3.0,0,0,0,0,0);
		  return 1;
	}
 	if(strcmp(cmd, "/dançar", true) == 0) {
		    new tmp[256];
			new jeitodanca;
      		tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid,COR_VERMELHO,"/dançar [Estilos 1 à 4]");
				return 1;
			}
			jeitodanca = strval(tmp);
			if(jeitodanca < 1 || jeitodanca > 4) {
				SendClientMessage(playerid,COR_VERMELHO,"/dançar [Estilos 1 à 4]");
			    return 1;
			}
			if(jeitodanca == 1) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
			    SendClientMessage(playerid, COR_AMARELO, "Estilo: Hip-Hop");
			} else if(jeitodanca == 2) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
			    SendClientMessage(playerid, COR_AMARELO, "Estilo: Pop");
			} else if(jeitodanca == 3) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
			} else if(jeitodanca == 4) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
			    SendClientMessage(playerid, COR_AMARELO, "Estilo: Michael Jackson");
			}
 	  		return 1;
	}
	if(strcmp(cmd, "/conversar", true) == 0){
          if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
          ApplyAnimation(playerid,"PED","IDLE_CHAT",10.1,1,1,1,1,1);
          return 1;
	      }
		  }
    if (strcmp("/sentar", cmd, true) == 0) {
          ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 10.0, 1, 1, 0, 0, 0); 
		  return 1;
    	  }
    if (strcmp("/rir", cmd, true) == 0) {
          ApplyAnimation(playerid, "RAPPING", "Laugh_01",4.1,1,1,1,1,1); //10.0,0,0,0,0,0
		  return 1;
		  }
	if (strcmp("/beijar", cmd, true) == 0) {
          ApplyAnimation(playerid, "KISSING", "Grlfrd_Kiss_01", 10.0, 0, 0, 0, 0, 0);
		  return 1;
		  }
	if (strcmp("/fumar", cmd, true) == 0) {
          ApplyAnimation(playerid, "SMOKING", "F_smklean_loop", 10.1,1,1,1,1,1);
		  return 1;
		  }

    if(strcmp(cmd, "/admins", true) == 0 || strcmp(cmd, "/administradores", true) == 0 || strcmp(cmd, "/adms", true) == 0){
        new Administrador[24];
        new contadoradm = 0;
        new string[256];
        SendClientMessage(playerid, COR_VERDE, "|___________ Administradores Online ___________|");
        for(new i=0; i<MAX_PLAYERS; i++){
        if(IsPlayerConnected(i) && IsPlayerAdmin(i)){
        GetPlayerName(i,Administrador,24);
        format(string,sizeof(string),"Administrador: %s  ID: %d", Administrador, i);
        SendClientMessage(playerid, COR_AZULPLUS, string);
        contadoradm++;
      }
   }
        if(contadoradm == 0) {
        SendClientMessage(playerid, COR_VERMELHO, "Desculpe. Não há administradores online no momento!");
        }
        return 1;
     }
  
    if(strcmp(cmd, "/entregarpizza", true) == 0) {
	    if(Profissao[playerid] == ENTREGADOR_PIZZA || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/entregarpizza [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)) {
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			}else{
			
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40){
			    	SendClientMessage(playerid,COR_ENTREGADOR_PIZZA,"Pizza entregue.");
				    format(string, sizeof(string), "%s Diz: Ai caramba!! que pizza gostosa valeu a pena os R$10,00 que paguei...", PlayerName(ID));
			     	SendClientMessage(ID, COR_CINZA, string);
	                ApplyAnimation(ID, "FOOD","EAT_Burger", 3.0,0,0,0,0,0);
				    GivePlayerMoney(playerid,10);
				    GivePlayerMoney(ID,-10);
				    SetPlayerHealth(ID,100);
			    	return 1;
				}else{
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para entregar a pizza!");
			    	return 1;
				}
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas entregadores de pizza podem fazer isto!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/advogado", true) == 0) {
 		SendClientMessage(playerid, COR_ADVOGADO, "Os advogados foram informados.");
 		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		 for(new i=0; i<MAX_PLAYERS; i++) {
			 if(IsPlayerConnected(i) && Profissao[i] == ADVOGADO || IsPlayerAdmin(i)) {
                new string[256];
				format(string,sizeof(string), "%s solicita um advogado.", PlayerName(playerid));
				SendClientMessage(i, COR_AMARELO, string);
				return 1;
			}
		}
	}

    if(strcmp(cmd, "/processo", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == ADVOGADO ||Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new ID;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/processo [ID]");
				return 1;
		    	}

  	        ID = strval(tmp);
  	        SendClientMessage(playerid,COR_BRANCO, "|___________________ ADVOGADO _________________|");
  	        format(string, sizeof(string), "Você entrou com uma petição em defesa do réu %s", PlayerName(ID));
			SendClientMessage(playerid, COR_AZUL, string);
            SendClientMessage(playerid, COR_AZUL, "O processo foi enviado à um juiz (Veja se realmente há juiz online).");
            SendClientMessage(playerid, COR_BRANCO, "|_____________________________________________|");
            SendClientMessage(ID, COR_BRANCO, "|________________ ADVOGADO _______________|");
			format(string, sizeof(string), "O advogado %s aceitou seu caso e irá lhe defender.",PlayerName(playerid));
			SendClientMessage(ID, COR_AMARELO, string);
			SendClientMessage(ID, COR_BRANCO, "|_________________________________________|");
            for(new i=0; i<MAX_PLAYERS; i++) {
		        if(Profissao[i] == JUIZ || IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
			format(string, sizeof(string), "O juiz %s entrou com um petição em defesa do réu %s", PlayerName(playerid), PlayerName(ID));
			SendClientMessage(i, COR_JUIZ, string);
			return 1;
		}
		return 1;
	  }
   }
}

	if(strcmp(cmd,"/verpesca",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new ID;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/verpesca [ID]");
		    	return 1;
			}
			ID = strlen(tmp);
   			if(IsPlayerConnected(ID) && PLAYERLIST_authed[ID] == 1){
   			    if(PescaInProgress[ID] == 0){
   			        SendClientMessage(playerid,COR_VERDE,"O jogador não está pescando");
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERDE,"O jogador está pescando");
			    	return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd,"/vercaca",true) == 0) {
	    if(Profissao[playerid] == I.B.A.M.A || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new ID;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/verpesca [ID]");
		    	return 1;
			}
			ID = strlen(tmp);
   			if(IsPlayerConnected(ID) && PLAYERLIST_authed[ID] == 1){
   			    if(CacaInProgress[ID] == 0){
   			        SendClientMessage(playerid,COR_VERDE,"O jogador não está caçando.");
			    	return 1;
				}else{
				    SendClientMessage(playerid,COR_VERDE,"O jogador está caçando.");
			    	return 1;
				}
			}else{
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/vendepesca", true) == 0 || strcmp(cmd, "/venderpesca", true) == 0) {
	    new string[256];
	    new quantia;
	    if(AreaCoopPesca[playerid] == 1){
	    	if(QtPescas[playerid] == 0){
	        	SendClientMessage(playerid, COR_VERMELHO, "Você não tem nenhuma pesca, como poderá vender?");
	        	return 1;
			} else {
		    	if(Profissao[playerid] == PESCADOR) {
		   			quantia = QtPescas[playerid]*130;
		   			GivePlayerMoney(playerid,quantia);
					format(string,sizeof(string),"Você vendeu %d pesca(s) por R$130 cada e faturou R$%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COR_VERDE, string);
					QtPescas[playerid] = 0;
					return 1;
				}else{
				    quantia = QtPescas[playerid]*100;
				    GivePlayerMoney(playerid,quantia);
				    format(string,sizeof(string),"Você vendeu %d pesca(s) por R$100 cada e faturou R$%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COR_VERDE, string);
					QtPescas[playerid] = 0;
					return 1;
				}
			}
		}else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está na Cooperativa de Pesca.");
			return 1;
		}
	}
	if(strcmp(cmd,"/vendecaca",true) == 0 || strcmp(cmd, "/vendercaca", true) == 0) {
	    if(Profissao[playerid] == CAÇADOR || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
		    if(AreaCoopCaca[playerid] == 0){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não está na Cooperativa de Caça.");
		    	return 1;
			}else{
			    if(QtCacas[playerid] == 0){
			        SendClientMessage(playerid, COR_VERMELHO, "Você não tem caças acumuladas.");
			    	return 1;
				}else{
					new string[256];
					new quantia;
					quantia = QtCacas[playerid]*100;
					format(string, sizeof(string),"Você vendeu %d caça(s) por R$100 cada e faturou R$%d com a venda.",QtCacas[playerid],quantia);
					SendClientMessage(playerid,COR_VERDE,string);
					GivePlayerMoney(playerid,quantia);
					QtCacas[playerid] = 0;
			    	return 1;
				}
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd,"/descarregar",true) == 0){
	    if(Profissao[playerid] == CAMINHONEIRO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	        if(AreaDescarga[playerid] == 1){
	            if(Carregamento[playerid] == 0){
	                SendClientMessage(playerid,COR_VERMELHO,"Seu veículo não está carregado!");
			    	return 1;
				}else{
				    Carregamento[playerid] = 0;
				    SendClientMessage(playerid,COR_VERDE,"Seu veículo foi descarregado.");
				    GivePlayerMoney(playerid,100);
				    return 1;
				}
			}else{
				SendClientMessage(playerid,COR_VERMELHO,"Você não está na área de carga");
			    return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/carregar", true) == 0) {
	    if(Profissao[playerid] == CAMINHONEIRO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	        if(AreaCarga[playerid] == 1){
				new modelo;
				cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
				if(modelo == Roadtrain){
				    if(Carregamento[playerid] == 0){
				    	SendClientMessage(playerid,COR_VERDE,"Veículo carregado!");
				    	SendClientMessage(playerid,COR_VERDE,"Para descarregar, vá até a área de descarga");
				    	Carregamento[playerid] = 1;
					    return 1;
					}else{
				        SendClientMessage(playerid,COR_VERMELHO,"Seu caminhão já está carregado!");
				    	return 1;
					}
				}else{
				    SendClientMessage(playerid,COR_VERMELHO,"Você não está em um caminhão RoadTrain!");
			    	return 1;
				}
	        } else {
	            SendClientMessage(playerid, COR_VERMELHO, "Você não está na área de carga!");
		    	return 1;
			}
	    }else{
	        SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	        return 1;
	    }
	}
	
	if(strcmp(cmd, "/vheroina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == GM ||Profissao [playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new string[256];
	        new ID, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vheroina [ID] [quantidade]");
		     	return 1;
			}
			ID = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vheroina [ID] [quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 10){
			    SendClientMessage(playerid, COR_VERMELHO, "Doses de 1 à 10");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Doses de 1 à 10");
			    return 1;
			}else{
			    if(!IsPlayerConnected(ID)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			        return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,ID) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para aplicar a injeção.");
				    	return 1;
				 	}else{
			        	if(Heroina[ID] == 10){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Calma, você acaba de injetar 10 doeses!");
					    	return 1;
						}else{
					    	Heroina[ID] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Heroína vendida!");
					    	format(string,sizeof(string),"Você está agora com %d doses de heroína no seu sangue",mili);
					    	SendClientMessage(ID,COR_BRANCO,string);
					    	return 1;
						}
					}
				}
			}
		}else{
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	
	if(strcmp(cmd, "/vcrack", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == GM ||Profissao[playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new string[256];
	        new ID, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vcrack [ID] [Quantidade]");
			    return 1;
			}
			ID = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vcrack [ID] [Quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 8){
			    SendClientMessage(playerid, COR_VERMELHO, "Você deve estar querendo que seu freguês acabe pelado em cima de uma casa? doses de 0 à 8 somente.");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não pode dar ao seu cliente 0 doses, 1 à 8 doses.");
		    	return 1;
			}else{
			    if(!IsPlayerConnected(ID)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			        return 1;
			    }else{
			        if(GetDistanceBetweenPlayers(playerid,ID) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chege mais perto para vender o bagulho.");
					    return 1;
					}else{
			        	if(Crack[ID] == 10){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
					    	return 1;
						}else{
					    	Crack[ID] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Crack vendida com sucesso!");
					    	format(string,sizeof(string),"Você acaba de apreciar %d doses de uma pedra de crack das boa.",mili);
					    	SendClientMessage(ID,COR_BRANCO,string);
					    	ApplyAnimation(ID, "CRACK", "crckdeth2", 4.0,1,0,0,0,0);
					    	return 1;
						}
					}
				}
			}
		}else{
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	
	if(strcmp(cmd, "/vmaconha", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == GM ||Profissao[playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new string[256];
	        new ID, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vmaconha [ID] [quantidade]");
			    return 1;
			}
			ID = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vmaconha [ID] [quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 10){
			    SendClientMessage(playerid, COR_VERMELHO, "Somente venda de 1 à 10 doses de maconha");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Doses de 1 à 10");
		    	return 1;
			}else{
			    if(!IsPlayerConnected(ID)){
			        SendClientMessage(playerid,COR_VERMELHO, "Jogador não conectado.");
			        return 1;
			    }else{
			        if(GetDistanceBetweenPlayers(playerid,ID) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chege mais perto para vender o bagulho.");
					    return 1;
					}else{
			        	if(Maconha[ID] == 10){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
					    	return 1;
						}else{
					    	Maconha[ID] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Maconha vendida!");
					    	format(string,sizeof(string),"Você agora está fumando maconha das boa... foi entregue a você %d cigarros de maconha.",mili);
					    	SendClientMessage(ID,COR_BRANCO,string);
					    	ApplyAnimation(ID,"SMOKING","M_smk_in",4.1,0,1,1,1,1);
					    	return 1;
						}
					}
				}
			}
		}else{
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	
	if(strcmp(cmd, "/vcocaina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == GM ||Profissao[playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new string[256];
	        new ID, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vcocaina [ID] [quantidade]");
		    	return 1;
			}
			ID = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vcocaina [ID] [quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Doses de 1 à 7 por cliente.");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Venda mais de 1 dose!");
		    	return 1;
			}else{
			    if(!IsPlayerConnected(ID)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			        return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,ID) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chege mais perto para vender o bagulho.");
				    	return 1;
					}else{
			        	if(Cocaina[ID] == 7){
			         	  	SendClientMessage(playerid,COR_VERMELHO, "-.-' você acabou de vender pra ele 7 doses calma!");
					    	return 1;
						}else{
					    	Cocaina[ID] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Cocaína vendida!");
					    	format(string,sizeof(string),"Você acaba de cheirar %d quilos de coca (cocaína).",mili);
					    	SendClientMessage(ID,COR_BRANCO,string);
					    	ApplyAnimation(ID, "CRACK", "crckdeth2", 4.0,1,0,0,0,0);
						    return 1;
						}
					}
				}
			}
		}else{
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	
	if(strcmp(cmd, "/vendergas", true) == 0) {
		if(IsPlayerAdmin(playerid)||Profissao[playerid] == GM || Profissao[playerid] == FRENTISTA){
			new tmp[256];
			new string[256];
			new petroleo;
			new ID, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/vendergas [ID] [quantidade]");
		    	return 1;
			}
		    ID = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vendergas [ID] [quantidade]");
		    	return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Quantidade inválida. Os valores devem ser de 1 à 100.");
		    	return 1;
			}
			if(IsPlayerConnected(ID)){
			if((Combustivel[ID] + comb) < 100){
			    petroleo = Combustivel[ID] + comb;
			    udb_setGasoline(PlayerName(ID), petroleo);
				Combustivel[ID] = petroleo;
				format(string,sizeof(string),"%s botou %d litros de combustível em seu tanque, seu combustível é de %d litros",PlayerName(playerid),comb,petroleo);
				SendClientMessage(ID,COR_VERDE,string);
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido!");
		    	return 1;
			}
			else if((Combustivel[ID] + comb) >= 100){
			    udb_setGasoline(PlayerName(ID), 100);
				petroleo = 100 - Combustivel[ID];
				Combustivel[ID] = 100;
				format(string,sizeof(string),"%s completou seu tanque, colocando %d litros",PlayerName(playerid), petroleo);
				SendClientMessage(ID,COR_VERDE,string);
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido!");
		 		return 1;
			    }
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
	    	return 1;
		}
	}

    if(strcmp(cmd, "/setarcomb", true) == 0) {
		if(IsPlayerAdmin(playerid)||Profissao[playerid] == GM){
			new tmp[256];
			new string[256];
			new petroleo;
			new ID, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/setarcomb [ID] [quantidade]");
		    	return 1;
			}
		    ID = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setarcomb [ID] [quantidade]");
		    	return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Quantidade inválida. Os valores devem ser de 1 à 100.");
		    	return 1;
			}
			if(IsPlayerConnected(ID)){
			if((Combustivel[ID] + comb) < 100){
			    petroleo = Combustivel[ID] + comb;
			    udb_setGasoline(PlayerName(ID), petroleo);
				Combustivel[ID] = petroleo;
				format(string,sizeof(string),"%s botou %d litros de combustível em seu tanque, totalizando %d litros",PlayerName(playerid),comb,petroleo);
				SendClientMessage(ID,COR_VERDE,string);
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido!");
		    	return 1;
			}
			else if((Combustivel[ID] + comb) >= 100){
			    udb_setGasoline(PlayerName(ID), 100);
				petroleo = 100 - Combustivel[ID];
				Combustivel[ID] = 100;
				format(string,sizeof(string),"%s completou seu tanque, colocando %d litros",PlayerName(playerid),petroleo);
				SendClientMessage(ID,COR_VERDE,string);
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido!");
		 		return 1;
			    }
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
		    return 1;
		}
	}
	
    if(strcmp(cmd, "/registrar", true) == 0 || strcmp(cmd, "/register", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	if(udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está registrado");
	    	return 1;
		}

    	if(PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está logado");
		    return 1;
		}

    	if(strlen(tmp) == 0) {
			SendClientMessage(playerid, COR_VERMELHO, "Você esqueceu de digitar a senha, digite /registrar [senha]");
	    	return 1;
		}else{
    	    PLAYERLIST_authed[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*<- senha*/,0 /*<- créditos*/, 500 /*<- Dinheiro no bolso*/,SkinsJogador[random(sizeof(SkinsJogador))] /*<- Skin*/, 800 /*<- Dinheiro no banco*/, 0 /*<- gasolina*/,
			0 /* <- habilitação aérea*/, 0 /*<- habilitação terrestre*/, 0 /*<- Habilitação Náutica*/, 0 /*<- preso*/, 1 /*<- profissão*/, ""/*<- clantag*/,
			1787.0270/*<- X*/, -1383.2040/*<- Y*/, 15.7578/*<- Z*/, 90.0/*<- Ângulo*/, 100.0 /*<- Vida*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			udb_setGasoline(PlayerName(playerid), 100);
			Combustivel[playerid] = 100;
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SetPlayerColor(playerid, COR_DESEMPREGADO);
			SendClientMessage(playerid, COR_AMARELO, "|___________________|RPG RULEZ|___________________|");
			SendClientMessage(playerid, COR_VERDE, "Há profissões disponíveis, /empregos");
			SendClientMessage(playerid, COR_VERMELHO, "Só dirija: lambretas, bugs, biciletas, karts, carros de golf e quadriciclos.");
			SendClientMessage(playerid, COR_VERMELHO, "Você só poderá falar com quem está PERTO usando, /s");
			SendClientMessage(playerid, COR_VERMELHO, "Depois de escolher uma profissão use /myprof [ID da prof]");
        	return 1;
		}
 	}
 	
 	if(strcmp(cmd, "/logar", true) == 0 || strcmp(cmd, "/login", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    if(!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COR_VERMELHO, "Desculpe, você não está registrado no RPG Rulez!");
		    return 1;
		}

	    if(PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está logado no RPG Rulez!");
		    return 1;
		}

	    if(strlen(tmp)==0) {
			SendClientMessage(playerid, COR_VERMELHO, "/logar [senha]");
		    return 1;
		}

	    if(udb_CheckLogin(PlayerName(playerid),tmp)) {
			PLAYERLIST_authed[playerid] = 1;
			LogarJogador(playerid);
		    return 1;
		}else{
			SendClientMessage(playerid, COR_VERMELHO, "A senha digitada está incompleta ou incorreta!");
	    	return 1;
	    }
	}

    if(strcmp(cmd, "/salvar", true) == 0) {
		if(PLAYERLIST_authed[playerid] == 1) {
			udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
			new Float:health;
			GetPlayerHealth(playerid, health);
			udb_setHealth(PlayerName(playerid), health);
			udb_setGasoline(PlayerName(playerid), Combustivel[playerid]);
			SendClientMessage(playerid, COR_VERDE, "Seus dados foram salvos com sucesso!");
			return 1;
	       }
         }

	if(strcmp(cmd, "/setarcasa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid) ||Profissao[playerid] == GM){
			new ID;
			new tmp[256];
			new nome[MAX_PLAYER_NAME];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setarcasa [ID]");
				return 1;
			}
			ID = strval(tmp);
			GetPlayerName(ID,nome,MAX_PLAYER_NAME);
    		if(udb_Exists(nome)) {
		        new Float:X, Float:Y, Float:Z, Float:ang;
		        new File:temp;
	      		new string[256];
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(nome, X, Y, Z);
			    udb_setAng(nome, ang);
			    SendClientMessage(playerid, COR_VERDE, "Casa vendida/setada com sucesso!");
			    format(string, sizeof(string), "%s Vendeu a você uma casa.",PlayerName(playerid));
				SendClientMessage(ID, COR_VERDE, string);
				printf("%s acaba de vender um imóvel para %s",PlayerName(playerid),nome);
				format(string, sizeof(string), "%f, %f, %f, //Casa setada para: %s  Em: %s \r\n", X, Y, Z, nome, zones[ZonaJogador[playerid]][zone_name]);
  				temp = fopen("Casas.RPG",io_append);
  	 			fwrite(temp, string);
				fclose(temp);
				AddStaticPickup(1272,1,X,Y,Z);
     	    	return 1;
    	    }else{
				new string[256];
                format(string, sizeof(string), "Jogador ID %d não está online",ID);
    	        SendClientMessage(playerid, COR_VERMELHO, string);
    	        return 1;
			}
		}else{
		    SendClientMessage(playerid, COR_VERMELHO2, "Você não tem permissão!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/medicamento", true) == 0) {
	    if(Profissao[playerid] == PARAMEDICO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/medicamento [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			}else{
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Medicamento entregue!");
			    	format(string, sizeof(string), "%s deu a você 100 de vida, custo: R$100.",PlayerName(playerid));
				    SendClientMessage(ID, COR_AMARELO, string);
			    	SetPlayerHealth(ID,100);
			    	GivePlayerMoney(playerid,100);
			    	return 1;
				}else{
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para aplicar o curativo!");
			    	return 1;
				}
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas paramédicos podem fazer isso!");
	    	return 1;
		}
	}

    if(strcmp(cmd, "/meuskin", true) == 0 || strcmp(cmd, "/skin", true) == 0) {
	   new tmp[256];
	   new Skin;
	   new string[256];
	   tmp = strtok(cmdtext,idx);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/meuskin [ID]");
	   return 1;
	   }
	   Skin = strval(tmp);
	   if(Skin == 3 || Skin == 4 || Skin == 5 || Skin == 6 || Skin == 8 || Skin == 42 || Skin == 65 || Skin == 74 || Skin == 86 || Skin == 119 || Skin == 149 || Skin == 208 || Skin == 273 || Skin == 274 || Skin == 289 || Skin >= 300){
       SendClientMessage(playerid,COR_VERMELHO, "A skin que você selecionou não é válida");
	   return 1;
	   }
	   udb_setSkin(PlayerName(playerid),Skin);
	   SetPlayerSkin(playerid, Skin);
	   SendClientMessage(playerid,COR_AZUL, "Skin modificada com sucesso!");
	   format(string, sizeof(string), "Agora você usa skin ID: %d", Skin);
	   SendClientMessage(playerid, COR_VERDE, string);
	   return 1;
	   }
	   
     if(strcmp(cmd, "/skinprofissao", true) == 0) {
	   udb_setSkin(PlayerName(playerid),SkinProfissao[Profissao[playerid]]);
	   SetPlayerSkin(playerid, SkinProfissao[Profissao[playerid]]);
	   SendClientMessage(playerid,COR_AZUL, "Skin modificada com sucesso!");
	   return 1;
	   }
	   
    if(strcmp(cmd, "/admincomandos", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
		SendClientMessage(playerid, COR_VERDE, "|___________ Comandos de administrador do RPG Rulez __________|");
		SendClientMessage(playerid, COR_AMARELO, "/rcon login [senha rcon] : Loga como admin");
        SendClientMessage(playerid, COR_AMARELO, "/setarcomb: [id do player] e [quantidade de combustivel pro player]");
        SendClientMessage(playerid, COR_AMARELO, "/setarprof: [id do player] e [id da profissao]");
        SendClientMessage(playerid, COR_AMARELO, "/setarskin: [id do player] e [id da skin]");
        SendClientMessage(playerid, COR_AMARELO, "/setarcasa [ID]: Seta uma casa pra alguem");
        SendClientMessage(playerid, COR_AMARELO, "/godc: Carro no modo deus (nunca explode)");
        SendClientMessage(playerid, COR_AMARELO, "/godmode: Você em modo deus (nunca morre)");
		SendClientMessage(playerid, COR_AMARELO, "/godmodeoff: Desliga o modo deus");
        SendClientMessage(playerid, COR_AZUL, "Para mais comandos de admin /admincomandos2");
		return 1;
      }
	}

    if(strcmp(cmd, "/admincomandos2", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
		SendClientMessage(playerid, COR_VERDE, "|___________ Comandos de administrador do RPG Rulez __________|");
		SendClientMessage(playerid, COR_AMARELO, "/vida [ID]: Completa a vida de alguem");
		SendClientMessage(playerid, COR_AMARELO, "/colete: Dá colete ao admin");
		SendClientMessage(playerid, COR_AMARELO, "/lchat: Limpa a janela de texto");
		SendClientMessage(playerid, COR_AMARELO, "/rcon rulez: Vê os comandos especiais");
        return 1;
      }
    }
    
    if(strcmp(cmd,"/lchat", true) == 0) {
        if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
        for(new i=0; i<200; i++)
		SendClientMessageToAll(COR_AZUL, " ");
        printf("%s Limpou o chat.",PlayerName(playerid));
        return 1;
		}
     }
     
     /*if(strcmp(cmd,"/int", true) == 0) {
		SetPlayerInterior(playerid, 12);
		SetPlayerPos(playerid, 444.646911,508.239044,1001.419494);
        return 1;
		}
     if(strcmp(cmd,"/int2", true) == 0) {
		SetPlayerInterior(playerid, 12);
		SetPlayerPos(playerid, 2324.419921,-1145.568359,1050.710083);
        return 1;
		}
     if(strcmp(cmd,"/int3", true) == 0) {
		SetPlayerInterior(playerid, 1);
		SetPlayerPos(playerid, 963.418762,2108.292480,1011.030273);
        return 1;
		}
     if(strcmp(cmd,"/int4", true) == 0) {
		SetPlayerInterior(playerid, 1);
		SetPlayerPos(playerid, -2159.122802,641.517517,1052.381713);
        return 1;
		}
    if(strcmp(cmd,"/int5", true) == 0) {
		SetPlayerInterior(playerid, 17);
		SetPlayerPos(playerid, 381.169189,-188.803024,1000.632812);
		return 1;
		}
    if(strcmp(cmd,"/int6", true) == 0) {
		SetPlayerInterior(playerid, 2);
		SetPlayerPos(playerid, 2543.462646,-1308.379882,1026.728393);
		return 1;
		}
    if(strcmp(cmd,"/int7", true) == 0) {
		SetPlayerInterior(playerid, 6);
		SetPlayerPos(playerid, 761.412963,1440.191650,1102.703125);
		return 1;
		}
    if(strcmp(cmd,"/int8", true) == 0) {
		SetPlayerInterior(playerid, 3);
		SetPlayerPos(playerid, 964.106994,-53.205497,1001.124572);
		return 1;
		}
    if(strcmp(cmd,"/int9", true) == 0) {
		SetPlayerInterior(playerid, 3);
		SetPlayerPos(playerid, 964.106994,-53.205497,1001.124572);
		return 1;
		}
    if(strcmp(cmd,"/int10", true) == 0) {
		SetPlayerInterior(playerid, 7);
		SetPlayerPos(playerid, -1398.065307,-217.028900,1051.115844);
		return 1;
		}
	if(strcmp(cmd,"/int11", true) == 0) {
		SetPlayerInterior(playerid, 15);
		SetPlayerPos(playerid, -1398.103515,937.631164,1036.479125);
		return 1;
		}*/

    if(strcmp(cmd, "/regras", true) == 0) {
		SendClientMessage(playerid, COR_VERDE, "|______________ Regras do RPG Rulez ____________|");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº1: Não use cheats no servidor ou será banido.");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº2: Não mate no banco e/ou no hospital.");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº3: Não cometa DB (Drive-By) se não quiser ser banido.");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº4: Não faça spam (Propaganda) no servidor.");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº5: Se você matar sem motivo será multado, se voltar a matar será preso!");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº6: Todos os administradores devem ser responsáveis e não cometer Power Abuse.");
        SendClientMessage(playerid, COR_AMARELO,"Regra nº7: Não chingue se não quiser levar kick ou ban.");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº8: Não use armas como: Minigun, Flametower, Lança Chamas, Bazuca e etc..");
		SendClientMessage(playerid,COR_AZULPLUS,"Essas regras se aplicam a todos até a administradores e Game Masters");
		return 1;
	}
	
    if(strcmp(cmd, "/precoscarros", true) == 0) {
       SendClientMessage(playerid, COR_VERDE, "|______________ Tabela de preços de veículos do RPG Rulez ___________|");
       SendClientMessage(playerid, COR_AMARELO, "Sedans 2 Portas: R$ 29000");
       SendClientMessage(playerid, COR_AMARELO, "Sedans 4 Portas de Luxo: R$45000");
       SendClientMessage(playerid, COR_AMARELO, "Carros Muscle (Fortes): R$60000");
       SendClientMessage(playerid, COR_AMARELO, "Carros de Racha: R$ 90000");
       SendClientMessage(playerid, COR_AMARELO, "Carros Sport de Alta Performace: R$70000");
       SendClientMessage(playerid, COR_AMARELO, "Caminhões: R$ 40000");
	   SendClientMessage(playerid, COR_AZUL, "Para mais preços digite:/precoscarros2");
	   return 1;
	 }
	
	if(strcmp(cmd, "/precoscarros2", true) == 0) {
	   SendClientMessage(playerid, COR_VERDE, "|_____________ Tabela de preços de Carros do RPG Rulez ____________|");
	   SendClientMessage(playerid, COR_AMARELO, "Caminhonetes e Vans: R$ 7500");
       SendClientMessage(playerid, COR_AMARELO, "LowRiders: R$97000");
       SendClientMessage(playerid, COR_AMARELO, "Carros-Recreação: R$12000");
       SendClientMessage(playerid, COR_AMARELO, "Bikes e Motos: R$ 10000");
       SendClientMessage(playerid, COR_AMARELO, "Aviões/Helicopteros: R$ 990000");
       SendClientMessage(playerid, COR_AMARELO, "Barcos: R$15000");
       SendClientMessage(playerid, COR_AMARELO, "Veiculos quebrados(sem concerto): R$1000");
       SendClientMessage(playerid, COR_VERMELHO2, "AVISO: Veículos do governo e veiculos do serviço civíl NÃO ESTÃO A VENDA!!");
       return 1;
    }
    
	if(strcmp(cmd, "/precoshab", true) == 0) {
       SendClientMessage(playerid, COR_VERDE, "|___________ Tabela de preços de Habilitações do RPG Rulez _________|");
       SendClientMessage(playerid, COR_AZUL, "Para comprar habilitações sem ajuda de instrutor use: /licensas");
       SendClientMessage(playerid, COR_AMARELO, "Habilitação terrestre = Sem teste: R$1200 Com teste: R$800");
       SendClientMessage(playerid, COR_AMARELO, "Habilitção Náutica = Sem teste: R$2000 Com Teste: R$1000");
       SendClientMessage(playerid, COR_AMARELO, "Habilitção aérea = Sem teste R$2500 Com teste: R$1500");
       SendClientMessage(playerid, COR_AZUL, "Quem quiser todas as habilitações pagará: R$4400");
       return 1;
    }
    
    if(strcmp(cmd, "/licensas", true) == 0) {
       SendClientMessage(playerid, COR_VERDE, "|_____________ Tabela de preços de Licensas do RPG Rulez ____________|");
       SendClientMessage(playerid, COR_AZUL, "Aqui você comprar licensas por você mesmo mas com o preço mais alto.");
       SendClientMessage(playerid, COR_AMARELO, "Habilitação terrestre = Sem teste: R$12000");
       SendClientMessage(playerid, COR_AMARELO, "Habilitção Náutica = Sem teste: R$20000");
       SendClientMessage(playerid, COR_AMARELO, "Habilitção aérea = Sem teste R$25000");
       SendClientMessage(playerid, COR_AZUL, "Digite /comprarterrestre, /compraraerea, /comprarnautica");
       SendClientMessage(playerid, COR_VERMELHO, "Não use isto se um instrutor estiver online, você estará perdendo dinheiro");
       return 1;
    }
    
	if(strcmp(cmd, "/creditosrulez", true) == 0) {
	    SendClientMessage(playerid, COR_VERDE, "|_______RPG Rulez - Creditos_______|");
	    SendClientMessage(playerid, COR_BRANCO, "Copyright © 2006 - 2008, [VGS] Clan");
	    SendClientMessage(playerid, COR_AZUL, "Coder: [VGS]Mac_OC");
		SendClientMessage(playerid, COR_AMARELO, "Ajuda: Protioso & Mlqd");
		SendClientMessage(playerid, COR_AZULPLUS, "Coders originais: SolidNuts, TheHitman e Luigui");
    	return 1;
	}
	
	if(strcmp(cmd, "/precos", true) == 0) {
        SendClientMessage(playerid, COR_VERDE, "|__________ Preços do RPG Rulez _________|");
        SendClientMessage(playerid, COR_AMARELO, "/precoscarros: Lista de preços de Auto-Móveis parte 1 do RPG Rulez");
		SendClientMessage(playerid, COR_AMARELO, "/precoscarros2: Lista de preços de Auto-Móveis parte 2 do RPG Rulez.");
		SendClientMessage(playerid, COR_AMARELO, "/precoshab: Lista de preços de habilitações do RPG Rulez.");
		return 1;
    }
	
	if(strcmp(cmd, "/tutorial", true) == 0) {
	    SendClientMessage(playerid, COR_AZUL, "==============================|..::RPG Rulez::..|===================================");
	    SendClientMessage(playerid, COR_VERDE, "RPG, ele simula a vida real e já que na vida real existem profissões...");
	    SendClientMessage(playerid, COR_VERDE, "Você pode escolher a profissão de seu gosto comprar casa carro etc.. Mas como na vida real, é nescessário dinheiro.");
	    SendClientMessage(playerid, COR_VERDE, "Na vida real existem criminosos aqui também, mas os policias também exitem então cuidado.");
		SendClientMessage(playerid, COR_VERDE, "Se dirigir sem habilitação, poderá pegar multa. Há 3 tipos de habilitações:");
		SendClientMessage(playerid, COR_VERDE, "Terrestre, náutica e aérea.");
		SendClientMessage(playerid, COR_AZULPLUS, "Para pegar uma profissão use /myprof [ID da prof]");
		SendClientMessage(playerid, COR_VERDE, "Para escolher uma profissão: /empregos.");
		SendClientMessage(playerid, COR_VERMELHO, "Quer Saber os Comandos? /ajuda.");
    	return 1;
	}
	
	if(strcmp(cmd,"/reparar",true)==0){
	    if(Profissao[playerid] == TUNADOR || IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
	        if(IsPlayerInAnyVehicle(playerid)){
				SetVehicleHealth(GetPlayerVehicleID(playerid),1000.0);
				SendClientMessage(playerid, COR_VERDE, "Veículo reparado com sucesso!");
			}else{
			    SendClientMessage(playerid,COR_VERMELHO,"Você não está em um veículo!");
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é mecânico!");
		}
		return 1;
	}
	
    if(strcmp(cmd, "/ajuda", true) == 0) {
		SendClientMessage(playerid, COR_VERDE, "|___________________COMANDOS DO RPG RULEZ BRASIL___________________|");
		SendClientMessage(playerid, COR_AMARELO, "|_GERAL_| /empregos  /transferir  /trancar  /destrancar  /mostrardocs /acoes /salvar");
		SendClientMessage(playerid, COR_AMARELO, "|_GERAL_| /chamartaxi  /pagar  /190  /presos  /pescar  /profissao /precos /horario /placa");
        SendClientMessage(playerid, COR_AMARELO, "|_GERAL_| /creditosrulez  /rep /mp /s /193 /ejetar /saldocell /myprof /banco /status");
		return 1;
	}
	
    if(strcmp(cmd, "/tunar", true) == 0) {
	   new Float:X;
	   new Float:Y;
	   new Float:Z;
        if(IsPlayerAdmin(playerid) || Profissao[playerid] == TUNADOR || Profissao[playerid] == GM) {
		if(IsPlayerInAnyVehicle(playerid)) {
		if(TunarVeiculo(GetPlayerVehicleID(playerid)) == 1) {
		    SendClientMessage(playerid, COR_VERDE, "Seu veículo foi tunado com sucesso.");
		    PlayerPlaySound(playerid,1056,X,Y,Z);
		    return 1;
		}else{
		SendClientMessage(playerid, COR_VERMELHO, "É impossivel tunar o seu veículo.");
		}
		}else{
		SendClientMessage(playerid, COR_VERMELHO, "Você não está em nenhum veículo.");
		}
		return 1;
     }
  }

	if(strcmp(cmd,"/banco",true) == 0) {
		if(AreaBanco[playerid] == 1) {
        SendClientMessage(playerid, COR_VERDE, "Bancos 24Horas RPG Rulez Brasil");
        SendClientMessage(playerid, COR_AMARELO, "/depositar [Quantia]");
        SendClientMessage(playerid, COR_AMARELO, "/sacar [Quantia]");
        SendClientMessage(playerid, COR_AMARELO, "/saldo");
        SendClientMessage(playerid, COR_AMARELO, "/saldocell (se não estiver em um banco e precisar checar seu saldo)");
		return 1;
    }
        else if(AreaBanco[playerid] == 0) {
		SendClientMessage(playerid, COR_VERMELHO, "ATENÇÃO: Você não está em um Banco 24Horas RPG Rulez Brasil");
		SendClientMessage(playerid, COR_VERDE, "Desculpe, você não está em um banco mas pode usar /saldocell para ver seu saldo (custo: R$5,00)");
        SendClientMessage(playerid, COR_VERDE, "Você tem dúvidas de onde fica um banco? ache no mapa um cifrão ( $ )");
        SendClientMessage(playerid, COR_AMARELO, "Se não achar o $ no mapa fale com o administrador presente ou com algum jogador.");
    	return 1;
	}
 }

    if(strcmp(cmd, "/profissoes", true) == 0 || strcmp(cmd, "/profs", true) == 0) {
		SendClientMessage(playerid, COR_VERMELHO, "Uso Correto: /empregos");
		return 1;
    }
    
	if(strcmp(cmd, "/empregos", true) == 0) {
		SendClientMessage(playerid, COR_VERDE, "|______________ TUTORIAL DE PROFISSÕES __________|");
		SendClientMessage(playerid, COR_AMARELO, "Veja o ID delas, EXEMPLO:");
		SendClientMessage(playerid, COR_TAXISTA, "2 - Taxista || Aquele 2 quer dizer que é o ID dela então use /myprof [ID da prof] e você escolherá a profissão.");
		SendClientMessage(playerid, COR_VERMELHO, "Se você tentar escolher uma profissão que seja promoção como o B.O.P.E não vai ser válida!");
		SendClientMessage(playerid, COR_AZUL, "Para ver as profissões digite /empregos1");
		return 1;
    }
    
	if(strcmp(cmd, "/empregos1", true) == 0) {
        SendClientMessage(playerid, COR_VERDE, "|___________ Profissões do RPG Rulez Brasil __________|");
        SendClientMessage(playerid, COR_DESEMPREGADO, " 1 - Desempregado (Não recebe salário)");
        SendClientMessage(playerid, COR_TAXISTA, " 2 - Taxista (Salário: R$900)");
        SendClientMessage(playerid, COR_VENDEDOR_VEICULOS, " 3 - Vendedor de veículos (Salário: R$1000 + O que ganhar vendendo carros)");
        SendClientMessage(playerid, COR_CORRETOR, " 4 - Corretor de imóveis (Salário: R$1000 + O que ganhar vendendo casas)");
        SendClientMessage(playerid, COR_ASSASSINO, " 5 - Assassino (Salário: O Dinheiro de quem você matar)");
        SendClientMessage(playerid, COR_BARMAN, " 6 - Barman (Salário: R$850 + As bebidas que vender)");
        SendClientMessage(playerid, COR_JUIZ, " 7 - Juiz (Salário: R$8000)");
        SendClientMessage(playerid, COR_SEGURANÇA, " 8 - Segurança (Salário: R$850 + O que o patrão pagar)");
        SendClientMessage(playerid, COR_AZUL, "Para mais profissões, digite /empregos2");
    	return 1;
	}
	
	if(strcmp(cmd,"/empregos2",true) == 0) {
	    SendClientMessage(playerid, COR_VERDE, "|___________ Profissões do RPG Rulez Brasil __________|");
	    SendClientMessage(playerid, COR_MOTORISTA, " 9 - Motorista Particular (Salário: R$850 + O que o patrão pagar)");
	    SendClientMessage(playerid, COR_COP_MILITAR, " 10 - Policial Militar (Salário: R$1000)");
	    SendClientMessage(playerid, COR_COP_RODOVIARIO, " 11 - Policial Rodoviário (Salário: R$1000)");
	    SendClientMessage(playerid, COR_B.O.P.E, " 12 - Soldado do B.O.P.E (Salário: R$2000)");
	    SendClientMessage(playerid, COR_CAÇADOR, " 13 - Caçador (Salário: R$1000)");
	    SendClientMessage(playerid, COR_PESCADOR, " 14 - Pescador (Salário: R$750 + O que ganhar em cada pesca)");
	    SendClientMessage(playerid, COR_INSTRUTOR, " 15 - Instrutor de Direção (Salário: R$600 + O que ganhar vendendo habilitações)");
	    SendClientMessage(playerid, COR_TRAFICANTE, " 16 - Traficante (Salário: R$1200 + O que ganhar na venda de drogas)");
	    SendClientMessage(playerid, COR_AZUL, "Para mais profissões, digite /empregos3");
    	return 1;
	}
	
	if(strcmp(cmd,"/empregos3",true) == 0) {
	    SendClientMessage(playerid, COR_VERDE, "|___________ Profissões do RPG Rulez Brasil __________|");
	    SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, " 17 - Motorista de ônibus (Salário: R$900)");
	    SendClientMessage(playerid, COR_JORNALISTA, " 18 - Jornalista (Salário: R$1150)");
	    SendClientMessage(playerid, COR_CAMINHONEIRO, " 19 - Caminhoneiro (Salário: R$900 + O que ganha por carga)");
	    SendClientMessage(playerid, COR_LABNARCOTICOS, " 20 - Laboratorísta de Narcóticos (Salário: R$4000)");
	    SendClientMessage(playerid, COR_I.B.A.M.A, " 21 - Agente do I.B.A.M.A (Salário: R$2500)");
	    SendClientMessage(playerid, COR_ADVOGADO, " 22 - Advogado (Salário: R$1000 + Causas ganhas)");
	    SendClientMessage(playerid, COR_BRANCO, " 23 - Paramédico (Salário: R$900 + Trabalhos para salvar vidas)");
	    SendClientMessage(playerid, COR_HOT_DOG, " 24 - Vendedor de Hot Dog (Salário: R$900)");
	    SendClientMessage(playerid, COR_AZUL, "Para mais profissões, digite /empregos4");
    	return 1;
	}
	
	if(strcmp(cmd,"/empregos4",true) == 0) {
	    SendClientMessage(playerid, COR_VERDE, "|___________ Profissões do RPG Rulez Brasil __________|");
	    SendClientMessage(playerid, COR_MOTOBOY, " 25 - Moto Boy (Salário: R$1000)");
	    SendClientMessage(playerid, COR_TAXI_AEREO, " 26 - Taxista aéreo (Salário: R$1200)");
	    SendClientMessage(playerid, COR_ENTREGADOR_PIZZA, " 27 - Entregador de Pizza (Salário: R$900 + o que ganhar pelas pizzas)");
	    SendClientMessage(playerid, COR_PRESIDENTE, " 28 - Presidente (Salário: R$9000)");
        SendClientMessage(playerid, COR_PREFEITO, " 29 - Prefeito (Salário: R$3080)");
        SendClientMessage(playerid, COR_AGRICULTOR, " 30 - Agricultor (Salário: R$800 + o que plantar)");
        SendClientMessage(playerid, COR_B.O.P.E, " 31 - Governador (Salário: R$4500)");
        SendClientMessage(playerid, COR_DEPUTADO," 32 - Deputado (Salário: R$2000)");
        SendClientMessage(playerid, COR_AZUL, "Para mais profissões digite /empregos5");
        return 1;
    }

	if(strcmp(cmd,"/empregos5",true) == 0) {
        SendClientMessage(playerid, COR_VERDE, "|___________ Profissões do RPG Rulez Brasil __________|");
        SendClientMessage(playerid, COR_TUNADOR," 33 - Mecânico (Salário: R$1100 + O que ganhar tunando e consertando veículos)");
		SendClientMessage(playerid, COR_GM," 34 - Game Master (Limitado)");
        SendClientMessage(playerid, COR_EXERCITO, " 35 - Soldado do exército (Salário: R$4000)");
        SendClientMessage(playerid, COR_DELEGADO, " 36 - Delegado (Sálario: R$2000)");
	    SendClientMessage(playerid, COR_MATADOR_DE_ALUGUEL, " 37 - Matador de Aluguel (Salário R$4000 + O que pagarem pelas mortes)");
	    SendClientMessage(playerid, COR_REI_DO_CRIME, " 38 - Rei do Crime (Salário: R$3000)");
	    SendClientMessage(playerid, COR_FRENTISTA, " 39 - Frentista  (Salário: R$950 + Tanques que encher)");
        SendClientMessage(playerid, COR_PADRE, " 40 - Padre (Salário: R$2500 + O que quem casar pagar)");
        SendClientMessage(playerid, COR_AZUL, "Para mais profissões digite /empregos6");
        return 1;
	}
	
    if(strcmp(cmd,"/empregos6",true) == 0) {
		SendClientMessage(playerid, COR_VERDE, "|___________ Profissões do RPG Rulez Brasil __________|");
	    SendClientMessage(playerid, COR_HOMEM_BOMBA, " 41 - Homem Bomba (Salário: R$1000 + Quem pagar pra você explodir alguma coisa o.O)");
	    SendClientMessage(playerid, COR_ASSALTANTE, " 42 - Assaltante (Salário: R$1000 + o que ganhar assaltando bancos)");
	    SendClientMessage(playerid, COR_S.W.A.T, " 43 - S.W.A.T (Salário: R$3500)");
	    SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, " 44 - Vendedor de Armas (Salário: R$1500 + Armas que vender)");
	    SendClientMessage(playerid, COR_AZUL, "Para pegar uma profissão use /myprof [ID da prof]");
	    return 1;
    }
    
	if(strcmp(cmd, "/chamartaxi", true) == 0) {
		new string[256];
	    SendClientMessage(playerid, COR_TAXISTA, "Os taxistas foram informados.");
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
	    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == TAXISTA || IsPlayerAdmin(playerid)){
				format(string,sizeof(string),"%s precisa de um taxi em:  %s",PlayerName(playerid),zones[ZonaJogador[playerid]][zone_name]);
				SendClientMessage(i, COR_TAXISTA, string);
				return 1;
               }
  		     }
           }

	if(strcmp(cmd,"/visivel",true) == 0) {
        for(new i=0; i<MAX_PLAYERS; i++)
		SetPlayerMarkerForPlayer(i,playerid, 1);
		LogarJogador(playerid);
		SendClientMessage(playerid, COR_VERDE, "Você agora está visível no radar/mapa");
		return 1;
	}
	       
    if(strcmp(cmd,"/invisivel",true) == 0) {
        for(new i=0; i<MAX_PLAYERS; i++)
		SetPlayerMarkerForPlayer(i,playerid, 0);
		SendClientMessage(playerid, COR_VERDE, "Você agora está invisível no radar/mapa");
		return 1;
	  }

	if(strcmp(cmd, "/placa", true, 6) == 0) {
	   if(IsPlayerInAnyVehicle(playerid)) {
	     new string[256];
	     new Float:X;
	     new Float:Y;
	     new Float:Z;
	     new vid = GetPlayerVehicleID(playerid);
	     GetPlayerPos(playerid, X, Y, Z);
	     format(string, 256, "%s",cmdtext[6]);
	     SetVehicleNumberPlate(vid, string);
	     SetVehicleToRespawn(vid);
	     SendClientMessage(playerid,COR_VERDE, "Placa setada, seu veículo foi respawnado.");
	     PutPlayerInVehicle(playerid, vid, 0);
	     RemovePlayerFromVehicle(playerid);
	     SetVehiclePos(vid, X, Y, Z );
	     }else
	     SendClientMessage(playerid,COR_VERMELHO,"Você não está em um veiculo!");
	     return 1;
	  }
	  

	if(strcmp(cmd, "/190", true) == 0) {
		new tmp[256];
		new string[256];
		if(!strlen(tmp)) {
		    strmid(tmp, cmdtext, 4, strlen(cmdtext));
			SendClientMessage(playerid, COR_VERMELHO, "/190 [Denuncia]");
			return 1;
		}else{
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SendClientMessage(playerid, COR_AMARELO,"Os policiais foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		         if(Profissao[i] == COP_MILITAR || Profissao[i] == S.W.A.T || Profissao[i] == GM || Profissao[i] == COP_RODOVIARIO || Profissao[i] == B.O.P.E || Profissao[i] == DELEGADO || Profissao[i] == EXERCITO || IsPlayerAdmin(i)){
				 format(string, sizeof(string), "%s Fez uma denuncia: %s", PlayerName(playerid), tmp);
				 SendClientMessage(i, COR_VERMELHO, string);
		        }
			}
		}
        return 1;
 	}
 	
	if(strcmp(cmd, "/193", true) == 0) {
		new string[256];
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		SendClientMessage(playerid, COR_AMARELO,"Os paramedicos foram informados");
		for(new i=0; i<MAX_PLAYERS; i++){
			if(IsPlayerAdmin(i) || Profissao[i] == PARAMEDICO || Profissao[playerid] == COP_MILITAR){
				format(string,sizeof(string),"%s Precisa de um ambulância em: %s",PlayerName(playerid),zones[ZonaJogador[playerid]][zone_name]);
				SendClientMessage(i, COR_VERMELHO, string);
			}
   		}
		return 1;
	}
	
	if(strcmp(cmd, "/rep", true) == 0) {
		new tmp[256];
		new string[256];
        strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/rep [Texto]");
	    	return 1;
		}else{
            SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		    SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		    SendClientMessage(playerid, COR_VERDE, "Os administradores online foram informados!");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == GM){
					format(string, sizeof(string), "%s Reportou que:  %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_VERMELHO, string);
                    return 1;
		        }
			}
		}
	}
	
	if(strcmp(cmd, "/trancar", true) == 0) {
    	new State;
    	new Float:X;
    	new Float:Y;
	    new Float:Z;
		if(IsPlayerInAnyVehicle(playerid)) {
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER) {
				SendClientMessage(playerid,COR_VERMELHO,"Você só pode trancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++) {
				if(i != playerid) {
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COR_BRANCO, "|_____________ VEÍCULO _____________|");
			SendClientMessage(playerid, COR_VERDE, "Seu veículo foi trancado!");
			SendClientMessage(playerid, COR_BRANCO, "|___________________________________|");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1056,X,Y,Z);
			return 1;

		}else{

			SendClientMessage(playerid, COR_VERMELHO, "Você não está em nenhum veículo!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/destrancar", true) == 0) {
    	new State;
    	new Float:X;
    	new Float:Y;
    	new Float:Z;
		if(IsPlayerInAnyVehicle(playerid)) {
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER) {
				SendClientMessage(playerid,COR_VERMELHO,"Você só pode destrancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++) {
				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
			}
			SendClientMessage(playerid, COR_BRANCO, "|_____________ VEÍCULO _____________|");
			SendClientMessage(playerid, COR_VERMELHO2, "Seu veículo foi destrancado!");
			SendClientMessage(playerid, COR_BRANCO, "|___________________________________|");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1057,X,Y,Z);
			return 1;
			
		}else{

			SendClientMessage(playerid, COR_VERMELHO, "Você não está em nenhum veículo!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/trancarservidor", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
			ServidorTrancado = 1;
			SendClientMessageToAll(COR_VERDE, "Servidor Trancado.");
			return 1;
		 }
	  }

    if(strcmp(cmd, "/abrirservidor", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
			ServidorTrancado = 0;
			SendClientMessageToAll(COR_VERDE, "Servidor Aberto.");
			return 1;
		 }
	  }
	
	if(strcmp(cmd, "/contar", true) == 0) {
        new string[256];
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
           format(string,sizeof(string),"%s iniciou uma contagem.",PlayerName(playerid));
           SendClientMessageToAll(COR_AZULPLUS, string);
           SetTimer("Contar",500,0);
           }else{
	       SendClientMessage(playerid, COR_VERMELHO, "Você não pode usar este comando!");
		   }
   		   return 1;
         }

    if(strcmp(cmd,"/setarhora",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COR_VERMELHO,"/setarhora [Horas]");
			return 1;
		}
		if(strval(tmp) > 23 || strval(tmp) < 0){
		    SendClientMessage(playerid,COR_VERMELHO,"Valores de 0 à 23");
		    return 1;
		}else{
		    worldTime = strval(tmp);
		    SetWorldTime(worldTime);
		    return 1;
		}
	}

	if(strcmp(cmd,"/setarclima",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256];
	    new Clima2;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COR_VERMELHO,"/setarclima [0 à 40]");
			return 1;
		}
		if(strval(tmp) > 40 || strval(tmp) < 0){
		    SendClientMessage(playerid,COR_VERMELHO,"Valores de 0 à 40");
		    return 1;
		} else {
		    Clima2 = strval(tmp);
		    SetWeather(Clima2);
		    return 1;
		}
	}
	
	if(strcmp(cmd, "/spos", true) == 0) {

		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {

			GetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
			SendClientMessage(playerid, COR_VERDE, "Posição salva com sucesso.");
		}else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
		  }
	     return 1;
	    }
	    
	if(strcmp(cmd, "/tpos", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
			if(GetPlayerState(playerid) == 2) {
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}else{
				SetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
			}
			SendClientMessage(playerid, COR_VERDE, "Você acaba de ir para sua posição salva.");
			SetPlayerInterior(playerid,0);
		}else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
		  }
	     return 1;
	   }

	if(strcmp(cmd,"/vhotdog",true)==0) {
	    if(Profissao[playerid] == HOT_DOG || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new ID;
	    	tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
    		SendClientMessage(playerid,COR_VERMELHO,"/vhotdog [ID]");
			return 1;
			}
			ID = strlen(tmp);
			if(IsPlayerConnected(ID) && PLAYERLIST_authed[ID] == 1){
			    if(GetDistanceBetweenPlayers(ID,playerid) > 30){
			        SendClientMessage(playerid,COR_VERMELHO,"Você esta muito longe chegue mais perto.");
					return 1;
				}else{
				    SendClientMessage(playerid,COR_HOT_DOG,"Hot dog vendido.");
				    SendClientMessage(ID,COR_HOT_DOG,"Você se deliciou com um Hot Dog.");
				    GivePlayerMoney(playerid,10);
				    GivePlayerMoney(ID,-10);
				    SetPlayerHealth(ID,100);
					return 1;
				}
			}else{
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
			}

		}else{
		
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/VeloMulta",true) == 0) {
		if(IsPlayerAdmin(playerid)|| Profissao[playerid] == GM){
		    if(VeloMulta == 1){
		        SendClientMessage(playerid,COR_VERMELHO,"Multa por velocímetro desligada.");
				VeloMulta = 0;
		    	return 1;
			}else{
			    SendClientMessage(playerid,COR_VERMELHO,"Multa por velocímetro ligada.");
			    VeloMulta = 1;
		    	return 1;
			}
			
		}else{
		
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é administrador!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/transferir", true) == 0) {
	
		new string[256];
	    new tmp[256];
	    
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/transferir [ID] [Quantia]");
	    	return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/transferir [ID] [Quantia]");
	    	return 1;
		}
 		quantiadinheiro = strval(tmp);
		if(IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			dinheirojogador = GetPlayerMoney(playerid);
			if(quantiadinheiro > 0 && dinheirojogador >= quantiadinheiro) {
				GivePlayerMoney(playerid, (0 - quantiadinheiro));
				GivePlayerMoney(giveplayerid, quantiadinheiro);
				format(string, sizeof(string), "Você enviou à %s (ID: %d)  R$%d", giveplayer,giveplayerid, quantiadinheiro);
				SendClientMessage(playerid, COR_AMARELO, string);
				format(string, sizeof(string), "Você recebeu R$%d de %s (ID: %d)", quantiadinheiro, sendername, playerid);
				SendClientMessage(giveplayerid, COR_AMARELO, string);
				return 1;
			}else{
				SendClientMessage(playerid, COR_AMARELO, "Valor inválido.");
			}
		}else{
			format(string, sizeof(string), "ID %d não está online.", giveplayerid);
			SendClientMessage(playerid, COR_AMARELO, string);
			return 1;
		}
	}
	
	if(strcmp(cmd, "/depositar", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "/depositar [Quantia]");
	    	return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COR_VERMELHO, "Banco: Você está tentando depositar uma quantia inválida.");
	    	return 1;
		}
	    if(AreaBanco[playerid] == 1) {
	        GivePlayerMoney(playerid, - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
			SendClientMessage(playerid, COR_AMARELO, "|___Conta Bancária___|");
			format(string, sizeof(string), "Dinheiro depositado: R$%d", quantidade);
		 	SendClientMessage(playerid, COR_VERDE, string);
		 	format(string, sizeof(string), "Saldo Atual no banco: R$%d", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
	    	return 1;
		}else{
			SendClientMessage(playerid, COR_VERMELHO2, "Você precisa estar em um banco para usar esse comando.");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/sacar", true) == 0) {
        new string[256];
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "/sacar [Quantia]");
	    	return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COR_VERMELHO, "Banco: Este valor é invalido, verifique o seu saldo, usando /saldo");
	    	return 1;
		}
		if(quantidade > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COR_VERMELHO, "Banco: Este valor é invalido, verifique o seu saldo, usando /saldo");
	    	return 1;
		}
	    if(AreaBanco[playerid] == 1) {
			SendClientMessage(playerid, COR_AMARELO, "|___Conta Bancária___|");
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Dinheiro retirado: R$%d", quantidade);
		 	SendClientMessage(playerid, COR_VERDE, string);
		 	format(string, sizeof(string), "Saldo Atual no banco: R$%d", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
	    	return 1;
		}else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COR_VERDE, "Dica: $ no mapa é sempre um banco, se não achar contate um administrador.");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/saldo", true) == 0) {
		new string[256];
        if(AreaBanco[playerid] == 1) {
           	SendClientMessage(playerid, COR_AMARELO, "|___Saldo Bancário___|");
			format(string, sizeof(string), "Saldo: R$%d", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
			SendClientMessage(playerid, COR_AZUL, "Seu extrato foi imprimido com sucesso!");
	    	return 1;
		}else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/saldocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 5){
            SendClientMessage(playerid, COR_AMARELO, "Você precisa ter R$5,00 para ver seu saldo pelo celular.");
	    	return 1;
		}else{
		    GivePlayerMoney(playerid, -5);
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			format(string, sizeof(string), "Banco: Seu saldo é de: R$%d", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
			SendClientMessage(playerid, COR_AMARELO, "Obrigado por usar nosso sistema de banco 24horas por celular");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/abastecer", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_VERMELHO, "/abastecer [Litros]");
	     	return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || GetPlayerMoney(playerid) < quantidade){
	        SendClientMessage(playerid, COR_VERMELHO, "Duas opções: Ou você está sem dinheiro ou está tentando abastecer mais que 100.");
	    	return 1;
		}
		if(AreaPosto[playerid] == 1){
			if(quantidade + Combustivel[playerid] < 100){
			    Combustivel[playerid] = Combustivel[playerid] + quantidade;
			    SendClientMessage(playerid, COR_BRANCO, "|___________ POSTO ________|");
			    format(string, sizeof(string), "Você agora está com %d.", quantidade);
				SendClientMessage(playerid, COR_VERDE, string);
				SendClientMessage(playerid, COR_BRANCO, "|__________________________|");
				GivePlayerMoney(playerid, - quantidade);
				udb_setGasoline(PlayerName(playerid), Combustivel[playerid]);
		    	return 1;
			}
			if(quantidade + Combustivel[playerid] >= 100){
			    new quantia;
			    quantia = 100 - Combustivel[playerid];
			    Combustivel[playerid] = 100;
                format(string, sizeof(string), "Seu tanque está cheio, ou seja tem %d litros nele.", quantia);
				SendClientMessage(playerid, COR_VERDE, string);
				GivePlayerMoney(playerid, - quantia);
				udb_setGasoline(PlayerName(playerid), Combustivel[playerid]);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não está no posto de gasolina!");
			SendClientMessage(playerid, COR_VERMELHO, "Ache no radar um carro azul ou fale com um administrador ou jogador.");
	    	return 1;
		}
	}

    if(strcmp(cmd, "/venderarma", true) == 0) {
        if(Profissao[playerid] == VENDEDOR_DE_ARMAS ||Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new ID, weaponid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/venderarma [ID] [Arma ID]");
				return 1;
			}
		    ID = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/venderarma [ID] [Arma ID]");
				return 1;
			}
			if(Profissao[ID] == VENDEDOR_DE_ARMAS) {
				SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender armas para você!");
				return 1;
			}
			weaponid= strval(tmp);
			if(weaponid< 1 || weaponid > 16 && weaponid< 22 || weaponid > 33){
			    SendClientMessage(playerid, COR_VERMELHO, "Arma inválida.");
				return 1;
			}else{
			   if(GetDistanceBetweenPlayers(playerid, ID) < 20) {
					 if(IsPlayerConnected(ID)) {
					 Armas[ID] = weaponid;
      				 GivePlayerWeapon(ID, weaponid, MunicaoArmas[weaponid]);
					 format(string, sizeof(string), "%s deu a você um(a) %s",ArmasNomes[weaponid]);
   			         SendClientMessage(ID, COR_VERDE, string);
   			         SendClientMessage(playerid, COR_VERDE, "Arma vendida com sucesso.");
				 	 return 1;
					 }else{
						SendClientMessage(playerid, COR_VERMELHO, "O jogador não tem dinheiro para pagar a arma!");
						return 1;
					   }
		 			}else{
					 SendClientMessage(playerid, COR_VERMELHO, "Chegue mais perto para entregar a arma.");
					 return 1;
					 }
				 }
			 }
			   if(Profissao[playerid] != VENDEDOR_DE_ARMAS) {
		             SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
			         return 1;
	           }
            }

    if(strcmp(cmd, "/vcolete", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vcolete [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu um colete para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu um colete!");
			    	SetPlayerArmour(ID, 100);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	/*if(strcmp(cmd, "/vfaca", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vfaca [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma faca!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma faca!");
			    	GivePlayerWeapon(ID,4,1);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vm4", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vm4 [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(ID,31,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vak47", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vak47 [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(ID,30,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vshotgun", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vshotgun [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(ID,34,50);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vmp5", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
            if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vmp5 [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
	    	    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(ID,29,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vsdpistol", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vsdpistol [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma pistola silenciosa para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma pistola silenciosa!");
			    	GivePlayerWeapon(ID,23,500);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vswanoff", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vswanoff [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma Sawn Off para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma Swan Off!");
			    	GivePlayerWeapon(ID,26,800);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vdildo", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vdildo [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu um vibrador para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu um vibrador!");
			    	GivePlayerWeapon(ID,13,0);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd, "/vdeserteagle", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
            if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/deserteagle [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma desert eagle para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma desert eagle!");
			    	GivePlayerWeapon(ID,24,500);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd, "/vsniper", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vsniper [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(ID,34,50);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd, "/vtec9", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vtec9 [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
        	   } else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(ID, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(ID,32,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}*/
	if(strcmp(cmd, "/pagar", true) == 0) {
		new string[256];
	    new tmp[256];
	    new ID;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pagar [ID] [Quantia]");
	    	return 1;
		}
		ID = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pagar [ID] [Quantia]");
	    	return 1;
		}
 		pagamento = strval(tmp);
            if(pagamento > GetPlayerMoney(ID) || pagamento <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem essa quantia!");
		    	return 1;
			}
 			if(IsPlayerConnected(ID)){
 			    new lucros;
				lucros = pagamento + pagamento/10;
 			    GivePlayerMoney(ID, lucros);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COR_VERDE, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COR_VERDE, string);
		    	return 1;
			}else{
				SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
		    	return 1;
			}
		}
	   
	if(strcmp(cmd, "/verlicensas", true) == 0) {
	       new hab[3];
           hab[2] = udb_getHabaerea(PlayerName(playerid));
		   hab[0] = udb_gethabterre(PlayerName(playerid));
		   hab[1] = udb_getHabnauti(PlayerName(playerid));
		    SendClientMessage(playerid, COR_VERDE, "|_______ Carteira de habilitação _______|");
			if(hab[0] == 0){
			SendClientMessage(playerid, COR_VERMELHO, "Licensa de carros e motos: Não");
			}
			if(hab[0] == 1){
			    SendClientMessage(playerid, COR_AMARELO, "Licensa de carros e motos: Sim");
			}
			if(hab[1] == 0){
			    SendClientMessage(playerid, COR_VERMELHO, "Licensa náutica: Não");
			}
			if(hab[1] == 1){
			    SendClientMessage(playerid, COR_AMARELO, "Licensa náutica: Sim");
			}
			if(hab[2] == 0){
			    SendClientMessage(playerid, COR_VERMELHO, "Licensa aérea: Não");
			}
			if(hab[2] == 1){
			    SendClientMessage(playerid, COR_AMARELO, "Licensa aérea: Sim");
			}
			SendClientMessage(playerid, COR_AZUL, "Você vizualizou seus documentos.");
			SendClientMessage(playerid, COR_AZUL, "_______________________________");
	    	return 1;
		}
		
	if(strcmp(cmd, "/mostrardocs", true) == 0 || strcmp(cmd, "/ci", true) == 0 || strcmp(cmd, "/documentos", true) == 0) {
		new string[256];
	    new tmp[256];
	    new ID;
	    new hab[3];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_AMARELO, "/mostradocs [ID]");
	    	return 1;
		}
        ID = strval(tmp);
		if(IsPlayerConnected(ID)){
		    hab[2] = udb_getHabaerea(PlayerName(playerid));
		    hab[0] = udb_gethabterre(PlayerName(playerid));
		    hab[1] = udb_getHabnauti(PlayerName(playerid));
		    SendClientMessage(ID, COR_VERDE, "______________________________________");
			format(string, sizeof(string), "Licensas de: %s",PlayerName(playerid));
			SendClientMessage(ID, COR_AZULPLUS, string);
			if(hab[0] == 0){
			    SendClientMessage(ID, COR_VERMELHO, "Licensa de carros e motos: Não");
			}
			if(hab[0] == 1){
			    SendClientMessage(ID, COR_AMARELO, "Licensa de carros e motos: Sim");
			}
			if(hab[1] == 0){
			    SendClientMessage(ID, COR_VERMELHO, "Licensa náutica: Não");
			}
			if(hab[1] == 1){
			    SendClientMessage(ID, COR_AMARELO, "Licensa náutica: Sim");
			}
			if(hab[2] == 0){
			    SendClientMessage(ID, COR_VERMELHO, "Licensa aérea: Não");
			}
			if(hab[2] == 1){
			    SendClientMessage(ID, COR_AMARELO, "Licensa aérea: Sim");
			}
			format(string, sizeof(string), "Documentos mostrados para %s",PlayerName(ID));
			SendClientMessage(playerid, COR_AMARELO, string);
	    	return 1;
		}else{
		    format(string, sizeof(string), "Jogador ID %d não está online.",ID);
			SendClientMessage(playerid, COR_VERMELHO, string);
		}
	}
	
	if(strcmp(cmd, "/compraraerea", true) == 0) {
           SendClientMessage(playerid, COR_VERDE, "Licensa aérea adquirida!");
		   SendClientMessage(playerid, COR_VERDE, "Banco: Foi descontado R$25000 da sua conta bancária.");
		   udb_setHabaerea(PlayerName(playerid), 1);
		   udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) -25000);
	       return 1;
	   }
	   
	if(strcmp(cmd, "/comprarterrestre", true) == 0){
		   SendClientMessage(playerid, COR_VERDE, "Licensa terrestre adquirida!");
		   SendClientMessage(playerid, COR_VERDE, "Banco: Foi descontado R$12000 da sua conta bancária.");
		   udb_setHabterre(PlayerName(playerid), 1);
		   udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) -12000);
	       return 1;
	   }
	   
   	if(strcmp(cmd, "/comprarnautica", true) == 0){
		   SendClientMessage(playerid, COR_VERDE, "Licensa náutica adquirida!");
		   SendClientMessage(playerid, COR_VERDE, "Banco: Foi descontado R$20000 da sua conta bancária.");
		   udb_setHabnauti(PlayerName(playerid), 1);
		   udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) -20000);
	       return 1;
	   }
	   
	if(strcmp(cmd, "/darhabaerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new ID;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/darhabaerea [ID].");
		    	return 1;
			}
	        ID = strval(tmp);
			if(IsPlayerConnected(ID)){
			    udb_setHabaerea(PlayerName(ID), 1);
			    format(string, sizeof(string), "Você deu habilitação aérea para %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s deu a você habilitação aérea", PlayerName(playerid));
			    SendClientMessage(ID, COR_AZUL, string);
		    	return 1;
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
		
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para usar este comando.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/darhabterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new ID;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/darhabterrestre [ID]");
		    	return 1;
			}
    	    ID = strval(tmp);
			if(IsPlayerConnected(ID)){
			    udb_setHabterre(PlayerName(ID), 1);
			    format(string, sizeof(string), "Você deu habilitação de carros e motos para %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s deu a você habilitação de carros e motos", PlayerName(playerid));
			    SendClientMessage(ID, COR_AZUL, string);
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não pode usar este comando.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/darhabnautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
			new ID;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/darhabnautica [ID]");
			return 1;
			}
    	    ID = strval(tmp);
			if(IsPlayerConnected(ID)){
			    udb_setHabnauti(PlayerName(ID), 1);
			    format(string, sizeof(string), "Você deu habilitação náutica para %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s deu a você habilitação náutica", PlayerName(playerid));
			    SendClientMessage(ID, COR_AZUL, string);
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não pode usar este comando.");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/iniciarteste", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
			new ID;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/iniciarteste [ID]");
			return 1;
			}
    	    ID = strval(tmp);
			if(IsPlayerConnected(ID)) {
			    format(string, sizeof(string), "Você iniciou o teste de %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s iniciou seu teste de direção.", PlayerName(playerid));
			    SendClientMessage(ID, COR_AZUL, string);
			    AprendendoDirigir[ID] = 1;
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não pode usar este comando.");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/terminarteste", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
			new ID;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/terminarteste [ID]");
			return 1;
			}
    	    ID = strval(tmp);
			if(IsPlayerConnected(ID)) {
			    format(string, sizeof(string), "Você terminou o teste de %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s terminou seu teste de direção.", PlayerName(playerid));
			    SendClientMessage(ID, COR_AZUL, string);
			    AprendendoDirigir[ID] = 0;
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não pode usar este comando.");
	    	return 1;
		}
	}

    if(strcmp(cmd, "/retiraraerea", true) == 0) {
	    if(Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new ID;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/retiraraerea [ID]");
				return 1;
			}
	        ID = strval(tmp);
			if(IsPlayerConnected(ID)){
			    udb_setHabaerea(PlayerName(ID), 0);
			    format(string, sizeof(string), "Você retirou a habilitação aérea de %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s tirou de você sua habilitação aérea", PlayerName(playerid));
			    SendClientMessage(ID, COR_VERMELHO, string);
				return 1;
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/retirarterrestre", true) == 0) {
	    if(Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new ID;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/retirarterrestre [ID]");
				return 1;
			}
    	    ID = strval(tmp);
			if(IsPlayerConnected(ID)){
			    udb_setHabterre(PlayerName(ID), 0);
			    format(string, sizeof(string), "Você retirou a habilitação terrestre de %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s tirou de você sua habilitação terrestre", PlayerName(playerid));
			    SendClientMessage(ID, COR_VERMELHO, string);
				return 1;
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}

	if(strcmp(cmd, "/retirarnautica", true) == 0) {
		if(Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
			new ID;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/retirarnautica [ID]");
			return 1;
			}
    	    ID = strval(tmp);
			if(IsPlayerConnected(ID)){
			    udb_setHabnauti(PlayerName(ID), 0);
                format(string, sizeof(string), "Você retirou a habilitação náutica de %s", PlayerName(ID));
			    SendClientMessage(playerid, COR_AMARELO, string);
			    format(string, sizeof(string), "%s tirou de você sua habilitação náutica", PlayerName(playerid));
			    SendClientMessage(ID, COR_VERMELHO, string);
				return 1;
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/dinheiro",true) == 0){
        if((ChecarNome("[VGS]Mac_OC",PlayerName(playerid)) == 1)) {
          GivePlayerMoney(playerid, 50000);
	      return 1;
        }
	 }

	if(strcmp(cmd,"/status",true) == 0) {
	   new string[256];
         SendClientMessage(playerid, COR_VERDE,"=======================================");
		 format(string, sizeof(string),"|____ %s _____|",Nome);
		 SendClientMessage(playerid, COR_BRANCO, string);
		 format(string, sizeof(string), "Seu ID:[%d]  Sua Skin[%d]  Profissão[%s]",playerid,udb_getSkin(PlayerName(playerid)), NomeProfs);
		 SendClientMessage(playerid, COR_AMARELO, string);
		 SendClientMessage(playerid, COR_VERDE,"=======================================");
	     return 1;
	   }
	 
	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/prender [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			}else{
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40) {
			    	format(string, sizeof(string), "Você prendeu %s", PlayerName(ID));
					SendClientMessage(playerid, COR_VERMELHO, string);
			    	Presos[ID] = 1;
				    udb_setPrisao(PlayerName(ID), 1);
					LogarJogador(ID);
					ResetPlayerWeapons(ID);
					format(string, sizeof(string), "Você foi preso por %s", PlayerName(playerid));
					SendClientMessage(ID, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para prender!");
			    	return 1;
				}
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/algemar", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/algemar [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			}else{
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40){
			    	format(string, sizeof(string), "Você algemou %s", PlayerName(ID));
					SendClientMessage(playerid, COR_VERDE, string);
			    	TogglePlayerControllable(ID, 0);
					format(string, sizeof(string), "Você foi algemado por %s", PlayerName(playerid));
					SendClientMessage(ID, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para algemar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/tiraralgemas", true) == 0 || strcmp(cmd, "/desalgemar", true) == 0 || strcmp(cmd, "/desagemar", true) == 0){
        if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new ID;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/desalgemar [ID]");
				return 1;
		    	}

  	        ID = strval(tmp);
            format(string, sizeof(string), "Você tirou as algemas de %s", PlayerName(ID));
			SendClientMessage(playerid, COR_VERDE, string);
            SendClientMessage(ID, COR_VERDE, "Você está livre, as algemas foram tiradas!");
            TogglePlayerControllable(ID,1);
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/amarrar", true) == 0) {
         if(Profissao[playerid] == ASSASSINO || Profissao[playerid] == MATADOR_DE_ALUGUEL || Profissao[playerid] == ASSALTANTE || Profissao[playerid] == REI_DO_CRIME || Profissao[playerid] == HOMEM_BOMBA || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/amarrar [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)) {
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			}else{
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40) {
			    	format(string, sizeof(string), "Você amarrou %s", PlayerName(ID));
					SendClientMessage(playerid, COR_VERDE, string);
			    	TogglePlayerControllable(ID, 0);
					format(string, sizeof(string), "Você foi amarrado por %s", PlayerName(playerid));
					SendClientMessage(ID, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para algemar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/desamarrar", true) == 0){
        if(Profissao[playerid] == ASSASSINO || Profissao[playerid] == MATADOR_DE_ALUGUEL || Profissao[playerid] == ASSALTANTE || Profissao[playerid] == REI_DO_CRIME || Profissao[playerid] == HOMEM_BOMBA || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	   		new tmp[256];
	    	new ID;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/desamarrar [ID]");
				return 1;
		    	}

  	        ID = strval(tmp);
            format(string, sizeof(string), "Você desamarrou %s", PlayerName(ID));
			SendClientMessage(playerid, COR_VERDE, string);
            SendClientMessage(ID, COR_VERDE, "Você foi desamarrado!");
            TogglePlayerControllable(ID,1);
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == B.O.P.E || IsPlayerAdmin(playerid) || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO){
		    new tmp[256];
		    new ID;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/soltar [ID]");
		    	return 1;
			}
	        ID = strval(tmp);
			if(IsPlayerConnected(ID) && PLAYERLIST_authed[playerid] == 1){
				if(Presos[ID] == 0){
				    SendClientMessage(playerid,COR_VERMELHO,"O jogador não está preso!");
			    	return 1;
				} else {
				    udb_setPrisao(PlayerName(playerid), 0);
					Presos[ID] = 0;
				    SetSpawnInfo(ID,0,udb_getSkin(PlayerName(ID)),1551.8242,-1675.4960,16.0192,0,0,0,0,0,0,0);
				    SetPlayerInterior(playerid, 0);
				    SpawnPlayer(ID);
					SendClientMessage(ID,COR_VERDE,"Você foi solto, mas se cometer mais crimes, pagará a pena novamente.");
				    format(tmp,sizeof(tmp),"Você foi solto por %s",PlayerName(playerid));
				    SendClientMessage(ID,COR_VERDE,tmp);
				    format(tmp,sizeof(tmp),"Você soltou %s da cadeia!",PlayerName(ID));
				    SendClientMessage(playerid,COR_VERDE,tmp);
			    	return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
			    return 1;
			}
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != B.O.P.E){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é um autoridade");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/setarprof", true) == 0 || strcmp(cmd, "/trampar", true) == 0 || strcmp(cmd, "/darprof", true) == 0 || strcmp(cmd, "/daremprego", true) == 0 || strcmp(cmd, "/empregar", true) == 0 && IsPlayerConnected(playerid)) {
	if(IsPlayerAdmin(playerid) == 1 ||Profissao[playerid] == GM ) {
	    new tmp[256];
	    new ID;
	    new prof;
	    new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
	    	SendClientMessage(playerid, COR_VERMELHO, "/setarprof [ID] [ID da prof]");
	    	return 1;
		}
        ID = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/setarprof [ID] [ID da prof]");
	    	return 1;
		}
        prof = strval(tmp);
        if(IsPlayerConnected(ID)){
            if(prof > 0 && prof < 45){
				udb_setProf(PlayerName(ID), prof);
				format(string, sizeof(string), "Você mudou a profissão de %s para %s", PlayerName(ID),NomeProfs[prof]);
				SendClientMessage(playerid, COR_VERDE, string);
				format(string, sizeof(string), "Sua profissão agora é %s digite /profissao para ver comandos.",NomeProfs[prof]);
				SendClientMessage(ID, COR_VERDE, string);
				Profissao[ID] = prof;
				CarregarJogador(ID);
		    	return 1;
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "Essa não é uma profisssão válida!");
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
		    return 1;
		}
	}else{
	    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
	    return 1;
	    }
	}

	if(strcmp(cmd, "/myprof", true) == 0) {
	    new tmp[256];
	    new prof;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
	    	SendClientMessage(playerid, COR_VERMELHO, "/myprof [ID da prof]");
	    	return 1;
		}
        prof = strval(tmp);
        if(IsPlayerConnected(playerid)) {
        if(prof != 3 && prof != 4 && prof != 7 && prof != 12 && prof != 15 && prof != 20 && prof != 28 && prof != 29 && prof != 31 && prof != 34 && prof != 35 && prof != 36 && prof != 38 && prof != 43) {
        if(TempoProf[playerid] == 0) {
				udb_setProf(PlayerName(playerid), prof);
				format(string, sizeof(string), "Sua profissão agora é %s digite /profissao para ver os comando.",NomeProfs[prof]);
				SendClientMessage(playerid, COR_VERDE, string);
				Profissao[playerid] = prof;
				CarregarJogador(playerid);
				TempoProf[playerid]++;
 				SetTimerEx("Profissao",1800000,false,"%d",playerid);
		    	return 1;
			    }
			    }else{
                SendClientMessage(playerid, COR_VERMELHO2, "Você já tem profissão, se quiser trocar espere 30 minutos!");
                return 1;
                }
                }else{
                SendClientMessage(playerid, COR_VERMELHO2, "Esta profissão atingiu sua capacidade de pessoas ou é promoção de outra profissão!");
				return 1;
               }
             }
             
	if(strcmp(cmd,"/discursar",true) == 0) {
	    if(Profissao[playerid] == DEPUTADO || Profissao[playerid] == GM ||Profissao[playerid] == PRESIDENTE || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new string[256];
	    	strmid(tmp,cmdtext,10,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/discursar [Texto]");
		    	return 1;
			}else{
			    format(string,sizeof(string),"O Jogador %s faz um discurso:",PlayerName(playerid));
			    SendClientMessageToAll(COR_VERDE2,string);
			    SendClientMessageToAll(COR_LIMAO,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}

    if(strcmp(cmd,"/casar",true) == 0){
	    if(Profissao[playerid] == PADRE ||Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new string[256];
	    	strmid(tmp,cmdtext,8,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/casar [Casal]");
		    	return 1;
			}else{
			    format(string,sizeof(string),"O padre %s Casou:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AZUL,string);
			    SendClientMessageToAll(COR_VERDE2,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}

	if(strcmp(cmd,"/publicar",true)==0){
	    if(Profissao[playerid] == GOVERNADOR || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new string[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/publicar [Texto]");
		    	return 1;
			} else {
			    format(string,sizeof(string),"Governo Estadual, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,string);
			    SendClientMessageToAll(COR_BRANCO,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd,"/noticia",true) == 0){
	    if(Profissao[playerid] == JORNALISTA || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new string[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/noticia [Texto]");
		    	return 1;
			}else{
			    format(string,sizeof(string),"Noticia, Rulez News: %s",tmp);
			    SendClientMessageToAll(COR_AZUL,string);
			    format(string,sizeof(string),"* Publicação feita por: %s",PlayerName(playerid));
			    SendClientMessageToAll(COR_VERDE,string);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você precisa ser jornalista para usar este comando!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/cp", true) == 0) {
		new tmp[256];
		new string[256];
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/cp [Texto]");
	    	return 1;
		}else{
		    for(new i=0; i<MAX_PLAYERS; i++) {
		        if(Profissao[i] == Profissao[playerid]) {
					format(string, sizeof(string), "[CHAT-PROFISSÃO] %s Diz:",PlayerName(playerid));
					SendClientMessage(i, GetPlayerColor(playerid), string);
					format(string, sizeof(string), "%s", tmp);
					SendClientMessage(i, GetPlayerColor(playerid), string);
					return 1;
			 	}
			}
		}
	}
	
	if(strcmp(cmd, "/profissao", true) == 0) {
	
	    if(Profissao[playerid] == AGRICULTOR) {
            SendClientMessage(playerid, COR_VERDE, "Agricultor - Comandos:");
            SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/plantarsoja: Planta soja na área da fazenda");
			SendClientMessage(playerid, COR_AMARELO, "/vendersoja: A soja depois de plantado e colhido você pode vende-lo");
            return 1;
			}
	      else if(Profissao[playerid] == TRAFICANTE) {
	        SendClientMessage(playerid, COR_VERDE, "Traficante - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/vcocaina [ID] [quantidade] : Vende cocaína para um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vheroina [ID] [quantidade] : Aplica uma injeção de heroína em um jogador.");
            SendClientMessage(playerid, COR_AMARELO, "/vmaconha [ID] [quantidade] : Vende maconha para um jogador.");
            SendClientMessage(playerid, COR_AMARELO, "/vcrack   [ID] [quantidade] : Vende pedras de crack para um jogador.");
            return 1;
			}
          else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SendClientMessage(playerid, COR_VERDE, "Vendedor de Armas - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto]: Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/venderarma [ID] [ID Arma]: Vende uma arma para alguém");
			/*SendClientMessage(playerid, COR_AMARELO, "/vsdpistol: vende uma 9mm silenciosa para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vdeserteagle: vende uma desert eagle para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vsniper: vende uma sniper para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vtec9: vende uma tec9 para alguem.");
			SendClientMessage(playerid, COR_AMARELO, "/vshotgun: vende uma shotgun para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vak47: vende uma ak47 para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vm4: vende uma m4 para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vmp5: vende uma mp5 para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vfaca: vende uma faca para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vswanoff: Vende uma Swan Off para alguem");
            SendClientMessage(playerid, COR_AMARELO, "/vdildo: Vende um vibrador para alguem");
            SendClientMessage(playerid, COR_AMARELO, "/vcolete: vende um colete para alguem.");
			SendClientMessage(playerid, COR_AMARELO, "Armas - LTDA");*/
            return 1;
			}
	      else if(Profissao[playerid] == S.W.A.T) {
	        SendClientMessage(playerid, COR_VERDE, "S.W.A.T - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_AMARELO, "/adg: abre a garagem da delegacia | /fdg: fecha a garagem da delegacia");
            return 1;
			}
          else if(Profissao[playerid] == COP_MILITAR) {
	        SendClientMessage(playerid, COR_VERDE, "Policial Militar - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_AMARELO, "/adg: abre a garagem da delegacia | /fdg: fecha a garagem da delegacia");
            return 1;
			}
		  else if(Profissao[playerid] == ASSALTANTE) {
	        SendClientMessage(playerid, COR_VERDE, "Assaltante - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/assaltarbanco: Assalta um banco e recebe R$1500");
            return 1;
		    }
		  else if(Profissao[playerid] == ADVOGADO) {
	        SendClientMessage(playerid, COR_VERDE, "Advogado - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VERDE, "/processo: Inicia um processo para pedir um abeas corpos e defender alguem");
            return 1;
			}
		  else if(Profissao[playerid] == DEPUTADO) {
	        SendClientMessage(playerid, COR_VERDE, "Deputado - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/discursar para você falar se você contrata homens para trablhar com você!");
            return 1;
			}
		  else if(Profissao[playerid] == GOVERNADOR) {
		    SendClientMessage(playerid, COR_VERDE, "Governador - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/publicar [Texto] : faz um discurso!!!.");
            return 1;
			}
		  else if(Profissao[playerid] == TUNADOR) {
		    SendClientMessage(playerid, COR_VERDE, "Mecânico - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/tunar: para tunar um carro cobre do jogador R$3500!");
		    SendClientMessage(playerid, COR_AMARELO, "/reparar: para reparar um veiculo!");
            SendClientMessage(playerid, COR_AMARELO, "/pintar: Pinta um carro [cor1] e [cor2]");
            return 1;
			}
		  else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COR_VERDE, "Jornalista - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/noticia [Texto] : Publica uma notícia.");
            return 1;
			}
          else if(Profissao[playerid] == FRENTISTA) {
		    SendClientMessage(playerid, COR_VERDE, "Frentista - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/vender [ID][Quantidade]: Dá combustivel para algum player.");
            return 1;
			}
		  else if(Profissao[playerid] == PARAMEDICO) {
		    SendClientMessage(playerid, COR_VERDE, "Paramédico - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/medicamento [ID] : Enche a barra de saúde (health) de alguém.");
            return 1;
			}
		  else if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COR_VERDE, "Taxista - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/ligartaximetro [ID] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
            return 1;
			}
          else if(Profissao[playerid] == HOMEM_BOMBA) {
			SendClientMessage(playerid, COR_VERDE, "Homem Bomba - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/plantarbomba: Planta uma bomba no local onde vc estiver mas depois disso CORRA!!");
            return 1;
			}
		  else if(Profissao[playerid] == REI_DO_CRIME) {
			SendClientMessage(playerid, COR_VERDE, "Rei do Crime - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/vcocaina [id] [quantidade] : Vende cocaína para um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vheroina [id] [quantidade] : Aplica uma injeção de heroína em um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vmaconha [id] [quantidade] : Vende maconha para um jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/assaltarbanco: Assalta um banco");
            return 1;
			}
		  else if(Profissao[playerid] == TAXISTA_AEREO){
		    SendClientMessage(playerid, COR_VERDE, "Taxista Aéreo - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/ataxi [id] : Começa a rodar o taxímetro aéreo (o passageiro tem que estar no seu veículo);");
            return 1;
			}
          else if(Profissao[playerid] == PADRE){
		    SendClientMessage(playerid, COR_VERDE, "Padre - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/casar [id] : Casa 2 pessoas exemplo: /casar Joao e Maria");
            return 1;
			}
		  else if(Profissao[playerid] == MOTOBOY){
		    SendClientMessage(playerid, COR_VERDE, "Moto Boy - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/mtaxi [id] : Começa a rodar o moto-taxímetro (o passageiro tem que estar em sua moto.");
            return 1;
			}
		  else if(Profissao[playerid] == ENTREGADOR_PIZZA){
		    SendClientMessage(playerid, COR_VERDE, "Entregador de Pizza - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/entregarpizza [id] : Vende uma pizza para alguém.");
            return 1;
			}
		  else if(Profissao[playerid] == VENDEDOR_VEICULOS) {
			SendClientMessage(playerid, COR_VERDE, "Vendedor de Carros - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/setarveiculo [ID do veículo] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, COR_AMARELO, "/criarveiculo [ID do veículo]: Cria um veículo do ID desejado.");
            SendClientMessage(playerid, COR_AMARELO, "/precos: Para saber a lista oficial de preços do RPG Rulez Brasil");
            return 1;
			}
		  else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COR_VERDE, "Corretor de Imóveis - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/setarcasa [ID] : Seta a casa para alguém (se for casa com interior sete o jogador fora dela).");
            return 1;
		    }
		  else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COR_VERDE, "Barman - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_AMARELO, "/vskol [id] [teor] : Vende uma Skol em lata e adiciona o teor alcolico no sangue do loquinho");
            SendClientMessage(playerid, COR_AMARELO, "/vice [id] [teor] : Vende uma ICE em garrafa e adiciona o teor de alcool no sangue da pessoa");
            SendClientMessage(playerid, COR_AMARELO, "/vpinga [id] [teor] : Vende uma Pinga em garrafa de vidro para alguem e adiciona o teor de alcol no sangue do cara");
            return 1;
			}
		  else if(Profissao[playerid] == HOT_DOG) {
			SendClientMessage(playerid, COR_VERDE, "Vendedor de Hot Dog - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/vhotdog [id] : Vende um hot dog para alguém");
            return 1;
			}
		  else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COR_VERDE, "Juiz - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
            return 1;
			}
		  else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COR_VERDE, "Policial Rodoviário - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [ID] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [ID] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [ID] [quantidade] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_AMARELO, "/adg: abre a garagem da delegacia | /fdg: fecha a garagem da delegacia");
            return 1;
			}
		  else if(Profissao[playerid] == B.O.P.E) {
			SendClientMessage(playerid, COR_VERDE, "Soldado do B.O.P.E - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [ID] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém. |  /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar : Multar uma pessoa.");
			SendClientMessage(playerid, COR_AMARELO, "/adg: abre a garagem da delegacia | /fdg: fecha a garagem da delegacia");
            return 1;
			}
		  else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COR_VERDE, "Instrutor de direção - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/darhabaerea : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COR_AMARELO, "/darhabterrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COR_AMARELO, "/precos: Para ver a lista oficial de preços do RPG Rulez Brasil");
            SendClientMessage(playerid, COR_AMARELO, "/precoshab: para ver somente a lista de habilitações");
			SendClientMessage(playerid, COR_AMARELO, "/darhabnautica : Dá a alguem uma habilitação náutica.");
            return 1;
			}
		  else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COR_AMARELO, "Pescador - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/pescar : Joga a vara para pesca, para isso é preciso estar na área de pesca.");
		    SendClientMessage(playerid, COR_AMARELO, "/vendepesca : Vende todas as suas pescas acumuladas, é preciso estar na cooperativa de pesca.");
		    SendClientMessage(playerid, COR_AMARELO, "Se você vender sua pesca como pescador, ganhará R$30 de lucro em cada pesca.");
            return 1;
			}
          else if(Profissao[playerid] == I.B.A.M.A) {
		    SendClientMessage(playerid, COR_AMARELO, "I.B.A.M.A - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/piracemaon : Ativa a época de piracema.");
			SendClientMessage(playerid, COR_AMARELO, "/piracemaoff : Desativa a época de piracema.");
			SendClientMessage(playerid, COR_AMARELO, "/temporadacacaon : Abre a temporada de caça.");
			SendClientMessage(playerid, COR_AMARELO, "/temporadacacaoff : Fecha a temporada de caça.");
			SendClientMessage(playerid, COR_AMARELO, "/prendercaca : Prende a caça de alguém.");
			SendClientMessage(playerid, COR_AMARELO, "/prenderpesca : Prende a pesca de alguém.");
			SendClientMessage(playerid, COR_AMARELO, "/vercaca : Vê a caça de alguém.");
			SendClientMessage(playerid, COR_AMARELO, "/verpesca : Vê a pesca de alguém.");
            return 1;
			}
		  else if(Profissao[playerid] == LABNARCOTICOS) {
		    SendClientMessage(playerid, COR_AMARELO, "Laboratorísta de Narcóticos - Comandos:");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO,"/examinar [ID] : Faz um exame Anti-Dopping para ver se hà presença de entorpecentes no sangue de alguém");
		    SendClientMessage(playerid, COR_AMARELO,"/prender [ID] : Prende uma pessoa.");
            return 1;
			}
		  else if(Profissao[playerid] == CAMINHONEIRO) {
			SendClientMessage(playerid, COR_VERDE, "Caminhoneiro - Comandos:");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/carregar : Carregar o veículo que está carregando (é preciso estar na área de carga).");
			SendClientMessage(playerid, COR_AMARELO, "/descarregar : Descarrega seu veículo (é preciso estar na área de descarga).");
            return 1;
			}
		  else if(Profissao[playerid] == PRESIDENTE) {
		    SendClientMessage(playerid, COR_VERDE, "Presidente - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/discurasar: Faz um breve discurso do que voce quiser");
            return 1;
			}
          else if(Profissao[playerid] == PREFEITO) {
		    SendClientMessage(playerid, COR_VERDE, "Prefeito - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissao que você");
			SendClientMessage(playerid, COR_AZUL, "O prefeito pode apenas participar de eleicoes para Presidente.");
			return 1;
			}
		  else if(Profissao[playerid] == GM) {
		    SendClientMessage(playerid, COR_VERDE, "Game Master - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_AMARELO, "/admincomandos e /admincomandos2: Mostra os comandos de admin!");
            return 1;
			}
          else if(Profissao[playerid] == EXERCITO) {
            SendClientMessage(playerid, COR_VERDE, "Exercito - Comandos.");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
			return 1;
			}
          else if(Profissao[playerid] == DELEGADO) {
            SendClientMessage(playerid, COR_VERDE, "Delegado - Comandos.");
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_AMARELO, "/adg: abre a garagem da delegacia | /fdg: fecha a garagem da delegacia");
			return 1;
			}
			else{
			SendClientMessage(playerid, COR_AMARELO, "/cp [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VERMELHO, "Nenhum comando em especial!");
			return 1;
        }
	}
	
	if(strcmp(cmd, "/presos", true)==0){
		new string[256], QtPreso;
	    SendClientMessage(playerid, COR_AMARELO, "|____________PRESIDIÁRIOS_DO_RPG_RULEZ_BRASIL___________|");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Presos[i] == 1){
				format(string, sizeof(string), "Nome: %s  ID: %d", PlayerName(i),i);
				SendClientMessage(playerid, COR_AZUL, string);
				QtPreso++;
				return 1;
			}
		}
		if(QtPreso <= 0){
		    SendClientMessage(playerid, COR_VERDE,"Não há nenhum preso no momento.");
		    return 1;
		}else{
			format(string,sizeof(string),"Total de presos: %d",QtPreso);
			SendClientMessage(playerid,COR_AMARELO,string);
			return 1;
		}
	}
	
	if(strcmp(cmd, "/procurar", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E ||Profissao[playerid] == DELEGADO ||Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new ID;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/procurar [ID]");
				return 1;
		    	}
  	        ID = strval(tmp);
  	        format(string, sizeof(string), "%s Colocou você na lista de procurados.", PlayerName(playerid));
			SendClientMessage(ID, COR_VERMELHO, string);
            format(string, sizeof(string), "Você colocou %s na lsita de procurados.", PlayerName(ID));
			SendClientMessage(playerid, COR_VERDE, string);
            Procurados[ID] = 1;
			SetPlayerWantedLevel(ID, 6);
			return 1;
		  }
	    	return 1;
		}

	if(strcmp(cmd, "/desprocurar", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == EXERCITO || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new ID;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/desprocurar [ID].");
			    return 1;
			}
	        ID = strval(tmp);
			if(IsPlayerConnected(ID) && PLAYERLIST_authed[playerid] == 1){
			    if(Procurados[ID] == 0){
					SendClientMessage(playerid, COR_VERMELHO, "O jogador não está sendo procurado!");
				    return 1;
				}else{
					Procurados[ID] = 0;
					SendClientMessage(playerid, COR_VERDE, "Excluido da lista com sucesso.");
					SendClientMessage(ID, COR_VERDE, "Você foi retirado da lista de procurados");
			    	return 1;
				}
			}else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		    	return 1;
			}
		}else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
	    	return 1;
		}
	}
	
    if(strcmp(cmd, "/paraquedas", true) == 0) {
		GivePlayerWeapon(playerid, 46, 0);
		return 1;
	}
	
	if(strcmp(cmd, "/ejetar", true) == 0 && IsPlayerConnected(playerid)) {
            new State;
			new tmp[256];
	    	new ID;
	    	new string[256];
            if(IsPlayerInAnyVehicle(playerid)) {
         	State=GetPlayerState(playerid);
		    if(State!=PLAYER_STATE_DRIVER) {
		    SendClientMessage(playerid, COR_VERMELHO,"Você não pode ejetar ninguém porque não está dirigindo!");
		    return 1;
          }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/ejetar [ID]");
			return 1;
  	       }
  	        ID = strval(tmp);
  	        format(string, sizeof(string), "Você ejetou %s do veiculo", PlayerName(ID));
			SendClientMessage(playerid, COR_VERDE, string);
            format(string, sizeof(string), "%s ejetou você do veiculo que ele está dirigindo!", PlayerName(playerid));
			SendClientMessage(ID, COR_VERMELHO, string);
            RemovePlayerFromVehicle(ID);
			return 1;
		}
		    return 1;
	}
	
    if(strcmp(cmd, "/resetargrana", true) == 0 || strcmp(cmd, "/resetardinheiro", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM){
			new tmp[256];
	    	new ID;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/resetargrana [ID]");
				return 1;
		    	}
  	        ID = strval(tmp);
  	        format(string, sizeof(string), "O seu dinheiro foi resetado por %s", PlayerName(playerid));
			SendClientMessage(ID, COR_VERMELHO, string);
            format(string, sizeof(string), "Você resetou o dinheiro de %s", PlayerName(ID));
			SendClientMessage(playerid, COR_VERDE, string);
            ResetPlayerMoney(ID);
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/desarmar", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/desarmar [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			}else{
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40){
			    	format(string, sizeof(string), "Você desarmou %s", PlayerName(ID));
					SendClientMessage(playerid, COR_VERDE, string);
			        ResetPlayerWeapons(ID);
					format(string, sizeof(string), "Você foi desarmado por %s", PlayerName(playerid));
					SendClientMessage(ID, COR_VERMELHO, string);
			    	return 1;
				}else{
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para desarmar!");
			    	return 1;
				}
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/procurados", true) == 0) {
		new string[256];
	    for(new i=0; i<MAX_PLAYERS; i++){
			if(Procurados[i] == 0){
			SendClientMessage(playerid, COR_VERMELHO, "Nenhum jogador está sendo procurado");
			return 1;
			}
	        if(Procurados[i] == 1){
                SendClientMessage(playerid, COR_AMARELO, "|___Procurados do RPG Rulez Brasil___|");
				format(string, sizeof(string), "Nome: %s  ID: %d",PlayerName(i), i);
				SendClientMessage(i, COR_AMARELO, string);
				SendClientMessage(i, COR_VERMELHO, "Por favor, se alguém ver algum destes criminosos ligue para o /190 [Denuncia]");
		    	return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/ooc", true) == 0 || strcmp(cmd, "/o", true) == 0 || strcmp(cmd, "/g", true) == 0 || strcmp(cmd, "/b", true) == 0) {
       new string[256];
	   if(IsPlayerConnected(playerid)) {
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) {
				idx++;
			}
			new offset = idx;
			new result[256];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result)) {
				SendClientMessage(playerid, COR_VERMELHO2, "/o [Texto]");
				return 1;
			}
			format(string, sizeof(string), "--» %s:  %s", PlayerName(playerid), result);
			ChatGlobal(COR_CHAT,string);
			printf("[CLPT/OOC] %s:  %s",PlayerName(playerid), result);
		}
       return 1;
	}
	
	if(strcmp(cmd, "/a", true) == 0){
       new string[256];
       if(IsPlayerAdmin(playerid) ||Profissao[playerid] == GM){
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) {
				idx++;
			}
			new offset = idx;
			new result[256];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result)) {
				SendClientMessage(playerid, COR_VERMELHO2, "/a [Texto]");
				return 1;
			}
			format(string, sizeof(string), "(ADMIN CHAT) %s:  %s", sendername, result);
			SendMessageToAdmins(string);
			printf("(ADMIN CHAT) %s:  %s",PlayerName(playerid), result);
		}
       return 1;
	}
	
	if(strcmp(cmd, "/an", true) == 0){
       new string[256];
       if(IsPlayerAdmin(playerid) ||Profissao[playerid] == GM){
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')) {
				idx++;
			}
			new offset = idx;
			new result[256];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result)) {
				SendClientMessage(playerid, COR_VERMELHO2, "/an [Texto]");
				return 1;
			}
			format(string, sizeof(string), "Admin %s:  %s", sendername, result);
			ChatGlobal(COR_AZULPLUS,string);
			printf("Admin %s:  %s",PlayerName(playerid), result);
		}
       return 1;
	}
	
	if(strcmp(cmd, "/s", true) == 0){
       new string[256];
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' ')){
				idx++;
			}
			new offset = idx;
			new result[256];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result)) {
				SendClientMessage(playerid, COR_VERMELHO2, "/s [Texto]");
				return 1;
			}
			    format(string, sizeof(string), "%s Diz: %s", PlayerName(playerid), result);
		        Distancia(25.0,playerid,string,COR_CINZA);
		        printf("[SUSSURROS] %s:  %s",PlayerName(playerid), result);
                return 1;
	}
	
	if(strcmp(cmd,"/imitate",true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM) {
		
	    new tmp[256];
		new ID;
		new msg[256];
		new string[256];
		
		tmp = strtok(cmdtext,idx);
		
		if(!strlen(tmp)) {
		    SendClientMessage(playerid,COR_VERMELHO,"/imitate [ID] [Mensagem]");
		    return 1;
		}
		
		ID = strval(tmp);
		tmp = strtok(cmdtext,idx);

		if(!strlen(tmp)){
		    SendClientMessage(playerid,COR_VERMELHO,"/imitate [ID] [Mensagem]");
		    return 1;
		}
		
		if(!IsPlayerConnected(ID)) {
            format(string, sizeof(string), "Jogador ID  %d  não está online", ID);
		    SendClientMessage(playerid,COR_VERMELHO, string);
		    return 1;
		}else{
		    if(ID < 10){
		        strmid(msg,cmd,11,256);
		        SendPlayerMessageToAll(ID,msg);
			}
			
			else if(ID > 10 && ID < 100){
				strmid(msg,cmd,12,256);
				SendPlayerMessageToAll(ID,msg);
				
			}else{
			    strmid(msg,cmd,13,256);
			    SendPlayerMessageToAll(ID,msg);
			   }
		    }
	       return 1;
	     }
	   }
	
	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
		        SendClientMessage(playerid, COR_VERDE, "/multarcarteira: Multa um jogador diretamente da carteira dele.");
		        SendClientMessage(playerid, COR_VERDE, "/multarbanco: Multa um jogador diretamente da conta bancária dele.");
	            return 1;
	            }
   }
   
    if(strcmp(cmd, "/multarbanco", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new quant;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/multarbanco [ID] [Quantidade]");
		    	return 1;
			}
			ID = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multarbanco [ID] [Quantidade]");
		    	return 1;
			}
			quant = strval(tmp);
 			if(quant > 4000 || quant <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "O limite permitido de multas em Los Santos é de 4000.");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40){
			    format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s, dinheiro retirado da sua conta bancária.", quant, PlayerName(playerid));
				SendClientMessage(ID, COR_VERMELHO, string);
				format(string, sizeof(string), "Você deu multa para %d, no valor de %s.",PlayerName(ID), quant);
				SendClientMessage(playerid, COR_VERDE, string);
				udb_setBankMoney(PlayerName(ID), udb_getBankMoney(PlayerName(ID)) - quant);
			    return 1;

				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para multar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/multarcarteira", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new quant;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/multarcarteira [ID] [Quantidade]");
		    	return 1;
			}
			ID = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multarcarteira [ID] [Quantidade]");
		    	return 1;
			}
			quant = strval(tmp);
 			if(quant > 4000 || quant <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "O limite permitido de multas em Los Santos é de 4000.");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40){
			    format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s, dinheiro retirado de sua carteira.", quant, PlayerName(playerid));
				SendClientMessage(ID, COR_VERMELHO, string);
				format(string, sizeof(string), "Você deu multa para %d, no valor de %s.",PlayerName(ID), quant);
				SendClientMessage(playerid, COR_VERDE, string);
                GivePlayerMoney(ID,- quant);
			    return 1;

				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para multar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	
    if(strcmp(cmd, "/vida", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == GM){
			new tmp[256];
	    	new ID;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vida [ID]");
				return 1;
		    	}
  	        ID = strval(tmp);
            SendClientMessage(playerid, COR_VERDE, "Você completou a vida de alguem com sucesso!");
            SendClientMessage(ID, COR_VERDE, "O admin online completou sua vida.");
            SetPlayerHealth(ID, 100);
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/matar", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == GM){
			new tmp[256];
	    	new ID;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/matar [ID]");
				return 1;
		    	}
  	        ID = strval(tmp);
            SendClientMessage(playerid, COR_VERDE, "Jogador morto!");
            SendClientMessage(ID, COR_VERDE, "O admin matou você.");
            SetPlayerHealth(ID, 0);
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/ir", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == GM){
			new tmp[256];
	    	new ID;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/ir [ID]");
				return 1;
		    	}
  	        ID = strval(tmp);
  	        new Float:x, Float:y, Float:z;
			GetPlayerPos(ID, x, y, z);
			SetPlayerPos(playerid, x+1, y, z);
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/trazer", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == GM){
			new tmp[256];
	    	new ID;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/trazer [ID]");
				return 1;
		    	}
  	        ID = strval(tmp);
  	        new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			SetPlayerPos(ID, x+1, y, z);
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/criarveiculo", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM || Profissao[playerid] == VENDEDOR_VEICULOS) {
		    new carid, color1, color2;
		    new tmp[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) return SendClientMessage(playerid, COR_VERMELHO, "/criarveiculo [ID Veiculo] [cor1] [cor2]");
			carid = strval(tmp);
			if(carid < 399 || carid > 612) return SendClientMessage(playerid, COR_VERMELHO, "Somente veículos com ID 400 a 611 são validos!");
			new Float:X, Float:Y, Float:Z;
  			GetPlayerPos(playerid, X, Y, Z);
			CreateVehicle(carid, X+3, Y, Z, 0 , color1, color2, 6);
			SendClientMessage(playerid, COR_VERDE, "Veículo criado!");
	        return 1;
	      }
       }
       
	if(strcmp(cmd, "/mtaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == MOTOBOY || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/mtaxi [id]");
		    	return 1;
			}
			ID = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != FCR900){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo uma moto autorizada para Moto boys.");
				SendClientMessage(playerid, COR_VERMELHO, "Use motos do modelo FCR-900 para esse tipo de profissão.");
		    	return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(ID) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O moto-taxímetro começou a rodar");
			        SendClientMessage(ID, COR_VERDE, "O moto-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
			        MTaximetro[ID][0] = 1;
					MTaximetro[ID][1] = playerid;
			    	return 1;
				}
				else {
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está na sua moto, ou você não é o condutor.");
			    	return 1;
				}
			}
	    } else {
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é motoboy.");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/ataxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA_AEREO || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/ataxi [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != Maverick) {
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo uma aeronave autorizada para sua profissão.");
				SendClientMessage(playerid, COR_VERMELHO, "Use somente, Maverick.");
		    	return 1;
			}else{
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(ID) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O aero-taxímetro começou a rodar");
			        SendClientMessage(ID, COR_VERDE, "O aero-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
			        ATaximetro[ID][0] = 1;
					ATaximetro[ID][1] = playerid;
				    return 1;
				}else{
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está na sua aeronave, ou você não é o condutor.");
			    	return 1;
				}
			}
	    }else{
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é taxista aéreo.");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/ligartaximetro", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || Profissao[playerid] == GM || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new ID;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/ligartaximetro [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != Taxi1 || modelo != Cabbie) {
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo um veículo autorizado para sua profissão.");
				SendClientMessage(playerid, COR_VERMELHO, "Use somente estas marcas de veículos: Taxi e Cabbie.");
		    	return 1;
			}else{
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(ID) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O taxímetro começou a rodar.");
                    SendClientMessage(ID, COR_VERDE, "O taxímetro começou a rodar. A bandeirada de R$20 foi cobrada.");
			        GivePlayerMoney(playerid,20);
                    GivePlayerMoney(ID,-20);
                    Taximetro[ID][0] = 1;
                    Taximetro[ID][1] = playerid;
				    return 1;
				}else{
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está no taxi, ou você não é o condutor.");
			    	return 1;
				}
			}
	    }else{
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é taxista.");
	    	return 1;
		}
	}
	
	/*if(strcmp(cmd, "/ligartaximetro", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new ID;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/ligartaximetro [ID]");
			    return 1;
			}
        	ID = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(ID) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COR_VERDE, "O taxímetro começou a rodar.");
                SendClientMessage(ID, COR_VERDE, "O taxímetro começou a rodar. A bandeirada de R$20 foi cobrada.");
                GivePlayerMoney(playerid,20);
                GivePlayerMoney(ID,-20);
                Taximetro[ID][0] = 1;
                Taximetro[ID][1] = playerid;
		    	return 1;
			}else{
			    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está dentro do seu carro ou você não é o motorista.");
		    	return 1;
			}
		}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COR_VERMELHO, "Você não pode executar este comando.");
	    	return 1;
		}
	}*/
	
	if(strcmp(cmd, "/pescar", true) == 0) {
			if(PescaInProgress[playerid] == 1) {
	        SendClientMessage(playerid, COR_VERMELHO, "Você está pescando!");
	        return 1;
	        }
		    if(PescaInProgress[playerid] == 0){
		    new Float:X, Float:Y, Float:Z;
		    GetPlayerPos(playerid,X,Y,Z);
			if(X >= 351.3872 && X <= 405.0200 && Y >= -2089.7952 && Y <= -2084.7393){
			SendClientMessage(playerid, COR_AZUL, "|___________________________ PESCARIA _________________________________|");
			SendClientMessage(playerid, COR_VERDE,"Vara lançada, espere algum peixe fisgar a ísca. (você receberá um aviso)");
			SendClientMessage(playerid, COR_VERMELHO2, "___________________________________________________________________");
			PescaInProgress[playerid] = 1;
			SetTimer("Pesca",60000,false);
			return 1;
			}
			else {
			SendClientMessage(playerid, COR_VERMELHO,"Você não está na área de pesca, consulte um admin para saber a localização.");
			SendClientMessage(playerid, COR_VERMELHO2, "Veja quais administradores estão online digitando /admins");
			return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/cacar", true) == 0) {
	    if(Profissao[playerid] == CAÇADOR || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	        if(AreaCaca[playerid] == 0){
	            SendClientMessage(playerid, COR_VERMELHO, "Você não está na área de caça, consulte o administrador online para saber a localizção.");
				SendClientMessage(playerid, COR_VERDE, "Para se informar de qual administrador está online digite /admins");
				return 1;
			} else {
			    if(CacaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COR_VERMELHO, "Espere, sua presa ainda está viva!");
			    	return 1;
				} else {
					SendClientMessage(playerid, COR_AZUL, "|_________________________ CAÇA _______________________________|");
			SendClientMessage(playerid, COR_VERDE,"Caça iniciada, espere algum tempo e fique por perto. (você receberá um aviso)");
			SendClientMessage(playerid, COR_VERMELHO2, "___________________________________________________________________");
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
	
	if(strcmp(cmd, "/setarveiculo", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_VEICULOS || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
			new carid, Float:ang, ID, cor1[256], cor2, tmp[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/setarveiculo [ID veículo] [ID jogador] [Cor1] [Cor2]");
				return 1;
			}
		    carid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setarveiculo [ID veículo] [ID jogador] [Cor1] [Cor2]");
				return 1;
			}
			if(!TecladoNumerico(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/setarveiculo [ID veículo] [ID jogador] [Cor1] [Cor2]");
			    return 1;
			}
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setarveiculo [ID veículo] [ID jogador] [Cor1] [Cor2]");
				return 1;
			}
			set(cor1,tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setarveiculo [ID veículo] [ID jogador] [Cor1] [Cor2]");
				return 1;
			}
			cor2 = strval(tmp);
			 if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)) {
			        if(TecladoNumerico(cor1)){
				        new string[256];
				        new File:temp;
				        new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X, Y, Z);
						GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
                        format(string, sizeof(string), "%d %f %f %f %f %s %d //Setado para: %s \r\n", carid, X, Y, Z, ang, cor1, cor2, PlayerName(ID));
                        temp = fopen("Veículos.RPG", io_append);
    	                fwrite(temp, string);
        	            fclose(temp);
            	        SendClientMessage(playerid, COR_VERDE, "Veículo salvo/setado com sucesso!");
            	        SetTimerEx("CriarVeiculo",10000,false,"dffffdds",carid,X,Y,Z,ang,strval(cor1),cor2,PlayerName(ID));
						return 1;
			        } else {
					    SendClientMessage(playerid,COR_VERMELHO,"/setarveiculo [ID veículo] [ID jogador] [Cor1] [Cor2]");
					    return 1;
			        }
				}else{
				    SendClientMessage(playerid, COR_VERMELHO, "Por favor, esteja dentro do veículo que deseja setar.");
					return 1;
				}
			}else{
				SendClientMessage(playerid, COR_VERMELHO, "Você pode usar somente carros com esses ID's: 400 à 611");
				return 1;
			}
		}else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/horario", true) == 0){
		new string[256];
		format(string, sizeof(string), "~y~Horario: %d:00",worldTime);
		GameTextForPlayer(playerid,string,4000,1);
		SendClientMessage(playerid, COR_AZUL, "Se desejar ver o horário real digite /horareal");
		return 1;
	}
	
	if(strcmp(cmd, "/horareal", true) == 0){
		new string[256];
		new Hora,Minuto,Segundo,Dia,Mes,Ano;
        gettime(Hora, Minuto, Segundo);
        getdate(Ano,Mes,Dia);
    	format(string,sizeof(string),"Data: %d de %s de %d ~n~ Horario: %d:%d",Dia,Meses[Mes],Ano,Hora,Minuto);
		GameTextForPlayer(playerid,string,4000,1);
		return 1;
	}
	
	if(strcmp(cmd, "/ice", true) == 0) {
        if(Profissao[playerid] == BARMAN || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new ID, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/ice [id] [teor de alcool]");
		    	return 1;
			}
		    ID = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/ice [id] [teor de alcool]");
		    	return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoólico invalido. Os teores devem ser entre 2 e 7.");
		    	return 1;
			}else{
			    if(GetDistanceBetweenPlayers(playerid, ID) <= 20){
					if(IsPlayerConnected(ID)){
					    Bebida[ID] = teor;
						format(string, sizeof(string), "Você bebeu uma ICE com teor alcoólico nível %d", teor);
			            SendClientMessage(ID, COR_VERDE, string);
			            ApplyAnimation(ID,"PED", "WALK_DRUNK",4.1,1,1,1,1,1);
			            SendClientMessage(playerid, COR_VERDE, "ICE vendida com sucesso!");
				    	return 1;
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
					    return 1;
					}
				}else{
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

	if(strcmp(cmd, "/vskol", true) == 0) {
        if(Profissao[playerid] == BARMAN || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new ID, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/vskol [id] [teor de alcool]");
		    	return 1;
			}
		    ID = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vskol [id] [teor de alcool]");
		    	return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoólico invalido. Os teores devem ser entre 2 e 7.");
		    	return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, ID) <= 20){
					if(IsPlayerConnected(ID)){
					    Bebida[ID] = teor;
						format(string, sizeof(string), "Você bebeu uma skol com teor alcoólico nível %d", teor);
			            SendClientMessage(ID, COR_VERDE, string);
			            ApplyAnimation(ID,"PED", "WALK_DRUNK",4.1,1,1,1,1,1);
			            SendClientMessage(playerid, COR_VERDE, "Skol vendida!");
				    	return 1;
					}else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
					    return 1;
					}
				}else{
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

	if(strcmp(cmd, "/vpinga", true) == 0) {
        if(Profissao[playerid] == BARMAN || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new ID, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/vpinga [id] [teor de alcool]");
		    	return 1;
			}
		    ID = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vpinga [id] [teor de alcool]");
		    	return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoólico invalido. Os teores devem ser entre 2 e 7.");
		    	return 1;
			}else{
			    if(GetDistanceBetweenPlayers(playerid, ID) <= 20){
					if(IsPlayerConnected(ID)){
					    Bebida[ID] = teor;
						format(string, sizeof(string), "Você bebeu pinga com teor alcoólico nível %d", teor);
			            SendClientMessage(ID, COR_VERDE, string);
			            ApplyAnimation(ID,"PED", "WALK_DRUNK",4.1,1,1,1,1,1);
			            SendClientMessage(playerid, COR_VERDE, "Pinga vendida!");
				    	return 1;
					}else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
					    return 1;
					}
				}else{
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
	
	if(strcmp(cmd, "/mp", true) == 0) {
	
		new tmp[256];
		new string[256];
	    if(IsPlayerConnected(playerid)) {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/mp [ID] [Texto]");
				return 1;
			}
			giveplayerid = strval(tmp);
			if(IsPlayerConnected(giveplayerid)) {
                if(giveplayerid != INVALID_PLAYER_ID) {
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					if(giveplayerid == playerid) {
					}
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' ')) {
						idx++;
					}
					new offset = idx;
					new result[64];
					while((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result)) {
						SendClientMessage(playerid, COR_VERMELHO, "/mp [ID] [Texto]");
						return 1;
					}
					format(string, sizeof(string), "PM de %s (ID: %d):  %s", sendername, playerid, (result));
					SendClientMessage(giveplayerid, COR_AMARELO, string);
					format(string, sizeof(string), "PM enviada para %s:  %s", giveplayer, (result));
					SendClientMessage(playerid,  COR_AMARELO, string);
					return 1;
				}
			}else{
					format(string, sizeof(string), "Jogador ID %d não está online!", giveplayerid);
					SendClientMessage(playerid, COR_VERMELHO2, string);
			}
		}
		return 1;
	}
	
	if(strcmp(cmd, "/examinar", true) == 0) {
	    if(Profissao[playerid] == LABNARCOTICOS || Profissao[playerid] == GM || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/examinar [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40){
			        SendClientMessage(playerid,COR_AMARELO,"Resultados do exame anti-dopping:");
				    format(string, sizeof(string), "Heroina: %d doses",Heroina[ID]);
				    SendClientMessage(playerid,COR_BRANCO,string);
				    format(string, sizeof(string), "Maconha: %d doses",Maconha[ID]);
				    SendClientMessage(playerid,COR_BRANCO,string);
				    format(string, sizeof(string), "Cocaína: %d doses",Cocaina[ID]);
				    SendClientMessage(playerid,COR_BRANCO,string);
				    format(string, sizeof(string), "Crack: %d doses",Crack[ID]);
				    SendClientMessage(playerid, COR_BRANCO, string);
				    SendClientMessage(playerid,COR_VERDE,"Exame anti-dopping concluído com êxito!");
			    	return 1;
				}else{
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto!");
			    	return 1;
				}
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	
	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == GM || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new ID;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/bafometro [ID]");
		    	return 1;
			}
			ID = strval(tmp);
			if(!IsPlayerConnected(ID)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(ID,playerid) < 40){
			    	format(string, sizeof(string), "O bafômetro mostra: %d litros de álcool no sangue", Bebida[ID]);
					SendClientMessage(playerid, COR_AMARELO, string);
					format(string, sizeof(string), "O jogador %s está verificando seu teor de álcool.", PlayerName(playerid));
					SendClientMessage(ID, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para verificar o teor!");
			    	return 1;
				}
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	
	new string[256];
	format(string, sizeof(string), "O comando  %s  não existe!",cmdtext);
	SendClientMessage(playerid, COR_VERMELHO2, string);
    return 1;
}

public ChatGlobal(color,const string[]) {
	for(new i = 0; i < MAX_PLAYERS; i++) {
		if(IsPlayerConnected(i)) {
		    if(!CLPT[i]) {
				SendClientMessage(i, color, string);
			  }
			}
		 }
	  }

public MensagensRandom() {

    new string[256];
    new random1 = random(sizeof(Mensagens));
    new random2 = random(sizeof(Cores));
      format(string, sizeof(string),"%s", Mensagens[random1]);
      SendClientMessageToAll(Cores[random2],string);
        return 1;
    }

public HorarioTextDraw() {

	new horas,minutos,segundos;
	new string[256];
	gettime(horas,minutos,segundos);
	if(minutos < 9) {
	format(string,25,"~r~|~w~%d:0%d",horas,minutos);
	}else{
	format(string,25,"~r~|~w~%d:%d",horas,minutos);
	}
    SetWorldTime(horas);
    return 1;
  }

public OnPlayerText(playerid,text[]) {

	if(Silenciado[playerid] == 0) {
		return 1;
	}else{
        SendClientMessage(playerid, COR_VERMELHO, "Você não pode falar porque foi silenciado.");
		return 0;
	}
}

public OnPlayerPrivmsg(playerid,recieverid,text[]) {

	new string[256];
	for(new i = 0; i < MAX_PLAYERS; i++) {
	   if(IsPlayerAdmin(playerid)) {
	      format(string, 256, "PM de %s para %s : %s",PlayerName(playerid),PlayerName(recieverid),text[0]);
	      SendClientMessage(i,COR_AZUL,string);
	      return 0;
		 }
	  }
      return 0;
   }

public Clima() {
	SetWeather(random(18));
}

public Distancia(Float:radi, playerid, string[],Cor) {

	if(IsPlayerConnected(playerid)) {
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new i = 0; i < MAX_PLAYERS; i++) {
			if(IsPlayerConnected(i)) {
				if(!Escuta[i]) {
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					if(((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16))) {
						SendClientMessage(i, Cor, string);
					}
					}else{
					SendClientMessage(i, Cor, string);
				  }
				}
			 }
		  }
	return 1;
}

public VeiculoPolicial(carid) {

	if((carid >= 35) && (carid <= 60) || carid == 66 || carid == 67 || carid == 91 || carid == 92 || carid == 93 || carid == 36) {
	    if(carid == 45 || carid == 46 || carid == 55 || carid == 59) {
		return 0;
	  }
		return 1;
	}
	return 0;
}

public Ambulancia(carid) {

	if((carid >= 61) && (carid <= 63)|| carid == 83) {
		return 1;
	}
	return 0;
}
forward Aviao(carid);
public Aviao(carid) {

	if(carid==39||carid==40||carid==60||carid==83||carid==91||carid==92||carid==93||carid==95||carid==96||carid==99||carid==100||carid==101||carid==102||carid==103||carid==104||carid==105||carid==106||carid==107||carid==108||carid==109) {
		return 1;
	}
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
	
	if(newstate == PLAYER_STATE_DRIVER) {
	    Combustivel[playerid] = udb_getGasoline(PlayerName(playerid));
 		new id;
	    new modelo;
	    new vid = GetPlayerVehicleID(playerid);
	    new hab[2];
        hab[1] = udb_getHabaerea(PlayerName(playerid));
		hab[0] = udb_gethabterre(PlayerName(playerid));
	    id = GetPlayerVehicleID(playerid);
		cGetVehicleModelID(id,modelo);
		if(modelo == 594) {
	    return 1;
		}else{
			if(Combustivel[playerid] <= 0) {
				RemovePlayerFromVehicle(playerid);
				Combustivel[playerid] = 0;
				SendClientMessage(playerid, COR_VERMELHO, "Não tem mais gasolina no tanque vá ao posto mais próximo");
                SendClientMessage(playerid, COR_VERMELHO, "ou peça ao admin ou frentista online.");
				return 0;
			}else{
				Combustivel[playerid]--;
  				udb_setGasoline(PlayerName(playerid), Combustivel[playerid]);
			  }
		  }
		if(Aviao(vid)) {
		    if(hab[1] == 0) {
			    if(AprendendoDirigir[playerid] == 1) {
				}else{
			    SendClientMessage(playerid, COR_VERMELHO, "Você não tem habilitação para dirigir um avião!");
			    RemovePlayerFromVehicle(playerid);
			  }
		   }
		}else{
			if(hab[0] == 0) {
				if(AprendendoDirigir[playerid] == 1) {
				}else{
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem habilitação para dirigir um carro!");
                RemovePlayerFromVehicle(playerid);
	          }
		   }
		}
		if(VeiculoPolicial(vid)) {
		  if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == S.W.A.T || Profissao[playerid] == B.O.P.E || Profissao[playerid] == DELEGADO || Profissao[playerid] == EXERCITO) {
		   }else{
		   RemovePlayerFromVehicle(playerid);
	      }
	   }
		else if(Ambulancia(vid)) {
           if(IsPlayerAdmin(playerid) || Profissao[playerid] == GM || Profissao[playerid] == PARAMEDICO) {
		    }else{
			RemovePlayerFromVehicle(playerid);
		  }
	   }
	}
	
	if(newstate == PLAYER_STATE_ONFOOT) {
        TextDrawHideForPlayer(playerid, Velo[playerid]);
		if(Carregamento[playerid] == 1) {
		    SendClientMessage(playerid,COR_VERMELHO,"Você perdeu sua carga por ter saído do veículo.");
		    Carregamento[playerid] = 0;
	    	return 1;
		}
	    else if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COR_VERDE, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COR_VERMELHO, "Você recebeu o valor da corrida até aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
	    	return 1;
		}
		else if(ATaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COR_VERDE, "Obrigado por viajar,  volte sempre.");
		    SendClientMessage(ATaximetro[playerid][1], COR_VERDE, "Você recebeu o valor da corrida até aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(ATaximetro[playerid][1], PrecoCorrida[playerid]);
		    PrecoCorrida[playerid] = 0;
		    ATaximetro[playerid][1] = 0;
		    ATaximetro[playerid][0] = 0;
	    	return 1;
		}
		else if(MTaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COR_VERDE, "Espero que tenha gostado do passeio, volte sempre.");
		    SendClientMessage(MTaximetro[playerid][1], COR_VERDE, "Você recebeu o valor da corrida até aqui.");
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

public OnPlayerEnterCheckpoint(playerid) {
}

public OnPlayerLeaveCheckpoint(playerid) {
}

stock PlayerName(playerid) {

	new nome[MAX_PLAYER_NAME];
	GetPlayerName(playerid, nome, MAX_PLAYER_NAME);
	return nome;

}

stock fsearch(filename[],search[],bool:caps = false) {

    new File:fhandle = fopen(filename, io_read);
	new temp[255];
	while(fread(fhandle, temp)) {

	StripNewLine(temp);
	if(equal(temp, search, caps)) return true;
	}
	return false;
}

public Bancos() {

	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
	    
		if(X >= 2315.6235 && X <= 2317.1758 && Y <= -4.7609 && Y >= -16.4591){
				if(AreaBanco[i] == 0) {
                    SendClientMessage(i, COR_VERDE, "|____ Banco 24Horas RPG Rulez____|");
                    SendClientMessage(i, COR_AMARELO, "Veja os comandos do digitando /banco");
         			AreaBanco[i] = 1;
				}
			}
			else if(X >= 2305.7000 && X <= 2314.0930 && Y >= -15.0133 && Y <= -12.2739){
			    if(AreaBanco[i] == 0) {
                    SendClientMessage(i, COR_VERDE, "|____ Banco 24Horas RPG Rulez____|");
                    SendClientMessage(i, COR_AMARELO, "Veja os comandos do digitando /banco");
			        AreaBanco[i] = 1;
				}
			}
			else if(X >= 351.3872 && X <= 405.0200 && Y >= -2089.7952 && Y <= -2084.7393){
		    	GameTextForPlayer(i,"~w~rea de Pesca",3000,4);
			}
            else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
				GameTextForPlayer(i,"~b~Posto ~n~ /abastecer (Quantia)",3000,4);
				AreaPosto[i] = 1;
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    GameTextForPlayer(i,"~y~Posto ~n~ /abastecer (Quantia)",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    GameTextForPlayer(i,"~g~Posto ~n~ /abastecer (Quantia)",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
		    	GameTextForPlayer(i,"~b~Posto ~n~ /abastecer (Quantia)",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= -38.2285 && X <= -14.9334 && Y >= -91.7449 && Y <= -74.7878) || (X >= -35.9811 && X <= -26.5833 && Y >= -31.2224 && Y <= -2.6983) || (X >= -37.2210 && X <= -14.0014 && Y >= -91.8488 && Y <= -74.6295) || (X >= -36.4902 && X <= -17.2822 && Y >= -57.9920 && Y <= -49.3070)) {
   			    GameTextForPlayer(i,"~w~LOJA DE UTILIDADES ~n~ ~w~2~b~4~w~/~g~7",1000,0);
			    AreaCoopPesca[i] = 1;
				AreaCoopCaca[i] = 1;
			}
			else if(X >= 2437.1567 && X <= 2521.2393 && Y >= -884.0734 && Y <= -825.9846){
			    GameTextForPlayer(i,"~r~rea de Caœa",1000,4);
			    AreaCaca[i] = 1;
			} else if(X >= -622.7689 && X <= -466.2803 && Y >= -562.3403 && Y <= -468.5563){
			    GameTextForPlayer(i,"~b~rea de Carga",1000,4);
			    AreaCarga[i] = 1;
			} else if(X >= -70.6976 && X <= -40.9113 && Y >= -1159.8073 && Y <= -1101.6296){
				GameTextForPlayer(i,"~w~rea de Descarga",1000,4);
				AreaDescarga[i] = 1;
			} else if((X >= -335.8548 && X <= -211.2112 && Y >= -1559.2218 && Y <= -1465.4664) || (X >= -331.1028 && X <= -160.4074 && Y >= -1433.2325 && Y <= -1298.5884) ){
			    GameTextForPlayer(i,"~y~Fazenda, plante aqui!",1000,4);
			    AreaFazenda[i] = 1;
			} else if(X >= -592.5238 && X <= -572.5529 && Y >= -1521.7395 && Y <= -1470.1633){
			    GameTextForPlayer(i,"~g~Coamo, Venda da Soja",1000,4);
			    AreaCoopFazenda[i] = 1;

			}else{
			
				if(AreaBanco[i] == 1) {
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

public Pesca() {

	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && PescaInProgress[i] == 1){
			QtPescas[i]++;
			PescaInProgress[i] = 0;
			new string[256];
			new random1 = random(sizeof(NomePeixes));
			SendClientMessage(i, COR_VERDE, "|_________________________PESCARIA_________________________________|");
            format(string, sizeof(string), "Sua vara de pesca voltou e você pescou um(a) %s", NomePeixes[random1][0]);
            SendClientMessage(i,COR_AMARELO,string);
			SendClientMessage(i,COR_BRANCO,"Para vender seu peixe vá até o 24/7 mais próximo ou continue pescando.");
			SendClientMessage(i,COR_VERDE, "____________________________________________________________________");
		}
	}
}

public Caca() {

	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && CacaInProgress[i] == 1){
			QtCacas[i]++;
			CacaInProgress[i] = 0;
			SendClientMessage(i,COR_VERDE,"|_______________________CAÇA___________________________|");
			SendClientMessage(i,COR_AMARELO,"Está tudo preparado, caça pronta para ser vendida.");
			SendClientMessage(i,COR_BRANCO,"Para vender sua caça vá até o 24/7 mais próximo ou continue caçando.");
			SendClientMessage(i,COR_VERDE,"________________________________________________________");
		}
	}
}

public ChecarCombustivel() {

	for(new i=0; i<MAX_PLAYERS; i++){
 		new id;
	    new modelo;
	    id = GetPlayerVehicleID(i);
		cGetVehicleModelID(id,modelo);
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1 && modelo != 594){
			if(GetPlayerState(i) == 2){
				Combustivel[i]--;
				udb_setGasoline(PlayerName(i), Combustivel[i]);
				if(Combustivel[i] <= 0){
					RemovePlayerFromVehicle(i);
					SendClientMessage(i, COR_VERMELHO, "Você não pode andar sem combustível, vá até o posto mais próximo e abasteça.");
					Combustivel[i] = 0;
				    return 1;
				}
				if(Combustivel[i] >= 4){
				return 1;
				}
				if(Combustivel[i] < 4 || Combustivel[i] >= 4) {
				SendClientMessage(i,COR_BRANCO, "|________________AVISO_______________|");
				SendClientMessage(i,COR_VERMELHO,"Sua Gasolina está no fim cuide para não ficar a pé!");
				SendClientMessage(i,COR_AMARELO, "Abasteça no posto mais próximo!");
				SendClientMessage(i,COR_BRANCO, "|____________________________________|");
				return 1;
				}
			}
		}
	}
    return 1;
}

public Contar() {

static contagem = 3;
if(contagem) {
 SetTimer("Contar", 1000, 0);
 new string[256];
 format(string, sizeof (string), "~r~%d", contagem);
 GameTextForAll(string, 500, 6);
 for(new i=0; i<MAX_PLAYERS; i++) {
  if(IsPlayerConnected(i)) {
   PlayerPlaySound(i,1056,-2982.8105,472.6976,4.9141);
   TogglePlayerControllable(i, 0);
   }
 }
 contagem--;

}else {
 GameTextForAll("~g~ VAI !!!", 1000, 0);
 for(new i=0; i<MAX_PLAYERS; i++) {
 {
  if(IsPlayerConnected(i)) {
  
   PlayerPlaySound(i,1057,-2982.8105,472.6976,4.9141);
   TogglePlayerControllable(i, 1);
  }
}
    contagem = 3;
   }
  }
 }

public LogarJogador(playerid) {

    new Float:X, Float:Y, Float:Z, Float:ang, Float:health;
	GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
	udb_getHealth(PlayerName(playerid), health);
	SetPlayerHealth(playerid, health);
	udb_getPosition(PlayerName(playerid), X, Y, Z);
	udb_getAng(PlayerName(playerid), ang);
	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
	Profissao[playerid] = udb_getProf(PlayerName(playerid));
	Combustivel[playerid] = udb_getGasoline(PlayerName(playerid));
	SendClientMessage(playerid, COR_VERDE, "Logado!");
	SendClientMessage(playerid, COR_AMARELO, "Veja os comandos em /ajuda para saber mais.");
	CarregarJogador(playerid);
	
	if(udb_getPrisao(PlayerName(playerid)) == 1 || Procurados[playerid] == 1){
		Procurados[playerid] = 0;
		new cela;
		Presos[playerid] = 1;
		cela = random(4);
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
		SendClientMessage(playerid,COR_VERMELHO,"Você foi preso!");
        SendClientMessage(playerid,COR_AZUL,"Você pode contratar um advogado: /advogado");
        GameTextForPlayer(playerid, "Preso",9000,0);

	}else{
	
		SpawnPlayer(playerid);
	}
}

public CarregarJogador(playerid) {

    new Float:X, Float:Y, Float:Z, Float:ang, Float:health;
	udb_getHealth(PlayerName(playerid), health);
	SetPlayerHealth(playerid, health);
	udb_getPosition(PlayerName(playerid), X, Y, Z);
	udb_getAng(PlayerName(playerid), ang);
	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
	Profissao[playerid] = udb_getProf(PlayerName(playerid));
	Combustivel[playerid] = udb_getGasoline(PlayerName(playerid));
	VerificarProfissao(playerid);
  }

public TempoNaCadeia() {

	for(new i=0; i<MAX_PLAYERS; i++) {
	    if(Presos[i] == 1) {
	        if(TempoPreso[i] == 180) {
	            TempoPreso[i] = 0;
				udb_setPrisao(PlayerName(i), 0);
				Presos[i] = 0;
				SetSpawnInfo(i,0,udb_getSkin(PlayerName(i)),1551.8242,-1675.4960,16.0192,0,0,0,0,0,0,0);
	    		SetPlayerInterior(i, 0);
	    		SpawnPlayer(i);
	            SendClientMessage(i, COR_VERDE, "Dívida com a sociedade paga, livre da cadeia!");
			}else{
			    TempoPreso[i]++;
			}
		}
	}
}

stock GetDistanceBetweenPlayers(playerid,playerid2) {

     new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
     new Float:tmpdis;
       GetPlayerPos(playerid,x1,y1,z1);
       GetPlayerPos(playerid2,x2,y2,z2);
       tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
       return floatround(tmpdis);
     }

public Taxi() {

	for(new i=0; i<MAX_PLAYERS; i++){
		if(Taximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 3){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 3;
				format(string, sizeof(string), "Taxímetro: R$%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para pagar o taxi. Foi deixado aqui!");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado.");
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

public ATaxi() {

	for(new i=0; i<MAX_PLAYERS; i++){
		if(ATaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 15){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 15;
				format(string, sizeof(string), "Aero-Taxímetro: R$%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 15){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
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

public MTaxi() {

	for(new i=0; i<MAX_PLAYERS; i++){
		if(MTaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 5){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 5;
				format(string, sizeof(string), "Moto-Taxímetro: R$%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 5){
				SendClientMessage(i, COR_VERMELHO, "Você foi retirado da moto-taxi porque não tinha mais condições de pagar.");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro, foi retirado da moto.");
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

public AtualizarDinheiro() {

	new Dinheiro;
	for(new i=0; i<MAX_PLAYERS; i++) {
		if(IsPlayerConnected(i)) {
   			Dinheiro = GetPlayerMoney(i);
			SetPlayerScore(i,Dinheiro);
		  }
	   }
    }

public Fazenda() {

	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && FazendaInProgress[i] == 1){
			QtSoja[i]++;
			FazendaInProgress[i] = 0;
			SendClientMessage(i, COR_AZUL, "|___________________________ PLANTIO _________________________________|");
			SendClientMessage(i, COR_VERDE, "Seu plantio está feito!");
			SendClientMessage(i, COR_AMARELO, "Se quiser continuar plantando fique a vontade!");
			SendClientMessage(i, COR_AMARELO, "OBS.: Se plantar sem vender. Seus sacos irão se acumulando.");
			SendClientMessage(i, COR_BRANCO, "Para vender vá até o Coamo.");
			SendClientMessage(i, COR_VERMELHO2, "___________________________________________________________________");
		  }
		}
	  }

public Velocimetro(playerid) {

	new Float:x,Float:y,Float:z;
	new Float:distance,value,string[256];
	new Float:health;
	for(new i=0; i<MAX_PLAYERS; i++) {
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i)) {
			TextDrawDestroy(Velo[i]);
		  }
	   }
	
	for(new i=0; i<MAX_PLAYERS; i++) {
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i)) {
			GetPlayerPos(i, x, y, z);
			GetVehicleHealth(GetPlayerVehicleID(i), health);
			distance = floatsqroot(floatpower(floatabs(floatsub(x,SalvarPosJogador[i][LastX])),2)+floatpower(floatabs(floatsub(y,SalvarPosJogador[i][LastY])),2)+floatpower(floatabs(floatsub(z,SalvarPosJogador[i][LastZ])),2));
			value = floatround(distance *5000);
			if(VeloSeg > 1) {
				value = floatround(value / VeloSeg);
            }
			format(string,sizeof(string),"~g~Ve¢culo: ~w~%s ~n~ ~g~Velocidade: ~w~%d ~g~Km/H ~n~ ~g~Combust¢vel: ~w~%d  ~n~ ~g~Vida do ve¢culo: ~w~%.2f",NomeCarros[GetVehicleModel(GetPlayerVehicleID(i))-400],floatround(value/1000),Combustivel[i],health);
			Velo[i] = TextDrawCreate(220.00, 400.00, string);
			TextDrawUseBox(Velo[i], 0);
			TextDrawSetOutline(Velo[i], 0);
			TextDrawFont(Velo[i], 1);
			TextDrawAlignment(Velo[i], 2);
			TextDrawShowForPlayer(i, Velo[i]);
		}
		if(VeloSeg > 200 && GetPlayerState(i) == PLAYER_STATE_DRIVER && VeloMulta == 1) {
				    SendClientMessage(playerid,COR_PALHA, "Você está a mais de 200 KM/H diminua para não causar acidentes.");
				}
		SalvarPosJogador[i][LastX] = x;
		SalvarPosJogador[i][LastY] = y;
		SalvarPosJogador[i][LastZ] = z;
	}
}

stock GetPlayerDistanceToPoint(playerid,Float:x,Float:y) {

  new Float:x1,Float:y1,Float:z1;
  new Float:tmpdis;
  
      GetPlayerPos(playerid,x1,y1,z1);
      tmpdis = floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2));
      return floatround(tmpdis);
    }

public Hospitais(playerid) {

	if(!IsPlayerConnected(playerid)) {
	    return -1;
	}
	
	new Float:prevdist = 100000.000;
	new prevhosp;
	
	for(new hospid = 0; hospid < 4; hospid++) {
		new Float:dist;

		if(hospid == 0) {
            dist = GetPlayerDistanceToPoint(playerid,-2651.6501,634.1177);
		}
		else if(hospid == 1) {
		    dist = GetPlayerDistanceToPoint(playerid,1173.5842,-1324.5615);
		}
		else if(hospid == 2) {
		    dist = GetPlayerDistanceToPoint(playerid,2031.9415,-1404.3578);
		}
		else if(hospid == 3) {
		    dist = GetPlayerDistanceToPoint(playerid,1582.5615,1768.7921);
		}
		if((dist < prevdist)) {
		    prevdist = dist;
		    prevhosp = hospid;
		 }
      }
     return prevhosp;
   }

stock CarregarPickups(pattern[]) {

	new tmp[256];
	new string[256];
	new File:temp,Float:X,Float:Y,Float:Z;
	new QtPickups;
   	new msg[256];
	new index;
	
	if(!fexist(pattern)) {
	    print(msg);
	    dini_Create(pattern);
	    return 1;
	}
	
	temp = fopen(pattern, io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		X = Float:floatstr(strtok(tmp, index));
		Y = Float:floatstr(strtok(tmp, index));
		Z = Float:floatstr(strtok(tmp, index));
		format(string, sizeof(string), "%f, %f, %f", X, Y, Z);
		CreatePickup(1272, 1, Float:X, Float:Y, Float:Z);
		QtPickups++;
	}
	fclose(temp);
	return 1;
}

public TunarVeiculo(playerid) {

	SetVehicleHealth(playerid, 1000.0);
	new Tuning;
	new vid = GetPlayerVehicleID(playerid);
	Tuning = GetVehicleModel(playerid);

	switch (Tuning) {

		case 400: {
			AddVehicleComponent(vid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1018);
			AddVehicleComponent(playerid, 1013);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1086);
			}
			
		case 401: {
            AddVehicleComponent(vid, 1010);
			AddVehicleComponent(playerid, 1086);
			AddVehicleComponent(playerid, 1139);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1012);
			AddVehicleComponent(playerid, 1013);
			AddVehicleComponent(playerid, 1042);
			AddVehicleComponent(playerid, 1043);
			AddVehicleComponent(playerid, 1018);
			AddVehicleComponent(playerid, 1006);
			AddVehicleComponent(playerid, 1007);
			AddVehicleComponent(playerid, 1017);
			}
			
		case 406: {
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 407: {
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(vid, 1010);
			}
			
		case 530: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 529: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 528: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 531: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 527: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 532: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 540: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 526: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 544: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 533: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 543: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 541: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 542: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 525: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 518: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 545: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 605: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 505: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 503: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 500: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 502: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 524: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
            }

		case 506: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 508: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 517: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 507: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 516: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 514: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 515: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 546: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 549: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 499: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 596: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 597: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 589: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 587: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 588: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 585: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 598: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 600: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 604: {
		    AddVehicleComponent(playerid, 1010);
         	AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 599: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 603: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 601: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 602: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 547: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 584: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 582: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 554: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 555: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 552: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 550: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 551: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 583: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 566: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 572: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 580: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 568: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 579: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 574: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 578: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 498: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 504: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 495: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 426: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 427: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 428: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 424: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 422: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 423: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 421: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 429: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 496: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 437: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 431: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 436: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 433: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 434: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 438: {
		     AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 419: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 416: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 405: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 408: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 404: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 402: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 403: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 418: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 409: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 411: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 415: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 410: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 414: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 412: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 413: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 439: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 432: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 441: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 470: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 474: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 475: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 477: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 467: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 459: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 466: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 458: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 440: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 478: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 480: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 489: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 492: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 494: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 479: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 486: {
            AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 483: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 485: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 482: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 457: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 609: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 442: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 443: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 445: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 451: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 455: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 456: {
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
		    }
		    
		case 420: {
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1139);
			AddVehicleComponent(vid, 1010);
			}
			
		case 534: {
			ChangeVehiclePaintjob(playerid, 2);
			AddVehicleComponent(playerid, 1180);
			AddVehicleComponent(playerid, 1185);
			AddVehicleComponent(playerid, 1100);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1127);
			AddVehicleComponent(playerid, 1101);
			AddVehicleComponent(playerid, 1122);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1076);
			AddVehicleComponent(vid, 1010);
			}
			
		case 535: {
			ChangeVehiclePaintjob(playerid, 2);
			AddVehicleComponent(playerid, 1109);
			AddVehicleComponent(playerid, 1115);
			AddVehicleComponent(playerid, 1117);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1114);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1119);
			AddVehicleComponent(playerid, 1121);
			AddVehicleComponent(vid, 1010);
			}
			
		case 536: {
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1183);
			AddVehicleComponent(playerid, 1181);
			AddVehicleComponent(playerid, 1107);
			AddVehicleComponent(playerid, 1104);
			AddVehicleComponent(playerid, 1108);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}
			
		case 557: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}
			
		case 444: {
		    AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}

		case 556: {
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}
			
		case 558: {
			AddVehicleComponent(playerid, 1092);
			AddVehicleComponent(playerid, 1166);
			AddVehicleComponent(playerid, 1165);
			AddVehicleComponent(playerid, 1090);
			AddVehicleComponent(playerid, 1094);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1163);
			AddVehicleComponent(playerid, 1091);
			ChangeVehiclePaintjob(playerid, 2);
			AddVehicleComponent(vid, 1010);
			}
			
		case 559: {
			AddVehicleComponent(playerid, 1070);
			AddVehicleComponent(playerid, 1066);
			AddVehicleComponent(playerid, 1072);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1147);
			AddVehicleComponent(playerid, 1068);
			AddVehicleComponent(playerid, 1173);
			AddVehicleComponent(playerid, 1161);
			ChangeVehiclePaintjob(playerid, 3);
			AddVehicleComponent(vid, 1010);
			}
			
		case 560: {
			AddVehicleComponent(playerid, 1028);
			AddVehicleComponent(playerid, 1140);
			AddVehicleComponent(playerid, 1170);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1139);
			AddVehicleComponent(playerid, 1033);
			AddVehicleComponent(playerid, 1031);
			AddVehicleComponent(playerid, 1030);
			ChangeVehiclePaintjob(playerid, 1);
			AddVehicleComponent(vid, 1010);
			}
			
		case 561: {
			AddVehicleComponent(playerid, 1056);
			AddVehicleComponent(playerid, 1156);
			AddVehicleComponent(playerid, 1157);
			AddVehicleComponent(playerid, 1062);
			AddVehicleComponent(playerid, 1059);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1146);
			AddVehicleComponent(playerid, 1061);
			ChangeVehiclePaintjob(playerid, 2);
			AddVehicleComponent(vid, 1010);
			}
			
		case 562: {
			ChangeVehiclePaintjob(playerid, 1);
			AddVehicleComponent(playerid, 1037);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1035);
			AddVehicleComponent(playerid, 1039);
			AddVehicleComponent(playerid, 1041);
			AddVehicleComponent(playerid, 1086);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1147);
			AddVehicleComponent(playerid, 1148);
			AddVehicleComponent(playerid, 1172);
			AddVehicleComponent(vid, 1010);
			}
			
		case 565: {
			ChangeVehiclePaintjob(playerid, 1);
			ChangeVehicleColor(playerid, 2, 2);
			AddVehicleComponent(playerid, 1046);
			AddVehicleComponent(playerid, 1151);
			AddVehicleComponent(playerid, 1152);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1139);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1053);
			AddVehicleComponent(playerid, 1047);
			AddVehicleComponent(playerid, 1051);
			AddVehicleComponent(vid, 1010);
			}
			
		case 567: {
			AddVehicleComponent(playerid, 1188);
			AddVehicleComponent(playerid, 1186);
			AddVehicleComponent(playerid, 1102);
			AddVehicleComponent(playerid, 1133);
			AddVehicleComponent(playerid, 1018);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1087);
			ChangeVehiclePaintjob(playerid, 2);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(vid, 1010);
			}
			
		case 575: {
			ChangeVehiclePaintjob(playerid, 1);
			AddVehicleComponent(playerid, 1175);
			AddVehicleComponent(playerid, 1177);
			AddVehicleComponent(playerid, 1043);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1042);
			AddVehicleComponent(playerid, 1099);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(vid, 1010);
			}
			
		case 576: {
			ChangeVehiclePaintjob(playerid, 2);
			AddVehicleComponent(playerid, 1191);
			AddVehicleComponent(playerid, 1193);
			AddVehicleComponent(playerid, 1010);
			AddVehicleComponent(playerid, 1018);
			AddVehicleComponent(playerid, 1080);
			AddVehicleComponent(playerid, 1087);
			AddVehicleComponent(playerid, 1134);
			AddVehicleComponent(playerid, 1137);
			AddVehicleComponent(vid, 1010);
	        }
		  }
	        return 1;
	   }
