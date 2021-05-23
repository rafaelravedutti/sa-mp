#include <a_samp>

new GSelect[MAX_PLAYERS] = 0, QtMortes[MAX_PLAYERS] = 0, QtMatanca[MAX_PLAYERS] = 0, GroupKill[3], GroupDead[3];

new Palavroes[][] = {
	{"Palavrao1"},
	{"Palavrao2"}
};
      
new ReacaoSaida[][] = {

"Queda de conexão",

"Vontade própria",

"Kickado/Banido"

};

forward MostrarInfo();

main()
{

	print("\n---------------------------------------");

	print("    Gamemode de Clan Fronto by Rafael    ");

	print("---------------------------------------\n");

}

public OnGameModeInit()
{
	SetGameModeText("Clan Fronto GM");

	UsePlayerPedAnims();

	AddPlayerClass(107,1794.0608,-1054.0469,23.9686,69.4018,26,10000,31,10000,32,10000);

	AddPlayerClass(106,1780.0399,-1032.5284,23.9609,107.0021,26,10000,31,10000,32,10000);

	AddPlayerClass(137,1782.7218,-1088.8809,23.9609,172.2486,26,10000,31,10000,32,10000);

	AddPlayerClass(230,1599.5081,-1056.1663,23.9140,269.6471,26,10000,31,10000,32,10000);

	AddPlayerClass(102,1598.4454,-1026.5535,23.9063,250.8470,26,10000,31,10000,32,10000);

	AddPlayerClass(104,1619.6082,-1042.2446,23.8984,263.3804,26,10000,31,10000,32,10000);

	SetTimer("MostrarInfo",90000,true);

	return 1;
}

public MostrarInfo()
{

	new string[256];

	SendClientMessageToAll(0xFF0000AA, "|===============================| PLACAR |===============================|");

	format(string,sizeof(string),"Grupo 1 - Total de mortes: %d | Total de matanças: %d",GroupDead[1],GroupKill[1]);

	SendClientMessageToAll(0xFFFFFFAA, string);

	format(string,sizeof(string),"Grupo 2 - Total de mortes: %d | Total de matanças: %d",GroupDead[2],GroupKill[2]);

	SendClientMessageToAll(0xFFFFFFAA, string);

	SendClientMessageToAll(0xFF0000AA, "|=============================================================================|");
	
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	
	    if(IsPlayerAdmin(i))
	    {
	    
	    	SendClientMessage(i, 0xFFFFFFAA, "/zerarplacar para zerar o placar...");

		}
		
	}
	
}

public OnGameModeExit()
{

	return 1;

}

public OnPlayerRequestClass(playerid, classid)
{

	SetPlayerInterior(playerid,0);

	SetPlayerPos(playerid,-2173.1484,-270.9155,35.3203);

	SetPlayerFacingAngle(playerid, 181.9282);

	SetPlayerCameraPos(playerid,-2173.0645,-274.8441,35.3203);

	SetPlayerCameraLookAt(playerid,-2173.1484,-270.9155,35.3203);

	switch(classid)

	{

	    case 0,1,2:

	    {

	        GSelect[playerid] = 1;

			GameTextForPlayer(playerid, "~g~Grupo 1",3000,4);

			SetPlayerColor(playerid,0x7FFF00AA);
			
			SetPlayerTeam(playerid,1);

	    }

	    case 3,4,5:

	    {

	        GSelect[playerid] = 2;

			GameTextForPlayer(playerid, "~r~Grupo 2",3000,4);

			SetPlayerColor(playerid,0xFF0000AA);
			
			SetPlayerTeam(playerid,2);

	    }

	}

	return 1;

}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	new string[256],Name[24];

	GameTextForPlayer(playerid, "~g~bem vindo",3000,0);

	GetPlayerName(playerid,Name,sizeof(Name));

	format(string,sizeof(string),"%s entrou no servidor.",Name);

	SendClientMessageToAll(0x20B2AAAA, string);

	SendClientMessage(playerid, 0xFFFFFFAA, "********************************************************************************************************************************");

	SendClientMessage(playerid, 0xFFFFB3FF, "Bem vindo ao Clan Fronto GM");

	SendClientMessage(playerid, 0xFFFFFFAA, "Para ver os comandos digite /ajuda");

	SendClientMessage(playerid, 0xFFFFFFAA, "Para falar privadamente com sua equipe digite \";\" antes da mensagem");

	SendClientMessage(playerid, 0xFFFFFFAA, "Não use cheats, seja honesto");

	SendClientMessage(playerid, 0xFFFFFFAA, "********************************************************************************************************************************");

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{

	new string[256],Name[24];

	GetPlayerName(playerid,Name,sizeof(Name));

	format(string,sizeof(string),"%s saiu do servidor (%s)",Name,ReacaoSaida[reason]);

	SendClientMessageToAll(0x20B2AAAA, string);

	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{

	new string[256];

	new Name[24];

	new Name2[24];

	GetPlayerName(playerid,Name,sizeof(Name));

	if(killerid == INVALID_PLAYER_ID){

	    QtMortes[playerid]++;

		GroupDead[GSelect[playerid]]++;

		SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);

	    format(string,sizeof(string),"%s morreu!",Name);

	    SendClientMessageToAll(0xFFFFFFAA, string);

	}

	else{

	    QtMortes[playerid]++;

		GroupDead[GSelect[playerid]]++;

		SendDeathMessage(killerid,playerid,reason);

		GetPlayerName(killerid,Name2,sizeof(Name2));

		format(string,sizeof(string),"%s matou %s!",Name2,Name);

		SendClientMessageToAll(0xFFFFFFAA, string);

	}

	if(GSelect[killerid] != GSelect[playerid]){

	    GroupKill[GSelect[killerid]]++;

		QtMatanca[killerid]++;

	}

	else{

	    GroupKill[GSelect[killerid]]--;

		QtMatanca[killerid]--;

		GameTextForPlayer(killerid, "~r~punido", 3000, 1);

		format(string,sizeof(string),"%s matou um membro do próprio grupo e foi PUNIDO, seu grupo perdeu 1 ponto!",Name2);

		SendClientMessageToAll(0xFFFFFFAA, string);

	}
	
    SetPlayerScore(killerid, QtMatanca[killerid]);
    
	GameTextForPlayer(playerid,"~r~morto",3000,1);
}


public OnPlayerText(playerid, text[])
{

	if(text[0] == ';'){

	    new Name[24];

	  	new str[256];

	    new achat[256];

	    GetPlayerName(playerid, Name, sizeof(Name));

	    strmid(achat,text,1,strlen(text));

	    format(str,sizeof(str),"%s: %s",Name,achat);

	    for(new i=0; i<MAX_PLAYERS; i++)
		{

	    	if(GSelect[i] == GSelect[playerid]) SendClientMessage(i, GetPlayerColor(playerid), str);

		}

		return 0;

	}
      
	new checktext[128];
 	for(new i = 0; i < strlen(text); i++)
  	{
   		checktext[i] = text[i];
   	}
    checktext[strlen(text)] = EOS;
    for(new p = 0; p < sizeof Palavroes; p++)
    {
    	new fp = strfind(checktext, Palavroes[p], true);
    	while(fp != -1)
    	{
    		for(new i = 0; i < strlen(Palavroes[p]); i++)
    		{
    			checktext[fp + i] = '*';
    		}
    		fp = strfind(checktext, Palavroes[p], true);
    	}
    }
    SendPlayerMessageToAll(playerid, checktext);
	return 0;
}


public OnPlayerCommandText(playerid, cmdtext[])
{

	if (strcmp("/ajuda", cmdtext, true) == 0)
	{

		SendClientMessage(playerid, 0xFF0000AA, "Clan Fronto GM");

		SendClientMessage(playerid, 0xFFFFB3FF, "Esse gamemode foi feito especialmente para batalhas de clans serem realizadas,");

        SendClientMessage(playerid, 0xFFFFB3FF, "digite \";\" antes da mensagem para falar privadamente com sua equipe.");

        SendClientMessage(playerid, 0xFFFFB3FF, "Para ver seu status digite /status");

        SendClientMessage(playerid, 0xFFFFB3FF, "Para se matar digite /kill");

        SendClientMessage(playerid, 0xFF0000AA, "Obrigado e Bom Jogo");

		return 1;

	}

	if (strcmp("/status", cmdtext, true) == 0)
	{

		new string[256];

		SendClientMessage(playerid, 0xFF0000AA, "*** Seu status ***");

		format(string,sizeof(string), "*** Morreu: %d vez(es) | Matou: %d jogador(es) | Equipe: %d ***",QtMortes[playerid],QtMatanca[playerid],GSelect[playerid]);

	    SendClientMessage(playerid, 0xFFFFB3FF, string);

		return 1;

	}

	if (strcmp("/kill", cmdtext, true) == 0)
	{

	    SetPlayerHealth(playerid,0);

	    return 1;

	}

	if (strcmp("/zerarplacar", cmdtext, true) == 0 && IsPlayerAdmin(playerid))
	{

	 	GroupDead[1] = 0;

		GroupKill[1] = 0;

		GroupDead[2] = 0;

		GroupKill[2] = 0;
		
		new name[24];
		
		new string[256];
		
		GetPlayerName(playerid,name,24);
		
		format(string,sizeof(string),"O administrador %s zerou o placar...",name);
		
		SendClientMessageToAll(0xFFFFFFAA, string);

	    return 1;
	}
	
	SendClientMessage(playerid, 0xFF0000AA, "Comando inexistente!");

	return 1;

}

