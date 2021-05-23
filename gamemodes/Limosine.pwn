#include <a_samp>

static const MOTORISTA_PARTICULAR = 9;
static const VEH_LIMO = 409;

new TimerReturn[MAX_PLAYERS];
new WashingLimo[MAX_PLAYERS] = 0;
new LimoWashed[MAX_VEHICLES] = 0;
new Float:WashPlaces[][4] = {
/*	  X   Y   Z  Size	  */
	{0.0,0.0,0.0,3.0}
};

forward CancelWash(playerid);
forward CanWashAgain(vehicleid);

public OnPlayerCommandText(playerid,cmdtext[])
{
	if(strcmp(cmdtext, "/lavarlimosine", true) == 0)
	{
	    if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_LIMO && LimoWashed[GetPlayerVehicleID(playerid)] == 0)
	    {
	        if(Profissao[playerid] == MOTORISTA_PARTICULAR)
	        {
				new Float:X, Float:Y, Float:Z;
	            new Float:dis = 0.0, prox_wp;
	            GetPlayerPos(playerid, X, Y, Z);
	            for(new l = 0; l < sizeof WashPlaces; l++)
	            {
					new Float:dis2;
					dis2 += floatpower(X - WashPlaces[l][0], 2), dis2 += floatpower(Y - WashPlaces[l][1], 2), dis2 += floatpower(Z - WashPlaces[l][2], 2), dis2 = floatsqroot(floatabs(dis2));
					if(dis2 < dis)
					{
				 		dis = dis2;
						prox_wp = l;
					}
				}
				SetPlayerCheckpoint(playerid, WashPlaces[prox_wp][0], WashPlaces[prox_wp][1], WashPlaces[prox_wp][2], WashPlaces[prox_wp][3]);
				WashingLimo[playerid] = 1;
				SendClientMessage(playerid, 0xFFFFFFAA, "Vá até o CheckPoint marcado em seu radar para lavar a limosine...");
				return 1;
			}
			else
			{
			    SendClientMessage(playerid, 0xAA3333AA, "Você não é Motorista Particular!");
			    return 1;
			}
	    }
	    else
		{
		    SendClientMessage(playerid, 0xAA3333AA, "Você não está em uma Limosine que precisa ser lavada!");
		    return 1;
		}
	}
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(WashingLimo[playerid] == 1)
	{
		if(newstate == PLAYER_STATE_ONFOOT)
		{
		    TimerReturn[playerid] = SetTimerEx("CancelWash", 10000, false, "d", playerid);
		    SendClientMessage(playerid, 0xFFFFFFAA, "Você tem 10 segundos para retornar à limosine ou a lavagem será cancelada!");
		}
		if(newstate == PLAYER_STATE_DRIVER && oldstate == PLAYER_STATE_ONFOOT && LimoWashed[GetPlayerVehicleID(playerid)] == 0 && GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_LIMO)
		{
		    KillTimer(TimerReturn[playerid]);
			SendClientMessage(playerid, 0xFFFFFFAA, "Você retornou para a limosine à tempo...");
		}
	}
}

public CancelWash(playerid)
{
	KillTimer(TimerReturn[playerid]);
	WashingLimo[playerid] = 0;
	SendClientMessage(playerid, 0xAA3333AA, "Lavagem cancelada, você abandonou seu veículo!");
	GameTextForPlayer(playerid, "~w~lavagem ~n~~r~cancelada", 3000, 0);
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(WashingLimo[playerid] == 1)
	{
	    DisablePlayerCheckpoint(playerid);
	    SendClientMessage(playerid, 0xFFFFFFAA, "Limosine limpa, bom trabalho...");
	    GameTextForPlayer(playerid, "~w~lavagem ~n~~g~concluida ~n~$200", 3000, 0);
	    GivePlayerMoney(playerid, 200);
	    LimoWashed[GetPlayerVehicleID(playerid)] = 1;
	    SetTimerEx("CanWashAgain", 300000, false, "d", GetPlayerVehicleID(playerid));
	}
}

public CanWashAgain(vehicleid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(Profissao[i] == MOTORISTA_PARTICULAR)
		{
		    SendClientMessage(i, 0xFFFFFFAA, "[TRABALHO] Uma limosine está pronta para ser lavada novamente...");
		}
	}
	LimoWashed[vehicleid] = 0;
}
