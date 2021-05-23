#include <a_samp>
#include <dutils>
#include <dudb>
#include <uf>
//cores
#define COLOR_GREEN            0x33AA33AA
#define COLOR_RED              0xAA3333AA
#define COLOR_YELLOW           0xFFFF00AA
#define COLOR_WHITE            0xFFFFFFAA
#define COLOR_GRAY             0xAFAFAFAA
#define COLOR_DESEMPREGADO     0x666666AA
#define COLOR_INSTRUTOR        0xDD0000FF
#define COLOR_TAXISTA          0xFFFF00AA
#define COLOR_COP_CIVIL        0x0000FFAA
#define COLOR_COP_ELITE        0x00C7FFAA
#define COLOR_ASSASSINO        0xAA3333AA
#define COLOR_VENDEDOR         0x009900AA
#define COLOR_COP_RODOVIARIO   0x00CED3AA
#define COLOR_SEGURANÇA        0xADD8E6AA
#define COLOR_BARMAN           0xF08080AA
#define COLOR_CORRETOR         0xDEB887AA
#define COLOR_PESCADOR         0xE9967AAA
#define COLOR_MOTORISTA        0xFF9900AA
#define COLOR_MOTORISTA_ONIBUS 0xF5F5DCAA
#define COLOR_JUIZ             0x7FFF00AA
//profissao
#define DESEMPREGADO          1
#define TAXISTA               2
#define VENDEDOR_DE_CARROS    3
#define CORRETOR              4
#define ASSASSINO             5
#define BARMAN                6
#define JUIZ                  7
#define SEGURANÇA             8
#define MOTORISTA_PARTICULAR  9
#define COP_CIVIL             10
#define COP_RODOVIARIO        11
#define COP_ELITE             12
#define PESCADOR              14
#define INSTRUTOR_DE_DIRECAO  15
#define MOTORISTA_DE_ONIBUS   17
//define's do velocimetro
#define MPS 			0
#define KMPH 			1
#define MPH 			2
#define KNOTS 			3
#define SPEED			KMPH
//veiculos
static VEH_MONSTER = 444;
static VEH_CARCOPCS = 599;
static VEH_CARCOPSF = 597;
static VEH_HPV1000 = 523;
static VEH_MANANA = 410;
static VEH_SABRE = 475;
static VEH_FCR900 = 521;
static VEH_TAXI = 420;
static VEH_ONIBUS = 437;
static VEH_TURISMO = 451;
static VEH_NRG500 = 522;
static VEH_PHOENIX = 603;
static VEH_SUPERGT = 506;
static VEH_ANDROMADA = 592;
static VEH_DODO = 593;
static VEH_HUNTER = 425;
static VEH_GREENWOOD = 492;
static VEH_SLAMVAN = 535;
static VEH_LIXEIRO = 408;
static VEH_CARROFORTE = 428;
static VEH_LIMOSINE = 409;
static VEH_MAVERICK = 487;
static VEH_SAVANNA = 567;
static VEH_RCCAM = 594;


//#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

//global vars
new Float:ppos[MAX_PLAYERS][3];
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new Petrol[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new worldTime;
new Bebida[MAX_PLAYERS] = 0;

forward MoneyGrubScoreUpdate();

main()
{
	print("\n----------------------------------");
	print("          MPA PoWeR RPG");
	print(" Uma parceria entre Smurf e Matraka");
	print("----------------------------------\n");
	worldTime = 12;
}



public OnGameModeInit()
{
	print("GameModeInit()");
	SetGameModeText("MPA® PoWeR RPG");
	
	AddPlayerClass(0, -1958.5107, 293.6747, 35.4688, 269.1425, 0, 0, 0, 0, 0, 0);
 	AddStaticVehicle(VEH_CARCOPCS,-1588.2479,748.0393,-5.4903,359.9998,0,1); // carcop
	AddStaticVehicle(VEH_HPV1000,-1584.0217,749.4910,-5.6655,180.9966,0,0); // carcop
	AddStaticVehicle(VEH_HPV1000,-1579.8461,749.0732,-5.6571,181.8757,0,0); // car cop
	AddStaticVehicle(VEH_CARCOPCS,-1574.2565,742.4983,-5.5206,88.9996,0,1); // carcop
	AddStaticVehicle(VEH_HPV1000,-1573.5985,734.6492,-5.6689,90.0025,0,0); // carcop
	AddStaticVehicle(VEH_CARCOPCS,-1679.5951,706.1432,30.7954,90.5114,0,1); // helicop
	AddStaticVehicle(VEH_ONIBUS,-1988.5007,162.0946,27.6508,0.0000,1,1); // busao
	AddStaticVehicle(VEH_ONIBUS,-1988.3359,131.3477,27.6943,0.0000,1,1); // busao
	AddStaticVehicle(VEH_MANANA,-2089.6643,-83.5934,34.7976,359.9729,6,6); // carroescola
	AddStaticVehicle(VEH_MANANA,-2081.2825,-83.4888,34.8086,4.0901,6,6); // carroescola
	AddStaticVehicle(VEH_FCR900,-2022.3977,-124.3720,34.7832,179.9717,6,6); // motoescola
	AddStaticVehicle(VEH_MAVERICK,-2032.2460,-155.6209,35.4656,0.0060,1,6); // heliesc
	AddStaticVehicle(VEH_SABRE,-2088.8313,-156.0123,35.0983,359.9812,6,6); // carroesc
	AddStaticVehicle(VEH_SABRE,-2092.4036,-145.2734,35.0986,0.0400,6,6); // carroesc
	AddStaticVehicle(VEH_SABRE,-2092.3503,-132.4997,35.0966,0.4676,6,6); // carroesc
	AddStaticVehicle(VEH_MAVERICK,-1829.1174,1300.2819,59.8817,204.0558,54,29); // mavmoto
	AddStaticVehicle(453,-1556.1755,1260.8345,-0.5926,234.7669,69,69); // barco pesca
	AddStaticVehicle(453,-1565.1833,1259.7523,-0.5379,227.8785,69,69); // barcopesca
	AddStaticVehicle(453,-1578.2352,1260.0367,-0.0551,228.0564,69,69); // barco pesca
	AddStaticVehicle(493,-1474.4727,687.5856,-0.2037,268.8839,6,6); // barco escola
	AddStaticVehicle(453,-1473.3943,703.5046,-0.4342,272.7462,6,6); // barco escola
	AddStaticVehicle(VEH_TAXI,-1703.0906,1003.9794,17.3778,91.1514,6,1); // taxi
	AddStaticVehicle(VEH_TAXI,-1687.7856,999.6074,17.3444,270.7191,6,1); // taxi
	AddStaticVehicle(VEH_LIMOSINE,-1816.4678,1311.4034,50.2892,275.5558,1,1); // limomoto
	AddStaticVehicle(VEH_LIMOSINE,-1829.7208,1289.6337,50.2512,110.5457,0,0); // lomomoto
	AddStaticVehicle(VEH_SAVANNA,-1241.5155,445.2168,7.1593,326.9936,44,44); // carro
	AddStaticVehicle(VEH_SAVANNA,-1232.7764,451.6962,7.1680,89.9980,0,0); // carro
	AddStaticVehicle(VEH_HUNTER,-1403.2001,465.2320,7.7642,181.0000,0,0); // hunter
	AddStaticVehicle(VEH_HUNTER,308.9300,1990.3328,18.2170,180.0703,0,0); // hunter
	AddStaticVehicle(VEH_HUNTER,309.5915,2056.1018,18.1976,180.0104,0,0); // hunter
	AddStaticPickup(1248,1,-1757.9701,960.9874,24.8828);
	AddStaticPickup(1274,1,-1746.1521,962.3468,24.8906);//cifrao hotel sf
	AddStaticPickup(1274,1,-1974.1283,117.5247,27.6875);//cifrao train station sf
	AddStaticPickup(1274,1,-2446.8564,522.0898,30.2816);//cifrao sa federal mint
	AddStaticPickup(1274,1,1721.8188,-1718.9016,13.5341);//cifrao atrium
	AddStaticPickup(1274,1,398.1302,-1805.6890,7.8380);//cifrao praia
	AddStaticPickup(1274,1,1022.5526,-1122.4902,23.8712);//cifrao teatro chines
	
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

	SetTimer("Bancos", 1000, 1);
	SetTimer("CheckFuel", 50000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("Tempo", 60000, 1);
	SetTimer("ScreenTexts", 50, 1);
	SetTimer("Speed",400,true);
	
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{

 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1003.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
	GameTextForPlayer(playerid,"~g~ Por favor logue-se ou registre-se", 5000,3);
	return 1;
}

public OnGameModeExit()
{
	print("GameModeExit()");
	return 1;
}

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid, "Bem vindo ao MPA PoWeR RPG!~n~coders: Smurf e Matraka", 5000, 6);
	SendClientMessage(playerid, COLOR_MOTORISTA, "MPA® PoWeR RPG v1.0 beta");
	SendClientMessage(playerid, COLOR_YELLOW, "Quer ajuda? /ajuda");
	SendClientMessage(playerid, COLOR_YELLOW, "Comandos? /comandos");
	SendClientMessage(playerid, COLOR_YELLOW, "Recém-chegado? /aprender");
	SendClientMessage(playerid, COLOR_YELLOW, "Logue-se (/logar) ou registre-se (/registrar).");
	SendClientMessage(playerid, COLOR_YELLOW, "É preciso registrar-se para jogar esse mode fantástico!.");
	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	Petrol[playerid]= udb_getGasoline (PlayerName(playerid));
	SetPlayerColor(playerid, COLOR_GRAY);
	return false;
}

public OnPlayerDisconnect(playerid)
{
	if (PLAYERLIST_authed[playerid] == 1) {
	// Was loggedin, so save the data!
		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		new Float:health;
		GetPlayerHealth(playerid, health);
		udb_setHealth(PlayerName(playerid), health);
		udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
	}
return 0;
}

public OnPlayerSpawn(playerid)
{
    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid, 0);
	if(PLAYERLIST_authed[playerid] == 0){
		SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		SetPlayerFacingAngle(playerid, 90.0000);
		TogglePlayerControllable(playerid, 0);
    return 1;
	}
	if(udb_getPrisao(PlayerName(playerid)) == 1){
        TogglePlayerControllable(playerid, 0);
		SetPlayerInterior(playerid, 6);
        SendClientMessage(playerid, COLOR_RED, "Cometeste algum crime, e por isso ficarás 5h na cadeia.");
        SendClientMessage(playerid, COLOR_RED, "(Lembrete: Cada hora no jogo equivale a um minuto real).");
        SendClientMessage(playerid, COLOR_YELLOW, "Caso você queira sair da prisão mais cedo, você pode pagar a fiança (/fianca) por $1500.");
        Presos[playerid] = 1;
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
    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6501, 634.4510, 14.4531, 180.0000, 0, 0, 0, 0, 0, 0);
    SendClientMessage(playerid, COLOR_RED, "Você foi encontrado quase morto e foi levado ao Hospital. o valor do tratamento foi de $100.");
    SendClientMessage(playerid, COLOR_YELLOW, "Nosso hospital faz débito automático em conta corrente! xD");
    udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 100);

	if(Procurados[playerid] == 1){
	    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
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

	if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	// The command shouldn't work if an account with this
    	// nick already exists
    	if (udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Tá querendo se registrar duas vezes???");
		return 1;
		}

		// The command shouldn't work if we already are authed
    	if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Tá querendo registrar-se logado???");
		return 1;
		}

    	// Did he forgot the password?
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Ei, você esqueceu de mencionar uma senha. Use /registrar [senha]");
		return 1;
		}

    	// We save the money to the accstate
    	else{
    	    PLAYERLIST_authed[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*senha*/, 0 /*grana*/, 0 /*skin*/, 3000 /*gbanco*/, 0 /*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 1 /*prof*/, ""/*clantag*/, -1757.9701/*X*/, 960.9874/*Y*/, 24.8828/*Z*/, 180.0000/*ang*/, 100.0 /*hp*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			SetPlayerColor(playerid, COLOR_DESEMPREGADO);
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SendClientMessage(playerid, COLOR_GREEN, "Registrado e logado.");
			SendClientMessage(playerid, COLOR_GREEN, "Você têm $3000 no banco para começar a viver.");
    	return 1;
		}
 	}

	if(strcmp(cmd, "/logar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    // The command shouldn't work if an account with this
	    // nick does not exists
	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Hum, acho que você não entendeu. VOCÊ NÃO ESTÁ REGISTRADO!");
		return 1;
		}

		// The command shouldn't work if we already are authed
	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Logar-se duas vezes??? Impossível aqui.");
		return 1;
		}

	    // Did he forgot the password?
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COLOR_RED, "Você tem senha. /logar [senha]");
		return 1;
		}
		
	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
			PLAYERLIST_authed[playerid] = 1;
			LogarPlayer(playerid);
		return 1;
		}
		else {
	       // Login was incorrect
			SendClientMessage(playerid, COLOR_RED, "SENHA INCORRETA!");
		return 1;
	    }
	return 1;
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
    	    return 1;
    	    }
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão!");
		return 1;
		}
    return 1;
	}

	if(strcmp(cmd, "/vendeskin", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/skin [id] [quantia]");
			return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/skin [id] [quantia]");
			return 1;
			}
			skin = strval(tmp);
			if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
				SendClientMessage(playerid, COLOR_RED, "ID de skin inválido!");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			    udb_setSkin(PlayerName(plid), skin);
				SendClientMessage(playerid, COLOR_GREEN, "Skin vendida.");
				SendClientMessage(plid, COLOR_GREEN, "Você comprou uma nova skin!");
				SetPlayerPos(plid, -1958.5107, 293.6747, 35.4688);
				LogarPlayer(plid);
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
			return 1;
			}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão!");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COLOR_YELLOW, "/comandos : Comandos desse gamemode");
        SendClientMessage(playerid, COLOR_YELLOW, "/registrar [senha] : Registrar-se");
        SendClientMessage(playerid, COLOR_YELLOW, "/logar [senha] : Logar-se");
        SendClientMessage(playerid, COLOR_YELLOW, "/aprender : Mostra uma breve explicação sobre o RPG.");
        SendClientMessage(playerid, COLOR_YELLOW, "/creditos : Vê os creditos do RPG Mode");
	return 1;
	}
	
	if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "MPA® PoWeR RPG beta");
	    SendClientMessage(playerid, COLOR_YELLOW, " ");
	    SendClientMessage(playerid, COLOR_YELLOW, "Mode desenvolvido especialmente para o clan MPA.");
	    SendClientMessage(playerid, COLOR_YELLOW, "Scripting: Matraka");
		SendClientMessage(playerid, COLOR_YELLOW, "Idéias: Smurf");
		SendClientMessage(playerid, COLOR_YELLOW, " ");
		SendClientMessage(playerid, COLOR_YELLOW, "http://multiplayer.gtabrasil.net/samp/mpaclan");
	return 1;
	}

	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_GRAY, "MPA® PoWeR RPG beta");
	    SendClientMessage(playerid, COLOR_WHITE, "Como diz o nome, esse gamemode é um RPG, que simula a vida real..");
	    SendClientMessage(playerid, COLOR_WHITE, "Aqui você poderá trabalhar para ganhar dinheiro, e poder comprar casas e carros.");
	    SendClientMessage(playerid, COLOR_WHITE, "Na vida real existem crimes. Se você fizer crimes aqui, a polícia tentará te prender.");
		SendClientMessage(playerid, COLOR_WHITE, "Se dirigir sem habilitação, poderá pegar multa. Note que há três tipos de habilitação:");
		SendClientMessage(playerid, COLOR_WHITE, "Terrestre (veículos terrestres), náutica (veículos náuticos e aérea (veículos aéreos).");
		SendClientMessage(playerid, COLOR_WHITE, "Espero que divirta-se com nosso gamemode. São os votos do clan MPA!");
		SendClientMessage(playerid, COLOR_MOTORISTA, "Comandos??? /ajuda ou /comandos.");
	return 1;
	}
	
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_MOTORISTA, "Comandos do RPG");
		SendClientMessage(playerid, COLOR_YELLOW, "/profs : mostra as profissoes do RPG. | /190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(playerid, COLOR_YELLOW, "/mandagrana : Envia dinheiro a algum jogador. | /presos : Vê a lista de pessoas presas.");
		SendClientMessage(playerid, COLOR_YELLOW, "/trancar : Tranca seu carro. | /procurados : Vê a lista de procurados pela policia");
		SendClientMessage(playerid, COLOR_YELLOW, "/destrancar : Destranca seu carro. | /pescar : Joga a rede pra pescar, você deve estar na área de pesca.");
		SendClientMessage(playerid, COLOR_YELLOW, "/documentos [id] : Mostra seus documentos. | /say [texto] : Manda mensagem para pessoas proximas a você.");
		SendClientMessage(playerid, COLOR_YELLOW, "/relogio : Mostra o horário em SF. | /profissao : Comandos de sua profissão.");
		SendClientMessage(playerid, COLOR_YELLOW, "/taxi [lugar] : Chama um taxi. | /banco : Comandos do Banco.");
		SendClientMessage(playerid, COLOR_YELLOW, "/abastecer [litros] : Abastecer (você deve estar no posto para usar este comando).");
		SendClientMessage(playerid, COLOR_YELLOW, "/pagar [id] [quantidade] : Paga por algum serviço de corretor ou vendedor de carros.");
	return 1;
	}
	
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Comandos do Banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/saldo : checa seu o saldo bancário..");
        SendClientMessage(playerid, COLOR_YELLOW, "/saldocelular : checa seu o saldo bancário através do seu celular, custo $20.");
        SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esses comandos, menos o /bscell.");
        SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car Shop, SF Train Station e SA Federal Mint.");
	return 1;
	}

	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Profissões disponíveis o GT RPG:");
        SendClientMessage(playerid, COLOR_YELLOW, "1 - Desempregado (Salário: $350)");
        SendClientMessage(playerid, COLOR_YELLOW, "2 - Taxista (Salário: $900)");
        SendClientMessage(playerid, COLOR_YELLOW, "6 - Barman (Salário: $850 + as bebidas que vende)");
        SendClientMessage(playerid, COLOR_YELLOW, "8 - Segurança (Salário: $850 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_YELLOW, "9 - Motorista Particular (Salário: $850 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_YELLOW, "14 - Pescador (Salário: $750 + o que ganha na pesca)");
        SendClientMessage(playerid, COLOR_YELLOW, "17 - Motorista de ônibus (Salário: $900)");
        SendClientMessage(playerid, COLOR_GRAY, "Obs: As profissões que não estão na lista são limitadas e sõ podem ser contratadar por um admin.");
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
		        if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
		return 1;
		}
	return 1;
	}

	if (strcmp(cmdtext, "/trancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COLOR_GREEN, "Veículo Trancado");
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo nenhum veiculo!");
		return 1;
		}
	return 1;
	}

	if (strcmp(cmdtext, "/destrancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
				}
			}
			SendClientMessage(playerid, COLOR_GREEN, "Veículo Destrancado");
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo nenhum veiculo!");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/givecash", true) == 0) {
		new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /givechas [id-do-jogador] [quantidade]");
		return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /givechas [id-do-jogador] [quantidade]");
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
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "Você recebeu $%d de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Valor inválido.");
			}
		}
		else {
			format(string, sizeof(string), "%d não está online.", giveplayerid);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
	return 1;
	}

    if(strcmp(cmd, "/bdp", true) == 0) {
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_WHITE, "Uso: /bdp [quantidade]");
		return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COLOR_RED, "Você não tem todo esse dinheiro. Ou está tentando enviar $0.");
		return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, 0 - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/bwd", true) == 0) {
        new string[256];
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_WHITE, "Uso: /bwd [quantidade]");
		return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COLOR_RED, "Você não pode querer depositar com esse comando");
		return 1;
		}
		if(quantidade > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COLOR_RED, "Você não pode tem essa quantidade no banco");
		return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Você retirou $%d do banco. seu saldo atual é de $%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(giveplayerid, COLOR_YELLOW, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/bstats", true) == 0) {
		new string[256];
        if(IsPlayerInCheckpoint(playerid)){
			format(string, sizeof(string), "Você tem %d na conta %d", udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		}
	return 1;
	}
	
	if(strcmp(cmd, "/bscell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 20){
            SendClientMessage(playerid, COLOR_YELLOW, "Custo: $20");
		return 1;
		}
		else{
		    GivePlayerMoney(playerid, 0 - 20);
			format(string, sizeof(string), "Mensagem de Celular: Você tem %d na conta %d", udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
		}
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
	        SendClientMessage(playerid, COLOR_RED, "Você não tem dinheiro para pagar. Ou você está querendo tirar combustível do carro.");
		return 1;
		}
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		if((X >= -1666.3102 && Y <= 418.1154 && X <= 670.9482 && Y >= -589.7477) || (X >= -117.3342 && Y >= -1194.0710 && X <= -56.5731 && Y <= -1158.9866) || (X >= 1906.3308 && Y >= -1795.3513 && X <= 1953.3729 && Y <= -1759.7977) || (X <= 1011.8674 && X >= 978.0131 && Y <= -890.4835 && Y >= -945.2622) || (X >= -1699.14 && X <= -1657.21 && Y >= 371.57 && Y <= 460.83) || (X <= -2400.04 && X >= -2452.71 && Y >= 948.72 && Y <= 996.98)){
			if(quantidade + Petrol[playerid] < 100){
			    Petrol[playerid] = quantidade;
			    format(string, sizeof(string), "Você comprou %d litros de combustível.", quantidade);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantidade);
			return 1;
			}
			if(quantidade + Petrol[playerid] >= 100){
			    new quantia;
			    quantia = 100 - Petrol[playerid];
			    Petrol[playerid] = 100;
				format(string, sizeof(string), "Seu tanque está cheio, colocamos %d litros.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantia);
			return 1;
			}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não está no posto, consulte o mapa no fórum para saber sua localização");
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
			SendClientMessage(playerid, COLOR_RED, "/jobpay [id] [amount]");
		return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == VENDEDOR_DE_CARROS || Profissao[plid] == CORRETOR){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COLOR_RED, "Você não tem esse dinheiro! ou não está querendo pagar de forma justa.");
			return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/10);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
			return 1;
			}
		return 1;
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COLOR_RED, "Você está tentando pagaer a alguem que não é coretoe e nem vendedor!");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/ci", true) == 0) {
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
			SendClientMessage(playerid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Skin :: %d", udb_getSkin(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			if(hab[0] == 0){
			    SendClientMessage(playerid, COLOR_YELLOW, "Habilitação de Carros e Motos: NÂO");
			}
			if(hab[0] == 1){
			    SendClientMessage(playerid, COLOR_YELLOW, "Habilitação de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(playerid, COLOR_YELLOW, "Habilitação Náutica: NÂO");
			}
			if(hab[1] == 1){
			    SendClientMessage(playerid, COLOR_YELLOW, "Habilitação Náutica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(playerid, COLOR_YELLOW, "Habilitação Aérea: NÂO");
			}
			if(hab[2] == 1){
			    SendClientMessage(playerid, COLOR_YELLOW, "Habilitação Aérea: SIM");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COLOR_YELLOW, string);
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "esse jogador nao existe");
		}
	return 1;
	}

	if(strcmp(cmd, "/sethaero", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção aerea concedida.");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção aerea concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção aerea.");
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
			return 1;
			}
		return 1;
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
		return 1;
		}
	return 1;
	}


	if(strcmp(cmd, "/sethterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção terrestre concedida.");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção terrestre concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção de carros e motos.");
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
			return 1;
			}
		return 1;
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/sethnautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção náutica concedida.");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção náutica concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção náutica.");
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
			return 1;
			}
		return 1;
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/bust", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new distancia;
	    	new string[256];
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/bust [id]");
			return 1;
			}
        	plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(distancia > 10){
			        SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
				return 1;
				}
				if(distancia <= 10){
				    udb_setPrisao(PlayerName(playerid), 1);
					SetSpawnInfo(plid, 1, udb_getSkin(PlayerName(plid)), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
					SetPlayerPos(plid, 262.9540, 78.4339, 1002.0391);
					LogarPlayer(plid);
					format(string, sizeof(string), "Você foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEGURANÇA, string);
				    SendClientMessage(playerid, COLOR_GREEN, "Prisão concluida");
				return 1;
				}
			return 1;
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
		return 1;
		}
	return 1;
	}

    if(strcmp(cmd, "/fianca", true) == 0) {
		Presos[playerid] = 0;
		udb_setPrisao(PlayerName(playerid), 0);
		LogarPlayer(playerid);
		SendClientMessage(playerid, COLOR_GREEN, "Você pagou a fiança no valor de $1500 e foi solto.");
		udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 1500);
	return 1;
	}

	if(strcmp(cmd, "/unbust", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/unbust [id]");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    Presos[playerid] = 0;
			    udb_setPrisao(PlayerName(playerid), 0);
			    LogarPlayer(playerid);
			    SendClientMessage(plid, COLOR_GREEN, "Algum juiz te soltou.");
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/setjob", true) == 0 && IsPlayerConnected(playerid)) {
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
            if(prof > 1 && prof < 18 && prof != 13 && prof != 16){
				udb_setProf(PlayerName(plid), prof);
				format(string, sizeof(string), "Você mudou a profissão de %s para %d", PlayerName(plid), prof);
				SendClientMessage(playerid, COLOR_GREEN, string);
				SendClientMessage(plid, COLOR_GREEN, "Você mudou de profissão, digite /profissao.");
				Profissao[plid] = prof;
				SetPlayerPos(plid, 1729.4764, -1634.8013, 20.2163);
				SpawnPlayer(plid);
				if(prof == DESEMPREGADO) {
					SetPlayerColor(plid, COLOR_DESEMPREGADO); // Cinza
				return 1;
				}
				else if(prof == TAXISTA) {
					SetPlayerColor(playerid, COLOR_TAXISTA); // Amarelo
					
				return 1;
				}
				else if(prof == VENDEDOR_DE_CARROS) {
					SetPlayerColor(plid, COLOR_VENDEDOR); // Verde
				return 1;
				}
				else if(prof == CORRETOR) {
					SetPlayerColor(plid, COLOR_CORRETOR); // Marfin
				return 1;
				}
				else if(prof == ASSASSINO) {
					SetPlayerColor(plid, COLOR_ASSASSINO); // Vermelho
				return 1;
				}
				else if(prof == BARMAN) {
					SetPlayerColor(plid, COLOR_BARMAN); // Bege
				return 1;
				}
				else if(prof == JUIZ) {
					SetPlayerColor(plid, COLOR_JUIZ); // verde
				return 1;
				}
				else if(prof == SEGURANÇA) {
					SetPlayerColor(plid, COLOR_SEGURANÇA); // Azul claro
				return 1;
				}
				else if(prof == MOTORISTA_PARTICULAR) {
					SetPlayerColor(plid, COLOR_MOTORISTA); // Laranja
				return 1;
				}
				else if(prof == COP_CIVIL) {
					SetPlayerColor(plid, COLOR_COP_CIVIL); // Azul
				return 1;
				}
				else if(prof == COP_RODOVIARIO) {
					SetPlayerColor(plid, COLOR_COP_RODOVIARIO); // Azul
				return 1;
				}
				else if(prof == COP_ELITE) {
					SetPlayerColor(plid, COLOR_COP_ELITE); // Azul Claro
				return 1;
				}
				else if(prof == PESCADOR) {
					SetPlayerColor(plid, COLOR_PESCADOR); // Bege
				return 1;
				}
				else if(prof == INSTRUTOR_DE_DIRECAO) {
					SetPlayerColor(plid, COLOR_INSTRUTOR); // VClaro
				return 1;
				}
				else if(prof == MOTORISTA_DE_ONIBUS) {
					SetPlayerColor(plid, COLOR_MOTORISTA_ONIBUS); // Claro
				return 1;
				}
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Essa não é uma profisssão válida!");
			return 1;
			}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
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
		if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_GREEN, "Taxista - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_GREEN, "Vendedor de Carros e Skins - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/setcar [id-do-carro] [rotação] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, COLOR_YELLOW, "/setskin [id-da-pessoa] [id-do-skin] : Vende um skin para alguma pessoa.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/sethome [nick] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/unbust [id] : Solta uma pessoa da cadeia.");
		}
		else if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [amount] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/unbust [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [amount] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/sethaero : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COLOR_YELLOW, "/sethterrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_YELLOW, "/sethnautica : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_GREEN, "Sua profissão não tem nenhum comando especial!");
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
				SendClientMessage(playerid, COLOR_WHITE, "SERVER: Unknown command.");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 1;
				SendClientMessage(playerid, COLOR_GREEN, "Mais um para vc perseguir agora.");
				format(string, sizeof(string), "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_WHITE, "SERVER: Unknown command.");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
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
				SendClientMessage(playerid, COLOR_WHITE, "SERVER: Unknown command.");
			return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 0;
				SendClientMessage(playerid, COLOR_GREEN, "Excluido da lista com suscesso.");
				SendClientMessage(plid, COLOR_GREEN, "Você foi retirado da lista de procurados");
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_WHITE, "SERVER: Unknown command.");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
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
				SendClientMessage(playerid, COLOR_RED, "Você não está querendo multar de forma justa.");
			return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(playerid, COLOR_GREEN, "Multa dada.");
				udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quant);
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
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
				SendClientMessage(playerid, COLOR_RED, "/staxi [id]");
			return 1;
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COLOR_GREEN, "O taxímetro começou a rodar");
                SendClientMessage(plid, COLOR_GREEN, "O taxímetro começou a rodar");
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
			return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O passageiro não está dentro do seu carro ou você não é o motorista.");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
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
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
			return 1;
			}
			ang = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
			return 1;
			}
			set(nome, tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
			return 1;
			}
			cor1 = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
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
					temp = fopen("rcars.ini", io_append);
                    fwrite(temp, string);
                    fclose(temp);
                    SendClientMessage(playerid, COLOR_GREEN, "Carro salvo");
				return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Você não está em nenhum veículo e assim e assim não pode setar um carro.");
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
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
		return 1;
		}
	return 1;
	}

	if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "São %d:00 horas na região de SF", worldTime);
		SendClientMessage(playerid, COLOR_GREEN, string);
	return 1;
	}

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
			            SendClientMessage(playerid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Drink Vendido e tomado");
					return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
					return 1;
					}
				return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto para entregar a bebida.");
				return 1;
				}
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
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
			        SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
				return 1;
				}
				if(distancia <= 20){
					format(string, sizeof(string), "O bafômetro mostra: %s no sangue", Bebida[plid]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
				    SendClientMessage(playerid, COLOR_GREEN, "Prisão concluida");
				return 1;
				}
			return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
			}
		return 1;
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
		return 1;
		}
	return 1;
	}

return 0;
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
     if(GetPlayerVehicleID(playerid) != 481 && GetPlayerVehicleID(playerid) != 509 && GetPlayerVehicleID(playerid) != 510) {
   			if(Petrol[playerid] <= 0){
			RemovePlayerFromVehicle(playerid);
			Petrol[playerid] = 0;
			SendClientMessage(playerid, COLOR_RED, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
        return 0;
		}
		if(Petrol[playerid] > 50){
		    Petrol[playerid]--;
        return 0;
		}
		if(Petrol[playerid] <= 50 || Petrol[playerid] >= 1){
		    Petrol[playerid]--;
        return 0;
		}
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
	printf("Jogador de ID %d deixou um checkpoint",playerid);
	SendClientMessage(playerid, COLOR_GREEN, "Você entrou no banco.");
	SendClientMessage(playerid, COLOR_GREEN, "Para visualizar os comandos digite /banco");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("Jogador de ID %d deixou um checkpoint", playerid);
	return 1;
}

public PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
return name;
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
			else {
				if(AreaBanco[i] == 1) {
					DisablePlayerCheckpoint(i);
					AreaBanco[i] = 0;
				}
			}
		}
	}
}

public CheckFuel()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1){
			if(GetPlayerState(i) == 2){
				Petrol[i]--;
				if(Petrol[i] <= 0){
					RemovePlayerFromVehicle(i);
					SendClientMessage(i, COLOR_RED, "Você não pode andar sem combustível, vá até o posto mais próximo e abasteça.");
					Petrol[i] = 0;
				return 1;
				}
				if(Petrol[i] >= 25){
				return 1;
				}
				if(Petrol[i] < 5 || Petrol[i] >= 1){
				SendClientMessage(i,COLOR_RED,"Atenção: seu combustível está quase acabando. Vá ao posto mais próximo e abasteça");
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
	
	if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COLOR_DESEMPREGADO); // Cinza
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COLOR_TAXISTA); // Amarelo
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR); // Verde
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COLOR_CORRETOR); // Marfin
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COLOR_ASSASSINO); // Vermelho
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COLOR_BARMAN); // Bege
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COLOR_JUIZ); // verde
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COLOR_SEGURANÇA); // Azul claro
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COLOR_MOTORISTA); // Laranja
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COLOR_COP_CIVIL); // Azul
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COLOR_COP_RODOVIARIO); // Azul
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COLOR_COP_ELITE); // Azul Claro
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COLOR_PESCADOR); // Bege
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COLOR_INSTRUTOR); // VClaro
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COLOR_MOTORISTA_ONIBUS); // Claro
	}

	SendClientMessage(playerid, COLOR_GREEN, "Logado");
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
	        if(TempoPreso[i] == 180000){
	            Presos[i] = 0;
	            udb_setPrisao(PlayerName(i), 0);
	            TempoPreso[i] = 0;
	    	    LogarPlayer(i);
	            SendClientMessage(i, COLOR_YELLOW, "Você foi solto, mas se fizer algum crime outra vez, já sabe...");
			}
			if(TempoPreso[i] < 10){
			    TempoPreso[i]++;
			}
		}
	}
}
public ScreenTexts(playerid)
{
new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		if((X >= -1666.3102 && Y <= 418.1154 && X <= 670.9482 && Y >= -589.7477) || (X >= -117.3342 && Y >= -1194.0710 && X <= -56.5731 && Y <= -1158.9866) || (X >= 1906.3308 && Y >= -1795.3513 && X <= 1953.3729 && Y <= -1759.7977) || (X <= 1011.8674 && X >= 978.0131 && Y <= -890.4835 && Y >= -945.2622) || (X >= -1699.14 && X <= -1657.21 && Y >= 371.57 && Y <= 460.83)){
	GameTextForPlayer(playerid,"Posto",3000,4); }
	else {
	return 1;
	}
return 1;
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
			format(tmpstr,256,"~h~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~w~Veloc¢metro: ~h~~b~%d ~y~km/h~n~~w~Combust¢vel: ~h~~b~%d ~w~litros",floatround(((dis/800.0)*60.0)*60.0),Petrol[i]);
            if(IsPlayerInAnyVehicle(i)) GameTextForPlayer(i,tmpstr,750,3);
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
					SendClientMessage(i, COLOR_YELLOW, "Seu seguro desemprego foi depositado: $350");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 350);
				}
				else if(Profissao[i] == TAXISTA) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == VENDEDOR_DE_CARROS) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == CORRETOR) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == BARMAN) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $1500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
				else if(Profissao[i] == SEGURANÇA) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == MOTORISTA_PARTICULAR) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == COP_CIVIL) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_RODOVIARIO) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_ELITE) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
				else if(Profissao[i] == PESCADOR) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $750");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 750);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					SendClientMessage(i, COLOR_YELLOW, "Seu salário governamental foi depositado: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
			}
		}
	}
}
