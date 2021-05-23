/*******************************************************************
 *              VoteGamemode Filterscript
 *      		Author: Rafael Ravedutti L. M.
 *******************************************************************/

#include <a_samp>

forward ChangeGamemode();
forward SetGamemode();
      
enum Gamemode_Info
{
	GMName[128],
 	GMFilename[128]
}

new Gamemodes[][Gamemode_Info] = {
	{"Las Venturas Death-Match",            	"lvdm"},
 	{"San Fierro Team Death-Match",          	"sftdm"}
};

//Add the gamemodes here

new PlayerVoted[MAX_PLAYERS] = 0;

public OnFilterScriptInit()
{
	print("VoteGamemode Filterscript loaded, gamemodes:");
	
 	for(new gm = 0; gm < sizeof Gamemodes; gm++)
  	{
   		printf("Name: %s - File: %s", Gamemodes[gm][GMName], Gamemodes[gm][GMFilename]);
  	}
  	
   	SetTimer("ChangeGamemode", 1800000, 0); // 30 minutes
}

public OnPlayerDisconnect(playerid)
{
	PlayerVoted[playerid] = 0;
}

public ChangeGamemode()
{
	SendClientMessageToAll(0x00FF00AA, "The gamemode will be changed in 20 seconds, if you still didn't voted, use /vote [gamemode] - Gamemodes:");
 	for(new gm = 0; gm < sizeof Gamemodes; gm++)
  	{
   		new string[128];
     	format(string, sizeof string, "[%d] %s", gm + 1, Gamemodes[gm][GMName]);
      	SendClientMessageToAll(0xFFFFFFAA, string);
   	}
    SetTimer("SetGamemode", 20000, false);
}

public SetGamemode()
{
	new gmid = -1;
 	new votes = 0;
  	for(new gm = 0; gm < sizeof Gamemodes; gm++)
   	{
    	new current_votes = 0;
     	for(new i = 0; i < MAX_PLAYERS; i++)
        {
        	if(IsPlayerConnected(i) && PlayerVoted[i] - 1 == gm)
            {
           		current_votes++;
             	if(current_votes > votes)
              	{
               		gmid = gm;
                 	votes = current_votes;
               	}
            }
        }
  	}
   	if(gmid == -1)
    {
    	gmid = random(sizeof Gamemodes);
    }
	new rcon_exec[128];
 	format(rcon_exec, sizeof rcon_exec, "changemode %s", Gamemodes[gmid][GMFilename]);
  	SendRconCommand(rcon_exec);
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128], idx;
 	cmd = strtok(cmdtext, idx);
  	if(strcmp(cmd, "/vote", true) == 0)
   	{
    	if(PlayerVoted[playerid] != 0)
     	{
      		SendClientMessage(playerid, 0xFF0000AA, "You already voted!");
        	return 1;
        }
        new gmid = strval(strtok(cmdtext, idx));
        if(gmid < 1 || gmid >= sizeof Gamemodes + 1)
        {
        	new errormsg[128];
            format(errormsg, sizeof errormsg, "Invalid gamemode, use /vote [1-%d]", sizeof Gamemodes);
            SendClientMessage(playerid, 0xFF0000AA, errormsg);
            return 1;
        }
        PlayerVoted[playerid] = gmid;
        new str[128];
        format(str, sizeof str, "Done [Gamemode voted: %s]", Gamemodes[gmid - 1][GMName]);
        SendClientMessage(playerid, 0x00FF00AA, str);
	}
	return 1;
}
      
strtok(const string[], &index, seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[128];
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
