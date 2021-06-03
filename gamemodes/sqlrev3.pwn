#include <rmi>

//Server de MySQL. As alternativas s�o Local, Kinghost e Servage
#define DEFAULT_MYSQL_SERVER MYSQL_Local

new MostrandoPick[MAX_PLAYERS];
new PickCasas_Dono[400][256];
new CamuflagemContagem[MAX_PLAYERS];
new Float:PickCasas_Coord[400][3];
forward MoneyGrubScoreUpdate();
forward Reconnect();
public Reconnect()
{
	if(samp_mysql_ping()!=0) {
	    samp_mysql_close();
		ConectarMysql(DEFAULT_MYSQL_SERVER);
	}
}

main()
{
	print("\n---------------------------------------------");
	print("                 MPA RevolutioN RPG");
	print("----------------------------------------------\n");
	worldTime = 20;
	worldMinute = 0;
	writelog("\r\n---\r\n   FreeStyle/Revolution Beta 1 carregado!\r\n \r\n Copyright � 2008 Infernus Development Group.\r\n Todos os direitos reservados.\r\n---\r\n ");
	SetTimer("Reconnect",15000,true);
}


public OnPlayerKeyStateChange(playerid,newkeys,oldkeys){
	if(newkeys == 16){
	    if(IsPlayerInAnyVehicle(playerid) && !GetPlayerInterior(playerid) && !Abastecendo[playerid]){
	        TogglePlayerControllable(playerid,1);
	        RemovePlayerFromVehicle(playerid);
		}
	}
	if((newkeys==KEY_ACTION)&&(IsPlayerInAnyVehicle(playerid))&&(GetPlayerState(playerid)==PLAYER_STATE_DRIVER)){
	    if((GetVehicleModel(GetPlayerVehicleID(playerid)) == 525) && (Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid))){
			new Float:pX,Float:pY,Float:pZ;
			GetPlayerPos(playerid,pX,pY,pZ);
			new Float:vX,Float:vY,Float:vZ;
			new Found,vid;
			while((vid<MAX_VEHICLES)&&(!Found))
   			{
   				vid++;
   				GetVehiclePos(vid,vX,vY,vZ);
   				if ((floatabs(pX-vX)<7.0)&&(floatabs(pY-vY)<7.0)&&(floatabs(pZ-vZ)<7.0)&&(vid!=GetPlayerVehicleID(playerid)))
   				{
   				    Found=1;
   				    if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid))) DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
		    		else AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
   				    SendClientMessage(playerid,COLOR_MECANICO,"Carro rebocado!");
   				}
       		}
			if(!Found) SendClientMessage(playerid,COLOR_RED,"Sem carro!");
	    }
	}
}

public OnGameModeInit()
{
	print("Carregando GameMode RPG");
	writelog("\r\n");
	SetWeather(1);
	EnableZoneNames(1);
	AllowInteriorWeapons(1);
	EnableStuntBonusForAll(0);
	EnableTirePopping(1);
	new Dia,Mes,Ano, msg[256];
	getdate(Ano,Mes,Dia);
	format(msg,sizeof(msg),"Gamemode iniciado em %d/%d/%d �s %s",Dia,Mes,Ano,GetFormattedTime());
	writelog(msg);
	writelog("Carregando MPARRPG...");
	SetGameModeText("FreeStyle� RPG");
	
	CriarTextdraws();
	CriarMenus();
	CriarPickups();
	AddPlayerClass(34,1592.921753, -1638.546753, 14.789343,220.25,0,0,0,0,0,0);
	
	CreateObject(1498,3331.293,-167.276,6.572,0.0,0.0,90.241);
	CreateObject(14866,3332.571,-164.409,7.248,0.0,0.0,0.0);
	CreateObject(14866,3334.885,-164.396,7.239,0.0,0.0,0.0);
	CreateObject(936,3335.541,-169.044,7.128,0.0,0.0,270.723);
	CreateObject(1417,3332.221,-169.344,6.922,0.0,0.0,183.060);
	CreateObject(16150,3327.619,-163.567,6.631,0.0,0.0,0.0);
	CreateObject(1754,3335.628,-166.250,6.634,0.0,0.0,-90.241);
	
	Gates[0] = CreateObject(968, 1544.687866, -1630.546875, 13.165515, 0, 269.4727, 269.9995);
	Gates[1] = CreateObject(968, 2238.198730, 2450.429932, 10.597424, 0, 269.4727, 269.9996);
	Gates[2] = CreateObject(968, -1572.189331, 658.876709, 6.887374, 0, 269.4727, 269.9995);
	Gates[3] = CreateObject(968, -1701.452271, 687.616211, 24.592068, 0, 269.4727, 269.9995);
	
	Portao[0] =	CreateObject(10184, 1592.921753, -1638.546753, 14.789343, 0, 0, 90);//fechado LS
	Portao[1] =	CreateObject(10184, 2334.678711, 2443.014404, 7.259488, 0, 0, 326.25);//fechado LV
	Portao[2] = CreateObject(10184,-1631.699219, 688.715637, 8.709263, 0, 0, 270);//fechado SF
	Portao[3] =	CreateObject(10184, 2294.276123, 2503.250488, 4.719362, 0, 0, 0);//fechado LV

	CriarCheckpoints();
	ConectarMysql(DEFAULT_MYSQL_SERVER);
	AtivarTimers();
	CarregarCarros();
	LoadPickups();
	LoadCell();
	return 1;
}

stock LoadCell()
{
	new msg[256],query[256],rl[256],field[128];
	query = "SELECT phonenumb FROM players ORDER BY phonenumb DESC LIMIT 1";
	if(!samp_mysql_query(query)) print("Erro com a query da fun��o LoadCell");
	samp_mysql_store_result();
    while(samp_mysql_fetch_row(rl)) samp_mysql_strtok(field, "|", rl);
	LastPN = strval(field);
	if(!LastPN) LastPN = 1000;
	format(msg,256,"Carregando Lista de celulares... OK.\r\n�ltimo n�mero carregado: %d",LastPN);
	writelog(msg);
	return 1;
}

stock LoadPickups()
{
	new query[256], tid,id, field[128], field2[128],pct, resultline[256];
	new Float:x,Float:y,Float:z,nom[256];
	format(query,sizeof query,"SELECT id,modelo,x,y,z,nick FROM pickups");
	if(!samp_mysql_query(query)) print("Erro na Query da fun��o LoadPickups");
	samp_mysql_store_result();
 	while(samp_mysql_fetch_row(resultline)==1)
	{
		samp_mysql_strtok(field, "|", resultline); 
		tid = strval(field);
		new ct;
		while(samp_mysql_strtok(field2, "|", "")==1) {
		    ct++;
		    if(ct == 1) id = strval(field2);
			if(ct == 2) x = Float:floatstr(field2);
			if(ct == 3) y = Float:floatstr(field2);
			if(ct == 4) z = Float:floatstr(field2);
			if(ct == 5) nom = field2;
		}
		new pid=CreatePickup(id,1,x,y,z);
		PickCasas_Dono[pid]=nom;
		PickCasas_Coord[pid][0]=x;
		PickCasas_Coord[pid][1]=y;
		PickCasas_Coord[pid][2]=z;
		pct++;
	}
	if(!pct) {
	    writelog("N�o h� nenhum pickup nesse servidor.");
	    return 0;
	}
	new tmp[256];
	format(tmp,256,"ID do �ltimo pickup carregado: %d. Total de pickups carregados: %d",tid,pct);
	writelog(tmp);
	return 1;
}

forward GasSaving();
public GasSaving() SaveGas();
public OnVehicleMod(vehicleid, componentid)
{
	switch(componentid)
	{
	  	case 1000,1001,1002,1003,1014,1015,1016,1023,1058,1060,1049,1050,1138,1139,1146,1147,1158,1162,1163,1164: SaveTuning(vehicleid,1,componentid);
		case 1008,1009,1010: SaveTuning(vehicleid,2,componentid);
		case 1117,1152,1153,1155,1157,1160,1165,1167,1169,1170,1171,1172,1173,1174,1175,1179,1181,1182,1185,1188,1189,1192,1193: SaveTuning(vehicleid,3,componentid);
		case 1140,1141,1148,1149,1150,1151,1154,1156,1159,1161,1166,1168,1176,1177,1178,1180,1183,1184,1186,1187,1190,1191: SaveTuning(vehicleid,4,componentid);
		case 1018,1019,1020,1021,1022,1028,1029,1037,1046,1059,1064,1065,1066,1089,1092,1104,1105,1113,1114,1126,1127,1129,1132,1135,1136: SaveTuning(vehicleid,5,componentid);
		case 1042,1044: SaveTuning(vehicleid,6,componentid);
		case 1043,1045: SaveTuning(vehicleid,7,componentid);
		case 1004,1005,1011,1012: SaveTuning(vehicleid,8,componentid);
	    case 1006,1032,1033,1035,1038,1053,1054,1055,1061,1067,1068,1088,1091: SaveTuning(vehicleid,9,componentid);
		case 1007,1026,1031,1036,1039,1047,1048,1056,1057,1069,1070,1090,1093,1106,1108,1118,1119,1133,1122,1134: SaveTuning(vehicleid,10,componentid);
	    case 1017,1027,1030,1040,1041,1051,1052,1062,1063,1071,1072,1094,1095,1099,1101,1102,1107,1120,1121,1124,1137: SaveTuning(vehicleid,11,componentid);
	    case 1087: SaveTuning(vehicleid,12,componentid);
		case 1086: SaveTuning(vehicleid,13,componentid);
	    case 1109,1110: SaveTuning(vehicleid,14,componentid);
		case 1115,1116: SaveTuning(vehicleid,15,componentid);
	    case 1025,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1096,1097,1098: SaveTuning(vehicleid,16,componentid);
		case 1013,1024: SaveTuning(vehicleid,17,componentid);
	}
	return 1;
}

public OnVehicleRespray(vehicleid,color1,color2) SaveColor(vehicleid,color1,color2);

stock SaveGas()
{
/*	new pattern[256];
	new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    dini_IntSet(pattern,"gasolina",GPV[contagem]);
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
	return 1;*/
}

stock md5(string[])
{
	new sg[256];
	sg = MD5_Hash(string);
	for(new c; c<sizeof sg; c++) tolower(sg[c]);
	return sg;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerColor(playerid,COLOR_UNLOGGED);
	SetPlayerPos(playerid,-2699.4666,375.9366,4.3767);
	SetPlayerFacingAngle(playerid, 272.0);
	SetPlayerCameraPos(playerid,-2691.5637,376.1027,4.3704);
	SetPlayerCameraLookAt(playerid,-2699.4666,375.9366,4.3767);
	PlayerPlaySoundEx(playerid,1097);
	ApplyAnimation(playerid,"BD_FIRE","BD_Fire1",4.1,1,1,1,1,1);
	if(!TravaTextdraw[playerid]){
		TextDrawShowForPlayer(playerid,Bemvindo);
		TextDrawShowForPlayer(playerid,Bemvindo2);
		TextDrawShowForPlayer(playerid,Bemvindo3);
		TravaTextdraw[playerid]=1;
	}
	if(PLAYERLIST_authed[playerid] == 1) LogarPlayer(playerid);
	return 1;
}

public OnGameModeExit()
{
	writelog("MPARRPG finalizado. Salvando configura��es...");
	for(new v; v<LASTID; v++) PRIV_sqlset("cars","gasolina",IntToStr(GPV[v]),PRIV_FWI(v));
	writelog("MPARRPG finalizado com sucesso");
	print("Saindo do GameMode RPG");
	samp_mysql_close();
	return 1;
}

stock CriarMapicons(playerid)
{
	new id = 1;
	SetPlayerMapIcon(playerid,GetRealID(id),-2714.4551,218.1333,4.2913,27,0xFFFFFFFF); //wheel arch angels - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-1642.2518,1203.4906,7.2527,55,0xFFFFFFFF); //aluguel de carros - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2026.7950,157.1650,29.0391,27,0xFFFFFFFF); //oficina - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2049.5732,244.7132,35.5723,11,0xFFFFFFFF); //constru��o - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-1935.6180,237.8451,34.3125,27,0xFFFFFFFF); //transfender - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-1966.2009,293.9109,35.4688,55,0xFFFFFFFF); //concession�ria - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2651.6501,634.1177,14.4531,22,0xFFFFFFFF); //hospital - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),1173.5842,-1324.5615,15.1953,22,0xFFFFFFFF); //hospital
	SetPlayerMapIcon(playerid,GetRealID(id),2031.9415,-1404.3578,17.2614,22,0xFFFFFFFF); //hospital
	SetPlayerMapIcon(playerid,GetRealID(id),1582.5615,1768.7921,10.8203,22,0xFFFFFFFF); //hospital
	SetPlayerMapIcon(playerid,GetRealID(id),-320.7639,1065.8195,19.7422,22,0xFFFFFFFF); //hospital
	SetPlayerMapIcon(playerid,GetRealID(id),-1605.5067,710.3071,13.8672,30,0xFFFFFFFF); //delegacia - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2026.4346,-99.3603,35.1641,36,0xFFFFFFFF); //auto-escola - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2624.7446,1409.4442,7.0938,23,0xFFFFFFFF); //boate - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2203.9382,617.1038,35.1641,43,0xFFFFFFFF); //central da mafia - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2052.3342,458.6646,35.1719,61,0xFFFFFFFF); //agencia - san fierro
	SetPlayerMapIcon(playerid,GetRealID(id),-2443.2205,752.8530,35.1786,19,0xFFFFFFFF); //24/7 san fierro
	for(new i; i<NUM_BANCOS; i++) SetPlayerMapIcon(playerid,GetRealID(id),bancospos[i][0],bancospos[i][1],bancospos[i][2],52,0xFFFFFFFF);
}

stock GetRealID(&id)
{
	id++;
	return id-1;
}

public OnPlayerConnect(playerid)
{
	CriarMapicons(playerid);
	CPS_SetStreamActiveForPlayer(playerid,true);
    Agenda[playerid] = 0;
    TravaTextdraw[playerid]=0;
    numplayers++;
    CamuflagemContagem[playerid]=0;
    Kills[playerid]=0;
   	Contrabando[playerid] = 0;
    celular[playerid] = 0;
   	LastVote[playerid] = 255;
   	KickVote[playerid] = 0;
   	MostrandoHora[playerid] = 0;
	VoteKick[playerid] = 0;
    zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	ApostandoSena[playerid]=false;
	ApostandoQuina[playerid]=false;
	ApostasQuina[playerid]=0;
	ApostasSena[playerid]=0;
	Acertos[playerid]=0;
	MissaoLixeiro[playerid] = 0;
	DebugKeys[playerid] = 0;
	TogglePlayerClock(playerid,1);
	SetPlayerTime(playerid,worldTime,worldMinute);
	PLAYERLIST_authed[playerid] = 0;
	Escondido[playerid] = 0;
	AreaBanco[playerid] = 0;
	AreaCreditos[playerid] = 0;
	for(new c; c<MAX_VEHICLES; c++) if(CarroTrancado[c] == 1 && !compare(Dono[c],PlayerName(playerid))) SetVehicleParamsForPlayer(c,playerid,false,true);
	SetPlayerColor(playerid,COLOR_UNLOGGED);
	new msg[256];
	format(msg,sizeof(msg),"SERVIDOR: %s entrou no servidor.",PlayerName(playerid));
	SendClientMessageToAll(COLOR_COP_SWAT,msg);
	new pip[16];
	GetPlayerIp(playerid,pip,sizeof pip);
	format(msg,sizeof(msg),"%s entrou no servidor, com o ID %d. (IP: %s)",PlayerName(playerid),playerid,pip);
	writelog(msg);
	SendClientMessage(playerid, COLOR_TAXI_AEREO, "FreeStyle/RevolutioN RPG Beta 1: Vers�o MySQL - San Fierro");
	SendClientMessage(playerid, COLOR_PALHA, "Quer ajuda? /ajuda");
	SendClientMessage(playerid, COLOR_PALHA, "Comandos? /comandos");
	SendClientMessage(playerid, COLOR_PALHA, "Rec�m-chegado? /aprender");
	new ip[17],ipc[256],ips[256];
	GetPlayerIp(playerid,ip,17);
	format(ips,256,"nick = '%s'",PlayerName(playerid));
	ipc = PRIV_sqlget("ips","ip",ips);
	if(compare(ip,ipc)) {
	    format(ips,256,"Seja bem-vindo novamente a esse servidor, %s.",PlayerName(playerid));
	    SendClientMessage(playerid,COLOR_AZULPLUS,ips);
	    SendClientMessage(playerid,COLOR_COP_SWAT,"Voc� foi automaticamente logado.");
	    PLAYERLIST_authed[playerid]=1;
		return 1;
	}
	if(Cadastrado(PlayerName(playerid))) SendClientMessage(playerid, COLOR_PALHA, "Voc� j� est� registrado aqui. Fa�a login com /logar [senha]");
	else SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� registrado. Registre-se com /registrar [senha]");
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
	PrelAnim[playerid]=0;
    numplayers--;
    TextDrawHideForPlayer(playerid,tdHora);
   	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	if(EmLigacao[playerid] == 1){
	    EmLigacao[playerid]=0;
	    EmLigacao[CalledID[playerid]]=0;
	    SetPlayerSpecialAction(CalledID[playerid],SPECIAL_ACTION_STOPUSECELLPHONE);
	    SendClientMessage(CalledID[playerid],COLOR_RED,"Liga��o terminada.");
		if(CobrancaCall[playerid] == 0) KillTimer(CellTimer[CalledID[playerid]]);
		if(CobrancaCall[playerid] == 1) KillTimer(CellTimer[playerid]);
	}
	new msg[256];
	switch(reason)
	{
		case 0: format(msg,sizeof(msg),"SERVIDOR: %s deixou o servidor (Queda de conex�o)",PlayerName(playerid));
		case 1: format(msg,sizeof(msg),"SERVIDOR: %s deixou o servidor (Vontade pr�pria)",PlayerName(playerid));
		case 2: format(msg,sizeof(msg),"SERVIDOR: %s deixou o servidor (Kickado/Banido)",PlayerName(playerid));
	}
    SendClientMessageToAll(COLOR_COP_SWAT,msg);
	switch (PLAYERLIST_authed[playerid])
    {
        case 0:
			{
				format(msg,sizeof(msg),"%d (ID: %d) deixou o servidor sem se registrar/logar.",PlayerName(playerid),playerid);
				writelog(msg);
				printf("Jogador %s (ID: %d) deixou o servidor sem se registrar/logar",PlayerName(playerid),playerid);
			}
		case 1:
		    {
				format(msg,sizeof(msg),"%s (ID %d) est� deixando o servidor. Salvando dados.",PlayerName(playerid),playerid);
				writelog(msg);
				TrocarAccState(PlayerName(playerid),GetPlayerMoney(playerid));
				TrocarGas(PlayerName(playerid), Petrol[playerid]);
				TrocarCreditos(PlayerName(playerid), CellCredits[playerid]);
		 		printf("Jogador %s (ID: %d) deixou o servidor. Seus dados foram salvos com sucesso.",PlayerName(playerid),playerid);
			}
    }
	return 1;
}

stock PreloadAnimLib(playerid, animlib[]) ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);

stock PreloadAnimations(playerid)
{
	PreloadAnimLib(playerid,"FINALE");
	PreloadAnimLib(playerid,"BOMBER");
	PreloadAnimLib(playerid,"RAPPING");
	PreloadAnimLib(playerid,"SHOP");
	PreloadAnimLib(playerid,"BEACH");
	PreloadAnimLib(playerid,"SMOKING");
	PreloadAnimLib(playerid,"FOOD");
	PreloadAnimLib(playerid,"ON_LOOKERS");
	PreloadAnimLib(playerid,"DEALER");
	PreloadAnimLib(playerid,"CRACK");
	PreloadAnimLib(playerid,"CARRY");
	PreloadAnimLib(playerid,"COP_AMBIENT");
	PreloadAnimLib(playerid,"PARK");
	PreloadAnimLib(playerid,"INT_HOUSE");
	PreloadAnimLib(playerid,"FOOD");
}

forward ExibirTextDraw(playerid,Text:tdid);
public ExibirTextDraw(playerid,Text:tdid) TextDrawShowForPlayer(playerid,tdid);

public OnPlayerSpawn(playerid)
{
	if(!PrelAnim[playerid]) PreloadAnimations(playerid);
	CPS_SetStreamActiveForPlayer(playerid,true);
	PlayerPlaySoundEx(playerid,1098);
   	zoneupdates[playerid] = 1;
	player_zone[playerid] = -1;
	if(HospitalInternado[playerid]>0) {
	    ProcessaMorte(playerid);
		return 1;
	}
	if(!zoneupdate) zoneupdate = SetTimer("update_zones",1000,4);
	TextDrawHideForPlayer(playerid,Bemvindo);
	TextDrawHideForPlayer(playerid,Bemvindo2);
	TextDrawHideForPlayer(playerid,Bemvindo3);
	if(MostrandoHora[playerid] == 0) { SetTimerEx("ExibirTextDraw",8000,false,"dd",playerid,_:tdHora); MostrandoHora[playerid]=1; }
	if(CamuflagemContagem[playerid] == 0) SetPlayerColor(playerid,ProfColors[Profissao[playerid]]); else SetPlayerColor(playerid,ProfInvColors[Profissao[playerid]]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][0],ProfWeapons[Profissao[playerid]][1]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][2],ProfWeapons[Profissao[playerid]][3]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][4],ProfWeapons[Profissao[playerid]][5]);
	GivePlayerWeapon(playerid,ProfWeapons[Profissao[playerid]][6],ProfWeapons[Profissao[playerid]][7]);

    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid,0);
	if(!PLAYERLIST_authed[playerid]){
		SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		SetPlayerFacingAngle(playerid, 90.0000);
    	return 1;
	}
	new prisao = PegarPrisao(PlayerName(playerid));
	if(prisao==1 || Procurados[playerid]){
		LogarPlayer(playerid);
    	return 1;
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SendDeathMessage(killerid,playerid,reason);
   	GameTextForPlayer(playerid,"acabado!", 5000,1);
	new skin = PegarSkin(PlayerName(playerid));
	if(Procurados[playerid] == 1){
	    SendClientMessage(playerid,COLOR_RED,"Os m�dicos lhe encontraram e te entregaram para a cadeia.");
	    SetSpawnInfo(playerid, 1, skin, 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
	    TrocarPrisao(PlayerName(playerid), 1);
	} else {
		HospitalInternado[playerid] = GetClosestHospital(playerid)+1;
		SetSpawnInfo(playerid, 1, skin,3335.0933,-164.4139,8.5,273.0711,0,0,0,0,0,0);
		SetPlayerVirtualWorld(playerid,playerid);
	}
	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	Contrabando[playerid] = 0;
	Chave[playerid] = 0;
    new string[256];
    Kills[killerid]++;
    if(killerid != INVALID_PLAYER_ID) {
        if(GetPlayerWantedLevel(playerid) > 0){
            SendClientMessage(killerid,COLOR_GREEN,"Voc� ganhou uma graninha da pol�cia por ter matado esse cara.");
            GivePlayerMoney(killerid,GetPlayerWantedLevel(playerid)*minrand(300,500));
		}
		if(Profissao[killerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT) {
		    SetPlayerWantedLevel(killerid, 0);
		    SetPlayerWantedLevel(playerid, 0);
		    TrocarWantedLevel(PlayerName(killerid), 0);
	    }
	    if((Profissao[playerid] == SHERIFF  || Profissao[playerid] == JUIZ) && !Chave[killerid]){
		 	SendClientMessage(killerid, COLOR_GREEN, "Voc� matou o Juiz/Sheriff, roubou a chave da cadeia, agora pode libertar 1 pessoa!");
		 	SendClientMessage(killerid, COLOR_GREEN, "Basta usar /soltarpreso [id]");
		 	SendClientMessage(playerid, COLOR_JUIZ, "O assassino roubou a chave da pris�o. Comunique a pol�cia!");
			Chave[killerid] = 1;
		}
		if((Profissao[killerid] == COP_MILITAR || Profissao[killerid] == COP_SWAT || Profissao[killerid] == SHERIFF) && Chave[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "Voc� foi morto por um policial e a chave da cadeia foi tomada de voc�!");
			SendClientMessage(killerid, COLOR_GREEN, "Bom trabalho! Voc� tirou a chave da cadeia desse vagabundo!");
			Chave[playerid] = 0;
		}
		if(Profissao[killerid] == ASSASSINO){
			if(GetPlayerMoney(playerid) < 10000){
    			AcrescentarExPoints(killerid,2);
    			GivePlayerMoney(killerid,GetPlayerMoney(playerid));
				SendClientMessage(killerid, COLOR_GREEN, "Voc� ganhou 2 Pontos por ter matado um jogador com mais de $10.000");
				return 1;
			}
			else if(GetPlayerMoney(playerid) < 30000){
	 			AcrescentarExPoints(killerid,3);
	 	    	GivePlayerMoney(killerid,GetPlayerMoney(playerid));
	  		    SendClientMessage(killerid, COLOR_GREEN, "Voc� ganhou 3 Pontos por ter matado um jogador com mais de $30.000");
				return 1;
			}
			else if(GetPlayerMoney(playerid) < 50000){
	   			AcrescentarExPoints(killerid,4);
				GivePlayerMoney(killerid,GetPlayerMoney(playerid));
	    		SendClientMessage(killerid, COLOR_GREEN, "Voc� ganhou 4 Pontos por ter matado um jogador com mais de $50.000");
				return 1;
			}
			else if(GetPlayerMoney(playerid) < 100000){
	   			AcrescentarExPoints(killerid,5);
	 			GivePlayerMoney(killerid,GetPlayerMoney(playerid));
	    		SendClientMessage(killerid, COLOR_GREEN, "Voc� ganhou 5 Pontos por ter matado um jogador com mais de $100.000");
				return 1;
			}
		}
	}
	switch(Kills[killerid])
	{
	    case 2:
	        {
				format(string, sizeof(string), "O Jogador %s agora tem 1 Estrela de Procurado por 2 mortes.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_RODOVIARIO, string);
				SendClientMessage(killerid, COLOR_RED, "Voc� agora tem 1 Estrela de Procurado por 2 mortes.");
			    SetPlayerWantedLevel(killerid, 1);
				SetPlayerWantedLevel(playerid, 0);
				TrocarWantedLevel(PlayerName(killerid), 1);
			}
		case 5:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 2 Estrelas de Procurado por 5 mortes e ainda n�o foi pego.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_RODOVIARIO, string);
				SendClientMessage(killerid, COLOR_RED, "Bom...voc� agora tem 2 Estrelas de Procurado por 5 mortes.");
				SetPlayerWantedLevel(killerid, 2);
				SetPlayerWantedLevel(playerid, 0);
				TrocarWantedLevel(PlayerName(killerid), 2);
			}
		case 7:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 3 Estrelas de Procurado por 7 mortes. Est� fazendo os cops de MARIQUINHAS!",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "Ex�mio matador! Voc� agora tem 3 Estrelas de Procurado por 7 mortes.");
				SetPlayerWantedLevel(killerid, 3);
				SetPlayerWantedLevel(playerid, 0);
				TrocarWantedLevel(PlayerName(killerid), 3);
			}
		case 12:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 4 Estrelas de Procurado por 12 mortes. Nada?",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "J� come�ou a botar medo nos cops. Voc� agora tem 4 Estrelas de Procurado por 12 mortes.");
				SetPlayerWantedLevel(killerid, 4);
				SetPlayerWantedLevel(playerid, 0);
				TrocarWantedLevel(PlayerName(killerid), 4);
			}
		case 18:
			{
				format(string, sizeof(string), "O Jogador %s agora tem 5 Estrelas de Procurado por 18 mortes. O Xerife j� est� irritado com sua imcompet�ncia.",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "At� os admins se rendem ao seu poder! Voc� agora tem 5 Estrelas de Procurado por 18 mortes.");
				SetPlayerWantedLevel(killerid, 5);
				SetPlayerWantedLevel(playerid, 0);
				TrocarWantedLevel(PlayerName(killerid), 5);
			}
		case 25:
		    {
				format(string, sizeof(string), "O Jogador %s agora tem 6 Estrelas de Procurado por 25 mortes. Fim de Carreira!",PlayerName(killerid));
				SendClientMessagePolicia(COLOR_COP_SWAT, string);
				SendClientMessage(killerid, COLOR_RED, "Daqui voc� n�o passa! Voc� agora tem 6 Estrelas de Procurado por 25 mortes.");
				SetPlayerWantedLevel(killerid, 6);
				SetPlayerWantedLevel(playerid, 0);
				TrocarWantedLevel(PlayerName(killerid), 6);
			}
	}
	ResetPlayerMoney(playerid);
	return 1;
}
public OnVehicleSpawn(vehicleid)
{
	SetTimerEx("CarregarTuning",5000,false,"d",vehicleid);
	return 1;
}

public OnVehiclePaintjob(vehicleid,paintjobid)
{
	SavePaintjob(vehicleid,paintjobid);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	new placa[256];
	placa = PRIV_sqlget("cars","placa",PRIV_FWI(vehicleid));
	SetVehicleNumberPlate(vehicleid,placa);
	return 1;
}

public OnPlayerText(playerid,text[])
{
	fixchars(text);
	if(EmLigacao[playerid]==1){
		new tmp[256];
		format(tmp,256,"%s [SERVI�O DE TELEFONIA M�VEL]",text);
		fixchars(tmp);
		SendPlayerMessageToPlayer(CalledID[playerid],playerid,tmp);
		SendPlayerMessageToPlayer(playerid,playerid,tmp);
		new log[256];
		format(log,256,"[CELULAR] %s para %s: %s",PlayerName(playerid),PlayerName(CalledID[playerid]),text);
		writelog(log);
		return 0;
	}
	new log[256];
	format(log,256,"[CHAT] %s: %s",PlayerName(playerid),text);
	writelog(log);
	return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == Pickup_Entrada247){
        SetPlayerPos(playerid,6.091180,-29.271898,1003.549988);
        SetPlayerInterior(playerid,10);
	    SetPlayerFacingAngle(playerid,0);
	    DestroyPickup(pickupid);
	    Pickup_Entrada247=CreatePickup(1318,2,-2443.4539,755.4039,35.1719);
	}
	if(pickupid == Pickup_Saida247){
	    SetPlayerInterior(playerid,0);
	    SetPlayerPos(playerid,-2443.2205,752.8530,35.1786);
	    SetPlayerFacingAngle(playerid,180.0);
	    DestroyPickup(pickupid);
	    Pickup_Saida247 = CreatePickup(1318,2,5.8416,-30.5887,1003.5494);
	}
	if(pickupid == Pickup_EntradaPol){
        SetPlayerPos(playerid,246.40,110.84,1003.22);
        SetPlayerInterior(playerid,10);
        SetPlayerFacingAngle(playerid,0);
        DestroyPickup(pickupid);
        Pickup_EntradaPol = CreatePickup(1318,2,-1605.7075,710.2816,13.8672);
	}
	if(pickupid == Pickup_SaidaPol){
	    SetPlayerInterior(playerid,0);
	    SetPlayerPos(playerid,-1605.7092,711.6038,13.8672);
	    SetPlayerFacingAngle(playerid,0);
	    DestroyPickup(pickupid);
	    Pickup_SaidaPol = CreatePickup(1318,2,245.9235,108.6110,1003.2188);
	}
	if(pickupid == Pickup_EntradaCPD){
	    SetPlayerInterior(playerid,3);
	    SetPlayerFacingAngle(playerid,90);
	    SetPlayerPos(playerid,387.9047,171.1747,1008.3828);
	    DestroyPickup(pickupid);
	    Pickup_EntradaCPD=CreatePickup(1318,2,-2057.6982,456.1456,35.1719);
	}
	if(pickupid == Pickup_SaidaCPD){
		SetPlayerInterior(playerid,0);
		SetPlayerFacingAngle(playerid,168.6);
		SetPlayerPos(playerid,-2052.3342,458.6646,35.1719);
	    DestroyPickup(pickupid);
	    Pickup_SaidaCPD = CreatePickup(1318,2,389.7861,171.6789,1008.3828);
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
	new log[256];
	format(log,256,"[COMANDO] %s : %s",PlayerName(playerid),cmdtext);
	writelog(log);
	if(compare(cmd,"/sair247")){
	    SetPlayerInterior(playerid,0);
	    SetPlayerPos(playerid,-2443.2205,752.8530,35.1786);
	    SendClientMessage(playerid,COLOR_WHITE,"Voc� saiu da 24/7");
	    return 1;
	}
	if(compare(cmd,"/ativarvelo")){
	    OpcionalVelocimetro[playerid]=0;
		return 1;
	}
	if(compare(cmd,"/desativarvelo")){
	    OpcionalVelocimetro[playerid]=1;
	    return 1;
	}
	if(compare(cmd,"/definirhora")){
		if(!IsPlayerAdmin(playerid)){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem privil�gios de admin!");
		    return 1;
		}
		new tmp[256],hora,minuto;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/definirhora [horas] [minutos]");
		    return 1;
		}
		hora = strval(tmp);
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/definirhora [horas] [minutos]");
		    return 1;
		}
		minuto = strval(tmp);
		worldTime = hora%24;
		worldMinute = minuto%60;
		SendClientMessage(playerid,COLOR_RED,"Hora alterada com sucesso!");
		return 1;
	}
	if(compare(cmd,"/tocarsom")){
		new tmp[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/tocarsom [id]");
		    return 1;
		}
		PlayerPlaySoundEx(playerid,strval(tmp));
		SendClientMessage(playerid,COLOR_AZULPLUS,"Tocando som...");
		return 1;
	}
	if(compare(cmd,"/anim")){
		new tmp1[256],tmp2[256];
		tmp1 = strtok(cmdtext,idx);
		if(!strlen(tmp1)){
		    SendClientMessage(playerid,COLOR_RED,"/anim [bank] [name]");
		    return 1;
		}
		tmp2 = strtok(cmdtext,idx);
		if(!strlen(tmp2)){
		    SendClientMessage(playerid,COLOR_RED,"/anim [bank] [name]");
		    return 1;
		}
		ApplyAnimation(playerid,tmp1,tmp2,4.0,0,0,0,0,0);
		return 1;
	}
	if(compare(cmd,"/camuflagem")){
	    if(!AreaCreditos[playerid]){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em uma 24/7");
	        return 1;
		}
		new money = GetPlayerMoney(playerid);
		if(money < 500){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem dinheiro o suficiente para comprar uma camuflagem!");
		    return 1;
		}
		GivePlayerMoney(playerid,-500);
		SendClientMessage(playerid,COLOR_AZULPLUS,"Camuflagem comprada.");
		SendClientMessage(playerid,COLOR_YELLOW,"Como padr�o, a camuflagem ter� uma dura��o de 5 minutos,");
		SendClientMessage(playerid,COLOR_YELLOW,"com avisos de quando seu efeito ir� terminar.");
		SetPlayerColor(playerid,ProfInvColors[Profissao[playerid]]);
		CamuflagemContagem[playerid]=300;
		return 1;
	}
	if(compare(cmd,"/idinterno") && IsPlayerInAnyVehicle(playerid)){
		new tmp[256];
		format(tmp,256,"O ID interno de seu ve�culo �: %d",GetPlayerVehicleID(playerid));
		SendClientMessage(playerid,COLOR_AZULPLUS,tmp);
		return 1;
	}
	if(compare(cmd,"/profsbloqueadas")){
		new ps[256],tmp[256];
		ps = PRIV_sqlget("players","profblocks",PRIV_FWN(PlayerName(playerid)));
		format(tmp,256,"Profiss�es bloqueadas: %s",ps);
		SendClientMessage(playerid,COLOR_YELLOW,tmp);
		return 1;
	}
	if(compare(cmd,"/vercor")){
		new str[256];
		format(str,sizeof str,"Sua cor: %x",GetPlayerColor(playerid));
		SendClientMessage(playerid,COLOR_YELLOW,str);
		return 1;
	}
	if(compare(cmd,"/bloquearprof")){
	    if(!IsPlayerAdmin(playerid)){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o � administrador.");
	        return 1;
		}
		new tmp[256],plid,prof;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Sintaxe incorreta. Uso: /bloquearprof [id] [prof]");
		    return 1;
		}
		plid = strval(tmp);
		if(!IsPlayerConnected(playerid)){
			SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado.");
			return 1;
		}
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Sintaxe incorreta. Uso: /bloquearprof [id] [prof]");
		    return 1;
		}
		prof = strval(tmp);
		new ps[256];
		ps = PRIV_sqlget("players","profblocks",PRIV_FWN(PlayerName(plid)));
		new index,achado;
		tmp = strtok(ps,index);
		while(strlen(tmp) > 0){
		    if(prof == strval(tmp)) achado = 1;
		    tmp = strtok(ps,index);
		}
		if(achado){
		    SendClientMessage(playerid,COLOR_RED,"Essa profiss�o j� est� bloqueada para esse jogador!");
		    return 1;
		}
		strcat(ps," ");
		strcat(ps,IntToStr(prof));
		PRIV_sqlset("players","profblocks",ps,PRIV_FWN(PlayerName(plid)));
		SendClientMessage(playerid,COLOR_AZULPLUS,"Profiss�o bloqueada com sucesso!");
		format(tmp,256,"Voc� teve a profiss�o %s bloqueada por um administrador.",ProfExtName[prof]);
		SendClientMessage(plid,COLOR_RED,tmp);
		if(Profissao[playerid] == prof) AplicarProfissao(plid,1);
		return 1;
	}
	if(compare(cmd,"/apagarcarro") && IsPlayerAdmin(playerid)){
	    if(!IsPlayerInAnyVehicle(playerid)){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em nenhum ve�culo!");
	        return 1;
		}
		if(!IsPlayerInAnyVehicle(playerid)){
			SendClientMessage(playerid,COLOR_RED,"Ol�, qual carro desejaria apagar?");
			return 1;
		}
		new Float:pX, Float:pY, Float:pZ;
		GetPlayerPos(playerid,pX,pY,pZ);
		new vid = GetPlayerVehicleID(playerid);
		new query[1024],resultline[256],field[256],vinfo[24],Float:coord[4],contador,placa[256],dono[256];
		query = "SELECT id,modelid,cor1,cor2,gasolina,ipva,pintura,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17 FROM cars ORDER BY id DESC LIMIT 1";
		if(!samp_mysql_query(query)) print("erro na query 1 do comando /apagarcarro");
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)){
			samp_mysql_strtok(field,"|",resultline);
			vinfo[0] = strval(field);
			while(samp_mysql_strtok(field,"|","")) {
			    contador++;
				vinfo[contador] = strval(field);
			}
		}
		format(query,sizeof query,"SELECT placa,dono,x,y,z,ang FROM cars WHERE id = %d",vinfo[0]);
		if(!samp_mysql_query(query)) print("erro na query 2 do comando /apagarcarro");
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(resultline)){
		    samp_mysql_strtok(placa,"|",resultline);
		    samp_mysql_strtok(dono,"|","");
			samp_mysql_strtok(field,"|",""); coord[0] = floatstr(field);
			samp_mysql_strtok(field,"|",""); coord[1] = floatstr(field);
			samp_mysql_strtok(field,"|",""); coord[2] = floatstr(field);
			samp_mysql_strtok(field,"|",""); coord[3] = floatstr(field);
		}
		DestroyVehicle(vid);
		PRIV_sqldel("cars",PRIV_FWI(vid));
		LASTID--;
		if(vid != vinfo[0]) {
			PRIV_sqldel("cars",PRIV_FWI(vinfo[0]));
			CriarDocumentacao(vinfo[1],coord[0],coord[1],coord[2],coord[3],vinfo[2],vinfo[3],vinfo[4],dono,placa,vid);
			DestroyVehicle(vinfo[0]);
			new nvid = CreateVehicle(vinfo[1],coord[0],coord[1],coord[2],coord[3],vinfo[2],vinfo[3],-1);
			GPV[nvid] = vinfo[4];
			set(Dono[nvid],dono);
			SetVehicleNumberPlate(nvid,placa);
			SetVehicleToRespawn(nvid);
		}
		SetSpawnInfo(playerid,0,GetPlayerSkin(playerid),pX,pY,pZ,0,0,0,0,0,0,0);
		SpawnPlayer(playerid);
		/*LogarPlayer(playerid);
		SetPlayerPos(playerid,pX,pY,pZ);*/
		SendClientMessage(playerid,COLOR_AZULPLUS,"Ve�culo deletado!");
		return 1;
	}
	if(compare(cmd,"/trocarplaca") && IsPlayerAdmin(playerid)){
	    new vid = GetPlayerVehicleID(playerid);
		new tmp[256],placa[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/trocarplaca [placa]");
		    return 1;
		}
		placa = tmp;
		tmp = strtok(cmdtext,idx);
		while(strlen(tmp) > 0) {
		    strcat(placa," ");
		    strcat(placa,tmp);
		    tmp = strtok(cmdtext,idx);
		}
		PRIV_sqlset("cars","placa",placa,PRIV_FWI(vid));
		SetVehicleNumberPlate(vid,placa);
		new Float:X,Float:Y,Float:Z,Float:ang;
		GetVehiclePos(vid,X,Y,Z);
		GetVehicleZAngle(vid,ang);
		SetVehicleToRespawn(vid);
		SetTimerEx("ColocarNoVeiculoMot",600,0,"dd",playerid,vid);
		SetTimerEx("SetarPosicaoDoVeiculo",750,0,"dffff",vid,X,Y,Z,ang);
		SendClientMessage(playerid,COLOR_YELLOW,"Placa alterada");
		return 1;
	}
	if(compare(cmd,"/atualizarplaca") && IsPlayerAdmin(playerid)){
	    new placa[256];
	    new vid = GetPlayerVehicleID(playerid);
	    placa = PRIV_sqlget("cars","placa",PRIV_FWI(vid));
		SetVehicleNumberPlate(vid,placa);
		new Float:X,Float:Y,Float:Z,Float:ang;
		GetVehiclePos(vid,X,Y,Z);
		GetVehicleZAngle(vid,ang);
		SetVehicleToRespawn(vid);
		SetTimerEx("ColocarNoVeiculoMot",600,0,"dd",playerid,vid);
		SetTimerEx("SetarPosicaoDoVeiculo",750,0,"dffff",vid,X,Y,Z,ang);
		SendClientMessage(playerid,COLOR_YELLOW,"Placa atualizada");
	}
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
		    SendClientMessage(playerid,COLOR_RED,"ID inv�lido!");
		    return 1;
		}
		msg = tmp;
		while(strlen(tmp) > 0) {
		    strcat(msg," ");
	    	strcat(msg,tmp);
		    tmp = strtok(cmdtext,idx);
		}
	    SendPlayerMessageToAll(plid,msg);
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
		    SendClientMessage(playerid,COLOR_RED,"Valores de 0 � 23");
		    return 1;
		} else {
		    worldTime = strval(tmp);
		    SetWorldTime(worldTime);
		    return 1;
		}
	}
	if(strcmp(cmd,"/debugkeys",true)==0){
	    if(!DebugKeys[playerid])
		{
	        DebugKeys[playerid] = 1;
	        return 1;
		} else {
		    DebugKeys[playerid] = 0;
		    return 1;
		}
	}

 	if(strcmp(cmd, "/render", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		  SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
          return 1;
    	}
	}


	if(strcmp(cmd, "/bebado", true) == 0) {
    	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
        	ApplyAnimation(playerid,"PED", "WALK_DRUNK",4.0,0,1,0,0,0);
        	SendClientMessage(playerid, 0xFF0000FF, "Voc� est� b�bado?");
     		return 1;
 		}
    }

    if (strcmp("/plantarbomba", cmdtext, true) == 0) {
	      ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Cuidado. Um policial pode ver.");
		  return 1;
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
          SendClientMessage(playerid, 0xFF0000FF, "Que coisa hein! hehe");
		  return 1;
	}

    if (strcmp("/crack", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Est� duendo ? Manera...");
		  return 1;
	}

    if (strcmp("/mijar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "PAULNMAC", "Piss_in", 3.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Mijando em pra�a p�blica ? Olha os cops!!");
		  return 1;
	}

    if (strcmp("/sentar", cmdtext, true) == 0) {
          ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 1, 1, 1, 1);
          SendClientMessage(playerid, 0xFF0000FF, "Sentado.");
		  return 1;
    }

    if (strcmp("/fu", cmdtext, true) == 0) {
	      ApplyAnimation( playerid,"ped", "fucku", 4.1, 0, 1, 1, 1, 1 );
          SendClientMessage(playerid, 0xFF0000FF, "Fode esse cara mesmo! V� para a *QP");
		  return 1;
    }

	if(strcmp("/esconder-se",cmdtext,true)==0 && Escondido[playerid]==0)
	{
	    ClearAnimations(playerid);
	    ApplyAnimation(playerid,"DODGE","Cover_Dive_01"	,4.1,0,1,1,1,1);
		for(new i; i<MAX_PLAYERS; i++){
		    ShowPlayerNameTagForPlayer(playerid,i,0);
		}
		Escondido[playerid] = 1;
		SendClientMessage(playerid,COLOR_GREEN,"Hum, ningu�m est� te vendo agora!");
		return 1;
	}
	if(strcmp("/aparecer",cmdtext,true)==0 && Escondido[playerid]==1)
	{
	    ClearAnimations(playerid);
		for(new i; i<MAX_PLAYERS; i++){
		    ShowPlayerNameTagForPlayer(playerid,i,1);
		}
		Escondido[playerid] = 1;
		SendClientMessage(playerid,COLOR_GREEN,"Hum, est�o te vendo agora!");
		return 1;
	}
 	if(strcmp(cmdtext, "/conversar", true) == 0){
    	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
        	ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,1,1,1,1,1);
        	SendClientMessage(playerid, 0xFFC000AA, "Voc� est� conversando... cuidado para n�o ficar falando sozinho!");
        	return 1;
     	}
	}

    if (strcmp("/fumar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "SMOKING", "F_smklean_loop", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Fuma fuma fuma, folha de bananeira");
		  return 1;
	}

    if (strcmp("/fumar2", cmdtext, true, 4) == 0) {
          ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 0, 0, 0, 0, 0);
          SendClientMessage(playerid, 0xFF0000FF, "Fuma na boa, s� de brincadeira!");
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


    if(strcmp(cmd, "/chat", true) == 0){
    	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT){
        	ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,1,1,1,1,1);
        	SendClientMessage(playerid, 0xFF0000FF, "You are now talking");
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
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o � o dono desse ve�culo!");
			return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um ve�culo!");
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
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o � o dono desse carro!");
			return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um ve�culo!");
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

	if(strcmp(cmd, "/soltarpreso", true) == 0) {
 	    new tmp[256];
		new plid;
		new string[256];
		tmp = strtok(cmdtext, idx);
 		if(Chave[playerid] == 0){
        	SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem a chave da cadeia!");
        	return 1;
        }
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/soltarpreso [id]");
			return 1;
		}
        plid = strval(tmp);
     	if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			if(Presos[plid] == 0){
			    SendClientMessage(playerid,COLOR_RED,"O jogador n�o est� preso!");
				return 1;
			} else {
			    TrocarPrisao(PlayerName(playerid), 0);
			    Presos[plid] = 0;
			    SetSpawnInfo(plid,0,PegarSkin(PlayerName(plid)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
			    SpawnPlayer(plid);
			    format(string, sizeof(string), "O %s conseguiu a chave da cadeia, e fez voc� fugir!",PlayerName(playerid));
		        SendClientMessage(plid, COLOR_RED2, string);
			    SendClientMessage(playerid,COLOR_GREEN,"Fuga concedida!");
			    Contrabando[playerid] = 0;
				SetPlayerWantedLevel(plid, 0);
				TrocarWantedLevel(PlayerName(plid), 0);
				Chave[playerid] = 0;
				return 1;
			}
		}
		else{
            SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
			return 1;
		}
	}

	if(strcmp(cmd, "/piracemaon",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COLOR_RED,"A piracema j� est� ativada!");
				return 1;
	        } else {
	            SendClientMessageToAll(COLOR_RED,"A piracema est� ativada, quem for pego pescando ser� preso.");
	            SendClientMessage(playerid,COLOR_WHITE,"Feito.");
	            Piracema = 1;
	        	return 1;
	        }
	    } else {
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
			return 1;
	    }
	}

	if(strcmp(cmd,"/piracemaoff",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COLOR_RED,"A piracema n�o est� ativada!");
				return 1;
			} else {
			    SendClientMessageToAll(COLOR_GREEN,"A piracema agora est� desativada. Pode pescar � vontade!");
			    SendClientMessage(playerid,COLOR_WHITE,"Feito.");
			    Piracema = 0;
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
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
		    if(Piracema == 0){
		        SendClientMessage(playerid,COLOR_RED,"A piracema n�o est� ativada para voc� efetuar a pris�o!");
				return 1;
			}
		    if(PescaInProgress[plid] == 0){
		        SendClientMessage(playerid,COLOR_RED,"O jogador n�o est� pescando!");
				return 1;
			}
			if(!IsPlayerConnected(plid) && !PLAYERLIST_authed[plid]){
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}
			if(GetDistanceBetweenPlayers(plid,playerid) > 21){
		        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar a pris�o!");
				return 1;
			}
		    TrocarPrisao(PlayerName(plid),1);
		    LogarPlayer(plid);
		    AcrescentarExPoints(playerid,1);
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso");
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
   			        SendClientMessage(playerid,COLOR_GREEN,"O jogador n�o est� pescando");
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_GREEN,"O jogador est� pescando");
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
			return 1;
		}
	}
	if(strcmp(cmd,"/cacaon",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COLOR_RED,"A temporada de ca�a j� est� ativada!");
				return 1;
			}
		    SendClientMessageToAll(COLOR_GREEN,"A temporada de ca�a agora est� ativada. Pode ca�ar � vontade!");
		    SendClientMessage(playerid,COLOR_WHITE,"Feito.");
		    TemporadaCaca = 1;
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
			return 1;
		}
	}
	if(strcmp(cmd,"/cacaoff",true) == 0) {
	    if(Profissao[playerid] == COP_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COLOR_RED,"A temporada de ca�a j� est� desativada!");
	        	return 1;
	        }
	        SendClientMessageToAll(COLOR_RED,"A temporada de ca�a est� desativada, quem for pego ca�ando ser� preso.");
	        SendClientMessage(playerid,COLOR_WHITE,"Feito.");
	        TemporadaCaca = 0;
	    	return 1;
	    } else {
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
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
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}
   			if(CacaInProgress[plid] == 0){
		        SendClientMessage(playerid,COLOR_GREEN,"O jogador n�o est� ca�ando.");
				return 1;
			}
			SendClientMessage(playerid,COLOR_GREEN,"O jogador est� ca�ando.");
			return 1;
		} else {
	    	SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
			return 1;
		}
	}
	if(!strcmp(cmd,"/setlevel",true)){
	    if(!IsPlayerAdmin(playerid)) {
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o � admin!");
	        return 1;
		}
		new tmp[256], plid, quantia;
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid,COLOR_RED,"/setlevel [id] [quantia]");
			return 1;
		}
		plid = strval(tmp);
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid,COLOR_RED,"/setlevel [id] [quantia]");
			return 1;
		}
		quantia = strval(tmp);
		if(!IsPlayerConnected(plid)){
			SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado!");
			return 1;
		}
		TrocarXL(PlayerName(plid),quantia);
		SendClientMessage(playerid,COLOR_GREEN,"Level trocado");
		SendClientMessage(plid,COLOR_GREEN,"Seu Experience Level (XL) foi trocado. Digite /verlevel para ver");
		return 1;
	}
	
	if(compare(cmd,"/aumentarlevel")){
	    if(!IsPlayerAdmin(playerid)){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem privil�gios de administrador.");
	        return 1;
		}
		new tmp[256], plid, quantia;
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid,COLOR_RED,"/aumentarlevel [id] [quantia]");
			return 1;
		}
		plid = strval(tmp);
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp)){
	        SendClientMessage(playerid,COLOR_RED,"/aumentarlevel [id] [quantia]");
			return 1;
		}
		quantia = strval(tmp);
		if(!IsPlayerConnected(plid)){
			SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado!");
			return 1;
		}
		new level = PegarXL(PlayerName(playerid));
		TrocarXL(PlayerName(plid),quantia+level);
		SendClientMessage(playerid,COLOR_GREEN,"Level trocado");
		SendClientMessage(plid,COLOR_GREEN,"Seu Experience Level (XL) foi trocado. Digite /verlevel para ver");
		return 1;
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
			        SendClientMessage(playerid,COLOR_RED,"A temporada de ca�a est� ativada, por isso voc� n�o pode prend�-lo!");
					return 1;
				} else {
				    if(CacaInProgress[plid] == 0){
				        SendClientMessage(playerid,COLOR_RED,"O jogador n�o est� ca�ando!");
						return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) > 21){
					        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar a pris�o!");
							return 1;
						} else {
						    TrocarPrisao(PlayerName(plid),1);
						    LogarPlayer(plid);
						    AcrescentarExPoints(playerid,1);
							return 1;
						}
					}
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso");
			return 1;
		}
	}

	if(strcmp(cmd, "/venderpesca", true) == 0) {
	    new msg[256];
	    new quantia;
	    if(AreaCoopPesca[playerid] == 1){
	    	if(QtPescas[playerid] == 0){
	        	SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem nenhuma pesca, como poder� vender?");
	        	format(msg,sizeof(msg),"%s usou o comando /venderpesca sem nenhuma pesca acumulada.",udb_decode(PlayerName(playerid)));
	        	writelog(msg);
	        	return 1;
			} else {
		    	if(Profissao[playerid] == PESCADOR) {
		   			quantia = QtPescas[playerid]*130;
		   			GivePlayerMoney(playerid,quantia);
					format(msg,sizeof(msg),"Voc� vendeu %d pesca(s) por $130 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COLOR_GREEN, msg);
					format(msg,sizeof(msg),"%s vendeu %d pesca(s) na profiss�o de pescador e ganhou $%d.",udb_decode(PlayerName(playerid)),QtPescas[playerid],quantia);
					writelog(msg);
					QtPescas[playerid] = 0;
					AcrescentarExPoints(playerid,1);
					return 1;
				}
				else {
				    quantia = QtPescas[playerid]*100;
				    GivePlayerMoney(playerid,quantia);
				    format(msg,sizeof(msg),"Voc� vendeu %d pesca(s) por $100 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COLOR_GREEN, msg);
					format(msg,sizeof(msg),"%s vendeu %d pesca(s) sem ser pescador e ganhou $%d.",udb_decode(PlayerName(playerid)),QtPescas[playerid],quantia);
					writelog(msg);
					QtPescas[playerid] = 0;
					return 1;
				}
			}
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na Cooperativa de Pesca.");
			return 1;
		}
	}
	if(strcmp(cmd,"/vendercaca",true) == 0) {
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
					SendClientMessage(playerid,COLOR_CACADOR,msg);
					GivePlayerMoney(playerid,quantia);
					format(msg,sizeof(msg),"%s vendeu %d ca�a(s) e ganhou $%d.",udb_decode(PlayerName(playerid)),QtCacas[playerid],quantia);
					writelog(msg);
					QtCacas[playerid] = 0;
					AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso!");
			format(ftlog,sizeof(ftlog),"%s tentou usar o comando /vendercaca sem estar na profissao adequada.");
			writelog(ftlog);
			return 1;
		}
	}

	if(strcmp(cmd,"/descarregar",true) == 0){
	    new msg[256];
	    if(Profissao[playerid] == CAMINHONEIRO || IsPlayerAdmin(playerid)){
	        if(AreaDescarga[playerid] == 1){
	            if(Carregamento[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"Seu ve�culo n�o est� carregado!");
					return 1;
				} else {
				    Carregamento[playerid] = 0;
				    SendClientMessage(playerid,COLOR_GREEN,"Seu ve�culo foi descarregado.");
				    SendClientMessage(playerid,COLOR_GREEN,"Voc� ganhou $250 dolares pela carga.");
				    GivePlayerMoney(playerid,250);
				    AcrescentarExPoints(playerid,1);
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� na �rea de carga");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso!");
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
				    	SendClientMessage(playerid,COLOR_CAMINHONEIRO,"Ve�culo carregado!");
				    	SendClientMessage(playerid,COLOR_CAMINHONEIRO,"Para descarreg�-lo, v� a �rea de descarga, RS Haul (perto de um posto)");
				    	Carregamento[playerid] = 1;
						return 1;
					} else {
				        SendClientMessage(playerid,COLOR_CAMINHONEIRO,"Seu caminh�o j� est� carregado!");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um caminh�o ROADTRAIN!");
					return 1;
				}
	        } else {
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na �rea de carga!");
				return 1;
			}
	    }
	    else{
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
	    	return 1;
	    }
	}
	
	if(strcmp(cmd, "/carregarcaminhao", true) == 0) {
	    if(Profissao[playerid] == PEDREIRA || IsPlayerAdmin(playerid)){
	        if(PedreiraCarga[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == VEH_DUMPER){
				    if(Pedras[playerid] == 0){
				    	SendClientMessage(playerid,COLOR_PEDREIRA,"Ve�culo carregado!");
				    	SendClientMessage(playerid,COLOR_PEDREIRA,"Para descarreg�-lo, v� at� a obra de SF!");
				    	Pedras[playerid] = 1;
						return 1;
					} else {
				        SendClientMessage(playerid,COLOR_PEDREIRA,"Seu caminh�o j� est� carregado!");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um caminh�o DUMPER!");
					return 1;
				}
	        } else {
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na �rea de carregamento de carga!");
				return 1;
			}
	    }
	    else{
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
	    	return 1;
	    }
	}

	if(strcmp(cmd,"/descarregarcaminhao",true) == 0){
	    new msg[256];
	    if(Profissao[playerid] == PEDREIRA || IsPlayerAdmin(playerid)){
	        if(Construcao[playerid] == 1){
	            if(Pedras[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"Seu caminh�o n�o est� carregado!");
					return 1;
				} else {
				    Pedras[playerid] = 0;
				    SendClientMessage(playerid,COLOR_PEDREIRA,"Seu caminh�o foi descarregado.");
				    SendClientMessage(playerid,COLOR_PEDREIRA,"Voc� ganhou $300 dolares pelo frete");
				    GivePlayerMoney(playerid,300);
				    AcrescentarExPoints(playerid,1);
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� na �rea de carga");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso!");
	        format(msg,sizeof(msg),"%d usou o comando /descarregarcaminhao sem ser caminhoneiro.",udb_decode(PlayerName(playerid)));
	        writelog(msg);
			return 1;
		}
	}

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
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Doses de 1 � 7");
				return 1;
			}
		    if(!IsPlayerConnected(plid)){
		        SendClientMessage(playerid,COLOR_RED, "O jogador que voc� indicou n�o est� conectado.");
		    	return 1;
		    }
	        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
				SendClientMessage(playerid,COLOR_RED, "Chege mais perto para aplicar a inje��o.");
				return 1;
			}
        	if(Heroina[plid]+mili > 10){
        	  	SendClientMessage(playerid,COLOR_RED, "Voc� quer matar seu cliente!");
				return 1;
			}
	    	Heroina[plid] += mili;
	    	SendClientMessage(playerid,COLOR_TRAFICANTE, "Vendeu o bagulho!");
            AddPlayerHealth(plid,100);
	    	format(msg,sizeof(msg),"Voc� est� agora com %d ml de de hero�na no sangue.",mili*50);
	    	SendClientMessage(plid,COLOR_WHITE,msg);
	    	AcrescentarExPoints(playerid,1);
			return 1;
		} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
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
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� louco? Quer matar o seu cliente? Doses de 1 a 10");
				return 1;
			}
			if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Doses de 1 � 7");
				return 1;
			}
		    if(!IsPlayerConnected(plid)){
		        SendClientMessage(playerid,COLOR_RED, "O jogador que voc� indicou n�o est� conectado.");
		    	return 1;
		    }
	        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
				SendClientMessage(playerid,COLOR_RED, "Chege mais perto para vender o bagulho.");
				return 1;
			}
        	if(Maconha[plid]+mili > 10){
        	  	SendClientMessage(playerid,COLOR_RED, "Voc� quer matar seu cliente!");
				return 1;
			}
	    	Maconha[plid] += mili;
	    	SendClientMessage(playerid,COLOR_TRAFICANTE, "Miss�o cumprida!");
            AddPlayerHealth(plid,100);
	    	format(msg,sizeof(msg),"Seu pulm�o est� carregado com %d doses de maconha.",mili);
	    	SendClientMessage(plid,COLOR_WHITE,msg);
	    	AcrescentarExPoints(playerid,1);
			return 1;
		} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
		return 1;
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
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� louco? Quer matar o seu cliente? Doses de 1 a 7");
				return 1;
			}
			if(mili < 1){
			    SendClientMessage(playerid, COLOR_RED, "Doses de 1 � 7");
				return 1;
			}
		    if(!IsPlayerConnected(plid)){
		        SendClientMessage(playerid,COLOR_RED, "O jogador que voc� indicou n�o est� conectado.");
		    	return 1;
		    }
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
				SendClientMessage(playerid,COLOR_RED, "Chege mais perto para vender o bagulho.");
				return 1;
			}
	        if(Cocaina[plid]+mili > 10){
        	  	SendClientMessage(playerid,COLOR_RED, "Voc� quer matar seu cliente!");
				return 1;
			}
	    	Cocaina[plid] += mili;
	    	SendClientMessage(playerid,COLOR_TRAFICANTE, "Vendeu o bagulho!");
            AddPlayerHealth(plid,100);
	    	format(msg,sizeof(msg),"Seu pulm�o est� carregado com %d doses de coca�na.",mili);
	    	SendClientMessage(plid,COLOR_WHITE,msg);
	    	AcrescentarExPoints(playerid,1);
			return 1;
		} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
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
				SendClientMessage(playerid, COLOR_RED, "Quantidade inv�lida. Os valores devem ser de 1 � 100.");
				return 1;
			}
			if(IsPlayerConnected(plid)){
			if((Petrol[plid] + comb) < 100){
			    petroleo = Petrol[plid] + comb;
			    TrocarGas(PlayerName(plid), petroleo);
				Petrol[plid] = petroleo;
				format(msg,sizeof(msg),"Um admin colocou %d litros de combust�vel em seu tanque, totalizando %d litros",comb,petroleo);
				SendClientMessage(plid,COLOR_GREEN,msg);
				SendClientMessage(playerid,COLOR_GREEN,"Combust�vel fornecido.");
				format(msg,sizeof(msg),"O admin %s (ID %d) colocou %d litros de combust�vel no tanque de %s (ID %d),totalizando %d litros",udb_decode(PlayerName(playerid)),playerid,comb,udb_decode(PlayerName(plid)),plid,petroleo);
				writelog(msg);
				printf("O admin %s (ID %d) colocou %d litros de combust�vel no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
				return 1;
			}
			else if((Petrol[plid] + comb) >= 100){
			    TrocarGas(PlayerName(plid), 100);
				petroleo = 100 - Petrol[plid];
				Petrol[plid] = 100;
				format(msg,sizeof(msg),"Um admin completou seu tanque, colocando %d litros",petroleo);
				SendClientMessage(plid,COLOR_GREEN,msg);
				SendClientMessage(playerid,COLOR_GREEN,"Combustivel fornecido.");
				printf("O admin %s (ID %d) completou o combust�vel de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
				return 1;
			}
			return 1;
			}
			else SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado/logado.");
			return 1;
		}
		else{
		    new msg[256];
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o!");
		    printf("O jogador %s (ID %d) tentou modificar o combust�vel de algu�m, mas n�o possui permiss�o",PlayerName(playerid),playerid);
		    format(msg,sizeof(msg),"%s (ID %d) quis dar uma de admin (/setcomb), mas se deu mal!",udb_decode(PlayerName(playerid)),playerid);
		}
		return 1;
	}
	if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	if(Cadastrado(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "T� querendo se registrar duas vezes???");
			return 1;
		}
    	if(PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "T� querendo registrar-se logado???");
			return 1;
		}
    	if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Ei, voc� esqueceu de mencionar uma senha. Use /registrar [senha]");
			return 1;
		}
	    new senha[256],ip[17];
	    senha = md5(tmp);
	    PLAYERLIST_authed[playerid] = 1;
		CriarConta(PlayerName(playerid), senha /*senha*/, 0 /*wantedlvl*/, 0 /*passaporte*/, 3 /*creditos*/, 0 /*grana*/,26 /*skin*/, 5000 /*gbanco*/, 15/*gas*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 1 /*prof*/, "-1612.2537 785.3365 7.1875 318.1989" /*ppos*/,0/*porte*/,0/*phonenumb*/,0/*agenda*/,0 /*xl*/);
		new msg[256];
		GetPlayerIp(playerid,ip,17);
		format(msg,256,"NULL,'%s','%s'",PlayerName(playerid),ip);
		if(IPExists(PlayerName(playerid))) PRIV_sqlset("ips","ip",ip,PRIV_FWN(PlayerName(playerid)));
		else PRIV_sqlins("ips",msg);
		TrocarGas(PlayerName(playerid), 15);
		Petrol[playerid] = 0;
		Profissao[playerid] = 1;
		TextDrawHideForPlayer(playerid,Bemvindo);
		TextDrawHideForPlayer(playerid,Bemvindo2);
		TextDrawHideForPlayer(playerid,Bemvindo3);
		SetSpawnInfo(playerid, 1, PegarSkin(PlayerName(playerid)), -146.2662,1181.3722,19.7422, 0, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
		MissaoInicial(playerid);
		SendClientMessage(playerid, COLOR_JUIZ, "Registrado e logado.");
		SendClientMessage(playerid, COLOR_GREEN, "Voc� tem $5000 no banco, e acabou de chegar em San Fierro.");
     	SendClientMessage(playerid, COLOR_GREEN, "Procure um hotel para se hospedar. Voc� poder� ir ao banco");
    	SendClientMessage(playerid, COLOR_GREEN, "retirar o dinheiro. Para pegar um emprego, v� at� a ag�ncia de");
		SendClientMessage(playerid, COLOR_GREEN, "empregos.");
		return 1;
 	}

	if(!strcmp(cmd, "/desaparecertd", true)) {
		TextDrawHideForPlayer(playerid,Bemvindo);
		TextDrawHideForPlayer(playerid,Bemvindo2);
		TextDrawHideForPlayer(playerid,Bemvindo3);
		SendClientMessage(playerid,COLOR_GREEN,"Deve ter desaparecido. Se n�o funcionar, saia do servidor e entre novamente!");
		return 1;
	}

	if(strcmp(cmd, "/logar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    if(!Cadastrado(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Ei... VOC� AINDA N�O EST� REGISTRADO.");
			return 1;
		}
	    if(PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Voc� j� est� logado! N�o � necess�rio logar novamente.");
			return 1;
		}
	    if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Voc� tem senha. /logar [senha]");
			return 1;
		}
		new senha[256];
		new tmps[256];
		PegarSenha(PlayerName(playerid),senha);
		tmps = md5(tmp);
	    if (compare(senha,tmps)) {
	        new msg[256],ip[17];
			PLAYERLIST_authed[playerid] = 1;
			LogarPlayer(playerid);
			GetPlayerIp(playerid,ip,17);
			format(msg,256,"NULL,'%s','%s'",PlayerName(playerid),ip);
			if(IPExists(PlayerName(playerid))) PRIV_sqlset("ips","ip",ip,PRIV_FWN(PlayerName(playerid)));
			else PRIV_sqlins("ips",msg);
			CellCredits[playerid] = PegarCreditos(PlayerName(playerid));
			TextDrawHideForPlayer(playerid,Bemvindo);
			TextDrawHideForPlayer(playerid,Bemvindo2);
			TextDrawHideForPlayer(playerid,Bemvindo3);
			SendClientMessage(playerid,COLOR_GREEN,"Logado.");
			format(msg,sizeof(msg),"O jogador %s acabou de se logar.",udb_decode(PlayerName(playerid)));
			writelog(msg);
			printf("O jogador %s (ID %d) acabou de se logar",PlayerName(playerid),playerid);
			return 1;
		}
		else SendClientMessage(playerid, COLOR_RED, "Falha no login: senha incorreta");
		return 1;
	}

	if(strcmp(cmd, "/logarplayer", true) == 0){
		if(IsPlayerAdmin(playerid)){
			new tmp[256],plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			    LogarPlayer(playerid);
			    return 1;
			}
			plid = strval(tmp);
		    if(!IsPlayerConnected(plid)){
				SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/ID inv�lido");
				return 1;
			}
			LogarPlayer(plid);
			SendClientMessage(playerid,COLOR_GREEN,"Feito.");
			return 1;
		}
		else SendClientMessage(playerid, COLOR_RED, "Voc� n�o � admin, portanto, n�o tem permiss�o para fazer isso.");
		return 1;
	}


    if(strcmp(cmd, "/ajuda", true) == 0) {
    	SendClientMessage(playerid, COLOR_WHITE, "/comandos /comandos2 /comandos3 /comandos4 /comandos5: Comandos desse gamemode");
        SendClientMessage(playerid, COLOR_WHITE, "/registrar [senha] : Registrar-se");
        SendClientMessage(playerid, COLOR_WHITE, "/logar [senha] : Logar-se");
        SendClientMessage(playerid, COLOR_WHITE, "/aprender : Mostra uma breve explica��o sobre o RPG.");
        SendClientMessage(playerid, COLOR_WHITE, "ATEN��O: profiss�es s�o por experi�ncia, ter� que ir no -sine- para mais info /level.");
        SendClientMessage(playerid, COLOR_WHITE, "/profs /profs2 /profs3 /profs4 /profs5 v� as profiss�es deste RPG Mode");
        SendClientMessage(playerid, COLOR_WHITE, "Ajuda com o celular ? digite /celularinfo para mais informa��es.");
		SendClientMessage(playerid, COLOR_WHITE, "/creditos : V� os creditos do RPG Mode");
		return 1;
	}
    if(strcmp(cmd, "/celularinfo", true) == 0) {
       	SendClientMessage(playerid, COLOR_GRAY,   "O comando /PM [id] foi desabilitado dando origem a um novo recurso,");
        SendClientMessage(playerid, COLOR_YELLOW, "o celular, nele voc� faz liga��es e recebe-las para qualquer player com o custo de $1 o cr�dito");
        SendClientMessage(playerid, COLOR_YELLOW, "primeiramente ter� que comprar 1 celular com o comando /celular no valor de $500.");
        SendClientMessage(playerid, COLOR_GREEN,  "ATEN��O: apenas os players que tiverem celular poderam receber mensagens e envia-las");
        SendClientMessage(playerid, COLOR_GREEN,  "ATEN��O: para voc� ver o n�mero de outro player ter� que comprar um agenda com o comando:");
        SendClientMessage(playerid, COLOR_YELLOW, "/agenda no valor de $500, para saber o n�mero de um outro player digite /numero [id/partedonick] assim voc� ");
        SendClientMessage(playerid, COLOR_YELLOW, "poder� enviar mensagens pelo comando /sms [n�merodoplayer] [texto].");
        SendClientMessage(playerid, COLOR_WHITE,  "Coloque /celularinfo2 para mais info!");
        return 1;
	}
    if(strcmp(cmd, "/celularinfo2", true) == 0) {
        SendClientMessage(playerid, COLOR_JUIZ,   "ATEN��O: Para enviar mensagens voc� precisa de cr�ditos v� em uma loja 24/7 e compre");
        SendClientMessage(playerid, COLOR_JUIZ,   "cr�ditos pelo comando /recarga [creditos], para ver os creditos digite /cellcreditos, ESSE comando n�o precisa estar na 24/7");
        SendClientMessage(playerid, COLOR_JUIZ,   "Para ligar digite: /chamar [n�mero/do/jogador], � um chat restrito!");
        SendClientMessage(playerid, COLOR_JUIZ,   "Voc� tamb�m pode ligar a COBRAR /chamar9090 [n�mero/do/jogador]!");
        SendClientMessage(playerid, COLOR_JUIZ,   "para desligar digite /desligar");
  		SendClientMessage(playerid, COLOR_YELLOW, "Para qualquer d�vida contate um ADMIN e pergunte-o sobre o sistema");
  		return 1;
    }
    if(strcmp(cmd, "/level", true) == 0) {
    	SendClientMessage(playerid, COLOR_WHITE, "O Sistema de Level, tem como proveito deixar o servidor sem admins e aut�nomo junto com o /votarkick.");
        SendClientMessage(playerid, COLOR_WHITE, "Ao nascer, ficar� marcado um CheckPoint no seu radar, indicando a posi��o para onde deve ir atr�s de emprego.");
        SendClientMessage(playerid, COLOR_WHITE, "Chegando l�, voc� encontrar� profiss�es por sala. Logo ao entrar voc� se depar� com um CP de profs at� nivel 10. ");
        SendClientMessage(playerid, COLOR_WHITE, "Caso esteja disposto a ver outras profs. Existe 1 sala a direita da entrada, com profiss�es de nivel 20 at� 40.");
        SendClientMessage(playerid, COLOR_WHITE, "Caso esteja disposto a ver as outras profiss�es, a esqueda da entrada existe uma escadaria.");
		SendClientMessage(playerid, COLOR_WHITE, "Aonde voc� encontrar� as profiss�es de niveis superiores.");
		SendClientMessage(playerid, COLOR_WHITE, "Para ver seu level digita /verlevel");
		return 1;
	}
    if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_COP_SWAT, "FreeStyle RPG Beta 1 - MySQL");
	    SendClientMessage(playerid, COLOR_YELLOW, " ");
	    SendClientMessage(playerid, COLOR_RED2, "Mode especialmente desenvolvido para servidores MPA�");
	    SendClientMessage(playerid, COLOR_RED2, "Scripting: MPA Clan - Grupo Infernus de Programa��o");
	 	SendClientMessage(playerid, COLOR_JUIZ,   "Integrantes: [MPA]matraka, [MPA]Texugo, [MPA]Allan, [MPA]Smurf e [MPA]VanCy");
 	 	SendClientMessage(playerid, COLOR_YELLOW, "Colaborador: [MPA]kaxoro.");
		SendClientMessage(playerid, COLOR_WHITE, "Agradecimentos especiais: /agradecimentos");
		return 1;
	}
	if(!strcmp(cmd,"/agradecimentos",true)) {
	    SendClientMessage(playerid, COLOR_COP_SWAT, "Agradecimentos especiais:");
	    SendClientMessage(playerid, COLOR_YELLOW, " ");
	    SendClientMessage(playerid, COLOR_WHITE, "Agradecemos ao clan GT por ter iniciado a hist�ria do RPG brasileiro com profiss�es.");
	    SendClientMessage(playerid, COLOR_WHITE, "Sem ele, n�s ter�amos que jogar DM, corrida ou ainda no estilo The Godfather.");
	    SendClientMessage(playerid, COLOR_JUIZ,  "Agradecemos a alguns RPGs, como o Brazucas, por algumas id�ias usadas nesse gamemode.");
	    SendClientMessage(playerid, COLOR_AZULPLUS, "Agradecemos ao Adrenaline pelo plug-in de MySQL e � equipe que produz o MySQL.");
	    SendClientMessage(playerid, COLOR_YELLOW, "Agradecemos � equipe do SA:MP por nos trazer a possibilidade de jogar esse magn�fico jogo online.");
	    SendClientMessage(playerid, COLOR_RED2, "E principalmente, � Rockstar Games e subsidi�rias, por ter criado um jogo fant�stico como o GTA San Andreas!");
	    return 1;
	}
	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_GRAY,  "FreeStyle RPG Beta 1 - MySQL");
	    SendClientMessage(playerid, COLOR_WHITE, "Como diz o nome, esse gamemode � um RPG, que simula a vida real.");
	    SendClientMessage(playerid, COLOR_WHITE, "Aqui voc� poder� trabalhar e receber seu sal�rio. Com seu sal�rio, poder�.");
	    SendClientMessage(playerid, COLOR_WHITE, "comprar propriedades, casas e carros. Na vida real existem crimes, aqui tamb�m.");
		SendClientMessage(playerid, COLOR_WHITE, "Se voc� cometer crimes, vai pagar. Se dirigir sem habilita��o, poder� pegar multa.");
		SendClientMessage(playerid, COLOR_WHITE, "H� tr�s tipo de habilita��es: terrestre, nautica e aerea. � necess�ria a compra de");
		SendClientMessage(playerid, COLOR_WHITE, "combust�vel para poder andar com os ve�culos do gamemode.");
		SendClientMessage(playerid, COLOR_WHITE, "Espero que divirta-se com nosso gamemode. S�o os votos do clan MPA - Grupo Infernus!");
		SendClientMessage(playerid, COLOR_MOTORISTA, "Comandos??? /ajuda ou /comandos /comandos2 /comandos3 /comandos4 /comandos5.");
		return 1;
	}
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_MOTORISTA, 	"Comandos do FreeStyle RPG - Parte I");
		SendClientMessage(playerid, COLOR_RED2, 		"/profs  /profs2 /profs3 /profs4 /profs5 : mostra as profiss�es do RPG.");
		SendClientMessage(playerid, COLOR_MECANICO,     "/level : ver como funciona o sistema de level.");
		SendClientMessage(playerid, COLOR_COP_SWAT, 	"/190 [denuncia] : Faz uma denuncia � policia.");
		SendClientMessage(playerid, COLOR_EMERGENCIA, 	"/192 : Chama uma ambul�ncia ao local");
		SendClientMessage(playerid, COLOR_RED, 			"/trancar : Tranca seu carro. | /destrancar : Destranca seu carro.");
		SendClientMessage(playerid, COLOR_SEGURANCA, 	"/procurados : V� a lista de procurados pela policia | /presos : V� aa lista de presos.");
		SendClientMessage(playerid, COLOR_GREEN, 		"/say [texto] : Manda mensagem para pessoas proximas a voc�.");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/comandos2 ver a segunda lista de comandos");
		return 1;
	}
    if(strcmp(cmd, "/comandos2", true) == 0) {
        SendClientMessage(playerid, COLOR_MOTORISTA, 	"Comandos do FreeStyle RPG - Parte II");
       	SendClientMessage(playerid, COLOR_ASSALTANTE,   "/banco : ver os comandos dos Bancos");
		SendClientMessage(playerid, COLOR_COP_MILITAR, 	"/abastecer [litros] : Abastecer (voc� deve estar no posto para usar este comando).");
        SendClientMessage(playerid, COLOR_WHITE, 		"/pagar[id][quantidade] :Pagar corretor ou vendedor de carros.| /motorista: solicitar um motorista particular");
        SendClientMessage(playerid, COLOR_ADVOGADO, 	"/advogado: solicitar um advogado | /defesa [id] [valor ex:500k] : para pagar advogado por defende-lo .");
        SendClientMessage(playerid, COLOR_COP_SWAT,     "/ci [IDdoCOP] : mostra os documentos para o pol�cial.");
        SendClientMessage(playerid, COLOR_PALHA,        "REVO-SENA : /revosena [num1] [num2] [num3] - ATEN��O: Os n�meros v�o de 1 a 60!");
        SendClientMessage(playerid, COLOR_PALHA,       	"REVO-SENA : /revosena-surpresinha : gera os n�meros automaticamente sem precisar escolher.");
        SendClientMessage(playerid, COLOR_YELLOW,       "/comandos3 ver a terceira lista de comandos");
        return 1;
    }
    if(strcmp(cmd, "/comandos3", true) == 0) {
        SendClientMessage(playerid, COLOR_MOTORISTA, 		"Comandos do FreeStyle RPG - Parte III");
        SendClientMessage(playerid, COLOR_YELLOW, 			"/taxi : Chama um taxi. | /taxiaero : chama um taxi-avi�o");
        SendClientMessage(playerid, COLOR_SEGURANCA,		"/telepizza [local] : pede ao pizzaboy uma pizza.");
        SendClientMessage(playerid, COLOR_RED2, 			"/veiculos ver os carros que podem ser comprados e os pre�os do MPA REV. RPG.");
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,"/pedirarma [arma/ou/nomeparecido], pede uma arma ao vendedor de armas.");
        SendClientMessage(playerid, COLOR_PALHA,			"/acoes : ver as ac��es do jogo!");
      	SendClientMessage(playerid, COLOR_WHITE,			"/votarkick [id] : insatisfeito com um jogador ?");
        SendClientMessage(playerid, COLOR_UNLOGGED,     	"/profissao : ver os comandos de sua profiss�o.");
        SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos4 ver a terceira lista de comandos");
        return 1;
	}
	if(strcmp(cmd, "/comandos4", true) == 0) {
	    SendClientMessage(playerid, COLOR_MOTORISTA, 		"Comandos do FreeStyle RPG - Parte IV");
	    SendClientMessage(playerid, COLOR_ADVOGADO,			"/armas : ver os pre�os das armas do MPA.");
        SendClientMessage(playerid, COLOR_JUIZ,				"/soltarpreso [id] : Voc� matou um JUIZ/SHERIFF, ganhou a chave da cadeia pode libertar 1 preso!");
        SendClientMessage(playerid, COLOR_MECANICO,			"/mecanico : Chama um Mecanico para onde voc� est�!");
        SendClientMessage(playerid, COLOR_AZULPLUS,         "/portedearmas : ver o porte de arma do server.");
        SendClientMessage(playerid, COLOR_VERDECLARO,       "/meuskin : troca o skin automaticamente.");
        SendClientMessage(playerid, COLOR_GREEN, 			"/horas : Mostra o hor�rio em SA.");
        SendClientMessage(playerid, COLOR_INSTRUTOR,        "/carteiras : ver o valor das habilita��es.");
        SendClientMessage(playerid, COLOR_YELLOW,      	 	"/comandos5 ver a terceira lista de comandos");
        return 1;
    }
    if(strcmp(cmd, "/comandos5", true) == 0) {
     	SendClientMessage(playerid, COLOR_MOTORISTA, 		"Comandos do MPA� FreeStyle RPG - Parte V");
        SendClientMessage(playerid, COLOR_VERDE_AQUA,       "/novidades , /novidades2 , /revolution , /revolution2 , /revolution3 : para ver as novidades.");
        SendClientMessage(playerid, COLOR_GREEN,            "/verlevel : ver o seu level para subir de profiss�o");
        return 1;
    }
    if(strcmp(cmd, "/novidades", true) == 0) {
		SendClientMessage(playerid, COLOR_MECANICO,			"Novidades FreeStyle RPG - Parte I");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Nosso mode vem equipado de 40 profiss�es para saber como funciona basta digitar /level.");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Sistema de skins autom�tica /meuskin [id/da/skin]");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Que tal apostar uma graninha e concorrer a $200.000 ? V� em uma loja 24/7 e se informe!");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Est� querendo ver os ve�culos e os pre�os do server? /ve�culos e veja os ve�culos dispon�veis.");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	    "Est� querendo fazer algo il�cito e precisa de armas? Veja nossas armas em /armas e /armas2.");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Logo em seguida digite /pedirarma [arma/ou/nomeparecido]");
		SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "/novidades 2 Para ver a lista das NovidadeS MPA� RevolutioN RPG - Parte II");
		return 1;
	}
   	if(strcmp(cmd, "/novidades2", true) == 0) {
   		SendClientMessage(playerid, COLOR_MECANICO,			"NovidadeS FreeStyle RPG - Parte II");
   	    SendClientMessage(playerid, COLOR_AZULPLUS,         "Quer ver as a��es dispon�veis no jogo ? /acoes");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Insatisfeito com algum jogador? Inicie uma vota��o /votarkick [id/do/jogador].");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Mate o Juiz/Sheriff e ganhe a chave da cadeia /soltarpreso");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Seu carro est� prestes a explodir? Chame um reboque /mecanico");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "Quer ver seu porte de armas? /portedearmas");
		SendClientMessage(playerid, COLOR_AZULPLUS,         "V� na concecion�ria de San Fierro e veja os carros para loca��o!");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,  "Digite /revolution e veja porque o RevolutioN � o RevolutioN!");
        return 1;
    }
   	if(strcmp(cmd, "/revolution", true) == 0) {
   	    SendClientMessage(playerid, COLOR_AZULPLUS, 		"Aqui est�o as novidades que fazem do FreeStyle/RevolutioN a verdadeira revolu��o!");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Cansado de esperar dar gmx para aparecer seu carro? No revolution");
   	    SendClientMessage(playerid, COLOR_WHITE,             "n�o precisa de gmx para aparecer.");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Comprava 1 casa e n�o sabia se morava outra pessoa ali, agora no revolution");
   	    SendClientMessage(playerid, COLOR_WHITE,             "Sua casa ganha 1 �cone informando que ali j� mora gente.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora voc� tem seu carro! Comprando o carro do vendedor voc� pode ativar o alarme");
	    SendClientMessage(playerid, COLOR_WHITE,             "e quando sentir falta dele avise a pol�cia que ligar� o radar e achar� seu carro");
   	    SendClientMessage(playerid, COLOR_WHITE,             "aonde estiver");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "Digite /revolution2 e veja porque o RevolutioN � o RevolutioN!");
        return 1;
    }
	if(strcmp(cmd, "/revolution2", true) == 0) {
        SendClientMessage(playerid, COLOR_AZULPLUS, 		"Aqui est�o as novidades que fazem do FreeStyle/RevolutioN a verdadeira revolu��o!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora os carros n�o d�o mais respawn, para reaver 1 carro chame um reboque.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Celular com: /celular /sms /agenda /numero /chamar /atender /desligar /espera");
	    SendClientMessage(playerid, COLOR_WHITE,             "Agora todos os carros vem com g�s! Ao iniciar o mode todos tem 100lts");
        SendClientMessage(playerid, COLOR_WHITE,             "Quando fechar o mode os litros deixados nos carros ser�o salvos!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Sem grana para 1 casa? Fique hospedado no Hotel /hotelinfo");
	    SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "Digite /revolution3 e veja porque o RevolutioN � o RevolutioN!");
	    return 1;
	}
	if(strcmp(cmd, "/revolution3", true) == 0) {
        SendClientMessage(playerid, COLOR_AZULPLUS, 		"Aqui est�o as novidades que fazem do RevolutioN a verdadeira revolu��o!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Todas as profs vem com mais de 2 comandos! Exato at� assassino!");
	    SendClientMessage(playerid, COLOR_WHITE,             "Em toda San Andreas h� radares fixos multando quem andar acima da velocidade.");
	    SendClientMessage(playerid, COLOR_WHITE,             "Previs�o do tempo altera o plantio se chover a colheita sai mais r�pido.");
	    SendClientMessage(playerid, COLOR_RED2,              "Tuning, voc� pode tunar seu veiculo e salv�-lo. Basta ser o dono.");
	    SendClientMessage(playerid, COLOR_RED2,              "V� a uma oficina aplique os componentes desejados! E pronto est� salvo!");
		return 1;
	}
    if(strcmp(cmd, "/armas", true) == 0) {
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,	"Lista de Armas - FreeStyle RPG - Parte I");
        SendClientMessage(playerid, COLOR_MECANICO,				"Descri��o: ID - Nome da Arma - Valor");
        SendClientMessage(playerid, COLOR_WHITE,				"1 - Soco Ingl�s - $500 | 2 - Taco de Golfe - $600 	  | 3 - Cacetete - $650");
        SendClientMessage(playerid, COLOR_WHITE,				"4 - Faca - $750 		| 5 - Taco de Baseball - $350 | 6 - Shovel - $400");
		SendClientMessage(playerid, COLOR_WHITE,				"7 - Taco de Sinuca - $300 | 8 - Katana - $800 | 9 - Motoserra - $1000");
		SendClientMessage(playerid, COLOR_WHITE,				"10 - Vibrador roxo - $100 | 11 - Vibrador branco grande - $100 | 12 - Vibrador branco m�dio - $100");
		SendClientMessage(playerid, COLOR_WHITE,				"13 - Vibrador prata pequeno - $100 | 14 - Flores - $100 | 15 - Bengala - $150 | 16 - Granada - $300");
        SendClientMessage(playerid, COLOR_WHITE,				"17 - Gas - $300 | 22 - Pistola - $600 | 23 - Pistola com Silenciador - $1000");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,		"/armas2 - Lista II do MPA� RevolutioN RPG");
        return 1;
    }
    if(strcmp(cmd, "/armas2", true) == 0) {
        SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,	"Lista de Armas - FreeStyle RPG - Parte II");
        SendClientMessage(playerid, COLOR_MECANICO,				"Descri��o: ID - Nome da Arma - Valor");
		SendClientMessage(playerid, COLOR_WHITE,				"24 - Desert Eagle - $3000 | 25 - Escopeta Calibre 12 - $1800 | 26 - Escopeta de Cano Serrado - $6000");
		SendClientMessage(playerid, COLOR_WHITE,				"27 - Escopeta de Combate - $7500 | 28 - Micro Uzi - $8000 | 29 - MP5 - $5500");
        SendClientMessage(playerid, COLOR_WHITE,				"30 - AK47 - $7500 | 31 - M4 - $9000 | 32 - Tec9 - $8000 | 33 - Country Rifle - 4000");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO,       "Fim da Lista das ARMAS do MPA� RevolutioN RPG.");
        return 1;
	}
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Comandos do Banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/extrato : checa seu o saldo banc�rio./trasnferir [id]: transfere � uma conta");
        SendClientMessage(playerid, COLOR_YELLOW, "/cell : checa seu o saldo banc�rio atrav�s do seu celular, custo $5.");
        SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esses comandos, menos o /cell.");
        SendClientMessage(playerid, COLOR_YELLOW, "Bancos: em todas cidades, consulte o mapa no site.");
		return 1;
	}
    if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_UNLOGGED,			"Lista de profiss�es FreeStyle RPG");
        SendClientMessage(playerid, COLOR_DESEMPREGADO,		"1 - Desempregado (Sal�rio: $350)");
        SendClientMessage(playerid, COLOR_BARMAN, 			"2 - Barman (Sal�rio: $900 + as bebidas que vende)");
    	SendClientMessage(playerid, COLOR_ASSASSINO, 		"3 - Assassino (ganha o que roubar da v�tima)");
        SendClientMessage(playerid, COLOR_UNLOGGED,   		"4 - Vendedor de carros (Sal�rio: $350 + comiss�o) PROFISS�O LIMITADA");
		SendClientMessage(playerid, COLOR_CORRETOR, 		"5 - Corretor de imoveis Sal�rio: $350 + comiss�o)");
	    SendClientMessage(playerid, COLOR_SEGURANCA,		"6 - Seguran�a (Sal�rio: $2000 + o que o patr�o pagar)");
        SendClientMessage(playerid, COLOR_MOTORISTA,		"7 - Motorista Particular (Sal�rio: $2000 + o que o patr�o pagar)");
    	SendClientMessage(playerid, COLOR_MOTORISTA_DE_ONIBUS,	"8 - Motorista de �nibus (Sal�rio: $2000)");
    	SendClientMessage(playerid, COLOR_UNLOGGED,     	"Para mais profiss�es, digite /profs2");
    	return 1;
    }
    if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COLOR_UNLOGGED,     	"Lista de profiss�es FreeStyle RPG - Parte II");
		SendClientMessage(playerid, COLOR_CAMINHONEIRO,		"9  - Caminhoneiro (Sal�rio: $1500 + o frete pelas cargas)");
    	SendClientMessage(playerid, COLOR_CACADOR, 			"10 - Ca�ador (Sal�rio: $1000 + o ca�as que vender)");
        SendClientMessage(playerid, COLOR_PESCADOR, 		"11 - Pescador (Sal�rio: $1500 + o que ganha na pesca)");
	    SendClientMessage(playerid, COLOR_ENTREGADOR_PIZZA, "12 - Entregador de pizza (Sal�rio: $900 + o que o vender)");
        SendClientMessage(playerid, COLOR_TAXISTA, 			"13 - Taxista (Sal�rio: $2000)");
	    SendClientMessage(playerid, COLOR_MOTOTAXI, 		"14 - Mototaxista (Sal�rio: $1000)");
        SendClientMessage(playerid, COLOR_TAXI_AEREO, 		"15 - Aerotaxista (Sal�rio: $1500)");
        SendClientMessage(playerid, COLOR_INSTRUTOR, 		"16 - Instrutor de dire��o (Sal�rio: $350 + comiss�o)");
        SendClientMessage(playerid, COLOR_UNLOGGED,		    "Para mais profiss�es, digite /profs3");
		return 1;
	}
	if(strcmp(cmd, "/profs3", true) == 0) {
		SendClientMessage(playerid, COLOR_UNLOGGED,  		"Lista de profiss�es FreeStyle RPG - Parte III");
        SendClientMessage(playerid, COLOR_TRAFICANTE, 		"17 - Traficante(Sal�rio: $1200 + o que o vender)");
    	SendClientMessage(playerid, COLOR_JORNALISTA, 		"18 - Jornalista Sal�rio: $1000)");
        SendClientMessage(playerid, COLOR_PARAMEDICO, 		"19 - Param�dico(Sal�rio: $1000 + mais pagamento do plant�o)");
        SendClientMessage(playerid, COLOR_ADVOGADO,   		"20 - Advogado (Sal�rio: $1000 + honorarios)");
	    SendClientMessage(playerid, COLOR_COP_MILITAR,  	"21 - Pol�cia militar (Sal�rio: $1200) PROFISSAO LIMITADA");
		SendClientMessage(playerid, COLOR_COP_RODOVIARIO,   "22 - Pol�cia rodovi�ria (Sal�rio: $1400) PROFISSAO LIMITADA");
        SendClientMessage(playerid, COLOR_COP_FLORESTAL,    "23 - Pol�cia florestal (Sal�rio: $1800) PROFISSAO LIMITADA");
		SendClientMessage(playerid, COLOR_COP_SWAT,  		"24 - Pol�cia Swat(Sal�rio: $2000) PROFISSAO LIMITADA");
		SendClientMessage(playerid, COLOR_UNLOGGED,         "Para mais profiss�es, digite /profs4");
		return 1;
	}
	if(strcmp(cmd, "/profs4", true)==0){
	    SendClientMessage(playerid, COLOR_UNLOGGED,  	    "Lista de profiss�es FreeStyle RPG - Parte IV");
        SendClientMessage(playerid, COLOR_COP_NARCOTICOS,   "25 - Pol�cia Narc�ticos(Sal�rio: $2000) PROFISSAO LIMITADA");
        SendClientMessage(playerid, COLOR_JUIZ,   			"26 - Juiz(Sal�rio: $3000) PROFISSAO LIMITADA");
     	SendClientMessage(playerid, COLOR_SHERIFF,   		"27 - Xerife (Sal�rio: $4500) PROFISSAO LIMITADA");
     	SendClientMessage(playerid, COLOR_LIXEIRO,   		"28 - Lixeiro(Sal�rio: $1000) + o que coletar");
     	SendClientMessage(playerid, COLOR_TRANSPORTE_DE_VALORES,   "29 - Transporte de Valores(Sal�rio: $800 + o que depositar)");
     	SendClientMessage(playerid, COLOR_CONTRABANDISTA,   "30 - Contrabandista(Sal�rio: $800 + contrabando)");
     	SendClientMessage(playerid, COLOR_RECEITA_FEDERAL,  "31 - Receita Federal(Sal�rio: $3000) PROFISSAO LIMITADA");
     	SendClientMessage(playerid, COLOR_AGRICULTOR,   	"32 - Agricultor(Sal�rio: $1200 + o que plantar)");
     	SendClientMessage(playerid, COLOR_UNLOGGED, 	    "Para mais profiss�es, digite /profs5");
		return 1;
	}
	if(strcmp(cmd, "/profs5", true)==0){
	    SendClientMessage(playerid, COLOR_UNLOGGED,   		"Lista de profiss�es FreeStyle RPG - Parte V");
	    SendClientMessage(playerid, COLOR_LADRAO_DE_CARROS, "33 -Ladr�o de Carros(Sal�rio: $1000 + carros que roubar)");
     	SendClientMessage(playerid, COLOR_ASSALTANTE,   	"34 - Assaltante(Sal�rio: $600 + o que assaltar e roubar)");
     	SendClientMessage(playerid, COLOR_LOCADOR_DE_CARROS,"36 - Locador de Carros(Sal�rio: $1000 + os carros que locar)");
     	SendClientMessage(playerid, COLOR_PEDREIRA,   		"37 - Carregador da Pedreira(Sal�rio: $1500 + o que descarregar na obra.)");
     	SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS,"38 - Vendedor de Armas(Sal�rio: $1400 + as 10 por cento das armas que vender.)");
     	SendClientMessage(playerid, COLOR_MECANICO,         "39 - Mec�nico(Sal�rio: $1000 + os consertos)");
       	SendClientMessage(playerid, COLOR_ROSA, 	  		"40 - Prostituta(Sal�rio: $800 + transas e strips)");
       	SendClientMessage(playerid, COLOR_COP_MILITAR, 	  	"_*_*_*_*_*_*_*_*_*_*_*_*_*_*BOM JOGO_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*");
	   	return 1;
     }
	if(strcmp(cmd, "/regras1", true) == 0) {
	    SendClientMessage(playerid, COLOR_RED2, "REGRAS - para jogadores e administradores.");
        SendClientMessage(playerid, COLOR_JUIZ,	"  1� N�o � permitido o uso de cheats, trapa�as, para jogadores INCLUSIVE ADMs.");
        SendClientMessage(playerid, COLOR_JUIZ, "  2� Nenhum jogador pode se apossar de algum ve�culo sem ter pago pelo mesmo.");
        SendClientMessage(playerid, COLOR_JUIZ, "  3� � necess�ria habilita��o para dirigir, e a compra de carros � poss�vel somente");
        SendClientMessage(playerid, COLOR_JUIZ, "  se o jogador tiver uma casa.");
    	SendClientMessage(playerid, COLOR_JUIZ, "  4� Nenhum jogador pode possuir mais de 4 ve�culos, afim de n�o pesar o mode.");
        SendClientMessage(playerid, COLOR_JUIZ, "  No total o mode suporta apenas 70 tipos diferentes de ve�culos. ");
        SendClientMessage(playerid, COLOR_JUIZ, "  5� Valores de casas: 5k 10k 20k 40k 60k 80k 100k e 200k.");
        SendClientMessage(playerid, COLOR_JUIZ, "  6� Valores dos carros: vide tabela padr�o.");
		return 1;
	}
	if(strcmp(cmd, "/regras2", true) == 0) {
	    SendClientMessage(playerid, COLOR_JUIZ, "  7� Profiss�es elitizadas ser�o setadas como promo��o, NENHUM jogadoras receber� sem provar");
        SendClientMessage(playerid, COLOR_JUIZ, "  a compet�ncia na profiss�o concedida: isto inclui: todas profiss�es policiais");
        SendClientMessage(playerid, COLOR_JUIZ, "  8� Deve-se respeitar a l�gica do RPG, n�o � permitido um num�ro desequilibrado de profiss�es.");
        SendClientMessage(playerid, COLOR_JUIZ, "  9� A n�o obedi�ncia destas regras dispostas implicar� desde advert�ncia � exclus�o permanente do servidor. ");
        SendClientMessage(playerid, COLOR_JUIZ, "  10� Skin para: Policiais, Advogados, Xerife e Juiz sao predeterminadas, altera��es somente para: Cop 280 � 285.Demais: 147,164,166,37. ");
		SendClientMessage(playerid, COLOR_JUIZ, "  11� Nenhum jogador poder� setar a casa de outro no ar, isso poder� acarretar na perca do emprego e at� mesmo em banimento do servidor.");
		SendClientMessage(playerid, COLOR_WHITE,  "  A finalidade das regras s�o afim de garantir organiza��o, e claro, divers�o no mode MPA� RevolutioN RPG.");
		return 1;
	}
	if(strcmp(cmd, "/acoes", true) == 0) {
	    SendClientMessage(playerid, COLOR_WHITE, "/dodge  | /render | /bebado | /cover | /crack");
        SendClientMessage(playerid, COLOR_WHITE, "/plantarbomba  | /beijar | /fumar  |/fumar2 | /gunarrest");
        SendClientMessage(playerid, COLOR_WHITE, "/sentar | /fu  | /punheta | /esconder-se | /aparecer | /mijar ");
		return 1;
	}
	if(strcmp(cmd, "/hotelinfo", true) == 0) {
    	SendClientMessage(playerid, COLOR_VERDE_AQUA, "O hotel serve como moradia tempor�ria. Para ficar hospedado digite /hotel");
        SendClientMessage(playerid, COLOR_VERDE_AQUA, "O custo da hospedagem � $1500 dolares, poder� ficar hospedado at� ter");
        SendClientMessage(playerid, COLOR_VERDE_AQUA, "condi��es financeiras para poder comprar primeiramente 1 casa e logo em seguida 1 carro");
        return 1;
    }
    if(strcmp(cmd, "/veiculos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Ve�culos do FreeStyle RPG -  escolha um estilo de carro");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/sedans     -    /aereos");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/4portas    -    /barcos");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/muscle     -    /lowriders");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/esportivos -    /recreacionais");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/corrida    -    /motos");
		SendClientMessage(playerid, COLOR_GREEN, 		"/pesados");
		return 1;
	}
    if(strcmp(cmd, "/sedans", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Sedans do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
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
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"A�reos do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/519 - Shamal 1545000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/487 - Maverick 845000");
		SendClientMessage(playerid, COLOR_ORANGE, 		"/593 - Dodo 845000");
		return 1;
	}
    if(strcmp(cmd, "/4portas", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"4 Portas do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/409 - Stretch 80000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/445 - Admiral 35000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/405 - Sentinel 35000");
		return 1;
	}
    if(strcmp(cmd, "/barcos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Barcos do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Barco  -  Pre�o");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/493 - Jetmax 608000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/453 - Reefer 180000");
		SendClientMessage(playerid, COLOR_YELLOW, 		"/473 - Dinghy 50000");
		return 1;
	}
    if(strcmp(cmd, "/muscle", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Muscles do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/402 - Buffalo 95000");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/603 - Phoenix 75000");
		SendClientMessage(playerid, COLOR_PURPLE, 		"/475 - Sabre 19000");
		return 1;
	}
	if(strcmp(cmd, "/esportivos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Esportivos do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/560 - Sultan  105000");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/559 - Jester  85000");
		SendClientMessage(playerid, COLOR_INSTRUTOR, 	"/529 - Banshee 50000");
		return 1;
	}
	if(strcmp(cmd, "/corrida", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Carros Esportivos e de Corrrida do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/411 - Infernus 450000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/451 - Turismo 350000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/541 - Bullet 300000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/415 - Cheetah 255000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/480 - Comet 160000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/434 - Hotknife 120000");
		return 1;
	}
   	if(strcmp(cmd, "/recreacionais", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Ve�culos Recreacionais do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/444 - Monster 115000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/424 - BF Injection 15000");
		SendClientMessage(playerid, COLOR_AZULPLUS, 	"/471 - Quad 9000");
		return 1;
	}
	if(strcmp(cmd, "/pesados", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Ve�culos Pesados do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_GREEN, 		"/444 - Monster 115000");
		SendClientMessage(playerid, COLOR_GREEN, 		"/515 - RoadTrain 67000");
		SendClientMessage(playerid, COLOR_GREEN, 		"/400 - Landstalker 30000");
		return 1;
	}
	if(strcmp(cmd, "/lowriders", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Low Riders do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
		SendClientMessage(playerid, COLOR_WHITE, 		"/535 - Slamvan 25000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/536 - Blade 20000");
		SendClientMessage(playerid, COLOR_WHITE, 		"/534 - Remington 20000");
		return 1;
	}
	if(strcmp(cmd, "/motos", true) == 0) {
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"Motos do FreeStyle RPG");
		SendClientMessage(playerid, COLOR_VERDECLARO, 	"ID   -  Nome do Carro  -  Pre�o");
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
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "Na�tica - $1200");
	    SendClientMessage(playerid, COLOR_INSTRUTOR,   "A�rea - $2000");
	    return 1;
	}
	
	if(strcmp(cmd,"/coletarlixo",true)==0){
	    if(Profissao[playerid] == LIXEIRO || IsPlayerAdmin(playerid)){
	        if(MissaoLixeiro[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"Voc� j� est� na miss�o de cole��o de lixo!");
				return 1;
			}
			else {
				SendClientMessage(playerid,COLOR_RED,"A sua miss�o agora �:");
				SendClientMessage(playerid,COLOR_RED2,"Colete os res�duos de 10 lixeiras e em seguida,");
				SendClientMessage(playerid,COLOR_RED2,"transporte o caminh�o at� o lix�o e deposite o lixo l�");
				SendClientMessage(playerid,COLOR_RED2,"com o comando /lixao.");
				MissaoLixeiro[playerid] = 1;
				new randtrash = random(73);
				CPS_SetStreamActiveForPlayer(playerid,false);
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
				SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� na miss�o de cole��o de lixo!");
				return 1;
			} else {
			    if(LixoColetado[playerid] < 10){
			        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem lixo suficiente para descarregar.");
			        return 1;
				} else {
					if(AreaLixao[playerid] == 0){
					    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um lix�o!");
					    return 1;
					} else {
						if(GetVehicleModel(GetPlayerVehicleID(playerid)) != VEH_LIXEIRO){
						    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um caminh�o Trashmaster!");
						    return 1;
						} else {
						    MissaoLixeiro[playerid] = 0;
						    LixoColetado[playerid] = 0;
						    SendClientMessage(playerid,COLOR_RED2,"Miss�o cumprida!");
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
	
	if(!strcmp(cmd, "/chamar",true)){
	    new tmp[256],cellowner[256],str[256];
	    tmp = strtok(cmdtext,idx);
	    if(PegarPhone(PlayerName(playerid))==0){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem celular!");
	        return 1;
		}
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Uso correto: /chamar [n�mero-do-celular]");
		    return 1;
		}
		new tmp2[256];
		format(tmp2,256,"phonenumb = %s",tmp);
		cellowner = PRIV_sqlget("players","nickname",tmp2);
		if(!CellExists(strval(tmp))){
		    SendClientMessage(playerid,COLOR_RED,"N�mero de celular inexistente.");
		    return 1;
		}
		if(!IsStringAName(cellowner)){
		    SendClientMessage(playerid,COLOR_RED,"O propriet�rio desse celular n�o est� conectado!");
		    return 1;
		}
		if(CellCredits[playerid] == 0){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem cr�ditos suficientes para originar uma chamada. M�nimo: 2");
		    return 1;
		}
		new calledid = GetPlayerID(cellowner);
		if(EmLigacao[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"Voc� j� est� em uma liga��o!");
			return 1;
		}
		if(EmLigacao[calledid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"O jogador j� est� em uma liga��o!");
		    return 1;
		}
		SendClientMessage(playerid,COLOR_YELLOW,"Chamando...");
		SendClientMessage(calledid,COLOR_RED2,"Seu celular est� tocando! Para atend�-lo, digite /atender. Caso contr�rio, digite /recusarchamada.");
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
	    if(PegarPhone(PlayerName(playerid))==0){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem celular!");
	        return 1;
		}
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"Uso correto: /chamar9090 [n�mero-do-celular]");
		    return 1;
		}
		new tmp2[256];
		format(tmp2,256,"phonenumb = %s",tmp);
		cellowner = PRIV_sqlget("players","nickname",tmp2);
		if(!strlen(cellowner)){
		    SendClientMessage(playerid,COLOR_RED,"N�mero de celular inexistente.");
		    return 1;
		}
		if(!IsStringAName(cellowner)){
		    SendClientMessage(playerid,COLOR_RED,"O propriet�rio desse celular n�o est� conectado!");
		    return 1;
		}
		if(CellCredits[calledid] == 0){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem cr�ditos suficientes para originar uma chamada. M�nimo: 2");
		    return 1;
		}
		if(EmLigacao[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"Voc� j� est� em uma liga��o!");
			return 1;
		}
		if(EmLigacao[calledid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"O jogador j� est� em uma liga��o!");
		    return 1;
		}
		SendClientMessage(playerid,COLOR_YELLOW,"Chamando...");
		SendClientMessage(calledid,COLOR_RED2,"Liga��o a cobrar! Para atend�-la, digite /atendercobrar. Caso contr�rio, digite /recusarchamada.");
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
	        SendClientMessage(playerid,COLOR_RED,"Ningu�m est� lhe chamando!");
	        return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"Pronto!");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SendClientMessage(CalledID[playerid],COLOR_RED,"Quem voc� chamava aceitou sua liga��o! Pode conversar!");
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
	        SendClientMessage(playerid,COLOR_RED,"Ningu�m est� lhe chamando!");
	        return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"Pronto!");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SendClientMessage(CalledID[playerid],COLOR_RED,"Quem voc� chamava aceitou sua liga��o! Pode conversar!");
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
	        SendClientMessage(playerid,COLOR_RED,"Ningu�m est� lhe chamando!");
			return 1;
		}
		SendClientMessage(playerid,COLOR_YELLOW,"Chamada cancelada!");
		SendClientMessage(CalledID[playerid],COLOR_RED,"Seu pedido de liga��o foi recusado!");
		SetPlayerSpecialAction(CalledID[playerid],SPECIAL_ACTION_STOPUSECELLPHONE);
		Chamando[playerid]=0;
		Chamando[CalledID[playerid]]=0;
		return 1;
	}
	if(!strcmp(cmd,"/desligar",true)){
	    if(EmLigacao[playerid] == 0){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em uma liga��o!");
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
		if(PegarPhone(PlayerName(playerid)) == 0){
			SendClientMessage(playerid, COLOR_YELLOW, "Voc� n�o tem celular!");
			return 1;
		}
		if(!strlen(tmp)){
			SendClientMessage(playerid,COLOR_RED,"Uso: /sms [n�mero-celular] [texto]");
			return 1;
		}
		strmid(tmp2,cmdtext,10,256);
		if(!strlen(tmp2)){
		    SendClientMessage(playerid,COLOR_RED,"Uso: /sms [n�mero-celular] [texto]");
		    return 1;
		}
		new tmp3[256];
		format(tmp3,256,"phonenumb = %s",tmp);
		cellowner = PRIV_sqlget("players","nickname",tmp3);
		if(!CellExists(strval(tmp))){
		    SendClientMessage(playerid,COLOR_RED,"N�mero de celular inexistente.");
		    return 1;
		}
		if(!IsStringAName(cellowner)){
		    SendClientMessage(playerid,COLOR_RED,"O propriet�rio desse celular n�o est� conectado!");
		    return 1;
		}
		if(CellCredits[playerid] == 0){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem cr�ditos o suficiente para mandar um SMS.");
		    return 1;
		}
		new calledid = GetPlayerID(cellowner);
		CellCredits[playerid]--;
		SendClientMessage(calledid,COLOR_YELLOW,"Nova mensagem de texto recebida!");
		format(string, sizeof(string), "De: %s (%d). Conte�do: %s", PlayerName(playerid),PegarPhone(PlayerName(playerid)),tmp2);
		SendClientMessage(calledid,COLOR_WHITE,string);
		SendClientMessage(playerid, COLOR_WHITE, "Mensagem Enviada");
		format(string, sizeof(string), "Agora lhe sobraram %d cr�ditos.", CellCredits[playerid]);
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
		if(lvl*10000 > GetPlayerMoney(playerid)){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem dinheiro suficiente");
		    return 1;
		}
		if(lvl<1){
		    SendClientMessage(playerid,COLOR_RED,"Te peguei trapaceando! Que coisa feia, hein?");
		    return 1;
		}
		if(AreaCreditos[playerid]==1){
			format(tmp,256,"Voc� comprou %d level. Seu Experience Level agora � %d",lvl,PegarXL(PlayerName(playerid))+lvl);
			SendClientMessage(playerid,COLOR_GREEN,tmp);
			new prelevel = PegarXL(PlayerName(playerid));
			TrocarXL(PlayerName(playerid),prelevel+lvl);
			GivePlayerMoney(playerid,-lvl*10000);
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em uma loja 24/7");
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
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem todo esse dinheiro.");
			return 1;
		}
		if(PegarPhone(PlayerName(playerid)) == 0){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem celular!");
		    return 1;
		}
	    if(AreaCreditos[playerid] == 1){
	        if(creditos + CellCredits[playerid] < 100){
	            CellCredits[playerid] = creditos+CellCredits[playerid];
			    TrocarCreditos(PlayerName(playerid),CellCredits[playerid]);
			    format(tmp, sizeof(tmp), "Seu celular foi recarregado. Um total de %d cr�ditos foi colocado.", creditos);
				SendClientMessage(playerid, COLOR_GREEN, tmp);
				GivePlayerMoney(playerid, - creditos);
				return 1;
			}
			if(creditos + PegarCreditos(PlayerName(playerid)) > 99){
			    new quantia;
			    quantia = 100 - CellCredits[playerid];
			    CellCredits[playerid] = 100;
				TrocarCreditos(PlayerName(playerid),100);
				format(tmp, sizeof(tmp),"Seu celular foi recarregado por completo. Um total de %d cr�ditos foi colocado.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, tmp);
				GivePlayerMoney(playerid, - quantia);
				return 1;
			}
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Todas as lojas 24/7 tem a fun��o de /recarga pra o celuar");
			return 1;
		}
	}

	if(strcmp(cmd, "/cellcreditos", true) == 0) {
 		new string[256];
		if(PegarPhone(PlayerName(playerid)) == 0){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem celular!");
		    return 1;
		}
		else{
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			format(string, sizeof(string), "[SERVI�O DE TELEFONIA M�VEL]: Voc� tem %d cr�ditos.", PegarCreditos(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SetTimerEx("AcaoEspecial",6000,0,"dxs",playerid,COLOR_COP_SWAT,string);
			return 1;
		}
	}

	if (strcmp(cmd, "/numero", true) == 0){
	    new tmp[256];
	    new tmp2[256];
	    new string[256];
		if (PegarAgenda(PlayerName(playerid)) == 1)
		{
			tmp2 = strtok(cmdtext, idx);
			if(!strlen(tmp2)){
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /numero [id]");
				return 1;
			}
   			tmp = PlayerName(strval(tmp2));
			new num = strval(PRIV_sqlget("players","phonenumb",PRIV_FWN(tmp)));
			if(!num) {
			    SendClientMessage(playerid,COLOR_RED,"N�o foi encontrado nenhum registro para seus crit�rios de pesquisa.");
			    return 1;
			}
			format(string,256,"Nome: %s, N�mero: %d",tmp,num);
			SendClientMessage(playerid,COLOR_YELLOW,string);
			return 1;
		} else {
			SendClientMessage(playerid, COLOR_GRAD1, "Voc� n�o tem uma agenda telef�nica!");
			return 1;
		}
	}

	if (strcmp(cmd, "/agenda", true) == 0){
        if(GetPlayerMoney(playerid) < 500){
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem dinheiro para pagar.");
			return 1;
		}
		if(PegarAgenda(PlayerName(playerid)) == 1){
			SendClientMessage(playerid, COLOR_WHITE, "Voc� j� tem agenda telef�nica.");
			return 1;
		}
		new string[256];
   		GivePlayerMoney(playerid,-500);
		Agenda[playerid] = 1;
		format(string, sizeof(string), "Agenda Telef�nica comprada, agora voc� poder� ver n�meros telef�nicos.");
		SendClientMessage(playerid, COLOR_ROSA, string);
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /numero <nome>.");
        TrocarAgenda(PlayerName(playerid), 1);
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
			SendClientMessage(playerid, COLOR_RED, "Voc� pode votar somente para 1 jogador");
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

	if(strcmp(cmd, "/taxi", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_TAXISTA, "Os taxistas foram informados");
	    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == TAXISTA){
				format(string,sizeof(string),"%s precisa de um taxi em:  %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_TAXISTA, string);
	        }
 		}
		return 1;
	}

	if(strcmp(cmd, "/taxiaereo", true)==0){
		new string[256];
		SendClientMessage(playerid, COLOR_TAXI_AEREO, "Os pilotos j� foram informados");
		for(new i=0; i<MAX_PLAYERS; i++){
			if(Profissao[i] == TAXI_AEREO){
				format(string,sizeof(string),"%s precisa de um taxia�reo em:  %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
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
		} else {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SendClientMessage(playerid,COLOR_COP_SWAT,"Os policiais foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_SWAT){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_SWAT, string);
		        }
			}
		}
        return 1;
 	}
	if(strcmp(cmd, "/192", true)==0){
		new string[256];
	    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		SendClientMessage(playerid,COLOR_COP_SWAT,"Os paramedicos j� foram informados");
		for(new i=0; i<MAX_PLAYERS; i++){
			if(Profissao[i] == PARAMEDICO){
				format(string,sizeof(string),"%s precisa de um AMBUL�NCIA nas proximidade de: %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_EMERGENCIA, string);
			}
   		}
		return 1;
	}
	if(strcmp(cmd, "/mecanico", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_MECANICO, "Reboque/Mec�nico chamado.");
	    for(new i=0; i<MAX_PLAYERS; i++){
		    if(Profissao[i] == MECANICO){
				GetPlayerName(playerid,name,sizeof(name));
				format(string,sizeof(string),"%s precisa de um Mec�nico em: %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
				SendClientMessage(i, COLOR_MECANICO, string);
			}
       	}
		return 1;
	}
	if (strcmp(cmdtext, "/trancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
			SendClientMessage(playerid, COLOR_RED2, "Voc� n�o est� dirigindo nenhum veiculo!");
		else{
		    new veh = GetPlayerVehicleID(playerid);
		    for(new i; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i) && i != playerid) SetVehicleParamsForPlayer(veh,i,false,true);
		    CarroTrancado[veh] = true;
			SendClientMessage(playerid, COLOR_GREEN, "Ve�culo trancado");
			new Float:X, Float:Y, Float:Z;
			PlayerPlaySound(playerid,1056,X,Y,Z);
		}
		return 1;
	}

	if (strcmp(cmdtext, "/destrancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
			SendClientMessage(playerid, COLOR_RED2, "Voc� n�o est� dirigindo nenhum veiculo!");
		else{
		    new veh = GetPlayerVehicleID(playerid);
		    for(new i; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i) && i != playerid) SetVehicleParamsForPlayer(veh,i,false,false);
		    CarroTrancado[veh] = false;
			SendClientMessage(playerid, COLOR_GREEN, "Ve�culo destrancado");
			new Float:X, Float:Y, Float:Z;
			PlayerPlaySound(playerid,1056,X,Y,Z);
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
			}
		}
		if(QtImprise <= 0){
		    SendClientMessage(playerid,COLOR_RED,"N�o h� nenhum preso no momento.");
		    return 1;
		} else {
			format(string,sizeof(string),"Total de presos: %d",QtImprise);
			SendClientMessage(playerid,COLOR_PALHA,string);
			return 1;
		}
	}

	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256],qt;
	    SendClientMessage(playerid, COLOR_YELLOW, "Lista de procurados:");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        new level = GetPlayerWantedLevel(i);
	        if(level > 0){
				format(string, sizeof(string), "%d: %s - %d estrelas", i, PlayerName(i), level);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				qt++;
			}
		}
		if(qt <= 0){
		    SendClientMessage(playerid,COLOR_RED,"N�o h� nenhum procurado no momento.");
		    return 1;
		} else {
			format(string,sizeof(string),"Total de procurados: %d",qt);
			SendClientMessage(playerid,COLOR_PALHA,string);
			return 1;
		}
	}

	if(strcmp(cmd, "/horas", true) == 0) {
    	SendClientMessage(playerid,COLOR_GREEN,"Voc� � cego? Olha ali do lado as horas >>>");
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
			else SendClientMessage(playerid, COLOR_YELLOW, "Valor inv�lido.");
		}
		else SendClientMessage(playerid, COLOR_YELLOW, "Jogador offline");
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
	    if(IsInBank(playerid) == 1){
	        GivePlayerMoney(playerid, 0 - quantidade);
	        TrocarBankmoney(PlayerName(playerid), PegarBankmoney(PlayerName(playerid)) + quantidade);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "todas cidades voc� encontra uma ag�ncia, onde tiver um $ � o banco. ");
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
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode sacar esta quantia");
			return 1;
		}
		if(quantidade > PegarBankmoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem esta quantia no banco");
			return 1;
		}
	    if(IsInBank(playerid) == 1){
	        GivePlayerMoney(playerid, quantidade);
	        TrocarBankmoney(PlayerName(playerid), PegarBankmoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Voc� retirou $%d do banco. seu saldo atual � de $%d", quantidade, PegarBankmoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			if(PassoMissaoInicial[playerid] == 3) {
				if(GetPlayerMoney(playerid) < 1000) SendClientMessage(playerid,COLOR_RED,"Voc� n�o sacou o suficiente ainda, voc� tem que sacar no m�nimo $1000!");
				else {
				    TextDrawHideForPlayer(playerid,tdMissao2);
				    OnPlayerLeaveCheckpoint(playerid);
					SetTimerEx("MensagemMI",1000,false,"dd",playerid,12);
				}
			}
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos:em todas cidades tem uma ag�ncia geralmente na pra�a ou av.principal.");
			return 1;
		}
	}
    if(strcmp(cmd, "/extrato", true) == 0) {
		new string[256];
        if(IsInBank(playerid) == 1){
			format(string, sizeof(string), "Voc� tem %d em sua conta.", PegarBankmoney(PlayerName(playerid)));
			SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Voc� precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos:em todas cidades tem uma ag�ncia geralmente na pra�a ou av.principal.");
			return 1;
		}
	}

	if(strcmp(cmd, "/saldocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 5){
            SendClientMessage(playerid, COLOR_YELLOW, "Custo: $5");
			return 1;
		}
		else{
		    GivePlayerMoney(playerid, 0 - 5);
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			format(string, sizeof(string), "Mensagem de MPA Bankline: Voc� tem %d em sua conta.", PegarBankmoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COLOR_GREEN, string);
			SetTimerEx("AcaoEspecial",6000,0,"dxs",playerid,COLOR_COP_SWAT,string);
			return 1;
		}
	}

	if(!strcmp(cmd,"/verlevel",true)){
	    new tmp[256],lvl;
	    lvl = PegarXL(PlayerName(playerid));
	    format(tmp,256,"Seu Level de Experiencia: %d",lvl);
	    SendClientMessage(playerid,COLOR_GREEN,tmp);
	    return 1;
	}
	if(strcmp(cmd, "/idveiculo", true) == 0) {
	    new id;
	    new modelo;
	    new msg[256];
	    id = GetPlayerVehicleID(playerid);
		modelo = GetVehicleModel(id);
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
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem dinheiro para pagar.");
			return 1;
		}
		if(!IsPlayerInAnyVehicle(playerid)){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em nenhum ve�culo!");
		    return 1;
		}
		if(GPV[GetPlayerVehicleID(playerid)] == -1){
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o pode abastecer esse ve�culo!");
		}
		new currentgas = GPV[GetPlayerVehicleID(playerid)];
		if(AreaPosto[playerid] == 1){
		    Abastecendo[playerid]=1;
			if(quantidade + currentgas < 100){
			    SetTimerEx("AplicarGasosa",quantidade*1000,0,"ddd",playerid,GetPlayerVehicleID(playerid),quantidade+currentgas);
			    TogglePlayerControllable(playerid,0);
			    format(string, sizeof(string), "Espere o abastecimento completar. Ser�o colocados %d litros.", quantidade);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantidade);
				format(string,256,"No total, seu tanque ter� %d litros de combust�vel.",quantidade+currentgas);
				SendClientMessage(playerid,COLOR_YELLOW,string);
				return 1;
			}
			if(quantidade + currentgas > 99){
			    new quantia;
			    quantia = 100 - currentgas;
				SetTimerEx("AplicarGasosa",quantia*1000,0,"ddd",playerid,GetPlayerVehicleID(playerid),100);
			    TogglePlayerControllable(playerid,0);
				format(string, sizeof(string), "Espere o abastecimento completar. Seu tanque ser� enchido com %d litros.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantia);
				return 1;
			}
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� em um posto, consulte o mapa no f�rum para saber sua localiza��o");
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
			    SendClientMessage(playerid,COLOR_RED,"O jogador n�o est� em um ve�culo!");
			    return 1;
			}
			if(GPV[GetPlayerVehicleID(plid)] == -1){
			    SendClientMessage(playerid,COLOR_RED,"Este ve�culo n�o pode ser abastecido!");
			    return 1;
			}
			if(quantidade < 1 || quantidade > 100){
			    SendClientMessage(playerid,COLOR_RED,"Somente de 1 a 100");
			    return 1;
			}
			distancia = GetDistanceBetweenPlayers(playerid, plid);
		 	if(distancia > 15){
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
				return 1;
			}
			new currentgas = GPV[GetPlayerVehicleID(plid)];
			if(quantidade + currentgas < 100){
			    GPV[GetPlayerVehicleID(plid)] = quantidade+currentgas;
			    format(string, sizeof(string), "Seu carro foi abastecido e um total de %d litros foi colocado. N�o gaste � toa!", quantidade);
				SendClientMessage(plid, COLOR_GREEN, string);
				GivePlayerMoney(plid,- quantidade);
				GivePlayerMoney(playerid,quantidade);
				SendClientMessage(playerid,COLOR_YELLOW,"Miss�o cumprida!");
				TogglePlayerControllable(plid,1);
				if(CarroAbastecido[GetPlayerVehicleID(plid)] == 0){
					CarroAbastecido[GetPlayerVehicleID(plid)]=1;
					SetTimerEx("ZerarCarroAbastecido",130000,false,"d",GetPlayerVehicleID(plid));
					AcrescentarExPoints(playerid,1);
				}
				return 1;
			}
			if(quantidade + currentgas > 99){
			    new quantia;
			    quantia = 100 - currentgas;
			    GPV[GetPlayerVehicleID(plid)] = 100;
				format(string, sizeof(string), "O tanque de seu carro est� cheio, foram colocados %d litros. N�o gaste � toa!", quantia);
				SendClientMessage(plid, COLOR_GREEN, string);
				GivePlayerMoney(plid, - quantia);
				GivePlayerMoney(playerid,quantia);
				TogglePlayerControllable(plid,1);
				if(CarroAbastecido[GetPlayerVehicleID(plid)] == 0){
					CarroAbastecido[GetPlayerVehicleID(plid)]=1;
					SetTimerEx("ZerarCarroAbastecido",130000,false,"d",GetPlayerVehicleID(plid));
					AcrescentarExPoints(playerid,1);
				}
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Vou te dar um conselho, voc� nem deveria estar mexendo nesse comando...");
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
				SendClientMessage(playerid, COLOR_RED,"Voc� n�o est� na boate.");
				return 1;
			}
		   	if(!IsPlayerConnected(plid)){
	       		SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}
			if(GetPlayerMoney(plid) < 300){
	        	SendClientMessage(playerid, COLOR_RED, "Ele n�o tem dinheiro para pagar!");
				return 1;
			}
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		       	SendClientMessage(playerid,COLOR_RED,"Voc� est� muito longe, chegue mais perto!");
				return 1;
			}
			if(Profissao[plid] == PROSTITUTA){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode transar com si mesma.");
				return 1;
			}
			else {
				SendClientMessage(plid, COLOR_ROSA, "A prostituta est� lhe oferecendo uma transa numa cama bem confort�vel!");
				SendClientMessage(plid, COLOR_ROSA, "Se quizer transar com a prostituta basta digitar /aceitotransar se n�o /naotransar.");
				Transacama[plid] = 1;
				Prostitutacama[plid] = playerid;
				SendClientMessage(playerid, COLOR_ROSA, "A proposta foi enviada! Aguarde.");
				return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/aceitotransar", true) == 0){
		if(GetPlayerMoney(playerid) < 300){
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem dinheiro para transar com a prostituta");
			return 1;
		}
	    if(Transacama[playerid] == 1){
	        Transacama[playerid] = 0;
	        SendClientMessage(playerid, COLOR_ROSA, "Voc� aceitou a prosposta da prostituta!");
	        SetPlayerPos(Prostitutacama[playerid], 2206.5156,-1071.4319,1051.0058);
	        SetPlayerPos(playerid, 2205.2402,-1076.3251,1050.4844);
	        SetPlayerInterior(playerid,1);
	        SetPlayerInterior(Prostitutacama[playerid],1);
	        SendClientMessage(playerid, COLOR_ROSA2, "Para -meter- digite /meter");
	        SendClientMessage(playerid, COLOR_ROSA2, "Para sair basta entrar no CheckPoint que est� pr�ximo a porta!");
	   	    SetPlayerCheckpoint(playerid,2211.9827,-1076.0026,1050.4844,3.0);
	        nCheckpointStatus[playerid] = NACAMA;
	        SetTimerEx("Prostituir",1000,0,"d",Prostitutacama[playerid]);
			return 1;
		}
		if(Transacama[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o fechou acordo com a prostituta!");
	        return 1;
	    }
	}
	if(strcmp(cmd, "/naotransar", true) == 0){
	    if(Transacama[playerid] == 1){
	        Transacama[playerid] = 0;
	        SendClientMessage(playerid, COLOR_GREEN, "Voc� n�o aceitou a proposta!");
	        return 1;
	    }
		if(Transacama[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o fechou acordo com a prostituta!");
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
		    SendClientMessage(playerid,COLOR_RED,"Voc� est� muito longe, chegue mais perto!");
			return 1;
		}
		SendClientMessage(playerid, COLOR_ROSA,"Para transar n�o mexe a c�mera e fique apertando -W- respectivamente.");
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
				SendClientMessage(playerid, COLOR_RED,"Voc� n�o est� na boate.");
				return 1;
			}
		   	if(!IsPlayerConnected(plid)){
	       		SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}
			if(GetPlayerMoney(plid) < 200){
	        	SendClientMessage(playerid, COLOR_RED, "Ele n�o tem dinheiro para pagar!");
				return 1;
			}
		    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
		       	SendClientMessage(playerid,COLOR_RED,"Voc� est� muito longe, chegue mais perto!");
				return 1;
			}
			if(Profissao[plid] == PROSTITUTA){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode fazer strip-tease para si mesma ou para colegas de trabalho!");
				return 1;
			}
			else {
				SendClientMessage(plid, COLOR_ROSA, "A prostituta est� lhe oferecendo um strip tease na boate.");
				SendClientMessage(plid, COLOR_ROSA, "Se quiser assistir basta digitar /aceitostrip se n�o /recusarstrip.");
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
			SendClientMessage(playerid, COLOR_ROSA,"O show vai come�ar");
	        SetPlayerPos(Prostitutacama2[playerid], -2673.0789,1410.5981,907.5703);
	        SetPlayerPos(playerid, -2666.8901,1410.1359,906.2734);
	        SetPlayerInterior(playerid,3);
	        SetPlayerInterior(Prostitutacama2[playerid],3);
	        GivePlayerMoney(Prostitutacama2[playerid], 200);
			GivePlayerMoney(playerid, -200);
			SendClientMessage(playerid, COLOR_ROSA2,"Voc� pagou para a prostituta $200 pelo strip!");
			AcrescentarExPoints(playerid,1);
	        SetTimerEx("Strip",5000,0,"d",Prostitutacama2[playerid]);
			return 1;
		}
		if(Strip2[playerid] == 0){
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o fechou acordo com a prostituta!");
	   		return 1;
		}
	}
	if(strcmp(cmd, "/recusarstrip", true) == 0){
	    if(Strip2[playerid] == 1){
	        Strip2[playerid] = 0;
	        SendClientMessage(playerid, COLOR_GREEN, "Voc� n�o aceitou a proposta!");
	        return 1;
	    }
		if(Strip2[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o fechou acordo com a prostituta!");
	        return 1;
	    }
	}

	if(compare(cmd, "/apagarcasa")) {
		if(!IsPlayerAdmin(playerid)){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o!");
			return 1;
		}
		new nome[256],tmp[256],plid;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/apagarcasa [id]");
			return 1;
		}
		plid = strval(tmp);
		nome = PlayerName(plid);
		if(Cadastrado(nome)) {
		    new string[256];
		    format(string,sizeof string,"nick = '%s'",nome);
		    PRIV_sqldel("pickups",string);
		    for(new p; p<400; p++) if(compare(PlayerName(plid),PickCasas_Dono[p])) { DestroyPickup(p); PickCasas_Dono[p] = "aa"; }
		    TrocarPos(nome,ProfPos[1][0],ProfPos[1][1],ProfPos[1][2],0);
		    SendClientMessage(playerid,COLOR_AZULPLUS,"Casa apagada.");
			return 1;
	    } else {
	        SendClientMessage(playerid,COLOR_RED,"ERRO NA BASE DE DADOS: Jogador n�o cadastrado.");
	        return 1;
		}
	}
		

	if(strcmp(cmd, "/casa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new nome[256],plid;
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/casa [id]");
				return 1;
			}
			plid = strval(tmp);
			nome = PlayerName(plid);
    		if (Cadastrado(nome)) {
		        new Float:X, Float:Y, Float:Z, Float:ang;
	      		new string[256];
				GetPlayerPos(playerid, X, Y, Z);
				GetPlayerFacingAngle(playerid,ang);
				TrocarPos(nome, X, Y, Z,ang);
			    SendClientMessage(playerid, COLOR_GREEN, "Casa vendida");
			    format(string,sizeof string,"nick = '%s'",nome);
			    PRIV_sqldel("pickups",string);
	      		format(string,sizeof string,"NULL,%f,%f,%f,1272,'%s','%s'",X,Y,Z,nome,PlayerName(playerid));
			    PRIV_sqlins("pickups",string);
				printf("%s acaba de vender um im�vel para %s",PlayerName(playerid),tmp);
				for(new p; p<400; p++) if(compare(PlayerName(plid),PickCasas_Dono[p])) { DestroyPickup(p); PickCasas_Dono[p] = "aa"; }
				new pid = CreatePickup(1272,1,X,Y,Z);
				PickCasas_Dono[pid] = PlayerName(plid);
				PickCasas_Coord[pid][0] = X;
				PickCasas_Coord[pid][1] = Y;
				PickCasas_Coord[pid][2] = Z;
				if(CasaVendida[plid]==0){
				    CasaVendida[plid]=1;
				    SetTimerEx("ZerarCasaVendida",130000,false,"d",plid);
					AcrescentarExPoints(playerid,1);
				}
     	    	return 1;
    	    } else {
    	        SendClientMessage(playerid,COLOR_RED,"ERRO NA BASE DE DADOS: Jogador n�o cadastrado.");
    	        return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/hotel", true) == 0) {
		if(AreaHotel[playerid] > 0){
			if(GetPlayerMoney(playerid) < 1500){
       			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem com voc� $1500 para pagar.");
				return 1;
			} else {
				if(Cadastrado(PlayerName(playerid))) {
				    new h = AreaHotel[playerid];
					TrocarPos(PlayerName(playerid), HotelPos[h][4], HotelPos[h][5], HotelPos[h][6], HotelPos[h][7]);
	    			GivePlayerMoney(playerid,-1500);
	    			SendClientMessage(playerid, COLOR_GREEN, "Agora voc� est� hospedado aqui. Obrigado por escolher este Hotel.");
		           	SendClientMessage(playerid, COLOR_GREEN, "Voc� ficar� hospedado at� ter um emprego e condi��es de comprar sua casa.");
					return 1;
        		}
			}
		} else {
    		SendClientMessage(playerid, COLOR_RED, "Ei... voc� n�o est� em um Hotel.");
       		SendClientMessage(playerid, COLOR_WHITE, "Procure por a�... onde tiver uma casa verde,");
       		SendClientMessage(playerid, COLOR_WHITE, "com a inscri��o Hotel na tela, h� vagas.");
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
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem esse dinheiro! Ou n�o est� querendo pagar de forma justa.");
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
		} else {
		    SendClientMessage(playerid, COLOR_RED, "Voc� est� tentando pagar alguem que n�o � coretor e nem vendedor!");
			return 1;
		}
	}

	if(strcmp(cmd, "/ci", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[5];
	    new prof;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/ci [id].");
			return 1;
		}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
            hab[2] = PegarHabAerea(PlayerName(playerid));
		    hab[0] = PegarHabTerre(PlayerName(playerid));
		    hab[1] = PegarHabNauti(PlayerName(playerid));
            hab[3] = PegarPorte(PlayerName(playerid));
            hab[4] = PegarPassport(PlayerName(playerid));
			format(string, sizeof(string), "Identidade de: %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Skin :: %d", PegarSkin(PlayerName(playerid)));
			SendClientMessage(plid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Prof de %s :: %d", PlayerName(plid), ProfExtName[prof]);
			SendClientMessage(plid, COLOR_YELLOW, string);
			if(hab[0] == 0) SendClientMessage(plid, COLOR_YELLOW, "Habilita��o de Carros e Motos: N�O");
			if(hab[0] == 1) SendClientMessage(plid, COLOR_GREEN, "Habilita��o de Carros e Motos: SIM");
			if(hab[1] == 0) SendClientMessage(plid, COLOR_YELLOW, "Habilita��o N�utica: N�O");
			if(hab[1] == 1) SendClientMessage(plid, COLOR_GREEN, "Habilita��o N�utica: SIM");
			if(hab[2] == 0) SendClientMessage(plid, COLOR_YELLOW, "Habilita��o A�rea: N�O");
			if(hab[2] == 1) SendClientMessage(plid, COLOR_GREEN, "Habilita��o A�rea: SIM");
            if(hab[3] == 0){
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT1: N�O");
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT2: N�O");
			}
			if(hab[3] == 1){
			    SendClientMessage(plid, COLOR_GREEN,  "Porte de armas CAT1: SIM");
			    SendClientMessage(plid, COLOR_YELLOW, "Porte de armas CAT2: N�O");
			}
			if(hab[3] == 2){
			    SendClientMessage(plid, COLOR_GREEN, "Porte de armas CAT1: SIM");
			    SendClientMessage(plid, COLOR_GREEN, "Porte de armas CAT2: SIM");
			}
			if(hab[4] == 0) SendClientMessage(plid, COLOR_YELLOW, "Passaporte: N�O");
			if(hab[4] == 1) SendClientMessage(plid, COLOR_YELLOW, "Passaporte: SIM");
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado.");
		return 1;
	}
	
    if(strcmp(cmd, "/plantarmilho", true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
	        if(AreaFazenda[playerid] == 0){
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na FAZENDA.");
				return 1;
			}
			if(FazendaInProgress[playerid] == 1){
		    	SendClientMessage(playerid, COLOR_RED, "A colheita ainda n�o est� pronta... AGUARDE.");
				return 1;
			}
			SendClientMessage(playerid, COLOR_GREEN, "Espere a colheita e o ensacamento para poder ir vender.");
	    	FazendaInProgress[playerid] = 1;
	    	SetTimerEx("Fazenda",36000,0,"d",playerid);
	    	AcrescentarExPoints(playerid,1);
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/vendermilho",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na Fazenda.");
				return 1;
			}
		    if(QtMilho[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem milho para vender.");
				return 1;
			}
			new msg[256];
			new quantia;
			quantia = QtMilho[playerid]*200;
			format(msg, sizeof(msg),"Voc� vendeu %d sacas (%d Kg) de milho por $200 cada e faturou $%d com a venda.",QtMilho[playerid],QtMilho[playerid]*60,quantia);
			SendClientMessage(playerid,COLOR_WHITE,msg);
			GivePlayerMoney(playerid,quantia);
			QtMilho[playerid] = 0;
			AcrescentarExPoints(playerid,1);
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/tirarleite", true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
	        if(Leite[playerid] == 0){
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� no CURRAL.");
				return 1;
			} else {
			    if(LeiteInProgress[playerid] == 1){
				    SendClientMessage(playerid, COLOR_RED, "Voc� t� tirando o leite da vaca. Aguarde");
					return 1;
				} else {
				    ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 1, 0, 0, 0);
					SendClientMessage(playerid, COLOR_AGRICULTOR, "C� t� tirando o leite pera um peda�o a�.");
					SendClientMessage(playerid, COLOR_AGRICULTOR, "C� j� sai de baixo da vaca. Calminha s�!");
			    	LeiteInProgress[playerid] = 1;
			    	SetTimerEx("LeiteA",36000,0,"d",playerid);
			    	AcrescentarExPoints(playerid,1);
					return 1;
				}
            }
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/venderleite",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na Venda do Milho/Leite");
				return 1;
			} else {
			    if(QtLeite[playerid] == 0){
			        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem leite para vender!");
					return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtLeite[playerid]*200;
					format(msg, sizeof(msg),"Voc� vendeu %d engradados (%d Lts) de leite por $200 cada e faturou $%d com a venda.",QtLeite[playerid],QtLeite[playerid]*60,quantia);
					SendClientMessage(playerid,COLOR_WHITE,msg);
					GivePlayerMoney(playerid,quantia);
					QtLeite[playerid] = 0;
					AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
			return 1;
		}
	}

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
			    TrocarHabAerea(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o aerea concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu a habilita��o de dire��o aerea.");
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� autorizado a executar este comando.");
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
			    TrocarHabTerre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o terrestre concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu a habilita��o de dire��o de carros e motos.");
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� autorizado a executar este comando.");
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
			    TrocarHabNauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_GREEN, "Habilita��o de dire��o n�utica concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu a habilita��o de dire��o n�utica.");
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� autorizado a executar este comando.");
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
          	if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			    if(ATaximetro[plid][0] == 1)
			    {
			        SendClientMessage(playerid,COLOR_RED,"Voc� j� est� tarifando a viagem desse jogador!");
			        return 1;
			    }
				if(GetVehicleModel(GetPlayerVehicleID(playerid)) != VEH_MAVERICK) {
				    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� pilotando um Maverick!");
				    return 1;
				}
	            SendClientMessage(playerid, COLOR_GREEN, "A viagem a�rea come�ou a ser tarifada");
            	SendClientMessage(plid, COLOR_GREEN, "A viagem a�rea come�ou a ser tarifada");
                ATaximetro[plid][0] = 1;
                ATaximetro[plid][1] = playerid;
                AcrescentarExPoints(playerid,1);
				return 1;
			} else {
			    SendClientMessage(playerid,COLOR_RED,"O passageiro n�o est� em seu ve�culoo ou voc� n�o � o motorista!");
			    return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � piloto de taxi a�reo.");
			return 1;
		}
    }

	if(strcmp(cmd, "/veredicto", true)==0){
		if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
	    	strmid(tmp, cmdtext, 10, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/veredicto [ nome do reu e senten�a ]");
				return 1;
			}
	 		SendClientMessage(playerid, COLOR_JUIZ, "Voc� fez a senten�a no tribunal e determinou.");
			format(string, sizeof(string), "O Juiz Dr.%s sentenciou %s ", PlayerName(playerid), tmp);
			SendClientMessageToAll(COLOR_JUIZ, string);
			AcrescentarExPoints(playerid,1);
			return 1;
		} else {
	       SendClientMessage(playerid, COLOR_RED, " Ei...Voc� n�o � Juiz, sua profissao � outra");
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
			   TrocarPassport(PlayerName(plid), 1);
			   SendClientMessage(playerid, COLOR_JUIZ, "Passaporte nacional concedido.");
			   SendClientMessage(plid, COLOR_GREEN, "O Juiz lhe concedeu passaporte, agora voc� tem");
               SendClientMessage(plid, COLOR_GREEN, "livre circula��o alem dos limites de San Fierro.");
               AcrescentarExPoints(playerid,1);
			   return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� autorizado a conceder porte de armas.");
			return 1;
		}
	}

	if (strcmp(cmd, "/ordem", true)==0){
		if(Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
		    strmid(tmp, cmdtext, 8, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/ordem [ qual ordem aos oficiais? ]");
				return 1;
			}
		    SendClientMessage(playerid, COLOR_GREEN, "Voc� enviou uma ordem aos policiais de San Fierro.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		       if(Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO ||Profissao[i] == JUIZ || Profissao[i] == COP_SWAT){
					format(string, sizeof(string), "O Xerife %s ordenou aos policiais: %s ", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_RODOVIARIO, string);
		        }
			}
			return 1;
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...voc� n�o � Xerif,sua profissao � outra");
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
			    TrocarPorte(PlayerName(plid), 1);
			    SendClientMessage(playerid, COLOR_JUIZ, "Porte de armas CAT 1, concedido.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu porte de armas CAT1, armas leves.");
                SendClientMessage(plid, COLOR_GREEN, "digite /portedearmas e veja quais armas voc� pode usar.");
                AcrescentarExPoints(playerid,1);
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� autorizado a conceder porte de armas.");
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
			    TrocarPorte(PlayerName(plid), 2);
			    SendClientMessage(playerid, COLOR_TAXI_AEREO, "Porte de armas CAT 2, concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Voc� recebeu porte de armas CAT2, armas pesadas");
                SendClientMessage(plid, COLOR_GREEN, "digite /portedearmas e veja quais armas voc� pode usar.");
                AcrescentarExPoints(playerid,1);
				return 1;
			} else {
			    SendClientMessage(playerid, COLOR_RED, "ID inv�lido");
				return 1;
			}
		} else {
            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� autorizado a conceder porte de armas.");
			return 1;
		}
	}
 	if(strcmp(cmd, "/portedearmas", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "Lista de armas permitidas em San Fierro-SA. S�o duas categorias armas leves e armas pesadas");
	    SendClientMessage(playerid, COLOR_GREEN, "qualquer cidad�o de San Fierro que usar armas sem porte ser� preso, e aguardar� o julgamento.");
	    SendClientMessage(playerid, COLOR_PALHA, "CAT1:armas leves: Pistola Colt 45 c/ ou sem silenciador,Country shotgun(de cano longo).");
	    SendClientMessage(playerid, COLOR_PALHA, "Desert eagle, Rifle.");
		SendClientMessage(playerid, COLOR_PALHA, "CAT2: AK47 Assault Rifle,M4 Assalut Rifle,MP5,Combat Knife,SPAZ-12 Shotgun ");
    	SendClientMessage(playerid, COLOR_PALHA, "Decreto n�1925/2007 - Armas permitidas em San Fierro/SA");
		return 1;
	}
	
	if(strcmp(cmd,"/noticia",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COLOR_RED,"/noticia [texto]");
				return 1;
			} else {
			    format(msg,sizeof(msg),"Not�cias de San Andreas, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COLOR_YELLOW,msg);
			    SendClientMessageToAll(COLOR_ROSA,tmp);
			    AcrescentarExPoints(playerid,1);
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
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
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem esse dinheiro! verifique se tem no banco esta quantia");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/3);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "Voc� defendeu o r�u e cobrou pela causa $ %d  e recebeu $ %d pelos seus honor�rios", pagamento, pagamento/3);
				SendClientMessage(plid, COLOR_GREEN, string);
				AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...ele n�o � advogado");
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
				SendClientMessage(playerid, COLOR_RED, "/processo [ nome do reu e descri��o da causa ]");
				return 1;
			}
			SendClientMessage(playerid, COLOR_ADVOGADO, "Voc� fez a defesa do seu cliente e o processo est� em andamento, aguarde a senten�a do juiz");
			for(new i=0; i<MAX_PLAYERS; i++){
				if(Profissao[i] == JUIZ || IsPlayerAdmin(playerid)){
					format(string, sizeof(string), "O Dr.%s entrou com um peti��o em defesa do r�u  %s ", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_JUIZ, string);
					AcrescentarExPoints(playerid,1);
		    	}
			}
			return 1;
		} else {
			SendClientMessage(playerid, COLOR_RED, " Ei...voc� n�o � advogado,sua profissao � outra");
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
		    	SendClientMessage(playerid, COLOR_RED,"Voc� � vendedor n�o pode alugar para voc�!");
				return 1;
			}
			if(JogadorNoCarro[plid] != 1){
				SendClientMessage(playerid,COLOR_RED, "Ele n�o est� no carro, pe�a para ele entra no carro a se alugado!");
				return 1;
			}

	  		if(TempoAlugar[plid] > 0 && CarroAlugado[plid] == 1){
				SendClientMessage(playerid,COLOR_RED, "Ele j� est� com um carro alugado!");
				return 1;
			}

			if(!IsPlayerConnected(plid)){
	        	SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}

			if(GetDistanceBetweenPlayers(playerid,plid) > 20){
			    SendClientMessage(playerid,COLOR_RED,"Voc� est� muito longe, chegue mais perto!");
				return 1;
			}

			else {
				SendClientMessage(plid, COLOR_GREEN, "Alguem est� lhe oferecendo o carro que voc� est�,");
				SendClientMessage(plid, COLOR_GREEN, "se quizer alug�-lo, digite: '/alugar' se n�o: '/naoalugar'");
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
	        SendClientMessage(playerid, COLOR_GREEN, "Voc� alugou o carro, corra porque o tempo est� passando!");
	        format(string, sizeof(string), "O Jogador %s aceitou sua oferta e com isso voc� recebeu $1000 pela loca��o.",PlayerName(playerid));
	        SendClientMessageCarros(COLOR_LOCADOR_DE_CARROS, string);
	        GivePlayerMoney(AluguelFornecedor[playerid], 1000);
	        SetTimerEx("TempoAlugando",300000,0,"d",playerid);
	        AcrescentarExPoints(playerid,1);
	        return 1;
		}
		if(OferecerCarro[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "Ningu�m est� lhe oferencendo um carro nesse momento!!");
	        return 1;
	    }
	}
	if(strcmp(cmd, "/naoalugar", true) == 0){
	    if(OferecerCarro[playerid] == 1){
	        OferecerCarro[playerid] = 0;
	        SendClientMessage(playerid, COLOR_GREEN, "Pronto! Voc� n�o alugou o carro!");
			RemovePlayerFromVehicle(playerid);
	        TogglePlayerControllable(playerid, 1);
	        return 1;
	    }
		if(OferecerCarro[playerid] == 0){
	        SendClientMessage(playerid, COLOR_GREEN, "Ningu�m est� lhe oferencendo um carro nesse momento!!");
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
	        SendClientMessage(playerid, COLOR_GREEN, "N�o est� no carro de aluguel!!");
	        return 1;
	    }
	}
	
	if(strcmp(cmd, "/transportar", true) == 0) {
		if(Profissao[playerid] == TRANSPORTE_DE_VALORES || IsPlayerAdmin(playerid)){
		     if(AreaForte[playerid] == 1){
				new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(modelo == VEH_CARROFORTE){
					   if(Carga[playerid] == 0){
				    	SendClientMessage(playerid,COLOR_GREEN,"Ve�culo Forte Carregado!");
				    	SendClientMessage(playerid,COLOR_GREEN,"Para deixar a grana v� at� o banco mais pr�ximo!");
				    	Carga[playerid] = 1;
						return 1;
						} else {
				        SendClientMessage(playerid,COLOR_RED,"Carro Forte Carregado");
						return 1;
					}
				} else {
				    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um CARRO FORTE");
					return 1;
				}
	     	   } else {
	            SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� na �rea de carga");
				return 1;
			}
	    }
	    else{
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
	    	return 1;
	    }
	}
	if(strcmp(cmd,"/depositargrana",true) == 0){
	    new msg[256];
	    if(Profissao[playerid] == TRANSPORTE_DE_VALORES || IsPlayerAdmin(playerid)){
	        if(AreaBanco[playerid] == 1){
	            if(Carga[playerid] == 0){
	                SendClientMessage(playerid,COLOR_RED,"Seu ve�culo n�o tem grana!");
					return 1;
				} else {
				    Carga[playerid] = 0;
				    SendClientMessage(playerid,COLOR_GREEN,"Dinheiro depositado.");
				    GivePlayerMoney(playerid,100);
				    AcrescentarExPoints(playerid,1);
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em nenhum BANCO");
				return 1;
			}
		} else {
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso!");
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
	
	if(strcmp(cmd, "/reforco", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
            new string[256];
            SetTimerEx("AcaoEspecial",1,0,"dd",playerid,SPECIAL_ACTION_USECELLPHONE);
            SetTimerEx("AcaoEspecial",6000,0,"dd",playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
			SendClientMessage(playerid, COLOR_COP_SWAT, "Pol�cia avisada!");
			format(string,sizeof(string),"%s precisa de refor�o nas proximidades de:  %s",PlayerName(playerid),zones[player_zone[playerid]][zone_name]);
			SendClientMessagePolicia(COLOR_COP_SWAT, string);
			ApplyAnimation(playerid,"PED", "phone_out", 4.0, 0, 0, 0, 0, 0);
			return 1;
		}
	}
	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
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
			        SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
					return 1;
				} else {
					Presos[plid] = 1;
				    TrocarPrisao(PlayerName(plid), 1);
					LogarPlayer(plid);
					format(string, sizeof(string), "Voc� foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEGURANCA, string);
      		        SendClientMessage(playerid, COLOR_GREEN, "Pris�o concluida");
          		  	GameTextForPlayer(plid, "~r~ preso!", 5000,0);
					format(string, sizeof(string), "%s prendeu %s", PlayerName(playerid), PlayerName(plid));
					SendClientMessageJuiz(COLOR_JUIZ, string);
					AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
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
			        SendClientMessage(playerid,COLOR_RED,"Voc� est� muito longe, chegue mais perto!");
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_YELLOW,"Resultados do exame anti-dopping:");
				    format(msg, sizeof(msg), "Heroina : %d doses",Heroina[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    format(msg, sizeof(msg), "Maconha : %d doses",Maconha[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    format(msg, sizeof(msg), "Coca�na : %d doses",Cocaina[plid]);
				    SendClientMessage(playerid,COLOR_COP_NARCOTICOS,msg);
				    SendClientMessage(playerid,COLOR_YELLOW,"Exame anti-dopping conclu�do!");
					return 1;
				}
			}
			else {
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o para isso!");
			return 1;
		}
	}
    if(strcmp(cmd, "/fianca", true) == 0) {
        if(Presos[playerid] == 0){
            SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� preso!");
			return 1;
		} else {
		    if(PegarBankmoney(PlayerName(playerid)) < 1500){
		        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem toda essa quantia no banco!");
		    	return 1;
		    } else {
				TrocarPrisao(PlayerName(playerid), 0);
				Presos[playerid] = 0;
				PrisaoTimer[playerid][1]=0;
				KillTimer(PrisaoTimer[playerid][0]);
				SetSpawnInfo(playerid,1,PegarSkin(PlayerName(playerid)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				SpawnPlayer(playerid);
				SendClientMessage(playerid, COLOR_GREEN, "Voc� pagou a fian�a no valor de $1500 e foi solto.");
				TrocarBankmoney(PlayerName(playerid), PegarBankmoney(PlayerName(playerid)) - 1500);
				return 1;
			}
		}
	}

	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
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
				    TrocarPrisao(PlayerName(plid), 0);
				    Presos[plid] = 0;
				    SetSpawnInfo(plid,0,PegarSkin(PlayerName(plid)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				    SpawnPlayer(plid);
				    SendClientMessage(plid,COLOR_GREEN,"Voc� foi solto, mas se cometer mais crimes, pagar� novamente.");
	   				PrisaoTimer[playerid][1]=0;
					KillTimer(PrisaoTimer[playerid][0]);
				    format(tmp,sizeof(tmp),"Voc� foi solto por %s",PlayerName(playerid));
				    SendClientMessage(plid,COLOR_GREEN,tmp);
				    SendClientMessage(playerid,COLOR_GREEN,"Libertado");
				    Contrabando[playerid] = 0;
					SetPlayerWantedLevel(plid, 0);
					TrocarWantedLevel(PlayerName(plid), 0);
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o � Juiz/Sheriff");
			return 1;
		}
	}
	if(strcmp(cmd, "/cone", true) == 0) {
 		if(Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || IsPlayerAdmin(playerid)){
 		    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
 		        SendClientMessage(playerid, COLOR_RED, "Voc� tem que estar fora do carro");
 		        return 1;
 		    }
          	new Float:X, Float:Y, Float:Z;
            GetPlayerPos(playerid,X, Y, Z);
			CreateObject(1238,X, Y, Z, 0, 0, 0);
            SendClientMessage(playerid, COLOR_GREEN, "Voce adicionou um cone neste local");
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Voce nao � Policial Rodoviario");
            return 1;
		}
	}
	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
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
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� querendo multar de forma justa.");
				return 1;
			}
			distancia = GetDistanceBetweenPlayers(playerid, plid);
		 	if(distancia > 15){
			    SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
				return 1;
			}
			if(Profissao[plid] == COP_MILITAR || Profissao[plid] == COP_RODOVIARIO || Profissao[plid] == COP_SWAT){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode se multar.");
				return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "Voc� recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(playerid, COLOR_GREEN, "Multa dada.");
				TrocarBankmoney(PlayerName(plid), PegarBankmoney(PlayerName(plid)) - quant);
				GivePlayerMoney(playerid, 50);
				if(JogadorMultado[plid]==0){
				    JogadorMultado[plid]=1;
				    SetTimerEx("ZerarJogadorMultado",130000,false,"d",plid);
					AcrescentarExPoints(playerid,1);
					return 1;
				} else {
			    	SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
					return 1;
				}
			} else {
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
				return 1;
			}
		}
	}
	if (strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
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
				format(string, sizeof(string), "Voc� est� sendo perseguido pela policia, Voc� foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SetPlayerWantedLevel(plid,GetPlayerWantedLevel(plid)+1);
				TrocarWantedLevel(PlayerName(plid), PegarWantedLevel(PlayerName(plid)) + 1);
				return 1;
			} else {
	            SendClientMessage(playerid, COLOR_RED, "Comando desconhecido pelo mode.");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
			return 1;
		}
	}

	if (strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_MILITAR || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_SWAT || Profissao[playerid] == COP_NARCOTICOS || Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)){
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
				SendClientMessage(plid, COLOR_GREEN, "Voc� foi retirado da lista de procurados");
				SetPlayerWantedLevel(plid,GetPlayerWantedLevel(plid)-1);
				TrocarWantedLevel(PlayerName(plid), -1);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
			return 1;
		}
	}
	
	if(!strcmp(cmd,"/assaltar",true)) {
	    if(Profissao[playerid] != ASSALTANTE && !IsPlayerAdmin(playerid)) {
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o pode executar esse comando");
	        return 1;
	    }
		if(AreaBanco[playerid] == 0) {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um banco!");
		    return 1;
		}
       	if(Assalto[playerid] == 1) {
       	    SendClientMessage(playerid,COLOR_RED,"Calma! Voc� n�o pode assaltar novamente em um prazo t�o curto!");
       	    return 1;
		}
		new rand;
		rand = random(2);
		new randcash = random(2000);
		new msg[256];
		GivePlayerMoney(playerid,randcash);
		format(msg,256,"Voc� conseguiu roubar $%d do banco",randcash);
		SendClientMessage(playerid,COLOR_AZULPLUS,msg);
		AcrescentarExPoints(playerid,1);
		Assalto[playerid]++;
		SetTimerEx("AssaltoFim",120000,false,"d",playerid);
		if(rand == 0) {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o conseguiu efetuar um bom roubo. Os policiais foram avisados.");
		    format(msg,256,"%s suspeito de um assalto a banco nas proximidades de %s.",PlayerName(playerid));
		    SendClientMessagePolicia(COLOR_COP_SWAT,msg);
		    return 1;
		}
		SendClientMessage(playerid,COLOR_RED,"Voc� � profissional na arte de assaltar bancos. Os policiais n�o sabem de nada!");
		return 1;
	}
	if(!strcmp(cmd,"/roubar",true)) {
	    if(Profissao[playerid] != ASSALTANTE && !IsPlayerAdmin(playerid)) {
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o pode executar esse comando");
	        return 1;
	    }
 	    new tmp[256];
   		new plid,dist;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/roubar [id]");
			return 1;
		}
       	plid = strval(tmp);
       	if(RouboMao[playerid] == 1) {
       	    SendClientMessage(playerid,COLOR_RED,"Calma! Voc� n�o pode roubar novamente em um prazo t�o curto!");
       	    return 1;
		}
       	if(!IsPlayerConnected(plid)) {
       	    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado");
       	    return 1;
       	}
	    dist = GetDistanceBetweenPlayers(playerid, plid);
	    if(dist > 12) {
	        SendClientMessage(playerid,COLOR_RED,"Chegue mais perto para efetuar o roubo");
	        return 1;
		}
		new rand;
		rand = random(2);
		if(rand == 0) {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o conseguiu roubar a v�tima. V� se na pr�xima leva mais sorte!");
		    new msg[256];
		    format(msg,256,"%s tentou te roubar, mas fracassou.",PlayerName(playerid));
		    SendClientMessage(plid,COLOR_AZULPLUS,msg);
		    return 1;
		}
		new cash = GetPlayerMoney(plid);
		if(cash < 20) {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o pode roubar um p�-rapado sem um tost�o furado no bolso.");
		    SendClientMessage(playerid,COLOR_YELLOW,"V� arranjar algu�m com mais grana para roubar!");
		    return 1;
		}
		new randcash = random(cash);
		new msg[256];
		GivePlayerMoney(playerid,randcash);
		GivePlayerMoney(plid,-randcash);
		format(msg,256,"Voc� conseguiu roubar $%d de %s",randcash,PlayerName(plid));
		SendClientMessage(playerid,COLOR_AZULPLUS,msg);
		format(msg,256,"%s conseguiu te roubar $%d",PlayerName(playerid),randcash);
		SendClientMessage(plid,COLOR_AZULPLUS,msg);
		AcrescentarExPoints(playerid,1);
		RouboMao[playerid]++;
		SetTimerEx("RouboFim",120000,false,"d",playerid);
		return 1;
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
			        SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
					return 1;
				}
				if(distancia <= 20){
					format(string, sizeof(string), "O exame do baf�metro mostrou: %d mg de alcool no sangue do suspeito.", Bebida[plid]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					SendClientMessage(plid, COLOR_GRAY, string);
					return 1;
				}
			} else {
	            SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial");
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
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode vender armas para voc�!");
				return 1;
			}
			weaponid= strval(tmp);
			if(weaponid< 1 || weaponid > 16 && weaponid< 22 || weaponid > 33){
			    SendClientMessage(playerid, COLOR_RED, "0-46 s�o os ids de armas.");
				return 1;
			}
			else{
			   if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					 if(IsPlayerConnected(plid)){
     				 if(GetPlayerMoney(plid) >= valorarma[weaponid]){
					 Armas[plid] =weaponid;
      				 GivePlayerWeapon(plid, weaponid, armamuni[weaponid]);
					 format(string, sizeof(string), "Voc� compro a arma: %s pelo valor de %d",weaponname[weaponid], valorarma[weaponid] );
   			         SendClientMessage(plid, COLOR_JUIZ, string);
   			         venda = valorarma[weaponid]/10;
   			         GivePlayerMoney(playerid, venda);
   			         GivePlayerMoney(plid, 0-valorarma[weaponid]);
			         SendClientMessage(playerid, COLOR_GREEN, "Arma vendida!!");
			         AcrescentarExPoints(playerid,1);
				 	 return 1;
					 }
					 else{
						SendClientMessage(playerid, COLOR_RED, "O jogador n�o tem dinheiro para pagar a arma!");
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
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o � vendedor de armas!");
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
				SendClientMessage(playerid, COLOR_RED, "Esta Pessoa j� est� Sequestrada!");
				return 1;
			}
			if(Cativeiro[plid] == 1) {
				SendClientMessage(playerid, COLOR_RED, "Esta Pessoa j� est� no Cativeiro!");
				return 1;
			}
			if(Profissao[plid] == ASSASSINO){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode se auto-sequestrar!");
				return 1;
			}
	        if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1) {
		    	if(distancia > 20) {
		    	    SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");				return 1;
				}
				if(distancia <= 20 && Sequestro[plid] != 1 && Cativeiro[plid] != 1) {
   					SendClientMessage(playerid, COLOR_GREEN, "Pessoa Sequestrada!");
					Sequestro[plid] = 1;
					AcrescentarExPoints(playerid,1);
					SendClientMessage(plid, COLOR_RED, "Voc� est� sendo Perseguido para fugir digite /fugir!");
					SendClientMessage(plid, COLOR_RED, "Se n�o FUGIR ou Matar o SEQUESTRADOR ser� sequestrado em 10 minutos!");				return 1;
				}			return 1;
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador no est� conectado/logado");
			}		return 1;
		}
		if(Profissao[playerid] != ASSASSINO){
		    SendClientMessage(playerid, COLOR_GREEN, "Voc� n�o � Assasino!");		return 1;
		}	return 1;
	}

    if(strcmp(cmd, "/resgate", true) == 0 && Cativeiro[playerid] == 1) {
		Sequestro[playerid] = 0;
		Cativeiro[playerid] = 0;
		LogarPlayer(playerid);
		SendClientMessage(playerid, COLOR_GREEN, "Voc� pagou o resgate no valor de $5000 e foi solto.");
		TrocarBankmoney(PlayerName(playerid), PegarBankmoney(PlayerName(playerid)) - 5000);
		for(new i; i < MAX_PLAYERS; i++)
   		{
   		    if(Profissao[i] == ASSASSINO){
				GivePlayerMoney(i, 5000);
				SendClientMessage(i, COLOR_GREEN, "Voc� recebeu a fuga no valor de $5000!");
			}
		}	return 1;
	}

	if(strcmp(cmd, "/fugir", true) == 0) {
		Sequestro[playerid] = 0;
		SendClientMessage(playerid, COLOR_GREEN, "Voc� pagou a fuga no valor de $1500 e conseguiu fugir.");
		TrocarBankmoney(PlayerName(playerid), PegarBankmoney(PlayerName(playerid)) - 1500);
		for(new i; i < MAX_PLAYERS; i++)
   		{
   		    if(Profissao[i] == ASSASSINO){
				GivePlayerMoney(i, 1500);
				SendClientMessage(i, COLOR_GREEN, "Voc� recebeu a fuga no valor de $1500!");
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
			        SendClientMessage(playerid, COLOR_RED, "Voc� est muito longe, chegue mais perto!"); return 1;
				}
				if(distancia <= 50){
				    if(velocidade < 120){
				        new string[MAX_STRING];
						format(string, sizeof(string), "O RADAR mostra: %d KpH de velocidade no carro de %s!", velocidade, PlayerName(plid));
						SendClientMessage(playerid, COLOR_YELLOW, string); return 1;
					}
					if(velocidade > 120){
	        			TrocarBankmoney(PlayerName(plid), PegarBankmoney(PlayerName(plid))- desconto);
					    new string2[MAX_STRING];
					    format(string2, MAX_STRING, "O RADAR mostrou que %s estava a %d KpH e foi dada a multa de $%d para esta pessoa!", PlayerName(plid), velocidade, desconto);
						SendClientMessage(playerid, COLOR_RED, string2);
	        			new string[MAX_STRING];
					    format(string, sizeof(string), "Voc� passou no radar de um policial rodovi�rio a %d KpH, e levou uma multa de $%d por estar acima da velocidade pemitida!", velocidade, desconto);
						SendClientMessage(plid, COLOR_RED, string); return 1;
					} return 1;
				} return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador no est� conectado/logado"); return 1;
			}
		}
		if(Profissao[playerid] != COP_MILITAR || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_SWAT){
		    SendClientMessage(playerid, COLOR_RED, "Voc� n�o � policial"); return 1;
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
			    SendClientMessage(playerid, COLOR_RED, "1-16 e 22-33 s�o os ids de armas.");
				return 1;
			}
			if(!IsPlayerConnected(plid)){
	        	SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado/logado");
				return 1;
			}

			else {
				format(string, sizeof(string), "O Vendedor de armas %s est� lhe oferecendo a arma: %s pelo valor de %d",PlayerName(playerid),weaponname[weaponid]);
	   			SendClientMessage(plid, COLOR_JUIZ, string);
				SendClientMessage(plid, COLOR_GREEN, "Para voc� poder comprar a arma tem que chegar perto dele.");
				SendClientMessage(plid, COLOR_GREEN, "Caso esteja interessado na arma digite: /comprararma e o vendedor ir� vender a arma.");
				SendClientMessage(plid, COLOR_GREEN, "Caso contr�rio digite: /recusararma.");
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
		        SendClientMessage(playerid, COLOR_GREEN, "Ningu�m est� lhe oferencendo arma!");
		        return 1;
		    }
		}
	}

	if(strcmp(cmd, "/revosena-surpresinha",true)==0){
	    if(AreaCreditos[playerid] == 1){
	        if(GetPlayerMoney(playerid) < PRECO_TICKET){
	            SendClientMessage(playerid,COLOR_RED,"Infelizmente voc� n�o tem dinheiro para comprar um bilhete.");
	            return 1;
			}
			new n1,n2,n3,n4,n5,n6,msg[256];
			n1 = minrand(1,60);
			n2 = minrand(1,60);
			while(n2 == n1) n2 = minrand(1,60);
			n3 = minrand(1,60);
			while(n3 == n2 || n3 == n1) n3 = minrand(1,60);
			n4 = minrand(1,60);
			while(n4 == n1 || n4 == n2 || n3 == n4) n4 = minrand(1,60);
			n5 = minrand(1,60);
			while(n5 == n1 || n5 == n2 || n5 == n3 || n5 == n4) n5 = minrand(1,60);
			n6 = minrand(1,60);
			while(n6 == n1 || n6 == n2 || n6 == n4 || n6 == n4 || n6 == n5) n6 = minrand(1,60);
			SendClientMessage(playerid,COLOR_RED2,"...:::MPA Loterias:::...");
			SendClientMessage(playerid,COLOR_YELLOW,"N�meros automaticamente gerados por nosso sistema:");
			format(msg,256,"%d %d %d %d %d %d",n1,n2,n3,n4,n5,n6);
			SendClientMessage(playerid,COLOR_PALHA,msg);
			SendClientMessage(playerid,COLOR_RED2,"Obrigado pela prefer�ncia e boa sorte!");
			ApostandoSena[playerid]=true;
			new a = ApostasSena[playerid];
			ApostaSena[playerid][a][0]=n1;
			ApostaSena[playerid][a][1]=n2;
			ApostaSena[playerid][a][2]=n3;
			ApostaSena[playerid][a][3]=n4;
			ApostaSena[playerid][a][4]=n5;
			ApostaSena[playerid][a][5]=n6;
			ApostasSena[playerid]++;
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em uma loja 24/7!");
		    return 1;
		}
	}
	   
	if(strcmp(cmd, "/revoquina-surpresinha",true)==0){
	    if(AreaCreditos[playerid] == 1){
	        if(GetPlayerMoney(playerid) < PRECO_TICKET){
	            SendClientMessage(playerid,COLOR_RED,"Infelizmente voc� n�o tem dinheiro para comprar um bilhete.");
	            return 1;
			}
			new n1,n2,n3,n4,n5,msg[256];
			n1 = minrand(1,60);
			n2 = minrand(1,60);
			while(n2 == n1) n2 = minrand(1,60);
			n3 = minrand(1,60);
			while(n3 == n2 || n3 == n1) n3 = minrand(1,60);
			n4 = minrand(1,60);
			while(n4 == n1 || n4 == n2 || n3 == n4) n4 = minrand(1,60);
			n5 = minrand(1,60);
			while(n5 == n1 || n5 == n2 || n5 == n3 || n5 == n4) n5 = minrand(1,60);
			SendClientMessage(playerid,COLOR_RED2,"...:::MPA Loterias:::...");
			SendClientMessage(playerid,COLOR_YELLOW,"N�meros automaticamente gerados por nosso sistema:");
			format(msg,256,"%d %d %d %d %d",n1,n2,n3,n4,n5);
			SendClientMessage(playerid,COLOR_PALHA,msg);
			SendClientMessage(playerid,COLOR_RED2,"Obrigado pela prefer�ncia e boa sorte!");
			ApostandoQuina[playerid]=true;
			new a = ApostasQuina[playerid];
			ApostaQuina[playerid][a][0]=n1;
			ApostaQuina[playerid][a][1]=n2;
			ApostaQuina[playerid][a][2]=n3;
			ApostaQuina[playerid][a][3]=n4;
			ApostaQuina[playerid][a][4]=n5;
			ApostasQuina[playerid]++;
			return 1;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em uma loja 24/7!");
		    return 1;
		}
	}
	
	if(strcmp(cmd, "/revosena", true) == 0) {
	    if(!AreaCreditos[playerid]){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em uma loja 24/7");
	        return 1;
		}
	    new no1[256],no2[256],no3[256],no4[256],no5[256],no6[256],iguais;
		no1 = strtok(cmdtext, idx);
		no2 = strtok(cmdtext, idx);
		if(compare(no1,no2)) iguais=1;
		no3 = strtok(cmdtext, idx);
		if(compare(no3,no1) || compare(no3,no2)) iguais = 1;
		no4 = strtok(cmdtext, idx);
		if(compare(no4,no1) || compare(no4,no2) || compare(no4,no3)) iguais=1;
		no5 = strtok(cmdtext, idx);
		if(compare(no5,no1) || compare(no5,no2) || compare(no5,no3) || compare(no5,no4)) iguais=1;
		no6 = strtok(cmdtext, idx);
		if(compare(no6,no1) || compare(no6,no2) || compare(no6,no3) || compare(no6,no4) || compare(no6,no5)) iguais=1;
		if(iguais==1) {
			SendClientMessage(playerid,COLOR_RED,"Informe 5 n�meros DIFERENTES de 1 a 60");
			return 1;
		}
		if(!strlen(no1) || !strlen(no2) || !strlen(no3) || !strlen(no4) || !strlen(no5) || !strlen(no6)){
			SendClientMessage(playerid, COLOR_PALHA, "USE: /revosena [1] [2] [3] [4] [5] [6]");
			return 1;
		}
		if(GetPlayerMoney(playerid) >= PRECO_TICKET){
		    GivePlayerMoney(playerid, -1*PRECO_TICKET);
		    new a = ApostasSena[playerid];
		    ApostandoSena[playerid]=true;
		    ApostaSena[playerid][a][0]=strval(no1);
		    ApostaSena[playerid][a][1]=strval(no2);
		    ApostaSena[playerid][a][2]=strval(no3);
		    ApostaSena[playerid][a][3]=strval(no4);
		    ApostaSena[playerid][a][4]=strval(no5);
		    ApostaSena[playerid][a][5]=strval(no6);
		    ApostasSena[playerid]++;
		    new string[256];
		    format(string, sizeof(string), "Seus n�meros da loteria: %d, %d, %d, %d, %d, %d", strval(no1), strval(no2), strval(no3), strval(no4), strval(no5), strval(no6));
            SendClientMessage(playerid, COLOR_PALHA, string);
            SendClientMessage(playerid,COLOR_ROSA,"Obrigado pela prefer�ncia e volte sempre!");
            return 1;
		} else {
		    new string[256];
		    format(string, sizeof(string), "Sem grana! Um bilhete custa: %d",PRECO_TICKET);
            SendClientMessage(playerid, COLOR_PALHA, string);
  		    return 1;
		}
	}
	if(strcmp(cmd, "/revoquina", true) == 0) {
	    if(!AreaCreditos[playerid]){
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em uma loja 24/7");
	        return 1;
		}
	    new no1[256],no2[256],no3[256],no4[256],no5[256],iguais;
		no1 = strtok(cmdtext, idx);
		no2 = strtok(cmdtext, idx);
		if(compare(no1,no2)) iguais=1;
		no3 = strtok(cmdtext, idx);
		if(compare(no3,no1) || compare(no3,no2)) iguais = 1;
		no4 = strtok(cmdtext, idx);
		if(compare(no4,no1) || compare(no4,no2) || compare(no4,no3)) iguais=1;
		no5 = strtok(cmdtext, idx);
		if(iguais==1) {
			SendClientMessage(playerid,COLOR_RED,"Informe 5 n�meros DIFERENTES de 1 a 60");
			return 1;
		}
		if(!strlen(no1) || !strlen(no2) || !strlen(no3) || !strlen(no4) || !strlen(no5)){
			SendClientMessage(playerid, COLOR_PALHA, "USE: /revoquina [1] [2] [3] [4] [5]");
			return 1;
		}
		if(GetPlayerMoney(playerid) >= PRECO_TICKET/2){
		    GivePlayerMoney(playerid, -1*PRECO_TICKET/2);
		    new a = ApostasQuina[playerid];
		    ApostandoQuina[playerid]=true;
		    ApostaQuina[playerid][a][0]=strval(no1);
		    ApostaQuina[playerid][a][1]=strval(no2);
		    ApostaQuina[playerid][a][2]=strval(no3);
		    ApostaQuina[playerid][a][3]=strval(no4);
		    ApostaQuina[playerid][a][4]=strval(no5);
		    ApostasQuina[playerid]++;
		    new string[256];
		    format(string, sizeof(string), "Seus n�meros da loteria: %d, %d, %d, %d, %d", strval(no1), strval(no2), strval(no3), strval(no4), strval(no5));
            SendClientMessage(playerid, COLOR_PALHA, string);
            SendClientMessage(playerid,COLOR_ROSA,"Obrigado pela prefer�ncia e volte sempre!");
            return 1;
		} else {
		    new string[256];
		    format(string, sizeof(string), "Sem grana! Um bilhete custa: %d",PRECO_TICKET/2);
            SendClientMessage(playerid, COLOR_PALHA, string);
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
				SendClientMessage(playerid, COLOR_RED, "/setjob [id] [prof]");
				return 1;
			}
	        prof = strval(tmp);
	        if(IsPlayerConnected(plid)){
	        if(IsPlayerInAnyVehicle(plid)) RemovePlayerFromVehicle(playerid);
        	if(prof > 0 && prof < 41 ){
					TrocarProf(PlayerName(plid), prof);
					format(string, sizeof(string), "Voc� mudou a profiss�o de %s para %s." , PlayerName(plid), ProfExtName[prof]);
					SendClientMessage(playerid, COLOR_GREEN, string);
					SendClientMessage(plid, COLOR_GREEN, "digite /profissao.");
        	     	SendClientMessage(plid, COLOR_ROSA, "digite /regras1 e /regras2");
            		SendClientMessage(playerid, COLOR_ROSA, "digite /regras1 e /regras2");
					Profissao[plid] = prof;
					TrocarSkin(PlayerName(plid),ProfSkin[prof]);
					LogarPlayer(plid);
					SetPlayerPos(plid,ProfPos[prof][0],ProfPos[prof][1],ProfPos[prof][2]);
					format(string,sizeof(string),"~w~%s",ProfGT[prof]);
					GameTextForPlayer(plid,string,3000,3);
				    return 1;
					} else {
				    SendClientMessage(playerid, COLOR_RED, "Essa n�o � uma profisss�o v�lida!");
					return 1;
				}
			} else {
			    SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso!");
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
					return 1;
				}
			}
		}
	}
	
	if (strcmp(cmdtext, "/profissao", true)==0){
	    if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_RED2, "Barman - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/cerveja [id] [teor] : Vender cerveja, pode ser detectado  no  sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/whisky [id] [teor] : Vender whisky, pode detectar no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/pinga [id] [teor] : Vender pinga, pode ser detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/guarana [id] [copos] : Vender guaran�, n�o � detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_GREEN, "Cuidado! Se a policia pegar o seu cliente dirigindo b�bado, ele vai preso! Avise-o.");
  	    }
  	      else if(Profissao[playerid] == ASSASSINO) {
			SendClientMessage(playerid, COLOR_RED2, "Assassino - Comandods:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/sequestrar [id] : sequestra 1 pessoa para ganhar $$!");
			SendClientMessage(playerid, COLOR_WHITE, "Apenas mate e ganhe $$");
		}
          else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_RED2,  "Vendedor de Ve�culos - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/setcar [id-do-carro] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posi��o de spawn).");
			SendClientMessage(playerid, COLOR_WHITE, "/trocardono [id]: troca o dono do ve�culo");
			SendClientMessage(playerid, COLOR_WHITE, "Aten��o: Na hora de setar carros, NUNCA use �ngulo, pois o servidor poder� travar.");
			SendClientMessage(playerid, COLOR_WHITE, "N�o se preocupe quanto ao �ngulo, pois o nosso script o pega para voc�!");
        }
          else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_RED2, "Corretor de Im�veis - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/casa [nick] : Seta a casa para algu�m (esteja na posi�ao exterior � casa).");
        }
          else if(Profissao[playerid] == SEGURAN�A) {
			SendClientMessage(playerid, COLOR_RED2, "Seguran�a - Comandos:");
 	    	SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
 	    	SendClientMessage(playerid, COLOR_WHITE, "Sem comandos especiais, procure um jornalista e anuncie seus servi�os.");
  	   }
          else if(Profissao[playerid] == MOTORISTA) {
		    SendClientMessage(playerid, COLOR_RED2, "Motorista Particular - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	    	SendClientMessage(playerid, COLOR_WHITE, "Sem comandos especiais, seus clientes poder�o digitar /motorista para solicitar um, como voc�.");
       }
          else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		    SendClientMessage(playerid, COLOR_RED2, "Motorista de �nibus - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	    	SendClientMessage(playerid, COLOR_WHITE, "Tarifa autom�tica, ao entrar o passageiro pagar�.");
       }
	      else if(Profissao[playerid] == CAMINHONEIRO) {
		    SendClientMessage(playerid, COLOR_RED2, "Caminhoneiro - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/carregar: para carregar o caminhao, antes de seguir viagem");
	    	SendClientMessage(playerid, COLOR_WHITE, "/descarregar: ao chegar no local de destino descarregue o caminh�o e receba o frete.");
       }
          else if(Profissao[playerid] == CACADOR) {
		    SendClientMessage(playerid, COLOR_RED2, "Ca�ador - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/cacar : Come�ar a ca�ar, esteja na �rea de Ca�a.");
        	SendClientMessage(playerid, COLOR_WHITE, "/vendercaca : Vende seu pescado para a Cooperativa de Ca�a, estando nela.");
       }
          else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COLOR_RED2, "Pescador - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
	    	SendClientMessage(playerid, COLOR_WHITE, "/pescar : Joga a rede para pescar, voc� deve estar na �rea de pesca.");
        	SendClientMessage(playerid, COLOR_WHITE, "/venderpesca : Vende seu pescado em uma cooperativa, voc� deve estar em uma.");
       }
	      else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
		    SendClientMessage(playerid, COLOR_RED2, "Entregador de Pizza - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/pizza: para vender uma pizza � um cliente");
	    	SendClientMessage(playerid, COLOR_WHITE, "Para pedir uma pizza, os clientes podem digitar /telepizza.");
       }
  	      else if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_RED2, "Taxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/ttaxi [id] : Come�a a rodar o tax�metro (o passageiro tem que estar no seu carro).");
			SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de taxi pelo comando /taxi");
  	   }
          else if(Profissao[playerid] == MOTOTAXI) {
			SendClientMessage(playerid, COLOR_RED2,  "Mototaxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/mtaxi [id] : Come�a a cobran�a da viagem.");
	        SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de mototaxi pelo comando /mototaxi [local].");
	   }
	      else if(Profissao[playerid] == TAXI_AEREO) {
			SendClientMessage(playerid, COLOR_RED2,  "Mototaxista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/artaxi [id] : A viagem come�ara a ser tarifada para o passsageiro.");
		    SendClientMessage(playerid, COLOR_WHITE, "Os passageiros entram em contato a cooperativa de taxi aereo pelo comando /taxiaereo [local]");
       }
	      else if(Profissao[playerid] == INSTRUTOR) {
			SendClientMessage(playerid, COLOR_RED2, "Instrutor de Dire��o - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�");
			SendClientMessage(playerid, COLOR_WHITE, "/habaerea : Habilita uma pessoa a dirigir ve�culos aereos (avi�es e helicopteros).");
			SendClientMessage(playerid, COLOR_WHITE, "/habterrestre : Habilita uma pessoa a dirigir ve�culos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_WHITE, "/habnautica : Habilita uma pessoa a dirigir ve�culos nauticos (barcos).");
			SendClientMessage(playerid, COLOR_WHITE, "/carteiras : ver o valor das carteiras.");
	   }
          else if(Profissao[playerid] == TRAFICANTE) {
			SendClientMessage(playerid, COLOR_RED2, "Traficante - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/maconha [id] [teor] : Vender  maconha, pode ser detectado  no  sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/cocaina [id] [teor] : Vender  cocaina, pode detectar no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/heroina[id] [teor] : Vender hero�na, pode ser detectado no sangue da pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/Cuidado! Se a organiza��o NARC�TICOS te pegar em flagrante vendendo drogas, voc� ser� preso!");
  	   }
          else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COLOR_RED2, "Jornalista - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/noticia: publicar uma noticia. Ex:empregos(informado pelo ADM), e o que acontence em de San Andreas");
       }
          else if(Profissao[playerid] == PARAMEDICO) {
		    SendClientMessage(playerid, COLOR_RED2, "Param�dico - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	    	SendClientMessage(playerid, COLOR_WHITE, "/curativo [id]: faz o tratamento necess�rio ao paciente.");
            SendClientMessage(playerid, COLOR_WHITE, "/192: telefone de emergencia, para chamar uma ambulancia.");
	   }
 	      else if(Profissao[playerid] == ADVOGADO) {
			SendClientMessage(playerid, COLOR_RED2, "Advogado - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
            SendClientMessage(playerid, COLOR_WHITE, "/advogado: este � comando utilizado pelos seus clientes para entrar em contato com voc�.");
            SendClientMessage(playerid, COLOR_WHITE, "/defesa: recebe pela defesa judicial,seus honor�rios ser�o 40% do valor da causa [informe seu cliente].");
            SendClientMessage(playerid, COLOR_WHITE, "/processo: entrar com a peti��o e faz a defesa de seu cliente, feito isto aguarde o sente�a do juiz.");
       }
	      else if(Profissao[playerid] == COP_MILITAR) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Militar - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : ve o n�vel de alcool no sangue de alguem | /multar [id] [quantia] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador pe�a para ele digitar /render | /reforco: pede refor�o a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede refor�o a todos os cops.");
      }
	      else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_RED2,  "Policial Rodovi�rio - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/prende [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : ve o n�vel de alcool no sangue de alguem | /multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador pe�a para ele digitar /render | /reforco: pede refor�o a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede refor�o a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/cone: cria um cone para a blitz policial.");
  	  }
          else if(Profissao[playerid] == COP_FLORESTAL) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Florestal - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/prendercaca: apreende uma ca�a feita ilegalemnte.| /verpesca: para saber se a pessoa est� pescando ou n�o");
            SendClientMessage(playerid, COLOR_WHITE, "/prenderpesca apreende uma pesca feita ilegalemnte./vercaca: para saber se a pessoa est� pescando ou n�o.");
			SendClientMessage(playerid, COLOR_WHITE, "/piracemaon: come�a o per�odo da piracema|/piracemaoff: finaliza periodo da piracema.");
        	SendClientMessage(playerid, COLOR_WHITE, "/cacaon: legaliza perido de ca�a|/cacaoff: finaliza periodo de ca�a.");
	        SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	  }
	      else if(Profissao[playerid] == COP_SWAT) {
			SendClientMessage(playerid, COLOR_RED2, "Policial Elite/SWAT - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento. | /armas para ver porte de armas");
			SendClientMessage(playerid, COLOR_WHITE, "/exame [id] : ve o n�vel de intorpecentes no sangue de alguem | /radar: liga o radar movel.");
            SendClientMessage(playerid, COLOR_WHITE, "/bafometro [id] : ve o n�vel de alcool no sangue de alguem | /multar [id] [amount] : Multar uma pessoa.");
			SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador pe�a para ele digitar /render | /reforco: pede refor�o a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede refor�o a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/cone: cria um cone para a blitz policial.");
	   }
  	      else if(Profissao[playerid] == COP_NARCOTICOS) {
  	        SendClientMessage(playerid, COLOR_RED2, "Narc�ticos - Comandos:");
  			SendClientMessage(playerid, COLOR_WHITE, "/exame [id] : Ver se o ind�viduo tem droga no corpo.");
        	SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
	        SendClientMessage(playerid, COLOR_WHITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_WHITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
	        SendClientMessage(playerid, COLOR_WHITE, "Quando for abordar um jogador pe�a para ele digitar /render | /reforco: pede refor�o a todos os cops.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede refor�o a todos os cops.");
	  }
          else if(Profissao[playerid] == JUIZ) {
		    SendClientMessage(playerid, COLOR_RED2, "Ju�z - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia at� o t�rmino do julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar[id] : ap�s seu veredicto, voc� usa este comando para determinar a soltura do r�u..");
			SendClientMessage(playerid, COLOR_WHITE, "/veredicto: Para determianr a sente�a do r�u culpado ou inocente.| /armas para ver porte de armas");
   	  }
          else if(Profissao[playerid] == SHERIFF  ) {
		    SendClientMessage(playerid, COLOR_RED2, "Xerife - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_WHITE, "/prender [id] : Prende uma pessoa na cadeia at� o t�rmino do julgamento.");
			SendClientMessage(playerid, COLOR_WHITE, "/soltar[id] : voc� usa este comando para tirar da cadeia o criminoso.");
			SendClientMessage(playerid, COLOR_WHITE, "/ordem: Para ordenar outros oficiais a comprirem uma miss�o.| /armas para ver porte de armas.");
        	SendClientMessage(playerid, COLOR_WHITE, "/porte1: Concede porte de armas na categoria 1 armas leves.para policia militar e civis confi�veis.");
	        SendClientMessage(playerid, COLOR_WHITE, "/porte2: Concede porte de armas na categoria 2 armas pesadas,somente Swat e Cop rodovi�rio.");
	        SendClientMessage(playerid, COLOR_WHITE, "/reforco: pede refor�o a todos os cops.");
		}
  	      else if(Profissao[playerid] == LIXEIRO) {
  	        SendClientMessage(playerid, COLOR_RED2, "Lixeiro - Comandos:");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/coletarlixo : Iniciar miss�o de cole��o de lixo.");
        	SendClientMessage(playerid, COLOR_WHITE, "/lixao : Deposita o lixo coletado com \"/coletarlixo\" no Lix�o.");
		}
  	      else if(Profissao[playerid] == TRANSPORTE_DE_VALORES) {
 	        SendClientMessage(playerid, COLOR_RED2, "Transportador de Valores - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/transportar : Transporta a grana do Banco Central 24/7 de LV para os outros bancos.");
        	SendClientMessage(playerid, COLOR_WHITE, "/depositargrana : Deposita a grana em qualquer banco estando no mesmo.");
        	SendClientMessage(playerid, COLOR_WHITE, "/escolta : Pede ajuda a pol�cia para escoltar o dinheiro.");
	  }
  	      else if(Profissao[playerid] == CONTRABANDISTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Contrabandista - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
		 	SendClientMessage(playerid, COLOR_WHITE, "/contrabando : Inicia o contrabando na Ponte principal de SF perto da boate do Jizzys.");
		 	SendClientMessage(playerid, COLOR_WHITE, "/cancelarcontrabando : cancela o contrabando!");
	  }
  	      else if(Profissao[playerid] == RECEITA_FEDERAL) {
 	        SendClientMessage(playerid, COLOR_RED2, "Receita Federal - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
 			SendClientMessage(playerid, COLOR_WHITE, "/apreendercontrabando [id] : Cancela o contrabando de mercadoria! Na maioria das vezes ocorre em SF.");
 			SendClientMessage(playerid, COLOR_WHITE, "No navio ancorado perto da Ponte e da boate.");
	  }
  	      else if(Profissao[playerid] == AGRICULTOR) {
 	        SendClientMessage(playerid, COLOR_RED2, "Agricultor - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/plantarmilho : Planta o milho no campo.");
          	SendClientMessage(playerid, COLOR_WHITE, "/vendermilho : Vende o milho colhido na FAZENDA.");
	  }
  	      else if(Profissao[playerid] == LADRAO_DE_CARROS) {
 	        SendClientMessage(playerid, COLOR_RED2, "Ladr�o de Carros - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/desmanche : Vende o carro para o desmanche");
  			SendClientMessage(playerid, COLOR_WHITE, "/veiculosdesmanche : mostra o ve�culo que o beco quer!");
	  }
  	      else if(Profissao[playerid] == ASSALTANTE) {
 	        SendClientMessage(playerid, COLOR_RED2, "Assaltante - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/assaltar : Chegue em um banco, digite depois fuja.");
  			SendClientMessage(playerid, COLOR_WHITE, "/roubar : Para assaltar 1 Jogador.");
        	SendClientMessage(playerid, COLOR_WHITE, "Para roubar Carros-Fortes, basta entrar nele quanto estiver carregado de $$.");
	  }
	      else if(Profissao[playerid] == FRENTISTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "FRENTISTA - Comandos:");
 	        SendClientMessage(playerid, COLOR_WHITE, "/colocargas [id] [quantia] : Coloca gasolina no carro de um jogador, sujeito a cobran�a.");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
	  }
  	      else if(Profissao[playerid] == LOCADOR_DE_CARROS) {
 	        SendClientMessage(playerid, COLOR_RED2, "Locador de carros - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/alugarcarro [id] : Quando um pessoa pedir um carro ofere�a os dispon�veis na");
        	SendClientMessage(playerid, COLOR_WHITE, "locadora quando a pessoa entrar no carro digite e ele pensar�.");
	  }
  	      else if(Profissao[playerid] == PEDREIRA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Carregador da Pedreira - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/carregarcaminhao : Carrega o caminh�o na Pedreira!");
        	SendClientMessage(playerid, COLOR_WHITE, "/descarregarcamminhao : Descarrega o caminh�o na obra que fica em SF!");
	  }
	      else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
 	        SendClientMessage(playerid, COLOR_RED2, "Vendedor de Armas  - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/venderarma [id] [idarma] : Vende alguma arma para o jogador.");
        	SendClientMessage(playerid, COLOR_WHITE, "/oferecerarma [id] [idarma] : Oferece alguma arma ao jogador ele tem que estar perto para receber.");
        	SendClientMessage(playerid, COLOR_WHITE, "/armas : ver o id e o valor das armar");
	  }
		  else if(Profissao[playerid] == MECANICO) {
		    SendClientMessage(playerid,COLOR_RED2,"Mec�nico - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
		    SendClientMessage(playerid,COLOR_WHITE,"/consertar : Conserta o carro em que voc� estiver dirigindo.");
		    SendClientMessage(playerid,COLOR_WHITE,"/pintarcarro : Pinta o carro com cores diferentes!");
		    SendClientMessage(playerid,COLOR_WHITE,"Aten��o: Como os carros n�o d�o RESPAWN, voc� tem que fazer o reboque deles.");
		    SendClientMessage(playerid,COLOR_WHITE,"Voc� pode alternar em n�o cobrar ou cobrar. Se cobrar ser� pago $50. Para rebocar basta");
		    SendClientMessage(playerid,COLOR_WHITE,"chegar com o Reboque na frente do ve�culo e apertar CTRL, automaticamente o carro ser� guinchado.");
	  }
 		  else if(Profissao[playerid] == PROSTITUTA) {
 	        SendClientMessage(playerid, COLOR_RED2, "Prostituta  - Comandos:");
 			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
  			SendClientMessage(playerid, COLOR_WHITE, "/strip-tease [id]: Oferece um strip-tease na boate!");
        	SendClientMessage(playerid, COLOR_WHITE, "/transarcama [id]: Oferece uma transa na cama de um hotel.");
        	SendClientMessage(playerid, COLOR_WHITE, "/mudarposicao [1-4]: Troca a posi��o na hora do sexo!");
	  }
	      else{
			SendClientMessage(playerid, COLOR_GREEN, "Profiss�o sem comandos especiais");
			SendClientMessage(playerid, COLOR_WHITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que t�m a mesma profiss�o que voc�.");
			SendClientMessage(playerid, COLOR_GREEN, "Desculpe-nos, sua profiss�o n�o tem nenhum comando especial ainda, estamos trabalhando para isto.");
		}
		return 1;
	}
	if(compare(cmd,"/trocarpos")){
	    if(!IsPlayerAdmin(playerid)){
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem privil�gios de administrador!");
			return 1;
		}
		new vid = GetPlayerVehicleID(playerid);
		if(!vid){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em nenhum ve�culo!");
		    return 1;
		}
		new Float:x,Float:y,Float:z,Float:ang;
		GetVehiclePos(vid,x,y,z);
		GetVehicleZAngle(vid,ang);
		new model = GetVehicleModel(vid);
		new query[256],rl[256],fi[256];
		format(query,256,"UPDATE cars SET x = '%f', y = '%f', z = '%f', ang = '%f' WHERE id = %d",x,y,z,ang,vid);
		samp_mysql_query(query);
		new cor1,cor2;
		format(query,sizeof query,"SELECT cor1,cor2 FROM cars WHERE id = %d",vid);
		samp_mysql_query(query);
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(rl)){
			samp_mysql_strtok(fi,"|",rl);
			cor1 = strval(fi);
			samp_mysql_strtok(fi,"|","");
			cor2 = strval(fi);
		}
		RemovePlayerFromVehicle(playerid);
		DestroyVehicle(vid);
		CreateVehicle(model,x,y,z,ang,cor1,cor2,-1);
		new Float:pX, Float:pY, Float:pZ;
		GetPlayerPos(playerid,pX,pY,pZ);
		SetSpawnInfo(playerid,0,GetPlayerSkin(playerid),pX,pY,pZ,0,0,0,0,0,0,0);
		SpawnPlayer(playerid);
        SetTimerEx("ColocarNoVeiculoMot",1000,0,"dd",playerid,vid);
		SendClientMessage(playerid,COLOR_COP_SWAT,"Cor alterada com sucesso!");
		return 1;
	}
	if(compare(cmd,"/trocarmodelo")){
	    if(!IsPlayerAdmin(playerid)){
			SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem privil�gios de administrador!");
			return 1;
		}
		new tmp[256],model;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COLOR_RED,"/trocarmodelo [modelo]");
		    return 1;
		}
		model = strval(tmp);
		if(!IsValidModel(model)){
		    SendClientMessage(playerid,COLOR_RED,"Modelo inv�lido");
		    return 1;
		}
		new query[256],rl[256],fi[128],Float:coord[4],cor1,cor2;
		new vid = GetPlayerVehicleID(playerid);
		if(!vid){
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em nenhum ve�culo!");
		    return 1;
		}
		new Float:X,Float:Y,Float:Z,Float:ang;
		GetVehiclePos(vid,X,Y,Z);
		GetVehicleZAngle(vid,ang);
		format(query,sizeof query,"SELECT cor1,cor2,x,y,z,ang FROM cars WHERE id = %d",vid);
		samp_mysql_query(query);
		samp_mysql_store_result();
		while(samp_mysql_fetch_row(rl)){
			samp_mysql_strtok(fi,"|",rl);
			cor1 = strval(fi);
			samp_mysql_strtok(fi,"|","");
			cor2 = strval(fi);
			new ct;
			while(samp_mysql_strtok(fi,"|","")){
				coord[ct]=strval(fi);
				ct++;
			}
		}
		PRIV_sqlset("cars","modelid",IntToStr(model),PRIV_FWI(vid));
		RemovePlayerFromVehicle(playerid);
		DestroyVehicle(vid);
		CreateVehicle(model,coord[0],coord[1],coord[2],coord[3],cor1,cor2,-1);
		new Float:pX, Float:pY, Float:pZ;
		GetPlayerPos(playerid,pX,pY,pZ);
		SetSpawnInfo(playerid,0,GetPlayerSkin(playerid),pX,pY,pZ,0,0,0,0,0,0,0);
		SpawnPlayer(playerid);
        SetTimerEx("ColocarNoVeiculoMot",1000,0,"dd",playerid,vid);
		SetTimerEx("SetarPosicaoDoVeiculo",1150,0,"dffff",vid,X,Y,Z,ang);
		SendClientMessage(playerid,COLOR_AZULPLUS,"Modelo alterado com sucesso!");
		return 1;
	}
	
	if(strcmp(cmd,"/consertar",true)==0){
	    if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	        if(IsPlayerInAnyVehicle(playerid)){
	            new vehid = GetPlayerVehicleID(playerid);
	        	new placa[256];
				placa = PRIV_sqlget("cars","placa",PRIV_FWI(vehid));
				SetVehicleNumberPlate(vehid,placa);
				new Float:X,Float:Y,Float:Z,Float:ang;
				GetVehiclePos(vehid,X,Y,Z);
				GetVehicleZAngle(vehid,ang);
				SetVehicleToRespawn(vehid);
				SetTimerEx("ColocarNoVeiculoMot",700,0,"dd",playerid,vehid);
				SetTimerEx("SetarPosicaoDoVeiculo",850,0,"dffff",vehid,X,Y,Z,ang);
				if(VeiculoConsertado[vehid] == 0){
					AcrescentarExPoints(playerid,1);
					VeiculoConsertado[vehid]=1;
					SetTimerEx("ZerarCarroConsertado",30000,false,"d",vehid);
				}
			} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um ve�culo!");
		} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o � mec�nico!");
		return 1;
	}
	
    if(strcmp(cmd,"/pintarcarro",true)==0){
		if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
			if(IsPlayerInAnyVehicle(playerid)){
	            new vehid = GetPlayerVehicleID(playerid);
	           	new rand = random(126);
				new rand1 = random(126);
				SetVehicleHealth(vehid,1000.0);
				SaveColor(vehid,rand,rand1);
				ChangeVehicleColor(vehid,rand,rand1);
				SendClientMessage(playerid,COLOR_MECANICO,"Cor colocada");
				if(VeiculoPintado[vehid]==0){
				    VeiculoPintado[vehid]=1;
					SetTimerEx("ZerarVeiculoPintado",30000,false,"d",vehid);
					AcrescentarExPoints(playerid,1);
				}
  			} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um ve�culo!");
		} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o � mec�nico!");
		return 1;
	}
	
	if(strcmp(cmd,"/trocarcores",true)==0){
		if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
			if(IsPlayerInAnyVehicle(playerid)){
	            new vehid = GetPlayerVehicleID(playerid);
				new rand,rand1,tmp[256];
				tmp = strtok(cmdtext,idx);
				if(!strlen(tmp)){
				    SendClientMessage(playerid,COLOR_RED,"/trocarcores [cor1] [cor2]");
				    return 1;
				}
				rand = strval(tmp);
				tmp = strtok(cmdtext,idx);
				if(!strlen(tmp)){
				    SendClientMessage(playerid,COLOR_RED,"/trocarcores [cor1] [cor2]");
				    return 1;
				}
				rand1 = strval(tmp);
				SaveColor(vehid,rand,rand1);
				SetVehicleHealth(vehid,1000.0);
				ChangeVehicleColor(vehid,rand,rand1);
				SendClientMessage(playerid,COLOR_MECANICO,"Cor colocada");
				if(VeiculoPintado[vehid]==0){
				    VeiculoPintado[vehid]=1;
					SetTimerEx("ZerarVeiculoPintado",30000,false,"d",vehid);
					AcrescentarExPoints(playerid,1);
				}
  			} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um ve�culo!");
		} else SendClientMessage(playerid,COLOR_RED,"Voc� n�o � mec�nico!");
		return 1;
	}

	if (strcmp(cmd, "/say", true)==0){
		new tmp[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "/say [texto]");
			return 1;
		}
		for(new i=0; i<MAX_PLAYERS; i++) if(GetDistanceBetweenPlayers(playerid, i) < 10) SendPlayerMessageToPlayer(i,playerid,tmp);
		return 1;
	}

	if(strcmp(cmd, "/m", true)==0){
		if(Profissao[playerid] == SHERIFF || IsPlayerAdmin(playerid)) {
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
		    SendClientMessage(playerid,COLOR_RED,"N�o tens permiss�o!");
		    return 1;
		}
	}
	
	if(strcmp(cmd, "/matrakeitions",true)==0 && IsPlayerInAnyVehicle(playerid)){
	    new id = GetPlayerVehicleID(playerid);
	    new model = GetVehicleModel(id);
	    switch(model){
	        case 581,523,462,521,463,522,461,448,468,586: AddVehicleComponent(id,1010);
		}
		return 1;
	}
	if(strcmp(cmd, "/danipireskeitions",true)==0 && IsPlayerInAnyVehicle(playerid)){
	    if((compare("[MPA]DaniPiresk", PlayerName(playerid)) == 1) || (compare("[MPA]matraka_IDG", PlayerName(playerid)) == 1)) {
		    new id = GetPlayerVehicleID(playerid);
			AddVehicleComponent(id, 1010);
			AddVehicleComponent(id, 1098);
			ChangeVehicleColor(id, 7, 7);
			AddVehicleComponent(id, 1087);
			SaveColor(id,7,7);
			SaveTuning(id, 1, 1010);
			SaveTuning(id, 16, 1098);
			SaveTuning(id, 12, 1087);
			SendClientMessage(playerid,COLOR_RED,"Tunado xD");
  		} else {
  		    new msg[256];
  			format(msg, sizeof(msg), "Voc� n�o � o dani piresk, voc� � o %s !!!!", PlayerName(playerid));
			SendClientMessage(playerid, COLOR_AZULPLUS, msg);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/mtaxi", true) == 0 && IsPlayerConnected(playerid)) {
		if(Profissao[playerid] == MOTOTAXI || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_RED, "/mototaxi [id]");
	            return 1;
			}
			plid = strval(tmp);
			if(Profissao[plid] == MOTOTAXI){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode ligar o taximetro para um moto-taxista!");
				return 1;
			}
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo != VEH_FCR900 && PLAYER_STATE_DRIVER){
			    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� dirigindo uma moto autorizada para mototaxistas.");
				SendClientMessage(playerid, COLOR_RED, "Use motos do modelo FCR900, no local de exame moto-escola tem uma.");
				return 1;
			}
        	if(MTaximetro[plid][0] == 1)
		    {
		        SendClientMessage(playerid,COLOR_RED,"Voc� j� est� tarifando a viagem desse jogador!");
		        return 1;
		    }
		    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
		        SendClientMessage(playerid, COLOR_GREEN, "O moto-tax�metro come�ou a rodar");
		        SendClientMessage(plid, COLOR_GREEN, "O moto-tax�metro j� est� rodando. A corrida est� sendo cobrada a partir de agora.");
		        MTaximetro[plid][0] = 1;
				MTaximetro[plid][1] = playerid;
				AcrescentarExPoints(playerid,1);
			}
				else SendClientMessage(playerid, COLOR_RED, "O passageiro n�o est� na sua moto, ou voc� n�o � o condutor.");
	    } else SendClientMessage(playerid, COLOR_RED, "Voc� n�o � mototaxista.");
		return 1;
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
			if(Profissao[plid] == TAXI_AEREO){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode ligar o taximetro para algu�m que seja taxista a�reo.");
				return 1;
			}
			new modelo;
		 	modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo != VEH_MAVERICK){
			    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� pilotando uma aeronave autorizada para sua profiss�o.");
				SendClientMessage(playerid, COLOR_RED, "Use apenas helic�pteros Maverick.");
			} else {
			    if(ATaximetro[plid][0] == 1)
			    {
			        SendClientMessage(playerid,COLOR_RED,"Voc� j� est� tarifando a viagem desse jogador!");
			        return 1;
			    }
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COLOR_GREEN, "O aero-tax�metro come�ou a rodar");
			        SendClientMessage(plid, COLOR_GREEN, "O aero-tax�metro j� est� rodando. A corrida est� sendo cobrada a partir de agora.");
			        ATaximetro[plid][0] = 1;
					ATaximetro[plid][1] = playerid;
					AcrescentarExPoints(playerid,1);
  		            return 1;
				}
				else SendClientMessage(playerid, COLOR_RED, "O passageiro n�o est� na sua aeronave, ou voc� n�o � o condutor.");
				return 1;
			}
	    } else {
        	SendClientMessage(playerid, COLOR_RED, "Voc� n�o � taxista a�reo.");
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
			if(Profissao[plid] == TAXISTA){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode ligar o tax�metro para algu�m que seja taxista.");
				return 1;
			}
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			    if(Taximetro[plid][0] == 1)
			    {
			        SendClientMessage(playerid,COLOR_RED,"Voc� j� est� tarifando a viagem desse jogador!");
			        return 1;
			    }
                SendClientMessage(playerid, COLOR_GREEN, "O tax�metro come�ou a rodar.");
                SendClientMessage(plid, COLOR_GREEN, "O tax�metro come�ou a rodar. A bandeirada de $20 foi cobrada.");
                GivePlayerMoney(playerid,20);
                GivePlayerMoney(plid,-20);
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
                AcrescentarExPoints(playerid,1);
				return 1;
			}
			else{
		        SendClientMessage(playerid, COLOR_RED, "O passageiro n�o est� dentro do seu carro ou voc� n�o � o motorista.");
			}
			return 1;
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem n�vel suficiente.");
			return 1;
		}
	}

	if(strcmp(cmd, "/pescar", true) == 0) {
	    if(PescaInProgress[playerid] == 1) {
	    	SendClientMessage(playerid, COLOR_RED, "Calminha a�... Voc� j� est� pescando!");
	    	return 1;
	    } else {
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid,X,Y,Z);
			if((X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425) || (X >= -604.5089&& X <= -499.5553 && Y >= 1365.5953 && Y <= 1495.0166)){
				SendClientMessage(playerid,COLOR_GREEN,"Voc� lan�ou a rede de pesca. Espere ela voltar para concluir a pesca.");
				SendClientMessage(playerid,COLOR_GREEN,"Enquanto ela n�o vem, fique apreciando a paisagem.");
				PescaInProgress[playerid] = 1;
				SetTimerEx("Pesca",36000,0,"d",playerid);
				AcrescentarExPoints(playerid,1);
				return 1;
			} else {
				SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� na �rea de pesca, consulte nosso site para uma refer�ncia.");
				return 1;
			}
		}
	}

	if(strcmp(cmd,"/pizza",true)==0){
	    if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
	       	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
    		new plid;
			new tmp[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/terrestre [id].");
				return 1;
			}
   			plid = strval(tmp);
			if(modelo == VEH_PIZZABOY){
				if(PedindoPizza[plid] == 1){
		    		new distancia;
					distancia = GetDistanceBetweenPlayers(playerid, plid);
			 		if(distancia > 15){
				  		SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!");
						return 1;
					}
					if(IsPlayerConnected(plid)){
						if(plid != playerid){
						    SendClientMessage(playerid,COLOR_ENTREGADOR_PIZZA,"Pizza entregue.");
						    SendClientMessage(plid,COLOR_ENTREGADOR_PIZZA,"Voc� se deliciou com uma pizza da Well Stacked Pizza Co.");
						    GivePlayerMoney(playerid,70);
						    GivePlayerMoney(plid,-50);
						    AddPlayerHealth(plid,20);
						    ApplyAnimation(plid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
						    format(tmp,256,"***%s vendeu uma pizza a %s",PlayerName(playerid),PlayerName(plid));
						    SendClientMessageAdmin(COLOR_ENTREGADOR_PIZZA,tmp);
						    new Float:ht;
							GetPlayerHealth(plid,ht);
						    if(ht < 99) AcrescentarExPoints(playerid,1);
							return 1;
						}
					} else {
						SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado!");
						return 1;
					}
				} else {
    				SendClientMessage(playerid,COLOR_RED,"Esse jogador n�o est� pedindo uma pizza!");
					return 1;
				}
			} else {
				SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� numa moto Pizzaboy!");
				return 1;
			}
		} else {
  			SendClientMessage(playerid,COLOR_RED,"N�o tens permiss�o para usar esse comando!");
	    	return 1;
		}
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
			    	SetTimerEx("Caca",36000,0,"d",playerid);
			    	AcrescentarExPoints(playerid,1);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
			return 1;
		}
	}

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
			if(teor < 1 || teor > 10){
			    SendClientMessage(playerid, COLOR_RED, " Copos de chopp: de 1 a 50.");
				return 1;
			}
			if(Profissao[plid] == BARMAN){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode vender para si mesmo ou para colegas de trabalho.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] += teor*100;
						format(string, sizeof(string), "Voc� tomou uma cerja geladinha mas no n�vel de alcool no seu sangue agora � de: %d mg", teor*100);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Uma cerveja gelada saindo...");
			            AddPlayerHealth(plid, 30);
			            GivePlayerMoney(plid, -80);
			            GivePlayerMoney(playerid, 250);
					    new Float:ht;
						GetPlayerHealth(plid,ht);
					    if(ht < 99) AcrescentarExPoints(playerid,1);
						return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto para entregar o bagulho!!.");
				    return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...Voc� n�o tem permiss�o para isso,sua profissao � outra");
			return 1;
		}
	}

	if(strcmp(cmd, "/whisky", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
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
			if(teor < 1 || teor > 5){
			    SendClientMessage(playerid, COLOR_RED, "Ei, ele quer tomar um drink, n�o encher a cara! Ta�as de 2 a 5.");
				return 1;
			}
			if(Profissao[plid] == BARMAN){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode vender para si mesmo ou para colegas de trabalho.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] += teor*150;
						format(string, sizeof(string), "Voc� bebeu um bom whisky 12 anos mas o n�vel de alcool no seu sangue agora � de: %d mg", teor*150);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Dose de whisky vendida.");
			            AddPlayerHealth(plid, 80);
			            GivePlayerMoney(plid, -200);
			            GivePlayerMoney(playerid, 500);
					    new Float:ht;
						GetPlayerHealth(plid,ht);
					    if(ht < 99) AcrescentarExPoints(playerid,1);
						return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
					    return 1;
					}
				}
				else{
					SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!!.");
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...Voc� n�o tem permiss�o para isso,sua profissao � outra");
			return 1;
		}
	}
	if(strcmp(cmd, "/guarana", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
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
			if(teor < 1 || teor > 7){
			    SendClientMessage(playerid, COLOR_RED, "No maximo 7 copos.");
				return 1;
			}
			if(Profissao[plid] == BARMAN){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode vender para si mesmo ou para colegas de trabalho.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] -= teor*50;
					    if(Bebida[plid] < 0) Bebida[plid]=0;
						format(string, sizeof(string), "Voc� tomou um KUAT, ent�o o teor de alcool no seu sangue baixou: %d mg", teor/200);
				        SendClientMessage(plid, COLOR_GREEN, string);
				        SendClientMessage(playerid, COLOR_GREEN, "Guaran� vendido.");
			    	    AddPlayerHealth(plid, 20);
				        GivePlayerMoney(plid, -150);
				        GivePlayerMoney(playerid, 300);
					    new Float:ht;
						GetPlayerHealth(plid,ht);
					    if(ht < 99) AcrescentarExPoints(playerid,1);
						return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
					    return 1;
					}
				}
				else{
					SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe, chegue mais perto!!.");
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid, COLOR_RED, " Ei...Voc� n�o tem permiss�o para isso,sua profissao � outra");
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
			    SendClientMessage(playerid, COLOR_RED, "Se esse pingu�o encher a cara vai te dar problemas. Venda somente de 1 a 7 copos.");
				return 1;
			}
			if(Profissao[plid] == BARMAN){
				SendClientMessage(playerid, COLOR_RED, "Voc� n�o pode vender para si mesmo ou para colegas de trabalho.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] += teor*200;
						format(string, sizeof(string), "Voc� tomou uma pinga da boa, mas o teor de alcool no seu sangue � de : %d mg", teor*200);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Pinga vendida.");
			            AddPlayerHealth(plid, 60);
			            GivePlayerMoney(plid, -100);
			            GivePlayerMoney(playerid, 300);
					    new Float:ht;
						GetPlayerHealth(plid,ht);
					    if(ht < 99) AcrescentarExPoints(playerid,1);
						if(teor > 3 && teor < 7){
						    ClearAnimations(plid);
						    ApplyAnimation(plid,"PED", "WALK_DRUNK",10,0,1,0,0,0);
						    SendClientMessage(plid,COLOR_RED,"Voc� bebeu demais e agora est� tonto.");
						    return 1;
						}
						if(teor == 7){
						    ClearAnimations(plid);
						    ApplyAnimation(plid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
						    PlayerPlaySoundEx(playerid,1169);
						    SendClientMessage(plid,COLOR_RED,"Voc� bebeu demais e acabou vomitando.");
						    return 1;
						}
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe!!.");
				    return 1;
				}
			}
		} else {
 	    	SendClientMessage(playerid, COLOR_RED, " Ei...Voc� n�o tem permiss�o para isso,sua profissao � outra");
        	return 1;
		}
	}

	if(!strcmp(cmd,"/desempregar",true)) {
	    if(!IsPlayerAdmin(playerid)) {
	        SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem privil�gios de administrador!");
	        return 1;
		}
		new tmp[256];
		new plid;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/desempregar [id]");
			return 1;
		}
		plid = strval(tmp);
		if(!IsPlayerConnected(plid)){
		    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado!");
		    return 1;
		}
		AplicarProfissao(plid,1);
		SendClientMessage(playerid,COLOR_GREEN,"Comando bem-sucedido");
		SendClientMessage(plid,COLOR_RED,"Um administrador lhe tirou sua profiss�o");
		return 1;
	}

	if(strcmp(cmd, "/celular", true) == 0) {
	    if(GetPlayerMoney(playerid) < 500){
	        SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem dinheiro para pagar.");
			return 1;
		}
		if(PegarPhone(PlayerName(playerid)) != 0){
			SendClientMessage(playerid, COLOR_WHITE, "Voc� j� tem celular.");
			return 1;
		}
	    new string[256];
		SendClientMessage(playerid,COLOR_RED2,"Aguarde, processando...");
		GivePlayerMoney(playerid,-500);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		LastPN++;
		new phone = LastPN;
		format(string, sizeof(string), "Celular obtido. Seu numero: %d", phone);
		SendClientMessage(playerid, COLOR_ROSA, string);
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: Voc� pode digitar /ajuda para ver os comandos do seu celular.");
        TrocarPhone(PlayerName(playerid), phone);
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
	    	if(Profissao[playerid] == LADRAO_DE_CARROS || IsPlayerAdmin(playerid)){
	    		if(TempoDesmanche[playerid] == 1) {
			   		SendClientMessage(playerid, COLOR_RED, "Voc� j� entregou um carro aqui. Espere um pouco para entregar de novo!");
	    		}
				if(IsPlayerInAnyVehicle(playerid) && TempoDesmanche[playerid] == 0){
   			   		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == Veiculoprocurado){
						if(AreaDesmanche[playerid] == 1){
		   					SendClientMessage(playerid,COLOR_GREEN,"Aew mano, seu carro vale 2000.");
							GivePlayerMoney(playerid, 2000);
							SendClientMessage(playerid,COLOR_WHITE,"Voc� entregou o carro ao desmanche por 2000 \"pratas\".");
							SetVehicleToRespawn(vehicleid);
				   			TempoDesmanche[playerid] = 1;
				   			AcrescentarExPoints(playerid,1);
							SetTimerEx("Desmanche",300000,false,"d",playerid);
    						return 1;
						} else {
				     	    SendClientMessage(playerid,COLOR_AZULPLUS,"Agente quer esse ve�culo maluco!!!");
							return 1;
						}
					} else {
				 	    SendClientMessage(playerid,COLOR_RED,"Meu irm�o tu num t� na �rea!!!!");
						return 1;
					}
	       		} else {
	           		SendClientMessage(playerid, COLOR_RED, "Maluco nem em ve�culo tu t�!");
					return 1;
				}
	   		}
		    else{
	        	SendClientMessage(playerid,COLOR_RED,"Voc� n�o tem permiss�o!");
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
				format(string, sizeof(string), "N�s num tamo atr�s de nada maluco!");
			} else {
				format(string, sizeof(string), "O beco ta afim de desmanchar um(a) %s.",Nomeveiculo);
			}
			SendClientMessage(playerid, COLOR_AZULPLUS, string);
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
			    SendClientMessage(playerid, COLOR_RED, "O jogador n�o est� conectado");
				return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 10){
			    	SendClientMessage(playerid, COLOR_GREEN, "Miss�o cumprida, voc� fez o tratamento no paciente!");
			    	SendClientMessage(plid, COLOR_WHITE, "Um param�dico fez o tratamento necess�rio em voc�!");
			    	AddPlayerHealth(plid,100);
			    	GivePlayerMoney(plid,-20);
			    	GivePlayerMoney(playerid,20);
			    	AcrescentarExPoints(playerid,1);
					return 1;
				} else {
				    SendClientMessage(playerid,COLOR_RED,"N�o � possivel fazer o tratamento, t�o longe assim do paciente!");
				}
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Apenas param�dicos podem fazer isso!");
		}
		return 1;
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
		    		PedindoPizza[playerid] = 1;
		        }
			}
			return 1;
		}
	}
	
 	if(strcmp(cmd, "/contrabando", true) == 0) {
		if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
			if(Contrabando[playerid] == 1) {
				SendClientMessage(playerid, COLOR_GRAD1, "Voc� j� est� na miss�o.");
				return 1;
			}
			CPS_SetStreamActiveForPlayer(playerid,false);
			SetPlayerCheckpoint(playerid,-2328.99,1527.79,0.25,4.0);
			SendClientMessage(playerid, COLOR_PALHA, "Contrabando!!");
			Contrabando[playerid] = 1;
			SendClientMessage(playerid, COLOR_CONTRABANDISTA, "Prossiga para o navio.");
			CheckpointStatus[playerid] = CONTRABANDOINI;
  			SetTimerEx("ContrabandoNavio",360000,false,"d",playerid);
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� nao � contrabandista");
		}
		return 1;
	}
   	if(strcmp(cmd, "/cancelarcontrabando", true) == 0) {
   		if(Profissao[playerid] == CONTRABANDISTA || IsPlayerAdmin(playerid)){
			if(Contrabando[playerid] == 1) {
			Contrabando[playerid] = 0;
			DisablePlayerCheckpoint(playerid);
			CPS_SetStreamActiveForPlayer(playerid,true);
			SendClientMessage(playerid, COLOR_GREEN, "Contrabando cancelado.");
			return 1;
			} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� nao � contrabandista");
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
   			    if(Contrabando[plid] == 0){
   			        SendClientMessage(playerid, COLOR_RED, "O Jogador n�o est� contrabandeando!");
					return 1;
				}
			    if(GetDistanceBetweenPlayers(playerid, plid)){
			        SendClientMessage(playerid, COLOR_RED, "Voc� est� muito longe!");
					return 1;
				}
				Presos[plid] = 1;
				TrocarPrisao(PlayerName(plid), 1);
				LogarPlayer(plid);
    			SendClientMessage(playerid, COLOR_RECEITA_FEDERAL, "Mercadoria apreendida e contrabandista preso!");
				GameTextForPlayer(playerid,"~y~Miss�o cumprida! ~n~ ~n~ $500",3000,3);
    			SendClientMessage(plid, COLOR_RECEITA_FEDERAL, "A Receita Federal aprendeu a mercadoria e voc� tamb�m foi preso!");
       		  	GameTextForPlayer(plid, "~w~ PRESO!", 5000,0);
       		  	GivePlayerMoney(playerid, 3000);
       		  	Contrabando[playerid]=0;
       		  	DisablePlayerCheckpoint(plid);
       		  	CPS_SetStreamActiveForPlayer(playerid,true);
       		  	AcrescentarExPoints(playerid,1);
				return 1;
			} else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador n�o est� conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o � da Receita Federal!");
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
			SendClientMessage(playerid, COLOR_RED, "ID de skin inv�lido!");
			return 1;
		}
       	if(IsPlayerConnected(playerid)){
            TrocarSkin(PlayerName(playerid), skin);
		    SetPlayerSkin(playerid,skin);
            SendClientMessage(playerid, COLOR_GREEN, "Nova skin colocada!");
            return 1;
    	} else {
			SendClientMessage(playerid, COLOR_RED, "Jogador n�o conectado/logado.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/trocardono", true)==0) {
	    if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
	        if(IsPlayerInAnyVehicle(playerid)){
				new tmp[256], plid, vid;
				tmp = strtok(cmdtext,idx);
				if(!strlen(tmp)){
				    SendClientMessage(playerid,COLOR_RED,"/trocardono [id]");
				    return 1;
				}
				plid = strval(tmp);
				if(plid==playerid && !IsPlayerAdmin(playerid)){
				    SendClientMessage(playerid,COLOR_RED,"Voc� n�o pode mudar a documenta��o do carro para si mesmo.");
				    return 1;
				}
				if(!IsPlayerConnected(plid)){
				    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado");
				    return 1;
				}
				vid=GetPlayerVehicleID(playerid);
				PRIV_sqlset("cars","dono",PlayerName(plid),PRIV_FWI(vid));
				set(Dono[vid],PlayerName(plid));
				SendClientMessage(playerid,COLOR_RED,"Documenta��o trocada com sucesso");
				return 1;
			}
			else {
			    SendClientMessage(playerid,COLOR_RED,"Voc� n�o est� em um ve�culo!");
			    return 1;
			}
		}
		else {
		    SendClientMessage(playerid,COLOR_RED,"EPA! Voc� n�o tem permiss�o para mexer nesse comando!");
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
			if(!IsValidModel(carid)){
				SendClientMessage(playerid,COLOR_RED,"Modelo inv�lido");
				return 1;
			}
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "/setcar [id] [id-do-jogador] [cor1] [cor2]");
				return 1;
			}
			if(!IsNumeric(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"O comando pede o ID, n�o o nick do jogador!");
			    SendClientMessage(playerid,COLOR_RED,"/setcar [id] [id-do-jogador] [cor1] [cor2]");
			    return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador n�o conectado");
			    return 1;
			}
			if(plid==playerid && !IsPlayerAdmin(playerid)){
			    SendClientMessage(playerid,COLOR_RED,"Voc� n�o pode setar um carro para voc� mesmo!");
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
				        new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X, Y, Z);
						GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
						LASTID++;
                        CriarDocumentacao(carid,X,Y,Z,ang,strval(cor1),cor2,100,PlayerName(plid),GeraPlaca(),LASTID);
						AcrescentarExPoints(playerid,1);
            	        SendClientMessage(playerid, COLOR_GREEN, "Carro salvo");
            	        SetTimerEx("CriarVeh",10000,false,"dffffdd",carid,X,Y,Z,ang,strval(cor1),cor2);
						return 1;
			        } else {
				    	SendClientMessage(playerid,COLOR_RED,"Acho que voc� n�o entendeu o comando. Uma breve explica��o:");
				   		SendClientMessage(playerid,COLOR_PALHA,"Agora o MPA RevolutioN RPG n�o precisa mais de �ngulo para setar carros,");
			    		SendClientMessage(playerid,COLOR_PALHA,"pois agora o nosso script pega o �ngulo para voc�!");
					    SendClientMessage(playerid,COLOR_PALHA,"Menos complica��o para voc�, na hora de setar carros");
					    SendClientMessage(playerid,COLOR_YELLOW,"MPA Clan - Infernus Development Group: Sua divers�o, nosso objetivo.");
			    		SendClientMessage(playerid,COLOR_RED," ");
					    SendClientMessage(playerid,COLOR_RED,"Sintaxe do comando: /setcar [id] [id-do-jogador] [cor1] [cor2]");
					    return 1;
			        }
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� em nenhum ve�culo e assim n�o pode setar um carro.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso");
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
			if(!IsValidModel(carid)){
				SendClientMessage(playerid,COLOR_RED,"Modelo inv�lido");
				return 1;
			}
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
				        new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X, Y, Z);
						GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
						LASTID++;
                        CriarDocumentacao(carid,X,Y,Z,ang,strval(cor1),cor2,100,"Governo",GeraPlaca(),LASTID);
						AcrescentarExPoints(playerid,1);
            	        SendClientMessage(playerid, COLOR_GREEN, "Carro salvo");
            	        SetTimerEx("CriarVeh",10000,false,"dffffdd",carid,X,Y,Z,ang,strval(cor1),cor2);
						return 1;
			        } else {
				    	SendClientMessage(playerid,COLOR_RED,"Acho que voc� n�o entendeu o comando. Uma breve explica��o:");
				   		SendClientMessage(playerid,COLOR_PALHA,"Agora o MPA RevolutioN RPG n�o precisa mais de �ngulo para setar carros,");
			    		SendClientMessage(playerid,COLOR_PALHA,"pois agora o nosso script pega o �ngulo para voc�!");
					    SendClientMessage(playerid,COLOR_PALHA,"Menos complica��o para voc�, na hora de setar carros");
					    SendClientMessage(playerid,COLOR_YELLOW,"MPA Clan - Infernus Development Group: Sua divers�o, nosso objetivo.");
			    		SendClientMessage(playerid,COLOR_RED," ");
					    SendClientMessage(playerid,COLOR_RED,"Sintaxe do comando: /setcar [id] [id-do-jogador] [cor1] [cor2]");
					    return 1;
			        }
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Voc� n�o est� em nenhum ve�culo e assim n�o pode setar um carro.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COLOR_RED, "Voc� n�o tem permiss�o para isso");
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
		 	    format(string, MAX_STRING, "Voc� vai ser sequestrado em %d minutos!", sequestro);
		 	    SendClientMessage(i, COLOR_RED, string);
		 	}

			if(sequestro == 0){
				SetPlayerInterior(i, 10);
				SetPlayerPos(i, 6.091180, -29.271898,1003.549988);
				SetPlayerFacingAngle(i, 0);
				Sequestro[i] = 0;
				Cativeiro[i] = 1;
				SendClientMessage(i, COLOR_RED,"Voc� foi SEQUESTRADO!");
				SendClientMessage(i, COLOR_RED,"Para poder sair pague o resgate com o comando /resgate!");
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
        		format(string, sizeof(string), "Voc� passou no radar a %d KpH, e levou uma multa de $%d por estar acima da velocidade pemitida!", velocidade, desconto);
				SendClientMessage(i, COLOR_RED, string);
				TrocarBankmoney(PlayerName(i), PegarBankmoney(PlayerName(i)) - desconto);
			}
			if(velocidade < 80 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
				format(string, sizeof(string), "Voc� passou no radar a %d KpH!", velocidade);
				SendClientMessage(i, COLOR_GREEN, string);
			}
		}
		if((x >= -1344.2700 && x <= -1339.2700 && y >= -826.4300 && y <= -781.1400 && z >= 60.0000 && z <= 100.0000) || (x >= 1076.5900 && x <= 1081.5900 && y >= 763.8400 && y <= 868.2700 && z >= 5.0000 && z <= 20.0000)
		|| (x >= 1975.6600 && x <= 1980.6600 && y >= -1527.1400 && y <= -1490.0000 && z >= 2.0000 && z <= 12.0000)){
            velocidade = Velocidade[i]; // jah arrumei!
            exesso = velocidade - 120;
 			desconto = exesso*30;
		    if(velocidade > 120 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
        		format(string, sizeof(string), "Voc� passou no radar a %d KpH, e levou uma multa de $%d por estar acima da velocidade pemitida!", velocidade, desconto);
				SendClientMessage(i, COLOR_RED, string);
				TrocarBankmoney(PlayerName(i), PegarBankmoney(PlayerName(i)) - desconto);
			}
			if(velocidade < 120 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
				format(string, sizeof(string), "Voc� passou no radar a %d KpH!", velocidade);
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
				    SendClientMessage(playerid,COLOR_RED,"A passagem custa 10 d�lares.");
				    RemovePlayerFromVehicle(playerid);
				    return 1;
				}
				if(money > 9){
				    SendClientMessage(playerid,COLOR_GREEN,"Passagem paga.");
				    GivePlayerMoney(playerid,-10);
				    GivePlayerMoney(i,10);
				    SendClientMessage(i,COLOR_GREEN,"Voc� recebeu 10 d�lares pela passagem do novo passageiro.");
					AcrescentarExPoints(playerid,1);
				    return 1;
				}
			}
		}
	}
	return 1;
}

stock OnPlayerEnterVehicleAsDriver(playerid,vehicleid)
{
	if(GPV[vehicleid] == -1) return 1;
	if(GPV[vehicleid] == 0)
	{
	    SendClientMessage(playerid,COLOR_RED,"Voc� n�o pode andar sem combust�vel! Das duas uma:");
	    SendClientMessage(playerid,COLOR_RED,"Ou voc� sai do ve�culo com a tecla de sa�da (geralmente F ou Enter)");
	    SendClientMessage(playerid,COLOR_RED,"ou pe�a a um frentista para abastecer seu carro.");
	    TogglePlayerControllable(playerid,0);
	    return 1;
	}
	GPV[vehicleid]--;
	new str[256];
	if(compare(PlayerName(playerid),Dono[vehicleid])){
		SendClientMessage(playerid,COLOR_GREEN,"Esse ve�culo � seu, voc� pode ligar o alarme dele com /alarme.");
		return 1;
	}
	if(compare(Dono[vehicleid],"Governo")) SendClientMessage(playerid,COLOR_RED,"Esse ve�culo pertence ao Governo");
	else {
		format(str,256,"Esse ve�culo pertence a %s.",Dono[vehicleid]);
	    SendClientMessage(playerid,COLOR_RED,str);
	}
	if(Alarme[vehicleid] == 1){
	    SendClientMessage(playerid,COLOR_RED,"O alarme desse carro estava ligado.");
	    SendClientMessage(playerid,COLOR_RED,"Voc� foi morto pelo sistema de seguran�a.");
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
	        case 5: AplicarProfissao(playerid,30);
	        case 6: AplicarProfissao(playerid,36);
	        case 7: AplicarProfissao(playerid,39);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Fourth && IsValidMenu(CPD_Fourth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,23);
	        case 1: AplicarProfissao(playerid,16);
	        case 2: AplicarProfissao(playerid,21);
	        case 3: AplicarProfissao(playerid,22);
	        case 4: AplicarProfissao(playerid,25);
	        case 5: AplicarProfissao(playerid,20);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Fifth && IsValidMenu(CPD_Fifth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,24);
	        case 1: AplicarProfissao(playerid,5);
	        case 2: AplicarProfissao(playerid,4);
		}
	}
	if(GetPlayerMenu(playerid) == CPD_Sixth && IsValidMenu(CPD_Sixth)) {
	    switch(row){
	        case 0: AplicarProfissao(playerid,27);
	        case 1: AplicarProfissao(playerid,26);
		}
	}
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{

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
 						SendClientMessage(playerid, COLOR_RED2, "Esse carro pertence ao Departamento de Pol�cia, para ser removida a estrela de procurado, saia do carro!");
						SendClientMessage(playerid, COLOR_COP_SWAT, "Pol�cia atr�s de voc�!!");
						format(string, sizeof(string), "O Jogador %s entrou em uma viatura, v� atr�s dele!",PlayerName(playerid));
						SendClientMessagePolicia(COLOR_COP_SWAT, string);
  						SetPlayerWantedLevel(playerid,1);
   						Perseguicao[playerid] = 1;
   					}
				}
			}
		}
	if(newstate == PLAYER_STATE_DRIVER){
	    new string[256];
      	new model = GetPlayerVehicleID(playerid);
        if(model == alugado1 || model == alugado2 || model == alugado3 || model == alugado4 || model == alugado5 || model == alugado6 || model == alugado7 || model == alugado8 || model == alugado9){
            if(CarroAlugado[playerid] == 0){
        		SendClientMessage(playerid, COLOR_RED2, "Esse carro � um CARRO DE ALUGUEL,");
            	SendClientMessage(playerid, COLOR_RED,  "Veja se t�m algum Locador de Carros");
            	SendClientMessage(playerid, COLOR_RED,  "Ou fale com um admin para aluga-l�!");
      			SendClientMessage(playerid, COLOR_LOCADOR_DE_CARROS,"Para sair do carro digite /sair");
   			 	format(string, sizeof(string), "O Jogador %s entrou num carro de aluguel ofere�a seu servi�o com o /alugarcarro [id].",PlayerName(playerid));
      			SendClientMessageCarros(COLOR_LOCADOR_DE_CARROS, string);
				TogglePlayerControllable(playerid, 0);
				JogadorNoCarro[playerid] = 1;
			}
			else if(CarroAlugado[playerid] == 1){
			    SendClientMessage(playerid, COLOR_GREEN, "Aproveite bem, seu tempo nesse carro � de 5 minutos");
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
            SendClientMessage(playerid,COLOR_GREEN,"Voc� saiu do ve�culo, n�o est� sendo mais procurado!");
            SetPlayerWantedLevel(playerid,0);
            format(string, sizeof(string), "O Jogador %s saiu do carro da pol�cia conforme solicitado, n�o precisa mais ir atr�s dele!",PlayerName(playerid));
			SendClientMessagePolicia(COLOR_COP_SWAT, string);
            Perseguicao[playerid] = 0;
            return 1;
 		}
		if(Carregamento[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"Voc� perdeu sua carga por ter sa�do do ve�culo.");
		    Carregamento[playerid] = 0;
			return 1;
		}
		else if(Carga[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"Voc� perdeu sua carga por ter sa�do do carro-forte.");
		    Carga[playerid] = 0;
			return 1;
		}
		else if(Pedras[playerid] == 1){
		    SendClientMessage(playerid,COLOR_RED,"Voc� perdeu sua carga por ter sa�do do caminh�o");
		    Pedras[playerid] = 0;
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
			AcrescentarExPoints(Taximetro[playerid][1],1);
			return 1;
		}
		else if(ATaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COLOR_PALHA, "Espero que tenha gostado da viagem. Volte sempre.");
		    SendClientMessage(ATaximetro[playerid][1], COLOR_GREEN, "Voc� recebeu o valor da viagem a�rea at� aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(ATaximetro[playerid][1], PrecoCorrida[playerid]);
		    PrecoCorrida[playerid] = 0;
		    ATaximetro[playerid][1] = 0;
		    ATaximetro[playerid][0] = 0;
		    AcrescentarExPoints(ATaximetro[playerid][1],1);
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
		    AcrescentarExPoints(MTaximetro[playerid][1],1);
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
		   		SendClientMessage(playerid, COLOR_GREEN, "Voc� caiu no mar e se molhou, mas conseguiu salvar o produto, o chefe te deu $1000.");
		   		DisablePlayerCheckpoint(playerid);
		   		Contrabando[playerid] = 0;
		   		GivePlayerMoney(playerid,2000);
				DisablePlayerCheckpoint(playerid);
				AcrescentarExPoints(playerid,1);
			    CPS_SetStreamActiveForPlayer(playerid,true);
 			}
	}
	switch (nCheckpointStatus[playerid])
	{
		case NACAMA:
		    {
				SendClientMessage(playerid, COLOR_ROSA2, "Voc� entrou no checkpoint e saiu do sexo");
				SendClientMessage(Prostitutacama[playerid], COLOR_ROSA2, "Seu cliente saiu do sexo e voc� voltou para a porta da boate!");
		  		DisablePlayerCheckpoint(playerid);
		  		SetPlayerPos(playerid,694.0500,1951.5970,5.5432);
		  		SetPlayerInterior(playerid,0);
		  		SetPlayerPos(Prostitutacama[playerid],693.5875,1962.9760,5.5391);
		  		SetPlayerInterior(Prostitutacama[playerid],0);
		  		SendClientMessage(playerid, COLOR_ROSA2, "Foi paga uma quantia de $400 pelo sexo.");
		  		SendClientMessage(Prostitutacama[playerid], COLOR_ROSA2,"Voc� recebeu seu pagamento!");
		  		GivePlayerMoney(Prostitutacama[playerid], 800);
	        	GivePlayerMoney(playerid, -400);
				TextDrawHideForPlayer(playerid,tdStrip);
			    AreaStrip[playerid] = 0;
			    AcrescentarExPoints(Prostitutacama[playerid],1);
			    CPS_SetStreamActiveForPlayer(playerid,true);
			}
	}
	switch (PassoMissaoInicial[playerid])
	{
		case MI_Maleta: {
		    DisablePlayerCheckpoint(playerid);
		    MensagemMI(playerid,11);
		    TextDrawHideForPlayer(playerid,tdMissao1);
		}
		case MI_SanFierro: {
		    DisablePlayerCheckpoint(playerid);
		    if(IsPlayerInAnyVehicle(playerid)) {
		        new vid = GetPlayerVehicleID(playerid);
		        RemovePlayerFromVehicle(playerid);
		        SetVehicleToRespawn(vid);
			}
			GameTextForPlayer(playerid,"bem vindo a san fierro!",2000,1);
			SendClientMessage(playerid,COLOR_RED2,"Voc� acabou de chegar em San Fierro.");
			SendClientMessage(playerid,COLOR_PALHA,"Procure um hotel para se hospedar, enquanto n�o arranja moradia.");
			SendClientMessage(playerid,COLOR_AZULPLUS,"Para conseguir um emprego v� at� a ag�ncia de empregos, marcada com um");
			SendClientMessage(playerid,COLOR_COP_SWAT,"�cone no mapa de uma pessoa com roupas azuis.");
			PassoMissaoInicial[playerid]=0;
			CPS_SetStreamActiveForPlayer(playerid,true);
			TextDrawHideForPlayer(playerid,tdMissao3);
		}
	}
	if(MissaoLixeiro[playerid] == 1){
	    if(IsPlayerInAnyVehicle(playerid)){
	        SendClientMessage(playerid,COLOR_RED,"Saia do caminh�o para coletar o lixo daqui");
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
			    SendClientMessage(playerid,COLOR_RED2,"Parab�ns, voc� completou a miss�o de coletar lixo!");
			    SendClientMessage(playerid,COLOR_RED2,"Agora v� at� o lix�o e descarregue.");
			    LixoColetado[playerid]++;
			    CPS_SetStreamActiveForPlayer(playerid,true);
			    return 1;
			}
		}
	}
	new cp = CPS_GetPlayerCheckpoint(playerid);
    if(cp == CPD_cp1) {
        SendClientMessage(playerid,COLOR_RED,"Lista de profiss�es principiantes - at� n�vel 10");
        ShowMenuForPlayer(CPD_First,playerid);
        TogglePlayerControllable(playerid,0);
    }
    if(cp == CPD_cp2) {
        SendClientMessage(playerid,COLOR_RED,"Lista de profiss�es secund�rias - 20 at� n�vel 40");
        ShowMenuForPlayer(CPD_Second,playerid);
        TogglePlayerControllable(playerid,0);
    }
    if(cp == CPD_cp3) {
        SendClientMessage(playerid,COLOR_RED,"Lista de profiss�es m�dio-baixas - 50 at� n�vel 70");
        ShowMenuForPlayer(CPD_Third,playerid);
        TogglePlayerControllable(playerid,0);
    }
    if(cp == CPD_cp4) {
        SendClientMessage(playerid,COLOR_RED,"Lista de profiss�es m�dias - 80 at� n�vel 90");
        ShowMenuForPlayer(CPD_Fourth,playerid);
        TogglePlayerControllable(playerid,0);
    }
    if(cp == CPD_cp5) {
        SendClientMessage(playerid,COLOR_RED,"Lista de profiss�es m�dio-altas - n�vel 100");
        ShowMenuForPlayer(CPD_Fifth,playerid);
        TogglePlayerControllable(playerid,0);
    }
    if(cp == CPD_cp6) {
        SendClientMessage(playerid,COLOR_RED,"Lista de profiss�es altas - 140 at� n�vel 150");
        ShowMenuForPlayer(CPD_Sixth,playerid);
        TogglePlayerControllable(playerid,0);
	}
	if(IsInBank(playerid))
	{
	    SendClientMessage(playerid,COLOR_GREEN,"Voc� entrou no banco.");
	    SendClientMessage(playerid,COLOR_YELLOW,"---COMANDOS---");
	    SendClientMessage(playerid,COLOR_AZULPLUS,"/sacar /depositar /extrato");
	    TextDrawShowForPlayer(playerid,Banco);
	    return 1;
	}
	if(AreaBombShop[playerid] == 1){
		SendClientMessage(playerid, COLOR_GREEN, "Voc� entrou na loja de bombas!");
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
public ContrabandoNavio(playerid) Contrabando[playerid]=0;
public Desmanche(playerid) {
	TempoDesmanche[playerid] = 0;
	SendClientMessage(playerid,COLOR_YELLOW,"Tempo de espera do desmanche terminado.");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid) TextDrawHideForPlayer(playerid,Banco);
public OnPlayerExitedMenu(playerid)
{
	TogglePlayerControllable(playerid,1);
	return 1;
}
public AssaltoFim(playerid) Assalto[playerid] = 0;
public RouboFim(playerid) RouboMao[playerid] = 0;
stock AplicarProfissao(playerid,profid)
{
	if(!PLAYERLIST_authed[playerid]) return -1;
	new ps[256],temp[256],ix,achado;
	ps = PRIV_sqlget("players","profblocks",PRIV_FWN(PlayerName(playerid)));
	temp = strtok(ps,ix);
	while(strlen(temp) > 0){
		if(strval(temp) == profid) achado=1;
		temp = strtok(ps,ix);
	}
	if(achado == 1){
	    SendClientMessage(playerid,COLOR_RED,"Essa profiss�o est� bloqueada para voc�.");
	    return 1;
	}
	new level = PegarXL(PlayerName(playerid));
	if(level < ProfLevel[profid]){
		new tmp[256];
		format(tmp,256,"Seu level n�o � suficiente para a profiss�o %s. M�nimo de level: %d, o seu: %d",ProfExtName[profid],ProfLevel[profid],level);
		SendClientMessage(playerid,COLOR_RED,tmp);
		return 1;
	} else {
	    new string[256];
	    SendClientMessage(playerid,COLOR_GREEN,"Profiss�o aplicada. Digite /profissao para saber como agir agora!");
		new msg[256];
		format(msg,256,"SERVIDOR: O jogador %s agora � %s.",PlayerName(playerid),ProfExtName[profid]);
		SendClientMessageToAll(COLOR_COP_SWAT,msg);
		Profissao[playerid] = profid;
		TrocarProf(PlayerName(playerid),profid);
		LogarPlayer(playerid);
		SetPlayerPos(playerid,ProfPos[profid][0],ProfPos[profid][1],ProfPos[profid][2]);
		format(string,sizeof(string),"~w~%s",ProfGT[profid]);
		GameTextForPlayer(playerid,string,3000,3);
		return 1;
	}
}

stock AcrescentarExPoints(playerid,points)
{
	if(ExPoints[playerid]+points > 4){
	    TrocarXL(PlayerName(playerid),PegarXL(PlayerName(playerid))+1);
	    SendClientMessage(playerid,COLOR_GREEN,"Voc� alcan�ou 5 Experience Points e subiu mais um Level");
	    ExPoints[playerid]=ExPoints[playerid]-5;
	} else {
	    ExPoints[playerid]=ExPoints[playerid]+points;
	}
	return 1;
}
forward PickupsCoordChecker();
public PickupsCoordChecker()
{
	for(new i; i<MAX_PLAYERS; i++){
	    if(!IsPlayerConnected(i)) continue;
	    new Float:prevdist = 100000.000;
		new prevp;
        for(new pid=1; pid < 400; pid++){
		    new Float:dist;
		    dist = CPSERVICE_getdist(i,PickCasas_Coord[pid][0],PickCasas_Coord[pid][1],PickCasas_Coord[pid][2]);
			if(dist < prevdist){
	    		prevdist = dist;
		 		prevp = pid;
			}
		}
		new pid = prevp;
		if(CPSERVICE_getdist(i,PickCasas_Coord[pid][0],PickCasas_Coord[pid][1],PickCasas_Coord[pid][2]) < 2){
		    if(MostrandoPick[i] == 0 && strlen(PickCasas_Dono[pid])>0){
		        if(compare(PickCasas_Dono[pid],"aa")) continue;
		        if(compare(PickCasas_Dono[pid],PlayerName(i))) continue;
		        MostrandoPick[i] = 1;
		        new tmp[256];
				format(tmp,256,"Atual dono dessa propriedade: ~n~%s",PickCasas_Dono[pid]);
				new Text:tdid = TextDrawCreate(1,300,tmp);
				TextDrawShowForPlayer(i,tdid);
				SetTimerEx("DestruirTextDraw",1000,false,"d",_:tdid);
				SetTimerEx("ZerarMostrandoPick",1000,false,"d",i);
			}
		}
	}
}
forward ZerarMostrandoPick(playerid);
forward DestruirTextDraw(Text:tdid);
public ZerarMostrandoPick(playerid)MostrandoPick[playerid] = 0;
public DestruirTextDraw(Text:tdid) TextDrawDestroy(tdid);

public GatesCoordChecker()
{
	new Float:X, Float:Y, Float:Z;
	for(new p; p<4; p++){
	    new Plocalizado;
	    for(new i; i<MAX_PLAYERS; i++){
	    	new vehicleid = GetPlayerVehicleID(i);
			if(IsPlayerConnected(i) && Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_SWAT || Profissao[i] == COP_FLORESTAL || Profissao[i] == JUIZ || Profissao[i] == SHERIFF || GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 523){
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
	SendClientMessage(playerid,COLOR_GREEN,"Ve�culo abastecido!");
	GPV[vehicleid]=amount;
	TogglePlayerControllable(playerid,1);
	Abastecendo[playerid]=0;
	return 1;
}


stock ProcAreaHotel(playerid,Float:X,Float:Y)
{
	new h2;
	for(new h = 1; h<4; h++) if(X >= HotelPos[h][0] && X <= HotelPos[h][1] && Y >= HotelPos[h][2] && Y <= HotelPos[h][3]) h2 = h;
	if(!h2 && AreaHotel[playerid] > 0) {
		TextDrawHideForPlayer(playerid,Hotel);
		AreaHotel[playerid]=0;
		return 1;
	}
	if(!h2) return 0;
	if(AreaHotel[playerid] == 0) {
		TextDrawShowForPlayer(playerid,Hotel);
		SendClientMessage(playerid,COLOR_VERDE_AQUA,"Voc� entrou na �rea de um hotel. Para mais informa��es, digite /hotelinfo");
		AreaHotel[playerid]=h2;
	}
	return 1;
}

public Bancos(playerid)
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			ProcAreaHotel(i,X,Y);
	        if(GetPlayerDistanceToPoint(i,2415.6001,1123.7100) < 2)
	            SetPlayerPos(i,-2052.3342,458.6646,35.1719);
			else if((X >= -11.9292 && X <= 8.2452 && Y >= -31.3471 && Y <= -2.7872) || (X >= -37.2183 && X <= -14.1099 && Y >= -91.8006 && Y <= -74.6845) || (X >= -34.6621 && X <= -2.6782 && Y >= -31.4095 && Y <= -25.6232) || (X >= -36.5483 && X <= -17.2655 && Y >= -57.9948 && Y <= -49.2967)){
				if(AreaCreditos[i] == 0) {
				    TextDrawShowForPlayer(i,td247);
					SendClientMessage(i, COLOR_PALHA, "Loja de utilidades 1,99 24/7 - Comandos:");
					SendClientMessage(i, COLOR_WHITE, "/celular = para compra do celular | /agenda = para compra da agenda");
					SendClientMessage(i, COLOR_WHITE, "/recarga = recarga dos cr�ditos do seu celular.");
					SendClientMessage(i, COLOR_WHITE, "/revosena [num1] [num2] [num3] [num4] [num5] [num6]");
					SendClientMessage(i, COLOR_WHITE, "/revosena-surpresinha = Loteria de n�meros gerados automaticamentes.");
					SendClientMessage(i, COLOR_WHITE, "/comprarlevel = compra level pelo valor de 10k = 1 level.");
					AreaCreditos[i] = 1;
				}
			}
			else if((X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425)||(X >= -604.5089&& X <= -499.5553 && Y >= 1365.5953 && Y <= 1495.0166)){
			    if(AreaPesca[i] == 0){
		    		TextDrawShowForPlayer(i,tdPesca);
                	AreaPesca[i] = 1;
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
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu ve�culo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >=-94.9835 && X <= -89.6581 && Y >= -1184.5673 && Y <= -1147.5620) ||(X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 2629.4885  && X <=2649.0012 && Y >=1093.5876 && Y <=1117.8594)|| (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu ve�culo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) ||(X >= 53.4239 && X <= 90.0274 && Y >= 1204.0210 && Y <= 1224.3071) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu ve�culo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if( (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu ve�culo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if((X >= 1368.9551 && X <= 1408.8533 && Y >= 1763.6663 && Y <= 1776.5144) || (X >= -1274.6521 && X <= -1220.1176 && Y >= -91.9231 && Y <= -101.3978) || (X >= 1364.6108 && X <= 1464.9171 && Y >= -2473.7749 && Y <= -2406.1863)){
			    if(AreaPosto[i] == 0){
					TextDrawShowForPlayer(i,Posto);
					SendClientMessage(i,COLOR_VERDE_AQUA,"Para abastecer seu ve�culo digite: /abastecer [litros]");
                	AreaPosto[i] = 1;
				}
			}
			else if(X >= -1750.7595 && X <= -1727.5654 && Y >= 1417.1204 && Y <= 1546.1855){
			    if(AreaCoopPesca[i] == 0){
					TextDrawShowForPlayer(i,tdCoopPesca);
                	AreaCoopPesca[i] = 1;
                	AreaCoopCaca[i] = 1;
				}
			}
        	else if(X >= -2062.2964 && X <= -2020.8334 && Y >= -1616.9932 && Y <= -1510.9994){
			    if(AreaCaca[i] == 0){
					TextDrawShowForPlayer(i,tdCaca);
                	AreaCaca[i] = 1;
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
		    else if(X >= -2445.6777 && X <= -2435.7869 && Y >= 516.2742 && Y <= 530.3557){
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
		    else if(X >= -2676.8413 && X <= -2644.5735 && Y >= 1410.5981 && Y <= 1425.9967){
			    if(AreaStrip[i] == 0){
					TextDrawShowForPlayer(i,tdStrip);
					AreaStrip[i] = 1;
		   			if(Profissao[i] == PROSTITUTA) SendClientMessage(i,COLOR_ROSA, "Voc� pode dan�ar aqui para seus clientes basta digitar /strip-tease [id].");
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

public Casino()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i)) {
	        for(new j=0; j < MAX_CASINO; j++) {
	            if(isPlayerInArea(i,AreaProibida[j])) {
					AreaCasino[i]++;
					GameTextForPlayer(i,"~r~SAIA DO CASINO~n~ ~g~Caso contr�rio ~b~Morra!",10000,5);
					if(AreaCasino[i] > 3) {
						SetPlayerHealth(i,0);
						SendClientMessage(i,COLOR_RED2,"Voc� foi avisado!");
						ResetPlayerMoney(i);
					}
				} else AreaCasino[i] = 0;
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
				    SendClientMessage(i,COLOR_RED,"Voc� n�o pode andar sem gasolina!");
				    SendClientMessage(i,COLOR_RED,"Saia do veiculo com a tecla de sa�da (geralmente F ou Enter),");
				    SendClientMessage(i,COLOR_RED,"pe�a para um frentista abastecer seu ve�culo ou ainda tente");
				    SendClientMessage(i,COLOR_RED,"empurrar seu carro ao posto mais pr�ximo e abastecer seu carro l�!");
				    TogglePlayerControllable(i,0);
				    return 1;
				}
				GPV[Vi]--;
                format(str,256,"~r~Combust�vel: ~s~%d~b~l",GPV[Vi]);
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
			if(CashScore > PrevScore[i]) {
			    new tmp[256];
			    format(tmp,256,"[MONEY DETECT] O dinheiro de %s aumentou de $%d para $%d (diferen�a: $%d)",PlayerName(i),PrevScore[i],CashScore,CashScore-PrevScore[i]);
			    writelog(tmp);
			}
			PrevScore[i] = CashScore;
		}
	}
}


public IsStringAName(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++) if(IsPlayerConnected(i) == 1) if(strcmp(PlayerName(i), string, true, strlen(string)) == 0) return 1;
	return 0;
}
public AvancoLigacao(plcaller,plcalled)
{
	CellCredits[plcaller]--;
	if(CellCredits[plcaller] == 0){
	    SendClientMessage(plcaller,COLOR_RED,"Voc� n�o tem mais cr�ditos para continuar nessa chamada!");
		EmLigacao[plcaller]=0;
		EmLigacao[plcalled]=0;
		SetPlayerSpecialAction(plcaller,SPECIAL_ACTION_STOPUSECELLPHONE);
		SetPlayerSpecialAction(plcalled,SPECIAL_ACTION_STOPUSECELLPHONE);
		return 1;
	}
	SendClientMessage(plcaller,COLOR_RED,"Mais um minuto se passou...");
	new msg[256];
	format(msg,256,"Agora seu saldo �: %d cr�ditos.",CellCredits[plcaller]);
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
	    new Float:rx;
		new Float:ry;
		new Float:rz;
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
	new Float:rx;
	new Float:ry;
	new Float:rz;
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
public PortaoCoordChecker()
{
	new Float:X, Float:Y, Float:Z;
	for(new p; p<4; p++){
	    new Plocalizado;
	    for(new i; i<MAX_PLAYERS; i++){
	        new vehicleid = GetPlayerVehicleID(i);
			if(IsPlayerConnected(i) && Profissao[i] == COP_MILITAR || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_SWAT || Profissao[i] == COP_FLORESTAL || Profissao[i] == JUIZ || Profissao[i] == SHERIFF || GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 523){
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
public OpenPortao(objectid)
{
	if(objectid == 0) MoveObject(Portao[objectid],1573.791382, -1638.426270, 14.854576,3.0);
	if(objectid == 1) MoveObject(Portao[objectid],2342.546387, 2454.905029, 7.249487,3.0);
	if(objectid == 2) MoveObject(Portao[objectid],-1631.699219, 688.715637, 8.709263,3.0);
	if(objectid == 3) MoveObject(Portao[objectid],2294.102539, 2511.015137, 4.946327,3.0);
	DelegaAbrindo[objectid]=0;
	DelegaAberto[objectid]=1;
}
public ClosePortao(objectid)
{
	if(objectid == 0) MoveObject(Portao[objectid],1592.921753, -1638.546753, 14.789343,3.0);
	if(objectid == 1) MoveObject(Portao[objectid],2334.678711, 2443.014404, 7.259488,3.0);
	if(objectid == 2) MoveObject(Portao[objectid],-1648.476563, 688.514648, 8.543203,3.0);
	if(objectid == 3) MoveObject(Portao[objectid],2294.276123, 2503.250488, 4.719362,3.0);
	DelegaFechando[objectid]=0;
	DelegaAberto[objectid]=0;
}

public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 180){
	            TempoPreso[i] = 0;
				TrocarPrisao(PlayerName(i), 0);
				Presos[i] = 0;
				SetSpawnInfo(i,0,PegarSkin(PlayerName(i)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
	    		SpawnPlayer(i);
	            SendClientMessage(i, COLOR_YELLOW, "Voc� foi solto, mas se cometer algum crime outra vez, j� sabe...");
			}
			else TempoPreso[i]++;
		}
	}
}
public VoteKickTimer()
{
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
	for(new j = 0; j <= MAX_PLAYERS; j++) if(IsPlayerConnected(j) == 1 && LastVote[j] == kickedid) LastVote[j] = 255;
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
            if(IsPlayerInAnyVehicle(i)){
				new tmpstr[256],Float:h;
				Velocidade[i] = floatround(((dis/1400.0)*60.0)*60.0);
				new vid = GetPlayerVehicleID(i);
				GetVehicleHealth(vid,h);
				format(tmpstr,256,"Velocidade: %d Km/h ~n~Combust�vel: %dl ~n~Integridade: %d%%",Velocidade[i],GPV[vid],floatround(h/10));
				if(!ExibindoVelocimetro[i] && !OpcionalVelocimetro[i]) {
					tdVeloText[i] = TextDrawCreate(475,350,"_");
					TextDrawSetShadow(tdVeloText[i],2);
					TextDrawShowForPlayer(i,tdVeloText[i]);
					TextDrawShowForPlayer(i,tdVeloCaixa);
					TextDrawShowForPlayer(i,tdVeloTitle);
					ExibindoVelocimetro[i] = 1;
				}
				if(OpcionalVelocimetro[i]) {
					TextDrawHideForPlayer(i,tdVeloCaixa);
					TextDrawHideForPlayer(i,tdVeloTitle);
					TextDrawDestroy(tdVeloText[i]);
					ExibindoVelocimetro[i]=0;
				}
				if(ExibindoVelocimetro[i]) TextDrawSetString(tdVeloText[i],tmpstr);
			} else {
				if(ExibindoVelocimetro[i] && !OpcionalVelocimetro[i]) {
					TextDrawHideForPlayer(i,tdVeloCaixa);
					TextDrawHideForPlayer(i,tdVeloTitle);
					TextDrawDestroy(tdVeloText[i]);
					ExibindoVelocimetro[i]=0;
				}
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
	SendClientMessage(playerid, COLOR_SEGURANCA, 	"O COMANDO /PM FOI DESABILITADO. PARA MAIS INFORMA��ES DIGITE:");
	SendClientMessage(playerid, COLOR_GREEN,		 "/celularinfo");
	return 0;
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
			TrocarBankmoney(PlayerName(i), PegarBankmoney(PlayerName(i)) + IntSalario[Profissao[i]]);
			AcrescentarExPoints(i,3);
		}
	}

}

stock ContadorCamuflagem()
{
	for(new i; i<MAX_PLAYERS; i++){
	    if(!IsPlayerConnected(i)) continue;
	    if(CamuflagemContagem[i] == 0) continue;
	    CamuflagemContagem[i]--;
	    new camcon = CamuflagemContagem[i];
	    SendClientMessage(i,COLOR_RED,IntToStr(camcon));
	    if(camcon == 30 || camcon == 10){
	        new tmpstr[256];
	        format(tmpstr,sizeof tmpstr,"O efeito de sua camuflagem est� prestes a acabar. ~n~Tempo restante: %d segundos",camcon);
	        new Text:tmptd = TextDrawCreate(1.0,270.0,tmpstr);
	        TextDrawColor(tmptd,COLOR_TAXI_AEREO);
	        TextDrawShowForPlayer(i,tmptd);
			SetTimerEx("DestruirTextDraw",4000,false,"d",_:tmptd);
		} else if(camcon == 0){
	        new Text:tmptd = TextDrawCreate(1.0,270.0,"O efeito de sua camuflagem acabou.");
	        TextDrawColor(tmptd,COLOR_RED);
	        TextDrawShowForPlayer(i,tmptd);
			SetTimerEx("DestruirTextDraw",4000,false,"d",_:tmptd);
			SetPlayerColor(i,ProfColors[Profissao[i]]);
		}
	}
}

public Tempo()
{
	ContadorCamuflagem();
	if(worldMinute > 59){
		worldMinute = 0;
		worldTime++;
		worldTime%=24;
	}
	if(worldMinute < 60) worldMinute++;
	new texto[256];
	format(texto,256,"Hora atual (hor�rio de bras�lia): %s",GetFormattedTime());
	TextDrawSetString(tdHora,texto);
	for(new i; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i)) SetPlayerTime(i,worldTime,worldMinute);
	if(worldMinute==1){
	    switch(worldTime)
	    {
	        case 21:
	            {
	    			SendClientMessageToAll(COLOR_WHITE,"Not�cias de San Andreas, previs�o do tempo para amanh�:");
				    Previsao = random(19);
				    SendClientMessageToAll(COLOR_GREEN,WeatherName[Previsao]);
				    LoteriaComeco();
				}
			case 6: SetWeather(Previsao);
			case 0: Salario();
		}
	}
}

stock compare(string1[],string2[]) {
	new igual;
	if(!strlen(string1) || !strlen(string2)) return 0;
	for(new c; c < strlen(string1); c++) {
    	if(!strcmp(string1[c],string2[c],false)) igual=1;
		else {
		    igual = 0;
		    break;
		}
	}
	if(igual==0) return 0;
	else return 1;
}
