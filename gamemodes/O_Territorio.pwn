#include <a_samp>
#include <seif_text>
#include <dini>

new FALSE = false;
#define SendFormatMessage(%1,%2,%3,%4) do{new sendfstring[128];format(sendfstring,128,(%3),%4);SendClientMessage(%1,(%2),sendfstring);}while(FALSE)
#define SendFormatMessageToAll(%1,%2,%3) do{new sendfstring[128];format(sendfstring,128,(%2),%3);SendClientMessageToAll((%1),sendfstring);}while(FALSE)

#define dcmd(%1,%2,%3) if (!strcmp((%3)[1], #%1, true, (%2)) && ((((%3)[(%2) + 1] == '\0') && (dcmd_%1(playerid, ""))) || (((%3)[(%2) + 1] == ' ') && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

#define BRAZUCAS_PLAYERS 30

#define VERDE                	0x33AA33AA
#define VERMELHO             	0xAA3333AA
#define AMARELO              	0xFFFF00AA
#define BRANCO               	0xFFFFFFAA
#define CINZA             	 	0xAFAFAFAA
#define COR_DESEMPREGADO     	0x808080AA
#define COR_INSTRUTOR        	0xDD0000FF
#define COR_TAXISTA          	0xFFFF00AA
#define COR_POLICIAL_CIVIL      0x0066CCAA
#define COR_POLICIAL_FEDERAL    0x00C7FFAA
#define COR_ASSASSINO        	0x000000AA
#define COR_VENDEDOR         	0xFFE4C4AA
#define COR_DETRAN   		 	0x387272FF
#define COR_HACKER  		 	0x595546FF
#define COR_SEGURANÇA        	0x83BFBFAA
#define COR_FRENTISTA        	0x778899AA
#define COR_PROMOTER         	0xFF7F50AA
#define COR_CORRETOR         	0xBC8F8FAA
#define COR_ADVOGADO         	0xD0D0FFAA
#define COR_MOTORISTA        	0x9ACD32AA
#define COR_PILOTO 	   	   	 	0xFFFF82AA
#define COR_JUIZ             	0x7FFF00AA
#define COR_JORNALISTA       	0xFFFFFFAA
#define COR_ENFERMEIRO       	0xFFC0CBAA
#define COR_BOMBEIRO         	0xDA70D6AA
#define COR_PIZZABOY         	0xB8860BAA
#define COR_TRAFICANTE       	0xA52A2AAA
#define COR_LIXEIRO  		 	0xB0C4DEAA
#define COR_LOCADOR_CARROS   	0x98FB98AA
#define COR_VENDEDOR_ARMAS   	0xC0C0C0AA
#define COR_MECANICO         	0xADD8E6AA
#define COR_BANCARIO         	0x87CEFAAA
#define COR_INVESTIGADOR     	0x8FBC8FAA
#define COR_MOTORISTA_PUBLICO	0x9C4B16AA
#define COR_CAMELO           	0x6456B1FF
#define COR_BRIGHTRED 	     	0xADD8E6AA
#define COR_LIGHTBLUE        	0x87CEFAAA
#define COR_CHAT		     	0xD7FFD7FF
#define COR_CHAT_FAMILIA 	 	0xFF7F50AA
#define COR_CHAT_PROFS       	0xD0D0FFAA
#define COR_CHAT_BAR         	0xADD8E6AA
#define COR_CHAT_CELULAR     	0x87CEFAAA
#define COR_CHAT_ADMIN       	0xFF00FFAA
#define COR_CHAT_PRX         	0xAFAFAFAA
#define COR_CHAT_MONEY       	0xFF0909FF
#define COR_TIME_AZUL        	0x2828FFFF
#define COR_TIME_VERDE       	0x80FF00FF
#define COR_COVEIRO	         	0x808000FF
#define COR_CAMINHONEIRO        0x9F6F3EFF
#define COR_AGRICULTOR			0x555200FF

#define MAX_DEATH_PICKUP	100
#define MAX_WEAPON_MODEL	46
#define VEHICLES_CT	23



forward Tempo();
forward AtualizaGW();
forward Reiniciar();
forward DestruirBarril(objectid);

new weapons[] =
{
	-1, // no fists
	331, // - Brass Knuckles
	333, // Golf Club
	334, // Night Stick
	335, // Knife
	336, // baseball bat
	337, // shovel
	338, // pool cue
	339, // katama
	341, // chainsaw
	321, // regular dildo
	322, // white dildo
	323, // Medium, white vibrator
	324, // smaill, silver vibrator
	325, // flowers
	326, // cane
	342, // grendade
	343, // tear gas
	344, // molotov
	-1, // RPG rocket - we can't pick up those, do we oO
	-1, // Heat-Seeking Rocket
	-1, // Hydra rocket
	346, // colt 45
	347, // colt 45 + silencer
	348, // deagle
	349, // shotgun
	350, // sawn-off
	351, // spaz
	352, // micro-uzi
	353, // mp5
	355, // ak47
	356, // m4
	372, // tec9
	357, // country rifle
	358, // sniper rifle
	359, // rocket launcher
	360, // heat-seeking rocket launcher
	361, // flamethrower
	362, // minigun
	363, // sachtel charges
	-1, // detonator
	365, // spray can
	366, // fire extinguisher
	367, // camera
	-1, // night-vision goggles
	-1, // heat-vision goggles
	371 // parachute
};

enum pDAT
{
	bool:p_created,
	p_money,
	p_weapon,
	p_ammo,
	p_timetolive,
	p_pickupid
}

enum GWinfo
{
	Ativa,
	EquipeDominante,
	TempoDominioG,
	TempoDominioB,
	TempoDominioA,
	TempoDominioV,
	Duracao,
	EquipesInscritas
}

new Pickup[MAX_DEATH_PICKUP][pDAT];
new GW[GWinfo];
new GWParticipante[BRAZUCAS_PLAYERS][4];
new Text:Textdraw2;
new Text:Textdraw0;
new Text:Textdraw1;
new Text:LogoIII;
new Logado[BRAZUCAS_PLAYERS];
new Matou[BRAZUCAS_PLAYERS];
new Morreu[BRAZUCAS_PLAYERS];

new Menu:PrincipalMain;
new Menu:CarrosMain;
new Menu:Carros2Main;
new Menu:ArmasMain;

new Barris[BRAZUCAS_PLAYERS];

new BestScoreI;
new BestScoreII;
new BestScoreIII;
new BestScoreIV;
new BestScoreV;
new BestScoreVI;
new BestScoreVII;
new BestScoreVIII;
new BestScoreIX;
new BestScoreX;

main()
{
	print("\n----------------------------------");
	print(" Brazucas'Server (Minigames): O Territorio");
	print("----------------------------------\n");
}


public OnGameModeInit()
{
    CarregarRank();

	IniciarGW();
	SetTimer("Tempo",1000,1);

	UsePlayerPedAnims();
	AllowAdminTeleport(1);
	GangZoneCreate(1865.2404,-1271.3088,2065.7971,-1129.5336);

	SetGameModeText("O Territorio");
	SendRconCommand("hostname Brazucas'Server (Minigames)");
	SendRconCommand("unloadfs yrace");
	
	AddPlayerClass(105,2457.1599,-1663.4143,13.3047,83.1299,0,0,0,0,0,0); //
	AddPlayerClass(106,2457.1599,-1663.4143,13.3047,83.1299,0,0,0,0,0,0); //
	AddPlayerClass(107,2457.1599,-1663.4143,13.3047,83.1299,0,0,0,0,0,0); //

	AddPlayerClass(114,1806.5999,-1902.0076,13.4014,18.1477,0,0,0,0,0,0); //
	AddPlayerClass(115,1806.5999,-1902.0076,13.4014,18.1477,0,0,0,0,0,0); //
	AddPlayerClass(116,1806.5999,-1902.0076,13.4014,18.1477,0,0,0,0,0,0); //

	AddPlayerClass(102,1267.7567,-912.3044,42.8828,203.0161,0,0,0,0,0,0); //
	AddPlayerClass(103,1267.7567,-912.3044,42.8828,203.0161,0,0,0,0,0,0); //
	AddPlayerClass(104,1267.7567,-912.3044,42.8828,203.0161,0,0,0,0,0,0); //

	AddPlayerClass(108,2637.1702,-1063.2218,69.6250,269.5883,0,0,0,0,0,0); //
	AddPlayerClass(109,2637.1702,-1063.2218,69.6250,269.5883,0,0,0,0,0,0); //
	AddPlayerClass(110,2637.1702,-1063.2218,69.6250,269.5883,0,0,0,0,0,0); //

	AddStaticPickup(356,2,214.4112,1820.0106,6.4141); //Pickups CTF
	AddStaticPickup(372,2,213.5667,1822.6277,6.4141); //Pickups CTF
	AddStaticPickup(371,2,214.0145,1825.7460,6.4141); //Pickups CTF
	AddStaticPickup(356,2,271.1248,1880.1704,-30.3906); //Pickups CTF
	AddStaticPickup(372,2,266.0266,1880.1431,-30.3906); //Pickups CTF
	AddStaticPickup(371,2,268.7366,1879.9812,-30.3906); //Pickups CTF
	AddStaticPickup(359,2,330.2842,1839.3096,7.8281); //Pickups CTF
	AddStaticPickup(359,2,278.0537,1839.8566,7.8281); //Pickups CTF
	AddStaticPickup(350,2,297.7777,1847.5494,7.7341); //Pickups CTF
	AddStaticPickup(350,2,287.2935,1824.5753,7.7266); //Pickups CTF
//	AddStaticPickup(ID COLETE,2,1968.0924,-1199.0891,16.9939);

	AddStaticVehicle(492,2508.5090,-1666.4097,13.2747,11.4708,16,1); // GROVES_GREENWOOD
	AddStaticVehicle(567,2489.0510,-1682.9027,13.2108,270.5955,16,1); // GROVES_SAVANNA
	AddStaticVehicle(412,2486.7891,-1655.0251,13.2088,90.4016,16,1); // GROVES_VOODOO
	AddStaticVehicle(468,2473.3848,-1697.2997,13.3921,359.4796,16,1); // GROVES_SANCHEZ
	AddStaticVehicle(547,1805.3359,-1932.5902,13.2614,359.9288,7,1); // AZTECAS_PRIMO1
	AddStaticVehicle(575,1790.8677,-1932.7535,12.9896,359.6175,7,1); // AZTECAS_Broadway
	AddStaticVehicle(547,1775.5305,-1932.6329,13.2607,0.1203,7,1); // AZTECAS_PRIMO3
	AddStaticVehicle(468,1779.4629,-1885.6946,13.2639,270.2989,7,1); // AZTECAS_SANCHEZ
	AddStaticVehicle(517,1264.0809,-921.4686,41.9632,98.9784,3,1); // BALLAS_Majestic
	AddStaticVehicle(566,1249.2615,-923.9471,42.1683,100.8712,3,1); // BALLAS_Tahoma1
	AddStaticVehicle(566,1284.6776,-919.1311,40.9032,92.6332,3,1); // BALLAS_Tahoma2
	AddStaticVehicle(468,1272.6191,-906.0139,42.4757,186.7478,3,1); // BALLAS_SANCHEZ
	AddStaticVehicle(405,2638.8320,-1099.8613,68.6950,0.0952,6,1); // VAGOS_SENTINEL1
	AddStaticVehicle(474,2638.8323,-1088.0681,69.0542,0.4985,6,1); // VAGOS_Hermes
	AddStaticVehicle(405,2638.8872,-1067.3002,69.0538,359.4662,6,1); // VAGOS_SENTINEL2
	AddStaticVehicle(468,2629.8911,-1055.9419,69.2056,89.5723,6,1); // VAGOS_sanchez
	
	Textdraw0 = TextDrawCreate(490.000000,100.000000,"~g~(bra~y~z~b~u~w~c~b~a~y~s~g~rpg)");
	Textdraw1 = TextDrawCreate(504.000000,119.000000,"minigames");
	TextDrawAlignment(Textdraw0,0);
	TextDrawAlignment(Textdraw1,0);
	TextDrawBackgroundColor(Textdraw0,0x000000ff);
	TextDrawBackgroundColor(Textdraw1,0x000000ff);
	TextDrawFont(Textdraw0,3);
	TextDrawLetterSize(Textdraw0,0.499999,1.800000);
	TextDrawFont(Textdraw1,2);
	TextDrawLetterSize(Textdraw1,0.399999,1.000000);
	TextDrawColor(Textdraw0,0xffffffff);
	TextDrawColor(Textdraw1,0xffffffff);
	TextDrawSetOutline(Textdraw0,1);
	TextDrawSetProportional(Textdraw0,1);
	TextDrawSetProportional(Textdraw1,1);
	TextDrawSetShadow(Textdraw0,1);
	TextDrawSetShadow(Textdraw1,1);

	Textdraw2 = TextDrawCreate(328.000000,421.000000," ");
	TextDrawAlignment(Textdraw2,2);
	TextDrawBackgroundColor(Textdraw2,0x000000ff);
	TextDrawFont(Textdraw2,1);
	TextDrawLetterSize(Textdraw2,0.599999,2.299999);
	TextDrawColor(Textdraw2,0xffffffff);
	TextDrawSetOutline(Textdraw2,1);
	TextDrawSetProportional(Textdraw2,1);
	TextDrawSetShadow(Textdraw2,1);
	
	LogoIII = TextDrawCreate(87.000000,324.000000,"O Territorio");
	TextDrawAlignment(LogoIII,2);
	TextDrawBackgroundColor(LogoIII,0x000000cc);
	TextDrawFont(LogoIII,1);
	TextDrawLetterSize(LogoIII,0.399999,1.000000);
	TextDrawColor(LogoIII,0xffffffff);
	TextDrawSetProportional(LogoIII,1);
	TextDrawSetShadow(LogoIII,1);
	
    PrincipalMain = CreateMenu("Loja",2,100,200,90,25);
	AddMenuItem(PrincipalMain,0,"Armas");
	AddMenuItem(PrincipalMain,0,"Veiculos");

    ArmasMain = CreateMenu("Armas:",2,100,200,90,25);
	AddMenuItem(ArmasMain,0,"Lanca-misseis");
	AddMenuItem(ArmasMain,1,"50 pontos");
	AddMenuItem(ArmasMain,0,"M4");
	AddMenuItem(ArmasMain,1,"30 pontos");
	AddMenuItem(ArmasMain,0,"MP5");
	AddMenuItem(ArmasMain,1,"20 pontos");
	AddMenuItem(ArmasMain,0,"Granadas");
	AddMenuItem(ArmasMain,1,"80 pontos");
	AddMenuItem(ArmasMain,0,"Barril explosivo");
	AddMenuItem(ArmasMain,1,"100 pontos");
	AddMenuItem(ArmasMain,0,"Colete");
	AddMenuItem(ArmasMain,1,"50 pontos");
	AddMenuItem(ArmasMain,0,"Sair");

    CarrosMain = CreateMenu("Veiculos:",2,100,200,90,25);
	AddMenuItem(CarrosMain,0,"Infernus");//RAPIDO 2p
	AddMenuItem(CarrosMain,1,"1500");//RAPIDO 2p
	AddMenuItem(CarrosMain,0,"Sultan");// RAPIDO 4p
	AddMenuItem(CarrosMain,1,"1250");// RAPIDO 4p
	AddMenuItem(CarrosMain,0,"NRG");//RAPIDO MOTO
	AddMenuItem(CarrosMain,1,"1250");//RAPIDO MOTO
	AddMenuItem(CarrosMain,0,"Blade");//MEDIO 2p
	AddMenuItem(CarrosMain,1,"750");//MEDIO 2p
	AddMenuItem(CarrosMain,0,"Sentinel");//MEDIO 4p
	AddMenuItem(CarrosMain,1,"750");//MEDIO 4p
	AddMenuItem(CarrosMain,0,"Sanchez");//MEDIO MOTO
	AddMenuItem(CarrosMain,1,"900");//MEDIO MOTO
	AddMenuItem(CarrosMain,0,"Manana");//LENTO 2p
	AddMenuItem(CarrosMain,1,"500");//LENTO 2p
	AddMenuItem(CarrosMain,0,"Proxima pagina");//LENTO 2p

    Carros2Main = CreateMenu("Veiculos:",2,100,200,90,25);
	AddMenuItem(Carros2Main,0,"Nebula");//LENTO 4p
	AddMenuItem(Carros2Main,1,"600");//LENTO 4p
	AddMenuItem(Carros2Main,0,"Faggio");//LENTO MOTO
	AddMenuItem(Carros2Main,1,"200");//LENTO MOTO
	AddMenuItem(Carros2Main,0,"Dozer");//MISC
	AddMenuItem(Carros2Main,1,"1000");//MISC
	AddMenuItem(Carros2Main,0,"Dumper");//MISC
	AddMenuItem(Carros2Main,1,"1500");//MISC
	AddMenuItem(Carros2Main,0,"Combine");//MISC
	AddMenuItem(Carros2Main,1,"750");//MISC
	AddMenuItem(Carros2Main,0,"Tropic");//BARCO
	AddMenuItem(Carros2Main,1,"800");//BARCO
	AddMenuItem(Carros2Main,0,"Maverick");//HELI
	AddMenuItem(Carros2Main,1,"1500");//HELI
	return 1;
}

public OnGameModeExit()
{
	AtualizarRank();
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    PlayerPlaySound(playerid,1183,0,0,0);
 	if(classid==0||classid==1||classid==2)
	{
		SetPlayerCameraPos( playerid, 2452.7590, -1663.4143, 13.9046 );
		SetPlayerCameraLookAt( playerid, 2462.7590, -1663.4143, 13.9046 );
		SetPlayerPos(playerid,2457.1599,-1663.4143,13.3047);
		SetPlayerFacingAngle(playerid,83.0);
		SetPlayerTeam(playerid,1);
		GWParticipante[playerid][1]=1;
		switch(classid)
		{
		    case 4:ApplyAnimation(playerid,"GHANDS","gsign1",4.1,1,1,1,1,1);
		    case 5:ApplyAnimation(playerid,"FIGHT_D","FightD_IDLE",4.0,1,1,1,1,0);
		    case 6:ApplyAnimation(playerid,"RIOT","RIOT_FUKU",4.1,0,1,1,1,1);
		    case 7:ApplyAnimation(playerid,"PED","endchat_02",4.1,0,1,1,1,1);
		}
	}
	else if(classid==6||classid==7||classid==8)
	{
		SetPlayerCameraPos( playerid, 1269.3144, -915.4324, 43.0828 );
		SetPlayerCameraLookAt( playerid, 1264.0152, -906.9519, 43.0828 );
		SetPlayerPos(playerid,1267.7567,-912.3044,42.8828);
		SetPlayerFacingAngle(playerid,203);
		SetPlayerTeam(playerid,4);
		GWParticipante[playerid][1]=2;
		switch(classid)
		{
		    case 0:ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1,1,1,1,1,1); // Cop Looking
		    case 1:ApplyAnimation(playerid,"ped","fucku",4.1,1,1,1,1,1);
		    case 2:ApplyAnimation(playerid,"RAPPING","Laugh_01",4.1,1,1,1,1,1);
		    case 3:ApplyAnimation(playerid,"Freeweights","gym_free_celebrate",4.1,0,1,1,1,1);
		}
	}
	else if(classid==3||classid==4||classid==5)
	{
		SetPlayerCameraPos( playerid, 1805.4315, -1898.7471, 13.7013 );
		SetPlayerCameraLookAt( playerid, 1809.6577, -1907.8103, 13.7013 );
		SetPlayerPos(playerid,1806.5999,-1902.0076,13.4014);
		SetPlayerFacingAngle(playerid,18);
		SetPlayerTeam(playerid,3);
		GWParticipante[playerid][1]=3;
		switch(classid)
		{
		    case 0:ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1,1,1,1,1,1); // Cop Looking
		    case 1:ApplyAnimation(playerid,"ped","fucku",4.1,1,1,1,1,1);
		    case 2:ApplyAnimation(playerid,"RAPPING","Laugh_01",4.1,1,1,1,1,1);
		    case 3:ApplyAnimation(playerid,"Freeweights","gym_free_celebrate",4.1,0,1,1,1,1);
		}
	}
	else if(classid==9||classid==10||classid==11)
	{
		SetPlayerCameraPos( playerid, 2641.0280, -1063.3148, 69.7250 );
		SetPlayerCameraLookAt( playerid, 2631.0280, -1063.3148, 69.7250 );
		SetPlayerPos(playerid,2637.1702,-1063.2218,69.6250);
		SetPlayerFacingAngle(playerid,270);
		SetPlayerTeam(playerid,2);
		GWParticipante[playerid][1]=4;
		switch(classid)
		{
		    case 0:ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1,1,1,1,1,1); // Cop Looking
		    case 1:ApplyAnimation(playerid,"ped","fucku",4.1,1,1,1,1,1);
		    case 2:ApplyAnimation(playerid,"RAPPING","Laugh_01",4.1,1,1,1,1,1);
		    case 3:ApplyAnimation(playerid,"Freeweights","gym_free_celebrate",4.1,0,1,1,1,1);
		}
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	if(dini_Exists(Profile(playerid)))
	{
	    if(dini_Int(Profile(playerid),"Banido")==1) return SendClientMessage(playerid,COR_PROMOTER,"Você foi banido do Brazucas'Server (Minigames). Para argumentar sobre isto visite a comunidade"),Kick(playerid);
	}

	Logado[playerid]=0;
	Matou[playerid]=0;
	Morreu[playerid]=0;
    GWParticipante[playerid][0]=0;
    ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1,1,1,1,1,1); // Cop Looking
    ApplyAnimation(playerid,"ped","fucku",4.1,1,1,1,1,1);
    ApplyAnimation(playerid,"RAPPING","Laugh_01",4.1,1,1,1,1,1);
    ApplyAnimation(playerid,"Freeweights","gym_free_celebrate",4.1,0,1,1,1,1);
    ApplyAnimation(playerid,"GHANDS","gsign1",4.1,1,1,1,1,1);
    ApplyAnimation(playerid,"FIGHT_D","FightD_IDLE",4.0,1,1,1,1,0);
    ApplyAnimation(playerid,"PED","endchat_03",4.1,0,1,1,1,1);
    ApplyAnimation(playerid,"PED","endchat_02",4.1,0,1,1,1,1);
    ApplyAnimation(playerid,"RIOT","RIOT_FUKU",4.1,0,1,1,1,1);
    GameTextForPlayer(playerid,"~w~o territorio",2000,1);
    SendDeathMessage(INVALID_PLAYER_ID,playerid,200);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    	SendDeathMessage(INVALID_PLAYER_ID,playerid,201);
    	Salvar(playerid);
		return 1;
}

public OnPlayerSpawn(playerid)
{
    PlayerPlaySound(playerid,1184,0,0,0);
    TextDrawShowForPlayer(playerid,Text:Textdraw0);
    TextDrawShowForPlayer(playerid,Text:Textdraw1);
    TextDrawShowForPlayer(playerid,Text:Textdraw2);
    TextDrawShowForPlayer(playerid,Text:LogoIII);
	GangZoneShowForPlayer(playerid,0,COR_PROMOTER);
	SetarJogadorNaGW(playerid);
	if(Logado[playerid]==0) SendClientMessage(playerid,COR_PILOTO,"Você não está autenticado. Se possui conta, autentique-se '/entrar' caso não possua, crie uma '/registrar'");
	return 1;
}

public OnPlayerPickUpPickup( playerid, pickupid )
{
	for(new p;p<MAX_DEATH_PICKUP;p++)
	{
	    if(Pickup[p][p_pickupid]==pickupid)
	    {
			if(Pickup[p][p_weapon]>0)
			{
			    GivePlayerWeapon(playerid,Pickup[p][p_weapon],Pickup[p][p_ammo]);
			}
			DestroyPickup(Pickup[p][p_pickupid]);
			Pickup[p][p_created]=false;
   			Pickup[p][p_timetolive]=0;
      		Pickup[p][p_money]=0;
      		Pickup[p][p_weapon]=0;
      		Pickup[p][p_ammo]=0;
		}
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	DropWeapons(playerid);
	Morreu[playerid]++;
	SendDeathMessage(killerid,playerid,reason);
    GWParticipante[playerid][3]=-500;
	ResetPlayerWeapons(playerid);
	SetPlayerScore(playerid, GetPlayerScore(playerid) -10);
	
	if(GWParticipante[playerid][0]>0)
	{
            GWParticipante[playerid][2]=0;
	        if(GWParticipante[playerid][1]==1)//groves
	        {
	            SetSpawnInfo(playerid, 1, GetPlayerSkin(playerid),2490.4888,-1668.3185,13.3438,0.0, 16, 10, 30, 1500, 28, 1500);
	        }
	        else if(GWParticipante[playerid][1]==2)//ballas
	        {
	            SetSpawnInfo(playerid, 1, GetPlayerSkin(playerid),1267.1442,-887.9890,42.8828,0.0, 16, 10, 30, 1500, 28, 1500);
	        }
	        else if(GWParticipante[playerid][1]==3)//aztecas
	        {
                SetSpawnInfo(playerid, 1, GetPlayerSkin(playerid),1786.1470,-1906.1602,13.3938,0.0, 16, 10, 30, 1500, 28, 1500);
	        }
	        else if(GWParticipante[playerid][1]==4)//vagos
	        {
                SetSpawnInfo(playerid, 1, GetPlayerSkin(playerid),2632.4458,-1083.5834,69.6209,0.0, 16, 10, 30, 1500, 28, 1500);
	        }
	}
	
	if(killerid!=INVALID_PLAYER_ID)
	{
	    Matou[killerid]++;
		if(GWParticipante[playerid][1]!=GWParticipante[killerid][1])
		{
		    SetPlayerScore(killerid,GetPlayerScore(killerid)+50);
		}
		else
		{
		    SendClientMessage(killerid, VERMELHO, "Não mate membros de usa equipe! Perdeu pontos ¬¬");
		    SetPlayerScore(killerid,GetPlayerScore(killerid)-50);
		}
	    
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

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
    for(new i=0;i<BRAZUCAS_PLAYERS;i++)
	{
		if(IsPlayerAdmin(i)&&recieverid!=i)
		{
	   		SendFormatMessage(i,COR_PILOTO,"[PM]%s para %s: %s",PlayerName(playerid),PlayerName(recieverid),text);
	   	}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys==1024)
    {
        if(Barris[playerid]>0)
        {
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(playerid,X,Y,Z);
			Barris[playerid]--;
			GetXYInFrontOfPlayer(playerid,X,Y,0.6);
			new Barril = CreateObject(1225,X,Y,Z-0.6,0,0,0);
			SetTimerEx("DestruirBarril",30000,0,"i",Barril);
		}
    }
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	dcmd(morrer, 6, cmdtext);
	dcmd(jetpack, 7, cmdtext);
	dcmd(teleporton, 10, cmdtext);
	dcmd(teleportoff, 11, cmdtext);
	dcmd(registrar, 9, cmdtext);
	dcmd(entrar, 6, cmdtext);
	dcmd(t, 1, cmdtext);
	dcmd(loja, 4, cmdtext);
	dcmd(rank, 4, cmdtext);

	new cmd[128],idx;
	cmd = strtok(cmdtext, idx);
	return 0;
}


dcmd_rank(playerid, params[])
{
    #pragma unused params
	CheckRank(playerid);
	return 1;
}

dcmd_loja(playerid,params[]) {
	#pragma unused params
	ShowMenuForPlayer(PrincipalMain,playerid);
	TogglePlayerControllable(playerid,false);
	return true;
}

dcmd_t(playerid,params[]) {
	if(strlen(params)==0) return SendClientMessage(playerid,VERMELHO,"Uso correto: /t [texto]");
	for(new i=0;i<=BRAZUCAS_PLAYERS;i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(TimeDoJogador(i)==TimeDoJogador(playerid))
	        {
	            SendFormatMessage(i,COR_PROMOTER,"[EQUIPE] %s diz: %s",PlayerName(playerid),params);
	        }
	    }
	}
	return true;
}

dcmd_morrer(playerid, params[])
{
    #pragma unused params
	SetPlayerHealth(playerid,0);
	return 1;
}

dcmd_jetpack(playerid, params[])
{
    #pragma unused params
	if(IsPlayerAdmin(playerid)) SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
	return 1;
}

dcmd_teleporton(playerid, params[])
{
    #pragma unused params
	if(IsPlayerAdmin(playerid)) AllowPlayerTeleport(playerid,1);
	return 1;
}

dcmd_teleportoff(playerid, params[])
{
    #pragma unused params
    AllowPlayerTeleport(playerid,0);
	return 1;
}

dcmd_registrar(playerid,params[]) {
	if(Logado[playerid] == 1) return SendClientMessage(playerid,VERMELHO ,"Você já está logado...");
	if(dini_Exists(Profile(playerid))) return SendClientMessage(playerid,VERMELHO,"Você já é registrado. Para logar use /entrar");
	if(strlen(params)==0) return SendClientMessage(playerid,VERMELHO,"Uso correto: /registrar [senha]");
	dini_Create(Profile(playerid));
	dini_Set(Profile(playerid),"Senha",params);
	SendClientMessage(playerid,COR_PILOTO,"Conta criada. Você foi logado automaticamente...");
	Logado[playerid]=1;
	Carregar(playerid);
	return true;
}

dcmd_entrar(playerid,params[]) {
	if(Logado[playerid] == 1) return SendClientMessage(playerid,VERMELHO ,"Você já está logado...");
	if(!dini_Exists(Profile(playerid))) return SendClientMessage(playerid,VERMELHO,"Você não está registrado. Para registrar use /registrar");
	if(strlen(params)==0) return SendClientMessage(playerid,VERMELHO,"Uso correto: /entrar [senha]");

	new senha[256];
	senha = dini_Get(Profile(playerid),"Senha");
	if(strcmp(senha,params,false) == 0)
	{
		Logado[playerid]=1;
		Carregar(playerid);
		SendClientMessage(playerid,COR_PILOTO,"Logado...");
	}
	else
	{
	    return SendClientMessage(playerid,VERMELHO,"Senha incorreta.");
	}
	return 1;
}

stock TimeDoJogador(playerid)
{
	return GWParticipante[playerid][1];
}

stock Profile(playerid)
{
	new profile[128];
	format(profile,sizeof(profile),"minigames/contas/%s.txt",PlayerName(playerid));
	return profile;
}

stock Salvar(playerid)
{
	if(Logado[playerid]==1)
	{
		dini_IntSet(Profile(playerid),"Pontos",GetPlayerScore(playerid));
		dini_IntSet(Profile(playerid),"Matou",dini_Int(Profile(playerid),"Matou")+Matou[playerid]);
		dini_IntSet(Profile(playerid),"Morreu",dini_Int(Profile(playerid),"Morreu")+Morreu[playerid]);
		VerificarRank(playerid);
	}
}

stock Carregar(playerid)
{
	SetPlayerScore(playerid,dini_Int(Profile(playerid),"Pontos"));
}

stock VerificarRank(playerid)
{
	new score = dini_Int(Profile(playerid),"Pontos");
	new kills = dini_Int(Profile(playerid),"Matou");
	new deaths = dini_Int(Profile(playerid),"Morreu");

	new Score = score + kills*1000 - deaths*500;

	if(Score > BestScoreI && Ranckeado(playerid)>=1) Rank(playerid,1);
	else if(Score > BestScoreII && Ranckeado(playerid)>=2) Rank(playerid,2);
	else if(Score > BestScoreIII && Ranckeado(playerid)>=3) Rank(playerid,3);
	else if(Score > BestScoreIV && Ranckeado(playerid)>=4) Rank(playerid,4);
	else if(Score > BestScoreV && Ranckeado(playerid)>=5) Rank(playerid,5);
	else if(Score > BestScoreVI && Ranckeado(playerid)>=6) Rank(playerid,6);
	else if(Score > BestScoreVII && Ranckeado(playerid)>=7) Rank(playerid,7);
	else if(Score > BestScoreVIII && Ranckeado(playerid)>=8) Rank(playerid,8);
	else if(Score > BestScoreIX && Ranckeado(playerid)>=9) Rank(playerid,9);
	else if(Score > BestScoreX && Ranckeado(playerid)>=10) Rank(playerid,10);
}

stock Ranckeado(playerid)
{
	new rank=11,
	    rankinfo[64],
		bool:rankeado=false;

	for(new r=1;r<=10;r++)
	{
	    if(rankeado==false)
	    {
			format(rankinfo,64,"%d_Nome",r);
			format(rankinfo,64,"%s",rankinfo);
			if(strcmp(rankinfo,PlayerName(playerid),false) == 0)
			{
			    rankeado=true;
			    rank=r;
			}
		}
	}
	return rank;
}

stock Rank(playerid,rank)
{
    new rankinfo[10];
	if(dini_Exists("Rank.txt"))
	{
	    format(rankinfo,10,"%d_Nome",rank);
		dini_Set("Rank.txt",rankinfo,PlayerName(playerid));
		format(rankinfo,10,"%d_Score",rank);
		dini_IntSet("Rank.txt",rankinfo,dini_Int(Profile(playerid),"Pontos"));
		format(rankinfo,10,"%d_Matou",rank);
		dini_IntSet("Rank.txt",rankinfo,dini_Int(Profile(playerid),"Matou"));
		format(rankinfo,10,"%d_Morreu",rank);
		dini_IntSet("Rank.txt",rankinfo,dini_Int(Profile(playerid),"Morreu"));
	}
}

stock CarregarRank()
{
	if(dini_Exists("Rank.txt"))
	{
        BestScoreI = dini_Int("Rank.txt","1_Score") + dini_Int("Rank.txt","1_Matou")*1000 - dini_Int("Rank.txt","1_Morreu")*500;
        BestScoreII = dini_Int("Rank.txt","2_Score") + dini_Int("Rank.txt","2_Matou")*1000 - dini_Int("Rank.txt","2_Morreu")*500;
        BestScoreIII = dini_Int("Rank.txt","3_Score") + dini_Int("Rank.txt","3_Matou")*1000 - dini_Int("Rank.txt","3_Morreu")*500;
        BestScoreVI = dini_Int("Rank.txt","4_Score") + dini_Int("Rank.txt","4_Matou")*1000 - dini_Int("Rank.txt","4_Morreu")*500;
        BestScoreV = dini_Int("Rank.txt","5_Score") + dini_Int("Rank.txt","5_Matou")*1000 - dini_Int("Rank.txt","5_Morreu")*500;
        BestScoreVI = dini_Int("Rank.txt","6_Score") + dini_Int("Rank.txt","6_Matou")*1000 - dini_Int("Rank.txt","6_Morreu")*500;
        BestScoreVII = dini_Int("Rank.txt","7_Score") + dini_Int("Rank.txt","7_Matou")*1000 - dini_Int("Rank.txt","7_Morreu")*500;
        BestScoreVIII = dini_Int("Rank.txt","8_Score") + dini_Int("Rank.txt","8_Matou")*1000 - dini_Int("Rank.txt","8_Morreu")*500;
        BestScoreIX = dini_Int("Rank.txt","9_Score") + dini_Int("Rank.txt","9_Matou")*1000 - dini_Int("Rank.txt","9_Morreu")*500;
        BestScoreX = dini_Int("Rank.txt","10_Score") + dini_Int("Rank.txt","10_Matou")*1000 - dini_Int("Rank.txt","10_Morreu")*500;
	}
}

stock CheckRank(playerid)
{
	SendClientMessage(playerid,COR_POLICIAL_FEDERAL,"[TOP 10]===========================");
	SendFormatMessage(playerid,COR_PILOTO,"1. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","1_Nome"),dini_Int("Rank.txt","1_Score"),dini_Int("Rank.txt","1_Matou"),dini_Int("Rank.txt","1_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"2. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","2_Nome"),dini_Int("Rank.txt","2_Score"),dini_Int("Rank.txt","2_Matou"),dini_Int("Rank.txt","2_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"3. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","3_Nome"),dini_Int("Rank.txt","3_Score"),dini_Int("Rank.txt","3_Matou"),dini_Int("Rank.txt","3_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"4. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","4_Nome"),dini_Int("Rank.txt","4_Score"),dini_Int("Rank.txt","4_Matou"),dini_Int("Rank.txt","4_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"5. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","5_Nome"),dini_Int("Rank.txt","5_Score"),dini_Int("Rank.txt","5_Matou"),dini_Int("Rank.txt","5_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"6. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","6_Nome"),dini_Int("Rank.txt","6_Score"),dini_Int("Rank.txt","6_Matou"),dini_Int("Rank.txt","6_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"7. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","7_Nome"),dini_Int("Rank.txt","7_Score"),dini_Int("Rank.txt","7_Matou"),dini_Int("Rank.txt","7_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"8. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","8_Nome"),dini_Int("Rank.txt","8_Score"),dini_Int("Rank.txt","8_Matou"),dini_Int("Rank.txt","8_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"9. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","9_Nome"),dini_Int("Rank.txt","9_Score"),dini_Int("Rank.txt","9_Matou"),dini_Int("Rank.txt","9_Morreu"));
	SendFormatMessage(playerid,COR_PILOTO,"10. %s Pontos: %d Matou: %d Morreu: %d",dini_Get("Rank.txt","10_Nome"),dini_Int("Rank.txt","10_Score"),dini_Int("Rank.txt","10_Matou"),dini_Int("Rank.txt","10_Morreu"));
	SendClientMessage(playerid,COR_POLICIAL_FEDERAL,"[TOP 10]===========================");
}

stock AtualizarRank()
{
	print("Atualizando rank...");
	fremove("RankList.txt");
	new str[255],File:log=fopen("RankList.txt",io_append);

	format(str,sizeof(str),"1. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","1_Nome"),dini_Int("Rank.txt","1_Score"),dini_Int("Rank.txt","1_Matou"),dini_Int("Rank.txt","1_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"2. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","2_Nome"),dini_Int("Rank.txt","2_Score"),dini_Int("Rank.txt","2_Matou"),dini_Int("Rank.txt","2_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"3. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","3_Nome"),dini_Int("Rank.txt","3_Score"),dini_Int("Rank.txt","3_Matou"),dini_Int("Rank.txt","3_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"4. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","4_Nome"),dini_Int("Rank.txt","4_Score"),dini_Int("Rank.txt","4_Matou"),dini_Int("Rank.txt","4_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"5. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","5_Nome"),dini_Int("Rank.txt","5_Score"),dini_Int("Rank.txt","5_Matou"),dini_Int("Rank.txt","5_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"6. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","6_Nome"),dini_Int("Rank.txt","6_Score"),dini_Int("Rank.txt","6_Matou"),dini_Int("Rank.txt","6_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"7. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","7_Nome"),dini_Int("Rank.txt","7_Score"),dini_Int("Rank.txt","7_Matou"),dini_Int("Rank.txt","7_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"8. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","8_Nome"),dini_Int("Rank.txt","8_Score"),dini_Int("Rank.txt","8_Matou"),dini_Int("Rank.txt","8_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"9. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","9_Nome"),dini_Int("Rank.txt","9_Score"),dini_Int("Rank.txt","9_Matou"),dini_Int("Rank.txt","9_Morreu"));fwrite(log,str);
	format(str,sizeof(str),"10. %s Pontos: %d Matou: %d Morreu: %d\r\n",dini_Get("Rank.txt","10_Nome"),dini_Int("Rank.txt","10_Score"),dini_Int("Rank.txt","10_Matou"),dini_Int("Rank.txt","10_Morreu"));fwrite(log,str);

	fclose(log);
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	TogglePlayerControllable(playerid,true);
	return 1;
}

stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);

    if (GetPlayerVehicleID(playerid)) {
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }

    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}

public OnPlayerSelectedMenuRow(playerid,row)
{
	new Menu:Current = GetPlayerMenu(playerid);
	if (Current == ArmasMain)
	{
		switch(row)
		{
 			case 0:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 50){
			GivePlayerWeapon(playerid, 35, 5),SetPlayerScore(playerid, GetPlayerScore(playerid) -50),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 1:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 30){
			GivePlayerWeapon(playerid, 31, 300),SetPlayerScore(playerid, (GetPlayerScore(playerid) -30)),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 2:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 20){
			GivePlayerWeapon(playerid, 29, 500),SetPlayerScore(playerid, (GetPlayerScore(playerid) -20)),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 3:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 80){
			GivePlayerWeapon(playerid, 16, 5),SetPlayerScore(playerid, (GetPlayerScore(playerid) -80)),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 4:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 100){
			Barris[playerid]++,SetPlayerScore(playerid, (GetPlayerScore(playerid) -100)),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
            case 5:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 50){
			SetPlayerArmour(playerid, 100),SetPlayerScore(playerid, (GetPlayerScore(playerid) -50)),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
            case 6:
			if(IsPlayerConnected(playerid)){
			TogglePlayerControllable(playerid, 1) && HideMenuForPlayer(ArmasMain,playerid);
			}
		}
	}
	if (Current == CarrosMain)
	{
        new Float:X, Float:Y, Float:Z;
		switch(row)
		{
 			case 0:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 1500){//411
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(411,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -1500),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 1:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 1250){//
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(566,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -1250),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 2:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 1250){//
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(522,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -1250),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 3:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 750){//536
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(536,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -750),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 4:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 750){//405
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(468,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -750),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
            case 5:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 900){//468
   			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(536,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -900),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
            case 6:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 500){//410
    		GetPlayerPos(playerid,X,Y,Z),CreateVehicle(410,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -500),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
            case 7:
			if(IsPlayerConnected(playerid)){
			HideMenuForPlayer(Carros2Main, playerid);
			ShowMenuForPlayer(Carros2Main, playerid);
			}
		}
	}
	else if (Current == Carros2Main)
	{
        new Float:X, Float:Y, Float:Z;
		switch(row)
		{
 			case 0:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >=600){//
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(516,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -600),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 1:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 200){//
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(462,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -200),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 2:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 1000){//
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(486,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -1000),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 3:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 1500){//536
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(406,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -1500),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
			case 4:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 750){//405
			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(532,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -750),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
            case 5:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 800){//468
   			GetPlayerPos(playerid,X,Y,Z),CreateVehicle(454,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -500),TogglePlayerControllable(playerid, 1);
			}else{SendClientMessage(playerid,VERMELHO,"Você não tem score suficiente para este item"),TogglePlayerControllable(playerid,true);}
            case 6:
			if(IsPlayerConnected(playerid) && GetPlayerScore(playerid) >= 1500){//410
    		GetPlayerPos(playerid,X,Y,Z),CreateVehicle(487,X+1,Y+1,Z,0,CorAleatoria(),CorAleatoria(),60) ,SetPlayerScore(playerid, GetPlayerScore(playerid) -1500),TogglePlayerControllable(playerid, 1);
			}
		}
	}
	else if (Current == PrincipalMain)
	{
		switch(row)
		{
 			case 0:
			if(IsPlayerConnected(playerid))
			{
				HideMenuForPlayer(ArmasMain, playerid);
				ShowMenuForPlayer(ArmasMain, playerid);
			}
			case 1:
			if(IsPlayerConnected(playerid))
			{
				HideMenuForPlayer(CarrosMain, playerid);
				ShowMenuForPlayer(CarrosMain, playerid);
			}
		}
	}
	return 1;
}

stock CorAleatoria()
{
	new Cor = random(300);
	return Cor;
}

public DestruirBarril(objectid)
{
 	DestroyObject(objectid);
}

stock JogadorEmGangZone(playerid, Float:minx, Float:miny, Float:maxx, Float:maxy)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	if (x > minx && x < maxx && y > miny && y < maxy) return 1;
	return 0;
}

stock DropWeapons(playerid)
{
	new weapon,amo,Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);

	for (new i = 0; i < 13; i++)
	{
	    GetPlayerWeaponData(playerid, i, weapon, amo);
	    if(weapon> 0 && weapon <MAX_WEAPON_MODEL)
	    {
	        if(amo>0)
	        {
	            for(new p,bool:found=false;p<MAX_DEATH_PICKUP && found==false;p++)
	            {
	                if(Pickup[p][p_created]==false)
	                {
	                    if(weapons[weapon]>=331 && weapons[weapon]<380)
	                    {
		                    Pickup[p][p_pickupid]=CreatePickup(weapons[weapon],19,x+random(5),y+random(5),z-0.3);
		                	Pickup[p][p_weapon]=weapon;
		                	Pickup[p][p_ammo]=amo;
		                	Pickup[p][p_timetolive]=60;
		                    Pickup[p][p_created]=true;
		                    Pickup[p][p_money]=0;
		                    found=true;
						}
	                }
	            }
	        }
	    }
	}
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	return name;
}

stock IsStrLegal(const string[])
{
for (new i = 0, j = strlen(string); i < j; i++)
	{
	    if ((string[i] > '9' || string[i] < '0') && (string[i] > 'z' || string[i] < 'a') && (string[i] > 'Z' || string[i] < 'A')  && (string[i] != '-')) return 0;
	}
return 1;
}

//-------------------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------------------------
public Tempo()
{
    new G,B,A,V;
	if(GW[Duracao]>0)
	{
   	    GW[Duracao]--;
	    for(new i=0;i<=BRAZUCAS_PLAYERS;i++)
	    {
	        if(IsPlayerConnected(i))
	        {
				if(GWParticipante[i][0]==1)
				{
				    if(!JogadorEmGangZone(i,910.8743, -2405.642, 2954.502, -759.0619))
			    	{
			    	    GWParticipante[i][2]++;
			    	    SendClientMessage(i,VERMELHO,"Você está fora da Zona de Guerra, volte ou será morto...");
			    	    if(GWParticipante[i][2]>10)
			    	    {
			    	        SetPlayerHealth(i,0);
			    	    }
			    	}

			    	if(JogadorEmGangZone(i,1862.543,-1271.297,2067.896,-1129.178))
			    	{
			        	if(GWParticipante[i][1]==1) G++;
			        	else if(GWParticipante[i][1]==2) B++;
			        	else if(GWParticipante[i][1]==3) A++;
			        	else if(GWParticipante[i][1]==4) V++;
					}
				}
			}
		}

		if(G>B && G>A && G>V) GW[EquipeDominante]=1;
		else if(B>G && B>A && B>V) GW[EquipeDominante]=2;
		else if(A>G && A>B && A>V) GW[EquipeDominante]=3;
		else if(V>G && V>B && V>A) GW[EquipeDominante]=4;
		else GW[EquipeDominante]=0;

		VerificaDominioGW();
	}
	else
	{
	    if(GW[Ativa]==1)
	    {
    		TerminarGW();
    	}
	}
}

public Reiniciar()
{
	/*new proximogm = random(3);
	switch(proximogm)
	{
	    case 0:SendRconCommand("changemode o_bagulho");
	    case 1:SendRconCommand("changemode nascar");
	    case 2:SendRconCommand("changemode a_concorrencia");
	}*/
	SendRconCommand("changemode rally");
}

stock VerificaDominioGW()
{
   	if(GW[EquipeDominante]==1) GW[TempoDominioG]++;
   	else if(GW[EquipeDominante]==2) GW[TempoDominioB]++;
   	else if(GW[EquipeDominante]==3) GW[TempoDominioA]++;
   	else if(GW[EquipeDominante]==4) GW[TempoDominioV]++;

    new gwinfo[128];
	format(gwinfo,sizeof(gwinfo),"~g~Groves~w~:%d x ~p~Ballas~w~:%d x ~b~Aztecas~w~:%d x ~y~Vagos~w~:%d",GW[TempoDominioG],GW[TempoDominioB],GW[TempoDominioA],GW[TempoDominioV]);
	TextDrawSetString(Text:Textdraw2,gwinfo);

	GW[EquipeDominante]=0;
}

//---------------------------------------------------------------------------------------------------------------------------------------
stock IniciarGW()
{
	GW[Ativa]=1;
	GW[Duracao]=900;
	GW[EquipeDominante]=0;
	GW[TempoDominioG]=0;
	GW[TempoDominioB]=0;
	GW[TempoDominioA]=0;
	GW[TempoDominioV]=0;
	return 1;
}
//---------------------------------------------------------------------------------------------------------------------------------------
stock TerminarGW()
{
   		GW[Ativa]=0;

		new EquipeVencedora;
		new MaiorPontuacao;
		new PontuacaoFinal[5];

		PontuacaoFinal[1]=GW[TempoDominioG];
		PontuacaoFinal[2]=GW[TempoDominioB];
		PontuacaoFinal[3]=GW[TempoDominioA];
		PontuacaoFinal[4]=GW[TempoDominioV];

//		if(GW[TempoDominioG]>GW[TempoDominioB] && GW[TempoDominioG]>GW[TempoDominioA] && GW[TempoDominioG]>GW[TempoDominioV]) EquipeVencedora=1;
//		else if(GW[TempoDominioB]>GW[TempoDominioG] && GW[TempoDominioB]>GW[TempoDominioA] && GW[TempoDominioB]>GW[TempoDominioV]) EquipeVencedora=4;
//		else if(GW[TempoDominioA]>GW[TempoDominioG] && GW[TempoDominioA]>GW[TempoDominioB] && GW[TempoDominioA]>GW[TempoDominioV]) EquipeVencedora=3;
//		else if(GW[TempoDominioV]>GW[TempoDominioG] && GW[TempoDominioV]>GW[TempoDominioB] && GW[TempoDominioV]>GW[TempoDominioA]) EquipeVencedora=2;
//		else EquipeVencedora=0;

		for(new e=1;e<=4;e++)
		{
		    if(PontuacaoFinal[e]>MaiorPontuacao)
		    {
		        EquipeVencedora = e;
		        MaiorPontuacao = PontuacaoFinal[e];
		    }
		}

		if(EquipeVencedora==1) GameTextForAll("~g~Groves Dominam!~n~~w~1000 pontos",3000,0);
		else if(EquipeVencedora==2) GameTextForAll("~y~Vagos Dominam!~n~~w~1000 pontos",3000,0);
		else if(EquipeVencedora==3) GameTextForAll("~b~Aztecas Dominam!~n~~w~1000 pontos",3000,0);
		else if(EquipeVencedora==4) GameTextForAll("~p~Ballas Dominam!~n~~w~1000 pontos",3000,0);
		else GameTextForAll("~w~Sem Vencedor",3000,0);

		for(new i=0;i<=BRAZUCAS_PLAYERS;i++)
		{
		    if(IsPlayerConnected(i))
		    {
				if(TimeDoJogador(i)==EquipeVencedora)
				{
					SetPlayerScore(i,GetPlayerScore(i)+1000);
				}
			}
		}
		SetTimer("Reiniciar",5000,0);
		return 1;
}
//---------------------------------------------------------------------------------------------------------------------------------------
stock SetarJogadorNaGW(p)
{
	        GWParticipante[p][0]=1;
	        GivePlayerWeapon(p,16,10);//granadas
	        GivePlayerWeapon(p,22,500);//pistola
	        GivePlayerWeapon(p,28,1500);//uzi
	        GivePlayerWeapon(p,30,1500);//ak47
            DisplayTextForPlayer(p,"Domine o territorio~n~do GlenPark~n~A sua gang precisa~n~ter a maior~n~quantidade de membros~n~na area...",10,1,7);
            GWParticipante[p][2]=0;

	        if(GWParticipante[p][1]==1)//groves
	        {
	            SetPlayerPos(p,2490.4888,-1668.3185,13.3438);
	            SetPlayerColor(p,0x008040FF);
	        }
	        else if(GWParticipante[p][1]==2)//ballas
	        {
	            SetPlayerPos(p,1267.1442,-887.9890,42.8828);
	            SetPlayerColor(p,0x8000FFFF);
	        }
	        else if(GWParticipante[p][1]==3)//aztecas
	        {
                SetPlayerPos(p,1786.1470,-1906.1602,13.3938);
                SetPlayerColor(p,0x80FFFFFF);
	        }
	        else if(GWParticipante[p][1]==4)//vagos
	        {
                SetPlayerPos(p,2632.4458,-1083.5834,69.6209);
                SetPlayerColor(p,0xFFFF80FF);
	        }
	        return 1;
}

stock ReturnUser(text[], playerid = INVALID_PLAYER_ID)
{
	new pos = 0;
	while (text[pos] < 0x21)
	{
		if (text[pos] == 0) return INVALID_PLAYER_ID;
		pos++;
	}
	new userid = INVALID_PLAYER_ID;
	if (isNumeric(text[pos]))
	{
		userid = strval(text[pos]);
		if (userid >=0 && userid < MAX_PLAYERS)
		{
			if(!IsPlayerConnected(userid))
				userid = INVALID_PLAYER_ID;
			else return userid;
		}
	}
	new len = strlen(text[pos]);
	new count = 0;
	new pname[MAX_PLAYER_NAME];
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			GetPlayerName(i, pname, sizeof (pname));
			if (strcmp(pname, text[pos], true, len) == 0)
			{
				if (len == strlen(pname)) return i;
				else
				{
					count++;
					userid = i;
				}
			}
		}
	}
	if (count != 1)
	{
		if (playerid != INVALID_PLAYER_ID)
		{
			if (count) SendClientMessage(playerid, COR_TAXISTA, "Digite o nome completo...");
			else SendClientMessage(playerid, VERMELHO, "Jogador não encontrado...");
		}
		userid = INVALID_PLAYER_ID;
	}
	return userid;
}
