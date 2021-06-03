//                             //
//            AIW              //
//           -----             //
//  Admin's Interiros Watcher  //
//                 By LucifeR  //
//  Lucifer@vgames.co.il       //

#pragma tabsize 0
#include <a_samp>
#include <float>

#define COLOR_LIGHTBLUE 0x33CCFFAA

public OnFilterScriptInit()
{

printf("  _                                _ ");
printf(" ( )     _   _  ____  _  ___  ____| \\_ ");
printf(" | |    | | | |/ ___|(_)/ __|/ __ | \\ \\ ");
printf(" | |    | | | | |    | | |_ / / /_/ / / ");
printf(" | |____| |_| | |___ | |  _| |___ | | \\ ");
printf(" |______\\_____/\\____||_|_|  \\____|| |\\ \\ ");
printf("     AIW: Admin's Interiros Watcher");
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256], idx;
	cmd = strtok(cmdtext, idx);

	if(strcmp(cmd, "/int", true) == 0 && IsPlayerAdmin(playerid))
    {
		new tmp[256],temp[256];
		tmp = strtok(cmdtext, idx);
		new id = strval(tmp);

        if(!strlen(tmp) || id <= 0 || id > 146) { SendClientMessage(playerid,COLOR_LIGHTBLUE,"uses: /int [1-146]"); return 1;	}

        new File:fhandle;
	    fhandle = fopen("interiors.txt",io_read);

        while(fread(fhandle,temp,sizeof(temp),false))
    	{
		    new index2 = 0;
			new temp2[256];
			temp2 = strtok(temp,index2);

			new tempid = strval(temp2);

			if(tempid == id)
			{
				new inter[256], x[256], y[256], z[256], a[256];
				inter = strtok(temp,index2);
				x = strtok(temp,index2);
				y = strtok(temp,index2);
				z = strtok(temp,index2);
				a = strtok(temp,index2);

                if(IsPlayerInAnyVehicle(playerid))
                {
					SetVehiclePos(GetPlayerVehicleID(playerid), floatstr(x), floatstr(y), floatstr(z));
			        SetVehicleZAngle(GetPlayerVehicleID(playerid), floatstr(a));
			        SetPlayerInterior(playerid, strval(inter));
			        LinkVehicleToInterior(GetPlayerVehicleID(playerid), strval(inter));
                }
                else
				{
                	SetPlayerPos(playerid, floatstr(x), floatstr(y), floatstr(z));
                	SetPlayerFacingAngle(playerid, floatstr(a));
                	SetPlayerInterior(playerid, strval(inter));
				}

 				return 1;
			}
		}
		fclose(fhandle);

		return 1;
    }

	return 0;
}

// strtok by mabako (i think :P)
strtok(const string[], &index)
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


