/*
		Life in San Andreas Role Play (LSA)
	
 				Created by Rafael
		
  			 Special Thanks: osorkon
*/

#include <a_samp>

#define QTVEHICLES  0
#define QTHOUSES    20
#define MAX_HOUSES 	999

new DiaNome[][] = {
"Domingo",
"Segunda-Feira",
"Terca-Feira",
"Quarta-Feira",
"Quinta-Feira",
"Sexta-Feira",
"Sabado"
};

new ProfNames[][] = {
"Invalida",
"Desempregado",
"Mecânico",
"Entregador de pizzas",
"Vendedor de armas",
"Taxista",
"Paramédico",
"Instrutor de trânsito",
"Policial militar",
"Xerife"
};

new ProfColors[] = {
0xFFFFFFAA,
0xFFFFFFAA,
0xA9CDE6AA,
0xFFFF00AA,
0xCFCFCFAA,
0xFFEE60AA,
0xE9967AAA,
0xFFFFB3FF,
0x068DE2AA,
0x81694CAA
};

new ProfPayDay[] = {
0,
100,
400,
300,
400,
350,
500,
400,
300,
800
};

enum VehicleStats {
Dono[MAX_PLAYER_NAME],
Gas,
Tuning[12],
Placa[8]
}

enum HouseStats {
HouseID,
HouseOwner[MAX_PLAYER_NAME],
HouseValue,
HouseSell,
Float:HousePos[3]
}

enum HouseInfo {
hValue,
Float:hX,
Float:hY,
Float:hZ
}

enum PlayerStats {
Senha[256],
Dinheiro,
Banco,
Skin,
Celular,
Profissao,
Level,
House,
Float:playerx,
Float:playery,
Float:playerz,
LastReason
}

enum AreaInfo {
AreaName[256],
AreaMessage[256],
AreaMessageColor,
AreaID,
Float:AreaXmin,
Float:AreaXmax,
Float:AreaYmin,
Float:AreaYmax
}

new GTSimNao[][] = {
"NAO",
"SIM"
};

new Float:InfoHouses[QTHOUSES][HouseInfo] = {
{20000,251.8195,-121.3642,3.5354},
{20000,251.6733,-92.3889,3.5354},
{10000,247.7805,-33.3552,1.5781},
{5000,285.6772,41.4975,2.5294},
{10000,309.3445,43.8391,2.8880},
{5000,317.4444,54.8767,3.3750},
{5000,341.9763,62.2563,3.8389},
{5000,339.6506,34.2829,6.4174},
{20000,313.5455,-92.2050,3.5354},
{20000,313.4798,-121.2369,3.5354},
{1000,254.4796,-273.7011,1.5781},
{1000,261.5326,-270.3539,1.5781},
{1000,263.2487,-288.4311,1.5781},
{2000,259.7733,-302.3454,1.9184},
{2000,227.5501,-303.2466,1.9262},
{1000,234.5776,-308.8459,1.5836},
{1000,242.1033,-296.9860,1.5781},
{1000,240.6380,-282.9455,1.5836},
{20000,295.3069,-55.6852,2.7772},
{20000,271.7264,-49.4915,2.7772}
};

new Areas[][AreaInfo] = {
{"Banco","Use /banco para mais informações",0xFFFFFFAA,1,1700.1732,1741.9966,-1721.5967,-1605.9054},
{"Banco","Use /banco para mais informações",0xFFFFFFAA,1,972.7372,1072.9083,-1133.2140,-1110.8668},
{"Banco","Use /banco para mais informações",0xFFFFFFAA,1,385.5901,409.1007,-1823.7596,-1797.2906},
{"Banco","Use /banco para mais informações",0xFFFFFFAA,1,-1785.4990,-1714.4250,929.3326,974.9125},
{"Banco","Use /banco para mais informações",0xFFFFFFAA,1,-1978.6537,-1961.9292,113.2442,162.6734},
{"Banco","Use /banco para mais informações",0xFFFFFFAA,1,-2482.7346,-2386.7249,461.5373,552.1155}
};

new Hora;
new Minuto;
new Dia;
new Login[MAX_PLAYERS] = 0;
new pStats[MAX_PLAYERS][PlayerStats];
new vStats[MAX_VEHICLES][VehicleStats];
new hStats[MAX_HOUSES][HouseStats];
new PickupHouse[MAX_HOUSES];
new QtHouses;
new GetHouse[MAX_PLAYERS];
new HTimer[MAX_PLAYERS];
new AreaLocal[MAX_PLAYERS];

forward set(string_text1[],string_text2[]);
forward GetPlayerID(name[]);
forward IsStringAName(name[]);
forward MostrarHora();
forward CreateUtilitiesFile();
forward LoadUtilitiesFile();
forward TempoPassando();
forward ApplyTuningInVehicle(vehicleid);
forward ApplyPlaceInVehicle(vehicleid);
forward PayDay(playerid);
forward AplicarProfissao(playerid,profid);
forward HandlerHouses(playerid);
forward ResetPickups();
forward CreateHouseFiles();
forward AddHouse(owner[],value,Float:x,Float:y,Float:z);
forward SaveHouses();
forward LoadHouses();
forward CheckName(playerid);
forward SavePlayerPos(playerid,Float:newposx,Float:newposy,Float:newposz);
forward UpdateScore();
forward OnPlayerLogin(playerid);
forward equal(string1[],string2[]);
forward IsValidSkin(skin);
forward LoadPlayer(playerid);
forward CreateVehicleFiles();
forward LoadVehicleFiles();
forward SaveVehicleFiles(vehicleid);
forward AreaHandler();

main()
{
	print("\n__________________________ ");
	print("  Life in San Andreas RP 	");
	print("__________________________\n ");
}

public set(string_text1[],string_text2[])
{
	for(new lenght=0;lenght<strlen(string_text2);lenght++)
	{
	    string_text1[lenght]=string_text2[lenght];
	}
	string_text1[strlen(string_text2)]=EOS;
}
public OnGameModeInit()
{
    CreateHouseFiles();
	CreateVehicleFiles();
	CreateUtilitiesFile();
	LoadUtilitiesFile();
	LoadHouses();
	LoadVehicleFiles();
	ResetPickups();
	SetGameModeText("Life in San Andreas RP");

	AddPlayerClass(116,170.6487,-111.3294,1.5479,264.5301,0,0,0,0,0,0);

	SetTimer("UpdateScore",1000,true);
	SetTimer("TempoPassando",1000,true);
	SetTimer("AreaHandler",1000,true);
	SetTimer("MostrarHora",85000,true);
	return 1;
}

public MostrarHora()
{
	new string[256];
	format(string,sizeof(string),"~y~%s:%s",ApplyZero(Hora),ApplyZero(Minuto));
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        GameTextForPlayer(i,string,3000,1);
	    }
	}
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	new name[30];
	GetPlayerName(playerid,name,30);
	if(fexist(name))
	{
		SendClientMessage(playerid,0xCFCFCFAA,"Você deve se logar, use /entrar [senha]");
	}
	else
	{
	    SendClientMessage(playerid,0xCFCFCFAA,"Você deve se registrar, use /registrar [senha]");
	}
	return 0;
}

public CheckName(playerid)
{
	new name[30];
	GetPlayerName(playerid,name,30);
	for(new s = 0; s < strlen(name); s++)
	{
		if(name[s] == ',')
		{
		    SendClientMessage(playerid,0xF0E68CAA,"No seu nick não pode constar \",\"");
		    GameTextForPlayer(playerid,"~n~ ~n~ ~n~ ~n~~g~troque seu nick",5000,4);
		    Kick(playerid);
		    break;
		}
	}
}

public AplicarProfissao(playerid,profid)
{
	if(profid < 1 || profid > sizeof(ProfNames))
	{
	    return 1;
	}
	if(profid == pStats[playerid][Profissao])
	{
	    SendClientMessage(playerid,0xAA3333AA,"Você já se encontra nessa profissão...");
	    return 1;
	}
	new string[256];
	format(string,sizeof(string),"Você mudou sua profissão para %s",ProfNames[profid]);
	SendClientMessage(playerid,0x7FFF00AA,string);
	SetPlayerColor(playerid,ProfColors[profid]);
	pStats[playerid][Profissao] = profid;
	return 1;
}

public PayDay(playerid)
{
	new name[30];
	GetPlayerName(playerid,name,30);
	if(fexist(name) && Login[playerid] == 1)
	{
	    pStats[playerid][Banco] += ProfPayDay[pStats[playerid][Profissao]];
		new string[256];
		format(string,sizeof(string),"Seu salário foi depositado em sua conta bancária: $%d",ProfPayDay[pStats[playerid][Profissao]]);
		SendClientMessage(playerid,0xFFFFFFAA,string);
	}
}

public OnPlayerConnect(playerid)
{
	
    Login[playerid] = 0;
	new name[30],string[256];
	GetPlayerName(playerid,name,sizeof(name));
	format(string,sizeof(string),"~y~Bem vindo~n~~w~%s",name);
	GameTextForPlayer(playerid,string,3000,1);
	format(string,sizeof(string),"%s entrou no servidor.",name);
	SendClientMessageToAll(0xCFCFCFAA,string);
	CheckName(playerid);
	SendClientMessage(playerid,0xF0E68CAA, "Life in San Andreas Role Play Server");
	SendClientMessage(playerid,0xA9CDE6AA,"Digite /ajuda para obter ajuda.");
	SendClientMessage(playerid,0xA9CDE6AA,"Digite /comandos para ver os comandos do RP.");
	SendClientMessage(playerid,0xA9CDE6AA,"Digite /sistemas para ver os sistemas do RP.");
	if(fexist(name)) format(string,sizeof(string),"Bem vindo %s, digite /entrar [senha] para entrar.",name);
	else format(string,sizeof(string),"Bem vindo %s, digite /registrar [senha] para entrar.",name);
	SendClientMessage(playerid, 0xCFCFCFAA, string);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	KillTimer(HTimer[playerid]);
	new name[30],string[256];
	GetPlayerName(playerid,name,sizeof(name));
    format(string,sizeof(string),"%s saiu do servidor.",name);
	SendClientMessageToAll(0xCFCFCFAA,string);
	pStats[playerid][Dinheiro] = GetPlayerMoney(playerid);
	if(Login[playerid] == 1 && strlen(pStats[playerid][Senha]) > 0)
	{
		new File:playerfile = fopen(name,io_write), savestr[256];
		format(savestr,sizeof(savestr),"%s,%d,%d,%d,%d,%d,%d,%d,%f,%f,%f,%d",
		pStats[playerid][Senha],
		pStats[playerid][Dinheiro],
		pStats[playerid][Banco],
		pStats[playerid][Skin],
		pStats[playerid][Celular],
		pStats[playerid][Profissao],
		pStats[playerid][Level],
		pStats[playerid][House],
		pStats[playerid][playerx],
		pStats[playerid][playery],
		pStats[playerid][playerz],
		reason
		);
		fwrite(playerfile,savestr);
		fclose(playerfile);
		printf("Estatisticas de %s salvas...",name);
		Login[playerid] = 0;
	}
	return 1;
}

public SavePlayerPos(playerid,Float:newposx,Float:newposy,Float:newposz)
{
	pStats[playerid][playerx] = newposx;
	pStats[playerid][playery] = newposy;
	pStats[playerid][playerz] = newposz;
}

public UpdateScore()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && Login[i] == 1)
		{
		    SetPlayerScore(i,pStats[i][Level]);
		}
	}
}

public OnPlayerLogin(playerid)
{
	printf("O jogador %s logou-se no servidor.");
	SetSpawnInfo(playerid,1,pStats[playerid][Skin],pStats[playerid][playerx],pStats[playerid][playery],pStats[playerid][playerz],0.0,0,0,0,0,0,0);
	if(pStats[playerid][LastReason] == 0 || pStats[playerid][LastReason] == 2)
	{
	    SendClientMessage(playerid,0xCFCFCFAA,"Seus dados podem não ter sido salvos corretamente em sua última saída.");
	}
}

public CreateUtilitiesFile()
{
	if(!fexist("utilidades.cfg"))
	{
		new File:utils = fopen("utilidades.cfg",io_write);
		new strsave[256];
		format(strsave,sizeof(strsave),"%d,%d,%d",Hora,Minuto,Dia);
		fwrite(utils,strsave);
		fclose(utils);
	}
}
public LoadUtilitiesFile()
{
	if(fexist("utilidades.cfg"))
	{
		new File:utils = fopen("utilidades.cfg",io_read);
		new tmp[256],index;
		fread(utils,tmp,256);
		Hora = strval(strtok(tmp,index,','));
		Minuto = strval(strtok(tmp,index,','));
		Dia = strval(strtok(tmp,index,','));
		fclose(utils);
	}
}

public AddHouse(owner[],value,Float:x,Float:y,Float:z)
{
	new File:housefile,hfile[256],strsave[256],sequence;
	sequence = QtHouses+1;
	format(hfile,sizeof(hfile),"%d.pck",sequence);
	while(fexist(hfile))
	{
	    sequence++;
	    format(hfile,sizeof(hfile),"%d.pck",sequence);
	}
	housefile = fopen(hfile,io_write);
	format(strsave,sizeof(strsave),"%s,%d,0,%f,%f,%f",owner,value,x,y,z);
	fwrite(housefile,strsave);
	fclose(housefile);
	set(hStats[sequence][HouseOwner],owner);
	hStats[sequence][HouseValue] = value;
	hStats[sequence][HouseSell] = 0;
	hStats[sequence][HousePos][0] = x;
	hStats[sequence][HousePos][1] = y;
	hStats[sequence][HousePos][2] = z;
	hStats[sequence][HouseID] = sequence;
	ResetPickups();
	QtHouses++;
}

public CreateHouseFiles()
{
	new File:housefile,hfile[8],strsave[256];
	for(new h = 0; h < QTHOUSES; h++)
	{
	    format(hfile,sizeof(hfile),"%d.pck",h);
		if(!fexist(hfile))
		{
			housefile = fopen(hfile,io_write);
			format(strsave,sizeof(strsave),"Servidor,%d,1,%f,%f,%f",
			InfoHouses[h][hValue],
			InfoHouses[h][hX],
			InfoHouses[h][hY],
			InfoHouses[h][hZ]
			);
			fwrite(housefile,strsave);
			fclose(housefile);
		}
	}
}

public SaveHouses()
{
	new File:housefile,hfile[8],strsave[256];
	for(new h = 0; h < MAX_HOUSES; h++)
	{
	    format(hfile,sizeof(hfile),"%d.pck",h);
	    if(fexist(hfile))
	    {
	        housefile = fopen(hfile,io_write);
	        format(strsave,sizeof(strsave),"%s,%d,%d,%f,%f,%f",
			hStats[h][HouseOwner],
			hStats[h][HouseValue],
			hStats[h][HouseSell],
			hStats[h][HousePos][0],
			hStats[h][HousePos][1],
			hStats[h][HousePos][2]
			);
			fwrite(housefile,strsave);
			fclose(housefile);
	    }
	}
}
public LoadHouses()
{
	new File:housefile,hfile[8];
	for(new h = 0; h < MAX_HOUSES; h++)
	{
	    format(hfile,sizeof(hfile),"%d.pck",h);
	    if(fexist(hfile))
	    {
	        housefile = fopen(hfile,io_read);
	        new tmp[256],index;
	        while(fread(housefile,tmp,sizeof(tmp)))
	        {
	            set(hStats[h][HouseOwner],strtok(tmp,index,','));
				hStats[h][HouseValue] = strval(strtok(tmp,index,','));
				hStats[h][HouseSell] = strval(strtok(tmp,index,','));
				hStats[h][HousePos][0] = floatstr(strtok(tmp,index,','));
				hStats[h][HousePos][1] = floatstr(strtok(tmp,index,','));
				hStats[h][HousePos][2] = floatstr(strtok(tmp,index,','));
				hStats[h][HouseID] = h;
				QtHouses++;
	        }
			fclose(housefile);
	    }
	}
	ResetPickups();
}

public ResetPickups()
{
	new hfile[8];
	new h = 0;
	while(h < MAX_HOUSES)
	{
	    format(hfile,sizeof(hfile),"%d.pck",h);
		if(fexist(hfile))
		{
	    	DestroyPickup(PickupHouse[h]);
	    	if(hStats[h][HouseSell] == 0)
			{
				PickupHouse[h] = CreatePickup(1272,1,hStats[h][HousePos][0],hStats[h][HousePos][1],hStats[h][HousePos][2]);
			}
			else
			{
		    	PickupHouse[h] = CreatePickup(1273,1,hStats[h][HousePos][0],hStats[h][HousePos][1],hStats[h][HousePos][2]);
			}
		}
		h++;
	}
}

public CreateVehicleFiles()
{
	new File:vehiclefile,strsave[256],vfile[8];
	for(new v = 0; v < QTVEHICLES; v++)
	{
	    format(vfile,sizeof(vfile),"%d.veh",v);
	    if(!fexist(vfile))
	    {
			format(strsave,sizeof(strsave),"Servidor,100,0,0,0,0,0,0,0,0,0,0,0,0,LSA RP");
			vehiclefile = fopen(vfile,io_write);
			fwrite(vehiclefile,strsave);
			fclose(vehiclefile);
		}
	}
}

public LoadVehicleFiles()
{
	new File:vehiclefile,vfile[8];
	for(new v = 0; v < MAX_VEHICLES; v++)
	{
	    format(vfile,sizeof(vfile),"%d.veh",v);
	    if(fexist(vfile))
	    {
	    	new tmp[256],index;
			vehiclefile = fopen(vfile,io_read);
	    	while(fread(vehiclefile,tmp,sizeof(tmp)))
	    	{
				set(vStats[v][Dono],strtok(tmp,index,','));
	    	    vStats[v][Gas] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][0] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][1] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][2] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][3] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][4] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][5] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][6] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][7] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][8] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][9] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][10] = strval(strtok(tmp,index,','));
	    	    vStats[v][Tuning][11] = strval(strtok(tmp,index,','));
	    	    set(vStats[v][Placa],strtok(tmp,index,','));
	    	}
	    	fclose(vehiclefile);
	    }
	}
}

public ApplyTuningInVehicle(vehicleid)
{
	for(new slot = 0; slot < 12; slot++)
	{
	    AddVehicleComponent(vehicleid,vStats[vehicleid][Tuning][slot]);
	}
}

public ApplyPlaceInVehicle(vehicleid)
{
	if(strlen(vStats[vehicleid][Placa]) > 0)
	{
		SetVehicleNumberPlate(vehicleid,vStats[vehicleid][Placa]);
	}
}

public HandlerHouses(playerid)
{
	if(IsPlayerConnected(playerid) && Login[playerid] == 1)
	{
	    new Float:x,Float:y,Float:z,Float:distancex,Float:distancey,Float:distancez;
        GetPlayerPos(playerid,x,y,z);
		for(new h = 0; h < MAX_HOUSES; h++)
		{
			distancex = x - hStats[h][HousePos][0];
			distancey = y - hStats[h][HousePos][1];
			distancez = z - hStats[h][HousePos][2];
			if(floatround(distancex) < 2 && floatround(distancex) > -2 && floatround(distancey) < 2 && floatround(distancey) > -2 && floatround(distancez) < 2 && floatround(distancez) > -2)
			{
			    new string[256];
			    format(string,sizeof(string),"~b~dono: ~w~%s ~n~ ~b~a venda: ~w~%s ~n~ ~b~valor: ~w~$%d",hStats[h][HouseOwner],GTSimNao[hStats[h][HouseSell]],hStats[h][HouseValue]);
				GameTextForPlayer(playerid,string,5000,4);
				GetHouse[playerid] = hStats[h][HouseID];
				if(hStats[h][HouseSell] == 1)
				{
				    SendClientMessage(playerid,0xCFCFCFAA,"Para adquirir essa casa digite /comprarcasa");
				}
				return 1;
			}
		}
		GetHouse[playerid] = -1;
	}
	return 1;
}

public SaveVehicleFiles(vehicleid)
{
	new vfile[8];
	format(vfile,sizeof(vfile),"%d.veh",vehicleid);
	if(fexist(vfile))
	{
	    new File:vehiclefile = fopen(vfile,io_write),strsave[256];
	    format(strsave,sizeof(strsave),"%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%s",
	    vStats[vehicleid][Dono],
	    vStats[vehicleid][Gas],
	    vStats[vehicleid][Tuning][0],
	    vStats[vehicleid][Tuning][1],
	    vStats[vehicleid][Tuning][2],
	    vStats[vehicleid][Tuning][3],
	    vStats[vehicleid][Tuning][4],
	    vStats[vehicleid][Tuning][5],
	    vStats[vehicleid][Tuning][6],
	    vStats[vehicleid][Tuning][7],
	    vStats[vehicleid][Tuning][8],
	    vStats[vehicleid][Tuning][9],
	    vStats[vehicleid][Tuning][10],
	    vStats[vehicleid][Tuning][11],
	    vStats[vehicleid][Placa]
	    );
	    fwrite(vehiclefile,strsave);
	    fclose(vehiclefile);
	}
}
public LoadPlayer(playerid)
{
	new playername[30];
	GetPlayerName(playerid,playername,sizeof(playername));
	new File:playerfile = fopen(playername,io_read);
	new tmp[256],index;
	while(fread(playerfile,tmp,sizeof(tmp)))
	{
	    pStats[playerid][Senha] = strtok(tmp,index,',');
	    pStats[playerid][Dinheiro] = strval(strtok(tmp,index,','));
	    pStats[playerid][Banco] = strval(strtok(tmp,index,','));
	    pStats[playerid][Skin] = strval(strtok(tmp,index,','));
	    pStats[playerid][Celular] = strval(strtok(tmp,index,','));
	    pStats[playerid][Profissao] = strval(strtok(tmp,index,','));
	    pStats[playerid][Level] = strval(strtok(tmp,index,','));
	    pStats[playerid][House] = strval(strtok(tmp,index,','));
	    pStats[playerid][playerx] = floatstr(strtok(tmp,index,','));
	    pStats[playerid][playery] = floatstr(strtok(tmp,index,','));
	    pStats[playerid][playerz] = floatstr(strtok(tmp,index,','));
		pStats[playerid][LastReason] = strval(strtok(tmp,index,','));
	}
	printf("Estatisticas de %s carregadas...",playername);
	fclose(playerfile);
}

public OnPlayerSpawn(playerid)
{
	SetPlayerColor(playerid,ProfColors[pStats[playerid][Profissao]]);
	HTimer[playerid] = SetTimerEx("HandlerHouses",1000,1,"d",playerid);
	GivePlayerMoney(playerid,-GetPlayerMoney(playerid)+pStats[playerid][Dinheiro]);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	SetTimerEx("ApplyTuningInVehicle",3000,0,"d",vehicleid);
	SetTimerEx("ApplyPlaceInVehicle",3000,0,"d",vehicleid);
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

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	SendClientMessage(playerid,0xAA3333AA,"Para falar privadamente com um jogador compre um celular, use /celularinfo para mais informações.");
	return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256],idx;
	cmd = strtok(cmdtext,idx,' ');
	if (strcmp("/registrar", cmd, true) == 0)
	{
	    new pass[256];
		pass = strtok(cmdtext,idx,' ');
	    if(!strlen(pass))
	    {
	        SendClientMessage(playerid,0xAA3333AA,"Use /registrar [senha]");
	        return 1;
	    }
	    if(Login[playerid] == 1)
		{
			SendClientMessage(playerid,0xAA3333AA,"Você já está logado!");
			return 1;
		}
		for(new len = 0; len < strlen(pass); len++)
		{
		    if(strcmp(pass[len],",",true) == 0)
		    {
		        SendClientMessage(playerid,0xAA3333AA,"Não coloque \",\" na senha...");
		        return 1;
		    }
		}
		new name[30];
		GetPlayerName(playerid,name,sizeof(name));
		if(fexist(name))
		{
		    SendClientMessage(playerid,0xAA3333AA,"Você já tem conta aqui, use /entrar [senha]");
		    return 1;
		}
		else
		{
	    	for(new p = 0; p < strlen(pass); p++)
     		{
				pStats[playerid][Senha][p] = pass[p];
	    	}
	    	Login[playerid] = 1;
	    	new File:playerfile = fopen(name,io_write);
	    	new strsave[256];
	    	format(strsave,sizeof(strsave),"%s,0,3000,26,1,0,170.6487,-111.3294,1.5479,0",pStats[playerid][Senha]);
	    	fwrite(playerfile,strsave);
	    	fclose(playerfile);
	    	pStats[playerid][Banco] = 3000;
	    	pStats[playerid][Skin] = 26;
	    	pStats[playerid][Profissao] = 1;
	    	SendClientMessage(playerid,0xFFFFFFAA,"Registrado...");
	    	SavePlayerPos(playerid,170.6487,-111.3294,1.5479);
	    	GameTextForPlayer(playerid,"~b~blueberry town",5000,0);
	    	SendClientMessage(playerid,0x7FFF00AA,"LEIA COM ATENÇÃO:");
	    	SendClientMessage(playerid,0xCFCFCFAA,"Essa é a cidade de Blueberry, uma cidade de classe social baixa.");
	    	SendClientMessage(playerid,0xCFCFCFAA,"Nesse Role Play seu objetivo é começar em uma cidadezinha pequena e");
	    	SendClientMessage(playerid,0xCFCFCFAA,"ir evoluindo de classe social para poder ir em uma cidade grande...");
            SendClientMessage(playerid,0xCFCFCFAA,"Nessa cidade não há todos os empregos disponíveis do jogo, há mais encontrados");
            SendClientMessage(playerid,0xCFCFCFAA,"nas cidades grandes, como San Fierro, Los Santos e Las Venturas");
            SendClientMessage(playerid,0xCFCFCFAA,"Mas melhor não ir lá agora, é necessário experiência para se empregar lá");
            SendClientMessage(playerid,0xCFCFCFAA,"Experiência pode ser consagrada trabalhando nos empregos das cidades pequenas");
            SendClientMessage(playerid,0xCFCFCFAA,"/profissoes para ver as profissões das cidades pequenas, seu score no TAB é sua experiência");
			SendClientMessage(playerid,0x7FFF00AA,"Divirta-se e Boa Sorte.");
			OnPlayerLogin(playerid);
			SpawnPlayer(playerid);
			return 1;
		}
	}
	if (strcmp("/entrar", cmd, true) == 0)
	{
		if(Login[playerid] == 1)
		{
			SendClientMessage(playerid,0xAA3333AA,"Você já está logado!");
			return 1;
		}
		new name[30];
		GetPlayerName(playerid,name,30);
	    if(!fexist(name)){
	        SendClientMessage(playerid,0xAA3333AA,"Você precisa estar registrado para isso...");
	        return 1;
	    }
	    new pass[256],correctpass[256];
	    pass = strtok(cmdtext,idx,' ');
	    if(!strlen(pass))
	    {
	        SendClientMessage(playerid,0xAA3333AA,"Use /entrar [senha]");
	        return 1;
	    }
	    new File:playerfile = fopen(name,io_read),tmp[256],index;
	    while(fread(playerfile,tmp,sizeof(tmp)))
	    {
	    	correctpass = strtok(tmp,index,',');
		}
		fclose(playerfile);
		if(equal(pass,correctpass))
	    {
	        Login[playerid] = 1;
	        LoadPlayer(playerid);
	        SendClientMessage(playerid,0xFFFFFFAA, "Login feito.");
	        OnPlayerLogin(playerid);
	        SpawnPlayer(playerid);
			return 1;
	    }
	    else
	    {
	        SendClientMessage(playerid,0xAA3333AA, "Senha incorreta!");
	        return 1;
		}
	}
	if(strcmp(cmd,"/minhascasas",true) == 0)
	{
	    new string[256],result,hfile[8],name[30];
		GetPlayerName(playerid,name,30);
		SendClientMessage(playerid,0xCFCFCFAA,"Casas em seu nome:");
		for(new h = 0; h < MAX_HOUSES; h++)
		{
		    format(hfile,sizeof(hfile),"%d.pck");
		    if(fexist(hfile))
		    {
		        if(!equal(hStats[h][HouseOwner],"Servidor"))
		        {
		            if(equal(hStats[h][HouseOwner],name))
		            {
		                format(string,sizeof(string),"Casa de ID %d - A venda: %s - Valor: $%d",hStats[h][HouseID],GTSimNao[hStats[h][HouseSell]],hStats[h][HouseValue]);
						SendClientMessage(playerid,0xFFFFFFAA,string);
						result++;
		            }
		        }
		    }
		}
		if(result == 0)
		{
		    SendClientMessage(playerid,0xAA3333AA,"Você não possui nenhuma casa!");
		}
		else
		{
		    format(string,sizeof(string),"Total de casas em seu nome: %d",result);
		    SendClientMessage(playerid,0xCFCFCFAA,string);
		}
		return 1;
	}
	if(strcmp(cmd,"/comprarcasa",true) == 0)
	{
	    if(GetHouse[playerid] == -1)
	    {
	        SendClientMessage(playerid,0xAA3333AA,"Você não está em uma casa!");
	        return 1;
	    }
	    if(hStats[GetHouse[playerid]][HouseSell] == 0)
	    {
	        SendClientMessage(playerid,0xAA3333AA,"Essa casa não está a venda.");
	        return 1;
	    }
	    if(GetPlayerMoney(playerid) < hStats[GetHouse[playerid]][HouseValue])
	    {
	        new string[128];
	        format(string,sizeof(string),"Você não tem dinheiro. Custo: $%d",hStats[GetHouse[playerid]][HouseValue]);
	        SendClientMessage(playerid,0xAA3333AA,string);
	        return 1;
	    }
	    new Float:x,Float:y,Float:z,name[30],string[128];
		GetPlayerPos(playerid,x,y,z);
	    GetPlayerName(playerid,name,30);
	    if(!equal(hStats[GetHouse[playerid]][HouseOwner],"Servidor"))
	    {
	        if(!IsStringAName(hStats[GetHouse[playerid]][HouseOwner]))
	        {
	            SendClientMessage(playerid,0xAA3333AA,"O proprietário dessa casa não está conectado.");
				return 1;
	        }
	        else
	        {
	            new id = GetPlayerID(hStats[GetHouse[playerid]][HouseOwner]);
	            GivePlayerMoney(id,hStats[GetHouse[playerid]][HouseValue]);
	            format(string,sizeof(string),"Sua casa de ID %d foi comprada por %s",hStats[GetHouse[playerid]][HouseID],name);
	            SendClientMessage(id,0xCFCFCFAA,string);
	        }
	    }
	    SavePlayerPos(playerid,x,y,z);
		set(hStats[GetHouse[playerid]][HouseOwner],name);
		hStats[GetHouse[playerid]][HouseSell] = 0;
		GivePlayerMoney(playerid,-hStats[GetHouse[playerid]][HouseValue]);
		format(string,128,"Casa de ID %d adquirida!",hStats[GetHouse[playerid]][HouseID]);
		SendClientMessage(playerid,0xCFCFCFAA,string);
		ResetPickups();
		return 1;
	}
	if(strcmp(cmd,"/casaavenda",true) == 0)
	{
	    new houseid = strval ( strtok ( cmdtext, idx, ' ' ) ) ;
	    new hfile[8];
	    new name[30];
	    new string[128];
	    format(hfile,sizeof(hfile),"%d.pck",houseid);
		if(!fexist(hfile))
		{
		    SendClientMessage(playerid,0xAA3333AA,"Casa inválida!");
		    return 1;
		}
		GetPlayerName(playerid,name,30);
		if(!equal(hStats[houseid][HouseOwner],name))
		{
		    SendClientMessage(playerid,0xAA3333AA,"Você não é o proprietário dessa casa!");
		    return 1;
		}
		else
		{
			hStats[houseid][HouseSell] = 1;
			format(string,128,"Casa colocada a venda no valor de $%d",hStats[houseid][HouseValue]);
			SendClientMessage(playerid,0xCFCFCFAA,string);
			ResetPickups();
			return 1;
		}
	}
	if(strcmp(cmd,"/infohouse",true) == 0 && IsPlayerAdmin(playerid))
	{
		new houseid = strval ( strtok ( cmdtext, idx, ' ' ) ) ;
		new hfile[8];
		format(hfile,sizeof(hfile),"%d.pck",houseid);
		if(fexist(hfile))
		{
		    new string[256];
		    format(string,sizeof(string),"Posição: %f %f %f",hStats[houseid][HousePos][0],hStats[houseid][HousePos][1],hStats[houseid][HousePos][2]);
			SendClientMessage(playerid,0xFFFFFFAA,string);
			format(string,sizeof(string),"A venda: %s | Valor: $%d",GTSimNao[hStats[houseid][HouseSell]],hStats[houseid][HouseValue]);
			SendClientMessage(playerid,0xFFFFFFAA,string);
			return 1;
		}
		else
		{
		    SendClientMessage(playerid,0xAA3333AA,"Casa inválida!");
		    return 1;
		}
	}
	if(strcmp(cmd,"/irpos",true) == 0 && IsPlayerAdmin(playerid))
	{
	    SetPlayerPos(playerid,251.819503,-121.364196,3.535399);
	    return 1;
	}
	if(strcmp(cmd,"/minhaprofissao",true) == 0 && IsPlayerAdmin(playerid))
	{
	    new profid = strval ( strtok ( cmdtext, idx, ' ' ) ) ;
	    if(profid < 1 || profid > sizeof(ProfNames))
		{
		    SendClientMessage(playerid,0xAA3333AA,"Profissão inválida!");
		    return 1;
		}
		else
		{
		    AplicarProfissao(playerid,profid);
		    return 1;
		}
	}
	if(strcmp(cmd,"/skin",true) == 0)
	{
	    new skin = strval ( strtok ( cmdtext, idx, ' ' ) ) ;
	    if(IsValidSkin(skin))
	    {
	        SetPlayerSkin(playerid,skin);
			pStats[playerid][Skin] = skin;
			SendClientMessage(playerid,0x7FFF00AA,"Nova skin adquirida.");
			return 1;
	    }
	    else
		{
		    SendClientMessage(playerid,0xAA3333AA,"Skin inexistente!");
		    return 1;
		}
	}
	if(strcmp(cmd,"/dia",true) == 0)
	{
	    new string[50];
	    format(string,sizeof(string),"Dia da semana: %s",DiaNome[Dia]);
	    SendClientMessage(playerid,0x7FFF00AA,string);
		format(string,sizeof(string),"Hora: %s:%s",ApplyZero(Hora),ApplyZero(Minuto));
		SendClientMessage(playerid,0x7FFF00AA,string);
		return 1;
	}
	if(strcmp(cmd,"/ajuda",true) == 0)
	{
	    SendClientMessage(playerid,0xF0E68CAA,"Life in San Andreas Role Play - Ajuda:");
	    SendClientMessage(playerid,0xA9CDE6AA,"/registrar [senha] : se registrar no Role Play");
	    SendClientMessage(playerid,0xA9CDE6AA,"/entrar [senha] : se logar no Role Play");
	    SendClientMessage(playerid,0xA9CDE6AA,"/comandos : checa os comandos do Role Play");
	    SendClientMessage(playerid,0xA9CDE6AA,"/sistemas : checa os sistemas do Role Play");
	    SendClientMessage(playerid,0xA9CDE6AA,"/regras : checa as regras do Role Play");
	    SendClientMessage(playerid,0xA9CDE6AA,"/creditos : ver os criadores do Role Play");
	    return 1;
	}
	if(strcmp(cmd,"/creditos",true) == 0)
	{
	    SendClientMessage(playerid,0xF0E68CAA,"Life in San Andreas Role Play (LSA)");
	    SendClientMessage(playerid,0xCFCFCFAA,"Mode created by: Rafael");
	    SendClientMessage(playerid,0xCFCFCFAA,"Special Thanks: osorkon");
	    return 1;
	}
	if(strcmp(cmd,"/regras",true) == 0)
	{
	    SendClientMessage(playerid,0xF0E68CAA,"**********************************************REGRAS**********************************************");
	    SendClientMessage(playerid,0xA9CDE6AA,"Esse gamemode representa a vida real, portanto você deve agir como na vida real");
        SendClientMessage(playerid,0xA9CDE6AA,"Vivendo, sem ficar matando, somente trabalhando e aproveitando sua vida!");
        SendClientMessage(playerid,0xA9CDE6AA,"Se você cometer um crime, será preso, você aqui pode adquirir casas, carros, propriedades, etc...");
        SendClientMessage(playerid,0xA9CDE6AA,"Não use cheats, hacks ou qualquer coisa do gênero, caso contrário será BANIDO daqui.");
		SendClientMessage(playerid,0xF0E68CAA,"Tenha um bom jogo.");
		return 1;
	}
	if(strcmp(cmd,"/comandos",true) == 0)
	{
	    SendClientMessage(playerid,0xF0E68CAA,"Life in San Andreas Role Play - Comandos:");
	    SendClientMessage(playerid,0xCFCFCFAA,"*** COMANDOS GERAIS *** /registrar /entrar /skin /dia");
	    SendClientMessage(playerid,0xCFCFCFAA,"*** COMANDOS DE AJUDA *** /ajuda /sistemas /regras");
	    SendClientMessage(playerid,0xCFCFCFAA,"*** COMANDOS DE PROFISSOES *** /profissoes");
	    SendClientMessage(playerid,0xCFCFCFAA,"*** COMANDOS DE CASAS *** /comprarcasa /minhascasas /casaavenda");
		return 1;
	}
	if(strcmp(cmd,"/profissoes",true) == 0)
	{
	    SendClientMessage(playerid,0xF0E68CAA,"Life in San Andreas Role Play - Profissões:");
	    SendClientMessage(playerid,0xCFCFCFAA,"Mecânico - Salário de $400 semanalmente");
	    SendClientMessage(playerid,0xCFCFCFAA,"Entregador de pizzas - Salário de $300 semanalmente");
	    SendClientMessage(playerid,0xCFCFCFAA,"Vendedor de armas - Salário de $400 semanalmente");
	    SendClientMessage(playerid,0xCFCFCFAA,"Taxista - Salário de $350 semanalmente");
	    SendClientMessage(playerid,0xCFCFCFAA,"Paramédico - Salário de $500 semanalmente");
	    SendClientMessage(playerid,0xCFCFCFAA,"Instrutor de trânsito - Salário de $400 semanalmente");
	    SendClientMessage(playerid,0xCFCFCFAA,"Policial militar - Salário de $300 semanalmente");
	    SendClientMessage(playerid,0xCFCFCFAA,"Xerife - Salário de $800 semanalmente (só pode haver um Xerife na cidade)");
	    SendClientMessage(playerid,0xF0E68CAA,"AVISO: Você encontrará mais profissões ao ir em uma cidade grande");
		return 1;
	}
	else
	{
		SendClientMessage(playerid,0xCFCFCFAA,"Esse comando não existe.");
	}
	return 1;
}

public GetPlayerID(name[])
{
	new name2[30];
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
			GetPlayerName(i,name2,30);
			if(equal(name,name2))
			{
			    return i;
			}
	    }
	}
	return INVALID_PLAYER_ID;
}

public IsStringAName(name[])
{
	new name2[30];
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    GetPlayerName(i,name2,30);
		    if(equal(name,name2))
		    {
		        return true;
		    }
		}
	}
	return false;
}

stock ApplyZero(id)
{
    new strresult[256];
	if(id < 10) format(strresult,sizeof(strresult),"0%d",id);
	else format(strresult,sizeof(strresult),"%d",id);
	return strresult;
}

public IsValidSkin(skin)
{
    if(skin == 3 || skin == 4 || skin == 5 || skin == 6 || skin == 8 || skin == 42 || skin == 65 || skin == 74 || skin == 86 || skin == 119 || skin == 149 || skin == 208 || skin == 273 || skin == 274 || skin == 289 || skin >= 300)
	{
 		return false;
	}
	else
	{
		return true;
	}
}

public equal(string1[],string2[])
{
	if(!strlen(string1) || !strlen(string2) || strlen(string1) != strlen(string2)) return false;
	for(new s=0; s<strlen(string1); s++)
	{
	    if(strcmp(string1[s],string2[s],true) != 0)
	    {
	        return false;
	    }
	}
	return true;
}

public AreaHandler()
{
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i) && Login[i]==1)
		{
		    new Float:playerposx,Float:playerposy,Float:playerposz;
			GetPlayerPos(i,playerposx,playerposy,playerposz);
		    if(AreaLocal[i]==0)
		    {
				for(new a=0;a<sizeof Areas;a++)
				{
	        	    if(playerposx >= Areas[a][AreaXmin] && playerposx <= Areas[a][AreaXmax] && playerposy >= Areas[a][AreaYmin] && playerposy <= Areas[a][AreaYmax])
	        	    {
	        	        AreaLocal[i]=Areas[a][AreaID];
						GameTextForPlayer(i,Areas[a][AreaName],3000,1);
						if(strlen(Areas[a][AreaMessage]) > 0) SendClientMessage(i,Areas[a][AreaMessageColor],Areas[a][AreaMessage]);
					}
				}
			}
			else
			{
			    if(playerposx >= Areas[AreaLocal[i]][AreaXmin] || playerposx <= Areas[AreaLocal[i]][AreaXmax] || playerposy >= Areas[AreaLocal[i]][AreaYmin] || playerposy <= Areas[AreaLocal[i]][AreaYmax])
				{
				    AreaLocal[i]=0;
				}
			}
		}
	}
}

public TempoPassando()
{
	SetWorldTime(Hora);
	Minuto++;
	if(Minuto >= 60)
	{
	    Minuto = 0;
	    Hora++;
	    if(Hora >= 24)
	    {
			Hora = 0;
			Dia++;
			if(Dia >= 7)
			{
			    Dia = 0;
                for(new i = 0; i < MAX_PLAYERS; i++)
			    {
			        if(IsPlayerConnected(i))
			        {
			        	PayDay(i);
					}
				}
			}
			new stringday[50];
			format(stringday,sizeof(stringday),"~g~%s",DiaNome[Dia]);
			GameTextForAll(stringday,5000,0);
	    }
	}
}

public OnPlayerInfoChange(playerid)
{
	return 1;
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

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

strtok(const string[], &index,seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[256];
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

