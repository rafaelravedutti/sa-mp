/*Nova modificação para sa-mp 0.2.2 R3
Data de ínicio da programação: 08/04/08 17:18
Nome da modificação: Paradise
Versão: 0.1
Programador: osorkon*/

#include <a_samp>
#include <dini>
#include <cpstream>

//Definições
#define cPRETO 0x000000AA
#define cBRANCO 0xFFFFFFAA
#define cCINZA1 0xD3D3D3AA
#define cCINZA2 0x808080AA
#define cVERMELHO1 0xFF5050AA
#define cVERMELHO2 0xFF0000AA
#define	cVERMELHO3 0x950000AA
#define cVERDE1 0xB6FFB6AA
#define cVERDE2 0xFF00AA
#define cVERDE3 0x9500AA
#define cAZUL1 0xACACFFAA
#define cAZUL2 0xFFAA
#define cAZUL3 0x73AA
#define cAMARELO1 0xFFFFB4AA
#define cAMARELO2 0xFFFF00AA
#define cAMARELO3 0xB3B300AA
#define SLOT 15
#define MAX_SKINS 300
#define QTCARS 21
#define JDESEMPREGO 1
#define JPIZZA 2
#define JTAXI 3
#define JDELEGACIA 4
#define JBUS 5

forward LogarPlayer(playerid);
forward ChecarGasolina();
forward SalvandoGasolina();
forward ModeCarregando(playerid);
forward Areas();
forward minrand(min, max);
forward LocalInfo();

//geral
new Logado[SLOT];
new AntWorld[SLOT];
new ModeCarregado[SLOT];
new TempoPraEntrar[SLOT];
new AreaMercado[SLOT] = 0;
new EntradaDelegacia[SLOT] = 0, DentroDelegacia[SLOT] = 0, EntradaPizzaria[SLOT] = 0, DentroPizzaria[SLOT] = 0;
static seta = 1318;
//tempo
//skins
new icomprarBinco;
new RecebeuMenuSkin[SLOT] = 0;
new Menu:Roupas;
//carros
new GPV[MAX_VEHICLES];
//casas
new EntradaImobiliaria[SLOT] = 0, DentroImobiliaria[SLOT] = 0;
//profissão
new EmpregoInfoPizza[SLOT] = 0, EmpregoInfoDelegacia[SLOT] = 0, EmpregoInfoTaxi[SLOT] = 0, EmpregoInfoBus[SLOT] = 0;
new MatriculaEscola[SLOT], EntradaMatricula[SLOT] = 0, DentroMatricula[SLOT] = 0, EntradaEscola[SLOT] = 0, DentroEscola[SLOT] = 0;
new EstudoBasico[SLOT];
new Emprego[SLOT];
new jobname[][] = {
	"Nenhum",
	"Desempregado",
	"Funcionário da Pizzaria",
	"Taxista",
	"Funcionário da Delegacia",
	"Motorista"
};
new jobpay[] = {
	0,
	150,
	300,
	300,
	700,
	500
};
new jobpaymsg[][] = {
	"Nenhum",
	"GOVERNO: Seu seguro de desempregado foi depositado na sua conta bancária ($150).",
	"PIZZARIA: Fala amigo, nós já depositamos seu salário na sua conta ($300).",
	"CENTRAL TAXI: Ei cara, nós depositamos seu salário na sua conta ($300).",
	"DELEGACIA: Depositamos seu salário na sua conta bancária ($700).",
	"CENTRAL RODOVIÁRIO: Seu salário foi depositado em sua conta bancária ($500)."
};
new jobcolor[] = {
	cCINZA1,
	cCINZA2,
	cAMARELO1,
	cAMARELO2,
	cAZUL1,
	cVERDE1
};

main()
{
	print("\n----------------------------------");
	print(" Paradise GameMode por osorkon ");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	//geral
	SetGameModeText("Paradise RP 0.1");
	EnableStuntBonusForAll(0);
	EnableTirePopping(1);
	UsePlayerPedAnims();
	DisableInteriorEnterExits();
	//ShowPlayerMarkers(0);
	//carros
	//AddStaticVehicleEx(idveh,x,y,z,angle,cor1,cor2,tempoderespawn)
	AddStaticVehicle(537,1710.9410,-1953.9969,13.5503,280.4346,1,1); //trem em unity station (1)
	AddStaticVehicle(448,2096.6340,-1793.1340,12.9750,90.9063,3,3); //moto da pizzaria a (2)
	AddStaticVehicle(448,2096.7056,-1814.0729,12.9835,92.5866,3,3); //moto da pizzaria b (3)
	AddStaticVehicle(448,2096.7493,-1817.2435,12.9741,89.4201,3,3); //moto da pizzaria c (4)
	AddStaticVehicle(438,1788.7916,-1690.1320,13.4560,180.4754,6,6); //taxi cabbie (5)
	AddStaticVehicle(420,1796.6823,-1702.5056,13.3094,1.1215,6,6); //taxi normal a (6)
	AddStaticVehicle(420,1782.5991,-1690.1614,13.2174,180.9063,6,6); //taxi normal b (7)
	AddStaticVehicle(596,1602.0642,-1683.9617,5.6159,90.2377,0,1); //carro polícia de los santos a (8)
	AddStaticVehicle(596,1558.8289,-1710.5072,5.6119,1.2089,0,1); //carro polícia de los santos b (9)
	AddStaticVehicle(596,1590.1436,-1606.0082,13.1038,180.3839,0,1); //carro polícia de los santos c (10)
	AddStaticVehicle(523,1586.1235,-1671.6300,5.4588,271.6342,0,1); //moto polícia de los santos (11)
	AddStaticVehicle(582,753.2631,-1333.8356,13.5978,180.3713,1,2); //van de jornalismo a (12)
	AddStaticVehicle(582,735.9139,-1348.0649,13.5676,270.7004,1,2); //van de jornalismo b (13)
	AddStaticVehicle(488,739.6457,-1368.7468,25.6922,270.3447,2,2); //helicóptero de jornalismo (14)
	AddStaticVehicle(437,1705.1068,-1532.9199,13.5162,0.0,1,1); //onibûs de viagens longas a (15)
	AddStaticVehicle(437,1705.1201,-1511.9229,13.5193,0.0,1,1); //onibûs de viagens longas b (16)
	AddStaticVehicle(456,2175.3992,-2266.7800,13.5611,224.9738,13,13); //caminhão com caçamba (17)
	AddStaticVehicle(414,2159.7402,-2280.5483,13.4655,225.0043,13,13); //van desenhada a (18)
	AddStaticVehicle(499,2167.5605,-2273.5681,13.3691,224.9341,13,13); //van desenhada b (19)
	AddStaticVehicle(453,2637.7000,-2480.1409,-0.2812,179.5233,1,1); //barco de pesca a (20)
	AddStaticVehicle(423,2485.2080,-1755.2014,13.3263,359.8503,1,1); //carrinho de sorvete (21)
	//objetos id caixa = 2942
    CreateObject(1557,1167.845,1362.797,9.761,0.0,0.0,0.0); //porta do escritório de matrícula
	CreateObject(981,76.202,-1534.711,5.120,0.0,1.719,83.365); //bloqueio de pista sudoeste de los santos
	CreateObject(1535,368.912384,161.534011,1013.166992,0,0,90.999954); //porta da escola
	CreateObject(1508,368.922454,162.311187,1026.433471,0,1,360.042297); //porta da imobiliária
	//pickups
	icomprarBinco = AddStaticPickup(1275,1,207.7047,-101.3411,1005.2578);
	AddStaticPickup(seta,1,1017.2278,-1557.8177,14.8657); //entrada da matrícula
   	AddStaticPickup(seta,1,1739.3018,-1583.7831,14.1583); //entrada da delegacia
	AddStaticPickup(seta,1,1780.6970,-1807.3055,13.5274); //entrada da escola
	AddStaticPickup(seta,1,1553.8608,-1675.6165,16.1953); //entrada delegacia
	AddStaticPickup(seta,1,2104.4929,-1806.4751,13.5547); //entrada pizzaria
   	AddStaticPickup(1314,1,377.7690,-119.2981,1001.4922); //local de emprego pizzaria
   	AddStaticPickup(1314,1,249.2111,67.9817,1003.6406); //local de emprego delegacia
   	AddStaticPickup(1314,1,1757.1324,-1711.8231,13.5414); //local de emprego taxista
   	AddStaticPickup(1314,1,1691.4221,-1500.2271,13.5469); //local de emprego motorista
	//menus
	//outras funções
	CriarArquivoDeCarros();
	CarregarGasolina();
	//timers
	SetTimer("ChecarGasolina",40000,1);
	SetTimer("SalvandoGasolina",120000,1);
	SetTimer("Areas",1000,1);
	SetTimer("LocalInfo",1000,1);
	return 1;
}

public OnGameModeExit()
{
    new string[256];
	for(new i; i<MAX_VEHICLES; i++)
	{
 		valstr(string,i);
		if(dini_Isset("gpv.rpg",string))
 		{
			dini_IntSet("gpv.rpg",string,GPV[i]);
		}
	}
	for(new i=0;i<SLOT;i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Logado[i] == 1)
			{
	    		new Float:col,Float:vid;
 				GetPlayerArmour(i,col);
  				GetPlayerHealth(i,vid);
   				dini_FloatSet(PlayerName(i),"Vida",vid);
    			dini_FloatSet(PlayerName(i),"Colete",col);
				dini_IntSet(PlayerName(i),"Dinheiro",GetPlayerMoney(i));
			}
		}
 	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid,1087.1958,-2028.9098,72.7266);
	SetPlayerCameraPos(playerid,1087.1958,-2028.9098,72.7266);
	SetPlayerCameraLookAt(playerid,1085.9401,-2027.3579,72.7266);
	SetPlayerWeather(playerid,16);
	PlayerPlaySound(playerid,1187,0.0,0.0,0.0);
	GameTextForPlayer(playerid,"~b~Paradise~n~~g~Role Play Game",5000,0);
	SetPlayerColor(playerid,cCINZA1);
	if(Logado[playerid] == 1)
	{
		SpawnPlayer(playerid);
	}
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    return 0;
}

public OnPlayerConnect(playerid)
{
    //ícones mapa
	SetPlayerMapIcon(playerid,1,1018.3870,-1553.6406,14.8657,43,1); //local de matricula (triads)
    SetPlayerMapIcon(playerid,2,2131.8699,-1150.7891,24.1194,55,1); //concessionária (carrinho)
    SetPlayerMapIcon(playerid,3,1739.3018,-1583.7831,14.1583,31,1); //imobiliária (casa verde)
    SetPlayerMapIcon(playerid,4,1780.6970,-1807.3055,13.5274,62,1); //escola (carinha da groove)
    //aplicações de ínicio
    ModeCarregado[playerid] = 0;
	Emprego[playerid] = 1;
	Logado[playerid] = 0;
	MatriculaEscola[playerid] = 0;
    SendClientMessage(playerid,cAMARELO1,"Seja bem-vindo ao Servidor Paradise! Aguarde até que as configurações sejam carregadas...");
	TempoPraEntrar[playerid] = SetTimerEx("ModeCarregando",10000,false,"d",playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(Logado[playerid] == 1)
	{
		new Float:health, Float: col;
		GetPlayerHealth(playerid,health);
		GetPlayerArmour(playerid,col);
		dini_FloatSet(PlayerName(playerid),"Vida",health);
		dini_FloatSet(PlayerName(playerid),"Colete",col);
		dini_IntSet(PlayerName(playerid),"Dinheiro",GetPlayerMoney(playerid));
		dini_IntSet(PlayerName(playerid),"Job",Emprego[playerid]);
		Logado[playerid] = 0;
		ModeCarregado[playerid] = 0;
	}
}

public OnPlayerSpawn(playerid)
{
    SetPlayerWeather(playerid,0);
	PlayerPlaySound(playerid,1188,0.0,0.0,0.0);
    SetPlayerInterior(playerid,0);
    SetPlayerVirtualWorld(playerid,0);
    SetPlayerColor(playerid,jobcolor[Emprego[playerid]]);
    if(dini_Float(PlayerName(playerid),"Vida") <= 0) SetPlayerHealth(playerid,100);
	else SetPlayerHealth(playerid,dini_Float(PlayerName(playerid),"Vida"));
	SetPlayerArmour(playerid, dini_Float(PlayerName(playerid),"Colete"));
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

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new idx, cmd[256];
	cmd = strtok(cmdtext,idx);
	if (strcmp(cmd,"/registrar",true) == 0)
	{
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(ModeCarregado[playerid] == 0) return SendClientMessage(playerid,cAMARELO1,"Aguarde até que o servidor carregue as configurações necessárias.");
		if(dini_Exists(PlayerName(playerid)))
		{
			SendClientMessage(playerid,cVERMELHO1,"Você já possuí uma conta, portanto logue-se.");
			return 1;
		}
    	if(Logado[playerid] == 1)
		{
			SendClientMessage(playerid,cVERMELHO1,"Você já logou uma conta, portanto está registrado.");
			return 1;
		}
    	if (strlen(tmp)==0)
		{
			SendClientMessage(playerid,cVERMELHO1,"Você usou um comando errado. Digite '/registrar [crie-uma-senha]'.");
			return 1;
		}
		else
		{
			Logado[playerid] = 1;
			dini_Create(PlayerName(playerid));
			Emprego[playerid] = 1;
			dini_Set(PlayerName(playerid),"Senha",tmp);
			dini_FloatSet(PlayerName(playerid),"Vida",100.0);
			dini_FloatSet(PlayerName(playerid),"Colete",0);
			dini_IntSet(PlayerName(playerid),"Dinheiro",900);
			GivePlayerMoney(playerid,900);
			dini_IntSet(PlayerName(playerid),"Skin",0);
			dini_IntSet(PlayerName(playerid),"Job",1);
			dini_IntSet(PlayerName(playerid),"HabMoto",0);
			dini_IntSet(PlayerName(playerid),"HabCarroPesado",0);
			dini_IntSet(PlayerName(playerid),"HabCarro",0);
			dini_IntSet(PlayerName(playerid),"HabBarco",0);
			dini_IntSet(PlayerName(playerid),"HabAerea",0);
			dini_IntSet(PlayerName(playerid),"EstudoBasico",0);
			dini_IntSet(PlayerName(playerid),"MatriculaEscola",0);
			dini_IntSet(PlayerName(playerid),"EstudoExp",0);
			dini_IntSet(PlayerName(playerid),"MorandoCasa",0);
			new nascer = minrand(0,2)+1;
			if(nascer == 1)
			{
				new Float:X = 1742.9507, Float:Y = -1948.7985, Float:Z = 14.1172, Float:ang = 359.702;
				dini_FloatSet(PlayerName(playerid),"SpawnX",X);
				dini_FloatSet(PlayerName(playerid),"SpawnY",Y);
				dini_FloatSet(PlayerName(playerid),"SpawnZ",Z);
				dini_FloatSet(PlayerName(playerid),"SpawnAng",ang);
				SetSpawnInfo(playerid,1,dini_Int(PlayerName(playerid),"Skin"),X,Y,Z,ang,0,0,0,0,0,0);
			}
			else if(nascer == 2)
			{
				new Float:X = 1694.2052, Float:Y = -1531.5062, Float:Z = 13.5469, Float:ang = 91.2748;
				dini_FloatSet(PlayerName(playerid),"SpawnX",X);
				dini_FloatSet(PlayerName(playerid),"SpawnY",Y);
				dini_FloatSet(PlayerName(playerid),"SpawnZ",Z);
				dini_FloatSet(PlayerName(playerid),"SpawnAng",ang);
				SetSpawnInfo(playerid,1,dini_Int(PlayerName(playerid),"Skin"),X,Y,Z,ang,0,0,0,0,0,0);
			}
			SpawnPlayer(playerid);
			SendClientMessage(playerid,cBRANCO,"Você registrou uma conta com sucesso. Você é novo aqui, digite /tutorial para aprender a jogar e /ajuda para ajuda inicial.");
		}
		return 1;
	}
	
	if(strcmp(cmd,"/logar",true) == 0 && IsPlayerConnected(playerid))
	{
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(ModeCarregado[playerid] == 0) return SendClientMessage(playerid,cAMARELO1,"Aguarde até que o servidor carregue as configurações necessárias.");
		if(!dini_Exists(PlayerName(playerid)))
		{
			SendClientMessage(playerid,cVERMELHO1,"Para logar você precisa ter uma conta, portanto registre-se.");
			return 1;
		}
		if(Logado[playerid] == 1)
		{
			SendClientMessage(playerid,cVERMELHO1,"Você já logou uma conta.");
			return 1;
		}
		if(strlen(tmp)==0)
		{
			SendClientMessage(playerid,cVERMELHO1,"Você usou um comando errado. Digite '/logar [senha-criada]'.");
			return 1;
		}
		if(strcmp(tmp,dini_Get(PlayerName(playerid),"Senha"),true) == 0)
		{
			Logado[playerid] = 1;
			LogarPlayer(playerid);
			SendClientMessage(playerid,cBRANCO,"Você logou uma conta com sucesso. Digite /ajuda para uma ajuda básica, divirta-se.");
			return 1;
		}
		else
		{
			SendClientMessage(playerid,cVERMELHO1,"Senha incorreta.");
		}
		return 1;
 	}

 	//ajuda em geral
 	if(strcmp(cmd,"/ajuda",true) == 0)
	{
  		SendClientMessage(playerid,cAMARELO1,"Ajuda inicial:");
		SendClientMessage(playerid,cBRANCO,"Se você quiser rever o tutorial, digite /tutorial. Você pode ver os comandos, digitando /comandos. Para ver outras");
 		SendClientMessage(playerid,cBRANCO,"informações relacionadas ao servidor, digite /outros. Tenha um bom jogo!");
 		return 1;
 	}
 	
 	if(strcmp(cmd,"/tutorial",true) == 0)
 	{
	    SendClientMessage(playerid,cAMARELO1,"Tutorial:");
	    SendClientMessage(playerid,cBRANCO,"Você é novo em Los Santos e precisa de um dinheiro para começar sua jornada aqui. Você começa com $900.");
		SendClientMessage(playerid,cBRANCO,"Aqui vão algumas dicas de ínicio: Use $400 de seu dinheiro para fazer a matrícula na escola básica (veja mais");
 		SendClientMessage(playerid,cBRANCO,"em /sistestudo), pois o mercado de trabalho requer isso. Use mais $200 para mudar de aparência, comprando uma");
 		SendClientMessage(playerid,cBRANCO,"roupa nova (procure uma loja de roupas). E por último e mais importante, use $300 para abrir uma conta bancária");
		SendClientMessage(playerid,cBRANCO,"no banco central da cidade de Los Santos (indicado com um ícone de sifrão no radar). Ah, e outra dica, jogue no");
    	SendClientMessage(playerid,cBRANCO,"Paradise como se você estivesse vivendo na vida real pois esse servidor utiliza uma modificação para este tipo");
    	SendClientMessage(playerid,cBRANCO,"de jogo.");
 		return 1;
 	}
 	
 	if(strcmp(cmd,"/comandos",true) == 0)
 	{
  		SendClientMessage(playerid,cAMARELO1,"Comandos básicos:");
  		SendClientMessage(playerid,cBRANCO,"Nesse servidor existem sistemas onde integram vários comandos. Se obtiver dúvidas sobre algum comando, digite");
 		SendClientMessage(playerid,cBRANCO,"/sistemas e procure a categoria de sua dúvida, evitando perguntas.");
		return 1;
	}

	if(strcmp(cmd,"/outros",true) == 0)
	{
  		SendClientMessage(playerid,cAMARELO1,"Outras informações:");
  		SendClientMessage(playerid,cBRANCO,"Veja a equipe de desenvolvimento da modificação 'Paradise' digitando /créditos. Fique por dentro das novidades gerais que ocorram");
 		SendClientMessage(playerid,cBRANCO,"no servidor, digite /novidades. O servidor está com um ip fixo facilitando a a sua procura, portanto adicione já aos favoritos o ip:");
 		SendClientMessage(playerid,cBRANCO,"'prserver.no-ip.info'.");
		return 1;
	}
	
	if(strcmp(cmd,"/créditos",true) == 0)
	{
  		SendClientMessage(playerid,cAZUL1,"'Paradise RP' - Criado por osorkon com auxílio geral de Rafael, michael, Brutows e [DT]Rodrigo.");
		return 1;
	}
	
	if(strcmp(cmd,"/novidades",true) == 0)
	{
  		SendClientMessage(playerid,cAMARELO1,"Novidades:");
  		SendClientMessage(playerid,cBRANCO,"O servidor lança com muita novidade! Aproveite já e participe dos eventos iniciais! Confira nossos projetos breves:");
 		SendClientMessage(playerid,cBRANCO,"- Site de ajuda para melhor desempenho do jogador no servidor.");
 		SendClientMessage(playerid,cBRANCO,"- Novos sistemas.");
		return 1;
	}
	
	if(strcmp(cmd,"/sistemas",true) == 0)
	{
  		SendClientMessage(playerid,cAMARELO1,"Sistemas:");
  		SendClientMessage(playerid,cBRANCO,"Os comandos estão integrados em cada sistema que o servidor possui. Se houver dúvida utilize-os:");
 		SendClientMessage(playerid,cBRANCO,"/sistestudo, /sistemprego, /sistconta, /sistcarro e /sistcasa.");
		return 1;
	}
	
	if(strcmp(cmd,"/sistestudo",true) == 0)
	{
  		SendClientMessage(playerid,cAMARELO1,"Sistema de estudo:");
  		SendClientMessage(playerid,cBRANCO,"O estudo básico é requerido na maioria dos empregos. Portanto aqui vão as instruções de como obte-lo:");
 		SendClientMessage(playerid,cBRANCO,"Vá até o local de matrícula que fica indicado com um ícone de Triads no radar. Chegando no local entre e digite");
 		SendClientMessage(playerid,cBRANCO,"/matricularescola (você deve obter $400 em mãos). Apartir do ínicio da matrícula, você ficará autorizado a estudar na");
 		SendClientMessage(playerid,cBRANCO,"escola no tempo que a escola fica aberta.CreateObject Você começa com 0 pontos de estudo básico e quanto mais você");
 		SendClientMessage(playerid,cBRANCO,"comparecer na escola e estudar, mais experiência você vai adquirir. Digite /meuestudo para saber o estado de seus");
 		SendClientMessage(playerid,cBRANCO,"pontos. A duração das aulas é de uma semana apartir do ínicio de sua matrícula. Para passar e adquirir o diploma de");
 		SendClientMessage(playerid,cBRANCO,"estudo básico, você deve obter 500 pontos de estudo no final das aulas.");
		return 1;
	}
 	
 	if(strcmp(cmd,"/sistemprego",true) == 0)
 	{
  		SendClientMessage(playerid,cAMARELO1,"Sistema de emprego:");
  		SendClientMessage(playerid,cBRANCO,"Para obter um emprego é preciso que você atenda os seus requerimentos, digite /empregos para saber os empregos e seus");
 		SendClientMessage(playerid,cBRANCO,"requisitos básicos. Quando estiver empregado você pode ver as informações de seu emprego digitando /meuemprego. No momento");
 		SendClientMessage(playerid,cBRANCO,"que você é admitido para um emprego, existe um tempo para se demitir (10 minutos) então pense bem antes de escolher um.");
		return 1;
	}
	
	if(strcmp(cmd,"/empregos",true) == 0)
 	{
  		SendClientMessage(playerid,cAMARELO1,"Empregos:");
  		SendClientMessage(playerid,cBRANCO,"-Taxista (localização: atrás da escola) (ícone do radar: nenhum).");
 		SendClientMessage(playerid,cBRANCO,"-Funcionário da pizzaria (localização: perto ao pay and spray) (ícone do radar: nenhum).");
 		SendClientMessage(playerid,cBRANCO,"-Motorista (localização: rodoviária) (ícone do radar: nenhum).");
 		SendClientMessage(playerid,cBRANCO,"-Pescador (localização: docas ao sudeste de Los Santos) (ícone do radar: Ancora).");
 		SendClientMessage(playerid,cBRANCO,"-Funcionário da delegacia (localização: delegacia de Los Santos) (ícone do radar: nenhum).");
 		SendClientMessage(playerid,cBRANCO,"-Funcionário de cargas (localização: depósito de produtos importados) (ícone do radar: caminhão).");
 		SendClientMessage(playerid,cBRANCO,"-Funcionário da sorveteria (localização: atrás da groove street) (ícone do radar: nenhum).");
		return 1;
	}
	
	if(strcmp(cmd,"/sistconta",true) == 0)
	{
		SendClientMessage(playerid,cAMARELO1,"Sistema de conta:");
  		SendClientMessage(playerid,cBRANCO,"Você começa sua jornada criando uma conta. Nessa conta será salvo tudo o que você fizer, como por exemplo uma skin que você");
 		SendClientMessage(playerid,cBRANCO,"comprou, seu dinheiro, seu colete, susas armas, seu emprego, etc. Você poderá ver como anda as configurações digitando");
 		SendClientMessage(playerid,cBRANCO,"/meupersonagem. Caso você anda insatisfeito com sua conta e quer criar outra, você pode, entrando outra vez no servidor");
 		SendClientMessage(playerid,cBRANCO,"só que desta vez entre com um nome diferente (obs: você começara outra vez e nada de sua conta atual será transferido).");
		return 1;
	}
	
	if(strcmp(cmd,"/sistcarro",true) == 0)
	{
  		SendClientMessage(playerid,cAMARELO1,"Sistema de veículo:");
  		SendClientMessage(playerid,cBRANCO,"Tudo o que você faz em seu veículo será salvo. Se você quiser obter um veículo vá até a concessionária indicada com um");
 		SendClientMessage(playerid,cBRANCO,"ícone de carro no radar e lá você pode ver os carros que poderá comprar (a cada tempo os carros mudam). Mas antes de você");
 		SendClientMessage(playerid,cBRANCO,"ter um carro, você deve ter uma casa (veja mais em /sistcasa). Existe também veículos de baixo custo (bicicletas e bugs),");
 		SendClientMessage(playerid,cBRANCO,"que podem ser adquiridos em uma loja indicada como bandeira de corrida no radar. Ao adquirir seu veículo, seja ele normal");
 		SendClientMessage(playerid,cBRANCO,"ou de baixo custo, digite /meuveiculo para obter informações sobre ele. Quando a gasolina do carro estiver baixo, vá");
 		SendClientMessage(playerid,cBRANCO,"até o posto e abasteça digitando '/abastecergas [litros de gasolina]', caso a gasolina do carro acabe, vá até o posto e");
 		SendClientMessage(playerid,cBRANCO,"compre um galão digitando /comprargalao (o galão contém 10 litros de gasolina), e vá até o carro e digite /colocargalao.");
		return 1;
	}
	
	if(strcmp(cmd,"/sistcasa",true) == 0)
	{
  		SendClientMessage(playerid,cAMARELO1,"Sistema de casa:");
  		SendClientMessage(playerid,cBRANCO,"Existem casas á venda por toda cidade. Caso voc~e esteja interessado em comprar uma casa, vá até a casa desejada e veja o");
 		SendClientMessage(playerid,cBRANCO,"número dela. Após isso, vá até a imobiliária (indicada com um ícone de casa verde no radar) e digite '/casainfo [número da casa]'");
 		SendClientMessage(playerid,cBRANCO,"e voc~e verá informações da casa que você quer como quantidades de cômodos, valor do imóvel, espaço para carros e mais...");
 		SendClientMessage(playerid,cBRANCO,"Ao adquirir a casa desejada, digite /minhacasa para obter informações sobre ela.");
		return 1;
	}
	
    if(strcmp(cmd,"/mercado",true) == 0)
	{
    	if(AreaMercado[playerid] == 1)
		{
  			SendClientMessage(playerid,cAMARELO1,"Sobre mercado:");
  			SendClientMessage(playerid,cBRANCO,"Você pode comprar itens de várias utilidades na rede de mercados 24-7 em Los Santos. Para obter informações sobre");
 			SendClientMessage(playerid,cBRANCO,"itens e acessórios a comprar, digite /itens. Para obter informações sobre produtos alimentícios digite /alimentos,");
 			SendClientMessage(playerid,cBRANCO,"e sempre esteja preparado para a sua vida.");
		}
	 	else
	 	{
 			SendClientMessage(playerid,cVERMELHO1,"Você não está em um mercado 24-7.");
 		}
		return 1;
	}
	
	if(strcmp(cmd,"/itens",true) == 0)
	{
    	if(AreaMercado[playerid] == 1)
		{
  			SendClientMessage(playerid,cAMARELO1,"Sobre itens:");
  			SendClientMessage(playerid,cBRANCO,"Os itens a comprar são: (1)faca, (2)relógio, (3)bengala, (4)soco inglês, (5)exintor de incêndio, (6)pára-quedas,");
 			SendClientMessage(playerid,cBRANCO,"(7)spray, (8)pá, (9)taco de beisebol, (10)flores, (11)taco de golfe, (12)mochila, (13)rádio e (14)taco de sinuca.");
	 	}
	 	else
	 	{
 			SendClientMessage(playerid,cVERMELHO1,"Você não está em um mercado 24-7.");
 		}
		return 1;
	}
	
	if(strcmp(cmd,"/alimentos",true) == 0)
	{
    	if(AreaMercado[playerid] == 1)
		{
  			SendClientMessage(playerid,cAMARELO1,"Sobre alimentos:");
  			SendClientMessage(playerid,cBRANCO,"Os alimentos a comprar são: (1)pacote de biscoito e (2)comida congelada.");
 		}
	 	else
	 	{
 			SendClientMessage(playerid,cVERMELHO1,"Você não está em um mercado 24-7.");
 		}
		return 1;
	}

	/*---- Aplicar funções gerais ----*/
	/*
	if(strcmp(cmd,"/compraritem",true) == 0){
	new tmp[256];
	tmp = strtok(cmdtext, idx);
	if(AreaMercado[playerid] == 1){*/
	if(strcmp(cmd,"/entrar",true) == 0)
	{
		if(EntradaImobiliaria[playerid] == 1)
		{
		    DentroImobiliaria[playerid] = 1;
			SetPlayerPos(playerid,366.5447,162.3962,1025.7891);
			SetPlayerInterior(playerid,3);
			SetPlayerFacingAngle(playerid,90.1918);
			SendClientMessage(playerid,cBRANCO,"Local para fazer compra de casas. Digite /sistcasa para mais informações.");
			GameTextForPlayer(playerid,"~w~Imobili˜ria",3000,1);
		}
		else if(EntradaDelegacia[playerid] == 1)
		{
		    DentroDelegacia[playerid] = 1;
		    SetPlayerPos(playerid,246.7828,63.9026,1003.6406);
			SetPlayerInterior(playerid,6);
			SetPlayerFacingAngle(playerid,0.0000);
			GameTextForPlayer(playerid,"~w~Delegacia",3000,1);
		}
		else if(EntradaMatricula[playerid] == 1)
		{
		    DentroMatricula[playerid] = 1;
			SetPlayerPos(playerid,1168.5342,1359.8749,10.9293);
			SetPlayerFacingAngle(playerid,180.7685);
			SendClientMessage(playerid,cBRANCO,"Local para fazer matrículas para escolas e faculdades. Digite /sistestudo para mais informações.");
			GameTextForPlayer(playerid,"~w~Local de Matricula",3000,1);
		}
		else if(EntradaEscola[playerid] == 1)
		{
		    if(dini_Int(PlayerName(playerid),"MatriculaEscola") == 1)
		    {
		        DentroEscola[playerid] = 1;
				SetPlayerPos(playerid,364.6158,168.0698,1014.1875);
				SetPlayerInterior(playerid,3);
				SetPlayerFacingAngle(playerid,1.0);
				SendClientMessage(playerid,cBRANCO,"Local de estudo. Digite /sistestudo para mais informações.");
				GameTextForPlayer(playerid,"~w~Escola",3000,1);
			}
			else
			{
			    SendClientMessage(playerid,cVERMELHO1,"Você não fez matrícula para estudos básicos, portanto não pode entrar nesta escola.");
			}
		}
		else if(EntradaPizzaria[playerid] == 1)
		{
		    DentroPizzaria[playerid] = 1;
			SetPlayerPos(playerid,372.3520,-131.6510,1001.4922);
			SetPlayerInterior(playerid,5);
			SetPlayerFacingAngle(playerid,359.9000);
			GameTextForPlayer(playerid,"~w~Pizzaria",3000,1);
		}
		else
		{
			SendClientMessage(playerid,cVERMELHO1,"Você não está na entrada de um local.");
		}
		return 1;
	}
	
	if(strcmp(cmd,"/sair",true) == 0)
	{
		if(DentroImobiliaria[playerid] == 1)
		{
			DentroImobiliaria[playerid] = 0;
			SetPlayerPos(playerid,1738.7861,-1589.7805,13.5446);
  			SetPlayerInterior(playerid,0);
    		SetPlayerFacingAngle(playerid,169.1454);
		}
		else if(DentroDelegacia[playerid] == 1)
		{
		    DentroDelegacia[playerid] = 0;
            SetPlayerPos(playerid,1546.1062,-1675.6339,13.5617);
			SetPlayerInterior(playerid,0);
			SetPlayerFacingAngle(playerid,90.0000);
		}
		else if(DentroMatricula[playerid] == 1)
		{
		    DentroMatricula[playerid] = 0;
			SetPlayerPos(playerid,1026.5948,-1553.4391,13.5593);
			SetPlayerFacingAngle(playerid,268.9991);
		}
		else if(DentroEscola[playerid] == 1)
		{
		    DentroEscola[playerid] = 0;
			SetPlayerPos(playerid,1777.1488,-1819.4833,13.5627);
			SetPlayerInterior(playerid,0);
			SetPlayerFacingAngle(playerid,165.9149);
		}
		else if(DentroPizzaria[playerid] == 1)
		{
		    DentroPizzaria[playerid] = 0;
			SetPlayerPos(playerid,2099.8445,-1806.4677,13.5547);
			SetPlayerInterior(playerid,0);
			SetPlayerFacingAngle(playerid,88.3822);
		}
		else
		{
			SendClientMessage(playerid,cVERMELHO1,"Você não está dentro de um local.");
		}
		return 1;
	}
	
	/*---- Aplicar funções de empregos ----*/
	if(strcmp(cmd,"/requisitos",true) == 0)
	{
		if(EmpregoInfoPizza[playerid] == 1)
		{
			SendClientMessage(playerid,cAMARELO1,"Requerimentos para se tornar funcionário da pizzaria:");
			SendClientMessage(playerid,cBRANCO,"-Estar desempregado, ter habilitação para dirigir motos e ter estudo básico.");
			SendClientMessage(playerid,cBRANCO,"Informações adicionais: Você trabalhará com serviçoes gerais da pizzaria, e terá um turno");
			SendClientMessage(playerid,cBRANCO,"de trabalho de 6 horas diárias e terá somente domingo como dia de folga. Seu salário será");
			SendClientMessage(playerid,cBRANCO,"inicialmente de $300 podendo chegar a $600 conforme vai avançando de cargo. Digite /aceitaremprego");
			SendClientMessage(playerid,cBRANCO,"se stiver interessado neste trabalho.");
		}
		else if(EmpregoInfoDelegacia[playerid] == 1)
		{
			SendClientMessage(playerid,cAMARELO1,"Requerimentos para se tornar funcionário da delegacia:");
			SendClientMessage(playerid,cBRANCO,"-Estar desempregado, ter habilitação para dirigir carros e motos, ter estudo básico e ter sua ficha.");
			SendClientMessage(playerid,cBRANCO,"criminal limpa. Informações adicionais: Você trabalhará com servições gerais da delegacia, e terá");
			SendClientMessage(playerid,cBRANCO,"um turno de 10 horas diárias e terá sabádo como dia de folga. Seu salário será inicialmente de $900");
			SendClientMessage(playerid,cBRANCO,"podendo chegar a $1800 conforme vai avançando no cargo. Digite /aceitaremprego se estiver interessado");
			SendClientMessage(playerid,cBRANCO,"neste trabalho.");
		}
		else if(EmpregoInfoTaxi[playerid] == 1)
		{
			SendClientMessage(playerid,cAMARELO1,"Requerimentos para se tornar taxista:");
			SendClientMessage(playerid,cBRANCO,"-Estar desempregado, ter habilitação para dirigir carros, ter estudo básico.");
			SendClientMessage(playerid,cBRANCO,"Informações adicionais: Você trabalhará com serviços gerais da central de taxi, e terá um turno de");
			SendClientMessage(playerid,cBRANCO,"7 horas diárias e terá domingo como dia de folga. Seu salário será inicialmente de $300 mais os seus");
			SendClientMessage(playerid,cBRANCO,"serviços. Digite /aceitaremprego se estiver interessado neste trabalho.");
		}
		else if(EmpregoInfoBus[playerid] == 1)
		{
			SendClientMessage(playerid,cAMARELO1,"Requerimentos para se tornar motorista:");
			SendClientMessage(playerid,cBRANCO,"-Estar desempregado, ter habilitação para dirigir grandes veículos, ter estudo básico.");
			SendClientMessage(playerid,cBRANCO,"Informações adicionais: Você trabalhará com serviços gerais de transporte público, e terá um turno de");
			SendClientMessage(playerid,cBRANCO,"9 horas diárias e terá domingo como dia de folga. Seu salário será inicialmente de $500 mais os seus");
			SendClientMessage(playerid,cBRANCO,"serviços. Digite /aceitaremprego se estiver interessado neste trabalho.");
		}
		else
		{
			SendClientMessage(playerid,cVERMELHO1,"Você não está em um local para ser admitido em um emprego.");
		}
		return 1;
	}
	
	if(strcmp(cmd,"/aceitaremprego",true) == 0)
	{
		if(EmpregoInfoPizza[playerid] == 1)
		{
			if(dini_Int(PlayerName(playerid),"Job") == 1)
			{
				if(dini_Int(PlayerName(playerid),"EstudoBasico") == 1)
				{
					if(dini_Int(PlayerName(playerid),"HabMoto") == 1)
					{
						SendClientMessage(playerid,cBRANCO,"Você foi admitido para o emprego na pizzaria. Digite /meuemprego para saber sobre seu trabalho.");
						dini_IntSet(PlayerName(playerid),"Job",2);
						Emprego[playerid] = 2;
					}
					else
					{
						SendClientMessage(playerid,cBRANCO,"Você não foi admitido por não ter habilitação para dirigir motos.");
					}
				}
    			else
				{
					SendClientMessage(playerid,cBRANCO,"Você não foi admitido por não ter completado o estudo básico.");
				}
			}
			else
			{
				SendClientMessage(playerid,cBRANCO,"Você não foi admitido por estar empregado em outro trabalho.");
			}
		}
		else if(EmpregoInfoDelegacia[playerid] == 1)
		{
			if(dini_Int(PlayerName(playerid),"Job") == 1)
			{
				if(dini_Int(PlayerName(playerid),"EstudoBasico") == 1)
				{
					if(dini_Int(PlayerName(playerid),"HabMoto") == 1 && dini_Int(PlayerName(playerid),"HabCarro") == 1)
					{
						SendClientMessage(playerid,cBRANCO,"Você foi admitido para o emprego na delegacia. Digite /meuemprego para saber sobre seu trabalho.");
						dini_IntSet(PlayerName(playerid),"Job",4);
						Emprego[playerid] = 4;
					}
					else
					{
						SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por não ter habilitação para dirigir motos ou carros.");
					}
				}
    			else
				{
					SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por não ter completado o estudo básico.");
				}
			}
			else
			{
				SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por estar empregado em outro trabalho.");
			}
		}
		else if(EmpregoInfoTaxi[playerid] == 1)
		{
			if(dini_Int(PlayerName(playerid),"Job") == 1)
			{
				if(dini_Int(PlayerName(playerid),"EstudoBasico") == 1)
				{
					if(dini_Int(PlayerName(playerid),"HabCarro") == 1)
					{
						SendClientMessage(playerid,cBRANCO,"Você foi admitido para o emprego na de taxi. Digite /meuemprego para saber sobre seu trabalho.");
						dini_IntSet(PlayerName(playerid),"Job",3);
						Emprego[playerid] = 3;
					}
					else
					{
						SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por não ter habilitação para dirigir carros.");
					}
				}
    			else
				{
					SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por não ter completado o estudo básico.");
				}
			}
			else
			{
				SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por estar empregado em outro trabalho.");
			}
		}
		else if(EmpregoInfoBus[playerid] == 1)
		{
			if(dini_Int(PlayerName(playerid),"Job") == 1)
			{
				if(dini_Int(PlayerName(playerid),"EstudoBasico") == 1)
				{
					if(dini_Int(PlayerName(playerid),"HabCarroPesado") == 1)
					{
						SendClientMessage(playerid,cBRANCO,"Você foi admitido para o emprego na delegacia. Digite /meuemprego para saber sobre seu trabalho.");
						dini_IntSet(PlayerName(playerid),"Job",5); Emprego[playerid] = 5; }
					else
					{
						SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por não ter habilitação para dirigir veículos de grande porte.");
					}
				}
    			else
				{
					SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por não ter completado o estudo básico.");
				}
			}
			else
			{
				SendClientMessage(playerid,cVERMELHO1,"Você não foi admitido por estar empregado em outro trabalho.");
			}
		}
		else
		{
			SendClientMessage(playerid,cVERMELHO1,"Você não está em um local para pegar um emprego.");
		}
		return 1;
	}

 	if(strcmp(cmd,"/matricularescola",true) == 0)
	{
    	if(DentroMatricula[playerid] == 1)
		{
    		if(GetPlayerMoney(playerid) >= 400)
			{
    			if(dini_Int(PlayerName(playerid),"EstudoBasico") == 0)
				{
					if(dini_Int(PlayerName(playerid),"MatriculaEscola") == 0)
					{
						dini_IntSet(PlayerName(playerid),"MatriculaEscola",1);
						GivePlayerMoney(playerid,-400);
						SetPlayerPos(playerid,1026.5948,-1553.4391,13.5593);
						SetPlayerFacingAngle(playerid,268.9991);
						SendClientMessage(playerid,cBRANCO,"Você fez a matricula para a escola básica com sucesso. Digite /minhaescola informações sobre seus estudos.");
					}
					else
					{
						SendClientMessage(playerid,cVERMELHO1,"Você já está matriculado para a escola de estudos básicos.");
					}
				}
				else
				{
					SendClientMessage(playerid,cVERMELHO1,"Você não precisa se matricular porque já completou os estudos básicos.");
				}
			}
 			else
		 	{
		 		SendClientMessage(playerid,cVERMELHO1,"Você precisa ter $400 para fazer a matrícula para a escola de estudos básicos.");
		 	}
	 	}
		else
		{
			SendClientMessage(playerid,cVERMELHO1,"Você não está no local para fazer matrículas.");
		}
		return 1;
	}
 	SendClientMessage(playerid,cVERMELHO1,"Este comando não existe. Digite /ajuda para obter ajuda.");
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
	if(pickupid == icomprarBinco)
	{
		AntWorld[playerid] = GetPlayerVirtualWorld(playerid);
		if(GetPlayerMoney(playerid) >= 200)
		{
			SetPlayerVirtualWorld(playerid,playerid+1);
			SetPlayerPos(playerid,218.0859,-98.5134,1005.2578);
			SetPlayerFacingAngle(playerid,88.4822);
			SetPlayerCameraPos(playerid,216.2948,-98.4757,1005.2578);
			SetPlayerCameraLookAt(playerid,218.0859,-98.5134,1005.2578);
    		ShowMenuForPlayer(Roupas,playerid);
    		TogglePlayerControllable(playerid,0);
    	}
 		else
	 	{
    		SendClientMessage(playerid,cVERMELHO1,"LOJA: As roupas aqui custam $200. Portanto tenha $200 em mãos.");
    		return 1;
    	}
    	DestroyPickup(pickupid);
    	icomprarBinco = CreatePickup(1275,1,207.7047,-101.3411,1005.2578);
    }
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:MenuPropostaSkin = GetPlayerMenu(playerid);
    if(MenuPropostaSkin == Roupas)
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
				SetPlayerVirtualWorld(playerid,AntWorld[playerid]);
				ConfirmarSkin(playerid);
				SendClientMessage(playerid,cBRANCO,"LOJA: Obrigado por comprar em nossa loja, volte sempre!");
				TogglePlayerControllable(playerid,1);
				SetCameraBehindPlayer(playerid);
			}
			case 3:
			{
				SetPlayerVirtualWorld(playerid,AntWorld[playerid]);
				HideMenuForPlayer(Roupas,playerid);
				SendClientMessage(playerid,cBRANCO,"LOJA: Obrigado por olhar nossas roupas, volte sempre!");
				TogglePlayerControllable(playerid,1);
				SetCameraBehindPlayer(playerid);
			}
		}
	}
}

public OnPlayerExitedMenu(playerid)
{
    SetPlayerVirtualWorld(playerid,AntWorld[playerid]);
    TogglePlayerControllable(playerid,1);
    SetCameraBehindPlayer(playerid);
	HideMenuForPlayer(Roupas,playerid);
	return 1;
}

//Outros publics e stocks criados
//geral
public LogarPlayer(playerid)
{
    if(dini_Exists(PlayerName(playerid)))
	{
    //dini_Float(PlayerName(playerid),"Vida"));
		GivePlayerMoney(playerid,dini_Int(PlayerName(playerid),"Dinheiro") - GetPlayerMoney(playerid));
    	Emprego[playerid] = dini_Int(PlayerName(playerid),"Job");
    	new Float:X = dini_Float(PlayerName(playerid),"SpawnX"),
		Float:Y = dini_Float(PlayerName(playerid),"SpawnY"),
		Float:Z = dini_Float(PlayerName(playerid),"SpawnZ"),
		Float:ang = dini_Float(PlayerName(playerid),"SpawnAng"),
		Float:health = dini_Float(PlayerName(playerid),"Vida");
		SetPlayerArmour(playerid,dini_Float(PlayerName(playerid),"Colete"));
		if(health <= 0) SetPlayerHealth(playerid,100);
		else SetPlayerHealth(playerid, dini_Float(PlayerName(playerid),"Vida"));
    	SetSpawnInfo(playerid,1,dini_Int(PlayerName(playerid),"Skin"),X,Y,Z,ang,0,0,0,0,0,0);
    	SpawnPlayer(playerid);
	}
}

public ModeCarregando(playerid)
{
	ModeCarregado[playerid] = 1;
	SendClientMessage(playerid,cAMARELO1,"Configurações do servidor carregadas com sucesso.");
 	if(dini_Exists(PlayerName(playerid)))
 	{
		SendClientMessage(playerid,cBRANCO,"Para jogar você deve logar sua conta digitando /logar [senha-criada].");
	}
	else if(!dini_Exists(PlayerName(playerid)))
	{
		SendClientMessage(playerid,cBRANCO,"Para jogar você deve criar uma conta digitando /registrar [crie-uma-senha].");
	}
	return 1;
}

public Areas()
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<SLOT; i++)
	{
		GetPlayerPos(i,X,Y,Z);
		if(IsPlayerConnected(i))
		{
			if((X >= -38.2329 && X <= -13.9545 && Y >= -91.9008 && Y <= -74.6293) || (X >= -36.6328 && X <= -18.2138 && Y >= -57.1352 && Y <= -49.2983) || (X >= -38.2189 && X <= -13.9771 && Y >= -91.9066 && Y <= -74.6286))
			{
				if(AreaMercado[i] == 0)
				{
					GameTextForPlayer(i,"~w~Mercado",3000,1);
					SendClientMessage(i,cBRANCO,"Local para fazer compras de coisas gerais. Digite /mercado para mais informações.");
					AreaMercado[i] = 1;
				}
			}
    		else
			{
				if(AreaMercado[i] == 1)
				{
					AreaMercado[i] = 0;
				}
			}
		}
	}
}

public minrand(min, max)
{
	return random(max - min) + min;
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
	return name;
}

stock GetPlayerDistanceToPointEx(playerid,Float:x2,Float:y2,Float:z2)
{
	new Float:x1,Float:y1,Float:z1, Float:tmpdis;
	GetPlayerPos(playerid,x1,y1,z1);
	tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(tmpdis);
}

public LocalInfo()
{
	for(new i=0; i<SLOT; i++)
	{
		if(GetPlayerDistanceToPointEx(i,377.7690,-119.2981,1001.4922) < 3 && EmpregoInfoPizza[i] == 0)
		{
	        SendClientMessage(i,cAMARELO1,"Emprego de funcionário da pizzaria. Digite /requisitos para saber como ser admitido neste emprego.");
			GameTextForPlayer(i,"~w~Pizzaria",3000,1);
	        EmpregoInfoPizza[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,377.7690,-119.2981,1001.4922) > 3)
		{
			if(EmpregoInfoPizza[i] == 1)
			{
				EmpregoInfoPizza[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,249.2111,67.9817,1003.6406) < 3 && EmpregoInfoDelegacia[i] == 0)
		{
            SendClientMessage(i,cAMARELO1,"Emprego de funcionário da delegacia. Digite /requisitos para saber como ser admitido neste emprego.");
			GameTextForPlayer(i,"~w~Delegacia",3000,1);
	        EmpregoInfoDelegacia[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,249.2111,67.9817,1003.6406) > 3)
		{
			if(EmpregoInfoDelegacia[i] == 1)
			{
				EmpregoInfoDelegacia[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,1757.1324,-1711.8231,13.5414) < 3 && EmpregoInfoTaxi[i] == 0)
		{
            SendClientMessage(i,cAMARELO1,"Emprego de taxista. Digite /requisitos para saber como ser admitido neste emprego.");
			GameTextForPlayer(i,"~w~Central de Taxi",3000,1);
	        EmpregoInfoTaxi[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,1757.1324,-1711.8231,13.5414) > 3)
		{
			if(EmpregoInfoTaxi[i] == 1)
			{
				EmpregoInfoTaxi[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,1691.4221,-1500.2271,13.5469) < 3 && EmpregoInfoBus[i] == 0)
		{
            SendClientMessage(i,cAMARELO1,"Emprego de motorista. Digite /requisitos para saber como ser admitido neste emprego.");
			GameTextForPlayer(i,"~w~Rodovi˜ria",3000,1);
	        EmpregoInfoBus[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,1691.4221,-1500.2271,13.5469) > 3)
		{
			if(EmpregoInfoBus[i] == 1)
			{
				EmpregoInfoBus[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,1739.3018,-1583.7831,14.1583) < 3 && EntradaImobiliaria[i] == 0)
		{
			SendClientMessage(i,cBRANCO,"Digite /entrar para entrar.");
			GameTextForPlayer(i,"~w~Imobili˜ria",3000,1);
	        EntradaImobiliaria[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,1739.3018,-1583.7831,14.1583) > 3)
		{
			if(EntradaImobiliaria[i] == 1)
			{
				EntradaImobiliaria[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,1553.8608,-1675.6165,16.1953) < 3 && EntradaDelegacia[i] == 0)
		{
			SendClientMessage(i,cBRANCO,"Digite /entrar para entrar.");
			GameTextForPlayer(i,"~w~Delegacia",3000,1);
	        EntradaDelegacia[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,1553.8608,-1675.6165,16.1953) > 3)
		{
			if(EntradaDelegacia[i] == 1)
			{
				EntradaDelegacia[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,1017.2278,-1557.8177,14.8657) < 3 && EntradaMatricula[i] == 0)
		{
			SendClientMessage(i,cBRANCO,"Digite /entrar para entrar.");
			GameTextForPlayer(i,"~w~Local de Matricula",3000,1);
	        EntradaMatricula[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,1017.2278,-1557.8177,14.8657) > 3)
		{
			if(EntradaMatricula[i] == 1)
			{
				EntradaMatricula[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,1780.6970,-1807.3055,13.5274) < 3 && EntradaEscola[i] == 0)
		{
			SendClientMessage(i,cBRANCO,"Digite /entrar para entrar.");
			GameTextForPlayer(i,"~w~Escola",3000,1);
	        EntradaEscola[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,1780.6970,-1807.3055,13.5274) > 3)
		{
			if(EntradaEscola[i] == 1)
			{
				EntradaEscola[i] = 0;
			}
		}
		if(GetPlayerDistanceToPointEx(i,2104.4929,-1806.4751,13.5547) < 3 && EntradaPizzaria[i] == 0)
		{
			SendClientMessage(i,cBRANCO,"Digite /entrar para entrar.");
			GameTextForPlayer(i,"~w~Pizzaria",3000,1);
	        EntradaPizzaria[i] = 1;
		}
		else if(GetPlayerDistanceToPointEx(i,2104.4929,-1806.4751,13.5547) > 3)
		{
			if(EntradaPizzaria[i] == 1)
			{
				EntradaPizzaria[i] = 0;
			}
		}
	}
}
/*
public Tempo()
{
	return 1;
}*/
//skins
stock ProximoSkin(playerid)
{
	new nextskin = GetPlayerSkin(playerid) + 1;
	if(nextskin >= 299) nextskin = 0;
	if(IsValidSkin(nextskin))
	{
		SetPlayerSkin(playerid,nextskin);
	}
	else
	{
		new ns;
		for(new s = nextskin; s < MAX_SKINS; s++)
		{
			if(IsValidSkin(s))
			{
				ns = s;
				break;
			}
		}
		SetPlayerSkin(playerid,ns);
	}
	ShowMenuForPlayer(Roupas,playerid);
}

stock AnteriorSkin(playerid)
{
    new getskin = GetPlayerSkin(playerid) - 1;
	new antskin = getskin;
	
	if(antskin <= 0) antskin = 299;
 	if(IsValidSkin(antskin))
 	{
  		SetPlayerSkin(playerid,antskin);
  	}
  	else
  	{
   		new as;
   		
    	for(new i = antskin; i > 0; i --)
		{
    		if(IsValidSkin(i))
			{
 				as = i;
 				break;
 			}
    	}
    	SetPlayerSkin(playerid,as);
    }
    ShowMenuForPlayer(Roupas,playerid);
}

stock ConfirmarSkin(playerid)
{
	RecebeuMenuSkin[playerid] = 0;
 	GivePlayerMoney(playerid,-500);
  	dini_IntSet(PlayerName(playerid),"Skin",GetPlayerSkin(playerid));
}

stock IsValidSkin(skin)
{
    if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==273 || skin==274 || skin==289 || skin>=300) return false;
    return true;
}
//carros
stock CriarArquivoDeCarros()
{
	new tmp[256];
	for(new v=1;v <QTCARS+1 ;v++)
	{
		format(tmp,256,"%d.vinfo",v);
		if(fexist(tmp)) return 0;
		dini_Create(tmp);
		switch(GetVehicleModel(v))
		{
			case 481,509,510:
			{
				dini_IntSet(tmp,"combustivel",-1);
				GPV[v]=-1;
			}
			default:
			{
				dini_IntSet(tmp,"combustivel",100);
				GPV[v]=100;
			}
		}
	}
	return 1;
}

stock SalvarGasolina()
{
	new pattern[256], contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern))
	{
 		dini_IntSet(pattern,"combustivel",GPV[contagem]);
  		contagem++;
  		format(pattern,256,"%d.vinfo",contagem);
	}
	return 1;
}

stock CarregarGasolina()
{
	new pattern[256], contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern))
	{
		GPV[contagem] = dini_Int(pattern,"combustivel");
		contagem++;
		format(pattern,256,"%d.vinfo",contagem);
	}
	return 1;
}

public SalvandoGasolina() SalvarGasolina();

public ChecarGasolina()
{
	for(new i=0;i<SLOT;i++)
	{
		if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
		{
			new Vi = GetPlayerVehicleID(i);
			if(GPV[Vi] == -1) return 1;
			if(GPV[Vi] == 0)
			{
				SendClientMessage(i,cVERMELHO1,"Este veículo está sem gasolina. Compre um galão no posto e reabasteça.");
				TogglePlayerControllable(i,0);
				return 1;
			}
			GPV[Vi]--;
		}
	}
	return 1;
}
