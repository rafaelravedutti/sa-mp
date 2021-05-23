//----------------------------------------------------------
// San Andreas Role Play Game desenvolvido por Osorkon.       
// Créditos ao Virtual Life RPG por alguns códigos de auxílio 
//----------------------------------------------------------  

#include <a_samp>

#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

#define MAX_SLOTS 50
#define MAX_VEHS 22

#define CINZA 0xBEBEBEAA
#define BRANCO 0xFFFFFFAA
#define AMARELO 0xFFFF00AA
#define VERDE 0x00FF00AA
#define VERMELHO 0xFF0000AA
#define AZUL 0x0000FFAA

#define DIALOG_APRENDER 0
#define DIALOG_ESTILO 1
#define DIALOG_LOGAR 2
#define DIALOG_REGISTRAR 3
#define DIALOG_TUTORIAL1 4
#define DIALOG_TUTORIAL2 5

//---------------------------------------------------------- TUTORIAL
/*
new tut1_1[] = "Este servidor é do estilo RPG. Aqui tentaremos lhe ensinar o básico sobre RPG.";
new tut1_2[] = "O servidor usa o SARPG - San Andreas RPG, onde é explorado todos os recursos em";
new tut1_3[] = "toda San Andreas. Existem empregos, empresas e casas espalhados pela cidade.";
new tut1_4[] = "Nos próximos tópicos lhe explicaremos sobre termos básicos. Lembre-se: você po-";
new tut1_5[] = "derá ver este tutorial quantas vezes quiser, basta vir até este local.";
new tut1[512]; format(tut1, sizeof (tut1), "%s\n%s\n%s\n%s\n%s", tut1_1, tut1_2, tut1_3, tut1_4, tut1_5);

new tut2_1[] = "Interpretar no básico é você \"entrar\" dentro do presonagem do jogo, ou seja, vo-";
new tut2_2[] = "cê deve agir em cada situação do jogo como se fosse você na sua vida real. Por exem-";
new tut2_3[] = "plo: \"Um sujeito aponta uma arma para você\" - Na vida real você vai ficar com medo";
new tut2_4[] = "e obdecer a pessoa que está em posse da arma. É diferente de você sair correndo em";
new tut2_5[] = "zig-zag feito besta. Sempre simule e antes de agir lembre-se desse termo importante.";
new tut2[512]; format(tut2, sizeof (tut2), "%s\n%s\n%s\n%s\n%s", tut2_1, tut2_2, tut2_3, tut2_4, tut2_5);

new tut3_1[] = "Metagaming consiste em usar fatores externos ao jogo para afetar fatores internos no";
new tut3_2[] = "jogo. Exemplo: \"Você está no team-speak com um amigo, ai você é sequestrado\" - Caso";
new tut3_3[] = "você fale onde você está por team-speak e ele vai até o seu cativeiro no jogo, ele e";
new tut3_4[] = "você vão estar praticando metagaming. Não faça isso pois é considerado anti-rpg e é";
new tut3_5[] = "proibido em nosso servidor. Sempre interprete. Metagaming resultará em multa.";
new tut3[512]; format(tut3, sizeof (tut3), "%s\n%s\n%s\n%s\n%s", tut3_1, tut3_2, tut3_3, tut3_4, tut3_5);

new tut4_1[] = "Powergaming é usar sua experiência no jogo para obter cada lucro e cada benefício";
new tut4_2[] = "injustamente, evitando perdas que são necessárias para que o jogo ocorra em bons";
new tut4_3[] = "padrões. Por exemplo: \" você é parado em uma blitz policial e possui drogas. Você";
new tut4_4[] = "conhece o comando de descartar drogas e as descarta rapidamente só para não ser mul-";
new tut4_5[] = "tado ou preso.\" Isso é considerado powergaming e resulta em multa à quem pratica.";
new tut4[512]; format(tut4, sizeof (tut4), "%s\n%s\n%s\n%s\n%s", tut4_1, tut4_2, tut4_3, tut4_4, tut4_5);

new tut5_1[] = "In-character é o estado chamado pra quem está simulando no jogo. Você sempre estará";
new tut5_2[] = "usando IC a não ser que você deslogue. Enquanto você está no IC, você deve usar o";
new tut5_3[] = "chat \"T\" para falar. Diga como se fosse você na vida real: \"Pedro vou ali no";
new tut5_4[] = "mercado ir comprar um celular\" - Não use gírias ou emotions enquanto usa o IC,";
new tut5_5[] = "muito menos passe seu msn. Converse de assuntos que tem a ver com o jogo.";
new tut5[512]; format(tut5, sizeof (tut5), "%s\n%s\n%s\n%s\n%s", tut5_1, tut5_2, tut5_3, tut5_4, tut5_5);

new tut6_1[] = "Out-of-character é o estado chamado pra quem não está simulando no jogo. O chat do";
new tut6_2[] = "OOC é o \"/b\". No OOC você pode usar emotions, falar sobre assuntos de fora do jo-";
new tut6_3[] = "jogo. Exemplo: \"Cara, to morrendo de sono xD\" - Pode passar o seu msn, orkut, etc.";
new tut6_4[] = "IMPORTANTE: Você pode usar o OOC para tirar dúvidas. Não tire dúvidas no IC.";
new tut6_5[] = "Enfim, use para falar sobre qualquer coisa que não esteja relacionada ao jogo.";
new tut6[512]; format(tut6, sizeof (tut6), "%s\n%s\n%s\n%s\n%s", tut6_1, tu6_2, tut6_3, tut6_4, tut6_5);

new tut7_1[] = "Sempre tenha respeito com os outros jogadores, nunca chingue alguém, a não ser que";
new tut7_2[] = "seja motivos IC. Você pode tirar suas dúvidas no chat de novatos usando \"/novato\"";
new tut7_3[] = "ou \"/n\". Esse chat é global e jogadores mais experientes lhe ajudarão. Você pode";
new tut7_4[] = "também fazer um anúncio usando \"/anunciar\". Nunca faça flooding/spamming ou use";
new tut7_5[] = "o chat de novatos e anúncios indevidamente, pois você poderá ser multado.";
new tut7[512]; format(tut7, sizeof (tut7), "%s\n%s\n%s\n%s\n%s", tut7_1, tut7_2, tut7_3, tut7_4, tut7_5);
		
new tut8_1[] = "Aqui encerra-se o tutorial básico. Possuimos um fórum que contém mais tutorias sobre";
new tut8_2[] = "nosso servidor. Lá também você pode se inscrever para profissões públicas. Nosso en-";
new tut8_3[] = "dereço é: sarpg.7forum.net. Adicione também nosso ip fixo aos seus servidores favo-";
new tut8_4[] = "ritos: sarpgserver.no-ip.info. Esperamos que tenha um bom jogo, e sempre contaremos";
new tut8_5[] = "com você para que o servidor cresça. Seja bem-vindo mais uma vez!";
new tut8[512]; format(tut8, sizeof (tut8), "%s\n%s\n%s\n%s\n%s". tut8_1, tut8_2, tut8_3, tut8_4. tut8_5);
*/
//---------------------------------------------------------- GENERAL

new msg[64];

//---------------------------------------------------------- PLAYER

new PlayerInTeste[MAX_SLOTS];
new TutorialParte[MAX_SLOTS];

enum STATS_INFO
{
	Senha[128],
	Tutorial,
	Level,
	Float:Vida,
	Float:Colete,
	Skin,
	Banco,
	Dinheiro,
	Emprego,
	EmpregoL,
	Familia,
	FamiliaL,
	Celular,
	Boxing,
	Kungfu,
	Lutalivre,
	Acessorio,
	Pistola,
	Shotgun,
	SubMachine,
	Machine,
	Rifle,
	Interior,
	Float:Angle,
	Float:SpawnX,
	Float:SpawnY,
	Float:SpawnZ
}

new PlayerStats[MAX_SLOTS][STATS_INFO];

//---------------------------------------------------------- VEHICLE

new Veh_Taxi[8];
new Veh_Seg[8];
new Veh_Auto[6];

main()
{
	print("\n----------------------------------");
	print(" San Andreas Role Play by Osorkon");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
    AddPlayerClass(0, 1674.7595, 1448.1327, 10.7894, 271.5641, 0, 0, 0, 0, 0, 0);
    
	SetGameModeText("SARPG");
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	ShowPlayerMarkers(0);
	EnableStuntBonusForAll(0);
	LimitGlobalChatRadius(40.0);
	SetNameTagDrawDistance(40.0);
	DisableNameTagLOS();
	
	Veh_Taxi[0] = AddStaticVehicleEx(420, 1799.4368, -1690.5554, 13.2868, 178.8507, 6, 6, 600); // taxi1
	Veh_Taxi[1] = AddStaticVehicleEx(420, 1795.0166, -1690.5913, 13.2666, 179.5074, 6, 6, 600); // taxi2
	Veh_Taxi[2] = AddStaticVehicleEx(420, 1795.5154, -1702.2247, 13.3104, 0.4643, 6, 6, 600); // taxi3
	Veh_Taxi[3] = AddStaticVehicleEx(420, 1791.0946, -1702.1732, 13.3034, 359.6791, 6, 6, 600); // taxi4
	Veh_Taxi[4] = AddStaticVehicleEx(420, 1790.0529, -1690.5841, 13.2434, 178.6739, 6, 6, 600); // taxi5
	Veh_Taxi[5] = AddStaticVehicleEx(420, 1784.9182, -1690.6046, 13.2233, 180.1290, 6, 6, 600); // taxi6
	Veh_Taxi[6] = AddStaticVehicleEx(420, 1780.0419, -1690.5664, 13.2191, 180.8506, 6, 6, 600); // taxi7
	Veh_Taxi[7] = AddStaticVehicleEx(420, 1775.0857, -1690.5096, 13.2121, 180.7021, 6, 6, 600); // taxi8
	Veh_Seg[0] = AddStaticVehicleEx(507, 1106.0669, -1193.0149, 17.9721, 179.4451, 0, 0, 600); // elegant1
	Veh_Seg[1] = AddStaticVehicleEx(507, 1110.2163, -1193.0387, 17.9283, 180.1193, 0, 0, 600); // elegant2
	Veh_Seg[2] = AddStaticVehicleEx(507, 1114.4169, -1192.9774, 17.8952, 180.1075, 0, 0, 600); // elegant3
	Veh_Seg[3] = AddStaticVehicleEx(507, 1110.7908, -1218.5862, 17.6341, 0.0055, 0, 0, 600); // elegant4
	Veh_Seg[4] = AddStaticVehicleEx(507, 1106.8362, -1218.5439, 17.6297, 0.9332, 0, 0, 600); // elegant5
	Veh_Seg[5] = AddStaticVehicleEx(507, 1102.5652, -1218.5911, 17.6300, 1.0303, 0, 0, 600); // elegant6
	Veh_Seg[6] = AddStaticVehicleEx(507, 1098.4226, -1218.6024, 17.6309, 0.2231, 0, 0, 600); // elegant7
	Veh_Seg[7] = AddStaticVehicleEx(507, 1086.2059, -1200.1256, 17.7151, 269.5475, 0, 0, 600); // elegant8
	Veh_Auto[0] = AddStaticVehicleEx(496, -2072.7766, -84.3052, 34.9891, 179.7059, 18, 13, 600); // auto1
	Veh_Auto[1] = AddStaticVehicleEx(496, -2068.6182, -84.3714, 34.9885, 180.0875, 18, 13, 600); // auto2
	Veh_Auto[2] = AddStaticVehicleEx(496, -2062.3398, -108.5415, 35.1500, 178.7490, 18, 13, 600); // auto3
	Veh_Auto[3] = AddStaticVehicleEx(496, -2072.0791, -108.3008, 35.1484, 176.5262, 18, 13, 600); // auto4
	Veh_Auto[4] = AddStaticVehicleEx(496, -2082.2668, -108.0454, 35.1453, 178.5167, 18, 13, 600); // auto5
	Veh_Auto[5] = AddStaticVehicleEx(496, -2091.1956, -108.2011, 35.1453, 177.6720, 18, 13, 600); // auto6
	
	AddStaticPickup(1277, 1, 1116.0750, -924.2917, 43.3906, 0); // registro
	AddStaticPickup(2894, 1, 1113.1345, -924.1263, 43.3932, 0); // tutorial
    AddStaticPickup(1239, 1, 1555.4961, -1675.5945, 16.1953, 0); // entrada lspd
	AddStaticPickup(1239, 1, 246.8270, 62.3293, 1003.6406, 0); // saida lspd
	AddStaticPickup(1239, 1, -2241.8176, 128.5296, 35.3203, 0); // entrada rczero
	AddStaticPickup(1239, 1, -2240.7822, 137.2083, 1035.4141, 0); // saida rczero
	AddStaticPickup(1239, 1, -2026.6300, -102.0597, 35.1641, 0); // entrada auto 1
	AddStaticPickup(1239, 1, -2026.8743, -103.6021, 1035.1833, 0); // saida auto 1
	AddStaticPickup(1239, 1, -2029.7390, -120.5213, 35.1692, 0); // entrada auto 2
	AddStaticPickup(1239, 1, -2029.7704, -119.6166, 1035.1719, 0); // saida auto 2
	AddStaticPickup(1239, 1, -2270.6399, -155.9086, 35.3203, 0); // entrada academia
	AddStaticPickup(1239, 1, 774.1425, -50.4767, 1000.5859, 0); // saida academia
	AddStaticPickup(2966, 1, -2226.3914, 128.3195, 1035.4141); // celular
	AddStaticPickup(2913, 1, 768.2251, -37.0754, 1000.6865); // luta
	
	Create3DTextLabel("[REGISTRO] /registrar", AMARELO, 1116.0750, -924.2917, 43.3906+0.5, 20.0, 0);
	Create3DTextLabel("[TUTORIAL] /tutorial", AMARELO, 1113.1345, -924.1263, 43.3932+0.5, 20.0, 0);
	Create3DTextLabel("[CELULAR] /comprar", AMARELO, -2226.3914, 128.3195, 1035.4141+0.5, 20.0, 0);
	Create3DTextLabel("[LUTA] /aprender", AMARELO, 768.2251, -37.0754, 1000.6865+0.5, 20.0, 0);
	
	SetTimer("UpdateSettings", 1000, true);

	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if (!fexist(PlayerFile(PlayerName(playerid)))) SendClientMessage(playerid, CINZA, "SERVER: Aqui você pode jogar sem registro para poder conhecer o jogo.");
	else ShowPlayerDialog(playerid, DIALOG_LOGAR, DIALOG_STYLE_INPUT, "Insira sua senha para logar:", "", "Logar", "Sair");
	return 1;
}

public OnPlayerConnect(playerid)
{
    SetPlayerMapIcon(playerid, 0, 1115.7350, -930.6904, 43.1311, 35, 0); // registro
	SetPlayerMapIcon(playerid, 1, -2241.8176, 128.5296, 35.3203, 47, 0); // rczero
	SetPlayerMapIcon(playerid, 2, -2026.6300, -102.0597, 35.1641, 36, 0); // auto
	SetPlayerMapIcon(playerid, 3, -2270.6399, -155.9086, 35.3203, 54, 0); // academia
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if (fexist(PlayerFile(PlayerName(playerid))) && IsPlayerConnected(playerid))
	{
	    new Float:Health, Float:Armour, Float:Ang, Float:Posx, Float:Posy, Float:Posz;
		GetPlayerHealth(playerid, Health);
		GetPlayerArmour(playerid, Armour);
		GetPlayerFacingAngle(playerid, Ang);
		GetPlayerPos(playerid, Posx, Posy, Posz);
		PlayerStats[playerid][Vida] = Health;
		PlayerStats[playerid][Colete] = Armour;
		PlayerStats[playerid][Dinheiro] = GetPlayerMoney(playerid);
		PlayerStats[playerid][Interior] = GetPlayerInterior(playerid);
		PlayerStats[playerid][Angle] = Ang;
		PlayerStats[playerid][SpawnX] = Posx;
		PlayerStats[playerid][SpawnY] = Posy;
		PlayerStats[playerid][SpawnZ] = Posz;
		SavePlayerAccount(playerid);
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
    if (!fexist(PlayerFile(PlayerName(playerid))))
	{
	    SendClientMessage(playerid, CINZA, "DICA: Vá até o centro de imigração e faça seu registro cívil (Los Santos).");
	    SetPlayerColor(playerid, CINZA);
 	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if (TutorialParte[playerid] != -1) return 0;
	else return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	dcmd(comprar, 7, cmdtext);
	
	if (!strcmp(cmdtext, "/registrar", true, 10))
	{
        if (!IsPlayerInRangeOfPoint(playerid, 2.0, 1116.0750, -924.2917, 43.3906))
		{
	    	SendClientMessage(playerid, CINZA, "ERRO: Você não está no local de registro.");
			return 1;
		}
		if (fexist(PlayerFile(PlayerName(playerid))))
		{
	    	SendClientMessage(playerid, CINZA, "ERRO: Você já fez o registro.");
			return 1;
		}
		ShowPlayerDialog(playerid, DIALOG_REGISTRAR, DIALOG_STYLE_INPUT, "Crie uma senha para registrar:", "", "Registrar", "Cancelar");
	    return 1;
	}
	
	if (!strcmp(cmdtext, "/tutorial", true, 9))
	{
	    if (!IsPlayerInRangeOfPoint(playerid, 2.0, 1113.1345, -924.1263, 43.3932)) return 1;
		if (!fexist(PlayerFile(PlayerName(playerid)))) return 1;
		if (TutorialParte[playerid] != -1) return 1;
		TutorialParte[playerid] = 0;
		SendClientMessage(playerid, CINZA, "DICA: Use \"/anterior\" para retroceder e \"/proximo\" para avançar.");
//		ShowPlayerDialog(playerid, DIALOG_TUTORIAL1, DIALOG_STYLE_MSGBOX, "Parte 1 - [Regras]:", "Não pratique death-match ou revenge-kill - Ban permanente\nNão pratique metagaming ou powergaming - Multa\n
//	    Não use mods ou cheats - Ban permanente\nNão cometa drive-by enquanto dirige um veículo - Kick\nNão flood ou use o /anunciar ou /novato indevidamente - Multa", "Anterior", "Próximo");
	    //TogglePlayerControllable(playerid, 0);
		//ShowTutorial(playerid, 0);
		return 1;
	}
	
	if (!strcmp(cmdtext, "/anterior", true, 9))
	{
	    if (TutorialParte[playerid] == -1) return 1;
    	if (TutorialParte[playerid] == 0)
		{
			TutorialParte[playerid] = -1;
			TogglePlayerControllable(playerid, 1);
			GameTextForPlayer(playerid, "~g~concluido", 1000, 0);
			return 1;
		}
		TutorialParte[playerid]--;
		ShowTutorial(playerid, TutorialParte[playerid]);
	    return 1;
	}
	
	if (!strcmp(cmdtext, "/proximo", true, 8))
	{
	    if (TutorialParte[playerid] == -1) return 1;
		if (TutorialParte[playerid] == 8)
		{
			if (PlayerStats[playerid][Tutorial] != 1) PlayerStats[playerid][Tutorial] = 1;
			TutorialParte[playerid] = -1;
			TogglePlayerControllable(playerid, 1);
			GameTextForPlayer(playerid, "~g~concluido", 1000, 0);
			return 1;
		}
		TutorialParte[playerid]++;
		ShowTutorial(playerid, TutorialParte[playerid]);
	    return 1;
	}
	
	if (!strcmp(cmdtext, "/aprender", true, 9))
	{
	    if (!fexist(PlayerFile(PlayerName(playerid)))) return 1;
		if (!IsPlayerInRangeOfPoint(playerid, 2.0, 768.2251, -37.0754, 1000.6865))
		{
	    	SendClientMessage(playerid, CINZA, "ERRO: Você não está na academia de artes marciais (San Fierro).");
	    	return 1;
		}
		ShowPlayerDialog(playerid, DIALOG_APRENDER, DIALOG_STYLE_LIST, "Estilos para aprender:", "Boxing $600\nKung-fu $1500\nLuta livre $300", "Aprender", "Cancelar");
	    return 1;
	}
	
	if (!strcmp(cmdtext, "/estilo", true, 7))
	{
	    if (!fexist(PlayerFile(PlayerName(playerid)))) return 1;
		ShowPlayerDialog(playerid, DIALOG_ESTILO, DIALOG_STYLE_LIST, "Estilos para usarr:", "Boxing\nKung-fu\nLuta livre", "Usar", "Cancelar");
	    return 1;
	}
	
	new cmd[256];
	new tmp[256];
	new idx;
	
	cmd = strtok(cmdtext, idx);
	
	if (!strcmp(cmd, "/cores", true))
	{
		SendClientMessage(playerid, CINZA, "CINZA");
		SendClientMessage(playerid, BRANCO, "BRANCO");
		SendClientMessage(playerid, AMARELO, "AMARELO");
		SendClientMessage(playerid, VERDE, "VERDE");
		SendClientMessage(playerid, VERMELHO, "VERMELHO");
		SendClientMessage(playerid, AZUL, "AZUL");
	    return 1;
	}
	
	if (!strcmp("/carex", cmd, true))
	{
 		if (!IsPlayerConnected(playerid)) return 0;
	    if (!IsPlayerAdmin(playerid)) return 1;
	    if (IsPlayerInAnyVehicle(playerid)) return 1;
	    new Float:X, Float:Y, Float:Z, Float:A;
	    GetPlayerPos(playerid, X, Y, Z);
	    GetPlayerFacingAngle(playerid, A);
		new cid;
		tmp = strtok(cmdtext, idx);
		cid = strval(tmp);
		if (!strlen(tmp)) return 1;
		new cor1;
		tmp = strtok(cmdtext, idx);
		cor1 = strval(tmp);
		if (!strlen(tmp)) return 1;
		new cor2;
		tmp = strtok(cmdtext, idx);
		cor2 = strval(tmp);
		if (!strlen(tmp)) return 1;
		AddStaticVehicleEx(cid, X, Y, Z, A, cor1, cor2, -1);
		return 1;
	}
	
	if (strcmp("/respawn", cmd, true) == 0)
	{
	    if (!IsPlayerConnected(playerid)) return 0;
	    if (!IsPlayerAdmin(playerid)) return 1;
	    if (!IsPlayerInAnyVehicle(playerid)) return 1;
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		return 1;
	}

	if (strcmp("/destruir", cmd, true) == 0)
	{
	    if (!IsPlayerConnected(playerid)) return 0;
	    if (!IsPlayerAdmin(playerid)) return 1;
	    if (!IsPlayerInAnyVehicle(playerid)) return 1;
		DestroyVehicle(GetPlayerVehicleID(playerid));
		return 1;
	}

	if (strcmp("/consertar", cmd, true) == 0)
	{
	    if (!IsPlayerConnected(playerid)) return 0;
	    if (!IsPlayerAdmin(playerid)) return 1;
	    if (!IsPlayerInAnyVehicle(playerid)) return 1;
		RepairVehicle(GetPlayerVehicleID(playerid));
		return 1;
	}
	
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new v = GetPlayerVehicleID(playerid);

	if (newstate == PLAYER_STATE_DRIVER)
	{
	    if (v == Veh_Taxi[0] || v == Veh_Taxi[1] || v == Veh_Taxi[2] || v == Veh_Taxi[3] || v == Veh_Taxi[4] || v == Veh_Taxi[5] || v == Veh_Taxi[6] || v == Veh_Taxi[7])
	    {
	        if (PlayerStats[playerid][Emprego] != 1) RemovePlayerFromVehicle(playerid);
	    }
	    if (v == Veh_Seg[0] || v == Veh_Seg[1] || v == Veh_Seg[2] || v == Veh_Seg[3] || v == Veh_Seg[4] || v == Veh_Seg[5] || v == Veh_Seg[6] || v == Veh_Seg[7])
	    {
	        if (PlayerStats[playerid][Emprego] != 2) RemovePlayerFromVehicle(playerid);
	    }
	    if (v == Veh_Auto[0] || v == Veh_Auto[1] || v == Veh_Auto[2] || v == Veh_Auto[3] || v == Veh_Auto[4] || v == Veh_Auto[5])
	    {
	        if (PlayerStats[playerid][Emprego] != 2 && PlayerInTeste[playerid] != 1) RemovePlayerFromVehicle(playerid);
	    }
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if (IsPlayerNPC(playerid)) return 1;
    if (!fexist(PlayerFile(PlayerName(playerid)))) return 1;
	return 0;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 0.5, 1555.4961, -1675.5945, 16.1953)) // entrando lspd
	{
	    SetPlayerInterior(playerid, 6);
		SetPlayerPos(playerid, 246.8484, 64.3902, 1003.6406);
		SetPlayerFacingAngle(playerid, 359.8793);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, 246.8270, 62.3293, 1003.6406)) // saindo lspd
	{
	    SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 1552.6124, -1675.7490, 16.1953);
		SetPlayerFacingAngle(playerid, 87.4870);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, -2241.8176, 128.5296, 35.3203)) // entrando rczero
	{
	    SetPlayerInterior(playerid, 6);
	    SetPlayerPos(playerid, -2238.8298, 137.0947, 1035.4141);
	    SetPlayerFacingAngle(playerid, 267.4671);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, -2240.7822, 137.2083, 1035.4141)) // saindo rczero
	{
	    SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, -2244.4456, 128.8475, 35.3203);
		SetPlayerFacingAngle(playerid, 88.1134);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, -2026.6300, -102.0597, 35.1641)) // entrando auto1
	{
	    SetPlayerInterior(playerid, 3);
	    SetPlayerPos(playerid, -2027.9280, -105.1402, 1035.1719);
	    SetPlayerFacingAngle(playerid, 104.4015);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, -2026.8743, -103.6021, 1035.1833)) // saindo auto1
	{
	    SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, -2026.6940, -99.9329, 35.1641);
		SetPlayerFacingAngle(playerid, 357.6399);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, -2029.7390, -120.5213, 35.1692)) // entrando auto2
	{
	    SetPlayerInterior(playerid, 3);
	    SetPlayerPos(playerid, -2029.7633, -118.2290, 1035.1719);
	    SetPlayerFacingAngle(playerid, 359.6023);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, -2029.7704, -119.6166, 1035.1719)) // saindo auto2
	{
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, -2030.4711, -122.7678, 35.1964);
		SetPlayerFacingAngle(playerid, 162.3295);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, -2270.6399, -155.9086, 35.3203)) // entrando academia
	{
		SetPlayerInterior(playerid, 6);
        SetPlayerPos(playerid, 774.1942, -48.8994, 1000.5859);
        SetPlayerFacingAngle(playerid, 359.1716);
	}
	if (IsPlayerInRangeOfPoint(playerid, 0.5, 774.1425, -50.4767, 1000.5859)) // saindo academia
	{
	    SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, -2267.9399, -155.8034, 35.3203);
		SetPlayerFacingAngle(playerid, 269.0043);
	}
	if (GetPlayerMoney(playerid) > PlayerStats[playerid][Dinheiro])
	{
	    ResetPlayerMoney(playerid);
	    GivePlayerMoney(playerid, PlayerStats[playerid][Dinheiro]);
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new tut1_1[128] = "Este servidor é do estilo RPG. Aqui tentaremos lhe ensinar o básico sobre RPG.";
	new tut1_2[128] = "O servidor usa o SARPG - San Andreas RPG, onde é explorado todos os recursos em";
	new tut1_3[128] = "toda San Andreas. Existem empregos, empresas e casas espalhados pela cidade.";
	new tut1_4[128] = "Nos próximos tópicos lhe explicaremos sobre termos básicos. Lembre-se: você po-";
	new tut1_5[128] = "derá ver este tutorial quantas vezes quiser, basta vir até este local.";
	new tut1[640]; format(tut1, sizeof (tut1), "%s\n%s\n%s\n%s\n%s", tut1_1, tut1_2, tut1_3, tut1_4, tut1_5);

	new tut2_1[128] = "Interpretar no básico é você \"entrar\" dentro do presonagem do jogo, ou seja, vo-";
	new tut2_2[128] = "cê deve agir em cada situação do jogo como se fosse você na sua vida real. Por exem-";
	new tut2_3[128] = "plo: \"Um sujeito aponta uma arma para você\" - Na vida real você vai ficar com medo";
	new tut2_4[128] = "e obdecer a pessoa que está em posse da arma. É diferente de você sair correndo em";
	new tut2_5[128] = "zig-zag feito besta. Sempre simule e antes de agir lembre-se desse termo importante.";
	new tut2[640]; format(tut2, sizeof (tut2), "%s\n%s\n%s\n%s\n%s", tut2_1, tut2_2, tut2_3, tut2_4, tut2_5);

	new tut3_1[] = "Metagaming consiste em usar fatores externos ao jogo para afetar fatores internos no";
	new tut3_2[] = "jogo. Exemplo: \"Você está no team-speak com um amigo, ai você é sequestrado\" - Caso";
	new tut3_3[] = "você fale onde você está por team-speak e ele vai até o seu cativeiro no jogo, ele e";
	new tut3_4[] = "você vão estar praticando metagaming. Não faça isso pois é considerado anti-rpg e é";
	new tut3_5[] = "proibido em nosso servidor. Sempre interprete. Metagaming resultará em multa.";
	new tut3[640]; format(tut3, sizeof (tut3), "%s\n%s\n%s\n%s\n%s", tut3_1, tut3_2, tut3_3, tut3_4, tut3_5);

	new tut4_1[128] = "Powergaming é usar sua experiência no jogo para obter cada lucro e cada benefício";
	new tut4_2[128] = "injustamente, evitando perdas que são necessárias para que o jogo ocorra em bons";
	new tut4_3[128] = "padrões. Por exemplo: \" você é parado em uma blitz policial e possui drogas. Você";
	new tut4_4[128] = "conhece o comando de descartar drogas e as descarta rapidamente só para não ser mul-";
	new tut4_5[128] = "tado ou preso.\" Isso é considerado powergaming e resulta em multa à quem pratica.";
	new tut4[640]; format(tut4, sizeof (tut4), "%s\n%s\n%s\n%s\n%s", tut4_1, tut4_2, tut4_3, tut4_4, tut4_5);

	new tut5_1[128] = "In-character é o estado chamado pra quem está simulando no jogo. Você sempre estará";
	new tut5_2[128] = "usando IC a não ser que você deslogue. Enquanto você está no IC, você deve usar o";
	new tut5_3[128] = "chat \"T\" para falar. Diga como se fosse você na vida real: \"Pedro vou ali no";
	new tut5_4[128] = "mercado ir comprar um celular\" - Não use gírias ou emotions enquanto usa o IC,";
	new tut5_5[128] = "muito menos passe seu msn. Converse de assuntos que tem a ver com o jogo.";
	new tut5[640]; format(tut5, sizeof (tut5), "%s\n%s\n%s\n%s\n%s", tut5_1, tut5_2, tut5_3, tut5_4, tut5_5);

	new tut6_1[128] = "Out-of-character é o estado chamado pra quem não está simulando no jogo. O chat do";
	new tut6_2[128] = "OOC é o \"/b\". No OOC você pode usar emotions, falar sobre assuntos de fora do jo-";
	new tut6_3[128] = "jogo. Exemplo: \"Cara, to morrendo de sono xD\" - Pode passar o seu msn, orkut, etc.";
	new tut6_4[128] = "IMPORTANTE: Você pode usar o OOC para tirar dúvidas. Não tire dúvidas no IC.";
	new tut6_5[128] = "Enfim, use para falar sobre qualquer coisa que não esteja relacionada ao jogo.";
	new tut6[640]; format(tut6, sizeof (tut6), "%s\n%s\n%s\n%s\n%s", tut6_1, tut6_2, tut6_3, tut6_4, tut6_5);

	new tut7_1[128] = "Sempre tenha respeito com os outros jogadores, nunca chingue alguém, a não ser que";
	new tut7_2[128] = "seja motivos IC. Você pode tirar suas dúvidas no chat de novatos usando \"/novato\"";
	new tut7_3[128] = "ou \"/n\". Esse chat é global e jogadores mais experientes lhe ajudarão. Você pode";
	new tut7_4[128] = "também fazer um anúncio usando \"/anunciar\". Nunca faça flooding/spamming ou use";
	new tut7_5[128] = "o chat de novatos e anúncios indevidamente, pois você poderá ser multado.";
	new tut7[640]; format(tut7, sizeof (tut7), "%s\n%s\n%s\n%s\n%s", tut7_1, tut7_2, tut7_3, tut7_4, tut7_5);

	new tut8_1[128] = "Aqui encerra-se o tutorial básico. Possuimos um fórum que contém mais tutorias sobre";
	new tut8_2[128] = "nosso servidor. Lá também você pode se inscrever para profissões públicas. Nosso en-";
	new tut8_3[128] = "dereço é: sarpg.7forum.net. Adicione também nosso ip fixo aos seus servidores favo-";
	new tut8_4[128] = "ritos: sarpgserver.no-ip.info. Esperamos que tenha um bom jogo, e sempre contaremos";
	new tut8_5[128] = "com você para que o servidor cresça. Seja bem-vindo mais uma vez!";
	new tut8[640]; format(tut8, sizeof (tut8), "%s\n%s\n%s\n%s\n%s", tut8_1, tut8_2, tut8_3, tut8_4, tut8_5);

	if (dialogid == DIALOG_APRENDER && response)
	{
		switch (listitem)
 		{
			case 0:
			{
				if (PlayerStats[playerid][Boxing] == 1)
				{
					SendClientMessage(playerid, CINZA, "ERRO: Você já aprendeu boxing.");
					return 1;
				}
				if (PlayerStats[playerid][Dinheiro] < 600)
				{
					SendClientMessage(playerid, CINZA, "ERRO: O estilo boxing custa $600.");
 					return 1;
				}
				PlayerStats[playerid][Dinheiro] -= 600;
				PlayerStats[playerid][Boxing] = 1;
				GameTextForPlayer(playerid, "boxing aprendido", 1000, 0);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			}
			case 1:
			{
   				if (PlayerStats[playerid][Kungfu] == 1)
				{
					SendClientMessage(playerid, CINZA, "ERRO: Você já aprendeu kung-fu.");
					return 1;
				}
				if (PlayerStats[playerid][Dinheiro] < 1500)
				{
					SendClientMessage(playerid, CINZA, "ERRO: O estilo kung-fu custa $1500.");
 					return 1;
				}
				PlayerStats[playerid][Dinheiro] -= 1500;
				PlayerStats[playerid][Kungfu] = 1;
				GameTextForPlayer(playerid, "kung-fu aprendido", 1000, 0);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			}
			case 2:
			{
   				if (PlayerStats[playerid][Lutalivre] == 1)
				{
					SendClientMessage(playerid, CINZA, "ERRO: Você já aprendeu luta livre.");
					return 1;
				}
				if (PlayerStats[playerid][Dinheiro] < 300)
				{
					SendClientMessage(playerid, CINZA, "ERRO: O estilo luta livre custa $300.");
 					return 1;
				}
				PlayerStats[playerid][Dinheiro] -= 300;
				PlayerStats[playerid][Lutalivre] = 1;
				GameTextForPlayer(playerid, "luta livre aprendido", 1000, 0);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			}
		}
 	}
 	if (dialogid == DIALOG_ESTILO && response)
 	{
 	    switch (listitem)
 	    {
 	        case 0:
 	        {
 	        	if (PlayerStats[playerid][Boxing] == 0)
				{
					SendClientMessage(playerid, CINZA, "ERRO: Você não aprendeu boxing ainda.");
					return 1;
				}
				SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			}
			case 1:
			{
				if (PlayerStats[playerid][Kungfu] == 0)
				{
					SendClientMessage(playerid, CINZA, "ERRO: Você não aprendeu kung-fu ainda.");
					return 1;
				}
				SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			}
	        case 2:
	        {
	    		if (PlayerStats[playerid][Lutalivre] == 0)
				{
					SendClientMessage(playerid, CINZA, "ERRO: Você não aprendeu luta livre ainda.");
					return 1;
				}
				SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			}
 	    }
 	}
 	if (dialogid == DIALOG_LOGAR)
 	{
 	    if (response)
 	    {
    		new File:playerfile = fopen(PlayerFile(PlayerName(playerid)), io_read), tmp[128], key[128], value[128];
			while (fread(playerfile, tmp, sizeof (tmp)))
			{
 				key = GetValueKey(tmp);
	    		value = GetKeyValue(tmp);
				if (Compare(key, "Senha")) PlayerStats[playerid][Senha] = value;
			}
			fclose(playerfile);
			if (strcmp(inputtext, PlayerStats[playerid][Senha], true))
			{
	    		SendClientMessage(playerid, CINZA, "ERRO: Senha incorreta.");
	    		ShowPlayerDialog(playerid, DIALOG_LOGAR, DIALOG_STYLE_INPUT, "Insira sua senha para logar:", "", "Logar", "Sair");
	    		return 1;
			}
			LoadPlayerAccount(playerid);
			LoadSpawnSettings(playerid);
			ApplyPlayerVarValues(playerid);
			GameTextForPlayer(playerid, "~g~logado", 1000, 0);
		}
		else
		{
		    Kick(playerid);
		}
	}
	if (dialogid == DIALOG_REGISTRAR && response)
	{
		if (!strlen(inputtext) || (strlen(inputtext) < 6 || strlen(inputtext) > 12))
		{
			SendClientMessage(playerid, CINZA, "ERRO: A senha deve conter de 6 a 12 caracteres.");
			ShowPlayerDialog(playerid, DIALOG_REGISTRAR, DIALOG_STYLE_INPUT, "Crie uma senha para registrar:", "", "Registrar", "Cancelar");
			return 1;
		}
		SetValue(PlayerStats[playerid][Senha], inputtext);
		SavePlayerAccount(playerid);
		ApplyPlayerVarValues(playerid);
		SetPlayerHealth(playerid, 50.0);
		SetPlayerColor(playerid, BRANCO);
		SendClientMessage(playerid, CINZA, "DICA: Use /ajuda para ver a lista de comandos.");
		GameTextForPlayer(playerid, "~g~cadastrado", 1000, 0);
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
	}
	return 0;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

//---------------------------------------------------------- FUNÇÃO GERAL

stock PlayerName(playerid)
{
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	return pname;
}

stock GetPlayerId(playername[])
{
	for (new playerid = 0; playerid < MAX_SLOTS; playerid++)
	{
	    if (!strcmp(playername, PlayerName(playerid), true)) return playerid;
	}
	return INVALID_PLAYER_ID;
}

stock GetValueKey(string[])
{
    new tmp[128];
    tmp[0] = 0;
	if (strfind(string, "=", true) == -1) return tmp;
	strmid(tmp, string, 0, strfind(string, "=", true));
	return tmp;
}

stock GetKeyValue(string[])
{
    new tmp[128];
	tmp[0] = 0;
	if (strfind(string, "=", true) == -1) return tmp;
	if (strfind(string, "\r", true) == -1) strmid(tmp, string, strfind(string, "=", true)+1, strlen(string));
	else strmid(tmp, string, strfind(string, "=", true)+1, strfind(string, "\r", true));
	return tmp;
}

stock SetValue(dest[], source[])
{
  	for (new i = 0; i < strlen(source); i++)
	{
		dest[i] = source[i];
  	}
  	dest[strlen(source)] = 0;
}

stock Compare(string1[], string2[])
{
	if (!strlen(string1) || strlen(string1) != strlen(string2)) return false;
	for (new i = 0; i < strlen(string1); i++)
	{
	    if (strcmp(string1, string2, true) != 0) return false;
	}
	return true;
}

strtok(const string[], &index, seperator = ' ')
{
	new length = strlen(string);
	new offset = index;
	new result[256];
	while ((index < length) && (string[index] != seperator) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	if ((index < length) && (string[index] == seperator))
	{
		index++;
	}
	return result;
}

//---------------------------------------------------------- FUNÇÃO CONTA

stock PlayerFile(playername[])
{
    new string[MAX_PLAYER_NAME+18];
	format(string, sizeof (string), "SARPG/Contas/%s.ini", playername);
	return string;
}

stock SavePlayerAccount(playerid)
{
	if (!fexist(PlayerFile(PlayerName(playerid))))
	{
 		PlayerStats[playerid][Tutorial] = 0;
 		PlayerStats[playerid][Level] = 0;
 		PlayerStats[playerid][Vida] = 50.0;
 		PlayerStats[playerid][Colete] = 0.0;
 		PlayerStats[playerid][Skin] = 0;
 		PlayerStats[playerid][Banco] = 0;
 		PlayerStats[playerid][Dinheiro] = 100;
 		PlayerStats[playerid][Emprego] = 0;
 		PlayerStats[playerid][EmpregoL] = 0;
 		PlayerStats[playerid][Familia] = 0;
 		PlayerStats[playerid][FamiliaL] = 0;
 		PlayerStats[playerid][Celular] = 0;
 		PlayerStats[playerid][Boxing] = 0;
 		PlayerStats[playerid][Kungfu] = 0;
 		PlayerStats[playerid][Lutalivre] = 0;
 		PlayerStats[playerid][Acessorio] = 0;
 		PlayerStats[playerid][Pistola] = 0;
		PlayerStats[playerid][Shotgun] = 0;
		PlayerStats[playerid][SubMachine] = 0;
		PlayerStats[playerid][Machine] = 0;
		PlayerStats[playerid][Rifle] = 0;
		PlayerStats[playerid][Interior] = 0;
		PlayerStats[playerid][Angle] = 0.0;
		PlayerStats[playerid][SpawnX] = 0.0;
		PlayerStats[playerid][SpawnY] = 0.0;
		PlayerStats[playerid][SpawnZ] = 0.0;
	}
 	new File:playerfile, strsave[64];
	playerfile = fopen(PlayerFile(PlayerName(playerid)), io_write);
	format(strsave, sizeof (strsave), "Senha=%s\r\n", PlayerStats[playerid][Senha]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Level=%d\r\n", PlayerStats[playerid][Level]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Vida=%f\r\n", PlayerStats[playerid][Vida]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Colete=%f\r\n", PlayerStats[playerid][Colete]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Skin=%d\r\n", PlayerStats[playerid][Skin]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Banco=%d\r\n", PlayerStats[playerid][Banco]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Dinheiro=%d\r\n", PlayerStats[playerid][Dinheiro]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Emprego=%d\r\n", PlayerStats[playerid][Emprego]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "EmpregoLevel=%d\r\n", PlayerStats[playerid][EmpregoL]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Familia=%d\r\n", PlayerStats[playerid][Familia]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "FamiliaLevel=%d\r\n", PlayerStats[playerid][FamiliaL]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Celular=%d\r\n", PlayerStats[playerid][Celular]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Boxing=%d\r\n", PlayerStats[playerid][Boxing]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Kungfu=%d\r\n", PlayerStats[playerid][Kungfu]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Lutalivre=%d\r\n", PlayerStats[playerid][Lutalivre]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Acessorio=%d\r\n", PlayerStats[playerid][Acessorio]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Pistola=%d\r\n", PlayerStats[playerid][Pistola]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Shotgun=%d\r\n", PlayerStats[playerid][Shotgun]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "SubMachine=%d\r\n", PlayerStats[playerid][SubMachine]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Machine=%d\r\n", PlayerStats[playerid][Machine]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Rifle=%d\r\n", PlayerStats[playerid][Rifle]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Interior=%d\r\n", PlayerStats[playerid][Interior]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "Angle=%f\r\n", PlayerStats[playerid][Angle]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "SpawnX=%f\r\n", PlayerStats[playerid][SpawnX]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "SpawnY=%f\r\n", PlayerStats[playerid][SpawnY]);
	fwrite(playerfile, strsave);
	format(strsave, sizeof (strsave), "SpawnZ=%f\r\n", PlayerStats[playerid][SpawnZ]);
	fwrite(playerfile, strsave);
 	fclose(playerfile);
}

stock LoadPlayerAccount(playerid)
{
	new File:playerfile, tmp[128], key[128], value[128];
	playerfile = fopen(PlayerFile(PlayerName(playerid)), io_read);
	while (fread(playerfile, tmp, sizeof (tmp)))
	{
 		key = GetValueKey(tmp);
	    value = GetKeyValue(tmp);
		if (Compare(key, "Senha")) PlayerStats[playerid][Senha] = value;
		if (Compare(key, "Tutorial")) PlayerStats[playerid][Tutorial] = strval(value);
		if (Compare(key, "Level")) PlayerStats[playerid][Level] = strval(value);
		if (Compare(key, "Vida")) PlayerStats[playerid][Vida] = strval(value);
		if (Compare(key, "Colete")) PlayerStats[playerid][Colete] = strval(value);
		if (Compare(key, "Skin")) PlayerStats[playerid][Skin] = strval(value);
		if (Compare(key, "Banco")) PlayerStats[playerid][Banco] = strval(value);
		if (Compare(key, "Dinheiro")) PlayerStats[playerid][Dinheiro] = strval(value);
		if (Compare(key, "Emprego")) PlayerStats[playerid][Emprego] = strval(value);
		if (Compare(key, "EmpregoL")) PlayerStats[playerid][EmpregoL] = strval(value);
		if (Compare(key, "Familia")) PlayerStats[playerid][Familia] = strval(value);
		if (Compare(key, "FamiliaL")) PlayerStats[playerid][FamiliaL] = strval(value);
		if (Compare(key, "Celular")) PlayerStats[playerid][Celular] = strval(value);
		if (Compare(key, "Boxing")) PlayerStats[playerid][Boxing] = strval(value);
		if (Compare(key, "Kungfu")) PlayerStats[playerid][Kungfu] = strval(value);
		if (Compare(key, "Lutalivre")) PlayerStats[playerid][Lutalivre] = strval(value);
		if (Compare(key, "Acessorio")) PlayerStats[playerid][Acessorio] = strval(value);
		if (Compare(key, "Pistola")) PlayerStats[playerid][Pistola] = strval(value);
		if (Compare(key, "Shotgun")) PlayerStats[playerid][Shotgun] = strval(value);
		if (Compare(key, "SubMachine")) PlayerStats[playerid][SubMachine] = strval(value);
		if (Compare(key, "Machine")) PlayerStats[playerid][Machine] = strval(value);
		if (Compare(key, "Rifle")) PlayerStats[playerid][Rifle] = strval(value);
		if (Compare(key, "Interior")) PlayerStats[playerid][Interior] = strval(value);
		if (Compare(key, "Angle")) PlayerStats[playerid][Angle] = strval(value);
		if (Compare(key, "SpawnX")) PlayerStats[playerid][SpawnX] = strval(value);
		if (Compare(key, "SpawnY")) PlayerStats[playerid][SpawnY] = strval(value);
		if (Compare(key, "SpawnZ")) PlayerStats[playerid][SpawnZ] = strval(value);
	}
	fclose(playerfile);
}

stock LoadSpawnSettings(playerid)
{
    if (PlayerStats[playerid][Vida] <= 0.0) SetPlayerHealth(playerid, 1.0);
	else SetPlayerHealth(playerid, PlayerStats[playerid][Vida]);
	SetPlayerInterior(playerid, PlayerStats[playerid][Interior]);
	SetSpawnInfo(playerid, 0, PlayerStats[playerid][Skin], PlayerStats[playerid][SpawnX], PlayerStats[playerid][SpawnY], PlayerStats[playerid][SpawnZ], PlayerStats[playerid][Angle], 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	SetPlayerArmour(playerid, PlayerStats[playerid][Colete]);
	GivePlayerMoney(playerid, PlayerStats[playerid][Dinheiro]);
	GivePlayerWeapon(playerid, PlayerStats[playerid][Acessorio], 99999);
	GivePlayerWeapon(playerid, PlayerStats[playerid][Pistola], 99999);
	GivePlayerWeapon(playerid, PlayerStats[playerid][Shotgun], 99999);
	GivePlayerWeapon(playerid, PlayerStats[playerid][SubMachine], 99999);
	GivePlayerWeapon(playerid, PlayerStats[playerid][Machine], 99999);
	GivePlayerWeapon(playerid, PlayerStats[playerid][Rifle], 99999);
	SetPlayerColor(playerid, BRANCO);
	if (PlayerStats[playerid][Familia] != 0) SetPlayerTeam(playerid, PlayerStats[playerid][Familia]);
}

stock ApplyPlayerVarValues(playerid)
{
    PlayerInTeste[playerid] = 0;
	TutorialParte[playerid] = -1;
}

//---------------------------------------------------------- TUTORIAL

stock ShowTutorial(playerid, tutorialid)
{
	if (tutorialid == 0)
	{
	    SendClientMessage(playerid, AMARELO, "");
		SendClientMessage(playerid, AMARELO, "Parte 1 - [Regras]:");
		SendClientMessage(playerid, AMARELO, "Não pratique death-match ou revenge-kill - Ban permanente.");
		SendClientMessage(playerid, AMARELO, "Não pratique metagaming ou powergaming - Multa.");
		SendClientMessage(playerid, AMARELO, "Não use mods ou cheats - Ban permanente.");
		SendClientMessage(playerid, AMARELO, "Não cometa drive-by enquanto dirige um veículo - Kick.");
		SendClientMessage(playerid, AMARELO, "Não flood ou use o /anunciar ou /novato indevidamente - Multa.");
    	SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 1)
	{
		SendClientMessage(playerid, AMARELO, "");
    	SendClientMessage(playerid, AMARELO, "Parte 2 - [Introdução]:");
    	SendClientMessage(playerid, AMARELO, "Este servidor é do estilo RPG. Aqui tentaremos lhe ensinar o básico sobre RPG.");
    	SendClientMessage(playerid, AMARELO, "O servidor usa o SARPG - San Andreas RPG, onde é explorado todos os recursos em");
		SendClientMessage(playerid, AMARELO, "toda San Andreas. Existem empregos, empresas e casas espalhados pela cidade.");
		SendClientMessage(playerid, AMARELO, "Nos próximos tópicos lhe explicaremos sobre termos básicos. Lembre-se: você po-");
		SendClientMessage(playerid, AMARELO, "derá ver este tutorial quantas vezes quiser, basta vir até este local.");
		SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 2)
	{
		SendClientMessage(playerid, AMARELO, "");
		SendClientMessage(playerid, AMARELO, "Parte 3 - [Interpretando]:");
    	SendClientMessage(playerid, AMARELO, "Interpretar no básico é você \"entrar\" dentro do presonagem do jogo, ou seja, vo-");
  		SendClientMessage(playerid, AMARELO, "cê deve agir em cada situação do jogo como se fosse você na sua vida real. Por exem-");
		SendClientMessage(playerid, AMARELO, "plo: \"Um sujeito aponta uma arma para você\" - Na vida real você vai ficar com medo");
		SendClientMessage(playerid, AMARELO, "e obdecer a pessoa que está em posse da arma. É diferente de você sair correndo em");
		SendClientMessage(playerid, AMARELO, "zig-zag feito besta. Sempre simule e antes de agir lembre-se desse termo importante.");
		SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 3)
	{
    	SendClientMessage(playerid, AMARELO, "");
    	SendClientMessage(playerid, AMARELO, "Parte 4 - [Metagaming]:");
		SendClientMessage(playerid, AMARELO, "Metagaming consiste em usar fatores externos ao jogo para afetar fatores internos no");
  		SendClientMessage(playerid, AMARELO, "jogo. Exemplo: \"Você está no team-speak com um amigo, ai você é sequestrado\" - Caso");
		SendClientMessage(playerid, AMARELO, "você fale onde você está por team-speak e ele vai até o seu cativeiro no jogo, ele e");
		SendClientMessage(playerid, AMARELO, "você vão estar praticando metagaming. Não faça isso pois é considerado anti-rpg e é");
		SendClientMessage(playerid, AMARELO, "proibido em nosso servidor. Sempre interprete. Metagaming resultará em multa.");
		SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 4)
	{
    	SendClientMessage(playerid, AMARELO, "");
    	SendClientMessage(playerid, AMARELO, "Parte 5 - [Powergaming]:");
 		SendClientMessage(playerid, AMARELO, "Powergaming é usar sua experiência no jogo para obter cada lucro e cada benefício");
  		SendClientMessage(playerid, AMARELO, "injustamente, evitando perdas que são necessárias para que o jogo ocorra em bons");
		SendClientMessage(playerid, AMARELO, "padrões. Por exemplo: \" você é parado em uma blitz policial e possui drogas. Você");
		SendClientMessage(playerid, AMARELO, "conhece o comando de descartar drogas e as descarta rapidamente só para não ser mul-");
		SendClientMessage(playerid, AMARELO, "tado ou preso.\" Isso é considerado powergaming e resulta em multa à quem pratica.");
		SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 5)
	{
    	SendClientMessage(playerid, AMARELO, "");
    	SendClientMessage(playerid, AMARELO, "Parte 6 - [In-Character (IC)]:");
 		SendClientMessage(playerid, AMARELO, "In-character é o estado chamado pra quem está simulando no jogo. Você sempre estará");
  		SendClientMessage(playerid, AMARELO, "usando IC a não ser que você deslogue. Enquanto você está no IC, você deve usar o");
		SendClientMessage(playerid, AMARELO, "chat \"T\" para falar. Diga como se fosse você na vida real: \"Pedro vou ali no");
		SendClientMessage(playerid, AMARELO, "mercado ir comprar um celular\" - Não use gírias ou emotions enquanto usa o IC,");
		SendClientMessage(playerid, AMARELO, "muito menos passe seu msn. Converse de assuntos que tem a ver com o jogo.");
		SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 6)
	{
    	SendClientMessage(playerid, AMARELO, "");
    	SendClientMessage(playerid, AMARELO, "Parte 7 - [Out-Of-Character (OOC)]:");
 		SendClientMessage(playerid, AMARELO, "Out-of-character é o estado chamado pra quem não está simulando no jogo. O chat do");
  		SendClientMessage(playerid, AMARELO, "OOC é o \"/b\". No OOC você pode usar emotions, falar sobre assuntos de fora do jo-");
		SendClientMessage(playerid, AMARELO, "jogo. Exemplo: \"Cara, to morrendo de sono xD\" - Pode passar o seu msn, orkut, etc.");
		SendClientMessage(playerid, AMARELO, "IMPORTANTE: Você pode usar o OOC para tirar dúvidas. Não tire dúvidas no IC.");
		SendClientMessage(playerid, AMARELO, "Enfim, use para falar sobre qualquer coisa que não esteja relacionada ao jogo.");
		SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 7)
	{
    	SendClientMessage(playerid, AMARELO, "");
    	SendClientMessage(playerid, AMARELO, "Parte 8 - [Chat]:");
		SendClientMessage(playerid, AMARELO, "Sempre tenha respeito com os outros jogadores, nunca chingue alguém, a não ser que");
  		SendClientMessage(playerid, AMARELO, "seja motivos IC. Você pode tirar suas dúvidas no chat de novatos usando \"/novato\"");
		SendClientMessage(playerid, AMARELO, "ou \"/n\". Esse chat é global e jogadores mais experientes lhe ajudarão. Você pode");
		SendClientMessage(playerid, AMARELO, "também fazer um anúncio usando \"/anunciar\". Nunca faça flooding/spamming ou use");
		SendClientMessage(playerid, AMARELO, "o chat de novatos e anúncios indevidamente, pois você poderá ser multado.");
		SendClientMessage(playerid, AMARELO, "");
	}
	if (tutorialid == 8)
	{
    	SendClientMessage(playerid, AMARELO, "");
    	SendClientMessage(playerid, AMARELO, "Parte 9 - [Conclusão]:");
 		SendClientMessage(playerid, AMARELO, "Aqui encerra-se o tutorial básico. Possuimos um fórum que contém mais tutorias sobre");
  		SendClientMessage(playerid, AMARELO, "nosso servidor. Lá também você pode se inscrever para profissões públicas. Nosso en-");
		SendClientMessage(playerid, AMARELO, "dereço é: sarpg.7forum.net. Adicione também nosso ip fixo aos seus servidores favo-");
		SendClientMessage(playerid, AMARELO, "ritos: sarpgserver.no-ip.info. Esperamos que tenha um bom jogo, e sempre contaremos");
		SendClientMessage(playerid, AMARELO, "com você para que o servidor cresça. Seja bem-vindo mais uma vez!");
		SendClientMessage(playerid, AMARELO, "");
	}
}

//---------------------------------------------------------- DCMDS

dcmd_comprar(playerid, item[])
{
	if (!fexist(PlayerFile(PlayerName(playerid)))) return 1;
	if (!strlen(item))
	{
	    SendClientMessage(playerid, CINZA, "DICA: Use /comprar [item].");
	    SendClientMessage(playerid, CINZA, "Itens: celular.");
	    return 1;
	}
	if (!strcmp(item, "celular", true))
	{
		if (!IsPlayerInRangeOfPoint(playerid, 2.0, -2226.3914, 128.3195, 1035.4141))
		{
	    	SendClientMessage(playerid, CINZA, "ERRO: Você não está na loja de eletrônicos (San Fierro).");
	    	return 1;
		}
		if (PlayerStats[playerid][Celular] != 0)
		{
	    	SendClientMessage(playerid, CINZA, "ERRO: Você já possui um celular.");
	    	return 1;
		}
		if (PlayerStats[playerid][Dinheiro] < 300)
		{
		    SendClientMessage(playerid, CINZA, "ERRO: O celular custa $300.");
		    return 1;
		}
		new celnumber = random(8999)+1000;
		PlayerStats[playerid][Celular] = celnumber;
		format(msg, sizeof (msg), "INFO: Seu número é %d.", celnumber); SendClientMessage(playerid, CINZA, msg);
		GameTextForPlayer(playerid, "celular adiquirido", 1000, 0);
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
	}
	return 1;
}
