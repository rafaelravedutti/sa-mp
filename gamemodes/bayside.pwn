#include <a_samp>
#include <a_objects>
#include <a_players>
#include <a_vehicles>
#include <datagram>
#include <float>
#include <file>
#include <string>
#include <time>
#pragma tabsize 0
#define never 10000
static gTeam[MAX_PLAYERS]; // Tracks the team assignment for each player

#define CHECKPOINT_NONE 0
#define CHECKPOINT_PICKUP 1
#define CHECKPOINT_DROPOFF 2
#define CHECKPOINT_SR1START 3
#define CHECKPOINT_SRA 4
#define CHECKPOINT_SRB 5
#define CHECKPOINT_SRC 6
#define CHECKPOINT_SRD 7
#define CHECKPOINT_SRE 8
#define CHECKPOINT_SRF 9
#define CHECKPOINT_SRG 10
#define CHECKPOINT_CARDROP 11
#define CHECKPOINT_HOME 12
#define CHECKPOINT_DM 13
#define CHECKPOINT_DROGASFINAL 14
#define CHECKPOINT_DROGASINICIO 15
#define CHECKPOINT_NARCOINICIO 16
#define CHECKPOINT_NARCOBARCO 17
#define CHECKPOINT_NARCOFINAL 18
#define CHECKPOINT_PIRATAINI 19
#define CHECKPOINT_PIRATANAVIO 20
#define CHECKPOINT_PIRATANAVIO2 21
#define CHECKPOINT_PIRATARAMPA 22
#define CHECKPOINT_PIRATAFINAL 23
#define CHECKPOINT_INIPOS 24
#define CHECKPOINT_LADRAOBANCO 25
#define CHECKPOINT_LIXO1 26
#define CHECKPOINT_LIXO2 27
#define CHECKPOINT_LIXO3 28
#define CHECKPOINT_LIXO4 29
#define CHECKPOINT_LIXO5 30
#define CHECKPOINT_LIXO6 31
#define CHECKPOINT_LIXO7 32
#define CHECKPOINT_LIXO8 33
#define CHECKPOINT_LIXO9 34
#define CHECKPOINT_LIXO10 35
#define CHECKPOINT_LIXO11 36
#define CHECKPOINT_LIXO12 37
#define CHECKPOINT_LIXO13 38
#define CHECKPOINT_LIXO14 39
#define CHECKPOINT_LIXO15 40
#define CHECKPOINT_LIXO16 41
#define CHECKPOINT_LIXO17 42
#define CHECKPOINT_LIXO18 43
#define CHECKPOINT_LIXO19 44
#define CHECKPOINT_LIXO20 45
#define CHECKPOINT_LIXO21 46
#define CHECKPOINT_LIXO22 47
#define CHECKPOINT_LIXO23 48
#define CHECKPOINT_LIXO24 49
#define CHECKPOINT_LIXO25 50
#define CHECKPOINT_LIXO26 51
#define CHECKPOINT_LIXO27 52
#define CHECKPOINT_LIXO28 53
#define CHECKPOINT_LIXO29 54
#define CHECKPOINT_CARROROUBADO 55
#define CHECKPOINT_HACKERINI 56
#define CHECKPOINT_HACKERFIN 57
#define CHECKPOINT_TRAFICOARMA 58
#define CHECKPOINT_TRAFICOARMA2 59
#define CHECKPOINT_TRAFICOARMA3 60
#define CHECKPOINT_TRAFICOARMA4 61
#define CHECKPOINT_TRAFICOARMA5 62
#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_GRAD2 0xBFC0C2FF
#define COLOR_GRAD3 0xCBCCCEFF
#define COLOR_GRAD4 0xD8D8D8FF
#define COLOR_GRAD5 0xE3E3E3FF
#define COLOR_GRAD6 0xF0F0F0FF
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_FADE1 0xE6E6E6E6
#define COLOR_FADE2 0xC8C8C8C8
#define COLOR_FADE3 0xAAAAAAAA
#define COLOR_FADE4 0x8C8C8C8C
#define COLOR_FADE5 0x6E6E6E6E
#define COLOR_PURPLE 0xC2A2DAAA
#define COLOR_DBLUE 0x2641FEAA
#define COLOR_ALLDEPT 0xFF8282AA
#define TEAM_CYAN 1
#define TEAM_BLUE 2
#define TEAM_GREEN 3
#define TEAM_ORANGE 4
#define TEAM_BALLAS 5
#define TEAM_GROVE 6
#define TEAM_VAGOS 7
#define TEAM_AZTECAS 8
#define TEAM_NANG 9
#define TEAM_RIFA 78
#define TEAM_MAFIA 11
#define TEAM_RMAFIA 12
#define TEAM_TRIADS 13
#define TEAM_BIKERS 14
#define TEAM_PESCADOR 15
#define TEAM_ACOMPANHANTE 16
#define TEAM_CACADOR 17
#define TEAM_MOTORISTA 18
#define TEAM_TAXISTA 19
#define TEAM_FISCAL 20
#define TEAM_LIXEIRO 21
#define TEAM_MOTOBOY 22
#define TEAM_CAMINHONEIRO 23
#define OBJECTIVE_COLOR 0x64000064
#define TEAM_GREEN_COLOR 0xFFFFFFAA
#define TEAM_BLUE_COLOR 0x8D8DFFAA
#define COR_AZUL 0x8D8DFFAA
#define COLOR_ADD 0x63FF60AA
#define TEAM_CYAN_COLOR 0xFF8282AA
#define TEAM_ORANGE_COLOR 0xFF8300C8
#define TEAM_ORANGE1_COLOR 0xFF830099
#define TEAM_ORANGE2_COLOR 0xFF830088
#define TEAM_ORANGE3_COLOR 0xFF830077
#define TEAM_ORANGE4_COLOR 0xFF830066
#define TEAM_ORANGE5_COLOR 0xFF830055
#define TEAM_ORANGE6_COLOR 0xFF830044
#define TEAM_ORANGE7_COLOR 0xFF830033
#define TEAM_ORANGE8_COLOR 0xFF830022
#define TEAM_ORANGE9_COLOR 0xFF830011
#define TEAM_ORANGE10_COLOR 0xFF830000
#define TEAM_BALLAS_COLOR 0xD900D3C8
#define TEAM_BALLAS1_COLOR 0xD900D399
#define TEAM_BALLAS2_COLOR 0xD900D388
#define TEAM_BALLAS3_COLOR 0xD900D377
#define TEAM_BALLAS4_COLOR 0xD900D366
#define TEAM_BALLAS5_COLOR 0xD900D355
#define TEAM_BALLAS6_COLOR 0xD900D344
#define TEAM_BALLAS7_COLOR 0xD900D333
#define TEAM_BALLAS8_COLOR 0xD900D322
#define TEAM_BALLAS9_COLOR 0xD900D311
#define TEAM_BALLAS10_COLOR 0xD900D300
#define TEAM_GROVE_COLOR 0x00D900C8
#define TEAM_GROVE1_COLOR 0x00D90099
#define TEAM_GROVE2_COLOR 0x00D90088
#define TEAM_GROVE3_COLOR 0x00D90077
#define TEAM_GROVE4_COLOR 0x00D90066
#define TEAM_GROVE5_COLOR 0x00D90055
#define TEAM_GROVE6_COLOR 0x00D90044
#define TEAM_GROVE7_COLOR 0x00D90033
#define TEAM_GROVE8_COLOR 0x00D90022
#define TEAM_GROVE9_COLOR 0x00D90011
#define TEAM_GROVE10_COLOR 0x00D90000
#define TEAM_VAGOS_COLOR 0xFFC801C8
#define TEAM_VAGOS1_COLOR 0xFFC80199
#define TEAM_VAGOS2_COLOR 0xFFC80188
#define TEAM_VAGOS3_COLOR 0xFFC80177
#define TEAM_VAGOS4_COLOR 0xFFC80166
#define TEAM_VAGOS5_COLOR 0xFFC80155
#define TEAM_VAGOS6_COLOR 0xFFC80144
#define TEAM_VAGOS7_COLOR 0xFFC80133
#define TEAM_VAGOS8_COLOR 0xFFC80122
#define TEAM_VAGOS9_COLOR 0xFFC80111
#define TEAM_VAGOS10_COLOR 0xFFC80100
#define TEAM_AZTECAS_COLOR 0x01FCFFC8
#define TEAM_AZTECAS1_COLOR 0x01FCFF99
#define TEAM_AZTECAS2_COLOR 0x01FCFF88
#define TEAM_AZTECAS3_COLOR 0x01FCFF77
#define TEAM_AZTECAS4_COLOR 0x01FCFF66
#define TEAM_AZTECAS5_COLOR 0x01FCFF55
#define TEAM_AZTECAS6_COLOR 0x01FCFF44
#define TEAM_AZTECAS7_COLOR 0x01FCFF33
#define TEAM_AZTECAS8_COLOR 0x01FCFF22
#define TEAM_AZTECAS9_COLOR 0x01FCFF11
#define TEAM_AZTECAS10_COLOR 0x01FCFF00
#define TEAM_NANG_COLOR 0xBDCB92C8
#define TEAM_NANG1_COLOR 0xBDCB9299
#define TEAM_NANG2_COLOR 0xBDCB9288
#define TEAM_NANG3_COLOR 0xBDCB9277
#define TEAM_NANG4_COLOR 0xBDCB9266
#define TEAM_NANG5_COLOR 0xBDCB9255
#define TEAM_NANG6_COLOR 0xBDCB9244
#define TEAM_NANG7_COLOR 0xBDCB9233
#define TEAM_NANG8_COLOR 0xBDCB9222
#define TEAM_NANG9_COLOR 0xBDCB9211
#define TEAM_NANG10_COLOR 0xBDCB9200
#define TEAM_RIFA_COLOR 0x000000C8
#define TEAM_RIFA1_COLOR 0x00000099
#define TEAM_RIFA2_COLOR 0x00000088
#define TEAM_RIFA3_COLOR 0x00000077
#define TEAM_RIFA4_COLOR 0x00000066
#define TEAM_RIFA5_COLOR 0x00000055
#define TEAM_RIFA6_COLOR 0x00000044
#define TEAM_RIFA7_COLOR 0x00000033
#define TEAM_RIFA8_COLOR 0x00000044
#define TEAM_RIFA9_COLOR 0x00000055
#define TEAM_RIFA10_COLOR 0x00000066
#define TEAM_MAFIA_COLOR 0x9A9999C8
#define TEAM_MAFIA1_COLOR 0x9A999999
#define TEAM_MAFIA2_COLOR 0x9A999988
#define TEAM_MAFIA3_COLOR 0x9A999977
#define TEAM_MAFIA4_COLOR 0x9A999966
#define TEAM_MAFIA5_COLOR 0x9A999955
#define TEAM_MAFIA6_COLOR 0x9A999944
#define TEAM_MAFIA7_COLOR 0x9A999933
#define TEAM_MAFIA8_COLOR 0x9A999922
#define TEAM_MAFIA9_COLOR 0x9A999911
#define TEAM_MAFIA10_COLOR 0x9A999900
#define TEAM_RMAFIA_COLOR 0x916600C8
#define TEAM_RMAFIA1_COLOR 0x91660099
#define TEAM_RMAFIA2_COLOR 0x91660088
#define TEAM_RMAFIA3_COLOR 0x91660077
#define TEAM_RMAFIA4_COLOR 0x91660066
#define TEAM_RMAFIA5_COLOR 0x91660055
#define TEAM_RMAFIA6_COLOR 0x91660044
#define TEAM_RMAFIA7_COLOR 0x91660033
#define TEAM_RMAFIA8_COLOR 0x91660022
#define TEAM_RMAFIA9_COLOR 0x91660011
#define TEAM_RMAFIA10_COLOR 0x91660000
#define TEAM_TRIADS_COLOR 0x587B95C8
#define TEAM_TRIADS1_COLOR 0x587B9599
#define TEAM_TRIADS2_COLOR 0x587B9588
#define TEAM_TRIADS3_COLOR 0x587B9577
#define TEAM_TRIADS4_COLOR 0x587B9566
#define TEAM_TRIADS5_COLOR 0x587B9555
#define TEAM_TRIADS6_COLOR 0x587B9544
#define TEAM_TRIADS7_COLOR 0x587B9533
#define TEAM_TRIADS8_COLOR 0x587B9522
#define TEAM_TRIADS9_COLOR 0x587B9511
#define TEAM_TRIADS10_COLOR 0x587B9500
#define TEAM_BIKERS_COLOR 0xA49A00C8
#define TEAM_BIKERS1_COLOR 0xA49A0099
#define TEAM_BIKERS2_COLOR 0xA49A0088
#define TEAM_BIKERS3_COLOR 0xA49A0077
#define TEAM_BIKERS4_COLOR 0xA49A0066
#define TEAM_BIKERS5_COLOR 0xA49A0055
#define TEAM_BIKERS6_COLOR 0xA49A0044
#define TEAM_BIKERS7_COLOR 0xA49A0033
#define TEAM_BIKERS8_COLOR 0xA49A0022
#define TEAM_BIKERS9_COLOR 0xA49A0011
#define TEAM_BIKERS10_COLOR 0xA49A0000
#define COLOR_INVIS 0xAFAFAF00
#define COLOR_SPEC 0xBFC0C200
#define INACTIVE_PLAYER_ID 255
#define MAX_ALLOWED_CHARS 88
forward SetAllPlayerRaceCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num);
forward RaceCheckpointReset();
forward GameTicks (ticks);
forward PostoAntiExplosao();
forward ConvertTicks (ticks);
forward CopScanner ();
forward PayPlayerInArea (playerID, Float:x1, Float:y1,Float:z1, Float:x2, Float:y2,Float:z2, cash);
forward PirateShipScoreUpdate ();
forward Spectator ();
forward IsAPlane (carid);
forward IsACopCar (carid);
forward IsAPublicVeh (carid);
forward IsAnAmbulance (carid);
forward IsATruck (carid);
forward InBP1 (playerid);
forward InBP2 (playerid);
forward Abastecer(playerid);
forward InBP3 (playerid);
forward InBP4 (playerid);
forward ClearCrime (playerid);
forward BetWinner (playerid,contest);
forward PayLog (string[]);
forward CmdLog (string[]);
forward RaceDebug (playerid);
forward RaceEnd ();
forward DMDelay ();
forward DMDelayr ();
forward DMDelayg ();
forward DMDetect ();
forward DMEndCam (playerid,string[]);
forward DMScoreCalc ();
forward JobGive (playerid);
forward HireCost (carid);
forward CarCheck ();
forward CarInit ();
forward CarTow (carid);
forward CarRespawn (carid);
forward LockCar (carid);
forward UnLockCar (carid);
forward TeamCarLockInit ();
forward TeamLockReset (carid);
forward InitLockDoors (playerid);
forward TeamLockDoors (playerid);
forward DebugPrint (string[],value1,value2,type);
forward CellPhoneTimer ();
forward SetPlayerFlash ();
forward SetPlayerFlashRev ();
forward RingToner ();
forward RingTonerRev ();
forward SetPlayerUnjail ();
forward VoteKickTimer ();
forward ClearVote (kickedid);
forward PrintSBizInfo (playerid,targetid);
forward PrintBizInfo (playerid,targetid);
forward PrintKillStats (playerid,targetid);
forward PrintDeathStats (playerid,targetid);
forward SetPlayerToTeamColorFlash (playerid);
forward SaveRace (playerid,name[]);
forward BestTime (name[]);
forward LoadTmp ();
forward LoadRace (playerid,name[]);
forward LoadProperty ();
forward LoadDM (playerid,name[]);
forward SaveDM (playerid,name[]);
forward LoadRaceList (playerid,name[]);
forward SaveRaceList (playerid,name[]);
forward LoadBizz ();
forward LoadSBizz ();
forward SkyDive ();
forward Production ();
forward DateProp (playerid);
forward Checkprop ();
forward DelPrint (string1[]);
forward LoadPlayer (loaderid,const string[]);
forward SavePlayer (loaderid,const string[]);
forward CopCheck (playerid);
forward MedCheck (playerid);
forward OnPlayerRename (name[],string[],playerid);
forward OnPropUpdate ();
forward ABroadCast (color,const string[],level);
forward SendTeamBeepMessage (team, color, string[]);
forward SendEnemyMessage (color, string[]);
forward SendReportMessage (color, string[]);
forward SendPlayerCommandMessage (color, string[]);
forward PlayerFixRadio (playerid);
forward PlayerFixRadio2 (playerid);
forward StopJail ();
forward HouseLevel (playerid);
forward CHouseLevel (houseid);
forward CrimInRange (Float:radi, playerid,copid);
forward CrimProxDetector(Float:radi, playerid,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10);
forward PlayerToPoint (Float:radi, playerid, Float:x, Float:y, Float:z);
forward PlayerInArea ();
forward PlayerInArena ();
forward PenInArea ();
forward CustomPickups ();
forward IdleKick ();
forward AntiCamp ();
forward AntiTeleport ();
forward RaceSpec (playerid);
forward BestPlayer (playerid);
forward PenDelay (playerid);
forward SpeedDelay (playerid);
forward DMPlayer (playerid);
forward InHouse ();
forward IsStringAName (string[]);
forward GetPlayerID (string[]);
forward SetCamBack (playerid);
forward DollahScoreUpdate();
forward PrevisaoDoTempo();
forward SetPlayerRandomSpawn(playerid);
forward SetPlayerNewMission();
forward CheckpointReset();
forward SetPlayerToTeamColor(playerid);
forward SetupPlayerForClassSelection(playerid);
forward SetPlayerTeamFromClass(playerid,classid);
forward GameModeExitFunc();
forward GameModeInitExitFunc();
forward PrePlayerNewMission();
forward SetPlayerNewMission();
forward RaceDelay();
forward RaceDelayr();
forward RaceDelayg();
forward OnPlayerDropCashBox(playerid);
forward RewardCalc(playerid,min,max);
forward CheckpointReset();
forward SetAllPlayerCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num);
forward SetAllCopCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi);
forward OpenDoors();
forward SetPlayerCriminal(playerid,declare,reason[],pe,flash);
forward SetPlayerFree(playerid,declare,reason[],pe,flash);
forward OffTheHook();
forward SetPlayerWeapons(playerid);
forward PrintPlayerWeapons(playerid,targetid);
forward SetPlayerToTeamColor(playerid);
forward GameModeInitExitFunc();
forward LoadConfig();
forward GetVal(string[]);
forward SyncUp();
forward SyncTime();
forward PayDay();
forward strtik(const string[], &index);
forward split(const strsrc[], strdest[][], delimiter);
forward OnPlayerLogin(playerid,const string[]);
forward OnPlayerUpdate(playerid);
forward BroadCast(color,const string[]);
forward OOCOff(color,const string[]);
forward PlaySoundAll(playerid, soundid, Float:psx ,Float:psy ,Float:psz);
forward SendTeamMessage(team, color, string[]);
forward SendAdminMessage(color, string[]);
forward AddCar(carcoords);
forward PlayerPlayMusic(playerid);
forward StopMusic();
forward Encript(string[]);
forward Decript(string[]);
forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
forward ProxDetectorS(Float:radi, playerid, targetid);
forward FixHour(hour);
forward TestDistance(playerid,giveplayerid,Float:tarx,Float:tary,Float:tarz,Float:radi);
forward PlayJailSound(sound , stopsound, duration, Float: jailx,  Float: jaily,  Float: jailz);
//------------------------------------------------------------------------------------------------------
new gPlayerCheckpointStatus[MAX_PLAYERS];
new gPlayerLapStatus[MAX_PLAYERS];
new gPlayerLogged[MAX_PLAYERS];
new gPlayerSpawned[MAX_PLAYERS];
new Pronto[MAX_PLAYERS];
new gActivePlayers[MAX_PLAYERS];
new gLastCar[301];
new gOoc[MAX_PLAYERS];
new BigEar[MAX_PLAYERS];
new Spectate[MAX_PLAYERS];
new FlashTime[MAX_PLAYERS];
new CellTime[MAX_PLAYERS];
new JailTime[MAX_PLAYERS];
new StartTime[MAX_PLAYERS];
new RaceTime[MAX_PLAYERS];
new Contract[MAX_PLAYERS];
new KickVote[MAX_PLAYERS];
new VoteKick[MAX_PLAYERS];
new LastVote[MAX_PLAYERS];
new HireCar[MAX_PLAYERS];
new Tempo[MAX_PLAYERS];
new SafeTime[MAX_PLAYERS];
/*new HidePM[MAX_PLAYERS];*/
new gDice[MAX_PLAYERS];
new gSkyDive[MAX_PLAYERS];
new gSpeedo[MAX_PLAYERS];
new gDrogas[MAX_PLAYERS];
new Congelado[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS];
new QuerDrogas[MAX_PLAYERS];
new ComandosDesativados[MAX_PLAYERS];
new ComandosDesativados2[MAX_PLAYERS];
new JogadorNoCarro[MAX_PLAYERS];
new missao1[MAX_PLAYERS];
new missao2[MAX_PLAYERS];
new missao3[MAX_PLAYERS];
new RouboBanco[MAX_PLAYERS];
new RouboCarro[MAX_PLAYERS];
new TrArmas[MAX_PLAYERS];
new Buginstalado[MAX_PLAYERS];
new Lixeiro[MAX_PLAYERS];
new Hacker[MAX_PLAYERS];
new EscolhendoClasse[MAX_PLAYERS];
new missaocancelada[MAX_PLAYERS];
new Menu:VMain;
new gSpentCash[MAX_PLAYERS];
new FirstSpawn[MAX_PLAYERS];
new gPlayerFighter[MAX_PLAYERS];
new DmScore[MAX_PLAYERS];
new LapCount[MAX_PLAYERS];
new SwitchKey[MAX_PLAYERS];
new TVMode[MAX_PLAYERS];
new Fixr[MAX_PLAYERS];
new Hidden[MAX_PLAYERS];
new Locator[MAX_PLAYERS];
new PLicence[MAX_PLAYERS];
new DmHiScore;
new DmHiPlayer = 255;
new Speeder;
new gFighters;
new pos1time;
new pos2time;
new pos3time;
new cmins,csecs,cmils;
new Mobile[MAX_PLAYERS];
new RingTone[MAX_PLAYERS];
new CallCost[MAX_PLAYERS];
new Mute[MAX_PLAYERS];
new gPlayerAccount[MAX_PLAYERS];
new gRaceGuy[MAX_PLAYERS];
new gPlayerMission[MAX_PLAYERS];
new gPhoneBook[MAX_PLAYERS];
new gLastDriver[302];
new gTeamCarLock[265];
new gCarLock[265];
new gPublicEnemy = INVALID_PLAYER_ID;
new gSuperCop = INVALID_PLAYER_ID;
new gRaceLeader;
new gFightLeader;
new gRaceFin;
new gRaceMid;
new gRaceMid2;
new gRaceEnd;
new LevScoreOld;
new MissionActive;
new DropOff;
new noooc;
new racelist = 1;
new dmlist = 1;
new automission = 1;
new adds = 1;
new addtimer = 60000;
new raceendtimer;
new dmweapon;
new RetVal;
new specflick;
new Float:rx, Float:ry, Float:rz;
new Float:cwx, Float:cwy, Float:cwz;
new Float: scx, Float: scy, Float: scz;
new Float:rsx, Float:rsy, Float:rsz;
new Float:rmx, Float:rmy, Float:rmz;
new Float:rm2x, Float:rm2y, Float:rm2z;
new Float:rex, Float:rey, Float:rez;
new Float: jailxt, Float: jailyt, Float: jailzt;
new stopsoundt;
new carselect[15];
new objstore[128];
new cbjstore[128];
new motd[256];
new CurrentRace[256];
new stealcar = 0;
new stealcardest = 0;
new rccounter = 0;
new racedelay = 60000;
//new RStart;
new RNext;
new RNext2;
new REnd;
new Float:radardist = 1000.0;
new radarfreq = 1000;
new ghour = 0;
new gminute = 0;
new gsecond = 0;
new reward = 0;
new mediccharge = 100;
new preward = 0;
new numplayers = 0;
new dollah = 10; // Amount player recieves on spawn.
new realtime = 1;
new wtime = 15;
new gas1;
new gas2;
new objeto1;
new objeto2;
new hotwire = 0;
new cashbox = 0;
new streetrace = 0;
new deathmatch = 0;
new levelcost = 1000;
new deathcost = 80;
new paycheck = 200;
new jobdelay = 20000;
new petime = 180000; //3 minuites
new jailtime = 180000; //3 min
new callcost = 10; //20 seconds
new forceteam = 0;
new realchat = 1;
new fow = 1;
new timeshift = 0;
new stats = 1;
new gdebug = 1;
new shifthour;
new synctimer;
new newmistimer;
new unjailtimer;
new playertimer;
new dmtimer;
new cartimer;
new lastkiller;
new celltimer;
new intrate = 2;
new teamcarlock = 0;
new levelexp = 2;
new nocasino = 1;
new idletime = 900000; //30 mins
new dmtime = 240; //4 mins
new accountplay = 1;
new civnokill =1;
new basedcost = 10;
new suecost = 10;
new cchargetime = 10;
new txtcost = 1;
new offhook;
new pickups;
new randomrace = 0;
new nocarcash = 0;
new skydivecount = 60;
new Gtickcount;
new gLaps;
new Float:PlayerPos[MAX_PLAYERS][6];
new Float:DmeCam[6];
new Float:TeleportDest[MAX_PLAYERS][3];
new Float:CarTracking[MAX_PLAYERS][4];
new Float:TelePos[MAX_PLAYERS][6];
new Float:PenPos[3];
new BetRace[MAX_PLAYERS][2];
new BetDm[MAX_PLAYERS][2];
new Races[54][128] = {
{"LS2LV2LS"},
{"Downhill"},
{"Docks"},
{"StormDrain"},
{"Rectang"},
{"RampTime"},
{"VineDrive"},
{"RiverDieR"},
{"aero"},
{"AirportDrag"},
{"AirportParking"},
{"AirportRunway"},
{"AirportUnderground"},
{"Square"},
{"CrazyMtChillad"},
{"CupCakeCorner"},
{"Drift"},
{"grovesfjump"},
{"HillRun"},
{"Insanity"},
{"Jumper"},
{"LSDual"},
{"LSMainStreet"},
{"LSOrbital"},
{"OverHill_4X4"},
{"LAEastbound"},
{"StadiumLoop"},
{"TourDeSA"},
{"Tracker"},
{"Vinal"},
{"4x4DirtLoop"},
{"4x4OverTrack"},
{"4x4LSSouth"},
{"4x4DirtLoop"},
{"HillRun"},
{"BigWater"},
{"BlueFarm"},
{"BlueRed"},
{"Coastal"},
{"Countryloop"},
{"DesertGas"},
{"DesertRamp"},
{"FarmersLoop"},
{"JimsRing"},
{"ScorpGo"},
{"RiverRun"},
{"HarbourLoop"},
{"MoonRaker"},
{"VineDrive"},
{"DesertDiver"},
{"DriftHell"},
{"PierPressure"},
{"Mental"},
{"BeachTwist"}
};

new DmGun[12] = {31,30,32,26,28,24,27,25,29,22,23,0};

new DeathMatches[36][128] = {
{"Area52"},
{"Atlantis"},
{"Baseball"},
{"Construction"},
{"Quarry"},
{"Refinery"},
{"RodsOffice"},
{"RodsCastle"},
{"Carrier"},
{"TheBoat"},
{"Ruins"},
{"RodsCampus"},
{"Ruins"},
{"Urban"},
{"Ruins"},
{"TheCage"},
{"TheFarm"},
{"WildWest"},
{"Suburb"},
{"TruckYard"},
{"OpenWarII"},
{"MastaTrailer"},
{"EstateOfHate"},
{"OpenWar"},
{"HellSite"},
{"BigEars"},
{"PirateView"},
{"CabinFever"},
{"BatesMotel"},
{"Woods"},
{"SleepyHallow"},
{"WangView"},
{"DeathWay"},
{"TrainHouse"},
{"Glen"},
{"Abandon"}
};

new Float:gRandomPlayerSpawns[5][3] = {
{0.89,30.45,1199.59},
{0.6,27.7,1199.5},
{2.9,26.5,1199.5},
{2.9,28.8,1199.5},
{1.6,33.2,1199.5}
};

new Float:gRandomDMSpawns[21][3] = {
{-2414.0,1551.8,2.1}, // 1
{-2406.9,1555.2,2.1}, // 2
{-2392.8,1550.4,2.1}, // 3
{-2406.6,1545.1,2.1}, // 4
{-2391.9,1539.2,2.1}, // 5
{-2379.7,1541.8,2.1}, // 6
{-2366.9,1539.6,2.1}, // 7
{-2426.6,1537.4,2.1}, // 8
{-2473.5,1550.1,33.2}, // 9
{-2474.2,1546.8,23.6}, // 10
{-2464.2,1530.9,17.3}, // 11
{-2437.5,1559.0,17.3}, // 12
{-2416.3,1554.3,26.0}, // 13
{-2424.7,1542.5,26.0}, // 14
{-2410.5,1532.4,26.0}, // 15
{-2403.5,1546.5,26.0}, // 16
{-2389.2,1550.7,26.0}, // 17
{-2368.0,1556.7,17.3}, // 18
{-2351.5,1551.1,23.1}, // 19
{-2313.7,1546.4,18.7}, // 20
{-2313.7,1546.4,18.7} // 21
};

new Float:gDMWbounds[4] = {0.0,0.0,0.0,0.0};

new Float:gCopPlayerSpawns[3][3] = {
{198.5,162.5,1003.0},
{198.5,160.5,1003.0},
{200.5,162.5,1003.0}
};

new Float:gMedPlayerSpawns[3][3] = {
{-2233.34,2349.26,4.99},
{-2235.75,2351.71,4.99},
{-2238.63,2354.65,4.98}
};

new Float:gRaceCheckpoints[5][3] = {
{144.869800 ,-1564.952000,10.716340},
{1370.314000,-939.442600,34.187500},
{2865.989000,-1657.180000,10.875000},
{2123.180000,-2665.730000,13.375000},
{1350.4,-1400.2,13.3}//ls
};

new Float:gCBdropoff[37][3] = {
{2217.2,-1179.7,29.7},
{1098.1,-1428.0,22.7},
{2484.2,-1961.8,16.7},
{733.2,-1357.9,23.5},
{1411.6,-1455.1,20.4},
{1080.6,-1605.0,20.4},
{382.0,-2058.7,10.7},
{656.1,-1646.6,15.4},
{816.2,-1380.5,23.5},
{853.3,-1388.2,-0.5},
{915.4,-1235.1,17.2},
{1153.7,-1180.4,32.8},
{1183.9,-1257.3,18.8},
{1441.3,-926.8,39.6},
{1527.5,-893.5,57.6},
{1342.1,-1624.3,17.7},
{1292.1,-770.7,95.9},
{1907.9,-1318.6,14.1},
{1971.7,-1284.5,28.4},
{2687.1,-1144.6,71.3},
{2654.1,-1317.5,58.9},
{2771.0,-1388.5,27.1},
{2793.3,-1945.0,17.3},
{197.9,-1206.0,78.3},
{2447.5,-2209.8,26.6},
{2512.4,-2072.9,26.5},
{2171.6,-1732.1,17.2},
{2175.4,-1836.1,16.1},
{2399.5,-1550.7,28.0},
{2109.2,-1010.2,63.8},
{1409.9,-1274.5,33.4},
{1279.8,-1439.0,20.4},
{2234.0,-2269.3,17.8},
{2025.8,-2133.1,19.8},
{811.2,-1098.2,25.9},
{818.2,-944.2,55.2},
{1976.8,-1779.4,17.3}
};

enum pSpec
{
	Float:sPx,
	Float:sPy,
	Float:sPz,
	sPint,
	sLocal,
	sCam,
};

new Unspec[MAX_PLAYERS][pSpec];

enum eCars
{
	model_id,
	Float:pos_x,
	Float:pos_y,
	Float:pos_z,
	Float:z_angle,
	respawn_delay
};

enum pInfo
{
	pPassword[128],
	pCash,
	pAccount,
	pAdmin,
	pLevel,
	pExp,
	pDrogaUso,
	pTrDrogas,
	pPetrol,
	gPupgrade,
	pKills,
	pCB,
	pHW,
	pSR,
	pWA,
	pPEN,
	pGun1,
	pGun2,
	pGun3,
	pGun4,
	pGun5,
	pGun6,
	pAmmo1,
	pAmmo2,
	pAmmo3,
	pAmmo4,
	pAmmo5,
	pAmmo6,
	Float:pSHealth,
	Float:pHealth,
	Float:pPos_x,
	Float:pPos_y,
	Float:pPos_z,
	pInt,
	pLocal,
	pTeam,
	pModel,
	pPnumber,
	pPhousekey,
	pPbiskey,
};
new PlayerInfo[MAX_PLAYERS][pInfo];

enum plInfo
{
	plPassword[128],
	plCash,
	plAccount,
	plAdmin,
	plLevel,
	plExp,
	plDrogaUso,
	plTrDrogas,
	plPetrol,
	glPupgrade,
	plKills,
	plCB,
	plHW,
	plSR,
	plWA,
	plPEN,
	plGun1,
	plGun2,
	plGun3,
	plGun4,
	plGun5,
	plGun6,
	plAmmo1,
	plAmmo2,
	plAmmo3,
	plAmmo4,
	plAmmo5,
	plAmmo6,
	Float:plSHealth,
	Float:plHealth,
	Float:plPos_x,
	Float:plPos_y,
	Float:plPos_z,
	plInt,
	plLocal,
	plTeam,
	plModel,
	plPnumber,
	plPhousekey,
	plPbiskey,
};
new PLlayerInfo[MAX_PLAYERS][plInfo];

enum hInfo
{
	Float:hEntrancex,
	Float:hEntrancey,
	Float:hEntrancez,
	Float:hExitx,
	Float:hExity,
	Float:hExitz,
	hHealthx,
	hHealthy,
	hHealthz,
	hArmourx,
	hArmoury,
	hArmourz,
	hOwner[MAX_PLAYER_NAME],
	hDiscription[MAX_PLAYER_NAME],
	hValue,
	hHel,
	hArm,
	hInt,
	hLock,
	hOwned,
	hRooms,
	hRent,
	hRentabil,
	hTakings,
	hVec,
	hVcol1,
	hVcol2,
	hDate,
	hLevel,
};

new HouseInfo[34][hInfo];

enum bInfo
{
	Float:bEntrancex,
	Float:bEntrancey,
	Float:bEntrancez,
	Float:bExitx,
	Float:bExity,
	Float:bExitz,
	bHealthx,
	bHealthy,
	bHealthz,
	bArmourx,
	bArmoury,
	bArmourz,
	bOwner[MAX_PLAYER_NAME],
	bDiscription[64],
	bValue,
	bHel,
	bArm,
	bInt,
	bLock,
	bOwned,
	bEntcost,
	bTakings,
	bDate,
	bLevel,
	bProd,
	bProdCap,
	bComp,
	bCompCap,
	bProdCost,
	bPayComp,
	bPriceMod,
};

new BizzInfo[15][bInfo];

enum sbInfo
{
	Float:sbEntrancex,
	Float:sbEntrancey,
	Float:sbEntrancez,
	sbOwner[MAX_PLAYER_NAME],
	sbDiscription[64],
	sbValue,
	sbHel,
	sbArm,
	sbInt,
	sbLock,
	sbOwned,
	sbEntcost,
	sbTakings,
	sbDate,
	sbLevel,
	sbProd,
	sbProdCap,
	sbComp,
	sbCompCap,
	sbProdCost,
	sbPayComp,
};

new SBizzInfo[14][sbInfo];

enum pHaul
{
	pCapasity,
	pLoad,
};

new PlayerHaul[100][pHaul];

enum pCrime
{
	pBplayer[32],
	pAccusing[32],
	pAccusedof[32],
	pVictim[32],
};

new PlayerCrime[MAX_PLAYERS][pCrime];

enum pTele
{
	Float:pTmpposx,
	Float:pTmpposy,
	Float:pTmpposz,
	pTmpint,
};

new Teletmp[255][pTele];

enum rInfo
{
	Float:rStartx,
	Float:rStarty,
	Float:rStartz,
	Float:rMidx,
	Float:rMidy,
	Float:rMidz,
	Float:rMid2x,
	Float:rMid2y,
	Float:rMid2z,
	Float:rEndx,
	Float:rEndy,
	Float:rEndz,
	rName[MAX_PLAYER_NAME],
	rBest[MAX_PLAYER_NAME],
	rBestm,
	rBests,
	rBestms,
	rLaps,
};

new RaceInfo[rInfo];

new RandCars[50][1] = {
{404},{405},{410},{413},{418},
{419},{421},{422},{426},{436},
{439},{445},{458},{466},{467},
{474},{475},{479},{482},{483},
{491},{492},{496},{500},{507},
{516},{517},{518},{526},{527},
{529},{533},{540},{542},{545},
{546},{547},{549},{550},{551},
{555},{566},{579},{580},{585},
{587},{589},{600},{602},{603}
};


new RandLCars[6][1] = {
{431},// bus
{433},// barracks
{437},// coach
{443},// packer
{455},// flatbed
{578}// dft30
};


new GunPrice[35][1] = {
{50}, //parachute
{40}, //golfclub
{30}, //nightstick
{20}, //knife
{70}, //baseballbat
{30}, //shovel
{10}, //poolcue
{40}, //purpledildo
{78}, //whitedildo
{56}, //longwhitedildo
{53}, //whitedildo2
{20}, //flowers
{60}, //cane
{50}, //sdpistol
{30}, //colt45
{20}, //deagle
{20}, //Tec9
{30}, //uzi
{25}, //mp5
{25}, //shotgun
{20}, //spas12
{400}, //sawnoff
{50}, //ak47
{50}, //m4
{600}, //rifle
{1}, //pistolammo
{10}, //shotgunammo
{2}, //smgammo
{20}, //assaultammo
{50}, //rifle
{1000},//ROCKET
{200},//lanca chamas
{350}, //minigun
{32},//granada
{15}//gas
};

new Peds[276][1] = {
{264},{102},{103},{104},{105},{106},{107},
{108},{109},{110},{114},{115},{116},{121},
{122},{123},{124},{125},{126},{127},{111},
{112},{113},{117},{118},{120},{247},{248},
{100},{256},{263},{262},{261},{260},{259},
{258},{257},{256},{255},{253},{252},{251},
{250},{249},{246},{245},{244},{243},{242},
{241},{240},{239},{238},{237},{236},{235},
{234},{233},{232},{231},{230},{229},{228},
{227},{226},{225},{173},{174},{175},{224},
{223},{222},{221},{220},{219},{218},{217},
{216},{215},{214},{213},{212},{211},{210},
{209},{207},{206},{205},{204},{203},
{202},{201},{200},{199},{198},{197},{196},
{195},{194},{193},{192},{191},{190},{189},
{188},{187},{186},{185},{184},{183},{182},
{181},{180},{179},{178},{177},{176},{172},
{171},{170},{169},{168},{167},
{162},{161},{160},{159},{158},
{157},{156},{155},{154},{153},{152},{151},
{150},{148},{147},{146},{145},{144},
{143},{142},{141},{140},{139},{138},{137},
{136},{135},{134},{133},{132},{131},{130},
{129},{128},{101},{254},{99},{98},{97},
{96},{95},{94},{93},{92},{91},{90},{89},
{88},{87},{85},{84},{83},{82},{81},
{80},{79},{78},{77},{76},{75},{73},
{72},{69},{68},{67},{66},{64},{63},
{62},{61},{60},{59},{58},{57},{56},{55},
{54},{53},{52},{51},{50},{49},{48},{47},
{46},{45},{44},{43},{41},{40},{39},
{38},{37},{36},{35},{34},{33},{32},{31},
{30},{29},{28},{27},{26},{25},{24},{23},
{22},{21},{20},{19},{18},{17},{16},{15},
{14},{13},{12},{11},{10},{1},{2},{290},
{291},{292},{293},{294},{187},{296},{297},
{298},{299},{71},{70},{274},{275},{276},
{163},{164},{165},{166},{295},{246},{186},
{147},{288},{286},{285},{284},{283},{282},
{281},{280}
};

new RandLow[7][1] = {
{536}, //Blade
{575}, //Broadway
{534}, //Remington
{567}, //Savanna
{535}, //Slamvan
{576}, //Tornado
{412}  //Voodoo
};

new RandBikes[12][1] = {
//{448},//Pizza Boy
{461},//PCJ-600
{462},//Faggio
{463},//Freeway
{468},//Sanchez
{481},//BMX
{509},//Bike
{510},//Mountain Bike
{521},//FCR-900
//{522},//NRG-500
{581},//BF-400
{586},//Wayfarer
{571},//kart
{471}//quad
};

new RandAngles[5][1] = {
{562},//Elegy
//{561},//Stratum
{565},//Flash
{559},//Jester
{558},//Uranus
{560}//Sultan
};

new Float:HouseCarSpawns[34][4] = {
{-2454.84,2489.51,16.15,180.1809},//flash //trailer 0
{-2416.28,2487.92,12.78,271.1561},//elergy 1
{-2455.51,2512.75,16.23,177.5861},
{-2468.32,2488.91,17.26,0.0},//house3
{2497.6274,-2025.6306,13.2521,355.4281}, // hosue 4
{2645.0,-1990.8,13.1,180.0},//balde hr - 5
{2503.5977,-1364.4044,28.2365,357.6592},//house 6
{1910.5149,-1120.5304,25.4493,177.8350},//house7
{828.8,-887.0,68.5,230.7095},//blistac 8
{2149.6,-1610.9,14.0,90.7904},//remington 9
{760.1,-1687.8,4.3,180.6},//10
{645.5,-1616.1,14.9,0.0},//supergt 11
{1830.7705,-1404.1754,13.1338,269.9360},//house 12
{1679.2,-1462.9,13.3,270.0},//comet 13
{959.5864,-901.0845,45.8584,177.3087},//newhouse cheeta	14
{2445.8,-1326.8,23.6,18.4},
{2845.9,-1286.8,18.9,90.0},//savanna 8 house 16
{2159.8,-1803.9,13.3,271.4}, //blank 17
{2485.1,-1653.4,13.1,90.7904},//bullit 10 house 18
{977.6,-829.0,95.6,0.0},//hotring 2 house 19
{1514.0,-694.6,94.5,90.0},//bullit 10 house 20
{1246.7,-1107.6,25.5,266.4},//rancher 5 house 21
{831.7,-857.5,69.9,180.0},//bucaner//hotrod 6 house 22
{1007.9,-659.4,121.1,130.6194},//cheetah 23
{1110.0,-726.4,100.1,90.0},//zr350 //house 24
{1415.4,-18.0,1000.9,0.0},//infurnus house25
{1414.7,-26.4,1000.9,359.0},//euros //house26
{1414.3,-35.4,1000.9,0.0},//banshee //house 27
{1040.7,-1053.7,31.7,0.0},//banshee //house 19
{1146.2,-2046.5,69.0,301.3},
//{1880.2,-2022.3,13.3,180.0},//banshee //house 20 //move
{963.5,-1830.8,12.6,254.8},//banshee //house 21
{2088.6,-1140.6,25.5,90.8},//banshee //house 21
{904.5523,-1454.7026,12.9286,269.2811},
{1534.1,-841.5,65.0,93.2}//banshee //house 21
};


new CarSpawns[1][eCars] = {
	{432,-2272.35,2285.47,4.82,270.8,never}//carid 90
    };

// new Float:gJailPlayerSpawns[1][3] = {
// {264.395200,77.564040,1001.039000}
// };

//Round code stolen from mike's Manhunt :P
new gRoundTime = 360000000;                   // Round time - 1 hour
//new gRoundTime = 1200000;					// Round time - 20 mins
//new gRoundTime = 900000;					// Round time - 15 mins
//new gRoundTime = 600000;					// Round time - 10 mins
//new gRoundTime = 300000;					// Round time - 5 mins
//new gRoundTime = 120000;					// Round time - 2 mins
//new gRoundTime = 60000;					// Round time - 1 min



//------------------------------------------------------------------------------------------------------

main()
{
print(" ");
print(" ");
print(" Bayside RPG - Brasil");
print("________________________");
print("       By: Daniel Garcia");
print(" ");
}

//------------------------------------------------------------------------------------------------------

public DollahScoreUpdate()
{
	new LevScore;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
   			LevScore = PlayerInfo[i][pLevel];
			SetPlayerScore(i, LevScore);
			if (LevScore > LevScoreOld)
			{
				LevScoreOld = LevScore;
			}
		}
	}
	return 1;
}
public PrevisaoDoTempo()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	if(Tempo[i] == 1)
	{
	SendClientMessage(i,COR_AZUL, "Noticia de BS: Previsao do tempo de hoje:");
	SendClientMessage(i,COR_AZUL, "Tempo: 18º Celsius, nublado com forte rajada de vento.");
	}
	if(Tempo[i] == 2)
	{
	SendClientMessage(i,COR_AZUL, "Noticia de BS: Previsao do tempo de hoje:");
	SendClientMessage(i,COR_AZUL, "Tempo: 23º Celsius, ceu limpo com nuvens claras.");
	}
	if(Tempo[i] == 3)
 	{
	SendClientMessage(i,COR_AZUL, "Noticia de BS: Previsao do tempo de hoje:");
	SendClientMessage(i,COR_AZUL, "Tempo: 32º Celsius, sol forte dia quente.");
	}
	if(Tempo[i] == 4)
	{
	SendClientMessage(i,COR_AZUL, "Noticia de BS: Previsao do tempo de hoje:");
	SendClientMessage(i,COR_AZUL, "Tempo: 21º Celsius, ceu com nuvens escuras e chuva.");
	}
	if(Tempo[i] == 5)
	{
	SendClientMessage(i,COR_AZUL, "Noticia de BS: Previsao do tempo de hoje:");
	SendClientMessage(i,COR_AZUL, "Tempo: 23º Celsius, ceu nublado.");
	}
	if(Tempo[i] == 6)
	{
	SendClientMessage(i,COR_AZUL, "Noticia de BS: Previsao do tempo de hoje:");
	SendClientMessage(i,COR_AZUL, "Tempo: 25º Celsius, tempestade de ventos chuva forte.");
	}
	}
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row){

new Menu:Current = GetPlayerMenu(playerid);
if (Current == VMain) {

 	 switch(row) {
  	 case 0: {CreateVehicle(522,2084.01,1683.779,10.56309,60,-1,-1,10000);}
  	 case 1: {CreateVehicle(562,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 2: {CreateVehicle(451,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 3: {CreateVehicle(506,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 4: {CreateVehicle(603,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 5: {CreateVehicle(429,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 6: {CreateVehicle(560,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 7: {CreateVehicle(475,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 8: {CreateVehicle(542,2084.01,1683.779,10.56309,60,-1,-1,10000);}
     case 9: {CreateVehicle(567,2084.01,1683.779,10.56309,60,-1,-1,10000);}
  			}
      }
}

public Abastecer(playerid)
{
	for(new i=0;i<MAX_PLAYERS;i++)
 		{
 			 if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1)
  				 {
					if(PlayerInfo[i][pPetrol] >= 1)
						{
							if(JogadorNoCarro[i] == 1)
									{
										PlayerInfo[i][pPetrol]--;
									}
						}
				}
		}
}
public Abastecer2(playerid)
{
	for(new i=0;i<MAX_PLAYERS;i++)
 		{
 			 if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1)
  				 {
					if(PlayerInfo[i][pPetrol] <= 3 && PlayerInfo[i][pPetrol] >= 1)
						{
						if(JogadorNoCarro[i] == 1)
							{
    							SendClientMessage(i,COR_AZUL, "Seu combustivel esta acabando, aproveite e abasteca antes que acabe.");
							}
						}
                    if(PlayerInfo[i][pPetrol] == 0)
						{
						if(JogadorNoCarro[i] == 1)
							{
    							SendClientMessage(i,COR_AZUL, "Voce nao tem combustivel, proucure o posto e abasteca.");
							}
						}
				}
		}
}
public SemComb(playerid)
{
	for(new i=0;i<MAX_PLAYERS;i++)
 	{
 			 if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1)
  				 {
					if(JogadorNoCarro[i] == 1)
						{
							if(PlayerInfo[i][pPetrol] == 0)
								{
									TogglePlayerControllable(i, 0);
									GameTextForPlayer(i, "~w~Sem~n~~r~Combustivel", 5000, 1);
    								Congelado[i] = 1;
								}
						}
				}
	}
}
public Bugando(playerid)
{
	for(new i=0;i<MAX_PLAYERS;i++)
 		{
		 if(IsPlayerConnected(i) == 1)
  				 {
  				 if(Buginstalado[i] == 1)
					{
					new hackeado = MAX_PLAYERS*10;
					new string[256];
					new sendername[MAX_PLAYER_NAME];
					PlayerInfo[i][pAccount] = PlayerInfo[i][pAccount] + hackeado;
					PlayerInfo[i][pAccount] = PlayerInfo[i][pAccount] + 10;
					format(string, sizeof(string), "Voce conseguiu retirar $10 de cada conta bancaria, total $%d",hackeado);
					SendClientMessage(i, COLOR_GREEN, string);
					GetPlayerName(i, sendername, sizeof(sendername));
					format(string, sizeof(string), "Noticia de BS: %s roubou $10 da conta de todos e esta sendo proucurado pela policia",sendername);
					SendClientMessageToAll(COLOR_RED, string);
					Buginstalado[i] = 0;
					Hacker[i] = 0;
					HackerSpawn(i);
					ContaHackeada();
					return 0;
			 	   }
				}
		}
	return 0;
}
public HackerSpawn(playerid)
{
Spectate[playerid] = 260;
}
public ContaHackeada()
{
	for(new i=0;i<MAX_PLAYERS;i++)
		{
		PlayerInfo[i][pAccount] = PlayerInfo[i][pAccount] - 10;
		return 0;
		}
	return 0;
}
public Posto()
{
	new Float:x, Float:y, Float:z;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, x, y, z);
			if(x<=-2514.04 && x>=-2550.04 && y<=2370.05 && y>=2352.65 && z <=10.0 && z>=3.0)
				{
				GameTextForPlayer(i, "~b~Posto de~n~~w~Bayside", 5000, 1);
  				AreaPosto[i] = 1;
				}
			else
			{
			AreaPosto[i] = 0;
			}
		}
	}
}

public Profissoes(playerid)
{
	if(EscolhendoClasse[playerid] == 1)
	    {
	    if(gTeam[playerid] == 1)
	    {
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "---------- Paramedico (SAMU)----------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Salvar vidas");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Comissao de salvamento");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "--------------------------------------");
		}
		if(gTeam[playerid] == 3)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "--------- Desempregado ------------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Parar de ser vagabundo");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Que salario?");
		SendClientMessage(playerid, COLOR_WHITE, "Arrume um emprego na agencia de trabalho");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "---------------------------------------");
		}
		if(gTeam[playerid] == 5)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "---------- Traficante -------------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Vender drogas");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Drogas que vender");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "---------------------------------------");
		}
		if(gTeam[playerid] == 6)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "---------- Ladrao de Carro ----------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Roubar carros");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Carros roubados");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 7)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "---------- Ladrao de banco ----------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Roubar bancos");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: So recebe roubando");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 8)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "---------- Assasino ----------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Matar por dinheiro");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Recebe quando matar");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 9)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Crime Organizado -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Falsificar documentos");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Quando vender os documentos");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 11)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Hackers -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Roubar contas de banco");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Quando hackear as contas");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 12)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Pirataria -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Importar produtos falsificados");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Quando importar");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 13)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Narcotrafico -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Importar drogas para traficantes");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Quando importar");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 14)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Traficante de Armas -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Vender armas ilegais");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Quando vender");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 15)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Pescador -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Pescar");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Quando vender");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 16)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Acompanhante -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Satisfazer o seu parceiro");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Depois de ...");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 17)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Cacador -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Cacar animais e nao ser preso");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Apos importar o animal");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 18)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Motorista -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Dirigir com cuidado");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Ao retornar ao ponto de origem");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 19)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Taxista -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Levar o passageiro ate seu destino");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Ao chegar no destino");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 20)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Fiscal -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Confiscar acoes ilegais");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Ao confiscar itens");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 21)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Lixeiro -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Limpar a cidade");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Ao limpar tudo");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 22)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Motoboy -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Fazer entregas");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Ao completar entregas");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		if(gTeam[playerid] == 23)
		{
		SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
	    SendClientMessage(playerid, COLOR_GRAD1, " ");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "------- Caminhoneiro -------");
		SendClientMessage(playerid, COLOR_WHITE, "Objetivo: Fazer entregas");
		SendClientMessage(playerid, COLOR_WHITE, "Salario: Ao completar entregas");
		SendClientMessage(playerid, COLOR_WHITE, "Digite /prof para mais informacoes");
		SendClientMessage(playerid, TEAM_ORANGE_COLOR, "-------------------------------------");
		}
		return 1;
	}
	return 1;
}
	
public GameTicks()
{
	Gtickcount = Gtickcount+500;
}

public ConvertTicks(ticks)
{
	csecs = 0;
	cmils = 0;
	cmins = 0;
	new tempcsecs = ticks / 1000;//61.59
	cmins = ticks / 60000;//1.0265
	csecs = (ticks - cmins*60000)/1000;
	cmils = (ticks - tempcsecs*1000)/10;
}


public CopScanner()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i) && gTeam[i] >= 2 && gPublicEnemy != i && gSuperCop != i && Hidden[i] !=1)
		{
			if(gTeam[i] == 4)
			{
				CrimProxDetector(radardist, i,TEAM_ORANGE1_COLOR,TEAM_ORANGE2_COLOR,TEAM_ORANGE3_COLOR,TEAM_ORANGE4_COLOR,TEAM_ORANGE5_COLOR,TEAM_ORANGE6_COLOR,TEAM_ORANGE7_COLOR,TEAM_ORANGE8_COLOR,TEAM_ORANGE9_COLOR,TEAM_ORANGE10_COLOR);
			}
			if(gTeam[i] == 5)
			{
				CrimProxDetector(radardist, i,TEAM_BALLAS1_COLOR,TEAM_BALLAS2_COLOR,TEAM_BALLAS3_COLOR,TEAM_BALLAS4_COLOR,TEAM_BALLAS5_COLOR,TEAM_BALLAS6_COLOR,TEAM_BALLAS7_COLOR,TEAM_BALLAS8_COLOR,TEAM_BALLAS9_COLOR,TEAM_BALLAS10_COLOR);
			}
			if(gTeam[i] == 6)
			{
				CrimProxDetector(radardist, i,TEAM_GROVE1_COLOR,TEAM_GROVE2_COLOR,TEAM_GROVE3_COLOR,TEAM_GROVE4_COLOR,TEAM_GROVE5_COLOR,TEAM_GROVE6_COLOR,TEAM_GROVE7_COLOR,TEAM_GROVE8_COLOR,TEAM_GROVE9_COLOR,TEAM_GROVE10_COLOR);
			}
			if(gTeam[i] == 7)
			{
				CrimProxDetector(radardist, i,TEAM_VAGOS1_COLOR,TEAM_VAGOS2_COLOR,TEAM_VAGOS3_COLOR,TEAM_VAGOS4_COLOR,TEAM_VAGOS5_COLOR,TEAM_VAGOS6_COLOR,TEAM_VAGOS7_COLOR,TEAM_VAGOS8_COLOR,TEAM_VAGOS9_COLOR,TEAM_VAGOS10_COLOR);
			}
			if(gTeam[i] == 8)
			{
				CrimProxDetector(radardist, i,TEAM_AZTECAS1_COLOR,TEAM_AZTECAS2_COLOR,TEAM_AZTECAS3_COLOR,TEAM_AZTECAS4_COLOR,TEAM_AZTECAS5_COLOR,TEAM_AZTECAS6_COLOR,TEAM_AZTECAS7_COLOR,TEAM_AZTECAS8_COLOR,TEAM_AZTECAS9_COLOR,TEAM_AZTECAS10_COLOR);
			}
			if(gTeam[i] == 9)
			{
				CrimProxDetector(radardist, i,TEAM_NANG1_COLOR,TEAM_NANG2_COLOR,TEAM_NANG3_COLOR,TEAM_NANG4_COLOR,TEAM_NANG5_COLOR,TEAM_NANG6_COLOR,TEAM_NANG7_COLOR,TEAM_NANG8_COLOR,TEAM_NANG9_COLOR,TEAM_NANG10_COLOR);
			}
			if(gTeam[i] == 78)
			{
				CrimProxDetector(radardist, i,TEAM_RIFA1_COLOR,TEAM_RIFA2_COLOR,TEAM_RIFA3_COLOR,TEAM_RIFA4_COLOR,TEAM_RIFA5_COLOR,TEAM_RIFA6_COLOR,TEAM_RIFA7_COLOR,TEAM_RIFA8_COLOR,TEAM_RIFA9_COLOR,TEAM_RIFA10_COLOR);
			}
			if(gTeam[i] == 11)
			{
				CrimProxDetector(radardist, i,TEAM_MAFIA1_COLOR,TEAM_MAFIA2_COLOR,TEAM_MAFIA3_COLOR,TEAM_MAFIA4_COLOR,TEAM_MAFIA5_COLOR,TEAM_MAFIA6_COLOR,TEAM_MAFIA7_COLOR,TEAM_MAFIA8_COLOR,TEAM_MAFIA9_COLOR,TEAM_MAFIA10_COLOR);
			}
			if(gTeam[i] == 12)
			{
				CrimProxDetector(radardist, i,TEAM_RMAFIA1_COLOR,TEAM_RMAFIA2_COLOR,TEAM_RMAFIA3_COLOR,TEAM_RMAFIA4_COLOR,TEAM_RMAFIA5_COLOR,TEAM_RMAFIA6_COLOR,TEAM_RMAFIA7_COLOR,TEAM_RMAFIA8_COLOR,TEAM_RMAFIA9_COLOR,TEAM_RMAFIA10_COLOR);
			}
			if(gTeam[i] == 13)
			{
				CrimProxDetector(radardist, i,TEAM_TRIADS1_COLOR,TEAM_TRIADS2_COLOR,TEAM_TRIADS3_COLOR,TEAM_TRIADS4_COLOR,TEAM_TRIADS5_COLOR,TEAM_TRIADS6_COLOR,TEAM_TRIADS7_COLOR,TEAM_TRIADS8_COLOR,TEAM_TRIADS9_COLOR,TEAM_TRIADS10_COLOR);
			}
			if(gTeam[i] == 14)
			{
				CrimProxDetector(radardist, i,TEAM_BIKERS1_COLOR,TEAM_BIKERS2_COLOR,TEAM_BIKERS3_COLOR,TEAM_BIKERS4_COLOR,TEAM_BIKERS5_COLOR,TEAM_BIKERS6_COLOR,TEAM_BIKERS7_COLOR,TEAM_BIKERS8_COLOR,TEAM_BIKERS9_COLOR,TEAM_BIKERS10_COLOR);
			}
		}
	}
}

public Spectator()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(TVMode[i] >= 1 && TVMode[i] <= 5)
			{
				Unspec[i][sCam] = 2;
				TVMode[i]++;
				BestPlayer(i);
			}
			if(TVMode[i] >= 6 && TVMode[i] <= 9)
			{
				Unspec[i][sCam] = 3;
				TVMode[i]++;
				BestPlayer(i);
			}
			if(TVMode[i] == 10)
			{
				TVMode[i] = 1;
				BestPlayer(i);
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 11 && TVMode[i] <= 15)
			{
				DMPlayer(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 16 && TVMode[i] <= 19)
			{
				DMPlayer(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 20)
			{
				DMPlayer(i);
				TVMode[i] = 11;
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 21 && TVMode[i] <= 25)
			{
				RaceSpec(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 26 && TVMode[i] <= 29)
			{
				RaceSpec(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 30)
			{
				RaceSpec(i);
				TVMode[i] = 21;
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 31 && TVMode[i] <= 35)
			{
				PenDelay(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 36 && TVMode[i] <= 39)
			{
				PenDelay(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 40)
			{
				PenDelay(i);
				TVMode[i] = 31;
				Unspec[i][sCam] = random(4);
			}
			if(TVMode[i] >= 41 && TVMode[i] <= 45)
			{
				SpeedDelay(i);
				Unspec[i][sCam] = 2;
				TVMode[i]++;
			}
			if(TVMode[i] >= 46 && TVMode[i] <= 49)
			{
				SpeedDelay(i);
				Unspec[i][sCam] = 3;
				TVMode[i]++;
			}
			if(TVMode[i] == 50)
			{
				SpeedDelay(i);
				TVMode[i] = 41;
				Unspec[i][sCam] = random(4);
			}
			if(Spectate[i] < 253 && Spectate[i] != 255)
			{
				SetPlayerColor(i,COLOR_SPEC);
				TogglePlayerControllable(i, 0);
				new hight;
				new targetid = Spectate[i];
				new Float:px, Float:py, Float:pz, Float:pa;
				if(specflick == 1)
				{
					GetPlayerPos(targetid, CarTracking[i][0], CarTracking[i][1], CarTracking[i][2]);
				}
				px = CarTracking[i][0];py = CarTracking[i][1];pz = CarTracking[i][2];
				if(PlayerInfo[targetid][pInt] == 0)
				{
					SetPlayerInterior(i,0);
				}
				if(PlayerInfo[targetid][pInt] > 0)
				{
					SetPlayerInterior(i,PlayerInfo[targetid][pInt]);
				}
				if(pz > 530.0 && PlayerInfo[targetid][pInt] == 0) //the highest land point in sa = 526.8
				{
					SetPlayerInterior(i,1);
				}
				if(Unspec[i][sCam] <= 1 &&  Unspec[i][sCam] != 10)
				{
					if(GetPlayerState(targetid) != 1)
					{
						SetPlayerCameraPos(i,px,py,pz+40);
					}
					else
					{
						SetPlayerCameraPos(i,px,py,pz+10);
					}
					SetPlayerPos(i, px, py, pz+110);
				}
				else if(Unspec[i][sCam] >= 2 && Unspec[i][sCam] <= 3)
				{
					new dist;
					if(Unspec[i][sCam] == 2)
					{
						if(GetPlayerState(targetid) != 1)
						{
							dist = 6;
							hight = 2;
						}
						else
						{
							dist = 6;
							hight = 1;
						}
					}
					if(Unspec[i][sCam] == 3)
					{
						if(GetPlayerState(targetid) != 1)
						{
							dist = -50;
							hight = 4;
						}
						else
						{
							dist = -10;
							hight = 2;
						}
					}
					if(GetPlayerState(targetid) != 1)
					{
						if(specflick == 2)
						{
							new Float:px2, Float:py2, Float:pz2, Float:tpx,Float:tpy;
							GetPlayerPos(targetid, px2, py2, pz2);
							if(py2 > py && px2 > px)
							{
								tpx = px2-px;
								tpy = py2-py;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 0.0;
									}
									else
									{
										CarTracking[i][3] = 315.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 270.0;
									}
									else
									{
										CarTracking[i][3] = 315.0;
									}
								}
							}
							if(py2 < py && px2 > px)
							{
								tpx = px2-px;
								tpy = py-py2;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 180.0;
									}
									else
									{
										CarTracking[i][3] = 225.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 270.0;
									}
									else
									{
										CarTracking[i][3] = 225.0;
									}
								}
							}
							if(py2 < py && px2 < px)
							{
								tpx = px-px2;
								tpy = py-py2;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 180.0;
									}
									else
									{
										CarTracking[i][3] = 135.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 90.0;
									}
									else
									{
										CarTracking[i][3] = 135.0;
									}
								}
							}
							if(py2 > py && px2 < px)
							{
								tpx = px-px2;
								tpy = py2-py;
								if(tpy > tpx)
								{
									if(tpy-tpx > 10.0)
									{
										CarTracking[i][3] = 0.0;
									}
									else
									{
										CarTracking[i][3] = 45.0;
									}
								}
								if(tpy < tpx)
								{
									if(tpx-tpy > 10.0)
									{
										CarTracking[i][3] = 90.0;
									}
									else
									{
										CarTracking[i][3] = 45.0;
									}
								}
							}
							specflick = 0;
						}
						pa = CarTracking[i][3];
						//	new formated[256];
						//	format(formated, sizeof(formated), "Debug:CarAngle (%f)",CarTracking[i][3]);
						//	SendClientMessageToAll(COLOR_WHITE, formated);
					}
					else
					{
						GetPlayerFacingAngle(targetid,pa);
					}
					if(pa >= 0.0 && pa <= 22.5) //n1
					{
						SetPlayerCameraPos(i, px, py-(dist), pz+hight);
					}
					if(pa >= 332.5 && pa < 0.0) //n2
					{
						SetPlayerCameraPos(i, px, py-(dist), pz+hight);
					}
					if(pa >= 22.5 && pa <= 67.5) //nw
					{
						SetPlayerCameraPos(i, px+(dist/2), py-(dist/2), pz+hight);
					}
					if(pa >= 67.5 && pa <= 112.5) //w
					{
						SetPlayerCameraPos(i, px+(dist), py, pz+hight);
					}
					if(pa >= 112.5 && pa <= 157.5) //sw
					{
						SetPlayerCameraPos(i, px+(dist/2), py+(dist/2), pz+hight);
					}
					if(pa >= 157.5 && pa <= 202.5) //s
					{
						SetPlayerCameraPos(i, px, py+(dist), pz+hight);
					}
					if(pa >= 202.5 && pa <= 247.5)//se
					{
						SetPlayerCameraPos(i, px-(dist/2), py+(dist/2), pz+hight);
					}
					if(pa >= 247.5 && pa <= 292.5)//e
					{
						SetPlayerCameraPos(i, px-(dist), py, pz+hight);
					}
					if(pa >= 292.5 && pa <= 332.5)//e
					{
						SetPlayerCameraPos(i, px-(dist/2), py-(dist/2), pz+hight);
					}
					SetPlayerPos(i, px, py, pz+110);
				}
				else if(Unspec[i][sCam] == 5)
				{
					SetPlayerPos(i, px, py, pz+40);
				}
				else if(Unspec[i][sCam] == 6)
				{
					SetPlayerPos(i, rsx, rsy, rsz+100);
					SetPlayerCameraPos(i, rsx, rsy+4, rsz+2);
				}
				else if(Unspec[i][sCam] == 7)
				{
					SetPlayerPos(i, rmx, rmy, rmz+100);
					SetPlayerCameraPos(i, rmx, rmy+4, rmz+2);
				}
				else if(Unspec[i][sCam] == 8)
				{
					SetPlayerPos(i, rm2x, rm2y, rm2z+100);
					SetPlayerCameraPos(i, rm2x, rm2y+4, rm2z+2);
				}
				else if(Unspec[i][sCam] == 9)
				{
					SetPlayerPos(i, rex, rey, rez+100);
					SetPlayerCameraPos(i, rex, rey+4, rez+2);
				}
				else if(Unspec[i][sCam] == 10)
				{
					new house = Unspec[i][sLocal];
					SetPlayerPos(i,HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]+100);
					SetPlayerCameraPos(i, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]+2.0);
					SetPlayerInterior(i,0);
				}
				SetPlayerCameraLookAt(i,px,py,pz);
			}
			if(Spectate[i] == 253)
			{
				TogglePlayerControllable(i, 1);
				SetPlayerInterior(i,Unspec[i][sPint]);
				PlayerInfo[i][pInt] = Unspec[i][sPint];
				PlayerInfo[i][pLocal] = Unspec[i][sLocal];
				Unspec[i][sLocal] = 255;
				SetSpawnInfo(i, 1, PlayerInfo[i][pModel], Unspec[i][sPx],  Unspec[i][sPy], Unspec[i][sPz]-1.0, 1.0, -1, -1, -1, -1, -1, -1);
				//SetPlayerPos(i, Unspec[i][sPx], Unspec[i][sPy], Unspec[i][sPz]);
				gTeam[i] = PlayerInfo[i][pTeam];
				SetPlayerToTeamColor(i);
				SpawnPlayer(i);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 254)
			{
				TogglePlayerControllable(i, 1);
				SetPlayerInterior(i,Unspec[i][sPint]);
				PlayerInfo[i][pInt] = Unspec[i][sPint];
				PlayerInfo[i][pLocal] = Unspec[i][sLocal];
				SetPlayerPos(i, Unspec[i][sPx],  Unspec[i][sPy], Unspec[i][sPz]);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 256)
			{
				SetPlayerToTeamColor(i);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 257)
			{
				Spectate[i] = 254;
			}
			if(Spectate[i] == 260)
			{
				TogglePlayerControllable(i, 1);
				SetPlayerInterior(i,0);
				PlayerInfo[i][pInt] = 0;
				Unspec[i][sLocal] = 255;
				SetSpawnInfo(i, 1, PlayerInfo[i][pModel], -329.8,1536.7,77.6-1.0, 1.0, -1, -1, -1, -1, -1, -1);
				//SetPlayerPos(i, Unspec[i][sPx], Unspec[i][sPy], Unspec[i][sPz]);
				gTeam[i] = PlayerInfo[i][pTeam];
				SetPlayerToTeamColor(i);
				SpawnPlayer(i);
				Spectate[i] = 255;
			}
		}
	}
	if(specflick < 2)
	{
		specflick++;
	}
	else
	{
		specflick = 0;
	}
}

//------------------------------------------------------------------------------------------------------

public IsAPlane(carid)
{
	if((carid >= 0 && carid <=1))
	{
		return 1;
	}
	return 0;
}
public CaLixo(carid)
{
 if(carid == 408)
	{
		return 1;
	}
	return 0;
}

public IsACopCar(carid)
{
	if((carid >= 1) && (carid <= 255))
	{
		return 1;
	}
	return 0;
}


public IsAnAmbulance(carid)
{
	if((carid >= 61) && (carid <= 63))
	{
		return 1;
	}
	return 0;
}

public IsATruck(carid)
{
	if(carid >= 78 && carid <= 81)
	{
		return 1;
	}
	return 0;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerConnect(playerid)
{
if (gdebug >= 1){printf("DEBUG OnPlayerConnect(%d)", playerid);}
	new bitch[256];
	GetPlayerName(playerid,bitch,sizeof(bitch));
	format(bitch,sizeof(bitch),"> %s entrou no server <",bitch);
    SendClientMessageToAll(COLOR_GRAD1,bitch);
	gActivePlayers[playerid]++;
	numplayers++;
	new plname[MAX_PLAYER_NAME];
	new string[MAX_PLAYER_NAME];
	//TelePos[playerid][0] = 0;
	//TelePos[playerid][1] = 0;
	//TelePos[playerid][2] = 0;
	SafeTime[playerid] = 300;
	BetRace[playerid][0] = 255;
	BetRace[playerid][1] = 0;
	BetDm[playerid][0] = 255;
	BetDm[playerid][1] = 0;
	//HidePM[playerid] = 0;
	gPlayerFighter[playerid] = 0;
	DmScore[playerid] = 0;
	Mobile[playerid] = 255;
	Spectate[playerid] = 255;
	Unspec[playerid][sLocal] = 255;
    gSkyDive[playerid] = 0;
	TVMode[playerid] = 0;
    gLastCar[playerid] = 0;
    FirstSpawn[playerid] = 0;
	gPlayerLapStatus[playerid] = 0;
	gOoc[playerid] = 0;
	BigEar[playerid] = 0;
	FlashTime[playerid] = 0;
	gDice[playerid] = 0;
	gSpeedo[playerid] = 0;
	gDrogas[playerid] = 0;
	ComandosDesativados[playerid] = 0;
	ComandosDesativados2[playerid] = 0;
	Congelado[playerid] = 0;
	QuerDrogas[playerid] = 0;
	JogadorNoCarro[playerid] = 0;
	missao1[playerid] = 0;
	missao2[playerid] = 0;
	missao3[playerid] = 0;
	RouboBanco[playerid] = 0;
	ComandosDesativados2[playerid] = 1;
	TrArmas[playerid] = 0;
	RouboCarro[playerid] = 0;
	Buginstalado[playerid] = 0;
	Hacker[playerid] = 0;
	Lixeiro[playerid] = 0;
 	EscolhendoClasse[playerid] = 0;
	missaocancelada[playerid] = 0;
	SetPlayerWeather(playerid,10);
	Tempo[playerid] = 2;
	gPlayerLogged[playerid] = 0;
	gPlayerAccount[playerid] = 0;
	gPlayerSpawned[playerid] = 0;
	Pronto[playerid] = 0;
	LapCount[playerid] = 0;
	Mute[playerid] = 0;
	StartTime[playerid] = 0;
	gRaceGuy[playerid] = 0;
	Contract[playerid] = 0;
	AreaPosto[playerid] = 0;
	gPlayerMission[playerid] = 0;
	PlayerInfo[playerid][pCash] = dollah;
	KickVote[playerid] = 0;
	VoteKick[playerid] = 0;
	LastVote[playerid] = 255;
	HireCar[playerid] = 299;
	Hidden[playerid] = 1;
	Locator[playerid] = 0;
	PLicence[playerid] = 0;
	gPhoneBook[playerid] = 0;
	GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);
	PlayerInfo[playerid][pAccount] = 0;
	PlayerInfo[playerid][pAdmin] = 0;
	PlayerInfo[playerid][pLevel] = 1;
	PlayerInfo[playerid][pExp] = 0;
	PlayerInfo[playerid][pDrogaUso] = 0;
	PlayerInfo[playerid][pTrDrogas] = 0;
	PlayerInfo[playerid][pPetrol] = 0;
	PlayerInfo[playerid][gPupgrade] = 0;
	PlayerInfo[playerid][pKills] = 0;
	PlayerInfo[playerid][pCB] = 0;
	PlayerInfo[playerid][pHW] = 0;
	PlayerInfo[playerid][pSR] = 0;
	PlayerInfo[playerid][pWA] = 0;
	PlayerInfo[playerid][pPEN] = 0;
	PlayerInfo[playerid][pGun1] = 0;
	PlayerInfo[playerid][pGun2] = 0;
	PlayerInfo[playerid][pGun3] = 0;
	PlayerInfo[playerid][pGun4] = 0;
	PlayerInfo[playerid][pGun5] = 0;
	PlayerInfo[playerid][pGun6] = 0;
	PlayerInfo[playerid][pAmmo1] = 200;
	PlayerInfo[playerid][pAmmo2] = 8;
	PlayerInfo[playerid][pAmmo3] = 30;
	PlayerInfo[playerid][pAmmo4] = 30;
	PlayerInfo[playerid][pAmmo5] = 10;
	PlayerInfo[playerid][pAmmo6] = 10;
	//LOJAS
	SetPlayerMapIcon(playerid, 1, -2485.459960,2288.560058,4.980000, 6, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 2, -2485.459960,2271.629882,4.980000, 17, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 3, -2493.909912,2271.830078,4.949995, 47, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 4, -2491.239990,2363.020019,10.27000, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 5, -2478.610107,2318.320068,4.980000, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 6, -2244.899902,2382.070068,5.070000, 52, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 7, -2511.100097,2276.679931,4.980000, 50, 0xE6E6E6E6);
	//CASAS
	SetPlayerMapIcon(playerid, 8, -2446.139892,2492.250000,15.319993, 31, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 9, -2422.110107,2492.560058,13.140000, 31, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 10, -2446.530029,2512.310058,15.699995, 31, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 11, -2464.310058,2485.840087,16.809999, 31, 0xE6E6E6E6);
	SetPlayerMapIcon(playerid, 12, -2464.310058,2485.840087,16.809999, 31, 0xE6E6E6E6);
	PlayerInfo[playerid][pSHealth] = 0.0;
	PlayerInfo[playerid][pHealth] = 50.0;
	PlayerInfo[playerid][pPos_x] = 2246.6;
	PlayerInfo[playerid][pPos_y] = -1161.9;
	PlayerInfo[playerid][pPos_z] = 1029.7;
	PlayerInfo[playerid][pInt] = 15;
	PlayerInfo[playerid][pLocal] = 255;
	PlayerInfo[playerid][pTeam] = 1;
	PlayerInfo[playerid][pModel] = 264;
	new randphone = 1000 + random(8999);//minimum 1000  max 9999 //giving one at the start
	PlayerInfo[playerid][pPnumber] = randphone;
	PlayerInfo[playerid][pPhousekey] = 255;
	PlayerInfo[playerid][pPbiskey] = 255;
	ClearCrime(playerid);
	printf("Jogador conectado: (%d)", playerid);
	SetPlayerColor(playerid,COLOR_GRAD2);
	GetPlayerName(playerid, plname, sizeof(plname));
	//SetPlayerCameraPos(playerid,1460.0, -1324.0, 287.2);
	//SetPlayerCameraLookAt(playerid,1374.5, -1291.1, 239.0);
	format(string, sizeof(string), "%s.cer", plname);
	if(fexist(string))
	{
		gPlayerAccount[playerid] = 1;
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Nome registrado, voce tem 60 segundos para logar.");
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: Nome registrado - /login <senha>. Voce tem 60 segundos para entrar.");
		return 1;
	}
	else
	{
		gPlayerAccount[playerid] = 0;
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Coloque /registrar <senha> para criar uma conta ou /ajuda");
		//return 1;
	}
	return 1;
}

public ClearCrime(playerid)
{
if (gdebug >= 1){printf("DEBUG ClearCrime(%d)", playerid);}
	new string[MAX_PLAYER_NAME];
	format(string, sizeof(string), "********");
	strmid(PlayerCrime[playerid][pBplayer], string, 0, strlen(string), 255);
	strmid(PlayerCrime[playerid][pVictim], string, 0, strlen(string), 255);
	strmid(PlayerCrime[playerid][pAccusing], string, 0, strlen(string), 255);
	strmid(PlayerCrime[playerid][pAccusedof], string, 0, strlen(string), 255);
	return 1;
}

public BetWinner(playerid,contest)
{
	new winname[MAX_PLAYER_NAME];
	new better[MAX_PLAYER_NAME];
	new string[256];
	GetPlayerName(playerid, winname, sizeof(winname));
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(contest == 1)
			{
				if(BetRace[i][0] == playerid)
				{
					GivePlayerMoney(i,BetRace[i][1]*2);
					BizzInfo[5][bTakings] -= (BetRace[i][1]*2);
					format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
					SendClientMessage(i, TEAM_VAGOS_COLOR,string);
					format(string, sizeof(string), "   You have won $%d on %s in a streetrace", BetRace[i][1]*2, winname);
					SendClientMessage(i, COLOR_WHITE, string);
					SendClientMessage(i, TEAM_VAGOS_COLOR,"_______________________________________");
					PlayerPlaySound(i, 1052, 0.0, 0.0, 0.0);
					GetPlayerName(i, better, sizeof(better));
					format(string, sizeof(string), "%s won $%d on %s", better, BetRace[i][1]*2, winname);
					printf("%s", string);
					PayLog(string);
				}
				BetRace[i][0] = 255;
				BetRace[i][1] = 0;
			}
			if(contest == 2)
			{
				if(BetDm[i][0] == playerid)
				{
					GivePlayerMoney(i,BetDm[i][1]*2);
					BizzInfo[5][bTakings] -= (BetDm[i][1]*2);
					format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
					SendClientMessage(i, TEAM_VAGOS_COLOR,string);
					format(string, sizeof(string), "   You have won $%d on %s in a deathmatch", BetDm[i][1]*2, winname);
					SendClientMessage(i, COLOR_WHITE, string);
					SendClientMessage(i, TEAM_VAGOS_COLOR,"_______________________________________");
					PlayerPlaySound(i, 1052, 0.0, 0.0, 0.0);
					GetPlayerName(i, better, sizeof(better));
					format(string, sizeof(string), "%s won $%d on %s", better, BetDm[i][1]*2, winname);
					printf("%s", string);
					PayLog(string);
				}
				BetDm[i][0] = 255;
				BetDm[i][1] = 0;
			}
		}
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnPlayerDisconnect(playerid,reason)
{
//if (gdebug >= 1){printf("DEBUG OnPlayerDisconnect(%d)", playerid);}
	printf("DEBUG OnPlayerDisconnect(%d)1", playerid);
	new bitch[256];
	GetPlayerName(playerid,bitch,sizeof(bitch));
	format(bitch,sizeof(bitch),"> %s saiu do servidor <",bitch);
    SendClientMessageToAll(COLOR_GRAD1,bitch);
	gActivePlayers[playerid]--;
	numplayers--;
	if (DmHiPlayer == playerid)
	{
		DmHiPlayer = INVALID_PLAYER_ID;
		new tmp1;
		new tmp2;
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(DmScore[i] > tmp1 && IsPlayerConnected(i) == 1)
			{
				DmScore[i] = tmp1;
				i = tmp2;
			}
		}
		if(DmHiPlayer != 255)
		{
			DmHiPlayer = tmp2;
			new dmname[MAX_PLAYER_NAME];
			new string[256];
			GetPlayerName(DmHiPlayer, dmname, sizeof(dmname));
			DmHiScore = DmScore[DmHiPlayer];
			format(string, sizeof(string), "DMNEWS: %s Is now in the lead with %d ", dmname,DmHiScore);
			BroadCast(COLOR_WHITE, string);
		}
	}
	if (gPublicEnemy == playerid)
	{
		gPublicEnemy = INVALID_PLAYER_ID;
		GivePlayerMoney(playerid, -reward);
		KillTimer(offhook);
	}
	OnPlayerUpdate(playerid);
	printf("DEBUG OnPlayerDisconnect(%d)2", playerid);
	printf("DEBUG OnPlayerDisconnect(%d)3", playerid);
	if(HireCar[playerid] != 299)
	{
		gLastDriver[HireCar[playerid]] = 300;
		gCarLock[HireCar[playerid]] = 0;
		UnLockCar(HireCar[playerid]);
	}
	if (gLastCar[playerid] > 0)
	{
		gLastDriver[gLastCar[playerid]] = 300;
		if(PlayerInfo[playerid][pPhousekey] != gLastCar[playerid]-1)
		{
			gCarLock[gLastCar[playerid]] = 0;
			UnLockCar(gLastCar[playerid]);
		}
	}
	printf("DEBUG OnPlayerDisconnect(%d)4", playerid);
	if (gPlayerCheckpointStatus[playerid] == CHECKPOINT_DROPOFF)
	{
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		MissionActive = 0;
		if (gdebug){print("DEBUG MissionActive = 0;");}
	}
	if (gSuperCop == playerid)
	{
		gSuperCop = INVALID_PLAYER_ID;
	}
}

public SetPlayerRandomSpawn(playerid)
{
	new rand;
	new playername[32];
	new house = PlayerInfo[playerid][pPhousekey];
	GetPlayerName(playerid, playername, sizeof(playername));
	if(gPlayerFighter[playerid] == 1)
    {
		new string[256];
		gTeam[playerid] = 4;
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gRandomDMSpawns)-2)+1;
		SetPlayerPos(playerid, gRandomDMSpawns[rand][0], gRandomDMSpawns[rand][1], gRandomDMSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][pInt] = 0;
		format(string, sizeof(string), "  ~r~%d~w~|~g~%d",DmScore[playerid],DmHiScore);
		GameTextForPlayer(playerid, string, 5000, 6);
		if(gFightLeader < 1000)
		{
			TogglePlayerControllable(playerid, 0);
		}
		if (gdebug >=0){printf("DEBUG SPAWNED: Playerid:%d Team:%d DMPoint:%d", playerid, gTeam[playerid], rand);}
		return 1;
	}
	if(house !=255)
	{
		/*
		if(gTeam[playerid] <= 2 && strcmp(playername, HouseInfo[house][hOwner], true) == 0 || gTeam[playerid] > 2)
		{
			*/
			SetPlayerToTeamColor(playerid);
			SetPlayerInterior(playerid,HouseInfo[house][hInt]);
			SetPlayerPos(playerid, HouseInfo[house][hExitx], HouseInfo[house][hExity],HouseInfo[house][hExitz]); // Warp the player
			PlayerInfo[playerid][pLocal] = house;
			PlayerInfo[playerid][pInt] = HouseInfo[house][hInt];
			if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
			return 1;
		//}

	}
	if ((gTeam[playerid]) == 2)
	{
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gCopPlayerSpawns));
		SetPlayerPos(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]); // Warp the player
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][pInt] = 0;
		if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
		return 1;
    }
    if ((gTeam[playerid]) == 1)
    {
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gMedPlayerSpawns));
		SetPlayerPos(playerid, gMedPlayerSpawns[rand][0], gMedPlayerSpawns[rand][1], gMedPlayerSpawns[rand][2]); // Warp the player
		GivePlayerWeapon(playerid, 46, 0);
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerInterior(playerid,0);
		PlayerInfo[playerid][pInt] = 0;
		if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
		return 1;
	}
    else
    {
		SetPlayerToTeamColor(playerid);
		rand = random(sizeof(gRandomPlayerSpawns));
		SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
		GivePlayerWeapon(playerid, 46, 0);
		SetPlayerFacingAngle(playerid, 360.0);
		SetPlayerCheckpoint(playerid,3.82,23.02,1199.60,1.5);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_INIPOS;
		SetPlayerInterior(playerid,1);
		PlayerInfo[playerid][pInt] = 0;
		if (gdebug >=1){printf("DEBUG SPAWNED: Playerid:%d Team:%d SpawnPoint:%d", playerid, gTeam[playerid], rand);}
		//return 1;
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnPlayerDeath(playerid, killerid, reason)
{
	if (gdebug >=0){printf("OnPlayerDeath Playerid:%d killerid:%d reason:%d", playerid, killerid, reason);}
	new name[MAX_PLAYER_NAME];
	new string[256];
	new dmessage[128];
	new deathreason[20];
	new playercash;
	new victimteam;
	new Float:px,Float:py,Float:pz;
	//new killerteam;
	victimteam = (gTeam[playerid]);
	//killerteam = (gTeam[killerid]);
	gPlayerSpawned[playerid] = 0;
	missao1[playerid] = 0;
	missao2[playerid] = 0;
	DisablePlayerCheckpoint(playerid);
	missao3[playerid] = 0;
	GetPlayerName(playerid, name, sizeof(name));
	PlayerInfo[playerid][pLocal] = 255;
	GetPlayerPos(playerid, px, py, pz);


	if(killerid != 255)
	{
		if(GetPlayerState(killerid) == 2 && playerid != gPublicEnemy)
		{
			SendClientMessage(killerid, COLOR_YELLOW, "Nao e permitido atirar do carro!");
			return 1;
		}
	}
/*	if(reason == 38)
	{
		new kstring[128];
		new kickname[MAX_PLAYER_NAME];
		GetPlayerName(playerid, kickname, sizeof(kickname));
		format(kstring, sizeof(kstring), "AdminSweep: Player [%d]%s Has Been Banned, Cheat Detected",playerid,kickname);
		printf("%s", kstring);
		SendClientMessageToAll(COLOR_RED, kstring);
		Ban(playerid);
	}  */
	if(gPlayerFighter[playerid] == 1)
	{
		DmScore[playerid]--;
		if(killerid != INVALID_PLAYER_ID)
		{
			DmScore[killerid]++;
			if(DmScore[killerid] > DmHiScore)
			{
				new dmname[MAX_PLAYER_NAME];
				GetPlayerName(killerid, dmname, sizeof(dmname));
				DmHiPlayer = killerid;
				DmHiScore = DmScore[killerid];
				format(string, sizeof(string), "DMNEWS: %s Is now in the lead with %d ", dmname,DmHiScore);
				BroadCast(COLOR_WHITE, string);
				format(string, sizeof(string), "  ~g~%d~w~|~g~%d",DmScore[killerid],DmHiScore);
			}
			else
			{
				format(string, sizeof(string), "  ~r~%d~w~|~g~%d",DmScore[killerid],DmHiScore);
			}
			GameTextForPlayer(killerid, string, 5000, 6);
		}
	}
	GetWeaponName(reason, deathreason, 20);
	format(dmessage, sizeof(dmessage), "Acidentado");
	if (strlen(deathreason) == 0)
	{
		format(deathreason, sizeof(deathreason), "Maos");
	}
	if (reason == 41)
	{
		format(deathreason, sizeof(deathreason), "Spray de pimenta");
	}
	if (gPlayerCheckpointStatus[playerid] == CHECKPOINT_DROPOFF)
	{
		if (gdebug){print("DEBUG test6");}
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		new check;
		check = gPlayerCheckpointStatus[playerid];
		if (gdebug){printf("DEBUG check %d" ,check);}
		OnPlayerDropCashBox(playerid);
	}
	if (gPlayerCheckpointStatus[playerid] > 4 && gPlayerCheckpointStatus[playerid] < 23)
	{
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		LapCount[playerid] = 0;
	}
	/*
	if((PlayerInfo[playerid][pPhousekey]+1 != gLastCar[playerid] && gLastCar[playerid] != 0) || HireCar[playerid] != gLastCar[playerid] && gLastCar[playerid] != 0)
	{
		printf("DEBUG PlayerInfo[playerid][pPhousekey](%d) gLastCar[playerid]-1(%d) HireCar[playerid](%d)", PlayerInfo[playerid][pPhousekey],gLastCar[playerid]-1,HireCar[playerid]);
		UnLockCar(gLastCar[playerid]);
		gCarLock[gLastCar[playerid]] = 0;
		gLastDriver[gLastCar[playerid]] = 300;
		gLastCar[playerid] = 0;
	}
	*/
	new caller = Mobile[playerid];
	if(caller != 255)
	{
		if(caller < 255)
		{
			SendClientMessage(caller,  COLOR_GRAD2, "   Fim da linha....");
			CellTime[caller] = 0;
			CellTime[playerid] = 0;
			Mobile[caller] = 255;
		}
		Mobile[playerid] = 255;
		CellTime[playerid] = 0;
	}
	ClearCrime(playerid);
	if (killerid == INVALID_PLAYER_ID)
	{
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && gTeam[i] != gTeam[playerid] && CrimInRange(20.0, playerid,i) && GetPlayerState(i) != 2)
			{
				killerid = i;
				format(deathreason, sizeof(deathreason), "Intimidacao");
			}
		}
	}
	if (killerid == INVALID_PLAYER_ID)
	{
		if ((gTeam[playerid]) == 0){return 1;}
		new slice = ((PlayerInfo[playerid][pLevel]*deathcost)+(basedcost)); //1k +your level
		GivePlayerMoney(playerid, -slice);
		format(string, sizeof(string), "Preco por atendimento medico particular $%d.", slice);
		SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
		format(string, sizeof(string), "Os medicos te salvaram a tempo. Voce conseguiu sobreviver dessa vez.");
		SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
		switch (reason)
		{
			case WEAPON_DROWN:
			{
				format(string, sizeof(string), "Noticia de BS: %s se afogou", name);
				BroadCast(COLOR_RED, string);
				GameTextForPlayer(playerid, dmessage, 5000, 2);
			}
			case WEAPON_COLLISION:
			{
				format(string, sizeof(string), "Noticia de BS: %s foi seriamente ferido.", name);
				BroadCast(COLOR_RED, string);
				GameTextForPlayer(playerid, dmessage, 5000, 2);
			}
			default:
			{
				/*
				if (strlen(deathreason) > 0)
				{
					format(string, sizeof(string), ".: %s died. (%s) :.", name, deathreason);
				}*/
			//	else
			//	{
					format(string, sizeof(string), "Noticia de BS: %s foi seriamente ferido.", name);
			//	}

				BroadCast(COLOR_RED, string);
				GameTextForPlayer(playerid, dmessage, 5000, 2);
			}
		}
		if (gTeam[playerid] == 4)
		{
			gTeam[playerid] = PlayerInfo[playerid][pTeam];
		}
		if (gPublicEnemy == playerid)
		{
			if(killerid == 255)
			{
				gPublicEnemy = INVALID_PLAYER_ID;
				GivePlayerMoney(playerid, -preward);
				format(string, sizeof(string), "SMS: %s, O motorista da ambulancia pegou seu ultimo pagamento $%d",name,preward);
				RingTone[playerid] = 20;
				SendClientMessage(playerid, COLOR_YELLOW, string);
				KillTimer(offhook);
				new tmpmed;
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) == 1 && gTeam[i] == TEAM_CYAN)
					{
						tmpmed++;
					}
				}
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) == 1 && gTeam[i] == TEAM_CYAN)
					{
						GivePlayerMoney(i, preward/tmpmed);
					}
				}
			}
		}
		return 1;
	}
	if (Contract[playerid] > 0)
	{
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		GivePlayerMoney(killerid, Contract[playerid]);
		format(string,128,"<< %s fez o contrato de %s e coletou $%d >>",killer,name,Contract[playerid]);
		BroadCast(COLOR_YELLOW, string);
		PayLog(string);
		Contract[playerid] = 0;
	}
	if (victimteam >= 4)
	{
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		new slice = ((PlayerInfo[playerid][pLevel]*deathcost)+(basedcost)); //1k +your level
		playercash = GetPlayerMoney(playerid);
		if(SafeTime[playerid] <= 0 || gPlayerFighter[playerid] == 1)
		{
			if(gTeam[killerid] != gTeam[playerid])
			{
				if(GetPlayerState(killerid) == 1)
				{
					PlayerInfo[killerid][pKills] = PlayerInfo[killerid][pKills]+2;
				}
				else
				{
					PlayerInfo[killerid][pKills]++;
				}
				PlayerInfo[playerid][pKills]--;
				if(PlayerInfo[killerid][pKills] >= 30)
				{
					PlayerInfo[killerid][pExp]++;
					PlayerInfo[killerid][pKills] = 0;
					SendClientMessage(killerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
				}
			}
		}
		if (strlen(deathreason) > 0)// patch
		{
			if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill) || gTeam[killerid] == gTeam[playerid])//med kill criminal
			{
				format(string, sizeof(string), "Noticia de BS: %s matou %s com %s, os policiais estao a proucura do assasino.", killer, name, deathreason);
			}
			else
			{
				format(string, sizeof(string), "Noticia de BS: %s matou %s com a arma %s e roubou $%d, os policiais estao a proucura do assasino.", killer, name, deathreason, slice);
			}
			if (gdebug){print("DEBUG Deathtest3");}

		}
		else
		{
			if (gdebug){print("DEBUG Deathtest4");}
			if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill || gTeam[killerid] == gTeam[playerid]))
			{
				format(string, sizeof(string), "Noticia de BS: %s matou %s.", killer, name);
			}
			else
			{
				format(string, sizeof(string), "Noticia de BS: %s matou %s com $%d.", killer, name, slice);
			}
		}
		if ((gTeam[killerid]) == 2)//cops kill criminal
		{
			format(string, sizeof(string), "Noticia de BS: %s foi preso por %s (%s) e pagou a fianca de $%d.", name, killer, deathreason, slice);
			format(dmessage, sizeof(dmessage), "Preso!");
			if(IsACopCar(gLastCar[killerid]))
			{
				GivePlayerMoney(killerid, 2000);
				SendClientMessage(killerid, TEAM_BLUE_COLOR, "Bonus $2000");
			}
		}
		if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill) || (gTeam[killerid] == gTeam[playerid] && gTeam[playerid] != 4))
		{
			slice = 0;
		}
		if (((gTeam[killerid]) != 4) && ((gTeam[killerid]) == gTeam[playerid]))//no team kill
		{
			slice = 0;
		}
		if (playercash > 0)
		{
			if (gdebug){print("DEBUG Deathtest1");}
			GivePlayerMoney(playerid, -slice);
		}
		else
		{
			if (gdebug){print("DEBUG Deathtest2");}
			slice = slice+500;
		}
		GivePlayerMoney(killerid, slice);
		GameTextForPlayer(playerid, dmessage, 5000, 2);
		PlayerPlaySound(killerid, 1083, 0.0, 0.0, 0.0);
		if (((gTeam[killerid]) == 3) && reason != 49)
		{
			SetPlayerCriminal(killerid,255, "Assasino",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		else if (((gTeam[killerid]) == 3) && reason == 49)
		{
			SetPlayerCriminal(killerid,255, "Assasino",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		if (gPublicEnemy == playerid)
		{
			//SendClientMessage(killerid, TEAM_BLUE_COLOR, "HQ: You Have Arrested Public Enemy No.1, $5000 Bonus PayCheck");
			GivePlayerMoney(killerid, preward);
			GivePlayerMoney(playerid, -preward);
			KillTimer(offhook);
			format(string, sizeof(string), "SMS: %s, %s roubou seu ultimo pagamento $%d", name, killer,preward);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			RingTone[playerid] = 20;
			format(string, sizeof(string), "Noticia de BS: O bandido %s foi morto por %s (%s) e perdeu $%d.", name, killer,  deathreason, slice);
			PlayerInfo[killerid][pPEN]++;
			if(PlayerInfo[killerid][pPEN] >= 4)
			{
				PlayerInfo[killerid][pExp]++;
				PlayerInfo[killerid][pPEN] = 0;
				SendClientMessage(killerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
			}
			PlayerPlayMusic(killerid);
		}
		BroadCast(COLOR_RED, string);
		if (gPublicEnemy != playerid)
		{
			if(gPlayerFighter[killerid] != 1)
			{
				format(string, sizeof(string), "~g~$%d", slice);
				GameTextForPlayer(killerid, string, 5000, 1);
			}
		}
		else
		{
			format(string, sizeof(string), "~p~Bandido ~w~morto~n~voce ganhou ~g~$%d", preward);
			GameTextForPlayer(killerid, string, 5000, 1);
			gPublicEnemy = INVALID_PLAYER_ID;
		}
	}
	else if (victimteam == 2)
	{
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		// Cop kill
		if (gdebug){print("DEBUG test5");}
		PlayerInfo[playerid][pKills]--;
		if (gTeam[killerid] == 2)//cops kill cop
		{
			format(string,128,"Noticia de BS: O policial %s matou o policial %s (%s) e pagou a fianca de $%d.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else
		{
			format(string,128,"Noticia de BS: %s matou policial %s (%s).",killer,name,deathreason);
	    }
		if (gTeam[killerid] == 3)
		{
			if(reason != 49)
			{
				SetPlayerCriminal(killerid,255, "Assasino",0,0);
			}
			else if (reason == 49)
			{
				SetPlayerCriminal(killerid,255, "Assasino",0,0);
			}
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		if(gTeam[killerid] >= 5 && SafeTime[playerid] <= 0)
		{
			if(GetPlayerState(killerid) == 1)
			{
				PlayerInfo[killerid][pKills] = PlayerInfo[killerid][pKills]+2;
			}
			else
			{
				PlayerInfo[killerid][pKills]++;
			}
			if(PlayerInfo[killerid][pKills] >= 30)
			{
				PlayerInfo[killerid][pExp]++;
				PlayerInfo[killerid][pKills] = 0;
				SendClientMessage(killerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
			}
		}
		BroadCast(COLOR_RED, string);
	}
	else if (victimteam == 3)
	{
		if (gdebug){print("DEBUG test6");}
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		// Civ kill
		if ((gTeam[killerid]) == 2)//cops kill civ
		{
			format(string,128,"Noticia de BS: O policial %s matou %s (%s) e pagou a fianca de $%d.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else
		{
			format(string,128,"Noticia de BS: %s matou %s (%s).",killer,name,deathreason);
	    }
		if (((gTeam[killerid]) == 3 || (gTeam[killerid]) == 1) && reason != 49)
		{
			SetPlayerCriminal(killerid,255, "Assasino",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		else if (((gTeam[killerid]) == 3 || (gTeam[killerid]) == 1) && reason == 49)
		{
			SetPlayerCriminal(killerid,255, "Assasino",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
	    BroadCast(COLOR_RED, string);
	}
	else if (victimteam == 1)
	{
		if (gdebug){print("DEBUG test6");}
		new killer[MAX_PLAYER_NAME];
		GetPlayerName(killerid, killer, sizeof(killer));
		// Civ kill
		if ((gTeam[killerid]) == 2)//cops kill civ
		{
			format(string,128,"Noticia de BS: O policial %s matou o paramedico %s (%s) e pagou a fianca de $%d.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else if ((gTeam[killerid]) == 1)//med kill civ
		{
			format(string,128,"Noticia de BS: O paramedico %s matou %s (%s) e pagou a fianca de $%d.",killer,name,deathreason,suecost);
			PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
			GivePlayerMoney(killerid, -suecost);
			GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
		}
		else
		{
			format(string,128,"Noticia de BS: %s matou %s (%s).",killer,name,deathreason);
	    }
		if (((gTeam[killerid]) == 4) && reason != 49)
		{
			SetPlayerCriminal(killerid,255, "Assasino",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
		else if (((gTeam[killerid]) == 3) && reason == 49)
		{
			SetPlayerCriminal(killerid,255, "Assasino",0,0);
			if(FlashTime[killerid] == 0){FlashTime[killerid] = 10;}
		}
	    BroadCast(COLOR_RED, string);
	}
	if (gSuperCop == playerid)
	{
		gSuperCop = INVALID_PLAYER_ID;
	}
	if(GetPlayerState(killerid) == 1)
	{
		lastkiller = killerid;
	}
	killerid = INVALID_PLAYER_ID;
	SetPlayerColor(playerid,COLOR_GRAD2);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if (gdebug >=1){printf("OnPlayerSpawn Playerid:%d", playerid);}
	if (teamcarlock)
	{
		TeamLockDoors(playerid);
	}
	InitLockDoors(playerid);
	if(accountplay)
	{
		if (gdebug >=1){printf("accountplay");}
		if (gPlayerAccount[playerid] == 0)
		{
			gTeam[playerid] = 0;
			GameTextForPlayer(playerid, "~w~Bem vindo!~n~ Para jogar voce deve criar uma conta, coloque ~n~~r~/registrar (senha)", 20000, 3);
			//SetPlayerInterior(playerid,0);
			SetPlayerInterior(playerid,3);
			PlayerInfo[playerid][pInt] = 3;
			SetPlayerPos(playerid,198.5,162.5,1003.0);
			// airport
			PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
			gPlayerSpawned[playerid] = 1;
    		return 1;
		}
		if (gPlayerLogged[playerid] == 0)
		{
			gTeam[playerid] = 0;
			GameTextForPlayer(playerid, "~w~Para jogar voce deve logar, coloque ~n~~g~/login (senha)~w~ para entrar", 20000, 3);
			//SetPlayerInterior(playerid,0);
			SetPlayerInterior(playerid,3);
			PlayerInfo[playerid][pInt] = 3;
			SetPlayerPos(playerid,198.5,162.5,1003.0);
			// airport
			PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
			gPlayerSpawned[playerid] = 1;
    		return 1;
		}
	}
	if (gPlayerSpawned[playerid] == 0)
	{
	gTeam[playerid] = PlayerInfo[playerid][pTeam];
	if (gTeam[playerid] == 2 && forceteam && CopCheck(playerid))
	{
  		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			gTeam[playerid] = 3;
			PlayerInfo[playerid][pTeam] = 3;
			SetPlayerRandomSpawn(playerid);
		}
		else
		{
		GameTextForPlayer(playerid, "~w~Voce nao tem ~n~~r~permissao", 5000, 1);
		}
	}
		/*
		if(gTeam[playerid] == 2 && PlayerInfo[playerid][pLevel] < 3)
		{
			gTeam[playerid] = 3;
			PlayerInfo[playerid][pTeam] = 3;
			SetPlayerRandomSpawn(playerid);
			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: You must be level 3 to join the cops.");
		}
		*/
		if (gTeam[playerid] == 1 && forceteam && MedCheck(playerid))
		{
			gTeam[playerid] = 3;
			PlayerInfo[playerid][pTeam] = 3;
			SetPlayerRandomSpawn(playerid);
		}
		if (gTeam[playerid] == 4) //medic / criminal reset team
		{
			gTeam[playerid] = PlayerInfo[playerid][pTeam];
		}
		SetPlayerRandomSpawn(playerid);
		if (gdebug){printf("DEBUG id = %d gTeam = %d",playerid,gTeam[playerid]);}

	}
	return 1;
}
//---------------------------------------CHECKPOINT----------------------------------------------------
public PayLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("pay.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public CmdLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("cmd.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public PrePlayerNewMission()
{
if (gdebug >=1){printf("PrePlayerNewMission");}
	CheckpointReset();
	if (MissionActive == 12)
	{
		gFighters=0;
		gFightLeader=0;
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				DmScore[i] = 0;
				if(gPlayerFighter[i] == 1)
				{
					gPlayerFighter[i] = 0;
					TogglePlayerControllable(i, 1);
					SetPlayerRandomSpawn(i);
				}
			}
		}
	}
	if (MissionActive > 8 && MissionActive < 12)
	{
		if(MissionActive != 0)
		{
			printf("DEBUG: Bad Hotwire: stealcar = %d, stealcardest = %d",stealcar,stealcardest);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(stealcar != -1)
					{
						SetVehicleParamsForPlayer(stealcar,i,0,0);
						SetVehicleToRespawn(stealcar);
						stealcar = -1;
					}
				}
			}
		}
	}
	if (MissionActive > 4 && MissionActive <= 7 )
	{
		CheckpointReset();
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				LapCount[i] = 0;
				StartTime[i] = 0;
			}
		}
		gRaceFin = 0;
		gRaceMid = 0;
		gRaceMid2 = 0;
		gRaceEnd = 0;
		gLaps = 0;
		BroadCast(COLOR_WHITE, "RACENEWS: ::: Race Over :::");
	}
	if (cashbox == 0 && hotwire == 0 && streetrace == 0 && deathmatch == 0)
	{
		MissionActive = 255;
		if (gdebug){print("DEBUG MissionActive = 255");}
		return 1;
	}
	if (cashbox == 0 && hotwire == 0 && streetrace == 1 && deathmatch == 0)
	{
		MissionActive = 4;
		if (gdebug){print("DEBUG MissionActive = 4");}
		SetPlayerNewMission();
		return 1;
	}
	if (cashbox == 0 && hotwire == 0 && streetrace == 0 && deathmatch == 1)
	{
		MissionActive = 12;
		if (gdebug){print("DEBUG MissionActive = 12");}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive == 0)
	{
		if (cashbox == 0)
		{
			MissionActive = 4;
			if (gdebug){print("DEBUG MissionActive = 4");}
		}
		else
		{
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive > 0 && MissionActive <= 4)
	{
		if (streetrace == 0)
		{
			MissionActive = 8;
			if (gdebug){print("DEBUG MissionActive = 8");}
		}
		else
		{
			MissionActive = 4;
			if (gdebug){print("DEBUG MissionActive = 4");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive > 4 && MissionActive <= 8 )
	{
		if (hotwire == 0)
		{
			MissionActive = 12;
			if (gdebug){print("DEBUG MissionActive = 12");}
		}
		else
		{
			MissionActive = 8;
			if (gdebug){print("DEBUG MissionActive = 8");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive > 8 && MissionActive <= 12)
	{
		if (deathmatch == 0)
		{
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
		}
		else
		{
			MissionActive = 12;
			if (gdebug){print("DEBUG MissionActive = 12");}
		}
		SetPlayerNewMission();
		return 1;
	}
	if (MissionActive == 13)
	{
		if (cashbox == 0)
		{
			MissionActive = 4;
			if (gdebug){print("DEBUG MissionActive = 4");}
		}
		else
		{
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
		}
		SetPlayerNewMission();
		return 1;
	}
	return 1;
}
public SetPlayerNewMission()
{
if (gdebug >=1){printf("SetPlayerNewMission");}
	switch (MissionActive)
	{
		case 0:
		{
			new rando = random(5);
			if (rando == 1)
			{
				cwx = 997.7;
				cwy = -921.1;
				cwz = 42.1;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At North Side Gas Station, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 North Side Gas Station.");
			}
			else if(rando == 2)
			{
				cwx = 2421.5;
				cwy = -1221.7;
				cwz = 25.3;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At The Pig Pen, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-10 At The Pig Pen.");
			}
			else if(rando == 3)
			{
				cwx = 2069.7;
				cwy = -1780.1;
				cwz = 13.5;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At East Side Tattoo, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-32 At East Side Tatoo.");
			}
			else if(rando == 4)
			{
				cwx = 1352.4;
				cwy = -1756.7;
				cwz = 13.5;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At Roboi's Food Mart, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-17 At Robbi's Food Mart.");
			}
			else
			{
				cwx = 1831.1;
				cwy = -1842.8;
				cwz = 13.5;
				format(objstore, sizeof(objstore), "SMS: It's Pay Day At The 69 Cent Store, Sender: MOLE (555)");
				format(cbjstore, sizeof(cbjstore), "HQ: 911 10-94 At The 69 Cent Store.");
			}
			rx = cwx;//storing the store
			ry = cwy;
			rz = cwz;
			MissionActive = 1;
			if (gdebug){print("DEBUG MissionActive = 1;");}
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if (gTeam[i] >= 3)
					{
						if (automission)
						{
							JobGive(i);
						}
						else if (PlayerInfo[i][pPnumber] !=0)
						{
							SendClientMessage(i, COLOR_YELLOW, "SMS: I Got A Job For You, Text Yes To 555 For More Info, Sender: MOLE (555)");
							SendClientMessage(i, COLOR_WHITE, "AVISO: Type (/sms 555 yes) to get the waypoint from mole");
							RingTone[i] =20;
						}
					}
					else if (gPlayerSpawned[i] == 1 && (gTeam[i]) == 2)
					{
						SendClientMessage(i, COLOR_DBLUE, cbjstore);
						GameTextForPlayer(i, "~w~Waypoint set ~n~~r~CashBox", 5000, 1);
						SetPlayerCheckpoint(i,cwx, cwy, cwz, 1.4);
					}
				}
			}
			return 1;
		}
		case 4:
		{
			gRaceFin = 0;
			gRaceMid = 0;
			gRaceMid2 = 0;
			if(randomrace)
			{
				RNext = random(sizeof(gRaceCheckpoints)-1);
				RNext2 = random(sizeof(gRaceCheckpoints));
				REnd = random(sizeof(gRaceCheckpoints));
				while (RNext == REnd)
				{
					REnd = random(sizeof(gRaceCheckpoints));
				}
				while (RNext2 == RNext)
				{
					RNext2 = random(sizeof(gRaceCheckpoints));
				}
				rsx = gRaceCheckpoints[4][0];
				rsy = gRaceCheckpoints[4][1];
				rsz = gRaceCheckpoints[4][2];
				rmx = gRaceCheckpoints[RNext][0];
				rmy = gRaceCheckpoints[RNext][1];
				rmz = gRaceCheckpoints[RNext][2];
				rm2x = gRaceCheckpoints[RNext2][0];
				rm2y = gRaceCheckpoints[RNext2][1];
				rm2z = gRaceCheckpoints[RNext2][2];
				rex = gRaceCheckpoints[REnd][0];
				rey = gRaceCheckpoints[REnd][1];
				rez = gRaceCheckpoints[REnd][2];
			}
			if(racelist > 0)
			{
				new randa = random(sizeof(Races));
				LoadRace(255,Races[randa]);
			}
			MissionActive = 5;
			if (gdebug){print("DEBUG MissionActive = 5");}
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && (gPlayerSpawned[i] == 1))
				{
					if (gdebug){print("DEBUG Checkp4");}
					if (gTeam[i] >= 3)
					{
						if (automission)
						{
							JobGive(i);
						}
						else if (PlayerInfo[i][pPnumber] !=0)
						{
							SendClientMessage(i, COLOR_YELLOW, "SMS: I Got A Job For You, Text Yes To 555 For More Info, Sender: MOLE (555)");
							SendClientMessage(i, COLOR_WHITE, "AVISO: Type (/sms 555 yes) to get the waypoint from mole");
							RingTone[i] =20;
						}
					}
					else if((gTeam[i]) == 2 && RaceInfo[rLaps] == 0)
					{

						if (gdebug){print("DEBUG Checkp6");}
						format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 Set Up A RoadBlock At The Red Marker.");
						GameTextForPlayer(i, "~w~Waypoint set ~n~~r~RoadBlock", 5000, 1);
						SendClientMessage(i, COLOR_DBLUE, cbjstore);
						RingTone[i] = 20;
						SetPlayerRaceCheckpoint(i, 0, rm2x,rm2y,rm2z,rex,rey,rez, 8.0);
					}
				}
			}
			return 1;
		}
		case 8:
		{
			if (gdebug){print("DEBUG test1");}
			stealcar = random(166)+88;
			GetVehiclePos(stealcar, scx, scy, scz);
			format(objstore, sizeof(objstore), "SMS: A Buyer Is Interested In The Car Marked On Your GPS, Sender: MOLE (555)");
			format(cbjstore, sizeof(cbjstore), "HQ: 911 10-64 Suspect Vehicle Spotted.");
			rx = scx;//storing the car pos
			ry = scy;
			rz = scz;
			if (gdebug){print("DEBUG TEST2");}
			stealcardest = random(166)+88;
			while (stealcardest == stealcar)
			{
				stealcardest = random(166)+88;
			}
			MissionActive = 9;
			if (gdebug){print("DEBUG MissionActive = 9;");}
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && (gPlayerSpawned[i] == 1))
				{
					if (gdebug){print("DEBUG test2");}
					if (gTeam[i] >= 3)
					{
						if (automission)
						{
							JobGive(i);
						}
						else if (PlayerInfo[i][pPnumber] !=0)
						{
							SendClientMessage(i, COLOR_YELLOW, "SMS: I Got A Job For You, Text Yes To 555 For More Info, Sender: MOLE (555)");
							SendClientMessage(i, COLOR_WHITE, "AVISO: Type (/sms 555 yes) to get the waypoint from mole");
							RingTone[i] =20;
						}
					}
					else
					{
						if (gdebug){print("DEBUG test4");}
						SendClientMessage(i, COLOR_DBLUE, cbjstore);
						GameTextForPlayer(i, "~w~Waypoint set ~n~~y~Suspect Vehicle", 5000, 1);
						SetVehicleParamsForPlayer(stealcar,i,1,1);
					}
				}
			}
			if (gdebug){printf("DEBUG HOTWIRE mission started: TargetCar:%d",stealcar);}
		return 1;
		}
		case 12:
		{
			new rand = random(sizeof(DmGun));
			dmweapon = DmGun[rand];
			if(dmlist > 35)
			{
				dmlist = 1;
			}
			new nextdm = random(sizeof(DeathMatches));
			LoadDM(255,DeathMatches[nextdm]);
			new sgun1[20];
			new winfo[256];
			if(DmGun[rand] > 0)
			{
				GetWeaponName(DmGun[rand], sgun1, 20);
				format(winfo, sizeof(winfo), "DM Weapon: %s",sgun1);
			}
			else
			{
				format(winfo, sizeof(winfo), "DM Weapon: Bring Your Own");
			}
			SendClientMessageToAll(COLOR_GREEN, winfo);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					SendClientMessage(i, COLOR_YELLOW, "SMS: DeathMatch Starting Soon At The Red Marker Outside Ammunation, Sender: MOLE (555)");
					RingTone[i] = 20;
					SendClientMessage(i, COLOR_WHITE, "AVISO: Go To The Red Marker And Wait For The DeathMatch To Start.");
					SetPlayerCheckpoint(i,gRandomDMSpawns[0][0],gRandomDMSpawns[0][1],gRandomDMSpawns[0][2], 4.0);
					GameTextForPlayer(i, "~w~Waypoint set ~n~~r~DeathMatch", 5000, 1);
					gPlayerCheckpointStatus[i] = CHECKPOINT_DM;
				}
			}
			MissionActive = 13;
			return 1;
		}
		default:
		{
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if (gdebug >=1){printf("OnPlayerEnterCheckpoint %d",playerid);}
	new string[128];
	new name[MAX_PLAYER_NAME];
	switch (gPlayerCheckpointStatus[playerid])
	{
		case CHECKPOINT_PICKUP:
		    {
				if(GetPlayerState(playerid) != 1)
				{
					GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
					return 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_PICKUP");}
		  	    GetPlayerName(playerid, name, sizeof(name));
		  	    if (MissionActive == 1)
		  	    {
					RewardCalc(playerid,1000,10000);
					DropOff = random(sizeof(gCBdropoff));
				}
				if (gTeam[playerid] >= 3)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					CheckpointReset();
					GameTextForPlayer(playerid, "~w~Now get to the~n~~r~Safehouse", 5000, 1);
					cwx = gCBdropoff[DropOff][0];
					cwy = gCBdropoff[DropOff][1];
					cwz = gCBdropoff[DropOff][2];
					SetAllPlayerCheckpoint(cwx, cwy, cwz, 1.4, 0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_DROPOFF;
					if (gdebug){printf("DEBUG gpcs %d",gPlayerCheckpointStatus[playerid]);}
					format(string, sizeof(string), "%s Has Picked Up The CashBox Containing $%d.", name ,reward);
					BroadCast(COLOR_YELLOW, string);
					gSuperCop = playerid;
					SetPlayerCriminal(playerid,255, "Armed Robbery",0,0);
					MissionActive = 2;
					if (gdebug){print("DEBUG MissionActive = 2;");}
				}
				else if ((gTeam[playerid]) == 2)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					CheckpointReset();
					GameTextForPlayer(playerid, "~w~Return the CashBox~n~to the ~r~Store", 5000, 1);
					cwx = rx;//retrieving the store
					cwy = ry;
					cwz = rz;
					SetAllPlayerCheckpoint(cwx, cwy, cwz, 1.4, 0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_DROPOFF;
					format(string, sizeof(string), "Officer %s Has Picked Up The CashBox Containing $%d.", name ,reward);
					BroadCast(COLOR_YELLOW, string);
	            	gSuperCop = playerid;
	            	MissionActive = 2;
	            	if (gdebug){print("DEBUG MissionActive = 2;");}
				}
			}
		case CHECKPOINT_DROPOFF:
		    {
				if (gdebug){print("DEBUG CHECKPOINT_DROPOFF");}
				GetPlayerName(playerid, name, sizeof(name));
				GivePlayerMoney(playerid, reward);
				preward = reward;
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				if ((gTeam[playerid]) >= 4)
				{
					format(string, sizeof(string), "~g~JOB COMPLETE~n~~w~Your cut was~n~~g~$%d", reward);
					GameTextForPlayer(playerid, string, 5000, 6);
					format(string, sizeof(string), "%s Just Cracked The CashBox For $%d.", name,reward);
					gSuperCop = INVALID_PLAYER_ID;
					SetPlayerCriminal(playerid,255, "Armed Robbery",1,1);
					gPlayerMission[playerid] = 1;
				}
				else
				{
					format(string, sizeof(string), "~b~CASHBOX RETURNED~n~~w~Bonus Paycheck~n~~g~$%d", reward);
					GameTextForPlayer(playerid, string, 5000, 6);
					format(string, sizeof(string), "%s Just Returned The CashBox For $%d.", name,reward);
					SetPlayerToTeamColor(playerid);
					gSuperCop = INVALID_PLAYER_ID;
					if(PlayerInfo[playerid][pCB] >= 4)
					{
						PlayerInfo[playerid][pExp]++;
						PlayerInfo[playerid][pCB] = 0;
						SendClientMessage(playerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
					}
				}
				PlayerPlayMusic(playerid);
				BroadCast(COLOR_YELLOW, string);
				CheckpointReset();
				MissionActive = 4;//srace
				if (gdebug){print("DEBUG MissionActive = 4;");}
		    }
		case CHECKPOINT_SR1START:
		    {
				if (gdebug){print("DEBUG CHECKPOINT_SR1START");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				if (gTeam[playerid] >= 3)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					if(IsAPlane(tmpcar))
					{
						GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
						return 1;
					}
					if (MissionActive == 5)// first to arrive
					{
						gRaceLeader++;
						if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
						if (gRaceLeader == 1)
						{
							format(string, sizeof(string), "~r~Wait For More Racers");
							GameTextForPlayer(playerid, string, 2000, 6);
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							DisablePlayerCheckpoint(playerid);
							return 1;
						}
						else if (gRaceLeader == 2)
						{
							gRaceLeader = 0;
							if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
							format(string, sizeof(string), "SMS: %d Seconds To Race Start, Sender: MOLE (555)",racedelay/1000);
							RingTone[playerid] = 20;
							SendEnemyMessage(COLOR_YELLOW, string);
							format(string, sizeof(string), "~r~Wait Here For Racers");
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							GameTextForPlayer(playerid, string, 2000, 6);
						}
						SetTimer("RaceDelay", racedelay, 0);
						DisablePlayerCheckpoint(playerid);
						MissionActive = 6;
						if (gdebug){print("DEBUG MissionActive = 6");}
					}
					else if (MissionActive == 6) //late arrivels
					{
						if (gdebug){print("DEBUG waiting");}
						DisablePlayerCheckpoint(playerid);
						gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~w~Patrol This Area~n~ For Suspects", 5000, 1);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
					return 1;
				}
		    }
		case CHECKPOINT_SRA:
		    {
				if (gdebug){print("DEBUG CHECKPOINT_SRA");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if (StartTime[playerid] == 0)
				{
					StartTime[playerid] = Gtickcount;
					if(gTeam[playerid] == 3)
					{
						SetPlayerCriminal(playerid,255, "Street Racing",0,0);
						//if(FlashTime[playerid] == 0){FlashTime[playerid] = 60;}
					}
				}
				LapCount[playerid]++;
				gRaceEnd++;
				if(LapCount[playerid] > gLaps)
				{
					gLaps = LapCount[playerid];
					gRaceEnd = 1;
				}
				if(RaceInfo[rLaps] != 0)
				{
					if(gLaps != (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						//RaceDebug(playerid);
						if(gLaps == 2)
						{
							for(new i = 0; i <= MAX_PLAYERS; i++)
							{
								if(IsPlayerConnected(i) && gTeam[i] == 2)
								{
									format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 Set Up A RoadBlock At The Red Marker.");
									SendClientMessage(i, COLOR_DBLUE, cbjstore);
									RingTone[i] = 20;
									SetPlayerCheckpoint(i,rm2x,rm2y,rm2z, 8.0);
								}
							}
							RaceTime[playerid] = Gtickcount;
						}
						if (gRaceEnd == 1 && LapCount[playerid] == gLaps)
						{
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 1st Place T: %d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~1st Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
							SetAllCopCheckpoint(rex,rey,rez, 8.0);
						}
						else if (gRaceEnd == 2 && LapCount[playerid] == gLaps)
						{
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 2nd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~2nd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else if (gRaceEnd == 3 && LapCount[playerid] == gLaps)
						{
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 3rd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~3rd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else
						{
							format(string, sizeof(string), "~w~Lap %d/%d",LapCount[playerid],RaceInfo[rLaps]);
						}
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					else if(gLaps == (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						if (gRaceEnd == 1)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
							if (gdebug){print("DEBUG RACE OVER");}
							RewardCalc(playerid,1000,10000);
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							preward = reward;
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
							RaceTime[playerid] = Gtickcount;
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							raceendtimer = SetTimer("RaceEnd", 120000, 0);
							if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
							{
								RaceInfo[rBestms] = pos1time;
								strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
								BestTime(CurrentRace);
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
								BroadCast(COLOR_WHITE, string);
								format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							else
							{
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							SetPlayerCriminal(playerid,255, "Street Racing",1,1);
							gPlayerMission[playerid] = 2;
							BetWinner(playerid,1);
							return 1;
						}
						else if (gRaceEnd == 2)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
							if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/2;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							return 1;
						}
						else if (gRaceEnd == 3)
						{
							CheckpointReset();
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
							if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/3;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							KillTimer(raceendtimer);
							RaceEnd();
							return 1;
						}
					}
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerCheckpoint(playerid,rmx,rmy,rmz, 16.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
				if(RaceInfo[rLaps] == 0 && LapCount[playerid] == 1)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerCheckpoint(playerid,rmx,rmy,rmz, 16.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
		    }
		case CHECKPOINT_SRB:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid = 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid,rm2x,rm2y,rm2z, 16.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRC;
				gRaceMid++;
				if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRC:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid2 != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid2 = 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerCheckpoint(playerid,rex,rey,rez, 16.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRD;
				gRaceMid2++;
				if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRD:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceFin != 1 && LapCount[playerid] > gLaps)
				{
					gRaceFin = 1;
				}
				if (gdebug){print("DEBUG CHECKPOINT_SRC");}
				gRaceFin++;
				if(RaceInfo[rLaps] > 0)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerCheckpoint(playerid,rsx,rsy,rsz, 16.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					SetAllCopCheckpoint(rex,rey,rez, 8.0);
				}
				if(RaceInfo[rLaps] == 0)
				{
					if (gRaceFin == 1)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						if (gdebug){print("DEBUG RACE OVER");}
						RewardCalc(playerid,1000,10000);
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						preward = reward;
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 6);
						BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
						RaceTime[playerid] = Gtickcount;
						pos1time = RaceTime[playerid] - StartTime[playerid];
						ConvertTicks(pos1time);
						GetPlayerName(playerid, name, sizeof(name));
						raceendtimer = SetTimer("RaceEnd", 120000, 0);
						if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
						{
							RaceInfo[rBestms] = pos1time;
							strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
							BestTime(CurrentRace);
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						else
						{
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						SetPlayerCriminal(playerid,255, "Street Racing",1,1);
						gPlayerMission[playerid] = 2;
						BetWinner(playerid,1);
					}
					else if (gRaceFin == 2)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/2;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos3time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos3time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
					}
					else if (gRaceFin == 3)
					{
						CheckpointReset();
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/3;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos2time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos2time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
						KillTimer(raceendtimer);
						RaceEnd();
					}
				}
		    }
			case CHECKPOINT_CARDROP:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				GameTextForPlayer(playerid, "~w~Get out of the ~n~~y~Car", 5000, 1);
				MissionActive = 11;
				if (gdebug){print("DEBUG MissionActive = 11");}
		    }
       		case CHECKPOINT_TRAFICOARMA:
		    {
		 	  	DisablePlayerCheckpoint(playerid);
	    		GameTextForPlayer(playerid, "~w~Pegue a~n~~r~caixa", 5000, 1);
	    		SetPlayerCheckpoint(playerid,-800.99,2239.37,41.84,1.4);
	    		SendClientMessage(playerid, COLOR_GREEN, "Pegue a caixa de armas encomendada.");
	    		SetVehicleParamsForPlayer(2,playerid,1,0);
				SetVehicleToRespawn(2);
	    		gPlayerCheckpointStatus[playerid] = CHECKPOINT_TRAFICOARMA2;
	    	}
		    case CHECKPOINT_TRAFICOARMA2:
		    {
		  		DisablePlayerCheckpoint(playerid);
	    		GameTextForPlayer(playerid, "~w~Suba a~n~~r~escada", 5000, 1);
	    		SetPlayerCheckpoint(playerid,-796.44,2258.43,58.98,1.4);
	    		SendClientMessage(playerid, COLOR_GREEN, "Pegue a caixa de armas em frente a casa.");
	    		gPlayerCheckpointStatus[playerid] = CHECKPOINT_TRAFICOARMA3;
	    	}
	    	case CHECKPOINT_TRAFICOARMA3:
		    {
		   		DisablePlayerCheckpoint(playerid);
	    		GameTextForPlayer(playerid, "~w~Pegue o~n~~r~furgao", 5000, 1);
	    		SetPlayerCheckpoint(playerid,-480.45,2194.57,41.86,1.4);
	    		SendClientMessage(playerid, COLOR_GREEN, "Prossiga ate o furgao.");
	    		gPlayerCheckpointStatus[playerid] = CHECKPOINT_TRAFICOARMA4;
	    	}
	    	case CHECKPOINT_TRAFICOARMA4:
		    {
		   		DisablePlayerCheckpoint(playerid);
	    		GameTextForPlayer(playerid, "~w~Leve o~n~~r~furgao", 5000, 1);
	    		SetPlayerCheckpoint(playerid,-685.88,965.82,12.13,1.4);
	    		SendClientMessage(playerid, COLOR_GREEN, "Leve o furgao com as armas ate o deposito.");
	    		gPlayerCheckpointStatus[playerid] = CHECKPOINT_TRAFICOARMA5;
	    	}
	    	case CHECKPOINT_TRAFICOARMA5:
		    {
		    if(GetPlayerState(playerid) != 2)
		    {
		    	GameTextForPlayer(playerid, "~w~Cade o~n~~r~carro!?", 1000, 1);
		    	return 1;
			}
		   		DisablePlayerCheckpoint(playerid);
	    		GameTextForPlayer(playerid, "~w~Armas~n~~r~Negociadas", 5000, 1);
	    		SendClientMessage(playerid, COLOR_GREEN, "Voce recebeu 100 pecas, voce pode montar e vender armas.");
	    		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	    		TrArmas[playerid] = 0;
                ComandosDesativados[playerid] = 0;
	    	}
		    case CHECKPOINT_HACKERINI:
		    {
	    		SendClientMessage(playerid, COLOR_GREEN, "Bug instalado, entre na sala de comunicacao.");
		    	DisablePlayerCheckpoint(playerid);
		    	GameTextForPlayer(playerid, "~w~Ative o~n~~r~bug", 5000, 1);
		    	SetPlayerCheckpoint(playerid,-329.8,1536.7,76.6,1.4);
		    	gPlayerCheckpointStatus[playerid] = CHECKPOINT_HACKERFIN;
			}
			case CHECKPOINT_HACKERFIN:
		    {
		    	SendClientMessage(playerid, COLOR_GREEN, "Conectando... Detectando contas bancarias...");
		    	GameTextForPlayer(playerid, "~w~Aguarde o bug~n~~r~acionar", 5000, 1);
		    	DisablePlayerCheckpoint(playerid);
				Buginstalado[playerid] = 1;
				ComandosDesativados[playerid] = 0;
				TogglePlayerControllable(playerid, 0);
				SetPlayerPos(playerid,198.5,162.5,1003.0);
				SetPlayerCameraPos(playerid,-229.66,1683.94,171.18);
				SetPlayerCameraLookAt(playerid,-345.92,1605.54,132.42);
				SetTimer("Bugando", 60000, 0);
		    	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			}
			case CHECKPOINT_HOME:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				GameTextForPlayer(playerid, "~w~Voce esta em~n~~y~Casa", 5000, 1);
		    }
		    case CHECKPOINT_CARROROUBADO:
		    {
		    if(GetPlayerState(playerid) != 2)
		    {
		    	GameTextForPlayer(playerid, "~w~Cade o~n~~r~carro!?", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				GivePlayerMoney(playerid,200);
				RouboCarro[playerid] = 0;
				new carid = GetPlayerVehicleID(playerid);
				SetVehicleParamsForPlayer(carid,playerid,0,0);
				SetVehicleToRespawn(carid);
				SendClientMessage(playerid, COLOR_GREEN, "Embora ter se esforcado o chefe te pagou somente $200.");
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		    }
		    case CHECKPOINT_LIXO1:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2501.60,2275.38,4.97,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO2;
		    }
		    case CHECKPOINT_LIXO2:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2527.15,2293.99,4.98,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO3;
		    }
		    case CHECKPOINT_LIXO3:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2531.93,2294.00,4.98,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO4;
		    }
		    case CHECKPOINT_LIXO4:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2539.70,2294.04,4.98,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO5;
		    }
		    case CHECKPOINT_LIXO5:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2440.13,2344.38,4.97,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO6;
		    }
		    case CHECKPOINT_LIXO6:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2402.01,2356.34,6.39,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO7;
		    }
		    case CHECKPOINT_LIXO7:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2352.20,2372.06,5.42,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO8;
		    }
		    case CHECKPOINT_LIXO8:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2247.05,2363.8,4.99,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO9;
		    }
		    case CHECKPOINT_LIXO9:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2253.13,2370.80,5.00,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO10;
		    }
		    case CHECKPOINT_LIXO10:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2352.34,2421.16,7.16,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO11;
		    }
		    case CHECKPOINT_LIXO11:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2388.12,2440.35,9.86,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO12;
		    }
		    case CHECKPOINT_LIXO12:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2383.79,2412.92,8.89,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO13;
		    }
		    case CHECKPOINT_LIXO13:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2421.83,2422.53,13.05,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO14;
		    }
		    case CHECKPOINT_LIXO14:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2421.40,2446.10,12.97,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO15;
		    }
      		case CHECKPOINT_LIXO15:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2421.76,2484.56,13.16,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO16;
		    }
		    case CHECKPOINT_LIXO16:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2445.68,2485.18,15.32,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO17;
		    }
		    case CHECKPOINT_LIXO17:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2460.65,2509.11,16.88,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO18;
		    }
		    case CHECKPOINT_LIXO18:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2488.62,2539.08,18.06,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO19;
		    }
		    case CHECKPOINT_LIXO19:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2466.58,2444.54,15.79,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO20;
		    }
		    case CHECKPOINT_LIXO20:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2623.52,2425.64,14.26,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO21;
		    }
		    case CHECKPOINT_LIXO21:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2622.70,2400.43,11.67,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO22;
		    }
		    case CHECKPOINT_LIXO22:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2625.12,2375.23,9.42,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO23;
		    }
		    case CHECKPOINT_LIXO23:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2608.09,2341.81,8.38,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO24;
		    }
		    case CHECKPOINT_LIXO24:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2625.63,2348.94,8.51,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO25;
		    }
		    case CHECKPOINT_LIXO25:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2627.11,2314.40,8.31,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO26;
		    }
		    case CHECKPOINT_LIXO26:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2626.84,2287.54,8.31,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO27;
		    }
		    case CHECKPOINT_LIXO27:
		    {
		    if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				SetPlayerCheckpoint(playerid,-2605.36,2280.35,8.36,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO28;
		    }
		    case CHECKPOINT_LIXO28:
		    {
      if(GetPlayerState(playerid) != 1)
		    {
		    	GameTextForPlayer(playerid, "~w~Voce deve estar~n~~r~a pe!", 1000, 1);
		    	return 1;
			}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				GameTextForPlayer(playerid, "~w~Cidade~r~Limpa", 5000, 1);
				SendClientMessage(playerid, COLOR_GREEN, "Pronto, voce limpou a cidade, agora deposite o lixo no local do radar.");
				SetPlayerCheckpoint(playerid,-765.73,2886.82,38.79,8.5);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO29;
		    }
		    case CHECKPOINT_LIXO29:
		    {
		    	PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				GivePlayerMoney(playerid,350);
				DisablePlayerCheckpoint(playerid);
				Lixeiro[playerid] = 0;
				ComandosDesativados[playerid] = 0;
				SendClientMessage(playerid, COLOR_GREEN, "Lixo depositado, voce recebeu $350.");
				GameTextForPlayer(playerid, "~w~Lixo~n~~y~Depositado", 5000, 1);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		    }
		    case CHECKPOINT_LADRAOBANCO:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				RouboBanco[playerid] = 0;
				ComandosDesativados[playerid] = 0;
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				GameTextForPlayer(playerid, "~w~Se esconda~n~~y~na casa", 5000, 1);
		    }
		    case CHECKPOINT_INIPOS:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,-2093.98,2313.94,350.91);
				GameTextForPlayer(playerid, "~y~Wooohaa!!...", 5000, 1);
				ComandosDesativados2[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		    }
		case CHECKPOINT_DROGASINICIO:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Ponto final de~n~~r~Drogas", 5000, 1);
		   		DisablePlayerCheckpoint(playerid);
		   		SendClientMessage(playerid, COLOR_GREEN, "Pronto, voce pegou 100 gramas de drogas, negocie com usuarios.");
                PlayerInfo[playerid][pTrDrogas] = PlayerInfo[playerid][pTrDrogas] + 100;
                ComandosDesativados[playerid] = 0;
                missao1[playerid] = 0;
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			}
		case CHECKPOINT_DROGASFINAL:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Ponto de~n~~r~Drogas", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Comprou 100 gramas de drogas por $50, corra para a casa no radar para pegar.");
		   		DisablePlayerCheckpoint(playerid);
                GivePlayerMoney(playerid,-50);
		   		SetPlayerCheckpoint(playerid,-1322.48,2497.31,87.05,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_DROGASINICIO;
			}
		case CHECKPOINT_NARCOINICIO:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Entregue a ~r~maleta", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Leve todo o dinheiro contido na maleta para o barco dos negociantes.");
		   		DisablePlayerCheckpoint(playerid);
		   		SetPlayerCheckpoint(playerid,-1425.54,1490.50,1.87,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NARCOBARCO;
			}
		case CHECKPOINT_NARCOBARCO:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Entregue o ~r~recibo", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Pegue o recibo da compra e leve para seu chefe na lanchonete.");
		   		DisablePlayerCheckpoint(playerid);
		   		SetPlayerCheckpoint(playerid,-1940.45,2379.98,49.70,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NARCOFINAL;
			}
		case CHECKPOINT_NARCOFINAL:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Missao completa", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Recibo entregue, seu chefe te pagou $250.");
		   		DisablePlayerCheckpoint(playerid);
		   		ComandosDesativados[playerid] = 0;
		   		GivePlayerMoney(playerid,250);
		   		missao2[playerid] = 0;
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			}
		case CHECKPOINT_PIRATAINI:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Pegue o ~r~produto", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Entre no navio e pegue seu produto falsificado.");
		   		SetPlayerPos(playerid,-2329.10,1530.41,17.33);
		   		DisablePlayerCheckpoint(playerid);
		   		SetPlayerCheckpoint(playerid,-2372.10,1551.64,2.12,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_PIRATANAVIO;
			}
 		case CHECKPOINT_PIRATANAVIO:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Va para o ~r~ponto", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Pule daqui e va ate outro ponto indicado, cuidado pra nao molhar a mercadoria.");
			   	DisablePlayerCheckpoint(playerid);
	  			SetPlayerCheckpoint(playerid,-2436.35,1528.98,17.34,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_PIRATANAVIO2;
			}
   		case CHECKPOINT_PIRATANAVIO2:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Va para o ~r~ponto", 5000, 1);
		   		SendClientMessage(playerid, COLOR_GREEN, "Corra para a rampa.");
		   		DisablePlayerCheckpoint(playerid);
	   			SetPlayerPos(playerid,-2436.29,1524.75,18.19);
	   			SetPlayerCheckpoint(playerid,-2650.08,1361.02,7.31,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_PIRATARAMPA;
			}
		case CHECKPOINT_PIRATARAMPA:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~w~Suba a ~r~rampa", 5000, 1);
      			SendClientMessage(playerid, COLOR_GREEN, "Jogue o produto no mar, um pescador ira pegar depois. Cuidado para nao cair.");
		   		DisablePlayerCheckpoint(playerid);
		   		SetPlayerCheckpoint(playerid,-2659.74,1530.51,54.97,1.4);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_PIRATAFINAL;
			}
		case CHECKPOINT_PIRATAFINAL:
		    {
		   		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		   		GameTextForPlayer(playerid, "~r~Cuidado...", 5000, 1);
		   		SetPlayerPos(playerid,-2659.69,1534.64,54.42);
		   		SendClientMessage(playerid, COLOR_GREEN, "Voce caiu no mar e se molhou, mas conseguiu salvar o produto, o chefe te deu $220.");
		   		DisablePlayerCheckpoint(playerid);
		   		missao3[playerid] = 0;
		   		ComandosDesativados[playerid] = 0;
		   		GivePlayerMoney(playerid,220);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			}
		case CHECKPOINT_DM:
		    {
				gFightLeader++;
				gFighters++;
				gPlayerFighter[playerid] = 1;
				DisablePlayerCheckpoint(playerid);
				gTeam[playerid] = 4;
				SetPlayerToTeamColor(playerid);
				SetSpawnInfo(playerid, 1, PlayerInfo[playerid][pModel], gRandomDMSpawns[1][0], gRandomDMSpawns[1][1], gRandomDMSpawns[1][2], 1.0, -1, -1, -1, -1, -1, -1);
				if(gFighters >= 21)
				{
					gFighters = 2;
				}
				else
				{
					SetPlayerPos(playerid, gRandomDMSpawns[gFighters][0], gRandomDMSpawns[gFighters][1], gRandomDMSpawns[gFighters][2]); // Warp the player
				}
				if(dmweapon > 0)
				{
					ResetPlayerWeapons(playerid);
					GivePlayerWeapon(playerid, dmweapon, 999);
				}
				//SetPlayerWorldBounds(playerid,gDMWbounds[0],gDMWbounds[1],gDMWbounds[2],gDMWbounds[3]);
				SetPlayerFacingAngle(playerid, 270.0);
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				TogglePlayerControllable(playerid, 0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				format(string, sizeof(string), "~r~DeathMatch~n~~w~Waiting for more players");
				GameTextForPlayer(playerid, string, 5000, 3);
				if (gFightLeader == 2)
				{
					SetTimer("DMDelay", racedelay, 0);
					format(string, sizeof(string), "SMS: %d Seconds To DeathMatch Start, Sender: MOLE (555)",racedelay/1000);
					RingTone[playerid] = 20;
					BroadCast(COLOR_YELLOW, string);
				}
		    }
  		default:
	        {
				if ((gTeam[playerid]) != 2)
				{
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "~w~Defenda essa ~n~posicao");
					GameTextForPlayer(playerid, string, 5000, 1);
					if (gdebug){print("DEBUG crims protect");}
			    }
				if ((gTeam[playerid]) == 2)
				{
					PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "~w~Defenda essa~n~ posicao");
					GameTextForPlayer(playerid, string, 5000, 1);
					if (gdebug){print("DEBUG cops protect");}
			    }
	        }
	}
	return 1;
}

public RaceDebug(playerid)
{
	new string[256];
	format(string, sizeof(string), "gRaceFin(%d) gRaceMid(%d) gRaceMid2(%d) gRaceEnd(%d) gLaps(%d) RaceInfo[rLaps](%d) LapCount[playerid](%d)",gRaceFin,gRaceMid,gRaceMid2,gRaceEnd,gLaps,RaceInfo[rLaps],LapCount[playerid]);
	BroadCast(COLOR_WHITE, string);
}

public RaceEnd()
{
	CheckpointReset();
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			StartTime[i] = 0;
			LapCount[i] = 0;
		}
	}
	gRaceFin = 0;
	gRaceMid = 0;
	gRaceMid2 = 0;
	gRaceEnd = 0;
	gLaps = 0;
	BroadCast(COLOR_WHITE, "RACENEWS: ::: Race Over :::");
	MissionActive = 8;
	if (gdebug){print("DEBUG MissionActive = 8");}
}

public RaceDelay()
{
	if (gdebug >=1){printf("RaceDelay ");}
	new string[32];
	format(string, sizeof(string), "~r~Ready");
	new gdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if ((gPlayerCheckpointStatus[i] == CHECKPOINT_SRA) && gTeam[i] >= 3)
			{
				GameTextForPlayer(i, string, gdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}

		SetTimer("RaceDelayr", gdelay, 0);
		return 1;
}
public RaceDelayr()
{
if (gdebug >=1){printf("RaceDelayr");}
	new string[32];
	format(string, sizeof(string), "~y~Set");
	new hdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if ((gPlayerCheckpointStatus[i] == CHECKPOINT_SRA) && (gTeam[i] >= 3))
			{
				GameTextForPlayer(i, string, hdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}
		SetTimer("RaceDelayg", hdelay, 0);
		return 1;
}
public RaceDelayg()
{
if (gdebug >=1){printf("RaceDelayg");}
	new rdelay=1000;
	new string[32];
	format(string, sizeof(string), "~g~GO");
	gLaps = 0;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (gTeam[i] >= 3)
			{
				if (gPlayerCheckpointStatus[i] == CHECKPOINT_SRA)
				{
					GameTextForPlayer(i, string, rdelay, 6);
					PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(i,0,rsx,rsy,rsz,rmx,rmy,rmz, 8.0);
					gPlayerCheckpointStatus[i] = CHECKPOINT_SRA;
				}
				else
				{
					DisablePlayerCheckpoint(i);
					gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
				}
			}
		}
	}
		SetAllCopCheckpoint(rm2x,rm2y,rm2z, 8.0);
		MissionActive = 7;
		if (gdebug){print("DEBUG MissionActive = 7");}
		return 1;
}

public DMDelay()
{
	if (gdebug >=1){printf("DMDelay ");}
	new string[32];
	gFightLeader = 1000;
	format(string, sizeof(string), "~r~Ready");
	new gdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		DisablePlayerCheckpoint(i);
		if(IsPlayerConnected(i))
		{
			if (gPlayerFighter[i] == 1)
			{
				GameTextForPlayer(i, string, gdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}
		SetTimer("DMDelayr", gdelay, 0);
		return 1;
}
public DMDelayr()
{
if (gdebug >=1){printf("DMDelayr");}
	new string[32];
	format(string, sizeof(string), "~y~Set");
	new hdelay=1000;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (gPlayerFighter[i] == 1)
			{
				GameTextForPlayer(i, string, hdelay, 6);
				PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
			}
		}
	}
		SetTimer("DMDelayg", hdelay, 0);
		return 1;
}
public DMDelayg()
{
if (gdebug >=1){printf("DMDelayg");}
	new rdelay=1000;
	new string[32];
	format(string, sizeof(string), "~g~FIGHT");
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (gPlayerFighter[i] == 1)
			{
				GameTextForPlayer(i, string, rdelay, 6);
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				TogglePlayerControllable(i, 1);
			}
		}
	}
	MissionActive = 13;
	if (gdebug){print("DEBUG MissionActive = 13");}
	return 1;
}

public DMDetect()
{
	if(gFightLeader == 1000)
	{
		dmtimer++;
		PlayerInArena();
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1 && gPlayerFighter[i] == 1)
			{
				if(dmtime-dmtimer == 60)
				{
					GameTextForPlayer(i, "~r~One Minuite Remaining", 5000, 1);
				}
			}
		}
		if(dmtimer == dmtime)
		{
			new ename[MAX_PLAYER_NAME];
			new string[256];
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1 && gPlayerFighter[i] == 1 || IsPlayerConnected(i) == 1 && TVMode[i]>11 && TVMode[i]<20)
				{
					if(TVMode[i]>11 && TVMode[i]<20)
					{
						TVMode[i] = 0;
						Spectate[i] = 300;
					}
					TogglePlayerControllable(i, 0);
					if(IsPlayerConnected(DmHiPlayer) == 1)
					{
						GetPlayerPos(DmHiPlayer, DmeCam[0], DmeCam[1], DmeCam[2]);
						DmeCam[3] = DmeCam[0];
						DmeCam[4] = DmeCam[1]+2;
						DmeCam[5] = DmeCam[2]+0.2;
						DmeCam[2] = DmeCam[2]+0.6;
						SetPlayerFacingAngle(DmHiPlayer, 0.0);
						RewardCalc(DmHiPlayer,1000,10000);
						GetPlayerName(DmHiPlayer, ename, sizeof(ename));
						format(string, sizeof(string), "~r~DeathMatch Over~n~~b~Winner~n~~w~%s~n~kills:%d~n~~g~Prize:$%d", ename,DmHiScore, reward);
					}
					else
					{
						format(string, sizeof(string), "~r~DeathMatch Over~n~~b~No Winner");
						DmeCam[0] = gRandomDMSpawns[1][0];
						DmeCam[1] = gRandomDMSpawns[1][1];
						DmeCam[2] = gRandomDMSpawns[1][2];
						DmeCam[3] = DmeCam[0];
						DmeCam[4] = DmeCam[1];
						DmeCam[5] =DmeCam[2]+30;
					}
					DMEndCam(i,string);
				}
			}
		}
		if(dmtimer == dmtime+10)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					if(Spectate[i] == 300)
					{
						Spectate[i] = 253;
					}
					if(gPlayerFighter[i] == 1)
					{
						if(PlayerInfo[i][pTeam] != 3)
						{
							gTeam[i] = PlayerInfo[i][pTeam];
							SetPlayerToTeamColor(i);
						}
						gPlayerFighter[i] = 0;
						DmScore[i] = 0;
						TogglePlayerControllable(i, 1);
						SpawnPlayer(i);
						SetPlayerRandomSpawn(i);
					}
				}
			}
		}
		if(dmtimer == dmtime+11)
		{
			if(IsPlayerConnected(DmHiPlayer) == 1)
			{
				new ename[MAX_PLAYER_NAME];
				new string[256];
				PlayerPlaySound(DmHiPlayer, 1058, 0.0, 0.0, 0.0);
				GetPlayerName(DmHiPlayer, ename, sizeof(ename));
				GivePlayerMoney(DmHiPlayer, reward);
				format(string, sizeof(string), "~g~JOB COMPLETE~n~~w~Your cut was~n~~g~$%d", reward);
				PlayerPlayMusic(DmHiPlayer);
				GameTextForPlayer(DmHiPlayer, string, 5000, 6);
				format(string, sizeof(string), "%s Won A Deathmatch With A Total Of %d Kills For $%d", ename,DmHiScore, reward);
				BroadCast(COLOR_YELLOW, string);
				//SetPlayerPos(DmHiPlayer,gRandomDMSpawns[0][0],gRandomDMSpawns[0][1],gRandomDMSpawns[0][2]);
				if(PlayerInfo[DmHiPlayer][pTeam] != 1 && PlayerInfo[DmHiPlayer][pTeam] != 2)
				{
					SetPlayerCriminal(DmHiPlayer,255, "Mass Murder",1,1);
					gPlayerMission[DmHiPlayer] = 4;
				}
				else
				{
					PlayerInfo[DmHiPlayer][pWA] = PlayerInfo[DmHiPlayer][pWA]+5;
					if(PlayerInfo[DmHiPlayer][pWA] >= 20)
					{
						PlayerInfo[DmHiPlayer][pExp]++;
						PlayerInfo[DmHiPlayer][pWA] = PlayerInfo[DmHiPlayer][pWA]-20;
						SendClientMessage(DmHiPlayer, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
					}
				}
				BetWinner(DmHiPlayer,2);
			}
			gFighters = 0;
			gFightLeader = 0;
			MissionActive = 0;
			if (gdebug){print("DEBUG MissionActive = 0");}
			DmHiScore = 0;
			DmHiPlayer = 255;
			dmtimer = 0;
		}
	}
}

public DMEndCam(playerid,string[])
{
	GameTextForPlayer(playerid, string, 5000, 6);
	SetPlayerCameraPos(playerid,DmeCam[3], DmeCam[4], DmeCam[5]);
	SetPlayerCameraLookAt(playerid,DmeCam[0], DmeCam[1], DmeCam[2]);
}

public DMScoreCalc()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gPlayerFighter[i] == 1)
		{
			if(gPlayerFighter[i] == 1)
			{
				new tmp1 = DmScore[i];
				if(tmp1 > DmHiScore)
				{
					DmHiScore = tmp1;
					DmHiPlayer = i;
				}
			}
		}
	}
	return 1;
}


public OnPlayerDropCashBox(playerid)
{
if (gdebug >=1){printf("OnPlayerDropCashBox %d",playerid);}
	new string[128];
	new dname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, dname, sizeof(dname));
	format(string, sizeof(string), "Noticia de BS: %s Dropped The CashBox! :.", dname);
	BroadCast(COLOR_RED, string);
	GetPlayerPos(playerid, cwx, cwy, cwz);
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
				SetPlayerCheckpoint(i,cwx,cwy,cwz, 1.0);
				gPlayerCheckpointStatus[i] = CHECKPOINT_PICKUP;
		}
	}
	MissionActive = 3;
	if (gdebug){print("DEBUG MissionActive = 3;");}
	return 1;
}

public RewardCalc(playerid,min,max)
{
	reward = (min + (random(max-min)) + ((numplayers + PlayerInfo[playerid][pLevel]) *1000)); //minimum 1000 max 10000 + activeplayers x 1000
	printf("DEBUG RewardCalc = (Random(min=%d)(max=%d))(numplayers=%d)(PlayerInfo[playerid][pLevel]=%d) Total =%d",min,max,numplayers,PlayerInfo[playerid][pLevel],reward);
}

public CheckpointReset()
{
	if (gdebug >= 1){printf("DEBUG CheckpointReset()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			DisablePlayerCheckpoint(i);
			gPlayerLapStatus[i] = 0;
			gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
		}
	}

}

public JobGive(playerid)
{
	if (gdebug >= 1){printf("DEBUG JobGive (%d)",playerid);}
	if(MissionActive == 1)
	{

		SendClientMessage(playerid, COLOR_YELLOW, objstore);
		SetPlayerCheckpoint(playerid,cwx, cwy, cwz, 1.4);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_PICKUP;
		RingTone[playerid] = 20;
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: Go To The Red Marker And Steal The CashBox.");
		GameTextForPlayer(playerid, "~w~Waypoint set ~n~~r~CashBox", 5000, 1);
		return 1;
	}
	if(MissionActive == 5)
	{
		format(objstore, sizeof(objstore), "SMS: StreetRace Starting Soon At The Red Marker, Sender: MOLE (555)");
		SendClientMessage(playerid, COLOR_YELLOW, objstore);
		RingTone[playerid] = 20;
		SetPlayerRaceCheckpoint(playerid,0,rsx,rsy,rsz, rmx,rmy,rmz, 8.0);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_SR1START;
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: Go To The Red Marker And Wait For The Race To Start.");
		GameTextForPlayer(playerid, "~w~Waypoint set ~n~~r~StreetRace", 5000, 1);
		return 1;
	}
	if(MissionActive == 9)
	{
		SendClientMessage(playerid, COLOR_YELLOW, objstore);
		RingTone[playerid] = 20;
		SetVehicleParamsForPlayer(stealcar,playerid,1,0);
		SendClientMessage(playerid, COLOR_WHITE, "AVISO: Go To The Yellow Marker And Steal The Car.");
		GameTextForPlayer(playerid, "~w~Waypoint set ~n~~y~The Car", 5000, 1);
		return 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_YELLOW, "SMS: I Got Nothing Right Now, Sender: MOLE (555)");
		RingTone[playerid] = 20;
	}
	return 1;
}

public SetAllPlayerCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num)
{
	if (gdebug >= 1){printf("DEBUG SetAllPlayerCheckpoint()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			SetPlayerCheckpoint(i,allx,ally,allz, radi);
			if (num != 255)
			{
				gPlayerCheckpointStatus[i] = num;
			}
		}
	}

}

public SetAllCopCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi)
{
	if (gdebug >= 1){printf("DEBUG SetAllCopCheckpoint()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(gTeam[i] == 2)
			{
				SetPlayerCheckpoint(i,allx,ally,allz, radi);
			}
		}
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
if (gdebug >=1){printf("OnPlayerStateChange %d %d %d",playerid, newstate, oldstate);}
	if((newstate == 2 || newstate == 3) && nocarcash)
	{
		if (gPlayerCheckpointStatus[playerid] == CHECKPOINT_DROPOFF)
		{
			if (gdebug){print("DEBUG test6");}
			DisablePlayerCheckpoint(playerid);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
			new check = gPlayerCheckpointStatus[playerid];
			if (gdebug){printf("DEBUG check %d" ,check);}
			OnPlayerDropCashBox(playerid);
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		JogadorNoCarro[playerid] = 0;
		if(gTeam[playerid] >= 4 && LapCount[playerid] > 0)
		{
			new count;
			new string[256];
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gTeam[i] == 2 && CrimInRange(50.0, playerid,i))
				{
					count = 1;
					format(string, sizeof(string), "~p~Racer ~w~Jailed~n~Bonus Paycheck ~n~~g~$%d", 10000);
					GameTextForPlayer(i, string, 5000, 1);
					GivePlayerMoney(i, 10000);
					PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
					PlayerInfo[i][pWA] = PlayerInfo[i][pWA]+2;
					if(PlayerInfo[i][pWA] >= 20)
					{
						PlayerInfo[i][pExp]++;
						PlayerInfo[i][pWA] = 0;
						SendClientMessage(i, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
					}
				}
			}
			if(count == 1)
			{
				new name [MAX_PLAYER_NAME];
				GetPlayerName(playerid, name, sizeof(name));
				format(string, sizeof(string), "RACENEWS: %s Has Been Busted Buy The Cops.", name);
				BroadCast(COLOR_WHITE, string);
				SetPlayerInterior(playerid,6);
				LapCount[playerid] = 0;
				PlayerInfo[playerid][pInt] = 6;
				SetPlayerPos(playerid,264.395200,77.564040,1001.039000);
				SendClientMessage(playerid, COLOR_GRAD1,"   You have been jailed for street racing (type /time).");
				PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
				JailTime[playerid] = 60;
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER) //buggy dont finnish
	{
	if (gTeam[playerid] == 6)
	{
		if(RouboCarro[playerid] == 0)
		{
			new string[256];
			new sendername[MAX_PLAYER_NAME];
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "Noticia de BS: %s roubou um carro e esta sendo proucurado pela policia",sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
				new carid = GetPlayerVehicleID(playerid);
				SetVehicleParamsForPlayer(carid,playerid,1,0);
				RouboCarro[playerid] = 1;
				ComandosDesativados[playerid] = 1;
				GameTextForPlayer(playerid, "~w~Carro~n~~r~roubado", 5000, 1);
				SetPlayerCheckpoint(playerid,-361.13,1197.41,19.72,4.0);
				SendClientMessage(playerid, COLOR_GREEN, "Carro roubado, prossiga para o ponto no radar e entregue-o.");
       			gPlayerCheckpointStatus[playerid] = CHECKPOINT_CARROROUBADO;
		}
		new newcar = GetPlayerVehicleID(playerid);
		new oldcar = gLastCar[playerid];
		new housecar = PlayerInfo[playerid][pPhousekey]+1;
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		JogadorNoCarro[playerid] = 1;
		if (gdebug >=1){printf("oldcar %d, newcar %d",oldcar,newcar);}
		if(IsATruck(newcar))
		{
			new string[256];
			format(string, sizeof(string), "Components: %d/%d", PlayerHaul[newcar][pLoad],PlayerHaul[newcar][pCapasity]);
			SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
			SendClientMessage(playerid, COLOR_WHITE, "INFO: You can deliver components to business");
			SendClientMessage(playerid, COLOR_WHITE, "INFO: Commands are /load /buycomp /sellcomp /bestsale");
		}
		if(newcar >= 71 && newcar <= 74)
		{
			if (HireCar[playerid] != newcar)
			{
				new string[128];
				format(string, sizeof(string), "~w~You can Rent this car~n~Cost:~g~$%d~n~~w~To rent type ~g~/rentcar~w~~n~to get out type ~r~/exit",BizzInfo[8][bEntcost]);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, string, 5000, 3);
			}

		}
		if(newcar >=1 && newcar <=255)
		{
			if(PlayerInfo[playerid][pPetrol] <= 0)
			{
				TogglePlayerControllable(playerid, 0);
				Congelado[playerid] = 1;
				SendClientMessage(playerid, COLOR_RED, "Voce nao tem combustivel. Digite /sairdocarro ou /sdc para sair.");
			}

		}
		if(newcar >= 75 && newcar <= 77)
		{
			if (HireCar[playerid] != newcar)
			{
				new string[128];
				format(string, sizeof(string), "~w~You can Rent this car~n~Cost:~g~$%d~n~~w~To rent type ~g~/rentcar~w~~n~to get out type ~r~/exit",BizzInfo[9][bEntcost]);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, string, 5000, 3);
			}

		}
		if(oldcar != 301)
		{
			if((housecar != oldcar && oldcar != 0) && (HireCar[playerid] != oldcar && newcar != housecar))
			{
				if(gLastDriver[oldcar] == playerid && oldcar != newcar)
				{
					gLastDriver[oldcar] = 300;
					gCarLock[oldcar] = 0;
					UnLockCar(oldcar);
				}
			}
		}
		if(gTeamCarLock[newcar] == 1)
		{
			gTeamCarLock[newcar] = 0;
			UnLockCar(newcar);
		}
		gLastCar[playerid] = newcar;
		if (gdebug >=1){printf("gLastCar[playerid](%d)",gLastCar[playerid]);}
		gLastDriver[newcar] = playerid;
		if ((newcar == stealcar) && (MissionActive == 9))
		{
			RewardCalc(playerid,1000,10000);
		}
		if((newcar == stealcar) && (MissionActive >= 9))
		{
			if (gdebug){print("DEBUG TEST3");}
			if (gTeam[playerid] >= 3 && MissionActive >= 9)
			{
				if (gdebug){print("DEBUG TEST4");}
				new name[MAX_PLAYER_NAME];
				new string[256];
				GetPlayerName(playerid, name, sizeof(name));
				GetVehiclePos(stealcardest, cwx, cwy, cwz);
				GameTextForPlayer(playerid, "~w~Now get the ~y~Car~n~~w~to the ~r~Buyer", 5000, 1);
				format(string, sizeof(string), "%s Has Stolen A Car Worth $%d", name,reward);
				BroadCast(COLOR_YELLOW, string);
				SetAllPlayerCheckpoint(cwx, cwy, cwz, 16.0, 0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_CARDROP;
				MissionActive = 10;
				if (gdebug){print("DEBUG MissionActive = 10;");}
				if (gTeam[playerid] == 3)
				{
					SetPlayerCriminal(playerid,255, "Grand Theft Auto",0,0);
				}
				gSuperCop = playerid;
				OpenDoors();
			}
			if (gTeam[playerid] == 2 && MissionActive >= 10)
			{
				if (gdebug){print("DEBUG TEST6");}
				new name[MAX_PLAYER_NAME];
				new string[256];
				GetPlayerName(playerid, name, sizeof(name));
				cwx = 1539.1;
				cwy = -1668.0;
				cwz = 5.8;
				GameTextForPlayer(playerid, "~w~Return the ~y~car ~n~~w~to the ~r~Pound", 5000, 1);
				format(string, sizeof(string), "Officer %s Has Seized A Stolen Car Worth $%d", name,reward);
				BroadCast(COLOR_YELLOW, string);
				SetAllPlayerCheckpoint(cwx, cwy, cwz, 16.0, 0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_CARDROP;
				gSuperCop = playerid;
				MissionActive = 10;
				if (gdebug){print("DEBUG MissionActive = 10;");}
			}
		}
	}
	if(newstate == PLAYER_STATE_SPAWNED)
	{
		new Float: lwx, Float:lwy, Float:lwz;
		GetPlayerPos(playerid, lwx, lwy, lwz);
		if (gdebug >=1){printf("z =%f int =%d",lwz,PlayerInfo[playerid][pInt]);}
		if((lwz > 530.0 && PlayerInfo[playerid][pInt] == 0) || PlayerToPoint(1000.0, playerid, -1041.9,-1868.4,79.1)) //the highest land point in sa = 526.8
		{
			SetPlayerRandomSpawn(playerid);
			print("overhight or ob");
		}
		//SetPlayerInterior(playerid,0);
		if(dmweapon > 0 && gPlayerFighter[playerid] != 0)
		{
			GivePlayerWeapon(playerid, dmweapon, 999);
			if(PlayerInfo[playerid][pSHealth] < 50.0)
			{
				SetPlayerHealth(playerid, 100.0);
			}
			else
			{
				SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
			}
		}
		else
		{
			SetPlayerWeapons(playerid);
			SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]);
		}
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		gPlayerSpawned[playerid] = 1;
		SafeTime[playerid] = 60;
		//OnPlayerUpdate(playerid); //spawnsave
	}
	return 1;
}

public HireCost(carid)
{
	switch (carid)
	{
		case 69:
		{
			return 90000; //bullit
		}
		case 70:
		{
			return 130000; //infurnus
		}
		case 71:
		{
			return 100000; //turismo
		}
		case 72:
		{
			return 80000;
		}
		case 73:
		{
			return 70000;
		}
		case 74:
		{
			return 60000;
		}
	}
	return 0;
}

public CarCheck()
{
	if (gdebug >= 3){printf("DEBUG CarCheck()");}
	//new foundowner = -1;
	for(new c = 1; c < 254; c++)
	{
		if (gLastDriver[c] == 301)
		{
			CarRespawn(c);
		}
		if (gLastDriver[c] >= 300)
		{
			gLastDriver[c]++;
		}
		//foundowner = -1;
	}
	return 1;
}

public CarInit()
{
	if (gdebug >= 3){printf("DEBUG CarCheck()");}
	for(new c = 1; c < 254; c++)
	{
 		gLastDriver[c] = 299;
		gTeamCarLock[c] = 0;
		//gCarLock[c] = 0;
	}
	gLastDriver[301]=255;
	return 1;
}

public CarTow(carid)
{
	if (gdebug >= 1){printf("DEBUG CarRespawn(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInVehicle(i, carid) || HireCar[i] == carid)
			{
				gLastDriver[carid] = 255;
				return 0;
			}
		}
	}
	SetVehiclePos(carid,HouseCarSpawns[carid-1][0], HouseCarSpawns[carid-1][1], HouseCarSpawns[carid-1][2]);
	SetVehicleZAngle(carid, HouseCarSpawns[carid-1][3]);
	return 1;
}

public CarRespawn(carid)
{
	if (gdebug >= 1){printf("DEBUG CarRespawn(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInVehicle(i, carid) || HireCar[i] == carid)
			{
				gLastDriver[carid] = 255;
				return 0;
			}
		}
	}
	SetVehicleToRespawn(carid);
	gLastDriver[carid] = 299;
	TeamLockReset(carid);
	return 1;
}

public LockCar(carid)
{
	if (gdebug >= 1){printf("DEBUG LockCar(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(stealcar == carid)
			{
				SetVehicleParamsForPlayer(carid,i,1,1);
			}
			else
			{
				SetVehicleParamsForPlayer(carid,i,0,1);
			}
		}
	}
}

public UnLockCar(carid)
{
	if (gdebug >= 1){printf("DEBUG UnLockCar(%d)",carid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(stealcar == carid)
			{
				SetVehicleParamsForPlayer(carid,i,1,0);
			}
			else
			{
				if(!IsAPlane(carid))
				{
					SetVehicleParamsForPlayer(carid,i,0,0);
				}
			}
		}
	}
}

public OpenDoors()
{
	if (gdebug >= 1){printf("DEBUG OpenDoors()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			SetVehicleParamsForPlayer(stealcar,i,1,0);
		}
	}
}

public TeamCarLockInit()
{
	if (gdebug >= 1){printf("DEBUG TeamCarLockInit()");}
	for(new c = 0; c <= 200; c++)
	{
		if ((c >= 23) && (c <= 48))
		{
			gTeamCarLock[c] = 2;
		}
		if ((c >= 49) && (c <= 51))
		{
			gTeamCarLock[c] = 4;
		}
		if ((c >= 52) && (c <= 200))
		{
			gTeamCarLock[c] = 1;
		}
			gCarLock[c] = 0;
	}
	return 1;
}

public TeamLockReset(carid)
{
	if (gdebug >= 3){printf("DEBUG TeamLockReset(carid)",carid);}
	if (!teamcarlock)
	{
		return 0;
	}
	//DebugPrint("TeamLockReset()",0,0,1);
	if ((carid >= 23) && (carid <= 48))
	{
		gTeamCarLock[carid] = 2;
	}
	if ((carid >= 49) && (carid <= 51))
	{
		gTeamCarLock[carid] = 4;
	}
	if ((carid >= 52) && (carid <= 200))
	{
		gTeamCarLock[carid] = 1;
	}
	gCarLock[carid] = 0;
	return 1;
}

public InitLockDoors(playerid)
{
	if (gdebug >= 1){printf("DEBUG1 InitLockDoors(%d)",playerid);}
	new c;
	while (c < 254)
	{
		c++;
		if (gCarLock[c] == 1)
		{
			if (gdebug >= 1){printf("DEBUG3 InitLockDoors(%d)car(%d)",playerid,c);}
			SetVehicleParamsForPlayer(c,playerid,0,1);
		}
	}
	if(PLicence[playerid] != 1)
	{
		SetVehicleParamsForPlayer(66,playerid,0,1);
		SetVehicleParamsForPlayer(67,playerid,0,1);
		SetVehicleParamsForPlayer(68,playerid,0,1);
		SetVehicleParamsForPlayer(69,playerid,0,1);
		SetVehicleParamsForPlayer(70,playerid,0,1);
		SetVehicleParamsForPlayer(71,playerid,0,1);
	}
	return 1;
}
public TeamLockDoors(playerid)
{
	if (gdebug >= 1){printf("DEBUG TeamLockDoors(%d)",playerid);}
	new c =0;
	while (c <= 200)
	{
		c++;
		if (gCarLock[c] == 1)
		{
			SetVehicleParamsForPlayer(c,playerid,0,1);
		}
		if (gTeamCarLock[c] == 1)
		{
			if(gTeam[playerid] != 1 && gTeam[playerid] != 3)
			{
				SetVehicleParamsForPlayer(c,playerid,0,1);
			}
			else
			{
				SetVehicleParamsForPlayer(c,playerid,0,0);
			}
		}
		if (gTeamCarLock[c] == 2)
		{
			if(gTeam[playerid] != 2)
			{
				SetVehicleParamsForPlayer(c,playerid,0,1);
			}
			else
			{
				SetVehicleParamsForPlayer(c,playerid,0,0);
			}
		}
		if (gTeamCarLock[c] == 4)
		{
			if(gTeam[playerid] != 4)
			{
				SetVehicleParamsForPlayer(c,playerid,0,1);
			}
			else
			{
				SetVehicleParamsForPlayer(c,playerid,0,0);
			}
		}
		if (gTeamCarLock[c] == 0)
		{
				SetVehicleParamsForPlayer(c,playerid,0,0);
		}
	}
	return 1;
}

public DebugPrint(string[],value1,value2,type)
{
	new formated[256];
	if (gdebug >= 2 && type == 1)
	{
		format(formated, sizeof(formated), "Debug:(%d) %s: %d",value1,string,value2);
		printf("%s",formated);
		SendClientMessageToAll(COLOR_WHITE, formated);
	}
	return 1;
}


public OnPlayerExitVehicle(playerid, vehicleid)
{
	if (gdebug >= 1){printf("DEBUG OnPlayerExitVehicle(%d, %d)", playerid, vehicleid);}
	if (GetPlayerState(playerid) == 1)
	{
		return 1;
	}
	new string[256];
	new ename[MAX_PLAYER_NAME];
	if (vehicleid == stealcar && (MissionActive == 10 || MissionActive == 101))
	{
		GameTextForPlayer(playerid, "~w~Get back in the ~n~~r~Car", 5000, 1);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				SetVehicleParamsForPlayer(stealcar,i,1,0);
			}
		}
		if (playerid == gSuperCop)
		{
			gSuperCop = 255;
		}
		CheckpointReset();
		MissionActive = 101;
		if (gdebug){print("DEBUG MissionActive = 101");}
	}
	else if (gTeam[playerid] >= 4 && vehicleid == stealcar && MissionActive == 11 && gSuperCop == playerid)
	{
		if (gdebug){print("DEBUG CHECKPOINT_CARDROP");}
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		GetPlayerName(playerid, ename, sizeof(ename));
		GivePlayerMoney(playerid, reward);
		preward = reward;
		format(string, sizeof(string), "~g~CAR DELIVERED~n~~w~Your were paid ~n~~g~$%d", reward);
		PlayerPlayMusic(playerid);
		GameTextForPlayer(playerid, string, 5000, 6);
		format(string, sizeof(string), "%s Just Sold A Hot Car For $%d.", ename,reward);
		BroadCast(COLOR_YELLOW, string);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				SetVehicleParamsForPlayer(stealcar,i,0,0);
			}
		}
		if (playerid != gPublicEnemy)
		{
			gPlayerMission[playerid] = 3;
			SetPlayerCriminal(playerid,255, "Grand Theft Auto",1,1);
		}
		CheckpointReset();
		SetVehicleToRespawn(stealcar);
		stealcar = -1;
		MissionActive = 12;
		if (gdebug){print("DEBUG MissionActive = 12");}
	}
	else if (gTeam[playerid] == 2 && vehicleid == stealcar && MissionActive == 11 && gSuperCop == playerid)
	{
		if (gdebug){print("DEBUG CHECKPOINT_CARDROP");}
		PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		GetPlayerName(playerid, ename, sizeof(ename));
		GivePlayerMoney(playerid, reward);
		PlayerInfo[playerid][pHW]++;
		if(PlayerInfo[playerid][pHW] >= 3)
		{
			PlayerInfo[playerid][pExp]++;
			PlayerInfo[playerid][pHW] = 0;
			SendClientMessage(playerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
		}
		format(string, sizeof(string), "~g~CAR RETURNED~n~~w~Bonus Paycheck ~n~~g~$%d", reward);
		PlayerPlayMusic(playerid);
		GameTextForPlayer(playerid, string, 5000, 6);
		format(string, sizeof(string), "Officer %s Just Returned A Stolen Car For $%d.", ename,reward);
		BroadCast(COLOR_YELLOW, string);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				SetVehicleParamsForPlayer(stealcar,i,0,0);
			}
		}
		CheckpointReset();
		SetVehicleToRespawn(stealcar);
		stealcar = -1;
		MissionActive = 12;
		if (gdebug){print("DEBUG MissionActive = 12");}
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	new string[128];
	PlayerInfo[playerid][pModel] = Peds[classid][0];
	//printf("pppm = %d classid == %d Peds[classid][0]= %d",PlayerInfo[playerid][pModel],classid,Peds[classid][0]);
	if(classid >= 260)
	{
	if (PlayerInfo[playerid][pAdmin] >= 1)
		{
		format(string, sizeof(string), "~b~DPSA~n~ ~w~Manter a lei");
		GameTextForPlayer(playerid,string,3500,6);
		EscolhendoClasse[playerid] = 1;
		gTeam[playerid] = 2;
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		}
		else
		{
		GameTextForPlayer(playerid, "~w~Voce nao tem ~n~~r~permissao", 5000, 1);
		}
	}
	else if (classid >= 255 && classid <= 259)
	{
			format(string, sizeof(string), "~g~Paramedico~n~ ~w~Salvar vidas");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 1;
			Profissoes(playerid);
	}
	else if (classid >= 1 && classid <= 3)
	{
			format(string, sizeof(string), "~p~BALLAS~n~ ~w~Traficantes");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 5;
			Profissoes(playerid);
	}
	else if (classid >= 4 && classid <= 6)
	{
			format(string, sizeof(string), "~g~GROVE~n~ ~w~Ladroes de carros");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
            gTeam[playerid] = 6;
            Profissoes(playerid);
	}
	else if (classid >= 7 && classid <= 9)
	{
			format(string, sizeof(string), "~y~VAGOS~n~ ~w~Ladroes de banco");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 7;
			Profissoes(playerid);
	}
	else if (classid >= 10 && classid <= 12)
	{
			format(string, sizeof(string), "~b~AZTECAS~n~ ~w~Assasinos");
			GameTextForPlayer(playerid,string,3500,6);
  			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 8;
			Profissoes(playerid);
	}
	else if (classid >= 13 && classid <= 15)
	{
			format(string, sizeof(string), "~r~NANG~n~ ~w~Crime Organizado");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 9;
			Profissoes(playerid);
	}
 	else if (classid >= 16 && classid <= 21)
	{
			format(string, sizeof(string), "~r~MAFIA~n~ ~w~Hackers");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			Profissoes(playerid);
			gTeam[playerid] = 11;
	}
	else if (classid >= 22 && classid <= 24)
	{
			format(string, sizeof(string), "~r~MAFIA~n~ ~w~Pirataria");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 12;
			Profissoes(playerid);
	}
	else if (classid >= 25 && classid <= 27)
	{
			format(string, sizeof(string), "~r~TRIADS~n~ ~w~Narcotrafico");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 13;
			Profissoes(playerid);
	}
	else if (classid >= 28 && classid <= 30)
	{
			format(string, sizeof(string), "~r~BIKERS~n~ ~w~Trafico de armas");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 14;
			Profissoes(playerid);
	}
	else if (classid >= 31 && classid <= 33)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Pescador");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 15;
			Profissoes(playerid);
	}
	else if (classid >= 34 && classid <= 37)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Acompanhante");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 16;
			Profissoes(playerid);
	}
	else if (classid >= 38 && classid <= 41)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Cacador");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 17;
			Profissoes(playerid);
	}
	else if (classid >= 42 && classid <= 45)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Motorista");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 18;
			Profissoes(playerid);
	}
	else if (classid >= 46 && classid <= 49)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Taxista");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 19;
			Profissoes(playerid);
	}
	else if (classid >= 50 && classid <= 53)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Fiscal");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
   			gTeam[playerid] = 20;
   			Profissoes(playerid);
	}
	else if (classid >= 54 && classid <= 57)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Lixeiro");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 21;
			Profissoes(playerid);
	}
	else if (classid >= 58 && classid <= 61)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Motoboy");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 22;
			Profissoes(playerid);
	}
	else if (classid >= 62 && classid <= 65)
	{
			format(string, sizeof(string), "~r~TRABALHADOR~n~ ~w~Caminhoneiro");
			GameTextForPlayer(playerid,string,3500,6);
			EscolhendoClasse[playerid] = 1;
			gTeam[playerid] = 23;
			Profissoes(playerid);
	}
	else
	{
		format(string, sizeof(string), "~g~CIVIL~n~ ~w~Vida Normal");
		GameTextForPlayer(playerid,string,3500,6);
	}
	SetPlayerTeamFromClass(playerid,classid);
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
	switch (gTeam[playerid])
	{
		case TEAM_BLUE:
		{
			SetPlayerInterior(playerid,5);
			SetPlayerPos(playerid,323.4,305.6,999.1);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,323.4-1.5,305.6,999.1+0.7);
			SetPlayerCameraLookAt(playerid,323.4,305.6,999.1+0.7);

		}
		case TEAM_CYAN:
		{
			SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,1187.0,-1295.8,13.5);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerCameraPos(playerid,1187.0+1.5,-1295.8,13.5+0.7);
			SetPlayerCameraLookAt(playerid,1187.0,-1295.8,13.5+0.7);
		}
		case TEAM_GREEN:
		{
			SetPlayerInterior(playerid,1);
			SetPlayerPos(playerid,1.81,28.71,1199.59);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerCameraPos(playerid,1.81+1.5,28.71,1199.59+0.7);
			SetPlayerCameraLookAt(playerid,1.81,28.71,1199.59+0.7);
		}
		default:
		{
			SetPlayerInterior(playerid,1);
			SetPlayerPos(playerid,1.81,28.71,1199.59);
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerCameraPos(playerid,1.81+1.5,28.71,1199.59+0.7);
			SetPlayerCameraLookAt(playerid,1.81,28.71,1199.59+0.7);
		}
	}
}

//---------------------------------------------------------

public SetPlayerTeamFromClass(playerid,classid)
{
	if (gdebug >= 2){printf("DEBUG SetPlayerTeamFromClass(%d, %d)", playerid, classid);}
	if(classid >= 260)
	{
		gTeam[playerid] = TEAM_BLUE;
		PlayerInfo[playerid][pTeam] = 2;
	}
	else if (classid >= 255 && classid <= 259)
	{
		gTeam[playerid] = TEAM_CYAN;
		PlayerInfo[playerid][pTeam] = 1;
	}
	else if (classid >= 1 && classid <= 3)
	{
		gTeam[playerid] = TEAM_BALLAS;
		PlayerInfo[playerid][pTeam] = 5;
	}
	else if (classid >= 4 && classid <= 6)
	{
		gTeam[playerid] = TEAM_GROVE;
		PlayerInfo[playerid][pTeam] = 6;
	}
	else if (classid >= 7 && classid <= 9)
	{
		gTeam[playerid] = TEAM_VAGOS;
		PlayerInfo[playerid][pTeam] = 7;
	}
	else if (classid >= 10 && classid <= 12)
	{
		gTeam[playerid] = TEAM_AZTECAS;
		PlayerInfo[playerid][pTeam] = 8;
	}
	else if (classid >= 13 && classid <= 15)
	{
		gTeam[playerid] = TEAM_NANG;
		PlayerInfo[playerid][pTeam] = 9;
	}
 	else if (classid >= 16 && classid <= 21)
	{
		gTeam[playerid] = TEAM_MAFIA;
		PlayerInfo[playerid][pTeam] = 11;
	}
	else if (classid >= 22 && classid <= 24)
	{
		gTeam[playerid] = TEAM_RMAFIA;
		PlayerInfo[playerid][pTeam] = 12;
	}
	else if (classid >= 25 && classid <= 27)
	{
		gTeam[playerid] = TEAM_TRIADS;
		PlayerInfo[playerid][pTeam] = 13;
	}
	else if (classid >= 28 && classid <= 30)
	{
		gTeam[playerid] = TEAM_BIKERS;
		PlayerInfo[playerid][pTeam] = 14;
	}
	else if (classid >= 31 && classid <= 33)
	{
		gTeam[playerid] = TEAM_PESCADOR;
		PlayerInfo[playerid][pTeam] = 15;
	}
	else if (classid >= 34 && classid <= 37)
	{
		gTeam[playerid] = TEAM_ACOMPANHANTE;
		PlayerInfo[playerid][pTeam] = 16;
	}
	else if (classid >= 38 && classid <=41)
	{
		gTeam[playerid] = TEAM_CACADOR;
		PlayerInfo[playerid][pTeam] = 17;
	}
	else if (classid >= 42 && classid <=45)
	{
		gTeam[playerid] = TEAM_MOTORISTA;
		PlayerInfo[playerid][pTeam] = 18;
	}
	else if (classid >= 46 && classid <=49)
	{
		gTeam[playerid] = TEAM_TAXISTA;
		PlayerInfo[playerid][pTeam] = 19;
	}
	else if (classid >= 50 && classid <=53)
	{
		gTeam[playerid] = TEAM_TAXISTA;
		PlayerInfo[playerid][pTeam] = 20;
	}
	else if (classid >= 54 && classid <=57)
	{
		gTeam[playerid] = TEAM_LIXEIRO;
		PlayerInfo[playerid][pTeam] = 21;
	}
	else if (classid >= 58 && classid <=61)
	{
		gTeam[playerid] = TEAM_MOTOBOY;
		PlayerInfo[playerid][pTeam] = 22;
	}
	else if (classid >= 62 && classid <=65)
	{
		gTeam[playerid] = TEAM_CAMINHONEIRO;
		PlayerInfo[playerid][pTeam] = 23;
	}
	else
	{
	    gTeam[playerid] = TEAM_GREEN;
	    PlayerInfo[playerid][pTeam] = 3;
	}
}

//---------------------------------------------------------

public SetPlayerCriminal(playerid,declare,reason[],pe,flash)
{
if (gdebug >= 1){printf("DEBUG SetPlayerCriminal(%d, %d ,%s ,%d ,%d)", playerid,declare,reason,pe,flash);}
	new turned[MAX_PLAYER_NAME];
	new turner[MAX_PLAYER_NAME];
	new turnmes[128];
	strmid(PlayerCrime[playerid][pAccusedof], reason, 0, strlen(reason), 255);
	GetPlayerName(playerid, turned, sizeof(turned));
	if (declare == 255)
	{
		format(turner, sizeof(turner), "Anonimo");
		strmid(PlayerCrime[playerid][pVictim], turner, 0, strlen(turner), 255);
	}
	else
	{
		GetPlayerName(declare, turner, sizeof(turner));
		strmid(PlayerCrime[playerid][pVictim], turner, 0, strlen(turner), 255);
		strmid(PlayerCrime[declare][pBplayer], turned, 0, strlen(turned), 255);
		strmid(PlayerCrime[declare][pAccusing], reason, 0, strlen(reason), 255);
	}
	if (pe == 1)
	{
		if (gPublicEnemy != INVALID_PLAYER_ID && gPublicEnemy != playerid)
		{
			OffTheHook();
			KillTimer(offhook);
	    }
		gPublicEnemy = playerid;
		format(turnmes, sizeof(turnmes), "SMS: %s, voce e o bandido mais proucurado %s. Evite morrer por %d minutos",turned,reason,petime/60000);
		RingTone[playerid] = 20;
		SendClientMessage(playerid, COLOR_YELLOW, turnmes);
		format(cbjstore, sizeof(cbjstore), "HQ: Todas as unidades se encaminhem a proucura do %s",turned);
		SendTeamBeepMessage(2, COLOR_DBLUE, cbjstore);
		format(turnmes, sizeof(turnmes), "HQ: Proucurado: %s, voce tem %d minutos.",reason,petime/60000);
		format(objstore, sizeof(objstore), "SMS: Mate esse otario %s, e pegue seu ultimo pagamento",turned);
		SendTeamMessage(2, COLOR_DBLUE, turnmes);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && gPublicEnemy != i && gTeam[i] >= 3)
			{
				SendClientMessage(i, COLOR_YELLOW, objstore);
				RingTone[i] = 20;
			}
		}
		SendTeamMessage(2, COLOR_WHITE, "AVISO: Mate o ponto piscando no radar por uma recompensa.");
		offhook = SetTimer("OffTheHook", petime, 0);

	}
    else
    {
		if ((gTeam[playerid]) == 1)//med kill criminal
		{
			format(turnmes, sizeof(turnmes), "Alerta: %s, os policiais estao atras de voce por %s paramedico Reporter: %s",turned,reason,turner);
		}
		else
		{
			format(turnmes, sizeof(turnmes), "Alerta: %s, os policiais estao atras de voce por %s. Reporter: %s",turned,reason,turner);
		}
		gTeam[playerid] = 4;//lawbreaker
		if (flash)
		{
			FlashTime[playerid] = 10;
		}
		else
		{
			SetPlayerToTeamColor(playerid);
		}
		SendClientMessage(playerid, COLOR_RED, turnmes);
	}
			print("DEBUG: 5");
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && (gTeam[i]) == 2 && gPublicEnemy != playerid)
		{
			format(cbjstore, sizeof(turnmes), "HQ: Todas unidades! Reporter: %s",turner);
			SendClientMessage(i, TEAM_BLUE_COLOR, cbjstore);
			format(cbjstore, sizeof(turnmes), "HQ: Crime: %s, Suspeito: %s",reason,turned);
			SendClientMessage(i, TEAM_BLUE_COLOR, cbjstore);
		}
	}
}
//---------------------------------------------------------

public SetPlayerFree(playerid,declare,reason[],pe,flash)
{
if (gdebug >= 1){printf("DEBUG SetPlayerFree(%d, %d ,%d ,%d)", playerid,declare,pe,flash);}
	ClearCrime(playerid);
	new turned[MAX_PLAYER_NAME];
	new turner[MAX_PLAYER_NAME];
	new turnmes[128];
	new crbjstore[128];
	if (declare == 255)
	{
		format(turner, sizeof(turner), "911");
	}
	else
	{
		GetPlayerName(declare, turner, sizeof(turner));
	}
	GetPlayerName(playerid, turned, sizeof(turned));
	if (PlayerInfo[playerid][pTeam] == 1)
	{
		gTeam[playerid] = 1;
	}
	else
	{
		gTeam[playerid] = 3;
	}
	if (flash)
	{
		FlashTime[playerid] = 10;
	}
	else
	{
		SetPlayerToTeamColor(playerid);
	}
	format(turnmes, sizeof(turnmes), "SMS: %s, por voce ter %s, voce nao e mais um criminoso",turned,reason);
	RingTone[playerid] = 20;
	SendClientMessage(playerid, COLOR_YELLOW, turnmes);
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && (gTeam[i]) == 2)
		{
			format(crbjstore, sizeof(crbjstore), "HQ: Todas unidades policiais %s completou a sua tarefa.",turner);
			SendClientMessage(i, COLOR_DBLUE, crbjstore);
			format(crbjstore, sizeof(crbjstore), "HQ: %s foi processado, %s",turned,reason);
			SendClientMessage(i, COLOR_DBLUE, crbjstore);
		}
	}
}
public OffTheHook()
{
if (gdebug >= 1){printf("DEBUG OffTheHook()");}
	new hookoff[128];
	new offhookn[MAX_PLAYER_NAME];
	new mission = gPlayerMission[gPublicEnemy];
	if(mission == 4)
	{
		mission = random(3)+1;
	}
	switch (mission)
	{
		case 1:
		{
			PlayerInfo[gPublicEnemy][pCB]++;
			if(PlayerInfo[gPublicEnemy][pCB] >= 4)
			{
				PlayerInfo[gPublicEnemy][pExp]++;
				PlayerInfo[gPublicEnemy][pCB] = 0;
				SendClientMessage(gPublicEnemy, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
			}
		}
		case 2:
		{
			PlayerInfo[gPublicEnemy][pSR]++;
			if(PlayerInfo[gPublicEnemy][pSR] >= 4)
			{
				PlayerInfo[gPublicEnemy][pExp]++;
				PlayerInfo[gPublicEnemy][pSR] = 0;
				SendClientMessage(gPublicEnemy, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
			}
		}
		case 3:
		{
			PlayerInfo[gPublicEnemy][pHW]++;
			if(PlayerInfo[gPublicEnemy][pHW] >= 4)
			{
				PlayerInfo[gPublicEnemy][pExp]++;
				PlayerInfo[gPublicEnemy][pHW] = 0;
				SendClientMessage(gPublicEnemy, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
			}
		}
		default:
		{
		}
	}
	SetPlayerToTeamColor(gPublicEnemy);
	GetPlayerName(gPublicEnemy, offhookn, sizeof(offhookn));
	format(hookoff, sizeof(hookoff), "NOTICIA: %s fugiu da policia e nao e mais um bandido",offhookn);
	RingTone[gPublicEnemy] = 20;
	SendClientMessageToAll(COLOR_PURPLE, hookoff);
	gPublicEnemy = INVALID_PLAYER_ID;
	return 1;
}

public CellPhoneTimer()
{
if (gdebug >= 3){printf("DEBUG CellPhoneTimer()");}
new string[64];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(CellTime[i] > 0)
			{
				if (CellTime[i] == cchargetime)
				{
					CellTime[i] = 1;
					if(Mobile[Mobile[i]] == i)
					{
						CallCost[i] = CallCost[i]+callcost;
					}
				}
				CellTime[i] = CellTime[i] +1;
				if (Mobile[Mobile[i]] == 255 && CellTime[i] == 5)
				{
					new called[MAX_PLAYER_NAME];
					GetPlayerName(Mobile[i], called, sizeof(called));
					format(string, sizeof(string), "* O telefone do %s esta tocando...", called);
					RingTone[Mobile[i]] = 10;
					ProxDetector(30.0, Mobile[i], string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
			}
			if(CellTime[i] == 0 && CallCost[i] > 0)
			{
				format(string, sizeof(string), "~w~Preco da ligacao~n~~r~$%d",CallCost[i]);
				GivePlayerMoney(i, -CallCost[i]);
				BizzInfo[10][bTakings] += CallCost[i];
				GameTextForPlayer(i, string, 5000, 1);
				CallCost[i] = 0;
			}

		}
	}
}

public SetPlayerFlash()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if (gPublicEnemy == i || gSuperCop == i)
		{
			FlashTime[i] = 3;
		}
		if(IsPlayerConnected(i) == 1 && FlashTime[i] > 0)
		{
			FlashTime[i]--;
			SetPlayerToTeamColorFlash(i);
		}
	}
	SetTimer("SetPlayerFlashRev", 100000, 0);
	return 1;
}

public SetPlayerFlashRev()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && FlashTime[i] > 1)
		{
			FlashTime[i]--;
			SetPlayerColor(i,COLOR_INVIS); // invisibil
		}
	}
	SetTimer("SetPlayerFlash", 1000000, 0);
	return 1;
}


public RingToner()
{
//if (gdebug >= 2){printf("DEBUG RingToner()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && RingTone[i] != 6 && RingTone[i] != 0 && RingTone[i] < 11)
		{
			//printf("RingTone %d %d",i,RingTone[i]);
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1138, 0.0, 0.0, 0.0);
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 6)
		{
			RingTone[i] = RingTone[i] -1;
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 20)
		{
			//printf("RingTone %d %d",i,RingTone[i]);
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
		}
	}
	//RingTonerRev();
	SetTimer("RingTonerRev", 200, 0);
	return 1;
}

public RingTonerRev()
{
//if (gdebug >= 2){printf("DEBUG SetPlayerFlashRev()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1  && RingTone[i] != 5 && RingTone[i] != 0 && RingTone[i] < 10)
		{
			RingTone[i] = RingTone[i] -1;
			PlayerPlaySound(i, 1137, 0.0, 0.0, 0.0);
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 5)
		{
			RingTone[i] = RingTone[i] -1;
		}
		if(IsPlayerConnected(i) == 1 && RingTone[i] == 19)
		{
			//printf("RingTone %d %d",i,RingTone[i]);
			PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
			RingTone[i] = 0;
		}
	}
	SetTimer("RingToner", 500, 0);
	return 1;
}

public SetPlayerUnjail()
{
if (gdebug >= 3){printf("DEBUG SetPlayerUnjail()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && JailTime[i] < 0)
		{
			JailTime[i]++;
			//printf("JailTime %d %d",i,JailTime[i]);
		}
		if(IsPlayerConnected(i) == 1 && JailTime[i] > 0)
		{
			JailTime[i]--;
			//printf("JailTime %d %d",i,JailTime[i]);
		}
		if(IsPlayerConnected(i) == 1 && JailTime[i] == 10)
		{
			new string[128];
			//printf("JailTime %d %d",i,JailTime[i]);
			FlashTime[i] = 0;
			SetPlayerPos(i,268.3,77.4,1001.0);
			SendClientMessage(i, COLOR_GRAD1,"   Voce pagou o debito com a sociedade.");
			format(string, sizeof(string), "~g~Liberdade!~n~~w~tente ser um melhor cidadao");
			GameTextForPlayer(i, string, 5000, 1);
			PlayJailSound(1165 , 1166, 1000,264.395200, 77.564040, 1001.039000);
		}
	}
}

public VoteKickTimer()
{
if (gdebug >= 3){printf("DEBUG VoteKickTimer()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && VoteKick[i] > 0)
		{
			VoteKick[i]++;
			//printf("VoteKick %d VoteKick[%d] KickVote[%d]",i,VoteKick[i],KickVote[i]);
			if(IsPlayerConnected(i) == 1 && VoteKick[i] == 20)
			{
				if(KickVote[i] >= numplayers/4)
				{
					new string[128];
					new accused[MAX_PLAYER_NAME];
					GetPlayerName(i, accused, sizeof(accused));
					format(string, sizeof(string), "Votado: %s foi votado para ser tirado do servidor",accused);
					BroadCast(COLOR_RED,string);
					ClearVote(i);
					Kick(i);
				}
				else
				{
					new string[128];
					new accused[MAX_PLAYER_NAME];
					GetPlayerName(i, accused, sizeof(accused));
					format(string, sizeof(string), "Voto falhou: %s nao sera tirado",accused);
					BroadCast(COLOR_RED,string);
					ClearVote(i);
				}
			}
		}
	}
}

public ClearVote(kickedid)
{
	KickVote[kickedid] = 0;
	VoteKick[kickedid] = 0;
	for(new j = 0; j <= MAX_PLAYERS; j++)
	{
		if(IsPlayerConnected(j) == 1 && LastVote[j] == kickedid)
		{
			LastVote[j] = 255;
		}
	}
}



public SetPlayerWeapons(playerid)
{
	if (gdebug >= 1){printf("DEBUG SetPlayerWeapons(%d)",playerid);}
	//ResetPlayerWeapons(playerid);
	if(PlayerInfo[playerid][pGun1] == 0)
	{
    PlayerInfo[playerid][pGun1] = 5;
    }
	if (PlayerInfo[playerid][pGun1] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun1], PlayerInfo[playerid][pAmmo1]);
	}
	if(gTeam[playerid] == 1)
	{
		GivePlayerWeapon(playerid, 4, 0);
	}
	if(gTeam[playerid] == 2)
	{
		GivePlayerWeapon(playerid, 3, 0);
		//GivePlayerWeapon(playerid, 41, 500); //spray
	}
	if(gTeam[playerid] >= 3)
	{
		GivePlayerWeapon(playerid, 5, 0);
	}
	if (PlayerInfo[playerid][pGun2] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun2], PlayerInfo[playerid][pAmmo2]);
	}
	if (PlayerInfo[playerid][pGun3] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun3], PlayerInfo[playerid][pAmmo3]);
	}
	if (PlayerInfo[playerid][pGun4] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun4], PlayerInfo[playerid][pAmmo4]);
	}
	if (PlayerInfo[playerid][pGun5] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun5], PlayerInfo[playerid][pAmmo5]);
	}
	if (PlayerInfo[playerid][pGun6] > 0)
	{
		GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun6], PlayerInfo[playerid][pAmmo6]);
	}
}

public PrintSBizInfo(playerid,targetid)
{
	new coordsstring[256];
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	format(coordsstring, sizeof(coordsstring),"*** %s ***",SBizzInfo[targetid][sbDiscription]);
	SendClientMessage(playerid, COLOR_WHITE,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Fechado: %d Entrada: $%d Caixa: $%d", SBizzInfo[targetid][sbLock], SBizzInfo[targetid][sbEntcost], SBizzInfo[targetid][sbTakings]);
	SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Produto: %d/%d Componentes: %d/%d", SBizzInfo[targetid][sbProd],SBizzInfo[targetid][sbProdCap],SBizzInfo[targetid][sbComp],SBizzInfo[targetid][sbCompCap]);
	SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Produtos por componente: %d Pagando $%d",SBizzInfo[targetid][sbProdCost],SBizzInfo[targetid][sbPayComp]);
	SendClientMessage(playerid, COLOR_GRAD3,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Custo do produto $%d",(SBizzInfo[targetid][sbPayComp]/SBizzInfo[targetid][sbProdCost]));
	SendClientMessage(playerid, COLOR_GRAD4,coordsstring);
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
}

public PrintBizInfo(playerid,targetid)
{
	new coordsstring[256];
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	format(coordsstring, sizeof(coordsstring),"*** %s ***",BizzInfo[targetid][bDiscription]);
	SendClientMessage(playerid, COLOR_WHITE,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Fechado: %d Entrada: $%d Caixa: $%d", BizzInfo[targetid][bLock], BizzInfo[targetid][bEntcost], BizzInfo[targetid][bTakings]);
	SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Produto: %d/%d Componentes: %d/%d", BizzInfo[targetid][bProd],BizzInfo[targetid][bProdCap],BizzInfo[targetid][bComp],BizzInfo[targetid][bCompCap]);
	SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Produtos por componente: %d Pagando $%d",BizzInfo[targetid][bProdCost],BizzInfo[targetid][bPayComp]);
	SendClientMessage(playerid, COLOR_GRAD3,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Custo do produto $%d PrecoMod %d%",(BizzInfo[targetid][bPayComp]/BizzInfo[targetid][bProdCost]), BizzInfo[targetid][bPriceMod]);
	SendClientMessage(playerid, COLOR_GRAD4,coordsstring);
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
}


public PrintPlayerWeapons(playerid,targetid)
{
	if (gdebug >= 1){printf("DEBUG PrintPlayerWeapons(%d %d)",playerid,targetid);}
	new cash =  GetPlayerMoney(targetid);
	//new admin = PlayerInfo[targetid][pAdmin];
	new level = PlayerInfo[targetid][pLevel];
	new exp = PlayerInfo[targetid][pExp];
	new drog = PlayerInfo[targetid][pDrogaUso];
	new trdrog = PlayerInfo[targetid][pTrDrogas];
	new comb = PlayerInfo[targetid][pPetrol];
	new gun1 = PlayerInfo[targetid][pGun1];
	new gun2 = PlayerInfo[targetid][pGun2];
	new gun3 = PlayerInfo[targetid][pGun3];
	new gun4 = PlayerInfo[targetid][pGun4];
	new gun5 = PlayerInfo[targetid][pGun5];
	new gun6 = PlayerInfo[targetid][pGun6];
	new kills = PlayerInfo[targetid][pKills];
	new pwa = PlayerInfo[targetid][pWA] ;
	new pnumber = PlayerInfo[targetid][pPnumber];
	new account = PlayerInfo[targetid][pAccount];
	new nxtlevel = PlayerInfo[targetid][pLevel]+1;
	new expamount = nxtlevel*levelexp;
	new costlevel = nxtlevel*levelcost;//10k for testing purposes
	new housekey = PlayerInfo[targetid][pPhousekey];
	new bizkey = PlayerInfo[targetid][pPbiskey];
	new intir = PlayerInfo[playerid][pInt];
	new local = PlayerInfo[playerid][pLocal];
	new Float:shealth = PlayerInfo[targetid][pSHealth];
	new Float:health;
	new name[MAX_PLAYER_NAME];
	new sgun1[20];
	new sgun2[20];
	new sgun3[20];
	new sgun4[20];
	new sgun5[20];
	new sgun6[20];
	GetWeaponName(gun1, sgun1, 20);
	GetWeaponName(gun2, sgun2, 20);
	GetWeaponName(gun3, sgun3, 20);
	GetWeaponName(gun4, sgun4, 20);
	GetWeaponName(gun5, sgun5, 20);
	GetWeaponName(gun6, sgun6, 20);
	GetPlayerName(targetid, name, sizeof(name));
	GetPlayerHealth(targetid,health);
	new Float:px,Float:py,Float:pz;
	GetPlayerPos(targetid, px, py, pz);
	new coordsstring[256];
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	format(coordsstring, sizeof(coordsstring),"*** %s ***",name);
	SendClientMessage(playerid, COLOR_WHITE,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Nivel: [%d] Saude Inicial: %.1f Dinheiro: [$%d] Banco: [$%d] Fone: [%d]", level, shealth+50, cash, account, pnumber);
	SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
	format(coordsstring, sizeof(coordsstring), "Armas: %s %s %s %s %s %s", sgun1,sgun2,sgun3,sgun4,sgun5,sgun6);
	SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
	if (stats)
	{
		format(coordsstring, sizeof(coordsstring), "Servicos prestados: [%d/20] Drogas a usar: [%dg] Combustivel: [%dL] Drogas do Trafico: [%d]",pwa,drog,comb,trdrog);
		SendClientMessage(playerid, COLOR_GRAD4,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Matou: [%d/30] Preco do proximo nivel: [$%d] Exp: [%d/%d]",kills,costlevel,exp,expamount);
		SendClientMessage(playerid, COLOR_GRAD5,coordsstring);
	}
	if (IsPlayerAdmin(playerid) || PlayerInfo[playerid][pAdmin] >= 1)
	{
		format(coordsstring, sizeof(coordsstring), "Chave da casa [%d] Chave dos negocios [%d] Chave do carro alugado [%d] Juros Banco:[%d] Local[%d]", housekey,bizkey,HireCar[targetid],intir,local);
		SendClientMessage(playerid, COLOR_GRAD6,coordsstring);
	}
	//SendClientMessage(playerid, COLOR_GRAD6,"AVISO: use /level <playerid> to see another players stats");
	SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
}
//---------------------------------------------------------

public SetPlayerToTeamColor(playerid)
{
	if(gTeam[playerid] == TEAM_GREEN)
	{
		SetPlayerColor(playerid,TEAM_GREEN_COLOR); // red
	}
	else if(gTeam[playerid] == TEAM_BLUE)
	{
	    SetPlayerColor(playerid,TEAM_BLUE_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_ORANGE)
	{
	    SetPlayerColor(playerid,TEAM_ORANGE10_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_BALLAS)
	{
	    SetPlayerColor(playerid,TEAM_BALLAS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_GROVE)
	{
	    SetPlayerColor(playerid,TEAM_GROVE10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_VAGOS)
	{
	    SetPlayerColor(playerid,TEAM_VAGOS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_AZTECAS)
	{
	    SetPlayerColor(playerid,TEAM_AZTECAS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_NANG)
	{
	    SetPlayerColor(playerid,TEAM_NANG10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RIFA)
	{
	    SetPlayerColor(playerid,TEAM_RIFA10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_MAFIA)
	{
	    SetPlayerColor(playerid,TEAM_MAFIA10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RMAFIA)
	{
	    SetPlayerColor(playerid,TEAM_RMAFIA10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_TRIADS)
	{
	    SetPlayerColor(playerid,TEAM_TRIADS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_BIKERS)
	{
	    SetPlayerColor(playerid,TEAM_BIKERS10_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_CYAN)
	{
	    SetPlayerColor(playerid,TEAM_CYAN_COLOR); // blue
	}
}

public SetPlayerToTeamColorFlash(playerid)
{
	if(gTeam[playerid] == TEAM_GREEN)
	{
		SetPlayerColor(playerid,TEAM_GREEN_COLOR); // red
	}
	else if(gTeam[playerid] == TEAM_BLUE)
	{
	    SetPlayerColor(playerid,TEAM_BLUE_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_ORANGE)
	{
	    SetPlayerColor(playerid,TEAM_ORANGE_COLOR); // blue
	}
	else if(gTeam[playerid] == TEAM_BALLAS)
	{
	    SetPlayerColor(playerid,TEAM_BALLAS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_GROVE)
	{
	    SetPlayerColor(playerid,TEAM_GROVE_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_VAGOS)
	{
	    SetPlayerColor(playerid,TEAM_VAGOS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_AZTECAS)
	{
	    SetPlayerColor(playerid,TEAM_AZTECAS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_NANG)
	{
	    SetPlayerColor(playerid,TEAM_NANG_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RIFA)
	{
	    SetPlayerColor(playerid,TEAM_RIFA_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_MAFIA)
	{
	    SetPlayerColor(playerid,TEAM_MAFIA_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_RMAFIA)
	{
	    SetPlayerColor(playerid,TEAM_RMAFIA_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_TRIADS)
	{
	    SetPlayerColor(playerid,TEAM_TRIADS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_BIKERS)
	{
	    SetPlayerColor(playerid,TEAM_BIKERS_COLOR); // purple
	}
	else if(gTeam[playerid] == TEAM_CYAN)
	{
	    SetPlayerColor(playerid,TEAM_CYAN_COLOR); // blue
	}
}

//---------------------------------------------------------

public GameModeInitExitFunc()
{
	if (gdebug >= 1){printf("DEBUG GameModeInitExitFunc()");}
	new string[128];
	format(string, sizeof(string), "Viajando...");
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			DisablePlayerCheckpoint(i);
			gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
			if (gdebug){print("DEBUG CHECKPOINT_NONE3");}
			GameTextForPlayer(i, string, 4000, 5);
			if (gdebug){printf("DEBUG %s", string);}
			SetPlayerCameraPos(i,1460.0, -1324.0, 287.2);
			SetPlayerCameraLookAt(i,1374.5, -1291.1, 239.0);
			OnPlayerUpdate(i);
			gPlayerLogged[i] = 0;
		}
	}
	SetTimer("GameModeExitFunc", 4000, 0);
	return 1;
}

public GameModeExitFunc()
{
	KillTimer(synctimer);
	KillTimer(newmistimer);
	KillTimer(unjailtimer);
	KillTimer(playertimer);
	KillTimer(cartimer);
	KillTimer(celltimer);
	GameModeExit();
}

//--------------------------------Config--------------------------------------------------------------
public LoadConfig()
{
	print(" ");
	print("Lendo configuracoes...");
	if (gdebug){print("DEBUG is on");}
	new valtmp[128];
	new File: file = fopen("pen01.cfg", io_read);
	fread(file, valtmp);strmid(motd, valtmp, 0, strlen(valtmp)-1, 255);
	fread(file, valtmp);GetVal(valtmp);fow = RetVal;
	fread(file, valtmp);GetVal(valtmp);radardist = RetVal;
	fread(file, valtmp);GetVal(valtmp);radarfreq = RetVal;
	fread(file, valtmp);GetVal(valtmp);addtimer = RetVal*1000;
	fread(file, valtmp);GetVal(valtmp);stats = RetVal;
	fread(file, valtmp);GetVal(valtmp);dollah = RetVal;
	fread(file, valtmp);GetVal(valtmp);realtime = RetVal;
	fread(file, valtmp);GetVal(valtmp);timeshift = RetVal;
	fread(file, valtmp);GetVal(valtmp);wtime = RetVal;
	fread(file, valtmp);GetVal(valtmp);gRoundTime = RetVal*60000;
	fread(file, valtmp);GetVal(valtmp);cashbox = RetVal;
	fread(file, valtmp);GetVal(valtmp);streetrace = RetVal;
	fread(file, valtmp);GetVal(valtmp);hotwire = RetVal;
	fread(file, valtmp);GetVal(valtmp);levelcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);basedcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);deathcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);suecost = RetVal;
	fread(file, valtmp);GetVal(valtmp);paycheck = RetVal;
	fread(file, valtmp);GetVal(valtmp);jobdelay = RetVal;
	fread(file, valtmp);GetVal(valtmp);petime = RetVal*60000;
	fread(file, valtmp);GetVal(valtmp);realchat = RetVal;
	fread(file, valtmp);GetVal(valtmp);forceteam = RetVal;
	fread(file, valtmp);GetVal(valtmp);cchargetime = RetVal;
	fread(file, valtmp);GetVal(valtmp);callcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);txtcost = RetVal;
	fread(file, valtmp);GetVal(valtmp);jailtime = RetVal;
	fread(file, valtmp);GetVal(valtmp);intrate = RetVal;
	fread(file, valtmp);GetVal(valtmp);teamcarlock = RetVal;
	fread(file, valtmp);GetVal(valtmp);levelexp = RetVal;
	fread(file, valtmp);GetVal(valtmp);nocasino = RetVal;
	fread(file, valtmp);GetVal(valtmp);automission = RetVal;
	fread(file, valtmp);GetVal(valtmp);civnokill = RetVal;
	fread(file, valtmp);GetVal(valtmp);accountplay = RetVal;
	fread(file, valtmp);GetVal(valtmp);mediccharge = RetVal;
	fclose(file);
	print(".....Configuracoes lidas");
	printf("%s %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d",motd,dollah,realtime,timeshift,wtime,gRoundTime,cashbox,streetrace,hotwire,levelcost,deathcost,paycheck,jobdelay,petime,realchat,forceteam);
}
//------------------------------------------------------------------------------------------------------
public GetVal(string[])
{
	new tmp[32];
	new idx;
	tmp = strtok(string, idx);
	tmp = strtok(string, idx);
	RetVal = strval(tmp);
	strmid(string, string, 0, strlen(string)-1, 255);
	printf("%s",string);
}

public SaveRace(playerid,name[])
{
		new coordsstring[256];
		new racename[64];
		new makername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, makername, sizeof(makername));
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%s,%s,%d,%d",
		RaceInfo[rStartx],
		RaceInfo[rStarty],
		RaceInfo[rStartz],
		RaceInfo[rMidx],
		RaceInfo[rMidy],
		RaceInfo[rMidz],
		RaceInfo[rMid2x],
		RaceInfo[rMid2y],
		RaceInfo[rMid2z],
		RaceInfo[rEndx],
		RaceInfo[rEndy],
		RaceInfo[rEndz],
		makername,
		"none",
		0,
		RaceInfo[rLaps]);
		format(racename, sizeof(racename), "%s.race",name);
		new File: file2 = fopen(racename, io_write);
		fwrite(file2, coordsstring);
		fclose(file2);
		format(coordsstring, sizeof(coordsstring), "%s Race Saved",name);
		SendClientMessage(playerid, COLOR_GREEN,coordsstring);
		return 1;
}

public BestTime(name[])
{
	print("BestTime");
		new coordsstring[256];
		new racename[64];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%s,%s,%d,%d",
		RaceInfo[rStartx],
		RaceInfo[rStarty],
		RaceInfo[rStartz],
		RaceInfo[rMidx],
		RaceInfo[rMidy],
		RaceInfo[rMidz],
		RaceInfo[rMid2x],
		RaceInfo[rMid2y],
		RaceInfo[rMid2z],
		RaceInfo[rEndx],
		RaceInfo[rEndy],
		RaceInfo[rEndz],
		RaceInfo[rName],
		RaceInfo[rBest],
		RaceInfo[rBestms],
		RaceInfo[rLaps]);
		format(racename, sizeof(racename), "%s.race",name);
		new File: file2 = fopen(racename, io_write);
		fwrite(file2, coordsstring);
		fclose(file2);
		return 1;
}

public LoadTmp()
{
	new arrCoords[4][64];
	new strFromFile2[64];
	new File: file = fopen("tmppos.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(Teletmp))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			Teletmp[idx][pTmpposx] = floatstr(arrCoords[0]);
			Teletmp[idx][pTmpposy] = floatstr(arrCoords[1]);
			Teletmp[idx][pTmpposz] = floatstr(arrCoords[2]);
			Teletmp[idx][pTmpint] = strval(arrCoords[3]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}


public LoadRace(playerid,name[])
{
	if (gdebug >= 1){printf("DEBUG Loadrace(%d,%s)",playerid,name);}
	new arrCoords[16][64];
	new strFromFile2[256];
	new racename[64];
	strmid(CurrentRace, name, 0, strlen(name), 255);
	format(racename, sizeof(racename), "%s.race",name);
	new File: file = fopen(racename, io_read);
	if (file)
	{
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		RaceInfo[rStartx] = floatstr(arrCoords[0]);
		RaceInfo[rStarty] = floatstr(arrCoords[1]);
		RaceInfo[rStartz] = floatstr(arrCoords[2]);
		RaceInfo[rMidx] = floatstr(arrCoords[3]);
		RaceInfo[rMidy] = floatstr(arrCoords[4]);
		RaceInfo[rMidz] = floatstr(arrCoords[5]);
		RaceInfo[rMid2x] = floatstr(arrCoords[6]);
		RaceInfo[rMid2y] = floatstr(arrCoords[7]);
		RaceInfo[rMid2z] = floatstr(arrCoords[8]);
		RaceInfo[rEndx] = floatstr(arrCoords[9]);
		RaceInfo[rEndy] = floatstr(arrCoords[10]);
		RaceInfo[rEndz] = floatstr(arrCoords[11]);
		strmid(RaceInfo[rName], arrCoords[12], 0, strlen(arrCoords[12]), 255);
		strmid(RaceInfo[rBest], arrCoords[13], 0, strlen(arrCoords[13]), 255);
		RaceInfo[rBestms] = strval(arrCoords[14]);
		RaceInfo[rLaps] = strval(arrCoords[15]);
		rsx = RaceInfo[rStartx];rsy = RaceInfo[rStarty];rsz =RaceInfo[rStartz];
		rmx = RaceInfo[rMidx];rmy = RaceInfo[rMidy];rmz = RaceInfo[rMidz];
		rm2x = RaceInfo[rMid2x];rm2y = RaceInfo[rMid2y];rm2z = RaceInfo[rMid2z];
		rex = RaceInfo[rEndx];rey = RaceInfo[rEndy];rez = RaceInfo[rEndz];
		fclose(file);
		format(strFromFile2, sizeof(strFromFile2), "%s Race Loaded",name);
		ConvertTicks(RaceInfo[rBestms]);
		SendClientMessage(playerid, COLOR_GREEN,strFromFile2);
		if(RaceInfo[rLaps] > 0)
		{
			format(strFromFile2, sizeof(strFromFile2), "Next Race: %s, By : %s | BestTime: %s : %d:%d:%d Laps: %d",name,RaceInfo[rName],RaceInfo[rBest],cmins,csecs,cmils,RaceInfo[rLaps]);
		}
		else
		{
			format(strFromFile2, sizeof(strFromFile2), "Next Race: %s, By : %s | BestTime: %s : %d:%d:%d",name,RaceInfo[rName],RaceInfo[rBest],cmins,csecs,cmils);
		}
		SendEnemyMessage(COLOR_GREEN, strFromFile2);
		randomrace = 0;
	}
	else
	{
		if(playerid != 255)
		{
			SendClientMessage(playerid, COLOR_GREEN,"File not found");
		}
	}
	return 1;
}

public LoadProperty()
{
	new arrCoords[29][64];
	new strFromFile2[256];
	new File: file = fopen("property.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(HouseInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			HouseInfo[idx][hEntrancex] = floatstr(arrCoords[0]);
			HouseInfo[idx][hEntrancey] = floatstr(arrCoords[1]);
			HouseInfo[idx][hEntrancez] = floatstr(arrCoords[2]);
			HouseInfo[idx][hExitx] = floatstr(arrCoords[3]);
			HouseInfo[idx][hExity] = floatstr(arrCoords[4]);
			HouseInfo[idx][hExitz] = floatstr(arrCoords[5]);
			HouseInfo[idx][hHealthx] = strval(arrCoords[6]);
			HouseInfo[idx][hHealthy] = strval(arrCoords[7]);
			HouseInfo[idx][hHealthz] = strval(arrCoords[8]);
			HouseInfo[idx][hArmourx] = strval(arrCoords[9]);
			HouseInfo[idx][hArmoury] = strval(arrCoords[10]);
			HouseInfo[idx][hArmourz] = strval(arrCoords[11]);
			//printf("HouseInfo hEntrancez %f",HouseInfo[idx][hEntrancez]);
			strmid(HouseInfo[idx][hOwner], arrCoords[12], 0, strlen(arrCoords[12]), 255);
			strmid(HouseInfo[idx][hDiscription], arrCoords[13], 0, strlen(arrCoords[13]), 255);
			HouseInfo[idx][hValue] = strval(arrCoords[14]);
			HouseInfo[idx][hHel] = strval(arrCoords[15]);
			HouseInfo[idx][hArm] = strval(arrCoords[16]);
			HouseInfo[idx][hInt] = strval(arrCoords[17]);
			HouseInfo[idx][hLock] = strval(arrCoords[18]);
			HouseInfo[idx][hOwned] = strval(arrCoords[19]);
			HouseInfo[idx][hRooms] = strval(arrCoords[20]);
			HouseInfo[idx][hRent] = strval(arrCoords[21]);
			HouseInfo[idx][hRentabil] = strval(arrCoords[22]);
			HouseInfo[idx][hTakings] = strval(arrCoords[23]);
			HouseInfo[idx][hVec] = strval(arrCoords[24]);
  	        if(HouseInfo[idx][hVec] == 457)
			{
				HouseInfo[idx][hVec] = 411;
			}
			HouseInfo[idx][hVcol1] = strval(arrCoords[25]);
			HouseInfo[idx][hVcol2] = strval(arrCoords[26]);
			HouseInfo[idx][hDate] = strval(arrCoords[27]);
			HouseInfo[idx][hLevel] = strval(arrCoords[28]);
			printf("InfoCasa:%d Dono:%s Ganho %d Veiculo %d",idx,HouseInfo[idx][hOwner],HouseInfo[idx][hTakings],HouseInfo[idx][hVec]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}

public LoadDM(playerid,name[])
{
	new arrCoords[4][64];
	new strFromFile2[256];
	new dmname[64];
	format(dmname, sizeof(dmname), "%s.dm",name);
	new File: file = fopen(dmname, io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			gRandomDMSpawns[idx][0] = floatstr(arrCoords[0]);
			gRandomDMSpawns[idx][1] = floatstr(arrCoords[1]);
			gRandomDMSpawns[idx][2] = floatstr(arrCoords[2]);
			idx++;
		}
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		gDMWbounds[0] = floatstr(arrCoords[0]);
		gDMWbounds[1] = floatstr(arrCoords[1]);
		gDMWbounds[2] = floatstr(arrCoords[2]);
		gDMWbounds[3] = floatstr(arrCoords[3]);
		fclose(file);
		format(strFromFile2, sizeof(strFromFile2), "Next DM: %s",name);
		SendClientMessageToAll(COLOR_GREEN, strFromFile2);
	}
	else
	{
		if(playerid != 255)
		{
			SendClientMessage(playerid, COLOR_GREEN,"File not found");
		}
	}
	return 1;
}

public SaveDM(playerid,name[])
{
		new coordsstring[256];
		new racename[64];
		format(racename, sizeof(racename), "%s.dm",name);
		new File: file2 = fopen(racename, io_write);
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			format(coordsstring, sizeof(coordsstring), "%f,%f,%f\n",gRandomDMSpawns[idx][0],gRandomDMSpawns[idx][1],gRandomDMSpawns[idx][2]);
			fwrite(file2, coordsstring);
			idx++;
		}
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f\n",gDMWbounds[0],gDMWbounds[1],gDMWbounds[2],gDMWbounds[3]);
		fwrite(file2, coordsstring);
		fclose(file2);
		format(coordsstring, sizeof(coordsstring), "%s DM Saved",name);
		SendClientMessage(playerid, COLOR_GREEN,coordsstring);
		return 1;
}

public LoadRaceList(playerid,name[])
{
	new arrCoords[4][64];
	new strFromFile2[256];
	new dmname[64];
	format(dmname, sizeof(dmname), "%s.dm",name);
	new File: file = fopen(dmname, io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			gRandomDMSpawns[idx][0] = floatstr(arrCoords[0]);
			gRandomDMSpawns[idx][1] = floatstr(arrCoords[1]);
			gRandomDMSpawns[idx][2] = floatstr(arrCoords[2]);
			idx++;
		}
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		gDMWbounds[0] = floatstr(arrCoords[0]);
		gDMWbounds[1] = floatstr(arrCoords[1]);
		gDMWbounds[2] = floatstr(arrCoords[2]);
		gDMWbounds[3] = floatstr(arrCoords[3]);
		fclose(file);
		format(strFromFile2, sizeof(strFromFile2), "Next DM: %s",name);
		SendClientMessageToAll(COLOR_GREEN, strFromFile2);
	}
	else
	{
		if(playerid != 255)
		{
			SendClientMessage(playerid, COLOR_GREEN,"File not found");
		}
	}
	return 1;
}

public SaveRaceList(playerid,name[])
{
		new coordsstring[256];
		new racename[64];
		format(racename, sizeof(racename), "%s.dm",name);
		new File: file2 = fopen(racename, io_write);
		new idx;
		while (idx < sizeof(gRandomDMSpawns))
		{
			format(coordsstring, sizeof(coordsstring), "%f,%f,%f\n",gRandomDMSpawns[idx][0],gRandomDMSpawns[idx][1],gRandomDMSpawns[idx][2]);
			fwrite(file2, coordsstring);
			idx++;
		}
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f\n",gDMWbounds[0],gDMWbounds[1],gDMWbounds[2],gDMWbounds[3]);
		fwrite(file2, coordsstring);
		fclose(file2);
		format(coordsstring, sizeof(coordsstring), "%s DM Saved",name);
		SendClientMessage(playerid, COLOR_GREEN,coordsstring);
		return 1;
}


public LoadBizz()
{
	new arrCoords[31][64];
	new strFromFile2[256];
	new File: file = fopen("bizz.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(BizzInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			BizzInfo[idx][bEntrancex] = floatstr(arrCoords[0]);
			BizzInfo[idx][bEntrancey] = floatstr(arrCoords[1]);
			BizzInfo[idx][bEntrancez] = floatstr(arrCoords[2]);
			BizzInfo[idx][bExitx] = floatstr(arrCoords[3]);
			BizzInfo[idx][bExity] = floatstr(arrCoords[4]);
			BizzInfo[idx][bExitz] = floatstr(arrCoords[5]);
			BizzInfo[idx][bHealthx] = strval(arrCoords[6]);
			BizzInfo[idx][bHealthy] = strval(arrCoords[7]);
			BizzInfo[idx][bHealthz] = strval(arrCoords[8]);
			BizzInfo[idx][bArmourx] = strval(arrCoords[9]);
			BizzInfo[idx][bArmoury] = strval(arrCoords[10]);
			BizzInfo[idx][bArmourz] = strval(arrCoords[11]);
			strmid(BizzInfo[idx][bOwner], arrCoords[12], 0, strlen(arrCoords[12]), 255);
			strmid(BizzInfo[idx][bDiscription], arrCoords[13], 0, strlen(arrCoords[13]), 255);
			BizzInfo[idx][bValue] = strval(arrCoords[14]);
			BizzInfo[idx][bHel] = strval(arrCoords[15]);
			BizzInfo[idx][bArm] = strval(arrCoords[16]);
			BizzInfo[idx][bInt] = strval(arrCoords[17]);
			BizzInfo[idx][bLock] = strval(arrCoords[18]);
			BizzInfo[idx][bOwned] = strval(arrCoords[19]);
			BizzInfo[idx][bEntcost] = strval(arrCoords[20]);
			BizzInfo[idx][bTakings] = strval(arrCoords[21]);
			BizzInfo[idx][bDate] = strval(arrCoords[22]);
			BizzInfo[idx][bLevel] = strval(arrCoords[23]);
			BizzInfo[idx][bProd] = strval(arrCoords[24]);
			BizzInfo[idx][bProdCap] = strval(arrCoords[25]);
			BizzInfo[idx][bComp] = strval(arrCoords[26]);
			BizzInfo[idx][bCompCap] = strval(arrCoords[27]);
			BizzInfo[idx][bProdCost] = strval(arrCoords[28]);
			BizzInfo[idx][bPayComp] = strval(arrCoords[29]);
			BizzInfo[idx][bPriceMod] = strval(arrCoords[30]);

			printf("InfoNeg:%d [%s] Dono:%s Entrada:%d Recebe:%d Produtos:%d/%d Componentes: %d/%d",
			idx,
			BizzInfo[idx][bDiscription],
			BizzInfo[idx][bOwner],
			BizzInfo[idx][bEntcost],
			BizzInfo[idx][bTakings],
			BizzInfo[idx][bProd],
			BizzInfo[idx][bProdCap],
			BizzInfo[idx][bComp],
			BizzInfo[idx][bCompCap]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}


public LoadSBizz()
{
	new arrCoords[21][64];
	new strFromFile2[256];
	new File: file = fopen("sbizz.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(SBizzInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			SBizzInfo[idx][sbEntrancex] = floatstr(arrCoords[0]);
			SBizzInfo[idx][sbEntrancey] = floatstr(arrCoords[1]);
			SBizzInfo[idx][sbEntrancez] = floatstr(arrCoords[2]);
			//printf("HouseInfo hEntrancez %f",HouseInfo[idx][hEntrancez]);
			strmid(SBizzInfo[idx][sbOwner], arrCoords[3], 0, strlen(arrCoords[3]), 255);
			strmid(SBizzInfo[idx][sbDiscription], arrCoords[4], 0, strlen(arrCoords[4]), 255);
			SBizzInfo[idx][sbValue] = strval(arrCoords[5]);
			SBizzInfo[idx][sbHel] = strval(arrCoords[6]);
			SBizzInfo[idx][sbArm] = strval(arrCoords[7]);
			SBizzInfo[idx][sbInt] = strval(arrCoords[8]);
			SBizzInfo[idx][sbLock] = strval(arrCoords[9]);
			SBizzInfo[idx][sbOwned] = strval(arrCoords[10]);
			SBizzInfo[idx][sbEntcost] = strval(arrCoords[11]);
			SBizzInfo[idx][sbTakings] = strval(arrCoords[12]);
			SBizzInfo[idx][sbDate] = strval(arrCoords[13]);
			SBizzInfo[idx][sbLevel] = strval(arrCoords[14]);
			SBizzInfo[idx][sbProd] = strval(arrCoords[15]);
			SBizzInfo[idx][sbProdCap] = strval(arrCoords[16]);
			SBizzInfo[idx][sbComp] = strval(arrCoords[17]);
			SBizzInfo[idx][sbCompCap] = strval(arrCoords[18]);
			SBizzInfo[idx][sbProdCost] = strval(arrCoords[19]);
			SBizzInfo[idx][sbPayComp] = strval(arrCoords[20]);
			printf("LTDA-ME:%d [%s] Dono:%s Entrada:%d Recebe:%d Produtos:%d/%d Componentes: %d/%d",
			idx,
			SBizzInfo[idx][sbDiscription],
			SBizzInfo[idx][sbOwner],
			SBizzInfo[idx][sbEntcost],
			SBizzInfo[idx][sbTakings],
			SBizzInfo[idx][sbProd],
			SBizzInfo[idx][sbProdCap],
			SBizzInfo[idx][sbComp],
			SBizzInfo[idx][sbCompCap]);
			idx++;
		}
	}
	fclose(file);
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnGameModeInit()
{
	LoadConfig();
	LoadTmp();
	LoadProperty();
	LoadBizz();
	LoadSBizz();
	SetTimer("PrevisaoDoTempo", 300000, 1);
	SetTimer("PostoAntiExplosao", 10000,1);
	SetTimer("Posto", 1000, 1);
	SetTimer("SemComb", 35000, 1);
	SetTimer("Abastecer", 30000, 1);
	SetTimer("Abastecer2", 35000, 1);
	//PlayerHaul[78][pLoad] = 10000;
	PlayerHaul[78][pCapasity] = 10;
	//PlayerHaul[79][pLoad] = 10000;
	PlayerHaul[79][pCapasity] = 10;
	//PlayerHaul[80][pLoad] = 10000;
	PlayerHaul[80][pCapasity] = 5;
	//PlayerHaul[81][pLoad] = 10000;
	PlayerHaul[81][pCapasity] = 5;
	SetGameModeText("Bayside RPG - Brasil");
	format(objstore, sizeof(objstore), "Nada...");
	format(cbjstore, sizeof(cbjstore), "Nada...");
	gettime(ghour, gminute, gsecond);
	FixHour(ghour);
	ghour = shifthour;
	if(!realtime)
	{
		SetWorldTime(wtime);
	}
	ShowPlayerMarkers(0);
	ShowNameTags(0);
	UsePlayerPedAnims();
	AllowInteriorWeapons(1);
	// Player Class's
	for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],1958.3783,1343.1572,1100.3746,269.1425,-1,-1,-1,-1,-1,-1);
		//if (gdebug){printf("DEBUG ped (%d) added", i);}
	}
	// Car Spawns
	//cops cars
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if (gdebug >= 1){printf("HouseInfo[%d][hVec] %d",h,HouseInfo[h][hVec]);}
		CreateVehicle(HouseInfo[h][hVec], HouseCarSpawns[h][0], HouseCarSpawns[h][1], HouseCarSpawns[h][2], HouseCarSpawns[h][3], HouseInfo[h][hVcol1], HouseInfo[h][hVcol2], never);
		gCarLock[h+1] = 1;
	}//34
	//------------------------------------Carros ADD
	CreateVehicle(563,-2227.52,2326.94,7.55,90.0,7,0, never);
	CreateVehicle(414,-2253.23,2330.73,4.81,46.3918,-1, -1, never);
	CreateVehicle(420,-2253.63,2320.74,4.81,271.2,-1, -1, never);
	CreateVehicle(422,-2254.04,2326.48,4.81,271.2,-1, -1, never);
	CreateVehicle(596,-2267.55,2379.62,5.03,90.0,79,8, never);
	CreateVehicle(596,-2271.66,2384.80,4.95,90.0,79,8, never);
	CreateVehicle(596,-2260.50,2394.46,4.97,90.0,79,8, never);
	CreateVehicle(431,-2464.78,2228.19,4.84,360.0,-1,-1, never);
	CreateVehicle(496,-2476.84,2224.77,4.84,359.9,-1,-1, never);
	CreateVehicle(423,-2625.22,2265.78,8.14,90.0,-1,-1, never);
	CreateVehicle(537,-2443.86,2242.79,4.84,359.9,-1,-1, never);
	CreateVehicle(428,-2508.78,2365.23,4.99,90.0,-1,-1, never);
	CreateVehicle(588,-2625.58,2258.06,8.15,90.0,-1,-1, never);
	CreateVehicle(560,-2603.87,2344.45,8.83,270.0,126,0, never);
	CreateVehicle(596,-2272.97,2405.76,4.94,90.0,79,8, never);
	CreateVehicle(427,-2284.79,2400.43,4.91,90.0,20,7, never);
	CreateVehicle(416,-2229.14,2350.95,5.14,90.0,-1,-1, never);
	CreateVehicle(407,-2243.67,2373.61,5.22,90.0,-1,-1, never);
	CreateVehicle(497,-2229.50,2317.70,7.73,90.0,16,1, never);
	CreateVehicle(497,-2228.03,2330.63,7.74,90.0,44,-1, never);
	CreateVehicle(497,-2229.27,2303.86,5.50,90.0,79,7, never);
	CreateVehicle(484,-2318.16,2324.47,0.41,90.0,79,7, never);
	CreateVehicle(453,-2234.77,2389.81,1.10,90.0,79,7, never);
	CreateObject(626,-2618.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2614.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2610.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2606.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2602.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2598.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2594.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2590.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2586.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2582.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2578.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(626,-2574.31,2236.08,5.18,0,0,0);//planta perto da praca
	CreateObject(1364,-2614.73,2247.32,8.19,0,0,180); // BANCO PRACA 1
	CreateObject(1364,-2618.96,2247.48,8.17,180,180,0); // BANCO PRACA 2
	objeto1 = CreateObject(1257,-2622.54,2334.58,8.33,0,0,180); // PARADA DE ONIBUS
	objeto2 = CreateObject(1257,-2551.22,2314.54,4.97,0,0,0);
	gas1 = CreateObject(1686,-2523.46,2361.60,5.3,0,0,0); // POSTO
	gas2 = CreateObject(1686,-2529.63,2361.43,5.3,0,0,0); // POSTO
	CreateObject(1225,-2622.54,2340.58,8.33,270,0,0);
	//----------------------------------------------
	
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if(HouseInfo[h][hOwned] == 0)
		{
			AddStaticPickup(1273, 2, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			pickups++;
		}
		if(HouseInfo[h][hOwned] == 1)
		{
			AddStaticPickup(1239, 2, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			pickups++;
		}
	}
	for(new h = 0; h < sizeof(BizzInfo); h++)
	{
		if(BizzInfo[h][bOwned] == 0)
		{
			AddStaticPickup(1272, 2, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]);
			pickups++;
		}
		if(BizzInfo[h][bOwned] == 1)
		{
			AddStaticPickup(1239, 2, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]);
			pickups++;
		}
	}
	for(new h = 0; h < sizeof(SBizzInfo); h++)
	{
		if(SBizzInfo[h][sbOwned] == 0)
		{
			AddStaticPickup(1272, 2, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]);
			pickups++;
		}
		if(SBizzInfo[h][sbOwned] == 1)
		{
			AddStaticPickup(1239, 2, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]);
			pickups++;
		}
	}
	AddStaticPickup(1274, 2, BizzInfo[4][bEntrancex], BizzInfo[4][bEntrancey], BizzInfo[4][bEntrancez]);pickups++; //thebank

	AddStaticPickup(371, 2, 1544.2,-1353.4,329.4); //ls towertop
	AddStaticPickup(371, 2, 1536.0, -1360.0, 1150.0);
	AddStaticPickup(1575, 2, -1322.48,2497.31,87.05);
	AddStaticPickup(1264, 2, -2481.00,2293.04,4.98);
	AddStaticPickup(1264, 2, -2501.60,2275.38,4.97);
	AddStaticPickup(1264, 2, -2527.15,2293.99,4.98);
	AddStaticPickup(1264, 2, -2531.93,2294.00,4.98);
	AddStaticPickup(1264, 2, -2539.70,2294.04,4.98);
	AddStaticPickup(1264, 2, -2440.13,2344.38,4.97);
	AddStaticPickup(1264, 2, -2402.01,2356.34,6.39);
	AddStaticPickup(1264, 2, -2352.20,2372.06,5.42);
	AddStaticPickup(1264, 2, -2247.05,2363.82,4.99);
	AddStaticPickup(1264, 2, -2253.13,2370.80,5.00);
	AddStaticPickup(1264, 2, -2352.34,2421.16,7.16);
	AddStaticPickup(1264, 2, -2388.12,2440.35,9.86);
	AddStaticPickup(1264, 2, -2383.79,2412.92,8.89);
	AddStaticPickup(1264, 2, -2421.83,2422.53,13.05);
	AddStaticPickup(1264, 2, -2421.40,2446.10,12.97);
	AddStaticPickup(1264, 2, -2421.76,2484.56,13.16);
	AddStaticPickup(1264, 2, -2445.68,2485.18,15.32);
	AddStaticPickup(1264, 2, -2460.65,2509.11,16.88);
	AddStaticPickup(1264, 2, -2488.62,2539.08,18.06);
	AddStaticPickup(1264, 2, -2466.58,2444.54,15.79);
	AddStaticPickup(1264, 2, -2623.52,2425.64,14.26);
	AddStaticPickup(1264, 2, -2622.70,2400.43,11.67);
	AddStaticPickup(1264, 2, -2625.12,2375.23,9.42);
	AddStaticPickup(1264, 2, -2608.09,2341.81,8.38);
	AddStaticPickup(1264, 2, -2625.63,2348.94,8.51);
	AddStaticPickup(1264, 2, -2627.11,2314.40,8.31);
	AddStaticPickup(1264, 2, -2626.84,2287.54,8.31);
	AddStaticPickup(1264, 2, -2605.36,2280.35,8.36);
	AddStaticPickup(1220, 2, -796.44,2258.43,58.98);
	pickups=pickups+9;

	printf("Pickups Max = 100, Current Pickups = %d",pickups);
	new randa = random(sizeof(RandCars));
	randa = random(sizeof(RandCars));carselect[0] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[1] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[2] = RandCars[randa][0];
	randa = random(sizeof(RandLow));carselect[3] = RandLow[randa][0];
	randa = random(sizeof(RandCars));carselect[4] = RandCars[randa][0];
	randa = random(sizeof(RandAngles));carselect[5] = RandAngles[randa][0];
	randa = random(sizeof(RandCars));carselect[6] = RandCars[randa][0];
	randa = random(sizeof(RandLow));carselect[7] = RandLow[randa][0];
	randa = random(sizeof(RandCars));carselect[8] = RandCars[randa][0];
	randa = random(sizeof(RandAngles));carselect[9] = RandAngles[randa][0];
	randa = random(sizeof(RandCars));carselect[10] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[11] = RandCars[randa][0];
	randa = random(sizeof(RandBikes));carselect[12] = RandBikes[randa][0];
	randa = random(sizeof(RandBikes));carselect[13] = RandBikes[randa][0];
	randa = random(sizeof(RandLCars));carselect[14] = RandLCars[randa][0];
	CreateVehicle(carselect[14], 1279.4,-1337.0,13.5,1.0,-1, -1, -1);//long
	//printf("DEBUG: Rando Cars %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,",carselect[0],carselect[1],carselect[2],carselect[3],carselect[4],carselect[5],carselect[6],carselect[7],carselect[8],carselect[9],carselect[10],carselect[11],carselect[12],carselect[13],carselect[14]);
	if (gRoundTime > 0)
	{
		SetTimer("GameModeInitExitFunc", gRoundTime, 0);
	}
	if (realtime)
	{
		new tmphour;
		new tmpminute;
		new tmpsecond;
		gettime(tmphour, tmpminute, tmpsecond);
		FixHour(tmphour);
		tmphour = shifthour;
		SetWorldTime(tmphour);
	}
	if (fow)
	{
		SetTimer("CopScanner", radarfreq, 1);
	}
	synctimer = SetTimer("SyncUp", 60000, 1);
	newmistimer = SetTimer("PrePlayerNewMission", jobdelay, 1);
	unjailtimer = SetTimer("SetPlayerUnjail", 1000, 1);
	if (nocasino)
	{
		playertimer = SetTimer("PlayerInArea", 1000, 1);
	}
	cartimer = SetTimer("CarCheck", 30000, 1);
	celltimer = SetTimer("CellPhoneTimer", 1000, 1);
	SetTimer("RingToner", 500, 0);
	SetTimer("SetPlayerFlash", 1000, 0);
	SetTimer("CustomPickups", 1000, 1);
	SetTimer("InHouse", 1000, 1);
	SetTimer("GameTicks", 500, 1);
	SetTimer("VoteKickTimer", 1000, 1);
	SetTimer("DMDetect", 1000, 1);
	SetTimer("Spectator", 2000, 1);
	SetTimer("PenInArea", 2000, 1);
	SetTimer("IdleKick", idletime, 1);
	SetTimer("AntiTeleport", 1000, 1);
	SetTimer("AntiCamp", 1000, 1);
	SetTimer("SkyDive", 1000, 1);
	SetTimer("Production", 300000, 1); //5 mins
	//for(new i = 0; i < sizeof(CarSpawns); i++)
	for(new i = 0; i < 165; i++)
	{
		AddCar(i);
		if (gdebug){printf("DEBUG car (%d) spawned", i);}
	}
	CarInit();
	TeamCarLockInit();
	return 1;
}

public SyncUp()
{
if (gdebug >= 3){printf("DEBUG SyncUp()");}
	SyncTime();
	DollahScoreUpdate();
}
public PostoAntiExplosao()
{
	DestroyObject(gas1);
	DestroyObject(gas2);
	DestroyObject(objeto1);
	DestroyObject(objeto2);
	
	gas1 = CreateObject(1686,-2523.46,2361.60,5.3,0,0,0); // POSTO
	gas2 = CreateObject(1686,-2529.63,2361.43,5.3,0,0,0); // POSTO
	objeto1 = CreateObject(1257,-2622.54,2334.58,8.33,0,0,180); // PARADA DE ONIBUS
	objeto2 = CreateObject(1257,-2551.22,2314.54,4.97,0,0,0);
}

public SyncTime()
{
if (gdebug >= 3){printf("DEBUG SyncTime()");}
	new string[64];
	new tmphour;
	new tmpminute;
	new tmpsecond;
	gettime(tmphour, tmpminute, tmpsecond);
	FixHour(tmphour);
	tmphour = shifthour;
	if ((tmphour > ghour) || (tmphour == 0 && ghour == 23))
	{
		format(string, sizeof(string), "SERVER: Horas: %d:00",tmphour);
		BroadCast(COLOR_WHITE,string);
		if (numplayers == 0)
		{
			GameModeInitExitFunc();
		}
		if (gdebug){printf("DEBUG tmphour=%d ghour=%d",tmphour,ghour);}
		ghour = tmphour;
		PayDay();
		if (realtime)
		{
			SetWorldTime(tmphour);
		}
	}
}


public SkyDive()
{
	skydivecount--;
	new string[256];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gSkyDive[i] == 1)
		{
			if(skydivecount > 10)
			{
				format(string, sizeof(string), "~W~%d",skydivecount);
			}
			else
			{
				format(string, sizeof(string), "~r~%d",skydivecount);
			}
			GameTextForPlayer(i, string, 2000, 6);
			if(skydivecount == 0)
			{
				GivePlayerWeapon(i, 46, 0);
				SetPlayerPos(i,SBizzInfo[0][sbEntrancex]+i, SBizzInfo[0][sbEntrancey], 1350.0);
				SetPlayerInterior(i,0);
				PlayerInfo[i][pInt] = 0;
				SendClientMessage(i, TEAM_GROVE_COLOR, "WooHaa! Vamos Lá!");
				gSkyDive[i] = 0;
			}
		}
	}
	if(skydivecount == 0)
	{
		skydivecount = 60;
	}
}
public Production()
{
	for(new i = 0; i < sizeof(BizzInfo); i++)
	{
		if(BizzInfo[i][bComp] > 0)
		{
			//printf("BizzInfo[i][bComp] %d BizzInfo[i][bProdCost] %d",BizzInfo[i][bComp],BizzInfo[i][bProdCost])
			if(BizzInfo[i][bProd] < BizzInfo[i][bProdCap])
			{
				//printf("BizzInfo[i][bProd] %d BizzInfo[i][bProdCap] %d",BizzInfo[i][bProd],BizzInfo[i][bProdCap])
				BizzInfo[i][bProd] = BizzInfo[i][bProd]+BizzInfo[i][bProdCost];
				BizzInfo[i][bComp]--;
			}
		}
	}
	for(new i = 0; i < sizeof(SBizzInfo); i++)
	{
		if(SBizzInfo[i][sbComp] > 0)
		{
			if(SBizzInfo[i][sbProd] < SBizzInfo[i][sbProdCap])
			{
				SBizzInfo[i][sbProd] = SBizzInfo[i][sbProd]+SBizzInfo[i][sbProdCost];
				SBizzInfo[i][sbComp]--;
			}
		}
	}
}

public DateProp(playerid)
{
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));
	new curdate = getdate();
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if (strcmp(playername, HouseInfo[h][hOwner], true) == 0)
		{
			HouseInfo[h][hDate] = curdate;
			OnPropUpdate();
		}
	}
	for(new b = 0; b < sizeof(BizzInfo); b++)
	{
		if (strcmp(playername, BizzInfo[b][bOwner], true) == 0)
		{
			BizzInfo[b][bDate] = curdate;
			OnPropUpdate();
		}
	}
	for(new c = 0; c < sizeof(SBizzInfo); c++)
	{
		if (strcmp(playername, SBizzInfo[c][sbOwner], true) == 0)
		{
			SBizzInfo[c][sbDate] = curdate;
			OnPropUpdate();
		}
	}
	return 1;
}

public Checkprop()
{
	new olddate;
	new string[256];
	new curdate = getdate();
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if(HouseInfo[h][hOwned] == 1 && HouseInfo[h][hDate] > 9)
		{
			olddate = HouseInfo[h][hDate];
			if(curdate-olddate >= 3)
			{
				HouseInfo[h][hHel] = 0;
				HouseInfo[h][hArm] = 0;
				HouseInfo[h][hHealthx] = 0;
				HouseInfo[h][hHealthy] = 0;
				HouseInfo[h][hHealthz] = 0;
				HouseInfo[h][hArmourx] = 0;
				HouseInfo[h][hArmoury] = 0;
				HouseInfo[h][hArmourz] = 0;
				HouseInfo[h][hLock] = 1;
				HouseInfo[h][hOwned] = 0;
				HouseInfo[h][hVec] = 418;
				HouseInfo[h][hVcol1] = -1;
				HouseInfo[h][hVcol2] = -1;
				strmid(HouseInfo[h][hOwner], "O estado", 0, strlen("O estado"), 255);
				format(string, sizeof(string), "Uma casa esta disponivel no valor de $%d",HouseInfo[h][hValue]);
				SendClientMessageToAll(TEAM_BALLAS_COLOR, string);
				OnPropUpdate();
			}
		}
	}
	for(new b = 0; b < sizeof(BizzInfo); b++)
	{
		if(BizzInfo[b][bOwned] == 1 && BizzInfo[b][bDate] > 9)
		{
			olddate = BizzInfo[b][bDate];
			if(curdate-olddate >= 3)
			{
				BizzInfo[b][bHel] = 0;
				BizzInfo[b][bArm] = 0;
				BizzInfo[b][bLock] = 1;
				BizzInfo[b][bOwned] = 0;
				strmid(BizzInfo[b][bOwner], "O estado", 0, strlen("O estado"), 255);
				format(string, sizeof(string), "Um negocio esta disponivel no valor de $%d",BizzInfo[b][bValue]);
				SendClientMessageToAll(TEAM_BALLAS_COLOR, string);
				OnPropUpdate();
			}
		}
	}
	for(new c = 0; c < sizeof(SBizzInfo); c++)
	{
		if(SBizzInfo[c][sbOwned] == 1 && SBizzInfo[c][sbDate] > 9)
		{
			olddate = SBizzInfo[c][sbDate];
			if(curdate-olddate >= 3)
			{
				SBizzInfo[c][sbHel] = 0;
				SBizzInfo[c][sbArm] = 0;
				SBizzInfo[c][sbLock] = 1;
				SBizzInfo[c][sbOwned] = 0;
				strmid(SBizzInfo[c][sbOwner], "O estado", 0, strlen("O estado"), 255);
				format(string, sizeof(string), "Um pequeno negocio esta disponivel no valor de $%d",SBizzInfo[c][sbValue]);
				SendClientMessageToAll(TEAM_BALLAS_COLOR, string);
				OnPropUpdate();
			}
		}
	}
	return 1;
}

public PayDay()
{
if (gdebug >= 1){printf("DEBUG PayDay()");}
	new string[128];
	new pay,account,interest;
	new rent = 0;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pLevel] > 0)
		{
			new playername2[MAX_PLAYER_NAME];
			GetPlayerName(i, playername2, sizeof(playername2));
			account = PlayerInfo[i][pAccount];
			new key = PlayerInfo[i][pPhousekey];
			if(key != 255)
			{
				rent = HouseInfo[key][hRent];
				if(strcmp(playername2, HouseInfo[key][hOwner], true) == 0)
				{
					rent = 0;
				}
				else if(rent > GetPlayerMoney(i))
				{
					PlayerInfo[i][pPhousekey] = 255;
					SendClientMessage(i, COLOR_WHITE, "Voce foi expulso!");
					rent = 0;
				}
				HouseInfo[key][hTakings] = HouseInfo[key][hTakings]+rent;
			}
			new tmpintrate;
			if (key != 255 && strcmp(playername2, HouseInfo[key][hOwner], true) == 0)
			{
				tmpintrate = intrate+HouseInfo[key][hLevel];
			}
			else
			{
				tmpintrate = 1;
			}
			interest = (PlayerInfo[i][pAccount]/1000)*(tmpintrate);
			pay = PlayerInfo[i][pLevel]*paycheck;
			PlayerInfo[i][pExp]++;
			PlayerPlayMusic(i);
			GivePlayerMoney(i,pay-rent);
			PlayerInfo[i][pAccount] = account+interest;
			BizzInfo[4][bTakings] = BizzInfo[4][bTakings]+((PlayerInfo[i][pAccount]/1000)+intrate);
			SendClientMessage(i, COLOR_WHITE, "|___ Extrato do Banco de SA por celular ___|");
			format(string, sizeof(string), "  Dinheiro: $%d", account);
			SendClientMessage(i, COLOR_GRAD1, string);
			format(string, sizeof(string), "  Juros: 0.%d porcento",tmpintrate);
			SendClientMessage(i, COLOR_GRAD2, string);
			format(string, sizeof(string), "  Juros ganho $%d", interest);
			SendClientMessage(i, COLOR_GRAD3, string);
			SendClientMessage(i, COLOR_GRAD4, "|--------------------------------------|");
			format(string, sizeof(string), "  Novo balanco: $%d", PlayerInfo[i][pAccount]);
			SendClientMessage(i, COLOR_GRAD5, string);
			format(string, sizeof(string), "  Aluguel: -$%d", rent);
			SendClientMessage(i, COLOR_GRAD5, string);
			format(string, sizeof(string), "~w~Salario~n~~y~do mes ~n~~g~$%d", pay);
			GameTextForPlayer(i, string, 5000, 1);
			rent = 0;
		}
	}
	Checkprop();
	return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
public strtik(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ','))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ',') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return;
}
public split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;

	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}

	return 1;
}

public DelPrint(string1[])
{
	strmid(string1, string1, 0, strlen(string1)-1, 255);
	printf("%s", string1);
}

public LoadPlayer(loaderid,const string[])
{
	new string2[64];
	new loaded = loaderid;
	new valtmp[128];
	format(string2, sizeof(string2), "%s.cer", string);
	new File: file = fopen(string2, io_read);
	if (file)
	{
			fread(file, valtmp);strmid(PLlayerInfo[loaded][plPassword], valtmp, 0, strlen(valtmp)-1, 255);
			fread(file, valtmp);PLlayerInfo[loaded][plCash] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAccount] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAdmin] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plLevel] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plExp] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plDrogaUso] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plTrDrogas] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPetrol] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][glPupgrade] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plKills] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plCB] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plHW] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plSR] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plWA] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPEN] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plGun6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plAmmo6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plSHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPos_x] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPos_y] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPos_z] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plInt] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plLocal] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plTeam] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plModel] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPnumber] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPhousekey] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PLlayerInfo[loaded][plPbiskey] = strval(valtmp);DelPrint(valtmp);
			SendClientMessage(loaderid, COLOR_WHITE, "SERVER: Pronto");
	}
	else
	{
		SendClientMessage(loaderid, COLOR_WHITE, "SERVER: Sem conta com esse nome.");
		return 0;
	}
	return 1;
}

public SavePlayer(loaderid,const string[])
{
	new string3[32];
	new saved = loaderid;
	format(string3, sizeof(string3), "%s.cer", string);
	new File: pFile = fopen(string3, io_write);
	if (pFile)
	{
		new var[32];
		format(var, 32, "%s\n", PLlayerInfo[saved][plPassword]);fwrite(pFile, var);
		fclose(pFile);
		new File: hFile = fopen(string3, io_append);
		format(var, 32, "%d pCash\n",PLlayerInfo[saved][plCash]);fwrite(hFile, var);
		format(var, 32, "%d pAccount\n",PLlayerInfo[saved][plAccount]);fwrite(hFile, var);
		format(var, 32, "%d pAdmin\n",PLlayerInfo[saved][plAdmin]);fwrite(hFile, var);
		format(var, 32, "%d pLevel\n",PLlayerInfo[saved][plLevel]);fwrite(hFile, var);
		format(var, 32, "%d pExp\n",PLlayerInfo[saved][plExp]);fwrite(hFile, var);
		format(var, 32, "%d pDrogaUso\n",PLlayerInfo[saved][plDrogaUso]);fwrite(hFile, var);
		format(var, 32, "%d pTrDrogas\n",PLlayerInfo[saved][plTrDrogas]);fwrite(hFile, var);
		format(var, 32, "%d pPetrol\n",PLlayerInfo[saved][plPetrol]);fwrite(hFile, var);
		format(var, 32, "%d gPupgrade\n",PLlayerInfo[saved][glPupgrade]);fwrite(hFile, var);
		format(var, 32, "%d pKills\n",PLlayerInfo[saved][plKills]);fwrite(hFile, var);
		format(var, 32, "%d pCB\n",PLlayerInfo[saved][plCB]);fwrite(hFile, var);
		format(var, 32, "%d pHW\n",PLlayerInfo[saved][plHW]);fwrite(hFile, var);
		format(var, 32, "%d pSR\n",PLlayerInfo[saved][plSR]);fwrite(hFile, var);
		format(var, 32, "%d pWA\n",PLlayerInfo[saved][plWA]);fwrite(hFile, var);
		format(var, 32, "%d pPEN\n",PLlayerInfo[saved][plPEN]);fwrite(hFile, var);
		format(var, 32, "%d pGun1\n",PLlayerInfo[saved][plGun1]);fwrite(hFile, var);
		format(var, 32, "%d pGun2\n",PLlayerInfo[saved][plGun2]);fwrite(hFile, var);
		format(var, 32, "%d pGun3\n",PLlayerInfo[saved][plGun3]);fwrite(hFile, var);
		format(var, 32, "%d pGun4\n",PLlayerInfo[saved][plGun4]);fwrite(hFile, var);
		format(var, 32, "%d pGun5\n",PLlayerInfo[saved][plGun5]);fwrite(hFile, var);
		format(var, 32, "%d pGun6\n",PLlayerInfo[saved][plGun6]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo1\n",PLlayerInfo[saved][plAmmo1]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo2\n",PLlayerInfo[saved][plAmmo2]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo3\n",PLlayerInfo[saved][plAmmo3]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo4\n",PLlayerInfo[saved][plAmmo4]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo5\n",PLlayerInfo[saved][plAmmo5]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo6\n",PLlayerInfo[saved][plAmmo6]);fwrite(hFile, var);
		format(var, 32, "%.1f pSHealth\n", PLlayerInfo[saved][plSHealth]);fwrite(hFile, var);
		format(var, 32, "%.1f pHealth\n", PLlayerInfo[saved][plHealth]);fwrite(hFile, var);
		format(var, 32, "%.1f pPos_x\n", PLlayerInfo[saved][plPos_x]);fwrite(hFile, var);
		format(var, 32, "%.1f pPos_y\n", PLlayerInfo[saved][plPos_y]);fwrite(hFile, var);
		format(var, 32, "%.1f pPos_z\n", PLlayerInfo[saved][plPos_z]);fwrite(hFile, var);
		format(var, 32, "%d pInt\n",PLlayerInfo[saved][plInt]);fwrite(hFile, var);
		format(var, 32, "%d pLocal\n",PLlayerInfo[saved][plLocal]);fwrite(hFile, var);
		format(var, 32, "%d pTeam\n",PLlayerInfo[saved][plTeam]);fwrite(hFile, var);
		format(var, 32, "%d pModel\n",PLlayerInfo[saved][plModel]);fwrite(hFile, var);
		format(var, 32, "%d pPnumber\n",PLlayerInfo[saved][plPnumber]);fwrite(hFile, var);
		format(var, 32, "%d pPhousekey\n",PLlayerInfo[saved][plPhousekey]);fwrite(hFile, var);
		format(var, 32, "%d pPbiskey\n",PLlayerInfo[saved][plPbiskey]);fwrite(hFile, var);
		fclose(hFile);
	}
	return 1;
}


public OnPlayerLogin(playerid,const string[])
{
	if (gdebug >= 1){printf("DEBUG OnPlayerLogin(%d) (%s)", playerid,string);}
	new string2[64];
	new playername2[MAX_PLAYER_NAME];
	//new password[64];
	new tmp2[256];
	/*
	if (gPlayerSpawned[playerid] == 1)
	{
		SetPlayerHealth(playerid,0.0);
	}
	*/
	GetPlayerName(playerid, playername2, sizeof(playername2));
	format(string2, sizeof(string2), "%s.cer", playername2);
	new File: file = fopen(string2, io_read);
	if (file)
	{
		new valtmp[128];
		fread(file, valtmp);strmid(PlayerInfo[playerid][pPassword], valtmp, 0, strlen(valtmp)-1, 255);
		if (gdebug){printf("DEBUG password from file= (%s) pass enterd =  (%s)",PlayerInfo[playerid][pPassword] ,string );}
		//fread(file, valtmp);strmid(password, valtmp, 0, strlen(string), 255);
		if ((strcmp(PlayerInfo[playerid][pPassword], string, true, strlen(valtmp)-1) == 0))// && (strlen(string) == strlen(password)))
		{
			fread(file, valtmp);PlayerInfo[playerid][pCash] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAccount] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAdmin] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pLevel] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pExp] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pDrogaUso] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pTrDrogas] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPetrol] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][gPupgrade] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pKills] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pCB] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pHW] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pSR] = strval(valtmp);DelPrint(valtmp);
			if(PlayerInfo[playerid][pKills] < 0){PlayerInfo[playerid][pKills] = 0;}//patch
			if(PlayerInfo[playerid][pCB] < 0){PlayerInfo[playerid][pCB] = 0;}//patch
			if(PlayerInfo[playerid][pHW] < 0){PlayerInfo[playerid][pHW] = 0;}//patch
			if(PlayerInfo[playerid][pSR] < 0){PlayerInfo[playerid][pSR] = 0;}//patch
			fread(file, valtmp);PlayerInfo[playerid][pWA] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPEN] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pGun6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo1] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo2] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo3] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo4] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo5] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pAmmo6] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pSHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pHealth] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPos_x] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPos_y] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPos_z] = floatstr(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pInt] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pLocal] = strval(valtmp);DelPrint(valtmp);
			if(PlayerInfo[playerid][pModel] == 264){fread(file, valtmp);PlayerInfo[playerid][pTeam] = strval(valtmp);DelPrint(valtmp);}else{fread(file, valtmp);}
			if(PlayerInfo[playerid][pModel] == 264){fread(file, valtmp);PlayerInfo[playerid][pModel] = strval(valtmp);DelPrint(valtmp);}else{fread(file, valtmp);}
			fread(file, valtmp);PlayerInfo[playerid][pPnumber] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPhousekey] = strval(valtmp);DelPrint(valtmp);
			fread(file, valtmp);PlayerInfo[playerid][pPbiskey] = strval(valtmp);DelPrint(valtmp);
			fclose(file);
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);

			//if (gdebug){printf("DEBUG phonenumber = %d",pnumber);}
			if(PlayerInfo[playerid][pLevel] == -999) //autoban
			{
				Ban(playerid);
			}
			if(PlayerInfo[playerid][pLevel] == -1) //autokick
			{
				kick(playerid);
			}
			format(string2, sizeof(string2), "SERVER: Bem vindo %s",playername2);
			SendClientMessage(playerid, COLOR_WHITE,string2);
			printf("%s entrou no server",playername2);
			if (PlayerInfo[playerid][pAdmin] > 0)
			{
				format(string2, sizeof(string2), "SERVER: Voce logou como %d admin",PlayerInfo[playerid][pAdmin]);
				SendClientMessage(playerid, COLOR_WHITE,string2);
			}
			SetSpawnInfo(playerid, 1, PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
			if(gTeam[playerid] == 0)
			{
				gTeam[playerid] = 3;
			}
			else
			{
				gTeam[playerid] = PlayerInfo[playerid][pTeam];
			}
			gPlayerLogged[playerid] = 1;
			if(accountplay)
			{
				gPlayerSpawned[playerid] = 0;
			}
			SpawnPlayer(playerid);
			EscolhendoClasse[playerid] = 0;
			GetPlayerName(playerid, playername2, sizeof(playername2));
			format(tmp2, sizeof(tmp2), "~w~Bem Vindo ~n~~y~   %s", playername2);
			DateProp(playerid);
			GameTextForPlayer(playerid, tmp2, 5000, 1);
			SendClientMessage(playerid, COLOR_YELLOW, motd);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: Senha incorreta.");
			printf("%s errou a senha",playername2);
			fclose(file);
			return 1;
		}
		return 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "SERVER: Voce nao tem uma conta, coloque /registrar <senha>");
	}
	return 1;
}

public CopCheck(playerid)
{
	if (gdebug >= 1){printf("DEBUG CopCheck(%d) (%s)", playerid);}
	new playername2[MAX_PLAYER_NAME];
	new storedcopname[64];
	GetPlayerName(playerid, playername2, sizeof(playername2));
	new File: file = fopen("cops.cfg", io_read);
	if (file)
	{
		new valtmp[MAX_PLAYER_NAME];
		while (fread(file, valtmp) > 0)
		{
			//printf("%s",valtmp);
			strmid(storedcopname, valtmp, 0, strlen(playername2), 255);
			if ((strcmp(storedcopname, playername2, true, strlen(playername2)) == 0) && (strlen(playername2) == strlen(storedcopname)))
			{
				fclose(file);
				return 1;
			}
		}
	}
	fclose(file);
	return 0;
}

public MedCheck(playerid)
{
	if (gdebug >= 1){printf("DEBUG MedCheck(%d) (%s)", playerid);}
	new playername2[MAX_PLAYER_NAME];
	new storedcopname[64];
	GetPlayerName(playerid, playername2, sizeof(playername2));
	new File: file = fopen("meds.cfg", io_read);
	if (file)
	{
		new valtmp[MAX_PLAYER_NAME];
		while (fread(file, valtmp) > 0)
		{
			//printf("%s",valtmp);
			strmid(storedcopname, valtmp, 0, strlen(playername2), 255);
			if ((strcmp(storedcopname, playername2, true, strlen(playername2)) == 0) && (strlen(playername2) == strlen(storedcopname)))
			{
				fclose(file);
				return 1;
			}
		}
	}
	fclose(file);
	return 0;
}
public OnPlayerUpdate(playerid)
{
	if (gdebug >= 1){printf("DEBUG OnPlayerUpdate(%d)", playerid);}
	if (gPlayerLogged[playerid] != 0)
	{
		new string3[32];
		new playername3[MAX_PLAYER_NAME];
		GetPlayerName(playerid, playername3, sizeof(playername3));
		format(string3, sizeof(string3), "%s.cer", playername3);
		new File: pFile = fopen(string3, io_write);
		if (gdebug){printf("DEBUG OnPlayerUpdate(%d)8.5", playerid);}
		if (pFile)
		{
			new var[32];
			format(var, 32, "%s\n", PlayerInfo[playerid][pPassword]);fwrite(pFile, var);
			fclose(pFile);
			new File: hFile = fopen(string3, io_append);
			PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
			format(var, 32, "%d pCash\n",PlayerInfo[playerid][pCash]);fwrite(hFile, var);
			format(var, 32, "%d pAccount\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
			format(var, 32, "%d pAdmin\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
			format(var, 32, "%d pLevel\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
			format(var, 32, "%d pExp\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
			format(var, 32, "%d pDrogaUso\n",PlayerInfo[playerid][pDrogaUso]);fwrite(hFile, var);
			format(var, 32, "%d pTrDrogas\n",PlayerInfo[playerid][pTrDrogas]);fwrite(hFile, var);
			format(var, 32, "%d pPetrol\n",PlayerInfo[playerid][pPetrol]);fwrite(hFile, var);
			format(var, 32, "%d gPupgrade\n",PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
			format(var, 32, "%d pKills\n",PlayerInfo[playerid][pKills]);fwrite(hFile, var);
			format(var, 32, "%d pCB\n",PlayerInfo[playerid][pCB]);fwrite(hFile, var);
			format(var, 32, "%d pHW\n",PlayerInfo[playerid][pHW]);fwrite(hFile, var);
			format(var, 32, "%d pSR\n",PlayerInfo[playerid][pSR]);fwrite(hFile, var);
			format(var, 32, "%d pWA\n",PlayerInfo[playerid][pWA]);fwrite(hFile, var);
			format(var, 32, "%d pPEN\n",PlayerInfo[playerid][pPEN]);fwrite(hFile, var);
			format(var, 32, "%d pGun1\n",PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
			format(var, 32, "%d pGun2\n",PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
			format(var, 32, "%d pGun3\n",PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
			format(var, 32, "%d pGun4\n",PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
			format(var, 32, "%d pGun5\n",PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
			format(var, 32, "%d pGun6\n",PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo1\n",PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo2\n",PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo3\n",PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo4\n",PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo5\n",PlayerInfo[playerid][pAmmo5]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo6\n",PlayerInfo[playerid][pAmmo6]);fwrite(hFile, var);
			format(var, 32, "%.1f pSHealth\n", PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
			GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
			format(var, 32, "%.1f pHealth\n", PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
			GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
			if ((PlayerInfo[playerid][pPos_x]==0.0 && PlayerInfo[playerid][pPos_y]==0.0 && PlayerInfo[playerid][pPos_z]==0.0) || (gPlayerFighter[playerid] != 0))
			{
				PlayerInfo[playerid][pPos_x] = 1684.9;
				PlayerInfo[playerid][pPos_y] = -2244.5;
				PlayerInfo[playerid][pPos_z] = 13.5;
			}
			if(Spectate[playerid] != 255)
			{
				PlayerInfo[playerid][pPos_x] = Unspec[playerid][sPx];
				PlayerInfo[playerid][pPos_y] = Unspec[playerid][sPy];
				PlayerInfo[playerid][pPos_z] = Unspec[playerid][sPz];
				PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
			}
			format(var, 32, "%.1f pPos_x\n", PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_y\n", PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_z\n", PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
			format(var, 32, "%d pInt\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
			format(var, 32, "%d pLocal\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
			format(var, 32, "%d pTeam\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
			format(var, 32, "%d pModel\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
			format(var, 32, "%d pPnumber\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
			format(var, 32, "%d pPhousekey\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
			format(var, 32, "%d pPbiskey\n",PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
			fclose(hFile);
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Voce nao tem uma conta, coloque /registrar <senha>");
	}
	if (gdebug){printf("DEBUG OnPlayerUpdate(%d)End", playerid);}
	return 1;
}

public OnPlayerRename(name[],string[],playerid)
{
	if (gdebug >= 1){printf("DEBUG OnPlayerRename(%d)", playerid);}
	if (gPlayerLogged[playerid] != 0)
	{
		new File: pFile = fopen(string, io_write);
		if (gdebug){printf("DEBUG OnPlayerUpdate(%d)8.5", playerid);}
		if (pFile)
		{
			new var[32];
			format(var, 32, "%s\n", PlayerInfo[playerid][pPassword]);fwrite(pFile, var);
			fclose(pFile);
			new File: hFile = fopen(string, io_append);
			PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
			format(var, 32, "%d pCash\n",PlayerInfo[playerid][pCash]);fwrite(hFile, var);
			format(var, 32, "%d pAccount\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
			format(var, 32, "%d pAdmin\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
			format(var, 32, "%d pLevel\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
			format(var, 32, "%d pExp\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
			format(var, 32, "%d pDrogaUso\n",PlayerInfo[playerid][pDrogaUso]);fwrite(hFile, var);
			format(var, 32, "%d pTrDrogas\n",PlayerInfo[playerid][pTrDrogas]);fwrite(hFile, var);
			format(var, 32, "%d pPetrol\n",PlayerInfo[playerid][pPetrol]);fwrite(hFile, var);
			format(var, 32, "%d gPupgrade\n",PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
			format(var, 32, "%d pKills\n",PlayerInfo[playerid][pKills]);fwrite(hFile, var);
			format(var, 32, "%d pCB\n",PlayerInfo[playerid][pCB]);fwrite(hFile, var);
			format(var, 32, "%d pHW\n",PlayerInfo[playerid][pHW]);fwrite(hFile, var);
			format(var, 32, "%d pSR\n",PlayerInfo[playerid][pSR]);fwrite(hFile, var);
			format(var, 32, "%d pWA\n",PlayerInfo[playerid][pWA]);fwrite(hFile, var);
			format(var, 32, "%d pPEN\n",PlayerInfo[playerid][pPEN]);fwrite(hFile, var);
			format(var, 32, "%d pGun1\n",PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
			format(var, 32, "%d pGun2\n",PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
			format(var, 32, "%d pGun3\n",PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
			format(var, 32, "%d pGun4\n",PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
			format(var, 32, "%d pGun5\n",PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
			format(var, 32, "%d pGun6\n",PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo1\n",PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo2\n",PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo3\n",PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo4\n",PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo5\n",PlayerInfo[playerid][pAmmo5]);fwrite(hFile, var);
			format(var, 32, "%d pAmmo6\n",PlayerInfo[playerid][pAmmo6]);fwrite(hFile, var);
			format(var, 32, "%.1f pSHealth\n", PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
			GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
			format(var, 32, "%.1f pHealth\n", PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
			GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
			if ((PlayerInfo[playerid][pPos_x]==0.0 && PlayerInfo[playerid][pPos_y]==0.0 && PlayerInfo[playerid][pPos_z]==0.0) || (gPlayerFighter[playerid] != 0))
			{
				PlayerInfo[playerid][pPos_x] = 1684.9;
				PlayerInfo[playerid][pPos_y] = -2244.5;
				PlayerInfo[playerid][pPos_z] = 13.5;
			}
			if(Spectate[playerid] != 255)
			{
				PlayerInfo[playerid][pPos_x] = Unspec[playerid][sPx];
				PlayerInfo[playerid][pPos_y] = Unspec[playerid][sPy];
				PlayerInfo[playerid][pPos_z] = Unspec[playerid][sPz];
				PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
			}
			format(var, 32, "%.1f pPos_x\n", PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_y\n", PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
			format(var, 32, "%.1f pPos_z\n", PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
			format(var, 32, "%d pInt\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
			format(var, 32, "%d pLocal\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
			format(var, 32, "%d pTeam\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
			format(var, 32, "%d pModel\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
			format(var, 32, "%d pPnumber\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
			format(var, 32, "%d pPhousekey\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
			format(var, 32, "%d pPbiskey\n",PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
			fclose(hFile);
		}
		new bkey = PlayerInfo[playerid][pPbiskey];
		new hkey = PlayerInfo[playerid][pPhousekey];
		new playername[32];
		if(bkey != 255)
		{
			if(bkey >= 100)
			{
				strmid(SBizzInfo[bkey-100][sbOwner], name, 0, strlen(name), 255);
			}
			else
			{
				strmid(BizzInfo[bkey][bOwner], name, 0, strlen(name), 255);
			}
		}
		GetPlayerName(playerid, playername, sizeof(playername));
		if (hkey != 255 && strcmp(playername, HouseInfo[hkey][hOwner], true) == 0)
		{
			strmid(HouseInfo[hkey][hOwner], name, 0, strlen(name), 255);
		}
		OnPropUpdate();
	}
	else
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Voce nao tem uma conta, coloque /registrar <senha>");
	}
	if (gdebug){printf("DEBUG OnPlayerUpdate(%d)End", playerid);}
	return 1;
}

public OnPropUpdate()
{
	if (gdebug >= 1){printf("DEBUG OnPropUpdate()");}
	new idx;
	new File: file2;
	while (idx < sizeof(HouseInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%d,%d,%d,%d,%d,%d,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
		HouseInfo[idx][hEntrancex],
		HouseInfo[idx][hEntrancey],
		HouseInfo[idx][hEntrancez],
		HouseInfo[idx][hExitx],
		HouseInfo[idx][hExity],
		HouseInfo[idx][hExitz],
		HouseInfo[idx][hHealthx],
		HouseInfo[idx][hHealthy],
		HouseInfo[idx][hHealthz],
		HouseInfo[idx][hArmourx],
		HouseInfo[idx][hArmoury],
		HouseInfo[idx][hArmourz],
		HouseInfo[idx][hOwner],
		HouseInfo[idx][hDiscription],
		HouseInfo[idx][hValue],
		HouseInfo[idx][hHel],
		HouseInfo[idx][hArm],
		HouseInfo[idx][hInt],
		HouseInfo[idx][hLock],
		HouseInfo[idx][hOwned],
		HouseInfo[idx][hRooms],
		HouseInfo[idx][hRent],
		HouseInfo[idx][hRentabil],
		HouseInfo[idx][hTakings],
		HouseInfo[idx][hVec],
		HouseInfo[idx][hVcol1],
		HouseInfo[idx][hVcol2],
		HouseInfo[idx][hDate],
		HouseInfo[idx][hLevel]);
		if(idx == 0)
		{
			file2 = fopen("property.cfg", io_write);
		}
		else
		{
			file2 = fopen("property.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	idx = 0;
	while (idx < sizeof(BizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%d,%d,%d,%d,%d,%d,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
		BizzInfo[idx][bEntrancex],
		BizzInfo[idx][bEntrancey],
		BizzInfo[idx][bEntrancez],
		BizzInfo[idx][bExitx],
		BizzInfo[idx][bExity],
		BizzInfo[idx][bExitz],
		BizzInfo[idx][bHealthx],
		BizzInfo[idx][bHealthy],
		BizzInfo[idx][bHealthz],
		BizzInfo[idx][bArmourx],
		BizzInfo[idx][bArmoury],
		BizzInfo[idx][bArmourz],
		BizzInfo[idx][bOwner],
		BizzInfo[idx][bDiscription],
		BizzInfo[idx][bValue],
		BizzInfo[idx][bHel],
		BizzInfo[idx][bArm],
		BizzInfo[idx][bInt],
		BizzInfo[idx][bLock],
		BizzInfo[idx][bOwned],
		BizzInfo[idx][bEntcost],
		BizzInfo[idx][bTakings],
		BizzInfo[idx][bDate],
		BizzInfo[idx][bLevel],
		BizzInfo[idx][bProd],
		BizzInfo[idx][bProdCap],
		BizzInfo[idx][bComp],
		BizzInfo[idx][bCompCap],
		BizzInfo[idx][bProdCost],
		BizzInfo[idx][bPayComp],
		BizzInfo[idx][bPriceMod]);
		if(idx == 0)
		{
			file2 = fopen("bizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("bizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	idx = 0;
	while (idx < sizeof(SBizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
		SBizzInfo[idx][sbEntrancex],
		SBizzInfo[idx][sbEntrancey],
		SBizzInfo[idx][sbEntrancez],
		SBizzInfo[idx][sbOwner],
		SBizzInfo[idx][sbDiscription],
		SBizzInfo[idx][sbValue],
		SBizzInfo[idx][sbHel],
		SBizzInfo[idx][sbArm],
		SBizzInfo[idx][sbInt],
		SBizzInfo[idx][sbLock],
		SBizzInfo[idx][sbOwned],
		SBizzInfo[idx][sbEntcost],
		SBizzInfo[idx][sbTakings],
		SBizzInfo[idx][sbDate],
		SBizzInfo[idx][sbLevel],
		SBizzInfo[idx][sbProd],
		SBizzInfo[idx][sbProdCap],
		SBizzInfo[idx][sbComp],
		SBizzInfo[idx][sbCompCap],
		SBizzInfo[idx][sbProdCost],
		SBizzInfo[idx][sbPayComp]);
		if(idx == 0)
		{
			file2 = fopen("sbizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("sbizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public BroadCast(color,const string[])
{
	printf("%s", string);
	SendClientMessageToAll(color, string);
	return 1;
}

public ABroadCast(color,const string[],level)
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if ((IsPlayerAdmin(i)) || PlayerInfo[i][pAdmin] >= level)
			{
				SendClientMessage(i, color, string);
				printf("%s", string);
			}
		}
	}
	return 1;
}

public OOCOff(color,const string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && !gOoc[i])
		{
			SendClientMessage(i, color, string);
		}
	}
}

public PlaySoundAll(playerid, soundid, Float:psx ,Float:psy ,Float:psz)
{
	if (gdebug >= 1){printf("DEBUG PlaySoundAll(%d)", playerid);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, soundid, psx, psy, psz);
		}
	}
}

public SendTeamMessage(team, color, string[])
{
if (gdebug >= 1){printf("DEBUG SendTeamMessage(%d)", team);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gTeam[i] == team)
		{
			SendClientMessage(i, color, string);
		}
	}
}

public SendTeamBeepMessage(team, color, string[])
{
if (gdebug >= 1){printf("DEBUG SendTeamMessage(%d)", team);}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gTeam[i] == team)
		{
			SendClientMessage(i, color, string);
			RingTone[i] = 20;
		}
	}
}

public SendEnemyMessage(color, string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && gTeam[i] >= 3)
		{
			SendClientMessage(i, color, string);
		}
	}
}


public SendAdminMessage(color, string[])
{
if (gdebug >= 1){printf("DEBUG SendAdminMessage()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pAdmin] > 1)
		{
			SendClientMessage(i, color, string);
		}
	}
}

public AddCar(carcoords)
{
	new randcol = random(126);
	new randcol2 = 1;
	if (rccounter == 14)
	{
		rccounter = 0;
	}
	CreateVehicle(carselect[rccounter], CarSpawns[carcoords][pos_x], CarSpawns[carcoords][pos_y], CarSpawns[carcoords][pos_z], CarSpawns[carcoords][z_angle], randcol, randcol2, -1);
	//AddStaticVehicle(carselect[rccounter], CarSpawns[carindex][pos_x], CarSpawns[carindex][pos_y], CarSpawns[carindex][pos_z], CarSpawns[carindex][z_angle],randcol,randcol2); // nm
	rccounter++;
	return 1;
}

public PlayerPlayMusic(playerid)
{
if (gdebug >= 1){printf("DEBUG PlayerPlayMusic(%d)",playerid);}
	SetTimer("StopMusic", 5000, 0);
	PlayerPlaySound(playerid, 1068, 0.0, 0.0, 0.0);
}

public StopMusic()
{
if (gdebug >= 1){printf("DEBUG StopMusic()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);
		}
	}
}

public PlayerFixRadio(playerid)
{
if (gdebug >= 1){printf("DEBUG PlayerPlayMusic(%d)",playerid);}
	SetTimer("PlayerFixRadio2", 50, 0);
	PlayerPlaySound(playerid, 1068, 0.0, 0.0, 0.0);
	Fixr[playerid] = 1;
}

public PlayerFixRadio2()
{
if (gdebug >= 1){printf("DEBUG StopMusic()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(Fixr[i])
			{
				PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);
				Fixr[i] = 0;
			}
		}
	}
}

public PlayJailSound(sound , stopsound, duration, Float:jailx, Float:jaily, Float:jailz)
{
if (gdebug >= 1){printf("DEBUG PlayJailSound()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, sound, jailx, jaily, jailz);
			//printf("startjail %d",i);
			stopsoundt = stopsound;
			jailxt = jailx;
			jailyt = jaily;
			jailzt = jailz;
		}
	}
	SetTimer("StopJail", duration, 0);
}

public StopJail()
{
if (gdebug >= 1){printf("DEBUG StopJail()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			PlayerPlaySound(i, stopsoundt, jailxt, jailyt, jailzt);
			//printf("stopjail %d",i);
		}
	}
}

//---------------------------<[ OnPlayerCommandText ]>--------------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
if (gdebug >= 1){printf("DEBUG OnPlayerCommandText(%d)",playerid);}
	CmdLog(cmdtext);
	new string[256];
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new playername[MAX_PLAYER_NAME];
	new cmd[256];
	new tmp[256];
	new giveplayerid, moneys, idx;
	cmd = strtok(cmdtext, idx);
	
//-------------------------------[Novos Comandos]---------------------------------------------------


//-------------------------------[Pay]--------------------------------------------------------------------------
	if (PlayerInfo[playerid][pAdmin] <= 1)
	{
	if(ComandosDesativados[playerid] == 1)
	{
	SendClientMessage(playerid, COLOR_GRAD1, "Voce nao pode usar comandos durante uma missao.");
	return 1;
	}
	}
	if (PlayerInfo[playerid][pAdmin] <= 1)
	{
	if(ComandosDesativados2[playerid] == 1)
	{
	SendClientMessage(playerid, COLOR_GRAD1, "Voce nao pode usar comandos, leia primeiro /regras /rpg /comandos /ajuda.");
	return 1;
	}
	}
	if(strcmp(cmd, "/pagar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /pagar [Id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(PlayerInfo[giveplayerid][pLocal] == 106)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce nao pode fazer isso neste local...");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /pagar [Id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		moneys = strval(tmp);
		if(moneys > 1000 && PlayerInfo[playerid][pLevel] < 3)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce deve ter nivel 3 para pagar mais que 1000 por vez.");
			return 1;
		}

		//if (gdebug){printf("DEBUG givecash_command: %d %d",giveplayerid,moneys);}
		if (IsPlayerConnected(giveplayerid))
		{
			if (ProxDetectorS(5.0, playerid, giveplayerid))
			{
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				playermoney = GetPlayerMoney(playerid);
				if (moneys > 0 && playermoney >= moneys)
				{
					GivePlayerMoney(playerid, (0 - moneys));
					GivePlayerMoney(giveplayerid, moneys);
					format(string, sizeof(string), "   Voce deu para o %s(player: %d), $%d.", giveplayer,giveplayerid, moneys);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					format(string, sizeof(string), "   Voce recebeu $%d do %s(player: %d).", moneys, sendername, playerid);
					SendClientMessage(giveplayerid, COLOR_GRAD1, string);
					format(string, sizeof(string), "%s pagou voce $%d para %s", sendername, moneys, giveplayer);
					PayLog(string);
					if(moneys >= 1000000)
					{
						ABroadCast(COLOR_YELLOW,string,1);
					}
					PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s retira algum dinheiro do bolso e da para o %s.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   Quantidade Invalida.");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Voce esta muito longe, chegue mais perto.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d nao e um jogador ativo.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if (strcmp(cmd , "/desarmar", true) ==0)
     {
     if (IsPlayerAdmin (playerid))
     {
     tmp = strtok (cmdtext, idx);
     if (!strlen (tmp))
     {
     SendClientMessage (playerid, 0xFFFF00AA, "USO /desarmar [id do jogador]");
     }
     if (IsPlayerConnected (playerid))
     {
     ResetPlayerWeapons (giveplayerid);
     }
     else
     {
     SendClientMessage (playerid,0xFFFF00AA, "Id invalido!");
     }
     }
     else
         {
     SendClientMessage (playerid, 0xFFFF00AA, "Voce nao e um admin!");
     }
     return 1;
         }
         
	if(strcmp(cmd, "/doar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /doar [quantidade]");
			return 1;
		}
		if(PlayerInfo[giveplayerid][pLocal] == 106)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Comando nao permitido neste local.");
			return 1;
		}
		moneys = strval(tmp);
		if(moneys < 0)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Nao e o suficiente.");
			return 1;
		}
		GivePlayerMoney(playerid, (-moneys));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Obrigado pela doacao de, $%d. Voce ajudou uma pessoa carente.",sendername, moneys);
		format(string, sizeof(string), "** %s retira $%d do bolso e faz uma doacao para as criancas carentes **.", sendername ,moneys);
		printf("%s", string);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		SendClientMessage(playerid, COLOR_GRAD1, string);
		PayLog(string);
		return 1;
	}
//-------------------------------[Register]--------------------------------------------------------------------------
	if (strcmp(cmd, "/registrar", true)==0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /registrar [senha]");
			return 1;
		}
		if (gPlayerAccount[playerid] == 1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Nome ja registrado, escolha outro nome...");
			return 1;
		}
		gPlayerAccount[playerid] = 1;
		/*
			SetPlayerInterior(playerid,2);
			SetPlayerPos(playerid,1216.699000,-6.416779,1001.328000);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,1216.699000-1.5,-6.416779,1001.328000+0.7);
			SetPlayerCameraLookAt(playerid,1216.699000,-6.416779,1001.328000+0.7);
			GameTextForPlayer(playerid, "~w~Now Select a character and type /login <your password>", 10000, 3);*/
		strmid(PlayerInfo[playerid][pPassword], tmp, 0, strlen(cmdtext), 255);
		Encript(PlayerInfo[playerid][pPassword]);
		GetPlayerName(playerid, playername, sizeof(playername));
		format(string, sizeof(string), "%s.cer", playername);
		PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
		new File: file = fopen(string, io_read);
		if (file)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Nome ja registrado, escolha outro nome...");
			fclose(file);
			return 1;
		}
	//	new Float:px, Float:py, Float:pz;//
	//	new Float:health;//
		//new randphone = 1000 + random(8999);//minimum 1000  max 9999 //giving one at the start
		//PlayerInfo[playerid][pPnumber] = randphone;
		printf("%s criou uma conta.", playername);
		new File:hFile;
		hFile = fopen(string, io_append);
		new var[32];//
		format(var, 32, "%s\n", PlayerInfo[playerid][pPassword]);fwrite(hFile, var);
		format(var, 32, "%d pCash\n", PlayerInfo[playerid][pCash]);fwrite(hFile, var);
		format(var, 32, "%d pAccount\n", PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
		format(var, 32, "%d pAdmin\n", PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
		format(var, 32, "%d pLevel\n", PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
		format(var, 32, "%d pExp\n", PlayerInfo[playerid][pExp]);fwrite(hFile, var);
		format(var, 32, "%d pDrogaUso\n", PlayerInfo[playerid][pDrogaUso]);fwrite(hFile, var);
		format(var, 32, "%d pTrDrogas\n", PlayerInfo[playerid][pTrDrogas]);fwrite(hFile, var);
		format(var, 32, "%d pPetrol\n", PlayerInfo[playerid][pPetrol]);fwrite(hFile, var);
		format(var, 32, "%d gPupgrade\n", PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
		format(var, 32, "%d pKills\n", PlayerInfo[playerid][pKills]);fwrite(hFile, var);
		format(var, 32, "%d pCB\n", PlayerInfo[playerid][pCB]);fwrite(hFile, var);
		format(var, 32, "%d pHW\n", PlayerInfo[playerid][pHW]);fwrite(hFile, var);
		format(var, 32, "%d pSR\n", PlayerInfo[playerid][pSR]);fwrite(hFile, var);
		format(var, 32, "%d pWA\n", PlayerInfo[playerid][pWA]);fwrite(hFile, var);
		format(var, 32, "%d pPEN\n", PlayerInfo[playerid][pPEN]);fwrite(hFile, var);
		format(var, 32, "%d pGun1\n", PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
		format(var, 32, "%d pGun2\n", PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
		format(var, 32, "%d pGun3\n", PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
		format(var, 32, "%d pGun4\n", PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
		format(var, 32, "%d pGun5\n", PlayerInfo[playerid][pGun5]);fwrite(hFile, var);
		format(var, 32, "%d pGun6\n", PlayerInfo[playerid][pGun6]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo1\n", PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo2\n", PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo3\n", PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo4\n", PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo5\n", PlayerInfo[playerid][pAmmo5]);fwrite(hFile, var);
		format(var, 32, "%d pAmmo6\n", PlayerInfo[playerid][pAmmo6]);fwrite(hFile, var);
		format(var, 32, "%f pSHealth\n", PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
		format(var, 32, "%f pHealth\n", PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
		format(var, 32, "%f pPos_x\n", PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
		format(var, 32, "%f pPos_y\n", PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
		format(var, 32, "%f pPos_z\n", PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
		if(accountplay)
		{
			PlayerInfo[playerid][pInt] = 0;
		}
		format(var, 32, "%d pInt\n", PlayerInfo[playerid][pInt]);fwrite(hFile, var);
		format(var, 32, "%d pLocal\n", PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
		format(var, 32, "%d pTeam\n", PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
		format(var, 32, "%d pModel\n", PlayerInfo[playerid][pModel]);fwrite(hFile, var);
		format(var, 32, "%d pPnumber\n", PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
		format(var, 32, "%d pPhousekey\n", PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
		format(var, 32, "%d pPbiskey\n", PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
		fclose(hFile);
		SendClientMessage(playerid, COLOR_WHITE, "SERVER: Conta criada, proxima vez que conectar coloque (/login <senha>)");
		OnPlayerLogin(playerid,PlayerInfo[playerid][pPassword]);
		return 1;
	}
//-------------------------------[Register]--------------------------------------------------------------------------
	if (strcmp(cmd, "/mudarsenha", true)==0)
	{
		tmp = strtok(cmdtext, idx);
		if (gPlayerLogged[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao esta logado");
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /mudarsenha [senha]");
			return 1;
		}
		strmid(PlayerInfo[playerid][pPassword], tmp, 0, strlen(cmdtext), 255);
		format(string, sizeof(string), "Sua nova senha e ( %s ) nao esqueca isso!", PlayerInfo[playerid][pPassword]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		Encript(PlayerInfo[playerid][pPassword]);
		OnPlayerUpdate(playerid);
		GetPlayerName(playerid, playername, sizeof(playername));
		printf("%s mudou a senha.", playername);
		return 1;
	}
	if (strcmp(cmd, "/mudarnome", true)==0)
	{
		tmp = strtok(cmdtext, idx);
		new string2[256];
		if (gPlayerLogged[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao esta logado");
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /mudarnome [novo nome]");
			return 1;
		}
		format(string, sizeof(string), "%s.cer", tmp);
		if(fexist(string))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Nome ja registrado.");
			return 1;
		}
		OnPlayerRename(tmp,string,playerid);
		format(string, sizeof(string), "Voce deve se reconectar com o nome (%s) na esqueca...", tmp);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		GetPlayerName(playerid, playername, sizeof(playername));
		format(string2, sizeof(string2), "%s.cer", playername);
		printf("%s mudou o nome para %s.", playername,tmp);
		gPlayerLogged[playerid] = 0;
		fremove(string2);
		return 1;
	}
//-------------------------------[Level]--------------------------------------------------------------------------
	if (strcmp(cmd, "/meustatus", true) == 0)
	{
		if (gPlayerLogged[playerid] != 0)
		{
			PrintPlayerWeapons(playerid,playerid);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao esta logado");
		}
		return 1;
	}
	if(strcmp(cmd, "/dn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly, slz-2);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao e um admin");
		}
		return 1;
	}
	if(strcmp(cmd, "/up", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly, slz+2);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao e um admin");
		}
		return 1;
	}
	if (strcmp(cmd, "/voar", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:px, Float:py, Float:pz, Float:pa;
			GetPlayerFacingAngle(playerid,pa);
			if(pa >= 0.0 && pa <= 22.5) //n1
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px, py+30, pz+5);
			}
			if(pa >= 332.5 && pa < 0.0) //n2
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px, py+30, pz+5);
			}
			if(pa >= 22.5 && pa <= 67.5) //nw
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px-15, py+15, pz+5);
			}
			if(pa >= 67.5 && pa <= 112.5) //w
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px-30, py, pz+5);
			}
			if(pa >= 112.5 && pa <= 157.5) //sw
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px-15, py-15, pz+5);
			}
			if(pa >= 157.5 && pa <= 202.5) //s
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px, py-30, pz+5);
			}
			if(pa >= 202.5 && pa <= 247.5)//se
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px+15, py-15, pz+5);
			}
			if(pa >= 247.5 && pa <= 292.5)//e
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px+30, py, pz+5);
			}
			if(pa >= 292.5 && pa <= 332.5)//e
			{
				GetPlayerPos(playerid, px, py, pz);
				SetPlayerPos(playerid, px+15, py+15, pz+5);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao e um admin");
		}
		return 1;
	}
	if(strcmp(cmd, "/lt", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly+2, slz);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao e um admin");
		}
		return 1;
	}
	if(strcmp(cmd, "/rt", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPos(playerid, slx, sly-2, slz-2);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao e um admin");
		}
		return 1;
	}
//-------------------------------[Stats]--------------------------------------------------------------------------
	if (strcmp(cmd, "/status", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /stats [Id do jogador/Parte do nome]");
				return 1;
			}
			if(IsStringAName(tmp))
			{
				giveplayerid = GetPlayerID(tmp);
			}
			else
			{
				giveplayerid = strval(tmp);
			}
			if(IsPlayerConnected(giveplayerid))
			{
				PrintPlayerWeapons(playerid,giveplayerid);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Jogador nao encontrado");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao e um admin");
		}
	}
	if (strcmp(cmd, "/numero", true) == 0)
	{
		if (gPhoneBook[playerid] == 1)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /numero [Id do jogador/Parte do nome]");
				return 1;
			}
			if(IsStringAName(tmp))
			{
				giveplayerid = GetPlayerID(tmp);
			}
			else
			{
				giveplayerid = strval(tmp);
			}
			if(IsPlayerConnected(giveplayerid))
			{
				GetPlayerName(giveplayerid, sendername, sizeof(sendername));
				format(string, 256, "Nome: %s, Fone: %d",sendername,PlayerInfo[giveplayerid][pPnumber]);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Jogador nao encontrado");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao tem a lista de numeros");
		}
	}
//-------------------------------[BuyLevel]--------------------------------------------------------------------------
	if (strcmp(cmd, "/comprarnivel", true) == 0)
	{
		if (gPlayerLogged[playerid] != 0)
		{
			PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);//
			if (gdebug){printf("DEBUG buylev cash = %d", PlayerInfo[playerid][pCash]);}
			if(PlayerInfo[playerid][pLevel] >= 0)
			{
				new nxtlevel = PlayerInfo[playerid][pLevel]+1;
				new costlevel = nxtlevel*levelcost;//10k for testing purposes
				new expamount = nxtlevel*levelexp;
				new infostring[256];
				if (PlayerInfo[playerid][pCash] < costlevel)
				{
					format(infostring, 256, "   Voce nao tem dinheiro suficiente ($%d)",costlevel);
					SendClientMessage(playerid, COLOR_GRAD1, infostring);
				}
				if (PlayerInfo[playerid][pExp] < expamount)
				{
					format(infostring, 256, "   Voce precisa de %d pontos de experiencia, voce tem [%d]",expamount,PlayerInfo[playerid][pExp]);
					SendClientMessage(playerid, COLOR_GRAD1, infostring);
				}
				else
				{
					format(string, sizeof(string), "~g~Novo Nivel~n~~w~Voce tem agora nivel %d", nxtlevel);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					PlayerPlayMusic(playerid);
					GivePlayerMoney(playerid, (-costlevel));
					PlayerInfo[playerid][pLevel]++;
					PlayerInfo[playerid][pExp] = 0;
					PlayerInfo[playerid][gPupgrade] = PlayerInfo[playerid][gPupgrade]+2;
					GameTextForPlayer(playerid, string, 5000, 1);
					format(infostring, 256, "   Voce comprou o nivel %d por ($%d) coloque /upgrade", nxtlevel, costlevel);
					SendClientMessage(playerid, COLOR_GRAD1, infostring);
					format(infostring, 256, "   Voce tem %d pontos de upgrade",PlayerInfo[playerid][gPupgrade]);
					SendClientMessage(playerid, COLOR_GRAD2, infostring);
				}
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao esta logado");
		}
	}
//-------------------------------[UPGRADE]--------------------------------------------------------------------------
	if (strcmp(cmd, "/cordocarro", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD3,"($5000) USO: /cordocarro [cor 1 - 2] [numero da cor]");
				return 1;
			}
			new colornum = strval(tmp);
			if(colornum > 2 || colornum < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD3,"As escolhas sao 1 ou 2");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD3,"($5000) USO: /cordocarro [cor 1 - 2] [numero da cor]");
			}
			new color = strval(tmp);
			if(color > 126)
			{
				SendClientMessage(playerid, COLOR_GRAD3,"O maximo e 126");
				return 1;
			}
			if (GetPlayerMoney(playerid) < 5000)
			{
				SendClientMessage(playerid, COLOR_GRAD3,"Voce nao pode pagar ($5000)");
			}
			if(colornum == 1)
			{
				HouseInfo[house][hVcol1] = color;
				format(string, sizeof(string), "Cor do carro 1 mudada para %d -$5000",color);
				SendClientMessage(playerid, COLOR_GRAD3,string);
			}
			else
			{
				HouseInfo[house][hVcol2] = color;
				format(string, sizeof(string), "Cor do carro 2 mudada para %d -$5000",color);
				SendClientMessage(playerid, COLOR_GRAD3,string);
			}
			SendClientMessage(playerid, COLOR_GRAD6, "Sua nova pintura sera mudada em 24 horas.");
			GivePlayerMoney(playerid,-5000);
			SBizzInfo[6][sbTakings] = SBizzInfo[6][sbTakings]+5000;
			PlayerPlaySound(giveplayerid, 1134, 0.0, 0.0, 0.0);
			OnPropUpdate();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem uma casa");
			return 1;
		}
		return 1;
	}
	if (strcmp(cmd, "/mudarcarro", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			new gunid[16];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				format(string, sizeof(string), "USO: /mudarcarro [nome do carro]");
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
				SendClientMessage(playerid, COLOR_WHITE,"*** Mudar carros custa $25.000 ***");
				SendClientMessage(playerid, COLOR_GRAD2,string);
				if(PlayerInfo[playerid][pLevel] == 3)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 3: freeway feltzer saber blade vortex quad");
				}
				else if(PlayerInfo[playerid][pLevel] == 4)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 4: freeway feltzer saber blade savanna remington vortex quad");
				}
				else if(PlayerInfo[playerid][pLevel] == 5)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 5: freeway feltzer saber blade savanna remington buccaneer flash vortex quad");
				}
				else if(PlayerInfo[playerid][pLevel] == 6)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 6: freeway feltzer saber blade savanna remington buccaneer flash");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 6: slamvan uranus sultan vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 7)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 7: freeway feltzer saber blade savanna remington buccaneer flash");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 7: slamvan uranus sultan jester elergy vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 8)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 8: freeway feltzer saber blade savanna remington buccaneer flash");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 8: slamvan uranus sultan jester elergy supergt blistac vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 9)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 9: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 9: slamvan uranus sultan jester elergy supergt blistac zr350 vortex quad sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 10)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 10: freeway feltzer saber blade savanna remington buccaneer flash sandking quad sanchez");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 10: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah vortex duneride");
				}
				else if(PlayerInfo[playerid][pLevel] == 11)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 11: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 11: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah");
					SendClientMessage(playerid, COLOR_GRAD1, "Carros de nivel 11: banshee fcr900 comet vortex quad duneride sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 12)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 12: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 12: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah");
					SendClientMessage(playerid, COLOR_GRAD1, "Carros de nivel 12: banshee fcr900 comet hotring vortex quad duneride sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 13)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 13: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 13: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah");
					SendClientMessage(playerid, COLOR_GRAD1, "Carros de nivel 13: banshee fcr900 comet hotring turismo bullet vortex quad duneride sanchez");
				}
				else if(PlayerInfo[playerid][pLevel] == 14)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 14: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 14: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah sanchez");
					SendClientMessage(playerid, COLOR_GRAD1, "Carros de nivel 14: banshee fcr900 comet hotring turismo bullet infurnus vortex quad duneride");
				}
				else if(PlayerInfo[playerid][pLevel] >= 15)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Carros de nivel 15: freeway feltzer saber blade savanna remington buccaneer flash sandking");
					SendClientMessage(playerid, COLOR_GRAD2, "Carros de nivel 15: slamvan uranus sultan jester elergy supergt blistac zr350 cheetah sanchez");
					SendClientMessage(playerid, COLOR_GRAD1, "Carros de nivel 15: banshee fcr900 comet hotring turismo bullet infurnus monster monstera");
					SendClientMessage(playerid, COLOR_GRAD1, "Carros de nivel 15: monsterb vortex quad duneride bfinject stretch");
				}
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
				return 1;
			}
			if(SBizzInfo[6][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Fora de estoque", 5000, 1);
				return 1;
			}
			strmid(gunid, tmp, 0, strlen(cmdtext), 255);
			if (GetPlayerMoney(playerid) > 25000)
			{
				if (PlayerInfo[playerid][pLevel] >= 18 && (strcmp(gunid, "nrg500", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e uma Nrg-500");
					HouseInfo[house][hVec] = 522;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "monster", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um monster");
					HouseInfo[house][hVec] = 444;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "stretch", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e uma stretch");
					HouseInfo[house][hVec] = 409;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "monstera", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um monstera");
					HouseInfo[house][hVec] = 556;
				}
				else if (PlayerInfo[playerid][pLevel] >= 15 && (strcmp(gunid, "monsterb", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um monsterb");
					HouseInfo[house][hVec] = 557;
				}

				else if (PlayerInfo[playerid][pLevel] >= 16 && (strcmp(gunid, "infurnus", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um infurnus");
					HouseInfo[house][hVec] = 411;
				}

				else if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "bullet", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um bullet");
					HouseInfo[house][hVec] = 541;
				}
				else if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "turismo", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um turismo");
					HouseInfo[house][hVec] = 451;
				}
				else if (PlayerInfo[playerid][pLevel] >= 12 && (strcmp(gunid, "hotring", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um hotring");
					HouseInfo[house][hVec] = 502;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "banshee", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um banshee");
					HouseInfo[house][hVec] = 429;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "fbiranch", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um fbiranch");
					HouseInfo[house][hVec] = 490;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "comet", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um comet");
					HouseInfo[house][hVec] = 480;
				}
				else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "fcr900", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e uma fcr900");
					HouseInfo[house][hVec] = 521;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "cheetah", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um cheetah");
					HouseInfo[house][hVec] = 415;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "hotknife", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um hotknife");
					HouseInfo[house][hVec] = 434;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "enforcer", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um enforcer");
					HouseInfo[house][hVec] = 427;
				}
				else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "duneride", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um duneride");
					HouseInfo[house][hVec] = 573;
				}
				else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "zr350", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um zr350");
					HouseInfo[house][hVec] = 477;
				}
				else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "sandking", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um sandking");
					HouseInfo[house][hVec] = 495;
				}
				else if (PlayerInfo[playerid][pLevel] >= 8 && (strcmp(gunid, "blistac", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um blistac");
					HouseInfo[house][hVec] = 496;
				}
				else if (PlayerInfo[playerid][pLevel] >= 8 && (strcmp(gunid, "supergt", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um supergt");
					HouseInfo[house][hVec] = 506;
				}
				else if (PlayerInfo[playerid][pLevel] >= 7 && (strcmp(gunid, "elergy", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um elergy");
					HouseInfo[house][hVec] = 562;
				}
				else if (PlayerInfo[playerid][pLevel] >= 7 && (strcmp(gunid, "jester", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um jester");
					HouseInfo[house][hVec] = 559;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "sultan", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um sultan");
					HouseInfo[house][hVec] = 560;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "sanchez", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um sanchez");
					HouseInfo[house][hVec] = 468;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "huntley", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um huntley");
					HouseInfo[house][hVec] = 579;
				}
				else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "slamvan", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e uma slamvan");
					HouseInfo[house][hVec] = 535;
				}
				else if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "flash", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um flash");
					HouseInfo[house][hVec] = 565;
				}
				else if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "buccaneer", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um buccaneer");
					HouseInfo[house][hVec] = 518;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "savanna", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e uma savanna");
					HouseInfo[house][hVec] = 567;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "remington", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um remington");
					HouseInfo[house][hVec] = 534;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "journey", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um journey");
					HouseInfo[house][hVec] = 508;
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "rancher", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um rancher");
					HouseInfo[house][hVec] = 489;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "huntly", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um huntly");
					HouseInfo[house][hVec] = 579;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "copcar", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um copcar");
					HouseInfo[house][hVec] = 596;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "blade", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e uma blade");
					HouseInfo[house][hVec] = 536;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "buffalo", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um buffalo");
					HouseInfo[house][hVec] = 402;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "saber", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um sabre");
					HouseInfo[house][hVec] = 475;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "feltzer", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um feltzer");
					HouseInfo[house][hVec] = 533;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "freeway", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e uma freeway");
					HouseInfo[house][hVec] = 463;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "vortex", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um vortex");
					HouseInfo[house][hVec] = 539;
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "quad", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Seu automovel agora e um quad");
					HouseInfo[house][hVec] = 471;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "   Carro inexistente");
					return 1;
				}
				SendClientMessage(playerid, COLOR_GRAD6, "Seu novo carro sera entregue em 24 horas -$25000");
				OnPropUpdate();
				GivePlayerMoney(playerid,-25000);
				SBizzInfo[6][sbTakings] = SBizzInfo[6][sbTakings]+25000;
				SBizzInfo[6][sbProd]--;
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao pode pagar ($25.000)");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem casa");
			return 1;
		}
	}
	if (strcmp(cmd, "/resetarupgrade", true) == 0)
	{
		if (gPlayerLogged[playerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao esta logado");
			return 1;
		}
		if (GetPlayerMoney(playerid) < 50000)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   O custo e de $50.000");
			return 1;
		}
		if (PlayerInfo[playerid][pLevel] < 2)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce precisa ter nivel 2");
			return 1;
		}
		PlayerInfo[playerid][gPupgrade] = (PlayerInfo[playerid][pLevel]-1)*2;
		PlayerInfo[playerid][pGun1] = 0;
		PlayerInfo[playerid][pGun2] = 0;
		PlayerInfo[playerid][pGun3] = 0;
		PlayerInfo[playerid][pGun4] = 0;
		PlayerInfo[playerid][pGun5] = 0;
		PlayerInfo[playerid][pGun6] = 0;
		PlayerInfo[playerid][pAmmo1] = 200;
		PlayerInfo[playerid][pAmmo2] = 8;
		PlayerInfo[playerid][pAmmo3] = 30;
		PlayerInfo[playerid][pAmmo4] = 30;
		PlayerInfo[playerid][pAmmo5] = 10;
		PlayerInfo[playerid][pAmmo6] = 10;
		PlayerInfo[playerid][pSHealth] = 0.0;
		GivePlayerMoney(playerid,-50000);
		SBizzInfo[6][sbTakings] = SBizzInfo[6][sbTakings]+50000;
		PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
		format(string, 256, "   Voce tem %d pontos de upgrade",PlayerInfo[playerid][gPupgrade]);
		SendClientMessage(playerid, COLOR_GRAD2, string);
	}
	if(strcmp(cmd, "/melhorcompra", true) == 0)
	{
		new tmpprice;
		new store;
		if(Locator[playerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Voce nao tem esse dispositivo.");
			return 1;
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if(BizzInfo[i][bPriceMod] < tmpprice && BizzInfo[i][bEntcost] == 0 && BizzInfo[i][bProd] > 0)
			{
				tmpprice = BizzInfo[i][bPriceMod];
				store = i;
			}
			for(new j = 0; j < sizeof(BizzInfo); j++)
			{
			 	if(BizzInfo[j][bPriceMod] < tmpprice && BizzInfo[j][bEntcost] == 0 && BizzInfo[j][bProd] > 0)
			 	{
			 		tmpprice = BizzInfo[j][bPriceMod];
			 		store = j;
				}
			}
		}
		SetPlayerCheckpoint(playerid,BizzInfo[store][bEntrancex], BizzInfo[store][bEntrancey], BizzInfo[store][bEntrancez], 4.0);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
		GameTextForPlayer(playerid, "~w~Lugar Marcado~r~Melhor Compra", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/melhorvenda", true) == 0)
	{
		new tmpprice = 0;
		new store = 255;
		if(Locator[playerid] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Voce nao tem esse dispositivo.");
			return 1;
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if(BizzInfo[i][bPayComp] > tmpprice && BizzInfo[i][bCompCap] > BizzInfo[i][bComp] && BizzInfo[i][bTakings] > BizzInfo[i][bPayComp])
			{
				tmpprice = BizzInfo[i][bPayComp];
				store = i;
			}
			for(new j = 0; j < sizeof(BizzInfo); j++)
			{
			 	if(store != 255 && BizzInfo[j][bPayComp] > tmpprice && BizzInfo[j][bCompCap] > BizzInfo[j][bComp] && BizzInfo[j][bTakings] > BizzInfo[j][bPayComp])
			 	{
			 		tmpprice = BizzInfo[j][bPayComp];
			 		store = j;
				}
			}
		}
		if(store == 255)
		{
			GameTextForPlayer(playerid, "~w~Nao ha vendas para serem feitas agora.", 5000, 1);
			return 1;
		}
		SetPlayerCheckpoint(playerid,BizzInfo[store][bEntrancex], BizzInfo[store][bEntrancey], BizzInfo[store][bEntrancez], 4.0);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
		GameTextForPlayer(playerid, "~w~Lugar Marcado~r~Melhor Venda", 5000, 1);
		return 1;
	}
	if (strcmp(cmd, "/comprararma", true) == 0 || strcmp(cmd, "/carma", true) == 0)
	{
		new gun;
		new gunid[16];
		new gunstring1[256];
		new gunstring2[256];
		new gunstring3[256];
		new gunstring4[256];
		new gunstring5[256];
		new gunstring6[256];
		new infostring[256];
		new guncharge;
		new ammocharge;
		new location = PlayerInfo[playerid][pLocal];
		if(location < 99 || location == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE,"Voce nao esta em uma loja de armas.");
			return 1;
		}
		new mod = (BizzInfo[location-99][bPriceMod]);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USO: /comprararma ou /carma [nome da arma] [quantidade]");
			SendClientMessage(playerid, COLOR_GREEN,"*** Armas e Municoes ***");
			SendClientMessage(playerid, COLOR_GRAD2,string);
			format(gunstring1, 256, "Armas: paraquedas ($%d) tacodegolf ($%d) cacetete ($%d) faca ($%d) bastaodebaseball ($%d) pa ($%d) tacodesinuca ($%d)",
			GunPrice[0][0]/100*mod,GunPrice[1][0]/100*mod,GunPrice[2][0]/100*mod,GunPrice[3][0]/100*mod,GunPrice[4][0]/100*mod,GunPrice[5][0]/100*mod,GunPrice[6][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring1);
			format(gunstring2, 256, "Armas: vibrador1 ($%d) vibrador2 ($%d) vibrador3 ($%d) vibrador4 ($%d) flores ($%d) bengala",
			GunPrice[7][0]/100*mod,GunPrice[8][0]/100*mod,GunPrice[9][0]/100*mod,GunPrice[10][0]/100*mod,GunPrice[11][0]/100*mod,GunPrice[12][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring2);
			format(gunstring3, 256, "Armas: pistolasilenciosa ($%d) colt45 ($%d) deagle ($%d) tec9 ($%d)  uzi ($%d) mp5 ($%d)",
			GunPrice[13][0]/100*mod,GunPrice[14][0]/100*mod,GunPrice[15][0]/100*mod,GunPrice[16][0]/100*mod,GunPrice[17][0]/100*mod,GunPrice[18][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring3);
			format(gunstring4, 256, "Armas: shotgun ($%d) spas12 ($%d)sawnoff ($%d) ak47 ($%d) m4 ($%d) rifle ($%d)",
			GunPrice[19][0]/100*mod,GunPrice[20][0]/100*mod,GunPrice[21][0]/100*mod,GunPrice[22][0]/100*mod,GunPrice[23][0]/100*mod,GunPrice[24][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring4);
			format(gunstring5, 256, "Armas: pistolammo ($%d) shotgunammo ($%d) smgammo ($%d) assaultammo ($%d) rifleammo ($%d)",
			GunPrice[25][0],GunPrice[26][0],GunPrice[27][0],GunPrice[28][0],GunPrice[29][0]);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring5);
			format(gunstring6, 256, "Armas: bazooka ($%d) lancachamas ($%d) minigun($%d) granada ($%d) bombadegas ($%d) ",
			GunPrice[30][0]/100*mod,GunPrice[31][0]/100*mod,GunPrice[32][0]/100*mod,GunPrice[33][0]/100*mod,GunPrice[34][0]/100*mod);
			SendClientMessage(playerid, COLOR_GRAD3, gunstring6);
			return 1;
		}
		strmid(gunid, tmp, 0, strlen(cmdtext), 255);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USO: /comprararma ou /carma [nome da arma] [quantidade]");
			return 1;
		}
		new ammo = strval(tmp);
		/*
		if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "minigun", true, strlen(gunid)) == 0))
		{
			SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will agora nascer com A minigun");
			PlayerInfo[playerid][pGun6] = 38;
			ResetPlayerWeapons(playerid);
			SetPlayerWeapons(playerid);
			PlayerInfo[playerid][gPupgrade]--;
		}

		if (PlayerInfo[playerid][pLevel] >= 12 && (strcmp(gunid, "flamethrower", true, strlen(gunid)) == 0))
		{
			SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will agora nascer com A flamethrower");
			PlayerInfo[playerid][pGun6] = 37;
		}
		*/
		if (strcmp(gunid, "paraquedas", true, strlen(gunid)) == 0)
		{
			gun = 46;
			guncharge = GunPrice[0][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "tacodegolf", true, strlen(gunid)) == 0)
		{
			gun = 2;
			guncharge = GunPrice[1][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "cacetete", true, strlen(gunid)) == 0)
		{
			gun = 3;
			guncharge = GunPrice[2][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "faca", true, strlen(gunid)) == 0)
		{
			gun = 4;
			guncharge = GunPrice[3][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "bastaodebaseball", true, strlen(gunid)) == 0)
		{
			gun = 5;
			guncharge = GunPrice[4][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "pa", true, strlen(gunid)) == 0)
		{
			gun = 6;
			guncharge = GunPrice[5][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "tacodesinuca", true, strlen(gunid)) == 0)
		{
			gun = 7;
			guncharge = GunPrice[6][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "vibrador1", true, strlen(gunid)) == 0)
		{
			gun = 10;
			guncharge = GunPrice[7][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "vibrador2", true, strlen(gunid)) == 0)
		{
			gun = 11;
			guncharge = GunPrice[8][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "vibrador3", true, strlen(gunid)) == 0)
		{
			gun = 12;
			guncharge = GunPrice[9][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "vibrador4", true, strlen(gunid)) == 0)
		{
			gun = 13;
			guncharge = GunPrice[10][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "flores", true, strlen(gunid)) == 0)
		{
			gun = 14;
			guncharge = GunPrice[11][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "bengala", true, strlen(gunid)) == 0)
		{
			gun = 15;
			guncharge = GunPrice[12][0]/100*mod;
			ammocharge = 0;
		}
		else if (strcmp(gunid, "pistolasilenciosa", true, strlen(gunid)) == 0)
		{
			gun = 23;
			guncharge = GunPrice[13][0]/100*mod;
			ammocharge = GunPrice[25][0]*ammo;
		}
		else if (strcmp(gunid, "colt45", true, strlen(gunid)) == 0)
		{
			gun = 22;
			guncharge = GunPrice[14][0]/100*mod;
			ammocharge = GunPrice[25][0]*ammo;
		}
		else if (strcmp(gunid, "deagle", true, strlen(gunid)) == 0)
		{
			gun = 24;
			guncharge = GunPrice[15][0]/100*mod;
			ammocharge = GunPrice[25][0]*ammo;
		}
		else if (strcmp(gunid, "Tec9", true, strlen(gunid)) == 0)
		{
			gun = 32;
			guncharge = GunPrice[16][0]/100*mod;
			ammocharge = GunPrice[27][0]*ammo;
		}
		else if (strcmp(gunid, "uzi", true, strlen(gunid)) == 0)
		{
			gun = 28;
			guncharge = GunPrice[17][0]/100*mod;
			ammocharge = GunPrice[27][0]*ammo;
		}
		else if (strcmp(gunid, "mp5", true, strlen(gunid)) == 0)
		{
			gun = 29;
			guncharge = GunPrice[18][0]/100*mod;
			ammocharge = GunPrice[27][0]*ammo;
		}
		else if (strcmp(gunid, "shotgun", true, strlen(gunid)) == 0)
		{
			gun = 25;
			guncharge = GunPrice[19][0]/100*mod;
			ammocharge = GunPrice[26][0]*ammo;
		}
		else if (strcmp(gunid, "spas12", true, strlen(gunid)) == 0)
		{
			gun = 27;
			guncharge = GunPrice[20][0]/100*mod;
			ammocharge = GunPrice[26][0]*ammo;
		}
		else if (strcmp(gunid, "sawnoff", true, strlen(gunid)) == 0)
		{
			gun = 26;
			guncharge = GunPrice[21][0]/100*mod;
			ammocharge = GunPrice[26][0]*ammo;
		}
		else if (strcmp(gunid, "ak47", true, strlen(gunid)) == 0)
		{
			gun = 30;
			guncharge = GunPrice[22][0]/100*mod;
			ammocharge = GunPrice[28][0]*ammo;
		}
		else if (strcmp(gunid, "m4", true, strlen(gunid)) == 0)
		{
			gun = 31;
			guncharge = GunPrice[23][0]/100*mod;
			ammocharge = GunPrice[28][0]*ammo;
		}
		else if (strcmp(gunid, "rifle", true, strlen(gunid)) == 0)
		{
			gun = 33;
			guncharge = GunPrice[24][0]/100*mod;
			ammocharge = GunPrice[29][0]*ammo;
		}
		else if (strcmp(gunid, "bazooka", true, strlen(gunid)) == 0)
		{
			gun = 35;
			guncharge = GunPrice[30][0]/100*mod;
			ammocharge = GunPrice[30][0]*ammo;
		}
		else if (strcmp(gunid, "lancachamas", true, strlen(gunid)) == 0)
		{
			gun = 37;
			guncharge = GunPrice[31][0]/100*mod;
			ammocharge = GunPrice[31][0]*ammo;
		}
		else if (strcmp(gunid, "minigun", true, strlen(gunid)) == 0)
		{
			gun = 38;
			guncharge = GunPrice[32][0]/100*mod;
			ammocharge = GunPrice[32][0]*ammo;
		}
		else if (strcmp(gunid, "granada", true, strlen(gunid)) == 0)
		{
			gun = 16;
			guncharge = GunPrice[33][0]/100*mod;
			ammocharge = GunPrice[33][0]*ammo;
		}
		else if (strcmp(gunid, "bombadegas", true, strlen(gunid)) == 0)
		{
			gun = 17;
			guncharge = GunPrice[34][0]/100*mod;
			ammocharge = GunPrice[34][0]*ammo;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD6, "Vendedor diz: Nunca ouvi falar dessa arma.");
			return 1;
		}
		if((guncharge+ammocharge) > GetPlayerMoney(playerid))
		{
			format(infostring, 256, "Voce nao tem $%d",guncharge+ammocharge);
			SendClientMessage(playerid, COLOR_GRAD3, infostring);
			return 1;
		}
		format(infostring, 256, "Voce comprou um(a) %s com %d de municao por $%d",gunid,ammo,guncharge+ammocharge);
		SendClientMessage(playerid, COLOR_GRAD3, infostring);
		GivePlayerMoney(playerid,-(guncharge+ammocharge));
		BizzInfo[location-99][bTakings] = BizzInfo[location-99][bTakings]+(guncharge+ammocharge);
		BizzInfo[location-99][bProd]--;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		GivePlayerWeapon(playerid, gun, ammo);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s comprou armas por $%d na loja %d", sendername, (guncharge+ammocharge), location-99);
		printf("%s", string);
		PayLog(string);
		return 1;
	}
	if (strcmp(cmd, "/upgrade", true) == 0)
	{
		new gunid[16];
		new infostring[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USO: /upgrade [nome do upgrade] (Voce tem %d pontos de upgrade)",PlayerInfo[playerid][gPupgrade]);
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** UPGRADES ***");
			SendClientMessage(playerid, COLOR_GRAD2,string);
			if(PlayerInfo[playerid][pLevel] == 2)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 2: pistolasilenciosa colt45");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolamunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 3)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 3 Armas: pistolasilenciosa colt45 mp5");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao smgmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 4)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 4 Armas: pistolasilenciosa colt45 mp5 shotgun");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 5)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 5 Armas: pistolasilenciosa colt45 mp5 shotgun spas12");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 6)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 6 Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 7)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 7 Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle uzi");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 8)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 8 Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle uzi sawnoff");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 9)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 9 Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao assaultmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 10)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 10 Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao assaultmunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 11)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 11 Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4 rifle");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao assaultmunicao riflemunicao");
			}
			else if(PlayerInfo[playerid][pLevel] == 12)
			{
				SendClientMessage(playerid, COLOR_GRAD3, "Armas de nivel 12 Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4 rifle flamethrower");
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao assaultmunicao riflemunicao heavymunicao");
			}
			else if(PlayerInfo[playerid][pLevel] >= 13)
			{
				format(infostring, 256, "Armas de nivel %d Armas: pistolasilenciosa colt45 mp5 shotgun spas12 deagle uzi sawnoff tec9 ak47 m4 rifle",PlayerInfo[playerid][pLevel]);
				SendClientMessage(playerid, COLOR_GRAD4, "Municao extra: pistolmunicao shotgunmunicao smgmunicao assaultmunicao riflemunicao heavymunicao");
				SendClientMessage(playerid, COLOR_GRAD3, infostring);
			}
			SendClientMessage(playerid, COLOR_GRAD5, "Saude Extra: saude");
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			return 1;
		}
		strmid(gunid, tmp, 0, strlen(cmdtext), 255);
		if (PlayerInfo[playerid][gPupgrade] > 0)
		{
			if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "paraquedas", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um paraquedas");
				PlayerInfo[playerid][pGun5] = 46;
			}
			else if (PlayerInfo[playerid][pLevel] >= 11 && (strcmp(gunid, "rifle", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um rifle");
				PlayerInfo[playerid][pGun5] = 33;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "m4", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um m4");
				PlayerInfo[playerid][pGun4] = 31;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "tacodegolf", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um tacodegolf");
				PlayerInfo[playerid][pGun6] = 2;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "cacetete", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um cacetete");
				PlayerInfo[playerid][pGun6] = 3;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "faca", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com uma faca");
				PlayerInfo[playerid][pGun6] = 4;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "bastaodebaseball", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um bastaodebaseball");
				PlayerInfo[playerid][pGun6] = 5;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "bengala", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com uma bengala");
				PlayerInfo[playerid][pGun6] = 6;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "tacodesinuca", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um tacodesinuca");
				PlayerInfo[playerid][pGun6] = 7;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "vibrador1", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um vibrador1");
				PlayerInfo[playerid][pGun6] = 10;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "vibrador2", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com vibrador2");
				PlayerInfo[playerid][pGun6] = 11;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "vibrador3", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com vibrador3");
				PlayerInfo[playerid][pGun6] = 12;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "vibrador4", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um vibrador4");
				PlayerInfo[playerid][pGun6] = 13;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "flores", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com flores");
				PlayerInfo[playerid][pGun6] = 14;
			}
			else if (PlayerInfo[playerid][pLevel] >= 10 && (strcmp(gunid, "pa", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com uma pa");
				PlayerInfo[playerid][pGun6] = 15;
			}
			else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "ak47", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um ak47");
				PlayerInfo[playerid][pGun4] = 30;
			}
			else if (PlayerInfo[playerid][pLevel] >= 9 && (strcmp(gunid, "Tec9", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um Tec9");
				PlayerInfo[playerid][pGun3] = 32;
			}
			else if (PlayerInfo[playerid][pLevel] >= 8 && (strcmp(gunid, "sawnoff", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um sawnoff");
				PlayerInfo[playerid][pGun2] = 26;
			}
			else if (PlayerInfo[playerid][pLevel] >= 7 && (strcmp(gunid, "uzi", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "SNovo Upgrade: Voce ira agora nascer com um uzi");
				PlayerInfo[playerid][pGun3] = 28;
			}
			else if (PlayerInfo[playerid][pLevel] >= 6 && (strcmp(gunid, "deagle", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um deagle");
				PlayerInfo[playerid][pGun1] = 24;
			}
			else if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "spas12", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um spas12");
				PlayerInfo[playerid][pGun2] = 27;
			}
			else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "shotgun", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um shotgun");
				PlayerInfo[playerid][pGun2] = 25;
			}
			else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "mp5", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um mp5");
				PlayerInfo[playerid][pGun3] = 29;
			}
			else if (PlayerInfo[playerid][pLevel] >= 2 && (strcmp(gunid, "colt45", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um colt45");
				PlayerInfo[playerid][pGun1] = 22;
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "pistolasilenciosa", true, strlen(gunid)) == 0))
			{
				SendClientMessage(playerid, COLOR_GRAD6, "Novo Upgrade: Voce ira agora nascer com um pistolasilenciosa");
				PlayerInfo[playerid][pGun1] = 23;
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "pistolammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo1] = PlayerInfo[playerid][pAmmo1]+50;
				format(infostring, 256, "Novo Upgrade: Voce ira agora nascer com %d Pistol Ammo (+50)",PlayerInfo[playerid][pAmmo1]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "shotgunammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo2] = PlayerInfo[playerid][pAmmo2]+50;
				format(infostring, 256, "Novo Upgrade: Voce ira agora nascer com %d Shotgun Ammo (+50)",PlayerInfo[playerid][pAmmo2]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "smgammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo3] = PlayerInfo[playerid][pAmmo3]+100;
				format(infostring, 256, "Novo Upgrade: Voce ira agora nascer com %d SMG Ammo (+100)",PlayerInfo[playerid][pAmmo3]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "assaultammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo4] = PlayerInfo[playerid][pAmmo4]+50;
				format(infostring, 256, "Novo Upgrade: Voce ira agora nascer com %d Assault Ammo (+50)",PlayerInfo[playerid][pAmmo4]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "rifleammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo5] = PlayerInfo[playerid][pAmmo5]+10;
				format(infostring, 256, "Novo Upgrade: Voce ira agora nascer com %d Rifleammo Ammo (+10)",PlayerInfo[playerid][pAmmo5]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "heavyammo", true, strlen(gunid)) == 0))
			{
				PlayerInfo[playerid][pAmmo6] = PlayerInfo[playerid][pAmmo6]+10;
				format(infostring, 256, "Novo Upgrade: Voce ira agora nascer com %d Heavyammo Ammo (+50)",PlayerInfo[playerid][pAmmo6]);
				SendClientMessage(playerid, COLOR_GRAD6, infostring);
			}
			else if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "saude", true, strlen(gunid)) == 0))
			{
				if (PlayerInfo[playerid][pSHealth] < 100)
				{
					PlayerInfo[playerid][pSHealth] = PlayerInfo[playerid][pSHealth]+5.0;
					format(infostring, 256, "Novo Upgrade: Voce ira agora nascer com %.2f Health (+5)",PlayerInfo[playerid][pSHealth]+50);
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "   Voce tem saude maxima");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD6, "   Upgrade desconhecido");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD6, "   Voce nao tem pontos de upgrade");
			return 1;
		}
		SetPlayerWeapons(playerid);
		PlayerInfo[playerid][gPupgrade]--;
		return 1;
	}
//-------------------------------[Login]--------------------------------------------------------------------------
	if (strcmp(cmd, "/login", true) ==0 )
	{
		new tmppass[64];
		if (gPlayerLogged[playerid] == 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: Voce ja esta logado.");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /login [senha]");
			return 1;
		}
		strmid(tmppass, tmp, 0, strlen(cmdtext), 255);
		Encript(tmppass);
		if (gdebug){printf("DEBUG enterd %s", tmppass);}
		OnPlayerLogin(playerid,tmppass);
		return 1;
	}
//[TEST]______________________________________________________________________________

//----------------------------------[ooc]-----------------------------------------------
	if(strcmp(cmd, "/foradopersonagem", true) == 0 || strcmp(cmd, "/f", true) == 0)
	{
		if ((noooc) && PlayerInfo[playerid][pAdmin] < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Desativado.");
			return 1;
		}
		if(Mute[playerid] == 1)
		{
			SendClientMessage(playerid, TEAM_CYAN_COLOR, "Voce nao pode falar voce foi silenciado.");
			return 0;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /f [texto]");
			return 1;
		}
		format(string, sizeof(string), "(( %s: %s ))", sendername, result);
		OOCOff(COR_AZUL,string);
		printf("%s", string);
		return 1;
	}
	if(strcmp(cmd, "/noooc", true) == 0)
	{
		if (PlayerInfo[playerid][pAdmin] >= 3 && (!noooc))
		{
			noooc = 1;
			if(stats)
			{
				realchat = 1;
			}
			BroadCast(COLOR_GRAD2, "   FDP Desativado.");
		}
		else if (PlayerInfo[playerid][pAdmin] >= 3 && (noooc))
		{
			noooc = 0;
			if(stats)
			{
				realchat = 0;
			}
			BroadCast(COLOR_GRAD2, "   FDP Ativado");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao esta autorizado a usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/velocimetro", true) == 0)
	{
		if (gSpeedo[playerid] == 1)
		{
			gSpeedo[playerid] = 2;
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~g~ligado", 5000, 5);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		else if (gSpeedo[playerid] == 2)
		{
			gSpeedo[playerid] = 1;
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~r~desligado", 5000, 5);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce nao tem um velocimetro.");
		}
		return 1;
	}
//----------------------------------[advertise]-----------------------------------------------
	if(strcmp(cmd, "/adverter", true) == 0 || strcmp(cmd, "/ad", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/ad)verter [texto da propaganda]");
			return 1;
		}
		if ((noooc) && (PlayerInfo[playerid][pAdmin] < 1))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Canal desativado");
			return 1;
		}
		if ((!adds) && (PlayerInfo[playerid][pAdmin] < 1))
		{
			format(string, sizeof(string), "   Por favor espere %d segundos entre advertencias, custo de 25$",  (addtimer/1000));
			SendClientMessage(playerid, COLOR_GRAD2, string);
			return 1;

		}
		format(string, sizeof(string), "Propaganda: %s,Falar com: %s Fone: %d",  result, sendername,PlayerInfo[playerid][pPnumber]);
		OOCOff(TEAM_GROVE_COLOR,string);
		if (PlayerInfo[playerid][pAdmin] < 1){SetTimer("AddsOn", addtimer, 0);adds = 0;}
		GivePlayerMoney(playerid,-25);
		printf("%s", string);
		return 1;
	}
	
 	if(strcmp(cmd, "/abastecer", true) == 0)
	 {
        if(AreaPosto[playerid] == 1)
        {
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COLOR_RED, "Uso: /abastecer [litros]");
		return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || GetPlayerMoney(playerid) < quantidade){
	        SendClientMessage(playerid, COLOR_RED, "Voce nao tem dinheiro para pagar. 2 reais por litro.");
		return 1;
		}
		if(quantidade + PlayerInfo[playerid][pPetrol] < 100)
		{
			    PlayerInfo[playerid][pPetrol] = PlayerInfo[playerid][pPetrol] + quantidade;
			    format(string, sizeof(string), "Voce comprou %d litros de combustivel.", quantidade);
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantidade*2);
			return 1;
		}
		if(quantidade + PlayerInfo[playerid][pPetrol] >= 100)
		{
    			new quantia;
			    quantia = 100 - PlayerInfo[playerid][pPetrol];
			    PlayerInfo[playerid][pPetrol] = 100;
   				format(string, sizeof(string), "Seu tanque esta cheio.");
				SendClientMessage(playerid, COLOR_GREEN, string);
				GivePlayerMoney(playerid, - quantia*2);
			return 1;
		}
		return 1;
		}
		else{
		    SendClientMessage(playerid, COLOR_RED, "Voce nao esta no posto, consulte o mapa para saber o local.");
		return 1;
		}
	return 1;
	}
	if(strcmp(cmd, "/sairdocarro", true) == 0 || strcmp(cmd, "/sdc", true) == 0)
	{
		if(Congelado[playerid] == 1)
		{
		TogglePlayerControllable(playerid, 1);
		RemovePlayerFromVehicle(playerid);
		TogglePlayerControllable(playerid, 1);
		}
	}
//----------------------------------[togooc]-----------------------------------------------

	if(strcmp(cmd, "/togooc", true) == 0)
	{
		if (!gOoc[playerid])
		{
			gOoc[playerid] = 1;
			SendClientMessage(playerid, COLOR_GRAD2, "   canal desativado");
		}
		else if (gOoc[playerid])
		{
			(gOoc[playerid] = 0);
			SendClientMessage(playerid, COLOR_GRAD2, "   canal ativado");
		}
		return 1;
	}
//----------------------------------[Emote]-----------------------------------------------
	if(strcmp(cmd, "/eu", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /eu [acao]");
			return 1;
		}
		format(string, sizeof(string), "* %s %s", sendername, result);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		printf("%s", string);
		return 1;
	}
	
	if(strcmp(cmd, "/muu", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN, "Meu Deus! Voce e uma vaca!!");
 	}
 	
 	if (strcmp(cmdtext, "/fumar", true) == 0)    {
    ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 1, 1, 1, 1);
   	new jogador[256];
	GetPlayerName(playerid,jogador,sizeof(jogador));
	format(jogador,sizeof(jogador),"%s vai para o cantinho e acende a erva.",jogador);
    SendClientMessageToAll(COLOR_RED,jogador);
    return 1;
    }

	if (strcmp(cmdtext, "/usardrogas", true) == 0)
	{
	if(PlayerInfo[playerid][pDrogaUso] >= 1)
	{
    ApplyAnimation(playerid,"CRACK", "crckdeth1", 4.0, 1, 1, 1, 1, 1);
   	new jogador[256];
	GetPlayerName(playerid,jogador,sizeof(jogador));
	format(jogador,sizeof(jogador),"%s usa 10 gramas e sente uma coisa estranha.",jogador);
    SendClientMessageToAll(COLOR_RED,jogador);
    PlayerInfo[playerid][pDrogaUso] = PlayerInfo[playerid][pDrogaUso]-1;
    }
    else
    {
    SendClientMessage(playerid, COLOR_GRAD1, "Voce nao possui drogas. Contate um traficante.");
    }
    return 1;
    }
   	if (strcmp(cmdtext, "/beber", true) == 0)    {
   	ApplyAnimation(playerid,"PED", "WALK_DRUNK",4.0,1,1,1,1,1);
   	new jogador[256];
	GetPlayerName(playerid,jogador,sizeof(jogador));
	format(jogador,sizeof(jogador),"%s enche a cara de cachaca.",jogador);
    SendClientMessageToAll(COLOR_RED,jogador);
    return 1;
    }
   	if (strcmp(cmdtext, "/deitar", true) == 0)    {
   	ApplyAnimation(playerid,"SUNBATHE", "batherdown",4.0,0,1,1,1,1);
    return 1;
    }

//----------------------------------[Local]-----------------------------------------------
	if(strcmp(cmd, "/local", true) == 0 || strcmp(cmd, "/l", true) == 0 || strcmp(cmd, "/dizer", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/l)ocal [texto]");
			return 1;
		}
		format(string, sizeof(string), "%s diz: %s", sendername, result);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		printf("%s", string);
		return 1;
	}
//----------------------------------[Shout]-----------------------------------------------
	if(strcmp(cmd, "/gritar", true) == 0 || strcmp(cmd, "/gr", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/gr)itar [texto]");
			return 1;
		}
		format(string, sizeof(string), "%s grita: %s!!", sendername, result);
		ProxDetector(30.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_FADE1,COLOR_FADE2);
		printf("%s", string);
		return 1;
	}
//----------------------------------[Shout]-----------------------------------------------
	if(strcmp(cmd, "/megafone", true) == 0 || strcmp(cmd, "/m", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/m)egafone [texto]");
			return 1;
		}
		if (gTeam[playerid] != 2)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao faz parte do time policial");
			return 1;
		}
		if(!IsACopCar(tmpcar))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao esta em um carro policial");
			return 1;
		}
		format(string, sizeof(string), "[Policial %s:o< %s]", sendername, result);
		ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
		printf("%s", string);
		return 1;
	}
//----------------------------------[Team]-----------------------------------------------
	if(strcmp(cmd, "/radio", true) == 0 || strcmp(cmd, "/r", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/r)adio [texto]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
			if(PlayerInfo[playerid][pAdmin] == -2)
			{
				format(string, sizeof(string), "** Delegado %s: %s, cambio. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Policial %s: %s, cambio. **", sendername, result);
			}
			SendTeamMessage(2, TEAM_BLUE_COLOR, string);
			printf("%s", string);
			return 1;
		}
		if (gTeam[playerid] == 1)
		{
			if(PlayerInfo[playerid][pAdmin] == -1)
			{
				format(string, sizeof(string), "** Chefe %s: %s, cambio. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Paramedico %s: %s, cambio. **", sendername, result);
			}
			SendTeamMessage(1, TEAM_CYAN_COLOR, string);
			printf("%s", string);
			return 1;
		}
		if (gTeam[playerid] >= 5)
		{
			if(PlayerInfo[playerid][pAdmin] <= -5)
			{
				format(string, sizeof(string), "** Chefao %s: %s, cambio. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** %s: %s, cambio. **", sendername, result);
			}
			SendTeamMessage(gTeam[playerid], TEAM_AZTECAS_COLOR, string);
			printf("%s", string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao faz parte de um time");
			//return 1;
		}
		return 1;
	}
//----------------------------------[offduty]-----------------------------------------------
	if(strcmp(cmd, "/batercartao", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(forceteam && CopCheck(playerid))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao e um policial.");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
			if (PlayerToPoint(3, playerid,255.3,77.4,1003.6) || PlayerInfo[playerid][pLocal] != 255)
			{
				gTeam[playerid] = 3;
				SetPlayerToTeamColor(playerid);
				format(string, sizeof(string), "* %s coloca a arma e o distintivo no armario.", sendername);
				SetPlayerWeapons(playerid);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				printf("%s", string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   voce nao esta na sala de armarios");
				return 1;
			}
		}
		if (gTeam[playerid] == 3)
		{
			if (PlayerToPoint(3, playerid,255.3,77.4,1003.6) || PlayerInfo[playerid][pLocal] != 255)
			{
				gTeam[playerid] = 2;
				SetPlayerToTeamColor(playerid);
				if(PlayerInfo[playerid][pAdmin] == -2)
				{
					format(string, sizeof(string), "* Delegado %s coloca a arma e o distintivo no armario", sendername);
				}
				else
				{
					format(string, sizeof(string), "* Policial %s coloca a arma e o distintivo no armario", sendername);
				}
				SetPlayerWeapons(playerid);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				printf("%s", string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   voce nao esta na sala de armarios");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao faz parte do time policial");
			return 1;
		}
		return 1;
	}
//----------------------------------[departments]-----------------------------------------------
	if(strcmp(cmd, "/departamentos", true) == 0 || strcmp(cmd, "/d", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/d)epartamentos [texto]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
			if(PlayerInfo[playerid][pAdmin] == -2)
			{
				format(string, sizeof(string), "** Delegado %s: %s, cambio. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Policial %s: %s, cambio. **", sendername, result);
			}
			SendTeamMessage(2, COLOR_ALLDEPT, string);
			SendTeamMessage(4, COLOR_ALLDEPT, string);
			printf("%s", string);
			return 1;
		}
		if (gTeam[playerid] == 1)
		{
			if(PlayerInfo[playerid][pAdmin] == -3)
			{
				format(string, sizeof(string), "** Chefe %s: %s, cambio. **", sendername, result);
			}
			else
			{
				format(string, sizeof(string), "** Paramedico %s: %s, cambio. **", sendername, result);
			}
			SendTeamMessage(2, COLOR_ALLDEPT, string);
			SendTeamMessage(1, COLOR_ALLDEPT, string);
			printf("%s", string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao faz parte de um time");
			//return 1;
		}
		return 1;
	}
//----------------------------------[mdc]-----------------------------------------------
	if(strcmp(cmd, "/mdc", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /mdc [id do jogador/Parte do nome]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		GetPlayerName(giveplayerid, sendername, sizeof(sendername));
		if(!IsACopCar(tmpcar))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao esta em um carro policial");
			return 1;
		}
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"______-=Computador de Bordo=-_______");
		format(string, sizeof(string), "Nome : %s", sendername);
		SendClientMessage(playerid, COLOR_WHITE,string);
		format(string, sizeof(string), "Crime : %s", PlayerCrime[giveplayerid][pAccusedof]);
		SendClientMessage(playerid, COLOR_GRAD2,string);
		format(string, sizeof(string), "Vitima : %s", PlayerCrime[giveplayerid][pVictim]);
		SendClientMessage(playerid, COLOR_GRAD3,string);
		format(string, sizeof(string), "Reporter : %s", PlayerCrime[giveplayerid][pAccusing]);
		SendClientMessage(playerid, COLOR_GRAD4,string);
		format(string, sizeof(string), "Acusado : %s", PlayerCrime[giveplayerid][pBplayer]);
		SendClientMessage(playerid, COLOR_GRAD5,string);
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"_______________________________________");
		printf("%s", string);
		return 1;
	}
//----------------------------------[SetCrim]-----------------------------------------------
	if(strcmp(cmd, "/suspeito", true) == 0 || strcmp(cmd, "/su", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/su)speito [id do jogador/Parte do nome] [crime]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(JailTime[giveplayerid] != 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Essa pessoa nao pode ser suspeita agora.");
			printf("JailTime[giveplayerid](%d) gTeam[giveplayerid](%d)",JailTime[giveplayerid],gTeam[giveplayerid]);
			return 1;
		}
			if (IsPlayerConnected(giveplayerid))
			{
				if (gTeam[giveplayerid] != 2)
				{
					if (gTeam[giveplayerid] >= 4)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   essa pessoa ja e uma suspeita");
						return 1;
					}
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USO: (/su)speito [id do jogador/Parte do nome] [crime]");
						return 1;
					}
					if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
					if(FlashTime[giveplayerid] == 0){FlashTime[giveplayerid] = 10;}
					SetPlayerCriminal(giveplayerid,playerid, result,0,0);
					JailTime[giveplayerid] = -60;
					//printf("%s: %s", giveplayer, result);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   voce nao pode suspeitar de um policial");
				}
			}
			else
			{
					format(string, sizeof(string), "   %d nao e um jogador ativo.", giveplayerid);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao e um policial");
		}
	}
//----------------------------------[SetFree]-----------------------------------------------
	if(strcmp(cmd, "/livre", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /livre [id do jogador/Parte do nome]");
			return 1;
		}
		if (gTeam[playerid] == 2)
		{
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
			if (IsPlayerConnected(giveplayerid))
			{
				if (gTeam[giveplayerid] == 4)
				{
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USO: /livre [id do jogador/Parte do nome] [causa]");
						return 1;
					}
					if (gPublicEnemy == giveplayerid)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem o poder de fazer isso");
						return 1;
					}
					SetPlayerFree(giveplayerid,playerid, result,0,0);
					//printf("%s: %s", giveplayer, result);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   Essa pessoa ja esta livre");
				}
			}
			else
			{
					format(string, sizeof(string), "   %d nao e um jogador ativo.", giveplayerid);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   voce nao e um policial");
		}
	}
//----------------------------------[LOCK]-----------------------------------------------
	if(strcmp(cmd, "/passarchave", true) == 0 || strcmp(cmd, "/pchave", true) == 0)
	{
		new carid;
		if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
		{
			if(gLastCar[playerid] == 0 && PlayerInfo[playerid][pPhousekey] == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem um veiculo.");
				return 1;
			}
			else if(gLastCar[playerid] != 0 && gLastCar[playerid] != PlayerInfo[playerid][pPhousekey]+1)
			{
				if (HireCar[playerid] != gLastCar[playerid] && HireCar[playerid] != 299)
				{
					gLastDriver[HireCar[playerid]] = 300;
					gCarLock[HireCar[playerid]] = 0;
					UnLockCar(HireCar[playerid]);
				}
				HireCar[playerid] = gLastCar[playerid];
			}
		}
		if (PlayerInfo[playerid][pPhousekey] == 255)
		{
			if(HireCar[playerid] == 299)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem um veiculo.");
				return 1;
			}
		}
		carid = PlayerInfo[playerid][pPhousekey]+1;
		if(HireCar[playerid] != 299 && !SwitchKey[playerid])
		{
			carid = HireCar[playerid];
		}
		//new driver = gLastDriver[carid];
		new lockstatus = gCarLock[carid];
		new Float:cx,Float:cy,Float:cz;
		GetVehiclePos(carid, cx, cy, cz);
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			//printf("House :%d  x:%f y:%f z:%f",i,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]);
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]) || PlayerToPoint(3, playerid,HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz]))
			{
				//printf("House :%d",i);
				if(PlayerInfo[playerid][pPhousekey] == i)
				{
					//printf("pPhousekey :%d  hLock :%d",PlayerInfo[playerid][pPhousekey] ,HouseInfo[i][hLock]);
					if(HouseInfo[i][hLock] == 1)
					{
						HouseInfo[i][hLock] = 0;
						GameTextForPlayer(playerid, "~w~Porta ~g~Aberta", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
					if(HouseInfo[i][hLock] == 0)
					{
						HouseInfo[i][hLock] = 1;
						GameTextForPlayer(playerid, "~w~Porta ~r~Fechada", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Voce nao tem uma chave", 5000, 6);
					return 1;
				}
			}
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			//printf("House :%d  x:%f y:%f z:%f",i,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]);
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]) || PlayerToPoint(3, playerid,BizzInfo[i][bExitx], BizzInfo[i][bExity], BizzInfo[i][bExitz]))
			{
				//printf("House :%d",i);
				if(PlayerInfo[playerid][pPbiskey] == i)
				{
					//printf("pPhousekey :%d  hLock :%d",PlayerInfo[playerid][pPhousekey] ,HouseInfo[i][hLock]);
					if(BizzInfo[i][bLock] == 1)
					{
						BizzInfo[i][bLock] = 0;
						GameTextForPlayer(playerid, "~w~Negocio ~g~Aberto", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
					if(BizzInfo[i][bLock] == 0)
					{
						BizzInfo[i][bLock] = 1;
						GameTextForPlayer(playerid, "~w~Negocio ~r~Fechado", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Voce nao tem a chave", 5000, 6);
					return 1;
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			//printf("House :%d  x:%f y:%f z:%f",i,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]);
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				//printf("House :%d",i);
				if(PlayerInfo[playerid][pPbiskey] == i+100)
				{
					//printf("pPhousekey :%d  hLock :%d",PlayerInfo[playerid][pPhousekey] ,HouseInfo[i][hLock]);
					if(SBizzInfo[i][sbLock] == 1)
					{
						SBizzInfo[i][sbLock] = 0;
						GameTextForPlayer(playerid, "~w~Negocio ~g~Aberto", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
					if(SBizzInfo[i][sbLock] == 0)
					{
						SBizzInfo[i][sbLock] = 1;
						GameTextForPlayer(playerid, "~w~Negocio ~r~Fechado", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Voce nao tem uma chave", 5000, 6);
					return 1;
				}
			}
		}
		switch (lockstatus)
		{
			case 0:
			{
				if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem um carro");
					return 1;
				}
				if(HireCar[playerid] == carid && !SwitchKey[playerid])
				{
					GameTextForPlayer(playerid, "~w~Veiculo ~r~Fechado", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 1;
					LockCar(carid);
				}
				else if (PlayerInfo[playerid][pPhousekey] == carid-1)
				{
					GameTextForPlayer(playerid, "~w~Veiculo ~r~Fechado", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 1;
					LockCar(carid);
					return 1;
				}
			}
			case 1:
			{
				if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem um veiculo");
					return 1;
				}
				if(HireCar[playerid] == carid && !SwitchKey[playerid])
				{
					GameTextForPlayer(playerid, "~w~Veiculo ~g~Aberto", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 0;
					UnLockCar(carid);
				}
				if (PlayerInfo[playerid][pPhousekey] == carid-1)
				{
					GameTextForPlayer(playerid, "~w~Veiculo ~g~Aberto", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					gCarLock[carid] = 0;
					UnLockCar(carid);
					return 1;
				}
			}
			default:
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   Erro... Tente novamente.");
			}
		}
		if(carid == 256)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem um veiculo");
		}
		return 1;
	}
//----------------------------------[Wisper]-----------------------------------------------
	if(strcmp(cmd, "/falarbaixo", true) == 0 || strcmp(cmd, "/fb", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/fb) [id do jogador/Parte do nome] [texto]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (IsPlayerConnected(giveplayerid))
		{
			if (ProxDetectorS(5.0, playerid, giveplayerid))
			{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				if(giveplayerid == playerid)
				{
					format(string, sizeof(string), "* %s escuta alguma coisa no ouvido...", sendername);
					ProxDetector(5.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USO: (/fb) [id do jogador/Parte do nome] [texto]");
					return 1;
				}
				format(string, sizeof(string), "%s fala baixo no ouvido do %s alguma coisa....", sendername, result);
				SendClientMessage(playerid,  COLOR_YELLOW, string);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s: %s", sendername, result);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Voce esta longe da pessoa.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d nao e um jogador ativo.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[Phone]-----------------------------------------------
	if(strcmp(cmd, "/banco", true) == 0 || strcmp(cmd, "/depositar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /banco [quantidade]");
			format(string, sizeof(string), "  Voce tem $%d na sua conta bancaria.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /banco [quantidade]");
			format(string, sizeof(string), "  Voce tem $%d na sua conta bancaria.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (cashdeposit > GetPlayerMoney(playerid) || cashdeposit < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem isso tudo.");
			return 1;
		}
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			GivePlayerMoney(playerid,-cashdeposit);
			new curfunds = PlayerInfo[playerid][pAccount];
			PlayerInfo[playerid][pAccount]=cashdeposit+PlayerInfo[playerid][pAccount];
			SendClientMessage(playerid, COLOR_WHITE, "|___ Extrato ___|");
			format(string, sizeof(string), "  Dinheiro de antes: $%d", curfunds);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			format(string, sizeof(string), "  Deposito: $%d",cashdeposit);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_GRAD6, "|-----------------------------------------|");
			format(string, sizeof(string), "  Dinheiro de agora: $%d", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce esta muito longe de um 24-7 ou banco.");
			return 1;
		}
	}
	if(strcmp(cmd, "/emprestimo", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if (gPlayerLogged[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: Voce deve logar antes.");
			return 1;
		}
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /emprestimo [quantidade]");
			format(string, sizeof(string), "  Voce tem $%d na sua conta.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /emprestimo [quantidade]");
			format(string, sizeof(string), "  Voce tem $%d na sua conta.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (PlayerInfo[playerid][pAccount] - cashdeposit < -1000)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce excedeu o limite ($1000)");
			return 1;
		}
		if (PlayerInfo[playerid][pAccount] - cashdeposit > -1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce ja tem esse dinheiro no banco...");
			return 1;
		}
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			GivePlayerMoney(playerid,cashdeposit);
			new curfunds = PlayerInfo[playerid][pAccount];
			PlayerInfo[playerid][pAccount]=PlayerInfo[playerid][pAccount]-cashdeposit;
			SendClientMessage(playerid, COLOR_WHITE, "|___ Extrato Bancario ___|");
			format(string, sizeof(string), "  Dinheiro de antes: $%d", curfunds);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			format(string, sizeof(string), "  Deposito: $%d",cashdeposit);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_GRAD6, "|-----------------------------------------|");
			format(string, sizeof(string), "  Dinheiro de agora: $%d", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce esta muito longe de um 24-7 ou banco.");
			return 1;
		}
	}
	if(strcmp(cmd, "/sacar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /sacar [quantidade]");
			format(string, sizeof(string), "  Voce tem $%d na sua conta.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /sacar [quantidade]");
			format(string, sizeof(string), "  Voce tem $%d na sua conta.", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (cashdeposit > PlayerInfo[playerid][pAccount] || cashdeposit < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem isso tudo...");
			return 1;
		}
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			GivePlayerMoney(playerid,cashdeposit);
			PlayerInfo[playerid][pAccount]=PlayerInfo[playerid][pAccount]-cashdeposit;
			format(string, sizeof(string), "  Voce sacou $%d da sua conta. Total: $%d ", cashdeposit,PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce esta muito longe de um 24-7 ou banco.");
			return 1;
		}
	}
	if(strcmp(cmd, "/extrato", true) == 0)
	{
		if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			format(string, sizeof(string), "  Voce tem $%d na sua conta.",PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce esta muito longe de um 24-7 ou banco.");
			return 1;
		}
	}
	if(strcmp(cmd, "/jogarbosta", true) == 0)
	{
		new dice = random(6)+1;
		if (gDice[playerid] == 1)
		{
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "* %s ataca bosta na cara do %d", sendername,dice);
			ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem bosta pra jogar");
			return 1;
		}
	}
	if(strcmp(cmd, "/betdm", true) == 0) //BizzInfo[5][bDiscription]
	{
		if (MissionActive == 13)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   A deathmatch is in progress");
			return 1;
		}
		/*
		if (PlayerInfo[playerid][pLocal] != 104)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a Betting shop");
			return 1;
		}
		*/
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /betdm [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /betdm [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		moneys = strval(tmp);
		if (moneys > 1000000)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Sorry house limit is $1000000");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys)
			{
				GivePlayerMoney(playerid,-moneys);
				BizzInfo[5][bTakings] += moneys;
				BetDm[playerid][0] = giveplayerid;
				BetDm[playerid][1] = moneys;
				format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,string);
				format(string, sizeof(string), "   You have bet $%d on %s to win the next deathmatch", moneys, giveplayer);
				SendClientMessage(playerid, COLOR_WHITE, string);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,"_______________________________________");
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "  $%d has been bet on you by %s to win the next deathmatch", moneys, sendername);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "%s bet $%d on %s", sendername, moneys, giveplayer);
				printf("%s", string);
				PayLog(string);
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d nao esta online.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if(strcmp(cmd, "/betrace", true) == 0)
	{
		if (MissionActive >= 7 && MissionActive <= 8 )
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   A race is in progress");
			return 1;
		}
		/*
		if (PlayerInfo[playerid][pLocal] != 104)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from a Betting shop");
			return 1;
		}
		*/
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /betrace [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /betrace [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		moneys = strval(tmp);
		if (moneys > 1000000)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Sorry house limit is $1000000");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys)
			{
				GivePlayerMoney(playerid,-moneys);
				BizzInfo[5][bTakings] += moneys;
				BetRace[playerid][0] = giveplayerid;
				BetRace[playerid][1] = moneys;
				format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,string);
				format(string, sizeof(string), "You have bet $%d on %s to win the next race", moneys, giveplayer);
				SendClientMessage(playerid, COLOR_WHITE, string);
				SendClientMessage(playerid, TEAM_VAGOS_COLOR,"_______________________________________");
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "  $%d has been bet on you by %s to win the next race", moneys, sendername);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "%s bet $%d on %s", sendername, moneys, giveplayer);
				printf("%s", string);
				PayLog(string);
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d nao esta online.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if(strcmp(cmd, "/bets", true) == 0)
	{
		format(string, sizeof(string), "______-= %s =-_______", BizzInfo[5][bDiscription]);
		SendClientMessage(playerid, TEAM_VAGOS_COLOR,string);
		if(BetRace[playerid][0] == 255)
		{
			format(giveplayer, sizeof(giveplayer), "No one");
		}
		else
		{
			GetPlayerName(BetRace[playerid][0], giveplayer, sizeof(giveplayer));
		}
		format(string, sizeof(string), "Race: %s for $%d",giveplayer, BetRace[playerid][1]);
		SendClientMessage(playerid, COLOR_WHITE,string);
		if(BetDm[playerid][0] == 255)
		{
			format(giveplayer, sizeof(giveplayer), "No one");
		}
		else
		{
			GetPlayerName(BetDm[playerid][0], giveplayer, sizeof(giveplayer));
		}
		format(string, sizeof(string), "Deathmatch: %s for $%d",giveplayer, BetDm[playerid][1]);
		SendClientMessage(playerid, COLOR_GRAD2,string);
		SendClientMessage(playerid, TEAM_VAGOS_COLOR,"_______________________________________");
	}
	if(strcmp(cmd, "/transferir", true) == 0 || strcmp(cmd, "/transferir", true) == 0)
	{
		if(PlayerInfo[playerid][pLevel] < 3)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce deve ter nivel 3 para isso");
			return 1;
		}
		if (!PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce esta longe do banco");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /transferir [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /transferir [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		moneys = strval(tmp);
		//if (gdebug){printf("DEBUG givecash_command: %d %d",giveplayerid,moneys);}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = PlayerInfo[playerid][pAccount] ;
			if (moneys > 0 && playermoney >= moneys)
			{
				PlayerInfo[playerid][pAccount] -= moneys;
				PlayerInfo[giveplayerid][pAccount] += moneys;
				format(string, sizeof(string), "   Voce transferiu $%d para a conta do %s ", moneys, giveplayer,giveplayerid);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "   Voce recebeu uma transferencia de $%d do %s", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "%s transferiu $%d para o %s", sendername, moneys, giveplayer);
				printf("%s", string);
				PayLog(string);
				PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Quantidade invalida.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d nao e um jogador ativo.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	return 1;
	}
	if(strcmp(cmd, "/comprar", true) == 0)
	{
		if (!PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53))//centerpoint 24-7
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao esta em um 24-7");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /comprar [numero do item]");
			SendClientMessage(playerid, COLOR_GREEN, "|_______ 24-7 _______|");
			SendClientMessage(playerid, COLOR_GRAD1, "| 1: Telefone Celular $150");
			SendClientMessage(playerid, COLOR_GRAD2, "| 2: Raspadinha $15");
			SendClientMessage(playerid, COLOR_GRAD3, "| 3: Agenda Telefonica $15");
			SendClientMessage(playerid, COLOR_GRAD4, "| 4: Bosta $10");
			SendClientMessage(playerid, COLOR_GRAD5, "| 5: Chave do carro $5000");
			SendClientMessage(playerid, COLOR_GRAD5, "| 6: Trava do carro $10000");
			SendClientMessage(playerid, COLOR_GRAD6, "| 7: Velocimetro $5000");
			SendClientMessage(playerid, COLOR_GREEN, "|----------------------------------|");
			return 1;
		}
		new item = strval(tmp);
		if(BizzInfo[6][bProd] == 0)
		{
			GameTextForPlayer(playerid, "~r~Fora de estoque", 5000, 1);
			return 1;
		}
		if (item == 1 && GetPlayerMoney(playerid) > 150)
		{
			GivePlayerMoney(playerid,-150);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+150;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			new randphone = 1000 + random(8999);//minimum 1000  max 9999
			PlayerInfo[playerid][pPnumber] = randphone;
			format(string, sizeof(string), "Telefone celular adquirido. Novo numero: %d", randphone);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_GRAD5, "Voce pode checar todo o tempo por /meustatus");
			SendClientMessage(playerid, COLOR_WHITE, "AVISO: Voce pode colocar agora /comandos para ver os comandos do celular.");
			format(string, sizeof(string), "~r~-$%d", 150);
			GameTextForPlayer(playerid, string, 5000, 1);
			return 1;
		}
		if (item == 2 && GetPlayerMoney(playerid) > 10)
		{
			GivePlayerMoney(playerid,-15);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+15;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			new prize;
			new symb1[32];
			new symb2[32];
			new symb3[32];
			new randcard1 = random(10);//minimum 1000  max 9999
			new randcard2 = random(10);//minimum 1000  max 9999
			new randcard3 = random(10);//minimum 1000  max 9999
			format(string, sizeof(string), "~r~-$%d", 10);
			GameTextForPlayer(playerid, string, 5000, 1);
			if (gdebug >= 1){printf("randcard1 = %d,randcard2 = %d,randcard3 = %d",randcard1,randcard2,randcard3);}
			if(randcard1 >= 5)
			{
				format(symb1, sizeof(symb1), "~b~]");
				randcard1 = 1;
			}
			else if(randcard1 <= 4 && randcard1 >= 2)
			{
				format(symb1, sizeof(symb1), "~g~]");
				randcard1 = 2;
			}
			else if(randcard1 < 2)
			{
				format(symb1, sizeof(symb1), "~y~]");
				randcard1 = 3;
			}
			if(randcard2 >= 5)
			{
				format(symb2, sizeof(symb2), "~b~]");
				randcard2 = 1;
			}
			else if(randcard2 <= 4 && randcard2 >= 2)
			{
				format(symb2, sizeof(symb2), "~g~]");
				randcard2 = 2;
			}
			else if(randcard2 < 2)
			{
				format(symb2, sizeof(symb2), "~y~]");
				randcard2 = 3;
			}
			if(randcard3 >= 5)
			{
				format(symb3, sizeof(symb3), "~b~]");
				randcard3 = 1;
			}
			else if(randcard3 <= 4 && randcard3 >= 2)
			{
				format(symb3, sizeof(symb3), "~g~]");
				randcard3 = 2;
			}
			else if(randcard3 < 2)
			{
				format(symb3, sizeof(symb3), "~y~]");
				randcard3 = 3;
			}
			if (gdebug >= 1){printf("randcard1 = %d,randcard2 = %d,randcard3 = %d",randcard1,randcard2,randcard3);}
			if(randcard1 == randcard2 && randcard1 == randcard3)
			{
				if(randcard1 > 5)
				{
					prize = 1000;
				}
				if(randcard1 <= 4 && randcard1 >= 2)
				{
					prize = 100;
				}
				if(randcard1 < 2)
				{
					prize = 50;
				}
				GivePlayerMoney(playerid,prize);
				BizzInfo[6][bTakings] = BizzInfo[6][bTakings]-prize;
				format(string, sizeof(string), "%s %s %s ~n~~n~~w~~g~$%d",symb1,symb2,symb3, prize);
			}
			else
			{
				format(string, sizeof(string), "%s %s %s ~n~~n~~w~~r~$0",symb1,symb2,symb3);
			}
			GameTextForPlayer(playerid, string, 3000, 3);
			return 1;
		}
		if (item == 3 && GetPlayerMoney(playerid) > 400)
		{
			GivePlayerMoney(playerid,-400);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+400;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			gPhoneBook[playerid] = 1;
			format(string, sizeof(string), "Agenda telefonica adquirida. Voce pode agora ver qualquer numero");
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /number <id/name>.");
			format(string, sizeof(string), "~r~-$%d", 400);
			GameTextForPlayer(playerid, string, 5000, 1);
			return 1;
		}
		if (item == 4 && GetPlayerMoney(playerid) > 10)
		{
			GivePlayerMoney(playerid,-10);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+10;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			gDice[playerid] = 1;
			format(string, sizeof(string), "Bosta adquirida. Voce pode agora atacar ela em alguem");
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /dice ");
			format(string, sizeof(string), "~r~-$%d", 10);
			GameTextForPlayer(playerid, string, 5000, 1);
			return 1;
		}
		if (item == 5 && GetPlayerMoney(playerid) > 5000)
		{
			if (gLastCar[playerid] != 0)
			{
				if(HireCar[playerid] != 299)
				{
					gCarLock[HireCar[playerid]] = 0;
					UnLockCar(HireCar[playerid]);
					HireCar[playerid] = 299;
				}
				GivePlayerMoney(playerid,-5000);
				BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+5000;
				BizzInfo[6][bProd]--;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				HireCar[playerid] = gLastCar[playerid];
				format(string, sizeof(string), "Chave adquirida. Voce pode fechar seu carro.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /pchave ");
				format(string, sizeof(string), "~r~-$%d", 5000);
				GameTextForPlayer(playerid, string, 5000, 1);
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem um carro.");
			}
			return 1;
		}
		if (item == 6 && GetPlayerMoney(playerid) > 5000)
		{
			if(PlayerInfo[playerid][pPhousekey] != 255)
			{
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) == 1 && HireCar[PlayerInfo[playerid][pPhousekey]+1])
					{
						HireCar[i] = 299;
					}
				}
				GivePlayerMoney(playerid,-10000);
				BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+10000;
				BizzInfo[6][bProd]--;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "Trava adquirida. Voce pode travar seu carro.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /pchave ");
				format(string, sizeof(string), "~r~-$%d", 10000);
				GameTextForPlayer(playerid, string, 5000, 1);
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem um carro");
			}
			return 1;
		}
		if (item == 7 && GetPlayerMoney(playerid) > 5000)
		{
			gSpeedo[playerid] = 1;
			GivePlayerMoney(playerid,-5000);
			BizzInfo[6][bTakings] = BizzInfo[6][bTakings]+5000;
			BizzInfo[6][bProd]--;
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "Velocimetro adquirido.");
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /velocimetro ");
			format(string, sizeof(string), "~r~-$%d", 5000);
			GameTextForPlayer(playerid, string, 5000, 1);
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem dinheiro suficiente");
		}
		return 1;
	}
	if(strcmp(cmd, "/comprarcasa", true) == 0)
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new h = 0; h < sizeof(HouseInfo); h++)
		{
			if(PlayerToPoint(2.0, playerid, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]) && HouseInfo[h][hOwned] == 0)
			{
				if(PlayerInfo[playerid][pLevel] < HouseInfo[h][hLevel])
				{
					format(string, sizeof(string), "Voce deve ter nivel %d para comprar", HouseInfo[h][hLevel]);
					SendClientMessage(playerid, COLOR_GRAD5, string);
					return 1;
				}
				if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
				{
					SendClientMessage(playerid, COLOR_WHITE, "   Voce ja tem uma casa, coloque /vendercasa para vender.");
					return 1;
				}
				if(GetPlayerMoney(playerid) > HouseInfo[h][hValue])
				{
					PlayerInfo[playerid][pPhousekey] = h;
					HouseInfo[h][hOwned] = 1;
					GetPlayerName(playerid, sendername, sizeof(sendername));
					strmid(HouseInfo[h][hOwner], sendername, 0, strlen(sendername), 255);
					GivePlayerMoney(playerid,-HouseInfo[h][hValue]);
					PlayerPlayMusic(playerid);
					SetPlayerInterior(playerid,HouseInfo[h][hInt]);
					SetPlayerPos(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
					GameTextForPlayer(playerid, "~w~Lar doce lar~n~Voce pode sair indo ate a porta e digitando /exit", 5000, 3);
					PlayerInfo[playerid][pInt] = HouseInfo[h][hInt];
					PlayerInfo[playerid][pLocal] = h;
					SendClientMessage(playerid, COLOR_WHITE, "Parabens, voce comprou.");
					SendClientMessage(playerid, COLOR_WHITE, "Coloque /comandos para mais informacoes.");
					DateProp(playerid);
					OnPropUpdate();
					OnPlayerUpdate(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem dinheiro para isso");
					return 1;
				}
			}
		}
	}
	if(strcmp(cmd, "/alugar", true) == 0)
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		for(new h = 0; h < sizeof(HouseInfo); h++)
		{
			if(PlayerToPoint(2.0, playerid, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]) && HouseInfo[h][hOwned] == 1 &&  HouseInfo[h][hRentabil] == 1)
			{
				if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
				{
					SendClientMessage(playerid, COLOR_WHITE, "   Voce ja tem uma casa, coloque /sellhouse se voce quiser vender.");
					return 1;
				}
				if(GetPlayerMoney(playerid) > HouseInfo[h][hRent])
				{
					PlayerInfo[playerid][pPhousekey] = h;
					GivePlayerMoney(playerid,-HouseInfo[h][hRent]);
					HouseInfo[h][hTakings] = HouseInfo[h][hTakings]+HouseInfo[h][hRent];
					PlayerPlayMusic(playerid);
					SetPlayerInterior(playerid,HouseInfo[h][hInt]);
					SetPlayerPos(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
					GameTextForPlayer(playerid, "~w~Lar doce lar~n~Voce pode sair indo ate a porta e digitando /exit", 5000, 3);
					PlayerInfo[playerid][pInt] = HouseInfo[h][hInt];
					PlayerInfo[playerid][pLocal] = h;
					SendClientMessage(playerid, COLOR_WHITE, "Parabens, voce alugou essa casa.");
					SendClientMessage(playerid, COLOR_WHITE, "Coloque /comandos para mais informacoes.");
					OnPlayerUpdate(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem dinheiro para isso");
					return 1;
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/alugarcarro", true) == 0)
	{
		if(GetPlayerVehicleID(playerid) >= 71 && GetPlayerVehicleID(playerid) <= 77)
		{
			new hirefee = HireCost(GetPlayerVehicleID(playerid));
			if(GetPlayerVehicleID(playerid) >= 71 && GetPlayerVehicleID(playerid) <= 74)
			{
				if(BizzInfo[9][bProd] == 0)
				{
					GameTextForPlayer(playerid, "~r~Fora de estoque", 5000, 1);
					return 1;
				}
				if(PlayerInfo[playerid][pPbiskey] == 9)
				{
					GameTextForPlayer(playerid, "~w~Sem fundos...", 5000, 3);
					TogglePlayerControllable(playerid, 1);
					return 1;
				}
				if (GetPlayerMoney(playerid) <  BizzInfo[9][bEntcost])
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem tanto dinheiro");
					return 1;
				}
				GivePlayerMoney(playerid,-BizzInfo[9][bEntcost]);
				BizzInfo[9][bTakings] = BizzInfo[9][bTakings]+BizzInfo[9][bEntcost];
				BizzInfo[9][bProd]--;
			}
			if(GetPlayerVehicleID(playerid) >= 75 && GetPlayerVehicleID(playerid) <= 77)
			{
				if(BizzInfo[8][bProd] == 0)
				{
					GameTextForPlayer(playerid, "~r~Fora de estoque", 5000, 1);
					return 1;
				}
				if(PlayerInfo[playerid][pPbiskey] == 8)
				{
					GameTextForPlayer(playerid, "~w~Sem fundos...", 5000, 3);
					TogglePlayerControllable(playerid, 1);
					return 1;
				}
				if (GetPlayerMoney(playerid) <  BizzInfo[8][bEntcost])
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem tanto dinheiro");
					return 1;
				}
				GivePlayerMoney(playerid,-BizzInfo[8][bEntcost]);
				BizzInfo[8][bTakings] = BizzInfo[8][bTakings]+BizzInfo[8][bEntcost];
				BizzInfo[8][bProd]--;
			}
			if(HireCar[playerid] != 299)
			{
				gCarLock[HireCar[playerid]] = 0;
				UnLockCar(HireCar[playerid]);
			}
			HireCar[playerid] = GetPlayerVehicleID(playerid);
			OnPropUpdate();
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Divirta-se!~n~Para trancar ou destrancar o carro~n~coloque ~g~/pchave~n~~w~Dirige com cuidado!",hirefee);
			TogglePlayerControllable(playerid, 1);
			GameTextForPlayer(playerid, string, 5000, 3);
		}
		return 1;
	}
	if(strcmp(cmd, "/empregarcarro", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /empregarcarro [id da chave]");
				return 1;
			}
			new car = strval(tmp);
			/*
			if(HireCar[playerid] != 299)
			{
				gCarLock[HireCar[playerid]] = 0;
				UnLockCar(HireCar[playerid]);
				HireCar[playerid] = 299;
			}
			*/
			HireCar[playerid] = car;
			format(string, sizeof(string), "Chave mudada voce pode fechar %d.",car);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_WHITE, "AVISO: Coloque /pchave ");
			return 1;
		}
	}
	if(strcmp(cmd, "/mudarchave", true) == 0)
	{
		if(!SwitchKey[playerid])
		{
			if(HireCar[playerid] != 299)
			{
				SwitchKey[playerid] = 1;
				GameTextForPlayer(playerid, "~w~Voce pode controlar agora seu carro da casa", 5000, 6);
			}
			else
			{
				GameTextForPlayer(playerid, "~w~Voce nao empregou um carro", 5000, 6);
			}
			return 1;
		}
		else
		{
			SwitchKey[playerid] = 0;
			GameTextForPlayer(playerid, "~w~Voce controla agora seu carro empregado", 5000, 6);
		}
		return 1;
	}
	if(strcmp(cmd, "/darchave", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new car;
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /darchave [id do jogador/Parte do nome]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "  Voce nao tem uma chave para dar");
			return 1;
		}
		else
		{
			if(HireCar[playerid] != 299 && SwitchKey[playerid] == 0)
			{
				car = HireCar[playerid];
				gCarLock[car] = 0;
				UnLockCar(car);
				HireCar[playerid] = 299;
			}
			else
			{
				car = PlayerInfo[playerid][pPhousekey]+1;
			}
		}
		if (IsPlayerConnected(giveplayerid))
		{
			if (ProxDetectorS(5.0, playerid, giveplayerid))
			{
				if(HireCar[giveplayerid] != 299)
				{
					gCarLock[HireCar[giveplayerid]] = 0;
					UnLockCar(HireCar[giveplayerid]);
				}
				HireCar[giveplayerid] = car;
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "   Voce deu a %s a chave do seu carro", giveplayer);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "   Voce recebeu a chave do carro do %s", sendername);
				SendClientMessage(giveplayerid, COLOR_GRAD1, string);
				format(string, sizeof(string), "* %s pega o chaveiro e da uma chave para o %s.", sendername ,giveplayer);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/desalugarcarro", true) == 0)
	{
		if(HireCar[playerid] != 299)
		{
			gCarLock[HireCar[playerid]] = 0;
			UnLockCar(HireCar[playerid]);
			HireCar[playerid] = 299;
			GameTextForPlayer(playerid, "~w~Voce nao esta mais alugando", 5000, 3);
		}
		return 1;
	}
	if(strcmp(cmd, "/desalugar", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "   Voce e o dono dessa casa");
			return 1;
		}
		PlayerInfo[playerid][pPhousekey] = 255;
		SendClientMessage(playerid, COLOR_WHITE, "Voce agora nao tem casa");
		return 1;
	}
	if(strcmp(cmd, "/cofredacasa", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		new bouse = PlayerInfo[playerid][pPhousekey];
		if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USO: /cofredacasa [quantidade]");
				format(string, sizeof(string), "  Voce tem $%d no seu cofre.", HouseInfo[bouse][hTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			new cashdeposit = strval(tmp);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USO: /cofredacasa [quantidade]");
				format(string, sizeof(string), "  Voce tem $%d no seu cofre.", HouseInfo[bouse][hTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			if (cashdeposit >  HouseInfo[bouse][hTakings] || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem isso tudo");
				return 1;
			}
			if (!PlayerToPoint(100, playerid,HouseInfo[bouse][hExitx],HouseInfo[bouse][hExity],HouseInfo[bouse][hExitz]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   Voce esta longe da sua casa");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,cashdeposit);
				HouseInfo[bouse][hTakings]=HouseInfo[bouse][hTakings]-cashdeposit;
				format(string, sizeof(string), "  Voce retirou $%d do seu cofre. Total: $%d ", cashdeposit,BizzInfo[bouse][bTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem uma casa.");
		}
		return 1;

	}
	if(strcmp(cmd, "/asellhouse", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /asellhouse [houseid]");
			return 1;
		}
		new house = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			HouseInfo[house][hHel] = 0;
			HouseInfo[house][hArm] = 0;
			HouseInfo[house][hHealthx] = 0;
			HouseInfo[house][hHealthy] = 0;
			HouseInfo[house][hHealthz] = 0;
			HouseInfo[house][hArmourx] = 0;
			HouseInfo[house][hArmoury] = 0;
			HouseInfo[house][hArmourz] = 0;
			HouseInfo[house][hLock] = 1;
			HouseInfo[house][hOwned] = 0;
			HouseInfo[house][hVec] = 418;
			HouseInfo[house][hVcol1] = -1;
			HouseInfo[house][hVcol2] = -1;
			strmid(HouseInfo[house][hOwner], "O estado", 0, strlen("O estado"), 255);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Vendido", HouseInfo[house][hValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			OnPropUpdate();
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "Voce nao e um admin.");
		}
		return 1;
	}
	if(strcmp(cmd, "/vendercasa", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		if(PlayerInfo[playerid][pPhousekey] == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem uma casa.");
			return 1;
		}
		if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			new house = PlayerInfo[playerid][pPhousekey];
			HouseInfo[house][hHel] = 0;
			HouseInfo[house][hArm] = 0;
			HouseInfo[house][hHealthx] = 0;
			HouseInfo[house][hHealthy] = 0;
			HouseInfo[house][hHealthz] = 0;
			HouseInfo[house][hArmourx] = 0;
			HouseInfo[house][hArmoury] = 0;
			HouseInfo[house][hArmourz] = 0;
			HouseInfo[house][hLock] = 1;
			HouseInfo[house][hOwned] = 0;
			HouseInfo[house][hVec] = 418;
			HouseInfo[house][hVcol1] = -1;
			HouseInfo[house][hVcol2] = -1;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			strmid(HouseInfo[house][hOwner], "O estado", 0, strlen("O estado"), 255);
			GivePlayerMoney(playerid,HouseInfo[house][hValue]);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Parabens~n~ voce vendeu sua propriedade por ~n~~g~$%d", HouseInfo[house][hValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			PlayerInfo[playerid][pPhousekey] = 255;
			if(PlayerInfo[playerid][pLocal] == house)
			{
				SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,HouseInfo[house][hEntrancex],HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]);
				PlayerInfo[playerid][pInt] = 0;
			}
			OnPropUpdate();
			OnPlayerUpdate(playerid);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem uma casa.");
		}
		return 1;
	}
	if(strcmp(cmd, "/casaupgrade", true) == 0 || strcmp(cmd, "/cu", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USO: /casaupgrade [numero do item]");
				SendClientMessage(playerid, COLOR_GRAD1, "|_______ Upgrades _______|");
				SendClientMessage(playerid, COLOR_GRAD2, "| 1: Saude $50000");
				SendClientMessage(playerid, COLOR_GRAD3, "| 2: Colete $100000");
				SendClientMessage(playerid, COLOR_GRAD5, "| 3: TV $500");
				SendClientMessage(playerid, COLOR_WHITE, "| 4: TV da porta $1000");
				SendClientMessage(playerid, COLOR_GRAD1, "| 5: Camera ao vivo $100000");
				return 1;
			}
			new item = strval(tmp);
			switch (item)
			{
				case 1:
				{
					if(SBizzInfo[5][sbProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Fora de Estoque", 5000, 1);
						return 1;
					}
					if(PlayerInfo[playerid][pLevel] < 5)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce deve ter nivel 5");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 50000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce nao tem dinheiro suficiente");
						return 1;
					}
					HouseInfo[house][hHel] = 1;
					GivePlayerMoney(playerid,-50000);
					SBizzInfo[5][sbTakings] += 50000;//heal buisness
					SBizzInfo[5][sbProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "Voce pode agora sarar na casa, coloque /curar.");
				}
				case 2:
				{
					if(SBizzInfo[5][sbProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Fora de estoque", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 5)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce deve ter nivel 5");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 100000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce nao tem dinheiro suficiente");
						return 1;
					}
					HouseInfo[house][hArm] = 1;
					GivePlayerMoney(playerid,-100000);
					SBizzInfo[5][sbTakings] += 100000;//heal buisness
					SBizzInfo[5][sbProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "Voce pode agora pegar um colete na casa, coloque /curar.");
				}
				case 3:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Fora de estoque", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce deve ter nivel 3");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 500)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce nao tem dinheiro suficiente");
						return 1;
					}

					HouseInfo[house][hHealthx] = 1;
					GivePlayerMoney(playerid,-500);
					BizzInfo[10][bTakings] += 500;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "Voce pode usar a tv agora, coloque /tv.");
				}
				case 4:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Fora de Estoque", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce deve ter nivel 3");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 10000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce nao tem dinheiro suficiente");
						return 1;
					}

					HouseInfo[house][hHealthy] = 1;
					GivePlayerMoney(playerid,-10000);
					BizzInfo[10][bTakings] += 10000;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "Voce pode ver a camera da sua porta, coloque /tv door.");
				}
				case 5:
				{
					if(BizzInfo[10][bProd] == 0)
					{
						GameTextForPlayer(playerid, "~r~Fora de Estoque", 5000, 1);
						return 1;
					}
					if (PlayerInfo[playerid][pLevel] < 3)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce deve ter nivel 3");
						return 1;
					}
					if(GetPlayerMoney(playerid) < 20000)
					{
						SendClientMessage(playerid, COLOR_GRAD5, "Voce nao tem dinheiro suficiente");
						return 1;
					}

					HouseInfo[house][hArmourz] = 1;
					GivePlayerMoney(playerid,-100000);
					BizzInfo[10][bTakings] += 100000;
					BizzInfo[10][bProd]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD5, "Voce pode assistir tv ao vivo, coloque /tv <id>.");
				}
			}
			OnPropUpdate();
			OnPlayerUpdate(playerid);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem casa");
			//return 1;
		}
		return 1;
	}
	//EMPREGOS
	
	if(strcmp(cmd, "/precoaluguel", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USO: /precoaluguel [preco]");
				return 1;
			}
			if(strval(tmp) < 1)
			{
				SendClientMessage(playerid, COLOR_WHITE, "O minimo e de $1");
				return 1;
			}
			HouseInfo[bouse][hRent] = strval(tmp);
			OnPropUpdate();
			format(string, sizeof(string), "Alugue custa agora: $%d", HouseInfo[bouse][hRent]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem casa");
			return 1;
		}
	}
	if(strcmp(cmd, "/expulsartodos", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1 && i != playerid)
				{

					if (PlayerInfo[i][pPhousekey] == PlayerInfo[playerid][pPhousekey] )
					{
						SendClientMessage(i, COLOR_WHITE, "Voce foi expulso");
						SendClientMessage(playerid, COLOR_WHITE, "Voce expulsou.");
						PlayerInfo[i][pPhousekey] = 255;
						return 1;
					}

				}
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem uma casa");
			return 1;
		}
	}
	if(strcmp(cmd, "/expulsar", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USO: /expulsar [id do jogador/Parte do nome]");
			}
			new target = strval(tmp);
			if (target == playerid)
			{
				SendClientMessage(target, COLOR_WHITE, "Voce nao pode se expulsar");
				return 1;
			}
			if (PlayerInfo[target][pPhousekey] == PlayerInfo[playerid][pPhousekey] && (IsPlayerConnected(target)) == 1)
			{
				SendClientMessage(target, COLOR_WHITE, "Voce foi expulso");
				SendClientMessage(playerid, COLOR_WHITE, "Voce expulsou.");
				PlayerInfo[target][pPhousekey] = 255;
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem casa");
			return 1;
		}
	}
	if(strcmp(cmd, "/alugavel", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USO: /alugavel [0/1] 1-sim 0-nao");
			}
			HouseInfo[bouse][hRentabil] = strval(tmp);
			OnPropUpdate();
			format(string, sizeof(string), "Casa esta alugavel: %d", HouseInfo[bouse][hRentabil]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem casa");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/ligar", true) == 0 || strcmp(cmd, "/c", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/ligar) [numero do celular]");
			return 1;
		}
		if(PlayerInfo[playerid][pPnumber] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..Voce nao tem celular");
			return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "* %s pega o telefone celular.", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		new phonenumb = strval(tmp);
		if(phonenumb == 190)
		{
			SendClientMessage(playerid, COLOR_WHITE, "AVISO: Voce esta ligando, coloque /desligar para desligar");
			SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCIA: Qual servico, Policia or Paramedico?");
			Mobile[playerid] = 190;
			return 1;
		}
		if(phonenumb == PlayerInfo[playerid][pPnumber])
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..Telefone ocupado");
			return 1;
		}
		if(Mobile[playerid] != 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..Voce ainda tem uma ligacao, coloque /desligar");
			return 1;
		}
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if (Mobile[giveplayerid] == 255)
					{
						format(string, sizeof(string), "Seu telefone esta tocando coloque (/Atender) Numero: %s", sendername);
						SendClientMessage(giveplayerid, COLOR_YELLOW, string);
						GetPlayerName(giveplayerid, sendername, sizeof(sendername));
						RingTone[giveplayerid] = 10;
						format(string, sizeof(string), "* O telefone celular do %s esta tocando.", sendername);
						SendClientMessage(playerid, COLOR_WHITE, "AVISO: Voce esta ligando, coloque /desligar para desligar");
						ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						CellTime[playerid] = 1;
						return 1;
					}
				}
			}
		}
		SendClientMessage(playerid, COLOR_GRAD2, "  ..Ocupado");
		return 1;
	}
	if(strcmp(cmd, "/txt", true) == 0 || strcmp(cmd, "/t", true) == 0 || strcmp(cmd, "/sms", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/t)exto [numero do celular] [mensagem]");
			return 1;
		}
		if(PlayerInfo[playerid][pPnumber] == 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..Voce nao tem celular");
			return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "* %s pega o celular.", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		new phonenumb = strval(tmp);
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/t)exto [numero do celular] [mensagem]");
			return 1;
		}
		if(phonenumb == 555)
		{
			if ((strcmp("sim", result, true, strlen(result)) == 0) && (strlen(result) == strlen("sim")))
			{
				SendClientMessage(playerid, COLOR_WHITE, "Mensagem enviada");
				if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
				{
					SendClientMessage(playerid, COLOR_YELLOW, "SMS: Nao tenho ideia do que voce esta falando");
					RingTone[playerid] = 20;
					return 1;
				}
				JobGive(playerid);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SMS: Coloque 'sim' ");
				RingTone[playerid] = 20;
				return 1;
			}
		}
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					format(string, sizeof(string), "SMS: %s, Enviado por: %s (%d)", result,sendername,PlayerInfo[playerid][pPnumber]);
					GetPlayerName(giveplayerid, sendername, sizeof(sendername));
					//format(string, sizeof(string), "* %s's phone beeps.", sendername);
					RingTone[giveplayerid] =20;
					SendClientMessage(playerid, COLOR_WHITE, "Mensagem enviada");
					SendClientMessage(giveplayerid, COLOR_YELLOW, string);
					SendClientMessage(playerid,  COLOR_YELLOW, string);
					format(string, sizeof(string), "~r~$-%d", txtcost);
					GameTextForPlayer(playerid, string, 5000, 1);
					GivePlayerMoney(playerid,-txtcost);
					BizzInfo[10][bTakings] += txtcost;
		           	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		           	Mobile[playerid] = 255;
					return 1;
				}
			}
		}
		SendClientMessage(playerid, COLOR_GRAD2, "  ..Mensagem falhou");
		return 1;
	}
//----------------------------------[pickup]-----------------------------------------------

	if(strcmp(cmd, "/atender", true) == 0 || strcmp(cmd, "/at", true) == 0)
	{
		if(Mobile[playerid] != 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "  ..Voce ja tem uma ligacao pendente");
			return 1;
		}
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1)
			{
				if(Mobile[i] == playerid)
				{
					Mobile[playerid] = i; //caller connecting
					SendClientMessage(i,  COLOR_GRAD2, "   Atendeu.");
					GetPlayerName(playerid, sendername, sizeof(sendername));
                    ApplyAnimation(playerid,"PED", "phone_in", 4.0, 1, 0, 0, 0, 0);
					format(string, sizeof(string), "* %s atende o telefone celular.", sendername);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					RingTone[playerid] = 0;
				}

			}
		}
		return 1;
	}
	if(strcmp(cmd, "/desligar", true) == 0 || strcmp(cmd, "/des", true) == 0)
	{
		new caller = Mobile[playerid];
		if(caller != 255)
		{
			if(caller < 255)
			{
				SendClientMessage(caller,  COLOR_GRAD2, "   Desligou.");
				CellTime[caller] = 0;
				CellTime[playerid] = 0;
				SendClientMessage(playerid,  COLOR_GRAD2, "   Desligou.");
				Mobile[caller] = 255;
			}
			Mobile[playerid] = 255;
			CellTime[playerid] = 0;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			ApplyAnimation(playerid,"PED", "phone_out", 4.0, 0, 0, 0, 0, 0);
			format(string, sizeof(string), "* %s desliga o telefone celular.", sendername);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			RingTone[playerid] = 0;
			return 1;
		}
			SendClientMessage(playerid,  COLOR_GRAD2, "   Telefone ja desligado.");
		return 1;
	}
//----------------------------------[TIME]-----------------------------------------------
    if(strcmp(cmd, "/fixr", true) == 0)
    {
		PlayerFixRadio(playerid);
		return 1;
	}
	if(strcmp(cmd, "/horas", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new hour,minuite,second;
		gettime(hour,minuite,second);
		FixHour(hour);
		hour = shifthour;
		if (minuite < 10)
		{
			if (JailTime[playerid] > 0)
			{
				format(string, sizeof(string), "~g~|~w~%d:0%d~g~|~n~~w~Jail Time Left: %d sec", hour, minuite, JailTime[playerid]-10);
			}
			else
			{
				format(string, sizeof(string), "~g~|~w~%d:0%d~g~|", hour, minuite);
			}
		}
		else
		{
			if (JailTime[playerid] > 0)
			{
				format(string, sizeof(string), "~g~|~w~%d:%d~g~|~n~~w~Jail Time Left: %d sec", hour, minuite, JailTime[playerid]-10);
			}
			else
			{
				format(string, sizeof(string), "~g~|~w~%d:%d~g~|", hour, minuite);
			}
		}
		GameTextForPlayer(playerid, string, 5000, 1);
		format(string, sizeof(string), "* %s olha o relogio.", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		return 1;
	}
//----------------------{HOUSES}-------------------
	if(strcmp(cmd, "/house", true) == 0 && PlayerInfo[playerid][pAdmin] >= 3)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /house [housenumber]");
			return 1;
		}
		new housenum = strval(tmp);
		SetPlayerInterior(playerid,HouseInfo[housenum][hInt]);
		SetPlayerPos(playerid,HouseInfo[housenum][hExitx],HouseInfo[housenum][hExity],HouseInfo[housenum][hExitz]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		PlayerInfo[playerid][pInt] = HouseInfo[housenum][hInt];
		PlayerInfo[playerid][pLocal] = housenum;
		return 1;
	}
	if(strcmp(cmd, "/biz", true) == 0 && PlayerInfo[playerid][pAdmin] >= 3)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /biz [housenumber]");
			return 1;
		}
		new housenum = strval(tmp);
		SetPlayerInterior(playerid,BizzInfo[housenum][bInt]);
		SetPlayerPos(playerid,BizzInfo[housenum][bExitx],BizzInfo[housenum][bExity],BizzInfo[housenum][bExitz]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		PlayerInfo[playerid][pInt] = BizzInfo[housenum][bInt];
		PlayerInfo[playerid][pLocal] = housenum+99;
		return 1;
	}
	if(strcmp(cmd, "/sbiz", true) == 0 && PlayerInfo[playerid][pAdmin] >= 3)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /sbiz [biznumber]");
			return 1;
		}
		new housenum = strval(tmp);
		SetPlayerInterior(playerid,SBizzInfo[housenum][sbInt]);
		SetPlayerPos(playerid,SBizzInfo[housenum][sbEntrancex],SBizzInfo[housenum][sbEntrancey],SBizzInfo[housenum][sbEntrancez]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/edithousecar", true) == 0)
	{
		if(PlayerInfo[playerid][pAdmin] < 1337)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "not admin");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /edithousecar [vecid]");
			return 1;
		}
		new proplev = strval(tmp);
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
			{
				HouseInfo[i][hVec] = proplev;
				format(string, sizeof(string), "House Car: %d is now %d", i,HouseInfo[i][hVec]);
				SendClientMessage(playerid, COLOR_GRAD2, string);
			}
		}
		OnPropUpdate();
		return 1;
	}
	if(strcmp(cmd, "/editlevel", true) == 0)
	{
		if(PlayerInfo[playerid][pAdmin] < 1337)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "not admin");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /editlevel [level]");
			return 1;
		}
		new proplev = strval(tmp);
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
			{
				format(string, sizeof(string), "House: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					HouseInfo[i][hLevel] = proplev;
				}
			}
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				format(string, sizeof(string), "Biz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					BizzInfo[i][bLevel] = proplev;
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				format(string, sizeof(string), "SBiz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					SBizzInfo[i][sbLevel] = proplev;
				}
			}
		}
		OnPropUpdate();
		return 1;
	}
	if(strcmp(cmd, "/editprod", true) == 0)
	{
		if(PlayerInfo[playerid][pAdmin] < 1337)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "not admin");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /editprop [level]");
			return 1;
		}
		new proplev = strval(tmp);
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				format(string, sizeof(string), "Biz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					BizzInfo[i][bProdCost] = proplev;
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				format(string, sizeof(string), "SBiz: %d", i);
				SendClientMessage(playerid, COLOR_GRAD2, string);
				if(proplev > 0)
				{
					SBizzInfo[i][sbProdCost] = proplev;
				}
			}
		}
		OnPropUpdate();
		return 1;
	}
	if(strcmp(cmd, "/load", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		if(tmpcar < 78 || tmpcar > 81)
		{
			GameTextForPlayer(playerid, "~r~You are not in a delivery truck", 5000, 1);
			return 1;
		}
		format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
		SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
	}
	if(strcmp(cmd, "/buycomp", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new compcost = 9000;
		if(PlayerToPoint(60.0, playerid, 2787.8,-2436.3,13.7))
		{
			if(IsATruck(tmpcar))
			{
				if(PlayerHaul[tmpcar][pLoad] < PlayerHaul[tmpcar][pCapasity])
				{
					new amount = PlayerHaul[tmpcar][pCapasity]-PlayerHaul[tmpcar][pLoad];
					new cost = amount*compcost;
					if(GetPlayerMoney(playerid) >= cost)
					{
						PlayerHaul[tmpcar][pLoad] = PlayerHaul[tmpcar][pCapasity];
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "You Bought %d Components For $%d", amount,cost);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						GivePlayerMoney(playerid,-cost);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						return 1;
					}
					else
					{
						format(string, sizeof(string), "You cant afford %d Components at $%d", amount,cost);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
				}
				else
				{
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, TEAM_GROVE_COLOR, "This Vehicle Does Not Deliver Components");
				return 1;
			}
		}
	}
	if(strcmp(cmd, "/sellcomp", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new cashmade;
		if(!IsATruck(tmpcar))
		{
			GameTextForPlayer(playerid, "~r~You are not in a delivery truck", 5000, 1);
			return 1;
		}
		if(PlayerHaul[tmpcar][pLoad] == 0)
		{
			GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
			format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
			SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
			return 1;
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(10, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				//printf("Found House :%d",i);
				for(new l = PlayerHaul[tmpcar][pLoad]; l > 0; l--)
				{
					if(BizzInfo[i][bCompCap] == BizzInfo[i][bComp])
					{
						GameTextForPlayer(playerid, "~r~Our stores are full", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, BizzInfo[i][bDiscription]);
						printf("%s", string);
						PayLog(string);
						return 1;
					}
					if(BizzInfo[i][bPayComp] > BizzInfo[i][bTakings])
					{
						GameTextForPlayer(playerid, "~r~We Cant Afford The Deal", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, BizzInfo[i][bDiscription]);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						printf("%s", string);
						PayLog(string);
						return 1;
					}
					PlayerHaul[tmpcar][pLoad]--;
					BizzInfo[i][bComp]++;
					cashmade = cashmade+BizzInfo[i][bPayComp];
					GivePlayerMoney(playerid,BizzInfo[i][bPayComp]);
					BizzInfo[i][bTakings] = BizzInfo[i][bTakings]-BizzInfo[i][bPayComp];
					if(PlayerHaul[tmpcar][pLoad] == 0 || PlayerHaul[tmpcar][pLoad] == 5)
					{
						PlayerInfo[playerid][pWA]++;
						if(PlayerInfo[playerid][pWA] >= 20)
						{
							PlayerInfo[playerid][pExp]++;
							PlayerInfo[playerid][pWA] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
						}
					}
					if(PlayerHaul[tmpcar][pLoad] == 0)
					{
						GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, BizzInfo[i][bDiscription]);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						printf("%s", string);
						PayLog(string);
						return 1;
					}
				}
				OnPropUpdate();
				return 1;
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(10, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				//printf("Found House :%d",i);
				for(new l = PlayerHaul[tmpcar][pLoad]; l > 0; l--)
				{
					if(SBizzInfo[i][sbCompCap] == SBizzInfo[i][sbComp])
					{
						GameTextForPlayer(playerid, "~r~Our stores are full", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
					if(SBizzInfo[i][sbPayComp] > SBizzInfo[i][sbTakings])
					{
						GameTextForPlayer(playerid, "~r~We Cant Afford The Deal", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
					PlayerHaul[tmpcar][pLoad]--;
					SBizzInfo[i][sbComp]++;
					cashmade = cashmade+SBizzInfo[i][sbPayComp];
					GivePlayerMoney(playerid,SBizzInfo[i][sbPayComp]);
					format(string, sizeof(string), "%s sold comp for $%d to %s", sendername, cashmade, SBizzInfo[i][sbDiscription]);
					printf("%s", string);
					PayLog(string);
					SBizzInfo[i][sbTakings] = SBizzInfo[i][sbTakings]-SBizzInfo[i][sbPayComp];
					if(PlayerHaul[tmpcar][pLoad] == 0 || PlayerHaul[tmpcar][pLoad] == 5)
					{
						PlayerInfo[playerid][pWA]++;
						if(PlayerInfo[playerid][pWA] >= 20)
						{
							PlayerInfo[playerid][pExp]++;
							PlayerInfo[playerid][pWA] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
						}
					}
					if(PlayerHaul[tmpcar][pLoad] == 0)
					{
						GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Components: %d/%d", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
				}
				OnPropUpdate();
				return 1;
			}
		}
		GameTextForPlayer(playerid, "~r~To Far From A Business", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/entrar", true) == 0)
	{
		for(new i = 0; i < sizeof(HouseInfo); i++)
		{
			if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
			{
				//printf("Found House :%d",i);
				if(PlayerInfo[playerid][pPhousekey] == i || HouseInfo[i][hLock] == 0)
				{
					SetPlayerInterior(playerid,HouseInfo[i][hInt]);
					SetPlayerPos(playerid,HouseInfo[i][hExitx],HouseInfo[i][hExity],HouseInfo[i][hExitz]);
					GameTextForPlayer(playerid, "~w~Bem Vindo", 5000, 1);
					PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
					PlayerInfo[playerid][pLocal] = i;
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Fechado", 5000, 1);
				}
			}
		}
		for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,BizzInfo[i][bEntrancex], BizzInfo[i][bEntrancey], BizzInfo[i][bEntrancez]))
			{
				//printf("Found House :%d",i);
				if(PlayerInfo[playerid][pPbiskey] == i || GetPlayerMoney(playerid) >= BizzInfo[i][bEntcost] || (BizzInfo[i][bEntcost] > 20000 && PlayerInfo[playerid][pLevel] < 3))
				{
					if(PlayerInfo[playerid][pPbiskey] != i)
					{
						if(BizzInfo[i][bLock] == 1)
						{
							GameTextForPlayer(playerid, "~r~Fechado", 5000, 1);
							return 1;
						}
						if(BizzInfo[i][bProd] == 0)
						{
							GameTextForPlayer(playerid, "~r~Fora de Estoque:", 5000, 1);
							return 1;
						}
						GivePlayerMoney(playerid,-BizzInfo[i][bEntcost]);
						format(string, sizeof(string), "~r~-$%d~n~~w~coloque /sair~n~para sair", BizzInfo[i][bEntcost]);
						BizzInfo[i][bTakings] = BizzInfo[i][bTakings]+BizzInfo[i][bEntcost];
						BizzInfo[i][bProd]--;
						OnPropUpdate();
						GameTextForPlayer(playerid, string, 5000, 3);
						if(i == 7) //casino
						{
							gSpentCash[playerid] = GetPlayerMoney(playerid);
						}
					}
					SetPlayerInterior(playerid,BizzInfo[i][bInt]);
					SetPlayerPos(playerid,BizzInfo[i][bExitx],BizzInfo[i][bExity],BizzInfo[i][bExitz]);
					PlayerInfo[playerid][pInt] = BizzInfo[i][bInt];
					PlayerInfo[playerid][pLocal] = i+99;
					new dood[MAX_PLAYER_NAME];
					GetPlayerName(playerid, dood, sizeof(dood));
					format(string, sizeof(string), "%s pagou $%d para entrar no %d", dood, BizzInfo[i][bEntcost], i);
					printf("%s", string);
					PayLog(string);
					//PlayerInfo[playerid][pLocal] = i;
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Voce nao tem dinheiro", 5000, 1);
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntrancex], SBizzInfo[i][sbEntrancey], SBizzInfo[i][sbEntrancez]))
			{
				if(PlayerInfo[playerid][pPbiskey] == i || GetPlayerMoney(playerid) >= SBizzInfo[i][sbEntcost] || (SBizzInfo[i][sbEntcost] > 20000 && PlayerInfo[playerid][pLevel] < 3))
				{
					if(PlayerInfo[playerid][pPbiskey] != i)
					{
						if(SBizzInfo[i][sbLock] == 1)
						{
							GameTextForPlayer(playerid, "~r~Fechado", 5000, 1);
							return 1;
						}
						if(SBizzInfo[i][sbProd] == 0)
						{
							GameTextForPlayer(playerid, "~r~Fora de Estoque:", 5000, 1);
							return 1;
						}
						if(i == 2 || i == 8) //planes school
						{
							SetVehicleParamsForPlayer(66,playerid,0,0);
							SetVehicleParamsForPlayer(67,playerid,0,0);
							SetVehicleParamsForPlayer(68,playerid,0,0);
							SetVehicleParamsForPlayer(69,playerid,0,0);
							SetVehicleParamsForPlayer(70,playerid,0,0);
							SetVehicleParamsForPlayer(71,playerid,0,0);
							SetVehicleParamsForPlayer(72,playerid,0,0);
							PLicence[playerid] = 1;
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "Pilots Licence: You can now fly any plane");
						}
						if(i == 0) //parachute
						{

							SetPlayerInterior(playerid,1);
							SetPlayerPos(playerid,1.71875, 30.4062, 1200.34);
							PlayerInfo[i][pInt] = 0;
							gSkyDive[playerid] = 1;
						}
						if(i == 1) //wheele
						{
							//SetPlayerInterior(playerid,HouseInfo[i][hInt]);
							if (GetPlayerState(playerid) == 2)
							{
								new tmpcar = GetPlayerVehicleID(playerid);
								TelePos[playerid][0] = 0.0;
								TelePos[playerid][1] = 0.0;
								PlayerInfo[playerid][pLocal] = 10000;
								SetVehiclePos(tmpcar, -2724.0,217.9,4.1);
							}
							else
							{
								GameTextForPlayer(playerid, "~w~You must be in a Street Racer", 1000, 1);
								return 1;
							}
							Spectate[playerid] = 500;
							GameTextForPlayer(playerid, "~w~Para sair ~r~/sair", 5000, 1);
							//PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
						}
						if(i == 3 || i == 7) //stealth school
						{
							Hidden[playerid] = 1;
							SetPlayerToTeamColor(playerid);
							GameTextForPlayer(playerid, "~w~Icone escondido", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "Icone escondido.");
						}
						if(i == 4) //towcar school
						{
							GameTextForPlayer(playerid, "~w~breakdown service~n~~g~type /towcar", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "To use this service: type /towcar.");
							return 1;
						}
						if(i == 5) //homeupgrade school
						{
							GameTextForPlayer(playerid, "~w~Home Supply~~g~type /houseupgrade", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "To use this service: type /houseupgrade.");
							return 1;
						}
						if(i == 6) //sellcars school
						{
							GameTextForPlayer(playerid, "~w~Car Sales~n~~g~type /carupgrade", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "To use this service: type /carupgrade.");
							return 1;
						}
						if(i == 9 || i == 10) //buy school
						{
							Locator[playerid] = 1;
							GameTextForPlayer(playerid, "~w~Locator Device~n~~g~Your can locate best buys and sales", 5000, 3);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "type /bestbuy or /bestsale");
						}
						if(i == 11 || i == 12) //buy school
						{
							SendClientMessage(playerid, TEAM_GROVE_COLOR, "type /jointeam <teamid> to use");
							return 1;
						}
						GivePlayerMoney(playerid,-SBizzInfo[i][sbEntcost]);
						gSpentCash[playerid] = GetPlayerMoney(playerid);
						SBizzInfo[i][sbProd]--;
						SBizzInfo[i][sbTakings] = SBizzInfo[i][sbTakings]+SBizzInfo[i][sbEntcost];
						new dood[MAX_PLAYER_NAME];
						GetPlayerName(playerid, dood, sizeof(dood));
						format(string, sizeof(string), "%s payed $%d to enter sbiz %d", dood, SBizzInfo[i][sbEntcost], i);
						printf("%s", string);
						PayLog(string);
						OnPropUpdate();
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~You dont have the cash", 5000, 1);
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/sair", true) == 0)
	{
		if (PlayerToPoint(10, playerid,-2724.0,217.9,4.1))
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1519.2,-1474.4,9.1);
			}
			else
			{
				SetPlayerPos(playerid, 1519.2,-1474.4,9.1);
				return 1;
			}
			new oldcash = gSpentCash[playerid];
			if(oldcash > 0)
			{
				new Total = GetPlayerMoney(playerid) - oldcash;
				printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(playerid),oldcash);
				new name[MAX_PLAYER_NAME];
				SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]+Total;
				GetPlayerName(playerid, name, sizeof(name));
				format(string,128,"<< %s has left the modshop with $%d >>",name,Total);
				PayLog(string);
			}
			gSpentCash[playerid] = 0;
			TelePos[playerid][0] = 0.0;
			TelePos[playerid][1] = 0.0;
			Spectate[playerid] = 255;
			PlayerInfo[playerid][pLocal] = 255;
		}
		for(new i = 0; i <  sizeof(HouseInfo); i++)
		{
			//printf("House :%d",i);
			if (PlayerToPoint(3, playerid,HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz]))
			{
				SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,HouseInfo[i][hEntrancex],HouseInfo[i][hEntrancey],HouseInfo[i][hEntrancez]);
				PlayerInfo[playerid][pInt] = 0;
				PlayerInfo[playerid][pLocal] = 255;
				if(HouseInfo[i][hHel] == 1)
				{
					new Float:tempheal;
					GetPlayerHealth(playerid,tempheal);
					if(tempheal < 100.0)
					{
						SetPlayerHealth(playerid,100.0);
					}
				}
			}
		}
		for(new i = 0; i <  sizeof(BizzInfo); i++)
		{
			//printf("Bizz :%d",i);
			if (PlayerToPoint(3, playerid,BizzInfo[i][bExitx], BizzInfo[i][bExity], BizzInfo[i][bExitz]))
			{
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
				SetPlayerPos(playerid,BizzInfo[i][bEntrancex],BizzInfo[i][bEntrancey],BizzInfo[i][bEntrancez]);
				PlayerInfo[playerid][pLocal] = 255;
				if(i == 7 && PlayerInfo[playerid][pPbiskey] != 7) //casino
				{
					new oldcash = gSpentCash[playerid];
					if(oldcash > 0)
					{
						new Total = GetPlayerMoney(playerid) - oldcash;
						printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(playerid),oldcash);
						new name[MAX_PLAYER_NAME];
						BizzInfo[i][bTakings] = BizzInfo[i][bTakings]+Total;
						GetPlayerName(playerid, name, sizeof(name));
						format(string,128,"<< %s has left the casino with $%d >>",name,Total);
						PayLog(string);
						gSpentCash[playerid] = 0;
					}
				}
			}
		}
		if(GetPlayerVehicleID(playerid) >= 71 && GetPlayerVehicleID(playerid) <= 77)
		{
			TogglePlayerControllable(playerid, 1);
			RemovePlayerFromVehicle(playerid);
		}
		return 1;
	}
	if(strcmp(cmd, "/casa", true) == 0)
	{
		if(PlayerInfo[playerid][pPhousekey] != 255)
		{
			SetPlayerCheckpoint(playerid,HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancex], HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancey], HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancez], 4.0);
			GameTextForPlayer(playerid, "~w~Sua ~r~Casa", 5000, 1);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
		}
		else
		{
			GameTextForPlayer(playerid, "~w~Voce nao tem casa", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/modcarro", true) == 0)
	{
		new tmpcar = GetPlayerVehicleID(playerid);
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[1][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Fora de Estoque.", 5000, 1);
				return 1;
			}
			if (GetPlayerState(playerid) != 2 && tmpcar != house+1)
			{
				GameTextForPlayer(playerid, "~r~Nao esta no seu carro", 5000, 1);
				return 1;
			}
			if(PlayerToPoint(2.0, playerid, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]))
			{
				GivePlayerMoney(playerid,-1000);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]+1000;//modshop buisness
				SBizzInfo[1][sbProd]--;
				TelePos[playerid][0] = 0.0;
				TelePos[playerid][1] = 0.0;
				SetVehiclePos(tmpcar, 1040.6,-1021.0,31.7);
				gSpentCash[playerid] = GetPlayerMoney(playerid);
				Spectate[playerid] = 500;
				GameTextForPlayer(playerid, "~w~Para sair~r~/sair~n~-$1000", 5000, 1);
			//PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
				PlayerInfo[playerid][pLocal] = 10001;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~Voce esta em casa", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~Voce nao tem casa", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/guincharcarro", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[4][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Fora de Estoque:", 5000, 1);
				return 1;
			}
			if(CarTow(house+1))
			{
				GameTextForPlayer(playerid, "~w~Carro~n~~g~guinchado~n~~r~$-30", 5000, 1);
				GivePlayerMoney(playerid,-30);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[4][sbTakings] = SBizzInfo[4][sbTakings]+30;//towcar buisness
				SBizzInfo[4][sbProd]--;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~Carro~n~em ~r~uso", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~Voce nao tem casa, nem carro", 5000, 1);
		}
		return 1;
	}
	if(strcmp(cmd, "/reparar", true) == 0)
	{
		new house = PlayerInfo[playerid][pPhousekey];
		GetPlayerName(playerid, playername, sizeof(playername));
		if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
		{
			if(SBizzInfo[4][sbProd] == 0)
			{
				GameTextForPlayer(playerid, "~r~Fora de Estoque:", 5000, 1);
				return 1;
			}
			if(CarRespawn(house+1))
			{
				GameTextForPlayer(playerid, "~w~Carro~n~~g~Reparado~n~~r~$-50", 5000, 1);
				GivePlayerMoney(playerid,-50);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				SBizzInfo[4][sbTakings] = SBizzInfo[4][sbTakings]+50;//towcar buisness
				SBizzInfo[4][sbProd]--;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~Carro~n~em ~r~uso", 5000, 1);
			}
		}
		else
		{
			GameTextForPlayer(playerid, "~w~Voce nao tem casa, nem carro", 5000, 1);
		}
		return 1;
	}
	// 		CreateVehicle(HouseInfo[h][hVec], HouseCarSpawns[h][0], HouseCarSpawns[h][1], HouseCarSpawns[h][2], HouseCarSpawns[h][3], HouseInfo[h][hVcol1], HouseInfo[h][hVcol2], -1);
	// 				SetVehiclePos(plo,plocx,plocy+4, plocz);
	if (strcmp(cmd, "/dmweapon", true) == 0)
	{
		new gunid[16];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			format(string, sizeof(string), "USO: /dmweapon [gunname]");
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** DM WEAPONS ***");
			SendClientMessage(playerid, COLOR_GRAD2,string);
			SendClientMessage(playerid, COLOR_GRAD3, "Weapons: default chainsaw sdpistol colt45 mp5 shotgun spas12");
			SendClientMessage(playerid, COLOR_GRAD3, "Weapons: deagle uzi sawnoff tec9 ak47 m4 rifle flamethrower");
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			return 1;
		}
			strmid(gunid, tmp, 0, strlen(cmdtext), 255);
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
			{
				/*
				if (PlayerInfo[playerid][pLevel] >= 13 && (strcmp(gunid, "minigun", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: You Will Now Spawn With A minigun");
					PlayerInfo[playerid][pGun6] = 38;
					ResetPlayerWeapons(playerid);
					SetPlayerWeapons(playerid);
					PlayerInfo[playerid][gPupgrade]--;
				}
				*/
				if ((strcmp(gunid, "flamethrower", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A flamethrower");
					dmweapon = 37;
				}
				else if ((strcmp(gunid, "rifle", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A rifle");
					dmweapon = 33;
				}
				else if ((strcmp(gunid, "m4", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With An m4");
					dmweapon = 31;
				}
				else if ((strcmp(gunid, "ak47", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With An ak47");
					dmweapon = 30;
				}
				else if ((strcmp(gunid, "Tec9", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A Tec9");
					dmweapon = 32;
				}
				else if ((strcmp(gunid, "sawnoff", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A sawnoff");
					dmweapon = 26;
				}
				else if ((strcmp(gunid, "uzi", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With An uzi");
					dmweapon = 28;
				}
				else if ((strcmp(gunid, "deagle", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A deagle");
					dmweapon = 24;
				}
				else if ((strcmp(gunid, "spas12", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players You Will Now Spawn With A spas12");
					dmweapon = 27;
				}
				else if ((strcmp(gunid, "shotgun", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With A shotgun");
					dmweapon = 25;
				}
				else if ((strcmp(gunid, "mp5", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With An mp5");
					dmweapon = 29;
				}
				else if ((strcmp(gunid, "colt45", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With A colt45");
					dmweapon = 22;
				}
				else if ((strcmp(gunid, "sdpistol", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With An sdpistol");
					dmweapon = 23;
				}
				else if ((strcmp(gunid, "chainsaw", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With A chainsaw");
					dmweapon = 9;
				}
				else if ((strcmp(gunid, "default", true, strlen(gunid)) == 0))
				{
					SendClientMessage(playerid, COLOR_GRAD6, "Players Will Now Spawn With There Own Weapons");
					dmweapon = 0;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "   Unrecognized Weapon");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD6, "   You Are Not An Admin");
				return 1;
			}
		return 1;
	}
	if(strcmp(cmd, "/startdm", true) == 0)
	{
		if(MissionActive == 0 || MissionActive == 4 || MissionActive == 8 || MissionActive == 12)
		{
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
			{
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) && gPlayerSpawned[i])
					{
						SendClientMessage(i, COLOR_YELLOW, "SMS: DeathMatch Starting Soon At The Red Marker, Sender: MOLE (555)");
						RingTone[i] = 20;
						SendClientMessage(i, COLOR_WHITE, "AVISO: Go To The Red Marker And Wait For The DeathMatch To Start.");
						SetPlayerCheckpoint(i,gRandomDMSpawns[0][0],gRandomDMSpawns[0][1],gRandomDMSpawns[0][2], 4.0);
						GameTextForPlayer(i, "~w~Waypoint set ~r~DM", 5000, 1);
						gPlayerCheckpointStatus[i] = CHECKPOINT_DM;
					}
				}
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are not admin", 5000, 1);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "A mission is currently active");
		}
		return 1;
	}
/*
-----------------------------------PROFISSOES-------------------------------------------------*/

	if(strcmp(cmdtext, "/Carmenu", true) == 0) {
		VMain = CreateMenu(" ",1,100,200,90,25);
		AddMenuItem(VMain,0,"NRG");
		AddMenuItem(VMain,0,"Elegy");
		AddMenuItem(VMain,0,"Turismo");
		AddMenuItem(VMain,0,"Super GT");
		AddMenuItem(VMain,0,"Phoenix");
		AddMenuItem(VMain,0,"Banshee");
		AddMenuItem(VMain,0,"Sultan");
		AddMenuItem(VMain,0,"Sabre");
		AddMenuItem(VMain,0,"Clover");
		AddMenuItem(VMain,0,"Lowrider");
		ShowMenuForPlayer(VMain,playerid);

        return 1;
    }
    if(strcmp(cmdtext, "/CarDealers", true)==0)
    {
       SetPlayerPos(playerid,2080.01,1683.779,10.56309);
       SetPlayerFacingAngle(playerid,270.0);
    }
   	if(strcmp(cmd, "/cancelarmissao", true) == 0 || strcmp(cmd, "/cm", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /cm [id do jogador/Parte do nome]");
			//SendClientMessage(playerid, COLOR_RED, "Alerta: Invalid WeaponID's will crash the server");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		playa = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
		missao1[playa] = 0;
		missao2[playa] = 0;
	   	missao3[playa] = 0;
	   	Lixeiro[playerid] = 0;
		ComandosDesativados[playa] = 0;
		missaocancelada[playa] = 1;
		gPlayerCheckpointStatus[playa] = CHECKPOINT_NONE;
		DisablePlayerCheckpoint(playa);
		SendClientMessage(playerid, COLOR_GRAD1, "Missao cancelada.");
		SendClientMessage(giveplayerid, COLOR_GRAD1, "Missao cancelada.");

		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}

		// TRAFICANTE
	if(strcmp(cmd, "/traficante", true) == 0 || strcmp(cmd, "/tr", true) == 0)
	{
	if (gDrogas[playerid] == 0)
	{
	 		if(gTeam[playerid] == 5)
			{
  			if (missao1[playerid] == 1)
			{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce ja esta com a missao ativa.");
			return 1;
			}
					RingTone[playerid] = 20;
					missao1[playerid] = 1;
     				SetPlayerCheckpoint(playerid,-1940.45,2379.98,49.70,2.5);
					ComandosDesativados[playerid] = 1;
					missaocancelada[playerid] = 0;
					GameTextForPlayer(playerid, "~r~Drogas", 5000, 1);
					SendClientMessage(playerid, COLOR_GREEN, "Va para o local e negocie com o chefao.");
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_DROGASFINAL;
			}
			else
			{
			GameTextForPlayer(playerid, "~w~Voce nao e um traficante", 5000, 1);
			}
			}
			else
			{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce ja possui drogas.");
			}
		return 1;
	}
	
	if(strcmp(cmd, "/venderdrogas", true) == 0 || strcmp(cmd, "/vd", true) == 0)
	{
		new drogas;
		new trdrogas;
		new plid, droga;
		tmp = strtok(cmdtext, idx);
		plid = strval(tmp);
			if(!strlen(tmp))
				{
				SendClientMessage(playerid, COLOR_RED, "/venderdrogas ou /vd [id] [quantidade]");
				return 1;
				}
			if(IsStringAName(tmp))
				{
				plid = GetPlayerID(tmp);
				}
				else
				{
				plid = strval(tmp);
				}
				GetPlayerName(plid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
			tmp = strtok(cmdtext, idx);
	   		droga = strval(tmp);
	    		if(!strlen(tmp))
				{
				SendClientMessage(playerid, COLOR_RED, "/venderdrogas ou /vd [id] [quantidade]");
				return 1;
				}
				if(gTeam[playerid] == 5)
					{
						if (PlayerInfo[playerid][pTrDrogas] <= 0)
						{
						SendClientMessage(playerid, COLOR_GRAD1, "Voce nao possui drogas. Coloque /traficante.");
						return 1;
						}
						if(playerid == plid)
						{
		   				 SendClientMessage(playerid, COLOR_GRAD1, "Voce nao pode vender drogas para voce mesmo.");
		   				 return 1;
		   				}
		   				if(QuerDrogas[plid] == 0)
		    			{
		    			SendClientMessage(playerid, COLOR_GRAD1, "O jogador nao quer comprar drogas.");
		    			return 1;
		    			}
		    			if(droga > 100)
		    			{
		    			SendClientMessage(playerid, COLOR_GRAD1, "Maximo de 100 gramas por vez.");
		    			return 1;
		    			}
		    			if (PlayerInfo[playerid][pTrDrogas] < droga)
						{
						SendClientMessage(playerid, COLOR_GRAD1, "Voce nao possui isso tudo.");
						return 1;
						}
						if (GetPlayerMoney(plid) < droga)
						{
						SendClientMessage(playerid, COLOR_GRAD1, "O usuario nao pode pagar.");
						return 1;
						}
					if(IsPlayerConnected(plid))
						{
			    			drogas = PlayerInfo[plid][pDrogaUso] + droga;
							PlayerInfo[plid][pDrogaUso] = drogas;
							trdrogas = PlayerInfo[playerid][pTrDrogas] - droga;
							PlayerInfo[playerid][pTrDrogas] = trdrogas;
							new ganho = droga;
							GivePlayerMoney(playerid, ganho);
							GivePlayerMoney(plid, -ganho);
							new trdrog = PlayerInfo[playerid][pTrDrogas];
							format(string,sizeof(string),"Vendido %d gramas para o %s. Voce possui agora %d gramas e recebeu %d.",droga, giveplayer, trdrog, ganho);
							SendClientMessage(playerid,COLOR_GREEN,string);
                            format(string,sizeof(string),"Voce comprou %d gramas do %s por %d, agora voce possui %d gramas.",droga, sendername, ganho, drogas);
							SendClientMessage(plid,COLOR_GREEN,string);
							return 1;
						}
      					else
							{
  							SendClientMessage(playerid, COLOR_RED, "Jogador nao encontrado");
							return 1;
							}
							}
						else
						    {
						    GameTextForPlayer(playerid, "~w~Voce nao e traficante", 5000, 1);
						    }
		return 1;

}
		//NARCOTRAFICO
	if(strcmp(cmd, "/narcotrafico", true) == 0 || strcmp(cmd, "/nt", true) == 0)
	{
		if(gTeam[playerid] == 13)
			{
			if (missao2[playerid] == 1)
			{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce ja esta com a missao ativa.");
			return 1;
			}
					RingTone[playerid] = 20;
					SetPlayerCheckpoint(playerid,-688.17,933.62,13.63,4.0);
					AddStaticPickup(1210, 2, -688.17,933.62,13.63);
					ComandosDesativados[playerid] = 1;
					GameTextForPlayer(playerid, "~r~Narcotrafico", 5000, 1);
					missao2[playerid] = 1;
					missaocancelada[playerid] = 0;
					SendClientMessage(playerid, COLOR_GREEN, "Va para a casa no radar e pegue o dinheiro da carga de drogas.");
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_NARCOINICIO;
			}
			else
			{
			GameTextForPlayer(playerid, "~w~Voce nao e narcotraficante", 5000, 1);
			}
		return 1;
	}
	if(strcmp(cmd, "/querodrogas", true) == 0)
	{
		QuerDrogas[playerid] = 1;
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "* %s aceita comprar drogas", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		GameTextForPlayer(playerid, "~w~Voce aceita ~n~comprar ~r~drogas", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/naoquerodrogas", true) == 0)
	{
		QuerDrogas[playerid] = 0;
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "* %s nao aceita comprar drogas", sendername);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		GameTextForPlayer(playerid, "~w~Voce nao aceita ~n~comprar ~r~drogas", 5000, 1);
		return 1;
	}
	//PIRATARIA
	
 	if(strcmp(cmd, "/pirataria", true) == 0 || strcmp(cmd, "/pi", true) == 0)
	{
		if(gTeam[playerid] == 12)
			{
			if (missao3[playerid] == 1)
			{
			SendClientMessage(playerid, COLOR_GRAD1, "Voce ja esta com a missao ativa.");
			return 1;
			}
					RingTone[playerid] = 20;
					SetPlayerCheckpoint(playerid,-2328.99,1527.79,0.25,4.0);
					ComandosDesativados[playerid] = 1;
					GameTextForPlayer(playerid, "~r~Pirataria", 5000, 1);
					missao3[playerid] = 1;
					missaocancelada[playerid] = 0;
					SendClientMessage(playerid, COLOR_GREEN, "Prossiga para o navio.");
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_PIRATAINI;
			}
			else
			{
			GameTextForPlayer(playerid, "~w~Voce nao e pirateador", 5000, 1);
			}
		return 1;
	}
	//LADRAO DE BANCO
	if(strcmp(cmd, "/roubarbanco", true) == 0 || strcmp(cmd, "/rbanco", true) == 0)
	{
	if (gTeam[playerid] != 7)
	{
	GameTextForPlayer(playerid, "~w~Voce nao e ladrao de banco", 5000, 1);
	return 1;
	}
	if(RouboBanco[playerid] == 1)
	{
	SendClientMessage(playerid, COLOR_GRAD1, "Roubo em andamento.");
	return 1;
	}
	if (PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53) || PlayerToPoint(100, playerid,246.3,109.2,1003.2))
		{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "Noticia de BS: %s roubou um banco e esta sendo proucurado pela policia",sendername);
		SendClientMessageToAll(COLOR_RED, string);
		GameTextForPlayer(playerid, "~w~Se esconda ~n~em um lugar ~r~seguro", 5000, 1);
		GivePlayerMoney(playerid, 200);
        missaocancelada[playerid] = 0;
		RouboBanco[playerid] = 1;
		ComandosDesativados[playerid] = 1;
		SetPlayerCheckpoint(playerid,-1050.3,1548.6,33.4,4.0);
		SendClientMessage(playerid, COLOR_GREEN, "Corra para a casa no radar e se esconda.");
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_LADRAOBANCO;
		}
		else
		{
		SendClientMessage(playerid, COLOR_GRAD1, "Voce nao esta em um banco.");
		}
	}
	//LIXEIRO
	if(strcmp(cmd, "/limparcidade", true) == 0 || strcmp(cmd, "/lcidade", true) == 0)
	{
			if (gTeam[playerid] != 21)
			{
			GameTextForPlayer(playerid, "~w~Voce nao e lixeiro", 5000, 1);
			return 1;
			}
			if(Lixeiro[playerid] == 1)
			{
			SendClientMessage(playerid, COLOR_GRAD1, "Missao em andamento.");
			return 1;
			}
		Lixeiro[playerid] = 1;
		ComandosDesativados[playerid] = 1;
		SetPlayerCheckpoint(playerid,-2481.00,2293.04,4.98,4.0);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_LIXO1;
		GameTextForPlayer(playerid, "~w~Limpe a ~r~cidade", 5000, 1);
	}
	//HACKER
	if(strcmp(cmd, "/hackear", true) == 0)
	{
			if (gTeam[playerid] != 11)
				{
					GameTextForPlayer(playerid, "~w~Voce nao e hacker", 5000, 1);
					return 1;
				}
			if(Hacker[playerid] == 1)
				{
					SendClientMessage(playerid, COLOR_GRAD1, "Missao em andamento.");
					return 1;
				}
     		Hacker[playerid] = 1;
        	ComandosDesativados[playerid] = 1;
        	SetPlayerCheckpoint(playerid,-226.6,1395.0,69.9,4.0);
        	GameTextForPlayer(playerid, "~w~Instale o ~n~~r~bug", 5000, 1);
        	SendClientMessage(playerid, COLOR_GREEN, "Instale o bug na torre de comunicacao.");
        	gPlayerCheckpointStatus[playerid] = CHECKPOINT_HACKERINI;
   }
   //TRAFICO DE ARMAS
   if(strcmp(cmd, "/traficodearmas", true) == 0 || strcmp(cmd, "/trarma", true) == 0)
	{
   			if(gTeam[playerid] != 14)
			{
			GameTextForPlayer(playerid, "~w~Voce nao e tr. de armas", 5000, 1);
			return 1;
			}
			if(TrArmas[playerid] == 1)
			{
			SendClientMessage(playerid, COLOR_GRAD1, "Missao em andamento.");
			return 1;
			}
			TrArmas[playerid] = 1;
        	ComandosDesativados[playerid] = 1;
        	SetPlayerCheckpoint(playerid,-1353.31,2057.65,53.12,4.0);
        	GameTextForPlayer(playerid, "~w~Ache o~n~~r~negociante", 5000, 1);
        	SendClientMessage(playerid, COLOR_GREEN, "Entre em contato com o negociante de armas, seu amigo ira te dar o caminho.");
        	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TRAFICOARMA;
  	}


//------------------------------------------------------------------------------------------------
	if(strcmp(cmd, "/tempo1", true) == 0)
	{
		for(new i=0; i<MAX_PLAYERS; i++)
			{
			Tempo[i] = 1;
			SetPlayerWeather(i,9);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "Pronto.");
	}
	if(strcmp(cmd, "/tempo2", true) == 0)
	{
		for(new i=0; i<MAX_PLAYERS; i++)
			{
			Tempo[i] = 2;
			SetPlayerWeather(i,10);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "Pronto.");
	}
	if(strcmp(cmd, "/tempo3", true) == 0)
	{
		for(new i=0; i<MAX_PLAYERS; i++)
			{
			Tempo[i] = 3;
			SetPlayerWeather(i,11);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "Pronto.");
	}
 	if(strcmp(cmd, "/tempo4", true) == 0)
	{
		for(new i=0; i<MAX_PLAYERS; i++)
			{
			Tempo[i] = 4;
			SetPlayerWeather(i,16);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "Pronto.");
	}
		if(strcmp(cmd, "/tempo5", true) == 0)
	{
		for(new i=0; i<MAX_PLAYERS; i++)
			{
			Tempo[i] = 5;
			SetPlayerWeather(i,39);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "Pronto.");
	}
 	if(strcmp(cmd, "/tempo6", true) == 0)
	{
		for(new i=0; i<MAX_PLAYERS; i++)
			{
			Tempo[i] = 6;
			SetPlayerWeather(i,8);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "Pronto.");
	}
/*-------------------------------------------------------------------------------------------------*/
	if(strcmp(cmd, "/plan", true) == 0)
	{
		SetPlayerInterior(playerid,10);
		SetPlayerPos(playerid,246.234, 117.805, 1005.61);
		//GetPlayerName(playerid, sendername, sizeof(sendername));
		GameTextForPlayer(playerid, "~w~Sua casa", 5000, 1);
		//format(string, sizeof(string), "* %s checks the time.", sendername);
		//ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		return 1;
	}
	
//----------------------------------[BIZZ]-----------------------------------------------

	if(strcmp(cmd, "/comprarnegocio", true) == 0)
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		if(PlayerInfo[playerid][pPbiskey] != 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "   Voce ja tem um negocio, coloque /vendernegocio para vender.");
			return 1;
		}
		for(new b = 0; b < sizeof(SBizzInfo); b++)
		{
			if(PlayerToPoint(2.0, playerid, SBizzInfo[b][sbEntrancex], SBizzInfo[b][sbEntrancey], SBizzInfo[b][sbEntrancez]) && SBizzInfo[b][sbOwned] == 0)
			{
				if(PlayerInfo[playerid][pLevel] < SBizzInfo[b][sbLevel])
				{
					format(string, sizeof(string), "Voce deve ter nivel %d",SBizzInfo[b][sbLevel]);
					SendClientMessage(playerid, COLOR_GRAD5, string);
					return 1;
				}
				if(GetPlayerMoney(playerid) > SBizzInfo[b][sbValue])
				{
					PlayerInfo[playerid][pPbiskey] = b+100;
					SBizzInfo[b][sbOwned] = 1;
					GetPlayerName(playerid, sendername, sizeof(sendername));
					strmid(SBizzInfo[b][sbOwner], sendername, 0, strlen(sendername), 255);
					GivePlayerMoney(playerid,-SBizzInfo[b][sbValue]);
					PlayerPlayMusic(playerid);
					SendClientMessage(playerid, COLOR_WHITE, "Parabens voce comprou.");
					SendClientMessage(playerid, COLOR_WHITE, "Coloque /comandos para ver ajuda.");
					DateProp(playerid);
					OnPropUpdate();
					OnPlayerUpdate(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem dinheiro suficiente");
					return 1;
				}
			}
		}
		for(new b = 0; b < sizeof(BizzInfo); b++)
		{
			if(PlayerToPoint(2.0, playerid, BizzInfo[b][bEntrancex], BizzInfo[b][bEntrancey], BizzInfo[b][bEntrancez]) && BizzInfo[b][bOwned] == 0)
			{
				if(PlayerInfo[playerid][pLevel] < BizzInfo[b][bLevel])
				{
					format(string, sizeof(string), "Voce dever ter nivel %d",BizzInfo[b][bLevel]);
					SendClientMessage(playerid, COLOR_GRAD5, string);
					return 1;
				}
				if(GetPlayerMoney(playerid) > BizzInfo[b][bValue])
				{
					PlayerInfo[playerid][pPbiskey] = b;
					BizzInfo[b][bOwned] = 1;
					GetPlayerName(playerid, sendername, sizeof(sendername));
					strmid(BizzInfo[b][bOwner], sendername, 0, strlen(sendername), 255);
					GivePlayerMoney(playerid,-BizzInfo[b][bValue]);
					PlayerPlayMusic(playerid);
					SetPlayerInterior(playerid,BizzInfo[b][bInt]);
					PlayerInfo[playerid][pInt] = BizzInfo[b][bInt];
					SetPlayerPos(playerid,BizzInfo[b][bExitx],BizzInfo[b][bExity],BizzInfo[b][bExitz]);
					GameTextForPlayer(playerid, "~w~Bem Vindo~n~voce pode sair por /sair", 5000, 3);
					PlayerInfo[playerid][pInt] = BizzInfo[b][bInt];
					PlayerInfo[playerid][pLocal] = b ;
					SendClientMessage(playerid, COLOR_WHITE, "Parabens voce comprou.");
					SendClientMessage(playerid, COLOR_WHITE, "Coloque /comandos para ver ajuda.");
					DateProp(playerid);
					OnPropUpdate();
					OnPlayerUpdate(playerid);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem dinheiro suficiente");
					return 1;
				}
			}
		}
	}
	if(strcmp(cmd, "/sellbiz", true) == 0)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		if(PlayerInfo[playerid][pPbiskey] == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Voce nao tem um negocio.");
			return 1;
		}
		if(PlayerInfo[playerid][pPbiskey] >= 100 && strcmp(playername, SBizzInfo[PlayerInfo[playerid][pPbiskey]-100][sbOwner], true) == 0)
		{
			new bouse = PlayerInfo[playerid][pPbiskey]-100;
			SBizzInfo[bouse][sbHel] = 0;
			SBizzInfo[bouse][sbArm] = 0;
			SBizzInfo[bouse][sbLock] = 1;
			SBizzInfo[bouse][sbOwned] = 0;
			SBizzInfo[bouse][sbTakings] = 0;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			strmid(SBizzInfo[bouse][sbOwner], "O estado", 0, strlen("O estado"), 255);
			GivePlayerMoney(playerid,SBizzInfo[bouse][sbValue]);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", SBizzInfo[bouse][sbValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			PlayerInfo[playerid][pPbiskey] = 255;
			OnPropUpdate();
			OnPlayerUpdate(playerid);
			return 1;
		}
		if(strcmp(playername, BizzInfo[PlayerInfo[playerid][pPbiskey]][bOwner], true) == 0)
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			BizzInfo[bouse][bHel] = 0;
			BizzInfo[bouse][bArm] = 0;
			BizzInfo[bouse][bLock] = 1;
			BizzInfo[bouse][bOwned] = 0;
			BizzInfo[bouse][bTakings] = 0;
			GetPlayerName(playerid, sendername, sizeof(sendername));
			strmid(BizzInfo[bouse][bOwner], "O estado", 0, strlen("O estado"), 255);
			GivePlayerMoney(playerid,BizzInfo[bouse][bValue]);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", BizzInfo[bouse][bValue]);
			GameTextForPlayer(playerid, string, 10000, 3);
			PlayerInfo[playerid][pPbiskey] = 255;
			OnPropUpdate();
			OnPlayerUpdate(playerid);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a business.");
		}
	}
	if(strcmp(cmd, "/infonegocio", true) == 0 || strcmp(cmd, "/infoneg", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if(bouse == 255)
		{
			SendClientMessage(playerid, COLOR_WHITE, "You don't own a business.");
		}
		if (bouse >= 100)
		{

			PrintSBizInfo(playerid,bouse-100);
		}
		else
		{
			PrintBizInfo(playerid,bouse);
		}
		return 1;
	}
	if(strcmp(cmd, "/entrada", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem negocios");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /entrada [preco]");
		}
		if(strval(tmp) < 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "O minimo e de $0");
			return 1;
		}
		if (bouse >= 100)
		{

			SBizzInfo[bouse-100][sbEntcost] = strval(tmp);
			format(string, sizeof(string), "Entrada $%d", SBizzInfo[bouse-100][sbEntcost]);
		}
		else
		{
			BizzInfo[bouse][bEntcost] = strval(tmp);
			format(string, sizeof(string), "Preco escolhido: $%d", BizzInfo[bouse][bEntcost]);
		}
		OnPropUpdate();
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/pricemod", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao tem negocios");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /pricemod [percentage of base value (default %100)]");
			return 1;
		}
		if(strval(tmp) < 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Minimum percentage is 0%");
			return 1;
		}
		if (bouse >= 100)
		{
			SBizzInfo[bouse-100][sbEntcost] = strval(tmp);
			format(string, sizeof(string), "You dont own a large business");
		}
		else
		{
			BizzInfo[bouse][bPriceMod] = strval(tmp);
			format(string, sizeof(string), "Price percentage modifier set to %d%", BizzInfo[bouse][bPriceMod]);
		}
		OnPropUpdate();
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/precoatacado", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /compprice [amount to pay per unit of components]");
		}
		if(strval(tmp) < 10000)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Minimum amount is $10000");
			return 1;
		}
		if (bouse >= 100)
		{
			if(strval(tmp) > SBizzInfo[bouse-100][sbTakings])
			{
				SendClientMessage(playerid, COLOR_WHITE, "You dont have that much in your till.");
				return 1;
			}
			SBizzInfo[bouse-100][sbPayComp] = strval(tmp);
			format(string, sizeof(string), "Buying Components for $%d", SBizzInfo[bouse-100][sbPayComp]);
		}
		else
		{
			if(strval(tmp) > BizzInfo[bouse][bTakings])
			{
				SendClientMessage(playerid, COLOR_WHITE, "You dont have that much in your till.");
				return 1;
			}
			BizzInfo[bouse][bPayComp] = strval(tmp);
			format(string, sizeof(string), "Buying Components for $%d", BizzInfo[bouse][bPayComp]);
		}
		OnPropUpdate();
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/missionactive", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /bizfee [EntranceFee]");
		}
		MissionActive = strval(tmp);
		new sstring[256];
		format(sstring, sizeof(sstring), "MissionActive = %d",MissionActive);
		SendClientMessage(playerid, COLOR_GRAD1, sstring);
		return 1;
	}
	if(strcmp(cmd, "/bizname", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (PlayerInfo[playerid][pAdmin] < 1337)
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "   You can't own a large business");
			return 1;
		}
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /bizname [Name](dont use ,)");
		}
		if (bouse >= 100)
		{
			strmid(SBizzInfo[bouse-100][sbDiscription], result, 0, 64, 255);
			format(string, sizeof(string), "Buisness name set to %s",SBizzInfo[bouse-100][sbDiscription]);
		}
		else
		{
			strmid(BizzInfo[bouse][bDiscription], result, 0, 64, 255);
			format(string, sizeof(string), "Buisness name set to %s",BizzInfo[bouse][bDiscription]);
		}
			OnPropUpdate();
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
	}
	if(strcmp(cmd, "/bizwithdraw", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			if (bouse >= 100)
			{
				format(string, sizeof(string), "  You Have $%d in your till.", SBizzInfo[bouse-100][sbTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			else
			{
				format(string, sizeof(string), "  You Have $%d in your till.", BizzInfo[bouse][bTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /bizwithdraw [quantidade]");
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /bizwithdraw [quantidade]");
			return 1;
		}
		if (bouse >= 100)
		{
			if(cashdeposit > SBizzInfo[bouse-100][sbTakings] || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
				return 1;
			}
		}
		else
		{
			if (cashdeposit > BizzInfo[bouse][bTakings] || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
				return 1;
			}
		}
		if (bouse >= 100)
		{
			if(!PlayerToPoint(100, playerid,SBizzInfo[bouse-100][sbEntrancex],SBizzInfo[bouse-100][sbEntrancey],SBizzInfo[bouse-100][sbEntrancez]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,cashdeposit);
				SBizzInfo[bouse-100][sbTakings]=SBizzInfo[bouse-100][sbTakings]-cashdeposit;
				format(string, sizeof(string), "  You Have Withdrawn $%d from your till Total: $%d ", cashdeposit,SBizzInfo[bouse-100][sbTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
		else
		{
			if (!PlayerToPoint(100, playerid,BizzInfo[bouse][bExitx],BizzInfo[bouse][bExity],BizzInfo[bouse][bExitz]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,cashdeposit);
				BizzInfo[bouse][bTakings]=BizzInfo[bouse][bTakings]-cashdeposit;
				format(string, sizeof(string), "  You Have Withdrawn $%d from your till Total: $%d ", cashdeposit,BizzInfo[bouse][bTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
	}
	if(strcmp(cmd, "/bizbank", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			if (bouse >= 100)
			{
				format(string, sizeof(string), "  You Have $%d in your till.", SBizzInfo[bouse-100][sbTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			else
			{
				format(string, sizeof(string), "  You Have $%d in your till.", BizzInfo[bouse][bTakings]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
			}
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /bizbank [quantidade]");
			return 1;
		}
		new cashdeposit = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /bizbank [quantidade]");
			SendClientMessage(playerid, COLOR_GRAD3, string);
			return 1;
		}
		if (cashdeposit > GetPlayerMoney(playerid) || cashdeposit < 1)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
			return 1;
		}
		if (bouse >= 100)
		{
			if(!PlayerToPoint(100, playerid,SBizzInfo[bouse-100][sbEntrancex],SBizzInfo[bouse-100][sbEntrancey],SBizzInfo[bouse-100][sbEntrancez]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,-cashdeposit);
				SBizzInfo[bouse-100][sbTakings]=SBizzInfo[bouse-100][sbTakings]+cashdeposit;
				format(string, sizeof(string), "  You Have Banked $%d to your till Total: $%d ", cashdeposit,SBizzInfo[bouse-100][sbTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
		else
		{
			if (!PlayerToPoint(100, playerid,BizzInfo[bouse][bExitx],BizzInfo[bouse][bExity],BizzInfo[bouse][bExitz]))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
				return 1;
			}
			else
			{
				GivePlayerMoney(playerid,-cashdeposit);
				BizzInfo[bouse][bTakings]=BizzInfo[bouse][bTakings]+cashdeposit;
				format(string, sizeof(string), "  You Have Banked $%d to your till Total: $%d ", cashdeposit,BizzInfo[bouse][bTakings]);
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_YELLOW, string);
				return 1;
			}
		}
	}
	if(strcmp(cmd, "/bizupgrade", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse >= 100)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a large business");
			return 1;
		}
		if (PlayerInfo[playerid][pInt] != BizzInfo[bouse][bInt])
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You must be in your business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /bizupgrade [item number]");
			SendClientMessage(playerid, COLOR_GRAD2, "|_______ Home Supplys _______|");
			SendClientMessage(playerid, COLOR_GRAD3, "| 1: health Pickup $50000");
			SendClientMessage(playerid, COLOR_GRAD4, "| 2: Armour Pickup $100000");
			return 1;
		}
		new item = strval(tmp);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USO: /bizupgrade [item number]");
			SendClientMessage(playerid, COLOR_GRAD2, "|_______ Home Supplys _______|");
			SendClientMessage(playerid, COLOR_GRAD3, "| 1: health Pickup $50000");
			SendClientMessage(playerid, COLOR_GRAD4, "| 2: Armour Pickup $100000");
			return 1;
		}
		switch (item)
		{
			case 1:
			{
				if(PlayerInfo[playerid][pLevel] < 5)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 5 To Purchase This");
					return 1;
				}
				if(GetPlayerMoney(playerid) < 50000)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Don't have The Cash To Purchase This");
					return 1;
				}
				BizzInfo[bouse][bHel] = 1;
				GivePlayerMoney(playerid,-50000);
				SBizzInfo[5][sbTakings] = SBizzInfo[5][sbTakings]+50000;//heal buisness
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			}
			case 2:
			{
				if (PlayerInfo[playerid][pLevel] < 8)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 8 To Purchase This");
					return 1;
				}
				if(GetPlayerMoney(playerid) < 100000)
				{
					SendClientMessage(playerid, COLOR_GRAD5, "You Don't have The Cash To Purchase This");
					return 1;
				}
				BizzInfo[bouse][bArm] = 1;
				GivePlayerMoney(playerid,-100000);
				SBizzInfo[5][sbTakings] = SBizzInfo[5][sbTakings]+100000;//heal buisness
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			}
		}
			OnPropUpdate();
			OnPlayerUpdate(playerid);
			SendClientMessage(playerid, COLOR_GRAD5, "Your Shoppers Can Now Use /heal.");
			return 1;
	}
//----------------------------------[JOB]-----------------------------------------------

	if(strcmp(cmd, "/job", true) == 0)
	{
		if (gTeam[playerid] >= 3)
		{
			SendClientMessage(playerid, COLOR_YELLOW, objstore);
		}
		else if (gTeam[playerid] == 2)
		{
			SendClientMessage(playerid, COLOR_DBLUE, cbjstore);
		}
		return 1;
	}
//-----------------------------------[HEAL]-------------------------------------------------------------------------
	if(strcmp(cmd, "/curar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new location = PlayerInfo[playerid][pLocal];
		if(!strlen(tmp))
		{
			if(location != 255)
			{
				if(location < 99)
				{
					if(HouseInfo[location][hArm] == 1)
					{
						format(string, sizeof(string), "* %s coloca o colete.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPlayerArmour(playerid, 100);
					}
					else
					{
						format(string, sizeof(string), "Nao ha colete aqui");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					if(HouseInfo[location][hHel] == 1)
					{
						new Float:tempheal;
						GetPlayerHealth(playerid,tempheal);
						if ( tempheal < 100.0)
						{
							SetPlayerHealth(playerid,100.0);
							PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "saude: 100");
							SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
						}
						else
						{
							SendClientMessage(playerid, TEAM_GREEN_COLOR,"saude: 100");
						}
					}
					else
					{
						format(string, sizeof(string), "Esse lugar nao tem saude");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					return 1;
				}
				else
				{
					if(BizzInfo[location-99][bArm] == 1)
					{
						format(string, sizeof(string), "* %s coloca o colete.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPlayerArmour(playerid, 100);
					}
					else
					{
						format(string, sizeof(string), "Nao ha colete aqui");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					if(BizzInfo[location-99][bHel] == 1)
					{
						new Float:tempheal;
						GetPlayerHealth(playerid,tempheal);
						if ( tempheal < 100.0)
						{
							SetPlayerHealth(playerid,100.0);
							PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "saude: 100");
							SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
						}
						else
						{
							SendClientMessage(playerid, TEAM_GREEN_COLOR,"saude: 100");
						}
					}
					else
					{
						format(string, sizeof(string), "Esse lugar nao tem saude");
						SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
					}
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USO: /curar [id do jogador/Parte do nome]");
				return 1;
			}
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (giveplayerid == playerid)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode se curar!");
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if (gTeam[playerid] == TEAM_CYAN)//model
			{
					new Float:tempheal;
					GetPlayerHealth(giveplayerid,tempheal);
					if ( tempheal >= 100.0)
					{
						SendClientMessage(playerid, TEAM_GREEN_COLOR,"   Saude total.");
						return 1;
					}
					format(string, sizeof(string), "~y~Voce curou ~n~~w~%s~n~~g~$%d", giveplayer,mediccharge);
					//printf("AdmCmd: %s has jailed %s.", sendername, giveplayer);
					GivePlayerMoney(playerid,mediccharge);
					GivePlayerMoney(giveplayerid,-mediccharge);
					GameTextForPlayer(playerid, string, 5000, 1);
					SetPlayerHealth(giveplayerid,100.0);
					PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
					PlayerPlaySound(giveplayerid, 1150, 0.0, 0.0, 0.0);
					if(gTeam[giveplayerid] == TEAM_CYAN)
					{
						format(string, sizeof(string), "Voce foi curado a 100 de saude -$",mediccharge);
						SendClientMessage(giveplayerid, TEAM_GREEN_COLOR,string);
						return 1;
					}
					else
					{
						format(string, sizeof(string), "Voce foi curado a 100 de saude -$%d",mediccharge);
						SendClientMessage(giveplayerid, TEAM_GREEN_COLOR,string);
						PlayerInfo[playerid][pWA]++;
						if(PlayerInfo[playerid][pWA] >= 20)
						{
							PlayerInfo[playerid][pExp]++;
							PlayerInfo[playerid][pWA] = 0;
							SendClientMessage(playerid, COLOR_YELLOW, "Voce ganhou 1 ponto de experiencia!");
						}

					}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d nao esta online.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[ADMINADMIN]-----------------------------------------------
//----------------------------------[mole]-----------------------------------------------
	if(strcmp(cmd, "/mole", true) == 0 && PlayerInfo[playerid][pAdmin] >= 1337)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /mole [mole text]");
			return 1;
		}
		format(string, sizeof(string), "SMS: %s, Sender: MOLE (555)",result);
		if (gTeam[playerid] < 3){SendClientMessage(playerid, COLOR_YELLOW, string);}
		SendEnemyMessage(COLOR_YELLOW, string);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && gPlayerSpawned[i])
			{
				if(gTeam[i] >= 3)
				{
					RingTone[i] =20;
				}
			}
		}
		printf("MOLE: %s", result);
		return 1;
	}
//----------------------------------[HQ]-----------------------------------------------
	if(strcmp(cmd, "/hq", true) == 0 && PlayerInfo[playerid][pAdmin] >= 1337)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /hq [hq text]");
			return 1;
		}
		format(string, sizeof(string), "HQ: %s, over", result);
		if (gTeam[playerid] != 2 ){SendClientMessage(playerid, COLOR_DBLUE, string);}
		SendTeamBeepMessage(2, COLOR_DBLUE, string);
		printf("HQ: %s", result);
		return 1;
	}
//----------------------------------[RECON]-----------------------------------------------
	if(strcmp(cmd, "/escutartudo", true) == 0 && PlayerInfo[playerid][pAdmin] >= 1)
	{
		if (!BigEar[playerid])
		{
			BigEar[playerid] = 1;
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce pode escutar tudo");
		}
		else if (BigEar[playerid])
		{
			(BigEar[playerid] = 0);
			SendClientMessage(playerid, COLOR_GRAD2, "   Voce nao pode mais escutar tudo");
		}
		return 1;
	}
	if(strcmp(cmd, "/id", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /recon [playerid/PON/off]");
			return 1;
		}
		new target;
		if(IsStringAName(tmp))
		{
			target = GetPlayerID(tmp);
		}
		else
		{
			target = strval(tmp);
		}
		new sstring[256];
		GetPlayerName(target, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "ID: (%d) %s",target,giveplayer);
		SendClientMessage(playerid, COLOR_GRAD1, sstring);
		return 1;
	}
	if(strcmp(cmd, "/tv", true) == 0 || strcmp(cmd, "/recon", true) == 0)
	{
		new house;
		if(Unspec[playerid][sLocal] == 255)
		{
			house = PlayerInfo[playerid][pLocal];
		}
		else
		{
			house = Unspec[playerid][sLocal];
		}
		if(PlayerInfo[playerid][pAdmin] < 1)
		{
			if(house == 255)
			{
				GameTextForPlayer(playerid, "~r~There is no tv here", 5000, 1);
				return 1;
			}
		}
		//printf("house has tv %d",HouseInfo[house][hHealthx]);
		TVMode[playerid] = 0;
		Unspec[playerid][sCam] = 2;
		if(Spectate[playerid] == 255 && PlayerInfo[playerid][pLocal] != 255 || Spectate[playerid] == 255 && PlayerInfo[playerid][pAdmin] > 0)
		{
			GetPlayerPos(playerid, Unspec[playerid][sPx], Unspec[playerid][sPy], Unspec[playerid][sPz]);
			Unspec[playerid][sPint] = PlayerInfo[playerid][pInt];
			Unspec[playerid][sLocal] = PlayerInfo[playerid][pLocal];
			PlayerInfo[playerid][pLocal] = 255;
			gTeam[playerid] = 0;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			if(HouseInfo[house][hHealthx] != 1)
			{
				GameTextForPlayer(playerid, "~r~Upgrade nao instalado", 5000, 1);
				return 1;
			}
			TVMode[playerid] = 1;
			Spectate[playerid] = lastkiller;
			GameTextForPlayer(playerid, "~w~                Acoes na~n~                   ~b~Cidade", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("desliga", tmp, true, strlen(tmp)) == 0)
		{
			Spectate[playerid] = 253;
			GameTextForPlayer(playerid, "~w~                TV~n~~r~                desligada", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("porta", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hHealthy] != 1)
			{
				GameTextForPlayer(playerid, "~r~Tv da porta nao instalada", 5000, 1);
				return 1;
			}
			if(PlayerInfo[playerid][pLocal] == 255 && Unspec[playerid][sLocal] == 255 )
			{
				GameTextForPlayer(playerid, "~r~nao pode fazer", 5000, 1);
				return 1;
			}
			house = Unspec[playerid][sLocal];
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if(PlayerToPoint(20.0, i, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]))
					{
						Unspec[playerid][sCam] = 10;
						Spectate[playerid] = i;
						GameTextForPlayer(playerid, "~b~Tv da~r~Porta~n~~w~coloque /tv desliga~n~para desligar", 5000, 1);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						return 1;
					}
				}
			}
			if(Unspec[playerid][sCam] != 10)
			{
				GameTextForPlayer(playerid, "~w~Ninguem na porta", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
			}
			return 1;
		}
		if(strcmp("dm", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hHealthz] != 1)
			{
				GameTextForPlayer(playerid, "~r~No subscription", 5000, 1);
				return 1;
			}
			if(MissionActive != 13 || DmHiPlayer == 255)
			{
				GameTextForPlayer(playerid, "~g~No DeathMatchs~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 11;
			Spectate[playerid] = DmHiPlayer;
			GameTextForPlayer(playerid, "~r~                D~w~MTV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("race", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hArmourx] != 1)
			{
				GameTextForPlayer(playerid, "~r~No subscription", 5000, 1);
				return 1;
			}
			if(MissionActive < 4 || MissionActive > 7)
			{
				GameTextForPlayer(playerid, "~g~No Races~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 21;
			RaceSpec(playerid);
			GameTextForPlayer(playerid, "~w~                S~b~R~n~~r~                TV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("pen", tmp, true, strlen(tmp)) == 0)
		{
			if(HouseInfo[house][hArmoury] != 1)
			{
				GameTextForPlayer(playerid, "~r~No subscription", 5000, 1);
				return 1;
			}
			if(gPublicEnemy == 255)
			{
				GameTextForPlayer(playerid, "~g~No Public Enemys~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 31;
			PenDelay(playerid);
			GameTextForPlayer(playerid, "~p~                PEN~n~                ~w~TV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("speed", tmp, true, strlen(tmp)) == 0)
		{
			if(Speeder == 255)
			{
				GameTextForPlayer(playerid, "~g~No Speeders ~n~~w~On TV now", 5000, 1);
				PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				return 1;
			}
			TVMode[playerid] = 41;
			SpeedDelay(playerid);
			GameTextForPlayer(playerid, "~y~                Speed~n~                ~w~TV", 5000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			return 1;
		}
		if(strcmp("foot", tmp, true, strlen(tmp)) == 0 && PlayerInfo[playerid][pAdmin] >= 1)
		{
			Spectate[playerid] = lastkiller;
		}
		if(strcmp("prox", tmp, true, strlen(tmp)) == 0 && PlayerInfo[playerid][pAdmin] >= 1)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if(i > Spectate[playerid] && Spectate[playerid] != 255 && PlayerInfo[i][pLevel] <= 2)
					{
						new Float:health;
						GetPlayerHealth(i, health);
						Spectate[playerid] = i;
						new sstring[256];
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						new cash =  GetPlayerMoney(i);
						format(sstring, sizeof(sstring), "TVAdmin: (%d) %s $%d H:%.1f ",i,giveplayer,cash,health);
						SendClientMessage(playerid, COLOR_GREEN, sstring);
						return 1;
					}
				}
			}
		}
		if(strcmp("ante", tmp, true, strlen(tmp)) == 0 && PlayerInfo[playerid][pAdmin] >= 1)
		{
			for(new i = MAX_PLAYERS; i >= 0; i--)
			{
				if(IsPlayerConnected(i) && gPlayerSpawned[i])
				{
					if(i < Spectate[playerid] && Spectate[playerid] != 255 && PlayerInfo[i][pLevel] <= 2)
					{
						new Float:health;
						GetPlayerHealth(i, health);
						Spectate[playerid] = i;
						new sstring[256];
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
						new cash =  GetPlayerMoney(i);
						format(sstring, sizeof(sstring), "TVAdmin: (%d) %s $%d H:%.1f",i,giveplayer,cash,health);
						SendClientMessage(playerid, COLOR_GREEN, sstring);
						return 1;
					}
				}
			}
		}
		if(house == 255)
		{
			if(PlayerInfo[playerid][pAdmin] < 1)
			{
				GameTextForPlayer(playerid, "~r~Upgrade nao instalado", 5000, 1);
				return 1;
			}
		}
		else
		{
			if(HouseInfo[house][hArmourz] != 1 && PlayerInfo[playerid][pAdmin] < 1)
			{
				GameTextForPlayer(playerid, "~r~Upgrade nao instalado", 5000, 1);
				return 1;
			}
		}
		if(IsStringAName(tmp))
		{
			Spectate[playerid] = GetPlayerID(tmp);
		}
		else
		{
			Spectate[playerid] = strval(tmp);
		}
		if(IsPlayerConnected(Spectate[playerid]))
		{
			if(Hidden[Spectate[playerid]] != 1 && PlayerInfo[playerid][pAdmin] < 1)
			{
				SendClientMessage(playerid, COLOR_GREEN, "Target is masked");
			}
			new Float:health;
			GetPlayerHealth(Spectate[playerid], health);
			new sstring[256];
			GetPlayerName(Spectate[playerid], giveplayer, sizeof(giveplayer));
			new cash =  GetPlayerMoney(Spectate[playerid]);
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
			{
				format(sstring, sizeof(sstring), "TVAdmin: (%d) %s $%d H:%.0f",Spectate[playerid],giveplayer,cash,health);
			}
			else
			{
				format(sstring, sizeof(sstring), "UAV: (%d) %s",Spectate[playerid],giveplayer);
			}
			SendClientMessage(playerid, COLOR_GREEN, sstring);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREEN, "Alvo nao localizado");
		}
		return 1;
	}
//----------------------------------[SPAWN]-----------------------------------------------

	if(strcmp(cmd, "/spawn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerRandomSpawn(playerid);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/spawn2", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SpawnPlayer(playerid);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/spawn3", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			OnPlayerSpawn(playerid);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/pen", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerCriminal(playerid,255, "Armed Robbery",1,1);
			gPlayerMission[playerid] = 1;
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[PAYDAY]-----------------------------------------------

	if(strcmp(cmd, "/payday", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			PayDay();
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/incmis", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			gRaceLeader=1;
			gFightLeader=1;
			SendClientMessage(playerid, COLOR_GRAD1, "Playercount Incrementeted");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[TEST]-----------------------------------------------

	if(strcmp(cmd, "/test", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			new sstring[256];
			new playambu = GetPlayerVehicleID(playerid);
			format(sstring, sizeof(sstring), "currentpickups = %d gFighters = %d gFightLeader = %d dmtimer = %d DmHiScore = %d",pickups ,gFighters ,gFightLeader,dmtimer,DmHiScore);
			SendClientMessage(playerid, COLOR_GRAD1, sstring);
			format(sstring, sizeof(sstring), "currentcar = %d locked[%d] stealcar = %d stealcardest = %d MissionActive = %d",playambu,gCarLock[playambu],stealcar,stealcardest,MissionActive);
			SendClientMessage(playerid, COLOR_GRAD1, sstring);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/patch", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
				SBizzInfo[0][sbPayComp] = 10000;
				SBizzInfo[1][sbPayComp] = 11000;
				SBizzInfo[2][sbPayComp] = 12000;
				SBizzInfo[3][sbPayComp] = 10000;
				SBizzInfo[4][sbPayComp] = 11000;
				SBizzInfo[5][sbPayComp] = 12000;
				SBizzInfo[6][sbPayComp] = 10000;
				SBizzInfo[7][sbPayComp] = 10000;
				SBizzInfo[8][sbPayComp] = 10000;
				SBizzInfo[9][sbPayComp] = 10000;
				SBizzInfo[10][sbPayComp] = 10000;

				BizzInfo[0][bPayComp] = 12000;
				BizzInfo[1][bPayComp] = 10000;
				BizzInfo[2][bPayComp] = 11000;
				BizzInfo[3][bPayComp] = 10000;
				BizzInfo[4][bPayComp] = 12000;
				BizzInfo[5][bPayComp] = 12000;
				BizzInfo[6][bPayComp] = 10000;
				BizzInfo[7][bPayComp] = 11000;
				BizzInfo[8][bPayComp] = 10000;
				BizzInfo[9][bPayComp] = 12000;
				BizzInfo[10][bPayComp] = 10000;
				BizzInfo[11][bPayComp] = 10020;
				BizzInfo[12][bPayComp] = 10010;
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[TEST]-----------------------------------------------
	if(strcmp(cmd, "/testcam", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
					new Float:plx,Float:ply,Float:plz;
					new Float:clx,Float:cly,Float:clz;
						GetPlayerPos(playerid, plx, ply, plz);
						clx = plx;
						cly = ply+2;
						clz = plz+0.2;
						plz = plz+0.6;
						SetPlayerFacingAngle(playerid, 0.0);
						SetPlayerCameraPos(playerid,clx, cly, clz);
						SetPlayerCameraLookAt(playerid,plx, ply, plz);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/prop", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			LoadProperty();
			LoadBizz();
			LoadSBizz();
			SendClientMessage(playerid, COLOR_GRAD1, "   Property Reloaded");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/tmppos", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			LoadTmp();
			SendClientMessage(playerid, COLOR_GRAD1, "   TmpPos Reloaded");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[UNCON]-----------------------------------------------

	if(strcmp(cmd, "/uncon", true) == 0)
	{

		SetCamBack(playerid);
		return 1;
	}

//----------------------------------[AdminChat]-----------------------------------------------
	if(strcmp(cmd, "/admin", true) == 0 || strcmp(cmd, "/a", true) == 0)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: (/a)dmin [admin chat]");
			return 1;
		}
		format(string, sizeof(string), "*Admin %s: %s", sendername, result);
		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			SendAdminMessage(COLOR_YELLOW, string);
		}
		printf("Admin %s: %s", sendername, result);
		return 1;
	}
//-------------------------------[Logout]--------------------------------------------------------------------------
	if (strcmp(cmd, "/logout", true) ==0 )
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			OnPlayerUpdate(playerid);
			gPlayerLogged[playerid] = 0;
			SendClientMessage(playerid, COLOR_GRAD1, "   It is now safe to quit.");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	}
	if (strcmp(cmd, "/logoutpl", true) ==0 )
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /logoutpl [id do jogador/Parte do nome]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			OnPlayerUpdate(giveplayerid);
			gPlayerLogged[giveplayerid] = 0;
			SendClientMessage(playerid, COLOR_GRAD1, "   player was logged out.");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	}
//-------------------------------[Logoutall]--------------------------------------------------------------------------
	if (strcmp(cmd, "/logoutall", true) ==0 )
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					OnPlayerUpdate(i);
					gPlayerLogged[i] = 0;
				}
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   All Players Logged out.");
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	}
//--------------------------------------------------------------------------------------
//----------------------------------[cnn]-----------------------------------------------
	if(strcmp(cmd, "/cnn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USO: /cnn [cnn textformat ~n~=Newline ~r~=Red ~g~=Green ~b~=Blue ~w~=White ~y~=Yellow]");
				return 1;
			}
			format(string, sizeof(string), "~b~%s: ~w~%s",sendername,result);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					GameTextForPlayer(i, string, 5000, 6);
				}
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	}
	if(strcmp(cmd, "/cnnn", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			new txtid;
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USO: /cnnn <type> ");
				return 1;
			}
			txtid = strval(tmp);
			if(txtid == 2)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "You can not select 2");
				return 1;
			}
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USO: /cnnn <type> [cnnc textformat ~n~=Newline ~r~=Red ~g~=Green ~b~=Blue ~w~=White ~y~=Yellow]");
				return 1;
			}
			format(string, sizeof(string), "%s",result);
			for(new i = 0; i <= MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i) == 1)
				{
					GameTextForPlayer(i, string, 5000, txtid);
				}
			}
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	}
//[ADMIN]______________________________________________________________________________
//-----------------------------------[JAIL]-------------------------------------------------------------------------
	if(strcmp(cmd, "/ajail", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /ajail [id do jogador/Parte do nome] [seconds]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
			//printf("stringnameid %d",giveplayerid);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /ajail [id do jogador/Parte do nome] [seconds]");
			return 1;
		}
		new time = strval(tmp);

		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
			{
				SetPlayerInterior(giveplayerid,6);
				PlayerInfo[giveplayerid][pInt] = 6;
                SetPlayerPos(giveplayerid,264.395200,77.564040,1001.039000);
				format(string, sizeof(string), "   You have sent %s(player: %d) to jail.", giveplayer,giveplayerid);
				//printf("AdmCmd: %s has jailed %s.", sendername, giveplayer);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				SendClientMessage(giveplayerid, COLOR_GRAD1,"   Voce foi preso.");
				PlayJailSound(1153 , 1154, 2000,264.395200, 77.564040, 1001.039000);
				JailTime[giveplayerid] = time+10;
				//TogglePlayerControllable(giveplayerid, 0);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d nao esta online.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/prender", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /prender id");
			return 1;
		}
		giveplayerid = strval(tmp);
		if(JailTime[giveplayerid] > 0 || gTeam[giveplayerid] != 4)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   Essa pessoa nao pode ser presa agora.");
			printf("JailTime[giveplayerid](%d) gTeam[giveplayerid](%d)",JailTime[giveplayerid],gTeam[giveplayerid]);
			return 1;
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if (gTeam[playerid] == TEAM_BLUE)
			{
				if (TestDistance(playerid,giveplayerid,264.395200,77.564040,1001.039000,7))
				{
					//print("DEBUG Distancetested");
					new slice = ((PlayerInfo[giveplayerid][pLevel]*deathcost)+(1000)); //1k +your level
					SetPlayerPos(giveplayerid,264.395200,77.564040,1001.039000);
					GivePlayerMoney(playerid, slice);
					GivePlayerMoney(giveplayerid, -slice);
					PlayJailSound(1165 , 1166, 2000,264.395200, 77.564040, 1001.039000);
					format(string, sizeof(string), "~r~Suspeito ~w~Detido~n~Ganhou ~g~$%d", slice);
					GameTextForPlayer(playerid, string, 5000, 1);
					format(string, sizeof(string), "~r~Preso!~n~~w~Voce pagou a fianca de: ~n~~r~$%d", -slice);
					GameTextForPlayer(giveplayerid, string, 5000, 1);
					PlayerPlayMusic(playerid);
					JailTime[giveplayerid] = jailtime;
					SetPlayerFree(giveplayerid,playerid,"Sentenca de prisao",0,0);
					if(FlashTime[giveplayerid] == 0){FlashTime[giveplayerid] = 10;}
					//TogglePlayerControllable(giveplayerid, 0);
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   Voce esta longe da cela de prisao!");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d nao esta online.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[UNJAIL]-----------------------------------------------
	if(strcmp(cmd, "/livrar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /livrar [id do jogador/Parte do nome]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
			{
				SetPlayerInterior(giveplayerid,6);
				PlayerInfo[playerid][pInt] = 6;
                SetPlayerPos(giveplayerid,268.3,77.4,1001.0);
				format(string, sizeof(string), "   Voce libertou %s(player: %d) da prisao.", giveplayer,giveplayerid);
				//printf("AdmCmd: %s has jailed %s.", sendername, giveplayer);
				SendClientMessage(playerid, COLOR_GRAD1, string);
				SetPlayerWeapons(playerid);
				SendClientMessage(giveplayerid, COLOR_GRAD1,"   Pagou o seu debito com a sociedade");
				PlayJailSound(1165 , 1166, 2000,264.395200, 77.564040, 1001.039000);
				JailTime[giveplayerid] = 10;
				//TogglePlayerControllable(giveplayerid, 0);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d nao esta online.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
//----------------------------------[TOD]-----------------------------------------------

	if(strcmp(cmd, "/tod", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /tod [timeofday] (0-23)");
			return 1;
		}
		new hour;
		hour = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
            SetWorldTime(hour);
			format(string, sizeof(string), "   Horas %d.", hour);
			BroadCast(COLOR_GRAD1, string);
		}
		/*
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		*/
		return 1;
	}
//-----------------------------------editstat---------------------------------------
	if(strcmp(cmd, "/setstat", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /setstat [id do jogador/Parte do nome] [statcode] [quantidade]");
			SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints |4 Model ");
			SendClientMessage(playerid, COLOR_GRAD3, "|5 BankAccount |6 PhoneNumber |7 ExpPoints ");
			SendClientMessage(playerid, COLOR_GRAD2, "|8 HouseKey |9 BizKey |10 CB |11 HW |12 SR |13 WA |14 PEN");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /setstat [id do jogador/Parte do nome] [statcode] [quantidade]");
			SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints");
			SendClientMessage(playerid, COLOR_GRAD3, "|4 Model |5 BankAccount |6 PhoneNumber");
			SendClientMessage(playerid, COLOR_GRAD2, "|7 ExpPoints |8 HouseKey |9 BizKey");
			return 1;
		}
		new stat;
		stat = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /setstat [id do jogador/Parte do nome] [statcode] [quantidade]");
			SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints");
			SendClientMessage(playerid, COLOR_GRAD3, "|4 Model |5 BankAccount |6 PhoneNumber");
			SendClientMessage(playerid, COLOR_GRAD2, "|7 ExpPoints |8 HouseKey |9 BizKey");
			return 1;
		}
		new amount;
		amount = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			switch (stat)
			{
				case 1:
				{
					PlayerInfo[giveplayerid][pLevel] = amount;
					format(string, sizeof(string), "   The Player Was Set To Level %d", amount);
				}
				case 2:
				{
					PlayerInfo[giveplayerid][pSHealth] = amount;
					format(string, sizeof(string), "   The Player Was Set To %d Spawnhealth ", amount);
				}
				case 3:
				{
					PlayerInfo[giveplayerid][gPupgrade] = amount;
					format(string, sizeof(string), "   The Player Was Set To %d Upgrade Points", amount);
				}
				case 4:
				{
					PlayerInfo[giveplayerid][pModel] = amount;
					format(string, sizeof(string), "   The Player Was Set To Model %d", amount);
				}
				case 5:
				{
					PlayerInfo[giveplayerid][pAccount] = amount;
					format(string, sizeof(string), "   The Player Account Was Set To $%d", amount);
				}
				case 6:
				{
					PlayerInfo[giveplayerid][pPnumber] = amount;
					format(string, sizeof(string), "   The Player Phone Number Was Set To %d", amount);
				}
				case 7:
				{
					PlayerInfo[giveplayerid][pExp] = amount;
					format(string, sizeof(string), "   The Player Exp Points Were Set To %d", amount);
				}
				case 8:
				{
					PlayerInfo[giveplayerid][pPhousekey] = amount;
					format(string, sizeof(string), "   The Player House Key Was Set To %d", amount);
				}
				case 9:
				{
					PlayerInfo[giveplayerid][pPbiskey] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 10:
				{
					PlayerInfo[giveplayerid][pCB] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 11:
				{
					PlayerInfo[giveplayerid][pHW] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 12:
				{
					PlayerInfo[giveplayerid][pSR] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 13:
				{
					PlayerInfo[giveplayerid][pWA] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				case 14:
				{
					PlayerInfo[giveplayerid][pPEN] = amount;
					format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
				}
				default:
				{
					format(string, sizeof(string), "   Invalid Stat Code", amount);
				}

			}
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[SETINT]-----------------------------------------------
	if(strcmp(cmd, "/setint", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /setint [interiorid]");
			return 1;
		}
		new intid;
		intid = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			SetPlayerInterior(playerid,intid);
			PlayerInfo[playerid][pInt] = intid;
			format(string, sizeof(string), "   interiorid %d.", intid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[SKYDIVE]------------------------------------------------
	if(strcmp(cmd, "/superpulo", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			GetPlayerPos(playerid, rx, ry, rz);
			if (IsPlayerConnected(playerid))
			{
				GivePlayerWeapon(playerid, 46, 0);
				SetPlayerPos(playerid,rx, ry, rz+2500);
				SendClientMessage(playerid, COLOR_WHITE, "Woohaa!! Vamos La!");
				GameTextForPlayer(playerid, "~y~Wooohaa! ~r~:~b~D", 5000, 1);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[FOURDIVE]------------------------------------------------
	if(strcmp(cmd, "/fourdive", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /fourdive [playerid1] [playerid2] [playerid3] [playerid4]");
			return 1;
		}
		new para1;
		new para2;
		new para3;
		new para4;
		para1 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		para2 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		para3 = strval(tmp);
		tmp = strtok(cmdtext, idx);
		para4 = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			if (IsPlayerConnected(para1)){ GivePlayerWeapon(para1, 46, 0); SetPlayerPos(para1,1536.0, -1360.0, 1350.0);SetPlayerInterior(para1,0);PlayerInfo[para1][pInt] = 0;SendClientMessage(para1, COLOR_WHITE, "GO!! GO!! GO!!");}
			if ((IsPlayerConnected(para2)) && (para2>0)) { GivePlayerWeapon(para2, 46, 0); SetPlayerPos(para2,1536.0, -1345.0, 1350.0);SetPlayerInterior(para2,0);PlayerInfo[para2][pInt] = 0;SendClientMessage(para2, COLOR_RED, "GO!! GO!! GO!!");}
			if ((IsPlayerConnected(para3)) && (para3>0)) { GivePlayerWeapon(para3, 46, 0); SetPlayerPos(para3,1552.0, -1345.0, 1350.0);SetPlayerInterior(para3,0);PlayerInfo[para3][pInt] = 0;SendClientMessage(para3, COLOR_RED, "GO!! GO!! GO!!");}
			if ((IsPlayerConnected(para4)) && (para4>0)) { GivePlayerWeapon(para4, 46, 0); SetPlayerPos(para4,1552.0, -1360.0, 1350.0);SetPlayerInterior(para4,0);PlayerInfo[para4][pInt] = 0;SendClientMessage(para4, COLOR_RED, "GO!! GO!! GO!!");}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[MAKEADMIN]------------------------------------------------
	if(strcmp(cmd, "/makeadmin", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /makeadmin [id do jogador/Parte do nome] [level(1-3)]");
			return 1;
		}
		new para1;
		new level;
		if(IsStringAName(tmp))
		{
			para1 = GetPlayerID(tmp);
		}
		else
		{
			para1 = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		level = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GetPlayerName(para1, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			PlayerInfo[para1][pAdmin] = level;
			printf("AdmCmd: %s has promoted %s to a level %d admin.", sendername, giveplayer, level);
			format(string, sizeof(string), "   You have been promoted to a level %d admin by %s", level, sendername);
			SendClientMessage(para1, COLOR_GRAD1, string);
			format(string, sizeof(string), "   You have promoted %s to a level %d admin.", giveplayer,level);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[setteam]------------------------------------------------
	if(strcmp(cmd, "/setteam", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /setteam [id do jogador/Parte do nome] [team 1(civ) - 2(cop)]");
			return 1;
		}
		new para1;
		new level;
		if(IsStringAName(tmp))
		{
			para1 = GetPlayerID(tmp);
		}
		else
		{
			para1 = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		level = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			GetPlayerName(para1, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			PlayerInfo[para1][pTeam] = level;
			//OnPlayerUpdate(para1);
			gTeam[para1] = level;
			SetPlayerWeapons(para1);
			SetPlayerRandomSpawn(para1);
			//gPlayerSpawned[para1] = 0;
			//OnPlayerSpawn(para1);
			ClearCrime(para1);
			if (gPublicEnemy == para1)
			{
				gPublicEnemy = INVALID_PLAYER_ID;
				KillTimer(offhook);
	    	}
			printf("AdmCmd: %s has switched %s to team %d.", sendername, giveplayer, level);
			format(string, sizeof(string), "   You have been switched to team %d by %s", level, sendername);
			SendClientMessage(para1, COLOR_GRAD1, string);
			format(string, sizeof(string), "   You have switched %s to team %d.", giveplayer,level);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/jointeam", true) == 0)
	{
        new sbiz;
		if (PlayerToPoint(3, playerid,SBizzInfo[11][sbEntrancex], SBizzInfo[11][sbEntrancey], SBizzInfo[11][sbEntrancez]))
		{
			sbiz = 11;
		}
		else if (PlayerToPoint(3, playerid,SBizzInfo[12][sbEntrancex], SBizzInfo[12][sbEntrancey], SBizzInfo[12][sbEntrancez]))
		{
			sbiz = 12;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "You are not close to a team store");
			return 1;
		}
		if(GetPlayerMoney(playerid) < SBizzInfo[sbiz][sbEntcost] || (SBizzInfo[sbiz][sbEntcost] > 20000 && PlayerInfo[playerid][pLevel] < 3))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Voce nao tem dinheiro suficiente");
			return 1;
		}
		if(SBizzInfo[sbiz][sbLock] == 1)
		{
			GameTextForPlayer(playerid, "~r~Fechado", 5000, 1);
			return 1;
		}
		if(SBizzInfo[sbiz][sbProd] == 0)
		{
			GameTextForPlayer(playerid, "~r~Fora de Estoque:", 5000, 1);
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /jointeam [team 1(medic) - 2(cop)]");
			return 1;
		}
		new level = strval(tmp);
		if (level > 0 && level < 12)
		{
			if (gPublicEnemy == playerid)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "You cant change team now");
				return 1;
	    	}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			PlayerInfo[playerid][pTeam] = level;
			gTeam[playerid] = level;
			ClearCrime(playerid);
			SetPlayerToTeamColor(playerid);
			format(string, sizeof(string), "%s, You have been switched to team %d", sendername, level);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			GivePlayerMoney(playerid,-SBizzInfo[sbiz][sbEntcost]);
			SBizzInfo[sbiz][sbProd]--;
			SBizzInfo[sbiz][sbTakings] = SBizzInfo[sbiz][sbTakings]+SBizzInfo[sbiz][sbEntcost];
			new dood[MAX_PLAYER_NAME];
			GetPlayerName(playerid, dood, sizeof(dood));
			format(string, sizeof(string), "%s payed $%d to enter sbiz %d", dood, SBizzInfo[sbiz][sbEntcost], sbiz);
			printf("%s", string);
			PayLog(string);
			OnPropUpdate();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "There is no team for that number");
		}
		return 1;
	}
//----------------------------------[GOTO]-----------------------------------------------
	if(strcmp(cmd, "/irls", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1529.6,-1691.2,13.3);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1529.6,-1691.2,13.3);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce teleportou");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if(strcmp(cmd, "/policial", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -2244.33,2382.59,5.06);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -2244.33,2382.59,5.06);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   Bem vindo policial");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if (strcmp(cmd, "/algemar", true) == 0 || strcmp(cmd, "/al", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /al [id do jogador]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		if(PlayerInfo[playa][pAdmin] > 0)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Nao pode ser congelado");
			return 1;
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			TogglePlayerControllable(playa, 0);
			format(string, sizeof(string), "Policial: %s algema %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "** %s foi algemado por %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	
	if (strcmp(cmd, "/soltar", true) == 0 || strcmp(cmd, "/so", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /soltar [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			TogglePlayerControllable(playa, 1);
			format(string, sizeof(string), "%s solta %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "%s foi solto por %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	
	if(strcmp(cmd, "/irlv", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1699.2, 1435.1, 10.7);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1699.2,1435.1, 10.7);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce teleportou");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if(strcmp(cmd, "/irsf", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1417.0,-295.8,14.1);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1417.0,-295.8,14.1);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce teleportou");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if(strcmp(cmd, "/entercar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /entercar [carid]");
			return 1;
		}
		new testcar = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			PutPlayerInVehicle(playerid, testcar, 1);
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce teleportou");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if(strcmp(cmd, "/irparaocarro", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /irparaocarro [carid]");
			return 1;
		}
		new testcar = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			new Float:cwx2,Float:cwy2,Float:cwz2;
			GetVehiclePos(testcar, cwx2, cwy2, cwz2);
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, cwx2, cwy2, cwz2);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, cwx2, cwy2, cwz2);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce teleportou");
			SetPlayerInterior(playerid,0);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if(strcmp(cmd, "/marcar", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			GetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
			SendClientMessage(playerid, COLOR_GRAD1, "   destino escolhido");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if(strcmp(cmd, "/irparamarca", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
				TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
			}
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce teleportou");
			SetPlayerInterior(playerid,0);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
	return 1;
	}
	if(strcmp(cmd, "/ir", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /ir [id do jogador/Parte do nome]");
			return 1;
		}
			new Float:plocx,Float:plocy,Float:plocz;
			new plo;
		if(IsStringAName(tmp))
		{
			plo = GetPlayerID(tmp);
		}
		else
		{
			plo = strval(tmp);
		}
			if (IsPlayerConnected(plo))
			{
				if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
				{
					if(Spectate[playerid] != 255)
					{
						Spectate[playerid] = 256;
					}
					GetPlayerPos(plo, plocx, plocy, plocz);
					if(PlayerInfo[plo][pInt] > 0)
					{
						SetPlayerInterior(playerid,PlayerInfo[plo][pInt]);
						PlayerInfo[playerid][pInt] = PlayerInfo[plo][pInt];
						PlayerInfo[playerid][pLocal] = PlayerInfo[plo][pLocal];
					}
					if(PlayerInfo[playerid][pInt] == 0)
					{
						SetPlayerInterior(playerid,0);
					}
					if(plocz > 530.0 && PlayerInfo[plo][pInt] == 0) //the highest land point in sa = 526.8
					{
						SetPlayerInterior(playerid,1);
						PlayerInfo[playerid][pInt] = 1;
					}
					if (GetPlayerState(playerid) == 2)
					{
						new tmpcar = GetPlayerVehicleID(playerid);
						SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
						TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
					}
					else
					{
						SetPlayerPos(playerid,plocx,plocy+2, plocz);
					}
					SendClientMessage(playerid, COLOR_GRAD1, "   Voce teleportou");
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
				}
			}
			else
			{
				format(string, sizeof(string), "   %d nao esta online.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		return 1;
	}
//----------------------------------[GETHERE]-----------------------------------------------
	if(strcmp(cmd, "/trazer", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /trazer [id do jogador/Parte do nome]");
			return 1;
		}
			new Float:plocx,Float:plocy,Float:plocz;
			new plo;
			if(IsStringAName(tmp))
			{
				plo = GetPlayerID(tmp);
			}
			else
			{
				plo = strval(tmp);
			}
			if (IsPlayerConnected(plo))
			{
				if ((IsPlayerAdmin(plo)) || PlayerInfo[plo][pAdmin] > 1337)
				{
					SendClientMessage(playerid, COLOR_GRAD1, "Pergunte ele para ir ate voce.");
					return 1;
				}
				if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
				{
					GetPlayerPos(playerid, plocx, plocy, plocz);
					if(PlayerInfo[playerid][pInt] > 0)
					{
						SetPlayerInterior(plo,PlayerInfo[playerid][pInt]);
						PlayerInfo[plo][pInt] = PlayerInfo[playerid][pInt];
						PlayerInfo[plo][pLocal] = PlayerInfo[playerid][pLocal];
					}
					if(PlayerInfo[playerid][pInt] == 0)
					{
						SetPlayerInterior(plo,0);
					}
					if(plocz > 930.0 && PlayerInfo[playerid][pInt] == 0) //the highest land point in sa = 526.8
					{
						SetPlayerInterior(plo,1);
						PlayerInfo[plo][pInt] = 1;
					}
					if (GetPlayerState(plo) == 2)
					{
						TelePos[plo][0] = 0.0;
						TelePos[plo][1] = 0.0;
						new tmpcar = GetPlayerVehicleID(plo);
						SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
					}
					else
					{
						SetPlayerPos(plo,plocx,plocy+2, plocz);
					}
					SendClientMessage(plo, COLOR_GRAD1, "   Voce teleportou");
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
				}
			}
			else
			{
				format(string, sizeof(string), "   %d nao esta online.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		return 1;
	}
	if(strcmp(cmd, "/pegarcarro", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /pegarcarro [carro id]");
			return 1;
		}
		new Float:plocx,Float:plocy,Float:plocz;
		new plo;
		plo = strval(tmp);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GetPlayerPos(playerid, plocx, plocy, plocz);
			SetVehiclePos(plo,plocx,plocy+4, plocz);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[GiveGun]------------------------------------------------
	if(strcmp(cmd, "/dararma", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /givegun [id do jogador/Parte do nome] [weaponid(eg. 46 = Parachute)] [ammo]");
			//SendClientMessage(playerid, COLOR_RED, "Alerta: Invalid WeaponID's will crash the server");
			return 1;
		}
		new playa;
		new gun;
		new ammo;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		gun = strval(tmp);
		tmp = strtok(cmdtext, idx);
		ammo = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GivePlayerWeapon(playa, gun, ammo);
			printf("AdmCmd: %s deu arma para o %s arma %d",sendername,  giveplayer, gun);

		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[GiveHealth]------------------------------------------------
	if(strcmp(cmd, "/darsaude", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /givehealth [id do jogador/Parte do nome] [health]");
			return 1;
		}
		new playa;
		new health;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		health = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerHealth(playa, health);
			printf("AdmCmd: %s deu para o %s %d de saude",sendername,  giveplayer, health);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[GiveHealth]------------------------------------------------
	if(strcmp(cmd, "/vercheat", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /givehealth [id do jogador/Parte do nome] [health]");
			return 1;
		}
		new playa;
		new Float:oldhealth;
		new Float:newhealth;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		GetPlayerHealth(playerid, oldhealth);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SetPlayerHealth(playa, 10.0);
			GetPlayerHealth(playa, newhealth);
			if(newhealth != 10.0)
			{
			    format(string, sizeof(string), "Cheat no jogador %s encontrado.",giveplayer);
				SendAdminMessage(COLOR_RED, string);
				printf("AdmCmd: cheat encontrado");
			}
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[GiveMoney]------------------------------------------------
	if(strcmp(cmd, "/setgrana", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /givemoney [id do jogador/Parte do nome] [money]");
			return 1;
		}
		new playa;
		new money;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		money = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			ResetPlayerMoney(playa);
			GivePlayerMoney(playa, money);
			printf("AdmCmd: %s setou %s para $%d",sendername,  giveplayer, money);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
 	if(strcmp(cmd, "/dargrana", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /givemoney [id do jogador/Parte do nome] [money]");
			return 1;
		}
		new playa;
		new money;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		money = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GivePlayerMoney(playa, money);
			printf("AdmCmd: %s deu %s para $%d",sendername,  giveplayer, money);
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//-----------------------------------[Slap]-----------------------------------------------
	if(strcmp(cmd, "/tapa", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /tapa [id do jogador/Parte do nome]");
			return 1;
		}
		new playa;
		new Float:shealth;
		new Float:slx, Float:sly, Float:slz;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >=1)
		{
			GetPlayerHealth(playa, shealth);
			SetPlayerHealth(playa, shealth-5);
			GetPlayerPos(playa, slx, sly, slz);
			SetPlayerPos(playa, slx, sly, slz+5);
			PlaySoundAll(playa, 1130, slx, sly, slz+5);
			printf("AdmCmd: %s slapped %s",sendername,  giveplayer);
			format(string, sizeof(string), "AdmCmd: %s levou um tapa do %s",giveplayer ,sendername);
			SendAdminMessage(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[Slap]------------------------------------------------
	if(strcmp(cmd, "/stapa", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /stapa [id do jogador/Parte do nome]");
			return 1;
		}
		new playa;
		new Float:shealth;
		new Float:slx, Float:sly, Float:slz;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GetPlayerHealth(playa, shealth);
			SetPlayerHealth(playa, shealth-5);
			GetPlayerPos(playa, slx, sly, slz);
			SetPlayerPos(playa, slx, sly, slz+5);
			PlaySoundAll(playa, 1130, slx, sly, slz+5);
			
			format(string, sizeof(string), "AdmCmd: %s silenciosamente estapeia %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s foi silenciosamente estapeado",giveplayer);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if(strcmp(cmd, "/silenciar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /silenciar [id do jogador/Parte do nome]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			if(Mute[playa] == 0)
			{
				Mute[playa] = 1;
				printf("AdmCmd: %s silenced %s",sendername,  giveplayer);
				format(string, sizeof(string), "AdmCmd: %s foi silenciado por %s",giveplayer ,sendername);
				SendAdminMessage(COLOR_RED, string);
			}
			else
			{
				Mute[playa] = 0;
				printf("AdmCmd: %s unsilenced %s",sendername,  giveplayer);
				format(string, sizeof(string), "AdmCmd: %s foi dessilenciado por %s",giveplayer ,sendername);
				SendAdminMessage(COLOR_RED, string);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[Slap]------------------------------------------------
	if(strcmp(cmd, "/ss", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /ss [id do jogador/Parte do nome]");
			return 1;
		}
		new playa;
		new Float:shealth;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			GetPlayerHealth(playa, shealth);
			format(string, sizeof(string), "AdmCmd: %s has %.2f health",giveplayer ,shealth);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			printf(string);
			SetPlayerHealth(playa, shealth-40);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[Slap]------------------------------------------------
	if(strcmp(cmd, "/sc", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /sc [id do jogador/Parte do nome]");
			return 1;
		}
		new playa;
		new Float:shealth;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			GetPlayerHealth(playa, shealth);
			format(string, sizeof(string), "AdmCmd: %s has %f health",giveplayer ,shealth);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			printf(string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[Kick]------------------------------------------------
	if(strcmp(cmd, "/kick", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /kick [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			Kick(playa);
			format(string, sizeof(string), "AdmCmd: %s kick: %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s kickado por: %s",giveplayer ,sendername);
			SendAdminMessage(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[Freeze]------------------------------------------------
	if(strcmp(cmd, "/sf", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /sf [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			TogglePlayerControllable(playa, 0);
			format(string, sizeof(string), "AdmCmd: %s SFreezes %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "AdmCmd: %s was SFrozen",giveplayer);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[Thaw]------------------------------------------------
	if(strcmp(cmd, "/descongelar", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /descongelar [playerid]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1)
		{
			TogglePlayerControllable(playa, 1);
			format(string, sizeof(string), "%s solta %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "%s foi solto por %s",giveplayer ,sendername);
			SendClientMessageToAll(COLOR_RED, string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}

//----------------------------------[Ban]------------------------------------------------
	if(strcmp(cmd, "/ban", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /ban [playerid]");
			return 1;
		}
		new playa = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1338)
		{
			format(string, sizeof(string), "%s baniu %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "%s foi banido por %s",giveplayer ,sendername);
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			SendAdminMessage(COLOR_RED, string);
			Ban(playa);
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			format(string, sizeof(string), "%s baniu %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "%s foi banido por %s",giveplayer ,sendername);
			SendAdminMessage(COLOR_RED, string);
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			Ban(playa);
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			if(PlayerInfo[playa][pLevel] > 2)
			{
				format(string, sizeof(string), "%s esta no nivel %d",playa,  PlayerInfo[playa][pLevel]);
				SendClientMessage(playerid,COLOR_RED, string);
				return 1;
			}
			format(string, sizeof(string), "%s baniu %s",sendername,  giveplayer);
			printf("%s",string);
			format(string, sizeof(string), "%s foi banido por %s",giveplayer ,sendername);
			SendAdminMessage(COLOR_RED, string);
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			Ban(playa);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[Ban]------------------------------------------------
	if(strcmp(cmd, "/sban", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /sban [id do jogador/nome]");
			return 1;
		}
		new playa;
		if(IsStringAName(tmp))
		{
			playa = GetPlayerID(tmp);
		}
		else
		{
			playa = strval(tmp);
		}
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			PlayerInfo[playa][pAdmin] = PlayerInfo[playa][pLevel];
			PlayerInfo[playa][pLevel] = -999;
			Ban(playa);
			format(string, sizeof(string), "AdmCmd: %s baniu %s",sendername,  giveplayer);
			printf("%s",string);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}

//----------------------------------[Mod]------------------------------------------------
	if(strcmp(cmd, "/mod", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COLOR_GRAD2, "USO: /mod [carmodid] 1034~1041");
			return 1;
		}
		new playa;
		playa = strval(tmp);
		new modcar = GetPlayerVehicleID(playerid);
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			AddVehicleComponent(modcar, playa);
			if (gdebug){printf("DEBUG modcar = %d mod = %d", modcar, playa);}
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[EndRound]-----------------------------------------------

	if(strcmp(cmd, "/endround", true) == 0)
	{
  if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			GameModeInitExitFunc();
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[EndRound]-----------------------------------------------

//----------------------------------[GMX]-----------------------------------------------

	if(strcmp(cmd, "/gmx", true) == 0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			GameModeExit();
		}
		else
		{
			//SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//----------------------------------[mission]-----------------------------------------------
	if (strcmp(cmd, "/camera", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "USO: /cam [1/2/3/4]");
			return 1;
		}
		Unspec[playerid][sCam] = strval(tmp);
		format(string, sizeof(string), "Mudando para a camera %d",Unspec[playerid][sCam]);
		SendClientMessage(playerid, COLOR_GRAD1, string);
		return 1;
	}
	if (strcmp(cmd, "/desbanir", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 3)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /desbanir [jogador]");
				return 1;
			}
			if(!LoadPlayer(playerid,tmp))
			{
				return 1;
			}
			if(PLlayerInfo[playerid][plAdmin] == 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "Jogador nao banido");
				return 1;
			}
			else
			{
				PLlayerInfo[playerid][plLevel] = PLlayerInfo[playerid][plAdmin];
				PLlayerInfo[playerid][plAdmin] = 0;
				SavePlayer(playerid,tmp);
				SendClientMessage(playerid, COLOR_GRAD1, "Jogador Desbanido");
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if (strcmp(cmd, "/ler", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /loadplayer [playername]");
				return 1;
			}
			LoadPlayer(playerid,tmp);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
	if (strcmp(cmd, "/salvar", true)==0)
	{
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USO: /salvar [playername]");
				return 1;
			}
			SavePlayer(playerid,tmp);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD1, "   Voce nao pode usar esse comando!");
		}
		return 1;
	}
//<-----------------------------[SpawnWeapon]-----------------------------------------------------------------------
	if(strcmp(cmd, "/coordenada", true) == 0)
	{
		new length = strlen(cmdtext);
		while ((idx < length) && (cmdtext[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = cmdtext[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
			SendClientMessage(playerid, COLOR_YELLOW, "USO: /pos [comment]");
			return 1;
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 1337)
		{
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);
			new coordsstring[256];
			format(coordsstring, 256, "%.1f,%.1f,%.1f // %s\n", px, py, pz,result);
			new File:hFile;
			hFile = fopen("pos.txt", io_append);
			fwrite(hFile, coordsstring);
			fclose(hFile);

		}
		return 1;
	}
	if (strcmp(cmd, "/admins", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GRAD1, "Admins Online:");
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pAdmin] >= 1 && PlayerInfo[i][pAdmin] < 1338)
			{
				GetPlayerName(i, sendername, sizeof(sendername));
				format(string, 256, "Admin: %s", sendername);
				SendClientMessage(playerid, COLOR_GRAD2, string);
			}
		}
		return 1;
	}
//----------------------------------[HELP]-----------------------------------------------
	if(strcmp(cmd, "/comandos", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		SendClientMessage(playerid, COLOR_YELLOW,"Para mais informacoes digite /(comando)");
	    SendClientMessage(playerid, COLOR_GRAD1,"- COMANDOS - /regras /registrar /login /mudarnome /mudarsenha /meustatus /comprarnivel /upgrade");
		SendClientMessage(playerid, COLOR_GRAD2,"- GERAL    - /pagar /doar /horas /comprar /desalugarcarro /darchave /mudarchave /id /cacar");
		SendClientMessage(playerid, COLOR_GRAD2,"- GERAL    - /resetarupgrades(100k) /comprararma /melhorcompra /melhorvenda /passarchave");
  		SendClientMessage(playerid, COLOR_GRAD3,"- CHAT     - /falarbaixo (/f)oradopersonagem (/gr)itar (/l)ocal (/ad)verter /eu ");
		SendClientMessage(playerid, COLOR_GRAD4,"- BANCO    - /extrato /sacar /depositar /transferir /emprestimo");
		if (gTeam[playerid] == 2)
		{
			SendClientMessage(playerid, COLOR_GRAD5, "--- DPSA --- (/r)adio (/d)epartmentos (/m)egafone (/su)speito /mdc /livre /prender /batercartao /pchave");
		}
		if (gTeam[playerid] == 1)
		{
			SendClientMessage(playerid, COLOR_GRAD5, "--- SAMU --- (/r)adio (/d)epartmentos /curar /passarchave");
		}
		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			SendClientMessage(playerid, COLOR_GRAD6, "--- ADMIN --- (/a)dmin (/ah)");
		}
		if (PlayerInfo[playerid][pAdmin] == -1 || PlayerInfo[playerid][pAdmin] >= 3 || gRaceGuy[playerid])
		{
			SendClientMessage(playerid, COLOR_GRAD6, "--- RACE EDIT --- /cp /racedelay /laps /randomrace /racelist /setrace /saverace /loadrace");
		}
		SendClientMessage(playerid, COLOR_GRAD6,"- OUTRO    - /ajudacelular /ajudacasa /ajudaalugar /ajudanegocio");
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");

		return 1;
	}

//------------------------------------------------------------------------------------------------------
//----------------------------------[HELP]-----------------------------------------------
	if(strcmp(cmd, "/ajuda", true) == 0)
	{
		SendClientMessage(playerid, COLOR_YELLOW,"____________ Ajuda ______________");
	    SendClientMessage(playerid, COR_AZUL,"Digite um dos comandos abaixo para mais informacoes do jogo:");
	    SendClientMessage(playerid, COR_AZUL,"- /abreviacoes  - /ajudacasa   - /comandos");
		SendClientMessage(playerid, COR_AZUL,"- /ajudacelular - /ajudaalugar - /rpg ");
		SendClientMessage(playerid, COR_AZUL,"- /ajudanegocio - /regras ");
		return 1;
	}
	if(strcmp(cmd, "/regras", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN,">-Regras do Servidor-<");
		SendClientMessage(playerid, COLOR_YELLOW,"____________ Leia atentamente ______________");
	    SendClientMessage(playerid, COLOR_RED,"Kick: Spam, desrespeito ao administrador, atirar sem motivo, nao jogar RP,");
	    SendClientMessage(playerid, COLOR_RED,"falar palavroes constantemente...");
		SendClientMessage(playerid, COLOR_RED,"Ban: Trapacas, ignorar kicks, ignorar regras do servidor.");
		SendClientMessage(playerid, COLOR_WHITE,"Aviso: O admin pode te prender, congelar ou te punir de acordo com a sua falta.");
  		SendClientMessage(playerid, COLOR_WHITE,"/admins para saber quais sao os admins.");
  		SendClientMessage(playerid, COLOR_YELLOW,"Dono: Daniel_Garcia");
		SendClientMessage(playerid, COLOR_YELLOW,"Obs: Para jogar voce tera que ter o nome_sobrenome como o nick.");
		return 1;
	}
	if(strcmp(cmd, "/rpg", true) == 0)
	{
	    SendClientMessage(playerid, COLOR_GREEN, "--------------- Como Jogar RPG ------------");
	    SendClientMessage(playerid, COLOR_WHITE, "Esse servidor e de RPG, que simula a vida real.");
	    SendClientMessage(playerid, COLOR_WHITE, "Aqui voce podera trabalhar para ganhar dinheiro, e poder comprar casas, carros, negocios....");
	    SendClientMessage(playerid, COLOR_WHITE, "Na vida real existem crimes. Se voce fizer crimes aqui, a policia tentara te prender.");
		SendClientMessage(playerid, COLOR_WHITE, "Voce nao podera matar uma pessoa sem um motivo, isso e disputa, disputa nao e permitida");
		SendClientMessage(playerid, COLOR_WHITE, "Caso voce morra, voce nao deve revidar, nao mate a pessoa que te matou, pois no RPG");
		SendClientMessage(playerid, COLOR_WHITE, "se voce morrer voce esquece tudo.");
		SendClientMessage(playerid, COLOR_WHITE, "Haja como se estivesse na vida real, pois se voce ignorar isso sera punido.");
		SendClientMessage(playerid, COLOR_WHITE, "Para mais informacoes: /regras ou /comandos.");
	return 1;
	}

//----------------------------------[HELP]-----------------------------------------------
	if(strcmp(cmd, "/ajudacelular", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		if (PlayerInfo[playerid][pPnumber] > 0)
		{
			SendClientMessage(playerid, COLOR_WHITE,"*** AJUDA *** coloque um comando para mais ajuda");
			SendClientMessage(playerid, COLOR_GRAD3,"*** CELULAR *** /ligar 190 /sms /atender /desligar /numero");
			SendClientMessage(playerid, COLOR_GRAD4,"*** OUTRO *** /ajuda /ajudacasa /ajudaalugar /ajudanegocio");
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE,"Voce pode comprar um telefone em um 24-7");
		}
		return 1;
	}
	if(strcmp(cmd, "/ajudacasa", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		SendClientMessage(playerid, COLOR_WHITE,"*** CASA *** coloque um comando para mais ajuda");
		SendClientMessage(playerid, COLOR_GRAD3,"*** CASA *** /entrar /sair /pchave /casa /curar /casaupgrade /alugavel /tv (desliga/porta/id)");
		SendClientMessage(playerid, COLOR_GRAD3,"*** CASA *** /mudarcarro /cordocarro /expulsar /expulsartodos /guincharcarro /reparar");
		SendClientMessage(playerid, COLOR_GRAD3,"*** CASA *** /modcarro /precoaluguel /cofredacasa");
		SendClientMessage(playerid, COLOR_GRAD4,"*** OUTROS *** /ajudacelular /ajuda /ajudaalugar /ajudanegocio");
		return 1;
	}
	if(strcmp(cmd, "/ajudaalugar", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		SendClientMessage(playerid, COLOR_WHITE,"*** ALUGUEL *** coloque um comando para mais ajuda");
		SendClientMessage(playerid, COLOR_GRAD3,"*** ALUGUEL *** /desalugar /entrar /sair /casa");
		SendClientMessage(playerid, COLOR_GRAD4,"*** OUTROS *** /ajudacelular /ajudacasa /ajuda /ajudanegocio");
		return 1;
	}
	if(strcmp(cmd, "/ajudanegocio", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		SendClientMessage(playerid, COLOR_WHITE,"*** NEGOCIOS *** coloque um comando para mais ajuda");
		SendClientMessage(playerid, COLOR_GRAD3,"*** NEGOCIOS *** /infonegocio /precoatacado /pricemod /bizfee");
		SendClientMessage(playerid, COLOR_GRAD4,"*** NEGOCIOS *** /enter /exit /pchave /sellbiz /bizwithdraw /bizupgrade");
		SendClientMessage(playerid, COLOR_GRAD4,"*** OUTROS *** /ajudacelular /ajudacasa /ajudaalugar /ajuda");
		return 1;
	}
	if(strcmp(cmd, "/ahelp", true) == 0 || strcmp(cmd, "/ah", true) == 0)
	{
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "*1* MODERADOR *** /status /setint /silenciar /kick /ban /goto /cnn /a(dmin) chat");
		}
		if ((IsPlayerAdmin(playerid)) || PlayerInfo[playerid][pAdmin] >= 2)
		{
			SendClientMessage(playerid, COLOR_GRAD2,"*2* ADMIN *** /skydive /setteam /bigears /ps /cnn /addcop /addmed /freeze /thaw /ajail /unjail /recon /cam");
		}
		if (PlayerInfo[playerid][pAdmin] >= 3)
		{
			SendClientMessage(playerid, COLOR_GRAD3,"*3* ADMIN *** /noooc /makeadmin /fourdive /dmweapon /loaddm /savedm /sp /startdm /stopdm /gotols /unban");
			SendClientMessage(playerid, COLOR_GRAD4,"*** ADMIN *** /mission /cashbox /streetrace /hotwire /endround /mark /gotomark /gotolv /gotosf /gethere /tod");
		}
		if (PlayerInfo[playerid][pAdmin] >= 1337)
		{
			SendClientMessage(playerid, COLOR_GRAD5,"*** 1337+ *** /loadpl /savepl /sban /givehealth /givegun /givemoney /makeadmin /setstat /gmx /asellhouse /tod /gotocar /sslap");
			SendClientMessage(playerid, COLOR_GRAD6,"*** ADMIN *** /mole /hq /logout /payday /logoutpl /logoutall /drop /vec /pos /test /spawn /incmis /editlevel /editprod");
		}
		if (PlayerInfo[playerid][pAdmin] >= 1338)
		{
			SendClientMessage(playerid, COLOR_GRAD6,"***1338 This makes you invisible in the admin list");
		}
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			return 1;
	}
	if(strcmp(cmd, "/cacar", true) == 0) //no finnish
	{
		if(PlayerInfo[playerid][pLevel] < 111)
		{
			SendClientMessage(playerid, COLOR_GRAD1, "Foi desativado.");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /cacar [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		if(IsStringAName(tmp))
		{
			giveplayerid = GetPlayerID(tmp);
		}
		else
		{
			giveplayerid = strval(tmp);
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GRAD1, "USO: /cacar [id do jogador/Parte do nome] [quantidade]");
			return 1;
		}
		moneys = strval(tmp);
		if (IsPlayerConnected(giveplayerid))
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys)
			{
				GivePlayerMoney(playerid, (0 - moneys));
				Contract[giveplayerid] = Contract[giveplayerid]+moneys;
				format(string, sizeof(string), "%s colocou a cabeca do %s a caca, por $%d.",sendername, giveplayer, moneys);
				PayLog(string);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				BroadCast(COLOR_YELLOW, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Quantidade Invalida.");
			}
		}
		else
		{
				format(string, sizeof(string), "   %d nao esta online.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
return 1;
}
//------------------------------------------------------------------------------------------------------
public HouseLevel(playerid)
{
	new h = PlayerInfo[playerid][pPhousekey];
	if(h == 255)
	{
		return 0;
	}
	if(h <= 4)
	{
		return 1;
	}
	if(h >= 5 && h <= 9)
	{
		return 2;
	}
	if(h >= 10 && h <= 18)
	{
		return 3;
	}
	if(h >= 19 && h <= 22)
	{
		return 4;
	}
	if(h >= 23 && h <= 25)
	{
		return 5;
	}
	if(h == 26)
	{
		return 6;
	}
	if(h == 27)
	{
		return 7;
	}
	if(h >= 28 && h <= 31)
	{
		return 7;
	}
	return 0;
}

public CHouseLevel(houseid)
{
	if(houseid <= 4)
	{
		return 3;
	}
	if(houseid >= 29 && houseid <= 30)
	{
		return 4;
	}
	if(houseid >= 5 && houseid <= 9)
	{
		return 5;
	}
	if(houseid >= 10 && houseid <= 18 || houseid == 28)
	{
		return 7;
	}
	if(houseid >= 19 && houseid <= 22)
	{
		return 8;
	}
	if(houseid >= 23 && houseid <= 25)
	{
		return 9;
	}
	if(houseid == 26)
	{
		return 10;
	}
	if(houseid == 27)
	{
		return 11;
	}
	if(houseid >= 28 && houseid <= 31)
	{
		return 12;
	}
	return 0;
}

public Encript(string[])
{
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] += (3^x) * (x % 15);
		  if(string[x] > (0xff))
		  {
			  string[x] -= 256;
		  }
	  }
	return 1;
}

public Decript(string[])
{
	if (gdebug){printf("DEBUG string = %s", string);}
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] -= (3^x) * (x % 15);
		  if(string[x] > (0xff))
		  {
			  string[x] -= 256;
		  }
	  }
	if (gdebug){printf("DEBUG decript = %s", string);}
	return 1;
}

public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if (gdebug >= 3){printf("DEBUG ProxDetector()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Trigger Radius
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(!BigEar[i])
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
				if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				{
					SendClientMessage(i, col1, string);
				}
				else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				{
					SendClientMessage(i, col2, string);
				}
				else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				{
					SendClientMessage(i, col3, string);
				}
				else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				{
					SendClientMessage(i, col4, string);
				}
				else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendClientMessage(i, col5, string);
				}
			}
			else
			{
				SendClientMessage(i, col1, string);
			}
		}
	}
			return 1;
}

public CrimInRange(Float:radi, playerid,copid)
{
	if (gdebug >= 0){printf("DEBUG CrimProxDetector()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	GetPlayerPos(copid, posx, posy, posz);
	tempposx = (oldposx -posx);
	tempposy = (oldposy -posy);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)))
	{
		return 1;
	}
	return 0;
}

public CrimProxDetector(Float:radi, playerid,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10)
{
	if (gdebug >= 3){printf("DEBUG CrimProxDetector()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy;
	new count;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	for(count = 10; count >= 0; count=count-1)
	{
		//printf("counter = %d",count);
		for(new i = 0; i <= MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) == 1 && gTeam[i] == 2 && FlashTime[i] == 0)
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				if (((tempposx < radi/count) && (tempposx > -radi/count)) && ((tempposy < radi/count) && (tempposy > -radi/count)))
				{
					//printf("DEBUG: player %d has at range %d",i,count);
					if (count == 10) {SetPlayerColor(playerid,col1);return 1;}
					else if (count == 9) {SetPlayerColor(playerid,col1);return 1;}
					else if (count == 8) {SetPlayerColor(playerid,col2);return 1;}
					else if (count == 7) {SetPlayerColor(playerid,col3);return 1;}
					else if (count == 6) {SetPlayerColor(playerid,col4);return 1;}
					else if (count == 5) {SetPlayerColor(playerid,col5);return 1;}
					else if (count == 4) {SetPlayerColor(playerid,col6);return 1;}
					else if (count == 3) {SetPlayerColor(playerid,col7);return 1;}
					else if (count == 2) {SetPlayerColor(playerid,col8);return 1;}
					else if (count == 1) {SetPlayerColor(playerid,col9);return 1;}
					else {SetPlayerColor(playerid,col10);return 1;}
				}

			}
		}
	}
	return 1;
}



public ProxDetectorS(Float:radi, playerid, targetid)
{
	if (gdebug >= 3){printf("DEBUG ProxDetectorS()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Trigger Radius
	GetPlayerPos(targetid, posx, posy, posz);
	tempposx = (oldposx -posx);
	tempposy = (oldposy -posy);
	tempposz = (oldposz -posz);
	//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		return 1;
	}
	return 0;
}

public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	if (gdebug >= 3){printf("DEBUG ProxDetectorS()");}
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	tempposx = (oldposx -x);
	tempposy = (oldposy -y);
	tempposz = (oldposz -z);
	//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		return 1;
	}
	return 0;
}

public TestDistance(playerid,giveplayerid,Float:tarx,Float:tary,Float:tarz,Float:radi)
{
	if (gdebug >= 3){printf("DEBUG TestDistance()");}
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	//radi = 2.0; //Trigger Radius
	GetPlayerPos(giveplayerid, posx, posy, posz);
	tempposx = (tarx -oldposx);
	tempposy = (tary -oldposy);
	tempposz = (tarz -oldposz);
	//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
	if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{
		if (gdebug >= 2){printf("DEBUG TestDistance2()");}
		tempposx = (tarx -posx);
		tempposy = (tary -posy);
		tempposz = (tarz -posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			if (gdebug >= 2){printf("DEBUG TestDistance3()");}
			return 1;
		}
	}
	else
	{
		return 0;
	}
	return 0;
}

public PlayerInArea()
{
	new Float:x, Float:y, Float:z;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, x, y, z);
			//printf("DEBUGpia: X:%f Y:%f Z:%f",x, y, z);
			if(x<=2720.00 && x>=1220.00 && y<=2600.00 && y>=850.00 && z<=1100.0 && z>=900.0 || PlayerToPoint(2.0, i, 1119.0,-1.7,1000.6))
			{
				new string[64];
				format(string, sizeof(string), "~r~Fechado");
				GameTextForPlayer(i, string, 5000, 6);
				SetPlayerInterior(i,12);
				PlayerInfo[i][pInt] = 12;
				SetPlayerPos(i,1022.599975,-1123.699951,23.799999);
			}
		}
	}
	return 1;
}

public PlayerInArena()
{
	new Float:x, Float:y, Float:z;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, x, y, z);
			if((gPlayerFighter[i] != 1 && PlayerInfo[i][pAdmin] < 1 && Spectate[i] == 255))
			{
				if(x<=gDMWbounds[0]+50 && x>=gDMWbounds[1]-50 && y<=gDMWbounds[2]+50 && y>=gDMWbounds[3]-50)
				{
					GameTextForPlayer(i, "~w~Warning You Are Approaching A~n~~r~Restricted Area~n~~w~Turn back or be shot", 5000, 6);
				}
				if(x<=gDMWbounds[0]+25 && x>=gDMWbounds[1]-25 && y<=gDMWbounds[2]+25 && y>=gDMWbounds[3]-25)
				{
					SetPlayerHealth(i, 0.0);
				}
			}
			if(gPlayerFighter[i])
			{
				if(x>gDMWbounds[0])
				{
					SetPlayerPos(i, gDMWbounds[0], y,z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
				if(x<gDMWbounds[1])
				{
					SetPlayerPos(i, gDMWbounds[1], y,z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
				if(y>gDMWbounds[2])
				{
					SetPlayerPos(i, x,gDMWbounds[2],z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
				if(y<gDMWbounds[3])
				{
					SetPlayerPos(i, x,gDMWbounds[3],z); // Warp the player
					GameTextForPlayer(i, "~w~You cannot leave~n~~r~DEATHMATCH", 5000, 6);
				}
			}
		}
	}
	return 1;
}

public PenInArea()
{
	new Float:x, Float:y, Float:z;
		if(gPublicEnemy != 255)
		{
			GetPlayerPos(gPublicEnemy, x, y, z);
			if(z>900.0)
			{
				new house = PlayerInfo[gPublicEnemy][pLocal];
				GameTextForPlayer(gPublicEnemy, "~w~There is nowhere to hide", 5000, 1);
				SetPlayerInterior(gPublicEnemy,0);
				PlayerInfo[gPublicEnemy][pInt] = 0;
				PlayerInfo[gPublicEnemy][pLocal] = 255;
				if(house > 99 && house != 255)
				{
					SetPlayerPos(gPublicEnemy, BizzInfo[house-99][bEntrancex], BizzInfo[house-99][bEntrancey],BizzInfo[house-99][bEntrancez]); // Warp the player
				}
				else if(house < 99 && house != 255)
				{
					SetPlayerPos(gPublicEnemy, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]); // Warp the player
				}
				else
				{
					SetPlayerPos(gPublicEnemy, 1350.1,-1279.1,13.3); // Warp the player to amunation
				}
			}
			if(z <= -0.5)
			{
				GameTextForPlayer(gPublicEnemy, "~w~Um bandido nao consegue nadar...", 5000, 1);
				SetPlayerHealth(gPublicEnemy,0.0);
			}
			if(x == PenPos[0] && y == PenPos[1] && z == PenPos[2])
			{
				for(new i = 0; i <= MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) && gTeam[i] == 2 && CrimInRange(5.0, gPublicEnemy,i))
					{
						SetPlayerHealth(gPublicEnemy, 0.0);
						OnPlayerDeath(gPublicEnemy, i, 0);
					}
				}
			}
			PenPos[0] = x ;PenPos[1]= y;PenPos[2]= z;
		}
	return 1;
}

public CustomPickups()
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new string[128];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			GetPlayerPos(i, oldposx, oldposy, oldposz);
			new tmpcar = GetPlayerVehicleID(i);
			/*
			if(gPlayerSpawned[i] && PlayerToPoint(10.0, i, 1520.1,-1473.2,9.2))
			{
				new string[128];
				format(string, sizeof(string), "~w~Wheel Arch Angels~n~Type ~g~/enter ~w~to use");
				GameTextForPlayer(i, string, 5000, 3);
			}
			*/
			if(oldposx!=0.0 && oldposy!=0.0 && oldposz!=0.0)
			{
				for(new h = 0; h < sizeof(SBizzInfo); h++)
				{
					if(IsATruck(tmpcar) && PlayerToPoint(10.0, i, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]))
					{
						format(string, sizeof(string), "~w~%s~n~~r~Componentes Requeridos~w~: %d~n~~g~Pagamento~w~: $%d~n~~g~Fundos: ~w~: $%d",SBizzInfo[h][sbDiscription],(SBizzInfo[h][sbCompCap]-SBizzInfo[h][sbComp]),SBizzInfo[h][sbPayComp],SBizzInfo[h][sbTakings]);
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
					if(PlayerToPoint(2.0, i, SBizzInfo[h][sbEntrancex], SBizzInfo[h][sbEntrancey], SBizzInfo[h][sbEntrancez]))
					{
						if(SBizzInfo[h][sbOwned] == 1)
						{
							format(string, sizeof(string), "~w~%s~w~~n~Dono : %s~n~Entrada : ~g~$%d ~w~Nivel : %d ~n~para entrar /entrar",SBizzInfo[h][sbDiscription],SBizzInfo[h][sbOwner],SBizzInfo[h][sbEntcost],SBizzInfo[h][sbLevel]);
						}
						else
						{
							format(string, sizeof(string), "~w~%s~w~~n~Negocio a venda~n~Preco: ~g~$%d ~w~Nivel : %d ~n~/comprarnegocio para comprar",SBizzInfo[h][sbDiscription],SBizzInfo[h][sbValue],SBizzInfo[h][sbLevel]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
				for(new h = 0; h < sizeof(HouseInfo); h++)
				{
					if(PlayerToPoint(2.0, i, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]))
					{
						if(HouseInfo[h][hOwned] == 1)
						{
							if(HouseInfo[h][hRentabil] == 0)
							{
								format(string, sizeof(string), "~w~Casa do~n~%s~n~Nivel : %d",HouseInfo[h][hOwner],HouseInfo[h][hLevel]);
							}
							else
							{
								format(string, sizeof(string), "~w~Casa do~n~%s~n~Aluguel: $%d Nivel : %d~n~/alugarcasa para alugar",HouseInfo[h][hOwner],HouseInfo[h][hRent],HouseInfo[h][hLevel]);
							}
							GameTextForPlayer(i, string, 5000, 3);
							return 1;
						}
						else
						{
							format(string, sizeof(string), "~w~Casa a venda~n~Descricao: %s ~n~Preco: ~g~$%d~n~~w~ Nivel : %d~n~/comprarcasa para comprar",HouseInfo[h][hDiscription],HouseInfo[h][hValue],HouseInfo[h][hLevel]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
				for(new h = 0; h < sizeof(BizzInfo); h++)
				{
					if(IsATruck(tmpcar) && PlayerToPoint(10.0, i, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]))
					{
						format(string, sizeof(string), "~w~%s~n~~r~Componentes Requeridos~w~: %d~n~~g~Pagamento~w~: $%d~n~~g~Fundos: ~w~: $%d",BizzInfo[h][bDiscription],(BizzInfo[h][bCompCap]-BizzInfo[h][bComp]),BizzInfo[h][bPayComp],BizzInfo[h][bTakings]);
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
					if(PlayerToPoint(2.0, i, BizzInfo[h][bEntrancex], BizzInfo[h][bEntrancey], BizzInfo[h][bEntrancez]))
					{
						if(BizzInfo[h][bOwned] == 1)
						{
							format(string, sizeof(string), "~w~%s~w~~n~Dono : %s~n~Entrada : ~g~$%d ~w~Nivel : %d ~n~para entrar coloque /entrar",BizzInfo[h][bDiscription],BizzInfo[h][bOwner],BizzInfo[h][bEntcost],BizzInfo[h][bLevel]);
						}
						else
						{
							format(string, sizeof(string), "~w~%s~w~~n~A venda~n~Preco: ~g~$%d ~w~Nivel : %d ~n~Para comprar /comprarnegocio",BizzInfo[h][bDiscription],BizzInfo[h][bValue],BizzInfo[h][bLevel]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

public IdleKick()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && PlayerInfo[i][pAdmin] < 1)
		{
			GetPlayerPos(i, PlayerPos[i][0], PlayerPos[i][1], PlayerPos[i][2]);
			//printf("player %d\n x = %f\n y = %f\n z = %f\n x2 = %f\n y2 = %f\n z2 = %f\n",i, PlayerPos[i][0],PlayerPos[i][1],PlayerPos[i][2],PlayerPos[i][3],PlayerPos[i][4],PlayerPos[i][5]);
			if(PlayerPos[i][0] == PlayerPos[i][3] && PlayerPos[i][1] == PlayerPos[i][4] && PlayerPos[i][2] == PlayerPos[i][5])
			{
				Kick(i);
			}
			PlayerPos[i][3] = PlayerPos[i][0];
			PlayerPos[i][4] = PlayerPos[i][1];
			PlayerPos[i][5] = PlayerPos[i][2];
		}
	}
}

public AntiCamp()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(SafeTime[i] > 0)
			{
				SafeTime[i]--;
			}
			if(SafeTime[i] == 1)
			{
				if(gPlayerAccount[i] == 1 && gPlayerLogged[i] == 0)
				{
					SendClientMessage(i, COLOR_WHITE, "AVISO: Voce pode logar com /login <senha>");
					//Kick(i);
				}
			}
		}
	}
}

public AntiTeleport()
{
	new plname[MAX_PLAYER_NAME];
	new string[256];
	new Float:maxspeed = 80.0;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && (GetPlayerState(i) == 2))
		{
			GetPlayerPos(i, TelePos[i][3], TelePos[i][4], TelePos[i][5]);
			if(TelePos[i][5] > 550.0)
			{
				TelePos[i][0] = 0.0;
				TelePos[i][1] = 0.0;
			}
			//printf("player %d\n x = %f\n y = %f\n z = %f\n x2 = %f\n y2 = %f\n z2 = %f\n",i, PlayerPos[i][0],PlayerPos[i][1],PlayerPos[i][2],PlayerPos[i][3],PlayerPos[i][4],PlayerPos[i][5]);
			if(TelePos[i][0] != 0.0)
			{
				new Float:xdist = TelePos[i][3]-TelePos[i][0];
				new Float:ydist = TelePos[i][4]-TelePos[i][1];
				new Float:sqxdist = xdist*xdist;
				new Float:sqydist = ydist*ydist;
				new Float:distance = (sqxdist+sqydist)/17;
				if(gSpeedo[i] == 2)
				{
					if(distance <10)
					{
						format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~km/h :   ~b~%.0f",distance);
					}
					if(distance > 10 && distance < 100)
					{
						format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~km/h :  ~b~%.0f",distance);
					}
					if(distance > 100)
					{
						format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~km/h : ~b~%.0f",distance);
					}
					GameTextForPlayer(i, string, 2000, 5);
				}
				if(distance > maxspeed)
				{
					new tmpcar = GetPlayerVehicleID(i);
					if(!IsAPlane(tmpcar))
					{
						GetPlayerName(i, plname, sizeof(plname));
						format(string, 256, "AdmAlerta: [%d]%s %.0f km/h",i,plname,distance);
						Speeder = i;
		    			SendClientMessage(i,COLOR_RED,"Você foi pego pelo radar dirigindo acima da velocidade, e levou multa 50$ max. 80 km/h");
    					GivePlayerMoney(i,-50);
						ABroadCast(COLOR_YELLOW,string,1);
					}
				}
			}
			if(TelePos[i][5] < 550.0 && TelePos[i][3] != 0.0)
			{
				TelePos[i][0] = TelePos[i][3];
				TelePos[i][1] = TelePos[i][4];
			}
		}
	}
}

public RaceSpec(playerid)
{
	new tmplaps;
	new bestracer;
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1 && LapCount[i] > 0)
		{
			if(LapCount[i] > tmplaps)
			{
				bestracer = i;
				tmplaps = LapCount[i];
			}
		}
	}
	if(Spectate[playerid] != bestracer)
	{
		new sstring[256];
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestracer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestracer;
	}
	return 1;
}

public BestPlayer(playerid)
{
	new bestplayer;
	bestplayer = lastkiller;
	if(gSuperCop != INVALID_PLAYER_ID)
	{
		bestplayer = gSuperCop;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new sstring[256];
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}

public PenDelay(playerid)
{
	new bestplayer;
	new sstring[256];
	bestplayer = gPublicEnemy;
	if(bestplayer == INVALID_PLAYER_ID)
	{
		TVMode[playerid] = 1;
		GameTextForPlayer(playerid, "~w~                True~n~                   ~b~Crime", 5000, 6);
		BestPlayer(playerid);
		return 1;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~p~Starring ~n~~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}

public SpeedDelay(playerid)
{
	new bestplayer;
	new sstring[256];
	bestplayer = Speeder;
	if(bestplayer == INVALID_PLAYER_ID)
	{
		TVMode[playerid] = 1;
		GameTextForPlayer(playerid, "~w~                True~n~                   ~b~Crime", 5000, 6);
		BestPlayer(playerid);
		return 1;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~p~Starring ~n~~w~%s",giveplayer);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}


public DMPlayer(playerid)
{
	new bestplayer;
	bestplayer = DmHiPlayer;
	if(bestplayer == INVALID_PLAYER_ID)
	{
		TVMode[playerid] = 1;
		GameTextForPlayer(playerid, "~w~                True~n~                   ~b~Crime", 5000, 6);
		BestPlayer(playerid);
		return 1;
	}
	if(Spectate[playerid] != bestplayer)
	{
		new sstring[256];
		new giveplayer[MAX_PLAYER_NAME];
		GetPlayerName(bestplayer, giveplayer, sizeof(giveplayer));
		format(sstring, sizeof(sstring), "~w~%s~n~  score:~r~ %d",giveplayer,DmScore[bestplayer]);
		GameTextForPlayer(playerid, sstring, 5000, 1);
		Spectate[playerid] = bestplayer;
	}
	return 1;
}

public InHouse()
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new string[256];
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			if(PlayerInfo[i][pLocal] != 255)
			{
				new house = PlayerInfo[i][pLocal];
				GetPlayerPos(i, oldposx, oldposy, oldposz);
				if(oldposz != 0.0)
				{
					if(oldposz < 600.0)
					{
						//new string[64];
						//format(string, sizeof(string), "~w~rexit");
						if(house == 10000)
						{
							if (!PlayerToPoint(6, i,-2724.0,217.9,4.1))
							{
								if (GetPlayerState(i) == 2)
								{
									new tmpcar = GetPlayerVehicleID(i);
									SetVehiclePos(tmpcar, 1520.1,-1473.2,9.2);
									SetVehicleZAngle(tmpcar, 270.0);
								}
								else
								{
									SetPlayerPos(i, 1520.1,-1473.2,9.2);
								}
									new oldcash = gSpentCash[i];
									new Total = GetPlayerMoney(i) - oldcash;
									printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(i),oldcash);
									new name[MAX_PLAYER_NAME];
									SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]-Total;
									GetPlayerName(i, name, sizeof(name));
									format(string,128,"<< %s has left the modshop with $%d >>",name,Total);
									PayLog(string);
									gSpentCash[i] = 0;
								TelePos[i][0] = 0.0;
								TelePos[i][1] = 0.0;
								PlayerInfo[i][pLocal] = 255;
								SetPlayerInterior(i,0);
								PlayerInfo[i][pInt] = 0;
								Spectate[i] = 255;
							}
						}
						if(house > 10000)
						{
							new tmpcar = GetPlayerVehicleID(i);
							if (!PlayerToPoint(6, i,1040.6,-1021.0,31.7) && house == 10001 ||!PlayerToPoint(6, i,-2720.5,217.5,4.1) && house == 10002 ||!PlayerToPoint(6, i,2644.6,-2044.9,13.3) && house == 10003)
							{
								if (GetPlayerState(i) == 2)
								{
									SetVehiclePos(tmpcar, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]);
									SetVehicleZAngle(tmpcar, HouseCarSpawns[tmpcar-1][3]);
								}
								else
								{
									SetPlayerPos(i, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]);
								}
									new oldcash = gSpentCash[i];
									new Total = GetPlayerMoney(i) - oldcash;
									printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(i),oldcash);
									new name[MAX_PLAYER_NAME];
									SBizzInfo[1][sbTakings] = SBizzInfo[1][sbTakings]-Total;
									GetPlayerName(i, name, sizeof(name));
									format(string,128,"<< %s has left the homemodshop with $%d >>",name,Total);
									PayLog(string);
									gSpentCash[i] = 0;
								TelePos[i][0] = 0.0;
								TelePos[i][1] = 0.0;
								PlayerInfo[i][pLocal] = 255;
								SetPlayerInterior(i,0);
								PlayerInfo[i][pInt] = 0;
								Spectate[i] = 255;
							}
						}
						if(house >= 99 && house != 10000)
						{
							if(house == 7+99 && PlayerInfo[i][pPbiskey] != 7) //casino) //casino
							{
								new oldcash = gSpentCash[i];
								new Total = GetPlayerMoney(i) - oldcash;
								printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(i),oldcash);
								new name[MAX_PLAYER_NAME];
								BizzInfo[7][bTakings] = BizzInfo[7][bTakings]-Total;
								GetPlayerName(i, name, sizeof(name));
								format(string,128,"<< %s has left the casino with $%d >>",name,Total);
								PayLog(string);
								gSpentCash[i] = 0;
							}
							SetPlayerPos(i, BizzInfo[house-99][bEntrancex], BizzInfo[house-99][bEntrancey],BizzInfo[house-99][bEntrancez]); // Warp the player
							PlayerInfo[i][pLocal] = 255;
							SetPlayerInterior(i,0);
							PlayerInfo[i][pInt] = 0;
						}
						else if(house < 99 && house != 10000)
						{
							SetPlayerPos(i, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]); // Warp the player
							PlayerInfo[i][pLocal] = 255;
							SetPlayerInterior(i,0);
							PlayerInfo[i][pInt] = 0;
						}
					}
				}
			}
		}
	}
	return 1;
}



public IsStringAName(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
			//printf("IsS:testname = %s : string = %s",testname,string);
			if(strcmp(testname, string, true, strlen(string)) == 0)
			{
				//printf("TRUE IsS:testname = %s : string = %s",testname,string);
				return 1;
			}
		}
	}
	return 0;
}

public GetPlayerID(string[])
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			new testname[MAX_PLAYER_NAME];
			GetPlayerName(i, testname, sizeof(testname));
			//printf("GetP:testname = %s : string = %s",testname,string);
			if(strcmp(testname, string, true, strlen(string)) == 0)
			{
				//printf("TRUE GetP:testname = %s : string = %s playerid %d",testname,string, i);
				return i;
			}
		}
	}
	return INVALID_PLAYER_ID;
}

public OnPlayerText(playerid, text[])
{
	if(Mute[playerid] == 1)
	{
		SendClientMessage(playerid, TEAM_CYAN_COLOR, "Voce foi silenciado");
		return 0;
	}
	if(Mobile[playerid] != 255)
	{
		new string [128];
		new sendername[MAX_PLAYER_NAME];
		new idx;
		new tmp[MAX_PLAYER_NAME];
		tmp = strtok(text, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s diz (celular): %s", sendername, text);
  		ApplyAnimation(playerid,"PED", "phone_talk", 4.0, 1, 1, 1, 1, 1);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		//printf("callers line %d called %d caller %d",Mobile[Mobile[playerid]],Mobile[playerid],playerid);
		if(Mobile[playerid] == 914)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: Sorry I don't understand?");
				return 0;
			}
				new turner[MAX_PLAYER_NAME];
				new wanted[128];
				GetPlayerName(playerid, turner, sizeof(turner));
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: We have alerted all units in the area.");
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Thank you for reporting this incident");
				format(wanted, sizeof(wanted), "Dispatch: All Units IA: Caller: %s",turner);
				SendTeamBeepMessage(1, TEAM_CYAN_COLOR, wanted);
				format(wanted, sizeof(wanted), "Dispatch: Incident: %s",text);
				SendTeamMessage(1, TEAM_CYAN_COLOR, wanted);
				if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
				SendClientMessage(playerid, COLOR_GRAD2, "   Desligaram...");
				Mobile[playerid] = 255;
				return 0;
		}
		if(Mobile[playerid] == 913)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCIA: Sorry i dont understand?");
				return 0;
			}
			if ((strcmp("no", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("no")))
			{
				new turner[MAX_PLAYER_NAME];
				new wanted[128];
				GetPlayerName(playerid, turner, sizeof(turner));
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Todas unidades em alerta.");
				SendClientMessage(playerid, COLOR_DBLUE, "Obrigado por nos informar do crime");
				format(wanted, sizeof(wanted), "HQ: All Units APB: Reporter: %s",turner);
				SendTeamBeepMessage(2, COLOR_DBLUE, wanted);
				format(wanted, sizeof(wanted), "HQ: Crime: %s, Suspect: Desconhecido",PlayerCrime[playerid][pAccusing]);
				SendTeamMessage(2, COLOR_DBLUE, wanted);
				if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
				SendClientMessage(playerid, COLOR_GRAD2, "   Desligaram...");
				Mobile[playerid] = 255;
				return 0;
			}
			new badguy;
			if(IsStringAName(tmp))
			{
				badguy = GetPlayerID(tmp);
			}
			else
			{
				badguy = strval(tmp);
			}
			if (gTeam[badguy] == 2 || gTeam[badguy] == 1)
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: You will have to contact internal affairs. This is an emergency line");
				SendClientMessage(playerid, COLOR_GRAD2, "   Desligaram...");
				Mobile[playerid] = 255;
				return 0;
			}
			if (gTeam[badguy] >= 4)
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Units are already assigned to that case");
				SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
				SendClientMessage(playerid, COLOR_GRAD2, "   Desligaram...");
				Mobile[playerid] = 255;
				return 0;
			}
			if (badguy == playerid)
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Dont Fool Around, This is an emergency line.");
				SendClientMessage(playerid, COLOR_GRAD2, "   Desligaram...");
				Mobile[playerid] = 255;
				return 0;
			}
			if (IsPlayerConnected(badguy))
			{
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: We have alerted all units in the area.");
				SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
				SetPlayerCriminal(badguy,playerid, PlayerCrime[playerid][pAccusing],0,0);
				if(FlashTime[badguy] == 0){FlashTime[playerid] = 10;}
				if(FlashTime[playerid] == 0){FlashTime[playerid] = 10;}
				SendClientMessage(playerid, COLOR_GRAD2, "   Desligaram...");
				Mobile[playerid] = 255;
				return 0;
			}
			else
			{
				format(string, sizeof(string), "Police HQ: I have no Information on %s, are you shure thats the right name?",tmp);
				SendClientMessage(playerid, COLOR_DBLUE, string);
				return 0;
			}
		}
		if(Mobile[playerid] == 912)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCIA: Sorry i dont understand?");
				return 0;
			}
				strmid(PlayerCrime[playerid][pAccusing], text, 0, strlen(text), 255);
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: If you know the assailant's name or part of it say it now or just say no.");
				Mobile[playerid] = 913;
				return 0;
		}
		if(Mobile[playerid] == 911)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCIA: Sorry i dont understand, police or paramedic?");
				return 0;
			}
			else if ((strcmp("police", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("police")))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCIA: I am patching you to  Police HQ, please hold.");
				Mobile[playerid] = 912;
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Please give me a short description of the crime.");
				return 0;
			}
			else if ((strcmp("paramedic", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("paramedic")))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCIA: I am patching you to  Paramedic HQ, please hold.");
				Mobile[playerid] = 914;
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: Please give me a short description of the Incident.");
				return 0;
			}
			else
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCIA: Sorry i dont understand, police or paramedic?");
				return 0;
			}
		}
		if(IsPlayerConnected(Mobile[playerid]) == 1 && Mobile[Mobile[playerid]] == playerid)
		{
			SendClientMessage(Mobile[playerid], COLOR_YELLOW,string);
		}
		else
		{
			SendClientMessage(playerid, COLOR_YELLOW,"Desligou.");
		}
		return 0;
	}
	if (realchat)
	{
		new string [128];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s diz: %s", sendername, text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		return 0;
	}
	return 1;
}

public SetCamBack(playerid)
{
	new Float:plocx,Float:plocy,Float:plocz;
	GetPlayerPos(playerid, plocx, plocy, plocz);
	SetPlayerPos(playerid, -1863.15, -21.6598, 1060.15); // Warp the player
	SetPlayerInterior(playerid,14);
	//SetPlayerPos(playerid, plocx, plocy, plocz); // Warp the player
	//SetPlayerInterior(playerid,0);
}

public FixHour(hour)
{
	//if (gdebug >= 2){printf("DEBUG FixHour(%d)",hour);}
	hour = timeshift+hour;
	if (hour < 0)
	{
		hour = hour+24;
	}
	else if (hour > 23)
	{
		hour = hour-24;
	}
	shifthour = hour;
	return 1;
}

stock AddsOn()
{
	if (gdebug >= 2){printf("DEBUG AddsOn()");}
	adds=1;
	return 1;
}
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

public RaceCheckpointReset()
{
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			DisablePlayerRaceCheckpoint(i);
			gPlayerLapStatus[i] = 0;
			gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
		}
	}

}
public SetAllPlayerRaceCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num)
{
	//if (gdebug >= 1){printf("DEBUG SetAllPlayerCheckpoint()");}
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) == 1)
		{
			SetPlayerRaceCheckpoint(i,0,allx,ally,allz,allx,ally,allz, radi);
			if (num != 255)
			{
				gPlayerCheckpointStatus[i] = num;
			}
		}
	}

}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	new string[128];
	new name[MAX_PLAYER_NAME];

	switch (gPlayerCheckpointStatus[playerid])
	{
	case CHECKPOINT_SR1START:
		    {
			//	if (gdebug){print("DEBUG CHECKPOINT_SR1START");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				if (gTeam[playerid] >= 3)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					if(IsAPlane(tmpcar))
					{
						GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
						return 1;
					}
					if (MissionActive == 5)// first to arrive
					{
						gRaceLeader++;
					//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
						if (gRaceLeader == 1)
						{
							format(string, sizeof(string), "~r~Wait For More Racers");
							GameTextForPlayer(playerid, string, 2000, 6);
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							DisablePlayerRaceCheckpoint(playerid);
							return 1;
						}
						else if (gRaceLeader == 2)
						{
							gRaceLeader = 0;
						//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
							format(string, sizeof(string), "Hurry %d Seconds To Race Start!",racedelay/1000);
							RingTone[playerid] = 20;
							SendEnemyMessage(COLOR_WHITE, string);
							format(string, sizeof(string), "~r~Wait Here For Racers");
							gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
							GameTextForPlayer(playerid, string, 2000, 6);
						}
						SetTimer("RaceDelay", racedelay, 0);
						DisablePlayerRaceCheckpoint(playerid);
						MissionActive = 6;
					//	if (gdebug){print("DEBUG MissionActive = 6");}
					}
					else if (MissionActive == 6) //late arrivels
					{
					//	if (gdebug){print("DEBUG waiting");}
						DisablePlayerRaceCheckpoint(playerid);
						gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~w~Patrol This Area~n~ For Suspects", 5000, 1);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
					return 1;
				}
		    }
		case CHECKPOINT_SRA:
		    {
			//	if (gdebug){print("DEBUG CHECKPOINT_SRA");}
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if (StartTime[playerid] == 0)
				{
					StartTime[playerid] = Gtickcount;
					if(gTeam[playerid] == 3)
					{
						SetPlayerCriminal(playerid,255, "Street Racing",0,0);
						//if(FlashTime[playerid] == 0){FlashTime[playerid] = 60;}
					}
				}
				LapCount[playerid]++;
				gRaceEnd++;
				if(LapCount[playerid] > gLaps)
				{
					gLaps = LapCount[playerid];
					gRaceEnd = 1;
				}
				if(RaceInfo[rLaps] != 0)
				{
					if(gLaps != (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						//RaceDebug(playerid);
						if(gLaps == 2)
						{
							for(new i = 0; i <= MAX_PLAYERS; i++)
							{
								if(IsPlayerConnected(i) && gTeam[i] == 2)
								{
									format(cbjstore, sizeof(cbjstore), "HQ: 911 10-14 Set Up A RoadBlock At The Red Marker.");
									SendClientMessage(i, COLOR_DBLUE, cbjstore);
									RingTone[i] = 20;
									SetPlayerCheckpoint(i,rm2x,rm2y,rm2z, 8.0);
								}
							}
							RaceTime[playerid] = Gtickcount;
						}
						if (gRaceEnd == 1 && LapCount[playerid] == gLaps)
						{
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 1st Place T: %d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~1st Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
							SetAllCopCheckpoint(rex,rey,rez, 8.0);
						}
						else if (gRaceEnd == 2 && LapCount[playerid] == gLaps)
						{
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 2nd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~2nd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else if (gRaceEnd == 3 && LapCount[playerid] == gLaps)
						{
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s is in 3rd Place T: +%d:%d:%d", name,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "~w~Lap %d/%d~n~~g~3rd Place ~n~~y~T: %d:%d:%d",gLaps,RaceInfo[rLaps],cmins,csecs,cmils);
						}
						else
						{
							format(string, sizeof(string), "~w~Lap %d/%d",LapCount[playerid],RaceInfo[rLaps]);
						}
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					else if(gLaps == (RaceInfo[rLaps]+1) && gLaps > 1)
					{
						if (gRaceEnd == 1)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						//	if (gdebug){print("DEBUG RACE OVER");}
							RewardCalc(playerid,1000,10000);
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							preward = reward;
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~w~MISSION PASSED! ~n~~g~$%d", reward);
							//format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 0);
							BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
							RaceTime[playerid] = Gtickcount;
							pos1time = RaceTime[playerid] - StartTime[playerid];
							ConvertTicks(pos1time);
							GetPlayerName(playerid, name, sizeof(name));
							raceendtimer = SetTimer("RaceEnd", 120000, 0);
							if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
							{
								RaceInfo[rBestms] = pos1time;
								strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
								BestTime(CurrentRace);
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
								BroadCast(COLOR_WHITE, string);
								format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							else
							{
								format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
								BroadCast(COLOR_WHITE, string);
							}
							SetPlayerCriminal(playerid,255, "Street Racing",1,1);
							gPlayerMission[playerid] = 2;
							BetWinner(playerid,1);
							return 1;
						}
						else if (gRaceEnd == 2)
						{
							DisablePlayerCheckpoint(playerid);
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						//	if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/2;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos3time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos3time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							return 1;
						}
						else if (gRaceEnd == 3)
						{
							CheckpointReset();
							RaceCheckpointReset();
							PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						//	if (gdebug){print("DEBUG RACE OVER");}
							reward = preward/3;
							GetPlayerName(playerid, name, sizeof(name));
							GivePlayerMoney(playerid, reward);
							PlayerPlayMusic(playerid);
							format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
							GameTextForPlayer(playerid, string, 5000, 6);
							RaceTime[playerid] = Gtickcount;
							pos2time = RaceTime[playerid] - StartTime[playerid];
							new splittime = pos2time - pos1time;
							ConvertTicks(splittime);
							GetPlayerName(playerid, name, sizeof(name));
							format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
							KillTimer(raceendtimer);
							RaceEnd();
							return 1;
						}
					}
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(playerid,0,rmx,rmy,rmz,rm2x,rm2y,rm2z, 8.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
				if(RaceInfo[rLaps] == 0 && LapCount[playerid] == 1)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(playerid,0,rmx,rmy,rmz,rm2x,rm2y,rm2z, 8.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRB;
				}
		    }
		case CHECKPOINT_SRB:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid = 1;
				}
			//	if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerRaceCheckpoint(playerid,0,rm2x,rm2y,rm2z,rex,rey,rez, 8.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRC;
				gRaceMid++;
			//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRC:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceMid2 != 1 && LapCount[playerid] > gLaps)
				{
					gRaceMid2 = 1;
				}
			//	if (gdebug){print("DEBUG CHECKPOINT_SRB");}
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				SetPlayerRaceCheckpoint(playerid,0,rex,rey,rez,rsx,rsy,rsz, 8.0);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRD;
				gRaceMid2++;
			//	if (gdebug){printf("gRaceLeader %d",gRaceLeader);}
		    }
		case CHECKPOINT_SRD:
		    {
				if (GetPlayerState(playerid) != 2)
				{
					return 1;
				}
				new tmpcar = GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))
				{
					GameTextForPlayer(playerid, "~w~No aircraft allowed in the race", 2000, 6);
					return 1;
				}
				if(gRaceFin != 1 && LapCount[playerid] > gLaps)
				{
					gRaceFin = 1;
				}
			//	if (gdebug){print("DEBUG CHECKPOINT_SRC");}
				gRaceFin++;
				if(RaceInfo[rLaps] > 0)
				{
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerRaceCheckpoint(playerid,1,rsx,rsy,rsz,rsx,rsy,rsz, 8.0);
					gPlayerCheckpointStatus[playerid] = CHECKPOINT_SRA;
					SetAllCopCheckpoint(rex,rey,rez, 8.0);
				}
				if(RaceInfo[rLaps] == 0)
				{
					if (gRaceFin == 1)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					//	if (gdebug){print("DEBUG RACE OVER");}
						RewardCalc(playerid,1000,10000);
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						preward = reward;
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~w~MISSION PASSED! ~n~~g~$%d", reward);
						//RaceCheckpointReset();
      					DisablePlayerRaceCheckpoint(playerid);
						//format(string, sizeof(string), "~g~YOU WIN~n~~w~Your winnings are ~n~~g~$%d", reward);
						GameTextForPlayer(playerid, string, 5000, 0);
						BroadCast(COLOR_WHITE, "RACENEWS: The Race Will End In 120 secs");
						RaceTime[playerid] = Gtickcount;
						pos1time = RaceTime[playerid] - StartTime[playerid];
						ConvertTicks(pos1time);
						GetPlayerName(playerid, name, sizeof(name));
						raceendtimer = SetTimer("RaceEnd", 120000, 0);
						if(RaceInfo[rBestms] > pos1time || RaceInfo[rBestms] == 0)
						{
							RaceInfo[rBestms] = pos1time;
							strmid(RaceInfo[rBest],name, 0, strlen(name), 255);
							BestTime(CurrentRace);
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d",name,reward);
							BroadCast(COLOR_WHITE, string);
							format(string, sizeof(string), "RACENEWS: %s Has Set A New Best Time In %s T: %d:%d:%d", name,CurrentRace,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						else
						{
							format(string, sizeof(string), "RACENEWS: %s Just Won a StreetRace For $%d T: %d:%d:%d", name,reward,cmins,csecs,cmils);
							BroadCast(COLOR_WHITE, string);
						}
						SetPlayerCriminal(playerid,255, "Street Racing",1,1);
						gPlayerMission[playerid] = 2;
						BetWinner(playerid,1);
					}
					else if (gRaceFin == 2)
					{
						DisablePlayerCheckpoint(playerid);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					//	if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/2;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~2nd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						//RaceCheckpointReset();
						DisablePlayerRaceCheckpoint(playerid);
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos3time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos3time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 2nd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
					}
					else if (gRaceFin == 3)
					{
						CheckpointReset();
						RaceCheckpointReset();
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					//	if (gdebug){print("DEBUG RACE OVER");}
						reward = preward/3;
						GetPlayerName(playerid, name, sizeof(name));
						GivePlayerMoney(playerid, reward);
						PlayerPlayMusic(playerid);
						format(string, sizeof(string), "~g~3rd place~n~~w~Your winnings are ~n~~g~$%d", reward);
						DisablePlayerRaceCheckpoint(playerid);
						//RaceCheckpointReset();
						GameTextForPlayer(playerid, string, 5000, 6);
						RaceTime[playerid] = Gtickcount;
						pos2time = RaceTime[playerid] - StartTime[playerid];
						new splittime = pos2time - pos1time;
						ConvertTicks(splittime);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "RACENEWS: %s Just Came 3rd a StreetRace For $%d T: +%d:%d:%d", name,reward,cmins,csecs,cmils);
						BroadCast(COLOR_WHITE, string);
						KillTimer(raceendtimer);
						RaceEnd();
					}
				}
		    }
		    }
	return 1;
}

