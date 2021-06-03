/*****************************************************************************************************

								Virtual Life RPG Revolution
					
		   	      			Copyright (C) 2009 Virtual Life Team
		   	      		
		   	      		        		Integrantes:
		   	      		        	
								Jairo Marques aka Texugo
								Rafael Ravedutti aka FuriousMan
		   	      
									HAVE FUN! ;)

*****************************************************************************************************/

#include <a_samp>

#define SERVER_DIRECTORY        		"Virtual Life RPG Revolution/"

#define COLOR_ADMIN                     COLOR_ROYAL_BLUE

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

#define COLOR_DESEMPREGADO      		0x696969AA
#define COLOR_TAXISTA           		0xFFFFE0AA
#define COLOR_FRENTISTA         		0xE0EEEEAA
#define COLOR_BARMAN            		0xF0E68CAA
#define COLOR_PARAMEDICO        		0xFFC0CBAA
#define COLOR_POLICIAL_MILITAR  		0xADD8E6AA
#define COLOR_POLICIAL_SWAT     		0x87CEFAAA
#define COLOR_DELEGADO          		0x4169E1AA
#define COLOR_TRAFICANTE        		0xCD6600AA
#define COLOR_PIZZABOY          		0xF5DEB3AA
#define COLOR_TRANSPORTES_PUBLICOS      0x9AC0CDAA
#define COLOR_CORRETOR_IMOVEIS          0xC0FF3EAA
#define COLOR_VENDEDOR_VEICULOS         0xE6E6FAAA
#define COLOR_MECANICO                  0xCAE1FFAA
#define COLOR_ADVOGADO                  0x9ACD32AA
#define COLOR_JUIZ             			0x7FFF00AA

#define DESEMPREGADO            		0
#define TAXISTA                 		1
#define FRENTISTA               		2
#define BARMAN                  		3
#define PARAMEDICO              		4
#define POLICIAL_MILITAR       			5
#define POLICIAL_SWAT          			6
#define DELEGADO               			7
#define TRAFICANTE             			8
#define PIZZABOY               			9
#define TRANSPORTES_PUBLICOS   			10
#define CORRETOR_IMOVEIS        		11
#define VENDEDOR_VEICULOS       		12
#define MECANICO                		13
#define ADVOGADO                        14
#define JUIZ                            15

#define AREA_NULL                       0
#define AREA_POSTO              		1
#define AREA_BANCO              		2
#define AREA_HOSPITAL           		3
#define AREA_OFICINA            		4
#define AREA_BAR                		5
#define AREA_TAXI               		6
#define AREA_DELEGACIA          		7
#define AREA_CONCESSIONARIA     		8
#define AREA_IMOBILIARIA        		9
#define AREA_TRANSPORTE_PUBLICO         10
#define AREA_TRIBUNAL                   11

#define COMMANDS_PER_LIST               8

#define INT_UTILIDADES                  0
#define INT_AUTO_ESCOLA                 1

#define DIALOG_REGISTER_LOGIN           1
																
#define MAX_SLOTS               		50

new Login[MAX_SLOTS] = 0;

enum itemInfo
{
	itemName[64],
	itemValue
}

new Itens[][itemInfo] = {
	{"Celular",				400},
	{"Visao-Noturna",    	300},
	{"Galao",               200},
	{"Mochila",             300}
};

enum explosiveInfo
{
	expName[64],
	expValue,
	expLimit
}

new Explosives[][explosiveInfo] = {
    {"Bomba-Remota",    			1000,   	1},
	{"Bomba c/ sensor aprox.",     	1500,   	1},
	{"Flash",           			200,    	3},
	{"Bomba de gas",                200,        3},
	{"Rojao",           			200,    	2}
};
	
enum weaponInfo
{
	wName[64],
	wObjectId,
	wSlot
}

new Weapons[][weaponInfo] = {
	{"Mão livre",							0,				0},
	{"Soco Inglês",							331,			0},
	{"Taco de Golfe",						333,			1},
	{"Cacetete",							334,			1},
	{"Faca",								335,			1},
	{"Taco de Baseball",					336,			1},
	{"Shovel",								337,			1},
	{"Taco de Sinuca",						338,			1},
	{"Katana",								339,			1},
	{"Motosserra",							341,			1},
	{"Vibrador roxo de duas pontas",		321,			10},
	{"Vibrador branco grande",				322,			10},
	{"Vibrador branco médio",				323,			10},
	{"Vibrador prata pequeno",				324,			10},
	{"Flores",								325,			10},
	{"Bengala",								326,			10},
	{"Granada",								342,			8},
	{"Bomba de gás",						343,			8},
	{"Molotov",								344,			8},
	{"Lança Foguetes",						0,				8},
	{"Lança-Foguetes Tele-guiado",			0,				-1},
	{"Hydra Rocket",						0,				-1},
	{"Pistola",								346,			2},
	{"Silenced Pistol",						347,			2},
	{"Desert Eagle",						348,			2},
	{"Escopeta Calibre 12",					349,			3},
	{"Escopeta de Cano Serrado",			350,			3},
	{"Escopeta de Combate",					351,			3},
	{"Micro Uzi",							352,			4},
	{"MP5",									353,			4},
	{"AK47",								355,			5},
	{"M4",									356,			5},
	{"Tec9",								372,			4},
	{"Country Rifle",						357,			6},
	{"Sniper Rifle",                        358,			6},
	{"Bazuca",                     			359,			7},
	{"Canhao",        						360,			7},
	{"Lança Chamas",                        361,			7},
	{"Minigun",                             362,			7},
	{"Sachtel Charges",                     363,			8},
	{"Detonador",                           0,				12},
	{"Spray",                               365,			9},
	{"Extintor de incendio",                366,			9},
	{"Camera",                              367,			9},
	{"Nightvision",                         0,				11},
	{"Heatvision",                          0,				11},
	{"Paraquedas",                          371,			11}
};

new BackpackObject[MAX_SLOTS];
new HandgunObject[MAX_SLOTS];

enum areaInfo
{
	areaName[64],
	areaID,
	Float:areaRadi,
	Float:areaX,
	Float:areaY,
	Float:areaZ
}

new Areas[][areaInfo] = {
	{"Hospital", 			AREA_HOSPITAL, 		10.0, 		-2651.7488,		635.2786,		14.4531},
	{"Oficina", 			AREA_OFICINA, 		10.0,		-2026.2539,		157.2085,		29.0391},
	{"Posto",               AREA_POSTO,         10.0,		-1677.4940,		416.7223,		7.1797},
	{"Banco", 				AREA_BANCO, 		2.5,		-1973.9275,		116.7825,		27.6875}
};

new PlayerArea[MAX_SLOTS] = 0;

new Experiences[][] = {
	"Geral",
	"Direcao Terrestre",
	"Direcao Nautica",
	"Direcao Aerea",
	"Vendas",
	"Direito",
	"Policial",
	"Salvamento"
};

enum jobInfo
{
	jobName[64],
	jobPayday,
	jobColor,
	jobSkin,
	jobExp[sizeof Experiences]
}

new Jobs[][jobInfo] = {
	{"Desempregado",			0,			COLOR_DESEMPREGADO,				0},
	{"Taxista",         		500,    	COLOR_TAXISTA,          		272},
	{"Frentista",       		400,    	COLOR_FRENTISTA,        		50},
	{"Barman",          		500,    	COLOR_BARMAN,           		171},
	{"Paramedico",      		700,    	COLOR_PARAMEDICO,       		274},
	{"Policial Militar",    	600,    	COLOR_POLICIAL_MILITAR, 		280},
	{"Policial SWAT",       	1500,   	COLOR_POLICIAL_SWAT,    		285},
	{"Delegado",            	3000,   	COLOR_DELEGADO,         		126},
	{"Traficante",          	1000,   	COLOR_TRAFICANTE,       		28},
	{"Pizzaboy",            	600,    	COLOR_PIZZABOY,         		155},
	{"Transportador Publico",   400,    	COLOR_TRANSPORTES_PUBLICOS, 	46},
	{"Corretor de imoveis",     200,    	COLOR_CORRETOR_IMOVEIS,     	59},
	{"Vendedor de veiculos",    200,    	COLOR_VENDEDOR_VEICULOS,    	240},
	{"Mecanico",                600,    	COLOR_MECANICO,             	50},
	{"Advogado",                1000,       COLOR_ADVOGADO,                 147},
	{"Juiz",                    4000,   	COLOR_JUIZ,                 	187}
};
	
new JobsExp[sizeof Jobs][sizeof Experiences] = {
    {0,		0,		0,		0,		0,		0,		0,		0},
	{0,		10,		0,		0,		0,		0,		0,		0},
	{0,		0,		0,		0,		0,		0,		0,		0},
	{0,		0,		0,		0,		50,		0,		0,		0},
	{10,	10,		0,		0,		70,		0,		0,		10},
	{10,	10,		0,		0,		0,		0,		10,		0},
	{20,	10,		0,		10,		0,		0,		30,		0},
	{40,	10,		0,		0,		0,		0,		50,		0},
	{15,	0,		0,		0,		100,	0,		0,		0},
	{0,		10,		0,		0,		0,		0,		0,		0},
	{0,		10,		0,		0,		0,		0,		0,		0},
	{20,	0,		0,		0,		200,	0,		0,		0},
	{20,	0,		0,		0,		200,	0,		0,		0},
	{10,	0,		0,		0,		0,		0,		0,		0},
	{15,	0,		0,		0,		0,		0,		0,		0},
	{40,	0,		0,		0,		0,		10,		0,		0}
};

enum jCmdInfo
{
	jCmd[128],
	jDescription[128],
	jJob
}

new JobCommands[][jCmdInfo] =
{
	{"/comando",    "utilizacao do comando",    DESEMPREGADO}
};

enum companyInfo
{
	cName[64],
	cValue,
	cProf,
	Float:cX,
	Float:cY,
	Float:cZ,
	bool:cPublic
}

new Companies[][companyInfo] = {
	{"None",                            0,              DESEMPREGADO,           0.0, 	0.0,	0.0,	true},
	{"Life's Petrol Station", 			120000,			FRENTISTA,				0.0, 	0.0,	0.0,	false},
	{"Life's Taxi & Cia",          		80000,			TAXISTA,				0.0, 	0.0,	0.0,	false},
	{"Life's Drink & Drop",        		60000,			BARMAN,					0.0, 	0.0,	0.0,	false},
	{"Life's Hospital",            		0,				PARAMEDICO,         	0.0, 	0.0,	0.0,	true},
	{"Life's Police Department",      	0,				POLICIAL_MILITAR,   	0.0, 	0.0,	0.0,	true},
	{"Life's Workshop",    				75000,			MECANICO,               0.0, 	0.0,	0.0,	false},
	{"Life's Autos",               	   	150000,         VENDEDOR_VEICULOS,      0.0, 	0.0,	0.0,	false},
	{"Life's Immobile",                	130000,         CORRETOR_IMOVEIS,       0.0, 	0.0,	0.0,	false},
	{"Life's Public Transport & Cia",  	0,              TRANSPORTES_PUBLICOS,   0.0, 	0.0,	0.0,	true},
	{"Life's Crack Place",             	150000,         TRAFICANTE,             0.0, 	0.0,	0.0,	false},
	{"Life & Associate Attorneys",   	140000,         ADVOGADO,               0.0, 	0.0,	0.0,	false},
	{"Life's Tribunal",                	0,              JUIZ,                   0.0, 	0.0,	0.0,	true}
};

new Company[MAX_SLOTS] = 0;

enum intInfo
{
	intName[64],
	intPickupID,
	Float:intX,
	Float:intY,
	Float:intZ,
	intInt
}

new Ints[][intInfo] = {
    {"Loja de itens pessoais",   	1314,       -31.0222,       -89.7937,       1003.5469,      18},
	{"Auto-Escola",					1318,		-2027.9200,		-105.1830,		1035.1719,		3}
};
		    
enum enterInfo
{
	intID,
	Float:enterX,
	Float:enterY,
	Float:enterZ,
	enterInt
}

new Enters[][enterInfo] = {
	{0,		-2026.9200,		-99.9395,		35.1641,		INT_AUTO_ESCOLA}
};

new PlayerEnter[MAX_SLOTS] = 0;
new PlayerDoor[MAX_SLOTS] = 0;

enum vehicleParams
{
	vModel,
	Float:vX,
	Float:vY,
	Float:vZ,
	Float:vA,
	vColor1,
	vColor2,
	vRespawn
}

new Vehicles[][vehicleParams] = {
	{411, -2029.8517, 158.1746, 28.8359, 183.1047, -1, -1, -1},
	{560, -2023.7562, 158.6367, 28.5634, 183.1047, -1, -1, -1}
};

new Text:tdVLREV;

new VoteKickTimer;
new VoteKickPlayer = -1;
new Votes = 0;
new Voted[MAX_SLOTS] = 0;
new PlayerCount = 0;
new Menu:Bank[2];
new BankOpc[MAX_SLOTS] = 0;
new Weapon[MAX_SLOTS] = 0;

//Functions
forward Time();
forward CheckArea();
forward VoteKick();
//Callbacks
forward OnPlayerChangeWeapon(playerid, oldweapon, newweapon);
forward OnVehicleRemovePaintjob(vehicleid);
forward OnVehicleTuned(vehicleid, componentid, slot);

public OnVehicleRemovePaintjob(vehicleid)
{
	printf("OnVehicleRemovePaintjob(%d)", vehicleid);
}

public OnVehicleTuned(vehicleid, componentid, slot)
{
    printf("OnVehicleTuned(%d, %d, %d)", vehicleid, componentid, slot);
}

main()
{
	print("\n----------------------------------------------------------------");
	print("------------------ Virtual Life RPG Revolution -----------------");
	print("----------------------------------------------------------------\n");
}

stock operator%(Float:oper1, Float:oper2)
{
	return floatround(oper1, floatround_floor) % floatround(oper2, floatround_floor);
}

stock operator%(oper1, Float:oper2)
{
	return oper1 % floatround(oper2, floatround_floor);
}

stock operator%(Float:oper1, oper2)
{
	return floatround(oper1, floatround_floor) % oper2;
}

stock SetValue(filename[], key[], value[])
{
	if(!fexist(filename))
	{
	    new File:fp = fopen(filename, io_write);
	    fclose(fp);
	}
	new buf[128];
	format(buf, sizeof buf, "%s.buf", filename);
	new File:fpr = fopen(filename, io_read);
	fremove(buf);
	new File:fpw = fopen(buf, io_write);
	new read[128], bool:wrote = false;
	while(fread(fpr, read, sizeof read))
	{
	    new fkey[128], index = 0;
	    fkey = strtok(read, index);
		if(strcmp(key, fkey, true) == 0)
		{
		    if(!wrote)
		    {
		    	new wtext[128];
		    	format(wtext, sizeof wtext, "%s %s\r\n", key, value);
		    	fwrite(fpw, wtext);
			}
			wrote = true;
		}
		else
		{
		    fwrite(fpw, read);
		}
	}
	if(!wrote)
	{
	    new wtext[128];
    	format(wtext, sizeof wtext, "%s %s\r\n", key, value);
    	fwrite(fpw, wtext);
	}
	fclose(fpr);
	fclose(fpw);
	if(fcopytextfile(buf, filename)) return fremove(buf);
	return false;
}

stock GetValue(filename[], key[])
{
	new ret[128];
	ret[0] = 0;
    if(!fexist(filename))
	{
	    return ret;
	}
	new File:fp = fopen(filename, io_read), read[128];
	while(fread(fp, read, sizeof read))
	{
		new fkey[128], index = 0;
		fkey = strtok(read, index);
		if(strcmp(key, fkey, true) == 0)
		{
			fclose(fp);
			while(read[index] == ' ') index++;
			strmid(ret, read, index, strlen(read));
			StripNewLine(ret);
			return ret;
		}
	}
	fclose(fp);
	return ret;
}

stock UnsetValue(filename[], key[])
{
    if(!fexist(filename))
	{
	    new File:fp = fopen(filename, io_write);
	    fclose(fp);
	}
	new buf[128];
	format(buf, sizeof buf, "%s.buf", filename);
	new File:fpr = fopen(filename, io_read);
	fremove(buf);
	new File:fpw = fopen(buf, io_write);
	new read[128]
	while(fread(fpr, read, sizeof read))
	{
	    new fkey[128], index = 0;
	    fkey = strtok(read, index);
		if(strcmp(key, fkey, true) != 0)
		{
		    fwrite(fpw, read);
		}
	}
	fclose(fpr);
	fclose(fpw);
	if(fcopytextfile(buf, filename)) return fremove(buf);
	return false;
}

stock SetIntValue(filename[], key[], value)
{
	new value_str[128];
	valstr(value_str, value);
	return SetValue(filename, key, value_str);
}

stock GetIntValue(filename[], key[])
{
	return strval(GetValue(filename, key));
}

stock SetFloatValue(filename[], key[], Float:value)
{
	new value_str;
	format(value_str, sizeof value_str, "%f", value);
	SetValue(filename, key, value);
}

stock Float:GetFloatValue(filename[], key[], Float:value)
{
	return floatstr(GetValue(filename, key));
}

stock SetArrayValue(filename[], key[], element, value[])
{
	new key_element[128];
	format(key_element, sizeof key_element, "%s[%d]", key, element);
	return SetValue(filename, key_element, value);
}

stock GetArrayValue(filename[], key[], element)
{
    new key_element[128];
	format(key_element, sizeof key_element, "%s[%d]", key, element);
	return GetValue(filename, key_element);
}

stock SetArrayIntValue(filename[], key[], element, value)
{
	new key_element[128];
	format(key_element, sizeof key_element, "%s[%d]", key, element);
	return SetIntValue(filename, key_element, value);
}

stock GetArrayIntValue(filename[], key[], element)
{
	new key_element[128];
	format(key_element, sizeof key_element, "%s[%d]", key, element);
	return GetIntValue(filename, key_element);
}

stock SetArrayFloatValue(filename[], key[], element, Float:value)
{
	new key_element[128];
	format(key_element, sizeof key_element, "%s[%d]", key, element);
	return SetFloatValue(filename, key_element, value);
}

stock Float:GetArrayFloatValue(filename[], key[], element)
{
	new key_element[128];
	format(key_element, sizeof key_element, "%s[%d]", key, element);
	return GetFloatValue(filename, key_element);
}

// ------------ Functions by DracoBlue ------------ //
stock StripNewLine(string[])
{
	new len = strlen(string);
	if (string[0]==0) return ;
	if ((string[len - 1] == '\n') || (string[len - 1] == '\r')) {
		string[len - 1] = 0;
		if (string[0]==0) return ;
		if ((string[len - 2] == '\n') || (string[len - 2] == '\r')) string[len - 2] = 0;
	}
}

stock fcopytextfile(oldname[],newname[]) {
	new File:ohnd,File:nhnd;
	if (!fexist(oldname)) return false;
	ohnd=fopen(oldname,io_read);
	nhnd=fopen(newname,io_write);
	new tmpres[128];
	while (fread(ohnd,tmpres)) {
		StripNewLine(tmpres);
		format(tmpres,sizeof(tmpres),"%s\r\n",tmpres);
		fwrite(nhnd,tmpres);
	}
	fclose(ohnd);
	fclose(nhnd);
	return true;
}

stock strtok(const string[], &index, seperator=' ')
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

// ------------ Functions by kyeman ------------ //
stock PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}
// --------------------------------------------- //

// ------------ Functions by Y_Less ------------ //
stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}
stock GetXYInBackOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    a = (a + 180) % 360;
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}
stock GetXYInRightOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    a = (a + 270) % 360;
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}
stock GetXYInLeftOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    if (GetPlayerVehicleID(playerid))
	{
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }
    a = (a + 90) % 360;
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}
// ---------------------------------------------- //

stock IsNotSpecialString(const string[])
{
	for(new i = 0; i < strlen(string); i++)
	{
		if((string[i] < 'a' || string[i] > 'z') && (string[i] < 'A' || string[i] > 'Z') && (string[i] < '0' || string[i] > '9') && string[i] != '_' && string[i] != ' ') return false;
	}
	return true;
}

stock Float:GetDistance(Float:X1, Float:Y1, Float:Z1, Float:X2, Float:Y2, Float:Z2)
{
	return floatsqroot(floatpower(X1 - X2, 2) + floatpower(Y1 - Y2, 2) + floatpower(Z1 - Z2, 2));
}

stock GetPlayerInt(playerid)
{
	if(PlayerEnter[playerid] == -1) return -1;
	return Enters[PlayerEnter[playerid]][intID];
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	return name;
}

stock GetPlayerFilePath(playerid)
{
	new path[128], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof name);
	format(path, sizeof path, #SERVER_DIRECTORY "Players/%s.ini", name);
	return path;
}

stock GivePlayerMoneyEx(playerid, amount)
{
	return SetIntValue(GetPlayerFilePath(playerid), "Money", GetIntValue(GetPlayerFilePath(playerid), "Money") + amount);
}

stock ResetPlayerMoneyEx(playerid)
{
	return SetIntValue(GetPlayerFilePath(playerid), "Money", 0);
}

stock GetPlayerMoneyEx(playerid)
{
	return GetIntValue(GetPlayerFilePath(playerid), "Money");
}

stock AddExperience(playerid, experience[], amount = 1)
{
	new key[128];
	format(key, sizeof key, "Exp%s", experience);
	SetIntValue(GetPlayerFilePath(playerid), key, GetIntValue(GetPlayerFilePath(playerid), key) + amount);
}

stock GetExperience(playerid, experience[])
{
    new key[128];
	format(key, sizeof key, "Exp%s", experience);
	return GetIntValue(GetPlayerFilePath(playerid), key);
}

stock GetJobExperience(jobid, experience[])
{
	for(new exp = 0; exp < sizeof Experiences; exp++)
	{
	    if(strcmp(Experiences[exp], experience, true) == 0)
	    {
	        return Jobs[jobid][jobExp][exp];
	    }
	}
	return 0;
}

public OnGameModeInit()
{
	SetGameModeText("Virtual Life RPG Revolution");
	SendRconCommand("hostname Virtual Life RPG Revolution Server");
	SendRconCommand("mapname Los Santos");

	DisableInteriorEnterExits();

    //----------------------------------------------CLASSES----------------------------------------------

	AddPlayerClass(115, -1962.6481, 137.4517, 27.6940, 92.2372, 0, 0, 0, 0, 0, 0);
	
	//----------------------------------------------VEÍCULOS----------------------------------------------

	for(new veh = 0; veh < sizeof Vehicles; veh++)
	{
	    AddStaticVehicleEx(Vehicles[veh][vModel], Vehicles[veh][vX], Vehicles[veh][vY], Vehicles[veh][vZ], Vehicles[veh][vA], Vehicles[veh][vColor1], Vehicles[veh][vColor2], Vehicles[veh][vRespawn]);
	}
    
    //----------------------------------------------ENTRADAS----------------------------------------------

	for(new i = 0; i < sizeof Ints; i++)
	{
	    AddStaticPickup(Ints[i][intPickupID], 1, Ints[i][intX], Ints[i][intY], Ints[i][intZ]);
	}
	
	for(new e = 0; e < sizeof Enters; e++)
	{
	    AddStaticPickup(Ints[Enters[e][intID]][intPickupID], 1, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ]);
	}
	
	//----------------------------------------------MENUS----------------------------------------------
	
	Bank[0] = CreateMenu("Opcoes", 2, 2, 150, 100, 20);
	if(IsValidMenu(Bank[0]))
	{
	    AddMenuItem(Bank[0], 0, "Sacar");
	    AddMenuItem(Bank[0], 0, "Depositar");
	    AddMenuItem(Bank[0], 0, "Ver informacoes");
	}
	
	Bank[1] = CreateMenu("Quantidade", 2, 2, 150, 100, 20);
	if(IsValidMenu(Bank[1]))
	{
	    SetMenuColumnHeader(Bank[1], 0, "Saldo:");
	    AddMenuItem(Bank[1], 0, "$1,00");
	    AddMenuItem(Bank[1], 0, "$5,00");
	    AddMenuItem(Bank[1], 0, "$10,00");
	    AddMenuItem(Bank[1], 0, "$50,00");
	    AddMenuItem(Bank[1], 0, "$100,00");
	    AddMenuItem(Bank[1], 0, "$500,00");
	    AddMenuItem(Bank[1], 0, "$1000,00");
	    AddMenuItem(Bank[1], 0, "$5000,00");
	    AddMenuItem(Bank[1], 0, "$10000,00");
	    AddMenuItem(Bank[1], 0, "$50000,00");
	    AddMenuItem(Bank[1], 0, "$100000,00");
	}
	
	//----------------------------------------------TEXTDRAWS----------------------------------------------
	
	tdVLREV = TextDrawCreate(10.0, 430.5, "~b~Virtual ~r~L~w~i~r~f~w~e ~y~R~b~P~g~G ~y~Revolution");
    TextDrawFont(tdVLREV, 0);
    TextDrawLetterSize(tdVLREV, 0.600000, 1.299999);
    TextDrawColor(tdVLREV, COLOR_WHITE);
    TextDrawBackgroundColor(tdVLREV, 126);
    
    //----------------------------------------------TIMERS----------------------------------------------
    
    SetTimer("Time", 1000, true);
	SetTimer("CheckArea", 1000, true);
	
	return 1;
}

public OnGameModeExit()
{
    TextDrawDestroy(tdVLREV);
	DestroyMenu(Bank[0]);
	DestroyMenu(Bank[1]);
}

stock ShowLoginDialog(playerid)
{
	if(fexist(GetPlayerFilePath(playerid)))
	{
	    ShowPlayerDialog(playerid, DIALOG_REGISTER_LOGIN, DIALOG_STYLE_INPUT, "Virtual Life RPG Revolution", "Bem-vindo, entre com a sua senha para continuar:", "Autenticar", "Cancelar");
	}
	else
	{
	    ShowPlayerDialog(playerid, DIALOG_REGISTER_LOGIN, DIALOG_STYLE_INPUT, "Virtual Life RPG Revolution", "Bem-vindo, registre uma senha para continuar:", "Registrar", "Cancelar");
	}
}

public OnPlayerConnect(playerid)
{
	SetPlayerColor(playerid, Jobs[GetIntValue(GetPlayerFilePath(playerid), "Job")][jobColor]);
	Login[playerid] = 0;
	Company[playerid] = 0;
	BankOpc[playerid] = 0;
	PlayerEnter[playerid] = -1;
	PlayerDoor[playerid] = -1;
	PlayerArea[playerid] = AREA_NULL;
    CheckBan(playerid);
	SendClientMessage(playerid, COLOR_WHITE, "----- [ Virtual Life RPG Revolution ] -----");
	SendClientMessage(playerid, COLOR_SKY_BLUE, "Seja bem-vindo, esperamos que você se divirta em nosso servidor!");
	SendClientMessage(playerid, COLOR_SKY_BLUE, "Se não souber como jogar ainda, digite /ajuda /rpg /comandos");
	SendClientMessage(playerid, COLOR_SKY_BLUE, "Para evitar o cansaço de ficar lendo tudo diretamente, você poderá aprender as coisas durante o jogo,");
	SendClientMessage(playerid, COLOR_SKY_BLUE, "basta ir à um determinado lugar e digitar /sobre , assim você terá uma breve explicação sobre ele.");
	SendClientMessage(playerid, COLOR_ROYAL_BLUE, "Virtual Life RPG Revolution, trazendo toda a diversão e aventura de uma segunda vida. =D");
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);
}

public OnPlayerDisconnect(playerid, reason)
{
	switch(reason)
	{
	    case 0:
	    {
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 54);
	    }
	    case 1:
	    {
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);
	    }
	    case 2:
	    {
	        SendDeathMessage(INVALID_PLAYER_ID, playerid, 3);
	    }
	}
	
	TextDrawHideForPlayer(playerid, tdVLREV);
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, -1786.6863, 1208.5667, 32.7761);
	SetPlayerFacingAngle(playerid, 191.6203);
	SetPlayerCameraPos(playerid, -1786.5111, 1201.5464, 32.7761);
	SetPlayerCameraLookAt(playerid, -1786.6863, 1208.5667, 32.7761);
	ApplyAnimation(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 1, 1, 1, 1);
	ShowLoginDialog(playerid);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(!Login[playerid])
	{
	    SendClientMessage(playerid, COLOR_GRAY, "Você deve se registrar ou logar para começar a jogar...");
	    return 0;
	}
	GameTextForPlayer(playerid, "~b~Virtual ~r~L~w~i~r~f~w~e ~b~R~y~P~g~G ~n~~y~Revolution", 4000, 0);
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
	
	TextDrawHideForPlayer(playerid, tdVLREV);
    TextDrawShowForPlayer(playerid, tdVLREV);
    
	SetPlayerColor(playerid, Jobs[GetIntValue(GetPlayerFilePath(playerid), "Job")][jobColor]);
}

public Time()
{

}

stock SetPlayerItem(playerid, itemid)
{
	return SetIntValue(GetPlayerFilePath(playerid), "Itens", GetIntValue(GetPlayerFilePath(playerid), "Itens") | (1 << itemid));
}

stock UnsetPlayerItem(playerid, itemid)
{
	return SetIntValue(GetPlayerFilePath(playerid), "Itens", GetIntValue(GetPlayerFilePath(playerid), "Itens") & ~(itemid));
}

stock GetPlayerItem(playerid, itemid)
{
	return GetIntValue(GetPlayerFilePath(playerid), "Itens") & itemid;
}

stock AttachPlayerBackpack(playerid)
{
	DettachPlayerBackpack(playerid);
	BackpackObject[playerid] = CreateObject(371, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	AttachObjectToPlayer(BackpackObject[playerid], playerid, 0, -0.2, 0.2, 0, 0, 0);
}

stock DettachPlayerBackpack(playerid)
{
	DestroyObject(BackpackObject[playerid]);
}

stock AttachPlayerHandgun(playerid)
{
    new hg = GetIntValue(GetPlayerFilePath(playerid), "Handgun");
    new am = GetIntValue(GetPlayerFilePath(playerid), "HandgunAmmo");
	if(Weapons[hg][wObjectId] != 0 && am > 0)
	{
	    DettachPlayerHandgun(playerid);
		HandgunObject[playerid] = CreateObject(Weapons[hg][wObjectId], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		AttachObjectToPlayer(HandgunObject[playerid], playerid, 0.1, -0.1, 0.2, 0, 45.0, 180);
	}
}

stock DettachPlayerHandgun(playerid)
{
	DestroyObject(HandgunObject[playerid]);
}

stock GivePlayerWeaponEx(playerid, weaponid, ammo)
{
	new slot = Weapons[weaponid][wSlot];
	if(slot == 3 || slot == 4 || slot == 5 || slot == 6 || slot == 7)
	{
	    new hg = GetIntValue(GetPlayerFilePath(playerid), "Handgun");
    	new am = GetIntValue(GetPlayerFilePath(playerid), "HandgunAmmo");
	    if(weaponid != hg && hg != 0 && am > 0)
	    {
	        return 0;
	    }
	    if(weaponid == hg)
	    {
	        SetIntValue(GetPlayerFilePath(playerid), "HandgunAmmo", am + ammo);
	    }
	    else
	    {
	        SetIntValue(GetPlayerFilePath(playerid), "Handgun", weaponid);
	        SetIntValue(GetPlayerFilePath(playerid), "HandgunAmmo", ammo);
	    }
	    GivePlayerWeapon(playerid, weaponid, ammo);
	}
	else if(slot == 2)
	{
	    new lg = GetIntValue(GetPlayerFilePath(playerid), "Lightgun");
    	new am = GetIntValue(GetPlayerFilePath(playerid), "LightgunAmmo");
	    if(weaponid != lg && lg != 0 && am > 0)
	    {
	        return 0;
		}
		if(weaponid == lg)
		{
		    SetIntValue(GetPlayerFilePath(playerid), "LightgunAmmo", am + ammo);
		}
		else
		{
		    SetIntValue(GetPlayerFilePath(playerid), "Lightgun", weaponid);
	        SetIntValue(GetPlayerFilePath(playerid), "LightgunAmmo", ammo);
		}
		GivePlayerWeapon(playerid, weaponid, ammo);
	}
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:mid = GetPlayerMenu(playerid);

	if(mid == Bank[0] && IsValidMenu(Bank[0]))
	{
	    switch(row)
	    {
	    	case 0:
	    	{
				BankOpc[playerid] = 1;
				SetMenuColumnHeader(Bank[1], 1, GetValue(GetPlayerFilePath(playerid), "Bank"));
				ShowMenuForPlayer(Bank[1], playerid);
				TogglePlayerControllable(playerid, false);
	    	}
	    	case 1:
	    	{
	    	    BankOpc[playerid] = 2;
	    	    SetMenuColumnHeader(Bank[1], 1, GetValue(GetPlayerFilePath(playerid), "Bank"));
	    	    ShowMenuForPlayer(Bank[1], playerid);
    		    TogglePlayerControllable(playerid, false);
	    	}
	    	case 2:
    		{
				new string[128];
				format(string, sizeof string, "[Life's Bank] Seu saldo: $%s,00 dólares.", GetValue(GetPlayerFilePath(playerid), "Bank"));
				SendClientMessage(playerid, COLOR_GREEN, string);
				TogglePlayerControllable(playerid, false);
				ShowMenuForPlayer(Bank[0], playerid);
				ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 1, 1);
	  	  	}
		}
	}
	
	else if(mid == Bank[1] && IsValidMenu(Bank[1]))
	{
 		new mBankValues[] = { 1, 5, 10, 50, 100, 500, 1000, 5000, 10000, 50000, 100000 };
  		if(BankOpc[playerid] == 1)
    	{
   			if(GetIntValue(GetPlayerFilePath(playerid), "Bank") < mBankValues[row])
	        {
				SendClientMessage(playerid, COLOR_GRAY, "Você não possui essa quantidade para sacar.");
    		}
	        else
	        {
	        	GivePlayerMoneyEx(playerid, mBankValues[row]);
				SetIntValue(GetPlayerFilePath(playerid), "Bank", GetIntValue(GetPlayerFilePath(playerid), "Bank") - mBankValues[row]);
				new string[128];
				format(string, sizeof string, "[Life's Bank] Saque realizado, atual saldo: $%d,00 dólares.", GetIntValue(GetPlayerFilePath(playerid), "Bank"));
				SendClientMessage(playerid, COLOR_GREEN, string);
    		}
		}
		else if(BankOpc[playerid] == 2)
		{
  			if(GetPlayerMoneyEx(playerid) < mBankValues[row])
     		{
       			SendClientMessage(playerid, COLOR_GRAY, "Você não possui essa quantidade para depositar.");
          	}
           	else
	        {
         		GivePlayerMoneyEx(playerid, -mBankValues[row]);
				SetIntValue(GetPlayerFilePath(playerid), "Bank", GetIntValue(GetPlayerFilePath(playerid), "Bank") + mBankValues[row]);
				new string[128];
				format(string, sizeof string, "[Life's Bank] Depósito realizado, atual saldo: $%d,00 dólares.", GetIntValue(GetPlayerFilePath(playerid), "Bank"));
				SendClientMessage(playerid, COLOR_GREEN, string);
    		}
		}
		else
		{
		    TogglePlayerControllable(playerid, true);
		    return 0;
		}
		SetMenuColumnHeader(Bank[1], 1, GetValue(GetPlayerFilePath(playerid), "Bank"));
		ShowMenuForPlayer(Bank[1], playerid);
		TogglePlayerControllable(playerid, false);
		ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 1, 1);
	}
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	new Menu:mid = GetPlayerMenu(playerid);
	
	if(mid == Bank[1])
	{
		BankOpc[playerid] = 0;
		ShowMenuForPlayer(Bank[0], playerid);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	
	BankOpc[playerid] = 0;
	TogglePlayerControllable(playerid, true);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[128], idx = 0;
	cmd = strtok(cmdtext, idx);
	
	if(!IsPlayerAdmin(playerid))
	{
		for(new j = 0; j < sizeof JobCommands; j++)
		{
		    new offset_idx = 0;
			if(strcmp(cmd, strtok(JobCommands[j][jCmd], offset_idx), true) == 0)
			{
			    if(GetIntValue(GetPlayerFilePath(playerid), "Job") != JobCommands[j][jJob])
			    {
			        SendClientMessage(playerid, COLOR_GRAY, "Você não tem permissão para usar esse comando.");
			        return 1;
			    }
			    break;
			}
		}
	}

    if(strcmp(cmd, "/profs", true) == 0)
	{
	    SendClientMessage(playerid, COLOR_WHITE, "Profissões do Virtual Life RPG Revolution - Parte I:");
	    SendClientMessage(playerid, COLOR_DESEMPREGADO, "Desempregado (Sem salário)");
	    SendClientMessage(playerid, COLOR_TAXISTA, "Taxista (Salário: $500,00 dólares + passageiros)");
	    SendClientMessage(playerid, COLOR_FRENTISTA, "Frentista (Salário: $400,00 dólares + abastecimentos)");
	    SendClientMessage(playerid, COLOR_BARMAN, "Barman (Salário: $400,00 dólares + bebidas)");
	    SendClientMessage(playerid, COLOR_PARAMEDICO, "Paramédico (Salário: $500,00 dólares + curativos e resgates)");
	    SendClientMessage(playerid, COLOR_POLICIAL_MILITAR, "Policial Militar (Salário: $400,00 dólares + recompensas)");
	    SendClientMessage(playerid, COLOR_POLICIAL_SWAT, "Policial SWAT (Salário: $1200,00 dólares + recompensas e operações)");
	    SendClientMessage(playerid, COLOR_DELEGADO, "Delegado (Salário: $3000,00 dólares + recompensas)");
	    SendClientMessage(playerid, COLOR_WHITE, "Para ver mais profissões digite /profs2");
	    return 1;
	}
	
	if(strcmp(cmd, "/profs2", true) == 0)
	{
	    SendClientMessage(playerid, COLOR_WHITE, "Profissões do Virtual Life RPG Revolution - Parte II:");
	    SendClientMessage(playerid, COLOR_TRAFICANTE, "Traficante (Salário: $1000,00 dólares + tráfico)");
	    SendClientMessage(playerid, COLOR_PIZZABOY, "Pizzaboy (Salário: $500,00 dólares + entregas e vendas de pizzas)");
	    SendClientMessage(playerid, COLOR_TRANSPORTES_PUBLICOS, "Transportador Público (Salário: $500,00 dólares + passageiros)");
	    SendClientMessage(playerid, COLOR_CORRETOR_IMOVEIS, "Corretor de imóveis (Salário: $200,00 dólares + 10 porcento dos imóveis)");
	    SendClientMessage(playerid, COLOR_VENDEDOR_VEICULOS, "Vendedor de veículos (Salário: $200,00 dólares + 10 porcento dos veículos)");
	    SendClientMessage(playerid, COLOR_MECANICO, "Mecânico (Salário: $600,00 dólares + customização e reparos dos veículos)");
	    SendClientMessage(playerid, COLOR_ADVOGADO, "Advogado (Salário: $1000,00 dólares + honorários)");
	    SendClientMessage(playerid, COLOR_JUIZ, "Juiz (Salário: $4000,00 dólares)");
	    SendClientMessage(playerid, COLOR_WHITE, "Essas são as profissões do Virtual Life RPG Revolution");
	    return 1;
	}
	
	if(strcmp(cmd, "/emprego", true) == 0)
	{
	    new list_id = strval(strtok(cmdtext, idx));

		if(list_id <= 0)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Lista invalida, as listas iniciam pelo ID 1.");
		    return 1;
		}
		
  		new _cmds = COMMANDS_PER_LIST * (list_id - 1), results = 0;
  		
	    SendClientMessage(playerid, COLOR_WHITE, "Comandos da sua profissão:");
	    
		for(new j = 0; j < sizeof JobCommands; j++)
		{
			if(JobCommands[j][jJob] == GetIntValue(GetPlayerFilePath(playerid), "Job"))
			{
			    if(results >= _cmds)
			    {
					new send_text[128];
					format(send_text, sizeof send_text, "%s - %s", JobCommands[j][jCmd], JobCommands[j][jDescription]);
					SendClientMessage(playerid, Jobs[GetIntValue(GetPlayerFilePath(playerid), "Job")][jobColor], send_text);
				}

				results++;

				if(results >= _cmds + COMMANDS_PER_LIST)
				{
				    break;
				}
			}
		}
		
		if(results < _cmds)
		{
			new string[128];
			format(string, sizeof string, "USO: /emprego [1-%d]", results / COMMANDS_PER_LIST);
			SendClientMessage(playerid, COLOR_GRAY, string);
		}
		
		return 1;
	}
	
	if(strcmp(cmd, "/compraritem", true) == 0)
	{
	    if(GetPlayerInt(playerid) != INT_UTILIDADES)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Você não está na loja de itens pessoais!");
	        return 1;
	    }
	    
	    new item[128], itemid = -1;
		item = strtok(cmdtext, idx);

		for(new it = 0; it < sizeof Itens; it++)
		{
		    if(strcmp(Itens[it][itemName], item, true) == 0)
		    {
		        itemid = it;
		        break;
		    }
		}
		
		if(itemid == -1)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /compraritem [item]");
		    return 1;
		}
		
		if(GetPlayerItem(playerid, itemid))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Você já possui este item!");
		    return 1;
		}
		
		if(GetPlayerMoneyEx(playerid) < Itens[itemid][itemValue])
		{
		    new string[128];
		    format(string, sizeof string, "Você não possui dinheiro para adquirir este item [Valor: $%d,00 dólares]", Itens[itemid][itemValue]);
		    SendClientMessage(playerid, COLOR_GRAY, string);
			return 1;
		}
		
		GivePlayerMoneyEx(playerid, -Itens[itemid][itemValue]);
		SetPlayerItem(playerid, itemid);
		
		new string[128];
		format(string, sizeof string, "Item adquirido [Item: %s] [Valor: $%d,00 dólares]", Itens[itemid][itemName], Itens[itemid][itemValue]);
		SendClientMessage(playerid, COLOR_GREEN, string);
	    return 1;
	}
	
	if(strcmp(cmd, "/cederitem", true) == 0)
	{
	    new item[128], itemid = -1;
		item = strtok(cmdtext, idx);

		if(!strlen(item))
		{
			SendClientMessage(playerid, COLOR_GRAY, "USO: /cederitem [id] [item]");
		    return 1;
		}
		
		new plid = strval(item);
		if(!IsPlayerConnected(plid))
		{
			SendClientMessage(playerid, COLOR_GRAY, "Jogador não conectado/logado.");
		    return 1;
		}
		
		new Float:aX, Float:aY, Float:aZ, Float:bX, Float:bY, Float:bZ;
		GetPlayerPos(playerid, aX, aY, aZ);
		GetPlayerPos(plid, bX, bY, bZ);
		
		if(GetDistance(aX, aY, aZ, bX, bY, bZ) > 15.0)
		{
			SendClientMessage(playerid, COLOR_GRAY, "Você está muito longe, chegue mais perto do outro jogador.");
			return 1;
		}
		
		item = strtok(cmdtext, idx);
		
		for(new it = 0; it < sizeof Itens; it++)
		{
		    if(strcmp(Itens[it][itemName], item, true) == 0)
		    {
		        itemid = it;
		        break;
		    }
		}

		if(itemid == -1)
		{
			SendClientMessage(playerid, COLOR_GRAY, "USO: /cederitem [id] [item]");
		    return 1;
		}
		
		if(!GetPlayerItem(playerid, itemid))
		{
			SendClientMessage(playerid, COLOR_GRAY, "Você não possui este item!");
		    return 1;
		}
		
		if(GetPlayerItem(plid, itemid))
		{
			SendClientMessage(playerid, COLOR_GRAY, "Esse jogador já possui este item!");
			return 1;
		}
		
		SetPlayerItem(plid, itemid);
		UnsetPlayerItem(playerid, itemid);

		new string[128];
		format(string, sizeof string, "Item cedido [Item: %s] para %s.", Itens[itemid][itemName], PlayerName(plid));
		SendClientMessage(playerid, COLOR_GREEN, string);
		format(string, sizeof string, "%s lhe cedeu um item [Item: %s]", PlayerName(playerid), Itens[itemid][itemName]);
		SendClientMessage(plid, COLOR_GREEN, string);
        return 1;
	}

	if(strcmp(cmd, "/venderitem", true) == 0)
	{
	    if(GetPlayerInt(playerid) != INT_UTILIDADES)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Você não está na loja de itens pessoais!");
	        return 1;
	    }
	    
	    new item[128], itemid = -1;
		item = strtok(cmdtext, idx);

		for(new it = 0; it < sizeof Itens; it++)
		{
		    if(strcmp(Itens[it][itemName], item, true) == 0)
		    {
		        itemid = it;
		        break;
		    }
		}

		if(itemid == -1)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /venderitem [item]");
		    return 1;
		}

		if(!GetPlayerItem(playerid, itemid))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Você não possui este item!");
		    return 1;
		}
		
		UnsetPlayerItem(playerid, itemid);
		GivePlayerMoneyEx(playerid, Itens[itemid][itemValue] / 2);
		
		new string[128];
		format(string, sizeof string, "Item vendido [Item: %s] por $%d,00 dólares.", Itens[itemid][itemName], Itens[itemid][itemValue] / 2);
		SendClientMessage(playerid, COLOR_GREEN, string);
        return 1;
	}
	
	if(strcmp(cmd, "/banco", true) == 0)
	{
	    if(PlayerArea[playerid] != AREA_BANCO)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Você não está em um Caixa-Rápido!");
	        return 1;
		}
		ShowMenuForPlayer(Bank[0], playerid);
  		TogglePlayerControllable(playerid, false);
        return 1;
	}
	
	if(strcmp(cmd, "/entrar", true) == 0)
	{
		if(PlayerDoor[playerid] == -1)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Você não está em uma entrada.");
		    return 1;
		}
		new intid = Enters[PlayerDoor[playerid]][intID];
		SetPlayerInterior(playerid, Ints[intid][intInt]);
		SetPlayerPos(playerid, Ints[intid][intX], Ints[intid][intY], Ints[intid][intZ]);
		PlayerEnter[playerid] = PlayerDoor[playerid];
		PlayerDoor[playerid] = -1;
        return 1;
	}
	
	if(strcmp(cmd, "/sair", true) == 0)
	{
	    if(PlayerEnter[playerid] == -1)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Você não está em um interior.");
		    return 1;
	    }
	    new intid = Enters[PlayerEnter[playerid]][intID], Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		if(GetDistance(X, Y, Z, Ints[intid][intX], Ints[intid][intY], Ints[intid][intZ]) > 2.5)
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Você deve estar próximo à alguma saída.");
		    return 1;
		}
		SetPlayerInterior(playerid, Enters[PlayerEnter[playerid]][enterInt]);
		SetPlayerPos(playerid, Enters[PlayerEnter[playerid]][enterX], Enters[PlayerEnter[playerid]][enterY], Enters[PlayerEnter[playerid]][enterZ]);
		PlayerEnter[playerid] = -1;
        return 1;
	}
	
	if(strcmp(cmd, "/votekick", true) == 0)
	{
	    if(VoteKickPlayer != -1)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Já há uma votação em andamento, aguarde...");
		    return 1;
	    }
	    
	    PlayerCount = 0;
	    
	    for(new i = 0; i < MAX_SLOTS; i++)
	    {
	        if(IsPlayerConnected(i))
	        {
	            PlayerCount++;
	        }
	    }
	    
	    PlayerCount /= 2;
	    
	    if(PlayerCount < 2)
	    {
	        PlayerCount = 0;
	        SendClientMessage(playerid, COLOR_GRAY, "É necessário mais jogadores para iniciar uma votação...");
		    return 1;
	    }
	    
	    new tmp[128];
		tmp = strtok(cmdtext, idx);
		
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /votekick [id] [motivo]");
		    return 1;
		}
		
		new plid = strval(tmp);
		
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Jogador não conectado/logado.");
		    return 1;
		}
		
		new motivo[128];
		
		if(plid < 10) strmid(motivo, cmdtext, 12, strlen(cmdtext));
		else if(plid < 100) strmid(motivo, cmdtext, 13, strlen(cmdtext));
		else strmid(motivo, cmdtext, 14, strlen(cmdtext));
		
		if(!strlen(motivo))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "USO: /votekick [id] [motivo]");
		    return 1;
		}
		
		new string[128];

		format(string, sizeof string, "[VOTEKICK] %s iniciou uma votação para kickar %s [Votos necessários: %d]", PlayerName(playerid), PlayerName(plid), PlayerCount);
		SendClientMessageToAll(COLOR_LIGHT_YELLOW, string);

		format(string, sizeof string, "[VOTEKICK] Motivo: %s", motivo);
		SendClientMessageToAll(COLOR_LIGHT_YELLOW, string);

		SendClientMessageToAll(COLOR_WHITE, "Use /votar para votar.");

		VoteKickPlayer = plid;
		VoteKickTimer = SetTimer("VoteKick", 30000, false);
		Votes = 1;
		Voted[playerid] = 1;
		
		SendClientMessage(playerid, COLOR_GREEN, "Seu voto já foi dado, agora somente aguarde...");
		return 1;
	}
	
	if(strcmp(cmd, "/votar", true) == 0)
	{
	    if(VoteKickPlayer == -1)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Não há nenhuma votação em andamento.");
		    return 1;
	    }
	    if(Voted[playerid] == 1)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Você já votou, aguarde o fim da votação...");
		    return 1;
	    }
	    Voted[playerid] = 1;
	    Votes++;
	    new string[128];
	    format(string, sizeof string, "[VOTEKICK] Votos: %d/%d", Votes, PlayerCount);
	    SendClientMessageToAll(COLOR_LIGHT_YELLOW, string);
	    if(Votes >= PlayerCount)
	    {
			format(string, sizeof string, "[VOTEKICK] Votação para kickar %s sucedida, jogador kickado.", PlayerName(VoteKickPlayer));
			SendClientMessageToAll(COLOR_LIGHT_YELLOW, string);
			Kick(VoteKickPlayer);
			Votes = 0;
			VoteKickPlayer = -1;
			for(new i = 0; i < MAX_SLOTS; i++)
			{
	    		Voted[i] = 0;
			}
			PlayerCount = 0;
			KillTimer(VoteKickTimer);
	    }
	    return 1;
	}
	
	if(strcmp(cmd, "/admin", true) == 0)
	{
	    if(!IsPlayerAdmin(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Você não é administrador!");
	        return 1;
	    }
	    
	    new adm_cmd[128], adm_tmp[128];
	    adm_cmd = strtok(cmdtext, idx);
	    
		if(!strlen(adm_cmd))
		{
		    return 1;
		}
		
	    if(strcmp(adm_cmd, "banir", true) == 0)
	    {
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "USO: /admin banir [id] [motivo]");
			    return 1;
			}
			
			new plid = strval(adm_tmp);
			
			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			strmid(adm_tmp, cmdtext, idx, strlen(cmdtext));
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "USO: /admin banir [id] [motivo]");
			    return 1;
			}
			
			BanPlayer(plid, adm_tmp);
	    }
	    
	    else if(strcmp(adm_cmd, "desbanir", true) == 0)
	    {
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "USO: /admin desbanir [usuario]");
			    return 1;
			}
			
			UnbanPlayer(adm_tmp);
	    }
	    
	    else if(strcmp(adm_cmd, "kickar", true) == 0)
	    {
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "USO: /admin kickar [id]");
			    return 1;
			}
			
			new plid = strval(adm_tmp);
			
			if(!IsPlayerConnected(plid))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "Jogador desconectado.");
			    return 1;
			}
			
			Kick(strval(adm_tmp));
	    }
	    
	    else if(strcmp(adm_cmd, "arma", true) == 0)
	    {
            adm_tmp = strtok(cmdtext, idx);

			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "USO: /admin arma [id] [id da arma] [municao]");
			    return 1;
			}
			
			new plid = strval(adm_tmp);
			
			adm_tmp = strtok(cmdtext, idx);
			
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "USO: /admin arma [id] [id da arma] [municao]");
			    return 1;
			}

			new weaponid = strval(adm_tmp);
			
			if((weaponid < 1 || weaponid > 15) && weaponid != 17 && (weaponid < 23 || weaponid > 25) && weaponid != 27 && (weaponid < 29 || weaponid > 31) && weaponid != 33)
			{
			    SendClientMessage(playerid, COLOR_GRAY, "Arma inválida!");
			    return 1;
			}
		
		    adm_tmp = strtok(cmdtext, idx);
		    
			if(!strlen(adm_tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAY, "USO: /admin arma [id] [id da arma] [municao]");
			    return 1;
			}

			new ammo = strval(adm_tmp);
			
			if(ammo < 0)
			{
			    SendClientMessage(playerid, COLOR_GRAY, "Municao acima de 0");
			    return 1;
			}
			
			GivePlayerWeaponEx(plid, weaponid, ammo);
	    }
	    
	    else if(strcmp(adm_cmd, "ir", true) == 0)
	    {
	        adm_tmp = strtok(cmdtext, idx);
	        
	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOR_GRAY, "USO: /ir [id]");
	            return 1;
	        }
	        
	        new plid = strval(adm_tmp);
	        
	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOR_GRAY, "Jogador desconectado.");
	            return 1;
	        }
	        
	        new Float:x, Float:y, Float:z;
	        GetPlayerPos(plid, x, y, z);
	        SetPlayerPos(playerid, x, y, z);
	        SetPlayerInterior(playerid, GetPlayerInterior(plid));
	        SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(plid));
	        PlayerEnter[playerid] = PlayerEnter[plid];
	        PlayerDoor[playerid] = -1;
	    }
	    
	    else if(strcmp(adm_cmd, "trazer", true) == 0)
	    {
	        adm_tmp = strtok(cmdtext, idx);

	        if(!strlen(adm_tmp))
	        {
	            SendClientMessage(playerid, COLOR_GRAY, "USO: /trazer [id]");
	            return 1;
	        }

	        new plid = strval(adm_tmp);

	        if(!IsPlayerConnected(plid))
	        {
	            SendClientMessage(playerid, COLOR_GRAY, "Jogador desconectado.");
	            return 1;
	        }

	        new Float:x, Float:y, Float:z;
	        GetPlayerPos(playerid, x, y, z);
	        SetPlayerPos(plid, x, y, z);
	        SetPlayerInterior(plid, GetPlayerInterior(playerid));
	        SetPlayerVirtualWorld(plid, GetPlayerVirtualWorld(playerid));
	        PlayerEnter[plid] = PlayerEnter[playerid];
	        PlayerDoor[plid] = -1;
	    }
	    
	    else
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "USO: /admin [comando] - COMANDOS DISPONÍVEIS:");
			SendClientMessage(playerid, COLOR_GRAY, "banir, desbanir, kickar, arma, ir, trazer");
			return 1;
	    }

	    printf("[ADMIN COMMAND] %s -> %s", PlayerName(playerid), cmdtext);
	    
	    SendClientMessage(playerid, COLOR_GREEN, "Feito.");
	    return 1;
	}
	
	SendClientMessage(playerid, COLOR_WHITE, "Comando inexistente.");
	return 1;
}

public OnPlayerUpdate(playerid)
{
	new pmoney = GetPlayerMoney(playerid), money = GetPlayerMoneyEx(playerid);
    
    if(money != pmoney)
    {
        new string[128];
        format(string, sizeof string, "[ANTI MONEY HACK] %s recebeu $%d,00 dólares.", PlayerName(playerid), money - pmoney);
        for(new i = 0; i < MAX_SLOTS; i++)
        {
			if(IsPlayerConnected(i) && IsPlayerAdmin(i))
			{
			    SendClientMessage(i, COLOR_ADMIN, string);
			}
        }
        print(string);
        
        GivePlayerMoney(playerid, -pmoney + money);
    }
    
    new pweapon = GetPlayerWeapon(playerid);
	if(pweapon != Weapon[playerid])
	{
	    OnPlayerChangeWeapon(playerid, Weapon[playerid], pweapon);
	    Weapon[playerid] = pweapon;
	}
}

public OnPlayerChangeWeapon(playerid, oldweapon, newweapon)
{
    new hg = GetIntValue(GetPlayerFilePath(playerid), "Handgun"), am = GetIntValue(GetPlayerFilePath(playerid), "HandgunAmmo");
	if(Weapons[hg][wObjectId] != 0 && am > 0)
	{
 		if(newweapon == hg)
   		{
     		DettachPlayerHandgun(playerid);
	    }
	    else
	    {
     		AttachPlayerHandgun(playerid);
   		}
	}
	
	new string[128];
 	format(string, sizeof string, "[ANTI WEAPON HACK] %s mudou a arma para %s [ID: %d]", PlayerName(playerid), Weapons[newweapon][wName], newweapon);
  	for(new i = 0; i < MAX_SLOTS; i++)
   	{
		if(IsPlayerConnected(i) && IsPlayerAdmin(i))
		{
		    SendClientMessage(i, COLOR_ADMIN, string);
		}
  	}
  	print(string);
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_REGISTER_LOGIN)
	{
	    if(!response)
	    {
	        SendClientMessage(playerid, COLOR_GRAY, "Solicitação de registro/login cancelada, você foi kickado do servidor!");
	        SpawnPlayer(playerid);
	        Kick(playerid);
	        return 0;
	    }
	    
	    if(Login[playerid])
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Você já está autenticado.");
			return 0;
	    }
	    
	    if(!strlen(inputtext))
		{
		    SendClientMessage(playerid, COLOR_GRAY, "Digite uma senha...");
		    ShowLoginDialog(playerid);
			return 0;
	    }
	    
	    if(!fexist(GetPlayerFilePath(playerid)))
	    {
	        SetValue(GetPlayerFilePath(playerid), "Password", inputtext);
			SetIntValue(GetPlayerFilePath(playerid), "Bank", 2000);
			SendClientMessage(playerid, COLOR_GREEN, "Você foi registrado com sucesso.");
	    }
	    else
	    {
	        if(strcmp(inputtext, GetValue(GetPlayerFilePath(playerid), "Password"), false) != 0)
	        {
	            SendClientMessage(playerid, COLOR_GRAY, "Senha incorreta!");
	            ShowLoginDialog(playerid);
	            return 0;
	        }
	        SendClientMessage(playerid, COLOR_GREEN, "Você foi autenticado com sucesso.");
	    }
	    
	    Login[playerid] = 1;
	    SpawnPlayer(playerid);
	    return 1;
 	}
    return 0;
}

stock BanPlayer(playerid, reason[])
{
	new IP[128], name[MAX_PLAYER_NAME];
	GetPlayerIp(playerid, IP, sizeof IP);
	GetPlayerName(playerid, name, sizeof name);
	new File:fp;
	if(fexist(#SERVER_DIRECTORY "BannedUsers.ini"))
	{
		fp = fopen(#SERVER_DIRECTORY "BannedUsers.ini", io_append);
	}
	else
	{
	    fp = fopen(#SERVER_DIRECTORY "BannedUsers.ini", io_write);
	}
	new date[6];
	gettime(date[0], date[1], date[2]);
	getdate(date[5], date[4], date[3]);
	new wtext[256];
	format(wtext, sizeof wtext, "%s %s [%d/%d/%d - %d:%d:%d] - (%s)", name, IP, date[3], date[4], date[5], date[0], date[1], date[2], reason);
	fwrite(fp, wtext);
	fclose(fp);
	Kick(playerid);
}

stock UnbanPlayer(playername[])
{
	if(!fexist(#SERVER_DIRECTORY "BannedUsers.ini")) return false;
	new File:fp = fopen(#SERVER_DIRECTORY "BannedUsers.ini", io_read);
	new File:buf = fopen(#SERVER_DIRECTORY "BannedUsers.buf", io_write);
	new tmp[256];
	while(fread(fp, tmp, sizeof tmp))
	{
	    new read[128], idx = 0;
	    read = strtok(tmp, idx);
		if(strcmp(read, playername, true) != 0)
		{
		    fwrite(buf, tmp);
		}
	}
	fclose(buf);
	fclose(fp);
	if(fcopytextfile(#SERVER_DIRECTORY "BannedUsers.buf", #SERVER_DIRECTORY "BannedUsers.ini")) return fremove(#SERVER_DIRECTORY "BannedUsers.buf");
	return false;
}

stock CheckBan(playerid)
{
	if(!fexist(#SERVER_DIRECTORY "BannedUsers.ini")) return ;
	new File:fp = fopen(#SERVER_DIRECTORY "BannedUsers.ini", io_read);
	new tmp[256];
	while(fread(fp, tmp, sizeof tmp))
	{
	    new read[128], idx = 0, name[MAX_PLAYER_NAME], IP[128];
	    read = strtok(tmp, idx);
	    GetPlayerName(playerid, name, sizeof name);
	    GetPlayerIp(playerid, IP, sizeof IP);
	    if(strcmp(read, name, true) == 0 || strcmp(strtok(tmp, idx), IP, true) == 0)
	    {
	        SendClientMessage(playerid, COLOR_LIGHT_YELLOW, "Você está banido do Virtual Life RPG Revolution.");
	        Kick(playerid);
	    }
	}
	fclose(fp);
}

public VoteKick()
{
	if(Votes >= PlayerCount)
	{
	    new string[128];
	    format(string, sizeof string, "[VOTEKICK] Votação para kickar %s sucedida, jogador kickado do servidor.", PlayerName(VoteKickPlayer));
	    SendClientMessageToAll(COLOR_LIGHT_YELLOW, string);
	    Kick(VoteKickPlayer);
	}
	else
	{
	    new string[128];
	    format(string, sizeof string, "[VOTEKICK] Votação para kickar %s falhada, a quantidade de votos necessária não foi atendida.", PlayerName(VoteKickPlayer));
		SendClientMessageToAll(COLOR_LIGHT_YELLOW, string);
	}
	Votes = 0;
	VoteKickPlayer = -1;
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    Voted[i] = 0;
	}
	PlayerCount = 0;
	KillTimer(VoteKickTimer);
}

public CheckArea()
{
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    if(IsPlayerConnected(i) && Login[i] == 1)
	    {
	        new Float:X, Float:Y, Float:Z;
	        GetPlayerPos(i, X, Y, Z);
			if(PlayerDoor[i] != -1)
			{
			    if(GetDistance(X, Y, Z, Enters[PlayerDoor[i]][enterX], Enters[PlayerDoor[i]][enterY], Enters[PlayerDoor[i]][enterZ]) > 2.5)
			    {
			        PlayerDoor[i] = -1;
			    }
			}
			else
			{
			    for(new e = 0; e < sizeof Enters; e++)
			    {
			        if(GetDistance(X, Y, Z, Enters[e][enterX], Enters[e][enterY], Enters[e][enterZ]) <= 2.5)
			        {
			            PlayerDoor[i] = e;
			            new show_text[128];
			            format(show_text, sizeof show_text, "~g~~h~%s ~n~~y~/entrar ~w~para entrar", Ints[Enters[e][intID]][intName]);
			            GameTextForPlayer(i, show_text, 7000, 3);
			        }
			    }
			}
			if(PlayerEnter[i] != -1)
			{
			    new intid = Enters[PlayerEnter[i]][intID];
			    if(GetDistance(X, Y, Z, Ints[intid][intX], Ints[intid][intY], Ints[intid][intZ]) <= 2.5)
			    {
			        new show_text[128];
           			format(show_text, sizeof show_text, "~g~~h~%s ~n~~y~/sair ~w~para sair", Ints[intid][intName]);
		         	GameTextForPlayer(i, show_text, 7000, 3);
			    }
			}
	        if(PlayerArea[i] != AREA_NULL)
	        {
	            new bool:inarea = false;
	            for(new a = 0; a < sizeof Areas; a++)
	            {
					if(!inarea && Areas[a][areaID] == PlayerArea[i])
					{
	                	if(GetDistance(X, Y, Z, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ]) < Areas[a][areaRadi])
	                	{
	                	    inarea = true;
	                	}
					}
	            }
	            if(!inarea)
				{
					PlayerArea[i] = AREA_NULL;
				}
	        }
	        else
	        {
	            for(new a = 0; a < sizeof Areas; a++)
	            {
					if(PlayerArea[i] == AREA_NULL)
					{
                    	if(GetDistance(X, Y, Z, Areas[a][areaX], Areas[a][areaY], Areas[a][areaZ]) < Areas[a][areaRadi])
            			{
            			    PlayerArea[i] = Areas[a][areaID];
            			    if(PlayerArea[i] == AREA_BANCO)
            			    {
            			        SendClientMessage(i, COLOR_GREEN, "Você entrou em um Caixa-Rápido, use /banco para ter acesso às atividades bancárias.");
							}
            			    else if(PlayerArea[i] == AREA_OFICINA)
            			    {
            			        SendClientMessage(i, COLOR_SKY_BLUE, "Você pode customizar veículos aqui, digite /oficina");
            			    }
            			    else if(PlayerArea[i] == AREA_POSTO)
            			    {
								GameTextForPlayer(i, "~g~/abastecer ~w~para ~n~abastecer", 4000, 1);
            			    }
	                	}
					}
	            }
	        }
	        if(Company[i] != 0)
	        {
	        	for(new c = 1; c < sizeof Companies; c++)
	        	{
	        	    if(GetDistance(X, Y, Z, Companies[c][cX], Companies[c][cY], Companies[c][cZ]) <= 10.0)
	        	    {
	        	        Company[i] = c;
	        	        
	        	        new jobid = Companies[c][cProf], string[128], bool:req = false;
	        	        
	        	        SendClientMessage(i, COLOR_SKY_BLUE, "-------------------- [ Emprego disponível ] --------------------");

	        	        format(string, sizeof string, "Emprego: %s - Salário: $%d,00 dólares - Público: %s", Jobs[jobid][jobName], Jobs[jobid][jobPayday], (Companies[c][cPublic]) ? ("sim") : ("não"));
	        	        SendClientMessage(i, COLOR_WHITE, string);
	        	        
	        	        SendClientMessage(i, COLOR_SKY_BLUE, "------------------------ [ Requisitos ] ------------------------");
	        	        
	        	        for(new e = 0; e < sizeof Experiences; e++)
	        	        {
	        	            if(JobsExp[jobid][e] > 0)
	        	            {
	        	                format(string, sizeof string, "Experiência %s: %d", Experiences[e], JobsExp[jobid][e]);
	        	                SendClientMessage(i, COLOR_WHITE, string);
	        	                req = true;
	        	            }
	        	        }
	        	        
	        	        if(!req)
	        	        {
	        	            SendClientMessage(i, COLOR_WHITE, "Nenhum requisito para se empregar");
	        	        }
	        	        
	        	        SendClientMessage(i, COLOR_SKY_BLUE, "----------------------------------------------------------------");
	        	        format(string, sizeof string, "Para assinar um contrato com a empresa %s digite /assinar", Companies[c][cName]);
	        	        SendClientMessage(i, COLOR_LIGHT_YELLOW, string);
	        	        break;
	            	}
	        	}
			}
			else
			{
			    if(GetDistance(X, Y, Z, Companies[Company[i]][cX], Companies[Company[i]][cY], Companies[Company[i]][cZ]) > 10.0)
			    {
			        Company[i] = 0;
			    }
			}
	    }
	}
}
