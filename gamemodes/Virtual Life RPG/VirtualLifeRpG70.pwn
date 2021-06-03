#include <a_samp>
#include <dini>

//Cores

#define COLOR_TURQUESA       		0x00CED1AA
#define COLOR_GRAD1 		  		0xB4B5B7AA
#define COLOR_VERDE_AQUA            0x20B2AAAA
#define COLOR_AZUL                	0x0099FFAA
#define COLOR_ROSA2                 0xDDA0DDAA
#define COLOR_ORANGE 				0xFF9900AA
#define COLOR_PURPLE 				0x800080AA
#define COLOR_AZULPLUS          	0x4169FFAA
#define COLOR_VERDECLARO       		0x7FFF00AA
#define COLOR_VERDEESCURO           0x336600AA
#define COLOR_UNLOGGED         		0xAAAAAAAA
#define COLOR_PALHA            		0xF0E68CAA
#define COLOR_ROSA             		0xFF00FFAA
#define COLOR_ROSACLARO             0xFF91ECAA
#define COLOR_GREEN            		0x33AA33AA
#define COLOR_EMERGENCIA       		0xD06050AA
#define COLOR_RED              		0xAA3333AA
#define COLOR_RED2             		0xFF0000AA
#define COLOR_YELLOW           		0xFFFF00AA
#define COLOR_WHITE            		0xFFFFFFAA
#define COLOR_GRAY             		0xAFAFAFAA

//Cores das profissıes

#define COLOR_DESEMPREGADO     		0x666666AA
#define COLOR_BARMAN           		0x8B4513AA
#define COLOR_ASSASSINO        		0xA52A2AAA
#define COLOR_VENDEDOR_DE_CARROS  	0x009900AA
#define COLOR_CORRETOR         		0x8FBC8FAA
#define COLOR_SEGURAN«A        		0xADD8E6AA
#define COLOR_MOTORISTA  	   		0x33CCFFAA
#define COLOR_MOTORISTA_DE_ONIBUS 	0xF5F5DCAA
#define COLOR_CAMINHONEIRO    		0xE4E4E4AA
#define COLOR_PESCADOR   	  		0xE9967AAA
#define COLOR_ENTREGADOR_PIZZA 		0xF0E68CAA
#define COLOR_TAXISTA          		0xFFFF00AA
#define COLOR_MOTOTAXI         		0xFFC000AA
#define COLOR_TAXI_AEREO       		0xFFA500AA
#define COLOR_INSTRUTOR	       		0xDC143CFF
#define COLOR_TRAFICANTE       		0x00CED1AA
#define COLOR_JORNALISTA      	 	0x89FDF3AA
#define COLOR_PARAMEDICO       		0xF4EED7AA
#define COLOR_ADVOGADO         		0x18585EAA
#define COLOR_COP_MILITAR      		0x0000FFAA
#define COLOR_COP_RODOVIARIO   		0x1F9FBFAA
#define COLOR_COP_SWAT         		0x00C7FFAA
#define COLOR_COP_NARCOTICOS   		0x057ABDAA
#define COLOR_JUIZ             		0x7FFF00AA
#define COLOR_DELEGADO         		0x81694CAA
#define COLOR_LIXEIRO          		0xAFAFAFFF
#define COLOR_TRANSPORTE_DE_VALORES 0x83BFBFAA
#define COLOR_CONTRABANDISTA   		0xFF6347AA
#define COLOR_RECEITA_FEDERAL  		0xB8860BAA
#define COLOR_AGRICULTOR      		0xFFE4C4AA
#define COLOR_ASSALTANTE      		0xB7B86EAA
#define COLOR_FRENTISTA          	0xF39292AA
#define COLOR_LOCADOR_DE_CARROS 	0x90B271AA
#define COLOR_PEDREIRA         		0xBC8F8FAA
#define COLOR_VENDEDOR_DE_ARMAS    	0x10F441AA
#define COLOR_MECANICO              0x677594FF
#define COLOR_PROSTITUTA            0xFF00FFAA
#define COLOR_LIDER_DE_TRAFICO      0xDEDB02AA
#define COLOR_CORRETOR_SEGUROS      0xFF6A6AAA
#define COLOR_EXERCITO              0x8DF299AA

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
#define PESCADOR              10//feito
#define ENTREGADOR_PIZZA      11//feito
#define TAXISTA               12//feito
#define MOTOTAXI              13//feito
#define TAXI_AEREO            14//feito
#define INSTRUTOR			  15//feito
#define TRAFICANTE            16//feito
#define JORNALISTA            17//feito
#define PARAMEDICO            18//feito
#define ADVOGADO              19//feito
#define COP_MILITAR           20//feito
#define COP_RODOVIARIO        21//feito
#define COP_SWAT              22//feito
#define COP_NARCOTICOS        23//feito
#define JUIZ                  24//feito
#define DELEGADO              25//feito
#define LIXEIRO               26//feito
#define TRANSPORTE_DE_VALORES 27//feito
#define CONTRABANDISTA        28//feito
#define RECEITA_FEDERAL       29//feito
#define AGRICULTOR            30//feito
#define ASSALTANTE            31//feito
#define FRENTISTA             32//feito
#define LOCADOR_DE_CARROS     33//feito
#define PEDREIRA              34//feito
#define VENDEDOR_DE_ARMAS     35//feito
#define MECANICO              36//feito
#define PROSTITUTA            37//feito
#define LIDER_DE_TRAFICO      38//feito
#define CORRETOR_SEGUROS      39//feito
#define EXERCITO              40//feito
//VelocÌmetro
#define SLOTS2 200
//Carros
#define QTCARS                  172
//Desmanche
#define MAX_DESMANCHEVEICULO	19
//Zonas
#define MAX_PLAYERS_ 200
//Casino
#define MAX_CASINO      3
#define RunOutTime 30000
//Loteria
#define LoteriaMax 60000
#define LoteriaMin 20000
//Pra nunca mais crashar o servidor em caso de caracteres especiais
#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256
//define's do velocimetro
#define SPEED   KMPH
#define SLOTS 30
#define NONE 		0
#define CATANDOLATAS 1
#define LAVANDOLIMOSINE 2
#define REVISAOLIMO1 3
#define REVISAOLIMO2 4
#define CARREGANDOGAS 5
#define TRANSPORTE_ROUPAS 6
#define GPSDESTINO 7
#define NOBAR 8
#define CONTRABANDOINI 9
#define CONTRABANDONAVIO 10
#define CONTRABANDONAVIO2 11
#define CONTRABANDORAMPA 12
#define CONTRABANDOFINAL 13
#define CONTRABANDOCAR1 14
#define CONTRABANDOCAR2 15
#define CONTRABANDOCAR3 16
#define CONTRABANDOARMA1 17
#define CONTRABANDOARMA2 18
#define CONTRABANDOARMA3 19
#define CONTRABANDODROGA 20
#define CONTRABANDODROGA2 21
#define CONTRABANDODROGA3 22
#define CORRETORA_PROPRIEDADES 23
#define RESTAURANTE 24

//outros
#define NONEE 0
#define NOSTRIADS 1
#define ENTREGANDORICK 2
#define TELHADO 3
#define SAINDOTELHADO 4
#define AERO 5
#define AGENCIA 6
#define NACAMA 1
#define CONVERSA_MOTORISTA 7
#define PEGAR_PASSAGEM 8
#define ENTREGASF 9
//Convites
#define INVITE_NONE     0
#define INVITE_FIANCA   1
#define INVITE_CARRO    2
#define INVITE_CASA     3
#define INVITE_CONTRATO 4
#define INVITE_CONTRATO_SEGURANCA 5
//Pickup
#define MAX_PICKUPS          1024
#define QTPICKUPS            38
//NegÛcios
#define MAX_PROPERTIES 10
#define MAX_PROPERTIE_ID 9
//Prostituta
#define KEY_UPP 16
#define KEY_DOWNP 512
#define KEY_LEFTP 8192
#define KEY_RIGHTP 16384

forward ComerSobremesa(playerid);
forward ComerComida(playerid);
forward TomarBebida(playerid);
forward RestauranteHandler();
forward RestauranteHandler2();
forward ZerarAvisoVelocidade(playerid);
forward TerminarAbrirPortaoAuto();
forward AbrirPortaoAutoEscola();
forward FecharPortaoAutoEscola();
forward ApostasdeCavalos(playerid);
forward Intermediaria2();
forward Intermediaria3();
forward Intermediaria4();
forward Intermediaria5();
forward DoencaAtaca();
forward CancelarMulta();
forward Anunciou(playerid);
forward ZerarResultadoMostrado();
forward ZerarSalarioEntregue();
forward SellHouse(playerid);
forward SaveCarPos(vehicleid,Float:X,Float:Y,Float:Z,Float:Ang);
forward fdeleteline(filename[],line[]);
forward ArrumandoVeiculo(playerid,vehicleid,Float:X,Float:Y,Float:Z,Float:ang);
forward FimCamuflagem(playerid);
forward DestruirPickupGrana(playerid,pickup);
forward FazendoStripTease(playerid);
forward PagamentoSeguro();
forward DesarmandoDrogas(playerid);
forward DrogasPlant(playerid);
forward TomarSorvete(playerid);
forward Cobrar(playerid);
forward Cobrando(playerid);
forward AplicarGasosa(playerid,vehicleid,amount);
forward GatesCoordChecker();
forward PortaoCoordChecker();
forward ApplyTuningForVehicle(vehicleid);
forward SetPlayerFree(playerid);
forward AvancoLigacao(plcaller,plcalled);
forward CheckFuel();
forward writelog(log[]);
forward Taxi();
forward IsNumeric(const string[]);
forward KeyT();
forward ATaxi();
forward ColocarNoVeiculoMot(playerid,vehid);
forward MTaxi();
forward OnPlayerPressKey2(playerid,key);
forward Speed();
forward Conversa1(playerid);
forward Conversa2(playerid);
forward Conversa3(playerid);
forward Conversa4(playerid);
forward Conversa5(playerid);
forward Conversa6(playerid);
forward Conversa7(playerid);
forward Conversa8(playerid);
forward Conversa9(playerid);
forward Conversa10(playerid);
forward Conversa11(playerid);
forward Conversa12(playerid);
forward Conversa13(playerid);
forward Conversa14(playerid);
forward Conversa15(playerid);
forward Conversa16(playerid);
forward Conversa17(playerid);
forward Conversa3b(playerid);
forward Conversa7b(playerid);
forward Conversa8b(playerid);
forward Conversa12b(playerid);
forward Conversa14b(playerid);
forward ConversaA1(playerid);
forward ConversaA2(playerid);
forward ConversaA3(playerid);
forward ConversaA4(playerid);
forward ConversaA5(playerid);
forward Conversa21(playerid);
forward Conversa22(playerid);
forward Conversa23(playerid);
forward Conversa24(playerid);
forward Conversa25(playerid);
forward Conversa26(playerid);
forward Conversa27(playerid);
forward Conversa28(playerid);
forward Conversa29(playerid);
forward Conversa21b(playerid);
forward Conversa22bb(playerid);
forward Conversa22b(playerid);
forward Conversa23b(playerid);
forward Conversa24b(playerid);
forward Conversa25b(playerid);
forward Conversa26b(playerid);
forward Conversa27b(playerid);
forward Conversa28b(playerid);
forward Conversa29b(playerid);
forward Conversa21c(playerid);
forward Conversa22c(playerid);
forward Conversa23c(playerid);
forward Conversa23cc(playerid);
forward Conversa24c(playerid);
forward Conversa25c(playerid);
forward Conversa26c(playerid);
forward Conversa27c(playerid);
forward Conversa28c(playerid);
forward Conversa29c(playerid);
forward Conversa21d(playerid);
forward Conversa22d(playerid);
forward Conversa23d(playerid);
forward Conversa24d(playerid);
forward Conversa25d(playerid);
forward Conversa25dd(playerid);
forward Conversa26d(playerid);
forward Conversa27d(playerid);
forward Conversa28d(playerid);
forward Conversa29d(playerid);
forward Conversa21e(playerid);
forward ConversaB1(playerid);
forward ConversaB2(playerid);
forward ConversaB3(playerid);
forward ConversaB4(playerid);
forward ConversaB5(playerid);
forward ConversaB6(playerid);
forward ConversaB4b(playerid);
forward ConversaB5b(playerid);
forward ConversaRoupa(playerid);
forward AnunciarComu();
forward Doenca();
forward PassarDoenca(playerid);
forward TomandoRemedio1(plid,playerid);
forward TomandoRemedio2(playerid,plid);
forward TomandoRemedio3(playerid,plid);
forward TomandoRemedio4(playerid,plid);
forward LimoLimpa(playerid);
forward LavandoLimosine(playerid);
forward ChecandoLimo(playerid);
forward ChecagemDeMotor(playerid);
forward Pesca(playerid);
forward Fazenda(playerid);
forward LeiteA(playerid);
forward Prostituir(playerid);
forward Strip(playerid);
forward Strip3(playerid);
forward Strip4(playerid);
forward CarregamentoGas(playerid);
forward CarregamentoGeral(playerid);
forward EnchendoCarroForte(playerid);
forward ChecandoDrogas(playerid);
forward PlayerPlaySoundEx(playerid,soundid);
forward minrand(min, max);
forward LogarPlayer(playerid);
forward GetClosestHospital(playerid);
forward Tempo();
forward Bancos(playerid);
forward GetPlayerDistanceToPoint(playerid,Float:x,Float:y);
forward InicioTribunal(plid,plid2,playerid);
forward InicioTribunal2(plid,plid2,playerid);
forward Veredicto(playerid);
forward Veredicto2(playerid);
forward Assalto(playerid);
forward AssaltanteSaiu(playerid);
forward Roubo(playerid);
forward open(playerid);
forward Casino();
forward LoteriaComeco();
forward IsStringAName(string[]);
forward GetPlayerID(string[]);
forward CarrosParaAlugar(vehiclemodel_carrosalugar);
forward TempoAlugando(playerid);
forward Desmanche(playerid);
forward isPlayerInArea(playerID, Float:data[4]);
forward update_zones();
forward VoteKickTimer();
forward ClearVote(kickedid);
forward Radar();
forward sequestrar();
forward ContrabandoNavio();
forward ContrabandoSpawnCar(playerid);
forward Desmancheveiculo(playerid);
forward Comeu(plid,playerid);
forward OpenGate(gateid);
forward CloseGate(gateid);
forward OpenPortao(objectid);
forward ClosePortao(objectid);
forward TerminarCarregamento(playerid);
forward EntregarGrana(playerid);
forward OnPlayerKeyStateChange2(playerid,newkeys,oldkeys);
forward SetarPosicaoDoVeiculo(vehid,Float:X,Float:Y,Float:Z,Float:ang);
forward AltClientMessage(playerid,color,const message[]);
forward AcaoEspecial(playerid,actionid);
forward ZerarAnuncioPrevisao();
forward ConfiscarArmas(playerid);
forward ChecandoContrabandoCar(playerid);
forward SetCar(modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2,e);
public AltClientMessage(playerid,color,const message[]) SendClientMessage(playerid,color,message);
public AcaoEspecial(playerid,actionid) SetPlayerSpecialAction(playerid,actionid);
public SetarPosicaoDoVeiculo(vehid,Float:X,Float:Y,Float:Z,Float:ang){
	SetVehiclePos(vehid,X,Y,Z);
	SetVehicleZAngle(vehid,ang);
}

public ColocarNoVeiculoMot(playerid,vehid) PutPlayerInVehicle(playerid,vehid,0);
forward CPD_CPHandler();

static seta = 1318;
static bancoi = 1274;

//#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

//TEXTDRAWS
new Text:tdLCavalos;
new Text:tdLoteria;
new Text:tdCustomizacao;
new Text:tdDelegacia;
new Text:tdDesmanche;
new Text:Bemvindo;
new Text:Banco;
new Text:Hotel;
new Text:Posto;
new Text:Delegacia;
new Text:Hospital;
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
new Text:tdPizzaria;
new Text:tdSorveteria;
new Text:tdLocadora;
new Text:tdBar;
//New velo
enum SavePlayerPosEnum {
Float:LastX,
Float:LastY,
Float:LastZ
}

new SavePlayerPos[SLOTS][SavePlayerPosEnum];
new Text:Speedo[SLOTS];
new UpdateSeconds;
//Areas
new PescaArea;
new InstrutorArea;
new ProstitutaArea;
new TaxiArea;
new DesmancheArea;
new SorveteriaArea;
//---
new ComLeite[MAX_PLAYERS] = 0;
new NoRestaurante[MAX_PLAYERS] = 0;
new NoRestaurante2[MAX_PLAYERS] = 0;
new avisovelo[MAX_PLAYERS] = 0;
new VendedorProduto[MAX_PLAYERS];
new Produto[MAX_PLAYERS] = 0;
new TeorDoProduto[MAX_PLAYERS] = 0;
new ValorDoProduto[MAX_PLAYERS] = 0;
new OfertaDada[MAX_PLAYERS] = 0;
new NaAgenda[MAX_PLAYERS] = 0;
new Agendado[MAX_PLAYERS] = 0;
new AgendaTestes;
new FechandoPortaoAuto;
new AbrindoPortaoAuto;
new LatasNecessarias[MAX_PLAYERS] = 0;
new TemJogador;
new Pressionado;
new cavalin[2];
new ValorApostado[MAX_PLAYERS] = 0;
new CavaloApostado[MAX_PLAYERS] = 0;
new bool:CPlayerDentro[MAX_PLAYERS];
new SegurancaContratado[MAX_PLAYERS] = 0;
new Scontratador[MAX_PLAYERS];
new Svaloroferecido[MAX_PLAYERS];
new ValorCabeca[MAX_PLAYERS] = 0;
new MostrouResultado;
new PrevisaoAnunciada;
new SalarioEntregue;
new JaAnunciou[MAX_PLAYERS] = 0;
new Proposteiro[MAX_PLAYERS] = 0;
new JornalistaAvisado[MAX_PLAYERS] = 0;
new iemprego[3];
new JaComi[MAX_PLAYERS] = 0;
new JaVendi[MAX_PLAYERS] = 0;
new Negocio[MAX_PLAYERS] = 0;
new Negociador[MAX_PLAYERS] = 0;
new PropriedadeEscolhida[MAX_PLAYERS] = 0;
new ValorOferecido[MAX_PLAYERS] = 0;
new NegocianteName[MAX_PLAYERS][MAX_STRING];
new PropriedadeContrato[MAX_PLAYERS] = 0;
new TimerVenda[MAX_PLAYERS];
new HoraJogo;
new MinutoJogo;
new SegundoJogo;
new DiaJogo;
new MesJogo;
new AnoJogo;
new SeguroImovel[MAX_PLAYERS] = 0;
new SeguroCarro[MAX_VEHICLES] = 0;
new Seguro[MAX_PLAYERS] = 0;
new VendedorSeguro[MAX_PLAYERS];
new TimerDivida[MAX_PLAYERS];
new AluguelFornecedor[MAX_PLAYERS];
new Dono[MAX_VEHICLES][MAX_STRING];
new GPV[MAX_VEHICLES];
new CellCredits[MAX_PLAYERS];
new VerAlarme;
new AreaLoteria[MAX_PLAYERS] = 0;
new AreaCustomizacao[MAX_PLAYERS] = 0;
new AreaDesmanche[MAX_PLAYERS];
new AreaDelegacia[MAX_PLAYERS];
new AreaHotel[MAX_PLAYERS];
new AreaDeleg[MAX_PLAYERS];
new AreaHosp[MAX_PLAYERS];
new AreaSorveteria[MAX_PLAYERS];
new AreaLocadora[MAX_PLAYERS];
new AreaBar[MAX_PLAYERS];
new AreaLCavalos[MAX_PLAYERS];
new TomandoSorvete[MAX_PLAYERS] = 0;
new PLAYERLIST_authed[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new AreaCreditos[MAX_PLAYERS];
new MissaoLixeiro[MAX_PLAYERS] = 0;
new LixoColetado[MAX_PLAYERS] = 0;
new AreaLixao[MAX_PLAYERS] = 0;
new PrisaoTimer[MAX_PLAYERS][2];
new invitestatus[MAX_PLAYERS];
new envconvite[MAX_PLAYERS];
new ChatNotDisable[MAX_PLAYERS] = 0;
new kitmedico[MAX_PLAYERS] = 0;
new JogadorDoente[MAX_PLAYERS] = 0;
new Curando[MAX_PLAYERS] = 0;
new confirmacaosenha[MAX_PLAYERS] = 0;
new senhaatual[MAX_PLAYERS] = 0;
new SacandoGrana[MAX_PLAYERS] = 0;
new DepositandoGrana[MAX_PLAYERS] = 0;
new EntregandoGrana[MAX_PLAYERS];
new FazendoEmprestimo[MAX_PLAYERS] = 0;
new carvenda1;
new carvenda2;
new carvenda3;
new carvenda4;
new carvenda5;
new ZeraMulta[MAX_PLAYERS] = 0;
//Corretora de propriedades
new Pickup_Entrada_Corretora;
new Pickup_Saida_Corretora;
//Entrada do tribunal
new pickuptribunal;
//Loteria
new pickuploteria_saida;
new pickuploteria_entrada;
//Bancos
new pickupbancoselecionada[MAX_PLAYERS] = 0;
new pickupbanco1;
new pickupbanco2;
new pickupbanco3;
new pickupbanco4;
new pickupsaidabanco;
//Motorista
new LimoLavada[MAX_VEHICLES] = 0;
new LavandoLimo[MAX_PLAYERS] = 0;
new LimoRevisada[MAX_VEHICLES] = 0;
new LavagemLimo[MAX_PLAYERS] = 0;
new MotorLimo[MAX_PLAYERS] = 0;
new EntregaLimo[MAX_PLAYERS] = 0;
//Advogado
new dinheirofianca[MAX_PLAYERS];
//registrar
new RegisterPlayer[MAX_PLAYERS] = 0;
//convite de carro
new ivalorcasa[MAX_PLAYERS];
new icarid[MAX_PLAYERS];
new icor1[MAX_PLAYERS];
new icor2[MAX_PLAYERS];
new Float:iX[MAX_PLAYERS];
new Float:iY[MAX_PLAYERS];
new Float:iZ[MAX_PLAYERS];
new Float:iang[MAX_PLAYERS];
//Pesca
new AreaPesca[MAX_PLAYERS] = 0;
new AreaCoopPesca[MAX_PLAYERS] = 0;
new PescaInProgress[MAX_PLAYERS] = 0;
new QtPescas[MAX_PLAYERS] = 0;
new QtIscas[MAX_PLAYERS] = 0;
//Sequestro
new Sequestro[MAX_PLAYERS] = 0;
new Cativeiro[MAX_PLAYERS] = 0;
new TempoSequestro[MAX_PLAYERS];
new Sequestrador[MAX_PLAYERS];
//Caminhoneiros
new AreaCarga[MAX_PLAYERS] = 0;
new AreaDescarga[MAX_PLAYERS] = 0;
new Carregamento[MAX_PLAYERS] = 0;
new ColocandoDrogas[MAX_PLAYERS] = 0;
new DrogasNoCaminhao[MAX_PLAYERS] = 0;
new CarregamentoRoupas[MAX_PLAYERS] = 0;
new GasCar[MAX_PLAYERS] = 0;
new GeralCar[MAX_PLAYERS] = 0;
//Aluguel de carros
new CarroAlugado[MAX_PLAYERS] = 0;
new TempoAlugar[MAX_PLAYERS] = 0;
new TmpAlugar[MAX_PLAYERS] = 0;
new JogadorNoCarro[MAX_PLAYERS] = 0;
new OferecerCarro[MAX_PLAYERS] = 0;
new Carrocriado[MAX_PLAYERS];
new alugado1;
new alugado2;
new alugado3;
new alugado4;
new alugado5;
new alugado6;
new alugado7;
new alugado8;
new MotoPizza;
new MotoPizza2;
new MotoPizza3;
new MotoPizza4;
new CarroAuto;
new CarroAuto2;
new CarroAuto3;
new CarroAuto4;
new CarroAuto5;
new CarroAuto6;
new CarroJornal;
new CarroJornal2;
new CarroJornal3;
new Taxi1;
new Taxi2;
new Taxi3;
new MotoTaxi;
new MotoTaxi2;
new MotoTaxi3;
new AeroTaxi;
new limosine1;
new limosine2;
new CarroContrabando1;
new CarroContrabando2;
new CarroContrabando3;
new CarroContrabando4;
new CarroContrabando5;
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
//roubo
new TempoAssalto[MAX_PLAYERS] = 0;
new RouboMao[MAX_PLAYERS] = 0;
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
new DelegaFechando[3];
new DelegaAbrindo[3];
new DelegaAberto[3];
//Auto Escola
new portaoauto;
//Juiz
new Tribunal[MAX_PLAYERS] = 0;
new declaracoesabertas[MAX_PLAYERS] = 0;
new Audiencia[MAX_PLAYERS];
//Fazenda
new AreaFazenda[MAX_PLAYERS] = 0;
new AreaCoopFazenda[MAX_PLAYERS] = 0;
new FazendaInProgress[MAX_PLAYERS] = 0;
new QtMilho[MAX_PLAYERS] = 0;
new Leite[MAX_PLAYERS] = 0;
new LeiteInProgress[MAX_PLAYERS] = 0;
new QtLeite[MAX_PLAYERS] = 0;
//Latinhas para desempregados
new CatarLatinha[MAX_PLAYERS] = 0;
new Latas[MAX_PLAYERS] = 0;
new EntregandoLatas[MAX_PLAYERS] = 0;
new Missao[MAX_PLAYERS];
//Transporte
new AreaForte[MAX_PLAYERS] = 0;
new Carga[MAX_PLAYERS] = 0;
new PegarGrana[MAX_PLAYERS] = 0;
//Contrabando
new Contrabando[MAX_PLAYERS];
new CheckpointStatus[MAX_PLAYERS];
new ContrabandoPassar[MAX_PLAYERS] = 0;
new Receita[MAX_PLAYERS] = 0;
new nCheckpointStatus[MAX_PLAYERS];
new StatusCheck[MAX_PLAYERS];
new ContrabandoCar[MAX_PLAYERS] = 0;
new EntregaCarro[MAX_PLAYERS] = 0;
new NaoSair[MAX_PLAYERS] = 0;
new PodePegar[MAX_PLAYERS] = 0;
//Vendedor de Armas
new Armas[MAX_PLAYERS];
new Armaoferecida[MAX_PLAYERS] = 0;
new Camuflado[MAX_PLAYERS] = 0;
//Pedreira
new PedreiraCarga[MAX_PLAYERS] = 0;
new Construcao[MAX_PLAYERS] = 0;
new Pedras[MAX_PLAYERS] = 0;
//Pizzaria
new PizzasNecessarias[MAX_PLAYERS] = 0;
new PizzasEntregues[MAX_PLAYERS] = 0;
new PizzariaCar[MAX_PLAYERS] = 0;
new EntregadePizza[MAX_PLAYERS] =0;
new avisado[MAX_PLAYERS];
new PizzasMoto[MAX_VEHICLES] = 0;
//defines de coisas
new Menu:Sucos;
new Menu:Cardapio1;
new Menu:Cardapio2;
new Menu:Cardapio3;
new Menu:Cardapio4;
new Menu:Bombshop;
new Menu:Bombshopveh;
new Menu:BancoOpc;
new Menu:CargaGeral;
new Menu:VendoDrogas;
new Menu:QuantidadeDrog;
new Menu:Bar;
new Menu:Alarme;
new Menu:CPD_First;
new Menu:CPD_Second;
new Menu:CPD_Third;
new Menu:CPD_Fourth;
new Menu:CPD_Fifth;
new Menu:CPD_Sixth;
new Menu:Properties;
new Menu:ConfirmacaoNegocio;
new Menu:Sorvetes;
new PropriedadeSelecionada[MAX_PLAYERS] = 0;
new AreaBombShop[MAX_PLAYERS];
new DebugKeys[MAX_PLAYERS] = 0;
new Escondido[MAX_PLAYERS] = 0;
new Previsao;
new AreaPosto[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new ATaximetro[MAX_PLAYERS][2];
new MTaximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new NoTaxi[MAX_PLAYERS] = 0;
new TempoPagamentoSeguro;
new Velo[MAX_PLAYERS];
new Velocidade[MAX_PLAYERS];
new Perseguicao[MAX_PLAYERS] = 0;
new Chave[MAX_PLAYERS] = 0;
new Bebida[MAX_PLAYERS] = 0;
//Traficante/Lider de Tr·fico
new Maconha[MAX_PLAYERS] = 0;
new Heroina[MAX_PLAYERS] = 0;
new Cocaina[MAX_PLAYERS] = 0;
new QtMaconha[MAX_PLAYERS] = 0;
new QtHeroina[MAX_PLAYERS] = 0;
new QtCocaina[MAX_PLAYERS] = 0;
new PegandoDrogas[MAX_PLAYERS] = 0;
new MaconhaEsc[MAX_PLAYERS] = 0;
new HeroinaEsc[MAX_PLAYERS] = 0;
new CocainaEsc[MAX_PLAYERS] = 0;
new MaconhaMao[MAX_PLAYERS] = 0;
new HeroinaMao[MAX_PLAYERS] = 0;
new CocainaMao[MAX_PLAYERS] = 0;
new DrogasPlantadas[MAX_VEHICLES] = 0;
new TempoPlantacao[MAX_PLAYERS];
new PlantandoDrogas[MAX_PLAYERS] = 0;
//Narcoticos
new TempoDesarme[MAX_PLAYERS];
new DesarmandoAsDrogas[MAX_PLAYERS] = 0;
//Prostituta
new Transacama[MAX_PLAYERS] = 0;
new AreaStrip[MAX_PLAYERS];
new Prostitutacama[MAX_PLAYERS];
new Strip2[MAX_PLAYERS] = 0;
new TimerStrip[MAX_PLAYERS] = 0;
new FazendoStrip[MAX_PLAYERS] = 0;
new Prostitutacama2[MAX_PLAYERS];
new FST[MAX_PLAYERS] = 0;
//Loteria
new Aposta[MAX_PLAYERS][2];
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
//Historia
new LimoHistoria1;
new LimoHistoria2;
//Motorista de Onibus
new TimerCobranca[MAX_PLAYERS];
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
new celular[MAX_PLAYERS];
new Agenda[MAX_PLAYERS];
//Mortes lvl
new Kills[MAX_PLAYERS];
new Gates[4];
new Portao[4];
//VoteKick
new KickVote[MAX_PLAYERS];
new VoteKick[MAX_PLAYERS];
new LastVote[MAX_PLAYERS];
new numplayers = 0;
//GPS
new GPSLigado[MAX_PLAYERS] = 0;
//Meses
new ValorDia;
new MesesDias[] = {
	31,//janeiro
	29,//fevereiro
	31,//marÁo
	30,//abril
	31,//maio
	30,//junho
	31,//julho
	31,//agosto
	30,//setembro
	31,//outobro
	30,//novembro
	31//dezembro
};
new CavalosLargada[][] = {
	"NONE",
	"Cavalo 1 - Cor Verde",
	"Cavalo 2 - Cor Amarela",
	"Cavalo 3 - Cor Vermelho",
	"Cavalo 4 - Cor Azul",
	"Cavalo 5 - Cor Laranja",
	"Cavalo 6 - Cor Branca",
	"Cavalo 7 - Cor Preto",
	"Cavalo 8 - Cor Roxo"
};

new CarrosVendaModelos[26] = {
400,//SIM
405,//SIM
409,//SIM
411,//SIM
415,//SIM
436,//SIM
439,//SIM
445,//SIM
451,//SIM
458,//SIM
461,//SIM
462,//SIM
467,//SIM
474,//SIM
475,//SIM
480,//SIM
496,//SIM
517,//SIM
522,//SIM
533,//SIM
551,//SIM
558,//SIM
560,//SIM
562,//SIM
585,//SIM
602//SIM
};
new Float:CarrosVendaPos[5][3] = {
{948.2599,-1693.5471,13.3224},
{943.0073,-1693.6627,13.3378},
{957.4697,-1665.2048,13.2637},
{929.5303,-1665.4551,13.4155},
{969.3599,-1694.8386,13.1918}
};
new Float:CarrosVendaAng[5] = {
182.1958,
180.0527,
182.7379,
182.0336,
171.2284
};
//Propriedades
new NomesPropriedades[][] = {
"Pizzaria",
"Yellow's'Taxi",
"LuxLimosine",
"Corretora_de_seguros",
"SecurityLife",
"Ammu-Nation",
"Boate",
"Posto",
"Bar",
"Pay'n'Spray"
};
new ValoresPropriedades[] = {
55000,
70000,
90000,
100000,
80000,
75000,
100000,
120000,
50000,
140000
};
//Dias
new DiaName[][] = {
	"Domingo",
	"Segunda-feira",
	"TerÁa-feira",
	"Quarta-feira",
	"Quinta-feira",
	"Sexta-feira",
	"Sab·do"
};
//[Arrays necess·rias]
new Float:AreaProibida[MAX_CASINO][4] = {
	{1928.1771,987.5739, 1970.5675,1042.8369},
	{2171.3618,1584.2649, 2279.4915,1628.6199},
	{1117.5068,-11.2747, 1142.4843,12.5986}
};
new Float:Celas[][] = {
	{227.6684,110.1895,999.0156},
	{223.0134,110.3193,999.0156},
	{219.3730,110.2772,999.0156},
	{214.9654,109.4626,999.0156}
};

new GPSNames[21][] = {
	"Inv·lido",
	"Delegacia",
	"Sorveteria",
	"Clube Alhambra",
	"Posto",
	"Banco",
	"Ammu-Nation",
	"Hospital",
	"Posto",
	"Hotel",
	"Banco",
	"Skate Park",
	"Agencia de empregos",
	"Hotel",
	"Aeroporto",
	"Pay'n'Spray",
	"Ammu-Nation",
	"Clube de Strip",
	"Beco do desmanche",
	"Lix„o/Ferro-Velho",
	"Auto-Escola"
};

new Float:GPSLocais[21][3] = {
    {0.0,0.0,0.0},//Invalido
    {1535.4200,-1666.4794,13.3828},//Delegacia
	{1568.4116,-1880.2959,13.5469},//Sorveteria
	{1831.0593,-1682.8829,13.5469},//Clube Alhambra
	{1932.0693,-1765.6171,13.5469},//Posto
	{1762.7281,-1665.8135,13.5613},//Banco
	{1362.3558,-1279.0985,13.3828},//Ammu-Nation
	{1191.4152,-1313.4065,13.3984},//Hospital
	{1003.0652,-953.1113,42.1452},//Posto
	{1025.4990,-970.7648,42.3083},//Hotel
	{1372.8091,-1022.2424,26.5281},//Banco
	{1860.2725,-1378.7266,13.5625},//Skate Park
	{1309.4923,-1382.2971,13.7309},//Agencia de empregos
	{1864.3087,-1605.5023,13.5391},//Hotel
	{1965.6682,-2172.5632,13.4233},//Aeroporto
	{2075.3633,-1830.1956,13.5545},//Pay'n'Spray
	{2397.4094,-1977.0671,13.3828},//Ammu-Nation
	{2410.9180,-1223.8486,24.7019},//Clube de Strip
	{2530.2302,-1714.7545,13.4838},//Beco do desmanche
	{2154.7485,-1977.6985,13.5513},//Lix„o/Ferro-Velho
	{1796.5983,-2067.2034,13.5721}//Auto-Escola
};
new Float:EntregarContrabandoCarro[4][3] = {
	{-2714.5276,1483.8269,7.3764},
	{-1746.6765,202.1463,3.1335},
	{-2420.3567,2314.0894,2.3943},
	{2313.7090,-2389.8708,2.7796}
};
new Float:EntregarContrabandoArma[4][3] = {
    {-2015.3627,897.3715,45.4453},
	{-2337.9707,577.8401,27.9782},
	{-2656.4023,202.7016,4.3359},
	{-2795.4751,-181.8443,7.1950}
};
new Float:ContrabandoEntregaDroga[4][3] = {
	{1368.2190,1897.0417,11.4688},
	{1687.5352,2124.2644,11.4609},
	{2043.7354,734.2840,11.4609},
	{2661.7920,746.2242,14.7396}
};
new Float:Caixas[][] = {
    {2316.2163,-12.7220,26.7422},
	{2316.2273,-7.0617,26.7422}
};
//Lixeiras
new Float:LixeirasCheckpoints[37][3] = {
	{1919.4543,-2088.9211,13.5816},
	{1920.1440,-2123.2827,13.5848},
	{1175.3402,-1878.8687,13.5765},
	{1093.4054,-1881.3174,13.5469},
	{1102.4594,-1876.7643,13.5469},
	{959.8318,-821.7481,96.4444},
	{974.5941,-814.8570,97.6700},
	{914.9440,-671.0176,117.1938},
	{1071.5637,-777.2383,107.2760},
	{2545.2141,-1035.6591,69.5822},
	{2527.9951,-1056.7031,69.5759},
	{2510.4429,-1030.7483,70.0345},
	{2426.7161,-1017.5425,54.3441},
	{2441.4590,-1979.9978,13.5469},
	{2382.4392,-1940.1761,13.5469},
	{2176.5598,-1344.8451,23.9844},
	{2224.2134,-1409.4204,24.0000},
	{1424.1855,-1319.8253,13.5547},
	{1420.2666,-1355.4493,13.5643},
	{1439.2612,-1324.7502,13.5458},
	{1604.3488,-1060.3590,23.9063},
	{1630.1682,-988.8309,24.0752},
	{1829.5371,-1113.9519,23.8766},
	{1786.1411,-1147.2623,23.8730},
	{1660.6748,-1201.4055,19.7935},
	{1592.9694,-1201.4099,19.8162},
	{1425.5841,-1080.7632,17.5580},
	{1435.4409,-1094.6079,17.5942},
	{1148.7889,-1386.2189,13.8293},
	{734.3256,-1341.2900,13.5255},
	{1322.0441,-1236.9178,13.5469},
	{1461.8387,-1488.1692,13.5469},
	{1537.7135,-1479.5881,9.5000},
	{1516.4315,-1849.2903,13.5469},
	{1420.4170,-1844.5044,13.5469},
	{1338.2338,-1815.8656,13.5502},
	{1337.4501,-1773.7675,13.5469}
};
new Float:EntregaPizza[55][3] = {
	{667.4611,-1768.2632,13.6395},
	{206.8691,-1769.8591,4.3528},
	{476.1749,-1279.7399,16.4891},
	{725.3467,-998.7245,52.7344},
	{688.4912,-1052.6003,50.0404},
	{471.1869,-1165.1737,67.1114},
	{299.4418,-1155.4586,80.9099},
	{1109.8466,-965.3030,42.7156},
	{1250.4656,-814.9561,84.1478},
	{1094.9318,-647.0628,113.6484},
	{1045.5042,-642.3704,120.1172},
	{944.5483,-707.0009,122.2109},
	{785.9003,-826.5245,70.2896},
	{786.7748,-1436.6754,13.5563},
	{761.2948,-1601.4784,13.3963},
	{791.3557,-1759.9124,13.3795},
	{959.2263,-1805.2899,14.2764},
	{1328.2424,-1272.9170,13.5469},
	{1095.1053,-1271.9298,13.5469},
	{972.0071,-1309.1213,13.3828},
	{645.5919,-1353.4913,13.5469},
	{461.3967,-1529.1140,29.9626},
	{480.3898,-1415.5505,16.9723},
	{1016.4984,-1537.2197,13.5189},
	{1247.9326,-1562.5531,13.6183},
	{1653.8300,-1485.2672,13.3828},
	{1565.9774,-1168.3051,24.0781},
	{1641.5500,-1170.2367,24.0781},
	{1791.1555,-1165.0851,23.8281},
	{1893.0699,-1127.8049,24.3029},
	{1933.5380,-1127.7698,25.3210},
	{2060.4194,-1076.7515,24.8981},
	{2288.0876,-1079.5088,47.5459},
	{2153.5376,-1013.3929,62.9425},
	{2049.1118,-985.5848,44.5556},
	{2399.9370,-1144.3446,29.6275},
	{2802.2549,-1086.2662,30.7238},
	{2714.1917,-1116.2172,69.5781},
	{2756.3625,-1178.7412,69.4011},
	{2775.8726,-1248.9669,49.2383},
	{2804.6245,-1302.6187,38.9612},
	{2714.8755,-1468.6206,30.5460},
	{2762.4402,-1978.8011,13.5475},
	{2674.3159,-2012.6364,13.5547},
	{2653.7363,-1995.4392,13.5547},
	{2507.9199,-2017.8193,13.5469},
	{2241.7156,-1885.1985,13.5469},
	{2007.9795,-1704.7460,13.5469},
	{2238.5420,-1645.5743,15.4854},
	{2452.7036,-1649.8158,13.4427},
	{2206.6975,-1410.6456,23.9844},
	{2196.6240,-1470.1097,25.4775},
	{2150.2930,-1290.0696,23.9850},
	{2078.5088,-1202.1044,23.9135},
	{2131.2275,-1148.2389,24.3877}
};
new ValorTratamento[] = {
	300,
	200,
	350,
	250,
	400
};
new Float:MaterialGeral[32][3] = {
	{2276.7805,2792.2209,11.4132},
	{2867.6741,2587.1086,11.2717},
	{2789.8125,2581.5967,11.4076},
	{2788.3848,1976.5139,11.4002},
	{2767.2917,1430.3484,11.0297},
	{1699.5713,932.0217,11.4064},
	{1482.0475,1029.7655,11.4041},
	{1105.0337,1926.7305,10.5474},
	{1049.1306,2134.0002,10.5473},
	{2485.1016,-2118.3237,13.2740},
	{2173.9971,-2278.9578,13.2070},
	{2200.5720,-2302.4646,14.4918},
	{2079.4766,-2034.2172,13.2739},
	{-59.4326,-1135.3506,0.8052},
	{132.7787,-275.9363,1.5781},
	{-575.1917,-497.0947,25.5234},
	{-188.6011,-279.2888,2.1525},
	{-112.9081,-328.3716,2.1595},
	{-1573.1852,-2737.4255,48.2643},
	{-2098.2527,-2241.5991,30.3522},
	{-2124.7537,-95.1831,35.0474},
	{-1831.8756,161.7327,14.8443},
	{-1726.8512,-124.4487,3.2790},
	{2770.4475,-2511.1726,13.2162},
	{2612.7383,-2225.4827,12.9616},
	{2249.1465,-2641.5596,13.1596},
	{2208.6328,-2644.1208,13.1365},
	{-83.0790,91.2185,3.1172},
	{686.7947,1729.0151,6.7192},
	{-295.2475,1776.8915,42.4146},
	{-1204.5481,1821.3715,41.8111},
	{1992.3278,2075.2271,10.9127}
};
new Float:GasCami[16][3] = {
	{78.7559,1217.7043,18.5619},
	{250.5986,1394.6223,10.3130},
	{648.2774,1688.6320,6.7193},
	{-1307.0088,2688.7847,50.1549},
	{2146.3752,2747.7520,10.9125},
	{2202.2908,2474.5410,10.9127},
	{2639.8176,1106.0364,10.9127},
	{2112.1296,920.4982,10.9127},
	{1937.0416,-1771.6200,13.4751},
	{-91.8008,-1170.4994,2.4884},
	{-1606.9624,-2713.7676,48.5391},
	{-1675.1785,414.5792,7.1797},
	{-2404.0574,979.5306,45.0239},
	{1595.5406,2198.0520,10.3863},
	{608.5971,1699.6238,6.9922},
	{-1470.0050,1863.2375,32.3521}
};
new Float:DrogasAbastecer[5][3] = {
	{-726.0346,1520.2312,39.1688},
	{-1329.5159,2499.2334,87.0469},
	{-2549.3452,2227.9382,4.7114},
	{-1429.8599,2185.9900,50.4650},
	{-426.7101,2258.0132,42.4297}
};
new Float:DeixandoDrogas[2][3] = {
	{2273.0935,-1042.1615,50.2367},
	{2298.5928,-1781.8463,13.5538}
};
new Float:Latinhas[37][3] = {
	{1919.4543,-2088.9211,13.5816},
	{1920.1440,-2123.2827,13.5848},
	{1175.3402,-1878.8687,13.5765},
	{1093.4054,-1881.3174,13.5469},
	{1102.4594,-1876.7643,13.5469},
	{959.8318,-821.7481,96.4444},
	{974.5941,-814.8570,97.6700},
	{914.9440,-671.0176,117.1938},
	{1071.5637,-777.2383,107.2760},
	{2545.2141,-1035.6591,69.5822},
	{2527.9951,-1056.7031,69.5759},
	{2510.4429,-1030.7483,70.0345},
	{2426.7161,-1017.5425,54.3441},
	{2441.4590,-1979.9978,13.5469},
	{2382.4392,-1940.1761,13.5469},
	{2176.5598,-1344.8451,23.9844},
	{2224.2134,-1409.4204,24.0000},
	{1424.1855,-1319.8253,13.5547},
	{1420.2666,-1355.4493,13.5643},
	{1439.2612,-1324.7502,13.5458},
	{1604.3488,-1060.3590,23.9063},
	{1630.1682,-988.8309,24.0752},
	{1829.5371,-1113.9519,23.8766},
	{1786.1411,-1147.2623,23.8730},
	{1660.6748,-1201.4055,19.7935},
	{1592.9694,-1201.4099,19.8162},
	{1425.5841,-1080.7632,17.5580},
	{1435.4409,-1094.6079,17.5942},
	{1148.7889,-1386.2189,13.8293},
	{734.3256,-1341.2900,13.5255},
	{1322.0441,-1236.9178,13.5469},
	{1461.8387,-1488.1692,13.5469},
	{1537.7135,-1479.5881,9.5000},
	{1516.4315,-1849.2903,13.5469},
	{1420.4170,-1844.5044,13.5469},
	{1338.2338,-1815.8656,13.5502},
	{1337.4501,-1773.7675,13.5469}
};
new SucosName[][] = {
"Laranja",
"Abacaxi",
"Acerola",
"Mam„o",
"Lim„o",
"Morango",
"Uva",
"Maracuja",
"Framboesa"
};
new ComidasName[][] = {
"Feijoada",
"Lagosta Gourmet",
"Camar„o",
"Peixe Frito",
"FilÈ",
"Salm„o",
"Batata Frita",
"Sopa",
"Frango Assado"
};
new ComidasValor[] = {
40,
220,
140,
120,
80,
140,
80,
20,
100
};
new BebidasName[][] = {
"Coca-Cola",
"Sprite",
"Cerveja",
"Fanta",
"Vinho",
"Suco com leite",
"Suco com agua"
};
new BebidasValor[] = {
8,
8,
9,
9,
100,
14,
10
};
new SobremesasName[][] = {
"Pudim de chocolate",
"Sorvete",
"Bolo de chocolate",
"Bomba de chocolate",
"Brigadeiro"
};
new SobremesasValor[] = {
15,
8,
13,
9,
6
};
new ProfLevel[] = {
	0,//Inv·lida
	0,//Desempregado
	0,//Barman
	20,//Assassino
	120,//Vendedor de Carros
	120,//Corretor
	20,//SeguranÁa
	20,//Motorista Pa
	10,//Motorista On
	40,//Caminhoneiro
	0,//Pescador
	0,//Entregador de Pizza
	10,//Taxista
	10,//Moto Taxista
	20,//Taxista Aereo
	70,//Instrutor
	40,//Traficante
	20,//Jornalista
	60,//Paramedico
	90,//Advogado
	50,//Militar
	60,//Rodoviario
	90,//Swat
	70,//Narcoticos
	130,//Juiz
	160,//Delegado
	20,//Lixeiro
	40,//Transporte
	60,//Contrabandista
	70,//Receita
	30,//Agricultor
	60,//Assaltante
	50,//Frentista
	70,//Locador
 	10,//Pedreira
  	50,//Vendedor de Armas
   	50,//Mecanico
    40,//Prostituta
    90,//Lider de Tr·fico
	80,//Corretor de Seguros
	110//EXERCITO
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
	"Motorista de ‘nibus",
	"Caminhoneiro",
	"Pescador",
	"Entregador de Pizza",
	"Taxista",
	"Mototaxista",
	"Taxista AÈreo",
	"Instrutor de DireÁ„o",
	"Traficante",
	"Jornalista",
	"ParamÈdico",
	"Advogado",
	"Cop Militar",
	"Cop Rodovi·rio",
	"Cop Elite/SWAT",
	"Cop Narcoticos",
	"Juiz",
	"Delegado",
	"Lixeiro",
	"Transporte de Valores",
	"Contrabandista",
	"Receita Federal",
 	"Agricultor",
 	"Assaltante",
 	"Frentista",
 	"Locador de Carros",
 	"Pedreira",
 	"Vendedor de Armas",
 	"Mec‚nico",
 	"Prostituta",
 	"LÌder de Tr·fico",
 	"Corretor de seguros",
 	"EXERCITO"
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
	"Pol¢cia SWAT",
	"Pol¢cia Narc¶ticos",
	"Juiz",
	"Delegado",
	"Lixeiro",
	"Transporte de Valores",
	"Contrabandista",
	"Receita Federal",
 	"Agricultor",
 	"Assaltante",
 	"Frentista",
 	"Locador de Carros",
 	"Pedreira",
 	"Vendedor de Armas",
 	"Mecanico",
 	"Prostituta",
 	"L¢der de Tròfico",
 	"Corretor de seguros",
 	"EXERCITO"
};
new IntSalario[] = {
	0,//Inv·lida
	350,//Desempregado
	1000,//Barman
	400,//Assassino
	350,//Vendedor De carros
	350,//Corretor
	2000,//SeguranÁa
	2000,//Motorista Partic
	1500,//Motorista Onibus
	800,//Caminhoneiro
	1000,//Pescador
	900,//Entregador Pizza
	1500,//Taxista
	1500,//Mototaxista
	2500,//Aero Taxista
	850,//Instrutor
	1200,//Traficante
	1500,//Jornalista
	1000,//Paramedico
	1000,//Advogado
	1400,//Cop Militar
	1700,//Cop Rodoviaria
	2000,//Cop Swat
	2000,//Cop Narcoticos
	4000,//Juiz
	4500,//Delegado
	1000,//Lixeiro
	800,//Transporte Valores
	800,//Contrabandista
	3000,//Receita Federal
	1200,//Agricultor
	600,//Assaltante
	1200,//Frentista
	1000,//Locador de Carros
	1500,//Pedreira
	1400,//Vendedor de Armas
	1000,//Mecanico
	800,//Prostituta
	2000,//Lider de Trafico
	1400,//Corretor de Seguros
	4000//EXERCITO
};
new StringsSalario[][] = {
	"invalido",
	"Seu seguro desemprego foi depositado, n„o vai procurar emprego? $350",
	"O Life's Club depositou seu sal·rio: $1000",
	"A AgÍncia de crimes de Los Santos depositou seu sal·rio $400",
	"A Revendedora Your Life Car's depositou seu sal·rio: $350",
	"A Imobili·ria San fierro imoveis depositou seu sal·rio: $350",
	"A SecurityLife depositou seu sal·rio: $2000",
	"A LuxLimosine depositou seu sal·rioo: $2000",
	"A Companhia de ‘nibus depositou seu sal·rio: $2000",
	"A Companhia de Transportes RoadTrain depositou seu sal·rio: $800",
	"Sal·rio da cooperativa recebido: $1000",
	"A Well Stacked Pizza depositou seu sal·rio: $900",
	"A Yellow's Taxis depositou seu sal·rio: $1500",
	"A Yellow's Taxis depositou seu sal·rio: $1500",
	"A Air Yellow's Taxis depositou seu sal·rio: $2500",
	"A Auto-escola de Los Santos depostiou seu sal·rio: $850",
	"A Boca de fumo que vocÍ comanda rendeu: $1200",
	"O Diretor da Folha De Los Santos depositou seu sal·rio: $1500",
	"O Hospital Geral de Los Santos depositou seu sal·rio: $1000",
	"A Empresa de Advogados depositou seu sal·rio: $1000",
	"A Delegacia de Los Santos depositou seu sal·rio: $1200",
	"A Delegacia de Los Santos depositou seu sal·rio $1400",
	"A Delegacia de Los Santos depositou seu sal·rio $2000",
	"A Delegacia de Los Santos depositou seu sal·rio $2000",
	"O Governo Federal depositou seu sal·rio: $4000",
	"A Prefeitura de Los Santos depositou seu sal·rio: $4500",
	"O Lix„o de Los Santos depositou seu sal·rio: $1000",
	"A Central 24/7 depositou seu sal·rio: $800",
	"Contrabando lhe gerou: $800",
	"A Prefeitura de Los Santos depositou seu sal·rio: 3000",
	"A Fazenda depositou seu sal·rio: $1200",
	"A partilha dos roubos deu: $600",
	"A Motos S/A LTDA depositou seu sal·rio: $1200",
	"A Los Santos Company CAR depositou seu sal·rio: $1000",
	"A Pedreira de Las Venturas depositou seu sal·rio: $1500",
	"A Ammu Nation depositou seu sal·rio: $1400",
	"A Pay 'n' Spray depositou seu sal·rio: $1000",
	"A Boate depositou seu sal·rio: $800",
	"VocÍ recebeu os lucros do tr·fico de drogas na cidade: R$2000",
	"A Empresa de seguros Virtual SA depositou seu sal·rio: R$1400",
	"A Marinha depositou seu sal·rio: R$4000"
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
	COLOR_COP_SWAT,
	COLOR_COP_NARCOTICOS,
	COLOR_JUIZ,
	COLOR_DELEGADO,
    COLOR_LIXEIRO,
    COLOR_TRANSPORTE_DE_VALORES,
    COLOR_CONTRABANDISTA,
    COLOR_RECEITA_FEDERAL,
    COLOR_AGRICULTOR,
    COLOR_ASSALTANTE,
    COLOR_FRENTISTA,
    COLOR_LOCADOR_DE_CARROS,
    COLOR_PEDREIRA,
    COLOR_VENDEDOR_DE_ARMAS,
    COLOR_MECANICO,
    COLOR_PROSTITUTA,
    COLOR_LIDER_DE_TRAFICO,
    COLOR_CORRETOR_SEGUROS,
    COLOR_EXERCITO
};
new Float:Hospitais[4][4] = {
	    {-2651.6501,634.1177,14.4531,180.0},//Hospital de SF
		{1173.5842,-1324.5615,15.1953,15.19},
		{2031.9415,-1404.3578,17.2614,17.2614},
		{1582.5615,1768.7921,10.8203,93.7454}
};
new Float:ProfPos[41][3] = {
	{223.0134,110.3193,999.0156},//Nothing
	{1742.9363,-1860.3250,13.5789},//Desempregado
	{1833.0266,-1682.5698,13.4905},//Barman
	{2420.3650,-1277.3169,24.6585},//Assassino
	{942.8879,-1743.0459,13.5546},//Vendedor
	{942.9459,-1743.0730,13.5546},//Corretor
	{1218.5189,-1813.0267,16.5938},//SeguranÁa
	{1218.5189,-1813.0267,16.5938},//Motorista
	{1753.7489,-1893.6107,13.5571},//MOnibus
	{-551.8864,2593.8428,53.9348},//Caminhoneiro
	{723.2698,-1494.2714,1.9343},//Pescador
	{2100.5085,-1806.6075,13.5547},//EPizza
	{1654.7979,-1074.3058,23.8984},//Taxi
	{1654.7979,-1074.3058,23.8984},//MTaxi
	{1654.7979,-1074.3058,23.8984},//ATaxi
	{1766.6227,-2038.8000,13.5212},//Instrutor
	{2182.7061,-1074.6581,55.5280},//Traficante
	{739.4120,-1355.6163,13.5000},//Jornalista
	{1172.4821,-1323.4320,15.4032},//ParamÈdico
	{1788.7454,-1295.3768,13.4763},//Advogado
	{1546.0544,-1675.3378,13.5616},//PolÌcia Militar
	{1546.0544,-1675.3378,13.5616},//PolÌcia Rodovi·ria
	{1546.0544,-1675.3378,13.5616},//PolÌcia Swat/Elite
	{1546.0544,-1675.3378,13.5616},//PolÌcia Narcoticos
	{1480.9635,-1762.8883,18.7958},//Juiz
	{1480.9635,-1762.8883,18.7958},//Delegado
	{2197.3296,-1999.1161,19.5405},//Lixeiro
	{2546.9211,1963.0864,10.8203},//Transporte de Valores
	{2730.0046,-2452.3933,17.5937},//Contrabandista
	{1480.9635,-1762.8883,18.7958},//Receita Federal
	{-1060.5527,-1195.2561,129.5891},//Agricultor
	{2420.3650,-1277.3169,24.6585},//Assaltante
	{1929.5538,-1779.9630,13.5469},//Frentista
	{205.2888,-1459.2094,13.0272},//Locador de Carros
	{817.2215,856.4513,12.7891},//Pedreira
	{2398.6543,-1979.9775,13.5469},//Vendedor de Armas
	{2074.8208,-1837.0865,13.5545},//Mec‚nico
	{2421.6042,-1224.7599,25.2050},//Prostituta
	{2182.7061,-1074.6581,55.5280},//Lider de Trafico
	{1218.5189,-1813.0267,16.5938},//Corretor de seguros
	{1546.0544,-1675.3378,13.5616}//EXERCITO
};
new ProfSkin[] = {
	0,//Nothing
	0,//Desempregado
	171,//Barman
	127,//Assassino
	187,//Vendedor
	59,//Corretor
	164,//SeguranÁa
	255,//Motorista Particular
	112,//Motorista De Onibus
	95,//Caminhoneiro
	35,//Pescador
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
 	285,//COP Swat
 	126,//COP NarcÛticos
	59,//Juiz
	125,//Delegado
	137,//Lixeiro
	71,//Transportador De Valores
	127,//Contrabandista
	165,//Receita Federal
	159,//Agricultor
	19,//Assaltante
	59,//FRENTISTA
	147,//Locador De Carros
	27,//Pedreira
	179,//Vendedor de Armas
	50,//Mec‚nico
	246,//Prostituta
	29,//Lider de Trafico
	17,//Corretor de seguros
	287//EXERCITO
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
//Sabores
new SaborName[][] = {
	"Milho verde",
	"Morango",
	"Leite Condensado",
	"Flocos",
	"Creme",
	"Abacaxi",
	"Chocolate",
	"Lim„o",
	"Tutti-Fruti"
};
new SaborValor[] = {
	5,
	5,
	7,
	5,
	4,
	5,
	7,
	4,
	5
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

new ProfWeapons[][6] = {
	{0,0,0,0,0,0,},//nothing
	{41,500,5,1,0,0},//desempregado
	{4,1,0,0,0,0},//barman
	{4,1,0,0,0,0},//assassino
	{5,1,0,0,0,0},//vendedor
	{5,1,0,0,0,0},//corretor
	{3,1,0,0,0,0},//seguranÁa
	{5,1,0,0,0,0},//motorista particular
	{5,1,0,0,0,0},//motorista de onibus
	{5,1,0,0,0,0},//caminhoneiro
	{5,1,0,0,0,0},//pescador
	{5,1,0,0,0,0},//entregador
	{5,1,0,0,0,0},//taxista
	{5,1,0,0,0,0},//mototaxi
   	{5,1,0,0,0,0},//taxi aereo
	{5,1,0,0,0,0},//instrutor
	{5,1,4,1,0,0},//traficante
	{5,1,0,0,0,0},//jornalista
	{5,1,0,0,0,0},//paramÈdico
	{5,1,0,0,0,0},//advogado
	{3,1,0,0,0,0},//cop militar
	{3,1,0,0,0,0},//rodoviario
	{3,1,0,0,0,0},//swat
	{3,1,0,0,0,0},//cop narcoticos
	{15,1,0,0,0,0},//JuÌz
	{3,1,0,0,0,0},//Delegado
	{5,1,0,0,0,0},//lixeiro
	{3,1,0,0,0,0},//transporte valores
	{4,1,0,0,0,0},//contrabandista
	{3,1,0,0,0,0},//receita
	{5,1,0,0,0,0},//agricultor
	{4,1,0,0,0,0},//assaltante
	{5,1,0,0,0,0},//frentista
	{5,1,0,0,0,0},//locador
	{5,1,0,0,0,0},//pedreira
	{29,460,24,200,30,200},//vendedor armas
	{5,1,0,0,0,0},//mecanico
	{3,1,0,0,0,0},//prostituta
	{4,1,0,0,0,0},//lider de trafico
	{5,1,0,0,0,0},//Corretor de seguros
	{3,1,0,0,0,0}//exercito
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

new CarName[][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perenial", "Sentinel",
	"Pedreira", "Bombeiros", "Caminhao de Lixo", "Limosine", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulancia", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
	"Hunter", "Premier", "Enforcer", "Carro Forte", "Banshee", "Predator", "Onibus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Onibus", "Taxi",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Bonde", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quadriciclo", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
	"Blista Compact", "Police Maverick", "Boxvillde", "Benson", "Mesa", "RC Goblin",
	"Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
	"Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
 	"Tank", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
 	"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
	"Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"Reportagem", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
 	"Viatura Policial", "Viatura Policial", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "Utility Trailer"
};
new CarValor[] =
{
    30000, 25000, 78000, 45000, 15000, 40000,
	45000, 50000, 47000, 120000, 8000, 400000,
	20000, 38000, 39000, 170000, 38000, 28000, 41000,
    30000, 35000, 37000, 27000, 30000, 36000,
	34000, 33000, 40000, 36000, 100000, 34000, 32000,
	27000, 32000, 110000, 31000, 32000, 31000, 43000,
	32000, 36000, 34000, 34000, 27000, 250000, 42000,
	360000, 240000, 41000, 30000, 10000, 350000, 380000,
	40000, 160000, 34000, 30000, 18000, 33000, 40000,
	260000, 10000, 2000, 18000, 40000, 40000, 33000,
	47000,12000, 210000, 40000, 9000, 40000, 7000,
	1227000, 24000, 40000, 280000, 30000, 39000, 95000, 100,
	30000, 19000, 460000, 41000, 36000, 700000, 40000,
	52000, 40000, 30000, 30000, 450000, 36000, 25000,
	33000, 35000, 41000, 29000, 52000, 36000,
	32000, 41000, 40000, 37000, 230000,
	40000, 36000, 100, 100, 36000, 29000,
 	32000, 35000, 26000, 36000, 32000, 35000, 34000,
 	30000, 60000, 34000, 40000, 45000, 45000,
 	22000, 25000, 30000, 36000, 40000, 45000, 19000,
 	40000, 60000, 19000, 42000, 43000, 47000, 23000,
    150000, 4000, 40000, 40000, 50000, 28000, 28000,
	30000, 15000, 85000, 95000, 95000, 50000, 38000,
	100000, 100000, 100000, 52000, 80000, 95000, 105000,
	95000, 105000, 35000, 80000, 45000, 37000, 51000,
    35000, 43000, 13000, 41000, 47000, 50000,
	50000, 35000, 29000, 35000, 43000, 39000, 22000,
	30000, 40000, 34000, 40000, 41000, 110000, 30000, 16000,
	47000, 45000, 40000, 31000, 27000, 35000, 40000,
 	40000, 30000, 25000, 19000, 26000, 60000,
 	74000, 30000, 20000, 34000, 53000, 32000, 45000,
 	30000, 30000
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

//Arrays do sistema de Experience Level
new VeiculoConsertado[MAX_VEHICLES] = 0;
new VeiculoPintado[MAX_VEHICLES] = 0;
new CasaVendida[MAX_PLAYERS] = 0;
new CarroAbastecido[MAX_VEHICLES] = 0;
new JogadorMultado[MAX_PLAYERS] = 0;
forward ZerarVeiculoConsertado(vehicleid);
forward ZerarVeiculoPintado(vehicleid);
forward ZerarCarroAbastecido(vehicleid);
forward ZerarCasaVendida(playerid);
forward ZerarJogadorMultado(playerid);
public ZerarVeiculoConsertado(vehicleid) VeiculoConsertado[vehicleid]=0;
public ZerarVeiculoPintado(vehicleid) VeiculoPintado[vehicleid]=0;
public ZerarCasaVendida(playerid) CasaVendida[playerid]=0;
public ZerarCarroAbastecido(vehicleid) CarroAbastecido[vehicleid]=0;
public ZerarJogadorMultado(playerid) JogadorMultado[playerid]=0;

main()
{
	print("\n---------------------------------------------");
	print("                 -BR- Reload Virtual Life RpG");
	print("---------------------------------------------\n");
	HoraJogo = 12;
	writelog("\n--------------------------------------------------------");
	writelog(" Reload Virtual Life RPG carregado!");
 	writelog(" ------------------------------------------------------");
 	writelog("  Feito por:	 Texugo	  Rafael   Guilherme ");
	writelog("--------------------------------------------------------\n");
}

stock TrancarVeiculoPorProf(playerid)
{
	for(new i=0; i<QTCARS; i++){
		if(Profissao[playerid] != MOTOTAXI){
			if(i == MotoTaxi || i == MotoTaxi2 || i == MotoTaxi3){
		    	SetVehicleParamsForPlayer(i,playerid, 0, 1);
		    }
		}
  		else{
		    SetVehicleParamsForPlayer(i,playerid, 0, 0);
		}
		if(Profissao[playerid] != TAXI_AEREO){
		    if(i == AeroTaxi){
		    	SetVehicleParamsForPlayer(i,playerid, 0, 1);
			}
		}
		else{
		    SetVehicleParamsForPlayer(i,playerid, 0, 0);
		}
		if(Profissao[playerid] != MOTORISTA){
			if(i == limosine1 || i == limosine2){
		    	SetVehicleParamsForPlayer(i,playerid, 0, 1);
			}
		}
		else{
		    SetVehicleParamsForPlayer(i,playerid, 0, 0);
		}
		if(Profissao[playerid] != TAXISTA){
            if(i == Taxi1 || i == Taxi2 || i == Taxi3){
				SetVehicleParamsForPlayer(i,playerid, 0, 1);
			}
		}
  		else{
		    SetVehicleParamsForPlayer(i,playerid, 0, 0);
		}
		if(Profissao[playerid] != JORNALISTA){
	 		if(i == CarroJornal || i == CarroJornal2 || i == CarroJornal3){
  				SetVehicleParamsForPlayer(i,playerid, 0, 1);
			}
		}
		else{
		    SetVehicleParamsForPlayer(i,playerid, 0, 0);
		}
		if(Profissao[playerid] != ENTREGADOR_PIZZA){
	 		if(i == MotoPizza || i == MotoPizza2 || i == MotoPizza3 || i == MotoPizza4){
		    	SetVehicleParamsForPlayer(i,playerid, 0, 1);
			}
		}
		else{
		    SetVehicleParamsForPlayer(i,playerid, 0, 0);
		}
		if(Profissao[playerid] != INSTRUTOR){
			if(i == CarroAuto || i == CarroAuto2 || i == CarroAuto3 || i == CarroAuto4 || i == CarroAuto5 || i == CarroAuto6){
		    	SetVehicleParamsForPlayer(i,playerid, 0, 1);
		    }
		}
        else{
		    SetVehicleParamsForPlayer(i,playerid, 0, 0);
		}
		if(GetVehicleModel(i) == 596 || GetVehicleModel(i) == 597 || GetVehicleModel(i) == 598 || GetVehicleModel(i) == 599 || GetVehicleModel(i) == 523){
			if(Profissao[playerid] != COP_SWAT && Profissao[playerid] != EXERCITO && Profissao[playerid] != COP_MILITAR && Profissao[playerid] != COP_RODOVIARIO && Profissao[playerid] != COP_NARCOTICOS && Profissao[playerid] != DELEGADO){
				SetVehicleParamsForPlayer(i,playerid, 0, 1);
			}
			else{
                SetVehicleParamsForPlayer(i,playerid, 0, 0);
			}
		}
	}
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

writelog(log[])
{
	fixchars(log);
	if(!fexist("RPGLog.txt")){
	    dini_Create("RPGLog.txt");
	    new File:logstr;
	    logstr = fopen("RPGLog.txt", io_append);
	    fwrite(logstr,"|--------------------------------------------------------------------------------|");
        fwrite(logstr,"\r\n");
		fwrite(logstr,"|-                                  RPGLog.txt                                  -|");
		fwrite(logstr,"\r\n");
		fwrite(logstr,"|-           Essa pasta ter· todos os dados do servidor, isto inclue:           -|");
		fwrite(logstr,"\r\n");
		fwrite(logstr,"|-       			    Monitoramentos           			-|");
		fwrite(logstr,"\r\n");
		fwrite(logstr,"|-       			        Bugs                                    -|");
		fwrite(logstr,"\r\n");
		fwrite(logstr,"|-       			       Avisos					-|");
		fwrite(logstr,"\r\n");
		fwrite(logstr,"|-                                      etc...				        -|");
		fwrite(logstr,"\r\n");
		fwrite(logstr,"|- Sempre È bom passar aqui e dar uma lida para ver o que acontece no servidor! -|");
        fwrite(logstr,"\r\n");
        fwrite(logstr,"|--------------------------------------------------------------------------------|");
		fwrite(logstr,"\r\n");
		fclose(logstr);
	} else {
		new File:logstr;
		logstr = fopen("RPGLog.txt", io_append);
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
	for(new hospid; hospid < 4; hospid++){
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

public LogarPlayer(playerid){
    new weapon,ammo;
    for(new s=0; s<13; s++){
    	GetPlayerWeaponData(playerid, s, weapon, ammo);
    	SaveWeapons(playerid, weapon, ammo);
    }
    if(dini_Exists(PlayerName(playerid))){
    ExPoints[playerid] = dini_Int(PlayerName(playerid),"ExPoints");
	QtIscas[playerid] = dini_Int(PlayerName(playerid),"Iscas");
	QtHeroina[playerid] = dini_Int(PlayerName(playerid),"DosesHeroina");
	QtMaconha[playerid] = dini_Int(PlayerName(playerid),"DosesMaconha");
	QtCocaina[playerid] = dini_Int(PlayerName(playerid),"DosesCocaina");
	Bebida[playerid] = dini_Int(PlayerName(playerid),"Alcool");
	QtPescas[playerid] = dini_Int(PlayerName(playerid),"Pesca");
	Latas[playerid] = dini_Int(PlayerName(playerid),"Latas");
	LatasNecessarias[playerid] = dini_Int(PlayerName(playerid),"LatasNecessarias");
	JogadorDoente[playerid] = dini_Int(PlayerName(playerid),"Doenca");
	GivePlayerMoney(playerid, dini_Int(PlayerName(playerid),"Dinheiro") - GetPlayerMoney(playerid));
	new Float:X = dini_Float(PlayerName(playerid),"SpawnPosX");
	new Float:Y = dini_Float(PlayerName(playerid),"SpawnPosY");
	new Float:Z = dini_Float(PlayerName(playerid),"SpawnPosZ");
	new Float:ang = dini_Float(PlayerName(playerid),"SpawnPosAng");
	if(dini_Int(PlayerName(playerid),"LocouCasa") == 1){
	    X = dini_Float(dini_Get(PlayerName(playerid),"DonoCasaAlugada"),"SpawnPosX");
	    Y = dini_Float(dini_Get(PlayerName(playerid),"DonoCasaAlugada"),"SpawnPosY");
	    Z = dini_Float(dini_Get(PlayerName(playerid),"DonoCasaAlugada"),"SpawnPosZ");
	    ang = dini_Float(dini_Get(PlayerName(playerid),"DonoCasaAlugada"),"SpawnPosAng");
	}
	SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
	Profissao[playerid] = dini_Int(PlayerName(playerid),"Prof");
	SetPlayerWantedLevel(playerid,dini_Int(PlayerName(playerid),"Wanted"));
	SendClientMessage(playerid, COLOR_GREEN, "Logado.");
	if(dini_Int(PlayerName(playerid),"Preso") == 1 || Procurados[playerid] == 1){
	Procurados[playerid] = 0;
	new cela;
	Presos[playerid] = 1;
	cela = random(3);
	ChatNotDisable[playerid] = 0;
	SetPlayerFacingAngle(playerid,0);
	SetPlayerInterior(playerid,10);
	PrisaoTimer[playerid][1]=1;
	PrisaoTimer[playerid][0]=SetTimerEx("SetPlayerFree",5*60*1000,0,"d",playerid);
	SetPlayerPos(playerid,Celas[cela][0],Celas[cela][1],Celas[cela][2]);
	SendClientMessage(playerid,COLOR_RED,"VocÍ deve ter cometido algum crime, por isso foi preso.");
	SendClientMessage(playerid,COLOR_RED,"Para sair mais cedo da pris„o, vocÍ pode contatar um aadvogado e fazer um acordo para sair.");
	}
	else{
		SpawnPlayer(playerid);
		}
	}
	else{
		printf("ERRO: N„o foi possÌvel fazer login no jogador %s",PlayerName(playerid));
		printf("Pois seu arquivo n„o foi encontrado!");
		new msg[256];
		format(msg,sizeof(msg),"SERVIDOR: N„o foi possÌvel fazer login no jogador %s,",PlayerName(playerid));
		writelog(msg);
		writelog("Pois seu arquivo n„o foi encontrado!");
		}
}

public ConfiscarArmas(playerid)
{
	if(dini_Exists(PlayerName(playerid)))
	{
			ResetPlayerWeapons(playerid);
	    	new weapon,ammo;
	    	for(new s=0; s<13; s++){
	    	GetPlayerWeaponData(playerid, s, weapon, ammo);
	    	if(dini_Int(PlayerName(playerid),"Porte") == 0){
				dini_IntSet(PlayerName(playerid),"WeaponSlot0",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot0Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot1",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot1Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot2",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot2Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot3",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot3Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot4",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot4Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot5",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot5Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot6",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot6Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot7",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot7Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot8",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot8Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot9",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot9Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot10",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot10Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot11",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot11Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot12",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot12Ammo",0);
			}
	    	else if(dini_Int(PlayerName(playerid),"Porte") == 1){
	        	if(weapon == 4){
	            	dini_IntSet(PlayerName(playerid),"WeaponSlot1",0);
					dini_IntSet(PlayerName(playerid),"WeaponSlot1Ammo",0);
				}
	        	if(weapon == 25){
			    	dini_IntSet(PlayerName(playerid),"WeaponSlot3",0);
					dini_IntSet(PlayerName(playerid),"WeaponSlot3Ammo",0);
				}
	        	if(weapon == 29){
			    	dini_IntSet(PlayerName(playerid),"WeaponSlot4",0);
					dini_IntSet(PlayerName(playerid),"WeaponSlot4Ammo",0);
				}
	        	if(weapon == 30 || weapon == 31){
	        		dini_IntSet(PlayerName(playerid),"WeaponSlot5",0);
					dini_IntSet(PlayerName(playerid),"WeaponSlot5Ammo",0);
				}
				dini_IntSet(PlayerName(playerid),"WeaponSlot7",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot7Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot8",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot8Ammo",0);
			}
			else if(dini_Int(PlayerName(playerid),"Porte") == 2){
				dini_IntSet(PlayerName(playerid),"WeaponSlot7",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot7Ammo",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot8",0);
				dini_IntSet(PlayerName(playerid),"WeaponSlot8Ammo",0);
			}
		}
	}
}
stock SendClientMessagePolicia(text_color, string_text[]){
    for(new i=0;i<MAX_PLAYERS;i++)
    {
        if(IsPlayerConnected(i))
        {
            if(Profissao[i] == COP_SWAT || Profissao[i] == EXERCITO || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_MILITAR || Profissao[i] == COP_NARCOTICOS || Profissao[i] == DELEGADO)
            {
            SendClientMessage(i, text_color, string_text);
            }
        }
    }
}

stock SendClientMessageJuiz(text_color, string_text[]){
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(Profissao[i] == JUIZ || IsPlayerAdmin(i))
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}
stock SendClientMessageVendedor(text_color, string_text[]){
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(Profissao[i] == VENDEDOR_DE_ARMAS)
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}
stock SendClientMessageCarros(text_color, string_text[]){
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(Profissao[i] == LOCADOR_DE_CARROS)
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}
stock SendClientMessageAdmin(text_color, string_text[]){
	for(new i=0;i<MAX_PLAYERS;i++)
		{
            if(IsPlayerConnected(i))
            if(IsPlayerAdmin(i))
			{
			SendClientMessage(i, text_color, string_text);
			}
		}
}

stock SendClientMessageAssalt(text_color, string_text[]){
    for(new i=0;i<MAX_PLAYERS;i++)
    {
        	if(IsPlayerConnected(i))
       		if(Profissao[i] == ASSALTANTE || RECEITA_FEDERAL)
            {
            SendClientMessage(i, text_color, string_text);
            }
        }
}

public SetPlayerFree(playerid){
	if(dini_Exists(PlayerName(playerid))){
    dini_IntSet(PlayerName(playerid),"Preso",0);
    Presos[playerid] = 0;
    SetSpawnInfo(playerid,0,dini_Int(PlayerName(playerid),"Skin"),1546.5948,-1675.9949,13.5626,0,0,0,0,0,0,0);
    SpawnPlayer(playerid);
    SendClientMessage(playerid,COLOR_GREEN,"VocÍ foi solto, mas se cometer mais crimes, pagar· novamente.");
    Contrabando[playerid] = 0;
	Receita[playerid] = 0;
	SetPlayerWantedLevel(playerid, 0);
	dini_IntSet(PlayerName(playerid),"Wanted",0);
	}
	else{
		printf("Bug encontrado ao soltar %s da pris„o",PlayerName(playerid));
		printf("O arquivo do jogador n„o foi encontrado.");
		new msg[256];
		format(msg,sizeof(msg),"SERVIDOR: Bug encontrado ao soltar %s da pris„o,",PlayerName(playerid));
		writelog(msg);
		writelog("o arquivo do jogador n„o foi encontrado na pasta 'scriptfiles'");
	}
}

forward MoneyGrubScoreUpdate();
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

public FazendoStripTease(playerid)
{
   if(FazendoStrip[playerid] == 1){
      FST[playerid] = 0;
      ApplyAnimation(playerid,"STRIP","STR_Loop_A",4.1,0,1,1,1,1);
	  TimerStrip[playerid] = SetTimerEx("FazendoStripTease",100,false,"d",playerid);
   }
}
public OnPlayerKeyStateChange(playerid,newkeys,oldkeys){

	if((newkeys == KEY_SECONDARY_ATTACK && NoRestaurante[playerid] == 1)){
	    SetPlayerPos(playerid,681.3098,-452.4630,-25.6172);
		SetPlayerFacingAngle(playerid,177.7975);
		SetPlayerInterior(playerid,1);
		NoRestaurante[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
		SetPlayerCheckpoint(playerid,683.9002,-455.4134,-25.6099,1.5);
		CheckpointStatus[playerid] = RESTAURANTE;
		StatusCheck[playerid] = NONEE;
		SendClientMessage(playerid, COLOR_GREEN, "Para sair do restaurante pressione a tecla ENTER!");
	}
	if((newkeys == KEY_SECONDARY_ATTACK && NoRestaurante2[playerid] == 1)){
	    SetPlayerPos(playerid,1477.3245,-1880.2889,13.5469);
		SetPlayerInterior(playerid,0);
		NoRestaurante2[playerid] = 0;
	}
    if((newkeys == KEY_LEFTP)&&(FazendoStrip[playerid] == 1)&&(FST[playerid] == 0)){
		KillTimer(TimerStrip[playerid]);
		ApplyAnimation(playerid,"STRIP","STR_C1",4.1,0,1,1,1,1);
		FST[playerid] = 1;
		TimerStrip[playerid] = SetTimerEx("FazendoStripTease",5500,false,"d",playerid);
	}
	if((newkeys == KEY_RIGHTP)&&(FazendoStrip[playerid] == 1)&&(FST[playerid] == 0)){
		KillTimer(TimerStrip[playerid]);
		ApplyAnimation(playerid,"STRIP","STR_B2C",4.1,0,1,1,1,1);
		FST[playerid] = 1;
		TimerStrip[playerid] = SetTimerEx("FazendoStripTease",5000,false,"d",playerid);
	}
    if((newkeys == KEY_UPP)&&(FazendoStrip[playerid] == 1)&&(FST[playerid] == 0)){
		KillTimer(TimerStrip[playerid]);
		ApplyAnimation(playerid,"STRIP","STR_C2",4.1,0,1,1,1,1);
		FST[playerid] = 1;
		TimerStrip[playerid] = SetTimerEx("FazendoStripTease",5000,false,"d",playerid);
	}
	if((newkeys == KEY_DOWNP)&&(FazendoStrip[playerid] == 1)&&(FST[playerid] == 0)){
		KillTimer(TimerStrip[playerid]);
		ApplyAnimation(playerid,"STRIP","STR_A2B",4.1,0,1,1,1,1);
		FST[playerid] = 1;
		TimerStrip[playerid] = SetTimerEx("FazendoStripTease",4500,false,"d",playerid);
	}
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
	print("Carregando Gamemode RPG");
	writelog("\r\n");
	AgendaTestes = 1;
	EnableZoneNames(1);
	AllowInteriorWeapons(1);
	EnableStuntBonusForAll(0);
	EnableTirePopping(1);
	new Segundo,Minuto,Hora,Dia,Mes,Ano, msg[256];
	gettime(Hora,Minuto,Segundo);
	getdate(Ano,Mes,Dia);
	format(msg,sizeof(msg),"Gamemode iniciado em %d/%d/%d ‡s %d:%d:%d.",Dia,Mes,Ano,Hora,Minuto,Segundo);
	writelog(msg);
	writelog("Carregando Reload Virtual Life RpG...");
	SetGameModeText("Virtual Life RPG");
	
//|------------------------------------[ TEXTDRAWS ]--------------------------------------------------
	Bemvindo = TextDrawCreate(320,130,"~b~Virtual ~r~L~w~i~r~f~w~e ~y~R~b~P~g~G");
	TextDrawColor(Bemvindo,0xFFF000FF);
	TextDrawAlignment(Bemvindo,2);
	TextDrawFont(Bemvindo,0);
	TextDrawLetterSize(Bemvindo,2.2,4.8);
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
	//Pizzaria
	tdPizzaria = TextDrawCreate(5,300,"Pizzaria");
	TextDrawColor(tdPizzaria,COLOR_PALHA);
	TextDrawAlignment(tdPizzaria,0);
	TextDrawFont(tdPizzaria,0);
	TextDrawLetterSize(tdPizzaria,2,2);
	//lixao-td
	tdLixao = TextDrawCreate(5,300,"Lixöo ou~n~Ferro-Velho");
	TextDrawColor(tdLixao,COLOR_TRAFICANTE);
	TextDrawFont(tdLixao,0);
	TextDrawLetterSize(tdLixao,2,2);
	//delegacia-td
	Delegacia = TextDrawCreate(5,300,"Delegacia");
	TextDrawColor(Delegacia,COLOR_YELLOW);
	TextDrawAlignment(Delegacia,0);
	TextDrawFont(Delegacia,0);
	TextDrawLetterSize(Delegacia,2,2);
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
	//Sorveteria
	tdSorveteria = TextDrawCreate(5,300,"Sorveteria");
	TextDrawColor(tdSorveteria,COLOR_ROSACLARO);
	TextDrawAlignment(tdSorveteria,0);
	TextDrawFont(tdSorveteria,0);
	TextDrawLetterSize(tdSorveteria,2,2);
	//Loja de customizaÁ„o
	tdCustomizacao = TextDrawCreate(5,300,"Loja de ~n~Customizaúöo");
	TextDrawColor(tdCustomizacao,COLOR_VERDECLARO);
	TextDrawAlignment(tdCustomizacao,0);
	TextDrawFont(tdCustomizacao,0);
	TextDrawLetterSize(tdCustomizacao,2,2);
	//Loteria
	tdLoteria = TextDrawCreate(5,300,"Loteria");
	TextDrawColor(tdLoteria,COLOR_CORRETOR_SEGUROS);
	TextDrawAlignment(tdLoteria,0);
	TextDrawFont(tdLoteria,0);
	TextDrawLetterSize(tdLoteria,2,2);
	//Loteria de cavalos
	tdLCavalos = TextDrawCreate(5,300,"Loteria de ~n~cavalos");
	TextDrawColor(tdLCavalos,COLOR_BARMAN);
	TextDrawAlignment(tdLCavalos,0);
	TextDrawFont(tdLCavalos,0);
	TextDrawLetterSize(tdLCavalos,2,2);
	//Locadora
	tdLocadora = TextDrawCreate(5,300,"Locadora");
	TextDrawColor(tdLocadora,COLOR_LIDER_DE_TRAFICO);
	TextDrawAlignment(tdLocadora,0);
	TextDrawFont(tdLocadora,0);
	TextDrawLetterSize(tdLocadora,2,2);
	//Bar
	tdBar = TextDrawCreate(5,280,"Bar");
	TextDrawColor(tdBar,COLOR_BARMAN);
	TextDrawAlignment(tdBar,0);
	TextDrawFont(tdBar,0);
	TextDrawLetterSize(tdBar,2,2);
	//Delegacia
	tdDelegacia = TextDrawCreate(5,280,"Delegacia");
	TextDrawColor(tdDelegacia,COLOR_COP_MILITAR);
	TextDrawAlignment(tdDelegacia,0);
	TextDrawFont(tdDelegacia,0);
	TextDrawLetterSize(tdDelegacia,2,2);
	
    PescaArea = GangZoneCreate(396.2206,-2490.5803,813.0812,-2063.8291);
    InstrutorArea = GangZoneCreate(1730.8315,-2076.4917,1811.4198,-2021.2544);
    ProstitutaArea = GangZoneCreate(2391.9038,-1245.3613,2440.9629,-1209.1268);
    TaxiArea = GangZoneCreate(1612.3163,-1139.9810,1687.0649,-1040.5436);
    DesmancheArea = GangZoneCreate(2521.7185,-1720.9760,2535.7808,-1699.4797);
    SorveteriaArea = GangZoneCreate(1559.7327,-1898.0133,1576.1588,-1881.8749);
    
//|------------------------------------[ VEÕCULOS ]--------------------------------------------------
	AddPlayerClass(170, -1958.5107, 293.6747, 35.4688, 269.1425, 0, 0, 0, 0, 0, 0);
	AddStaticVehicle(400,-362.1651,1182.2360,19.9293,224.5314,23,23);//1
	AddStaticVehicle(400,-358.5877,1185.9308,19.9359,227.4491,23,23);//2
	AddStaticVehicle(406,831.4123,838.7061,11.8114,10.7364,27,27);//3
	AddStaticVehicle(406,825.0017,835.9022,11.3056,28.6806,27,27);//4
    AddStaticVehicle(428,2587.1069,1968.5189,10.3600,359.4350,2,125);//5
	AddStaticVehicle(428,2578.8755,1979.8069,10.3595,269.6775,2,125);//6
	AddStaticVehicle(428,2578.1614,1991.9865,10.3634,268.5700,2,125);//7
    AddStaticVehicle(416,1601.9666,1830.5586,10.9692,179.6767,6,3);//8
	AddStaticVehicle(416,1609.5704,1849.0504,10.9694,180.1948,6,3);//9
	AddStaticVehicle(481,1733.3511,-1750.2358,13.1041,359.0227,3,3);//10
	AddStaticVehicle(510,1735.0503,-1749.8060,13.1061,2.9314,2,2);//11
	AddStaticVehicle(509,1730.6892,-1749.8074,13.1054,0.2107,0,0);//12
	AddStaticVehicle(519,1564.3187,-2455.8386,13.1393,176.7860,0,0);//13
	AddStaticVehicle(487,1921.1626,-2292.6611,13.1141,273.2114,1,3);//14
	AddStaticVehicle(593,1821.0220,-2622.9812,13.1316,4.2006,3,1);//15
	AddStaticVehicle(496,2399.8655,-2009.8938,13.1832,269.2247,36,1);//16
	AddStaticVehicle(521,2530.2676,-2011.0364,13.1821,91.6209,36,1);//17
	AddStaticVehicle(531,-1067.3071,-1146.1510,129.2188,263.1791,0,0);//18
	AddStaticVehicle(531,-1042.8000,-1113.4921,129.2188,172.3349,0,0);//19
	AddStaticVehicle(492,-1062.0110,-1220.5941,129.2188,272.7150,5,5);//20
	AddStaticVehicle(523,-1574.3988,722.4133,-5.5151,88.7114,0,0);//21
	AddStaticVehicle(599,-1582.4146,672.9401,6.9159,1.3782,0,0);//22
	AddStaticVehicle(416,-2589.3899,637.8578,14.8142,93.1434,1,3);//23
	AddStaticVehicle(416,-2570.5264,632.3824,14.8083,91.5122,1,3);//24
	AddStaticVehicle(428,-2413.7605,535.7818,30.2737,79.1394,2,125);//25
	AddStaticVehicle(406,-2115.5364,188.9033,34.9001,267.4751,27,27);//26
	AddStaticVehicle(609,2765.1882,-2382.2258,13.6997,358.9371,79,0);//27
	AddStaticVehicle(530,2772.3267,-2424.4426,13.4038,93.5541,16,16); //28
	AddStaticVehicle(530,2772.3887,-2428.4539,13.4003,92.1269,0,0);//29
	AddStaticVehicle(585,2746.7949,-2447.6257,13.2329,270.3224,4,4);//30
	AddStaticVehicle(408,2159.3633,-1971.4208,14.0973,269.7029,1,4);//31
	AddStaticVehicle(408,2146.1206,-1971.5450,14.0976,270.3433,1,4);//32
	AddStaticVehicle(436,2465.3845,-2558.5488,13.4172,269.7191,0,0);//33
	AddStaticVehicle(461,2505.0012,-2636.7678,13.2188,267.7787,3,3);//34
	AddStaticVehicle(461,2170.3921,-2659.5852,13.1315,0.7963,0,0);//35
	AddStaticVehicle(487,1914.8511,-2247.8777,13.7238,184.6557,1,3);//36
	AddStaticVehicle(519,1692.2711,-2451.8022,14.4767,182.7362,0,0);//37
	AddStaticVehicle(427,1530.4825,-1644.2167,6.0226,0.2721,0,1);//38
	AddStaticVehicle(427,1534.8368,-1644.4755,6.0226,0.2481,0,1);//39
	AddStaticVehicle(490,1544.8265,-1654.9677,6.0182,270.0331,0,0);//40
	AddStaticVehicle(490,1544.9852,-1651.0159,6.0209,269.8402,0,0);//41
	AddStaticVehicle(601,1528.9193,-1677.4371,5.6495,94.8572,0,0);//42
	AddStaticVehicle(523,1586.2186,-1667.6611,5.4763,268.5813,0,0);//43
	AddStaticVehicle(523,1585.5693,-1671.7798,5.4624,268.4720,0,0);//44
	AddStaticVehicle(596,1600.2476,-1692.1685,5.6125,90.4433,0,1);//45
	AddStaticVehicle(596,1600.6448,-1684.0197,5.6112,90.1220,0,1);//46
	AddStaticVehicle(596,1587.7020,-1709.8081,5.6095,179.3531,0,1);//47
	AddStaticVehicle(599,1570.3877,-1709.3484,6.0758,180.6934,1,0);//48
	AddStaticVehicle(599,1574.4928,-1710.0585,6.0792,179.2536,1,0);//49
	AddStaticVehicle(497,1557.2480,-1609.4486,13.5194,267.8856,1,0);//50
	AddStaticVehicle(445,1455.9663,-1752.0988,13.4219,0.2017,0,0);//51
	AddStaticVehicle(480,1404.7682,-1780.0381,13.3192,268.7308,1,1);//52
	AddStaticVehicle(431,1804.2316,-1906.8671,13.5048,180.1803,106,106);//53
	AddStaticVehicle(431,1804.2971,-1927.5952,13.4861,180.1802,106,106);//54
	AddStaticVehicle(517,1778.2910,-1886.2679,13.2429,272.0609,6,6);//55
	AddStaticVehicle(517,1559.9014,-2251.0684,13.4022,270.1830,16,16);//56
	AddStaticVehicle(439,1536.1716,-2212.1941,13.4503,359.5571,77,77);//57
	AddStaticVehicle(458,1552.4875,-2211.9360,13.4496,179.4589,53,53);//58
	AddStaticVehicle(462,1552.8226,-2360.9094,13.4503,180.4037,3,3);//59
	AddStaticVehicle(474,1512.3892,-2361.5264,13.4465,2.7157,2,2);//60
	AddStaticVehicle(475,1559.8593,-2325.2949,13.4433,89.9776,3,3);//61
	AddStaticVehicle(467,1911.0831,-1775.8362,13.2784,359.2661,1,1);//62
	AddStaticVehicle(439,2052.5374,-1904.9375,13.4425,1.5015,3,3);//63
	AddStaticVehicle(500,1988.9980,-2058.5310,13.2663,89.8185,10,10);//64
	AddStaticVehicle(558,1736.0695,-1323.5487,13.2373,358.3241,13,13);//65
	AddStaticVehicle(562,1771.7740,-1303.7465,13.3406,179.9932,3,3);//66
	AddStaticVehicle(445,763.6828,-1378.5768,13.1999,0.3843,1,1);//67
	AddStaticVehicle(453,787.9286,-1901.9200,-0.2205,181.7859,0,0);//68
	AddStaticVehicle(453,776.9243,-1897.2621,-0.3764,173.2890,0,0);//69
	AddStaticVehicle(453,728.8290,-1494.8489,-0.4036,181.4149,0,0);//70
	AddStaticVehicle(453,718.1939,-1495.2104,-0.2883,179.7184,0,0);//71
	AddStaticVehicle(480,2425.6162,-1224.2859,25.0405,176.1279,126,126);//72
	AddStaticVehicle(439,2415.3428,-1224.9528,24.5806,359.1565,103,103);//73
	AddStaticVehicle(444,2808.9202,-1831.9814,9.6919,269.0453,0,0);//74
	AddStaticVehicle(461,2438.2285,-1279.7000,23.7659,264.7029,0,0);//75
	AddStaticVehicle(405,1262.6462,-1796.8795,13.2915,179.2647,0,0);//76
	AddStaticVehicle(405,1269.2242,-1796.1495,13.2810,180.8411,0,0);//77
	AddStaticVehicle(602,932.4058,-1715.0298,13.4203,271.8796,3,3);//78
	AddStaticVehicle(416,1180.0553,-1308.9070,13.8667,270.2787,3,1);//79
	AddStaticVehicle(416,1179.3953,-1338.5397,13.9476,271.7199,3,1);//80
	AddStaticVehicle(416,2036.1782,-1425.3702,17.1395,1.1178,3,1);//81
	AddStaticVehicle(492,2503.1892,-1747.8586,13.1863,178.0792,16,16);//82
	AddStaticVehicle(525,2066.2373,-1880.1583,13.1308,2.9639,1,1);//83
	AddStaticVehicle(525,2059.7856,-1880.6703,13.1225,177.3285,1,1);//84
	AddStaticVehicle(509,1922.7769,-1412.3431,13.7190,2.7285,1,1);//85
	AddStaticVehicle(510,1915.8792,-1412.2249,13.7195,3.4159,6,6);//86
	AddStaticVehicle(435,-510.2876,2552.6294,53.9990,360.0,1,1);//87
	AddStaticVehicle(435,-514.6652,2552.3184,53.9967,360.0,1,1);//88
	AddStaticVehicle(584,-539.6450,2552.9534,54.0036,360.0,1,1);//89
	AddStaticVehicle(584,-534.3781,2552.7854,54.0010,360.0,1,1);//90
	AddStaticVehicle(515,-538.8222,2633.9297,54.4309,178.9377,3,3);//91
	AddStaticVehicle(515,-526.8589,2633.6460,54.4351,179.1391,1,1);//92
	AddStaticVehicle(515,-520.0616,2633.5579,54.4314,180.5195,7,7);//93
	AddStaticVehicle(515,-507.3741,2633.9558,54.4342,177.3320,16,16);//94
    AddStaticVehicle(461,-2179.486083,605.130798,34.895198,88.596977,0,0);//95
    AddStaticVehicle(461,-2179.404296,608.762268,34.891155,90.874336,0,0);//96
    AddStaticVehicle(461,-2183.5845,614.7171,34.7222,329.4128,1,1);//97
	AddStaticVehicle(461,-2191.1814,604.7941,34.7449,151.7564,1,1);//98
	AddStaticVehicle(461,-2188.1414,604.2820,34.7399,163.6357,1,1);//99
	AddStaticVehicle(461,-2211.5535,619.2351,34.7383,342.1588,0,0);//100
	AddStaticVehicle(461,-2214.3005,619.0332,34.7437,342.0723,0,0);//101
	AddStaticVehicle(461,-2215.7854,603.3849,34.7501,278.8244,0,0);//102
	AddStaticVehicle(461,-2205.3501,602.9380,34.7449,259.1532,0,0);//103
    AddStaticVehicle(414,-552.4551,2619.4041,53.6094,270.1524,1,1);//104
	AddStaticVehicle(414,-552.6380,2615.2505,53.6094,270.9333,1,1);//105
	AddStaticVehicle(468,-2444.2495,2224.3125,4.4159,183.3584,6,6);//106
	AddStaticVehicle(555,-2450.6069,2305.1060,4.5477,271.6614,16,16);//107
	AddStaticVehicle(509,-2440.3440,2301.6963,4.5404,265.9458,1,1);//108
	AddStaticVehicle(552,-2553.9397,1415.3110,-0.6195,11.6278,0,3);//109
	AddStaticVehicle(552,-2537.6506,1415.0796,-0.5574,346.1778,0,6);//110
	AddStaticVehicle(439,-2636.4941,1334.9673,6.7600,97.0348,0,0);//111
	AddStaticVehicle(533,-1717.9885,1350.6946,6.7420,229.3763,2,2);//112
	AddStaticVehicle(414,-1849.8406,122.1667,14.6879,93.5895,1,1);//113
	AddStaticVehicle(510,-1676.1387,438.6737,6.7309,135.5489,3,3);//114
	AddStaticVehicle(581,-2035.6842,-2330.5239,30.1994,309.1145,0,0);//115
	AddStaticVehicle(521,-2036.8646,-2329.2380,30.1956,320.3472,2,2);//116
	AddStaticVehicle(515,-2041.8279,-2393.9004,30.1904,219.4306,3,3);//117
	AddStaticVehicle(475,-2046.9973,145.1143,28.5630,0.7972,1,1);//118
	AddStaticVehicle(581,-2029.6890,-2334.8398,30.2208,133.2190,3,3);//119
	AddStaticVehicle(581,-2026.2222,-2339.1248,30.2115,133.0651,6,6);//120
	AddStaticVehicle(581,-2023.7893,-2341.7976,30.2176,135.3792,5,5);//121
	AddStaticVehicle(581,-2019.2566,-2345.8330,30.2200,312.0899,3,3);//122
	AddStaticVehicle(581,-2015.2013,-2349.4011,30.2185,146.6107,0,0);//123
	AddStaticVehicle(475,-2053.1897,146.1172,28.6373,1.9392,3,3);//124
	AddStaticVehicle(475,-2029.6227,156.8629,28.6416,1.8515,6,6);//125
	AddStaticVehicle(475,-2034.6327,178.3249,28.6452,268.0952,12,12);//126
	AddStaticVehicle(581,-2037.5001,140.8673,28.4235,273.6909,10,10);//127
	AddStaticVehicle(481,-1743.3865,-2489.2075,11.8375,73.1635,3,3);//128
	AddStaticVehicle(481,-1738.1725,-2492.5203,11.3138,51.3785,2,2);//129
	AddStaticVehicle(481,-1740.3934,-2483.0354,13.8901,42.1364,1,1);//130
	CarroAuto = AddStaticVehicle(487,1750.6307,-2066.6692,13.7935,267.8717,3,3);//131
	CarroAuto2 = AddStaticVehicle(410,1811.3480,-2022.3772,13.2043,358.5166,3,3);//132
	CarroAuto3 = AddStaticVehicle(410,1811.3706,-2034.2655,13.2026,359.8123,3,3);//133
	CarroAuto4 = AddStaticVehicle(410,1768.7305,-2022.7528,13.7978,269.5554,3,3);//134
	CarroAuto5 = AddStaticVehicle(410,1759.9102,-2055.1819,13.2372,270.7612,3,3);//135
	CarroAuto6 = AddStaticVehicle(521,1765.9749,-2041.0818,13.1276,270.1337,3,3);//136
	MotoPizza = AddStaticVehicle(448,2096.5664,-1796.2372,12.9851,90.3936,1,1);//137
	MotoPizza2 = AddStaticVehicle(448,2096.5557,-1799.8225,12.9788,89.8821,1,1);//138
	MotoPizza3 = AddStaticVehicle(448,2096.6338,-1793.0216,12.9879,90.7173,1,1);//139
	MotoPizza4 = AddStaticVehicle(448,2096.7373,-1817.1201,12.9822,89.8361,1,1);//140
	CarroJornal = AddStaticVehicle(582,741.8798,-1337.0168,13.1006,272.7129,28,1);//141
	CarroJornal2 = AddStaticVehicle(582,760.6467,-1338.8859,13.1004,178.7378,28,1);//142
	CarroJornal3 = AddStaticVehicle(488,779.1324,-1355.3369,13.7157,88.6369,28,1);//143
	limosine1 = AddStaticVehicle(409,1229.5652,-1835.9869,13.1877,90.0444,0,0);//144
	limosine2 = AddStaticVehicle(409,1252.0458,-1835.9653,13.1880,90.0540,0,0);//145
	MotoTaxi = AddStaticVehicle(521,1620.1650,-1085.0001,23.4775,269.8010,6,6);//146
	MotoTaxi2 = AddStaticVehicle(521,1620.8981,-1089.1842,23.4721,272.8326,6,6);//147
	MotoTaxi3 = AddStaticVehicle(521,1620.6460,-1093.6416,23.4647,271.0250,6,6);//148
	AeroTaxi = AddStaticVehicle(487,1714.5737,-1052.4772,24.0793,90.4235,6,6);//149
	Taxi1 = AddStaticVehicle(420,1675.5963,-1120.2175,23.6846,268.4628,6,1);//150
	Taxi2 = AddStaticVehicle(420,1617.1656,-1127.9691,23.6839,91.0981,6,1);//151
	Taxi3 = AddStaticVehicle(420,1645.3558,-1047.4185,23.6766,179.2427,6,1);//152
    alugado1 = AddStaticVehicle(411,200.1081,-1440.4156,12.8115,318.7880,6,6);//153
	alugado2 = AddStaticVehicle(451,204.5762,-1444.3474,12.8010,139.4082,16,16);//154
	alugado3 = AddStaticVehicle(560,218.3302,-1429.6761,12.9740,132.8096,3,3);//155
	alugado4 = AddStaticVehicle(475,221.7918,-1432.9316,13.0922,314.6425,1,1);//156
	alugado5 = AddStaticVehicle(603,195.6884,-1436.2327,12.9144,140.2273,0,0);//157
	alugado6 = AddStaticVehicle(415,215.5169,-1428.1981,13.0317,314.4549,108,108);//158
	alugado7 = AddStaticVehicle(521,198.1436,-1438.5488,12.6583,289.7877,6,6);//159
	alugado8 = AddStaticVehicle(522,202.5581,-1442.4858,12.6605,108.6459,0,16);//160
    LimoHistoria1 = AddStaticVehicle(409,1907.5162,2085.2627,10.6202,1.6192,0,0);//161
	LimoHistoria2 = AddStaticVehicle(409,1700.1578,1481.0664,10.5723,170.1613,0,0);//162
	CarroContrabando1 = AddStaticVehicle(492,2173.5430,-2265.4812,13.1428,41.9938,16,16);//163
	CarroContrabando2 = AddStaticVehicle(445,2165.9097,-2273.1045,13.2358,39.6703,0,0);//164
	CarroContrabando3 = AddStaticVehicle(415,2206.7341,-2289.6543,14.5348,25.1289,0,0);//165
	CarroContrabando4 = AddStaticVehicle(560,2165.2048,-2307.9785,13.2520,156.6602,0,0);//166
	CarroContrabando5 = AddStaticVehicle(411,2192.1260,-2247.6174,13.3889,44.0117,0,0);//167
	
	
	new randmodel;
	new randcolor1;
	new randcolor2;
	randmodel = random(26);
	randcolor1 = random(126);
	randcolor2 = random(126);
	carvenda1 = AddStaticVehicle(CarrosVendaModelos[randmodel],CarrosVendaPos[0][0],CarrosVendaPos[0][1],CarrosVendaPos[0][2],CarrosVendaAng[0],randcolor1,randcolor2);//168
	randmodel = random(26);
	randcolor1 = random(126);
	randcolor2 = random(126);
	carvenda2 = AddStaticVehicle(CarrosVendaModelos[randmodel],CarrosVendaPos[1][0],CarrosVendaPos[1][1],CarrosVendaPos[1][2],CarrosVendaAng[1],randcolor1,randcolor2);//169
    randmodel = random(26);
	randcolor1 = random(126);
	randcolor2 = random(126);
	carvenda3 = AddStaticVehicle(CarrosVendaModelos[randmodel],CarrosVendaPos[2][0],CarrosVendaPos[2][1],CarrosVendaPos[2][2],CarrosVendaAng[2],randcolor1,randcolor2);//170
    randmodel = random(26);
	randcolor1 = random(126);
	randcolor2 = random(126);
	carvenda4 = AddStaticVehicle(CarrosVendaModelos[randmodel],CarrosVendaPos[3][0],CarrosVendaPos[3][1],CarrosVendaPos[3][2],CarrosVendaAng[3],randcolor1,randcolor2);//171
    randmodel = random(26);
	randcolor1 = random(126);
	randcolor2 = random(126);
	carvenda5 = AddStaticVehicle(CarrosVendaModelos[randmodel],CarrosVendaPos[4][0],CarrosVendaPos[4][1],CarrosVendaPos[4][2],CarrosVendaAng[4],randcolor1,randcolor2);//172

//|------------------------------------[ PICKUPS ]----------------------------------------------------
	CreatePickup(362,2,1420.2501,2881.3828,10.8203);//minigun
	CreatePickup(350,2,-1609.9634,674.0835,-5.2422); // shotgun
	CreatePickup(356,2,-1608.0623,674.1035,-5.2422); // m4
	CreatePickup(355,2,-1603.5215,674.7878,-5.2422); // ak47
	CreatePickup(348,2,-1609.7281,679.0164,-5.2422); // desert eagle
    CreatePickup(357,2,-1608.2559,678.6394,-5.2422); //minigun
    CreatePickup(372,2,-1606.7788,678.6942,-5.2422); // tec-9
    CreatePickup(353,2,-1603.8494,678.8831,-5.2422); // mp5
    CreatePickup(343,2,-1605.1569,678.0090,-5.2422); // gas
    CreatePickup(1272,1,-1600.4955,863.6196,7.6875); //
    CreatePickup(1240,2,-2655.5859,637.5977,14.4531); //
    CreatePickup(1253,1,-318.5863,1535.5477,75.5625); //jornal
    CreatePickup(367,2,-312.4564,1515.9036,75.3594); //jornal
	CreatePickup(1272,1,2218.8909,-1144.5692,25.7929); // IconHotel
	CreatePickup(1272,1,1027.2871,-972.7601,42.5321); // IconHotel2
	CreatePickup(1272,1,329.0426,-1515.0957,35.8672); // Iconhotel3
	CreatePickup(1272,1,892.0764,-1644.6343,13.5469); // IconHotel4
	CreatePickup(1272,1,1909.8356,-1601.7092,13.5482); // IconHotel5
	CreatePickup(1272,1,1863.7584,-1601.7079,13.5443); // IconHotel6
	CreatePickup(1244,1,1389.0552,1768.4464,10.8203);//Aero-Gas
    CreatePickup(1244,1,-1248.6545,-96.2660,14.1484);//Aero-Gas
    CreatePickup(1244,1,1422.8640,-2432.5745,13.0956);//Aero-Gas

    //bancos
    pickupbanco1 = CreatePickup(bancoi,2,1771.7144,-1655.8201,14.4236); // Banco #1
	pickupbanco2 = CreatePickup(bancoi,2,1386.0540,-1015.7602,26.6676); // Banco #2
	pickupbanco3 = CreatePickup(bancoi,2,419.7245,-1428.6298,32.4797); // Banco #3
	pickupbanco4 = CreatePickup(bancoi,2,2862.3201,-1440.2727,10.9410); // Banco #4
	pickupsaidabanco = CreatePickup(bancoi,1,2306.8198,-16.0497,26.7496);
	CreatePickup(1212,1,2316.3098,-12.5673,26.7422);
	CreatePickup(1212,1,2316.3083,-10.0476,26.7422);
	CreatePickup(1212,1,2316.2732,-7.2987,26.7422);
	CreatePickup(bancoi,1,2309.4019,-1.9465,26.7422);
	
    //Tribunal
	pickuptribunal = CreatePickup(seta,1,243.5183,66.3445,1003.6406);

	//Loteria
	pickuploteria_saida = CreatePickup(seta,1,-2158.9731,642.4365,1052.3817);
	pickuploteria_entrada = CreatePickup(seta,1,1735.8115,-1587.6827,13.5422);
	
	//Level's
    Pickup_EntradaCPD = CreatePickup(seta,2,1310.4824,-1368.2488,13.5471);
    Pickup_SaidaCPD = CreatePickup(seta,2,389.0653,173.7855,1008.3828);

	//Corretora de propriedades
	Pickup_Entrada_Corretora = CreatePickup(seta,1,2861.6653,-1405.8640,11.7344);
	Pickup_Saida_Corretora = CreatePickup(seta,1,278.6607,-1617.1837,97.4182);
	
	//RESTAURANTE
	Sucos = CreateMenu("Sucos",2,30.0,140.0,220.0,0.0);
	if(IsValidMenu(Sucos)){
	    SetMenuColumnHeader(Sucos,0,"Escolha o sabor:");
	    AddMenuItem(Sucos,0,"Laranja");
	    AddMenuItem(Sucos,0,"Abacaxi");
	    AddMenuItem(Sucos,0,"Acerola");
	    AddMenuItem(Sucos,0,"Mamöo");
	    AddMenuItem(Sucos,0,"Limöo");
	    AddMenuItem(Sucos,0,"Morango");
	    AddMenuItem(Sucos,0,"Uva");
	    AddMenuItem(Sucos,0,"Maracuja");
	    AddMenuItem(Sucos,0,"Framboesa");
	}
	Cardapio1 = CreateMenu("Cardapio",2,30.0,140.0,220.0,0.0);
	if(IsValidMenu(Cardapio1)){
	    SetMenuColumnHeader(Cardapio1,0,"Menu");
	    AddMenuItem(Cardapio1,0,"Comidas");
	    AddMenuItem(Cardapio1,0,"Bebidas");
	    AddMenuItem(Cardapio1,0,"Sobremesas");
	    AddMenuItem(Cardapio1,0,"Sair");
	}
	Cardapio2 = CreateMenu("Comidas",2,30.0,140.0,220.0,0.0);
	if(IsValidMenu(Cardapio2)){
	    SetMenuColumnHeader(Cardapio2,0,"Comida");
	    SetMenuColumnHeader(Cardapio2,1,"Preúo");
	    AddMenuItem(Cardapio2,0,"Feijoada");
	    AddMenuItem(Cardapio2,1,"$40");
	    AddMenuItem(Cardapio2,0,"Lagosta Gourmet");
	    AddMenuItem(Cardapio2,1,"$220");
	    AddMenuItem(Cardapio2,0,"Camaröo");
	    AddMenuItem(Cardapio2,1,"$140");
	    AddMenuItem(Cardapio2,0,"Peixe Frito");
	    AddMenuItem(Cardapio2,1,"$120");
	    AddMenuItem(Cardapio2,0,"Filû");
	    AddMenuItem(Cardapio2,1,"$80");
	    AddMenuItem(Cardapio2,0,"Salmöo");
	    AddMenuItem(Cardapio2,1,"$140");
	    AddMenuItem(Cardapio2,0,"Batata Frita");
	    AddMenuItem(Cardapio2,1,"$80");
	    AddMenuItem(Cardapio2,0,"Sopa");
	    AddMenuItem(Cardapio2,1,"$20");
	    AddMenuItem(Cardapio2,0,"Frango Assado");
	    AddMenuItem(Cardapio2,1,"$100");
	}
	Cardapio3 = CreateMenu("Bebidas",2,30.0,140.0,220.0,0.0);
	if(IsValidMenu(Cardapio3)){
	    SetMenuColumnHeader(Cardapio3,0,"Bebida");
	    SetMenuColumnHeader(Cardapio3,1,"Preúo");
	    AddMenuItem(Cardapio3,0,"Coca-Cola");
	    AddMenuItem(Cardapio3,1,"$8");
	    AddMenuItem(Cardapio3,0,"Sprite");
	    AddMenuItem(Cardapio3,1,"$8");
	    AddMenuItem(Cardapio3,0,"Cerveja");
	    AddMenuItem(Cardapio3,1,"$9");
	    AddMenuItem(Cardapio3,0,"Fanta");
	    AddMenuItem(Cardapio3,1,"$9");
	    AddMenuItem(Cardapio3,0,"Vinho");
	    AddMenuItem(Cardapio3,1,"$100");
	    AddMenuItem(Cardapio3,0,"Suco c/ leite");
	    AddMenuItem(Cardapio3,1,"$14");
	    AddMenuItem(Cardapio3,0,"Suco c/ agua");
	    AddMenuItem(Cardapio3,1,"$10");
	}
	Cardapio4 = CreateMenu("Sobremesas",2,30.0,140.0,220.0,0.0);
	if(IsValidMenu(Cardapio4)){
	    SetMenuColumnHeader(Cardapio4,0,"Sobremesa");
	    SetMenuColumnHeader(Cardapio4,1,"Preúo");
	    AddMenuItem(Cardapio4,0,"Pudim de chocolate");
	    AddMenuItem(Cardapio4,1,"$15");
	    AddMenuItem(Cardapio4,0,"Sorvete");
	    AddMenuItem(Cardapio4,1,"$8");
	    AddMenuItem(Cardapio4,0,"Bolo de chocolate");
	    AddMenuItem(Cardapio4,1,"$13");
	    AddMenuItem(Cardapio4,0,"Bomba de chocolate");
	    AddMenuItem(Cardapio4,1,"$9");
	    AddMenuItem(Cardapio4,0,"Brigadeiro");
	    AddMenuItem(Cardapio4,1,"$6");
	}
	//SORVETES
	Sorvetes = CreateMenu("Menu",2,2,150,100,20);
	if(IsValidMenu(Sorvetes)){
	    SetMenuColumnHeader(Sorvetes,0,"Sabor");
	    SetMenuColumnHeader(Sorvetes,1,"Preúo");
	    AddMenuItem(Sorvetes,0,"Milho verde");
	    AddMenuItem(Sorvetes,1,"$5");
	    AddMenuItem(Sorvetes,0,"Morango");
	    AddMenuItem(Sorvetes,1,"$5");
	    AddMenuItem(Sorvetes,0,"Leite Condensado");
	    AddMenuItem(Sorvetes,1,"$7");
	    AddMenuItem(Sorvetes,0,"Flocos");
	    AddMenuItem(Sorvetes,1,"$5");
	    AddMenuItem(Sorvetes,0,"Creme");
	    AddMenuItem(Sorvetes,1,"$4");
	    AddMenuItem(Sorvetes,0,"Abacaxi");
	    AddMenuItem(Sorvetes,1,"$5");
	    AddMenuItem(Sorvetes,0,"Chocolate");
	    AddMenuItem(Sorvetes,1,"$7");
	    AddMenuItem(Sorvetes,0,"Limöo");
	    AddMenuItem(Sorvetes,1,"$4");
	    AddMenuItem(Sorvetes,0,"Tutti-Fruti");
	    AddMenuItem(Sorvetes,1,"$5");
	}
	//PROPRIEDADES
	Properties = CreateMenu("Propriedades",2,2,150,100,20);
	if(IsValidMenu(Properties)){
	    SetMenuColumnHeader(Properties,0,"Nome");
	    SetMenuColumnHeader(Properties,1,"Valor");
	    AddMenuItem(Properties,0,"Pizzaria");
	    AddMenuItem(Properties,1,"$55000");
	    AddMenuItem(Properties,0,"Yellow's'Taxi");
	    AddMenuItem(Properties,1,"$70000");
	    AddMenuItem(Properties,0,"LuxLimosine");
	    AddMenuItem(Properties,1,"$90000");
	    AddMenuItem(Properties,0,"Corretora de seguros");
	    AddMenuItem(Properties,1,"$100000");
	    AddMenuItem(Properties,0,"SecurityLife");
	    AddMenuItem(Properties,1,"$80000");
	    AddMenuItem(Properties,0,"Ammu-Nation");
	    AddMenuItem(Properties,1,"$75000");
	    AddMenuItem(Properties,0,"Boate de strip");
	    AddMenuItem(Properties,1,"$100000");
	    AddMenuItem(Properties,0,"Posto");
	    AddMenuItem(Properties,1,"$120000");
	    AddMenuItem(Properties,0,"Bar");
	    AddMenuItem(Properties,1,"$50000");
	    AddMenuItem(Properties,0,"Pay'n'Spray");
	    AddMenuItem(Properties,1,"$140000");
	}
	ConfirmacaoNegocio = CreateMenu("Propriedades",2,2,150,100,20);
	if(IsValidMenu(ConfirmacaoNegocio)){
		SetMenuColumnHeader(ConfirmacaoNegocio,0,"Quer mesmo compra-la?");
		AddMenuItem(ConfirmacaoNegocio,0,"Sim");
		AddMenuItem(ConfirmacaoNegocio,0,"Nöo");
	}
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
	Alarme = CreateMenu("Seu Carro:",1,30.0,140.0,220.0,0.0);
	if(IsValidMenu(Alarme)){
		AddMenuItem(Alarme,0,"Trancar");
		AddMenuItem(Alarme,0,"Destrancar");
		AddMenuItem(Alarme,0,"Alarmar e ImpossÌvel Dirigir");
		AddMenuItem(Alarme,0,"Avisar a policia sem alarmar");
		AddMenuItem(Alarme,0,"Desativar todos os alarmes");
		AddMenuItem(Alarme,0,"Sair");
	}
	Bar = CreateMenu("Comes & Bebes",2,30.0,140.0,220.0,0.0);
	if(IsValidMenu(Bar)){
	    SetMenuColumnHeader(Bar,0,"Cardapio");
	    SetMenuColumnHeader(Bar,1,"Valor");
		AddMenuItem(Bar,0,"Guaran· KUAT");
		AddMenuItem(Bar,1,"R$5");
		AddMenuItem(Bar,0,"Suco");
		AddMenuItem(Bar,1,"R$8");
		AddMenuItem(Bar,0,"Cerveja");
		AddMenuItem(Bar,1,"R$10");
		AddMenuItem(Bar,0,"Pinga");
		AddMenuItem(Bar,1,"R$15");
		AddMenuItem(Bar,0,"Whisky");
		AddMenuItem(Bar,1,"R$25");
		AddMenuItem(Bar,0,"X-Bacon");
		AddMenuItem(Bar,1,"R$10");
		AddMenuItem(Bar,0,"X-Burguer");
		AddMenuItem(Bar,1,"R$5");
		AddMenuItem(Bar,0,"X-Salada");
		AddMenuItem(Bar,1,"R$6");
		AddMenuItem(Bar,0,"Sair");
	}
	BancoOpc = CreateMenu("Opúoes do banco",1,30.0,140.0,220.0,0.0);
	if(IsValidMenu(BancoOpc)){
		AddMenuItem(BancoOpc,0,"Sacar");
		AddMenuItem(BancoOpc,0,"Depositar");
		AddMenuItem(BancoOpc,0,"Ver Extrato");
		AddMenuItem(BancoOpc,0,"Pagar D¢vidas");
        AddMenuItem(BancoOpc,0,"Fazer Emprûstimo");
		AddMenuItem(BancoOpc,0,"Sair");
	}
	VendoDrogas = CreateMenu("Drogas:",2,2,150,100,20);
	if(IsValidMenu(VendoDrogas)){
		AddMenuItem(VendoDrogas,0,"Maconha");
		AddMenuItem(VendoDrogas,0,"Heroina");
		AddMenuItem(VendoDrogas,0,"Cocaina");
		AddMenuItem(VendoDrogas,0,"Sair");
	}
	QuantidadeDrog = CreateMenu("Quantidade:",2,2,150,100,20);
	if(IsValidMenu(QuantidadeDrog)){
		AddMenuItem(QuantidadeDrog,0,"1");
		AddMenuItem(QuantidadeDrog,0,"2");
		AddMenuItem(QuantidadeDrog,0,"3");
		AddMenuItem(QuantidadeDrog,0,"Sair");
	}
	CargaGeral = CreateMenu("Cargas:",1,2,150,100,20);
	if(IsValidMenu(CargaGeral)){
		AddMenuItem(CargaGeral,0,"Material em Geral");
		AddMenuItem(CargaGeral,0,"Combustivel");
		AddMenuItem(CargaGeral,0,"Drogas");
		AddMenuItem(CargaGeral,0,"Roupas");
		AddMenuItem(CargaGeral,0,"Sair");
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
		AddMenuItem(CPD_First,0,"Pescador");
		AddMenuItem(CPD_First,1,"$1400");
		AddMenuItem(CPD_First,0,"Motorista de Onibus");
		AddMenuItem(CPD_First,1,"$1500");
		AddMenuItem(CPD_First,0,"Taxista");
		AddMenuItem(CPD_First,1,"$1400");
		AddMenuItem(CPD_First,0,"Mototaxista");
		AddMenuItem(CPD_First,1,"$1400");
		AddMenuItem(CPD_First,0,"Pedreira");
		AddMenuItem(CPD_First,1,"$1500");
	}
	CPD_Second = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Second)){
		SetMenuColumnHeader(CPD_Second,0,"Nome");
	    SetMenuColumnHeader(CPD_Second,1,"Salòrio");
	    AddMenuItem(CPD_Second,0,"Taxi Aereo");
	    AddMenuItem(CPD_Second,1,"$1500");
	    AddMenuItem(CPD_Second,0,"Seguranúa");
	    AddMenuItem(CPD_Second,1,"$1000");
	    AddMenuItem(CPD_Second,0,"Assassino");
	    AddMenuItem(CPD_Second,1,"$400");
	    AddMenuItem(CPD_Second,0,"Motorista Particular");
	    AddMenuItem(CPD_Second,1,"$2000");
		AddMenuItem(CPD_Second,0,"Jornalista");
	    AddMenuItem(CPD_Second,1,"$1500");
	    AddMenuItem(CPD_Second,0,"Lixeiro");
	    AddMenuItem(CPD_Second,1,"$1000");
	    AddMenuItem(CPD_Second,0,"Agricultor");
	    AddMenuItem(CPD_Second,1,"$1200");
	    AddMenuItem(CPD_Second,0,"Caminhoneiro");
	    AddMenuItem(CPD_Second,1,"$800");
	    AddMenuItem(CPD_Second,0,"Transporte de Valores");
	    AddMenuItem(CPD_Second,1,"$1200");
	    AddMenuItem(CPD_Second,0,"Prostituta");
	    AddMenuItem(CPD_Second,1,"$800");
	    AddMenuItem(CPD_Second,0,"Traficante");
	    AddMenuItem(CPD_Second,1,"$1000");
	}
	CPD_Third = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Third)){
		SetMenuColumnHeader(CPD_Third,0,"Nome");
	    SetMenuColumnHeader(CPD_Third,1,"Salòrio");
	    AddMenuItem(CPD_Third,0,"Frentista");
	    AddMenuItem(CPD_Third,1,"$1200");
	    AddMenuItem(CPD_Third,0,"Vendedor de Armas");
	    AddMenuItem(CPD_Third,1,"$1400");
	    AddMenuItem(CPD_Third,0,"Mecanico");
	    AddMenuItem(CPD_Third,1,"$1000");
	    AddMenuItem(CPD_Third,0,"Cop Militar");
	    AddMenuItem(CPD_Third,1,"$1200");
	    AddMenuItem(CPD_Third,0,"Paramûdico");
	    AddMenuItem(CPD_Third,1,"$1000");
	    AddMenuItem(CPD_Third,0,"Assaltante");
	    AddMenuItem(CPD_Third,1,"$600");
	    AddMenuItem(CPD_Third,0,"Cop Rodoviario");
	    AddMenuItem(CPD_Third,1,"$1400");
	    AddMenuItem(CPD_Third,0,"Contrabandista");
	    AddMenuItem(CPD_Third,1,"$800");
	    AddMenuItem(CPD_Third,0,"Receita Federal");
	    AddMenuItem(CPD_Third,1,"$2000");
	    AddMenuItem(CPD_Third,0,"Locador de Carros");
	    AddMenuItem(CPD_Third,1,"$1000");
	    AddMenuItem(CPD_Third,0,"Instrutor de Direúöo");
	    AddMenuItem(CPD_Third,1,"$850");
	    AddMenuItem(CPD_Third,0,"Cop Narcoticos");
	    AddMenuItem(CPD_Third,1,"$1800");
	}
	
	CPD_Fourth = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Fourth)){
		SetMenuColumnHeader(CPD_Fourth,0,"Nome");
	    SetMenuColumnHeader(CPD_Fourth,1,"Salòrio");
	    AddMenuItem(CPD_Fourth,0,"Corretor de seguros");
	    AddMenuItem(CPD_Fourth,1,"$1400");
	    AddMenuItem(CPD_Fourth,0,"Lider de Tròfico");
	    AddMenuItem(CPD_Fourth,1,"$2000");
	    AddMenuItem(CPD_Fourth,0,"Advogado");
	    AddMenuItem(CPD_Fourth,1,"$1000");
	    AddMenuItem(CPD_Fourth,0,"Cop Swat");
	    AddMenuItem(CPD_Fourth,1,"$2000");
	}
	
	CPD_Fifth = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Fifth)){
		SetMenuColumnHeader(CPD_Fifth,0,"Nome");
	    SetMenuColumnHeader(CPD_Fifth,1,"Salòrio");
	    AddMenuItem(CPD_Fifth,0,"Exercito");
	    AddMenuItem(CPD_Fifth,1,"$4000");
	    AddMenuItem(CPD_Fifth,0,"Corretor");
	    AddMenuItem(CPD_Fifth,1,"$350");
	    AddMenuItem(CPD_Fifth,0,"Vendedor de Carros");
	    AddMenuItem(CPD_Fifth,1,"$350");
	    AddMenuItem(CPD_Fifth,0,"Juiz");
	    AddMenuItem(CPD_Fifth,1,"$3000");
	}

	CPD_Sixth = CreateMenu("Profissöo",2,2,150,100,20);
	if(IsValidMenu(CPD_Sixth)){
		SetMenuColumnHeader(CPD_Sixth,0,"Nome");
	    SetMenuColumnHeader(CPD_Sixth,1,"Salòrio");
	    AddMenuItem(CPD_Sixth,0,"Delegado");
	    AddMenuItem(CPD_Sixth,1,"$4500");
	}

	//Objetos da Locadora
	CreateObject(982, 221.933014, -1437.036865, 12.941964, 0.0000, 0.0000, 315.0000);
	CreateObject(982, 223.783096, -1417.603760, 12.997661, 0.0000, 0.0000, 220.6256);
	CreateObject(982, 190.902374, -1451.953125, 12.632922, 0.0000, 0.0000, 39.8434);
	CreateObject(983, 201.233566, -1459.381470, 12.664308, 0.0000, 0.0000, 317.6557);
	CreateObject(970, 207.821289, -1451.575073, 12.623831, 0.0000, 0.0000, 51.8755);
	CreateObject(7914, 193.985535, -1435.096558, 23.652922, 0.0000, 0.0000, 40.7028);
	CreateObject(17064, 210.945694, -1422.674805, 12.365208, 0.0000, 0.0000, 44.9999);
	CreateObject(12957,2529.083,-1710.716,13.372,0.0,0.0,0.0);
    CreateObject(3850,1816.244,-2061.836,13.093,0.0,0.0,0.0);
	CreateObject(3850,1816.248,-2058.375,13.093,0.0,0.0,0.0);
	CreateObject(3860,1814.645,-2064.676,13.719,0.0,1.719,-181.341);

	//Corretora de seguros
	CreateObject(18082, 273.869202, -1615.066162, 98.675987, 0.0000, 0.0000, 78.7500);
	CreateObject(1535, 279.235016, -1616.256592, 96.411179, 0.0000, 0.0000, 258.7500);
	CreateObject(2561, 272.424896, -1611.470947, 97.516411, 0.0000, 0.0000, 348.7500);
	CreateObject(2561, 269.818207, -1610.950317, 97.511627, 0.0000, 0.0000, 348.7500);
	CreateObject(2435, 275.882294, -1618.076050, 96.411324, 0.0000, 0.0000, 78.7500);
	CreateObject(2435, 276.051605, -1617.206299, 96.411324, 0.0000, 0.0000, 78.7500);
	CreateObject(2435, 276.238678, -1616.298584, 96.411324, 0.0000, 0.0000, 78.7500);
	CreateObject(1754, 276.966492, -1618.433594, 96.413109, 0.0000, 0.0000, 168.7500);
	CreateObject(1754, 278.016663, -1618.643066, 96.420372, 0.0000, 0.0000, 168.7500);
	CreateObject(2007, 274.485748, -1615.698120, 96.413780, 0.0000, 0.0000, 78.7499);
	CreateObject(11360, 273.803284, -1616.264038, 98.517876, 89.3814, 0.0000, 348.7500);
	CreateObject(2836, 278.168182, -1617.467407, 96.417747, 0.0000, 0.0000, 78.7500);
	CreateObject(2007, 274.482880, -1615.699219, 97.718826, 0.0000, 0.0000, 78.7499);
	CreateObject(1716, 275.007233, -1617.117920, 96.418060, 0.0000, 0.0000, 0.0000);
	CreateObject(1808, 279.237335, -1615.750122, 96.420280, 0.0000, 0.0000, 258.7500);
	CreateObject(2190, 275.598511, -1618.474243, 97.312447, 0.0000, 0.0000, 191.2500);
	CreateObject(2186, 268.743408, -1615.957031, 96.411118, 0.0000, 0.0000, 78.7500);
	CreateObject(2605, 272.339417, -1615.907959, 96.816612, 0.0000, 0.0000, 348.7498);
	CreateObject(2605, 270.535309, -1612.743286, 96.816612, 0.0000, 0.0000, 258.7499);
	CreateObject(1663, 272.239197, -1617.045898, 96.878387, 0.0000, 0.0000, 191.2500);
	CreateObject(1663, 269.432861, -1612.774048, 96.924988, 0.0000, 0.0000, 90.0000);
	CreateObject(1811, 271.779877, -1612.528687, 97.044479, 0.0000, 0.0000, 11.2500);
	CreateObject(1811, 271.528656, -1613.395874, 97.044479, 0.0000, 0.0000, 337.5000);
	CreateObject(1811, 273.063293, -1614.754883, 97.044479, 0.0000, 0.0000, 67.5000);
	CreateObject(1811, 272.133392, -1614.710938, 97.044479, 0.0000, 0.0000, 90.0000);
	    
	Gates[0] = CreateObject(968, 1544.687866, -1630.546875, 13.165515, 0, 269.4727, 269.9995);
	Gates[1] = CreateObject(968, 2238.198730, 2450.429932, 10.597424, 0, 269.4727, 269.9996);
	Gates[2] = CreateObject(968, -1572.189331, 658.876709, 6.887374, 0, 269.4727, 269.9995);
	Gates[3] = CreateObject(968, -1701.452271, 687.616211, 24.592068, 0, 269.4727, 269.9995);
	
	Portao[0] =	CreateObject(10184, 1592.921753, -1638.546753, 14.789343, 0, 0, 90);//fechado LS
	Portao[1] =	CreateObject(10184, 2334.678711, 2443.014404, 7.259488, 0, 0, 326.25);//fechado LV
	Portao[2] =	CreateObject(10184, 2294.276123, 2503.250488, 4.719362, 0, 0, 0);//fechado LV
	Portao[3] = CreateObject(10184,-1631.699219, 688.715637, 8.709263, 0, 0, 270);//fechado SF

    portaoauto = CreateObject(980,1812.601,-2071.738,15.326,0.0,0.0,90.241);
    
    CreateObject(980,681.7346,-450.7061,-25.6099,0.0,0.0,77.6024);

	//----
	SetTimer("KeyT",100,1);
	SetTimer("CPD_CPHandler",1000,1);
	SetTimer("RestauranteHandler",1000,1);
	SetTimer("RestauranteHandler2",1000,1);
	SetTimer("GatesCoordChecker",1000,1);
	SetTimer("PortaoCoordChecker",1000,1);
	SetTimer("AbrirPortaoAutoEscola",1000,1);
	SetTimer("FecharPortaoAutoEscola",1000,1);
	SetTimer("Bancos", 1000, 1);
	SetTimer("GasSaving",120000,1);
	SetTimer("CheckFuel", RunOutTime, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("Tempo", 100, 1);
	SetTimer("PagamentoSeguro", 60000, 1);
	SetTimer("Speed",900,1);
	SetTimer("Radar",1000,1);
	SetTimer("Casino", 5013, 1);
	SetTimer("VoteKickTimer", 20000, 1);
	SetTimer("sequestrar", 60000, 1);
	SetTimer("Desmancheveiculo", 600000, 1);
	SetTimer("LoteriaComeco", 500000, 1);
	SetTimer("Doenca", 3600000, 1);
	SetTimer("DoencaAtaca",60000, 1);
	SetTimer("ApostasdeCavalos",400000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("AnunciarComu",1800000,1);
	LoadCell("celulares.rpg");
	for(new i; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
		    SetPlayerTime(i,HoraJogo,MinutoJogo);
		}
	}
	if(!fexist("life.tmp")){
	    dini_Create("life.tmp");
	    CreateStartupVehicleFiles();
	    CreatePickupFiles();
	    CriarPlacas();
	    CreatePropertiesFiles();
	    CriarPastaUtilitarios("utilitarios.rpg");
	} else {
	    LoadPastaUtilitarios("utilitarios.rpg");
	    LoadPickupFiles();
		LoadGas();
 		LoadColors();
	}
	LoadRcars("carrosrpg.rpg");
	return 1;
}
stock CreatePropertiesFiles()
{
    new str[256];
	new p = 0;
	while(p < MAX_PROPERTIES){
		format(str,sizeof(str),"%s.prop",NomesPropriedades[p]);
		dini_Create(str);
		dini_Set(str,"Dono","NONE");
		dini_Set(str,"Trabalhador1","NONE");
		dini_Set(str,"Trabalhador2","NONE");
		dini_Set(str,"Trabalhador3","NONE");
		dini_Set(str,"Trabalhador4","NONE");
		dini_Set(str,"Trabalhador5","NONE");
		dini_Set(str,"Trabalhador6","NONE");
		dini_Set(str,"Trabalhador7","NONE");
		dini_IntSet(str,"Lucro",0);
		dini_IntSet(str,"Prejuizo",0);
		dini_IntSet(str,"Investimento",0);
		p++;
		format(str,sizeof(str),"%s.prop",NomesPropriedades[p]);
	}
}
stock CriarPastaUtilitarios(pattern[])
{
	if(fexist(pattern)){
	writelog("Criando pasta de utilit·rios do gamemode... A pasta n„o foi criada pois j· existia!");
	return 0;
	} else {
	dini_Create(pattern);
	writelog("Criando pasta de utilit·rios do gamemode... Arquivo criado com sucesso!");
	dini_IntSet(pattern,"Hora",0);
	dini_IntSet(pattern,"Minuto",0);
	dini_IntSet(pattern,"Segundo",0);
	dini_IntSet(pattern,"Dia",20);
	dini_IntSet(pattern,"Mes",2);
	dini_IntSet(pattern,"Ano",2008);
	dini_IntSet(pattern,"DiaSemana",0);
	HoraJogo = 0;
	MinutoJogo = 0;
	SegundoJogo = 0;
	DiaJogo = 20;
	MesJogo = 2;
	AnoJogo = 2008;
	ValorDia = 0;
	writelog("Dados: Dia da semana, Hora, Minuto, Segundo, Dia, Mes e Ano foram setados na pasta de utilit·rios do gamemode...");
	return 1;
	}
}
stock SavePastaUtilitarios(pattern[])
{
	if(!fexist(pattern)){
	writelog("Salvando pasta de utilit·rios do gamemode... A pasta n„o foi encontrada! Devido ‡ isso estamos criando uma nova!");
	CriarPastaUtilitarios("utilitarios.rpg");
	return 0;
	} else {
	dini_IntSet(pattern,"Hora",HoraJogo);
	dini_IntSet(pattern,"Minuto",MinutoJogo);
	dini_IntSet(pattern,"Segundo",SegundoJogo);
	dini_IntSet(pattern,"Dia",DiaJogo);
	dini_IntSet(pattern,"Mes",MesJogo);
	dini_IntSet(pattern,"Ano",AnoJogo);
	dini_IntSet(pattern,"DiaSemana",ValorDia);
	return 1;
	}
}
stock LoadPastaUtilitarios(pattern[])
{
	if(!fexist(pattern)){
	writelog("Carregando pasta de utilit·rios do gamemode... A pasta n„o foi encontrada! Devido ‡ isso estamos criando uma nova!");
	CriarPastaUtilitarios("utilitarios.rpg");
	return 0;
	} else {
	HoraJogo = dini_Int(pattern,"Hora");
	MinutoJogo = dini_Int(pattern,"Minuto");
	SegundoJogo = dini_Int(pattern,"Segundo");
	DiaJogo = dini_Int(pattern,"Dia");
	MesJogo = dini_Int(pattern,"Mes");
	AnoJogo = dini_Int(pattern,"Ano");
	ValorDia = dini_Int(pattern,"DiaSemana");
	return 1;
	}
}
stock CreatePickupFiles()
{
    new str[256];
	for(new i=0; i<QTPICKUPS; i++){
	    format(str,sizeof(str),"%d.pickup",i);
		if(fexist(str))return 0;
		dini_Create(str);
		dini_IntSet(str,"Modelo",0);
		dini_FloatSet(str,"X",0.0);
		dini_FloatSet(str,"Y",0.0);
		dini_FloatSet(str,"Z",0.0);
	}
	return 1;
}

stock LoadPickupFiles()
{
	writelog("Carregando pickups...");
    for(new i=QTPICKUPS; i<MAX_PICKUPS; i++){
        new str[256];
        format(str,sizeof(str),"%d.pickup",i);
        if(!fexist(str))return 0;
        CreatePickup(1272,1,dini_Float(str,"X"),dini_Float(str,"Y"),dini_Float(str,"Z"));
		new string[256];
		format(string,sizeof(string),"Pickup %d carregada!",i);
		writelog(string);
	}
	return 1;
}
stock CreateStartupVehicleFiles()
{
	new tmp[256];
	for(new v=1;v<QTCARS+1;v++){
	    format(tmp,256,"%d.vinfo",v);
	    if(fexist(tmp))return 0;
	    dini_Create(tmp);
		switch(GetVehicleModel(v)){
		    case 481,509,510,594:
		        {
		            dini_IntSet(tmp,"gasolina",-1);
		            GPV[v]=-1;
		            dini_Set(tmp,"dono","Server");
    			    Dono[v] = "Server";
				}
			default:
			    {
			        dini_IntSet(tmp,"gasolina",100);
			        GPV[v]=100;
			        dini_Set(tmp,"dono","Server");
    				Dono[v] = "Server";
				}
			}
		}
	return 1;
}
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
			GPV[resveh] = dini_Int(tmp2,"gasolina");
			if(dini_Isset(tmp,"cor1") && dini_Isset(tmp,"cor2")){
				new color1,color2;
				color1 = dini_Int(tmp,"cor1");
				color2 = dini_Int(tmp,"cor2");
				ChangeVehicleColor(resveh,color1,color2);
			}
		}
	}
	fclose(temp);
	writelog("Carregando lista de veÌculos... OK!");
	format(tmp,sizeof(tmp),"%d veÌculos carregados.",QtCars);
	writelog(tmp);
	ApplyPosForAllVehicles();
	ApplyTuningForAllVehicles();
	ApplyColorForAllVehicles();
	return 1;
}
stock ApplyPosForAllVehicles()
{
	new pattern[256];
	new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    ApplyVehicleToPos(contagem);
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
}
stock ApplyColorForAllVehicles(){
	new pattern[256];
    new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    ApplyColorForVehicle(contagem);
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
}
stock ApplyTuningForAllVehicles(){
	new pattern[256];
    new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    ApplyTuningForVehicle(contagem);
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
}
public DesarmandoDrogas(playerid)
{
    if(IsPlayerInAnyVehicle(playerid)){
  	DrogasPlantadas[GetPlayerVehicleID(playerid)] = 0;
	TogglePlayerControllable(playerid,1);
	AcrescentarExPoints(playerid,1);
	DesarmandoAsDrogas[playerid] = 0;
	SendClientMessage(playerid, COLOR_COP_NARCOTICOS, "Drogas desarmadas!");
	SendClientMessage(playerid, COLOR_COP_NARCOTICOS, "Agora ser· bom vocÍ achar o dono desse veÌculo!");
	SendClientMessage(playerid, COLOR_COP_NARCOTICOS, "Caso seja um veÌculo p˙blico vocÍ pode confisca-lo levando-o para a delegacia.");
    }
}
public SaveCarPos(vehicleid,Float:X,Float:Y,Float:Z,Float:Ang)
{
	new tmp[256];
	format(tmp,sizeof(tmp),"%d.vinfo",vehicleid);
	if(!fexist(tmp)) return 0;
 	dini_FloatSet(tmp,"PosX",X);
  	dini_FloatSet(tmp,"PosY",Y);
  	dini_FloatSet(tmp,"PosZ",Z);
   	dini_FloatSet(tmp,"PosAng",Ang);
	return 1;
}
public ApplyTuningForVehicle(vehicleid){
	new tmp[256];
	format(tmp,256,"%d.vinfo",vehicleid);
	if(!fexist(tmp)) return 0;
	if(dini_Isset(tmp,"paintjob")) ChangeVehiclePaintjob(vehicleid,dini_Int(tmp,"paintjob"));
	for(new ts=1; ts<18; ts++){
	    new tmp2[256];
	    format(tmp2,256,"tun%d",ts);
	    if(dini_Isset(tmp,tmp2)) AddVehicleComponent(vehicleid,dini_Int(tmp,tmp2));
	}
	return 1;
}
stock SaveWeapons(playerid, weapon, ammo)
{
    if(dini_Exists(PlayerName(playerid))){
		switch(weapon)
		{
			case 0,1 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot0",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot0Ammo",ammo);
			}
			case 2,3,4,5,6,7,8,9 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot1",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot1Ammo",ammo);
			}
			case 22,23,24 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot2",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot2Ammo",ammo);
			}
			case 25,26,27 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot3",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot3Ammo",ammo);
			}
			case 28,29,32 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot4",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot4Ammo",ammo);
			}
			case 30,31 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot5",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot5Ammo",ammo);
			}
			case 33,34 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot6",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot6Ammo",ammo);
			}
			case 35,36,37,38 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot7",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot7Ammo",ammo);
			}
			case 16,17,18,19,39 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot8",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot8Ammo",ammo);
			}
			case 41,42,43 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot9",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot9Ammo",ammo);
			}
			case 10,11,12,13,14,15 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot10",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot10Ammo",ammo);
			}
			case 44,45,46 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot11",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot11Ammo",ammo);
			}
			case 40 : {
				dini_IntSet(PlayerName(playerid),"WeaponSlot12",weapon);
				dini_IntSet(PlayerName(playerid),"WeaponSlot12Ammo",ammo);
			}
  		}
	}
}

stock LoadWeapons(playerid)
{
    if(dini_Exists(PlayerName(playerid))){
    	if(dini_Int(PlayerName(playerid),"WeaponSlot0") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot0"),dini_Int(PlayerName(playerid),"WeaponSlot0Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot1") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot1"),dini_Int(PlayerName(playerid),"WeaponSlot1Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot2") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot2"),dini_Int(PlayerName(playerid),"WeaponSlot2Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot3") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot3"),dini_Int(PlayerName(playerid),"WeaponSlot3Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot4") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot4"),dini_Int(PlayerName(playerid),"WeaponSlot4Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot5") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot5"),dini_Int(PlayerName(playerid),"WeaponSlot5Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot6") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot6"),dini_Int(PlayerName(playerid),"WeaponSlot6Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot7") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot7"),dini_Int(PlayerName(playerid),"WeaponSlot7Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot8") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot8"),dini_Int(PlayerName(playerid),"WeaponSlot8Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot9") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot9"),dini_Int(PlayerName(playerid),"WeaponSlot9Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot10") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot10"),dini_Int(PlayerName(playerid),"WeaponSlot10Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot11") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot11"),dini_Int(PlayerName(playerid),"WeaponSlot11Ammo"));
		}
		if(dini_Int(PlayerName(playerid),"WeaponSlot12") != 0){
			GivePlayerWeapon(playerid,dini_Int(PlayerName(playerid),"WeaponSlot12"),dini_Int(PlayerName(playerid),"WeaponSlot12Ammo"));
		}
 	}
}
stock SavePaintjob(vehicle,paintjobid)
{
	new tmp[256];
	format(tmp,256,"%d.vinfo",vehicle);
	dini_IntSet(tmp,"paintjob",paintjobid);
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
public OnVehicleMod(vehicleid, componentid)
{
	switch(componentid)
	{
	  	case 1018,1019,1020,1021,1022,1028,1029,1034,1037,1043,1044,1045,1046,1059,1064,1065,1066,1089,1092,1104,1105,1113,1114,1126,1127,1129,1132,1135,1136: SaveTuning(vehicleid,1,componentid);
		case 1004,1005,1011,1012: SaveTuning(vehicleid,2,componentid);
		case 1006,1032,1033,1035,1038,1053,1054,1055,1061,1067,1068,1088,1091,1103,1128,1130,1131: SaveTuning(vehicleid,3,componentid);
		case 1025,1073,1074,1075,7076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1096,1097,1098: SaveTuning(vehicleid,4,componentid);
		case 1087: SaveTuning(vehicleid,5,componentid);
		case 1008,1009,1010: SaveTuning(vehicleid,6,componentid);
		case 1117,1152,1153,1155,1157,1160,1165,1167,1169,1170,1171,1172,1173,1174,1176,1179,1181,1182,1185,1188,1189,1190,1191: SaveTuning(vehicleid,7,componentid);
		case 1140,1141,1148,1149,1150,1151,1154,1156,1159,1161,1166,1168,1175,1177,1178,1180,1183,1184,1186,1187,1192,1193: SaveTuning(vehicleid,8,componentid);
	    case 1013,1024: SaveTuning(vehicleid,9,componentid);
		case 1000,1001,1002,1003,1014,1015,1016,1023,1049,1050,1058,1060,1138,1139,1146,1147,1158,1162,1163,1164: SaveTuning(vehicleid,10,componentid);
	    case 1007,1017,1026,1027,1030,1031,1036,1039,1040,1041,1042,1047,1048,1051,1052,1056,1057,1062,1063,1069,1070,1071,1072,1090,1093,1094,1095,1099,1101,1102,1106,1107,1108,1118,1119,1120,1121,1122,1124,1133,1134,1137: SaveTuning(vehicleid,11,componentid);
	    case 1109,1110: SaveTuning(vehicleid,12,componentid);
		case 1115,1116: SaveTuning(vehicleid,13,componentid);
	    case 1086: SaveTuning(vehicleid,14,componentid);
		case 1142, 1143, 1144, 1145: SaveTuning(vehicleid,15,componentid);
	    case 1111, 1112: SaveTuning(vehicleid,16,componentid);
		case 1100, 1123: SaveTuning(vehicleid,17,componentid);
	}
}
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
	    set(Dono[contagem],dini_Get(pattern,"dono"));
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
		new string[256];
		format(string,sizeof(string),"Gas e Dono do veÌculo %d carregados!",contagem);
		writelog(string);
	}
	return 1;
}
stock CriarPlacas()
{
	new contagem = 1;
	new placa[256];
	new tmp[256];
	format(tmp, sizeof(tmp),"%d.vinfo",contagem);
	format(placa, sizeof(placa), "RVL %d",contagem);
	while(fexist(tmp)){
	dini_Set(tmp,"Placa",placa);
	SetVehicleNumberPlate(contagem,placa);
	contagem ++;
	format(tmp, sizeof(tmp),"%d.vinfo",contagem);
	format(placa, sizeof(placa), "RVL %d",contagem);
	}
}
stock SalvarPlaca(vehicleid,string[])
{
	new tmp[256];
	format(tmp,sizeof(tmp),"%d.vinfo",vehicleid);
	if(dini_Exists(tmp)){
	dini_Set(tmp,"Placa",string);
	SetVehicleNumberPlate(vehicleid,string);
	}
	else{
		printf("N„o conseguimos salvar a placa do veiculo %d",vehicleid);
		printf("Pois seu arquivo n„o foi encontrado");
	}
}

stock SalvarAlarme(vehicleid,num)
{
    for(new i=0;i<MAX_PLAYERS;i++){
		new tmp[256];
		format(tmp,sizeof(tmp),"%d.vinfo",vehicleid);
		if(dini_Exists(tmp)){
			dini_IntSet(tmp,"Alarme", num);
		} else {
			printf("N„o conseguimos salvar o alarme do veiculo %d",vehicleid);
			printf("Pois seu arquivo n„o foi encontrado");
		}
	}
}


public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerColor(playerid,COLOR_UNLOGGED);
	SetPlayerCameraPos(playerid,2042.6848,-1404.6050,68.8817);
	SetPlayerCameraLookAt(playerid,2000.6848,-1398.6050,69.8817);
	PlayerPlaySound(playerid, 1185,0.0,0.0,0.0);
	TextDrawShowForPlayer(playerid,Bemvindo);
	if(PLAYERLIST_authed[playerid] == 1){
	    SpawnPlayer(playerid);
	}
}

public OnGameModeExit()
{
	writelog("Reload Virtual Life RpG finalizado. Fechando log e salvando estatÌsticas dos usu·rios...");
	new string[256];
	for(new i; i<MAX_VEHICLES; i++){
	    valstr(string,i);
	    if(dini_Isset("gpv.rpg",string)){
	        dini_IntSet("gpv.rpg",string,GPV[i]);
		}
	}
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			if (PLAYERLIST_authed[i] == 1) {
			// Was loggedin, so save the data!
				dini_IntSet(PlayerName(i),"Dinheiro",GetPlayerMoney(i));
				new weapon, ammo;
				for(new s=0; s<13; s++){
    				GetPlayerWeaponData(i, s, weapon, ammo);
    				SaveWeapons(i, weapon, ammo);
				}
				new msg[256];
				format(msg,sizeof(msg),"Salvando dados de %s (ID %d)... OK!",PlayerName(i),i);
				writelog(msg);
				printf("Dados de %s (ID: %d) salvos com sucesso\n",PlayerName(i),i);
			}
		}
	}
	SavePastaUtilitarios("utilitarios.rpg");
	writelog("Salvando estatÌsticas dos usu·rios... ConcluÌdo!");
	writelog("Reload Virtual Life RpG finalizado com sucesso");
	print("Saindo do Gamemode RPG");
	return 1;

}

public OnPlayerConnect(playerid)
{
    SetPlayerMapIcon(playerid, 1, 1556.1224,-1629.2106,13.1586,30, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 2, 1181.4885,-1309.3250,13.4093,22, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 3, 2107.1155,-1068.3652,25.6829,19, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 4, 2031.4415,-1415.3073,16.9922,22, 0xE6E6E6E6);
    SetPlayerMapIcon(playerid, 5, 1771.7144,-1655.8201,14.4236,52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 6, 1386.0540,-1015.7602,26.6676,52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 7, 419.7245,-1428.6298,32.4797,52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 8, 2862.3201,-1440.2727,10.9410,52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 9, -2431.5830,1544.0275,32.0368,23, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 10, 1776.8333,-2049.3662,13.5644,36, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 11, 623.3184,860.1561,-42.9534,11, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 12, 2644.6877,-2038.3588,13.5500,27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 13, -2180.8816,610.9266,35.1641,43, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 14, 2197.3296,-1999.1161,19.5405,23, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 15, 1480.7003,-1758.4271,17.5313,16, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 16, 1776.8333,-2049.3662,13.5644,36, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 17, 565.8999,-2304.5605,0.2333,9, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 18, 1041.6371,-1028.2263,31.6374,27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 19, 1567.7448,-1882.4926,13.1481,17, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 20, 1309.2073,-1374.3125,13.6252,61, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 21, 213.2892,-1437.2351,13.2062,55, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 22, 2098.7305,-1804.9253,13.5548,29, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 23, 1873.1766,-1683.9338,57.7960,48, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 24, 2316.2393,-1638.8606,18.5078,49, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 26, 2128.1797,-1126.4047,25.5413,27, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 25, 1733.8523,-1586.3459,13.5553,25, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 27, 1633.1495,-1170.9047,24.0781,25, 0xE6E6E6E6);
    SetPlayerMapIcon(playerid, 28, 2861.6653,-1405.8640,11.7344,31, 0xE6E6E6E6);
    SetPlayerMapIcon(playerid, 29, 243.5183,66.3445,1003.6406,42, 0xE6E6E6E6);
    SetPlayerMapIcon(playerid, 30, 1477.3245,-1880.2889,13.5469,50, 0xE6E6E6E6);
    
	TogglePlayerClock(playerid,1);
    Agenda[playerid] = 0;
    numplayers++;
    Kills[playerid]=0;
   	Contrabando[playerid] = 0;
   	Acertos[playerid]=0;
	PlayerDentro[playerid]=false;
	Receita[playerid] = 0;
    celular[playerid] = 0;
    Negocio[playerid] = 0;
	Negociador[playerid] = 0;
	PropriedadeContrato[playerid] = -1;
	PropriedadeEscolhida[playerid] = -1;
	PropriedadeSelecionada[playerid] = -1;
	ValorOferecido[playerid] = 0;
   	LastVote[playerid] = 255;
   	KickVote[playerid] = 0;
	VoteKick[playerid] = 0;
    zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	MissaoLixeiro[playerid] = 0;
	DebugKeys[playerid] = 0;
	SetPlayerTime(playerid,HoraJogo,MinutoJogo);
	PLAYERLIST_authed[playerid] = 0;
	Escondido[playerid] = 0;
	SetPlayerColor(playerid,COLOR_UNLOGGED);
	new PlayerIP[256];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	printf("%s acabou de entrar",PlayerName(playerid));
	printf("Dados do jogador:");
	printf("ID: %d",playerid);
	printf("IP: %d",PlayerIP);
	printf("Dinheiro inicial: $%d",GetPlayerMoney(playerid));
	printf("Ping inicial: %d",GetPlayerPing(playerid));
	TextDrawHideForPlayer(playerid,Speedo[playerid]);
	new msg[256];
 	format(msg,sizeof(msg),"%s acabou de entrar.",PlayerName(playerid));
	SendClientMessageToAll(COLOR_PALHA,msg);
	format(msg,sizeof(msg),"%s entra no servidor, com o ID %d.",PlayerName(playerid),playerid);
	writelog(msg);
	format(msg,sizeof(msg),"Ol· %s, sej· bem vindo ao Reload Virtual Life RpG.",PlayerName(playerid));
	SendClientMessage(playerid, COLOR_ORANGE,msg);
	SendClientMessage(playerid, COLOR_COP_SWAT, ":.N„o sabe jogar? /aprender.:");
	SendClientMessage(playerid, COLOR_ROSA, 	":.D˙vida em alguma coisa? /ajuda.:");
	SendClientMessage(playerid, COLOR_CONTRABANDISTA, ":.Quer saber os comandos? /comandos.:");
	TextDrawHideForPlayer(playerid,Speedo[playerid]);
	if(dini_Exists(PlayerName(playerid))) {
		SendClientMessage(playerid, COLOR_PALHA, "VocÍ j· tem registro. Por favor faÁa login com /logar [senha].");
		return 1;
	}
	if(!dini_Exists(PlayerName(playerid))) {
		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem registro. Por favor registre-se digitando /registrar [senha].");
        ChatNotDisable[playerid] = 1;
		return 1;
	}
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(!PLAYERLIST_authed[playerid]) SendClientMessage(playerid,COLOR_RED,"N„o È possivel entrar no jogo. Por favor logue-se ou registre-se.");
	else LogarPlayer(playerid);
    return 0;
}

public OnPlayerDisconnect(playerid, reason)
{
    
    new weapon,ammo;
    for(new s=0; s<13; s++){
    	GetPlayerWeaponData(playerid, s, weapon, ammo);
    	SaveWeapons(playerid, weapon, ammo);
    }
   	dini_IntSet(PlayerName(playerid),"Dinheiro",GetPlayerMoney(playerid));
    numplayers--;
   	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	KillTimer(TimerVenda[playerid]);
	KillTimer(TimerStrip[playerid]);
	KillTimer(TimerCobranca[playerid]);
	KillTimer(TimerDivida[playerid]);
	KillTimer(avisado[playerid]);
   	TextDrawHideForPlayer(playerid,Bemvindo);
   	TextDrawHideForPlayer(playerid,Speedo[playerid]);
   	TextDrawHideForPlayer(playerid,Speedo[playerid]);
   	TextDrawHideForPlayer(playerid,tdStrip);
   	TextDrawHideForPlayer(playerid,tdDesmanche);
   	TextDrawHideForPlayer(playerid,tdLixao);
   	TextDrawHideForPlayer(playerid,tdPizzaria);
   	TextDrawHideForPlayer(playerid,tdColheita);
   	TextDrawHideForPlayer(playerid,tdPlant);
   	TextDrawHideForPlayer(playerid,tdLeite);
   	TextDrawHideForPlayer(playerid,Banco);
   	TextDrawHideForPlayer(playerid,Posto);
   	TextDrawHideForPlayer(playerid,tdForte);
   	TextDrawHideForPlayer(playerid,Delegacia);
   	TextDrawHideForPlayer(playerid,Hospital);
   	TextDrawHideForPlayer(playerid,tdPesca);
   	TextDrawHideForPlayer(playerid,tdCoopPesca);
   	TextDrawHideForPlayer(playerid,Hotel);
  	TextDrawHideForPlayer(playerid,tdPdCarga);
   	TextDrawHideForPlayer(playerid,tdConstrucao);
   	TextDrawHideForPlayer(playerid,td247);
   	TextDrawHideForPlayer(playerid,tdAreaCarga);
   	TextDrawHideForPlayer(playerid,tdStrip);
   	TextDrawHideForPlayer(playerid,tdAreaDescarga);
   	TextDrawHideForPlayer(playerid,tdSorveteria);
   	TextDrawHideForPlayer(playerid,tdBar);
	if(declaracoesabertas[playerid] == 1 || Audiencia[playerid] == 1){
        Audiencia[playerid] = 0;
        declaracoesabertas[playerid] = 0;
        SendClientMessageToAll(COLOR_JUIZ, "O Processo foi arquivado.");
		return 1;
	}
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
	    		format(msg,sizeof(msg),"O jogador %s deixou o servidor (Queda de conex„o)",PlayerName(playerid));
		    	SendClientMessageToAll(COLOR_PALHA,msg);
			}
		case 1:
		    {
			    format(msg,sizeof(msg),"O jogador %s deixou o servidor (Vontade prÛpria)",PlayerName(playerid));
	    		SendClientMessageToAll(COLOR_PALHA,msg);
			}
		case 2:
		    {
			    format(msg,sizeof(msg),"O jogador %s deixou o servidor (Kickado/Banido)",PlayerName(playerid));
	    		SendClientMessageToAll(COLOR_PALHA,msg);
			}
	}
	switch (PLAYERLIST_authed[playerid])
    {
        case 0:
			{
				format(msg,sizeof(msg),"%s (ID: %d) deixou o servidor sem se registrar/logar.",PlayerName(playerid),playerid);
				writelog(msg);
				printf("Jogador %s (ID: %d) deixou o servidor sem se registrar/logar",PlayerName(playerid),playerid);
			}
		case 1:
		    {
				format(msg,sizeof(msg),"%s (ID %d) est· deixando o servidor. Salvando dados.",PlayerName(playerid),playerid);
				writelog(msg);
				dini_IntSet(PlayerName(playerid),"Dinheiro",GetPlayerMoney(playerid));
				dini_IntSet(PlayerName(playerid),"CreditosCell", CellCredits[playerid]);
		 		printf("Jogador %s (ID: %d) deixou o servidor. Seus dados foram salvos com sucesso.",PlayerName(playerid),playerid);
			}
    }
	return 1;
}

public OnPlayerSpawn(playerid)
{
    if(dini_Int(PlayerName(playerid),"HistoriaFeita") == 1) PlayerPlaySound(playerid, 1186, 0.0,0.0,0.0);
   	zoneupdates[playerid] = 1;
	player_zone[playerid] = -1;
	if(!zoneupdate) zoneupdate = SetTimer("update_zones",1000,4);
	TextDrawHideForPlayer(playerid,Bemvindo);
	SetPlayerColor(playerid,ProfColors[Profissao[playerid]]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][0],ProfWeapons[Profissao[playerid]][1]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][2],ProfWeapons[Profissao[playerid]][3]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][4],ProfWeapons[Profissao[playerid]][5]);
	GangZoneShowForPlayer(playerid, PescaArea, COLOR_PESCADOR);
	GangZoneShowForPlayer(playerid, InstrutorArea, COLOR_INSTRUTOR);
	GangZoneShowForPlayer(playerid, DesmancheArea, COLOR_RED2);
	GangZoneShowForPlayer(playerid, TaxiArea, COLOR_TAXISTA);
	GangZoneShowForPlayer(playerid, ProstitutaArea, COLOR_ROSA);
	GangZoneShowForPlayer(playerid, SorveteriaArea, COLOR_ROSACLARO);
	LoadWeapons(playerid);
    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid,		 0);
	if(PLAYERLIST_authed[playerid] == 0){
		SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		SetPlayerFacingAngle(playerid, 90.0000);
    	return 1;
	}
	if(dini_Int(PlayerName(playerid),"Preso") == 1 || Procurados[playerid]){
		LogarPlayer(playerid);
    	return 1;
	}
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    new string[256];
    new morte = random(9);
	if(morte == 0){
		format(string,sizeof(string),"O Hospital acaba de avisar, que mais uma vitima do crime foi achada, nome da vitima: %s.",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
	} else if(morte == 1){
		format(string,sizeof(string),"Os paramÈdicos foram chamados para o local mas quando chegaram l· %s j· estava inconsciente.",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
	} else if(morte == 2){
		format(string,sizeof(string),"Mendigos encontraram o corpo de %s no ch„o, paramÈdicos levaram para o Hospital.",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
	} else if(morte == 3){
		format(string,sizeof(string),"Fazendo a Ronda do Quarteir„o, polÌciais acharam o corpo de %s inconsciente.",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
	} else if(morte == 4){
		format(string,sizeof(string),"Olhando para a esquerda, um cidad„o encontra %s inconsciente e liga imediatamente para os paramÈdicos.",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
    } else if(morte == 5){
		format(string,sizeof(string),"Jornalista encontra %s inconsciente e resolve publicar no jornal antes da ambul‚ncia chegar!",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
    } else if(morte == 6){
		format(string,sizeof(string),"Delegado encontra %s inconsciente e fala que vai investigar sobre o crime, os paramÈdicos j· foram chamados ao local!",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
    } else if(morte == 7){
		format(string,sizeof(string),"Uma ambul‚ncia que estava passeando encontrou %s inconsciente, o motorista resolveu leva-lo ao hospital.",PlayerName(playerid));
		SendClientMessageToAll(0xFFB4F4AA,string);
	} else if(morte == 8){
	    format(string,sizeof(string),"Um corpo foi encontrado em %s. Supeita-se que seja de %s",zones[player_zone[playerid]][zone_name],PlayerName(playerid));
	    SendClientMessageToAll(0xFFB4F4AA,string);
	}
    new hosp = GetClosestHospital(playerid);
    SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"),Hospitais[hosp][0],Hospitais[hosp][1],Hospitais[hosp][2],Hospitais[hosp][3],0,0,0,0,0,0);
    new strrand = minrand(0,4);
    if(dini_Int(PlayerName(playerid),"Seguro") == 0){
		format(string,sizeof(string), "VocÍ foi encontrado quase morto e foi levado ao Hospital. O valor do tratamento foi de $%d",ValorTratamento[strrand]);
		SendClientMessage(playerid, COLOR_RED, string);
		dini_IntSet(PlayerName(playerid),"Banco",dini_Int(PlayerName(playerid),"Banco") - ValorTratamento[strrand]);
	}
	else if(dini_Int(PlayerName(playerid),"Seguro") == 1){
        SendClientMessage(playerid, COLOR_RED, "VocÍ foi encontrado quase morto e foi levado ao Hospital. Seu seguro cobriu o pagamento do tratamento");
		AcrescentarPrejuizo(3,ValorTratamento[strrand]/2);
	}
    new weapon,ammo;
    for(new s=0; s<13; s++){
    	GetPlayerWeaponData(playerid, s, weapon, ammo);
    	SaveWeapons(playerid, weapon, ammo);
    	LoadWeapons(playerid);
    }
	SendDeathMessage(killerid,playerid,reason);
   	GameTextForPlayer(playerid,"~w~Foi pro saco", 5000,2);
	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	Contrabando[playerid] = 0;
	Receita[playerid] = 0;
    Kills[killerid]++;
    DisablePlayerCheckpoint(playerid);
	if(ValorCabeca[playerid] != 0 && Profissao[killerid] == ASSASSINO){
	    new str[256];
		SendClientMessage(killerid, COLOR_GREEN, "Muito bem! Matou um jogador que estava com a cabeÁa premiada!");
		format(str,sizeof(str),"VocÍ recebeu: $%d",ValorCabeca[playerid]);
		SendClientMessage(killerid, COLOR_GREEN, string);
		GivePlayerMoney(killerid, ValorCabeca[playerid]);
		AcrescentarExPoints(killerid,1);
		ValorCabeca[playerid] = 0;
	}
    if(killerid == INVALID_PLAYER_ID) {
	   new str[256];
	   format(str, sizeof(str),"%s ficou inconsciente, os paramÈdicos dizem que ele bebeu demais!",PlayerName(playerid));
	   SendClientMessageToAll(COLOR_EMERGENCIA, str);
	}
	if(Procurados[playerid] == 1){
	    SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
	    dini_IntSet(PlayerName(playerid),"Preso", 1);
	}
    if(killerid != INVALID_PLAYER_ID) {
        if(GetPlayerWantedLevel(playerid) > 0){
            SendClientMessage(killerid,COLOR_GREEN,"VocÍ ganhou uma graninha da polÌcia por ter matado esse cara.");
            GivePlayerMoney(killerid,GetPlayerWantedLevel(playerid)*300);
		}
		if(Profissao[killerid] == COP_MILITAR || Profissao[killerid] == COP_RODOVIARIO || Profissao[killerid] == COP_SWAT || Profissao[killerid] == DELEGADO) {
		    SetPlayerWantedLevel(killerid, 0);
		    SetPlayerWantedLevel(playerid, 0);
		    dini_IntSet(PlayerName(killerid),"Wanted", 0);
	    }
	    if((Profissao[playerid] == DELEGADO  || Profissao[playerid] == JUIZ) && Chave[killerid] == 0){
		 	SendClientMessage(killerid, COLOR_GREEN, "VocÍ matou o Juiz/Delegado, roubou a chave da cadeia, agora pode libertar 1 pessoa!");
		 	SendClientMessage(killerid, COLOR_GREEN, "Basta usar /soltarpreso [id]");
		 	SendClientMessage(playerid, COLOR_JUIZ, "O Assassino roubou a chave da pris„o. Comunique a polÌcia!!");
			Chave[killerid] = 1;
		}
		if((Profissao[killerid] == COP_MILITAR || Profissao[killerid] == COP_SWAT || Profissao[killerid] == DELEGADO) && Chave[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ foi morto por um policial e a chave da cadeia foi tomada de vocÍ!");
			SendClientMessage(killerid, COLOR_GREEN, "Bom trabalho! VocÍ tirou a chave da cadeia desse vagabundo!");
			Chave[playerid] = 0;
		}
		if(Sequestro[killerid] == 1 && Sequestrador[killerid] == playerid){
		   Sequestro[killerid] = 0;
		   Sequestrador[killerid] = 0;
		   SendClientMessage(killerid, COLOR_GREEN, "Muito bem! VocÍ matou um jogador que te sequestrou, agora o sequestro j· era!");
		   SendClientMessage(playerid, COLOR_RED, "Sua vÌtima de sequestro te matou ent„o o sequestro j· era!");
		}
		if(Profissao[playerid] == ASSASSINO){
        		for(new i=0; i<MAX_PLAYERS; i++){
   					if(Cativeiro[i] == 1){
		   				if(Sequestrador[i] == playerid){
							if(i != INVALID_PLAYER_ID){
			   					Cativeiro[i] = 0;
			   					Sequestro[i] = 0;
			   					SendClientMessage(playerid, COLOR_RED, "As pessoas que vocÍ sequestrou foram soltas porque vocÍ morreu!");
			   					format(string, sizeof(string), "O sequestrador morreu por %s! Ou seja, graÁas ‡ %s vocÍ foi salvo!",PlayerName(killerid),PlayerName(killerid));
								SendClientMessage(i, COLOR_GREEN, string);
								format(string, sizeof(string), "O jogador %s acabou com um sequestro por matar o sequestrador!",PlayerName(killerid));
								SendClientMessageToAll(COLOR_JUIZ, string);
								SendClientMessageToAll(COLOR_JUIZ, "O governo est· lhe recompensando com $1000");
								GivePlayerMoney(killerid,1000);
	                    	}
	                    }
				   }
		      }
		}
		
		if(Profissao[killerid] == COP_MILITAR || Profissao[killerid] == COP_RODOVIARIO || Profissao[killerid] == COP_SWAT || Profissao[killerid] == DELEGADO && Profissao[playerid] == ASSASSINO){
		   AcrescentarExPoints(killerid,1);
		   DiminuirExPoints(playerid,1);
		}

		if(Profissao[killerid] == ASSASSINO && Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == DELEGADO){
           AcrescentarExPoints(killerid,1);
		   DiminuirExPoints(playerid,1);
		}
		
		if(Profissao[killerid] == COP_NARCOTICOS && Profissao[playerid] == TRAFICANTE || Profissao[playerid] == LIDER_DE_TRAFICO){
           AcrescentarExPoints(killerid,1);
		   DiminuirExPoints(playerid,1);
		}
		
		if(Profissao[killerid] == TRAFICANTE || Profissao[killerid] == LIDER_DE_TRAFICO && Profissao[playerid] == COP_NARCOTICOS){
           AcrescentarExPoints(killerid,1);
		   DiminuirExPoints(playerid,1);
		}
		
		if(Profissao[killerid] == ASSASSINO){
			if(GetPlayerMoney(playerid) >= 10000 && GetPlayerMoney(playerid) < 30000){
    			AcrescentarExPoints(killerid,1);
    			GivePlayerMoney(killerid,GetPlayerMoney(playerid));
    			ResetPlayerMoney(playerid);
				SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 1 Ponto por ter matado um jogador com mais de $10.000");
			}
			else if(GetPlayerMoney(playerid) >= 30000 && GetPlayerMoney(playerid) < 50000){
	 			AcrescentarExPoints(killerid,2);
	 	    	GivePlayerMoney(killerid,GetPlayerMoney(playerid));
				ResetPlayerMoney(playerid);
	  		    SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 2 Pontos por ter matado um jogador com mais de $30.000");
			}
			else if(GetPlayerMoney(playerid) >= 50000 && GetPlayerMoney(playerid) < 100000){
	   			AcrescentarExPoints(killerid,3);
				GivePlayerMoney(killerid,GetPlayerMoney(playerid));
	    		ResetPlayerMoney(playerid);
	    		SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 3 Pontos por ter matado um jogador com mais de $50.000");
			}
			else if(GetPlayerMoney(playerid) >= 100000){
	   			AcrescentarExPoints(killerid,4);
	 			GivePlayerMoney(killerid,GetPlayerMoney(playerid));
		    	ResetPlayerMoney(playerid);
	    		SendClientMessage(killerid, COLOR_GREEN, "VocÍ ganhou 4 Pontos por ter matado um jogador com mais de $100.000");
			}
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
				dini_IntSet(PlayerName(killerid),"Wanted", 1);
			}
		case 5:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 2 Estrelas de Procurado por 5 mortes e ainda n„o foi pego.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_RODOVIARIO, string);
				SendClientMessage(killerid, COLOR_RED, "Bom... VocÍ agora tem 2 Estrelas de Procurado por 5 mortes.");
				SetPlayerWantedLevel(killerid, 2);
				SetPlayerWantedLevel(playerid, 0);
				dini_IntSet(PlayerName(killerid),"Wanted", 2);
			}
		case 7:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 3 Estrelas de Procurado por 7 mortes. Est· fazendo os cops de MARIQUINHAS!",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "ExÌmio matador! VocÍ agora tem 3 Estrelas de Procurado por 7 mortes.");
				SetPlayerWantedLevel(killerid, 3);
				SetPlayerWantedLevel(playerid, 0);
				dini_IntSet(PlayerName(killerid),"Wanted", 3);
			}
		case 12:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 4 Estrelas de Procurado por 12 mortes. Nada?",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "J· comeÁou a botar medo nos cops. VocÍ agora tem 4 Estrelas de Procurado por 12 mortes.");
				SetPlayerWantedLevel(killerid, 4);
				SetPlayerWantedLevel(playerid, 0);
				dini_IntSet(PlayerName(killerid),"Wanted", 4);
			}
		case 18:
			{
				format(string, sizeof(string), "O Jogador %s agora tem 5 Estrelas de Procurado por 18 mortes. O Delegado j· est· irritado com sua imcompetÍncia.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "AtÈ os admins se rendem ao seu poder! VocÍ agora tem 5 Estrelas de Procurado por 18 mortes.");
				SetPlayerWantedLevel(killerid, 5);
				SetPlayerWantedLevel(playerid, 0);
				dini_IntSet(PlayerName(killerid),"Wanted", 5);
			}
		case 25:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 6 Estrelas de Procurado por 25 mortes. Fim de Carreira!",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "Daqui vocÍ n„o passa! VocÍ agora tem 6 Estrelas de Procurado por 25 mortes.");
				SetPlayerWantedLevel(killerid, 6);
				SetPlayerWantedLevel(playerid, 0);
				dini_IntSet(PlayerName(killerid),"Wanted", 6);
			}
	}
	if(Camuflado[killerid] == 1){
        SendClientMessage(killerid, COLOR_RED2, "Que beleza! ninguÈm sabe quem o matou!");
		SendClientMessage(playerid, COLOR_GREEN, "AlguÈm camuflado lhe matou, n„o foi possÌvel vocÍ detectar.");
		return 0;
	}
	for(new i=0; i<MAX_PLAYERS; i++){
		if(GetDistanceBetweenPlayers(i,killerid) > 100){
		    if(i != killerid && i != playerid){
				SendClientMessage(killerid, COLOR_GREEN, "AlguÈm viu o crime!");
			}
		}
		return 0;
	}
	return 1;
}
forward ApplyColorForVehicle(vehicleid);
public ApplyColorForVehicle(vehicleid)
{
    new tmp[256];
	format(tmp,sizeof(tmp),"%d.vinfo",vehicleid);
	if(dini_Isset(tmp,"cor1") && dini_Isset(tmp,"cor2")){
		new color1,color2;
		color1 = dini_Int(tmp,"cor1");
		color2 = dini_Int(tmp,"cor2");
		ChangeVehicleColor(vehicleid,color1,color2);
	}
}
forward ApplyVehicleToPos(vehicleid);
public ApplyVehicleToPos(vehicleid)
{
    new tmp[256];
	format(tmp,sizeof(tmp),"%d.vinfo",vehicleid);
    if(dini_Isset(tmp,"PosX") && dini_Isset(tmp,"PosY") && dini_Isset(tmp,"PosZ") && dini_Isset(tmp,"PosAng")){
		SetVehiclePos(vehicleid,dini_Float(tmp,"PosX"),dini_Float(tmp,"PosY"),dini_Float(tmp,"PosZ"));
		SetVehicleZAngle(vehicleid,dini_Float(tmp,"PosAng"));
	}
}
forward ApplySeguroForVehicle(vehicleid);
public ApplySeguroForVehicle(vehicleid)
{
	new tmp[256];
	format(tmp,sizeof(tmp),"%d.vinfo",vehicleid);
	if(dini_Isset(tmp,"Seguro")){
		if(dini_Int(tmp,"Seguro") == 1){
			SeguroCarro[vehicleid] = 1;
			if(IsStringAName(dini_Get(tmp,"Dono"))){
				dini_IntSet(dini_Get(tmp,"Dono"),"Banco",dini_Int(dini_Get(tmp,"Dono"),"Banco")-100);
				AcrescentarLucro(3,100);
			}
		}
		else{
			SeguroCarro[vehicleid] = 0;
		}
	}
}
public OnVehicleSpawn(vehicleid)
{
	new tmp[256];
	format(tmp,sizeof(tmp),"%d.vinfo",vehicleid);
    SetTimerEx("ApplyColorForVehicle",10000,false,"d",vehicleid);
    SetTimerEx("ApplyVehicleToPos",10000,false,"d",vehicleid);
	SetTimerEx("ApplyTuningForVehicle",10000,false,"d",vehicleid);
	SetTimerEx("ApplySeguroForVehicle",10000,false,"d",vehicleid);
	printf("OnVehicleSpawn(%d)", vehicleid);
	if(dini_Exists(tmp)){
		SetVehicleNumberPlate(vehicleid,dini_Get(tmp,"Placa"));
	}
	else{
		printf("N„o conseguimos carregar a placa do veiculo %d",vehicleid);
		printf("Pois seu arquivo n„o foi encontrado");
	   }
  }
stock LoadColors()
{
	for(new i=0; i<QTCARS; i++){
		new tmp[256];
		format(tmp,sizeof(tmp),"%d.vinfo",i);
		if(dini_Isset(tmp,"cor1") && dini_Isset(tmp,"cor2")){
			new color1,color2;
			color1 = dini_Int(tmp,"cor1");
			color2 = dini_Int(tmp,"cor2");
			ChangeVehicleColor(i,color1,color2);
		}
	}
}
stock SaveColors(vehicleid,color1,color2)
{
	new tmp[256];
	format(tmp,256,"%d.vinfo",vehicleid);
	new tmp2[256];
	format(tmp2,256,"cor1");
	new tmp3[256];
	format(tmp3,256,"cor2");
	if(!fexist(tmp))return 0;
	dini_IntSet(tmp,tmp2,color1);
	dini_IntSet(tmp,tmp3,color2);
	return 1;
}
public OnVehiclePaintjob(vehicleid,paintjobid)
{
	new tmp[256];
	format(tmp,256,"%d.vinfo",vehicleid);
	new tmp2[256];
	format(tmp2,256,"cor1");
	new tmp3[256];
	format(tmp3,256,"cor2");
	if(!fexist(tmp))return 0;
	dini_IntSet(tmp,tmp2,paintjobid);
	dini_IntSet(tmp,tmp3,paintjobid);
	return 1;
}
public OnVehicleRespray(vehicleid, color1, color2)
{
	new tmp[256];
	format(tmp,256,"%d.vinfo",vehicleid);
	new tmp2[256];
	format(tmp2,256,"cor1");
	new tmp3[256];
	format(tmp3,256,"cor2");
	dini_IntSet(tmp,tmp2,color1);
	dini_IntSet(tmp,tmp3,color2);
}
public OnVehicleDeath(vehicleid, killerid)
{
   if(SeguroCarro[vehicleid] == 1){
	   SetVehicleToRespawn(vehicleid);
	   new tmp[256];
	   format(tmp, sizeof(tmp),"%d.vinfo",vehicleid);
	   new donovehicle[256];
	   donovehicle = dini_Get(tmp,"Dono");
	   if(IsStringAName(dini_Get(tmp,donovehicle))){
	   SendClientMessage(GetPlayerID(donovehicle), COLOR_PALHA, "Seu veÌculo foi destruÌdo, mas est· devolta pois ele estava assegurado!");
	   AcrescentarPrejuizo(3,50);
	   }
   }
   return 1;
}
public OnPlayerText(playerid,text[])
{
	fixchars(text);
	if(declaracoesabertas[playerid] == 1){
	    new tmp[256];
		format(tmp,256,"[AudiÍncia] %s",text);
		fixchars(tmp);
 		SendPlayerMessageToAll(playerid,tmp);
 		return 0;
 	}
 	if(Audiencia[playerid] == 1){
     	new tmp[256];
		format(tmp,256,"[AudiÍncia]JUIZ: %s",text);
		fixchars(tmp);
 		SendPlayerMessageToAll(playerid,tmp);
 		return 0;
 	}
	if(FazendoEmprestimo[playerid] == 1){
	    FazendoEmprestimo[playerid] = 0;
		new quantidade;
		quantidade = strval(text);
		if(quantidade > dini_Int(PlayerName(playerid),"Banco")/4){
		new string[256];
		format(string, sizeof(string),"VocÍ n„o pode emprestar tudo isto! O m·ximo que vocÍ pode È $%d",dini_Int(PlayerName(playerid),"Banco")/4);
		SendClientMessage(playerid, COLOR_RED, string);
		TogglePlayerControllable(playerid,1);
		return 0;
		}
		if(quantidade <= 0){
		SendClientMessage(playerid, COLOR_RED, "Digite um n˙mero maior que 0.");
		TogglePlayerControllable(playerid,1);
		return 0;
		}
		if(dini_Int(PlayerName(playerid),"Divida") > 0){
		SendClientMessage(playerid, COLOR_RED, "Ei, vocÍ j· fez um emprÈstimo! Pague as dividas desse antes para fazer outro.");
        TogglePlayerControllable(playerid,1);
		return 0;
		}
		if(AreaBanco[playerid] == 1){
            TogglePlayerControllable(playerid,1);
			GivePlayerMoney(playerid,quantidade);
			dini_IntSet(PlayerName(playerid),"Emprestimo",quantidade);
			dini_IntSet(PlayerName(playerid),"Divida",quantidade/2+quantidade);
			ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,0,1);
			new string[256];
			format(string, sizeof(string), "VocÍ emprestou $%d e recebeu uma dÌvida de $%d.",quantidade,quantidade/2+quantidade);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SendClientMessage(playerid, COLOR_PALHA, "Caso n„o pague, v„o vir os JUROS!");
			SendClientMessage(playerid, COLOR_PALHA, "VocÍ ter· que pagar essa grana em 15 minutos!");
			TimerDivida[playerid] = SetTimerEx("Cobrar",900000,false,"d",playerid);
			return 0;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "Ei, vocÍ n„o est· no banco!");
				return 0;
			}
	}
	if(DepositandoGrana[playerid] == 1){
        DepositandoGrana[playerid] = 0;
        new string[256];
		new quantidade;
	    quantidade = strval(text);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem todo esse dinheiro. Ou est· tentando enviar $0.");
            TogglePlayerControllable(playerid,1);
			return 0;
		}
		if(AreaBanco[playerid] == 1){
		    TogglePlayerControllable(playerid,1);
		    ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,0,1);
			format(string, sizeof(string),"Senhor %s, foram depositados $%d dÛlares em sua conta.",PlayerName(playerid), quantidade);
			SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS, string);
		    GivePlayerMoney(playerid, 0 - quantidade);
		    dini_IntSet(PlayerName(playerid),"Banco", dini_Int(PlayerName(playerid),"Banco") + quantidade);
			return 0;
		    }
		    else{
				SendClientMessage(playerid, COLOR_RED, "Ei, vocÍ n„o est· no banco!");
				return 0;
			}
	}
	if(SacandoGrana[playerid] == 1){
        SacandoGrana[playerid] = 0;
        new string[256];
		new quantidade;
	    quantidade = strval(text);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode sacar esta quantia");
	        TogglePlayerControllable(playerid,1);
			return 0;
		}
		if(quantidade > dini_Int(PlayerName(playerid),"Banco")){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem esta quantia no banco");
		    TogglePlayerControllable(playerid,1);
			return 0;
		}
	    if(AreaBanco[playerid] == 1){
	        TogglePlayerControllable(playerid,1);
	        ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,0,1);
	        GivePlayerMoney(playerid, quantidade);
	        dini_IntSet(PlayerName(playerid),"Banco", dini_Int(PlayerName(playerid),"Banco") - quantidade);
			format(string, sizeof(string), "VocÍ retirou $%d do banco. Seu saldo: $%d", quantidade, dini_Int(PlayerName(playerid),"Banco"));
			SendClientMessage(playerid, COLOR_EMERGENCIA, string);
			return 0;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "Ei, vocÍ n„o est· no banco!");
				return 0;
			}
	}
	if(ChatNotDisable[playerid] == 1){
		SendClientMessage(playerid, COLOR_RED, "Termine a histÛria para poder falar e digitar comandos!");
	    return 0;
	}
	if(EmLigacao[playerid]==1){
		new tmp[256];
		format(tmp,256,"%s [Virtual Telefonia]",text);
		fixchars(tmp);
		SendPlayerMessageToPlayer(CalledID[playerid],playerid,tmp);
		SendPlayerMessageToPlayer(playerid,playerid,tmp);
		return 0;
	}
	if(senhaatual[playerid] == 1){
	   dini_Set(PlayerName(playerid),"Senha",text);
	   SendClientMessage(playerid, COLOR_GREEN, "Senha mudada!");
       new str[256];
       format(str, sizeof(str),"Agora sua nova senha È %s",dini_Get(PlayerName(playerid),"Senha"));
       SendClientMessage(playerid, COLOR_VERDECLARO, str);
	   senhaatual[playerid] = 0;
	   return 0;
	}
	if(confirmacaosenha[playerid] == 1){
		if(strcmp(text, dini_Get(PlayerName(playerid),"Senha"), true) == 0){
		SendClientMessage(playerid, COLOR_WHITE, "Senha correta!");
		SendClientMessage(playerid, COLOR_WHITE, "Digite agora a sua nova senha no chat!");
		confirmacaosenha[playerid] = 0;
		senhaatual[playerid] = 1;
		} else {
       	SendClientMessage(playerid, COLOR_RED, "SENHA INCORRETA!");
       	SendClientMessage(playerid, COLOR_RED, "Desculpe, essa n„o È a senha certa!");
       	confirmacaosenha[playerid] = 0;
		}
		return 0;
	}
	return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	printf("OnPlayerPickUpPickup(%d,%d)",playerid,pickupid);
	new str[256];
	format(str,sizeof(str),"%d.pickup",pickupid);
	if(dini_Isset(str,"PickupDono")){
		new string[256];
		format(string,sizeof(string),"~b~Casa de:~n~~w~%s",dini_Get(str,"PickupDono"));
		GameTextForPlayer(playerid,string,3000,4);
	}
	if(pickupid == Pickup_Entrada_Corretora){
	    SetPlayerPos(playerid,278.7329,-1613.8917,97.4182);
	    DisablePlayerCheckpoint(playerid);
	    SetPlayerCheckpoint(playerid,272.3840,-1613.9673,97.4182,2.0);
	    CheckpointStatus[playerid] = CORRETORA_PROPRIEDADES;
	    StatusCheck[playerid] = NONEE;
	    DestroyPickup(pickupid);
	    Pickup_Entrada_Corretora = CreatePickup(seta,1,2861.6653,-1405.8640,11.7344);
	}
	if(pickupid == Pickup_Saida_Corretora){
	    SetPlayerPos(playerid,2867.4526,-1406.6439,11.0222);
	    DestroyPickup(pickupid);
	    Pickup_Saida_Corretora = CreatePickup(seta,1,278.6607,-1617.1837,97.4182);
	}
	if(pickupid == pickuploteria_entrada){
	    SetPlayerPos(playerid,-2161.7053,642.8295,1052.3750);
	    SetPlayerInterior(playerid,1);
		DestroyPickup(pickupid);
		pickuploteria_entrada = CreatePickup(seta,1,1735.8115,-1587.6827,13.5422);
		TextDrawShowForPlayer(playerid,tdLoteria);
		AreaLoteria[playerid] = 1;
		SendClientMessage(playerid, COLOR_RED2, "Loteria - Comandos disponÌveis:");
		SendClientMessage(playerid, COLOR_WHITE, "/loteria [1-20] [1-20] : Para comprar um bilhete de aposta!");
	}
	if(pickupid == pickuploteria_saida){
	    SetPlayerPos(playerid,1737.6434,-1588.6013,13.5431);
	    SetPlayerInterior(playerid,0);
	    DestroyPickup(pickupid);
	    pickuploteria_saida = CreatePickup(seta,1,-2158.9731,642.4365,1052.3817);
		TextDrawHideForPlayer(playerid,tdLoteria);
	    AreaLoteria[playerid] = 0;
	}
	if(pickupid == pickuptribunal){
		SetPlayerPos(playerid,246.40,110.84,1003.22);
		SetPlayerInterior(playerid,27);
		DestroyPickup(pickupid);
		pickuptribunal = CreatePickup(seta,1,243.5183,66.3445,1003.6406);
	}
	if(pickupid == Pickup_EntradaCPD){
	    SetPlayerInterior(playerid,3);
	    SetPlayerFacingAngle(playerid,90);
	    SetPlayerPos(playerid,387.9047,171.1747,1008.3828);
	    DestroyPickup(pickupid);
	    Pickup_EntradaCPD=CreatePickup(seta,2,1309.8815,-1368.6122,13.5510);
	}
	if(pickupid == Pickup_SaidaCPD){
		SetPlayerInterior(playerid,0);
		SetPlayerFacingAngle(playerid,168.6);
		SetPlayerPos(playerid,1310.0126,-1370.7745,13.5797);
	    DestroyPickup(pickupid);
	    Pickup_SaidaCPD = CreatePickup(seta,2,389.0653,173.7855,1008.3828);
	}
	if(pickupid == pickupbanco1){
	    SetPlayerInterior(playerid,0);
	    SetPlayerFacingAngle(playerid,260.9407);
	    SetPlayerPos(playerid,2306.1553,-13.2539,26.7422);
	    pickupbancoselecionada[playerid] = 1;
	    DestroyPickup(pickupid);
	    pickupbanco1 = CreatePickup(bancoi,2,1771.7144,-1655.8201,14.4236); // Banco #1
	}
	if(pickupid == pickupbanco2){
	    SetPlayerInterior(playerid,0);
	    SetPlayerFacingAngle(playerid,260.9407);
	    SetPlayerPos(playerid,2306.1553,-13.2539,26.7422);
	    pickupbancoselecionada[playerid] = 2;
	    DestroyPickup(pickupid);
	    pickupbanco2 = CreatePickup(bancoi,2,1386.0540,-1015.7602,26.6676); // Banco #2
	}
    if(pickupid == pickupbanco3){
	    SetPlayerInterior(playerid,0);
	    SetPlayerFacingAngle(playerid,260.9407);
	    SetPlayerPos(playerid,2306.1553,-13.2539,26.7422);
	    pickupbancoselecionada[playerid] = 3;
	    DestroyPickup(pickupid);
	    pickupbanco3 = CreatePickup(bancoi,2,419.7245,-1428.6298,32.4797); // Banco #3
	}
    if(pickupid == pickupbanco4){
	    SetPlayerInterior(playerid,0);
	    SetPlayerFacingAngle(playerid,260.9407);
	    SetPlayerPos(playerid,2306.1553,-13.2539,26.7422);
	    pickupbancoselecionada[playerid] = 4;
	    DestroyPickup(pickupid);
	    pickupbanco4 = CreatePickup(bancoi,2,2862.3201,-1440.2727,10.9410); // Banco #4
	}
	if(pickupid == pickupsaidabanco){
		if(pickupbancoselecionada[playerid] == 1){
			SetPlayerInterior(playerid,0);
		    SetPlayerFacingAngle(playerid,260.9407);
		    SetPlayerPos(playerid,1770.7097,-1658.8129,14.4207);
		    DestroyPickup(pickupid);
		    pickupbancoselecionada[playerid] = 0;
		    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
	 	}
	   	else if(pickupbancoselecionada[playerid] == 2){
			SetPlayerInterior(playerid,0);
		    SetPlayerFacingAngle(playerid,260.9407);
		    SetPlayerPos(playerid,1385.2159,-1017.0630,26.5754);
		    DestroyPickup(pickupid);
		    pickupbancoselecionada[playerid] = 0;
		    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
	   	}
		else if(pickupbancoselecionada[playerid] == 3){
			SetPlayerInterior(playerid,0);
		    SetPlayerFacingAngle(playerid,260.9407);
		    SetPlayerPos(playerid,419.8152,-1430.3162,32.3457);
		    DestroyPickup(pickupid);
		    pickupbancoselecionada[playerid] = 0;
		    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
	    }
	   	else if(pickupbancoselecionada[playerid] == 4){
			SetPlayerInterior(playerid,0);
	    	SetPlayerFacingAngle(playerid,260.9407);
	    	SetPlayerPos(playerid,2867.9150,-1436.2626,10.9672);
	   		DestroyPickup(pickupid);
	   		pickupbancoselecionada[playerid] = 0;
	   	    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
	    }
	}
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
	
	if(strcmp(cmd,"/imitate321",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256],plid,msg[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/imitate321 [id] [mensagem]");
		    return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/imitate321 [id] [mensagem]");
		    return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid,COLOR_RED,"ID inv·lido!");
		    return 1;
		} else {
		    if(plid < 10){
		        strmid(msg,cmdtext,14,256);
		        SendPlayerMessageToAll(plid,msg);
			}
			else if(plid > 10 && plid < 100){
				strmid(msg,cmdtext,15,256);
				SendPlayerMessageToAll(plid,msg);
			}
			else {
			    strmid(msg,cmdtext,16,256);
			    SendPlayerMessageToAll(plid,msg);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/dancar", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		new tmp[256];
		new danceid;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid,COLOR_RED,"USO: /dancar [1-3]");
			return 1;
		}
		danceid = strval(tmp);
		if(danceid < 1 || danceid > 3) {
			SendClientMessage(playerid,COLOR_RED,"USO: /dancar [1-3]");
			return 1;
		}
		if(danceid == 1) {
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
		} else if(danceid == 2) {
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
		} else if(danceid == 3) {
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
		}
		return 1;
		}
	}
 	if(strcmp(cmd, "/render", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		  SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
          return 1;
    	}
	}
	if (strcmp("/falar", cmdtext, true) == 0) {
	      ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
	}
    if (strcmp("/gunarrest", cmdtext, true) == 0) {
	      ApplyAnimation( playerid,"ped", "ARRESTgun", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "You are arresting someone with your gun");
		  return 1;
    }
    if (strcmp("/lay", cmdtext, true) == 0) {
          ApplyAnimation(playerid,"BEACH", "bather", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "You are laying down");
		  return 1;
    }
    if (strcmp("/cover", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "ped", "cower", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "You are taking cover");
		  return 1;
	}
	if (strcmp("/punheta", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "PAULNMAC", "wank_in", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Huhu!");
		  return 1;
	}
    if (strcmp("/beijar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Que coisa hein!? hehe");
		  return 1;
	}
    if (strcmp("/crack", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "T· duendo? Manera...");
		  return 1;
	}
	if (strcmp("/fumar2", cmdtext, true, 4) == 0) {
          ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Cuidado com os narcÛticos! Aiaiaiaiai hein...");
		  return 1;
	}
    if (strcmp("/mijar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "PAULNMAC", "Piss_in", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Mijando em praÁa p˙blica? Olha os cops!!");
		  return 1;
	}
	if (strcmp("/vomitar", cmdtext, true) == 0) {
	      ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
	      SendClientMessage(playerid, 0xFF0000FF, "Eca! Que nojo... O que andou comendo?");
		  return 1;
	}
    if (strcmp("/sentar", cmdtext, true) == 0) {
          ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 1, 1, 1, 1);
          SendClientMessage(playerid, 0xFF0000FF, "Sentado.");
		  return 1;
    }
    if (strcmp("/fu", cmdtext, true) == 0) {
	      ApplyAnimation( playerid,"ped", "fucku", 4.1, 0, 1, 1, 1, 1 );
          SendClientMessage(playerid, 0xFF0000FF, "Fode esse cara mesmo! V· para a *QP");
		  return 1;
    }
	if(strcmp("/esconder-se",cmdtext,true)==0 && Escondido[playerid]==0){
	    ClearAnimations(playerid);
	    ApplyAnimation(playerid,"DODGE","Cover_Dive_01"	,4.1,0,1,1,1,1);
		for(new i; i<MAX_PLAYERS; i++){
		    ShowPlayerNameTagForPlayer(playerid,i,0);
		}
		Escondido[playerid] = 1;
		SendClientMessage(playerid,COLOR_GREEN,"Hum, ninguÈm est· te vendo agora!");
		return 1;
	}
	if(strcmp("/aparecer",cmdtext,true)==0 && Escondido[playerid]==1){
	    ClearAnimations(playerid);
		for(new i; i<MAX_PLAYERS; i++){
		    ShowPlayerNameTagForPlayer(playerid,i,1);
		}
		Escondido[playerid] = 1;
		SendClientMessage(playerid,COLOR_GREEN,"Hum, est„o te vendo agora!");
		return 1;
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
				    dini_IntSet(PlayerName(playerid),"Preso", 0);
				    Presos[plid] = 0;
				    SetSpawnInfo(plid,0,dini_Int(PlayerName(plid),"Skin"),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				    SpawnPlayer(plid);
				    format(string, sizeof(string), "%s conseguiu a chave da cadeia, e fez vocÍ fugir!",PlayerName(playerid));
   			        SendClientMessage(plid, COLOR_RED2, string);
				    SendClientMessage(playerid,COLOR_GREEN,"Fuga concedida!");
				    Contrabando[playerid] = 0;
					Receita[playerid] = 0;
					SetPlayerWantedLevel(plid, 0);
					dini_IntSet(PlayerName(plid),"Wanted", 0);
					Chave[playerid] = 0;
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		}

//PESCADOR

	if(strcmp(cmd, "/iscas", true) == 0) {
		new tmp[256];
		new quant;
		tmp = strtok(cmdtext,idx);
		quant = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /iscas [quantia/de/iscas]");
			return 1;
		}
		if(QtIscas[playerid] == 20){
			SendClientMessage(playerid, COLOR_RED, "VocÍ j· possue o m·ximo de iscas!");
			return 1;
		}
		if(quant+QtIscas[playerid] > 20){
			SendClientMessage(playerid, COLOR_RED, "VocÍ sÛ pode levar 20 iscas no m·ximo!");
			return 1;
		}
		if(quant <= 0){
			SendClientMessage(playerid, COLOR_RED, "Ei, a quantidade È de 1 ‡ 20");
			return 1;
		}
		if(AreaCoopPesca[playerid] == 0){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na cooperativa de pesca!");
			return 1;
		} else {
			  if(Profissao[playerid] == PESCADOR || IsPlayerAdmin(playerid)){
			  	SendClientMessage(playerid, COLOR_PESCADOR, "VocÍ n„o precisou pagar as iscas pois È Pescador!");
			  	new string[256];
			  	format(string,sizeof(string), "VocÍ pegou %d iscas! Total de iscas que vocÍ possue: %d",quant,quant+QtIscas[playerid]);
			  	SendClientMessage(playerid, COLOR_PESCADOR, string);
			  	QtIscas[playerid] = QtIscas[playerid]+quant;
			  	dini_IntSet(PlayerName(playerid),"Iscas",QtIscas[playerid]);
			  	return 1;
			  } else {
			        new custo;
			        custo = quant*10;
			        if(GetPlayerMoney(playerid) < custo){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro para pagar as iscas!");
					return 1;
					} else {
						  new string[256];
						  format(string,sizeof(string),"VocÍ comprou %d iscas por $%d. Agora vocÍ possue %d iscas!",quant,QtIscas[playerid]+quant);
						  SendClientMessage(playerid, COLOR_PESCADOR, string);
						  GivePlayerMoney(playerid,-custo);
						  QtIscas[playerid] = QtIscas[playerid]+quant;
						  dini_IntSet(PlayerName(playerid),"Iscas",QtIscas[playerid]);
						  return 1;
			  		}
			  }
		}
	}
	if(strcmp(cmd, "/venderpesca", true) == 0) {
	    new msg[256];
	    if(AreaCoopPesca[playerid] == 1){
	    	if(QtPescas[playerid] == 0){
	        	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem nenhuma pesca, como poder· vender?");
	        	format(msg,sizeof(msg),"%s usou o comando /venderpesca sem nenhuma pesca acumulada.",PlayerName(playerid));
	        	writelog(msg);
	        	return 1;
			} else {
		    	if(Profissao[playerid] == PESCADOR) {
		    	    new valor;
		    	    valor = minrand(10,45);
		   			new amount = QtPescas[playerid] * valor;
					format(msg,sizeof(msg),"VocÍ vendeu %d pesca(s) por $%d cada e faturou $%d com a venda.",QtPescas[playerid],valor,amount);
					SendClientMessage(playerid, COLOR_PESCADOR, msg);
					GivePlayerMoney(playerid,amount);
					QtPescas[playerid] = 0;
					dini_IntSet(PlayerName(playerid),"Pesca",0);
					AcrescentarExPoints(playerid,1);
					return 1;
				}
				else {
		    	    new valor;
		    	    valor = minrand(5,20);
		    	    new amount = floatround((QtPescas[playerid] * valor));
					format(msg,sizeof(msg),"VocÍ vendeu %d pesca(s) por $%d cada e faturou $%d com a venda.",QtPescas[playerid],valor,amount);
					SendClientMessage(playerid, COLOR_PESCADOR, msg);
					GivePlayerMoney(playerid,amount);
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
	
	if(strcmp(cmd, "/carga", true) == 0) {
	    if(Profissao[playerid] == CAMINHONEIRO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new CarG[4];
			new plid;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED2, "/carga [id]");
				return 1;
			}
			plid = strval(tmp);
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 515 || modelo == 414){
				if(IsPlayerConnected(plid)){
				    CarG[0] = GeralCar[playerid];
				    CarG[1] = GasCar[playerid];
				    CarG[2] = DrogasNoCaminhao[playerid];
		            CarG[3] = CarregamentoRoupas[playerid];
					if(CarG[0] == 1){
					    SendClientMessage(plid, COLOR_GREEN, "O Caminhoneiro est· transportando Mantimentos em Geral.");
					}
					if(CarG[1] == 1){
					    SendClientMessage(plid, COLOR_GREEN, "O Caminhoneiro est· transportado CombustÌvel.");
					}
					if(CarG[2] == 1){
					    SendClientMessage(plid, COLOR_RED2, "ATEN«√O!! Esse caminhoneiro est· transportando mercadoria ILEGAL (drogas).");
					    SendClientMessage(plid, COLOR_RED2, "PeÁa para ele descer do veÌculo e digitar /render, feito isso PRENDA-O.");
					}
					if(CarG[3] == 1){
					    SendClientMessage(plid, COLOR_GREEN, "O Caminhoneiro est· transportado Roupas.");
					}
					else if(CarG[0] || CarG[1] || CarG[2] || CarG[3] == 0){
					    SendClientMessage(plid, COLOR_GREEN, "O Caminhoneiro n„o est· transportando nenhum tipo de mercadoria.");
					}
					format(string, sizeof(string), "A DocumentaÁ„o da Carga foi mostrada para %s.", PlayerName(plid));
					SendClientMessage(playerid, COLOR_AZULPLUS, string);
					return 1;
				} else{
				    SendClientMessage(playerid, COLOR_RED2, "Esse jogador nao existe!");
				    return 1;
				}
			} else {
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em 1 RoadTrain da Companhia.");
			    return 1;
			}
		}
	}
	if(strcmp(cmd, "/carregar", true) == 0) {
	    if(Profissao[playerid] == CAMINHONEIRO || IsPlayerAdmin(playerid)){
	        if(AreaCarga[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == 515 || modelo == 414){
				    if(Carregamento[playerid] == 0){
						if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)) || modelo == 414){
	       					ShowMenuForPlayer(CargaGeral,playerid);
				       		TogglePlayerControllable(playerid,0);
							return 1;
 						} else {
				        	SendClientMessage(playerid,COLOR_CAMINHONEIRO,"Seu caminh„o n„o tem Trailer!");
							return 1;
						}
					} else {
			        	SendClientMessage(playerid,COLOR_CAMINHONEIRO,"Seu caminh„o j· est· carregado!");
						return 1;
					}
				} else {
			    	SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um caminh„o ROADTRAIN ou MULE!");
					return 1;
				}
	  		} else {
	        	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na ·rea de carga!");
				return 1;
			}
    	}else{
        	SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
    		return 1;
		}
	}

//PEDREIRA
	if(strcmp(cmd, "/carregarcaminhao", true) == 0) {
	    if(Profissao[playerid] == PEDREIRA || IsPlayerAdmin(playerid)){
	        if(PedreiraCarga[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == 406){
				    if(Pedras[playerid] == 0){
				    	SendClientMessage(playerid,COLOR_PEDREIRA,"VeÌculo carregado!");
				    	SendClientMessage(playerid,COLOR_PEDREIRA,"Para descarreg·-lo, v· atÈ a obra de SF!");
				    	Pedras[playerid] = 1;
				    	SetPlayerCheckpoint(playerid,-2060.0562,278.3264,35.5171,3.0);
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
					new porc;
					new string[256];
				    porc = minrand(150,700);
				    Pedras[playerid] = 0;
				    format(string, sizeof(string), "VocÍ ganhou $%s com o frete!", porc);
					SendClientMessage(playerid,COLOR_PEDREIRA, string);
				    GivePlayerMoney(playerid,porc);
				    DisablePlayerCheckpoint(playerid);
				    AcrescentarExPoints(playerid,1);
    				return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· na ·rea de carga");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
	        format(msg,sizeof(msg),"%d usou o comando /descarregarcaminhao sem ser caminhoneiro.",PlayerName(playerid));
	        writelog(msg);
			return 1;
		}
	}

	if(strcmp(cmd, "/pegardroga", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == LIDER_DE_TRAFICO || IsPlayerAdmin(playerid)){
			SetPlayerCheckpoint(playerid,2258.3687,-1030.6180,52.6575,3.0);
			SendClientMessage(playerid, COLOR_TRAFICANTE,"V· para o CP marcado no radar para pegar as drogas.");
			PegandoDrogas[playerid] = 1;
			StatusCheck[playerid] = NONEE;
			return 1;
		} else {
			SendClientMessage(playerid,COLOR_RED2,"VocÍ n„o È traficante!");
			return 1;
		}
	}
	if(strcmp(cmd, "/pararplantacao", true) == 0) {
	   if(PlantandoDrogas[playerid] == 0){
		  SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· plantando drogas em um veÌculo!");
		  return 1;
		  }
		  else{
			  PlantandoDrogas[playerid] = 0;
			  SendClientMessage(playerid, COLOR_LIDER_DE_TRAFICO, "PlantaÁ„o de drogas cancelada!");
			  TogglePlayerControllable(playerid,1);
			  RemovePlayerFromVehicle(playerid);
			  KillTimer(TempoPlantacao[playerid]);
			  return 1;
		  }
	}
	if(strcmp(cmd, "/plantardrogas", true) == 0) {
	    if(Profissao[playerid] == LIDER_DE_TRAFICO || IsPlayerAdmin(playerid)){
            if(HeroinaMao[playerid] < 1){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem Heroina, v· para a Boca pegar mais.");
				return 1;
			}
			if(CocainaMao[playerid] < 1){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem CocaÌna, v· para a Boca pegar mais.");
				return 1;
			}
			if(MaconhaMao[playerid] < 1){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem Maconha, v· para a Boca pegar mais.");
				return 1;
			}
			if(PlantandoDrogas[playerid] == 1){
				SendClientMessage(playerid, COLOR_RED, "Ei, vocÍ j· est· plantando drogas, plante essas primeiro!");
				return 1;
			}
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
				TogglePlayerControllable(playerid,0);
				PlantandoDrogas[playerid] = 1;
				SendClientMessage(playerid, COLOR_LIDER_DE_TRAFICO, "Ok... VocÍ est· plantando as drogas! Cuidado se algum narcÛtico te pegar");
				SendClientMessage(playerid, COLOR_LIDER_DE_TRAFICO, "vocÍ ser· preso e n„o ir· conseguir terminar de plantar essas drogas!");
				TempoPlantacao[playerid] = SetTimerEx("DrogasPlant",45000,false,"d",playerid);
				return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar dirigindo um veÌculo!");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È LÌder de Tr·fico!");
				return 1;
				}
	}
	if(strcmp(cmd, "/heroina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == LIDER_DE_TRAFICO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new string[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COLOR_RED,"/heroina [id] [quantidade]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/heroina [id] [quantidade]");
				return 1;
			}
			mili = strval(tmp);
			if(mili > 3){
			    SendClientMessage(playerid, COLOR_RED2, "VocÍ est· louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED2, "Doses de 1 ‡ 3");
				return 1;
			}
			if(Profissao[plid] == TRAFICANTE){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender para traficantes.");
				return 1;
			}
			if(HeroinaMao[playerid] < 1){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem Heroina, v· para a Boca pegar mais.");
				return 1;
			}
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		       	SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
		    if(IsPlayerConnected(plid)){
			   	Heroina[plid] = mili;
			   	SendClientMessage(playerid,COLOR_TRAFICANTE, "Droga Vendida!");
		        AddPlayerHealth(plid,100);
				format(string,sizeof(string), "O Traficante %s lhe vendeu a droga para vocÍ ter efeito vocÍ tem que injetar. /injetar.", PlayerName(playerid));
				SendClientMessage(plid, COLOR_WHITE, string);
				GivePlayerMoney(playerid, 300);
			   	GivePlayerMoney(plid, -350);
			   	AcrescentarExPoints(playerid,1);
			   	ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
			   	HeroinaMao[playerid] = HeroinaMao[playerid] - 1;
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}
	if(strcmp(cmd, "/maconha", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == LIDER_DE_TRAFICO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new string[256];
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
			if(mili > 3){
			    SendClientMessage(playerid, COLOR_RED2, "VocÍ est· louco? Quer matar o seu cliente? Doses de 1 a 3");
				return 1;
			}
			if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED2, "Doses de 1 ‡ 3");
				return 1;
			}
			if(Profissao[plid] == TRAFICANTE){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender para traficantes.");
				return 1;
			}
			if(MaconhaMao[playerid] < 1){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem Maconha, v· para a Boca pegar mais.");
				return 1;
			}
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		       	SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
		    if(IsPlayerConnected(plid)){
		    	Maconha[plid] = mili;
		    	SendClientMessage(playerid,COLOR_TRAFICANTE, "Bagulho vendido!");
		        AddPlayerHealth(plid,100);
				format(string,sizeof(string), "O Traficante %s lhe vendeu os bagulho pra vocÍ ter efeito tem que fumar. /fumar.", PlayerName(playerid));
				SendClientMessage(plid, COLOR_WHITE, string);
		    	AcrescentarExPoints(playerid,1);
   		   	   	GivePlayerMoney(playerid, 100);
			   	GivePlayerMoney(plid, -150);
			   	ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
			   	MaconhaMao[playerid] = MaconhaMao[playerid] - 1;
				return 1;
			}
		} else {
		SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
		return 1;
		}
	}
	
	if(strcmp(cmd, "/cocaina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == LIDER_DE_TRAFICO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new string[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COLOR_RED,"/cocaina [id] [quantidade]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/cocaina [id] [quantidade]");
				return 1;
			}
			mili = strval(tmp);
			if(mili > 3){
			    SendClientMessage(playerid, COLOR_RED2, "VocÍ est· louco? Quer matar o seu cliente? Doses de 1 a 3");
				return 1;
			}
			if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED2, "Doses de 1 ‡ 3");
				return 1;
			}
			if(Profissao[plid] == TRAFICANTE){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender para traficantes.");
				return 1;
			}
			if(CocainaMao[playerid] < 1){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem CocaÌna, v· para a Boca pegar mais.");
				return 1;
			}
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		       	SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
		 	if(IsPlayerConnected(plid)){
		    	Cocaina[plid] = mili;
		    	SendClientMessage(playerid,COLOR_TRAFICANTE, "PÛ vendido!");
		        AddPlayerHealth(plid,100);
				format(string,sizeof(string), "O Traficante %s lhe vendeu o pÛ pra vocÍ ter efeito vocÍ tem que cheirar. /cheirar.", PlayerName(playerid));
				SendClientMessage(plid, COLOR_WHITE, string);
				AcrescentarExPoints(playerid,1);
			   	GivePlayerMoney(playerid, 300);
			   	GivePlayerMoney(plid, -250);
			   	ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
			   	CocainaMao[playerid] = CocainaMao[playerid] - 1;
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o para isso!");
			return 1;
		}
	}

	if(strcmp(cmd, "/meubolso", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == LIDER_DE_TRAFICO || IsPlayerAdmin(playerid)){
	        new msg[256];
		    format(msg, sizeof(msg), "Maconha : %d papelotes",MaconhaMao[playerid]);
		    SendClientMessage(playerid,COLOR_TRAFICANTE,msg);
   		    format(msg, sizeof(msg), "Heroina : %d papelotes",HeroinaMao[playerid]);
		    SendClientMessage(playerid,COLOR_TRAFICANTE,msg);
		    format(msg, sizeof(msg), "CocaÌna : %d papelotes",CocainaMao[playerid]);
		    SendClientMessage(playerid,COLOR_TRAFICANTE,msg);
			return 1;
		} else {
			SendClientMessage(playerid,COLOR_RED2,"VocÍ n„o È Traficante!");
			return 1;
		}
	}
	if(strcmp(cmd, "/injetar", true) == 0) {
	    new msg[256];
	    new tmp[256];
	    new quantia;
	    tmp = strtok(cmdtext, idx);
     	if(!strlen(tmp)){
      		SendClientMessage(playerid, COLOR_RED2,"/injetar [injeÁıes]");
			return 1;
		}
		quantia = strval(tmp);
		if(quantia > Heroina[playerid]){
		    SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem toda essa quantidade de heroÌna.");
			return 1;
		}
    	if(Heroina[playerid] == 0){
	       	SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o possue heroÌna, como poder· injetar?!");
	       	return 1;
		} else {
		    Heroina[playerid] = Heroina[playerid] - quantia;
		    QtHeroina[playerid] = QtHeroina[playerid]+quantia;
		    dini_IntSet(PlayerName(playerid),"DosesHeroina",QtHeroina[playerid]);
		    ApplyAnimation(playerid,"CRACK","crckdeth4",4.1, 1, 1, 1, 1, 1);
			format(msg,sizeof(msg),"VocÍ tomou %d injeÁıes de heroÌna.",quantia);
			SendClientMessage(playerid, COLOR_GREEN, msg);
			return 1;
		}
	}

	if(strcmp(cmd, "/fumar", true) == 0) {
	    new msg[256];
	    new tmp[256];
	    new quantia;
	    tmp = strtok(cmdtext, idx);
     	if(!strlen(tmp)){
      		SendClientMessage(playerid, COLOR_RED2,"/fumar [cigarros]");
			return 1;
		}
		quantia = strval(tmp);
		if(quantia > Maconha[playerid]){
		    SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem toda essa quantidade de maconha.");
			return 1;
		}
    	if(Maconha[playerid] == 0){
	       	SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem maconha, como poder· cheirar?");
	       	return 1;
		} else {
		    Maconha[playerid] = Maconha[playerid] - quantia;
		    QtMaconha[playerid] = QtMaconha[playerid]+quantia;
		    dini_IntSet(PlayerName(playerid),"DosesMaconha",QtMaconha[playerid]);
		    ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 1, 1, 1, 1);
			format(msg,sizeof(msg),"VocÍ fumou %d cigarro(s) de maconha.",quantia);
			SendClientMessage(playerid, COLOR_GREEN, msg);
			return 1;
		}
	}

	if(strcmp(cmd, "/cheirar", true) == 0) {
	    new msg[256];
	    new tmp[256];
	    new quantia;
	    tmp = strtok(cmdtext, idx);
     	if(!strlen(tmp)){
      		SendClientMessage(playerid, COLOR_RED2,"/cheirar [gramas]");
			return 1;
		}
		quantia = strval(tmp);
		if(quantia > Cocaina[playerid]){
		    SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem toda essa quantidade de cocaÌna.");
			return 1;
		}
    	if(Cocaina[playerid] == 0){
	       	SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem cocaÌna, como poder· cheirar?");
	       	return 1;
		} else {
		    Cocaina[playerid] = Cocaina[playerid] - quantia;
		    QtCocaina[playerid] = QtCocaina[playerid]+quantia;
		    dini_IntSet(PlayerName(playerid),"DosesCocaina",QtCocaina[playerid]);
		   	ApplyAnimation(playerid,"CRACK", "crckdeth1", 4.0, 1, 1, 1, 1, 1);
			format(msg,sizeof(msg),"VocÍ cheirou %d grama(s) de cocaina.",quantia);
			SendClientMessage(playerid, COLOR_GREEN, msg);
			return 1;
		}
	}
	
    if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	if (dini_Exists(PlayerName(playerid))){
			SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· registrado.");
			return 1;
		}
    	if(PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· registrado e logado no jogo");
			return 1;
		}
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Sintaxe incorreta! USO: /registrar [senha]");
			return 1;
		}
    	else{
    	    TrancarVeiculoPorProf(playerid);
    	    PLAYERLIST_authed[playerid] = 1;
			dini_Create(PlayerName(playerid));
			dini_Set(PlayerName(playerid),"Senha",tmp);
			dini_IntSet(PlayerName(playerid),"Casa",0);
			dini_IntSet(PlayerName(playerid),"ValorCasa",0);
			dini_IntSet(PlayerName(playerid),"HistoriaFeita",0);
			dini_IntSet(PlayerName(playerid),"Wanted",0);
			dini_IntSet(PlayerName(playerid),"Preso",0);
			dini_IntSet(PlayerName(playerid),"Passaporte",0);
			dini_IntSet(PlayerName(playerid),"Prof",1);
			dini_IntSet(PlayerName(playerid),"Dinheiro",0);
			dini_IntSet(PlayerName(playerid),"XL",0);
			dini_IntSet(PlayerName(playerid),"Agenda",0);
			dini_IntSet(PlayerName(playerid),"PhoneNumb",0);
			dini_IntSet(PlayerName(playerid),"Porte",0);
			dini_IntSet(PlayerName(playerid),"Banco",5000);
			dini_IntSet(PlayerName(playerid),"Phone",0);
			dini_IntSet(PlayerName(playerid),"CreditosCell",0);
			dini_IntSet(PlayerName(playerid),"HabNautica",0);
			dini_IntSet(PlayerName(playerid),"HabAerea",0);
			dini_IntSet(PlayerName(playerid),"HabTerrestre",0);
			dini_IntSet(PlayerName(playerid),"Multa",0);
			dini_IntSet(PlayerName(playerid),"Divida",0);
			dini_IntSet(PlayerName(playerid),"Pesca",0);
			dini_IntSet(PlayerName(playerid),"Latas",0);
			dini_IntSet(PlayerName(playerid),"LatasNecessarias",0);
			dini_IntSet(PlayerName(playerid),"Doenca",0);
			dini_IntSet(PlayerName(playerid),"Emprestimo",0);
			dini_IntSet(PlayerName(playerid),"Seguro",0);
			dini_IntSet(PlayerName(playerid),"NSegurancas",0);
			dini_IntSet(PlayerName(playerid),"JaContratado",0);
			dini_IntSet(PlayerName(playerid),"NM",0);
			dini_IntSet(PlayerName(playerid),"ExPoints",0);
			dini_IntSet(PlayerName(playerid),"Iscas",0);
			dini_IntSet(PlayerName(playerid),"DosesMaconha",0);
			dini_IntSet(PlayerName(playerid),"DosesHeroina",0);
			dini_IntSet(PlayerName(playerid),"DosesCocaina",0);
			dini_IntSet(PlayerName(playerid),"Alcool",0);
			dini_IntSet(PlayerName(playerid),"WeaponSlot0",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot0Ammo",0);
			dini_IntSet(PlayerName(playerid),"WeaponSlot1",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot1Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot2",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot2Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot3",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot3Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot4",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot4Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot5",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot5Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot6",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot6Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot7",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot7Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot8",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot8Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot9",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot9Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot10",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot10Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot11",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot11Ammo",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot12",0);
	        dini_IntSet(PlayerName(playerid),"WeaponSlot12Ammo",0);
			Profissao[playerid] = 1;
			ChatNotDisable[playerid] = 1;
			TextDrawHideForPlayer(playerid,Bemvindo);
			new hs = minrand(0,3)+1;
			if(hs == 1){
				new Float:X = -2174.9314;
				new Float:Y = 665.1288;
				new Float:Z = 50.4694;
				new Float:ang = 318.7636;
				dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
				dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
				dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
				dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
				dini_IntSet(PlayerName(playerid),"Skin",23);
				SetPlayerSkin(playerid,23);
				SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), -2174.9314, 665.1288, 50.4694, 318.7636, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
				dini_IntSet(PlayerName(playerid),"HistoriaSelecionada",1);
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				new string[256];
				format(string, sizeof(string),"VocÍ acabou de se registrar, sua senha È '%s' e seu nickname È %s.", tmp, PlayerName(playerid));
				SendClientMessage(playerid, COLOR_PALHA,string);
				SendClientMessage(playerid, COLOR_YELLOW, "Complete a miss„o para poder falar e digitar comandos");
				SendClientMessage(playerid, COLOR_RED2, "Mano, v· na porta pegar a droga dos TRIADS.");
            	SetPlayerCheckpoint(playerid,-2172.9651,679.7962,55.1627,2.5);
            	StatusCheck[playerid] = NOSTRIADS;
				RegisterPlayer[playerid] = 1;
				return 1;
			}
			else if(hs == 2){
                new Float:X = 1886.6064;
				new Float:Y = 2070.8767;
				new Float:Z = 11.0625;
				new Float:ang = 268.3935;
				dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
				dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
				dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
				dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
				dini_IntSet(PlayerName(playerid),"Skin",186);
				SetPlayerSkin(playerid,186);
				SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), 1886.6064, 2070.8767, 11.0625, 268.3935, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
				dini_IntSet(PlayerName(playerid),"HistoriaSelecionada",2);
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
            	new string[256];
				format(string, sizeof(string),"VocÍ acabou de se registrar, sua senha È '%s' e seu nickname È %s.", tmp, PlayerName(playerid));
				SendClientMessage(playerid, COLOR_PALHA,string);
				SendClientMessage(playerid, COLOR_YELLOW, "Complete a miss„o para poder falar e digitar comandos");
				SendClientMessage(playerid, COLOR_WHITE, "Ahhh... como sempre a mesma cidade chata!");
				SetTimerEx("Conversa21",3000,false,"d",playerid);
				return 1;
			}
			else if(hs == 3){
                new Float:X = -1736.4148;
				new Float:Y = -2491.3481;
				new Float:Z = 12.2241;
				new Float:ang = 68.5290;
				dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
				dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
				dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
				dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
				dini_IntSet(PlayerName(playerid),"Skin",252);
				SetPlayerSkin(playerid,252);
				SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), -1736.4148, -2491.3481, 12.2241, 68.5290, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
				dini_IntSet(PlayerName(playerid),"HistoriaSelecionada",3);
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
				SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
            	new string[256];
				format(string, sizeof(string),"VocÍ acabou de se registrar, sua senha È '%s' e seu nickname È %s.", tmp, PlayerName(playerid));
				SendClientMessage(playerid, COLOR_PALHA,string);
				SendClientMessage(playerid, COLOR_YELLOW, "Complete a miss„o para poder falar e digitar comandos");
				SendClientMessage(playerid, COLOR_WHITE, "Os sequestradores te deixaram aqui, e est„o mandando vocÍ ir deixar esse pacote em San Fierro.");
				SendClientMessage(playerid, COLOR_RED, "Na cidade tem carros, vocÍ pode pegar ou chamar um taxi.");
				SetPlayerCheckpoint(playerid,-2026.9244,122.6370,28.9294,2.5);
            	StatusCheck[playerid] = ENTREGASF;
				return 1;
			}
		}
 	}
 	
	if(strcmp(cmd, "/logar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    if (!dini_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· registrado. Entre com /registrar [senha]");
			return 1;
		}
	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· logado.");
			return 1;
		}
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "VocÍ tem uma senha. USO: /logar [senha]");
			return 1;
		}
		if(strlen(tmp) != strlen(dini_Get(PlayerName(playerid),"Senha"))){
			SendClientMessage(playerid, COLOR_RED, "Sua senha est· incorreta, por favor mensione a senha correta para loga-se.");
			new str[256];
			format(str,sizeof(str),"%s digitou uma senha incorreta! A senha certa era %s mas ele digitou %s",PlayerName(playerid),dini_Get(PlayerName(playerid),"Senha"),tmp);
			writelog(str);
			writelog("Compare as duas senhas veja se elas s„o parecidas, caso n„o sejam pode ser um FAKE.");
			return 1;
		}
		if(dini_Int(PlayerName(playerid),"HistoriaFeita") == 0){
			if(dini_Int(PlayerName(playerid),"HistoriaSelecionada") == 1){
            new Float:X = -2174.9314;
			new Float:Y = 665.1288;
			new Float:Z = 50.4694;
			new Float:ang = 318.7636;
			dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
			dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
			dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
			dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
			SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), -2174.9314, 665.1288, 50.4694, 318.7636, 0, 0, 0, 0, 0, 0);
			LogarPlayer(playerid);
			PLAYERLIST_authed[playerid] = 1;
            ChatNotDisable[playerid] = 1;
            CellCredits[playerid] = dini_Int(PlayerName(playerid),"CreditosCell");
			TextDrawHideForPlayer(playerid,Bemvindo);
			TrancarVeiculoPorProf(playerid);
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_YELLOW, "Complete a miss„o para poder falar e digitar comandos");
			SendClientMessage(playerid, COLOR_RED2, "Mano, v· na porta pegar a droga dos TRIADS.");
            SetPlayerCheckpoint(playerid,-2172.9651,679.7962,55.1627,2.5);
            StatusCheck[playerid] = NOSTRIADS;
            }
            else if(dini_Int(PlayerName(playerid),"HistoriaSelecionada") == 2){
            new Float:X = 1886.6064;
			new Float:Y = 2070.8767;
			new Float:Z = 11.0625;
			new Float:ang = 268.3935;
			dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
			dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
			dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
			dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
			SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), 1886.6064, 2070.8767, 11.0625, 268.3935, 0, 0, 0, 0, 0, 0);
			LogarPlayer(playerid);
			PLAYERLIST_authed[playerid] = 1;
            ChatNotDisable[playerid] = 1;
            CellCredits[playerid] = dini_Int(PlayerName(playerid),"CreditosCell");
			TextDrawHideForPlayer(playerid,Bemvindo);
			TrancarVeiculoPorProf(playerid);
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_YELLOW, "Complete a miss„o para poder falar e digitar comandos");
			SendClientMessage(playerid, COLOR_WHITE, "Ahhh... como sempre a mesma cidade chata!");
			SetTimerEx("Conversa21",3000,false,"d",playerid);
            }
            else if(dini_Int(PlayerName(playerid),"HistoriaSelecionada") == 3){
		    new Float:X = -1736.4148;
			new Float:Y = -2491.3481;
			new Float:Z = 12.2241;
			new Float:ang = 68.5290;
			dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
			dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
			dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
			dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
			dini_IntSet(PlayerName(playerid),"Skin",252);
			SetPlayerSkin(playerid,252);
			SetSpawnInfo(playerid, 1, dini_Int(PlayerName(playerid),"Skin"), -1736.4148, -2491.3481, 12.2241, 68.5290, 0, 0, 0, 0, 0, 0);
            LogarPlayer(playerid);
			PLAYERLIST_authed[playerid] = 1;
           	ChatNotDisable[playerid] = 1;
           	CellCredits[playerid] = dini_Int(PlayerName(playerid),"CreditosCell");
           	TextDrawHideForPlayer(playerid,Bemvindo);
           	TrancarVeiculoPorProf(playerid);
           	SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_DESEMPREGADO," ");
			SendClientMessage(playerid, COLOR_YELLOW, "Complete a miss„o para poder falar e digitar comandos");
			SendClientMessage(playerid, COLOR_WHITE, "Os sequestradores te deixaram aqui, leve o pacote q eles mandaram atÈ San Fierro.");
			SendClientMessage(playerid, COLOR_RED, "Na cidade tem carros, vocÍ pode pegar ou chamar 1 taxi.");
			SetPlayerCheckpoint(playerid,-2026.9244,122.6370,28.9294,2.5);
           	StatusCheck[playerid] = ENTREGASF;
			}
			else{
                new hs = minrand(0,2)+1;
                dini_IntSet(PlayerName(playerid),"HistoriaSelecionada",hs);
                SendClientMessage(playerid, COLOR_RED, "Logue-se novamente pois sua histÛria n„o foi identifacada!");
                SendClientMessage(playerid, COLOR_RED, "Devido a isso agora foi sorteado a sua nova histÛria!");
                }
		}
	    else{
			PLAYERLIST_authed[playerid] = 1;
			LogarPlayer(playerid);
			CellCredits[playerid] = dini_Int(PlayerName(playerid),"CreditosCell");
			TextDrawHideForPlayer(playerid,Bemvindo);
			ChatNotDisable[playerid] = 0;
			StatusCheck[playerid] = NONEE;
			PlayerPlaySound(playerid, 1186, 0.0,0.0,0.0);
			SendClientMessage(playerid, COLOR_WHITE, "Continue sua vida...");
			new msg[256];
			format(msg,sizeof(msg),"O jogador %s acabou de se logar.",PlayerName(playerid));
			writelog(msg);
			printf("O jogador %s (ID %d) acabou de se logar",PlayerName(playerid),playerid);
			TrancarVeiculoPorProf(playerid);
			if(dini_Int(PlayerName(playerid),"Divida") > 0){
		    TimerDivida[playerid] = SetTimerEx("Cobrar",900000,false,"d",playerid);
		    SendClientMessage(playerid, COLOR_RED, "A divida de seu emprÈstimo continua!");
		    return 1;
		    }
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
			    SendClientMessage(playerid, COLOR_RED, "USO: /logarplayer [id]");
			    return 1;
			}
			plid = strval(tmp);
		    if(IsPlayerConnected(plid) == 0){
				SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/ID inv·lido");
				return 1;
			}
			else {
				LogarPlayer(plid);
				SendClientMessage(playerid,COLOR_GREEN,"Feito");
				return 1;
			}
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È admin, portanto, n„o tem permiss„o para fazer isso.");
			return 1;
		}
	}

	if(strcmp(cmd, "/mudarsenha", true) == 0) {
	   SendClientMessage(playerid, COLOR_AZULPLUS, "Ok digite a sua senha atual no chat!");
	   SendClientMessage(playerid, COLOR_RED, "N„o se preocupe ela n„o ser· revelada!");
	   confirmacaosenha[playerid] = 1;
	   return 1;
	}
    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COLOR_YELLOW,"Aqui est„o ");
    	SendClientMessage(playerid, COLOR_WHITE, "/comandos /comandos2 /comandos3 /comandos4 /comandos5: Comandos desse gamemode");
        SendClientMessage(playerid, COLOR_WHITE, "/registrar [senha] : Registrar-se");
        SendClientMessage(playerid, COLOR_WHITE, "/logar [senha] : Logar-se");
        SendClientMessage(playerid, COLOR_WHITE, "/aprender : Mostra uma breve explicaÁ„o sobre o RPG.");
        SendClientMessage(playerid, COLOR_WHITE, "ATEN«√O: profissıes s„o por experiÍncia, ter· que ir no -sine- para mais info /level.");
        SendClientMessage(playerid, COLOR_WHITE, "/profs /profs2 /profs3 /profs4 /profs5 vÍ as profissıes deste RPG Mode");
        SendClientMessage(playerid, COLOR_WHITE, "Ajuda com o celular? digite /celularinfo para mais informaÁıes.");
		SendClientMessage(playerid, COLOR_WHITE, "/creditos : VÍ os creditos do RPG Mode");
		SendClientMessage(playerid, COLOR_YELLOW,"Reload Virtual Life RpG mais que um RPG, UMA VIDA!");
		return 1;
	}
    if(strcmp(cmd, "/celularinfo", true) == 0) {
       	SendClientMessage(playerid, COLOR_GRAY,   "O comando /PM [id] foi desabilitado dando origem a um novo recurso,");
        SendClientMessage(playerid, COLOR_YELLOW, "o celular, nele vocÍ faz ligaÁıes e recebe-las para qualquer player com o custo de $1 o crÈdito");
        SendClientMessage(playerid, COLOR_YELLOW, "primeiramente ter· que comprar 1 celular com o comando /celular no valor de $500.");
        SendClientMessage(playerid, COLOR_GREEN,  "ATEN«√O: Apenas os players que tiverem celular poderam receber mensagens e envia-las");
        SendClientMessage(playerid, COLOR_GREEN,  "ATEN«√O: Para vocÍ ver o n˙mero de outro player ter· que comprar um agenda com o comando:");
        SendClientMessage(playerid, COLOR_YELLOW, "/agenda no valor de $500, para saber o n˙mero de um outro player digite /numero [id/partedonick] assim vocÍ ");
        SendClientMessage(playerid, COLOR_YELLOW, "poder· enviar mensagens pelo comando /sms [n˙merodoplayer] [texto].");
        SendClientMessage(playerid, COLOR_WHITE,  "Coloque /celularinfo2 para mais info!");
        return 1;
	}
    if(strcmp(cmd, "/celularinfo2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ,   "ATEN«√O: Para enviar mensagens vocÍ precisa de crÈditos v· em uma loja 24/7 e compre");
        SendClientMessage(playerid, COLOR_JUIZ,   "crÈditos pelo comando /recarga [creditos], para ver os creditos digite /cellcreditos, ESSE comando n„o precisa estar na 24/7");
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
		SendClientMessage(playerid, COLOR_WHITE, "Para ver seu level digite /meustatus ");
		return 1;
	}
    if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_COP_SWAT, "Reload Virtual Life RpG");
	    SendClientMessage(playerid, COLOR_YELLOW, "EdiÁ„o/Scripting atual: Texugo, Rafael, Guilherme");
	    SendClientMessage(playerid, COLOR_RED2, "Scripting Inicial: matraka, Texugo, Allan, Smurf, VanCy");
		SendClientMessage(playerid, COLOR_WHITE, "Agradecimentos especiais: /agradecimentos");
		return 1;
	}
	if(!strcmp(cmd,"/agradecimentos",true)) {
	    SendClientMessage(playerid, COLOR_COP_SWAT, "Agradecimentos especiais:");
	    SendClientMessage(playerid, COLOR_YELLOW, " ");
	    SendClientMessage(playerid, COLOR_EMERGENCIA, "Agradecemos ao clan MPA por ter nos ajudado muito, pois foi l· que aprendemos grande parte do que sabemos.");
	    SendClientMessage(playerid, COLOR_WHITE, "Agradecemos ao clan GT por ter iniciado a histÛria do RPG brasileiro com profissıes.");
	    SendClientMessage(playerid, COLOR_WHITE, "Sem ele, nÛs terÌamos que jogar DM, corrida ou ainda no estilo The Godfather.");
	    SendClientMessage(playerid, COLOR_JUIZ,  "Agradecemos ao DracoBlue pelos magnÌficos sistemas DUDB e DINI,");
	    SendClientMessage(playerid, COLOR_JUIZ,  "que nos permite controlar as contas de usu·rio e mais outras coisas.");
	    SendClientMessage(playerid, COLOR_YELLOW, "Agradecemos ‡ equipe do SA:MP por nos trazer a possibilidade de jogar esse magnÌfico jogo online.");
	    SendClientMessage(playerid, COLOR_RED2, "E principalmente, ‡ Rockstar Games e subsidi·rias, por ter criado um jogo fant·stico como o GTA San Andreas!");
	    return 1;
	}
	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_GRAY,  "Reload Virtual Life RpG");
	    SendClientMessage(playerid, COLOR_WHITE, "Como diz o nome, esse gamemode È um RPG, que simula a vida real.");
	    SendClientMessage(playerid, COLOR_WHITE, "Aqui vocÍ poder· trabalhar e receber seu sal·rio. Com seu sal·rio, poder·.");
	    SendClientMessage(playerid, COLOR_WHITE, "comprar propriedades, casas e carros. Na vida real existem crimes, aqui tambÈm.");
		SendClientMessage(playerid, COLOR_WHITE, "Se vocÍ cometer crimes, vai pagar. Se dirigir sem habilitaÁ„o, poder· pegar multa.");
		SendClientMessage(playerid, COLOR_WHITE, "H· trÍs tipo de habilitaÁıes: terrestre, nautica e aerea. … necess·ria a compra de");
		SendClientMessage(playerid, COLOR_WHITE, "combustÌvel para poder andar com os veÌculos do gamemode.");
		SendClientMessage(playerid, COLOR_WHITE, "Reload Virtual Life RpG mais que um RPG, UMA VIDA!");
		SendClientMessage(playerid, COLOR_WHITE, "Espero que divirtam-se com nosso gamemode. Obrigado, texugo.");
		SendClientMessage(playerid, COLOR_MOTORISTA, "Comandos??? /ajuda ou /comandos /comandos2 /comandos3 /comandos4 /comandos5.");
		return 1;
	}
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte I -");
		SendClientMessage(playerid, COLOR_RED2, 			"/profs  /profs2 /profs3 /profs4 /profs5 : mostra as profissıes do RPG.");
		SendClientMessage(playerid, COLOR_MECANICO,     	"/level : Ver como funciona o sistema de level.");
        SendClientMessage(playerid, COLOR_TURQUESA, 		"/regras1 , /regras2 : Para ver as regras.");
		SendClientMessage(playerid, COLOR_COP_SWAT, 		"/190 [denuncia] : Faz uma denuncia ‡ policia.");
		SendClientMessage(playerid, COLOR_EMERGENCIA, 		"/192 : Chama uma ambul‚ncia ao local");
		SendClientMessage(playerid, COLOR_GREEN,            "/comprarveiculo : Comprar um veÌculo ‡ venda na concecionaria.");
		SendClientMessage(playerid, COLOR_TRAFICANTE,       "/diskdroga : Para pedir uma droga aos traficantes/lideres de tr·ficos");
		SendClientMessage(playerid, COLOR_YELLOW, 			"/comandos2 ver a segunda lista de comandos");
		return 1;
	}
    if(strcmp(cmd, "/comandos2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte II -");
        SendClientMessage(playerid, COLOR_SEGURAN«A, 		"/procurados : VÍ a lista de procurados pela policia | /presos : VÍ aa lista de presos.");
       	SendClientMessage(playerid, COLOR_ASSALTANTE,   	"/banco : Ver como funciona nosso sistema de BANCO");
		SendClientMessage(playerid, COLOR_COP_MILITAR, 		"/abastecer [litros] : Abastecer (vocÍ deve estar no posto para usar este comando).");
        SendClientMessage(playerid, COLOR_WHITE, 			"/pagar [id] [quantidade] : Pagar corretor ou vendedor de carros.| /motorista: solicitar um motorista particular");
        SendClientMessage(playerid, COLOR_ADVOGADO, 		"/advogado: Solicitar um advogado | /defesa [id] [valor ex:500k] : para pagar advogado por defende-lo .");
        SendClientMessage(playerid, COLOR_COP_SWAT,     	"/documentos [IDdoCOP] : Mostra os documentos para o polÌcial.");
        SendClientMessage(playerid, COLOR_PALHA,       	    "/loteria: [1-20] [1-20] - ATEN«√O: Os n˙meros v„o de 1 a 20!");
        SendClientMessage(playerid, COLOR_YELLOW,       	"/comandos3 ver a terceira lista de comandos");
        return 1;
    }
    if(strcmp(cmd, "/comandos3", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte III -");
        SendClientMessage(playerid, COLOR_YELLOW, 			"/taxi : Chama um taxi. | /taxiaereo : Chama um taxi-avi„o");
        SendClientMessage(playerid, COLOR_SEGURAN«A,		"/telepizza [local] : Pede ao pizzaboy uma pizza.");
        SendClientMessage(playerid, COLOR_RED2, 			"/veiculos : Ver os carros que podem ser comprados e os preÁos do Reload Virtual Life RpG.");
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,"/pedirarma [arma/ou/nomeparecido] : Pede uma arma ao vendedor de armas.");
        SendClientMessage(playerid, COLOR_PALHA,			"/acoes : Ver as aÁıes do jogo!");
      	SendClientMessage(playerid, COLOR_WHITE,			"/votarkick [id] : Insatisfeito com um jogador?");
        SendClientMessage(playerid, COLOR_UNLOGGED,     	"/profissao : Ver os comandos de sua profiss„o.");
        SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos4 ver a quarta lista de comandos");
        return 1;
	}
	if(strcmp(cmd, "/comandos4", true) == 0) {
	    SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte IV -");
	    SendClientMessage(playerid, COLOR_ADVOGADO,			"/armas : Ver os preÁos das armas do Reload Virtual Life RpG.");
        SendClientMessage(playerid, COLOR_JUIZ,				"/soltarpreso [id] : VocÍ matou um Juiz/Delegado, ganhou a chave da cadeia pode libertar 1 preso!");
        SendClientMessage(playerid, COLOR_MECANICO,			"/mecanico : Chama um Mecanico para onde vocÍ est·!");
        SendClientMessage(playerid, COLOR_AZULPLUS,         "/portedearmas : Ver o porte de arma do server.");
        SendClientMessage(playerid, COLOR_VERDECLARO,       "/meuskin [id/da/skin] : Troca o skin automaticamente.");
        SendClientMessage(playerid, COLOR_GREEN, 			"/horas : Mostra o hor·rio em SA | /data : Mostra a data em SA.");
        SendClientMessage(playerid, COLOR_INSTRUTOR,        "/carteiras : Ver o valor das habilitaÁıes.");
        SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos5 ver a quinta lista de comandos");
        return 1;
    }
    if(strcmp(cmd, "/comandos5", true) == 0) {
     	SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte V -");
        SendClientMessage(playerid, COLOR_VERDE_AQUA,       "/novidades , /novidades2 , /rpglife , /rpglife2 , /rpglife3 , /rpglife4 , /rpglife5 : Para ver as novidades.");
        SendClientMessage(playerid, COLOR_GREEN,            "/meustatus : Para ver o seu status completo.");
		SendClientMessage(playerid, COLOR_RED2,             "/retirartxt : Remove o texto se bugar na tela!");
		SendClientMessage(playerid, COLOR_DELEGADO,         "/cheirar [gramas] : Para cheirar cocaÌna.");
		SendClientMessage(playerid, COLOR_EMERGENCIA,       "/fumar [cigarros] : Para fumar maconha.");
		SendClientMessage(playerid, COLOR_PEDREIRA,         "/injetar [injeÁıes] : Para injetar heroÌna.");
        SendClientMessage(playerid, COLOR_CORRETOR,         "/verplaca : Ver a placa do veÌculo.");
		SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos6 ver a sexta lista de comandos.");
	    return 1;
    }
    if(strcmp(cmd, "/comandos6", true) == 0) {
     	SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte VI -");
		SendClientMessage(playerid, COLOR_RECEITA_FEDERAL,  "/pagarmulta : Pagar suas multas, vocÍ tem que estar na delegacia.");
		SendClientMessage(playerid, COLOR_VERDEESCURO,  	"/trocarposicao : Troca a posiÁ„o de um veÌculo, vocÍ tem que ser o dono dele.");
		SendClientMessage(playerid, COLOR_LIDER_DE_TRAFICO, "/mudarsenha : Para mudar sua senha.");
		SendClientMessage(playerid, COLOR_MECANICO, 		"/pedirseguro : Para pedir um seguro de vida/veÌculo.");
		SendClientMessage(playerid, COLOR_PURPLE, 		    "/cancelarseguro : Para remover seu seguro de vida.");
        SendClientMessage(playerid, COLOR_AZULPLUS, 		"/pagarstrip [ID/da/striper] : Para pagar uma striper.");
        SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos7 ver a sÈtima lista de comandos.");
	    return 1;
    }
    if(strcmp(cmd, "/comandos7", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte VII -");
        SendClientMessage(playerid, COLOR_ROSACLARO,       	"/tomarsorvete : Para tomar sorvete.");
        SendClientMessage(playerid, COLOR_WHITE,            "/iscas [quantia/de/iscas] : Comprar iscas (VocÍ tem que estar na cooperativa de pesca)");
		SendClientMessage(playerid, COLOR_PESCADOR,         "/pescar : Joga a rede para pescar (VocÍ tem que estar na ·rea de pesca)");
		SendClientMessage(playerid, COLOR_COP_SWAT,         "/venderpesca : Vende suas pescas (VocÍ tem que estar na cooperativa de pesca)");
		SendClientMessage(playerid, COLOR_TRAFICANTE,       "/minhasiscas : Ver a quantidade de iscas que vocÍ tem.");
		SendClientMessage(playerid, COLOR_CONTRABANDISTA, 	"/cancelarseguroimovel : Para remover seu seguro de imÛvel.");
		SendClientMessage(playerid, COLOR_VERDE_AQUA,       "/hotelinfo : Ver as informaÁıes de hotel.");
		SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos8 ver a oitava lista de comandos.");
	    return 1;
    }
    if(strcmp(cmd, "/comandos8", true) == 0) {
    	SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte VIII -");
		SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "/removerseguroveiculo : Remover o seguro de um veÌculo, vocÍ tem que ser o dono dele!");
		SendClientMessage(playerid, COLOR_WHITE,            "/negocios : Ver como funciona o sistema de negÛcios.");
		SendClientMessage(playerid, COLOR_GREEN,            "/propriedades : Ver as propriedades do gamemode.");
		SendClientMessage(playerid, COLOR_MECANICO,         "/negocioscmds , /negocioscmds2 : Ver os comandos do sistema de negÛcios.");
		SendClientMessage(playerid, COLOR_UNLOGGED,         "/mandarmatar [id] [valor] : Colocar a cabeÁa de alguÈm em prÍmio para os assassinos.");
		SendClientMessage(playerid, COLOR_SEGURAN«A,        "/contratarseguranca [id] [valor] : Contratar um seguranÁa.");
		SendClientMessage(playerid, COLOR_RED,              "/demitirseguranca [id] : Demitir um seguranÁa.");
		SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos9 ver a nona lista de comandos.");
	    return 1;
	}
	if(strcmp(cmd, "/comandos9", true) == 0) {
    	SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte IX -");
		SendClientMessage(playerid, COLOR_BARMAN, 			"/apostarcavalo [cavalo] [quantia] : Apostar em um cavalo, vocÍ tem que estar na loteria de cavalos!");
		SendClientMessage(playerid, COLOR_RECEITA_FEDERAL,  "/meucarro : Aplicar uma trava em seu veÌculo, ele tem que ter o KIT de travas comprado na loja de customizaÁ„o.");
		SendClientMessage(playerid, COLOR_DELEGADO,  		"/skintrabalho : Muda seu skin para o de trabalho.");
		SendClientMessage(playerid, COLOR_RED2,             "/agendatestes : Ver a agenda de testes da auto escola.");
		SendClientMessage(playerid, COLOR_INSTRUTOR,        "/agendarteste [id] : Agendar um teste de habilitaÁ„o com um instrutor!");
		SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "/admin [mensagem] : Enviar mensagem para os admins (ReclamaÁıes, Reportar BUG's, etc...)");
		SendClientMessage(playerid, COLOR_WHITE,            "/admins : Ver os admins do servidor.");
		SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos10 ver a dÈcima lista de comandos.");
		return 1;
	}
	if(strcmp(cmd, "/comandos10", true) == 0) {
    	SendClientMessage(playerid, COLOR_JUIZ, 			"Comandos do Reload Virtual Life RpG - Parte X -");
		SendClientMessage(playerid, COLOR_VERDEESCURO, 		"/GPS [ID/do/Local] : Para ligar o GPS.");
		SendClientMessage(playerid, COLOR_GREEN, 			"/desligargps : Para desligar o GPS.");
		SendClientMessage(playerid, COLOR_VERDECLARO, 		"/locais : Ver os locais de GPS.");
		SendClientMessage(playerid, COLOR_WHITE,	 		"/c [mensagem] : Enviar mensagem para as pessoas que estiverem no mesmo veÌculo que vocÍ.");
		SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "/s [mensagem] : Manda mensagem para pessoas proximas a vocÍ.");
		SendClientMessage(playerid, COLOR_COP_SWAT, 		"/sistemadecasas : Mostra as atividades possÌveis com sua casa.");
		SendClientMessage(playerid, COLOR_YELLOW,           "Virtual Life RPG mais que um RPG, UMA VIDA!");
		return 1;
	}
	if(strcmp(cmd, "/sistemadecasas", true) == 0) {
	    SendClientMessage(playerid, COLOR_JUIZ, 			"Sistema de Casas Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_COP_SWAT,			"/alugarcasa [id] : Alugar a casa de um jogador.");
		SendClientMessage(playerid, COLOR_TRAFICANTE, 		"/comprarcasa [id] : Comprar a casa de um jogador.");
	    SendClientMessage(playerid, COLOR_CORRETOR, 		"/locarminhacasa [dias] : Colocar sua casa em aluguel.");
		SendClientMessage(playerid, COLOR_VERDEESCURO, 		"/venderminhacasa : Colocar sua casa ‡ venda.");
		SendClientMessage(playerid, COLOR_MECANICO, 		"/cancelaraluguelcasa : Cancelar o aluguel de sua casa.");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO, 	"/cancelarvendacasa : Cancelar a venda de sua casa.");
        SendClientMessage(playerid, COLOR_YELLOW,           "Virtual Life RPG mais que um RPG, UMA VIDA!");
		return 1;
	}
	if(strcmp(cmd, "/novidades", true) == 0) {
		SendClientMessage(playerid, COLOR_MECANICO,			"NovidadeS Reload Virtual Life RpG - Parte I -");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Nosso mode vem equipado de 40 profissıes para saber como funciona basta digitar /level.");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Sistema de skins autom·tica /meuskin [id/da/skin]");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Que tal apostar uma graninha e concorrer a $200.000? V· em uma loja 24/7 e se informe!");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Est· querendo ver os veÌculos e os preÁos do server? /veÌculos e veja os veÌculos disponÌveis.");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Est· querendo fazer algo ilÌcito e precisa de armas? Veja nossas armas em /armas e /armas2.");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Logo em seguida digite /pedirarma [arma/ou/nomeparecido]");
		SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "/novidades 2 Para ver a lista das Reload Virtual Life RpG - Parte II");
		return 1;
	}
   	if(strcmp(cmd, "/novidades2", true) == 0) {
   		SendClientMessage(playerid, COLOR_MECANICO,			"NovidadeS Reload Virtual Life RpG - Parte II -");
   	    SendClientMessage(playerid, COLOR_AZULPLUS,         "Quer ver as aÁıes disponÌveis no jogo? /acoes");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Insatisfeito com algum jogador? Inicie uma votaÁ„o /votarkick [id/do/jogador].");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Mate o Juiz/Delegado e ganhe a chave da cadeia /soltarpreso");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Seu carro est· prestes a explodir? Chame um reboque /mecanico");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Quer ver seu porte de armas? /portedearmas");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "V· na concecion·ria de San Fierro e veja os carros para locaÁ„o!");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "Digite /rpglife e veja o Reload Virtual Life RpG na Ìntegra.");
        return 1;
    }
   	if(strcmp(cmd, "/rpglife", true) == 0) {
   	    SendClientMessage(playerid, COLOR_AZULPLUS, 		 "Aqui est„o as NovidadeS - Parte I - do Reload Virtual Life RpG");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Cansado de esperar dar gmx para aparecer seu carro? No Reload Virtual Life RpG");
   	    SendClientMessage(playerid, COLOR_WHITE,             "n„o precisa de gmx para aparecer.");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Comprava 1 casa e n„o sabia se morava outra pessoa ali, agora no Virtual Life");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Sua casa ganha 1 Ìcone informando que ali j· mora gente.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora vocÍ tem seu carro! Comprando o carro do vendedor vocÍ pode ativar o alarme");
	    SendClientMessage(playerid, COLOR_WHITE,             "e quando sentir falta dele avise a polÌcia que ligar· o radar e achar· seu carro");
   	    SendClientMessage(playerid, COLOR_WHITE,             "aonde estiver");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,    "Digite /rpglife2 e veja o Reload Virtual Life RpG na Ìntegra.");
        return 1;
    }
	if(strcmp(cmd, "/rpglife2", true) == 0) {
        SendClientMessage(playerid, COLOR_AZULPLUS, 		"Aqui est„o as NovidadeS - Parte II - do Reload Virtual Life RpG");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora os carros n„o d„o mais respawn, para reaver 1 carro chame um reboque.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Celular com: /celular /sms /agenda /numero /chamar /atender /desligar /espera");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora todos os carros vem com g·s! Ao iniciar o mode todos tem 100lts");
        SendClientMessage(playerid, COLOR_WHITE,             "Quando fechar o mode os litros deixados nos carros ser„o salvos!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Sem grana para 1 casa? Fique hospedado no Hotel /hotelinfo");
	    SendClientMessage(playerid, COLOR_WHITE,             "Todas as profissıes vem com mais de 2 comandos! Exato atÈ assassino e desempregado!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Em toda San Andreas h· radares fixos multando quem andar acima da velocidade.");
	    SendClientMessage(playerid, COLOR_COP_RODOVIARIO,    "Digite /rpglife3 e veja o Reload Virtual Life RpG na Ìntegra.");
	    return 1;
	}
	if(strcmp(cmd, "/rpglife3", true) == 0) {
        SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Aqui est„o as NovidadeS - Parte III - do Reload Virtual Life RpG");
	    SendClientMessage(playerid, COLOR_WHITE,             "Previs„o do tempo altera o plantio se chover a colheita sai mais r·pido.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Tuning, vocÍ pode tunar seu veiculo e salv·-lo. Basta ser o dono.");
	    SendClientMessage(playerid, COLOR_WHITE,             "V· a uma oficina aplique os componentes desejados! E pronto est· salvo!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Sistema de salvamento de armas! Assim que comprar uma arma com um vendedor");
	    SendClientMessage(playerid, COLOR_WHITE,             "ela ficar· salva atÈ as muniÁıes acabarem ou serem confiscadas quando vocÍ for preso e n„o ter porte!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Est· precisando de grana mas n„o tem nada no banco? FaÁa um emprÈstimo, v· atÈ o banco, selecione");
	    SendClientMessage(playerid, COLOR_WHITE,             "a linha do menu 'Fazer EmprÈstimo', os JUROS v„o aumentando ent„o È bom pagar a dÌvida logo");
	    SendClientMessage(playerid, COLOR_COP_RODOVIARIO,    "Digite /rpglife4 e veja o Reload Virtual Life RpG na Ìntegra.");
	    return 1;
	}
	if(strcmp(cmd, "/rpglife4", true) == 0) {
	    SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Aqui est„o as NovidadeS - Parte IV - do Reload Virtual Life RpG");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora as suas doses de maconha/cocaina/heroina e seu teor alcÛolico ficam salvos.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Para remover seu teor alcÛolico beba guaran· e para remover suas drogas faÁa um");
	    SendClientMessage(playerid, COLOR_WHITE,             "tratamento especial com um ParamÈdico");
	    SendClientMessage(playerid, COLOR_WHITE,             "Salvamento de cores! Agora quando vocÍ pintar um veÌculo as cores dele ficar„o salvas");
	    SendClientMessage(playerid, COLOR_WHITE,             "mesmo ele sendo um veÌculo do servidor/governo!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Comprou uma casa mas n„o gostou de ficar por l·?! Arranje um seguro de imÛveis com um corretor de seguros.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Se vocÍ possuir seguro poder· ganhar um reembolso de 50,75 e atÈ 100 por cento do valor pago.");
	    SendClientMessage(playerid, COLOR_COP_RODOVIARIO, 	 "Digite /rpglife5 e veja o Reload Virtual Life RpG na Ìntegra.");
		return 1;
	}
	if(strcmp(cmd, "/rpglife5", true) == 0) {
	    SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Aqui est„o as NovidadeS - Parte V - do Reload Virtual Life RpG");
	    SendClientMessage(playerid, COLOR_WHITE,             "Est· com dinheiro e quer comprar um veÌculo mas n„o tem nenhum vendedor no jogo?");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora aqui possue carros ‡ venda, n„o sÛ os outros jogadores podem vender veÌculos pra vocÍ,");
	    SendClientMessage(playerid, COLOR_WHITE,             "como vocÍ tambÈm pode ir na concecionaria e l· ter· veÌculos ‡ venda com diversos modelos!");
		SendClientMessage(playerid, COLOR_WHITE,             "Agora vocÍ poder· colocar sua casa em aluguel /locarminhacasa [dias]");
		SendClientMessage(playerid, COLOR_WHITE,             "Os dias ser„o contados quando o jogador estiver conectado no servidor ir„o sendo diminuidos!");
		SendClientMessage(playerid, COLOR_COP_RODOVIARIO, 	 "Reload Virtual Life RpG mais que um RPG, UMA VIDA!");
		return 1;
	}
    if(strcmp(cmd, "/armas", true) == 0) {
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,	"Armas do Reload Virtual Life RpG - Parte I -");
        SendClientMessage(playerid, COLOR_MECANICO,				"DescriÁ„o: ID - Nome da Arma - Valor");
        SendClientMessage(playerid, COLOR_WHITE,				"1 - Soco InglÍs - $500 | 2 - Taco de Golfe - $600 	  | 3 - Cacetete - $650");
        SendClientMessage(playerid, COLOR_WHITE,				"4 - Faca - $750 		| 5 - Taco de Baseball - $350 | 6 - Shovel - $400");
		SendClientMessage(playerid, COLOR_WHITE,				"7 - Taco de Sinuca - $300 | 8 - Katana - $800 | 9 - Motoserra - $1000");
		SendClientMessage(playerid, COLOR_WHITE,				"10 - Vibrador roxo - $100 | 11 - Vibrador branco grande - $100 | 12 - Vibrador branco mÈdio - $100");
		SendClientMessage(playerid, COLOR_WHITE,				"13 - Vibrador prata pequeno - $100 | 14 - Flores - $100 | 15 - Bengala - $150 | 16 - Granada - $300");
        SendClientMessage(playerid, COLOR_WHITE,				"17 - Gas - $300 | - 18 ao 21 - armas indisponiveis - | 22 - Pistola - $600 | 23 - Pistola com Silenciador - $1000");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,		"/armas2 - Lista II do Reload Virtual Life RpG");
        return 1;
    }
    if(strcmp(cmd, "/armas2", true) == 0) {
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,	"Armas do Reload Virtual Life RpG - Parte II -");
        SendClientMessage(playerid, COLOR_MECANICO,				"DescriÁ„o: ID - Nome da Arma - Valor");
		SendClientMessage(playerid, COLOR_WHITE,				"24 - Desert Eagle - $3000 | 25 - Escopeta Calibre 12 - $1800 | 26 - Escopeta de Cano Serrado - $6000");
		SendClientMessage(playerid, COLOR_WHITE,				"27 - Escopeta de Combate - $7500 | 28 - Micro Uzi - $8000 | 29 - MP5 - $5500");
        SendClientMessage(playerid, COLOR_WHITE,				"30 - AK47 - $7500 | 31 - M4 - $9000 | 32 - Tec9 - $8000 | 33 - Country Rifle - 4000");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,       "Fim da Lista das ARMAS do do Reload Virtual Life RpG");
        return 1;
	}
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_AZULPLUS, "Sistema de Banco do Reload Virtual Life RpG.");
        SendClientMessage(playerid, COLOR_YELLOW, "Autom·tico, ao entrar no banco com o comando /meubanco vocÍ entrar· na fila e logo em seguida.");
        SendClientMessage(playerid, COLOR_YELLOW, "Aparecer· um menu com a opÁ„o a ser escolhida. Digite o valor no chat esse ser· o valor.");
        SendClientMessage(playerid, COLOR_YELLOW, "Depositado ou Sacado.");
		SendClientMessage(playerid, COLOR_YELLOW, "TambÈm no banco vocÍ pode fazer emprÈstimo com o gerente. Sendo disponÌvel um valor X.");
        SendClientMessage(playerid, COLOR_YELLOW, "O pagamento È obrigatÛrio sendo depois de alguns dias a retomada de bens ou a retirada da conta sem aviso prÈvio");
        SendClientMessage(playerid, COLOR_GREEN,  "Os Bancos est„o marcados no Mapa com um cifr„o $, s„o 4 bancos em Los Santos");
		return 1;
	}
	if(strcmp(cmd,"/negocios",true) == 0){
        SendClientMessage(playerid, COLOR_RED2, 			"Sistema de negÛcios do Virtual Life RpG:");
        SendClientMessage(playerid, COLOR_WHITE, 			"Nosso sistema de negÛcios È um sistema que faz com que vocÍ comece com uma propriedade");
        SendClientMessage(playerid, COLOR_WHITE,        	"com poucos lucros e a evolua contratando/demitindo funcion·rios, investindo dinheiro nela,");
        SendClientMessage(playerid, COLOR_WHITE,        	"e atÈ mesmo vocÍ pode trabalhar nela!");
        SendClientMessage(playerid, COLOR_WHITE,        	"Cada propriedade tem seu modo de ganhar lucro e prejuÌzo!");
		SendClientMessage(playerid, COLOR_WHITE,        	"O m·ximo de funcion·rios que vocÍ poder· contratar È 7.");
		SendClientMessage(playerid, COLOR_WHITE,            "Para comprar uma propriedade v· atÈ a corretora de propriedades!");
        SendClientMessage(playerid, COLOR_WHITE,        	"Para ver as propriedades e informaÁıes sobre elas digite /propriedades");
        SendClientMessage(playerid, COLOR_WHITE,        	"Para ver os comandos de negÛcios digite /negocioscmds");
        return 1;
	}
	if(strcmp(cmd,"/negocioscmds",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2, 			"Comandos de negÛcios do Reload Virtual Life RpG - Parte I");
	    SendClientMessage(playerid, COLOR_WHITE,        	"/propriedades : VÍ as propriedades e as informaÁıes delas!");
	    SendClientMessage(playerid, COLOR_WHITE,        	"/propinfo [propriedade] : Ver as informaÁıes de uma propriedade (Dono, Funcion·rios, etc...)");
	    SendClientMessage(playerid, COLOR_WHITE,            "/anunciaremprego [id/do/jornalista] [id/da/propriedade] [salario] [profissao/a/oferecer] : Anuncia no Jornal uma Vaga de Emprego na empresa");
	    SendClientMessage(playerid, COLOR_WHITE,        	"/comprarpropriedadedodono [id] [propriedade] [valor] : Compra uma propriedade de alguÈm.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"/contratar [id] [propriedade] : Contrata um jogador para trabalhar em uma propriedade.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"/demitir [id] [propriedade] : Demite um jogador de uma propriedade.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"/venderpropriedade [propriedade] : Vende uma propriedade pela metade do valor.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"/aumento [id] [quantidade] [propriedade] : Dar um aumento para um jogador.");
	    SendClientMessage(playerid, COLOR_RED2,         	"Para mais comandos de negÛcios, escreva /negocioscmds2");
	    return 1;
	}
	if(strcmp(cmd,"/negocioscmds2",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2, 			"Comandos de negÛcios do Reload Virtual Life RpG - Parte II");
	    SendClientMessage(playerid, COLOR_WHITE,         	"/tiraraumento [id] [quantidade] [propriedade] : Tirar um aumento de um jogador!");
	    SendClientMessage(playerid, COLOR_WHITE,         	"/investir [propriedade] [quantidade] : Investir dinheiro em uma propriedade.");
        SendClientMessage(playerid, COLOR_RED2,         	"Esses s„o os comandos de negÛcios do Reload Virtual Life RpG.");
		return 1;
	}
	if(strcmp(cmd,"/propriedades",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,         	"Propriedades do Reload Virtual Life RpG:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"0 - Pizzaria (Custo: $55000) : Para informaÁıes ver as digite /proppizzaria");
	    SendClientMessage(playerid, COLOR_WHITE,        	"1 - Yellow's'Taxi (Custo: $70000) : Para ver as informaÁıes digite /proptaxi");
	    SendClientMessage(playerid, COLOR_WHITE,        	"2 - LuxLimosine (Custo: $90000) : Para ver as informaÁıes digite /proplimosine");
	    SendClientMessage(playerid, COLOR_WHITE,        	"3 - Corretora de seguros  (Custo: $100000) : Para ver as informaÁıes digite /propseguros");
		SendClientMessage(playerid, COLOR_WHITE,            "4 - SecurityLife (Custo: $80000) : Para ver as informaÁıes digite /propsecurity");
		SendClientMessage(playerid, COLOR_WHITE,            "5 - Ammu-Nation (Custo: $75000) : Para ver as informaÁıes digite /propweapon");
		SendClientMessage(playerid, COLOR_WHITE,            "6 - Boate de strip (Custo: $100000) : Para ver as informaÁıes digite /propboate");
		SendClientMessage(playerid, COLOR_WHITE,            "7 - Posto (Custo: $120000) : Para ver as informaÁıes digite /propgas");
		SendClientMessage(playerid, COLOR_RED2,         	"Para mais propriedades, escreve /propriedades2");
		return 1;
	}
	if(strcmp(cmd,"/propriedades2",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,         	"Propriedades do Reload Virtual Life RpG: Parte 2");
	    SendClientMessage(playerid, COLOR_WHITE,        	"8 - Bar (Custo: $5000) : Para informaÁıes ver as digite /propbar");
	    SendClientMessage(playerid, COLOR_WHITE,        	"9 - Pay'n'Spray (Custo: $140000) : Para ver as informaÁıes digite /propmecanico");
		SendClientMessage(playerid, COLOR_RED2,         	"Para mais propriedades, escreve /propriedades2");
		return 1;
	}
	if(strcmp(cmd,"/proppizzaria",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,         	"Pizzaria:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"A pizzaria È uma propriedade onde vocÍ contrata entregadores de pizza");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = As entregas de pizzas autom·ticas e n„o autom·ticas");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = S·lario dos funcion·rios + os aumentos que vocÍ dar para eles");
		return 1;
	}
	if(strcmp(cmd,"/proptaxi",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,         	"Yellow's'Taxi:");
		SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata taxistas/mototaxistas/taxistas aÈreos");
		SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Passageiros dos taxistas que chegarem ao destino");
		SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles + energia que os GPS gastam");
		return 1;
	}
	if(strcmp(cmd,"/proplimosine",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,         	"LuxLimosine:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata motoristas particulares");
		SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Limosines entregues em perfeitos estados (sem amassos, gas completo, etc...)!");
		SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles + gas/consertos/ das limosines");
		SendClientMessage(playerid, COLOR_WHITE,        	"O seu lucro È o que vocÍ gasta com o prejuÌzo portanto essa È uma propriedade que vocÍ precisa contratar Ûtimos motoristas!");
		SendClientMessage(playerid, COLOR_WHITE,        	"N„o contrate motoristas que amassem as limosines, pois estes lhe aumentam o prejuÌzo!");
		return 1;
	}
	if(strcmp(cmd,"/propseguros",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,         	"Corretora de seguros:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata corretores de seguro");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = O dinheiro e as dÌvidas dos seguros vendidos");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles + os gastos do seguros por ex:");
		SendClientMessage(playerid, COLOR_WHITE,        	"Seguro de vida = Metade do dinheiro do tratamento do outro jogador, afinal a outra metade È por conta do governo");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Seguro de imÛvel = Uma pequena dÌvida para a corretora pois o seu trabalho È governamental");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Seguro de veÌculos = Uma pequena taxa para o conserto e a devoluÁ„o do veÌculo ao dono");
		return 1;
	}
	if(strcmp(cmd,"/propsecurity",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,         	"SecurityLife:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata seguranÁas/transportadores de valores");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Os malotes transportados.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles");
		return 1;
	}
	if(strcmp(cmd,"/propweapon",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,             "Ammu-Nation:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata vendedores de armas");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Venda de armas, coletes e camuflagens.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles");
		return 1;
	}
	if(strcmp(cmd,"/propboate",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,             "Boate de strip:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata prostitutas");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Strip-teases na boate, sexos na cama.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles");
		return 1;
	}
	if(strcmp(cmd,"/propgas",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,             "Posto:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata frentistas");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Abastecimento/Venda de gasolina.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles");
		return 1;
	}
	if(strcmp(cmd,"/propbar",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,             "Bar:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata barmans");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Venda de bebidas e lanches dos bares e barmans.");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles");
		return 1;
	}
	if(strcmp(cmd,"/propmecanico",true) == 0){
	    SendClientMessage(playerid, COLOR_RED2,             "Pay'n'Spray:");
	    SendClientMessage(playerid, COLOR_WHITE,        	"Essa È uma propriedade onde vocÍ contrata mec‚nicos");
	    SendClientMessage(playerid, COLOR_WHITE,        	"LUCRO = Consertos, pinturas e mudanÁas de placas da loja de custumizaÁ„o e aplicados(as) por um mec‚nico");
	    SendClientMessage(playerid, COLOR_WHITE,        	"PREJUÕZO = Sal·rio dos funcion·rios + os aumentos que vocÍ dar para eles");
		return 1;
	}
    if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_UNLOGGED,			"Lista de profissıes Virtual Life RpG - Parte I -");
        SendClientMessage(playerid, COLOR_DESEMPREGADO,		"1 - Desempregado (Sal·rio: $350)");
        SendClientMessage(playerid, COLOR_BARMAN, 			"2 - Barman (Sal·rio: $1000 + as bebidas que vende)");
    	SendClientMessage(playerid, COLOR_ASSASSINO, 		"3 - Assassino (Sal·rio: $400 + ganha o que roubar da vÌtima)");
        SendClientMessage(playerid, COLOR_UNLOGGED,   		"4 - Vendedor de carros (Sal·rio: $350 + comiss„o) PROFISS√O LIMITADA");
		SendClientMessage(playerid, COLOR_CORRETOR, 		"5 - Corretor de imÛveis Sal·rio: $350 + comiss„o) PROFISS√O LIMITADA");
	    SendClientMessage(playerid, COLOR_SEGURAN«A,		"6 - SeguranÁa (Sal·rio: $2000 + o que o patr„o pagar)");
        SendClientMessage(playerid, COLOR_MOTORISTA,		"7 - Motorista Particular (Sal·rio: $2000 + o que o patr„o pagar)");
    	SendClientMessage(playerid, COLOR_MOTORISTA_DE_ONIBUS,	"8 - Motorista de Ùnibus (Sal·rio: $1500)");
    	SendClientMessage(playerid, COLOR_UNLOGGED,     	"Para mais profissıes, digite /profs2");
    	return 1;
    }
    if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COLOR_UNLOGGED,     	"Lista de profissıes Virtual Life RpG - Parte II -");
		SendClientMessage(playerid, COLOR_CAMINHONEIRO,		"9  - Caminhoneiro (Sal·rio: $800 + o frete pelas cargas)");
        SendClientMessage(playerid, COLOR_PESCADOR, 		"10 - Pescador (Sal·rio: $1000 + o que ganha na pesca)");
	    SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "11 - Entregador de pizza (Sal·rio: $900 + o que o vender)");
        SendClientMessage(playerid, COLOR_TAXISTA, 			"12 - Taxista (Sal·rio: $1500)");
	    SendClientMessage(playerid, COLOR_MOTOTAXI, 		"13 - Mototaxista (Sal·rio: $1500)");
        SendClientMessage(playerid, COLOR_TAXI_AEREO, 		"14 - Aerotaxista (Sal·rio: $2500)");
        SendClientMessage(playerid, COLOR_INSTRUTOR, 		"15 - Instrutor de direÁ„o (Sal·rio: $850 + comiss„o)");
        SendClientMessage(playerid, COLOR_TRAFICANTE, 		"16 - Traficante (Sal·rio: $1200 + o que o vender)");
        SendClientMessage(playerid, COLOR_UNLOGGED,		    "Para mais profissıes, digite /profs3");
		return 1;
	}
	if(strcmp(cmd, "/profs3", true) == 0) {
		SendClientMessage(playerid, COLOR_UNLOGGED,  		"Lista de profissıes Virtual Life RpG - Parte III -");
    	SendClientMessage(playerid, COLOR_JORNALISTA, 		"17 - Jornalista (Sal·rio: $1500)");
        SendClientMessage(playerid, COLOR_PARAMEDICO, 		"18 - ParamÈdico (Sal·rio: $1000 + mais pagamento do plant„o)");
        SendClientMessage(playerid, COLOR_ADVOGADO,   		"19 - Advogado (Sal·rio: $1000 + honorarios)");
	    SendClientMessage(playerid, COLOR_COP_MILITAR,  	"20 - PolÌcia militar (Sal·rio: $1400) PROFISS√O LIMITADA");
		SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "21 - PolÌcia rodovi·ria (Sal·rio: $1700) PROFISS√O LIMITADA");
		SendClientMessage(playerid, COLOR_COP_SWAT,  		"22 - PolÌcia Swat (Sal·rio: $2000) PROFISS√O LIMITADA");
		SendClientMessage(playerid, COLOR_COP_NARCOTICOS,   "23 - PolÌcia NarcÛticos (Sal·rio: $2000) PROFISS√O LIMITADA");
		SendClientMessage(playerid, COLOR_JUIZ,   			"24 - Juiz (Sal·rio: $4000) PROFISS√O LIMITADA");
		SendClientMessage(playerid, COLOR_UNLOGGED,         "Para mais profissıes, digite /profs4");
		return 1;
	}
	if(strcmp(cmd, "/profs4", true)==0){
	    SendClientMessage(playerid, COLOR_UNLOGGED,  	    "Lista de profissıes Virtual Life RpG - Parte IV -");
     	SendClientMessage(playerid, COLOR_DELEGADO,   		"25 - Delegado (Sal·rio: $4500) PROFISS√O LIMITADA");
     	SendClientMessage(playerid, COLOR_LIXEIRO,   		"26 - Lixeiro (Sal·rio: $1000) + o que coletar");
     	SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES,   "27 - Transporte de Valores (Sal·rio: $800 + o que depositar)");
     	SendClientMessage(playerid, COLOR_CONTRABANDISTA,   "28 - Contrabandista (Sal·rio: $800 + contrabando)");
     	SendClientMessage(playerid, COLOR_RECEITA_FEDERAL,  "29 - Receita Federal (Sal·rio: $3000) PROFISS√O LIMITADA");
     	SendClientMessage(playerid, COLOR_AGRICULTOR,   	"30 - Agricultor (Sal·rio: $1200 + o que plantar)");
     	SendClientMessage(playerid, COLOR_ASSALTANTE,   	"31 - Assaltante (Sal·rio: $600 + o que assaltar e roubar)");
     	SendClientMessage(playerid, COLOR_FRENTISTA, 		"32 - Frentista (Sal·rio: $1200 + gasolina)");
     	SendClientMessage(playerid, COLOR_UNLOGGED, 	    "Para mais profissıes, digite /profs5");
		return 1;
	}
	if(strcmp(cmd, "/profs5", true)==0){
	    SendClientMessage(playerid, COLOR_UNLOGGED,   		"Lista de profissıes Virtual Life RpG - Parte V -");
     	SendClientMessage(playerid, COLOR_LOCADOR_DE_CARROS,"33 - Locador de Carros (Sal·rio: $1000 + os carros que locar)");
     	SendClientMessage(playerid, COLOR_PEDREIRA,   		"34 - Carregador da Pedreira (Sal·rio: $1500 + o que descarregar na obra.)");
     	SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,"35 - Vendedor de Armas (Sal·rio: $1400 + os 10 por cento das armas que vender.)");
     	SendClientMessage(playerid, COLOR_MECANICO,         "36 - Mec‚nico (Sal·rio: $1000 + os consertos)");
       	SendClientMessage(playerid, COLOR_ROSA, 	  		"37 - Prostituta (Sal·rio: $800 + transas e strips)");
       	SendClientMessage(playerid, COLOR_LIDER_DE_TRAFICO, "38 - LÌder de Tr·fico (Sal·rio: $2000 + o que vender) PROFISS√O LIMITADA");
       	SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS,	"39 - Corretor de seguros (Sal·rio: $1400 + o que vender)");
       	SendClientMessage(playerid, COLOR_EXERCITO, 	    "40 - Exercito (Sal·rio: $4000) PROFISS√O LIMITADA");
       	SendClientMessage(playerid, COLOR_UNLOGGED, 	    "Essas s„o as profissıes do Reload Virtual Life RpG.");
	   	return 1;
    }
    if(strcmp(cmd, "/locais", true)==0){
		SendClientMessage(playerid, COLOR_UNLOGGED,  		"Locais de GPS:");
		SendClientMessage(playerid, COLOR_WHITE, 			"1 - Delegacia | 2 - Sorveteria | 3 - Clube Alhambra");
		SendClientMessage(playerid, COLOR_WHITE,            "4 - Posto | 5 - Banco | 6 - Ammu-Nation");
		SendClientMessage(playerid, COLOR_WHITE,            "7 - Hospital | 8 - Posto | 9 - Hotel");
		SendClientMessage(playerid, COLOR_WHITE,            "10 - Banco | 11 - Skate Park | 12 - Agencia de empregos");
		SendClientMessage(playerid, COLOR_WHITE,            "13 - Hotel | 14 - Aeroporto | 15 - Pay'n'Spray");
		SendClientMessage(playerid, COLOR_WHITE,            "16 - Ammu-Nation | 17 - Aeroporto | 18 - Beco do Desmanche");
		SendClientMessage(playerid, COLOR_WHITE,            "19 - Lix„o/Ferro-Velho | 20 - Auto-Escola");
		SendClientMessage(playerid, COLOR_UNLOGGED, 		"Esses s„o os locais de GPS do Reload Virtual Life RpG");
		return 1;
	}
	if(strcmp(cmd, "/regras1", true) == 0) {
	    SendClientMessage(playerid, COLOR_RED2, "  REGRAS - Reload Virtual Life RpG para Jogadores e Administradores. PARTE I -");
        SendClientMessage(playerid, COLOR_JUIZ,	"  1∫ N„o È permitido o uso de cheats, trapaÁas, para jogadores INCLUSIVE ADMINS.");
        SendClientMessage(playerid, COLOR_JUIZ, "  2∫ Nenhum jogador pode se apossar de algum veÌculo sem ter pago pelo mesmo.");
        SendClientMessage(playerid, COLOR_JUIZ, "  3∫ … necess·ria habilitaÁ„o para dirigir, e a compra de carros È possÌvel somente");
        SendClientMessage(playerid, COLOR_JUIZ, "  se o jogador tiver uma casa.");
    	SendClientMessage(playerid, COLOR_JUIZ, "  4∫ Nenhum jogador pode possuir mais de 4 veÌculos, afim de n„o pesar o mode.");
        SendClientMessage(playerid, COLOR_JUIZ, "  5∫ Valores de casas: $5000, $10000, $20000, $40000, $60000, $80000, $100000 e $200000.");
        SendClientMessage(playerid, COLOR_JUIZ, "  6∫ Valores dos carros: vide tabela padr„o.");
        SendClientMessage(playerid, COLOR_RED2, "  Veja mais regras em /regras2.");
		return 1;
	}
	if(strcmp(cmd, "/regras2", true) == 0) {
        SendClientMessage(playerid, COLOR_RED2, "  REGRAS - Reload Virtual Life RpG para Jogadores e Administradores. PARTE II -");
	    SendClientMessage(playerid, COLOR_JUIZ, "  7∫ Profissıes elitizadas ser„o setadas como promoÁ„o, NENHUM jogadoras receber· sem provar");
        SendClientMessage(playerid, COLOR_JUIZ, "  a competÍncia na profiss„o concedida: isto inclui: todas profissıes policiais");
        SendClientMessage(playerid, COLOR_JUIZ, "  8∫ Deve-se respeitar a lÛgica do RPG, n„o È permitido um numÈro desequilibrado de profissıes.");
        SendClientMessage(playerid, COLOR_JUIZ, "  9∫ A n„o obediÍncia destas regras dispostas implicar· desde advertÍncia ‡ exclus„o permanente do servidor. ");
        SendClientMessage(playerid, COLOR_JUIZ, "  10∫ Skin para: Policiais, Advogados, Delegado e Juiz sao predeterminadas, alteraÁıes somente para: Cop 280 ‡ 285.Demais: 147,164,166,37. ");
		SendClientMessage(playerid, COLOR_JUIZ, "  11∫ Nenhum jogador poder· setar a casa de outro no ar, isso poder· acarretar na perca do emprego e atÈ mesmo em banimento do servidor.");
		SendClientMessage(playerid, COLOR_WHITE,  "  A finalidade das regras s„o afim de garantir organizaÁ„o, e claro, divers„o no mode Reload Virtual Life RpG.");
		return 1;
	}
	if(strcmp(cmd, "/acoes", true) == 0) {
	    SendClientMessage(playerid, COLOR_RED2,  "AÁıes do Reload Virtual Life RpG:");
	    SendClientMessage(playerid, COLOR_WHITE, "/mundovirtual  | /render | /bebado | /cover | /crack");
        SendClientMessage(playerid, COLOR_WHITE, "/plantarbomba  | /beijar | /gunarrest | /dancar [1-3]");
        SendClientMessage(playerid, COLOR_WHITE, "/sentar | /fu  | /punheta | /esconder-se | /aparecer | /mijar ");
        SendClientMessage(playerid, COLOR_WHITE, "/dodge | /rcglobin | /rcbaron | /sair-rc | /falar.");
        SendClientMessage(playerid, COLOR_WHITE, "/vomitar | /fumar2.");
		return 1;
	}
	if(strcmp(cmd, "/hotelinfo", true) == 0) {
    	SendClientMessage(playerid, COLOR_VERDE_AQUA, "O hotel serve como moradia tempor·ria. Para ficar hospedado digite /hotel");
        SendClientMessage(playerid, COLOR_VERDE_AQUA, "O custo da hospedagem È $1500 dolares, poder· ficar hospedado atÈ ter");
        SendClientMessage(playerid, COLOR_VERDE_AQUA, "condiÁıes financeiras para poder comprar primeiramente 1 casa e logo em seguida 1 carro");
        return 1;
    }
    if(strcmp(cmd, "/veiculos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"VeÌculos do Reload Virtual Life RpG -  escolha um estilo de carro");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/sedans     -    /aereos");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/4portas    -    /barcos");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/muscle     -    /lowriders");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/esportivos -    /recreacionais");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/corrida    -    /motos");
		SendClientMessage(playerid, COLOR_GREEN, 		"/pesados");
		return 1;
	}
    if(strcmp(cmd, "/sedans", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Sedans do Reload Virtual Life RpG");
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
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"AÈreos do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/519 - Shamal 1545000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/487 - Maverick 845000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/593 - Dodo 845000");
		return 1;
	}
    if(strcmp(cmd, "/4portas", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"4 Portas do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/409 - Stretch 80000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/445 - Admiral 35000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/405 - Sentinel 35000");
		return 1;
	}
    if(strcmp(cmd, "/barcos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Barcos do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Barco  -  PreÁo");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/493 - Jetmax 608000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/453 - Reefer 180000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/473 - Dinghy 50000");
		return 1;
	}
    if(strcmp(cmd, "/muscle", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Muscles do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/402 - Buffalo 95000");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/603 - Phoenix 75000");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/475 - Sabre 19000");
		return 1;
	}
	if(strcmp(cmd, "/esportivos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Esportivos do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/560 - Sultan  105000");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/559 - Jester  85000");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/529 - Banshee 50000");
		return 1;
	}
	if(strcmp(cmd, "/corrida", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Carros Esportivos e de Corrrida do Reload Virtual Life RpG");
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
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"VeÌculos Recreacionais do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/444 - Monster 115000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/424 - BF Injection 15000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/471 - Quad 9000");
		return 1;
	}
	if(strcmp(cmd, "/pesados", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"VeÌculos Pesados do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_GREEN, 		"/444 - Monster 115000");
		SendClientMessage(playerid, COLOR_GREEN, 		"/515 - RoadTrain 67000");
		SendClientMessage(playerid, COLOR_GREEN, 		"/400 - Landstalker 30000");
		return 1;
	}
	if(strcmp(cmd, "/lowriders", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Low Riders do Reload Virtual Life RpG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  PreÁo");
		SendClientMessage(playerid, COLOR_WHITE, 		"/535 - Slamvan 25000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/536 - Blade 20000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/534 - Remington 20000");
		return 1;
	}
	if(strcmp(cmd, "/motos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Motos do Reload Virtual Life RpG");
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
	    SendClientMessage(playerid, COLOR_WHITE,       "HabilitaÁıes:");
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "Terrestre - Sem teste: $1200 | Com teste: $800");
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "Na˙tica - Sem teste: $1600 | Com teste: $1200");
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "AÈrea - Sem teste: $2400 | Com teste: $2000");
	    SendClientMessage(playerid, COLOR_WHITE,       "Reload Virtual Life RpG mais que um RPG, UMA VIDA!");
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
				StatusCheck[playerid] = NONEE;
				new randtrash = random(73);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,LixeirasCheckpoints[randtrash][0],LixeirasCheckpoints[randtrash][1],LixeirasCheckpoints[randtrash][2],3.0);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Apenas lixeiros podem utilizar esse comando.");
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
						if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 408){
						    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um caminh„o Trashmaster!");
						    return 1;
						} else {
						    MissaoLixeiro[playerid] = 0;
						    LixoColetado[playerid] = 0;
						    DisablePlayerCheckpoint(playerid);
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
	    new tmp[256],cellowner[256],str[256];
	    tmp = strtok(cmdtext,idx);
	    if(dini_Int(PlayerName(playerid),"PhoneNumb")==0){
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
	        return 1;
		}
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Uso correto: /chamar [n˙mero-do-celular]");
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
		if(CellCredits[playerid] == 0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem crÈditos suficientes para originar uma chamada. MÌnimo: 2");
		    return 1;
		}
		new calledid = GetPlayerID(cellowner);
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
	    if(dini_Int(PlayerName(playerid),"PhoneNumb")==0){
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
		if(dini_Int(PlayerName(playerid),"PhoneNumb") == 0){
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
		format(string, sizeof(string), "De: %s (%d). Conte˙do: %s", PlayerName(playerid),dini_Int(PlayerName(playerid),"PhoneNumb"),tmp2);
		SendClientMessage(calledid,COLOR_WHITE,string);
		SendClientMessage(playerid, COLOR_WHITE, "Mensagem Enviada");
		format(string, sizeof(string), "Agora lhe sobraram %d crÈditos.", CellCredits[playerid]);
		SendClientMessage(playerid, COLOR_GREEN, string);
		format(string,sizeof(string), "SMS de %s para %s: %s",PlayerName(playerid),PlayerName(calledid),tmp2);
		writelog(string);
		return 1;
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
		if(dini_Int(PlayerName(playerid),"PhoneNumb") == 0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
		    return 1;
		}
	    if(AreaCreditos[playerid] == 1){
	        if(creditos + CellCredits[playerid] < 100){
	            CellCredits[playerid] = creditos+CellCredits[playerid];
			    dini_IntSet(PlayerName(playerid),"CreditosCell",CellCredits[playerid]);
			    format(tmp, sizeof(tmp), "Seu celular foi recarregado. Um total de %d crÈditos foi colocado.", creditos);
				SendClientMessage(playerid, COLOR_GREEN, tmp);
				GivePlayerMoney(playerid, - creditos);
				return 1;
			}
			if(creditos + dini_Int(PlayerName(playerid),"CreditosCell") > 99){
			    new quantia;
			    quantia = 100 - CellCredits[playerid];
			    CellCredits[playerid] = 100;
				dini_IntSet(PlayerName(playerid),"CreditosCell",100);
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
		if(dini_Int(PlayerName(playerid),"PhoneNumb") == 0){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
		    return 1;
		}
		else{
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			format(string, sizeof(string), "[Virtual Telefonia]: VocÍ tem %d crÈditos.", dini_Int(PlayerName(playerid),"CreditosCell"), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SetTimerEx("AcaoEspecial",6000,0,"dxs",playerid,COLOR_COP_SWAT,string);
			return 1;
		}
	}

	if (strcmp(cmd, "/numero", true) == 0){
	    new tmp[256],encontrado;
	    new string[256];
		if (dini_Int(PlayerName(playerid),"Agenda") == 1)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /numero [nome]");
				return 1;
			}
			new File:fohnd;
			new tmpres[MAX_STRING];
			new tmpres2[MAX_STRING];
			tmpres[0]=0;
			fohnd=fopen("celulares.rpg",io_read);
			if (!fohnd) SendClientMessage(playerid,COLOR_RED,"Houve um erro com a base de dados");
			while (fread(fohnd,tmpres)) {
				StripNewLine(tmpres);
				if (equal(dini_PRIVATE_ExtractValue(tmpres),tmp,true)) {
					/* We've got what we need */
					tmpres2[0]=0;
					strcat(tmpres2,dini_PRIVATE_ExtractKey(tmpres));
					fclose(fohnd);
					encontrado=1;
					format(string,256,"Nome:%s, N˙mero:%s",tmp,tmpres2);
					SendClientMessage(playerid,COLOR_YELLOW,string);
					return 1;
				}
			}
			if(!encontrado){
			    SendClientMessage(playerid,COLOR_RED,"N„o foi encontrado nenhum registro para seus critÈrios de pesquisa.");
			    return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_GRAD1, "VocÍ n„o tem uma agenda telefÙnica!");
			return 1;
		}
	}
	if (strcmp(cmd, "/agenda", true) == 0){
        if(GetPlayerMoney(playerid) < 500){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar.");
			return 1;
		}
		if(dini_Int(PlayerName(playerid),"Agenda") == 1){
			SendClientMessage(playerid, COLOR_WHITE, "VocÍ j· tem agenda telefÙnica.");
			return 1;
		}
		new string[256];
   		GivePlayerMoney(playerid,-500);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		Agenda[playerid] = 1;
		format(string, sizeof(string), "Agenda TelefÙnica comprada, agora vocÍ poder· ver n˙meros telefÙnicos.");
		SendClientMessage(playerid, COLOR_ROSA, string);
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /numero <nome>.");
        dini_IntSet(PlayerName(playerid),"Agenda", 1);
		return 1;
	}

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
			SendClientMessage(playerid, COLOR_GRAD1, "Administradores n„o podem ser tirados do jogo");
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
				format(string, sizeof(string), "%d n„o e um jogador ativo.", giveplayerid);
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
			SendClientMessage(playerid, COLOR_GRAD1, "N„o h· voto em progresso para esse jogador");
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
			format(string, sizeof(string), "%d n„o e um jogador ativo.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}

//COMANDOS PARA TODOS JOGADORES

    if(strcmp(cmd,"/mandarmatar",true) == 0){
        new tmp[256];
		new plid,valor;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /mandarmatar [id] [valor]");
			return 1;
		}
		tmp = strtok(cmdtext,idx);
		valor = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /mandarmatar [id] [valor]");
			return 1;
		}
		if(!IsPlayerConnected(plid)){
			SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
			return 1;
		}
		if(GetPlayerMoney(playerid) < valor){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue esse dinheiro!");
		    return 1;
		}
		if(Profissao[playerid] == ASSASSINO){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ È assassino! N„o pode colocar a cabeÁa de alguÈm em prÍmio.");
		    return 1;
		}
		if(plid == playerid){
		    SendClientMessage(playerid, COLOR_RED, "WHAT?! Est· querendo se matar?");
		    return 1;
		}
		else{
		    ValorCabeca[plid] = ValorCabeca[plid] + valor;
		    SendClientMessage(playerid, COLOR_GREEN, "PrÍmio colocado! Se a polÌcia descobrir que vocÍ ofereceu essa grana,");
		    SendClientMessage(playerid, COLOR_GREEN, "vocÍ ir· ser preso... CUIDADO!!");
		    for(new i=0; i<MAX_PLAYERS; i++){
				if(Profissao[i] == ASSASSINO || IsPlayerAdmin(i)){
		    		new str[256];
		    		format(str,sizeof(str),"Um indivÌduo est· oferecendo $%d pela cabeÁa de %s",valor,PlayerName(plid));
					SendClientMessage(i, COLOR_ASSASSINO, str);
					format(str,sizeof(str),"Agora a cabeÁa de %s est· valendo $%d",PlayerName(plid),ValorCabeca[plid]);
					SendClientMessage(i, COLOR_ASSASSINO, str);
		        }
			}
			new rand = random(5);
			if(rand == 0 || rand == 1 || rand == 2){
			    SendClientMessage(playerid, COLOR_GREEN, "Sorte sua... A polÌcia nem chegou ‡ saber que vocÍ colocou esse prÍmio!");
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "VocÍ acabar de se dar mal... Os cops descobriram o seu prÍmio! Agora vocÍ est· em cana...");
				new str[256];
				format(str,sizeof(str),"AVISO: %s acaba de oferecer $%d pela cabeÁa de %s! Prenda-o.");
				SendClientMessagePolicia(COLOR_WHITE, str);
			}
			return 1;
		}
	}
	if(strcmp(cmd, "/taxi", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_TAXISTA, "Os taxistas foram informados.");
	    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == TAXISTA || Profissao[i] == MOTOTAXI){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um taxi em: %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_TAXISTA, string);
				format(string,sizeof(string),"SERVIDOR: %s pediu um taxi.",PlayerName(playerid));
				writelog(string);
		        }
       		}
		return 1;
	}
	if(strcmp(cmd, "/taxiaereo", true)==0){
		new string[256];
		SendClientMessage(playerid, COLOR_TAXI_AEREO, "Os pilotos j· foram informados.");
		for(new i=0; i<MAX_PLAYERS; i++){
			if(Profissao[i] == TAXI_AEREO){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um taxi aÈreo em: %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_TAXI_AEREO, string);
				format(string,sizeof(string),"SERVIDOR: %s pediu um taxi aÈreo.",PlayerName(playerid));
				writelog(string);
		        }
       		}
		return 1;
	}
	if(strcmp(cmd, "/diskdroga", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_TAXISTA, "Os traficantes/lideres de tr·ficos foram informados.");
	    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == TRAFICANTE || Profissao[i] == LIDER_DE_TRAFICO || IsPlayerAdmin(i)){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s pediu uma droga em: %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, GetPlayerColor(i), string);
				format(string,sizeof(string),"SERVIDOR: %s pediu uma droga.",PlayerName(playerid));
				writelog(string);
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
			SendClientMessage(playerid,COLOR_COP_SWAT,"Os policiais foram informados.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == EXERCITO || Profissao[i] == COP_MILITAR || Profissao[i] == DELEGADO || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_SWAT){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_SWAT, string);
					writelog(string);
		        }
			}
            return 1;
		}
 	}
 	if (strcmp(cmd, "/c", true)==0){
 	    new tmp[256];
 	    strmid(tmp,cmdtext, 2, strlen(cmdtext));
 	    if(!strlen(tmp)){
 	        SendClientMessage(playerid, COLOR_RED, "USO: /c [mensagem]");
 	        return 1;
		}
		if(!IsPlayerInAnyVehicle(playerid)){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
		    return 1;
		}
		else{
		    new veh = GetPlayerVehicleID(playerid);
		    new string[256];
		    for(new i=0; i<MAX_PLAYERS; i++){
				if(IsPlayerInVehicle(i,veh)){
					format(string,sizeof(string),"[VEICULO] %s",tmp);
					SendPlayerMessageToPlayer(i,playerid,string);
				}
			}
			return 1;
		}
	}
 	if (strcmp(cmd, "/admin", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 6, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "USO: /admin [mensagem]");
			return 1;
		}
		else{
			format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
			SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, string);
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i)){
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_ENTREGADOR_PIZZA, string);
		        }
			}
            return 1;
		}
 	}
 	if (strcmp(cmd, "/admins", true)==0){
 	    SendClientMessage(playerid, COLOR_GREEN, "|=======| ADMINS |=======|");
 	    new string[256];
 	    for(new i=0; i<MAX_PLAYERS; i++){
 	        if(IsPlayerAdmin(i)){
 	            format(string,sizeof(string),"ID: %d | Nome: %s",i,PlayerName(i));
 	            SendClientMessage(playerid, COLOR_WHITE, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/192", true)==0){
		new string[256];
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		SendClientMessage(playerid,COLOR_COP_SWAT,"Os paramedicos j· foram informados.");
		for(new i=0; i<MAX_PLAYERS; i++){
			if(Profissao[i] == PARAMEDICO || IsPlayerAdmin(i)){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um AMBUL¬NCIA nas proximidades de: %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_EMERGENCIA, string);
				format(string,sizeof(string),"SERVIDOR: %s pediu uma ambul‚ncia.",PlayerName(playerid));
				writelog(string);
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
				format(string,sizeof(string),"%s precisa de um Mec‚nico em: %s",name,zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_MECANICO, string);
				format(string,sizeof(string),"SERVIDOR: %s pediu um mec‚nico.",PlayerName(playerid));
				writelog(string);
			}
       	}
		return 1;
	}
	if(strcmp(cmd, "/trocarposicao", true) == 0) {
	    if(IsPlayerInAnyVehicle(playerid)){
			if(!strcmp(Dono[GetPlayerVehicleID(playerid)],PlayerName(playerid),true)){
			    new Float:X,Float:Y,Float:Z,Float:ang;
			    GetVehiclePos(GetPlayerVehicleID(playerid),X,Y,Z);
			    GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
			    SaveCarPos(GetPlayerVehicleID(playerid),X,Y,Z,ang);
			    SendClientMessage(playerid, COLOR_WHITE, "PosiÁ„o salva!");
			    return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono do veÌculo!");
			    return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
			return 1;
			}
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
				format(string, sizeof(string), "%s - %d estrelas", PlayerName(i), GetPlayerWantedLevel(i));
				SendClientMessage(i, COLOR_YELLOW, string);
				return 1;
			}
		}
		return 1;
	}

    if(strcmp(cmd, "/data", true) == 0) {
		new Ptmess[256];
        format(Ptmess, sizeof(Ptmess), "Hoje È %s! dia %d/%d/%d", DiaName[ValorDia], DiaJogo, MesJogo, AnoJogo);
        SendClientMessage(playerid, COLOR_GREEN, Ptmess);
        return 1;
	}
	if(strcmp(cmd, "/horas", true) == 0) {
		new Ptmess[256];
		if(MinutoJogo < 10){
 			format(Ptmess, sizeof(Ptmess), "Agora s„o %d:0%d",HoraJogo, MinutoJogo);
		}
		if(MinutoJogo >= 10){
		    format(Ptmess,sizeof(Ptmess),"Agora s„o %d:%d",HoraJogo, MinutoJogo);
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

    if(strcmp(cmd, "/meubanco", true) == 0) {
        if(AreaBanco[playerid] == 1){
            new caixa;
            SetPlayerPos(playerid,Caixas[caixa][0],Caixas[caixa][1],Caixas[caixa][2]);
            SetPlayerFacingAngle(playerid, 270);
	   		ShowMenuForPlayer(BancoOpc,playerid);
	   		TogglePlayerControllable(playerid,0);
	   		return 1;
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· no Banco.");
		    return 1;
		}
	}

	if(strcmp(cmd, "/saldocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 5){
            SendClientMessage(playerid, COLOR_YELLOW, "Custo: $5");
			return 1;
		}
	    if(dini_Int(PlayerName(playerid),"PhoneNumb")==0){
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem celular!");
	        return 1;
		}
		else{
		    GivePlayerMoney(playerid, 0 - 5);
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			format(string, sizeof(string), "Mensagem de Virtual Bankline: VocÍ tem $%d em sua conta.", dini_Int(PlayerName(playerid),"Banco"), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SetTimerEx("AcaoEspecial",6000,0,"dxs",playerid,COLOR_COP_SWAT,string);
			return 1;
		}
	}
	if(strcmp(cmd, "/retirartxt", true) == 0) {
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
		    	SendClientMessage(playerid, COLOR_RED, "Sai· do veÌculo para usar este comando!");
		    	return 1;
		    }
			else{
		    	TextDrawHideForPlayer(playerid,Bemvindo);
		    	TextDrawHideForPlayer(playerid,Speedo[playerid]);
		    	TextDrawHideForPlayer(playerid,tdStrip);
		    	TextDrawHideForPlayer(playerid,tdDesmanche);
		    	TextDrawHideForPlayer(playerid,tdLixao);
		    	TextDrawHideForPlayer(playerid,tdPizzaria);
		    	TextDrawHideForPlayer(playerid,tdColheita);
		    	TextDrawHideForPlayer(playerid,tdPlant);
		    	TextDrawHideForPlayer(playerid,tdLeite);
		    	TextDrawHideForPlayer(playerid,Banco);
		    	TextDrawHideForPlayer(playerid,Posto);
		    	TextDrawHideForPlayer(playerid,tdForte);
		    	TextDrawHideForPlayer(playerid,Delegacia);
		    	TextDrawHideForPlayer(playerid,Hospital);
		    	TextDrawHideForPlayer(playerid,tdPesca);
		    	TextDrawHideForPlayer(playerid,tdCoopPesca);
		    	TextDrawHideForPlayer(playerid,Hotel);
		    	TextDrawHideForPlayer(playerid,tdPdCarga);
		    	TextDrawHideForPlayer(playerid,tdConstrucao);
		    	TextDrawHideForPlayer(playerid,td247);
		    	TextDrawHideForPlayer(playerid,tdAreaCarga);
		    	TextDrawHideForPlayer(playerid,tdStrip);
		    	TextDrawHideForPlayer(playerid,tdAreaDescarga);
		    	TextDrawHideForPlayer(playerid,tdSorveteria);
		    	TextDrawHideForPlayer(playerid,tdLocadora);
		    	TextDrawHideForPlayer(playerid,tdBar);
		    	TextDrawHideForPlayer(playerid,tdLoteria);
		    	SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "Textos retirados!");
		    	return 1;
			}
	}

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
	if(strcmp(cmd, "/apostarcavalo", true) == 0){
	    new tmp[256];
	    new cavaloid;
	    new valor;
	    tmp = strtok(cmdtext,idx);
	    cavaloid = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /apostarcavalo [cavalo] [quantia]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
		valor = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /apostarcavalo [cavalo] [quantia:de $300 atÈ $10.000]");
			return 1;
		}
		if(AreaLCavalos[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na loteria de cavalos!");
		    return 1;
		}
		if(cavaloid < 1 || cavaloid > 8){
		    SendClientMessage(playerid, COLOR_RED, "Aposte em um cavalo de 1 ‡ 8.");
		    return 1;
		}
		if(valor < 300 || valor > 10000){
		    SendClientMessage(playerid, COLOR_RED, "Quantia de $300 atÈ $10.000.");
		    return 1;
		}
		if(GetPlayerMoney(playerid) < valor){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro para comprar o TICKET, custo: $300");
		    return 1;
		}
		if(CPlayerDentro[playerid] == true){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ j· comprou um TICKET, agora espere o sorteio!");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"VocÍ apostou $%d no cavalo %d. Boa sorte!",valor,cavaloid);
		    SendClientMessage(playerid, COLOR_BARMAN, string);
		    GivePlayerMoney(playerid,-valor);
		    ValorApostado[playerid] = valor;
		    CavaloApostado[playerid] = cavaloid;
		    CPlayerDentro[playerid] = true;
		    TemJogador = 1;
		    return 1;
		}
	}
	
	if(strcmp(cmd, "/loteria", true) == 0) {
	    new no1[256], no2[256];
		no1 = strtok(cmdtext, idx);
		no2 = strtok(cmdtext, idx);
 		if(!strlen(no1) || !strlen(no2)){
			return SendClientMessage(playerid, COLOR_GREEN, "USE: /loteria [0-20] [0-20]");
		}
		if(strval(no1) < 0 || strval(no1) > 20){
			return SendClientMessage(playerid, COLOR_GREEN, "USE: /loteria [0-20] [0-20]");
		}
		if(strval(no2) < 0 || strval(no2) > 20){
			return SendClientMessage(playerid, COLOR_GREEN, "USE: /loteria [0-20] [0-20]");
		}
		if(strval(no1) == strval(no2)){
			return SendClientMessage(playerid, COLOR_GREEN, "USE: /loteria [0-20] [0-20] - N˙meros DIFERENTES!!!");
		}
		if(PlayerDentro[playerid] == true){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ j· tem um bilhete!");
		    return 1;
		}
		if(AreaLoteria[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na loteria!");
		    return 1;
		}
		if(GetPlayerMoney(playerid) >= 500){
		    GivePlayerMoney(playerid,-500);
		    PlayerDentro[playerid]=true;
		    Aposta[playerid][0]=strval(no1);
		    Aposta[playerid][1]=strval(no2);
		    new string[256];
		    format(string, sizeof(string), "Obrigado por apostar. Seus n˙meros da loteria s„o: %d, %d ! Espere o Resultado.", strval(no1), strval(no2));
            return SendClientMessage(playerid, COLOR_ORANGE, string);
		} else {
		    SendClientMessage(playerid, COLOR_RED, "O TICKET custa $500 dÛlares");
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
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar.");
			return 1;
		}
		if(!IsPlayerInAnyVehicle(playerid)){
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em nenhum veÌculo!");
		    return 1;
		}
		if(GPV[GetPlayerVehicleID(playerid)] == -1){
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pode abastecer esse veÌculo!");
			return 1;
		}
		if(AreaPosto[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um posto, consulte o mapa no fÛrum para saber sua localizaÁ„o");
			return 1;
		}
		new currentgas = GPV[GetPlayerVehicleID(playerid)];
		if(quantidade + currentgas < 100){
   			SetTimerEx("AplicarGasosa",quantidade*150,0,"ddd",playerid,GetPlayerVehicleID(playerid),quantidade+currentgas);
		    TogglePlayerControllable(playerid,0);
		    SendClientMessage(playerid,COLOR_RED2,"Abastecendo...");
		    format(string, sizeof(string), "Espere o abastecimento completar. Ser„o colocados %d litros.", quantidade);
			SendClientMessage(playerid, COLOR_GREEN, string);
			GivePlayerMoney(playerid, - quantidade);
			format(string,256,"No total, seu tanque ter· %d litros de combustÌvel.",quantidade+currentgas);
			SendClientMessage(playerid,COLOR_YELLOW,string);
			AcrescentarLucro(7,quantidade*2);
			return 1;
		}
		else if(quantidade + currentgas > 99){
		    new quantia;
		    quantia = 100 - currentgas;
			SetTimerEx("AplicarGasosa",quantia*150,0,"ddd",playerid,GetPlayerVehicleID(playerid),100);
			TogglePlayerControllable(playerid,0);
		    SendClientMessage(playerid,COLOR_RED2,"Abastecendo...");
			format(string, sizeof(string), "Espere o abastecimento completar. Seu tanque ser· enchido com %d litros.", quantia);
			SendClientMessage(playerid, COLOR_GREEN, string);
			GivePlayerMoney(playerid, - quantia);
			format(string,256,"No total, seu tanque ter· %d litros de combustÌvel.",quantidade+currentgas);
			SendClientMessage(playerid,COLOR_YELLOW,string);
			AcrescentarLucro(7,quantia*2);
			return 1;
		}
	}

	if(strcmp(cmd,"/colocargas",true)==0){
	    if(Profissao[playerid] == FRENTISTA || IsPlayerAdmin(playerid)){
			new tmp[256],plid,quantidade,string[256],distancia;
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
			if(quantidade < 1 || quantidade > 100){
			    SendClientMessage(playerid,COLOR_RED,"Somente de 1 ‡ 100");
			    return 1;
			}
			distancia = GetDistanceBetweenPlayers(playerid, plid);
		 	if(distancia > 15){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
			new currentgas = GPV[GetPlayerVehicleID(plid)];
			if(quantidade + currentgas < 100){
			    GPV[GetPlayerVehicleID(plid)] = quantidade+currentgas;
			    format(string, sizeof(string), "Seu carro foi abastecido e um total de %d litros foi colocado.", quantidade);
				SendClientMessage(plid, COLOR_FRENTISTA, string);
				GivePlayerMoney(plid,- quantidade);
				GivePlayerMoney(playerid,quantidade);
				SendClientMessage(playerid,COLOR_YELLOW,"Miss„o cumprida!");
				format(string,sizeof(string),"**** %s acabou de abastecer %d litros de combustÌvel de um veÌculo! ****",PlayerName(playerid),quantidade);
				SendClientMessageAdmin(COLOR_FRENTISTA, string);
				if(JogadorContratado(playerid,7)) AcrescentarLucro(7,quantidade*2);
				if(CarroAbastecido[GetPlayerVehicleID(plid)] == 0){
					CarroAbastecido[GetPlayerVehicleID(plid)]=1;
					SetTimerEx("ZerarCarroAbastecido",130000,false,"d",GetPlayerVehicleID(plid));
					AcrescentarExPoints(playerid,1);
				}
				TogglePlayerControllable(plid,1);
				return 1;
			}
			if(quantidade + currentgas > 99){
			    new quantia;
			    quantia = 100 - currentgas;
			    GPV[GetPlayerVehicleID(plid)] = 100;
				format(string, sizeof(string), "O tanque de seu carro est· cheio, foram colocados %d litros.", quantia);
				SendClientMessage(plid, COLOR_FRENTISTA, string);
				GivePlayerMoney(plid, - quantia);
				GivePlayerMoney(playerid,quantia);
				format(string,sizeof(string),"**** %s acabou de abastecer %d litros de combustÌvel de um veÌculo! ****",PlayerName(playerid),quantia);
				SendClientMessageAdmin(COLOR_FRENTISTA, string);
				if(JogadorContratado(playerid,7)) AcrescentarLucro(7,quantidade*2);
				if(CarroAbastecido[GetPlayerVehicleID(plid)] == 0){
					CarroAbastecido[GetPlayerVehicleID(plid)]=1;
					SetTimerEx("ZerarCarroAbastecido",130000,false,"d",GetPlayerVehicleID(plid));
					AcrescentarExPoints(playerid,1);
				}
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
			if(Profissao[plid] == PROSTITUTA){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode transar com si mesma.");
				return 1;
			}
			else {
				SendClientMessage(plid, COLOR_ROSA, "A prostituta est· lhe oferecendo uma transa numa cama bem confort·vel!");
				SendClientMessage(plid, COLOR_ROSA, "Se quiser transar com a prostituta basta digitar /aceitotransar se n„o /naotransar.");
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
			GivePlayerMoney(playerid,-300);
			GivePlayerMoney(Prostitutacama[playerid],300);
			SetPlayerPos(Prostitutacama[playerid], 2206.5156,-1071.4319,1051.0058);
	        SetPlayerPos(playerid, 2205.2402,-1076.3251,1050.4844);
	        SetPlayerInterior(playerid,1);
	        SetPlayerInterior(Prostitutacama[playerid],1);
	        SendClientMessage(playerid, COLOR_ROSA2, "Para -meter- digite /meter");
	        SendClientMessage(playerid, COLOR_ROSA2, "Para sair basta entrar no CheckPoint que est· prÛximo a porta!");
	   	    SetPlayerCheckpoint(playerid,2211.9827,-1076.0026,1050.4844,3.0);
	   	    if(JogadorContratado(Prostitutacama[playerid],6)) AcrescentarLucro(6,200);
	        nCheckpointStatus[playerid] = NACAMA;
	        AcrescentarExPoints(Prostitutacama[playerid],1);
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
	if(strcmp(cmd,"/pagarstrip",true) == 0){
		new tmp[256];
		new plid,pickupmoney;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COLOR_RED, "USO: /pagarstrip [ID/da/striper]");
		return 1;
		}
		if(plid == playerid){
		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode pagar vocÍ mesmo!");
		return 1;
		}
		if(FazendoStrip[playerid] == 1){
		SendClientMessage(playerid, COLOR_RED, "Sinto muito vocÍ est· fazendo strip-tease no momento!");
		return 1;
		}
		if(Profissao[plid] != PROSTITUTA){
		SendClientMessage(playerid, COLOR_RED, "Ei, esse jogador n„o È Prostituta!");
		return 1;
		}
		if(FazendoStrip[plid] == 0){
		SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· fazendo strip!");
		return 1;
		}
		if(GetDistanceBetweenPlayers(playerid,plid) > 10){
		SendClientMessage(playerid, COLOR_RED, "Chegue mais perto!");
		return 1;
		}
		if(GetPlayerMoney(playerid) < 50){
		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro!");
		return 1;
		}
		else{
			TogglePlayerControllable(playerid,0);
			GivePlayerMoney(plid,50);
			GivePlayerMoney(playerid,-50);
			SendClientMessage(playerid, COLOR_ROSA, "VocÍ pagou $50 para a striper!");
			new str[256];
			format(str,sizeof(str),"O jogador %s lhe pagou $50 pelo strip-tease!",PlayerName(playerid));
			SendClientMessage(plid, COLOR_ROSA, str);
			KillTimer(TimerStrip[plid]);
			FST[plid] = 1;
			ApplyAnimation(playerid,"STRIP","PLY_CASH",4.1,0,1,1,1,1);
			ApplyAnimation(plid,"STRIP","STR_A2B",4.1,0,1,1,1,1);
			TimerStrip[plid] = SetTimerEx("FazendoStripTease",4500,false,"d",plid);
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(plid,X,Y,Z);
			if(JogadorContratado(plid,6)) AcrescentarLucro(6,200);
			pickupmoney = CreatePickup(1212,1,X+0.1,Y,Z-100);
			SetTimerEx("DestruirPickupGrana",1300,false,"dd",playerid,pickupmoney);
			return 1;
			}
	}
	if(strcmp(cmd,"/fazerstrip",true) == 0){
   		if(Profissao[playerid] == PROSTITUTA){
	  		if(AreaStrip[playerid] == 1){
	  			ApplyAnimation(playerid,"STRIP","STR_Loop_A",4.1,0,1,1,1,1);
	  			FazendoStrip[playerid] = 1;
	  			TogglePlayerControllable(playerid,0);
	  			SendClientMessage(playerid, COLOR_ROSA, "O strip comeÁou!");
	  			SendClientMessage(playerid, COLOR_ROSA, "Digite as teclas:");
	  			SendClientMessage(playerid, COLOR_ROSA, "NumLock 4, NumLock 6, CapsLock 2, ENTER");
	  			SendClientMessage(playerid, COLOR_ROSA, "Para parar de fazer strip-tease digite /pararstrip");
	  			TimerStrip[playerid] = SetTimerEx("FazendoStripTease",100,false,"d",playerid);
	  			return 1;
  			}
  			else{
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na boate.");
				return 1;
				}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Prostituta!");
			return 1;
			}
	}
    if(strcmp(cmd,"/pararstrip",true) == 0){
	   if(FazendoStrip[playerid] == 0){
	   		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· fazendo strip!");
			return 1;
	   }
	   else{
		   FazendoStrip[playerid] = 0;
		   KillTimer(TimerStrip[playerid]);
		   FST[playerid] = 0;
		   TogglePlayerControllable(playerid,1);
		   SendClientMessage(playerid, COLOR_ROSA, "O strip acabou!");
		   return 1;
		   }
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
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode fazer strip-tease para si mesma.");
				return 1;
			}
			else {
				SendClientMessage(plid, COLOR_ROSA, "A prostituta est· lhe oferecendo um strip tease na boate.");
				SendClientMessage(plid, COLOR_ROSA, "Se quiser assistir basta digitar /aceitostrip se n„o /recusarstrip.");
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
	        SetPlayerPos(Prostitutacama2[playerid], 1208.7369,-6.3787,1001.3281);
	        SetPlayerPos(playerid, 1204.4965,-6.4623,1000.9219);
	        SetPlayerInterior(playerid,2);
	        SetPlayerInterior(Prostitutacama2[playerid],2);
	        GivePlayerMoney(Prostitutacama2[playerid], 200);
			GivePlayerMoney(playerid, -200);
			if(JogadorContratado(Prostitutacama2[playerid],6)) AcrescentarLucro(6,300);
			SendClientMessage(playerid, COLOR_ROSA2,"VocÍ pagou para a prostituta $200 pelo strip!");
			AcrescentarExPoints(Prostitutacama2[playerid],1);
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
			new plid,valor;
			new string[256];
			new tmp[256];
			new distancia;
			tmp = strtok(cmdtext, idx);
			plid = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED2, "/casa [id] [valor]");
				return 1;
			}
			tmp = strtok(cmdtext,idx);
			valor = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED2, "/casa [id] [valor]");
				return 1;
			}
			if(GetPlayerMoney(plid) < valor){
			    SendClientMessage(playerid, COLOR_RED2, "Esse jogador n„o possue dinheiro!");
			    return 1;
			}
			distancia = GetDistanceBetweenPlayers(playerid, plid);
		 	if(distancia > 30){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto.");
				return 1;
			}
			if(valor == 5000 || valor == 10000 || valor == 20000 || valor == 40000 || valor == 60000 || valor == 80000 || valor == 100000 || valor == 200000){
    			if(dini_Exists(PlayerName(plid))) {
	                if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			            invitestatus[plid] = INVITE_CASA;
						envconvite[plid] = playerid;
						new Float:X,Float:Y,Float:Z,Float:ang;
						GetPlayerPos(playerid,X,Y,Z);
						GetPlayerFacingAngle(playerid,ang);
						iX[plid] = X;
						iY[plid] = Y;
						iZ[plid] = Z;
						iang[plid] = ang;
						ivalorcasa[plid] = valor;
						SendClientMessage(playerid, COLOR_GREEN, "”timo! Agora espere o outro jogador aceitar a casa.");
						format(string,sizeof(string),"O Corretor %s est· lhe oferecendo uma casa em %s por $%d",PlayerName(playerid),zones[player_zone[playerid]][zone_name], valor);
						SendClientMessage(plid, COLOR_CORRETOR, string);
						SendClientMessage(plid, COLOR_CORRETOR, "Para aceitar digite: /aceitar e para recusar digite: /recusar");
		    	    	return 1;
					} else {
		   				SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
						return 1;
					}
				}
			} else {
		   		SendClientMessage(playerid, COLOR_RED2, "/casa [id] [valor]. OBS: Valores dos imÛveis: 5.000, 10.000, 20.000, 40.000, 60.000, 80.000, 100.000 e 200.000 mil dÛlares");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Corretor de Imoveis");
			return 1;
		}
	}

	if(strcmp(cmd, "/hotel", true) == 0) {
    	new tmp[256];
		if(AreaHotel[playerid] == 1){
			if(GetPlayerMoney(playerid) < 1500){
       			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem com vocÍ $1500 para pagar.");
				return 1;
			} else {
				if(dini_Exists(PlayerName(playerid))) {
	    			new Float:X, Float:Y, Float:Z, Float:ang;
	    			format(tmp,sizeof(tmp),"%s",PlayerName(playerid));
	    			GetPlayerPos(playerid, X, Y, Z);
	    			GetPlayerFacingAngle(playerid,ang);
					dini_FloatSet(tmp,"SpawnPosX",X);
					dini_FloatSet(tmp,"SpawnPosY",Y);
					dini_FloatSet(tmp,"SpawnPosZ",Z);
			    	dini_FloatSet(tmp,"SpawnPosAng", ang);
	    			GivePlayerMoney(playerid,-1500);
	    			SendClientMessage(playerid, COLOR_GREEN, "Agora vocÍ est· hospedado aqui. Obrigado por escolher este Hotel.");
		           	SendClientMessage(playerid, COLOR_GREEN, "VocÍ ficar· hospedado atÈ ter um emprego e condiÁıes de comprar sua casa.");
					return 1;
        		}
			}
		} else {
    		SendClientMessage(playerid, COLOR_RED, "Ei... VocÍ n„o est· em um Hotel.");
       		SendClientMessage(playerid, COLOR_WHITE, "Procure um taxista e peÁa para lhe levar a 1");
       		SendClientMessage(playerid, COLOR_WHITE, "Se tiver uma casa verde no radar H¡ VAGAS!");
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
	
	if(strcmp(cmd,"/minhaslatas",true)==0){
		if(Profissao[playerid] == DESEMPREGADO || IsPlayerAdmin(playerid)){
			new string[256];
		    format(string,sizeof(string),"VocÍ possue %d latas!",Latas[playerid]);
		    SendClientMessage(playerid, COLOR_WHITE, string);
		    return 1;
	    } else {
		    SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o È desempregado portanto n„o possue latinhas");
		    return 1;
		}
	}

	if(strcmp(cmd, "/venderlatas",true)==0){
		if(Profissao[playerid] == DESEMPREGADO || IsPlayerAdmin(playerid)){
			if(AreaLixao[playerid] == 1){
		 		GivePlayerMoney(playerid,Latas[playerid]*10);
				new string[256];
			    format(string,sizeof(string),"VocÍ vendeu %d latinhas e recebeu $%d por isso",Latas[playerid],Latas[playerid]*10);
				SendClientMessage(playerid, COLOR_WHITE, string);
				Latas[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
				EntregandoLatas[playerid] = 0;
				CheckpointStatus[playerid] = NONE;
				LatasNecessarias[playerid] = 15;
				return 1;
			} else {
			 	SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o est· na ·rea de reciclagem do lix„o");
			 	return 1;
			 }
		 } else {
			 SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem permiss„o");
			 return 1;
		 }
    }
	if(strcmp(cmd,"/pararcoleta",true)==0){
		if(Profissao[playerid] == DESEMPREGADO || IsPlayerAdmin(playerid)){
			if(CatarLatinha[playerid] == 1){
				DisablePlayerCheckpoint(playerid);
		        CatarLatinha[playerid] = 0;
		        SendClientMessage(playerid, COLOR_VERDECLARO, "VocÍ parou de coletar latinhas.");
		        new string[256];
		        format(string,sizeof(string),"VocÍ possue %d latinhas",Latas[playerid]);
		        SendClientMessage(playerid, COLOR_AZUL,string);
		        Missao[playerid] = 0;
		        return 1;
			 }else{
				SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o est· coletando latinhas.");
		    	return 1;
		   	}
	   	} else {
		    SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem permiss„o.");
		    return 1;
		}
	}
	if(strcmp(cmd,"/pegarlata",true)==0){
	    if(Profissao[playerid] == DESEMPREGADO || IsPlayerAdmin(playerid)){
	        if(CatarLatinha[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED2,"VocÍ j· est· coletando latinhas!");
				return 1;
			}
			else {
			    if(Latas[playerid] == 0) LatasNecessarias[playerid] = 15; dini_IntSet(PlayerName(playerid),"LatasNecessarias",0);
                CatarLatinha[playerid] = 1;
                DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid,COLOR_AZUL,"Agora vocÍ ter· que coletar latinhas e levar para a reciclagem.");
				new latinhas = random(37);
				CheckpointStatus[playerid] = CATANDOLATAS;
				SetPlayerCheckpoint(playerid,Latinhas[latinhas][0],Latinhas[latinhas][1],Latinhas[latinhas][2],3.0);
				Missao[playerid] = 1;
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED2,"VocÍ possue um emprego! Pegar lata È coisa de vagabundo...");
			return 1;
		}
	}

//NegÛcios
    if(strcmp(cmd,"/propinfo",true) == 0){
	    new tmp[256];
	    new propriedade;
	    tmp = strtok(cmdtext,idx);
	    propriedade = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /propinfo [propriedade]");
			return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida!");
		    return 1;
		}
		else{
			new str[256];
			format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
			new string[256];
			format(string,sizeof(string),"%s",NomesPropriedades[propriedade]);
			SendClientMessage(playerid, COLOR_RED2, string);
			format(string,sizeof(string),"Dono da propriedade: %s",dini_Get(str,"Dono"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Funcion·rio 1: %s",dini_Get(str,"Trabalhador1"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Funcion·rio 2: %s",dini_Get(str,"Trabalhador2"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Funcion·rio 3: %s",dini_Get(str,"Trabalhador3"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Funcion·rio 4: %s",dini_Get(str,"Trabalhador4"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Funcion·rio 5: %s",dini_Get(str,"Trabalhador5"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Funcion·rio 6: %s",dini_Get(str,"Trabalhador6"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Funcion·rio 7: %s",dini_Get(str,"Trabalhador7"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"Capital de investimento: $%d",dini_Int(str,"Investimento"));
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
	}
	if(strcmp(cmd,"/aumento",true) == 0){
	    new tmp[256];
	    new plid,quantia,propriedade;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /aumento [id] [quantidade] [propriedade]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    quantia = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /aumento [id] [quantidade] [propriedade]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    propriedade = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /aumento [id] [quantidade] [propriedade]");
	        return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
		    return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!DonoDaPropriedade(playerid,propriedade)){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono dessa propriedade!");
			return 1;
		}
		if(!JogadorContratado(plid,propriedade)){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o trabalha nessa propriedade.");
		    return 1;
		}
		if(plid == playerid){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o dar aumento para si mesmo!");
		    return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Aumento dado!");
			new string[256];
			format(string,sizeof(string),"O seu chefe %s lhe deu um aumento de $%d",PlayerName(playerid),quantia);
			SendClientMessage(plid, COLOR_GREEN, string);
			dini_IntSet(PlayerName(plid),"AumentoPropriedade",dini_Int(PlayerName(plid),"AumentoPropriedade") + quantia);
			return 1;
		}
	}
	if(strcmp(cmd,"/tiraraumento",true) == 0){
	    new tmp[256];
	    new plid,quantia,propriedade;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /tiraraumento [id] [quantidade] [propriedade]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    quantia = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /tiraraumento [id] [quantidade] [propriedade]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    propriedade = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /tiraraumento [id] [quantidade] [propriedade]");
	        return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
		    return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!DonoDaPropriedade(playerid,propriedade)){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono dessa propriedade!");
			return 1;
		}
		if(!JogadorContratado(plid,propriedade)){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o trabalha nessa propriedade.");
		    return 1;
		}
		if(plid == playerid){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode tirar um aumento de vocÍ mesmo!");
		    return 1;
		}
		if(quantia > dini_Int(PlayerName(plid),"AumentoPropriedade")){
		    SendClientMessage(playerid, COLOR_RED, "Est· tentando tirar parte do sal·rio do outro jogador? Tem certeza que vocÍ È um bom chefe?");
		    return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Aumento tirado, se ele se demitir n„o venha perguntar o porquÍ hein!?");
			new string[256];
			format(string,sizeof(string),"O seu chefe %s lhe tirou uma parte do seu aumento de $%d",PlayerName(playerid),quantia);
			SendClientMessage(plid, COLOR_GREEN, string);
			dini_IntSet(PlayerName(plid),"AumentoPropriedade",dini_Int(PlayerName(plid),"AumentoPropriedade") - quantia);
			return 1;
		}
	}
	if(strcmp(cmd,"/comprarpropriedadedodono",true) == 0){
	    new tmp[256];
	    new plid,prop,valor;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /comprarpropriedadedodono [id] [propriedade] [valor]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    prop = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /comprarpropriedadedodono [id] [propriedade] [valor]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    valor = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /comprarpropriedadedodono [id] [propriedade] [valor]");
	        return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
		    return 1;
		}
		if(GetPlayerMoney(playerid) < valor){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue esse dinheiro!");
		    return 1;
		}
		if(Negocio[plid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador j· est· fazendo negÛcio, espere ele terminar para fazer essa oferta!");
		    return 1;
		}
		if(prop < 0 || prop > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!DonoDaPropriedade(plid,prop)){
		    SendClientMessage(playerid, COLOR_RED, "Ele n„o È o dono da propriedade!");
		    return 1;
		}
		if(plid == playerid){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode comprar uma propriedade sua!");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"%s est· lhe oferecendo $%d pela propriedade %s",PlayerName(playerid),valor,NomesPropriedades[prop]);
			SendClientMessage(plid, COLOR_GREEN, string);
			SendClientMessage(plid, COLOR_GREEN, "Para aceitar digite /aceitarnegocio e para recusar digite /recusarnegocio");
			SendClientMessage(playerid, COLOR_GREEN, "Oferta de negÛcio feita! Agora veja se o outro jogador aceita.");
            Negocio[plid] = 1;
			Negociador[plid] = playerid;
			PropriedadeEscolhida[playerid] = prop;
			ValorOferecido[plid] = valor;
			NegocianteName[plid] = PlayerName(playerid);
			return 1;
		}
	}
    if(strcmp(cmd,"/aceitarnegocio",true) == 0){
		if(Negocio[playerid] == 0){
			SendClientMessage(playerid, COLOR_RED, "N„o foi oferecida nenhuma proposta de negÛcio ‡ vocÍ!");
			return 1;
		}
		if(!IsStringAName(NegocianteName[playerid])){
		    SendClientMessage(playerid, COLOR_RED, "N„o era com ele que vocÍ decidiu fazer negÛcio!");
		    SendClientMessage(playerid, COLOR_RED, "O outro jogador deve ter saÌdo do servidor.");
			Negocio[playerid] = 0;
			PropriedadeEscolhida[Negociador[playerid]] = -1;
			ValorOferecido[playerid] = 0;
			Negociador[playerid] = 0;
			return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"A propriedade %s agora tem um novo dono (%s)",NomesPropriedades[PropriedadeEscolhida[Negociador[playerid]]],PlayerName(Negociador[playerid]));
			SendClientMessageToAll(COLOR_WHITE, string);
			SendClientMessage(Negociador[playerid], COLOR_GREEN, "A oferta de negÛcio foi aceita! Agora vocÍ tem uma nova propriedade.");
			format(string,sizeof(string),"Oferta aceita! Agora a propriedade %s tem novo dono!",NomesPropriedades[PropriedadeEscolhida[Negociador[playerid]]]);
			SendClientMessage(playerid, COLOR_GREEN, string);
			GivePlayerMoney(playerid,ValorOferecido[playerid]);
			GivePlayerMoney(Negociador[playerid],-ValorOferecido[playerid]);
			new str[256];
			format(str,sizeof(str),"%s.prop",NomesPropriedades[PropriedadeEscolhida[Negociador[playerid]]]);
            if(!fexist(str)) dini_Create(str);
			dini_Set(str,"Dono",PlayerName(Negociador[playerid]));
			dini_Set(str,"Trabalhador1","NONE");
			dini_Set(str,"Trabalhador2","NONE");
			dini_Set(str,"Trabalhador3","NONE");
			dini_Set(str,"Trabalhador4","NONE");
			dini_Set(str,"Trabalhador5","NONE");
			dini_Set(str,"Trabalhador6","NONE");
			dini_Set(str,"Trabalhador7","NONE");
			dini_IntSet(str,"Lucro",0);
			dini_IntSet(str,"Prejuizo",0);
			dini_IntSet(str,"Investimento",0);
            Negocio[playerid] = 0;
			PropriedadeEscolhida[Negociador[playerid]] = -1;
			ValorOferecido[playerid] = 0;
			Negociador[playerid] = 0;
			return 1;
		}
	}
	if(strcmp(cmd,"/wheater",true) == 0){
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new wheaterid;
			tmp = strtok(cmdtext,idx);
			wheaterid = strval(tmp);
			if(!strlen(tmp)){
		    	SendClientMessage(playerid, COLOR_RED, "USO: /wheater [id/da/wheater]");
		    	return 1;
			}
			if(wheaterid < -66 || wheaterid > 45){
				SendClientMessage(playerid, COLOR_RED, "ID da wheather inv·lido! Digite um ID acima de -67 e abaixo de 46.");
				return 1;
			}
			else{
			    SetPlayerWeather(playerid,wheaterid);
				new string[256];
				format(string,sizeof(string),"Aprecie a wheater %d",wheaterid);
				SendClientMessage(playerid, COLOR_GREEN, string);
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o!");
		    return 1;
		}
	}
	if(strcmp(cmd,"/recusarnegocio",true) == 0){
	    if(Negocio[playerid] == 0){
    		SendClientMessage(playerid, COLOR_RED, "N„o foi oferecida nenhuma proposta de negÛcio ‡ vocÍ!");
			return 1;
		}
		if(!IsStringAName(NegocianteName[playerid])){
		    SendClientMessage(playerid, COLOR_RED, "N„o era com ele que vocÍ decidiu fazer negÛcio!");
		    SendClientMessage(playerid, COLOR_RED, "O outro jogador deve ter saÌdo do servidor.");
			Negocio[playerid] = 0;
			PropriedadeEscolhida[Negociador[playerid]] = -1;
			ValorOferecido[playerid] = 0;
			Negociador[playerid] = 0;
			return 1;
		}
		else{
		    SendClientMessage(Negociador[playerid], COLOR_RED, "A proposta foi recusada!");
		    SendClientMessage(playerid, COLOR_GREEN, "VocÍ recusou a oferta!");
		    Negocio[playerid] = 0;
			PropriedadeEscolhida[Negociador[playerid]] = -1;
			ValorOferecido[playerid] = 0;
			Negociador[playerid] = 0;
			return 1;
		}
	}
	if(strcmp(cmd,"/investir",true) == 0){
	    new tmp[256];
	    new propriedade,quantia;
	    tmp = strtok(cmdtext,idx);
	    propriedade = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /investir [propriedade] [quantidade]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    quantia = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /investir [propriedade] [quantidade]");
	        return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!DonoDaPropriedade(playerid,propriedade)){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono dessa propriedade!");
			return 1;
		}
		if(GetPlayerMoney(playerid) < quantia){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue toda essa quantidade em m„os!");
		    return 1;
		}
		else{
		    AcrescentarInvestimento(propriedade,quantia);
		    GivePlayerMoney(playerid,-quantia);
			SendClientMessage(playerid, COLOR_GREEN, "Quantidade investida!");
			return 1;
		}
	}
	if(strcmp(cmd,"/venderpropriedade",true) == 0){
	    new tmp[256];
	    new propriedade;
		new str[256];
	    tmp = strtok(cmdtext,idx);
		propriedade = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "USO: /venderpropriedade [propriedade]");
		    return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!DonoDaPropriedade(playerid,propriedade)){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono dessa propriedade!");
			return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"%s vendeu a propriedade %s por $%d",PlayerName(playerid),NomesPropriedades[propriedade],ValoresPropriedades[propriedade]/2);
		    SendClientMessageToAll(COLOR_WHITE, string);
		    SendClientMessage(playerid, COLOR_GREEN, "Propriedade vendida!");
		    GivePlayerMoney(playerid,ValoresPropriedades[propriedade]/2);
		    format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
		    if(!fexist(str)) return 0;
		    dini_Set(str,"Dono","NONE");
	    	dini_Set(str,"Trabalhador1","NONE");
	    	dini_Set(str,"Trabalhador2","NONE");
	    	dini_Set(str,"Trabalhador3","NONE");
	    	dini_Set(str,"Trabalhador4","NONE");
	    	dini_Set(str,"Trabalhador5","NONE");
	    	dini_Set(str,"Trabalhador6","NONE");
	    	dini_Set(str,"Trabalhador7","NONE");
	    	dini_IntSet(str,"Lucro",0);
	    	dini_IntSet(str,"Prejuizo",0);
	    	dini_IntSet(str,"Investimento",0);
	    	return 1;
		}
	}
	if(strcmp(cmd,"/contratar",true) == 0){
	    new tmp[256];
	    new plid;
		new propriedade;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /contratar [id] [propriedade]");
			return 1;
		}
        tmp = strtok(cmdtext,idx);
		propriedade = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /contratar [id] [propriedade]");
			return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!DonoDaPropriedade(playerid,propriedade)){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono dessa propriedade!");
			return 1;
		}
		if(PropriedadeLotada(propriedade)){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ j· contratou o m·ximo de funcion·rios para essa propriedade!");
			return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
		    return 1;
		}
		if(JogadorContratado(plid,propriedade)){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador j· trabalha ai.");
		    return 1;
		}
		if(plid == playerid){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode contratar vocÍ mesmo!");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"%s est· lhe oferecendo um emprego na propriedade %s, vocÍ poder· ganhar aumento se trabalhar ai!",PlayerName(playerid),NomesPropriedades[propriedade]);
			switch(propriedade)
			{
   			case 0 :
				{
					if(Profissao[plid] != ENTREGADOR_PIZZA){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == ENTREGADOR_PIZZA){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
			case 1 :
			    {
					if(Profissao[plid] != TAXISTA && Profissao[plid] != MOTOTAXI && Profissao[plid] != TAXI_AEREO){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == TAXISTA || Profissao[plid] == MOTOTAXI || Profissao[plid] == TAXI_AEREO){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 2 :
				{
					if(Profissao[plid] != MOTORISTA){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == MOTORISTA){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 3 :
				{
					if(Profissao[plid] != CORRETOR_SEGUROS){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == CORRETOR_SEGUROS){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 4 :
				{
					if(Profissao[plid] != SEGURAN«A && Profissao[plid] != TRANSPORTE_DE_VALORES){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == SEGURAN«A || Profissao[plid] == TRANSPORTE_DE_VALORES){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 5 :
				{
					if(Profissao[plid] != VENDEDOR_DE_ARMAS){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == VENDEDOR_DE_ARMAS){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 6 :
				{
					if(Profissao[plid] != PROSTITUTA){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == PROSTITUTA){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 7 :
				{
					if(Profissao[plid] != FRENTISTA){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == FRENTISTA){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 8 :
				{
					if(Profissao[plid] != BARMAN){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == BARMAN){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
            case 9 :
				{
					if(Profissao[plid] != MECANICO){
			           	SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· com a profiss„o adequada para essa propriedade!");
			           	SendClientMessage(playerid, COLOR_RED, "Sinto muito, n„o podemos aceita-lo!");
			           	return 1;
					}
					else if(Profissao[plid] == MECANICO){
				    	SendClientMessage(playerid, COLOR_GREEN, "A oferta foi dada ‡ esse jogador!");
				    	SendClientMessage(plid, COLOR_GREEN, string);
				    	SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar e digite /recusar para recusar!");
						PropriedadeContrato[plid] = propriedade;
                       	invitestatus[plid] = INVITE_CONTRATO;
                       	return 1;
					}
				}
			}
		}
	}
	if(strcmp(cmd,"/demitir",true) == 0){
	    new tmp[256];
	    new plid,propriedade;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /demitir [id] [propriedade]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    propriedade = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /demitir [id] [propriedade]");
	        return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
		    return 1;
		}
		if(!JogadorContratado(plid,propriedade)){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ est· tentando demitir um jogador que nem contratou!");
		    return 1;
		}
		if(!DonoDaPropriedade(playerid,propriedade)){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono dessa propriedade!");
			return 1;
		}
		if(plid == playerid){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode demitir vocÍ mesmo!");
		    return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_GREEN, "Jogador demitido!");
			new string[256];
			format(string,sizeof(string),"VocÍ foi demitido da propriedade %s",NomesPropriedades[propriedade]);
			SendClientMessage(plid, COLOR_RED, string);
			DemitirJogador(plid,propriedade);
			return 1;
		}
	}
//Status

	if(strcmp(cmd, "/status", true) == 0) {
		if(IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	tmp = strtok(cmdtext,idx);
	    	plid = strval(tmp);
	    	if(!strlen(tmp)){
	    	    SendClientMessage(playerid, COLOR_RED, "USO: /status [id]");
	    	    return 1;
			}
			if(IsPlayerConnected(plid)){
				new msg[256], string[256];
				format(msg,sizeof(msg),"|--------------------------------------| Status de %s || ID: %d |--------------------------------------|",PlayerName(plid),plid);
				SendClientMessage(playerid, COLOR_RED2, msg);
				format(string,sizeof(string),"|---| Profissao: %s || Experience Points: %d  || Level: %d  || Skin: %d |---|",ProfExtName[Profissao[plid]],ExPoints[plid],dini_Int(PlayerName(plid),"XL"),GetPlayerSkin(plid));
				SendClientMessage(playerid, COLOR_PALHA, string);
				format(string,sizeof(string),"|---| Iscas para pescar: %d || N˙mero de celular: %d  || Seguro de Vida: %d |---|",dini_Int(PlayerName(plid),"Iscas"),dini_Int(PlayerName(plid),"PhoneNumb"),dini_Int(PlayerName(plid),"Seguro"));
				SendClientMessage(playerid, COLOR_PALHA, string);
				format(string,sizeof(string),"|---| EmprÈstimo banc·rio: $%d,00 || DÌvidas ‡ pagar: $%d,00 || Multas ‡ pagar: $%d || Teor alcÛolico: %d mg |---|",dini_Int(PlayerName(plid),"Emprestimo"),dini_Int(PlayerName(plid),"Divida"),dini_Int(PlayerName(plid),"Multa"),Bebida[plid]);
				SendClientMessage(playerid, COLOR_PALHA, string);
				format(string,sizeof(string),"|---| HeroÌna: %d injeÁıes || Maconha: %d cigarro(s) || CocaÌna: %d grama(s) |---|",QtHeroina[plid],QtMaconha[plid],QtCocaina[plid]);
				SendClientMessage(playerid, COLOR_PALHA, string);
				format(string,sizeof(string),"|---| Multas ‡ pagar: $%d,00 |---|",dini_Int(PlayerName(plid),"Multa"));
				SendClientMessage(playerid, COLOR_PALHA, string);
				if(dini_Int(PlayerName(plid),"HabTerrestre") == 0 && dini_Int(PlayerName(plid),"HabAerea") == 0 && dini_Int(PlayerName(plid),"HabNautica") == 0){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador n„o possue nenhuma habilitaÁ„o para dirigir |---|");
					return 1;
				}
				else if(dini_Int(PlayerName(plid),"HabTerrestre") == 1 && dini_Int(PlayerName(plid),"HabAerea") == 0 && dini_Int(PlayerName(plid),"HabNautica") == 0){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador sÛ possue a habilitaÁ„o Terrestre |---|");
					return 1;
				}
				else if(dini_Int(PlayerName(plid),"HabTerrestre") == 0 && dini_Int(PlayerName(plid),"HabAerea") == 1 && dini_Int(PlayerName(plid),"HabNautica") == 0){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador sÛ possue a habilitaÁ„o AÈrea |---|");
					return 1;
				}
				else if(dini_Int(PlayerName(plid),"HabTerrestre") == 0 && dini_Int(PlayerName(plid),"HabAerea") == 0 && dini_Int(PlayerName(plid),"HabNautica") == 1){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador sÛ possue a habilitaÁ„o N·utica |---|");
					return 1;
				}
				else if(dini_Int(PlayerName(plid),"HabTerrestre") == 1 && dini_Int(PlayerName(plid),"HabAerea") == 1 && dini_Int(PlayerName(plid),"HabNautica") == 0){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador possue as habilitaÁıes Terrestre e AÈrea |---|");
					return 1;
				}
				else if(dini_Int(PlayerName(plid),"HabTerrestre") == 0 && dini_Int(PlayerName(plid),"HabAerea") == 1 && dini_Int(PlayerName(plid),"HabNautica") == 1){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador possue as habilitaÁıes N·utica e AÈrea |---|");
					return 1;
				}
				else if(dini_Int(PlayerName(plid),"HabTerrestre") == 1 && dini_Int(PlayerName(plid),"HabAerea") == 0 && dini_Int(PlayerName(plid),"HabNautica") == 1){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador possue as habilitaÁıes N·utica e Terrestre |---|");
					return 1;
				}
				else if(dini_Int(PlayerName(plid),"HabTerrestre") == 1 && dini_Int(PlayerName(plid),"HabAerea") == 1 && dini_Int(PlayerName(plid),"HabNautica") == 1){
					SendClientMessage(playerid, COLOR_PALHA, "|---| Esse jogador possue todas as habilitaÁıes |---|");
					return 1;
				}
			} else {
			    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
			    return 1;
			    }
		} else {
		    SendClientMessage(playerid, COLOR_RED, "Comando errado! Para ver o seu status digite: /meustatus");
		    return 1;
		}
    }
    
	if(strcmp(cmd, "/meustatus", true) == 0) {
		new msg[256], string[256];
		format(msg,sizeof(msg),"|--------------------------------------| Status de %s || ID: %d |--------------------------------------|",PlayerName(playerid),playerid);
		SendClientMessage(playerid, COLOR_RED2, msg);
		format(string,sizeof(string),"|---| Profissao: %s || Experience Points: %d  || Level: %d  || Skin: %d |---|",ProfExtName[Profissao[playerid]],ExPoints[playerid],dini_Int(PlayerName(playerid),"XL"),GetPlayerSkin(playerid));
		SendClientMessage(playerid, COLOR_PALHA, string);
		format(string,sizeof(string),"|---| Iscas para pescar: %d || N˙mero de celular: %d  || Seguro de Vida: %d |---|",dini_Int(PlayerName(playerid),"Iscas"),dini_Int(PlayerName(playerid),"PhoneNumb"),dini_Int(PlayerName(playerid),"Seguro"));
		SendClientMessage(playerid, COLOR_PALHA, string);
		format(string,sizeof(string),"|---| EmprÈstimo banc·rio: $%d,00 || DÌvidas ‡ pagar: $%d,00 || Multas ‡ pagar: $%d || Teor alcÛolico: %d mg |---|",dini_Int(PlayerName(playerid),"Emprestimo"),dini_Int(PlayerName(playerid),"Divida"),dini_Int(PlayerName(playerid),"Multa"),Bebida[playerid]);
		SendClientMessage(playerid, COLOR_PALHA, string);
		format(string,sizeof(string),"|---| HeroÌna: %d injeÁıes || Maconha: %d cigarro(s) || CocaÌna: %d grama(s) |---|",QtHeroina[playerid],QtMaconha[playerid],QtCocaina[playerid]);
		SendClientMessage(playerid, COLOR_PALHA, string);
		if(dini_Int(PlayerName(playerid),"HabTerrestre") == 0 && dini_Int(PlayerName(playerid),"HabAerea") == 0 && dini_Int(PlayerName(playerid),"HabNautica") == 0){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ n„o possue nenhuma habilitaÁ„o para dirigir |---|");
			return 1;
		}
		else if(dini_Int(PlayerName(playerid),"HabTerrestre") == 1 && dini_Int(PlayerName(playerid),"HabAerea") == 0 && dini_Int(PlayerName(playerid),"HabNautica") == 0){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ sÛ possue a habilitaÁ„o Terrestre |---|");
			return 1;
		}
		else if(dini_Int(PlayerName(playerid),"HabTerrestre") == 0 && dini_Int(PlayerName(playerid),"HabAerea") == 1 && dini_Int(PlayerName(playerid),"HabNautica") == 0){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ sÛ possue a habilitaÁ„o AÈrea |---|");
			return 1;
		}
		else if(dini_Int(PlayerName(playerid),"HabTerrestre") == 0 && dini_Int(PlayerName(playerid),"HabAerea") == 0 && dini_Int(PlayerName(playerid),"HabNautica") == 1){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ sÛ possue a habilitaÁ„o N·utica |---|");
			return 1;
		}
		else if(dini_Int(PlayerName(playerid),"HabTerrestre") == 1 && dini_Int(PlayerName(playerid),"HabAerea") == 1 && dini_Int(PlayerName(playerid),"HabNautica") == 0){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ possue as habilitaÁıes Terrestre e AÈrea |---|");
			return 1;
		}
		else if(dini_Int(PlayerName(playerid),"HabTerrestre") == 0 && dini_Int(PlayerName(playerid),"HabAerea") == 1 && dini_Int(PlayerName(playerid),"HabNautica") == 1){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ possue as habilitaÁıes N·utica e AÈrea |---|");
			return 1;
		}
		else if(dini_Int(PlayerName(playerid),"HabTerrestre") == 1 && dini_Int(PlayerName(playerid),"HabAerea") == 0 && dini_Int(PlayerName(playerid),"HabNautica") == 1){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ possue as habilitaÁıes N·utica e Terrestre |---|");
			return 1;
		}
		else if(dini_Int(PlayerName(playerid),"HabTerrestre") == 1 && dini_Int(PlayerName(playerid),"HabAerea") == 1 && dini_Int(PlayerName(playerid),"HabNautica") == 1){
			SendClientMessage(playerid, COLOR_PALHA, "|---| VocÍ possue todas as habilitaÁıes |---|");
			return 1;
		}
    }
	if(strcmp(cmd, "/documentos", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[5];
	    new prof;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Documentos mostrados.");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)){
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    hab[0] = dini_Int(PlayerName(playerid),"HabTerrestre");
			    hab[1] = dini_Int(PlayerName(playerid),"HabNautica");
			    hab[2] = dini_Int(PlayerName(playerid),"HabAerea");
	            hab[3] = dini_Int(PlayerName(playerid),"Porte");
	            hab[4] = dini_Int(PlayerName(playerid),"Passaporte");
	            prof = dini_Int(PlayerName(playerid),"Prof");
				format(string, sizeof(string), "Identidade de: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_YELLOW, string);
				format(string, sizeof(string), "Skin :: %d", dini_Int(PlayerName(playerid),"Skin"));
				SendClientMessage(plid, COLOR_YELLOW, string);
				format(string, sizeof(string), "Prof de %s :: %s", PlayerName(playerid), ProfExtName[prof]);
				SendClientMessage(plid, COLOR_YELLOW, string);
				new vehicleid = GetPlayerVehicleID(plid);
				if(!strcmp(PlayerName(plid),Dono[vehicleid],true)){
				}
				if(strcmp(PlayerName(plid),Dono[vehicleid],true)){
					if(strcmp(PlayerName(plid),"Server",true)){
					}
				}
				format(string, sizeof(string), "Esse veÌculo pertence a: %s",Dono[vehicleid]);
				SendClientMessage(plid, COLOR_WHITE, string);
				if(hab[0] == 0){
				    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o de Carros e Motos: N√O");
				}
				if(hab[0] == 1){
				    SendClientMessage(plid, COLOR_GREEN, "HabilitaÁ„o de Carros e Motos: SIM");
				}
				if(hab[1] == 0){
				    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o N·utica: N√O");
				}
				if(hab[1] == 1){
				    SendClientMessage(plid, COLOR_GREEN, "HabilitaÁ„o N·utica: SIM");
				}
				if(hab[2] == 0){
				    SendClientMessage(plid, COLOR_YELLOW, "HabilitaÁ„o AÈrea: N√O");
				}
				if(hab[2] == 1){
				    SendClientMessage(plid, COLOR_GREEN, "HabilitaÁ„o AÈrea: SIM");
				}
	            if(hab[3] == 0){
				    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT1: N√O");
				    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT2: N√O");
				}
				if(hab[3] == 1){
				    SendClientMessage(plid, COLOR_GREEN,  "Porte de armas CAT1: SIM");
				    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT2: N√O");
				}
				if(hab[3] == 2){
				    SendClientMessage(plid, COLOR_GREEN, "Porte de armas CAT1: SIM");
				    SendClientMessage(plid, COLOR_GREEN, "Porte de armas CAT2: SIM");
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
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador nao existe!");
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em 1 carro para mostrar a carteira!");
		}
		return 1;
	}
	
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
			    	SetTimerEx("Fazenda",60000,0,"d",playerid);
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
				    new quantia,sacas;
				    quantia = minrand(60,150);
				    sacas = minrand(2,8);
				    new amount = floatround((quantia * sacas));
					new msg[256];
					format(msg, sizeof(msg),"VocÍ vendeu %d sacas (100 Kg) de milho por $%d cada e faturou $%d com a venda.",sacas,quantia,amount);
					SendClientMessage(playerid,COLOR_WHITE,msg);
					GivePlayerMoney(playerid,amount);
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
					SendClientMessage(playerid, COLOR_AGRICULTOR, "CÍ t· tirando o leite pera um pedaÁo aÌ.");
					SendClientMessage(playerid, COLOR_AGRICULTOR, "CÍ j· sai de baixo da vaca. Calminha sÙ!");
                    ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 1, 0, 0, 0);
					LeiteInProgress[playerid] = 1;
					SetTimerEx("LeiteA",36000,0,"d",playerid);
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

   	if(strcmp(cmd, "/habaerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/habaero [id].");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    dini_IntSet(PlayerName(plid),"HabAerea", 1);
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
	if(strcmp(cmd, "/agendarteste", true) == 0) {
		new tmp[256];
		new plid;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "USO: /agendarteste [id]");
		    return 1;
		}
		if(Profissao[plid] != INSTRUTOR){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ sÛ pode agendar teste com um instrutor!");
		    return 1;
		}
		if(NaAgenda[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ j· agendou um teste!");
		    return 1;
		}
		if(AgendaTestes >= 7){
		    SendClientMessage(playerid, COLOR_RED, "A agenda est· lotada! Espere o instrutor terminar o teste para apaga-la!");
		    return 1;
		}
		else{
			NaAgenda[playerid] = 1;
			Agendado[playerid] = AgendaTestes;
			AgendaTestes++;
			SendClientMessage(playerid, COLOR_GREEN, "Agendado... Digite /agendatestes para ver que est· agendado!");
			new string[256];
			format(string,sizeof(string),"%s acabou de agendar um teste!",PlayerName(playerid));
			SendClientMessage(plid, COLOR_GREEN, string);
			return 1;
		}
	}
	if(strcmp(cmd, "/agendatestes", true) == 0){
	    if(AgendaTestes == 1){
			return SendClientMessage(playerid, COLOR_RED, "A agenda de testes est· vazia!");
		}
		else{
		    SendClientMessage(playerid, COLOR_YELLOW, "Agenda de testes da auto-escola:");
	    	new string[256];
	    	for(new i=0; i<AgendaTestes; i++){
				for(new p=0; p<MAX_PLAYERS; p++){
					if(Agendado[p] == i && NaAgenda[p] == 1){
					    format(string,sizeof(string),"%d - %s",i,PlayerName(p));
					    SendClientMessage(playerid, COLOR_WHITE, string);
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/apagaragenda", true) == 0) {
	    if(AgendaTestes == 1){
			return SendClientMessage(playerid, COLOR_RED, "A agenda de testes est· vazia!");
		}
		else{
		    AgendaTestes = 1;
			for(new p=0; p<MAX_PLAYERS; p++){
				NaAgenda[p] = 0;
				Agendado[p] = 0;
			}
			new string[256];
			format(string,sizeof(string),"%s apagou a agenda de testes da auto escola!",PlayerName(playerid));
			SendClientMessageToAll(COLOR_WHITE, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/habterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/habterrestre [id].");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    dini_IntSet(PlayerName(plid),"HabTerrestre", 1);
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
			SendClientMessage(playerid, COLOR_RED, "/habnautica [id].");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    dini_IntSet(PlayerName(plid),"HabNautica", 1);
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
			   dini_IntSet(PlayerName(plid),"Passaporte", 1);
			   SendClientMessage(playerid, COLOR_JUIZ, "Passaporte nacional concedido.");
			   SendClientMessage(plid, COLOR_GREEN, "O Juiz lhe concedeu passaporte, agora vocÍ tem");
               SendClientMessage(plid, COLOR_GREEN, "livre circulaÁ„o alem dos limites de Los Santos.");
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

	if (strcmp(cmd, "/ordem", true)==0){
		if(Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
		    strmid(tmp, cmdtext, 8, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/ordem [ qual ordem aos oficiais? ]");
				return 1;
			}
		    SendClientMessage(playerid, COLOR_GREEN, "VocÍ enviou uma ordem aos policiais de Los Santos.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		       if(Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO ||Profissao[i] == JUIZ || Profissao[i] == COP_SWAT){
					format(string, sizeof(string), "O Delegado %s ordenou aos policiais: %s ", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_RODOVIARIO, string);
		        }
			}
			return 1;
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei... VocÍ n„o È Delegado, sua profiss„o È outra");
    	}
	}
	
	if(strcmp(cmd, "/porte1", true) == 0) {
	    if(Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/porte1 [id]");
				return 1;
			}
			if(dini_Int(PlayerName(playerid),"Porte") == 0){
		        plid = strval(tmp);
				if(IsPlayerConnected(plid)){
				    dini_IntSet(PlayerName(plid),"Porte", 1);
				    SendClientMessage(playerid, COLOR_TAXI_AEREO, "Porte de armas CAT 1, Concedido.");
				    format(tmp,sizeof(tmp),"VocÍ recebeu o Porte de Armas Categoria 1 ( leves ),pelo Delegado Sr. %s",PlayerName(playerid));
				    SendClientMessage(plid,COLOR_GREEN,tmp);
	                SendClientMessage(plid, COLOR_GREEN, "Digite /portedearmas e veja quais armas vocÍ pode usar.");
	                AcrescentarExPoints(playerid,1);
					return 1;
				} else {
				    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
					return 1;
				}
			} else {
	            SendClientMessage(playerid, COLOR_RED, "O Jogador j· tem o Porte de Armas.");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a conceder porte de armas.");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/porte2", true) == 0) {
	    if(Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/porte2 [id]");
				return 1;
			}
			if(dini_Int(PlayerName(playerid),"Porte") == 1){
		        plid = strval(tmp);
				if(IsPlayerConnected(plid)){
				    dini_IntSet(PlayerName(plid),"Porte", 2);
				    SendClientMessage(playerid, COLOR_TAXI_AEREO, "Porte de armas CAT 2, Concedido.");
				    format(tmp,sizeof(tmp),"VocÍ recebeu o Porte de Armas Categoria 2 ( pesadas ),pelo Delegado Sr. %s",PlayerName(playerid));
				    SendClientMessage(plid,COLOR_GREEN,tmp);
	                SendClientMessage(plid, COLOR_GREEN, "Digite /portedearmas e veja quais armas vocÍ pode usar.");
	                AcrescentarExPoints(playerid,1);
					return 1;
				} else {
				    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
					return 1;
				}
			} else {
	            SendClientMessage(playerid, COLOR_RED, "O Jogador j· tem o Porte de Armas.");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a conceder porte de armas.");
			return 1;
		}
	}
	if(strcmp(cmd, "/removerporte1", true) == 0) {
	    if(Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/removerporte1 [id]");
				return 1;
			}
			if(dini_Int(PlayerName(playerid),"Porte") == 1){
		        plid = strval(tmp);
				if(IsPlayerConnected(plid)){
				    dini_IntSet(PlayerName(plid),"Porte", 0);
				    SendClientMessage(playerid, COLOR_RED2, "Porte de armas CAT 1, REMOVIDO");
					format(string, sizeof(string), "O Delegado Sr. %s cancelou o Porte de Armas Categoria 1 de %s.", PlayerName(playerid), PlayerName(plid));
					SendClientMessageToAll(COLOR_JUIZ, string);
					SendClientMessage(plid, COLOR_GREEN, "O Delegado removeu seu Porte de Categoria 1");
					return 1;
				} else {
				    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
					return 1;
				}
			} else {
	            SendClientMessage(playerid, COLOR_RED, "O Jogador n„o tem Porte de Armas Categoria 1.");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a conceder porte de armas.");
			return 1;
		}
	}

	if(strcmp(cmd, "/removerporte2", true) == 0) {
	    if(Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/removerporte2 [id]");
				return 1;
			}
			if(dini_Int(PlayerName(playerid),"Porte") == 2){
		        plid = strval(tmp);
				if(IsPlayerConnected(plid)){
				    dini_IntSet(PlayerName(plid),"Porte", 0);
				    SendClientMessage(playerid, COLOR_RED2, "Porte de armas CAT 2, REMOVIDO");
					format(string, sizeof(string), "O Delegado Sr. %s cancelou o Porte de Armas Categoria 2 de %s.", PlayerName(playerid), PlayerName(plid));
					SendClientMessageToAll(COLOR_JUIZ, string);
					SendClientMessage(plid, COLOR_GREEN, "O Delegado removeu seu Porte de Categoria 2");
					return 1;
				} else {
				    SendClientMessage(playerid, COLOR_RED, "ID inv·lido");
					return 1;
				}
			} else {
	            SendClientMessage(playerid, COLOR_RED, "O Jogador n„o tem Porte de Armas Categoria 2.");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· autorizado a conceder porte de armas.");
			return 1;
		}
	}
 	if(strcmp(cmd, "/portedearmas", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "Lista de armas permitidas em Los Santos-SA. S„o duas categorias armas leves e armas pesadas");
	    SendClientMessage(playerid, COLOR_GREEN, "qualquer cidad„o de Los Santos que usar armas sem porte ser· preso, e aguardar· o julgamento.");
	    SendClientMessage(playerid, COLOR_PALHA, "CAT1:armas leves: Pistola Colt 45 c/ ou sem silenciador,Country shotgun(de cano longo).");
	    SendClientMessage(playerid, COLOR_PALHA, "Desert eagle, Rifle.");
		SendClientMessage(playerid, COLOR_PALHA, "CAT2: AK47 Assault Rifle,M4 Assault Rifle,MP5,Combat Knife,SPAZ-12 Shotgun ");
    	SendClientMessage(playerid, COLOR_PALHA, "Decreto n∫1925/2007 armas permitidas DELEGADO: Texugo. Los Santos-SA");
		return 1;
	}

    if(strcmp(cmd,"/publicar",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COLOR_RED,"/publicar [texto]");
				return 1;
			}
			if(!IsPlayerInAnyVehicle(playerid)){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo de reportagem!");
			    return 1;
			}
			if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 488){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um helicÛptero de reportagem!");
			    return 1;
			}
			if(JaAnunciou[playerid] == 1){
			    format(msg,sizeof(msg),"An˙ncio publicado por %s",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    GameTextForAll(tmp,5000,0);
			    return 1;
			} else {
			    format(msg,sizeof(msg),"An˙ncio publicado por %s",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    GameTextForAll(tmp,5000,0);
			    AcrescentarExPoints(playerid,1);
			    JaAnunciou[playerid] = 1;
			    SetTimerEx("Anunciou",180000,0,"d",playerid);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
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
			}
			if(!IsPlayerInAnyVehicle(playerid)){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo de reportagem!");
			    return 1;
			}
			if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 582 && GetVehicleModel(GetPlayerVehicleID(playerid)) != 488){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo/helicÛptero de reportagem!");
			    return 1;
			}
			if(JaAnunciou[playerid] == 1){
			    format(msg,sizeof(msg),"Extra Extra! NotÌcias de San Andreas, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    SendClientMessageToAll(COLOR_ROSA,tmp);
			    return 1;
			} else {
                format(msg,sizeof(msg),"Extra Extra! NotÌcias de San Andreas, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    SendClientMessageToAll(COLOR_ROSA,tmp);
			    AcrescentarExPoints(playerid,1);
			    JaAnunciou[playerid] = 1;
			    SetTimerEx("Anunciou",180000,0,"d",playerid);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/propaganda",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	strmid(tmp,cmdtext,12,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COLOR_RED,"/propaganda [texto]");
				return 1;
            }
			if(!IsPlayerInAnyVehicle(playerid)){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo de reportagem!");
			    return 1;
			}
			if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 582 && GetVehicleModel(GetPlayerVehicleID(playerid)) != 488){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo/helicÛptero de reportagem!");
			    return 1;
			}
			if(JaAnunciou[playerid] == 1){
			    SendClientMessageToAll(COLOR_YELLOW,"--Propagandas Jornal San News--");
			    SendClientMessageToAll(COLOR_ROSA,tmp);
			    return 1;
			} else {
			    SendClientMessageToAll(COLOR_YELLOW,"--Propagandas Jornal San News--");
			    SendClientMessageToAll(COLOR_ROSA,tmp);
			    AcrescentarExPoints(playerid,1);
			    JaAnunciou[playerid] = 1;
			    SetTimerEx("Anunciou",180000,0,"d",playerid);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
			return 1;
		}
	}

	if(strcmp(cmd,"/anunciaremprego", true) == 0){
	    new tmp[256];
	    new plid;
	    new propriedade;
	    new salario;
	    new profissao;
     	tmp = strtok(cmdtext,idx);
     	plid = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /anunciaremprego [id/do/jornalista] [id/da/propriedade] [salario] [profissao/a/oferecer]");
			return 1;
		}
		tmp = strtok(cmdtext,idx);
		propriedade = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /anunciaremprego [id/do/jornalista] [id/da/propriedade] [salario] [profissao/a/oferecer]");
			return 1;
		}
		tmp = strtok(cmdtext,idx);
		salario = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /anunciaremprego [id/do/jornalista] [id/da/propriedade] [salario] [profissao/a/oferecer]");
			return 1;
		}
		tmp = strtok(cmdtext,idx);
		profissao = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "USO: /anunciaremprego [id/do/jornalista] [id/da/propriedade] [salario] [profissao/a/oferecer]");
			return 1;
		}
		if(Profissao[plid] != JORNALISTA){
			SendClientMessage(playerid, COLOR_RED, "Ele n„o È Jornalista.");
			return 1;
		}
		if(propriedade < 0 || propriedade > MAX_PROPERTIE_ID){
		    SendClientMessage(playerid, COLOR_RED, "Propriedade inv·lida! Use /propriedades para ver as propriedades disponÌveis.");
			return 1;
		}
		if(!DonoDaPropriedade(playerid,propriedade)){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono dessa propriedade!");
			return 1;
		}
		if(PropriedadeLotada(propriedade)){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ j· contratou o m·ximo de funcion·rios para essa propriedade!");
			return 1;
		}
		if(GetPlayerMoney(playerid) < 250){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro o suficiente, o anuncio custa $250.");
			return 1;
		}
		else{
		    new string[256];
    		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SetPlayerSpecialAction(plid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",plid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SendClientMessage(playerid, COLOR_YELLOW, "Anuncio mandado para todos jornalistas.");
       		format(string,sizeof(string),"O Dono da empresa %s est· pedindo o anuncio do emprego %s no valor de %d.",PlayerName(playerid),ProfExtName[profissao], salario);
			SendClientMessage(plid, COLOR_JORNALISTA, string);
			SendClientMessage(plid, COLOR_JORNALISTA, "Para aceitar o anuncio digite /aceitaranuncio e para recusar digite /recusaranuncio.");
			JornalistaAvisado[plid] = 1;
			iemprego[0] = propriedade;
			iemprego[1] = salario;
			iemprego[2] = profissao;
			Proposteiro[plid] = playerid;
			return 1;
		}
	}
	if(strcmp(cmd,"/aceitaranuncio",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
			if(JornalistaAvisado[playerid] == 1){
			    new msg[256];
			    SendClientMessageToAll(COLOR_WHITE, "  ");
			    format(msg,sizeof(msg),"News Paper's Life: %s Contrata %s com o sal·rio inicial de $%s. Quem estiver interessado procure o Jornalista, ele ir· lhe guia.",iemprego[0],iemprego[2],iemprego[1]);
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    SendClientMessageToAll(COLOR_WHITE, "  ");
			    GivePlayerMoney(Proposteiro[playerid],-300);
			    GivePlayerMoney(playerid,300);
			    JornalistaAvisado[playerid] = 0;
			    return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "N„o foi solicitado nenhum an˙ncio de emprego");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Jornalista.");
			return 1;
		}
	}
	if(strcmp(cmd,"/recusaranuncio",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
			if(JornalistaAvisado[playerid] == 1){
			    SendClientMessage(playerid, COLOR_JORNALISTA, "An˙ncio de empregos recusado.");
				JornalistaAvisado[playerid] = 0;
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "N„o foi solicitado nenhum an˙ncio de emprego");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Jornalista.");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/defesa", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/defesa [id] [ quantia ex:5000 ]");
			return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/defesa [id] [ quantia ex:5000 ]");
			return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == ADVOGADO){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem esse dinheiro! Verifique se tem no banco esta quantia");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/3);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "VocÍ defendeu o rÈu e cobrou pela causa $%d  e recebeu $%d pelos seus honor·rios", pagamento, pagamento/3);
				SendClientMessage(plid, COLOR_GREEN, string);
				AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei... Ele n„o È advogado");
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
				SendClientMessage(plid, COLOR_GREEN, "se quiser alug·-lo, digite: '/alugar' se n„o: '/naoalugar'");
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
	        SendClientMessage(playerid, COLOR_GREEN, "Saiu do carro de aluguel/‡ venda!");
			RemovePlayerFromVehicle(playerid);
	        TogglePlayerControllable(playerid, 1);
	        return 1;
	    }
		if(JogadorNoCarro[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "N„o est· no carro de aluguel/‡ venda!!");
	        return 1;
	    }
	}

	if(strcmp(cmd, "/transportar", true) == 0) {
		if(Profissao[playerid] == TRANSPORTE_DE_VALORES || IsPlayerAdmin(playerid)){
			if(AreaForte[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == 428){
				   if(Carga[playerid] == 0){
						TogglePlayerControllable(playerid,0);
						GameTextForPlayer(playerid, "~w~Colocando ~n~a ~n~~g~Grana ...",10000,0);
				    	SendClientMessage(playerid,COLOR_TRANSPORTE_DE_VALORES, "Aguarde......");
				    	SetTimerEx("EnchendoCarroForte",10000,0,"d",playerid);
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
	    } else {
	        SendClientMessage(playerid,COLOR_RED,"VocÍ n„o tem permiss„o!");
	    	return 1;
	    }
	}
	if(strcmp(cmd,"/pegargrana",true) == 0){
	    if(Profissao[playerid] == TRANSPORTE_DE_VALORES || IsPlayerAdmin(playerid)){
	    	if(Carga[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == 428){
				    if(PegarGrana[playerid] == 0){
				        SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "VocÍ pegou a grana, ao sair do veÌculo ter· 30 segundos para depositar a grana no banco e voltar ao veÌculo.");
						PegarGrana[playerid] = 1;
						return 1;
					} else {
				        SendClientMessage(playerid,COLOR_RED,"VocÍ j· pegou a grana.");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um CARRO FORTE");
					return 1;
				}
	   	   	} else {
	            SendClientMessage(playerid, COLOR_RED, "Seu CARRO FORTE n„o est· carregado.");
				return 1;
			}
	    } else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o.");
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
				}
				if(PegarGrana[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pegou o malote de grana.");
					return 1;
				} else {
				    Carga[playerid] = 0;
				    new grana,porc;
				    new string[256];
				    KillTimer(EntregandoGrana[playerid]);
				    porc = minrand(240,600);
                    grana = minrand(10000,200000);
				    Carga[playerid] = 0;
				    PegarGrana[playerid] = 0;
					format(string, sizeof(string), "VocÍ depositou $%d com sucesso", grana);
					SendClientMessage(playerid,COLOR_COP_MILITAR, string);
					GivePlayerMoney(playerid, porc);
    			    AcrescentarExPoints(playerid,1);
    			    if(JogadorContratado(playerid,4)) AcrescentarLucro(4,porc/3);
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em nenhum BANCO");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o para isso!");
	        format(msg,sizeof(msg),"%s usou o comando /depositargrana sem ser transportador.",PlayerName(playerid));
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

	if(strcmp(cmd, "/reforco", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
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
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
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
				}
				if(GetPlayerState(plid) == PLAYER_STATE_DRIVER){
				    SendClientMessage(playerid, COLOR_RED, "Ele n„o pode estar dirigindo.");
				    return 1;
				} else {
					if(dini_Exists(PlayerName(plid))){
					Presos[plid] = 1;
				    dini_IntSet(PlayerName(plid),"Preso",1);
					LogarPlayer(plid);
					format(string, sizeof(string), "VocÍ foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEGURAN«A, string);
      		        SendClientMessage(playerid, COLOR_GREEN, "Pris„o concluida");
          		  	GameTextForPlayer(plid, "~r~ preso!", 5000,0);
					format(string, sizeof(string), "O oficial %s prendeu %s, Senhor Juiz tome par do processo e esclareÁa os fatos!", PlayerName(playerid), PlayerName(plid));
					SendClientMessageToAll(COLOR_JUIZ, string);
					ConfiscarArmas(plid);
					AcrescentarExPoints(playerid,1);
					return 1;
					}
					else{
						printf("ERRO: N„o foi realizada a pris„o de %s",PlayerName(plid));
						printf("O arquivo do jogador n„o foi encontrado");
						return 0;
					}
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

    if(strcmp(cmd, "/desarmardrogas", true) == 0) {
       if(Profissao[playerid] == COP_NARCOTICOS || IsPlayerAdmin(playerid)){
		  if(!IsPlayerInAnyVehicle(playerid)){
		  SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo!");
		  return 1;
		  }
		  if(DrogasPlantadas[GetPlayerVehicleID(playerid)] <= 0){
		  SendClientMessage(playerid, COLOR_RED, "N„o h· drogas plantadas nesse veÌculo!");
		  return 1;
		  }
		  else{
			  TogglePlayerControllable(playerid,0);
			  DesarmandoAsDrogas[playerid] = 1;
			  TempoDesarme[playerid] = SetTimerEx("DesarmandoDrogas",60000,false,"d",playerid);
			  SendClientMessage(playerid, COLOR_COP_NARCOTICOS, "Desarmando as drogas, isso pode demorar um pouco...");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È NarcÛtico!");
			  return 1;
			  }
	}
    if(strcmp(cmd, "/vexame", true) == 0) {
       if(Profissao[playerid] == COP_NARCOTICOS || IsPlayerAdmin(playerid)){
		  if(!IsPlayerInAnyVehicle(playerid)){
		  SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo!");
		  return 1;
		  }
		  else{
			  if(DrogasPlantadas[GetPlayerVehicleID(playerid)] > 0){
			  new msg[256];
			  format(msg,sizeof(msg),"Foram encontradas %d droga(s) plantada(s) nesse veÌculo!",DrogasPlantadas[GetPlayerVehicleID(playerid)]);
			  SendClientMessage(playerid, COLOR_COP_NARCOTICOS, msg);
			  SendClientMessage(playerid, COLOR_COP_NARCOTICOS, "Use: /desplantardrogas para desplanta-las.");
			  return 1;
			  }
			  else{
				  SendClientMessage(playerid, COLOR_COP_NARCOTICOS, "N„o h· nenhuma droga nesse veiculo!");
				  return 1;
				  }
			  }
		  }
		  else{
			  SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È NarcÛtico!");
			  return 1;
			  }
	}
	if(strcmp(cmd, "/exame", true) == 0) {
	    if(Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == COP_SWAT || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid,COLOR_RED,"/exame [id]");
				return 1;
			}
			plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
			        SendClientMessage(playerid,COLOR_RED,"VocÍ est· muito longe, chegue mais perto!");
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_YELLOW,"Resultados do exame anti-dopping:");
				    format(msg, sizeof(msg), "Heroina : %d doses injetadas",QtHeroina[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    format(msg, sizeof(msg), "Maconha : %d doses fumadas",QtMaconha[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    format(msg, sizeof(msg), "CocaÌna : %d doses cheiradas",QtCocaina[plid]);
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
	  	if(Profissao[playerid] == ADVOGADO){
		    new tmp[256];
		    new plid;
		    new quant;
		    new string[256];
		    tmp = strtok(cmdtext,idx);
		    plid = strval(tmp);
	    	if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_ADVOGADO, "/fianca [id] [quantia]");
		    	return 1;
		    }
		    tmp = strtok(cmdtext,idx);
			quant = strval(tmp);
	   		if(!strlen(tmp)){
			   SendClientMessage(playerid, COLOR_ADVOGADO, "/fianca [id] [quantia]");
			   return 1;
	   		}
	   		if(Presos[plid] == 0){
			   SendClientMessage(playerid, COLOR_ADVOGADO, "O Jogador n„o est· preso.");
			   return 1;
	   		}
   			if(IsPlayerConnected(plid)){
	   			if(plid != playerid){
					format(string,sizeof(string),"O advogado %s est· lhe cobrando %d para lhe tirar da pris„o para aceitar faÁa /aceitar para recusar faÁa /recusar",PlayerName(playerid),quant);
				    SendClientMessage(plid,COLOR_ADVOGADO,string);
				    SendClientMessage(playerid, COLOR_ADVOGADO, "Proposta enviada");
				    envconvite[plid] = playerid;
				    dinheirofianca[plid] = quant;
				    invitestatus[plid] = INVITE_FIANCA;
				    return 1;
				} else {
					SendClientMessage(playerid, COLOR_ADVOGADO, "VocÍ n„o pode se prÛprio fazer uma oferta");
				    return 1;
		   		}
	   		} else {
		    	SendClientMessage(playerid, COLOR_ADVOGADO,"Jogador n„o conectado/logado");
		    	return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_ADVOGADO, "VocÍ n„o tem permissao");
		   	return 1;
		}
    }

	if(strcmp(cmd,"/tribunal",true) == 0) {
		if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid,plid2,tempo;
			tmp = strtok(cmdtext,idx);
			plid = strval(tmp);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED2, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
				return 1;
			}
			tmp = strtok(cmdtext,idx);
			plid2 = strval(tmp);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED2, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
				return 1;
			}
			tmp = strtok(cmdtext,idx);
			tempo = strval(tmp);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED2, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid,plid) > 15 || GetDistanceBetweenPlayers(playerid,plid2) > 15){
                SendClientMessage(playerid, COLOR_RED, "VocÍ est· longe de um dos jogadores indicados!");
				SendClientMessage(playerid, COLOR_RED, "Fique prÛximo dos dois jogadores.");
			    return 1;
			}
			if(IsPlayerConnected(plid)){
				if(IsPlayerConnected(plid2)){
					if(Tribunal[plid] == 0){
						if(Tribunal[plid2] == 0){
							if(tempo > 0 && tempo  < 4){
							    if(plid != plid2){
									Tribunal[plid] = 1;
									Tribunal[plid2] = 1;
									new msg[256];
									format(msg,sizeof(msg),"O Tribunal entre %s e %s comeÁar· daqui a %d minuto(s).",PlayerName(plid),PlayerName(plid2),tempo);
									SendClientMessageToAll(COLOR_JUIZ,msg);
									SendClientMessageToAll(COLOR_WHITE,"Arrumem um advogado...");
									SetTimerEx("InicioTribunal",60000*tempo,false,"ddd",plid,plid2,playerid);
									SetTimerEx("InicioTribunal2",58000*tempo,false,"ddd",plid,plid2,playerid);
									AcrescentarExPoints(playerid,1);
									return 1;
								} else {
									SendClientMessage(playerid, COLOR_RED2, "Jogadores diferentes.");
									return 1;
								}
							} else {
								SendClientMessage(playerid, COLOR_RED2, "O tempo deve ser no mÌnimo de 1 minuto e m·ximo de 3 minutos");
								return 1;
							}
						} else {
							SendClientMessage(playerid, COLOR_RED2, "J· existe um inquÈrito do Jogador 2. O tribunal dele iniciar· no tempo que o Sr. determinou.");
							return 1;
						}
					} else {
						SendClientMessage(playerid, COLOR_RED2, "J· existe um inquÈrito do Jogador 1. O tribunal dele iniciar· no tempo que o Sr. determinou.");
						return 1;
					}
				} else {
					SendClientMessage(playerid, COLOR_RED2, "Jogador 2 n„o conectado/logado.");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED2, "Jogador 1 n„o conectado/logado.");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem permiss„o.");
			return 1;
		}
	}
	if(strcmp(cmd,"/fimtribunal",true) == 0) {
		if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
		    new plid, plid2, tmp[256];
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/fimtribunal [id 1] [id 2]");
				return 1;
			}
        	plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/fimtribunal [id 1] [id 2]");
				return 1;
			}
        	plid2 = strval(tmp);
			if(IsPlayerConnected(plid)){
				if(IsPlayerConnected(plid2)){
 		 			if(Tribunal[plid] == 1){
 		 	   			if(Tribunal[plid2] == 1){
 		 	   			    if(plid != plid2){
								Tribunal[plid] = 0;
								Tribunal[plid2] = 0;
								declaracoesabertas[plid] = 0;
								declaracoesabertas[plid2] = 0;
								Audiencia[playerid] = 0;
								SetPlayerPos(plid,1546.5948,-1675.9949,13.5626);
								SetPlayerPos(plid2,1545.5948,-1675.9949,13.5626);
								SetPlayerPos(playerid,1547.5948,-1675.9949,13.5626);
								TogglePlayerControllable(plid,1);
								TogglePlayerControllable(plid2,1);
								SetPlayerInterior(playerid,0);
								SetPlayerInterior(plid,0);
								SetPlayerInterior(plid2,0);
							    format(string,sizeof(string),"O Sr.Juiz %s encerrou o caso entre %s e %s.",PlayerName(playerid), PlayerName(plid), PlayerName(plid2));
							    SendClientMessageToAll(COLOR_JUIZ, string);
							    return 1;
							} else {
								SendClientMessage(playerid, COLOR_RED2, "Jogadores diferentes.");
								return 1;
							}
					  	} else {
			   				SendClientMessage(playerid, COLOR_RED2, "O Jogador 2 n„o est· no Tribunal.");
							return 1;
			   			}
			   		} else {
			   			SendClientMessage(playerid, COLOR_RED2, "O Jogador 1 n„o est· no Tribunal.");
						return 1;
			   		}
				} else {
					SendClientMessage(playerid, COLOR_RED2, "Jogador 2 n„o conectado/logado.");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED2, "Jogador 1 n„o conectado/logado.");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem permiss„o.");
			return 1;
		}
	}
	if(strcmp(cmd,"/culpado",true) == 0) {
		if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
		   	new tmp[256];
		   	new plid;
		   	tmp = strtok(cmdtext,idx);
	   		if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/culpado [id]");
			    return 1;
			}
		    plid = strval(tmp);
		    if(IsPlayerConnected(plid)){
	   			if(declaracoesabertas[plid] == 1){
		   			new string[256];
				    format(string,sizeof(string),"O Sr. Juiz %s declarou o jogador %s CULPADO!",PlayerName(playerid),PlayerName(plid));
				    SendClientMessageToAll(COLOR_JUIZ,string);
				    SendClientMessageToAll(COLOR_JUIZ, "Sr. Juiz, declare o Tribunal encerrado. E logo em seguida der a pena ao re˙.");
		   			return 1;
	   			} else {
		   			SendClientMessage(playerid, COLOR_RED, "Este jogador n„o est· aberto para declaraÁıes.");
		   			return 1;
		   		}
	   		} else {
		   		SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
				return 1;
			}
		} else{
			SendClientMessage(playerid, COLOR_RED, "VocÍ nem devia estar mexendo neste comando!");
			return 1;
		}
    }

  	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == EXERCITO || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
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
                    if(dini_Exists(PlayerName(plid))){
				    dini_IntSet(PlayerName(plid),"Preso",0);
				    Presos[plid] = 0;
				    SetSpawnInfo(plid,0,dini_Int(PlayerName(playerid),"Skin"),1546.5948,-1675.9949,13.5626,0,0,0,0,0,0,0);
				    SpawnPlayer(plid);
				    SendClientMessage(plid,COLOR_GREEN,"VocÍ foi solto, mas se cometer mais crimes, pagar· novamente.");
	   				PrisaoTimer[playerid][1]=0;
					KillTimer(PrisaoTimer[playerid][0]);
				    format(tmp,sizeof(tmp),"VocÍ foi solto por %s",PlayerName(playerid));
				    SendClientMessage(plid,COLOR_GREEN,tmp);
				    GameTextForPlayer(plid, "~r~ Libertado!", 5000,0);
				    Contrabando[playerid] = 0;
					Receita[playerid] = 0;
					SetPlayerWantedLevel(plid, 0);
					dini_IntSet(PlayerName(plid),"Wanted",0);
					return 1;
					}
					else{
						printf("Bug encontrado ao soltar %s",PlayerName(plid));
						printf("O arquivo do jogador n„o foi encontrado");
						return 0;
					}
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Juiz/Delegado");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/tomarsorvete", true) == 0) {
	    if(AreaSorveteria[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na sorveteria!");
	        return 1;
		}
	   	if(TomandoSorvete[playerid] == 1){
            SendClientMessage(playerid, COLOR_RED, "Ei... VocÍ j· est· tomando sorvete! Tome esse ai primeiro para poder tomar outro.");
	   		return 1;
	   	} else {
	   	    ShowMenuForPlayer(Sorvetes,playerid);
	   	    TogglePlayerControllable(playerid,0);
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
			CreateObject(1238,X, Y-1, Z-2, 0, 0, 0);
            SendClientMessage(playerid, COLOR_GREEN, "VocÍ adicionou um cone neste local.");
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ n„o È Policial Rodoviario");
            return 1;
		}
	}
	if(strcmp(cmd, "/retirarmulta", true) == 0) {
	    if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new string[256];
			tmp = strtok(cmdtext,idx);
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "USO: /retirarmulta [id]");
			    return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
	            return 1;
			}
			if(dini_Int(PlayerName(plid),"Multa") <= 0){
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue multa!");
				SendClientMessage(playerid, COLOR_RED, "Os jogadores que possuem est„o em /multas");
				return 1;
			}
			if(plid == playerid){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode retirar suas prÛprias multas!");
			    return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_GREEN, "Multa retirada!");
				format(string,sizeof(string),"O jogador %s retirou sua multa de $%d",PlayerName(playerid),dini_Int(PlayerName(plid),"Multa"));
				SendClientMessage(plid, COLOR_WHITE, string);
				AcrescentarExPoints(playerid,1);
				format(string,sizeof(string),"**** %s retirou a multa de $%d de %s ****",PlayerName(playerid),dini_Int(PlayerName(plid),"Multa"),PlayerName(plid));
				SendClientMessageAdmin(COLOR_RECEITA_FEDERAL, string);
				writelog(string);
				dini_IntSet(PlayerName(plid),"Multa",0);
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È da Receita Federal!");
		    return 1;
		    }
	}
	if(strcmp(cmd, "/multas", true) == 0) {
	    if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
	        SendClientMessage(playerid, COLOR_WHITE, "|=======| MULTAS |=======|");
			for(new i=0; i<MAX_PLAYERS; i++){
				if(dini_Int(PlayerName(i),"Multa") > 0){
				    new str[256];
				    format(str,sizeof(str),"%d - %s | Multa de: $%d",i,PlayerName(i),dini_Int(PlayerName(i),"Multa"));
				    SendClientMessage(playerid, COLOR_YELLOW, str);
				}
			}
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È da Receita Federal!");
		    return 1;
  		}
	}
	if(strcmp(cmd, "/pagarmulta", true) == 0) {
	    new str[256];
	    if(AreaDelegacia[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na Delegacia!");
			return 1;
		}
		if(dini_Int(PlayerName(playerid),"Multa") <= 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue multa para pagar!");
		    return 1;
		}
		if(GetPlayerMoney(playerid) < dini_Int(PlayerName(playerid),"Multa")){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro!");
		    format(str,sizeof(str),"Sua multa È de $%d",dini_Int(PlayerName(playerid),"Multa"));
			return 1;
		}
		else{
		    ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,0,1);
		    GivePlayerMoney(playerid,-dini_Int(PlayerName(playerid),"Multa"));
			format(str,sizeof(str),"VocÍ pagou sua multa de $%d",dini_Int(PlayerName(playerid),"Multa"));
			SendClientMessage(playerid, COLOR_GREEN, str);
			dini_IntSet(PlayerName(playerid),"Multa",0);
			return 1;
		}
	}
	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == RECEITA_FEDERAL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
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
			if(Profissao[plid] == COP_MILITAR || Profissao[plid] == RECEITA_FEDERAL || Profissao[plid] == COP_RODOVIARIO || Profissao[plid] == COP_SWAT){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode multar um policial/receita federal.");
				return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "VocÍ recebeu uma multa de $%d dada por %s. Para pagar vocÍ deve ir atÈ a Delegacia.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(playerid, COLOR_GREEN, "Multa dada.");
				dini_IntSet(PlayerName(plid),"Multa", dini_Int(PlayerName(plid),"Multa") + quant);
				GivePlayerMoney(playerid, 50);
				if(JogadorMultado[plid]==0){
				    JogadorMultado[plid]=1;
				    SetTimerEx("ZerarJogadorMultado",130000,false,"d",plid);
					AcrescentarExPoints(playerid,1);
					return 1;
					}
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
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == EXERCITO  || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
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
				dini_IntSet(PlayerName(plid),"Wanted", dini_Int(PlayerName(plid),"Wanted") + 1);
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
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == EXERCITO  || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
		    new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/desprocurar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
				Procurados[plid] = 0;
			 	format(string, sizeof(string), "O Jogador %s foi removido da lista de procurados pelo oficial: %s",PlayerName(plid),PlayerName(playerid));
				SendClientMessageToAll(COLOR_COP_MILITAR,string);
				SendClientMessage(plid, COLOR_GREEN, "VocÍ foi retirado da lista de procurados");
				SetPlayerWantedLevel(plid,0);
				dini_IntSet(PlayerName(plid),"Wanted", 0);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È policial");
			return 1;
		}
	}
	
    if(strcmp(cmd, "/assaltar", true) == 0) {
	    if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
        	if(AreaBanco[playerid] == 1){
				if(TempoAssalto[playerid] == 0){
				    new string[256];
				    new assalt;
				    assalt = minrand(800,1500);
					GivePlayerMoney(playerid, assalt);
					SendClientMessage(playerid, COLOR_ASSALTANTE, "Roubo feito! Agora FUJA!");
					SendClientMessagePolicia(COLOR_COP_SWAT, string);
					TempoAssalto[playerid]++;
					AcrescentarExPoints(playerid,1);
					if(pickupbancoselecionada[playerid] == 1){
						SetPlayerInterior(playerid,0);
					    SetPlayerFacingAngle(playerid,260.9407);
					    SetPlayerPos(playerid,1771.7144,-1655.8201,14.4236);
					    pickupbancoselecionada[playerid] = 0;
					    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
				 	}
				   	else if(pickupbancoselecionada[playerid] == 2){
						SetPlayerInterior(playerid,0);
					    SetPlayerFacingAngle(playerid,260.9407);
					    SetPlayerPos(playerid,1386.0540,-1015.7602,26.6676);
					    pickupbancoselecionada[playerid] = 0;
					    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
				   	}
					else if(pickupbancoselecionada[playerid] == 3){
						SetPlayerInterior(playerid,0);
					    SetPlayerFacingAngle(playerid,260.9407);
					    SetPlayerPos(playerid,419.7245,-1428.6298,32.4797);
					    pickupbancoselecionada[playerid] = 0;
					    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
				    }
				   	else if(pickupbancoselecionada[playerid] == 4){
						SetPlayerInterior(playerid,0);
				    	SetPlayerFacingAngle(playerid,260.9407);
				    	SetPlayerPos(playerid,2862.3201,-1440.2727,10.9410);
				   		pickupbancoselecionada[playerid] = 0;
				   	    pickupsaidabanco = CreatePickup(bancoi,2,2306.8198,-16.0497,26.7496);
				   	}
					SetTimerEx("AssaltanteSaiu",15000,0,"d",playerid);
 					SetTimerEx("Assalto",600000,0,"d",playerid);
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
	
	if(strcmp(cmd, "/roubar", true)==0){
	    if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
	        new tmp[256], plid, distancia, string[256], rand;
			new grana = GetPlayerMoney(plid);
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
		    	SendClientMessage(playerid, COLOR_RED,"/roubar [id]");
				return 1;
			}
			plid = strval(tmp);
			if(Profissao[plid] == ASSALTANTE){
		    	SendClientMessage(playerid, COLOR_RED,"VocÍ n„o pode se auto-assaltar!");
				return 1;
			}
		   	if(RouboMao[playerid] == 1){
		    	SendClientMessage(playerid, COLOR_RED,"Calma. Espere a poeira baixar para realizar outro assalto.");
				return 1;
			}
			if(!IsPlayerConnected(plid)){
		    	SendClientMessage(playerid, COLOR_RED,"O Jogador n„o est· conectado.");
				return 1;
			}
			distancia = GetDistanceBetweenPlayers(playerid, plid);
			if(distancia > 15){
		    	SendClientMessage(playerid, COLOR_RED,"Para realizar o roubo vocÍ tem que estar mais prÛximo.");
				return 1;
			}
			if(grana < 40){
		    	SendClientMessage(playerid, COLOR_RED,"N„o vale a pena assaltar ele. Est· praticamente sem grana.");
				return 1;
			}
			rand = random(2);
			if(rand == 0) {
				format(string, sizeof(string), "O assaltante %s tentou lhe assaltar, mas n„o obteve sucesso.",PlayerName(playerid));
			    SendClientMessage(plid, COLOR_AZULPLUS, string);
				format(string, sizeof(string), "O seu roubo contra %s falhou.",PlayerName(plid));
			    SendClientMessage(playerid, COLOR_RED2, string);
			    RouboMao[playerid] = 1;
				SetTimerEx("RouboMao",240000,false,"d",playerid);
				return 1;
			}
			new roubo = random(grana);
			format(string, sizeof(string), "O assaltante %s, roubou $%d dÛlares de vocÍ.",PlayerName(playerid), roubo);
			SendClientMessage(plid, COLOR_VERDE_AQUA, string);
            GivePlayerMoney(plid,  -roubo);
			format(string, sizeof(string), "VocÍ conseguiu roubar $%d dÛlares de %s",roubo,PlayerName(plid));
		    SendClientMessage(playerid, COLOR_VERDE_AQUA, string);
           	GivePlayerMoney(playerid, roubo);
           	RouboMao[playerid] = 1;
           	SetTimerEx("RouboMao",300000,false,"d",playerid);
           	AcrescentarExPoints(playerid,1);
			return 1;
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Assaltante.");
			return 1;
		}
	}
	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || IsPlayerAdmin(playerid)){
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
    if(strcmp(cmd, "/camuflar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid,tempo,custo,string[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "USO: /camuflar [id/do/jogador] [minutos]");
				return 1;
			}
			plid = strval(tmp);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "USO: /camuflar [id/do/jogador] [minutos]");
				return 1;
			}
			tempo = strval(tmp);
			if(!IsPlayerConnected(plid)){
				SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
				return 1;
			}
			if(tempo > 10){
				SendClientMessage(playerid, COLOR_RED, "Tempo m·ximo de 10 minutos!");
				return 1;
			}
			if(tempo < 1){
				SendClientMessage(playerid, COLOR_RED, "Tempo mÌnimo de 1 minuto!");
				return 1;
			}
			custo = tempo*50;
			if(GetPlayerMoney(plid) < custo){
				SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue dinheiro!");
				return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode se auto-camuflar!");
				return 1;
			}
			if(Camuflado[plid] == 1){
			    SendClientMessage(playerid, COLOR_RED, "Ei, esse jogador j· est· camuflado!");
			    return 1;
			}
			else{
				Camuflado[plid] = 1;
				SetPlayerColor(plid,0xFFFFFF00);
				format(string,sizeof(string),"%s te camuflou por %d minutos! A camuflagem custou $%d",PlayerName(playerid),tempo,custo);
				SendClientMessage(plid, COLOR_VENDEDOR_DE_ARMAS, string);
				format(string,sizeof(string),"Camuflagem aplicada! Ela custou $%d mas vocÍ ficou com 50 por cento! Resultado: vocÍ ficou com $%d",custo,custo/2);
				SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS, string);
				GivePlayerMoney(plid,-custo);
				GivePlayerMoney(playerid,custo/2);
				if(JogadorContratado(playerid,5)) AcrescentarLucro(5,custo/2);
				AcrescentarExPoints(playerid,1);
				SetTimerEx("FimCamuflagem",tempo*60000,0,"d",plid);
				for(new i; i<MAX_PLAYERS; i++){
		    	ShowPlayerNameTagForPlayer(plid,i,0);
				return 1;
				}
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Vendedor de Armas!");
			return 1;
			}
	}
	if(strcmp(cmd, "/venderarma", true) == 0) {
        if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, weaponid;
			new venda;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/venderarma [id] [id/da/arma]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/venderarma [id] [id/da/arma]");
				return 1;
			}
			if(plid == playerid){
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
					 	format(string, sizeof(string), "VocÍ comprou a arma: %s pelo valor de %d",weaponname[weaponid], valorarma[weaponid] );
   			         	SendClientMessage(plid, COLOR_JUIZ, string);
   			         	venda = valorarma[weaponid]/10;
   			         	GivePlayerMoney(playerid, venda);
   			         	GivePlayerMoney(plid, 0-valorarma[weaponid]);
			         	SendClientMessage(playerid, COLOR_GREEN, "Arma vendida!!");
					 	format(string,sizeof(string),"VocÍ recebeu $%d",venda);
			         	SendClientMessage(playerid, COLOR_GREEN , string);
			         	AcrescentarExPoints(playerid,1);
			         	new propertielucro = valorarma[weaponid]-venda;
			         	if(JogadorContratado(playerid,5)) AcrescentarLucro(5,propertielucro);
				 	 	return 1;
					 	}
					 	else{
							SendClientMessage(playerid, COLOR_RED, "O jogador n„o tem dinheiro para pagar a arma!");
							return 1;
					 		}
		 			 }
		 			 else{
					 	SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
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
		   if(Profissao[plid] == VENDEDOR_DE_ARMAS){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender armas para vocÍ!");
				return 1;
	       }
	       if(GetPlayerMoney(plid) < 200){
	            SendClientMessage(playerid, COLOR_RED, "O jogador n„o tem dinheiro!");
	            return 1;
		   }
		   if(IsPlayerConnected(plid)){
		   		SetPlayerArmour(plid,100);
		   		SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS, "Colete vendido");
		   		SendClientMessage(plid, COLOR_VENDEDOR_DE_ARMAS, "VocÍ recebeu um colete");
		   		GivePlayerMoney(plid,-200);
		   		if(JogadorContratado(playerid,5)){
		   		    GivePlayerMoney(playerid,100);
		   		    AcrescentarLucro(5,100);
		   		    SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS, "VocÍ recebeu $100 e o resto ficou com a sua propriedade!");
				}
				else{
				    GivePlayerMoney(playerid,200);
				    SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS, "VocÍ recebeu $200 pela venda.");
				}
      	   		return 1;
		   }
		   else{
			   SendClientMessage(playerid, COLOR_RED2, "Jogador n„o conectado/logado");
			   return 1;
			   }
		   }
		   else{
			   SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o È vendedor de armas!");
			   return 1;
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
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode se auto-sequestrar!");
				return 1;
			}
			if(distancia > 20) {
   				SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
				return 1;
			}
	        if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1) {
				SendClientMessage(playerid, COLOR_GREEN, "Pessoa Sequestrada!");
				Sequestro[plid] = 1;
				Sequestrador[plid] = playerid;
				AcrescentarExPoints(playerid,1);
				SendClientMessage(plid, COLOR_RED, "VocÍ est· sendo Perseguido para fugir digite /fugir!");
				SendClientMessage(plid, COLOR_RED, "Se n„o FUGIR ou Matar o SEQUESTRADOR ser· sequestrado em 10 minutos!");
				return 1;
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador n„o est· conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != ASSASSINO){
		    SendClientMessage(playerid, COLOR_GREEN, "VocÍ n„o È Assasino!");
			return 1;
		}
	}

    if(strcmp(cmd, "/resgate", true) == 0 && Cativeiro[playerid] == 1) {
	  if(Cativeiro[playerid] == 1){
		Sequestro[playerid] = 0;
		Cativeiro[playerid] = 0;
		LogarPlayer(playerid);
		SendClientMessage(playerid, COLOR_GREEN, "VocÍ pagou o resgate no valor de $5000 e foi solto.");
		dini_IntSet(PlayerName(playerid),"Banco", dini_Int(PlayerName(playerid),"Banco") - 5000);
		GivePlayerMoney(Sequestrador[playerid], 5000);
		SendClientMessage(Sequestrador[playerid], COLOR_GREEN, "VocÍ recebeu a fuga no valor de $5000!");
		Sequestrador[playerid] = 0;
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· sequestrado!");
			return 1;
			}
	}

	if(strcmp(cmd, "/fugir", true) == 0) {
      if(Sequestro[playerid] == 1){
		Sequestro[playerid] = 0;
		SendClientMessage(playerid, COLOR_GREEN, "VocÍ pagou a fuga no valor de $1500 e conseguiu fugir.");
		dini_IntSet(PlayerName(playerid),"Banco", dini_Int(PlayerName(playerid),"Banco") - 1500);
		GivePlayerMoney(Sequestrador[playerid], 1500);
		SendClientMessage(Sequestrador[playerid], COLOR_GREEN, "VocÍ recebeu a fuga no valor de $1500!");
		Sequestrador[playerid] = 0;
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· sequestrado!");
			return 1;
			}
	}

	if(strcmp(cmd, "/radar", true) == 0) {
	    if(Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_SWAT || IsPlayerAdmin(playerid) == 1){
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
	        			dini_IntSet(PlayerName(plid),"Banco", dini_Int(PlayerName(playerid),"Banco")- desconto);
					    new string2[MAX_STRING];
					    format(string2, MAX_STRING, "O RADAR mostrou que %s estava a %d KpH e foi dada a multa de $%d para esta pessoa!", PlayerName(plid), velocidade, desconto);
						SendClientMessage(playerid, COLOR_RED, string2);
	        			new string[MAX_STRING];
					    format(string, sizeof(string), "VocÍ passou no radar de um policial rodovi·rio a %d KpH, e levou uma multa de $%d por estar acima da velocidade permitida!", velocidade, desconto);
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
		if(dini_Int(PlayerName(playerid),"PhoneNumb") == 0){
			SendClientMessage(playerid, COLOR_YELLOW, "VocÍ n„o tem celular!");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == VENDEDOR_DE_ARMAS){
	    			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
					SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		           	SendClientMessage(playerid,COLOR_VENDEDOR_DE_ARMAS,"A mensagem foi enviada para o vendedor de armas.");
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
			format(string, sizeof(string), "O Vendedor de armas %s est· lhe oferecendo a arma: %s pelo valor de %d.",PlayerName(playerid),weaponname[weaponid],valorarma[weaponid]);
   			SendClientMessage(plid, COLOR_JUIZ, string);
			SendClientMessage(plid, COLOR_GREEN, "Caso queira a arma digite: /comprararma , caso n„o digite: /recusararma.");
			SendClientMessage(plid, COLOR_GREEN, "Para a compra ser realizar È necess·rio estar perto do vendedor.");
			SendClientMessage(playerid, COLOR_GREEN, "Arma Oferecida!");
			Armaoferecida[plid] = 1;
			return 1;
		}
	}
}
	if(strcmp(cmd, "/recusararma", true) == 0){
	    if(Armaoferecida[playerid] == 1){
	        Armaoferecida[playerid] = 0;
	        SendClientMessage(playerid, COLOR_GREEN, "Pronto! VocÍ n„o aceitou a arma!");
	        return 1;
	    }
		else if(Armaoferecida[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "NinguÈm est· lhe oferencendo arma!");
	        return 1;
	    }
	}
	if(strcmp(cmd, "/comprararma", true) == 0){
	    if(Armaoferecida[playerid] == 1){
	        new string[256];
	        for(new i=0; i<MAX_PLAYERS; i++){
            SendClientMessage(playerid, COLOR_GREEN, "Pedido enviado aguarde o vendedor.");
            format(string, sizeof(string), "O Jogador %s aceitou sua oferta de arma",PlayerName(i));
   			SendClientMessageVendedor(COLOR_JUIZ, string);
   			SendClientMessageVendedor(COLOR_GREEN, "Para vender chegue perto do comprador.");
 			Armaoferecida[playerid] = 0;
	        return 1;
  		    }
  		}
  	    else if(Armaoferecida[playerid] == 0){
        	SendClientMessage(playerid, COLOR_GREEN, "NinguÈm est· lhe oferecendo arma!");
	    	return 1;
	    }
	}

    if(strcmp(cmd, "/demitindoazarados", true) == 0){
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "USO: /demitindoazarados [id/do/jogador]");
				return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
				SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
				return 1;
			}
			if(Profissao[plid] == DESEMPREGADO){
				SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue uma profiss„o!");
				return 1;
			}
			else{
				dini_IntSet(PlayerName(plid),"Prof",1);
				Profissao[plid] = 1;
				LogarPlayer(plid);
				TrancarVeiculoPorProf(plid);
				SendClientMessage(playerid, COLOR_WHITE, "Jogador demitido!");
				SendClientMessage(plid, COLOR_RED, "VocÍ foi demitido de sua profiss„o!");
				new string[256];
				format(string,sizeof(string),"SERVIDOR: O jogador %s foi DEMITIDO de sua profiss„o.",PlayerName(plid));
				SendClientMessageToAll(COLOR_COP_SWAT, string);
				writelog(string);
				dini_IntSet(PlayerName(plid),"Skin",ProfSkin[1]);
				LogarPlayer(plid);
				SetPlayerPos(plid,ProfPos[1][0],ProfPos[1][1],ProfPos[1][2]);
				GameTextForPlayer(plid,"~r~DEMITIDO!",4000,4);
				return 1;
			}
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o!");
			return 1;
			}
	}
	
	if(strcmp(cmd, "/empregandosortudos", true) == 0 && IsPlayerConnected(playerid)) {
		if(IsPlayerAdmin(playerid) == 1) {
		    new tmp[256];
	    	new plid;
		    new prof;
		    new string[256];
			plid = playerid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/empregandosortudos [prof]");
				return 1;
			}
	        prof = strval(tmp);
	        if(IsPlayerConnected(plid)){
	        if(IsPlayerInAnyVehicle(plid)) RemovePlayerFromVehicle(playerid);
        	if(prof > 0 && prof < 41 ){
        	        DisablePlayerCheckpoint(playerid);
					dini_IntSet(PlayerName(plid),"Prof", prof);
					format(string, sizeof(string), "VocÍ mudou a profiss„o de %s para %s." , PlayerName(plid), ProfExtName[prof]);
					SendClientMessage(playerid, COLOR_GREEN, string);
					SendClientMessage(plid, COLOR_GREEN, "Para ver os comandos da sua profiss„o digite /profissao.");
        	     	SendClientMessage(plid, COLOR_ROSA,  "Para saber as regras digite /regras1 e /regras2");
					Profissao[plid] = prof;
					TrancarVeiculoPorProf(plid);
					dini_IntSet(PlayerName(plid),"Skin",ProfSkin[prof]);
					LogarPlayer(plid);
					SetPlayerPos(plid,ProfPos[prof][0],ProfPos[prof][1],ProfPos[prof][2]);
					format(string,sizeof(string),"~w~%s",ProfGT[prof]);
					GameTextForPlayer(plid,string,3000,3);
				    return 1;
					} else {
				    SendClientMessage(playerid, COLOR_RED, "Essa n„o È uma profisss„o v·lida!");
					return 1;
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
				}
			}
			return 1;
		}
	}

	if (strcmp(cmdtext, "/instrucoes", true)==0){
	    if(Profissao[playerid] == BARMAN) {
	        SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "VocÍ deve vender bebidas com o consentimento do jogador");
	        SendClientMessage(playerid, COLOR_WHITE, "O server proÌbe a venda de mais de 3 bebidas para 1 ˙nico jogador,");
	        SendClientMessage(playerid, COLOR_WHITE, "no prazo de 20 minutos, sendo automaticamente kikado.");
	        SendClientMessage(playerid, COLOR_WHITE, "VocÍ tambÈm dar a bebida por teor dependendo do que o cliente pedir");
  	    }
		else if(Profissao[playerid] == ASSASSINO) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
			SendClientMessage(playerid, COLOR_WHITE, "Sua profiss„o tem as habilidades de sequestrar e fazer carreira matando");
			SendClientMessage(playerid, COLOR_WHITE, "Sendo simples, sequestrar e esperar o sequestro ou o resgate,");
			SendClientMessage(playerid, COLOR_WHITE, "tomando cuidado com os policiais e jogadores que vocÍ tentou assassinar");
			SendClientMessage(playerid, COLOR_WHITE, "Existe 1 recurso que esconde vocÍ do mapa: /esconder-se");
   			SendClientMessage(playerid, COLOR_WHITE, "Com isso vocÍ pode se esconder, Fica ao seu critÈrio.");
	    }
	    else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
	        SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
            SendClientMessage(playerid, COLOR_WHITE, "A venda de carros È computada pelo computador e È vista por todos");
            SendClientMessage(playerid, COLOR_WHITE, "Caso seja visto algum abuso, haver· Kick ou atÈ mesmo BAN de NICK!");
            SendClientMessage(playerid, COLOR_WHITE, "Os ids dos carros e preÁos est· nessa tabela: /veiculos.");
        }
  		else if(Profissao[playerid] == CORRETOR) {
  		    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
            SendClientMessage(playerid, COLOR_WHITE, "Vende Casas, o server computa todas as casas");
            SendClientMessage(playerid, COLOR_WHITE, "Caso haja abuso poder· resultar em Kick ou BAN de NICK!");
            SendClientMessage(playerid, COLOR_WHITE, "Os preÁos das casas est„o em /regras1 Lima- 5™!");
        }
		else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
       	 	SendClientMessage(playerid, COLOR_WHITE, "Descendo o rio vocÍ chegar· na ·rea de Pesca, a venda da pesca È");
			SendClientMessage(playerid, COLOR_WHITE, "No local aonde vocÍ spawna");
		}
	    else if(Profissao[playerid] == INSTRUTOR) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "Existe 2 carros com 1 vaga na meio para fazer a baliza pegue outro carro e peÁa");
			SendClientMessage(playerid, COLOR_WHITE, "para que o jogador coloque-o entre os carros, caso ele bata ser· adicionado $100");
            SendClientMessage(playerid, COLOR_WHITE, "no pagamento da carteira, feito isso peÁa que ele pegue outro carro e lhe leve atÈ");
            SendClientMessage(playerid, COLOR_WHITE, "a casa do CJ, n„o precisa respeitar os sinais, e pode desrespeitar um pouco as faixas");
            SendClientMessage(playerid, COLOR_WHITE, "caso ele bata adicione mais $100 a cada batida na carteira");
            SendClientMessage(playerid, COLOR_WHITE, "Obs: O percurso È ida e volta, vocÍ pode orienta-lo");
            SendClientMessage(playerid, COLOR_WHITE, "para ver os preÁos das carteiras digite /carteiras");
            SendClientMessage(playerid, COLOR_WHITE, "Ao inicio do teste destranque o(s) veÌculo(s) da auto escola (/destrancarveiculoauto)");
            SendClientMessage(playerid, COLOR_WHITE, "Depois n„o esqueÁa de tranca-lo(s) novamente (/trancarveiculoauto)");
        }
        else if(Profissao[playerid] == COP_MILITAR) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "… proibido multar sem causa, resulta em Kick, alguns casos Ban!");
			SendClientMessage(playerid, COLOR_WHITE, "… proibido procurar sem causa.");
			SendClientMessage(playerid, COLOR_WHITE, "O reforco È solicitado caso vocÍ veja que est· complicado pegar o miliante");
			SendClientMessage(playerid, COLOR_WHITE, "Para ver a carteira È necess·rio que o jogador esteja em 1 carro, caso o carro seja do server ou de outro jogador");
			SendClientMessage(playerid, COLOR_WHITE, "A multa ser· de $150");
			SendClientMessage(playerid, COLOR_WHITE, "… PROIBIDO prender assassino, caso ele mate algum jogador, È necess·rio mata-lo, n„o prender!");
			SendClientMessage(playerid, COLOR_WHITE, "Roubo de viaturas È dada uma multa de $300 reais");
			SendClientMessage(playerid, COLOR_WHITE, "Roubo de viaturas È dada uma multa de $300 reais");
     	}
        else if(Profissao[playerid] == COP_RODOVIARIO) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "… proibido multar sem causa, resulta em Kick, alguns casos Ban!");
			SendClientMessage(playerid, COLOR_WHITE, "… proibido procurar sem causa.");
			SendClientMessage(playerid, COLOR_WHITE, "O reforco È solicitado caso vocÍ veja que est· complicado pegar o miliante");
			SendClientMessage(playerid, COLOR_WHITE, "Para ver a carteira È necess·rio que o jogador esteja em 1 carro, caso o carro seja do server ou de outro jogador");
			SendClientMessage(playerid, COLOR_WHITE, "A multa ser· de $150");
			SendClientMessage(playerid, COLOR_WHITE, "… PROIBIDO prender assassino, caso ele mate algum jogador, È necess·rio mata-lo, n„o prender!");
			SendClientMessage(playerid, COLOR_WHITE, "Roubo de viaturas È dada uma multa de $300 reais");
			SendClientMessage(playerid, COLOR_WHITE, "Para fazer 1 Blitz digite /cone e criar· 1 cone");
		}
      	else if(Profissao[playerid] == COP_SWAT) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "… proibido multar sem causa, resulta em Kick, alguns casos Ban!");
			SendClientMessage(playerid, COLOR_WHITE, "… proibido procurar sem causa.");
			SendClientMessage(playerid, COLOR_WHITE, "O reforco È solicitado caso vocÍ veja que est· complicado pegar o miliante");
			SendClientMessage(playerid, COLOR_WHITE, "Para ver a carteira È necess·rio que o jogador esteja em 1 carro, caso o carro seja do server ou de outro jogador");
			SendClientMessage(playerid, COLOR_WHITE, "A multa ser· de $150");
			SendClientMessage(playerid, COLOR_WHITE, "… PROIBIDO prender assassino, caso ele mate algum jogador, È necess·rio mata-lo, n„o prender!");
			SendClientMessage(playerid, COLOR_WHITE, "Roubo de viaturas È dada uma multa de $300 reais");
			SendClientMessage(playerid, COLOR_WHITE, "Para fazer 1 Blitz digite /cone e criar· 1 cone");
      	}
      	else if(Profissao[playerid] == EXERCITO) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "… proibido multar sem causa, resulta em Kick, alguns casos Ban!");
			SendClientMessage(playerid, COLOR_WHITE, "… proibido procurar sem causa.");
			SendClientMessage(playerid, COLOR_WHITE, "O reforco È solicitado caso vocÍ veja que est· complicado pegar o miliante");
			SendClientMessage(playerid, COLOR_WHITE, "Para ver a carteira È necess·rio que o jogador esteja em 1 carro, caso o carro seja do server ou de outro jogador");
			SendClientMessage(playerid, COLOR_WHITE, "A multa ser· de $150");
			SendClientMessage(playerid, COLOR_WHITE, "… PROIBIDO prender assassino, caso ele mate algum jogador, È necess·rio mata-lo, n„o prender!");
			SendClientMessage(playerid, COLOR_WHITE, "Roubo de viaturas È dada uma multa de $300 reais");
			SendClientMessage(playerid, COLOR_WHITE, "Para fazer 1 Blitz digite /cone e criar· 1 cone");
      	}
      	else if(Profissao[playerid] == DELEGADO) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "… proibido multar sem causa, resulta em Kick, alguns casos Ban!");
			SendClientMessage(playerid, COLOR_WHITE, "… proibido procurar sem causa.");
			SendClientMessage(playerid, COLOR_WHITE, "O reforco È solicitado caso vocÍ veja que est· complicado pegar o miliante");
			SendClientMessage(playerid, COLOR_WHITE, "Para ver a carteira È necess·rio que o jogador esteja em 1 carro, caso o carro seja do server ou de outro jogador");
			SendClientMessage(playerid, COLOR_WHITE, "A multa ser· de $150");
			SendClientMessage(playerid, COLOR_WHITE, "… PROIBIDO prender assassino, caso ele mate algum jogador, È necess·rio mata-lo, n„o prender!");
			SendClientMessage(playerid, COLOR_WHITE, "Roubo de viaturas È dada uma multa de $300 reais");
			SendClientMessage(playerid, COLOR_WHITE, "Para fazer 1 Blitz digite /cone e criar· 1 cone");
      	}
      	else if(Profissao[playerid] == COP_NARCOTICOS) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "Sempre no calo do traficante, podendo checar as ·reas e informar aos outros policiais");
			SendClientMessage(playerid, COLOR_WHITE, "… proibido procurar sem causa, prender sem causa, a pris„o sÛ pode ser concluÌda caso veja algum");
			SendClientMessage(playerid, COLOR_WHITE, "traficante vendendo drogas, reforco È solicitado caso vocÍ veja que est· complicado pegar o miliante");
			SendClientMessage(playerid, COLOR_WHITE, "Quando alguÈm for pego no exame anti-dopping, leve esse para um ParamÈdico para fazer o tratamento e tirar as drogas");
			SendClientMessage(playerid, COLOR_WHITE, "do sangue desse jogador, depois prenda esse jogador...");
			SendClientMessage(playerid, COLOR_WHITE, "Blitz, carteiras, n„o faz parte do seu departamento!");
    	}
       	else if(Profissao[playerid] == RECEITA_FEDERAL) {
      	    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "VocÍ tem agentes infiltrados e consegue ver o que o Beco quer.");
			SendClientMessage(playerid, COLOR_WHITE, "Sendo o objetivo inviabilizar o desmanche dos carros nas oficinas podendo convocar a policia");
			SendClientMessage(playerid, COLOR_WHITE, "O Contrabando È realizado no navio de SF, vocÍ tem que chec·-lo sempre para ver se n„o tem algum");
			SendClientMessage(playerid, COLOR_WHITE, "contrandista fazendo atos ilegais");
		}
		else if(Profissao[playerid] ==  FRENTISTA){
		    SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
	        SendClientMessage(playerid, COLOR_WHITE, "Vende g·s para as pessoas que est„o sem gasolina, caso o server registre algum abuso");
			SendClientMessage(playerid, COLOR_WHITE, "Resultar· em Kick!");
		}
        else if(Profissao[playerid] ==  MECANICO){
            SendClientMessage(playerid, COLOR_GREEN, "|---------------------------------| InstruÁıes |--------------------------------------|");
			SendClientMessage(playerid, COLOR_WHITE, "Reboca os carros, pinta, desamaÁa. Caso seja reparado algum abuso haver· Kick ou atÈ mesmo Ban!");
	    }
	    else{
			SendClientMessage(playerid, COLOR_GREEN, "Profiss„o sem instruÁıes");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
		}
		return 1;
	}
	if(strcmp(cmdtext, "/profissao", true)==0){
          if(Profissao[playerid] == DESEMPREGADO) {
 	        SendClientMessage(playerid, COLOR_RED2, "Desempregado - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
            SendClientMessage(playerid, COLOR_WHITE, "/pegarlata : ComeÁa a fazer um circuito pegando latas.");
            SendClientMessage(playerid, COLOR_WHITE, "/minhaslatas : Verifica quantas latas vocÍ possue!");
        	SendClientMessage(playerid, COLOR_WHITE, "/pararcoleta : Para de coletar latinhas!");
        	SendClientMessage(playerid, COLOR_WHITE, "/venderlatas : Vende suas latas!");
	      }
    	  else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_RED2, "Barman - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/cerveja [id] [teor] : Vender cerveja, pode ser detectado  no  sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/whisky [id] [teor] : Vender whisky, pode detectar no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/pinga [id] [teor] : Vender pinga, pode ser detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/guarana [id] [copos] : Vender guaran·, n„o È detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_GREEN, "Cuidado! Se a policia pegar o seu cliente dirigindo bÍbado, ele vai preso! Avise-o.");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes = para ver as instrucoes da sua profiss„o");
  	      }
  	      else if(Profissao[playerid] == ASSASSINO) {
			SendClientMessage(playerid, COLOR_RED2, "Assassino - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/sequestrar [id] : sequestra 1 pessoa para ganhar $$!");
			SendClientMessage(playerid, COLOR_WHITE, "Apenas mate e ganhe $$");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes = para ver as instrucoes da sua profiss„o");
			SendClientMessage(playerid, COLOR_RED2, "VocÍ tambÈm poder· matar jogadores com a cabeÁa premiada para poder ganhar $$ e XL.");
		  }
          else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_RED2,  "Vendedor de VeÌculos - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/setcar [id-do-carro] [id-do-comprador] [cor1] [cor2] : Vende um carro (esteja com ele na posiÁ„o de spawn).");
			SendClientMessage(playerid, COLOR_WHITE, "/trocardono [id] : troca o dono do veÌculo");
			SendClientMessage(playerid, COLOR_WHITE, "AtenÁ„o: Na hora de setar carros, NUNCA use ‚ngulo, pois o servidor poder· travar.");
			SendClientMessage(playerid, COLOR_WHITE, "N„o se preocupe quanto ao ‚ngulo, pois o nosso script o pega para vocÍ!");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes = para ver as instrucoes da sua profiss„o");
          }
          else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_RED2, "Corretor de ImÛveis - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/casa [id] : Seta a casa para alguÈm (esteja na posiÁao exterior ‡ casa).");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes = para ver as instrucoes da sua profiss„o");
          }
          else if(Profissao[playerid] == SEGURAN«A) {
			SendClientMessage(playerid, COLOR_RED2, "SeguranÁa - Comandos:");
 	    	SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
 	    	SendClientMessage(playerid, COLOR_WHITE, "/contratarseguranca [id] [valor] : Esse È o comando que os seus chefes usam para lhe contratar.");
 	    	SendClientMessage(playerid, COLOR_WHITE, "Sem comandos especiais, procure um jornalista e anuncie seus serviÁos.");
  	      }
          else if(Profissao[playerid] == MOTORISTA) {
		    SendClientMessage(playerid, COLOR_RED2, "Motorista Particular - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/lavarlimosine : Leva a limosine para a lavagem.");
			SendClientMessage(playerid, COLOR_WHITE, "/revisarlimosine : Faz revis„o da limosine.");
	      }
          else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		    SendClientMessage(playerid, COLOR_RED2, "Motorista de ‘nibus - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "Tarifa autom·tica, ao entrar o passageiro pagar·.");
          }
	      else if(Profissao[playerid] == CAMINHONEIRO) {
		    SendClientMessage(playerid, COLOR_RED2, "Caminhoneiro - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/carga [id] : Mostra a algum policial a documentaÁ„o da carga.");
			SendClientMessage(playerid, COLOR_WHITE, "/carregar: Para carregar o caminh„o, antes de seguir viagem");
            SendClientMessage(playerid, COLOR_WHITE, "-Carregamento em Geral: Carrega o caminh„o com destino certo");
            SendClientMessage(playerid, COLOR_WHITE, "-CombustÌvel: … necess·rio deixar a carga em algum posto");
            SendClientMessage(playerid, COLOR_WHITE, "-Drogas: … mais rent·vel porÈm pode acontecer imprevistos");
            SendClientMessage(playerid, COLOR_WHITE, "-Roupas: … necess·rio deixar a carga em alguma loja de roupas BINCO");
	      }
          else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COLOR_RED2, "Pescador - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ");
			SendClientMessage(playerid, COLOR_WHITE, "/iscas [quantia/de/iscas] : Para pegar iscas (VocÍ deve estar em uma cooperativa de pesca).");
	    	SendClientMessage(playerid, COLOR_WHITE, "/pescar : Joga a rede para pescar, vocÍ deve estar na ·rea de pesca.");
        	SendClientMessage(playerid, COLOR_WHITE, "/venderpesca : Vende seu pescado em uma cooperativa, vocÍ deve estar em uma.");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o");
			SendClientMessage(playerid, COLOR_WHITE, "/minhasiscas : Ver sua quantidade de iscas.");
			SendClientMessage(playerid, COLOR_RED2, "Agora que vocÍ È pescador n„o precisar· pagar as suas iscas!");
          }
	      else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
		    SendClientMessage(playerid, COLOR_RED2, "Entregador de Pizza - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/pegarpizza : Para entregar as pizzas È necess·rio ter pizzas na moto.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/pizza : Para vender uma pizza ‡ um cliente");
	    	SendClientMessage(playerid, COLOR_WHITE, "/entregarpizza : ComeÁa a entrega de pizzas autom·tica.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/pararentrega : Parar a entrega de pizzas autom·tica.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/verpizzas : Ver a quantidade de pizzas que a moto tem.");
   	    	SendClientMessage(playerid, COLOR_WHITE, "Para pedir uma pizza, os clientes podem digitar /telepizza.");
          }
  	      else if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_RED2, "Taxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/ttaxi [id] : ComeÁa a rodar o taxÌmetro (o passageiro tem que estar no seu carro).");
			SendClientMessage(playerid, COLOR_WHITE, "/GPS [ID/do/Local] : Para ligar o GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/desligargps : Para desligar o GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/locais : Ver os locais de GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/trancartaxi : Trancar um taxi.");
			SendClientMessage(playerid, COLOR_WHITE, "/destrancartaxi : Destrancar um taxi.");
			SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de taxi pelo comando /taxi");
  	      }
          else if(Profissao[playerid] == MOTOTAXI) {
			SendClientMessage(playerid, COLOR_RED2,  "Mototaxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/mtaxi [id] : ComeÁa a cobranÁa da viagem.");
            SendClientMessage(playerid, COLOR_WHITE, "/GPS [ID/do/Local] : Para ligar o GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/desligargps : Para desligar o GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/locais : Ver os locais de GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/trancarmototaxi : Trancar uma mototaxi.");
			SendClientMessage(playerid, COLOR_WHITE, "/destrancarmototaxi : Destrancar uma mototaxi.");
            SendClientMessage(playerid, COLOR_WHITE, "As motos de taxi est„o na Central dos Taxistas");
	      }
	      else if(Profissao[playerid] == TAXI_AEREO) {
			SendClientMessage(playerid, COLOR_RED2,  "Taxista aÈreo - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/artaxi [id] : A viagem comeÁara a ser tarifada para o passsageiro.");
            SendClientMessage(playerid, COLOR_WHITE, "/GPS [ID/do/Local] : Para ligar o GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/desligargps : Para desligar o GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/locais : Ver os locais de GPS.");
			SendClientMessage(playerid, COLOR_WHITE, "/trancartaxiaereo : Trancar um taxi aereo.");
			SendClientMessage(playerid, COLOR_WHITE, "/destrancartaxiaereo : Destrancar um taxi aereo.");
			SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de taxi aereo pelo comando /taxiaereo [local]");
            SendClientMessage(playerid, COLOR_WHITE, "SÛ existe 1 helicoptero para os taxistas aereos e est· localizado na Central dos Taxistas");
	      }
	      else if(Profissao[playerid] == INSTRUTOR) {
			SendClientMessage(playerid, COLOR_RED2, "Instrutor de DireÁ„o - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ");
			SendClientMessage(playerid, COLOR_WHITE, "/habaerea [id] : Habilita uma pessoa a dirigir veÌculos aereos (aviıes e helicopteros).");
			SendClientMessage(playerid, COLOR_WHITE, "/habterrestre [id] : Habilita uma pessoa a dirigir veÌculos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_WHITE, "/habnautica [id] : Habilita uma pessoa a dirigir veÌculos nauticos (barcos).");
			SendClientMessage(playerid, COLOR_WHITE, "/carteiras : Ver o valor das carteiras | /trancarveiculoauto e /destrancarveiculoauto : Trancar/Destrancar um veÌculo da auto escola.");
			SendClientMessage(playerid, COLOR_WHITE, "/agendarteste [id] : Esse È o comando que os jogadores usam para agendar um teste com vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/agendatestes : Ver a agenda de testes da auto escola.");
			SendClientMessage(playerid, COLOR_WHITE, "/apagaragenda : Apagar a agenda de testes da auto escola.");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes = para ver as instrucoes da sua profiss„o");
	      }
          else if(Profissao[playerid] == TRAFICANTE) {
			SendClientMessage(playerid, COLOR_RED2, "Traficante - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/pegardroga : Cria o CP do local aonde vocÍ pega as drogas para vender.");
			SendClientMessage(playerid, COLOR_WHITE, "/maconha [id] [teor] : Vender maconha, pode ser detectado  no  sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/cocaina [id] [teor] : Vender cocaina, pode detectar no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/heroina [id] [teor] : Vender heroÌna, pode ser detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/meubolso : Mostra a quantidade de papelotes de cada droga.");
			SendClientMessage(playerid, COLOR_RED2, "Cuidado! Se a organizaÁ„o NARC”TICOS te pegar em flagrante vendendo drogas, vocÍ ser· preso!");
  	      }
  	      else if(Profissao[playerid] == LIDER_DE_TRAFICO) {
			SendClientMessage(playerid, COLOR_RED2, "LÌder de Tr·fico - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/pegardroga : Cria o CP do local aonde vocÍ pega as drogas para vender.");
			SendClientMessage(playerid, COLOR_WHITE, "/maconha [id] [teor] : Vender maconha, pode ser detectado  no  sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/cocaina [id] [teor] : Vender cocaina, pode detectar no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/heroina [id] [teor] : Vender heroÌna, pode ser detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/meubolso : Mostra a quantidade de papelotes de cada droga.");
			SendClientMessage(playerid, COLOR_WHITE, "/plantardrogas : Plantar drogas em um veÌculo.");
			SendClientMessage(playerid, COLOR_WHITE, "/pararplantacao : Para parar sua plantaÁ„o de drogas em um veÌculo.");
			SendClientMessage(playerid, COLOR_RED2, "Cuidado! Se a organizaÁ„o NARC”TICOS te pegar em flagrante vendendo/plantando drogas, vocÍ ser· preso!");
  	      }
          else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COLOR_RED2, "Jornalista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/noticia [texto] : Publicar uma noticia. Ex:empregos(informado pelo ADM), e o que acontence em de San Andreas");
	    	SendClientMessage(playerid, COLOR_WHITE, "/propaganda [texto] : Publica uma propaganda de alguma pessoa ou serviÁo");
	    	SendClientMessage(playerid, COLOR_WHITE, "/publicar [texto] : Publicar um an˙ncio na tela!");
            SendClientMessage(playerid, COLOR_WHITE, "/anunciaremprego [id/do/jornalista] [id/da/propriedade] [salario] [profissao/a/oferecer] : Comando usado pelo Dono da empresa para anunciar empregos");
		  }
          else if(Profissao[playerid] == CORRETOR_SEGUROS) {
		    SendClientMessage(playerid, COLOR_RED2, "Corretor de seguros - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/segurovida [id] : Vende seguro de vida para um jogador");
	    	SendClientMessage(playerid, COLOR_WHITE, "/seguroveiculo : Assegurar um veÌculo");
            SendClientMessage(playerid, COLOR_WHITE, "/seguroimovel [id] : Oferece um seguro de imÛvel para um jogador!");
		  }
          else if(Profissao[playerid] == PARAMEDICO) {
		    SendClientMessage(playerid, COLOR_RED2, "ParamÈdico - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/kitmedico : Pega o Kit para poder fazer o curativo/tratamento.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/curativo [id]: Faz o tratamento necess·rio ao paciente.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/tratamentodrogas [id] : Faz um tratamento para remover as drogas do paciente.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/tratardoenca [id] : Realiza um tratamento para curar as doenÁas de um jogador.");
            SendClientMessage(playerid, COLOR_WHITE, "/192: telefone de emergencia, para chamar uma ambulancia.");
            SendClientMessage(playerid, COLOR_RED2, "Para fazer curativos e tratamentos vocÍ tem que ter um kit mÈdico.");
	      }
 	      else if(Profissao[playerid] == ADVOGADO) {
			SendClientMessage(playerid, COLOR_RED2, "Advogado - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
            SendClientMessage(playerid, COLOR_WHITE, "/advogado : este È comando utilizado pelos seus clientes para entrar em contato com vocÍ.");
            SendClientMessage(playerid, COLOR_WHITE, "/defesa : recebe pela defesa judicial,seus honor·rios ser„o 40% do valor da causa [informe seu cliente].");
            SendClientMessage(playerid, COLOR_WHITE, "/processo : entrar com a petiÁ„o e faz a defesa de seu cliente, feito isto aguarde o senteÁa do juiz.");
            SendClientMessage(playerid, COLOR_WHITE, "/fianca [id] [quantia] : oferece uma quantia para o preso caso ele queira sair da pris„o.");
		  }
	      else if(Profissao[playerid] == COP_MILITAR) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Militar - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas.");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : VÍ o nÌvel de alcool no sangue de alguem | /multar [id] [quantia] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco : pede reforÁo a todos os cops.");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o.");
          }
	      else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_RED2,  "Policial Rodovi·rio - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas.");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : VÍ o nÌvel de alcool no sangue de alguem | /multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco : pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/cone : cria um cone para a blitz policial.");
			SendClientMessage(playerid, COLOR_WHITE, "/carga [id] : Comandos usado para que o Caminhoneiro mostre o tipo de carga que ele leva.");
			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o.");
		  }
	      else if(Profissao[playerid] == COP_SWAT) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Elite/SWAT - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
			SendClientMessage(playerid, COLOR_WHITE, "/exame [id] : VÍ o nÌvel de intorpecentes no sangue de alguem | /radar: liga o radar movel.");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : VÍ o nÌvel de alcool no sangue de alguem | /multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco : pede reforÁo a todos os cops. | /cone: cria um cone para a blitz policial.");
			SendClientMessage(playerid, COLOR_WHITE, "/carga [id] : Comandos usado para que o Caminhoneiro mostre o tipo de carga que ele leva.");
	        SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o.");
	      }
	      else if(Profissao[playerid] == EXERCITO) {
			SendClientMessage(playerid, COLOR_RED2, "EXERCITO - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
			SendClientMessage(playerid, COLOR_WHITE, "/exame [id] : VÍ o nÌvel de intorpecentes no sangue de alguem | /radar: liga o radar movel.");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : VÍ o nÌvel de alcool no sangue de alguem | /multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco : pede reforÁo a todos os cops.");
			SendClientMessage(playerid, COLOR_WHITE, "/carga [id] : Comandos usado para que o Caminhoneiro mostre o tipo de carga que ele leva.");
	        SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o.");
	      }
  	      else if(Profissao[playerid] == COP_NARCOTICOS) {
  	        SendClientMessage(playerid, COLOR_RED2, "NarcÛticos - Comandos:");
  			SendClientMessage(playerid, COLOR_WHITE, "/exame [id] : Ver se o indÌviduo tem droga no corpo. | /vexame : Faz exame em um veÌculo.");
        	SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
	        SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COLOR_WHITE, "/desarmardrogas : Desarma as drogas plantadas em um veÌculo.");
			SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador peÁa para ele digitar /render.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco : pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o.");
	        SendClientMessage(playerid, COLOR_RED2, "Quando ver um LÌder de Tr·fico plantando drogas em um veÌculo, tire ele do veÌculo e a plantaÁ„o ser· cancelada.");
	      }
          else if(Profissao[playerid] == JUIZ) {
		    SendClientMessage(playerid, COLOR_RED2, "JuÌz - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia atÈ o tÈrmino do julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar [id] : ApÛs seu veredicto, vocÍ usa este comando para determinar a soltura do rÈu..");
			SendClientMessage(playerid, COLOR_WHITE, "/tribunal [id1] [id2] : Inicia um tribunal entre 2 jogadores a caso de morte, insultos. Previsto pena. ou IndenizaÁ„o.");
            SendClientMessage(playerid, COLOR_WHITE, "/culpado [id] : Declara um jogador CULPADO.");
			SendClientMessage(playerid, COLOR_WHITE, "/fimtribunal : Declara o fim do tribunal, dado com aceitaÁ„o das partes.");
		  }
          else if(Profissao[playerid] == DELEGADO) {
		    SendClientMessage(playerid, COLOR_RED2, "Delegado - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia atÈ o tÈrmino do julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar [id] : VocÍ usa este comando para tirar da cadeia o criminoso.");
			SendClientMessage(playerid, COLOR_WHITE, "/ordem : Para ordenar outros oficiais a comprirem uma miss„o.| /armas para ver porte de armas.");
        	SendClientMessage(playerid, COLOR_WHITE, "/porte1 : Concede porte de armas na categoria 1 armas leves.para policia militar e civis confi·veis.");
	        SendClientMessage(playerid, COLOR_WHITE, "/porte2 : Concede porte de armas na categoria 2 armas pesadas,somente Swat e Cop rodovi·rio.");
			SendClientMessage(playerid, COLOR_WHITE, "/carga [id] : Comandos usado para que o Caminhoneiro mostre o tipo de carga que ele leva.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco : pede reforÁo a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/removerporte1 [id] : Remover o porte de armas CAT 1 de alguÈm | /removerporte2 [id] : Remover o porte de armas CAT 2 de alguÈm.");
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
			SendClientMessage(playerid, COLOR_WHITE, "/pegargrana : Ao entrar no veÌculo vocÍ pode pegar o MALOTE, e ao sair ter· 20 segundos para depositar a grana.");
			SendClientMessage(playerid, COLOR_WHITE, "Obs: Caso n„o entregue a grana poder· sofrer puniÁ„o.");
        	SendClientMessage(playerid, COLOR_WHITE, "/depositargrana : Deposita a grana em qualquer banco estando no mesmo.");
           	SendClientMessage(playerid, COLOR_WHITE, "/escolta : Pede ajuda a polÌcia para escoltar o dinheiro.");
	      }
  	      else if(Profissao[playerid] == CONTRABANDISTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Contrabandista - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
		 	SendClientMessage(playerid, COLOR_WHITE, "/contrabando : Inicia um contrabando. Veja os contrabandos do gamemode:");
			SendClientMessage(playerid, COLOR_WHITE, "-Pacote: Contrabando no navio em San Fierro perto da boate do Jizzys");
			SendClientMessage(playerid, COLOR_WHITE, "-Carro: Contrabando de carros, o traficante do morro pede, os triads checam e dispacham o carro");
			SendClientMessage(playerid, COLOR_WHITE, "-Armas: Contrabando de armas ilegais.");
			SendClientMessage(playerid, COLOR_WHITE, "-Drogas: Contrabando de drogas, o traficante do morro lhe informa onde vocÍ pode conseguir grana transportando drogas.");
			SendClientMessage(playerid, COLOR_WHITE, "/cancelarcontrabando : Cancela o contrabando!");
		 	SendClientMessage(playerid, COLOR_RED2, "AtenÁ„o! Se a Receita Federal te pegar fazendo contrabando vocÍ ser· preso");
		 	SendClientMessage(playerid, COLOR_RED2, "e a mercadoria ser· apreendida!");
	      }
  	      else if(Profissao[playerid] == RECEITA_FEDERAL) {
 	        SendClientMessage(playerid, COLOR_RED2, "Receita Federal - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
 			SendClientMessage(playerid, COLOR_WHITE, "/multar [id] [quantia] : Multar um jogador.");
 			SendClientMessage(playerid, COLOR_WHITE, "/retirarmulta [id] : Retirar a multa de um jogador.");
 			SendClientMessage(playerid, COLOR_WHITE, "/multas : Ver as multas dos jogadores!");
 			SendClientMessage(playerid, COLOR_WHITE, "/apreendercontrabando [id] : Cancela o contrabando de mercadoria! Na maioria das vezes ocorre em SF.");
 			SendClientMessage(playerid, COLOR_WHITE, "No navio ancorado perto da Ponte e da boate.");
 			SendClientMessage(playerid, COLOR_WHITE, "TambÈm checa se n„o est· ocorrendo venda de carros ilegais (desmanche)");
 			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o");
 			SendClientMessage(playerid, COLOR_RED2, "Veja os jogadores que est„o atrasando para pagar as multas e tome provisıes dr·sticas sobre eles!");
	      }
  	      else if(Profissao[playerid] == AGRICULTOR) {
 	        SendClientMessage(playerid, COLOR_RED2, "Agricultor - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/plantarmilho : Planta o milho no campo.");
          	SendClientMessage(playerid, COLOR_WHITE, "/vendermilho : Vende o milho colhido na FAZENDA.");
          	SendClientMessage(playerid, COLOR_WHITE, "/tirarleite : Tira leite das vacas.");
          	SendClientMessage(playerid, COLOR_WHITE, "/venderleite : Vende o leite das vacas na FAZENDA.");
	      }
  	      else if(Profissao[playerid] == ASSALTANTE) {
 	        SendClientMessage(playerid, COLOR_RED2, "Assaltante - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/assaltar : Chegue em um banco, digite, depois fuja.");
  			SendClientMessage(playerid, COLOR_WHITE, "/roubar : Para assaltar 1 Jogador.");
  			SendClientMessage(playerid, COLOR_WHITE, "/desmanche : Vende o carro para o desmanche");
  			SendClientMessage(playerid, COLOR_WHITE, "/veiculosdesmanche : mostra o veÌculo que o beco quer!");
        	SendClientMessage(playerid, COLOR_WHITE, "Para roubar Carros-Fortes, basta entrar nele quanto estiver carregado de $$.");
	      }
	      else if(Profissao[playerid] == FRENTISTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Frentista - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
 			SendClientMessage(playerid, COLOR_WHITE, "/colocargas [id] [quantia] : Coloca gasolina no carro de um jogador, sujeito a cobranÁa.");
 			SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o");
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
  			SendClientMessage(playerid, COLOR_WHITE, "/venderarma [id] [id/da/arma] : Vende alguma arma para o jogador.");
        	SendClientMessage(playerid, COLOR_WHITE, "/oferecerarma [id] [id/da/arma] : Oferece alguma arma ao jogador ele tem que estar perto para receber.");
        	SendClientMessage(playerid, COLOR_WHITE, "/camuflar [id/do/jogador] [minutos] : Camuflar um jogador.");
        	SendClientMessage(playerid, COLOR_WHITE, "/armas : Ver os ID's e os valores das armas");
        	SendClientMessage(playerid, COLOR_WHITE, "/colete [id] : Vende colete para alguÈm");
 	      }
		  else if(Profissao[playerid] == MECANICO) {
		    SendClientMessage(playerid, COLOR_RED2, "Mec‚nico - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
		    SendClientMessage(playerid, COLOR_WHITE, "/consertar : Conserta o carro em que vocÍ estiver dirigindo.");
		    SendClientMessage(playerid, COLOR_WHITE, "/pintarcarro : Pinta o carro com cores diferentes!");
		    SendClientMessage(playerid, COLOR_WHITE, "/placa [nome] : Mudar a placa de um veÌculo!");
		    SendClientMessage(playerid, COLOR_WHITE, "AtenÁ„o: Como os carros n„o d„o RESPAWN, vocÍ tem que fazer o reboque deles.");
		    SendClientMessage(playerid, COLOR_WHITE, "VocÍ pode alternar em n„o cobrar ou cobrar. Se cobrar ser· pago $50. Para rebocar basta");
		    SendClientMessage(playerid, COLOR_WHITE, "chegar com o Reboque na frente do veÌculo e apertar CTRL, automaticamente o carro ser· guinchado.");
		    SendClientMessage(playerid, COLOR_WHITE, "/instrucoes : para ver as instrucoes da sua profiss„o");
	      }
 		  else if(Profissao[playerid] == PROSTITUTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Prostituta - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
  			SendClientMessage(playerid, COLOR_WHITE, "/strip-tease [id] : Oferece um strip-tease na boate!");
        	SendClientMessage(playerid, COLOR_WHITE, "/transarcama [id] : Oferece uma transa na cama de um hotel.");
        	SendClientMessage(playerid, COLOR_WHITE, "/mudarposicao [1-4] : Troca a posiÁ„o na hora do sexo!");
        	SendClientMessage(playerid, COLOR_WHITE, "/fazerstrip : ComeÁa a fazer strip-tease na boate!");
        	SendClientMessage(playerid, COLOR_WHITE, "/pararstrip : Parar de fazer strip-tease na boate!");
        	SendClientMessage(playerid, COLOR_WHITE, "/pagarstrip [ID/da/striper] : Esse È o comando que os jogadores usam para pagar o strip-tease!");
  	      }
	      else{
			SendClientMessage(playerid, COLOR_GREEN, "Profiss„o sem comandos especiais");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que tÍm a mesma profiss„o que vocÍ.");
			SendClientMessage(playerid, COLOR_GREEN, "Desculpe-nos, sua profiss„o n„o tem nenhum comando especial ainda, estamos trabalhando para isto.");
          }
    	  return 1;
	}
	
	if(strcmp(cmd,"/consertar",true)==0){
	    if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	        if(IsPlayerInAnyVehicle(playerid)){
	            new vehid = GetPlayerVehicleID(playerid);
	            new tmp[256];
	            format(tmp,sizeof(tmp),"%d.vinfo",vehid);
	            if(strcmp(dini_Get(tmp,"Dono"), "Server", false) && strcmp(dini_Get(tmp,"Dono"), PlayerName(playerid), false)){
					new Float:X,Float:Y,Float:Z,Float:ang;
					GetVehiclePos(vehid,X,Y,Z);
					GetVehicleZAngle(vehid,ang);
					SetVehicleHealth(vehid,1000);
					SetVehicleToRespawn(vehid);
					SetTimerEx("ColocarNoVeiculoMot",200,0,"dd",playerid,vehid);
					SetTimerEx("SetarPosicaoDoVeiculo",300,0,"dffff",vehid,X,Y,Z,ang);
					if(VeiculoConsertado[vehid] == 0){
						AcrescentarExPoints(playerid,1);
						if(JogadorContratado(playerid,9)) AcrescentarLucro(9,100);
						VeiculoConsertado[vehid]=1;
						SetTimerEx("ZerarCarroConsertado",30000,false,"d",vehid);
					}
				} else {
				    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode consertar um veÌculo seu ou do governo/server");
				}
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
             	new tmp[256];
	            format(tmp,sizeof(tmp),"%d.vinfo",vehid);
	            if(strcmp(dini_Get(tmp,"Dono"), "Server", false) && strcmp(dini_Get(tmp,"Dono"), PlayerName(playerid), false)){
	           		new rand = random(126);
					new rand1 = random(126);
					ChangeVehicleColor(vehid,rand,rand1);
					SaveColors(vehid,rand,rand1);
					SendClientMessage(playerid,COLOR_MECANICO,"Cor colocada");
					if(VeiculoPintado[vehid]==0){
				    	VeiculoPintado[vehid]=1;
						SetTimerEx("ZerarVeiculoPintado",30000,false,"d",vehid);
						AcrescentarExPoints(playerid,1);
						if(JogadorContratado(playerid,9)) AcrescentarLucro(9,100);
					}
				} else {
				    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode pintar um veÌculo seu ou do governo/server");
				}
  			} else {
			    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o È mec‚nico!");
		}
		return 1;
	}
	if(strcmp(cmd,"/placa",true) == 0) {
  		if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
   			new tmp[256];
   			strmid(tmp,cmdtext,6,14);
			if(!strlen(tmp)){
			   	SendClientMessage(playerid, COLOR_RED, "Uso: /placa [nome]");
			   	SendClientMessage(playerid, COLOR_RED, "O m·ximo de caracteres do nome È 8");
			   	return 1;
		   	}
		   	new string[256];
		   	if(IsPlayerInAnyVehicle(playerid)){
		   	    if(strcmp(dini_Get(tmp,"Dono"), "Server", false)){
			   		SetVehicleNumberPlate(GetPlayerVehicleID(playerid),tmp);
			   		format(string, sizeof(string),"Placa do veiculo mudada para %s",tmp);
			   		SendClientMessage(playerid, COLOR_MECANICO,string);
			   		SalvarPlaca(GetPlayerVehicleID(playerid),tmp);
			   		return 1;
				} else {
				    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode mudar a placa de um veÌculo do server!");
					return 1;
				}
   			} else {
       			SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veiculo!");
       			return 1;
       		}
   		} else {
	       	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È mec‚nico!");
	       	return 1;
 		}
	}
   
 	if(strcmp(cmd,"/verplaca",true) == 0) {
        if(IsPlayerInAnyVehicle(playerid)){
			new tmp[256];
			format(tmp,sizeof(tmp),"%d.vinfo",GetPlayerVehicleID(playerid));
			new string[256];
			format(string, sizeof(string), "Placa do veÌculo: %s", dini_Get(tmp,"Placa"));
			SendClientMessage(playerid, COLOR_MECANICO, string);
			return 1;
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ precisa estar em um veÌculo para usar este comando.");
			return 1;
		}
	}

//Loja de CustomizaÁ„o
    if(strcmp(cmd,"/consertarcar",true) == 0) {
        if(AreaCustomizacao[playerid] == 0){
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na loja de customizaÁ„o!");
            return 1;
		}
        if(!IsPlayerInAnyVehicle(playerid)){
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
            return 1;
		}
		new Float:VehLife;
		GetVehicleHealth(GetPlayerVehicleID(playerid),VehLife);
		if(VehLife == 1000){
		    SendClientMessage(playerid, COLOR_RED, "Seu carro n„o est· danificado! N„o gaste dinheiro ‡ toa.");
		    return 1;
		}
		if(GetPlayerMoney(playerid) < 100){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro! Custo: $100");
		    return 1;
		} else {
		    new Float:X,Float:Y,Float:Z,Float:ang;
		    GetVehiclePos(GetPlayerVehicleID(playerid),X,Y,Z);
		    GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
		    SendClientMessage(playerid, COLOR_WHITE, "VeÌculo enviado para conserto...");
		    SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			GameTextForPlayer(playerid,"~w~Consertando...",10000,0);
			SetTimerEx("ArrumandoVeiculo",10000,0,"ddffff",playerid,GetPlayerVehicleID(playerid),X,Y,Z,ang);
			return 1;
			}
	}
	if(strcmp(cmd,"/pintarcar",true) == 0) {
	    new tmp[256];
	    new cor1,cor2;
	    tmp = strtok(cmdtext,idx);
	    cor1 = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /pintar [cor1] [cor2]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
		cor2 = strval(tmp);
		if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /pintar [cor1] [cor2]");
	        return 1;
		}
		if(cor1 < 0 || cor1 > 126){
		    SendClientMessage(playerid, COLOR_RED, "Cor 1 inv·lida! Cores 1 e 2 de 0 ‡ 126");
		    return 1;
		}
		if(cor2 < 0 || cor2 > 126){
		    SendClientMessage(playerid, COLOR_RED, "Cor 2 inv·lida! Cores 1 e 2 de 0 ‡ 126");
		    return 1;
		}
        if(AreaCustomizacao[playerid] == 0){
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na loja de customizaÁ„o!");
            return 1;
		}
        if(!IsPlayerInAnyVehicle(playerid)){
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
            return 1;
		}
		if(GetPlayerMoney(playerid) < 50){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro! Custo: $50");
		    return 1;
		} else {
		    ChangeVehicleColor(GetPlayerVehicleID(playerid),cor1,cor2);
		    SaveColors(GetPlayerVehicleID(playerid),cor1,cor2);
		    SendClientMessage(playerid, COLOR_WHITE, "VeÌculo pintado! A pintura custou $50");
		    GivePlayerMoney(playerid,-50);
		    AcrescentarLucro(9,50);
		    return 1;
			}
	}
	if(strcmp(cmd,"/mudarplaca",true) == 0) {
		new tmp[256];
   		strmid(tmp,cmdtext,11,19);
		if(!strlen(tmp)){
		   	SendClientMessage(playerid, COLOR_RED, "Uso: /mudarplaca [nome]");
		   	SendClientMessage(playerid, COLOR_RED, "O m·ximo de caracteres do nome È 8");
		   	return 1;
	   	}
	   	if(AreaCustomizacao[playerid] == 0){
           	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na loja de customizaÁ„o!");
           	return 1;
		}
       	if(!IsPlayerInAnyVehicle(playerid)){
           	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
           	return 1;
		}
		if(GetPlayerMoney(playerid) < 200){
	   	 	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro! Custo: $200");
	    	return 1;
		} else {
		    new tmpres[256];
	 		format(tmpres,sizeof(tmpres),"%d.vinfo",GetPlayerVehicleID(playerid));
	 		if(!strcmp(dini_Get(tmpres,"Dono"), PlayerName(playerid), false)){
	 		    GivePlayerMoney(playerid,-200);
	 		    AcrescentarLucro(9,200);
	   			new string[256];
		   		SetVehicleNumberPlate(GetPlayerVehicleID(playerid),tmp);
		   		format(string, sizeof(string),"Placa do veiculo mudada para %s",tmp);
		   		SendClientMessage(playerid, COLOR_WHITE,string);
		   		SalvarPlaca(GetPlayerVehicleID(playerid),tmp);
		   		return 1;
 			}
 			else{
 			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono do veÌculo!");
 			    return 1;
			}
		}
	}
	if(strcmp(cmd, "/s", true)==0 ){
		new tmp[256];
	    strmid(tmp, cmdtext, 2, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/s [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(GetDistanceBetweenPlayers(playerid, i) < 30){
		            new str[256];
		            format(str,sizeof(str),"[SAY] %s",tmp);
					SendPlayerMessageToPlayer(i,playerid,str);
					ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
					ApplyAnimation(i,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
				}
			}
			return 1;
		}
	}

	if(strcmp(cmd, "/texuguicionss",true)==0 && IsPlayerInAnyVehicle(playerid)){
	    new id = GetPlayerVehicleID(playerid);
	    new model = GetVehicleModel(id);
	    switch(model){
	        case 581,523,462,521,463,522,461,448,468,586: AddVehicleComponent(id,1010);
		}
		return 1;
	}
	if(strcmp(cmd, "/trancartaxiaereo", true) == 0) {
        if(Profissao[playerid] == MOTOTAXI || IsPlayerAdmin(playerid)){
            if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != MotoTaxi && GetPlayerVehicleID(playerid) != MotoTaxi2 && GetPlayerVehicleID(playerid) != MotoTaxi3){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em uma moto taxi da sua cooperativa!");
                return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_WHITE, "Trancado...");
			    for(new i=0; i<MAX_PLAYERS; i++){
			        if(i != playerid){
						if(Profissao[i] != MOTOTAXI && !IsPlayerAdmin(i)){
		    				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
						}
					}
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Taxista!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/destrancartaxiaereo", true) == 0) {
        if(Profissao[playerid] == MOTOTAXI || IsPlayerAdmin(playerid)){
			if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != MotoTaxi && GetPlayerVehicleID(playerid) != MotoTaxi2 && GetPlayerVehicleID(playerid) != MotoTaxi3){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em uma moto taxi da sua cooperativa!");
                return 1;
			}
			else{
	    		SendClientMessage(playerid, COLOR_WHITE, "Destrancado...");
			   	for(new i=0; i<MAX_PLAYERS; i++){
			   	    if(i != playerid){
		    			SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
					}
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Taxista!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/mtaxi", true) == 0 && IsPlayerConnected(playerid)) {
		if(Profissao[playerid] == MOTOTAXI || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/mtaxi [id]");
	            return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
        	    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado/logado.");
        	    return 1;
			}
			if(NoTaxi[plid] == 1){
				SendClientMessage(playerid, COLOR_RED, "O TaxÌmetro j· est· rodando");
				return 1;
			}
			new vehid = GetPlayerVehicleID(playerid);
			if(!IsPlayerInVehicle(plid,vehid)){
			    SendClientMessage(playerid, COLOR_RED, "Ele tem que estar no seu veÌculo!");
				return 1;
			}
      		new modelo = GetPlayerVehicleID(playerid);
        	if(modelo == MotoTaxi || modelo == MotoTaxi2 || modelo == MotoTaxi3){
  		    	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  		    	    if(plid != playerid){
						SendClientMessage(playerid, COLOR_GREEN, "O Moto-TaxÌmetro comeÁou a rodar");
					    SendClientMessage(plid, COLOR_GREEN, "O Moto-TaxÌmetro j· est· rodando. A corrida est· sendo cobrada a partir de agora.");
					    MTaximetro[plid][0] = 1;
						MTaximetro[plid][1] = playerid;
						AcrescentarExPoints(playerid,1);
						NoTaxi[plid] = 1;
						return 1;
					} else {
						SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode ligar o Moto-TaxÌmetro para vocÍ.");
						return 1;
					}
				} else {
					SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar dirigindo");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em uma Moto autorizada. Tem que ser uma FCR-900 da Yellow's Taxi");
				return 1;
			}
	   	} else {
       		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Moto-taxista.");
			return 1;
		}
	}
	if(strcmp(cmd, "/trancartaxiaereo", true) == 0) {
        if(Profissao[playerid] == TAXI_AEREO || IsPlayerAdmin(playerid)){
            if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != AeroTaxi){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um taxi aereo da sua cooperativa!");
                return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_WHITE, "Trancado...");
			    for(new i=0; i<MAX_PLAYERS; i++){
			        if(i != playerid){
						if(Profissao[i] != TAXI_AEREO && !IsPlayerAdmin(i)){
		    				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
						}
					}
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Taxista!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/destrancartaxiaereo", true) == 0) {
        if(Profissao[playerid] == TAXI_AEREO || IsPlayerAdmin(playerid)){
			if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != AeroTaxi){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um taxi aereo da sua cooperativa!");
                return 1;
			}
			else{
	    		SendClientMessage(playerid, COLOR_WHITE, "Destrancado...");
			   	for(new i=0; i<MAX_PLAYERS; i++){
			   	    if(i != playerid){
		    			SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
					}
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Taxista!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/ataxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXI_AEREO || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/ataxi [id]");
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
        	    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado/logado.");
        	    return 1;
			}
			if(NoTaxi[plid] == 1){
				SendClientMessage(playerid, COLOR_RED, "O TaxÌmetro j· est· rodando");
				return 1;
			}
			new vehid = GetPlayerVehicleID(playerid);
			if(!IsPlayerInVehicle(plid,vehid)){
			    SendClientMessage(playerid, COLOR_RED, "Ele tem que estar no seu veÌculo!");
				return 1;
			}
      		new modelo = GetPlayerVehicleID(playerid);
        	if(modelo == AeroTaxi){
  		    	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  		    	    if(plid != playerid){
						SendClientMessage(playerid, COLOR_GREEN, "O aero-taxÌmetro comeÁou a rodar");
					    SendClientMessage(plid, COLOR_GREEN, "O aero-taxÌmetro j· est· rodando. A corrida est· sendo cobrada a partir de agora.");
					    ATaximetro[plid][0] = 1;
						ATaximetro[plid][1] = playerid;
						AcrescentarExPoints(playerid,1);
						NoTaxi[plid] = 1;
		  		        return 1;
					} else {
						SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode ligar o Aero-TaxÌmetro para vocÍ.");
						return 1;
					}
				} else {
					SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar dirigindo");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um HelicÛpeto Maverick da Yellow's Taxi.");
				return 1;
			}
	   	} else {
       		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Aero-taxista.");
			return 1;
		}
	}
    if(strcmp(cmd, "/trancartaxi", true) == 0) {
        if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
            if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != Taxi1 && GetPlayerVehicleID(playerid) != Taxi2 && GetPlayerVehicleID(playerid) != Taxi3){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um taxi da sua cooperativa!");
                return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_WHITE, "Trancado...");
			    for(new i=0; i<MAX_PLAYERS; i++){
			        if(i != playerid){
						if(Profissao[i] != TAXISTA && !IsPlayerAdmin(i)){
		    				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
						}
					}
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Taxista!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/destrancartaxi", true) == 0) {
        if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != Taxi1 && GetPlayerVehicleID(playerid) != Taxi2 && GetPlayerVehicleID(playerid) != Taxi3){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um taxi da sua cooperativa!");
                return 1;
			}
			else{
	    		SendClientMessage(playerid, COLOR_WHITE, "Destrancado...");
			   	for(new i=0; i<MAX_PLAYERS; i++){
			   	    if(i != playerid){
		    			SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
					}
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Taxista!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/ttaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/ttaxi [id]");
			}
        	plid = strval(tmp);
        	if(!IsPlayerConnected(plid)){
        	    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado/logado.");
        	    return 1;
			}
			if(Profissao[plid] == TAXISTA){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode ligar o taximetro pra vocÍ.");
				return 1;
			}
			if(NoTaxi[plid] == 1){
				SendClientMessage(playerid, COLOR_RED, "O TaxÌmetro j· est· rodando");
				return 1;
			}
			new vehid = GetPlayerVehicleID(playerid);
			if(!IsPlayerInVehicle(plid,vehid)){
			    SendClientMessage(playerid, COLOR_RED, "Ele tem que estar no seu veÌculo!");
				return 1;
			}
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 420){
  		    	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
  		    	    if(plid != playerid){
		            	SendClientMessage(playerid, COLOR_GREEN, "O taxÌmetro comeÁou a rodar.");
		                SendClientMessage(plid, COLOR_GREEN, "O taxÌmetro comeÁou a rodar. A bandeirada de $20 foi cobrada.");
		                GivePlayerMoney(playerid,20);
		                GivePlayerMoney(plid,-20);
		                Taximetro[plid][0] = 1;
		                Taximetro[plid][1] = playerid;
		                AcrescentarExPoints(playerid,1);
		                NoTaxi[plid] = 1;
		  		        return 1;
					} else {
						SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode ligar o TaxÌmetro para vocÍ.");
						return 1;
					}
				} else {
					SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar dirigindo");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um Carro da Yellow's'Taxi.");
				return 1;
			}
	   	} else {
       		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È taxista.");
			return 1;
		}
	}
	if(strcmp(cmd, "/GPS", true) == 0) {
	   new tmp[256];
	   new localid;
	   tmp = strtok(cmdtext,idx);
	   localid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COLOR_RED, "USO: /GPS [ID/do/Local]");
	   return 1;
	   }
	   if(GPSLigado[playerid] == 1){
	   SendClientMessage(playerid, COLOR_RED, "Seu GPS j· est· ativado!");
	   return 1;
	   }
	   if(!IsPlayerInAnyVehicle(playerid)){
	   SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo, como poder· ligar o GPS?");
	   return 1;
	   }
	   if(localid <= 0 || localid >= 21){
	   SendClientMessage(playerid, COLOR_RED, "Ei, locais de 1 a 20, digite '/locais' para ve-los!");
	   return 1;
	   }
	   else{
           GPSLigado[playerid] = 1;
		   DisablePlayerCheckpoint(playerid);
		   SetPlayerCheckpoint(playerid,GPSLocais[localid][0],GPSLocais[localid][1],GPSLocais[localid][2],3.0);
		   CheckpointStatus[playerid] = GPSDESTINO;
		   StatusCheck[playerid] = NONEE;
		   new str[256];
		   format(str,sizeof(str),"Destino selecionado: %s",GPSNames[localid]);
		   SendClientMessage(playerid, COLOR_TAXISTA, str);
		   SendClientMessage(playerid, COLOR_TAXISTA, "Siga o Checkpoint para chegar atÈ l·.");
		   if(JogadorContratado(playerid,1)) AcrescentarPrejuizo(1,5);
		   return 1;
	   }
	}
	if(strcmp(cmd, "/desligargps", true) == 0) {
	   if(GPSLigado[playerid] == 0){
	   SendClientMessage(playerid, COLOR_RED, "Seu GPS n„o est· ativado!");
	   return 1;
	   }
	   else{
		   DisablePlayerCheckpoint(playerid);
		   CheckpointStatus[playerid] = NONE;
		   SendClientMessage(playerid, COLOR_WHITE, "GPS DESATIVADO...");
		   GPSLigado[playerid] = 0;
		   return 1;
		   }
	}
	if(strcmp(cmd,"/pizza",true)==0){
	    if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
	       	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 448){
				new tmp[256];
		    	new plid;
	    		new distancia;
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_RED, "/pizza [id].");
					return 1;
				}
	    	    plid = strval(tmp);
				distancia = GetDistanceBetweenPlayers(playerid, plid);
		 		if(distancia > 15){
			  		SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
					return 1;
				}
				if(PizzasMoto[GetPlayerVehicleID(playerid)] <= 0){
					SendClientMessage(playerid,COLOR_RED,"A sua moto n„o tem pizzas.");
					return 1;
				}
				if(JaComi[plid] == 1 && JaVendi[playerid] == 1){
					SendClientMessage(playerid,COLOR_RED,"AtenÁ„o vocÍ n„o pode vender para o mesmo jogador em menos de 30 segundos.");
					SendClientMessage(playerid,COLOR_RED,"O administrador foi informado. Caso pessista ser· kickado ou banido");
				    format(tmp,256,"%s tentou vender uma pizza em menos de 30 segundos para o mesmo jogador. Chame-lhe a atenÁ„o.",PlayerName(playerid));
				    SendClientMessageAdmin(COLOR_ENTREGADOR_PIZZA,tmp);
		    		SetTimerEx("Comeu",30000,0,"d",playerid,VendedorProduto[playerid]);
					return 1;
				}
		       	if(GetPlayerMoney(playerid) < 100){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar a pizza. CUSTO: $100");
					return 1;
				}
				if(IsPlayerConnected(plid)){
					if(plid != playerid){
					    SendClientMessage(playerid,COLOR_ENTREGADOR_PIZZA,"Uma pizza foi oferecida, agora espere o outro jogador aceitar.");
					    new string[256];
					    format(string,sizeof(string),"%s est· lhe oferecendo uma pizza, digite /aceitarpizza para aceita-la ou digite /recusarpizza para recusa-la.",PlayerName(playerid));
                        SendClientMessage(plid, COLOR_ENTREGADOR_PIZZA, string);
						OfertaDada[plid] = 1;
					    VendedorProduto[plid] = playerid;
					    Produto[plid] = 1;
						return 1;
					}
	    		} else {
				    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· numa moto Pizzaboy!");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o È entregador de pizza!");
		    return 1;
		}
	}
	if(strcmp(cmd,"/aceitarpizza",true) == 0) {
	    if(OfertaDada[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma pizza!");
	        return 1;
		}
		if(Produto[playerid] != 1){
			SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma pizza!");
			return 1;
		}
		if(!IsPlayerConnected(VendedorProduto[playerid])){
		    SendClientMessage(playerid, COLOR_RED, "O outro jogador parece ter saÌdo do servidor!");
		    return 1;
		}
		if(!IsPlayerInAnyVehicle(VendedorProduto[playerid])){
		    SendClientMessage(playerid, COLOR_RED, "Ei... O outro jogador saiu da moto de pizza!");
		    OfertaDada[playerid] = 0;
			Produto[playerid] = 0;
		    return 1;
		}
		if(PizzasMoto[GetPlayerVehicleID(VendedorProduto[playerid])] == 0){
		    SendClientMessage(playerid, COLOR_RED, "A moto do outro jogador n„o possue pizzas!");
		    OfertaDada[playerid] = 0;
			Produto[playerid] = 0;
		    return 1;
		}
		else{
		    new tmp[256];
		    new string[256];
	    	SendClientMessage(VendedorProduto[playerid],COLOR_ENTREGADOR_PIZZA,"Pizza aceita.");
		    SendClientMessage(playerid,COLOR_ENTREGADOR_PIZZA,"VocÍ se deliciou com uma pizza da Well Stacked Pizza Co.");
		    GivePlayerMoney(VendedorProduto[playerid],300);
		    GivePlayerMoney(playerid,-100);
		    AddPlayerHealth(playerid,20);
		    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
		    format(tmp,256,"*** %s vendeu uma pizza a %s ***",PlayerName(VendedorProduto[playerid]),PlayerName(playerid));
		    SendClientMessageAdmin(COLOR_ENTREGADOR_PIZZA,tmp);
		    PizzasMoto[GetPlayerVehicleID(VendedorProduto[playerid])] --;
			if(JogadorContratado(VendedorProduto[playerid],0)) AcrescentarLucro(0,150);
		    format(string,sizeof(string),"Foi entregue uma pizza, sua moto agora tem %d pizzas.",PizzasMoto[GetPlayerVehicleID(VendedorProduto[playerid])]);
		    SendClientMessage(VendedorProduto[playerid], COLOR_ENTREGADOR_PIZZA, string);
			JaComi[playerid] = 1;
			JaVendi[VendedorProduto[playerid]] = 1;
			OfertaDada[playerid] = 0;
			Produto[playerid] = 0;
		    SetTimerEx("Comeu",30000,0,"d",playerid,VendedorProduto[playerid]);
		    if(Profissao[playerid] != ENTREGADOR_PIZZA) AcrescentarExPoints(VendedorProduto[playerid],1);
		    return 1;
		}
	}
	if(strcmp(cmd,"/recusarpizza",true) == 0) {
	    if(OfertaDada[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma pizza!");
	        return 1;
		}
		if(Produto[playerid] != 1){
			SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma pizza!");
			return 1;
		}
		else{
		    OfertaDada[playerid] = 0;
			Produto[playerid] = 0;
			SendClientMessage(VendedorProduto[playerid], COLOR_RED, "A pizza foi recusada!");
			SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "VocÍ recusou a pizza...");
			return 1;
		}
	}
	if(strcmp(cmd,"/verpizzas",true) == 0) {
		if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
	       	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 448){
      			if(PizzasMoto[GetPlayerVehicleID(playerid)] > 0){
					new string[256];
					format(string,sizeof(string),"A moto est· com %d pizzas.",PizzasMoto[GetPlayerVehicleID(playerid)]);
				    SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, string);
				    return 1;
				} else {
	   				SendClientMessage(playerid, COLOR_RED, "Essa moto n„o tem Pizzas!");
	   				return 1;
				}
			} else {
	   			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· numa moto Pizzaboy!");
	   			return 1;
			}
 		} else {
	   		SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o È Entregador de Pizza");
	   		return 1;
		}
	}
    
	if(strcmp(cmd,"/entregarpizza",true)==0){
	    if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
	       	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 448){
			    if(PizzasMoto[GetPlayerVehicleID(playerid)] > 0){
				    if(PizzariaCar[playerid] == 1){
				        if(EntregadePizza[playerid]==1){
			          		SendClientMessage(playerid, COLOR_RED2, "VocÍ j· tem 1 pedido");
							return 1;
						} else {
						    if(PizzasEntregues[playerid] == 0) PizzasNecessarias[playerid] = 0;
		                    SendClientMessage(playerid,COLOR_ENTREGADOR_PIZZA,"O pedido foi dado, o local da entrega est· no radar!");
							new pizzas = random(55);
							DisablePlayerCheckpoint(playerid);
							SetPlayerCheckpoint(playerid,EntregaPizza[pizzas][0],EntregaPizza[pizzas][1],EntregaPizza[pizzas][2],3.0);
							EntregadePizza[playerid]=1;
							StatusCheck[playerid] = NONEE;
							CheckpointStatus[playerid] = NONE;
							return 1;
						}
					} else {
						SendClientMessage(playerid,COLOR_RED2,"VocÍ n„o est· na pizzaria.");
						return 1;
					}
				} else {
					SendClientMessage(playerid,COLOR_RED2,"A sua moto n„o tem pizzas.");
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED2,"VocÍ n„o est· numa moto Pizzaboy!");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED2,"N„o tens permiss„o para usar esse comando!");
		    return 1;
		}
	}
	
	if(strcmp(cmd,"/pegarpizza",true) == 0) {
		if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
	    new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
		if(modelo == 448){
			new tmp[256];
			new quantia;
		    tmp = strtok(cmdtext,idx);
		    quantia = strval(tmp);
		    if(!strlen(tmp)){
		   		SendClientMessage(playerid, COLOR_RED, "/pegarpizza [quantidade]");
		   		return 1;
		    }
		    if(PizzariaCar[playerid] == 0){
		   		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na pizzaria.");
		   		return 1;
		    }
		    if(PizzasMoto[GetPlayerVehicleID(playerid)] + quantia > 4){
			   SendClientMessage(playerid, COLOR_RED, "SÛ d· para levar 4 pizzas por moto.");
			   return 1;
			}
			else{
				new string[256];
			    format(string,sizeof(string),"VocÍ pegou %d pizzas agora a moto tem %d pizzas.",quantia,PizzasMoto[GetPlayerVehicleID(playerid)] + quantia);
			    SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, string);
			    if(JogadorContratado(playerid,0)) AcrescentarPrejuizo(0,30);
				PizzasMoto[GetPlayerVehicleID(playerid)] = PizzasMoto[GetPlayerVehicleID(playerid)]+quantia;
				return 1;
		   		}
			}else{
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em uma moto");
				return 1;
			}
		}else{
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o.");
			return 1;
		}
	}

    if(strcmp(cmd, "/revisarlimosine", true) == 0) {
		if(Profissao[playerid] == MOTORISTA){
      		new modelo = GetPlayerVehicleID(playerid);
        	if(modelo  == limosine1 || modelo == limosine2){
        	    if(MotorLimo[playerid] == 0){
					if(LimoRevisada[GetPlayerVehicleID(playerid)] == 0){
						DisablePlayerCheckpoint(playerid);
			  			SetPlayerCheckpoint(playerid, 1024.6149,-1024.0205,32.1016, 3.0);
			  			CheckpointStatus[playerid] = REVISAOLIMO1;
			  			StatusCheck[playerid] = NONEE;
			  			EntregaLimo[playerid] = 1;
						SendClientMessage(playerid, COLOR_MOTORISTA, "V· atÈ a oficina para revisar o motor do carro.");
						return 1;
					} else {
						SendClientMessage(playerid, COLOR_RED2, "Esta limosine j· foi revisada.");
						return 1;
					}
		  		} else {
			  		SendClientMessage(playerid, COLOR_RED2, "VocÍ acabou de checar o Motor de 1 Limosine.");
			  		return 1;
	  			}
		  	} else {
			  	SendClientMessage(playerid, COLOR_RED2, "VocÍ tem que estar em uma Limosine da LuxLimosine.");
			  	return 1;
			}
	  	} else {
		  	SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o È Motorista.");
		  	return 1;
		}
	}
   	if(strcmp(cmd, "/lavarlimosine", true) == 0) {
		if(Profissao[playerid] == MOTORISTA){
			if(LimoLavada[GetPlayerVehicleID(playerid)] == 1){
		 		SendClientMessage(playerid, COLOR_RED2, "A Limosine est· limpa.");
		   		return 1;
		   	}
		   	if(LavagemLimo[playerid] == 1){
		 		SendClientMessage(playerid, COLOR_RED2, "VocÍ acabou de lavar 1 Limosine.");
				return 1;
		   	}
		   	if(LavandoLimo[playerid] == 0){
      			new modelo = GetPlayerVehicleID(playerid);
				if(modelo  == limosine1 || modelo == limosine2 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
					SendClientMessage(playerid, COLOR_MOTORISTA, "Leve a Limosine para o Lava-Jato.");
					SetPlayerCheckpoint(playerid, 1910.7260,-1776.1322,13.3828,3.0);
					LavandoLimo[playerid] = 1;
					CheckpointStatus[playerid] = LAVANDOLIMOSINE;
					StatusCheck[playerid] = NONEE;
	 	       		return 1;
		   		} else {
		 			SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o est· em uma Limosine da empresa LuxLimosine.");
					return 1;
				}
			} else {
		 		SendClientMessage(playerid, COLOR_RED2, "VocÍ marcou a lavagem, v· para o Checkpoint");
				return 1;
			}
		}
	}
    if(strcmp(cmd, "/contratarseguranca", true) == 0) {
	    new tmp[256];
		new plid,valor;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "USO: /contratarseguranca [id] [valor]");
		    return 1;
		}
		tmp = strtok(cmdtext,idx);
		valor = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "USO: /contratarseguranca [id] [valor]");
		    return 1;
		}
		if(Profissao[plid] != SEGURAN«A){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o È seguranÁa!");
		    return 1;
		}
		if(dini_Int(PlayerName(plid),"JaContratado") == 1){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador j· est· contratado!");
		    return 1;
		}
		else{
			for(new i=0; i<dini_Int(PlayerName(playerid),"NSegurancas"); i++){
		   	 	new str[256];
		    	format(str,sizeof(str),"Seguranca_%d",i);
	    		if(strcmp(dini_Get(PlayerName(playerid),str),PlayerName(plid),true) == 0){
		        	SendClientMessage(playerid, COLOR_RED, "Ele j· trabalha para vocÍ!");
		        	return 0;
				}
			}
			SendClientMessage(playerid, COLOR_GREEN, "Contrato enviado!");
			new string[256];
			format(string,sizeof(string),"%s est· lhe oferecendo um contrato por $%d:",PlayerName(playerid),valor);
			SendClientMessage(plid, COLOR_GREEN, string);
			SendClientMessage(plid, COLOR_GREEN, "Digite /aceitar para aceitar o contrato ou ent„o digite /recusar para recusar o contrato!");
			SegurancaContratado[plid] = 1;
			Scontratador[plid] = playerid;
			Svaloroferecido[plid] = valor;
			invitestatus[plid] = INVITE_CONTRATO_SEGURANCA;
			return 1;
		}
	}
	if(strcmp(cmd, "/demitirseguranca", true) == 0) {
	    new tmp[256];
	    new plid;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /demitirseguranca [id]");
	        return 1;
		}
		for(new i=0; i<dini_Int(PlayerName(playerid),"NSegurancas"); i++){
	   	 	new str[256];
	    	format(str,sizeof(str),"Seguranca_%d",i);
	   		if(strcmp(dini_Get(PlayerName(playerid),str),PlayerName(plid),true) == 0){
	        	dini_Set(PlayerName(playerid),str,"NONE");
	        	format(str,sizeof(str),"Seguranca_%d_Valor",i);
	        	dini_IntSet(PlayerName(playerid),str,0);
	        	dini_IntSet(PlayerName(plid),"JaContratado",0);
	        	SendClientMessage(playerid, COLOR_GREEN, "SeguranÁa demitido!");
	        	SendClientMessage(plid, COLOR_RED, "VocÍ foi demitido! Parece que n„o foi um bom seguranÁa...");
	        	return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Ele n„o trabalha para vocÍ!");
			    return 1;
			}
		}
	}
	if(strcmp(cmd, "/pescar", true) == 0) {
	    if(PescaInProgress[playerid] == 1) {
	    	SendClientMessage(playerid, COLOR_RED, "Calminha aÍ... VocÍ j· est· pescando!");
	    	return 1;
	    }
		if(QtIscas[playerid] < 1){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue iscas! Como poder· pescar?");
			return 1;
		} else {
			if(AreaPesca[playerid] == 1){
				SendClientMessage(playerid,COLOR_GREEN,"VocÍ lanÁou a rede de pesca. Espere ela voltar para concluir a pesca.");
				SendClientMessage(playerid,COLOR_GREEN,"Enquanto ela n„o vem, fique apreciando a paisagem.");
				PescaInProgress[playerid] = 1;
				SetTimerEx("Pesca",36000,0,"d",playerid);
				return 1;
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· na ·rea de pesca, consulte nosso site para uma referÍncia.");
				return 1;
			}
		}
	}
	if(strcmp(cmd,"/minhasiscas",true) == 0){
	    new string[256];
	    if(QtIscas[playerid] <= 0){
		    format(string,sizeof(string),"VocÍ n„o possue nenhuma isca para pescar!");
		    SendClientMessage(playerid, COLOR_RED, string);
		    return 1;
		}
		else if(QtIscas[playerid] == 1){
			format(string,sizeof(string),"VocÍ possue 1 isca para pescar!");
			SendClientMessage(playerid, COLOR_GREEN, string);
	      	return 1;
		}
		else if(QtIscas[playerid] > 1){
	      	format(string,sizeof(string),"VocÍ possue %d iscas para pescar!",QtIscas[playerid]);
	      	SendClientMessage(playerid, COLOR_GREEN, string);
	      	return 1;
	    }
	}
	if(strcmp(cmd, "/cerveja", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
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
			if(teor < 1 || teor > 20){
			    SendClientMessage(playerid, COLOR_RED, " Copos de chopp: de 1 ‡ 20.");
				return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender para si mesmo.");
				return 1;
			}
			if(GetPlayerMoney(plid) < 80*teor){
				SendClientMessage(playerid, COLOR_RED, "O jogador indicado n„o possue dinheiro.");
				return 1;
			}
			if(JaComi[plid] == 1 && JaVendi[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"AtenÁ„o vocÍ n„o pode vender para o mesmo jogador em menos de 30 segundos.");
				SendClientMessage(playerid,COLOR_RED,"O administrador foi informado. Caso pessista ser· kickado ou banido");
			    format(tmp,256,"%s Tentou vender uma cerveja em menos de 30 segundos para o mesmo jogador. Chame-lhe a atenÁ„o.",PlayerName(playerid));
			    SendClientMessageAdmin(COLOR_ENTREGADOR_PIZZA,tmp);
		    	SetTimerEx("Comeu",30000,0,"d",playerid,plid);
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    SendClientMessage(playerid,COLOR_BARMAN,"Cerveja oferecida, agora espere o outro jogador aceitar.");
				    	new string[256];
					   	format(string,sizeof(string),"%s est· lhe oferecendo uma cerveja, digite /aceitarbebida para aceita-la ou digite /recusarbebida para recusa-la.",PlayerName(playerid));
					   	SendClientMessage(plid, COLOR_BARMAN, string);
         				Produto[plid] = 5;
					    ValorDoProduto[plid] = 80*teor;
					    TeorDoProduto[plid] = teor;
					    VendedorProduto[plid] = playerid;
					    OfertaDada[plid] = 1;
						return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto para entregar o bagulho!");
				    return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...VocÍ n„o tem permiss„o para isso, sua profissao È outra");
			return 1;
		}
	}

	if(strcmp(cmd, "/whisky", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/whisky [id] [quantidade]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/whisky [id] [quantidade]");
				return 1;
			}
			teor = strval(tmp);
			if(teor < 1 || teor > 3){
			    SendClientMessage(playerid, COLOR_RED, "Ei ele quer tomar um drink, n„o encher a cara. Doses de 1 e 3.");
				return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender para si mesmo.");
				return 1;
			}
			if(JaComi[plid] == 1 && JaVendi[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"AtenÁ„o vocÍ n„o pode vender para o mesmo jogador em menos de 30 segundos.");
				SendClientMessage(playerid,COLOR_RED,"O administrador foi informado. Caso pessista ser· kickado ou banido");
			    format(tmp,256,"%s Tentou vender um whisky em menos de 30 segundos para o mesmo jogador. Chame-lhe a atenÁ„o.",PlayerName(playerid));
			    SendClientMessageAdmin(COLOR_ENTREGADOR_PIZZA,tmp);
		    	SetTimerEx("Comeu",30000,0,"d",playerid,plid);
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
						new grana = floatround((teor * 100));
					    if(GetPlayerMoney(plid) >= grana){
						    SendClientMessage(playerid,COLOR_BARMAN,"Whisky oferecido, agora espere o outro jogador aceitar.");
					    	new string[256];
					    	format(string,sizeof(string),"%s est· lhe oferecendo um whisky, digite /aceitarbebida para aceita-la ou digite /recusarbebida para recusa-la.",PlayerName(playerid));
					    	SendClientMessage(plid, COLOR_BARMAN, string);
					    	OfertaDada[plid] = 1;
					    	VendedorProduto[plid] = playerid;
					    	Produto[plid] = 2;
					    	TeorDoProduto[plid] = teor;
					    	ValorDoProduto[plid] = grana;
							return 1;
						} else {
					    	SendClientMessage(playerid, COLOR_RED, "O jogador n„o tem dinheiro.");
					    	return 1;
						}
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
					    return 1;
					}
				}
				else{
					SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...VocÍ n„o tem permiss„o para isso, sua profissao È outra");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/guarana", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, teor;
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
			if(teor < 1 || teor > 3){
			    SendClientMessage(playerid, COLOR_RED, "No m·ximo 3 copos.");
				return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender para si mesmo.");
				return 1;
			}
			if(JaComi[plid] == 1 && JaVendi[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"AtenÁ„o vocÍ n„o pode vender para o mesmo jogador em menos de 30 segundos.");
				SendClientMessage(playerid,COLOR_RED,"O administrador foi informado. Caso pessista ser· kickado ou banido");
			    format(tmp,256,"%s Tentou vender um guaran· em menos de 30 segundos para o mesmo jogador. Chame-lhe a atenÁ„o.",PlayerName(playerid));
			    SendClientMessageAdmin(COLOR_ENTREGADOR_PIZZA,tmp);
				SetTimerEx("Comeu",30000,0,"d",playerid,plid);
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
						new grana = floatround((teor * 40));
					    if(GetPlayerMoney(plid) >= grana){
					        SendClientMessage(playerid,COLOR_BARMAN,"Guaran· oferecido, agora espere o outro jogador aceitar.");
					    	new string[256];
					    	format(string,sizeof(string),"%s est· lhe oferecendo um guaran·, digite /aceitarbebida para aceita-la ou digite /recusarbebida para recusa-la.",PlayerName(playerid));
					    	SendClientMessage(plid, COLOR_BARMAN, string);
						    Produto[plid] = 3;
						    ValorDoProduto[plid] = grana;
						    TeorDoProduto[plid] = teor;
						    VendedorProduto[plid] = playerid;
						    OfertaDada[plid] = 1;
							return 1;
						} else {
					    	SendClientMessage(playerid, COLOR_RED, "O jogador n„o tem dinheiro");
					    	return 1;
					    }
					} else {
				    	SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado!");
					    return 1;
					}
				}
				else{
					SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei... VocÍ n„o tem permiss„o para isso, sua profissao È outra");
			return 1;
		}
	}
	if(strcmp(cmd, "/pinga", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
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
			if(teor < 1 || teor > 3){
			    SendClientMessage(playerid, COLOR_RED, "Se esse pinguÁo encher a cara vai te dar problemas. Venda somente de 1 a 3 copos.");
				return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode vender para si mesmo.");
				return 1;
			}
			if(JaComi[plid] == 1 && JaVendi[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"AtenÁ„o vocÍ n„o pode vender para o mesmo jogador em menos de 30 segundos.");
				SendClientMessage(playerid,COLOR_RED,"O administrador foi informado. Caso pessista ser· kickado ou banido");
			    format(tmp,256,"%s Tentou vender uma pinga em menos de 30 segundos para o mesmo jogador. Chame-lhe a atenÁ„o.",PlayerName(playerid));
			    SendClientMessageAdmin(COLOR_ENTREGADOR_PIZZA,tmp);
				SetTimerEx("Comeu",30000,0,"d",playerid,plid);
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    new grana = floatround((teor * 50));
					    if(GetPlayerMoney(plid) >= grana){
					        SendClientMessage(playerid,COLOR_BARMAN,"Pinga oferecida, agora espere o outro jogador aceitar.");
					    	new string[256];
					    	format(string,sizeof(string),"%s est· lhe oferecendo uma pinga, digite /aceitarbebida para aceita-la ou digite /recusarbebida para recusa-la.",PlayerName(playerid));
					    	SendClientMessage(plid, COLOR_BARMAN, string);
                            Produto[plid] = 4;
						    ValorDoProduto[plid] = grana;
						    TeorDoProduto[plid] = teor;
						    VendedorProduto[plid] = playerid;
						    OfertaDada[plid] = 1;
							return 1;
							} else {
							    SendClientMessage(playerid, COLOR_RED, "O jogador n„o tem dinheiro");
							    return 1;
							}
						} else {
						    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado");
						    return 1;
						}
				} else {
		 	    	SendClientMessage(playerid, COLOR_RED, "VocÍ est· distante do jogador");
		        	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem permiss„o");
			return 1;
		}
	}
    if(strcmp(cmd, "/aceitarbebida", true) == 0) {
	    if(OfertaDada[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma bebida!");
	        return 1;
		}
		if(Produto[playerid] != 2 && Produto[playerid] != 3 && Produto[playerid] != 4 && Produto[playerid] != 5){
			SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma bebida!");
			return 1;
		}
		if(!IsPlayerConnected(VendedorProduto[playerid])){
		    SendClientMessage(playerid, COLOR_RED, "O outro jogador parece ter saÌdo do servidor!");
		    return 1;
		}
		if(Produto[playerid] == 2){
		    new string[256];
		    new tmp[256];
	    	Bebida[playerid] = Bebida[playerid]+TeorDoProduto[playerid];
		    dini_IntSet(PlayerName(playerid),"Alcool",Bebida[playerid]);
			format(string, sizeof(string), "VocÍ bebeu um bom whisky 12 anos mas o nivel de alcool no seu sangue agora È de: %d mg", Bebida[playerid]);
  			SendClientMessage(playerid, COLOR_GREEN, string);
   			SendClientMessage(VendedorProduto[playerid], COLOR_GREEN, "O whisky foi aceito");
      		AddPlayerHealth(playerid, 80);
        	GivePlayerMoney(playerid, 0 - ValorDoProduto[playerid]);
         	GivePlayerMoney(VendedorProduto[playerid], 0 + ValorDoProduto[playerid]);
          	if(JogadorContratado(VendedorProduto[playerid],8)) AcrescentarLucro(8,ValorDoProduto[playerid]);
			JaComi[playerid] = 1;
			JaVendi[VendedorProduto[playerid]] = 1;
   			SetTimerEx("Comeu",30000,0,"d",playerid,VendedorProduto[playerid]);
      		format(tmp,256,"***%s vendeu um whisk a %s***",PlayerName(VendedorProduto[playerid]),PlayerName(playerid));
		    SendClientMessageAdmin(COLOR_BARMAN,tmp);
		    if(Profissao[playerid] != BARMAN) AcrescentarExPoints(VendedorProduto[playerid],1);
		    ValorDoProduto[playerid] = 0;
		    Produto[playerid] = 0;
		    TeorDoProduto[playerid] = 0;
		    return 1;
		}
		else if(Produto[playerid] == 3){
		    new string[256];
		    new tmp[256];
		    Bebida[playerid] = Bebida[playerid]/20;
		    dini_IntSet(PlayerName(playerid),"Alcool",Bebida[playerid]);
			format(string, sizeof(string), "VocÍ tomou um KUAT, ent„o o teor de alcool no seu sangue baixou para: %d mg", Bebida[playerid]);
   			SendClientMessage(playerid, COLOR_GREEN, string);
      		SendClientMessage(VendedorProduto[playerid], COLOR_GREEN, "Guaran· aceito.");
   	    	AddPlayerHealth(playerid, 20);
	        GivePlayerMoney(playerid, 0 - ValorDoProduto[playerid]);
	        GivePlayerMoney(VendedorProduto[playerid], 0 + ValorDoProduto[playerid]);
	        if(JogadorContratado(VendedorProduto[playerid],8)) AcrescentarLucro(8,ValorDoProduto[playerid]);
	        JaVendi[VendedorProduto[playerid]] = 1;
	        JaComi[playerid] = 1;
	        format(tmp,256,"***%s vendeu %d copos de KUAT para %s***",PlayerName(VendedorProduto[playerid]),TeorDoProduto[playerid],PlayerName(playerid));
		    SendClientMessageAdmin(COLOR_BARMAN,tmp);
		    SetTimerEx("Comeu",30000,0,"d",playerid,VendedorProduto[playerid]);
   			if(Profissao[playerid] != BARMAN) AcrescentarExPoints(VendedorProduto[playerid],1);
   			ValorDoProduto[playerid] = 0;
		    Produto[playerid] = 0;
		    TeorDoProduto[playerid] = 0;
		    return 1;
		}
		else if(Produto[playerid] == 4){
		    new string[256];
		    new tmp[256];
		    new Float:X, Float:Y, Float:Z;
		    Bebida[playerid] = Bebida[playerid]+TeorDoProduto[playerid];
  			dini_IntSet(PlayerName(playerid),"Alcool",Bebida[playerid]);
			format(string, sizeof(string), "VocÍ tomou uma pinga da boa, mas o teor de alcool no seu sangue È de: %d mg", Bebida[playerid]);
  			SendClientMessage(playerid, COLOR_GREEN, string);
     		SendClientMessage(VendedorProduto[playerid], COLOR_GREEN, "Pinga vendida.");
       		AddPlayerHealth(playerid, 60);
         	GivePlayerMoney(playerid, 0 - ValorDoProduto[playerid]);
          	GivePlayerMoney(VendedorProduto[playerid], 0 + ValorDoProduto[playerid]);
            if(JogadorContratado(VendedorProduto[playerid],8)) AcrescentarLucro(8,ValorDoProduto[playerid]);
	        format(tmp,256,"***%s vendeu %d copos de pinga para %s***",PlayerName(VendedorProduto[playerid]),TeorDoProduto[playerid],PlayerName(playerid));
	    	SendClientMessageAdmin(COLOR_BARMAN,tmp);
			JaComi[playerid] = 1;
			JaVendi[VendedorProduto[playerid]] = 1;
			ValorDoProduto[playerid] = 0;
		    Produto[playerid] = 0;
		    TeorDoProduto[playerid] = 0;
			SetTimerEx("Comeu",30000,0,"d",playerid,VendedorProduto[playerid]);
   			if(Profissao[playerid] != BARMAN) AcrescentarExPoints(VendedorProduto[playerid],1);
			if(TeorDoProduto[playerid] > 3 && TeorDoProduto[playerid] < 7){
				ClearAnimations(playerid);
    			ApplyAnimation(playerid,"PED", "WALK_DRUNK",10,0,1,0,0,0);
			    SendClientMessage(playerid,COLOR_RED,"VocÍ bebeu demais e agora est· tonto.");
			    ValorDoProduto[playerid] = 0;
		    	Produto[playerid] = 0;
		    	TeorDoProduto[playerid] = 0;
			    return 1;
			}
			if(TeorDoProduto[playerid] == 7){
   				ClearAnimations(playerid);
			    ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
		    	GetPlayerPos(VendedorProduto[playerid],X,Y,Z);
			    PlayerPlaySound(VendedorProduto[playerid],1169,X,Y,Z);
			    SendClientMessage(playerid,COLOR_RED,"VocÍ bebeu demais e acabou vomitando.");
			    ValorDoProduto[playerid] = 0;
		    	Produto[playerid] = 0;
		    	TeorDoProduto[playerid] = 0;
			    return 1;
			}
		}
		else if(Produto[playerid] == 5){
		    new string[256];
		    new tmp[256];
		    Bebida[playerid] = Bebida[playerid]+TeorDoProduto[playerid];
		    dini_IntSet(PlayerName(playerid),"Alcool",Bebida[playerid]);
			format(string, sizeof(string), "VocÍ tomou uma cerveja geladinha mas o nÌvel de alcool no seu sangue agora È de: %d mg", Bebida[playerid]);
   			SendClientMessage(playerid, COLOR_GREEN, string);
   			SendClientMessage(VendedorProduto[playerid], COLOR_GREEN, "Uma cerveja gelada saindo...");
      		AddPlayerHealth(playerid, 30);
        	GivePlayerMoney(playerid, -80*TeorDoProduto[playerid]);
         	GivePlayerMoney(VendedorProduto[playerid], 80*TeorDoProduto[playerid]);
          	if(JogadorContratado(VendedorProduto[playerid],8)) AcrescentarLucro(8,80*TeorDoProduto[playerid]);
	        format(tmp,256,"***%s vendeu %d copos de cerveja a %s***",PlayerName(VendedorProduto[playerid]),TeorDoProduto[playerid],PlayerName(playerid));
		    SendClientMessageAdmin(COLOR_BARMAN,tmp);
			JaComi[playerid] = 1;
			JaVendi[VendedorProduto[playerid]] = 1;
			SetTimerEx("Comeu",30000,0,"d",playerid,VendedorProduto[playerid]);
		    if(Profissao[playerid] != BARMAN) AcrescentarExPoints(VendedorProduto[playerid],1);
		    ValorDoProduto[playerid] = 0;
		    Produto[playerid] = 0;
		    TeorDoProduto[playerid] = 0;
		    return 1;
		}
	}
	if(strcmp(cmd, "/recusarbebida", true) == 0) {
	    if(OfertaDada[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma bebida!");
	        return 1;
		}
		if(Produto[playerid] != 2 && Produto[playerid] != 3 && Produto[playerid] != 4 && Produto[playerid] != 5){
			SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecida nenhuma bebida!");
			return 1;
		}
		if(!IsPlayerConnected(VendedorProduto[playerid])){
		    SendClientMessage(playerid, COLOR_RED, "O outro jogador parece ter saÌdo do servidor!");
		    return 1;
		}
		else{
		    OfertaDada[playerid] = 0;
			Produto[playerid] = 0;
			ValorDoProduto[playerid] = 0;
			TeorDoProduto[playerid] = 0;
			SendClientMessage(VendedorProduto[playerid], COLOR_RED, "A bebida foi recusada!");
			SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "VocÍ recusou a bebida...");
			return 1;
		}
	}
//SEGUROS
    if(strcmp(cmd,"/pedirseguro", true) == 0) {
		new string[256];
    	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
 		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		SendClientMessage(playerid,COLOR_CORRETOR_SEGUROS,"Seguro solicitado!");
        for(new i=0; i<MAX_PLAYERS; i++){
		    if(IsPlayerAdmin(i) == 1 || Profissao[i] == CORRETOR_SEGUROS){
			format(string, sizeof(string), "O jogador %s est· pedindo um seguro.", PlayerName(playerid));
			SendClientMessage(i, COLOR_CORRETOR_SEGUROS, string);
		    }
		}
  		return 1;
 	}
 	if(strcmp(cmd,"/seguroveiculo", true) == 0) {
       if(Profissao[playerid] == CORRETOR_SEGUROS || IsPlayerAdmin(playerid)){
		  if(IsPlayerInAnyVehicle(playerid)){
			 new tmp[256];
			 format(tmp,sizeof(tmp),"%d.vinfo",GetPlayerVehicleID(playerid));
			 if(strcmp(dini_Get(tmp,"Dono"), "Server", false)){
			 SeguroCarro[GetPlayerVehicleID(playerid)] = 1;
			 new str[256];
			 format(str,sizeof(str),"%d.vinfo",GetPlayerVehicleID(playerid));
			 dini_IntSet(str,"Seguro",1);
			 AcrescentarExPoints(playerid,1);
			 AcrescentarLucro(3,1500);
			 SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "VeÌculo assegurado!");
			 return 1;
		  	 }
		  	 else{
				 SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode assegurar um veÌculo do governo/server");
				 return 1;
				 }
		  }
		  else{
			  SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
			  return 1;
			  }
	   }
	   else{
		   SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Corretor de seguros!");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/removerseguroveiculo", true) == 0) {
	    if(!IsPlayerInAnyVehicle(playerid)){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar em um veÌculo!");
	        return 1;
		}
		if(strcmp(Dono[GetPlayerVehicleID(playerid)],PlayerName(playerid),true)){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È o dono do veÌculo!");
		    return 1;
		}
		new str[256];
		format(str,sizeof(str),"%d.vinfo",GetPlayerVehicleID(playerid));
		if(dini_Int(str,"Seguro") == 0){
		    SendClientMessage(playerid, COLOR_RED, "Esse veÌculo n„o possue seguro!");
		    return 1;
		}
		else{
			SeguroCarro[GetPlayerVehicleID(playerid)] = 0;
			dini_IntSet(str,"Seguro",0);
			SendClientMessage(playerid, COLOR_RED2, "O seguro do veÌculo foi removido!");
			new string[256];
			format(string,sizeof(string),"SERVIDOR: %s removeu o seguro do seu veÌculo (ID: %d)",PlayerName(playerid),GetPlayerVehicleID(playerid));
			writelog(string);
			return 1;
		}
	}
	if(strcmp(cmd, "/seguroimovel", true) == 0) {
		if(Profissao[playerid] == CORRETOR_SEGUROS || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
		    tmp = strtok(cmdtext,idx);
		    plid = strval(tmp);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "USO: /seguroimovel [id]");
				return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
			    return 1;
			}
			if(dini_Int(PlayerName(plid),"SeguroCasa") == 1){
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador j· possue seguro de imÛvel!");
			    return 1;
			}
			if(plid == playerid){
		   		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode se prÛprio segurar-se!");
		   		return 1;
		    }
			if(GetPlayerMoney(plid) < 600){
				SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue dinheiro!");
				return 1;
			}
			else{
			    VendedorSeguro[plid] = playerid;
			    SeguroImovel[plid] = 1;
			    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Seguro de imÛvel oferecido!");
			    new str[256];
			    format(str,sizeof(str),"%s est· lhe oferecendo um seguro de imÛvel por $1000.",PlayerName(playerid));
			    SendClientMessage(plid, COLOR_CORRETOR_SEGUROS, str);
				SendClientMessage(plid, COLOR_CORRETOR_SEGUROS, "Para aceitar o seguro digite: /aceitarseguroimovel, e para recusar digite: /recusarseguroimovel");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Corretor de seguro!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/aceitarseguroimovel", true) == 0) {
	    if(SeguroImovel[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecido uma proposta de seguro de imÛvel!");
			return 1;
		}
		else{
		    SeguroImovel[playerid] = 0;
		    AcrescentarExPoints(VendedorSeguro[playerid],1);
		    GivePlayerMoney(playerid,-600);
		    dini_IntSet(PlayerName(playerid),"SeguroCasa",1);
		    SendClientMessage(VendedorSeguro[playerid], COLOR_CORRETOR_SEGUROS, "O seguro foi aceito e vocÍ recebeu $600");
		    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Seguro aceito!");
		    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Agora quando vocÍ vender uma casa poder· ganhar um reembolso!");
		    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Mas vocÍ ter· que pagar $300 ‡ cada 2 dias que se passam no jogo!");
		    if(!JogadorContratado(VendedorSeguro[playerid],3)){
		       	GivePlayerMoney(VendedorSeguro[playerid],1000);
				SendClientMessage(VendedorSeguro[playerid], COLOR_CORRETOR_SEGUROS, "O seguro foi aceito e vocÍ recebeu $600!");
			}
			else if(JogadorContratado(VendedorSeguro[playerid],3)){
			    GivePlayerMoney(VendedorSeguro[playerid],600);
			    AcrescentarLucro(3,400);
			    SendClientMessage(VendedorSeguro[playerid], COLOR_CORRETOR_SEGUROS, "VocÍ recebeu $600 e $400 foi para a sua propriedade!");
			}
			return 1;
		}
	}
	if(strcmp(cmd, "/recusarseguroimovel", true) == 0) {
	    if(SeguroImovel[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "N„o foi lhe oferecido uma proposta de seguro de imÛvel!");
			return 1;
		}
		else{
		    SeguroImovel[playerid] = 0;
		    SendClientMessage(VendedorSeguro[playerid], COLOR_CORRETOR_SEGUROS, "O seguro foi recusado.");
		    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Seguro recusado!");
		    return 1;
		}
	}
	if(strcmp(cmd,"/cancelarseguroimovel",true) == 0){
		if(dini_Int(PlayerName(playerid),"SeguroCasa") == 0){
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue seguro de imÛvel!");
			return 1;
		}
		else{
			dini_IntSet(PlayerName(playerid),"SeguroCasa",0);
			SendClientMessage(playerid, COLOR_RED, "Seguro de imÛvel removido!");
			for(new i=0; i<MAX_PLAYERS; i++){
				if(Profissao[i] == CORRETOR_SEGUROS || IsPlayerAdmin(i)){
				new str[256];
				format(str,sizeof(str),"O jogador %s removeu seu seguro de imÛvel!",PlayerName(playerid));
				SendClientMessage(i, COLOR_RED, str);
				writelog(str);
				}
			}
			return 1;
		}
	}
	if(strcmp(cmd,"/segurovida", true) == 0) {
		if(Profissao[playerid] == CORRETOR_SEGUROS || IsPlayerAdmin(playerid)){
		   new tmp[256];
		   new string[256];
		   new plid;
		   tmp = strtok(cmdtext,idx);
		   if(!strlen(tmp)){
		   SendClientMessage(playerid, COLOR_RED, "Sintaxe incorreta. USO: /segurovida [id-do-jogador]");
		   return 1;
		   }
		   plid = strval(tmp);
		   if(!IsPlayerConnected(plid)){
		   SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado");
		   return 1;
		   }
		   if(dini_Int(PlayerName(plid),"Seguro") == 1){
		   SendClientMessage(playerid, COLOR_RED, "Ei, esse jogador j· possue seguro!");
		   return 1;
		   }
		   if(GetDistanceBetweenPlayers(playerid,plid) > 10){
		   SendClientMessage(playerid, COLOR_RED, "Chegue mais perto!");
		   return 1;
		   }
		   if(plid == playerid){
		   SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode se prÛprio segurar-se!");
		   return 1;
		   }
		   if(GetPlayerMoney(plid) < 500){
		   SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue dinheiro!");
		   return 1;
		   }
		   else{
			   Seguro[plid] = 1;
			   VendedorSeguro[plid] = playerid;
			   SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Ok... aguarde foi enviado um convite para ver se o jogador aceita o seguro de vida.");
			   format(string,sizeof(string),"%s est· lhe oferecendo um seguro de vida por $200!",PlayerName(playerid));
			   SendClientMessage(plid, COLOR_CORRETOR_SEGUROS, string);
			   SendClientMessage(plid, COLOR_CORRETOR_SEGUROS, "Digite /aceitarseguro para aceita-lo ou ent„o digite /recusarseguro para recusa-lo!");
			   return 1;
	   		   }
   		   }
    	   else{
      		   SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Corretor de seguros!");
	   		   return 1;
		       }
	}
	if(strcmp(cmd,"/recusarseguro",true) == 0) {
	    if(Seguro[playerid] == 0){
	    SendClientMessage(playerid, COLOR_RED, "N„o foi enviado um convite de seguro para vocÍ!");
	    return 1;
	    }
	    else{
			Seguro[playerid] = 0;
			SendClientMessage(playerid, COLOR_RED, "Seguro de vida recusado!");
			SendClientMessage(VendedorSeguro[playerid], COLOR_RED, "O seguro de vida foi recusado!");
			return 1;
		}
	}
	if(strcmp(cmd,"/aceitarseguro",true) == 0) {
	    if(Seguro[playerid] == 0){
	    SendClientMessage(playerid, COLOR_RED, "N„o foi enviado um convite de seguro para vocÍ!");
	    return 1;
	    }
	    else{
			Seguro[playerid] = 0;
		    AcrescentarExPoints(VendedorSeguro[playerid],1);
		    GivePlayerMoney(playerid,-500);
		    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Seguro de vida comprado! Agora quando vocÍ for para o hospital n„o pagar· nada.");
		    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "Mas vocÍ ter· que pagar $200 ‡ cada 2 dias que passarem no jogo.");
		    SendClientMessage(playerid, COLOR_CORRETOR_SEGUROS, "A grana ir· sendo retirada do banco! Caso queira remover o seguro digite /cancelarseguro.");
		    dini_IntSet(PlayerName(playerid),"Seguro",1);
		    if(!JogadorContratado(VendedorSeguro[playerid],3)){
		        GivePlayerMoney(VendedorSeguro[playerid],500);
				SendClientMessage(VendedorSeguro[playerid], COLOR_CORRETOR_SEGUROS, "O seguro foi aceito e vocÍ recebeu $500!");
			}
			else if(JogadorContratado(VendedorSeguro[playerid],3)){
			    GivePlayerMoney(VendedorSeguro[playerid],300);
			    AcrescentarLucro(3,200);
			    SendClientMessage(VendedorSeguro[playerid], COLOR_CORRETOR_SEGUROS, "VocÍ recebeu $300 e $200 foi para a sua propriedade!");
			}
			return 1;
	    }
	}
	
	if(strcmp(cmd,"/cancelarseguro",true) == 0){
		if(dini_Int(PlayerName(playerid),"Seguro") == 0){
		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue seguro!");
		return 1;
		}
		else{
			dini_IntSet(PlayerName(playerid),"Seguro",0);
			SendClientMessage(playerid, COLOR_RED, "Seguro de vida removido!");
			for(new i=0; i<MAX_PLAYERS; i++){
				if(Profissao[i] == CORRETOR_SEGUROS || IsPlayerAdmin(i)){
				new str[256];
				format(str,sizeof(str),"O jogador %s removeu seu seguro de vida!",PlayerName(playerid));
				SendClientMessage(i, COLOR_RED, str);
				writelog(str);
				}
			}
			return 1;
		}
	}
	
//Comprar Celular
	if(strcmp(cmd, "/celular", true) == 0) {
	    if(GetPlayerMoney(playerid) < 500){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar.");
			return 1;
		}
		if(dini_Int(PlayerName(playerid),"PhoneNumb") != 0){
			SendClientMessage(playerid, COLOR_WHITE, "VocÍ j· tem celular.");
			return 1;
		}
	    new string[256];
		SendClientMessage(playerid,COLOR_RED2,"Aguarde, processando...");
		GivePlayerMoney(playerid,-500);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		LastPN = dini_Int("celulares.rpg","LastPN");
		LastPN++;
		new phone = LastPN;
		format(string, sizeof(string), "Celular obtido. Seu numero: %d", phone);
		SendClientMessage(playerid, COLOR_ROSA, string);
		dini_IntSet("celulares.rpg","LastPN",LastPN);
		format(string,256,"%d",phone);
		dini_Set("celulares.rpg",string,PlayerName(playerid));
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: VocÍ pode digitar /ajuda para ver os comandos do seu celular.");
        dini_IntSet(PlayerName(playerid),"PhoneNumb", phone);
		return 1;
	}

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
	    	if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
	    		if(TempoDesmanche[playerid] == 1) {
			   		SendClientMessage(playerid, COLOR_RED, "VocÍ j· entregou um carro aqui. Espere um pouco para entregar de novo!");
	    		}
				if(IsPlayerInAnyVehicle(playerid) && TempoDesmanche[playerid] == 0){
   			   		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == Veiculoprocurado){
						if(AreaDesmanche[playerid] == 1){
		   					SendClientMessage(playerid,COLOR_GREEN,"Aew mano, seu carro vale 2000.");
							GivePlayerMoney(playerid, 2000);
							SendClientMessage(playerid,COLOR_WHITE,"VocÍ entregou o carro ao desmanche por 2000 \"pratas\".");
							RemovePlayerFromVehicle(vehicleid);
							SetVehiclePos(vehicleid, 2172.8694,-2004.8391,32.4801);
				   			TempoDesmanche[playerid] = 1;
				   			AcrescentarExPoints(playerid,1);
							SetTimerEx("Desmanche",300000,false,"d",playerid);
    						return 1;
					        } else {
				 	    	    SendClientMessage(playerid,COLOR_RED,"Meu irm„o tu num t· na ·rea!!!!");
							    return 1;
							    }
                     } else {
                         SendClientMessage(playerid,COLOR_AZULPLUS,"Agente quer esse veÌculo maluco!!!");
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
	    if(Profissao[playerid] == ASSALTANTE){
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
    if(strcmp(cmd, "/tratamentodrogas", true) == 0) {
        if(Profissao[playerid] == PARAMEDICO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "USO: /tratamentodrogas [id]");
			    return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado");
				return 1;
			}
			if(kitmedico[playerid] <= 0){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem nenhum kitmedico, v· ao Hospital pegar.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid,plid) > 7){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
			    return 1;
			}
			if(QtMaconha[plid] <= 0 && QtCocaina[plid] <= 0 && QtHeroina[plid] <= 0){
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue drogas no sangue.");
			    return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode fazer tratamento em si mesmo.");
			    return 1;
			}
			if(GetPlayerMoney(plid) < 600){
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue dinheiro para pagar o tratamento, Custo: $600");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_GREEN, "Tratamento feito, vocÍ recebeu $600.");
				new string[256];
				format(string,sizeof(string),"O ParamÈdico %s lhe fez um tratamento de drogas!",PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(plid, COLOR_GREEN, "Agora suas drogas foram removidas do seu sangue, o tratamento custou $600");
				GivePlayerMoney(playerid,600);
				GivePlayerMoney(plid,-600);
				AcrescentarExPoints(playerid,1);
				QtHeroina[plid] = 0;
				QtMaconha[plid] = 0;
				QtCocaina[plid] = 0;
				dini_IntSet(PlayerName(plid),"DosesHeroina",0);
				dini_IntSet(PlayerName(plid),"DosesMaconha",0);
				dini_IntSet(PlayerName(plid),"DosesCocaina",0);
				kitmedico[playerid] = kitmedico[playerid] -1;
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È ParamÈdico!");
		    return 1;
		    }
	}

    if(strcmp(cmd, "/tratardoenca", true) == 0) {
        if(Profissao[playerid] == PARAMEDICO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "USO: /tratardoenca [id]");
			    return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COLOR_RED, "O Jogador n„o est· conectado.");
				return 1;
			}
			if(kitmedico[playerid] <= 0){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem nenhum kitmedico, v· ao Hospital pegar.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid,plid) > 10){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ est· muito longe, chegue mais perto!");
			    return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode fazer tratamento em si mesmo.");
			    return 1;
			}
			if(GetPlayerMoney(plid) < 600){
			    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o possue dinheiro para pagar o tratamento, Custo: $600");
			    SendClientMessage(plid, COLOR_RED, "… necess·rio que vocÍ arranje dinheiro para o tratamento");
				return 1;
			}
			if(JogadorDoente[plid] == 0){
				SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o apresenta nenhum sintoma.");
			    return 1;
			}
			if(Curando[playerid] == 1){
				SendClientMessage(playerid, COLOR_RED, "N„o pode curar v·rias vezes ao mesmo tempo.");
			    return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_WHITE, "O tratamento est· sendo realizado. Aguarde.");
			    SendClientMessage(plid, COLOR_WHITE, "VocÍ est· sendo tratado. AGUARDE.");
				Curando[playerid] = 1;
				SetTimerEx("TomandoRemedio1",5000,0,"dd",plid,playerid);
				return 1;
			}
		} else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È ParamÈdico!");
		    return 1;
		}
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
			    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado");
				return 1;
			}
			if(GetPlayerMoney(plid) < 200){
			    SendClientMessage(playerid, COLOR_RED, "O jogador n„o possue dinheiro para pagar o tratamento");
				return 1;
			}
			if(kitmedico[playerid] <= 0){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem nenhum kitmedico, v· ao Hospital pegar.");
				return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 10){
			        if(plid != playerid){
				    	SendClientMessage(playerid, COLOR_PARAMEDICO, "VocÍ fez o tratamento no paciente!");
				    	SendClientMessage(plid, COLOR_WHITE, "Um ParamÈdico fez o tratamento necess·rio em vocÍ!");
				    	AddPlayerHealth(plid,100);
				    	GivePlayerMoney(plid,-200);
				    	GivePlayerMoney(playerid,200);
				    	AcrescentarExPoints(playerid,1);
				    	kitmedico[playerid] = kitmedico[playerid] -1;
						return 1;
					} else {
				    	SendClientMessage(playerid,COLOR_RED,"VocÍ n„o pode fazer o tratamento em si mesmo.");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"N„o È possivel fazer o tratamento, t„o longe assim do paciente!");
					return 1;
				}
			}
		} else {
	    	SendClientMessage(playerid,COLOR_RED,"Apenas paramÈdicos podem fazer isso!");
			return 1;
		}
	}
	
    if(strcmp(cmd, "/pegarkit", true) == 0) {
		if(Profissao[playerid] == PARAMEDICO || IsPlayerAdmin(playerid)){
			if(AreaHosp[playerid] == 1){
	   			if(kitmedico[playerid] == 0){
					kitmedico[playerid] = kitmedico[playerid] + 3;
					SendClientMessage(playerid, COLOR_PARAMEDICO, "VocÍ pegou um kit mÈdico. V·lido para 3 curativos/tratamentos.");
				    return 1;
				} else {
					SendClientMessage(playerid, COLOR_PARAMEDICO, "VocÍ j· possue um kit mÈdico.");
				    return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o est· no hospital.");
			 	return 1;
			}
	 	} else {
			SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o tem permiss„o.");
			return 1;
		}
   	}

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
			if(Contrabando[playerid] == 1 || ContrabandoCar[playerid] == 1) {
				SendClientMessage(playerid, COLOR_GRAD1, "VocÍ j· est· na miss„o.");
				return 1;
			}
			new contr = random(4);
			if(contr == 0){
				StatusCheck[playerid] = NONEE;
				RingTone[playerid] = 20;
				SetPlayerCheckpoint(playerid,-2328.99,1527.79,0.25,4.0);
				SendClientMessage(playerid, COLOR_PALHA, "Contrabando!!");
				Contrabando[playerid] = 1;
				Receita[playerid] = 1;
				SendClientMessage(playerid, COLOR_CONTRABANDISTA, "Prossiga para o navio.");
				CheckpointStatus[playerid] = CONTRABANDOINI;
	  			SetTimer("ContrabandoNavio",360000,false);
		        return 1;
		    }
		    if(contr == 1){
				StatusCheck[playerid] = NONEE;
				RingTone[playerid] = 20;
			    SendClientMessage(playerid, COLOR_PALHA, "Contrabando de Carros.");
				SendClientMessage(playerid, COLOR_CONTRABANDISTA, "V· pegar o Carro no local indicado.");
				SetPlayerCheckpoint(playerid,2213.1704,-1000.9013,63.8633,3.0);
				ContrabandoCar[playerid] = 1;
				CheckpointStatus[playerid] = CONTRABANDOCAR1;
				SetTimer("ContrabandoNavio",360000,false);
				return 1;
			}
			if(contr == 2){
				StatusCheck[playerid] = NONEE;
				RingTone[playerid] = 20;
				SendClientMessage(playerid, COLOR_PALHA, "Contrabando de Armas.");
				SendClientMessage(playerid, COLOR_CONTRABANDISTA, "V· falar com o negociante para ele lhe indicar onde est„o as armas escondidas.");
				Contrabando[playerid] = 1;
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,1854.1887,-1914.7314,15.2568,3.0);
				CheckpointStatus[playerid] = CONTRABANDOARMA1;
				SetTimer("ContrabandoNavio",360000,false);
				return 1;
			}
			if(contr == 3){
			    StatusCheck[playerid] = NONEE;
				RingTone[playerid] = 20;
				SendClientMessage(playerid, COLOR_PALHA, "Contrabando de Drogas.");
				SendClientMessage(playerid, COLOR_CONTRABANDISTA, "V· pegar as drogas com o traficante.");
				Contrabando[playerid] = 1;
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,2145.0332,-978.2762,60.9297,3.0);
				CheckpointStatus[playerid] = CONTRABANDODROGA;
				SetTimer("ContrabandoNavio",360000,false);
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Contrabandista!");
		    return 1;
		}
	}
   	if(strcmp(cmd, "/cancelarcontrabando", true) == 0) {
   		if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
			if(Contrabando[playerid] == 1 || ContrabandoCar[playerid] == 1) {
				Contrabando[playerid] = 0;
				ContrabandoCar[playerid] = 0;
				Receita[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
				CheckpointStatus[playerid] = NONE;
				SendClientMessage(playerid, COLOR_GREEN, "Contrabando cancelado.");
				SetTimer("ContrabandoNavio",360000,false);
				return 1;
			} else {
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· contrabandeado.");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È contrabandista.");
			return 1;
		}
	}
   	if(strcmp(cmd, "/pararentrega", true) == 0) {
   		if(Profissao[playerid] == ENTREGADOR_PIZZA|| IsPlayerAdmin(playerid)){
			if(EntregadePizza[playerid] == 1) {
			    EntregadePizza[playerid]=0;
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "Entrega de pizzas cancelada!");
				SetTimerEx("TerminarCarregamento",200,0,"d",playerid);
				return 1;
			} else {
				SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· entregando pizzas!");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Entregador de Pizza!");
			return 1;
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
				dini_IntSet(PlayerName(plid),"Preso", 1);
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
	if(strcmp(cmdtext, "/limparchat", true)==0) {
		if(IsPlayerAdmin(playerid)){
			for(new l=0;l<40;l++){
			    SendClientMessageToAll(COLOR_WHITE, " ");
			}
			return 1;
		}
		else{
		    return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Unknown command.");
		}
	}
	if(strcmp(cmd, "/comprarkit", true) == 0) {
       	if(GetPlayerMoney(playerid) < 2500){
	        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar. CUSTO: $2500");
			return 1;
		}
        if(AreaCustomizacao[playerid] == 0){
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· na loja de customizaÁ„o!");
            return 1;
		}
		if(IsPlayerInAnyVehicle(playerid)){
	        if(!strcmp(Dono[GetPlayerVehicleID(playerid)],PlayerName(playerid),true)){
				new tmp[256];
				new vehid = GetPlayerVehicleID(playerid);
				format(tmp,sizeof(tmp),"%d.vinfo",vehid);
				dini_Set(tmp,"Alarme", "0");
				GivePlayerMoney(playerid,-2500);
				AcrescentarLucro(9,2500);
				SendClientMessage(playerid, COLOR_WHITE, "Kit de travas e alarmes comprado, para instalar digite /meucarro.");
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode comprar um KIT para um carro que n„o È seu.");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
			return 1;
		}
    }
    if(strcmp(cmd, "/destrancarveiculoauto", true) == 0) {
        if(Profissao[playerid] == INSTRUTOR || IsPlayerAdmin(playerid)){
			if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != CarroAuto && GetPlayerVehicleID(playerid) != CarroAuto2 && GetPlayerVehicleID(playerid) != CarroAuto3 && GetPlayerVehicleID(playerid) != CarroAuto4 && GetPlayerVehicleID(playerid) != CarroAuto5 && GetPlayerVehicleID(playerid) != CarroAuto6){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo da auto escola!");
                return 1;
			}
			else{
	    		SendClientMessage(playerid, COLOR_WHITE, "Destrancado...");
			   	for(new i=0; i<MAX_PLAYERS; i++){
		    		SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Instrutor de direÁ„o!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/trancarveiculoauto", true) == 0) {
        if(Profissao[playerid] == INSTRUTOR || IsPlayerAdmin(playerid)){
            if(!IsPlayerInAnyVehicle(playerid)){
                SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
                return 1;
			}
			if(GetPlayerVehicleID(playerid) != CarroAuto && GetPlayerVehicleID(playerid) != CarroAuto2 && GetPlayerVehicleID(playerid) != CarroAuto3 && GetPlayerVehicleID(playerid) != CarroAuto4 && GetPlayerVehicleID(playerid) != CarroAuto5 && GetPlayerVehicleID(playerid) != CarroAuto6){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo da auto escola!");
                return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_WHITE, "Trancado...");
			    for(new i=0; i<MAX_PLAYERS; i++){
			        if(i != playerid){
						if(Profissao[i] != INSTRUTOR && !IsPlayerAdmin(i)){
		    				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
						}
					}
				}
				return 1;
		    }
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o È Instrutor de direÁ„o!");
		    return 1;
		}
	}
 	if(strcmp(cmd, "/meucarro", true) == 0) {
	    if(IsPlayerInAnyVehicle(playerid)){
			if(!strcmp(Dono[GetPlayerVehicleID(playerid)],PlayerName(playerid),true)){
				new tmp[256];
				new vehid = GetPlayerVehicleID(playerid);
				format(tmp,sizeof(tmp),"%d.vinfo",vehid);
				if(dini_Isset(tmp,"Alarme")){
				    TogglePlayerControllable(playerid,0);
					SendClientMessage(playerid, COLOR_WHITE, "Escolha o Alarme:");
					ShowMenuForPlayer(Alarme,playerid);
					return 1;
				} else {
					SendClientMessage(playerid,COLOR_RED,"Esse carro n„o tem KIT.");
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o È o dono desse carro!");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um veÌculo!");
			return 1;
		}
	}
	if(strcmp(cmd, "/skintrabalho", true) == 0) {
	    if(PLAYERLIST_authed[playerid] == 1){
	    	SetPlayerSkin(playerid,ProfSkin[Profissao[playerid]]);
	    	return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "VocÍ tem que estar logado!");
		    return 1;
		}
	}
    if(strcmp(cmd, "/meuskin", true) == 0) {
    	new tmp[256];
		new skin;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/meuskin [id/da/skin]");
			return 1;
		}
    	skin = strval(tmp);
		if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==273 || skin==274 || skin==289 || skin>=300){
			SendClientMessage(playerid, COLOR_RED, "ID de skin inv·lido!");
			return 1;
		}
       	if(IsPlayerConnected(playerid)){
            dini_IntSet(PlayerName(playerid),"Skin", skin);
		    SetPlayerSkin(playerid,skin);
            SendClientMessage(playerid, COLOR_GREEN, "Nova skin colocada!");
            return 1;
    	} else {
			SendClientMessage(playerid, COLOR_RED, "Jogador n„o conectado/logado.");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/comprarveiculo", true)==0){
		new string[256];
        if(!IsPlayerInAnyVehicle(playerid)){
            SendClientMessage(playerid, COLOR_RED, "VocÍ n„o est· em um veÌculo!");
            return 1;
		}
		if(GetPlayerVehicleID(playerid) != carvenda1 && GetPlayerVehicleID(playerid) != carvenda2 && GetPlayerVehicleID(playerid) != carvenda3 && GetPlayerVehicleID(playerid) != carvenda4 && GetPlayerVehicleID(playerid) != carvenda5){
			SendClientMessage(playerid, COLOR_RED, "Esse veÌculo n„o est· ‡ venda!");
			return 1;
		}
		if(GetPlayerMoney(playerid) < CarValor[GetVehicleModel(GetPlayerVehicleID(playerid))-400]){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro!");
		    format(string,sizeof(string),"Esse veÌculo custa: $%d",CarValor[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
			SendClientMessage(playerid, COLOR_RED, string);
			return 1;
		}
		else{
		    GivePlayerMoney(playerid,-CarValor[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
		    new Float:X,Float:Y,Float:Z,Float:ang;
		    X = 921.4177;
			Y = -1676.0192;
			Y = -1676.0192;
			Z = 13.0996;
			ang = 0.9614;
			new cor1,cor2;
			cor1 = random(126);
			cor2 = random(126);
			format(string,sizeof(string),"VocÍ comprou esse veÌculo no valor de $%d",CarValor[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			SendClientMessage(playerid, COLOR_WHITE, "Seu carro est· na frente da concecion·ria, v· busca-lo.");
			RemovePlayerFromVehicle(playerid);
			TogglePlayerControllable(playerid,1);
			new File:temp;
			format(string, sizeof(string), "%d %f %f %f %f %d %d //comprado na concecionaria por: %s, em: %s\r\n", GetVehicleModel(GetPlayerVehicleID(playerid)),X,Y,Z,ang,cor1,cor2,PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
			temp = fopen("carrosrpg.rpg", io_append);
   			fwrite(temp, string);
            fclose(temp);
           	LastCar++;
		    SetTimerEx("SetCar",50,0,"dffffddd",GetVehicleModel(GetPlayerVehicleID(playerid)),X,Y,Z,ang,cor1,cor2,playerid);
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
				    SendClientMessage(playerid,COLOR_RED,"Jogador n„o conectado/logado");
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
	if(strcmp(cmd, "/locarminhacasa", true) == 0) {
	    new tmp[256];
	    new dias;
	    tmp = strtok(cmdtext,idx);
	    dias = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, COLOR_RED, "USO: /locarminhacasa [dias]");
	        return 1;
		}
	    if(dini_Int(PlayerName(playerid),"Casa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue nenhuma casa!");
		    return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_GREEN, "Sua casa agora poder· ser alugada!");
			new str[256];
			format(str,sizeof(str),"%s colocou sua casa para aluguel por %d dias",PlayerName(playerid),dias);
			SendClientMessageToAll(COLOR_WHITE, str);
			dini_IntSet(PlayerName(playerid),"LocandoCasa",1);
			dini_IntSet(PlayerName(playerid),"DiasAluguel",dias);
			return 1;
		}
	}
	if(strcmp(cmd, "/cancelaraluguelcasa", true) == 0) {
	    if(dini_Int(PlayerName(playerid),"Casa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue nenhuma casa!");
		    return 1;
		}
		if(dini_Int(PlayerName(playerid),"LocandoCasa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o colocou nenhuma casa em aluguel!");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"%s tirou sua casa de aluguel",PlayerName(playerid));
		    SendClientMessageToAll(COLOR_WHITE, string);
		    dini_IntSet(PlayerName(playerid),"LocandoCasa",0);
			dini_IntSet(PlayerName(playerid),"DiasAluguel",0);
			return 1;
		}
	}
	if(strcmp(cmd, "/alugarcasa", true) == 0) {
	    new tmp[256];
	    new plid;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "USO: /alugarcasa [id]");
		    return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "O jogador n„o est· conectado/logado");
		    return 1;
		}
		if(dini_Int(PlayerName(plid),"LocandoCasa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· locando nenhuma casa!");
		    return 1;
		}
		else{
		    dini_Set(PlayerName(playerid),"DonoCasaAlugada",PlayerName(plid));
		    dini_IntSet(PlayerName(playerid),"LocouCasa",1);
		    dini_IntSet(PlayerName(playerid),"DiasDeAluguel",dini_Int(PlayerName(plid),"DiasAluguel"));
		    dini_IntSet(PlayerName(plid),"DiasAluguel",0);
		    dini_IntSet(PlayerName(plid),"LocandoCasa",0);
		    SendClientMessage(playerid, COLOR_GREEN, "Casa alugada!");
		    new string[256];
		    format(string,sizeof(string), "%s alugou sua casa!",PlayerName(playerid));
			SendClientMessage(plid, COLOR_WHITE, string);
			return 1;
		}
	}
	if(strcmp(cmd, "/venderminhacasa", true) == 0) {
		if(dini_Int(PlayerName(playerid),"Casa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue nenhuma casa!");
		    return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_GREEN, "Sua casa foi colocada ‡ venda! ");
		    SendClientMessage(playerid, COLOR_GREEN, "A corretora Virtual's'House vai tentar vende-la.");
			new str[256];
			format(str,sizeof(str),"A casa de %s foi colocada ‡ venda no valor de $%d",PlayerName(playerid),dini_Int(PlayerName(playerid),"ValorCasa"));
			SendClientMessageToAll(COLOR_CORRETOR, str);
			dini_IntSet(PlayerName(playerid),"VendendoCasa",1);
			new randresult = random(19)+1;
			TimerVenda[playerid] = SetTimerEx("SellHouse",60000*randresult,false,"d",playerid);
			return 1;
		}
	}
	if(strcmp(cmd, "/cancelarvendacasa", true) == 0) {
	    if(dini_Int(PlayerName(playerid),"Casa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue nenhuma casa!");
		    return 1;
		}
		if(dini_Int(PlayerName(playerid),"VendendoCasa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o colocou nenhuma casa ‡ venda!");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"%s tirou sua casa de venda",PlayerName(playerid));
		    SendClientMessageToAll(COLOR_CORRETOR, string);
		    dini_IntSet(PlayerName(playerid),"VendendoCasa",0);
		    KillTimer(TimerVenda[playerid]);
			return 1;
		}
	}
	if(strcmp(cmd, "/cancelarvenda", true) == 0) {
	    if(dini_Int(PlayerName(playerid),"VendendoCasa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "vocÍ n„o est· vendendo nenhuma casa!");
		    return 1;
		}
		else{
		    KillTimer(TimerVenda[playerid]);
		    dini_IntSet(PlayerName(playerid),"VendendoCasa",0);
			new str[256];
			format(str,sizeof(str),"%s cancelou a venda de seu imÛvel.",PlayerName(playerid));
			SendClientMessageToAll(COLOR_CORRETOR, str);
			return 1;
		}
	}
	if(strcmp(cmd, "/comprarcasa",true) == 0){
		new tmp[256];
		new plid;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "USO: /comprarcasa [id]");
		    return 1;
		}
		if(dini_Int(PlayerName(plid),"Casa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ est· tentando comprar uma casa que nem existe!");
			return 1;
		}
		if(dini_Int(PlayerName(plid),"VendendoCasa") == 0){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador n„o est· vendendo nenhuma casa!");
		    return 1;
		}
		if(GetPlayerMoney(playerid) < dini_Int(PlayerName(plid),"ValorCasa")){
		    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro para comprar a casa!");
		    return 1;
		}
		else{
		    KillTimer(TimerVenda[plid]);
		    if(dini_Int(PlayerName(playerid),"Casa") == 1) VenderCasa(playerid);
		   	GivePlayerMoney(playerid,-dini_Int(PlayerName(plid),"ValorCasa"));
		    new str[256];
		    format(str,sizeof(str),"O jogador %s comprou sua casa!",PlayerName(playerid));
		    SendClientMessage(plid, COLOR_WHITE, str);
		    SendClientMessage(playerid, COLOR_GREEN, "Casa comprada! Agora vocÍ tem um novo lar.");
            format(str,sizeof(str),"%s comprou o imÛvel de %s no valor de $%d",PlayerName(playerid),PlayerName(plid),dini_Int(PlayerName(plid),"ValorCasa"));
		    SendClientMessageToAll(COLOR_CORRETOR, str);
		    dini_IntSet(PlayerName(playerid),"ValorCasa",dini_Int(PlayerName(plid),"ValorCasa"));
		    dini_IntSet(PlayerName(playerid),"Casa",1);
			new Float:X = dini_Float(PlayerName(plid),"SpawnPosX");
			new Float:Y = dini_Float(PlayerName(plid),"SpawnPosY");
			new Float:Z = dini_Float(PlayerName(plid),"SpawnPosZ");
			new Float:ang = dini_Float(PlayerName(plid),"SpawnPosAng");
			new pickupcasa = CreatePickup(1272,1,X,Y,Z);
		    format(str,sizeof(str),"%d.pickup",pickupcasa);
			dini_Create(str);
			dini_FloatSet(str,"X",X);
			dini_FloatSet(str,"Y",Y);
			dini_FloatSet(str,"Z",Z);
			dini_Set(str,"PickupDono",PlayerName(playerid));
			dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
			dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
			dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
			dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
			VenderCasa(plid);
		    return 1;
		}
	}
    if(strcmp(cmd, "/aceitar", true) == 0) {
        new tmp[256];
		tmp = strtok(cmdtext, idx);
		switch (invitestatus[playerid]){
			case INVITE_NONE :
			{
				SendClientMessage(playerid, COLOR_RED, "Nenhuma proposta foi oferecida ‡ vocÍ");
				return 1;
			}
			case INVITE_FIANCA :
			{
				GivePlayerMoney(playerid, 0 - dinheirofianca[playerid]);
				GivePlayerMoney(envconvite[playerid],dinheirofianca[playerid]);
				SendClientMessage(playerid, COLOR_ADVOGADO, "Proposta aceita");
				SendClientMessage(envconvite[playerid], COLOR_ADVOGADO, "Sua proposta foi aceita");
				invitestatus[playerid] = INVITE_NONE;
				Presos[playerid] = 0;
			    SetSpawnInfo(playerid,0,dini_Int(PlayerName(playerid),"Skin"),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
			    SpawnPlayer(playerid);
			    AcrescentarExPoints(envconvite[playerid],1);
			    return 1;
			}
			case INVITE_CASA :
			{
			    if(dini_Int(PlayerName(playerid),"Casa") == 1) VenderCasa(playerid);
		        new File:temp;
		        new string[256];
				dini_FloatSet(PlayerName(playerid),"SpawnPosX", iX[playerid]);
				dini_FloatSet(PlayerName(playerid),"SpawnPosY", iY[playerid]);
				dini_FloatSet(PlayerName(playerid),"SpawnPosZ", iZ[playerid]);
			    dini_FloatSet(PlayerName(playerid),"SpawnPosAng", iang[playerid]);
			    GivePlayerMoney(playerid,-ivalorcasa[playerid]);
			    GivePlayerMoney(envconvite[playerid],ivalorcasa[playerid]/10);
			    dini_IntSet(PlayerName(playerid),"ValorCasa",ivalorcasa[playerid]);
			    dini_IntSet(PlayerName(playerid),"Casa",1);
			    SendClientMessage(envconvite[playerid], COLOR_GREEN, "O jogador aceitou a casa e vocÍ recebeu 10 por cento do valor.");
			    if(playerid != envconvite[playerid]) AcrescentarExPoints(envconvite[playerid],1);
			    new pickupcasa = CreatePickup(1272,1,iX[playerid],iY[playerid],iZ[playerid]);
			    new str[256];
			    format(str,sizeof(str),"%d.pickup",pickupcasa);
				dini_Create(str);
				dini_FloatSet(str,"X",iX[playerid]);
				dini_FloatSet(str,"Y",iY[playerid]);
				dini_FloatSet(str,"Z",iZ[playerid]);
				dini_Set(str,"PickupDono",PlayerName(playerid));
			    format(string, sizeof(string), "%s te setou uma casa, digite /venderminhacasa para vende-la e ganhar um reembolso.", PlayerName(envconvite[playerid]));
			    SendClientMessage(playerid, COLOR_GREEN, string);
				format(string, sizeof(string), "%f %f %f // %s | vendedor=%s \r\n", iX[playerid], iY[playerid], iZ[playerid], PlayerName(playerid), PlayerName(envconvite[playerid]));
				temp = fopen("virtualliferpg.casas", io_append);
    			fwrite(temp, string);
       			fclose(temp);
				invitestatus[playerid] = INVITE_NONE;
				return 1;
			}
			case INVITE_CARRO :
			{
			    new string[256];
              	format(string, sizeof(string), "VocÍ vendeu um veÌculo [ Nome: %s ] para %s, dentro de 10 segundos o carro aparecer·.",CarName[icarid[playerid]-400], PlayerName(playerid));
               	SendClientMessage(envconvite[playerid], COLOR_COP_SWAT, string);
               	format(string, sizeof(string), "%s te vendeu um veÌculo [ Nome: %s ].", PlayerName(envconvite[playerid]),CarName[icarid[playerid]-400]);
				SendClientMessage(playerid, COLOR_GREEN, string);
				if(playerid != envconvite[playerid]) AcrescentarExPoints(envconvite[playerid],1);
   	            new File:temp;
				format(string, sizeof(string), "%d %f %f %f %f %d %d //Setado por: %s, em: %s\r\n", icarid[playerid], iX[playerid], iY[playerid], iZ[playerid], iang[playerid], icor1[playerid],icor2[playerid], PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
				temp = fopen("carrosrpg.rpg", io_append);
	   	        fwrite(temp, string);
        	    fclose(temp);
               	LastCar++;
				SetTimerEx("SetCar",10000,0,"dffffddd",icarid[playerid],iX[playerid],iY[playerid],iZ[playerid],iang[playerid],icor1[playerid],icor2[playerid],playerid);
				printf("O jogador %s setou um veiculo (id: %d) para %s.", PlayerName(envconvite[playerid]),icarid[playerid],PlayerName(playerid));
                invitestatus[playerid] = INVITE_NONE;
				return 1;
			}
			case INVITE_CONTRATO :
	    	{
				new str[256];
				format(str,sizeof(str),"%s.prop",NomesPropriedades[PropriedadeContrato[playerid]]);
				if(IsStringAName(dini_Get(str,"Dono"))){
					new playa = GetPlayerID(dini_Get(str,"Dono"));
					new string[256];
					format(string,sizeof(string),"%s agora trabalha para a sua propriedade!",PlayerName(playerid));
					SendClientMessage(playa, COLOR_GREEN, string);
				}
				ContratarJogador(playerid,PropriedadeContrato[playerid]);
				SendClientMessage(playerid, COLOR_GREEN, "ParabÈns, agora vocÍ tem que trabalhar muito bem para conseguir um aumento!");
				invitestatus[playerid] = INVITE_NONE;
				PropriedadeContrato[playerid] = -1;
				return 1;
	   		}
	   		case INVITE_CONTRATO_SEGURANCA :
	   		{
	   		    if(!IsPlayerConnected(Scontratador[playerid])){
	   		        SendClientMessage(playerid, COLOR_RED, "O jogador se desconectou do servidor...");
	   		        return 1;
				}
				new str[256];
				SendClientMessage(Scontratador[playerid], COLOR_GREEN, "O contrato foi aceito!");
				SendClientMessage(playerid, COLOR_GREEN, "Agora vocÍ tem um novo chefe!");
				new QtSegurancas;
				new JaContratado;
				QtSegurancas = dini_Int(PlayerName(Scontratador[playerid]),"NSegurancas");
				for(new i=0; i<QtSegurancas; i++){
					format(str,sizeof(str),"Seguranca_%d",i);
					if(strcmp(dini_Get(PlayerName(Scontratador[playerid]),str),"NONE",true) == 0){
					    if(JaContratado == 0){
					        dini_IntSet(PlayerName(playerid),"JaContratado",1);
					    	dini_Set(PlayerName(Scontratador[playerid]),str,PlayerName(playerid));
					    	format(str,sizeof(str),"Seguranca_%d_Valor",i);
					    	dini_IntSet(PlayerName(Scontratador[playerid]),str,Svaloroferecido[playerid]);
					    	JaContratado = 1;
						}
					}
				}
				if(JaContratado == 0){
					format(str,sizeof(str),"Seguranca_%d",QtSegurancas+1);
					dini_Set(PlayerName(Scontratador[playerid]),str,PlayerName(playerid));
					format(str,sizeof(str),"Seguranca_%d_Valor",QtSegurancas+1);
    				dini_IntSet(PlayerName(Scontratador[playerid]),str,Svaloroferecido[playerid]);
			    	JaContratado = 1;
				}
				return 1;
			}
   		}
	}
    if(strcmp(cmd, "/recusar", true) == 0) {
	    new tmp[256];
	    tmp = strtok(cmdtext, idx);
	    switch (invitestatus[playerid]){
			case INVITE_NONE :
			{
				SendClientMessage(playerid, COLOR_RED, "Nenhuma proposta foi oferecida ‡ vocÍ");
                return 1;
			}
			case INVITE_FIANCA :
			{
				SendClientMessage(playerid, COLOR_ADVOGADO, "Proposta de fianÁa recusada, vocÍ vai ficar por aqui mesmo!");
				SendClientMessage(envconvite[playerid], COLOR_ADVOGADO, "A proposta foi recusada!");
				invitestatus[playerid] = INVITE_NONE;
				return 1;
			}
			case INVITE_CASA :
			{
				SendClientMessage(playerid, COLOR_ADVOGADO, "Casa recusada");
				SendClientMessage(envconvite[playerid], COLOR_ADVOGADO, "Essa casa foi recusada. Talvez outra sirva para esse jogador!");
				invitestatus[playerid] = INVITE_NONE;
				return 1;
			}
			case INVITE_CARRO :
			{
				SendClientMessage(playerid, COLOR_ADVOGADO, "Carro recusado");
				SendClientMessage(envconvite[playerid], COLOR_ADVOGADO, "Seu carro foi recusado. Talvez o jogador queira outro modelo");
				invitestatus[playerid] = INVITE_NONE;
				return 1;
			}
			case INVITE_CONTRATO :
       		{
				new str[256];
				format(str,sizeof(str),"%s.prop",NomesPropriedades[PropriedadeContrato[playerid]]);
				if(IsStringAName(dini_Get(str,"Dono"))){
					new playa = GetPlayerID(dini_Get(str,"Dono"));
					new string[256];
					format(string,sizeof(string),"%s recusou o contrato!",PlayerName(playerid));
					SendClientMessage(playa, COLOR_RED, string);
				}
				SendClientMessage(playerid, COLOR_GREEN, "Contrato recusado!");
				invitestatus[playerid] = INVITE_NONE;
				PropriedadeContrato[playerid] = -1;
				return 1;
	  		}
	  		case INVITE_CONTRATO_SEGURANCA :
	  		{
	  		    SendClientMessage(Scontratador[playerid], COLOR_RED, "O contrato foi recusado!");
				SendClientMessage(playerid, COLOR_GREEN, "Contrato recusado!");
				return 1;
			}
		}
	}

	if(strcmp(cmd, "/setcar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, plid, cor1, cor2;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED2, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		    carid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED2, "/setcar [id_do_veÌculo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED2, "/setcar [id_do_veÌculo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			cor1 = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED2, "/setcar [id_do_veÌculo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			cor2 = strval(tmp);
			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        if(IsPlayerConnected(plid)){
				        new Float:X,Float:Y,Float:Z,Float:ang;
				       	SendClientMessage(playerid, COLOR_GREEN, "Foi enviado ao outro jogador um convite para ver se ele aceita o carro.");
				       	GetVehiclePos(GetPlayerVehicleID(playerid),X,Y,Z);
				       	GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
				       	envconvite[plid] = playerid;
				       	invitestatus[plid] = INVITE_CARRO;
				       	icarid[plid] = carid;
				       	icor1[plid] = cor1;
				       	icor2[plid] = cor2;
						iX[plid] = X;
						iY[plid] = Y;
						iZ[plid] = Z;
						iang[plid] = ang;
				       	new string[256];
				       	format(string,sizeof(string),"O Vendedor de Carros %s est· lhe oferecendo um(a) %s em %s.",PlayerName(playerid),CarName[icarid[playerid]-400],zones[player_zone[playerid]][zone_name]);
				       	SendClientMessage(plid, COLOR_VENDEDOR_DE_CARROS,string);
				       	SendClientMessage(plid, COLOR_CORRETOR, "Para aceitar Digite /aceitar para recusar Digite /recusar.");
						return 1;
					} else {
					   	SendClientMessage(playerid, COLOR_RED2, "Jogador n„o conectado.");
						return 1;
					}
				} else {
				    SendClientMessage(playerid, COLOR_RED2, "VocÍ precisa estar em um veiculo para vender.");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED2, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		}
		if(Profissao[playerid] != VENDEDOR_DE_CARROS && !IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED2, "VocÍ n„o È Vendedor de Carros e Skins");
			return 1;
		}
	}
	SendClientMessage(playerid,COLOR_RED2,"O Gamemode desconhece esse comando");
	return 1;
}



public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    KillTimer(TimerCobranca[playerid]);
	if(DesarmandoAsDrogas[playerid] == 1){
		DesarmandoAsDrogas[playerid] = 0;
		KillTimer(TempoDesarme[playerid]);
		SendClientMessage(playerid, COLOR_RED, "O desarme foi cancelado pois vocÍ saiu do veÌculo!");
		return 1;
	}
	if(PlantandoDrogas[playerid] == 1){
		PlantandoDrogas[playerid] = 0;
		KillTimer(TempoPlantacao[playerid]);
		TogglePlayerControllable(playerid,1);
		SendClientMessage(playerid, COLOR_RED, "Sua plantaÁ„o de drogas foi cancelada pois vocÍ saiu do veÌculo!");
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
				TogglePlayerControllable(i,0);
				Sequestro[i] = 0;
				Cativeiro[i] = 1;
				SendClientMessage(i, COLOR_RED,"VocÍ Foi SEQUESTRADO!");
				SendClientMessage(i, COLOR_RED,"Para Poder sair pague o resgate com o Comando /resgate!");
			}
		}
	}
} 
public Radar(){
	new exesso, desconto, velocidade;
    new string[256];
	for (new i=0, Float:X, Float:Y, Float:Z; i < MAX_PLAYERS; i++){
	    GetPlayerPos(i, X, Y, Z);
	    if((X >= 1952.4786 && X <= 1967.2168 && Y >= -1937.4336 && Y <= -1926.1168 && Z >= 10.0000 && Z <= 20.000) || (X >= 2021.4937 && X <= 2030.3973 && Y >= -2171.7832 && Y <= -2161.9014 && Z >= 10.0000 && Z <= 20.000)
		|| (X >= 1916.8148 && X <= 1929.6781 && Y >= -1757.1136 && Y <= -1747.4180 && Z >= 10.0000 && Z <= 20.000) || (X >= 2351.7727 && X <= 2361.2385 && Y >= -1737.6139 && Y <= -1727.9680 && Z >= 10.0000 && Z <= 20.000)
		|| (X >= 2281.1777 && X <= 2292.9626 && Y >= -1154.5660 && Y <= -1144.9240 && Z >= 20.0000 && Z <= 30.000) || (X >= 2870.8555 && X <= 2931.6975 && Y >= -1479.0033 && Y <= -1445.4790 && Z >= 5.0000 && Z <= 20.000)
		|| (X >= 1509.3618 && X <= 1502.6920 && Y >= -1727.6062 && Y <= -1737.0968 && Z >= 8.0000 && Z <= 20.000) || (X >= 1097.0355 && X <= 1107.5239 && Y >= -1410.4645 && Y <= -1391.1556 && Z >= 5.0000 && Z <= 20.000)
		|| (X >= 1178.4174 && X <= 1188.1575 && Y >= -1285.6506 && Y <= -1275.9550 && Z >= 8.0000 && Z <= 20.000) || (X >= 1105.4432 && X <= 1117.0774 && Y >= -1153.6390 && Y <= -1136.2310 && Z >= 15.0000 && Z <= 30.000)
		|| (X >= 1214.8883 && X <= 1227.3815 && Y >= -948.5304 && Y <= -927.7966 && Z >= 35.0000 &&  Z <= 50.000)){
        	velocidade = Velocidade[i];
      	    exesso = velocidade - 100;
 			desconto = exesso*3;
		    if(velocidade > 120 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
		        if(ZeraMulta[i] == 0){
	        		format(string, sizeof(string), "VocÍ passou no radar ‡ %d Kph, e levou uma multa de $%d por estar acima da velocidade permitida!", velocidade, desconto);
					SendClientMessage(i, COLOR_RED, string);
					SendClientMessage(i, COLOR_RED, "Para paga-la v· atÈ a Delegacia!");
					dini_IntSet(PlayerName(i),"Multa", dini_Int(PlayerName(i),"Multa") + desconto);
					ZeraMulta[i] = 1;
					PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
					SetTimerEx("CancelarMulta",5000,0,"d",i);
				}
			}
  			if(velocidade <= 120 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
			    if(ZeraMulta[i] == 0){
			        PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "VocÍ passou no radar ‡ %d Kph.", velocidade);
					SendClientMessage(i, COLOR_GREEN, string);
					ZeraMulta[i] = 1;
					SetTimerEx("CancelarMulta",5000,0,"d",i);
				}
			}
		}
  	}
}
public CancelarMulta(){
    for(new i=0; i<MAX_PLAYERS; i++){
        ZeraMulta[i] = 0;
	}
}
public SetCar(modelid,Float:X,Float:Y,Float:Z,Float:ang,Cor1,Cor2,e)
{
	new resid,tmp[256],own[256];
	resid = CreateVehicle(modelid,X,Y,Z,ang,Cor1,Cor2,600000);
	set(own,PlayerName(e));
	set(Dono[resid],own);
    format(tmp,256,"%d.vinfo",resid);
    dini_Create(tmp);
    dini_Set(tmp,"dono",own);
	new strplaca[256];
	format(strplaca,sizeof(strplaca),"RVL %d",resid);
	dini_Set(tmp,"Placa",strplaca);
	switch(modelid){
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

stock OnPlayerEnterVehicleAsPassenger(playerid,vehicleid)
{
	if(GetVehicleModel(vehicleid) == 431)
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
				    SendClientMessage(playerid,COLOR_GREEN,"Passagem paga. $10");
				    GivePlayerMoney(playerid,-10);
				    GivePlayerMoney(i,10);
				    SendClientMessage(i,COLOR_GREEN,"VocÍ recebeu 10 dÛlares pela passagem do novo passageiro.");
				    AcrescentarExPoints(i,1);
					TimerCobranca[playerid] = SetTimerEx("Cobrando",30000,1,"d",playerid);
				    return 1;
				}
			}
		}
	}
	return 1;
}
public Cobrando(playerid)
{
	 if(IsPlayerInAnyVehicle(playerid)){
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 431){
            for(new i; i<MAX_PLAYERS; i++)
	        {
       	   		if(IsPlayerInVehicle(i,GetPlayerVehicleID(playerid)) && GetPlayerState(i)== PLAYER_STATE_DRIVER)
	        	{
	        	if(GetPlayerMoney(playerid) >= 10)
				{
	        	if(i != INVALID_PLAYER_ID)
				{
          	 	SendClientMessage(playerid,COLOR_GREEN,"Passou-se mais 1 minuto e vocÍ pagou $10.");
 	       		GivePlayerMoney(playerid,-10);
           		GivePlayerMoney(i,10);
  	       		SendClientMessage(i,COLOR_GREEN,"Passou-se mais 1 minuto e seu passageiro lhe pagou mais $10.");
				KillTimer(TimerCobranca[playerid]);
				TimerCobranca[playerid] = SetTimerEx("Cobrando",60000,1,"d",playerid);
  		   		}
  		   		else{ KillTimer(TimerCobranca[playerid]); SendClientMessage(playerid, COLOR_GREEN, "Seu Ùnibus n„o possue motorista ent„o vocÍ n„o precisou pagar os $10.");}
  		   		}
  		   		else{ KillTimer(TimerCobranca[playerid]); RemovePlayerFromVehicle(playerid); SendClientMessage(playerid, COLOR_RED, "Sinto muito, vocÍ n„o possue mais dinheiro para pagar o Ùnibus. Ent„o foi retirado dele!"); SendClientMessage(i, COLOR_WHITE, "Seu passageiro foi retirado do Ùnibus pois n„o possue mais dinheiro!");}
  		   		}
		    }
	    }
    }
}

public OnPlayerSelectedMenuRow(playerid, row)
{
    TogglePlayerControllable(playerid,0);
    new string[256];
    if(GetPlayerMenu(playerid) == Cardapio1 && IsValidMenu(Cardapio1)){
        switch(row){
            case 0: ShowMenuForPlayer(Cardapio2,playerid);
            case 1: ShowMenuForPlayer(Cardapio3,playerid);
            case 2: ShowMenuForPlayer(Cardapio4,playerid);
            case 3: TogglePlayerControllable(playerid,1);
		}
	}
	//Comidas(9)
	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == Cardapio2 && IsValidMenu(Cardapio2)){
        switch(row){
            case 0: ServirComida(playerid,0);
            case 1: ServirComida(playerid,1);
            case 2: ServirComida(playerid,2);
            case 3: ServirComida(playerid,3);
            case 4: ServirComida(playerid,4);
            case 5: ServirComida(playerid,5);
            case 6: ServirComida(playerid,6);
            case 7: ServirComida(playerid,7);
            case 8: ServirComida(playerid,8);
		}
	}
	//Bebidas(7)
	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == Cardapio3 && IsValidMenu(Cardapio3)){
        switch(row){
            case 0: ServirBebida(playerid,0);
            case 1: ServirBebida(playerid,1);
            case 2: ServirBebida(playerid,2);
            case 3: ServirBebida(playerid,3);
            case 4: ServirBebida(playerid,4);
            case 5:
			{
			 	ShowMenuForPlayer(Sucos,playerid);
			 	ComLeite[playerid] = 1;
		 	}
            case 6:
			{
			 	ShowMenuForPlayer(Sucos,playerid);
				ComLeite[playerid] = 0;
			}
		}
	}
	//Sobremesas(5)
	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == Cardapio4 && IsValidMenu(Cardapio4)){
        switch(row){
            case 0: ServirSobremesa(playerid,0);
            case 1: ServirSobremesa(playerid,1);
            case 2: ServirSobremesa(playerid,2);
            case 3: ServirSobremesa(playerid,3);
            case 4: ServirSobremesa(playerid,4);
		}
	}
	//Sucos(7)
	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == Sucos && IsValidMenu(Sucos)){
	    switch(row){
            case 0: ServirSuco(playerid,0);
            case 1: ServirSuco(playerid,1);
            case 2: ServirSuco(playerid,2);
            case 3: ServirSuco(playerid,3);
            case 4: ServirSuco(playerid,4);
            case 5: ServirSuco(playerid,5);
            case 6: ServirSuco(playerid,6);
            case 7: ServirSuco(playerid,7);
            case 8: ServirSuco(playerid,8);
		}
	}
	if(GetPlayerMenu(playerid) == BancoOpc && IsValidMenu(BancoOpc)){
	    switch(row){
	        case 0:
			{
	      		SacandoGrana[playerid] = 1;
	            SendClientMessage(playerid, COLOR_AZULPLUS, "Para sacar digite o valor ‡ ser SACADO no CHAT.");
	            return 1;
			}
			case 1:
			{
	           	DepositandoGrana[playerid] = 1;
	           	SendClientMessage(playerid, COLOR_AZULPLUS, "Para depositar digite o valor ‡ ser DEPOSITADO no CHAT.");
	          	return 1;
			}
			case 2:
			{
				format(string, sizeof(string), "|-------- Conta do Jogador: %s --------|", PlayerName(playerid));
				SendClientMessage(playerid, COLOR_RED2, string);
				format(string, sizeof(string), "|-------- Saldo: $%d dÛlares ---------|", dini_Int(PlayerName(playerid),"Banco"));
				SendClientMessage(playerid, COLOR_WHITE, string);
				TogglePlayerControllable(playerid,1);
				return 1;
			}
			case 3:
			{
				if(dini_Int(PlayerName(playerid),"Divida") <= 0){
		   		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dÌvida para pagar!");
                TogglePlayerControllable(playerid,1);
	            return 1;
	   			}
	   			if(GetPlayerMoney(playerid) < dini_Int(PlayerName(playerid),"Divida")){
		   		format(string, sizeof(string),"VocÍ n„o tem dinheiro para pagar! Arrume se n„o quer encrenca! Sua dÌvida: $%d",dini_Int(PlayerName(playerid),"Divida"));
		   		SendClientMessage(playerid, COLOR_RED, string);
                TogglePlayerControllable(playerid,1);
	            return 1;
	   			}
	   			else{
                    TogglePlayerControllable(playerid,1);
		   			GivePlayerMoney(playerid,0-dini_Int(PlayerName(playerid),"Divida"));
		   			format(string, sizeof(string),"VocÍ pagou sua dÌvida de $%d",dini_Int(PlayerName(playerid),"Divida"));
		   			SendClientMessage(playerid, COLOR_WHITE, string);
		   			ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
		   			dini_IntSet(PlayerName(playerid),"Divida",0);
		   			dini_IntSet(PlayerName(playerid),"Emprestimo",0);
		   			KillTimer(TimerDivida[playerid]);
		   			return 1;
				}
			}
			case 4:
			{
				FazendoEmprestimo[playerid] = 1;
				SendClientMessage(playerid, COLOR_AZULPLUS, "Para fazer um emprÈstimo digite o valor ‡ ser EMPRESTADO no CHAT.");
				return 1;
			}
		}
	}
	TogglePlayerControllable(playerid,1);
	if(GetPlayerMenu(playerid) == Bar && IsValidMenu(Bar)) {
	    switch(row){
	        case 0:
			{
			    if(GetPlayerMoney(playerid) < 5){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar o Guaran· Kuat.");
					return 1;
				}
			    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
				Bebida[playerid] = Bebida[playerid]/30;
				format(string, sizeof(string), "VocÍ tomou um delicioso Guaran· Kuat, o teor de ·lcool no seu sangue baixou. Atual: %d Mg", Bebida[playerid]);
			    SendClientMessage(playerid, COLOR_BARMAN, string);
			    GivePlayerMoney(playerid, -5);
			    AddPlayerHealth(playerid, 4);
			    AcrescentarLucro(8,10);
				return 1;
			}
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 8){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar o Suco.");
					return 1;
				}
			    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
				Bebida[playerid] = Bebida[playerid]/50;
				format(string, sizeof(string), "VocÍ tomou um delicioso Suco, o teor de ·lcool no seu sangue baixou. Atual: %d Mg", Bebida[playerid]);
			    SendClientMessage(playerid, COLOR_BARMAN, string);
			    GivePlayerMoney(playerid, -8);
			    AddPlayerHealth(playerid, 6);
			    AcrescentarLucro(8,16);
				return 1;
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 10){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar a Cerveja.");
					return 1;
				}
			    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
			    Bebida[playerid] = Bebida[playerid]+1;
				format(string, sizeof(string), "VocÍ tomou uma Cerveja geladinha, porÈm o nÌvel de ·lcool no seu sangue aumentou. Atual: %d Mg", Bebida[playerid]);
		        SendClientMessage(playerid, COLOR_BARMAN, string);
			    AddPlayerHealth(playerid, 9);
			    GivePlayerMoney(playerid, -10);
			    AcrescentarLucro(8,20);
			    return 1;
			}
			case 3:
			{
			    if(GetPlayerMoney(playerid) < 15){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar a Pinga.");
					return 1;
				}
			    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
			    Bebida[playerid] = Bebida[playerid]+2;
				format(string, sizeof(string), "Ù Pinga BOA! O teor de ·lcool no seu sangue aumentou. Atual: %d Mg", Bebida[playerid]);
		        SendClientMessage(playerid, COLOR_BARMAN, string);
				AddPlayerHealth(playerid, 10);
				GivePlayerMoney(playerid, -15);
				AcrescentarLucro(8,30);
			  	return 1;
			}
			case 4:
			{
			    if(GetPlayerMoney(playerid) < 25){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar o Whisky Black Label.");
					return 1;
				}
			    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
			    Bebida[playerid] = Bebida[playerid]+3;
				format(string, sizeof(string), "Drink tomado. Whisky Black Label(12 anos). O teor de ·lcool no seu sangue aumentou. Atual: %d Mg", Bebida[playerid]);
				SendClientMessage(playerid, COLOR_BARMAN, string);
				AddPlayerHealth(playerid, 15);
				GivePlayerMoney(playerid, -25);
				AcrescentarLucro(8,50);
 				return 1;
			}
			case 5:
			{
			    if(GetPlayerMoney(playerid) < 10){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar o X-Bacon.");
					return 1;
				}
				SendClientMessage(playerid, COLOR_BARMAN, "VocÍ recebeu um X-Bacon. Bom Lanche.");
				ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
				AddPlayerHealth(playerid, 5);
				GivePlayerMoney(playerid, -10);
				AcrescentarLucro(8,20);
 				return 1;
			}
			case 6:
			{
			    if(GetPlayerMoney(playerid) < 5){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar o X-Burguer.");
					return 1;
				}
				SendClientMessage(playerid, COLOR_BARMAN, "VocÍ recebeu um X-Burguer. Bom Lanche.");
				ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
				AddPlayerHealth(playerid, 2);
				GivePlayerMoney(playerid, -5);
				AcrescentarLucro(8,10);
 				return 1;
			}
			case 7:
			{
			    if(GetPlayerMoney(playerid) < 6){
			        SendClientMessage(playerid, COLOR_RED, "VocÍ n„o tem dinheiro para pagar o X-Salada.");
					return 1;
				}
				SendClientMessage(playerid, COLOR_BARMAN, "VocÍ recebeu um X-Salada. Bom Lanche.");
				ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
				AddPlayerHealth(playerid, 3);
				GivePlayerMoney(playerid, -6);
				AcrescentarLucro(8,12);
 				return 1;
			}
			case 8:
			{
				SendClientMessage(playerid, COLOR_BARMAN, "Volte sempre.");
 				return 1;
			}
		}
	}

	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == VendoDrogas && IsValidMenu(VendoDrogas)) {
	    switch(row){
	        case 0:
			{
				HideMenuForPlayer(VendoDrogas,playerid);
				MaconhaEsc[playerid] =1;
				ShowMenuForPlayer(QuantidadeDrog,playerid);
				return 1;
			}
			case 1:
			{
				HideMenuForPlayer(VendoDrogas,playerid);
				HeroinaEsc[playerid] =1;
				ShowMenuForPlayer(QuantidadeDrog,playerid);
				return 1;
			}
			case 2:
			{
				HideMenuForPlayer(VendoDrogas,playerid);
				CocainaEsc[playerid] =1;
				ShowMenuForPlayer(QuantidadeDrog,playerid);
				return 1;
			}
			case 3:
			{
			    TogglePlayerControllable(playerid,1);
				return 1;
			}
		}
	}
	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == QuantidadeDrog && IsValidMenu(QuantidadeDrog)){
	    switch(row){
	        case 0:
			{
				if(MaconhaEsc[playerid] == 1){
				    if(MaconhaMao[playerid]+1 <= 3){
				        TogglePlayerControllable(playerid,1);
					    MaconhaMao[playerid] = MaconhaMao[playerid] + 1;
					    format(string,sizeof(string),"VocÍ pegou mais 1 papelote de Maconha agora vocÍ tem %d papelote(s) de Maconha.",MaconhaMao);
					    SendClientMessage(playerid, COLOR_TRAFICANTE, string);
					    MaconhaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de maconha, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
				else if(HeroinaEsc[playerid] == 1){
					if(HeroinaMao[playerid]+1 <= 3){
					    TogglePlayerControllable(playerid,1);
					    HeroinaMao[playerid] = HeroinaMao[playerid] + 1;
					    format(string,sizeof(string),"VocÍ pegou mais 1 papelote de HeroÌna agora vocÍ tem %d papelote(s) de HeroÌna.",HeroinaMao);
					    SendClientMessage(playerid, COLOR_TRAFICANTE, string);
					    HeroinaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de heroÌna, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
				else if(CocainaEsc[playerid] == 1){
				    if(CocainaMao[playerid]+1 <= 3){
				    	TogglePlayerControllable(playerid,1);
					    CocainaMao[playerid] = CocainaMao[playerid] + 1;
					    format(string,sizeof(string),"VocÍ pegou mais 1 papelote de CocaÌna agora vocÍ tem %d papelote(s) de CocaÌna.",CocainaMao);
					    SendClientMessage(playerid, COLOR_TRAFICANTE, string);
					    CocainaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de cocaina, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
			}
			case 1:
			{
				if(MaconhaEsc[playerid] == 1){
					if(MaconhaMao[playerid]+2 <= 3){
						TogglePlayerControllable(playerid,1);
					    MaconhaMao[playerid] = MaconhaMao[playerid] + 2;
						SendClientMessage(playerid,COLOR_TRAFICANTE, "VocÍ pegou mais 2 papelotes de Maconha agora vocÍ tem 3 papelotes.");
					    MaconhaEsc[playerid] =0;
					    TogglePlayerControllable(playerid,0);
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de maconha, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
				else if(HeroinaEsc[playerid] == 1){
				    if(HeroinaMao[playerid]+2 <= 3){
					    TogglePlayerControllable(playerid,1);
					    HeroinaMao[playerid] = HeroinaMao[playerid] + 2;
						SendClientMessage(playerid,COLOR_TRAFICANTE, "VocÍ pegou mais 2 papelotes de HeroÌna agora vocÍ tem 3 papelotes.");
					    HeroinaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de heroina, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
				else if(CocainaEsc[playerid] == 1){
					if(CocainaMao[playerid]+2 <= 3){
					    TogglePlayerControllable(playerid,1);
					    HeroinaMao[playerid] = HeroinaMao[playerid] + 2;
						SendClientMessage(playerid,COLOR_TRAFICANTE, "VocÍ pegou mais 2 papelotes de CocaÌna agora vocÍ tem 3 papelotes.");
					    CocainaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de cocaina, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
			}
			case 2:
			{
				if(MaconhaEsc[playerid] == 1){
				    if(CocainaMao[playerid]+3 <= 3){
				        TogglePlayerControllable(playerid,1);
						MaconhaMao[playerid] = MaconhaMao[playerid] + 3;
						SendClientMessage(playerid,COLOR_TRAFICANTE, "VocÍ pegou 3 papelotes de Maconha.");
					    MaconhaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de maconha, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
				else if(HeroinaEsc[playerid] == 1){
				    if(HeroinaMao[playerid]+3 <= 3){
				        TogglePlayerControllable(playerid,1);
						HeroinaMao[playerid] = HeroinaMao[playerid] + 3;
						SendClientMessage(playerid,COLOR_TRAFICANTE, "VocÍ pegou 3 papelotes de HeroÌna.");
					    HeroinaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de heroina, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
				else if(CocainaEsc[playerid] == 1){
				    if(CocainaMao[playerid]+3 <= 3){
				        TogglePlayerControllable(playerid,1);
						CocainaMao[playerid] = CocainaMao[playerid] + 3;
						SendClientMessage(playerid,COLOR_TRAFICANTE, "VocÍ pegou 3 papelotes de CocaÌna.");
					    CocainaEsc[playerid] =0;
					    return 1;
					} else {
					    SendClientMessage(playerid, COLOR_RED, "VocÍ j· est· com os bolsos cheios de cocaina, sÛ pode levar 3 papelotes");
						return 1;
					}
				}
			}
			case 3:
			{
			    return 1;
			}
		}
	}
	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == CargaGeral && IsValidMenu(CargaGeral)) {
	    switch(row){
	        case 0:
			{
			new vehid = GetPlayerVehicleID(playerid);
			new trailerid = GetVehicleTrailer(vehid);
   			if(GetVehicleModel(trailerid) != 435){
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· com o Trailer correto!");
			    return 1;
			}
			TogglePlayerControllable(playerid,0);
			GameTextForPlayer(playerid, "~w~Carregando...",15000,0);
		    SendClientMessage(playerid,COLOR_CAMINHONEIRO,"O Trailer est· sendo Carregado, aguarde o Carregamento para ir deixar a carga.");
			SetTimerEx("CarregamentoGeral",15000,0,"d",playerid);
			}
			case 1:
			{
			new vehid = GetPlayerVehicleID(playerid);
			new trailerid = GetVehicleTrailer(vehid);
   			if(GetVehicleModel(trailerid) != 584){
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· com o Trailer correto!");
			    return 1;
			}
		    SendClientMessage(playerid,COLOR_CAMINHONEIRO,"O Trailer de G·s precisa ser abastecido na Refinaria, v· atÈ ela para carregar.");
			SetPlayerCheckpoint(playerid,251.5558, 1395.9694, 10.1558,5.0);
			CheckpointStatus[playerid] = CARREGANDOGAS;
			return 1;
			}
			case 2:
			{
		    SendClientMessage(playerid,COLOR_CAMINHONEIRO,"O Carregamento de drogas È feito no local indicado no radar.");
			ColocandoDrogas[playerid]=1;
			new drogas = random(5);
			SetPlayerCheckpoint(playerid,DrogasAbastecer[drogas][0],DrogasAbastecer[drogas][1],DrogasAbastecer[drogas][2],3.0);
			return 1;
			}
			case 3:
			{
			new vehid = GetPlayerVehicleID(playerid);
			if(GetVehicleModel(vehid) != 414){
			SendClientMessage(playerid, COLOR_RED, "Ei, vocÍ n„o est· com o caminh„o certo para esse tipo de transporte!");
			return 1;
			}
		    TogglePlayerControllable(playerid,0);
		    GameTextForPlayer(playerid,"~w~Carregando...",20000,0);
		    SetTimerEx("CarregandoRoupas",20000,0,"d",playerid);
		    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "Aguarde enquanto o caminh„o est· sendo carregado...");
			return 1;
		}
	}
}
	TogglePlayerControllable(playerid,1);
	if(GetPlayerMenu(playerid) == Properties && IsValidMenu(Properties)) {
	    switch(row){
	        case 0:
			{
				PropriedadeSelecionada[playerid] = 0;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
	        case 1:
			{
				PropriedadeSelecionada[playerid] = 1;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
	        case 2:
			{
				PropriedadeSelecionada[playerid] = 2;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
	        case 3:
			{
				PropriedadeSelecionada[playerid] = 3;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
			case 4:
			{
				PropriedadeSelecionada[playerid] = 4;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
			case 5:
			{
				PropriedadeSelecionada[playerid] = 5;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
			case 6:
			{
				PropriedadeSelecionada[playerid] = 6;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
			case 7:
			{
				PropriedadeSelecionada[playerid] = 7;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
			case 8:
			{
				PropriedadeSelecionada[playerid] = 8;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
			case 9:
			{
				PropriedadeSelecionada[playerid] = 9;
				ShowMenuForPlayer(ConfirmacaoNegocio,playerid);
				TogglePlayerControllable(playerid,0);
				return 1;
			}
		}
	}
	TogglePlayerControllable(playerid,1);
	if(GetPlayerMenu(playerid) == ConfirmacaoNegocio && IsValidMenu(ConfirmacaoNegocio)) {
	    switch(row){
	        case 0: ComprarPropriedade(playerid,PropriedadeSelecionada[playerid]);
	        case 1: TogglePlayerControllable(playerid,1);
		}
	}
	TogglePlayerControllable(playerid,1);
	if(GetPlayerMenu(playerid) == Sorvetes && IsValidMenu(Sorvetes)) {
	    switch(row){
	        case 0: ComprarSorvete(playerid,0);
	        case 1: ComprarSorvete(playerid,1);
	        case 2: ComprarSorvete(playerid,2);
	        case 3: ComprarSorvete(playerid,3);
	        case 4: ComprarSorvete(playerid,4);
	        case 5: ComprarSorvete(playerid,5);
	        case 6: ComprarSorvete(playerid,6);
	        case 7: ComprarSorvete(playerid,7);
	        case 8: ComprarSorvete(playerid,8);
		}
	}
	TogglePlayerControllable(playerid,0);
	if(GetPlayerMenu(playerid) == Alarme && IsValidMenu(Alarme)) {
	    switch(row){
	        case 0:
	        {
	       		new i;
				for(i=0;i<MAX_PLAYERS;i++){
					if(i != playerid){
						SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
						SendClientMessage(playerid, COLOR_AZULPLUS, "VeÌculo Trancado!");
						new Float:X, Float:Y, Float:Z;
						PlayerPlaySound(playerid,1056,X,Y,Z);
						format(string,sizeof(string),"SERVIDOR: %s trancou um veÌculo.",PlayerName(playerid));
						writelog(string);
						SalvarAlarme(GetPlayerVehicleID(playerid),1);
						TogglePlayerControllable(playerid,1);
						return 1;
					}
				}
			}
			case 1:
			{
	       		new i;
				for(i=0;i<MAX_PLAYERS;i++){
					if(i != playerid){
						SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
						SendClientMessage(playerid, COLOR_AZULPLUS, "VeÌculo Destrancado!");
						new Float:X, Float:Y, Float:Z;
						PlayerPlaySound(playerid,1056,X,Y,Z);
						format(string,sizeof(string),"SERVIDOR: %s destrancou um veÌculo.",PlayerName(playerid));
						writelog(string);
						SalvarAlarme(GetPlayerVehicleID(playerid),2);
						TogglePlayerControllable(playerid,1);
						return 1;
					}
				}
			}
			case 2:
			{
	       		new i;
				for(i=0;i<MAX_PLAYERS;i++){
					if(i != playerid){
						SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
						SendClientMessage(playerid, COLOR_AZULPLUS, "Alarme ativado. Modelo: Alarmar e impossÌvel dirigir.");
						new Float:X, Float:Y, Float:Z;
						PlayerPlaySound(playerid,1056,X,Y,Z);
						format(string,sizeof(string),"SERVIDOR: %s Ativou o alarme c/ impossÌvel de dirigir..",PlayerName(playerid));
						writelog(string);
						SalvarAlarme(GetPlayerVehicleID(playerid),3);
						TogglePlayerControllable(playerid,1);
						return 1;
					}
				}
			}
			case 3:
			{
				SendClientMessage(playerid, COLOR_AZULPLUS, "Alarme ativado. Modelo: Avisar a polÌcia, sem alarmar.");
				new Float:X, Float:Y, Float:Z;
				PlayerPlaySound(playerid,1056,X,Y,Z);
				format(string,sizeof(string),"SERVIDOR: %s Ativou o alarme Avisar a polÌcia, sem alarmar.",PlayerName(playerid));
				writelog(string);
				SalvarAlarme(GetPlayerVehicleID(playerid),4);
				TogglePlayerControllable(playerid,1);
				return 1;
			}
			case 4:
			{
				SendClientMessage(playerid, COLOR_AZULPLUS, "Todos os Alarmes foram desativados.");
				new Float:X, Float:Y, Float:Z;
				PlayerPlaySound(playerid,1056,X,Y,Z);
				format(string,sizeof(string),"SERVIDOR: %s Desativou todos os Alarmes.",PlayerName(playerid));
				writelog(string);
				SalvarAlarme(GetPlayerVehicleID(playerid),0);
				TogglePlayerControllable(playerid,1);
				return 1;
			}
			case 5:
			{
			    return 1;
			}
		}
	}
	TogglePlayerControllable(playerid,1);
	if(GetPlayerMenu(playerid) == CPD_First && IsValidMenu(CPD_First)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,1);
	        case 1: AplicarProfissao(playerid,2);
	        case 2: AplicarProfissao(playerid,11);
	        case 3: AplicarProfissao(playerid,10);
	        case 4: AplicarProfissao(playerid,8);
	        case 5: AplicarProfissao(playerid,12);
	        case 6: AplicarProfissao(playerid,13);
	        case 7: AplicarProfissao(playerid,34);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Second && IsValidMenu(CPD_Second)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,14);
	        case 1: AplicarProfissao(playerid,6);
	        case 2: AplicarProfissao(playerid,3);
	        case 3: AplicarProfissao(playerid,7);
	        case 4: AplicarProfissao(playerid,17);
	        case 5: AplicarProfissao(playerid,26);
	        case 6: AplicarProfissao(playerid,30);
	        case 7: AplicarProfissao(playerid,9);
	        case 8: AplicarProfissao(playerid,27);
	        case 9: AplicarProfissao(playerid,37);
	        case 10: AplicarProfissao(playerid,16);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Third && IsValidMenu(CPD_Third)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,32);
	        case 1: AplicarProfissao(playerid,35);
	        case 2: AplicarProfissao(playerid,36);
	        case 3: AplicarProfissao(playerid,20);
	        case 4: AplicarProfissao(playerid,18);
	        case 5: AplicarProfissao(playerid,31);
	        case 6: AplicarProfissao(playerid,21);
	        case 7: AplicarProfissao(playerid,28);
	        case 8: AplicarProfissao(playerid,29);
	        case 9: AplicarProfissao(playerid,33);
	        case 10: AplicarProfissao(playerid,15);
	        case 11: AplicarProfissao(playerid,23);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Fourth && IsValidMenu(CPD_Fourth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,39);
	        case 1: AplicarProfissao(playerid,38);
	        case 2: AplicarProfissao(playerid,19);
	        case 3: AplicarProfissao(playerid,22);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Fifth && IsValidMenu(CPD_Fifth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,40);
	        case 1: AplicarProfissao(playerid,5);
	        case 2: AplicarProfissao(playerid,4);
	        case 3: AplicarProfissao(playerid,24);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Sixth && IsValidMenu(CPD_Sixth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,25);
		}
	}
	return 1;
}
forward CarregandoRoupas(playerid);
public CarregandoRoupas(playerid)
{
	TogglePlayerControllable(playerid,1);
	CarregamentoRoupas[playerid] = 1;
	SendClientMessage(playerid, COLOR_CAMINHONEIRO, "Caminh„o carregado! Agora v· atÈ o CP indicado em seu mapa entregar as roupas!");
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,2242.1575,-1663.0786,15.4766,4.0);
	StatusCheck[playerid] = NONEE;
	CheckpointStatus[playerid] = TRANSPORTE_ROUPAS;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new vehicleid = GetPlayerVehicleID(playerid);
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
	    new veh = GetPlayerVehicleID(playerid);
	    if(veh == LimoHistoria1 || veh == LimoHistoria2){
	    RemovePlayerFromVehicle(playerid);
		SendClientMessage(playerid, COLOR_RED, "Ei, essa limosine faz parte de uma das histÛrias do jogo! … proibido usa-la!");
		}
	}

	if(newstate == PLAYER_STATE_DRIVER){
		new string[256];
		if(GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 523){
			switch(Profissao[playerid])
 			{
 				case COP_SWAT,COP_MILITAR,COP_RODOVIARIO,COP_NARCOTICOS,DELEGADO:
 					{
 						SendClientMessage(playerid, COLOR_GREEN, "Ol·, tenha cuidado ao dirigir sua viatura.");
 					}
 				default:
 					{
 						SendClientMessage(playerid, COLOR_RED2, "Essa viatura pertence ao Departamento de PolÌcia, vocÍ vai ser procurado atÈ q saia do carro!");
						SendClientMessage(playerid, COLOR_COP_SWAT, "PolÌciais ALERTADOS!");
						format(string, sizeof(string), "%s entrou em uma viatura, v· atr·s dele!",PlayerName(playerid));
						SendClientMessagePolicia(COLOR_COP_SWAT, string);
  						SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+1);
   						Perseguicao[playerid] = 1;
   					}
				}
			}
		}
	if(newstate == PLAYER_STATE_DRIVER){
	    new model = GetPlayerVehicleID(playerid);
	    if(model == carvenda1 || model ==  carvenda2 || model == carvenda3 || model == carvenda4 || model == carvenda5){
	        SendClientMessage(playerid, COLOR_RED2, "Esse veÌculo est· ‡ venda!");
			new string[256];
			format(string,sizeof(string),"Valor de venda: $%d",CarValor[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
			SendClientMessage(playerid, COLOR_RED2, string);
			SendClientMessage(playerid, COLOR_RED2, "Para compra-lo, digite /comprarveiculo");
			SendClientMessage(playerid, COLOR_RED2, "Para sair do veÌculo digite /sair");
			TogglePlayerControllable(playerid, 0);
			JogadorNoCarro[playerid] = 1;
		}
	}
	if(newstate == PLAYER_STATE_DRIVER){
	    new string[256];
      	new model = GetPlayerVehicleID(playerid);
        if(model == alugado1 || model == alugado2 || model == alugado3 || model == alugado4 || model == alugado5 || model == alugado6 || model == alugado7 || model == alugado8){
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
	if(newstate == PLAYER_STATE_PASSENGER){
	    OnPlayerEnterVehicleAsPassenger(playerid,GetPlayerVehicleID(playerid));
	}
	if(newstate == PLAYER_STATE_DRIVER){
		if(strcmp(Dono[GetPlayerVehicleID(playerid)],PlayerName(playerid),true)){
            new string[256];
            new tmp[256];
			format(tmp,256,"%d.vinfo",GetPlayerVehicleID(playerid));
			VerAlarme = dini_Int(tmp,"Alarme");
			if(VerAlarme == 1){
			    SendClientMessage(playerid, COLOR_RED2, "O Dono deste veÌculo trancou ele.");
			    RemovePlayerFromVehicle(playerid);
			    return 1;
			}
			if(VerAlarme == 3){
			    new Float:X, Float:Y, Float:Z;
				PlayerPlaySound(playerid,42801,X,Y,Z);
			    SendClientMessage(playerid, COLOR_RED2, "Esse veÌculo est· trancado. VocÍ ativou o alarme dele!");
			    RemovePlayerFromVehicle(playerid);
			    return 1;
			}
			if(VerAlarme == 4){
			    new ativar = random(4);
			    if(ativar == 0 || ativar == 1 || ativar == 2){
					format(string, sizeof(string), "%s entrou num carro sem desativar o alarme ou seja n„o È o dono, investigue!",PlayerName(playerid));
					SendClientMessagePolicia(COLOR_COP_RODOVIARIO, string);
				    return 1;
				} else {
					 SendClientMessage(playerid, COLOR_AZULPLUS,"Estranho... esse carro poderia ter alarmado!");
				     return 1;
				}
			}
		}

		if(EntregaCarro[playerid] == 1){
      		EntregaCarro[playerid] = 0;
      		NaoSair[playerid] = 1;
			return 1;
		}
	}
    new veh = GetPlayerVehicleID(playerid);
    if(veh == CarroContrabando1 || veh == CarroContrabando2 || veh == CarroContrabando3 || veh == CarroContrabando4 || veh == CarroContrabando5){
		if(Profissao[playerid] == CONTRABANDISTA && !IsPlayerAdmin(playerid)){
			if(PodePegar[playerid] == 1){
			    EntregaCarro[playerid] = 1;
			    GameTextForPlayer(playerid, "~w~Toma o ~r~Carro!", 5000, 1);
				SendClientMessage(playerid, COLOR_RED2, "ATEN«√O!! N„o bata o carro entregue pelo menos meio Ìntegro.");
				SetPlayerCheckpoint(playerid,-2212.6379,604.8463,35.3511,3.0);
				CheckpointStatus[playerid] = CONTRABANDOCAR2;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode pegar esse carro agora.");
			    return 1;
			}
		} else {
			RemovePlayerFromVehicle(playerid);
			SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pode entrar nesse veÌculo!");
	    	return 1;
		}
	}
	if(CarregamentoRoupas[playerid] == 1){
		new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	  	if(modelo == 414){
       		KillTimer(avisado[playerid]);
       		SendClientMessage(playerid, COLOR_CAMINHONEIRO, "Carga retomada.");
       		return 1;
	   	} else {
           	SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· no veÌculo certo para continuar o carregamento.");
           	return 1;
	 	 }
	}
	if(newstate == PLAYER_STATE_DRIVER){
   		if(Carregamento[playerid] == 1){
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 515){
		       	KillTimer(avisado[playerid]);
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "Carga retomada.");
			    return 1;
			} else {
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· no veÌculo certo para continuar o carregamento.");
			    return 1;
			}
		}
		else if(Carga[playerid] == 1){
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 428){
			    if(PegarGrana[playerid] == 0){
			       	KillTimer(avisado[playerid]);
			       	SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "Carro-forte retomado.");
				    return 1;
				} else {
			       	KillTimer(EntregandoGrana[playerid]);
			       	SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "Malote retomado.");
				    return 1;
				}
			} else {
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· no carro certo.");
			    return 1;
			}
		}
		else if(Pedras[playerid] == 1){
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 406){
		       	KillTimer(avisado[playerid]);
		       	SendClientMessage(playerid, COLOR_PEDREIRA, "Caminh„o retomado.");
			    return 1;
			} else {
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· no carro certo.");
			    return 1;
			}
		}
		else if(DrogasNoCaminhao[playerid] == 1){
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 515){
		       	KillTimer(avisado[playerid]);
		       	SendClientMessage(playerid, COLOR_CAMINHONEIRO, "Caminh„o de Drogas retomado.");
			    return 1;
			} else {
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· no carro certo.");
			    return 1;
			}
		}
		else if(EntregaLimo[playerid] == 1){
   			new modelo = GetPlayerVehicleID(playerid);
			if(modelo  == limosine1 || modelo == limosine2){
		       	KillTimer(avisado[playerid]);
		       	SendClientMessage(playerid, COLOR_MOTORISTA, "Limosine retomada, complete seu trabalho.");
			    return 1;
			} else {
			    SendClientMessage(playerid, COLOR_MOTORISTA, "VocÍ n„o est· no carro certo.");
			    return 1;
			}
		}
		else if(EntregadePizza[playerid]==1){
	       	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo == 448){
		       	KillTimer(avisado[playerid]);
		       	SendClientMessage(playerid, COLOR_CAMINHONEIRO, "Moto de Pizzas retomada.");
			    return 1;
			} else {
			    SendClientMessage(playerid, COLOR_MOTORISTA, "VocÍ n„o est· no carro certo.");
			    return 1;
			}
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT){
	    TextDrawHideForPlayer(playerid, Speedo[playerid]);
	    if(isTowtruck[playerid] == 1){
	 	    isTowtruck[playerid]=0;
		    Reboques--;
		    return 1;
		}
		else if(EntregaLimo[playerid] == 1){
		    SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar a Limosine da Empresa. E completar o seu trabalho.");
		    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
		    return 1 ;
	    }
		else if(Perseguicao[playerid] == 1){
		    new string[256];
            SendClientMessage(playerid,COLOR_GREEN,"VocÍ saiu do veÌculo, n„o est· sendo mais procurado!");
            SetPlayerWantedLevel(playerid,0);
            format(string, sizeof(string), "O Jogador %s saiu do carro da polÌcia conforme solicitado, n„o precisa mais ir atr·s dele!",PlayerName(playerid));
			SendClientMessagePolicia(COLOR_COP_SWAT, string);
            Perseguicao[playerid] = 0;
            return 1;
 		}
 		else if(EntregadePizza[playerid]==1){
		    SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar ao veÌculo. E entregar o resto das pizzas");
		    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
		    return 1 ;
	    }
		else if(Carregamento[playerid] == 1){
		    SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar ao veÌculo. E entregar a carga.");
		    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
			return 1;
		}
		else if(CarregamentoRoupas[playerid] == 1){
            SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar ao veÌculo. E entregar a carga.");
		    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
			return 1;
		}
		else if(Carga[playerid] == 1){
		    if(PegarGrana[playerid] == 0){
			    SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar ao veÌculo. E entregar o dinheiro");
			    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
				return 1;
			 } else {
			    SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES, "VocÍ tem 30 segundos para deixar o dinheiro no banco e voltar ao CARRO FORTE");
			    EntregandoGrana[playerid]=SetTimerEx("EntregarGrana",30000,0,"d",playerid);
			    return 1;
			}
		}
		else if(Pedras[playerid] == 1){
		    SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar ao veÌculo. E entregar as pedras.");
		    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
			return 1;
		}
		else if(DrogasNoCaminhao[playerid] == 1){
		    SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar ao veÌculo. E entregar as drogas.");
		    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
			return 1;
		}
		else if(NaoSair[playerid] == 1){
		    SendClientMessage(playerid,COLOR_GREEN,"VocÍ tem 10 segundos para voltar ao veÌculo. E entregar ele.");
		    avisado[playerid]=SetTimerEx("TerminarCarregamento",10000,0,"d",playerid);
			return 1;
		}
	    else if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COLOR_PALHA, "Espero que tenha gostado. Volte sempre");
			SendClientMessage(Taximetro[playerid][1], COLOR_TAXISTA, "VocÍ recebeu o valor da corrida atÈ aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			if(JogadorContratado(Taximetro[playerid][1],1)) AcrescentarLucro(1,PrecoCorrida[playerid]/4*3);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
			AcrescentarExPoints(Taximetro[playerid][1],1);
			NoTaxi[playerid] = 0;
			return 1;
		}
		else if(ATaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COLOR_PALHA, "Espero que tenha gostado da viagem. Volte sempre.");
		    SendClientMessage(ATaximetro[playerid][1], COLOR_TAXI_AEREO, "VocÍ recebeu o valor da viagem aÈrea atÈ aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(ATaximetro[playerid][1], PrecoCorrida[playerid]);
		    if(JogadorContratado(ATaximetro[playerid][1],1)) AcrescentarLucro(1,PrecoCorrida[playerid]/4*3);
		    PrecoCorrida[playerid] = 0;
		    ATaximetro[playerid][1] = 0;
		    ATaximetro[playerid][0] = 0;
		    AcrescentarExPoints(ATaximetro[playerid][1],1);
		    NoTaxi[playerid] = 0;
			return 1;
		}
		else if(MTaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COLOR_PALHA, "Espero que tenha gostado. Volte sempre.");
		    SendClientMessage(MTaximetro[playerid][1], COLOR_MOTOTAXI, "VocÍ recebeu o valor da corrida atÈ aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(MTaximetro[playerid][1], PrecoCorrida[playerid]);
		    if(JogadorContratado(MTaximetro[playerid][1],1)) AcrescentarLucro(1,PrecoCorrida[playerid]/4*3);
		    PrecoCorrida[playerid] = 0;
		    MTaximetro[playerid][1] = 0;
		    MTaximetro[playerid][0] = 0;
		    AcrescentarExPoints(MTaximetro[playerid][1],1);
		    NoTaxi[playerid] = 0;
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
	SendClientMessage(playerid,COLOR_GREEN,"O aluguel acabou!");
	SendClientMessage(playerid,COLOR_GREEN,"Se quiser alugue o carro de novo!");
}
public TerminarCarregamento(playerid){
	GameTextForPlayer(playerid,"~r~Entrega ~n~ ~w~Cancelada!",3000,4);
    EntregadePizza[playerid]=0;
    Carregamento[playerid] = 0;
    GeralCar[playerid] = 0;
    Carga[playerid] = 0;
    GasCar[playerid] = 0;
    Pedras[playerid] = 0;
    DrogasNoCaminhao[playerid] =0;
    EntregaLimo[playerid] = 0;
    CarregamentoRoupas[playerid] = 0;
    NaoSair[playerid] = 0;
    DisablePlayerCheckpoint(playerid);
    return 1;
}
public EntregarGrana(playerid){
	new string[256];
	new quantia;
	GameTextForPlayer(playerid,"~r~Deposito~n~ ~w~Cancelado!",3000,4);
    quantia = minrand(200,650);
	Carga[playerid] = 0;
	PegarGrana[playerid] = 0;
	format(string, sizeof(string), "VocÍ faliu e perdeu $%d pela sua imcopetÍncia d· prÛxima ser· demitido!", quantia);
	SendClientMessage(playerid, COLOR_RED2, string);
	GivePlayerMoney(playerid, -quantia);
	return 1;
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
	    case RESTAURANTE:
	        {
	            ShowMenuForPlayer(Cardapio1,playerid);
	            TogglePlayerControllable(playerid,0);
			}
	    case CORRETORA_PROPRIEDADES:
			{
				ShowMenuForPlayer(Properties,playerid);
   				TogglePlayerControllable(playerid,0);
			}
        case GPSDESTINO:
			{
				SendClientMessage(playerid, COLOR_PALHA, "Muito bem! VocÍ chegou atÈ o seu destino!");
				DisablePlayerCheckpoint(playerid);
				CheckpointStatus[playerid] = NONE;
				GPSLigado[playerid] = 0;
			}
        case TRANSPORTE_ROUPAS:
			{
				if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 414){
				SendClientMessage(playerid, COLOR_RED, "Eita, est· n„o È a nossa carga de roupas! N„o vamos aceitar isso, SAI¡ DAQUI...");
				return 1;
				}
				else{
					CarregamentoRoupas[playerid] = 0;
					new rand = random(3)+1;
					GivePlayerMoney(playerid,rand*150);
					new str[256];
					format(str,sizeof(str),"”timo! Aqui est· seu pagamento: $%d",rand*150);
					SendClientMessage(playerid, COLOR_CAMINHONEIRO, str);
					AcrescentarExPoints(playerid,1);
					DisablePlayerCheckpoint(playerid);
					CheckpointStatus[playerid] = NONE;
					}
			}
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
		   		SendClientMessage(playerid, COLOR_GREEN, "Pule daqui e va ate outro ponto indicado, cuidado pra n„o molhar a mercadoria.");
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
      			SendClientMessage(playerid, COLOR_GREEN, "Jogue o produto no mar, um pescador ira pegar depois. Cuidado para n„o cair.");
		   		DisablePlayerCheckpoint(playerid);
		   		SetPlayerCheckpoint(playerid,-2659.74,1530.51,54.97,1.4);
				CheckpointStatus[playerid] = CONTRABANDOFINAL;
			}
		case CONTRABANDOFINAL:
		    {
				new string[256];
		    	new contra;
	    	 	contra = minrand(400,1200);
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~r~Cuidado...", 5000, 1);
		   		SetPlayerPos(playerid,-2659.69,1534.64,54.42);
		   		SendClientMessage(playerid, COLOR_GREEN, "VocÍ caiu no mar e se molhou, mas conseguiu salvar o produto, o chefe te deu $1000.");
				format(string,sizeof(string),"VocÍ caiu no mar e se molhou, mas conseguiu salvar o produto, o chefe te deu $%s.",contra);
				SendClientMessage(playerid, COLOR_PESCADOR, string);
			    DisablePlayerCheckpoint(playerid);
		   		Contrabando[playerid] = 0;
		   		Receita[playerid] = 0;
		   		GivePlayerMoney(playerid,contra);
				DisablePlayerCheckpoint(playerid);
				AcrescentarExPoints(playerid,1);
				CheckpointStatus[playerid] = NONE;
 			}
 		case CATANDOLATAS :
			{
			if(CatarLatinha[playerid] == 1){
	    		if(IsPlayerInAnyVehicle(playerid)){
			    	SendClientMessage(playerid,COLOR_RED2,"VocÍ tem que estar ‡ pÈ");
					return 1;
			    }
			    else{
					new string[256];
					new latas;
			        latas = minrand(1,5);
				    format(string, sizeof(string), "VocÍ coletou %d lata(s).", latas);
					SendClientMessage(playerid,COLOR_AZUL, string);
			    	DisablePlayerCheckpoint(playerid);
			    	new rt = random(23);
			    	SetPlayerCheckpoint(playerid,Latinhas[rt][0],Latinhas[rt][1],Latinhas[rt][2],3.0);
			    	SendClientMessage(playerid,COLOR_WHITE,"Colete mais latinhas ou pare com /pararcoleta.");
			    	Latas[playerid] = Latas[playerid] + latas;
			    	dini_IntSet(PlayerName(playerid),"Latas",Latas[playerid]);
			    	if(Latas[playerid] >= LatasNecessarias[playerid]){
						AcrescentarExPoints(playerid,1);
						LatasNecessarias[playerid] = LatasNecessarias[playerid] + 15;
						dini_IntSet(PlayerName(playerid),"LatasNecessarias",LatasNecessarias[playerid]);
					}
				}
			}
		}
		case LAVANDOLIMOSINE :
      		{
			if(LavandoLimo[playerid] == 1){
      			new modelo = GetPlayerVehicleID(playerid);
				if(modelo  == limosine1 || modelo == limosine2 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
				    TogglePlayerControllable(playerid, 0);
				    SendClientMessage(playerid, COLOR_MOTORISTA, "Aguarde a lavagem...");
					LavandoLimo[playerid] = 0;
					GameTextForPlayer(playerid, "~w~Lavando...",15000,0);
					SetTimerEx("LavandoLimosine",15000,0,"d",playerid);
				} else {
				    SendClientMessage(playerid, COLOR_MOTORISTA, "VocÍ n„o est· em uma Limosine");
				    return 1;
				}
			}
 		}
 		case REVISAOLIMO1 :
 		    {
			new Float: CarHealth;
			GetVehicleHealth(GetPlayerVehicleID(playerid),CarHealth);
			if(CarHealth >= 70){
		    	if(LimoRevisada[GetPlayerVehicleID(playerid)] == 0){
		   			new modelo = GetPlayerVehicleID(playerid);
					if(modelo  == limosine1 || modelo == limosine2 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
					    TogglePlayerControllable(playerid, 0);
					    SendClientMessage(playerid, COLOR_MOTORISTA, "Aguarde...");
						GameTextForPlayer(playerid, "~w~Checando o ~r~Motor~w~...",15000,0);
						SetTimerEx("ChecandoLimo",15000,0,"d",playerid);
					} else {
					    SendClientMessage(playerid, COLOR_MOTORISTA, "VocÍ n„o est· em 1 Limosine ou n„o est· dirigindo.");
					    return 1;
					}
				} else {
				    SendClientMessage(playerid, COLOR_MOTORISTA, "A sua Limosine est· com o motor OK, v· para a lavagem.");
					return 1;
	 	 		}
			} else {
			    SendClientMessage(playerid, COLOR_MOTORISTA, "A sa˙de do seu carro est· ok.");
				return 1;
	 		}
		}
		case REVISAOLIMO2 :
	    	{
			new Float: CarHealth;
			GetVehicleHealth(GetPlayerVehicleID(playerid),CarHealth);
			if(CarHealth == 1000){
			    SendClientMessage(playerid, COLOR_MOTORISTA, "O Chefe examinou a Limosine est· em perfeito estado.");
			    SendClientMessage(playerid, COLOR_MOTORISTA, "Contudo vocÍ ganhou $1000 pelo serviÁo.");
			    GivePlayerMoney(playerid, 1000);
			    AcrescentarExPoints(playerid,1);
			    CheckpointStatus[playerid] = NONEE;
			    DisablePlayerCheckpoint(playerid);
			    EntregaLimo[playerid] = 0;
			    SetTimerEx("ChecagemDeMotor",900000,false,"%d",playerid);
			    if(JogadorContratado(playerid,2)) AcrescentarLucro(2,300);
		    } else {
				new prejuizo = 1000-floatround(CarHealth);
			    SendClientMessage(playerid, COLOR_MOTORISTA, "VocÍ bateu a Limosine e seu chefe cobrou o prejuÌzo.");
			    GivePlayerMoney(playerid, -prejuizo);
			    new str[256];
			    format(str, sizeof(str),"O prejuÌzo foi de $%d",prejuizo);
			    SendClientMessage(playerid, COLOR_RED, str);
			    CheckpointStatus[playerid] = NONEE;
			    DisablePlayerCheckpoint(playerid);
			    EntregaLimo[playerid] = 0;
			    SetTimerEx("ChecagemDeMotor",900000,0,"d",playerid);
			    if(JogadorContratado(playerid,2)) AcrescentarPrejuizo(2,200);
			    return 1;
			}
		}
		case CARREGANDOGAS :
		    {
			new vehid = GetPlayerVehicleID(playerid);
			new trailerid = GetVehicleTrailer(vehid);
   			if(GetVehicleModel(trailerid) != 584){
			    SendClientMessage(playerid, COLOR_CAMINHONEIRO, "VocÍ n„o est· com o Trailer correto!");
			    return 1;
			}
			GameTextForPlayer(playerid, "~w~Carregando...",15000,0);
		    SendClientMessage(playerid,COLOR_CAMINHONEIRO,"O Trailer de G·s est· sendo Carregado, aguarde o Carregamento para ir deixar a carga.");
            TogglePlayerControllable(playerid,0);
          	SetTimerEx("CarregamentoGas",15000,0,"d",playerid);
          	return 1;
		}
		case NOBAR :
		{
			ShowMenuForPlayer(Bar,playerid);
			TogglePlayerControllable(playerid,0);
			return 1;
		}
		case CONTRABANDOCAR1 :
	    {
	        if(ContrabandoCar[playerid] == 1){
		        PlayerPlaySoundEx(playerid, 1058);
		    	SendClientMessage(playerid, COLOR_CONTRABANDISTA, "AÌ rapaz! Nossos papos sempre s„o assim, escondidos. O carro est· na lateral da casa.");
	 	   		SendClientMessage(playerid, COLOR_GREEN, "Leve ele para os Triads checarem e ver se est„o afim.");
	 	   		DisablePlayerCheckpoint(playerid);
 				SetTimerEx("ContrabandoSpawnCar",3000,0,"d",playerid);
			}
		}
 		case CONTRABANDOCAR2:
		{
			new Float: VidaCarro;
			GetVehicleHealth(GetPlayerVehicleID(playerid),VidaCarro);
			if(VidaCarro >= 850){
      			new modelo = GetPlayerVehicleID(playerid);
				if(modelo  == Carrocriado[playerid] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
				    if(ContrabandoCar[playerid] == 1){
				   		GameTextForPlayer(playerid, "~w~Hum...", 5000, 1);
				   		TogglePlayerControllable(playerid,0);
				   		DisablePlayerCheckpoint(playerid);
				   		SetTimerEx("ChecandoContrabandoCar",5000,0,"d",playerid);
				   	}
				} else {
					SendClientMessage(playerid, COLOR_WHITE, "VocÍ n„o est· no carro correto.");
					return 1;
				}
			} else {
			    SendClientMessage(playerid, COLOR_RED2, "Ei, est· tentando me enganar? N„o vou querer esse carro, est· caido aos pedaÁos...");
                SendClientMessage(playerid, COLOR_RED2, "Vai enganar outro troxa com essa lata velha moleque!");
				DisablePlayerCheckpoint(playerid);
				TogglePlayerControllable(playerid,1);
				CheckpointStatus[playerid] = NONE;
			}
		}
		case CONTRABANDOCAR3:
		{
		   	new valor;
		    new string[256];
		    valor = minrand(1000,2000);
			new Float: VidaCarro;
			GetVehicleHealth(GetPlayerVehicleID(playerid),VidaCarro);
			if(VidaCarro >= 850){
      			new modelo = GetPlayerVehicleID(playerid);
				if(modelo  == Carrocriado[playerid] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
				    SendClientMessage(playerid, COLOR_WHITE, "Carro entregue!");
	 		   		DisablePlayerCheckpoint(playerid);
					AcrescentarExPoints(playerid,1);
					GameTextForPlayer(playerid, "~w~Exportado!", 3000,0);
					format(string,sizeof(string),"O carro foi entregue sem dano, foi pago $%d pelo carro",valor);
			  		SendClientMessage(playerid, COLOR_CONTRABANDISTA, string);
			  		GivePlayerMoney(playerid, valor);
					CheckpointStatus[playerid] = NONE;
					NaoSair[playerid] = 0;
					PodePegar[playerid] = 0;
				} else {
					SendClientMessage(playerid, COLOR_WHITE, "VocÍ n„o est· no carro correto.");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_WHITE, "Seu carro est· muito batido, n„o queremos ELE!");
				return 1;
			}
		}
		case CONTRABANDODROGA:
  		{
			if(Contrabando[playerid] == 1){
			    SendClientMessage(playerid, COLOR_TURQUESA, "Sinto muito mano! Entreguei as drogas pra um cara j·, se quiser ir pegar com ele");
			    SendClientMessage(playerid, COLOR_TURQUESA, "pra fazer um servicinho por grana vai atÈ a casa dele que ele ta l· agora!");
		        DisablePlayerCheckpoint(playerid);
		    	SetPlayerCheckpoint(playerid,1615.7572,-1896.8995,13.5490,3.0);
		    	CheckpointStatus[playerid] = CONTRABANDODROGA2;
		    }
		}
		case CONTRABANDODROGA2:
		{
		    if(Contrabando[playerid] == 1){
			    SendClientMessage(playerid, COLOR_ORANGE, "Aew maluco! Afim de ganhar uma graninha? Ent„o vai l· e entrega essa droga l·");
			    SendClientMessage(playerid, COLOR_ORANGE, "na casa do comprador em Las Venturas, Vai logo porra, se n„o, n„o tem grana ta ligado?!");
				new rand = random(4);
				DisablePlayerCheckpoint(playerid);
		    	SetPlayerCheckpoint(playerid,ContrabandoEntregaDroga[rand][0],ContrabandoEntregaDroga[rand][1],ContrabandoEntregaDroga[rand][2],3.0);
		    	CheckpointStatus[playerid] = CONTRABANDODROGA3;
		    }
		}
		case CONTRABANDODROGA3:
		{
		    if(Contrabando[playerid] == 1){
		        new con = random(3);
		        if(con == 0 || con == 1){
		            new conmoney = minrand(1200,1600);
		        	PlayerPlaySoundEx(playerid, 1058);
			    	SendClientMessage(playerid, COLOR_CONTRABANDISTA, "Opa! Minhas drogas! Passa pra c· maluco...");
					new str[256];
					format(str,sizeof(str),"T·i tua grana: $%d",conmoney);
					SendClientMessage(playerid, COLOR_CONTRABANDISTA, str);
					GivePlayerMoney(playerid,conmoney);
					Maconha[playerid] = Maconha[playerid]+2;
					dini_IntSet(PlayerName(playerid),"DosesMaconha",Maconha[playerid]);
					SendClientMessage(playerid, COLOR_JUIZ, "VocÍ recebeu 2 maconhas pela entrega! Para fumar digite /fumar [cigarros]");
					DisablePlayerCheckpoint(playerid);
		    		CheckpointStatus[playerid] = NONE;
				}
				if(con == 2){
			    	SendClientMessage(playerid, COLOR_ORANGE, "Ihh cara! Essas s„o as minhas drogas?! Ahh cara n„o quero essa porra! SUMA DAQUI...");
					DisablePlayerCheckpoint(playerid);
		    		CheckpointStatus[playerid] = NONE;
				}
		    }
		}
		case CONTRABANDOARMA1:
		{
		    if(Contrabando[playerid] == 1){
		    	SendClientMessage(playerid, COLOR_GRAD1, "V· buscar as armas escondidas enquanto isso vou ficar aqui procurando compradores!");
		    	DisablePlayerCheckpoint(playerid);
		    	SetPlayerCheckpoint(playerid,-2124.9001,-270.4929,35.3203,4.0);
		    	CheckpointStatus[playerid] = CONTRABANDOARMA2;
		    	SendClientMessage(playerid, COLOR_JUIZ, "Siga o local indicado em seu mapa para pegar as armas escondidas!");
			}
		}
		case CONTRABANDOARMA2:
		{
		    if(Contrabando[playerid] == 1){
		        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
				SetTimerEx("AcaoEspecial",5000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		    	SendClientMessage(playerid, COLOR_CONTRABANDISTA, "”timo! Armas recolhidas!");
		    	SendClientMessage(playerid, COLOR_GRAD1, "Aew cara! Achei um comprador... Vai l· entregar as armas pra ele que agente divide o lucro mano!");
		    	DisablePlayerCheckpoint(playerid);
		    	new rand = random(4);
		    	SetPlayerCheckpoint(playerid,EntregarContrabandoArma[rand][0],EntregarContrabandoArma[rand][1],EntregarContrabandoArma[rand][2],4.0);
		    	CheckpointStatus[playerid] = CONTRABANDOARMA3;
			}
		}
		case CONTRABANDOARMA3:
		{
		    if(Contrabando[playerid] == 1){
		        PlayerPlaySoundEx(playerid, 1058);
		        new rand = random(3);
		        if(rand == 0 || rand == 1){
		        new pagamento = minrand(1000,1500);
		    	SendClientMessage(playerid, COLOR_GRAD1, "Opa! Belas armas... Vou comprar!");
		    	new str[256];
		    	format(str,sizeof(str),"Aqui est· o pagamento: $%d",pagamento);
				SendClientMessage(playerid, COLOR_GRAD1, str);
				GivePlayerMoney(playerid,pagamento);
				AcrescentarExPoints(playerid,1);
				new con = random(3);
				if(con == 0) GivePlayerWeapon(playerid,24,40);
				if(con == 1) GivePlayerWeapon(playerid,32,150);
				if(con == 2) GivePlayerWeapon(playerid,25,20);
				SendClientMessage(playerid, COLOR_RED2, "VocÍ recebeu uma arma de brinde pela entrega!");
				DisablePlayerCheckpoint(playerid);
				CheckpointStatus[playerid] = NONE;
  				Contrabando[playerid] = 0;
				}
				if(rand == 2){
		    		SendClientMessage(playerid, COLOR_GRAD1, "O que??? Essas armas est„o em pÈssimo estado, aposto que n„o matam um mosquito!");
		    		SendClientMessage(playerid, COLOR_GRAD1, "Vaza daqui, n„o vou comprar LIXO");
                    DisablePlayerCheckpoint(playerid);
					CheckpointStatus[playerid] = NONE;
		    		Contrabando[playerid] = 0;
				}
			}
		}
	}
	switch (StatusCheck[playerid])
	{
	  case NOSTRIADS :
		{
			TogglePlayerControllable(playerid, 0);
			SetPlayerPos(playerid,-2173.7002,679.8663,55.1647);
			SetPlayerFacingAngle(playerid,267.3764);
			SendClientMessage(playerid, COLOR_RED2, "Est· aqui para pegar o pacote n„o È?");
			SetTimerEx("Conversa1",3000,0,"d",playerid);
		}
  	  case ENTREGANDORICK :
		{
		    TogglePlayerControllable(playerid, 0);
		    SetTimerEx("Conversa7b",4000,0,"d",playerid);
		}
	  case CONVERSA_MOTORISTA :
		{
			SendClientMessage(playerid, COLOR_WHITE, "Motorista, pro aeroporto Virtual Air!");
			ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
			TogglePlayerControllable(playerid,0);
			SetTimerEx("Conversa21b",3000,0,"d",playerid);
		}
	  case TELHADO :
		{
			DisablePlayerCheckpoint(playerid);
		    TogglePlayerControllable(playerid, 1);
		    SendClientMessage(playerid, COLOR_JUIZ, "Saia logo daÌ!");
		    SetPlayerCheckpoint(playerid,1476.2811,1901.7622,10.9186,2.0);
		    StatusCheck[playerid] = SAINDOTELHADO;
		}
	  case SAINDOTELHADO :
		{
		    TogglePlayerControllable(playerid, 0);
			SendClientMessage(playerid, COLOR_WHITE, "Ah...");
 			SetTimerEx("Conversa10",2000,0,"d",playerid);
		}
	  case AERO :
		{
		    DisablePlayerCheckpoint(playerid);
		    TogglePlayerControllable(playerid, 0);
		    SetPlayerInterior(playerid,14);
    		SetPlayerPos(playerid,-1833.9573,18.6406,1061.1436);
    		SetPlayerFacingAngle(playerid,360);
 			SetTimerEx("ConversaA1",3000,0,"d",playerid);
 		}
      case PEGAR_PASSAGEM :
		{
		    DisablePlayerCheckpoint(playerid);
		    TogglePlayerControllable(playerid, 0);
		    SetPlayerInterior(playerid,14);
    		SetPlayerPos(playerid,-1833.9573,18.6406,1061.1436);
    		SetPlayerFacingAngle(playerid,360);
 			SetTimerEx("Conversa23cc",3000,0,"d",playerid);
 		}
 		case ENTREGASF :
		{
		    TogglePlayerControllable(playerid, 0);
			SendClientMessage(playerid, COLOR_RED, "Veio entregar o pacote?");
			SetTimerEx("ConversaB1",3000,0,"d",playerid);
		}
      case AGENCIA :
		{
		    DisablePlayerCheckpoint(playerid);
    		SetPlayerInterior(playerid,3);
	        SetPlayerFacingAngle(playerid,90);
	        SetPlayerPos(playerid,387.9047,171.1747,1008.3828);
	        DestroyPickup(Pickup_EntradaCPD);
	        Pickup_EntradaCPD=CreatePickup(seta,2,1309.8815,-1368.6122,13.5510);
	        SendClientMessage(playerid, COLOR_PALHA, "Bem vindo ‡ agencia de empregos!");
	        SendClientMessage(playerid, COLOR_PALHA, "Para mais informaÁıes digite: /level");
	        StatusCheck[playerid] = NONEE;
 		}
	}
	switch (nCheckpointStatus[playerid])
	{
		case NACAMA:
		    {
				SendClientMessage(playerid, COLOR_ROSA2, "VocÍ entrou no checkpoint e saiu do sexo");
				SendClientMessage(Prostitutacama[playerid], COLOR_ROSA2, "Seu cliente saiu do sexo e vocÍ voltou para a porta da boate!");
		  		DisablePlayerCheckpoint(playerid);
		  		SetPlayerPos(playerid,2421.6042,-1224.7599,25.2050);
		  		SetPlayerInterior(playerid,0);
		  		SetPlayerPos(Prostitutacama[playerid],2421.6042,-1224.7599,25.2050);
		  		SetPlayerInterior(Prostitutacama[playerid],0);
		  		SendClientMessage(playerid, COLOR_ROSA2, "Foi paga uma quantia de $400 pelo sexo.");
		  		SendClientMessage(Prostitutacama[playerid], COLOR_ROSA2,"VocÍ recebeu seu pagamento!");
		  		GivePlayerMoney(Prostitutacama[playerid], 800);
	        	GivePlayerMoney(playerid, -400);
				TextDrawHideForPlayer(playerid,tdStrip);
			    AreaStrip[playerid] = 0;
			    nCheckpointStatus[playerid] = 0;
			    AcrescentarExPoints(Prostitutacama[playerid],1);
			}
		}
	if(Carregamento[playerid] == 1){
		new valor;
	    new string[256];
	    valor = minrand(500,1000);
	    new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
 		if(modelo == 515){
		   	if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))){
		   		if(GetVehicleTrailer(GetPlayerVehicleID(playerid))){
					Carregamento[playerid] = 0;
					GasCar[playerid] = 0;
					GeralCar[playerid] = 0;
					format(string,sizeof(string),"A Carga foi entregue com sucesso! O seu frete foi $%d",valor);
			  		SendClientMessage(playerid, COLOR_CAMINHONEIRO, string);
			  		GivePlayerMoney(playerid, valor);
			  		SetVehicleToRespawn(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
			  		GameTextForPlayer(playerid, "~w~Descarregamento Concluido", 3000,0);
			  		DisablePlayerCheckpoint(playerid);
			  		return 1;
				} else {
					SendClientMessage(playerid,COLOR_RED,"N„o foi detectado Trailer!");
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"Seu caminh„o n„o tem Trailer, como vai entregar a carga?");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um ROADTRAIN!");
			return 1;
		}
	}
	if(ColocandoDrogas[playerid] == 1){
	    new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
 		if(modelo == 515  || modelo == 414){
 		   	if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)) || modelo == 414){
			   	if(GetVehicleTrailer(GetPlayerVehicleID(playerid))){
			   		DrogasNoCaminhao[playerid]=1;
			   		ColocandoDrogas[playerid]=0;
			   		DisablePlayerCheckpoint(playerid);
			   		SendClientMessage(playerid, COLOR_CAMINHONEIRO, "As drogas foram colocadas! VAI LOGO DEIXAR!!!!");
					new deixando = random(55);
					SetPlayerCheckpoint(playerid,DeixandoDrogas[deixando][0],DeixandoDrogas[deixando][1],DeixandoDrogas[deixando][2],3.0);
					new rand = random(100);
					new string[256];
					if(rand <= 50) {
						format(string, sizeof(string), "O Caminhoneiro %s suspeito de estar levando drogas, investigue a veracidade dessa den˙ncia",PlayerName(playerid));
						SendClientMessagePolicia(COLOR_COP_RODOVIARIO, string);
					 }
						else {
							return 1;
						}
					} else {
						SendClientMessage(playerid,COLOR_RED,"N„o foi detectado Trailer!");
						return 1;
					}
				} else {
					SendClientMessage(playerid,COLOR_RED,"Seu caminh„o n„o tem Trailer, como vai entregar a carga?");
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um ROADTRAIN ou MULE!");
				return 1;
			}
		}
	if(DrogasNoCaminhao[playerid] == 1){
	    new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
 		if(modelo == 515 || modelo == 414){
 		   	if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)) || modelo == 414){
				if(GetVehicleTrailer(GetPlayerVehicleID(playerid))){
			   		DrogasNoCaminhao[playerid]=0;
			   		DisablePlayerCheckpoint(playerid);
			   		SendClientMessage(playerid, COLOR_CAMINHONEIRO, "Os Traficantes est„o checando o carregamento");
			   		GameTextForPlayer(playerid, "~w~Aguarde...",15000,0);
			   		SetTimerEx("ChecandoDrogas",15000,0,"d",playerid);
					return 1;
				} else {
					SendClientMessage(playerid,COLOR_RED,"N„o foi detectado Trailer!");
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"Seu caminh„o n„o tem Trailer, como vai entregar a carga?");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"VocÍ n„o est· em um ROADTRAIN ou MULE!");
			return 1;
		}
	}
	if(EntregadePizza[playerid]==1){
	    new valor;
	    new string[256];
	    valor = minrand(8,60);
	    new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
 		if(modelo == 448){
            if(PizzasMoto[GetPlayerVehicleID(playerid)] <= 0){
                PizzasEntregues[playerid]++;
                if(PizzasEntregues[playerid] >= PizzasNecessarias[playerid]) AcrescentarExPoints(playerid,1); PizzasNecessarias[playerid] = PizzasNecessarias[playerid]+10;
			    GameTextForPlayer(playerid, "~w~Entrega Concluida", 3000,0);
				format(string,sizeof(string),"A pizza foi entregue, a sua gorjeta foi de $%d",valor);
	  			SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, string);
	  			SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "As pizzas na sua moto acabaram, v· para a pizzaria pegar mais");
	  			PizzasMoto[GetPlayerVehicleID(playerid)] --;
	  			DisablePlayerCheckpoint(playerid);
	  			GivePlayerMoney(playerid, valor);
	  			if(JogadorContratado(playerid,0)) AcrescentarLucro(0,valor/4*3);
	  			EntregadePizza[playerid]=0;
			 }
		 	 else if(PizzasMoto[GetPlayerVehicleID(playerid)] >= 1){
		 	    PizzasEntregues[playerid]++;
                if(PizzasEntregues[playerid] >= PizzasNecessarias[playerid]) AcrescentarExPoints(playerid,1); PizzasNecessarias[playerid] = PizzasNecessarias[playerid]+10;
			    GameTextForPlayer(playerid, "~w~Entrega Concluida", 3000,0);
				format(string,sizeof(string),"A pizza foi entregue, a sua gorjeta foi de $%d, caso queira entregar outra pizza, o local est· no radar",valor);
	  			SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, string);
	  			SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "Caso queira parar digite /pararentrega.");
				DisablePlayerCheckpoint(playerid);
				new pizzas = random(55);
				SetPlayerCheckpoint(playerid,EntregaPizza[pizzas][0],EntregaPizza[pizzas][1],EntregaPizza[pizzas][2],3.0);
				EntregadePizza[playerid]=1;
				PizzasMoto[GetPlayerVehicleID(playerid)] --;
				GivePlayerMoney(playerid, valor);
				if(JogadorContratado(playerid,0)) AcrescentarLucro(0,valor/4*3);
			}
		}
	}
	if(PegandoDrogas[playerid] ==1){
		ShowMenuForPlayer(VendoDrogas,playerid);
		TogglePlayerControllable(playerid,0);
		PegandoDrogas[playerid] =0;
		DisablePlayerCheckpoint(playerid);
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
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - 100 atÈ nÌvel 130");
	        ShowMenuForPlayer(CPD_Fifth,playerid);
	        TogglePlayerControllable(playerid,0);
	    }
	    case 6: {
	        SendClientMessage(playerid,COLOR_RED,"Lista de profissıes principiantes - 140 atÈ nÌvel 160");
	        ShowMenuForPlayer(CPD_Sixth,playerid);
	        TogglePlayerControllable(playerid,0);
		}
	}
	if(AreaBombShop[playerid] == 1){
		SendClientMessage(playerid, COLOR_GREEN, "VocÍ entrou na loja de bombas!");
		new msg[256];
		format(msg,sizeof(msg),"SERVIDOR: %s entrou na loja de bombas.",PlayerName(playerid));
		writelog(msg);
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
stock PlayerPlaySoundEx(playerid,soundid)
{
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid,X,Y,Z);
	PlayerPlaySound(playerid,soundid,X,Y,Z);
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
public ChecandoContrabandoCar(playerid){
	new rand = random(3);
	if(rand == 0 || rand == 1){
	    SendClientMessage(playerid, COLOR_CONTRABANDISTA, "Beleza, vou querer o carro agora leve para o destino que lhe passarei.");
		new Con = random(4);
		DisablePlayerCheckpoint(playerid);
		TogglePlayerControllable(playerid,1);
		SetPlayerCheckpoint(playerid,EntregarContrabandoCarro[Con][0],EntregarContrabandoCarro[Con][1],EntregarContrabandoCarro[Con][2],3.0);
		CheckpointStatus[playerid] = CONTRABANDOCAR3;
		SendClientMessage(playerid, COLOR_WHITE, "Leve para o local do radar.");
		return 1;
	}
	else if(rand == 2){
	    SendClientMessage(playerid, COLOR_RED2, "N„o vou querer! Deixe para a prÛxima.");
	    SendClientMessage(playerid, COLOR_RED2, "A cor n„o me agradou. Se achou ruim, SE MATE!");
		DisablePlayerCheckpoint(playerid);
		TogglePlayerControllable(playerid,1);
		CheckpointStatus[playerid] = NONE;
		return 1;
	}
	return 1;
}
public Desmanche(playerid) {
	TempoDesmanche[playerid] = 0;
	SendClientMessage(playerid,COLOR_YELLOW,"Tempo de espera do desmanche terminado.");
	new msg[256];
	format(msg,sizeof(msg),"SERVIDOR: %s terminou o tempo de espera do desmanche.",PlayerName(playerid));
	return 1;
}

public ArrumandoVeiculo(playerid,vehicleid,Float:X,Float:Y,Float:Z,Float:ang)
{
	SendClientMessage(playerid, COLOR_WHITE, "VeÌculo consertado! O conserto custou $100");
	GivePlayerMoney(playerid,-100);
	AcrescentarLucro(9,100);
	SetVehiclePos(vehicleid,X,Y,Z);
	SetVehicleZAngle(vehicleid,ang);
	PutPlayerInVehicle(playerid,vehicleid,0);
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

public Roubo(playerid) {
	RouboMao[playerid] = 1;
    SendClientMessage(playerid,COLOR_GREEN,"…, agora vocÍ j· pode roubar, escolha alguÈm que tenha muita $$");
}
stock AplicarProfissao(playerid,profid)
{
	if(!PLAYERLIST_authed[playerid]) return -1;
	if(dini_Int(PlayerName(playerid),"NM") == 1){
		SendClientMessage(playerid, COLOR_RED, "Espere atÈ o prÛximo nÌvel para mudar sua profiss„o!");
		return 1;
	}
	if(dini_Int(PlayerName(playerid),"XL") < ProfLevel[profid]){
		new tmp[256];
		format(tmp,256,"Seu level n„o È suficiente para a profiss„o %s. MÌnimo de level: %d, o seu: %d",ProfExtName[profid],ProfLevel[profid],dini_Int(PlayerName(playerid),"XL"));		SendClientMessage(playerid,COLOR_RED,tmp);
		return 1;
	} else {
	    RetirarJogadorDaPropriedade(playerid);
	    new string[256];
	    dini_IntSet(PlayerName(playerid),"Prof",profid);
	    SendClientMessage(playerid,COLOR_GREEN,"Profiss„o aplicada. Digite /profissao para saber como agir agora!");
		new msg[256];
		format(msg,256,"SERVIDOR: A profiss„o de %s agora È '%s'.",PlayerName(playerid),ProfExtName[profid]);
		SendClientMessageToAll(COLOR_COP_SWAT,msg);
		writelog(msg);
		Profissao[playerid] = profid;
		dini_IntSet(PlayerName(playerid),"NM",1);
		dini_IntSet(PlayerName(playerid),"Skin",ProfSkin[profid]);
		LogarPlayer(playerid);
		SetPlayerPos(playerid,ProfPos[profid][0],ProfPos[profid][1],ProfPos[profid][2]);
		format(string,sizeof(string),"~w~%s",ProfGT[profid]);
		GameTextForPlayer(playerid,string,3000,3);
		dini_IntSet(PlayerName(playerid),"Dinheiro",GetPlayerMoney(playerid));
		DisablePlayerCheckpoint(playerid);
		TrancarVeiculoPorProf(playerid);
		return 1;
	}
}
public RestauranteHandler()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    new Float:dist;
	    dist = GetPlayerDistanceToPointEx(i,1477.3245,-1880.2889,13.5469);
	    if(dist < 7){
	        if(NoRestaurante[i] == 0){
	        	SendClientMessage(i, COLOR_GREEN, "Restaurante Life's'FOOD");
	        	SendClientMessage(i, COLOR_WHITE, "Para entrar pressione a tecla ENTER.");
				NoRestaurante[i] = 1;
			}
		}
		else{
			if(NoRestaurante[i] == 1 && NoRestaurante2[i] == 0) SendClientMessage(i, COLOR_PALHA, "Obrigado pela visita... Volte sempre!");
		    NoRestaurante[i] = 0;
		}
	}
}
public RestauranteHandler2()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    new Float:dist;
	    dist = GetPlayerDistanceToPointEx(i,681.6216,-451.8933,-25.6172);
	    if(dist < 7){
			if(NoRestaurante2[i] == 0){
	        	SendClientMessage(i, COLOR_WHITE, "Para sair do restaurante pressione a tecla ENTER!");
				NoRestaurante2[i] = 1;
			}
		}
		else NoRestaurante2[i] = 0;
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
		        DisablePlayerCheckpoint(i);
			    SetPlayerCheckpoint(i,CPD_CPPositions[prevcp][0],CPD_CPPositions[prevcp][1],CPD_CPPositions[prevcp][2],2.0);
			    CPD_CPHandling[i] = prevcp+1;
			    CheckpointStatus[i] = NONE;
			    StatusCheck[i] = NONEE;
			}
		} else {
		    CPD_CPHandling[i] = 0;
		}
	}
}

stock DiminuirExPoints(playerid,points)
{
      if(dini_Exists(PlayerName(playerid))){
		if(ExPoints[playerid]-points >= 0){
	   		ExPoints[playerid]=ExPoints[playerid]-points;
	   		dini_IntSet(PlayerName(playerid),"ExPoints",ExPoints[playerid]);
	    } else {
		    ExPoints[playerid] = 0;
		    dini_IntSet(PlayerName(playerid),"ExPoints",ExPoints[playerid]);
			}
   		} else {
		  printf("N„o conseguimos dimunir o XL de %s",PlayerName(playerid));
		  printf("O arquivo do jogador n„o foi encontrado");
		  }
}
stock AcrescentarExPoints(playerid,points)
{
  if(dini_Exists(PlayerName(playerid))){
	if(ExPoints[playerid]+points >= 7){
	    new string[256];
	    dini_IntSet(PlayerName(playerid),"XL",dini_Int(PlayerName(playerid),"XL") + 1);
	    SendClientMessage(playerid,COLOR_GREEN,"VocÍ alcanÁou 7 Experience Points e subiu mais um Level");
		format(string, sizeof(string), "Seu Level agora È: %d", dini_Int(PlayerName(playerid),"XL"), playerid);
		SendClientMessage(playerid, COLOR_AZULPLUS, string);
	    ExPoints[playerid]=0;
	    dini_IntSet(PlayerName(playerid),"ExPoints",ExPoints[playerid]);
	    dini_IntSet(PlayerName(playerid),"NM",0);
	} else {
	    ExPoints[playerid]=ExPoints[playerid]+points;
	    dini_IntSet(PlayerName(playerid),"ExPoints",ExPoints[playerid]);
		}
  } else {
      printf("Erro ao acrescentar XL para %s",PlayerName(playerid));
      printf("O arquivo do jogador n„o foi encontrado");
  }
  return 1;
}
public GatesCoordChecker()
{
	new Float:X, Float:Y, Float:Z;
	for(new p; p<4; p++){
	    new Plocalizado;
	    for(new i; i<MAX_PLAYERS; i++){
	    	new vehicleid = GetPlayerVehicleID(i);
			if(IsPlayerConnected(i) && Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_SWAT || Profissao[i] == JUIZ || Profissao[i] == DELEGADO || GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 523 || GetVehicleModel(vehicleid) == 601){
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

public LavandoLimosine(playerid){
	SendClientMessage(playerid, COLOR_MOTORISTA, "A lavagem est· completa.");
    TogglePlayerControllable(playerid, 1);
    LimoLavada[GetPlayerVehicleID(playerid)] =1;
    GivePlayerMoney(playerid, 200);
    LavagemLimo[playerid] = 1;
	DisablePlayerCheckpoint(playerid);
    CheckpointStatus[playerid] = NONE;
    SetTimerEx("LimoLimpa",300000,false,"%d",playerid);
    AcrescentarExPoints(playerid,1);
    if(JogadorContratado(playerid,2)) AcrescentarLucro(2,100);
}
public LimoLimpa(playerid){
	LimoLavada[GetPlayerVehicleID(playerid)]=0;
	LavagemLimo[playerid] = 0;
 	SendClientMessage(playerid,COLOR_MOTORISTA, "A limosine est· suja, vocÍ pode ir lava-l· denovo se quiser.");
    return 1;
} 
public ChecandoLimo(playerid){
	SendClientMessage(playerid, COLOR_MOTORISTA, "Motor, est· OK.");
    TogglePlayerControllable(playerid, 1);
    SetVehicleHealth(GetPlayerVehicleID(playerid),1000);
    MotorLimo[playerid] = 1;
    LimoRevisada[GetPlayerVehicleID(playerid)] = 1;
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COLOR_MOTORISTA, "V· deixar a Limosine no seu Chefe, ATEN«√O: N„o bata!");
	SetPlayerCheckpoint(playerid,1224.7695,-1828.1321,13.408,3.0);
    CheckpointStatus[playerid] = REVISAOLIMO2;
}
public ChecagemDeMotor(playerid){
	if(Profissao[playerid] == MOTORISTA){
		LimoRevisada[GetPlayerVehicleID(playerid)] = 0;
		MotorLimo[playerid] = 0;
	 	SendClientMessage(playerid,COLOR_MOTORISTA, "… necess·ria uma nova revis„o na Limosine da empresa.");
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
public AnunciarComu(){
	new rand = random(3);
	if(rand == 0){
		SendClientMessageToAll(COLOR_ORANGE, " ");
		SendClientMessageToAll(COLOR_ORANGE, "Reload Virtual Life RPG:");
		SendClientMessageToAll(COLOR_CONTRABANDISTA, "Mais informaÁıes sobre o Mode/Clan? Sugestıes? D˙vidas? Acesse:");
		SendClientMessageToAll(0xFFB4F4AA, "http://www.orkut.com/Community.aspx?cmm=45269704");
	}
	else if(rand == 1){
	    SendClientMessageToAll(COLOR_ORANGE, " ");
	    SendClientMessageToAll(COLOR_WHITE, "Reload Virtual Life RpG mais que um RPG, UMA VIDA!");
	    SendClientMessageToAll(COLOR_PALHA, "Entre em nossa comunidade no orkut:");
	    SendClientMessageToAll(COLOR_CONTRABANDISTA, "http://www.orkut.com/Community.aspx?cmm=45269704");
	    SendClientMessageToAll(COLOR_PALHA, "DÍ idÈias/sugestıes e obtenha mais informaÁıes sobre o clan/mode!");
	}
	else if(rand == 2){
	    SendClientMessageToAll(COLOR_ORANGE, " ");
	    SendClientMessageToAll(COLOR_WHITE, "Reload Virtual Life RPG:");
	    SendClientMessageToAll(COLOR_PALHA, "N„o gostou do mode? Acha que est· faltando algo? Quer obter mais informaÁıes sobre o clan?");
	    SendClientMessageToAll(COLOR_CONTRABANDISTA, "Acesse:");
		SendClientMessageToAll(COLOR_CONTRABANDISTA, "http://www.orkut.com/Community.aspx?cmm=45269704");
	    SendClientMessageToAll(COLOR_VERDECLARO, "Ai vocÍ poder· obter informaÁıes sobre o mode/clan e ainda poder· dar idÈias ao gamemode.");
	}
}
public Bancos(playerid)
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			if((X >= -37.2183 && X <= -14.1099 && Y >= -91.8006 && Y <= -74.6845) || (X >= -34.6621 && X <= -2.6782 && Y >= -31.4095 && Y <= -25.6232) || (X >= -36.5483 && X <= -17.2655 && Y >= -57.9948 && Y <= -49.2967)){
				if(AreaCreditos[i] == 0) {
				    TextDrawShowForPlayer(i,td247);
					SendClientMessage(i, COLOR_PALHA, "Loja 24/7 - Comandos:");
					SendClientMessage(i, COLOR_WHITE, "/celular = Para comprar um celular");
					SendClientMessage(i, COLOR_WHITE, "/agenda = Para comprar uma agenda");
					SendClientMessage(i, COLOR_WHITE, "/recarga = Para recarregar os crÈditos do seu celular.");
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na Loja 24/7.",PlayerName(playerid));
					writelog(msg);
					AreaCreditos[i] = 1;
				}
			}
            else if(X >= 406.3685 && X <= 798.7696 && Y >= -2476.3638 && Y <= -2082.9778){
			    if(AreaPesca[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na ¡REA DE PESCA.",PlayerName(playerid));
					writelog(msg);
		    		TextDrawShowForPlayer(i,tdPesca);
                	AreaPesca[i] = 1;
				}
            }
			else if(X >= 2303.8235 && X <= 2321.3071 && Y >= -17.2803 && Y <= 0.7794){
			    if(AreaBanco[i] == 0){
			    	SendClientMessage(i, COLOR_PALHA, "$ $ $ $ Banco Life $ $ $ $");
			    	SendClientMessage(i, COLOR_WHITE, "Para visualizar os comandos digite /meubanco");
			        AreaBanco[i] = 1;
			        new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no BANCO.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Banco);
				}
			}
			else if((X >= 244.6573 && X <= 250.0471 && Y >= 64.9115 && Y <= 71.2839)){
			    if(AreaDelegacia[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na DELEGACIA.",PlayerName(playerid));
					writelog(msg);
     				TextDrawShowForPlayer(i,tdDelegacia);
					SendClientMessage(i,COLOR_VERDE_AQUA,"VocÍ entrou na delegacia. Aqui È onde as multas s„o pagas, digite /pagarmulta para pagar a sua");
					AreaDelegacia[i] = 1;
				}
			}
			else if((X >= 2202.5859 && X <= 2243.3833 && Y >= -1178.5582 && Y <= -1147.8750) || (X >= 1011.2641 && X <= 1041.0114&& Y >= -983.7526 && Y <= -969.2452) || (X >= 306.8750 && X <= 348.0109 && Y >= -1549.4528 && Y <= -1507.1206) || (X >= 853.6352&& X <= 906.9810 && Y >= -1654.5397 && Y <= -1637.8098) || (X >= 1832.3505 && X<= 1924.4619 && Y>= -1601.7281 && Y<= -1595.9496)){
			    if(AreaHotel[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou em um HOTEL.",PlayerName(playerid));
					writelog(msg);
     				TextDrawShowForPlayer(i,Hotel);
					SendClientMessage(i,COLOR_VERDE_AQUA,"VocÍ entrou na ·rea de um hotel. Para mais informaÁıes, digite /hotelinfo");
					AreaHotel[i] = 1;
				}
			}
            else if(X >= -231.1121 && X <=-208.7958 && Y >= 972.6275 && Y <= 1000.6964){
                if(AreaDeleg[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na DELEGACIA.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Delegacia);
	         		AreaDeleg[i] = 1;
				}
            }
            else if((X >= 822.0399 && X <= 834.1194 && Y >= -1.1471 && Y <= 11.6526)){
                if(AreaLCavalos[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na LOTERIA DE CAVALOS.",PlayerName(playerid));
					writelog(msg);
			        TextDrawShowForPlayer(i,tdLCavalos);
			        SendClientMessage(i, COLOR_RED2, "Loteria de cavalos - Comandos:");
			        SendClientMessage(i, COLOR_WHITE, "/apostarcavalo [cavalo] [quantia] : Para apostar em um cavalo!");
			        AreaLCavalos[i] = 1;
				}
			}
			else if(X >= 2133.3506 && X <= 2202.0874 && Y >= -1997.1613 && Y <= -1961.8463){
			    if(AreaLixao[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no LIX√O/FERRO-VELHO.",PlayerName(playerid));
					writelog(msg);
			        TextDrawShowForPlayer(i,tdLixao);
			        AreaLixao[i] = 1;
				}
			}
			else if((X >= 1997.4874 && X <= 2038.1327 && Y >= -1450.3445&& Y <= -1401.6718) || (X >= 1173.6530 && X <= 1184.8798 && Y >= -1353.3738 && Y <= -1305.6914)){
				if(AreaHosp[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no HOSPITAL.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Hospital);
					AreaHosp[i] = 1;
				}
			}
			else if(X >= 2521.7185 && X <= 2535.7808 && Y >= -1720.9760 && Y <= -1699.4797){
			    if(AreaDesmanche[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no B…CO DO DESMANCHE.",PlayerName(playerid));
					writelog(msg);
			        TextDrawShowForPlayer(i,tdDesmanche);
			        AreaDesmanche[i] = 1;
				}
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675) || (X >= 590.5313 && X <= 635.5209 && Y >= 1674.5238 && Y <= 1707.7955 || (X >= 1374.8701 && X <= 1390.7919 && Y >= 460.7597 && Y <= 461.7661))){
			    if(AreaPosto[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no POSTO.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >=-94.9835 && X <= -89.6581 && Y >= -1184.5673 && Y <= -1147.5620) ||(X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 2629.4885  && X <=2649.0012 && Y >=1093.5876 && Y <=1117.8594)|| (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    if(AreaPosto[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no POSTO.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) ||(X >= 53.4239 && X <= 90.0274 && Y >= 1204.0210 && Y <= 1224.3071) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    if(AreaPosto[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no POSTO.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if( (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
			    if(AreaPosto[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no POSTO.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 1368.9551 && X <= 1408.8533 && Y >= 1763.6663 && Y <= 1776.5144) || (X >= -1274.6521 && X <= -1220.1176 && Y >= -91.9231 && Y <= -101.3978) || (X >= 1364.6108 && X <= 1464.9171 && Y >= -2473.7749 && Y <= -2406.1863)){
			    if(AreaPosto[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no POSTO.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu veÌculo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 703.5037 && X <= 746.5966 && Y >= -1505.7843 && Y <= -1475.8815)){
			    if(AreaCoopPesca[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na COOPERATIVA DE PESCA.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,tdCoopPesca);
                	AreaCoopPesca[i] = 1;
				}
			}
			else if(X >= -542.2603 && X <= -505.6189 && Y >= 2546.9524 && Y <= 2637.3440){
				if(AreaCarga[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na ¡REA DE CARGA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawShowForPlayer(i,tdAreaCarga);
				    AreaCarga[i] = 1;
				}
			}
			else if(X >= -70.6976 && X <= -40.9113 && Y >= -1159.8073 && Y <= -1101.6296){
				if(AreaDescarga[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na ¡REA DE DESCARGA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawShowForPlayer(i,tdAreaDescarga);
				    AreaDescarga[i] = 1;
				}
			}
			else if(X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717){
			    if(AreaFazenda[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na FAZENDA.",PlayerName(playerid));
					writelog(msg);
			    	TextDrawShowForPlayer(i,tdPlant);
				    AreaFazenda[i] = 1;
				}
			}
			else if(X >= -1098.3835 && X <= -1080.9955 && Y >= -1280.2528 && Y <= -1268.6240){
			    if(Leite[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no CURRAL DAS VACAS.",PlayerName(playerid));
					writelog(msg);
			    	TextDrawShowForPlayer(i,tdLeite);
				    Leite[i] = 1;
				}
			}
		    else if(X >= -1086.2097 && X <= -1040.9519 && Y >= -1232.5966 && Y <= -1156.6401){
		        if(AreaCoopFazenda[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na ¡REA DE COLHEITA.",PlayerName(playerid));
					writelog(msg);
		            TextDrawShowForPlayer(i,tdColheita);
					AreaCoopFazenda[i] = 1;
				}
			}
		    else if(X >= 2520.7192 && X <= 2597.7166 && Y >= 1962.3511 && Y <= 2001.7731){
		        if(AreaForte[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na ¡REA FORTE.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,tdForte);
					AreaForte[i] = 1;
				}
			}
			else if(X >= -2135.8237 && X <= -2018.0640 && Y >= 198.6757 && Y <= 308.0062){
				if(Construcao[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na CONSTRU«√O.",PlayerName(playerid));
					writelog(msg);
  					TextDrawShowForPlayer(i,tdConstrucao);
			    	Construcao[i] = 1;
				}
			}
			else if(X >= 2114.5352 && X <= 2138.9673 && Y >= -1160.7681 && Y <= -1119.3993){
			    if(AreaCustomizacao[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na LOJA DE CUSTOMIZA«√O.",PlayerName(playerid));
					writelog(msg);
			        TextDrawShowForPlayer(i,tdCustomizacao);
			        SendClientMessage(i, COLOR_VERDE_AQUA, "Bem vindo ‡ Loja de CustomizaÁ„o!");
			        SendClientMessage(i, COLOR_RED2, "Comandos disponÌveis:");
			        SendClientMessage(i, COLOR_WHITE, "/mudarplaca [placa] : Mudar a placa de seu veÌculo. Custo: $200");
			        SendClientMessage(i, COLOR_WHITE, "/consertarcar : Consertar o seu veÌculo. Custo: $100");
			        SendClientMessage(i, COLOR_WHITE, "/pintarcar [cor1] [cor2] : Pintar o seu veÌculo. Custo: $50");
			        SendClientMessage(i, COLOR_WHITE, "/comprarkit : Comprar o kit de travas e alarmes. Custo: $2500");
			   		AreaCustomizacao[i] = 1;
				}
			}
		    else if(X >= 600.7289 && X <= 697.5099 && Y >= 817.7690 && Y <= 876.9632){
			    if(PedreiraCarga[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na PEDREIRA.",PlayerName(playerid));
					writelog(msg);
			        TextDrawShowForPlayer(i,tdPdCarga);
			   		PedreiraCarga[i] = 1;
				}
			}
			else if(X >= 184.5647 && X <= 230.9916 && Y >= -1461.1041 && Y <= -1410.0316){
			    if(AreaLocadora[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na LOCADORA.",PlayerName(playerid));
					writelog(msg);
			        TextDrawShowForPlayer(i,tdLocadora);
			   		AreaLocadora[i] = 1;
			   		if(Profissao[i] == LOCADOR_DE_CARROS){
			   		    SendClientMessage(i, COLOR_PALHA, "Bem vindo ‡ locadora de carros!");
			   		    SendClientMessage(i, COLOR_PALHA, "Aqui È onde ficam os carros que vocÍ pode alugar para os outros jogadores.");
					}
					else{
					    SendClientMessage(i, COLOR_PALHA, "Bem vindo ‡ locadora de carros!");
					    SendClientMessage(i, COLOR_PALHA, "Aqui temos carros de Ûtima qualidade para vocÍ alugar.");
					    SendClientMessage(i, COLOR_PALHA, "Se quiser alugar um, peÁa para um locador de carros!");
					}
				}
			}
		    else if(X >= 1201.4354 && X <= 1222.2795 && Y >= -12.2048 && Y <= 9.5224){
			    if(AreaStrip[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na ¡REA DE STRIP.",PlayerName(playerid));
					writelog(msg);
					TextDrawShowForPlayer(i,tdStrip);
					SendClientMessage(i,COLOR_CORRETOR,"VocÍ entrou na Boate. No Balc„o vocÍ pode se servir com drinks e petiscos.");
					SetPlayerCheckpoint(i, 1215.8606,-13.3520,1000.9219,2.0);
				    CheckpointStatus[i] = NOBAR;
				    AreaStrip[i] = 1;
					new name[MAX_PLAYER_NAME];
		   			if(Profissao[i] == PROSTITUTA){
						GetPlayerName(playerid,name,sizeof(name));
						SendClientMessage(i,COLOR_ROSA, "VocÍ pode danÁar aqui para seus clientes basta digitar /strip-tease [id].");
						SendClientMessage(i,COLOR_ROSA, "Ou ent„o vocÍ poder· digitar /fazerstrip e fazer strip para todos os jogadores.");
					   	AreaStrip[i] = 1;
					}
				}
			}
		    else if(X >= 474.3334 && X <= 505.7307 && Y >= -26.1547 && Y <= -1.7711){
			    if(AreaBar[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no BAR.",PlayerName(playerid));
					writelog(msg);
     				TextDrawShowForPlayer(i,tdBar);
					SendClientMessage(i,COLOR_CORRETOR,"VocÍ entrou no Bar. No Balc„o vocÍ pode se servir com drinks e petiscos.");
     				SetPlayerCheckpoint(i,499.9472,-20.8251,1000.6797,2.0);
     				CheckpointStatus[i] = NOBAR;
					AreaBar[i] = 1;
				}
			}
		    else if(X >= 487.8045 && X <= 511.8313 && Y >= -83.0083 && Y <= -67.9435){
			    if(AreaBar[i] == 0){
	            	new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou no BAR.",PlayerName(playerid));
					writelog(msg);
	     			TextDrawShowForPlayer(i,tdBar);
					SendClientMessage(i,COLOR_CORRETOR,"VocÍ entrou no Bar. No Balc„o vocÍ pode se servir com drinks e petiscos.");
					SetPlayerCheckpoint(i,498.6165,-75.9877,998.7578,2.0);
				    CheckpointStatus[i] = NOBAR;
					AreaBar[i] = 1;
				}
			}
			else if((X >= 1559.7327 && X <= 1576.1588 && Y >= -1898.0133 && Y <= -1881.8749)){
			    if(AreaSorveteria[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na SORVETERIA.",PlayerName(playerid));
					writelog(msg);
     				TextDrawShowForPlayer(i,tdSorveteria);
					SendClientMessage(i,COLOR_RED2,"VocÍ entrou em uma sorveteria.");
					SendClientMessage(i,COLOR_RED2,"Para tomar sorvete digite /tomarsorvete");
					AreaSorveteria[i] = 1;
				}
			}
		    else if(X >= 2092.0557 && X <= 2105.0586 && Y >= -1821.3566 && Y <= -1790.9103){
			    if(PizzariaCar[i] == 0){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s entrou na PIZZARIA.",PlayerName(playerid));
					writelog(msg);
			        TextDrawShowForPlayer(i,tdPizzaria);
			   		PizzariaCar[i] = 1;
				}
			}
			else {
			    if(AreaLocadora[i] == 1){
			        TextDrawHideForPlayer(i,tdLocadora);
			        new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da LOCADORA.",PlayerName(playerid));
					writelog(msg);
			        AreaLocadora[i] = 0;
				}
			    if(AreaDesmanche[i] == 1){
			        TextDrawHideForPlayer(i,tdDesmanche);
			        new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu do BECO DO DESMANCHE.",PlayerName(playerid));
					writelog(msg);
			        AreaDesmanche[i] = 0;
				}
				if(AreaLixao[i] == 1){
				    TextDrawHideForPlayer(i,tdLixao);
				    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu do LIX√O/FERRO-VELHO.",PlayerName(playerid));
					writelog(msg);
				    AreaLixao[i] = 0;
				}
				if(AreaCoopFazenda[i] == 1){
				    TextDrawHideForPlayer(i,tdColheita);
				    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da ¡REA DE COLHEITA.",PlayerName(playerid));
					writelog(msg);
				    AreaCoopFazenda[i] = 0;
				}
				if(AreaFazenda[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da FAZENDA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,tdPlant);
				    AreaFazenda[i] = 0;
				}
				if(Leite[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu do CURRAL DAS VACAS.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,tdLeite);
				    Leite[i] = 0;
				}
				if(AreaBanco[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu do BANCO.",PlayerName(playerid));
					writelog(msg);
					TextDrawHideForPlayer(i,Banco);
					AreaBanco[i] = 0;
				}
				if(AreaPosto[i] == 1) {
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu do POSTO.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,Posto);
				    AreaPosto[i] = 0;
				}
				if(AreaLCavalos[i] == 1) {
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da LOTERIA DE CAVALOS.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,tdLCavalos);
				    AreaLCavalos[i] = 0;
				}
				if(AreaCustomizacao[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da LOJA DE CUSTOMIZA«√O.",PlayerName(playerid));
					writelog(msg);
					TextDrawHideForPlayer(i,tdCustomizacao);
					AreaCustomizacao[i] = 0;
				}
				if(AreaForte[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da ¡REA FORTE.",PlayerName(playerid));
					writelog(msg);
					TextDrawHideForPlayer(i,tdForte);
					AreaForte[i] = 0;
				}
				if(AreaDelegacia[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da DELEGACIA.",PlayerName(playerid));
					writelog(msg);
					TextDrawHideForPlayer(i,tdDelegacia);
					AreaDelegacia[i] = 0;
				}
				if(AreaDeleg[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da DELEGACIA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,Delegacia);
				    AreaDeleg[i] = 0;
				}
				if(AreaHosp[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu do HOSPITAL.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,Hospital);
				    AreaHosp[i] = 0;
				}
				if(AreaPesca[i] == 1) {
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da ¡REA DE PESCA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,tdPesca);
				    AreaPesca[i] = 0;
				}
				if(AreaCoopPesca[i] == 1) {
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da COOPERATIVA DE PESCA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,tdCoopPesca);
				    AreaCoopPesca[i] = 0;
				}
				if(AreaHotel[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu de um HOTEL.",PlayerName(playerid));
					writelog(msg);
					TextDrawHideForPlayer(i,Hotel);
					AreaHotel[i] = 0;
				}
			    if(PedreiraCarga[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da PEDREIRA.",PlayerName(playerid));
					writelog(msg);
			        TextDrawHideForPlayer(i,tdPdCarga);
			   		PedreiraCarga[i] = 0;
				}
				if(Construcao[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da CONSTRU«√O.",PlayerName(playerid));
					writelog(msg);
  					TextDrawHideForPlayer(i,tdConstrucao);
			    	Construcao[i] = 0;
				}
				if(AreaCreditos[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da Loja 24/7.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,td247);
				    AreaCreditos[i] = 0;
				}
				if(AreaCarga[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da ¡REA DE CARGA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,tdAreaCarga);
				    AreaCarga[i] = 0;
				}
				if(AreaStrip[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da ¡REA DE STRIP.",PlayerName(playerid));
					writelog(msg);
			        TextDrawHideForPlayer(i,tdStrip);
			        DisablePlayerCheckpoint(playerid);
			        CheckpointStatus[playerid] = NONE;
			        AreaStrip[i] = 0;
				}
				if(AreaDescarga[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da ¡REA DE DESCARGA.",PlayerName(playerid));
					writelog(msg);
				    TextDrawHideForPlayer(i,tdAreaDescarga);
				    AreaDescarga[i] = 0;
				}
				if(AreaBombShop[i] == 1) {
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da LOJA DE BOMBAS.",PlayerName(playerid));
					writelog(msg);
				    AreaBombShop[i] = 0;
				}
				if(PizzariaCar[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da PIZZARIA.",PlayerName(playerid));
					writelog(msg);
			        TextDrawHideForPlayer(i,tdPizzaria);
			        PizzariaCar[i] = 0;
				}
				if(AreaSorveteria[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu da SORVETERIA.",PlayerName(playerid));
					writelog(msg);
			        TextDrawHideForPlayer(i,tdSorveteria);
			        AreaSorveteria[i] = 0;
			    }
			    if(AreaBar[i] == 1){
                    new msg[256];
					format(msg,sizeof(msg),"SERVIDOR: %s saiu do Bar.",PlayerName(playerid));
					writelog(msg);
			        TextDrawHideForPlayer(i,tdBar);
			        AreaBar[i] = 0;
			        DisablePlayerCheckpoint(playerid);
			        CheckpointStatus[playerid] = NONE;
			    }
			}
		}
	}
}

public ApostasdeCavalos()
{
	new string[256];
    if(TemJogador == 1){
        new largada = minrand(1,8);
		SendClientMessageToAll(COLOR_PURPLE, "    ");
		format(string, sizeof(string), "%s Larga na Frente!",CavalosLargada[largada]);
		SendClientMessageToAll(COLOR_WHITE, string);
		SendClientMessageToAll(COLOR_PURPLE, "    ");
		cavalin[0] = largada;
		TemJogador = 0;
		SetTimer("Intermediaria2",5000,0);
	}
}
public Intermediaria2(){
	new rand = random(2);
	new string[256];
	if(rand == 0){
		format(string, sizeof(string), "%s Continua na frente... e chegua aos 200 metros da prova.",CavalosLargada[cavalin[0]]);
		SendClientMessageToAll(COLOR_WHITE, string);
		SetTimer("Intermediaria3",5000,0);
		return 1;
	}
	if(rand == 1){
	    new largada2 = minrand(1,8);
	    while(cavalin[0] == largada2){
	    	largada2 = minrand(1,8);
		}
		format(string, sizeof(string), "%s ultrapassa %s e agora assume a lideranÁa",CavalosLargada[largada2],CavalosLargada[cavalin[0]]);
		SendClientMessageToAll(COLOR_WHITE, string);
		cavalin[0] = largada2;
		SetTimer("Intermediaria3",5000,0);
		return 1;
	}
	return 1;
}
public Intermediaria3(){
	new rand = random(2);
	new largada2 = minrand(1,8);
	while(cavalin[0] == largada2){
	    largada2 = minrand(1,8);
	}
	new string[256];
	if(rand == 0){
	    if(largada2 == cavalin[0]){
			format(string, sizeof(string), "%s continua mandando e continua isolado aos 500 metros da prova.",CavalosLargada[cavalin[0]]);
			SendClientMessageToAll(COLOR_WHITE, string);
			SetTimer("Intermediaria4",5000,0);
			return 1;
		} else {
			format(string, sizeof(string), "%s ainda tem corredores perto dele e chega aos 500 metros da prova em primeiro.",CavalosLargada[cavalin[0]]);
			SendClientMessageToAll(COLOR_WHITE, string);
			cavalin[0] = largada2;
			SetTimer("Intermediaria4",5000,0);
			return 1;
		}
	}
	if(rand == 1){
	    if(largada2 != cavalin[0]){
			format(string, sizeof(string), "Espere Espere! %s foi ultrapassado por %s perto da linha de chegada aos 500 metros da prova.",CavalosLargada[cavalin[0]],CavalosLargada[largada2]);
			SendClientMessageToAll(COLOR_WHITE, string);
			cavalin[0] = largada2;
			SetTimer("Intermediaria4",5000,0);
			return 1;
		} else {
			format(string, sizeof(string), "%s n„o conseguiu segurar por muito tempo e foi ultrapassado por %s",CavalosLargada[cavalin[0]], CavalosLargada[largada2]);
			SendClientMessageToAll(COLOR_WHITE, string);
			cavalin[0] = largada2;
			SetTimer("Intermediaria4",5000,0);
			return 1;
		}
	}
	return 1;
}
public Intermediaria4(){
	new rand = random(2);
	new string[256];
 	SendClientMessageToAll(COLOR_WHITE, "A corrida vai chegando ao fim com seus 100 ˙ltimos metros.");
	if(rand == 0){
		format(string, sizeof(string), "Olhe Olhe!!! %s Segue precionado no final ˙ltimos metros e....!",CavalosLargada[cavalin[0]]);
		SendClientMessageToAll(COLOR_WHITE, string);
		Pressionado = 1;
		cavalin[1] = Pressionado;
		SetTimer("Intermediaria5",5000,0);
		return 1;
	}
	if(rand == 1){
		format(string, sizeof(string), "%s seque tranquilo e isolado vai cruzar em primeiro e",CavalosLargada[cavalin[0]]);
		SendClientMessageToAll(COLOR_WHITE, string);
		SetTimer("Intermediaria5",5000,0);
		return 1;
	}
	return 1;
}
public Intermediaria5(){
	new cavalos = minrand(1,8);
	new string[256];
	new grana;
	while(cavalos == cavalin[0]){
	    cavalos = minrand(1,8);
	}
	if(Pressionado == 1){
	    new rand = random(5);
		if(rand == 0 || rand == 1 || rand == 2 || rand == 3){
			format(string, sizeof(string), "Pressionado %s perde a lideranÁa para %s que acaba por ganhar a corrida.",CavalosLargada[cavalin[0]],CavalosLargada[cavalos]);
			SendClientMessageToAll(COLOR_WHITE, string);
			format(string, sizeof(string), "~r~%s ~w~VENCEU!",CavalosLargada[cavalos]);
	        GameTextForAll(string,3000,0);
	        for(new i=0; i<MAX_PLAYERS; i++){
	            if(CPlayerDentro[i] == true){
					if(CavaloApostado[i] == cavalos){
					    grana = ValorApostado[i]*4;
					    CPlayerDentro[i] = false;
					    GivePlayerMoney(i,grana);
					    SendClientMessage(i, COLOR_GREEN, "Muito bem! VocÍ apostou no cavalo certo e recebeu $10000!");
						CavaloApostado[i] = 0;
						ValorApostado[i] = 0;
					}
					else{
					    SendClientMessage(i, COLOR_RED, "VocÍ apostou no cavalo errado! Se quiser pode tentar apostar novamente.");
					    CavaloApostado[i] = 0;
					}
				}
			}
		} else if(rand == 4){
			format(string, sizeof(string), "Mesmo pressionado %s consegue ganhar a corrida!",CavalosLargada[cavalin[0]]);
			SendClientMessageToAll(COLOR_WHITE, string);
			format(string, sizeof(string), "~r~%s ~w~VENCEU!",CavalosLargada[cavalin[0]]);
	        GameTextForAll(string,3000,0);
	        for(new i=0; i<MAX_PLAYERS; i++){
	            if(CPlayerDentro[i] == true){
					if(CavaloApostado[i] == cavalin[0]){
					    grana = ValorApostado[i]*4;
					    CPlayerDentro[i] = false;
					    GivePlayerMoney(i,grana);
					    SendClientMessage(i, COLOR_GREEN, "Muito bem! VocÍ apostou no cavalo certo e recebeu $10000!");
						CavaloApostado[i] = 0;
						ValorApostado[i] = 0;
					}
					else{
					    SendClientMessage(i, COLOR_RED, "VocÍ apostou no cavalo errado! Se quiser pode tentar apostar novamente.");
					    CavaloApostado[i] = 0;
					}
				}
			}
		}
	} else {
        new rand = random(5);
		if(rand == 0 || rand == 1 || rand == 2 || rand == 3){
			format(string, sizeof(string), "Isolado e seguro %s vence a corrida!",CavalosLargada[cavalin[0]]);
			SendClientMessageToAll(COLOR_WHITE, string);
			format(string, sizeof(string), "~r~%s ~w~VENCEU!",CavalosLargada[cavalin[0]]);
	        GameTextForAll(string,3000,0);
	        for(new i=0; i<MAX_PLAYERS; i++){
	            if(CPlayerDentro[i] == true){
					CPlayerDentro[i] = false;
					if(CavaloApostado[i] == cavalin[0]){
					    grana = ValorApostado[i]*4;
					    GivePlayerMoney(i,grana);
					    SendClientMessage(i, COLOR_GREEN, "Muito bem! VocÍ apostou no cavalo certo e recebeu $10000!");
						CavaloApostado[i] = 0;
						ValorApostado[i] = 0;
					}
					else{
					    SendClientMessage(i, COLOR_RED, "VocÍ apostou no cavalo errado! Se quiser pode tentar apostar novamente.");
					    CavaloApostado[i] = 0;
					}
				}
			}
			return 1;
		} else if(rand == 4){
			format(string, sizeof(string), "%s Cantou vitÛria antes do tempo!!! E %s acabou ultrapassando e vencendo a corrida.",CavalosLargada[cavalin[0]],CavalosLargada[cavalos]);
			SendClientMessageToAll(COLOR_WHITE, string);
			format(string, sizeof(string), "~r~%s ~w~VENCEU!",CavalosLargada[cavalos]);
	        GameTextForAll(string,3000,0);
	        for(new i=0; i<MAX_PLAYERS; i++){
	            if(CPlayerDentro[i] == true){
					CPlayerDentro[i] = false;
					if(CavaloApostado[i] == cavalos){
					    grana = ValorApostado[i]*4;
					    GivePlayerMoney(i,grana);
					    SendClientMessage(i, COLOR_GREEN, "Muito bem! VocÍ apostou no cavalo certo e recebeu $10000!");
						CavaloApostado[i] = 0;
						ValorApostado[i] = 0;
					}
					else{
					    SendClientMessage(i, COLOR_RED, "VocÍ apostou no cavalo errado! Se quiser pode tentar apostar novamente.");
					    CavaloApostado[i] = 0;
					}
				}
			}
		}
	}
	TemJogador = 0;
	return 1;
}
public LoteriaComeco()
{
	new rand1, rand2;
	new loteria;
	rand1 = minrand(1,21);
	rand2 = minrand(1,21);
	while(rand2 == rand1){
		rand2 = minrand(1,21);
	}
	new string[256];
	SendClientMessageToAll(COLOR_PURPLE, "    ");
	format(string, sizeof(string), "Os N˙meros da Loteria sorteados S√O ....... N∫1 = %d , N∫2 = %d", rand1, rand2);
	SendClientMessageToAll(COLOR_WHITE, string);
	SendClientMessageToAll(COLOR_PURPLE, "    ");
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i) && PlayerDentro[i])
		{
			for(new j = 0; j < 2; j++)
			{
			    if(Aposta[i][j] == rand1 || Aposta[i][j] == rand2)
				{
			        Acertos[i]++;
			    }
			    Aposta[i][j]=0;
			}
			if(Acertos[i] > 1){
			    loteria = GranaTotal();
			    SendClientMessageToAll(COLOR_ORANGE, "   ");
				format(string, sizeof(string),"Loteria NotÌcias: %s GANHOU $%d na Loteria! ParabÈns!! Tente vocÍ tambÈm!",PlayerName(i),loteria);
				SendClientMessageToAll(COLOR_ORANGE,string);
				SendClientMessageToAll(COLOR_ORANGE, "   ");
				GameTextForPlayer(i,"~r~$ PARABENS !!! $",5000,5);
				GivePlayerMoney(i,loteria);
			    Acertos[i]=0;
			    PlayerDentro[i]=false;
				SetTimer("LoteriaComeco",500000,false);
			}else{
				SendClientMessage(i,COLOR_GREEN, "Seu palpite estava errado, mas vocÍ pode jogar novamente, basta ir na loteria e digitar:");
				SendClientMessage(i,COLOR_WHITE, "/loteria [1-20] [1-20]");
				PlayerDentro[i]=false;
				SetTimer("LoteriaComeco",500000,false);
			}
	   	 }
	}
}

stock GranaTotal()
{
	new randnum = random(LoteriaMax-LoteriaMin);
	return randnum+LoteriaMin;
}
public Assalto(playerid){
	TempoAssalto[playerid]=0;
    SendClientMessage(playerid,COLOR_TRAFICANTE, "A poeira baixou, j· È possÌvel que vocÍ realize outro Assalto.");
}
public AssaltanteSaiu(playerid){
	new string[256];
	new rand = random(100);
	if(rand <= 15) {
	    SendClientMessage(playerid, COLOR_RED, "AVISO : Os policiais est„o atr·s de vocÍ!");
		format(string, sizeof(string), "%s suspeito de assaltar um banco nas proximidades de: %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
		SendClientMessagePolicia(COLOR_COP_SWAT, string);
		return 1;
	}
	else {
        SendClientMessage(playerid,COLOR_GREEN, "Que jogada, roubo bem articulado. Os policiais nem sabem aonde procurar!");
        return 1;
	}
}
public Conversa21b(playerid){
	  SendClientMessage(playerid, COLOR_MOTORISTA, "Ok senhor!");
	  SetTimerEx("Conversa22bb",3000,0,"d",playerid);
}
public Conversa22bb(playerid){
      SetPlayerPos(playerid,1702.4198,1480.2014,10.7774);
	  SetPlayerFacingAngle(playerid,69.6255);
      SendClientMessage(playerid, COLOR_MOTORISTA, "Chegamos senhor!");
      SetTimerEx("Conversa22b",3000,0,"d",playerid);
}
public Conversa22b(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Bom... Tenho que te dizer uma coisa!");
	  ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
	  SetTimerEx("Conversa23b",2000,0,"d",playerid);
}
public Conversa23b(playerid){
	  SendClientMessage(playerid, COLOR_MOTORISTA, "Sim senhor!");
	  SetTimerEx("Conversa24b",2000,0,"d",playerid);
}
public Conversa24b(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "J· que vou para Los Santos! Terei que demiti-lo...");
      ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
	  SetTimerEx("Conversa25b",2500,0,"d",playerid);
}
public Conversa25b(playerid){
	  SendClientMessage(playerid, COLOR_MOTORISTA, "Pois È! Eu entendo senhor!");
	  SetTimerEx("Conversa26b",2000,0,"d",playerid);
}
public Conversa26b(playerid){
	  SendClientMessage(playerid, COLOR_MOTORISTA, "Seu amigo Mark me ofereceu um emprego em Liberty City");
	  SetTimerEx("Conversa27b",2500,0,"d",playerid);
}
public Conversa27b(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Ohhh! O Mark est· indo para Liberty City? Ele nem me contou!");
      ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
	  SetTimerEx("Conversa28b",3000,0,"d",playerid);
}
public Conversa28b(playerid){
	  SendClientMessage(playerid, COLOR_MOTORISTA, "Pois È senhor! Estou indo para l·...");
	  SetTimerEx("Conversa29b",2500,0,"d",playerid);
}
public Conversa29b(playerid){
	  SendClientMessage(playerid, COLOR_MOTORISTA, "Vou partir amanh„ cedo da viagem e chegarei l· ‡ noite...");
	  SetTimerEx("Conversa21c",2500,0,"d",playerid);
}
public Conversa21c(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Hum... Aqui est· o seu pagamento! Adeus...");
	  ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
	  SetTimerEx("Conversa22c",2500,0,"d",playerid);
}
public Conversa22c(playerid){
	  SendClientMessage(playerid, COLOR_MOTORISTA, "Adeus senhor!");
	  SetTimerEx("Conversa23c",2000,0,"d",playerid);
}
public Conversa23c(playerid){
	  TogglePlayerControllable(playerid,1);
      SendClientMessage(playerid, COLOR_JUIZ, "V· dentro do aeroporto pegar sua passagem!");
      SetPlayerCheckpoint(playerid,1673.8569,1448.1935,10.7842,3.0);
      StatusCheck[playerid] = PEGAR_PASSAGEM;
}
public Conversa23cc(playerid){
	  SendClientMessage(playerid, COLOR_ORANGE, "Boa tarde senhor! Em que posso ajuda-lo?");
	  SetTimerEx("Conversa24c",2000,0,"d",playerid);
}
public Conversa24c(playerid){
      SendClientMessage(playerid, COLOR_WHITE, "Boa tarde! Vim aqui pegar uma passagem para Los Santos que reservei, das 1:00 atÈ ‡s 4:00");
      ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
      SetTimerEx("Conversa25c",2000,0,"d",playerid);
}
public Conversa25c(playerid){
	  SendClientMessage(playerid, COLOR_ORANGE, "Ahhh sim... Aqui est· sua passagem! S„o $500");
	  SetTimerEx("Conversa26c",2000,0,"d",playerid);
}
public Conversa26c(playerid){
	  ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
	  SendClientMessage(playerid, COLOR_WHITE, "Aqui est· o dinheiro!");
	  SetTimerEx("Conversa27c",2500,0,"d",playerid);
}
public Conversa27c(playerid){
	  ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
	  SendClientMessage(playerid, COLOR_ORANGE, "Obrigado pela prefÍrencia senhor! Boa viagem!");
	  SetTimerEx("Conversa28c",3500,0,"d",playerid);
}
public Conversa28c(playerid){
      TogglePlayerControllable(playerid, 1);
   	  SetPlayerInterior(playerid,1);
	  SetPlayerPos(playerid, 2.384830,33.103397,1199.849976);
	  SendClientMessage(playerid, COLOR_ORANGE, "A viagem vai demorar um pouco portanto se acomode bem em nosso avi„o!");
	  SetTimerEx("Conversa29c",4000,0,"d",playerid);
}
public Conversa29c(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Vou ligar para o Mark para ver o que ele anda aprontando!");
	  SetTimerEx("AcaoEspecial",2000,0,"dd",playerid,SPECIAL_ACTION_USECELLPHONE);
	  SetTimerEx("Conversa21d",5000,0,"d",playerid);
}
public Conversa21d(playerid){
	  SendClientMessage(playerid, COLOR_TURQUESA, "Mark Falando!");
      SetTimerEx("Conversa22d",2000,0,"d",playerid);
}
public Conversa22d(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Eai Mark!");
      SetTimerEx("Conversa23d",2000,0,"d",playerid);
}
public Conversa23d(playerid){
	  SendClientMessage(playerid, COLOR_TURQUESA, "Opa! Amigo, como vai?");
      SetTimerEx("Conversa24d",2500,0,"d",playerid);
}
public Conversa24d(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Vou bem! Fiquei sabendo que vocÍ est· indo para Liberty City!");
      SetTimerEx("Conversa25d",3000,0,"d",playerid);
}
public Conversa25d(playerid){
	  SendClientMessage(playerid, COLOR_TURQUESA, "Sim vou! Meu primo vai abrir uma empresa de limosines l· e me pediu pra administrar 20 por cento dela");
      SetTimerEx("Conversa25dd",4000,0,"d",playerid);
}
public Conversa25dd(playerid){
      SendClientMessage(playerid, COLOR_TURQUESA, "AÌ eu aceitei! E contratei seu motorista pra ver se ele queria, agora ele me ligou e disse que aceita o emprego");
	  SetTimerEx("Conversa26d",4000,0,"d",playerid);
}
public Conversa26d(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Estou indo para Los Santos! ComeÁar uma nova vida... Las Venturas est· muito chato!");
	  SetTimerEx("Conversa27d",3000,0,"d",playerid);
}
public Conversa27d(playerid){
      SendClientMessage(playerid, COLOR_TURQUESA, "Pois È amigo! Nunca mais vamos nos rever... Adeus cara agora vo ter que desligar o celular");
	  SetTimerEx("Conversa28d",4000,0,"d",playerid);
}
public Conversa28d(playerid){
      SendClientMessage(playerid, COLOR_WHITE, "Adeus!");
      SetTimerEx("AcaoEspecial",1000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
	  SetTimerEx("Conversa29d",10000,0,"d",playerid);
}
public ConversaB1(playerid){
    SendClientMessage(playerid, COLOR_WHITE, "Exatamente...");
    SetTimerEx("ConversaB2",3000,0,"d",playerid);
}
public ConversaB2(playerid){
    SendClientMessage(playerid, COLOR_RED, "T· tudo aÌ?");
    SetTimerEx("ConversaB3",3000,0,"d",playerid);
}
public ConversaB3(playerid){
   	SendClientMessage(playerid, COLOR_WHITE, "Acho que sim...");
    SetTimerEx("ConversaB4",3000,0,"d",playerid);
}
public ConversaB4(playerid){
   	SendClientMessage(playerid, COLOR_RED, "N„o abriu ele n„o nÈ porra?");
    SetTimerEx("ConversaB5",3000,0,"d",playerid);
}
public ConversaB5(playerid){
   	SendClientMessage(playerid, COLOR_WHITE, "Nem cherei!");
    SetTimerEx("ConversaB6",3000,0,"d",playerid);
}
public ConversaB6(playerid){
    SendClientMessage(playerid, COLOR_WHITE, "Toma...");
    SetTimerEx("ConversaB4b",3000,0,"d",playerid);
}
public ConversaB4b(playerid){
    SendClientMessage(playerid, COLOR_RED, "J· mandei depositarem a sua grana...");
    SendClientMessage(playerid, COLOR_RED, "Agora pegue a porra do sabre e sai· dessa cidade! Tem roupas no carro.");
    SetTimerEx("ConversaB5b",3000,0,"d",playerid);
}
public ConversaB5b(playerid){
	TogglePlayerControllable(playerid,1);
    SendClientMessage(playerid, COLOR_JUIZ, "V· atÈ o aeroporto...");
    SetPlayerCheckpoint(playerid, -1408.6481,-299.2098,14.1484, 2.0);
    SetTimerEx("ConversaRoupa",15000,0,"d",playerid);
    StatusCheck[playerid] = AERO;
}
public ConversaRoupa(playerid){
	dini_IntSet(PlayerName(playerid),"Skin",250);
	SetPlayerSkin(playerid,250);
}
public Conversa29d(playerid){
      new Float:X = 1685.4244;
	  new Float:Y = -2333.4529;
	  new Float:Z = 13.5469;
	  new Float:ang = 360;
	  dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
	  dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
  	  dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
	  dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
      SetPlayerPos(playerid,1685.4244,-2333.4529,13.5469);
      SetPlayerInterior(playerid,0);
      SetPlayerFacingAngle(playerid,360);
      SendClientMessage(playerid, COLOR_WHITE, "Finalmente... Los Santos! Meu novo lar.");
      SetTimerEx("Conversa21e",3000,0,"d",playerid);
}
public Conversa21e(playerid){
	SetPlayerSkin(playerid,186);
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_GREEN, "VocÍ chegou em Los Santos, vocÍ pode procurar 1 Hotel");
	SendClientMessage(playerid, COLOR_JUIZ,  "VocÍ possue $10000 no banco para comeÁar a viver");
	SendClientMessage(playerid, COLOR_WHITE, "O radar informa aonde vocÍ possa conseguir uma profiss„o e comece a trabalhar");
	SendClientMessage(playerid, COLOR_ROSA,  "Antes de comeÁar a jogar leia nossas regras. Digite /regras1 e /regras2");
	GameTextForPlayer(playerid,"~w~ Los ~g~Santos", 5000,0);
	StatusCheck[playerid] = AGENCIA;
	SetPlayerCheckpoint(playerid, 1310.4824,-1368.2488,13.5471, 3.0);
	ChatNotDisable[playerid] = 0;
	PlayerPlaySound(playerid, 1186, 0.0,0.0,0.0);
	dini_IntSet(PlayerName(playerid),"HistoriaFeita",1);
	dini_IntSet(PlayerName(playerid),"Banco",10000);
}
public Conversa21(playerid){
      TogglePlayerControllable(playerid,0);
      SendClientMessage(playerid, COLOR_WHITE, "Estou cansado daqui!");
	  SetTimerEx("Conversa22",2500,0,"d",playerid);
}
public Conversa22(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Acho que vou comeÁar a viver em San Fierro ou Los Santos!");
	  SetTimerEx("Conversa23",2500,0,"d",playerid);
}
public Conversa23(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "………, vou pra Los Santos...");
	  SetTimerEx("Conversa24",5000,0,"d",playerid);
	  SetTimerEx("AcaoEspecial",2000,0,"dd",playerid,SPECIAL_ACTION_USECELLPHONE);
}
public Conversa24(playerid){
	  SendClientMessage(playerid, COLOR_ORANGE, "Aeroporto Virtual Air, boa tarde!");
	  SetTimerEx("Conversa25",3000,0,"d",playerid);
}
public Conversa25(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Boa tarde! Eu gostaria de uma passagem para Los Santos!");
	  SetTimerEx("Conversa26",2500,0,"d",playerid);
}
public Conversa26(playerid){
	  SendClientMessage(playerid, COLOR_ORANGE, "Para Los Santos temos das 1:00 atÈ ‡s 4:00 e das 7:00 atÈ ‡s 11:00...");
	  SetTimerEx("Conversa27",2500,0,"d",playerid);
}
public Conversa27(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Vou querer das 1:00 atÈ ‡s 4:00");
	  SetTimerEx("Conversa28",2500,0,"d",playerid);
}
public Conversa28(playerid){
	  SendClientMessage(playerid, COLOR_ORANGE, "Ok senhor, sua passagem foi reservada!");
	  SetTimerEx("Conversa29",2000,0,"d",playerid);
}
public Conversa29(playerid){
	  SendClientMessage(playerid, COLOR_WHITE, "Estou indo para aÌ imediatamente!");
	  SetTimerEx("AcaoEspecial",1000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
	  TogglePlayerControllable(playerid,1);
	  SendClientMessage(playerid, COLOR_JUIZ, "V· atÈ seu motorista para ele lhe levar atÈ o Aeroporto Virtual Air!");
	  DisablePlayerCheckpoint(playerid);
	  SetPlayerCheckpoint(playerid,1905.2314,2086.2603,10.8203,3.0);
	  StatusCheck[playerid] = CONVERSA_MOTORISTA;
}
public Conversa1(playerid){
	ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
    SendClientMessage(playerid, COLOR_WHITE,"Sim, estou...");
    SetTimerEx("Conversa2",2500,0,"d",playerid);
}
public Conversa2(playerid){
    SendClientMessage(playerid, COLOR_RED2, "O local de entrega È na casa do Rick em Las Venturas.");
    SetTimerEx("Conversa3",2500,0,"d",playerid);
}
public Conversa3(playerid){
    ApplyAnimation(playerid,"PED","IDLE_CHAT",2.1,1,1,1,1,1);
	SendClientMessage(playerid, COLOR_WHITE,"T· certo, sei aonde È.");
    SetTimerEx("Conversa3b",3500,0,"d",playerid);
}
public Conversa3b(playerid){
	SendClientMessage(playerid, COLOR_WHITE,"Porque n„o mostra o seu rosto?");
    SetTimerEx("Conversa4",2500,0,"d",playerid);
}
public Conversa4(playerid){
	SendClientMessage(playerid, COLOR_RED2,	"Pra que vocÍ quer ver idiota? V· logo deixar essa droga e n„o pergunte nada!");
    SetTimerEx("Conversa5",4000,0,"d",playerid);
}
public Conversa5(playerid){
	ApplyAnimation(playerid,"PED","IDLE_CHAT",1.1,1,1,1,1,1);
	SendClientMessage(playerid, COLOR_WHITE, "Quanto vou receber pelo transporte?");
    SetTimerEx("Conversa6",2000,0,"d",playerid);
}
public Conversa6(playerid){
	SendClientMessage(playerid, COLOR_RED2,  "Vou mandar alguÈm depositar o dinheiro, AGORA V¡!");
	DisablePlayerCheckpoint(playerid);
	SetTimerEx("Conversa7",2000,0,"d",playerid);
}
public Conversa7(playerid){
	SendClientMessage(playerid, COLOR_JUIZ, "V· para a casa do Rick entregar o pacote, vocÍ pode chamar 1 taxi ou pegar 1 moto dos Triads, mais tem que deixar na casa dele.");
	DisablePlayerCheckpoint(playerid);
	TogglePlayerControllable(playerid,1);
	SetPlayerCheckpoint(playerid,1404.7666,1897.6353,11.4609,2.0);
	StatusCheck[playerid] = ENTREGANDORICK;
}
public Conversa7b(playerid){
	SendClientMessage(playerid, COLOR_JUIZ, "Rick n„o est· em casa.");
	DisablePlayerCheckpoint(playerid);
	SetTimerEx("Conversa8",2000,0,"d",playerid);
}
public Conversa8(playerid){
	SetTimerEx("AcaoEspecial",1000,0,"dd",playerid,SPECIAL_ACTION_USECELLPHONE);
    SetTimerEx("AcaoEspecial",3000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
  	TogglePlayerControllable(playerid,1);
   	SetTimerEx("Conversa8b",1000,0,"d",playerid);
}
public Conversa8b(playerid){
    TogglePlayerControllable(playerid,0);
    SendClientMessage(playerid, COLOR_RED2, "Deixe a droga no telhado, atr·s do ar-condicionado!");
   	SendClientMessage(playerid, COLOR_RED2, "N„o esqueÁa de sair pelos fundos! IMBECIL!");
   	ApplyAnimation(playerid,"PED", "phone_out", 4.0, 0, 0, 0, 0, 0);
   	SetTimerEx("Conversa9",4000,0,"d",playerid);
}
public Conversa9(playerid){
    TogglePlayerControllable(playerid,1);
    SetPlayerCheckpoint(playerid,1409.9528,1894.3324,15.2443,1.5);
    StatusCheck[playerid] = TELHADO;
}
public Conversa10(playerid){
    TogglePlayerControllable(playerid,0);
    SetPlayerFacingAngle(playerid,270);
	SendClientMessage(playerid, COLOR_WHITE, "Isso n„o È vida! Pra que vivo nessa merda, essa vida È um verdadeiro LIXO!");
	SetTimerEx("Conversa11",3000,0,"d",playerid);
}
public Conversa11(playerid){
	SendClientMessage(playerid, COLOR_WHITE, "Quero comeÁar algo novo, sem erros.");
    SetTimerEx("Conversa12",3000,0,"d",playerid);
}
public Conversa12(playerid){
    TogglePlayerControllable(playerid,1);
	SendClientMessage(playerid, COLOR_WHITE, "Acho que vou fazer isso mesmo.");
	SetTimerEx("Conversa12b",3000,0,"d",playerid);
}
public Conversa12b(playerid){
	SendClientMessage(playerid, COLOR_WHITE, "Vou comeÁar uma vida nova em Los Santos.");
	SetTimerEx("Conversa13",5000,0,"d",playerid);
}
public Conversa13(playerid){
    SendClientMessage(playerid, COLOR_WHITE, "… …! VOU PRA LOS SANTOS.");
    SetPlayerCheckpoint(playerid,1673.8569,1448.1935,10.7842,3.0);
    StatusCheck[playerid] = AERO;
}
public Conversa14(playerid){
    TogglePlayerControllable(playerid, 1);
   	SetPlayerInterior(playerid,1);
	SetPlayerPos(playerid, 2.384830,33.103397,1199.849976);
	SendClientMessage(playerid, COLOR_PESCADOR, "Seja Bem-Vindo senhor as linhas Virtual Air.");
	SetTimerEx("Conversa14b",3000,0,"d",playerid);
}
public Conversa14b(playerid){
	SendClientMessage(playerid, COLOR_PESCADOR, "Logo estaremos pousando em Los Santos. A viagem durar· cerca de 30 minutos.");
	SetTimerEx("Conversa15",3000,0,"d",playerid);
}
public Conversa15(playerid){
	SendClientMessage(playerid, COLOR_WHITE, "Obrigado...");
	SetTimerEx("Conversa16",22000,0,"d",playerid);
}
public Conversa16(playerid)
{
    new Float:X = 1685.4244;
	new Float:Y = -2333.4529;
	new Float:Z = 13.5469;
	new Float:ang = 360;
	dini_FloatSet(PlayerName(playerid),"SpawnPosX",X);
	dini_FloatSet(PlayerName(playerid),"SpawnPosY",Y);
	dini_FloatSet(PlayerName(playerid),"SpawnPosZ",Z);
	dini_FloatSet(PlayerName(playerid),"SpawnPosAng",ang);
	SetPlayerPos(playerid,1685.4244,-2333.4529,13.5469);
	SetPlayerInterior(playerid,0);
	SetPlayerFacingAngle(playerid,360);
    SendClientMessage(playerid, COLOR_WHITE, "Ahhhh... estou pronto para comeÁar a vida.");
	SetTimerEx("Conversa17",5000,0,"d",playerid);
}
public Conversa17(playerid){
    TogglePlayerControllable(playerid, 1);
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_WHITE, "-----------------------------------------------------------------------------------------------------------------------------");
    SendClientMessage(playerid, COLOR_GREEN, "VocÍ chegou em Los Santos, vocÍ pode procurar 1 Hotel");
	SendClientMessage(playerid, COLOR_JUIZ,  "TambÈm o dinheiro do transporte est· no BANCO foram depositados $5000 dÛlares");
	SendClientMessage(playerid, COLOR_WHITE, "O radar informa aonde vocÍ possa conseguir uma profiss„o e comece a trabalhar");
	SendClientMessage(playerid, COLOR_ROSA,  "Antes de comeÁar a jogar leia nossas regras. Digite /regras1 e /regras2");
	GameTextForPlayer(playerid,"~w~ Los ~g~Santos", 5000,0);
	StatusCheck[playerid] = AGENCIA;
	SetPlayerCheckpoint(playerid, 1310.4824,-1368.2488,13.5471, 3.0);
	ChatNotDisable[playerid] = 0;
	PlayerPlaySound(playerid, 1186, 0.0,0.0,0.0);
	dini_IntSet(PlayerName(playerid),"HistoriaFeita",1);
}
public ConversaA1(playerid){
    TogglePlayerControllable(playerid, 0);
    SendClientMessage(playerid, COLOR_PESCADOR, "Gostaria de uma passagem senhor?");
    SetTimerEx("ConversaA2",3000,0,"d",playerid);
}
public ConversaA2(playerid){
    SendClientMessage(playerid, COLOR_WHITE, "Sim gostaria, para Los Santos");
    SetTimerEx("ConversaA3",3000,0,"d",playerid);
}
public ConversaA3(playerid){
    SendClientMessage(playerid, COLOR_PESCADOR, "Ok, Senhor o pagamento ser· realizado na sua conta");
    SetTimerEx("ConversaA4",3000,0,"d",playerid);
}
public ConversaA4(playerid){
  	ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
    SendClientMessage(playerid, COLOR_WHITE, "Est· aqui meu cart„o.");
    SetTimerEx("ConversaA5",3000,0,"d",playerid);
}
public ConversaA5(playerid){
    SendClientMessage(playerid, COLOR_PESCADOR, "Ok senhor aguarde... Seu avi„o sair· em 12 minutos");
   	SetTimerEx("Conversa14",8000,0,"d",playerid);
}
public Desmancheveiculo(playerid) {
    if(Profissao[playerid] == ASSALTANTE){
	new string[256];
	new n = random(MAX_DESMANCHEVEICULO);
	format(string, sizeof(string),"Aew! Maluco t· afim de discolar um carro pra nÛs? Que tal um(a) %s?", Veiculosprocuradosnome[n]);
	SendClientMessageAssalt(COLOR_AZULPLUS, string);
	Veiculoprocurado = Veiculosprocurados[n];
	}
	return 1;
}
public DrogasPlant(playerid)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
		CocainaMao[playerid]--;
		MaconhaMao[playerid]--;
		HeroinaMao[playerid]--;
		PlantandoDrogas[playerid] = 0;
		DrogasPlantadas[GetPlayerVehicleID(playerid)]++;
		TogglePlayerControllable(playerid,1);
		SendClientMessage(playerid, COLOR_LIDER_DE_TRAFICO, "Drogas plantadas com sucesso!");
		new str[256];
		format(str,sizeof(str),"Esse veiculo est· com %d drogas plantadas agora!",DrogasPlantadas[GetPlayerVehicleID(playerid)]);
		SendClientMessage(playerid, COLOR_WHITE, str);
		RemovePlayerFromVehicle(playerid);
	}
}
public Pesca(playerid)
{
	new rand = random(100);
	if(rand <= 70) {
		QtPescas[playerid]++;
		dini_IntSet(PlayerName(playerid),"Pesca",QtPescas[playerid]);
		QtIscas[playerid]--;
		dini_IntSet(PlayerName(playerid),"Iscas",QtIscas[playerid]);
		PescaInProgress[playerid] = 0;
		SendClientMessage(playerid,COLOR_GREEN,"Sua rede voltou. Se quiser continuar pescando, fique a vontade.");
		SendClientMessage(playerid,COLOR_GREEN,"Se n„o, v· a cooperativa de pescas e venda seu pescado.");
		new string[256];
		format(string,sizeof(string),"Agora seu pescado È de %d peixes.",QtPescas[playerid]);
		SendClientMessage(playerid, COLOR_PESCADOR, string);
		if(Profissao[playerid] == PESCADOR) AcrescentarExPoints(playerid,1);
	}
	else {
	 	new grana;
	 	new string[256];
		grana = minrand(50,200);
		format(string, sizeof(string), "Infelizmente vocÍ n„o pescou nada! E gastou iscas e mantimentos. O prejuÌzo foi de $%d",grana);
	    SendClientMessage(playerid, COLOR_PESCADOR, string);
		SendClientMessage(playerid,COLOR_PESCADOR,"Mas vocÍ pode continuar pescando se quiser!");
		GivePlayerMoney(playerid, -grana);
		QtIscas[playerid]--;
		dini_IntSet(PlayerName(playerid),"Iscas",QtIscas[playerid]);
		PescaInProgress[playerid] = 0;
		return 1;
	}
	return 1;
}
public ZerarResultadoMostrado() MostrouResultado = 0;
public ZerarSalarioEntregue() SalarioEntregue = 0;
public ZerarAnuncioPrevisao() PrevisaoAnunciada = 0;
public InicioTribunal(plid,plid2,playerid){
	new msg[256];
	format(msg,sizeof(msg),"O Tribunal entre %s e %s iniciou a partir de agora!",PlayerName(plid),PlayerName(plid2));
	SendClientMessageToAll(COLOR_JUIZ,msg);
	SendClientMessageToAll(COLOR_JUIZ,"Agora os dois est„o abertos para declaraÁıes ao juiz.");
	declaracoesabertas[plid] = 1;
	declaracoesabertas[plid2] = 1;
	Audiencia[playerid] = 1;
	SetTimerEx("Veredicto2",60000,0,"d",playerid);
}
public Veredicto2(playerid){
	GameTextForAll("~g~Veredicto em ~w~2 minutos",3000,0);
	SetTimerEx("Veredicto",120000,0,"d",playerid);
}
public Veredicto(playerid){
	GameTextForAll("~w~O ~g~Juiz ~w~vai ~n~~w~dar o ~n~~g~Veredicto",3000,0);
	SendClientMessage(playerid, COLOR_CORRETOR, "Sr. Juiz declare um /culpado ou acabe com o tribunal /fimtribunal.");
}
public InicioTribunal2(plid,plid2,playerid){
	GameTextForPlayer(plid,"~w~Mesa do ~g~Juiz",3000,0);
	GameTextForPlayer(plid2,"~w~Mesa do ~g~Juiz",3000,0);
	GameTextForPlayer(playerid,"~w~Sua Mesa ~g~Juiz",3000,0);
	SetPlayerPos(playerid,238.5303,109.7634,1010.2188);
	SetPlayerPos(plid,234.7509,108.8359,1010.2118);
	SetPlayerPos(plid2,234.8474,111.4288,1010.2188);
	TogglePlayerControllable(plid,0);
	TogglePlayerControllable(plid2,0);
	SetPlayerInterior(plid,10);
	SetPlayerInterior(plid2,10);
	SetPlayerInterior(playerid,10);
	SetPlayerFacingAngle(plid, 270);
	SetPlayerFacingAngle(plid2, 270);
	SetPlayerFacingAngle(playerid, 90);
	SendClientMessageToAll(COLOR_JUIZ, "Os re˙s est„o impossibilitados de andar.");
}
public Fazenda(playerid)
{
	new rand = random(100);
	if(rand <= 60) {
		QtMilho[playerid]++;
		FazendaInProgress[playerid] = 0;
		SendClientMessage(playerid,COLOR_AGRICULTOR,"Ù ZÈ! A colheita e o ensacamento deu tudo certin. Se ocÍ quiser continuar plantando, pode ficar.");
		SendClientMessage(playerid,COLOR_GREEN,"Caso adverso, v· na venda do milhoe venda ele!");
        AcrescentarExPoints(playerid,1);
	 }
	 	else {
	 	new grana;
	 	new string[256];
		grana = minrand(400,1000);
		format(string, sizeof(string), "Infelizmente a colheita n„o deu certo! O prejuÌzo foi de $%d",grana);
	    SendClientMessage(playerid, COLOR_AGRICULTOR, string);
		SendClientMessage(playerid,COLOR_AGRICULTOR,"Mas ocÍ pode continuar plantando se quiser");
		GivePlayerMoney(playerid, -grana);
		FazendaInProgress[playerid] = 0;
		return 1;
	}
	return 1;
}
public ChecandoDrogas(playerid)
{
 	new grana;
 	new string[256];
	grana = minrand(800,2000);
	new rand = random(100);
	if(rand <= 50) {
		SendClientMessage(playerid,COLOR_CAMINHONEIRO,"AÌ cara t· tudo ok nÛs vamo pagar agora n„o vacila na nossa t· entendido?");
		format(string, sizeof(string),"TaÌ o teu pagamento: $%d AGORA RALA!",grana);
		SendClientMessage(playerid,COLOR_CAMINHONEIRO,string);
	 }
 	else {
		SendClientMessage(playerid,COLOR_AGRICULTOR,"Deu azar troxa! Rala daqui se n„o tu morre! N√O VAMOS PAGAR!");
		return 1;
	}
	return 1;
}
public CarregamentoGeral(playerid){
	Carregamento[playerid] = 1;
	GeralCar[playerid] = 1;
	avisado[playerid]=-1;
	new CargaGer = random(32);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,MaterialGeral[CargaGer][0],MaterialGeral[CargaGer][1],MaterialGeral[CargaGer][2],5.0);
    SendClientMessage(playerid,COLOR_CAMINHONEIRO,"O Trailer foi Carregado, v· atÈ o Local marcado no RADAR, para descarregar.");
 	TogglePlayerControllable(playerid,1);
	return 1;
}
public CarregamentoGas(playerid){
  	Carregamento[playerid] = 1;
  	GasCar[playerid] = 1;
  	avisado[playerid]=-1;
	new CargaGas = random(16);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,GasCami[CargaGas][0],GasCami[CargaGas][1],GasCami[CargaGas][2],5.0);
    SendClientMessage(playerid,COLOR_CAMINHONEIRO,"O Trailer de G·s est· carregado v· deixar no local do Mapa.");
    TogglePlayerControllable(playerid,1);
    CheckpointStatus[playerid] = NONE;
	return 1;
}
public EnchendoCarroForte(playerid){
    TogglePlayerControllable(playerid,1);
   	SendClientMessage(playerid,COLOR_TRANSPORTE_DE_VALORES,"VeÌculo Forte Carregado!");
   	SendClientMessage(playerid,COLOR_TRANSPORTE_DE_VALORES,"Ao se aproximar do banco para depositar o dinheiro È necess·rio que vocÍ digite /pegargrana, para pegar o malote de dinheiro.");
   	Carga[playerid] = 1;
   	return 1;
}
public FimCamuflagem(playerid)
{
	if(Camuflado[playerid] == 1){
		SetPlayerColor(playerid,ProfColors[Profissao[playerid]]);
		Camuflado[playerid] = 0;
		SendClientMessage(playerid, COLOR_RED, "Seu tempo de camuflagem acabou!");
		for(new i; i<MAX_PLAYERS; i++){
 		ShowPlayerNameTagForPlayer(playerid,i,1);
		}
	}
}
public ContrabandoSpawnCar(playerid){
	SetPlayerCheckpoint(playerid,2236.5403,-2213.8721,13.5469,3.0);
	SendClientMessage(playerid, COLOR_CONTRABANDISTA, "Pegue algum desses carros!");
	PodePegar[playerid] = 1;
}
public LeiteA(playerid){
	QtLeite[playerid]++;
	LeiteInProgress[playerid] = 0;
	ApplyAnimation( playerid,"ped", "fucku", 4.1, 0, 1, 1, 1, 1 );
	SendClientMessage(playerid,COLOR_AGRICULTOR,"CÍ tirÙ todo o leite da vaca. V· vender l· na fazenda cumpade.Se quiser continuar pegando nas teta.");
	SendClientMessage(playerid,COLOR_AGRICULTOR,"Caso adverso, v· atÈ a ·rea de venda do milho/leite e o venda.");
    AcrescentarExPoints(playerid,1);
}
public Prostituir(playerid)
{
	ApplyAnimation(playerid,"benchpress","gym_bp_up_B",4.1,0,1,1,1,1);
	SendClientMessage(playerid, COLOR_ROSA, "Para mudar de posiÁ„o digite /mudarposicao");
    AcrescentarExPoints(playerid,1);
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
public Anunciou(playerid) JaAnunciou[playerid] = 0;
public Comeu(plid,playerid){
    JaComi[plid] = 0;
    JaVendi[playerid] = 0;
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
public CloseGate(gateid){
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
public PortaoCoordChecker(){
	new Float:X, Float:Y, Float:Z;
	for(new p; p<4; p++){
	    new Plocalizado;
	    for(new i; i<MAX_PLAYERS; i++){
	        new vehicleid = GetPlayerVehicleID(i);
			if(IsPlayerConnected(i) && Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_SWAT || Profissao[i] == JUIZ || Profissao[i] == DELEGADO || GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 523){
			    GetPlayerPos(i,X,Y,Z);
				if(GetDistanceToObject(i,Portao[p]) < 15) {
					Plocalizado=1;
				}
			}
		}
		if(Plocalizado == 1){
			if(DelegaAbrindo[p] == 0 && DelegaAberto[p] == 0){
				for(new i=0; i<MAX_PLAYERS; i++){
			    DelegaAbrindo[p]=1;
				SetTimerEx("OpenPortao",50,0,"d",p);
			}
		}
		} else {
		    if(DelegaFechando[p] == 0 && DelegaAberto[p] == 1){
		        DelegaFechando[p]=1;
		        SetTimerEx("ClosePortao",50,0,"d",p);
			}
		}
	}
	return 1;
}
public AbrirPortaoAutoEscola(){
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) && Profissao[i] == INSTRUTOR && GetDistanceToObject(i,portaoauto) < 15){
			MoveObject(portaoauto,1812.637,-2061.904,15.347,2);
			AbrindoPortaoAuto = 1;
			KillTimer(FechandoPortaoAuto);
			FechandoPortaoAuto = SetTimer("TerminarAbrirPortaoAuto",7000,0);
        }
	}
}
public FecharPortaoAutoEscola(){
	if(AbrindoPortaoAuto == 0){
		MoveObject(portaoauto,1812.601,-2071.738,15.326,2);
	}
}
public TerminarAbrirPortaoAuto() AbrindoPortaoAuto = 0;
public DestruirPickupGrana(playerid,pickup)
{
	DestroyPickup(pickup);
	TogglePlayerControllable(playerid,1);
}

public OpenPortao(objectid){
	if(objectid == 0) MoveObject(Portao[objectid],1573.791382, -1638.426270, 14.854576,1.5);
	if(objectid == 1) MoveObject(Portao[objectid],2342.546387, 2454.905029, 7.249487,1.5);
	if(objectid == 2) MoveObject(Portao[objectid],2294.102539, 2511.015137, 4.946327,1.5);
	if(objectid == 3) MoveObject(Portao[objectid],-1631.699219, 688.715637, 8.709263,1.5);
	DelegaAbrindo[objectid]=0;
	DelegaAberto[objectid]=1;
}
public ClosePortao(objectid){
	if(objectid == 0) MoveObject(Portao[objectid],1592.921753, -1638.546753, 14.789343,1.0);
	if(objectid == 1) MoveObject(Portao[objectid],2334.678711, 2443.014404, 7.259488,1.0);
	if(objectid == 2) MoveObject(Portao[objectid],2294.276123, 2503.250488, 4.719362,1.0);
	if(objectid == 3) MoveObject(Portao[objectid],-1648.476563, 688.514648, 8.543203,1.0);
	DelegaFechando[objectid]=0;
	DelegaAberto[objectid]=0;
}
public VoteKickTimer(){
	if (gdebug >= 3){printf("DEBUG VoteKickTimer()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
		{
		if(IsPlayerConnected(i) == 1 && VoteKick[i] > 0)
		{
			VoteKick[i]++;
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
					format(string, sizeof(string), "VOTO FALHOU: %s n„o saira do server",accused);
					SendClientMessageToAll(COLOR_RED,string);
					ClearVote(i);
				}
			}
		}
	}
}
public Cobrar(playerid)
{
	new string[256];
	if(dini_Int(PlayerName(playerid),"Divida") > 0){
	SendClientMessage(playerid, COLOR_RED, "|-------------------------------------------- ATEN«√O --------------------------------------------|");
	SendClientMessage(playerid, COLOR_RED, "VocÍ n„o pagou suas dÌvidas e o banco acrescentou um JUROS de 15 por cento ‡ mais nelas.");
	format(string, sizeof(string), "Ou seja, agora suas dÌvidas s„o: $%d", dini_Int(PlayerName(playerid),"Divida")+dini_Int(PlayerName(playerid),"Divida")*15/100);
	SendClientMessage(playerid, COLOR_WHITE, string);
	dini_IntSet(PlayerName(playerid),"Divida",dini_Int(PlayerName(playerid),"Divida")+dini_Int(PlayerName(playerid),"Divida")*15/100);
	TimerDivida[playerid] = SetTimerEx("Cobrar",900000,false,"d",playerid);
	}
}
public ClearVote(kickedid){
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
stock ServirSobremesa(playerid,sobremesa)
{
    if(GetPlayerMoney(playerid) < SobremesasValor[sobremesa]){
	    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro paga pagar a sobremesa...");
	    return 1;
	}
	SendClientMessage(playerid, COLOR_GREEN, "Sobremesa servida...");
	new str[256];
	format(str,sizeof(str),"VocÍ est· comendo um %s",SobremesasName[sobremesa]);
	SendClientMessage(playerid, COLOR_GREEN, str);
	GivePlayerMoney(playerid,-SobremesasValor[sobremesa]);
	TogglePlayerControllable(playerid,0);
	SetTimerEx("ComerSobremesa",10000,0,"d",playerid);
	return 1;
}
public ComerSobremesa(playerid)
{
	TogglePlayerControllable(playerid,1);
	SendClientMessage(playerid, COLOR_GREEN, "VocÍ terminou de comer/tomar sua sobremesa...");
}
stock ServirComida(playerid,comida)
{
    if(GetPlayerMoney(playerid) < ComidasValor[comida]){
	    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro paga pagar a comida...");
	    return 1;
	}
	if(comida == 7) Bebida[playerid]--;
	SendClientMessage(playerid, COLOR_GREEN, "Comida servida...");
	new str[256];
	format(str,sizeof(str),"VocÍ est· comendo um %s",ComidasName[comida]);
	SendClientMessage(playerid, COLOR_GREEN, str);
	GivePlayerMoney(playerid,-ComidasValor[comida]);
	AddPlayerHealth(playerid,50);
	TogglePlayerControllable(playerid,0);
	SetTimerEx("ComerComida",25000,0,"d",playerid);
	return 1;
}
public ComerComida(playerid)
{
	TogglePlayerControllable(playerid,1);
	SendClientMessage(playerid, COLOR_GREEN, "VocÍ terminou de comer sua comida...");
}
stock ServirSuco(playerid,suco)
{
	switch(ComLeite[playerid])
	{
		case 0 :
  		{
	        if(GetPlayerMoney(playerid) < 10){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro!");
			    return 1;
			}
			else{
			    new string[256];
			    format(string,sizeof(string),"VocÍ tomou um suco de %s c/ agua!",SucosName[suco]);
			    SendClientMessage(playerid, COLOR_GREEN, string);
			    AddPlayerHealth(playerid,10);
			    GivePlayerMoney(playerid,-10);
			    return 1;
			}
		}
		case 1 :
		{
			if(GetPlayerMoney(playerid) < 14){
			    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro!");
			    return 1;
			}
			else{
			    new string[256];
			    format(string,sizeof(string),"VocÍ tomou um suco de %s c/ leite!",SucosName[suco]);
			    SendClientMessage(playerid, COLOR_GREEN, string);
			    AddPlayerHealth(playerid,15);
			    GivePlayerMoney(playerid,-14);
			    return 1;
			}
		}
	}
	return 1;
}
stock ServirBebida(playerid,bebida)
{
	if(GetPlayerMoney(playerid) < BebidasValor[bebida]){
	    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro paga pagar a bebida...");
	    return 1;
	}
	if(bebida == 4) Bebida[playerid] = Bebida[playerid] + 5;
	SendClientMessage(playerid, COLOR_GREEN, "Bebida servida...");
	new str[256];
	format(str,sizeof(str),"VocÍ est· bebendo um(a) %s",BebidasName[bebida]);
	SendClientMessage(playerid, COLOR_GREEN, str);
	GivePlayerMoney(playerid,-BebidasValor[bebida]);
	AddPlayerHealth(playerid,5);
	TogglePlayerControllable(playerid,0);
	SetTimerEx("TomarBebida",15000,0,"d",playerid);
	return 1;
}
public TomarBebida(playerid)
{
	TogglePlayerControllable(playerid,1);
	SendClientMessage(playerid, COLOR_GREEN, "VocÍ terminou de tomar sua bebida...");
}
public TomarSorvete(playerid)
{
	new Float:Vida;
	GetPlayerHealth(playerid,Vida);
	SetPlayerHealth(playerid,Vida+5);
	TomandoSorvete[playerid] = 0;
	TogglePlayerControllable(playerid,1);
	SendClientMessage(playerid, COLOR_PALHA, "VocÍ terminou de tomar o seu sorvete!");
}

public Taxi(){
	for(new i=0; i<MAX_PLAYERS; i++){
		if(Taximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 3){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 3;
				format(string, sizeof(string), "TaxÌmetro: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COLOR_RED, "VocÍ n„o tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(Taximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
                if(JogadorContratado(Taximetro[i][1],1)) AcrescentarLucro(1,PrecoCorrida[i]/4*3);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				Taximetro[i][1] = 0;
				Taximetro[i][0] = 0;
				NoTaxi[i] = 0;
			}
		}
		if(ATaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 15){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 15;
				format(string, sizeof(string), "Aero-TaxÌmetro: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_TAXI_AEREO, string);
				SendClientMessage(ATaximetro[i][1], COLOR_TAXI_AEREO, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 15){
				SendClientMessage(i, COLOR_RED, "VocÍ n„o tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(ATaximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(ATaximetro[i][1], PrecoCorrida[i]);
				if(JogadorContratado(ATaximetro[i][1],1)) AcrescentarLucro(1,PrecoCorrida[i]/4*3);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				ATaximetro[i][1] = 0;
				ATaximetro[i][0] = 0;
				NoTaxi[i] = 0;
			}
		}
		if(MTaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 5){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 5;
				format(string, sizeof(string), "Moto-TaxÌmetro: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_MOTOTAXI, string);
				SendClientMessage(MTaximetro[i][1], COLOR_MOTOTAXI, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 5){
				SendClientMessage(i, COLOR_RED, "VocÍ n„o tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(MTaximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(MTaximetro[i][1], PrecoCorrida[i]);
				if(JogadorContratado(MTaximetro[i][1],1)) AcrescentarLucro(1,PrecoCorrida[i]/4*3);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				MTaximetro[i][1] = 0;
				MTaximetro[i][0] = 0;
				NoTaxi[i] = 0;
			}
		}
	}
}
public DoencaAtaca()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(JogadorDoente[i] == 1){
			new Float:Health;
			GetPlayerHealth(i,Health);
			SetPlayerHealth(i,Health-5);
			ApplyAnimation(i, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
		}
	}
}
public Doenca(){
    for(new i=0; i<MAX_PLAYERS; i++){
        new dodoi = random(4);
        new string[256];
        if(JogadorDoente[i] == 0){
	        if(dodoi == 0 || dodoi == 1 || dodoi == 2){
	            return 0;
	        }
	        else if(dodoi == 3){
	            format(string,sizeof(string),"AtenÁ„o! %s foi surpreendido com uma epidemia de Dengue nos arredores de %s e est· DOENTE. N„o cheguem perto dele!",PlayerName(i),zones[player_zone[i]][zone_name]);
                SendClientMessageToAll(COLOR_RED2, string);
				SendClientMessage(i, COLOR_PALHA, "VocÍ foi contaminado, procure 1 paramÈdico apenas ele pode lhe curar.");
	            SendClientMessage(i, COLOR_WHITE, "ATEN«√O! n„o chegue perto de ninguÈm vocÍ acabar· contaminando-o.");
				JogadorDoente[i] = 1;
				dini_IntSet(PlayerName(i),"Doenca",1);
				SetPlayerWeather(i,-41);
				ApplyAnimation(i, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
                SetTimerEx("PassarDoenca",50,0,"d",i);
                return 0;
		   }
		}
	}
	return 1;
}
public PassarDoenca(playerid){
    SetTimerEx("PassarDoenca",50,0,"d",playerid);
    for(new i=0; i<MAX_PLAYERS; i++){
		if(GetDistanceBetweenPlayers(playerid,i) < 20){
		    if(JogadorDoente[playerid] == 1){
		        if(Profissao[i] != PARAMEDICO){
					if(JogadorDoente[i] == 0){
		            	new string[256];
						format(string,sizeof(string),"Ihhh! COF.. COF.. CUIDADO LOS SANTOS %s pegou a doenÁa de %s.",PlayerName(i), PlayerName(playerid));
						SendClientMessageToAll(COLOR_RED2, string);
		            	format(string, sizeof(string),"%s Passou a DoenÁa para vocÍ",PlayerName(playerid));
	                	SendClientMessage(i, COLOR_WHITE, string);
	                	JogadorDoente[i] = 1;
						SetPlayerWeather(i,-41);
						ApplyAnimation(i, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
	                	GameTextForAll("~r~Cuidem-~w~se",3000,0);
						SetTimerEx("PassarDoenca",50,0,"d",i);
					}
				}
			}
		}
	}
	return 1;
}
public TomandoRemedio1(plid,playerid){
	SendClientMessage(plid, COLOR_RED2, "AÌ que dor...");
	SendClientMessage(plid, COLOR_PARAMEDICO, "Tome o medicamento..");
	SendClientMessage(playerid, COLOR_RED2, "AÌ que dor...");
	SendClientMessage(playerid, COLOR_PARAMEDICO, "Tome o medicamento..");
	ApplyAnimation(plid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
	SetTimerEx("TomandoRemedio2",3000,0,"dd",playerid,plid);
	return 1;
}
public TomandoRemedio2(playerid,plid){
	SendClientMessage(plid, COLOR_PARAMEDICO, "Acalme-se tome o remÈdio. Ele tem aÁ„o r·pida");
	SendClientMessage(playerid, COLOR_PARAMEDICO, "Acalme-se tome o remÈdio. Ele tem aÁ„o r·pida");
    ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
	SetTimerEx("TomandoRemedio3",3000,0,"dd",playerid,plid);
	return 1;
}
public TomandoRemedio3(playerid,plid){
	SendClientMessage(plid, COLOR_RED2, "Obrigado.");
	SendClientMessage(plid, COLOR_PARAMEDICO, "Aguarde o medicamento sofrer efeito...");
	SendClientMessage(playerid, COLOR_RED2, "Obrigado.");
	SendClientMessage(playerid, COLOR_PARAMEDICO, "Aguarde o medicamento sofrer efeito...");
	SetTimerEx("TomandoRemedio4",20000,0,"d",playerid,plid);
	return 1;
}
public TomandoRemedio4(playerid,plid){
	new string[256];
	JogadorDoente[plid] = 0;
	dini_IntSet(PlayerName(plid),"Doenca",0);
	SetPlayerWeather(plid,0);
	SendClientMessage(plid, COLOR_JUIZ, "Est·s curado!");
	format(string,sizeof(string),"Ufa! %s n„o apresenta nenhum risco a cidade o paramÈdico aplicou o medicamento e o mesmo se encontra saud·vel.",PlayerName(plid));
	SendClientMessageToAll(COLOR_RED2, string);
	format(string, sizeof(string),"%s est· curado graÁas a vocÍ. VocÍ recebeu pelo tratamento.",PlayerName(plid));
	SendClientMessage(playerid, COLOR_WHITE, string);
	GivePlayerMoney(plid,-600);
    GivePlayerMoney(playerid,600);
	AcrescentarExPoints(playerid,1);
	kitmedico[playerid] = kitmedico[playerid] -1;
	Curando[playerid] = 0;
	return 1;
}
public SellHouse(playerid)
{
	if(IsPlayerConnected(playerid)){
	    new rand = random(5);
	    if(rand == 0 || rand == 1){
	        SendClientMessage(playerid, COLOR_GREEN, "A corretora Virtual's'House conseguiu vender sua casa.");
			VenderCasa(playerid);
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Infelizmente a corretora Virtual's'House n„o conseguiu vender sua casa.");
		}
	}
}
public ZerarAvisoVelocidade(playerid) avisovelo[playerid] = 0;
public Speed()
{
	new Float:x,Float:y,Float:z;
	new Float:distance,value,string[256];
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i))
		{
			TextDrawDestroy(Speedo[i]);
		}
	}
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i)){
	    	new vehicleid = GetPlayerVehicleID(i);
			if(!strcmp(PlayerName(i),Dono[vehicleid],true)){
			}
			if(strcmp(PlayerName(i),Dono[vehicleid],true)){
				if(strcmp(PlayerName(i),"Server",true)){
				}
			}
			GetPlayerPos(i, x, y, z);
			distance = floatsqroot(floatpower(floatabs(floatsub(x,SavePlayerPos[i][LastX])),2)+floatpower(floatabs(floatsub(y,SavePlayerPos[i][LastY])),2)+floatpower(floatabs(floatsub(z,SavePlayerPos[i][LastZ])),2));
			value = floatround(distance * 5000);
			if(UpdateSeconds > 1)
			{
				value = floatround(value / UpdateSeconds);
			}
			new Float:VEHLIFE;
			GetVehicleHealth(vehicleid,VEHLIFE);
			new speedplayer = floatround(value/1000);
			if(speedplayer <= 40){
 				format(string,sizeof(string),"~g~Veiculo: ~w~%s ~n~~b~KM/H: ~w~%d ~b~Gas:~w~%d ~n~~g~Saude: ~w~%d ~n~~b~Dono: ~w~%s",CarName[GetVehicleModel(GetPlayerVehicleID(i))-400],floatround(value/1000),GPV[GetPlayerVehicleID(i)],floatround(VEHLIFE),Dono[vehicleid]);
			}
			else if(speedplayer > 40 && speedplayer < 120){
			    format(string,sizeof(string),"~g~Veiculo: ~w~%s ~n~~b~KM/H: ~h~~y~%d ~b~Gas:~w~%d ~n~~g~Saude: ~w~%d ~n~~b~Dono: ~w~%s",CarName[GetVehicleModel(GetPlayerVehicleID(i))-400],floatround(value/1000),GPV[GetPlayerVehicleID(i)],floatround(VEHLIFE),Dono[vehicleid]);
			}
			else if(speedplayer >= 120){
			    format(string,sizeof(string),"~g~Veiculo: ~w~%s ~n~~b~KM/H: ~r~%d ~b~Gas:~w~%d ~n~~g~Saude: ~w~%d ~n~~b~Dono: ~w~%s",CarName[GetVehicleModel(GetPlayerVehicleID(i))-400],floatround(value/1000),GPV[GetPlayerVehicleID(i)],floatround(VEHLIFE),Dono[vehicleid]);
			    if(avisovelo[i] == 0){
					SendClientMessage(i, COLOR_RED, "CUIDADO: VocÍ est· andando em alta velocidade! Poder· levar uma multa se for pego no radar");
					SendClientMessage(i, COLOR_RED, "Por favor diminua essa velocidade antes que aconteÁa algum acidente!");
					avisovelo[i] = 1;
					SetTimerEx("ZerarAvisoVelocidade",180000,0,"d",i);
				}
			}
			Velocidade[i] = floatround(value/1000);
			Speedo[i] = TextDrawCreate(320.00, 380.00, string);
			TextDrawSetOutline(Speedo[i], 0);
			TextDrawFont(Speedo[i], 3);
			TextDrawSetProportional(Speedo[i], 2);
			TextDrawAlignment(Speedo[i], 2);
			TextDrawShowForPlayer (i, Speedo[i]);
		}
		SavePlayerPos[i][LastX] = x;
		SavePlayerPos[i][LastY] = y;
		SavePlayerPos[i][LastZ] = z;
	}
	return 1;
}
stock ComprarPropriedade(playerid,propriedade)
{
    new string[256];
    if(GetPlayerMoney(playerid) < ValoresPropriedades[propriedade]){
	    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro!");
	    return 1;
	}
	if(DonoDaPropriedade(playerid,propriedade)){
		SendClientMessage(playerid, COLOR_RED, "VocÍ j· È o dono dessa propriedade!");
   		return 1;
	}
	else{
	    new str[256];
		format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
		if(!fexist(str)) dini_Create(str);
   		if(strcmp(dini_Get(str,"Dono"),"NONE",true) == 0){
			GivePlayerMoney(playerid,-ValoresPropriedades[propriedade]);
   			dini_Set(str,"Dono",PlayerName(playerid));
    		dini_Set(str,"Trabalhador1","NONE");
	   		dini_Set(str,"Trabalhador2","NONE");
	   		dini_Set(str,"Trabalhador3","NONE");
    		dini_Set(str,"Trabalhador4","NONE");
    		dini_Set(str,"Trabalhador5","NONE");
    		dini_Set(str,"Trabalhador6","NONE");
    		dini_Set(str,"Trabalhador7","NONE");
    		dini_IntSet(str,"Lucro",0);
    		dini_IntSet(str,"Prejuizo",0);
    		dini_IntSet(str,"Investimento",0);
    		format(string,sizeof(string),"VocÍ comprou a %s por $%d",NomesPropriedades[propriedade],ValoresPropriedades[propriedade]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string,sizeof(string),"A propriedade %s agora tem um novo dono (%s)",NomesPropriedades[propriedade],PlayerName(playerid));
			SendClientMessageToAll(COLOR_GREEN, string);
			return 1;
		}
		else{
  			format(string,sizeof(string),"Essa propriedade j· possue um dono (%s)",dini_Get(str,"Dono"));
	    	SendClientMessage(playerid, COLOR_RED, string);
		    SendClientMessage(playerid, COLOR_RED, "Para compra-la dele use: /comprarpropriedadedodono [id] [propriedade] [valor]");
			return 1;
		}
	}
}
public CheckFuel()
 {
  for(new i=0;i<MAX_PLAYERS;i++)
   {
   	if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
   	new Vi = GetPlayerVehicleID(i);
	if(GPV[Vi] == -1) return 1;
	if(GPV[Vi] == 0){
    SendClientMessage(i,COLOR_RED,"VocÍ n„o pode andar sem gasolina!");
    SendClientMessage(i,COLOR_RED,"Saia do veÌculo com a tecla de saÌda (geralmente F ou Enter),");
    SendClientMessage(i,COLOR_RED,"peÁa para um frentista abastecer seu veÌculo ou ainda tente");
    SendClientMessage(i,COLOR_RED,"empurrar seu carro ao posto mais prÛximo e abastece-lo l·!");
    TogglePlayerControllable(i,0);
    return 1;
	}
    GPV[Vi]--;
	}
   }
  return 1;
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
    SendClientMessage(playerid, COLOR_ASSALTANTE,   "O comando /pm est· desabilitado, para mais informaÁıes digite /celularinfo");
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
stock Salario()
{
	for(new i; i<MAX_PLAYERS; i++) {
	    if(IsPlayerConnected(i)) {
			if(dini_Exists(PlayerName(i))){
				SendClientMessage(i, ProfColors[Profissao[i]], StringsSalario[Profissao[i]]);
				dini_IntSet(PlayerName(i),"Banco",dini_Int(PlayerName(i),"Banco") + IntSalario[Profissao[i]]);
			}
			if(Profissao[i] == COP_SWAT || Profissao[i] == EXERCITO || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_MILITAR || Profissao[i] == COP_NARCOTICOS || Profissao[i] == DELEGADO){
				AcrescentarExPoints(i,3);
			}
			else{
				printf("ERRO: %s n„o conseguiu receber o sal·rio pois seu arquivo n„o foi encontrado",PlayerName(i));
				return 0;
			}
		}
	}
	return 1;
}
public PagamentoSeguro()
{
    TempoPagamentoSeguro++;
    TempoPagamentoSeguro%=48;
    if(TempoPagamentoSeguro == 0){
		for(new i=0; i<MAX_PLAYERS; i++){
			if(dini_Int(PlayerName(i),"Seguro") == 1){
				if(dini_Int(PlayerName(i),"Banco") >= 200){
					dini_IntSet(PlayerName(i),"Banco",dini_Int(PlayerName(i),"Banco")-200);
					SendClientMessage(i, COLOR_GREEN, "Foi retirado $200 de seu banco para pagar o seu seguro de vida!");
                    AcrescentarLucro(3,200);
				}
				else{
					SendClientMessage(i, COLOR_RED, "Seu seguro de vida foi removido pois vocÍ n„o possue dinheiro para pagar!");
					dini_IntSet(PlayerName(i),"Seguro",0);
				}
			}
			if(dini_Int(PlayerName(i),"SeguroCasa") == 1){
			    if(dini_Int(PlayerName(i),"Banco") >= 300){
					dini_IntSet(PlayerName(i),"Banco",dini_Int(PlayerName(i),"Banco")-300);
					SendClientMessage(i, COLOR_GREEN, "Foi retirado $300 de seu banco para pagar o seu seguro de imÛvel!");
					AcrescentarLucro(3,300);
				}
				else{
					SendClientMessage(i, COLOR_RED, "Seu seguro de imÛvel foi removido pois vocÍ n„o possue dinheiro para pagar!");
					dini_IntSet(PlayerName(i),"Seguro",0);
				}
			}
		}
   	}
}

stock ComprarSorvete(playerid,sabor)
{
    if(GetPlayerMoney(playerid) >= SaborValor[sabor]){
    	TomandoSorvete[playerid] = 1;
		new string[256];
 		format(string, sizeof(string), "VocÍ est· tomando um sorvete de %s.",SaborName[sabor]);
  		SendClientMessage(playerid, COLOR_WHITE, string);
   		GivePlayerMoney(playerid,-SaborValor[sabor]);
    	TogglePlayerControllable(playerid,0);
   		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
   		ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
    	SetTimerEx("TomarSorvete",7000,false,"d",playerid);
		return 1;
	} else {
		SendClientMessage(playerid, COLOR_RED, "VocÍ n„o possue dinheiro para pagar o sorvete!");
 		return 1;
	}
}
stock VenderCasa(playerid)
{
	new string[256];
	new reembolso;
	if(dini_Int(PlayerName(playerid),"SeguroCasa") == 0){
	    SendClientMessage(playerid, COLOR_RED, "VocÍ n„o ganhou um reembolso pois n„o tinha seguro de imÛvel!");
        format(string,sizeof(string),"%s vendeu sua casa mas n„o ganhou reembolso pois n„o possuia seguro!",PlayerName(playerid));
		SendClientMessageAdmin(COLOR_WHITE, string);
	}
	else{
	    new strrand = random(3);
		if(strrand == 0) reembolso = dini_Int(PlayerName(playerid),"ValorCasa");
		if(strrand == 1) reembolso = dini_Int(PlayerName(playerid),"ValorCasa")/4*3;
		if(strrand == 2) reembolso = dini_Int(PlayerName(playerid),"ValorCasa")/2;
		if(strrand == 3) reembolso = dini_Int(PlayerName(playerid),"ValorCasa")/2;
		format(string,sizeof(string),"O reembolso foi de $%d. O dinheiro foi depositado em sua conta!",reembolso);
		SendClientMessage(playerid, COLOR_GREEN, string);
		dini_IntSet(PlayerName(playerid),"Banco", dini_Int(PlayerName(playerid),"Banco") + reembolso);
		format(string,sizeof(string),"%s vendeu sua casa e ganhou um reembolso de $%d",PlayerName(playerid),reembolso);
		SendClientMessageAdmin(COLOR_WHITE, string);
	}
	//Remover Pickup
	for(new i=0; i<MAX_PICKUPS; i++){
		new str[256];
		format(str,sizeof(str),"%d.pickup",i);
		if(dini_Isset(str,"PickupDono")){
		    if(!strcmp(dini_Get(str,"PickupDono"),PlayerName(playerid),false)){
				DestroyPickup(i);
				dini_FloatSet(str,"X",0.0);
				dini_FloatSet(str,"Y",0.0);
				dini_FloatSet(str,"Z",0.0);
			}
		}
	}
	dini_FloatSet(PlayerName(playerid),"SpawnPosX",1685.4244);
	dini_FloatSet(PlayerName(playerid),"SpawnPosY",-2333.4529);
	dini_FloatSet(PlayerName(playerid),"SpawnPosZ",13.5469);
	dini_FloatSet(PlayerName(playerid),"SpawnPosAng",360);
	dini_IntSet(PlayerName(playerid),"ValorCasa",0);
	dini_IntSet(PlayerName(playerid),"Casa",0);
	dini_IntSet(PlayerName(playerid),"VendendoCasa",0);
	dini_IntSet(PlayerName(playerid),"LocandoCasa",0);
	dini_IntSet(PlayerName(playerid),"DiasAluguel",0);
}
stock DonoDaPropriedade(playerid,propriedade)
{
	new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
	if(strcmp(dini_Get(str,"Dono"),PlayerName(playerid),false) == 0) return true;
	else return false;
}
stock PropriedadeLotada(propriedade)
{
    new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
	if(strcmp(dini_Get(str,"Trabalhador1"),"NONE",true) == 0 || strcmp(dini_Get(str,"Trabalhador2"),"NONE",true) == 0 || strcmp(dini_Get(str,"Trabalhador3"),"NONE",true) == 0 || strcmp(dini_Get(str,"Trabalhador4"),"NONE",true) == 0
	|| strcmp(dini_Get(str,"Trabalhador5"),"NONE",true) == 0 || strcmp(dini_Get(str,"Trabalhador6"),"NONE",true) == 0 || strcmp(dini_Get(str,"Trabalhador7"),"NONE",true) == 0){ return false; }
	else return true;
}
stock DemitirJogador(playerid,propriedade)
{
    new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
	if(strcmp(dini_Get(str,"Trabalhador1"),PlayerName(playerid),true) == 0) dini_Set(str,"Trabalhador1","NONE");
	if(strcmp(dini_Get(str,"Trabalhador2"),PlayerName(playerid),true) == 0) dini_Set(str,"Trabalhador2","NONE");
	if(strcmp(dini_Get(str,"Trabalhador3"),PlayerName(playerid),true) == 0) dini_Set(str,"Trabalhador3","NONE");
	if(strcmp(dini_Get(str,"Trabalhador4"),PlayerName(playerid),true) == 0) dini_Set(str,"Trabalhador4","NONE");
	if(strcmp(dini_Get(str,"Trabalhador5"),PlayerName(playerid),true) == 0) dini_Set(str,"Trabalhador5","NONE");
	if(strcmp(dini_Get(str,"Trabalhador6"),PlayerName(playerid),true) == 0) dini_Set(str,"Trabalhador6","NONE");
	if(strcmp(dini_Get(str,"Trabalhador7"),PlayerName(playerid),true) == 0) dini_Set(str,"Trabalhador7","NONE");
	dini_IntSet(PlayerName(playerid),"AumentoPropriedade",0);
}
stock ContratarJogador(playerid,propriedade)
{
    new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
	if(strcmp(dini_Get(str,"Trabalhador1"),"NONE",true) == 0){
		 dini_Set(str,"Trabalhador1",PlayerName(playerid));
		 return 1;
	}
	else if(strcmp(dini_Get(str,"Trabalhador2"),"NONE",true) == 0){
		dini_Set(str,"Trabalhador2",PlayerName(playerid));
		return 1;
	}
	else if(strcmp(dini_Get(str,"Trabalhador3"),"NONE",true) == 0){
	 	dini_Set(str,"Trabalhador3",PlayerName(playerid));
 		return 1;
	}
	else if(strcmp(dini_Get(str,"Trabalhador4"),"NONE",true) == 0){
		dini_Set(str,"Trabalhador4",PlayerName(playerid));
		return 1;
	}
	else if(strcmp(dini_Get(str,"Trabalhador5"),"NONE",true) == 0){
		dini_Set(str,"Trabalhador5",PlayerName(playerid));
		return 1;
	}
	else if(strcmp(dini_Get(str,"Trabalhador6"),"NONE",true) == 0){
		dini_Set(str,"Trabalhador6",PlayerName(playerid));
		return 1;
	}
	else if(strcmp(dini_Get(str,"Trabalhador7"),"NONE",true) == 0){
		dini_Set(str,"Trabalhador7",PlayerName(playerid));
		return 1;
	}
	else return 0;
}
stock PagamentoSegurancas()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(dini_Int(PlayerName(i),"NSegurancas") > 0){
			new QtSegurancas;
			new str[256];
			QtSegurancas = dini_Int(PlayerName(i),"NSegurancas");
			for(new s=0; s<QtSegurancas; s++){
			    format(str,sizeof(str),"Seguranca_%d",s);
                if(strcmp(dini_Get(PlayerName(i),str),"NONE",true) == 0) {
					printf("%s n„o precisou pagar o sal·rio do seguranca %d pois ele ja foi demitido...",PlayerName(i),s);
				}
				else{
					if(IsStringAName(dini_Get(PlayerName(i),str))){
					    format(str,sizeof(str),"Seguranca_%d_Valor",s);
					    dini_IntSet(PlayerName(i),"Banco",dini_Int(PlayerName(i),"Banco") - dini_Int(PlayerName(i),str));
					    dini_IntSet(dini_Get(PlayerName(i),str),"Banco",dini_Int(dini_Get(PlayerName(i),str),"Banco") + dini_Int(PlayerName(i),str));
					    new string[256];
					    format(string,sizeof(string),"%s lhe pagou o seu sal·rio de $%d",PlayerName(i),dini_Int(PlayerName(i),str));
					    new id = GetPlayerID(dini_Get(PlayerName(i),str));
						SendClientMessage(id, COLOR_GREEN, string);
						format(string,sizeof(string),"VocÍ pagou o sal·rio de %s de $%d",dini_Get(PlayerName(i),str),dini_Get(PlayerName(i),str));
						SendClientMessage(i, COLOR_GREEN, string);
						AcrescentarExPoints(id,3);
					}
				}
			}
		}
	}
}
stock JogadorContratado(playerid,propriedade)
{
	new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propriedade]);
	if(strcmp(dini_Get(str,"Trabalhador1"),PlayerName(playerid),true) == 0 || strcmp(dini_Get(str,"Trabalhador2"),PlayerName(playerid),true) == 0 || strcmp(dini_Get(str,"Trabalhador3"),PlayerName(playerid),true) == 0 || strcmp(dini_Get(str,"Trabalhador4"),PlayerName(playerid),true) == 0
	|| strcmp(dini_Get(str,"Trabalhador5"),PlayerName(playerid),true) == 0 || strcmp(dini_Get(str,"Trabalhador6"),PlayerName(playerid),true) == 0 || strcmp(dini_Get(str,"Trabalhador7"),PlayerName(playerid),true) == 0) return true;
	else return false;
}
stock PropertiesResult()
{
	SendClientMessageToAll(COLOR_GREEN, "Resultado das propriedades:");
	new p = 0;
	while(p < MAX_PROPERTIES){
		new str[256];
		format(str,sizeof(str),"%s.prop",NomesPropriedades[p]);
		if(!fexist(str)) return 0;
		new lucro = dini_Int(str,"Lucro");
		new prejuizo = dini_Int(str,"Prejuizo");
		new investimento = dini_Int(str,"Investimento");
		new result;
		new randresult = random(5);
		if(randresult == 0) result = lucro-prejuizo;
		else if(randresult == 1) result = lucro+investimento/2-prejuizo+2000;
		else if(randresult == 2) result = lucro*3-investimento/2-prejuizo/4;
		else if(randresult == 3) result = lucro+investimento-prejuizo*3;
		else if(randresult == 4) result = lucro-prejuizo+investimento/3;
		else if(randresult == 5) result = lucro-investimento/4-prejuizo/2;
		dini_IntSet(dini_Get(str,"Dono"),"Banco",dini_Int(dini_Get(str,"Dono"),"Banco") + result);
		new string[256];
		if(result/2 <= 0){
			format(string,sizeof(string),"%s : Prejuizo de $%d",NomesPropriedades[p],result/2);
			SendClientMessageToAll(COLOR_WHITE, string);
			if(IsStringAName(dini_Get(str,"Dono"))){
				new playa = GetPlayerID(dini_Get(str,"Dono"));
				SendClientMessage(playa, COLOR_RED, "Infelizmente sua propriedade teve prejuÌzo! Esperamos que da prÛxima vez n„o seja assim!");
			}
			return 1;
		}
		else{
		    format(string,sizeof(string),"%s : Lucro de $%d",NomesPropriedades[p],result/2);
		    SendClientMessageToAll(COLOR_WHITE, string);
			if(IsStringAName(dini_Get(str,"Dono"))){
				new playa = GetPlayerID(dini_Get(str,"Dono"));
				SendClientMessage(playa, COLOR_GREEN, "PARAB…NS: Sua propriedade obteve lucro! Espero que vocÍ continue mantendo os negÛcios assim.");
			}
		}
		dini_IntSet(str,"Lucro",0);
		dini_IntSet(str,"Prejuizo",0);
		dini_IntSet(str,"Investimento",0);
		p++;
		format(str,sizeof(str),"%s.prop",NomesPropriedades[p]);
	}
	return 1;
}
stock PagarSalarioDoJogador(playerid,propriedade)
{
	AcrescentarPrejuizo(propriedade,IntSalario[Profissao[playerid]]+dini_Int(PlayerName(playerid),"AumentoPropriedade"));
	dini_IntSet(PlayerName(playerid),"Banco",dini_Int(PlayerName(playerid),"Banco")+dini_Int(PlayerName(playerid),"AumentoPropriedade"));
}
stock AcrescentarPrejuizo(propertie,prejuizo)
{
	new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propertie]);
	dini_IntSet(str,"Prejuizo",dini_Int(str,"Prejuizo")+prejuizo);
}
stock AcrescentarLucro(propertie,lucro)
{
    new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propertie]);
	dini_IntSet(str,"Lucro",dini_Int(str,"Lucro")+lucro);
}
stock AcrescentarInvestimento(propertie,investimento)
{
    new str[256];
	format(str,sizeof(str),"%s.prop",NomesPropriedades[propertie]);
	dini_IntSet(str,"Investimento",dini_Int(str,"Investimento")+investimento);
}
stock MudancaDia()
{
	for(new i; i<MAX_PLAYERS; i++) {
	    if(IsPlayerConnected(i)) {
		    if(ValorDia >= 6){
				ValorDia = 0;
			}
			if(ValorDia < 6){
				ValorDia++;
			}
		}
	}
}
stock Porcentagem(num,porc)
{
	if(porc >= 1 && porc <= 100){
		new result = porc*num/100;
		return result;
	}
	else return 0;
	return 1;
}
stock TirarDiasAluguel()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(dini_Int(PlayerName(i),"LocouCasa") == 1){
	        if(dini_Int(PlayerName(i), "DiasDeAluguel") > 1){
	            dini_IntSet(PlayerName(i),"DiasDeAluguel",dini_Int(PlayerName(i),"DiasDeAluguel") - 1);
	            SendClientMessage(i, COLOR_WHITE, "Acaba de passar mais um dia de seu aluguel!");
	            return 1;
			}
			else{
			    SendClientMessage(i, COLOR_RED, "Seu prazo de aluguel da casa acabou!");
			    if(IsStringAName(dini_Get(PlayerName(i),"DonoCasaAlugada"))){
			        new id = GetPlayerID(dini_Get(PlayerName(i),"DonoCasaAlugada"));
			        new string[256];
			        format(string,sizeof(string),"O prazo de aluguel da casa de %s acabou!",PlayerName(i));
			        SendClientMessage(id, COLOR_WHITE, string);
				}
			    dini_Set(PlayerName(i),"DonoCasaAlugada","NONE");
			    dini_IntSet(PlayerName(i),"DiasDeAluguel",0);
			    dini_IntSet(PlayerName(i),"LocouCasa",0);
			}
		}
	}
	return 1;
}
stock RetirarJogadorDaPropriedade(playerid)
{
    if(Profissao[playerid] == ENTREGADOR_PIZZA){
    	if(JogadorContratado(playerid,0)){
    		DemitirJogador(playerid,0);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == TAXISTA || Profissao[playerid] == MOTOTAXI || Profissao[playerid] == TAXI_AEREO){
	    if(JogadorContratado(playerid,1)){
    		DemitirJogador(playerid,1);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == MOTORISTA){
        if(JogadorContratado(playerid,2)){
    		DemitirJogador(playerid,2);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == CORRETOR_SEGUROS){
        if(JogadorContratado(playerid,3)){
    		DemitirJogador(playerid,3);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == SEGURAN«A || Profissao[playerid] == TRANSPORTE_DE_VALORES){
        if(JogadorContratado(playerid,4)){
    		DemitirJogador(playerid,4);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == VENDEDOR_DE_ARMAS){
        if(JogadorContratado(playerid,5)){
    		DemitirJogador(playerid,5);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == PROSTITUTA){
        if(JogadorContratado(playerid,6)){
    		DemitirJogador(playerid,6);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == FRENTISTA){
        if(JogadorContratado(playerid,7)){
    		DemitirJogador(playerid,7);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == BARMAN){
        if(JogadorContratado(playerid,8)){
    		DemitirJogador(playerid,8);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
	if(Profissao[playerid] == MECANICO){
        if(JogadorContratado(playerid,9)){
    		DemitirJogador(playerid,9);
			SendClientMessage(playerid, COLOR_GREEN, "VocÍ foi demitido da sua propriedade pois trocou seu emprego!");
		}
	}
}
public Tempo()
{
	if(SegundoJogo > 59){
		SegundoJogo = 0;
		MinutoJogo++;
	}
	if(SegundoJogo < 60){
		SegundoJogo++;
	}
	if(MinutoJogo > 59){
		MinutoJogo = 0;
		HoraJogo++;
		HoraJogo%=24;
	}
	new texto[256];
	SetWorldTime(HoraJogo);
/*
	format(texto, sizeof(texto), "~w~%d:00~y~hs", HoraJogo);
	GameTextForAll(texto, 4000, 1);
*/
	if(MinutoJogo==1){
		switch(HoraJogo)
 		{
 		case 15:
 		    {
 		    	if(ValorDia == 6){
					if(MostrouResultado == 0){
 		    	    	PropertiesResult();
 		    	    	MostrouResultado = 1;
 		    	    	SetTimer("ZerarResultadoMostrado",60000,false);
					}
				}
			}
   		case 21:
     		{
     		    if(PrevisaoAnunciada == 0){
    				SendClientMessageToAll(COLOR_WHITE,"Virtual New's, previs„o do tempo para amanh„:");
			    	Previsao = random(19);
			    	format(texto,sizeof(texto),"%s",WeatherName[Previsao]);
			    	SendClientMessageToAll(COLOR_GREEN,texto);
			    	PrevisaoAnunciada = 1;
			    	SetTimer("ZerarAnuncioPrevisao",60000,false);
				}
			}
		case 6: SetWeather(Previsao);
		case 0:
  			{
				if(SalarioEntregue == 0){
	 				Salario();
					PagamentoSegurancas();
					TirarDiasAluguel();
					SalarioEntregue = 1;
			    	SetTimer("ZerarSalarioEntregue",60000,false);
					for(new i=0; i<MAX_PLAYERS; i++){
				    	if(Profissao[i] == ENTREGADOR_PIZZA){
				    	    if(JogadorContratado(i,0)){
				        		PagarSalarioDoJogador(i,0);
								SendClientMessage(i, COLOR_GREEN, "A pizzaria pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == TAXISTA || Profissao[i] == MOTOTAXI || Profissao[i] == TAXI_AEREO){
					    	if(JogadorContratado(i,1)){
				        		PagarSalarioDoJogador(i,1);
								SendClientMessage(i, COLOR_GREEN, "A Yellow's'Taxi pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == MOTORISTA){
				        	if(JogadorContratado(i,2)){
				        		PagarSalarioDoJogador(i,2);
								SendClientMessage(i, COLOR_GREEN, "A LuxLimosine pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == CORRETOR_SEGUROS){
				       	 	if(JogadorContratado(i,3)){
				        		PagarSalarioDoJogador(i,3);
								SendClientMessage(i, COLOR_GREEN, "A corretora de seguros pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == SEGURAN«A || Profissao[i] == TRANSPORTE_DE_VALORES){
				    	    if(JogadorContratado(i,4)){
				  		      	PagarSalarioDoJogador(i,4);
								SendClientMessage(i, COLOR_GREEN, "A SecurityLife pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == VENDEDOR_DE_ARMAS){
					        if(JogadorContratado(i,5)){
					        	PagarSalarioDoJogador(i,5);
								SendClientMessage(i, COLOR_GREEN, "A Ammu-Nation pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == PROSTITUTA){
					        if(JogadorContratado(i,6)){
					        	PagarSalarioDoJogador(i,6);
								SendClientMessage(i, COLOR_GREEN, "A Boate de strip pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == FRENTISTA){
					        if(JogadorContratado(i,7)){
					        	PagarSalarioDoJogador(i,7);
								SendClientMessage(i, COLOR_GREEN, "O Posto pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == BARMAN){
				 	       if(JogadorContratado(i,8)){
					        	PagarSalarioDoJogador(i,8);
								SendClientMessage(i, COLOR_GREEN, "O Bar pagou seu sal·rio mais o seu aumento!");
							}
						}
						if(Profissao[i] == MECANICO){
					        if(JogadorContratado(i,9)){
					        	PagarSalarioDoJogador(i,9);
								SendClientMessage(i, COLOR_GREEN, "A Pay'n'Spray pagou seu sal·rio mais o seu aumento!");
							}
						}
					}
					MudancaDia();
					if(DiaJogo < MesesDias[MesJogo]){
	   					DiaJogo++;
					}
					if(DiaJogo >= MesesDias[MesJogo]){
	   					MesJogo++;
	   					DiaJogo = 1;
					}
					if(MesJogo >= 12){
						AnoJogo++;
						MesJogo = 1;
						DiaJogo = 1;
						SendClientMessageToAll(COLOR_YELLOW, "Reload Virtual Life RPG INFORMA:");
						new string[256];
						format(string,sizeof(string),"FELIZ ANO NOVO ¿ TODOS! Agora estamos em '%d'",AnoJogo);
						SendClientMessageToAll(COLOR_RED2, string);
						format(string,sizeof(string),"SERVIDOR: Se passou mais um ano no gamemode! Agora estamos em '%d'",AnoJogo);
						writelog(string);
					}
				}
			}
		}
	}
}

