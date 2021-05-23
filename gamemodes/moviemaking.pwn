#include <a_samp>

//Cores
#define COLOR_YELLOW            		0xFFFF00AA
#define COLOR_LIGHT_YELLOW      		0xFFFFE0AA
#define COLOR_GOLD              		0xFFD700AA
#define COLOR_WHITE             		0xFFFFFFAA
#define COLOR_GRAY              		0xB5B5B5AA
#define COLOR_RED               		0xFF0000AA
#define COLOR_ORANGE            		0xFF4500AA
#define COLOR_BLUE              		0x0000FFAA
#define COLOR_ROYAL_BLUE        		0x4169E1AA
#define COLOR_SKY_BLUE          		0x87CEFAAA
#define COLOR_LIGHT_BLUE    			0xADD8E6AA
#define COLOR_PINK  					0xFFC0CBAA
#define COLOR_PURPLE        			0xA020F0AA
#define COLOR_AZURE         			0xE0EEEEAA
#define COLOR_GREEN             		0x00FF00AA
#define COLOR_LIGHT_GREEN       		0x98FB98AA

new Text:tdblack;

enum weatherInfo
{
	weatherName[64],
	weatherValue
}

new Weathers[][weatherInfo] = {
    {"Ensolarado", 1},
    {"Super-Ensolarado", 0},
	{"Chuvoso", 16},
	{"Nublado", 4},
	{"Tempestade", 8},
	{"Tempestade-Areia", 19}
};

new VehicleNames[][] = {
   	"Landstalker",
   	"Bravura",
   	"Buffalo",
   	"Linerunner",
   	"Pereniel",
   	"Sentinel",
   	"Dumper",
   	"Firetruck",
   	"Trashmaster",
   	"Stretch",
   	"Manana",
   	"Infernus",
   	"Voodoo",
   	"Pony",
   	"Mule",
   	"Cheetah",
   	"Ambulance",
   	"Leviathan",
   	"Moonbeam",
   	"Esperanto",
   	"Taxi",
   	"Washington",
   	"Bobcat",
   	"Mr Whoopee",
   	"BF Injection",
   	"Hunter",
   	"Premier",
   	"Enforcer",
   	"Securicar",
   	"Banshee",
   	"Predator",
   	"Bus",
   	"Rhino",
   	"Barracks",
   	"Hotknife",
   	"Trailer",
   	"Previon",
   	"Coach",
   	"Cabbie",
   	"Stallion",
   	"Rumpo",
   	"RC Bandit",
   	"Romero",
   	"Packer",
   	"Monster Truck",
   	"Admiral",
   	"Squalo",
   	"Seasparrow",
   	"Pizzaboy",
   	"Tram",
   	"Trailer",
   	"Turismo",
   	"Speeder",
   	"Reefer",
   	"Tropic",
   	"Flatbed",
   	"Yankee",
   	"Caddy",
   	"Solair",
   	"Berkley's RC Van",
   	"Skimmer",
   	"PCJ-600",
   	"Faggio",
   	"Freeway",
   	"RC Baron",
   	"RC Raider",
   	"Glendale",
   	"Oceanic",
   	"Sanchez",
   	"Sparrow",
   	"Patriot",
   	"Quad",
   	"Coastguard",
   	"Dinghy",
   	"Hermes",
   	"Sabre",
   	"Rustler",
   	"ZR-350",
   	"Walton",
   	"Regina",
   	"Comet",
   	"BMX",
   	"Burrito",
   	"Camper",
   	"Marquis",
   	"Baggage",
   	"Dozer",
   	"Maverick",
   	"News Chopper",
   	"Rancher",
   	"FBI Rancher",
   	"Virgo",
   	"Greenwood",
   	"Jetmax",
   	"Hotring",
   	"Sandking",
   	"Blista Compact",
   	"Police Maverick",
   	"Boxville",
   	"Benson",
   	"Mesa",
   	"RC Goblin",
   	"Hotring Racer",
   	"Hotring Racer",
   	"Bloodring Banger",
   	"Rancher",
	"Super GT",
   	"Elegant",
   	"Journey",
   	"Bike",
   	"Mountain Bike",
   	"Beagle",
   	"Cropdust",
   	"Stunt",
   	"Tanker",
   	"RoadTrain",
   	"Nebula",
   	"Majestic",
   	"Buccaneer",
   	"Shamal",
   	"Hydra",
   	"FCR-900",
   	"NRG-500",
   	"HPV1000",
   	"Cement Truck",
   	"Tow Truck",
   	"Fortune",
   	"Cadrona",
   	"FBI Truck",
   	"Willard",
   	"Forklift",
   	"Tractor",
   	"Combine",
   	"Feltzer",
   	"Remington",
   	"Slamvan",
   	"Blade",
   	"Freight",
   	"Streak",
   	"Vortex",
   	"Vincent",
   	"Bullet",
   	"Clover",
   	"Sadler",
   	"Firetruck",
   	"Hustler",
   	"Intruder",
   	"Primo",
   	"Cargobob",
   	"Tampa",
   	"Sunrise",
   	"Merit",
   	"Utility",
   	"Nevada",
   	"Yosemite",
   	"Windsor",
   	"Monster Truck",
   	"Monster Truck",
   	"Uranus",
   	"Jester",
   	"Sultan",
   	"Stratum",
   	"Elegy",
   	"Raindance",
   	"RC Tiger",
   	"Flash",
   	"Tahoma",
   	"Savanna",
   	"Bandito",
   	"Freight",
   	"Trailer",
   	"Kart",
   	"Mower",
   	"Duneride",
   	"Sweeper",
   	"Broadway",
   	"Tornado",
   	"AT-400",
   	"DFT-30",
   	"Huntley",
   	"Stafford",
   	"BF-400",
   	"Newsvan",
   	"Tug",
   	"Trailer",
   	"Emperor",
   	"Wayfarer",
   	"Euros",
   	"Hotdog",
   	"Club",
   	"Trailer",
   	"Trailer",
   	"Andromada",
   	"Dodo",
   	"RC Cam",
   	"Launch",
   	"Police Car (LSPD)",
	"Police Car (SFPD)",
   	"Police Car (LVPD)",
   	"Police Ranger",
   	"Picador",
   	"S.W.A.T. Van",
   	"Alpha",
   	"Phoenix",
   	"Glendale",
   	"Sadler",
   	"Luggage Trailer",
   	"Luggage Trailer",
   	"Stair Trailer",
   	"Boxville",
   	"Farm Plow",
   	"Utility Trailer"
};

main()
{
	print("\n----------------------------------");
	print("	  Movie Making Gamemode");
	print("----------------------------------\n");
}

// ------------ Functions by kyeman ------------ //
stock PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}
// --------------------------------------------- //

// ------------ Functions by DracoBlue ------------ //
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
// --------------------------------------------- //

stock IsNumeric(const string[])
{
	for(new n = 0; n < strlen(string); n++)
	{
		if(string[n] < '0' || string[n] > '9')
		    return false;
	}
	
	return true;
}

stock IsValidSkin(skin)
{
    if(	skin == 3 || skin == 4 || skin == 5 || skin == 6 || skin == 8 || skin == 42 || skin == 65 || skin == 74 || skin == 86 ||
		skin == 119 || skin == 149 || skin == 208 || skin == 273 || skin == 274 || skin == 289 || skin >= 300) return false;
		
    return true;
}

public OnGameModeInit()
{
	SetGameModeText("Movie Making Mode");
	ShowNameTags(0);
	
	AddPlayerClass(0, 207.3621, 1935.2102, 23.2422, 180.0, 0, 0, 0, 0, 0, 0);
	
	tdblack = TextDrawCreate(0.0, 0.0, "_");
	TextDrawUseBox(tdblack, true);
	TextDrawBoxColor(tdblack, 0x000000FF);
	TextDrawSetShadow(tdblack, 0);
	TextDrawLetterSize(tdblack, 1.000000, 100.000000);
	TextDrawTextSize(tdblack, 645.0, 480.0);
	
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, -1786.6863, 1208.5667, 32.7761);
	SetPlayerFacingAngle(playerid, 191.6203);
	SetPlayerCameraPos(playerid, -1786.5111, 1201.5464, 32.7761);
	SetPlayerCameraLookAt(playerid, -1786.6863, 1208.5667, 32.7761);
	TextDrawHideForPlayer(playerid, tdblack);
	TextDrawShowForPlayer(playerid, tdblack);
	ApplyAnimation(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 1, 1, 1, 1);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	for(new ln = 0; ln < 30; ln++)
	    SendClientMessage(playerid, COLOR_WHITE, " ");
	    
	SetPlayerColor(playerid, COLOR_GRAY);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
    PreloadAnimLib(playerid, "BOMBER");
	PreloadAnimLib(playerid, "RAPPING");
   	PreloadAnimLib(playerid, "SHOP");
  	PreloadAnimLib(playerid, "BEACH");
   	PreloadAnimLib(playerid, "SMOKING");
  	PreloadAnimLib(playerid, "FOOD");
  	PreloadAnimLib(playerid, "ON_LOOKERS");
	PreloadAnimLib(playerid, "DEALER");
	PreloadAnimLib(playerid, "CRACK");
	PreloadAnimLib(playerid, "CARRY");
	PreloadAnimLib(playerid, "COP_AMBIENT");
	PreloadAnimLib(playerid, "PARK");
	PreloadAnimLib(playerid, "INT_HOUSE");
	PreloadAnimLib(playerid, "FOOD");
	PreloadAnimLib(playerid, "PED");
	PreloadAnimLib(playerid, "SUNBATHE");
	PreloadAnimLib(playerid, "HAIRCUTS");
	PreloadAnimLib(playerid, "MISC");
	PreloadAnimLib(playerid, "GYMNASIUM");
	PreloadAnimLib(playerid, "FAT");
	PreloadAnimLib(playerid, "POOL");
	PreloadAnimLib(playerid, "MUSCULAR");
	
	SetPlayerColor(playerid, COLOR_WHITE);
	TextDrawHideForPlayer(playerid, tdblack);
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
	new cmd[128], idx = 0;
	
	cmd = strtok(cmdtext, idx);
	
	if(strcmp(cmd, "/ajuda", true) == 0)
	{
	    SendClientMessage(playerid, COLOR_WHITE, "Comandos principais:");
	    SendClientMessage(playerid, COLOR_SKY_BLUE, "/v /spawn /destruir /pintar /ir /skin");
	    return 1;
	}
	
	if(strcmp(cmd, "/admin", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
		}
		
	    SendClientMessage(playerid, COLOR_WHITE, "Comandos de administradores:");
	    SendClientMessage(playerid, COLOR_SKY_BLUE, "/tp /trazer /setarskin /clima /tempo");
	    return 1;
	}
	
    if(strcmp(cmd, "/acoesespeciais", true) == 0)
	{
	    SendClientMessage(playerid, COLOR_WHITE, "Acoes especiais:");
	    SendClientMessage(playerid, COLOR_SKY_BLUE, "/fight /parar /fumar /sentar /renderse /beber /jetpack");
	    SendClientMessage(playerid, COLOR_SKY_BLUE, "/celular /dancar");
	    return 1;
	}
	
	if(strcmp(cmd, "/fight", true) == 0)
	{
	    new style[128];
	    
	    style = strtok(cmdtext, idx);

		if(strcmp(style, "normal", true) == 0)
			SetPlayerFightingStyle(playerid, FIGHT_STYLE_NORMAL);
		else if(strcmp(style, "boxing", true) == 0)
            SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
        else if(strcmp(style, "kungfu", true) == 0 || strcmp(style, "kung-fu", true) == 0)
            SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
        else if(strcmp(style, "kneehead", true) == 0)
            SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);
        else if(strcmp(style, "grabkick", true) == 0)
            SetPlayerFightingStyle(playerid, FIGHT_STYLE_GRABKICK);
        else if(strcmp(style, "elbow", true) == 0)
            SetPlayerFightingStyle(playerid, FIGHT_STYLE_ELBOW);
		else
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Erro: estilo inválido. Uso: normal, boxing, kungfu, kneehead, grabkick, elbow");
		    return 1;
		}
		
		SendClientMessage(playerid, COLOR_WHITE, "Estilo de luta alterado.");
		return 1;
	}
	
	if(strcmp(cmd, "/parar", true) == 0)
	{
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	    return 1;
	}
	
	if(strcmp(cmd, "/fumar", true) == 0)
	{
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
	    return 1;
	}
	
	if(strcmp(cmd, "/sentar", true) == 0)
	{
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SITTING);
	    return 1;
	}
	
	if(strcmp(cmd, "/renderse", true) == 0)
	{
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
	    return 1;
	}
	
	if(strcmp(cmd, "/beber", true) == 0)
	{
	    new drink_name[128];
	    
	    drink_name = strtok(cmdtext, idx);
	    
		if(strcmp(drink_name, "beer", true) == 0)
	    	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
        if(strcmp(drink_name, "wine", true) == 0)
	    	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
        if(strcmp(drink_name, "sprunk", true) == 0)
	    	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
		else
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Erro: bebida inválida. Uso: beer, wine, sprunk");
		    return 1;
		}
		
	    return 1;
	}
	
	if(strcmp(cmd, "/jetpack", true) == 0)
	{
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
	    return 1;
	}
	
	if(strcmp(cmd, "/celular", true) == 0)
	{
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USECELLPHONE)
	    	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		else
		    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		    
		SendClientMessage(playerid, COLOR_WHITE, "Feito.");
	    return 1;
	}
	
	if(strcmp(cmd, "/dancar", true) == 0)
	{
	    new dance_style = strval(strtok(cmdtext, idx));
	    
	    if(dance_style == 1)
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
        else if(dance_style == 2)
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
        else if(dance_style == 3)
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
        else if(dance_style == 4)
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
        else
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /dancar [1-4]");
		    return 1;
		}
		
		SendClientMessage(playerid, COLOR_WHITE, "Feito.");
		return 1;
	}
	
	if(strcmp(cmd, "/v", true) == 0)
	{
	    new vname[128], vid = -1;
	    strmid(vname, cmdtext, 3, strlen(cmdtext));
	    
		if(!strlen(vname))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /v [nome/id do veiculo]");
		    return 1;
		}
		
	    if(IsNumeric(vname))
	    {
	        vid = strval(vname);
	    }
	    else
	    {
	        for(new v = 0; v < sizeof VehicleNames; v++)
	        {
	            if(strcmp(VehicleNames[v], vname, true) == 0)
	            {
	                vid = v + 400;
	                break;
	            }
	        }
	    }
	    
		if(vid == -1 || vid < 400 || vid >= 400 + sizeof VehicleNames)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Erro: veículo inválido.");
		    return 1;
		}
		
		new Float:X, Float:Y, Float:Z, Float:rot;
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerFacingAngle(playerid, rot);
		
		rot = rot + 180.0;
		if(rot >= 360.0)
		    rot = rot - 360.0;
		    
		CreateVehicle(vid, X + 1, Y + 1, Z, rot, -1, -1, -1);
		SendClientMessage(playerid, COLOR_WHITE, "Veiculo criado.");
		return 1;
	}
	
	if(strcmp(cmd, "/spawn", true) == 0)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não está em um veículo.");
		    return 1;
	    }
	    
	    SetVehicleToRespawn(GetPlayerVehicleID(playerid));
	    SendClientMessage(playerid, COLOR_WHITE, "Veiculo spawnado.");
		return 1;
	}
	
	if(strcmp(cmd, "/destruir", true) == 0)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não está em um veículo.");
		    return 1;
	    }

	    DestroyVehicle(GetPlayerVehicleID(playerid));
	    SendClientMessage(playerid, COLOR_WHITE, "Veiculo destruido.");
		return 1;
	}
	
	if(strcmp(cmd, "/pintar", true) == 0)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não está em um veículo.");
		    return 1;
	    }

	    ChangeVehicleColor(GetPlayerVehicleID(playerid), -1, -1);
	    SendClientMessage(playerid, COLOR_WHITE, "Veiculo destruido.");
		return 1;
	}
	
	if(strcmp(cmd, "/tp", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
	    }
	    
	    new tmp[128], playera, playerb;
	    
	    tmp = strtok(cmdtext, idx);
	    
	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /tp [id 1] [id 2]");
		    return 1;
	    }
	    
	    playera = strval(tmp);
	    
	    if(!IsPlayerConnected(playera))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: jogador 1 desconectado.");
		    return 1;
	    }
	    
	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /tp [id 1] [id 2]");
		    return 1;
	    }

	    playerb = strval(tmp);
	    
	    if(!IsPlayerConnected(playerb))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: jogador 2 desconectado.");
		    return 1;
	    }
	    
		new Float:BX, Float:BY, Float:BZ, BINT;
		GetPlayerPos(playerb, BX, BY, BZ);
		BINT = GetPlayerInterior(playerb);
		
		if(IsPlayerInAnyVehicle(playera))
		{
		    new vehid = GetPlayerVehicleID(playera);
		    LinkVehicleToInterior(vehid, BINT);
		    SetVehiclePos(vehid, BX, BY, BZ);
		}
		else
		{
		    SetPlayerInterior(playera, BINT);
		    SetPlayerPos(playera, BX, BY, BZ);
		}
		
		SendClientMessage(playerid, COLOR_WHITE, "Feito.");
		return 1;
	}
	
	if(strcmp(cmd, "/ir", true) == 0)
	{
	    new tmp[128], plid;

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /ir [id]");
		    return 1;
	    }

	    plid = strval(tmp);
	    
	    new Float:X, Float:Y, Float:Z, INT;
	    GetPlayerPos(plid, X, Y, Z);
	    INT = GetPlayerInterior(plid);
	    
	    SetPlayerInterior(playerid, INT);
	    SetPlayerPos(playerid, X, Y, Z);
	    
	    SendClientMessage(playerid, COLOR_WHITE, "Feito.");
	    return 1;
	}
	
	if(strcmp(cmd, "/trazer", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
	    }
	    
	    new tmp[128], plid;

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /trazer [id]");
		    return 1;
	    }

	    plid = strval(tmp);

	    new Float:X, Float:Y, Float:Z, INT;
	    GetPlayerPos(playerid, X, Y, Z);
	    INT = GetPlayerInterior(playerid);

	    SetPlayerInterior(plid, INT);
	    SetPlayerPos(plid, X, Y, Z);

	    SendClientMessage(playerid, COLOR_WHITE, "Feito.");
	    return 1;
	}
	
	if(strcmp(cmd, "/skin", true) == 0)
	{
	    new tmp[128], skin;
	    
        tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /skin [id da skin]");
		    return 1;
	    }
	    
	    skin = strval(tmp);
	    
		if(!IsValidSkin(skin))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
		}
		
		SetPlayerSkin(playerid, skin);
		SendClientMessage(playerid, COLOR_WHITE, "Skin alterada.");
		return 1;
	}
	
	if(strcmp(cmd, "/setarskin", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
	    }
	    
	    new tmp[128], plid, skin;

        tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /setarskin [id] [id da skin]");
		    return 1;
	    }
	    
	    plid = strval(tmp);
	    
	    if(!IsPlayerConnected(plid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: jogador desconectado.");
		    return 1;
	    }
	    
	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /setarskin [id] [id da skin]");
		    return 1;
	    }

	    skin = strval(tmp);

		if(!IsValidSkin(skin))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
		}

		SetPlayerSkin(plid, skin);
		SendClientMessage(playerid, COLOR_WHITE, "Skin alterada.");
		return 1;
	}
	
	if(strcmp(cmd, "/tempo", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
	    }
	    
	    new tmp[128], hour;
	    
	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /tempo [0-23]");
		    return 1;
	    }

	    hour = strval(tmp);
	    
	    if(hour < 0 || hour > 23)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /tempo [0-23]");
		    return 1;
	    }
	    
	    SetWorldTime(hour);
	    SendClientMessage(playerid, COLOR_WHITE, "Feito.");
	    return 1;
	}
	
	if(strcmp(cmd, "/clima", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: você não é administrador.");
		    return 1;
	    }

	    new tmp[128], weather = -1;

	    tmp = strtok(cmdtext, idx);

	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /clima [clima]");
		    return 1;
	    }

		if(IsNumeric(tmp))
		{
		    weather = strval(tmp);
		}
		else
		{
			for(new w = 0; w < sizeof Weathers; w++)
			{
			    if(strcmp(Weathers[w][weatherName], tmp, true) == 0)
			    {
			        weather = Weathers[w][weatherValue];
			        break;
			    }
			}
		}
		
	    if(weather == -1)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Erro: clima inválido. Uso: ensolarado, super-ensolarado, chuvoso, nublado,");
	        SendClientMessage(playerid, COLOR_GRAY, "tempestade, tempestade-areia");
		    return 1;
	    }

	    SetWeather(weather);
	    SendClientMessage(playerid, COLOR_WHITE, "Feito.");
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

