#include <a_players>
#include <a_samp>
#include <dutils>
#include <dudb>

#define COLOR_GREEN            0x33AA33AA
#define COLOR_RED              0xAA3333AA
#define COLOR_YELLOW           0xFFFF00AA
#define COLOR_WHITE            0xFFFFFFAA
#define COLOR_GRAY             0xAFAFAFAA
#define COLOR_DESEMPREGADO     0x666666AA
#define COLOR_INSTRUTOR        0xDD0000FF
#define COLOR_TAXISTA          0x52A0A5AA
#define COLOR_COP_CIVIL        0x0000FFAA
#define COLOR_COP_ELITE        0x00C7FFAA
#define COLOR_ASSASSINO        0xAA3333AA
#define COLOR_VENDEDOR         0x009900AA
#define COLOR_COP_RODOVIARIO   0x00CED3AA
#define COLOR_SEGURANÇA        0x52a577AA
#define COLOR_BARMAN           0xADD8E6AA
#define COLOR_CORRETOR         0xDEB887AA
#define COLOR_PESCADOR         0xE9967AAA
#define COLOR_MOTORISTA        0xFF9900AA
#define COLOR_MOTORISTA_ONIBUS 0x526AA5AA
#define COLOR_JUIZ             0x7FFF00AA
#define COLOR_AGRICULTOR       0x82F8ACAA
#define COLOR_TRAFICANTE       0xB7910fAA

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
#define AGRICULTOR            13
#define PESCADOR              14
#define INSTRUTOR_DE_DIRECAO  15
#define MOTORISTA_DE_ONIBUS   16
#define TRAFICANTE            17

#define UDB GETGASOLINE

#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1


new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new AreaPesca[MAX_PLAYERS];
new AreaFazenda[MAX_PLAYERS];
new AreaMercado[MAX_PLAYERS];
new Verduras[MAX_PLAYERS] = 0;
new Plantacao[MAX_PLAYERS] = 0;
new Pescado[MAX_PLAYERS] = 0;
new Plantando[MAX_PLAYERS] = 0;
new Pescando[MAX_PLAYERS] = 0;
new Petrol[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new worldTime;
new Bebida[MAX_PLAYERS] = 0;
new drogas[MAX_PLAYERS][3];

forward Colheita(playerid);
forward MoneyGrubScoreUpdate();
forward MoneyGrubScoreUpdate();
forward TempoPrisao();
forward Taxi();
forward Pesca(playerid);
forward CheckFuel();
forward LogarPlayer(playerid);
forward Areas();
forward MTaxi();
forward UpdateSpeed();
forward GetDistanceBetweenPlayers(playerid, playerid2);
forward Tempo();
forward Speed();
forward TimeFunction(playerid);
forward setcar(carid, Float:X, Float:Y, Float:Z, Float:ang, cor1, cor2);

main()
{
	print("\n--------------------------------------------");
	print("                 DT® Strike RPG               ");
	print("                Feito por Rafael              ");
	print("--------------------------------------------\n");
	worldTime = 12;
}



public OnGameModeInit()
{
	print("GameModeInit()");
	SetGameModeText("DT® Strike RPG");
	
	AddPlayerClass(0, -1958.5107, 293.6747, 35.4688, 269.1425, 0, 0, 0, 0, 0, 0);
 	AddStaticVehicle(596,-1588.2479,748.0393,-5.4903,359.9998,0,1 ); // carcop
	AddStaticVehicle(523,-1584.0217,749.4910,-5.6655,180.9966,0,0); // carcop
	AddStaticVehicle(523,-1579.8461,749.0732,-5.6571,181.8757,0,0); // car cop
	AddStaticVehicle(596,-1574.2565,742.4983,-5.5206,88.9996,0,1); // carcop
	AddStaticVehicle(523,-1573.5985,734.6492,-5.6689,90.0025,0,0); // carcop
	AddStaticVehicle(497,-1679.5951,706.1432,30.7954,90.5114,0,1); // helicop
	AddStaticVehicle(437,-1988.5007,162.0946,27.6508,0.0000,1,1); // busao
	AddStaticVehicle(437,-1988.3359,131.3477,27.6943,0.0000,1,1); // busao
	AddStaticVehicle(410,-2089.6643,-83.5934,34.7976,359.9729,6,6); // carroescola
	AddStaticVehicle(410,-2081.2825,-83.4888,34.8086,4.0901,6,6); // carroescola
	AddStaticVehicle(461,-2022.3977,-124.3720,34.7832,179.9717,6,6); // motoescola
	AddStaticVehicle(487,-2032.2460,-155.6209,35.4656,0.0060,1,6); // heliesc
	AddStaticVehicle(475,-2088.8313,-156.0123,35.0983,359.9812,6,6); // carroesc
	AddStaticVehicle(475,-2092.4036,-145.2734,35.0986,0.0400,6,6); // carroesc
	AddStaticVehicle(475,-2092.3503,-132.4997,35.0966,0.4676,6,6); // carroesc
	AddStaticVehicle(487,-1829.1174,1300.2819,59.8817,204.0558,54,29); // mavmoto
	AddStaticVehicle(453,-1556.1755,1260.8345,-0.5926,234.7669,69,69); // barco pesca
	AddStaticVehicle(453,-1565.1833,1259.7523,-0.5379,227.8785,69,69); // barcopesca
	AddStaticVehicle(453,-1578.2352,1260.0367,-0.0551,228.0564,69,69); // barco pesca
	AddStaticVehicle(493,-1474.4727,687.5856,-0.2037,268.8839,6,6); // barco escola
	AddStaticVehicle(453,-1473.3943,703.5046,-0.4342,272.7462,6,6); // barco escola
	AddStaticVehicle(420,-1703.0906,1003.9794,17.3778,91.1514,6,1); // taxi
	AddStaticVehicle(420,-1687.7856,999.6074,17.3444,270.7191,6,1); // taxi
	AddStaticVehicle(409,-1816.4678,1311.4034,50.2892,275.5558,1,1); // limomoto
	AddStaticVehicle(409,-1829.7208,1289.6337,50.2512,110.5457,1,1); // limomoto
	AddStaticVehicle(433,-1307.1633,456.9036,7.5909,89.9428,0,0); // caminhao
	AddStaticVehicle(433,-1306.5189,463.9994,7.6436,89.6543,0,0); // caminhao
	AddStaticVehicle(433,-1306.5568,460.6202,7.6451,90.4466,0,0); // caminhao
	AddStaticVehicle(433,-1309.4952,444.8434,7.6132,55.0000,0,0); // caminhao
	AddStaticVehicle(433,-1307.2222,447.7583,7.5937,54.9896,0,0); // caminhao
	AddStaticVehicle(470,-1241.5155,445.2168,7.1593,326.9936,44,44); // carro
	AddStaticVehicle(470,-1232.7764,451.6962,7.1680,89.9980,0,0); // carro
	AddStaticVehicle(425,-1403.2001,465.2320,7.7642,181.0000,0,0); // hunter
	AddStaticVehicle(425,308.9300,1990.3328,18.2170,180.0703,0,0); // hunter
	AddStaticVehicle(425,309.5915,2056.1018,18.1976,180.0104,0,0); // hunter
	
	
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

	SetTimer("Areas", 1000, 1);
	SetTimer("CheckFuel", 50000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("Tempo", 60000, 1);
	
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{

 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1003.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
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
				}
		  }
    }
	print("GameModeExit()");
    return 1;
}

public OnPlayerConnect(playerid)
{
	new msg[256];
	format(msg,sizeof(msg), "%s entrou no servidor.",PlayerName(playerid));
	SendClientMessageToAll(0x3CEEDFAA,msg);
	GameTextForPlayer(playerid, "~r~DT ~b~ST~g~R~y~IK~w~E ~g~R~b~P~y~G", 5000, 0);
	SendClientMessage(playerid, COLOR_SEGURANÇA, "DT® Strike RPG");
	SendClientMessage(playerid, COLOR_WHITE, "Para ajuda inicial digite /ajuda");
	SendClientMessage(playerid, COLOR_WHITE, "Para ver os comandos do RPG digite /comandos e /comandos2");
	SendClientMessage(playerid, COLOR_WHITE, "Para uma breve explicação sobre o RPG digite /aprender");
	SendClientMessage(playerid, COLOR_WHITE, "Para ver as profissões do RPG digite /profs e /profs2");
	if (!udb_Exists(PlayerName(playerid))) {
		SendClientMessage(playerid, COLOR_WHITE, "Voce não está registrado, faça registro com /registrar [senha]");
	}
	if (udb_Exists(PlayerName(playerid))) {
    	format(msg,sizeof(msg),"Bem vindo novamente %s, digite /entrar [senha] para se logar.",PlayerName(playerid));
    	SendClientMessage(playerid,COLOR_WHITE,msg);
	}
	drogas[playerid][0] = 0;
	drogas[playerid][1] = 0;
	drogas[playerid][2] = 0;
	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	AreaMercado[playerid] = 0;
	AreaPesca[playerid] = 0;
	AreaFazenda[playerid] = 0;
	Log[playerid] = 0;
	Petrol[playerid] = udb_getGasoline(PlayerName(playerid));
	udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
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
		new msg[256];
	    format(msg,sizeof(msg), "%s saiu do servidor.",PlayerName(playerid));
	    SendClientMessageToAll(0x3CEEDFAA,msg);
        PLAYERLIST_authed[playerid] = 0;
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
	else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COLOR_AGRICULTOR); // Claro
	}
	else if(Profissao[playerid] == TRAFICANTE) {
		SetPlayerColor(playerid, COLOR_TRAFICANTE); // Claro
	}
	if(udb_getPrisao(PlayerName(playerid)) == 1){
        TogglePlayerControllable(playerid, 0);
		SetPlayerInterior(playerid, 6);
        SendClientMessage(playerid, COLOR_RED, "Você cometeu algum crime e por isso foi preso, você ficará 5 horas na cadeia.");
        SendClientMessage(playerid, COLOR_RED, "(Lembrete: Cada hora no jogo equivale a um minuto real).");
        SendClientMessage(playerid, COLOR_YELLOW, "Caso você queira sair da prisao mais cedo, você pode pagar a fiança (/fianca) por $1500.");
        Presos[playerid] = 1;
		return 1;
	}
	else{
	    TogglePlayerControllable(playerid, 1);
    	return 1;
	}
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6501, 634.4510, 14.4531, 180.0000, 0, 0, 0, 0, 0, 0);
    SendClientMessage(playerid, COLOR_RED, "Você foi encontrado quase morto e foi levado ao Hospital. o valor do tratamento foi de $250.");
    udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 250);

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
			udb_Create(PlayerName(playerid), tmp /*senha*/,0 /*creditos*/, 0 /*grana*/,0 /*skin*/, 3000 /*gbanco*/, 0/*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 1 /*prof*/, ""/*clantag*/, -1757.9701/*X*/, 960.9874/*Y*/, 24.8828/*Z*/, 180.0000/*ang*/, 100.0 /*hp*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_setProf(PlayerName(playerid),1);
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			Profissao[playerid] = 1;
			Petrol[playerid] = 15;
			udb_setGasoline(PlayerName(playerid),Petrol[playerid]);
			SetPlayerColor(playerid, COLOR_DESEMPREGADO);
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SendClientMessage(playerid, COLOR_GREEN, "Registrado e logado.");
			SendClientMessage(playerid, COLOR_GREEN, "Você tem $3000 no banco e 15 litros de combustível para começar a viver.");
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
			udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
			LogarPlayer(playerid);
			SendClientMessage(playerid, COLOR_GREEN, "Logado");
			return 1;
		}
		else {
	       // Login was incorrect
			SendClientMessage(playerid, COLOR_RED, "SENHA INCORRETA");
			return 1;
	    }

	}
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
			    SendClientMessage(playerid, COLOR_GREEN, "Casa salva");
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
			    SendClientMessage(playerid, COLOR_GREEN, "Casa salva");
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

//--------------------------- COMANDOS DE VENDEDOR DE VEICULOS ----------------//
    if(strcmp(cmd, "/veiculo", true) == 0) {
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
				SendClientMessage(playerid, COLOR_RED, "/veiculo [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			ang = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/veiculo [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			set(nome, tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/veiculo [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			cor1 = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/veiculo [id] [rotação] [nick] [cor1] [cor2]");
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
                    SetTimerEx("setcar",10000,false,"dffffdd",carid,X,Y,Z,ang,cor1,cor2);
                    SendClientMessage(playerid, COLOR_GREEN, "Veículo salvo!");
					return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Você não está em nenhum veículo e assim e assim não pode setar um carro.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		}
		if(Profissao[playerid] != VENDEDOR_DE_CARROS){
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/skin", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/skin [id] [id-do-skin]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/skin [id] [id-do-skin]");
				return 1;
			}
			skin = strval(tmp);
			if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
				SendClientMessage(playerid, COLOR_RED, "Skin ID Inválido!");
				return 1;
			}
			if(IsPlayerConnected(plid)){
			    udb_setSkin(PlayerName(plid), skin);
				SendClientMessage(playerid, COLOR_GREEN, "Skin Setado.");
				SendClientMessage(plid, COLOR_GREEN, "Seu skin foi comprado!");
				SetPlayerPos(plid, -1958.5107, 293.6747, 35.4688);
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
        SendClientMessage(playerid, COLOR_COP_ELITE, "DT® Strike RPG");
        SendClientMessage(playerid, COLOR_WHITE, "/comandos : comandos do RPG");
        SendClientMessage(playerid, COLOR_WHITE, "/registrar [senha] : Se registra no jogo.");
        SendClientMessage(playerid, COLOR_WHITE, "/entrar [senha] : Se loga no jogo (Você tem que ter registro)");
        SendClientMessage(playerid, COLOR_WHITE, "/aprender : Mostra uma breve explicação sobre o RPG.");
        SendClientMessage(playerid, COLOR_WHITE, "/creditos : Vê os creditos do RPG Mode");
		return 1;
	}
	
	if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_WHITE, "|-----------------| DT® Strike RPG |------------------|");
	    SendClientMessage(playerid, COLOR_WHITE, "|-                                                   -|");
	    SendClientMessage(playerid, COLOR_WHITE, "|----------------| Gamemode original |----------------|");
        SendClientMessage(playerid, COLOR_WHITE, "|-                                                   -|");
		SendClientMessage(playerid, COLOR_WHITE, "|-	   SolidNuts, TheHitman, Luigui e DaMNeD       -|");
	    SendClientMessage(playerid, COLOR_WHITE, "|-                                                   -|");
	    SendClientMessage(playerid, COLOR_WHITE, "|-------------------| Editado por |-------------------|");
	    SendClientMessage(playerid, COLOR_WHITE, "|-                                                   -|");
	    SendClientMessage(playerid, COLOR_WHITE, "|-                      Rafael                       -|");
	    SendClientMessage(playerid, COLOR_WHITE, "|-----------------------------------------------------|");
		return 1;
	}

	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_COP_ELITE, "DT® Strike RPG");
	    SendClientMessage(playerid, COLOR_WHITE, "Este servidor é um RPG, ou seja, simula como se fosse a vida real.");
	    SendClientMessage(playerid, COLOR_WHITE, "Nele você arranja um emprego para ganhar dinheiro para pode comprar sua casa, carros, etc.");
	    SendClientMessage(playerid, COLOR_WHITE, "Como na vida real, existem crimes, como roubo e morte, e neste mode a policia irá te prender caso você cometa algum crime.");
		SendClientMessage(playerid, COLOR_WHITE, "Você também só pode dirigir com habilitação (terrestre para carros e motos, naútica para barcos e a aérea para helicópteros e aviões).");
		SendClientMessage(playerid, COLOR_WHITE, "Caso a policia te pegue andando sem habilitação, você vai tomar uma multa e poderá até ser preso.");
		SendClientMessage(playerid, COLOR_WHITE, "Espero que você se divirta neste servidor. Boa diversão!");
		SendClientMessage(playerid, COLOR_GRAY, "Digite /ajuda ou /comandos para visualizar os comandos.");
		return 1;
	}
	
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_COP_ELITE, "Comandos do RPG - Parte 1");
		SendClientMessage(playerid, COLOR_WHITE, "/profs : Mostra as profissões do RPG.");
		SendClientMessage(playerid, COLOR_WHITE, "/190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(playerid, COLOR_WHITE, "/transferir : Envia dinheiro a algum jogador.");
		SendClientMessage(playerid, COLOR_WHITE, "/presos : Vê a lista de pessoas presas.");
		SendClientMessage(playerid, COLOR_WHITE, "/trancar : Tranca seu carro.");
		SendClientMessage(playerid, COLOR_WHITE, "/procurados : Vê a lista de procurados pela policia");
		SendClientMessage(playerid, COLOR_WHITE, "/destrancar : Destranca seu carro.");
		SendClientMessage(playerid, COLOR_WHITE, "/documentos [id] : Mostra seus documentos.");
        SendClientMessage(playerid, COLOR_COP_ELITE, "Para mais comandos, escreva /comandos2");
		return 1;
	}
	if(strcmp(cmd, "/comandos2", true) == 0) {
	    SendClientMessage(playerid, COLOR_COP_ELITE, "Comandos do RPG - Parte 2");
		SendClientMessage(playerid, COLOR_WHITE, "/pescar : Joga a rede pra pescar, você deve estar na área de pesca.");
		SendClientMessage(playerid, COLOR_WHITE, "/venderpesca : Vende suas pescas.");
		SendClientMessage(playerid, COLOR_WHITE, "/say [texto] : Manda mensagem para pessoas proximas a você.");
		SendClientMessage(playerid, COLOR_WHITE, "/relogio : Mostra o horário em San Fierro.");
		SendClientMessage(playerid, COLOR_WHITE, "/profissao : Comandos de sua profissão.");
		SendClientMessage(playerid, COLOR_WHITE, "/taxi [lugar] : Chama um taxi. | /banco : Comandos do Banco.");
		SendClientMessage(playerid, COLOR_WHITE, "/gas [litros] : Compra gasolina (você deve estar no posto para usar este comando).");
		SendClientMessage(playerid, COLOR_WHITE, "/pagar [id] [quantidade] : Paga por algum serviço de corretor ou vendedor de carros.");
		SendClientMessage(playerid, COLOR_COP_ELITE, "Esses são os comandos do RPG.");
		return 1;
	}
	
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_COP_ELITE, "Comandos do Banco");
        SendClientMessage(playerid, COLOR_WHITE, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_WHITE, "/sacar [quantia] : Retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_WHITE, "/extrato : Checa seu o saldo bancário..");
        SendClientMessage(playerid, COLOR_WHITE, "/extratocell : checa seu o saldo bancário através do seu celular, custo $20.");
        SendClientMessage(playerid, COLOR_COP_ELITE, "Você precisa estar em um banco para usar esses comandos, menos o /extratocell.");
        SendClientMessage(playerid, COLOR_COP_ELITE, "Bancos: Hotel, Car Shop, San Fierro Train Station e SA Federal Mint.");
		return 1;
	}

	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_WHITE, "Profissões disponíveis no DT® Strike RPG : Parte 1");
        SendClientMessage(playerid, COLOR_DESEMPREGADO, "1 - Desempregado (Salário: $350)");
        SendClientMessage(playerid, COLOR_TAXISTA, "2 - Taxista (Salário: $900)");
        SendClientMessage(playerid, COLOR_VENDEDOR, "3 - Vendedor de carros (Salário: $200 + os carros que vende)");
        SendClientMessage(playerid, COLOR_CORRETOR, "4 - Corretor de imóveis (Salário: $200 + as casas que vende)");
        SendClientMessage(playerid, COLOR_ASSASSINO, "5 - Assassino (Salário: O dinheiro de quem matar)");
        SendClientMessage(playerid, COLOR_BARMAN, "6 - Barman (Salário: $800 + as bebidas que vender)");
        SendClientMessage(playerid, COLOR_JUIZ, "7 - Juiz (Salário: $2000)");
        SendClientMessage(playerid, COLOR_SEGURANÇA, "8 - Segurança (Salário: $800 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_WHITE, "Digite /profs2 para ver mais profissões");
        return 1;
    }
    if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COLOR_WHITE, "Profissões disponíveis no DT® Strike RPG : Parte 2");
        SendClientMessage(playerid, COLOR_MOTORISTA, "9 - Motorista Particular (Salário: $850 + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_COP_CIVIL, "10 - Policial Civil (Salário: $1200)");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "11 - Policial Rodoviario (Salário: $1200)");
        SendClientMessage(playerid, COLOR_COP_ELITE, "12 - Policial Elite/SWAT (Salário: $3000)");
        SendClientMessage(playerid, COLOR_AGRICULTOR, "13 - Agricultor (Salário: $700 + o que ganhar na venda de plantações)");
        SendClientMessage(playerid, COLOR_PESCADOR, "14 - Pescador (Salário: $750 + o que ganha na pesca)");
        SendClientMessage(playerid, COLOR_INSTRUTOR, "15 - Instrutor de direção (Salário: $600 + as habilitações que vender)");
		SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "16 - Motorista de ônibus (Salário: $900)");
        SendClientMessage(playerid, COLOR_GRAY, "Essas são as profissões do DT® Strike RPG Mode.");
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
	}

	if(strcmp(cmd, "/transferir", true) == 0) {
		new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id] [quantidade]");
			return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id] [quantidade]");
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
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, 0 - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, San Fierro Train Station, San Andreas Federal Mint.");
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
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Você retirou $%d do banco. seu saldo atual é de $%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, San Fierro Train Station, San Andreas Federal Mint.");
			return 1;
		}
	}

    if(strcmp(cmd, "/extrato", true) == 0) {
		new string[256];
        if(IsPlayerInCheckpoint(playerid)){
			format(string, sizeof(string), "Você tem %d na conta %d", udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, San Fierro Train Station, San Andreas Federal Mint.");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/extratocell", true) == 0) {
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
	}

    if(strcmp(cmd, "/gas", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "Uso: /gas [litros]");
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
		    	format(string, sizeof(string), "Você comprou %d litros de gasolina", quantidade);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantidade);
				return 1;
			}
			if(quantidade + Petrol[playerid] >= 100){
		    	new quantia;
		    	quantia = 100 - Petrol[playerid];
		    	Petrol[playerid] = 100;
				format(string, sizeof(string), "seu tanque ficou completo. só colocamos %d litros.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantia);
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não está no Posto!");
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
			SendClientMessage(playerid, COLOR_RED, "/pagar [id] [quantidade]");
			return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/pagar [id] [quantidade]");
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
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COLOR_RED, "Você está tentando pagaer a alguem que não é coretoe e nem vendedor!");
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
			SendClientMessage(playerid, COLOR_RED, "/documentos [id].");
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
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado");
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
	    SendClientMessage(playerid, COLOR_YELLOW, "Lista de presos");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Presos[i] == 1){
				format(string, sizeof(string), "%d: %s", i, PlayerName(i));
				SendClientMessage(i, COLOR_YELLOW, string);
				return 1;
			}
		}
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
		}
	}
	if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "São %d:00 horas na região de San Fierro", worldTime);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}
	
//------------------------- FIM DOS COMANDOS PARA TODOS OS PLAYERS -----------//

//------------------------- COMANDOS DE INSTRUTOR ----------------------------//

	if(strcmp(cmd, "/aerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/aerea [id]");
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
				SendClientMessage(playerid, COLOR_RED, "/terrestre [id]");
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
				SendClientMessage(playerid, COLOR_RED, "/nautica [id]");
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
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
			return 1;
		}
	}

//------------------------- FIM DOS COMANDOS DE INSTRUTOR --------------------//

//------------------------- COMANDOS DE PESCADOR -----------------------------//

	if(strcmp(cmd, "/pescar", true) == 0) {
		if(AreaPesca[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está na área de pesca!");
		    return 1;
		}
		if(Pescando[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "Espere a rede voltar para poder pescar mais...");
		    return 1;
		}
		else{
		    Pescando[playerid] = 1;
		    TogglePlayerControllable(playerid,0);
		    SendClientMessage(playerid, COLOR_GREEN, "Você jogou a rede para pescar!");
		    SendClientMessage(playerid, COLOR_GREEN, "Agora aguarde o peixe morder a isca...");
		    SetTimerEx("Pesca",20000,false,"d",playerid);
		    return 1;
		}
	}
	if(strcmp(cmd, "/venderpesca", true) == 0) {
	    new str[256];
	    if(AreaMercado[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "Você não está no mercado!");
	        return 1;
		}
		if(Pescado[playerid] < 1){
		    SendClientMessage(playerid, COLOR_RED, "Você não possui nenhuma pesca, como poderá vender?");
		    return 1;
		}
		else{
			if(Profissao[playerid] == PESCADOR || IsPlayerAdmin(playerid)){
			    GivePlayerMoney(playerid,Pescado[playerid]*70);
				format(str,sizeof(str),"Você vendeu sua pesca e faturou $%d com a venda!",Pescado[playerid]*70);
				SendClientMessage(playerid, COLOR_GREEN, str);
				Pescado[playerid] = 0;
				return 1;
			}
			else if(Profissao[playerid] != PESCADOR && !IsPlayerAdmin(playerid)){
                GivePlayerMoney(playerid,Pescado[playerid]*30);
				format(str,sizeof(str),"Você vendeu sua pesca e faturou $%d com a venda!",Pescado[playerid]*30);
				SendClientMessage(playerid, COLOR_GREEN, str);
				Pescado[playerid] = 0;
				return 1;
			}
	    }
   }
   
//------------------------- FIM DOS COMANDOS DE PESCADOR ---------------------//

//------------------------- COMANDOS DE TRAFICANTE ---------------------------//

	if(strcmp(cmd,"/maconha",true) == 0){
        if(Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "Você não é Traficante!");
	    new tmp[256];
	    new plid,doses;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "/maconha [id] [doses]");
		    return 1;
		}
		tmp = strtok(cmdtext,idx);
		doses = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/maconha [id] [doses]");
		    return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		    return 1;
		}
		if(GetDistanceBetweenPlayers(playerid,plid) > 7){
			SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
			return 1;
		}
		if(doses < 1 || doses > 7){
		    SendClientMessage(playerid, COLOR_RED, "ERRO: Doses de 1 à 7.");
		    return 1;
		}
		if(GetPlayerMoney(plid) < doses*50){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador não tem dinheiro, CUSTO: $50 cada dose.");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"Maconha vendida! Você vendeu %d dose(s) e lucrou $%d com a venda!",doses,doses*50/2);
		    SendClientMessage(playerid, COLOR_GREEN, string);
			format(string,sizeof(string),"%s lhe vendeu %d dose(s) de maconha e você pagou $%d por elas",PlayerName(playerid),doses,doses*50);
			SendClientMessage(plid, COLOR_GREEN, string);
			GivePlayerMoney(playerid,doses*50/2);
			GivePlayerMoney(plid,-doses*50);
			drogas[plid][0] = drogas[plid][0] + doses;
			format(string,sizeof(string),"O seu sangue apresenta %d dose(s) fumada(s) de maconha agora!",drogas[plid][0]);
			SendClientMessage(plid, COLOR_GREEN, string);
			return 1;
		}
	}
	if(strcmp(cmd,"/cocaina",true) == 0){
        if(Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "Você não é Traficante!");
	    new tmp[256];
	    new plid,doses;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "/cocaina [id] [doses]");
		    return 1;
		}
		tmp = strtok(cmdtext,idx);
		doses = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/cocaina [id] [doses]");
		    return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		    return 1;
		}
		if(GetDistanceBetweenPlayers(playerid,plid) > 7){
			SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
			return 1;
		}
		if(doses < 1 || doses > 7){
		    SendClientMessage(playerid, COLOR_RED, "ERRO: Doses de 1 à 7.");
		    return 1;
		}
		if(GetPlayerMoney(plid) < doses*30){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador não tem dinheiro, CUSTO: $30 cada dose.");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"Cocaína vendida! Você vendeu %d dose(s) e lucrou $%d com a venda!",doses,doses*30/2);
		    SendClientMessage(playerid, COLOR_GREEN, string);
			format(string,sizeof(string),"%s lhe vendeu %d dose(s) de cocaína e você pagou $%d por elas",PlayerName(playerid),doses,doses*30);
			SendClientMessage(plid, COLOR_GREEN, string);
			GivePlayerMoney(playerid,doses*30/2);
			GivePlayerMoney(plid,-doses*30);
			drogas[plid][1] = drogas[plid][1] + doses;
			format(string,sizeof(string),"O seu sangue apresenta %d dose(s) cheirada(s) de cocaína agora!",drogas[plid][1]);
			SendClientMessage(plid, COLOR_GREEN, string);
			return 1;
		}
	}
	if(strcmp(cmd,"/heroina",true) == 0){
        if(Profissao[playerid] != TRAFICANTE && !IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "Você não é Traficante!");
	    new tmp[256];
	    new plid,doses;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, COLOR_RED, "/heroina [id] [doses]");
		    return 1;
		}
		tmp = strtok(cmdtext,idx);
		doses = strval(tmp);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/heroina [id] [doses]");
		    return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		    return 1;
		}
		if(GetDistanceBetweenPlayers(playerid,plid) > 7){
			SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
			return 1;
		}
		if(doses < 1 || doses > 7){
		    SendClientMessage(playerid, COLOR_RED, "ERRO: Doses de 1 à 7.");
		    return 1;
		}
		if(GetPlayerMoney(plid) < doses*60){
		    SendClientMessage(playerid, COLOR_RED, "Esse jogador não tem dinheiro, CUSTO: $60 cada dose.");
		    return 1;
		}
		else{
		    new string[256];
		    format(string,sizeof(string),"Heroina vendida! Você vendeu %d dose(s) e lucrou $%d com a venda!",doses,doses*60/2);
		    SendClientMessage(playerid, COLOR_GREEN, string);
			format(string,sizeof(string),"%s lhe vendeu %d dose(s) de heroina e você pagou $%d por elas",PlayerName(playerid),doses,doses*60);
			SendClientMessage(plid, COLOR_GREEN, string);
			GivePlayerMoney(playerid,doses*60/2);
			GivePlayerMoney(plid,-doses*60);
			drogas[plid][2] = drogas[plid][2] + doses;
			format(string,sizeof(string),"O seu sangue apresenta %d dose(s) injetada(s) de heroina agora!",drogas[plid][2]);
			SendClientMessage(plid, COLOR_GREEN, string);
			return 1;
		}
	}
	
//------------------------- FIM DOS COMANDOS DE TRAFICANTE -------------------//

//------------------------- COMANDOS DE AGRICULTOR ---------------------------//

    if(strcmp(cmd, "/plantar", true) == 0) {
        if(Profissao[playerid] != AGRICULTOR && !IsPlayerAdmin(playerid)){
            SendClientMessage(playerid, COLOR_RED, "Você não pode usar esse comando!");
            return 1;
		}
		if(AreaFazenda[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está na fazenda!");
		    return 1;
		}
		if(Plantando[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "Espere a colheita para plantar novamente!");
		    return 1;
		}
		else{
		    Plantando[playerid] = 1;
		    SendClientMessage(playerid, COLOR_GREEN, "Pronto... Você iniciou uma plantação!");
		    SendClientMessage(playerid, COLOR_GREEN, "Agora espere o encasamento e a colheita para poder vender.");
		    SetTimerEx("Colheita",20000,false,"d",playerid);
		    return 1;
		}
	}
	
	if(strcmp(cmd, "/colher", true) == 0) {
	    if(Profissao[playerid] != AGRICULTOR && !IsPlayerAdmin(playerid)){
            SendClientMessage(playerid, COLOR_RED, "Você não pode usar esse comando!");
            return 1;
		}
	    if(Plantacao[playerid] < 1){
			SendClientMessage(playerid, COLOR_RED, "Você não possui nada para colher!");
			return 1;
		}
		if(AreaFazenda[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está na fazenda!");
		    return 1;
		}
		else{
			Verduras[playerid] = Plantacao[playerid];
			Plantacao[playerid] = 0;
			new str[256];
			format(str,sizeof(str),"Você colheu %d verdura(s)! Agora pode ir no mercado para vende-la(s).");
			SendClientMessage(playerid, COLOR_YELLOW, str);
			return 1;
		}
	}
	
	if(strcmp(cmd, "/venderplantacoes", true) == 0) {
	    if(Verduras[playerid] < 1){
	        SendClientMessage(playerid, COLOR_RED, "Você não possui nenhuma verdura para vender.");
	        return 1;
		}
		if(AreaMercado[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está no mercado!");
		    return 1;
		}
		else{
		    GivePlayerMoney(playerid,Verduras[playerid]*50);
			new str[256];
			format(str,sizeof(str),"Você vendeu %d verduras e recebeu $%d",Verduras[playerid],Verduras[playerid]*50);
			SendClientMessage(playerid, COLOR_YELLOW, str);
			Verduras[playerid] = 0;
			return 1;
		}
	}
//------------------------- FIM DOS COMANDOS DE AGRICULTOR -------------------//

//------------------------- COMANDOS DE POLICIAL -----------------------------//

	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
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
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
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
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
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
				SendClientMessage(playerid, COLOR_GREEN, "Mais um para você perseguir agora.");
				format(string, sizeof(string), "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_WHITE, "SERVER: Unknown command.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
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
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
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
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
	if(strcmp(cmd, "/examedrogas", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "/examedrogas [id]");
			    return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
			    return 1;
			}
			if(GetDistanceBetweenPlayers(playerid,plid) > 7){
			    SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
			    return 1;
			}
			else{
				new string[256];
				format(string,sizeof(string),"Resultado do exame:");
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string,sizeof(string),"Maconha: %d dose(s) fumada(s)",drogas[plid][0]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				format(string,sizeof(string),"Cocaína: %d dose(s) cheirada(s)",drogas[plid][1]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				format(string,sizeof(string),"Heroína: %d dose(s) injetada(s)",drogas[plid][2]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				format(string,sizeof(string),"Exame feito em %s",PlayerName(plid));
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
		else if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
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
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
//--------------------------- FIM DOS COMANDOS DE POLICIAL ------------------//

//--------------------------- COMANDOS DE ADMINISTRADORES -------------------//
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
            if(prof > 1 && prof < 40){
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
				else if(prof == AGRICULTOR) {
					SetPlayerColor(plid, COLOR_AGRICULTOR); // Claro
					return 1;
				}
				else if(prof == TRAFICANTE) {
					SetPlayerColor(plid, COLOR_TRAFICANTE); // Claro
					return 1;
				}
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Essa não é uma profisssão válida!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
		}
	}
	
//--------------------------- FIM DOS COMANDOS DE ADMINISTRADORES ------------//
	
	
//------------------- COMANDO PARA VER OS COMANDOS DA SUA PROFISSAO ---------//

	if (strcmp(cmdtext, "/profissao", true)==0){
		if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_GREEN, "Taxista - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
		if(Profissao[playerid] == TRAFICANTE) {
		    SendClientMessage(playerid, COLOR_GREEN, "Traficante - Comandos:");
            SendClientMessage(playerid, COLOR_YELLOW, "/maconha [id] [doses] : Vende maconha para um jogador (Custo: $50 cada dose)");
			SendClientMessage(playerid, COLOR_YELLOW, "/cocaina [id] [doses] : Vende cocaína para um jogador (Custo: $30 cada dose)");
			SendClientMessage(playerid, COLOR_YELLOW, "/heroina [id] [doses] : Vende heroína para um jogador (Custo: $60 cada dose)");
			SendClientMessage(playerid, COLOR_GREEN, "Você receberá 50 por cento do pagamento das drogas que vender!");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_GREEN, "Vendedor de carros - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/veiculo [id-do-veículo] [rotação] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, COLOR_YELLOW, "/skin [id] [id-do-skin] : Vende um skin para alguém.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Corretor de imóveis - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/sethome [nick] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_GREEN, "Barman - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COLOR_GREEN, "Juiz - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/soltar [id] : Solta uma pessoa da cadeia.");
		}
		else if(Profissao[playerid] == PESCADOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Pescador - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/pescar : Joga a rede para pescar, você tem que estar na área de pesca.");
			SendClientMessage(playerid, COLOR_YELLOW, "/venderpesca : Vende suas pescas, você tem que estar no mercado.");
		}
		else if(Profissao[playerid] == AGRICULTOR) {
		    SendClientMessage(playerid, COLOR_GREEN, "Agricultor - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/plantar : Iniciar uma plantação, você tem que estar na fazenda.");
			SendClientMessage(playerid, COLOR_YELLOW, "/colher : Colher uma plantação, você tem que estar na fazenda.");
			SendClientMessage(playerid, COLOR_YELLOW, "/venderplantacoes : Vende suas plantações, você tem que estar no mercado.");
		}
		else if(Profissao[playerid] == COP_CIVIL) {
			SendClientMessage(playerid, COLOR_GREEN, "Policial Civil - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [quantidade] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_YELLOW, "/examedrogas [id] : Faz exame de drogas em um jogador.");
		}
		else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_GREEN, "Policial Rodoviario - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [quantidade] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_YELLOW, "/examedrogas [id] : Faz exame de drogas em um jogador.");
		}
		else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COLOR_GREEN, "Policial Elite/SWAT - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [quantidade] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_YELLOW, "/examedrogas [id] : Faz exame de drogas em um jogador.");
		}
        else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		    SendClientMessage(playerid, COLOR_GREEN, "Instrutor de direção - Comandos:");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/aerea [id] : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COLOR_YELLOW, "/terrestre [id] : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_YELLOW, "/nautica [id] : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_GREEN, "Sua profissão não tem nenhum comando especial!");
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
		}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
			return 1;
		}
	}

//-------------------------- FIM DOS COMANDOS DE TAXISTA ---------------------//

	
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
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Drink Vendido e tomado");
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
	new Ptmess[256];
	if(newstate == PLAYER_STATE_DRIVER){
		if(Petrol[playerid] <= 0){
			RemovePlayerFromVehicle(playerid);
			Petrol[playerid] = 0;
			SendClientMessage(playerid, COLOR_RED, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
        	return 0;
		}
		if(Petrol[playerid] > 50){
		    Petrol[playerid]--;
			format(Ptmess, sizeof(Ptmess), "~w~gasolina ->%d", Petrol[playerid]);
			GameTextForPlayer(playerid, Ptmess, 5000, 1);
        	return 0;
		}
		if(Petrol[playerid] <= 50 || Petrol[playerid] >= 1){
		    Petrol[playerid]--;
			format(Ptmess, sizeof(Ptmess), "~w~gasolina ->~r~%d", Petrol[playerid]);
			GameTextForPlayer(playerid, Ptmess, 5000, 1);
        	return 0;
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
	printf("OnPlayerEnterCheckpoint(%d)", playerid);
	return 1;
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

public Areas()
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			if(X >= 1700.1732 && X <= 1741.9966 && Y >= -1721.5967 && Y <= -1605.9054){
				if(AreaBanco[i] == 0) {
				    GameTextForPlayer(i,"~g~banco",5000,4);
				    SendClientMessage(i, COLOR_WHITE, "Banco para mais informações digite: /banco");
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 1721.9133, -1719.0149, 13.5345, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 972.7372 && X <= 1072.9083 && Y >= -1133.2140 && Y <= -1110.8668){
				if(AreaBanco[i] == 0) {
				    GameTextForPlayer(i,"~g~banco",5000,4);
				    SendClientMessage(i, COLOR_WHITE, "Banco para mais informações digite: /banco");
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 1022.6587, -1122.4553, 23.8714, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 385.5901 && X <= 409.1007 && Y >= -1823.7596 && Y <= -1797.2906){
				if(AreaBanco[i] == 0) {
				    GameTextForPlayer(i,"~g~banco",5000,4);
				    SendClientMessage(i, COLOR_WHITE, "Banco para mais informações digite: /banco");
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 398.2190, -1805.7782, 7.8380, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1785.4990 && X <= -1714.4250 && Y >= 929.3326 && Y <= 974.9125){
				if(AreaBanco[i] == 0) {
				    GameTextForPlayer(i,"~g~banco",5000,4);
				    SendClientMessage(i, COLOR_WHITE, "Banco para mais informações digite: /banco");
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -1746.1671, 962.5413, 24.8906, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1978.6537 && X <= -1961.9292 && Y >= 113.2442 && Y <= 162.6734){
				if(AreaBanco[i] == 0) {
				    GameTextForPlayer(i,"~g~banco",5000,4);
				    SendClientMessage(i, COLOR_WHITE, "Banco para mais informações digite: /banco");
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -1974.0306, 117.4207, 27.6875, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2482.7346 && X <= -2386.7249 && Y >= 461.5373 && Y <= 552.1155){
				if(AreaBanco[i] == 0) {
				    GameTextForPlayer(i,"~g~banco",5000,4);
				    SendClientMessage(i, COLOR_WHITE, "Banco para mais informações digite: /banco");
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -2446.5322, 522.0310, 30.2329, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if((X >= -1666.3102 && Y <= 418.1154 && X <= 670.9482 && Y >= -589.7477) || (X >= -117.3342 && Y >= -1194.0710 && X <= -56.5731 && Y <= -1158.9866) || (X >= 1906.3308 && Y >= -1795.3513 && X <= 1953.3729 && Y <= -1759.7977) || (X <= 1011.8674 && X >= 978.0131 && Y <= -890.4835 && Y >= -945.2622)){
			    if(AreaPosto[i] == 0){
			        GameTextForPlayer(i,"~b~posto",5000,4);
			        SendClientMessage(i, COLOR_WHITE, "Posto para abastecer digite: /gas [litros]");
					AreaPosto[i] = 1;
				}
			}
			else if(X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717){
			    if(AreaFazenda[i] == 0){
			    	GameTextForPlayer(i,"~y~fazenda",5000,4);
			    	AreaFazenda[i] = 1;
			    	if(Profissao[i] == AGRICULTOR || IsPlayerAdmin(i)) SendClientMessage(i, COLOR_WHITE, "Bem vindo à fazenda para plantar digite: /plantar");
				}
			}
			else if(X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425){
			    if(AreaPesca[i] == 0){
			        GameTextForPlayer(i,"~w~area de pesca",5000,4);
			        SendClientMessage(i, COLOR_WHITE, "Área de pesca para pescar digite: /pescar");
			        AreaPesca[i] = 1;
				}
			}
			else if(X >= -2464.8757 && X <= -2419.2104 && Y <= 727.6952 && Y >= 757.9623){
			    if(AreaMercado[i] == 0){
			        GameTextForPlayer(i,"~r~mercado",5000,4);
			        AreaMercado[i] = 1;
				}
			}
			else {
				if(AreaBanco[i] == 1) {
					DisablePlayerCheckpoint(i);
					AreaBanco[i] = 0;
				}
				if(AreaMercado[i] == 1) {
					AreaMercado[i] = 0;
				}
				if(AreaPosto[i] == 1) {
					AreaPosto[i] = 0;
				}
				if(AreaFazenda[i] == 1) {
					AreaFazenda[i] = 0;
				}
				if(AreaPesca[i] == 1) {
					AreaPesca[i] = 0;
				}
			}
		}
	}
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
					format(Ptmess, sizeof(Ptmess), "~w~gasolina ->~g~%d", Petrol[i]);
					GameTextForPlayer(i, Ptmess, 5000, 1);
					return 1;
				}
				if(Petrol[i] < 25 || Petrol[i] >= 1){
					format(Ptmess, sizeof(Ptmess), "~w~gasolina ->~r~%d", Petrol[i]);
					GameTextForPlayer(i, Ptmess, 5000, 1);
					return 1;
				}
			}
		}
	}
	return 1;
}
public setcar(carid, Float:X, Float:Y, Float:Z, Float:ang, cor1, cor2) 		CreateVehicle(carid,X,Y,Z,ang,cor1,cor2,-1);

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
	else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COLOR_AGRICULTOR); // Claro
	}
    else if(Profissao[playerid] == TRAFICANTE) {
		SetPlayerColor(playerid, COLOR_TRAFICANTE); // Claro
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
	            SendClientMessage(i, COLOR_YELLOW, "Você foi solto por agora, não cometa mais crimes se não irá pagar novamente.");
			}
			if(TempoPreso[i] < 10){
			    TempoPreso[i]++;
			}
		}
	}
}
public Colheita(playerid)
{
	Plantando[playerid] = 0;
	Plantacao[playerid]++;
	SendClientMessage(playerid, COLOR_YELLOW, "Você já pode colher sua plantação para vende-la!");
	return 1;
}
public Pesca(playerid)
{
	if(IsPlayerConnected(playerid) && Pescando[playerid] == 1){
    	Pescando[playerid] = 0;
		TogglePlayerControllable(playerid,1);
		new rand = random(2);
		if(rand == 0){
			SendClientMessage(playerid, COLOR_YELLOW, "Sua rede voltou mas você não conseguiu pescar nada!");
			new prejuizo = random(50)+50;
			new str[256];
			format(str,sizeof(str),"Foi lhe dado um prejuízo de $%d pelas iscas que você gastou.",prejuizo);
			SendClientMessage(playerid, COLOR_RED, str);
			GivePlayerMoney(playerid,-prejuizo);
		}
		else{
	    	new pescado = random(6)+1;
			new str[256];
			format(str,sizeof(str),"Sua rede voltou e você conseguiu pescar %d peixes!",pescado);
			SendClientMessage(playerid, COLOR_YELLOW, str);
			Pescado[playerid] = Pescado[playerid]+pescado;
			format(str,sizeof(str),"Agora você possui %d peixes no total.",Pescado[playerid]);
			SendClientMessage(playerid, COLOR_YELLOW, str);
		}
	}
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

public Tempo()
{
	worldTime++;
	worldTime%=24;
	SetWorldTime(worldTime);
	
	for(new i=0; i<MAX_PLAYERS; i++) {
		if(worldTime==0){
			if(IsPlayerConnected(i)){
				if(Profissao[i] == DESEMPREGADO) {
					SendClientMessage(i, COLOR_DESEMPREGADO, "Seu seguro desemprego foi depositado: $350");
					SendClientMessage(i, COLOR_RED, "Não vai procurar emprego?");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 350);
				}
				else if(Profissao[i] == TAXISTA) {
					SendClientMessage(i, COLOR_TAXISTA, "Seu salário governamental foi depositado: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == VENDEDOR_DE_CARROS) {
					SendClientMessage(i, COLOR_VENDEDOR, "Seu salário governamental foi depositado: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == CORRETOR) {
					SendClientMessage(i, COLOR_CORRETOR, "Seu salário governamental foi depositado: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == BARMAN) {
					SendClientMessage(i, COLOR_BARMAN, "Seu salário governamental foi depositado: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
				}
				else if(Profissao[i] == SEGURANÇA) {
					SendClientMessage(i, COLOR_SEGURANÇA, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == MOTORISTA_PARTICULAR) {
					SendClientMessage(i, COLOR_MOTORISTA, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == COP_CIVIL) {
					SendClientMessage(i, COLOR_COP_CIVIL, "Seu salário governamental foi depositado: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_RODOVIARIO) {
					SendClientMessage(i, COLOR_COP_RODOVIARIO, "Seu salário governamental foi depositado: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == COP_ELITE) {
					SendClientMessage(i, COLOR_COP_ELITE, "Seu salário governamental foi depositado: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
				else if(Profissao[i] == PESCADOR) {
					SendClientMessage(i, COLOR_PESCADOR, "Seu salário governamental foi depositado: $750");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 750);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					SendClientMessage(i, COLOR_INSTRUTOR, "Seu salário governamental foi depositado: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 600);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					SendClientMessage(i, COLOR_MOTORISTA_ONIBUS, "Seu salário governamental foi depositado: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == AGRICULTOR) {
					SendClientMessage(i, COLOR_AGRICULTOR, "Seu salário governamental foi depositado: $700");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 700);
				}
				else if(Profissao[i] == TRAFICANTE) {
					SendClientMessage(i, COLOR_TRAFICANTE, "Seu salário foi depositado: $400");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 400);
				}
			}
		}
	}
}

