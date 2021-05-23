#include <a_players>
#include <a_samp>
#include <a_vehicles>
#include <dudb>

#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256
/*cores*/
#define VERDE                  	0x008000AA
#define VERDE2                 	0x2ff700AA
#define VERMELHO               	0xAA3333AA
#define AMARELO                	0xFFFF00AA
#define BRANCO                 	0xFFFFFFAA
#define CINZA                  	0x636463AA
#define AZUL                    0x253ED6AA
#define AZUL2                   0x74F0FFAA
#define cNOEMPREGO              0x666666AA
#define cCRIMINOSO              0x7DF198FF
#define cTAXISTA                0xF2F5BAAA
#define cPOLICIA                0x76CDFFAA
#define cCOMIDA		        	0xB7BE49AA
#define cAUTOESCOLA             0xFF7963AA
#define cMEDICO                 0xFCFAFAAA
#define cMOTORISTA          	0x68A4E8AA
#define cPOSTO                  0x92E868AA
#define cLIXEIRO 				0x0473B3AA
#define cCARROS                 0xC4F16DAA
#define cCASA                   0x27F7F5AA

/*profs*/
#define NOEMPREGO             	1///feito
#define CRIMINOSO              	2///feito
#define TAXISTA                	3///feito
#define POLICIA                	4///feito
#define COMIDA                 	5///feito
#define AUTOESCOLA             	6///feito
#define MEDICO                 	7///feito
#define MOTORISTA          		8///feito
#define POSTO                  	9///feito
#define LIXEIRO                 10//feito
#define CARROS      			11//feito
#define CASA        			12//feito

#define MAX_JOBS       12

enum HabInfo {
	HabName[256],
	Value
};
new Habilitacoes[3][HabInfo] = {
{"Aérea",1200},
{"Terrestre",1000},
{"Naútica",800}
};
new PizzaSabor[][] = {
"Invalida",
"4 Queijos",
"Strogonoff de Carne",
"Strogonoff de Frango",
"Mussarela",
"Milho",
"Portuguesa"
};
new BebidaName[][] = {
"Invalida",
"Coca-Cola",
"PEPSI",
"Fanta-Uva",
"Cerveja",
"Vodka"
};
new NomeProf[][] = {
"Inválida",
"Desempregado",
"Criminoso",
"Taxista",
"Policial",
"Entregador de Comida",
"Trabalhador da auto-escola",
"Médico",
"Motorista",
"Frentista de posto",
"Lixeiro",
"Vendedor de Carros",
"Vendedor de Casa"
};
new SkinProf[] = {
1,//invalida
47,//desempregado
29,//criminoso
217,//taxista
281,//policia
155,//entregador de comida
101,//trabalhador da auto escola
276,//medico
184,//motorista
183,//frentista de posto
16,//lixeiro
147,//vendedor de carros
187//vendedor de casa
};
new SalarioProf[] = {
0,//invalida
200,//desempregado
500,//criminoso
700,//taxista
1500,//policia
800,//entregador de comida
1200,//trabalhador da auto escola
900,//medico
600,//motorista
750,//frentista de posto
400,//lixeiro
600,//vendedor de carros
600//vendedor de casa
};
new FraseProf[][] = {
"Inválido",//invalida
"Seu salário de R$200 foi depositado em sua conta.",//desempregado
"Seu salário de R$500 foi depositado em sua conta.",//criminoso
"Seu salário de R$700 foi depositado em sua conta.",//taxista
"Seu salário de R$1500 foi depositado em sua conta.",//policia
"Seu salário de R$800 foi depositado em sua conta.",//entregador de comida
"Seu salário de R$1200 foi depositado em sua conta.",//trabalhador da auto escola
"Seu salário de R$900 foi depositado em sua conta.",//medico
"Seu salário de R$600 foi depositado em sua conta.",//motorista
"Seu salário de R$750 foi depositado em sua conta.",//frentista de posto
"Seu salário de R$400 foi depositado em sua conta.",//lixeiro
"Seu salário de R$600 foi depositado em sua conta.",//vendedor de carros
"Seu salário de R$600 foi depositado em sua conta."//vendedor de casa
};
new Float:Latas[23][3] = {
{-2226.9998,-114.1161,35.3203},
{-2579.2798,240.0270,9.5313},
{-2451.9453,974.6096,45.2969},
{-2283.1306,1220.6294,48.9928},
{-1706.0125,1209.3611,25.1072},
{-1678.4209,438.6348,7.1797},
{-1981.3370,148.3874,27.6875},
{-2289.4851,556.9442,36.5137},
{-2718.1558,459.5445,4.3546},
{-2759.8330,556.6086,14.5547},
{-2520.9822,637.6674,28.2126},
{-2535.0242,720.1595,28.1156},
{-2535.5618,837.4432,49.9768},
{-2534.9985,936.6038,65.0912},
{-2536.5247,1084.7290,55.7266},
{-2650.9133,53.4096,4.1722},
{-2655.3955,71.6940,4.1054},
{-2652.3042,92.5402,4.0960},
{-2655.6499,114.9717,4.1046},
{-2652.9666,132.9274,4.1797},
{-2656.7048,135.3328,4.1797},
{-2278.0525,655.8920,49.4453},
{-2277.6912,697.3953,49.4453}
};
/*-----*/

/*definições gerais*/
new CatandoLatas[MAX_PLAYERS] = 0;
new worldTime;
new worldMinute;
new Logado[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS];
new Gasolina[MAX_PLAYERS];
new job[MAX_PLAYERS];
new roubo[MAX_PLAYERS] = 0;
new taxi[MAX_PLAYERS];
new passageiro[MAX_PLAYERS];
new taxista[MAX_PLAYERS];
new MoneyTaximetro[MAX_PLAYERS][2];
new vendedor[MAX_PLAYERS];
new casa[MAX_PLAYERS] = 0;
new Float:PosicaoCasa[MAX_PLAYERS][4];
new alcool[MAX_PLAYERS] = 0;
new Preso[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;

forward GastandoGasolina();
forward LogarJogador(playerid);
forward FimRoubo(playerid);
forward Taxi();
forward Tempo();
forward Areas();
forward Score();
forward TempoPrisao();

static VEH_TAXI =    420;
/*-----------------*/

main()
{
	print("\n-----------------------------------------");
	print("            .:RPG MODE:.");
	print(" 	  Feito por Rafael e Osorkon");
	print("-----------------------------------------\n");
	worldTime = 12;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
  	if(taxi[playerid] == 1){
  		GivePlayerMoney(taxista[playerid],MoneyTaximetro[playerid][taxista[playerid]]);
  		GivePlayerMoney(playerid,0-MoneyTaximetro[playerid][taxista[playerid]]);
  		SendClientMessage(taxista[playerid], VERDE, "Seu passageiro saiu do taxi mas você recebeu o dinheiro do taximetro.");
  		SendClientMessage(playerid, VERMELHO, "Taxi pago.");
  		MoneyTaximetro[playerid][taxista[playerid]] = 0;
  		taxi[playerid] = 0;
  		taxista[playerid] = 0;
  		passageiro[taxista[playerid]] = 0;
  	}
}
public OnGameModeInit()
{
	SetGameModeText("San Fierro RPG");
    UsePlayerPedAnims();
    EnableTirePopping(1);
	
	/*veículos*/
	AddStaticVehicle(411,-1992.2250,246.9048,34.8990,265.5423,64,1); // Infernus - Wang Cars
	AddStaticVehicle(451,-1991.5210,257.6798,34.8842,268.4449,46,46); // Turismo- Wang Cars
	AddStaticVehicle(541,-1988.3105,305.0172,34.9847,269.5618,51,1); // Bullet - Wang Cars
	AddStaticVehicle(597,-1596.2368,748.4811,-5.4722,180.1384,0,1); // Carro da Policia SF - Delegacia SF
	AddStaticVehicle(597,-1574.0537,742.6495,-5.4732,268.6128,0,1); // Carro da Policia SF - Delegacia SF
	AddStaticVehicle(597,-1574.1193,735.0918,-5.4726,90.4227,0,1); // Carro da Policia SF - Delegacia SF
	AddStaticVehicle(427,-1574.1553,727.1457,-4.8582,88.2920,41,0); // Enforcer - Delegacia SF
	AddStaticVehicle(427,-1604.2622,693.1573,-4.8584,179.5843,41,0); // Enforcer - Delegacia SF
	AddStaticVehicle(427,-1600.2039,679.1010,-4.8576,0.5640,1,0); // Enforcer - Delegacia SF
	AddStaticVehicle(523,-1609.7078,673.8362,-5.6706,2.3501,1,0); // Moto da Policia - Delegacia SF
	AddStaticVehicle(523,-1606.7542,673.5532,-5.6718,3.6898,1,0); // Moto da Policia - Delegacia SF
	AddStaticVehicle(523,-1602.9557,673.2401,-5.6721,2.8357,1,0); // Moto da Policia - Delegacia SF
	AddStaticVehicle(402,-1760.8821,949.1580,24.6494,88.0984,0,0); // Buffalo - Hotel
	AddStaticVehicle(402,-1745.8480,948.9109,24.6539,89.3698,0,0); // Buffalo - Hotel
	AddStaticVehicle(420,-2503.7273,741.2971,34.8019,181.0089,6,1); // Taxi - Praça
	AddStaticVehicle(420,-2500.3098,740.7263,34.8000,180.5107,6,1); // Taxi - Praça
	AddStaticVehicle(420,-2508.2351,740.7378,34.7982,181.0157,6,1); // Taxi - Praça
	AddStaticVehicle(420,-2495.2080,740.3300,34.7952,181.9570,6,1); // Taxi - Praça
	AddStaticVehicle(461,-2459.2449,787.8843,34.7388,85.6322,37,1); // PCJ - Praça
	AddStaticVehicle(461,-2459.5029,793.1034,34.7316,89.1479,37,1); // PCJ - Praça
	AddStaticVehicle(409,-2441.2871,721.7909,34.7812,270.6966,1,1); // Limosine - Praça
	AddStaticVehicle(409,-2474.2036,721.9894,34.7769,268.5920,1,1); // Limosine - Praça
	AddStaticVehicle(492,-2408.0876,741.0608,34.7974,178.1766,77,26); // Greenwood - Praça
	AddStaticVehicle(491,-2411.6802,741.2476,34.7719,182.2646,71,72); // Virgo - Praça
	AddStaticVehicle(437,-2272.1667,540.9570,35.1877,269.6566,79,7); // Coach - Centro
	AddStaticVehicle(437,-2272.0623,527.6174,35.2383,269.9204,79,7); // Coach - Centro
	AddStaticVehicle(458,-2222.2786,305.4289,34.9957,176.3345,101,1); // Solair - Estacionamento perto da construção
	AddStaticVehicle(456,-2180.0015,295.3534,35.2898,0.0578,91,63); // Yankee - Estacionamento perto da construção
	AddStaticVehicle(416,-2588.9202,647.3989,14.6018,277.4462,1,3); // Ambulância - Hospital SF
	AddStaticVehicle(416,-2571.1116,637.9441,14.6091,89.9019,1,3); // Ambulância - Hospital SF
	AddStaticVehicle(416,-2571.8154,627.2441,14.6030,269.9490,1,3); // Ambulância - Hospital SF
	AddStaticVehicle(416,-2546.7207,632.2181,14.6024,90.3249,1,3); // Ambulância - Hospital SF
	AddStaticVehicle(515,-2415.8184,976.7167,46.3104,1.4385,54,77); // RoadTraing - Posto
	AddStaticVehicle(401,-1987.8267,151.5239,27.3186,179.5341,47,47); // Bravura - Estação
	AddStaticVehicle(401,-1987.8273,123.8756,27.3184,180.9527,47,47); // Bravura - Estação
	AddStaticVehicle(515,-1673.3943,436.9476,8.1988,227.5752,11,76); // RoadTraing - Posto
	AddStaticVehicle(515,-1659.9789,450.4153,8.1992,225.4837,11,76); // RoadTraing - Posto
	AddStaticVehicle(408,-2491.4570,791.1064,35.7281,270.3843,26,26); // Caminhao de Lixo - Praça
	AddStaticVehicle(408,-2491.4656,783.1116,35.7205,268.9818,26,26); // Caminhao de Lixo - Praça
	/*--------*/
	
	new File:CarFile;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	CarFile = fopen("RPG.carros", io_readwrite);
	while(fread(CarFile, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid    = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
        Cor1       = strval(strtok(tmp, index));
		Cor2       = strval(strtok(tmp, index));


		AddStaticVehicle(modelid, X, Y, Z, ang, Cor1, Cor2);
	}
	
	fclose(CarFile);

	SetTimer("Areas", 500, 1);
	SetTimer("GastandoGasolina", 40000, 1);
	SetTimer("Score", 1000, 1);
	SetTimer("TempoPrisao", 60000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("Tempo", 1000, 1);
	return 1;
}

public Score()
{
	for (new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			SetPlayerScore(i, GetPlayerMoney(i));
	    }
	}
}
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerColor(playerid,cNOEMPREGO);
 	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,392.7015,-2028.5675,23.3828);
	SetPlayerFacingAngle(playerid, 269.0469);
	SetPlayerCameraPos(playerid,400.5184,-2031.7714,31.1510);
	SetPlayerCameraLookAt(playerid,392.7015,-2028.5675,23.3828);
    if(Logado[playerid] == 1){
		Logado[playerid] = 0;
	}
	return 1;
}

public OnGameModeExit()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			if (Logado[i] == 1) {
				udb_setAccState(PlayerName(i),GetPlayerMoney(i));
				udb_setGasoline(PlayerName(i), Gasolina[i]);
			}
		}
	}
	return 1;
}

public LogarJogador(playerid)
{
	GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
	new Float:X, Float:Y, Float:Z, Float:ang;
	udb_getPosition(PlayerName(playerid), X, Y, Z);
	udb_getAng(PlayerName(playerid), ang);
	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
    job[playerid] = udb_getProf(PlayerName(playerid));
	Gasolina[playerid] = udb_getGasoline(PlayerName(playerid));
    if(job[playerid] == NOEMPREGO){
   	    SetPlayerColor(playerid, cNOEMPREGO);
   	    return 1;
    }
    else if(job[playerid] == CRIMINOSO){
   	    SetPlayerColor(playerid, cCRIMINOSO);
	   	return 1;
    }
    else if(job[playerid] == TAXISTA){
	   	SetPlayerColor(playerid, cTAXISTA);
	   	return 1;
    }
    else if(job[playerid] == POLICIA){
   	    SetPlayerColor(playerid, cPOLICIA);
   	    return 1;
    }
    else if(job[playerid] == COMIDA){
   	    SetPlayerColor(playerid, cCOMIDA);
   	    return 1;
    }
    else if(job[playerid] == AUTOESCOLA){
   	    SetPlayerColor(playerid, cAUTOESCOLA);
   	    return 1;
    }
    else if(job[playerid] == MEDICO){
	   	SetPlayerColor(playerid, cMEDICO);
    	return 1;
    }
    else if(job[playerid] == MOTORISTA){
    	SetPlayerColor(playerid, cMOTORISTA);
    	return 1;
    }
    else if(job[playerid] == POSTO){
    	SetPlayerColor(playerid, cPOSTO);
    	return 1;
    }
    else if(job[playerid] == LIXEIRO){
    	SetPlayerColor(playerid, cLIXEIRO);
    	return 1;
    }
    else if(job[playerid] == CARROS){
    	SetPlayerColor(playerid, cCARROS);
    	return 1;
    }
    else if(job[playerid] == CASA){
    	SetPlayerColor(playerid, cCASA);
    	return 1;
    }

	if(udb_getPrisao(PlayerName(playerid)) == 1){
		SetPlayerPos(playerid,227.6684,110.1895,999.0156);
		SetPlayerInterior(playerid,10);
		Preso[playerid] = 1;
		TempoPreso[playerid] = 5;
		SendClientMessage(playerid, VERMELHO, "Você cometeu um crime e por isso foi preso.");
		SendClientMessage(playerid, VERMELHO, "Você pode esperar sua pena de prisão ou pagar fianca com '/pagarfianca'");
	}
	SpawnPlayer(playerid);
	return 1;
}
public OnPlayerConnect(playerid)
{
    new nick[MAX_PLAYER_NAME];
	new string[256];
    GetPlayerName(playerid, nick, sizeof(nick));
    format(string, sizeof(string), "SERVER: %s entrou no servidor.", nick);
    SendClientMessageToAll(cCOMIDA, string);
    SetPlayerColor(playerid,cNOEMPREGO);
	job[playerid] = 0;
	Log[playerid] = 0;
	SendClientMessage(playerid, VERDE2, "Public RPG");
	SendClientMessage(playerid, AMARELO, "Bem vindo!");
	SendClientMessage(playerid, CINZA, "Para ver os comandos do RPG digite /comandos e /ajuda");
	SendClientMessage(playerid, CINZA, "Para ver os criadores do RPG digite /creditos");
	SendClientMessage(playerid, CINZA, "Para ver os empregos do RPG digite /empregos");
	GameTextForPlayer(playerid, "~w~Public ~y~R~b~P~g~G ~n~~w~Feito por: ~r~Rafael e Osorkon",5000,0);
	if (udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, BRANCO, "Para entrar digite: /login [sua-senha].");
	return 1;
    }
    if (!udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, BRANCO, "Para entrar digite: /cadastrar [crie-uma-senha].");
	return 1;
    }
	return 1;
}

public OnPlayerDisconnect(playerid)
{
	if (Logado[playerid] == 1) {
		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		udb_setGasoline(PlayerName(playerid), Gasolina[playerid]);
		Logado[playerid] = 0;
	}
	new msg[256];
    format(msg,sizeof(msg),"SERVER: %s saiu do servidor.",PlayerName(playerid));
    SendClientMessageToAll(cCOMIDA,msg);
    return 1;
}

public GastandoGasolina()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	if(GetPlayerState(i) == PLAYER_STATE_DRIVER){
	if(Gasolina[i] > 0){
	Gasolina[i]--;
	udb_setGasoline(PlayerName(i),Gasolina[i]);
	new str[256];
	format(str,sizeof(str),"~g~Gasolina: ~w~%d",Gasolina[i]);
	GameTextForPlayer(i,str,2500,1);
	}
	else if(Gasolina[i] <= 0){
		RemovePlayerFromVehicle(i);
		SendClientMessage(i, VERMELHO, "ATENÇÃO: Você foi retirado do veiculo, pois não pode dirigir sem gasolina!");
		SendClientMessage(i, VERMELHO, "Se quiser abastecer vá até o posto.");
		}
  	 }
  }
}
public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid,0);
	if(Logado[playerid] == 0){
		SetPlayerPos(playerid, 1403.9967, -808.4649, 92.07614);
		SetPlayerFacingAngle(playerid, 90.0000);
		TogglePlayerControllable(playerid, 0);
		job[playerid] = udb_getProf(PlayerName(playerid));
	    if(job[playerid] == NOEMPREGO){
	    	SetPlayerColor(playerid, cNOEMPREGO);
	    	return 1;
	    }
	    else if(job[playerid] == CRIMINOSO){
	    	SetPlayerColor(playerid, cCRIMINOSO);
	    	return 1;
	    }
	    else if(job[playerid] == TAXISTA){
	    	SetPlayerColor(playerid, cTAXISTA);
	    	return 1;
	    }
	    else if(job[playerid] == POLICIA){
	    	SetPlayerColor(playerid, cPOLICIA);
	    	return 1;
	    }
	    else if(job[playerid] == COMIDA){
	    	SetPlayerColor(playerid, cCOMIDA);
	    	return 1;
	    }
	    else if(job[playerid] == AUTOESCOLA){
	    	SetPlayerColor(playerid, cAUTOESCOLA);
	    	return 1;
	    }
	    else if(job[playerid] == MEDICO){
	    	SetPlayerColor(playerid, cMEDICO);
	    	return 1;
	    }
	    else if(job[playerid] == MOTORISTA){
	    	SetPlayerColor(playerid, cMOTORISTA);
	    	return 1;
	    }
	    else if(job[playerid] == POSTO){
	    	SetPlayerColor(playerid, cPOSTO);
	    	return 1;
	    }
	    else if(job[playerid] == LIXEIRO){
	    	SetPlayerColor(playerid, cLIXEIRO);
	    	return 1;
	    }
	    else if(job[playerid] == CARROS){
	    	SetPlayerColor(playerid, cCARROS);
	    	return 1;
	    }
	    else if(job[playerid] == CASA){
	    	SetPlayerColor(playerid, cCASA);
	    	return 1;
	    }
	}

	else{
	    TogglePlayerControllable(playerid, 1);
        return 1;
	    }
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2658.8684, 635.8806, 14.4531, 214.5888, 0, 0, 0, 0, 0, 0);
    SendClientMessage(playerid,BRANCO, "Você ficou inconsiente e foi levado ao hospital. Você gastou R$200 com o tratamento.");
    udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 200);
    GameTextForPlayer(playerid, "~w~DETONADO", 4000, 2);
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

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[256];
	new idx;

	cmd = strtok(cmdtext, idx);
	fixchars(cmdtext);
	
	/*comandos gerais*/
	if(strcmp(cmd, "/cadastrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	if (udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, VERMELHO, "Você já está cadastrado.");
	    	return 1;
		}
    	if (Logado[playerid] == 1) {
			SendClientMessage(playerid, VERMELHO, "Você está logado.");
	        return 1;
		}
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, VERMELHO, "Uso: /cadastrar [senha].");
	    	return 1;
		}
    	else{
    	    Logado[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*senha*/,0 /*creditos*/, 0 /*grana*/,0 /*skin*/, 5000 /*gbanco*/, 15/*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 1 /*prof*/, ""/*clantag*/, -2443.4048/*X*/, 752.6520/*Y*/, 35.1786/*Z*/, 188.7265/*ang*/, 100.0/*hp*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_setProf(PlayerName(playerid),0);
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			udb_setGasoline(PlayerName(playerid), 15);
			job[playerid] = 0;
			Gasolina[playerid] = 15;
 			SetPlayerColor(playerid, cNOEMPREGO);
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SendClientMessage(playerid, VERDE, "Cadastrado.");
			SendClientMessage(playerid, VERDE, "Você começa com R$5000 e 15 litros de gasolina para viver.");
        	return 1;
		}
 	}
	if(strcmp(cmd, "/login", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
  	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, VERMELHO, "Você não tem cadastro.");
	    	return 1;
		}
	    if (Logado[playerid] == 1) {
			SendClientMessage(playerid, VERMELHO, "Você já está logado.");
     		return 1;
		}
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, VERMELHO, "Uso: /login [senha]");
	    	return 1;
		}
	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
			Logado[playerid] = 1;
			LogarJogador(playerid);
	    	return 1;
		}
		else {
			SendClientMessage(playerid, VERMELHO, "Senha inválida.");
	    	return 1;
	    }
	}
	if(strcmp(cmd, "/depositar", true) == 0) {
	    new tmp[256];
		new quant;
		tmp = strtok(cmdtext,idx);
		quant = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, VERMELHO, "Uso: /depositar [quantidade]");
		    return 1;
		}
		if(AreaBanco[playerid] == 0){
		    SendClientMessage(playerid, VERMELHO, "Você não está no banco!");
		    return 1;
		}
		if(quant <= 0){
		    SendClientMessage(playerid, VERMELHO, "Quantia inválida...");
		    return 1;
		}
		if(GetPlayerMoney(playerid) < quant){
		    SendClientMessage(playerid, VERMELHO, "Você não tem toda essa quantia em suas mãos!");
		    return 1;
		}
		else{
			GivePlayerMoney(playerid,-quant);
			udb_setBankMoney(PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)) + quant);
			new string[256];
			format(string,sizeof(string),"Mensagem do banco: Foram depositados $%d em sua conta!",quant);
			SendClientMessage(playerid, VERDE, string);
			return 1;
		}
	}
	if(strcmp(cmd, "/retirar", true) == 0) {
		new tmp[256];
		new quant;
		tmp = strtok(cmdtext,idx);
		quant = strval(tmp);
		if(!strlen(tmp)){
		    SendClientMessage(playerid, VERMELHO, "Uso: /retirar [quantidade]");
		    return 1;
		}
		if(AreaBanco[playerid] == 0){
		    SendClientMessage(playerid, VERMELHO, "Você não está no banco!");
		    return 1;
		}
		if(quant <= 0){
		    SendClientMessage(playerid, VERMELHO, "Quantia inválida...");
		    return 1;
		}
		if(quant > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, VERMELHO, "Você não tem toda essa quantia no banco!");
		    return 1;
		}
		else{
			GivePlayerMoney(playerid,quant);
			udb_setBankMoney(PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)) - quant);
			new string[256];
			format(string,sizeof(string),"Mensagem do banco: Foram retirados $%d de sua conta!",quant);
			SendClientMessage(playerid, VERDE, string);
			return 1;
		}
	}
	if(strcmp(cmd,"/extrato",true) == 0){
		if(AreaBanco[playerid] == 0){
			SendClientMessage(playerid, VERMELHO, "Você não está no banco!");
			return 1;
		}
		else{
	    	new string[256];
	    	format(string,sizeof(string),"Mensagem do banco: Você possue $%d em sua conta!",udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, VERDE, string);
			return 1;
		}
	}
	if(strcmp(cmd, "/pagarfianca", true) == 0) {
	   if(Preso[playerid] == 0){
	       SendClientMessage(playerid, VERMELHO, "Você não está preso!");
	   	   return 1;
	   }
	   else{
	       if(GetPlayerMoney(playerid) >= 1500){
  				GivePlayerMoney(playerid,-1500);
	   	   		SendClientMessage(playerid, VERDE, "Fiança paga!");
		   		Preso[playerid] = 0;
		   		udb_setPrisao(PlayerName(playerid),0);
		   		LogarJogador(playerid);
		   }
		   else if(GetPlayerMoney(playerid) < 1500){
			   udb_setBankMoney(PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)) - 1500);
   			   SendClientMessage(playerid, VERDE, "Você não possue o dinheiro da fiança em suas mãos!");
       		   SendClientMessage(playerid, VERDE, "Portanto o dinheiro foi retirado do banco.");
               Preso[playerid] = 0;
		       udb_setPrisao(PlayerName(playerid),0);
		       LogarJogador(playerid);
		   }
	   }
	}
	if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, cPOLICIA, "Ajuda:");
        SendClientMessage(playerid, BRANCO, "/comandos : Veja os comandos do mode.");
        SendClientMessage(playerid, BRANCO, "/creditos : Veja os criadores do RPG.");
		return 1;
   	}
   	if(strcmp(cmd, "/creditos", true) == 0) {
		SendClientMessage(playerid, cCRIMINOSO, "Public RPG");
		SendClientMessage(playerid, BRANCO, "Feito por: Rafael e [DT]Osorkon");
		SendClientMessage(playerid, BRANCO, "Agradecimentos especiais:");
		SendClientMessage(playerid, BRANCO, "Idéias: [TMR]MtS e clan [I]");
		SendClientMessage(playerid, BRANCO, "Ajuda: [TMR]MtS, [DT]Guilherme e [DT]Texugo");
		SendClientMessage(playerid, AZUL, "Thanks to: SolidNuts, TheHitman, Luigui e DaMNeD");
		SendClientMessage(playerid, AZUL, "Pelas idéias e alguns códigos!");
		return 1;
	}
		
   	if(strcmp(cmd, "/comandos", true) == 0) {
        SendClientMessage(playerid, cPOLICIA, "Comandos:");
        SendClientMessage(playerid, BRANCO, "/buygas [litros]: Compra gasolina (esteja no posto).");
        SendClientMessage(playerid, BRANCO, "/cmdbank : Veja os comandos do banco.");
        SendClientMessage(playerid, BRANCO, "/empregos : Veja os empregos do mode.");
        SendClientMessage(playerid, BRANCO, "/cmdsjob : Veja os comandos de seu emprego.");
        SendClientMessage(playerid, BRANCO, "/pizzas : Veja os sabores de pizzas do mode.");
        SendClientMessage(playerid, BRANCO, "/bebidas : Veja as bebidas do mode.");
        SendClientMessage(playerid, BRANCO, "/190 [denuncia] : Faz uma denuncia para os policiais do servidor.");
        SendClientMessage(playerid, BRANCO, "/SOS [local] : Chama uma ambulancia.");
        SendClientMessage(playerid, cPOLICIA, "Para mais comandos, digite /comandos2");
		return 1;
   	}
   	if(strcmp(cmd, "/comandos2", true) == 0) {
        SendClientMessage(playerid, cPOLICIA, "Comandos - Parte 2:");
        SendClientMessage(playerid, BRANCO, "/skin [id-da-skin] : Muda sua skin.");
        SendClientMessage(playerid, BRANCO, "/enviar [id-do-jogador] [quantidade] : Envia dinheiro para um jogador.");
        SendClientMessage(playerid, BRANCO, "/say [texto] : Fala com as pessoas que estiverem próximas a você.");
        SendClientMessage(playerid, BRANCO, "/pagarfianca : Paga fiança para sair da prisão.");
        SendClientMessage(playerid, BRANCO, "/procurados : Veja os jogadores procurados pela polícia.");
        SendClientMessage(playerid, BRANCO, "/prisao : Veja os jogadores que estão na prisão.");
        SendClientMessage(playerid, BRANCO, "/habilitacoes : Veja as habilitações do mode.");
        SendClientMessage(playerid, BRANCO, "/frentista [local] : Chamar um frentista para onde você estiver.");
        SendClientMessage(playerid, cPOLICIA, "Para mais comandos, digite /comandos3");
		return 1;
   	}
   	if(strcmp(cmd, "/comandos3", true) == 0) {
        SendClientMessage(playerid, cPOLICIA, "Comandos - Parte 3:");
        SendClientMessage(playerid, BRANCO, "/depositar [quantidade] : Depositar dinheiro no banco.");
        SendClientMessage(playerid, BRANCO, "/retirar [quantidade] : Retirar dinheiro do banco.");
        SendClientMessage(playerid, BRANCO, "/extrato : Ver o seu extrato no banco.");
   	    SendClientMessage(playerid, cPOLICIA, "Esses são os comandos do RPG");
   	    return 1;
	}
    if(strcmp(cmd, "/bebidas", true) == 0) {
       SendClientMessage(playerid, cPOLICIA, "Bebidas:");
       SendClientMessage(playerid, BRANCO, "1 - Coca-Cola");
	   SendClientMessage(playerid, BRANCO, "2 - PEPSI");
       SendClientMessage(playerid, BRANCO, "3 - Fanta-Uva");
       SendClientMessage(playerid, BRANCO, "4 - Cerveja");
       SendClientMessage(playerid, BRANCO, "5 - Vodka");
       SendClientMessage(playerid, AZUL2, "Quer uma dessas para se refrescar? Peça para um entregador de comidas.");
       return 1;
	}

	if(strcmp(cmd, "/pizzas", true) == 0) {
       SendClientMessage(playerid, cPOLICIA, "Sabores de Pizzas:");
       SendClientMessage(playerid, BRANCO, "1 - 4 Queijos");
	   SendClientMessage(playerid, BRANCO, "2 - Strogonoff de Carne");
       SendClientMessage(playerid, BRANCO, "3 - Strogonoff de Frango");
       SendClientMessage(playerid, BRANCO, "4 - Mussarela");
       SendClientMessage(playerid, BRANCO, "5 - Milho");
       SendClientMessage(playerid, BRANCO, "6 - Portuguesa");
       SendClientMessage(playerid, AZUL2, "Com fome? Afim de uma dessas? Peça para um entregador de comidas.");
       return 1;
	}
	if(strcmp(cmd, "/habilitacoes", true) == 0) {
		SendClientMessage(playerid, cPOLICIA, "Habilitações:");
 		SendClientMessage(playerid, BRANCO, "0 - Aérea     	 = 	 R$1200");
  	    SendClientMessage(playerid, BRANCO, "1 - Terrestre 	= 	R$1000");
  	    SendClientMessage(playerid, BRANCO, "2 - Naútica   	 = 	 R$800");
    	SendClientMessage(playerid, AZUL2, "Essas são as habilitações do RPG.");
    	return 1;
	}
   	if(strcmp(cmd, "/empregos", true) == 0) {
		SendClientMessage(playerid, VERDE2, "Empregos do RPG:");
		SendClientMessage(playerid, cNOEMPREGO, "1 - Desempregado (Salário: R$200)");
		SendClientMessage(playerid, cCRIMINOSO, "2 - Criminoso (Salário: R$500 + roubos, assaltos e mortes)");
		SendClientMessage(playerid, cTAXISTA, "3 - Taxista (Salário: R$700 + passageiros)");
		SendClientMessage(playerid, cPOLICIA, "4 - Policial (Salário: R$1500)");
		SendClientMessage(playerid, cCOMIDA, "5 - Entregador de comida (Salário: R$800 + entregas de comidas)");
		SendClientMessage(playerid, cAUTOESCOLA, "6 - Trabalhador da Auto Escola (Salário: R$1200 + carteiras)");
		SendClientMessage(playerid, VERDE2, "Para mais empregos, digite /empregos2.");
		return 1;
	}
	if(strcmp(cmd, "/empregos2", true) == 0) {
		SendClientMessage(playerid, VERDE2, "Empregos do RPG - Parte 2:");
		SendClientMessage(playerid, cMEDICO, "7 - Médico (Salário: R$900 + curativos)");
		SendClientMessage(playerid, cMOTORISTA, "8 - Motorista (Salário: R$600)");
		SendClientMessage(playerid, cPOSTO, "9 - Frentista de Posto (Salário: R$750 + combustível)");
		SendClientMessage(playerid, cLIXEIRO, "10 - Lixeiro (Salário: R$400 + lixos que coletar)");
		SendClientMessage(playerid, cCARROS, "11 - Vendedor de Carros (Salário: R$600 + carros que vender)");
		SendClientMessage(playerid, cCASA, "12 - Vendedor de Casa (Salário: R$600 + casas que vender)");
		SendClientMessage(playerid, VERDE2, "Esses são os empregos do RPG.");
		return 1;
	}
	if(strcmp(cmd, "/buygas", true) == 0) {
	   new tmp[256];
	   new litros;
	   tmp = strtok(cmdtext,idx);
	   litros = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /buygas [litros]");
	   return 1;
	   }
	   if(AreaPosto[playerid] == 0){
	   SendClientMessage(playerid, VERMELHO, "Você não está no posto.");
	   return 1;
	   }
	   if(GetPlayerMoney(playerid) < litros){
	   SendClientMessage(playerid, VERMELHO, "Você não possue dinheiro para pagar o combustível.");
	   return 1;
	   }
	   if(litros+Gasolina[playerid] >= 100){
		  Gasolina[playerid] = 100;
		  udb_setGasoline(PlayerName(playerid),Gasolina[playerid]);
		  new str[256];
		  format(str,sizeof(str),"Seu tanque ficou completo, foram colocados %d litros de combustível!",100-Gasolina[playerid]);
          SendClientMessage(playerid, BRANCO, str);
		  new quant;
		  quant = 100-Gasolina[playerid];
		  GivePlayerMoney(playerid,0-quant);
		  return 1;
	      }
	      else{
              Gasolina[playerid] = Gasolina[playerid]+litros;
		      udb_setGasoline(PlayerName(playerid),Gasolina[playerid]);
		      new string[256];
		      format(string,sizeof(string),"Foram colocados %d litros de combustível!",litros);
		      SendClientMessage(playerid, BRANCO, string);
		      GivePlayerMoney(playerid,0-litros);
		      return 1;
		      }
    }
    
	if(strcmp(cmd, "/prisao", true) == 0) {
	   for(new i=0; i<MAX_PLAYERS; i++){
	  	   if(Preso[i] == 1){
			    if(i == INVALID_PLAYER_ID){
				    SendClientMessage(playerid, VERMELHO, "A prisão está vazia!");
				    return 1;
				    }
				    else{
						SendClientMessage(playerid, VERDE, "Jogadores na prisão:");
						new str[256];
						format(str,sizeof(str),"%d - %s",i,PlayerName(i));
						SendClientMessage(playerid, BRANCO, str);
						SendClientMessage(playerid, VERDE, "Esses são os jogadores que estão na prisão.");
						return 1;
					}
                }
		   }
	}

    if(strcmp(cmd, "/procurados", true) == 0) {
	   for(new i=0; i<MAX_PLAYERS; i++){
		   if(GetPlayerWantedLevel(i) > 0){
			  	if(i == INVALID_PLAYER_ID){
			  		SendClientMessage(playerid, VERMELHO, "A lista de procurados está vazia!");
			  		return 1;
			  		}
			  		else{
				  		SendClientMessage(playerid, VERDE, "Lista dos procurados:");
				  		new str[256];
				  		format(str,sizeof(str),"%d - %s | Níveis de procurado: %d",i,PlayerName(i),GetPlayerWantedLevel(i));
				  		SendClientMessage(playerid, BRANCO, str);
				  		SendClientMessage(playerid, VERDE, "Esses são os jogadores que estão na lista dos procurados.");
				  		return 1;
	   		        }
    		    }
	       }
	}
	
	if(strcmp(cmd, "/skin", true) == 0) {
	   new tmp[256];
	   new skin;
	   tmp = strtok(cmdtext,idx);
	   skin = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /skin [id-da-skin]");
	   return 1;
	   }
	   if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
	      SendClientMessage(playerid, VERMELHO, "ID da skin inválido!");
	      return 1;
	   }
	   else{
	   udb_setSkin(PlayerName(playerid),skin);
	   SetPlayerSkin(playerid,skin);
	   SendClientMessage(playerid, VERDE, "Sua skin foi mudada.");
	   return 1;
	   }
	}
	if(strcmp(cmd, "/report", true) == 0) {
	     new tmp[256];
	     new plid;
	     new razao[256];
	     tmp = strtok(cmdtext,idx);
	     plid = strval(tmp);
         if(!strlen(tmp)){
	     SendClientMessage(playerid, VERMELHO, "Uso: /report [id] [razão]");
	     return 1;
	     }
	     if(plid < 10){
	     strmid(razao, cmdtext, 9, strlen(cmdtext));
	     }
	     else if(plid >= 10 && plid < 100){
	     strmid(razao, cmdtext, 10, strlen(cmdtext));
	     }
	     else if(plid >= 100){
	     strmid(razao, cmdtext, 11, strlen(cmdtext));
	     }
	     if(!strlen(razao)){
	     SendClientMessage(playerid, VERMELHO, "Uso: /report [id] [razão]");
	     return 1;
	     }
	     for(new i=0; i<MAX_PLAYERS; i++){
	     if(IsPlayerAdmin(i)){
	     new msg[256];
	   	 format(msg, sizeof(msg),"%s reportou %s! Razão: %s",PlayerName(playerid),PlayerName(plid),razao);
	   	 SendClientMessage(i, BRANCO, msg);
	     printf(msg);
	     return 1;
	     }
	  }
	}
	if(strcmp(cmd, "/j", true) == 0) {
	      new tmp[256];
	      strmid(tmp,cmdtext, 2, strlen(cmdtext));
	      if(!strlen(tmp)){
	      SendClientMessage(playerid, VERMELHO, "Uso: /j [mensagem]");
	      return 1;
	      }
	      for(new i=0; i<MAX_PLAYERS; i++){
	      if(job[i] == job[playerid]){
		  new string[256];
          format(string,sizeof(string),"%s: %s",PlayerName(playerid),tmp);
          SendClientMessage(i, BRANCO, string);
	      return 1;
	      }
	   }
	}
	if(strcmp(cmd, "/say", true) == 0) {
	      new tmp[256];
	      strmid(tmp,cmdtext, 3, strlen(cmdtext));
	      if(!strlen(tmp)){
	      SendClientMessage(playerid, VERMELHO, "Uso: /say [texto]");
	      return 1;
	      }
	      for(new i=0; i<MAX_PLAYERS; i++){
	      if(DistanciaEntre(playerid,i) < 10){
		  new string[256];
          format(string,sizeof(string),"%s: %s",PlayerName(playerid),tmp);
          SendClientMessage(i, CINZA, string);
	      return 1;
	      }
	   }
	}
	if(strcmp(cmd, "/cmdsjob", true) == 0) {
	     if(job[playerid] == NOEMPREGO || job[playerid] == 0){
	  		SendClientMessage(playerid, VERDE2, "Comandos de Desempregado");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/pediresmola [id] : Para pedir uma esmola.");
	  		SendClientMessage(playerid, VERDE2, "SUGESTÃO: Peça um emprego à menos que queira ficar vagabundando por ai.");
  			return 1;
		 }
		 else if(job[playerid] == CRIMINOSO){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Criminoso");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/roubar [id] : Rouba dinheiro de um jogador.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == TAXISTA){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Taxista");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/taximetro [id] : Começa a rodar o taximetro (O passageiro tem que estar no mesmo veiculo que você).");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == POLICIA){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Polícia");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/bafometro [id] : Vê o teor alcóolico de um jogador.");
	  		SendClientMessage(playerid, BRANCO, "/aprisionar [id] : Prende um jogador na cadeia.");
	  		SendClientMessage(playerid, BRANCO, "/liberar [id] : Solta um jogador da cadeia.");
	  		SendClientMessage(playerid, BRANCO, "/procurar [id] : Bota um jogador na lista dos procurados.");
	  		SendClientMessage(playerid, BRANCO, "/desprocurar [id] : Tira um jogador da lista dos procurados.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == COMIDA){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Entregador de comida");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/pizza [id] [id do sabor] : Entrega uma pizza para um jogador.");
            SendClientMessage(playerid, BRANCO, "/bebida [id] [id da bebida] : Entrega uma bebida para um jogador.");
		    SendClientMessage(playerid, BRANCO, "/pizzas : Vê os sabores de pizzas do RPG.");
		    SendClientMessage(playerid, BRANCO, "/bebidas : Vê as bebidas do RPG.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == AUTOESCOLA){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Trabalhador da Auto Escola");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/habilitacao [id-do-jogador] [id-da-habilitação] : Conceder a habilitação de um jogador.");
	  		SendClientMessage(playerid, BRANCO, "/habilitacoes : Ver as habilitações do RPG.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == MEDICO){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Médico");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/curativo [id] : Aplica um curativo em um jogador.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == MOTORISTA){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Motorista");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, VERMELHO, "Seu emprego não possue nenhum comando.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == POSTO){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Frentista de Posto");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/gasolina [id] [litros] : Aplicar um abastecimento em um jogador.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
		 }
		 else if(job[playerid] == LIXEIRO){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Lixeiro");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/catarlata : Inicia a coleta de latas.");
	  		SendClientMessage(playerid, BRANCO, "/pararcoleta : Pára a coleta de latas.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
	     }
	     else if(job[playerid] == CARROS){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Vendedor de Carros");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/vendercarro [id-do-veículo] [id-do-comprador] [cor 1] [cor 2] : Vender carro para um jogador.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
	     }
	     else if(job[playerid] == CASA){
	  		SendClientMessage(playerid, VERDE2, "Comandos de seu emprego - Vendedor de Casa");
	  		SendClientMessage(playerid, BRANCO, "/j [mensagem] : Envia uma mensagem para todos que são do mesmo emprego que você.");
	  		SendClientMessage(playerid, BRANCO, "/vendercasa [id] : Vende uma casa para um jogador.");
	  		SendClientMessage(playerid, AZUL, "|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| BOM TRABALHO |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|");
  			return 1;
       }
	}
	if(strcmp(cmd, "/190", true) == 0) {
	   		new tmp[256];
	   		strmid(tmp,cmdtext,4,strlen(cmdtext));
	   		if(!strlen(tmp)){
	   		SendClientMessage(playerid, VERMELHO, "Uso: /190 [denuncia]");
	   		return 1;
	   		}
	   		else{
	   			SendClientMessage(playerid, VERDE, "Denuncia informada para os políciais!");
	   			for(new i=0; i<MAX_PLAYERS; i++){
	   			if(job[i] == POLICIA){
	   			new string[256];
	   			format(string, 256, "Denuncia de %s: %s",PlayerName(playerid),tmp);
	   			SendClientMessage(i, AZUL2, string);
				}
            }
            	return 1;
		}
	}
	if(strcmp(cmd, "/frentista", true) == 0) {
	    new tmp[256];
	    strmid(tmp,cmdtext,10,strlen(cmdtext));
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, VERMELHO, "Uso: /frentista [local]");
	        return 1;
		}
		else{
		    SendClientMessage(playerid, VERDE, "Os frentistas foram avisados...");
            for(new i=0; i<MAX_PLAYERS; i++){
   				if(job[i] == POSTO){
	   				new string[256];
	   				format(string, 256, "%s está chamando um frentista, local: %s",PlayerName(playerid),tmp);
	   				SendClientMessage(i, AZUL2, string);
				}
			}
		    return 1;
		}
	}
	if(strcmp(cmd, "/SOS", true) == 0) {
	   		new tmp[256];
	   		strmid(tmp,cmdtext,4,strlen(cmdtext));
	   		if(!strlen(tmp)){
	   		SendClientMessage(playerid, VERMELHO, "Uso: /SOS [local]");
	   		return 1;
	   		}
	   		else{
	   			SendClientMessage(playerid, VERDE, "Ok... médicos avisados! Sua ambulancia está a caminho!");
	   			for(new i=0; i<MAX_PLAYERS; i++){
	   			if(job[i] == MEDICO){
	   			new string[256];
	   			format(string, 256, "%s está pedindo uma ambulancia, local: %s",PlayerName(playerid),tmp);
	   			SendClientMessage(i, AZUL2, string);
	   			}
	   		}
	   			return 1;
		}
	}
	if(strcmp(cmd,"/aceitarcasa", true) == 0) {
	   if(casa[playerid] == 1){
	   SendClientMessage(vendedor[playerid], VERDE, "A casa foi aceita.");
	   SendClientMessage(playerid, VERDE, "Casa aceita agora você tem um novo lar!");
	   udb_setPosition(PlayerName(playerid), PosicaoCasa[playerid][0], PosicaoCasa[playerid][1], PosicaoCasa[playerid][2]);
	   udb_setAng(PlayerName(playerid),PosicaoCasa[playerid][3]);
	   casa[playerid] = 0;
	   vendedor[playerid] = 0;
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Não foi oferecida nenhuma proposta de moradia para você.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/recusarcasa", true) == 0) {
       if(casa[playerid] == 1){
	   SendClientMessage(vendedor[playerid], VERDE, "A casa foi recusada.");
	   SendClientMessage(playerid, VERDE, "Casa recusada!");
	   casa[playerid] = 0;
       vendedor[playerid] = 0;
       return 1;
       }
       else{
		   SendClientMessage(playerid, VERMELHO, "Não foi oferecida nenhuma proposta de moradia para você.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/enviar", true) == 0) {
	   new tmp[256];
	   new plid,quantidade;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /enviar [id-do-jogador] [quantidade]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   quantidade = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /enviar [id-do-jogador] [quantidade]");
	   return 1;
	   }
	   if(!IsPlayerConnected(plid)){
	   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
	   return 1;
	   }
	   if(quantidade > GetPlayerMoney(playerid)){
	   SendClientMessage(playerid, VERMELHO, "Você não possue todo esse dinheiro em mãos!");
	   return 1;
	   }
	   else{
		   GivePlayerMoney(plid,quantidade);
		   GivePlayerMoney(playerid,0-quantidade);
		   new string[256];
		   format(string,sizeof(string),"O jogador %s lhe enviou R$%d.",PlayerName(playerid),quantidade);
		   SendClientMessage(plid, BRANCO, string);
		   new msg[256];
		   format(msg,sizeof(msg),"Você enviou R$%d para %s",quantidade,PlayerName(plid));
		   return 1;
		   }
	   }
	   
	/*---------------*/
	
	
	/*comandos de noemprego*/
	if(strcmp(cmd, "/pediresmola", true) == 0) {
	  if(job[playerid] == NOEMPREGO || IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, VERMELHO, "Uso: /pediresmola [id]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
	  new string[256];
	  format(string, sizeof(string),"%s está lhe pedindo uma esmola!",PlayerName(playerid));
	  SendClientMessage(plid, BRANCO, string);
	  SendClientMessage(playerid, VERDE, "Esmola pedida aguarde a resposta do outro jogador...");
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, VERMELHO, "Pra que pedir esmola se você trabalha????");
		  SendClientMessage(playerid, VERMELHO, "Deixa disso, pedir esmola é coisa de vagabundo...");
		  return 1;
		  }
    }
	/*---------------------*/
	
	
	/*comandos de criminoso*/
	if(strcmp(cmd, "/roubar", true) == 0) {
	  if(job[playerid] == CRIMINOSO || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid,distancia;
	   distancia = DistanciaEntre(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /roubar [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(GetPlayerMoney(plid) >= 200){
	   if(distancia < 7){
	   if(roubo[playerid] == 0){
	   roubo[playerid] = 1;
	   GivePlayerMoney(playerid,200);
	   GivePlayerMoney(plid,0-200);
	   SendClientMessage(playerid, VERDE, "Roubo concluído.");
	   SendClientMessage(plid, VERMELHO, "Você foi roubado!!!");
	   SendClientMessage(plid, VERMELHO, "O Assaltante levou R$200. Rápido, é melhor chamar a policia.");
	   SendClientMessage(plid, VERMELHO, "Use: '/190 [denuncia]' para denunciar o criminoso.");
	   SetTimerEx("FimRoubo",15000,false,"d",playerid);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Você já roubou espere a poeira abaixar para poder roubar novamente.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "O jogador indicado não possue R$200 em suas mãos.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Você nem devia estar mexendo neste comando.");
		   return 1;
		   }
    }
	/*---------------------*/
	
	
	/*comandos de taxista*/
	if(strcmp(cmd, "/taximetro", true) == 0) {
	  if(job[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new vehicleid;
	   new State;
	   State = GetPlayerState(playerid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /taximetro [id]");
	   return 1;
	   }
	   if(State != PLAYER_STATE_DRIVER){
	   SendClientMessage(playerid, VERMELHO, "Ei, você tem que estar dirigindo.");
	   return 1;
	   }
	   vehicleid = GetPlayerVehicleID(playerid);
	   if(GetVehicleModel(vehicleid) != VEH_TAXI){
	   SendClientMessage(playerid, VERMELHO, "Você tem que estar em um Taxi.");
	   return 1;
	   }
	   if(!IsPlayerConnected(plid)){
	   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
	   return 1;
	   }
	   if(!IsPlayerInVehicle(plid,vehicleid)){
	   SendClientMessage(playerid, VERMELHO, "O passageiro tem que estar no mesmo veiculo que você!");
	   return 1;
	   }
	   if(taxi[plid] != 0){
	   SendClientMessage(playerid, VERMELHO, "O outro jogador já está pagando um taximetro.");
	   return 1;
	   }
	   else{
  		   taxi[plid] = 1;
  		   taxista[plid] = playerid;
  		   passageiro[playerid] = plid;
	       SendClientMessage(playerid, VERDE, "Taximetro ligado.");
	       SendClientMessage(plid, BRANCO, "O Taxista ligou o taximetro!");
	       return 1;
	       }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Uma dica: você nem devia estar mexendo nesse comando!");
		   return 1;
		   }
	}
	/*-------------------*/
	
	
	/*comandos de policial*/
	if(strcmp(cmd,"/liberar", true) == 0) {
      if(job[playerid] == POLICIA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /liberar [id]");
	   return 1;
	   }
	   if(!IsPlayerConnected(plid)){
	   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
	   return 1;
	   }
	   if(Preso[plid] == 0){
	   SendClientMessage(playerid, VERMELHO, "Este jogador não está preso!");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERDE, "Jogador desprisionado!");
		   SendClientMessage(plid, VERDE, "Você foi solto da prisão.");
		   Preso[plid] = 0;
		   udb_setPrisao(PlayerName(plid),0);
		   LogarJogador(plid);
		   return 1;
		   }
	  }
	  else{
		  SendClientMessage(playerid, VERMELHO, "Você não é policial!");
		  return 1;
		  }
	}
	if(strcmp(cmd,"/desprocurar", true) == 0) {
       if(job[playerid] == POLICIA || IsPlayerAdmin(playerid)){
	   		new tmp[256];
	   		new plid;
	   		tmp = strtok(cmdtext,idx);
	   		plid = strval(tmp);
	   		if(!strlen(tmp)){
	   		SendClientMessage(playerid, VERMELHO, "Uso: /desprocurar [id]");
	   		return 1;
   			}
   			if(!IsPlayerConnected(plid)){
   			SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
   			return 1;
   			}
   			if(GetPlayerWantedLevel(plid) <= 0){
			SendClientMessage(playerid, VERMELHO, "Este jogador não está sendo procurado!");
			return 1;
			}
			else{
				SetPlayerWantedLevel(plid,0);
				SendClientMessage(playerid, VERDE, "Ok... jogador retirado da lista de procurados!");
				SendClientMessage(plid, VERDE, "Seu nome não está mais na lista dos procurados!");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, VERMELHO, "Você não é Policial!");
				return 1;
				}
	}
	if(strcmp(cmd,"/procurar", true) == 0) {
     	if(job[playerid] == POLICIA || IsPlayerAdmin(playerid)){
	   		new tmp[256];
	   		new plid;
	   		tmp = strtok(cmdtext,idx);
	   		plid = strval(tmp);
	   		if(!strlen(tmp)){
	   		SendClientMessage(playerid, VERMELHO, "Uso: /procurar [id]");
	   		return 1;
   			}
   			if(!IsPlayerConnected(plid)){
   			SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
   			return 1;
   			}
   			if(GetPlayerWantedLevel(plid) >= 6){
			SendClientMessage(playerid, VERMELHO, "Ei, este jogador já está com o nível máximo de procurado!");
			return 1;
			}
			if(job[plid] == POLICIA || IsPlayerAdmin(plid)){
			SendClientMessage(playerid, VERMELHO, "Você não pode botar um administrador ou policial na lista dos procurados!");
			return 1;
			}
			else{
				SetPlayerWantedLevel(plid,GetPlayerWantedLevel(plid)+1);
				new str[256];
				format(str,sizeof(str),"O oficial %s botou seu nome na lista dos procurados!",PlayerName(playerid));
				SendClientMessage(plid, VERMELHO, str);
				format(str,sizeof(str),"Agora seus níveis de procurados são: %d",GetPlayerWantedLevel(plid));
				SendClientMessage(plid, cCRIMINOSO, str);
				SendClientMessage(playerid, VERDE, "Jogador botado na lista dos procurados com sucesso!");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, VERMELHO, "Você não é Policial!");
				return 1;
				}
	}
	   
	if(strcmp(cmd,"/aprisionar", true) == 0) {
     if(job[playerid] == POLICIA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /aprisionar [id]");
	   return 1;
	   }
	   if(!IsPlayerConnected(plid)){
	   SendClientMessage(playerid, VERMELHO, "O jogador não está conectado/logado");
	   return 1;
	   }
	   if(Preso[plid] == 1){
	   SendClientMessage(playerid, VERMELHO, "Este jogador já está preso!");
	   return 1;
	   }
	   if(job[plid] == POLICIA || IsPlayerAdmin(plid)){
	   SendClientMessage(playerid, VERMELHO, "Você não pode prender policiais nem administradores!");
	   return 1;
	   }
	   new distancia = DistanciaEntre(playerid,plid);
	   if(distancia >= 7){
	   SendClientMessage(playerid, VERMELHO, "Você está muito longe chegue mais perto.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERDE, "Prisão aplicada!");
		   new string[256];
		   format(string, sizeof(string), "Você foi preso pelo oficial %s.",PlayerName(playerid));
		   SendClientMessage(plid, VERMELHO, string);
		   GameTextForPlayer(plid,"~r~Preso!",4000,2);
		   Preso[plid] = 1;
		   TempoPreso[plid] = 3;
		   SetPlayerPos(plid,223.0134,110.3193,999.0156);
		   SetPlayerInterior(plid,10);
		   udb_setPrisao(PlayerName(plid),1);
		   return 1;
		   }
	 }
     else{
	     SendClientMessage(playerid, VERMELHO, "Você não é policial!");
	     return 1;
	     }
	}
	if(strcmp(cmd,"/bafometro", true) == 0) {
	 if(job[playerid] == POLICIA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /bafometro [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(DistanciaEntre(playerid,plid) < 7){
	   new str[256];
	   format(str,sizeof(str),"O Bafometro marca: %d litros de alcool no sangue de %s",alcool[plid],PlayerName(plid));
	   SendClientMessage(playerid, VERDE, str);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
   	   }
   	   else{
		   SendClientMessage(playerid, VERMELHO, "Você nem devia estar mexendo nesse comando.");
		   return 1;
		   }
    }
	/*--------------------*/
	
	
	/*comandos de pizza-boy*/
	if(strcmp(cmd, "/pizza", true) == 0) {
	   if(job[playerid] == COMIDA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid,saborid,distancia;
	   distancia = DistanciaEntre(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /pizza [id] [id do sabor]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   saborid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /pizza [id] [id do sabor]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(distancia < 7){
	   if(saborid > 0 && saborid < 7){
	   new Float:VIDA;
	   GetPlayerHealth(plid,VIDA);
	   SetPlayerHealth(plid,VIDA+20);
	   SendClientMessage(playerid, VERDE, "Pizza vendida.");
	   new msg[256];
	   format(msg,sizeof(msg),"%s lhe vendeu uma pizza de: %s.",PlayerName(playerid),PizzaSabor[saborid]);
	   SendClientMessage(plid, BRANCO, msg);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Sabor inválido! Os sabores são de 1 a 6.");
		   SendClientMessage(playerid, VERMELHO, "Digite /pizzas para ve-los.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Chegue mais perto para entregar a pizza.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }

    if(strcmp(cmd, "/bebida", true) == 0) {
      if(job[playerid] == COMIDA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid,bebidaid,distancia;
	   distancia = DistanciaEntre(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /bebida [id] [id-da-bebida]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   bebidaid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /bebida [id] [id-da-bebida]");
	   return 1;
	   }
	   if(bebidaid < 1 || bebidaid > 5){
	   SendClientMessage(playerid, VERMELHO, "Bebida inválida! As bebidas são de 1 a 5");
	   SendClientMessage(playerid, VERMELHO, "Digite /bebidas para ve-las.");
	   }
	   if(!IsPlayerConnected(plid)){
	   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
	   return 1;
	   }
	   if(distancia >= 7){
	   SendClientMessage(playerid, VERMELHO, "Chegue mais perto.");
	   return 1;
	   }
	   else{
	   	   if(bebidaid == 4 || bebidaid == 5){
	       alcool[plid] ++;
	       SendClientMessage(playerid, VERDE, "Bebida vendida.");
	       new string[256];
	       format(string, sizeof(string),"%s lhe vendeu uma bebida alcóolica: %s",PlayerName(playerid),BebidaName[bebidaid]);
	       SendClientMessage(plid, BRANCO, string);
	       return 1;
  		   }
	       else{
	   	       SendClientMessage(playerid, VERDE, "Bebida vendida.");
	   	       new string2[256];
	           format(string2, sizeof(string2),"%s lhe vendeu uma bebida não alcóolica: %s",PlayerName(playerid),BebidaName[bebidaid]);
	           SendClientMessage(plid, BRANCO, string2);
	           return 1;
	           }
	       }
       }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Você nem deveria estar mexendo nesse comando!");
		   return 1;
		   }
	}
	/*---------------------*/
	
	
	/*comandos de funcionário da auto-escola*/
	if(strcmp(cmd, "/habilitacao", true) == 0) {
	    if(job[playerid] == AUTOESCOLA || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid,habid;
	        tmp = strtok(cmdtext,idx);
	        plid = strval(tmp);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, VERMELHO, "Uso: /habilitacao [id] [id da habilitação]");
				return true;
			}
			tmp = strtok(cmdtext,idx);
	        habid = strval(tmp);
			if(!strlen(tmp)){
	            SendClientMessage(playerid, VERMELHO, "Uso: /habilitacao [id] [id da habilitação]");
				return true;
			}
			if(GetPlayerMoney(plid) < Habilitacoes[habid][Value]){
			    SendClientMessage(playerid, VERMELHO, "Esse jogador não possue dinheiro!");
			    return true;
			}
			if(habid < 0 || habid > 2){
			    SendClientMessage(playerid, VERMELHO, "Habilitação inválida: digite /habilitacoes para ver os ID's");
			    return true;
			}
			else{
			    new str[256];
			    format(str,sizeof(str),"%s lhe vendeu uma habilitação %s por R$%d.",PlayerName(playerid),Habilitacoes[habid][HabName],Habilitacoes[habid][Value]);
			    SendClientMessage(plid, VERDE, str);
			    SendClientMessage(playerid, VERDE, "Habilitação vendida!");
			    if(habid == 0)udb_setHabaerea(PlayerName(plid),1);
			    if(habid == 1)udb_setHabterre(PlayerName(plid),1);
			    if(habid == 2)udb_setHabnauti(PlayerName(plid),1);
				return true;
			}
		}
		else{
			SendClientMessage(playerid, VERMELHO, "Você não tem permissão!");
			return 1;
		}
	}
	/*--------------------------------------*/
	
	
	/*comandos de médico*/
	if(strcmp(cmd, "/curativo", true) == 0) {
	    if(job[playerid] == MEDICO || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        new distancia;
	        distancia = DistanciaEntre(playerid,plid);
	        tmp = strtok(cmdtext,idx);
	        plid = strval(tmp);
	        if(!strlen(tmp)){
	        SendClientMessage(playerid, VERMELHO, "Uso: /curativo [id]");
	        return 1;
	        }
	        if(IsPlayerConnected(plid)){
	        if(distancia < 7){
			SetPlayerHealth(plid,100);
			SendClientMessage(playerid, VERDE, "Paciente curado.");
			SendClientMessage(plid, BRANCO, "Você foi curado por um médico.");
			return 1;
			}
			else{
				SendClientMessage(playerid, VERMELHO, "Você está muito longe chegue mais perto.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, VERMELHO, "Você não tem permissão.");
				return 1;
				}
	}
	/*------------------*/
	
	
	/*comandos de motorista*/
	/*------------------*/
	
	
	/*comandos de funcionário do posto*/
	if(strcmp(cmd,"/gasolina",true) == 0){
	    new tmp[256];
	    new string[256];
	    new plid,litros;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, VERMELHO, "Uso: /gasolina [id] [litros]");
	        return 1;
		}
		tmp = strtok(cmdtext,idx);
	    litros = strval(tmp);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid, VERMELHO, "Uso: /gasolina [id] [litros]");
	        return 1;
		}
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid, VERMELHO, "Jogador desconectado.");
		    return 1;
		}
		if(Gasolina[plid] == 100){
		    SendClientMessage(playerid, VERMELHO, "A gasolina desse jogador está completa!");
		    return 1;
		}
		if(litros + Gasolina[plid] >= 100){
		    new lc = 100 - Gasolina[plid];
		    Gasolina[plid] = 100;
			format(string,sizeof(string),"%s completou sua gasolina colocando %d litros!",PlayerName(playerid),lc);
			SendClientMessage(plid, BRANCO, string);
			format(string,sizeof(string),"Você completou a gasolina de %s colocando %d litros!",PlayerName(plid),lc);
			SendClientMessage(playerid, BRANCO, string);
			GivePlayerMoney(playerid,lc);
			GivePlayerMoney(plid,-lc);
			return 1;
		}
		else if(litros + Gasolina[plid] < 100){
		    Gasolina[plid] += litros;
			format(string,sizeof(string),"%s lhe vendeu %d litros de gasolina...",PlayerName(playerid),litros);
			SendClientMessage(plid, BRANCO, string);
			SendClientMessage(playerid, BRANCO, "Abastecimento feito!");
			GivePlayerMoney(playerid,litros);
			GivePlayerMoney(plid,-litros);
			return 1;
		}
	}
	/*--------------------------------*/
	
	
	/*comandos de lixeiro*/
	if(strcmp(cmd,"/catarlata",true) == 0){
	    if(job[playerid] == LIXEIRO || IsPlayerAdmin(playerid)){
			if(CatandoLatas[playerid] == 1){
			    SendClientMessage(playerid, VERMELHO, "Você já está catando latas!");
			    return 1;
			}
			else{
				DisablePlayerCheckpoint(playerid);
			    new l = random(23);
			    SetPlayerCheckpoint(playerid,Latas[l][0],Latas[l][1],Latas[l][2],3.0);
			    CatandoLatas[playerid] = 1;
			    SendClientMessage(playerid, VERDE, "Coleta iniciada...");
			    SendClientMessage(playerid, VERDE, "Siga o checkpoint em seu mapa para coletar uma lata...");
			    return 1;
			}
		}
		else{
		    SendClientMessage(playerid, VERMELHO, "Você não é Lixeiro!");
			return 1;
		}
	}
	if(strcmp(cmd,"/pararcoleta",true) == 0){
	    if(CatandoLatas[playerid] == 0){
	        SendClientMessage(playerid, VERMELHO, "Você não está coletando latas!");
	        return 1;
		}
		else{
		    DisablePlayerCheckpoint(playerid);
		    CatandoLatas[playerid] = 0;
		    SendClientMessage(playerid, VERDE, "Você parou de coletar latinhas...");
		    return 1;
		}
	}
	/*-------------------*/
	
	/*comandos de vendedor de carros*/
	if(strcmp(cmd,"/vendercarro",true) == 0){
		if(job[playerid] == CARROS || IsPlayerAdmin(playerid)){
		    new tmp[256];
			new carid,plid,color1,color2,string[256];
			tmp = strtok(cmdtext,idx);
			carid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, VERMELHO, "Uso: /vendercarro [id-do-veículo] [id-do-comprador] [cor 1] [cor 2]");
			    return 1;
			}
			tmp = strtok(cmdtext,idx);
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, VERMELHO, "Uso: /vendercarro [id-do-veículo] [id-do-comprador] [cor 1] [cor 2]");
			    return 1;
			}
			tmp = strtok(cmdtext,idx);
			color1 = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, VERMELHO, "Uso: /vendercarro [id-do-veículo] [id-do-comprador] [cor 1] [cor 2]");
			    return 1;
			}
			tmp = strtok(cmdtext,idx);
			color2 = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, VERMELHO, "Uso: /vendercarro [id-do-veículo] [id-do-comprador] [cor 1] [cor 2]");
			    return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
			    return 1;
			}
			if(!IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid, VERMELHO, "Você não está em um veículo!");
				return 1;
			}
			else{
			    SendClientMessage(playerid, VERDE, "Carro vendido!");
			    format(string,sizeof(string),"O jogador %s lhe vendeu um veículo... ID: %d",PlayerName(playerid),carid);
				SendClientMessage(plid, VERDE, string);
				new Float:X,Float:Y,Float:Z,Float:ang;
				GetVehiclePos(GetPlayerVehicleID(playerid),X,Y,Z);
				GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
				format(string,sizeof(string),"%d %f %f %f %d %d //%s\r\n",carid, X, Y, Z, color1, color2, PlayerName(plid));
				new File:CarFile;
				CarFile = fopen("RPG.carros", io_append);
				fwrite(CarFile, string);
				return fclose(CarFile);
			}
		}
		else{
			SendClientMessage(playerid, VERMELHO, "Você não tem permissão!");
			return 1;
		}
	}
	/*-------------------*/
	
	/*comandos de vendedor de casa*/
	if(strcmp(cmd,"/vendercasa", true) == 0) {
	  if(job[playerid] == CASA || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /vendercasa [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   new Float:X,Float:Y,Float:Z;
	   GetPlayerPos(playerid,X,Y,Z);
	   new Float:ang;
	   GetPlayerFacingAngle(playerid,ang);
	   casa[plid] = 1;
	   vendedor[plid] = playerid;
	   PosicaoCasa[plid][0] = X;
	   PosicaoCasa[plid][1] = Y;
	   PosicaoCasa[plid][2] = Z;
	   PosicaoCasa[plid][3] = ang;
	   SendClientMessage(playerid, VERDE, "Proposta de casa oferecida.");
	   new string[256];
	   format(string, sizeof(string),"%s está lhe oferecendo uma casa",PlayerName(playerid));
	   SendClientMessage(plid, BRANCO, string);
	   SendClientMessage(plid, BRANCO, "Digite /aceitarcasa para aceitar ou então digite /recusarcasa para recusar");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
	/*-------------------*/
	
	/*comandos de admins*/
	if(strcmp(cmd, "/setjob", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid,emprego;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /setjob [id-do-jogador] [id-do-emprego]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   emprego = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, VERMELHO, "Uso: /setjob [id-do-jogador] [id-do-emprego]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(emprego >= 1 && emprego <= MAX_JOBS){
	   job[plid] = emprego;
	   udb_setProf(PlayerName(plid),emprego);
	   SetPlayerSkin(plid,SkinProf[emprego]);
	   udb_setSkin(PlayerName(plid),SkinProf[emprego]);
	   LogarJogador(plid);
	   new string[256];
	   format(string,sizeof(string),"Você mudou o emprego de %s para %s.",PlayerName(plid),NomeProf[emprego]);
	   SendClientMessage(playerid, VERDE, string);
	   new msg[256];
	   format(msg,sizeof(msg),"O administrador %s mudou seu emprego para %s.",PlayerName(playerid),NomeProf[emprego]);
	   SendClientMessage(plid, VERDE, msg);
	   SendClientMessage(plid, VERDE, "Digite /cmdsjob para ver os comandos de seu novo emprego.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Emprego inválido!");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, VERMELHO, "DICA: Não tente mexer nesse comando mais uma vez!");
		   for(new i=0; i<MAX_PLAYERS; i++){
		   if(IsPlayerAdmin(i)){
		   new str[256];
		   format(str,sizeof(str),"%s usou o comando de mudar emprego mas NÃO ERA ADMINISTRADOR!",PlayerName(playerid));
		   SendClientMessage(i, AZUL2, str);
		   }
	    }
	       return 1;
     }
  }
	   
	   
	/*-------------------*/

	/*Comando errado ou inválido*/
	SendClientMessage(playerid, VERMELHO, "Comando desconhecido pelo gamemode.");
	return 1;
	/*--------------------------*/
}

public FimRoubo(playerid)
{
roubo[playerid] = 0;
}
stock AvisoComandoEmprego()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	if(IsPlayerAdmin(i)){
	SendClientMessage(i, VERDE2, "|-------------------------------------| ATENÇÃO |-------------------------------------|");
	SendClientMessage(i, VERDE2, "Para mudar o emprego de um jogador use: '/setjob [id-do-jogador] [id-do-emprego]'");
	}
  }
}
stock Salario()
{
	for(new i; i<MAX_PLAYERS; i++) {
	    if(IsPlayerConnected(i)) {
			SendClientMessage(i, BRANCO, FraseProf[job[i]]);
			udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + SalarioProf[job[i]]);
		}
	}
}
stock IsPlayerInArea(playerid, Float:xmin, Float:xmax, Float:ymin, Float:ymax)
{
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid,X,Y,Z);
	if(X >= xmin && X <= xmax && Y >= ymin && Y <= ymax) return true;
	return false;
}
public Areas()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	}
}
stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	return name;
}

stock DistanciaEntre(playerid,playerid2)
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
  if(taxi[i] == 1){
  if(GetPlayerMoney(i) >= MoneyTaximetro[i][taxista[i]] + 2){
  MoneyTaximetro[i][taxista[i]] = MoneyTaximetro[i][taxista[i]] + 2;
  new msg[256];
  format(msg,sizeof(msg),"O Taximetro está marcando: R$%d",MoneyTaximetro[i][taxista[i]]);
  SendClientMessage(i, BRANCO, msg);
  SendClientMessage(taxista[i], BRANCO, msg);
  }
  else{
	  RemovePlayerFromVehicle(i);
	  GivePlayerMoney(taxista[i],MoneyTaximetro[i][taxista[i]]);
	  GivePlayerMoney(i,0-MoneyTaximetro[i][taxista[i]]);
	  SendClientMessage(taxista[i], VERDE, "Seu passageiro ficou sem dinheiro e foi retirado do taxi!");
	  SendClientMessage(i, VERMELHO, "Sinto muito! Seu dinheiro acabou e o taxi não é grátis.");
	  MoneyTaximetro[i][taxista[i]] = 0;
	  taxi[i] = 0;
	  taxista[i] = 0;
	  passageiro[taxista[i]] = 0;
	  }
    }
  }
}
public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Preso[i] == 1){
			if(TempoPreso[i] > 0) TempoPreso[i]--;
			else{
				SendClientMessage(i, VERMELHO, "Fim de julgamento, você foi liberado da prisão!");
				SendClientMessage(i, VERMELHO, "Da próxima vez, pense bem antes de cometer um crime.");
			    Preso[i] = 0;
		   		udb_setPrisao(PlayerName(i),0);
		   		LogarJogador(i);
			}
		}
	}
}
public OnPlayerEnterCheckpoint(playerid)
{
	new string[256];
	if(CatandoLatas[playerid] == 1){
		new money = random(50)+50;
		format(string,sizeof(string),"Você recebeu $%d pelas latas coletadas!",money);
		SendClientMessage(playerid, VERDE, string);
		GivePlayerMoney(playerid,money);
        DisablePlayerCheckpoint(playerid);
 		new l = random(23);
   		SetPlayerCheckpoint(playerid,Latas[l][0],Latas[l][1],Latas[l][2],3.0);
        SendClientMessage(playerid, VERDE, "Você pode continuar coletando latas ou pode parar com /pararcoleta");
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
		SetWorldTime(worldTime);
		if(worldMinute==1){
		switch(worldTime)
		{
		case 0 :
		{
		Salario();
		}
		case 18 :
		{
		SendClientMessageToAll(VERDE2, "Denuncie o uso de cheats: '/report [id] [razão]'");
		}
		case 15 :
		{
		AvisoComandoEmprego();
		}
      }
   }
}
