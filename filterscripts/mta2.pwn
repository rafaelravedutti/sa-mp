/*
MTA:R to SA:MP gamemode v0.1
Authors: [MPA]matraka_IDG and [MPA]toribio_IDG
Contact: msn_matraka@gtabrasil.net -- flavio_toribio@hotmail.com

Uses xObjects Object Streaming engine by Boylett

Recognize our work, keep the credits! 
*/

#include <a_samp>//Don't remove this or your PC will blow up!
#include <revo/objects.own>

#define using(%1):				%1_

#define PI 3.141592
#define MAX_STRING 256

#define DEFAULT_CONFIG_FILE     "config.gmf"
#define DEFAULT_STATS_FILE      "stats.gmf"
#define DEFAULT_DURATION_TIME   -1 //-1 is unlimited - if you want, you can change by the config file

#define MAX_LINES               8192 //this is the value that determines how many lines of the .map the script will read. with 4096 lines, the script can read files up to 120KB of size. if your maps are smaller, you MUST change this value for performance reasons.

//Colors
#define COLOR_RED              		0xAA3333AA

new Configured;
new DurationTime;
new MapsLoaded;
new MapName[32][MAX_STRING];
new RaceStatus;
new lines[MAX_LINES][MAX_STRING];
enum en_maps
{
	name[256],
	author[20],
	description[256],
	weather,
	time,
	hour
}

new using(map):Info[1024][en_maps];
enum en_checks
{
	Float:cX,
	Float:cY,
	Float:cZ,
	Float:cS
}

new numCheckpoints;
new Checkpoints[128][en_checks];

enum en_pickups
{
	Float:pX,
	Float:pY,
	Float:pZ,
	ptype
}
new numPickups;
new Pickups[400][en_pickups];

new numVehicles;
new UsingV[MAX_VEHICLES];
enum info_v
{
	vtype,
	Float:vX,
	Float:vY,
	Float:vZ,
	Float:vR
}

new vInfo[MAX_VEHICLES][info_v];
new numObjects;

main() print("\n--\n MTA:R to SA:MP gamemode v0.1 loaded\n--\n");

public OnGameModeInit()
{
	SetGameModeText("Projeto Ultra-Secreto");
	AddPlayerClass(265,vInfo[1][vX],vInfo[1][vY],vInfo[1][vZ],0,24,500,38,500,28,500);
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
	CreateVehicle(vInfo[playerid+1][vtype],vInfo[playerid+1][vX],vInfo[playerid+1][vY],vInfo[playerid+1][vZ],vInfo[playerid+1][vR],-1,-1,-1);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid,vInfo[playerid+1][vX],vInfo[playerid+1][vY],vInfo[playerid+1][vZ]);
	PutPlayerInVehicle(playerid,playerid+1,0);
}

public OnPlayerCommandText(playerid,cmdtext[])
{
	new cmd[256],idx;
	cmd = using(misc):strtok(cmdtext,idx);
	if(!strcmp(cmd,"/gor",true))
	{
	    SetPlayerPos(playerid,vInfo[playerid+1][vX],vInfo[playerid+1][vY],vInfo[playerid+1][vZ]);
	    return 1;
	}
	if(!strcmp(cmd,"/trocarmapa",true))
	{
		new tmp[256];
		tmp = using(misc):strtok(cmdtext,idx);
		if(!strlen(tmp)) return 0;
		strmid(tmp,cmdtext,strlen("/trocarmapa "),strlen(cmdtext));
		strcat(tmp,".map");
		if(!fexist(tmp)) {
		    new str[256]; format(str,256,"this map %s doesn`t exists",tmp);
		    SendClientMessage(playerid,COLOR_RED,str);
		    return 1;
		}
	    MapName[0] = tmp;
	    using(core):UnloadMap();
	    using(core):LoadMap(0);
	    for(new i; i<MAX_PLAYERS; i++) if(IsPlayerConnected(playerid)) SpawnPlayer(i);
		return 1;
	}
	return 0;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	printf("OnPlayerPickPickup(%d,%d)",playerid,pickupid);
	if(!IsPlayerInAnyVehicle(playerid)) return 0;
	new vid = GetPlayerVehicleID(playerid);
	if(Pickups[pickupid][ptype] == 0) AddVehicleComponent(vid,1010);
	if(Pickups[pickupid][ptype] == 1) SetVehicleHealth(vid,1000.0);
	if(Pickups[pickupid][ptype] > 399) using(core):ChangeVehicleModel(playerid,Pickups[pickupid][ptype]);
	return 1;
}

public OnPlayerDisconnect(playerid,reason) using(Object):OnPlayerDisconnect(playerid,reason);

//Core Functions

using(core):LoadScript()
{
	printf("Loading MTA:R to SA:MP core...");
	using(Object):Object();
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
			strmid(str,tstr,8,strlen(tstr));
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
	printf("");
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
	printf("Map name: %s",MapName[mapid]);
	if(!fexist(MapName[mapid]))
	{
	    printf("INTERNAL ERROR (map %s not found): MTA:R to SA:MP can't continue",MapName[mapid]);
	    GameModeExit();
	}
	new File:map_handler;
	map_handler = fopen(MapName[mapid],io_read);
	new str[MAX_STRING];
	new count;
	numCheckpoints=0;
	numPickups=0;
	new firsttime,lasttime;
	
	//Funções temporárias para salvamento do mapa convertido em um arquivo (verificamento mais rápido)
	new File:temp, tmp_str[256];
	temp = fopen("mta_races.cfg", io_append);
	//Fim funções temporárias
	
	//Let's grab the content of the file
	firsttime = GetTickCount();
	while(fread(map_handler,str))
	{
		using(misc):set(lines[count],str);
		count++;
	}
	for(new i; i<count; i++)
	{
	    new aut[20],desc[256],weat;
	    new Float:X,Float:Y,Float:Z,Float:aZ,model;
	    new Float:rx,Float:ry,Float:rz;
	    if(strfind(lines[i],"<author") != -1)
	    {
	        using(misc):sscanf(using(core):ExtractXMLParams(lines[i]),"s",aut);
	        printf("By: %s.",aut);
	        using(map):Info[mapid][author] = aut;
	        printf("Author: %s", using(map):Info[mapid][author]);
	        //temporária:
	        format(tmp_str, sizeof(tmp_str), "//Author: %s\r\n", using(map):Info[mapid][author]);
	        fwrite(temp, tmp_str);
	    }
	    if(strfind(lines[i],"<description") != -1)
	    {
	        using(misc):sscanf(using(core):ExtractXMLParams(lines[i]),"s",desc);
	        printf("Description: %s.\n",desc);
	        using(map):Info[mapid][description] = desc;
	        //temporária:
	        format(tmp_str, sizeof(tmp_str), "//Description: %s\r\n", using(map):Info[mapid][description]);
	        fwrite(temp, tmp_str);
	        
	    }
	    if(strfind(lines[i],"<weather") != -1)
	    {
	        using(misc):sscanf(using(core):ExtractXMLParams(lines[i]),"d",weat);
	        printf("Weather: %d",weat);
	        using(map):Info[mapid][weather] = weat;
	        SetWeather(weat);
	        //temporária:
	        format(tmp_str, sizeof(tmp_str), "SetWeather(%d);\r\n", using(map):Info[mapid][weather]);
	        fwrite(temp, tmp_str);
	    }
	    if(strfind(lines[i],"<time") != -1)
	    {
	        new strs[256];
	        using(misc):sscanf(using(core):ExtractXMLParams(lines[i]),"s",strs);
	        strdel(str,strfind(strs,":"),strlen(strs));
	        weat = strval(strs);
	        SetWorldTime(weat);
	        printf("Worldtime: %d",weat);
	        using(map):Info[mapid][time] = weat;
	        //temporária:
	        format(tmp_str, sizeof(tmp_str), "SetWorldTime(%d);\r\n", using(map):Info[mapid][time]);
	        fwrite(temp, tmp_str);
	    }
		if(strfind(lines[i],"<spawnpoint") != -1)
	    {
	        using(misc):sscanf(using(core):ExtractXMLParams(lines[i+1]),"fff",X,Y,Z);
	        using(misc):sscanf(using(core):ExtractXMLParams(lines[i+2]),"f",aZ);
			using(misc):sscanf(using(core):ExtractXMLParams(lines[i+3]),"d",model);
	        numVehicles++;
	        printf("AddStaticVehicle(%d,%f,%f,%f,%f,-1,-1);",model,X,Y,Z,aZ);
	        vInfo[numVehicles][vtype] = model;
	        vInfo[numVehicles][vX] = X;
	        vInfo[numVehicles][vY] = Y;
	        vInfo[numVehicles][vZ] = Z;
	        vInfo[numVehicles][vR] = aZ;
	        //temporária:
	        format(tmp_str, sizeof(tmp_str), "AddStaticVehicle(%d,%f,%f,%f,%f,-1,-1);\r\n",model,X,Y,Z,aZ);
	        fwrite(temp, tmp_str);
	    }
		if(strfind(lines[i],"<object") != -1)
		{
			using(misc):sscanf(using(core):ExtractXMLParams(lines[i+1]),"fff",X,Y,Z);
			using(misc):sscanf(using(core):ExtractXMLParams(lines[i+2]),"fff",rz,ry,rx);//MTA starts with Z rotation first
			using(misc):sscanf(using(core):ExtractXMLParams(lines[i+3]),"d",model);
			if(!IsValidModel(model)) continue;
			//For your "convenience", MTA uses radians and not degrees. So, let's convert!
			using(misc):RadianosParaGraus(rx);
			using(misc):RadianosParaGraus(ry);
			using(misc):RadianosParaGraus(rz);
			//Finally, let's create the object!
			printf("CreateObject(%d,%f,%f,%f,%f,%f,%f);",model,X,Y,Z,rx,ry,rz);
			numObjects++;
			//using(xObjects):AddObject(model,X,Y,Z,rx,ry,rz,DEFAULT_VIEWDISTANCE);
			//temporária:
	        format(tmp_str, sizeof(tmp_str), "CreateObject(%d,%f,%f,%f,%f,%f,%f);\r\n",model,X,Y,Z,rx,ry,rz);
	        CreateDynamicObject(model,X,Y,Z,rx,ry,rz);
	        fwrite(temp, tmp_str);
		}
		if(strfind(lines[i],"<checkpoint") != -1)
		{
      		using(misc):sscanf(using(core):ExtractXMLParams(lines[i+1]),"fff",Checkpoints[numCheckpoints][cX],Checkpoints[numCheckpoints][cY],Checkpoints[numCheckpoints][cZ]);
	        using(misc):sscanf(using(core):ExtractXMLParams(lines[i+2]),"f",Checkpoints[numCheckpoints][cS]);
			printf("SetPlayerRaceCheckpoint(playerid,1,%f,%f,%f,n,n,n,%f);",Checkpoints[numCheckpoints][cX],Checkpoints[numCheckpoints][cY],Checkpoints[numCheckpoints][cZ],Checkpoints[numCheckpoints][cS]);
			//CreatePickup(1222,1,Checkpoints[numCheckpoints][cX],Checkpoints[numCheckpoints][cY],Checkpoints[numCheckpoints][cZ]);
			//temporária:
	        format(tmp_str, sizeof(tmp_str), "SetPlayerRaceCheckpoint(playerid,1,%f,%f,%f,n,n,n,%f);\r\n",Checkpoints[numCheckpoints][cX],Checkpoints[numCheckpoints][cY],Checkpoints[numCheckpoints][cZ],Checkpoints[numCheckpoints][cS]);
	        fwrite(temp, tmp_str);
			numCheckpoints++;
		}
		if(strfind(lines[i],"<pickup") != -1)
		{
			new type[256],pmodel;
			using(misc):sscanf(using(core):ExtractXMLParams(lines[i+2]),"s",type);

      		using(misc):sscanf(using(core):ExtractXMLParams(lines[i+1]),"fff",Pickups[numPickups][pX],Pickups[numPickups][pY],Pickups[numPickups][pZ]);

			if(strfind(type,"nitro",true)!=-1) { Pickups[numPickups][ptype]=0; pmodel=1241; }
			else if(strfind(type,"repair",true)!=-1) { Pickups[numPickups][ptype]=1; pmodel=1240; } //esse é melhor(acho eu): 3096
			else if(strfind(type,"vehicle",true)!=-1)
			{
                using(misc):sscanf(using(core):ExtractXMLParams(lines[i+3]),"d",Pickups[numPickups][ptype]); //VehicleChange = modelid to change
				pmodel=2918;
			}
			else continue;
			CreatePickup(pmodel,14,Pickups[numPickups][pX],Pickups[numPickups][pY],Pickups[numPickups][pZ]+0.5);
			printf("CreatePickup(%d,14,%f,%f,%f);",pmodel,Pickups[numPickups][pX],Pickups[numPickups][pY],Pickups[numPickups][pZ]);
			//temporária:
	        format(tmp_str, sizeof(tmp_str), "CreatePickup(%d,14,%f,%f,%f);\r\n",pmodel,Pickups[numPickups][pX],Pickups[numPickups][pY],Pickups[numPickups][pZ]);
	        fwrite(temp, tmp_str);
			numPickups++;
		}
	}
	lasttime = GetTickCount();
	print("=== Load Stats ===");
	printf("Vehicles loaded: %d",numVehicles);
	printf("Objects loaded: %d",numObjects);
	printf("Checkpoints loaded: %d",numCheckpoints);
	printf("Pickups loaded: %d",numPickups);
	printf("Lines read: %d",count);
	printf("Load time: %d ms",lasttime-firsttime);
	printf("Almost there...");
	Configured=1;
	fclose(map_handler);
	//função temporária:
	fclose(temp);
}

using(core):UnloadMap()
{
	for(new i=1; i<=numVehicles; i++)
	{
		SetVehicleToRespawn(i);
		DestroyVehicle(i);
	}
	numVehicles=0;
	for(new i; i<numObjects; i++) DestroyDynamicObject(i);
	numObjects=0;
	for(new i; i<numPickups; i++) DestroyPickup(i);
	numPickups=0;
	numCheckpoints=0;
}

using(core):SortMap() return (MapsLoaded == 1) ? 0 : random(MapsLoaded-1);

using(core):ExtractXMLParams(string[])
{
	new tstr[MAX_STRING];
	strmid(tstr,string,strfind(string,">")+1,strfind(string,"</"));
	return tstr;
}

using(core):ChangeVehicleModel(playerid,modelid)
{
	new ov, nv, Float:X, Float:Y, Float:Z, Float:az;
	ov = GetPlayerVehicleID(playerid);
	GetVehiclePos(ov,X,Y,Z);
	GetVehicleZAngle(ov,az);
	SetVehicleToRespawn(ov);
	DestroyVehicle(ov);
	nv = CreateVehicle(modelid,X,Y,Z,az,-1,-1,-1);
	PutPlayerInVehicle(playerid,nv,0);
}

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

using(misc):RadianosParaGraus(&Float:numero)
{
	numero = numero * 180 / PI;
	if(numero == 360.0) numero = 0.0;
	return 1;
}

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

using(misc):set(dest[],source[])
{
	new count = strlen(source);
	new i=0;
	for (i=0;i<count;i++) dest[i]=source[i];
	dest[count]=0;
}

using(misc):DeleteStringText(string[],part[])
{
	new tryfind = strfind(string,part);
	while(tryfind != -1)
	{
	    strdel(string,tryfind,strlen(part));
		tryfind = strfind(string,part);
	}
	return 1;
}

using(misc):compare(string1[],string2[],bool:caseignore=true)
{
	if(!strlen(string1) || !strlen(string2)) return 0;
	return (!strcmp(string1,string2,caseignore)) ? (1) : (0);
}
static valid_objects[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, -128,
	-515899393, -134217729, -1, -1, 33554431, -1, -1, -1, -14337, -67108865,
	-33, -129, -1, -1, -1, -1, -1, -343931905, 2021654527, 1090518926,
	-1, -16455, -1, -1, -1, -1, -1, -1, -16385, -32673,
	-1, -4460561, -1, -9, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, 33554431,
	-25, -1, -1, -1, -1, -1, -1, -1073676289, -2147483648, 34079999,
	2113536, -4825600, -5, -1, -3145729, -1, -16777217, -33, -1, -1,
	-1, -1, -201326593, -1, -1, -1, -1, -1, -257, -1,
	1073741823, -133121, -1, -1, -65, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, 1073741823, -64, -1, -1, -1, -1, -1, 134217727, 0,
	-64, -1, -1, -1, -1, -1, -1, -1, -536870913, -131069,
	-1, -1, -1, -1, -1, -1, -1, -1, -16384, -1,
	-1, -1, -1, -1, -1, -1, -1, 524287, -128, -1,
	-1, -1, -1, -1, -1, -1, -1, -402653185, -8193, -1,
	-1, -1, -1, -1, -1, 245759, -256, -1, -4097, -1,
	-1, -1, -1, 1073741823, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, -32768, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -8388607, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -961,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -2096129, -1, -1048577,
	-1, -1, -1, -1, -1, -1, -897, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1921, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1040187393, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -201326593, -1, -1, -1,
	-1, -1, -1, -1, -1, 3, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, 268435455, -4194304, -1, -1, -241, -1, -1,
	-1, -1, -1, -1, 7, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, -32768,
	-1, -1, -1, -1, -671088643, -1, -1, -66060289, -13, -1793,
	-32257, -245761, -1, -1, -513, 16252911, 0, 0, 0, -131072,
	33554431, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, 8388607, 0, 0, 0, 0, 0,
	0, -256, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -268435449, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, 92274687, -65536, -2097153, -1, 595591167, 1, 0, -16777216, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, 127
};

static valid_pickups[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	-34608002, 2097147, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 67108864,
	0, 0, 0, 0, 0, 0, 0, 335544320, -2021654528, -1090518927,
	0, 70, 0, 0, 0, 0, 0, 0, 16384, 32640,
	0, 4460560
};
IsValidModel(const modelid)
{
	if(  IsBitSet(valid_objects,modelid)  ) return 1;
	if(  IsBitSet(valid_pickups,modelid)  ) return 1;
	return 0;
}
// taken from YSI
IsBitSet(array[], slot, size = sizeof (array))
{
	if (slot / cellbits >= size) return 0;
	return (((array[slot / cellbits]) & (1 << (slot % cellbits))) ? (1) : (0));
}


