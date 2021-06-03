#include <a_samp>
#include <core>
#include <float>

new glob0;

new glob4;

new glob8[100];

new glob198[100];

new glob328[100];

new glob4B8[100];

new glob648[100];

new glob7D8[100];

new glob968[100];

new globAF8[100];

new globC88[100];

new globE18[100];

new globFA8[100];

new glob1138[100];

new glob12C8[100];

new glob1458[100][1];

new glob1A5E8[100] = { 400, 492, 584, 676, 768, 860, 952, 1044, 1136, 1228, 1320, 1412, 1504, 1596, 1688, 1780, 1872, 1964, 2056, 2148, 2240, 2332, 2424, 2516, 2608, 2700, 2792, 2884, 2976, 3068, 3160, 3252, 3344, 3436, 3528, 3620, 3712, 3804, 3896, 3988, 4080, 4172, 4264, 4356, 4448, 4540, 4632, 4724, 4816, 4908, 5000, 5092, 5184, 5276, 5368, 5460, 5552, 5644, 5736, 5828, 5920, 6012, 6104, 6196, 6288, 6380, 6472, 6564, 6656, 6748, 6840, 6932, 7024, 7116, 7208, 7300, 7392, 7484, 7576, 7668, 7760, 7852, 7944, 8036, 8128, 8220, 8312, 8404, 8496, 8588, 8680, 8772, 8864, 8956, 9048, 9140, 9232, 9324, 9416, 9508 };

new glob1CCF8[100];

new glob1CE88[100];

new glob1D018[100];

new glob1D1A8[100];

new glob1D338[100];

new glob1D4C8[100];

new glob1D658[100];

new glob1D7E8;

new glob1D7EC[7] = { 28, 40, 52, 64, 76, 88, 100 };

new glob1D878[8] = { 32, 44, 56, 68, 80, 92, 104, 116 };

new glob1D918[4] = { 16, 28, 40, 52 };

new Float:glob1D968[4][3] = {
	{ 1022.7695, -1122.4977, 23.8715 },
	{ 1721.8377, -1719.0126, 13.5346 },
	{ 2503.1577, -1756.0134, 13.4048 },
	{ 398.1676, -1805.8552, 7.8379 }
};


function8(Float:arg0, Float:arg1)
{
	return 0 <= floatcmp(arg0, arg1);
}

function48(Float:arg0, Float:arg1)
{
	return 0 >= floatcmp(arg0, arg1);
}

function88(Float:arg0, arg1)
{
	return 0 >= floatcmp(arg0, arg1);
}

public SendPlayerFormattedText(playerid, arg1, Menu:arg2, arg3)
{
	new var0[256];
	format(var0, 256, arg2, arg3);
	SendClientMessage(playerid, arg1, var0);
	return 0;
}

public SendAllFormattedText(arg0, Menu:arg1, arg2)
{
	new var0[256];
	format(var0, 256, arg1, arg2);
	SendClientMessageToAll(0xFFFF00AA, var0);
	return 0;
}

function224(arg0, &arg1)
{
	new var0 = strlen(arg0);
	while(arg1 < var0 && arg0[arg1] <= 32)
	{
		arg1++;
	}
	new var1 = arg1;
	new var2[20];
	while(arg1 < var0 && arg0[arg1] > 32 && arg1 - var1 < 19)
	{
		var2[arg1 - var1] = arg0[arg1];
		arg1++;
	}
	var2[arg1 - var1] = 0;
	return var2;
}

function4F0(arg0)
{
	for(new var0 = 0, new var1, new var2 = arg0, new var3 = 4, strlen(arg0), var1 = strlen(arg0); var0 < var1; var0++)
	{
		if(arg0[var0] > 57 || arg0[var0] < 48)
		{
			return 0;
		}
	}
	return 1;
}

main()
{
	print("\n----------------------------------");
	print("          RPG Mode\t\t          ");
	print("       by: SolidNuts & Hitman       ");
	print("----------------------------------\n");
	return 0;
}

public OnGameModeInit()
{
	SetGameModeText("RPG - bL&SN");
	ShowPlayerMarkers(true);
	ShowNameTags(true);
	AddPlayerClass(0, -1958.5108, 293.6747, 35.4687, 90.0, 0, 0, 0, 0, 0, 0);
	glob4++;
	SetHomeCars();
	glob1D7E8 = 12;
	SetTimer("RPGScoreUpdate", 1000, true);
	SetTimer("AreasUpdate", 1100, true);
	SetTimer("TaxiTimer", 5000, true);
	SetTimer("HourTimer", 60000, true);
	SetTimer("CheckFuel", 60000, true);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid, 258.4892, -41.4008, 1002.0233);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid, 256.0815, -43.0476, 1003.0233);
	SetPlayerCameraLookAt(playerid, 258.4892, -41.4008, 1002.0233);
	return 0;
}

public IsPlayerInArea(playerid, Float:arg1)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	if(function8(var0, arg1) && function48(var0, arg1 + 4) && function8(var1, arg1 + 8) && function48(var1, arg1 + 12))
	{
		return 1;
	}
	return 0;
}

public AreasUpdate()
{
	for(new var0 = 0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			new var1 = 0;
			while(++var1 < 4)
			{
				if(IsPlayerInArea(var0, glob1D918[var1]))
				{
					if(glob4B8[var0] != var1)
					{
						DisablePlayerCheckpoint(var0);
						SetPlayerCheckpoint(var0, glob1D968[var1][0], glob1D968[var1][1], glob1D968[var1][2], 2.0);
						glob4B8[var0] = var1;
					}
				}
				else if(glob4B8[var0] == var1)
				{
					DisablePlayerCheckpoint(var0);
					glob4B8[var0] = 999;
				}
			}
			for(new var1 = 0; var1 < 8; var1++)
			{
				if(IsPlayerInArea(var0, glob1D878[var1]))
				{
					if(IsPlayerAdmin(var0) || glob328[var0] == 99 || glob328[var0] == 12)
					{
					}
					else
					{
						SetPlayerHealth(var0, 0.0);
						SendClientMessage(var0, 0xAA3333AA, "Você entrou em uma área militar e foi morto pois pensaram que você era um bandido.");
					}
				}
			}
		}
	}
	return 1;
}

public CheckFuel()
{
	for(new var0 = 0; var0 < 100; var0++)
	{
		new var1[32];
		if(GetPlayerState(var0) == 2)
		{
			if(1 <= globE18[var0])
			{
				globE18[var0]--;
				format(var1, 32, "~w~Gasolina ->~r~%d", 3608);
				GameTextForPlayer(var0, var1, 500, 1);
			}
			else
			{
				RemovePlayerFromVehicle(var0);
				SendClientMessage(var0, 0xAA3333AA, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
			}
			if(26 <= globE18[var0])
			{
				format(var1, 32, "~w~Gasolina ->%d", 3608);
				GameTextForPlayer(var0, var1, 500, 1);
			}
		}
	}
	return 1;
}

public HourTimer()
{
	if(glob1D7E8 < 23)
	{
		SetWorldTime(glob1D7E8);
	}
	else
	{
		glob1D7E8 = 1;
		SetWorldTime(glob1D7E8);
		for(new var0 = 0; var0 < 100; var0++)
		{
			if(glob328[var0] == 1)
			{
				glob198[var0] = glob198[var0] + 350;
				SendClientMessage(var0, 0xFFFF00AA, "Seu seguro desemprego foi depositado: $350");
			}
			if(glob328[var0] == 2)
			{
				glob198[var0] = glob198[var0] + 900;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário da cooperativa foi depositado: $900");
			}
			if(glob328[var0] == 3 || glob328[var0] == 4 || glob328[var0] == 15)
			{
				glob198[var0] = glob198[var0] + 200;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $200");
			}
			if(glob328[var0] == 6)
			{
				glob198[var0] = glob198[var0] + 850;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $850");
			}
			if(glob328[var0] == 7)
			{
				glob198[var0] = glob198[var0] + 3500;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário foi depositado: $3500");
			}
			if(glob328[var0] == 8)
			{
				glob198[var0] = glob198[var0] + 800;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $800");
			}
			if(glob328[var0] == 9)
			{
				glob198[var0] = glob198[var0] + 600;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $600");
			}
			if(glob328[var0] == 10 || glob328[var0] == 11)
			{
				glob198[var0] = glob198[var0] + 1200;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário foi depositado: $1200");
			}
			if(glob328[var0] == 12)
			{
				glob198[var0] = glob198[var0] + 3000;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário foi depositado: $3000");
			}
			if(glob328[var0] == 14)
			{
				glob198[var0] = glob198[var0] + 750;
				SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $750");
			}
		}
	}
	for(new var0 = 0; var0 < 100; var0++)
	{
		if(globAF8[var0])
		{
			globAF8[var0] = globAF8[var0] - 1;
		}
		else
		{
			if(glob648[var0] == 1)
			{
				new var1[256];
				glob648[var0] = 0;
				RLogout(var0);
				RReadPlayerInfo(var0, var1);
				SendClientMessage(var0, 0xFFFF00AA, "Você foi solto por agora, não cometa mais crimes se não irá pagar novamente.");
			}
			if(globC88[var0])
			{
				if(IsPlayerInArea(var0, glob1D7EC[0]))
				{
					new var1 = random(20) + 10;
					new var2[256];
					format(var2, 256, "Sua rede voltou, sua pescaria lhe rendeu: $%d", var1);
					SendClientMessage(var0, 0x33AA33AA, var2);
					glob8[var0] = glob8[var0] + var1;
					GivePlayerMoney(var0, var1);
					globC88[var0] = 0;
				}
				else
				{
					CErrorMessage(var0, "Sua rede estava voltando e você saiu da área de pesca.");
					CErrorMessage(var0, "Que pena, você perdeu o dinheiro!");
					globC88[var0] = 0;
				}
			}
		}
		if(1 < glob7D8[var0])
		{
			glob7D8[var0] = glob7D8[var0] - 1;
		}
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);
	GameTextForPlayer(playerid, "~g~Please, login or register - Coders: SolidNuts & Luigui", 5000, 3);
	return 1;
}

public OnGameModeExit()
{
	for(new var0 = 0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			if(strlen(glob1458[var0]))
			{
				RSavePlayerInfo(var0);
			}
		}
	}
	return 1;
}

function2148(arg0, &arg1)
{
	new var0 = strlen(arg0);
	while(arg1 < var0 && arg0[arg1] <= 32)
	{
		arg1++;
	}
	new var1 = arg1;
	new var2[256];
	while(arg1 < var0 && arg1 - var1 < 255)
	{
		var2[arg1 - var1] = arg0[arg1];
		arg1++;
	}
	var2[arg1 - var1] = 0;
	return var2;
}

public Float:GetDistanceBetweenPlayers(playerid, playerid2)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0, Float:var5 = 0.0;
	if(!IsPlayerConnected(playerid) || !IsPlayerConnected(playerid2))
	{
		return -1.0;
	}
	GetPlayerPos(playerid, var0, var1, var2);
	GetPlayerPos(playerid2, var3, var4, var5);
	return floatsqroot(floatpower(floatabs(var3 - var0), 2.0) + floatpower(floatabs(var4 - var1), 2.0) + floatpower(floatabs(var5 - var2), 2.0));
}

public RPGScoreUpdate()
{
	new var0 = 0;
	new var1[24];
	for(new var2 = 0; var2 < 100; var2++)
	{
		if(IsPlayerConnected(var2))
		{
			GetPlayerName(var2, var1, 24);
			var0 = GetPlayerMoney(var2);
			SetPlayerScore(var2, var0);
			if(var0 > glob0)
			{
				glob0 = var0;
			}
		}
	}
	return 0;
}

public OnPlayerConnect(playerid)
{
	new var0[24];
	GameTextForPlayer(playerid, "Welcome to ~r~RPG! - Coders: SolidNuts & Luigui", 5000, 6);
	SendClientMessage(playerid, 0xFFFF00AA, "RPG Mode");
	SendClientMessage(playerid, 0xFFFF00AA, "Para ajuda inicial digite /ajuda");
	SendClientMessage(playerid, 0xFFFF00AA, "Para comandos do rpg digite /rajuda");
	SendClientMessage(playerid, 0xFFFF00AA, "Faça login (/rlogin) ou se registre (/rregister)");
	SetPlayerColor(playerid, 0xAFAFAFAA);
	GetPlayerName(playerid, var0, 24);
	glob1D658[playerid] = 999;
	glob1D4C8[playerid] = 999;
	glob1D018[playerid] = 0;
	glob7D8[playerid] = 1;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(strlen(glob1458[playerid]))
	{
		RSavePlayerInfo(playerid);
		glob198[playerid] = 0;
		glob8[playerid] = 0;
		glob1CCF8[playerid] = 0;
		glob328[playerid] = 0;
		glob648[playerid] = 0;
		globAF8[playerid] = 0;
		glob968[playerid] = 0;
		globC88[playerid] = 0;
		glob7D8[playerid] = 0;
		globFA8[playerid] = 0;
		glob1138[playerid] = 0;
		glob12C8[playerid] = 0;
		glob1D1A8[playerid] = 0;
		glob1D338[playerid] = 0;
		glob1D658[playerid] = 999;
		glob1D4C8[playerid] = 999;
		glob1D018[playerid] = 0;
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(!glob328[playerid])
	{
		SetPlayerColor(playerid, 0xAFAFAFAA);
	}
	if(glob328[playerid] == 1)
	{
		SetPlayerColor(playerid, 0x666666AA);
	}
	if(glob328[playerid] == 2)
	{
		SetPlayerColor(playerid, 0xFFFF00AA);
	}
	if(glob328[playerid] == 3)
	{
		SetPlayerColor(playerid, 0x009900AA);
	}
	if(glob328[playerid] == 4)
	{
		SetPlayerColor(playerid, 0xDEB887AA);
	}
	if(glob328[playerid] == 5)
	{
		SetPlayerColor(playerid, 0xAA3333AA);
	}
	if(glob328[playerid] == 6)
	{
		SetPlayerColor(playerid, 0xF08080AA);
	}
	if(glob328[playerid] == 7)
	{
		SetPlayerColor(playerid, 0x7FFF00AA);
	}
	if(glob328[playerid] == 8)
	{
		SetPlayerColor(playerid, 0xADD8E6AA);
	}
	if(glob328[playerid] == 9)
	{
		SetPlayerColor(playerid, 0xFF9900AA);
	}
	if(glob328[playerid] == 10)
	{
		SetPlayerColor(playerid, 0x0000FFAA);
	}
	if(glob328[playerid] == 11)
	{
		SetPlayerColor(playerid, 0x00CED3AA);
	}
	if(glob328[playerid] == 12)
	{
		SetPlayerColor(playerid, 0x00C7FFAA);
	}
	if(glob328[playerid] == 14)
	{
		SetPlayerColor(playerid, 0xE9967AAA);
	}
	if(glob328[playerid] == 15)
	{
		SetPlayerColor(playerid, 0xFF0000AA);
	}
	if(glob328[playerid] == 16)
	{
		SetPlayerColor(playerid, 0xF4A460AA);
	}
	if(glob328[playerid] == 17)
	{
		SetPlayerColor(playerid, 0xF5F5DCAA);
	}
	if(glob328[playerid] == 99)
	{
		SetPlayerColor(playerid, 0x33AA33AA);
	}
	printf("OnPlayerSpawn(%d)", playerid);
	if(glob648[playerid])
	{
		SetPlayerInterior(playerid, 6);
		SetSpawnInfo(playerid, 0, glob1CE88[playerid], 262.954, 78.4338, 1001.0391, 270.0, 0, 0, 0, 0, 0, 0);
		TogglePlayerControllable(playerid, false);
	}
	else
	{
		SetPlayerInterior(playerid, 0);
	}
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, glob8[playerid]);
	if(!strlen(glob1458[playerid]))
	{
		SetPlayerPos(playerid, -1958.5108, 293.6747, 35.4687);
		TogglePlayerControllable(playerid, false);
	}
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

public OnPlayerText(playerid, text)
{
	return 1;
}

public OnPlayerInfoChange(playerid)
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	new var0 = 0;
	for(new var1 = 0; var1 < 100; var1++)
	{
		if(GetPlayerState(var1) == 2 && glob1D018[var1] && IsPlayerInVehicle(var1, vehicleid))
		{
			var0 = var1;
		}
	}
	if(glob1D018[var0])
	{
		if(20 <= GetPlayerMoney(playerid))
		{
			GivePlayerMoney(playerid, -20);
			GivePlayerMoney(var0, 20);
			SendClientMessage(playerid, 0x0000FFAA, "Boa viagem");
			SendClientMessage(var0, 0x0000FFAA, "Mais um entrou no onibus");
		}
		else
		{
			RemovePlayerFromVehicle(playerid);
			SendClientMessage(playerid, 0x0000FFAA, "O preço da passagem eh $20");
		}
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(999 != glob1D658[playerid])
	{
		new var0 = 0;
		SendClientMessage(playerid, 0x33AA33AA, "Taxi pago.");
		SendClientMessage(glob1D658[playerid], 0xAA3333AA, "Você recebeu o valor da corrida até aqui.");
		var0 = glob1D338[glob1D658[playerid]];
		GivePlayerMoney(playerid, 0 - var0);
		glob8[playerid] = glob8[playerid] - var0;
		GivePlayerMoney(glob1D658[playerid], var0);
		glob8[glob1D658[playerid]] = glob8[glob1D658[playerid]] + var0;
		glob1D1A8[glob1D658[playerid]] = 0;
		glob1D338[glob1D658[playerid]] = 0;
		glob1D4C8[glob1D658[playerid]] = 999;
		glob1D658[playerid] = 999;
	}
	if(glob1D018[playerid])
	{
		glob1D018[playerid] = 0;
		SendAllFormattedText(playerid, "O ônibus número %d saiu de circulação", playerid);
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == 2)
	{
		if(10 <= glob7D8[playerid])
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você está meio bêbado, não deveria dirigir.");
		}
	}
	new var0[32];
	if(newstate == 2)
	{
		if(1 <= globE18[playerid])
		{
			globE18[playerid]--;
			format(var0, 32, "~w~Gasolina ->~r~%d", 3608);
			GameTextForPlayer(playerid, var0, 500, 1);
		}
		else
		{
			RemovePlayerFromVehicle(playerid);
			SendClientMessage(playerid, 0xAA3333AA, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
		}
		if(51 <= globE18[playerid])
		{
			format(var0, 32, "~w~Gasolina ->%d", 3608);
			GameTextForPlayer(playerid, var0, 500, 1);
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	SendClientMessage(playerid, 0x33AA33AA, "Você entrou no banco.");
	SendClientMessage(playerid, 0x33AA33AA, "Para visualizar os comandos digite /banco");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(999 != glob1D4C8[playerid])
	{
		SendClientMessage(playerid, 0xAA3333AA, "Você Matou o seu cliente e por isso não recebeu nada.");
		SendClientMessage(glob1D658[playerid], 0xAA3333AA, "Você morreu e por isso não pagou nada ao taxista.");
		glob1D1A8[glob1D658[playerid]] = 0;
		glob1D338[glob1D658[playerid]] = 0;
		glob1D4C8[glob1D658[playerid]] = 999;
		glob1D658[playerid] = 999;
	}
	if(glob648[playerid])
	{
		SetPlayerInterior(playerid, 6);
		SetSpawnInfo(playerid, 0, glob1CE88[playerid], 262.954, 78.4338, 1001.0391, 270.0, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
		TogglePlayerControllable(playerid, false);
	}
	else
	{
		SetPlayerInterior(playerid, 0);
	}
	if(glob968[playerid])
	{
		new var0[256];
		glob968[playerid] = 0;
		glob648[playerid] = 1;
		globAF8[playerid] = 5;
		RLogout(playerid);
		SetPlayerHealth(playerid, 0.0);
		RReadPlayerInfo(playerid, var0);
		TogglePlayerControllable(playerid, false);
		SendClientMessage(playerid, 0xAA3333AA, "Você estava sendo perseguido por policiais, eles acharam você muito ferido e te prenderam.");
		SendClientMessage(playerid, 0xAA3333AA, "Você cometeu algum crime e por isto está preso, você ficará 5 horas aí dentro");
		SendClientMessage(playerid, 0xAA3333AA, "(Lembrete: Cada hora no jogo equivale a um minuto real).");
	}
	new var0 = 0;
	if(killerid == 255)
	{
		SendDeathMessage(255, playerid, reason);
	}
	else
	{
		SendDeathMessage(killerid, playerid, reason);
		SetPlayerScore(killerid, GetPlayerScore(killerid) + 1);
		var0 = GetPlayerMoney(playerid);
		if(0 < var0)
		{
			GivePlayerMoney(killerid, var0);
			glob8[killerid] = glob8[killerid] + var0;
		}
		else
		{
		}
	}
	ResetPlayerMoney(playerid);
	if(strlen(glob1458[playerid]))
	{
		glob8[playerid] = 0;
	}
	return 1;
}

public SetHomeCars()
{
	new File:var0 = 0, var1[256], var2[7][256], var3 = 0;
	var0 = fopen("rcars.lgp", 0);
	while(fread(var0, var1))
	{
		var3 = 0;
		if(strlen(var1))
		{
			new var4 = 0;
			while(++var4 <= 6)
			{
				var2[var4] = function224(var1, var3);
			}
			AddStaticVehicle(strval(var2[0]), floatstr(var2[1]), floatstr(var2[2]), floatstr(var2[3]), floatstr(var2[4]), strval(var2[5]), strval(var2[6]));
			glob4++;
		}
	}
	fclose(var0);
	printf("\nRPG Cars added with success");
	return 1;
}

public SetHomeCarToFile(playerid, arg1, arg2, arg3, arg4, arg5)
{
	if(!IsPlayerInAnyVehicle(playerid))
	{
		SendClientMessage(playerid, 0xAA3333AA, "Você não está em nenhum veículo e assim não pode setar um carro.");
		return 1;
	}
	new File:var0 = 0, var1[256], Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0;
	GetPlayerPos(playerid, var2, var3, var4);
	var0 = fopen("rcars.lgp", 3);
	format(var1, 256, "%d %f %f %f %f %d %d //%s\r\n", arg1, var2, var3, var4, arg2, arg4, arg5, arg3);
	fwrite(var0, var1);
	fclose(var0);
	SendClientMessage(playerid, 0x33AA33AA, "Carro salvo");
	return 1;
}

public fSeekL(File:arg0, arg1, arg2)
{
	new var0 = 0;
	while(fread(arg0, arg2))
	{
		var0 = 0;
		if(!strcmp(function224(arg2, var0), arg1))
		{
			return 1;
		}
	}
	return 0;
}

public RReadPlayerInfo(playerid, arg1)
{
	new File:var0 = 0;
	new var1[24], var2[256], var3 = 0, var4[16][64];
	new var5[256];
	GetPlayerName(playerid, var1, 24);
	format(var5, 256, "%s.txt", var1);
	if(!fexist(var5))
	{
		SendClientMessage(playerid, 0xAA3333AA, "Você não está registrado.");
		return 1;
	}
	var0 = fopen(var5, 0);
	fSeekL(var0, var1, var2);
	var3 = 0;
	function224(var2, var3);
	if(!strcmp(arg1, function224(var2, var3)))
	{
		var3 = 0;
		for(new var6 = 0; var6 <= 15; var6++)
		{
			var4[var6] = function224(var2, var3);
		}
		ResetPlayerMoney(playerid);
		glob8[playerid] = strval(var4[7]);
		GivePlayerMoney(playerid, glob8[playerid]);
		glob198[playerid] = strval(var4[8]);
		glob1CE88[playerid] = strval(var4[9]);
		glob328[playerid] = strval(var4[10]);
		glob648[playerid] = strval(var4[11]);
		globFA8[playerid] = strval(var4[12]);
		glob1138[playerid] = strval(var4[13]);
		glob12C8[playerid] = strval(var4[14]);
		globE18[playerid] = strval(var4[15]);
		if(strval(var4[2]) == 1)
		{
			if(glob328[playerid] == 1)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 41, 250, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 2 || glob328[playerid] == 9)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 5, 1, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 3)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 25, 20, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 4)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 22, 50, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 5)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 29, 200, 4, 1, 0, 0);
			}
			if(glob328[playerid] == 6 || glob328[playerid] == 15 || glob328[playerid] == 16 || glob328[playerid] == 17)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 5, 1, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 8)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 23, 200, 5, 1, 0, 0);
			}
			if(glob328[playerid] == 10)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 25, 40, 22, 500, 3, 1);
			}
			if(glob328[playerid] == 11)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 25, 70, 24, 100, 33, 30);
			}
			if(glob328[playerid] == 12)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 27, 90, 31, 300, 29, 300);
			}
			if(glob328[playerid] == 14)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 4, 1, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 7 || glob328[playerid] == 99)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], floatstr(var4[3]), floatstr(var4[4]), floatstr(var4[5]), 0.0, 24, 35, 0, 0, 0, 0);
			}
			if(glob648[playerid])
			{
				SetPlayerInterior(playerid, 6);
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 262.954, 78.4338, 1001.0391, 270.0, 0, 0, 0, 0, 0, 0);
				globAF8[playerid] = 5;
			}
			SpawnPlayer(playerid);
		}
		else
		{
			if(glob328[playerid] == 1)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 41, 250, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 2 || glob328[playerid] == 9)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 5, 1, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 3)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 25, 20, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 4)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 22, 50, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 5)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], -1757.9701, 961.343, 24.8827, 0.0, 29, 200, 4, 1, 0, 0);
			}
			if(glob328[playerid] == 6 || glob328[playerid] == 15 || glob328[playerid] == 16 || glob328[playerid] == 17)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 5, 1, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 8)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 23, 200, 5, 1, 0, 0);
			}
			if(glob328[playerid] == 10)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 25, 40, 22, 500, 3, 1);
			}
			if(glob328[playerid] == 11)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 25, 70, 24, 100, 33, 30);
			}
			if(glob328[playerid] == 12)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 27, 90, 31, 300, 29, 300);
			}
			if(glob328[playerid] == 14)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 4, 1, 0, 0, 0, 0);
			}
			if(glob328[playerid] == 7 || glob328[playerid] == 99)
			{
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 24, 35, 0, 0, 0, 0);
			}
			if(glob648[playerid])
			{
				SetPlayerInterior(playerid, 6);
				SetSpawnInfo(playerid, 0, glob1CE88[playerid], 262.954, 78.4338, 1001.0391, 270.0, 0, 0, 0, 0, 0, 0);
				globAF8[playerid] = 5;
			}
			SpawnPlayer(playerid);
		}
		SetPlayerHealth(playerid, floatstr(var4[6]));
		SendClientMessage(playerid, 0x33AA33AA, "Logado.");
		TogglePlayerControllable(playerid, true);
	}
	else
	{
		SendPlayerFormattedText(playerid, 0xAA3333AA, "SENHA INCORRETA", 0);
	}
	fclose(var0);
	return 1;
}

public RegisterPlayer(playerid, arg1)
{
	new File:var0 = 0;
	new var1[24], var2[256];
	GetPlayerName(playerid, var1, 24);
	format(var2, 256, "%s.txt", var1);
	if(fexist(var2))
	{
		SendPlayerFormattedText(playerid, 0xAA3333AA, "Você já esta registrado", 0);
		return 1;
	}
	var0 = fopen(var2, 1);
	format(var2, 256, "%s %s 0 0.000000 0.000000 0.000000 100.000000 0 3000 0 1 0 0 0 0 0\r\n", var1, arg1);
	fwrite(var0, var2);
	fclose(var0);
	glob1CE88[playerid] = 0;
	glob328[playerid] = 1;
	glob648[playerid] = 0;
	globFA8[playerid] = 0;
	glob1138[playerid] = 0;
	glob12C8[playerid] = 0;
	globE18[playerid] = 0;
	glob198[playerid] = 3000;
	SendPlayerFormattedText(playerid, 0x33AA33AA, "Registrado e logado.", 0);
	SendPlayerFormattedText(playerid, 0x33AA33AA, "Você têm $3000 no banco para começar a viver.", 0);
	TogglePlayerControllable(playerid, true);
	SetSpawnInfo(playerid, 0, glob1CE88[playerid], 1727.2625, -1632.1967, 20.215, 0.0, 41, 250, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}

public RSavePlayerInfo(playerid)
{
	new File:var0 = 0, File:var1 = 0, Float:var2 = 0.0;
	new var3[24], var4[256], var5[256], var6[256], var7[16][64], var8 = 0;
	GetPlayerName(playerid, var3, 24);
	GetPlayerHealth(playerid, var2);
	format(var6, 256, "%s.txt", var3);
	if(fexist(var6))
	{
		var0 = fopen(var6, 0);
		fSeekL(var0, var3, var4);
		for(new var9 = 0; var9 <= 15; var9++)
		{
			var7[var9] = function224(var4, var8);
		}
		fclose(var0);
		var1 = fopen(var6, 1);
		fSeekL(var1, var3, var4);
		format(var5, 256, "%s %s %d %f %f %f %f %d %d %d %d %d %d %d %d %d\r\n", var3, glob1458[playerid][0], strval(var7[2]), strval(var7[2]), floatstr(var7[3]), floatstr(var7[4]), var2, GetPlayerMoney(playerid), 408, 118408, 808, 1608, 4008, 4408, 4808, 3608);
		fwrite(var1, var5);
		printf("save: %s", var5);
		fclose(var1);
	}
	return 1;
}

public RSetHome(playerid, arg1)
{
	new File:var0 = 0, File:var1 = 0, Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0;
	new var5[256], var6[256], var7[256], var8[16][64], var9 = 0;
	GetPlayerPos(playerid, var2, var3, var4);
	format(var7, 256, "%s.txt", arg1);
	if(fexist(var7))
	{
		var0 = fopen(var7, 0);
		fSeekL(var0, arg1, var5);
		for(new var10 = 0; var10 <= 15; var10++)
		{
			var8[var10] = function224(var5, var9);
		}
		fclose(var0);
		var1 = fopen(var7, 1);
		fSeekL(var1, arg1, var5);
		format(var6, 256, "%s %s 1 %f %f %f %s %s %s %s %s %s %s\r\n", var8[0], var8[1], var2, var3, var4 + 0.5, var8[6], var8[7], var8[8], var8[9], var8[10], var8[11], var8[12], var8[13], var8[14], var8[15]);
		fwrite(var1, var6);
		fclose(var1);
		SendClientMessage(playerid, 0x33AA33AA, "Casa salva");
	}
	return 1;
}

public RLogout(playerid)
{
	if(strlen(glob1458[playerid]))
	{
		RSavePlayerInfo(playerid);
		glob198[playerid] = 0;
		glob8[playerid] = 0;
		glob1CCF8[playerid] = 0;
		glob328[playerid] = 0;
		glob648[playerid] = 0;
		globFA8[playerid] = 0;
		glob1138[playerid] = 0;
		glob12C8[playerid] = 0;
		globE18[playerid] = 0;
		SetPlayerPos(playerid, -1958.5108, 293.6747, 35.4687);
		TogglePlayerControllable(playerid, false);
	}
	return 0;
}

public TaxiTimer()
{
	for(new var0 = 0; var0 < 100; var0++)
	{
		if(!glob1D1A8[var0])
		{
			glob1D338[var0] = 0;
		}
		if(glob1D1A8[var0])
		{
			new var1[256];
			glob1D338[var0] = glob1D338[var0] + 3;
			format(var1, 256, "O taxímetro mostra: $%d", 119608);
			SendClientMessage(var0, 0x33AA33AA, var1);
			SendClientMessage(glob1D4C8[var0], 0x33AA33AA, var1);
			if(glob1D338[var0] > GetPlayerMoney(glob1D4C8[var0]))
			{
				RemovePlayerFromVehicle(glob1D4C8[var0]);
				SendClientMessage(glob1D4C8[var0], 0xAA3333AA, "Você não tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(var0, 0xAA3333AA, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				new var2 = 0;
				var2 = GetPlayerMoney(glob1D4C8[var0]);
				GivePlayerMoney(glob1D4C8[var0], 0 - var2);
				glob8[glob1D4C8[var0]] = glob8[glob1D4C8[var0]] - var2;
				GivePlayerMoney(var0, var2);
				glob8[var0] = glob8[var0] + var2;
				glob1D1A8[var0] = 0;
				glob1D338[var0] = 0;
				glob1D658[glob1D4C8[var0]] = 999;
				glob1D4C8[var0] = 999;
			}
		}
		if(50 <= glob7D8[var0])
		{
			SendClientMessage(var0, 0xAA3333AA, "Você entrou em coma alcoolico, beba menos!");
			SetPlayerHealth(var0, 0.0);
			glob7D8[var0] = 1;
		}
	}
	return 0;
}

public CErrorMessage(playerid, arg1)
{
	SendClientMessage(playerid, 0xAA3333AA, arg1);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext)
{
	new var0[256];
	new var1 = 0, var2 = 0;
	new var3[24];
	new var4[24];
	new var5[256];
	new var6[256], var7 = 0;
	new var8 = 0, var9 = 0, var10 = 0;
	var5 = function224(cmdtext, var10);
	if(!strcmp(var5, "/rregister", true))
	{
		if(strlen(glob1458[playerid]))
		{
			CErrorMessage(playerid, "Você ja está registrado!");
			return 1;
		}
		var6 = function224(cmdtext, var10);
		if(!strlen(var6))
		{
			CErrorMessage(playerid, "/rregister [senha]");
			return 1;
		}
		RegisterPlayer(playerid, var6);
		return 1;
	}
	if(!strcmp(var5, "/rlogin", true))
	{
		if(strlen(glob1458[playerid]))
		{
			CErrorMessage(playerid, "Você ja está logado.");
			return 1;
		}
		var0 = function224(cmdtext, var10);
		if(!strlen(var0))
		{
			CErrorMessage(playerid, "/rlogin [senha]");
			return 1;
		}
		RReadPlayerInfo(playerid, var0);
		return 1;
	}
	if(!strcmp(var5, "/setlevel", true))
	{
		if(glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			var0 = function224(cmdtext, var10);
			if(strlen(var6) && strlen(var0))
			{
				if(IsPlayerConnected(strval(var6)))
				{
					glob328[strval(var6)] = strval(var0);
					SendClientMessage(strval(var6), 0x33AA33AA, "Você mudou de profissão, digite /profissao.");
					SendClientMessage(playerid, 0x33AA33AA, "Level setado.");
					new var11[256];
					strval(var6);
					RLogout(strval(var6));
					RReadPlayerInfo(strval(var6), var11);
				}
				else
				{
					CErrorMessage(playerid, "O jogador não está conectado!");
				}
			}
			else
			{
				CErrorMessage(playerid, "/setlevel [id] [level]");
			}
		}
		else
		{
			CErrorMessage(playerid, "Você não tem permissão para isto!");
		}
		return 1;
	}
	if(!strcmp(var5, "/jobpay", true))
	{
		if(glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			var0 = function224(cmdtext, var10);
			if(strlen(var6) && strlen(var0))
			{
				if(IsPlayerConnected(strval(var6)))
				{
					glob198[strval(var6)] = glob198[strval(var6)] + strval(var0);
					SendClientMessage(strval(var6), 0x33AA33AA, "Você recebeu pagamento em sua conta!");
					SendClientMessage(playerid, 0x33AA33AA, "Pagamento feito.");
				}
				else
				{
					CErrorMessage(playerid, "O jogador não está conectado!");
				}
			}
			else
			{
				CErrorMessage(playerid, "/jobpay [id] [amount]");
			}
		}
		else
		{
			CErrorMessage(playerid, "Você não tem permissão para isto!");
		}
		return 1;
	}
	if(!strcmp(var5, "/pagar", true))
	{
		var6 = function224(cmdtext, var10);
		var0 = function224(cmdtext, var10);
		if(strlen(var6) && strlen(var0))
		{
			if(IsPlayerConnected(strval(var6)))
			{
				if(strval(var0) <= GetPlayerMoney(playerid))
				{
					if(glob328[strval(var6)] == 4 || glob328[strval(var6)] == 3)
					{
						GivePlayerMoney(playerid, 0 - strval(var0));
						glob8[playerid] = glob8[playerid] - strval(var0);
						var9 = strval(var0) / 10;
						GivePlayerMoney(strval(var6), var9);
						new var11[256];
						format(var11, 256, "Você vendeu por %d e lucrou %d com a venda", strval(var0), var9);
						SendClientMessage(strval(var6), 0x33AA33AA, var11);
						SendClientMessage(playerid, 0x33AA33AA, "Pagamento feito.");
					}
					else
					{
						CErrorMessage(playerid, "Você está tentando pagaer a alguem que não é coretoe e nem vendedor!");
					}
				}
				else
				{
					CErrorMessage(playerid, "Você não tem esse dinheiro!");
				}
			}
			else
			{
				CErrorMessage(playerid, "O jogador não está conectado!");
			}
		}
		else
		{
			CErrorMessage(playerid, "/jobpay [id] [amount]");
		}
		return 1;
	}
	if(!strcmp(var5, "/setskin", true))
	{
		if(glob328[playerid] == 3 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			var0 = function224(cmdtext, var10);
			if(strlen(var6) && strlen(var0))
			{
				if(IsPlayerConnected(strval(var6)))
				{
					if(strval(var0) >= 9 && 42 != strval(var0) && 65 != strval(var0) && 74 != strval(var0) && 86 != strval(var0) && 149 != strval(var0) && 208 != strval(var0) && 265 != strval(var0) && 266 != strval(var0) && 267 != strval(var0) && 268 != strval(var0) && 269 != strval(var0) && 270 != strval(var0) && 271 != strval(var0) && 272 != strval(var0) && 273 != strval(var0) && strval(var0) <= 288)
					{
						new var11[256];
						glob1CE88[strval(var6)] = strval(var0);
						SetPlayerSkin(strval(var6), strval(var0));
						SendClientMessage(strval(var6), 0x33AA33AA, "Seu skin foi comprado!");
						SendClientMessage(playerid, 0x33AA33AA, "Skin Setado.");
						strval(var6);
						RLogout(strval(var6));
						SetPlayerHealth(strval(var6), 0.0);
						RReadPlayerInfo(strval(var6), var11);
					}
					else
					{
						CErrorMessage(playerid, "Skin ID Inválido!");
					}
				}
				else
				{
					CErrorMessage(playerid, "O jogador não está conectado!");
				}
			}
			else
			{
				CErrorMessage(playerid, "/setskin [id] [amount]");
			}
		}
		else
		{
			CErrorMessage(playerid, "Você não tem permissão para isto!");
		}
		return 1;
	}
	if(!strcmp(var5, "/multar", true))
	{
		if(glob328[playerid] == 7 || glob328[playerid] == 10 || glob328[playerid] == 11 || glob328[playerid] == 12 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			new var11[24];
			new var12[256];
			GetPlayerName(playerid, var11, 24);
			var6 = function224(cmdtext, var10);
			var0 = function224(cmdtext, var10);
			if(strlen(var6) && strlen(var0))
			{
				if(IsPlayerConnected(strval(var6)))
				{
					glob198[strval(var6)] = glob198[strval(var6)] - strval(var0);
					format(var12, 256, "Você recebeu uma multa de %d dada por %s . O dinheiro foi retirado do banco.", strval(var0), var11);
					SendClientMessage(strval(var6), 0x33AA33AA, var12);
					SendClientMessage(playerid, 0x33AA33AA, "Multa dada.");
				}
				else
				{
					CErrorMessage(playerid, "O jogador não está conectado!");
				}
			}
			else
			{
				CErrorMessage(playerid, "/multar [id] [quantidade]");
			}
		}
		else
		{
			CErrorMessage(playerid, "Você não tem permissão para isto!");
		}
		return 1;
	}
	if(!strcmp(var5, "/sethome", true))
	{
		if(glob328[playerid] == 4 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			if(!strlen(var6))
			{
				CErrorMessage(playerid, "/sethome [nick]");
				return 1;
			}
			RSetHome(playerid, var6);
			return 1;
		}
		CErrorMessage(playerid, "Você não tem permissão para isso");
		return 1;
	}
	if(!strcmp(var5, "/setcar", true))
	{
		new var11[256], var12 = 0, var13 = 0, Float:var14 = 0.0;
		if(glob328[playerid] == 3 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			printf("SetCar: %s", cmdtext);
			var7 = strval(function224(cmdtext, var10));
			if(400 != var7 && 602 != var7 && 496 != var7 && 410 != var7)
			{
				if(517 != var7 && 439 != var7 && 445 != var7 && 587 != var7)
				{
					if(405 != var7 && 409 != var7 && 402 != var7 && 603 != var7)
					{
						if(475 != var7 && 559 != var7 && 560 != var7 && 541 != var7)
						{
							if(415 != var7 && 480 != var7 && 434 != var7 && 411 != var7)
							{
								if(451 != var7 && 515 != var7 && 536 != var7 && 534 != var7)
								{
									if(535 != var7 && 424 != var7 && 444 != var7 && 471 != var7)
									{
										if(461 != var7 && 521 != var7 && 463 != var7 && 468 != var7)
										{
											if(462 != var7 && 420 != var7 && 437 != var7 && 433 != var7)
											{
												if(523 != var7 && 470 != var7 && 596 != var7 && 425 != var7)
												{
													if(487 != var7 && 497 != var7 && 593 != var7 && 519 != var7)
													{
														if(453 != var7 && 493 != var7 && 473 != var7)
														{
															CErrorMessage(playerid, "ID fora do normal | ID's = 400-611");
															return 1;
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			var6 = function224(cmdtext, var10);
			if(!strlen(var6))
			{
				CErrorMessage(playerid, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			var14 = floatstr(var6);
			var11 = function224(cmdtext, var10);
			var6 = function224(cmdtext, var10);
			if(strlen(var6))
			{
				if(strcmp(var6, "-1", true))
				{
					if(!function4F0(var6))
					{
						CErrorMessage(playerid, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
						return 1;
					}
				}
				var12 = strval(var6);
			}
			else
			{
				CErrorMessage(playerid, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			var6 = function224(cmdtext, var10);
			if(strlen(var6))
			{
				if(strcmp(var6, "-1", true))
				{
					if(!function4F0(var6))
					{
						CErrorMessage(playerid, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
						return 1;
					}
				}
				var13 = strval(var6);
			}
			else
			{
				CErrorMessage(playerid, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			if(!strlen(var11))
			{
				CErrorMessage(playerid, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			SetHomeCarToFile(playerid, var7, var14, var11, var12, var13);
			return 1;
		}
		SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
		return 1;
	}
	if(!strcmp(var5, "/givemoney", true))
	{
		if(glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			if(strlen(var6))
			{
				GivePlayerMoney(playerid, strval(var6));
				glob8[playerid] = glob8[playerid] + strval(var6);
			}
			return 1;
		}
		return 0;
	}
	if(!strcmp(var5, "/authlogout", true))
	{
		var6 = function224(cmdtext, var10);
		if(IsPlayerAdmin(playerid) || glob328[playerid] == 99)
		{
			if(strlen(var6))
			{
				if(strlen(glob1458[strval(var6)]))
				{
					glob1CCF8[strval(var6)] = 1;
					SendClientMessage(playerid, 0x33AA33AA, "Logout autorizado.");
					SendClientMessage(strval(var6), 0x33AA33AA, "Você ganhou permissão para fazer logout.");
				}
				else
				{
					format(var0, 256, "O jogador %d não está logado.", strval(var6));
					SendClientMessage(playerid, 0xFFFF00AA, var0);
				}
				return 1;
			}
		}
		return 0;
	}
	if(!strcmp(var5, "/procurar", true))
	{
		var6 = function224(cmdtext, var10);
		if(IsPlayerAdmin(playerid) || glob328[playerid] == 99 || glob328[playerid] == 10 || glob328[playerid] == 11 || glob328[playerid] == 12)
		{
			if(strlen(var6))
			{
				if(strlen(glob1458[strval(var6)]))
				{
					new var11[24];
					GetPlayerName(playerid, var11, 24);
					glob968[strval(var6)] = 1;
					SendClientMessage(playerid, 0x33AA33AA, "Mais um pra vc perseguir agora.");
					format(var0, 256, "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", var11);
					SendClientMessage(strval(var6), 0x33AA33AA, var0);
				}
				else
				{
					format(var0, 256, "O jogador %d não está logado.", strval(var6));
					SendClientMessage(playerid, 0xFFFF00AA, var0);
				}
				return 1;
			}
		}
		return 0;
	}
	if(!strcmp(var5, "/desprocurar", true))
	{
		var6 = function224(cmdtext, var10);
		if(IsPlayerAdmin(playerid) || glob328[playerid] == 99 || glob328[playerid] == 10 || glob328[playerid] == 11 || glob328[playerid] == 12)
		{
			if(strlen(var6))
			{
				if(strlen(glob1458[strval(var6)]))
				{
					glob968[strval(var6)] = 0;
					SendClientMessage(playerid, 0x33AA33AA, "Excluido da lista com sucesso.");
					SendClientMessage(strval(var6), 0x33AA33AA, "Você foi retirado da lista de procurados");
				}
				else
				{
					format(var0, 256, "O jogador %d não está logado.", strval(var6));
					SendClientMessage(playerid, 0xFFFF00AA, var0);
				}
				return 1;
			}
		}
		return 0;
	}
	if(!strcmp(var5, "/rlogout", true))
	{
		if(glob1CCF8[playerid] == 1)
		{
			glob1CCF8[playerid] = 0;
			RLogout(playerid);
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Somente com autorização de algum Admin");
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/trancar", true))
	{
		if(GetPlayerState(playerid) == 2)
		{
			new var11 = 0;
			while(++var11 <= 100)
			{
				if(var11 != playerid && IsPlayerConnected(var11))
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid), var11, false, true);
				}
			}
			SendClientMessage(playerid, 0x33AA33AA, "Veículo Trancado");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não está dirigindo nenhum veiculo!");
		}
		return 1;
	}
	if(!strcmp(var5, "/taxi", true))
	{
		new var11[24];
		GetPlayerName(playerid, var11, 24);
		var6 = function2148(cmdtext, var10);
		if(!strlen(var6))
		{
			CErrorMessage(playerid, "/taxi [aonde]");
			return 1;
		}
		SendClientMessage(playerid, 0x33AA33AA, "Os taxistas foram informados");
		format(var0, 256, "%s pede um taxi. Local: %s", var11, var6);
		for(new var12 = 0; var12 < 100; var12++)
		{
			if(glob328[var12] == 2)
			{
				SendClientMessage(var12, 0xFFFF00AA, var0);
			}
		}
		return 1;
	}
	if(!strcmp(var5, "/say", true))
	{
		new var11[24];
		GetPlayerName(playerid, var11, 24);
		var6 = function2148(cmdtext, var10);
		if(!strlen(var6))
		{
			CErrorMessage(playerid, "/say [texto]");
			return 1;
		}
		format(var0, 256, "%s: %s", var11, var6);
		for(new var12 = 0; var12 < 100; var12++)
		{
			if(function88(GetDistanceBetweenPlayers(playerid, var12), 50))
			{
				SendClientMessage(var12, 0xAFAFAFAA, var0);
			}
		}
		format(var0, 256, "SAY:: %s: %s", var11, var6);
		print(var0);
		return 1;
	}
	if(!strcmp(var5, "/pt", true))
	{
		new var11[24];
		GetPlayerName(playerid, var11, 24);
		var6 = function2148(cmdtext, var10);
		if(!strlen(var6))
		{
			CErrorMessage(playerid, "/pt [texto]");
			return 1;
		}
		format(var0, 256, "%s: %s", var11, var6);
		for(new var12 = 0; var12 < 100; var12++)
		{
			if(glob328[playerid] == glob328[var12])
			{
				SendClientMessage(var12, GetPlayerColor(playerid), var0);
			}
		}
		format(var0, 256, "PT:: %s: %s", var11, var6);
		print(var0);
		return 1;
	}
	if(!strcmp(var5, "/presos", true))
	{
		SendClientMessage(playerid, 0xFFFF00AA, "Lista de presos");
		new var11[24];
		for(new var12 = 0; var12 < 100; var12++)
		{
			if(glob648[var12])
			{
				GetPlayerName(var12, var11, 24);
				format(var0, 256, "%d: %s", var12, var11);
				SendClientMessage(playerid, 0xFFFF00AA, var0);
			}
		}
		return 1;
	}
	if(!strcmp(var5, "/procurados", true))
	{
		SendClientMessage(playerid, 0xFFFF00AA, "Lista de procurados");
		new var11[24];
		for(new var12 = 0; var12 < 100; var12++)
		{
			if(glob968[var12])
			{
				GetPlayerName(var12, var11, 24);
				format(var0, 256, "%d: %s", var12, var11);
				SendClientMessage(playerid, 0xFFFF00AA, var0);
			}
		}
		return 1;
	}
	if(!strcmp(var5, "/staxi", true))
	{
		if(glob328[playerid] == 2 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			new var11 = 0, var12 = 0;
			var11 = GetPlayerVehicleID(playerid);
			var12 = strval(function224(cmdtext, var10));
			if(!IsPlayerConnected(var12))
			{
				SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
				return 1;
			}
			if(IsPlayerInVehicle(var12, var11) && GetPlayerState(playerid) == 2)
			{
				glob1D1A8[playerid] = 1;
				glob1D658[var12] = playerid;
				glob1D4C8[playerid] = var12;
				SendClientMessage(playerid, 0x33AA33AA, "O taxímetro começou a rodar");
				SendClientMessage(var12, 0x33AA33AA, "O taxímetro começou a rodar");
			}
			else
			{
				SendClientMessage(playerid, 0xAA3333AA, "O passageiro não está dentro do seu carro ou você não é o motorista.");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/sbus", true))
	{
		if(glob328[playerid] == 17 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			if(GetPlayerState(playerid) == 2)
			{
				glob1D018[playerid] = 1;
				SendClientMessage(playerid, 0x33AA33AA, "Pronto, entre em circulação.");
				SendAllFormattedText(playerid, "O ônibus número %d entrou em circulação", playerid);
			}
			else
			{
				SendClientMessage(playerid, 0xAA3333AA, "Entre no ônibus como motorista e digite novamento o comando.");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/sethaero", true))
	{
		if(glob328[playerid] == 15 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var7 = strval(function224(cmdtext, var10));
			if(!IsPlayerConnected(var7))
			{
				SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
				return 1;
			}
			glob1138[var7] = 1;
			SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção aerea concedida.");
			SendClientMessage(var7, 0x33AA33AA, "Você recebeu a habilitação de direção aerea.");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/unsethaero", true))
	{
		if(glob328[playerid] == 11 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var7 = strval(function224(cmdtext, var10));
			if(!IsPlayerConnected(var7))
			{
				SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
				return 1;
			}
			glob1138[var7] = 0;
			SendClientMessage(playerid, 0x33AA33AA, "Foi revogada a habilitação.");
			SendClientMessage(var7, 0x33AA33AA, "Sua habilitação Aérea foi revogada.");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/sethterrestre", true))
	{
		if(glob328[playerid] == 15 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var7 = strval(function224(cmdtext, var10));
			if(!IsPlayerConnected(var7))
			{
				SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
				return 1;
			}
			globFA8[var7] = 1;
			SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção terrestre concedida.");
			SendClientMessage(var7, 0x33AA33AA, "Você recebeu a habilitação de direção de carros e motos.");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/unsetsethterrestre", true))
	{
		if(glob328[playerid] == 11 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var7 = strval(function224(cmdtext, var10));
			if(!IsPlayerConnected(var7))
			{
				SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
				return 1;
			}
			globFA8[var7] = 0;
			SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção terrestre revogada.");
			SendClientMessage(var7, 0x33AA33AA, "Sua habilitação de carros e motos foi revogada.");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/sethnautica", true))
	{
		if(glob328[playerid] == 15 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var7 = strval(function224(cmdtext, var10));
			if(!IsPlayerConnected(var7))
			{
				SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
				return 1;
			}
			glob12C8[var7] = 1;
			SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção náutica concedida.");
			SendClientMessage(var7, 0x33AA33AA, "Você recebeu a habilitação de direção náutica.");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/sethnautica", true))
	{
		if(glob328[playerid] == 11 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var7 = strval(function224(cmdtext, var10));
			if(!IsPlayerConnected(var7))
			{
				SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
				return 1;
			}
			glob12C8[var7] = 0;
			SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção náutica revogada.");
			SendClientMessage(var7, 0x33AA33AA, "Sua habilitação de diração náutica foi revogada.");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var5, "/ci", true))
	{
		var7 = strval(function224(cmdtext, var10));
		new var11[24];
		if(!IsPlayerConnected(var7))
		{
			SendClientMessage(playerid, 0xAA3333AA, "ID inválido");
			return 1;
		}
		GetPlayerName(playerid, var11, 24);
		format(var0, 256, "Identidade de: %s", var11);
		SendClientMessage(var7, 0xFFFF00AA, var0);
		format(var0, 256, "Skin :: %d", 118408);
		SendClientMessage(var7, 0xFFFF00AA, var0);
		if(globFA8[playerid])
		{
			SendClientMessage(var7, 0xFFFF00AA, "Habilitação de Carros e Motos: SIM");
		}
		else
		{
			SendClientMessage(var7, 0xFFFF00AA, "Habilitação de Carros e Motos: NÃO");
		}
		if(glob12C8[playerid])
		{
			SendClientMessage(var7, 0xFFFF00AA, "Habilitação Náutica: SIM");
		}
		else
		{
			SendClientMessage(var7, 0xFFFF00AA, "Habilitação Náutica: NÃO");
		}
		if(glob1138[playerid])
		{
			SendClientMessage(var7, 0xFFFF00AA, "Habilitação Aérea: SIM");
		}
		else
		{
			SendClientMessage(var7, 0xFFFF00AA, "Habilitação Aérea: NÃO");
		}
		SendClientMessage(playerid, 0xFFFF00AA, "Documentos mostrados.");
		return 1;
	}
	if(!strcmp(var5, "/selldrink", true))
	{
		if(glob328[playerid] == 6 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			var0 = function224(cmdtext, var10);
			if(strlen(var6) && strlen(var0))
			{
				if(IsPlayerConnected(strval(var6)))
				{
					if(function88(GetDistanceBetweenPlayers(playerid, strval(var6)), 50))
					{
						if(7 >= strval(var0))
						{
							glob7D8[strval(var6)] = glob7D8[strval(var6)] + strval(var0);
							format(var0, 256, "Você bebeu um drink com teor alcoolico: %d", strval(var0));
							SendClientMessage(strval(var6), 0x33AA33AA, var0);
							SendClientMessage(playerid, 0x33AA33AA, "Drink Vendido e tomado");
						}
						else
						{
							CErrorMessage(playerid, "Teor alcoolico muito alto, o maior teor que uma bebida pode ter é 7.");
						}
					}
					else
					{
						CErrorMessage(playerid, "Você está muito longe, chegue mais perto para entregar a bebida.");
					}
				}
				else
				{
					CErrorMessage(playerid, "O jogador não está conectado!");
				}
			}
			else
			{
				CErrorMessage(playerid, "/selldrink [id] [teor de alcool]");
			}
		}
		else
		{
			CErrorMessage(playerid, "Você não tem permissão para isto!");
		}
		return 1;
	}
	if(!strcmp(var5, "/buygas", true))
	{
		var6 = function224(cmdtext, var10);
		if(strlen(var6))
		{
			if(IsPlayerInArea(playerid, glob1D7EC[1]) || IsPlayerInArea(playerid, glob1D7EC[2]) || IsPlayerInArea(playerid, glob1D7EC[3]) || IsPlayerInArea(playerid, glob1D7EC[4]) || IsPlayerInArea(playerid, glob1D7EC[5]) || IsPlayerInArea(playerid, glob1D7EC[6]))
			{
				if(strval(var6) <= GetPlayerMoney(playerid))
				{
					new var11 = 100 - globE18[playerid];
					if(var11 > strval(var6))
					{
						GivePlayerMoney(playerid, 0 - strval(var6));
						glob8[playerid] = glob8[playerid] - strval(var6);
						globE18[playerid] = globE18[playerid] + strval(var6);
						format(var0, 256, "Você comprou %d litros de gasolina", strval(var6));
						SendClientMessage(playerid, 0x33AA33AA, var0);
					}
					else
					{
						GivePlayerMoney(playerid, 0 - var11);
						glob8[playerid] = glob8[playerid] - var11;
						globE18[playerid] = globE18[playerid] + var11;
						format(var0, 256, "Seu tanque ficou completo. só colocamos %d litros.", var11);
						SendClientMessage(playerid, 0x33AA33AA, var0);
					}
				}
				else
				{
					CErrorMessage(playerid, "Você não tem dinheiro para pagar.");
				}
			}
			else
			{
				CErrorMessage(playerid, "Você não está no posto, consulte o mapa no fórum para saber sua localização");
			}
		}
		else
		{
			CErrorMessage(playerid, "/buygas [litros]");
		}
		return 1;
	}
	if(!strcmp(var5, "/bafometro", true))
	{
		if(glob328[playerid] == 10 || glob328[playerid] == 11 || glob328[playerid] == 12 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			if(!strlen(var6))
			{
				CErrorMessage(playerid, "/bafometro [id]");
				return 1;
			}
			var7 = strval(var6);
			if(!IsPlayerConnected(var7) && glob1458[var7])
			{
				CErrorMessage(playerid, "Jogador não está conectado/logado");
				return 1;
			}
			format(var0, 256, "O bafômetro mostra: %d no sangue", 2008);
			SendClientMessage(playerid, 0xFFFF00AA, var0);
			return 1;
		}
		return 0;
	}
	if(!strcmp(var5, "/bust", true))
	{
		if(glob328[playerid] == 10 || glob328[playerid] == 11 || glob328[playerid] == 12 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			if(!strlen(var6))
			{
				CErrorMessage(playerid, "/bust [id]");
				return 1;
			}
			var7 = strval(var6);
			if(!IsPlayerConnected(var7) && glob1458[var7])
			{
				CErrorMessage(playerid, "Jogador não está conectado/logado");
				return 1;
			}
			if(function88(GetDistanceBetweenPlayers(playerid, var7), 20))
			{
				new var11[256];
				glob648[var7] = 1;
				glob968[var7] = 0;
				globAF8[var7] = 5;
				RLogout(var7);
				SetPlayerHealth(var7, 0.0);
				RReadPlayerInfo(var7, var11);
				TogglePlayerControllable(var7, false);
				SendClientMessage(playerid, 0x33AA33AA, "Prisão concluida");
				SendClientMessage(var7, 0xAA3333AA, "Você cometeu algum crime e por isso foi preso, você ficará 5 horas na cadeia.");
				SendClientMessage(var7, 0xAA3333AA, "(Lembrete: Cada hora no jogo equivale a um minuto real).");
			}
			else
			{
				CErrorMessage(playerid, "Você está muito longe, chegue mais perto!");
			}
			return 1;
		}
		CErrorMessage(playerid, "Você não é policial");
		return 1;
	}
	if(!strcmp(var5, "/unbust", true))
	{
		if(glob328[playerid] == 12 || glob328[playerid] == 7 || glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			var6 = function224(cmdtext, var10);
			if(!strlen(var6))
			{
				CErrorMessage(playerid, "/unbust [id]");
				return 1;
			}
			var7 = strval(var6);
			if(!IsPlayerConnected(var7) && glob1458[var7])
			{
				CErrorMessage(playerid, "Jogador não está conectado/logado");
				return 1;
			}
			new var11[256];
			glob648[var7] = 0;
			globAF8[var7] = 0;
			RLogout(var7);
			RReadPlayerInfo(var7, var11);
			SendClientMessage(var7, 0x33AA33AA, "Algum Juiz te soltou.");
			return 1;
		}
		CErrorMessage(playerid, "Você não é policial");
		return 1;
	}
	if(!strcmp(cmdtext, "/destrancar", true))
	{
		if(GetPlayerState(playerid) == 2)
		{
			new var11 = 0;
			while(++var11 <= 100)
			{
				if(IsPlayerConnected(var11))
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid), var11, false, false);
				}
			}
			SendClientMessage(playerid, 0x33AA33AA, "Veículo Destrancado");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não está dirigindo nenhum veiculo!");
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/destrancarall", true))
	{
		if(glob328[playerid] >= 99 || IsPlayerAdmin(playerid))
		{
			new var11 = 0;
			while(++var11 <= glob4)
			{
				for(new var12 = 0; var12 <= 100; var12++)
				{
					if(IsPlayerConnected(var12))
					{
						SetVehicleParamsForPlayer(var11, var12, false, false);
					}
				}
			}
			SendClientMessage(playerid, 0x33AA33AA, "Todos os Veículos Destrancados");
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não é admin!");
		}
		return 1;
	}
	if(!strcmp(var5, "/pescar", true))
	{
		if(globC88[playerid])
		{
			CErrorMessage(playerid, "Você já jogou a rede, espere ela voltar!");
			return 1;
		}
		if(IsPlayerInArea(playerid, glob1D7EC[0]))
		{
			if(glob328[playerid] == 14)
			{
				SendClientMessage(playerid, 0x33AA33AA, "Pescador profissional, aguarde pouco menos de 1 minuto para sua rede voltar.");
				globC88[playerid] = 1;
				globAF8[playerid] = 0;
			}
			else
			{
				SendClientMessage(playerid, 0x33AA33AA, "Você jogou a rede, agora espere pouco menos de 3 minutos para ela voltar.");
				globC88[playerid] = 1;
				globAF8[playerid] = 2;
			}
		}
		else
		{
			CErrorMessage(playerid, "Você não está na área de pesca.");
		}
		return 1;
	}
	if(!strcmp(var5, "/bdp", true))
	{
		if(IsPlayerInCheckpoint(playerid) && 999 != glob4B8[playerid])
		{
			var6 = function224(cmdtext, var10);
			if(!strlen(var6))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "Uso: /bdp [quantidade]");
				return 1;
			}
			var9 = strval(var6);
			var1 = GetPlayerMoney(playerid);
			if(var9 > 0 && var1 >= var9)
			{
				GivePlayerMoney(playerid, 0 - var9);
				glob8[playerid] = glob8[playerid] - var9;
				var2 = glob198[playerid];
				glob198[playerid] = var2 + var9;
			}
			else
			{
				SendClientMessage(playerid, 0xAA3333AA, "Você não tem todo esse dinheiro. Ou está tentando enviar $0.");
			}
		}
		else
		{
			SendClientMessage(playerid, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, 0xFFFF00AA, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		}
		return 1;
	}
	if(!strcmp(var5, "/bwd", true))
	{
		if(IsPlayerInCheckpoint(playerid) && 999 != glob4B8[playerid])
		{
			var6 = function224(cmdtext, var10);
			if(!strlen(var6))
			{
				SendClientMessage(playerid, 0xAA3333AA, "Uso: /bwd [quantidade]");
				return 1;
			}
			var9 = strval(var6);
			if(var9 <= glob198[playerid])
			{
				GivePlayerMoney(playerid, var9);
				glob8[playerid] = glob8[playerid] + var9;
				glob198[playerid] = glob198[playerid] - var9;
			}
			else
			{
				SendClientMessage(playerid, 0xAA3333AA, "Você não tem essa quantidade no banco");
			}
		}
		else
		{
			SendClientMessage(playerid, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, 0xFFFF00AA, "Bancos: Hotel, Car's Shop, Sf Train Station, San Andreas Federal Mint.");
		}
		return 1;
	}
	if(!strcmp(var5, "/bstats", true))
	{
		if(IsPlayerInCheckpoint(playerid) && 999 != glob4B8[playerid])
		{
			format(var0, 256, "Você tem %d na conta %d", 408, playerid);
			SendClientMessage(playerid, 0x33AA33AA, var0);
		}
		else
		{
			SendClientMessage(playerid, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, 0xFFFF00AA, "Bancos: Hotel, Car's Shop, Sf Train Station, San Andreas Federal Mint.");
		}
		return 1;
	}
	if(!strcmp(var5, "/bscell", true))
	{
		if(20 <= GetPlayerMoney(playerid))
		{
			GivePlayerMoney(playerid, -20);
			glob8[playerid] = glob8[playerid] - 20;
			format(var0, 256, "Mensagem de Celular: Você tem %d na conta %d", 408, playerid);
			SendClientMessage(playerid, 0x33AA33AA, var0);
		}
		else
		{
			SendClientMessage(playerid, 0xFFFF00AA, "Custo: $20");
		}
		return 1;
	}
	if(!strcmp(var5, "/ajuda", true))
	{
		SendClientMessage(playerid, 0xFFFF00AA, "/rajuda : comandos do RPG");
		SendClientMessage(playerid, 0xFFFF00AA, "/rregister [senha] : se registra");
		SendClientMessage(playerid, 0xFFFF00AA, "/rlogin [senha] : se loga no jogo");
		SendClientMessage(playerid, 0xFFFF00AA, "/creditos : Vê os creditos do RPG Mode");
		return 1;
	}
	if(!strcmp(var5, "/rajuda", true))
	{
		SendClientMessage(playerid, 0x33AA33AA, "Comandos do RPG");
		SendClientMessage(playerid, 0xFFFF00AA, "/givecash : envia dinheiro a algum jogador\t|/presos : Vê a lista de pessoas presas.");
		SendClientMessage(playerid, 0xFFFF00AA, "/trancar : tranca seu carro\t\t\t\t\t|/procurados : Vê a lista de procurados pela policia");
		SendClientMessage(playerid, 0xFFFF00AA, "/destrancar : destranca seu carro\t\t\t|/pescar : Joga a rede pra pescar, você deve estar na área de pesca.");
		SendClientMessage(playerid, 0xFFFF00AA, "/ci [id] : mostra seus documentos\t\t\t|/say [texto] : Manda mensagem para pessoas proximas a você");
		SendClientMessage(playerid, 0xFFFF00AA, "/relogio : Mostra o horário em SF\t\t\t|/profissao : Comandos de sua profissão");
		SendClientMessage(playerid, 0xFFFF00AA, "/taxi [lugar] : Chama um taxi\t\t\t\t|/banco : Comandos do Banco");
		SendClientMessage(playerid, 0xFFFF00AA, "/pagar [id] [quantidade] : Paga por algum serviço de corretor ou vendedor de carros.");
		return 1;
	}
	if(!strcmp(var5, "/creditos", true))
	{
		SendClientMessage(playerid, 0x33AA33AA, "RPG mode");
		SendClientMessage(playerid, 0xFFFF00AA, "Feito por: SolidNuts");
		SendClientMessage(playerid, 0xFFFF00AA, "Agradecimentos:");
		SendClientMessage(playerid, 0xFFFF00AA, "- Sedek, TheHitman e DaMNeD (Idéias)");
		SendClientMessage(playerid, 0xFFFF00AA, "- Luigui (Alguns códigos)");
		SendClientMessage(playerid, 0xFFFF00AA, "- TheMaster & Sedek & CinerMax (Testes)");
		return 1;
	}
	if(!strcmp(var5, "/profissao", true))
	{
		SendClientMessage(playerid, 0x33AA33AA, "Comandos de sua Profissão");
		SendClientMessage(playerid, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		if(glob328[playerid] == 2)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
		if(glob328[playerid] == 3)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/setcar [id-do-carro] [rotação] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, 0xFFFF00AA, "/setskin [id-da-pessoa] [id-do-skin] : Vende um skin para alguma pessoa.");
		}
		if(glob328[playerid] == 4)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/sethome [nick] : Seta a casa para alguem, (esteja na posicao exterior à casa).");
		}
		if(glob328[playerid] == 6)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		if(glob328[playerid] == 7)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/unbust [id] : Solta uma pessoa.");
			SendClientMessage(playerid, 0xFFFF00AA, "/multar [id] [amount] : Multa uma pessoa.");
		}
		if(glob328[playerid] == 10 || glob328[playerid] == 11 || glob328[playerid] == 12)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			if(glob328[playerid] == 12)
			{
				SendClientMessage(playerid, 0xFFFF00AA, "/unbust [id] : Solta uma pessoa da cadeia.");
			}
			SendClientMessage(playerid, 0xFFFF00AA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, 0xFFFF00AA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, 0xFFFF00AA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, 0xFFFF00AA, "/multar [id] [amount] : Multa uma pessoa.");
		}
		if(glob328[playerid] == 14)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/pescar : Joga a rede para pescar, você deve estar na área de pesca.");
		}
		if(glob328[playerid] == 15)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/sethaero : Hablitia uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, 0xFFFF00AA, "/sethterrestre : Hablitia uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, 0xFFFF00AA, "/sethnautica : Hablitia uma pessoa a dirigir veículos nauticos (barcos).");
		}
		if(glob328[playerid] == 16)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/sellgas [id] [litros] : Vende Gasolina para a pessoa.");
		}
		if(glob328[playerid] == 17)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/sbus : Faz o ônibus começar a cobrar as pessoas.");
		}
		if(glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			SendClientMessage(playerid, 0xFFFF00AA, "/setlevel [id] [level] : Seta um nível de profissão de acordo com a tabela.");
			SendClientMessage(playerid, 0xFFFF00AA, "/jobpay [id] [quantia] : Paga o salário para funcionários publicos");
			SendClientMessage(playerid, 0xFFFF00AA, "/givemoney [quantia] : Saca dinheiro dos cofres públicos (*se mal usado poderá ir para a cadeia*))");
			SendClientMessage(playerid, 0xFFFF00AA, "/authlogout [id] : Autoriza um jogador à se deslogar [OFF]");
			SendClientMessage(playerid, 0xFFFF00AA, "/destrancarall : Destranca todos os carros do jogo (caso emergencial)");
			SendClientMessage(playerid, 0xFFFF00AA, "/multar [id] [amount] : Multa uma pessoa.");
			SendClientMessage(playerid, 0xFFFF00AA, "/comandosprofs : Vê os comandos das outras profissões.");
		}
		if(glob328[playerid] == 1 || glob328[playerid] == 5 || glob328[playerid] == 8 || glob328[playerid] == 9)
		{
			SendClientMessage(playerid, 0x33AA33AA, "Sua profissão não tem nenhum comando especial!");
		}
		return 1;
	}
	if(!strcmp(var5, "/banco", true))
	{
		SendClientMessage(playerid, 0x33AA33AA, "Comandos do Banco");
		SendClientMessage(playerid, 0xFFFF00AA, "/bdp [quantia] : Deposita dinheiro na sua conta no banco");
		SendClientMessage(playerid, 0xFFFF00AA, "/bwd [quantia] : retira dinheiro da sua conta no banco");
		SendClientMessage(playerid, 0xFFFF00AA, "/bstats : checa o seu saldo bancário..");
		SendClientMessage(playerid, 0xFFFF00AA, "/bscell : checa o seu saldo bancário através do seu celular, custo $20.");
		SendClientMessage(playerid, 0xFFFF00AA, "Você precisa estar em um banco para usar esses comandos, menos o /bscell.");
		SendClientMessage(playerid, 0xFFFF00AA, "Bancos: Hotel, Car Shop, SF Train Station e SA Federal Mint.");
		return 1;
	}
	if(!strcmp(var5, "/comandosprofs", true))
	{
		if(glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			SendClientMessage(playerid, 0x33AA33AA, "Comandos das profissões");
			SendClientMessage(playerid, 0xFFFF00AA, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro). [TAXISTA]");
			SendClientMessage(playerid, 0xFFFF00AA, "/setcar [id] [rotação] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn) [VENDEDOR CARROS].");
			SendClientMessage(playerid, 0xFFFF00AA, "/sethome [nick] : Seta a casa para alguem, (esteja na posicao exterior à casa). [CORRETOR]");
			SendClientMessage(playerid, 0xFFFF00AA, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento. [COP]");
			SendClientMessage(playerid, 0xFFFF00AA, "/unbust [id] : Solta uma pessoa. [JUIZ]");
			SendClientMessage(playerid, 0xFFFF00AA, "/setskin [id-da-pessoa] [id-do-skin] : Vende um skin para alguma pessoa.[VENDEDOR]");
			SendClientMessage(playerid, 0xFFFF00AA, "/sellgas [id] [litros] : Vende Gasolina para a pessoa.[FRENTISTA]");
			SendClientMessage(playerid, 0xFFFF00AA, "/sbus : Faz o ônibus começar a cobrar as pessoas.[MOTORISTA DE BUS]");
			SendClientMessage(playerid, 0xFFFF00AA, "/comandosprofs2 : PARTE 2");
			return 1;
		}
		return 0;
	}
	if(!strcmp(var5, "/comandosprofs2", true))
	{
		if(glob328[playerid] == 99 || IsPlayerAdmin(playerid))
		{
			SendClientMessage(playerid, 0x33AA33AA, "Comandos das profissões - parte 2");
			SendClientMessage(playerid, 0xFFFF00AA, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa[BARMAN]");
			SendClientMessage(playerid, 0xFFFF00AA, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa[BARMAN]");
			SendClientMessage(playerid, 0xFFFF00AA, "/multar [id] [amount] : Multa uma pessoa.[JUIZ E COP]");
			SendClientMessage(playerid, 0xFFFF00AA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém[COP]");
			SendClientMessage(playerid, 0xFFFF00AA, "/procurar [id] : Coloca o ID na lista de procurados da policia.[COP]");
			SendClientMessage(playerid, 0xFFFF00AA, "/desprocurar [id] : retira o ID da lista de procurados da policia.[COP]");
			SendClientMessage(playerid, 0xFFFF00AA, "/pescar : Joga a rede para pescar, você deve estar na área de pesca.[PESCAR]");
			SendClientMessage(playerid, 0xFFFF00AA, "/sethaero : Hablitia uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, 0xFFFF00AA, "/sethterrestre : Hablitia uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, 0xFFFF00AA, "/sethnautica : Hablitia uma pessoa a dirigir veículos nauticos (barcos).");
			return 1;
		}
		return 0;
	}
	if(!strcmp(var5, "/relogio", true))
	{
		format(var0, 256, "Na região de San Andreas: %dh", 120808);
		SendClientMessage(playerid, 0x33AA33AA, var0);
		return 1;
	}
	if(!strcmp(var5, "/givecash", true))
	{
		var6 = function224(cmdtext, var10);
		if(!strlen(var6))
		{
			SendClientMessage(playerid, 0xAA3333AA, "Uso: /givecash [id-do-jogador] [quantidade]");
			return 1;
		}
		var8 = strval(var6);
		var6 = function224(cmdtext, var10);
		if(!strlen(var6))
		{
			SendClientMessage(playerid, 0xAA3333AA, "Uso: /givecash [id-do-jogador] [quantidade]");
			return 1;
		}
		var9 = strval(var6);
		if(IsPlayerConnected(var8))
		{
			GetPlayerName(var8, var4, 24);
			GetPlayerName(playerid, var3, 24);
			var1 = GetPlayerMoney(playerid);
			if(var9 > 0 && var1 >= var9)
			{
				GivePlayerMoney(playerid, 0 - var9);
				glob8[playerid] = glob8[playerid] - var9;
				GivePlayerMoney(var8, var9);
				glob8[var8] = glob8[var8] + var9;
				format(var0, 256, "Você enviou %s(id: %d), $%d.", var4, var8, var9);
				SendClientMessage(playerid, 0xFFFF00AA, var0);
				format(var0, 256, "Você recebeu $%d de %s(id: %d).", var9, var3, playerid);
				SendClientMessage(var8, 0xFFFF00AA, var0);
			}
			else
			{
				SendClientMessage(playerid, 0xFFFF00AA, "Valor inválido.");
			}
		}
		else
		{
			format(var0, 256, "%d não está online.", var8);
			SendClientMessage(playerid, 0xFFFF00AA, var0);
		}
		return 1;
	}
	return 0;
}

