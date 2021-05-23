/*
MTA:R to SA:MP gamemode v0.1
Authors: [MPA]matraka_IDG and [MPA]toribio_IDG
Contact: msn_matraka@gtabrasil.net -- flavio_toribio@hotmail.com

Uses xObjects Object Streaming engine by Boylett

Recognize our work, keep the credits! 
*/

#include <a_samp>//Don't remove this or you PC will blow up!

#define using(%1):				%1_

#define MAX_STRING 256

#define DEFAULT_CONFIG_FILE     "config.gmf"
#define DEFAULT_STATS_FILE      "stats.gmf"
#define DEFAULT_DURATION_TIME   -1 //-1 is unlimited - if you want, you can change by the config file

#define MAX_LINES               512 //this is the value that determines how many lines of the .map the script will read. with 4096 lines, the script can read files up to 120KB of size. if your maps are smaller, you MUST change this value for performance reasons.

//Colors
#define COLOR_RED              		0xAA3333AA

new Configured;
new DurationTime;
new MapsLoaded;
new MapName[32][MAX_STRING];
new lines[256][MAX_STRING];

main() print("\n--\n MTA:R to SA:MP gamemode v0.1 loaded\n--\n");

public OnGameModeInit()
{
	SetGameModeText("Blank Script");
	//Okay, let's do the most complicated part:
	using(core):LoadScript();
	return 1;
}

public OnPlayerConnect(playerid)
{
	if(!Configured)
	{
	    SendClientMessage(playerid,COLOR_RED,"SERVER: Gamemode isn't configured. Come back later.");
	    Kick(playerid);
	    return 1;
	}
	return 1;
}

//Core Functions

using(core):LoadScript()
{
	printf("Loading MTA:R to SA:MP core...");
	if(!fexist(DEFAULT_CONFIG_FILE)) {
		printf("Default config file not found, automatically created. Please edit it as the Readme describes or the gamemode won't work.");
		using(file):Create(DEFAULT_CONFIG_FILE);
		Configured=0;
		return 1;
	}
	new File:temp = fopen(DEFAULT_CONFIG_FILE,io_read);
	new tstr[MAX_STRING];
	while(fread(temp,tstr))
	{
	    new str[MAX_STRING],index;
		str = using(misc):strtok(tstr,index);
		if(using(misc):compare(str,"loadmap"))
		{
			str = using(misc):strtok(tstr,index);
			strcat(str,".map");
			if(!fexist(str))
			{
				printf("%s file doesn't exists! Please check your config file and your scriptfiles directory and try again.",str);
				continue;
			}
			MapName[MapsLoaded] = str;
			MapsLoaded++;
		}
		if(using(misc):compare(str,"duration"))
		{
		    str = using(misc):strtok(tstr,index);
			if(!strlen(str) || !strval(str))
			{
			    printf("Invalid duration time! Instead, default will be used.");
			    continue;
			}
			DurationTime = strval(str);
		}
	}
	fclose(temp);
	printf("m");
	if(!MapsLoaded)
	{
	    printf("ERROR: No maps loaded! Check your config file and try again.");
	    Configured=0;
	    return 1;
	}
	if(!DurationTime) DurationTime = DEFAULT_DURATION_TIME;
	//Let's sort a map...
    new map = using(core):SortMap();
    //Now, the worst thing... load and convert the map
    using(core):LoadMap(map);
	return 1;
}

using(core):LoadMap(mapid)
{
	printf("MAP NAME: %s",MapName[mapid]);
	if(!fexist(MapName[mapid]))
	{
	    printf("INTERNAL ERROR (map %s not found): MTA:R to SA:MP can't continue",MapName[mapid]);
	    GameModeExit();
	}
	new File:map_handler;
	map_handler = fopen(MapName[mapid],io_read);
	new str[MAX_STRING];
	new count;
	//Let's grab the content of the file
	while(fread(map_handler,str))
	{
		using(misc):set(lines[count],str);
		count++;
	}
	for(new i; i<count; i++)
	{
	    new tstr[MAX_STRING];
	    new Float:X,Float:Y,Float:Z,Float:aZ,model;
	    if(strfind(lines[i],"<spawnpoint") != -1)
	    {
	        strmid(tstr,lines[i+1],15,strlen(lines[i+1])-11);
	        using(misc):sscanf(tstr,"fff",X,Y,Z);
	        strmid(tstr,lines[i+2],15,strlen(lines[i+2])-11);
	        using(misc):sscanf(tstr,"f",aZ);
	        strmid(tstr,lines[i+3],14,strlen(lines[i+3])-10);
	        using(misc):sscanf(tstr,"d",model);
	        printf("DEBUG: AddStaticVehicle(%d,%f,%f,%f,%f,-1,-1);",model,X,Y,Z,aZ);
	    }
	}
	fclose(map_handler);
}

using(core):SortMap() return (MapsLoaded == 1) ? 0 : random(MapsLoaded-1);

//File functions

using(file):Create(fn[])
{
	new File:ft;
	if(fexist(fn)) return false;
	ft=fopen(fn,io_write);
	fclose(ft);
	return true;
}

//Misc functions

using(misc):strtok(const string[], &index, seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[MAX_STRING];
	while ((index < length) && (string[index] != seperator) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	if ((index < length) && (string[index] == seperator)) index++;
	return result;
}

//Thanks to Y_Less for this function:
using(misc):sscanf(string[], format[], {Float,_}:...)
{
	new
		formatPos = 0,
		stringPos = 0,
		paramPos = 2,
		paramCount = numargs();
	while (paramPos < paramCount && string[stringPos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
					neg = 1,
					num = 0,
					ch = string[stringPos];
				if (ch == '-')
				{
					neg = -1;
					ch = string[++stringPos];
				}
				do
				{
					stringPos++;
					if (ch >= '0' && ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return 1;
					}
				}
				while ((ch = string[stringPos]) && ch != ' ');
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
					ch,
					num = 0;
				while ((ch = string[stringPos++]))
				{
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						case ' ':
						{
							break;
						}
						default:
						{
							return 1;
						}
					}
				}
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, string[stringPos++]);
			}
			case 'f':
			{
				new tmp[25];
				strmid(tmp, string, stringPos, stringPos+sizeof(tmp)-2);
				setarg(paramPos, 0, _:floatstr(tmp));
			}
			case 's', 'z':
			{
				new
					i = 0,
					ch;
				if (format[formatPos])
				{
					while ((ch = string[stringPos++]) && ch != ' ')
					{
						setarg(paramPos, i++, ch);
					}
					if (!i) return 1;
				}
				else
				{
					while ((ch = string[stringPos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringPos--;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (string[stringPos] && string[stringPos] != ' ')
		{
			stringPos++;
		}
		while (string[stringPos] == ' ')
		{
			stringPos++;
		}
		paramPos++;
	}
	while (format[formatPos] == 'z') formatPos++;
	return format[formatPos];
}

using(misc):set(dest[],source[]) {
  new count = strlen(source);
  new i=0;
  for (i=0;i<count;i++) {
	dest[i]=source[i];
  }
  dest[count]=0;
}

using(misc):compare(string1[],string2[],bool:caseignore=true)
{
	if(!strlen(string1) || !strlen(string2)) return 0;
	return (!strcmp(string1,string2,caseignore)) ? (1) : (0);
}
