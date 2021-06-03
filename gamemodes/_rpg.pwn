#include <a_samp>

#define MAX_SLOTS                       30

#define Profissao[%1] PlayerStats[%1][pJob]
#define Petrol[%1] PlayerStats[%1][pGas]

#define COLOR_RED              			0xFF0000AA
#define COLOR_GREEN            			0x00FF00AA
#define COLOR_BLUE                      0xA9CDE6AA
#define COLOR_YELLOW           			0xFFFFB3AA
#define COLOR_WHITE            			0xFFFFFFAA
#define COLOR_GRAY             			0xAFAFAFAA
#define COLOR_DESEMPREGADO     			0x666666AA
#define COLOR_INSTRUTOR        			0xFFFFB3AA
#define COLOR_TAXISTA          			0x52A0A5AA
#define COLOR_COP_CIVIL        			0x0066FFAA
#define COLOR_COP_ELITE        			0x00C7FFAA
#define COLOR_ASSASSINO        			0xAA3333AA
#define COLOR_VENDEDOR         			0xCCFF00AA
#define COLOR_COP_RODOVIARIO   			0x00CED3AA
#define COLOR_SEGURANÇA        			0x52A577AA
#define COLOR_BARMAN           			0x669966AA
#define COLOR_CORRETOR         			0xDEB887AA
#define COLOR_PESCADOR         			0xFFCC99AA
#define COLOR_MOTORISTA_PARTICULAR      0xFFFF99AA
#define COLOR_MOTORISTA_ONIBUS 			0xA9CDE6AA
#define COLOR_JUIZ             			0x7FFF00AA
#define COLOR_AGRICULTOR       			0x66CC00AA
#define COLOR_VENDEDOR_DE_ARMAS         0x99FFFFAA
#define COLOR_MECANICO                  0xCCFFFFAA
#define COLOR_TRAFICANTE                0x6699CCAA
#define COLOR_ADVOGADO                  0x003399AA
	 
#define DESEMPREGADO          			1
#define TAXISTA               			2
#define BARMAN                   		3
#define SEGURANÇA                       4
#define MOTORISTA_PARTICULAR            5
#define AGRICULTOR                      6
#define PESCADOR                        7
#define MOTORISTA_DE_ONIBUS             8
#define VENDEDOR_DE_ARMAS               9
#define MECANICO                        10
#define VENDEDOR_DE_CARROS              11
#define CORRETOR                        12
#define ASSASSINO                       13
#define COP_CIVIL             			14
#define COP_RODOVIARIO        			15
#define COP_ELITE             			16
#define JUIZ                            17
#define INSTRUTOR_DE_DIRECAO  			18
#define TRAFICANTE                      19
#define ADVOGADO                        20
#define MAX_JOBS                        21

#define TIME_DROPPED_WEAPONS            (40000)
#define MAX_DROPPED_WEAPONS         	(80)
#define MAX_WEAPON_SLOT             	(13)
#define MIN_WEAPON_DROPPED_DISTANCE    	(1.5)
#define INVALID_WEAPON_VALUE        	(-1)
#define INVALID_DROPPED_WEAPON_ID       (-1)
#define INVALID_WEAPON_PICKUP       	(-2)

#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

enum e_PlayerStats
{
	pPassword[128], pJob, pMoney, pBusted, pBank, pGas, pSkin,
	pWanted, pHabTerrain, pHabNaut, pHabAir,
	Float:pX, Float:pY, Float:pZ, Float:pAng, Float:pHealth
};
new PlayerStats[MAX_SLOTS][e_PlayerStats];

enum WeaponPickupInfo
{
	p_weapon_pckid,
	p_weapon_id,
	p_weapon_ammo,
	p_weapon_timer
};
new wPickups[MAX_DROPPED_WEAPONS][WeaponPickupInfo];

new wLastPck = 0;
new Login[MAX_SLOTS] = 0;
new AreaPosto[MAX_SLOTS] = 0;
new AreaBanco[MAX_SLOTS] = 0;
new AreaPesca[MAX_SLOTS] = 0;
new AreaFazenda[MAX_SLOTS] = 0;
new AreaMercado[MAX_SLOTS] = 0;
new Verduras[MAX_SLOTS] = 0;
new Plantacao[MAX_SLOTS] = 0;
new Pescado[MAX_SLOTS] = 0;
new Plantando[MAX_SLOTS] = 0;
new Pescando[MAX_SLOTS] = 0;
new TempoPreso[MAX_SLOTS] = 0;
new Taximetro[MAX_SLOTS][2];
new PrecoCorrida[MAX_SLOTS] = 0;
new Bebida[MAX_SLOTS] = 0;
new GameTime;
new WeaponsPickup[] =
{
	INVALID_WEAPON_PICKUP,
	331,
	333,
	334,
	335,
	336,
	337,
	338,
	339,
	341,
	321,
	322,
	323,
	324,
	325,
	326,
	342,
	343,
	344,
	INVALID_WEAPON_PICKUP,
	INVALID_WEAPON_PICKUP,
	INVALID_WEAPON_PICKUP,
	346,
	347,
	348,
	349,
	350,
	351,
	352,
	353,
	355,
	356,
	372,
	357,
	358,
	359,
	360,
	361,
	362,
	363,
	INVALID_WEAPON_PICKUP,
	365,
	366,
	367,
	INVALID_WEAPON_PICKUP,
	INVALID_WEAPON_PICKUP,
	371
};

forward SaveAccounts();
forward Colheita(playerid);
forward TempoPrisao();
forward Taxi();
forward Pesca(playerid);
forward PutVehicleInPos(vehicleid, Float:x, Float:y, Float:z, Float:ang);
forward ApplyPlayerInVehicle(playerid, vehicleid, seatid);
forward CheckFuel();
forward LogarPlayer(playerid);
forward Areas();
forward MTaxi();
forward UpdateSpeed();
forward GetDistanceBetweenPlayers(playerid, playerid2);
forward Tempo();
forward Speed();
forward TimeFunction(playerid);
forward SetCar(carid, Float:X, Float:Y, Float:Z, Float:ang, cor1, cor2);
forward DropWeapons(playerid);
forward RemoveDroppedWeapon(dropped_weapon_id);

main()
{
	print("\n--------------------------------------------");
	print("             Hard Life RPG");
	print("--------------------------------------------");
	print("     Uma parceria entre Michael e Rafael\n");
	print("     Special Thanks: SolidNuts, Luigui,");
	print("         	TheHitman e DaMNeD");
	print("--------------------------------------------\n");
	GameTime = 12;
}

stock set(dest[], const source[]) // By DracoBlue
{
	for(new i = 0; i < strlen(source); i++)
	{
		dest[i] = source[i];
	}
	dest[strlen(source)] = EOS;
}

stock strtok(const string[], &index, seperator=' ') // By DracoBlue
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

stock GetDroppedWeaponID(pickupid)
{
	for(new i = 0; i < wLastPck; i++)
	{
	    if(wPickups[i][p_weapon_pckid] == pickupid) return i;
	}
	return INVALID_DROPPED_WEAPON_ID;
}

public DropWeapons(playerid)
{
    new _amnt_weapons = 0;
	for(new __w = 0; __w < wLastPck; __w++)
	{
	    if(wPickups[__w][p_weapon_ammo] > 0) _amnt_weapons = __w;
	}
	if(_amnt_weapons == 0)
	{
		if(wPickups[0][p_weapon_ammo] > 0) wLastPck = 1;
		else wLastPck = 0;
	}
	else
	{
	    wLastPck = _amnt_weapons + 1;
		if(wLastPck >= MAX_DROPPED_WEAPONS) wLastPck = MAX_DROPPED_WEAPONS - 1;
	}
	_amnt_weapons = 0;
	new _weapons[MAX_WEAPON_SLOT + 1][2];
	for(new _w = 0; _w <= MAX_WEAPON_SLOT; _w++)
	{
		new _t = 0;
	 	do
	    {
	    	GetPlayerWeaponData(playerid, _w, _weapons[_w][0], _weapons[_w][1]);
	    	if(_w == 0 && _weapons[0][0] == 0) _weapons[0][1] = 0;
	    	_t++;
		} while(_weapons[_w][1] == 65535 && _t < 10);
		if(_weapons[_w][0] == 0 || _weapons[_w][1] == 0 || _weapons[_w][0] > sizeof WeaponsPickup || WeaponsPickup[ _weapons[_w][0] ] == INVALID_WEAPON_PICKUP)
		{
		    _weapons[_w][0] = INVALID_WEAPON_VALUE;
		    _weapons[_w][1] = INVALID_WEAPON_VALUE;
		}
		else
		{
			_amnt_weapons++;
		}
	}
	if(_amnt_weapons == 0) return ;
	ResetPlayerWeapons(playerid);
	for(new i = 0; i < MAX_WEAPON_SLOT; i++)
	{
	    if(_weapons[i][0] != INVALID_WEAPON_VALUE && _weapons[i][1] != INVALID_WEAPON_VALUE)
	    {
	        new Float:_x, Float:_y, Float:_z;
	        GetPlayerPos(playerid, _x, _y, _z);
			new bool:created = false;
			for(new _i = 0; _i < wLastPck; _i++)
			{
			    if(wPickups[_i][p_weapon_ammo] == 0 && !created)
			    {
			        wPickups[_i][p_weapon_pckid] = CreatePickup(WeaponsPickup[_weapons[i][0]], 19, _x + (floatsin(-i * (20.0 * _amnt_weapons), degrees) * (_amnt_weapons / 2 + MIN_WEAPON_DROPPED_DISTANCE)), _y + (floatcos(-i * (20.0 * _amnt_weapons), degrees) * (_amnt_weapons / 2 + MIN_WEAPON_DROPPED_DISTANCE)), _z);
			        wPickups[_i][p_weapon_id] = _weapons[i][0];
			        wPickups[_i][p_weapon_ammo] = _weapons[i][1];
			        wPickups[_i][p_weapon_timer] = SetTimerEx("RemoveDroppedWeapon", TIME_DROPPED_WEAPONS, false, "i", _i);
			        created = true;
			    }
			}
			if(!created && wLastPck < MAX_DROPPED_WEAPONS - 1)
			{
				wPickups[wLastPck][p_weapon_pckid] = CreatePickup(WeaponsPickup[_weapons[i][0]], 19, _x + (floatsin(-i * (20.0 * _amnt_weapons), degrees) * (_amnt_weapons / 2 + MIN_WEAPON_DROPPED_DISTANCE)), _y + (floatcos(-i * (20.0 * _amnt_weapons), degrees) * (_amnt_weapons / 2 + MIN_WEAPON_DROPPED_DISTANCE)), _z);
				wPickups[wLastPck][p_weapon_id] = _weapons[i][0];
    			wPickups[wLastPck][p_weapon_ammo] = _weapons[i][1];
       			wPickups[wLastPck][p_weapon_timer] = SetTimerEx("RemoveDroppedWeapon", TIME_DROPPED_WEAPONS, false, "i", wLastPck);
				wLastPck++;
			}
		}
	}
}

public RemoveDroppedWeapon(dropped_weapon_id)
{
	if(wPickups[dropped_weapon_id][p_weapon_pckid] == INVALID_DROPPED_WEAPON_ID) return ;
    DestroyPickup(wPickups[dropped_weapon_id][p_weapon_pckid]);
	KillTimer(wPickups[dropped_weapon_id][p_weapon_timer]);
	wPickups[dropped_weapon_id][p_weapon_pckid] = INVALID_DROPPED_WEAPON_ID;
	wPickups[dropped_weapon_id][p_weapon_id] = 0;
	wPickups[dropped_weapon_id][p_weapon_ammo] = 0;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    new _w = GetDroppedWeaponID(pickupid);
	if(_w != INVALID_DROPPED_WEAPON_ID)
	{
		GivePlayerWeapon(playerid, wPickups[_w][p_weapon_id], wPickups[_w][p_weapon_ammo]);
		RemoveDroppedWeapon(_w);
	}
}

stock compare(string_text1[], string_text2[])
{
	if(!strlen(string_text1) || !strlen(string_text2) || strlen(string_text1) != strlen(string_text2)) return false;
	for(new i = 0; i < strlen(string_text1); i++){
	    if(strcmp(string_text1[i], string_text2[i], true) != 0) return false;
	}
	return true;
}

stock RegisterPlayer(playerid, const password[])
{
    new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	if(!fexist(name))
	{
	    for(new i = 0; i < strlen(password); i++)
	    {
	        PlayerStats[playerid][pPassword][i] = password[i];
	    }
	    PlayerStats[playerid][pPassword][strlen(password)] = EOS;
	    PlayerStats[playerid][pBank] = 3000;
	    PlayerStats[playerid][pX] = -1757.9701;
	    PlayerStats[playerid][pY] = 960.9874;
	    PlayerStats[playerid][pZ] = 24.8828;
		PlayerStats[playerid][pAng] = 180.0;
		PlayerStats[playerid][pSkin] = 0;
		PlayerStats[playerid][pHealth] = 100.0;
		PlayerStats[playerid][pMoney] = 0;
		PlayerStats[playerid][pBusted] = 0;
		PlayerStats[playerid][pWanted] = 0;
		PlayerStats[playerid][pHabTerrain] = 0;
		PlayerStats[playerid][pHabNaut] = 0;
		PlayerStats[playerid][pHabAir] = 0;
	    Profissao[playerid] = 1;
	    Petrol[playerid] = 15;
	    SavePlayer(playerid);
	}
	else
	{
	    printf("Erro: Tentativa de registrar %s... Falhada! - Motivo: Jogador ja possui registro.", name);
	}
}

stock SavePlayer(playerid)
{
	if(IsPlayerConnected(playerid) && Login[playerid] == 1)
	{
		new name[MAX_PLAYER_NAME];
		GetPlayerName(playerid, name, MAX_PLAYER_NAME);
		new File:pfile = fopen(name, io_write), string[128];
		PlayerStats[playerid][pMoney] = GetPlayerMoney(playerid);
		GetPlayerHealth(playerid, PlayerStats[playerid][pHealth]);
		format(string, sizeof string, "Password=%s\r\n", PlayerStats[playerid][pPassword]);
		fwrite(pfile, string);
		format(string, sizeof string, "Job=%d\r\n", PlayerStats[playerid][pJob]);
		fwrite(pfile, string);
		format(string, sizeof string, "Money=%d\r\n", PlayerStats[playerid][pMoney]);
		fwrite(pfile, string);
		format(string, sizeof string, "Busted=%d\r\n", PlayerStats[playerid][pBusted]);
		fwrite(pfile, string);
		format(string, sizeof string, "Bank=%d\r\n", PlayerStats[playerid][pBank]);
		fwrite(pfile, string);
		format(string, sizeof string, "Gas=%d\r\n", PlayerStats[playerid][pGas]);
		fwrite(pfile, string);
		format(string, sizeof string, "Skin=%d\r\n", PlayerStats[playerid][pSkin]);
		fwrite(pfile, string);
		format(string, sizeof string, "Wanted=%d\r\n", PlayerStats[playerid][pWanted]);
		fwrite(pfile, string);
		format(string, sizeof string, "HabTerrain=%d\r\n", PlayerStats[playerid][pHabTerrain]);
		fwrite(pfile, string);
		format(string, sizeof string, "HabNaut=%d\r\n", PlayerStats[playerid][pHabNaut]);
		fwrite(pfile, string);
		format(string, sizeof string, "HabAir=%d\r\n", PlayerStats[playerid][pHabAir]);
		fwrite(pfile, string);
		format(string, sizeof string, "X=%f\r\n", PlayerStats[playerid][pX]);
		fwrite(pfile, string);
		format(string, sizeof string, "Y=%f\r\n", PlayerStats[playerid][pY]);
		fwrite(pfile, string);
		format(string, sizeof string, "Z=%f\r\n", PlayerStats[playerid][pZ]);
		fwrite(pfile, string);
		format(string, sizeof string, "Ang=%f\r\n", PlayerStats[playerid][pAng]);
		fwrite(pfile, string);
		format(string, sizeof string, "Health=%.2f\r\n", PlayerStats[playerid][pHealth]);
		fwrite(pfile, string);
		fclose(pfile);
	}
}

stock LoadPlayer(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	new File:pfile = fopen(name, io_read), tmp[128];
	while(fread(pfile, tmp, sizeof tmp))
	{
	    new key[15], value[50];
		strmid(key, tmp, 0, strfind(tmp, "=", true));
		strmid(value, tmp, strfind(tmp, "=", true) + 1, strfind(tmp, "\r", true));
		if(!strlen(key)) break;
		if(strcmp(key, "Password", true) == 0)
		{
			for(new i = 0; i < strlen(value); i++)
			{
			    PlayerStats[playerid][pPassword][i] = value[i];
			}
			PlayerStats[playerid][pPassword][strlen(value)] = EOS;
		}
		if(strcmp(key, "Job", true) == 0)
		{
		    PlayerStats[playerid][pJob] = strval(value);
		}
		if(strcmp(key, "Money", true) == 0)
		{
		    PlayerStats[playerid][pMoney] = strval(value);
		}
		if(strcmp(key, "Busted", true) == 0)
		{
		    PlayerStats[playerid][pBusted] = strval(value);
		}
		if(strcmp(key, "Bank", true) == 0)
		{
		    PlayerStats[playerid][pBank] = strval(value);
		}
		if(strcmp(key, "Gas", true) == 0)
		{
		    PlayerStats[playerid][pGas] = strval(value);
		}
		if(strcmp(key, "Skin", true) == 0)
		{
		    PlayerStats[playerid][pSkin] = strval(value);
		}
		if(strcmp(key, "Wanted", true) == 0)
		{
		    PlayerStats[playerid][pWanted] = strval(value);
		}
		if(strcmp(key, "HabTerrain", true) == 0)
		{
		    PlayerStats[playerid][pHabTerrain] = strval(value);
		}
		if(strcmp(key, "HabNaut", true) == 0)
		{
		    PlayerStats[playerid][pHabNaut] = strval(value);
		}
		if(strcmp(key, "HabAir", true) == 0)
		{
		    PlayerStats[playerid][pHabAir] = strval(value);
		}
		if(strcmp(key, "X", true) == 0)
		{
		    PlayerStats[playerid][pX] = floatstr(value);
		}
		if(strcmp(key, "Y", true) == 0)
		{
		    PlayerStats[playerid][pY] = floatstr(value);
		}
		if(strcmp(key, "Z", true) == 0)
		{
		    PlayerStats[playerid][pZ] = floatstr(value);
		}
		if(strcmp(key, "Ang", true) == 0)
		{
		    PlayerStats[playerid][pAng] = floatstr(value);
		}
		if(strcmp(key, "Health", true) == 0)
		{
		    PlayerStats[playerid][pHealth] = floatstr(value);
		}
	}
	fclose(pfile);
}

stock ExtractFileValue(filename[], const key[])
{
	if(!fexist(filename))
	{
	    new tmp[128];
	    tmp[0] = EOS;
		return tmp;
	}
	new File:fp = fopen(filename, io_read), tmp[128], res[128];
	while(fread(fp, tmp, sizeof tmp))
	{
	    new f_key[15];
	    strmid(f_key, tmp, 0, strfind(tmp, "=", true));
	    if(strcmp(f_key, key, true) == 0)
	    {
			strmid(res, tmp, strfind(tmp, "=", true) + 1, strfind(tmp, "\r", true));
	    }
	}
	return res;
}

public PutVehicleInPos(vehicleid, Float:x, Float:y, Float:z, Float:ang)
{
	SetVehiclePos(vehicleid, x, y, z);
	SetVehicleZAngle(vehicleid, ang);
}

public ApplyPlayerInVehicle(playerid, vehicleid, seatid)
{
	PutPlayerInVehicle(playerid, vehicleid, seatid);
}

public SaveAccounts()
{
	for(new i = 0; i < MAX_SLOTS; i++)
	{
	    if(IsPlayerConnected(i) && Login[i] == 1)
	    {
	        SavePlayer(i);
	    }
	}
}

public OnGameModeInit()
{
	SetGameModeText("Hard Life RPG");
	
	AddPlayerClass(0, -1958.5107, 293.6747, 35.4688, 269.1425, 0, 0, 0, 0, 0, 0);
 	AddStaticVehicle(596,-1588.2479,748.0393,-5.4903,359.9998,0,1 ); // carcop
	AddStaticVehicle(523,-1584.0217,749.4910,-5.6655,180.9966,0,0); // carcop
	AddStaticVehicle(523,-1579.8461,749.0732,-5.6571,181.8757,0,0); // car cop
	AddStaticVehicle(596,-1574.2565,742.4983,-5.5206,88.9996,0,1); // carcop
	AddStaticVehicle(523,-1573.5985,734.6492,-5.6689,90.0025,0,0); // carcop
	AddStaticVehicle(497,-1679.5951,706.1432,30.7954,90.5114,0,1); // helicop
	AddStaticVehicle(437,-1988.5007,162.0946,27.6508,0.0000,1,1); // busao
	AddStaticVehicle(437,-1988.3359,131.3477,27.6943,0.0000,1,1); // busao
	AddStaticVehicle(410,-2089.6643,-83.5934,34.7976,359.9729,6,6); // carroescola
	AddStaticVehicle(410,-2081.2825,-83.4888,34.8086,4.0901,6,6); // carroescola
	AddStaticVehicle(461,-2022.3977,-124.3720,34.7832,179.9717,6,6); // motoescola
	AddStaticVehicle(487,-2032.2460,-155.6209,35.4656,0.0060,1,6); // heliesc
	AddStaticVehicle(475,-2088.8313,-156.0123,35.0983,359.9812,6,6); // carroesc
	AddStaticVehicle(475,-2092.4036,-145.2734,35.0986,0.0400,6,6); // carroesc
	AddStaticVehicle(475,-2092.3503,-132.4997,35.0966,0.4676,6,6); // carroesc
	AddStaticVehicle(487,-1829.1174,1300.2819,59.8817,204.0558,54,29); // mavmoto
	AddStaticVehicle(453,-1556.1755,1260.8345,-0.5926,234.7669,69,69); // barco pesca
	AddStaticVehicle(453,-1565.1833,1259.7523,-0.5379,227.8785,69,69); // barco pesca
	AddStaticVehicle(453,-1578.2352,1260.0367,-0.0551,228.0564,69,69); // barco pesca
	AddStaticVehicle(493,-1474.4727,687.5856,-0.2037,268.8839,6,6); // barco escola
	AddStaticVehicle(453,-1473.3943,703.5046,-0.4342,272.7462,6,6); // barco escola
	AddStaticVehicle(420,-1703.0906,1003.9794,17.3778,91.1514,6,1); // taxi
	AddStaticVehicle(420,-1687.7856,999.6074,17.3444,270.7191,6,1); // taxi
	AddStaticVehicle(409,-1816.4678,1311.4034,50.2892,275.5558,1,1); // limomoto
	AddStaticVehicle(409,-1829.7208,1289.6337,50.2512,110.5457,1,1); // limomoto
	AddStaticVehicle(433,-1307.1633,456.9036,7.5909,89.9428,0,0); // caminhao
	AddStaticVehicle(433,-1306.5189,463.9994,7.6436,89.6543,0,0); // caminhao
	AddStaticVehicle(433,-1306.5568,460.6202,7.6451,90.4466,0,0); // caminhao
	AddStaticVehicle(433,-1309.4952,444.8434,7.6132,55.0000,0,0); // caminhao
	AddStaticVehicle(433,-1307.2222,447.7583,7.5937,54.9896,0,0); // caminhao
	AddStaticVehicle(470,-1241.5155,445.2168,7.1593,326.9936,44,44); // carro
	AddStaticVehicle(470,-1232.7764,451.6962,7.1680,89.9980,0,0); // carro
	AddStaticVehicle(425,-1403.2001,465.2320,7.7642,181.0000,0,0); // hunter
	AddStaticVehicle(425,308.9300,1990.3328,18.2170,180.0703,0,0); // hunter
	AddStaticVehicle(425,309.5915,2056.1018,18.1976,180.0104,0,0); // hunter
	
	// Acessórios
	CreateObject(2754,-1973.910156,116.928040,27.589643,0,0,270); // maquina banco
    CreateObject(2754,-2447.650391,522.882629,30.269331,0,0,180); // maquina banco
    CreateObject(2754,-1746.611572,963.392334,24.784956,0,0,90); // maquina banco
    CreateObject(2754,-180.600586,1135.615234,19.644331,0,0,0); // maquina banco
	// Fim Acessórios
	
	new File:temp;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	temp = fopen("rcars.ini", io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid    = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		ang        = Float:floatstr(strtok(tmp, index));
		Cor1       = strval(strtok(tmp, index));
		Cor2       = strval(strtok(tmp, index));

		AddStaticVehicle(modelid, X, Y, Z, ang, Cor1, Cor2);
	}
	fclose(temp);

	SetTimer("Areas", 1000, true);
	SetTimer("Taxi", 5000, true);
	SetTimer("CheckFuel", 50000, true);
	SetTimer("TempoPrisao", 60000, true);
	SetTimer("Tempo", 60000, true);
	SetTimer("SaveAccounts", 300000, true);
	
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{

 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1003.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
	return 1;
}

public OnGameModeExit()
{
	for(new i=0; i<MAX_SLOTS; i++){
		if(IsPlayerConnected(i)){
			if(Login[i] == 1) {
				SavePlayer(i);
				printf("Os dados de %s (ID: %d) foram salvos com sucesso\n",PlayerName(i),i);
			}
	  	}
    }
    return 1;
}

public OnPlayerConnect(playerid)
{
	if(playerid >= MAX_SLOTS)
	{
	    SendClientMessage(playerid, COLOR_RED, "Não há mais vagas para o Hard Life RPG, o máximo de slots");
	    SendClientMessage(playerid, COLOR_RED, "definido pelo servidor é de " #MAX_SLOTS);
		Kick(playerid);
		return false;
	}
	new msg[256];
	format(msg,sizeof(msg), "%s entrou no servidor.",PlayerName(playerid));
	SendClientMessageToAll(0x00C7FFAA,msg);
	SendClientMessage(playerid, COLOR_BLUE, "Bem-vindo ao Hard Life RPG");
	SendClientMessage(playerid, COLOR_WHITE, "Novo no servidor? /ajuda");
	SendClientMessage(playerid, COLOR_WHITE, "Quais os comandos do RPG? /comandos");
	SendClientMessage(playerid, COLOR_WHITE, "Como jogar o RPG? /aprender");
	if(!fexist(PlayerName(playerid)))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Você não está registrado, faça registro com /registrar [senha]");
	}
	else
	{
    	format(msg,sizeof(msg),"Bem vindo novamente %s, digite /entrar [senha] para se logar.",PlayerName(playerid));
    	SendClientMessage(playerid, COLOR_YELLOW, msg);
	}
	Login[playerid] = 0;
	AreaBanco[playerid] = 0;
	AreaMercado[playerid] = 0;
	AreaPesca[playerid] = 0;
	AreaFazenda[playerid] = 0;
	SetPlayerColor(playerid, COLOR_GRAY);
	return false;
}

public OnPlayerDisconnect(playerid, reason)
{
	if (Login[playerid] == 1) {
		SavePlayer(playerid);
		new msg[128];
		if(reason == 0) format(msg,sizeof(msg), "%s caiu do servidor.",PlayerName(playerid));
	    else if(reason == 1) format(msg,sizeof(msg), "%s saiu do servidor.",PlayerName(playerid));
	    else format(msg,sizeof(msg), "%s foi chutado do servidor.",PlayerName(playerid));
	    SendClientMessageToAll(0x00C7FFAA,msg);
        Login[playerid] = 0;
	}
	return 0;
}

public OnPlayerSpawn(playerid)
{
    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid, 0);
	if(Login[playerid] == 0){
		SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		SetPlayerFacingAngle(playerid, 90.0000);
		TogglePlayerControllable(playerid, 0);
    	return 1;
	}
    if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COLOR_DESEMPREGADO);
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COLOR_TAXISTA);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COLOR_VENDEDOR);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COLOR_CORRETOR);
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COLOR_ASSASSINO);
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COLOR_BARMAN);
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COLOR_JUIZ);
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COLOR_SEGURANÇA);
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COLOR_MOTORISTA_PARTICULAR);
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COLOR_COP_CIVIL);
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COLOR_COP_RODOVIARIO);
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COLOR_COP_ELITE);
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COLOR_PESCADOR);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COLOR_INSTRUTOR);
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COLOR_MOTORISTA_ONIBUS);
	}
	else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COLOR_AGRICULTOR);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	    SetPlayerColor(playerid, COLOR_VENDEDOR_DE_ARMAS);
	}
	else if(Profissao[playerid] == MECANICO) {
	    SetPlayerColor(playerid, COLOR_MECANICO);
	}
	else if(Profissao[playerid] == TRAFICANTE) {
	    SetPlayerColor(playerid, COLOR_TRAFICANTE);
	}
	else if(Profissao[playerid] == ADVOGADO) {
	    SetPlayerColor(playerid, COLOR_ADVOGADO);
	}
	if(PlayerStats[playerid][pBusted] == 1){
        TogglePlayerControllable(playerid, 0);
		SetPlayerInterior(playerid, 6);
        SendClientMessage(playerid, COLOR_RED, "Você cometeu algum crime e por isso foi preso, você ficará 5 horas na cadeia.");
        SendClientMessage(playerid, COLOR_RED, "(Lembrete: Cada hora no jogo equivale a um minuto real).");
        SendClientMessage(playerid, COLOR_YELLOW, "Caso você queira sair da prisao mais cedo, você pode pagar a fiança (/fianca) por $1500,00 dólares.");
		return 1;
	}
	else{
	    TogglePlayerControllable(playerid, 1);
    	return 1;
	}
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SetSpawnInfo(playerid, 1, PlayerStats[playerid][pSkin], -2651.6501, 634.4510, 14.4531, 180.0000, 0, 0, 0, 0, 0, 0);
    SendClientMessage(playerid, COLOR_RED, "Você foi encontrado quase morto e foi levado ao Hospital. o valor do tratamento foi de $250,00 dólares.");
    PlayerStats[playerid][pBank] -= 250;

	if(PlayerStats[playerid][pWanted] == 1){
	    SetSpawnInfo(playerid, 1, PlayerStats[playerid][pSkin], 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
	    PlayerStats[playerid][pBusted] = 1;
	}
	if(killerid == INVALID_PLAYER_ID) {
        SendDeathMessage(INVALID_PLAYER_ID, playerid, reason);
        ResetPlayerMoney(playerid);
	}
	else{
		SendDeathMessage(killerid, playerid, reason);
		if (GetPlayerMoney(playerid) > 0)  {
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
		}
 	}
 	DropWeapons(playerid);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	printf("OnVehicleSpawn(%d)", vehicleid);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	printf("OnVehicleDeath(%d, %d)", vehicleid, killerid);
	return 1;
}

public OnPlayerText(playerid)
{
	printf("OnPlayerText(%d)", playerid);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[256], idx;

	cmd = strtok(cmdtext, idx);

	if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	// The command shouldn't work if an account with this
    	// nick already exists
    	if (fexist(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Você já esta registrado");
			return 1;
		}

		// The command shouldn't work if we already are authed
    	if (Login[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Você já está registrado!");
			return 1;
		}

    	// Did he forgot the password?
    	if (strlen(tmp) == 0) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /registrar [senha]");
			return 1;
		}

    	// We save the money to the accstate
    	else
		{
    	    Login[playerid] = 1;
    	    RegisterPlayer(playerid, tmp);
			SetPlayerColor(playerid, COLOR_DESEMPREGADO);
			SetSpawnInfo(playerid, 1, PlayerStats[playerid][pSkin], PlayerStats[playerid][pX], PlayerStats[playerid][pY], PlayerStats[playerid][pZ], PlayerStats[playerid][pAng], 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SendClientMessage(playerid, COLOR_GREEN, "Registrado e logado.");
			SendClientMessage(playerid, COLOR_GREEN, "Você tem $3000,00 dólares no banco e 15 litros de combustível para começar a viver.");
    		return 1;
		}
 	}

	if(strcmp(cmd, "/entrar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    // The command shouldn't work if an account with this
	    // nick does not exists
	    if (!fexist(PlayerName(playerid))) {
			SendClientMessage(playerid, COLOR_RED, "Você não está registrado.");
			return 1;
		}

		// The command shouldn't work if we already are authed
	    if (Login[playerid] == 1) {
			SendClientMessage(playerid, COLOR_RED, "Você já está logado.");
			return 1;
		}

	    // Did he forgot the password?
	    if (strlen(tmp) == 0) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /entrar [senha]");
			return 1;
		}
		
	    if (compare(ExtractFileValue(PlayerName(playerid), "Password"), tmp)) {
			Login[playerid] = 1;
			LogarPlayer(playerid);
			SendClientMessage(playerid, COLOR_GREEN, "Login efetuado, continue sua vida...");
			return 1;
		}
		else {
	       // Login was incorrect
			SendClientMessage(playerid, COLOR_RED, "SENHA INCORRETA!");
			return 1;
	    }

	}
//---------------------------- COMANDOS DE CORRETOR -------------------------//
	
    if(strcmp(cmd, "/casa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
            plid = strval(tmp);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /casa [id]");
			    return 1;
    		}
            if(IsPlayerConnected(plid)){
				GetPlayerPos(playerid, PlayerStats[plid][pX], PlayerStats[plid][pY], PlayerStats[plid][pZ]);
				GetPlayerFacingAngle(playerid, PlayerStats[plid][pAng]);
			   	SendClientMessage(playerid, COLOR_GREEN, "Casa salva");
			   	printf("%s acaba de setar uma casa para %s", PlayerName(playerid), PlayerName(plid));
    	       	return 1;
        	}
	        else{
   				SendClientMessage(playerid, COLOR_RED, "Você não tem permissão!");
	    		return 1;
		    }
	    }
    }

//--------------------------- FIM DOS COMANDOS DE CORRETOR --------------------//

//--------------------------- COMANDOS DE VENDEDOR DE VEICULOS ----------------//
    if(strcmp(cmd, "/setcar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, plid, cor1, cor2;

			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COLOR_RED, "Uso: /setcar [modelo] [id] [cor 1] [cor 2]");
				return 1;
			}
		    carid = strval(tmp);

			if(carid < 400 || carid > 611)
			{
			    SendClientMessage(playerid, COLOR_RED, "Modelo inexistente, informe um de 400 até 611.");
			    return 1;
			}
			
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /setcar [modelo] [id] [cor 1] [cor 2]");
				return 1;
			}
			plid = strval(tmp);

			if(!IsPlayerConnected(plid) || Login[plid] == 0)
			{
			    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
			    return 1;
			}
			
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /setcar [modelo] [id] [cor 1] [cor 2]");
				return 1;
			}
			cor1 = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /setcar [modelo] [id] [cor 1] [cor 2]");
				return 1;
			}
			cor2 = strval(tmp);

			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        new string[256];
			        new File:temp;
			        new Float:X, Float:Y, Float:Z, Float:ang;
					GetPlayerPos(playerid, X, Y, Z);
					GetVehicleZAngle(GetPlayerVehicleID(playerid), ang);
					format(string, sizeof(string), "%d %f %f %f %f %d %d // %s\r\n", carid, X, Y, Z, ang, cor1, cor2, PlayerName(plid));
					temp = fopen("rcars.ini", io_append);
                    fwrite(temp, string);
                    fclose(temp);
                    SetTimerEx("setcar",10000,false,"dffffdd",carid,X,Y,Z,ang,cor1,cor2);
                    SendClientMessage(playerid, COLOR_GREEN, "Carro salvo!");
					return 1;
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Você não está em nenhum veículo e assim e assim não pode setar um carro.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		}
		if(Profissao[playerid] != VENDEDOR_DE_CARROS){
			SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/venderskin", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "Uso: /venderskin [id] [skin]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /venderskin [id] [skin]");
				return 1;
			}
			skin = strval(tmp);
			if(skin==1 || skin==2 || skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==265 || skin==266 || skin==267 || skin==268 || skin==269 || skin==270 || skin==271 || skin==272 || skin==273 || skin==274 || skin>=289){
				SendClientMessage(playerid, COLOR_RED, "ID da skin inválido!");
				return 1;
			}
			if(IsPlayerConnected(plid))
			{
			    PlayerStats[plid][pSkin] = skin;
			    SetPlayerSkin(plid, skin);
				SendClientMessage(playerid, COLOR_GREEN, "Skin vendido.");
				SendClientMessage(plid, COLOR_GREEN, "Seu skin foi comprado!");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
			return 1;
		}
	}

//-------------------------- FIM DOS COMANDOS DE VENDEDOR DE VEICULOS --------//

//--------------------------- COMANDOS PARA TODOS OS PLAYERS -----------------//

    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Hard Life RPG");
        SendClientMessage(playerid, COLOR_YELLOW, "/comandos : ver os comandos do RPG");
        SendClientMessage(playerid, COLOR_YELLOW, "/registrar [senha] : registrar uma conta.");
        SendClientMessage(playerid, COLOR_YELLOW, "/entrar [senha] : entrar no jogo (você deve estar registrado)");
        SendClientMessage(playerid, COLOR_YELLOW, "/aprender : ver uma breve explicação sobre como jogar o RPG.");
        SendClientMessage(playerid, COLOR_YELLOW, "/creditos : ver os créditos do RPG.");
		return 1;
	}
	
	if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "Hard Life RPG");
		SendClientMessage(playerid, COLOR_WHITE, "Edição do gamemode: Michael e Rafael");
		SendClientMessage(playerid, COLOR_WHITE, "Base do gamemode (GT RPG): SolidNuts, TheHitman, Luigui e DaMNeD");
		return 1;
	}

	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "Hard Life RPG");
	    SendClientMessage(playerid, COLOR_WHITE, "Este servidor é um RPG, ou seja, simula como se fosse a vida real.");
	    SendClientMessage(playerid, COLOR_WHITE, "Nele você arranja um emprego para ganhar dinheiro para pode comprar sua casa, carros, etc.");
	    SendClientMessage(playerid, COLOR_WHITE, "Como na vida real, existem crimes, como roubo e morte, e neste mode a policia irá te prender caso você cometa algum crime.");
		SendClientMessage(playerid, COLOR_WHITE, "Você também só pode dirigir com habilitação (terrestre para carros e motos, naútica para barcos e a aérea para helicópteros e aviões).");
		SendClientMessage(playerid, COLOR_WHITE, "Caso a policia te pegue andando sem habilitação, você vai tomar uma multa e poderá até ser preso.");
		SendClientMessage(playerid, COLOR_WHITE, "Bom divertimento!");
		SendClientMessage(playerid, COLOR_GREEN, "Digite /ajuda ou /comandos para visualizar os comandos.");
		return 1;
	}
	
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COLOR_GREEN, "Comandos do RPG - Parte 1");
		SendClientMessage(playerid, COLOR_YELLOW, "/profs : Mostra as profissões do RPG.");
		SendClientMessage(playerid, COLOR_YELLOW, "/190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(playerid, COLOR_YELLOW, "/transferir [id] [quantidade] : Envia dinheiro a algum jogador.");
		SendClientMessage(playerid, COLOR_YELLOW, "/presos : Vê a lista de pessoas presas.");
		SendClientMessage(playerid, COLOR_YELLOW, "/trancar : Tranca seu carro.");
		SendClientMessage(playerid, COLOR_YELLOW, "/procurados : Vê a lista de procurados pela policia");
		SendClientMessage(playerid, COLOR_YELLOW, "/destrancar : Destranca seu carro.");
		SendClientMessage(playerid, COLOR_YELLOW, "/ci [id] : Mostra seus documentos.");
        SendClientMessage(playerid, COLOR_GREEN, "Para mais comandos, escreva /comandos2");
		return 1;
	}
	if(strcmp(cmd, "/comandos2", true) == 0) {
	    SendClientMessage(playerid, COLOR_GREEN, "Comandos do RPG - Parte 2");
		SendClientMessage(playerid, COLOR_YELLOW, "/pescar : Joga a rede pra pescar, você deve estar na área de pesca.");
		SendClientMessage(playerid, COLOR_YELLOW, "/venderpesca : Vende suas pescas.");
		SendClientMessage(playerid, COLOR_YELLOW, "/(s)ay [texto] : Manda mensagem para pessoas proximas a você.");
		SendClientMessage(playerid, COLOR_YELLOW, "/relogio : Mostra o horário em San Fierro.");
		SendClientMessage(playerid, COLOR_YELLOW, "/profissao : Comandos de sua profissão | /largararmas : Larga suas armas no chão.");
		SendClientMessage(playerid, COLOR_YELLOW, "/taxi [lugar] : Chama um taxi. | /banco : Comandos do Banco.");
		SendClientMessage(playerid, COLOR_YELLOW, "/abastecer [litros] : Compra gasolina (você deve estar no posto para usar este comando).");
		SendClientMessage(playerid, COLOR_YELLOW, "/pagar [id] [quantidade] : Paga por algum serviço de corretor ou vendedor de veículos.");
		SendClientMessage(playerid, COLOR_GREEN, "Esses são os comandos do RPG.");
		return 1;
	}
	
	if(strcmp(cmd, "/banco", true) == 0) {
        SendClientMessage(playerid, COLOR_GREEN, "Comandos do Banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/depositar [quantia] : deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COLOR_YELLOW, "/extrato : checa seu saldo bancário");
        SendClientMessage(playerid, COLOR_YELLOW, "Bancos disponíveis: Hotel, San Fierro Train Station e SA Federal Mint.");
		return 1;
	}

	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COLOR_WHITE, "Profissões disponíveis no Hard Life RPG");
        SendClientMessage(playerid, COLOR_DESEMPREGADO, "1 - Desempregado (Salário: $100,00 dólares)");
        SendClientMessage(playerid, COLOR_TAXISTA, "2 - Taxista (Salário: $700,00 dólares)");
        SendClientMessage(playerid, COLOR_BARMAN, "3 - Barman (Salário: $600,00 dólares + as bebidas que vender)");
        SendClientMessage(playerid, COLOR_SEGURANÇA, "4 - Segurança (Salário: $800,00 dólares + o que o patrão pagar)");
        SendClientMessage(playerid, COLOR_MOTORISTA_PARTICULAR, "5 - Motorista Particular (Salário: $850,00 dólares + o que o patrão pagar)");
		SendClientMessage(playerid, COLOR_AGRICULTOR, "6 - Agricultor (Salário: $400,00 dólares + o que ganhar na venda de plantações)");
        SendClientMessage(playerid, COLOR_PESCADOR, "7 - Pescador (Salário: $500,00 dólares + o que ganha na pesca)");
        SendClientMessage(playerid, COLOR_MOTORISTA_ONIBUS, "8 - Motorista de ônibus (Salário: $700,00 dólares)");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /profs2 para ver mais profissões");
        return 1;
    }
    
    if(strcmp(cmd, "/profs2", true) == 0) {
        SendClientMessage(playerid, COLOR_WHITE, "Profissões disponíveis no Hard Life RPG : Parte 2");
		SendClientMessage(playerid, COLOR_VENDEDOR_DE_ARMAS, "9 - Vendedor de armas (Salário: $700,00 dólares + os 10%% das armas)");
		SendClientMessage(playerid, COLOR_MECANICO, "10 - Mecânico (Salário: $600,00 dólares + o que ganhar na reparação dos veículos)");
        SendClientMessage(playerid, COLOR_WHITE, "Para ver as profissões limitadas digite /profslimitadas");
		return 1;
	}
	
	if(strcmp(cmd, "/profslimitadas", true) == 0) {
	    SendClientMessage(playerid, COLOR_WHITE, "Profissões limitadas disponíveis no Hard Life RPG");
    	SendClientMessage(playerid, COLOR_VENDEDOR, "11 - Vendedor de veículos (Salário: $200,00 dólares + os veículos que vender)");
        SendClientMessage(playerid, COLOR_CORRETOR, "12 - Corretor de imóveis (Salário: $200,00 dólares + as casas que vender)");
        SendClientMessage(playerid, COLOR_ASSASSINO, "13 - Assassino (Salário: O dinheiro de quem matar)");
        SendClientMessage(playerid, COLOR_COP_CIVIL, "14 - Policial Civil (Salário: $800,00 dólares)");
        SendClientMessage(playerid, COLOR_COP_RODOVIARIO, "15 - Policial Rodoviário (Salário: $1000,00 dólares)");
        SendClientMessage(playerid, COLOR_COP_ELITE, "16 - Policial Elite/SWAT (Salário: $3000,00 dólares)");
        SendClientMessage(playerid, COLOR_JUIZ, "17 - Juiz (Salário: $2000,00 dólares)");
        SendClientMessage(playerid, COLOR_INSTRUTOR, "18 - Instrutor de direção (Salário: $600,00 dólares + as habilitações que vender)");
        SendClientMessage(playerid, COLOR_WHITE, "Digite /profslimitadas2 para ver mais profissões limitadas");
        return 1;
	 }
	 
 	if(strcmp(cmd, "/profslimitadas2", true) == 0) {
 	    SendClientMessage(playerid, COLOR_WHITE, "Profissões limitadas disponíveis no Hard Life RPG : Parte 2");
	    SendClientMessage(playerid, COLOR_TRAFICANTE, "19 - Traficante (Salário: $800,00 dólares + o dinheiro das drogas)");
	    SendClientMessage(playerid, COLOR_ADVOGADO, "20 - Advogado (Salário: $1000,00 dólares + honorários)");
	    SendClientMessage(playerid, COLOR_WHITE, "Essas são as profissões limitadas do Hard Life RPG.");
	    return 1;
	}
	
	if (strcmp(cmd, "/taxi", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /taxi [local]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_YELLOW, "Os taxistas foram informados");
		    for(new i=0; i<MAX_SLOTS; i++){
		        if(Profissao[i] == TAXISTA){
					format(string, sizeof(string), "%s pede um taxi. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_YELLOW, string);
		        }
			}
			return 1;
		}
	}
	
	if (strcmp(cmd, "/190", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /190 [denuncia]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_COP_ELITE, "Os policiais foram informados");
		    for(new i=0; i<MAX_SLOTS; i++){
		        if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}

    if(strcmp(cmd, "/largararmas", true) == 0)
	{
	    DropWeapons(playerid);
	    return 1;
	}
	
	if (strcmp(cmdtext, "/trancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_SLOTS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid), i, 0, 1);
				}
			}
			SendClientMessage(playerid, COLOR_GREEN, "Veículo Trancado");
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo nenhum veiculo!");
			return 1;
		}
	}

	if (strcmp(cmdtext, "/destrancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_SLOTS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid), i, 0, 0);
				}
			}
			SendClientMessage(playerid, COLOR_GREEN, "Veículo Destrancado");
		}
		else{
			SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo nenhum veiculo!");
			return 1;
		}
	}

	if(strcmp(cmd, "/transferir", true) == 0)
	{
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id-do-jogador] [quantidade]");
			return 1;
		}
		new giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /transferir [id-do-jogador] [quantidade]");
			return 1;
		}
 		new moneys = strval(tmp);
		if (IsPlayerConnected(giveplayerid)) {
		    new string[256];
		    new giveplayer[MAX_PLAYER_NAME], sendername[MAX_PLAYER_NAME];
			GetPlayerName(giveplayerid, giveplayer, MAX_PLAYER_NAME);
			GetPlayerName(playerid, sendername, MAX_PLAYER_NAME);
			if (moneys > 0 && GetPlayerMoney(playerid) >= moneys) {
				GivePlayerMoney(playerid, (0 - moneys));
				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "Você enviou para %s (id: %d), $%d,00 dólares.", giveplayer, giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "Você recebeu $%d,00 dólares de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			}
			else {
				SendClientMessage(playerid, COLOR_RED, "Você não possui essa quantia em mãos.");
			}
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		}
		return 1;
	}

    if(strcmp(cmd, "/depositar", true) == 0) {
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_WHITE, "Uso: /depositar [quantidade]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COLOR_RED, "Você não tem todo esse dinheiro. Ou está tentando enviar $0,00 dólares.");
			return 1;
		}
	    if(AreaBanco[playerid] == 1){
	        GivePlayerMoney(playerid, -quantidade);
	        PlayerStats[playerid][pBank] += quantidade;
			new string[256];
			format(string, sizeof string, "Você depositou $%d,00 dólares no banco, saldo atual: $%d,00 dólares", quantidade, PlayerStats[playerid][pBank]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, San Fierro Train Station, San Andreas Federal Mint.");
			return 1;
		}
	}
	
    if(strcmp(cmd, "/sacar", true) == 0) {
        new string[256];
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_WHITE, "Uso: /sacar [quantidade]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COLOR_RED, "Você não pode querer depositar com esse comando");
			return 1;
		}
		if(quantidade > PlayerStats[playerid][pBank]){
		    SendClientMessage(playerid, COLOR_RED, "Você não tem essa quantidade no banco");
			return 1;
		}
	    if(AreaBanco[playerid] == 1)
		{
	        GivePlayerMoney(playerid, quantidade);
	        PlayerStats[playerid][pBank] -= quantidade;
			format(string, sizeof(string), "Você retirou $%d,00 dólares do banco. seu saldo atual é de $%d,00 dólares", quantidade, PlayerStats[playerid][pBank]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, San Fierro Train Station, San Andreas Federal Mint.");
			return 1;
		}
	}

    if(strcmp(cmd, "/extrato", true) == 0) {
		new string[256];
        if(AreaBanco[playerid] == 1){
			format(string, sizeof(string), "Você possui $%d,00 dólares em sua conta", PlayerStats[playerid][pBank]);
			SendClientMessage(playerid, COLOR_GREEN, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COLOR_YELLOW, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COLOR_YELLOW, "Bancos: Hotel, Car's Shop, San Fierro Train Station, San Andreas Federal Mint.");
			return 1;
		}
	}

    if(strcmp(cmd, "/abastecer", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "Uso: /abastecer [litros]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || GetPlayerMoney(playerid) < quantidade){
	        SendClientMessage(playerid, COLOR_RED, "Você não tem dinheiro para pagar. Ou você está querendo tirar gasolina do carro.");
			return 1;
		}
		if(AreaPosto[playerid] == 1){
			if(quantidade + Petrol[playerid] < 100){
		    	Petrol[playerid] = quantidade;
		    	format(string, sizeof(string), "Você comprou %d litros de gasolina", quantidade);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantidade);
				return 1;
			}
			if(quantidade + Petrol[playerid] >= 100){
		    	new quantia;
		    	quantia = 100 - Petrol[playerid];
		    	Petrol[playerid] = 100;
				format(string, sizeof(string), "seu tanque ficou completo. só colocamos %d litros.", quantia);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantia);
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Você não está no Posto!");
		    return 1;
		}
	}

	if(strcmp(cmd, "/pagar", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /pagar [id] [quantidade]");
			return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /pagar [id] [quantidade]");
			return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == VENDEDOR_DE_CARROS || Profissao[plid] == CORRETOR){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COLOR_RED, "Você não tem esse dinheiro! ou não está querendo pagar de forma justa.");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/10);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COLOR_GREEN, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COLOR_GREEN, string);
				return 1;
			}
			else{
				SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
				return 1;
			}
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COLOR_RED, "Você está tentando pagaer a alguem que não é coretoe e nem vendedor!");
			return 1;
		}
	}

	if(strcmp(cmd, "/ci", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[3];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /ci [id]");
			return 1;
		}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
		    hab[0] = PlayerStats[playerid][pHabTerrain];
		    hab[1] = PlayerStats[playerid][pHabNaut];
		    hab[2] = PlayerStats[playerid][pHabAir];
			format(string, sizeof(string), "Identidade de: %s", PlayerName(playerid));
			SendClientMessage(plid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Skin: %d", PlayerStats[playerid][pSkin]);
			SendClientMessage(plid, COLOR_YELLOW, string);
			if(hab[0] == 0){
			    SendClientMessage(plid, COLOR_RED, "Habilitação de Carros e Motos: NÃO");
			}
			if(hab[0] == 1){
			    SendClientMessage(plid, COLOR_COP_ELITE, "Habilitação de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(plid, COLOR_RED, "Habilitação Náutica: NÃO");
			}
			if(hab[1] == 1){
			    SendClientMessage(plid, COLOR_COP_ELITE, "Habilitação Náutica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(plid, COLOR_RED, "Habilitação Aérea: NÃO");
			}
			if(hab[2] == 1){
			    SendClientMessage(plid, COLOR_COP_ELITE, "Habilitação Aérea: SIM");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado");
		}
		return 1;
	}
	
    if(strcmp(cmd, "/fianca", true) == 0) {
		PlayerStats[playerid][pBusted] = 0;
		LogarPlayer(playerid);
		SendClientMessage(playerid, COLOR_GREEN, "Você pagou a fiança no valor de $1500,00 dólares e foi solto.");
		PlayerStats[playerid][pBank] -= 1500;
		return 1;
	}
	
	if (strcmp(cmd, "/pt", true)==0){
		new tmp[256];
		new string[153];
	    strmid(tmp, cmdtext, 3, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /pt [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_SLOTS; i++){
		        if(Profissao[i] == Profissao[playerid]){
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, GetPlayerColor(playerid), string);
					SendClientMessage(playerid, GetPlayerColor(playerid), string);
					return 1;
				}
			}
		}
	}
	
	if (strcmp(cmdtext, "/presos", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_WHITE, "Lista de presos:");
	    for(new i=0; i<MAX_SLOTS; i++){
	        if(PlayerStats[i][pBusted] == 1){
				format(string, sizeof(string), "ID: %d - Nome: %s", i, PlayerName(i));
				SendClientMessage(i, COLOR_YELLOW, string);
				return 1;
			}
		}
	}

	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COLOR_WHITE, "Lista de procurados");
	    for(new i=0; i<MAX_SLOTS; i++){
	        if(PlayerStats[i][pWanted] == 1){
				format(string, sizeof(string), "ID: %d - Nome: %s", i, PlayerName(i));
				SendClientMessage(i, COLOR_YELLOW, string);
				return 1;
			}
		}
	}

	if (strcmp(cmd, "/say", true) == 0 || strcmp(cmd, "/s", true) == 0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /(s)ay [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_SLOTS; i++){
		        if(GetDistanceBetweenPlayers(playerid, i) < 10){
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COLOR_GRAY, string);
					SendClientMessage(playerid, COLOR_GRAY, string);
					return 1;
				}
			}
		}
	}
	
	if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "São %d:00 horas na região de San Fierro", GameTime);
		SendClientMessage(playerid, COLOR_GREEN, string);
		return 1;
	}
	
//------------------------- FIM DOS COMANDOS PARA TODOS OS PLAYERS -----------//

//------------------------- COMANDOS DE INSTRUTOR ----------------------------//

	if(strcmp(cmd, "/aerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /aerea [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
				PlayerStats[plid][pHabAir] = 1;
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção aerea concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção aerea.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
			return 1;
		}
	}


	if(strcmp(cmd, "/terrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Uso: /terrestre [id]");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    PlayerStats[plid][pHabTerrain] = 1;
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção terrestre concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção de carros e motos.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
			return 1;
		}
	}

	if(strcmp(cmd, "/nautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_GREEN, "Uso: /nautica [id]");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    PlayerStats[plid][pHabNaut] = 1;
			    SendClientMessage(playerid, COLOR_GREEN, "Habilitação de direção náutica concedida.");
			    SendClientMessage(plid, COLOR_GREEN, "Você recebeu a habilitação de direção náutica.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
			return 1;
		}
	}

//------------------------- FIM DOS COMANDOS DE INSTRUTOR --------------------//

//------------------------- COMANDOS DE PESCADOR -----------------------------//

	if(strcmp(cmd, "/pescar", true) == 0) {
		if(AreaPesca[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está na área de pesca!");
		    return 1;
		}
		if(Pescando[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "Espere a rede voltar para poder pescar mais...");
		    return 1;
		}
		else{
		    Pescando[playerid] = 1;
		    TogglePlayerControllable(playerid,0);
		    SendClientMessage(playerid, COLOR_GREEN, "Você jogou a rede para pescar!");
		    SendClientMessage(playerid, COLOR_GREEN, "Agora aguarde o peixe morder a isca...");
		    SetTimerEx("Pesca",20000,false,"d",playerid);
		    return 1;
		}
	}
	if(strcmp(cmd, "/venderpesca", true) == 0) {
	    new str[200];
	    if(AreaMercado[playerid] == 0){
	        SendClientMessage(playerid, COLOR_RED, "Você não está no mercado!");
	        return 1;
		}
		if(Pescado[playerid] < 1){
		    SendClientMessage(playerid, COLOR_RED, "Você não possui nenhuma pesca, como poderá vender?");
		    return 1;
		}
		else{
			if(Profissao[playerid] == PESCADOR || IsPlayerAdmin(playerid)){
			    GivePlayerMoney(playerid,Pescado[playerid]*70);
				format(str,sizeof(str),"Você vendeu sua pesca e faturou $%d,00 dólares com a venda!",Pescado[playerid]*70);
				SendClientMessage(playerid, COLOR_GREEN, str);
				Pescado[playerid] = 0;
				return 1;
			}
			else if(Profissao[playerid] != PESCADOR && !IsPlayerAdmin(playerid)){
                GivePlayerMoney(playerid,Pescado[playerid]*30);
				format(str,sizeof(str),"Você vendeu sua pesca e faturou $%d,00 dólares com a venda!",Pescado[playerid]*30);
				SendClientMessage(playerid, COLOR_GREEN, str);
				Pescado[playerid] = 0;
				return 1;
			}
	    }
   }
   
//------------------------- FIM DOS COMANDOS DE PESCADOR ---------------------//

//------------------------- COMANDOS DE AGRICULTOR ---------------------------//

    if(strcmp(cmd, "/plantar", true) == 0) {
        if(Profissao[playerid] != AGRICULTOR && !IsPlayerAdmin(playerid)){
            SendClientMessage(playerid, COLOR_RED, "Você não pode usar esse comando!");
            return 1;
		}
		if(AreaFazenda[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está na fazenda!");
		    return 1;
		}
		if(Plantando[playerid] == 1){
		    SendClientMessage(playerid, COLOR_RED, "Espere a colheita para plantar novamente!");
		    return 1;
		}
		else{
		    Plantando[playerid] = 1;
		    SendClientMessage(playerid, COLOR_GREEN, "Pronto... Você iniciou uma plantação!");
		    SendClientMessage(playerid, COLOR_GREEN, "Agora espere o encasamento e a colheita para poder vender.");
		    SetTimerEx("Colheita",20000,false,"d",playerid);
		    return 1;
		}
	}
	
	if(strcmp(cmd, "/colher", true) == 0) {
	    if(Profissao[playerid] != AGRICULTOR && !IsPlayerAdmin(playerid)){
            SendClientMessage(playerid, COLOR_RED, "Você não pode usar esse comando!");
            return 1;
		}
	    if(Plantacao[playerid] < 1){
			SendClientMessage(playerid, COLOR_RED, "Você não possui nada para colher!");
			return 1;
		}
		if(AreaFazenda[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está na fazenda!");
		    return 1;
		}
		else{
			Verduras[playerid] = Plantacao[playerid];
			Plantacao[playerid] = 0;
			new str[200];
			format(str,sizeof(str),"Você colheu %d verdura(s)! Agora pode ir no mercado para vende-la(s).");
			SendClientMessage(playerid, COLOR_YELLOW, str);
			return 1;
		}
	}
	
	if(strcmp(cmd, "/venderplantacoes", true) == 0) {
	    if(Verduras[playerid] < 1){
	        SendClientMessage(playerid, COLOR_RED, "Você não possui nenhuma verdura para vender.");
	        return 1;
		}
		if(AreaMercado[playerid] == 0){
		    SendClientMessage(playerid, COLOR_RED, "Você não está no mercado!");
		    return 1;
		}
		else{
		    GivePlayerMoney(playerid,Verduras[playerid]*50);
			new str[200];
			format(str,sizeof(str),"Você vendeu %d verduras e recebeu $%d,00 dólares",Verduras[playerid],Verduras[playerid]*50);
			SendClientMessage(playerid, COLOR_YELLOW, str);
			Verduras[playerid] = 0;
			return 1;
		}
	}
	
//------------------------- FIM DOS COMANDOS DE AGRICULTOR -------------------//

//------------------------- COMANDOS DE POLICIAL -----------------------------//

	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new distancia;
	    	new string[256];
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /prender [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(IsPlayerConnected(plid) && Login[playerid] == 1){
				if(distancia <= 10){
				    PlayerStats[playerid][pBusted] = 1;
					SetSpawnInfo(plid, 1, PlayerStats[plid][pSkin], 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
					LogarPlayer(plid);
					format(string, sizeof(string), "Você foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COLOR_SEGURANÇA, string);
				    SendClientMessage(playerid, COLOR_GREEN, "Prisão concluida");
					return 1;
				}
			}
			else{
    	        SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}

    

	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /soltar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && Login[playerid] == 1){
			    PlayerStats[playerid][pBusted] = 0;
			    LogarPlayer(playerid);
			    SendClientMessage(plid, COLOR_GREEN, "Algum juiz te soltou.");
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
    if (strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[200];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /procurar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && Login[playerid] == 1){
				PlayerStats[plid][pWanted] = 1;
				SendClientMessage(playerid, COLOR_GREEN, "Mais um para você perseguir agora.");
				format(string, sizeof(string), "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}

	if (strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /desprocurar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && Login[playerid] == 1){
				PlayerStats[plid][pWanted] = 0;
				SendClientMessage(playerid, COLOR_GREEN, "Excluido da lista com suscesso.");
				SendClientMessage(plid, COLOR_GREEN, "Você foi retirado da lista de procurados");
				return 1;
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}

	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new quant;
	    	new string[200];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /multar [id] [quantidade]");
				return 1;
			}
        	plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /multar [id] [quantidade]");
				return 1;
			}
        	quant = strval(tmp);
 			if(quant > 1000 || quant <= 0){
				SendClientMessage(playerid, COLOR_RED, "Você não está querendo multar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", quant, PlayerName(playerid));
				SendClientMessage(plid, COLOR_GREEN, string);
				SendClientMessage(playerid, COLOR_GREEN, "Multa dada.");
				PlayerStats[plid][pBank] -= quant;
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[200];
		    new plid;
			new distancia;
		    distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /bafometro [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && Login[playerid] == 1){
				if(distancia > 20){
			        SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(distancia <= 20){
					format(string, sizeof(string), "O bafômetro mostra: %d no sangue", Bebida[plid]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COLOR_RED, "Você não é policial");
			return 1;
		}
	}
//--------------------------- FIM DOS COMANDOS DE POLICIAL ------------------//

//--------------------------- COMANDOS DE ADMINISTRADORES -------------------//
	
	if(strcmp(cmd, "/setjob", true) == 0 && IsPlayerConnected(playerid) && IsPlayerAdmin(playerid)) {
	    new tmp[256];
	    new plid;
	    new prof;
	    new string[200];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /setjob [id] [prof]");
			return 1;
		}
        plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_RED, "Uso: /setjob [id] [prof]");
			return 1;
		}
        prof = strval(tmp);
        if(IsPlayerConnected(plid)){
            if(prof > 0 && prof < MAX_JOBS){
				format(string, sizeof(string), "Você mudou a profissão de %s para %d", PlayerName(plid), prof);
				SendClientMessage(playerid, COLOR_GREEN, string);
				SendClientMessage(plid, COLOR_GREEN, "Você mudou de profissão, digite /profissao.");
				Profissao[plid] = prof;
				if(prof == DESEMPREGADO) {
					SetPlayerColor(plid, COLOR_DESEMPREGADO);
					return 1;
				}
				else if(prof == TAXISTA) {
					SetPlayerColor(playerid, COLOR_TAXISTA);
					return 1;
				}
				else if(prof == VENDEDOR_DE_CARROS) {
					SetPlayerColor(plid, COLOR_VENDEDOR);
					return 1;
				}
				else if(prof == CORRETOR) {
					SetPlayerColor(plid, COLOR_CORRETOR);
					return 1;
				}
				else if(prof == ASSASSINO) {
					SetPlayerColor(plid, COLOR_ASSASSINO);
					return 1;
				}
				else if(prof == BARMAN) {
					SetPlayerColor(plid, COLOR_BARMAN);
					return 1;
				}
				else if(prof == JUIZ) {
					SetPlayerColor(plid, COLOR_JUIZ);
					return 1;
				}
				else if(prof == SEGURANÇA) {
					SetPlayerColor(plid, COLOR_SEGURANÇA);
					return 1;
				}
				else if(prof == MOTORISTA_PARTICULAR) {
					SetPlayerColor(plid, COLOR_MOTORISTA_PARTICULAR);
					return 1;
				}
				else if(prof == COP_CIVIL) {
					SetPlayerColor(plid, COLOR_COP_CIVIL);
					return 1;
				}
				else if(prof == COP_RODOVIARIO) {
					SetPlayerColor(plid, COLOR_COP_RODOVIARIO);
					return 1;
				}
				else if(prof == COP_ELITE) {
					SetPlayerColor(plid, COLOR_COP_ELITE);
					return 1;
				}
				else if(prof == PESCADOR) {
					SetPlayerColor(plid, COLOR_PESCADOR);
					return 1;
				}
				else if(prof == INSTRUTOR_DE_DIRECAO) {
					SetPlayerColor(plid, COLOR_INSTRUTOR);
					return 1;
				}
				else if(prof == MOTORISTA_DE_ONIBUS) {
					SetPlayerColor(plid, COLOR_MOTORISTA_ONIBUS);
					return 1;
				}
				else if(prof == AGRICULTOR) {
					SetPlayerColor(plid, COLOR_AGRICULTOR);
					return 1;
				}
				else if(prof == VENDEDOR_DE_ARMAS) {
					SetPlayerColor(plid, COLOR_VENDEDOR_DE_ARMAS);
					return 1;
				}
				else if(prof == MECANICO) {
					SetPlayerColor(plid, COLOR_MECANICO);
					return 1;
				}
				else if(prof == TRAFICANTE) {
					SetPlayerColor(plid, COLOR_TRAFICANTE);
					return 1;
				}
				else if(prof == ADVOGADO) {
					SetPlayerColor(plid, COLOR_ADVOGADO);
					return 1;
				}
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "Essa não é uma profisssão válida!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não está conectado/logado");
			return 1;
		}
	}
	
//--------------------------- FIM DOS COMANDOS DE ADMINISTRADORES ------------//
	
	
//------------------- COMANDO PARA VER OS COMANDOS DA SUA PROFISSAO ---------//

	if (strcmp(cmdtext, "/profissao", true)==0){
		if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Taxista");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/taximetro [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Vendedor de veículos");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/setcar [modelo] [id] [cor 1] [cor 2] : Vende um veículo (esteja com ele na posição onde começará).");
			SendClientMessage(playerid, COLOR_YELLOW, "/venderskin [id] [skin] : Vende um skin para alguma pessoa.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Corretor de imóveis");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/casa [id] : Vende uma casa para alguém (esteja no exterior da casa).");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Barman");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/bebida [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Juiz");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/soltar [id] : Solta uma pessoa da cadeia.");
		}
		else if(Profissao[playerid] == PESCADOR) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Pescador");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/pescar : Joga a rede para pescar, você tem que estar na área de pesca.");
			SendClientMessage(playerid, COLOR_YELLOW, "/venderpesca : Vende suas pescas, você tem que estar no mercado.");
		}
		else if(Profissao[playerid] == AGRICULTOR) {
		    SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Agricultor");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/plantar : Iniciar uma plantação, você tem que estar na fazenda.");
			SendClientMessage(playerid, COLOR_YELLOW, "/colher : Colher uma plantação, você tem que estar na fazenda.");
			SendClientMessage(playerid, COLOR_YELLOW, "/venderplantacoes : Vende suas plantações, você tem que estar no mercado.");
		}
		else if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Policial Civil/Rodoviário");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [valor] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Policial Elite/SWAT");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COLOR_YELLOW, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COLOR_YELLOW, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COLOR_YELLOW, "/multar [id] [valor] : Multar uma pessoa.");
		}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Instrutor de direção");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/aerea : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COLOR_YELLOW, "/terrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COLOR_YELLOW, "/nautica : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Vendedor de armas");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/arma [id] [id da arma] [municao] : Vende uma arma para um jogador.");
			SendClientMessage(playerid, COLOR_YELLOW, "/colete [id] : Vende um colete para um jogador.");
		}
		else if(Profissao[playerid] == MECANICO) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Mecânico");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_YELLOW, "/reparar : Repara um veículo (você deve estar o dirigindo).");
			SendClientMessage(playerid, COLOR_YELLOW, "/pintar [cor 1] [cor 2] : Pinta um veículo (você deve estar o dirigindo).");
		}
		else if(Profissao[playerid] == TRAFICANTE) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Traficante");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		}
		else if(Profissao[playerid] == ADVOGADO) {
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão - Advogado");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_GREEN, "Sua profissão não tem comandos especiais, seu objetivo somente é defender seus clientes perante a presença");
			SendClientMessage(playerid, COLOR_GREEN, "de um Juiz, e não se esqueça de cobrar pelos seus serviços.");
		}
		else{
			SendClientMessage(playerid, COLOR_GREEN, "Comandos de sua profissão");
			SendClientMessage(playerid, COLOR_YELLOW, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COLOR_GREEN, "Sua profissão não tem nenhum comando especial!");
		}
		return 1;
	}

//------------------- FIM DO COMANDO PARA VER OS COMANDOS DA SUA PROFISSAO ----//
	

//-------------------------- COMANDOS DE TAXISTA ------------------------------//

	if(strcmp(cmd, "/taximetro", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /taximetro [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COLOR_GREEN, "O taxímetro começou a rodar");
                SendClientMessage(plid, COLOR_GREEN, "O taxímetro começou a rodar");
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
				return 1;
			}
			else{
			    SendClientMessage(playerid, COLOR_RED, "O passageiro não está dentro do seu carro ou você não é o motorista.");
				return 1;
			}
		}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COLOR_RED, "Você não tem level o suficiente.");
			return 1;
		}
	}

//-------------------------- FIM DOS COMANDOS DE TAXISTA ---------------------//

	
//-------------------------- COMANDOS DE BARMAN ------------------------------//

    if(strcmp(cmd, "/bebida", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[200];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "Uso: /bebida [id] [teor de alcool]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_RED, "Uso: /bebida [id] [teor de alcool]");
				return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COLOR_RED, "Teor alcoolico invalido, Os teores devem ser entre 2 e 7.");
				return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Você bebeu um drink com teor alcoolico: %d", teor);
			            SendClientMessage(plid, COLOR_GREEN, string);
			            SendClientMessage(playerid, COLOR_GREEN, "Drink vendido e tomado.");
						return 1;
					}
					else{
					    SendClientMessage(playerid, COLOR_RED, "O jogador não está conectado!");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COLOR_RED, "Você está muito longe, chegue mais perto para entregar a bebida.");
					return 1;
				}
			}
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso");
			return 1;
		}
	}
	
//------------------------------ FIM DOS COMANDOS DE BARMAN ------------------//

//-------------------------- COMANDOS DE MECANICO ------------------------------//

    if(strcmp(cmd, "/reparar", true) == 0)
	{
	    if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid))
		{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso...");
		    return 1;
		}
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		{
		    SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo um veículo.");
		    return 1;
		}
		new vehid = GetPlayerVehicleID(playerid), Float:x, Float:y, Float:z, Float:ang;
		GetVehiclePos(vehid, x, y, z);
		GetVehicleZAngle(vehid, ang);
		SetTimerEx("PutVehicleInPos", 500, false, "dffff", vehid, x, y, z, ang);
		SetTimerEx("ApplyPlayerInVehicle", 1000, false, "ddd", playerid, vehid, 0);
		SendClientMessage(playerid, COLOR_GREEN, "Veículo consertado.");
		return 1;
	}
	
	if(strcmp(cmd, "/pintar", true) == 0)
	{
	    if(Profissao[playerid] != MECANICO && !IsPlayerAdmin(playerid))
		{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso...");
		    return 1;
		}
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		{
		    SendClientMessage(playerid, COLOR_RED, "Você não está dirigindo um veículo.");
		    return 1;
		}
		new tmp[128];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOR_RED, "Uso: /pintar [cor 1] [cor 2]");
		    return 1;
		}
		new color1 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOR_RED, "Uso: /pintar [cor 1] [cor 2]");
		    return 1;
		}
		new color2 = strval(tmp);
		ChangeVehicleColor(GetPlayerVehicleID(playerid), color1, color2);
		SendClientMessage(playerid, COLOR_GREEN, "Veículo pintado.");
		return 1;
	}
	
//------------------------------ FIM DOS COMANDOS DE MECANICO ------------------//

//-------------------------- COMANDOS DE TRAFICANTE ------------------------------//

//------------------------------ FIM DOS COMANDOS DE TRAFICANTE ------------------//

//-------------------------- COMANDOS DE VENDEDOR DE ARMAS ------------------------------//

	if(strcmp(cmd, "/arma", true) == 0)
	{
		if(Profissao[playerid] != VENDEDOR_DE_ARMAS && !IsPlayerAdmin(playerid))
		{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso...");
		    return 1;
		}
	    new tmp[256];
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_RED, "Uso: /arma [id] [id da arma] [municao]");
	        return 1;
	    }
	    new plid = strval(tmp);
	    if(!IsPlayerConnected(plid) || Login[plid] == 0)
	    {
	        SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
	        return 1;
	    }
	    else
	    {
	    	new Float:x[2], Float:y[2], Float:z[2];
			GetPlayerPos(playerid, x[0], y[0], z[0]);
			GetPlayerPos(plid, x[1], y[1], z[1]);
			if(floatpower(x[0] - x[1], 2) + floatpower(y[0] - y[1], 2) + floatpower(z[0] - z[1], 2) > 10)
			{
			    SendClientMessage(playerid, COLOR_RED, "Aproxime-se mais desse jogador para vender a arma!");
			    return 1;
			}
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_RED, "Uso: /arma [id] [id da arma] [municao]");
	        return 1;
	    }
		new weaponid = strval(tmp);
		if(weaponid == 0 || (weaponid > 17 && weaponid < 22) || weaponid > 33)
		{
		    SendClientMessage(playerid, COLOR_RED, "Arma inválida!");
		    return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
		    SendClientMessage(playerid, COLOR_RED, "Uso: /arma [id] [id da arma] [municao]");
	        return 1;
		}
		new ammo = strval(tmp);
		GivePlayerWeapon(plid, weaponid, ammo);
		SendClientMessage(playerid, COLOR_GREEN, "Arma vendida.");
		new str[200];
		format(str, sizeof str, "O jogador %s lhe vendeu a arma de ID %d com %d munições.", PlayerName(playerid), weaponid, ammo);
		SendClientMessage(plid, COLOR_GREEN, str);
		return 1;
	}
	
	if(strcmp(cmd, "/colete", true) == 0)
	{
		if(Profissao[playerid] != VENDEDOR_DE_ARMAS && !IsPlayerAdmin(playerid))
		{
		    SendClientMessage(playerid, COLOR_RED, "Você não tem permissão para isso...");
		    return 1;
		}
	    new tmp[256];
	    tmp = strtok(cmdtext, idx);
	    if(!strlen(tmp))
	    {
	        SendClientMessage(playerid, COLOR_RED, "Uso: /colete [id]");
	        return 1;
	    }
		new plid = strval(tmp);
		if(!IsPlayerConnected(plid) || Login[plid] == 0)
		{
		    SendClientMessage(playerid, COLOR_RED, "Jogador não conectado/logado.");
		    return 1;
		}
		else
	    {
	    	new Float:x[2], Float:y[2], Float:z[2];
			GetPlayerPos(playerid, x[0], y[0], z[0]);
			GetPlayerPos(plid, x[1], y[1], z[1]);
			if(floatpower(x[0] - x[1], 2) + floatpower(y[0] - y[1], 2) + floatpower(z[0] - z[1], 2) > 10)
			{
			    SendClientMessage(playerid, COLOR_RED, "Aproxime-se mais desse jogador para vender o colete!");
			    return 1;
			}
		}
		SetPlayerArmour(plid, 100);
		SendClientMessage(playerid, COLOR_GREEN, "Colete vendido.");
		new str[128];
		format(str, sizeof str, "O jogador %s lhe vendeu um colete.", PlayerName(playerid));
		SendClientMessage(plid, COLOR_GREEN, str);
		return 1;
	}

//------------------------------ FIM DOS COMANDOS DE VENDEDOR DE ARMAS ------------------//

	SendClientMessage(playerid, COLOR_BLUE, "Comando inexistente.");
	return 1;
}

public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	printf("OnPlayerExitVehicle(%d, %d)", playerid, vehicleid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new Ptmess[64];
	if(newstate == PLAYER_STATE_DRIVER){
		if(Petrol[playerid] <= 0){
			RemovePlayerFromVehicle(playerid);
			Petrol[playerid] = 0;
			SendClientMessage(playerid, COLOR_RED, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
        	return 0;
		}
		if(Petrol[playerid] > 50){
		    Petrol[playerid]--;
			format(Ptmess, sizeof(Ptmess), "~w~combustivel: ~g~%d", Petrol[playerid]);
			GameTextForPlayer(playerid, Ptmess, 5000, 1);
        	return 0;
		}
		if(Petrol[playerid] <= 50 || Petrol[playerid] >= 1){
		    Petrol[playerid]--;
			format(Ptmess, sizeof(Ptmess), "~w~combustivel: ~r~%d", Petrol[playerid]);
			GameTextForPlayer(playerid, Ptmess, 5000, 1);
        	return 0;
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT){
	    if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COLOR_GREEN, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COLOR_RED, "Você recebeu o valor da corrida até aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	printf("OnPlayerEnterCheckpoint(%d)", playerid);
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("OnPlayerLeaveCheckpoint(%d)", playerid);
	return 1;
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	return name;
}

public Areas()
{
	for(new i = 0; i < MAX_SLOTS; i++){
	    if(IsPlayerConnected(i) && Login[i] == 1) {
	        new Float:X, Float:Y, Float:Z;
	        GetPlayerPos(i, X, Y, Z);
	        SetPlayerScore(i, GetPlayerMoney(i));
			if(X >= -1974.8708 && X <= -1972.9692 && Y >= 116.7858 && Y <= 119.0925){ //CAIXA ESTAÇÃO
				if(AreaBanco[i] == 0) {
					AreaBanco[i] = 1;
					SendClientMessage(i, COLOR_WHITE, "Você está no banco, para mais informações digite /banco");
				    GameTextForPlayer(i,"~w~Banco",5000,1);
				}
			}
			else if(X >= -1747.6816 && X <= -1745.3147 && Y >= 961.4276 && Y <= 964.1206){ //CAIXA HOTEL
				if(AreaBanco[i] == 0) {
					AreaBanco[i] = 1;
					SendClientMessage(i, COLOR_WHITE, "Você está no banco, para mais informações digite /banco");
				    GameTextForPlayer(i,"~w~Banco",5000,1);
				}
			}
			else if(X >= -2447.7061 && X <= -2445.7253 && Y >= 521.6743 && Y <= 524.0634){ // CAIXA DO FEDERAL MINT
				if(AreaBanco[i] == 0) {
					AreaBanco[i] = 1;
					SendClientMessage(i, COLOR_WHITE, "Você está no banco, para mais informações digite /banco");
				    GameTextForPlayer(i,"~w~Banco",5000,1);
				}
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
				if(AreaPosto[i] == 0){
				    AreaPosto[i] = 1;
				    SendClientMessage(i, COLOR_WHITE, "Você está no posto, para abastecer digite /abastecer");
			        GameTextForPlayer(i,"~w~Posto",5000,1);
				}
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    if(AreaPosto[i] == 0){
			        AreaPosto[i] = 1;
			        SendClientMessage(i, COLOR_WHITE, "Você está no posto, para abastecer digite /abastecer");
			        GameTextForPlayer(i,"~w~Posto",5000,1);
				}
			}
			else if((X >= -2249.5974 && X <= -2237.2092 && Y >= -2568.4641 && Y <= -2555.4763)){
			    if(AreaPosto[i] == 0){
			        AreaPosto[i] = 1;
			        SendClientMessage(i, COLOR_WHITE, "Você está no posto, para abastecer digite /abastecer");
			        GameTextForPlayer(i,"~w~Posto",5000,1);
				}
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    if(AreaPosto[i] == 0){
			        AreaPosto[i] = 1;
			        SendClientMessage(i, COLOR_WHITE, "Você está no posto, para abastecer digite /abastecer");
			        GameTextForPlayer(i,"~w~Posto",5000,1);
				}
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
			    if(AreaPosto[i] == 0){
			        AreaPosto[i] = 1;
			        SendClientMessage(i, COLOR_WHITE, "Você está no posto, para abastecer digite /abastecer");
			        GameTextForPlayer(i,"~w~Posto",5000,1);
				}
			}
			else if((X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717) || (X >= -688.8192 && X <= -606.5556 && Y >= 982.5786 && Y <= 1041.2584)){
			    if(AreaFazenda[i] == 0){
			        AreaFazenda[i] = 1;
					if(Profissao[i] == AGRICULTOR || IsPlayerAdmin(i))
					{
					    SendClientMessage(i, COLOR_WHITE, "Você está na fazenda, para plantar digite /plantar");
					}
			        GameTextForPlayer(i,"~w~Fazenda",5000,1);
				}
			}
			else if(X >= -2445.7419 && X <= -2439.5896 && Y >= 752.9041 && Y <= 755.4161){
			    if(AreaMercado[i] == 0){
			        AreaMercado[i] = 1;
			        GameTextForPlayer(i,"~w~Mercado",5000,1);
       			}
			}
			else
			{
				if(AreaBanco[i] == 1) {
					AreaBanco[i] = 0;
				}
				if(AreaPosto[i] == 1) {
					AreaPosto[i] = 0;
				}
				if(AreaMercado[i] == 1) {
					AreaMercado[i] = 0;
				}
			}
		}
	}
}

public CheckFuel()
{
	new Ptmess[64];
	for(new i=0; i<MAX_SLOTS; i++){
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1){
			if(GetPlayerState(i) == 2){
				Petrol[i]--;
				if(Petrol[i] <= 0){
					RemovePlayerFromVehicle(i);
					SendClientMessage(i, COLOR_RED, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
					Petrol[i] = 0;
					return 1;
				}
				if(Petrol[i] >= 25){
					format(Ptmess, sizeof(Ptmess), "~w~combustivel: ~g~%d", Petrol[i]);
					GameTextForPlayer(i, Ptmess, 5000, 1);
					return 1;
				}
				if(Petrol[i] < 25 || Petrol[i] >= 1){
					format(Ptmess, sizeof(Ptmess), "~w~combustivel: ~r~%d", Petrol[i]);
					GameTextForPlayer(i, Ptmess, 5000, 1);
					return 1;
				}
			}
		}
	}
	return 1;
}

public SetCar(carid, Float:X, Float:Y, Float:Z, Float:ang, cor1, cor2) 		CreateVehicle(carid, X, Y, Z, ang, cor1, cor2, -1);

public LogarPlayer(playerid)
{
	LoadPlayer(playerid);
	GivePlayerMoney(playerid, PlayerStats[playerid][pMoney] - GetPlayerMoney(playerid));
	SetSpawnInfo(playerid, 1, PlayerStats[playerid][pSkin], PlayerStats[playerid][pX], PlayerStats[playerid][pY], PlayerStats[playerid][pZ], PlayerStats[playerid][pAng], 0, 0, 0, 0, 0, 0);
	if(PlayerStats[playerid][pWanted] == 1){
	    SetSpawnInfo(playerid, 1, PlayerStats[playerid][pSkin], 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
	    PlayerStats[playerid][pWanted] = 0;
	}
	SpawnPlayer(playerid);
}

public TempoPrisao()
{
	for(new i = 0; i < MAX_SLOTS; i++){
	    if(PlayerStats[i][pBusted] == 1){
	        if(TempoPreso[i] >= 10){
	            PlayerStats[i][pBusted] = 0;
	            TempoPreso[i] = 0;
	    	    LogarPlayer(i);
	            SendClientMessage(i, COLOR_YELLOW, "Você foi solto, não cometa mais crimes senão irá pagar novamente.");
			}
			else if(TempoPreso[i] < 10)
			{
			    if(TempoPreso[i] == 9) SendClientMessage(i, COLOR_WHITE, "Resta 1 minuto para você ser solto...");
			    else
			    {
			        new bust_warn[128];
					format(bust_warn, sizeof bust_warn, "Restam %d minutos para você ser solto...", 10 - TempoPreso[i]);
			    	SendClientMessage(i, COLOR_WHITE, bust_warn);
				}
				TempoPreso[i]++;
			}
		}
	}
}

public Colheita(playerid)
{
	Plantando[playerid] = 0;
	Plantacao[playerid]++;
	SendClientMessage(playerid, COLOR_YELLOW, "Você já pode colher sua plantação para vende-la!");
	return 1;
}

public Pesca(playerid)
{
	if(IsPlayerConnected(playerid) && Pescando[playerid] == 1){
    	Pescando[playerid] = 0;
		TogglePlayerControllable(playerid,1);
		new rand = random(2);
		if(rand == 0){
			SendClientMessage(playerid, COLOR_YELLOW, "Sua rede voltou mas você não conseguiu pescar nada!");
			new prejuizo = random(50)+50;
			new str[200];
			format(str,sizeof(str),"Foi lhe dado um prejuízo de $%d,00 dólares pelas iscas que você gastou.",prejuizo);
			SendClientMessage(playerid, COLOR_RED, str);
			GivePlayerMoney(playerid,-prejuizo);
		}
		else{
	    	new pescado = random(6)+1;
			new str[200];
			format(str,sizeof(str),"Sua rede voltou e você conseguiu pescar %d peixes!",pescado);
			SendClientMessage(playerid, COLOR_YELLOW, str);
			Pescado[playerid] = Pescado[playerid]+pescado;
			format(str,sizeof(str),"Agora você possui %d peixes no total.",Pescado[playerid]);
			SendClientMessage(playerid, COLOR_YELLOW, str);
		}
	}
}
		
public GetDistanceBetweenPlayers(playerid,playerid2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	new Float:dis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetPlayerPos(playerid2,x2,y2,z2);
	dis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(dis);
}

public Taxi()
{
	for(new i=0; i<MAX_SLOTS; i++){
		if(Taximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 3){
			    new string[256];
				PrecoCorrida[i] += 3;
				format(string, sizeof(string), "O taxímetro mostra: $%d,00 dólares", PrecoCorrida[i]);
				SendClientMessage(i, COLOR_GREEN, string);
				SendClientMessage(Taximetro[i][1], COLOR_GREEN, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COLOR_RED, "Você não tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(Taximetro[i][1], COLOR_RED, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				Taximetro[i][1] = 0;
				Taximetro[i][0] = 0;
			}
		}
	}
}

public Tempo()
{
	GameTime = (GameTime + 1) % 24;
	SetWorldTime(GameTime);
	
	for(new i=0; i<MAX_SLOTS; i++) {
		if(GameTime == 0){
			if(IsPlayerConnected(i) && Login[i] == 1){
				if(Profissao[i] == DESEMPREGADO) {
					SendClientMessage(i, COLOR_DESEMPREGADO, "Seu seguro desemprego foi depositado: $100,00 dólares");
					SendClientMessage(i, COLOR_RED, "Não vai procurar emprego?");
					PlayerStats[i][pBank] += 100;
				}
				else if(Profissao[i] == TAXISTA) {
					SendClientMessage(i, COLOR_TAXISTA, "A Companhia de Taxi depositou seu salário: $700,00 dólares");
                    PlayerStats[i][pBank] += 700;
				}
				else if(Profissao[i] == VENDEDOR_DE_CARROS) {
					SendClientMessage(i, COLOR_VENDEDOR, "A Concessionária depositou seu salário: $200,00 dólares");
					PlayerStats[i][pBank] += 200;
				}
				else if(Profissao[i] == CORRETOR) {
					SendClientMessage(i, COLOR_CORRETOR, "A Corretora de Imóveis depositou seu salário: $200,00 dólares");
					PlayerStats[i][pBank] += 200;
				}
				else if(Profissao[i] == BARMAN) {
					SendClientMessage(i, COLOR_BARMAN, "O \"Hard Drink Bar\" depositou seu salário: $600,00 dólares");
					PlayerStats[i][pBank] += 600;
				}
				else if(Profissao[i] == JUIZ) {
					SendClientMessage(i, COLOR_JUIZ, "Seu salário governamental foi depositado: $2000,00 dólares");
                    PlayerStats[i][pBank] += 2000;
				}
				else if(Profissao[i] == SEGURANÇA) {
					SendClientMessage(i, COLOR_SEGURANÇA, "A \"Hard Life Security Agency\" depositou seu salário: $800,00 dólares");
					PlayerStats[i][pBank] += 800;
				}
				else if(Profissao[i] == MOTORISTA_PARTICULAR) {
					SendClientMessage(i, COLOR_MOTORISTA_PARTICULAR, "A \"LuxLimosine & Cia\" depositou seu salário: $800,00 dólares");
					PlayerStats[i][pBank] += 800;
				}
				else if(Profissao[i] == COP_CIVIL) {
					SendClientMessage(i, COLOR_COP_CIVIL, "Seu salário governamental foi depositado: $800,00 dólares");
					PlayerStats[i][pBank] += 800;
				}
				else if(Profissao[i] == COP_RODOVIARIO) {
					SendClientMessage(i, COLOR_COP_RODOVIARIO, "Seu salário governamental foi depositado: $1000,00 dólares");
					PlayerStats[i][pBank] += 1000;
				}
				else if(Profissao[i] == COP_ELITE) {
					SendClientMessage(i, COLOR_COP_ELITE, "Seu salário governamental foi depositado: $3000,00 dólares");
					PlayerStats[i][pBank] += 3000;
				}
				else if(Profissao[i] == PESCADOR) {
					SendClientMessage(i, COLOR_PESCADOR, "A Cooperativa de Pesca depositou seu salário: $500,00 dólares");
					PlayerStats[i][pBank] += 500;
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					SendClientMessage(i, COLOR_INSTRUTOR, "A Auto-Escola depositou seu salário: $600,00 dólares");
					PlayerStats[i][pBank] += 600;
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					SendClientMessage(i, COLOR_MOTORISTA_ONIBUS, "Seu salário governamental foi depositado: $700,00 dólares");
					PlayerStats[i][pBank] += 700;
				}
				else if(Profissao[i] == AGRICULTOR) {
					SendClientMessage(i, COLOR_AGRICULTOR, "A Fazenda \"Hard Rural Farm\" depositou seu salário: $400,00 dólares");
					PlayerStats[i][pBank] += 400;
				}
				else if(Profissao[i] == VENDEDOR_DE_ARMAS) {
					SendClientMessage(i, COLOR_VENDEDOR_DE_ARMAS, "A Ammu-Nation depositou seu salário: $700,00 dólares");
					PlayerStats[i][pBank] += 700;
				}
				else if(Profissao[i] == MECANICO) {
					SendClientMessage(i, COLOR_MECANICO, "A Pay'n'Spray depositou seu salário: $600,00 dólares");
					PlayerStats[i][pBank] += 600;
				}
				else if(Profissao[i] == TRAFICANTE) {
					SendClientMessage(i, COLOR_TRAFICANTE, "Seu salário foi depositado: $800,00 dólares");
					PlayerStats[i][pBank] += 800;
				}
				else if(Profissao[i] == ADVOGADO) {
					SendClientMessage(i, COLOR_ADVOGADO, "A \"Hard Life & Advogados Associados\" depositou seu salário: $1000,00 dólares");
					PlayerStats[i][pBank] += 1000;
				}
			}
		}
	}
}
