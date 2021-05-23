// Paradise Roleplay feito por Osorkon
// Agradecimentos: [BR]Rafael, [DT]Texugo, [DT]Guilherme, Brutows e Hemp
// Gamemode: Paradise RPG Versão: 0.1

// COLOCAR o /comprar E ARRUMAR LOCAIS DO EMPREGO NA DELEGACIA E PIZZARIA E TB COLOCAR INFOS E MAPICONS DOS EMPREGOS DE VENDEDOR ARMA E MECANICO
// fazer o /uniforme para o pay day, completar as profissoes existentes e fazer o passo anterior a cima.

#include <a_samp>
#include <dini>

//--- DEFINIÇÕES ---//
 // CORES //
#define cPRETO 0x000000AA
#define cBRANCO 0xFFFFFFAA // Cor do player logado
#define cCINZA1 0xD3D3D3AA // Avisos do servidor e player não logado
#define cCINZA2 0x808080AA // Avisos padrão
#define cVERMELHO1 0xFF5050AA // Mensagens negativas em geral
#define cVERMELHO2 0xFF0000AA
#define	cVERMELHO3 0x950000AA // Mensagem do administrador
#define cVERDE1 0xB6FFB6AA // Chat novato
#define cVERDE2 0xFF00AA // Chat no celular
#define cVERDE3 0x9500AA
#define cAZUL1 0xACACFFAA // Anuncios
#define cAZUL2 0xFFAA
#define cAZUL3 0x73AA
#define cAMARELO1 0xFFFFB4AA // Textos normais de ajuda (titulo em amarelo2)
#define cAMARELO2 0xFFFF00AA // Titulos para ajuda (textos em amarelo1)
#define cAMARELO3 0xB3B300AA
 // GERAL //
#define QT_SKIN 300
#define QT_CARRO 55
#define nome NomeDoPlayer(playerid)

//--- FORWARDS ---//
forward minrand(min, max);
forward LoadPlayer(playerid);
forward LocalInfo();
forward Tempo();
forward RetirarJogadorLocal();
forward Livre(playerid);
forward Taxi(taxista, passageiro);
forward Taximetro(taxista, passageiro);
forward Oferta(seguranca, cliente);
forward Tutorial(playerid);
forward Tutorial2(playerid);
forward Tutorial3(playerid);
forward Tutorial4(playerid);

//--- VARIÁVEIS ---//
 // GERAL //
new Login[MAX_PLAYERS];
new AntWorld[MAX_PLAYERS]/*, AntWorld2[MAX_PLAYERS]*/;
new minuto, hora, dia, clima, AnuncioPrevisao;
new FazendoTutorial[MAX_PLAYERS] = 0;
enum PROPOSTA_SETTING { Ofert, Oferecedor }
new Proposta[MAX_PLAYERS][PROPOSTA_SETTING], Preco;
 // EMPREGO //
new TaximetroAtivado[MAX_PLAYERS] = 0;
new PrecoCorrida[MAX_PLAYERS] = 0;
new TaxiAberto[MAX_PLAYERS] = 0;
new RecebeuMenuSkin[MAX_PLAYERS] = 0;
new PraComprarSkins[MAX_PLAYERS] = 0;
new Menu:Roupas;
new Prisao[MAX_PLAYERS], Multa[MAX_PLAYERS];
 // VEÍCULOS //
new Taxi1, Taxi2, Taxi3, Taxi4, Taxi5, Taxi6, Cop1, Cop2, Cop3, Cop4, Cop5, Cop6,
Cop7, Cop8, Cop9, Cop10, Cop11, Cop12, Pizza1, Pizza2, Pizza3/*, Bus1, Bus2*/;
 
//--- ARRAYS ---//
 // GERAL //
new nomedia[][] = {
	"Domingo",
	"Segunda-Feira",
	"Terca-Feira",
	"Quarta-Feira",
	"Quinta-Feira",
	"Sexta-Feira",
	"Sabado"
};

new salario[] = {
	0,
	1000,
	2000,
	3000,
	4000,
	5000,
	6000,
	7000,
	8000,
	9000,
	10000
};

 // VEÍCULOS //
new VehPobres[26] = {
	467, 466, 500, 445, 401, 527, 542, 466, 492, 546, 517, 410, 467,
	600, 436, 547, 580, 549, 496, 475, 418, 404, 479, 458, 561, 483
};

new Float:SpawnVehPobres[26][4] = {
	{2503.0405, -1755.0481, 13.2104, 179.5683},
	{2502.0139, -1953.1711, 13.2315, 179.9814},
	{2377.0913, -1927.8228, 13.1869, 180.4531},
	{1838.0077, -1870.9800, 13.1715, 179.2922},
	{1796.1102, -1932.4279, 13.1682, 179.3333},
	{1777.3107, -1892.3649, 13.1691, 89.6943},
	{1777.6868, -1907.7876, 13.1694, 270.0408},
	{1358.8622, -1753.1189, 13.1462, 180.7611},
	{2119.4714, -1782.5955, 13.1698, 179.2975},
	{2229.6697, -1360.2379, 23.7700, 89.6446},
	{2147.9626, -1185.0385, 23.6022, 89.6713},
	{2147.8511, -1157.3872, 23.6269, 270.0550},
	{2161.7544, -1143.8616, 24.6148, 270.0643},
	{2228.1592, -1156.1300, 25.5958, 90.4661},
	{2205.9368, -1172.9504, 25.5083, 270.1233},
	{2430.5920, -1224.3621, 25.0950, 180.4900},
	{2416.1758, -1223.5833, 24.7541, 357.3601},
	{2055.9753, -1904.1503, 13.5396, 179.9441},
	{1987.3900, -1995.2860, 13.5411, 0.0887},
	{1992.4752, -2066.9172, 13.3658, 359.9327},
	{1938.2872, -2083.2610, 13.5562, 90.9856},
	{1931.8076, -2142.1162, 13.5538, 180.1908},
	{1669.0756, -1696.9106, 15.7022, 90.3532},
	{1669.1500, -1711.6520, 15.7020, 269.9929},
	{1102.3503, -934.3547, 42.8698, 182.0502},
	{1143.1038, -918.1992, 42.8308, 91.1740}
};

main()
{
	print("\n----------------------------------");
	print(" Paradise Roleplay by Osorkon");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	// GERAL //
	SetGameModeText("PR RPG");
	EnableStuntBonusForAll(0);
	EnableTirePopping(1);
	DisableInteriorEnterExits();
	//LimitGlobalChatRadius(40.0);
	ShowNameTags(1);
	SetNameTagDrawDistance(20.0);
	UsePlayerPedAnims();
	ShowPlayerMarkers(1);
	AllowInteriorWeapons(1);
	SetDisabledWeapons(43, 44, 45);
	
	// CARROS //
	AddStaticVehicle(537, 1710.9410, -1953.9969, 13.5503, 280.4346, 1, 1); //trem em unity station
	Pizza1 = AddStaticVehicleEx(448, 2096.6340, -1793.1340, 12.9750, 90.9063, 3, 3, -1);
	Pizza2 = AddStaticVehicleEx(448, 2096.7056, -1814.0729, 12.9835, 92.5866, 3, 3, -1);
	Pizza3 = AddStaticVehicleEx(448, 2096.7493, -1817.2435, 12.9741, 89.4201, 3, 3, -1);
	Taxi1 = AddStaticVehicleEx(438, 1789.3394, -1850.6465, 13.4939, 88.8619, 6, 6, -1);
	Taxi2 = AddStaticVehicleEx(420, 1802.4099, -1865.8838, 13.3555, 0.4645, 6, 6, -1);
	Taxi3 = AddStaticVehicleEx(420, 1797.3341, -1865.9028, 13.3516, 359.6276, 6, 6, -1);
	Taxi4 = AddStaticVehicleEx(420, 1792.5389, -1865.8728, 13.3508, 0.8689, 6, 6, -1);
	Taxi5 = AddStaticVehicleEx(438, 1801.4594, -1850.6665, 13.5982, 90.3854, 6, 6, -1);
	Taxi6 = AddStaticVehicleEx(420, 1773.5895, -1850.6583, 13.6040, 90.9075, 6, 6, -1);
	Cop1 = AddStaticVehicleEx(596, 1602.0642, -1683.9617, 5.6159, 90.2377, 0, 1, -1); 
	Cop2 = AddStaticVehicleEx(596, 1558.8289, -1710.5072, 5.6119, 1.2089, 0, 1, -1);
	Cop3 = AddStaticVehicleEx(596, 1590.1436, -1606.0082, 13.1038, 180.3839, 0, 1, -1);
	Cop4 = AddStaticVehicleEx(596, 1535.6915, -1667.3058, 13.0801, 359.1937, 0, 1, -1);
	Cop5 = AddStaticVehicleEx(596, 1535.5845, -1678.2565, 13.0800, 359.0914, 0, 1, -1);
	Cop6 = AddStaticVehicleEx(596, 1595.4268, -1710.6549, 5.5879, 359.9572, 0, 1, -1);
	Cop7 = AddStaticVehicleEx(599, 1528.7932, -1683.8811, 5.5879, 270.5256, 0, 1, -1);
	Cop8 = AddStaticVehicleEx(527, 1530.5583, -1644.9402, 5.5879, 179.9057, 0, 1, -1);
	Cop9 = AddStaticVehicleEx(601, 1538.8174, -1645.3240, 5.5879, 179.8717, 0, 1, -1);
	Cop10 = AddStaticVehicleEx(528, 1544.8889, -1672.1006, 5.5879, 90.3967, 0, 1, -1);
	Cop11 = AddStaticVehicleEx(497, 1555.0433, -1611.2488, 13.5596, 90.7135, 0, 1, -1);
	Cop12 = AddStaticVehicleEx(523, 1586.1235, -1671.6300, 5.4588, 271.6342, 0, 1, -1);
	AddStaticVehicleEx(507, 2769.1094, -1606.3959, 10.6569, 270.2059, 0, 0, -1); // carro 1 segurança
	AddStaticVehicleEx(507, 2769.3081, -1615.1218, 10.6571, 270.0834, 0, 0, -1); // carro 2 segurnaça
	AddStaticVehicleEx(507, 2797.3787, -1609.5215, 10.7185, 336.8788, 0, 0, -1); // carro 3 segruança
	AddStaticVehicleEx(409, 2774.5273, -1625.2708, 10.6614, 269.9949, 0, 0, -1); // limusine segurança
	//AddPlayerClass(0,2767.6062,-1610.8160,10.9219,90.0678,0,0,0,0,0,0); // icone segurança
	///*Jornalismo1 =*/AddStaticVehicleEx(582, 753.2631, -1333.8356, 13.5978, 180.3713, 1, 2, -1);
	///*Jornalismo2 =*/AddStaticVehicleEx(582, 735.9139, -1348.0649, 13.5676, 270.7004, 1, 2, -1);
	///*Jornalismo3 =*/AddStaticVehicleEx(488, 739.6457, -1368.7468, 25.6922, 270.3447, 2, 2, -1);
	AddStaticVehicleEx(437, 1705.1068, -1532.9199, 13.5162, 0.0, 1, 1, -1);
	AddStaticVehicleEx(437, 1705.1201, -1511.9229, 13.5193, 0.0, 1, 1, -1);
	//Caminhao1 = AddStaticVehicleEx(456, 2175.3992, -2266.7800, 13.5611, 224.9738, 13, 13, -1); //caminhão com caçamba
	//Caminhao2 = AddStaticVehicleEx(414, 2159.7402, -2280.5483, 13.4655, 225.0043, 13, 13, -1); //van desenhada a
	//Caminhao3 = AddStaticVehicleEx(499, 2167.5605, -2273.5681, 13.3691, 224.9341, 13, 13, -1); //van desenhada b
	AddStaticVehicleEx(453, 2637.7000, -2480.1409, -0.2812, 179.5233, 1, 1, -1); //barco de pesca a
	AddStaticVehicleEx(423, 2485.2080, -1755.2014, 13.3263, 359.8503, 1, 1, -1); //carrinho de sorvete
	for (new v = 0; v < sizeof SpawnVehPobres; v++)
	{
		AddStaticVehicleEx(VehPobres[random(sizeof VehPobres)], SpawnVehPobres[v][0], SpawnVehPobres[v][1], SpawnVehPobres[v][2], SpawnVehPobres[v][3], -1, -1, 120000);
	}
	
	// OBJETOS //
	CreateObject(1557, 1167.845, 1362.797, 9.761, 0.0, 0.0, 0.0); //porta do escritório de matrícula
	CreateObject(981, 76.202, -1534.711, 5.120, 0.0, 1.719, 83.365); //bloqueio de pista sudoeste de los santos
	CreateObject(1535, 368.912384, 161.534011, 1013.166992, 0, 0, 90.999954); //porta da escola
	CreateObject(1508, 368.922454, 162.311187, 1026.433471, 0, 1, 360.042297); //porta da imobiliária
	//CreateObject(977, 2118.323, -2274.078, 21.276, 0.0, -0.859, -35.237); // Porta 1 escritório da transportadora
	//CreateObject(977, 2131.911, -2277.553, 21.268, 0.0,0.0, -34.377); // Porta 2 escritório da transportadora
	//CreateObject(8229, 2172.972, -2260.075, 16.471, 0.0, 0.0, 42.972); // Portao grande fechando o depósito da transportadora
	
	// PICKUPS // Obs: 2players icon = 1314, info icon = 1239, flecha icon = 1318.
	AddStaticPickup(1239, 1, 207.7047, -101.3411, 1005.2578); //roupa da binco
	AddStaticPickup(1239, 1, 203.8525, -43.7488, 1001.8047); //roupa da sub-urban
	AddStaticPickup(1239, 1, 2244.3235, -1665.5480, 15.4766); //entrada da binco
	AddStaticPickup(1239, 1, 207.6655, -111.2667, 1005.1328); //saida da binco
	AddStaticPickup(1239, 1, 2112.8469, -1211.4553, 23.9629); //entrada da sub-urban
	AddStaticPickup(1239, 1, 203.7579, -50.6646, 1001.8047); //saida da sub-urban
   	AddStaticPickup(1239, 1, 1555.4982, -1675.6321, 16.1953); //entrada da delegacia
   	AddStaticPickup(1239, 1, 246.7780, 62.3298, 1003.6406); //saida da delegacia
   	AddStaticPickup(1239, 1, 237.1912, 80.8232, 1005.0391); //item delegacia
	AddStaticPickup(1239, 1, 2105.4741, -1806.5221, 13.5547); //entrada da pizzaria
	AddStaticPickup(1239, 1, 372.3098, -133.5166, 1001.4922); //saida da pizzaria
	//AddStaticPickup(1239, 1, 1084.1293, -1226.4017, 15.8203); //entrada da auto-escola
   	AddStaticPickup(1239, 1, 1833.7756, -1842.5597, 13.5781); //69 cents
   	AddStaticPickup(1239, 1, -31.0052, -92.0106, 1003.5469); //saida 69 cents
    AddStaticPickup(1239, 1, 1352.3735, -1759.2437, 13.5078); //24/7 lspd
    AddStaticPickup(1239, 1, -26.6737, -58.2672, 1003.5469); //saida da 24/7 lspd
    AddStaticPickup(1239, 1, 378.4161, -118.8032, 1001.4922); //emprego pizza
    AddStaticPickup(1239, 1, 250.0508, 67.8080, 1003.6406); //emprego policial
    AddStaticPickup(1239, 1, 1783.2684, -1867.9734, 13.5695); //emprego taxista
    AddStaticPickup(1239, 1, 2770.6396, -1628.7191, 12.1775); //emprego segurança
    AddStaticPickup(1239, 1, 1471.3594, -1178.0880, 23.9214); //emprego advogado
	
	// MENUS //
	Roupas = CreateMenu("Roupas", 2, 40.0, 150.0, 60.0, 0.0);
	if (IsValidMenu(Roupas))
	{
		SetMenuColumnHeader(Roupas, 0, "Roupas");
 		AddMenuItem(Roupas, 0, "Proxima");
 		AddMenuItem(Roupas, 0, "Anterior");
 		AddMenuItem(Roupas, 0, "Comprar");
 		AddMenuItem(Roupas, 0, "Sair");
	}
	
	// TIMERS //
	SetTimer("LocalInfo", 1000, 1);
	SetTimer("Tempo", 1000, 1);
	SetTimer("RetirarJogadorLocal", 1000, 1);
	
	// OUTROS //
	if (!fexist("utilitarios.cfg")) UtilitariosCriar("utilitarios.cfg");
	else UtilitariosCarregar("utilitarios.cfg");
	
	return 1;
}

public OnGameModeExit()
{
    UtilitariosSalvar("utilitarios.cfg");
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1729.4088, -1651.4808, 20.2315);
	SetPlayerCameraPos(playerid, 1722.2180, -1651.8688, 20.0625);
	SetPlayerCameraLookAt(playerid, 1729.4088, -1651.4808, 20.2315);
	SetPlayerFacingAngle(playerid, 89.3845);
	SetPlayerInterior(playerid, 18);
	//PlayerPlaySound(playerid, 1187, 0.0, 0.0, 0.0);
	GameTextForPlayer(playerid, "~y~Paradise Roleplay", 2000, 0);
	SetPlayerColor(playerid, cCINZA1);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 0;
}

public OnPlayerConnect(playerid)
{
	// ÍCONE DO RADAR //
	/*SetPlayerMapIcon(playerid, 2, 2131.8699, -1150.7891, 24.1194, 55, 1); //concessionária (carrinho)
	SetPlayerMapIcon(playerid, 4, 1780.6970, -1807.3055, 13.5274, 62, 1); //escola (carinha da groove)
	SetPlayerMapIcon(playerid, 5, 1084.1293, -1226.4017, 15.8203, 36, 1); //auto-escola ("S")
	SetPlayerMapIcon(playerid, 6, 2179.4094, -2256.2290, 14.7734, 51, 1); //transportadora (caminhãozinho)*/
	SetPlayerMapIcon(playerid, 1, 1555.4982, -1675.6321, 16.1953, 30, 1); //delegacia
	SetPlayerMapIcon(playerid, 2, 1783.2684, -1867.9734, 13.5695, 56, 1); //taxista
	SetPlayerMapIcon(playerid, 3, 1833.7756, -1842.5597, 13.5781, 17, 1); //69 cents
	SetPlayerMapIcon(playerid, 5, 1352.3735, -1759.2437, 13.5078, 17, 1); //24/7 lspd
	SetPlayerMapIcon(playerid, 6, 2105.4880, -1806.5107, 13.5547, 29, 1); //pizzaria
	SetPlayerMapIcon(playerid, 7, 2770.6396, -1628.7191, 12.1775, 56, 1); //segurança
	SetPlayerMapIcon(playerid, 8, 1471.3594, -1178.0880, 23.9214, 56, 1); //advogado
	
	// OUTRO //
    if (!dini_Exists(nome)) SendClientMessage(playerid, cAMARELO1, "Para jogar você deve registrar uma conta usando /registrar.");
	else SendClientMessage(playerid, cAMARELO1, "Para jogar você deve logar uma conta usando /logar.");
 	new msg[256];
	format(msg, sizeof(msg), "%s conectou-se ao servidor.", nome);
	SendClientMessageToAll(cCINZA1, msg);
	// APLICAÇÕES //
	Login[playerid] = 0; Proposta[playerid][Ofert] = 0; Proposta[playerid][Oferecedor] = INVALID_PLAYER_ID; Prisao[playerid] = 0; Multa[playerid] = 0;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new msg[256];
	switch(reason)
	{
		case 0: format(msg, sizeof(msg), "%s perdeu a conexão do servidor.", nome);
		case 1: format(msg, sizeof(msg), "%s saiu do servidor.", nome);
		case 2: format(msg, sizeof(msg), "%s foi expulso do servidor.", nome);
	}
	SendClientMessageToAll(cCINZA1, msg);
	if (Login[playerid] == 1)
	{
		new Float:health, Float:col, Estrela;
		GetPlayerHealth(playerid, health);
		GetPlayerArmour(playerid, col);
		Estrela = GetPlayerWantedLevel(playerid);
		dini_FloatSet(nome, "Vida", health);
		dini_FloatSet(nome, "Colete", col);
		dini_IntSet(nome, "Dinheiro", GetPlayerMoney(playerid));
		new Float:Posx, Float:Posy, Float:Posz, Float:Ang, Int = GetPlayerInterior(playerid);
		GetPlayerPos(playerid, Posx, Posy, Posz);
		GetPlayerFacingAngle(playerid, Ang);
		dini_FloatSet(nome, "SpawnX", Posx);
		dini_FloatSet(nome, "SpawnY", Posy);
		dini_FloatSet(nome, "SpawnZ", Posz);
		dini_FloatSet(nome, "SpawnAng", Ang);
		dini_IntSet(nome, "SpawnInt", Int);
		dini_IntSet(nome, "Procurado", Estrela);
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
    //PlayerPlaySound(playerid, 1188, 0.0, 0.0, 0.0);
    SetPlayerColor(playerid, cBRANCO);
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
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (GetDistanceBetweenPlayers(playerid, i) <= 20)
		{
		    new stext[256];
			format(stext, sizeof(stext), "%s diz: %s", nome, text);
			SendClientMessage(i, cBRANCO, stext);
		}
	}
	return 0;
}

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[256], idx, tmp[256];
	cmd = strtok(cmdtext,idx);

	//--- PLAYER ---//
	if (strcmp("/registrar", cmd, true) == 0 && IsPlayerConnected(playerid))
	{
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) < 2 || strlen(tmp) > 13)
		{
			SendClientMessage(playerid, cVERMELHO1, "Crie uma senha para registrar uma conta (use 3 digitos no mínimo e 12 digitos no máximo).");
			return 1;
		}
		if (Login[playerid] == 1 || dini_Exists(nome))
		{
			SendClientMessage(playerid, cVERMELHO1, "Você já está registrado.");
			return 1;
		}
		else
		{
			Login[playerid] = 1;
            dini_Create(nome);
			dini_Set(nome, "Senha", tmp);
			dini_FloatSet(nome, "Vida", 100.0);
			dini_FloatSet(nome, "Colete", 0);
			dini_IntSet(nome, "Skin", 0);
			dini_IntSet(nome, "Dinheiro", 1000);
			dini_IntSet(nome, "Banco", 10000);
			dini_IntSet(nome, "Level", 0);
			dini_IntSet(nome, "Salário", 0);
			dini_IntSet(nome, "Profissão", 0);
			dini_IntSet(nome, "Preso", 0);
			dini_IntSet(nome, "Procurado", 0);
			dini_IntSet(nome, "HabilitaçãoA", 0);
			dini_IntSet(nome, "HabilitaçãoB", 0);
			dini_IntSet(nome, "HabilitaçãoC", 0);
			dini_IntSet(nome, "Porte", 0);
			dini_IntSet(nome, "Relógio", 0);
			dini_IntSet(nome, "Mapa", 0);
			dini_FloatSet(nome, "SpawnX", 1742.7098);
			dini_FloatSet(nome, "SpawnY", -1861.3729);
			dini_FloatSet(nome, "SpawnZ", 13.5776);
			dini_FloatSet(nome, "SpawnAng", 358.9154);
			dini_IntSet(nome, "SpawnInt", 0);
			SetSpawnInfo(playerid, 1, dini_Int(nome, "Skin"), 1742.7098, -1861.3729, 13.5776, 358.9154, 0, 0, 0, 0, 0, 0);
			SetPlayerInterior(playerid, 0);
			SpawnPlayer(playerid);
			TogglePlayerControllable(playerid, 0);
			FazendoTutorial[playerid] = 1;
			SetPlayerCameraPos(playerid, 1087.1958, -2028.9098, 72.7266);
			SetPlayerCameraLookAt(playerid, 1085.9401, -2027.3579, 72.7266);
			SendClientMessage(playerid, cAMARELO2, "Tutorial:");
			SendClientMessage(playerid, cAMARELO1, "Este é um servidor de Roleplay, ou seja, simula uma vida real.");
			SendClientMessage(playerid, cAMARELO1, "Haja de modo civilizado. Leia atenciosamente o tutorial a seguir.");
			SetTimerEx("Tutorial", 10000, 0, "d", playerid);
		}
		return 1;
	}

	if (strcmp("/logar", cmd, true) == 0 && IsPlayerConnected(playerid))
	{
		tmp = strtok(cmdtext, idx);
		if (strlen(tmp) == 0)
		{
			SendClientMessage(playerid, cVERMELHO1, "Use a senha que você criou para logar.");
			return 1;
		}
		if(Login[playerid] == 1)
		{
			SendClientMessage(playerid, cVERMELHO1, "Você já está logado.");
			return 1;
		}
		if(!dini_Exists(nome))
		{
			SendClientMessage(playerid, cVERMELHO1, "Você não possuí uma conta.");
			return 1;
		}
		if(strcmp(tmp, dini_Get(nome, "Senha"), true) == 0)
		{
			Login[playerid] = 1;
			LoadPlayer(playerid);
			TrancarVeiculoPorProf(playerid);
			SendClientMessage(playerid, cAMARELO1, "Você logou uma conta com sucesso.");
			return 1;
		}
		else
		{
			SendClientMessage(playerid, cVERMELHO1, "Senha incorreta.");
		}
		return 1;
 	}
	
	//--- INFORMAÇÃO ---//
	if (strcmp("/ajuda", cmd, true) == 0)
	{
		SendClientMessage(playerid, cAMARELO1, "PLAYER: /stats");
		SendClientMessage(playerid, cAMARELO1, "GERAL: /info /aceitar /comprar /verroupas");
		SendClientMessage(playerid, cAMARELO1, "CARRO: /trancar /abrir /abastecer");
		SendClientMessage(playerid, cAMARELO1, "EMPREGO: /requisitos /demitir /instrução /ajudaemprego");
		SendClientMessage(playerid, cAMARELO1, "OUTROS: /ligar /numero /mapa /relogio /creditos");
		return 1;
	}
	
	if (strcmp("/ajudaemprego", cmd, true) == 0)
	{
	/*	SendClientMessage(playerid, cAMARELO2, "Ajuda - Emprego:");
		SendClientMessage(playerid, cAMARELO1, "- Todos os empregos tem o salário fixo de $1000,00.");
		SendClientMessage(playerid, cAMARELO1, "- O salário varia de acordo com seu level, horas de trabalho e emprego.");
		SendClientMessage(playerid, cAMARELO1, "- Portanto o salário recebido fica: $1000,00 + horário acumulado + level.");
		SendClientMessage(playerid, cAMARELO1, "- As horas não são salvas em sua conta. Caso você saia perderá o salário extra.");
		SendClientMessage(playerid, cAMARELO1, "- As horas começam a serem acumuladas assim que você inicia o trabalho.");
		SendClientMessage(playerid, cAMARELO1, "- Assim que você aceita um emprego, você terá um tempo de 1 hora (real) para poder sair dele.");*/
		SendClientMessage(playerid, cAMARELO2, "Ajuda - Emprego:");
		SendClientMessage(playerid, cAMARELO1, "- Existe um salário-seguro que você irá ganhar.");
		SendClientMessage(playerid, cAMARELO1, "- Este salário varia de acordo com seu level (Ex.: Level 1: 1k, Level 2: 2k, ...).");
		SendClientMessage(playerid, cAMARELO1, "- Veja como trabalhar e veja os comandos de sua profissão usando /instrucao.");
		SendClientMessage(playerid, cAMARELO1, "- Os empregos tem requisitos. Vá até um local de emprego e digite /requisitos para saber.");
		SendClientMessage(playerid, cAMARELO1, "- Assim que você aceita um emprego, você terá um tempo de 1 hora (real) para poder sair dele.");
		return 1;
	}
	
	if (strcmp("/creditos", cmd, true) == 0)
	{
		SendClientMessage(playerid, cAMARELO2, "Paradise Roleplay Brasil:");
 		SendClientMessage(playerid, cAMARELO1, "Gamemode de rpg: Paradise RPG feito por Osorkon.");
 		SendClientMessage(playerid, cAMARELO1, "Equipe Paradise Roleplay Brasil: Osorkon e Brutows.");
 		SendClientMessage(playerid, cAMARELO1, "Agradecimentos: [BR]Rafael, [DT]Texugo, michael, Brutows e Hemp.");
		SendClientMessage(playerid, cAMARELO1, "Acesse nosso fórum: paradiserp.7forum.net.");
		return 1;
	}

	if (strcmp("/n", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
			strmid(tmp, cmdtext, 3, strlen(cmdtext));
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /n mensagem.");
				return 1;
			}
	       /* if (ChatNovatoAtivado[playerid] == 1)
	        {*/
 			new ntext[256];
			format(ntext, sizeof(ntext), "* Novato %s: %s *", nome, tmp);
			SendClientMessageToAll(cVERDE1, ntext);
			/*}
			else
			{
			    SendClientMessage(playerid, cVERMELHO1, "O chat de novatos está desativado.");
			}*/
		}
		return 1;
	}
	/*
	if (strcmp("/gritar", cmd, true) == 0)
	{
		new tmp[256];
		if (!strcmp("/gritar",cmd, true)) strmid(tmp, cmdtext, 7, strlen(cmdtext));
		else strmid(tmp, cmdtext, 2, strlen(cmdtext));
		if (!strlen(tmp)) return SendClientMessage(playerid, COLOR_GRAY, "USO: /gritar [mensagem] ,ou quer apenas abrir a boca?");
        if(Mudo[playerid] == 1 || Presos[playerid] == 1) return SendClientMessage(playerid, COLOR_GRAY, "Você não pode gritar porque está mudo, ou preso!");
		new str[256];
		format(str ,sizeof(str), "(( ** %s GRITA: %s ** ))", PlayerName(playerid), tmp);
		for(new i=0;i<SLOTS2;i++){
		    if(GetPlayerInterior(playerid) == GetPlayerInterior(i)){
				SendClientMessage(i, COLOR_GRITAR, str);
			}
		}
		return 1;
	}
	*/
	//--- GERAL ---//
	if (strcmp("/entrar", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (!IsPlayerInAnyVehicle(playerid))
	    	{
				if (GetPlayerDistanceToPointEx(playerid, 1555.4982, -1675.6321, 16.1953) < 2) //Delegacia
				{
		    		SetPlayerPos(playerid, 246.7828, 63.9026, 1003.6406);
					SetPlayerInterior(playerid, 6);
					SetPlayerFacingAngle(playerid, 0.0000);
					GameTextForPlayer(playerid, "~w~delegacia ~r~/sair~n~~w~para sair", 1000, 1);
				}
				else if (GetPlayerDistanceToPointEx(playerid, 2105.4741, -1806.5221, 13.5547) < 2) //Pizzaria
				{
  					if (hora < 7 || hora > 22)
					{
						SendClientMessage(playerid, cCINZA2, "Pizzaria fechada. Horário de funcionamento: 7:00 ás 22:00.");
						return 1;
					}
					else
					{
						SetPlayerPos(playerid, 372.3520, -131.6510, 1001.4922);
						SetPlayerInterior(playerid, 5);
						SetPlayerFacingAngle(playerid, 359.9000);
						GameTextForPlayer(playerid, "~w~pizzaria ~r~/sair~n~~w~para sair", 1000, 1);
					}
				}
				else if (GetPlayerDistanceToPointEx(playerid, 2244.3235, -1665.5480, 15.4766) < 2) //Binco
				{
					if (hora < 7 || hora > 22)
					{
						SendClientMessage(playerid, cCINZA2, "Loja de roupas Binco fechada. Horário de funcionamento: 7:00 ás 22:00.");
						return 1;
					}
					else
					{
						SetPlayerPos(playerid, 207.7435, -109.0151, 1005.1328);
						SetPlayerInterior(playerid, 15);
						SetPlayerFacingAngle(playerid, 0.0000);
						SendClientMessage(playerid, cCINZA2, "Use /verroupas no ícone azul para ver as roupas à venda.");
						GameTextForPlayer(playerid, "~w~binco ~r~/sair~n~~w~para sair", 1000, 1);
					}
				}
				else if (GetPlayerDistanceToPointEx(playerid, 2112.8469, -1211.4553, 23.9629) < 2) //Sub-Urban
				{
					if (hora < 7 || hora > 22)
					{
						SendClientMessage(playerid, cCINZA2, "Loja de roupas Sub-urban fechada. Horário de funcionamento: 8:00 ás 20:00 de segundas à sábados.");
						return 1;
					}
					else
					{
						SetPlayerPos(playerid, 203.7836, -49.0983, 1001.8047);
						SetPlayerInterior(playerid, 1);
						SetPlayerFacingAngle(playerid, 0.0636);
						SendClientMessage(playerid, cCINZA2, "Use /verroupas no ícone azul para ver as roupas à venda.");
						GameTextForPlayer(playerid, "~w~sub-urban ~r~/sair~n~~w~para sair", 1000, 1);
					}
				}
				/*else if (EntradaAutoEscola[playerid] == 1)
				{
			    	if (dia != 7)
			    	{
						if (hora < 9 || hora > 18)
						{
   							SendClientMessage(playerid, cCINZA2, "Auto-escola fechada. Horário de funcionamento: 9:00 ás 18:00 de segundas à sábados.");
							return 1;
						}
						else
						{
 	 						DentroAutoEscola[playerid] = 1;
							SetPlayerPos(playerid, -2027.8580, -104.9232, 1035.1719);
							SetPlayerInterior(playerid, 3);
							SetPlayerFacingAngle(playerid, 93.3791);
							SendClientMessage(playerid, cCINZA2, "Use /agendar para agendar um teste.");
							GameTextForPlayer(playerid, "~w~auto-escola ~r~/sair~n~~w~para sair", 100, 1);
						}
					}
					else
					{
				    	SendClientMessage(playerid, cCINZA2, "Auto-escola fechada. Horário de funcionamento: 9:00 ás 18:00 de segundas à sábados.");
					}
				}*/
				else if (GetPlayerDistanceToPointEx(playerid, 1833.7756, -1842.5597, 13.5781) < 2) //69 cents
				{
					SetPlayerPos(playerid, -30.9467, -89.6096, 1003.5469);
					SetPlayerFacingAngle(playerid, 0.0000);
					SetPlayerInterior(playerid, 18);
					GameTextForPlayer(playerid, "~w~24/7 ~r~/sair~n~~w~para sair", 1000, 1);
				}
				else if (GetPlayerDistanceToPointEx(playerid, 1352.3735, -1759.2437, 13.5078) < 2) //24/7 lspd
				{
					SetPlayerPos(playerid, -26.6906, -55.7147, 1003.5469);
					SetPlayerFacingAngle(playerid, 0.0000);
					SetPlayerInterior(playerid, 6);
					GameTextForPlayer(playerid, "~w~24/7 ~r~/sair~n~~w~para sair", 1000, 1);
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Você não estáem um porta para entrar.");
				}
			}
		}
		return 1;
	}
	
	if (strcmp("/sair", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	        if (IsPlayerInAnyVehicle(playerid)) RemovePlayerFromVehicle(playerid);
			if (GetPlayerDistanceToPointEx(playerid, 246.7780, 62.3298, 1003.6406) < 2) //Delegacia
			{
            	SetPlayerPos(playerid, 1552.4467, -1674.9890, 16.1953);
				SetPlayerInterior(playerid, 0);
				SetPlayerFacingAngle(playerid, 90.0000);
			}
			else if (GetPlayerDistanceToPointEx(playerid, 372.3098, -133.5166, 1001.4922) < 2) //Pizzaria
			{
				SetPlayerPos(playerid, 2103.4600, -1806.5900, 13.5547);
				SetPlayerInterior(playerid, 0);
				SetPlayerFacingAngle(playerid, 92.0000);
			}
			else if (GetPlayerDistanceToPointEx(playerid, 207.6655, -111.2667, 1005.1328) < 2) //Binco
			{
		    	if (PraComprarSkins[playerid] == 0)
				{
					SetPlayerPos(playerid, 2244.5847, -1663.2609, 15.4766);
					SetPlayerInterior(playerid, 0);
					SetPlayerFacingAngle(playerid, 352.1123);
				}
				else
				{
			    	SendClientMessage(playerid, cVERMELHO1, "Primeiro encerre as compras para poder sair da loja.");
				}
			}
			else if (GetPlayerDistanceToPointEx(playerid, 203.7579, -50.6646, 1001.8047) < 2) //Sub-Urban
			{
		    	if (PraComprarSkins[playerid] == 0)
				{
					SetPlayerPos(playerid, 2112.8701, -1214.7900, 23.9678);
					SetPlayerInterior(playerid, 0);
					SetPlayerFacingAngle(playerid, 180.0000);
				}
				else
				{
			    	SendClientMessage(playerid, cVERMELHO1, "Primeiro encerre as compras para poder sair da loja.");
				}
			}
	/*		else if (DentroAutoEscola[playerid] == 1)
			{
		    	DentroAutoEscola[playerid] = 0;
				SetPlayerPos(playerid, 1087.5691, -1226.4410, 15.8203);
				SetPlayerInterior(playerid, 0);
				SetPlayerFacingAngle(playerid, 268.7312);
			}*/
			else if (GetPlayerDistanceToPointEx(playerid, -31.0052, -92.0106, 1003.5469) < 2) //69 cents
			{
				SetPlayerPos(playerid, 1831.5400, -1843.3800, 13.5781);
				SetPlayerInterior(playerid, 0);
				SetPlayerFacingAngle(playerid, 90.0000);
			}
			else if (GetPlayerDistanceToPointEx(playerid, -26.6737, -58.2672, 1003.5469) < 2) //24/7 lspd
			{
				SetPlayerPos(playerid, 1352.3368, -1755.7028, 13.3530);
				SetPlayerInterior(playerid, 0);
				SetPlayerFacingAngle(playerid, 7.6056);
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "Você não está em uma porta para sair.");
			}
		}
		return 1;
	}
	
	if (strcmp("/verroupas", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	AntWorld[playerid] = GetPlayerVirtualWorld(playerid);
			if (GetPlayerDistanceToPointEx(playerid, 207.7047, -101.3411, 1005.2578) < 2 || GetPlayerDistanceToPointEx(playerid, 203.8525, -43.7488, 1001.8047) < 2)
			{
				if (GetPlayerMoney(playerid) >= 200)
				{
			    	if (GetPlayerDistanceToPointEx(playerid, 207.7047, -101.3411, 1005.2578) < 2) //Icone da binco
			    	{
						SetPlayerPos(playerid, 218.0859, -98.5134, 1005.2578);
						SetPlayerFacingAngle(playerid, 88.4822);
						SetPlayerCameraPos(playerid, 214.0843, -98.6197, 1005.2578);
						SetPlayerCameraLookAt(playerid, 218.0859, -98.5134, 1005.2578);
					}
					else if (GetPlayerDistanceToPointEx(playerid, 203.8525, -43.7488, 1001.8047) < 2) //Icone da SubUrban
					{
				    	SetPlayerPos(playerid, 214.8092, -40.8245, 1002.0234);
						SetPlayerFacingAngle(playerid, 92.2639);
						SetPlayerCameraPos(playerid, 211.7819, -40.8823, 1002.0234);
						SetPlayerCameraLookAt(playerid, 214.8092, -40.8245, 1002.0234);
					}
					PraComprarSkins[playerid] = 1;
					SetPlayerVirtualWorld(playerid, playerid+1);
					ShowMenuForPlayer(Roupas, playerid);
					TogglePlayerControllable(playerid, 0);
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Tenha no mínimo $200,00 em mãos para poder ver e comprar as roupas.");
				}
			}
			else
			{
		    	SendClientMessage(playerid, cVERMELHO1, "Você não está em uma loja de roupas.");
			}
		}
		return 1;
	}

	if (strcmp("/aceitar", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
      			SendClientMessage(playerid, cVERMELHO1, "Use /aceitar tipo. Tipos: casa, carro, emprego, dinheiro e protecao.");
				return 1;
			}
			if (strcmp(tmp, "emprego", true) == 0)
			{
				if (GetPlayerDistanceToPointEx(playerid, 378.4161, -118.8032, 1001.4922) < 2) //Pizza
				{
			    	if (dini_Int(nome, "Profissão") == 0)
			    	{
						if (dini_Int(nome, "HabilitaçãoA") == 1)
			        	{
							dini_IntSet(nome, "Profissão", 1);
							TrancarVeiculoPorProf(playerid);
     						SendClientMessage(playerid, cCINZA2, "Agora você é um entregador de pizzas. Use /ajuda para ver seus comandos.");
			        	}
			        	else
			        	{
			            	SendClientMessage(playerid, cVERMELHO1, "Este emprego requer que você tenha habilitação terrestre para dirigir motos.");
			        	}
					}
					else
					{
				    	SendClientMessage(playerid, cVERMELHO1, "Você já tem um emprego.");
					}
				}
				else if (GetPlayerDistanceToPointEx(playerid, 250.0508, 67.8080, 1003.6406) < 2) //Policial
				{
			    	if (dini_Int(nome, "Profissão") == 0)
			    	{
			        	if (dini_Int(nome, "HabilitaçãoA") == 1 && dini_Int(nome, "HabilitaçãoB") == 1 && dini_Int(nome, "FichaCriminal") == 0 && dini_Int(nome, "Porte") == 0 && dini_Int(nome, "Salário") == 50 && dini_Int(nome, "Level") >= 10)
			        	{
							dini_IntSet(nome, "Profissão", 2);
							TrancarVeiculoPorProf(playerid);
							SendClientMessage(playerid, cCINZA2, "Agora você é um policial. Use /ajuda para ver seus comandos.");
   						}
      					else
          				{
          					SendClientMessage(playerid, cVERMELHO1, "Este emprego requer que você tenha habilitação terrestre e aérea, ficha criminal limpa, porte de armas, 50 salários acumulados e level maior que 10.");
              			}
					}
   					else
      				{
        				SendClientMessage(playerid, cVERMELHO1, "Você já tem um emprego.");
       	 			}
       			}
				else if (GetPlayerDistanceToPointEx(playerid, 1783.2684, -1867.9734, 13.5695) < 2) //Taxista
				{
			    	if (dini_Int(nome, "Profissão") == 0)
			    	{
			        	if (dini_Int(nome, "HabilitaçãoA") == 1)
			        	{
			            	dini_IntSet(nome, "Profissão", 3);
			            	TrancarVeiculoPorProf(playerid);
			            	SendClientMessage(playerid, cCINZA2, "Agora você é um taxista. Use /ajuda para ver seus comandos.");
			        	}
			        	else
			        	{
			            	SendClientMessage(playerid, cVERMELHO1, "Este emprego necessita que você tenha habilitação para dirigir.");
			        	}
			    	}
			    	else
			    	{
			        	SendClientMessage(playerid, cVERMELHO1, "Você já tem um emprego.");
					}
				}
				else if (GetPlayerDistanceToPointEx(playerid, 2770.6396, -1628.7191, 12.1775) < 2) //Segurança
				{
			    	if (dini_Int(nome, "Profissão") == 0)
			    	{
			        	if (dini_Int(nome, "HabilitaçãoA") == 1 && dini_Int(nome, "Porte") == 1)
			        	{
			            	dini_IntSet(nome, "Profissão", 4);
			            	TrancarVeiculoPorProf(playerid);
			            	SendClientMessage(playerid, cCINZA2, "Agora você é um segurança. Use /ajuda para ver seus comandos.");
			        	}
			        	else
			        	{
			            	SendClientMessage(playerid, cVERMELHO1, "Este emprego necessita que você tenha habilitação para dirigir e porte de armas.");
			        	}
			    	}
			    	else
			    	{
			        	SendClientMessage(playerid, cVERMELHO1, "Você já tem um emprego.");
					}
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Você não está em um local de um emprego.");
				}
			}
			if (strcmp(tmp, "protecao", true) == 0)
			{
			    if (Proposta[playerid][Ofert] == 1 && Preco != 0)
			    {
					if (dini_Int(NomeDoPlayer(Proposta[playerid][Oferecedor]), "Profissão") == 4)
					{
						SetPlayerArmour(playerid, 50.0);
						GivePlayerMoney(playerid, -Preco);
						GivePlayerMoney(Proposta[playerid][Oferecedor], Preco);
						new msg[256];
						format(msg, sizeof(msg), "Você aceitou um colete do segurança %s e pagou %d por ele.", NomeDoPlayer(Proposta[playerid][Oferecedor]), Preco);
						SendClientMessage(playerid, cCINZA2, msg);
						new msg2[256];
						format(msg2, sizeof(msg2), "O cliente %s aceitou sua proposta e lhe pagou %d pelo colete.", nome, Preco);
						SendClientMessage(Proposta[playerid][Oferecedor], cCINZA2, msg2);
						Proposta[playerid][Ofert] = 0;
						Proposta[playerid][Oferecedor] = INVALID_PLAYER_ID;
						Preco = 0;
					}
					else
					{
						SendClientMessage(playerid, cVERMELHO1, "A oferta que lhe foi oferecida não se trata de uma proteção.");
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, cVERMELHO1, "Nenhum segurança lhe ofereceu proteção.");
			    }
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /aceitar tipo. Tipos: casa, carro, emprego, dinheiro e protecao.");
			}
		}
		return 1;
	}
	
	if (strcmp("/instrucao", cmd, true) == 0)
	{
		if (IsPlayerConnected(playerid))
		{
		    if (dini_Int(nome, "Profissão") == 1)
		    {
		        SendClientMessage(playerid, cAMARELO2, "Instrução - Entregador de pizzas:");
 				SendClientMessage(playerid, cAMARELO1, "/pegarpizza para recarregar sua moto.");
 				SendClientMessage(playerid, cAMARELO1, "/pizza para vender uma pizza à alguém.");
 				SendClientMessage(playerid, cAMARELO1, "Procure pessoas com saúde baixa e lhe ofereca pizzas a preço amigável.");
		    }
		    else if (dini_Int(nome, "Profissão") == 2)
		    {
		        SendClientMessage(playerid, cAMARELO2, "Instrução - Policial:");
 				SendClientMessage(playerid, cAMARELO1, "/multar para aplicar a multa em alguém (multa fixa de $500,00).");
 				SendClientMessage(playerid, cAMARELO1, "/procurar para adicionar alguém à lista de procurados (Para limpar o nível vá até o escritório da delegacia).");
 				SendClientMessage(playerid, cAMARELO1, "/prender para prender alguém (para prender alguém você necessita que esse esteja na lista de procurados.");
 				SendClientMessage(playerid, cAMARELO1, "Mantenha a ordem na cidade. Visite sempre o fórum para ficar por dentro de sua responsabilidade na LSPD.");
		    }
		    else if (dini_Int(nome, "Profissão") == 3)
		    {
		        SendClientMessage(playerid, cAMARELO2, "Instrução - Taxista:");
 				SendClientMessage(playerid, cAMARELO1, "/abrirtaxi para abrir seu táxi para alguém.");
 				SendClientMessage(playerid, cAMARELO1, "/taximetro para ativar o taxímetro.");
 				SendClientMessage(playerid, cAMARELO1, "Procure pessoas andando a pé na cidade e ofereça seus serviços à ela.");
		    }
		    else if (dini_Int(nome, "Profissão") == 4)
		    {
		        SendClientMessage(playerid, cAMARELO2, "Instrução - Segurança:");
 				SendClientMessage(playerid, cAMARELO1, "/colete para vender um colete à alguém.");
 				SendClientMessage(playerid, cAMARELO1, "Você é importante pois ajuda a proteger os cidadãos. Procure por eles e ofereça seus serviços.");
		    }
		}
		return 1;
	}
	
	//--- ITEM ---//

	//--- EMPEGO ---//
	 // OUTRO //
	if (strcmp("/requisitos", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
			if (GetPlayerDistanceToPointEx(playerid, 378.4161, -118.8032, 1001.4922) < 2)
			{
				SendClientMessage(playerid, cAMARELO2, "Entregador de pizza - Requisitos:");
				SendClientMessage(playerid, cAMARELO1, "- Você faz entregas de pizzas para toda cidade.");
				SendClientMessage(playerid, cAMARELO1, "- Salário extra: Dinheiro da venda de cada pizza.");
				SendClientMessage(playerid, cAMARELO1, "- Level necessário: 1.");
				SendClientMessage(playerid, cAMARELO1, "- Itens necessários: Manual da pizzaria.");
            	SendClientMessage(playerid, cAMARELO1, "- Requisitos: Habilitação terrestre.");
				GameTextForPlayer(playerid, "~w~Use~r~/aceitar emprego ~w~para~n~ser um ~y~entregador de pizza", 60000, 3);
			}
			else if (GetPlayerDistanceToPointEx(playerid, 250.0508, 67.8080, 1003.6406) < 2)
			{
		    	SendClientMessage(playerid, cAMARELO2, "Policial - Requisitos:");
				SendClientMessage(playerid, cAMARELO1, "- Você ajuda a manter a ordem na cidade.");
				SendClientMessage(playerid, cAMARELO1, "- Salário extra: Dinheiro seguro do governo.");
				SendClientMessage(playerid, cAMARELO1, "- Level necessário: 10.");
				SendClientMessage(playerid, cAMARELO1, "- Itens necessário: Duas medalhas do mérito.");
            	SendClientMessage(playerid, cAMARELO1, "- Requisitos: Habilitação terrestre e aérea.");
            	SendClientMessage(playerid, cAMARELO1, "- Requisitos: Porte de armas e ficha criminal limpa.");
            	GameTextForPlayer(playerid, "~w~Use~r~/aceitar emprego ~w~para~n~ser um ~y~policial", 60000, 3);
			}
			else if (GetPlayerDistanceToPointEx(playerid, 1783.2684, -1867.9734, 13.5695) < 2)
			{
				SendClientMessage(playerid, cAMARELO2, "Taxista - Requisitos:");
				SendClientMessage(playerid, cAMARELO1, "- Você transporta pessoas por toda cidade.");
				SendClientMessage(playerid, cAMARELO1, "- Salário extra: Dinheiro do taxímetro.");
				SendClientMessage(playerid, cAMARELO1, "- Level necessário: 2.");
				SendClientMessage(playerid, cAMARELO1, "- Itens necessários: Manual dos taxistas.");
            	SendClientMessage(playerid, cAMARELO1, "- Requisitos: Habilitação terrestre.");
				GameTextForPlayer(playerid, "~w~Use~r~/aceitar emprego ~w~para~n~ser um ~y~taxista", 60000, 3);
			}
			else if (GetPlayerDistanceToPointEx(playerid, 2770.6396, -1628.7191, 12.1775) < 2)
			{
				SendClientMessage(playerid, cAMARELO2, "Segurança - Requisitos:");
				SendClientMessage(playerid, cAMARELO1, "- Você proteje locais ou pessoas que te contratem.");
				SendClientMessage(playerid, cAMARELO1, "- Salário extra: Dinheiro da venda dos coletes.");
				SendClientMessage(playerid, cAMARELO1, "- Level necessário: 2.");
				SendClientMessage(playerid, cAMARELO1, "- Itens necessários: Manual do segurança.");
            	SendClientMessage(playerid, cAMARELO1, "- Requisitos: Habilitação terrestre e porte de armas.");
				GameTextForPlayer(playerid, "~w~Use~r~/aceitar emprego ~w~para~n~ser um ~y~seguranca", 60000, 3);
			}
			else if (GetPlayerDistanceToPointEx(playerid, 1471.3594, -1178.0880, 23.9214) < 2)
			{
				SendClientMessage(playerid, cAMARELO2, "Advogado - Requisitos:");
				SendClientMessage(playerid, cAMARELO1, "- Você defende pessoas que te contratem.");
				SendClientMessage(playerid, cAMARELO1, "- Salário extra: Dinheiro das defesas.");
				SendClientMessage(playerid, cAMARELO1, "- Level necessário: 5.");
				SendClientMessage(playerid, cAMARELO1, "- itens necessários: Livro dos advogados.");
            	SendClientMessage(playerid, cAMARELO1, "- Requisitos: Ficha criminal limpa.");
				GameTextForPlayer(playerid, "~w~Use~r~/aceitar emprego ~w~para~n~ser um ~y~advogado", 60000, 3);
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "Você não está em um local de um emprego.");
			}
		}
		return 1;
	}
	 // POLICIAL //
	 /*
    if (strcmp("/render", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (dini_Int(nome, "Profissão") != 2)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Você não é um policial.");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /render id.");
				return 1;
			}
			new plid;
			plid = strval(tmp);
			if (Login[plid] == 1 && IsPlayerConnected(plid))
			{
				if (dini_Int(NomeDoPlayer(plid), "Profissão") != 2 || plid != playerid)
				{
					if (dini_Int(NomeDoPlayer(plid), "Preso") == 0)
					{
    					if (GetDistanceBetweenPlayers(playerid, plid) <= 6)
   						{
   						    if (GetPlayerState(plid) == PLAYER_STATE_ONFOOT)
   						    {
			    				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
   						    	TogglePlayerControllable(plid, 0);

   						    	new msg[256];
 								format(msg, sizeof(msg), "Você rendeu o suspeito %s.", NomeDoPlayer(plid));
								SendClientMessage(playerid, cCINZA2, msg);
								new msg2[256];
								format(msg2, sizeof(msg2), "O policial %s te rendeu.", nome);
								SendClientMessage(plid, cCINZA2, msg2);
							}
						}
						else
						{
		    				SendClientMessage(playerid, cVERMELHO1, "Você está muito longe do suspeito.");
						}
					}
						else
						{
							SendClientMessage(playerid, cVERMELHO1, "O player indicado já está preso.");
						}
					}
					else
					{
						SendClientMessage(playerid, cVERMELHO1, "Você não precisa se multar ou multar outro policial.");
					}
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Este player não necessita ser multado porque não tem nível de procurado menor do que 3 estrelas. Prenda-o.");
				}
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "O player indicado não está conectado ou logado.");
			}
		}
		return 1;
	}*/
	 
	if (strcmp("/multar", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (dini_Int(nome, "Profissão") != 2)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Você não é um policial.");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /multar id.");
				return 1;
			}
			new plid;
			plid = strval(tmp);
			if (Login[plid] == 1 && IsPlayerConnected(plid))
			{
			    if (GetPlayerWantedLevel(plid) >= 0 && GetPlayerWantedLevel(plid) <= 3)
				{
					if (dini_Int(NomeDoPlayer(plid), "Profissão") != 2 || plid != playerid)
					{
						if (dini_Int(NomeDoPlayer(plid), "Preso") == 0)
 						{
                            if (GetDistanceBetweenPlayers(playerid, plid) <= 6)
	    					{
								new msg[256], Estrela = GetPlayerWantedLevel(plid);
								if (Estrela == 0) Multa[plid] = 100;
						    	else if (Estrela == 1) Multa[plid] = 1000;
								else if (Estrela == 2) Multa[plid] = 2000;
					   			else if (Estrela == 3) Multa[plid] = 3000;
								GivePlayerMoney(plid, -Multa[plid]);
								SetPlayerWantedLevel(plid, 0);
								format(msg, sizeof(msg), "Você multou o suspeito %s em $%d,00.", NomeDoPlayer(plid), Multa[plid]);
								SendClientMessage(playerid, cCINZA2, msg);
								new msg2[256];
								format(msg2, sizeof(msg2), "O policial %s te multou em $%d,00.", nome, Multa[plid]);
								SendClientMessage(plid, cCINZA2, msg2);
							}
							else
							{
							    SendClientMessage(playerid, cVERMELHO1, "Você está muito longe do suspeito.");
							}
						}
						else
						{
							SendClientMessage(playerid, cVERMELHO1, "O player indicado já está preso.");
						}
					}
					else
					{
						SendClientMessage(playerid, cVERMELHO1, "Você não precisa se multar ou multar outro policial.");
					}
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Este player não necessita ser multado porque não tem nível de procurado menor do que 3 estrelas. Prenda-o.");
				}
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "O player indicado não está conectado ou logado.");
			}
		}
		return 1;
	}
	
 	if (strcmp("/procurar", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (dini_Int(nome, "Profissão") != 2)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Você não é um policial.");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /procurar id estrela.");
				return 1;
			}
			new plid;
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /procurar id estrela.");
				return 1;
			}
			new estrela;
			estrela = strval(tmp);
			if (Login[plid] == 1 && IsPlayerConnected(plid))
			{
			    if (dini_Int(NomeDoPlayer(plid), "Preso") == 0)
				{
				    new Wanted = GetPlayerWantedLevel(plid);
   					if (estrela == 0 && GetPlayerDistanceToPointEx(playerid, 237.1912, 80.8232, 1005.0391) < 2)
					{
						SetPlayerWantedLevel(plid, 0);
                        new msg[256];
						format(msg, sizeof(msg), "Você limpou o nível de procurado de %s (Nível anterior: %d estrelas).", NomeDoPlayer(plid), Wanted);
						SendClientMessage(playerid, cCINZA2, msg);
						new msg2[256];
						format(msg2, sizeof(msg2), "O policial %s limpou o seu nível de procurado (Nível anterior: %d estrelas).", nome, Wanted);
						SendClientMessage(plid, cCINZA2, msg2);
					    return 1;
					}
				    new v = GetPlayerVehicleID(playerid);
 					if (v == Cop1 || v == Cop2 || v == Cop3 || v == Cop4 || v == Cop5 || v == Cop6 || v == Cop7 || v == Cop8 || v == Cop9 || v == Cop10 || v == Cop11)
					{
						if (dini_Int(NomeDoPlayer(plid), "Profissão") != 2 || plid != playerid)
						{
							if ((estrela <= 0 && GetPlayerDistanceToPointEx(playerid, 237.1912, 80.8232, 1005.0391) > 2) || estrela > 6)
    						{
   								SendClientMessage(playerid, cVERMELHO1, "Use estrelas de 1 à 6. Para limpar o nível de procurado vá até a delegacia.");
    							return 1;
							}
							SetPlayerWantedLevel(plid, estrela);
							dini_IntSet(NomeDoPlayer(plid), "Procurado", estrela);
							new msg[256];
							format(msg, sizeof(msg), "Você mudou o nível de procurado de %s para %d estrelas (Nível anterior: %d estrelas).", NomeDoPlayer(plid), estrela, Wanted);
							SendClientMessage(playerid, cCINZA2, msg);
							new msg2[256];
							format(msg2, sizeof(msg2), "O policial %s mudou seu nível de procurado para %d estrelas (Nível anterior: %d estrelas).", nome, estrela, Wanted);
							SendClientMessage(plid, cCINZA2, msg2);
							new msg3[256];
							format(msg3, sizeof(msg3), "LSPD: O policial %s mudou o nível de procurado de %s para %d estrelas.", nome, NomeDoPlayer(plid), estrela);
							SendClientMessageToAll(cCINZA2, msg3);
						}
						else
						{
	    					SendClientMessage(playerid, cVERMELHO1, "Você não precisa adicionar você mesmo ou um policial aos procurados.");
						}
					}
					else
					{
					    SendClientMessage(playerid, cVERMELHO1, "Esteja em um carro da polícia para mudar o nível de procurado de alguém.");
					}
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "O player indicado já está preso.");
				}
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "O player indicado não está conectado ou logado.");
			}
		}
		return 1;
	}
	
 	if (strcmp("/prender", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (dini_Int(nome, "Profissão") != 2)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Você não é um policial.");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /prender id.");
				return 1;
			}
			new plid;
			plid = strval(tmp);
			if (Login[plid] == 1 && IsPlayerConnected(plid))
			{
			    if (GetPlayerWantedLevel(plid) > 3 && GetPlayerWantedLevel(plid) <= 6)
				{
					if (dini_Int(NomeDoPlayer(plid), "Profissão") != 2 || plid != playerid)
					{
						if (dini_Int(NomeDoPlayer(plid), "Preso") == 0)
 						{
                            if (GetDistanceBetweenPlayers(playerid, plid) <= 6)
	    					{
								new msg[256], Estrela = GetPlayerWantedLevel(plid);
								format(msg, sizeof(msg), "Você prendeu o suspeito %s por %d estrelas.", NomeDoPlayer(plid), Estrela);
								SendClientMessage(playerid, cCINZA2, msg);
								new msg2[256];
								format(msg2, sizeof(msg2), "O policial %s te prendeu por %d estrelas.", nome, Estrela);
								SendClientMessage(plid, cCINZA2, msg2);
								new msg3[256];
								format(msg3, sizeof(msg3), "LSPD: O policial %s prendeu %s por %d estrelas.", nome, NomeDoPlayer(plid), Estrela);
								SendClientMessageToAll(cCINZA2, msg3);
								Prender(plid);
							}
							else
							{
							    SendClientMessage(playerid, cVERMELHO1, "Você está muito longe do suspeito.");
							}
						}
						else
						{
							SendClientMessage(playerid, cVERMELHO1, "O player indicado já está preso.");
						}
					}
					else
					{
						SendClientMessage(playerid, cVERMELHO1, "Você não precisa se prender ou prender outro policial.");
					}
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Este player não necessita ser preso porque não tem nível de procurado maior do que 3 estrelas. Multe-o.");
				}
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "O player indicado não está conectado ou logado.");
			}
		}
		return 1;
	}
	 
	 // TAXISTA //
    if (strcmp("/abrirtaxi", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (dini_Int(nome, "Profissão") != 3)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Você não é um taxista.");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /abrirtaxi id.");
				return 1;
			}
			new plid;
			plid = strval(tmp);
			if (Login[plid] == 1 && IsPlayerConnected(plid))
			{
				new v = GetPlayerVehicleID(playerid);
 				if (v == Taxi1 || v == Taxi2 || v == Taxi3 || v == Taxi4 || v == Taxi5 || v == Taxi6)
				{
					if (dini_Int(NomeDoPlayer(plid), "Profissão") != 3 || plid != playerid)
  					{
						if (GetDistanceBetweenPlayers(playerid, plid) <= 6)
	    				{
							if (GetPlayerState(plid) != PLAYER_STATE_PASSENGER)
	    					{
      							SetVehicleParamsForPlayer(v, plid, 0, 0);
         						new msg[256];
								format(msg, sizeof(msg), "Táxi aberto para o cliente %s. Id do client: %d.", NomeDoPlayer(plid), plid);
								SendClientMessage(playerid, cCINZA2, msg);
    							new msg2[256];
       							format(msg2, sizeof(msg2), "O taxísta %s abriu o táxi para você. Você tem 10 segundos para entrar no táxi.", nome);
								SendClientMessage(plid, cCINZA2, msg2);
								SetTimerEx("Taxi", 10000, 0, "dd", playerid, plid);
								TaxiAberto[plid] = 1;
							}
							else
							{
								SendClientMessage(playerid, cVERMELHO1, "O cliente indicado já está dentro de seu táxi.");
							}
						}
						else
						{
	    					SendClientMessage(playerid, cVERMELHO1, "O cliente indicado está muito longe para você poder abrir o táxi pra ele.");
						}
					}
					else
					{
						SendClientMessage(playerid, cVERMELHO1, "Você não precisa abrir o táxi para um taxista ou para você mesmo.");
					}
				}
				else
				{
   					SendClientMessage(playerid, cVERMELHO1, "Esteja em um táxi para abri-lo para um cliente.");
				}
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "O player indicado não está conectado ou logado.");
			}
		}
		return 1;
	}

    if (strcmp("/jail", cmd, true) == 0)
	{
		SetPlayerPos(playerid, 197.1371,161.2010,1003.0300);
		SetPlayerFacingAngle(playerid, 218.7308);
		SetPlayerInterior(playerid, 10);
		return 1;
	}

  //  AddPlayerClass(61,197.1371,161.2010,1003.0300,218.7308,0,0,0,0,0,0); // pos  jail

	if (strcmp("/taximetro", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (dini_Int(nome, "Profissão") != 3)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Você não é um taxista.");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /taximêtro id.");
				return 1;
			}
			new plid;
			plid = strval(tmp);
			if (Login[plid] == 1 && IsPlayerConnected(plid))
			{
				new v = GetPlayerVehicleID(playerid);
 				if (v == Taxi1 || v == Taxi2 || v == Taxi3 || v == Taxi4 || v == Taxi5 || v == Taxi6)
				{
					if (dini_Int(NomeDoPlayer(plid), "Profissão") != 3 || plid != playerid)
  					{
						if (TaximetroAtivado[plid] == 0)
	    				{
 		    				if (GetPlayerMoney(plid) > 0)
   		    				{
    		    				if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerState(plid) == PLAYER_STATE_PASSENGER)
    		    				{
         							new msg[256];
									format(msg, sizeof(msg), "Você ativou o taximêtro para o cliente %s.", NomeDoPlayer(plid));
									SendClientMessage(playerid, cCINZA2, msg);
    								new msg2[256];
       								format(msg2, sizeof(msg2), "O taxista %s ativou o taximêtro.", nome);
									SendClientMessage(plid, cCINZA2, msg2);
									SetTimerEx("Taximetro", 5000, 0, "dd", playerid, plid);
									TaximetroAtivado[plid] = 1;
								}
								else
								{
		    						SendClientMessage(playerid, cVERMELHO1, "Para ligar o taximêtro, você e seu cliente devem estar juntos dentro de um táxi.");
								}
							}
							else
							{
	    						SendClientMessage(playerid, cVERMELHO1, "O cliente para quem você ligou o taximêtro, não possuí dinheiro para começar a pagar.");
							}
						}
						else
						{
	    					SendClientMessage(playerid, cVERMELHO1, "Você já ativou o taximêtro para o cliente indicado.");
						}
					}
					else
					{
    					SendClientMessage(playerid, cVERMELHO1, "Você não precisa ativar o taximêtro para um taxista ou para você mesmo.");
					}
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Esteja em um táxi para ativar o taximêtro para um cliente.");
				}
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "O player indicado não está conectado ou logado.");
			}
		}
		return 1;
	}
	 // SEGURANÇA //
    if (strcmp("/colete", cmd, true) == 0)
	{
	    if (IsPlayerConnected(playerid))
	    {
	    	if (dini_Int(nome, "Profissão") != 4)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Você não é um segurança.");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /proteger id preço.");
				return 1;
			}
			new plid;
			plid = strval(tmp);
			
			tmp = strtok(cmdtext, idx);
			if (!strlen(tmp))
			{
				SendClientMessage(playerid, cVERMELHO1, "Use /proteger id preço.");
				return 1;
			}
			Preco = strval(tmp);
			if (Preco < 1000 || Preco > 5000)
			{
			    SendClientMessage(playerid, cVERMELHO1, "Use preços maiores que $1000,00 e menores que $5000,00.");
				return 1;
			}
			if (Login[plid] == 1 && IsPlayerConnected(plid))
			{
				if (dini_Int(NomeDoPlayer(plid), "Profissão") != 4 || plid != playerid)
				{
				    if (GetDistanceBetweenPlayers(playerid, plid) <= 6)
				    {
				    	if (Proposta[plid][Ofert] == 0)
				    	{
							if (GetPlayerMoney(plid) >= Preco)
							{
								new msg[256];
								format(msg, sizeof(msg), "Você ofereceu um colete para %s no valor de $%d,00.", NomeDoPlayer(plid), Preco);
								SendClientMessage(playerid, cCINZA2, msg);
								new msg2[256];
								format(msg2, sizeof(msg2), "O segurança %s te ofereceu um colete no valor de $%d,00. Você tem 10 segundos para aceitar (/aceitar protecao).", nome, Preco);
								SendClientMessage(plid, cCINZA2, msg2);
								SetTimerEx("Oferta", 10000, 0, "dd", playerid, plid);
								Proposta[plid][Ofert] = 1; Proposta[plid][Oferecedor] = playerid;
							}
							else
							{
						    	SendClientMessage(playerid, cVERMELHO1, "O dinheiro do player indicado é menor do que o preço que você ofereceu.");
							}
						}
						else
						{
							SendClientMessage(playerid, cVERMELHO1, "O player indicado já têm uma oferta em andamento.");
						}
					}
					else
					{
					    SendClientMessage(playerid, cVERMELHO1, "O cliente indicado es´ta muito longe para você oferecer uma proteção pra ele.");
					}
				}
				else
				{
					SendClientMessage(playerid, cVERMELHO1, "Você não precisa oferecer um colete para um segurança ou para você mesmo.");
				}
			}
			else
			{
				SendClientMessage(playerid, cVERMELHO1, "O player indicado não está conectado ou logado.");
			}
		}
		return 1;
	}
	
	//--- FINAL ---//
    SendClientMessage(playerid, cVERMELHO1, "Comando inexistente. Use /ajuda para obter mais ajuda.");
    //-------------//
	return 0;
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
	if (newstate == PLAYER_STATE_DRIVER)
	{
		new v = GetPlayerVehicleID(playerid);
  		if (v == Taxi1 || v == Taxi2 || v == Taxi3 || v == Taxi4 || v == Taxi5 || v == Taxi6)
  		{
    		if (dini_Int(nome, "Profissão") != 3)
     		{
				RemovePlayerFromVehicle(playerid);
 			}
		}
	}
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
   	new Menu:MenuPropostaSkin = GetPlayerMenu(playerid);
    if (MenuPropostaSkin == Roupas)
	{
    	switch(row)
		{
    		case 0:
			{
				ProximoSkin(playerid);
			}
			case 1:
			{
    			AnteriorSkin(playerid);
			}
			case 2:
			{
				SetPlayerVirtualWorld(playerid, AntWorld[playerid]);
				ConfirmarSkin(playerid);
				TogglePlayerControllable(playerid, 1);
				SetCameraBehindPlayer(playerid);
				PraComprarSkins[playerid] = 0;
				SendClientMessage(playerid, cCINZA2, "Comprou uma skin.");
			}
			case 3:
			{
				SetPlayerVirtualWorld(playerid, AntWorld[playerid]);
				HideMenuForPlayer(Roupas, playerid);
				TogglePlayerControllable(playerid, 1);
				SetCameraBehindPlayer(playerid);
				SetPlayerSkin(playerid, dini_Int(nome, "Skin"));
				PraComprarSkins[playerid] = 0;
			}
		}
	}
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
    if (PraComprarSkins[playerid] == 1)
	{
		PraComprarSkins[playerid] = 0;
    	SetPlayerVirtualWorld(playerid, AntWorld[playerid]);
    	TogglePlayerControllable(playerid, 1);
    	SetCameraBehindPlayer(playerid);
		HideMenuForPlayer(Roupas, playerid);
		SetPlayerSkin(playerid, dini_Int(nome, "Skin"));
	}
	return 1;
}

//--- PLAYER ---//
stock NomeDoPlayer(playerid)
{
	new nick[MAX_PLAYER_NAME];
	GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
	return nick;
}

public LoadPlayer(playerid)
{
    if (dini_Exists(nome))
	{
		GivePlayerMoney(playerid, dini_Int(nome, "Dinheiro") - GetPlayerMoney(playerid));
 		new Float:X = dini_Float(nome, "SpawnX"),
		Float:Y = dini_Float(nome, "SpawnY"),
		Float:Z = dini_Float(nome, "SpawnZ"),
		Float:ang = dini_Float(nome, "SpawnAng"),
		Int = dini_Int(nome, "SpawnInt"),
		Float:health = dini_Float(nome, "Vida");
		SetPlayerArmour(playerid,dini_Float(nome, "Colete"));
		if (health <= 0) SetPlayerHealth(playerid, 100);
		else SetPlayerHealth(playerid, dini_Float(nome, "Vida"));
		SetPlayerWantedLevel(playerid, dini_Int(nome, "Procurado"));
		if (dini_Int(nome, "Preso") == 1)
		{
		    SendClientMessage(playerid, cCINZA2, "Você não cumpriu a pena desde sua última saída.");
			Prender(playerid);
		}
		else
		{
			SetSpawnInfo(playerid, 1, dini_Int(nome, "Skin"), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
			SetPlayerInterior(playerid, Int);
		}
		SpawnPlayer(playerid);
	}
}

//--- GERAL ---//
public minrand(min, max)
{
	return random(max - min) + min;
}

stock GetPlayerDistanceToPointEx(playerid, Float:x2, Float:y2, Float:z2)
{
	new Float:x1, Float:y1, Float:z1, Float:tmpdis;
	GetPlayerPos(playerid, x1, y1, z1);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2, x1)), 2) + floatpower(floatabs(floatsub(y2, y1)), 2)+floatpower(floatabs(floatsub(z2, z1)), 2));
	return floatround(tmpdis);
}

stock GetDistanceBetweenPlayers(playerid, playerid2)
{
	if (GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(playerid2)) return 100;
	new Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:tmpdis;
	GetPlayerPos(playerid, x1, y1, z1);
	GetPlayerPos(playerid2, x2, y2, z2);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2, x1)), 2) + floatpower(floatabs(floatsub(y2, y1)), 2) + floatpower(floatabs(floatsub(z2, z1)), 2));
	return floatround(tmpdis);
}

stock ProximoSkin(playerid)
{
	new nextskin = GetPlayerSkin(playerid) + 1;
	if(nextskin >= 299) nextskin = 0;
	if (SkinValido(nextskin))
	{
		SetPlayerSkin(playerid, nextskin);
	}
	else
	{
		new ns;
		for (new s = nextskin; s < QT_SKIN; s++)
		{
			if (SkinValido(s))
			{
				ns = s;
				break;
			}
		}
		SetPlayerSkin(playerid, ns);
	}
	ShowMenuForPlayer(Roupas, playerid);
}

stock AnteriorSkin(playerid)
{
    new antskin = GetPlayerSkin(playerid) - 1;
	if(antskin <= 0) antskin = 299;
	if (SkinValido(antskin))
	{
		SetPlayerSkin(playerid, antskin);
	}
	else
	{
		new as;
		for (new i = antskin; i > 0; i--)
		{
			if (SkinValido(i))
			{
				as = i;
				break;
			}

 		}
 		SetPlayerSkin(playerid, as);
  	}
	ShowMenuForPlayer(Roupas, playerid);
}


stock ConfirmarSkin(playerid)
{
	RecebeuMenuSkin[playerid] = 0;
 	GivePlayerMoney(playerid,  -200);
  	dini_IntSet(nome, "Skin", GetPlayerSkin(playerid));
  	PraComprarSkins[playerid] = 0;
}

stock SkinValido(skin) // até o 289 inválidos, o resto é de profissões
{
    if (skin==3||skin==4||skin==5||skin==6||skin==8||skin==42||skin==65||skin==74||skin==86||skin==119||skin==149||skin==208||skin==273||skin==289||skin==163||skin==164||skin==165||skin==166||skin==274||skin==275||skin==276||skin==277||skin==278||skin==279||skin==280||skin==281||skin==282||skin==283||skin==284||skin==285||skin==286||skin==287||skin==288||skin==155||skin>=300)
	{
	    return 0;
	}
	else
	{
	    return 1;
	}
}

public LocalInfo()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if (!IsPlayerInAnyVehicle(i))
		{
			if (GetPlayerDistanceToPointEx(i, 378.4161, -118.8032, 1001.4922) < 2) //Pizza
			{
	        	GameTextForPlayer(i, "~r~/requisitos ~w~para~n~ver o emprego", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 250.0508, 67.8080, 1003.6406) < 2) //Policial
			{
                GameTextForPlayer(i, "~r~/requisitos ~w~para~n~ver o emprego", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 1783.2684, -1867.9734, 13.5695) < 2) //Taxista
			{
				GameTextForPlayer(i, "~r~/requisitos ~w~para~n~ver o emprego", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 2770.6396, -1628.7191, 12.1775) < 2) //Segurança
			{
				GameTextForPlayer(i, "~r~/requisitos ~w~para~n~ver o emprego", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 1471.3594, -1178.0880, 23.9214) < 2) //Advogado
			{
				GameTextForPlayer(i, "~r~/requisitos ~w~para~n~ver o emprego", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 1555.4982, -1675.6321, 16.1953) < 2)
			{
				GameTextForPlayer(i, "~w~delegacia ~r~/entrar~n~~w~para entrar", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 2105.4741, -1806.5221, 13.5547) < 2)
			{
            	GameTextForPlayer(i, "~w~pizzaria ~r~/entrar~n~~w~para entrar", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 2244.3235, -1665.5480, 15.4766) < 2)
			{
				GameTextForPlayer(i, "~w~binco ~r~/entrar~n~~w~para entrar", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 2112.8469, -1211.4553, 23.9629) < 2)
			{
				GameTextForPlayer(i, "~w~sub-urban ~r~/entrar~n~~w~para entrar", 100, 1);
			}
			/*if (GetPlayerDistanceToPointEx(i, 1084.1293, -1226.4017, 15.8203) < 2 && EntradaAutoEscola[i] == 0)
			{
				GameTextForPlayer(i, "~w~auto-escola ~r~/entrar~n~~w~para entrar", 100, 1);
	        	EntradaAutoEscola[i] = 1;
			}
			else if (GetPlayerDistanceToPointEx(i, 1084.1293, -1226.4017, 15.8203) > 2)
			{
				if (EntradaAutoEscola[i] == 1)
				{
					EntradaAutoEscola[i] = 0;
				}
			}*/
			if (GetPlayerDistanceToPointEx(i, 1833.7756, -1842.5597, 13.5781) < 2) //69 cents
			{
				GameTextForPlayer(i, "~w~24/7 ~r~/entrar~n~~w~para entrar", 100, 1);
			}
			if (GetPlayerDistanceToPointEx(i, 1352.3735, -1759.2437, 13.5078) < 2) //24/7 lspd
			{
				GameTextForPlayer(i, "~w~24/7 ~r~/entrar~n~~w~para entrar", 100, 1);
			}
		}
	}
	return 0; //RETORNEI MAIS SE DER ERRO EH SOH TIRAR
}

public RetirarJogadorLocal()
{
	for(new i=0; i < MAX_PLAYERS; i++)
	{
	    if (IsPlayerConnected(i))
	    {
	        if (hora < 7 || hora > 22)
	        {
				if (GetPlayerDistanceToPointEx(i, 372.3098, -133.5166, 1001.4922) < 50)
				{
					SendClientMessage(i, cCINZA2, "A pizzaria fechou por hoje. Horário de funcionamento: 7:00 ás 22:00.");
					SetPlayerPos(i, 2103.4600, -1806.5900, 13.5547);
					SetPlayerInterior(i, 0);
					SetPlayerFacingAngle(i, 92.0000);
				}
				else if (GetPlayerDistanceToPointEx(i, 207.6655, -111.2667, 1005.1328) < 50)
				{
					SendClientMessage(i, cCINZA2, "A loja de roupas Binco fechou por hoje. Horário de funcionamento: 7:00 ás 22:00.");
					SetPlayerPos(i, 2244.5847, -1663.2609, 15.4766);
					SetPlayerInterior(i, 0);
					SetPlayerFacingAngle(i, 352.1123);
				}
				else if (GetPlayerDistanceToPointEx(i, 203.7579, -50.6646, 1001.8047) < 50)
				{
					SendClientMessage(i, cCINZA2, "A loja de roupas fechou Sub-Urban por hoje. Horário de funcionamento: 7:00 ás 22:00.");
					SetPlayerPos(i, 2111.6233, -1215.5607, 23.9689);
					SetPlayerInterior(i, 0);
					SetPlayerFacingAngle(i, 179.6053);
				}
			/*	else if (DentroAutoEscola[i] == 1 && (hora < 7 || hora > 22))
				{
					SendClientMessage(i, cCINZA2, "A auto-escola fechou por hoje. Horário de funcionamento: 7:00 ás 22:00.");
					SetPlayerPos(i, 2111.6233, -1215.5607, 23.9689);
					SetPlayerInterior(i, 0);
					SetPlayerFacingAngle(i, 179.6053);
				}*/
			}
		}
	}
	return 0;
}

public Tempo()
{
	SetWorldTime(hora);
	minuto++;
	if (minuto >= 60)
	{
	    minuto = 0;
	    hora++;
	}
 	if (hora >= 24)
	{
		hora = 0;
		dia++;
		new frase[50];
		format(frase, sizeof(frase), "~w~%s", nomedia[dia]);
		GameTextForAll(frase, 5000, 0);
 	}
	if (dia >= 7)
	{
 		dia = 0;
	}
	switch(hora)
	{
	    case 1:
	    {
	        if (dia == 5 && minuto == 1) PayDay();
	    }
	    case 21:
	    {
	        AnuncioPrevisao = 0;
	    }
    	case 22:
    	{
    	    if (AnuncioPrevisao == 0)
    	    {
				/*Clima = random(19);
				SendClientMessageToAll(cCINZA2, FrasePrevisao[Clima]);*/
				AnuncioPrevisao = 1;
				new previsao = minrand(0,5);
				if (previsao == 0)
				{
					SendClientMessageToAll(cCINZA2, "Clima previsto para o dia de amanhã: Dia nublado com forte rajada de vento.");
					clima = 0;
				}
				else if (previsao == 1)
				{
					SendClientMessageToAll(cCINZA2, "Clima previsto para o dia de amanhã: Dia com céu limpo e nuvens claras.");
 					clima = 1;
				}
				else if (previsao == 2)
				{
					SendClientMessageToAll(cCINZA2, "Clima previsto para o dia de amanhã: Dia quente com sol forte.");
					clima = 2;
  				}
				else if (previsao == 3)
				{
					SendClientMessageToAll(cCINZA2, "Clima previsto para o dia de amanhã: Dia frio com forte tempestade.");
					clima = 3;
 				}
			}
 		}
		case 6:
		{
			if (clima == 0) SetWeather(9);
			else if (clima == 1) SetWeather(10);
			else if (clima == 2) SetWeather(11);
			else if (clima == 3) SetWeather(8);
		}
	}
}

stock UtilitariosCriar(pattern[])
{
	dini_Create(pattern);
	dini_IntSet(pattern, "Minuto", 1);
	dini_IntSet(pattern, "Hora",0);
	dini_IntSet(pattern, "Dia", 1);
	hora = 1;
	minuto = 0;
	dia = 1;
}

stock UtilitariosSalvar(pattern[])
{
	dini_IntSet(pattern, "Minuto", minuto);
	dini_IntSet(pattern, "Hora", hora);
	dini_IntSet(pattern, "Dia", dia);
}

stock UtilitariosCarregar(pattern[])
{
	minuto = dini_Int(pattern, "Minuto");
	hora = dini_Int(pattern, "Hora");
	dia = dini_Int(pattern, "Dia");
}

//--- CARRO ---//
stock TrancarVeiculoPorProf(playerid)
{
	for (new i = 0; i < QT_CARRO; i++)
	{
	    if (dini_Int(nome, "Profissão") != 1)
		{
			if (i == Pizza1 || i == Pizza2 || i == Pizza3)
			{
		    	SetVehicleParamsForPlayer(i, playerid, 0, 1);
		    }
		}
  		else
  		{
		    SetVehicleParamsForPlayer(i, playerid, 0, 0);
		}
	    if (dini_Int(nome, "Profissão") != 2)
		{
			if (i == Cop1 || i == Cop2 || i == Cop3 || i == Cop4 || i == Cop5 || i == Cop6 || i == Cop7 || i == Cop8 || i == Cop9 || i == Cop10 || i == Cop11 || i == Cop12)
			{
		    	SetVehicleParamsForPlayer(i, playerid, 0, 1);
		    }
		}
  		else
  		{
		    SetVehicleParamsForPlayer(i, playerid, 0, 0);
		}
		if (dini_Int(nome, "Profissão") != 3)
		{
			if (i == Taxi1 || i == Taxi2 || i == Taxi3 || i == Taxi4 || i == Taxi5 || i == Taxi6)
			{
		    	SetVehicleParamsForPlayer(i, playerid, 0, 1);
		    }
		}
  		else
  		{
		    SetVehicleParamsForPlayer(i, playerid, 0, 0);
		}
	}
}

//--- EMPREGO ---//
 // PAYDAY //
stock PayDay()
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
	    if (IsPlayerConnected(i))
	    {
			if (dini_Int(NomeDoPlayer(i), "Profissão") != 0)
			{
				new money = dini_Int(NomeDoPlayer(i), "Dinheiro");
				GivePlayerMoney(i, money+salario[dini_Int(NomeDoPlayer(i), "Level")]);
				dini_IntSet(NomeDoPlayer(i), "Salário", dini_Int(NomeDoPlayer(i), "Salário")+1);
				new msg[256];
				format(msg, sizeof(msg), "Você recebeu $%d,00. Agora você têm %d salários acumulados.", salario[dini_Int(NomeDoPlayer(i), "Level")], dini_Int(NomeDoPlayer(i), "Salário"));
				SendClientMessage(i, cCINZA2, msg);
				GameTextForPlayer(i, "~g~Dia do Pagamento", 3000, 1);
			}
		}
	}
}
 // POLICIAL //
stock Prender(playerid)
{
	if (dini_Int(nome, "Procurado") > 3 && dini_Int(nome, "Procurado") <= 6)
	{
		Prisao[playerid] = 60000*dini_Int(nome, "Procurado");
		new msg[256];
		format(msg, sizeof(msg), "Você ficará preso por %d minuto(s).", Prisao[playerid]/60000);
		SendClientMessage(playerid, cCINZA2, msg);
		SetPlayerPos(playerid, 262.9540, 78.4339, 1002.0391);
		SetPlayerInterior(playerid, 6);
		SetTimerEx("Livre", Prisao[playerid], 0, "d", playerid);
		dini_IntSet(nome, "Preso", 1);
	}
}

public Livre(playerid)
{
	SendClientMessage(playerid, cCINZA2, "Você foi solto.");
	SetPlayerPos(playerid, 1552.4467, -1674.9890, 16.1953);
	SetPlayerInterior(playerid, 0);
	SetPlayerFacingAngle(playerid, 90.0000);
	dini_IntSet(NomeDoPlayer(playerid), "Preso", 0);
	SetPlayerWantedLevel(playerid, 0);
	dini_IntSet(NomeDoPlayer(playerid), "Prourado", 0);
}
 // TAXISTA //
public Taxi(taxista, passageiro)
{
	if (TaxiAberto[passageiro] == 1 && GetPlayerState(passageiro) ==  PLAYER_STATE_ONFOOT)
	{
    	SendClientMessage(passageiro, cCINZA2, "Você demorou demais para entrar no táxi e ele foi trancado novamente.");
    	SendClientMessage(taxista, cCINZA2, "O seu cliente demorou demais pra entrar no seu táxi e ele foi trancado novamente.");
    	TrancarVeiculoPorProf(passageiro);
		TaxiAberto[passageiro] = 0;
	}
	else
	{
	    TrancarVeiculoPorProf(passageiro);
		TaxiAberto[passageiro] = 0;
	}
}

public Taximetro(taxista, passageiro)
{
	if (TaximetroAtivado[passageiro] == 1 && GetPlayerState(passageiro) == PLAYER_STATE_PASSENGER && GetPlayerState(taxista) == PLAYER_STATE_DRIVER)
	{
	    if (GetPlayerMoney(passageiro) > PrecoCorrida[passageiro] + 2)
		{
		    PrecoCorrida[passageiro] = PrecoCorrida[passageiro] + 1;
    		new msg[256];
			format(msg, sizeof(msg), "O preço que o taximêtro marca agora é de $%d,00.", PrecoCorrida[passageiro]);
			SendClientMessage(taxista, cCINZA2, msg);
			SendClientMessage(passageiro, cCINZA2, msg);
    		SetTimerEx("Taximetro", 5000, 0, "dd", taxista, passageiro);
		}
		else
		{
			GivePlayerMoney(taxista, PrecoCorrida[passageiro]);
			GivePlayerMoney(passageiro, 0-PrecoCorrida[passageiro]);
			new msg2[256];
			format(msg2, sizeof(msg2), "O cliente %s pagou o preço de $%d,00 até aqui porque não tinha dinheiro para continuar.", NomeDoPlayer(passageiro), PrecoCorrida[passageiro]);
			SendClientMessage(taxista, cCINZA2, msg2);
			new msg3[256];
			format(msg3, sizeof(msg3), "Você pagou o preço de $%d,00 ao taxista %s até aqui porque não tinha dinheiro para continuar.", PrecoCorrida[passageiro], NomeDoPlayer(taxista));
			SendClientMessage(passageiro, cCINZA2, msg3);
			TaximetroAtivado[passageiro] = 0;
			PrecoCorrida[passageiro] = 0;
			TrancarVeiculoPorProf(passageiro);
			RemovePlayerFromVehicle(passageiro);
		}
	}
	else
	{
		GivePlayerMoney(taxista, PrecoCorrida[passageiro]);
		GivePlayerMoney(passageiro, 0-PrecoCorrida[passageiro]);
		new msg2[256];
		if (GetPlayerState(passageiro) == PLAYER_STATE_ONFOOT)
		{
			format(msg2, sizeof(msg2), "O cliente %s abandonou o táxi e pagou o preço de $%d,00.", NomeDoPlayer(passageiro), PrecoCorrida[passageiro]);
			SendClientMessage(taxista, cCINZA2, msg2);
			new msg3[256];
			format(msg3, sizeof(msg3), "Você abandonou o táxi e pagou ao taxista %s o preço de $%d,00.", NomeDoPlayer(taxista), PrecoCorrida[passageiro]);
			SendClientMessage(passageiro, cCINZA2, msg3);
			TrancarVeiculoPorProf(passageiro);
		}
		else if (GetPlayerState(taxista) == PLAYER_STATE_ONFOOT)
		{
		    format(msg2, sizeof(msg2), "Você abandonou o seu táxi e recebeu o preço de $%d,00 do cliente %s.", PrecoCorrida[passageiro], NomeDoPlayer(passageiro));
			SendClientMessage(taxista, cCINZA2, msg2);
			new msg3[256];
			format(msg3, sizeof(msg3), "O taxista %s abandonou o táxi e você pagou $%d,00.", NomeDoPlayer(taxista), PrecoCorrida[passageiro]);
			SendClientMessage(passageiro, cCINZA2, msg3);
			TrancarVeiculoPorProf(passageiro);
		}
		TaximetroAtivado[passageiro] = 0;
		PrecoCorrida[passageiro] = 0;
	}
}
 // SEGURANÇA //
public Oferta(seguranca, cliente)
{
	if (Proposta[cliente][Ofert] == 1 && Proposta[cliente][Oferecedor] != INVALID_PLAYER_ID)
	{
    	SendClientMessage(cliente, cCINZA2, "Você demorou demais para aceitar a oferta e ela foi cancelada.");
    	SendClientMessage(seguranca, cCINZA2, "O seu cliente demorou demais para aceitar a oferta e ela foi cancelada.");
		Proposta[cliente][Ofert] = 0;
		Proposta[cliente][Oferecedor] = INVALID_PLAYER_ID;
	}
}

//--- TUTORIAL ---//
public Tutorial(playerid)
{
	for (new c = 0; c < 10; c++)
	{
 		SendClientMessage(playerid, cBRANCO, " ");
	}
	SendClientMessage(playerid, cAMARELO2, "Como ganhar dinheiro:");
	SendClientMessage(playerid, cAMARELO1, "Existem empregos espalhados por toda San Andreas. Os empregos estão indicados por um ícone amarelo no radar.");
	SendClientMessage(playerid, cAMARELO1, "Os empregos estão marcados também por um ícone de informação. Use o comando /ajuda para obter ajuda.");
	SendClientMessage(playerid, cAMARELO1, "Se você ficar perdido inicialmente, vá até uma 24/7 e compre um mapa.");
	SetTimerEx("Tutorial2", 20000, 0, "d", playerid);
}

public Tutorial2(playerid)
{
	for (new c = 0; c < 10; c++)
	{
 		SendClientMessage(playerid, cBRANCO, " ");
	}
	SendClientMessage(playerid, cAMARELO2, "Polícia:");
	SendClientMessage(playerid, cAMARELO1, "Existem vários empregos incluíndo o de policial. O policial existe para fiscalizar a cidade e manter a ordem.");
	SendClientMessage(playerid, cAMARELO1, "Existem leis a serem cumpridas. A infração pode lhe acarretar em multa fixa de $500,00 ou em até prisão. Veja as leis:");
	SendClientMessage(playerid, cAMARELO1, "- No trânsito: Dirija sempre nas ruas e em sua faixa de direção. Não suba nas calçadas e nem atropele os cidadãos.");
	SendClientMessage(playerid, cAMARELO1, "Para dirigir um veículos, você deverá obter uma habilitação em uma auto-escola. ");
	SendClientMessage(playerid, cAMARELO1, "- Nas ruas: Seja um cidadão civilizado. Ande nas calçadas e nunca passe na rua quando estiver a ver um carro.");
	SendClientMessage(playerid, cAMARELO1, "Caso você veja algum crime ou infração nas leis, ligue para polícia usando /ligar 190. Veja mais em nosso fórum.");
	SetPlayerCameraPos(playerid, 1515.3494, -1642.0249, 19.2422);
	SetPlayerCameraLookAt(playerid, 1546.2871, -1675.2472, 16.0250);
	SetTimerEx("Tutorial3", 40000, 0, "d", playerid);
}

public Tutorial3(playerid)
{
	for (new c = 0; c < 10; c++)
	{
 		SendClientMessage(playerid, cBRANCO, " ");
	}
	SendClientMessage(playerid, cAMARELO2, "Chat:");
	SendClientMessage(playerid, cAMARELO1, "Para maior organização, o chat só aparece para players que estejam perto de você. Caso queira falar com alguém que esteja");
	SendClientMessage(playerid, cAMARELO1, "longe, vá até uma 24/7 e compre um celular. Você deverá sempre conversar no chat sobre coisas dentro do jogo. Nunca assuntos");
	SendClientMessage(playerid, cAMARELO1, "aleatórios. Se você tem level baixo e tem alguma dúvida no jogo, você poderá usar o chat de novatos: /n. Para falar com os");
	SendClientMessage(playerid, cAMARELO1, "administradores use /t.");
	SetPlayerCameraPos(playerid, 2140.8413, -1040.2574, 67.2422);
	SetPlayerCameraLookAt(playerid,	2139.7310, -1041.4304, 67.2422);
	SetTimerEx("Tutorial4", 30000, 0, "d", playerid);
}

public Tutorial4(playerid)
{
	for (new c = 0; c < 10; c++)
	{
 		SendClientMessage(playerid, cBRANCO, " ");
	}
	SendClientMessage(playerid, cAMARELO1, "Tenha um bom jogo! Acesse paradiserp.7forum.net e adicione o ip prserver.no-ip.info aos favoritos.");
	FazendoTutorial[playerid] = 0;
	TrancarVeiculoPorProf(playerid);
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, 1000);
}
