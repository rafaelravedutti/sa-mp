////////////////////////////////////////////////
//  ----------------------------------------  //
// |FreeStyle/RevolutioN Filterscript Stuff | //
// |MPA® Admin Script                       | //
// |Favor não utilizar sem autorização      | //
// |Copyright © 2007, Infernus Dev. Group   | //
//  ----------------------------------------  //
////////////////////////////////////////////////

#include <a_samp>
#include <dini>
#include <a_sampmysql>
#include <revo/mysql.own>

//Cores
#define COLOR_WHITE     0xFFFFFFAA
#define COLOR_RED       0xFF0000AA
#define COLOR_LTBLUE    0x00C7FFAA
#define COLOR_PALHA     0xF0E68CAA
#define COLOR_SAY       0x003366FF
#define COLOR_YELLOW    0xFCFF00FF
#define COLOR_GREEN     0x00CC00FF
#define COL_BOX			0x000000EE
#define COL_RED			0xFF0000FF

//Defines
#define VERSAO           "0.6"
#define COMPILACAO        462
#define QT_VEICULOS       212
#define name_amount         2
#define FUSE               0

//Define para não crashar o server em caso de caracteres especiais
#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256

//Pragmas
#pragma unused ret_memcpy

//Defines (Usados em funções)
#define PING_PROTECTION     0
#define PING_MAX_EXCEEDS    2
#define PING_TIMELIMIT     60
#define PING_MAX_PING  	 1500
#define SPAM_PROTECTION     0
#define SPAM_MAX_MSGS       4
#define SPAM_TIMELIMIT      3
#define MAX_DROP_AMOUNT	   -1
#define MAX_DROP_LIFETIME 120
#define DRIVEBY_PROTECTION  1
#define DRIVEBY_MAX_KILLS   5
#define DRIVEBY_TIMELIMIT 600

#define WEAPON_SLOTS	   13
#define INVALID_PICKUP	   -1
#define MAX_PICKUPS		   90
#define PICKUP_TYPE		   19

//Enums
enum pickup
{
	creation_time,
	weapon,
	ammo,
	timer
}

//News
new Congelado[MAX_PLAYERS];
new SavedPos;
new Float:savX,Float:savY,Float:savZ;
new Suicidio[MAX_PLAYERS];
new Mudo[MAX_PLAYERS];
new gPingCount[MAX_PLAYERS][2];
new gSpamCount[MAX_PLAYERS][2];
new gDrivebyCount[MAX_PLAYERS][2];
new pickups [MAX_PICKUPS][pickup];
new ProtecaoAntiFuck[MAX_PLAYERS];
new Fudido[MAX_PLAYERS];
new Espionando[MAX_PLAYERS];
new Espionado[MAX_PLAYERS];
new Count = 5;

//Arrays
new weapons[] =
{
	-1,
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
	-1,
	-1,
	-1,
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
	-1,
	365,
	366,
	367,
	-1,
	-1,
	371
};

new VehicleNames[212][] = {
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
   "Whoopee",
   "BFInjection",
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
   "Bandit",
   "Romero",
   "Packer",
   "Monster",
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
   "RCVan",
   "Skimmer",
   "PCJ-600",
   "Faggio",
   "Freeway",
   "Baron",
   "Raider",
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
   "ZR350",
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
   "News",
   "Rancher",
   "FBIRancher",
   "Virgo",
   "Greenwood",
   "Jetmax",
   "Hotring",
   "Sandking",
   "Blista",
   "Maverick",
   "Boxville",
   "Benson",
   "Mesa",
   "Goblin",
   "Hotring",
   "Hotring",
   "Bloodring",
   "Rancher",
   "SuperGT",
   "Elegant",
   "Journey",
   "Bike",
   "MountainBike",
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
   "CementTruck",
   "TowTruck",
   "Fortune",
   "Cadrona",
   "FBITruck",
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
   "Monster",
   "Monster",
   "Uranus",
   "Jester",
   "Sultan",
   "Stratum",
   "Elegy",
   "Raindance",
   "Tiger",
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
   "Vaso",
   "Launch",
   "PoliceCar(LSPD)",
   "PoliceCar(SFPD)",
   "PoliceCar(LVPD)",
   "PoliceRanger",
   "Picador",
   "S.W.A.T.Van",
   "Alpha",
   "Phoenix",
   "Glendale",
   "Sadler",
   "LuggageTrailer",
   "LuggageTrailer",
   "StairTrailer",
   "Boxville",
   "FarmPlow",
   "UtilityTrailer"
};

new Mensagens[7][256] = {
	"Este servidor usa o MPA Admin Script versão 0.6, digite /aboutas para mais informações.",
	"Tem alguma sugestão para o nosso servidor? Se Manifeste! /talkadmin [sugestão]",
	"Encontrou algum \"bug\" em nosso servidor? reporte! /reportar [O-que-a-reportar]",
	"Tenha um bom jogo. São os votos do Clan MPA!",
	"Visite o nosso fórum! www.infernusgroup.com!",
 	"Não use cheats ou trapaças, jogue limpo!",
	"Obrigado por jogar em nosso server. Sem você não seríamos nada!"
};


new Cores[] = {
	0xFFFFFFAA,
	0x00C7FFAA,
	0xF0E68CAA,
	0x00CC00FF
};

new kicknames[2][256] = {
"Bigu",
"matraka[BR]"
};

new ponto[2] = ".";

new Float:InteriorCoords[18][3] = {
	{-2158.72,641.29,1052.38},//Woozie's Apartament(1)
	{2567.52,-1294.59,1063.25},// Big Smoke's Crack Palace(2)
	{2496.65,-1696.55,1014.74},//The Johnson's House(3)
	{286.800995,-82.547600,1001.539978},//Ammu-Nation 2(4)
	{2338.32,-1180.61,1027.98},//Burning Desire House(5)
	{-2240.00,131.00,1035.40},//Zero RC's Shop(6)
	{314.820984,-141.431992,999.661987},//Ammu-Nation de 2 Andares(7)
	{2807.63,-1170.15,1025.57},//Colonel Furhberger's(8)
	{315.856170,1024.496459,1949.797363},//Andromada Cargo Hold(9)
	{-1079.99,1061.58,1343.04},//RC Battlefield(10)
	{2.384830,33.103397,1199.849976},//Shamal Cabin(11)
	{2324.33,-1144.79,1050.71},//Unused Safe House(12)
	{-1830.81,16.83,1061.14},//Francis International Airport(13)
	{-1410.72,1591.16,1052.53},//Kickstart Stadium(14)
	{2220.26,-1148.01,1025.80},//Jefferson Motel(15)
	{-1394.20,987.62,1023.96},//Bloodbowl Stadium(16)
	{-25.884499,-185.868988,1003.549988},//24/7 1(17)
	{1726.18,-1641.00,20.23}//Atrium(18)
};

new InteriorNames[19][] = {
	"San Andreas",
	"Woozie's Apartament",
	"Big Smoke's Crack Palace",
	"The Johnson's House",
	"Ammu-Nation 2",
	"Burning Desire House",
	"Zero RC's Shop",
	"Ammu-nation de 2 andares",
	"Coronel Furhberger's",
	"Andromada Cargo Hold",
	"RC Battlefield",
	"Shamal Cabin",
	"Unused Safe House",
 	"Francis International Airport",
 	"Kickstart Stadium",
 	"Jefferson Motel",
 	"Bloodbowl Stadium",
 	"24/7",
 	"Atrium"
};
	

//Forwards
forward KickCheaterStart(idcheater);
forward KickCheaterEnd(idcheater);
forward PingProtection();
forward DestroyPickupEx(p);
forward DropWeapons(playerid);
forward Float:GetDistanceBetweenPlayers(p1,p2);
forward SendMensagens();
forward Contar(playerid);
forward Godcar(playerid,veiculo);
forward IsNumeric(const string[]);

//Forwards usados em SetTimerEx
forward DiminuirContagem();
public DiminuirContagem() Count--;

forward DesaparecerTextdraw(playerid, Text:tdid);
public DesaparecerTextdraw(playerid, Text:tdid) TextDrawHideForPlayer(playerid, tdid);

forward DestruirTextdraw(Text:tdid);
public DestruirTextdraw(Text:tdid) TextDrawDestroy(tdid);

forward Desemudecer(playerid);
public Desemudecer(playerid) Mudo[playerid] = 0;

forward DestruirObjeto(objid);
public DestruirObjeto(objid) DestroyObject(objid);

forward CriarExplosao(Float:X,Float:Y,Float:Z,tipo,Float:diam);
public CriarExplosao(Float:X,Float:Y,Float:Z,tipo,Float:diam) CreateExplosion(X,Y,Z,tipo,diam);

forward SetarCameraEspiando(playerid,Float:X,Float:Y,Float:Z);
public SetarCameraEspiando(playerid,Float:X,Float:Y,Float:Z) if(Espionando[playerid] == 1) SetPlayerCameraPos(playerid,X,Y,Z);

forward TerminarEspionagem(p1,p2,Float:X,Float:Y,Float:Z);
public TerminarEspionagem(p1,p2,Float:X,Float:Y,Float:Z)
{
	if(Espionando[p1] == 1){
		SetPlayerCameraPos(p1,X,Y,Z);
		Espionando[p1] = 0;
		Espionado[p2] = 0;
		}
	return 1;
	}

//Public SendMensagens
public SendMensagens()
{
	new string[265];
	new random1 = random(sizeof(Mensagens));
	new random2 = random(sizeof(Cores));
	format(string, sizeof(string), "%s", Mensagens[random1]);
	SendClientMessageToAll(Cores[random2],string);
	return 1;
}

public OnFilterScriptInit()
{
    print("\n ----------------------------------");
	printf("| MPA Admin Script - Versao: %s   |",VERSAO);
	printf("| Compilacao numero %d            |",COMPILACAO);
	print("| Programacao efetuada por:        |");
	print("| [MPA]matraka_IDG                 |");
	print("| [MPA]JouisxP_IDG                 |");
	print("| [MPA]toribio_IDG                 |");
	print("| [MPA]DaniPiresk_IDG              |");
	print("|                                  |");
	print("| Infernus Development Group       |");
	print("| Sua diversão, nosso objetivo!    |");
	print(" ----------------------------------\n");
	SetTimer("SendMensagens",60000,1);

	return 1;
}

public OnFilterScriptExit()
{
	#if PING_PROTECTION
		SetTimer("PingProtection", 5000, 1);
	#endif
	printf("\n MPA Admin Script - Versao %s / Compilacao %d finalizado com sucesso!\n",VERSAO,COMPILACAO);
	return 1;
}

public OnPlayerConnect(playerid)
{
	gPingCount[playerid][0] = 0;
	gPingCount[playerid][1] = 0;
	gSpamCount[playerid][0] = 0;
	gSpamCount[playerid][1] = 0;
	gDrivebyCount[playerid][0] = 0;
	gDrivebyCount[playerid][1] = 0;
	ProtecaoAntiFuck[playerid] = 0;
	Fudido[playerid] = 0;
 	Espionando[playerid] = 0;
 	Espionado[playerid] = 0;
	new msg[256];
	format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d carregado.",VERSAO,COMPILACAO);
	SendClientMessage(playerid, COLOR_WHITE, msg);
	SendClientMessage(playerid, COLOR_WHITE, "Digite /aboutas para mais informações do MPA Admin Script.");
	for (new n = 0; n < name_amount; n++){
		new names = strfind(PlayerName(playerid), kicknames[0][n], true);
		if (names != -1) Kick(playerid);
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(Mudo[playerid] == 1){
		SendClientMessage(playerid,COLOR_RED,"Você foi emudecido, você não pode falar!");
		return 0;
	} else {
		#if SPAM_PROTECTION
			SpamProtection(playerid);
		#endif
	    return 1;
	}
}

public OnPlayerDeath(playerid, killerid, reason)
{
	DropWeapons(playerid);
	SetDeathDropAmount(GetPlayerMoney(playerid));
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(killerid) == PLAYER_STATE_DRIVER && (reason == WEAPON_TEC9 || reason == WEAPON_UZI || reason == WEAPON_MP5) && GetDistanceBetweenPlayers(playerid,killerid) < 100) {
	#if DRIVEBY_PROTECTION
	DrivebyProtection(killerid);
	#endif
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new idx;
	new cmd[256];
	cmd = strtok(cmdtext,idx);

	//Comandos de Admin
	if(compare(cmd,"/akick")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new msg[256];
			new plid, reason[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/akick [id] [motivo]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/akick [id] [motivo]");
			    return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			}
			reason = tmp;
			tmp = strtok(cmdtext,idx);
			while(strlen(tmp) > 0){
			    strcat(reason," ");
			    strcat(reason,tmp);
			    tmp = strtok(cmdtext,idx);
		    }
   			format(msg,sizeof(msg),"(%s %s) %s foi kickado. (%s)",GetFormattedDate(),GetFormattedTime(),PlayerName(plid),reason);
    		Kick(plid);
    		SendClientMessageToAll(COLOR_LTBLUE,msg);
			return 1;
		}
	}
	if(compare(cmd,"/aboutas")){
		new msg[256];
		format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
		SendClientMessage(playerid, COLOR_RED,msg);
	    SendClientMessage(playerid, COLOR_WHITE, "Programadores primários: [MPA]matraka_IDG e [MPA]JouisxP_IDG");
	    SendClientMessage(playerid, COLOR_WHITE, "Programadores secundários: [MPA]toribio_IDG e [MPA]DaniPiresk_IDG");
		SendClientMessage(playerid, COLOR_WHITE, "Colaboração em geral: [MPA]VanCy e [MPA]CounsT_GFG");
  		SendClientMessage(playerid, COLOR_WHITE, " ");
  		SendClientMessage(playerid, COLOR_GREEN, "Infernus Development Group - Sua diversão, nosso objetivo!");
		if(IsPlayerAdmin(playerid)) SendClientMessage(playerid,COLOR_RED,"Para uma lista de comandos, digite /acmdlist");
	    return 1;
	}

	if(compare(cmd,"/acmdlist")){
		if(IsPlayerAdmin(playerid)){
		new tmp[256];
		new numero;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid,COLOR_RED,"/acmdlist [1-8]");
			return 1;
		}
		numero = strval(tmp);
		if(numero < 1 || numero > 8) {
		    SendClientMessage(playerid,COLOR_RED,"/acmdlist [1-8]");
		    return 1;
		}
		if(numero == 1){
				new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 1)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/akick : Kickar 1 pessoa.");
				SendClientMessage(playerid,COLOR_WHITE,"/agrana : Dá dinheiro para alguem.");
				SendClientMessage(playerid,COLOR_WHITE,"/agmx : Dá gmx no server.");
				SendClientMessage(playerid,COLOR_WHITE,"/asaude : Dá saude para alguem.");
				SendClientMessage(playerid,COLOR_WHITE,"/acongelar : Congela algum jogador.");
				SendClientMessage(playerid,COLOR_WHITE,"/adescongelar : Descongela algum jogador congelado.");
				SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua diversão, nosso objetivo!");
				return 1;
			}
			else if(numero == 2){
				new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 2)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/adararmas : Dá armas à algum jogador.");
				SendClientMessage(playerid,COLOR_WHITE,"/asalvarpos : Salva a posição onde você estiver.");
				SendClientMessage(playerid,COLOR_WHITE,"/airpos : Vai para a coordenada salva anteriormente com /asalvarpos.");
				SendClientMessage(playerid,COLOR_WHITE,"/acriarcp : Cria um Checkpoint na posição em que você salvou.");
				SendClientMessage(playerid,COLOR_WHITE,"/adesativarcp : Desativa o Checkpoint criado anteriormente.");
				SendClientMessage(playerid,COLOR_WHITE,"/ateleportarpara : Teletransporta para a posição de outro jogador.");
				SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua diversão, nosso objetivo!");
				return 1;
			}
			else if(numero == 3){
				new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 3)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/aban : Bane algum jogador do server.");
				SendClientMessage(playerid,COLOR_WHITE,"/aanuncio : Anuncia algo.");
				SendClientMessage(playerid,COLOR_WHITE,"/akill : Mata alguém.");
				SendClientMessage(playerid,COLOR_WHITE,"/alchat : Limpa o chat.");
				SendClientMessage(playerid,COLOR_WHITE,"/apackdearmas : Ganha um pack de armas(ammo infinita).");
				SendClientMessage(playerid,COLOR_WHITE,"/adinheiro : Dá dinheiro para você.");
				SendClientMessage(playerid,COLOR_WHITE,"/acongelarall : Congela todos.");
				SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua diversão, nosso objetivo!");
				return 1;
			}
   			else if(numero == 4){
				new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 4)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/adescongelarall : Descongela todos.");
				SendClientMessage(playerid,COLOR_WHITE,"/akillall : Mata todos que estiverem online no momento.");
				SendClientMessage(playerid,COLOR_WHITE,"/agrana4all : Dá dinheiro à todos.");
	            SendClientMessage(playerid,COLOR_WHITE,"/akickcheater : Kicka um cheater.");
				SendClientMessage(playerid,COLOR_WHITE,"/anitro : Adiciona nitro no seu carro.");
	            SendClientMessage(playerid,COLOR_WHITE,"/a : Manda uma mensagem para os admins.");
				SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua diversão, nosso objetivo!");
				return 1;
			}
			else if(numero == 5){
				new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 5)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/asay : Manda uma mensagem para todos que estiverem online.");
				SendClientMessage(playerid,COLOR_WHITE,"/adroparmas : Dropa as armas de um jogador à escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/adcar : Descapota o carro em que você estiver.");
	            SendClientMessage(playerid,COLOR_WHITE,"/aemudecer : Emudece um jogador à escolha.");
	            SendClientMessage(playerid,COLOR_WHITE,"/adesemudecer : Desemudece um jogador à escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/atrazer : Traz um jogador a você.");
				SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua diversão, nosso objetivo!");
				return 1;
			}
			else if(numero == 6){
				new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 6)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/airpara : Se teleporta para outro jogador.");
				SendClientMessage(playerid,COLOR_WHITE,"/aircoord : Vai até uma coordenada a sua escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/adropmoney : Dropa o dinheiro de um jogador a escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/aresetargrana : Reseta o dinheiro de um jogador a escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/asetargrana : Seta o dinheiro de um jogador a escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/aemudecerall : Emudece todos.");
				SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua diversão, nosso objetivo!");
				return 1;
			}
			else if(numero == 7){
				new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 7)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/adeseemudecerall : Desemudece todos.");
				SendClientMessage(playerid,COLOR_WHITE,"/afuck : Fode um jogador a escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/aejetar : Ejeta outro jogador de um veículo");
				SendClientMessage(playerid,COLOR_WHITE,"/airinterior : Vai a um interior a escolha.");
				SendClientMessage(playerid,COLOR_WHITE,"/ainteriorlist : Vê a lista de interiores disponíveis.");
				SendClientMessage(playerid,COLOR_WHITE,"/aplantarbomba : Planta uma bomba.");
				SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua diversão, nosso objetivo!");
				return 1;
			}
			else if(numero == 8){
			    new msg[256];
				format(msg,sizeof(msg),"MPA Admin Script versão %s / Compilação nº %d",VERSAO,COMPILACAO);
				SendClientMessage(playerid, COLOR_RED,msg);
				SendClientMessage(playerid,COLOR_PALHA,"Comandos (Lista 8)");
				SendClientMessage(playerid,COLOR_WHITE," ");
				SendClientMessage(playerid,COLOR_WHITE,"/acount : Faz uma contagem de 5 - 1.");
				SendClientMessage(playerid,COLOR_WHITE,"/agodcar : Deixa seu veículo em godmode");
				SendClientMessage(playerid,COLOR_WHITE,"/aprotectfuck : Te protege contra fuck.");
				SendClientMessage(playerid,COLOR_WHITE,"/aespiar : Espia algum jogador.");
				SendClientMessage(playerid,COLOR_WHITE,"/acalcular : Calcula algo.");
				return 1;
			}
			else if(!IsPlayerAdmin(playerid)){
				SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin?!");
				return 1;
			}
		}
	}

	if(compare(cmd,"/acmdlist2")){
		if(IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "ATENÇÃO!! A sintaxe mudou.");
			SendClientMessage(playerid,	COLOR_RED, "Nova sintaxe: /acmdlist [1-8]");
		} else {
			SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin??");
			return 1;
		}
	}

	if(compare(cmd,"/acmdlist3")){
		if(IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "ATENÇÃO!! A sintaxe mudou.");
			SendClientMessage(playerid,	COLOR_RED, "Nova sintaxe: /acmdlist [1-8]");
		} else {
			SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin??");
			return 1;
		}
	}

	if(compare(cmd,"/acmdlist4")){
		if(IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "ATENÇÃO!! A sintaxe mudou.");
			SendClientMessage(playerid,	COLOR_RED, "Nova sintaxe: /acmdlist [1-8]");
		} else {
			SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin??");
			return 1;
		}
	}
	if(compare(cmd,"/acmdlist5")){
		if(IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "ATENÇÃO!! A sintaxe mudou.");
			SendClientMessage(playerid,	COLOR_RED, "Nova sintaxe: /acmdlist [1-8]");
		} else {
			SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin??");
			return 1;
		}
	}
	if(compare(cmd,"/acmdlist6")){
		if(IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "ATENÇÃO!! A sintaxe mudou.");
			SendClientMessage(playerid,	COLOR_RED, "Nova sintaxe: /acmdlist [1-8]");
		} else {
			SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin??");
			return 1;
		}
	}
	if(compare(cmd,"/acmdlist7")){
		if(IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "ATENÇÃO!! A sintaxe mudou.");
			SendClientMessage(playerid,	COLOR_RED, "Nova sintaxe: /acmdlist [1-8]");
		} else {
			SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin??");
			return 1;
		}
	}
	if(compare(cmd,"/acmdlist8")){
		if(IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COLOR_RED, "ATENÇÃO!! A sintaxe mudou.");
			SendClientMessage(playerid,	COLOR_RED, "Nova sintaxe: /acmdlist [1-8]");
		} else {
			SendClientMessage(playerid,COLOR_RED,"Onde você pensa que vai digitando isso sem ser admin??");
			return 1;
		}
	}

	if(compare(cmd,"/ainteriorlist")){
	    if(IsPlayerAdmin(playerid)){
		new tmp[256];
		new lista;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid,COLOR_RED,"/ainteriorlist [1-3]");
			return 1;
		}
		lista = strval(tmp);
		if(lista < 1 || lista > 3) {
		    SendClientMessage(playerid,COLOR_RED,"/ainteriorlist [1-3]");
		    return 1;
		}
  		switch(lista){
			case 1:
			{
	        SendClientMessage(playerid,COLOR_SAY,"Lista de Interiores Avaliáveis.");
	        SendClientMessage(playerid,COLOR_GREEN,"Lista nº 1");
	        SendClientMessage(playerid,COLOR_WHITE,"1 - Apartamento do Woozie");
	        SendClientMessage(playerid,COLOR_WHITE,"2 - Palácio do Crack do Big Smoke");
	        SendClientMessage(playerid,COLOR_WHITE,"3 - The Johnson's House");
	        SendClientMessage(playerid,COLOR_WHITE,"4 - Ammu-Nation");
	        SendClientMessage(playerid,COLOR_WHITE,"5 - Burning Desire House");
	        SendClientMessage(playerid,COLOR_WHITE,"6 - Zero RC's Shop");
	        SendClientMessage(playerid,COLOR_WHITE,"7 - Ammu-Nation (2 Andares)");
	        SendClientMessage(playerid,COLOR_WHITE,"8 - Coronel Furhberger's");
	        }
			case 2:
			{
	        SendClientMessage(playerid,COLOR_SAY,"Lista de Interiores Avaliáveis.");
	        SendClientMessage(playerid,COLOR_GREEN,"Lista nº 2");
	        SendClientMessage(playerid,COLOR_WHITE,"9 - Andromada Cargo Hold");
	        SendClientMessage(playerid,COLOR_WHITE,"10 - RC Battlefield");
	        SendClientMessage(playerid,COLOR_WHITE,"11 - Shamal Cabin");
	        SendClientMessage(playerid,COLOR_WHITE,"12 - Unused Safe House");
	        SendClientMessage(playerid,COLOR_WHITE,"13 - Francis International Airport");
	        SendClientMessage(playerid,COLOR_WHITE,"14 - Kickstart Stadium");
	        SendClientMessage(playerid,COLOR_WHITE,"15 - Jefferson Motel");
	        SendClientMessage(playerid,COLOR_WHITE,"16 - Bloodbowl Stadium");
	        }
	        case 3:
	        {
	        SendClientMessage(playerid,COLOR_SAY,"Lista de Interiores Avaliáveis.");
	        SendClientMessage(playerid,COLOR_GREEN,"Lista nº 3");
	        SendClientMessage(playerid,COLOR_WHITE,"17 - 24/7");
	        SendClientMessage(playerid,COLOR_WHITE,"18 - Atrium");
	        SendClientMessage(playerid,COLOR_LTBLUE,"Infernus Development Group - Sua Diversão, nosso objetivo!");
	   		}
	   	}
  		return 1;
	}
}
	if(compare(cmd, "/adcar")){
		if(IsPlayerAdmin(playerid) && IsPlayerInAnyVehicle(playerid)){
			new VehicleID, Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
	    	VehicleID = GetPlayerVehicleID(playerid);
	    	SetVehiclePos(VehicleID, X, Y, Z);
	    	SetVehicleZAngle(VehicleID, Z);
	    	SetVehicleHealth(VehicleID, 1000);
 			return 1;
		} else {
			if(!IsPlayerAdmin(playerid)){
				SendClientMessage(playerid,COLOR_RED,"Você não é admin");
				return 1;
			} else {
				if(IsPlayerAdmin(playerid) && !IsPlayerInAnyVehicle(playerid)){
					SendClientMessage(playerid,COLOR_RED,"Você não está em nenhum veículo");
				    return 1;
      			}
			}
		}
	}

	if(compare(cmd,"/aemudecer")){
		if(IsPlayerAdmin(playerid)){
			new plid;
			new tmp[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
	    		SendClientMessage(playerid,COLOR_RED,"/aemudecer [id]");
  				return 1;
			}
			plid = strval(tmp);
			if(Mudo[plid] == 1){
		    	SendClientMessage(playerid,COLOR_RED,"Esse jogador já está mudo!");
				return 1;
			}
			if(plid == playerid){
				SendClientMessage(playerid,COLOR_RED,"Querendo se auto-emudecer?!");
				return 1;
			} else {
				Mudo[plid] = 1;
				new msg[256];
				format(msg,sizeof(msg),"Você foi emudecido por %s",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				SendClientMessage(playerid,COLOR_GREEN,"Feito.");
				return 1;
			}
		}
	}
	if(compare(cmd,"/adesemudecer")){
		if(IsPlayerAdmin(playerid)){
			new plid;
			new tmp[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
	    		SendClientMessage(playerid,COLOR_RED,"/adesemudecer [id]");
		    	return 1;
			}
			plid = strval(tmp);
			if(Mudo[plid] == 0){
		    	SendClientMessage(playerid,COLOR_RED,"Esse jogador não está mudo!");
				return 1;
			} else {
				Mudo[plid] = 0;
				new msg[256];
				format(msg,sizeof(msg),"Você foi desemudecido por %s. Já pode falar a vontade!",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				SendClientMessage(playerid,COLOR_GREEN,"Feito.");
				return 1;
			}
		}
	}
	if(compare(cmd,"/aplantarbomba")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new dinid,Float:x,Float:y,Float:z,Float:radius,tempo;
			tmp = strtok(cmdtext,idx);
			radius = floatstr(tmp);
			tempo = strval(tmp);
			if(!strlen(tmp)){
	    		SendClientMessage(playerid,COLOR_RED,"/aplantarbomba [radius] [tempo-para-explosão]");
		    	return 1;
			}
			if(IsPlayerInAnyVehicle(playerid)){
				SendClientMessage(playerid,COLOR_RED,"Você não pode plantar uma bomba dentro de um veículo!");
				return 1;
			} else {
				GetPlayerPos(playerid,x,y,z);
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
				SetTimerEx("CriarExplosao",tempo*1000,false,"fffdf",x,y,z,2,radius);
				dinid = CreateObject(1252,x,y,z-0.8,0,0,0);
				SetTimerEx("DestruirObjeto",tempo*1000,false,"d",dinid);
				SendClientMessage(playerid,COLOR_GREEN,"Bomba plantada!");
				return 1;
				}
			}
		}
	if(compare(cmd,"/acalcular")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256], Operacao[256], str[256], Num1, Num2;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/acalcular [num1] [operação] [num2]");
			    return 1;
			}
			Num1 = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/acalcular [num1] [operação] [num2]");
			    return 1;
   			}
	  		Operacao = tmp;
	  		if(!compare(Operacao, "+") || !compare(Operacao, "-") || !compare(Operacao, "*") || !compare(Operacao, "/")){
	  		    SendClientMessage(playerid,COLOR_RED,"Operação inválida. As operações disponíveis são \" + \", \" - \" \" * \" e \" / \".");
	  		    return 1;
	    	}
			Num2 = strval(tmp);
			if(compare(Operacao, "+")) format(str, sizeof(str),"Calculadora: %d %s %d = %d",Num1, Operacao, Num2, Num1 + Num2);
			if(compare(Operacao, "-")) format(str, sizeof(str),"Calculadora: %d %s %d = %d",Num1, Operacao, Num2, Num1 - Num2);
			if(compare(Operacao, "*")) format(str, sizeof(str),"Calculadora: %d %s %d = %d",Num1, Operacao, Num2, Num1 * Num2);
			if(compare(Operacao, "/")) format(str, sizeof(str),"Calculadora: %d %s %d = %d",Num1, Operacao, Num2, Num1 / Num2);
			SendClientMessage(playerid,COLOR_GREEN,str);
			return 1;
		}
	}
	
  	if(compare(cmd,"/agrana")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
			new plid,money;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/agrana [id] [quantidade]");
			    return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/agrana [id] [quantidade]");
			    return 1;
			}
			money = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			} else {
				if(money == 0){
				    SendClientMessage(playerid,COLOR_RED,"Valor inválido.");
				    return 1;
				} else {
					GivePlayerMoney(plid,money);
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
					return 1;
				}
			}
		}
	}
	if(compare(cmd,"/agmx")){
 		if(IsPlayerAdmin(playerid)){
        	SendRconCommand("gmx");
     		return 1;
		}
	}
	if(compare(cmd,"/asaude")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
			new plid,health;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/asaude [id] [quantidade]");
			    return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/asaude [id] [quantidade]");
			    return 1;
			}
			health = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			} else {
				SetPlayerHealth(plid,health);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
				return 1;
    		}
		}
	}
	if(compare(cmd,"/aircoord")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
			new Float:xpos,Float:ypos,Float:zpos;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aircoord [xpos] [ypos] [zpos]");
		 		return 1;
			}
    		new acharxpos = strfind(tmp,ponto,true);
			xpos = floatstr(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aircoord [xpos] [ypos] [zpos]");
		 		return 1;
			}
    		new acharypos = strfind(tmp,ponto,true);
			ypos = floatstr(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aircoord [xpos] [ypos] [zpos]");
		 		return 1;
			}
    		new acharzpos = strfind(tmp,ponto,true);
			zpos = floatstr(tmp);
        	if(acharxpos == -1 || acharypos == -1 || acharzpos == -1){
     			SendClientMessage(playerid,COLOR_RED,"Coordenada inválida.");
     			return 1;
			}
			SetPlayerPos(playerid,xpos,ypos,zpos);
			if(IsPlayerInAnyVehicle(playerid)) SetVehiclePos(GetPlayerVehicleID(playerid),xpos,ypos,zpos);
			SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
			return 1;
		}
	}
	if(compare(cmd,"/acolete")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
			new plid,colete;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/acolete [id] [quantidade]");
		 		return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/acolete [id] [quantidade]");
		 		return 1;
			}
			colete = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
		 		return 1;
			} else {
				new msg[256];
				AddPlayerArmour(plid,colete);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
				format(msg, sizeof(msg),"%s te deu %d de colete.",PlayerName(playerid),colete);
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
 			}
		}
	}

	if(compare(cmd,"/asay")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new msg[256];
			new msg1[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/asay [texto]");
				return 1;
			}
			msg1 = tmp;
			tmp = strtok(cmdtext,idx);
			while(strlen(tmp) > 0){
			    strcat(msg1," ");
			    strcat(msg1,tmp);
			    tmp = strtok(cmdtext,idx);
			}
			format(msg, sizeof(msg), "Admin %s: %s", PlayerName(playerid),msg1);
			SendClientMessageToAll(COLOR_SAY, msg);
			return 1;
		}
	}

	if(compare(cmd,"/adroparmas")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256], plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/adroparmas [id]");
				return 1;
			}
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/adroparmas [id]");
   			 	return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			} else {
				DropWeapons(plid);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				new msg[256];
				format(msg,sizeof(msg),"%s dropou suas armas.",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
			}
		}
	}
	if(compare(cmd,"/aprotectfuck")){
	    if(IsPlayerAdmin(playerid)){
	        if(ProtecaoAntiFuck[playerid] == 0){
	            ProtecaoAntiFuck[playerid] = 1;
	            SendClientMessage(playerid,COLOR_GREEN,"Proteção ativada com sucesso.");
				return 1;
				}
			if(ProtecaoAntiFuck[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"Calminha! a proteção anti-fuck já está ativada.");
				return 1;
			}
		}
	}
	if(compare(cmd,"/afuck")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256], plid;
			new string[256], msg[256], msg2[256], msg3[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/afuck [id]");
				return 1;
			}
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/afuck [id]");
   			 	return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			}
			if(Fudido[plid] == 1){
			    format(msg2, sizeof(msg2),"%s já está fudido.",PlayerName(plid));
			    SendClientMessage(playerid,COLOR_RED,msg2);
			    return 1;
			}
			if(ProtecaoAntiFuck[plid] == 1){
				format(string,sizeof(string),"Hahá, %s está protegido contra Fuck.",PlayerName(plid));
				SendClientMessage(playerid,COLOR_RED,string);
				format(msg,sizeof(msg),"%s tentou te fuder, mas você estava protegido!",PlayerName(playerid));
				SendClientMessage(plid,COLOR_RED,msg);
				return 1;
			} else {
				Fuck(plid);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				format(msg3,sizeof(msg3),"%s te fudeu.",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg3);
				return 1;
			}
		}
	}
	if(compare(cmd,"/aejetar")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256], plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aejetar [id]");
				return 1;
			}
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aejetar [id]");
   			 	return 1;
			}
			if(IsPlayerInAnyVehicle(plid) && IsAPlane(GetPlayerVehicleID(plid))){
				GivePlayerWeapon(plid, 46, 1);
				RemovePlayerFromVehicle(plid);
				return 1;
			}
			if(!IsPlayerInAnyVehicle(plid)){
			    new msg[256];
				format(msg, sizeof(msg),"%s não está em um veículo.",PlayerName(plid));
				SendClientMessage(playerid,COLOR_RED,msg);
				return 1;
			} else {
				RemovePlayerFromVehicle(plid);
				if(IsAPlane(GetPlayerVehicleID(plid))) GivePlayerWeapon(plid, 46, 1);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				new msg[256];
				new id;
				new modelo;
				id = GetPlayerVehicleID(plid);
				modelo = GetVehicleModel(id);
				format(msg,sizeof(msg),"%s te removeu do %s (id: %d).",PlayerName(playerid),VehicleNames[modelo-400],modelo);
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
			}
		}
	}
	if(compare(cmd,"/aespiar")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256], plid, tempo;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/aespiar [id] [tempo]");
	            return 1;
	        }
			plid = strval(tmp);
			tempo = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aespiar [id] [tempo]");
			    return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			}
			if(Espionando[playerid] == 1){
				SendClientMessage(playerid,COLOR_RED,"Você já está espiando alguém.");
				return 1;
			}
			if(Espionado[plid] == 1){
				new msg[256];
				format(msg, sizeof(msg),"%s já está sendo espionado.",PlayerName(plid));
				SendClientMessage(playerid,COLOR_RED,msg);
				return 1;
			} else {
				new Float:PlidX,Float:PlidY,Float:PlidZ;
				new Float:PlayerX,Float:PlayerY,Float:PlayerZ;
				GetPlayerPos(playerid,PlayerX,PlayerY,PlayerZ);
				GetPlayerPos(plid,PlidX,PlidY,PlidZ);
				SetPlayerCameraPos(playerid,PlidX,PlidY,PlidZ);
				Espionando[playerid] = 1;
				Espionado[plid] = 1;
				SetTimerEx("SetarCameraEspiando",1000,true,"dfff",playerid,PlidX,PlidY,PlidZ);
				SetTimerEx("TerminarEspionagem",tempo*1000,false,"ddfff",playerid,plid,PlayerX,PlayerY,PlayerZ);
				return 1;
			}
		}
	}
	if(compare(cmd,"/airinterior")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256], interior;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/airinterior [interior]");
				return 1;
			}
			interior = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/airinterior [interior]");
   			 	return 1;
			}
			if(interior < 1 || interior > 18){
				SendClientMessage(playerid,COLOR_RED,"Esse interior não consta na lista.");
				return 1;
			} else {
				new msg[256];
				SetPlayerInterior(playerid,interior);
				SetPlayerPos(playerid,InteriorCoords[interior][0],InteriorCoords[interior][1],InteriorCoords[interior][2]);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				format(msg, sizeof(msg),"Você foi teleportado para %s (Interior %d)",InteriorNames[interior],interior);
				SendClientMessage(playerid,COLOR_GREEN,msg);
				return 1;
			}
		}
	}
	if(compare(cmd,"/adropmoney")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256], plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/adromoney [id]");
				return 1;
			}
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/adropmoney [id]");
   			 	return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			} else {
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				new msg[256];
				format(msg,sizeof(msg),"%s dropou seu dinheiro.",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
			}
		}
	}
	if(compare(cmd,"/aresetararmas")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256], plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aresetararmas [id]");
				return 1;
			}
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aresetararmas [id]");
   			 	return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			} else {
				ResetPlayerWeapons(plid);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				new msg[256];
				format(msg,sizeof(msg),"%s resetou suas armas.",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
			}
		}
	}
	if(compare(cmd,"/aresetargrana")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256], plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aresetargrana [id]");
				return 1;
			}
			plid = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aresetargrana [id]");
   			 	return 1;
			}
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			} else {
				ResetPlayerMoney(plid);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				new msg[256];
				format(msg,sizeof(msg),"%s resetou seu dinheiro.",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
			}
		}
	}
	if(compare(cmd,"/asetargrana")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
			new plid,money;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/asetargrana [id] [quantidade]");
			    return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/asetargrana [id] [quantidade]");
			    return 1;
			}
			money = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			} else {
				if(money == 0){
				    SendClientMessage(playerid,COLOR_RED,"Valor inválido.");
				    return 1;
				} else {
					SetPlayerMoney(plid,money);
					SendClientMessage(playerid,COLOR_WHITE,"Comando executado com sucesso.");
					format(msg,sizeof(msg),"%s setou seu dinheiro em $ %d",PlayerName(playerid),money);
					SendClientMessage(plid,COLOR_GREEN,msg);
					return 1;
				}
			}
		}
	}
	if(compare(cmd,"/a")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new msg[256];
			new msg1[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/a [texto]");
				return 1;
			}
			msg1 = tmp;
			tmp = strtok(cmdtext,idx);
			while(strlen(tmp) > 0){
			    strcat(msg1," ");
			    strcat(msg1,tmp);
			    tmp = strtok(cmdtext,idx);
			}
			for(new i=0;i<MAX_PLAYERS;i++){
			if(IsPlayerConnected(i) && IsPlayerAdmin(i)){
			format(msg, sizeof(msg), "%s [CHAT PRIVADO DOS ADMINS]",msg1);
			SendPlayerMessageToPlayer(playerid, i, msg);
			return 1;
			}
		}
	}
}

	if(compare(cmd,"/acongelar")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256],plid;
	        tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/acongelar [id]");
   	         	return 1;
			}
			plid = strval(tmp);
			if(Congelado[plid] == 1){
			    SendClientMessage(playerid,COLOR_RED,"Jogador já está congelado!");
   			 	return 1;
			} else {
				TogglePlayerControllable(plid,0);
				Congelado[plid] = 1;
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
				new msg[256];
				format(msg,sizeof(msg),"%s te congelou!",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
			}
		}
	}

	if(compare(cmd,"/acongelarall")){
	    if(IsPlayerAdmin(playerid)){
	    	for(new i=0;i<MAX_PLAYERS;i++){
				if(IsPlayerConnected(i) && !IsPlayerAdmin(i)){
					TogglePlayerControllable(i,0);
					Congelado[i] = 1;
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
					new msg[256];
					format(msg,sizeof(msg),"%s congelou todos!",PlayerName(playerid));
					SendClientMessageToAll(COLOR_WHITE,msg);
					return 1;
				}
			}
		}
	}

	if(compare(cmd,"/adescongelarall")){
	    if(IsPlayerAdmin(playerid)){
	    	for(new i=0;i<MAX_PLAYERS;i++){
				if(IsPlayerConnected(i) && !IsPlayerAdmin(i)){
					TogglePlayerControllable(i,1);
					Congelado[i] = 0;
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
					new msg[256];
					format(msg,sizeof(msg),"%s descongelou todos!",PlayerName(playerid));
					SendClientMessageToAll(COLOR_WHITE,msg);
					return 1;
				}
			}
		}
	}
	if(compare(cmd,"/aemudecerall")){
	    if(IsPlayerAdmin(playerid)){
	    	for(new i=0;i<MAX_PLAYERS;i++){
				if(IsPlayerConnected(i) && !IsPlayerAdmin(i)){
					Mudo[i] = 1;
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
					new msg[256];
					format(msg,sizeof(msg),"%s emudeceu todos!",PlayerName(playerid));
					SendClientMessageToAll(COLOR_WHITE,msg);
					return 1;
				}
			}
		}
	}

	if(compare(cmd,"/adesemudecer")){
	    if(IsPlayerAdmin(playerid)){
	    	for(new i=0;i<MAX_PLAYERS;i++){
				if(IsPlayerConnected(i) && !IsPlayerAdmin(i)){
					Mudo[i] = 0;
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
					new msg[256];
					format(msg,sizeof(msg),"%s desemudeceu todos!",PlayerName(playerid));
					SendClientMessageToAll(COLOR_WHITE,msg);
					return 1;
				}
			}
		}
	}
	if(compare(cmd,"/adescongelar")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256],plid;
	        tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/adescongelar [id]");
   	         	return 1;
			}
			plid = strval(tmp);
			if(Congelado[plid] == 0){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não está congelado!");
   				return 1;
			} else {
				TogglePlayerControllable(plid,1);
				Congelado[plid] = 0;
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
				new msg[256];
				format(msg,sizeof(msg),"%s te descongelou!",PlayerName(playerid));
				SendClientMessage(plid,COLOR_WHITE,msg);
				return 1;
			}
		}
	}

	if(compare(cmd,"/adararmas")){
	    if(IsPlayerAdmin(playerid)){
  			AllowInteriorWeapons(1);
	        new plid[256], arma[256], municao[256];
	        plid = strtok(cmdtext,idx);
	        arma = strtok(cmdtext,idx);
	        municao = strtok(cmdtext,idx);
	        if(!strlen(plid) || !strlen(arma)){
	            SendClientMessage(playerid,COLOR_RED,"Ei, especifique ao menos um jogador e uma arma!");
         	   	return 1;
			}
			if(strval(arma) < 1 || strval(arma) > 46 || strval(arma) == 39 || strval(arma) == 40){
			    SendClientMessage(playerid,COLOR_RED,"Arma inválida.");
   			 	return 1;
	 		}
			if(strval(arma) == 35 && !IsPlayerAdmin(strval(plid)) || strval(arma) == 36 && !IsPlayerAdmin(strval(plid)) || strval(arma) == 38 && !IsPlayerAdmin(strval(plid))){
			    SendClientMessage(playerid,COLOR_RED,"Ei, querendo dar esse tipo de arma para um qualquer?! Vai tirando seu cavalinho da chuva!");
   			 	return 1;
			}
			if(!IsPlayerConnected(strval(plid))){
   				SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
				return 1;
				} else {
    				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
					if(!strval(municao)){
				        GivePlayerWeapon(strval(plid),strval(arma),1000);
					} else {
					    GivePlayerWeapon(strval(plid),strval(arma),strval(municao));
					}
				}
			}
		}

	if(compare(cmd,"/asalvarpos")){
	    if(IsPlayerAdmin(playerid)){
			GetPlayerPos(playerid,savX,savY,savZ);
			SendClientMessage(playerid,COLOR_GREEN,"Feito.");
			if(SavedPos == 1){
			    return 1;
			} else {
			    SavedPos = 1;
			}
		}
	}
	if(compare(cmd,"/airpos")){
	    if(IsPlayerAdmin(playerid)){
	    	if(SavedPos == 1){
				SetPlayerPos(playerid,savX,savY,savZ);
				SendClientMessage(playerid,COLOR_GREEN,"Feito.");
				return 1;
			} else {
				SendClientMessage(playerid,COLOR_RED,"Não foi salva uma coordenada.");
				SendClientMessage(playerid,COLOR_RED,"Para salvar coordenadas, digite /asalvarpos");
				return 1;
				}
			}
		}

	if(compare(cmd,"/acriarcp")){
	    if(IsPlayerAdmin(playerid)){
	        if(SavedPos == 1){
				new tmp[256],plid;
				tmp = strtok(cmdtext,idx);
				if(strlen(tmp)){
				    SendClientMessage(playerid,COLOR_RED,"/acriarcp [id]");
				    return 1;
				}
				plid = strval(tmp);
				if(!IsPlayerConnected(plid)){
				    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
				    return 1;
				} else {
				    SetPlayerCheckpoint(plid,savX,savY,savZ,3.0);
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COLOR_RED,"Não foi salva uma coordenada.");
			    SendClientMessage(playerid,COLOR_RED,"Para salvar coordenadas, digite /asalvarpos");
			    return 1;
			}
		}
	}

	if(compare(cmd,"/atrazer")){
	    if(IsPlayerAdmin(playerid)){
    			new tmp[256], plid;
				tmp = strtok(cmdtext,idx);
				if(!strlen(tmp)){
				    SendClientMessage(playerid,COLOR_RED,"/atrazer [id]");
				    return 1;
				}
	   			plid = strval(tmp);
				if(!IsPlayerConnected(plid)){
				    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
				    return 1;
				} else {
					new Float:X,Float:Y,Float:Z;
					if(GetPlayerInterior(playerid) != 0){
						GetPlayerPos(playerid,X,Y,Z);
						SetPlayerPos(plid,X,Y,Z);
						SetPlayerInterior(plid,GetPlayerInterior(playerid));
						SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
		    			} else {
						    if(IsPlayerInAnyVehicle(plid)){
						        GetPlayerPos(playerid,X,Y,Z);
						        SetVehiclePos(GetPlayerVehicleID(plid),X,Y,Z);
								SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
							} else {
								GetPlayerPos(playerid,X,Y,Z);
								SetPlayerPos(plid,X,Y,Z);
								SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
								return 1;
								}
							}
						}
					}
				}
			
	if(compare(cmd,"/airpara")){
	    if(IsPlayerAdmin(playerid)){
		    	new tmp[256], plid;
				tmp = strtok(cmdtext,idx);
				if(!strlen(tmp)){
				    SendClientMessage(playerid,COLOR_RED,"/airpara [id]");
				    return 1;
				}
	   			plid = strval(tmp);
				if(!IsPlayerConnected(plid)){
				    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
				    return 1;
				} else {
					new Float:X,Float:Y,Float:Z;
					if(GetPlayerInterior(plid) != 0){
						GetPlayerPos(plid,X,Y,Z);
						SetPlayerPos(playerid,X,Y,Z);
						SetPlayerInterior(playerid,GetPlayerInterior(plid));
						SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
		    			} else {
						    if(IsPlayerInAnyVehicle(playerid)){
						        GetPlayerPos(plid,X,Y,Z);
						        SetVehiclePos(GetPlayerVehicleID(playerid),X,Y,Z);
								SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
							} else {
								GetPlayerPos(plid,X,Y,Z);
								SetPlayerPos(playerid,X,Y,Z);
								SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
								return 1;
								}
							}
						}
					}
				}

	if(compare(cmd,"/adesativarcp")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256], plid;
	        tmp = strtok(cmdtext,idx);
	        if(strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/adesativarcp [id]");
	            return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			} else {
				DisablePlayerCheckpoint(plid);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
				return 1;
			}
		}
	}

	if(compare(cmd,"/ateleportarpara")){
	    if(IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid, destid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COLOR_RED,"/ateleportarpara [id] [id-destino]");
	            return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/ateleportarpara [id] [id-destino]");
			    return 1;
			}
			destid = strval(tmp);
			if(!IsPlayerConnected(plid) || !IsPlayerConnected(destid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			} else {
				new Float:X,Float:Y,Float:Z;
				if(GetPlayerInterior(destid) != 0){
					GetPlayerPos(destid,X,Y,Z);
					SetPlayerPos(plid,X,Y,Z);
					SetPlayerInterior(plid,GetPlayerInterior(destid));
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso");
					return 1;
				} else {
				    if(IsPlayerInAnyVehicle(plid)){
				        GetPlayerPos(destid,X,Y,Z);
				        SetVehiclePos(GetPlayerVehicleID(plid),X,Y,Z);
						SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
						return 1;
					} else {
						GetPlayerPos(destid,X,Y,Z);
						SetPlayerPos(plid,X,Y,Z);
						SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
						return 1;
					}
				}
			}
		}
	}

	if(compare(cmd,"/aanuncio") && IsPlayerAdmin(playerid)){
		new tmp[256],msg1[256],msg[256],estilo;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) {
		    SendClientMessage(playerid,COLOR_RED,"Uso correto: /aanuncio [estilo] [texto]");
		    return 1;
		}
		estilo = strval(tmp);
		if(estilo > 3 || estilo < 0) {
		    SendClientMessage(playerid,COLOR_RED,"Estilo inválido");
		    return 1;
		}
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid,COLOR_RED,"Uso correto: /aanuncio [estilo] [texto]");
		    return 1;
		}
		msg1 = tmp;
		tmp = strtok(cmdtext,idx);
		while(strlen(tmp) > 0) {
		    strcat(msg1," ");
		    strcat(msg1,tmp);
		    tmp = strtok(cmdtext,idx);
		}
		format(msg,256,"~r~%s ~s~anuncia:~n~%s",PlayerName(playerid),msg1);
		new Text:atd = TextDrawCreate(320.0,130.0,msg);
		TextDrawFont(atd,estilo);
		TextDrawColor(atd,0xFFFFFFFF);
		TextDrawSetShadow(atd,1);
		TextDrawSetOutline(atd,1);
		TextDrawAlignment(atd,2);
  		TextDrawLetterSize(atd,1.0,1.5);
		TextDrawShowForAll(atd);
		SetTimerEx("DesparecerTextdraw",7000,false,"dd",playerid,_:atd);
		SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
		return 1;
	}

	if(compare(cmd,"/alchat")){
		if(IsPlayerAdmin(playerid)){
			for(new m; m<10; m++)SendClientMessageToAll(COLOR_RED," ");
			return 1;
		}
	}

	if(compare(cmd,"/anitro")){
 		if(IsPlayerInInvalidNosVehicle(playerid,GetPlayerVehicleID(playerid))){
			SendClientMessage(playerid,COLOR_RED,"Voce não pode adicionar nitro nesse veículo!");
			return 1;
		}
		if(IsPlayerInAnyVehicle(playerid) && IsPlayerAdmin(playerid) && !IsPlayerInInvalidNosVehicle(playerid,GetPlayerVehicleID(playerid))){
			if(GetPlayerState(playerid) == 2){
				AddVehicleComponent(GetPlayerVehicleID(playerid),1010);
				SendClientMessage(playerid, COLOR_GREEN,"Nitro adicionado!");
				return 1;
			} else {
				SendClientMessage(playerid,COLOR_RED,"Você deve estar dirigindo o veículo, não como passageiro!");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COLOR_RED,"Você não está em um veíclo!");
			return 1;
		}
	}

	if(compare(cmd,"/akill")){
	    if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new msg[256];
			new plid, reason[256];
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/akill [id] [motivo]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/akill [id] [motivo]");
			    return 1;
			}
			set(reason,tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado.");
			    return 1;
			}
			reason = tmp;
			tmp = strtok(cmdtext,idx);
			while(strlen(tmp) > 0){
			    strcat(reason," ");
			    strcat(reason,tmp);
			    tmp = strtok(cmdtext,idx);
		    }
   			format(msg,sizeof(msg),"(%s %s) %s foi morto por %s. (%s)",GetFormattedDate(),GetFormattedTime(),PlayerName(plid),PlayerName(playerid),reason);
    		Kill(plid);
    		SendClientMessageToAll(COLOR_LTBLUE,msg);
			return 1;
		}
	}

	if(compare(cmd,"/akillall")){
   		if(IsPlayerAdmin(playerid)){
	    	for(new i=0;i<MAX_PLAYERS;i++){
				if(IsPlayerConnected(i) && !IsPlayerAdmin(i)){
	    			SetPlayerHealth(i, 0.0);
					SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
					new msg[256];
					format(msg,sizeof(msg),"%s matou todos!",PlayerName(playerid));
					SendClientMessageToAll(COLOR_WHITE,msg);
					return 1;
				}
			}
		}
	}

	if(compare(cmd,"/apackdearmas")){
  		if(IsPlayerAdmin(playerid)){
 			AllowInteriorWeapons(1);
			GivePlayerWeapon(playerid, 26, 99999);
			GivePlayerWeapon(playerid, 30, 99999);
			GivePlayerWeapon(playerid, 32, 99999);
			GivePlayerWeapon(playerid, 24, 99999);
			GivePlayerWeapon(playerid, 46, 1);
			GivePlayerWeapon(playerid, 4, 1);
			GivePlayerWeapon(playerid, 41, 99999);
			SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso!");
			return 1;
		}
	}

	if(compare(cmd,"/adinheiro")){
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new quantidade;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/adinheiro [quantidade]");
				return 1;
			}
	    	quantidade = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/adinheiro [quantidade]");
		 		return 1;
			} else {
				GivePlayerMoney(playerid, quantidade);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
				return 1;
    		}
		}
 	}

	if(compare(cmd,"/agrana4all")){
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new quantidade;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/agrana4all [quantidade]");
				return 1;
			}
	    	quantidade = strval(tmp);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/agrana4all [quantidade]");
			    return 1;
	   		} else {
	   		for(new i=0;i<MAX_PLAYERS;i++){
	   			if(IsPlayerConnected(i)){
	   			new msg[256];
				GivePlayerMoney(i,quantidade);
				SendClientMessage(playerid,COLOR_GREEN,"Comando executado com sucesso.");
				format(msg, sizeof(msg),"%s deu $%d de presente a todos!",PlayerName(playerid),quantidade);
				SendClientMessageToAll(COLOR_GREEN,msg);
				return 1;
    			}
			}
		}
	}
}
	if(compare(cmd,"/acount")){
	    if(IsPlayerAdmin(playerid)){
			for(new i=0;i<MAX_PLAYERS;i++){
			if(GetDistanceBetweenPlayers(playerid,i) > 50){
			Contar(playerid);
			Contar(i);
			return 1;
			}
		}
	}
}
	if(compare(cmd,"/agodcar")){
	    if(IsPlayerAdmin(playerid)){
	    	if(IsPlayerInAnyVehicle(playerid)){
	    		new vehicleid;
	    		vehicleid = GetPlayerVehicleID(playerid);
				SetTimerEx("Godcar",1000,true,"dd",playerid,vehicleid);
				SendClientMessage(playerid, COLOR_GREEN, "Vehicle GodMode ativado com sucesso.");
				return 1;
			} else {
				if(!IsPlayerInAnyVehicle(playerid)){
					SendClientMessage(playerid,COLOR_RED,"Você não está num veículo.");
					return 1;
				}
			}
		}
	}
	if(compare(cmd,"/aban")){
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, reason[256];
			new msg[256];
  			strmid(tmp,cmdtext,4,strlen(cmdtext));
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aban [id] [motivo]");
				return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COLOR_RED,"/aban [id] [motivo]");
			    return 1;
			}
			set(reason,tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid,COLOR_RED,"Jogador não conectado");
			    return 1;
			}
			reason = tmp;
			tmp = strtok(cmdtext,idx);
			while(strlen(tmp) > 0){
			    strcat(reason," ");
			    strcat(reason,tmp);
			    tmp = strtok(cmdtext,idx);
		    }
   			format(msg,sizeof(msg),"(%s %s) %s foi banido. (%s)",GetFormattedDate(),GetFormattedTime(),PlayerName(plid),reason);
    		Ban(plid);
    		SendClientMessageToAll(COLOR_LTBLUE,msg);
    		return 1;
		}
	}

//Comandos de Interação Player-Admin(Server)
	if(compare(cmd,"/talkadmin")){
		new tmp[256];
		new msg[256];
		new msg1[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/talkadmin [sugestão]");
			return 1;
		}
		msg1 = tmp;
		tmp = strtok(cmdtext,idx);
		while(strlen(tmp) > 0){
		    strcat(msg1," ");
		    strcat(msg1,tmp);
		    tmp = strtok(cmdtext,idx);
		}
   		format(msg, sizeof(msg), "Eu enviei uma sugestão: %s",msg1);
	    for(new i=0; i<MAX_PLAYERS; i++) if(IsPlayerAdmin(i)) SendPlayerMessageToPlayer(i,playerid,msg);
		writesuggest(playerid, msg1);
	   	SendClientMessage(playerid,COLOR_RED,"Pronto! sua sugestão foi enviada com sucesso para nossa base de dados, Obrigado!");
		SendClientMessage(playerid,COLOR_PALHA,"Se você quiser entender como funciona este sistema, digite /aprender-sugestoes");
		return 1;
	}

	if(compare(cmd,"/reportar")){
		new tmp[256];
		new msg[256];
		new msg1[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "/reportar [O-que-a-reportar]");
			return 1;
		}
		msg1 = tmp;
		tmp = strtok(cmdtext,idx);
		while(strlen(tmp) > 0){
		    strcat(msg1," ");
		    strcat(msg1,tmp);
		    tmp = strtok(cmdtext,idx);
		}
		SendClientMessage(playerid,COLOR_GREEN,"Pronto! seu report foi enviado com sucesso para nossa base de dados, Obrigado!");
		format(msg, sizeof(msg),"Eu reportei: %s.",msg1);
	    for(new i=0; i<MAX_PLAYERS; i++) if(IsPlayerAdmin(i)) SendPlayerMessageToPlayer(i,playerid,msg);
		writereport(playerid, msg1);
		SendClientMessage(playerid,COLOR_RED,"Se você tiver sorte, seu \"bug\" será rapidamente corrigido.");
		SendClientMessage(playerid,COLOR_PALHA,"Se você quiser entender como funciona este sistema, digite /aprender-reports");
		return 1;
	}

	if(compare(cmd,"/kill")){
		SendClientMessage(playerid, COLOR_WHITE, "Tem certeza que quer morrer?");
  		SendClientMessage(playerid, COLOR_WHITE, "Sim - /sim || Não - /nao");
		Suicidio[playerid] = 1;
		return 1;
	}

	if(compare(cmd,"/sim")){
		if(Suicidio[playerid] == 1){
        	Kill(playerid);
			Suicidio[playerid] = 0;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Primeiro /kill depois /sim!");
			return 1;
		}
	}

	if(compare(cmd,"/nao")){
        if(Suicidio[playerid] == 1){
			SendClientMessage(playerid,COLOR_GREEN,"Viva bem!");
			Suicidio[playerid] = 0;
		} else {
		    SendClientMessage(playerid,COLOR_RED,"Primeiro /kill depois /nao!");
			return 1;
		}
	}
	//Turoriais
	if(compare(cmd,"/aprender-reports")){
 		SendClientMessage(playerid,COLOR_LTBLUE,"Aprendendo como funciona o sistema de reports");
		SendClientMessage(playerid,COLOR_WHITE,"1. O nosso sistema automaticamente leva o seu report para um arquivo da base de dados");
	  	SendClientMessage(playerid,COLOR_WHITE,"2. Só administradores tem acesso a esse arquivo");
		SendClientMessage(playerid,COLOR_WHITE,"3. Espere até algum administrador ler o arquivo e poder corrigir o \"bug\" que você reportou");
		return 1;
	}

	if(compare(cmd,"/aprender-sugestoes")){
		SendClientMessage(playerid,COLOR_LTBLUE,"Aprendendo como funciona o sistema de sugestões");
		SendClientMessage(playerid,COLOR_WHITE,"1. O nosso sistema automaticamente leva a sua sugestão para um arquivo da base de dados");
		SendClientMessage(playerid,COLOR_WHITE,"2. Só administradores tem acesso a esse arquivo");
		SendClientMessage(playerid,COLOR_WHITE,"3. Espere até algum administrador ler o arquivo e, se possível fazer o que você sugeriu");
		return 1;
	}

	if(compare(cmd,"/aprender-driveby")){
		SendClientMessage(playerid,COLOR_LTBLUE,"Aprendendo o que é Drive-by");
		SendClientMessage(playerid,COLOR_WHITE,"1. Bom, Drive-by é exatamente quando você entra como passageiro num carro");
		SendClientMessage(playerid,COLOR_WHITE,"2. e usa essa condição para matar outros jogadores de dentro do carro");
		SendClientMessage(playerid,COLOR_WHITE,"3. Tirando a possibilidade do outro jogador reagir.");
		return 1;
	}

	if(compare(cmd,"/akickcheater")){
        if(IsPlayerAdmin(playerid)){
            new idcheater;
			new tmp[256];
			new Text:CHEATER_Text;
			new CHEATER_String[14];
			new Text:CHEATER_Box;
			tmp = strtok(cmdtext, idx);
            idcheater = strval(tmp);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COLOR_RED, "/akickcheater [id]");
				return 1;
			}
			if(!IsPlayerConnected(idcheater)){
				SendClientMessage(playerid, COLOR_RED, "Jogador não conectado");
				return 1;
			} else {
   				CHEATER_String = "_";
				CHEATER_Box = TextDrawCreate(0.0,0.0,CHEATER_String);
				TextDrawFont(CHEATER_Box,1);
				TextDrawLetterSize(CHEATER_Box, 0.0, 50.0);
				TextDrawUseBox(CHEATER_Box, true);
				TextDrawColor(CHEATER_Box,0);
				TextDrawBoxColor(CHEATER_Box, COL_BOX);
				CHEATER_String = "SEU CHEATER!";
				CHEATER_Text = TextDrawCreate(320,190,CHEATER_String);
				TextDrawFont(CHEATER_Text,1);
				TextDrawLetterSize(CHEATER_Text, 1.5, 7.0);
				TextDrawAlignment(CHEATER_Text, 2);
				TextDrawSetShadow(CHEATER_Text, false);
				TextDrawSetProportional(CHEATER_Text, 1);
				TextDrawColor(CHEATER_Text,COL_RED);
				TextDrawShowForPlayer(idcheater, CHEATER_Text);
				TextDrawShowForPlayer(idcheater, CHEATER_Box);
				TogglePlayerControllable(idcheater, false);
		 		KickCheaterStart(idcheater);
				format(tmp,sizeof(tmp),"(%s %s) %s foi kickado por usar cheat.",GetFormattedDate(),GetFormattedTime(),PlayerName(idcheater));
 				SendClientMessageToAll(COLOR_LTBLUE,tmp);
				return 1;
			}
		}
		return 1;
	}
	//fim dos comandos
	return 0;
}

public OnRconCommand(cmd[])
{
	if(compare(cmd,"say")){
		return 0;
	}
	return 1;
}

//Publics
public KickCheaterStart(idcheater)
{
	SendClientMessage(idcheater, COLOR_RED, "Você será Kickado em 10 segundos.");
	TogglePlayerControllable(idcheater, false);
	PlayerPlaySound(idcheater, 1056, 0.0, 0.0, 0.0);
	SetTimerEx("KickCheaterEnd", 10000, 0,"e", idcheater);
	return 1;
}

public KickCheaterEnd(idcheater)
{
	SendClientMessage(idcheater, COLOR_RED, "Kickado!");
	TogglePlayerControllable(idcheater, false);
	PlayerPlaySound(idcheater, 1056, 0.0, 0.0, 0.0);
	Kick(idcheater);
	return 1;
}

public PingProtection()
{
	new string[64];
	for(new i=0; i<MAX_PLAYERS; i++) {
	    if(GetPlayerPing(i) > PING_MAX_PING) {
			if(gPingCount[i][0] == 0) gPingCount[i][1] = TimeStamp();
			gPingCount[i][0]++;
			if(TimeStamp() - gPingCount[i][1] > PING_TIMELIMIT) {
		    	gPingCount[i][1] = TimeStamp();
				gPingCount[i][0] = 1;
			}
			else if(gPingCount[i][0] == PING_MAX_EXCEEDS && !IsPlayerAdmin(i)) {
				format(string,sizeof(string),"%s Kickado (Ping Excedeu: %d)",PlayerName(i), PING_MAX_PING);
				SendClientMessageToAll(COLOR_WHITE,string);
				Kick(i);
			}
		}
	}
	return 1;
}

public DropWeapons(playerid)
{
	new Float:px, Float:py, Float:pz;
	new Hora,Minuto,Segundo;
	new Ano,Mes,Dia;
	gettime(Hora,Minuto,Segundo);
	getdate(Ano,Mes,Dia);
	GetPlayerPos(playerid,px,py,pz);
	new weapon_slots[WEAPON_SLOTS + 1][2];
	new used_weapon_slots;
	for(new i=0;i<WEAPON_SLOTS;i++)
	{
		GetPlayerWeaponData(playerid,i,weapon_slots[i][0],weapon_slots[i][1]);
		if(i == 0 && weapon_slots[i][0] == 0) weapon_slots[i][1] = 0;
		if(weapon_slots[i][1] > 0 && weapon_slots[i][0] < sizeof(weapons) && weapons[weapon_slots[i][0] ] != -1)
		{
			used_weapon_slots ++;
		}
		else
		{
		    weapon_slots[i][0] = 0;
		    weapon_slots[i][1] = 0;
		}
	}

	new used_weapon_slots2 = used_weapon_slots;
	for(new i = 0; i < WEAPON_SLOTS; i++)
	{
	    if( weapon_slots[i][1] > 0)
	    {
			new Float:angle = 360.0 - float(used_weapon_slots--) * ( 360.0 / float(used_weapon_slots2));
			new p = CreatePickup(weapons[weapon_slots[i][0] ],PICKUP_TYPE,px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz);
			if(p == INVALID_PICKUP)
			{
				new lowest_time;
				new _id;
				for(new j = 0; j < MAX_PICKUPS; j++)
				{
					if(pickups[j][creation_time] < lowest_time)
					{
					    lowest_time = pickups[j][creation_time];
					    _id = j;
					}
				}

				DestroyPickupEx(_id);
				KillTimer(pickups[_id][timer]);
				p = CreatePickup(weapons[weapon_slots[i][0]], PICKUP_TYPE,px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz);
			}
			pickups[p][creation_time] = mktime(Hora,Minuto,Segundo,Ano,Mes,Dia);
			pickups[p][weapon] = weapon_slots[i][0];
			pickups[p][ammo] = weapon_slots[i][1];
			#if MAX_DROP_AMOUNT != -1
		    if(pickups[p][ammo] > MAX_DROP_AMOUNT) pickups[p][ammo] = MAX_DROP_AMOUNT;
		    #endif
			pickups[p][timer] = SetTimerEx("DestroyPickupEx", MAX_DROP_LIFETIME * 1000, 0, "i", p);
		}
	}
}

public DestroyPickupEx(p)
{
	DestroyPickup(p);
	pickups[p][creation_time] = 0;
	pickups[p][weapon] = 0;
	pickups[p][ammo] = 0;
}

public OnPlayerPickUpPickup(playerid,pickupid)
{
	if(pickups[pickupid][creation_time] != 0){
	GivePlayerWeapon(playerid,pickups[pickupid][weapon], pickups[pickupid][ammo]);
	}
	return 1;
}

public Contar(playerid)
{
	if(Count > 0){
		new countgt[256];
		format(countgt,sizeof(countgt),"%d",Count);
		GameTextForPlayer(playerid,countgt,5000,6);
		TogglePlayerControllable(playerid,false);
		Count--;
	} else {
		GameTextForPlayer(playerid,"Vai!",5000,6);
		TogglePlayerControllable(playerid,true);
		}
	}
	
public Godcar(playerid,veiculo)
{
	veiculo = GetPlayerVehicleID(playerid);
	SetVehicleHealth(veiculo,1000);
}

public IsNumeric(const string[]) //By Mike
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
	    if (string[i] > '9' || string[i] < '0') return 0;
	}
	return 1;
}

//Stocks
stock writereport(playerid, log[])
{
	fixchars(log);
	new insert[256];
	new type[256];
	type = "report";
	format(insert, sizeof(insert), "NULL, '%s %s', '%s', '%s', '%s'", GetFormattedDate(), GetFormattedTime(), log, PlayerName(playerid), type);
	PRIV_sqlins("replies", insert);
	return 1;
}

stock writesuggest(playerid, log[])
{
	fixchars(log);
	new insert[256];
	new type[256];
	type = "suggest";
	format(insert, sizeof(insert), "NULL, '%s %s', '%s', '%s', '%s'", GetFormattedDate(), GetFormattedTime(), log, PlayerName(playerid), type);
	PRIV_sqlins("replies", insert);
	return 1;
}

stock IsPlayerInInvalidNosVehicle(playerid,vehicleid)
{
    #define MAX_INVALID_NOS_VEHICLES 30

    new InvalidNosVehicles[MAX_INVALID_NOS_VEHICLES] =
    {
		581,523,462,521,463,522,461,448,468,586,
		509,481,510,472,473,493,595,484,430,453,
		452,446,454,590,569,537,538,570,449,444
    };

    vehicleid = GetPlayerVehicleID(playerid);

    if(IsPlayerInVehicle(playerid,vehicleid)) for(new i = 0; i < MAX_INVALID_NOS_VEHICLES; i++) if(GetVehicleModel(vehicleid) == InvalidNosVehicles[i]) return true;
    return false;
}

stock GetFormattedDate(){
	new date[256],ny[5],Dia,Mes,Ano,h,m,s;
	getdate(Ano,Mes,Dia);
	format(ny,256,"%d",Ano);
	strdel(ny,0,2);
	gettime(h,m,s);
	h += FUSE;
	if(h<0) Dia--;
	format(date,256,"%s/%s/%s",AddZeros(Dia),AddZeros(Mes),ny);
	return date;
}

stock GetFormattedTime(){
	new time[256];
	new Hora,Minuto,Segundo;
	gettime(Hora,Minuto,Segundo);
	Hora += FUSE; //descomente isso para ativar o fuso horario
	if(Hora < 0) Hora += 24;
    format(time,sizeof(time),"%s:%s:%s",AddZeros(Hora),AddZeros(Minuto),AddZeros(Segundo));
	return time;
}

stock AddZeros(num)
{
	new tmp[256];
	if(num < 10) format(tmp,256,"0%d",num);
	else format(tmp,256,"%d",num);
	return tmp;
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
 	new tmp[MAX_STRING];
  	set(tmp,name);
	return tmp;
}

stock SpamProtection(playerid)
{
	new string[256];
	if(gSpamCount[playerid][0] == 0) gSpamCount[playerid][1] = TimeStamp();
    gSpamCount[playerid][0]++;
	if(TimeStamp() - gSpamCount[playerid][1] > SPAM_TIMELIMIT){
		gSpamCount[playerid][0] = 1;
		gSpamCount[playerid][1] = TimeStamp();
	}
	else if(gSpamCount[playerid][0] == SPAM_MAX_MSGS && !IsPlayerAdmin(playerid)){
	    SendClientMessage(playerid,COLOR_RED,"SEU FLOODER(Spammer)!! Nosso sistema o emudeceu. Você ficará 5 min sem falar se nenhum admin desemudecê-lo neste período.");
	    Mudo[playerid] = 1;
     	SetTimerEx("Desemudecer",300000,false,"d",playerid);
		format(string,sizeof(string),"%s foi emudecido por Flood/Spam, para desemudecê-lo digite /adesemudecer %d",PlayerName(playerid),playerid);
		SendClientMessageToAdmins(COLOR_WHITE, string);
	}
 	return 1;
}

stock TimeStamp()
{
	new time = GetTickCount() / 1000;
	return time;
}

stock DrivebyProtection(killerid)
{
	new string[64];
	if(gDrivebyCount[killerid][0] == 0) gDrivebyCount[killerid][1] = TimeStamp();
    gDrivebyCount[killerid][0]++;
	if(TimeStamp() - gDrivebyCount[killerid][1] > DRIVEBY_TIMELIMIT) {
	    gDrivebyCount[killerid][1] = TimeStamp();
		gDrivebyCount[killerid][0] = 1;
	}
	else if(gDrivebyCount[killerid][0] == DRIVEBY_MAX_KILLS && !IsPlayerAdmin(killerid)) {
		format(string,sizeof(string)," %s Kickado (Driveby excessivo)",PlayerName(killerid));
		SendClientMessageToAll(COLOR_WHITE,string);
		Kick(killerid);
	}
	else if(gDrivebyCount[killerid][0] == DRIVEBY_MAX_KILLS-1 && !IsPlayerAdmin(killerid)) {
	    SendClientMessage(killerid,COLOR_RED,"Pare com Driveby, se fizer denovo levará Kick!");
	    SendClientMessage(killerid,COLOR_WHITE,"Se não sabe o que é Driveby, digite /aprender-driveby");
	}
	return 1;
}

stock Float:GetDistanceBetweenPlayers(p1,p2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	if (!IsPlayerConnected(p1) || !IsPlayerConnected(p2)) return -1.00;
	GetPlayerPos(p1,x1,y1,z1);
	GetPlayerPos(p2,x2,y2,z2);
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

stock SendClientMessageToAdmins(string_color, string_text[])
{
    for(new i=0;i<MAX_PLAYERS;i++){
        if(IsPlayerConnected(i)){
            if(IsPlayerAdmin(i)) SendClientMessage(i, string_color, string_text);
        }
    }
}

stock AddPlayerHealth(playerid,Float:h)
{
	if(!IsPlayerConnected(playerid)) return 0;
	new Float:x;
	GetPlayerHealth(playerid,x);
	if(x+h < 100) SetPlayerHealth(playerid,x+h);
	if(x+h >= 100) SetPlayerHealth(playerid,100);
	return 0;
}

stock AddPlayerArmour(playerid,Float:a)
{
	if(!IsPlayerConnected(playerid)) return 0;
	new Float:q;
	GetPlayerArmour(playerid,q);
	if(q+a < 100) SetPlayerArmour(playerid,q+a);
	if(q+a >= 100) SetPlayerArmour(playerid,100);
	return 0;
}

stock compare(string1[],string2[]) {
	new igual;
	for(new c; c < strlen(string1); c++) {
    	if(!strcmp(string1[c],string2[c],false)) igual=1;
		else {
		    igual = 0;
		    break;
		}
	}
	
	if(igual==0) return 0;
	else return 1;
}
stock equal(string_text1[],string_text2[])
{
	for(new i,b; i < strlen(string_text1), i+=1){
	    if(strcmp(string_text1[i],string_text2[i],false) == 0) b = 1;
	    else{ b = 0; break; }
	}
	return b;
}
stock Kill(playerid) SetPlayerHealth(playerid,0.0);

stock Fuck(playerid){
	Fudido[playerid] = 1;
	new NameStr[256];
	format(NameStr, sizeof(NameStr),"[FUCKED]%s",PlayerName(playerid));
	SetPlayerHealth(playerid,1);
	SetPlayerName(playerid,NameStr);
	new Float:armour;
	GetPlayerArmour(playerid,armour);
	if(armour > 1) SetPlayerArmour(playerid, 0.0);
	ResetPlayerWeapons(playerid);
	DropWeapons(playerid);
	ResetPlayerMoney(playerid);
	SetPlayerSkin(playerid,10);
	if(IsPlayerInAnyVehicle(playerid)) RemovePlayerFromVehicle(playerid);
	}
	
stock IsAPlane(vid){
    switch(GetVehicleModel(vid))
	{
    	case 460, 476, 511, 512, 513, 519,529,553,577,592, 593: return 1;
   		default: return 0;
	}
	return 0;
}
