// San Andreas Role Play Game desenvolvido por Osorkon.

#include <a_samp>
#include <dini>

#define MAX_SLOTS 50

#define CINZA 0xBEBEBEAA
#define BRANCO 0xFFFFFFAA
#define AMARELO 0xFFFF00AA
#define VERDE 0x00FF00AA
#define VERMELHO 0xFF0000AA
#define AZUL 0x0000FFAA

#define REGISTRO_REGRAS 0
#define REGISTRO_SENHA 1
#define REGISTRO_INFO 2
#define REGISTRO_TUTORIAL_1 3
#define REGISTRO_TUTORIAL_2 4
#define REGISTRO_TUTORIAL_3 5
#define REGISTRO_TUTORIAL_4 6
#define REGISTRO_TUTORIAL_5 7
#define REGISTRO_TUTORIAL_6 8
#define REGISTRO_TUTORIAL_7 9
#define REGISTRO_TUTORIAL_8 10

main()
{
	print("\n----------------------------------");
	print(" San Andreas Role Play by Osorkon");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	SetGameModeText("SARPG");
	AddPlayerClass(0, 1674.7595, 1448.1327, 10.7894, 271.5641, 0, 0, 0, 0, 0, 0);
	
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	SendClientMessage(playerid, CINZA, "SERVER: Seja bem-vindo ao San Andreas RPG.");
	if (!dini_Exists(PlayerFile(PlayerName(playerid))))
	{
	    SendClientMessage(playerid, CINZA, "Você pode jogar sem registro, porém não será considerado como jogador normal.");
	}
	else
	{
	    SendClientMessage(playerid, CINZA, "DICA: Use /logar para carregar sua conta.");
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
    SetPlayerMapIcon(playerid, 0, 1115.7350, -930.6904, 43.1311, 35, 0);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if (dini_Exists(PlayerFile(PlayerName(playerid))))
	{
		new Float:Health;
		GetPlayerHealth(playerid, Health);
		dini_FloatSet(PlayerFile(PlayerName(playerid)), "Vida", Health);
	
		new Float:Armour;
		GetPlayerArmour(playerid, Armour);
		dini_FloatSet(PlayerFile(PlayerName(playerid)), "Colete", Armour);

		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnX", X);
		dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnX", Y);
		dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnX", Z);
	
		new Float:A;
		GetPlayerFacingAngle(playerid, A);
		dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnA", A);
	
    	dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnI", GetPlayerInterior(playerid));

		dini_IntSet(PlayerFile(PlayerName(playerid)), "Procurado", GetPlayerWantedLevel(playerid));

		dini_IntSet(PlayerFile(PlayerName(playerid)), "Dinheiro", GetPlayerMoney(playerid));
		
		SendClientMessage(playerid, CINZA, "SERVER: Estado do personagem salvo com sucesso.");
	}
	else
	{
	    SendClientMessage(playerid, CINZA, "SERVER: Volte sempre desonhecido.");
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
    if (dini_Exists(PlayerFile(PlayerName(playerid))))
	{
	    SetPlayerColor(playerid, BRANCO);
	}
	else
	{
	    SendClientMessage(playerid, CINZA, "DICA: Vá até o departamento de registro civíl (disquete) e faça seu registro.");
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
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256];
	new tmp[256];
	new msg[64];
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
	
	if (!strcmp(cmd, "/registrar", true))
	{
	    //if (IsPlayerConnected(playerid)){
	    
	  //  if (!IsPlayerInRangeOfPoint(playerid, 2.0, 1116.0750, -924.2917, 43.3906))
    	//{
    	  //  return 1; // Player não está no ponto de registro
    	//}
	    
    	if (dini_Exists(PlayerFile(PlayerName(playerid))))
    	{
    		return 1; // Player já possui uma conta registrada no servidor
    	}
    	
    	TogglePlayerControllable(playerid, 0);
    	
    	new rules[1024];
   		new rule1[] = "Não pratique death-match ou revenge-kill - Ban permanente";
	    new	rule2[] = "Não pratique metagaming ou powergaming - Multa";
	    new	rule3[] = "Não use mods ou cheats - Ban permanente";
	    new	rule4[] = "Não cometa drive-by enquanto dirige um veículo - Kick";
	    new	rule5[] = "Não flood ou use o /anunciar ou /novato indevidamente - Multa";
    	
    	format(rules, sizeof (rules), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", rule1, rule2, rule3, rule4, rule5);
    	
    	ShowPlayerDialog(playerid, REGISTRO_REGRAS, DIALOG_STYLE_MSGBOX, "Lista de regras e punições consequentes:", rules, "Concordar", "Discordar");
    
	    return 1;
	}
	
	if (strcmp("/carex", cmd, true) == 0)
	{
 		if (!IsPlayerConnected(playerid)) return 0;

	    if (!IsPlayerAdmin(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Você não é um administrador.");
	        return 1;
	    }

	    if (IsPlayerInAnyVehicle(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Saia do veículo atual para poder criar outro veículo.");
	        return 1;
	    }

	    new Float:X, Float:Y, Float:Z, Float:A;
	    GetPlayerPos(playerid, X, Y, Z);
	    GetPlayerFacingAngle(playerid, A);

		new cid;
		tmp = strtok(cmdtext, idx);
		cid = strval(tmp);
		if (!strlen(tmp))
		{
		    //SendClientMessage(playerid, cVERMELHO1, "Use /carex [id] [cor1] [cor2].");
		    return 1;
		}

		new cor1;
		tmp = strtok(cmdtext, idx);
		cor1 = strval(tmp);
		if (!strlen(tmp))
		{
		    //SendClientMessage(playerid, cVERMELHO1, "Use /carex [id] [cor1] [cor2].");
		    return 1;
		}

		new cor2;
		tmp = strtok(cmdtext, idx);
		cor2 = strval(tmp);
		if (!strlen(tmp))
		{
		    //SendClientMessage(playerid, cVERMELHO1, "Use /carex [id] [cor1] [cor2].");
		    return 1;
		}

		AddStaticVehicleEx(cid, X, Y, Z, A, cor1, cor2, -1);
		return 1;
	}
	
	if (strcmp("/respawn", cmd, true) == 0)
	{
	    if (!IsPlayerConnected(playerid)) return 0;

	    if (!IsPlayerAdmin(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Você não é um administrador.");
	        return 1;
	    }

	    if (!IsPlayerInAnyVehicle(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Você não está em nenhum veículo.");
	        return 1;
	    }
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		return 1;
	}

	if (strcmp("/destruir", cmd, true) == 0)
	{
	    if (!IsPlayerConnected(playerid)) return 0;

	    if (!IsPlayerAdmin(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Você não é um administrador.");
	        return 1;
	    }

	    if (!IsPlayerInAnyVehicle(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Você não está em nenhum veículo.");
	        return 1;
	    }
		DestroyVehicle(GetPlayerVehicleID(playerid));
		return 1;
	}

	if (strcmp("/consertar", cmd, true) == 0)
	{
	    if (!IsPlayerConnected(playerid)) return 0;

	    if (!IsPlayerAdmin(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Você não é um administrador.");
	        return 1;
	    }

	    if (!IsPlayerInAnyVehicle(playerid))
	    {
	        //SendClientMessage(playerid, cVERMELHO1, "Você não está em nenhum veículo.");
	        return 1;
	    }
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
    if (!dini_Exists(PlayerFile(PlayerName(playerid)))) return 1;
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
    new tuts1[1024];
    new tut1_1[] = "Este servidor é do estilo RPG. Aqui tentaremos lhe ensinar o básico sobre RPG.";
    new tut1_2[] = "O servidor usa o SARPG - San Andreas RPG, onde é explorado todos os recursos em";
	new tut1_3[] = "toda San Andreas. Existem empregos, empresas e casas espalhados pela cidade.";
	new tut1_4[] = "Nos próximos tópicos lhe explicaremos sobre termos básicos. Lembre-se: você po-";
	new tut1_5[] = "derá ver este tutorial quantas vezes quiser, basta vir até este local.";
	format(tuts1, sizeof (tuts1), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut1_1, tut1_2, tut1_3, tut1_4, tut1_5);

	new tuts2[1024];
 	new tut2_1[] = "Interpretar no básico é você \"entrar\" dentro do presonagem do jogo, ou seja, vo-";
  	new tut2_2[] = "cê deve agir em cada situação do jogo como se fosse você na sua vida real. Por exem-";
	new tut2_3[] = "plo: \"Um sujeito aponta uma arma para você\" - Na vida real você vai ficar com medo";
	new tut2_4[] = "e obdecer a pessoa que está em posse da arma. É diferente de você sair correndo em";
	new tut2_5[] = "zig-zag feito besta. Sempre simule e antes de agir lembre-se desse termo importante.";
	format(tuts2, sizeof (tuts2), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut2_1, tut2_2, tut2_3, tut2_4, tut2_5);
	
	new tuts3[1024];
 	new tut3_1[] = "Metagaming consiste em usar fatores externos ao jogo para afetar fatores internos no";
  	new tut3_2[] = "jogo. Exemplo: \"Você está no team-speak com um amigo, ai você é sequestrado\" - Caso";
	new tut3_3[] = "você fale onde você está por team-speak e ele vai até o seu cativeiro no jogo, ele e";
	new tut3_4[] = "você vão estar praticando metagaming. Não faça isso pois é considerado anti-rpg e é";
	new tut3_5[] = "proibido em nosso servidor. Sempre interprete. Metagaming resultará em multa.";
	format(tuts3, sizeof (tuts3), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut3_1, tut3_2, tut3_3, tut3_4, tut3_5);
	
	new tuts4[1024];
 	new tut4_1[] = "Powergaming é usar sua experiência no jogo para obter cada lucro e cada benefício";
  	new tut4_2[] = "injustamente, evitando perdas que são necessárias para que o jogo ocorra em bons";
	new tut4_3[] = "padrões. Por exemplo: \" você é parado em uma blitz policial e possui drogas. Você";
	new tut4_4[] = "conhece o comando de descartar drogas e as descarta rapidamente só para não ser mul-";
	new tut4_5[] = "tado ou preso.\" Isso é considerado powergaming e resulta em multa à quem pratica.";
	format(tuts4, sizeof (tuts4), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut4_1, tut4_2, tut4_3, tut4_4, tut4_5);
	
	new tuts5[1024];
 	new tut5_1[] = "In-character é o estado chamado pra quem está simulando no jogo. Você sempre estará";
  	new tut5_2[] = "usando IC a não ser que você deslogue. Enquanto você está no IC, você deve usar o";
	new tut5_3[] = "chat \"T\" para falar. Diga como se fosse você na vida real: \"Pedro eu to indo ali";
	new tut5_4[] = "no mercado ir comprar um celular\" - Não use gírias ou emoticons enquanto usa o IC,";
	new tut5_5[] = "muito menos passe seu msn. Converse de assuntos que tem a ver com o jogo.";
	format(tuts5, sizeof (tuts5), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut5_1, tut5_2, tut5_3, tut5_4, tut5_5);
	
	new tuts6[1024];
 	new tut6_1[] = "Out-of-character é o estado chamado pra quem não está simulando no jogo. O chat do";
  	new tut6_2[] = "OOC é o \"/b\". No OOC você pode usar emoticons, falar sobre assuntos de fora do jo-";
	new tut6_3[] = "jogo. Exemplo: \"Cara, to morrendo de sono xD\" - Pode passar o seu msn, orkut, etc.";
	new tut6_4[] = "IMPORTANTE: Você pode usar o OOC para tirar dúvidas. Não tire dúvidas no IC.";
	new tut6_5[] = "Enfim, use para falar sobre qualquer coisa que não esteja relacionada ao jogo.";
	format(tuts6, sizeof (tuts6), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut6_1, tut6_2, tut6_3, tut6_4, tut6_5);
	
	new tuts7[1024];
 	new tut7_1[] = "Sempre tenha respeito com os outros jogadores, nunca chingue alguém, a não ser que";
  	new tut7_2[] = "seja motivos IC. Voc~e pode tirar suas dúvidas no chat de novatos usando \"/novato\"";
	new tut7_3[] = "ou \"/n\". Esse chat é global e jogadores mais experientes lhe ajudarão. Você pode";
	new tut7_4[] = "também fazer um anúncio usando \"/anunciar\". Nunca faça flooding/spamming ou use";
	new tut7_5[] = "o chat de novatos e anúncios indevidamente, pois você poderá ser multado.";
	format(tuts7, sizeof (tuts7), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut7_1, tut7_2, tut7_3, tut7_4, tut7_5);
	
	new tuts8[1024];
 	new tut8_1[] = "Aqui encerra-se o tutorial básico. Possuimos um fórum que contém mais tutorias sobre";
  	new tut8_2[] = "nosso servidor. Lá também você pode se inscrever para profissões públicas. Nosso en-";
	new tut8_3[] = "dereço é: sarpg.7forum.net. Adicione também nosso ip fixo aos seus servidores favo-";
	new tut8_4[] = "ritos: sarpgserver.no-ip.info. Esperamos que tenha um bom jogo, e sempre contaremos";
	new tut8_5[] = "com você para que o servidor creça. Tenha um bom jogo!";
	format(tuts8, sizeof (tuts8), "\n%s\n\n%s\n\n%s\n\n%s\n\n%s", tut8_1, tut8_2, tut8_3, tut8_4, tut8_5);
	
	switch (dialogid)
	{
		case REGISTRO_REGRAS:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_SENHA, DIALOG_STYLE_INPUT, "Registro", "Crie uma senha:", "Registrar", "Cancelar");
		    }
		    else
		    {
		        TogglePlayerControllable(playerid, 1);
		    }
		}
		case REGISTRO_SENHA:
		{
		    if (response)
		    {
		        if (!strlen(inputtext) || (strlen(inputtext) < 5 || strlen(inputtext) > 11))
		        {
					return 1;
		        }
		        dini_Create(PlayerFile(PlayerName(playerid)));
		        dini_Set(PlayerFile(PlayerName(playerid)), "Senha", inputtext);
		        dini_FloatSet(PlayerFile(PlayerName(playerid)), "Vida", 100.0);
		        dini_FloatSet(PlayerFile(PlayerName(playerid)), "Colete", 0.0);
		        dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnX", 0);
                dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnY", 0);
                dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnZ", 0);
                dini_FloatSet(PlayerFile(PlayerName(playerid)), "SpawnA", 0);
                dini_IntSet(PlayerFile(PlayerName(playerid)), "SpawnI", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Banco", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Dinheiro", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Skin", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Acessorio", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Pistola", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Shotgun", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Metralhadora", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Rifle", 0);
		        dini_IntSet(PlayerFile(PlayerName(playerid)), "Rfile2", 0);
			    
				new string1[64];
				format(string1, sizeof (string1), "Senha registrada: %s", inputtext);
		        new info[1024];
		        new info1[] = "Sua conta foi registrada com sucesso em nosso banco de dados";
				
				format(info, sizeof (info), "\n%s\n\n%s", info1, string1);
		        
		        ShowPlayerDialog(playerid, REGISTRO_INFO, DIALOG_STYLE_MSGBOX, "Você registrou sua conta com sucesso:", info, "Cancelar", "Tutorial");
		    }
		    else
		    {
		        TogglePlayerControllable(playerid, 1);
		    }
		}
		case REGISTRO_INFO:
		{
		    if (response)
		    {
		        TogglePlayerControllable(playerid, 1);
		    }
		    else
		    {
				ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_1, DIALOG_STYLE_MSGBOX, "Tutorial - introdução:", tuts1, "Cancelar", "Próximo");
		    }
		}
		case REGISTRO_TUTORIAL_1:
		{
		    if (response)
		    {
		        TogglePlayerControllable(playerid, 1);
		    }
		    else
			{
				ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_2, DIALOG_STYLE_MSGBOX, "Tutorial - INTERPRETANDO:", tuts2, "Anterior", "Próximo");
		    }
		}
		case REGISTRO_TUTORIAL_2:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_1, DIALOG_STYLE_MSGBOX, "Tutorial - introdução:", tuts1, "Cancelar", "Próximo");
		    }
		    else
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_3, DIALOG_STYLE_MSGBOX, "Tutorial - METAGAMING:", tuts3, "Anterior", "Próximo");
		    }
		}
		case REGISTRO_TUTORIAL_3:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_2, DIALOG_STYLE_MSGBOX, "Tutorial - INTERPRETANDO:", tuts2, "Anterior", "Próximo");
		    }
		    else
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_4, DIALOG_STYLE_MSGBOX, "Tutorial - POWERGAMING:", tuts4, "Anterior", "Próximo");
		    }
		}
		case REGISTRO_TUTORIAL_4:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_3, DIALOG_STYLE_MSGBOX, "Tutorial - METAGAMING:", tuts3, "Anterior", "Próximo");
		    }
		    else
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_5, DIALOG_STYLE_MSGBOX, "Tutorial - IN-CHARACTER (IC):", tuts5, "Anterior", "Próximo");
		    }
		}
		case REGISTRO_TUTORIAL_5:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_4, DIALOG_STYLE_MSGBOX, "Tutorial - POWERGAMING:", tuts4, "Anterior", "Próximo");
		    }
		    else
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_6, DIALOG_STYLE_MSGBOX, "Tutorial - OUT-OF-CHARACTER (OOC):", tuts6, "Anterior", "Próximo");
		    }
		}
		case REGISTRO_TUTORIAL_6:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_5, DIALOG_STYLE_MSGBOX, "Tutorial - IN-CHARACTER (IC):", tuts5, "Anterior", "Próximo");
		    }
		    else
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_7, DIALOG_STYLE_MSGBOX, "Tutorial - CHAT:", tuts7, "Anterior", "Próximo");
		    }
		}
		case REGISTRO_TUTORIAL_7:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_6, DIALOG_STYLE_MSGBOX, "Tutorial - OUT-OF-CHARACTER (OOC):", tuts6, "Anterior", "Próximo");
		    }
		    else
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_8, DIALOG_STYLE_MSGBOX, "Tutorial - conclusão:", tuts8, "Anterior", "Concluir");
		    }
		}
		case REGISTRO_TUTORIAL_8:
		{
		    if (response)
		    {
		        ShowPlayerDialog(playerid, REGISTRO_TUTORIAL_7, DIALOG_STYLE_MSGBOX, "Tutorial - CHAT:", tuts7, "Anterior", "Próximo");
		    }
		    else
		    {
		        TogglePlayerControllable(playerid, 1);
		        SendClientMessage(playerid, CINZA, "DICA: Use /ajuda para ver a lista de comandos.");
		    }
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

// FUNÇÕES BÁSICAS

stock PlayerName(playerid)
{
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	return pname;
}

// FUNÇÕES CONTA

stock PlayerFile(playername[])
{
    new string[MAX_PLAYER_NAME+18];
	format(string, sizeof (string), "SARPG/Contas/%s.ini", playername);
	return string;
}
