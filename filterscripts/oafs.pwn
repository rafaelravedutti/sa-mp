// Osorkon Administrator Filter Script by Osorkon
// Versão: 1.0

#include <a_samp>
#include <dini>

#define COLOR_YELLOW 0xFFFFB4AA

//new MAX_SERVER_SLOTS = dini_Int("OAFS_settings", "max_server_slots");

new Float:pLife[MAX_SERVER_SLOTS];
new Float:pKlevar[MAX_SERVER_SLOTS];
new pCash[MAX_SERVER_SLOTS];
new amoney;
new ahealth;
new aarmour;
new asprunk;

public OnFilterScriptInit()
{
	print("\n * * * * * * * * * * * * * * * * *");
	print(" *  Osorkon Administrator FS    *");
	print(" *  - Carregado com Sucesso!    *");
	print(" *                              *");
	print(" *  Autor: Osorkon              *");
	print(" *                              *");
	print(" *  Versão: 1.0                 *");
	print(" * * * * * * * * * * * * * * * * *\n");
	return 1;
}

public OnFilterScriptExit()
{
    print("\n * * * * * * * * * * * * * * * * *");
	print(" *  Osorkon Administrator FS    *");
	print(" *  - Descarregado com Sucesso! *");
	print(" *                              *");
	print(" *  Autor: Osorkon              *");
	print(" *                              *");
	print(" *  Versão: 1.0                 *");
	print(" * * * * * * * * * * * * * * * * *\n");
	return 1;
}

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Este servidor usa um FS de administrador. Para mais informações use /oafsinfo.");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
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
	new idx;
	new cmd[256];
	new msg[128];
	new tmp[256];
	
	cmd = strtok(cmdtext, idx);
	
	if (strcmp(cmd, "/oafs", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    
	    if (!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Use /oafs [nome].");
	        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Nomes: info e ahack.");
	        if (IsPlayerAdmin(playerid))
	        {
	            SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Configuração: settings.");
	            SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Ajuda Adm: ajuda.");
	        }
	        return 1;
	    }
	    
	    if (strcmp(tmp, "info", true) == 0)
	    {
	        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS INFO] OAFS feito po Osorkon - Versão 1.0");
	        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS INFO] Este FS possui diversos anti-hacks.");
	        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS INFO] Caso queira saber sobre os anti-hacks use /oafs [ahack].");
	    	if (IsPlayerAdmin(playerid))
	    	{
	    		SendClientMessage(playerid, COLOR_YELLOW, "[OAFS INFO] Você é um administrador. Use /oafs [settings] para configurar o anti-hack.");
			}
		}
		else if (strcmp(tmp, "ahack", true) == 0)
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS PROTEÇÃO] Este FS possui Anti-Money, Anti-Health, Anti-Armour");
            SendClientMessage(playerid, COLOR_YELLOW, "[OAFS PROTEÇÃO] Anti-Sprunk, Anti-Ping e Anti-Afk.");
		}
		else if (strcmp(tmp, "settings", true) == 0)
		{
		    tmp = strtok(cmdtext, idx);
		    if (!strlen(tmp))
		    {
		        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Use /oafs [settings] [nome].");
		        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Nomes: amoney, ahealth, aarmour, asprunk, aping e aafk.");
		        return 1;
		    }

			if (strcmp(tmp, "amoney", true) == 0)
			{
			    if (amoney == 0)
			    {
			        amoney = 1;
		    		SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Money hack ligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Money hack foi ligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
				else
				{
				    amoney = 0;
				    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Money hack desligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Money hack foi desligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
			}
			else if (strcmp(tmp, "ahealth", true) == 0)
			{
			    if (ahealth == 0)
			    {
			        ahealth = 1;
		    		SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Health hack ligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Health hack foi ligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
				else
				{
				    ahealth = 0;
				    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Health hack desligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Health hack foi desligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
			}
			else if (strcmp(tmp, "aarmour", true) == 0)
			{
			    if (aarmour == 0)
			    {
			        aarmour = 1;
		    		SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Armour hack ligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Armour hack foi ligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
				else
				{
				    aarmour = 0;
				    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Armour hack desligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Armour hack foi desligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
			}
			else if (strcmp(tmp, "asprunk", true) == 0)
			{
			    if (asprunk == 0)
			    {
			        asprunk = 1;
		    		SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Sprunk machine ligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Sprunk machine foi ligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
				else
				{
				    asprunk = 0;
				    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Anti-Sprunk machine desligado.");
		    		format(msg, 128, "[OAFS PROTEÇÃO] Anti-Sprunk hack foi desligado pelo administrador %s.", PlayerName(playerid));
		    		SendClientMessageToAll(COLOR_YELLOW, msg);
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Use /oafs [settings] [nome].");
		        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS SETTINGS] Nomes: amoney, ahealth, aarmour, asprunk, aping e aafk.");
   			}
		}
		else if (strcmp(tmp, "ajuda", true) == 0)
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] /ir, /trazer, /trazertodos, /msg, /msgtodos e /setar.");
		}
		else
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Use /oafs [nome].");
	        SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Nomes: info e ahack.");
	        if (IsPlayerAdmin(playerid))
	        {
	            SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Configuração: settings.");
	            SendClientMessage(playerid, COLOR_YELLOW, "[OAFS] Ajuda Adm: ajuda.");
	        }
		}
	    return 1;
	}
	
	if (strcmp(cmd, "/ir", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    
	    new id = strval(tmp);
		new Float:posx,
		    Float:posy,
		    Float:posz;
		    
	    if (!strlen(tmp))
	    {
			SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /ir [id].");
			return 1;
	    }
	    
	    GetPlayerPos(id, posx, posy, posz);
	    new idi = GetPlayerInterior(id);
	    new idvw = GetPlayerVirtualWorld(id);
	    
	    SetPlayerPos(playerid, posx, posy, posz);
	    SetPlayerInterior(playerid, idi);
	    SetPlayerVirtualWorld(playerid, idvw);
	    
	    format(msg, 128, "[OAFS] O administrador %s (ID: %d) foi até você.", PlayerName(playerid), playerid);
	    SendClientMessage(id, COLOR_YELLOW, msg);
	    format(msg, 128, "[OAFS] Você foi até o player %s (ID: %d).", PlayerName(id), id);
	    SendClientMessage(playerid, COLOR_YELLOW, msg);
		
	    return 1;
	}
	
	if (strcmp(cmd, "/trazer", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);

	    new id = strval(tmp);
		new Float:posx,
		    Float:posy,
		    Float:posz;

	    if (!strlen(tmp))
	    {
			SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /trazer [id].");
			return 1;
	    }

	    GetPlayerPos(playerid, posx, posy, posz);
	    new playeridi = GetPlayerInterior(playerid);
	    new playeridvw = GetPlayerVirtualWorld(playerid);

	    SetPlayerPos(id, posx, posy, posz);
	    SetPlayerInterior(id, playeridi);
	    SetPlayerVirtualWorld(id, playeridvw);

	    format(msg, 128, "[OAFS] O administrador %s (ID: %d) trouxe você até.", PlayerName(playerid), playerid);
	    SendClientMessage(id, COLOR_YELLOW, msg);
	    format(msg, 128, "[OAFS] Você trouxe o player %s (ID: %d) até você.", PlayerName(id), id);
	    SendClientMessage(playerid, COLOR_YELLOW, msg);

	    return 1;
	}
	
	if (strcmp(cmd, "/trazertodos", true) == 0)
	{
		new Float:posx,
		    Float:posy,
		    Float:posz;

	    GetPlayerPos(playerid, posx, posy, posz);
	    new playeridi = GetPlayerInterior(playerid);
	    new playeridvw = GetPlayerVirtualWorld(playerid);

		for (new i = 0; i < MAX_SERVER_SLOTS; i++)
		{
	    	SetPlayerPos(i, posx, posy, posz);
	    	SetPlayerInterior(i, playeridi);
	    	SetPlayerVirtualWorld(i, playeridvw);
		}

	    format(msg, 128, "[OAFS] O administrador %s (ID: %d) trouxe todos até ele.", PlayerName(playerid), playerid);
	    SendClientMessageToAll(COLOR_YELLOW, msg);
	    
	    return 1;
	}
	
	if (strcmp(cmd, "/msg", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		
		new id = strval(tmp);
		
		if (!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /msg [id] [msg].");
		    return 1;
		}
		
		new amsg = strrest(cmdtext, idx);
		
		if (!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /msg [id] [msg].");
		    return 1;
		}
		
		format(msg, 128, "[OAFS ADM MSG] Administrador %s (ID: %d): %s", PlayerName(playerid), playerid, amsg);
		SendClientMessage(id, COLOR_YELLOW, msg);
		format(msg, 128, "[OAFS ADM MSG] Mensagem enviada para %s (ID: %d): %s", PlayerName(id), id, amsg);
		SendClientMessage(playerid, COLOR_YELLOW, msg);
		
	    return 1;
	}
	
	if (strcmp(cmd, "/msg", true) == 0)
	{
		tmp = strtok(cmdtext, idx);

		new id = strval(tmp);

		if (!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /msg [id] [msg].");
		    return 1;
		}

		new amsg = strrest(cmdtext, idx);

		if (!strlen(amsg))
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /msg [id] [msg].");
		    return 1;
		}

		format(msg, 128, "[OAFS ADM MSG] Administrador %s (ID: %d): %s", PlayerName(playerid), playerid, amsg);
		SendClientMessage(id, COLOR_YELLOW, msg);
		format(msg, 128, "[OAFS ADM MSG] Mensagem enviada para %s (ID: %d): %s", PlayerName(id), id, amsg);
		SendClientMessage(playerid, COLOR_YELLOW, msg);

	    return 1;
	}
	
	if (strcmp(cmd, "/msgtodos", true) == 0)
	{
		new amsg = strrest(cmdtext, idx);

		if (!strlen(amsg))
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /msgtodos [msg].");
		    return 1;
		}

		format(msg, 128, "[OAFS ADM MSG-TODOS] Administrador %s (ID: %d): %s", PlayerName(playerid), playerid, amsg);
		SendClientMessageToAll(COLOR_YELLOW, msg);

	    return 1;
	}
	
	if (strcmp(cmd, "/setar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);

		if (!strlen(amsg))
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [nome].");
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Nomes: dinheiro, vida e colete.");
		    return 1;
		}

		if (strcmp(tmp, "dinheiro", true) == 0)
		{
		    tmp = strtok(cmdtext, idx);
		    new id = strval(tmp);

			if (!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [dinheiro] [id] [valor].");
			    return 1;
			}
			
			tmp = strtok(cmdtext, idx);
		    new valor = strval(tmp);

			if (!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [dinheiro] [id] [valor].");
			    return 1;
			}
			
			if (valor < 0)
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Não use valores negativos.");
			    return 1;
			}
			
			if (amoney == 1)
			{
			    SetPlayerCash(id, valor);
			}
			else
			{
				SetPlayerMoney(id, valor);
			}
			
			format(msg, 128, "[OAFS] O Administrador %s (ID: %d) setou seu dinheiro para $%d.", PlayerName(playerid), playerid, valor);
			SendClientMessage(id, COLOR_YELLOW, msg);
			format(msg, 128, "[OAFS] Você setou o dinheiro do player %s (ID: %d) para $%d.", PlayerName(id), id, valor);
			SendClientMessage(playerid, COLOR_YELLOW, msg);
		}
		else if (strcmp(tmp, "vida", true) == 0)
		{
		    tmp = strtok(cmdtext, idx);
		    new id = strval(tmp);

			if (!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [vida] [id] [valor].");
			    return 1;
			}

			tmp = strtok(cmdtext, idx);
		    new valor = strval(tmp);

			if (!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [vida] [id] [valor].");
			    return 1;
			}

			if (valor < 1.0)
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Não use valores abaixo de 1.");
			    return 1;
			}

			if (ahealth == 1)
			{
			    SetPlayerLife(id, valor);
			}
			else
			{
				SetPlayerHealth(id, valor);
			}

			format(msg, 128, "[OAFS] O Administrador %s (ID: %d) setou sua vida para %d.", PlayerName(playerid), playerid, valor);
			SendClientMessage(id, COLOR_YELLOW, msg);
			format(msg, 128, "[OAFS] Você setou a vida do player %s (ID: %d) para %d.", PlayerName(id), id, valor);
			SendClientMessage(playerid, COLOR_YELLOW, msg);
		}
		else if (strcmp(tmp, "colete", true) == 0)
		{
		    tmp = strtok(cmdtext, idx);
		    new id = strval(tmp);

			if (!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [colete] [id] [valor].");
			    return 1;
			}

			tmp = strtok(cmdtext, idx);
		    new valor = strval(tmp);

			if (!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [colete] [id] [valor].");
			    return 1;
			}

			if (valor < 1.0)
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Não use valores abaixo de 1.");
			    return 1;
			}

			if (aarmour == 1)
			{
			    SetPlayerKlevar(id, valor);
			}
			else
			{
				SetPlayerArmour(id, valor);
			}

			format(msg, 128, "[OAFS] O Administrador %s (ID: %d) setou seu colete para %d.", PlayerName(playerid), playerid, valor);
			SendClientMessage(id, COLOR_YELLOW, msg);
			format(msg, 128, "[OAFS] Você setou o colete do player %s (ID: %d) para %d.", PlayerName(id), id, valor);
			SendClientMessage(playerid, COLOR_YELLOW, msg);
		}
		else
		{
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Use /setar [nome].");
		    SendClientMessage(playerid, COLOR_YELLOW, "[OAFS AJUDA] Nomes: dinheiro, vida e colete.");
		}
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
	return 1;
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
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

stock SetPlayerCash(playerid, cash)
{
	return pCash[playerid] = cash;
}

stock GivePlayerCash(playerid, cash)
{
	return pCash[playerid] += cash;
}

stock GetPlayerCash(playerid, cash)
{
	return pCash[playerid];
}

stock ResetPlayerCash(playerid)
{
	return pCash[playerid] = 0;
}

stock SetPlayerLife(playerid, Float:life)
{
    if (life < 0.0)
	{
	    pLife[playerid] = 0.0;
	    SetPlayerHealth(playerid, 0);
	}
	else if (life > 100.0)
	{
	    pLife[playerid] = 100.0;
	    SetPlayerHealth(playerid, 100.0);
	}
	else
	{
		pLife[playerid] = life;
		SetPlayerHealth(playerid, life);
	}
}

stock SetPlayerKlevar(playerid, Float:klevar)
{
    if (klevar < 0.0)
	{
	    pKlevar[playerid] = 0.0;
	    SetPlayerArmour(playerid, 0.0);
	}
	else if (klevar >= 100.0)
	{
		pKlevar[playerid] = 100.0;
	    SetPlayerArmour(playerid, 100.0);
	}
	else
	{
		pKlevar[playerid] = klevar;
		SetPlayerArmour(playerid, klevar);
	}
}

stock PlayerName(playerid)
{
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
	return pname;
}

stock strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

stock strrest(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[128];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
