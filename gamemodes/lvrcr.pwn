//I
// Game Mode Includes
#include <a_samp>
#include <core>
#include <file>
#include <float>
#include <dprop>
#include <dutils>
#include <dudb>
#include <kihc>
#include <a_irc>


// Uhm..
#pragma dynamic 8192
// Tells Loose Indentation warnings to be quiet
#pragma tabsize 0

// For Beckyboi's Script
#define tram 449
#define shamal 519
// Colour Defines
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xFF0000AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUEVIOLET 0x8A2BE2AA
#define COLOR_DEADCONNECT 0x808080AA
#define COLOR_BLUE 0x0000FFAA
#define COLOR_FORESTGREEN 0x228B22AA
#define COLOR_DODGERBLUE 0x1E90FFAA
#define COLOR_DARKOLIVEGREEN 0x556B2FAA
#define COLOR_ORANGE 0xFFA500AA
#define COLOR_PURPLE 0x800080AA
#define COLOR_ROYALBLUE 0x4169FFAA
#define COLOR_ERROR 0xD2691EAA
// Max Number of pickups (for destroying cash drops)
#define MAX_PICKUPS 156
// Teams
#define TEAM_LAWYER 0
#define TEAM_COP 1
#define TEAM_ARMY 2
#define TEAM_MEDIC 3
#define TEAM_CARFIX 4
#define TEAM_CASSEC 5
#define TEAM_DRIVER 6
#define TEAM_BISTRO 7
#define TEAM_JAILTK 8

#define TEAM_PVTMED 9
#define TEAM_CIVIL 10
#define TEAM_GASDEL 11
#define TEAM_DRGDEL 12
#define TEAM_HITMAN 13
#define TEAM_GUNDEL 14
#define TEAM_SNITCH 15
#define TEAM_RAPIST 16
#define TEAM_BOUNTY 17
#define TEAM_CARJACK 18
// Script Version ( for gamemode text etc)
#define sversion "2.0"


new Float:difc[13][4] = {
{1.13, 0.05, 1.10, 0.0},
{1.13, 2.35, 1.10, 180.0},
{1.13, 4.65, 1.10, 180.0},
{1.13, 1.05, 1.10, 0.0},
{1.13, 3.45, 1.10, 180.0},
{1.13, 5.85, 1.10, 180.0},
{1.13, 0.39, 0.56, 0.0},
{1.13, 2.69, 0.56, 180.0},
{1.13, 4.99, 0.56, 180.0},
{1.13, 0.71, 0.56, 0.0},
{1.13, 3.79, 0.56, 180.0},
{1.13, 6.19, 0.56, 180.0},
{0.00, 0.30, 1.10, 0.0}
};



new aWeaponNames[][32] = {
	{"Unarmed (Fist)"}, // 0
	{"Brass Knuckles"}, // 1
	{"Golf Club"}, // 2
	{"Night Stick"}, // 3
	{"Knife"}, // 4
	{"Baseball Bat"}, // 5
	{"Shovel"}, // 6
	{"Pool Cue"}, // 7
	{"Katana"}, // 8
	{"Chainsaw"}, // 9
	{"Purple Dildo"}, // 10
	{"Big White Vibrator"}, // 11
	{"Medium White Vibrator"}, // 12
	{"Small White Vibrator"}, // 13
	{"Flowers"}, // 14
	{"Cane"}, // 15
	{"Grenade"}, // 16
	{"Teargas"}, // 17
	{"Molotov"}, // 18
	{" "}, // 19
	{" "}, // 20
	{" "}, // 21
	{"Colt 45"}, // 22
	{"Colt 45 (Silenced)"}, // 23
	{"Desert Eagle"}, // 24
	{"Normal Shotgun"}, // 25
	{"Sawnoff Shotgun"}, // 26
	{"Combat Shotgun"}, // 27
	{"Micro Uzi (Mac 10)"}, // 28
	{"MP5"}, // 29
	{"AK47"}, // 30
	{"M4"}, // 31
	{"Tec9"}, // 32
	{"Country Rifle"}, // 33
	{"Sniper Rifle"}, // 34
	{"Rocket Launcher"}, // 35
	{"Heat-Seeking Rocket Launcher"}, // 36
	{"Flamethrower"}, // 37
	{"Minigun"}, // 38
	{"Satchel Charge"}, // 39
	{"Detonator"}, // 40
	{"Spray Can"}, // 41
	{"Fire Extinguisher"}, // 42
	{"Camera"}, // 43
	{"Night Vision Goggles"}, // 44
	{"Infrared Vision Goggles"}, // 45
	{"Parachute"}, // 46
	{"Fake Pistol"} // 47
};


new aDisconnectNames[][16] = {
	{"Crashed"}, // 0
	{"Quit"}, // 1
	{"Kicked/Banned"} // 2
};


// Forwards
forward announcement();
forward WantedYellow();
forward WantedOrange();
forward SendTextTimer();
forward SendBankTimer();
forward SendwebTimer();
forward WantedRed();
forward WantedInnocent();
forward AntiJetpack();
forward AutoUnjail();
forward VisitReqTimer();
forward EscapeCuffsTime();
forward TimeWorld();
forward CashCheck();
forward TheEffectsOfDrugs();
forward TaxiDriverTimer();
forward TaxiPassengerTimer();
forward PlantC4One();
forward PlantC4Two();
forward PlantC4Three();
forward CaligsC4Explode();
forward CaligsRobRestored();
forward CaligsRobExplosionsone();
forward CaligsRobExplosionstwo();
forward CaligsRobExplosionsthree();
forward JailFood();
forward TrashMissionTimer();
forward copshavevctimer();
forward CopBackUpColour();
forward SouthernCopGate();
forward SouthernCopGateClose();
forward WesternCopGate();
forward WesternCopGateClose();
forward WantedLevelReduce();
forward TaxiDriverOffDutyCriminal();
forward fixedcarrecenttimer();
forward CopRefillWaitTimer();
forward AutoUnjailAlcatraz();
forward commitedcrimerecent();
forward HitExpires();
forward GunsDeliveryTimeLimitTimer();
forward UsedBankRecentlyTimer();
forward TriedToEscapePrisone();
forward StoleCopCarRecentTimer();
forward AskedForWeaponsRecent();
forward InfectedPlayerRecent();
forward RapedPlayerRecent();
forward ATMRobbedRecentlyTimer();
forward BankRobbedRecentlyTimer();
forward PlayerRobbedBankRecentTimer();
forward FourDragsRobbedRecent();
forward RedsandsRobbedRecent();
forward CaligsRobbedRecent();
forward LoginTimer();
forward RobbedPlayerRecent();
forward JailCuffs();
forward HandCuffed();
forward RobbedCasinoRecent();
forward HasChlamydia();
forward HasHIV();
forward HasSalmonella();
forward BeenReported();
forward ReqBkRecentTime();
forward SandEngine();
forward FilledGasRecentDealer();
forward KickPlayer();
forward BanPlayer();
forward SoldDrugsRecentDealer();
forward Tazingtime();
forward Tazing();
forward PlayerRobWait(playerid);
forward weaponanti();
forward cashanti();
forward AskedForFoodRecent();
forward SellFoodRecent();
forward ReqMechRecentTime();
forward ArmyPayDay();
forward PolicePayDay();
forward playerbeenrobbedrecent();
forward update_zones();
forward getCheckpointType(playerID);
forward isPlayerInArea(playerID, Float:data[4]);
forward checkpointUpdate();
forward GetPlayerZone(playerid);
forward newcasinorobbedrecent();
forward selectskill();
forward ExplodeShamal(vehicleid);
forward cashdrop();
forward twofoursevenmoveplayer();
forward carrierliftinfotext();
forward destroypickups();
forward robbingstorecountdown();
forward storerobbedrecent();
forward robbingcityhallcountdown();




// Vehicle Variables
new EchoConnection; 			// This will hold the connection ID for messages.
new EchoChan[15] = "#your-channel";	// This is the channel you want your echo to be in, as well as the !say command.
new bool:TimerSet = false;  	// Prevents the timer from being set multiple times.
forward EventTimer();       	// Forward declaration for Event Timer (explained later)
new Connections = 0;
new Float:ShamalPos[MAX_VEHICLES][3];
new sExplode[MAX_VEHICLES], tCount[MAX_VEHICLES];
new BonusCars[MAX_VEHICLES];
new BoughtCars[MAX_VEHICLES];
new BoughtCarsOwner[MAX_VEHICLES];
new SandInEngine[MAX_VEHICLES];
new CarSold[MAX_VEHICLES];
// Other Variables
new RobbedCash[MAX_PLAYERS];
new canselectskill[MAX_PLAYERS];
new gTeam[MAX_PLAYERS];
new Kicking[MAX_PLAYERS];
new Banning[MAX_PLAYERS];
new PlayerRobwwait[MAX_PLAYERS];
new playerCheckpoint[MAX_PLAYERS];
new Jailed[MAX_PLAYERS];
new Tazed[MAX_PLAYERS];
new hastazer[MAX_PLAYERS];
new LawEnforcementRadio[MAX_PLAYERS];
new HasLawEnforcementRadio[MAX_PLAYERS];
new IsSpawned[MAX_PLAYERS];
new ReqBk[MAX_PLAYERS];
new ReqBkRecent[MAX_PLAYERS];
new ReportedRecent[MAX_PLAYERS];
new cuffed[MAX_PLAYERS];
new wantsheal[MAX_PLAYERS];
new wantsmechanic[MAX_PLAYERS];
new RecentAskedMechanic[MAX_PLAYERS];
new RobbedCasRecent[MAX_PLAYERS];
new RobbedPlyRecent[MAX_PLAYERS];
new Chlamydia[MAX_PLAYERS];
new HIV[MAX_PLAYERS];
new RapedPlyRecent[MAX_PLAYERS];
new AbandonedCopCar[MAX_PLAYERS];
new Wantsfood[MAX_PLAYERS];
new InAndrom[MAX_PLAYERS];
new InShamal[MAX_PLAYERS];
new sellfoodrecently[MAX_PLAYERS];
new Salmonella[MAX_PLAYERS];
new askedforfood[MAX_PLAYERS];
new askedforweapons[MAX_PLAYERS];
new Wantsguns[MAX_PLAYERS];
new OfferedGuns[MAX_PLAYERS];
new wantscure[MAX_PLAYERS];
new filleduprecent[MAX_PLAYERS];
new Taxipass[MAX_PLAYERS];
new Muted[MAX_PLAYERS];
new PlayerDrugs[MAX_PLAYERS];
new wantsdrugs[MAX_PLAYERS];
new solddrugsrecent[MAX_PLAYERS];
new JailTime[MAX_PLAYERS];
new JailTimeServed[MAX_PLAYERS];
new StoleCopCarRecent[MAX_PLAYERS];
new playerondrugs[MAX_PLAYERS];
new playertookdrugs[MAX_PLAYERS];
new HasDrugBag[MAX_PLAYERS];
new InfectedPlyRecent[MAX_PLAYERS];
new triedtoescaperecent[MAX_PLAYERS];
new cannotescapejail[MAX_PLAYERS];
new CuffedTime[MAX_PLAYERS];
new CopWaitBetweenRefills[MAX_PLAYERS];
new Frozen[MAX_PLAYERS];
new VisitReq[MAX_PLAYERS];
new EscapedConvict[MAX_PLAYERS];
new InAlcatraz[MAX_PLAYERS];
new VisitReqExpires[MAX_PLAYERS];
new HasHitOnHim[MAX_PLAYERS];
new PLAYERLIST_authed[MAX_PLAYERS];
new BankCash[MAX_PLAYERS];
new HouseCash[MAX_PLAYERS];
new loginchances[MAX_PLAYERS];
new UsedBankRecently[MAX_PLAYERS];
new InBank[MAX_PLAYERS];
new Playerrobbedbankrecent[MAX_PLAYERS];
new InDerby[MAX_PLAYERS];
new commitedcrimerecently[MAX_PLAYERS];
new copshavevc[MAX_PLAYERS];
new fixedcarrecent[MAX_PLAYERS];
new RegularPlayer[MAX_PLAYERS];
new OldCash[MAX_PLAYERS];
new InAdminHQ[MAX_PLAYERS];
new autobahnowner[MAX_PLAYERS];
new houseowner[MAX_PLAYERS];
new Condom[MAX_PLAYERS];
new drunkplayer[MAX_PLAYERS];
new lastcardrove[MAX_PLAYERS];
new InAdminMode[MAX_PLAYERS];
new HasC4[MAX_PLAYERS];
new PlantingC4[MAX_PLAYERS];
new RobbedCaligs[MAX_PLAYERS];
new HasWallet[MAX_PLAYERS];
new Mafia[MAX_PLAYERS];
new TrashDeliveryTime[MAX_PLAYERS];
new TrashDeliveryEarnings[MAX_PLAYERS];
new GunDeliveryLevel[MAX_PLAYERS];
new GunsDeliveryTime[MAX_PLAYERS];
new OnDelMission[MAX_PLAYERS];
new DeliveringGuns[MAX_PLAYERS];
new RobbedBank[MAX_PLAYERS];
new DeliveringCash[MAX_PLAYERS];
new totalcashdelivered[MAX_PLAYERS];
new Driveronduty[MAX_PLAYERS];
new pmsoff[MAX_PLAYERS];
new carwin[MAX_PLAYERS];
new beenrobbedrecently[MAX_PLAYERS];
new canchooseskill[MAX_PLAYERS];
new robberrank[MAX_PLAYERS];
new respect[MAX_PLAYERS];
new teamkiller[MAX_PLAYERS];
new innocentkiller[MAX_PLAYERS];
new lowwantedkiller[MAX_PLAYERS];
new BankRobInsurance[MAX_PLAYERS];
new BankCashReturns[MAX_PLAYERS];
new PlayerWeapon[MAX_PLAYERS][13];
new PlayerAmmo[MAX_PLAYERS][13];
new robbingstore[MAX_PLAYERS];
new robbed[MAX_PLAYERS];
new robbinghall[MAX_PLAYERS];
new havingsex[MAX_PLAYERS];
new CasSecLastPlayerCuffed[MAX_PLAYERS];
new LeftTwoFourSeven[MAX_PLAYERS];
new TimeToMoveTwoFourSeven[MAX_PLAYERS];
new AdminKilled[MAX_PLAYERS];
new HasCried[MAX_PLAYERS];
new PlayerAdminLevel[MAX_PLAYERS];
new GotCopBriberecently[MAX_PLAYERS];
new SpamStrings[MAX_PLAYERS];
new KilledHimself[MAX_PLAYERS];
// More Veriables
new twofoursevenrobbed1 =0;
new twofoursevenrobbed2 =0;
new twofoursevenrobbed3 =0;
new twofoursevenrobbed4 =0;
new twofoursevenrobbed5 =0;
new twofoursevenrobbed6 =0;
new CaligsRobbed =0;
new RedsandsRobbed =0;
new FourDragsRobbed =0;
new newcasinoRobbed =0;
new atmcash1 = 120000; // Amount of Cash in ATM machines on gamemode start
new atmcash2 = 35000;  // Amount of Cash in ATM machines on gamemode start
new atmcash3 = 110000;  // Amount of Cash in ATM machines on gamemode start
new atmcash4 = 350;  // Amount of Cash in ATM machines on gamemode start
new RegisterLoginDisabled =0;
new atmnetworkrobbedrecent =0;
new cityhallrobbedrecent =0;
new BankRobbedRecently =0;
new caligsbeingrobbed =0;
new DerbyOpen =1; // opened
new GateSouthern =0; // closed
new GateWestern =0; // closed
new gametime =12;
new gameday =1;
// More Variables
new bigassplane;
new oscore;
new alkatrazmap;
new carriermap;
new bombdoor;
new westcopgate;
new southcopgate;
new carrierlift;
// Text Draws
//new Text:txtWebAddress;
//new Text:txtScriptVers;
new Text:txtTypeSkill;
new Text:txtTypeSkill1;
new Text:txtTypeSkill2;
new Text:txtTypeSkill3;
new Text:txtTypeSkill4;
new Text:welcome;
new Text:service;
new Text:autoserv;
new Text:webadress;

// For DCMD
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1
#define COLOR_SYSTEM 0x9ACD32AA

stock SystemMsg(playerid,msg[]) {
   if ((IsPlayerConnected(playerid))&&(strlen(msg)>0)) {
       SendClientMessage(playerid,COLOR_SYSTEM,msg);
   }
   return 1;
}

new VehileIDPermessed[] =
{
400,411,412,560,405,401,402,
422,404,426,429,562,603,444,
602,581,589,477,434,458,558,
480,561,481,517
};

// Bonus SULTAN Random spawns
new Float:BonusSULTANSpawn[5][4] =
{
{2076.1135,1326.5652,10.3769,181.6333},
{2245.3894,2046.1937,10.5257,270.6115},
{2534.6006,2021.1525,10.5252,90.6090},
{1633.4686,1268.3292,10.5170,178.6508},
{1635.1515,757.2971,10.5263,181.6984}
};
// Bonus NRG Random spawns
new Float:BonusNRGSpawn[9][4] =
{
{566.3928,824.4446,-22.5606,280.3809},
{-78.8893,1110.5144,19.3145,271.5569},
{-125.9886,2256.1694,27.7319,131.6289},
{-273.1327,2656.1860,62.1982,265.5641},
{1416.1934,2783.1809,10.3855,359.1373},
{2357.7241,2965.8831,30.8918,336.9967},
{2310.1780,1305.1034,67.0384,90.3563},
{2664.0305,746.5262,14.3100,86.5391},
{1205.7609,668.1885,10.1378,80.7610}
};
// Arrested random jail spawns
new Float:ArrestedSpawn[3][4] =
{
{198.1349,162.0804,1003.0300,24.3831},
{198.1261,174.6805,1003.0234,209.8438},
{193.7771,175.3129,1003.0234,337.1648}
};
// Alcatraz random jail spawns
new Float:AlcatrazArrestedSpawn[3][4] =
{
{219.5959,110.5754,999.0156,329.5980},
{223.3139,111.6365,999.0156,181.6979},
{227.4478,110.4877,999.0156,335.7287}
};
// Random Civilian Spawns
new Float:SpawnPoints[20][4] =
{
{2352.9812,1001.9236,10.8203,87.6178},
{2417.9851,1114.8572,10.8125,270.2919},
{2445.8699,1279.4567,10.8061,182.7706},
{2490.9990,1433.9799,10.8203,205.3045},
{2443.8264,1654.3289,10.8203,227.9582},
{1697.6488,1456.3223,10.7665,275.0996},
{1891.6893,2314.0139,10.8203,277.7439},
{1947.0715,2437.2217,10.8203,205.5250},
{2092.6616,2479.8145,10.8203,173.1116},
{2091.4067,2070.9500,10.8203,268.8218},
{2185.9917,2001.2933,10.8203,88.6423},
{2031.9304,1918.0876,12.3359,270.1340},
{1952.1302,2655.0112,10.8203,180.1662},
{994.6838,1985.7472,11.0389,272.6347},
{955.9548,1730.4478,8.6484,272.9977},
{-88.9428,1362.8306,10.2734,271.5778},
{-97.2324,1088.1873,19.7500,353.0189},
{-306.0002,1303.2164,53.6584,307.6807},
{-333.2935,1531.8217,75.3594,181.2123},
{-26.6790,2345.7227,24.1406,176.3719}
};

// CheckPoint Define, (some are not used but I couldnt be bothered taking them out)
#define CP_STATION1   0
#define CP_STATION2   1
#define CP_STATION3   2
#define CP_STATION4   3
#define CP_STATION5   4
#define CP_STATION6   5
#define CP_STATION7   6
#define CP_STATION8   7
#define CP_STATION9   8
#define CP_STATION10  9
#define CP_STATION11  10
#define CP_STATION12  11
#define CP_STATION13  12
#define CP_STATION14  13
#define CP_STATION15  14
#define CP_STATION16  15
#define CP_AIRCOPS1   16
#define CP_LVAPORT1   17
#define CP_LVADMIN1   18
#define CP_LVCARSELL  19
#define CP_LVADMINEX  20
#define CP_FOURDRAGS  21
#define CP_CALIGS     22
#define CP_REDSANDS   23
#define CP_HOSPLV     24
#define CP_BANCPCAR   25
#define CP_LVDRGHSE   26
#define CP_ATM247     27
#define CP_ATMAMUSTH  28
#define CP_ATMWHITE   29
#define CP_ATMROCEST  30
#define CP_BANKMAIN   31
#define CP_BANKMAINX  32
#define CP_BANKBUSNES 33
#define CP_LVPDARMSDE 34
#define CP_ALKATRAZ1  35
#define CP_ALKATRAZ2  36
#define CP_BLKFSTAD   37
#define CP_BLKFSTADX  38
#define CP_LVPDCCAM3  39
#define CP_LVPDCCAM2  40
#define CP_LVPDCCAM1  41
#define CP_ADMINBAR   42
#define CP_PDGIVEUP   43
#define CP_8BALLSUP   44
#define CP_CALIGPLNT  45
#define CP_247CP1     46
#define CP_TRASHPICKUP1 47
#define CP_TRASHPICKUP2 48
#define CP_TRASHPICKUP3 49
#define CP_TRASHPICKUP4 50
#define CP_TRASHPICKUP5 51
#define CP_TRASHPICKUP6 52
#define CP_TRASHPICKUP7 53
#define CP_TRASHPICKUP8 54
#define CP_TRASHPICKUP9 55
#define CP_TRASHPICKUP10 56
#define CP_TRASHPICKUP11 57
#define CP_GUNDELIVERY1  58
#define CP_GUNDELIVERY2  59
#define CP_GUNDELIVERY3  60
#define CP_GUNDELIVERY4  61
#define CP_GUNDELIVERY5  62
#define CP_GUNDELIVERY6  63
#define CP_GUNDELIVERY7  64
#define CP_GUNDELIVERY8  65
#define CP_GUNDELIVERY9  66
#define CP_GUNDELIVERY10  67
#define CP_GUNDELIVERY11  68
#define CP_GUNDELIVERY12  69
#define CP_GUNDELIVERY13  70
#define CP_GUNDELIVERY14  71
#define CP_WINCARADMINHQ  72
#define CP_CASHDELPICKUP  73
#define CP_CASHDELATM1    74
#define CP_CASHDELATM2    75
#define CP_CASHDELATM3    76
#define CP_CASHDELATM4    77
#define CP_CASHDELEND     78
#define CP_JOHNNYCASENTR    79
#define CP_REDSANDSEXIT   80
#define CP_CITYHALLENTER  81
#define CP_CITYHALLMAIN   82
#define CP_247REDSANDS    83
#define CP_247EMERALD     84
#define CP_247SEASTLV     85
#define CP_247SOUTHLV     86
#define CP_247BONECOUN    87
#define CP_247SPINYBED    88
#define CP_ROBCITYHALL    89
#define CP_BIGASSPLANE    90
#define CP_AUTOBAHN1    91


#define MAX_POINTS 92

new Float:checkCoords[MAX_POINTS][4] = {
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Not Used
{1658.02, 1279.851, 1771.26, 1705.338}, // Las Venturas Airport Teriminal
{2059.8872, 1202.8521, 2120.8960, 1302.8754}, // Admin HQ
{2040.695, 1395.893, 2204.698, 1492.594}, // AutoBahn Selling Checkpoint
{-2646.0603, 1402.8860, -2634.2737, 1411.6195}, // Admin HQ Exit
{1926.6289, 1004.3832, 2017.2037, 1031.9709}, // Four Dragons Casino robbing point
{2141.2183, 1629.5417, 2147.1643, 1642.7115}, // Caligulas Vault Rob checkpoint
{1137.0602, -11.2906, 1142.6293, 3.0941}, // Redsands Robbing point
{1533.065, 1713.074, 1654.115, 1879.401}, // LV hospital
{2657.661, 575.8629, 2813.854, 699.641}, // Abandoned cop car
{2329.653, 633.8839, 2478.038, 800.2107}, // LV Drug house
{2126.601, 1937.422, 2224.223, 2018.651}, // ATM at 24/7 at Starfish casino
{2181.269, 927.8569, 2243.747, 997.4821}, // ATM at Ammunation south LV
{1068.388, 2026.388, 1181.628, 2119.221}, // Whitewood Estates atm
{2466.323, 2223.659, 2599.088, 2347.437}, // ATM Roca escalante
{2306.224, 1527.407, 2407.75, 1577.692}, // LV City Bank entry
{2304.9456, -17.3404, 2313.7649, -13.2493}, // LV City Bank exit
{2314.5757, -17.2502, 2317.1465, -0.1237}, // LV City bank main business
{2221.0667, 2448.5840, 2260.7422, 2487.7661}, // LVPD Weapons refill
{3539.1328, 382.3327, 4085.4063, 560.8972}, // Alcatraz Entry
{240.1793, 107.4361, 252.6249, 126.7327}, // Alcatraz Exit
{998.1006, 1384.289, 1201.153, 1805.908}, // blackfield stadium entry
{-1426.2727, 928.1482, -1421.1447, 938.1354}, // blackfield stadium exit
{191.9815, 177.5239, 195.3998, 180.5036}, // lvpd cell camera 3
{196.1084, 177.4886, 200.0713, 180.7824}, // lvpd cell camera 2
{195.9898, 156.5928, 200.1871, 159.8862}, // lvpd cell camera 1
{965.4654, -49.4240, 971.9686, -43.0032}, // Admin HQ Bar
{228.7872, 141.2361, 249.2870, 168.5767}, // lvpd hand yourself in
{2002.7880, 2317.5369, 2016.6089, 2332.7124}, // 8 ball c4 supply
{2129.9563, 1607.1721, 2158.4114, 1625.4816}, // caligs plant bomb
{-35.3856, -57.9658, -17.7096, -49.0101}, // 24 7 cpoint
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 1
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 2
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 3
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 4
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 5
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 6
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 7
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 8
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 9
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 10
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // Trash Pickup 11
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 1 pick
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission1 drop
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 2 pick
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 2 drop
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 3 pick
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 3 drop
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 4 pick
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 4 drop
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 5 pick
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 5 drop
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 6 pick
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 6 drop
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 7 pick
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // gundel mission 7 drop
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // wincaradminhq
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // cashdel cash pickup
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // cashdel cash atm1
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // cashdel cash atm2
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // cashdel cash atm3
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // cashdel cash atm4
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // cashdel van back to base
{2040.695, 1306.927, 2110.982, 1357.212}, // extra casino entry on the strip
{1130.4017, -11.2694,1135.5321, -3.8149}, // redsands new exit
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // city hall lv entry
{4446.9814, 1987.1090, 4453.0605, 1992.0865}, // city hall main
{1562.7677, 2169.2029, 1616.5474, 2242.2063}, // 247 redsands
{2158.1504, 2448.4175, 2215.2781, 2495.0105}, // 247 emerald
{2618.1211, 1062.8726, 2657.2705, 1142.5107}, // 247 south east lv
{2097.0437, 883.9355, 2137.2776, 963.3201}, // south lv
{580.282, 1670.526, 689.6177, 1763.359}, // 247 bone county
{2115.3542, 2708.7834, 2172.6797, 2777.5857}, // 247 spiny bed
{351.3314, 196.9337, 368.2675,217.0970}, // robcityhall
{311.4730, 975.7504, 320.0443,1038.1334}, // bigassplane
{2200.764404, 1394.480590, 11.062500} //autobahn
};

new Float:checkpoints[MAX_POINTS][4] = {
{2109.2126,917.5845,10.8203,5.0}, // Not Used
{2640.1831,1103.9224,10.8203,5.0}, // Not Used
{611.8934,1694.7921,6.7193,5.0}, // Not Used
{2256.1350,538.3187,-0.6582,10.0}, // Not Used
{-2413.7427,975.9317,45.0031,5.0}, // Not Used
{-1672.3597,414.2950,6.8866,5.0}, // Not Used
{-2244.1365,-2560.6294,31.6276,5.0}, // Not Used
{-1603.0166,-2709.3589,48.2419,5.0}, // Not Used
{1939.3275,-1767.6813,13.2787,5.0}, // Not Used
{-94.7651,-1174.8079,1.9979,5.0}, // Not Used
{1381.6699,462.6467,19.8540,5.0}, // Not Used
{657.8167,-559.6507,16.0630,5.0}, // Not Used
{-1478.2916,1862.8318,32.3617,5.0}, // Not Used
{2147.3054,2744.9377,10.5263,5.0}, // Not Used
{2204.9602,2480.3494,10.5278,5.0}, // Not Used
{1289.5997,1395.4048,10.8203,15.0}, // Not Used
{1319.7441,1253.7612,10.8203,5.0}, // Not Used
{1674.9529,1448.5413,10.7888,5.0},
{2085.2048,1263.1144,10.8203,5.0},
{2169.4319,1416.0619,10.8203,4.0},
{-2635.6731,1409.0873,906.4647,4.0},
{1940.3857,1017.9068,992.4688,2.5},
{2144.1042,1641.3715,993.5761,2.0},
{1142.1212,1.1375,1000.6797,2.5},
{1606.8721,1817.9978,10.8203,2.5},
{2788.3975,610.5909,10.8984,2.5},
{2449.3792,713.8478,11.4683,2.5},
{2193.1570,1974.6671,12.2894,1.5},
{2232.1321,959.2865,10.8203,1.5},
{1138.4005,2088.2024,11.0625,1.5},
{2540.5017,2266.1240,10.8203,1.5},
{2355.5588,1544.2212,10.8203,3.5},
{2306.5139,-15.4770,26.7496,2.5},
{2316.2385,-7.2282,26.7422,2.5},
{2234.7769,2458.9241,-7.4531,5.0},
{3795.7554,460.2423,33.9047,5.0},
{245.9921,108.6929,1003.2188,2.0},
{1099.5044,1601.8444,12.5469,5.0},
{-1424.0109,928.2040,1036.3948,2.0},
{193.8661,179.1723,1003.0234,1.0},
{198.0848,179.2339,1003.0303,1.0},
{198.0195,158.5698,1003.0234,1.0},
{968.8552,-46.3709,1001.1172,2.0},
{236.0950,166.4925,1003.0300,3.0},
{2003.6357,2319.0925,10.8203,4.0},
{2144.1226,1624.3165,993.6882,1.0},
{-22.5446,-55.6001,1003.5469,3.0},
{2581.4673,2148.2505,10.8203,5.0},
{2062.6243,2238.9121,10.1745,5.0},
{2297.3096,1567.2032,10.8203,5.0},
{2121.1802,1232.1056,10.8203,5.0},
{2198.5732,937.0938,10.8203,5.0},
{2049.3103,658.2263,11.3006,5.0},
{1654.0845,1080.9868,10.8203,5.0},
{1286.5367,1252.1665,10.8203,5.0},
{824.2954,856.6764,12.0343,5.0},
{-1689.0303,683.4731,21.7940,5.0},
{-1808.2322,-1649.6141,23.6609,5.0},
{2197.8586,938.6444,10.8203,5.0},
{1364.3669,-1282.7325,13.5469,5.0},
{1423.3719,-1292.6678,13.5592,5.0},
{2385.1118,-2009.9146,13.5537,5.0},
{-61.5190,-1112.0059,1.0781,5.0},
{-2096.9539,-2459.4238,30.6250,5.0},
{-2628.5117,211.4568,4.5494,5.0},
{-1591.4674,716.4246,-5.2422,5.0},
{-1247.3684,455.1923,7.1875,5.0},
{275.5387,1957.8539,17.6406,5.0},
{219.3790,1862.9003,13.1470,5.0},
{1271.0192,1324.8730,10.8130,5.0},
{1272.1927,1360.7340,10.8130,5.0},
{2293.2915,2468.5918,10.8203,5.0},
{2090.0583,1314.2783,10.8203,4.0},
{2355.3962,1603.7089,10.8203,5.0},
{1135.3522,2087.9800,11.0625,5.0},
{2537.2380,2266.7944,10.8203,5.0},
{2193.0132,1968.3802,10.8203,5.0},
{2229.6580,959.3417,10.8203,5.0},
{2378.7620,1609.4525,10.6719,5.0},
{2085.3196,1333.9230,10.8750,5.0},
{1132.9811,-12.0000,1000.6797,2.0},
{2446.1379,2376.3525,12.1635,5.0},
{361.8299,173.5716,1008.3828,2.5},
{1599.9943,2220.9233,11.0625,4.0},
{2189.4114,2469.1099,11.2422,4.0},
{2637.3494,1127.8949,11.1797,4.0},
{2117.3906,898.2151,11.1797,4.0},
{662.1166,1717.9940,7.1875,4.0},
{2151.1006,2735.6091,11.1763,4.0},
{356.7246,215.6280,1008.3828,3.0},
{315.9641,1033.0465,1946.4037,4.5},
{2200.371337, 1394.261230, 11.062500}
};
 
#define MAX_PLAYERS_ 40

// ZONES
enum zoneinfo {
	zone_name[27],
    Float:zone_minx,
    Float:zone_miny,
    Float:zone_minz,
    Float:zone_maxx,
    Float:zone_maxy,
    Float:zone_maxz
}

// Makabos zones script
new Float:zones[][zoneinfo] = {
{ "LV Drug House (Int)",     2363.7732,  -1135.5873,    1050.8750,  2366.7190,  -1125.8083,  1050.8826},
{ "Alcatraz",                3539.1328,  382.3327,    -5.0000,  4085.4063,  560.8972,   500.5000},
{ "Alcatraz (Int)",          240.3424,  107.4418,    998.0156,  260.3839,  119.8392,   1008.8303},
{ "Alcatraz (Int)",          213.9791,  107.4416,    999.0100,  229.0557,  116.0217,   999.0180},
{ "Lv City Bank",            2333.6050,  1538.5920,    9.0184,  2420.1487, 1607.1777,   500.5000},
{ "Lv City Bank (Int)",      2306.0767,  -17.3174,    26.5496,  2317.1667, -0.1374,   26.7696},
{ "Admin HQ",    2082.1758,  1203.3190,    6.0203,  2125.7268, 1278.4438,   500.5000},
{ "Ndriqimi's Casino",           2078.8538,  1306.0410,    9.0203,  2114.8035, 1364.4226,   500.5000},
{ "AutoBahn",       		 2087.7778,  1384.0966,    9.0203,  2203.1501, 1440.7141,   500.5000},
{ "AutoBahn Lane",       	 2184.8328,  1447.0826,    9.0203,  2195.3687, 1522.7858,   500.5000},
{ "LV MultiStory",       	 2257.6921,  1383.5364,    9.0203,  2357.7520, 1523.2224,   500.5000},
{ "LV Pyramid",       	     2237.4563,  1205.2041,    9.0203,  2416.4814, 1362.8427,   500.5000},
{ "LV City Hall",       	 2354.4023,  1079.9636,    9.0203,  2420.8870, 1186.4084,   500.5000},
{ "LV Transfender",       	 2352.2302,  956.4175,    9.0203,  2421.1843, 1066.9310,   500.5000},
{ "SE LV Gas Station",       2617.8508,  1062.8749,    9.0203,  2657.1074, 1142.5132,   500.5000},
{ "Casino Security",       	 1878.7798,  944.3989,    9.0203,  1923.6537, 966.3892,   500.5000},
{ "Four Dragons Casino",     1878.7661,  970.0151,    9.0203,  2035.9320, 1082.8287,   500.5000},
{ "The Strip [South]",       2037.4653,  863.7079,    4.0203,  2076.8149, 1702.8253,   500.5000},
{ "Caligulas Casino",        2087.7002,  1543.7769,   9.8203,  2317.1528, 1763.7645,   500.5000},
{ "Admin HQ (Int)",        	 956.4382,  -61.9423,   1000.1172,  964.4373, -43.0153,   1003.5865},
{ "Admin HQ (Int) Bar",      965.8417,  -49.4062,   1000.1172,  971.5218, -43.1668,   1003.5865},
{ "Bedroom",          		 943.2505,  -48.6990,   1000.1172,  948.3954, -40.9521,   1003.5865},
{ "LVPD HQ",                 2234.2024, 2419.3340,    -8.4531,  2360.7454,  2507.3718,   500.5000},
{ "LV Aircraft Carrier",     2782.5579,  441.7090,    -5.0000,  3166.1729,  520.0420,   500.5000},
{ "24/7 store",              -36.6344,  -57.9175,    1003.3469, -17.3938,  -48.9887,   1003.8469},
{ "The Big Ear",                -410.00,  1403.30,    -3.00,  -137.90,  1681.20,   200.00},
{ "Aldea Malvada",               -1372.10,  2498.50,     0.00, -1277.50,  2615.30,   200.00},
{ "Angel Pine",                  -2324.90, -2584.20,    -6.10, -1964.20, -2212.10,   200.00},
{ "Arco del Oeste",               -901.10,  2221.80,     0.00,  -592.00,  2571.90,   200.00},
{ "Avispa Country Club",         -2646.40,  -355.40,     0.00, -2270.00,  -222.50,   200.00},
{ "Avispa Country Club",         -2831.80,  -430.20,    -6.10, -2646.40,  -222.50,   200.00},
{ "Avispa Country Club",         -2361.50,  -417.10,     0.00, -2270.00,  -355.40,   200.00},
{ "Avispa Country Club",         -2667.80,  -302.10,   -28.80, -2646.40,  -262.30,    71.10},
{ "Avispa Country Club",         -2470.00,  -355.40,     0.00, -2270.00,  -318.40,    46.10},
{ "Avispa Country Club",         -2550.00,  -355.40,     0.00, -2470.00,  -318.40,    39.70},
{ "Back o Beyond",               -1166.90, -2641.10,     0.00,  -321.70, -1856.00,   200.00},
{ "Battery Point",               -2741.00,  1268.40,    -4.50, -2533.00,  1490.40,   200.00},
{ "Bayside",                     -2741.00,  2175.10,     0.00, -2353.10,  2722.70,   200.00},
{ "Bayside Marina",              -2353.10,  2275.70,     0.00, -2153.10,  2475.70,   200.00},
{ "Beacon Hill",                  -399.60, -1075.50,    -1.40,  -319.00,  -977.50,   198.50},
{ "Blackfield",                    964.30,  1203.20,   -89.00,  1197.30,  1403.20,   110.90},
{ "Blackfield",                    964.30,  1403.20,   -89.00,  1197.30,  1726.20,   110.90},
{ "Blackfield Chapel",            1375.60,   596.30,   -89.00,  1558.00,   823.20,   110.90},
{ "Blackfield Chapel",            1325.60,   596.30,   -89.00,  1375.60,   795.00,   110.90},
{ "Blackfield Intersection",      1197.30,  1044.60,   -89.00,  1277.00,  1163.30,   110.90},
{ "Blackfield Intersection",      1166.50,   795.00,   -89.00,  1375.60,  1044.60,   110.90},
{ "Blackfield Intersection",      1277.00,  1044.60,   -89.00,  1315.30,  1087.60,   110.90},
{ "Blackfield Intersection",      1375.60,   823.20,   -89.00,  1457.30,   919.40,   110.90},
{ "Blueberry",                     104.50,  -220.10,     2.30,   349.60,   152.20,   200.00},
{ "Blueberry",                      19.60,  -404.10,     3.80,   349.60,  -220.10,   200.00},
{ "Blueberry Acres",              -319.60,  -220.10,     0.00,   104.50,   293.30,   200.00},
{ "Calton Heights",              -2274.10,   744.10,    -6.10, -1982.30,  1358.90,   200.00},
{ "Chinatown",                   -2274.10,   578.30,    -7.60, -2078.60,   744.10,   200.00},
{ "Commerce",                     1323.90, -1842.20,   -89.00,  1701.90, -1722.20,   110.90},
{ "Commerce",                     1323.90, -1722.20,   -89.00,  1440.90, -1577.50,   110.90},
{ "Commerce",                     1370.80, -1577.50,   -89.00,  1463.90, -1384.90,   110.90},
{ "Commerce",                     1463.90, -1577.50,   -89.00,  1667.90, -1430.80,   110.90},
{ "Commerce",                     1583.50, -1722.20,   -89.00,  1758.90, -1577.50,   110.90},
{ "Commerce",                     1667.90, -1577.50,   -89.00,  1812.60, -1430.80,   110.90},
{ "Conference Center",            1046.10, -1804.20,   -89.00,  1323.90, -1722.20,   110.90},
{ "Conference Center",            1073.20, -1842.20,   -89.00,  1323.90, -1804.20,   110.90},
{ "Cranberry Station",           -2007.80,    56.30,     0.00, -1922.00,   224.70,   100.00},
{ "Class Selection",           942.5793,    0.2095,     1000.9295, 947.4127,   4.8616,   1000.9299},
{ "Creek",                        2749.90,  1937.20,   -89.00,  2921.60,  2669.70,   110.90},
{ "Dillimore",                     580.70,  -674.80,    -9.50,   861.00,  -404.70,   200.00},
{ "Doherty",                     -2270.00,  -324.10,    -0.00, -1794.90,  -222.50,   200.00},
{ "Doherty",                     -2173.00,  -222.50,    -0.00, -1794.90,   265.20,   200.00},
{ "Downtown",                    -1982.30,   744.10,    -6.10, -1871.70,  1274.20,   200.00},
{ "Downtown",                    -1871.70,  1176.40,    -4.50, -1620.30,  1274.20,   200.00},
{ "Downtown",                    -1700.00,   744.20,    -6.10, -1580.00,  1176.50,   200.00},
{ "Downtown",                    -1580.00,   744.20,    -6.10, -1499.80,  1025.90,   200.00},
{ "Downtown",                    -2078.60,   578.30,    -7.60, -1499.80,   744.20,   200.00},
{ "Downtown",                    -1993.20,   265.20,    -9.10, -1794.90,   578.30,   200.00},
{ "Downtown Los Santos",          1463.90, -1430.80,   -89.00,  1724.70, -1290.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1430.80,   -89.00,  1812.60, -1250.90,   110.90},
{ "Downtown Los Santos",          1463.90, -1290.80,   -89.00,  1724.70, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1384.90,   -89.00,  1463.90, -1170.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1250.90,   -89.00,  1812.60, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1170.80,   -89.00,  1463.90, -1130.80,   110.90},
{ "Downtown Los Santos",          1378.30, -1130.80,   -89.00,  1463.90, -1026.30,   110.90},
{ "Downtown Los Santos",          1391.00, -1026.30,   -89.00,  1463.90,  -926.90,   110.90},
{ "Downtown Los Santos",          1507.50, -1385.20,   110.90,  1582.50, -1325.30,   335.90},
{ "East Beach",                   2632.80, -1852.80,   -89.00,  2959.30, -1668.10,   110.90},
{ "East Beach",                   2632.80, -1668.10,   -89.00,  2747.70, -1393.40,   110.90},
{ "East Beach",                   2747.70, -1668.10,   -89.00,  2959.30, -1498.60,   110.90},
{ "East Beach",                   2747.70, -1498.60,   -89.00,  2959.30, -1120.00,   110.90},
{ "East Los Santos",              2421.00, -1628.50,   -89.00,  2632.80, -1454.30,   110.90},
{ "East Los Santos",              2222.50, -1628.50,   -89.00,  2421.00, -1494.00,   110.90},
{ "East Los Santos",              2266.20, -1494.00,   -89.00,  2381.60, -1372.00,   110.90},
{ "East Los Santos",              2381.60, -1494.00,   -89.00,  2421.00, -1454.30,   110.90},
{ "East Los Santos",              2281.40, -1372.00,   -89.00,  2381.60, -1135.00,   110.90},
{ "East Los Santos",              2381.60, -1454.30,   -89.00,  2462.10, -1135.00,   110.90},
{ "East Los Santos",              2462.10, -1454.30,   -89.00,  2581.70, -1135.00,   110.90},
{ "Easter Basin",                -1794.90,   249.90,    -9.10, -1242.90,   578.30,   200.00},
{ "Easter Basin",                -1794.90,   -50.00,    -0.00, -1499.80,   249.90,   200.00},
{ "Easter Bay Airport",          -1499.80,   -50.00,    -0.00, -1242.90,   249.90,   200.00},
{ "Easter Bay Airport",          -1794.90,  -730.10,    -3.00, -1213.90,   -50.00,   200.00},
{ "Easter Bay Airport",          -1213.90,  -730.10,     0.00, -1132.80,   -50.00,   200.00},
{ "Easter Bay Airport",          -1242.90,   -50.00,     0.00, -1213.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1213.90,   -50.00,    -4.50,  -947.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1315.40,  -405.30,    15.40, -1264.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1354.30,  -287.30,    15.40, -1315.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1490.30,  -209.50,    15.40, -1264.40,  -148.30,    25.40},
{ "Easter Bay Chemicals",        -1132.80,  -768.00,     0.00,  -956.40,  -578.10,   200.00},
{ "Easter Bay Chemicals",        -1132.80,  -787.30,     0.00,  -956.40,  -768.00,   200.00},
{ "El Castillo del Diablo",       -464.50,  2217.60,     0.00,  -208.50,  2580.30,   200.00},
{ "El Castillo del Diablo",       -208.50,  2123.00,    -7.60,   114.00,  2337.10,   200.00},
{ "El Castillo del Diablo",       -208.50,  2337.10,     0.00,     8.40,  2487.10,   200.00},
{ "El Corona",                    1812.60, -2179.20,   -89.00,  1970.60, -1852.80,   110.90},
{ "El Corona",                    1692.60, -2179.20,   -89.00,  1812.60, -1842.20,   110.90},
{ "El Quebrados",                -1645.20,  2498.50,     0.00, -1372.10,  2777.80,   200.00},
{ "Esplanade East",              -1620.30,  1176.50,    -4.50, -1580.00,  1274.20,   200.00},
{ "Esplanade East",              -1580.00,  1025.90,    -6.10, -1499.80,  1274.20,   200.00},
{ "Esplanade East",              -1499.80,   578.30,   -79.60, -1339.80,  1274.20,    20.30},
{ "Esplanade North",             -2533.00,  1358.90,    -4.50, -1996.60,  1501.20,   200.00},
{ "Esplanade North",             -1996.60,  1358.90,    -4.50, -1524.20,  1592.50,   200.00},
{ "Esplanade North",             -1982.30,  1274.20,    -4.50, -1524.20,  1358.90,   200.00},
{ "Fallen Tree",                  -792.20,  -698.50,    -5.30,  -452.40,  -380.00,   200.00},
{ "Fallow Bridge",                 434.30,   366.50,     0.00,   603.00,   555.60,   200.00},
{ "Fern Ridge",                    508.10,  -139.20,     0.00,  1306.60,   119.50,   200.00},
{ "Financial",                   -1871.70,   744.10,    -6.10, -1701.30,  1176.40,   300.00},
{ "Fisher's Lagoon",              1916.90,  -233.30,  -100.00,  2131.70,    13.80,   200.00},
{ "Flint Intersection",           -187.70, -1596.70,   -89.00,    17.00, -1276.60,   110.90},
{ "Flint Range",                  -594.10, -1648.50,     0.00,  -187.70, -1276.60,   200.00},
{ "Fort Carson",                  -376.20,   826.30,    -3.00,   123.70,  1220.40,   200.00},
{ "Foster Valley",               -2270.00,  -430.20,    -0.00, -2178.60,  -324.10,   200.00},
{ "Foster Valley",               -2178.60,  -599.80,    -0.00, -1794.90,  -324.10,   200.00},
{ "Foster Valley",               -2178.60, -1115.50,     0.00, -1794.90,  -599.80,   200.00},
{ "Foster Valley",               -2178.60, -1250.90,     0.00, -1794.90, -1115.50,   200.00},
{ "Frederick Bridge",             2759.20,   296.50,     0.00,  2774.20,   594.70,   200.00},
{ "Gant Bridge",                 -2741.40,  1659.60,    -6.10, -2616.40,  2175.10,   200.00},
{ "Gant Bridge",                 -2741.00,  1490.40,    -6.10, -2616.40,  1659.60,   200.00},
{ "Ganton",                       2222.50, -1852.80,   -89.00,  2632.80, -1722.30,   110.90},
{ "Ganton",                       2222.50, -1722.30,   -89.00,  2632.80, -1628.50,   110.90},
{ "Garcia",                      -2411.20,  -222.50,    -0.00, -2173.00,   265.20,   200.00},
{ "Garcia",                      -2395.10,  -222.50,    -5.30, -2354.00,  -204.70,   200.00},
{ "Garver Bridge",               -1339.80,   828.10,   -89.00, -1213.90,  1057.00,   110.90},
{ "Garver Bridge",               -1213.90,   950.00,   -89.00, -1087.90,  1178.90,   110.90},
{ "Garver Bridge",               -1499.80,   696.40,  -179.60, -1339.80,   925.30,    20.30},
{ "Glen Park",                    1812.60, -1449.60,   -89.00,  1996.90, -1350.70,   110.90},
{ "Glen Park",                    1812.60, -1100.80,   -89.00,  1994.30,  -973.30,   110.90},
{ "Glen Park",                    1812.60, -1350.70,   -89.00,  2056.80, -1100.80,   110.90},
{ "Green Palms",                   176.50,  1305.40,    -3.00,   338.60,  1520.70,   200.00},
{ "Greenglass College",            964.30,  1044.60,   -89.00,  1197.30,  1203.20,   110.90},
{ "Greenglass College",            964.30,   930.80,   -89.00,  1166.50,  1044.60,   110.90},
{ "Hampton Barns",                 603.00,   264.30,     0.00,   761.90,   366.50,   200.00},
{ "Hankypanky Point",             2576.90,    62.10,     0.00,  2759.20,   385.50,   200.00},
{ "Harry Gold Parkway",           1777.30,   863.20,   -89.00,  1817.30,  2342.80,   110.90},
{ "Hashbury",                    -2593.40,  -222.50,    -0.00, -2411.20,    54.70,   200.00},
{ "Hilltop Farm",                  967.30,  -450.30,    -3.00,  1176.70,  -217.90,   200.00},
{ "Hunter Quarry",                 337.20,   710.80,  -115.20,   860.50,  1031.70,   203.70},
{ "Idlewood",                     1812.60, -1852.80,   -89.00,  1971.60, -1742.30,   110.90},
{ "Idlewood",                     1812.60, -1742.30,   -89.00,  1951.60, -1602.30,   110.90},
{ "Idlewood",                     1951.60, -1742.30,   -89.00,  2124.60, -1602.30,   110.90},
{ "Idlewood",                     1812.60, -1602.30,   -89.00,  2124.60, -1449.60,   110.90},
{ "Idlewood",                     2124.60, -1742.30,   -89.00,  2222.50, -1494.00,   110.90},
{ "Idlewood",                     1971.60, -1852.80,   -89.00,  2222.50, -1742.30,   110.90},
{ "Jefferson",                    1996.90, -1449.60,   -89.00,  2056.80, -1350.70,   110.90},
{ "Jefferson",                    2124.60, -1494.00,   -89.00,  2266.20, -1449.60,   110.90},
{ "Jefferson",                    2056.80, -1372.00,   -89.00,  2281.40, -1210.70,   110.90},
{ "Jefferson",                    2056.80, -1210.70,   -89.00,  2185.30, -1126.30,   110.90},
{ "Jefferson",                    2185.30, -1210.70,   -89.00,  2281.40, -1154.50,   110.90},
{ "Jefferson",                    2056.80, -1449.60,   -89.00,  2266.20, -1372.00,   110.90},
{ "Julius Thruway East",          2623.10,   943.20,   -89.00,  2749.90,  1055.90,   110.90},
{ "Julius Thruway East",          2685.10,  1055.90,   -89.00,  2749.90,  2626.50,   110.90},
{ "Julius Thruway East",          2536.40,  2442.50,   -89.00,  2685.10,  2542.50,   110.90},
{ "Julius Thruway East",          2625.10,  2202.70,   -89.00,  2685.10,  2442.50,   110.90},
{ "Julius Thruway North",         2498.20,  2542.50,   -89.00,  2685.10,  2626.50,   110.90},
{ "Julius Thruway North",         2237.40,  2542.50,   -89.00,  2498.20,  2663.10,   110.90},
{ "Julius Thruway North",         2121.40,  2508.20,   -89.00,  2237.40,  2663.10,   110.90},
{ "Julius Thruway North",         1938.80,  2508.20,   -89.00,  2121.40,  2624.20,   110.90},
{ "Julius Thruway North",         1534.50,  2433.20,   -89.00,  1848.40,  2583.20,   110.90},
{ "Julius Thruway North",         1848.40,  2478.40,   -89.00,  1938.80,  2553.40,   110.90},
{ "Julius Thruway North",         1704.50,  2342.80,   -89.00,  1848.40,  2433.20,   110.90},
{ "Julius Thruway North",         1377.30,  2433.20,   -89.00,  1534.50,  2507.20,   110.90},
{ "Julius Thruway South",         1457.30,   823.20,   -89.00,  2377.30,   863.20,   110.90},
{ "Julius Thruway South",         2377.30,   788.80,   -89.00,  2537.30,   897.90,   110.90},
{ "Julius Thruway West",          1197.30,  1163.30,   -89.00,  1236.60,  2243.20,   110.90},
{ "Julius Thruway West",          1236.60,  2142.80,   -89.00,  1297.40,  2243.20,   110.90},
{ "Juniper Hill",                -2533.00,   578.30,    -7.60, -2274.10,   968.30,   200.00},
{ "Juniper Hollow",              -2533.00,   968.30,    -6.10, -2274.10,  1358.90,   200.00},
{ "K.A.C.C. Military Fuels",      2498.20,  2626.50,   -89.00,  2749.90,  2861.50,   110.90},
{ "Kincaid Bridge",              -1339.80,   599.20,   -89.00, -1213.90,   828.10,   110.90},
{ "Kincaid Bridge",              -1213.90,   721.10,   -89.00, -1087.90,   950.00,   110.90},
{ "Kincaid Bridge",              -1087.90,   855.30,   -89.00,  -961.90,   986.20,   110.90},
{ "King's",                      -2329.30,   458.40,    -7.60, -1993.20,   578.30,   200.00},
{ "King's",                      -2411.20,   265.20,    -9.10, -1993.20,   373.50,   200.00},
{ "King's",                      -2253.50,   373.50,    -9.10, -1993.20,   458.40,   200.00},
{ "LVA Freight Depot",            1457.30,   863.20,   -89.00,  1777.40,  1143.20,   110.90},
{ "LVA Freight Depot",            1375.60,   919.40,   -89.00,  1457.30,  1203.20,   110.90},
{ "LVA Freight Depot",            1277.00,  1087.60,   -89.00,  1375.60,  1203.20,   110.90},
{ "LVA Freight Depot",            1315.30,  1044.60,   -89.00,  1375.60,  1087.60,   110.90},
{ "LVA Freight Depot",            1236.60,  1163.40,   -89.00,  1277.00,  1203.20,   110.90},
{ "Las Barrancas",                -926.10,  1398.70,    -3.00,  -719.20,  1634.60,   200.00},
{ "Las Brujas",                   -365.10,  2123.00,    -3.00,  -208.50,  2217.60,   200.00},
{ "Las Colinas",                  1994.30, -1100.80,   -89.00,  2056.80,  -920.80,   110.90},
{ "Las Colinas",                  2056.80, -1126.30,   -89.00,  2126.80,  -920.80,   110.90},
{ "Las Colinas",                  2185.30, -1154.50,   -89.00,  2281.40,  -934.40,   110.90},
{ "Las Colinas",                  2126.80, -1126.30,   -89.00,  2185.30,  -934.40,   110.90},
{ "Las Colinas",                  2747.70, -1120.00,   -89.00,  2959.30,  -945.00,   110.90},
{ "Las Colinas",                  2632.70, -1135.00,   -89.00,  2747.70,  -945.00,   110.90},
{ "Las Colinas",                  2281.40, -1135.00,   -89.00,  2632.70,  -945.00,   110.90},
{ "Las Payasadas",                -354.30,  2580.30,     2.00,  -133.60,  2816.80,   200.00},
{ "Las Venturas Airport",         1236.60,  1203.20,   -89.00,  1457.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1203.20,   -89.00,  1777.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1143.20,   -89.00,  1777.40,  1203.20,   110.90},
{ "Las Venturas Airport",         1515.80,  1586.40,   -12.50,  1729.90,  1714.50,    87.50},
{ "LVPD (Int)",         228.8148,  140.0497,   1003.0000,  248.7047,  169.0779,    1003.0400},
{ "LVPD (Int)",         188.3310,  156.6014,   1003.0000,  203.9910,  180.7771,    1003.0400},
{ "Last Dime Motel",              1823.00,   596.30,   -89.00,  1997.20,   823.20,   110.90},
{ "Leafy Hollow",                -1166.90, -1856.00,     0.00,  -815.60, -1602.00,   200.00},
{ "Lil' Probe Inn",                -90.20,  1286.80,    -3.00,   153.80,  1554.10,   200.00},
{ "Linden Side",                  2749.90,   943.20,   -89.00,  2923.30,  1198.90,   110.90},
{ "Linden Station",               2749.90,  1198.90,   -89.00,  2923.30,  1548.90,   110.90},
{ "Linden Station",               2811.20,  1229.50,   -39.50,  2861.20,  1407.50,    60.40},
{ "Little Mexico",                1701.90, -1842.20,   -89.00,  1812.60, -1722.20,   110.90},
{ "Little Mexico",                1758.90, -1722.20,   -89.00,  1812.60, -1577.50,   110.90},
{ "Los Flores",                   2581.70, -1454.30,   -89.00,  2632.80, -1393.40,   110.90},
{ "Los Flores",                   2581.70, -1393.40,   -89.00,  2747.70, -1135.00,   110.90},
{ "Los Santos International",     1249.60, -2394.30,   -89.00,  1852.00, -2179.20,   110.90},
{ "Los Santos International",     1852.00, -2394.30,   -89.00,  2089.00, -2179.20,   110.90},
{ "Los Santos International",     1382.70, -2730.80,   -89.00,  2201.80, -2394.30,   110.90},
{ "Los Santos International",     1974.60, -2394.30,   -39.00,  2089.00, -2256.50,    60.90},
{ "Los Santos International",     1400.90, -2669.20,   -39.00,  2189.80, -2597.20,    60.90},
{ "Los Santos International",     2051.60, -2597.20,   -39.00,  2152.40, -2394.30,    60.90},
{ "Marina",                        647.70, -1804.20,   -89.00,   851.40, -1577.50,   110.90},
{ "Marina",                        647.70, -1577.50,   -89.00,   807.90, -1416.20,   110.90},
{ "Marina",                        807.90, -1577.50,   -89.00,   926.90, -1416.20,   110.90},
{ "Market",                        787.40, -1416.20,   -89.00,  1072.60, -1310.20,   110.90},
{ "Market",                        952.60, -1310.20,   -89.00,  1072.60, -1130.80,   110.90},
{ "Market",                       1072.60, -1416.20,   -89.00,  1370.80, -1130.80,   110.90},
{ "Market",                        926.90, -1577.50,   -89.00,  1370.80, -1416.20,   110.90},
{ "Market Station",                787.40, -1410.90,   -34.10,   866.00, -1310.20,    65.80},
{ "Martin Bridge",                -222.10,   293.30,     0.00,  -122.10,   476.40,   200.00},
{ "Missionary Hill",             -2994.40,  -811.20,     0.00, -2178.60,  -430.20,   200.00},
{ "Montgomery",                   1119.50,   119.50,    -3.00,  1451.40,   493.30,   200.00},
{ "Montgomery",                   1451.40,   347.40,    -6.10,  1582.40,   420.80,   200.00},
{ "Montgomery Intersection",      1546.60,   208.10,     0.00,  1745.80,   347.40,   200.00},
{ "Montgomery Intersection",      1582.40,   347.40,     0.00,  1664.60,   401.70,   200.00},
{ "Mulholland",                   1414.00,  -768.00,   -89.00,  1667.60,  -452.40,   110.90},
{ "Mulholland",                   1281.10,  -452.40,   -89.00,  1641.10,  -290.90,   110.90},
{ "Mulholland",                   1269.10,  -768.00,   -89.00,  1414.00,  -452.40,   110.90},
{ "Mulholland",                   1357.00,  -926.90,   -89.00,  1463.90,  -768.00,   110.90},
{ "Mulholland",                   1318.10,  -910.10,   -89.00,  1357.00,  -768.00,   110.90},
{ "Mulholland",                   1169.10,  -910.10,   -89.00,  1318.10,  -768.00,   110.90},
{ "Mulholland",                    768.60,  -954.60,   -89.00,   952.60,  -860.60,   110.90},
{ "Mulholland",                    687.80,  -860.60,   -89.00,   911.80,  -768.00,   110.90},
{ "Mulholland",                    737.50,  -768.00,   -89.00,  1142.20,  -674.80,   110.90},
{ "Mulholland",                   1096.40,  -910.10,   -89.00,  1169.10,  -768.00,   110.90},
{ "Mulholland",                    952.60,  -937.10,   -89.00,  1096.40,  -860.60,   110.90},
{ "Mulholland",                    911.80,  -860.60,   -89.00,  1096.40,  -768.00,   110.90},
{ "Mulholland",                    861.00,  -674.80,   -89.00,  1156.50,  -600.80,   110.90},
{ "Mulholland Intersection",      1463.90, -1150.80,   -89.00,  1812.60,  -768.00,   110.90},
{ "North Rock",                   2285.30,  -768.00,     0.00,  2770.50,  -269.70,   200.00},
{ "Ocean Docks",                  2373.70, -2697.00,   -89.00,  2809.20, -2330.40,   110.90},
{ "Ocean Docks",                  2201.80, -2418.30,   -89.00,  2324.00, -2095.00,   110.90},
{ "Ocean Docks",                  2324.00, -2302.30,   -89.00,  2703.50, -2145.10,   110.90},
{ "Ocean Docks",                  2089.00, -2394.30,   -89.00,  2201.80, -2235.80,   110.90},
{ "Ocean Docks",                  2201.80, -2730.80,   -89.00,  2324.00, -2418.30,   110.90},
{ "Ocean Docks",                  2703.50, -2302.30,   -89.00,  2959.30, -2126.90,   110.90},
{ "Ocean Docks",                  2324.00, -2145.10,   -89.00,  2703.50, -2059.20,   110.90},
{ "Ocean Flats",                 -2994.40,   277.40,    -9.10, -2867.80,   458.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -222.50,    -0.00, -2593.40,   277.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -430.20,    -0.00, -2831.80,  -222.50,   200.00},
{ "Octane Springs",                338.60,  1228.50,     0.00,   664.30,  1655.00,   200.00},
{ "Old Venturas Strip",           2162.30,  2012.10,   -89.00,  2685.10,  2202.70,   110.90},
{ "Palisades",                   -2994.40,   458.40,    -6.10, -2741.00,  1339.60,   200.00},
{ "Paradiso",                    -2741.00,   793.40,    -6.10, -2533.00,  1268.40,   200.00},
{ "Pershing Square",              1440.90, -1722.20,   -89.00,  1583.50, -1577.50,   110.90},
{ "Pilgrim",                      2437.30,  1383.20,   -89.00,  2624.40,  1783.20,   110.90},
{ "Pilgrim",                      2624.40,  1383.20,   -89.00,  2685.10,  1783.20,   110.90},
{ "Pilson Intersection",          1098.30,  2243.20,   -89.00,  1377.30,  2507.20,   110.90},
{ "Pirates in Men's Pants",       1817.30,  1469.20,   -89.00,  2027.40,  1703.20,   110.90},
{ "Playa del Seville",            2703.50, -2126.90,   -89.00,  2959.30, -1852.80,   110.90},
{ "Prickle Pine",                 1534.50,  2583.20,   -89.00,  1848.40,  2863.20,   110.90},
{ "Prickle Pine",                 1117.40,  2507.20,   -89.00,  1534.50,  2723.20,   110.90},
{ "Prickle Pine",                 1848.40,  2553.40,   -89.00,  1938.80,  2863.20,   110.90},
{ "Prickle Pine",                 1938.80,  2624.20,   -89.00,  2121.40,  2861.50,   110.90},
{ "Queens",                      -2533.00,   458.40,     0.00, -2329.30,   578.30,   200.00},
{ "Queens",                      -2593.40,    54.70,     0.00, -2411.20,   458.40,   200.00},
{ "Queens",                      -2411.20,   373.50,     0.00, -2253.50,   458.40,   200.00},
{ "Randolph Industrial Estate",   1558.00,   596.30,   -89.00,  1823.00,   823.20,   110.90},
{ "Redsands East",                1817.30,  2011.80,   -89.00,  2106.70,  2202.70,   110.90},
{ "Redsands East",                1817.30,  2202.70,   -89.00,  2011.90,  2342.80,   110.90},
{ "Redsands East",                1848.40,  2342.80,   -89.00,  2011.90,  2478.40,   110.90},
{ "Redsands West",                1236.60,  1883.10,   -89.00,  1777.30,  2142.80,   110.90},
{ "Redsands West",                1297.40,  2142.80,   -89.00,  1777.30,  2243.20,   110.90},
{ "Redsands West",                1377.30,  2243.20,   -89.00,  1704.50,  2433.20,   110.90},
{ "Redsands West",                1704.50,  2243.20,   -89.00,  1777.30,  2342.80,   110.90},
{ "Regular Tom",                  -405.70,  1712.80,    -3.00,  -276.70,  1892.70,   200.00},
{ "Richman",                       647.50, -1118.20,   -89.00,   787.40,  -954.60,   110.90},
{ "Richman",                       647.50,  -954.60,   -89.00,   768.60,  -860.60,   110.90},
{ "Richman",                       225.10, -1369.60,   -89.00,   334.50, -1292.00,   110.90},
{ "Richman",                       225.10, -1292.00,   -89.00,   466.20, -1235.00,   110.90},
{ "Richman",                        72.60, -1404.90,   -89.00,   225.10, -1235.00,   110.90},
{ "Richman",                        72.60, -1235.00,   -89.00,   321.30, -1008.10,   110.90},
{ "Richman",                       321.30, -1235.00,   -89.00,   647.50, -1044.00,   110.90},
{ "Richman",                       321.30, -1044.00,   -89.00,   647.50,  -860.60,   110.90},
{ "Richman",                       321.30,  -860.60,   -89.00,   687.80,  -768.00,   110.90},
{ "Richman",                       321.30,  -768.00,   -89.00,   700.70,  -674.80,   110.90},
{ "Robada Intersection",         -1119.00,  1178.90,   -89.00,  -862.00,  1351.40,   110.90},
{ "Roca Escalante",               2237.40,  2202.70,   -89.00,  2536.40,  2542.50,   110.90},
{ "Roca Escalante",               2536.40,  2202.70,   -89.00,  2625.10,  2442.50,   110.90},
{ "Rockshore East",               2537.30,   676.50,   -89.00,  2902.30,   943.20,   110.90},
{ "Rockshore West",               1997.20,   596.30,   -89.00,  2377.30,   823.20,   110.90},
{ "Rockshore West",               2377.30,   596.30,   -89.00,  2537.30,   788.80,   110.90},
{ "Rodeo",                          72.60, -1684.60,   -89.00,   225.10, -1544.10,   110.90},
{ "Rodeo",                          72.60, -1544.10,   -89.00,   225.10, -1404.90,   110.90},
{ "Rodeo",                         225.10, -1684.60,   -89.00,   312.80, -1501.90,   110.90},
{ "Rodeo",                         225.10, -1501.90,   -89.00,   334.50, -1369.60,   110.90},
{ "Rodeo",                         334.50, -1501.90,   -89.00,   422.60, -1406.00,   110.90},
{ "Rodeo",                         312.80, -1684.60,   -89.00,   422.60, -1501.90,   110.90},
{ "Rodeo",                         422.60, -1684.60,   -89.00,   558.00, -1570.20,   110.90},
{ "Rodeo",                         558.00, -1684.60,   -89.00,   647.50, -1384.90,   110.90},
{ "Rodeo",                         466.20, -1570.20,   -89.00,   558.00, -1385.00,   110.90},
{ "Rodeo",                         422.60, -1570.20,   -89.00,   466.20, -1406.00,   110.90},
{ "Rodeo",                         466.20, -1385.00,   -89.00,   647.50, -1235.00,   110.90},
{ "Rodeo",                         334.50, -1406.00,   -89.00,   466.20, -1292.00,   110.90},
{ "San Andreas Sound",            2450.30,   385.50,  -100.00,  2759.20,   562.30,   200.00},
{ "Santa Flora",                 -2741.00,   458.40,    -7.60, -2533.00,   793.40,   200.00},
{ "Santa Maria Beach",             342.60, -2173.20,   -89.00,   647.70, -1684.60,   110.90},
{ "Santa Maria Beach",              72.60, -2173.20,   -89.00,   342.60, -1684.60,   110.90},
{ "Shady Cabin",                 -1632.80, -2263.40,    -3.00, -1601.30, -2231.70,   200.00},
{ "Shady Creeks",                -1820.60, -2643.60,    -8.00, -1226.70, -1771.60,   200.00},
{ "Shady Creeks",                -2030.10, -2174.80,    -6.10, -1820.60, -1771.60,   200.00},
{ "Sobell Rail Yards",            2749.90,  1548.90,   -89.00,  2923.30,  1937.20,   110.90},
{ "Spinybed",                     2121.40,  2663.10,   -89.00,  2498.20,  2861.50,   110.90},
{ "Temple",                       1252.30, -1130.80,   -89.00,  1378.30, -1026.30,   110.90},
{ "Temple",                       1252.30, -1026.30,   -89.00,  1391.00,  -926.90,   110.90},
{ "Temple",                       1252.30,  -926.90,   -89.00,  1357.00,  -910.10,   110.90},
{ "Temple",                        952.60, -1130.80,   -89.00,  1096.40,  -937.10,   110.90},
{ "Temple",                       1096.40, -1130.80,   -89.00,  1252.30, -1026.30,   110.90},
{ "Temple",                       1096.40, -1026.30,   -89.00,  1252.30,  -910.10,   110.90},
{ "The Emerald Isle",             2011.90,  2202.70,   -89.00,  2237.40,  2508.20,   110.90},
{ "The Farm",                    -1209.60, -1317.10,   114.90,  -908.10,  -787.30,   251.90},
{ "The Mako Span",                1664.60,   401.70,     0.00,  1785.10,   567.20,   200.00},
{ "The Panopticon",               -947.90,  -304.30,    -1.10,  -319.60,   327.00,   200.00},
{ "The Sherman Dam",              -968.70,  1929.40,    -3.00,  -481.10,  2155.20,   200.00},
{ "The Visage",                   1817.30,  1863.20,   -89.00,  2106.70,  2011.80,   110.90},
{ "The Visage",                   1817.30,  1703.20,   -89.00,  2027.40,  1863.20,   110.90},
{ "Unity Station",                1692.60, -1971.80,   -20.40,  1812.60, -1932.80,    79.50},
{ "Valle Ocultado",               -936.60,  2611.40,     2.00,  -715.90,  2847.90,   200.00},
{ "Verdant Bluffs",                930.20, -2488.40,   -89.00,  1249.60, -2006.70,   110.90},
{ "Verdant Bluffs",               1073.20, -2006.70,   -89.00,  1249.60, -1842.20,   110.90},
{ "Verdant Bluffs",               1249.60, -2179.20,   -89.00,  1692.60, -1842.20,   110.90},
{ "Verdant Meadows",                37.00,  2337.10,    -3.00,   435.90,  2677.90,   200.00},
{ "Verona Beach",                  647.70, -2173.20,   -89.00,   930.20, -1804.20,   110.90},
{ "Verona Beach",                  930.20, -2006.70,   -89.00,  1073.20, -1804.20,   110.90},
{ "Verona Beach",                  851.40, -1804.20,   -89.00,  1046.10, -1577.50,   110.90},
{ "Verona Beach",                 1161.50, -1722.20,   -89.00,  1323.90, -1577.50,   110.90},
{ "Verona Beach",                 1046.10, -1722.20,   -89.00,  1161.50, -1577.50,   110.90},
{ "Vinewood",                      787.40, -1310.20,   -89.00,   952.60, -1130.80,   110.90},
{ "Vinewood",                      787.40, -1130.80,   -89.00,   952.60,  -954.60,   110.90},
{ "Vinewood",                      647.50, -1227.20,   -89.00,   787.40, -1118.20,   110.90},
{ "Vinewood",                      647.70, -1416.20,   -89.00,   787.40, -1227.20,   110.90},
{ "Whitewood Estates",             883.30,  1726.20,   -89.00,  1098.30,  2507.20,   110.90},
{ "Whitewood Estates",            1098.30,  1726.20,   -89.00,  1197.30,  2243.20,   110.90},
{ "Willowfield",                  1970.60, -2179.20,   -89.00,  2089.00, -1852.80,   110.90},
{ "Willowfield",                  2089.00, -2235.80,   -89.00,  2201.80, -1989.90,   110.90},
{ "Willowfield",                  2089.00, -1989.90,   -89.00,  2324.00, -1852.80,   110.90},
{ "Willowfield",                  2201.80, -2095.00,   -89.00,  2324.00, -1989.90,   110.90},
{ "Willowfield",                  2541.70, -1941.40,   -89.00,  2703.50, -1852.80,   110.90},
{ "Willowfield",                  2324.00, -2059.20,   -89.00,  2541.70, -1852.80,   110.90},
{ "Willowfield",                  2541.70, -2059.20,   -89.00,  2703.50, -1941.40,   110.90},
{ "Yellow Bell Station",          1377.40,  2600.40,   -21.90,  1492.40,  2687.30,    78.00},
{ "Los Santos",                     44.60, -2892.90,  -242.90,  2997.00,  -768.00,   900.00},
{ "Bone County",                  -480.50,   596.30,  -242.90,   869.40,  2993.80,   900.00},
{ "Tierra Robada",               -2997.40,  1659.60,  -242.90,  -480.50,  2993.80,   900.00},
{ "Tierra Robada",               -1213.90,   596.30,  -242.90,  -480.50,  1659.60,   900.00},
{ "San Fierro",                  -2997.40, -1115.50,  -242.90, -1213.90,  1659.60,   900.00},
{ "Flint County",                -1213.90, -2892.90,  -242.90,    44.60,  -768.00,   900.00},
{ "Whetstone",                   -2997.40, -2892.90,  -242.90, -1213.90, -1115.50,   900.00}};


new zoneupdates[MAX_PLAYERS_];
new player_zone[MAX_PLAYERS_];
new zoneupdate;
public update_zones() {
 new line1[10];
 new line2[10];

 for(new i=0; i<MAX_PLAYERS_; i++) {
  if(IsPlayerConnected(i) && zoneupdates[i] == 1) {
   if(IsPlayerInZone(i,player_zone[i])) {  }
   else {

    new player_zone_before;
    player_zone_before = player_zone[i];
    player_zone[i] = -1;


    for(new j=0; j<sizeof(zones);j++) {
     if(IsPlayerInZone(i,j) && player_zone[i] == -1) {

      if(player_zone_before == -1) GameTextForPlayer(i,zones[j][zone_name],1500,1);
   	  else  if(strcmp(zones[j][zone_name],zones[player_zone_before][zone_name],true) != 0) GameTextForPlayer(i,zones[j][zone_name],1500,1);

      player_zone[i] = j;
      format(line1,10,"p%dzone",i);
      format(line2,10,"%d",j);
      PropertySet(line1,line2);


     }
    }



    if(player_zone[i] == -1) player_zone[i] = player_zone_before;
   }


  }
 }

}

IsPlayerInZone(playerid, zoneid) {
 if(zoneid == -1) return 0;
 new Float:x, Float:y, Float:z;
 GetPlayerPos(playerid,x,y,z);
 if(x >= zones[zoneid][zone_minx] && x < zones[zoneid][zone_maxx]
 && y >= zones[zoneid][zone_miny] && y < zones[zoneid][zone_maxy]
 && z >= zones[zoneid][zone_minz] && z < zones[zoneid][zone_maxz]
 && z < 1200.0000) return 1;
 return 0;
}

new checkpointType[MAX_POINTS] = {
CP_STATION1,
CP_STATION2,
CP_STATION3,
CP_STATION4,
CP_STATION5,
CP_STATION6,
CP_STATION7,
CP_STATION8,
CP_STATION9,
CP_STATION10,
CP_STATION11,
CP_STATION12,
CP_STATION13,
CP_STATION14,
CP_STATION15,
CP_STATION16,
CP_AIRCOPS1,
CP_LVAPORT1,
CP_LVADMIN1,
CP_LVCARSELL,
CP_LVADMINEX,
CP_FOURDRAGS,
CP_CALIGS,
CP_REDSANDS,
CP_HOSPLV,
CP_BANCPCAR,
CP_LVDRGHSE,
CP_ATM247,
CP_ATMAMUSTH,
CP_ATMWHITE,
CP_ATMROCEST,
CP_BANKMAIN,
CP_BANKMAINX,
CP_BANKBUSNES,
CP_LVPDARMSDE,
CP_ALKATRAZ1,
CP_ALKATRAZ2,
CP_BLKFSTAD,
CP_BLKFSTADX,
CP_LVPDCCAM3,
CP_LVPDCCAM2,
CP_LVPDCCAM1,
CP_ADMINBAR,
CP_PDGIVEUP,
CP_8BALLSUP,
CP_CALIGPLNT,
CP_247CP1,
CP_TRASHPICKUP1,
CP_TRASHPICKUP2,
CP_TRASHPICKUP3,
CP_TRASHPICKUP4,
CP_TRASHPICKUP5,
CP_TRASHPICKUP6,
CP_TRASHPICKUP7,
CP_TRASHPICKUP8,
CP_TRASHPICKUP9,
CP_TRASHPICKUP10,
CP_TRASHPICKUP11,
CP_GUNDELIVERY1,
CP_GUNDELIVERY2,
CP_GUNDELIVERY3,
CP_GUNDELIVERY4,
CP_GUNDELIVERY5,
CP_GUNDELIVERY6,
CP_GUNDELIVERY7,
CP_GUNDELIVERY8,
CP_GUNDELIVERY9,
CP_GUNDELIVERY10,
CP_GUNDELIVERY11,
CP_GUNDELIVERY12,
CP_GUNDELIVERY13,
CP_GUNDELIVERY14,
CP_WINCARADMINHQ,
CP_CASHDELPICKUP,
CP_CASHDELATM1,
CP_CASHDELATM2,
CP_CASHDELATM3,
CP_CASHDELATM4,
CP_CASHDELEND,
CP_JOHNNYCASENTR,
CP_REDSANDSEXIT,
CP_CITYHALLENTER,
CP_CITYHALLMAIN,
CP_247REDSANDS,
CP_247EMERALD,
CP_247SEASTLV,
CP_247SOUTHLV,
CP_247BONECOUN,
CP_247SPINYBED,
CP_ROBCITYHALL,
CP_BIGASSPLANE,
CP_AUTOBAHN1
};





main()
{
	print("\n#######################");
	print("# JOHNNY's Las Venturas # ");
	print("# Roleplay/Cops/Robbers # ");
	print("########################\n");
	SetGameModeText("Cops'n'Robbers");
}


public getCheckpointType(playerID) {
return checkpointType[playerCheckpoint[playerID]];
}

public isPlayerInArea(playerID, Float:data[4])
{

new Float:X, Float:Y, Float:Z;
GetPlayerPos(playerID, X, Y, Z);
if(X >= data[0] && X <= data[2] && Y >= data[1] && Y <= data[3])
{
return 1;
}
return 0;
}

public SendTextTimer()
{
SendClientMessageToAll(0x5F9EA0AA, "Looking for a good time? Type /sex in a car with your girlfriend.");
}

public SendBankTimer()
{
SendClientMessageToAll(0x5F9EA0AA, "Want some fast cash? Type /robbank at the checkpoint");
}
public SendwebTimer()
{
SendClientMessageToAll(0x5F9EA0AA, "Don't forgot to visit our homepage at www.sa-rcr.page.tl");
}
public SendpissTimer()
{
SendClientMessageToAll(0x5F9EA0AA, "Does it burn when you piss? Type /cure or /heal at the hospital checkpoint.");
}
public SendDrugTimer()
{
SendClientMessageToAll(0x5F9EA0AA, "Want some drugs? Grow your own! Type /buy and select seeds of drugs and then grow them.");
}

public checkpointUpdate()
{
for(new i=0; i<MAX_PLAYERS; i++)
{

 if(IsPlayerConnected(i))
  {
  if(OnDelMission[i] == 0 && DeliveringCash[i] == 0)
  {
 


  for(new j=0; j < MAX_POINTS; j++)
  {

  if(isPlayerInArea(i, checkCoords[j]))
   {
   if(playerCheckpoint[i]!=j)
    {
    DisablePlayerCheckpoint(i);
    SetPlayerCheckpoint(i, checkpoints[j][0],checkpoints[j][1],checkpoints[j][2],checkpoints[j][3]);
    playerCheckpoint[i] = j;
    }
   }
   else
   {
   if(playerCheckpoint[i]==j)
    {
    DisablePlayerCheckpoint(i);
    playerCheckpoint[i] = 999;
    }
   }
  }
  }
}
}
}


public OnGameModeInit()
{
    EchoConnection = ircConnect("irc.gtanet.com", 6667, "EchoBot");
	SetGameModeText("Cops And Robbers");
	SetTeamCount(1);
	AllowInteriorWeapons(0);
	EnableTirePopping(1);
	EnableStuntBonusForAll(0);
	SetWorldTime(24);
	AllowAdminTeleport(1);
	ircSay(EchoConnection, EchoChan,"2####################################");
	ircSay(EchoConnection, EchoChan,"2################");
	ircSay(EchoConnection, EchoChan,"2Las Venturas");
	ircSay(EchoConnection, EchoChan,"2Roleplay/Cops/Robbers");
	ircSay(EchoConnection, EchoChan,"2Version 1.7");
    ircSay(EchoConnection, EchoChan,"2################");
    ircSay(EchoConnection, EchoChan,"2####################################");

    SetTimer("checkpointUpdate", 1100, 1);
    SetTimer("SendDrugTimer", 110000, 1);
    SetTimer("SendpissTimer", 100000, 1);
    SetTimer("SendTextTimer", 80000, 1);
    SetTimer("SendBankTimer", 90010, 1);
    SetTimer("SendwebTimer", 70000, 1);
    SetTimer("PolicePayDay", 3700000,1);
    SetTimer("ArmyPayDay", 3700000,1);
    SetTimer("announcement",120000,1);
    SetTimer("weaponanti",1500,1);
    SetTimer("Tazing",300,1);
    SetTimer("WantedYellow",100,1);
    SetTimer("WantedOrange",100,1);
    SetTimer("WantedRed",100,1);
    SetTimer("WantedInnocent",100,1);
    SetTimer("BeenReported",60000,1);
    SetTimer("ReqBkRecentTime",50000,1);
    SetTimer("HandCuffed",5000,1);
    SetTimer("SandEngine",1000,1);
    SetTimer("ReqMechRecentTime",50000,1);
    SetTimer("RobbedCasinoRecent",300000,1);
    SetTimer("RobbedPlayerRecent",60000,1);
    SetTimer("JailCuffs",5000,1);
    SetTimer("RapedPlayerRecent",60000,1);
    SetTimer("InfectedPlayerRecent",61000,1);
    
    SetTimer("HasChlamydia",10000,1);
    SetTimer("HasHIV",10000,1);
    SetTimer("SellFoodRecent",60000,1);
    SetTimer("HasSalmonella",15000,1);
    SetTimer("AskedForFoodRecent",10000,1);
    SetTimer("AskedForWeaponsRecent",9000,1);
    SetTimer("FilledGasRecentDealer",11000,1);
    SetTimer("TaxiPassengerTimer", 1000,1);
    SetTimer("SoldDrugsRecentDealer",11000,1);
    SetTimer("AutoUnjail",1000,1);
    SetTimer("AutoUnjailAlcatraz",1000,1);
    SetTimer("StoleCopCarRecentTimer",60000,1);
    SetTimer("TheEffectsOfDrugs",1000,1);
    SetTimer("TriedToEscapePrisone",40000,1);
    SetTimer("cashanti",20000,1);
    SetTimer("EscapeCuffsTime",1000,1);
	SetTimer("SouthernCopGate",1000,1);
	SetTimer("WesternCopGate",1000,1);
	SetTimer("CopRefillWaitTimer",1000,1);
	SetTimer("TimeWorld",60000,1);
	SetTimer("VisitReqTimer",1000,1);
	SetTimer("AntiJetpack",2000,1 );
	SetTimer("HitExpires",1000,1 );
	SetTimer("BankRobbedRecentlyTimer",1000,1);
	SetTimer("ATMRobbedRecentlyTimer",1000,1);

	SetTimer("PlayerRobbedBankRecentTimer",1000,1);
	SetTimer("LoginTimer",10000,1);
	SetTimer("UsedBankRecentlyTimer",1000,1);
	SetTimer("WantedLevelReduce",1200000,1);
	SetTimer("commitedcrimerecent",1000,1);
	SetTimer("copshavevctimer",1000,1);
	SetTimer("fixedcarrecenttimer",1000,1);
	SetTimer("CashCheck",2000,1);
	SetTimer("TrashMissionTimer",1000,1);
	SetTimer("GunsDeliveryTimeLimitTimer",1000,1);
	SetTimer("JailFood",120000,1);
	SetTimer("TaxiDriverOffDutyCriminal",500,1);
	SetTimer("playerbeenrobbedrecent",1000,1);
	SetTimer("selectskill",1000,1);
	SetTimer("cashdrop",7000,1);
	SetTimer("twofoursevenmoveplayer",1000,1);
	SetTimer("destroypickups",900000,1);
	SetTimer("carrierliftinfotext",5000,1);
	SetTimer("robbingstorecountdown",1000,1);
    SetTimer("storerobbedrecent",1000,1);
    SetTimer("robbingcityhallcountdown",1000,1);
    SetTimer("PlayerVarDecrease",1000,1);



    alkatrazmap = GangZoneCreate(3539.1328, 382.3327, 4085.4063, 560.8972);
    carriermap = GangZoneCreate(2782.5579, 441.7090, 3166.1729, 520.0420);
    

    AddStaticPickup(1239,2,2172.1626,1396.5553,11.0625); // autoban i
    AddStaticPickup(366,2,2139.3486,1625.4484,993.6882); // FE in caligs
    AddStaticPickup(366,2,2148.9221,1625.6168,993.6882); // FE in caligs
    AddStaticPickup(355,2,-2651.7878,1412.5660,906.2734); // ak47 in admin hq
    AddStaticPickup(1240,2,-2651.9155,1410.3878,906.2734); // health in admin hq
    AddStaticPickup(353,2,-2651.8179,1408.0308,906.2734); // mp5 in admin hq
    AddStaticPickup(1247,2,2052.6113,802.7152,17.3002); // bribe thruway ramp
    AddStaticPickup(1247,2,2157.5210,2267.3660,19.8192); // bribe ramp close to pd
    AddStaticPickup(1247,2,1298.1915,1525.8585,19.5423); // bribe ramp close to pd
    AddStaticPickup(1247,2,1680.8639,1753.1685,10.8268); // bribe ramp close to pd
    AddStaticPickup(1247,2,1186.1324,876.7701,10.8335); // bribe ramp close to pd
    AddStaticPickup(1247,2,2163.1479,2474.0579,10.8203); // bribe ramp close to pd
    AddStaticPickup(1247,2,2621.7563,2195.8796,-1.2323); // bribe ramp close to pd
    
    txtTypeSkill1 = TextDrawCreate(100.200, 260.360,
	"~w~Your job is to keep criminal off the ~n~streets.~n~Remember:~n~This is ~R~NOT~W~deathmatch server. Enjoy!");
	//TextDrawFont(welcome, 1);
	TextDrawUseBox(welcome, 1);
	//TextDrawLetterSize(welcome, 1.8, 1.3);
	//TextDrawTextSize(welcome, 4.1, 10.10);
	//TextDrawSetShadow(welcome,0); // no shadow
    //TextDrawSetOutline(welcome,1); // thickness 1
    TextDrawBackgroundColor(welcome,0x000000FF);
    //TextDrawAlignment(welcome,0);
    TextDrawBoxColor(welcome,0x000000AA);

txtTypeSkill2 = TextDrawCreate(150.0, 360.0,
	"~g~JAIL TURNKEY~n~~w~TYPE /PAROLE TO RELEASE A PLAYER");
	TextDrawUseBox(txtTypeSkill1, 1);
	TextDrawFont(txtTypeSkill1, 1);
	TextDrawLetterSize(txtTypeSkill1, 0.8, 2.3);
	//TextDrawTextSize(txtTypeSkill, 5.5, 9.0);
	TextDrawSetShadow(txtTypeSkill1,1); // no shadow
    TextDrawSetOutline(txtTypeSkill1,1); // thickness 1
    TextDrawBackgroundColor(txtTypeSkill,0x000000FF);
    TextDrawBoxColor(txtTypeSkill1,0x000000AA);
    TextDrawAlignment(txtTypeSkill1,1); // align right.

txtTypeSkill3 = TextDrawCreate(150.0, 360.0,
	"~y~CAR MECHANIC~n~~w~TYPE /FIX TO FIX A PLAYER'S CAR");
	TextDrawUseBox(txtTypeSkill1, 1);
	TextDrawFont(txtTypeSkill1, 1);
	TextDrawLetterSize(txtTypeSkill1, 0.8, 2.3);
	//TextDrawTextSize(txtTypeSkill, 5.5, 9.0);
	TextDrawSetShadow(txtTypeSkill1,1); // no shadow
    TextDrawSetOutline(txtTypeSkill1,1); // thickness 1
    TextDrawBackgroundColor(txtTypeSkill,0x000000FF);
    TextDrawBoxColor(txtTypeSkill1,0x000000AA);
    TextDrawAlignment(txtTypeSkill1,1); // align right.

txtTypeSkill4 = TextDrawCreate(150.0, 360.0,
	"~y~DRIVER~n~~w~TYPE /DUTY TO BE ON/OFF DUTY");
	TextDrawUseBox(txtTypeSkill1, 1);
	TextDrawFont(txtTypeSkill1, 1);
	TextDrawLetterSize(txtTypeSkill1, 0.8, 2.3);
	//TextDrawTextSize(txtTypeSkill, 5.5, 9.0);
	TextDrawSetShadow(txtTypeSkill1,1); // no shadow
    TextDrawSetOutline(txtTypeSkill1,1); // thickness 1
    TextDrawBackgroundColor(txtTypeSkill,0x000000FF);
    TextDrawBoxColor(txtTypeSkill1,0x000000AA);
    TextDrawAlignment(txtTypeSkill1,1); // align right.


    txtTypeSkill = TextDrawCreate(150.0, 360.0,
	"~y~CIVILIAN~n~~w~TYPE ~b~/SKILL~w~ TO SELECT A SKILL");
	TextDrawUseBox(txtTypeSkill, 1);
	TextDrawFont(txtTypeSkill, 1);
	TextDrawLetterSize(txtTypeSkill, 0.8, 2.3);
	//TextDrawTextSize(txtTypeSkill, 5.5, 9.0);
	TextDrawSetShadow(txtTypeSkill,1); // no shadow
    TextDrawSetOutline(txtTypeSkill,1); // thickness 1
    TextDrawBackgroundColor(txtTypeSkill,0x000000FF);
    TextDrawBoxColor(txtTypeSkill,0x000000AA);
    TextDrawAlignment(txtTypeSkill,1); // align right.
    
    autoserv = TextDrawCreate(95.000000,149.000000,"~g~autobahn~w~~n~~n~1.Sultan~n~2.Elegy~n~3.Jester~n~4.Cheetah~n~5.Turizmo~n~6.Infernus~n~7.NRG500~n~8.Hotring Racer~n~9.BMX bike~n~10.Uranus~n~~n~PRESS ~Y~LMB~w~ TO CANCEL SELECTION");
TextDrawUseBox(autoserv,1);
TextDrawBoxColor(autoserv,0x00000099);
TextDrawTextSize(autoserv,273.000000,7.000000);
TextDrawAlignment(autoserv,0);
TextDrawBackgroundColor(autoserv,0x00000099);
TextDrawFont(autoserv,3);
TextDrawLetterSize(autoserv,1.000000,1.000500);
TextDrawColor(autoserv,0xffffffcc);
TextDrawSetOutline(autoserv,1);
TextDrawSetProportional(autoserv,1);
TextDrawSetShadow(autoserv,1);

webadress = TextDrawCreate(1.000000,423.000000,"www.sa-rcr.page.tl");
TextDrawAlignment(webadress,0);
TextDrawBackgroundColor(webadress,0x000000ff);
TextDrawFont(webadress,3);
TextDrawLetterSize(webadress,1.000000,2.000000);
TextDrawColor(webadress,0x00ffff99);
TextDrawSetOutline(webadress,1);
TextDrawSetProportional(webadress,1);
TextDrawSetShadow(webadress,1);

	welcome = TextDrawCreate(4.000000,112.000000,"~g~johnny's ~b~cops ~w~and ~y~robbers~n~~n~~y~LAS VENTURAS~n~~n~~w~this is ~r~not~w~ a deathmatch server. do ~r~not ~w~hack or cheat. do ~r~not~w~ driveby.~w~please respect the rules and..Enjoy!~n~~n~if you accept these rules please type ~g~/play");
    TextDrawUseBox(welcome,1);
    TextDrawBoxColor(welcome,0x000000cc);
    TextDrawTextSize(welcome,619.000000,11.000000);
    TextDrawAlignment(welcome,0);
    TextDrawBackgroundColor(welcome,0x000000ff);
    TextDrawFont(welcome,2);
    TextDrawLetterSize(welcome,1.000000,3.000000);
    TextDrawColor(welcome,0xffffffff);
    TextDrawSetProportional(welcome,1);
    TextDrawSetShadow(welcome,0);
    
    service = TextDrawCreate(1.000000,146.000000,"SERVICES:~N~1.CHAINSAW~n~2.Flowers~n~3.Water~n~4.Beer~n~5.Wallet~n~6.Parachute~n~7.Camera~n~8.Condom");
TextDrawUseBox(service,1);
TextDrawBoxColor(service,0x000000cc);
TextDrawTextSize(service,221.000000,0.000000);
TextDrawAlignment(service,0);
TextDrawBackgroundColor(service,0x000000ff);
TextDrawFont(service,3);
TextDrawLetterSize(service,1.000000,2.000000);
TextDrawColor(service,0x00ff0066);
TextDrawSetOutline(service,1);
TextDrawSetProportional(service,1);
TextDrawSetShadow(service,1);



    // Player Classes
    //1206.9768,-32.5926,1000.9531
    //AddPlayerClass(0,1575.5709,-611.1863,75.8769,14.3193,0,0,0,0,0,0);

	AddPlayerClass(211,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // female citycop
	AddPlayerClass(265,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // citycop
	AddPlayerClass(267,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // citycop
	AddPlayerClass(283,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // citycop
	AddPlayerClass(284,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // citycop
	AddPlayerClass(285,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // citycop
	AddPlayerClass(286,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // fbi
    AddPlayerClass(287,2941.0012,468.3174,21.6395,49.3062,24,50,30,500,34,20); // army
    AddPlayerClass(164,1899.3256,962.4217,10.8203,178.9707,23,100,25,50,0,0); // casino security spawn
    AddPlayerClass(122,2281.3210,2429.7224,3.2734,359.5055,3,1,22,50,29,500); // plain clothes
    AddPlayerClass(71,1337.5198,1279.3478,10.8203,144.4931,3,1,22,50,29,500); // air cops
    AddPlayerClass(71,2293.8950,543.3351,1.7944,182.4626,3,1,22,50,29,500); // marine unit new
    AddPlayerClass(111,2343.2703,2454.1113,14.9742,95.8794,3,1,0,0,0,0); // jail turnkey
    AddPlayerClass(276,1624.2527,1821.0498,10.8203,5.6779,22,50,0,0,0,0); // medic 2
	AddPlayerClass(50,2006.1929,2295.9451,10.8203,177.4306,22,50,0,0,0,0); // mechanic spawn
    AddPlayerClass(155,2076.5696,2223.5557,10.8203,189.4515,5,1,22,50,0,0); // bistro spawn
    AddPlayerClass(133,1151.7200,1399.4144,5.8203,0.9030,22,50,0,0,0,0); // driver spawn male
    AddPlayerClass(151,1151.7200,1399.4144,5.8203,0.9030,22,50,0,0,0,0); // driver spawn female
    AddPlayerClass(7,2090.1008,2078.2600,10.8203,263.0699,0,0,0,0,0,0); // civil skin
    AddPlayerClass(12,2090.1008,2078.2600,10.8203,263.0699,0,0,0,0,0,0);// civil skin
    AddPlayerClass(23,2090.1008,2078.2600,10.8203,263.0699,0,0,0,0,0,0);// civil skin
    AddPlayerClass(29,2815.0498,2254.1252,10.8203,158.6954,0,0,0,0,0,0); // hoody skin civi
    AddPlayerClass(294,2814.0542,2253.4043,10.8203,315.9051,0,0,0,0,0,0); // woozie skin
    AddPlayerClass(214,2812.1963,2247.7256,10.8203,352.8735,0,0,0,0,0,0); // civi
    AddPlayerClass(1,2634.0793,1072.6293,10.8203,88.4012,0,0,0,0,0,0);// civil skin
    AddPlayerClass(15,2634.0793,1072.6293,10.8203,88.4012,0,0,0,0,0,0);// civil skin
    AddPlayerClass(34,2634.0793,1072.6293,10.8203,88.4012,0,0,0,0,0,0);// civil skin
    AddPlayerClass(2,2193.6528,2007.7402,12.2894,1.8574,0,0,0,0,0,0);// civil skin
    AddPlayerClass(9,2193.6528,2007.7402,12.2894,1.8574,0,0,0,0,0,0); // civil skin
    AddPlayerClass(19,2193.6528,2007.7402,12.2894,1.8574,0,0,0,0,0,0);// civil skin
    AddPlayerClass(22,2193.6528,2007.7402,12.2894,1.8574,0,0,0,0,0,0);// civil skin
    AddPlayerClass(26,2082.0784,2480.8333,10.8203,182.0390,0,0,0,0,0,0);// civil skin
    AddPlayerClass(31,2082.0784,2480.8333,10.8203,182.0390,0,0,0,0,0,0);// civil skin
    AddPlayerClass(45,2082.0784,2480.8333,10.8203,182.0390,0,0,0,0,0,0);// civil skin
    AddPlayerClass(46,2082.0784,2480.8333,10.8203,182.0390,0,0,0,0,0,0);// civil skin
	AddPlayerClass(9,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); // civil skin
	AddPlayerClass(13,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(14,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(24,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(33,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(36,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(38,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(52,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(63,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(75,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(82,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(87,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(92,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(94,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(127,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(128,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(138,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(146,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(147,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(158,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(160,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(204,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(249,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(264,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(269,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(270,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(271,2193.7366,2007.4865,12.2894,358.2378,0,0,0,0,0,0); //civil skin
	AddPlayerClass(141,2193.5884,2007.4149,12.2894,355.9373,0,0,0,0,0,0); // gloris skin
	
	// BONUS CARS
	new rnd;
    rnd = random(sizeof (BonusNRGSpawn));
    AddStaticVehicle(522,BonusNRGSpawn[rnd][0], BonusNRGSpawn[rnd][1], BonusNRGSpawn[rnd][2],BonusNRGSpawn[rnd][3],-1,-1); // bonus nrg on tall rock $50000
    new rnd1;
    rnd1 = random(sizeof (BonusSULTANSpawn));
	AddStaticVehicle(541,BonusSULTANSpawn[rnd1][0], BonusSULTANSpawn[rnd1][1], BonusSULTANSpawn[rnd1][2],BonusSULTANSpawn[rnd1][3],-1,-1); // bonus sultan hanger abandond $50000
    // 2
    // SELLABLE CARS ALL £10000
    AddStaticVehicle(400,-260.5457,1056.3306,19.8715,268.7226,-1,-1); // fort carson in drive
    AddStaticVehicle(400,-345.8235,1514.3239,75.4517,1.1434,-1,-1); // satalite spawn
    AddStaticVehicle(411,2250.0283,1745.9657,10.5474,0.4763,-1,-1); // behind caligs
    AddStaticVehicle(411,2186.4280,1974.9047,10.5474,269.7653,-1,-1); // 24 7 off strip
    AddStaticVehicle(411,2582.5378,2267.8010,10.5473,90.0122,-1,-1); // vrock
    AddStaticVehicle(412,-36.7159,1166.4210,19.3073,179.1232,-1,-1); //
    AddStaticVehicle(412,-165.0882,2698.1201,62.2406,268.9153,-1,-1); //
    AddStaticVehicle(525,2013.6302,2295.3477,10.6977,180.4832,-1,-1); // towtruck
	AddStaticVehicle(420,1714.3792,1463.8660,10.4760,161.7229,-1,-1); // LV airport
    AddStaticVehicle(560,2240.9912,2258.8062,10.4231,273.1421,-1,-1); // wastelandjust south of PD
    AddStaticVehicle(560,2657.9558,2326.0093,10.4489,166.1163,-1,-1); // vrock hotel
    AddStaticVehicle(560,2364.0537,1655.9087,10.5250,88.8932,-1,-1); // carpark behind caligs
    AddStaticVehicle(560,2292.5906,1448.0037,38.9831,91.1639,-1,-1); // top floor multistory at pyramid
    AddStaticVehicle(560,2038.6998,1009.3288,10.3772,179.8236,-1,-1); // outside four dragons
    AddStaticVehicle(405,1673.0708,1297.5497,10.6953,357.9945,-1,-1); // lv airport carpark
    AddStaticVehicle(405,1289.8744,1379.4893,10.6953,88.8806,-1,-1); // at tankers lv airport
    AddStaticVehicle(405,1311.0771,1258.1323,10.6953,358.7266,-1,-1); // lvpd air unit
    AddStaticVehicle(402,1628.7238,2229.1563,10.6521,1.5808,-1,-1); // redsands casino
    AddStaticVehicle(402,1963.3129,2410.9758,10.6520,179.1552,-1,-1); //
    AddStaticVehicle(402,2553.6895,2317.9258,10.6520,179.5711,-1,-1); //
    AddStaticVehicle(409,1658.5117,2259.5540,10.6203,90.7668,-1,-1); // limo redsands
    AddStaticVehicle(426,-289.1980,1317.1255,54.0285,263.1293,-1,-1); //
    AddStaticVehicle(426,-324.4553,1514.7328,75.1027,357.5986,-1,-1); //
    AddStaticVehicle(429,2370.7654,2578.0522,10.5000,180.6153,-1,-1); //
    AddStaticVehicle(429,2512.2239,2374.3684,10.5000,269.6915,-1,-1); //
    AddStaticVehicle(429,2103.7051,2089.0283,10.5015,268.6300,-1,-1); //
    AddStaticVehicle(581,2139.5164,2468.5984,10.4130,178.0234,-1,-1); //
    AddStaticVehicle(581,2611.1777,2279.4063,10.4130,269.3283,-1,-1); //
    AddStaticVehicle(404,1527.2931,-813.3885,71.4100,86.4230,123,92); // lscar
AddStaticVehicle(597,1354.1250,-629.5162,109.0079,16.1365,36,1); // lxingar
AddStaticVehicle(596,1096.6893,-639.8769,112.6136,45.7038,101,1); // lsland
AddStaticVehicle(597,1252.9873,-814.5957,83.7773,238.9796,117,1); // ls-car
AddStaticVehicle(597,1254.2472,-804.2015,83.8258,356.6830,58,1); // ls-carmad
AddStaticVehicle(597,1249.1686,-804.1551,83.8265,358.6439,68,1); // lsmad1
AddStaticVehicle(596,1242.7611,-803.5192,83.8225,358.6395,60,1); // lsmad

    //30
    // LVPD VEHICLES (CAR)
	AddStaticVehicle(598,2316.4802,2475.2651,3.0217,90.3534,0,1); // lvpd car
    AddStaticVehicle(598,2316.4194,2480.0454,3.0615,88.5152,0,1); // lvpd car
    AddStaticVehicle(598,2316.4380,2485.3369,3.0167,89.5960,0,1); // lvpd car
    AddStaticVehicle(598,2316.3765,2490.0940,3.0220,91.9465,0,1); // lvpd car
    AddStaticVehicle(598,2316.2776,2495.1895,3.0200,90.2339,0,1); // lvpd car
    AddStaticVehicle(598,2316.4250,2500.2219,3.0197,89.7058,0,1); // lvpd car
    AddStaticVehicle(598,2296.8850,2460.2275,3.0203,88.8503,0,1); // lvpd car
    AddStaticVehicle(598,2119.0054,929.0891,10.5671,88.3309,-1,-1); // lvpd car (ammu south lv)
    AddStaticVehicle(598,2790.7935,609.4611,10.6448,239.4174,-1,-1); // lvpd car (abandoned)
    AddStaticVehicle(598,1309.5187,1278.6099,10.5672,178.9121,-1,-1); // lvpd car
    AddStaticVehicle(598,1306.3010,1278.7461,10.5685,181.5038,-1,-1); // lvpd car
    AddStaticVehicle(560,2246.4089,2430.0127,2.9793,359.4404,0,0); // new
    AddStaticVehicle(597,2297.0229,2451.5276,3.0412,268.7933,0,1); // sfpd car
    AddStaticVehicle(597,2260.4841,2458.9121,10.5888,178.9466,0,1); // sfpd car
    AddStaticVehicle(597,2363.8188,2462.1348,10.4410,359.1209,0,1); // sfpd car
    AddStaticVehicle(411,2240.8706,2431.6042,3.0005,315.8528,0,0); // infernus
    AddStaticVehicle(490,2239.6072,2451.8501,3.3989,269.9625,0,0); // fbi
    AddStaticVehicle(490,2239.6563,2456.7458,3.4010,269.4568,0,0); // fbi
    AddStaticVehicle(490,2282.1882,2477.2366,10.9477,178.9290,0,0); // fbi
    AddStaticVehicle(490,2301.3066,2416.7947,10.8004,90.2152,0,0); // fbi
    AddStaticVehicle(523,2277.6663,2473.0217,2.8415,176.6104,0,0); // bike
    AddStaticVehicle(523,2240.1062,2471.1702,2.8380,90.2868,0,0); // bike
    AddStaticVehicle(523,2268.6572,2430.7412,2.8447,177.7989,0,0); // bike
    AddStaticVehicle(601,2311.3298,2448.9504,10.5789,157.6322,1,1); // fbi tank
	AddStaticVehicle(601,2251.6313,2444.0747,10.5807,178.9412,1,1); // fbi tank
	AddStaticVehicle(555,1242.7611,-803.5192,83.8225,358.6395,60,1); // lsmad
AddStaticVehicle(597,1523.3281,-1638.1409,13.3162,0.0000,0,1); // ls copcar
AddStaticVehicle(597,1522.8831,-1652.4523,13.3085,0.0001,0,1); // ls-copcar
AddStaticVehicle(597,1593.0709,-1686.7019,5.6599,262.8809,0,1); // ls-copcar
AddStaticVehicle(597,1574.0203,-1709.4691,5.6599,359.9993,0,1); // ls-copcar
AddStaticVehicle(597,1583.0553,-1709.4800,5.6599,359.9994,0,1); // ls-copcar
AddStaticVehicle(597,1587.4753,-1710.0547,5.6600,358.7505,0,1); // ls-copcar
	AddStaticVehicle(597,2263.6372,2473.2419,3.0424,0.0609,0,0);
    AddStaticVehicle(597,2268.2463,2473.2190,3.0424,0.1667,0,0); //
    AddStaticVehicle(597,2352.3809,1609.3071,10.4399,270.3242,0,0); //
    AddStaticVehicle(597,2316.7251,2460.4163,3.0418,269.1222,0,0); //
    AddStaticVehicle(597,2256.1438,2477.6895,10.5879,358.7498,0,0); //
    AddStaticVehicle(597,2250.6978,2430.0125,3.0430,179.4021,0,0); //
    //61
	// LVPD VEHICLE (AIR)
	AddStaticVehicle(497,1341.8801,1255.5431,19.5425,44.5802,-1,-1); // police maverick
    AddStaticVehicle(497,1340.3700,1236.4381,19.5203,294.8706,-1,-1); // police maverick
    AddStaticVehicle(497,1323.0903,1237.8447,19.5173,10.1612,-1,-1); // police maverick
    AddStaticVehicle(497,1296.6628,1236.6494,19.5190,52.4852,-1,-1); // police maverick
    AddStaticVehicle(497,1299.8175,1255.5842,19.5236,316.4109,-1,-1); // police maverick
	AddStaticVehicle(497,3748.3474,470.5863,37.9441,90.8746,-1,-1); // police maverick at alkatraz
	//67
	// LVPD VEHICLES (MARINE)
	AddStaticVehicle(430,2288.1111,518.8869,-0.1907,91.3782,-1,-1); // Predator
    AddStaticVehicle(430,2299.9636,518.9166,-0.1355,269.2642,-1,-1); // Predator
    AddStaticVehicle(430,2282.2551,538.3450,-0.2159,147.9407,-1,-1); // Predator
    AddStaticVehicle(430,2306.7380,539.2404,-0.3769,217.6788,-1,-1); // Predator Alkatraz
    AddStaticVehicle(430,3592.4229,514.0565,0.4481,0.5782,0,0); // Predator Alkatraz
	AddStaticVehicle(430,3630.9941,500.9380,-0.8119,358.3138,0,0); // Predator Alkatraz
	AddStaticVehicle(430,3620.9778,499.9655,0.3282,1.9102,0,0); // Predator Alkatraz
	AddStaticVehicle(430,2879.2646,475.6259,-0.4424,88.2338,77,77); // pred at aircraft carrier
	//75
	// MEDIC VEHICLES (CAR)
    AddStaticVehicle(416,1616.1962,1832.7340,10.9688,270.0724,1,86); // Ambulance
    AddStaticVehicle(416,1607.7017,1832.7179,10.9696,270.0573,1,86); // Ambulance
    AddStaticVehicle(416,1598.8495,1832.7233,10.9696,270.0156,1,86); // Ambulance
    AddStaticVehicle(416,1610.3152,1838.5310,10.9695,269.8784,1,86); // Ambulance
    AddStaticVehicle(407,1763.7043,2076.9663,11.0527,180.1710,-1,-1); // fire engine
    AddStaticVehicle(407,1751.3513,2076.5618,11.0565,180.1663,-1,-1); // fire engine
    //81
    // MEDIC HELI
    AddStaticVehicle(487,1622.6943,1852.4388,10.9966,179.0737,86,86); // heli new medic1
    AddStaticVehicle(487,1590.5546,1852.2444,10.9957,179.3921,86,86); // heli medic new 2
    //83
    // CASINO SECURITY
    AddStaticVehicle(579,1882.1576,953.9945,10.7521,268.3038,0,0); //
    AddStaticVehicle(579,1882.1141,957.1571,10.7510,271.8213,0,0); //
    AddStaticVehicle(579,1909.5972,962.4758,10.7515,179.1707,0,0); //
    //86
	// Carrier Aircraft
	AddStaticVehicle(520,2931.0613,465.3756,19.3782,1.1622,0,0); // hydra carrier
	AddStaticVehicle(520,2917.5867,465.7890,19.3795,312.2032,0,0); // hydra carrier
	AddStaticVehicle(520,2899.7839,465.5906,19.3723,311.8952,0,0); // hydra carrier
	AddStaticVehicle(425,3062.4238,466.6560,19.2461,52.5798,43,0); // hunter carrier
	AddStaticVehicle(425,3047.4338,466.8032,19.2559,46.4933,43,0); // hunter carrier
	AddStaticVehicle(425,3034.5884,467.3791,19.2494,41.5143,43,0); // hunter carrier
	//92
    // SEA PLANE
    AddStaticVehicle(460,3870.3757,521.3595,1.5988,265.3323,-1,-1); // seaplane at alcatraz
	AddStaticVehicle(460,3976.7407,515.1458,2.3438,262.1897,-1,-1); // seaplane at alcatraz
	AddStaticVehicle(460,2979.3538,2103.4531,1.1234,296.8892,-1,-1); // seaplane
	AddStaticVehicle(460,2565.8223,494.8676,2.1482,270.9538,-1,-1); // seaplane
	AddStaticVehicle(460,2105.4067,-95.3821,1.6661,123.0410,-1,-1); // seaplane
	AddStaticVehicle(460,-1152.5420,14.8533,1.5873,319.1891,-1,-1); // seaplane
	AddStaticVehicle(460,-1464.0345,693.4573,1.8334,357.9172,-1,-1); // seaplane
	//99
    // DRIVER VEHICLE (CAR)
    AddStaticVehicle(420,1158.4103,1397.3376,5.5998,89.9673,6,1); // driver spawn
	AddStaticVehicle(420,1158.4358,1401.3970,5.5994,88.4158,6,1); // driver spawn
	AddStaticVehicle(420,1158.4359,1405.6311,5.5991,89.8338,6,1); // driver spawn
	AddStaticVehicle(420,1158.4196,1410.0563,5.5988,89.9406,6,1); // driver spawn
    AddStaticVehicle(420,1158.6406,1414.4780,5.5995,238.2890,6,1); // driver spawn
	AddStaticVehicle(420,1158.7196,1419.6169,5.5992,235.1454,6,1); // driver spawn
	AddStaticVehicle(420,1144.6538,1397.5892,5.5997,181.1381,6,1); // driver spawn
    AddStaticVehicle(420,1673.5316,-2315.5212,13.1624,88.8791,-1,-1); // LS airport
    AddStaticVehicle(420,1666.8280,-2315.4917,13.1640,90.1225,-1,-1); // LS airport
    AddStaticVehicle(420,1660.0367,-2315.4790,13.1631,90.6457,-1,-1); // LS airport
    AddStaticVehicle(420,1709.5975,1447.3756,10.4755,162.8830,-1,-1); // LV airport
    AddStaticVehicle(420,-1419.6381,-309.1965,13.7791,44.0550,-1,-1); // sf airport
    AddStaticVehicle(420,-1425.3394,-303.7048,13.7733,47.2148,-1,-1); // sf airport
    AddStaticVehicle(420,-1431.3544,-298.4751,13.7790,48.9959,-1,-1); // sf airport
    AddStaticVehicle(420,-1437.9172,-293.7115,13.7759,55.7972,-1,-1); // sf airport
	AddStaticVehicle(431,1120.7922,1421.6825,5.9203,270.1187,-1,-1); // coach
	AddStaticVehicle(431,1120.8073,1417.2930,5.9213,270.2127,-1,-1);  // coach
	AddStaticVehicle(431,1123.4386,1401.6411,5.9139,359.5022,-1,-1); // coach
	AddStaticVehicle(409,2184.7378,1683.6982,10.8875,89.3902,-1,-1); // limo caligs
    AddStaticVehicle(409,2038.6005,1017.8719,10.4719,180.5361,-1,-1); // limo fourdrags
    AddStaticVehicle(409,1135.3848,1397.7670,5.6203,0.0212,1,1); // limo driver spawn
	AddStaticVehicle(409,1139.5439,1397.7987,5.6203,359.6214,1,1); //
    AddStaticVehicle(487,1545.1851,1769.6086,10.9971,87.6224,-1,-1); // maverick at beagles
    AddStaticVehicle(487,1549.3344,1753.1544,10.9930,270.5984,-1,-1); // maverick at beagles2
    AddStaticVehicle(487,1619.0939,1356.7064,10.9488,136.5968,-1,-1); // heli airport1
    AddStaticVehicle(487,1573.9966,1355.0909,11.0338,132.8060,-1,-1); // heli airport 2
    AddStaticVehicle(487,1573.1521,1419.7258,11.0533,77.8943,-1,-1); // heli airport3
    AddStaticVehicle(487,365.5160,2536.9846,16.8408,176.7653,-1,-1); // maverick airstrip
    AddStaticVehicle(487,2093.1401,2414.8337,74.7489,356.9587,-1,-1); // maverick emerald isle
    //128
    // TRASH TRUCKS
    AddStaticVehicle(408,2762.6511,2629.0281,11.3657,205.4371,26,26); // new trash truck
	AddStaticVehicle(408,2769.2124,2629.0071,11.3813,205.0175,26,26); // new trash truck
	AddStaticVehicle(408,2599.8892,2171.3806,11.3604,124.5986,26,26); // new trash
	AddStaticVehicle(408,2091.6597,2142.2932,11.3669,270.1578,26,26); // new trash
	AddStaticVehicle(408,2118.9285,1894.8378,11.2368,179.9940,26,26); // new trash
	AddStaticVehicle(408,1996.2535,1073.2250,11.3617,359.8930,26,26); // new trash
	AddStaticVehicle(408,2229.8176,950.9883,11.3686,180.1651,26,26); // new trash
	//135
	// Car Dealer Cars
    AddStaticVehicle(411,2208.4243,1392.3295,10.5474,90.6794,-1,-1); // car dealer infernus
	AddStaticVehicle(451,2191.2715,1392.6343,10.5273,88.8673,-1,-1); // car dealer turismo
	//137
	// bank secure vans
    AddStaticVehicle(428,2372.0300,1609.5376,10.7954,269.7663,4,75); // secure vans behind bank
	AddStaticVehicle(428,2362.9207,1609.5750,10.7926,269.7670,4,75); // secure vans behind bank
	//139
	// Artic Trailers
	AddStaticVehicle(591,2173.2791,1830.5649,11.4172,89.6210,-1,-1); //
	AddStaticVehicle(591,2467.7417,1923.5344,9.4265,359.1829,-1,-1); // artics
	AddStaticVehicle(591,2058.5928,2251.2957,10.1730,90.8581,-1,-1); // artics
	AddStaticVehicle(591,1623.9597,2325.8767,10.4789,179.2105,-1,-1); // artics
	AddStaticVehicle(591,1597.8265,1630.5233,10.4801,177.9328,-1,-1); // artics
	AddStaticVehicle(591,1694.1700,960.6252,10.4550,89.7094,-1,-1); // artics
	AddStaticVehicle(591,2179.9382,1017.4482,10.4800,201.2279,-1,-1); // artics
	AddStaticVehicle(591,2123.1150,957.1656,10.4744,273.0740,-1,-1); // artics
	//147
	// LINE RUNNER
	AddStaticVehicle(514,2207.5239,1789.5764,11.4052,181.3414,-1,-1); //
    AddStaticVehicle(514,842.7371,868.4437,13.8652,294.8057,-1,-1); //
    AddStaticVehicle(514,1049.8719,2131.8743,11.4259,89.0901,-1,-1); //
    AddStaticVehicle(514,1408.7637,2088.9531,11.5369,177.8576,-1,-1); //
    AddStaticVehicle(514,2654.4961,1134.1520,11.4056,358.1617,-1,-1); // SE Gas station
    AddStaticVehicle(514,1308.3387,1411.3556,11.3949,60.5554,-1,-1); // LV airport
    AddStaticVehicle(514,2260.9292,2770.3232,11.4264,90.1708,-1,-1); //
    //154
	// bangers in stadium
	AddStaticVehicle(504,-1421.4108,995.0195,1023.9284,187.5995,-1,-1); //
	AddStaticVehicle(504,-1420.1169,987.1750,1023.7940,6.9317,-1,-1); //
    AddStaticVehicle(504,-1425.8875,994.6539,1023.9357,7.6189,-1,-1); //
    AddStaticVehicle(504,-1424.7188,986.3735,1023.7917,187.2283,-1,-1); //
	AddStaticVehicle(504,-1429.3414,986.0947,1023.7928,6.5205,-1,-1); //
	AddStaticVehicle(504,-1430.6591,993.7530,1023.9292,187.9536,-1,-1); //
	AddStaticVehicle(504,-1433.3226,978.8489,1023.7661,323.5251,-1,-1); //
	AddStaticVehicle(504,-1435.7758,985.1437,1023.7878,276.9260,-1,-1); //
	AddStaticVehicle(504,-1436.6047,993.0659,1023.9309,276.8188,-1,-1); //
	AddStaticVehicle(504,-1435.9889,999.1473,1024.0264,236.7130,-1,-1); //
	//164
	// PIZZABOY
    AddStaticVehicle(448,2076.1016,2227.7793,10.4197,182.2776,-1,-1); // pizzaboy1
    AddStaticVehicle(448,2074.2893,2227.7356,10.4198,178.3668,-1,-1); // pizzaboy2
    AddStaticVehicle(448,2072.4226,2228.1094,10.4173,358.1902,-1,-1); // pizza3
    //167
    // TOWTRUCK
    AddStaticVehicle(525,1987.1045,2288.6025,10.6135,270.2471,-1,-1); // towtruck
    AddStaticVehicle(525,1995.5443,2288.6602,10.6209,270.3867,-1,-1); // towtruck
    //169
    // SHAMAL
	AddStaticVehicle(519,1318.3536,1594.7084,11.7389,270.7145,1,1); // shamal
	AddStaticVehicle(519,1318.3253,1571.2150,11.7427,270.1246,1,1); // shamal
	//171
	// DFT 30
    AddStaticVehicle(578,-526.7448,2620.3787,54.0389,359.4019,1,1);
    AddStaticVehicle(578,-909.9553,2697.5984,42.9924,130.8771,1,1); //
    AddStaticVehicle(578,-198.4705,2607.2178,63.3289,180.1292,1,1); //
    AddStaticVehicle(578,1480.1882,2846.8203,11.4454,358.4138,1,1); //
    AddStaticVehicle(578,1633.1060,2340.2183,11.2455,92.0694,1,1); //
    AddStaticVehicle(578,1909.2942,2258.5046,11.4444,270.0823,1,1); //
    //177
    // BEAGLE AT AIRPORT
    AddStaticVehicle(511,1542.9960,1840.6337,12.1951,91.0842,-1,-1); // beagle1
    AddStaticVehicle(511,1543.4858,1815.3352,12.1963,90.7103,-1,-1); // beagle2
    AddStaticVehicle(511,1543.8823,1790.8335,12.1951,90.3567,-1,-1); // beagle3
    AddStaticVehicle(511,383.0163,2535.7126,17.9211,179.5423,8,66); // beagle at airstrip
    //181
    // BMX
	AddStaticVehicle(481,2084.4128,1082.8064,10.3308,235.7149,6,6); // BMX
	AddStaticVehicle(481,2018.2346,1347.9608,10.3362,266.5774,6,6); // BMX
	AddStaticVehicle(481,2004.7864,1546.3557,13.1020,114.6564,6,6); // BMX
	//184
    // SANCHEZ
    AddStaticVehicle(468,2561.5830,1578.8514,10.4888,87.0434,-1,-1); // sanchez
    AddStaticVehicle(468,2051.8228,819.7362,7.2582,88.2762,-1,-1); // sanchez bottom strip
    AddStaticVehicle(468,1521.6385,986.0881,10.4888,1.4943,-1,-1); // sanchez
    //187
    // at 400
    AddStaticVehicle(577,1477.6705,1817.5233,10.7286,179.7935,8,7); // at400
    // STUNT PLANE
    AddStaticVehicle(513,329.5012,2474.1362,17.0532,53.6861,-1,-1); // stuntplane airstrip
    AddStaticVehicle(513,340.5403,2474.4924,17.0299,48.4815,-1,-1); // stunt 2 airstrip
    AddStaticVehicle(513,1353.0137,1707.2864,11.3751,270.4409,-1,-1); // stunt lv airport
    AddStaticVehicle(513,-1343.3337,-281.7327,14.6970,326.1327,-1,-1); // stunt sf
	AddStaticVehicle(513,-1383.2651,-229.1063,14.6913,319.7043,-1,-1); // stunt sf
	AddStaticVehicle(513,1686.5472,-2629.0112,14.0899,357.1628,-1,-1); // stunt ls
	AddStaticVehicle(513,1624.4884,-2631.1340,14.1013,358.6935,-1,-1); // stunt ls
    //195
    // Launch Boat
	AddStaticVehicle(595,2880.1399,480.4556,0.4235,89.8792,77,77); // launch at aricraft casrier
	AddStaticVehicle(595,2982.8508,494.6537,-0.3568,270.0419,112,20); // launch
	AddStaticVehicle(595,3022.6843,494.5869,0.9674,272.4197,112,20); // launch
	AddStaticVehicle(595,3048.0571,439.7083,0.0367,81.2992,112,20); // launch
	AddStaticVehicle(595,2848.1538,457.8650,0.0415,310.5009,112,20); // launch
	AddStaticVehicle(595,2280.8005,525.0524,0.1593,317.8949,112,20); // launch
	AddStaticVehicle(595,3642.0657,531.2183,-0.5265,87.8562,112,20); // launch
	//202
    // JETMAX
    AddStaticVehicle(493,2367.1226,514.3972,-0.0291,177.5325,-1,-1); // letmax
    AddStaticVehicle(493,2352.3398,514.6149,-0.1203,178.0770,-1,-1); // jetmax
	AddStaticVehicle(493,3700.3523,536.7863,-0.3763,267.7268,-1,-1); // jetmax
	AddStaticVehicle(493,3981.5759,443.6727,1.2028,182.0452,-1,-1); // jetmax
	AddStaticVehicle(493,2619.1726,536.8918,1.2353,102.1477,-1,-1); // jetmax
	AddStaticVehicle(493,2319.9363,487.3689,-0.1096,88.0939,-1,-1); // jetmax
	AddStaticVehicle(493,1628.6343,570.8010,-0.1023,89.2489,-1,-1); // jetmax
	AddStaticVehicle(493,-87.5311,-572.5739,-0.1772,215.5085,-1,-1); // jetmax
	AddStaticVehicle(493,301.5171,-1936.7384,-0.1729,307.8127,-1,-1); // jetmax
	AddStaticVehicle(493,324.5273,-1931.1113,0.0345,192.7069,-1,-1); // jetmax
	AddStaticVehicle(493,720.0939,-1701.7401,-0.2107,354.2910,-1,-1); // jetmax
	AddStaticVehicle(493,719.7071,-1635.2107,0.0227,359.6180,-1,-1); // jetmax
	AddStaticVehicle(493,2446.8323,-2716.9158,0.2881,267.0415,-1,-1); // jetmax
	AddStaticVehicle(493,2597.2388,-2479.9136,-0.2891,266.8047,-1,-1); // jetmax
	//216
    // ADMIN STATION
	AddStaticVehicle(560,2076.2837,1260.0215,10.3314,179.9376,0,0); // sultan admin 212
    AddStaticVehicle(451,2114.4238,1235.1420,10.5268,267.4263,0,0); // turismo admin 213
 	AddStaticVehicle(562,2076.2898,1266.0883,10.3315,179.9381,0,0); // elegy admin 215
 	AddStaticVehicle(558,2092.1531,1270.5258,10.4498,90.0759,0,0); // uranus admin 216
	//220
    // PATRIOT
    AddStaticVehicle(470,2532.7153,2092.9478,10.7395,2.1899,-1,-1); // gun delivery patriot north ammu lv
    AddStaticVehicle(470,2156.2000,935.4752,10.8169,0.1451,-1,-1); // gun dealer patriot south ammu lv
    AddStaticVehicle(470,2233.4819,2453.5588,-7.4597,270.8889,-1,-1); // at lvpd
	AddStaticVehicle(470,2233.4524,2463.1221,-7.4577,271.5103,-1,-1); // at lvpd
    //224
    // big ass plane
    bigassplane = AddStaticVehicle(592,424.8123,2502.6685,16.1906,88.0697,-1,-1); // lvpd car
    



    
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2050.6140,766.8976,10.8748,358.4364,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2194.9690,758.4351,10.4634,321.8647,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2853.6943,1351.7987,10.5653,89.3985,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2803.8445,1336.0048,10.5099,90.8478,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2443.0078,1351.9143,10.5751,267.2689,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2292.3201,1412.0536,11.1552,272.4578,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2362.6128,1537.1456,10.4748,271.0965,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2388.8889,1527.7555,10.5025,90.3741,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2159.5005,1685.5955,10.4456,13.3832,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2145.5491,1806.6722,10.5743,64.3370,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2164.4810,1788.2952,10.5770,0.6319,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2193.1467,1821.1807,10.5756,357.7119,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2210.2905,1878.5878,10.5728,2.0442,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2171.1421,1985.0276,10.5762,272.2237,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2155.8794,2194.3853,10.4258,0.2422,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2107.4939,2207.8359,10.5733,0.0169,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2007.1917,2329.5730,10.5745,272.9804,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2152.9097,2498.2139,10.5725,271.0267,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2080.6187,2468.7502,10.5743,0.5299,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2188.8718,2503.3174,10.5727,0.2020,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2222.0610,2485.2654,10.4989,180.6984,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2249.1836,2407.9487,10.4975,268.8428,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2282.4004,2391.6355,10.4939,181.2938,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2282.4001,2380.0491,10.4930,180.3566,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2363.7346,2474.0330,10.4257,180.5582,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2104.4194,2653.2917,10.5715,266.3527,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1956.4703,2638.9294,10.4990,92.7248,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1903.7441,2764.1165,10.4257,179.8109,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1609.9213,2720.5266,10.5755,178.0471,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2039.9487,1627.5925,10.4265,179.8016,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2039.8638,1604.3782,10.4265,179.7895,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2075.8599,1330.2247,10.4257,181.6968,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2075.8740,1347.9667,10.4268,179.4070,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1663.0021,-175.4015,35.0692,183.5223,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2346.1953,-1599.8646,22.4131,179.0826,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2473.2693,-1695.9027,13.2700,175.1110,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2498.8408,-1682.3564,13.1262,108.3925,94,1); // new spawncars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2486.2708,-1682.8748,13.0884,90.0212,94,1); // new spawncars
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],836.8254,837.4991,12.3054,30.2748,-1,-1); // hunter quarry
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-292.1061,1298.8613,53.9015,260.9147,-1,-1); // bigear spawn
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1533.5408,2643.0444,55.9283,267.6417,-1,-1); // out by sherrif office
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2451.1023,1266.9518,10.9127,178.3685,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2631.2710,1067.4596,10.9127,358.7852,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1930.2173,2654.7783,10.9127,359.3286,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2460.9785,928.3632,10.9127,269.5720,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1641.8040,1308.1658,10.5474,90.2293,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1341.4496,1266.1099,10.5474,270.1592,-1,-1); // at air unit
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1021.6139,1921.1182,10.8739,89.9047,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2139.1897,1408.8348,10.5474,179.1921,-1,-1); // infernus autobahn
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],983.7245,1726.7664,8.3819,268.9172,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1910.1632,2325.4841,10.5474,86.8969,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2134.9392,2469.4993,10.5474,180.2005,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],983.2764,1730.8530,8.4891,90.8395,-1,-1); // voodoo
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1027.2737,1434.5303,5.6586,271.8362,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-175.9688,1222.5707,19.5799,269.0235,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2168.3533,1409.7892,10.5255,92.0394,-1,-1); // Sultan autobahn
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2202.8198,936.6826,10.5252,358.9428,-1,-1); // behind ammu south
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2393.4307,986.3323,10.5257,268.5880,-1,-1); // transfender
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2440.9390,697.7169,10.8556,269.0237,-1,-1); // at drug house
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1478.8868,711.1704,10.4467,286.6846,-1,-1); // chapel
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1529.6085,1020.3997,10.5255,179.2342,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],994.6566,1995.1582,10.8459,270.6577,-1,-1); // in drive in whitewood est
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1089.4946,2194.7002,16.4243,359.9457,-1,-1); // carpark whitewood
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],781.0810,1877.8872,4.6356,88.4915,-1,-1); // ammu desert
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-80.6216,1077.5908,19.4474,0.2646,-1,-1); // fort carson hi k69 carpark
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1928.5724,274.0573,40.7517,178.5947,-1,-1); // wangs
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],983.3817,1722.0114,8.5298,90.6754,-1,-1); // cia place spawn
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],617.6290,1684.9648,6.8672,127.6812,-1,-1); // gas station at ammu desert
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],686.5267,1948.6569,5.4141,0.5892,-1,-1); // big spread ranch
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],780.9633,1882.2065,4.8408,89.5654,-1,-1); // ammu whitewood
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2222.2300,2737.2322,10.6173,1.6180,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2061.4292,2479.7285,10.6953,359.0092,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],894.1536,2041.3546,11.0503,268.4199,-1,-1); // drive whitewood
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1466.5176,2794.3064,10.6180,145.2352,-1,-1); // yellow golf course
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2175.2969,2787.4104,10.6953,179.2941,-1,-1); // burgershot spinybed
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2139.6077,2755.6406,10.6953,89.4185,-1,-1); // gas station spinybed
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2122.4343,2468.9380,10.6953,179.8108,-1,-1); // carpark west of PD
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2119.3088,2073.7498,10.5469,179.1566,-1,-1); // outside sex shop on strip
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2075.7437,1516.4045,10.5469,180.3198,-1,-1); // outside ryal casino
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1200.3418,1605.9650,6.5845,179.6425,-1,-1); // on road near taxi spawn
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-79.0382,1340.8115,10.7928,185.4178,-1,-1); // lil probe in
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-176.6438,1217.0244,19.5219,88.7960,-1,-1); // dohnut shop fort carson
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-404.7926,1370.8772,30.8708,42.2148,-1,-1); // offroad at big ear
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2044.6632,1927.9281,11.9202,354.6493,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1942.2788,1345.0945,8.9603,181.0246,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1947.9371,2639.0198,10.5226,92.0482,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2510.7854,1676.5236,10.5994,314.6122,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2456.5396,1267.3923,10.5997,178.5381,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-336.7605,1514.7904,75.1385,181.1912,-1,-1); // satalite spawn
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-18.1628,2329.3164,23.9201,177.7238,-1,-1); // snakefarm
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-231.9656,2594.9744,62.4826,179.1445,-1,-1); // at cafe on cliff abandond airstrip
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1196.4055,1820.1152,41.4984,45.6327,-1,-1); // clucken bell desert
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],505.6008,1111.3848,14.6296,354.4701,-1,-1); // north of hunter quarry
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-291.4648,1308.0525,53.8902,260.3672,-1,-1); // cafe at big ear
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-330.4060,1514.7786,75.1910,359.6922,-1,-1); // satalite
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1964.7128,2639.1292,10.5749,90.2920,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2204.5981,2730.9722,10.6520,272.0461,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-670.3410,2306.2034,135.2072,90.4189,-1,-1); // jump track across river
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-210.5110,2595.1895,62.5347,177.6762,-1,-1); // cliff over abandond air
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],970.9341,2164.9844,10.6520,270.5607,-1,-1); // meat prosess plant whitewood
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1310.7207,2021.6523,10.9211,91.1905,-1,-1); // drive in redsands
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2142.5046,1426.2795,10.8005,268.6929,-1,-1); // bobcat
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2512.3438,1271.3553,10.8008,358.8993,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2422.2522,1119.8549,10.7286,180.6664,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2460.5740,918.6953,10.8068,88.7742,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2368.7251,1003.8484,10.8130,269.6161,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2151.3071,947.1481,10.7061,359.4868,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2179.5471,987.5303,10.8088,0.1205,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1702.6190,1726.4701,10.8177,0.6847,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1607.5125,1850.4384,10.8098,180.6895,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1474.4716,1901.2627,11.0635,272.1886,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1499.5348,2022.5737,10.7990,180.9890,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1024.5807,1749.4064,10.8083,88.6422,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1082.7098,1795.6642,10.8093,179.4237,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1022.5822,1982.3940,11.1391,357.4550,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],920.0219,2012.7793,11.0556,269.9519,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],796.8222,1691.1097,5.2675,89.5603,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],711.4960,1947.8843,5.5269,359.8099,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],404.3861,2540.0325,16.5288,327.7624,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-22.0977,2328.0559,24.1315,177.9422,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1496.5138,2203.9329,10.8090,359.3404,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1908.3434,2290.1626,10.8081,178.6591,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2166.7024,2349.9302,10.6575,268.9872,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2592.8467,2275.1633,10.8071,89.5999,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1669.7308,1306.2875,10.5538,177.8499,-1,-1); // airport cpark
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1730.3628,1447.8494,10.4771,269.6690,-1,-1); // airport terminal lv
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2222.2300,2730.7529,10.4755,359.2046,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2019.0457,1535.9329,10.4600,269.1005,-1,-1); // pirate ship
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2211.8584,1518.4458,10.5555,179.2325,-1,-1); // behind royal casino
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2445.7397,1629.1641,10.5528,177.3865,-1,-1); // behind caligs
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2458.5210,1337.0839,10.5538,359.0376,-1,-1); // carpark near caligs
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2549.6392,1318.4952,10.4744,90.0143,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2647.2390,1098.4166,10.5510,268.8929,-1,-1); // gas station
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2309.3301,699.2015,10.8861,181.5882,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2134.8291,1426.2422,10.5636,269.5263,-1,-1);
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2139.8093,1794.5874,10.5635,63.0217,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2509.0706,2133.0024,10.4142,269.5813,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2103.7922,2072.6116,10.5637,89.5842,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1693.0393,2053.3630,10.9362,90.2718,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1391.9200,1927.5245,10.4863,0.3621,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],676.7159,1948.0022,5.2821,359.2208,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-84.3122,1370.4288,10.0163,184.9445,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-101.0278,1336.9587,9.9952,5.1794,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],50.1873,1382.6958,10.8168,187.0010,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],98.6146,1062.7432,13.3525,180.9205,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-317.8594,1514.7922,75.0378,178.9677,-1,-1);
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-292.7351,1294.7372,53.3600,259.0432,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-176.2906,1225.6606,19.4219,270.1168,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-26.1015,2326.6606,23.8203,178.0624,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-208.4279,2767.8000,62.1466,357.6187,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2817.9731,2247.1655,10.5000,268.0619,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-213.2182,2609.1267,62.3828,180.1487,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],348.1575,2540.0422,16.4285,1.0227,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1470.8833,2799.5376,10.4234,132.2754,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1644.5061,2737.6892,10.4229,270.5334,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1959.8740,2755.2695,10.5000,359.8044,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2171.4063,2000.5366,10.5000,90.3243,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1392.7075,705.3434,10.5041,180.2693,-1,-1); // windsor
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-681.3878,966.9536,11.8166,268.7682,-1,-1); // windsor
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1457.0267,1870.2560,32.3172,182.4489,-1,-1); // windsor
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1716.3654,1470.8850,10.3304,163.3052,-1,-1); // elegy lv airport
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2300.9243,1433.6844,10.4829,89.9353,-1,-1); // elegy multistory
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2099.2659,1749.8036,10.8315,332.1214,-1,-1); // elegy caligs
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2044.0842,2142.6130,10.4799,271.7972,-1,-1); // elegy lane off strip
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2529.3408,2540.2446,10.4802,270.4623,-1,-1); // elegy
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2216.1257,1518.4196,10.6585,180.2177,-1,-1); // phoenix
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2103.4451,2079.1924,10.6584,271.0941,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2502.0288,2132.9226,10.5101,271.5238,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2587.6111,2056.8606,10.6585,90.8876,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2565.2998,1387.2158,10.6588,178.9306,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2433.0154,692.6452,10.5813,180.8976,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],984.1456,1734.8074,8.4900,271.4649,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],726.7349,1947.5322,5.3775,359.7186,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2491.8164,936.2037,10.6657,359.5074,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-105.2983,1094.8826,19.4322,89.8165,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-159.0712,1234.0072,19.5806,182.7559,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-354.1105,1521.4944,75.3982,86.8424,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-367.2291,1528.3917,75.2938,260.0083,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-371.3909,1591.6670,76.9201,226.5213,-1,-1); // Satalite
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2785.6228,2196.0696,11.1906,267.7400,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2438.8613,2564.4507,22.2463,163.7896,-1,-1); // monster
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2907.8491,1881.9324,11.6959,177.6743,-1,-1); // monster
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2038.6801,1333.4821,10.4780,180.3118,-1,-1); // alpha
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2342.0325,1006.8772,10.5459,358.8515,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2422.2505,1126.3094,10.5495,179.3824,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2444.6147,1267.3749,10.6272,359.6434,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2504.0164,1413.1415,10.6266,90.3205,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2631.1201,1845.7640,10.6260,270.3058,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2534.4775,2014.5391,10.6268,89.1626,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2440.5342,2017.2339,10.6263,270.7521,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2103.4380,2062.7900,10.6270,268.5229,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2075.2107,2042.4025,10.6262,270.2822,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2533.5251,929.2467,10.6332,268.3806,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2393.8105,989.9267,10.6263,268.6155,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2189.0762,921.4905,10.6263,270.9811,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1878.4082,2061.2112,10.6269,254.0050,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1731.2261,1928.2024,10.6269,90.2971,-1,-1); // new alpha
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1373.4199,1903.6282,10.9680,91.8769,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1024.9696,1793.7625,10.6266,88.4433,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],781.0677,1886.7731,4.8076,88.5104,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],681.2740,1948.1652,5.3458,357.4381,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-9.3990,2341.9578,23.9466,270.1199,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-96.0419,2657.9988,41.7356,201.2648,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-222.8627,2595.2273,62.5092,180.9099,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-303.4222,2706.5068,62.4170,93.7133,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1940.0819,2163.8765,10.4169,180.8596,-1,-1);
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2104.3523,2098.3245,10.4130,273.1944,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2441.1829,707.4238,10.7743,88.7547,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2166.1479,1193.3717,10.3299,158.6668,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1534.0114,1020.0434,10.4784,176.5594,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1963.9216,2154.8350,10.5752,89.8630,-1,-1); // 350
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2038.7606,1468.8704,10.4258,179.9187,-1,-1); // 350
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2076.2529,1310.6661,10.4258,180.2438,-1,-1); // 350
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2131.9915,935.5422,10.5735,359.5219,-1,-1); // 350
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2264.5498,2418.4700,10.5401,90.6762,-1,-1); // esperanto
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2195.3406,2502.8000,10.6177,179.4278,-1,-1); // esperanto
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1899.9891,2419.2949,10.6198,90.1853,-1,-1); // esperanto
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1978.5405,2239.5093,26.9928,89.9080,-1,-1); // esperanto
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1525.9907,2280.7429,10.6178,0.3453,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2818.1323,2238.8782,10.7877,269.5479,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2220.0222,957.9650,10.7881,3.9536,-1,-1); // hotknife
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2016.8037,1334.5527,9.5748,269.6653,-1,-1); // hotknife
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2352.4038,1412.1626,10.7835,269.7344,-1,-1); // hotknife
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2784.6040,1648.2450,10.7967,299.2473,-1,-1); // hotknife
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2044.9230,1905.8262,12.0130,183.7422,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2044.1902,1916.5961,12.0222,180.1309,-1,-1); //
    AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2070.7637,2318.5427,10.3382,52.5716,-1,-1); // new cars
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2026.6682,2652.4243,10.4800,2.4317,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1777.7482,2717.1541,10.3310,89.8452,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1352.3927,2695.5054,10.4785,0.6355,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1286.0125,2648.6936,10.4803,1.4406,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],997.3206,2631.0491,10.4391,142.7486,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],941.8555,2325.2915,10.4794,195.3492,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],632.1021,1695.5710,6.6544,215.5264,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],541.6105,1549.0546,0.6281,115.7740,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],259.1303,1144.8044,10.6470,117.0184,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1299.0778,263.2774,18.9728,338.3049,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1212.3887,363.8045,19.0226,65.9972,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],482.1411,-333.7878,35.5909,165.0099,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],242.2467,-1343.9393,51.6967,309.9397,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],414.8512,-1235.9982,50.7138,291.5662,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1020.0690,-1043.6227,30.9945,268.7721,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1045.9290,-1043.7478,31.3842,269.9538,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],1361.3573,-1273.4440,12.9492,180.2498,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],2161.9277,-1631.7932,13.6069,255.7534,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-2211.8093,572.0299,34.5817,268.9936,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1820.9757,598.9570,34.5830,271.5713,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1699.3866,1269.6954,28.6220,339.6370,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1657.9635,1213.2469,6.8155,72.6146,-1,-1); //
	AddStaticVehicle(VehileIDPermessed[random(sizeof(VehileIDPermessed))],-1599.9417,672.4755,6.7568,2.0388,-1,-1); //
    
  for (new c = 0; c < 650; c++)
    {
    BoughtCars[c] =0;
    }
	LinkVehicleToInterior(155, 15);
	LinkVehicleToInterior(156, 15);
	LinkVehicleToInterior(157, 15);
	LinkVehicleToInterior(158, 15);
	LinkVehicleToInterior(159, 15);
	LinkVehicleToInterior(160, 15);
	LinkVehicleToInterior(161, 15);
	LinkVehicleToInterior(162, 15);
	LinkVehicleToInterior(163, 15);
	LinkVehicleToInterior(164, 15);

    

	// Houses

    
    AddStaticHouse(2057.992675,740.112731,11.072335,295.138977,1474.469971,1080.519897,15); //near drug house
    AddStaticHouse(2048.617919,740.605163,11.135785,223.043991,1289.259888,1082.199951,1); //
    AddStaticHouse(1980.703735,737.622680,10.820312,2451.77, -1699.80,1013.51,2); //
    AddStaticHouse(-368.303436,1510.434204,76.311706,2262.83,-1137.71,1050.63,10); //at the desert
    AddStaticHouse(-309.984924,1304.043457,53.664344,2451.77, -1699.80,1013.51,2); //at the desert spawn

    // ATM MACHINES
    CreateObject(2754, 2194.1799,1974.6198,12.2894, 0, 0, 0); // ATM OFF STRIP 24-7
    CreateObject(2754, 1139.6754,2088.2290,11.0625, 0, 0, 0); // ATM WHITEWOOD EST
    CreateObject(2754, 2233.2556,959.6172,10.8203, 0, 0, 0); // ATM AMMU SOUTH
    CreateObject(2754, 2541.4844,2266.1074,10.8203, 0, 0, 0); // ATM ROCA EAST
    // LVPD GATES
	southcopgate = CreateObject(16775, 2320.6426,2445.9233,5.2734, 0,0,90.0); //lvpd southern gate
    westcopgate = CreateObject(16775, 2294.1990,2500.2039,4.2959, 0,0,90.0); //lvpd western gate
    // CALIGS VAULT
	bombdoor = CreateObject(5043, 2144.2280,1627.0021,994.2676, 0,0,90.0); //caligs bomb door
    CreateObject(5043, 2146.0840,1629.4834,993.5761, 10.0,20.0,95.0); //caligs bomb door after blow
    CreateObject(1501,2142.4000,1620.9189,1000.0688, 0,0,0); // blocked off glitch
	// RAMPS
    CreateObject(1655, 2094.3435,1085.0034,10.4791, 0,0,200.0); //rampcomealot
    CreateObject(1655, 2051.2725,825.4291,6.8265, 0,0,180.0); //rampbottomofstrip
    CreateObject(1655, 2121.9558,1749.3987,10.3850, 0,0,290.0); //rampcaligs
	// ALCATRAZ
	CreateObject(10610,3818.9189,462.4248,44.9047, 0,0,0); //alkatraz building
    CreateObject(9241, 3747.5049,462.7799,35.9160, 0, 0, 0); // Helipad
    CreateObject(16684,3843.6028,466.0061,35.0500, 0,0,0); //runway alkatraz TEMPHEIGHT
    CreateObject(16684,3800.6028,466.0061,35.1500, 0,0,0); //runway alkatraz TEMPHEIGHT
    CreateObject(7020,3903.8245,439.2713,0.1845, 90.0,0,0); //temp rock south side
    CreateObject(7020,3847.9900,439.2713,0.1845, 90.0,0,0); //temp rock south side
    CreateObject(7020,3792.3772,439.2713,0.1845, 90.0,0,0); //temp rock south side
    CreateObject(7020,3736.7644,439.2713,0.1845, 90.0,0,0); //temp rock south side
    CreateObject(7020,3681.1516,439.2713,0.1845, 90.0,0,0); //temp rock south side
    CreateObject(7020,3925.3245,490.3089,0.1845, 90.0,180.0,0); //temp rock north side
    CreateObject(7020,3869.7117,490.3089,0.1845, 90.0,180.0,0); //temp rock north side
    CreateObject(7020,3814.0989,490.3089,0.1845, 90.0,180.0,0); //temp rock north side
    CreateObject(7020,3758.4861,490.3089,0.1845, 90.0,180.0,0); //temp rock north side
    CreateObject(7020,3702.8733,490.3089,0.1845, 90.0,180.0,0); //temp rock north side
    CreateObject(7020,3661.5684,475.2261,0.1845, 90.0,-90.0,0); //temp rock west side
    CreateObject(7020,3946.0205,454.2261,0.1845, 90.0,-270.0,0); //temp rock east side
    CreateObject(9829,3653.1909,469.4975,-60.0422, 0,0,0); //temp jetty
    CreateObject(1696,3719.6230,440.2697,36.1664, 0,0,0); //temp fucking graphic coverup
    CreateObject(3361,3662.1975,434.8389,7.2625, 0,0,180.0); //alkatraz jetty stairs 1
    CreateObject(3361,3670.5000,434.8389,11.2625, 0,0,180.0); //alkatraz jetty stairs 2
    CreateObject(3361,3678.8025,434.8389,15.2625, 0,0,180.0); //alkatraz jetty stairs 3
    CreateObject(3361,3687.1050,434.8389,19.2625, 0,0,180.0); //alkatraz jetty stairs 4
    CreateObject(3361,3695.4075,434.8389,23.2625, 0,0,180.0); //alkatraz jetty stairs 5
    CreateObject(3361,3703.7100,434.8389,27.2625, 0,0,180.0); //alkatraz jetty stairs 6
    CreateObject(3361,3712.0125,434.8389,31.2625, 0,0,180.0); //alkatraz jetty stairs 7
    CreateObject(3361,3720.3150,434.8389,35.2625, 0,0,180.0); //alkatraz jetty stairs 7
    CreateObject(3361,3724.0175,440.9389,35.2625, 0,0,90.0); //alkatraz jetty stairs 7
    CreateObject(16133,3949.3660,436.9482,-3.0720, 0,0,0);  // rear rocks
	CreateObject(16133,3949.5146,443.9666,-3.0720, 0,0,0);  // rear rocks
	CreateObject(16133,3949.5020,456.9551,-3.0720, 0,0,0);  // rear rocks
	CreateObject(16133,3950.1038,469.2790,-3.0720, 0,0,0);  // rear rocks
	CreateObject(16133,3950.0002,480.4923,-3.0720, 0,0,0);  // rear rocks
	CreateObject(16133,3949.7227,491.7022,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3939.9426,434.4523,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3931.4194,435.1336,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3915.6609,434.1054,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3900.5269,434.9130,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3877.0825,434.7708,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3861.7368,434.8331,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3842.6758,434.4243,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3824.8665,434.0956,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3804.7859,434.6244,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3789.3418,434.9493,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3772.1704,435.3078,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3755.1541,434.6487,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3736.2070,434.6945,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3715.8875,434.3674,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3704.3535,425.3149,-3.0720, 0,0,-260.0); //south rocksv
	CreateObject(16133,3694.1118,423.1894,-3.0720, 0,0,-260.0); //south rocks
	CreateObject(16133,3924.9871,494.2710,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3909.9592,494.3855,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3887.1895,495.0713,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3868.9417,495.3724,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3852.3093,494.3452,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3833.7080,494.7250,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3815.5708,494.6730,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3798.0154,494.6982,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3782.4626,494.5486,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3768.0962,494.8924,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3750.6816,496.3246,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3736.1655,495.4835,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3719.0859,495.2566,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3712.8257,502.3133,-3.0720, 0,0,260.0); //north rocks
	CreateObject(16133,3722.2229,515.6876,-3.0720, 0,0,260.0); //north rocks
    CreateObject(3279,3919.0789,446.4962,34.9047, 0,0,180.0); //alkatraz a69 tower
    CreateObject(3279,3917.3616,480.4556,34.9047, 0,0,180.0); //alkatraz a69 tower
    CreateObject(3279,3667.6270,444.2554,34.9047, 0,0,0); //alkatraz a69 tower
    CreateObject(3279,3666.9414,483.3572,34.9047, 0,0,0); //alkatraz a69 tower
    CreateObject(3877,3577.4614,493.6883,6.2625, 0,0,0); //alkatraz red light jetty
    CreateObject(3877,3577.3799,463.3489,6.2625, 0,0,0); //alkatraz red light jetty
    CreateObject(3876,3808.4646,464.9513,55.4060, 0,0,0); //// long ariel
    CreateObject(1695,3828.4995,460.1334,55.4060, 0,0,0); //vent
    CreateObject(1694,3813.6328,454.2547,60.4060, 0,0,0); // ariel stack
	CreateObject(3502,3785.1304,504.2955,7.8628, 0,0,0); // sewer pipe
	// AIRCRAFT CARRIER
	CreateObject(10771,2969.0896,472.0975,5.8692, 0,0,0.0); // hull
	CreateObject(11145,2906.0896,472.0975,4.8692, 0,0,0.0); // lower deck
	CreateObject(11149,2963.0000,466.9000,12.4000, 0,0,0.0); // corridors
	CreateObject(11146,2960.2000,472.6000,12.7392, 0,0,0.0); // hanger
	CreateObject(10770,2972.2000,464.5000,39.0692, 0,0,0.0); // bridge
	CreateObject(10772,2970.3500,472.0975,17.6666, 0,0,0.0); // lines
	carrierlift = CreateObject(3115,2870.2490,472.1000,17.3583, 0,0,0.0); // lift
	CreateObject(11237,2976.3320,464.2060,31.5689, 0,0,0.0); // bits
   	// LVPD CAMS
   	CreateObject(1886,195.2251,172.8935,1006.1265, 10.0,0,-150.0); // cam cell 3
    CreateObject(1886,199.4642,172.9892,1006.1265, 10.0,0,-150.0); // cam cell 2
    CreateObject(1886,196.6696,163.5814,1006.1265, 10.0,0,40.0); // cam cell 1
	// ADMIN HQ INTERIOR
    CreateObject(17951,966.4022,-52.9265,1001.1172, 90.0,0,0); // admin hq garage door interior
	// LVPD AIR STAIR
	CreateObject(3743,1334.2067,1270.0383,13.8203,0,0,0); // stair lift
    CreateObject(6157, 2095.9791,1235.3461,19.8577, 0, 0, 0); //NEw house againnnnnnnn
    CreateObject(17951,-2638.4917,1403.5358,908.4609, 90.0,0,90.0); //block lowe admin hq jissy
    CreateObject(17951,-2634.8997,1403.5358,908.4609, 90.0,0,90.0); //block lowe admin hq jissy
    CreateObject(10773,-2636.7417,1413.4395,7.1016, 0,0,0); //block outside jizzy lower
    CreateObject(10773,-2662.8811,1410.7958,23.8984, 0,0,90.0); //block outside jizzy upper
    CreateObject(3852,-2661.0266,1416.9397,922.4953, 0,0,0); // inside block upper
    CreateObject(7521, 2086.4880,1353.7477,11.8203, 0, 0, 90.0); // wall
	// REDSANDS Door Block
	CreateObject(17951,1133.2029,-11.8315,1000.6797, 90.0,0,90.0); // garage door interior
	// REDSANDS Door Block
	CreateObject(2003,351.8482,217.2340,1007.3828, 0.0,0,90.0); // safe in city hall

    CarSold[3] =0;
    CarSold[4] =0;
    CarSold[5] =0;
    CarSold[6] =0;
    CarSold[7] =0;
    CarSold[8] =0;
    CarSold[9] =0;
    CarSold[10] =0;
    CarSold[11] =0;
    CarSold[12] =0;
    CarSold[13] =0;
    CarSold[14] =0;
    CarSold[15] =0;
    CarSold[16] =0;
    CarSold[17] =0;
    CarSold[18] =0;
    CarSold[19] =0;
    CarSold[20] =0;
    CarSold[21] =0;
    CarSold[22] =0;
    CarSold[23] =0;
    CarSold[24] =0;
    CarSold[25] =0;
    CarSold[26] =0;
    CarSold[27] =0;
    CarSold[28] =0;
    CarSold[29] =0;
    CarSold[30] =0;
    BonusCars[1] = 0;
    BonusCars[2] = 0;


	
	return 1;
}

public OnGameModeExit()
{
    ircDisconnect(EchoConnection);
	return 1;
}


public EventTimer()
{
	TimerSet = true;
	ircPollEvents();
}
public ircOnConnect(conn)
{
	ircJoinChan(conn, EchoChan);                    // join the echo channel
	if (!TimerSet) SetTimer("EventTimer", 500, 1);  // listen for callbacks from this channel
	Connections++;                                  // save number of connections
	ircSendRawData(conn, "PRIVMSG NickServ :IDENTIFY baw4422455rer");
}



stock ircIsOp(conn,channel[],user[])
{
	new ircLevel[3];
	ircGetUserLevel(conn, channel, user, ircLevel);
	if(!strcmp(ircLevel, "~", true,1) || !strcmp(ircLevel, "&", true,1) || !strcmp(ircLevel, "@", true,1)) return 1;
	return 0;
}

stock ircHasVoice(conn,channel[],user[])
{
	new ircLevel[4];
	ircGetUserLevel(conn, channel, user, ircLevel);
	if(!strcmp(ircLevel, "+", true,1)) return 1;
	return 0;
}



public ircOnUserSay(conn, channel[], user[], message[])
{
	if (channel[0] != '#') return 0;

	if (message[0] != '!') return 1; 			// we only want messages starting with ~
 	new space = (strfind(message, " "));    	// find the location of the space
 	new cmdlen;                             	// holds the length of the command

 	if (space>=1)                           	// do we have a space?
 	{
		new lenmsg = strlen(message);           // get the length of the entire message
		cmdlen = ((lenmsg-(lenmsg-space))-1);   // generate length of command
  	}
  	else
  	{
		cmdlen = (strlen(message)-1);			// generate the length of command
	}
	if (cmdlen == 3)                            // is our command 3 characters long?
	{
		irccmd(say,3,conn,channel,user,message);
		irccmd(ban,3,conn,channel,user,message);
	}
	else if (cmdlen == 4)                       //is our command 4 characters long?
	{
		irccmd(join,4,conn,channel,user,message);
		irccmd(kick,4,conn,channel,user,message);
	}
	return 1;
}



irccmd_say(conn, channel[], user[], params[])
{
    if (!ircIsOp(conn,channel,user) && !ircHasVoice(conn,channel,user)) return false;
	printinfo
	new msg[112];
	format(msg,sizeof(msg), "%s(IRC) %s", user, params);
	SendClientMessageToAll(0x2587CEAA, msg);
	format(msg, sizeof(msg), "%s(IRC) %s", user, params);
	ircSay(conn, channel, msg);
	return true;
}

irccmd_join(conn,  channel[], user[],  params[])
{
    if (!ircIsOp(conn,channel,user)) return false;
	printinfo
	new strmessage[64];
	format(strmessage, sizeof(strmessage), "2*** Joining channel \2;%s's\2;...", params);
	ircSay(conn, channel, strmessage);
	ircJoinChan(conn, params);
	return true;
}

irccmd_kick(conn,  channel[], user[],  params[]) // supports kicking by partial nickname
{
	if (!ircIsOp(conn,channel,user)) return false;
	printinfo
	new strname[25];
	new strmessage[150];
	for (new a=0; a<=MAX_PLAYERS; a++)
	{
	    if (IsPlayerConnected(a))
	    {
			GetPlayerName(a,strname,16);
			new space = (strfind(strname, params));
			if (space != -1)
			{

				format(strmessage, sizeof(strmessage), "**(ADMIN KICK)** \2;%s(%d)\2;", strname,a);
				SendClientMessageToAll(0xFF7F50AA, strmessage);
				ircSay(conn,channel,strmessage);
				Kicking[a] =1;
				SetTimer("KickPlayer",700,0);
				return true;
			}
		}
 	}
 	format(strmessage, sizeof(strmessage), "2*** \2;%s\2; is not found on the server.", params);
 	ircSay(conn,channel,strmessage);
	return true;
}


irccmd_ban(conn,  channel[], user[],  params[]) // supports banning by partial nickname
{
	if (!ircIsOp(conn,channel,user)) return false;
	printinfo
	new strname[25];
	new strmessage[150];
	for (new a=0; a<=MAX_PLAYERS; a++)
	{
	    if (IsPlayerConnected(a))
	    {
			GetPlayerName(a,strname,16);
			new space = (strfind(params, strname));
			if (space != -1)
			{

				format(strmessage, sizeof(strmessage), "**(ADMIN BAN)** \2;%s(%d)\2;", strname,a);
				SendClientMessageToAll(0xFF7F50AA, strmessage);
				ircSay(conn,channel,strmessage);
    			if(udb_Exists(PlayerName(a)) && PLAYERLIST_authed[a]) {
				dUserSetINT(PlayerName(a)).("nameban",1);
				}
				Banning[a] = 1;
          		SetTimer("BanPlayer",700,0);
				return true;
			}
		}
 	}
 	format(strmessage, sizeof(strmessage), "2*** \2;%s\2; is not found on the server.", params);
 	ircSay(conn,channel,strmessage);
	return true;
}


public ircOnUserPart(conn, channel[], user[])
{
	return 1;
}

public ircOnUserJoin(conn, channel[], user[])
{
	return 1;
}



public announcement()
{
	new File:messagefile;
	new line[256]; 
	if (fexist("messages.txt"))
	{
		messagefile = fopen("messages.txt");
		fread(messagefile, line, sizeof (line)); 
		new i = strval(line); 
		i = random(i) + 1;
		for (; i > 0; i--)
		{
			fread(messagefile, line, sizeof (line));
		}
		SendClientMessageToAll(0x5F9EA0AA, line);
		printf("%s",line);
		fclose(messagefile);
	}
	
}

public twofoursevenmoveplayer()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
	if(IsPlayerConnected(i) && IsSpawned[i] == 1 && GetPlayerInterior(i) == 0 && Jailed[i] == 0)
	{
	if(TimeToMoveTwoFourSeven[i] >=1 && TimeToMoveTwoFourSeven[i] <=3)
	{
	TimeToMoveTwoFourSeven[i] --;
	}
	if(TimeToMoveTwoFourSeven[i] == 0)
	{
	if(LeftTwoFourSeven[i] == 1)
	{
		SetPlayerVirtualWorld(i,0);
    	SetPlayerInterior(i,0);
    	SetPlayerPos(i,1592.2305,2214.1846,10.8203);
    	SetPlayerFacingAngle(i,187.0764);
    	SetCameraBehindPlayer(i);
    	LeftTwoFourSeven[i] =999;
    	TimeToMoveTwoFourSeven[i] =999;
    	TogglePlayerControllable(i, 1);
   	}
    if(LeftTwoFourSeven[i] == 2)
	{
    	SetPlayerVirtualWorld(i,0);
    	SetPlayerInterior(i,0);
    	SetPlayerPos(i,2191.6472,2476.4624,10.8203);
    	SetPlayerFacingAngle(i,272.7751);
    	SetCameraBehindPlayer(i);
    	LeftTwoFourSeven[i] =999;
    	TimeToMoveTwoFourSeven[i] =999;
    	TogglePlayerControllable(i, 1);
    }
    if(LeftTwoFourSeven[i] == 3)
	{
    	SetPlayerVirtualWorld(i,0);
    	SetPlayerInterior(i,0);
    	SetPlayerPos(i,2630.5876,1124.3673,10.8203);
    	SetPlayerFacingAngle(i,177.8683);
    	SetCameraBehindPlayer(i);
    	LeftTwoFourSeven[i] =999;
    	TimeToMoveTwoFourSeven[i] =999;
    	TogglePlayerControllable(i, 1);
    }
    if(LeftTwoFourSeven[i] == 4)
	{
    	SetPlayerVirtualWorld(i,0);
    	SetPlayerInterior(i,0);
    	SetPlayerPos(i,2108.0222,901.5873,10.8203);
    	SetPlayerFacingAngle(i,2.9187);
    	SetCameraBehindPlayer(i);
    	LeftTwoFourSeven[i] =999;
    	TimeToMoveTwoFourSeven[i] =999;
    	TogglePlayerControllable(i, 1);
    }
    if(LeftTwoFourSeven[i] == 5)
	{
    	SetPlayerVirtualWorld(i,0);
    	SetPlayerInterior(i,0);
    	SetPlayerPos(i,664.9492,1726.6813,6.9922);
    	SetPlayerFacingAngle(i,42.5792);
    	SetCameraBehindPlayer(i);
    	LeftTwoFourSeven[i] =999;
    	TimeToMoveTwoFourSeven[i] =999;
    	TogglePlayerControllable(i, 1);
    }
    if(LeftTwoFourSeven[i] == 6)
	{
    	SetPlayerVirtualWorld(i,0);
    	SetPlayerInterior(i,0);
    	SetPlayerPos(i,2142.6326,2739.4309,10.8203);
    	SetPlayerFacingAngle(i,5.6754);
    	SetCameraBehindPlayer(i);
    	LeftTwoFourSeven[i] =999;
    	TimeToMoveTwoFourSeven[i] =999;
    	TogglePlayerControllable(i, 1);
    }
  }
}
}
}
public Float:GetDistanceBetweenPlayers(p1,p2){
new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
if (!IsPlayerConnected(p1) || !IsPlayerConnected(p2)){
return -1.00;
}
GetPlayerPos(p1,x1,y1,z1);
GetPlayerPos(p2,x2,y2,z2);
return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));

}

IsNumeric(const string[])
{
for (new i = 0, j = strlen(string); i < j; i++) {
    if (string[i] > '9' || string[i] < '0') {
return 0;
}
}

return 1;
}
    

public commitedcrimerecent()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(commitedcrimerecently[i] >= 1)
	  {
        commitedcrimerecently[i] --;

    }
  }
}
	
public PlantC4One()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	if(IsSpawned[i] == 1 && PlantingC4[i] == 1)
	{
	    
	    SetPlayerPos(i,2142.0176,1625.8782,993.6882);
	    SetPlayerFacingAngle(i,354.8549);
	    SetCameraBehindPlayer(i);
		ApplyAnimation(i, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0); // Place Bomb
		SetTimer("PlantC4Two",4000,0);
	}
  }
}

public PlantC4Two()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	if(IsSpawned[i] == 1 && PlantingC4[i] == 1)
	{
	    SetPlayerPos(i,2144.2222,1625.9305,993.6882);
	    SetPlayerFacingAngle(i,2.4904);
	    SetCameraBehindPlayer(i);
		ApplyAnimation(i, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0); // Place Bomb
		SetTimer("PlantC4Three",4000,0);
	}
  }
}
public PlantC4Three()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	if(IsSpawned[i] == 1 && PlantingC4[i] == 1)
	{
	    SetPlayerPos(i,2146.2612,1626.0862,993.6882);
	    SetPlayerFacingAngle(i,356.1294);
	    SetCameraBehindPlayer(i);
		ApplyAnimation(i, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0); // Place Bomb
		SetTimer("CaligsC4Explode",7000,0);
		GameTextForPlayer(i,"~r~STAND BACK~n~C4 WILL EXPLODE IN 5 SECONDS", 7000,3);
		TogglePlayerControllable(i, 1);
		RobbedCaligs[i] =1337;
		PlantingC4[i] =0;
	}
  }
}

public CaligsC4Explode()
{
    SetTimer("CaligsRobExplosionsone",200,0);
}


public destroypickups()
{
    for(new p = 13; p < MAX_PICKUPS; p++)
	{
	DestroyPickup(p);
	printf("( PICKUP DESTROYED ) Pickup (%d)",p);
	}
}
//---------------------------------------------
//---------------------------
public CaligsRobRestored()
{
    bombdoor = CreateObject(5043, 2144.2280,1627.0021,994.2676, 0,0,90.0); //caligs bomb door
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	if(RobbedCaligs[i] == 1337)
	{
	RobbedCaligs[i] =0;
	}
	}
	caligsbeingrobbed =0;
}


public CaligsRobExplosionsone()
{
    CreateExplosion(2142.5193,1626.4860,993.6882, 2, 10.0); // Explosion one
    printf("explosion1");
    SetTimer("CaligsRobExplosionstwo",200,0);
}

public CaligsRobExplosionstwo()
{
    CreateExplosion(2144.1514,1626.6012,993.6882, 2, 10.0); // Explosion two
    printf("explosion2beforedestroy");
    DestroyObject(bombdoor);
    printf("explosion2afterdestroy");
    SetTimer("CaligsRobExplosionsthree",200,0);
}
public CaligsRobExplosionsthree()
{
    CreateExplosion(2145.9702,1626.4946,993.6882, 2, 10.0); // Explosion three
    SetTimer("CaligsRobRestored",150000,0);
    printf("explosion3");
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	if(RobbedCaligs[i] == 1337)
	{
	new blowername[30];
	new string[200];
	GetPlayerName(i,blowername,30);
	format(string, sizeof(string), "%s(%d) Has blown the door off Caligulas Casino vault with C4",blowername,i);
	SendClientMessageToAll(0x00C7FFAA,string);
    printf("%s", string);
	GameTextForPlayer(i,"~w~YOU HAVE BLOWN THE DOOR OFF~n~COLLECT THE ROBBERY CASH~n~IN THE VAULT CHECKPOINT", 7000,3);
	}
	}
    
    //SetTimer("CaligsRobExplosionsthree",500,0);
}

public BanExplosionone()
{
    CreateExplosion(-127.0526,2258.4316,28.4287, 2, 10.0); // Explosion one
    SetTimer("BanExplosiontwo",500,0);
}

public BanExplosiontwo()
{
    CreateExplosion(-127.0526,2258.4316,28.4287, 2, 10.0); // Explosion two
    SetTimer("CaligsRobExplosionsthree",200,0);
    SetTimer("BanPlayer",500,0);
}








public storerobbedrecent()
{
    if(twofoursevenrobbed1 >= 1)
	{
		twofoursevenrobbed1 --;
	}
	if(twofoursevenrobbed2 >= 1)
	{
		twofoursevenrobbed2 --;
	}
	if(twofoursevenrobbed3 >= 1)
	{
		twofoursevenrobbed3 --;
	}
	if(twofoursevenrobbed4 >= 1)
	{
		twofoursevenrobbed4 --;
	}
	if(twofoursevenrobbed5 >= 1)
	{
		twofoursevenrobbed5 --;
	}
	if(twofoursevenrobbed6 >= 1)
	{
		twofoursevenrobbed6 --;
	}
	if(cityhallrobbedrecent >= 1)
	{
		cityhallrobbedrecent --;
	}

}
     

     
public robbingcityhallcountdown()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            if(robbinghall[i] >= 2)
            {
				robbinghall[i] --;
                new string[100];
                format(string, sizeof(string), "~y~ROBBERY IN PROGRESS~n~~r~STAY IN THE CHECKPOINT");
                GameTextForPlayer(i, string, 2000,3);
			}
			if(robbinghall[i] == 1)
            {
                new hallrobrand = random(150000);
				robbinghall[i] =0;
				new hrobbber[30];
                new string[100];
                new pcol = GetPlayerColor(i);
                GetPlayerName(i,hrobbber,30);
                format(string, sizeof(string), "%s(%d) Has robbed $%d from LV City Hall",hrobbber,i,hallrobrand);
                SendClientMessageToAll(0x00C7FFAA,string);
                ircSay(EchoConnection, EchoChan,string);
                format(string, sizeof(string), "~b~CITY HALL~n~~y~ROBBERY COMPLETE~n~~w~$%d",hallrobrand);
                GameTextForPlayer(i, string, 5000,3);
                GivePlayerMoney(i,hallrobrand);
                format(string, sizeof(string), "LV City Hall Robbery Complete. You robbed a total of $%d",hallrobrand);
                SendClientMessage(i,pcol,string);
                SendClientMessage(i,COLOR_WHITE,"Your respect skill level has been decreased. Type /respect for more info");
                if(robberrank[i] <=39) {
    			SendClientMessage(i,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    			SendClientMessage(i,COLOR_WHITE,"Your respect skill level has been decreased. Type /respect for more info");
    			robberrank[i] +=1;
    			respect[i] -=1;
				}
                printf("%s(%d) has robbed $%d in a LV City Hall Robbery",hrobbber,i,hallrobrand);
			}

		}
	}
}






public robbingstorecountdown()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
        if(robbingstore[i] >= 20)
            {
            robbingstore[i] --;
            robbed[i] ++;
            robbed[i] ++;
            robbed[i] ++;
            robbed[i] ++;
			GameTextForPlayer(i, "~y~ROBBERY IN PROGRESS~n~~b~STAY IN THE CHECKPOINT~n~~w~~r~ ~w~UNLOCKING MONEY SAFE",3000,3);
            }
            if(robbingstore[i] >= 2 && robbingstore[i] <= 19)
            {
            	robbingstore[i] --;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
				robbed[i] ++;
                new string[256];
                new robtimer;
                robtimer = (robbed[i]);
                format(string, sizeof(string), "~y~ROBBERY IN PROGRESS~n~~b~STAY IN THE CHECKPOINT~n~~w~~r~ %d$~w~ ROBBED",robtimer);
                GameTextForPlayer(i, string, 3000,3);
                GivePlayerMoney(i,robtimer);
			}
			if(robbingstore[i] == 1)
            {
                new storerobrand = random(60000);
				robbingstore[i] =0;
				new robbber[30];
                new string[256];
                //new pcol = GetPlayerColor(i);
                //new robtimer;
                //robtimer = (robbed[i]);
                GetPlayerName(i,robbber,30);
                format(string, sizeof(string), "~y~ROBBERY COMPLETE~n~");
                GameTextForPlayer(i, string, 5000,3);
                if(robberrank[i] <=39) {
    			SendClientMessage(i,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    			robberrank[i] +=1;
				}
                printf("%s(%d) has robbed $%d in a 24/7 robbery",robbber,i,storerobrand);
                format(string, sizeof(string), "%s(%d) Has robbed 24/7 Store",robbber,i);
                ircSay(EchoConnection, EchoChan,string);
			}
			
		}
	}
}

public JailFood()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(IsPlayerConnected(i) && Jailed[i] == 1)
	  {
        new Float:health;
        GetPlayerHealth(i, health);
		if(health <=90) {
        SetPlayerHealth(i,health+10);
        }
        SendClientMessage(i, 0xA9A9A9AA, "|_LVPD Prison Service_|");
		SendClientMessage(i,COLOR_WHITE,"(Prison Food) LVPD Has given you couple of food.");
    }
  }
}

stock CreateShamalInt(vehicleid, Float:X, Float:Y, Float:Z)
{
	CreateObject(14404, X, Y, Z, 0.0, 0.0, 0.0);
	CreateObject(1562, floatadd(X, difc[0][0]), floatadd(Y, difc[0][1]), floatsub(Z, difc[0][2]), 0.0, 0.0, difc[0][3]);
	CreateObject(1562, floatadd(X, difc[1][0]), floatsub(Y, difc[1][1]), floatsub(Z, difc[1][2]), 0.0, 0.0, difc[1][3]);
	CreateObject(1562, floatadd(X, difc[2][0]), floatsub(Y, difc[2][1]), floatsub(Z, difc[2][2]), 0.0, 0.0, difc[2][3]);
	CreateObject(1562, floatsub(X, difc[3][0]), floatsub(Y, difc[3][1]), floatsub(Z, difc[3][2]), 0.0, 0.0, difc[3][3]);
	CreateObject(1562, floatsub(X, difc[4][0]), floatsub(Y, difc[4][1]), floatsub(Z, difc[4][2]), 0.0, 0.0, difc[4][3]);
	CreateObject(1562, floatsub(X, difc[5][0]), floatsub(Y, difc[5][1]), floatsub(Z, difc[5][2]), 0.0, 0.0, difc[5][3]);
	CreateObject(14405, X, floatsub(Y, difc[12][1]), floatsub(Z, difc[12][2]), 0.0, 0.0, difc[12][3]);
	ShamalPos[vehicleid][0] = X, ShamalPos[vehicleid][1] = Y, ShamalPos[vehicleid][2] = Z;
}

stock SetPlayerPosInShamal(playerid, shamalid)
{
	SetPlayerPos(playerid, ShamalPos[shamalid][0],
	floatsub(ShamalPos[shamalid][1], 5.87),
	floatsub(ShamalPos[shamalid][2], 0.75));
	SetPlayerFacingAngle(playerid, 0.0);
	SetCameraBehindPlayer(playerid);
}

stock ShamalExists(vehicleid)
{
	if (floatsqroot(floatadd(ShamalPos[vehicleid][0], floatadd(ShamalPos[vehicleid][1], ShamalPos[vehicleid][2]))))
		return 1;
	return 0;
}

stock randomEx(randval)
{
	new rand1 = random(2), rand2;
	if (!rand1) rand2 -= random(randval);
	else rand2 += random(randval);
	return rand2;
}




public cashdrop()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(IsPlayerConnected(i) && IsSpawned[i] ==1 && GetPlayerState(i) == PLAYER_STATE_ONFOOT)
	  {
	  	if(GetPlayerMoney(i) >= 1001000)
	  	{
	  		GivePlayerMoney(i,-1000);
	 	 	new nname[20];
	  		GetPlayerName(i,nname,20);
      		printf("**(CASH DROP)** %s(%d) Has Dropped $1000 ($%d)",nname,i,GetPlayerMoney(i));
      		SendClientMessage(i,COLOR_RED, "You cant carry all of your cash, you have dropped $1000");
      		new Float:X,Float:Y,Float:Z;
			GetPlayerPos(i,X,Y,Z);
     		CreatePickup(1212, 3,X+2,Y,Z);
        }
	 }
 }
}
	
	
public TrashMissionTimer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(OnDelMission[i] == 1337)
	  {
        TrashDeliveryTime[i] ++;
        TrashDeliveryEarnings[i] --;

    }
  }
}





public copshavevctimer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(copshavevc[i] >= 1)
	  {
        copshavevc[i] --;

    }
  }
}


public CopBackUpColour()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(GetPlayerColor(i) == COLOR_PURPLE && ReqBk[i] == 1)
	  {
        SetPlayerToTeamColour(i);
        ReqBk[i] =0;
	    
    }
  }
}


public SouthernCopGate()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && IsSpawned[i] == 1)
		{
          new Float:x, Float:y, Float:z;
	      GetPlayerPos(i, x, y, z);
          if(x >= 2321.0969 && x <= 2336.8127 && y >= 2439.5466 && y <= 2451.8848 || x >= 2310.2278 && x <= 2320.1902 && y >= 2440.9089 && y <= 2452.2144)
          {
		  if(gTeam[i] == TEAM_COP || gTeam[i] == TEAM_ARMY || PlayerAdminLevel[i] == 1337)
		  {
		  if(GateSouthern == 0) // closed
		  {
		  SendClientMessage(i,COLOR_GREY, "|_LVPD Garage Entered_|");
		  SendClientMessage(i,COLOR_GREY, "Welcome to LVPD Garage, you are a police officer.");
            MoveObject(southcopgate, 2320.6426,2445.9233,-2.0000, 2);
            GateSouthern =1; // open
            SetTimer("SouthernCopGateClose",5000,0);
           	//if(isPlayerInArea(i, 2363.7737, -1135.5779, 2366.7964, -1125.8202))
		  }
		 }
		}
	  }
	}
  }
public SouthernCopGateClose()
{
       if(GateSouthern == 1) // open
	   {
            MoveObject(southcopgate, 2320.6426,2445.9233,5.2734, 2);
            GateSouthern =0; // closed
           //if(isPlayerInArea(i, 2363.7737, -1135.5779, 2366.7964, -1125.8202))
        }
      }


    

public selectskill()
{
	for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && IsSpawned[i] == 1 && gTeam[i] >=9)
		{
		    if(canchooseskill[i] == 1)
		    {
				if(canselectskill[i] >=1)
	   			{
					canselectskill[i] --;
        	    }
            	else
				if(canselectskill[i] == 0)
	   			{
				   	SendClientMessage(i,0x1E90FFAA, "Type /commands for your commands");
		        	SendClientMessage(i,0x1E90FFAA, "RAPIST: You can rape other players and infect them with STDs that could kill them");
                	GivePlayerWeapon(i,5,1);
                	GivePlayerWeapon(i,22,100);
                	GivePlayerWeapon(i,14,1);
                	gTeam[i] = TEAM_RAPIST;
                	SetPlayerToTeamColour(i);
                	canchooseskill[i] =0;
                	TextDrawHideForPlayer(i,txtTypeSkill);
				}
			}
		}
	}
}







stock IsPlayerDriverInVehicle(playerid, vehicleid, modelid)
{
	if (IsPlayerInVehicle(playerid, vehicleid) && GetPlayerState(playerid) == 2
	&& GetVehicleModel(GetPlayerVehicleID(playerid)) == modelid)
		return 1;
	return 0;
}


public carrierliftinfotext()
{
	for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && IsSpawned[i] == 1)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(i, x, y, z);
			if(x >= 2860.2568 && x <= 2901.6670 && y >= 459.5847 && y <= 484.5682 && z >= 11.0254 && z <= 19.6801)
			{
				SendClientMessage(i,COLOR_ROYALBLUE,"Aircraft Carrier: Type /liftup or /liftdown to operate the aircraft elevator");
			}
		}
	}
}
public WesternCopGate()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && IsSpawned[i] == 1)
		{
          new Float:x, Float:y, Float:z;
	      GetPlayerPos(i, x, y, z);
          if(x >= 2284.3335 && x <= 2304.8169 && y >= 2492.2542 && y <= 2502.3809)
          {
		  if(gTeam[i] == TEAM_COP || gTeam[i] == TEAM_ARMY || PlayerAdminLevel[i] == 1337)
		  {
		  if(GateWestern == 0) // closed
		  {
            MoveObject(westcopgate, 2294.1990,2510.2039,4.2959, 2);
            GateWestern =1; // open
            SetTimer("WesternCopGateClose",5000,0);
           	//if(isPlayerInArea(i, 2363.7737, -1135.5779, 2366.7964, -1125.8202))
		  }
		 }
		}
	  }
	}
  }
public WesternCopGateClose()
{
       if(GateWestern == 1) // open
	   {
            MoveObject(westcopgate, 2294.1990,2500.2039,4.2959, 2);
            GateWestern =0; // closed
           //if(isPlayerInArea(i, 2363.7737, -1135.5779, 2366.7964, -1125.8202))
        }
      }






public AntiJetpack( )
{
for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && IsSpawned[i] == 1)
		{
          new pSpecialAction = GetPlayerSpecialAction(i);
          if (pSpecialAction == SPECIAL_ACTION_USEJETPACK && PlayerAdminLevel[i] != 1337)
		  {
          new pname[30];
          new string[250];
          new inter;
		  inter = GetPlayerInterior(i);
          GetPlayerName(i, pname, 30);
          format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r",pname,i);
          SendClientMessageToAll(0xFF7F50AA, string);
          ircSay(EchoConnection, EchoChan,string);
          SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN DETECTED AS A CHEATER/HACKER");
          SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN BANNED FROM THIS SERVER");
          SendClientMessage(i,COLOR_RED,"If you think this is a mistake. Visit www.sa-rpg.co.uk to appeal this ban");
          format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r Det:[JetPack] Int:[%d]",pname,i,inter);
          printf("%s", string);
          if(udb_Exists(PlayerName(i)) && PLAYERLIST_authed[i]) {
 		  dUserSetINT(PlayerName(i)).("nameban",1);
    	  }
          SetPlayerInterior(i,10);
          SetPlayerPos(i,219.6257,111.2549,999.0156);
          SetPlayerFacingAngle(i,2.2339);
          SetCameraBehindPlayer(i);
          Banning[i] = 1;
          SetTimer("BanPlayer",700,0);
       }
    }
  }
}
public WantedLevelReduce()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i))
		{
		   if(IsSpawned[i] == 1)
	       {
		      if(commitedcrimerecently[i] == 0)
		      {
                 if(GetPlayerWantedLevel(i) >= 1)
		         {
				   if(copshavevc[i] == 0)
 	   				{
				    	new plwl = GetPlayerWantedLevel(i);
	             		SetPlayerWantedLevel(i,plwl -1);
	             		new criminal[30];
	             		new string[100];
	             		plwl = GetPlayerWantedLevel(i);
	             		new pcol = GetPlayerColor(i);
                 		GetPlayerName(i,criminal,30);
                		format(string, sizeof(string), "Reduced Wanted Level: %d",plwl);
                 		SendClientMessage(i, pcol, string);
                 		format(string, sizeof(string), "**(Reduced Wanted Level)** %s(%d) New Wanted Level: %d",criminal,i,plwl);
                 		printf("%s",string);
                 		ircSay(EchoConnection, EchoChan,string);
              	       }
					}
				}
			}
		}
	}
}





public TaxiDriverOffDutyCriminal()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
        	if(gTeam[i] == TEAM_DRIVER && Driveronduty[i] == 1 && GetPlayerWantedLevel(i) >=1)
        	{
				new drivername[30];
				new string[50];
    			GetPlayerName(i,drivername,30);
    			format(string, sizeof(string), "Driver %s(%d) is off duty",drivername,i);
				SendClientMessageToAll(COLOR_FORESTGREEN,string);
				SendClientMessage(i,COLOR_RED,"The police are looking for you. You are now off duty");
				Driveronduty[i] =0;
			}

		}

	}

}

public fixedcarrecenttimer()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i) && IsSpawned[i] ==1)
        {
               if (fixedcarrecent[i] >= 1)

                {
                    fixedcarrecent[i] --;
				}
			}
		}
	}


/*public PlayerVarDecrease()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
        if(HasCried[i] >=1) {
        HasCried[i] --;
        }
        if(GotCopBriberecently[i] >= 1) {
        GotCopBriberecently[i] --;
        }
        if(SpamStrings[i] >=1) {
		SpamStrings[i] --;
		}
        }
        }
		}

*/












public CopRefillWaitTimer()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i) && IsSpawned[i] ==1)
        {
               if (CopWaitBetweenRefills[i] >= 1)

                {
                    CopWaitBetweenRefills[i] --;
				}
			}
		}
	}
public AutoUnjailAlcatraz()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(Jailed[i] == 1 && InAlcatraz[i] == 1)
            {
                if (JailTime[i] > 0)

                {
                    JailTime[i] --;
                    new jtime;
                    new string[256];
				    jtime = (JailTime[i]);
                    format(string, sizeof(string), "~w~ALCATRAZ~n~..JAILTIME..~n~ %d",jtime);
                    GameTextForPlayer(i, string, 3000,6);
                    JailTimeServed[i] ++;
                }
                if (JailTime[i] == 0)
                {
                 new pname[24];
                 GetPlayerName(i, pname, 24);
                 new string[256];
                 new timeserved;
                 timeserved = (JailTimeServed[i]);
                 SetPlayerPos(i,230.0633,121.7518,1010.2188);
                 SetPlayerFacingAngle(i,208.3710);
                 SetCameraBehindPlayer(i);
                 cannotescapejail[i] =0;
                 SendClientMessage(i, 0xA9A9A9AA, "|_Released From Alcatraz_|");
                 SendClientMessage(i,0x00C7FFAA,"You have been auto-released from Alcatraz. You are free to leave Alcatraz Island");
                 format(string, sizeof(string), "%s(%d) Has been auto-released from Alcatraz. Time Served: %d Seconds",pname,i,timeserved);
                 SendClientMessageToAll(0x00C7FFAA, string);
                 ircSay(EchoConnection, EchoChan,string);
                 Jailed[i] = 0;
                 InAlcatraz[i] =0;
                 JailTimeServed[i] =0;
                }
            }
        }
    }
}

public HitExpires()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(HasHitOnHim[i] >= 1)
            {
                HasHitOnHim[i] --;
            }

        }
    }
}


public GunsDeliveryTimeLimitTimer()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(OnDelMission[i] == 1337 && DeliveringGuns[i] == 1 && GunsDeliveryTime[i] >= 1)
            {
                    GunsDeliveryTime[i] --;
                    new deltime;
                    new string[50];
				    deltime = (GunsDeliveryTime[i]);
                    format(string, sizeof(string), "~w~DELIVERY TIME~n~ %d",deltime);
                    GameTextForPlayer(i, string, 3000,6);

                }
             if(OnDelMission[i] == 1337 && DeliveringGuns[i] == 1 && GunsDeliveryTime[i] == 0)
             {
                 new pname[24];
                 GetPlayerName(i, pname, 24);
                 new string[200];
                 SendClientMessage(i,0xA9A9A9AA, "|_Weapon Delivery Mission Failed_|");
                 SendClientMessage(i,0xADD8E6AA,"You have taken too long to deliver the weapons. The mission is failed");
                 format(string, sizeof(string), "%s(%d) Has failed weapon delivery (time limit)",pname,i);
                 printf("%s",string);
                 OnDelMission[i] =0;
                 GunsDeliveryTime[i] =0;
                 GunDeliveryLevel[i] =0;
                 
                }
            }
        }
    }

public ExplodeShamal(vehicleid)
{
	KillTimer(sExplode[vehicleid]);
	if (tCount[vehicleid])
	{
		CreateExplosion(ShamalPos[vehicleid][0], ShamalPos[vehicleid][1], ShamalPos[vehicleid][2], 2, 15.0);
		sExplode[vehicleid] = SetTimerEx("ExplodeShamal", random(1300)+100, 1, "d", vehicleid);
	}
}


public AutoUnjail()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(Jailed[i] == 1 && InAlcatraz[i] == 0)
            {
                if (JailTime[i] > 0)
                
                {
                    JailTime[i] --;
                    new jtime;
                    new string[256];
				    jtime = (JailTime[i]);
                    format(string, sizeof(string), "~w~..JAILTIME..~n~ %d",jtime);
                    GameTextForPlayer(i, string, 3000,6);
                    JailTimeServed[i] ++;
                }
                if (JailTime[i] == 0)
                {
                 new pname[24];
                 GetPlayerName(i, pname, 24);
                 new string[256];
                 new timeserved;
                 timeserved = (JailTimeServed[i]);
                 SetPlayerInterior(i,3);
                 SetPlayerPos(i,210.5272,146.3341,1003.0234);
                 SetPlayerFacingAngle(i,179.4662);
                 SetCameraBehindPlayer(i);
                 cannotescapejail[i] =0;
                 SendClientMessage(i, 0xA9A9A9AA, "|_Released From Jail_|");
                 SendClientMessage(i,0x00C7FFAA,"You have been auto-released from jail. You are free to leave the Police Station");
                 format(string, sizeof(string), "%s(%d) Has been auto-released from jail. JailTime Served: %d Seconds",pname,i,timeserved);
                 SendClientMessageToAll(0x00C7FFAA, string);
                 ircSay(EchoConnection, EchoChan,string);
                 Jailed[i] = 0;
                 JailTimeServed[i] =0;
                 dUserSetINT(PlayerName(i)).("jailed",Jailed[i]);
				 dUserSetINT(PlayerName(i)).("jailtime",JailTime[i]);
                }
            }
        }
    }
}



public VisitReqTimer()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(VisitReq[i] == 1)
            {
                if (VisitReqExpires[i] > 0)

                {
                    VisitReqExpires[i] --;
                }
                if (VisitReqExpires[i] == 0)
                {
                 
                 SendClientMessage(i, 0xA9A9A9AA, "|_Alcatraz Visiting Pass Expired_|");
                 SendClientMessage(i,0x00C7FFAA,"The visiting pass given to you has expired");
                 VisitReq[i] =0;
                 VisitReqExpires[i] =0;
                }
            }
        }
    }
}



public playerbeenrobbedrecent()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
         if (IsPlayerConnected(i) && beenrobbedrecently[i] >=1)
         {
            beenrobbedrecently[i] --;
		 }
      }
   }


public EscapeCuffsTime()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(IsSpawned[i] == 1 && cuffed[i] == 1)
            {
                if (CuffedTime[i] >= 1)

                {
                    CuffedTime[i] --;
                }
            }
        }
    }
}
public TimeWorld()
{
if(gametime == 23 && gameday == 7)
{
     SendRconCommand("gmx");
}

gametime++;
if(gametime >= 24) {
gametime =0;
}
if(gametime == 0 && gameday <= 7) {
gameday ++;
}
for(new i=0; i < MAX_PLAYERS; i++)
{
	if (IsPlayerConnected(i))
    {
        SetPlayerTime(i,gametime,0);
	}
	
}

new string[30];
SetWorldTime(gametime);
format(string, sizeof(string), "Game Time: %d:00", gametime);
SendClientMessageToAll(0x5F9EA0AA, string);
if(gametime == 0 && gameday == 1) {
SendClientMessageToAll(0x5F9EA0AA,"Game Day: Monday");
}
if(gametime == 0 && gameday == 2) {
SendClientMessageToAll(0x5F9EA0AA,"Game Day: Tuesday");
}
if(gametime == 0 && gameday == 3) {
SendClientMessageToAll(0x5F9EA0AA,"Game Day: Wednesday");
}
if(gametime == 0 && gameday == 4) {
SendClientMessageToAll(0x5F9EA0AA,"Game Day: Thursday");
}
if(gametime == 0 && gameday == 5) {
SendClientMessageToAll(0x5F9EA0AA,"Game Day: Friday");
}
if(gametime == 0 && gameday == 6) {
SendClientMessageToAll(0x5F9EA0AA,"Game Day: Saturday");
}
if(gametime == 0 && gameday == 7) {
SendClientMessageToAll(0x5F9EA0AA,"Game Day: Sunday");
}
if(gametime == 23 && gameday == 7) {
SendClientMessageToAll(0x2587CEAA,"*AutoAdmin: This week is over. The gamemode will restart in one game hour");
SendClientMessageToAll(0x2587CEAA,"*AutoAdmin: Dont forget to visit our website at www.sa-rpg.co.uk");
}
}






public CashCheck()
{
for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if(GetPlayerMoney(i) > OldCash[i])
            {
				new pname[30];
				new string[100];
				new difference;
				difference = GetPlayerMoney(i) - OldCash[i];
				GetPlayerName(i,pname,30);
				printf("**(CASH INCREASE)** %s(%d) money has increased from $%d to $%d (%d) (%d)",pname,i,OldCash[i],GetPlayerMoney(i),difference,GetPlayerInterior(i));
                format(string, sizeof(string), "**(CASH INCREASE)** %s(%d) money has increased from $%d to $%d (%d) (%d)",pname,i,OldCash[i],GetPlayerMoney(i),difference,GetPlayerInterior(i));
				ircSay(EchoConnection, EchoChan,string);
				if(difference >= 1500000 && PlayerAdminLevel[i] != 1337) {
				ResetPlayerMoney(i);
				format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r",pname,i);
				SendClientMessageToAll(0xFF7F50AA, string);
				ircSay(EchoConnection, EchoChan,string);
				SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN DETECTED AS A CHEATER/HACKER");
				SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN BANNED FROM THIS SERVER");
				SendClientMessage(i,COLOR_RED,"If you think this is a mistake. Visit www.sa-rpg.co.uk to appeal this ban");
				format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r Inc:[$%d] Int:[%d]",pname,i,difference,GetPlayerInterior(i));
				printf("%s", string);
				if(udb_Exists(PlayerName(i)) && PLAYERLIST_authed[i]) {
 		        dUserSetINT(PlayerName(i)).("nameban",1);
    	        }
				SetPlayerInterior(i,10);
				SetPlayerPos(i,219.6257,111.2549,999.0156);
				SetPlayerFacingAngle(i,2.2339);
				SetCameraBehindPlayer(i);

				Banning[i] = 1;
				SetTimer("BanPlayer",700,0);
				}
				OldCash[i] = GetPlayerMoney(i);
			}

        }

    }

}

public TheEffectsOfDrugs()
{
    for(new i=0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
           if (playertookdrugs[i] == 1)
           {
           
            if (playerondrugs[i] == 0)
            {
            SendClientMessage(i, 0xA9A9A9AA, "|_Drug Info_|");
            SendClientMessage(i,0x00C7FFAA,"The effect of drugs taken has worn off. You are no longer on drugs");
            playertookdrugs[i] =0;
            }
            if (playerondrugs[i] >= 1)
            {
            playerondrugs[i] --;
            new Float:health;
            GetPlayerHealth(i, health);

			if(health <=95) {
            SetPlayerHealth(i,health+5);
            new druggiename[30];
            new string[250];
            GetPlayerName(i,druggiename,30);
            format(string, sizeof(string), "**(Predicted Increase)** %s(%d)'s health has increased (Drugs)",druggiename,i);
            printf("%s",string);
            //ircSay(EchoConnection, EchoChan,string);
            }
            
            }
        }
    }
 }
}

public TaxiDriverTimer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(gTeam[i] == TEAM_DRIVER && Driveronduty[i] == 1)
	  {
	  	new taxicab = GetPlayerVehicleID(i);
		for(new j = 0; j < MAX_PLAYERS; j++)
		{
		    if(IsPlayerConnected(j))
		    {
	  		if(IsPlayerInVehicle(j,taxicab) && GetPlayerState(j) == PLAYER_STATE_PASSENGER && Taxipass[j] == 1)
	  		{
	  		GivePlayerMoney(i,1);
			}
		}
	}
}
}
}

public TaxiPassengerTimer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(Taxipass[i] == 1 && GetPlayerMoney(i) >=5)
	  {
	  GivePlayerMoney(i,-1);
	
	  }
	  else
      if(Taxipass[i] == 1 && GetPlayerMoney(i) <=4)
	  {
	  SendClientMessage(i,COLOR_ERROR, "You cannot afford to pay the driver the minimum hire fee ($5)");
	  RemovePlayerFromVehicle(i);
	  Taxipass[i] =0;
     }
}
}

public UsedBankRecentlyTimer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	  if(IsPlayerConnected(i))
	  {
	     if(IsSpawned[i] == 1 && UsedBankRecently[i] >= 1)
	     {

		     UsedBankRecently[i] --;
		     
		  }
		}
	}
}











public TriedToEscapePrisone()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	  if(IsPlayerConnected(i))
	  {
	   if(IsSpawned[i] == 1 && Jailed[i] == 1)
	   {
        if(triedtoescaperecent[i] == 1)
    	  {
           triedtoescaperecent[i] =0;
	  } }
    }
  }
}



public StoleCopCarRecentTimer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(StoleCopCarRecent[i] == 1 && IsPlayerConnected(i))
	  {
       StoleCopCarRecent[i] =0;

    }
  }
}

public AskedForWeaponsRecent()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(askedforweapons[i] == 1)
	  {
        askedforweapons[i] =0;

    }
  }
}

public InfectedPlayerRecent()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(InfectedPlyRecent[i] == 1)
	  {
        InfectedPlyRecent[i] =0;

    }
  }
}


public RapedPlayerRecent()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(RapedPlyRecent[i] == 1)
	  {
        RapedPlyRecent[i] =0;

    }
  }
}

public ATMRobbedRecentlyTimer()
{
       if(atmnetworkrobbedrecent >= 1)
	  {
        atmnetworkrobbedrecent --;

    }
  }





public BankRobbedRecentlyTimer()
{
       if(BankRobbedRecently >= 1)
	  {
        BankRobbedRecently --;

    }
  }
    	

public PlayerRobbedBankRecentTimer()
{
     for(new i = 0; i < MAX_PLAYERS; i++)
     {
      if(IsPlayerConnected(i) && IsSpawned[i] ==1)
	  {
		if(PLAYERLIST_authed[i])
		{

        if(Playerrobbedbankrecent[i] >= 1)
	    {
          Playerrobbedbankrecent[i] --;
        }
  }  }
}
}
public FourDragsRobbedRecent()
{
       if(FourDragsRobbed == 1)
	  {
        FourDragsRobbed =0;

    }
  }
public RedsandsRobbedRecent()
{
       if(RedsandsRobbed == 1)
	  {
        RedsandsRobbed =0;

    }
  }
public CaligsRobbedRecent()
{
       if(CaligsRobbed == 1)
	  {
        CaligsRobbed =0;

    }
  }

public newcasinorobbedrecent()
{
       if(newcasinoRobbed == 1)
	  {
        newcasinoRobbed =0;

    }
  }


public LoginTimer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(IsPlayerConnected(i) && udb_Exists(PlayerName(i)))
	  {
		if(!PLAYERLIST_authed[i])
		{
        if(loginchances[i] <= 3) {
        //GameTextForPlayer(i, "~w~www.sa-rpg.co.uk",5000,0);
        GameTextForPlayer(i,"~r~THIS PLAYERNAME IS REGISTERED~n~TYPE /LOGIN OR CHANGE YOUR NAME",5000,5);
 		SendClientMessage(i,COLOR_ERROR,"This Playername Is Registered. Please Login. Use: /login password");
 		SendClientMessage(i,COLOR_ERROR,"Type /about for Server About.");
 		//TextDrawHideForPlayer(playerid,welcome);
		loginchances[i] ++;
		}
		else
		if(loginchances[i] >= 4) {
		new str[100];
        GetPlayerName(i, str, 24);
	    format(str, 100, "**(AUTO KICK)** %s(%d) Failed to login - Registered Playername", str,i);
	    SendClientMessageToAll(0xFF7F50AA, str);
	    ircSay(EchoConnection, EchoChan, str);
	    printf("%s", str);
	    SetPlayerInterior(i,10);
	    SetPlayerPos(i,219.6257,111.2549,999.0156);
	    SetPlayerFacingAngle(i,2.2339);
	    SetCameraBehindPlayer(i);
	    ResetPlayerMoney(i);
	    Kicking[i] =1;
		SetTimer("KickPlayer",700,0);
		}
	  }
    }
  }
}



public RobbedPlayerRecent()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(RobbedPlyRecent[i] == 1)
	  {
        RobbedPlyRecent[i] =0;

    }
  }
}

public JailCuffs()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	if(Jailed[i] == 1)
	{
		LeftTwoFourSeven[i] =999;
		TimeToMoveTwoFourSeven[i] =999;
		TogglePlayerControllable(i, 1);
	}
      if(Jailed[i] == 1 && cuffed[i] == 1 && IsPlayerConnected(i))
	  {
        cuffed[i] =0;
        SendClientMessage(i,COLOR_WHITE,"LVPD Prison Service: Your handcuffs have been removed");
       }
  }
}

public HandCuffed()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(cuffed[i] == 1 && IsPlayerConnected(i))
	  {
        GameTextForPlayer(i,"YOU ARE HANDCUFFED",4000,3);

    }
  }
}

public RobbedCasinoRecent()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(RobbedCasRecent[i] == 1 && IsPlayerConnected(i))
	  {
        RobbedCasRecent[i] =0;

    }
  }
}

public HasHIV()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      new Float:health;
      GetPlayerHealth(i, health);

      if(Chlamydia[i] == 1 && health > 5 && IsSpawned[i] == 1 && IsPlayerConnected(i))
	  {
	   SetPlayerHealth(i, health-5);
       }
       else
	   if(HIV[i] == 1 && health <= 5 && IsSpawned[i] == 1 && IsPlayerConnected(i))
	   {
	   new string[256];
	   new victim[24];
	   SetPlayerHealth(i, health-5);
       GetPlayerName(i,victim, 24);
       format(string, sizeof(string), "%s(%d) Has died from HIV-Aids",victim,i);
	   SendClientMessageToAll(0xB22222AA,string);
       }
     }
   }


public HasChlamydia()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      new Float:health;
      GetPlayerHealth(i, health);

      if(Chlamydia[i] == 1 && health > 5 && IsSpawned[i] == 1 && IsPlayerConnected(i))
	  {
	   SetPlayerHealth(i, health-5);
       }
       else
	   if(Chlamydia[i] == 1 && health <= 5 && IsSpawned[i] == 1 && IsPlayerConnected(i))
	   {
	   new string[256];
	   new victim[24];
	   SetPlayerHealth(i, health-5);
       GetPlayerName(i,victim, 24);
       format(string, sizeof(string), "%s(%d) Has died from Chlamydia",victim,i);
	   SendClientMessageToAll(0xB22222AA,string);
       }
     }
   }




public HasSalmonella()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      new Float:health;
      GetPlayerHealth(i, health);

      if(Salmonella[i] == 1 && health > 5 && IsSpawned[i] == 1 && IsPlayerConnected(i))
	  {
	   SetPlayerHealth(i, health-5);
       }
       else
	   if(Salmonella[i] == 1 && health <= 5 && IsSpawned[i] == 1 && IsPlayerConnected(i))
	   {
	   new string[256];
	   new victim[24];
	   SetPlayerHealth(i, health-5);
       GetPlayerName(i,victim, 24);
       format(string, sizeof(string), "%s(%d) Has died from Salmonella",victim,i);
	   SendClientMessageToAll(0xB22222AA,string);
       }
     }
   }

public BeenReported()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(ReportedRecent[i] == 1 && IsPlayerConnected(i))
	  {
        ReportedRecent[i] =0;

    }
  }
}


public ReqBkRecentTime()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(ReqBkRecent[i] == 1 && IsPlayerConnected(i))
	  {
        ReqBkRecent[i] =0;
      }
   }
}



public SandEngine()
{
    for(new v = 0; v < MAX_VEHICLES; v++)
	{
      if(SandInEngine[v] == 1)
	  {
        new Float:vHealth;
	    GetVehicleHealth(v, vHealth);
	    SetVehicleHealth(v, vHealth -100);
        
      }
   }
}

public FilledGasRecentDealer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(filleduprecent[i] == 1 && IsPlayerConnected(i))
	  {
        filleduprecent[i] =0;
      }
   }
}



public WantedYellow()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(IsSpawned[i] == 1)
	  {
        if(GetPlayerWantedLevel(i) >= 1 && GetPlayerWantedLevel(i) <= 3)
	    {
          SetPlayerColor(i, COLOR_YELLOW);
       }
    }
  }
}




public WantedOrange()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	  if(IsSpawned[i] == 1)
	   {
        if(GetPlayerWantedLevel(i) >= 4 && GetPlayerWantedLevel(i) <= 9)
	    {
          SetPlayerColor(i, COLOR_ORANGE);
       }
    }
  }
}
public WantedRed()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
     if(IsSpawned[i] == 1)
	  {
        if(GetPlayerWantedLevel(i) >= 10)
	    {
          SetPlayerColor(i, COLOR_RED);
       }
    }
  }
}

public WantedInnocent()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(IsSpawned[i] == 1 && gTeam[i] >= 3)
	  {
        if(GetPlayerWantedLevel(i) == 0)
	    {
          SetPlayerToTeamColour(i);
       }
    }
  }
}
public KickPlayer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(IsPlayerConnected(i))
	  {
        if(Kicking[i] == 1)
		{
        Kick(i);
      }
     }
    }
  }
public BanPlayer()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
      if(IsPlayerConnected(i))
	  {
        if(Banning[i] == 1)
		{
        Ban(i);
      }
     }
    }
  }
  
public GetPlayerZone(playerid) {
 new line[10];
 format(line,10,"p%dzone",playerid);
 new zoneid = strval(PropertyGet(line));
 return zoneid;
}
  

public SoldDrugsRecentDealer()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
      if(solddrugsrecent[i] == 1)
     {
        solddrugsrecent[i] =0;
     }
   }
}

public Tazingtime()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
      if(Tazed[i] == 1)
     {
        Tazed[i] =0;
        TogglePlayerControllable(i, 1);
        
        }
	 }
}
  
public Tazing()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
     if(Tazed[i] == 1)
     {
	   
       new Float:phealth;
       GetPlayerHealth(i,phealth);
       if(phealth > 50)
       {
       SetPlayerHealth(i, phealth-5);
       PlayerPlaySound(i, 1190, 0.0, 0.0, 0.0);
	   TogglePlayerControllable(i, 0);
        }
       }
      }
      }

public PlayerRobWait(playerid)
{
       if(PlayerRobwwait[playerid] == 1)
       {
          PlayerRobwwait[playerid] = 0;
         }
	}

public weaponanti()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
	  if(IsPlayerConnected(i) && IsSpawned[i] == 1 && GetPlayerState(i) == PLAYER_STATE_ONFOOT)
	   {
       if (GetPlayerWeapon(i) == 38 || GetPlayerWeapon(i) == 16 || GetPlayerWeapon(i) == 17 || GetPlayerWeapon(i) == 18 || GetPlayerWeapon(i) == 19 || GetPlayerWeapon(i) == 35 || GetPlayerWeapon(i) == 36 || GetPlayerWeapon(i) == 37 || GetPlayerWeapon(i) == 39 || GetPlayerWeapon(i) == 4)
       {
	   if(PlayerAdminLevel[i] != 1337) {
          new pname[30];
          new string[256];
          new inter;
		  inter = GetPlayerInterior(i);
          new wep = GetPlayerWeapon(i);
          GetPlayerName(i, pname, 30);
          format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r",pname,i);
          SendClientMessageToAll(0xFF7F50AA, string);
          ircSay(EchoConnection, EchoChan,string);
          SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN DETECTED AS A CHEATER/HACKER");
          SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN BANNED FROM THIS SERVER");
          SendClientMessage(i,COLOR_RED,"If you think this is a mistake. Visit www.sa-rpg.co.uk to appeal this ban");
          format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r Wep:[%d] Int:[%d]",pname,i,wep,inter);
          printf("%s", string);
          if(udb_Exists(PlayerName(i)) && PLAYERLIST_authed[i]) {
 		  dUserSetINT(PlayerName(i)).("nameban",1);
    	  }
          SetPlayerInterior(i,10);
          SetPlayerPos(i,219.6257,111.2549,999.0156);
          SetPlayerFacingAngle(i,2.2339);
          SetCameraBehindPlayer(i);
          Banning[i] = 1;
          SetTimer("BanPlayer",700,0);
          
       }
	}
  }
}
}

public cashanti()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
	  if(IsPlayerConnected(i) && IsSpawned[i] == 1)
	   {
       if (GetPlayerMoney(i) > 4000000)
       {
	   if(PlayerAdminLevel[i] != 1337) {
          new pname[30];
          new string[256];
          new inter;
		  inter = GetPlayerInterior(i);
          new pcash = GetPlayerMoney(i);
          GetPlayerName(i, pname, 24);
          format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r",pname,i,pcash);
          SendClientMessageToAll(0xFF7F50AA, string);
          ircSay(EchoConnection, EchoChan,string);
          SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN DETECTED AS A CHEATER/HACKER");
          SendClientMessage(i,COLOR_RED,"YOU HAVE BEEN BANNED FROM THIS SERVER");
          SendClientMessage(i,COLOR_RED,"If you think this is a mistake. Visit www.sa-rpg.co.uk to appeal this ban");
          format(string, sizeof(string), "**(AUTO BAN)** %s(%d) Our Anti-Cheat has detected a hax0r Cash:[$%d] Int:[%d]",pname,i,pcash,inter);
          printf("%s", string);
          SetPlayerInterior(i,10);
          SetPlayerPos(i,219.6257,111.2549,999.0156);
          SetPlayerFacingAngle(i,2.2339);
          SetCameraBehindPlayer(i);
          ResetPlayerMoney(i);
          Banning[i] = 1;
          SetTimer("BanPlayer",700,0);

       }
	}
  }
}
}


public AskedForFoodRecent()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
       if (askedforfood[i] ==1)
       {
          askedforfood[i] =0;
       }
	}
  }

public SellFoodRecent()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
       if (sellfoodrecently[i] ==1)
       {
          sellfoodrecently[i] =0;
       }
	}
  }
  
public ReqMechRecentTime()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
       if (RecentAskedMechanic[i] ==1)
       {
          RecentAskedMechanic[i] =0;
       }
	}
  }


  
stock GetPlayersInTeam(TEAM)
{
    new players;
    for (new i; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i))
        {
            if (gTeam[i] == TEAM) players++;
        }
    }
    return players;
}




public ArmyPayDay()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
       if (gTeam[i] == TEAM_ARMY && GetPlayerColor(i) == COLOR_BLUEVIOLET)
       {
          SendClientMessage(i,COLOR_ROYALBLUE,"SA ARMY RESOURCES: You have received your daily paycheck. $2500 ");
          GivePlayerMoney(i,2500);
       }
	}
  }

public PolicePayDay()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
 	{
       if (gTeam[i] == TEAM_COP && GetPlayerColor(i) == COLOR_BLUE)
       {
          SendClientMessage(i,COLOR_ROYALBLUE,"SAPD RESOURCES: You have received your daily paycheck. $1500 ");
          GivePlayerMoney(i,1500);
       }
	}
  }

SetPlayerTeamFromClass(playerid, classid) {

 if(classid == 0 || classid == 1 || classid == 2 || classid == 3 || classid == 4 || classid == 5 || classid == 6 || classid == 9 || classid == 10 || classid == 11 || classid == 12) {

		gTeam[playerid] = TEAM_COP;

	} else if(classid == 7) {

	    gTeam[playerid] = TEAM_ARMY;
	    
	} else if(classid == 8) {

	    gTeam[playerid] = TEAM_CASSEC;
	    
	} else if(classid == 13) {

	    gTeam[playerid] = TEAM_JAILTK;

	} else if(classid == 14) {

	    gTeam[playerid] = TEAM_MEDIC;

 	} else if(classid == 15) {

	    gTeam[playerid] = TEAM_CARFIX;
	    
	} else if(classid == 16) {

	    gTeam[playerid] = TEAM_BISTRO;

	} else if(classid == 17 || classid == 18) {

	    gTeam[playerid] = TEAM_DRIVER;

    } else if(classid == 53) {

	    gTeam[playerid] = TEAM_LAWYER;

    } else if(classid >= 19 && classid <= 52) {

	    gTeam[playerid] = TEAM_CIVIL;
	}
	else if(classid >= 54 && classid <= 68) {

	    gTeam[playerid] = TEAM_CIVIL;
	}
	else if(classid == 69) {

	    gTeam[playerid] = TEAM_COP;
	}
	//17,19,23,28,43,44,46,47,51,62

}

public OnPlayerRequestClass(playerid, classid)
{
    SetPlayerTeamFromClass(playerid, classid);
    SetPlayerColor(playerid,COLOR_DEADCONNECT);

    SetPlayerInterior(playerid, 0);
     SetPlayerFacingAngle(playerid, 0);
     SetPlayerPos(playerid, 435.355652,2532.222900,26.623209);
	SetPlayerCameraPos(playerid,435.355652,2535.222902,26.623209);
	SetPlayerCameraLookAt(playerid,435.355652,2532.222900,26.623209);
	
	// 435.355652,2532.222900,26.623209
    
// 257.750336,-42.528057,1002.23438
  	switch (classid) {

		case 0,1,2,3,4,5:

		    {

				GameTextForPlayer(playerid, "~b~POLICE OFFICER~n~~w~CITY OFFICER", 3000, 5);

			}

		case 6:

	        {

				GameTextForPlayer(playerid, "~b~POLICE OFFICER~n~~w~FBI", 3000, 5);

			}

		case 7:

	        {

				GameTextForPlayer(playerid, "~b~SA ARMY OFFICER~n~~w~DEADLY FORCE SQUAD", 3000, 5);

			}
			
        case 8:

	        {

				GameTextForPlayer(playerid, "~w~CASINO SECURITY", 3000, 5);

			}
			
	    case 9:

	        {

				GameTextForPlayer(playerid, "~b~POLICE OFFICER~n~~w~CASUAL CLOTHES", 3000, 5);

			}
			
		case 10:

	        {

				GameTextForPlayer(playerid, "~b~POLICE OFFICER~n~~w~AIR SUPPORT", 3000, 5);

			}
			
		case 11:

	        {

				GameTextForPlayer(playerid, "~b~POLICE OFFICER~n~~w~MARINE SUPPORT", 3000, 5);

			}
			
		case 12:

	        {

				GameTextForPlayer(playerid, "~b~JAIL TURNKEY~n~~w~(RELEASE PRISONERS)", 3000, 5);
            }

		case 13:

	        {

				GameTextForPlayer(playerid, "~b~MEDIC", 3000, 5);

			}

		case 14:

	        {

				GameTextForPlayer(playerid, "~w~CAR MECHANIC", 3000, 5);

			}

		case 15:

	        {

				GameTextForPlayer(playerid, "~w~BISTRO STAFF", 3000, 5);

			}

		case 16,17:

	        {

				GameTextForPlayer(playerid, "~g~TAXI DRIVER", 3000, 5);

			}
			case 53:

	        {

				GameTextForPlayer(playerid, "~w~LAWYER~n~HELP PRISONERS RELEASE", 3000, 5);

			}
		case 18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,62,63:

	        {

				GameTextForPlayer(playerid, "~w~CIVILIAN~b~~n~CHOOSE A JOB WHEN YOU SPAWN", 3000, 5);

   }
   

}
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    if(udb_Exists(PlayerName(playerid)) && !PLAYERLIST_authed[playerid]) {
	GameTextForPlayer(playerid,"~w~ THIS PLAYER NAME IS REGISTERED~n~~r~!- YOU ARE NOT LOGGED IN -!~n~~w~ USE ~g~/LOGIN (PASSWORD)",5000,3);
	return 0;
}
	if(!udb_Exists(PlayerName(playerid)) && !PLAYERLIST_authed[playerid]) {
	GameTextForPlayer(playerid,"~w~ PLAYER NAME NOT REGISTERED~n~~r~!- YOU ARE NOT REGISTERED -!~n~~w~ USE ~g~/REGISTER (PASSWORD)",5000,3);
	return 0;
}
 	return 1;
}

public OnPlayerConnect(playerid)
{
	new str[100], str2[100]/* string[100]*/;
    GetPlayerName(playerid, str, 24);
    format(str2, 100, "\2;%s(%d) Has Joined the Server", str,playerid);
	ircSay(EchoConnection, EchoChan,str2);
	format(str, 100, "%s(%d) Has Joined the Server", str,playerid,sversion);
    printf("%s",str);
    TextDrawShowForPlayer(playerid,webadress);
    for(new i=0; i<MAX_PLAYERS_; i++) {
  	if(IsPlayerConnected(i) && i != playerid) {
    SendClientMessage(i,0x808080AA, str);
    }
    }
    if(houseowner[playerid] == 1337) {
    GameTextForPlayer(playerid,"~w~Welcome ~g~HOME",5000,0);

	return 1;
	}
    new taggedname[30];
    GetPlayerName(playerid,taggedname,50);
    if(strfind(taggedname, "[",true)!= -1 || strfind(taggedname, "]",true)!= -1 || strfind(taggedname, "_",true)!= -1){
    SendClientMessage(playerid,COLOR_RED,"Tags/Clans are not allowed on this server. Please change your name");
    Kick(playerid);
    return 1;
}

    
    TogglePlayerClock(playerid,true);
    InShamal[playerid] = 0;
	SetPlayerVirtualWorld(playerid,0);
    //TextDrawShowForPlayer(playerid,welcome);
 	if(udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid,0x9ACD32AA," * This Playername is Registered. Please login before you spawn");
	SendClientMessage(playerid,COLOR_WHITE," * Please use /login (password) to login before you can spawn");
	GameTextForPlayer(playerid,"~w~WELCOME BACK AT ~n~~G~JOHNNY'S ~W~COPS AND ROBBERS",5000,5);
	}
	else
	if(!udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid,0x9ACD32AA," * This Playername has not yet been registered. You must register on this server before you can play");
	SendClientMessage(playerid,COLOR_WHITE," * Please use /register (password) to register before you can spawn");
	GameTextForPlayer(playerid,"~w~WELCOME AT ~G~JOHNNY'S ~W~COPS AND ROBBERS",5000,5);
	}
	KilledHimself[playerid] =0;
	SpamStrings[playerid] =0;
	GotCopBriberecently[playerid] =0;
	PlayerAdminLevel[playerid] =0;
	AdminKilled[playerid] =0;
	TimeToMoveTwoFourSeven[playerid] =999;
    RobbedCash[playerid] =0;
	BankCashReturns[playerid] =0;
    BankRobInsurance[playerid] =0;
    AbandonedCopCar[playerid] =1;
    HasCried[playerid] =0;
	IsSpawned[playerid] =0;
    zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	Jailed[playerid] =0;
	Frozen[playerid] =0;
    cuffed[playerid] =0;
    Kicking[playerid] =0;
    Chlamydia[playerid] =0;
    Banning[playerid] =0;
    PlayerRobwwait[playerid] =1;
    Tazed[playerid] =0;
    hastazer[playerid] =0;
    LawEnforcementRadio[playerid] =0;
    HasLawEnforcementRadio[playerid] =0;
    ReqBk[playerid] =0;
    ReqBkRecent[playerid] =0;
    ReportedRecent[playerid] =0;
    wantsheal[playerid] =0;
    wantscure[playerid] =0;
    wantsmechanic[playerid] =0;
    RecentAskedMechanic[playerid] =0;
    RobbedCasRecent[playerid] =0;
    RobbedPlyRecent[playerid] =0;
    Wantsfood[playerid] =0;
    sellfoodrecently[playerid] =1;
    Salmonella[playerid] =0;
    askedforfood[playerid] =0;
    askedforweapons[playerid] =0;
    Wantsguns[playerid] =0;
    OfferedGuns[playerid] =0;
    Muted[playerid] =0;
    PlayerDrugs[playerid] =0;
    wantsdrugs[playerid] =0;
    solddrugsrecent[playerid] =0;
    JailTime[playerid] =0;
    StoleCopCarRecent[playerid] =0;
    playerondrugs[playerid] =0;
    playertookdrugs[playerid] =0;
    HasDrugBag[playerid] =0;
    triedtoescaperecent[playerid] =0;
    cannotescapejail[playerid] =0;
    CopWaitBetweenRefills[playerid] =0;
    VisitReq[playerid] =0;
    EscapedConvict[playerid] =0;
    VisitReqExpires[playerid] =0;
    HasHitOnHim[playerid] =0;
    InAlcatraz[playerid] =0;
    PLAYERLIST_authed[playerid]=false;
    loginchances[playerid] =0;
    BankCash[playerid] =0;
    HouseCash[playerid] =0;
    UsedBankRecently[playerid] =0;
    InBank[playerid] =0;
    Playerrobbedbankrecent[playerid] =0;
    InDerby[playerid] =0;
    commitedcrimerecently[playerid] =0;
    copshavevc[playerid] =0;
    fixedcarrecent[playerid] =0;
    //NewCash[playerid] =0;
    OldCash[playerid] =0;
    RegularPlayer[playerid] =0;
    InAdminHQ[playerid] =0;
    autobahnowner[playerid] =0;
    houseowner[playerid] =0;
    Condom[playerid] =0;
    drunkplayer[playerid] =0;
    lastcardrove[playerid] =999;
    InAdminMode[playerid] =0;
    HasC4[playerid] =0;
    PlantingC4[playerid] =0;
    RobbedCaligs[playerid] =0;
    HasWallet[playerid] =0;
    Mafia[playerid] =0;
    TrashDeliveryTime[playerid] =0;
    TrashDeliveryEarnings[playerid] =0;
    GunDeliveryLevel[playerid] =0;
    OnDelMission[playerid] =0;
    GunsDeliveryTime[playerid] =0;
    DeliveringGuns[playerid] =0;
    RobbedBank[playerid] =0;
    DeliveringCash[playerid] =0;
    totalcashdelivered[playerid] =0;
    Driveronduty[playerid] =0;
    pmsoff[playerid] =0;
    carwin[playerid] =0;
    beenrobbedrecently[playerid] =0;
    AllowPlayerTeleport(playerid,0);
    canchooseskill[playerid] =0;
    robberrank[playerid] =0;
    respect[playerid] =0;
    teamkiller[playerid] =0;
    innocentkiller[playerid] =0;
    lowwantedkiller[playerid] =0;
    CasSecLastPlayerCuffed[playerid] =999;
    LeftTwoFourSeven[playerid] =999;

    SetPlayerMapIcon( playerid, 1, 3834.0366,462.8921,40.4060, 30, 0 );
    SetPlayerMapIcon( playerid, 2, 2347.7432,1561.8536,36.9063, 52, 0 ); // bank
    SetPlayerMapIcon( playerid, 3, 1137.7289,2088.1465,11.0625, 52, 0 ); // atm 1
    SetPlayerMapIcon( playerid, 4, 2540.4976,2266.2742,10.8203, 52, 0 ); // atm 2
    SetPlayerMapIcon( playerid, 5, 2192.8577,1975.1671,12.2894, 52, 0 ); // atm 3
    SetPlayerMapIcon( playerid, 6, 2231.5820,958.6937,10.8203, 52, 0 ); // atm 4
    SetPlayerMapIcon( playerid, 7, 2174.4482,1398.4165,11.4234, 55, 0 ); // autobahn
    SetPlayerMapIcon( playerid, 8, 2283.0537,2437.0647,46.9775, 30, 0 ); // lvpd
    SetPlayerMapIcon(playerid, 0, 2415.261718, 1123.759643, 10.820312, 52, 0); // lv city hall
SetPlayerMapIcon(playerid, 0, 2084.864257, 1263.123291, 10.820312, 23, 0); // rpl
SetPlayerMapIcon(playerid, 0, 2083.631347, 1334.198120, 10.563319, 52, 0); // ndriqimi's Casino
    //SetPlayerMapIcon( playerid, 9, 2440.9717,2376.7434,11.2572, 40, 0 ); // lvpd

    
    return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
    new msg[128];
	new name[32];
    GetPlayerName(playerid, name, sizeof(name));
	format(msg, sizeof(msg), "\2;%s(%d) Has left the server (%s)\2;", name,playerid,aDisconnectNames[reason]);
	ircSay(EchoConnection, EchoChan, msg);
    zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	Banning[playerid] = 0;
	Kicking[playerid] = 0;
	PlayerAdminLevel[playerid] =0;
    if (PLAYERLIST_authed[playerid]) {
    dUserSetINT(PlayerName(playerid)).("money",GetPlayerMoney(playerid));
    dUserSetINT(PlayerName(playerid)).("score",GetPlayerScore(playerid));
    dUserSetINT(PlayerName(playerid)).("robrank",robberrank[playerid]);
    dUserSetINT(PlayerName(playerid)).("respect",respect[playerid]);
    dUserSetINT(PlayerName(playerid)).("teamkills",teamkiller[playerid]);
    dUserSetINT(PlayerName(playerid)).("innocentkills",innocentkiller[playerid]);
    dUserSetINT(PlayerName(playerid)).("lowwantedkills",lowwantedkiller[playerid]);
    dUserSetINT(PlayerName(playerid)).("cashinsured",BankRobInsurance[playerid]);


	}
  PLAYERLIST_authed[playerid]=false;
	
    new ConnectName[30], str[100];
	GetPlayerName(playerid, ConnectName, 30);
    switch (reason) {
        case 0: format(str, 256, "%s has left the server! (Timeout)", ConnectName);
case 1: format(str, 256, "%s has left the server! (Leaving)", ConnectName);
case 2: format(str, 256, "%s has left the server! (Kicked)", ConnectName);
    }
    SendClientMessageToAll(0x808080AA, str);
    return 1;
}

stock PlayerName(playerid) {
  new name[255];
  GetPlayerName(playerid, name, 255);
  return name;
}
public OnPlayerSpawn(playerid)
{
	SetCameraBehindPlayer(playerid);

    SetPlayerTime(playerid,gametime,0);
    IsSpawned[playerid] =1;
    GangZoneShowForPlayer(playerid, alkatrazmap, 0x8B4513AA);
    GangZoneShowForPlayer(playerid, carriermap, 0x8B4513AA);
    TextDrawShowForPlayer(playerid,welcome);
    //TextDrawShowForPlayer(playerid,txtScriptVers);



    zoneupdates[playerid] = 1;
	player_zone[playerid] = -1;
	RobbedCasRecent[playerid] =0;
	RobbedPlyRecent[playerid] =1;
	if(!zoneupdate) zoneupdate = SetTimer("update_zones",1000,4);

    SetPlayerWantedLevel(playerid, 0);
    SetPlayerInterior(playerid,0);
    SetPlayerToTeamColour(playerid);


    if(gTeam[playerid] >= 9) {
 	new rnd;
    rnd = random(sizeof (SpawnPoints));
    SetPlayerPos(playerid, SpawnPoints[rnd][0], SpawnPoints[rnd][1], SpawnPoints[rnd][2]);
    SetPlayerFacingAngle(playerid, SpawnPoints[rnd][3]);
    canchooseskill[playerid] = 1;
    canselectskill[playerid] = 25;
    SendClientMessage(playerid,COLOR_WHITE, "Type /skill to select a skill");
	SendClientMessage(playerid,COLOR_WHITE, "You only have a short time to select before the default skill is given (Rapist)");
	GameTextForPlayer(playerid,"~w~TYPE ~y~/SKILL~n~ ~b~TO SELECT A SKILL",5000,0);
	TextDrawShowForPlayer(playerid,txtTypeSkill);
    }
    





    if(gTeam[playerid] == TEAM_COP) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "POLICE OFFICER: Your job is to keep criminals off the streets of San Andreas");
        SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");
		hastazer[playerid] =1;
		HasLawEnforcementRadio[playerid] =1;
		LawEnforcementRadio[playerid] =1;
  		CopWaitBetweenRefills[playerid] =120;
  		TextDrawShowForPlayer(playerid,txtTypeSkill1);




	}else if(gTeam[playerid] == TEAM_ARMY) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "SA ARMY: Your objective is to take out MOST WANTED (Level 10 +) suspects only");
        SendClientMessage(playerid,0x1E90FFAA, "If you dont need to kill the suspect, then dont. Use /ar to arrest instead");
        SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");
        HasLawEnforcementRadio[playerid] =1;
		LawEnforcementRadio[playerid] =1;
		CopWaitBetweenRefills[playerid] =120;


     }else if(gTeam[playerid] == TEAM_MEDIC) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "MEDIC: Your job is to keep civilians and government personel alive");
        SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");




     }else if(gTeam[playerid] == TEAM_CASSEC) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "CASINO SECURITY: You must protect the casinos from robbers");
        SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");
        HasLawEnforcementRadio[playerid] =1;
		LawEnforcementRadio[playerid] =1;


     }else if(gTeam[playerid] == TEAM_JAILTK) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "JAIL TURNKEY: You get the job of releasing prisoners from jail");
		SendClientMessage(playerid,0x1E90FFAA, "If a prisoner wants to be released early then you can take cash in exchange for their freedom");
		SendClientMessage(playerid,0x1E90FFAA, "You can also release them without taking any cash if you wish");
        SendClientMessage(playerid,0x1E90FFAA, "Use: /jail to see who is in jail - you can only parole prisoners in LVPD (non Alcatraz)");
        TextDrawShowForPlayer(playerid,txtTypeSkill2);

      }else if(gTeam[playerid] == TEAM_CARFIX) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "CAR MECHANIC: You can fix beat up cars");
		SendClientMessage(playerid,0x1E90FFAA, "Look out for players needing your services on the chat");
		SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");
        TextDrawShowForPlayer(playerid,txtTypeSkill3);


      }else if(gTeam[playerid] == TEAM_BISTRO) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "BISTRO STAFF: Your job is to sell food to other players if their health less than full");
		SendClientMessage(playerid,0x1E90FFAA, "Look out for players needing food on the chat");
		SendClientMessage(playerid,0x1E90FFAA, "You can sell players bad food and infect them with food poisining");
		SendClientMessage(playerid,0x1E90FFAA, "You can also sell healthy, non infected food");
        SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");

}else if(gTeam[playerid] == TEAM_LAWYER) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "LAWYER: Your job is to release players from jail. Don't let them rip you off..");
        SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");



      }else if(gTeam[playerid] == TEAM_DRIVER) {

        SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		SendClientMessage(playerid,0x1E90FFAA, "DRIVER: You can take players in your vehicle and drop them of for cash");
		SendClientMessage(playerid,0x1E90FFAA, "You can only use a Taxi, Limo, Maverick or a Coach to earn points");
		SendClientMessage(playerid,0x1E90FFAA, "Remember: This is not a deathmatch server. Please abide by the /rules and enjoy");
TextDrawShowForPlayer(playerid,txtTypeSkill4);

  		}


    if(udb_Exists(PlayerName(playerid)) && PLAYERLIST_authed[playerid])
	{
	new str[100];
	new isbanned =0;
	isbanned =dUserINT(PlayerName(playerid)).("nameban");
	if(isbanned == 1) {
    GetPlayerName(playerid, str, 24);
	format(str, 100, "**(AUTO BAN)** %s(%d) Banned Playername (Ban Evade)", str,playerid);
	SendClientMessageToAll(0xFF7F50AA, str);
	printf("%s", str);
	SendClientMessage(playerid,COLOR_ERROR,"This playername has been previously banned. Visit www.sa-rpg.co.uk to appeal");
	SetPlayerInterior(playerid,10);
	SetPlayerPos(playerid,219.6257,111.2549,999.0156);
	SetPlayerFacingAngle(playerid,2.2339);
	SetCameraBehindPlayer(playerid);
    Banning[playerid] = 1;
    SetTimer("BanPlayer",700,0);
    }
	}


    return 1;
}


SetPlayerToTeamColour(playerid) {

	if(gTeam[playerid] == TEAM_COP) {

		SetPlayerColor(playerid,COLOR_BLUE); // Blue

	} else if(gTeam[playerid] == TEAM_ARMY) {

	    SetPlayerColor(playerid,COLOR_BLUEVIOLET); // Blue Violet
	    
    } else if(gTeam[playerid] == TEAM_MEDIC) {

	    SetPlayerColor(playerid,COLOR_FORESTGREEN); // Forrest Green

	} else if(gTeam[playerid] == TEAM_CARFIX) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

    } else if(gTeam[playerid] == TEAM_CASSEC) {

	    SetPlayerColor(playerid,COLOR_DODGERBLUE); // Dodger Blue

	} else if(gTeam[playerid] == TEAM_DRIVER) {

	    SetPlayerColor(playerid,COLOR_DARKOLIVEGREEN); // Dark Olive Green

	} else if(gTeam[playerid] == TEAM_BISTRO) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_JAILTK) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

 	} else if(gTeam[playerid] == TEAM_PVTMED) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_GASDEL) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_DRGDEL) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_HITMAN) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_GUNDEL) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_SNITCH) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White
	    
    } else if(gTeam[playerid] == TEAM_LAWYER) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_RAPIST) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

	} else if(gTeam[playerid] == TEAM_CIVIL) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White

    } else if(gTeam[playerid] == TEAM_BOUNTY) {

	    SetPlayerColor(playerid,COLOR_WHITE); // White
	}

}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	new Float:pos[7], tvar[2];
	if (newkeys == 16)
	{
		if (InShamal[playerid])
		{
			GetVehiclePos(InShamal[playerid], pos[0], pos[1], pos[2]);
			GetVehicleZAngle(InShamal[playerid], pos[3]);
			pos[0] += floatmul(floatsin(-floatsub(pos[3], 45.0), degrees), 5.0);
			pos[1] += floatmul(floatcos(-floatsub(pos[3], 45.0), degrees), 5.0);
			SetPlayerInterior(playerid, 0);
			SetPlayerPos(playerid, pos[0], pos[1], floatsub(pos[2], 0.94));
			SetPlayerFacingAngle(playerid, pos[3]);
			SetCameraBehindPlayer(playerid);
			InShamal[playerid] = 0;
			return 1;
		}
		if (GetPlayerState(playerid) == 1)
		{
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
			for (new vs = 1; vs <= MAX_VEHICLES; vs++)
			{
				if (GetVehicleModel(vs) == tram)
				{
					GetVehiclePos(vs, pos[3], pos[4], pos[5]);
					GetVehicleZAngle(vs, pos[6]);
					pos[3] += floatmul(floatsin(-pos[6], degrees), 3.0);
					pos[4] += floatmul(floatcos(-pos[6], degrees), 3.0);
					if (floatcmp(floatsqroot(floatadd(floatadd(floatpower(floatsub(pos[0], pos[3]), 2.0), floatpower
					(floatsub(pos[1], pos[4]), 2.0)), floatpower(floatsub(pos[2], pos[5]), 2.0))), 3.0) != 1)
					{
						for (new a; a < MAX_PLAYERS; a++)
							if (IsPlayerConnected(a) && IsPlayerDriverInVehicle(a, vs, tram))
								tvar[0] ++;
						if (!tvar[0]) PutPlayerInVehicle(playerid, vs, 0);
					}
				}
			}
		}
		return 1;
	}
	if (newkeys == 128 && IsPlayerDriverInVehicle(playerid, GetPlayerVehicleID(playerid), 525))
	{
		GetVehiclePos(GetPlayerVehicleID(playerid), pos[0], pos[1], pos[2]);
		while (tvar[0] < MAX_VEHICLES && !tvar[1])
		{
			tvar[0] ++;
			GetVehiclePos(tvar[0], pos[3], pos[4], pos[5]);
   			if (floatcmp(floatabs(floatsub(pos[0], pos[3])), 7.0) != 1 && floatcmp(floatabs(floatsub(pos[1], pos[4])), 7.0) != 1
  			&& floatcmp(floatabs(floatsub(pos[2], pos[5])), 7.0) != 1 && tvar[0] != GetPlayerVehicleID(playerid))
			{
			    tvar[1] ++;
				if (IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
   			    AttachTrailerToVehicle(tvar[0], GetPlayerVehicleID(playerid));
			}
		}
	}
	

	
	
	
	
	return 1;
}


public OnPlayerDeath(playerid, killerid, reason)
{
    new string[256];
     
    if(GetPlayerMoney(playerid) >= 4000)
	{
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid,X,Y,Z);
    CreatePickup(1212, 3,X,Y-1,Z);
    CreatePickup(1212, 3,X,Y+1,Z);
    CreatePickup(1212, 3,X-1,Y,Z);
    CreatePickup(1212, 3,X+1,Y,Z);
    }
    if(OnDelMission[playerid] == 1337)
	{
	SendClientMessage(playerid,COLOR_ERROR,"Delivery Mission Cancelled. You died!");
	OnDelMission[playerid] =0;
	}
	if(DeliveringCash[playerid] == 1337)
	{
	SendClientMessage(playerid,COLOR_ERROR,"Delivery Mission Cancelled. You died!");
	DeliveringCash[playerid] =0;
	}
	
    new msg[128];
	new playername[32];
	new killername[32];
	GetPlayerName(playerid,playername,32);
	if ((reason == 255) || (killerid == 255))
	{
	    format(msg, sizeof(msg), "[Death] \2;%s(%i)\2; killed himself.", playername,playerid);
	    goto snd;
	}
	else
	{
	    GetPlayerName(killerid,killername,32);
	    format(msg, sizeof(msg), "[Death] \2;%s(%i)\2; was killed by \2;%s(%i)\2;. (2%s)", playername,playerid, killername,killerid, aWeaponNames[reason]);
    }
	snd:
	printf("msg: %s\n", msg);
	ircSay(EchoConnection, EchoChan, msg);


    InShamal[playerid] = 0;
	TextDrawHideForPlayer(playerid,txtTypeSkill);
	SetPlayerVirtualWorld(playerid,0);
	GotCopBriberecently[playerid] =0;
	OldCash[playerid] =0;
    ResetPlayerMoney(playerid);
    ResetPlayerWeapons(playerid);
    PlayerDrugs[playerid] =0;
    HasDrugBag[playerid] =0;
    HasCried[playerid] =0;
    HasC4[playerid] =0;
    HasWallet[playerid] =0;
    Mafia[playerid] =0;
    BankRobInsurance[playerid] =0;
    Salmonella[playerid] =0;
    Chlamydia[playerid] =0;
    IsSpawned[playerid] =0;
    playerondrugs[playerid] =0;
    playertookdrugs[playerid] =0;
    HasLawEnforcementRadio[playerid] =0;
	LawEnforcementRadio[playerid] =0;
    Jailed[playerid] = 0;
    JailTime[playerid] =0;
    InAlcatraz[playerid] =0;
    EscapedConvict[playerid] =0;
    cuffed[playerid] =0;
    cannotescapejail[playerid] =0;
    Wantsfood[playerid] =0;
	VisitReq[playerid] =0;
    VisitReqExpires[playerid] =0;
    wantsheal[playerid] =0;
    triedtoescaperecent[playerid] =0;
    InBank[playerid] =0;
    InDerby[playerid] =0;
    Tazed[playerid] =0;
    InAdminHQ[playerid] =0;
    drunkplayer[playerid] =0;
    lastcardrove[playerid] =999;
    PlantingC4[playerid] =0;
    RobbedCaligs[playerid] =0;
    GunDeliveryLevel[playerid] =0;
    GunsDeliveryTime[playerid] =0;
	DeliveringGuns[playerid] =0;
	
	if(AdminKilled[playerid] == 1 || KilledHimself[playerid] == 1)
	{
	SendDeathMessage(INVALID_PLAYER_ID,playerid,16);
	AdminKilled[playerid] =0;
	KilledHimself[playerid] =0;
	SetPlayerColor(playerid,COLOR_DEADCONNECT);
	SetPlayerWantedLevel(playerid,0);
	return 1;
}
    if(killerid == INVALID_PLAYER_ID)
	{
	SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
	SetPlayerColor(playerid,COLOR_DEADCONNECT);
	SetPlayerWantedLevel(playerid,0);
    return 1;
}

    if(GetDistanceBetweenPlayers(playerid,killerid) > 200)
	{
	SendDeathMessage(INVALID_PLAYER_ID,playerid,53);
	SetPlayerWantedLevel(playerid,0);
	SetPlayerColor(playerid,COLOR_DEADCONNECT);
    return 1;
}
    if(InAdminMode[killerid] == 1337)
	{
    SendDeathMessage(killerid,playerid,reason);
    //new killername[24];
    new killedname[24];
    GetPlayerName(killerid, killername, 24);
    GetPlayerName(playerid, killedname, 24);
    SetPlayerWantedLevel(playerid,0);
    SetPlayerColor(playerid,COLOR_DEADCONNECT);
    format(string, sizeof(string),"You have killed %s(%d) while you are in Admin Mode",killedname,playerid);
	SendClientMessage(killerid,0xFF7F50AA,string);
    format(string, sizeof(string),"Server Admin %s(%d) has killed %s(%d) While in Admin Mode",killername,killerid,killedname,playerid);
    printf("%s",string);
    ircSay(EchoConnection, EchoChan,string);
	return 1;
}
    if(gTeam[killerid] == TEAM_HITMAN && HasHitOnHim[playerid] >=1)
	{
	new victim[30];
    new killer[30];
    GetPlayerName(playerid,victim, 30);
	GetPlayerName(killerid, killer, 30);
	new plwl = GetPlayerWantedLevel(killerid);
	new pcol = GetPlayerColor(killerid);
    SetPlayerWantedLevel(killerid,plwl +10);
    plwl = GetPlayerWantedLevel(killerid);
    format(string, sizeof(string), "%s(%d) Has been killed by hitman %s(%d) for a hit contract",victim,playerid,killer,killerid);
	SendClientMessageToAll(0xB22222AA,string);
	SendClientMessage(killerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(MURDER) Wanted Level %d",plwl);
	SendClientMessage(killerid,pcol,string);
	format(string, sizeof(string), "You have killed %s(%d) for a hit contract. You receive a $3000 bonus",victim,playerid);
	SendClientMessage(killerid,pcol,string);
	GivePlayerMoney(killerid,3000);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Killed For A Hit Contract_|");
	format(string, sizeof(string), "Hitman %s(%d) Has killed you for a Hit Contract. Be careful who you make enemys with in future",killer,killerid);
	SendClientMessage(playerid,0x00C7FFAA,string);
	HasHitOnHim[playerid] =0;
	commitedcrimerecently[killerid] +=360;
	SendDeathMessage(killerid,playerid,reason);
	SetPlayerWantedLevel(playerid,0);
	SetPlayerColor(playerid,COLOR_DEADCONNECT);
	oscore = GetPlayerScore(killerid);
    SetPlayerScore(killerid, oscore +1);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	new current_zone;
    current_zone = player_zone[killerid];
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (CONTRACTED MURDER) %s(%d) Has murdered %s(%d) Location: %s",killer,killerid,victim,playerid,zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_ROYALBLUE, string);
	}
	}
	return 1;
}

    if(Jailed[killerid] == 1) {
	SendDeathMessage(killerid,playerid,reason);
	}


	if(gTeam[killerid] >=3 && Jailed[killerid] == 0) {
	new victim[24];
    new killer[24];
    GetPlayerName(playerid,victim, 24);
	GetPlayerName(killerid, killer, 24);
	new plwl = GetPlayerWantedLevel(killerid);
	new pcol = GetPlayerColor(killerid);
    SetPlayerWantedLevel(killerid,plwl +10);
    plwl = GetPlayerWantedLevel(killerid);
    SendClientMessage(killerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(MURDER) Wanted Level %d",plwl);
	SendClientMessage(killerid,pcol,string);
	commitedcrimerecently[killerid] +=360;
	SendDeathMessage(killerid,playerid,reason);
	SetPlayerColor(playerid,COLOR_DEADCONNECT);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	new current_zone;
    current_zone = player_zone[killerid];
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (MURDER) %s(%d) Has murdered %s(%d) Location: %s",killer,killerid,victim,playerid,zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_ROYALBLUE, string);
	}
	}
	return 1;
}

	if(gTeam[killerid] <=2 && gTeam[playerid] <=2 && IsSpawned[killerid] == 1 && Jailed[killerid] == 0) {
	teamkiller[killerid] +=1;
	if(teamkiller[killerid] >=3) {
	new str[100];
    GetPlayerName(killerid, str, 24);
	format(str, 100, "**(AUTO KICK)** %s(%d) Too Many Team Kills (TeamKiller)", str,killerid);
	SendClientMessageToAll(0xFF7F50AA, str);
	ircSay(EchoConnection, EchoChan, str);
	printf("%s", str);
	SetPlayerInterior(killerid,10);
	SetPlayerPos(killerid,219.6257,111.2549,999.0156);
	SetPlayerFacingAngle(killerid,2.2339);
	SetCameraBehindPlayer(killerid);
	teamkiller[killerid] =0;
	Kicking[killerid] =1;
	SetTimer("KickPlayer",700,0);
	return 1;
}
	SendClientMessage(killerid,COLOR_RED, "TEAM KILL - Do not kill other Law Enforcement agents (Blue/Purple)");
	SendClientMessage(killerid,COLOR_RED, "If you continue to kill other Law Enforcement agents you will be kicked/banned");
	SendDeathMessage(killerid,playerid,reason);
	SetPlayerColor(playerid,COLOR_DEADCONNECT);
	oscore = GetPlayerScore(killerid);
    SetPlayerScore(killerid, oscore -1);
    return 1;
}

    if(gTeam[killerid] <=2 && gTeam[playerid] >= 3 && IsSpawned[killerid] == 1  && Jailed[killerid] == 0)
	{
	new plwl = GetPlayerWantedLevel(playerid);
	if(plwl == 0) {
	innocentkiller[killerid] +=1;
    if(innocentkiller[killerid] >=3) {
	new str[100];
    GetPlayerName(killerid, str, 24);
	format(str, 100, "**(AUTO KICK)** %s(%d) Too Many Innocent Kills", str,killerid);
	SendClientMessageToAll(0xFF7F50AA, str);
	ircSay(EchoConnection, EchoChan, str);
	printf("%s", str);
	SetPlayerInterior(killerid,10);
	SetPlayerPos(killerid,219.6257,111.2549,999.0156);
	SetPlayerFacingAngle(killerid,2.2339);
	SetCameraBehindPlayer(killerid);
	innocentkiller[killerid] =0;
	Kicking[killerid] =1;
	SetTimer("KickPlayer",700,0);
	return 1;
}
	SendClientMessage(killerid,COLOR_RED, "INNOCENT KILL - Do not kill innocent civilians (White)");
	SendClientMessage(killerid,COLOR_RED, "If you continue to kill innocent players you will be kicked/banned");
	SendDeathMessage(killerid,playerid,reason);
	SetPlayerColor(playerid,COLOR_DEADCONNECT);
	oscore = GetPlayerScore(killerid);
    SetPlayerScore(killerid, oscore -1);
    }
    else
    if(plwl >=1 && plwl <=3) {
    lowwantedkiller[killerid] +=1;
    if(lowwantedkiller[killerid] >=3) {
	new str[100];
    GetPlayerName(killerid, str, 24);
	format(str, 100, "**(AUTO KICK)** %s(%d) Too Many Low Wanted Kills", str,killerid);
	SendClientMessageToAll(0xFF7F50AA, str);
	ircSay(EchoConnection, EchoChan, str);
	printf("%s", str);
	SetPlayerInterior(killerid,10);
	SetPlayerPos(killerid,219.6257,111.2549,999.0156);
	SetPlayerFacingAngle(killerid,2.2339);
	SetCameraBehindPlayer(killerid);
	lowwantedkiller[killerid] =0;
	Kicking[killerid] =1;
	SetTimer("KickPlayer",700,0);
	return 1;
}

    SendClientMessage(killerid,COLOR_RED, "LOW WANTED KILL - Do not kill low wanted players (Yellow)");
    SendClientMessage(killerid,COLOR_RED, "Use /fine (id) to issue a fine to low wanted suspects (Yellow)");
    SendDeathMessage(killerid,playerid,reason);
    SetPlayerColor(playerid,COLOR_DEADCONNECT);
    oscore = GetPlayerScore(killerid);
    SetPlayerScore(killerid, oscore -1);

	}
    else
    if(plwl >=4 && plwl <=9) {
    new killer[24];
    new victim[24];
    GetPlayerName(playerid,victim,24);
	GetPlayerName(killerid, killer, 24);
	format(string, sizeof(string), "Officer %s(%d) has taken suspect %s(%d) down using deadly force",killer,killerid,victim,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan, string);
    printf("%s", string);
    SendDeathMessage(killerid,playerid,reason);
    SetPlayerColor(playerid,COLOR_DEADCONNECT);
    }
    else
    if(plwl >=10) {
    new killer[24];
    new victim[24];
    GetPlayerName(playerid,victim,24);
	GetPlayerName(killerid, killer, 24);
	format(string, sizeof(string), "Officer %s(%d) has taken Most Wanted suspect %s(%d) down using deadly force",killer,killerid,victim,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan, string);
    printf("%s", string);
    if(gTeam[killerid] == TEAM_ARMY) {
    oscore = GetPlayerScore(killerid);
    SetPlayerScore(killerid, oscore +1);
    SendClientMessage(killerid,0xA9A9A9AA, "|_Suspect Take Down_|");
    format(string, sizeof(string), "You have taken Most Wanted suspect %s(%d) down.  You receive a $3500 bonus",victim,playerid);
    SendClientMessage(killerid,0x00C7FFAA, string);
    GivePlayerMoney(killerid,3500);
    }
    SendDeathMessage(killerid,playerid,reason);
    SetPlayerColor(playerid,COLOR_DEADCONNECT);
	}
	}


    HasHitOnHim[playerid] =0;
    SetPlayerWantedLevel(playerid,0);

 	return 1;
}




public OnVehicleSpawn(vehicleid)
{
    tCount[vehicleid] = false;
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    if (GetVehicleModel(vehicleid) == shamal && ShamalExists(vehicleid))
	{
		CreateExplosion(ShamalPos[vehicleid][0], ShamalPos[vehicleid][1], ShamalPos[vehicleid][2], 2, 15.0);
		sExplode[vehicleid] = SetTimerEx("ExplodeShamal", 700, 1, "d", vehicleid);
		tCount[vehicleid] = true;
	}

	if(BoughtCars[vehicleid] == 999)
	{
	DestroyVehicle(vehicleid);
	}
    SandInEngine[vehicleid] =0;

	return 1;
}

public OnPlayerText(playerid, text[])
{
    if(SpamStrings[playerid] >= 1) {
    SendClientMessage(playerid, COLOR_ERROR, "DO NOT SPAM! Please wait before talking again!");
    return 0;
    }
    if(Muted[playerid] == 1)
    {
    SendClientMessage(playerid, COLOR_ERROR, "You are Muted. You Cannot Chat");
    return 0;
    }
    if(strfind(text,"rcon",true)!= -1 )
    {
    return 0;
    }
    if(strfind(text,"login",true)!= -1 )
    {
    return 0;
    }
    
    new msg[128];
	new name[32];
	GetPlayerName(playerid, name, sizeof(name));
	format(msg, sizeof(msg), "\2;%s(%i)\2; - %s",name,playerid,text); // [0] <jacob> hi
	ircSay(EchoConnection, EchoChan, msg);

	SpamStrings[playerid] ++;
	return 1;
}

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
    if(Muted[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You are Muted. You Cannot Use This Command");
    return 0;
    }
	if(pmsoff[recieverid] == 1) {
	SendClientMessage(playerid, COLOR_YELLOW, "That player is not accepting Private Messages at this time");
    return 0;
    }
	SendClientMessage(recieverid, COLOR_GREY, "Type /pmoff to refuse Personal Messages");
	SpamStrings[playerid] ++;
	new pmsg[128];
	new priname[32],prinamee[32];
	GetPlayerName(playerid,priname, sizeof(priname));
	GetPlayerName(recieverid,prinamee, sizeof(prinamee));
	format(pmsg, sizeof(pmsg), "2**(PM)** From \2;%s(%i)\2; To \2;%s(%i)\2; - %s",priname,playerid,prinamee,recieverid,text); // [0] <jacob> hi
	ircSay(EchoConnection, EchoChan,pmsg);
	
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    dcmd(login,5,cmdtext); // because login has 5 characters
    dcmd(register,8,cmdtext); // because register has 8 characters
    new string[256];
	new cmd[256];
	new giveplayerid, idx;
	new tmp[256];
	
	
	cmd = strtok(cmdtext, idx);

	/*---------------------------------------------------------------
	SERVER ADMIN COMMANDS
	\/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/
	---------------------------------------------------------------*/

	if (strcmp("/adcmds", cmdtext, true, 10) == 0) // Shows Admin Command List
	{
	if(PlayerAdminLevel[playerid] == 1337)
	{
	SendClientMessage(playerid,0xA9A9A9AA, "|_Server Admin Commands_|");
	SendClientMessage(playerid,0xFF7F50AA,"/adhq [Go To Admin HQ] /adon [MiniGun and Invinsable] /adjet [Jetpack] /adoff [Turn Off]");
	SendClientMessage(playerid,0xFF7F50AA,"/adan (text) [Announce] /adfr (id) [Freeze] /adunfr (id) [Unfreeze]");
	SendClientMessage(playerid,0xFF7F50AA,"/adjail (id) [Jail] /adunjail (id) [Unjail] /adkick (id) [Kick]    ");
	SendClientMessage(playerid,0xFF7F50AA,"/adban (id) [Ban] /adkill (id) [Kill Player] /goto (id) [Goto Player]");
	SendClientMessage(playerid,0xFF7F50AA,"/bring (id) [Bring Player] /specplayer (id) [Spectate Player] /spedoff");
	SendClientMessage(playerid,0xFF7F50AA,"/admsg (msg) [Talk To Admins] /adblow (id) [Blow a players car up]");
	SendClientMessage(playerid,0xFF7F50AA,"/adfrall [Freeze All Players] /adunfrall [Unfreeze All Players] ");
    }
	else
    SendClientMessage(playerid,0xFF0000AA,"/commands for commands");
    return 1;
	}


    if (strcmp("/adhq", cmdtext, true, 10) == 0) // Teleports Admins To Admin HQ
	{
	if(PlayerAdminLevel[playerid] == 1337)
	{
	SetPlayerInterior(playerid,0);
	SetPlayerFacingAngle(playerid,88.7433);
    SetPlayerPos(playerid,2082.8745,1272.4794,10.8203);
    SetCameraBehindPlayer(playerid);
    }
	else
    SendClientMessage(playerid,0xFF0000AA,"/commands for commands");
    return 1;
	}

	if (strcmp("/adon", cmdtext, true, 10) == 0) // Gives Admins Alot Of Health & Armor And Minigun (Saves Weaps)
	{
	if(PlayerAdminLevel[playerid] == 1337)
	{
	if(InAdminMode[playerid] == 1337) {
	SendClientMessage(playerid,0xFF7F50AA,"You are already in Admin Mode");
	return 1;
	}

	for(new w=0;w<13;w++)
		{
		    GetPlayerWeaponData(playerid,w,PlayerWeapon[playerid][w],PlayerAmmo[playerid][w]);
		}

	ResetPlayerWeapons(playerid);
	SetPlayerHealth(playerid,999999);
	GivePlayerWeapon(playerid,38,99999);
	SetPlayerArmour(playerid,999999);
	InAdminMode[playerid] =1337;
	SendClientMessage(playerid,0xFF7F50AA,"(ADMIN MODE ON) You are now in Admin Mode");
    }
	else
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
    return 1;
	}

	if (strcmp("/adoff", cmdtext, true, 10) == 0) // Turns Admin Mode Off, Restores Weapons
	{
	if(PlayerAdminLevel[playerid] == 1337)
	{
	if(InAdminMode[playerid] == 0) {
	SendClientMessage(playerid,0xFF7F50AA,"You are not in Admin Mode");
	return 1;
	}
	ResetPlayerWeapons(playerid);
	for(new w=0;w<13;w++)
		{
			GivePlayerWeapon(playerid,PlayerWeapon[playerid][w],PlayerAmmo[playerid][w]);
		}
	SetPlayerHealth(playerid,100);
	SetPlayerArmour(playerid,0);
    InAdminMode[playerid] =0;
    SendClientMessage(playerid,0xFF7F50AA,"(ADMIN MODE OFF) You are no longer in Admin Mode");
    }
	else
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
    return 1;
	}

    if (strcmp("/adan", cmdtext, true, 5) == 0) // Anounces Text Accross All Players Screens
    {
    if(PlayerAdminLevel[playerid] == 1337)
    {
    if(strlen(cmdtext) <= 6) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adan (msg)");
    return 1;
    }
    new output[100];
    strmid(output,cmdtext,5,strlen(cmdtext));
	GameTextForAll(output,4000,0);
    }
	else
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
    return 1;
    }

    if (strcmp("/adweb", cmdtext, true, 5) == 0) // Announces Website Address
    {
    if(PlayerAdminLevel[playerid] == 1337)
    {
    format(string, sizeof(string), "[RCR] Roleplay Cops Robbers - Script Version %s",sversion);
    SendClientMessageToAll(COLOR_WHITE, string);
    SendClientMessageToAll(0x87CEEBAA, "This is NOT a deathmatch server. Do not randomly kill players");
    SendClientMessageToAll(0x87CEEBAA, "Visit our website to report bugs/suggestions/complaints etc");
	SendClientMessageToAll(0x87CEEBAA, "There is a full list of commands/rules and other information on our website" );
	SendClientMessageToAll(0x87CEEBAA, "~w~www.sa-rcr.page.tl");
	GameTextForAll("~w~www.sa-rcr.page.tl", 6000, 0);
    }
	else
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");

    return 1;
    }
    
    if(strcmp(cmd, "/adspawn", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Forced Player Spawn
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adspawn (id)");
    return 1;
    }
    giveplayerid = strval(tmp);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adspawn (id) ID Must be a number");
    return 1;
    }
    if(IsSpawned[giveplayerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "That player is already spawned");
    return 1;
    }
    if (IsPlayerConnected(giveplayerid)) {
    new pname[24];
    GetPlayerName(giveplayerid, pname, 24);
    format(string, sizeof(string), "**(ADMIN SPAWN)** %s(%d) Forced Spawn ",pname,giveplayerid);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    SpawnPlayer(giveplayerid);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }
    
	if(strcmp(cmd, "/adslap", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Admin Slap
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adslap (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adslap (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new pname[24];
    GetPlayerName(giveplayerid, pname, 24);
    printf("(ADMIN SLAP) %s(%d)",pname,giveplayerid);
    SendClientMessage(giveplayerid,0xFF7F50AA,"You have been slapped by Server Admin. Ouch!");
    GameTextForPlayer(giveplayerid,"ADMIN SLAP",5000,4);
    PlayerPlaySound(giveplayerid, 1190, 0.0, 0.0, 0.0);
    format(string, sizeof(string), "%s(%d) has been Admin Slapped",pname,giveplayerid);
    SendClientMessage(playerid,0xFF7F50AA, string);
    return 1;
    }


	if(strcmp(cmd, "/adinfo", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Displays Some Player Info
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adinfo (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adinfo (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new pname[24];
    new adminname[24];
    new Float:phealth;
    new Float:parmor;
    new playercash = GetPlayerMoney(giveplayerid);
    new wep0,ammo0;
    new ipstring[25];
    new pping;
    pping = GetPlayerPing(playerid);
    GetPlayerIp(giveplayerid,ipstring,255);
	GetPlayerWeaponData(giveplayerid,7,wep0,ammo0);
    GetPlayerName(giveplayerid, pname, 24);
    GetPlayerName(playerid,adminname,24);
    GetPlayerHealth(giveplayerid,phealth);
    GetPlayerArmour(giveplayerid,parmor);
    printf("**(ADMIN INFO)** Server Admin %s(%d) has requested to view the information of %s(%d)",adminname,playerid,pname,giveplayerid);
    format(string, sizeof(string), "**(ADMIN INFO)** Server Admin %s(%d) has requested to view the information of %s(%d)",adminname,playerid,pname,giveplayerid);
	ircSay(EchoConnection, EchoChan,string);
	format(string, sizeof(string), "(ADMIN INFO) %s(%d)",pname,giveplayerid);
    SendClientMessage(playerid,0xFF7F50AA, string);
    format(string, sizeof(string), "ID: %d IP: %s PING: %d",giveplayerid,ipstring,pping);
    SendClientMessage(playerid,COLOR_YELLOW, string);
    format(string, sizeof(string), "Health: %f  Armour: %f",phealth,parmor);
    SendClientMessage(playerid,COLOR_YELLOW, string);
	if(playerondrugs[giveplayerid] >= 1) {
	SendClientMessage(playerid,COLOR_YELLOW,"OnDrugs: Yes");
	}
	if(playerondrugs[giveplayerid] == 0) {
	SendClientMessage(playerid,COLOR_YELLOW,"On Drugs: No");
	}
	if(HasC4[giveplayerid] == 1) {
	SendClientMessage(playerid,COLOR_YELLOW,"Has C4: Yes");
	}
	if(HasC4[giveplayerid] == 0) {
	SendClientMessage(playerid,COLOR_YELLOW,"Has C4: No");
	}
	format(string, sizeof(string), "Has Drugs: %d Grams",PlayerDrugs[giveplayerid]);
    SendClientMessage(playerid,COLOR_YELLOW, string);
    format(string, sizeof(string), "Cash: $%d",playercash);
    SendClientMessage(playerid,COLOR_YELLOW, string);
    if(gTeam[giveplayerid] == TEAM_COP) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Police Officer");
    }
    else
    if(gTeam[giveplayerid] == TEAM_ARMY) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Army");
	}
	else
    if(gTeam[giveplayerid] == TEAM_MEDIC) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Medic");
	}
	else
    if(gTeam[giveplayerid] == TEAM_CARFIX) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Car Mechanic");
	}
	else
    if(gTeam[giveplayerid] == TEAM_CASSEC) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Casino Security");
	}
	else
    if(gTeam[giveplayerid] == TEAM_DRIVER) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Taxi Driver");
	}
	else
    if(gTeam[giveplayerid] == TEAM_BISTRO) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Food Delivery");
	}
	else
    if(gTeam[giveplayerid] == TEAM_JAILTK) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Jail Turnkey");
	}
	else
    if(gTeam[giveplayerid] == TEAM_PVTMED) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Private Medic");
	}
	else
    if(gTeam[giveplayerid] == TEAM_CIVIL) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: You are a nobody, If you have chosen a skill already then report this bug asap");
	}
	else
    if(gTeam[giveplayerid] == TEAM_DRGDEL) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Drug Dealer");
	}
	else
    if(gTeam[giveplayerid] == TEAM_HITMAN) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Hitman");
	}
	else
    if(gTeam[giveplayerid] == TEAM_GUNDEL) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Gun Dealer");
	}
	else
	if(gTeam[giveplayerid] == TEAM_RAPIST) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Rapist");
	}
	else
	if(gTeam[giveplayerid] == TEAM_BOUNTY) {
	SendClientMessage(playerid,COLOR_YELLOW,"Skill/Job: Bounty Hunter");
	}
    format(string, sizeof(string), "Weapon Ban: %d (%d)",wep0,ammo0);
    SendClientMessage(playerid,COLOR_YELLOW, string);
    return 1;
    }

	if(strcmp(cmd, "/adblow", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Blow A Player Up In A Car
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adblow (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adblow (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new pname[24];
    GetPlayerName(giveplayerid, pname, 24);
    if(!IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) is not in any vehicle. It is only fun if the player is in a vehicle",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR, string);
    return 1;
    }
    AdminKilled[giveplayerid] =1;
    new Float:X, Float:Y, Float:Z;
	GetPlayerPos(giveplayerid, X, Y, Z);
	CreateExplosion(X,Y,Z, 5, 10.0);
	format(string, sizeof(string), "%s(%d)'s vehicle has been blown up by a Server Admin",pname,giveplayerid);
    SendClientMessageToAll(0xB22222AA, string);
    return 1;
    }

    if(strcmp(cmd, "/goto", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Teleports Admin To A Player
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /goto (id)");
    return 1;
    }
    giveplayerid = strval(tmp);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /goto (id) ID Must be a number");
    return 1;
    }
    if (IsPlayerConnected(giveplayerid)) {
    SetPlayerInterior(playerid, GetPlayerInterior(giveplayerid));
    new Float:x, Float:y, Float:z;
    new pname[24];
    new aname[24];
    GetPlayerPos(giveplayerid, x,y,z);
    SetPlayerPos(playerid, x+1,y,z);
    GetPlayerName(giveplayerid, pname, 24);
    GetPlayerName(playerid, aname, 24);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Admin Command Used_|");
    format(string, sizeof(string), "You have teleported to %s(%d)",pname,giveplayerid);
    SendClientMessage(playerid,0xFF7F50AA, string);
    format(string, sizeof(string), "%s(%d) has teleported to %s(%d) [ADMIN COMMAND /GOTO]",aname,playerid,pname,giveplayerid);
    printf("%s", string);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }

    if(strcmp(cmd, "/bring", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Brings A Player To Admin
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /bring (id)");
    return 1;
    }
    giveplayerid = strval(tmp);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /bring (id) ID Must be a number");
    return 1;
    }
    if (IsPlayerConnected(giveplayerid)) {
    SetPlayerInterior(giveplayerid, GetPlayerInterior(playerid));
    new Float:x, Float:y, Float:z;
    new pname[24];
    new aname[24];
    GetPlayerPos(playerid, x,y,z);
    SetPlayerPos(giveplayerid, x+1,y,z);
    SetPlayerVirtualWorld(giveplayerid,GetPlayerVirtualWorld(playerid));
    GetPlayerName(giveplayerid, pname, 24);
    GetPlayerName(playerid, aname, 24);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Admin Command Used_|");
    format(string, sizeof(string), "You have brought (teleported) %s(%d) to you",pname,giveplayerid);
    SendClientMessage(playerid,0xFF7F50AA, string);
    format(string, sizeof(string), "%s(%d) has brought (teleported) %s(%d) [ADMIN COMMAND /BRING]",aname,playerid,pname,giveplayerid);
    printf("%s", string);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }

    if(strcmp(cmd, "/adfr", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Freeze A Player
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /adfr (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adfr (id) ID Must be a number");
    return 1;
    }
    new output[255];
    strmid(output,cmdtext,8,strlen(cmdtext));
    if (IsPlayerConnected(giveplayerid)) {
    TogglePlayerControllable(giveplayerid, 0);
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN FREEZE)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    Frozen[giveplayerid] =1;
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }


    

	if(strcmp(cmd, "/adfrall", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Freeze All Players Except Admins
	{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && IsSpawned[i] == 1 && PlayerAdminLevel[i] == 0 && Frozen[i] == 0)
		{
      	    TogglePlayerControllable(i, 0);
      	    Frozen[i] =1;
      	}
    }
            new output[100];
    		strmid(output,cmdtext,9,strlen(cmdtext));
    		format(string, sizeof(string),"**(ADMIN SERVER FREEZE)**  %s",output);
   			SendClientMessageToAll(0xFF7F50AA, string);
    		printf("%s", string);
	return 1;
    }

    if(strcmp(cmd, "/adunfrall", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Un-Freeze All Players
	{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && IsSpawned[i] == 1 && PlayerAdminLevel[i] == 0 && Frozen[i] == 1)
		{
      	    TogglePlayerControllable(i, 1);
      	    Frozen[i] =0;
      	}
    }
            new output[100];
    		strmid(output,cmdtext,11,strlen(cmdtext));
    		format(string, sizeof(string),"**(ADMIN SERVER UNFREEZE)**  %s",output);
   			SendClientMessageToAll(0xFF7F50AA, string);
    		printf("%s", string);
	return 1;
    }

    if(strcmp(cmd, "/adunfr", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Unfreeze Player
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adunfr (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adfr (id) ID Must be a number");
    return 1;
    }
    new output[255];
    strmid(output,cmdtext,10,strlen(cmdtext));
    if (IsPlayerConnected(giveplayerid)) {
    TogglePlayerControllable(giveplayerid, 1);
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN UNFREEZE)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    Frozen[giveplayerid] =0;
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }

    if(strcmp(cmd, "/adjail", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Sent A Player To Jail
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adjail (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adjail (id) ID Must be a number");
    return 1;
    }
    new output[255];
    strmid(output,cmdtext,10,strlen(cmdtext));
	if (IsPlayerConnected(giveplayerid) && Jailed[giveplayerid] == 0) {
    SetPlayerInterior(giveplayerid,3);
    SetPlayerPos(giveplayerid,194.0873,175.3850,1003.0234);
    SetPlayerFacingAngle(giveplayerid,20.7011);
    Jailed[giveplayerid] = 1;
    JailTime[giveplayerid] =300;
    ResetPlayerWeapons(giveplayerid);
    SetCameraBehindPlayer(giveplayerid);
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN JAIL)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    cannotescapejail[giveplayerid] =1;
    SetPlayerWantedLevel(giveplayerid,0);
    SetPlayerToTeamColour(giveplayerid);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player (Or is already in jail)", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }


    if(strcmp(cmd, "/adunjail", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Release From Jail
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adunjail (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adunjail (id) ID Must be a number");
    return 1;
    }
    
    new output[255];
    strmid(output,cmdtext,12,strlen(cmdtext));

    if (IsPlayerConnected(giveplayerid) && Jailed[giveplayerid] == 1) {
    SetPlayerInterior(giveplayerid,3);
    SetPlayerPos(giveplayerid,210.5272,146.3341,1003.0234);
    SetPlayerFacingAngle(giveplayerid,179.4662);
    SetCameraBehindPlayer(giveplayerid);
    Jailed[giveplayerid] = 0;
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN UNJAIL)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    cannotescapejail[giveplayerid] =0;
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player (Or is not in jail)", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }

    if(strcmp(cmd, "/adkick", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Admin Kick
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adkick (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adkick (id) ID Must be a number");
    return 1;
    }
    new output[255];
    strmid(output,cmdtext,10,strlen(cmdtext));
    if (IsPlayerConnected(giveplayerid)) {
    SetPlayerInterior(giveplayerid,10);
    SetPlayerPos(giveplayerid,219.6257,111.2549,999.0156);
    SetPlayerFacingAngle(giveplayerid,2.2339);
    SetCameraBehindPlayer(giveplayerid);
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN KICK)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    ircSay(EchoConnection, EchoChan,string);
    //format(string, 100, "\2;**(ADMIN KICK)** %s(%d) %s\2;", string,giveplayerid,output);
    //ircSay(EchoConnection, EchoChan,string);
    Kicking[giveplayerid] = 1;
    SetTimer("KickPlayer",700,0);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }

    if(strcmp(cmd, "/adban", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Admin Ban
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adban (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adban (id) ID Must be a number");
    return 1;
    }
    new output[255];
    strmid(output,cmdtext,9,strlen(cmdtext));
    if (IsPlayerConnected(giveplayerid)) {
    SetPlayerInterior(giveplayerid,0);
    SetPlayerPos(giveplayerid,-127.0526,2258.4316,29.4287);
    SetPlayerFacingAngle(giveplayerid,217.0701);
    SetCameraBehindPlayer(giveplayerid);
	SetTimer("BanExplosionone",500,0);
	AdminKilled[giveplayerid] =1;
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN BAN)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    if(udb_Exists(PlayerName(giveplayerid)) && PLAYERLIST_authed[giveplayerid]) {
	dUserSetINT(PlayerName(giveplayerid)).("nameban",1);
	}
    SendClientMessage(giveplayerid,COLOR_RED,"||| YOU HAVE BEEN BANNED FROM THIS SERVER");
    SendClientMessage(giveplayerid,COLOR_RED,"||| You can appeal this action at our website");
    SendClientMessage(giveplayerid,COLOR_RED,"||| Visit www.sa-rpg.co.uk for details");
    SendClientMessage(giveplayerid,COLOR_RED,"||| Please note that we do not unban hackers/cheaters");
    Banning[giveplayerid] = 1;

    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }

	if(strcmp(cmd, "/adrpwarn", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Admin Warn /rp Abuse
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adrpwarn (id)");
    return 1;
    }
    giveplayerid = strval(tmp);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adrpwarn (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(udb_Exists(PlayerName(giveplayerid)) && PLAYERLIST_authed[giveplayerid])
	{
    new rpwarnings =0;
    rpwarnings =dUserINT(PlayerName(giveplayerid)).("rpabusewar");
    rpwarnings +=1;
    if(rpwarnings >=3) {
    SetPlayerInterior(giveplayerid,10);
    SetPlayerPos(giveplayerid,219.6257,111.2549,999.0156);
    SetPlayerFacingAngle(giveplayerid,2.2339);
    SetCameraBehindPlayer(giveplayerid);
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(AUTO KICK)** %s(%d) Too many admin warnings for abusing the /rp command",string,giveplayerid);
    SendClientMessageToAll(0xFF7F50AA, string);
    printf("%s", string);
    dUserSetINT(PlayerName(giveplayerid)).("rpabusewar",0);
    Kicking[giveplayerid] = 1;
    SetTimer("KickPlayer",700,0);
    }
    else
    if(rpwarnings <=2) {
	GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN WARN)** %s(%d) Has been warned by server admin for abusing the /rp command",string,giveplayerid);
    SendClientMessageToAll(0xFF7F50AA, string);
    SendClientMessage(giveplayerid,COLOR_RED,"YOU HAVE BEEN WARNED BY SERVER ADMIN FOR ABUSING THE /RP COMMAND");
    SendClientMessage(giveplayerid,COLOR_RED,"Further abuse will result in more warnings and possible a kick/ban");
    SendClientMessage(giveplayerid,COLOR_RED,"Visit www.sa-rpg.co.uk for details or speak to a server admin");
    dUserSetINT(PlayerName(giveplayerid)).("rpabusewar",rpwarnings);
    }
    }
    return 1;
    }

	
    
    if(strcmp(cmd, "/adkill", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Admin Kill A Player
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adkill (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adkill (id) ID Must be a number");
    return 1;
    }
    new output[255];
    AdminKilled[giveplayerid] =1;
    strmid(output,cmdtext,10,strlen(cmdtext));
    if (IsPlayerConnected(giveplayerid)) {
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN KILL)** %s(%d) %s", string,giveplayerid,output);
    printf("%s", string);
    SendClientMessageToAll(0xFF7F50AA, string);
    SetPlayerHealth(giveplayerid,0);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }

    if(strcmp(cmd, "/admute", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Mute A Player
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /admute (id)");
    return 1;
    }
    giveplayerid = strval(tmp);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /admute (id) ID Must be a number");
    return 1;
    }
    if(Muted[giveplayerid] == 1) {
    format(string, sizeof(string), "ID (%d) Is already Muted", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new output[255];
    strmid(output,cmdtext,10,strlen(cmdtext));
    if (IsPlayerConnected(giveplayerid)) {
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN MUTE)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    Muted[giveplayerid] =1;
    printf("%s", string);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }
    
    if(strcmp(cmd, "/adunmute", true) == 0 && PlayerAdminLevel[playerid] == 1337) // Unmute A Player
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adunmute (id)");
    return 1;
    }
    giveplayerid = strval(tmp);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /adunmute (id) ID Must be a number");
    return 1;
    }
    if(Muted[giveplayerid] == 0) {
    format(string, sizeof(string), "ID (%d) Is not Muted", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new output[255];
    strmid(output,cmdtext,12,strlen(cmdtext));
    if (IsPlayerConnected(giveplayerid)) {
    GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "**(ADMIN UNMUTE)** %s(%d) %s", string,giveplayerid,output);
    SendClientMessageToAll(0xFF7F50AA, string);
    Muted[giveplayerid] =0;
    printf("%s", string);
    }
    else {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    return 1;
    }
    

    if (strcmp("/admsg", cmdtext, true, 6) == 0 && PlayerAdminLevel[playerid] == 1337) // Talk To Other Admins
    {
    if(strlen(cmdtext) <= 7) {
    SendClientMessage(playerid,COLOR_ERROR,"USAGE: /admsg (msg)");
    return 1;
    }
	new output[255];
	new pname[24];
	GetPlayerName(playerid, pname, 24);
    strmid(output,cmdtext,7,strlen(cmdtext));
    format(string, sizeof(string), "(ADMIN MSG): %s(%d) %s",pname,playerid,output);
    printf("%s", string);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(PlayerAdminLevel[i] == 1337) {
    format(string, sizeof(string), "(ADMIN MSG): %s(%d) %s",pname,playerid,output);
    SendClientMessage(i,0xFF7F50AA,string);
    }
    }
    return 1;
    }
    /*---------------------------------------------------------------
	END OF SERVER ADMIN COMMANDS
	---------------------------------------------------------------*/

	








    if(strcmp(cmd, "/liftdown", true) == 0) {
    if(IsPlayerConnected(playerid)) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_ARMY) {
    SendClientMessage(playerid, COLOR_ERROR, "This command can only be used by SA Army");
    return 1;
    }
    new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	if(x >= 2860.2568 && x <= 2901.6670 && y >= 459.5847 && y <= 484.5682 && z >= 11.0254 && z <= 19.6801)
	{
	MoveObject(carrierlift,2870.2490,472.1000,10.3583,2);
	}
	else {
	SendClientMessage(playerid, COLOR_ERROR, "You are not close enough to use the aircraft elevator");
	}
	}
    return 1;
    }

    
    
    if(strcmp(cmd, "/liftup", true) == 0) {
    if(IsPlayerConnected(playerid)) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_ARMY) {
    SendClientMessage(playerid, COLOR_ERROR, "This command can only be used by SA Army");
    return 1;
    }
    new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	if(x >= 2860.2568 && x <= 2901.6670 && y >= 459.5847 && y <= 484.5682 && z >= 11.0254 && z <= 19.6801)
	{
	MoveObject(carrierlift,2870.2490,472.1000,17.3583,2);
	}
	else {
	SendClientMessage(playerid, COLOR_ERROR, "You are not close enough to use the aircraft elevator");
	}
	}
    return 1;
    }
    

	
    if (strcmp("/kill", cmdtext, true, 10) == 0)
	{
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
	if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(GetPlayerMoney(playerid) <= -1) {
	SendClientMessage(playerid, COLOR_ERROR, "You are in Debt. You cannot use this command");
    return 1;
    }
	if(GetPlayerWantedLevel(playerid) == 0)
	{
	KilledHimself[playerid] =1;
    new str[100];
    GetPlayerName(playerid, str, 24);
    format(str, 100, "%s(%d) Has commited suicide using /kill", str,playerid);
    SendClientMessageToAll(0xEE82EEAA, str);
    ircSay(EchoConnection, EchoChan, str);
	oscore = GetPlayerScore(playerid);
    SetPlayerScore(playerid, oscore -1);
    SetPlayerHealth(playerid,0);



    }
	else
    SendClientMessage(playerid,COLOR_ERROR,"The police are looking for you. You cannot use this command");
    return 1;
	}

	if(strcmp(cmd,"/cw",true)==0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(!IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid, COLOR_ERROR, "You not in any vehicle. You cannot use this command");
    return 1;
    }
    
    if(strlen(cmdtext) <= 4) {
    SendClientMessage(playerid,COLOR_ERROR,"USAGE: /cw (msg)");
    return 1;
    }
    new cwhisperid = GetPlayerVehicleID(playerid);
    new output[150];
	new pname[24];
	GetPlayerName(playerid, pname, 24);
    strmid(output,cmdtext,3,strlen(cmdtext));
    format(string, sizeof(string), "(CAR WHISPER): %s(%d) %s",pname,playerid,output);
    printf("%s", string);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(IsPlayerInAnyVehicle(i))
	{
	if(GetPlayerVehicleID(i) == cwhisperid)
	{
    format(string, sizeof(string), "(CAR WHISPER): %s(%d) %s",pname,playerid,output);
    SendClientMessage(i,COLOR_YELLOW,string);
    }
    }
    }
    return 1;
    }
    
    if(strcmp(cmd,"/playercolours",true)==0 || strcmp(cmd,"/pc",true)==0)
	{
	SendClientMessage(playerid, COLOR_GREY, "- - - - - - - - - - - - - - - - - - - -");
	SendClientMessage(playerid, COLOR_WHITE, "A WHITE PLAYER: Innocent Civilian");
	SendClientMessage(playerid, COLOR_YELLOW, "A YELLOW PLAYER: Low Wanted player. Cops should issue a fine with /fine (id)");
	SendClientMessage(playerid, COLOR_ORANGE, "A ORANGE PLAYER: Warrant Issued for player. Cops should arrest the player with /ar (id)");
	SendClientMessage(playerid, COLOR_RED, "A RED PLAYER: Warrant Issued, Armed And Dangerous. Cops should let the Army take the suspect down");
	SendClientMessage(playerid, COLOR_BLUE, "A BLUE PLAYER: Police Officer");
	SendClientMessage(playerid, COLOR_PURPLE, "A PURPLE PLAYER: SA Army Officer");
	SendClientMessage(playerid, COLOR_GREEN, "A GREEN PLAYER: Medic / Driver");
    SendClientMessage(playerid,COLOR_WHITE,"Type /commands for a full list of commands available to your skill/job");
    SendClientMessage(playerid, COLOR_GREY, "- - - - - - - - - - - - - - - - - - - -");
    return 1;
    }
    
    
    
    
    if(strcmp(cmd,"/w",true)==0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(strlen(cmdtext) <= 3) {
    SendClientMessage(playerid,COLOR_ERROR,"USAGE: /w (msg)");
    return 1;
    }
    new output[150];
	new pname[24];
	GetPlayerName(playerid, pname, 24);
    strmid(output,cmdtext,2,strlen(cmdtext));
    format(string, sizeof(string), "(WHISPER): %s(%d) %s",pname,playerid,output);
    printf("%s", string);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(IsPlayerConnected(i) && GetDistanceBetweenPlayers(playerid,i) < 10) {
	{
    format(string, sizeof(string), "(WHISPER): %s(%d) %s",pname,playerid,output);
    SendClientMessage(i,COLOR_YELLOW,string);
    }
    }
    }
    return 1;
    }
    
    
    if(strcmp(cmd, "/report", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /report (id) (reason) ID Must be a number");
    return 1;
    }
	if(!strlen(tmp)) {
	SendClientMessage(playerid, COLOR_ERROR, "USAGE: /report (id) (reason)");
	return 1;
	}
	giveplayerid = strval(tmp);
	if(!IsPlayerConnected(giveplayerid)) {
	format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
	}
    new output[70];
    strmid(output,cmdtext,10,strlen(cmdtext));
    if(!strlen(cmdtext)) {
	SendClientMessage(playerid, COLOR_ERROR, "USAGE: /report (id) (reason)");
	return 1;
	}
    new reportername[24];
    new reportedname[24];
    GetPlayerName(playerid,reportername, 24);
	GetPlayerName(giveplayerid,reportedname, 24);
	format(string, sizeof(string), "(REPORT SENT) You have reported: %s(%d) to any online Admins",reportedname,giveplayerid);
    SendClientMessage(playerid,0xFF7F50AA,string);
    format(string, sizeof(string), "(REPORT DETAILS) '%s'",output);
    SendClientMessage(playerid,0xFF7F50AA,string);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(IsPlayerConnected(i) && PlayerAdminLevel[i] == 1337) {
	{
    format(string, sizeof(string), "(REPORT SENT BY: %s(%d)",reportername,playerid);
    SendClientMessage(i,0xFF7F50AA,string);
    printf("%s",string);
    format(string, sizeof(string), "(REPORTED PLAYER: %s(%d): %s",reportedname,giveplayerid,output);
    SendClientMessage(i,0xFF7F50AA,string);
    printf("%s",string);
    }
    }
    }
    return 1;
    }
    

    if(strcmp(cmd,"/skill",true)==0)
	{
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_LAWYER) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a lawyer.");
    return 1;
    }
    if(canchooseskill[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command now. Only certain teams can use this at time of spawn");
    return 1;
    }
	    
	        new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_ROYALBLUE,"Use: /skill 1-6 to select your chosen skill. Default skill (Rapist) Will be given if you dont choose");
		  		SendClientMessage(playerid, 0x00C7FFAA, "1. Rapist");
		  		SendClientMessage(playerid, 0x00C7FFAA, "2. Drug Dealer");
		  		SendClientMessage(playerid, 0x00C7FFAA, "3. GunDealer");
		  		SendClientMessage(playerid, 0x00C7FFAA, "4. Hitman");
		  		SendClientMessage(playerid, 0x00C7FFAA, "5. Private Medic");
		  		SendClientMessage(playerid, 0x00C7FFAA, "6. Bounty Hunter");
		  		SendClientMessage(playerid, 0x00C7FFAA, "7. Car Jacker");
		  		
				return 1;
			}
		    if(strcmp(x_nr,"1",true) == 0)// Rapist
			{
			   SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		       SendClientMessage(playerid,0x1E90FFAA, "RAPIST: You can rape other players and infect them with STDs that could kill them");

               GivePlayerWeapon(playerid,5,1);
               GivePlayerWeapon(playerid,22,100);
               GivePlayerWeapon(playerid,14,1);
               gTeam[playerid] = TEAM_RAPIST;
               SetPlayerToTeamColour(playerid);
               canchooseskill[playerid] =0;
               TextDrawHideForPlayer(playerid,txtTypeSkill);
              return 1;
               
			}
			else if(strcmp(x_nr,"2",true) == 0)//Drug Dealer
			{
               SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		       SendClientMessage(playerid,0x00FFFFAA, "DRUG DEALER: You will supply people with drugs for a price. Dont let people rip you off..");
               SendClientMessage(playerid,0x00FFFFAA, "Keep a watch on the chat for players wanting drugs. Visit the drug house to replenish your stock");
               GivePlayerWeapon(playerid,25,50);
               GivePlayerWeapon(playerid,28,100);
               GivePlayerWeapon(playerid,5,1);
               gTeam[playerid] = TEAM_DRGDEL;
               SetPlayerToTeamColour(playerid);
               PlayerDrugs[playerid] = 500;
               canchooseskill[playerid] =0;
               TextDrawHideForPlayer(playerid,txtTypeSkill);
               return 1;
			}
			else if(strcmp(x_nr,"3",true) == 0)//Gun Dealer
			{
               SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		       SendClientMessage(playerid,0x00FFFFAA, "GUN DEALER: If anyone needs weapons then you sell them some lead. Your prices are set by the game");
               SendClientMessage(playerid,0x00FFFFAA, "You can also deliver guns to ammunations, just get in the PATRIOT car at ammunation stores in LV");
               GivePlayerWeapon(playerid,29,500);
               GivePlayerWeapon(playerid,30,50);
               gTeam[playerid] = TEAM_GUNDEL;
               SetPlayerToTeamColour(playerid);
               canchooseskill[playerid] =0;
               TextDrawHideForPlayer(playerid,txtTypeSkill);
               return 1;
               
   }
			else if(strcmp(x_nr,"4",true) == 0)//Hitman
			{
               SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		       SendClientMessage(playerid,0x00FFFFAA, "HITMAN: If anyone needs another player dead then they will contact you. Make sure you agree a price and get paid");
               //SendClientMessage(playerid,0x00FFFFAA, "Look out for messages on the chat like **Hitmen: PsyKo wants Tyrone dead. Contact PsyKo to discuss**");
               SendClientMessage(playerid,0x00FFFFAA, "Type /hits to see if there are any hit contracts available");
               GivePlayerWeapon(playerid,27,250);
               GivePlayerWeapon(playerid,23,100);
               GivePlayerWeapon(playerid,31,250);
               gTeam[playerid] = TEAM_HITMAN;
               SetPlayerToTeamColour(playerid);
               canchooseskill[playerid] =0;
               TextDrawHideForPlayer(playerid,txtTypeSkill);
               return 1;

			}

			else if(strcmp(x_nr,"5",true) == 0)//pvt medic
			{
               SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		       SendClientMessage(playerid,0x00FFFFAA, "PRIVATE MEDIC: If anyone needs medical attention for cuts and bruses or STDs then you can cure then and heal them");
               SendClientMessage(playerid,0x00FFFFAA, "You can also infect them with STDs that could kill them DO NOT HIT/INFECT THEM JUST TO HEAL/CURE THEM");
               GivePlayerWeapon(playerid,22,250);
               gTeam[playerid] = TEAM_PVTMED;
               SetPlayerToTeamColour(playerid);
               canchooseskill[playerid] =0;
               TextDrawHideForPlayer(playerid,txtTypeSkill);
			   return 1;
            }
			else if(strcmp(x_nr,"6",true) == 0)//bounty hunter
			{
               SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		       SendClientMessage(playerid,0x00FFFFAA, "BOUNTY HUNTER: You have to help the cops take Escaped prisoners back into custody");
               SendClientMessage(playerid,0x00FFFFAA, "Simply target RED players and type /ar (id) next to them to see if you have found an escaped convict");
               SendClientMessage(playerid,0x00FFFFAA, "Type /bounty for details of Escaped Prisoners");
               GivePlayerWeapon(playerid,27,250);
               GivePlayerWeapon(playerid,23,100);
               GivePlayerWeapon(playerid,31,250);
               gTeam[playerid] = TEAM_BOUNTY;
               SetPlayerToTeamColour(playerid);
               canchooseskill[playerid] =0;
               TextDrawHideForPlayer(playerid,txtTypeSkill);
			   return 1;
			}
   else if(strcmp(x_nr,"7",true) == 0)//Car jacker
			{
               SendClientMessage(playerid,0x1E90FFAA, "Type /commands for your commands");
		       SendClientMessage(playerid,0x00FFFFAA, "CAR JACKER: You can /steelcars from autobahn for money.");
               gTeam[playerid] = TEAM_CARJACK;
               SetPlayerToTeamColour(playerid);
               canchooseskill[playerid] =0;
               TextDrawHideForPlayer(playerid,txtTypeSkill);
			   return 1;
			}

			else
			{
			SendClientMessage(playerid, COLOR_ERROR, "USAGE: /skill 1-6");
			return 1;
			}
			}

	 // COP COMMANDS 

     if(strcmp(cmd, "/parole", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
	 if(gTeam[playerid] != 1 && gTeam[playerid] != 8) {
	 SendClientMessage(playerid, COLOR_ERROR, "Only the Jail Turnkey or Police Officer classes can release prisoners from jail");
     return 1;
     }
	 if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
	 tmp = strtok(cmdtext, idx);
     if(!strlen(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /parole (id)");
     return 1;
     }
     giveplayerid = strval(tmp);
     if(!IsNumeric(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /parole (id) ID Must be a number");
     return 1;
     }
     if(!IsPlayerConnected(giveplayerid)) {
     format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     new prisonername[24];
     new turnkeyname[24];
     GetPlayerName(giveplayerid,prisonername, 24);
     GetPlayerName(playerid, turnkeyname, 24);
     if(InAlcatraz[giveplayerid] == 1) {
     format(string, sizeof(string), "%s(%d) is in jail on Alcatraz Island. You cannot parole that player",prisonername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(Jailed[giveplayerid] == 0) {
	 format(string, sizeof(string), "%s(%d) is not in jail",prisonername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5) {
     format(string, sizeof(string), "%s(%d) Is in jail. You are not close enough to parole",prisonername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     SetPlayerInterior(giveplayerid,3);
     SetPlayerPos(giveplayerid,210.5272,146.3341,1003.0234);
     SetPlayerFacingAngle(giveplayerid,179.4662);
     SetCameraBehindPlayer(giveplayerid);
     Jailed[giveplayerid] = 0;
     JailTime[giveplayerid] =0;
     cannotescapejail[giveplayerid] =0;
     SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Released From Jail_|");
     format(string, sizeof(string), "%s(%d) has released you from jail",turnkeyname,playerid);
     SendClientMessage(giveplayerid, 0x00C7FFAA, string);
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Prisoner Released_|");
     format(string, sizeof(string), "You have released %s(%d) from jail",prisonername,giveplayerid);
     SendClientMessage(playerid, 0x00C7FFAA, string);
     format(string, sizeof(string), "%s(%d) Has released %s(%d) from jail early",turnkeyname,playerid,prisonername,giveplayerid);
     SendClientMessageToAll(0x00C7FFAA, string);
     format(string, sizeof(string), "%s(%d) Has released %s(%d) from jail early",turnkeyname,playerid,prisonername,giveplayerid);
     printf("%s",string);
     ircSay(EchoConnection, EchoChan,string);
     oscore = GetPlayerScore(playerid);
     SetPlayerScore(playerid, oscore +1);
     return 1;
     }
     
     if(strcmp(cmd, "/free", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
     if(GetPlayerWantedLevel(playerid) >=1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are wanted by the police. You cannot use this command.");
    return 1;
    }
	 if(gTeam[playerid] != 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are not a Lawyer!");
     return 1;
     }
	 if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
	 tmp = strtok(cmdtext, idx);
     if(!strlen(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /free (id)");
     return 1;
     }
     giveplayerid = strval(tmp);
     if(!IsNumeric(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /free (id) ID Must be a number");
     return 1;
     }
     if(!IsPlayerConnected(giveplayerid)) {
     format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     new prisonername[24];
     new turnkeyname[24];
     GetPlayerName(giveplayerid,prisonername, 24);
     GetPlayerName(playerid, turnkeyname, 24);
     if(InAlcatraz[giveplayerid] == 1) {
     format(string, sizeof(string), "%s(%d) is in jail on Alcatraz Island. You cannot free that player",prisonername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(Jailed[giveplayerid] == 0) {
	 format(string, sizeof(string), "%s(%d) is not in jail",prisonername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5) {
     format(string, sizeof(string), "%s(%d) Is in jail. You are not close enough to free",prisonername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     SetPlayerInterior(giveplayerid,3);
     SetPlayerPos(giveplayerid,210.5272,146.3341,1003.0234);
     SetPlayerFacingAngle(giveplayerid,179.4662);
     SetCameraBehindPlayer(giveplayerid);
     Jailed[giveplayerid] = 0;
     JailTime[giveplayerid] =0;
     cannotescapejail[giveplayerid] =0;
     SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Released From Jail_|");
     format(string, sizeof(string), "%s(%d) has released you from jail",turnkeyname,playerid);
     SendClientMessage(giveplayerid, 0x00C7FFAA, string);
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Prisoner Released_|");
     format(string, sizeof(string), "You have released %s(%d) from jail",prisonername,giveplayerid);
     SendClientMessage(playerid, 0x00C7FFAA, string);
     format(string, sizeof(string), "Lawyer %s(%d) Has released %s(%d) from jail",turnkeyname,playerid,prisonername,giveplayerid);
     SendClientMessageToAll(0x00C7FFAA, string);
     format(string, sizeof(string), "Lawyer %s(%d) Has released %s(%d) from jail",turnkeyname,playerid,prisonername,giveplayerid);
     printf("%s",string);
     GivePlayerMoney(playerid,4500);
     ircSay(EchoConnection, EchoChan,string);
     oscore = GetPlayerScore(playerid);
     SetPlayerScore(playerid, oscore +1);
     return 1;
     }


     if(strcmp(cmd, "/jam", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
     if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
	 if(gTeam[playerid] <= 2) {
	 SendClientMessage(playerid, COLOR_ERROR, "Law Enforcement agents cannot jam the radio system");
     return 1;
     }
     if(HasLawEnforcementRadio[playerid] == 0) {
     SendClientMessage(playerid, COLOR_ERROR, "You do not have a Law Enforcement radio");
     return 1;
     }
     SendClientMessage(playerid, COLOR_ERROR, "your attempt to jam the Law Enforcement radio systems has failed");
     return 1;
     }
     
	 if(strcmp(cmd, "/food", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
     if(gTeam[playerid] == TEAM_BISTRO) {
     SendClientMessage(playerid, COLOR_ERROR, "You are food delivery staff. You have to goto the shop to eat");
     return 1;
     }
     if(askedforfood[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
     return 1;
     }
     if (!GetPlayersInTeam(TEAM_BISTRO)) {
     SendClientMessage(playerid,COLOR_ERROR,"Unable to locate any Food Delivery staff");
     return 1;
     }
	 for(new i=0;i<MAX_PLAYERS;i++)
	 {
     if(gTeam[i] == TEAM_BISTRO) {
     new pname[24];
     new current_zone;
     current_zone = player_zone[playerid];
     GetPlayerName(playerid, pname, 24);
     SendClientMessage(i, 0xA9A9A9AA, "|_Food Delivery Requested_|");
     format(string, sizeof(string), "%s(%d) has called for a food delivery. Location: %s",pname,playerid,zones[current_zone][zone_name]);
     SendClientMessage(i,COLOR_ROYALBLUE,string);
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Food Delivery Called_|");
     SendClientMessage(playerid,COLOR_ROYALBLUE,"You have called for a food delivery");
     Wantsfood[playerid] =1;
     askedforfood[playerid] =1;
     }
     }
     return 1;
     }
     if(strcmp(cmd, "/lawyer", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
     if(GetPlayerMoney(giveplayerid) <= 4399) {
     SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to pay the lawyer..Sorry(4500$)");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
     if(Jailed[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in jail.");
    return 1;
    }
     if(askedforfood[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
     return 1;
     }
     if (!GetPlayersInTeam(TEAM_LAWYER)) {
     SendClientMessage(playerid,COLOR_ERROR,"Unable to locate any Lawyer.");
     return 1;
     }
	 for(new i=0;i<MAX_PLAYERS;i++)
	 {
     if(gTeam[i] == TEAM_LAWYER) {
     new pname[24];
     new current_zone;
     current_zone = player_zone[playerid];
     GetPlayerName(playerid, pname, 24);
     SendClientMessage(i, 0xA9A9A9AA, "|_Lawyer Requested_|");
     format(string, sizeof(string), "%s(%d) has called for a Lawyer. Location: %s",pname,playerid,zones[current_zone][zone_name]);
     SendClientMessage(i,COLOR_ROYALBLUE,string);
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Lawyer Called_|");
     SendClientMessage(playerid,COLOR_ROYALBLUE,"You have called for a Lawyer.");
     
     }
     }
     return 1;
     }
     
     if(strcmp(cmd, "/weapons", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
     if(gTeam[playerid] == TEAM_GUNDEL) {
     SendClientMessage(playerid, COLOR_ERROR, "You are a Weapon Dealer. You have to go to ammunation buy guns");
     return 1;
     }
     if(askedforweapons[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
     return 1;
     }
     if (!GetPlayersInTeam(TEAM_GUNDEL)) {
     SendClientMessage(playerid,COLOR_ERROR,"Unable to locate any Weapon Dealers");
     return 1;
     }
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Dealer Called_|");
     SendClientMessage(playerid,COLOR_ROYALBLUE,"You have called a Weapon Dealer to your location");
	 for(new i=0;i<MAX_PLAYERS;i++)
	 {
     if(gTeam[i] == TEAM_GUNDEL) {
     new pname[24];
     new current_zone;
     current_zone = player_zone[playerid];
     GetPlayerName(playerid, pname, 24);
     SendClientMessage(i, 0xA9A9A9AA, "|_Weapon Dealer Requested_|");
     format(string, sizeof(string), "%s(%d) has called for a Weapon Dealer. Location: %s",pname,playerid,zones[current_zone][zone_name]);
     SendClientMessage(i,COLOR_ROYALBLUE,string);
     Wantsguns[playerid] =1;
     askedforweapons[playerid] =1;
     }
     }
     return 1;
     }
     if(strcmp(cmd, "/sellweapons", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
	 if(gTeam[playerid] != TEAM_GUNDEL) {
	 SendClientMessage(playerid, COLOR_ERROR, "Only Weapon Dealers can sell weapons");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
	 if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
     if(cuffed[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
     return 1;
     }
     tmp = strtok(cmdtext, idx);
     if(!strlen(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellweapons (id)");
     return 1;
     }
     giveplayerid = strval(tmp);
     if(!IsNumeric(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellweapons (id) ID Must be a number");
     return 1;
     }
     if(!IsPlayerConnected(giveplayerid)) {
     format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(Jailed[giveplayerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot sell weapons to a prisoner");
     return 1;
     }
     new workername[24];
     new playername[24];
     GetPlayerName(playerid,workername, 24);
     GetPlayerName(giveplayerid, playername, 24);
     if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 15) {
     format(string, sizeof(string), "%s(%d) Is not close enough. You cannot sell weapons to that player",playername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(gTeam[giveplayerid] == TEAM_GUNDEL) {
     SendClientMessage(playerid, COLOR_ERROR, "You cannot sell weapons to another Weapon Dealer");
     return 1;
     }
     if(Wantsguns[giveplayerid] == 0) {
     format(string, sizeof(string), "%s(%d) Has not asked for a Gun Dealer. You have offered to sell Weapons",playername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapons Offered_|");
     format(string, sizeof(string), "%s(%d) Has offered to sell you weapons. Type /weapons to accept the offer",workername,playerid);
     SendClientMessage(giveplayerid, 0x00C7FFAA, string);
     OfferedGuns[giveplayerid] =1;
     return 1;
     }
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Offered_|");
     format(string, sizeof(string), "%s(%d) Is viewing your weapon list...Use /sellweapon %d (Item Number) to sell ... Please wait...",playername,giveplayerid,giveplayerid);
     SendClientMessage(playerid, 0x00C7FFAA, string);
     format(string, sizeof(string), "Use /sellweapon %d (Item Number) when %s(%d) tells you the item number...",giveplayerid,playername,giveplayerid);
     SendClientMessage(playerid, 0x00C7FFAA, string);
     SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapons Offered_|");
     SendClientMessage(giveplayerid,0x00C7FFAA," Weapons available. Tell the Weapon Dealer which number you want to purchase (1-6)");
     SendClientMessage(giveplayerid,0x00C7FFAA,"1. =[100 Ammo]=$2500====Silenced 9mm");
     SendClientMessage(giveplayerid,0x00C7FFAA,"2. =[500 Ammo]=$1000====Tec9");
     SendClientMessage(giveplayerid,0x00C7FFAA,"3. =[30  Ammo]=$3500====S/O ShotGun");
     SendClientMessage(giveplayerid,0x00C7FFAA,"4. =[30  Ammo]=$15000===Sniper Rifle");
     SendClientMessage(giveplayerid,0x00C7FFAA,"5. =[200 Ammo]=$8000====AK47");
     SendClientMessage(giveplayerid,0x00C7FFAA,"6. ============$500=====Armor");
     SendClientMessage(giveplayerid,0x00C7FFAA,"7. ============$3500=====3 Blocks Of C4");
     OfferedGuns[giveplayerid] =1;
     return 1;
     }


    if(strcmp(cmd,"/sellweapon",true)==0)
	{
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
     if(gTeam[playerid] != TEAM_GUNDEL) {
	 SendClientMessage(playerid, COLOR_ERROR, "Only Weapon Dealers can sell weapons");
     return 1;
     }
     tmp = strtok(cmdtext, idx);
     if(!strlen(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellweapon (id) [WEAPON.No]");
     return 1;
     }
     giveplayerid = strval(tmp);
     if(!IsNumeric(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellweapon (id) [WEAPON.No] ID Must be a number");
     return 1;
     }
     if(Jailed[giveplayerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot sell weapons to a prisoner");
     return 1;
     }
     if(OfferedGuns[giveplayerid] == 0) {
     SendClientMessage(playerid, COLOR_ERROR,"No Weapon Dealer has offered to sell this player weapons. Use /sellweapons id first");
     return 1;
	 }
     new workername[24];
     new playername[24];
     GetPlayerName(playerid,workername, 24);
     GetPlayerName(giveplayerid, playername, 24);
     if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 15) {
     format(string, sizeof(string), "%s(%d) Is not close enough. You cannot sell weapons to that player",playername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
	 if(IsPlayerConnected(playerid))
	 {
	 new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellweapon (id) [1-7]");
      			return 1;
			}
		    if(strcmp(x_nr,"1",true) == 0)
			{
			   if(GetPlayerMoney(giveplayerid) <= 2499) {
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you a Silenced 9mm weapon. You cannot afford $2500",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) cannot afford that weapon",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);
			   
			   return 1;
			}
			   GivePlayerWeapon(giveplayerid,23,100);
			   GivePlayerMoney(giveplayerid, -2500);
			   GivePlayerMoney(playerid,1500);
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Purchased_|");
			   format(string, sizeof(string), "%s(%d) Has sold you a Silenced 9mm weapon with 100 Ammo for $2500",workername,playerid);
               SendClientMessage(giveplayerid, 0x00C7FFAA, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sold_|");
               format(string, sizeof(string), "%s(%d) Has purchased a Silenced 9mm weapon from you. You receive a $1500 bonus",playername,giveplayerid);
               SendClientMessage(playerid, 0x00C7FFAA, string);
               oscore = GetPlayerScore(playerid);
   			   SetPlayerScore(playerid, oscore +1);
			   

			}
			else if(strcmp(x_nr,"2",true) == 0)
			{
               if(GetPlayerMoney(giveplayerid) <= 999) {
               SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you a Tec9 weapon. You cannot afford $1000",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) cannot afford that weapon",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);

			   return 1;
			}
			   GivePlayerWeapon(giveplayerid,32,500);
			   GivePlayerMoney(giveplayerid, -1000);
			   GivePlayerMoney(playerid,1500);
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Purchased_|");
			   format(string, sizeof(string), "%s(%d) Has sold you a Tec9 weapon with 500 Ammo for $1000",workername,playerid);
               SendClientMessage(giveplayerid, 0x00C7FFAA, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sold_|");
               format(string, sizeof(string), "%s(%d) Has purchased a Tec9 weapon from you. You receive a $1500 bonus",playername,giveplayerid);
               SendClientMessage(playerid, 0x00C7FFAA, string);
               oscore = GetPlayerScore(playerid);
   			   SetPlayerScore(playerid, oscore +1);


			}
			else if(strcmp(x_nr,"3",true) == 0)
	 		{
               if(GetPlayerMoney(giveplayerid) <= 3499) {
               SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you a Sawnoff Shotgun weapon. You cannot afford $3500",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) cannot afford that weapon",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);

			   return 1;
			}
			   GivePlayerWeapon(giveplayerid,26,30);
			   GivePlayerMoney(giveplayerid, -3500);
			   GivePlayerMoney(playerid,1500);
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Purchased_|");
			   format(string, sizeof(string), "%s(%d) Has sold you a Sawnoff Shotgun weapon with 30 Ammo for $3500",workername,playerid);
               SendClientMessage(giveplayerid, 0x00C7FFAA, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sold_|");
               format(string, sizeof(string), "%s(%d) Has purchased a Sawnoff Shotgun weapon from you. You receive a $1500 bonus",playername,giveplayerid);
               SendClientMessage(playerid, 0x00C7FFAA, string);
               oscore = GetPlayerScore(playerid);
   			   SetPlayerScore(playerid, oscore +1);

			}
			else if(strcmp(x_nr,"4",true) == 0)
			{
               if(GetPlayerMoney(giveplayerid) <= 14999) {
               SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you a Sniper Rifle weapon. You cannot afford $15000",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) cannot afford that weapon",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);

			   return 1;
			}
			   GivePlayerWeapon(giveplayerid,34,30);
			   GivePlayerMoney(giveplayerid, -15000);
			   GivePlayerMoney(playerid,1500);
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Purchased_|");
			   format(string, sizeof(string), "%s(%d) Has sold you a Sniper Rifle weapon with 30 Ammo for $15000",workername,playerid);
               SendClientMessage(giveplayerid, 0x00C7FFAA, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sold_|");
               format(string, sizeof(string), "%s(%d) Has purchased a Sniper Rifle weapon from you. You receive a $1500 bonus",playername,giveplayerid);
               SendClientMessage(playerid, 0x00C7FFAA, string);
               oscore = GetPlayerScore(playerid);
   			   SetPlayerScore(playerid, oscore +1);

			}
			else if(strcmp(x_nr,"5",true) == 0)
			{
               if(GetPlayerMoney(giveplayerid) <= 7999) {
               SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you a AK47 weapon. You cannot afford $8000",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) cannot afford that weapon",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);

			   return 1;
			}
			   GivePlayerWeapon(giveplayerid,30,200);
			   GivePlayerMoney(giveplayerid, -8000);
			   GivePlayerMoney(playerid,1500);
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Purchased_|");
			   format(string, sizeof(string), "%s(%d) Has sold you a AK47 weapon with 200 Ammo for $8000",workername,playerid);
               SendClientMessage(giveplayerid, 0x00C7FFAA, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sold_|");
               format(string, sizeof(string), "%s(%d) Has purchased a AK47 weapon from you. You receive a $1500 bonus",playername,giveplayerid);
               SendClientMessage(playerid, 0x00C7FFAA, string);
               oscore = GetPlayerScore(playerid);
   			   SetPlayerScore(playerid, oscore +1);

			}
			else if(strcmp(x_nr,"6",true) == 0)
			{
               if(GetPlayerMoney(giveplayerid) <= 499) {
               SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you Armor. You cannot afford $500",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) cannot afford Armor",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);

			   return 1;
			}
			   SetPlayerArmour(giveplayerid, 100);
			   GivePlayerMoney(giveplayerid, -500);
			   GivePlayerMoney(playerid,1500);
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Purchased_|");
			   format(string, sizeof(string), "%s(%d) Has sold you Armor for $500",workername,playerid);
               SendClientMessage(giveplayerid, 0x00C7FFAA, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sold_|");
               format(string, sizeof(string), "%s(%d) Has purchased Armor from you. You receive a $1500 bonus",playername,giveplayerid);
               SendClientMessage(playerid, 0x00C7FFAA, string);
               oscore = GetPlayerScore(playerid);
   			   SetPlayerScore(playerid, oscore +1);

			}
            else if(strcmp(x_nr,"7",true) == 0)
			{
               if(GetPlayerMoney(giveplayerid) <= 3499) {
               SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you 3 Blocks of C4. You cannot afford $3500",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) cannot afford 3 Blocks of C4",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);

			   return 1;
			}
			   if(HasC4[giveplayerid] == 1) {
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
			   format(string, sizeof(string), "%s(%d) Has tried to sell you 3 Blocks of C4. You already have enough C4",workername,playerid);
               SendClientMessage(giveplayerid, COLOR_ERROR, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sale Failed_|");
               format(string, sizeof(string), "%s(%d) already has enough C4",playername,giveplayerid);
               SendClientMessage(playerid, COLOR_ERROR, string);
			   return 1;
			   }
			   HasC4[giveplayerid] =1;
			   GivePlayerMoney(giveplayerid, -3500);
			   GivePlayerMoney(playerid,1500);
			   SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Weapon Purchased_|");
			   format(string, sizeof(string), "%s(%d) Has sold you 3 Blocks of C4 for $3500",workername,playerid);
               SendClientMessage(giveplayerid, 0x00C7FFAA, string);
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Sold_|");
               format(string, sizeof(string), "%s(%d) Has purchased 3 Blocks of C4 from you. You receive a $1500 bonus",playername,giveplayerid);
               SendClientMessage(playerid, 0x00C7FFAA, string);
               oscore = GetPlayerScore(playerid);
   			   SetPlayerScore(playerid, oscore +1);

			}
			else
			{
			SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellweapon (id) (WEAPON.No)");
			return 1;
			}
	    }
	    return 1;
	}



     if(strcmp(cmd, "/sellfood", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
	 if(gTeam[playerid] != TEAM_BISTRO) {
	 SendClientMessage(playerid, COLOR_ERROR, "Only food delivery workers can sell food");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
	 if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
     if(cuffed[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
     return 1;
     }
     if(sellfoodrecently[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
     return 1;
     }
	 tmp = strtok(cmdtext, idx);
     if(!strlen(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellfood (id)");
     return 1;
     }
     giveplayerid = strval(tmp);
     if(!IsNumeric(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellfood (id) ID Must be a number");
     return 1;
     }
     if(!IsPlayerConnected(giveplayerid)) {
     format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     new workername[24];
     new playername[24];
     GetPlayerName(playerid,workername, 24);
     GetPlayerName(giveplayerid, playername, 24);
     if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 15) {
     format(string, sizeof(string), "%s(%d) Is not close enough. You cannot sell food to that player",playername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(gTeam[giveplayerid] == TEAM_BISTRO) {
     SendClientMessage(playerid, COLOR_ERROR, "You cannot sell food to another food delivery worker");
     return 1;
     }
     if(Wantsfood[giveplayerid] == 0) {
     format(string, sizeof(string), "%s(%d) Has not asked for a food delivery",playername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     new Float:phealth;
     GetPlayerHealth(giveplayerid,phealth);
     SetPlayerHealth(giveplayerid, phealth+10);
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Food Sold_|");
     format(string, sizeof(string), "You have sold food to %s(%d) You receive a $500 bonus",playername,giveplayerid);
     SendClientMessage(playerid,0x00C7FFAA,string);
     SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Food Purchased_|");
     format(string, sizeof(string), "Food Delivery Worker %s(%d) has sold you food for $25",workername,playerid);
     SendClientMessage(giveplayerid,0x00C7FFAA,string);
     Wantsfood[giveplayerid] =0;
     sellfoodrecently[playerid] =1;
     GivePlayerMoney(giveplayerid,-25);
     GivePlayerMoney(playerid,500);
     oscore = GetPlayerScore(playerid);
     SetPlayerScore(playerid, oscore +1);
     format(string, sizeof(string), "%s(%d) Has sold food to %s(%d)",workername,playerid,playername,giveplayerid);
     printf("%s", string);
     return 1;
     }

     if(strcmp(cmd, "/sellbadfood", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
	 if(gTeam[playerid] != TEAM_BISTRO) {
	 SendClientMessage(playerid, COLOR_ERROR, "Only food delivery workers can sell food");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
	 if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
     if(cuffed[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
     return 1;
     }
     if(sellfoodrecently[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
     return 1;
     }
	 tmp = strtok(cmdtext, idx);
     if(!strlen(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellbadfood (id)");
     return 1;
     }
     giveplayerid = strval(tmp);
     if(!IsNumeric(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellbadfood (id) ID Must be a number");
     return 1;
     }
     if(!IsPlayerConnected(giveplayerid)) {
     format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     new workername[24];
     new playername[24];
     GetPlayerName(playerid,workername, 24);
     GetPlayerName(giveplayerid, playername, 24);
     if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 15) {
     format(string, sizeof(string), "%s(%d) Is not close enough. You cannot sell bad food to that player",playername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(gTeam[giveplayerid] == TEAM_BISTRO) {
     SendClientMessage(playerid, COLOR_ERROR, "You cannot sell bad food to another food delivery worker");
     return 1;
     }
     if(Wantsfood[giveplayerid] == 0) {
     format(string, sizeof(string), "%s(%d) Has not asked for a food delivery",playername,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     
     format(string, sizeof(string), "%s(%d) Has been infected with Salmonella",playername,giveplayerid);
     SendClientMessageToAll(0x00C7FFAA, string);
     printf("%s", string);
     Salmonella[giveplayerid] =1;
     SendClientMessage(playerid, 0xA9A9A9AA, "|_Bad Food Sold_|");
     format(string, sizeof(string), "You have sold bad food. You have infected %s(%d) With Salmonella",playername,giveplayerid);
     SendClientMessage(playerid, 0x00C7FFAA, string);
     SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Bad Food Purchased_|");
     format(string, sizeof(string), "%s(%d) Has sold you bad food. You have been infected with Salmonella",workername,playerid);
     SendClientMessage(giveplayerid, 0xD2691EAA, string);
     Wantsfood[giveplayerid] =0;
     sellfoodrecently[playerid] =1;
     GivePlayerMoney(giveplayerid,-25);
     oscore = GetPlayerScore(playerid);
   	 SetPlayerScore(playerid, oscore +1);
     format(string, sizeof(string), "%s(%d) Has sold bad food to %s(%d)",workername,playerid,playername,giveplayerid);
     printf("%s", string);
     
     return 1;
     }




     if(strcmp(cmd, "/taze", true) == 0) {
	 if(IsSpawned[playerid] == 0) {
	 SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
     return 1;
     }
	 if(gTeam[playerid] >= 3) {
	 SendClientMessage(playerid, COLOR_ERROR, "Only Law Enforcement can use this command");
     return 1;
     }
     if(InDerby[playerid] == 1) {
     SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
     return 1;
     }
	 if(Jailed[playerid] == 1) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
     return 1;
     }
	 tmp = strtok(cmdtext, idx);
     if(!strlen(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /taze (id)");
     return 1;
     }
     giveplayerid = strval(tmp);
     if(!IsNumeric(tmp)) {
     SendClientMessage(playerid, COLOR_ERROR, "USAGE: /taze (id) ID Must be a number");
     return 1;
     }
     if(!IsPlayerConnected(giveplayerid)) {
     format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(gTeam[giveplayerid] <= 2) {
     SendClientMessage(playerid, COLOR_ERROR, "You cannot taze another Law Enforcement agent");
     return 1;
     }
     new oname[24];
     new pname[24];
     GetPlayerName(playerid,oname, 24);
     GetPlayerName(giveplayerid, pname, 24);
     if(GetPlayerWantedLevel(giveplayerid) <= 3) {
	 format(string, sizeof(string), "%s(%d) Does not have a warrant. You cannot use your tazer on this player",pname,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 10) {
     format(string, sizeof(string), "%s(%d) Is not close enough to taze",pname,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(cuffed[giveplayerid] == 1) {
     format(string, sizeof(string), "%s(%d) Is in handcuffs and is restrained. You cannot taze a handcuffed player",pname, giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
     if(IsPlayerInAnyVehicle(giveplayerid)) {
     format(string, sizeof(string), "%s(%d) Is in a vehicle. Get the player out the vehicle then use your tazer",pname,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
	 if(IsPlayerInAnyVehicle(playerid)) {
	 SendClientMessage(playerid, COLOR_ERROR, "You cannot taze a player from inside a vehicle");
     return 1;
     }
	 if(Tazed[giveplayerid] == 1) {
	 format(string, sizeof(string), "%s(%d) Is being tazed right now. You cannot taze a player while the player is being tazed",pname,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
	 }
	 else{
	 
     Tazed[giveplayerid] =1;
     new tazername[30];
     GetPlayerName(playerid,tazername,30);
     format(string, sizeof(string), "Law Enforcement agent %s(%d) Has tazed suspect %s(%d)",tazername,playerid,pname,giveplayerid);
     SendClientMessageToAll(0x00C7FFAA, string);
     SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Law Enforcement Action_|");
     format(string, sizeof(string), "Officer %s(%d) Has tazed you", oname,playerid);
     SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
     ApplyAnimation(giveplayerid,"PED","BIKE_fall_off",4.1,0,1,1,1,1);
     SetTimer("Tazingtime",3000,0);
     }
     return 1;
     }
     
     
     
    if (strcmp("/cm", cmdtext, true, 3) == 0)
    {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(HasLawEnforcementRadio[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You do not have a Law Enforcement radio");
    return 1;
    }
    if(LawEnforcementRadio[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "Your Law Enforcement radio is off. Turn it on with /radon before using it");
    return 1;
    }
    if(strlen(cmdtext) <= 4) {
    SendClientMessage(playerid,COLOR_ERROR,"USAGE: /cm yourmessagehere");
    return 1;
    }
	else{
	new output[255];
	new pname[24];
	GetPlayerName(playerid, pname, 24);
    strmid(output,cmdtext,3,strlen(cmdtext));
    format(string, sizeof(string), "COP MESSAGE: %s(%d) %s",pname,playerid,output);
    printf("%s", string);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "COP MESSAGE: %s(%d) %s",pname,playerid,output);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    }
    return 1;
    }
	 
	if(strcmp(cmd, "/pu", true) == 0) {
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
	if(gTeam[playerid] >= 3) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Law Enforcemnt officer");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /pu (id)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /pu (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot ask yourself to pull over");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);

    if(gTeam[giveplayerid] <= 2) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot ask another Law Enforcement agent to pull over");
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 25) {
	format(string, sizeof(string), "%s(%d) is not close enough you cannot ask him to pull over",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_ONFOOT) {
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Law Enforcement Action_|");
    format(string, sizeof(string), "Officer %s(%d) Has asked you to freeze and disarm", oname,playerid);
    SendClientMessage(giveplayerid, COLOR_ROYALBLUE, string);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Law Enforcement Action Taken_|");
    format(string, sizeof(string), "%s(%d) is not in any veichle. You have asked that player to freeze and disarm", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_PASSENGER) {
	format(string, sizeof(string), "%s(%d) is a passenger in the vehicle. Ask the driver to stop", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_DRIVER) {
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Law Enforcement Action_|");
    format(string, sizeof(string), "Officer %s(%d): Has asked you to stop your vehicle and get out", oname,playerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Law Enforcement Action Taken_|");
    format(string, sizeof(string), "You have asked %s(%d) to stop the vehicle and get out", pname,giveplayerid);
    SendClientMessage(playerid,COLOR_DODGERBLUE, string);
    }
    return 1;
    }
    
    if(strcmp(cmd, "/bk", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    
	if(gTeam[playerid] >= 3) {
	SendClientMessage(playerid, COLOR_ERROR, "You are not a Law Enforcement officer");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
	if(ReqBkRecent[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You have asked for backup recently. Please wait before asking for backup again");
    return 1;
    }
    if(LawEnforcementRadio[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "Your Police Radio is off. Turn it on with /radon before requesting backup");
    return 1;
    }
	
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(IsPlayerConnected(playerid)) {
    new oname[24];
    new current_zone;
    GetPlayerName(playerid,oname, 24);
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "ASSISTANCE REQUIRED: Officer %s(%d) Is requesting backup. Location: %s",oname,playerid,zones[current_zone][zone_name]);
    SendClientMessage(i, COLOR_ROYALBLUE, string);
    format(string, sizeof(string), "All units respond. Provide backup to officer %s(%d) Location: %s",oname,playerid,zones[current_zone][zone_name]);
    SendClientMessage(i, COLOR_ROYALBLUE, string);
    }
    }

    ReqBk[playerid] =1;
    SetPlayerColor(playerid,COLOR_PURPLE);
    SetTimer("CopBackUpColour", 10000, 0);
    ReqBkRecent[playerid] =1;
    }
    return 1;
    }
    
    if(strcmp(cmd, "/ar", true) == 0) {

    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_COP && gTeam[playerid] != TEAM_ARMY && gTeam[playerid] != TEAM_BOUNTY) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Law Enforcement officer ");
    return 1;
    }

    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /ar (id)");
    TextDrawHideForPlayer(playerid,txtTypeSkill1);
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /ar (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(GetPlayerWantedLevel(giveplayerid) <= 3) {
	format(string, sizeof(string), "%s(%d) Does not have a warrant. You cannot arrest a player without a warrant",pname,giveplayerid);
	SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot arrest a suspect if you are in a car");
    return 1;
    }
    if(IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. Get the suspect out before making the arrest",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 4) {
    format(string, sizeof(string), "%s(%d) Is too far away. You cannot arrest that player",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(IsSpawned[giveplayerid] == 0) {
	format(string, sizeof(string), "%s(%d) Is dead. You cannot arrest a dead body",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    SetPlayerVirtualWorld(giveplayerid,0);
    if(GetPlayerWantedLevel(playerid) >=1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command if you are wanted by the police");
    return 1;
    }
    if(gTeam[playerid] == TEAM_BOUNTY && EscapedConvict[giveplayerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"That player is not on your bounty list. Type /bounty for details");
    return 1;
    }
    if(giveplayerid == playerid) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot arrest yourself");
    return 1;
    }
    if(gTeam[playerid] == TEAM_BOUNTY && EscapedConvict[giveplayerid] == 1 && GetPlayerWantedLevel(giveplayerid) >=10) {
    SetPlayerInterior(giveplayerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(giveplayerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, AlcatrazArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Bounty Hunter %s(%d) has re-captured Escaped Convict %s(%d) and has sent the suspect to Alcatraz",oname,playerid,pname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Busted By A Bounty Hunter_|");
    format(string, sizeof(string), "You have been sent to Alcatraz by Bounty Hunter %s(%d)",oname,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have sent escaped prisoner %s(%d) to Alcatraz - you receive a $5000 re-capture bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    format(string, sizeof(string), "Escaped Convict %s(%d) has been re-arrested and sent to Alcatraz by Bounty Hunter %s(%d)",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,5000);
	Jailed[giveplayerid] =1;
	InAlcatraz[giveplayerid] =1;
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =320;
	JailTimeServed[giveplayerid] =0;
	EscapedConvict[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
  
    if(EscapedConvict[giveplayerid] == 1 && GetPlayerWantedLevel(giveplayerid) >=10) {
    SetPlayerInterior(giveplayerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(giveplayerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, AlcatrazArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Escaped Convict %s(%d) has been re-arrested and sent to Alcatraz by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Arrested_|");
    format(string, sizeof(string), "You have been sent to Alcatraz by Officer %s(%d)",oname,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have sent escaped prisoner %s(%d) to Alcatraz - you receive a $4000 re-capture bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    format(string, sizeof(string), "Escaped Convict %s(%d) has been re-arrested and sent to Alcatraz by Officer %s(%d)",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,4000);
	Jailed[giveplayerid] =1;
	InAlcatraz[giveplayerid] =1;
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =320;
	JailTimeServed[giveplayerid] =0;
	EscapedConvict[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) >=4 && GetPlayerWantedLevel(giveplayerid) <=5) {
    SetPlayerInterior(giveplayerid,3);
    new rnd;
    rnd = random(sizeof (ArrestedSpawn));
    SetPlayerPos(giveplayerid, ArrestedSpawn[rnd][0], ArrestedSpawn[rnd][1], ArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, ArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Wanted suspect %s(%d) has been arrested by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Arrested_|");
    format(string, sizeof(string), "You were Arrested by Officer %s(%d)",oname,playerid);
    SetPlayerSpecialAction(giveplayerid,SPECIAL_ACTION_HANDSUP);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from jail or a Police Officer/Jail Turnkey can release you early");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If jail life sucks for you... Why not pay the /bail");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have arrested %s(%d) - you receive a $4500 bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    GivePlayerMoney(playerid,4500);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    format(string, sizeof(string), "Wanted suspect %s(%d) has been arrested by Officer %s(%d)",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,1500);
	Jailed[giveplayerid] =1;
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =180;
	JailTimeServed[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) >=6 && GetPlayerWantedLevel(giveplayerid) <=8) {
    SetPlayerInterior(giveplayerid,3);
    new rnd;
    rnd = random(sizeof (ArrestedSpawn));
    SetPlayerPos(giveplayerid, ArrestedSpawn[rnd][0], ArrestedSpawn[rnd][1], ArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, ArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Wanted suspect %s(%d) has been arrested by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Arrested_|");
    format(string, sizeof(string), "You were Arrested by Officer %s(%d)",oname,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from jail or a Police Officer/Jail Turnkey can release you early");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If jail life sucks for you... Why not try /escape");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have arrested %s(%d) - you receive a $2000 bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    format(string, sizeof(string), "Wanted suspect %s(%d) has been arrested by Officer %s(%d)",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,2000);
	Jailed[giveplayerid] =1;
	
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =240;
	JailTimeServed[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
	return 1;
    }

    if(GetPlayerWantedLevel(giveplayerid) == 9) {
    SetPlayerInterior(giveplayerid,3);
    new rnd;
    rnd = random(sizeof (ArrestedSpawn));
    SetPlayerPos(giveplayerid, ArrestedSpawn[rnd][0], ArrestedSpawn[rnd][1], ArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, ArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Wanted suspect %s(%d) has been arrested by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Arrested_|");
    format(string, sizeof(string), "You were Arrested by Officer %s(%d)",oname,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from jail or a Police Officer/Jail Turnkey can release you early");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If jail life sucks for you... Why not try /escape");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have arrested %s(%d) - you receive a $2500 bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    format(string, sizeof(string), "Wanted suspect %s(%d) has been arrested by Officer %s(%d)",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,2500);
	Jailed[giveplayerid] =1;
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =300;
	JailTimeServed[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) >=10 && GetPlayerWantedLevel(giveplayerid) <=14) {
    SetPlayerInterior(giveplayerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(giveplayerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, AlcatrazArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has been sent to Alcatraz by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Arrested_|");
    format(string, sizeof(string), "You have been sent to Alcatraz by Officer %s(%d)",oname,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have sent Most Wanted suspect %s(%d) to Alcatraz - you receive a $3000 bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has been arrested and sent to Alcatraz by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,3000);
	Jailed[giveplayerid] =1;
	InAlcatraz[giveplayerid] =1;
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =380;
	JailTimeServed[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) >=15 && GetPlayerWantedLevel(giveplayerid) <=24) {
    SetPlayerInterior(giveplayerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(giveplayerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, AlcatrazArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has been sent to Alcatraz by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Arrested_|");
    format(string, sizeof(string), "You have been sent to Alcatraz by Officer %s(%d)",oname,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have sent Most Wanted suspect %s(%d) to Alcatraz - you receive a $3500 bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has been arrested and sent to Alcatraz by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,3500);
	Jailed[giveplayerid] =1;
	InAlcatraz[giveplayerid] =1;
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =420;
	JailTimeServed[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) >=25) {
    SetPlayerInterior(giveplayerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(giveplayerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(giveplayerid, AlcatrazArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has been sent to Alcatraz by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_You Have Been Arrested_|");
    format(string, sizeof(string), "You have been sent to Alcatraz by Officer %s(%d)",oname,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(giveplayerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Arrested_|");
    format(string, sizeof(string), "You have sent Most Wanted suspect %s(%d) to Alcatraz - you receive a $4000 bonus",pname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    GameTextForPlayer(playerid,"~b~Suspect Arrested",5000,3);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has been arrested and sent to Alcatraz by Officer %s(%d) ",pname,giveplayerid,oname,playerid);
    printf("%s", string);
    SendClientMessage(giveplayerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    GivePlayerMoney(playerid,4000);
	Jailed[giveplayerid] =1;
	InAlcatraz[giveplayerid] =1;
	StoleCopCarRecent[giveplayerid] =0;
	triedtoescaperecent[giveplayerid] =1;
	ResetPlayerWeapons(giveplayerid);
	JailTime[giveplayerid] =520;
	JailTimeServed[giveplayerid] =0;
	SetPlayerWantedLevel(giveplayerid,0);
	oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +2);
    }
    return 1;
    }
    
    if(strcmp(cmd, "/fine", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] >= 3) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not Law Enforcement");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /fine (id)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /fine (id) ID Must be a number");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(GetPlayerWantedLevel(giveplayerid) == 0) {
	format(string, sizeof(string), "%s(%d) Is innocent. You cannot issue a fine",pname,giveplayerid);
	SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 8) {
    format(string, sizeof(string), "%s(%d) Is too far away. You cannot issue a fine",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) == 1) {
    format(string, sizeof(string), "Officer %s(%d) has fined you $500. Your wanted level has been reduced ",oname,playerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    format(string, sizeof(string), "~w~You have been fined~n~ ~b~$500");
    GameTextForPlayer(giveplayerid, string,5000, 0);
    new plwl = GetPlayerWantedLevel(giveplayerid);
    SetPlayerWantedLevel(giveplayerid,plwl -1);
    GivePlayerMoney(giveplayerid, -500);
    oscore = GetPlayerScore(playerid);
    SetPlayerScore(playerid, oscore +1);
    format(string, sizeof(string), "You have issued a fine to %s(%d) and you receive a collection bonus of $125",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_DODGERBLUE, string);
    GivePlayerMoney(playerid, 125);
    oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) == 2) {
    format(string, sizeof(string), "Officer %s(%d) has fined you $1000. Your wanted level has been reduced ",oname,playerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    format(string, sizeof(string), "~w~You have been fined~n~ ~b~$1000");
    GameTextForPlayer(giveplayerid, string,5000, 0);
    new plwl = GetPlayerWantedLevel(giveplayerid);
    SetPlayerWantedLevel(giveplayerid,plwl -2);
    GivePlayerMoney(giveplayerid, -1000);
    oscore = GetPlayerScore(playerid);
    SetPlayerScore(playerid, oscore +1);
    format(string, sizeof(string), "You have issued a fine to %s(%d) and you receive a collection bonus of $250",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_DODGERBLUE, string);
    GivePlayerMoney(playerid, 250);
    oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) == 3) {
    format(string, sizeof(string), "Officer %s(%d) has fined you $2000. Your wanted level has been reduced ",oname,playerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    format(string, sizeof(string), "~w~You have been fined~n~ ~b~$2000");
    GameTextForPlayer(giveplayerid, string,5000, 0);
    new plwl = GetPlayerWantedLevel(giveplayerid);
    SetPlayerWantedLevel(giveplayerid,plwl -3);
    GivePlayerMoney(giveplayerid, -2000);
    oscore = GetPlayerScore(playerid);
    SetPlayerScore(playerid, oscore +1);
    format(string, sizeof(string), "You have issued a fine to %s(%d) and you receive a collection bonus of $500",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_DODGERBLUE, string);
    GivePlayerMoney(playerid, 500);
    oscore = GetPlayerScore(playerid);
   	SetPlayerScore(playerid, oscore +1);
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) >= 4) {
    format(string, sizeof(string), "%s(%d) Has a warrant. You cannot issue a fine. Take the suspect into custody ",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR, string);
    }
    return 1;
    }
    
    

	if(strcmp(cmd, "/vc", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] >= 3) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Law Enforcement officer ");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(LawEnforcementRadio[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "Your Police Radio is off. Turn it on with /radon before reporting visual contact");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /vc (id) ID Must be a number");
    return 1;
    }
	if(!strlen(tmp)) {
	SendClientMessage(playerid, COLOR_ERROR, "USAGE: /vc (id)");
	return 1;
	}
	giveplayerid = strval(tmp);
	if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }

    new officername[24];
    new criminalname[24];
    GetPlayerName(playerid,officername, 24);
	GetPlayerName(giveplayerid,criminalname, 24);
	if(gTeam[giveplayerid] <= 2) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot report other Law Enforcement agents");
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) == 0) {
    format(string, sizeof(string), "%s(%d) Is innocent. You can only report visual contact with wanted suspects (Yellow/Orange/Red)",criminalname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 30) {
    format(string, sizeof(string), "%s(%d) Is too far away. You cannot report visual contact",criminalname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot report visual contact with a prisoner",criminalname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
	if(ReportedRecent[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Has been reported recently. Please wait before reporting visual contact",criminalname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Police Visual Contact_|");
    format(string, sizeof(string), "Officer %s(%d) Has reported visual contact with you",officername,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    copshavevc[giveplayerid] =60;
    new current_zone;
    current_zone = player_zone[giveplayerid];
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (VISUAL CONTACT) Officer %s(%d) has visual contact with suspect %s(%d)- Location: %s",officername,playerid,criminalname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    format(string, sizeof(string), "DISPATCH: (ALL UNITS) Get into the area and stop suspect %s(%d)",criminalname,giveplayerid);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    
	return 1;
    }

  
    if(strcmp(cmd, "/rp", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] >= 3) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Law Enforcement officer ");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(LawEnforcementRadio[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "Your Police Radio is off. Turn it on with /radon before reporting a suspect");
    return 1;
    }
    
    
    tmp = strtok(cmdtext, idx);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rp (id) ID Must be a number");
    return 1;
    }

	if(!strlen(tmp)) {
	SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rp (id) [reason]");
	return 1;
	}
	giveplayerid = strval(tmp);

    new output[255];
    strmid(output,cmdtext,6,strlen(cmdtext));
    
 	
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(gTeam[giveplayerid] <= 2) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot report other Law Enforcement agents");
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot report a prisoner", pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
	if(ReportedRecent[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Has been reported recently. Please wait before reporting criminal activity", pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }

    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 15) {
    format(string, sizeof(string), "%s(%d) Is too far away. You cannot report criminal activity",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }

    if(GetPlayerWantedLevel(giveplayerid) <= 9) {
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "Officer %s(%d) has reported suspect %s(%d) Reason: (%s)",oname,playerid,pname,giveplayerid,output);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    for(new j=0;j<MAX_PLAYERS;j++)
	{
    if(PlayerAdminLevel[j] == 1337) {
    format(string, sizeof(string), "(POLICE REPORT) Officer %s(%d) has reported suspect %s(%d) Reason: (%s)",oname,playerid,pname,giveplayerid,output);
    SendClientMessage(j,0xFF7F50AA,string);
    }
    }
    printf("(POLICE REPORT) Officer %s(%d) has reported suspect %s(%d) Reason: (%s)",oname,playerid,pname,giveplayerid,output);
    format(string, sizeof(string), "**(POLICE REPORT)** Officer %s(%d) has reported suspect %s(%d) Reason: (%s)",oname,playerid,pname,giveplayerid,output);
    ircSay(EchoConnection, EchoChan,string);
    new plwl = GetPlayerWantedLevel(giveplayerid);
    new pcol = GetPlayerColor(giveplayerid);
    SetPlayerWantedLevel(giveplayerid, plwl +1);
    format(string, sizeof(string), "Officer %s(%d) has reported you. Reason: (%s)",oname,playerid,output);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE,string);
    plwl = GetPlayerWantedLevel(giveplayerid);
    format(string, sizeof(string), "Wanted Level: (%d) ",plwl);
    SendClientMessage(giveplayerid,pcol,string);
    ReportedRecent[giveplayerid] =1;
    commitedcrimerecently[giveplayerid] +=120;
    }
	else{
	format(string, sizeof(string), "%s(%d) Already has a high wanted level. You cannot report criminal activity",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    }
	return 1;
    }



    if(strcmp(cmd, "/911", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(gTeam[playerid] <= 2) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Law Enforcement officer. You cannot call /911 ");
    return 1;
    }
    if (!GetPlayersInTeam(TEAM_COP) && !GetPlayersInTeam(TEAM_ARMY)) {
    SendClientMessage(playerid,COLOR_ERROR,"There are no Police officers in the area");
    return 1;
    }
    
    new output[70];
    strmid(output,cmdtext,5,strlen(cmdtext));
    if(strlen(cmdtext) <= 4) {
    SendClientMessage(playerid, 0xA9A9A9AA, "USAGE: /911 (message)");
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Dialed 911_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have dialed 911 - Please wait for Police assistance");
    new callername[30];
    GetPlayerName(playerid,callername, 30);
    new current_zone;
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (911) %s(%d) has called 911",callername,playerid);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    format(string, sizeof(string), "%s(%d) Said: ( %s )",callername,playerid,output);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    format(string, sizeof(string), "All units in the area please respond. Location: %s",zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    
	return 1;
    }


	
    if(strcmp(cmd, "/bankstate", true) == 0) {
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
   	if(!IsPlayerInCheckpoint(playerid)) {
   	SendClientMessage(playerid,0xD2691EAA,"You are not in any bank checkpoint");
    return 1;
    }
    if(!udb_Exists(PlayerName(playerid))) {
   	SendClientMessage(playerid,0xD2691EAA,"You do not have an account on this server. Type /register (your password)");
    return 1;
    }
    if(!PLAYERLIST_authed[playerid]) {
    SendClientMessage(playerid,0xD2691EAA,"You are not logged in! Type /login (your password)");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && !IsPlayerInAnyVehicle(playerid))
	{
    if(getCheckpointType(playerid) >= 27 && getCheckpointType(playerid) <= 30 || getCheckpointType(playerid) == 33 )
    {
		
        new bcash = dUserINT(PlayerName(playerid)).("bankcash");
        new pname[30];
        GetPlayerName(playerid,pname,30);
        format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
        SendClientMessage(playerid, 0xA9A9A9AA, string);
        SendClientMessage(playerid, 0x808080AA, "|** Mode: Account Statement");
		format(string, sizeof(string), "|** Account Holder: %s",pname);
		SendClientMessage(playerid,0x808080AA,string);
		SendClientMessage(playerid, 0x808080AA, "|** Branch: Las Venturas");
		format(string, sizeof(string), "|** Current Balance: $%d",bcash);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** Bank Opening Hours: 8:00 - 21:00");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** 24h ATM machines. /atmloc");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|_|-------------------------------------------|_|");
		SendClientMessage(playerid,0xA9A9A9AA,string);
    }
    else{
    SendClientMessage(playerid,0xD2691EAA,"You are not in any bank or ATM checkpoint");
    }
    }
    return 1;
    }

	if (strcmp("/trashdelivery", cmdtext, true, 10) == 0)
	{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(Jailed[playerid] ==1) {
    	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
	    if(gTeam[playerid] == 1 || gTeam[playerid] == 2 || gTeam[playerid] == 3 || gTeam[playerid] == 5 || gTeam[playerid] == 6 || gTeam[playerid] == 7 || gTeam[playerid] == 8) {
		SendClientMessage(playerid,COLOR_ERROR,"You cannot collect any trash");
		return 1;
	}
		if(!IsPlayerInAnyVehicle(playerid)) {
		SendClientMessage(playerid,COLOR_ERROR,"You can only start a Trash collecting mission while in a TrashMaster truck");
		return 1;
	}
	    if(GetPlayerWantedLevel(playerid) >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You must be innocent before you can work for the city");
		return 1;
	}
	    if(OnDelMission[playerid] == 1337) {
		SendClientMessage(playerid,COLOR_ERROR,"You are already doing a delivery mission");
		return 1;
	}
	    new vehicleid = GetPlayerVehicleID(playerid);
    	if(GetVehicleModel(vehicleid) != 408) {
    	SendClientMessage(playerid,COLOR_ERROR,"You can only start a Trash collecting mission while in a TrashMaster truck");
		return 1;
	}
		new vidy = GetPlayerVehicleID(playerid);
	    if(GetVehicleModel(vidy) == 408) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started the Trash Delivery mission. Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"Your current target location is marked with a RED checkpoint on your mini-map");
		SendClientMessage(playerid,0xADD8E6AA,"You will be paid when you make your last drop at the trash yard in San Fierro (Mnt Chilliad)");
		SendClientMessage(playerid,0xADD8E6AA,"The amount that the city pay you depends on how long it takes you to do the round. So hurry");
		SendClientMessage(playerid,0xADD8E6AA,"Get to the first pick up at Well Stacked Pizza Co in Old Las Venturas Strip");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 47;
    	TrashDeliveryTime[playerid] =0;
    	TrashDeliveryEarnings[playerid] =80000;
        SetPlayerCheckpoint(playerid,checkpoints[47][0],checkpoints[47][1],checkpoints[47][2],checkpoints[47][3]); // no 1
		OnDelMission[playerid] = 1337;
		}
		return 1;
	}


        if (strcmp("/atmcash", cmdtext, true, 10) == 0)
		{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(!IsPlayerInAnyVehicle(playerid)) {
    	SendClientMessage(playerid, COLOR_ERROR, "You have to be in a Securicar vehicle to use this command");
    	return 1;
    	}
    	new carrid = GetPlayerVehicleID(playerid);
    	if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(carrid) != 428) {
    	SendClientMessage(playerid,COLOR_ERROR,"You have to be in a Securicar vehicle to use this command");
		return 1;
	}
    	
        if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(carrid) == 428) {
    	SendClientMessage(playerid, COLOR_GREY, "Please wait.... Loading Data....");
    	SendClientMessage(playerid,0x808080AA,"|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid,0x808080AA,"|** ATM Network Maintenance Menu");
		SendClientMessage(playerid,0x808080AA,"|** Current Cash Totals");
		format(string, sizeof(string), "|**ATM 1 (WhiteWood Estates) Current Total: $%d",atmcash1);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|**ATM 2 (Roca Escalante) Current Total: $%d",atmcash2);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|**ATM 3 (24/7 StarFish Casino) Current Total: $%d",atmcash3);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|**ATM 4 (South LV Come-Alot) Current Total: $%d",atmcash4);
		SendClientMessage(playerid,0x808080AA,string);
		new atmcashtotal =0;
		atmcashtotal = atmcash1 +atmcash2 +atmcash3 +atmcash4;
		format(string, sizeof(string), "|**Grand Total: $%d",atmcashtotal);
		SendClientMessage(playerid,0x808080AA,string);
		SendClientMessage(playerid,0x808080AA,"|_|---------------------------------------------|_|");
		atmcashtotal =0;
		}
    	return 1;
    	}
    	
    	
    	if (!strcmp(cmdtext, "/models", true))
    {
        new mt[212], hm, str[45];
        for (new v = 1; v <= 700; v ++)
            if (GetVehicleModel(v)) mt[GetVehicleModel(v)-400] ++;
        for (new et2; et2 < sizeof(mt); et2 ++) if (mt[et2]) hm ++;
        format(str, 45, "This server has %d different vehicle models.", hm);
        SendClientMessage(playerid, 0xFFFFFFAA, str);
        return true;
    }

        if (!strcmp(cmdtext, "/eee", true))
    {
        new Float:X,Float:Y,Float:Z,Float:A;
                GetVehiclePos(bigassplane,X,Y,Z);
                GetVehicleZAngle(bigassplane,A);
                X+=(5*floatsin(-floatsub(A,45.0),degrees)),
                Y+=(5*floatcos(-floatsub(A,45.0),degrees));
                SetPlayerInterior(playerid,0);
                SetPlayerPos(playerid,X,Y,floatsub(Z,0.94));
                SetPlayerFacingAngle(playerid,A);
                SetCameraBehindPlayer(playerid);
                InAndrom[playerid]=0;
        return true;
    }



		if (strcmp("/cashdelivery", cmdtext, true, 10) == 0)
	{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(Jailed[playerid] ==1) {
    	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
	    if(OnDelMission[playerid] == 1337) {
		SendClientMessage(playerid,COLOR_ERROR,"You are already doing a delivery mission");
		return 1;
	}
	    if(DeliveringCash[playerid] == 1337) {
		SendClientMessage(playerid,COLOR_ERROR,"You are already doing a delivery mission");
		return 1;
	}
		if(!IsPlayerInAnyVehicle(playerid)) {
		SendClientMessage(playerid,COLOR_ERROR,"You can only start a Cash Delivery mission while in a Securicar vehicle");
		return 1;
	}
	    if(GetPlayerWantedLevel(playerid) >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You must be innocent before you can work for LV City Bank");
		return 1;
	}
	    new vehicleid = GetPlayerVehicleID(playerid);
    	if(GetVehicleModel(vehicleid) != 428) {
    	SendClientMessage(playerid,COLOR_ERROR,"You can only start a Cash Delivery mission while in a Securicar vehicle");
		return 1;
	}
	    new resultss =0;
	    for (new i = 0; i < MAX_PLAYERS; i++)
   		{
		if(IsPlayerConnected(i) && DeliveringCash[playerid] ==1337)
		{
		    resultss ++;
		}
		}
		if(resultss >= 1) {
		SendClientMessage(playerid,COLOR_ERROR,"Another player is already delivering cash. Try again later");
		return 1;
	}
	
	
		new vidy = GetPlayerVehicleID(playerid);
  	    if(GetVehicleModel(vidy) == 428) {
  	    new atmtotall =0;
  	    atmtotall = atmcash1 +atmcash2 +atmcash3 +atmcash4;
  	    if(atmtotall == 2400000) {
  	    SendClientMessage(playerid,COLOR_ERROR,"All of the ATM's in Las Venturas are full. Cannot start the Cash Delivery mission");
		return 1;
	}
	    if(atmtotall >=0 && atmtotall <= 2399999)
		{
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Bank Cash Delivery_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started the Cash Delivery mission - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"Follow the RED markers on your mini-map to get to the next ATM on the route");
		SendClientMessage(playerid,0xADD8E6AA,"You will be paid when you have delivered this vehicle back to the bank at the end of the route");
		SendClientMessage(playerid,0xADD8E6AA,"Pick the cash up from the rear of LV City bank to get started...");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 73;
    	totalcashdelivered[playerid] =0;
    	DeliveringCash[playerid] =1337;
        SetPlayerCheckpoint(playerid,checkpoints[73][0],checkpoints[73][1],checkpoints[73][2],checkpoints[73][3]); // no 1
        }
        }
		return 1;
	}






	if (strcmp("/gundelivery", cmdtext, true, 10) == 0)
	{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(Jailed[playerid] ==1) {
    	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
	    if(gTeam[playerid] != TEAM_GUNDEL) {
		SendClientMessage(playerid,COLOR_ERROR,"Only Gun Dealers can deliver weapons to ammunation stores");
		return 1;
	}
	    if(OnDelMission[playerid] == 1337) {
		SendClientMessage(playerid,COLOR_ERROR,"You are already doing a delivery mission");
		return 1;
	}
		if(!IsPlayerInAnyVehicle(playerid)) {
		SendClientMessage(playerid,COLOR_ERROR,"You can only start a Weapon Delivery mission while in a Patriot vehicle");
		return 1;
	}
	    if(GetPlayerWantedLevel(playerid) >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You must be innocent before you can work for the city");
		return 1;
	}
	    new vehicleid = GetPlayerVehicleID(playerid);
    	if(GetVehicleModel(vehicleid) != 470) {
    	SendClientMessage(playerid,COLOR_ERROR,"You can only start a Weapon Delivery mission while in a Patriot vehicle");
		return 1;
	}
		new vidy = GetPlayerVehicleID(playerid);
  	    if(GetVehicleModel(vidy) == 470 && GunDeliveryLevel[playerid] == 0) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started Weapon Delivery (Mission 1) - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"You gotta deliver the weapons on time! If you run out of time you have to start at mission 1 again");
		SendClientMessage(playerid,0xADD8E6AA,"Get to Ammunition in South LV to pick up the first load of weapons. You have got 300 seconds to get there");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 58;
    	OnDelMission[playerid] =1337;
    	DeliveringGuns[playerid] =1;
    	GunsDeliveryTime[playerid] =300;
        SetPlayerCheckpoint(playerid,checkpoints[58][0],checkpoints[58][1],checkpoints[58][2],checkpoints[58][3]); // no 1
		return 1;
	}
        if(GetVehicleModel(vidy) == 470 && GunDeliveryLevel[playerid] == 1) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started Weapon Delivery (Mission 2) - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"You gotta deliver the weapons on time! If you run out of time you have to start at mission 1 again");
		SendClientMessage(playerid,0xADD8E6AA,"Pick up the weapons from the rear of Ammunation in Los Santos (Market) You have got 300 seconds to get there");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 60;
    	OnDelMission[playerid] =1337;
    	DeliveringGuns[playerid] =1;
    	GunsDeliveryTime[playerid] =300;
        SetPlayerCheckpoint(playerid,checkpoints[60][0],checkpoints[60][1],checkpoints[60][2],checkpoints[60][3]); // no 1
		return 1;
	}
        if(GetVehicleModel(vidy) == 470 && GunDeliveryLevel[playerid] == 2) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started Weapon Delivery (Mission 3) - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"You gotta deliver the weapons on time! If you run out of time you have to start at mission 1 again");
		SendClientMessage(playerid,0xADD8E6AA,"RS Haul (Flint County) cant make this weapon delivery. You have to do it for them");
  		SendClientMessage(playerid,0xADD8E6AA,"You have got 300 seconds to get there");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 62;
    	OnDelMission[playerid] =1337;
    	DeliveringGuns[playerid] =1;
    	GunsDeliveryTime[playerid] =300;
        SetPlayerCheckpoint(playerid,checkpoints[62][0],checkpoints[62][1],checkpoints[62][2],checkpoints[62][3]); // no 1
		return 1;
	}
        if(GetVehicleModel(vidy) == 470 && GunDeliveryLevel[playerid] == 3) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started Weapon Delivery (Mission 4) - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"You gotta deliver the weapons on time! If you run out of time you have to start at mission 1 again");
		SendClientMessage(playerid,0xADD8E6AA,"Pick up some federal lead at the Ammunation in Ocean Flats (San Fierro)");
		SendClientMessage(playerid,0xADD8E6AA,"You have got 300 seconds to get there");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 64;
    	OnDelMission[playerid] =1337;
    	DeliveringGuns[playerid] =1;
    	GunsDeliveryTime[playerid] =300;
        SetPlayerCheckpoint(playerid,checkpoints[64][0],checkpoints[64][1],checkpoints[64][2],checkpoints[64][3]); // no 1
		return 1;
	}
        if(GetVehicleModel(vidy) == 470 && GunDeliveryLevel[playerid] == 4) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started Weapon Delivery (Mission 5) - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"You gotta deliver the weapons on time! If you run out of time you have to start at mission 1 again");
		SendClientMessage(playerid,0xADD8E6AA,"Army bosses are too busy dealing with Most Wanted suspects. Collect their load at the Naval Base (San Fierro)");
		SendClientMessage(playerid,0xADD8E6AA,"You have got 300 seconds to get there");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 66;
    	OnDelMission[playerid] =1337;
    	DeliveringGuns[playerid] =1;
    	GunsDeliveryTime[playerid] =300;
        SetPlayerCheckpoint(playerid,checkpoints[66][0],checkpoints[66][1],checkpoints[66][2],checkpoints[66][3]); // no 1
		return 1;
	}
	    if(GetVehicleModel(vidy) == 470 && GunDeliveryLevel[playerid] == 5) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started Weapon Delivery (Mission 6) - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"You gotta deliver the weapons on time! If you run out of time you have to start at mission 1 again");
		SendClientMessage(playerid,0xADD8E6AA,"Gotta deliver some weapons to Las Venturas Army HQ. Pick them up at Area 69");
		SendClientMessage(playerid,0xADD8E6AA,"You have got 300 seconds to get there");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 68;
    	OnDelMission[playerid] =1337;
    	DeliveringGuns[playerid] =1;
    	GunsDeliveryTime[playerid] =300;
        SetPlayerCheckpoint(playerid,checkpoints[68][0],checkpoints[68][1],checkpoints[68][2],checkpoints[68][3]); // no 1
		return 1;
	}
        if(GetVehicleModel(vidy) == 470 && GunDeliveryLevel[playerid] == 6) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Delivery Mission Started_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have started Weapon Delivery (Mission 7) - Do not exit this vehicle or the mission will end");
		SendClientMessage(playerid,0xADD8E6AA,"You gotta deliver the weapons on time! If you run out of time you have to start at mission 1 again");
		SendClientMessage(playerid,0xADD8E6AA,"Gotta deliver some weapons to Las Venturas Police Departement. Pick them up at LV Army HQ");
		SendClientMessage(playerid,0xADD8E6AA,"You have got 300 seconds to get there");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 70;
    	OnDelMission[playerid] =1337;
    	DeliveringGuns[playerid] =1;
    	GunsDeliveryTime[playerid] =300;
        SetPlayerCheckpoint(playerid,checkpoints[70][0],checkpoints[70][1],checkpoints[70][2],checkpoints[70][3]); // no 1
		}
		return 1;
	}




	if(strcmp(cmd, "/withdraw", true) == 0) {
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
   	if(!IsPlayerInCheckpoint(playerid)) {
   	SendClientMessage(playerid,0xD2691EAA,"You are not in any bank checkpoint");
    return 1;
    }
    if(!udb_Exists(PlayerName(playerid))) {
   	SendClientMessage(playerid,0xD2691EAA,"You do not have an account on this server. Type /register (your password)");
    return 1;
    }
    if(!PLAYERLIST_authed[playerid]) {
    SendClientMessage(playerid,0xD2691EAA,"You are not logged in! Type /login (your password)");
    return 1;
    }
    
    if(UsedBankRecently[playerid] >= 1) {
    SendClientMessage(playerid,0xD2691EAA,"Please wait before using the bank again");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /withdraw (amount)");
    return 1;
    }
    new moneystowithdraw = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /withdraw (amount) Amount must be a number");
    return 1;
    }
    
    if(IsPlayerInCheckpoint(playerid) && !IsPlayerInAnyVehicle(playerid))
	{
    if(getCheckpointType(playerid) >= 27 && getCheckpointType(playerid) <= 30 || getCheckpointType(playerid) == 33)
    {
        if(GetPlayerMoney(playerid) + moneystowithdraw >= 1000001) {
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Transaction Failed_|");
		format(string, sizeof(string), "You cannot fit $%d more in your pockets!",moneystowithdraw);
    	SendClientMessage(playerid, COLOR_ERROR, string);
    	return 1;
    	}
		new pname[30];
		GetPlayerName(playerid,pname,30);
		if(moneystowithdraw <= 0 || moneystowithdraw >= 500001) {
		format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid, 0xA9A9A9AA, string);
		format(string, sizeof(string), "|** Transaction Failed. Min/Max Withdraw amounts reached");
		SendClientMessage(playerid,0x808080AA,string);
		SendClientMessage(playerid,0x808080AA,"Minimum/Maximum amounts are $1 - $500000");
		format(string, sizeof(string), "**(Bank F Transaction)** %s(%d) Has attempted to withdraw $%d from bank account",pname,playerid,moneystowithdraw);
        ircSay(EchoConnection, EchoChan,string);
		printf("%s",string);
		UsedBankRecently[playerid] =5;
		return 1;
    }
		
        BankCash[playerid] = dUserINT(PlayerName(playerid)).("bankcash");
		if(BankCash[playerid] < moneystowithdraw) {
		format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid, 0xA9A9A9AA, string);
		format(string, sizeof(string), "|** Transaction Failed. You do not have enough bank funds");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "**(Bank NEF Transaction** %s(%d) Has attempted to withdraw $%d from bank account",pname,playerid,moneystowithdraw);
        ircSay(EchoConnection, EchoChan,string);
		printf("%s",string);
		UsedBankRecently[playerid] =5;
		return 1;
    }
		new whatatm = (getCheckpointType(playerid));
		if(whatatm == 29 && atmcash1 < moneystowithdraw) {
		SendClientMessage(playerid,0x808080AA,"|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid,0x808080AA,"|** This ATM does not have enough cash. Transaction Failed");
  		UsedBankRecently[playerid] =5;
		return 1;
    }
        if(whatatm == 30 && atmcash2 < moneystowithdraw) {
		SendClientMessage(playerid,0x808080AA,"|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid,0x808080AA,"|** This ATM does not have enough cash. Transaction Failed");
  		UsedBankRecently[playerid] =5;
		return 1;
    }
        if(whatatm == 27 && atmcash3 < moneystowithdraw) {
		SendClientMessage(playerid,0x808080AA,"|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid,0x808080AA,"|** This ATM does not have enough cash. Transaction Failed");
  		UsedBankRecently[playerid] =5;
		return 1;
    }
        if(whatatm == 28 && atmcash4 < moneystowithdraw) {
		SendClientMessage(playerid,0x808080AA,"|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid,0x808080AA,"|** This ATM does not have enough cash. Transaction Failed");
  		UsedBankRecently[playerid] =5;
		return 1;
    }
		
		if(BankCash[playerid] >= moneystowithdraw) {
		format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid, 0xA9A9A9AA, string);
		format(string, sizeof(string), "|** Mode: Transaction Reciept (Withdraw)");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** Transaction Total: $%d",moneystowithdraw);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** Notes: You have withdrawn $%d from your bank account",moneystowithdraw);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** Bank Opening Hours: 8:00 - 21:00");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** 24h ATM machines. /atmloc");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|_|-------------------------------------------|_|");
		SendClientMessage(playerid,0xA9A9A9AA,string);
		BankCash[playerid] -=moneystowithdraw;
		GivePlayerMoney(playerid,moneystowithdraw);
		dUserSetINT(PlayerName(playerid)).("bankcash",BankCash[playerid]);
		format(string, sizeof(string), "**(Bank Transaction)** %s(%d) Has withdrawn $%d from bank account",pname,playerid,moneystowithdraw);
		printf("%s",string);
		ircSay(EchoConnection, EchoChan,string);
		UsedBankRecently[playerid] =5;
		if(whatatm == 29) {
		atmcash1 -=moneystowithdraw;
		return 1;
    }
        if(whatatm == 30) {
		atmcash2 -=moneystowithdraw;
		return 1;
    }
		if(whatatm == 27) {
		atmcash3 -=moneystowithdraw;
		return 1;
    }
		if(whatatm == 28) {
		atmcash4 -=moneystowithdraw;
		return 1;
    }
		
  		return 1;
    }
		else{
   		SendClientMessage(playerid,0x808080AA,"You are not in any Bank or ATM chackpoint");
  		}
  		}
  		}
		return 1;
		}
		

		
		






    if(strcmp(cmd, "/deposit", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
   	if(!IsPlayerInCheckpoint(playerid)) {
   	SendClientMessage(playerid,0xD2691EAA,"You are not in any bank checkpoint");
    return 1;
    }
    if(!udb_Exists(PlayerName(playerid))) {
   	SendClientMessage(playerid,0xD2691EAA,"You do not have an account on this server. Type /register (your password)");
    return 1;
    }
    if(!PLAYERLIST_authed[playerid]) {
    SendClientMessage(playerid,0xD2691EAA,"You are not logged in! Type /login (your password)");
    return 1;
    }

    if(UsedBankRecently[playerid] >= 1) {
    SendClientMessage(playerid,0xD2691EAA,"Please wait before using the bank again");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /deposit (amount)");
    return 1;
    }
    new moneystodeposit = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /deposit (amount) Amount must be a number");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && !IsPlayerInAnyVehicle(playerid))
	{
    if(getCheckpointType(playerid) != 33) {
    format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
	SendClientMessage(playerid, 0xA9A9A9AA, string);
	SendClientMessage(playerid,0x808080AA,"You can only withdraw funds at a ATM. You can deposit cash in the bank only");
	return 1;
	}

    if(IsPlayerInCheckpoint(playerid) && !IsPlayerInAnyVehicle(playerid))
	{
    if(getCheckpointType(playerid) == 33)
    {
		new pname[30];
		GetPlayerName(playerid,pname,30);
		if(moneystodeposit <= 0 || moneystodeposit >= 1000000) {
		format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid, 0xA9A9A9AA, string);
		format(string, sizeof(string), "|** Transaction Failed. Min/Max Deposit amounts reached");
		SendClientMessage(playerid,0x808080AA,string);
		SendClientMessage(playerid,0x808080AA,"Minimum/Maximum amounts are $1 - $1000000");
		format(string, sizeof(string), "**Bank Failed Transaction** %s(%d) Has attempted to deposit $%d into bank account",pname,playerid,moneystodeposit);
		printf("%s",string);
		UsedBankRecently[playerid] =10;
		return 1;
    }

        //BankCash[playerid] = dUserINT(PlayerName(playerid)).("bankcash");
		if(GetPlayerMoney(playerid) < moneystodeposit) {
		format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid, 0xA9A9A9AA, string);
		format(string, sizeof(string), "|** Transaction Failed. You do not have enough funds to deposit $%d",moneystodeposit);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "**Bank Not Enough Funds Transaction** %s(%d) Has attempted to deposit $%d into bank account",pname,playerid,moneystodeposit);
		printf("%s",string);
		UsedBankRecently[playerid] =10;
		return 1;
		}
		if(GetPlayerMoney(playerid) >= moneystodeposit) {
		format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(playerid, 0xA9A9A9AA, string);
		format(string, sizeof(string), "|** Mode: Transaction Reciept (Deposit)");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** Transaction Total: $%d",moneystodeposit);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** Notes: You have made a deposit of $%d into your bank account",moneystodeposit);
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** Bank Opening Hours: 8:00 - 21:00");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|** 24h ATM machines. /atmloc");
		SendClientMessage(playerid,0x808080AA,string);
		format(string, sizeof(string), "|_|-------------------------------------------|_|");
		SendClientMessage(playerid,0xA9A9A9AA,string);
        BankCash[playerid] = dUserINT(PlayerName(playerid)).("bankcash");
		GivePlayerMoney(playerid,-moneystodeposit);
		BankCash[playerid] +=moneystodeposit;
		dUserSetINT(PlayerName(playerid)).("bankcash",BankCash[playerid]);
		format(string, sizeof(string), "**(Bank Transaction)** %s(%d) Has made a deposit of $%d into bank account",pname,playerid,moneystodeposit);
		printf("%s",string);
		ircSay(EchoConnection, EchoChan,string);
		UsedBankRecently[playerid] =10;
	    	}
    	}
	}
	}
	return 1;
	}
	


    if(strcmp(cmd, "/cuff", true) == 0) {
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
	if(gTeam[playerid] != TEAM_COP && gTeam[playerid] != TEAM_ARMY && gTeam[playerid] != TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not Law Enforcement");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /cuff (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /cuff (id) ID Must be a number");
    return 1;
    }

    if(gTeam[giveplayerid] <= 2) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot handcuff a Law Enforcement agent");
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 4) {
	format(string, sizeof(string), "%s(%d) Is not close enough you cannot handcuff that player",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }

    if(InAdminMode[giveplayerid] == 1337) {
    format(string, sizeof(string), "%s(%d) Is a server Admin. He / She is in Admin Mode. You cannot use this command on this player at this time",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    format(string, sizeof(string), "(ADMIN MODE) %s(%d) Has attempted to handcuff you. You are in Admin mode. You cannot be handcuffed",oname,playerid);
    SendClientMessage(giveplayerid, 0xFF7F50AA, string);
    return 1;
    }
    if(cuffed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is already handcuffed",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot handcuff a prisoner",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot handcuff a player from inside a car");
    return 1;
    }
    if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot handcuff a player from inside a car");
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_PASSENGER) {
	format(string, sizeof(string), "%s(%d) Is in a vehicle. Ask the player to get out before trying to use your handcuffs", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_DRIVER) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. Ask the player to get out before trying to use your handcuffs", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(gTeam[playerid] == TEAM_CASSEC && GetPlayerWantedLevel(giveplayerid) <=3) {
    SendClientMessage(playerid, COLOR_ERROR, "Casino Security agents can only handcuff suspects who have a warrant issued (Orange / Red)");
    return 1;
    }

    if(GetPlayerState(giveplayerid) == PLAYER_STATE_ONFOOT) {
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Handcuffed_|");
    format(string, sizeof(string), "%s(%d): Has put handcuffs on you. Use /breakcuffs to attempt an escape",oname, playerid);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, string);
    TogglePlayerControllable(giveplayerid, 0);
    cuffed[giveplayerid] =1;
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Handcuffed_|");
	format(string, sizeof(string), "You have placed %s(%d) in handcuffs. Use /search (id) to search for illegal items", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    format(string, sizeof(string), "Use /ar to arrest this player if he is warrant (Orange/Red).", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    format(string, sizeof(string), "DO NOT GO AWAY AND LEAVE PLAYERS HANDCUFFED. YOU WILL BE KICKED IF YOU DO", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    }
    
    if(gTeam[playerid] == TEAM_CASSEC && CasSecLastPlayerCuffed[playerid] !=giveplayerid) {
    SendClientMessage(playerid, COLOR_ERROR, "Use your police radio with /cm (msg) and request Police assistance to arrest the suspect");
    SendClientMessage(playerid, COLOR_ERROR, "You have received a $3500 bonus for handcuffing this player");
    GivePlayerMoney(playerid,3500);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	}
	if(gTeam[playerid] == TEAM_CASSEC) {
	CasSecLastPlayerCuffed[playerid] =giveplayerid;
	}
    return 1;
    }


    if(strcmp(cmd, "/uncuff", true) == 0) {
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
	if(gTeam[playerid] != TEAM_COP && gTeam[playerid] != TEAM_ARMY && gTeam[playerid] != TEAM_CASSEC && PlayerAdminLevel[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not Law Enforcement");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /uncuff (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /uncuff (id) ID Must be a number");
    return 1;
    }
    if(cuffed[giveplayerid] == 0) {
    format(string, sizeof(string), "%s(%d) is not handcuffed",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }

    //if(gTeam[giveplayerid] == 1) {
    //SendClientMessage(playerid, COLOR_ERROR, "You cannot ask another Law Enforcement agent to surrender");
    //return 1;
    //}
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 2) {
	format(string, sizeof(string), "%s(%d) is not close enough to cannot uncuff",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    SendClientMessage(playerid, COLOR_DODGERBLUE, "You cannot take players handcuffs off from inside a car");
    return 1;
    }
    if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) {
    SendClientMessage(playerid, COLOR_DODGERBLUE, "You cannot handcuff a player from inside a car");
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_PASSENGER) {
	format(string, sizeof(string), "%s(%d) is in a vehicle. You cannot uncuff that player", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_DRIVER) {
    format(string, sizeof(string), "%s(%d) is in a vehicle. You cannot uncuff that player", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_ONFOOT) {
    format(string, sizeof(string), "%s(%d): Has removed your handcuffs",oname, playerid);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, string);
    TogglePlayerControllable(giveplayerid, 1);
    cuffed[giveplayerid] =0;
	format(string, sizeof(string), "You have removed %s(%d)'s handcuffs", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    }
    return 1;
    }

	// ARMY COMMANDS

    if(strcmp(cmd, "/handsup", true) == 0) {
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		if(cuffed[playerid] == 1) {
     	SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
     	return 1;
     	}
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
  	  		return 1;
		}
	}

}


	
 	if(strcmp(cmd, "/dance", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		if(cuffed[playerid] == 1) {
     	SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
     	return 1;
     	}

      		tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid,COLOR_ERROR,"Usage: /dance [style 1-3]");
				return 1;
			}

			new dancestyle = strval(tmp);
			if(dancestyle < 1 || dancestyle > 3) {
			    SendClientMessage(playerid,COLOR_ERROR,"Usage: /dance [style 1-3]");
			    return 1;
			}

			if(dancestyle == 1) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
			} else if(dancestyle == 2) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
			} else if(dancestyle == 3) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
			}
 	  		return 1;
		}
	}


    if(strcmp(cmd, "/su", true) == 0) {
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
	if(gTeam[playerid] != 2) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not Military Personel");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /su (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);

    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /su (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot ask yourself to surrender");
    return 1;
    }
    
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 35) {
	format(string, sizeof(string), "%s(%d) is not close enough you cannot ask him to surrender",pname, giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(gTeam[giveplayerid] <= 2) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot ask another Law Enforcement agent to surrender");
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_ONFOOT) {
    format(string, sizeof(string), "~b~SA ARMY Officer~n~ %s ~n~~w~has asked you to surrender", oname);
    GameTextForPlayer(giveplayerid, string, 6000, 0);
    format(string, sizeof(string), "SA ARMY Officer %s(%d): Has asked you to surrender",oname, playerid);
    SendClientMessage(giveplayerid, COLOR_ROYALBLUE, string);
	format(string, sizeof(string), "You have asked %s(%d) to surrender", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_PASSENGER) {
	format(string, sizeof(string), "%s(%d) is a passenger in the vehicle. Ask the driver to stop", pname, giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    return 1;
    }
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_DRIVER) {
    format(string, sizeof(string), "SA ARMY Officer %s(%d): Has asked you to pull over and surrender", oname,playerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    format(string, sizeof(string), "~b~SA ARMY Officer~n~ %s ~n~~w~has asked you to stop and surrender", oname);
    GameTextForPlayer(giveplayerid, string, 6000, 0);
    format(string, sizeof(string), "You asked %s(%d) to surrender. Open fire if player fails to comply as a warning", pname,giveplayerid);
    SendClientMessage(playerid,COLOR_DODGERBLUE, string);
    }
    return 1;
    }



    if(strcmp(cmd,"/buydrugs",true)==0)
	{
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You have to be in the checkpoint at the LV Drug House to buy drugs or call a dealer");
    return 1;
    }
    
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 26)
    {
    new buyername[24];
    GetPlayerName(playerid,buyername, 24);
	new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_ERROR, "USAGE: /buydrugs 1-5");
      			return 1;
			}
		    if(strcmp(x_nr,"1",true) == 0)
			{
			   if(GetPlayerMoney(playerid) <= 1999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy 10 grams of drugs ($2000)");
			   return 1;
			}
               
               if(gTeam[playerid] != TEAM_DRGDEL && PlayerDrugs[playerid] >=241) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot carry 10 more grams of drugs (max 250 grams)");
			   return 1;
			}
			
		       if(gTeam[playerid] == TEAM_DRGDEL && PlayerDrugs[playerid] >=991) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot carry 10 more grams (max 1000 grams)");
			   return 1;
			}
			   
			   PlayerDrugs[playerid] += 10;
			   GivePlayerMoney(playerid,-2000);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought 10 grams of drugs from LV Drug House for $2000");
			   SendClientMessage(playerid, 0x00C7FFAA, "Use /takedrugs (grams) to use drugs. Your health will refill while on drugs");
			   oscore = GetPlayerScore(playerid);
			   SetPlayerScore(playerid, oscore +1);
			   


			}
			else if(strcmp(x_nr,"2",true) == 0)
			{
               if(GetPlayerMoney(playerid) <= 19999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy 100 grams of drugs ($20000)");
			   return 1;
			}

               if(gTeam[playerid] != TEAM_DRGDEL && PlayerDrugs[playerid] >=151) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot carry 100 more grams of drugs (max 250 grams)");
			   return 1;
			}

		       if(gTeam[playerid] == TEAM_DRGDEL && PlayerDrugs[playerid] >=901) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot carry 100 more grams (max 1000 grams)");
			   return 1;
			}

			   PlayerDrugs[playerid] += 100;
			   GivePlayerMoney(playerid,-20000);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought 100 grams of drugs from LV Drug House for $20000");
			   SendClientMessage(playerid, 0x00C7FFAA, "Use /takedrugs (grams) to use drugs. Your health will refill while on drugs");
			   oscore = GetPlayerScore(playerid);
			   SetPlayerScore(playerid, oscore +1);


			}
			else if(strcmp(x_nr,"3",true) == 0)
	 		{
	 		
               if(gTeam[playerid] != TEAM_DRGDEL) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You have to be a Drug Dealer to buy 500 grams");
			   return 1;
			}
               if(gTeam[playerid] == TEAM_DRGDEL && GetPlayerMoney(playerid) <= 99999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy 500 grams of drugs ($100000)");
			   return 1;
			}

               if(gTeam[playerid] == TEAM_DRGDEL && PlayerDrugs[playerid] >=501) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot carry 500 more grams (max 1000 grams)");
			   return 1;
			}

			   PlayerDrugs[playerid] += 500;
			   GivePlayerMoney(playerid,-100000);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought 500 grams of drugs from LV Drug House for $100000");
			   SendClientMessage(playerid, 0x00C7FFAA, "If you sell these drugs for $250 / gram you will make a $25k profit");
			   oscore = GetPlayerScore(playerid);
			   SetPlayerScore(playerid, oscore +1);

			}
			else if(strcmp(x_nr,"4",true) == 0)
			{
               if(gTeam[playerid] != TEAM_DRGDEL) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You have to be a Drug Dealer to buy 1000 grams");
			   return 1;
			}
               if(gTeam[playerid] == TEAM_DRGDEL && GetPlayerMoney(playerid) <= 149999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy 1000 grams of drugs ($150000)");
			   return 1;
			}

               if(gTeam[playerid] == TEAM_DRGDEL && PlayerDrugs[playerid] >=1) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot carry 1000 more grams (max 1000 grams)");
			   return 1;
			}

			   PlayerDrugs[playerid] += 1000;
			   GivePlayerMoney(playerid,-150000);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought 1000 grams of drugs from LV Drug House for $150000");
			   SendClientMessage(playerid, 0x00C7FFAA, "If you sell these drugs for $250 / gram you will make a $100k profit");
			   oscore = GetPlayerScore(playerid);
			   SetPlayerScore(playerid, oscore +1);

			}
			else if(strcmp(x_nr,"5",true) == 0)
			{
               if(HasDrugBag[playerid] == 1) {
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You already have a DrugBag");
			   return 1;
			}
               if(GetPlayerMoney(playerid) <= 999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drug Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a DrugBag ($1000)");
			   return 1;
			}

			   HasDrugBag[playerid] =1;
			   GivePlayerMoney(playerid,-1000);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a DrugBag LV Drug House for $1000");
			   SendClientMessage(playerid, 0x00C7FFAA, "If the cops search you while you have a DrugBag they wont find your drugs");
			   oscore = GetPlayerScore(playerid);
			   SetPlayerScore(playerid, oscore +1);

		    }

			else
			{
			SendClientMessage(playerid, COLOR_ERROR, "USAGE: /buydrugs 1-5");

			return 1;
			}

	    }
	    return 1;
	    }
	    

	if(strcmp(cmd,"/buycar",true)==0)
	{
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
	//if(IsSpawned[playerid] == 1) {
	//SendClientMessage(playerid, COLOR_ERROR, "This command has been disabled due to upgrades. Check back soon");
    //return 1;
    //}
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You need to be in the checkpoint at AutoBahn to attempt to sell a car");
    return 1;
    }
    autobahnowner[playerid]=dUserINT(PlayerName(playerid)).("autobahnowner");
	if(autobahnowner[playerid] == 1337) {
	SendClientMessage(playerid,COLOR_ERROR,"You are the owner of AutoBahn. You cannot buy any vehicle from AutoBahn");
	return 1;
	}

    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 19)
    {
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
	SendClientMessage(playerid, COLOR_ERROR, "You cannot be in a car when using this command");
    return 1;
	}
    new buyername[24];
    GetPlayerName(playerid,buyername, 24);
	new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_ERROR, "USAGE: /buycar 1-10");
      			return 1;
			}
		    if(strcmp(x_nr,"1",true) == 0)
			{
			   if(GetPlayerMoney(playerid) <= 39999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Sultan car ($40000)");
			   return 1;
			}
			   new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(560, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Sultan vehicle from AutoBahn for $40000");
			   GivePlayerMoney(playerid,-40000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Sultan car from AutoBahn ($40000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
				   houseowner[i]=dUserINT(PlayerName(i)).("houseowner");
			if(autobahnowner[i] == 1337)
			{
				new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Sultan vehicle to %s(%d) - You receive $40000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,40000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $40000 from a Sultan car sale",autoowner,i);
			}
			}
			}
			}
			else if(strcmp(x_nr,"2",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 59999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Elegy car ($60000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(562, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Elegy vehicle from AutoBahn for $60000");
			   GivePlayerMoney(playerid,-60000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Elegy car from AutoBahn ($60000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Elegy vehicle to %s(%d) - You receive $60000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,60000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $60000 from a Elegy car sale",autoowner,i);
			}
			}
			}
			}
			else if(strcmp(x_nr,"3",true) == 0)
	 		{

                if(GetPlayerMoney(playerid) <= 79999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Jester car ($80000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(559, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Jester vehicle from AutoBahn for $80000");
			   GivePlayerMoney(playerid,-80000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Jester car from AutoBahn ($80000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Jester vehicle to %s(%d) - You receive $80000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,80000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $80000 from a Jester car sale",autoowner,i);
			}
			}
			}
			}
			else if(strcmp(x_nr,"4",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 99999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Cheetah car ($100000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(415, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Cheetah vehicle from AutoBahn for $100000");
			   GivePlayerMoney(playerid,-100000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Cheetah car from AutoBahn ($100000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Cheetah vehicle to %s(%d) - You receive $100000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,100000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $100000 from a Cheetah car sale",autoowner,i);
			}
			}
			}
			}
			else if(strcmp(x_nr,"5",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 119999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Turismo car ($120000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(451, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Turismo vehicle from AutoBahn for $120000");
			   GivePlayerMoney(playerid,-120000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Turismo car from AutoBahn ($120000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Turismo vehicle to %s(%d) - You receive $120000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,120000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $120000 from a Turismo car sale",autoowner,i);
			}
			}
			}
			}
			else if(strcmp(x_nr,"6",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 139999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Infernus vehicle ($140000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(411, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Infernus vehicle from AutoBahn for $140000");
			   GivePlayerMoney(playerid,-140000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Infernus vehicle from AutoBahn ($140000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Infernus vehicle to %s(%d) - You receive $140000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,140000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $140000 from a Infernus car sale",autoowner,i);
			}
			}
			}
			}
            else if(strcmp(x_nr,"7",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 139999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a NRG500 motorbike ($140000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(522, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a NRG500 motorbike from AutoBahn for $140000");
			   GivePlayerMoney(playerid,-140000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a NRG500 motorbike from AutoBahn ($140000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a NRG500 motorbike to %s(%d) - You receive $140000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,140000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $140000 from a NRG500 motorbike sale",autoowner,i);
			}
			}
			}
			}
			else if(strcmp(x_nr,"8",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 249999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Hotring Racer vehicle ($250000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(494, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Hotring Racer vehicle from AutoBahn for $250000");
			   GivePlayerMoney(playerid,-250000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Hotring Racer car from AutoBahn ($250000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Hotring Racer vehicle to %s(%d) - You receive $250000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,250000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $250000 from a Hotring Racer car sale",autoowner,i);
			}
			}
			}
			}
			
			
            else if(strcmp(x_nr,"9",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 99) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a BMX bike ($100)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(481, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a BMX bike from AutoBahn for $100");
			   GivePlayerMoney(playerid,-100);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a BMX bike from AutoBahn ($100)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a BMX bike to %s(%d) - You receive $100",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,100);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $100 from a BMX bike sale",autoowner,i);
			}
			}
			}
			}
			
			
			
			else if(strcmp(x_nr,"10",true) == 0)
			{
                if(GetPlayerMoney(playerid) <= 49999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Uranus vehicle ($50000)");
			   return 1;
			}
               new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(558, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =playerid;
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Purchased_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Uranus vehicle from AutoBahn for $50000");
			   GivePlayerMoney(playerid,-50000);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has purchased a Uranus car from AutoBahn ($50000)",buyername,playerid);
			for(new i=0;i<MAX_PLAYERS;i++)
			{
			if(IsPlayerConnected(i))
			{
				   autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
			    new autoowner[24];
				GetPlayerName(i,autoowner,24);
				SendClientMessage(i, 0xA9A9A9AA, "|_Vehicle Sold_|");
				format(string, sizeof(string), "AutoBahn salesmen have sold a Uranus vehicle to %s(%d) - You receive $50000",buyername,playerid);
    			SendClientMessage(i, 0x00C7FFAA, string);
			    SendClientMessage(i, 0x00C7FFAA, "You can sell the AutoBahn business to a player using /sellautobahn (id)");
			    GivePlayerMoney(i,50000);
			    printf("**(CAR PURCHASE CASH)** AutoBahn owner %s(%d) has received $50000 from a Uranus car sale",autoowner,i);
			}
			}
			}
			}
			else
			{
			SendClientMessage(playerid, COLOR_ERROR, "USAGE: /buycar 1-10");

			return 1;
			}

	    }
	    return 1;
	}









    if(strcmp(cmd,"/refill",true)==0)
	{
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] >= 3) {
	SendClientMessage(playerid, COLOR_ERROR, "Only Police officers and Army can refill their weapons");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You have to be in the checkpoint at LVPD (Bottom Floor) to refill weapons");
    return 1;
    }

    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 34)
    {
    if(CopWaitBetweenRefills[playerid] >= 1)
    {
    SendClientMessage(playerid, COLOR_ERROR, "Please wait before refilling your weapons");
    return 1;
	}
    new copname[24];
    GetPlayerName(playerid,copname, 24);
	new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_ERROR, "USAGE: /refill 1-4");
      			return 1;
			}
		    if(strcmp(x_nr,"1",true) == 0)
			{
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Received_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have received a Pistol weapon with 150 Ammo from LVPD");
			   GivePlayerWeapon(playerid,22,150);
			   CopWaitBetweenRefills[playerid] =120;
			   format(string, sizeof(string), "%s(%d) Has received a Pistol weapon with 150 Ammo from LVPD",copname,playerid);
               printf("%s", string);
			}
			else if(strcmp(x_nr,"2",true) == 0)
			{
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Received_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have received a Shotgun weapon with 50 Ammo from LVPD");
			   GivePlayerWeapon(playerid,25,50);
			   CopWaitBetweenRefills[playerid] =120;
			   format(string, sizeof(string), "%s(%d) Has received a Shotgun weapon with 50 Ammo from LVPD",copname,playerid);
               printf("%s", string);
			}
			else if(strcmp(x_nr,"3",true) == 0)
	 		{

               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Received_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have received a MP5 weapon with 500 Ammo from LVPD");
			   GivePlayerWeapon(playerid,29,500);
			   CopWaitBetweenRefills[playerid] =120;
			   format(string, sizeof(string), "%s(%d) Has received a MP5 weapon with 500 Ammo from LVPD",copname,playerid);
               printf("%s", string);

			}
			else if(strcmp(x_nr,"4",true) == 0)
			{
               SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapon Received_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have received a Parachute from LVPD");
			   GivePlayerWeapon(playerid,46,1);
			   CopWaitBetweenRefills[playerid] =120;
			   format(string, sizeof(string), "%s(%d) Has received a Parachute from LVPD",copname,playerid);
               printf("%s", string);
			}
   			else
			{
			SendClientMessage(playerid, COLOR_ERROR, "USAGE: /refill (1-4)");

			return 1;
			}

	    }
	    return 1;
	}


    if(strcmp(cmd, "/medic", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Medic. Type /healme or /cureme");
    return 1;
    }
    if(gTeam[playerid] == TEAM_PVTMED) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Private Medic. Type /healme or /cureme");
    return 1;
    }
    if (!GetPlayersInTeam(TEAM_MEDIC) && !GetPlayersInTeam(TEAM_PVTMED)) {
    SendClientMessage(playerid,COLOR_ERROR,"Unable to locate any Medics");
    return 1;
    }
    SendClientMessage(playerid, COLOR_DODGERBLUE, "You have called a medic");
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	 if(IsPlayerConnected(i))
	 {
    if(gTeam[i] == TEAM_MEDIC || gTeam[i] == TEAM_PVTMED ) {
    new pname[24];
    GetPlayerName(playerid, pname, 24);
    new current_zone;
    current_zone = player_zone[playerid];
    format(string, sizeof(string), "%s(%d) Has requested a medic. Location: %s",pname,playerid,zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_FORESTGREEN, string);
	
	wantsheal[playerid] =1;
	wantscure[playerid] =1;
	}
	}
	}
    return 1;
    }


	if(strcmp(cmd, "/onduty", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] != TEAM_DRIVER) {
    SendClientMessage(playerid, COLOR_ERROR, "Only drivers can use this command");
    return 1;
    }
    if(Driveronduty[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You are already on duty");
    return 1;
    }
    
    if(!IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid, COLOR_ERROR, "You are not in any drivers vehicle");
    return 1;
    }
    if(GetPlayerWantedLevel(playerid) >= 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You must be innocent to go on duty as a driver");
    return 1;
    }
    if(IsPlayerInAnyVehicle(playerid))
    {
    new vehicleid = GetPlayerVehicleID(playerid);
    if(GetVehicleModel(vehicleid) == 420 || GetVehicleModel(vehicleid) == 487 || GetVehicleModel(vehicleid) == 431 || GetVehicleModel(vehicleid) == 409)
    {
    new drivername[30];
    GetPlayerName(playerid,drivername,30);
    format(string, sizeof(string), "Driver %s(%d) Is now on duty. Type /taxi to call a driver",drivername,playerid);
	SendClientMessageToAll(COLOR_FORESTGREEN,string);
	Driveronduty[playerid] =1;
    }
    else {
    SendClientMessage(playerid, COLOR_ERROR, "You are not in any drivers vehicle");
    }
    }
    return 1;
    }



	if(strcmp(cmd, "/offduty", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] != TEAM_DRIVER) {
    SendClientMessage(playerid, COLOR_ERROR, "Only drivers can use this command");
    return 1;
    }
    if(Driveronduty[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "You are not on duty");
    return 1;
    }
	if(Driveronduty[playerid] == 1)
	{
    new drivername[30];
    GetPlayerName(playerid,drivername,30);
    format(string, sizeof(string), "Driver %s(%d) is off duty",drivername,playerid);
	SendClientMessageToAll(COLOR_FORESTGREEN,string);
	Driveronduty[playerid] =0;
	new taxiid = GetPlayerVehicleID(playerid);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(IsPlayerInVehicle(i,taxiid) && GetPlayerState(i) == PLAYER_STATE_PASSENGER)
	{
	RemovePlayerFromVehicle(i);
	Taxipass[i] =0;
	}
	}
	}
    return 1;
    }



    if(strcmp(cmd, "/taxi", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] ==1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot call a taxi if you are in a vehicle");
    return 1;
    }
    if (!GetPlayersInTeam(TEAM_DRIVER)) {
    SendClientMessage(playerid,COLOR_ERROR,"Unable to locate any Drivers");
    return 1;
    }
    if(GetPlayersInTeam(TEAM_DRIVER) >=1) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Driver Called_|");
    SendClientMessage(playerid, COLOR_DARKOLIVEGREEN, "You have called a driver to your location. Please wait");
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(gTeam[i] == TEAM_DRIVER) {
    new pname[24];
    GetPlayerName(playerid, pname, 24);
    new current_zone;
    current_zone = player_zone[playerid];
    SendClientMessage(i, 0xA9A9A9AA, "|_Driver Requested_|");
    format(string, sizeof(string), "%s(%d) Has requested a driver. Location: %s",pname,playerid,zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_DARKOLIVEGREEN, string);
	}
	}
	}
    return 1;
    }
    
    

    if(strcmp(cmd, "/sellautobahn", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    autobahnowner[playerid]=dUserINT(PlayerName(playerid)).("autobahnowner");

	if(autobahnowner[playerid] == 0) {
	SendClientMessage(playerid,COLOR_ERROR,"You are not the current owner of the AutoBahn business");
    return 1;
    }
    if(autobahnowner[playerid] == 1337)
	{
	tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellautobahn (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sellautobahn (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot sell your business to yourself");
    return 1;
    }
    if(!udb_Exists(PlayerName(giveplayerid))) {
    SendClientMessage(playerid,COLOR_ERROR,"That player does not have any account on our server. Cannot sell to that player");
    return 1;
    }
    if(!PLAYERLIST_authed[giveplayerid]) {
    SendClientMessage(playerid,COLOR_ERROR,"That player is not logged into their account. Cannot sell to that player");
    return 1;
    }
    new oldowner[30];
    new newowner[30];
    GetPlayerName(playerid,oldowner,30);
    GetPlayerName(giveplayerid,newowner,30);
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 10) {
    format(string, sizeof(string), "%s(%d) Is not close enough. You cannot give that player the official papers",newowner,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    autobahnowner[playerid] =0;
    dUserSetINT(PlayerName(playerid)).("autobahnowner",autobahnowner[playerid]);
    autobahnowner[giveplayerid] =1337;
    dUserSetINT(PlayerName(giveplayerid)).("autobahnowner",autobahnowner[giveplayerid]);
    
    SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Business Sold_|");
    format(string, sizeof(string), "You have sold the AutoBahn business to %s(%d) - You are no longer the owner of AutoBahn",newowner,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_AutoBahn Business Purchased_|");
    format(string, sizeof(string), "You have purchased the AutoBahn business from %s(%d) | Use /sellautobahn (id) to sell the business",oldowner,playerid);
    SendClientMessage(giveplayerid,0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0x00C7FFAA,"If a player buys a vehicle from AutoBahn, you will get the full amount of the sale in your pocket");
    SendClientMessage(giveplayerid,0x00C7FFAA,"You will only be paid if you are online and logged into your account at the time of the sale");
    
    format(string, sizeof(string), "AutoBahn owner %s(%d) has sold the car showroom business to %s(%d)",oldowner,playerid,newowner,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    printf("**(Auto Bahn Sold)** %s(%d) has sold AutoBahn to %s(%d)",oldowner,playerid,newowner,giveplayerid);
    }

    return 1;
    }

 
	if(strcmp(cmd,"/buy",true)==0)
	{
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You have to be in the checkpoint inside a 24/7 store to use this command");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 46) {
    SendClientMessage(playerid,COLOR_ERROR,"You have to be in the checkpoint inside a 24/7 store to use this command");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 46)
    {
    new buyername[24];
    GetPlayerName(playerid,buyername, 24);
	new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_ERROR, "USAGE: /buy 1-6");
      			return 1;
			}
		    if(strcmp(x_nr,"1",true) == 0)
			{
			   if(GetPlayerMoney(playerid) <= 1499) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Chainsaw ($2000)");
			   return 1;

			}


			   GivePlayerMoney(playerid,-1500);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Chainsaw. You were charged $1500");
			   GivePlayerWeapon(playerid,9,1);
TextDrawHideForPlayer(playerid,service);
return 1;
			}
			else if(strcmp(x_nr,"2",true) == 0)
			{
               if(GetPlayerMoney(playerid) <= 4) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy flowers ($5)");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}

			   
			   GivePlayerMoney(playerid,-5);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought flowers. You were charged $5");
			   GivePlayerWeapon(playerid,14,1);
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}
			else if(strcmp(x_nr,"3",true) == 0)
	 		{

               if(GetPlayerMoney(playerid) <= 0) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy water ($1)");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}


			   GivePlayerMoney(playerid,-1);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought some water. You were charged $1");
			   TextDrawHideForPlayer(playerid,service);
return 1;
			}
			else if(strcmp(x_nr,"4",true) == 0)
			{
               if(GetPlayerMoney(playerid) <= 19) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy Beer ($20)");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}


			   GivePlayerMoney(playerid,-20);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought and drinked a Beer. You were charged $20");
			   TextDrawHideForPlayer(playerid,service);
			   new Float:beerhealth;
		       GetPlayerHealth(playerid,beerhealth);
		       drunkplayer[playerid] += 1;
			   if(beerhealth <=95) {
			   drunkplayer[playerid] += 1;
               SetPlayerHealth(playerid,beerhealth+5);
			   return 1;
			   }
               else if(drunkplayer[playerid] >= 3) {
               GameTextForPlayer(playerid,"~w~you are ~r~~n~drunk", 7000,3);
               drunkplayer[playerid] += 1;
               return 1;
    		   }

			}
			else if(strcmp(x_nr,"5",true) == 0)
			{
               if(GetPlayerMoney(playerid) <= 999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Wallet ($1000)");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}
               if(HasWallet[playerid] >= 1) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You already have a Wallet");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}

			   GivePlayerMoney(playerid,-1000);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Wallet. You were charged $1000");
			   SendClientMessage(playerid, 0x00C7FFAA, "You can be robbed upto 5 times and not lose any cash");
			   HasWallet[playerid] =5;
			   TextDrawHideForPlayer(playerid,service);
			   return 1;

		    }
			else if(strcmp(x_nr,"6",true) == 0)
			{
               if(GetPlayerMoney(playerid) <= 499) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Parachute ($500)");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}

			   GivePlayerMoney(playerid,-500);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Parachute. You were charged $500");
			   GivePlayerWeapon(playerid,46,1);
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
		    }
		    else if(strcmp(x_nr,"7",true) == 0)
			{
               if(GetPlayerMoney(playerid) <= 1599) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a Camera ($1600)");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}

			   GivePlayerMoney(playerid,-1600);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought a Camera with 1600 photos free. You were charged $1600");
			   GivePlayerWeapon(playerid,43,1600);
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
		    }
		    else if(strcmp(x_nr,"8",true) == 0)
			{
               if(GetPlayerMoney(playerid) <= 1) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy a condom ($2)");
			   TextDrawHideForPlayer(playerid,service);
			   return 1;
			}

			   GivePlayerMoney(playerid,-2);
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_24/7 Purchase_|");
			   SendClientMessage(playerid, 0x00C7FFAA, "You have bought 3 packs of Condoms. You were charged $2. Have a nice sex..");
			   TextDrawHideForPlayer(playerid,service);
               Condom[playerid] =3;
               return 1;
			}
      			else
			{
			SendClientMessage(playerid, COLOR_ERROR, "USAGE: /buy 1-8");

			return 1;
			}

	    }
	    return 1;
	}

    
    if(strcmp(cmd, "/heal", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] != TEAM_MEDIC && gTeam[playerid] != TEAM_PVTMED ) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a medic");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /heal (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /heal (id) ID Must be a number");
    return 1;
    }
    new mname[24];
    new pname[24];
    GetPlayerName(playerid,mname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5) {
     format(string, sizeof(string), "%s(%d) Is not close enough. You cannot heal that player",pname,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
	if(wantsheal[giveplayerid] == 0) {
	format(string, sizeof(string), "Medic %s(%d) has attempted to heal you. Type /medic if you need a Medic",mname,playerid);
    SendClientMessage(giveplayerid,COLOR_FORESTGREEN, string);
    format(string, sizeof(string), "%s(%d) has not asked for a medic. You cannot heal that player", pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR, string);
    }
    else
    if(wantsheal[giveplayerid] == 1) {
    new mrand = random(3500);
    oscore = GetPlayerScore(playerid);
    SendClientMessage(giveplayerid,0xA9A9A9AA, "|_Health Restored_|");
    format(string, sizeof(string), "Medic %s(%d) has healed you for $%d",mname,playerid,mrand);
    SendClientMessage(giveplayerid,COLOR_FORESTGREEN, string);
    SendClientMessage(playerid,0xA9A9A9AA, "|_Player Health Restored_|");
    format(string, sizeof(string), "%s(%d) has been healed. You earned $%d", pname,giveplayerid,mrand);
    SendClientMessage(playerid,COLOR_FORESTGREEN, string);
    SetPlayerHealth(giveplayerid,100);
    GivePlayerMoney(giveplayerid,-mrand);
    GivePlayerMoney(playerid,mrand);
    SetPlayerScore(playerid, oscore +1);
    wantsheal[giveplayerid] =0;
    }
    return 1;
    }

    if(strcmp(cmd, "/cure", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(gTeam[playerid] != TEAM_MEDIC && gTeam[playerid] != TEAM_PVTMED ) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Medic / Private Medic");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /cure (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /cure (id) ID Must be a number");
    return 1;
    }
    new mname[24];
    new pname[24];
    GetPlayerName(playerid,mname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5) {
     format(string, sizeof(string), "%s(%d) Is not close enough. You cannot cure that player",pname,giveplayerid);
     SendClientMessage(playerid, COLOR_ERROR, string);
     return 1;
     }
    if(Chlamydia[giveplayerid] == 0 && Salmonella[giveplayerid] == 0) {
 	format(string, sizeof(string), "%s(%d) Does not have any infections",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
 	return 1;
 	}
	if(wantscure[giveplayerid] == 0) {
	format(string, sizeof(string), "Medic %s(%d) has attempted to cure your infection. Type /medic if you need a Medic",mname,playerid);
    SendClientMessage(giveplayerid,COLOR_FORESTGREEN, string);
    format(string, sizeof(string), "%s(%d) has not asked for a medic. You cannot cure that players infection", pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR, string);
    }
    else
    if(wantscure[giveplayerid] == 1) {
    new mrand = random(3500);
    oscore = GetPlayerScore(playerid);
    SendClientMessage(giveplayerid,0xA9A9A9AA, "|_Infection(s) Cured_|");
    format(string, sizeof(string), "Medic %s(%d) has cured your infections for $%d",mname,playerid,mrand);
    SendClientMessage(giveplayerid,COLOR_FORESTGREEN, string);
    SendClientMessage(playerid,0xA9A9A9AA, "|_Player Infection(s) Cured_|");
    format(string, sizeof(string), "%s(%d) has beed cured. You earned $%d", pname,giveplayerid,mrand);
    SendClientMessage(playerid,COLOR_FORESTGREEN, string);
    GivePlayerMoney(giveplayerid,-mrand);
    GivePlayerMoney(playerid,mrand);
    Chlamydia[giveplayerid] =0;
	Salmonella[giveplayerid] =0;
    SetPlayerScore(playerid, oscore +1);
    wantscure[giveplayerid] =0;
    }
    return 1;
    }

	if(strcmp(cmd, "/healme", true) == 0 && IsPlayerConnected(playerid)) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] != TEAM_MEDIC && gTeam[playerid] != TEAM_PVTMED ) {
    SendClientMessage(playerid,COLOR_ERROR,"Only Medic's or Private Medic's can use this command");
    return 1;
    }
    if(GetPlayerWantedLevel(playerid) >= 4) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you have a warrant (Orange/Red)");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    new Float:playerhealth;
    GetPlayerHealth(playerid,playerhealth);
    if(playerhealth >= 100) {
    SendClientMessage(playerid,COLOR_ERROR,"Your health is already high. You cannot heal yourself");
    }
    else
    if(playerhealth >= 0 && playerhealth <= 99)
    {
    new healername[24];
    GetPlayerName(playerid,healername, 24);
	SetPlayerHealth(playerid,100);
	SendClientMessage(playerid,0xA9A9A9AA, "|_Health Restored_|");
	SendClientMessage(playerid,COLOR_FORESTGREEN, "You are a Medic / Private Medic. You have restored your own health");
	printf("Medic / Private Medic %s(%d) has used /healme",healername,playerid);
    }
    return 1;
    }



	if(strcmp(cmd, "/cureme", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(gTeam[playerid] != TEAM_MEDIC && gTeam[playerid] != TEAM_PVTMED ) {
    SendClientMessage(playerid,COLOR_ERROR,"Only Medic's or Private Medic's can use this command");
    return 1;
    }
    if(Chlamydia[playerid] == 0 && Salmonella[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR,"You do not have any infections");
 	return 1;
 	}
    new curername[24];
    GetPlayerName(playerid,curername, 24);

	SendClientMessage(playerid,0xA9A9A9AA, "|_Infection(s) Cured_|");
	SendClientMessage(playerid,COLOR_FORESTGREEN, "You are a Medic / Private Medic. You have cured your own infection(s)");
	printf("Medic / Private Medic %s(%d) has used /cureme",curername,playerid);
    Chlamydia[playerid] =0;
	Salmonella[playerid] =0;
    return 1;
    }





    if(strcmp(cmd, "/infect", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(gTeam[playerid] != TEAM_PVTMED ) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Private Medic");
    return 1;
    }
    if(InfectedPlyRecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
    return 1;
    }

    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /infect (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /infect (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot infect yourself");
    return 1;
    }
    
    new mname[24];
    new pname[24];
    GetPlayerName(playerid,mname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot infect a player from inside a vehicle");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot infect a player while you are handcuffed");
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot rob a prisoner",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(cuffed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is handcuffed. You cannot rob a player who is handcuffed",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. You cannot rob that player",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5) {
    format(string, sizeof(string), "%s(%d) Is not close enough. You cannot attempt to infect that player",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new rand = random(500);
	if(rand >= 0 && rand <= 199) {
    format(string, sizeof(string), "Your attempt to infect %s(%d) has failed",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    InfectedPlyRecent[playerid] =1;
    return 1;
    }
    if(rand >= 200 && rand <= 500) {
    format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",pname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    SendClientMessage(giveplayerid,0xA9A9A9AA, "|_You Have Been Infected_|");
    format(string, sizeof(string), "Private Medic %s(%d) has infected you with Chlamydia",mname,playerid);
    SendClientMessage(giveplayerid,COLOR_FORESTGREEN, string);
    SendClientMessage(playerid,0xA9A9A9AA, "|_Player Infected_|");
    format(string, sizeof(string), "You have infected %s(%d) with Chlamydia", pname,giveplayerid);
    SendClientMessage(playerid,COLOR_FORESTGREEN, string);
    Chlamydia[giveplayerid] =1;
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    InfectedPlyRecent[playerid] =1;
    GameTextForPlayer(giveplayerid,"Infected with Chlamydia",7000,3);
    new current_zone;
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (MEDICAL CRIMES) Suspect: %s(%d) has infected %s(%d) Location: %s",mname,playerid,pname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    if(gTeam[giveplayerid] == TEAM_COP || gTeam[giveplayerid] == TEAM_ARMY) {
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +4 );
    }
    else{
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +2 );
    }
    new pcol = GetPlayerColor(playerid);
	new plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(MEDICAL CRIMES) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
    }
    return 1;
    }

    

    if(strcmp(cmd, "/pmoff", true) == 0) {
    if(pmsoff[playerid] == 1) {
	SendClientMessage(playerid, COLOR_YELLOW, "You are already refusing to accept any Personal Messages");
    return 1;
    }
    else {
    SendClientMessage(playerid, COLOR_YELLOW, "You are now refusing all Personal Messages");
    pmsoff[playerid] =1;
    }
    return 1;
    }
    
    if(strcmp(cmd, "/pmon", true) == 0) {
    if(pmsoff[playerid] == 0) {
	SendClientMessage(playerid, COLOR_YELLOW, "You are already accepting Personal Messages");
    return 1;
    }
    else {
    pmsoff[playerid] =0;
    SendClientMessage(playerid, COLOR_YELLOW, "You are now accepting all Personal Messages");
    }
    return 1;
    }
    
    
    


	if(strcmp(cmd, "/selldrugs", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_DRGDEL) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Drug Dealer");
    return 1;
    }
    if(solddrugsrecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
    return 1;
    }
    if(PlayerDrugs[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not carrying any drugs. Visit the drug house to get your supply");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /selldrugs (id) [Amount Per Gram]");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /selldrugs (id) [Amount Per Gram] ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot sell yourself drugs");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /selldrugs (id) [Amount Per Gram]");
    return 1;
    }
    new dollerspergram = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /selldrugs (id) [Amount Per Gram] Amount per gram must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(dollerspergram <=4) {
    SendClientMessage(playerid, COLOR_ERROR, "Minimum amount per gram is $5");
    return 1;
    }
    if(dollerspergram >=1001) {
    SendClientMessage(playerid, COLOR_ERROR, "Maximum amount per gram is $1000");
    return 1;
    }
    new dealername[24];
    new buyername[24];
    GetPlayerName(playerid,dealername, 24);
	GetPlayerName(giveplayerid,buyername, 24);
	if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 7) {
    format(string, sizeof(string), "%s(%d) Is not close enough. You cannot offer to sell that player drugs",buyername,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(wantsdrugs[giveplayerid] == 0) {
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Drugs Offered_|");
	format(string, sizeof(string), "Drug Dealer %s(%d) Has offered to sell you drugs for $%d per gram",dealername,playerid,dollerspergram);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, string);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, "Type /drugs to accept. Do nothing to refuse the offer");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Offered_|");
    format(string, sizeof(string), "You have offered to sell %s(%d) drugs for $%d per gram. Use /givedrugs %d [grams]",buyername,giveplayerid,dollerspergram,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);

   	return 1;
 	}
 	if(wantsdrugs[giveplayerid] == 1) {
 	SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Drugs Offered_|");
	format(string, sizeof(string), "You called a drug dealer. %s(%d) Has offered to sell you drugs for $%d per gram",dealername,playerid,dollerspergram);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, string);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, "Tell the dealer if this price is ok and how many grams you want. Do nothing to refuse");
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Drugs Offered_|");
    format(string, sizeof(string), "%s(%d) Has called a Drug Dealer. You offered to sell drugs for $%d per gram",buyername,giveplayerid,dollerspergram);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    format(string, sizeof(string), "Use /givedrugs %d [grams] to give the player drugs",giveplayerid);
    SendClientMessage(playerid, COLOR_DODGERBLUE, string);
    }
 	return 1;
 	}
 	
 	if(strcmp(cmd, "/hit", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_HITMAN) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Hitman. You cannot place a Hit contract on anyone");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /hit (ID) (Amount)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /hit (ID) (Amount) ID Must be a number");
    return 1;
    }
    if (!GetPlayersInTeam(TEAM_HITMAN)) {
    SendClientMessage(playerid,COLOR_ERROR,"There are no Hitmen online");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new hittername[24];
    new hiteename[24];
    GetPlayerName(playerid,hittername, 24);
	GetPlayerName(giveplayerid,hiteename, 24);
    if(IsSpawned[giveplayerid] == 0) {
	format(string, sizeof(string), "%s(%d) Is dead. You cannot place a hit contract on a dead body",hiteename,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot put a hit contract on yourself");
    return 1;
    }
    
    if(HasHitOnHim[giveplayerid] >= 1) {
    format(string, sizeof(string), "%s(%d) Already has a hit contract. You cannot place a further hit contract on that player",hiteename,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /hit (ID) (Amount)");
    return 1;
    }
    new hitmoney = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /hit (ID) (Amount) Amount must be a number");
    return 1;
    }
    if(hitmoney <= 6999 || hitmoney > 1000001) {
    SendClientMessage(playerid, COLOR_ERROR, "Min/Max hit contract amount is $7000 - $1000000");
    return 1;
    }
    if(GetPlayerMoney(playerid) < hitmoney) {
    format(string, sizeof(string), "You cannot afford to place a $%d hit contract on %s(%d)",hitmoney,hiteename,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Hit Contract Placed_|");
    format(string, sizeof(string), "You have placed a hit contract on %s(%d) for $%d",hiteename,giveplayerid,hitmoney);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Hit Contract Placed On You_|");
    SendClientMessage(giveplayerid, 0x00C7FFAA, "A Hit Contract has been placed on you! Watch out for hitmen.");
    GameTextForPlayer(giveplayerid, "~w~HIT CONTRACT~n~PLACED ON YOU",5000,5);
    format(string, sizeof(string), "%s(%d) has placed a hit on %s(%d) for $%d",hittername,playerid,hiteename,giveplayerid,hitmoney);
    printf("%s",string);
    HasHitOnHim[giveplayerid] =1400;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(IsPlayerConnected(i))
	{
    if(gTeam[i] == TEAM_HITMAN) {
    SendClientMessage(i, 0xA9A9A9AA, "|_Hit Contract Placed_|");
    format(string, sizeof(string), "%s(%d) Has placed a hit contract on %s(%d) for $%d",hittername,playerid,hiteename,giveplayerid,hitmoney);
	SendClientMessage(i, 0x00C7FFAA, string);
	}
	}
	}
    return 1;
    }

    if(strcmp(cmd, "/ej", true) == 0) {
    if(!IsPlayerInAnyVehicle(playerid)) {
 	SendClientMessage(playerid, COLOR_ERROR, "You are not in any vehicle");
    }
    else {
    RemovePlayerFromVehicle(playerid);
    SendClientMessage(playerid, COLOR_GREY, "You have ejected yourself from the vehicle");
    }
    return 1;
    }

    if(strcmp(cmd, "/ejall", true) == 0) {
    if(!IsPlayerInAnyVehicle(playerid)) {
 	SendClientMessage(playerid, COLOR_ERROR, "You are not in any vehicle");
    return 1;
    }
    if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) {
    SendClientMessage(playerid, COLOR_ERROR, "You must be the driver of the vehicle to eject all players from a vehicle");
    return 1;
    }
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    new carrrrid = GetPlayerVehicleID(playerid);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(IsPlayerConnected(i) && IsPlayerInVehicle(i,carrrrid))
	{
	RemovePlayerFromVehicle(i);
	SendClientMessage(i, COLOR_GREY, "You have been ejected from the vehicle");
	}
	}
	}
	return 1;
    }

	if(strcmp(cmd, "/eject", true) == 0)
	{
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /eject (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /eject (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
	if(!IsPlayerInAnyVehicle(playerid)) {
	SendClientMessage(playerid, COLOR_ERROR, "You must be driving a vehicle to use this command");
    return 1;
    }
    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
	SendClientMessage(playerid, COLOR_ERROR, "You are not the driver of this vehicle. Only the driver can eject players");
    return 1;
    }
    if(!IsPlayerInAnyVehicle(giveplayerid)) {
	GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "%s(%d) Is not in any vehicle", string,giveplayerid);
    return 1;
    }
    new kar = GetPlayerVehicleID(playerid);
	if(GetPlayerVehicleID(giveplayerid) != kar) {
	GetPlayerName(giveplayerid, string, 24);
    format(string, 100, "%s(%d) Is not in your vehicle. You cannot eject that player", string,giveplayerid);
    return 1;
    }
    RemovePlayerFromVehicle(giveplayerid);
    GameTextForPlayer(giveplayerid,"EJECTED",7000,3);
    SendClientMessage(playerid,0x00C7FFAA,"Player Ejected..");
	return 1;
    }






























	if(strcmp(cmd, "/jail", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_COP && gTeam[playerid] != TEAM_ARMY && gTeam[playerid] != TEAM_LAWYER &&  gTeam[playerid] != TEAM_JAILTK) {
    SendClientMessage(playerid,COLOR_ERROR,"Only Police, Army, Lawyers and Jail Turnkeys can see who is in Jail");
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Listing Players Currently In Jail_|");
    SendClientMessage(playerid, COLOR_ROYALBLUE, "Prisoners in Alcatraz are not listed here");
    new jailedresult =0;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(IsPlayerConnected(i) && Jailed[i] == 1 && InAlcatraz[i] == 0)
	{
	jailedresult ++;
	new jailbirdname[30];
	GetPlayerName(i,jailbirdname,30);
    format(string, sizeof(string), "%s(%d) Is in jail at Las Venturas Police Department HQ. Time Left: %d Seconds",jailbirdname,i,JailTime[i]);
	SendClientMessage(playerid, 0x00C7FFAA, string);
	}
	}
    if(jailedresult == 0) {
 	SendClientMessage(playerid, 0x00C7FFAA, "There jail cells are empty. No players are in jail");
	}
	return 1;
    }


    if(strcmp(cmd, "/bounty", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_BOUNTY) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Bounty Hunter. Only Bounty Hunters can use this command");
    return 1;
    }
    if(GetPlayerWantedLevel(playerid) >=1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command if you are wanted by the police");
    return 1;
    }
    new bountyresult =0;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(IsPlayerConnected(i) && EscapedConvict[i] >= 1)
	{
	bountyresult ++;
	new bountyname[30];
	GetPlayerName(i,bountyname,30);
    format(string, sizeof(string), "%s(%d) Is on your bounty list. Use /loc (id) to locate the target",bountyname,i);
	SendClientMessage(playerid, 0x00C7FFAA, string);
	}
	}
    if(bountyresult == 0) {
 	SendClientMessage(playerid, 0x00C7FFAA, "There are no bountys on your list. Bounty hunters only hunt Escaped Convicts");
	}
	return 1;
    }






















    if(strcmp(cmd, "/hits", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_HITMAN) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Hitman. Only hitmen can use this command");
    return 1;
    }
    new hitsresult =0;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(IsPlayerConnected(i) && HasHitOnHim[i] >= 1)
	{
	hitsresult ++;
	new hitteename[30];
	GetPlayerName(i,hitteename,30);
    format(string, sizeof(string), "%s(%d) Has a hit contract. Use /loc (id) to locate the target. Contract expires in %d Seconds",hitteename,i,HasHitOnHim[i]);
	SendClientMessage(playerid, 0x00C7FFAA, string);
	}
	}
    if(hitsresult == 0) {
 	SendClientMessage(playerid, 0x00C7FFAA, "There are no hit contracts available right now");
	}
	return 1;
    }
	
   
 	
	if(strcmp(cmd, "/drugs", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_DRGDEL) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Drug Dealer. Type /takedrugs [grams] to take drugs");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot call a Drug Dealer");
    return 1;
    }
    if(gTeam[playerid] == TEAM_ARMY) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot call a Drug Dealer");
    return 1;
    }
    if(gTeam[playerid] == TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"Casino Security agents cannot call a Drug Dealer");
    return 1;
    }
    if (!GetPlayersInTeam(TEAM_DRGDEL)) {
    SendClientMessage(playerid,COLOR_ERROR,"Unable to locate any Drug Dealers. Visit the drug house in LV if you are desperate for some crack");
    return 1;
    }
    if (GetPlayersInTeam(TEAM_DRGDEL) > 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You have called a Drug Dealer");
    }
    
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	 if(IsPlayerConnected(i))
	 {
    if(gTeam[i] == TEAM_DRGDEL) {
    new pname[24];
    GetPlayerName(playerid, pname, 24);
    new current_zone;
    current_zone = player_zone[playerid];
    format(string, sizeof(string), "%s(%d) Has requested a Drug Dealer. Location: %s",pname,playerid,zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_DODGERBLUE, string);
	
	wantsdrugs[playerid] =1;
	}
	}
	}
    return 1;
    }
	

	
    if(strcmp(cmd, "/givedrugs", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_DRGDEL) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Drug Dealer");
    return 1;
    }
    if(solddrugsrecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
    return 1;
    }
    if(PlayerDrugs[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not carrying any drugs. Visit the drug house to get your supply");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /givedrugs (id) [Grams]");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /givedrugs (id) [Grams] ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot sell yourself drugs");
    return 1;
    }
    if(gTeam[giveplayerid] <=2) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot give drugs to a Law Enforcement agent");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /givedrugs (id) [Grams]");
    return 1;
    }
    new gramtogive = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /givedrugs (id) [Grams] Grams must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(gramtogive <=0) {
    SendClientMessage(playerid, COLOR_ERROR, "Minimum amount of grams you can give in one transaction is 1 Gram");
    return 1;
    }
    if(gramtogive >=501) {
    SendClientMessage(playerid, COLOR_ERROR, "Maximum amount of grams you can give in one transaction is 500 Grams");
    return 1;
    }
    if(PlayerDrugs[playerid] < gramtogive) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not carrying that much drugs. Visit the drug house to replenish your supply");
    return 1;
    }
    new dealername[24];
    new buyername[24];
    GetPlayerName(playerid,dealername, 24);
	GetPlayerName(giveplayerid,buyername, 24);
	if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 7) {
    format(string, sizeof(string), "%s(%d) Is not close enough. You cannot deal drugs to that player",buyername,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(wantsdrugs[giveplayerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "That player does not want drugs. Use /selldrugs ID to offer drugs to a player");
    return 1;
 	}
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Drugs Purchased_|");
	format(string, sizeof(string), "Drug Dealer %s(%d) has given you %d grams of drugs. Make sure you pay/have paid the dealer",dealername,playerid,gramtogive);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, string);
    SendClientMessage(giveplayerid, COLOR_DODGERBLUE, "Use /takedrugs (grams) to use drugs. Remember, cops can search you for drugs...try /throwaway in emergency");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Sold_|");
    format(string, sizeof(string), "You have given %s(%d) %d grams of drugs. Make sure you get paid",buyername,giveplayerid,gramtogive);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    PlayerDrugs[playerid] -= gramtogive;
    PlayerDrugs[giveplayerid] += gramtogive;
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    new current_zone;
    current_zone = player_zone[playerid];
    commitedcrimerecently[playerid] +=180;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (DRUG DEALING) Suspected drug deal has taken place - Suspect: %s(%d) Location: %s",dealername,playerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    
    }
    }
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +2 );
    new pcol = GetPlayerColor(playerid);
	plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(DRUG DEALING) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
    return 1;
 	}


	
	if(strcmp(cmd, "/takedrugs", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot take drugs");
    return 1;
    }
    if(gTeam[playerid] == TEAM_ARMY) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot take drugs");
    return 1;
    }
    if(gTeam[playerid] == TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"Casino Security agents cannot take drugs");
    return 1;
    }
    if(playerondrugs[playerid] >= 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are already on drugs. Please wait before taking more");
    return 1;
    }
    if(PlayerDrugs[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not carrying any drugs. Call a dealer with /drugs if you want some crack");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /takedrugs [Grams]");
    return 1;
    }
    new gramstotake = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /takedrugs [Grams] Grams must be a number");
    return 1;
    }
    if(PlayerDrugs[playerid] < gramstotake ) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not carrying that much drugs");
    return 1;
    }
    if(gramstotake <= 0 || gramstotake >=51) {
    SendClientMessage(playerid,COLOR_ERROR,"You can only take drugs between 1 - 50 grams");
    return 1;
    }
	if(gramstotake >=1 && gramstotake <=5) {
    playertookdrugs[playerid] =1;
	playerondrugs[playerid] =15;
	}
	else
	if(gramstotake >=6 && gramstotake <=9) {
	playertookdrugs[playerid] =1;
	playerondrugs[playerid] =30;
	}
	else
	if(gramstotake >=10 && gramstotake <=19) {
	playertookdrugs[playerid] =1;
	playerondrugs[playerid] =45;
	}
	else
	if(gramstotake >=20 && gramstotake <=29) {
	playertookdrugs[playerid] =1;
	playerondrugs[playerid] =60;
	}
	else
	if(gramstotake >=30 && gramstotake <=39) {
	playertookdrugs[playerid] =1;
	playerondrugs[playerid] =120;
	}
	else
	if(gramstotake >=40 && gramstotake <=50) {
    playertookdrugs[playerid] =1;
	playerondrugs[playerid] =180;
	}
	PlayerDrugs[playerid] -= gramstotake;
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Taken_|");
	format(string, sizeof(string), "You are on drugs. You have took %d grams of drugs. Your health will increase while you are on drugs",gramstotake);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    
   	return 1;
 	}

 	if(strcmp(cmd, "/breakcuffs", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] <= 2) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(cuffed[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not handcuffed. You cannot use this command");
    return 1;
    }
    if(CuffedTime[playerid] >= 1) {
	SendClientMessage(playerid, COLOR_ERROR, "Please wait before trying to break the handcuffs");
    return 1;
    }
    new breakcuffsrand = random(100);
 	if(breakcuffsrand >=26 && breakcuffsrand <=100) // Failed
	{
	new escapedname[24];
	GetPlayerName(playerid,escapedname,24);
 	new plwl = GetPlayerWantedLevel(playerid);
	new pcol = GetPlayerColor(playerid);
	SetPlayerWantedLevel(playerid, plwl +1 );
 	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
 	plwl = GetPlayerWantedLevel(playerid);
 	format(string, sizeof(string), "(ATTEMPTED ESCAPE) Wanted Level: %d",plwl);
	SendClientMessage(playerid,pcol,string);
 	SendClientMessage(playerid,COLOR_ERROR,"You have been seen trying to escape from the handcuffs. Attempt failed");
 	format(string, sizeof(string), "%s(%d) Has tried to escape from handcuffs",escapedname,playerid);
 	CuffedTime[playerid] =10;
	printf("%s",string);
	commitedcrimerecently[playerid] +=120;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1 && IsSpawned[i] == 1)
	{
	if(GetDistanceBetweenPlayers(playerid,i) < 25)
	{
    new string1[256];
    new string2[256];
    new current_zone;
    current_zone = player_zone[playerid];
	format(string1, sizeof(string1), "DISPATCH: (ATTEMPTED ESCAPE) %s(%d) Has attempted to escape from handcuffs",escapedname,playerid);
	format(string2, sizeof(string2), "Please respond and secure suspect: %s(%d) - Location: %s",escapedname,playerid,zones[current_zone][zone_name]);
 	SendClientMessage(i, COLOR_ROYALBLUE, string1);
	SendClientMessage(i, COLOR_ROYALBLUE, string2);
	}
	}
	}
    return 1;
    }
    else
    if(breakcuffsrand >=0 && breakcuffsrand <=25) // complete
	{
	TogglePlayerControllable(playerid, 1);
	cuffed[playerid] =0;
	new escapedname[24];
	new plwl = GetPlayerWantedLevel(playerid);
	SetPlayerWantedLevel(playerid, plwl +4 );
	GetPlayerName(playerid,escapedname,24);
	GameTextForPlayer(playerid,"~r~ESCAPED~n~FROM HANDCUFFS",6000,3);
	new pcol = GetPlayerColor(playerid);
    plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(HANDCUFF ESCAPE) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	format(string, sizeof(string), "%s(%d) Has escaped from handcuffs",escapedname,playerid);
	printf("%s",string);
	commitedcrimerecently[playerid] +=360;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1 && IsSpawned[i] == 1)
	{
	if(GetDistanceBetweenPlayers(playerid,i) < 25)
	{
    new string1[256];
    new string2[256];
    new current_zone;
    current_zone = player_zone[playerid];
	format(string1, sizeof(string1), "DISPATCH: (HANDCUFF ESCAPE) %s(%d) Has escaped from handcuffs",escapedname,playerid);
	format(string2, sizeof(string2), "Please respond and take suspect: %s(%d) into custody. Location: %s",escapedname,playerid,zones[current_zone][zone_name]);
 	SendClientMessage(i, COLOR_ROYALBLUE, string1);
	SendClientMessage(i, COLOR_ROYALBLUE, string2);
	}
	}
	}
	}
	return 1;
	}


    if(strcmp(cmd, "/escape", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] <= 2) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1 && InAlcatraz[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You must have a visitor to help you escape from Alcatraz (/breakout)");
    return 1;
    }
    if(Jailed[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are not in jail. You cannot use this command");
    return 1;
    }
    if(JailTime[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are free to go. You cannot escape. Your jail sentence is finnished");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(cannotescapejail[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot attempt to escape jail again");
    return 1;
    }
    if(triedtoescaperecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
    return 1;
    }
    new escaperand = random(5000);
 	if(escaperand >=0 && escaperand <=1000) // Failed
	{
	JailTime[playerid] += 60;
	new jtime;
	jtime = (JailTime[playerid]);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
 	format(string, sizeof(string), "(ATTEMPTED JAIL ESCAPE) Your jail sentence has been increased. Time Remaining: %d Seconds",jtime);
	SendClientMessage(playerid,COLOR_WHITE,string);
 	SendClientMessage(playerid,COLOR_ERROR,"You have failed to escape from jail. You cannot attempt escape again");
 	triedtoescaperecent[playerid] =1;
 	cannotescapejail[playerid] =1;
 	return 1;
 	}
 	else
    if(escaperand >=1001 && escaperand <=3000) // Outside LVPD
	{
	new escapedname[24];
	Jailed[playerid] =0;
	JailTime[playerid] =0;
	cannotescapejail[playerid] =1;
	new plwl = GetPlayerWantedLevel(playerid);
	SetPlayerWantedLevel(playerid, plwl +15 );
	GetPlayerName(playerid,escapedname,24);
	GameTextForPlayer(playerid,"~r~ESCAPED~n~FROM JAIL",6000,3);
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid, 2245.3135,2487.6631,10.8203);
    SetPlayerFacingAngle(playerid,88.3985);
    SetCameraBehindPlayer(playerid);
    EscapedConvict[playerid] =1;
    new pcol = GetPlayerColor(playerid);
    plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(JAIL ESCAPE) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	format(string, sizeof(string), "%s(%d) Has escaped from jail",escapedname,playerid);
	SendClientMessageToAll(0x00C7FFAA,string);
	format(string, sizeof(string), "%s(%d) Has escaped from jail",escapedname,playerid);
	printf("%s",string);
	commitedcrimerecently[playerid] +=360;
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    new string1[256];
    new string2[256];
    new string3[256];
	format(string1, sizeof(string1), "DISPATCH: (JAIL ESCAPE) %s(%d) Has escaped from jail. All units respond",escapedname,playerid);
	format(string2, sizeof(string2), "ALL UNITS: Please respond and take %s(%d) back into custody",escapedname,playerid);
	format(string3, sizeof(string3), "Location: Las Venturas Police Department");
	SendClientMessage(i, COLOR_ROYALBLUE, string1);
	SendClientMessage(i, COLOR_ROYALBLUE, string2);
	SendClientMessage(i, COLOR_DODGERBLUE, string3);
	}
	}
 	return 1;
	}
	else
    if(escaperand >=3001 && escaperand <=5000) // Outside LVPD top entrance
	{
	new escapedname[24];
	Jailed[playerid] =0;
	JailTime[playerid] =0;
	cannotescapejail[playerid] =1;
	new plwl = GetPlayerWantedLevel(playerid);
	SetPlayerWantedLevel(playerid, plwl +15 );
	GetPlayerName(playerid,escapedname,24);
	GameTextForPlayer(playerid,"~r~ESCAPED~n~FROM JAIL",6000,3);
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,2345.3525,2453.4285,14.9742);
    SetPlayerFacingAngle(playerid,181.5988);
    SetCameraBehindPlayer(playerid);
    new pcol = GetPlayerColor(playerid);
    plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(JAIL ESCAPE) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	format(string, sizeof(string), "%s(%d) Has escaped from jail",escapedname,playerid);
	SendClientMessageToAll(0x00C7FFAA,string);
	format(string, sizeof(string), "%s(%d) Has escaped from jail",escapedname,playerid);
	printf("%s",string);
	commitedcrimerecently[playerid] +=360;
	EscapedConvict[playerid] =1;
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    new string1[256];
    new string2[256];
    new string3[256];
    new current_zone;
    current_zone = player_zone[playerid];
	format(string1, sizeof(string1), "DISPATCH: (JAIL ESCAPE) %s(%d) Has escaped from jail. All units respond",escapedname,playerid);
	format(string2, sizeof(string2), "ALL UNITS: Please respond and take %s(%d) back into custody",escapedname,playerid);
	format(string3, sizeof(string3), "Location: %s",zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_ROYALBLUE, string1);
	SendClientMessage(i, COLOR_ROYALBLUE, string2);
	SendClientMessage(i, COLOR_DODGERBLUE, string3);
	}
	}
	}
	return 1;
	}


	if(!strcmp(cmdtext, "/cry", true, 4)) {
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Muted[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You are Muted. You Cannot Use This Command");
    return 1;
    }
    if(HasCried[playerid] >= 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You have cried like a big baby recently. Please wait before crying again");
    return 1;
    }
	new cryer[25];
	GetPlayerName(playerid,cryer,sizeof(cryer));
	format(string, sizeof(string),"* %s(%d) Crys. Get a Tissue!",cryer,playerid);
	SendClientMessageToAll(GetPlayerColor(playerid),string);
	ircSay(EchoConnection, EchoChan,string);
	HasCried[playerid] =10;
	return 1;
	}




    if(strcmp(cmd, "/breakout", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == 1 || gTeam[playerid] == 2 || gTeam[playerid] == 3 || gTeam[playerid] == 5 || gTeam[playerid] == 8) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1 && InAlcatraz[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "The /breakout command can only be used by a visitor at Alcatraz");
    return 1;
    }
    if(Jailed[playerid] == 1 && InAlcatraz[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You must have a visitor to help you escape from Alcatraz use /reqvisit (id)");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /breakout (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /breakout (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new visitorname[30];
    new prisonername[30];
    GetPlayerName(playerid,visitorname,30);
    GetPlayerName(giveplayerid,prisonername,30);
    if(Jailed[giveplayerid] == 0 && InAlcatraz[giveplayerid] == 0) {
	format(string, sizeof(string), "%s(%d) is not in jail",prisonername,giveplayerid);
	SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(Jailed[giveplayerid] == 1 && InAlcatraz[giveplayerid] == 0) {
	format(string, sizeof(string), "Prisoner %s(%d) is not on Alcatraz Island. You can only use /breakout (id) at Alcatraz",prisonername,giveplayerid);
	SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 10) {
    format(string, sizeof(string), "%s(%d) Is too far away. You cannot break this player out of Alcatraz",prisonername,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(cannotescapejail[giveplayerid] == 1) {
    format(string, sizeof(string), "You cannot break this player out of Alcatraz",prisonername,giveplayerid);
	SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    new alctrazescaperand = random(200);
 	if(alctrazescaperand >=100 && alctrazescaperand <=200) // failed
	{
	
	SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Breakout Failed_|");
 	format(string, sizeof(string), "%s(%d) Has attempted to break you out of Alcatraz. Attempt has failed",visitorname,playerid);
	SendClientMessage(giveplayerid,0x00C7FFAA,string);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Breakout Failed_|");
 	format(string, sizeof(string), "Your attempt to break %s(%d) out of Alcatraz has failed",prisonername,giveplayerid);
	SendClientMessage(playerid,0x00C7FFAA,string);
	SendClientMessage(playerid, 0x00C7FFAA, "You have been escorted from the building by security staff");
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,3792.1602,471.8931,36.4192);
	SetPlayerFacingAngle(playerid,89.9220);
	SetCameraBehindPlayer(playerid);
	cannotescapejail[giveplayerid] =1;
 	return 1;
 	}
 	else
    if(alctrazescaperand >=0 && alctrazescaperand <=49) // sewerpipe
	{
	
	Jailed[giveplayerid] =0;
	JailTime[giveplayerid] =0;
	InAlcatraz[giveplayerid] =0;
	cannotescapejail[giveplayerid] =1;
	EscapedConvict[giveplayerid] =1;
	commitedcrimerecently[playerid] +=600;
	commitedcrimerecently[giveplayerid] +=600;
	new plwlv = GetPlayerWantedLevel(playerid);
	new plwlp = GetPlayerWantedLevel(giveplayerid);
	SetPlayerWantedLevel(playerid, plwlv +20 );
	SetPlayerWantedLevel(giveplayerid, plwlp +20 );
	SetPlayerInterior(playerid,0);
	SetPlayerInterior(giveplayerid,0);
	SetPlayerPos(playerid,3785.1953,507.6611,7.3365);
    SetPlayerFacingAngle(playerid,3.2000);
    SetCameraBehindPlayer(playerid);
    SetPlayerPos(giveplayerid,3785.3389,505.0921,7.3384);
    SetPlayerFacingAngle(giveplayerid,3.2000);
    SetCameraBehindPlayer(giveplayerid);
    new pcolv = GetPlayerColor(playerid);
    new pcolp = GetPlayerColor(giveplayerid);
    plwlv = GetPlayerWantedLevel(playerid);
    plwlp = GetPlayerWantedLevel(giveplayerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(AIDING JAIL ESCAPE) Wanted Level %d",plwlv);
	SendClientMessage(playerid,pcolv,string);
	format(string, sizeof(string), "You have helped %s(%d) escape from Alcatraz. You escaped through a sewer pipe",prisonername,giveplayerid);
	SendClientMessage(playerid,pcolv,string);
	SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(JAIL ESCAPE) Wanted Level %d",plwlp);
	SendClientMessage(giveplayerid,pcolp,string);
	format(string, sizeof(string), "Visitor %s(%d) has helped you escape from Alcatraz. You escaped through a sewer pipe",visitorname,playerid);
	SendClientMessage(giveplayerid,pcolp,string);
	format(string, sizeof(string), "%s(%d) has helped %s(%d) escape from Alcatraz",visitorname,playerid,prisonername,giveplayerid);
	SendClientMessageToAll(0x00C7FFAA,string);
	format(string, sizeof(string), "%s(%d) Has helped %s(%d) escape from alcatraz (pipe)",visitorname,playerid,prisonername,giveplayerid);
	printf("%s",string);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    new string1[256];
    new string2[256];
    new string3[256];
    new current_zone;
    current_zone = player_zone[giveplayerid];
	format(string1, sizeof(string1), "DISPATCH: (ALCATRAZ ESCAPE) %s(%d) Has escaped from Alcatraz. ALL UNITS RESPOND",prisonername,giveplayerid);
	format(string2, sizeof(string2), "ALL UNITS: Please respond and take %s(%d) and aider %s(%d) into custody",prisonername,giveplayerid,visitorname,playerid);
	format(string3, sizeof(string3), "Location: %s",zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_ROYALBLUE, string1);
	SendClientMessage(i, COLOR_ROYALBLUE, string2);
	SendClientMessage(i, COLOR_DODGERBLUE, string3);
	}
	}
 	return 1;
	}
	else
    if(alctrazescaperand >=50 && alctrazescaperand <=99) // roof vent
	{

	Jailed[giveplayerid] =0;
	JailTime[giveplayerid] =0;
	InAlcatraz[giveplayerid] =0;
	cannotescapejail[giveplayerid] =1;
	EscapedConvict[giveplayerid] =1;
	commitedcrimerecently[playerid] +=600;
	commitedcrimerecently[giveplayerid] +=600;
	new plwlv = GetPlayerWantedLevel(playerid);
	new plwlp = GetPlayerWantedLevel(giveplayerid);
	SetPlayerWantedLevel(playerid, plwlv +20 );
	SetPlayerWantedLevel(giveplayerid, plwlp +20 );
	SetPlayerInterior(playerid,0);
	SetPlayerInterior(giveplayerid,0);
	SetPlayerPos(playerid,3831.7861,460.3024,56.4060);
    SetPlayerFacingAngle(playerid,292.2207);
    SetCameraBehindPlayer(playerid);
    SetPlayerPos(giveplayerid,3828.9524,460.2530,56.8904);
    SetPlayerFacingAngle(giveplayerid,292.2207);
    SetCameraBehindPlayer(giveplayerid);
    new pcolv = GetPlayerColor(playerid);
    new pcolp = GetPlayerColor(giveplayerid);
    plwlv = GetPlayerWantedLevel(playerid);
    plwlp = GetPlayerWantedLevel(giveplayerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(AIDING ALCATRAZ ESCAPE) Wanted Level %d",plwlv);
	SendClientMessage(playerid,pcolv,string);
	format(string, sizeof(string), "You have helped %s(%d) escape from Alcatraz. You escaped through the air con pipes",prisonername,giveplayerid);
	SendClientMessage(playerid,pcolv,string);
	SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(JAIL ESCAPE) Wanted Level %d",plwlp);
	SendClientMessage(giveplayerid,pcolp,string);
	format(string, sizeof(string), "Visitor %s(%d) has helped you escape from Alcatraz. You escaped through the air con pipes",visitorname,playerid);
	SendClientMessage(giveplayerid,pcolp,string);
	format(string, sizeof(string), "%s(%d) has helped %s(%d) escape from Alcatraz",visitorname,playerid,prisonername,giveplayerid);
	SendClientMessageToAll(0x00C7FFAA,string);
	format(string, sizeof(string), "%s(%d) Has helped %s(%d) escape from alcatraz (vent)",visitorname,playerid,prisonername,giveplayerid);
	printf("%s",string);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    new string1[256];
    new string2[256];
    new string3[256];
    new current_zone;
    current_zone = player_zone[giveplayerid];
	format(string1, sizeof(string1), "DISPATCH: (ALCATRAZ ESCAPE) %s(%d) Has escaped from Alcatraz. ALL UNITS RESPOND",prisonername,giveplayerid);
	format(string2, sizeof(string2), "ALL UNITS: Please respond and take %s(%d) and %s(%d) back into custody",prisonername,giveplayerid,visitorname,playerid);
	format(string3, sizeof(string3), "Location: %s",zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_ROYALBLUE, string1);
	SendClientMessage(i, COLOR_ROYALBLUE, string2);
	SendClientMessage(i, COLOR_DODGERBLUE, string3);
	}
	}
	}
	return 1;
	}


	


	if (strcmp("/me", cmdtext, true, 3) == 0)
    {
    if(IsSpawned[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR, "You are dead. You cannot use this command");
	return 1;
    }
    if(Muted[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You are Muted. You Cannot Use This Command");
    return 1;
    }
    if(strlen(cmdtext) <= 4) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /me texthere");
    return 1;
    }
    new output[200];
    new pname[24];
    GetPlayerName(playerid,pname,24);
    strmid(output,cmdtext,3,strlen(cmdtext));
	new pcol = GetPlayerColor(playerid);
	format(string, sizeof(string), "* %s(%d) - %s",pname,playerid,output);
    SendClientMessageToAll(pcol,string);
    printf("%s",string);
    SpamStrings[playerid] ++;
    return 1;
    }

    if(strcmp(cmd, "/druginfo", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] <= 2) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot carry drugs");
    return 1;
    }
    new pDrugs = (PlayerDrugs[playerid]);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Drugs Info_|");
    format(string, sizeof(string), "You have %d grams of drugs on you",pDrugs);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    SendClientMessage(playerid, 0x00C7FFAA, "Use /takedrugs (grams) to use drugs");
    return 1;
    }
    
    if(strcmp(cmd, "/search", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] >= 3) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Law Enforcement agent");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /search (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /search (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new officername[24];
    new civilname[24];
    GetPlayerName(playerid,officername, 24);
	GetPlayerName(giveplayerid,civilname, 24);
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5) {
    format(string, sizeof(string), "%s(%d) Is not close enough. You cannot search that player for drugs",civilname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    
    if(cuffed[giveplayerid] == 0) {
    format(string, sizeof(string), "%s(%d) Is not handcuffed. Place the suspect in handcuffs before searching for drugs",civilname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsSpawned[giveplayerid] == 0) {
	format(string, sizeof(string), "%s(%d) Is dead. You cannot search a dead body",civilname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. Get the suspect out before searching for drugs",civilname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Suspect Searched_|");
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Law Enforcement Stop Search_|");
    if(PlayerDrugs[giveplayerid] <= 0) {
    format(string, sizeof(string), "%s(%d) Has been searched. No drugs were found",civilname,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    format(string, sizeof(string), "Officer %s(%d) Has searched you for drugs. You are not carrying any drugs. No drugs were found",officername,playerid);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
	}
    if(PlayerDrugs[giveplayerid] >=1 && HasDrugBag[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Has been searched. No drugs were found. The suspect is free to go",civilname,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    format(string, sizeof(string), "Officer %s(%d) Has searched you for drugs. You have a DrugBag. Your drugs were not found",officername,playerid);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
	}
	if(PlayerDrugs[giveplayerid] >=1 && HasDrugBag[giveplayerid] == 0) {
	new drugspossesed = (PlayerDrugs[giveplayerid]);
    format(string, sizeof(string), "%s(%d) Has been searched. You found %d gram(s) of drugs. You have siezed the drugs and receive a £2000 bonus",civilname,giveplayerid,drugspossesed);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    format(string, sizeof(string), "Officer %s(%d) Has searched you for drugs. %d gram(s) of drugs were found and siezed",officername,playerid,drugspossesed);
    SendClientMessage(giveplayerid, COLOR_ERROR, string);
    new plwl = GetPlayerWantedLevel(giveplayerid);
	SetPlayerWantedLevel(giveplayerid, plwl +4 );
	new pcol = GetPlayerColor(giveplayerid);
	plwl = GetPlayerWantedLevel(giveplayerid);
	format(string, sizeof(string), "Officer %s(%d) has searched %s(%d)  - %d gram(s) of drugs were found during the search",officername,playerid,civilname,giveplayerid,drugspossesed);
	SendClientMessageToAll(0x00C7FFAA, string);
    printf("%s", string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(DRUG POSSESION) Wanted Level %d",plwl);
	SendClientMessage(giveplayerid,pcol,string);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	PlayerDrugs[giveplayerid] =0;
	GivePlayerMoney(playerid,2000);
	}
	if(HasC4[giveplayerid] == 1) {
	format(string, sizeof(string), "You have found 3 Blocks of C4 in %s(%d)'s possesion. You have siezed the explosives and receive a £1500 bonus",civilname,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    format(string, sizeof(string), "Officer %s(%d) Has found 3 Blocks of C4 in your possesion. The explosives were siezed",officername,playerid);
    SendClientMessage(giveplayerid, COLOR_ERROR, string);
    new plwl = GetPlayerWantedLevel(giveplayerid);
	SetPlayerWantedLevel(giveplayerid, plwl +4 );
	new pcol = GetPlayerColor(giveplayerid);
	plwl = GetPlayerWantedLevel(giveplayerid);
	format(string, sizeof(string), "Officer %s(%d) has siezed 3 Blocks of C4 from %s(%d)",officername,playerid,civilname,giveplayerid);
	SendClientMessageToAll(0x00C7FFAA, string);
	ircSay(EchoConnection, EchoChan,string);
    printf("%s", string);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(EXPLOSIVES POSSESION) Wanted Level %d",plwl);
	SendClientMessage(giveplayerid,pcol,string);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	HasC4[giveplayerid] =0;
	GivePlayerMoney(playerid,1500);
	}
    return 1;
    }
    


    if(strcmp(cmd, "/fix", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != TEAM_CARFIX) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Car Mechanic");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(fixedcarrecent[playerid] >=1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently. Please wait");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /fix (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /fix (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "Please use /fixme to fix your own vehicle");
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 5) {
    format(string, sizeof(string), "(%d) Is not close enough. You cannot fix that players vehicle engine",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new mname[24];
    new pname[24];
    GetPlayerName(playerid,mname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(!IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) is not in any vehicle",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    
    
    if(GetPlayerState(giveplayerid) == PLAYER_STATE_DRIVER) {
    new tofix = GetPlayerVehicleID(giveplayerid);
    new Float:vHealth;
	GetVehicleHealth(tofix, vHealth);
    if(vHealth > 700) {
    format(string, sizeof(string), "%s(%d)'s vehicle engine does not need fixed",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    
    new mrand = random(2500);
    oscore = GetPlayerScore(playerid);
    SetVehicleHealth(tofix,1000);
	GivePlayerMoney(giveplayerid,-mrand);
	GivePlayerMoney(playerid,mrand);
	SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Vehicle Engine Repaired_|");
	format(string, sizeof(string), "Mechanic %s(%d) has fixed your vehicle engine for $%d",mname,playerid,mrand);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Engine Repaired_|");
    format(string, sizeof(string), "You have fixed %s(%d)s vehicle engine. You earned $%d", pname,giveplayerid,mrand);
    SendClientMessage(playerid,COLOR_DODGERBLUE, string);
    SetPlayerScore(playerid, oscore +1);
    fixedcarrecent[playerid] =60;
    }
    else{
    format(string, sizeof(string), "%s(%d) is not the driver of the vehicle",pname,giveplayerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    }
    return 1;
    }

    if(strcmp(cmd, "/break", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    if(gTeam[playerid] != TEAM_CARFIX) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Car Mechanic");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /break (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /break (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }

    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 3) {
    format(string, sizeof(string), "(%d) Is not close enough. You cannot pour sand into that players vehicle engine",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new mname[24];
    new pname[24];
    GetPlayerName(playerid,mname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(!IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) is not in any vehicle",pname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }

    if(GetPlayerState(giveplayerid) == PLAYER_STATE_DRIVER) {
    if(GetVehicleModel(GetPlayerVehicleID(giveplayerid)) == 481) {
    SendClientMessage(playerid, COLOR_ERROR, "That vehicle does not have any engine, you cannot use this command on that vehicle (BMX Bike)");
    return 1;
    }
    new tobreak = GetPlayerVehicleID(giveplayerid);
    
    SandInEngine[tobreak] =1;
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Sand In Engine_|");
	format(string, sizeof(string), "Mechanic %s(%d) has filled your vehicle engine with sand. GET OUT",mname,playerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Sand In Engine_|");
    format(string, sizeof(string), "You have filled %s(%d)'s vehicle engine with sand", pname,giveplayerid);
    SendClientMessage(playerid,COLOR_DODGERBLUE, string);
    new plwl = GetPlayerWantedLevel(playerid);
	SetPlayerWantedLevel(playerid, plwl +1 );
	commitedcrimerecently[playerid] +=60;
    for(new i=0;i<MAX_PLAYERS;i++)
	{
	 if(IsPlayerConnected(i))
	 {
	  if(LawEnforcementRadio[i] == 1)
	  {
       new current_zone;
       current_zone = player_zone[playerid];
       format(string, sizeof(string), "DISPATCH: (CRIME IN PROGRESS) SUSPECT: %s(%d) CRIME: Criminal Damage LOCATION: %s",mname,playerid,zones[current_zone][zone_name]);
       SendClientMessage(i,COLOR_ROYALBLUE, string);
       }
	  }
	 }
    new pcol = GetPlayerColor(playerid);
	plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(CRIMINAL DAMAGE) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
    }
    else{
    format(string, sizeof(string), "%s(%d) is not the driver of the vehicle",pname,giveplayerid);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    }
    return 1;
    }

    /*if(strcmp(cmd, "/mechanic", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_CARFIX) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a mechanic. Use /fixme to fix your car");
    return 1;
    }
    if(RecentAskedMechanic[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Please wait before asking for a mechanic again");
    return 1;
    }
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(IsPlayerConnected(i))
	{
	if(gTeam[i] == TEAM_CARFIX)
	{
	new pname[24];
    GetPlayerName(playerid,pname, 24);
    new current_zone;
    current_zone = player_zone[playerid];
    format(string, sizeof(string), "%s(%d) is looking for a mechanic. Location: %s", pname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_BLUE, string);
    SendClientMessage(playerid,COLOR_DODGERBLUE,"You have called a mechanic");
    RecentAskedMechanic[playerid] =1;
    }
	else{
    SendClientMessage(playerid,COLOR_DODGERBLUE,"not any mechanic");
    }
    }
    }
	  return 1;
    }*/
 
    if(strcmp(cmd, "/fixme", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(GetPlayerWantedLevel(playerid) >= 4) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you have a warrant (Orange/Red)");
    return 1;
    }
    if(InDerby[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command while you are in the stadium");
    return 1;
    }
    
    if(gTeam[playerid] != TEAM_CARFIX) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a mechanic");
    return 1;
    }
    if(!IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in a vehicle");
    return 1;
    }
    if(fixedcarrecent[playerid] >=1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently. Please wait");
    return 1;
    }
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    new tofix = GetPlayerVehicleID(playerid);
    SetVehicleHealth(tofix, 1000);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Engine Repaired_|");
    SendClientMessage(playerid, 0x00C7FFAA, "You have fixed your vehicle engine");
    fixedcarrecent[playerid] =60;
    }
    else
    SendClientMessage(playerid, COLOR_ERROR, "You need to be driver to fix your own car");
    return 1;
    }
    
    if(strcmp(cmd, "/ccommands", false) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }

        SendClientMessage(playerid,COLOR_ROYALBLUE, "Criminal Commands");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/rob  (id) - Attempt to rob another player");
        SendClientMessage(playerid,COLOR_ROYALBLUE, "/rape (id) - Attempt to rape another player");
        SendClientMessage(playerid,COLOR_ROYALBLUE, "/piss (id) - Attempt to piss in another player");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/robcasino - Attempt to rob a casino");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/robbank - Attempt to rob LV City Bank");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/robatm - Attempt to rob a ATM Machine");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/holdup - Attempt to rob a 24/7 Store");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/robhall - Attempt to rob LV City Hall");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/takedrugs (grams) - Use drugs");

    return 1;
    }

    if(strcmp(cmd, "/gcommands", false) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }

        SendClientMessage(playerid,COLOR_ROYALBLUE, "General Gameplay Commands");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/food - Call a food delivery worker");
        SendClientMessage(playerid,COLOR_ROYALBLUE, "/drugs - Call a drugs dealer");
        SendClientMessage(playerid,COLOR_ROYALBLUE, "/gchall - Give 1600$ to LV City Hall for respect");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/hit (id) (amount) - Place a hit contract on another player");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/gc (id) (amount) - Give another player cash");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/pm (id) (msg) - Send a Personal Message /pmoff - Refuse PMs");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/ej - Eject you from vehicle /ejall - Eject all from vehicle");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/ej (id) - Eject a player from your vehicle");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "/cry - Cry");

    return 1;
    }
    if(strcmp(cmd, "/gchall", true) == 0)
	{
	if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint. You cant give money.");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 89) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint. Cant give money.");
    return 1;
    }
    if(GetPlayerMoney(playerid) <= 1599) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Give Cash Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford 1600$ to LV City Hall.");
			   return 1;
			}
			
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cityhallrobbedrecent <= 1) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Give Money_|");
    SendClientMessage(playerid,COLOR_ERROR,"LV City Hall does not need any money. If LV City Hall is robbed you can give cash.");
	return 1;
 	}
 	     if(respect[playerid] <=19) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Give Money_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have given LV City Hall 2600$!");
		SendClientMessage(playerid,COLOR_WHITE, "You will be respected from LV City Hall now.");
		respect[playerid] +=2;
		GivePlayerMoney(playerid,-2600);
    return 1;
    }
    if(respect[playerid] <=29) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Give Money_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have given LV City Hall 3600$!");
		SendClientMessage(playerid,COLOR_WHITE, "You will be respected from LV City Hall now.");
		respect[playerid] +=3;
		GivePlayerMoney(playerid,-3600);
    return 1;
    }
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Give Money_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have given LV City Hall 1600$!");
		SendClientMessage(playerid,COLOR_WHITE, "You will be respected from LV City Hall now.");
		respect[playerid] +=1;
		GivePlayerMoney(playerid,-1600);
    return 1;
    }
    
    if(strcmp(cmd, "/rchall", true) == 0)
	{
	if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint. You cant get any money.");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 89) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint. You cant get any money");
    return 1;
    }
    if(GetPlayerMoney(playerid) >= 1601) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Take Cash Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You don't need 1600$, you have them.");
			   return 1;
			}
	if(respect[playerid] <=9) {
    SendClientMessage(playerid,COLOR_ERROR,"Your respect level is too low to take any cash from LV City Hall. Type /respect for more info");
    return 1;
    }
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cityhallrobbedrecent >= 1) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Gave Money_|");
    SendClientMessage(playerid,COLOR_ERROR,"LV City Hall does not have any money. If LV City Hall is not robbed you can get some cash.");
	return 1;
 	}
 	if(respect[playerid] <=19) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Gave Money_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have received money from LV City Hall (1600$!)");
		SendClientMessage(playerid,COLOR_WHITE, "You will be respected from LV City Hall now.");
        cityhallrobbedrecent = 240;
		GivePlayerMoney(playerid,1600);
		return 1;
 	}
 	if(respect[playerid] <=29) {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Gave Money_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have received money from LV City Hall (2600$!)");
		SendClientMessage(playerid,COLOR_WHITE, "You will be respected from LV City Hall now.");
        cityhallrobbedrecent = 240;
		GivePlayerMoney(playerid,2600);
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Gave Money_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have received money from LV City Hall (3600$!)");
		SendClientMessage(playerid,COLOR_WHITE, "You will be respected from LV City Hall now.");
        cityhallrobbedrecent = 240;
		GivePlayerMoney(playerid,3600);
    return 1;
    }
    
    if(strcmp(cmd, "/healsec", true) == 0)
	{
	if(GetPlayerMoney(playerid) <= 14999) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Health Secure Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to secure your health ($15000)");
			   return 1;
			}
	if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint.");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 89) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint.");
    return 1;
    }
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Health Secure_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have been charged 15000$.");
		SendClientMessage(playerid,COLOR_WHITE, "You have secured your health. You can't be killed a while now.");
		SetPlayerHealth(playerid,600);
		GivePlayerMoney(playerid,-15000);
    return 1;
    }
    
    if(strcmp(cmd, "/plans", true) == 0)
	{
	if(GetPlayerMoney(playerid) <= 199) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Plans Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to look at the plans ($200)");
			   return 1;
			}
	if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint. You cant look at the plans.");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 89) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall Checkpoint. You cant look at the plans.");
    return 1;
    }
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Plans_|");
		SendClientMessage(playerid,COLOR_WHITE, "You have looked on the plans.");
		SendClientMessage(playerid,COLOR_WHITE, "Plans maked:");
		SendClientMessage(playerid,COLOR_WHITE, "1 - Caligula's Casino.. Type /vp to view the plan.");
		SendClientMessage(playerid,COLOR_GREY, "You were charged 200$.");
		GivePlayerMoney(playerid,-200);
    return 1;
    }

	    if(strcmp(cmd, "/rules", true) == 0) {
    SendClientMessage(playerid, 0x00C7FFAA, "No Random Killing / hit contracts / DeathMatching / TeamKilling");
	SendClientMessage(playerid, 0x00C7FFAA, "No Hacking / Cheating");
	SendClientMessage(playerid, 0x00C7FFAA, "No Bitching");
    return 1;
    }
    
    if(strcmp(cmd, "/hideout", true) == 0) {
    if(gTeam[playerid] != TEAM_COP || gTeam[playerid] != TEAM_ARMY)
    SendClientMessage(playerid, COLOR_GREY, "|_Hideout_|");
	SendClientMessage(playerid, 0x00C7FFAA, "You are a robber and you can find any hideout.");
	if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY)
	SendClientMessage(playerid, COLOR_GREY, "|_Hideout_|");
	SendClientMessage(playerid, 0x00C7FFAA, "You are a cop, you have to find any hideouts of the robbers");
    return 1;
    }
    
    if(strcmp(cmd, "/family", true) == 0) {
    SendClientMessage(playerid, COLOR_GREY, "|_Family Creating_|");
    SendClientMessage(playerid, 0x00C7FFAA, "If you want to create a family you must do these things.");
    SendClientMessage(playerid, 0x00C7FFAA, "1. You must be Mafia to be the leader of a family");
    SendClientMessage(playerid, 0x00C7FFAA, "2. You must have at least 3 friends to make a gang or a family.");
    SendClientMessage(playerid, 0x00C7FFAA, "3. You must have at least 2 friends with morer than 30 robskill.");
SendClientMessage(playerid, 0x00C7FFAA, "If you have all these you can type /gang create.");
    return 1;
    }


     if(strcmp(cmd, "/stopsex", true) == 0) {
TogglePlayerControllable(playerid, 1);
TogglePlayerControllable(giveplayerid, 1);
    return 1;
    }
    if(strcmp(cmd, "/givekeys", false) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /givekeys (id).");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /givekeys (id) ID Must be a number");
    return 1;
    }
    
			   new buyername[24];
               GetPlayerName(giveplayerid,buyername, 24);
			   new boughtcar;
			   GetPlayerName(giveplayerid,buyername,24);
         	   BoughtCars[boughtcar] =999;
         	   BoughtCarsOwner[boughtcar] =giveplayerid;
         	   SendClientMessage(playerid, 0x00C7FFAA, "You have given your carkeys to %s(%d)",buyername);
         	   SendClientMessage(giveplayerid, 0x00C7FFAA, "You have received some car keys");
         	   return 1;
         	   }
    
    
    
    if(strcmp(cmd, "/adjet", true) == 0) {
    if (PlayerAdminLevel[playerid] != 1337)
    {
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
    return 1;
    }
    SendClientMessage(playerid, 0x00C7FFAA, "You are using jetpack. Press f to remove your jetpack");
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
    return 1;
    }
    if(strcmp(cmd, "/sex", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_LAWYER) {
    SendClientMessage(playerid,COLOR_ERROR,"Lawyers cannot have sex with people");
    return 1;
    }
    if(Jailed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot have sex with people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_ARMY) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot have sex with people");
    return 1;
    }
    
    if(gTeam[playerid] == TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"Casino Security agents cannot have sex with people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"Medics cannot have sex with people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_JAILTK) {
    SendClientMessage(playerid,COLOR_ERROR,"Jail Turnkeys cannot have sex with people");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sex (id). Have sex with female/male. People can say you are gay.");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /sex (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot have sex with yourself");
    return 1;
    }
    if(Condom[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot have sex without a condom. Go buy one at stores for 2$");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 2) {
    SendClientMessage(playerid, COLOR_ERROR, "That player is not close enough. You cannot have sex in distance.");
    return 1;
    }
    if(!IsPlayerInAnyVehicle(playerid))
	   {
       SendClientMessage(playerid, COLOR_ERROR, "You must be in a car to have sex!");
       return 1;
    }
    if(!IsPlayerInAnyVehicle(giveplayerid))
	   {
       SendClientMessage(playerid, COLOR_ERROR, "The partner must be with you in the car.");
       return 1;
    }
    new victimname[24];
    GetPlayerName(giveplayerid, victimname, 24);
    format(string, sizeof(string), "%s(%d) - Having sex..",victimname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    Condom[playerid] -=1;
    havingsex[playerid] =20;
    SetCameraBehindPlayer(playerid);
    TogglePlayerControllable(giveplayerid, 0);
    TogglePlayerControllable(playerid, 0);
    if(Condom[playerid] == 0) {
    //new victimname[24];
    GetPlayerName(giveplayerid, victimname, 24);
    format(string, sizeof(string), "%s(%d) - Having sex without condom..",victimname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    havingsex[playerid] =20;
    HIV[playerid] =1;
    HIV[giveplayerid] =1;
    SetCameraBehindPlayer(playerid);
    TogglePlayerControllable(giveplayerid, 0);
    TogglePlayerControllable(playerid, 0);
    return 1;
    }

    
    
    
    return 1;
    }
    if(strcmp(cmd, "/drugnum", true) == 0) {
    SendClientMessage(playerid, COLOR_GREY, "|_Drug Carry_|");
    if(PlayerDrugs[playerid] == 0) {
    SendClientMessage(playerid,COLOR_DODGERBLUE,"You have 0 grams of drugs. Type /drugs to request some crack");
    return 1;
    }
    new drugnum = PlayerDrugs[playerid];
    drugnum = PlayerDrugs[playerid];
    format(string, sizeof(string), "You have %d grams of drugs. Type /takedrugs to take some.",drugnum);
    SendClientMessage(giveplayerid,COLOR_DODGERBLUE, string);
    return 1;
    }

    if(strcmp(cmd, "/bail", true) == 0) {
    if(GetPlayerMoney(playerid) <= 2999) {
    SendClientMessage(playerid, COLOR_GREY, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid, COLOR_ERROR, "You cannot afford 3000$ to LVPD.");
    return 1;
    }
    if(Jailed[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are not at Jail");
    return 1;
    }
    if(InAlcatraz[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You are at Alcatraz Building. You cannot pay your bail.");
    return 1;
    }
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    SendClientMessage(playerid, COLOR_GREY, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid, 0x00C7FFAA, "You have paid your bail. You are free to go.");
	SetPlayerInterior(playerid,3);
                 SetPlayerPos(playerid,210.5272,146.3341,1003.0234);
                 SetPlayerFacingAngle(playerid,179.4662);
                 SetCameraBehindPlayer(playerid);
                 cannotescapejail[playerid] =0;
	GivePlayerMoney(playerid,-3000);
    Jailed[playerid] = 0;
    JailTimeServed[playerid] =0;
    dUserSetINT(PlayerName(playerid)).("jailed",Jailed[playerid]);
    dUserSetINT(PlayerName(playerid)).("jailtime",JailTime[playerid]);
	return 1;
	}
    

    if(strcmp(cmd, "/salehelp", false) == 0) {
    SendClientMessage(playerid, 0x00C7FFAA, "|_House Sale Help_|");
	SendClientMessage(playerid, COLOR_ERROR, "LV Drug House - 250000$ for sale. Type /buyhouse in the checkpoint.");
	SendClientMessage(playerid, COLOR_ERROR, "LV Prickle Pine House - 2,000,000$. House bought by JohnnyBoy");
    return 1;
    }
    if(strcmp(cmd, "/buyhouse", false) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(houseowner[playerid] == 1337) {
    SendClientMessage(playerid, COLOR_ERROR, "You don't need a house if you have one. Type /sellhouse ");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not even near a house to buy it");
    return 1;
    }

    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 26)
    {
               if(GetPlayerMoney(playerid) <= 250000) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_House Buy Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You cannot afford to buy this house (250000)");
			   return 1;
			}

			SendClientMessage(playerid, 0x00C7FFAA, "|_House Bought_|");
	SendClientMessage(playerid, 0x00C7FFAA, "You have bought LV Drug House for 250000$. Your house is like a casino.");
	GivePlayerMoney(playerid,-250000);
 houseowner[giveplayerid] =1337;
    dUserSetINT(PlayerName(giveplayerid)).("houseowner",houseowner[giveplayerid]);
    return 1;
    }
    }
    if(strcmp(cmd, "/sellhouse", false) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(houseowner[playerid] == 0) {
    SendClientMessage(playerid, COLOR_ERROR, "You don't own a house. ");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }

			SendClientMessage(playerid, 0x00C7FFAA, "|_House Sold_|");
	SendClientMessage(playerid, 0x00C7FFAA, "You have Sold LV Drug House for 250000$.");
	GivePlayerMoney(playerid,250000);
 houseowner[giveplayerid] =0;
    dUserSetINT(PlayerName(giveplayerid)).("houseowner",houseowner[giveplayerid]);
    return 1;
    }
    if(strcmp(cmdtext, "/respectcmds", true) == 0 || strcmp(cmdtext, "/rc", true) == 0)
	{
	SendClientMessage(playerid, COLOR_GREY, "|_Respecting Commands_|");
    SendClientMessage(playerid, 0x00C7FFAA, "/gc (ID) [Amount] - Give another player cash[+1 Respect]");
	SendClientMessage(playerid, 0x00C7FFAA, "/gchall - Attemt to give 1600$ to LV City Hall[+1 Respect]");
	SendClientMessage(playerid, 0x00C7FFAA, "/respect - Look at your respect score..");
    return 1;
    }
    if(strcmp(cmdtext, "/regularplayers", true) == 0 || strcmp(cmdtext, "/rpl", true) == 0)
	{
	SendClientMessage(playerid, COLOR_GREY, "|_Regular Players_|");
    SendClientMessage(playerid, 0x00C7FFAA, "JohnnyBoy - [Admin],[Regular Player]");
    SendClientMessage(playerid, 0x00C7FFAA, "Heroid - [Admin]");
    SendClientMessage(playerid, 0x00C7FFAA, "Agoni - [Regular Player]");
    return 1;
    }
    
    if(strcmp(cmd, "/play", true) == 0) {
    new i = 0; i < MAX_PLAYERS;
    TextDrawHideForPlayer(playerid,welcome);
    TextDrawHideForPlayer(playerid,txtTypeSkill);
    TextDrawHideForPlayer(playerid,txtTypeSkill1);
    TextDrawHideForPlayer(playerid,txtTypeSkill2);
    TextDrawHideForPlayer(playerid,txtTypeSkill3);
    return 1;
    }

 if(strcmp(cmd, "/steelcar", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
	//if(IsSpawned[playerid] == 1) {
	//SendClientMessage(playerid, COLOR_ERROR, "This command has been disabled due to upgrades. Check back soon");
    //return 1;
    //}
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] != TEAM_CARJACK) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Car Jacker.");
    return 1;
	}
    if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You need to be in the checkpoint at AutoBahn to attempt to steel a car");
    return 1;
    }
    autobahnowner[playerid]=dUserINT(PlayerName(playerid)).("autobahnowner");
	if(autobahnowner[playerid] == 1337) {
	SendClientMessage(playerid,COLOR_ERROR,"You are the owner of AutoBahn. You cannot steel any vehicle from AutoBahn");
	return 1;
	}

    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 19)
    {
    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Steel Failed_|");
	SendClientMessage(playerid, COLOR_ERROR, "You cannot be in a car when using this command");
    return 1;
	}
	if(GetPlayerWantedLevel(playerid) >= 1) {
			   SendClientMessage(playerid, 0xA9A9A9AA, "|_Vehicle Steel Failed_|");
			   SendClientMessage(playerid, COLOR_ERROR, "You must be innocent to steel a car");
			   return 1;
			}
			   new plwl = GetPlayerWantedLevel(playerid);
			   new buyername[24];
               GetPlayerName(playerid,buyername, 24);
			   new boughtcar;
			   GetPlayerName(playerid,buyername,24);
         	   boughtcar = CreateVehicle(560, 2174.2114,1421.0642,10.5913,91.0247, -1, -1, 99999999999);
         	   BoughtCars[boughtcar] =999;
         	   SetPlayerWantedLevel(playerid,plwl +4);
         	   GivePlayerMoney(playerid,4500);
         	   BoughtCarsOwner[boughtcar] =playerid;
         	   plwl = GetPlayerWantedLevel(playerid);
			   SendClientMessage(playerid, COLOR_GREY, "|_CRIME COMMITED_|");
			   SendClientMessage(playerid, COLOR_ORANGE, "(VEHICLE STOLEN) Wanted Level 4");
			   SendClientMessage(playerid, 0xA9A9A9AA, "You have stolen a Sultan on AutoBahn, 4500$ Bonus");
			   GameTextForPlayer(playerid,"~n~VEHICLE ~r~~n~STOLEN~n~ ~w~FROM AUTOBAHN", 7000,3);
			   PutPlayerInVehicle(playerid, boughtcar, 0);
			   printf("**(CAR PURCHASE)** %s(%d) has stolen a Sultan car from AutoBahn",buyername,playerid);
			   return 1;
			   }
			   }


    if(strcmp(cmd, "/vp", true) == 0) {
    if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
    return 1;
    }
    if(cityhallrobbedrecent >= 1) {
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 89) {
    SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
    return 1;
    }
    SendClientMessage(playerid,COLOR_GREY, "Caligula's Casino Robbing plan.");
    SendClientMessage(playerid,COLOR_WHITE, "'Firstly we need 2 players minimum'");
    SendClientMessage(playerid,COLOR_WHITE, "'From the top of the Caligula's we go to the bottom of Caligula's'");
    SendClientMessage(playerid,COLOR_WHITE, "'1 player stay at the top with a helicopter and waits for the other one till rob the vault'");
    SendClientMessage(playerid,COLOR_WHITE, "This is the Caligula's Casino Robbing Plan.");
    SendClientMessage(playerid,COLOR_WHITE, "If you want to create a plan, you must tell any admins online to add it..");
	return 1;
    }

    
    
    
    
    
    if(strcmp(cmd, "/commands", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    
    SendClientMessage(playerid,COLOR_GREY, "|_Commands_|");
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**GENERAL** /family /sex /food /drugs /gchall /drugs /drugnum /hit /gc /pm /ej /eject (id) /cry");
        SendClientMessage(playerid,COLOR_ROYALBLUE, "**CRIMINAL** /rob /robbank /holdup /robcasino /rape /piss /takedrugs");
        SendClientMessage(playerid,COLOR_ROYALBLUE, "**RESPECT** /gchall /gc");
        SendClientMessage(playerid,COLOR_ROYALBLUE, "**JAIL** /escape /bail /breakout /reqvisit");
       if(gTeam[playerid] == TEAM_COP) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /rp /fine /pu /taze /ar /parole /cuff /search /cuff /radon /refill");
}else if(gTeam[playerid] == TEAM_ARMY) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /rp /su /fine /ar /taze /cuff /search");
}else if(gTeam[playerid] == TEAM_MEDIC) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /heal /cure /healme /cureme");
		}else if(gTeam[playerid] == TEAM_CARFIX) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /fix /break /fixme");
	}else if(gTeam[playerid] == TEAM_CASSEC) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /cuff /cm /radon");
		}else if(gTeam[playerid] == TEAM_DRIVER) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** No command abailable for your job");
		}else if(gTeam[playerid] == TEAM_BISTRO) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /sellfood /sellbadfood");
		}else if(gTeam[playerid] == TEAM_JAILTK) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /parole");
		}else if(gTeam[playerid] == TEAM_LAWYER) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /free /jail");
		}else if(gTeam[playerid] == TEAM_PVTMED) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /heal /cure /healme /cureme /infect");
		}else if(gTeam[playerid] == TEAM_DRGDEL) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /selldrugs /givedrugs /takedrugs");
		}else if(gTeam[playerid] == TEAM_HITMAN) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** No command available for your job");
		}else if(gTeam[playerid] == TEAM_GUNDEL) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /sellweapons /sellweapon");
		}else if(gTeam[playerid] == TEAM_RAPIST) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /rape /piss");
		}else if(gTeam[playerid] == TEAM_BOUNTY) {
		SendClientMessage(playerid,COLOR_ROYALBLUE, "**JOB** /bounty");
}



		return 1;
    }
  /*
    if(strcmp(cmd, "/rape", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_ARMY) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"Casino Security agents cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"Medics cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_JAILTK) {
    SendClientMessage(playerid,COLOR_ERROR,"Jail Turnkeys cannot rape people");
    return 1;
    }
    if(RapedPlyRecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
    return 1;
    }
    if(InBank[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot rape a player inside the bank");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rape (id)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rape (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot rape yourself");
    return 1;
    }

    return 1;
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new rapername[24];
    new victimname[24];
    GetPlayerName(playerid,rapername, 24);
	GetPlayerName(giveplayerid, victimname, 24);

    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 2) {
	format(string, sizeof(string), "%s(%d) Is not close enough. You cannot rape that player",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot rape a prisoner",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(cuffed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is handcuffed. You cannot rob a player who is handcuffed",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. You cannot rape that player",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new Float:victimhealth;
    GetPlayerHealth(giveplayerid,victimhealth);
	if(IsSpawned[giveplayerid] == 0) {
	new plwl = GetPlayerWantedLevel(playerid);
	new pcol = GetPlayerColor(playerid);
    SetPlayerWantedLevel(playerid,plwl +1);
	format(string, sizeof(string), "%s(%d) Has raped %s(%d)'s dead, rotting corpse",rapername,playerid,victimname,giveplayerid);
	SendClientMessageToAll(0xB22222AA, string);
	ircSay(EchoConnection, EchoChan,string);
	SpamStrings[playerid] ++;
	if(Chlamydia[playerid] == 0) {
	format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",rapername,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    Chlamydia[playerid] =1;
	return 1;
	}
	}
	*/

    if(strcmp(cmd, "/rape", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_LAWYER) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a lawyer. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_ARMY) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"Casino Security agents cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"Medics cannot rape people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_JAILTK) {
    SendClientMessage(playerid,COLOR_ERROR,"Jail Turnkeys cannot rape people");
    return 1;
    }
    if(RapedPlyRecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
    return 1;
    }
    if(InBank[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot rape a player inside the bank");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rape (id)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rape (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot rape yourself");
    return 1;
    }
    return 1;
    //giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new rapername[24];
    new victimname[24];
    GetPlayerName(playerid,rapername, 24);
	GetPlayerName(giveplayerid, victimname, 24);

    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 2) {
	format(string, sizeof(string), "%s(%d) Is not close enough. You cannot rape that player",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot rape a prisoner",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(cuffed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is handcuffed. You cannot rob a player who is handcuffed",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. You cannot rape that player",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new Float:victimhealth;
    GetPlayerHealth(giveplayerid,victimhealth);
	if(IsSpawned[giveplayerid] == 0) {
	new plwl = GetPlayerWantedLevel(playerid);
	new pcol = GetPlayerColor(playerid);
    SetPlayerWantedLevel(playerid,plwl +1);
	format(string, sizeof(string), "%s(%d) Has raped %s(%d)'s dead, rotting corpse",rapername,playerid,victimname,giveplayerid);
	SendClientMessageToAll(0xB22222AA, string);
	ircSay(EchoConnection, EchoChan,string);
	SpamStrings[playerid] ++;
	if(Chlamydia[playerid] == 0) {
	format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",rapername,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    Chlamydia[playerid] =1;
    }
    if(Mafia[giveplayerid] == 1337) {
    format(string, sizeof(string), "%s(%d) is a mafia. You can't rape him",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_RED, string);
    format(string, sizeof(string), "%s(%d) has attemtt to rape you. You are mafia and he couldn't rape you.",rapername,playerid);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
    printf("%s(%d) has attempted to rob %s(%d) Wallet Chances: %d",rapername,playerid,victimname,giveplayerid,HasWallet[giveplayerid]);
    PlayerPlaySound(giveplayerid, 1190, 0.0, 0.0, 0.0);
    beenrobbedrecently[giveplayerid] =60;
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Rape Complete_|");
    format(string, sizeof(string), "You have raped %s(%d)'s dead body", victimname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA,string);
    plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(CORPSE RAPE) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	return 1;
    }
    if(gTeam[playerid] == TEAM_RAPIST && victimhealth <=25) {
    SetPlayerHealth(giveplayerid,0);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    format(string, sizeof(string), "%s(%d) Has been raped to death by rapist %s(%d)",victimname,giveplayerid,rapername,playerid);
    SendClientMessageToAll(0xB22222AA, string);
    ircSay(EchoConnection, EchoChan,string);
    new plwl = GetPlayerWantedLevel(playerid);
	new pcol = GetPlayerColor(playerid);
    SetPlayerWantedLevel(playerid,plwl +10);
    plwl = GetPlayerWantedLevel(playerid);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(MURDER) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	format(string, sizeof(string), "~r~RAPED TO DEATH BY~n~~w~%s(%d)",rapername,playerid);
    GameTextForPlayer(giveplayerid,string,5000,3);
    new current_zone;
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (MURDER) Suspect: %s(%d) has murdered %s(%d) Location: %s",rapername,playerid,victimname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    SendClientMessage(i,COLOR_ROYALBLUE,"DISPATCH: All units in the area respond");
    }
    }
    return 1;
    }
    if(gTeam[playerid] == TEAM_RAPIST) {
    new Float:phealth;
    GetPlayerHealth(giveplayerid,phealth);
    SetPlayerHealth(giveplayerid, phealth-10);
    GetPlayerHealth(playerid,phealth);
    SetPlayerHealth(playerid, phealth+10);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    Chlamydia[giveplayerid] =1;
    format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",victimname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    }
    if(gTeam[playerid] != TEAM_RAPIST && Chlamydia[playerid] == 1) {
    Chlamydia[giveplayerid] =1;
    format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",victimname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    format(string, sizeof(string), "You have infected %s(%d) with Chlamydia",victimname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    }
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Rape Victim_|");
    format(string, sizeof(string), "%s(%d) Has raped you",rapername,playerid);
    SendClientMessage(giveplayerid, 0xD2691EAA, string);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Rape Complete_|");
    format(string, sizeof(string), "You have raped %s(%d)", victimname,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    RapedPlyRecent[playerid] =1;
    format(string, sizeof(string), "%s(%d) Has raped %s(%d)",rapername,playerid,victimname,giveplayerid);
	printf("%s", string);
	ircSay(EchoConnection, EchoChan,string);
	PlayerPlaySound(giveplayerid, 1190, 0.0, 0.0, 0.0);
	commitedcrimerecently[playerid] +=120;
    new current_zone;
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (RAPE) Suspect: %s(%d) has raped %s(%d) Location: %s",rapername,playerid,victimname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    if(gTeam[giveplayerid] == TEAM_COP || gTeam[giveplayerid] == TEAM_ARMY) {
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +4 );
    }
    else{
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +2 );
    }
    new pcol = GetPlayerColor(playerid);
	new plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(RAPE) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);


    return 1;
    }

    if(strcmp(cmd, "/piss", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Wait till you exit jail.");
    return 1;
    }
    if(gTeam[playerid] == TEAM_LAWYER) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a lawyer. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot piss people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_ARMY) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot piss people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"Casino Security agents cannot piss people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"Medics cannot piss on people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_JAILTK) {
    SendClientMessage(playerid,COLOR_ERROR,"Jail Turnkeys cannot piss on people");
    return 1;
    }
    if(RapedPlyRecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You can't urinate everytime you want... Please wait");
    return 1;
    }
    if(InBank[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot piss in the bank");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    new rapername[24];
    new victimname[24];
    GetPlayerName(playerid,rapername, 24);
	GetPlayerName(giveplayerid, victimname, 24);
    new plwl = GetPlayerWantedLevel(playerid);
    plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(PUBLIC PISS) Wanted Level %d",plwl);
    SendClientMessage(playerid,0x00C7FFAA,string);
    SetPlayerWantedLevel(playerid,plwl +4);
    RapedPlyRecent[playerid] =1;
    format(string, sizeof(string), "%s ID(%d) has pissed on public area.",rapername,playerid);
    SendClientMessage(playerid,0x00C7FFAA,string);
    return 1;
    }
    
    if(Mafia[giveplayerid] == 1337) {
    new rapername[24];
    new victimname[24];
    GetPlayerName(playerid,rapername, 24);
	GetPlayerName(giveplayerid, victimname, 24);
    format(string, sizeof(string), "%s(%d) is a mafia. You can't piss him",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_RED, string);
    format(string, sizeof(string), "%s(%d) has attemtt to piss you. You are mafia and he couldn't piss you.",rapername,playerid);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
    printf("%s(%d) has attempted to rob %s(%d) Wallet Chances: %d",rapername,playerid,victimname,giveplayerid,HasWallet[giveplayerid]);
    PlayerPlaySound(giveplayerid, 1190, 0.0, 0.0, 0.0);
    beenrobbedrecently[giveplayerid] =60;
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /piss (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot piss on yourself");
        return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) Is not an active player",giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    
    new rapername[24];
    new victimname[24];
    GetPlayerName(playerid,rapername, 24);
	GetPlayerName(giveplayerid, victimname, 24);
	
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 2) {
	format(string, sizeof(string), "%s(%d) Is not close enough. You cannot piss that player",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot piss a prisoner",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(cuffed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is handcuffed. You cannot rob a player who is handcuffed",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. You cannot piss that player",victimname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new Float:victimhealth;
    GetPlayerHealth(giveplayerid,victimhealth);
	if(IsSpawned[giveplayerid] == 0) {
	new plwl = GetPlayerWantedLevel(playerid);
	new pcol = GetPlayerColor(playerid);
    SetPlayerWantedLevel(playerid,plwl +1);
	format(string, sizeof(string), "%s(%d) Has pissed %s(%d)'s dead, rotting corpse",rapername,playerid,victimname,giveplayerid);
	SendClientMessageToAll(0xB22222AA, string);
	ircSay(EchoConnection, EchoChan,string);
	SpamStrings[playerid] ++;
	if(Chlamydia[playerid] == 0) {
	format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",rapername,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    Chlamydia[playerid] =1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Piss Complete_|");
    format(string, sizeof(string), "You have pissed on %s(%d)'s dead body", victimname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA,string);
    plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(CORPSE PISS) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	return 1;
    }
    if(gTeam[playerid] == TEAM_RAPIST && victimhealth <=25) {
    SetPlayerHealth(giveplayerid,0);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    format(string, sizeof(string), "%s(%d) Has been pissed to death by rapist %s(%d)",victimname,giveplayerid,rapername,playerid);
    SendClientMessageToAll(0xB22222AA, string);
    ircSay(EchoConnection, EchoChan,string);
    new plwl = GetPlayerWantedLevel(playerid);
	new pcol = GetPlayerColor(playerid);
    SetPlayerWantedLevel(playerid,plwl +10);
    plwl = GetPlayerWantedLevel(playerid);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(MURDER) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	format(string, sizeof(string), "~r~PISSED TO DEATH BY~n~~w~%s(%d)",rapername,playerid);
    GameTextForPlayer(giveplayerid,string,5000,3);
    new current_zone;
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (MURDER) Suspect: %s(%d) has murdered %s(%d) Location: %s",rapername,playerid,victimname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    SendClientMessage(i,COLOR_ROYALBLUE,"DISPATCH: All units in the area respond");
    }
    }
    return 1;
    }
    if(gTeam[playerid] == TEAM_RAPIST) {
    new Float:phealth;
    GetPlayerHealth(giveplayerid,phealth);
    SetPlayerHealth(giveplayerid, phealth-10);
    GetPlayerHealth(playerid,phealth);
    SetPlayerHealth(playerid, phealth+10);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    Chlamydia[giveplayerid] =1;
    format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",victimname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    }
    if(gTeam[playerid] != TEAM_RAPIST && Chlamydia[playerid] == 1) {
    Chlamydia[giveplayerid] =1;
    format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",victimname,giveplayerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    format(string, sizeof(string), "You have infected %s(%d) with Chlamydia",victimname,giveplayerid);
    SendClientMessage(playerid,0x00C7FFAA, string);
    }
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Piss Victim_|");
    format(string, sizeof(string), "%s(%d) Has Pissed you",rapername,playerid);
    SendClientMessage(giveplayerid, 0xD2691EAA, string);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Piss Complete_|");
    format(string, sizeof(string), "You have Pisssed %s(%d)", victimname,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    RapedPlyRecent[playerid] =1;
    format(string, sizeof(string), "%s(%d) Has pissed %s(%d)",rapername,playerid,victimname,giveplayerid);
	printf("%s", string);
	ircSay(EchoConnection, EchoChan,string);
	PlayerPlaySound(giveplayerid, 1190, 0.0, 0.0, 0.0);
	commitedcrimerecently[playerid] +=120;
    new current_zone;
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (PISS) Suspect: %s(%d) has pissed %s(%d) Location: %s",rapername,playerid,victimname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    if(gTeam[giveplayerid] == TEAM_COP || gTeam[giveplayerid] == TEAM_ARMY) {
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +4 );
    }
    else{
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +2 );
    }
    new pcol = GetPlayerColor(playerid);
	new plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(PISS) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	
	
    return 1;
    }

	
	if(strcmp(cmd, "/rob", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command in jail");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot rob people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_ARMY) {
    SendClientMessage(playerid,COLOR_ERROR,"Law Enforcement agents cannot rob people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_LAWYER) {
    SendClientMessage(playerid,COLOR_ERROR,"Lawyers cannot rob people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_CASSEC) {
    SendClientMessage(playerid,COLOR_ERROR,"Casino Security agents cannot rob people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"Medics cannot rob people");
    return 1;
    }
    if(gTeam[playerid] == TEAM_JAILTK) {
    SendClientMessage(playerid,COLOR_ERROR,"Jail Turnkeys cannot rob people");
    return 1;
    }
    if(RobbedPlyRecent[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"Command used recently... Please wait");
    return 1;
    }
    
    if(InBank[playerid] == 1) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot rob a player inside the bank");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rob (id)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /rob (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot rob yourself");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new rname[24];
    new vname[24];
    GetPlayerName(playerid,rname, 24);
	GetPlayerName(giveplayerid, vname, 24);
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 3) {
    format(string, sizeof(string), "%s(%d) Is not close enough. You cannot rob that player",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot rob a player from inside a vehicle");
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is in jail. You cannot rob a prisoner",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(cuffed[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Is handcuffed. You cannot rob a player who is handcuffed",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(giveplayerid)) {
    format(string, sizeof(string), "%s(%d) Is in a vehicle. You cannot rob that player",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(GetPlayerMoney(giveplayerid) <= 100) {
    format(string, sizeof(string), "%s(%d) Does not have any cash",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(beenrobbedrecently[giveplayerid] >= 1) {
    format(string, sizeof(string), "%s(%d) Has been robbed recently. Please wait",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(HasWallet[giveplayerid] >= 1) {
    HasWallet[giveplayerid] --;
    format(string, sizeof(string), "%s(%d) has got a secure wallet. You failed to rob any of that players cash",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_RED, string);
    format(string, sizeof(string), "%s(%d) has attempted to rob you. Your wallet will keep your cash secure for %d more rob(s)",rname,playerid,HasWallet[giveplayerid]);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
    printf("%s(%d) has attempted to rob %s(%d) Wallet Chances: %d",rname,playerid,vname,giveplayerid,HasWallet[giveplayerid]);
    PlayerPlaySound(giveplayerid, 1190, 0.0, 0.0, 0.0);
    beenrobbedrecently[giveplayerid] =60;
    return 1;
    }
    if(Mafia[giveplayerid] == 1337) {
    HasWallet[giveplayerid] --;
    format(string, sizeof(string), "%s(%d) is a mafia. You can't rob him",vname,giveplayerid);
    SendClientMessage(playerid, COLOR_RED, string);
    format(string, sizeof(string), "%s(%d) has attemtt to rob you. You are mafia and he couldn't rob you.",rname,playerid);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
    printf("%s(%d) has attempted to rob %s(%d) Wallet Chances: %d",rname,playerid,vname,giveplayerid,HasWallet[giveplayerid]);
    PlayerPlaySound(giveplayerid, 1190, 0.0, 0.0, 0.0);
    beenrobbedrecently[giveplayerid] =60;
    return 1;
    }
    new pcash = random(GetPlayerMoney(giveplayerid));
    format(string, sizeof(string), "%s(%d) Has robbed $%d from %s(%d)",rname,playerid,pcash,vname,giveplayerid);
	printf("%s", string);
	ircSay(EchoConnection, EchoChan,string);
    GivePlayerMoney(playerid,pcash);
    GivePlayerMoney(giveplayerid, -pcash);
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Robbery Victim_|");
    format(string, sizeof(string), "%s(%d) Has robbed $%d from you", rname,playerid,pcash);
    SendClientMessage(giveplayerid, 0xD2691EAA, string);
    OldCash[giveplayerid] -=pcash;
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Robbery Complete_|");
    format(string, sizeof(string), "You have robbed $%d from %s(%d)", pcash,vname,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    format(string, sizeof(string), "~w~Robbed by ~n~%s(%d)~n~$%d lost",rname,playerid,pcash);
    GameTextForPlayer(giveplayerid,string,5000,3);
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    format(string, sizeof(string), "~w~Robbed %s(%d)~n~$%d stolen",vname,giveplayerid,pcash);
    GameTextForPlayer(playerid,string,5000,3);
    RobbedPlyRecent[playerid] =1;
    beenrobbedrecently[giveplayerid] =120;
    commitedcrimerecently[playerid] +=120;
    if(robberrank[playerid] >=0 && robberrank[playerid] <=9) {
    SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
	robberrank[playerid] +=1;
    respect[playerid] -=1;
	}
    new current_zone;
    current_zone = player_zone[playerid];
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (ROBBERY) Suspect: %s(%d) has robbed %s(%d) Location: %s",rname,playerid,vname,giveplayerid,zones[current_zone][zone_name]);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    if(gTeam[giveplayerid] == TEAM_COP || gTeam[giveplayerid] == TEAM_ARMY) {
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +4 );
    }
    else{
    new plwl = GetPlayerWantedLevel(playerid);
    SetPlayerWantedLevel(playerid, plwl +2 );
    }
    new pcol = GetPlayerColor(playerid);
	new plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(ROBBERY) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	
    return 1;
    }

    
	 
	 if(strcmp(cmdtext,"/loc ",true,5) == 0 && strlen(cmdtext) > 5) {
	  new target, current_zone;
	  target = strval(cmdtext[5]);
      if(!IsNumeric(cmdtext[5])) {
      SendClientMessage(playerid, COLOR_ERROR, "USAGE: /loc (id) ID Must be a number");
      return 1;
      }
	  if(GetPlayerColor(target) == COLOR_DEADCONNECT) {
	  SendClientMessage(playerid,COLOR_ERROR,"That player is dead");
	  return 1;
	}
	  current_zone = player_zone[target];
	//  printf("D1: %d %d",target,current_zone);
	  if(current_zone != -1 && IsPlayerConnected(target)) {
	   new playername[MAX_PLAYER_NAME],message2[256];
	   GetPlayerName(target,playername,MAX_PLAYER_NAME);
	   format(message2,sizeof(message2),"%s(%d)'s current location: %s",playername,target,zones[current_zone][zone_name]);
	   SendClientMessage(playerid,0x00C7FFAA,message2);
	//   printf("D2: %s %s",playername,message);
	  } else {
	   SendClientMessage(playerid,COLOR_ERROR,"Invalid Player ID");
	  }
	  return 1;
	 } else if(strcmp(cmdtext,"/loc",true,4) == 0 && strlen(cmdtext) <= 4) {
	  SendClientMessage(playerid,COLOR_ERROR,"USAGE: /loc (id)");
	  return 1;
	 }


    if(strcmp(cmd, "/reqvisit", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 0 && InAlcatraz[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in jail. You can only use this command while you are in jail (Alcatraz)");
    return 1;
    }
    if(Jailed[playerid] == 1 && InAlcatraz[playerid] == 0) {
    SendClientMessage(playerid,COLOR_ERROR,"You can only request a visit if you are in jail on Alcatraz Island");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /reqvisit (id)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /reqvisit (id) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot give yourself a visiting pass");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new sendername[24];
    new receivername[24];
    GetPlayerName(playerid,sendername, 24);
	GetPlayerName(giveplayerid,receivername, 24);
    if(gTeam[giveplayerid] <= 2) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot send a visiting pass to Police or Army Officers");
    return 1;
    }
    if(IsSpawned[giveplayerid] == 0) {
	format(string, sizeof(string), "%s(%d) is dead. You cannot give a visiting pass to a dead body",receivername,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    if(Jailed[giveplayerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"That player is in jail. You cannot give a visiting pass to a prisoner");
    return 1;
    }
    if(VisitReq[giveplayerid] == 1) {
    format(string, sizeof(string), "%s(%d) Already has a visiting pass from you or another inmate",receivername,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }
    else
    if(VisitReq[giveplayerid] == 0) {
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Alcatraz Island Visit Pass Received_|");
    format(string, sizeof(string), "Alcatraz prisoner %s(%d) has sent you a visiting pass",sendername,playerid);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
    SendClientMessage(giveplayerid, 0x00C7FFAA, "This pass will get you inside Alcatraz building. The pass is valid for 5 game hours");
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Alcatraz Island Visit Pass Sent_|");
    format(string, sizeof(string), "You have sent a Alcatraz visiting pass to %s(%d) - This pass is valid for 5 game hours",receivername,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    VisitReq[giveplayerid] =1;
    VisitReqExpires[giveplayerid] =300;
    }
    return 1;
    }


	if(strcmp(cmd, "/gc", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
    SendClientMessage(playerid,COLOR_ERROR,"You are handcuffed. You cannot use this command");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /gc (id) (amount)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /gc (id) (amount) ID Must be a number");
    return 1;
    }
    if(strval(tmp) == playerid) {
    SendClientMessage(playerid, COLOR_ERROR, "You cannot send cash to yourself");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid)) {
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new sendername[24];
    new receivername[24];
    GetPlayerName(playerid,sendername, 24);
	GetPlayerName(giveplayerid,receivername, 24);
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 8) {
    format(string, sizeof(string), "%s(%d) Is not close enough. You cannot give cash to that player",receivername,giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /gc (id) (amount)");
    return 1;
    }
    if(!IsNumeric(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /gc (id) (amount) Amount must be a number");
    return 1;
    }
    new cashsend = strval(tmp);
    if(cashsend <= 0 || cashsend >= 100001) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: Minimum $1 / Maximum $100000");
    return 1;
    }
    if(GetPlayerMoney(giveplayerid) + cashsend >= 1000001) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Cash Send Failed_|");
	format(string, sizeof(string), "%s(%d) Does not have enough pockets to carry that ammount of cash ",receivername,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    return 1;
    }
    if(GetPlayerMoney(playerid) >= cashsend) {
    GivePlayerMoney(playerid,-cashsend);
    GivePlayerMoney(giveplayerid,cashsend);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Cash Sent_|");
	format(string, sizeof(string), "You have sent $%d to %s(%d)",cashsend,receivername,giveplayerid);
	format(string, sizeof(string), "Your respect has been increased.",cashsend,receivername,giveplayerid);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    respect[playerid] +=1;
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "|_Cash Received_|");
    SendClientMessage(giveplayerid, 0xA9A9A9AA, "If you think that this might be hacked cash then inform a Server Admin asap! /report (id) (reason)");
	format(string, sizeof(string), "%s(%d) Has sent you $%d",sendername,playerid,cashsend);
    SendClientMessage(giveplayerid, 0x00C7FFAA, string);
    format(string, sizeof(string), "Sender %s(%d) Has sent $%d to receiver %s(%d)",sendername,playerid,cashsend,receivername,giveplayerid);
    printf("%s",string);
    ircSay(EchoConnection, EchoChan,string);
	}
    else
    if(GetPlayerMoney(playerid) < cashsend) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Cash Send Failed_|");
    format(string, sizeof(string), "You cannot afford to send $%d",cashsend);
    SendClientMessage(playerid, COLOR_ERROR, string);
    }

    return 1;
    }
    if(strcmp(cmdtext, "/respect", true) == 0)
	{
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Respect Information_|");
 format(string, sizeof(string), "Your current Respect level is: %d",respect[playerid]);
    SendClientMessage(playerid, COLOR_GREY, string);
    SendClientMessage(playerid,COLOR_GREY,"Robbing will lose your respect");
	if(respect[playerid] <= 0) {
    SendClientMessage(playerid,0x00C7FFAA,"Don't rob but try to respect people. Type /commands to look at the respecting commands.");
    return 1;
    }
    else
    if(respect[playerid] >= 1 && respect[playerid] <= 9) {
    SendClientMessage(playerid,0x00C7FFAA,"You are learning respecting. Soon you will be able to take 1600$ from LV City Hall (10)");
    return 1;
    }
	else
    if(respect[playerid] >= 10 && respect[playerid] <= 19) {
    SendClientMessage(playerid,0x00C7FFAA,"You can now take 1600$ from LV City Hall. Soon you will be able to take 2600$ (20)");
return 1;
	}
    else
    if(respect[playerid] >= 20 && respect[playerid] <= 29) {
    SendClientMessage(playerid,0x00C7FFAA,"You can now take 2600$ from LV City Hall. Soon you will be able to take 3600$ (30)");
return 1;
	}
    else
    if(respect[playerid] >= 29) {
    {
    SendClientMessage(playerid,0x00C7FFAA,"You arrived the top level of respect skill. You can now take 3600$ from LV City Hall");
return 1;
	}
	return 1;
    }
    }
   
    if(strcmp(cmdtext, "/robskill", true) == 0)
	{
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Robber Skill Information_|");
 format(string, sizeof(string), "Your current Robbing Skill level is: %d",robberrank[playerid]);
    SendClientMessage(playerid, COLOR_GREY, string);
	if(robberrank[playerid] == 0) {
    SendClientMessage(playerid,0x00C7FFAA,"You are a failing pick pocket. You need to start robbing some players");
    }
    else
    if(robberrank[playerid] >= 1 && robberrank[playerid] <= 9) {
    SendClientMessage(playerid,0x00C7FFAA,"You are a learning pick pocket. You will soon be able to rob ATM machines (Target Skill Level: 10)");
    }
	else
    if(robberrank[playerid] >= 10 && robberrank[playerid] <= 19) {
    SendClientMessage(playerid,0x00C7FFAA,"You are a ATM Machines Fraudster. (Target Skill Level: 20)");
    }
	else
    if(robberrank[playerid] >= 20 && robberrank[playerid] <= 29) {
    SendClientMessage(playerid,0x00C7FFAA,"You are a Experienced Fraudster. You can rob the casino(s) now (Target Skill Level: 30)");
    }
	else
    if(robberrank[playerid] >= 30 && robberrank[playerid] <= 39) {
    SendClientMessage(playerid,0x00C7FFAA,"You are too good. Robbing the bank will be easy now. (Target Skill Level: 40)");
    }
	else
    if(robberrank[playerid] == 40) {
    SendClientMessage(playerid,0x00C7FFAA,"You are very good. Try more. (Target Skill Level: 50)");
    }
    else
    if(robberrank[playerid] == 50) {
    SendClientMessage(playerid,0x00C7FFAA,"You are the most famous robber. You must rob city hall now. (Target Skill Level: 60)");
    }
    else
    if(robberrank[playerid] == 60) {
    SendClientMessage(playerid,0x00C7FFAA,"Wow, you are like Tony Montana. Now is easy to rob stores (Target Skill Level: 70)");
    }
    else
    if(robberrank[playerid] == 70) {
    SendClientMessage(playerid,0x00C7FFAA,"You can now rob the Caligula's Casino. Soon you will be mafia, means, nobody can't rob, piss or rape you (Target Skill Level: 80)");
    }
    if(robberrank[playerid] == 80) {
    SendClientMessage(playerid,0x00C7FFAA,"You are mafia. Nobody can rob, piss or rape you. You reached the maximum robbing skill level: 80)");
	}
	return 1;
    }
        if(strcmp(cmdtext, "/about", true) == 0)
	{
	SendClientMessage(playerid, COLOR_GREY, "|_Server Information_|");
	SendClientMessage(playerid, 0xA9A9A9AA, "This server is modified from the Las Venturas Roleplay/Cops/Robber");
	SendClientMessage(playerid, 0xA9A9A9AA, "It is modified by JohnnyBoy, and Hosted by Igor13");
    SendClientMessage(playerid, 0xA9A9A9AA, "In this server have new commands, you will notice that.");
    SendClientMessage(playerid, 0xA9A9A9AA, "Don't forgot to visit our HomePage www.sa-rcr.page.tl");
	return 1;
    }
	
	
	

	if(strcmp(cmdtext, "/time", true) == 0)
	{
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Game Time / Day Information_|");
	format(string, sizeof(string), "Game Time: %d:00", gametime);
	SendClientMessage(playerid,0x5F9EA0AA,string);
	if(gameday == 1) {
	SendClientMessage(playerid,0x5F9EA0AA,"Game Day: Monday");
	}
	if(gameday == 2) {
	SendClientMessage(playerid,0x5F9EA0AA,"Game Day: Tuesday");
	}
	if(gameday == 3) {
	SendClientMessage(playerid,0x5F9EA0AA,"Game Day: Wednesday");
	}
	if(gameday == 4) {
	SendClientMessage(playerid,0x5F9EA0AA,"Game Day: Thursday");
	}
	if(gameday == 5) {
	SendClientMessage(playerid,0x5F9EA0AA,"Game Day: Friday");
	}
	if(gameday == 6) {
	SendClientMessage(playerid,0x5F9EA0AA,"Game Day: Saturday");
	}
	if(gameday == 7) {
	SendClientMessage(playerid,0x5F9EA0AA,"Game Day: Sunday");
	}
	return 1;
    }

	////// INFO COMMAND Returns player team skill
    if(strcmp(cmdtext, "/info", true) == 0)
	{
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Personal Information_|");
	if(gTeam[playerid] == TEAM_COP) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Police Officer");
    }
    else
    if(gTeam[playerid] == TEAM_ARMY) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Army");
	}
	else
    if(gTeam[playerid] == TEAM_MEDIC) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Medic");
	}
	else
    if(gTeam[playerid] == TEAM_CARFIX) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Car Mechanic");
	}
	else
    if(gTeam[playerid] == TEAM_CASSEC) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Casino Security");
	}
	else
    if(gTeam[playerid] == TEAM_DRIVER) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Taxi Driver");
	}
	else
    if(gTeam[playerid] == TEAM_BISTRO) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Food Delivery");
	}
	else
    if(gTeam[playerid] == TEAM_JAILTK) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Jail Turnkey");
	}
	else
    if(gTeam[playerid] == TEAM_PVTMED) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Private Medic");
	}
	else
    if(gTeam[playerid] == TEAM_CIVIL) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: You are a nobody, If you have chosen a skill already then report this bug asap");
	}
	else
    if(gTeam[playerid] == TEAM_DRGDEL) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Drug Dealer");
	}
	else
    if(gTeam[playerid] == TEAM_HITMAN) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Hitman");
	}
	else
    if(gTeam[playerid] == TEAM_GUNDEL) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Gun Dealer");
	}
	else
	if(gTeam[playerid] == TEAM_RAPIST) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Rapist");
	}
	else
	if(gTeam[playerid] == TEAM_BOUNTY) {
	SendClientMessage(playerid, 0x00C7FFAA,"Skill/Job: Bounty Hunter");
	}
	if(gTeam[playerid] !=TEAM_COP && gTeam[playerid] !=TEAM_ARMY && gTeam[playerid] !=TEAM_MEDIC)
	{
	new wantedlevelo = GetPlayerWantedLevel(playerid);
	format(string, sizeof(string), "Wanted Level: %d",wantedlevelo);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    }
    if(HasHitOnHim[playerid] >= 1) {
    format(string, sizeof(string), "There is a hit contract on you. Expires in %d Seconds",HasHitOnHim[playerid]);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    }
	if(HasHitOnHim[playerid] == 0) {
    SendClientMessage(playerid, 0x00C7FFAA,"There are no hit contracts on you");
    }
    if(HasWallet[playerid] >= 1) {
    format(string, sizeof(string), "Secure Wallet: You can be robbed %d more time(s)",HasWallet[playerid]);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    }
    if(HasWallet[playerid] == 0) {
    format(string, sizeof(string), "Secure Wallet: You do not have a Secure Wallet",HasWallet[playerid]);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    }
    if(HasC4[playerid] == 1) {
    SendClientMessage(playerid, 0x00C7FFAA,"C4 Explosives: You have 3 blocks of C4 in your possesion");
    }
    if(HasC4[playerid] == 0) {
    SendClientMessage(playerid, 0x00C7FFAA,"C4 Explosives: You are not carrying any C4");
    }
    if(BankRobInsurance[playerid] == 1) {
    SendClientMessage(playerid, 0x00C7FFAA,"Bank Cash Theft Insurance: Yes");
    }
    if(BankRobInsurance[playerid] == 0) {
    SendClientMessage(playerid, 0x00C7FFAA,"Bank Cash Theft Insurance: No");
    }
    if(UsedBankRecently[playerid] >= 1) {
    format(string, sizeof(string), "You can use the bank again in %d seconds",UsedBankRecently[playerid]);
    SendClientMessage(playerid, 0x00C7FFAA, string);
    }
    return 1;
    }  
    

    if(strcmp(cmdtext, "/atmloc", true) == 0) {
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_ATM Machine Locations_|");
    SendClientMessage(playerid, 0x808080AA, "WhiteWood Estates (Burger Shot)");
    SendClientMessage(playerid, 0x808080AA, "Starfish Casino (24/7)");
    SendClientMessage(playerid, 0x808080AA, "South LV (East of Ammunation)");
    SendClientMessage(playerid, 0x808080AA, "Roca Escalante");
    return 1;
    }
    
     
    if(strcmp(cmdtext, "/bonus", true) == 0)
	{
	if(BonusCars[1] == 0 && BonusCars[2] == 0)
	{
    SendClientMessage(playerid, 0x4682B4AA, "Both bonus vehicles (Bullet / NRG500) are still waiting to be found and sold at AutoBahn for $50000 each");
    return 1;
    }
    if(BonusCars[1] == 1 && BonusCars[2] == 0)
	{
    SendClientMessage(playerid, 0x4682B4AA, "Only one bonus car remains to be sold this week (Bullet) Find it and sell it at AutoBahn for $50000");
    return 1;
    }
    if(BonusCars[1] == 0 && BonusCars[2] == 1)
	{
    SendClientMessage(playerid, 0x4682B4AA, "Only one bonus car remains to be sold this week (Nrg500) Find it and sell it at AutoBahn for $50000");
    return 1;
    }
    else {
    SendClientMessage(playerid, 0x4682B4AA, "Both bonus cars have been sold");
    }
     return 1;
    }
    
   

    if(strcmp(cmdtext, "/radon", true) == 0)
	{
	if(HasLawEnforcementRadio[playerid] == 0) {
	SendClientMessage(playerid,COLOR_WHITE,"You dont have a police radio");
	return 1;
    }
	if(LawEnforcementRadio[playerid] == 1) {
	SendClientMessage(playerid,COLOR_WHITE,"Radio is already on");
	return 1;
    }
    if(LawEnforcementRadio[playerid] == 0) {
	SendClientMessage(playerid,COLOR_WHITE,"Radio is now on. You will receive alerts from dispatch about crimes");
	LawEnforcementRadio[playerid] = 1;
	}
	return 1;
    }
    

    if(strcmp(cmdtext, "/radoff", true) == 0)
	{
	if(HasLawEnforcementRadio[playerid] == 0) {
	SendClientMessage(playerid,COLOR_WHITE,"You dont have a police radio");
	return 1;
    }
    if(LawEnforcementRadio[playerid] == 0) {
	SendClientMessage(playerid,COLOR_WHITE,"Radio is already off");
	return 1;
    }
	if(LawEnforcementRadio[playerid] == 1) {
	SendClientMessage(playerid,COLOR_WHITE,"Radio is now off");
	LawEnforcementRadio[playerid] = 0;
	}
	return 1;
    }

    if(strcmp(cmdtext, "/buyheal", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Medic. Use /healme or /cureme");
    return 1;
    }
    if(gTeam[playerid] == TEAM_PVTMED) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Private Medic. Use /healme or /cureme");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 24) {
	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
 	return 1;
 	}
    if(GetPlayerMoney(playerid) <= 999 && IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You cannot afford this Medical Service {$1000)");
 	return 1;
 	}
 	new Float:health;
    GetPlayerHealth(playerid, health);
 	if(health == 100) {
 	SendClientMessage(playerid,COLOR_ERROR,"You do not have any injuries");
 	return 1;
 	}
	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 24) {
	{
	SetPlayerHealth(playerid,100);
    GameTextForPlayer(playerid, "~g~HEALED", 6000, 3);
    GivePlayerMoney(playerid,-1000);
    SendClientMessage(playerid,COLOR_FORESTGREEN,"You have purchased Medical services. You have been charged $1000.");
    }
    }
	else
    SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
	}
	
	if(strcmp(cmdtext, "/buychlamydia", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 24) {
	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
 	return 1;
 	}
    if(Chlamydia[playerid] == 1) {
 	SendClientMessage(playerid,COLOR_ERROR,"You do not have any infections");
 	return 1;
 	}
 	if(GetPlayerMoney(playerid) <= 4449 && IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You cannot afford this Medical service {$4500)");
 	return 1;
 	}
	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 24) {
	{
	Chlamydia[playerid] =0;
	Salmonella[playerid] =0;
	GameTextForPlayer(playerid, "~w~YOU HAVE BEEN~r~INFECTED~w~ WITH ~r~CHLAMYDIA", 6000, 3);
    GivePlayerMoney(playerid,-4500);
    SendClientMessage(playerid,COLOR_FORESTGREEN,"You have purchased Medical services. You have been charged $4500.");
    }
    }
	else
    SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
	}
	
	if(strcmp(cmdtext, "/buycure", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Medic. Use /healme or /cureme");
    return 1;
    }
    if(gTeam[playerid] == TEAM_PVTMED) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Private Medic. Use /healme or /cureme");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 24) {
	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
 	return 1;
 	}
    if(Chlamydia[playerid] == 0 && Salmonella[playerid] == 0 && IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You do not have any infections");
 	return 1;
 	}
 	if(GetPlayerMoney(playerid) <= 4449 && IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You cannot afford this Medical service {$4500)");
 	return 1;
 	}
	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 24) {
	{
	Chlamydia[playerid] =0;
	Salmonella[playerid] =0;
	GameTextForPlayer(playerid, "~g~INFECTIONS~n~CURED", 6000, 3);
    GivePlayerMoney(playerid,-4500);
    SendClientMessage(playerid,COLOR_FORESTGREEN,"You have purchased Medical services. You have been charged $4500.");
    }
    }
	else
    SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
	}




    if(strcmp(cmdtext, "/buyhc", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(!IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
    }
    if(gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Medic. Use /healme or /cureme");
    return 1;
    }
    if(gTeam[playerid] == TEAM_PVTMED) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a Private Medic. Use /healme or /cureme");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 24) {
	SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
 	return 1;
 	}
    if(Chlamydia[playerid] == 0 && IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You do not have any infections");
 	return 1;
 	}
 	new Float:health;
    GetPlayerHealth(playerid, health);
 	if(health == 100) {
 	SendClientMessage(playerid,COLOR_ERROR,"You do not have any injuries");
 	return 1;
 	}
 	if(GetPlayerMoney(playerid) <= 4999 && IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_ERROR,"You cannot afford this Medical service {$5000)");
 	return 1;
 	}
	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 24) {
	{
	Chlamydia[playerid] =0;
	SetPlayerHealth(playerid,100);
    GameTextForPlayer(playerid, "~g~INFECTION CURED~n~HEALED", 6000, 3);
    GivePlayerMoney(playerid,-5000);
    SendClientMessage(playerid,COLOR_FORESTGREEN,"You have purchased Medical services. You have been charged $5000");
    }
    }
	else
    SendClientMessage(playerid,COLOR_ERROR,"You are not at Las Venturas hospital");
    return 1;
	}

	/*if(strcmp(cmdtext, "/throwaway", true) == 0 || strcmp(cmdtext, "/ta", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_[RCR] Roleplay Cops Robbers Business Owners_|");
    new autobahnownername[24];
    new autobahnowneronline =0;
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
			autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
				autobahnowneronline ++;
				GetPlayerName(i,autobahnownername,24);
			}
		}
	}
			if(autobahnowneronline == 1)
			{
                format(string, sizeof(string), "Business: [AutoBahn] Owner: [%s]",autobahnownername);
				SendClientMessage(playerid,0x00C7FFAA, string);
			}
			else
			if(autobahnowneronline == 0)
		    {


*/











































	if(strcmp(cmdtext, "/businessowners", true) == 0 || strcmp(cmdtext, "/bo", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    SendClientMessage(playerid, 0xA9A9A9AA, "|_[RCR] Roleplay Cops Robbers Business Owners_|");
    new autobahnownername[24];
    new autobahnowneronline =0;
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
			autobahnowner[i]=dUserINT(PlayerName(i)).("autobahnowner");
			if(autobahnowner[i] == 1337)
			{
				autobahnowneronline ++;
				GetPlayerName(i,autobahnownername,24);
			}
		}
	}
			if(autobahnowneronline == 1)
			{
                format(string, sizeof(string), "Business: [AutoBahn] Owner: [%s]",autobahnownername);
				SendClientMessage(playerid,0x00C7FFAA, string);
			}
			else
			if(autobahnowneronline == 0)
		    {
				SendClientMessage(playerid,0x00C7FFAA,"Business: [AutoBahn] Owner: [OFFLINE]");
			}
  	return 1;
    }


    if(strcmp(cmdtext, "/robhall", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command while you are handcuffed");
    return 1;
    }
	if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall robbing checkpoint");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 89) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Hall robbing checkpoint");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY || gTeam[playerid] == TEAM_MEDIC || gTeam[playerid] == TEAM_CASSEC || gTeam[playerid] == TEAM_JAILTK) {
	SendClientMessage(playerid,COLOR_ERROR,"You cannot rob LV City Hall");
	return 1;
 	}
 	if(robberrank[playerid] <=49) {
    SendClientMessage(playerid,COLOR_ERROR,"Your robber skill level is too low to rob LV City Hall. Type /robskill for more info");
    return 1;
    }
 	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 89)
    {
    if(cityhallrobbedrecent >= 1) {
    SendClientMessage(playerid,COLOR_ERROR,"LV City Hall has been robbed recently. Try again later");
	return 1;
 	}
 	new challrand = random(100);
 	if(challrand >=0 && challrand <=10) {
 	SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Robbery Failed_|");
 	SendClientMessage(playerid,COLOR_ERROR,"Your attempt to rob LV City Hall has failed");
 	return 1;
 	}
    if(challrand >=11 && challrand <=100)
	{
        new hallrobbber[30];
        new pcol = GetPlayerColor(playerid);
        GetPlayerName(playerid,hallrobbber,30);
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4);
		robbinghall[playerid] =15;
		SendClientMessage(playerid,0x00C7FFAA,"You are now robbing LV City Hall. The Police have been dispatched and will be on route right now");
		SendClientMessage(playerid,0x00C7FFAA,"Stay in the checkpoint to complete the robbery...");
		plwl = GetPlayerWantedLevel(playerid);
		cityhallrobbedrecent = 240;
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(LV CITY HALL ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
		commitedcrimerecently[playerid] +=120;
		printf("%s(%d) has started a LV City Hall robbery",hallrobbber,playerid);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
		format(string1, sizeof(string1), "DISPATCH: (ROBBERY IN PROGRESS) Suspect: %s(%d)",hallrobbber,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to LV City Hall and arrest %s(%d)",hallrobbber,playerid);
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
	    }
	    }
	    }
	    }
		return 1;
 	}





	if(strcmp(cmdtext, "/holdup", true) == 0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(cuffed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command while you are handcuffed");
    return 1;
    }
	if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in any store main checkpoint");
    return 1;
    }
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 46) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in any store checkpoint");
    return 1;
    }
    if(robberrank[playerid] <=59) {
    SendClientMessage(playerid,COLOR_ERROR,"Your robber skill level is too low to rob Store. Type /robskill for more info");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY || gTeam[playerid] == TEAM_MEDIC || gTeam[playerid] == TEAM_CASSEC || gTeam[playerid] == TEAM_JAILTK) {
	SendClientMessage(playerid,COLOR_ERROR,"You cannot rob any store");
	return 1;
 	}
 	if(GetPlayerVirtualWorld(playerid) == 0) {
	SendClientMessage(playerid,COLOR_ERROR,"You cannot rob this store. You can only rob 24/7 stores at gas stations in LV");
 	return 1;
 	}
 	new roobrand = random(5000);
 	if(roobrand >=0 && roobrand <=50) {
 	SendClientMessage(playerid, 0xA9A9A9AA, "|_Store Robbery Failed_|");
 	SendClientMessage(playerid,COLOR_ERROR,"Your attempt to rob the store has failed");
 	TextDrawHideForPlayer(playerid,service);
 	return 1;
 	}
 	else
    if(roobrand >=51 && roobrand <=5000)
	{
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 46)
    {
		if(GetPlayerVirtualWorld(playerid) == 1 && twofoursevenrobbed1 >= 1) {
		SendClientMessage(playerid,COLOR_ERROR,"This store has been robbed recently. Try again later");
		TextDrawHideForPlayer(playerid,service);
 		return 1;
 	}
        if(GetPlayerVirtualWorld(playerid) == 1 && twofoursevenrobbed1 == 0) {
        new robbber[30];
        new pcol = GetPlayerColor(playerid);
        GetPlayerName(playerid,robbber,30);
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4);
		robbingstore[playerid] =24;
		twofoursevenrobbed1 = 240;
		SendClientMessage(playerid,0x00C7FFAA,"Starting robbery. The Police have been advised and will be dispatched to this store");
		SendClientMessage(playerid,0x00C7FFAA,"Stay in the checkpoint to complete the robbery...");
		TextDrawHideForPlayer(playerid,service);
		plwl = GetPlayerWantedLevel(playerid);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(24/7 STORE ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
		commitedcrimerecently[playerid] +=120;
		printf("%s(%d) has started a 24/7 robbery in Redsands East",robbber,playerid);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
		format(string1, sizeof(string1), "DISPATCH: (STORE ROBBERY IN PROGRESS) Suspect: %s(%d)", robbber,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the 24/7 store in Redsands East and arrest %s(%d)", robbber,playerid);
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
	    }
	    }
		return 1;
 	}
 	
 		if(GetPlayerVirtualWorld(playerid) == 2 && twofoursevenrobbed2 >= 1) {
		SendClientMessage(playerid,COLOR_ERROR,"This store has been robbed recently. Try again later");
 		return 1;
 	}
        if(GetPlayerVirtualWorld(playerid) == 2 && twofoursevenrobbed2 == 0) {
        new robbber[30];
        new pcol = GetPlayerColor(playerid);
        GetPlayerName(playerid,robbber,30);
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4);
		robbingstore[playerid] =24;
		twofoursevenrobbed2 = 240;
		SendClientMessage(playerid,0x00C7FFAA,"Starting robbery. The Police have been advised and will be dispatched to this store");
		SendClientMessage(playerid,0x00C7FFAA,"Stay in the checkpoint to complete the robbery...");
		plwl = GetPlayerWantedLevel(playerid);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(24/7 STORE ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
		commitedcrimerecently[playerid] +=120;
		if(robberrank[playerid] <=39) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
		printf("%s(%d) has started a 24/7 robbery in Emerald Isle",robbber,playerid);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
		format(string1, sizeof(string1), "DISPATCH: (STORE ROBBERY IN PROGRESS) Suspect: %s(%d)", robbber,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the 24/7 store in Emerald Isle and arrest %s(%d)", robbber,playerid);
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
	    }
	    }
		return 1;
 	}
 	
 		if(GetPlayerVirtualWorld(playerid) == 3 && twofoursevenrobbed3 >= 1) {
		SendClientMessage(playerid,COLOR_ERROR,"This store has been robbed recently. Try again later");
 		return 1;
 	}
        if(GetPlayerVirtualWorld(playerid) == 3 && twofoursevenrobbed3 == 0) {
        new robbber[30];
        new pcol = GetPlayerColor(playerid);
        GetPlayerName(playerid,robbber,30);
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4);
		robbingstore[playerid] =24;
		twofoursevenrobbed3 = 240;
		SendClientMessage(playerid,0x00C7FFAA,"Starting robbery. The Police have been advised and will be dispatched to this store");
		SendClientMessage(playerid,0x00C7FFAA,"Stay in the checkpoint to complete the robbery...");
		plwl = GetPlayerWantedLevel(playerid);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(24/7 STORE ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
		commitedcrimerecently[playerid] +=120;
		if(robberrank[playerid] <=39) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
		printf("%s(%d) has started a 24/7 robbery in South East Las Venturas",robbber,playerid);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
		format(string1, sizeof(string1), "DISPATCH: (STORE ROBBERY IN PROGRESS) Suspect: %s(%d)", robbber,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the 24/7 store in South East Las Venturas and arrest %s(%d)", robbber,playerid);
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
	    }
	    }
		return 1;
 	}
 	
 	
 	
 		if(GetPlayerVirtualWorld(playerid) == 4 && twofoursevenrobbed4 >= 1) {
		SendClientMessage(playerid,COLOR_ERROR,"This store has been robbed recently. Try again later");
 		return 1;
 	}
        if(GetPlayerVirtualWorld(playerid) == 4 && twofoursevenrobbed4 == 0) {
        new robbber[30];
        new pcol = GetPlayerColor(playerid);
        GetPlayerName(playerid,robbber,30);
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4);
		robbingstore[playerid] =27;
		twofoursevenrobbed4 = 240;
		SendClientMessage(playerid,0x00C7FFAA,"Starting robbery. The Police have been advised and will be dispatched to this store");
		SendClientMessage(playerid,0x00C7FFAA,"Stay in the checkpoint to complete the robbery...");
		plwl = GetPlayerWantedLevel(playerid);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(24/7 STORE ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
		commitedcrimerecently[playerid] +=120;
		if(robberrank[playerid] <=39) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
		printf("%s(%d) has started a 24/7 robbery in South Las Venturas",robbber,playerid);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
		format(string1, sizeof(string1), "DISPATCH: (STORE ROBBERY IN PROGRESS) Suspect: %s(%d)", robbber,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the 24/7 store in South Las Venturas and arrest %s(%d)", robbber,playerid);
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
	    }
	    }
		return 1;
 	}
 	
 		if(GetPlayerVirtualWorld(playerid) == 5 && twofoursevenrobbed5 >= 1) {
		SendClientMessage(playerid,COLOR_ERROR,"This store has been robbed recently. Try again later");
 		return 1;
 	}
        if(GetPlayerVirtualWorld(playerid) == 5 && twofoursevenrobbed5 == 0) {
        new robbber[30];
        new pcol = GetPlayerColor(playerid);
        GetPlayerName(playerid,robbber,30);
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4);
		robbingstore[playerid] =24;
		twofoursevenrobbed5 = 240;
		SendClientMessage(playerid,0x00C7FFAA,"Starting robbery. The Police have been advised and will be dispatched to this store");
		SendClientMessage(playerid,0x00C7FFAA,"Stay in the checkpoint to complete the robbery...");
		plwl = GetPlayerWantedLevel(playerid);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(24/7 STORE ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
		commitedcrimerecently[playerid] +=120;
		if(robberrank[playerid] <=39) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
		printf("%s(%d) has started a 24/7 robbery in Bone County",robbber,playerid);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
		format(string1, sizeof(string1), "DISPATCH: (STORE ROBBERY IN PROGRESS) Suspect: %s(%d)", robbber,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the 24/7 store in Bone County and arrest %s(%d)", robbber,playerid);
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
	    }
	    }
		return 1;
 	}
 	
 	
  		if(GetPlayerVirtualWorld(playerid) == 6 && twofoursevenrobbed6 >= 1) {
		SendClientMessage(playerid,COLOR_ERROR,"This store has been robbed recently. Try again later");
 		return 1;
 	}
        if(GetPlayerVirtualWorld(playerid) == 6 && twofoursevenrobbed6 == 0) {
        new robbber[30];
        new pcol = GetPlayerColor(playerid);
        GetPlayerName(playerid,robbber,30);
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4);
		robbingstore[playerid] =24;
		twofoursevenrobbed6 = 240;
		SendClientMessage(playerid,0x00C7FFAA,"Starting robbery. The Police have been advised and will be dispatched to this store");
		SendClientMessage(playerid,0x00C7FFAA,"Stay in the checkpoint to complete the robbery...");
		plwl = GetPlayerWantedLevel(playerid);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(24/7 STORE ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
		commitedcrimerecently[playerid] +=120;
		if(robberrank[playerid] <=39) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
		printf("%s(%d) has started a 24/7 robbery in Spiny Bed",robbber,playerid);
		for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
		format(string1, sizeof(string1), "DISPATCH: (STORE ROBBERY IN PROGRESS) Suspect: %s(%d)", robbber,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the 24/7 store in Spiny Bed and arrest %s(%d)", robbber,playerid);
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
	    }
	    }
	    }
		}
		}
		return 1;
 	}
 	
    if(strcmp(cmdtext, "/robcasino", true) == 0)
	{
	if(gTeam[playerid] == TEAM_LAWYER) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a lawyer. You cannot use this command");
    return 1;
    }
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(Jailed[playerid] == 1) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
	if(!IsPlayerInCheckpoint(playerid)) {
    SendClientMessage(playerid,COLOR_ERROR,"You are not in any casino checkpoint");
    return 1;
    }
    if(RobbedCasRecent[playerid] == 1) {
	SendClientMessage(playerid,COLOR_ERROR,"Please wait before robbing the casino again");
    return 1;
    }
    if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY || gTeam[playerid] == TEAM_MEDIC || gTeam[playerid] == TEAM_CASSEC || gTeam[playerid] == TEAM_JAILTK) {
	SendClientMessage(playerid,COLOR_ERROR,"You cannot rob any casino");
	return 1;
 	}
 	if(robberrank[playerid] <=19) {
    SendClientMessage(playerid,COLOR_ERROR,"Your robber skill level is too low to rob any Casino. Type /robskill for more info");
    return 1;
    }
 	new zrand = random(5000);
 	if(zrand >=0 && zrand <=1000) {
 	SendClientMessage(playerid, 0xA9A9A9AA, "|_Robbery Failed_|");
 	SendClientMessage(playerid,COLOR_ERROR,"Your attempt to rob the casino has failed");
 	RobbedCasRecent[playerid] =1;
 	return 1;
 	}
 	else
    if(zrand >=1001 && zrand <=5000)
	{
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 21) {
    {
		if(FourDragsRobbed == 1) {
		SendClientMessage(playerid,COLOR_ERROR,"Four Dragons casino has been robbed recently, Please wait");
        return 1;
        }
		
	    new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4 );
	    new mrand = random(125000);
	    new pname[30];
		GetPlayerName(playerid, pname, 30);
	    format(string, sizeof(string), "%s(%d) Has robbed $%d from the Four Dragons casino",pname,playerid,mrand);
		SendClientMessageToAll(0x00C7FFAA, string);
		ircSay(EchoConnection, EchoChan,string);
		format(string, sizeof(string), "%s(%d) Has robbed $%d from the Four Dragons casino",pname,playerid,mrand);
		printf("%s", string);
		format(string, sizeof(string), "~w~ROBBERY ~b~COMPLETE~n~~w~YOU ROBBED~n~~r~ $%d~n~~w~FROM THE CASINO", mrand);
		GameTextForPlayer(playerid, string, 7000, 3);
		new pcol = GetPlayerColor(playerid);
  		plwl = GetPlayerWantedLevel(playerid);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(CASINO ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
	    GivePlayerMoney(playerid, mrand);
	    RobbedCasRecent[playerid] =1;
	    oscore = GetPlayerScore(playerid);
	    SetPlayerScore(playerid, oscore +1);
        FourDragsRobbed =1;
        respect[playerid] -=1;
        if(robberrank[playerid] >=20 && robberrank[playerid] <=29) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
        commitedcrimerecently[playerid] +=360;
	    SetTimer("FourDragsRobbedRecent",70000,0);
	    for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
        new string3[256];
		format(string1, sizeof(string1), "DISPATCH: (CASINO ROBBERY) The Four Dragons casino has been robbed. Suspect: %s(%d)", pname,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the Four Dragons casino");
		format(string3, sizeof(string3), "Type /radoff to turn your Law Enforcement radio off");
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
		SendClientMessage(i, COLOR_DODGERBLUE, string3);
	    }
	    }
		}
        return 1;
 	    }
        if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 23) {
        {
        if(GetPlayerVirtualWorld(playerid) == 6)
        {
        SendClientMessage(playerid,COLOR_WHITE,"You can't rob your house..");
        return 1;
        }
        if(GetPlayerVirtualWorld(playerid) == 1)
        {
        if(newcasinoRobbed == 1) {
		SendClientMessage(playerid,COLOR_ERROR,"Casino has been robbed recently, Please wait");
        return 1;
        }
        new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4 );
	    new mrand = random(200000);
	    new pname[30];
		GetPlayerName(playerid, pname, 30);
	    format(string, sizeof(string), "%s(%d) Has robbed $%d from Ndriqimi's Casino",pname,playerid,mrand);
		SendClientMessageToAll(0x00C7FFAA, string);
		ircSay(EchoConnection, EchoChan,string);
		format(string, sizeof(string), "%s(%d) Has robbed $%d from Ndriqimi's Casino",pname,playerid,mrand);
		printf("%s", string);
		format(string, sizeof(string), "~w~ROBBERY ~b~COMPLETE~n~~w~YOU ROBBED~n~~r~ $%d~n~~w~FROM THE NDRIQIMI's CASINO", mrand);
		GameTextForPlayer(playerid, string, 7000, 3);
		new pcol = GetPlayerColor(playerid);
		plwl = GetPlayerWantedLevel(playerid);
        SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(CASINO ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
	    GivePlayerMoney(playerid, mrand);
	    oscore = GetPlayerScore(playerid);
	    SetPlayerScore(playerid, oscore +1);
	    RobbedCasRecent[playerid] =1;
	    newcasinoRobbed =1;
	    respect[playerid] -=1;
	    if(robberrank[playerid] >=20 && robberrank[playerid] <=29) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
	    commitedcrimerecently[playerid] +=360;
	    SetTimer("newcasinorobbedrecent",70000,0);
	    for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
        new string3[256];
		format(string1, sizeof(string1), "DISPATCH: (CASINO ROBBERY) Casino has been robbed. Suspect: %s(%d)", pname,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to Casino");
		format(string3, sizeof(string3), "Type /radoff to turn your Law Enforcement radio off");
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
		SendClientMessage(i, COLOR_DODGERBLUE, string3);
		}
		}
		return 1;
 	    }
		if(GetPlayerVirtualWorld(playerid) == 0)
        {
        if(RedsandsRobbed == 1) {
		SendClientMessage(playerid,COLOR_ERROR,"Casino has been robbed recently, Please wait");
        return 1;
        }
	    new plwl = GetPlayerWantedLevel(playerid);
	    SetPlayerWantedLevel(playerid, plwl +4 );
	    new mrand = random(100000);
	    new pname[30];
		GetPlayerName(playerid, pname, 30);
	    format(string, sizeof(string), "%s(%d) Has robbed $%d from the Redsands Casino",pname,playerid,mrand);
		SendClientMessageToAll(0x00C7FFAA, string);
		ircSay(EchoConnection, EchoChan,string);
		format(string, sizeof(string), "%s(%d) Has robbed $%d from the Redsands casino",pname,playerid,mrand);
		printf("%s", string);
		format(string, sizeof(string), "~w~ROBBERY ~b~COMPLETE~n~~w~YOU ROBBED~n~~r~ $%d~n~~w~FROM THE CASINO", mrand);
		GameTextForPlayer(playerid, string, 7000, 3);
		new pcol = GetPlayerColor(playerid);
		plwl = GetPlayerWantedLevel(playerid);
        SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
		format(string, sizeof(string), "(CASINO ROBBERY) Wanted Level %d",plwl);
		SendClientMessage(playerid,pcol,string);
	    GivePlayerMoney(playerid, mrand);
	    oscore = GetPlayerScore(playerid);
	    SetPlayerScore(playerid, oscore +1);
	    RobbedCasRecent[playerid] =1;
	    RedsandsRobbed =1;
	    respect[playerid] -=1;
	    if(robberrank[playerid] >=20 && robberrank[playerid] <=29) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
	    commitedcrimerecently[playerid] +=360;
	    SetTimer("RedsandsRobbedRecent",70000,0);
	    for(new i=0;i<MAX_PLAYERS;i++)
		{
        if(LawEnforcementRadio[i] == 1) {
        new string1[256];
        new string2[256];
        new string3[256];
		format(string1, sizeof(string1), "DISPATCH: (CASINO ROBBERY) The Redsands casino has been robbed. Suspect: %s(%d)", pname,playerid);
		format(string2, sizeof(string2), "ALL UNITS: Please respond to the Redsands casino");
		format(string3, sizeof(string3), "Type /radoff to turn your Law Enforcement radio off");
		SendClientMessage(i, COLOR_ROYALBLUE, string1);
		SendClientMessage(i, COLOR_ROYALBLUE, string2);
		SendClientMessage(i, COLOR_DODGERBLUE, string3);
		}
		}
		}
		}
		}
		}
        return 1;
        }

		if(strcmp(cmdtext, "/prepc4", true) == 0)
		{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(Jailed[playerid] == 1) {
		SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
    	if(gTeam[playerid] == 1 || gTeam[playerid] == 2 || gTeam[playerid] == 3 || gTeam[playerid] == 4 || gTeam[playerid] == 5 || gTeam[playerid] == 6 || gTeam[playerid] == 7 || gTeam[playerid] == 8) {
		SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command");
		return 1;
		}
		if(!IsPlayerInCheckpoint(playerid)) {
    	SendClientMessage(playerid,COLOR_ERROR,"You are not in the checkpoint at the vault in Caligulas Casino");
    	return 1;
    	}
    	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 45) {
    	SendClientMessage(playerid,COLOR_ERROR,"You are not in the checkpoint at the vault in Caligulas Casino");
    	return 1;
    	}
    	if(robberrank[playerid] <=69) {
    	SendClientMessage(playerid,COLOR_ERROR,"Your robber skill level is too low to rob Caligula's Vault. Type /robskill for more info");
    	return 1;
    	}
    	if(HasC4[playerid] == 0) {
    	SendClientMessage(playerid,COLOR_ERROR,"You do not have any C4 - Goto the bomb shop in Redsands to buy some C4 for $1500");
    	return 1;
    	}
    	if(caligsbeingrobbed == 1337) {
    	SendClientMessage(playerid,COLOR_ERROR,"Another player is already robbing the vault");
    	return 1;
    	}
    	if(CaligsRobbed == 1) {
    	SendClientMessage(playerid,COLOR_ERROR,"The vault has been robbed recently. Try again later");
    	return 1;
    	}
    	if(RobbedCasRecent[playerid] == 1) {
		SendClientMessage(playerid,COLOR_ERROR,"Please wait before robbing the casino again");
    	return 1;
    	}
    	for(new i = 0; i < MAX_PLAYERS; i++)
		{
		if(RobbedCaligs[i] == 1337)
		{
		RobbedCaligs[i] =0;
		}
		}
    	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 45) {
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Preparing the C4_|");
    	SendClientMessage(playerid,0x00C7FFAA,"You will begin to plant the C4 in a second..");
    	SendClientMessage(playerid,0x00C7FFAA,"Once the third block is planted, you should get away from the bombs");
    	TogglePlayerControllable(playerid, 0);
    	PlantingC4[playerid] =1;
    	HasC4[playerid] =0;
    	caligsbeingrobbed =1337;
    	SetTimer("PlantC4One",2000,0);
    	}
       	return 1;
    	}
    	
        if(strcmp(cmdtext, "/robatm", true) == 0)
		{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(Jailed[playerid] == 1) {
		SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
		if(!IsPlayerInCheckpoint(playerid)) {
    	SendClientMessage(playerid,COLOR_ERROR,"You are not in any LV City ATM checkpoint");
    	return 1;
    	}
    	if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY || gTeam[playerid] == TEAM_MEDIC || gTeam[playerid] == TEAM_CASSEC || gTeam[playerid] == TEAM_JAILTK || gTeam[playerid] == TEAM_LAWYER || gTeam[playerid] == TEAM_DRIVER) {
		SendClientMessage(playerid,COLOR_ERROR,"You cannot rob any ATM");
		return 1;
    	}
        if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 27 && getCheckpointType(playerid) != 28 && getCheckpointType(playerid) != 29 && getCheckpointType(playerid) != 30) {
		SendClientMessage(playerid,COLOR_ERROR,"You are not in any LV City ATM checkpoint");
    	return 1;
    	}
    	if(robberrank[playerid] <=9) {
    	SendClientMessage(playerid,COLOR_ERROR,"Your robber skill level is too low to rob any ATM machine. Type /robskill for more info");
    	return 1;
    	}
    	if(atmnetworkrobbedrecent >=1) {
    	SendClientMessage(playerid,COLOR_ERROR,"The ATM network has been robbed recently. Try again later");
    	return 1;
    	}
        if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 29)
		{
		if(GetPlayerWantedLevel(playerid) >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You must be innocent to attempt to rob the ATM");
		return 1;
    	}
    	if(atmcash1 <=99999) {
    	SendClientMessage(playerid,COLOR_ERROR,"Your attempt to rob the ATM has failed");
    	UsedBankRecently[playerid] += 60;
    	return 1;
    	}
		if(atmcash1 >=100000)
		{
    	new atmrobrand = random(55000);
    	if(GetPlayerMoney(playerid) + atmrobrand >= 1000001) {
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Robbery Failed_|");
		format(string, sizeof(string), "You cannot fit $%d more in your pockets! Deposit some cash into your bank account",atmrobrand);
    	SendClientMessage(playerid, COLOR_ERROR, string);
    	return 1;
    	}
    	new atmrobbername[30];
    	GetPlayerName(playerid,atmrobbername,30);
    	new plwl = GetPlayerWantedLevel(playerid);
	    new pcol = GetPlayerColor(playerid);
        SetPlayerWantedLevel(playerid,plwl +4);
        plwl = GetPlayerWantedLevel(playerid);
        SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	    format(string, sizeof(string), "(ATM BANK ROBBERY) Wanted Level %d",plwl);
        SendClientMessage(playerid,pcol,string);
        format(string, sizeof(string), "You have robbed the LV City Bank ATM. You robbed a total of $%d",atmrobrand);
        SendClientMessage(playerid,0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has robbed $%d from  the ATM in Whitewood Estates",atmrobbername,playerid,atmrobrand);
        SendClientMessageToAll(0x00C7FFAA, string);
        ircSay(EchoConnection, EchoChan,string);
	   	printf("%s",string);
	   	GivePlayerMoney(playerid,atmrobrand);
	   	commitedcrimerecently[playerid] +=120;
        oscore = GetPlayerScore(playerid);
	    SetPlayerScore(playerid, oscore +1);
        Playerrobbedbankrecent[playerid] = 1100;
        UsedBankRecently[playerid] += 1200;
        RobbedBank[playerid] = 1337;
        atmnetworkrobbedrecent =200;
        if(robberrank[playerid] >=10 && robberrank[playerid] <=19) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
        atmcash1 -=atmrobrand;
        for(new j=0;j<MAX_PLAYERS;j++)
	    {
        if(LawEnforcementRadio[j] == 1) {
        format(string, sizeof(string), "DISPATCH: (ATM ROBBERY) Suspect: %s(%d) Location: Whitewood Estates",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	format(string, sizeof(string), "DISPATCH: **ATTENTION ALL UNITS** Please respond to Whitewood Estates - (ATM ROBBERY) Suspect: %s(%d)",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	SendClientMessage(j, COLOR_DODGERBLUE, "Type /radoff to turn your Law Enforcement radio off");
    	}
	    }
	    }
	    }

	    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 30)
		{
		if(commitedcrimerecently[playerid] >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You have commited crime recently. Please wait..");
		return 1;
    	}
    	if(atmcash2 <=99999) {
    	SendClientMessage(playerid,COLOR_ERROR,"Your attempt to rob the ATM has failed");
    	UsedBankRecently[playerid] += 120;
    	return 1;
    	}
		if(atmcash2 >=100000)
		{
    	new atmrobrand = random(55000);
    	if(GetPlayerMoney(playerid) + atmrobrand >= 1000001) {
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Robbery Failed_|");
		format(string, sizeof(string), "You cannot fit $%d more in your pockets! Deposit some cash into your bank account",atmrobrand);
    	SendClientMessage(playerid, COLOR_ERROR, string);
    	return 1;
    	}
    	new atmrobbername[30];
    	GetPlayerName(playerid,atmrobbername,30);
    	new plwl = GetPlayerWantedLevel(playerid);
	    new pcol = GetPlayerColor(playerid);
        SetPlayerWantedLevel(playerid,plwl +4);
        plwl = GetPlayerWantedLevel(playerid);
        SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	    format(string, sizeof(string), "(ATM BANK ROBBERY) Wanted Level %d",plwl);
        SendClientMessage(playerid,pcol,string);
        format(string, sizeof(string), "You have robbed the LV City Bank ATM. You robbed a total of $%d",atmrobrand);
        SendClientMessage(playerid,0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has robbed $%d from  the ATM in Roca Escalante",atmrobbername,playerid,atmrobrand);
        SendClientMessageToAll(0x00C7FFAA, string);
        ircSay(EchoConnection, EchoChan,string);
	   	printf("%s",string);
	   	GivePlayerMoney(playerid,atmrobrand);
	   	commitedcrimerecently[playerid] +=120;
        oscore = GetPlayerScore(playerid);
	    SetPlayerScore(playerid, oscore +1);
        Playerrobbedbankrecent[playerid] = 1100;
        UsedBankRecently[playerid] += 1200;
        RobbedBank[playerid] = 1337;
        atmnetworkrobbedrecent =200;
        if(robberrank[playerid] >=10 && robberrank[playerid] <=19) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
        atmcash2 -=atmrobrand;
        for(new j=0;j<MAX_PLAYERS;j++)
	    {
        if(LawEnforcementRadio[j] == 1) {
        format(string, sizeof(string), "DISPATCH: (ATM ROBBERY) Suspect: %s(%d) Location: Roca Escalante",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	format(string, sizeof(string), "DISPATCH: **ATTENTION ALL UNITS** Please respond to Roca Escalante - (ATM ROBBERY) Suspect: %s(%d)",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	SendClientMessage(j, COLOR_DODGERBLUE, "Type /radoff to turn your Law Enforcement radio off");
    	}
	    }
	    }
	    }
	    
	    
	    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 27)
		{
		if(GetPlayerWantedLevel(playerid) >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You must be innocent to attempt to rob the ATM");
		return 1;
    	}
    	if(atmcash3 <=99999) {
    	SendClientMessage(playerid,COLOR_ERROR,"Your attempt to rob the ATM has failed");
    	UsedBankRecently[playerid] += 120;
    	return 1;
    	}
		if(atmcash3 >=100000)
		{
    	new atmrobrand = random(55000);
    	if(GetPlayerMoney(playerid) + atmrobrand >= 1000001) {
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Robbery Failed_|");
		format(string, sizeof(string), "You cannot fit $%d more in your pockets! Deposit some cash into your bank account",atmrobrand);
    	SendClientMessage(playerid, COLOR_ERROR, string);
    	return 1;
    	}
    	new atmrobbername[30];
    	GetPlayerName(playerid,atmrobbername,30);
    	new plwl = GetPlayerWantedLevel(playerid);
	    new pcol = GetPlayerColor(playerid);
        SetPlayerWantedLevel(playerid,plwl +4);
        plwl = GetPlayerWantedLevel(playerid);
        SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	    format(string, sizeof(string), "(ATM BANK ROBBERY) Wanted Level %d",plwl);
        SendClientMessage(playerid,pcol,string);
        format(string, sizeof(string), "You have robbed the LV City Bank ATM. You robbed a total of $%d",atmrobrand);
        SendClientMessage(playerid,0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has robbed $%d from  the ATM at the Starfish Casino",atmrobbername,playerid,atmrobrand);
        SendClientMessageToAll(0x00C7FFAA, string);
        ircSay(EchoConnection, EchoChan,string);
	   	printf("%s",string);
	   	GivePlayerMoney(playerid,atmrobrand);
	   	commitedcrimerecently[playerid] +=120;
        oscore = GetPlayerScore(playerid);
	    SetPlayerScore(playerid, oscore +1);
        Playerrobbedbankrecent[playerid] = 1100;
        UsedBankRecently[playerid] += 1200;
        RobbedBank[playerid] = 1337;
        atmnetworkrobbedrecent =200;
        if(robberrank[playerid] >=10 && robberrank[playerid] <=19) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
        atmcash3 -=atmrobrand;
        for(new j=0;j<MAX_PLAYERS;j++)
	    {
        if(LawEnforcementRadio[j] == 1) {
        format(string, sizeof(string), "DISPATCH: (ATM ROBBERY) Suspect: %s(%d) Location: Starfish Casino",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	format(string, sizeof(string), "DISPATCH: **ATTENTION ALL UNITS** Please respond to Starfish Casino - (ATM ROBBERY) Suspect: %s(%d)",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	SendClientMessage(j, COLOR_DODGERBLUE, "Type /radoff to turn your Law Enforcement radio off");
    	}
	    }
	    }
	    }
	    

		if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 28)
		{
		if(GetPlayerWantedLevel(playerid) >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You must be innocent to attempt to rob the ATM");
		return 1;
    	}
    	if(atmcash4 <=99999) {
    	SendClientMessage(playerid,COLOR_ERROR,"Your attempt to rob the ATM has failed");
    	UsedBankRecently[playerid] += 120;
    	return 1;
    	}
		if(atmcash4 >=100000)
		{
    	new atmrobrand = random(55000);
    	if(GetPlayerMoney(playerid) + atmrobrand >= 1000001) {
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Robbery Failed_|");
		format(string, sizeof(string), "You cannot fit $%d more in your pockets! Deposit some cash into your bank account",atmrobrand);
    	SendClientMessage(playerid, COLOR_ERROR, string);
    	return 1;
    	}
    	new atmrobbername[30];
    	GetPlayerName(playerid,atmrobbername,30);
    	new plwl = GetPlayerWantedLevel(playerid);
	    new pcol = GetPlayerColor(playerid);
        SetPlayerWantedLevel(playerid,plwl +4);
        plwl = GetPlayerWantedLevel(playerid);
        SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	    format(string, sizeof(string), "(ATM BANK ROBBERY) Wanted Level %d",plwl);
        SendClientMessage(playerid,pcol,string);
        format(string, sizeof(string), "You have robbed the LV City Bank ATM. You robbed a total of $%d",atmrobrand);
        SendClientMessage(playerid,0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has robbed $%d from  the ATM in Come-Alot",atmrobbername,playerid,atmrobrand);
        SendClientMessageToAll(0x00C7FFAA, string);
        ircSay(EchoConnection, EchoChan,string);
	   	printf("%s",string);
	   	GivePlayerMoney(playerid,atmrobrand);
	   	commitedcrimerecently[playerid] +=120;
        oscore = GetPlayerScore(playerid);
	    SetPlayerScore(playerid, oscore +1);
        Playerrobbedbankrecent[playerid] = 1100;
        UsedBankRecently[playerid] += 1200;
        RobbedBank[playerid] = 1337;
        atmnetworkrobbedrecent =200;
        if(robberrank[playerid] >=10 && robberrank[playerid] <=19) {
    	SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    	SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    	robberrank[playerid] +=1;
    	respect[playerid] -=1;
		}
        atmcash4 -=atmrobrand;
        for(new j=0;j<MAX_PLAYERS;j++)
	    {
        if(LawEnforcementRadio[j] == 1) {
        format(string, sizeof(string), "DISPATCH: (ATM ROBBERY) Suspect: %s(%d) Location: Come-Alot",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	format(string, sizeof(string), "DISPATCH: **ATTENTION ALL UNITS** Please respond to Come-Alot - (ATM ROBBERY) Suspect: %s(%d)",atmrobbername,playerid);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	SendClientMessage(j, COLOR_DODGERBLUE, "Type /radoff to turn your Law Enforcement radio off");
    	}
	    }
	    }

	    
	    }
	    return 1;
    	}
		
    



    	if(strcmp(cmdtext, "/robbank", true) == 0)
		{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(gTeam[playerid] == TEAM_LAWYER) {
    SendClientMessage(playerid,COLOR_ERROR,"You are a lawyer. You cannot use this command");
    return 1;
    }
    	if(Jailed[playerid] == 1) {
		SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
		if(!IsPlayerInCheckpoint(playerid)) {
    	SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Bank checkpoint");
    	return 1;
    	}
    	if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY || gTeam[playerid] == TEAM_MEDIC || gTeam[playerid] == TEAM_CASSEC || gTeam[playerid] == TEAM_JAILTK) {
		SendClientMessage(playerid,COLOR_ERROR,"You cannot rob the bank");
		return 1;
    	}
        if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 33) {
		SendClientMessage(playerid,COLOR_ERROR,"You are not in the main bank checkpoint");
    	return 1;
    	}
    	if(robberrank[playerid] <=29) {
    	SendClientMessage(playerid,COLOR_ERROR,"Your robber skill level is too low to rob LV City Bank. Type /robskill for more info");
    	return 1;
    	}
    	if(BankRobbedRecently >=1 ) {
		SendClientMessage(playerid,COLOR_ERROR,"LV City Bank has been robbed recenty. Please wait");
    	return 1;
    	}
    	if(Playerrobbedbankrecent[playerid] >=1 ) {
		SendClientMessage(playerid,COLOR_ERROR,"Please wait before robbing the bank again");
    	return 1;
    	}
    	if(GetPlayerWantedLevel(playerid) >=1) {
		SendClientMessage(playerid,COLOR_ERROR,"You cannot rob the bank if you have wanted level");
		return 1;
    	}
    	
		new bankrobchance = random(500);
		new robbername[30];
    	GetPlayerName(playerid,robbername,30);
		if(bankrobchance >=0 && bankrobchance <=249) {
	    new plwl = GetPlayerWantedLevel(playerid);
	    new pcol = GetPlayerColor(playerid);
        SetPlayerWantedLevel(playerid,plwl +3);
        plwl = GetPlayerWantedLevel(playerid);
        SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	    format(string, sizeof(string), "(ATTEMPTED BANK ROBBERY) Wanted Level %d",plwl);
        SendClientMessage(playerid,pcol,string);
        SendClientMessage(playerid,COLOR_ERROR,"Your attempted to rob LV City Bank has failed. The police have been advised");
        Playerrobbedbankrecent[playerid] =120;
        UsedBankRecently[playerid] =120;
        format(string, sizeof(string), "%s(%d) has attempted to rob the bank. Attempt failed",robbername,playerid);
	    printf("%s",string);
	    commitedcrimerecently[playerid] +=200;
	    for(new j=0;j<MAX_PLAYERS;j++)
	    {
        new current_zone;
        current_zone = player_zone[playerid];
        if(LawEnforcementRadio[j] == 1) {
        format(string, sizeof(string), "DISPATCH: (ATTEMPTED BANK ROBBERY) Suspect: %s(%d) Location: %s",robbername,playerid,zones[current_zone][zone_name]);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	format(string, sizeof(string), "DISPATCH: **ATTENTION ALL UNITS** Please respond to %s - (ATTEMPTED ROBBERY)",zones[current_zone][zone_name]);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	SendClientMessage(j, COLOR_DODGERBLUE, "Type /radoff to turn your Law Enforcement radio off");
    	}
	    }
	    }
		else
		if(bankrobchance >=250 && bankrobchance <=500)
		{
    	
    	

    	new bankrobberytotal =0;
		for(new i=0;i<MAX_PLAYERS;i++)
		{
		if(IsPlayerConnected(i) && IsSpawned[i] == 1)
		{
		if(PLAYERLIST_authed[i] && InBank[i] ==0)
		{
		BankCash[i] = dUserINT(PlayerName(i)).("bankcash");
		if(BankCash[i] >=75000)
		{
		new victimname[30];
		GetPlayerName(i,victimname,30);
		format(string, sizeof(string), "%s(%d) has $%d in bank account",victimname,i,BankCash[i]);
		printf("%s",string);
		new robbedrand = random(75000);
		
		bankrobberytotal +=robbedrand;
		BankCash[i] -=robbedrand;
		
		dUserSetINT(PlayerName(i)).("bankcash",BankCash[i]);
		
        format(string, sizeof(string), "|_|----- Las Venturas City Bank -----|_|");
		SendClientMessage(i, 0xA9A9A9AA, string);
		format(string, sizeof(string), "|** Mode: **SMS  ALERT** (Money Stolen)");
		SendClientMessage(i,0x808080AA,string);
		format(string, sizeof(string), "|** Notes: LV City Bank has been robbed. $%d of your cash was stolen",robbedrand);
		SendClientMessage(i, 0xA9A9A9AA, string);
		if(BankRobInsurance[i] == 1) {
		BankCashReturns[i] +=robbedrand;
		SendClientMessage(i, 0x00C7FFAA,"Your bank account is insured against theft. Visit the LV City branch to make a claim");
		format(string, sizeof(string), "Total ammount due to you in this current insurance policy: $%d ",BankCashReturns[i]);
		SendClientMessage(i, 0x00C7FFAA,string);
		}
		format(string, sizeof(string), "%s(%d) has had $%d stolen during a bank robbery",victimname,i,robbedrand);
		printf("%s",string);
        }
        }
        }
        }
       if(bankrobberytotal >=1) {
       GivePlayerMoney(playerid,bankrobberytotal);
       format(string, sizeof(string), "%s(%d) Has robbed $%d from LV City Bank",robbername,playerid,bankrobberytotal);
       SendClientMessageToAll(0x00C7FFAA, string);
       ircSay(EchoConnection, EchoChan,string);
       format(string, sizeof(string), "%s(%d) Has robbed $%d from LV City Bank",robbername,playerid,bankrobberytotal);
	   printf("%s",string);
       new plwl = GetPlayerWantedLevel(playerid);
	   new pcol = GetPlayerColor(playerid);
       SetPlayerWantedLevel(playerid,plwl +5);
       plwl = GetPlayerWantedLevel(playerid);
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	   format(string, sizeof(string), "(BANK ROBBERY) Wanted Level %d",plwl);
       SendClientMessage(playerid,pcol,string);
       format(string, sizeof(string), "You have robbed LV City Bank. You robbed a total of $%d",bankrobberytotal);
       SendClientMessage(playerid,0x00C7FFAA, string);
       SetPlayerPos(playerid,2361.9761,1539.9305,10.8203);
	   SetPlayerFacingAngle(playerid,181.8405);
	   SetCameraBehindPlayer(playerid);
	   if(robberrank[playerid] >=30 && robberrank[playerid] <=39) {
       SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
       SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
       robberrank[playerid] +=1;
       respect[playerid] -=1;
	   }
	   oscore = GetPlayerScore(playerid);
	   SetPlayerScore(playerid, oscore +1);
	   InBank[playerid] =0;
       Playerrobbedbankrecent[playerid] = 1100;
       UsedBankRecently[playerid] += 1200;
       RobbedBank[playerid] = 1337;
       BankRobbedRecently =400;
       commitedcrimerecently[playerid] +=460;
	   for(new j=0;j<MAX_PLAYERS;j++)
	   {
        new current_zone;
        current_zone = player_zone[playerid];
        if(LawEnforcementRadio[j] == 1) {
        format(string, sizeof(string), "DISPATCH: (BANK ROBBERY) Suspect: %s(%d) Location: %s",robbername,playerid,zones[current_zone][zone_name]);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	format(string, sizeof(string), "DISPATCH: **ATTENTION ALL UNITS** Please respond to %s - (BANK ROBBERY)",zones[current_zone][zone_name]);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	SendClientMessage(j, COLOR_DODGERBLUE, "Type /radoff to turn your Law Enforcement radio off");
    	}
	    }
	    }
	    
       if(bankrobberytotal == 0) {
       new plwl = GetPlayerWantedLevel(playerid);
	   new pcol = GetPlayerColor(playerid);
       SetPlayerWantedLevel(playerid,plwl +3);
       plwl = GetPlayerWantedLevel(playerid);
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	   format(string, sizeof(string), "(ATTEMPTED BANK ROBBERY) Wanted Level %d",plwl);
       SendClientMessage(playerid,pcol,string);
       SendClientMessage(playerid,COLOR_ERROR,"Your attempted to rob LV City Bank has failed. (Could not find the safe)");
       Playerrobbedbankrecent[playerid] =300;
       format(string, sizeof(string), "%s(%d) has attempted to rob the bank (Could not find the safe)",robbername,playerid);
		printf("%s",string);
		commitedcrimerecently[playerid] +=200;
	   for(new j=0;j<MAX_PLAYERS;j++)
	   {
        new current_zone;
        current_zone = player_zone[playerid];
        if(LawEnforcementRadio[j] == 1) {
        format(string, sizeof(string), "DISPATCH: (ATTEMPTED BANK ROBBERY) Suspect: %s(%d) Location: %s",robbername,playerid,zones[current_zone][zone_name]);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	format(string, sizeof(string), "DISPATCH: **ATTENTION ALL UNITS** Please respond to %s - (ATTEMPTED ROBBERY)",zones[current_zone][zone_name]);
     	SendClientMessage(j, COLOR_ROYALBLUE, string);
     	SendClientMessage(j, COLOR_DODGERBLUE, "Type /radoff to turn your Law Enforcement radio off");
    	}
	    }
	    }
	    }
	return 1;
}
  

 		if(strcmp(cmdtext, "/claimcash", true) == 0)
		{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(Jailed[playerid] == 1) {
		SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
		if(!IsPlayerInCheckpoint(playerid)) {
    	SendClientMessage(playerid,COLOR_ERROR,"You are not in the LV City Bank checkpoint");
    	return 1;
    	}
    	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 33) {
		SendClientMessage(playerid,COLOR_ERROR,"You need to be in the LV City Bank checkpoint to claim stolen cash");
    	return 1;
    	}
        if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 33)
		{
		if(UsedBankRecently[playerid] >= 1) {
    	SendClientMessage(playerid,0xD2691EAA,"Please wait before using the bank again");
    	return 1;
    	}
    	if(BankRobInsurance[playerid] == 0) {
    	SendClientMessage(playerid,0x00C7FFAA,"You do not have a valid cash theft insurance policy. Type /buyinsure to get instant cover");
    	return 1;
    	}
    	if(BankCashReturns[playerid] >= 1)
		{
    	new claimer[30];
    	GetPlayerName(playerid,claimer,30);
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Claim Completed_|");
    	GivePlayerMoney(playerid,BankCashReturns[playerid]);
 	    format(string, sizeof(string), "Your insurance policy is active. You have claimed $%d",BankCashReturns[playerid]);
    	SendClientMessage(playerid, 0x00C7FFAA, string);
    	format(string, sizeof(string), "%s(%d) Has received $%d from the LV City Bank Insurance department",claimer,playerid,BankCashReturns[playerid]);
       	SendClientMessageToAll(0x00C7FFAA, string);
       	printf("%s",string);
       	BankCashReturns[playerid] =0;
       	}
       	else {
       	SendClientMessage(playerid, 0xA9A9A9AA, "|_Claim Failed_|");
       	SendClientMessage(playerid, 0x00C7FFAA, "You do not have any outstanding payments due to you at this time");
       	}
       	}
       	return 1;
    	}
 	
 	
 	


		if(strcmp(cmdtext, "/buyinsure", true) == 0)
		{
		if(IsSpawned[playerid] == 0) {
		SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    	return 1;
    	}
    	if(Jailed[playerid] == 1) {
		SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command in jail");
    	return 1;
    	}
		if(!IsPlayerInCheckpoint(playerid)) {
    	SendClientMessage(playerid,COLOR_ERROR,"You are not in the Bank checkpoint (Cash Theft Insurance)");
    	return 1;
    	}
    	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) != 33 && getCheckpointType(playerid) != 82 && getCheckpointType(playerid) != 29 && getCheckpointType(playerid) != 30) {
		SendClientMessage(playerid,COLOR_ERROR,"You are not in the Bank checkpoint (Cash Theft Insurance)");
    	return 1;
    	}
    	
        if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 33)
		{
		if(BankRobInsurance[playerid] == 1) {
		SendClientMessage(playerid,COLOR_ERROR,"You already have a valid policy with us. Your acount is already insured");
    	return 1;
    	}
		if(GetPlayerMoney(playerid) <=14999) {
		SendClientMessage(playerid,COLOR_ERROR,"LV City Bank theft insurance costs $15000 - You do not have enough cash");
    	return 1;
    	}
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Your Account Is Insured_|");
       	SendClientMessage(playerid, 0x00C7FFAA, "Thanks! Your bank account cash is now insured against theft");
       	SendClientMessage(playerid, 0x00C7FFAA, "If you die, your policy will die with you");
       	SendClientMessage(playerid, 0x00C7FFAA, "If you are due any claim then type /claimcash in this checkpoint to make a claim");
		BankRobInsurance[playerid] =1;
		GivePlayerMoney(playerid,-15000);
 	    /*return 1;
    	}
 	    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 82)
		{
		if(GetPlayerVirtualWorld(playerid) == 0) {
		SendClientMessage(playerid,COLOR_ERROR,"You are not in City Hall. You can enter City Hall up in Roca Escalante");
    	return 1;
    	}
		if(LifeInsurance[playerid] == 1) {
		SendClientMessage(playerid,COLOR_ERROR,"You already have a valid Life Insurance policy. You can only insure one life at any time");
    	return 1;
    	}
		if(GetPlayerMoney(playerid) <=49999) {
		SendClientMessage(playerid,COLOR_ERROR,"Life Insurance costs $50000 - You do not have enough cash");
    	return 1;
    	}
    	SendClientMessage(playerid, 0xA9A9A9AA, "|_Your Life Is Insured_|");
       	SendClientMessage(playerid, 0x00C7FFAA, "You are now covered with Life Insurance. This policy will last for 1 death");
       	SendClientMessage(playerid, 0x00C7FFAA, "If you die while you have Life Insurance then you will spawn at LV Hospital with full health");
       	SendClientMessage(playerid, 0x00C7FFAA, "Life insurance covers weapons, bank cash, pocket cash, other insurances, drug bags");
       	SendClientMessage(playerid, 0x00C7FFAA, "drugs, robber rank, C4, wallet");
		LifeInsurance[playerid] =1;
		GivePlayerMoney(playerid,-50000);
		*/
		}
 	    return 1;
    	}

 	
 	

	// LV Airport Checkpoint Commands
	
	if (strcmp("/dive", cmdtext, true, 6) == 0) // skydive from lv
	{
 	if(GetPlayerMoney(playerid) < 2999 && IsPlayerInCheckpoint(playerid)) {
 	SendClientMessage(playerid,COLOR_WHITE,"CHECKPOINT HELP: You cannot afford to buy a skydive ticket for $3000");
 	return 1;
 	}
	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 17) {
	{
	GivePlayerMoney(playerid,-3000);
    GivePlayerWeapon(playerid,46,1);
    SetPlayerInterior(playerid,0);
    SetPlayerPos(playerid,2116.1709,1809.3512,865.7900);
    GameTextForPlayer(playerid, "~r~Have a good jump!", 6000, 3);
    SendClientMessage(playerid,0x4682B4AA,"You have purchased 1 skydive ticket. You have been charged $3000");
    }
    }
	else
    SendClientMessage(playerid,0xA52A2AAA,"Skydive tickets can only be purchased in the checkpoint at Las Venturas airport!");
    return 1;
	}

 	if (strcmp("/flyls", cmdtext, true, 6) == 0) // fly to ls from lv
	{
 	if(GetPlayerMoney(playerid) < 4499 && IsPlayerInCheckpoint(playerid) == 17) {
 	SendClientMessage(playerid,COLOR_WHITE,"CHECKPOINT HELP: You cannot afford to buy a flight ticket to Los Santos for $4500");
 	return 1;
 	}
 	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 17) {
	{
	GivePlayerMoney(playerid,-4500);
    SetPlayerInterior(playerid,0);
    SetPlayerPos(playerid,1684.5850,-2326.6030,13.5469);
    SetPlayerFacingAngle(playerid,2.9027);
    GameTextForPlayer(playerid, "~w~Welcome to Los Santos!", 6000, 3);
    SendClientMessage(playerid,0x4682B4AA,"You have purchased 1 ticket to Los Santos. You have been charged $4500.");
    }
    }
	else
    SendClientMessage(playerid,0xA52A2AAA,"Flight tickets can only be purchased in the checkpoint at Las Venturas airport!");
    return 1;
	}
	
    if (strcmp("/flysf", cmdtext, true, 6) == 0) // fly to sf from lv
	{
 	if(GetPlayerMoney(playerid) < 4499 && IsPlayerInCheckpoint(playerid) == 17) {
 	SendClientMessage(playerid,COLOR_WHITE,"CHECKPOINT HELP: You cannot afford to buy a flight ticket to San Fierro for $4500");
 	return 1;
 	}
	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 17) {
	{
	GivePlayerMoney(playerid,-4500);
    SetPlayerInterior(playerid,0);
    SetPlayerPos(playerid,-1425.9320,-293.2484,14.0000);
    SetPlayerFacingAngle(playerid,140.9852);
    GameTextForPlayer(playerid, "~w~Welcome to San Fierro!", 6000, 3);
    SendClientMessage(playerid,0x4682B4AA,"You have purchased 1 ticket to San Fierro. You have been charged $4500.");
    }
    }
	else
    SendClientMessage(playerid,0xA52A2AAA,"Flight tickets can only be purchased in the checkpoint at Las Venturas airport!");
    return 1;
	}
	
	if (strcmp(cmdtext, "/lc-bistro", true) == 0)
{
if(GetPlayerMoney(playerid) < 4499 && IsPlayerInCheckpoint(playerid) == 17) {
 	SendClientMessage(playerid,COLOR_WHITE,"CHECKPOINT HELP: You cannot afford to buy a flight ticket to San Fierro for $4500");
 	return 1;
 	}
 	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 17) {
     SetPlayerInterior(playerid, 1);
     SetPlayerFacingAngle(playerid, 0);
     SetPlayerPos(playerid, -794.9109,493.3645,1376.1953);
     GameTextForPlayer(playerid, "~w~Welcome to Liberty City!", 6000, 3);
     return 1;
    }
	else
    SendClientMessage(playerid,0xA52A2AAA,"Flight tickets can only be purchased in the checkpoint at Las Venturas airport!");
    return 1;
	}
	
	if (strcmp("/sell", cmdtext, true, 6) == 0) // sellcar
	{

   	if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 19 && GetPlayerVehicleID(playerid) == 1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
	if(BonusCars[1] == 1) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0xD2691EAA,"Sorry...We do not want to buy this vehicle");
    return 1;
    }
	new str[100];
    GetPlayerName(playerid, str, 24);
    format(str, 100, "%s(%d) Has found and sold the bonus nrg-500 for $100000 at AutoBahn", str,playerid);
    SendClientMessageToAll(0x00C7FFAA, str);
    printf("%s",str);
    ircSay(EchoConnection, EchoChan,str);
    GivePlayerMoney(playerid,100000);
    new playerScore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, playerScore+ 1);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0x00C7FFAA,"You have sold us the bonus NRG-500 motorbike. We have given you $100000");
    BonusCars[1] = 1;
	SetVehicleToRespawn(1);
    }
    else
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 19 && GetPlayerVehicleID(playerid) == 2 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    if(BonusCars[2] == 1) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0xD2691EAA,"Sorry...We do not want to buy this vehicle");
    return 1;
    }
    new str[100];
    GetPlayerName(playerid, str, 24);
    format(str, 100, "%s(%d) Has found and sold the bonus Bullet for $100000 at AutoBahn.", str,playerid);
    SendClientMessageToAll(0x00C7FFAA, str);
    printf("%s",str);
    ircSay(EchoConnection, EchoChan,str);
	GivePlayerMoney(playerid,100000);
    new playerScore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, playerScore+ 1);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0x00C7FFAA,"You have sold us the bonus Bullet vehicle. We have given you $100000");
    BonusCars[2] = 1;
    SetVehicleToRespawn(2);
    }
    else
    if(IsPlayerInCheckpoint(playerid) && getCheckpointType(playerid) == 19 && GetPlayerVehicleID(playerid) >= 3 && GetPlayerVehicleID(playerid) <= 30 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
    new VehicleID = GetPlayerVehicleID(playerid);
    if(CarSold[VehicleID] == 1) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0xD2691EAA,"Sorry...We do not want to buy this vehicle");
    return 1;
    }
    SetVehicleToRespawn(VehicleID);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0x00C7FFAA,"You have sold us your vehicle. We have given you $25000");
	GivePlayerMoney(playerid,25000);
	CarSold[VehicleID] =1;
	new str[100];
    GetPlayerName(playerid, str, 24);
	format(str, 100, "%s(%d) Has sold a vehicle for $25000 at AutoBahn.", str,playerid);
    printf("%s",str);
    ircSay(EchoConnection, EchoChan,str);
    }
	else
	if(GetPlayerVehicleID(playerid) >= 217 && GetPlayerVehicleID(playerid) <= 220) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0xD2691EAA,"You cannot sell any Admin vehicle");
	}
	else
	if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0xD2691EAA,"You cannot sell any vehicle while you are a passenger. You must be the driver");
	}
	else
	if(!IsPlayerInCheckpoint(playerid)) {
	SendClientMessage(playerid,COLOR_ERROR,"You need to be in the checkpoint at AutoBahn to attempt to sell a car");
	}
	else
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0xD2691EAA,"You are not in any vehichle. Get a vehicle then come back to see us");
	}
	else
	if(GetPlayerVehicleID(playerid) >= 31 ) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
    SendClientMessage(playerid,0xD2691EAA,"Sorry...We do not want to buy this vehicle");
    return 1;
    }

	return 1;
    }
    return SendClientMessage(playerid,0xFF0000AA,"Bad Command. Type /commands for available commands depending on your chosen job/skill");
}


public OnPlayerInfoChange(playerid)
{
    

	return 1;
}




public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if (GetVehicleModel(vehicleid) == shamal && ispassenger)
	{
		if (!ShamalExists(vehicleid))
		CreateShamalInt(vehicleid, float(randomEx(3000)), float(randomEx(3000)), float(random(100)+800));
		SetPlayerPosInShamal(playerid, vehicleid);
		InShamal[playerid] = vehicleid;
	}
    if(GetVehicleModel(vehicleid) == 592 && ispassenger == 1)
    {
        SetPlayerInterior(playerid,9);
        SetPlayerFacingAngle(playerid,0.0);
        SetPlayerPos(playerid, 315.856170,1024.496459,1949.797363);
        SetCameraBehindPlayer(playerid);
        InAndrom[playerid]=1;
        }


    new str[100];
    if(GetPlayerMoney(playerid) < -5000) {
    GetPlayerName(playerid, str, 24);
    
    format(str, 100, "**(AUTO KICK)** %s(%d) Negative Money", str,playerid);
    SendClientMessageToAll(0xFF7F50AA, str);
    printf("%s", str);
    SetPlayerInterior(playerid,10);
    SetPlayerPos(playerid,219.6257,111.2549,999.0156);
    SetPlayerFacingAngle(playerid,2.2339);
    SetCameraBehindPlayer(playerid);
    ResetPlayerMoney(playerid);
    Kicking[playerid] =1;
	SetTimer("KickPlayer",700,0);
    return 1;
    }


    return 1;
    }
    
	
	


public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
 if(oldinteriorid == 6 && newinteriorid == 0)
{
	if(GetPlayerVirtualWorld(playerid) == 1)
	{
		SetPlayerVirtualWorld(playerid,0);
    	//SetPlayerInterior(playerid,0);
    	SetPlayerPos(playerid,1592.2305,2214.1846,10.8203);
    	SetPlayerFacingAngle(playerid,187.0764);
    	SetCameraBehindPlayer(playerid);
    	LeftTwoFourSeven[playerid] =1;
    	TimeToMoveTwoFourSeven[playerid] =3;
    	TogglePlayerControllable(playerid, 0);
   	}
    if(GetPlayerVirtualWorld(playerid) == 2)
	{
    	SetPlayerVirtualWorld(playerid,0);
    	//SetPlayerInterior(playerid,0);
    	SetPlayerPos(playerid,2191.6472,2476.4624,10.8203);
    	SetPlayerFacingAngle(playerid,272.7751);
    	SetCameraBehindPlayer(playerid);
    	LeftTwoFourSeven[playerid] =2;
    	TimeToMoveTwoFourSeven[playerid] =3;
    	TogglePlayerControllable(playerid, 0);
    }
    if(GetPlayerVirtualWorld(playerid) == 3)
	{
    	SetPlayerVirtualWorld(playerid,0);
    	//SetPlayerInterior(playerid,0);
    	SetPlayerPos(playerid,2630.5876,1124.3673,10.8203);
    	SetPlayerFacingAngle(playerid,177.8683);
    	SetCameraBehindPlayer(playerid);
    	LeftTwoFourSeven[playerid] =3;
    	TimeToMoveTwoFourSeven[playerid] =3;
    	TogglePlayerControllable(playerid, 0);
    }
    if(GetPlayerVirtualWorld(playerid) == 4)
	{
    	SetPlayerVirtualWorld(playerid,0);
    	//SetPlayerInterior(playerid,0);
    	SetPlayerPos(playerid,2108.0222,901.5873,10.8203);
    	SetPlayerFacingAngle(playerid,2.9187);
    	SetCameraBehindPlayer(playerid);
    	LeftTwoFourSeven[playerid] =4;
    	TimeToMoveTwoFourSeven[playerid] =3;
        TogglePlayerControllable(playerid, 0);
    }
    if(GetPlayerVirtualWorld(playerid) == 5)
	{
    	SetPlayerVirtualWorld(playerid,0);
    	//SetPlayerInterior(playerid,0);
    	SetPlayerPos(playerid,664.9492,1726.6813,6.9922);
    	SetPlayerFacingAngle(playerid,42.5792);
    	SetCameraBehindPlayer(playerid);
    	LeftTwoFourSeven[playerid] =5;
    	TimeToMoveTwoFourSeven[playerid] =3;
    	TogglePlayerControllable(playerid, 0);
    }
    if(GetPlayerVirtualWorld(playerid) == 6)
	{
    	SetPlayerVirtualWorld(playerid,0);
    	//SetPlayerInterior(playerid,0);
    	SetPlayerPos(playerid,2142.6326,2739.4309,10.8203);
    	SetPlayerFacingAngle(playerid,5.6754);
    	SetCameraBehindPlayer(playerid);
    	LeftTwoFourSeven[playerid] =6;
    	TimeToMoveTwoFourSeven[playerid] =3;
    	TogglePlayerControllable(playerid, 0);
    }
}
return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) >= 217 && GetPlayerVehicleID(playerid) <= 220 && PlayerAdminLevel[playerid] != 1337) {
	RemovePlayerFromVehicle(playerid);
	SendClientMessage(playerid,COLOR_ERROR,"This vehicle is reserved for Server Admins - You cannot use this vehicle!");
	return 1;
}



    new string[256];

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && BoughtCars[GetPlayerVehicleID(playerid)] == 999 && BoughtCarsOwner[GetPlayerVehicleID(playerid)] != playerid) {
	SendClientMessage(playerid,COLOR_YELLOW,"This car has been purchased from AutoBahn. You are not the owner");
	format(string, sizeof(string), "This vehicle is registered to playerid: %d",BoughtCarsOwner[GetPlayerVehicleID(playerid)]);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	RemovePlayerFromVehicle(playerid);
	return 1;
}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_PASSENGER && GetPlayerWantedLevel(playerid) >= 4) {
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		if(IsPlayerInAnyVehicle(i))
		{
			if(GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
			{
			    if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
			    {
			        if(gTeam[i] != 1 && gTeam[i] != 2 && gTeam[i] != 3 && gTeam[i] != 5 &&  gTeam[i] != 6 && commitedcrimerecently[i] == 0) {
			        SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+1);
			        new pcol = GetPlayerColor(i);
					SendClientMessage(i, 0xA9A9A9AA, "|_Crime Commited_|");
					format(string, sizeof(string), "(CARRYING WANTED PLAYERS) Wanted Level %d",GetPlayerWantedLevel(i));
					SendClientMessage(i,pcol,string);
					commitedcrimerecently[i] +=120;
			        }
				}
			}
		}
	}

	}

	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
    {
	if(GetPlayerVehicleID(playerid) == 219 && PlayerAdminLevel[playerid] == 1337)
	{
	AddVehicleComponent(219,1147); // elegy spoiler
    AddVehicleComponent(219,1085); // elegy rims
    AddVehicleComponent(219,1148); // elegy rear bumper
    AddVehicleComponent(219,1172); // elegy front bumper
    AddVehicleComponent(219,1034); // elegy pipes
    AddVehicleComponent(219,1010); // elegy nawz
    AddVehicleComponent(219,1040); // elegy skirt
    AddVehicleComponent(219,1036); // elegy skirt
	}
	}
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
    {
	if(GetPlayerVehicleID(playerid) == 218 && PlayerAdminLevel[playerid] == 1337)
	{
	AddVehicleComponent(218,1085); // turismo rims
    AddVehicleComponent(218,1010); // turismo nawz
    }
	}
 	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
    {
	if(GetPlayerVehicleID(playerid) == 217 && PlayerAdminLevel[playerid] == 1337)
	{
	AddVehicleComponent(217,1085); // sultan rims
    AddVehicleComponent(217,1010); // sultan nawz
    AddVehicleComponent(217,1026); // sultan skirt
    AddVehicleComponent(217,1027); // sultan skirt
    AddVehicleComponent(217,1029); // sultan zawst
    AddVehicleComponent(217,1139); // sultan spoiler
    AddVehicleComponent(217,1140); // sultan rear bumper
    AddVehicleComponent(217,1170); // sultan front bumper
    }
	}
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
    {
	if(GetPlayerVehicleID(playerid) == 220 && PlayerAdminLevel[playerid] == 1337)
	{
	AddVehicleComponent(220,1085); // uranus rims
    AddVehicleComponent(220,1010); // uranus nawz
    AddVehicleComponent(220,1090); // uranus skirt
    AddVehicleComponent(220,1094); // uranus skirt
    AddVehicleComponent(220,1089); // uranus zawst
    AddVehicleComponent(220,1164); // uranus spoiler
    AddVehicleComponent(220,1167); // uranus rear bumper
    AddVehicleComponent(220,1165); // uranus front bumper
    }
	}
	

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) >= 31 && GetPlayerVehicleID(playerid) <= 86)
	{
    if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY  || gTeam[playerid] == TEAM_CASSEC || gTeam[playerid] == TEAM_MEDIC) {
    SendClientMessage(playerid,0xF08080AA,"This vehicle belongs to the city. You can use this vehicle to do your job");
    return 1;
	}
    new pname[24];
    new plwl;
	GetPlayerName(playerid,pname,24);
	if(StoleCopCarRecent[playerid] == 0) {
	plwl = GetPlayerWantedLevel(playerid);
	SetPlayerWantedLevel(playerid,plwl +4);
	}
	new pcol = GetPlayerColor(playerid);
    plwl = GetPlayerWantedLevel(playerid);
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(LAW ENFORCEMENT VEHICLE THEFT) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	commitedcrimerecently[playerid] +=200;
	if(StoleCopCarRecent[playerid] == 0) {
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	new current_zone;
    current_zone = player_zone[playerid];
    if(LawEnforcementRadio[i] == 1) {
    format(string, sizeof(string), "DISPATCH: (LAW ENFORCEMENT VEHICLE THEFT) %s(%d) Has stolen a police vehicle. Location: %s",pname,playerid,zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_ROYALBLUE, string);
    }
    }
	}
	StoleCopCarRecent[playerid] =1;
	}


    if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT && gTeam[playerid] == TEAM_DRIVER && Driveronduty[playerid] == 1)
	{
	new drivername[30];
    GetPlayerName(playerid,drivername,30);
    format(string, sizeof(string), "Driver %s(%d) is off duty",drivername,playerid);
	SendClientMessageToAll(COLOR_FORESTGREEN,string);
	Driveronduty[playerid] =0;
	}

    if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
	{
	if(OnDelMission[playerid] == 1337 || DeliveringCash[playerid] == 1337)
    {
	SendClientMessage(playerid,COLOR_ERROR,"Delivery Mission Cancelled");
	OnDelMission[playerid] =0;
	DeliveringCash[playerid] =0;
	DisablePlayerCheckpoint(playerid);
    playerCheckpoint[playerid] = 999;
	}
	}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(GetVehicleModel(vehicleid) == 408) {
    SendClientMessage(playerid,0x00C7FFAA,"Type /trashdelivery to collect trash for cash");
    return 1;
	}
	}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER) {
    new vehicleid = GetPlayerVehicleID(playerid);
    if(GetVehicleModel(vehicleid) == 470) {
    SendClientMessage(playerid,0x00C7FFAA,"Type /gundelivery to deliver weapons to ammunation stores for cash");
	}
	}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && drunkplayer[playerid] >= 4)
    {
    if(gTeam[playerid] == 1 || gTeam[playerid] == 2 || gTeam[playerid] == 3 || gTeam[playerid] == 5 || gTeam[playerid] == 8) {
    SendClientMessage(playerid,COLOR_ERROR,"You are drunk. You cannot drink and drive");
    drunkplayer[playerid] -= 1;
    RemovePlayerFromVehicle(playerid);
    }
    
	else{
    new plwl = GetPlayerWantedLevel(playerid);
	SetPlayerWantedLevel(playerid,plwl +1);
	new drinkdriver[30];
	plwl = GetPlayerWantedLevel(playerid);
	new pcol = GetPlayerColor(playerid);
	GetPlayerName(playerid,drinkdriver,30);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(DRUNK DRIVING) Wanted Level: %d",plwl);
	drunkplayer[playerid] -= 1;
 	SendClientMessage(playerid, pcol, string);
 	for(new i=0;i<MAX_PLAYERS;i++)
	{
	new current_zone;
    current_zone = player_zone[playerid];
    if(LawEnforcementRadio[i] == 1 && GetDistanceBetweenPlayers(playerid,i) < 50) {
    format(string, sizeof(string), "DISPATCH: (DUI) %s(%d) drunk driving. Units in the area respond to Location: %s",drinkdriver,playerid,zones[current_zone][zone_name]);
	SendClientMessage(i, COLOR_ROYALBLUE, string);
	}
	}
	}
 	}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
    {
    new vehicleid = GetPlayerVehicleID(playerid);
    if(GetVehicleModel(vehicleid) == 428)
	{
	if(RobbedBank[playerid] == 1337 || GetPlayerWantedLevel(playerid) >=1) {
	SendClientMessage(playerid,0x808080AA,"You cannot work for LV City Bank if you are wanted or if you have robbed the Bank or a ATM recently");
    RemovePlayerFromVehicle(playerid);
	return 1;
}
    SendClientMessage(playerid,0x808080AA,"You can work for LV City Bank! We need casual workers to deliver cash to ATM machines");
    SendClientMessage(playerid,0x808080AA,"Type /atmcash to use the computer in the van. This will show the current cash levels in all ATMs");
    SendClientMessage(playerid,0x808080AA,"If the levels are below 500k then type /cashdelivery to start this mission");
    SendClientMessage(playerid,0x808080AA,"The amount that the Bank will pay you depends on the amount of cash you deliver");
    SendClientMessage(playerid,0x808080AA,"So make sure that there is alot of cash needing delivered otherwise you might earn only $100");
    }
    }


    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && gTeam[playerid] == TEAM_DRIVER) {
    new vehicleidd = GetPlayerVehicleID(playerid);
    if(GetVehicleModel(vehicleidd) == 420 || GetVehicleModel(vehicleidd) == 487 || GetVehicleModel(vehicleidd) == 431 || GetVehicleModel(vehicleidd) == 409) {
    SendClientMessage(playerid,0x00C7FFAA,"You have entered a drivers vehicle. Type /onduty to go on duty as a taxi driver");
    SendClientMessage(playerid,0x00C7FFAA,"All taxi drivers have a fixed rate of $1 / Minute. You get a bonus for picking passengers up");
	}
	}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_PASSENGER)
    {
    new vehicleid = GetPlayerVehicleID(playerid);
    if(gTeam[playerid] != TEAM_DRIVER && GetVehicleModel(vehicleid) == 420 || GetVehicleModel(vehicleid) == 487 || GetVehicleModel(vehicleid) == 431 || GetVehicleModel(vehicleid) == 409)
    {
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(IsPlayerInVehicle(i,vehicleid))
	{
	if(gTeam[i] == TEAM_DRIVER && GetPlayerState(i) == PLAYER_STATE_DRIVER && Driveronduty[i] == 1)
	{
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Driver On Duty_|");
    SendClientMessage(playerid,COLOR_DARKOLIVEGREEN,"This driver is on duty. You will be charged $1 / 1 game minute");
    SendClientMessage(i, 0xA9A9A9AA, "|_Passenger Pick Up_|");
    SendClientMessage(i,COLOR_DARKOLIVEGREEN,"You have picked up a paying passenger. You receive a £2500 bonus");
    oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    GivePlayerMoney(i,2500);
    Taxipass[playerid] =1;
	}
	}
	}
	}
	}


    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) >= 136 && GetPlayerVehicleID(playerid) <= 137)
    {
	autobahnowner[playerid]=dUserINT(PlayerName(playerid)).("autobahnowner");
	if(autobahnowner[playerid] == 1337) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Owner Vehicle_|");
	SendClientMessage(playerid,0x00C7FFAA,"This is your own vehicle. You will own this vehicle for aslong as you own AutoBahn");
	SendClientMessage(playerid,0x00C7FFAA,"Your business gives you this vehicle but it still requires gas");
	}
	else
	if(autobahnowner[playerid] == 0) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Owner Vehicle_|");
	SendClientMessage(playerid,COLOR_ERROR,"This vehicle belongs to the owner of AutoBahn. You cannot use it");
	RemovePlayerFromVehicle(playerid);
    }
	}

    if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
    {
    if(InDerby[playerid] == 1)
    {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_BlackField Stadium_|");
	SendClientMessage(playerid, 0x00C7FFAA, "You have been ejected from the derby for exiting your vehicle");
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,1085.6786,1603.7218,12.5469);
	SetPlayerFacingAngle(playerid,5.5373);
	SetCameraBehindPlayer(playerid);
	InDerby[playerid] =0;
	new ejectedname[30];
	GetPlayerName(playerid,ejectedname,30);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(InDerby[i] == 1) {
    SendClientMessage(i, 0xA9A9A9AA, "|_BlackField Stadium_|");
    format(string, sizeof(string), "%s(%d) Has been ejected from the derby for exiting their vehicle",ejectedname,playerid);
	SendClientMessage(i, 0x00C7FFAA, string);
    }
    }
	}
	}


	if(oldstate == PLAYER_STATE_PASSENGER && newstate == PLAYER_STATE_ONFOOT)
    {
    if(Taxipass[playerid] == 1)
    {
    Taxipass[playerid] =0;
    }
    }


    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) >= 1 && GetPlayerVehicleID(playerid) <= 2)  {
    {
    new vid = GetPlayerVehicleID(playerid);
    if(BonusCars[vid] == 0) {
    SendClientMessage(playerid,0x4682B4AA,"Congratulations. You have found a bonus Vehicle worth $100000. Will you keep it or sell it?");
    SendClientMessage(playerid,0x4682B4AA,"Go to AutoBahn on the strip and type /sell in the checkpoint to get your cash");
    }
	}
	}
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) >= 3 && GetPlayerVehicleID(playerid) <= 30)  {
    {
    new vid = GetPlayerVehicleID(playerid);
    if(CarSold[vid] == 0) {
    SendClientMessage(playerid,0x4682B4AA,"You can sell this car at AutoBahn for $25000 - Type /sell in the checkpoint");
    }
	}
	}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) >= 87 && GetPlayerVehicleID(playerid) <= 92)
	{
    if(gTeam[playerid] != TEAM_ARMY) {
    SendClientMessage(playerid,0xFF0000AA,"You are not military personel. You cannot use this vehicle");
    RemovePlayerFromVehicle(playerid);
    return 1;
	}
    SendClientMessage(playerid, 0xA9A9A9AA, "|_SA Army Instructions_|");
    SendClientMessage(playerid,COLOR_RED,"USE THIS AIRCRAFT TO TAKE DOWN RED SUSPECTS ONLY");
    SendClientMessage(playerid,COLOR_RED,"DO NOT SHOOT AT OR KILL ANY PLAYER UNLESS THEY ARE RED (MOST WANTED)");
    SendClientMessage(playerid,COLOR_RED,"You WILL be kicked/banned if you kill/shoot at low wanted/innocent/team players");
    SendClientMessage(playerid,COLOR_YELLOW,"Type /pc for a list of player colours with brief descriptions");
    return 1;
	}

    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) >= 1) {
    SendClientMessage(playerid,COLOR_GREY,"You are driving a vehicle. Type /ej to exit the vehicle or /ejall to remove all players (including you)");
	}

	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_PASSENGER && GetPlayerVehicleID(playerid) >= 1) {
    SendClientMessage(playerid,COLOR_GREY,"Type /ej to exit the vehicle");
	}




	return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{
    new string[256];
    
    if(getCheckpointType(playerid) == 89 && getCheckpointType(playerid) == 89)
    {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall Administration Dept Commands_|");
    SendClientMessage(playerid,0x00C7FFAA,"/gchall - Give 1600$ to LV City Hall for respect.");
    SendClientMessage(playerid,0x00C7FFAA,"/rchall - Receive 1600$ from LV City Hall for help.");
    SendClientMessage(playerid,0x00C7FFAA,"/plans - Look at the plans maked. Costs 200$.");
    SendClientMessage(playerid,0x00C7FFAA,"/healsec - Health secure. 15000$");
    SendClientMessage(playerid,0x00C7FFAA,"Type /robhall to attempt a robbery at LV City Hall");
    }
    
    if(getCheckpointType(playerid) == 90 && getCheckpointType(playerid) == 90)
    {
    new Float:X,Float:Y,Float:Z,Float:A;
    GetVehiclePos(bigassplane,X,Y,Z);
    GetVehicleZAngle(bigassplane,A);
    X+=(5*floatsin(-floatsub(A,45.0),degrees)),
    Y+=(5*floatcos(-floatsub(A,45.0),degrees));
    SetPlayerInterior(playerid,0);
    SetPlayerPos(playerid,X,Y,floatsub(Z,0.94));
    SetPlayerFacingAngle(playerid,A);
    SetCameraBehindPlayer(playerid);
    InAndrom[playerid]=0;
    GivePlayerWeapon(playerid,46,1);
    }
    
    if(getCheckpointType(playerid) == 81 && getCheckpointType(playerid) == 81)
    {
    if(!IsPlayerInAnyVehicle(playerid))
    {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Hall_|");
    SendClientMessage(playerid,0x00C7FFAA,"Welcome to Las Venturas City Hall");
    SetPlayerVirtualWorld(playerid,1);
    SetPlayerInterior(playerid,3);
    SetPlayerPos(playerid,381.3491,173.8634,1008.3828);
    SetPlayerFacingAngle(playerid,88.3286);
    SetCameraBehindPlayer(playerid);
    }
    }
    
    
    if(getCheckpointType(playerid) == 83 && getCheckpointType(playerid) == 83)
    {
    if(!IsPlayerInAnyVehicle(playerid))
    {
    SetPlayerVirtualWorld(playerid,1);
    SetPlayerInterior(playerid,6);
    SetPlayerPos(playerid,-26.6916,-55.7149,1003.5469);
    SetPlayerFacingAngle(playerid,0.0000);
    SetCameraBehindPlayer(playerid);
    }
    }
    
    if(getCheckpointType(playerid) == 84 && getCheckpointType(playerid) == 84)
    {
    if(!IsPlayerInAnyVehicle(playerid))
    {
    SetPlayerVirtualWorld(playerid,2);
    SetPlayerInterior(playerid,6);
    SetPlayerPos(playerid,-26.6916,-55.7149,1003.5469);
    SetPlayerFacingAngle(playerid,0.0000);
    SetCameraBehindPlayer(playerid);
    }
    }
    
    if(getCheckpointType(playerid) == 85 && getCheckpointType(playerid) == 85)
    {
    if(!IsPlayerInAnyVehicle(playerid))
    {
    SetPlayerVirtualWorld(playerid,3);
    SetPlayerInterior(playerid,6);
    SetPlayerPos(playerid,-26.6916,-55.7149,1003.5469);
    SetPlayerFacingAngle(playerid,0.0000);
    SetCameraBehindPlayer(playerid);
    }
    }
    
    if(getCheckpointType(playerid) == 86 && getCheckpointType(playerid) == 86)
    {
    if(!IsPlayerInAnyVehicle(playerid))
    {
    SetPlayerVirtualWorld(playerid,4);
    SetPlayerInterior(playerid,6);
    SetPlayerPos(playerid,-26.6916,-55.7149,1003.5469);
    SetPlayerFacingAngle(playerid,0.0000);
    SetCameraBehindPlayer(playerid);
    }
    }
    
    if(getCheckpointType(playerid) == 87 && getCheckpointType(playerid) == 87)
    {
    if(!IsPlayerInAnyVehicle(playerid))
    {
    SetPlayerVirtualWorld(playerid,5);
    SetPlayerInterior(playerid,6);
    SetPlayerPos(playerid,-26.6916,-55.7149,1003.5469);
    SetPlayerFacingAngle(playerid,0.0000);
    SetCameraBehindPlayer(playerid);
    }
    }
    
    if(getCheckpointType(playerid) == 88 && getCheckpointType(playerid) == 88)
    {
    if(!IsPlayerInAnyVehicle(playerid))
    {
    SetPlayerVirtualWorld(playerid,6);
    SetPlayerInterior(playerid,6);
    SetPlayerPos(playerid,-26.6916,-55.7149,1003.5469);
    SetPlayerFacingAngle(playerid,0.0000);
    SetCameraBehindPlayer(playerid);
    }
    }
    
    
    
    
 	if(getCheckpointType(playerid) == 42 && getCheckpointType(playerid) == 42)
    {
    if(GetPlayerMoney(playerid) >= 25) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Public Bar_|");
    SendClientMessage(playerid,0x00C7FFAA,"You purchased a cold beer for $20 from the bar");
    GameTextForPlayer(playerid,"~w~beer purchased for $20",5000,3);
    GivePlayerMoney(playerid,-20);
    new Float:beerhealth;
    GetPlayerHealth(playerid,beerhealth);
	if(beerhealth <=95) {
    SetPlayerHealth(playerid,beerhealth+5);
    }
    }
    }

    

	if(getCheckpointType(playerid) == 45 && getCheckpointType(playerid) == 45)
    {
	SendClientMessage(playerid,0x00C7FFAA,"You can blow the door off the vault with C4. Get C4 at the bomb shop in Redsands");
	SendClientMessage(playerid,0x00C7FFAA,"Type /prepc4 to start a robbery attempt");
	}
	
	if(getCheckpointType(playerid) == 72 && getCheckpointType(playerid) == 72)
	{
	if(!IsPlayerInAnyVehicle(playerid))
	{
	GameTextForPlayer(playerid,"~w~WIN YOUR OWN CAR ON OUR SERVER~n~TYPE ~y~/BUYTICKET~w~ for $1k to enter",5000,3);
	SendClientMessage(playerid,COLOR_YELLOW,"You can win this BULLET vehicle. If you win, only you will be able to drive it");
	SendClientMessage(playerid,COLOR_YELLOW,"Only buy a ticket if you can be online on the 5th October 2007 at 1800 (GMT+1)");
	SendClientMessage(playerid,COLOR_YELLOW,"The winner will be notified on the server at the time of the draw");
	SendClientMessage(playerid,COLOR_YELLOW,"Not open to Server Admins or Current Business Owners");
	}
	}
	
	
	if(getCheckpointType(playerid) == 73 && getCheckpointType(playerid) == 73)
	{
	    if(DeliveringCash[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Bank - Cash Picked Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked up the cash for all of the ATM's in Las Venturas");
		SendClientMessage(playerid,0xADD8E6AA,"The first ATM on your route is in Whitewood Estates");
        DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 74;
        SetPlayerCheckpoint(playerid,checkpoints[74][0],checkpoints[74][1],checkpoints[74][2],checkpoints[74][3]); // no 2
	}
return 1;
	}
	

	
	if(getCheckpointType(playerid) == 74 && getCheckpointType(playerid) == 74)
	{
	    if(DeliveringCash[playerid] == 1337)
	    {
	    new cashrefill =0;
	    new deliverername[30];
	    GetPlayerName(playerid,deliverername,30);
		totalcashdelivered[playerid] =0;
 		cashrefill = 600000 - atmcash1;
 		totalcashdelivered[playerid] +=cashrefill;
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Bank - Cash Delivered_|");
		if(atmcash1 == 600000) {
		SendClientMessage(playerid,0x00C7FFAA,"This ATM does not need any cash. It is full");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 75;
        SetPlayerCheckpoint(playerid,checkpoints[75][0],checkpoints[75][1],checkpoints[75][2],checkpoints[75][3]); // no 2
		return 1;
		}
		format(string, sizeof(string), "You have delivered $%d to this ATM - Goto the next ATM in Roca Escalante",cashrefill);
		SendClientMessage(playerid, 0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has delivered $%d to the ATM in Whitewood Estates",deliverername,playerid,cashrefill);
		SendClientMessageToAll(0x00C7FFAA, string);
		printf("%s",string);
		atmcash1 +=cashrefill;
        DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 75;
        SetPlayerCheckpoint(playerid,checkpoints[75][0],checkpoints[75][1],checkpoints[75][2],checkpoints[75][3]); // no 2
	}
return 1;
	}
	
	
		if(getCheckpointType(playerid) == 75 && getCheckpointType(playerid) == 75)
	{
	    if(DeliveringCash[playerid] == 1337)
	    {
	    new cashrefill =0;
	    new deliverername[30];
	    GetPlayerName(playerid,deliverername,30);
 		cashrefill = 600000 - atmcash2;
 		totalcashdelivered[playerid] +=cashrefill;
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Bank - Cash Delivered_|");
		if(atmcash2 == 600000) {
		SendClientMessage(playerid,0x00C7FFAA,"This ATM does not need any cash. It is full");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 76;
        SetPlayerCheckpoint(playerid,checkpoints[76][0],checkpoints[76][1],checkpoints[76][2],checkpoints[76][3]); // no 2
		return 1;
		}
		format(string, sizeof(string), "You have delivered $%d to this ATM - Goto the next ATM in at 24/7 beside the Starfish Casino",cashrefill);
		SendClientMessage(playerid, 0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has delivered $%d to the ATM in Roca Escalante",deliverername,playerid,cashrefill);
		SendClientMessageToAll(0x00C7FFAA, string);
		printf("%s",string);
		atmcash2 +=cashrefill;
        DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 76;
        SetPlayerCheckpoint(playerid,checkpoints[76][0],checkpoints[76][1],checkpoints[76][2],checkpoints[76][3]); // no 2
	}
return 1;
	}
	
		if(getCheckpointType(playerid) == 76 && getCheckpointType(playerid) == 76)
	{
	    if(DeliveringCash[playerid] == 1337)
	    {
	    new cashrefill =0;
	    new deliverername[30];
	    GetPlayerName(playerid,deliverername,30);
 		cashrefill = 600000 - atmcash3;
 		totalcashdelivered[playerid] +=cashrefill;
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Bank - Cash Delivered_|");
		if(atmcash3 == 600000) {
		SendClientMessage(playerid,0x00C7FFAA,"This ATM does not need any cash. It is full");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 77;
        SetPlayerCheckpoint(playerid,checkpoints[77][0],checkpoints[77][1],checkpoints[77][2],checkpoints[77][3]); // no 2
		return 1;
		}
		format(string, sizeof(string), "You have delivered $%d to this ATM - Goto the next ATM in Come-Alot",cashrefill);
		SendClientMessage(playerid, 0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has delivered $%d to the ATM at the Starfish Casino",deliverername,playerid,cashrefill);
		SendClientMessageToAll(0x00C7FFAA, string);
		printf("%s",string);
		atmcash3 +=cashrefill;
        DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 77;
        SetPlayerCheckpoint(playerid,checkpoints[77][0],checkpoints[77][1],checkpoints[77][2],checkpoints[77][3]); // no 2
	}
return 1;
	}


		if(getCheckpointType(playerid) == 77 && getCheckpointType(playerid) == 77)
	{
	    if(DeliveringCash[playerid] == 1337)
	    {
	    new cashrefill =0;
	    new deliverername[30];
	    GetPlayerName(playerid,deliverername,30);
 		cashrefill = 600000 - atmcash4;
 		totalcashdelivered[playerid] +=cashrefill;
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Bank - Cash Delivered_|");
		if(atmcash4 == 600000) {
		SendClientMessage(playerid,0x00C7FFAA,"This ATM does not need any cash. It is full");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 78;
        SetPlayerCheckpoint(playerid,checkpoints[78][0],checkpoints[78][1],checkpoints[78][2],checkpoints[78][3]); // no 2
		return 1;
		}
		format(string, sizeof(string), "You have delivered $%d to this ATM - Take the van back to LV City Bank to get paid",cashrefill);
		SendClientMessage(playerid, 0x00C7FFAA, string);
        format(string, sizeof(string), "%s(%d) Has delivered $%d to the ATM in Come-Alot",deliverername,playerid,cashrefill);
		SendClientMessageToAll(0x00C7FFAA, string);
		printf("%s",string);
		atmcash4 +=cashrefill;
        DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 78;
        SetPlayerCheckpoint(playerid,checkpoints[78][0],checkpoints[78][1],checkpoints[78][2],checkpoints[78][3]); // no 2
		}
		return 1;
		}


		if(getCheckpointType(playerid) == 78 && getCheckpointType(playerid) == 78)
		{
	    if(DeliveringCash[playerid] == 1337)
	    {
	    new cashrefill =0;
	    new deliverername[30];
	    new cashdeliveryearnings =0;
	    GetPlayerName(playerid,deliverername,30);
 		cashrefill = 600000 - atmcash4;
 		totalcashdelivered[playerid] +=cashrefill;
 		if(totalcashdelivered[playerid] >=1 && totalcashdelivered[playerid] <=5000) {
 		cashdeliveryearnings =1000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=5001 && totalcashdelivered[playerid] <=10000) {
 		cashdeliveryearnings =2000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=10001 && totalcashdelivered[playerid] <=20000) {
 		cashdeliveryearnings =3000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=20001 && totalcashdelivered[playerid] <=30000) {
 		cashdeliveryearnings =4000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=30001 && totalcashdelivered[playerid] <=40000) {
 		cashdeliveryearnings =5000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=40001 && totalcashdelivered[playerid] <=60000) {
 		cashdeliveryearnings =8000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=70001 && totalcashdelivered[playerid] <=100000) {
 		cashdeliveryearnings =15000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=100001 && totalcashdelivered[playerid] <=150000) {
 		cashdeliveryearnings =20000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=150001 && totalcashdelivered[playerid] <=200000) {
 		cashdeliveryearnings =25000;
 		}
 		else
 		if(totalcashdelivered[playerid] >=250000) {
 		cashdeliveryearnings =50000;
 		}
		SendClientMessage(playerid, 0xA9A9A9AA, "|_LV City Bank - Cash Delivery Complete_|");
		format(string, sizeof(string), "You have delivered a total of $%d to the ATM's in Las Venturas. You were paid $%d",totalcashdelivered[playerid],cashdeliveryearnings);
		SendClientMessage(playerid, 0x00C7FFAA, string);
		GivePlayerMoney(playerid,cashdeliveryearnings);
        format(string, sizeof(string), "%s(%d) has delivered a total of $%d to the ATM's in Las Venturas and was paid $%d ",deliverername,playerid,totalcashdelivered[playerid],cashdeliveryearnings);
		printf("%s",string);
		oscore = GetPlayerScore(playerid);
    	SetPlayerScore(playerid, oscore +1);
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 999;
    	DeliveringCash[playerid] =0;
    	totalcashdelivered[playerid] =0;
		}
		return 1;
		}









	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if(getCheckpointType(playerid) == 58 && getCheckpointType(playerid) == 58)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 0)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Picked up - Mission 1_|");
		SendClientMessage(playerid,0xADD8E6AA,"Take these weapons to the Ammunation store in Los Santos (Market)");
		SendClientMessage(playerid,0xADD8E6AA,"Make sure you get there before the timer runs out or the mission will be failed");
        DisablePlayerCheckpoint(playerid);
        GunsDeliveryTime[playerid] = 100;
    	playerCheckpoint[playerid] = 59;
        SetPlayerCheckpoint(playerid,checkpoints[59][0],checkpoints[59][1],checkpoints[59][2],checkpoints[59][3]); // no 2
	}
return 1;
	}

	if(getCheckpointType(playerid) == 59 && getCheckpointType(playerid) == 59)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 0)
	    {
	    new deliveryname[30];
	    OnDelMission[playerid] =0;
	    DeliveringGuns[playerid] =0;
	    GetPlayerName(playerid,deliveryname,30);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Delivered - Mission 1_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have delivered the weapons on time. You earned: $1500");
		SendClientMessage(playerid,0xADD8E6AA,"Type /gundelivery when you want to start Mission 2");
		format(string, sizeof(string), "%s(%d) Has delivered weapons from South LV Ammunation to Los Santos Ammunation (Mission 1)",deliveryname,playerid);
    	SendClientMessageToAll(0x00C7FFAA, string);
    	printf("%s",string);
    	GivePlayerMoney(playerid,1500);
    	GunsDeliveryTime[playerid] =0;
    	GunDeliveryLevel[playerid] =1;
 		DisablePlayerCheckpoint(playerid);
    	}
return 1;
	}
	
	if(getCheckpointType(playerid) == 60 && getCheckpointType(playerid) == 60)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 1)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Picked up - Mission 2_|");
		SendClientMessage(playerid,0xADD8E6AA,"Take these weapons to the Ammunation store in Los Santos (Willowfield)");
		SendClientMessage(playerid,0xADD8E6AA,"Make sure you get there before the timer runs out or the mission will be failed");
		DisablePlayerCheckpoint(playerid);
        GunsDeliveryTime[playerid] = 62;
    	playerCheckpoint[playerid] = 61;
        SetPlayerCheckpoint(playerid,checkpoints[61][0],checkpoints[61][1],checkpoints[61][2],checkpoints[61][3]); // no 2
    	}
return 1;
	}
	
	if(getCheckpointType(playerid) == 61 && getCheckpointType(playerid) == 61)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 1)
	    {
	    new deliveryname[30];
	    OnDelMission[playerid] =0;
	    DeliveringGuns[playerid] =0;
	    GetPlayerName(playerid,deliveryname,30);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Delivered - Mission 2_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have delivered the weapons on time. You earned: $2000");
		SendClientMessage(playerid,0xADD8E6AA,"Type /gundelivery when you want to start Mission 3");
		format(string, sizeof(string), "%s(%d) Has delivered weapons from Ammunation in Market to Ammunation in Willowfield (Mission 2)",deliveryname,playerid);
    	SendClientMessageToAll(0x00C7FFAA, string);
    	printf("%s",string);
    	GivePlayerMoney(playerid,2000);
 		DisablePlayerCheckpoint(playerid);
    	GunsDeliveryTime[playerid] =0;
    	GunDeliveryLevel[playerid] =2;
    	}
return 1;
	}
	
	
 	if(getCheckpointType(playerid) == 62 && getCheckpointType(playerid) == 62)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 2)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Picked up - Mission 3_|");
		SendClientMessage(playerid,0xADD8E6AA,"Take these weapons to the Ammunation store in Whetstone");
		SendClientMessage(playerid,0xADD8E6AA,"Make sure you get there before the timer runs out or the mission will be failed");
		DisablePlayerCheckpoint(playerid);
        GunsDeliveryTime[playerid] = 180;
    	playerCheckpoint[playerid] = 63;
        SetPlayerCheckpoint(playerid,checkpoints[63][0],checkpoints[63][1],checkpoints[63][2],checkpoints[63][3]); // no 2
    	}
return 1;
	}

	if(getCheckpointType(playerid) == 63 && getCheckpointType(playerid) == 63)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 2)
	    {
	    new deliveryname[30];
	    OnDelMission[playerid] =0;
	    DeliveringGuns[playerid] =0;
	    GetPlayerName(playerid,deliveryname,30);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Delivered - Mission 3_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have delivered the weapons on time. You earned: $2500");
		SendClientMessage(playerid,0xADD8E6AA,"Type /gundelivery when you want to start Mission 4");
		format(string, sizeof(string), "%s(%d) Has delivered weapons from RS Haul to Ammunation in Whetstone (Mission 3)",deliveryname,playerid);
    	SendClientMessageToAll(0x00C7FFAA, string);
    	printf("%s",string);
    	GivePlayerMoney(playerid,2500);
 		DisablePlayerCheckpoint(playerid);
    	GunsDeliveryTime[playerid] =0;
    	GunDeliveryLevel[playerid] =3;
    	}
return 1;
	}
	
	
	if(getCheckpointType(playerid) == 64 && getCheckpointType(playerid) == 64)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 3)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Picked up - Mission 4_|");
		SendClientMessage(playerid,0xADD8E6AA,"The cops at SFPD are wating on these weapons. Dont be late");
		SendClientMessage(playerid,0xADD8E6AA,"Make sure you get there before the timer runs out or the mission will be failed");
		DisablePlayerCheckpoint(playerid);
        GunsDeliveryTime[playerid] = 60;
    	playerCheckpoint[playerid] = 65;
        SetPlayerCheckpoint(playerid,checkpoints[65][0],checkpoints[65][1],checkpoints[65][2],checkpoints[65][3]); // no 2
    	}
return 1;
	}

	if(getCheckpointType(playerid) == 65 && getCheckpointType(playerid) == 65)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 3)
	    {
	    new deliveryname[30];
	    OnDelMission[playerid] =0;
	    DeliveringGuns[playerid] =0;
	    GetPlayerName(playerid,deliveryname,30);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Delivered - Mission 4_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have delivered the weapons on time. You earned: $5000");
		SendClientMessage(playerid,0xADD8E6AA,"Type /gundelivery when you want to start Mission 5");
		format(string, sizeof(string), "%s(%d) Has delivered weapons from Ammunation in Ocean Flats to SFPD (Mission 4)",deliveryname,playerid);
    	SendClientMessageToAll(0x00C7FFAA, string);
    	printf("%s",string);
    	GivePlayerMoney(playerid,5000);
 		DisablePlayerCheckpoint(playerid);
    	GunsDeliveryTime[playerid] =0;
    	GunDeliveryLevel[playerid] =4;
    	}
return 1;
	}
	
	if(getCheckpointType(playerid) == 66 && getCheckpointType(playerid) == 66)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 4)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Picked up - Mission 5_|");
		SendClientMessage(playerid,0xADD8E6AA,"Drop these military weapons at Area 69");
		SendClientMessage(playerid,0xADD8E6AA,"Make sure you get there before the timer runs out or the mission will be failed");
		DisablePlayerCheckpoint(playerid);
        GunsDeliveryTime[playerid] = 150;
    	playerCheckpoint[playerid] = 67;
        SetPlayerCheckpoint(playerid,checkpoints[67][0],checkpoints[67][1],checkpoints[67][2],checkpoints[67][3]); // no 2
    	}
return 1;
	}

	if(getCheckpointType(playerid) == 67 && getCheckpointType(playerid) == 67)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 4)
	    {
	    new deliveryname[30];
	    OnDelMission[playerid] =0;
	    DeliveringGuns[playerid] =0;
	    GetPlayerName(playerid,deliveryname,30);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Delivered - Mission 5_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have delivered the weapons on time. You earned: $6000");
		SendClientMessage(playerid,0xADD8E6AA,"Type /gundelivery when you want to start Mission 6");
		format(string, sizeof(string), "%s(%d) Has delivered weapons from Easter Bay Naval Base to Areas 69 (Mission 5)",deliveryname,playerid);
    	SendClientMessageToAll(0x00C7FFAA, string);
    	printf("%s",string);
    	GivePlayerMoney(playerid,6000);
 		DisablePlayerCheckpoint(playerid);
    	GunsDeliveryTime[playerid] =0;
    	GunDeliveryLevel[playerid] =5;
    	}
return 1;
	}
	
	
	if(getCheckpointType(playerid) == 68 && getCheckpointType(playerid) == 68)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 5)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Picked up - Mission 6_|");
		SendClientMessage(playerid,0xADD8E6AA,"LVPD Army base requires missiles and other ammo. Drop this load at the LVPD Army Base");
		SendClientMessage(playerid,0xADD8E6AA,"Make sure you get there before the timer runs out or the mission will be failed");
		DisablePlayerCheckpoint(playerid);
        GunsDeliveryTime[playerid] = 120;
    	playerCheckpoint[playerid] = 69;
        SetPlayerCheckpoint(playerid,checkpoints[69][0],checkpoints[69][1],checkpoints[69][2],checkpoints[69][3]); // no 2
    	}
return 1;
	}

	if(getCheckpointType(playerid) == 69 && getCheckpointType(playerid) == 69)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 5)
	    {
	    new deliveryname[30];
	    OnDelMission[playerid] =0;
	    DeliveringGuns[playerid] =0;
	    GetPlayerName(playerid,deliveryname,30);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Delivered - Mission 6_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have delivered the weapons on time. You earned: $8000");
		SendClientMessage(playerid,0xADD8E6AA,"Type /gundelivery when you want to start Mission 7");
		format(string, sizeof(string), "%s(%d) Has delivered weapons from Area 69 to LV Army Base (Mission 6)",deliveryname,playerid);
    	SendClientMessageToAll(0x00C7FFAA, string);
    	printf("%s",string);
    	GivePlayerMoney(playerid,8000);
 		DisablePlayerCheckpoint(playerid);
    	GunsDeliveryTime[playerid] =0;
    	GunDeliveryLevel[playerid] =6;
    	}
return 1;
	}
	
	
	if(getCheckpointType(playerid) == 70 && getCheckpointType(playerid) == 70)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 6)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Picked up - Mission 7_|");
		SendClientMessage(playerid,0xADD8E6AA,"Drop these weapons at LVPD HQ - This is the final delivery");
		SendClientMessage(playerid,0xADD8E6AA,"Make sure you get there before the timer runs out or the mission will be failed");
		DisablePlayerCheckpoint(playerid);
        GunsDeliveryTime[playerid] = 80;
    	playerCheckpoint[playerid] = 71;
        SetPlayerCheckpoint(playerid,checkpoints[71][0],checkpoints[71][1],checkpoints[71][2],checkpoints[71][3]); // no 2
    	}
return 1;
	}

	if(getCheckpointType(playerid) == 71 && getCheckpointType(playerid) == 71)
	{
	    if(OnDelMission[playerid] == 1337 && GunDeliveryLevel[playerid] == 6)
	    {
	    new deliveryname[30];
	    OnDelMission[playerid] =0;
	    DeliveringGuns[playerid] =0;
	    GetPlayerName(playerid,deliveryname,30);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Weapons Delivered - Mission 7_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have delivered the weapons on time. You earned: $8000");
		SendClientMessage(playerid,0xADD8E6AA,"You have completed all of the Gun Delivery missions. You earn a $15000 bonus");
		format(string, sizeof(string), "%s(%d) Has delivered weapons from LV Army Base to LVPD HQ (Mission 7)",deliveryname,playerid);
    	SendClientMessageToAll(0x00C7FFAA, string);
    	printf("%s",string);
    	GivePlayerMoney(playerid,23000);
 		DisablePlayerCheckpoint(playerid);
    	GunsDeliveryTime[playerid] =0;
    	GunDeliveryLevel[playerid] =0;
    	}
return 1;
	}
	
	if(getCheckpointType(playerid) == 47 && getCheckpointType(playerid) == 47)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from Well Stacked Pizza Co");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at Well Stacked Pizza Co in The Emerald Isle");
        DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 48;
        SetPlayerCheckpoint(playerid,checkpoints[48][0],checkpoints[48][1],checkpoints[48][2],checkpoints[48][3]); // no 2
	}
return 1;
	}
	
	if(getCheckpointType(playerid) == 48 && getCheckpointType(playerid) == 48)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from Well Stacked Pizza Co");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at Caligulas Casino (rear)");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 49;
        SetPlayerCheckpoint(playerid,checkpoints[49][0],checkpoints[49][1],checkpoints[49][2],checkpoints[49][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 49 && getCheckpointType(playerid) == 49)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from Caligulas Casino");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at Admin HQ (rear)");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 50;
        SetPlayerCheckpoint(playerid,checkpoints[50][0],checkpoints[50][1],checkpoints[50][2],checkpoints[50][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 50 && getCheckpointType(playerid) == 50)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from Admin HQ");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at Ammunation (South LV)");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 51;
        SetPlayerCheckpoint(playerid,checkpoints[51][0],checkpoints[51][1],checkpoints[51][2],checkpoints[51][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 51 && getCheckpointType(playerid) == 51)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from Ammunation (South LV)");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at old grandmas house in Rockshore");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 52;
        SetPlayerCheckpoint(playerid,checkpoints[52][0],checkpoints[52][1],checkpoints[52][2],checkpoints[52][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 52 && getCheckpointType(playerid) == 52)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		new grandmarand = random(10000);

        SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from old grandmas house in Rockshore");
		format(string, sizeof(string), "old grandma has given you a $%d tip - how sweet! ",grandmarand);
    	SendClientMessage(playerid,0xADD8E6AA, string);
    	format(string, sizeof(string), "~w~$%d~n~TIP",grandmarand);
		GameTextForPlayer(playerid,string,6000,3);
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at LVA Freight Depot");
		GivePlayerMoney(playerid,grandmarand);
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 53;
        SetPlayerCheckpoint(playerid,checkpoints[53][0],checkpoints[53][1],checkpoints[53][2],checkpoints[53][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 53 && getCheckpointType(playerid) == 53)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
	    SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
	    SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from LVA Freight Depot");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at LVPD Air Support Unit");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 54;
        SetPlayerCheckpoint(playerid,checkpoints[54][0],checkpoints[54][1],checkpoints[54][2],checkpoints[54][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 54 && getCheckpointType(playerid) == 54)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
	    SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from LVPD Air Support Unit");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at The Quarry");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 55;
        SetPlayerCheckpoint(playerid,checkpoints[55][0],checkpoints[55][1],checkpoints[55][2],checkpoints[55][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 55 && getCheckpointType(playerid) == 55)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from The Quarry");
		SendClientMessage(playerid,0xADD8E6AA,"Goto the next pickup at San Fierro Police Department");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 56;
        SetPlayerCheckpoint(playerid,checkpoints[56][0],checkpoints[56][1],checkpoints[56][2],checkpoints[56][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 56 && getCheckpointType(playerid) == 56)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Pick Up_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have picked trash up from San Fierro Police Department");
		SendClientMessage(playerid,0xADD8E6AA,"This was the last pickup. Go and dump the trash at the trash site");
		SendClientMessage(playerid,0xADD8E6AA,"The city will pay you when you deliver the trash!");
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 57;
        SetPlayerCheckpoint(playerid,checkpoints[57][0],checkpoints[57][1],checkpoints[57][2],checkpoints[57][3]); // no 2
	}
return 1;
	}
	if(getCheckpointType(playerid) == 57 && getCheckpointType(playerid) == 57)
	{
	    if(OnDelMission[playerid] == 1337)
	    {
		new trashtime = (TrashDeliveryTime[playerid]);
		new trashearn = (TrashDeliveryEarnings[playerid]);
		new trashname[30];
		GetPlayerName(playerid,trashname,30);
		format(string, sizeof(string), "%s(%d) Has collected all the trash from the city and dropped it all off in San Fierro! Time Taken: %d Seconds",trashname,playerid,trashtime);
    	SendClientMessageToAll(0x00C7FFAA, string);
		SendClientMessage(playerid, 0xA9A9A9AA, "|_Trash Delivery Mission Complete_|");
		SendClientMessage(playerid,0xADD8E6AA,"You have collected all the trash. You have cleaned the city up");
		format(string, sizeof(string), "Time Taken: %d Seconds = Earnings: $%d ",trashtime,trashearn);
    	SendClientMessage(playerid,0xADD8E6AA, string);
		DisablePlayerCheckpoint(playerid);
    	playerCheckpoint[playerid] = 999;
    	OnDelMission[playerid] =0;
    	GivePlayerMoney(playerid,trashearn);
	}
}

	
 	if(getCheckpointType(playerid) == 22 && getCheckpointType(playerid) == 22)
	{
	if(!IsPlayerInAnyVehicle(playerid) && RobbedCaligs[playerid] == 1337)
	{
	new crobrand = random(300000);
	if(crobrand >=0 && crobrand <=20) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Vault Lockdown_|");
	SendClientMessage(playerid,0x00C7FFAA,"Security have heard the explosion and remotely locked the vault cages. Robbery Failed!");
	RobbedCaligs[playerid] =0;
	return 1;
	}
	else
	if(crobrand >=21 && crobrand <=300000) {
	new plwl = GetPlayerWantedLevel(playerid);
	SetPlayerWantedLevel(playerid, plwl +4 );
	new caligsname[30];
	GetPlayerName(playerid,caligsname, 30);
	format(string, sizeof(string), "%s(%d) Has robbed $%d from the Caligulas Casino vault",caligsname,playerid,crobrand);
	SendClientMessageToAll(0x00C7FFAA, string);
	ircSay(EchoConnection, EchoChan,string);
	format(string, sizeof(string), "%s(%d) Has robbed $%d from Caligulas casino",caligsname,playerid,crobrand);
	printf("%s", string);
	format(string, sizeof(string), "~w~ROBBERY ~b~COMPLETE~n~~w~YOU HAVE ROBBED~n~~r~ $%d~n~~w~FROM THE CASINO VAULT",crobrand);
	GameTextForPlayer(playerid, string, 7000, 3);
	new pcol = GetPlayerColor(playerid);
	plwl = GetPlayerWantedLevel(playerid);
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Crime Commited_|");
	format(string, sizeof(string), "(CASINO ROBBERY) Wanted Level %d",plwl);
	SendClientMessage(playerid,pcol,string);
	GivePlayerMoney(playerid,crobrand);
	RobbedCasRecent[playerid] =1;
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	CaligsRobbed =1;
	respect[playerid] -=1;
	if(robberrank[playerid] >=20 && robberrank[playerid] <=29) {
    SendClientMessage(playerid,COLOR_WHITE,"Your robbing skill level has been increased. Type /robskill for more info");
    SendClientMessage(playerid,COLOR_WHITE,"Your respect level has been decreased. Type /respect for more information");
    robberrank[playerid] +=1;
    respect[playerid] -=1;
	}
	commitedcrimerecently[playerid] +=360;
	SetTimer("CaligsRobbedRecent",300000,0);
	RobbedCaligs[playerid] =0;
	caligsbeingrobbed =0;
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(LawEnforcementRadio[i] == 1) {
    new string1[256];
    new string2[256];
    new string3[256];
	format(string1, sizeof(string1), "DISPATCH: (CASINO ROBBERY) The Caligula's Casino Vault has been robbed. Suspect: %s(%d)",caligsname,playerid);
	format(string2, sizeof(string2), "ALL UNITS: Please respond to Caligula's Casino");
	format(string3, sizeof(string3), "Type /radoff to turn your Law Enforcement radio off");
	SendClientMessage(i, COLOR_ROYALBLUE, string1);
	SendClientMessage(i, COLOR_ROYALBLUE, string2);
	SendClientMessage(i, COLOR_DODGERBLUE, string3);
	}
    }
    }
    }
	return 1;
	}
 	

	if(getCheckpointType(playerid) == 44 && getCheckpointType(playerid) == 44)
	{
	if(!IsPlayerInAnyVehicle(playerid))
	{
	if(gTeam[playerid] == 1 || gTeam[playerid] == 2 || gTeam[playerid] == 3 || gTeam[playerid] == 4 || gTeam[playerid] == 5 || gTeam[playerid] == 6 || gTeam[playerid] == 7 || gTeam[playerid] == 8) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Bomb Shop_|");
	SendClientMessage(playerid,0x00C7FFAA,"Wow.. I dont sell anything to your class/skill/job");
	return 1;
	}
	if(HasC4[playerid] == 1) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Bomb Shop_|");
	SendClientMessage(playerid,0x00C7FFAA,"You already have enough C4 to send yourself and two friends to the moon...");
	return 1;
	}
	if(HasC4[playerid] == 0 && GetPlayerMoney(playerid) >= 2500) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Bomb Shop_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have purchase 3 blocks of C4 - You have been charged $2500");
	SendClientMessage(playerid,0x00C7FFAA,"Goto Caligulas Casino and type /prepc4 in the checkpoint");
	GivePlayerMoney(playerid,-2500);
	HasC4[playerid] =1;
	}
	else {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Bomb Shop_|");
	SendClientMessage(playerid,0x00C7FFAA,"You aint got enough cash. Come back when you have $2500");
	}
	}
	return 1;
	}
	
	
	   
	if(getCheckpointType(playerid) == 43 && getCheckpointType(playerid) == 43)
	{
	if(gTeam[playerid] == 1 || gTeam[playerid] == 2) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"This is where wanted suspects can hand themselves into the police");
	return 1;
	}
	if(GetPlayerWantedLevel(playerid) == 0) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"This is where wanted suspects can hand themselves into the police - You are innocent");
	}
	new wantedsuspect[25];
	GetPlayerName(playerid,wantedsuspect,25);
	if(GetPlayerWantedLevel(playerid) == 1) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
    SendClientMessage(playerid,COLOR_DODGERBLUE,"Las Venturas Police Department has fined you $500. Your wanted level has been reduced");
    format(string, sizeof(string), "~w~You have been fined~n~ ~b~$500");
    GameTextForPlayer(playerid, string,5000,3);
    SetPlayerWantedLevel(playerid,0);
    GivePlayerMoney(playerid, -500);
    printf("%s(%d) has been fined $500 at lvpd hq",wantedsuspect,playerid);
    return 1;
    }
    if(GetPlayerWantedLevel(playerid) == 2) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
    SendClientMessage(playerid,COLOR_DODGERBLUE,"Las Venturas Police Department has fined you $1000. Your wanted level has been reduced");
    format(string, sizeof(string), "~w~You have been fined~n~ ~b~$1000");
    GameTextForPlayer(playerid, string,5000,3);
    SetPlayerWantedLevel(playerid,0);
    GivePlayerMoney(playerid, -1000);
    printf("%s(%d) has been fined $1000 at lvpd hq",wantedsuspect,playerid);
    return 1;
    }
    if(GetPlayerWantedLevel(playerid) == 3) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
    SendClientMessage(playerid,COLOR_DODGERBLUE,"Las Venturas Police Department has fined you $2000. Your wanted level has been reduced");
    format(string, sizeof(string), "~w~You have been fined~n~ ~b~$2000");
    GameTextForPlayer(playerid, string,5000,3);
    SetPlayerWantedLevel(playerid,0);
    GivePlayerMoney(playerid, -2000);
    printf("%s(%d) has been fined $2000 at lvpd hq",wantedsuspect,playerid);
    return 1;
    }
	if(EscapedConvict[playerid] == 1 && GetPlayerWantedLevel(playerid) >=10) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have given yourself into the police. You have been sent to Alcatraz");
    SetPlayerInterior(playerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(playerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(playerid, AlcatrazArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Escaped Convict %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(playerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(playerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    format(string, sizeof(string), "Escaped Convict %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    printf("%s", string);
    SendClientMessage(playerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
	Jailed[playerid] =1;
	InAlcatraz[playerid] =1;
	StoleCopCarRecent[playerid] =0;
	triedtoescaperecent[playerid] =1;
	ResetPlayerWeapons(playerid);
	JailTime[playerid] =300;
	JailTimeServed[playerid] =0;
	EscapedConvict[playerid] =0;
	SetPlayerWantedLevel(playerid,0);
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
	if(GetPlayerWantedLevel(playerid) >= 4 && GetPlayerWantedLevel(playerid) <= 5) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have given yourself into the police. You have been detained");
	//SetPlayerInterior(playerid,3);
	new rnd;
	rnd = random(sizeof (ArrestedSpawn));
	SetPlayerPos(playerid, ArrestedSpawn[rnd][0], ArrestedSpawn[rnd][1], ArrestedSpawn[rnd][2]);
	SetPlayerFacingAngle(playerid, ArrestedSpawn[rnd][3]);
	format(string, sizeof(string), "Wanted suspect %s(%d) has handed himself into LVPD and has been detained by police",wantedsuspect,playerid);
	SendClientMessageToAll(0x00C7FFAA, string);
	ircSay(EchoConnection, EchoChan,string);
	SendClientMessage(playerid,0x00C7FFAA,"You will be auto-released from jail or a Police Officer/Jail Turnkey can release you early");
    format(string, sizeof(string), "Wanted suspect %s(%d) has handed himself into LVPD and has been detained by police",wantedsuspect,playerid);
    printf("%s", string);
    SendClientMessage(playerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    Jailed[playerid] =1;
	StoleCopCarRecent[playerid] =0;
	cannotescapejail[playerid] =1;
	ResetPlayerWeapons(playerid);
	JailTime[playerid] =60;
	JailTimeServed[playerid] =0;
	SetPlayerWantedLevel(playerid,0);
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
	if(GetPlayerWantedLevel(playerid) >=6 && GetPlayerWantedLevel(playerid) <=9) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have given yourself into the police. You have been detained");
    //SetPlayerInterior(giveplayerid,3);
    new rnd;
    rnd = random(sizeof (ArrestedSpawn));
    SetPlayerPos(playerid, ArrestedSpawn[rnd][0], ArrestedSpawn[rnd][1], ArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(playerid, ArrestedSpawn[rnd][3]);
    format(string, sizeof(string), "Wanted suspect %s(%d) has handed himself into LVPD and has been detained by police",wantedsuspect,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    SendClientMessage(playerid,0x00C7FFAA,"You will be auto-released from jail or a Police Officer/Jail Turnkey can release you early");
    format(string, sizeof(string), "Wanted suspect %s(%d) has handed himself into LVPD and has been detained by police",wantedsuspect,playerid);
    printf("%s", string);
    SendClientMessage(playerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
	Jailed[playerid] =1;
	StoleCopCarRecent[playerid] =0;
	cannotescapejail[playerid] =1;
	triedtoescaperecent[playerid] =1;
	ResetPlayerWeapons(playerid);
	JailTime[playerid] =160;
	JailTimeServed[playerid] =0;
	SetPlayerWantedLevel(playerid,0);
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
	if(GetPlayerWantedLevel(playerid) == 9) {
	SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have given yourself into the police. You have been detained");
    //SetPlayerInterior(giveplayerid,3);
    new rnd;
    rnd = random(sizeof (ArrestedSpawn));
    SetPlayerPos(playerid, ArrestedSpawn[rnd][0], ArrestedSpawn[rnd][1], ArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(playerid, ArrestedSpawn[rnd][3]);
    SendClientMessage(playerid,0x00C7FFAA,"You will be auto-released from jail or a Police Officer/Jail Turnkey can release you early");
    format(string, sizeof(string), "Wanted suspect %s(%d) has handed himself into LVPD and has been detained by police",wantedsuspect,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    format(string, sizeof(string), "Wanted suspect %s(%d) has handed himself into LVPD and has been detained by police",wantedsuspect,playerid);
    printf("%s", string);
    SendClientMessage(playerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    Jailed[playerid] =1;
	StoleCopCarRecent[playerid] =0;
	cannotescapejail[playerid] =1;
	triedtoescaperecent[playerid] =1;
	ResetPlayerWeapons(playerid);
	JailTime[playerid] =200;
	JailTimeServed[playerid] =0;
	SetPlayerWantedLevel(playerid,0);
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(playerid) >=10 && GetPlayerWantedLevel(playerid) <=14) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have given yourself into the police. You have been detained");
    SetPlayerInterior(playerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(playerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(playerid, AlcatrazArrestedSpawn[rnd][3]);
    SendClientMessage(playerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(playerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
	format(string, sizeof(string), "Most Wanted suspect %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    printf("%s", string);
    SendClientMessage(playerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
    Jailed[playerid] =1;
	InAlcatraz[playerid] =1;
	StoleCopCarRecent[playerid] =0;
	cannotescapejail[playerid] =1;
	triedtoescaperecent[playerid] =1;
	ResetPlayerWeapons(playerid);
	JailTime[playerid] =280;
	JailTimeServed[playerid] =0;
	SetPlayerWantedLevel(playerid,0);
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(playerid) >=15 && GetPlayerWantedLevel(playerid) <=24) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have given yourself into the police. You have been detained");
    SetPlayerInterior(playerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(playerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(playerid, AlcatrazArrestedSpawn[rnd][3]);
    SendClientMessage(playerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(playerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    printf("%s", string);
    SendClientMessage(playerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
	Jailed[playerid] =1;
	InAlcatraz[playerid] =1;
	StoleCopCarRecent[playerid] =0;
	cannotescapejail[playerid] =1;
	triedtoescaperecent[playerid] =1;
	ResetPlayerWeapons(playerid);
	JailTime[playerid] =320;
	JailTimeServed[playerid] =0;
	SetPlayerWantedLevel(playerid,0);
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
	return 1;
    }
    if(GetPlayerWantedLevel(playerid) >=25) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Police Department_|");
	SendClientMessage(playerid,0x00C7FFAA,"You have given yourself into the police. You have been detained");
    SetPlayerInterior(playerid,10);
    new rnd;
    rnd = random(sizeof (AlcatrazArrestedSpawn));
    SetPlayerPos(playerid, AlcatrazArrestedSpawn[rnd][0], AlcatrazArrestedSpawn[rnd][1], AlcatrazArrestedSpawn[rnd][2]);
    SetPlayerFacingAngle(playerid, AlcatrazArrestedSpawn[rnd][3]);
    SendClientMessage(playerid,0x00C7FFAA,"You will be auto-released from Alcatraz once you have served your sentence");
    SendClientMessage(playerid,0x00C7FFAA,"If Alcatraz life sucks for you... Why not ask a friend to visit you? /reqvisit (id)");
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    SendClientMessageToAll(0x00C7FFAA, string);
    ircSay(EchoConnection, EchoChan,string);
    format(string, sizeof(string), "Most Wanted suspect %s(%d) has handed himself into LVPD and has been sent to Alcatraz",wantedsuspect,playerid);
    printf("%s", string);
    SendClientMessage(playerid,0xFF7F50AA,"If you leave the server while you are in jail you WILL be banned");
	Jailed[playerid] =1;
	InAlcatraz[playerid] =1;
	StoleCopCarRecent[playerid] =0;
	cannotescapejail[playerid] =1;
	triedtoescaperecent[playerid] =1;
	ResetPlayerWeapons(playerid);
	JailTime[playerid] =420;
	JailTimeServed[playerid] =0;
	SetPlayerWantedLevel(playerid,0);
	oscore = GetPlayerScore(playerid);
	SetPlayerScore(playerid, oscore +1);
    }
    return 1;
    }

	   
	   
	   
	   
	   
	   
	   
	   
       if(getCheckpointType(playerid) == 39 && getCheckpointType(playerid) == 39)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   if(Jailed[playerid] == 0) {
	   SetPlayerCameraPos(playerid,195.2251,172.8935,1005.6265);
	   
	   SetPlayerCameraLookAt(playerid,194.0067,176.0527,1003.0234);
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_LVPD Security Camera_|");
	   SendClientMessage(playerid,0xA9A9A9AA,"You are now looking through the security camera in Cell 3");
	   }
	   }
	   }
	   
	   if(getCheckpointType(playerid) == 40 && getCheckpointType(playerid) == 40)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   if(Jailed[playerid] == 0) {
	   SetPlayerCameraPos(playerid,199.4642,172.9892,1005.6265);

	   SetPlayerCameraLookAt(playerid,198.1925,176.4489,1003.0234);
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_LVPD Security Camera_|");
	   SendClientMessage(playerid,0xA9A9A9AA,"You are now looking through the security camera in Cell 2");
	   }
	   }
	   }
	   
	   if(getCheckpointType(playerid) == 41 && getCheckpointType(playerid) == 41)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   if(Jailed[playerid] == 0) {
	   SetPlayerCameraPos(playerid,196.6696,163.5814,1005.6265);

	   SetPlayerCameraLookAt(playerid,198.0134,160.9352,1003.0300);
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_LVPD Security Camera_|");
	   SendClientMessage(playerid,0xA9A9A9AA,"You are now looking through the security camera in Cell 1");
	   }
	   }
	   }
	   
	   
	   
	   
	   if(getCheckpointType(playerid) == 31 && getCheckpointType(playerid) == 31)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   if(gametime >=8 && gametime <=20)
	   {
	   
       SetPlayerPos(playerid,2310.1270,-15.4618,26.7496);
	   SetPlayerFacingAngle(playerid,272.8260);
	   SetCameraBehindPlayer(playerid);
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas City Bank_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "Welcome LV City Bank - Enter the main checkpoint to make transactions");
	   InBank[playerid] =1;
	   }
       else{
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas City Bank_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "The bank is currently closed. Come back between 8:00 and 21:00");
	   SendClientMessage(playerid, 0x00C7FFAA, "You can use 24h ATM machines to withdraw cash. Type /atmloc for locations");
	   }
	   }
       return 1;
	   }
	   
	   if(getCheckpointType(playerid) == 35 && getCheckpointType(playerid) == 35)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   if(gTeam[playerid] <= 2) {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Alcatraz Island_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "You have entered Alcatraz building. Prisoners in Alcatraz cannot be released early");
	   SetPlayerInterior(playerid,10);
	   SetPlayerPos(playerid,246.2731,112.8218,1003.2188);
	   SetPlayerFacingAngle(playerid,358.8193);
	   SetCameraBehindPlayer(playerid);
	   return 1;
	   }
	   if(gTeam[playerid] >= 2 && VisitReq[playerid] == 0) {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Alcatraz Island_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "Civilians can only enter the Alcatraz building with a valid visiting pass");
	   return 1;
	   }
	   if(gTeam[playerid] >= 2 && VisitReq[playerid] == 1) {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Alcatraz Island_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "You have a valid visiting pass. You have entered Alcatraz building");
	   SetPlayerInterior(playerid,10);
	   SetPlayerPos(playerid,246.2731,112.8218,1003.2188);
	   SetPlayerFacingAngle(playerid,358.8193);
	   SetCameraBehindPlayer(playerid);
	   VisitReq[playerid] =0;
	   }
	   }
	   return 1;
	   }
       
	   if(getCheckpointType(playerid) == 36 && getCheckpointType(playerid) == 36)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Alcatraz Island_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "You have left the Alcatraz building");
	   SetPlayerInterior(playerid,0);
	   SetPlayerPos(playerid,3792.1602,471.8931,36.4192);
	   SetPlayerFacingAngle(playerid,89.9220);
	   SetCameraBehindPlayer(playerid);
	   }
	   return 1;
	   }
	   
	   
	   if(getCheckpointType(playerid) == 79 && getCheckpointType(playerid) == 79)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Ndriqimi's Casino_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "Welcome to Ndriqimi's Casino");
	   SetPlayerVirtualWorld(playerid,1);
	   SetPlayerInterior(playerid,12);
	   SetPlayerPos(playerid,1133.3054,-5.9871,1000.6797);
	   SetPlayerFacingAngle(playerid,5.0969);
	   SetCameraBehindPlayer(playerid);
	   }
	   return 1;
	   }

	   if(getCheckpointType(playerid) == 80 && getCheckpointType(playerid) == 80)
       {
       if(GetPlayerVirtualWorld(playerid) == 0) {
	   SetPlayerInterior(playerid,0);
	   SetPlayerPos(playerid,1658.1958,2253.1714,11.0625);
	   SetPlayerFacingAngle(playerid,358.7586);
	   SetCameraBehindPlayer(playerid);
	   }
	   else
	   if(GetPlayerVirtualWorld(playerid) == 1) {
	   SetPlayerVirtualWorld(playerid,0);
	   SetPlayerInterior(playerid,0);
	   SetPlayerPos(playerid,2079.1787,1334.1761,10.8203);
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_Ndriqimi's Casino_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "You have left Ndriqimi's Casino");
	   SetPlayerFacingAngle(playerid,92.1118);
	   SetCameraBehindPlayer(playerid);
	   }
	   return 1;
	   }
	   
	   if(getCheckpointType(playerid) == 38 && getCheckpointType(playerid) == 38)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_BlackField Stadium_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "You have left the Blackfield stadium");
	   SetPlayerInterior(playerid,0);
	   SetPlayerPos(playerid,1085.6786,1603.7218,12.5469);
	   SetPlayerFacingAngle(playerid,5.5373);
	   SetCameraBehindPlayer(playerid);
	   InDerby[playerid] =0;
	   }
	   return 1;
	   }
	   
	   if(getCheckpointType(playerid) == 46 && getCheckpointType(playerid) == 46)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Welcome to 24/7 Stores_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "Type /buy 1-8 to purchase items from the store");
	   SendClientMessage(playerid, 0x00C7FFAA, "1. Chainsaw ($1500) - 2. Flowers ($5)");
       SendClientMessage(playerid, 0x00C7FFAA, "3. Water ($100) - 4. Beer ($20)");
	   SendClientMessage(playerid, 0x00C7FFAA, "5. Wallet ($1000) - 6. Parachute ($500)");
	   SendClientMessage(playerid, 0x00C7FFAA, "7. Camera ($1600) - 8. Condom (3$)");
	   SendClientMessage(playerid, COLOR_GREY, "Type /holdup to rob this store");
	   TextDrawShowForPlayer(playerid,service);

	   }
	   return 1;
	   }
	   
	   if(getCheckpointType(playerid) == 37 && getCheckpointType(playerid) == 37)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   if(DerbyOpen == 1) {
	   SetPlayerInterior(playerid,15);
       SetPlayerPos(playerid,-1423.5120,937.8108,1036.5293);
	   SetPlayerFacingAngle(playerid,0.2352);
	   SetCameraBehindPlayer(playerid);
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_BlackField Stadium_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "Welcome to the Destruction Derby!! The last player to survive gets $10000");
	   SendClientMessage(playerid, 0x00C7FFAA, "Get in a Banger car and get to a starting position");
	   SendClientMessage(playerid, 0x00C7FFAA, "Do not hit others cars untill the Derby starts (Admin will say when)");
	   InDerby[playerid] =1;
	   }
	   else
	   if(DerbyOpen == 0) {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_BlackField Stadium_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "The stadium is currently closed. Admin must open it before you can enter");
	   }
	   }
       return 1;
	   }
	   

	   
	   if(getCheckpointType(playerid) == 32 && getCheckpointType(playerid) == 32)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
       SetPlayerPos(playerid,2361.9761,1539.9305,10.8203);
	   SetPlayerFacingAngle(playerid,181.8405);
	   SetCameraBehindPlayer(playerid);
	   InBank[playerid] =0;
	   }
       return 1;
	   }
	   
	   if(getCheckpointType(playerid) == 33 && getCheckpointType(playerid) == 33)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   if(gametime >=8 && gametime <=20)
	   {
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas City Bank_|");
	   SendClientMessage(playerid, 0x808080AA, "Use the following commands to make financial transactions");
	   SendClientMessage(playerid, 0x808080AA, "/bankstate or /deposit (amount) or /withdraw (amount)");
       SendClientMessage(playerid, 0x808080AA, "Type /robbank to attempt to rob the bank");
	   SendClientMessage(playerid, 0x808080AA, "Type /buyinsure to cover your bank account against theft");
	   }
       else{
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas City Bank_|");
	   SendClientMessage(playerid, 0x00C7FFAA, "The bank has closed while you were inside. Come back between 8:00 and 2100");
	   SetPlayerPos(playerid,2361.9761,1539.9305,10.8203);
	   SetPlayerFacingAngle(playerid,181.8405);
	   SetCameraBehindPlayer(playerid);
	   InBank[playerid] =0;
	   }
	   }
       return 1;
	   }

	   if(getCheckpointType(playerid) == 34 && getCheckpointType(playerid) == 34)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_LVPD Weapons Refill_|");
	   SendClientMessage(playerid, 0x00C7FFAA,"LVPD Supply Officers and Army with weapons. Type /refill (1-4)");
	   SendClientMessage(playerid, 0x00C7FFAA,"1. Pistol (150 AMMO)");
	   SendClientMessage(playerid, 0x00C7FFAA,"2. Shotgun (50 AMMO)");
	   SendClientMessage(playerid, 0x00C7FFAA,"3. MP5 (500 AMMO)");
	   SendClientMessage(playerid, 0x00C7FFAA,"4. Parachute");
	   }
       return 1;
	   }
	   
	   
	   
       if(getCheckpointType(playerid) >= 27 && getCheckpointType(playerid) <= 30)
       {
       if(!IsPlayerInAnyVehicle(playerid))
       {
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas ATM Machine Network_|");
	   SendClientMessage(playerid, 0x808080AA, "You can only withdraw cash or check your balance at this ATM machine");
	   SendClientMessage(playerid, 0x808080AA, "Use /withdraw (amount) to take funds out of your bank account");
	   SendClientMessage(playerid, 0x808080AA, "Use /bankstate to check the balance of your bank account");
	   SendClientMessage(playerid, 0x00C7FFAA, "Use /robatm to attempt to rob the atm");
	   }
       return 1;
	   }













       if(getCheckpointType(playerid) == 26 && getCheckpointType(playerid) == 26)
       {
       if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
       {
       if(gTeam[playerid] == TEAM_COP || gTeam[playerid] == TEAM_ARMY || gTeam[playerid] == TEAM_CASSEC) {
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Drug House_|");
	   SendClientMessage(playerid, 0xE9967AAA, "Go away... pig! ");
	   return 1;
       }
       if(houseowner[playerid] == 1337) {
	   GameTextForPlayer(playerid,"~w~Welcome ~g~HOME",5000,0);
       SetPlayerVirtualWorld(playerid,1);
	   SetPlayerInterior(playerid,12);
	   SetPlayerPos(playerid,1133.3054,-5.9871,1000.6797);
	   SetPlayerFacingAngle(playerid,5.0969);
	   SetCameraBehindPlayer(playerid);
	return 1;
	}
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Las Venturas Drug House_|");
	   SendClientMessage(playerid, 0xE9967AAA, "Type /buydrugs [ID] to buy some drugs");
	   SendClientMessage(playerid, 0xE9967AAA, "1 - Buy 10 grams of drugs ($2000)");
	   SendClientMessage(playerid, 0xE9967AAA, "2 - Buy 100 grams of drugs ($20000)");
	   SendClientMessage(playerid, 0xE9967AAA, "3 - Buy 500 grams of drugs ($100000)");
	   SendClientMessage(playerid, 0xE9967AAA, "4 - Buy 1000 grams of drugs ($150000) - Dealers Only");
	   SendClientMessage(playerid, 0xE9967AAA, "5 - Buy DrugBag ($1000) - Cops cant find your drugs if they search you");
	   }
       return 1;
       }

       if(getCheckpointType(playerid) == 25 && getCheckpointType(playerid) == 25 && IsPlayerConnected(playerid))
       {
       if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	   {
	   if(AbandonedCopCar[playerid] == 1) {
       SendClientMessage(playerid, COLOR_RED, "There is nothing here");
       return 1;
       }
       new rand = random(10000);
       if(rand >= 0 && rand <= 1999) {
	   SendClientMessage(playerid, COLOR_ROYALBLUE, "You have found $10000 of Police siezed drug money");
	   GameTextForPlayer(playerid,"~w~Found $10000",4000,3);
	   GivePlayerMoney(playerid,10000);
	   PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	   AbandonedCopCar[playerid] =1;
	   }
       if(rand >= 2000 && rand <= 3999) {
	   SendClientMessage(playerid, COLOR_ROYALBLUE, "You have found a Law Enforcement radio. Use /radon and /radoff");
	   SendClientMessage(playerid, COLOR_ROYALBLUE, "You can attempt to jam the signal to commit crimes without the Police being alerted");
	   SendClientMessage(playerid, COLOR_ROYALBLUE, "Use /jam to attempt to jam the Law Enforcement radio systems");
	   GameTextForPlayer(playerid,"~w~Found~n~~w~LAW ENFORCEMENT RADIO",4000,3);
	   HasLawEnforcementRadio[playerid] =1;
	   LawEnforcementRadio[playerid] =1;
	   PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	   AbandonedCopCar[playerid] =1;
       }
       if(rand >= 4000 && rand <= 5999) {
       new pname[24];

       GetPlayerName(playerid,pname,24);
       format(string, sizeof(string), "%s(%d) Has been infected with Chlamydia",pname,playerid);
       SendClientMessageToAll(0x00C7FFAA, string);
       SendClientMessage(playerid, COLOR_ROYALBLUE, "You have found a used bodybag. You have been infected with Chlamydia");
	   Chlamydia[playerid] =1;
	   PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	   AbandonedCopCar[playerid] =1;
       }
       if(rand >= 6000 && rand <= 7999) {
       SendClientMessage(playerid, COLOR_ROYALBLUE, "You have found a MP5 Weapon with 500 ammo");
       GameTextForPlayer(playerid,"~w~Found MP5 Weapon",4000,3);
	   GivePlayerWeapon(playerid,29,500);
	   PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	   AbandonedCopCar[playerid] =1;
       }
       if(rand >= 8000 && rand <= 10000) {
       SendClientMessage(playerid, COLOR_ROYALBLUE, "You have found a set of handcuffs. Locked, with no key. You threw them away");
       GameTextForPlayer(playerid,"~b~Found Handcuffs",4000,3);
       PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
	   AbandonedCopCar[playerid] =1;
       }
	   }
       return 1;
	   }


       if(getCheckpointType(playerid) == 24 && getCheckpointType(playerid) == 24)
       {
       if(IsPlayerInAnyVehicle(playerid))
	   {
       SendClientMessage(playerid,COLOR_WHITE,"CHECKPOINT HELP: You are in a vehicle. Get out the vehicle and re-enter chekpoint");
       }
	   else
	   {
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "*** Welcome to Las Venturas Hospital ***");
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "/buycure - Any infections that you have will be cured ($4500)");
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "/buyheal - Your health will be restored ($1000)");
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "/chlamydia - Infect yourself with Chlamydia ($4500)");
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "/buyhc - Your health will be restored and your infections cured ($5000)");
       }
       return 1;
	   }

	   if(getCheckpointType(playerid) == 21 || getCheckpointType(playerid) == 23)
       {
       GameTextForPlayer(playerid, "~w~type /robcasino~n~to rob the casino", 5000, 3);
	   return 1;
       }


       if(getCheckpointType(playerid) == 24 && getCheckpointType(playerid) == 24)
       {
       if(IsPlayerInAnyVehicle(playerid))
	   {
       SendClientMessage(playerid,COLOR_WHITE,"CHECKPOINT HELP: You are in a vehicle. Get out the vehicle and re-enter chekpoint");
       }
	   else
	   {
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "*** Welcome to Las Venturas Hospital ***");
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "/buycure - Any infections that you have will be cured ($4500)");
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "/buyheal - Your health will be restored ($1000)");
	   SendClientMessage(playerid, COLOR_FORESTGREEN, "/buyhc - Your health will be restored and your infections cured ($5000)");
       }
       return 1;
	   }

	   if(getCheckpointType(playerid) == 21 || getCheckpointType(playerid) == 23)
       {
       GameTextForPlayer(playerid, "~w~type /robcasino~n~to rob the casino", 5000, 3);
	   return 1;
       }

       if(getCheckpointType(playerid) == 17 && getCheckpointType(playerid) == 17)
       {
       if(IsPlayerInAnyVehicle(playerid))
	   {
       SendClientMessage(playerid,COLOR_WHITE,"CHECKPOINT HELP: You are in a vehicle. Please exit the vehicle and re-enter the checkpoint!");
       }
       else
	   {
       SendClientMessage(playerid,0xE9967AAA,"Welcome to Las Venturas airport. See the list below for todays flights.");
       SendClientMessage(playerid,0xE9967AAA,"Use /flysf for all flights to San Fierro ($4500)");
       SendClientMessage(playerid,0xE9967AAA,"Use /flyls for all flights to Los Santos ($4500)");
       SendClientMessage(playerid,0xE9967AAA,"Use /dive to skydive over Central Las Venturas. Free parachute! ($3000)");
       }
       return 1;
       }

       if(getCheckpointType(playerid) == 18 && getCheckpointType(playerid) == 18) {
       if(!IsPlayerInAnyVehicle(playerid)) {
       new pname[24];
	   GetPlayerName(playerid,pname, 24);
	   if(GetPlayerScore(playerid) <= 99) {
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Regular Players Lounge_|");
       SendClientMessage(playerid,0x00C7FFAA,"Your score is not high enough to enter this building! Go play some more!");
       InAdminHQ[playerid] =1;
       return 1;
       }
	   if(GetPlayerScore(playerid) >= 100) {
       SetPlayerInterior(playerid,3);
	   SetPlayerFacingAngle(playerid,89.0523);
       SetPlayerPos(playerid,-2639.7832,1406.4753,906.4609);
       SetCameraBehindPlayer(playerid);
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Regular Players Lounge_|");
       SendClientMessage(playerid,0x00C7FFAA,"Welcome To The RPL. You are a Regular Player!");
       SendClientMessage(playerid,0x00C7FFAA,"There are some pickups and some cash etc laying around, help ya'self ");
       format(string, sizeof(string), "%s(%d) Has entered the Regular Players Lounge! (Score: %d)",pname,playerid,GetPlayerScore(playerid));
       ircSay(EchoConnection, EchoChan,string);
       InAdminHQ[playerid] =1;
       }
       }
       return 1;
       }
















       if(getCheckpointType(playerid) == 19)
       {
       if(!IsPlayerInAnyVehicle(playerid))
	   {
       TextDrawShowForPlayer(playerid,autoserv);
       }
       else
	   {
	   SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom_|");
       SendClientMessage(playerid,0x00C7FFAA,"Welcome to AutoBahn.. Type /sell to sell us your vehicle..");
	   }
       return 1;
       }




       if(getCheckpointType(playerid) == 20 && getCheckpointType(playerid) == 20) {
       SetPlayerInterior(playerid,0);
	   SetPlayerFacingAngle(playerid,88.7433);
       SetPlayerPos(playerid,2082.8745,1272.4794,10.8203);
       SetCameraBehindPlayer(playerid);
       InAdminHQ[playerid] =0;
       SendClientMessage(playerid, 0xA9A9A9AA, "|_Admin HQ_|");
       SendClientMessage(playerid,0x00C7FFAA,"You have left the RPL - Have a nice day!");
	   return 1;
       }

       return 1;
       }


	   
public OnPlayerLeaveCheckpoint(playerid)
{
    if(getCheckpointType(playerid) >= 39 && getCheckpointType(playerid) <= 41) {
    SetCameraBehindPlayer(playerid);
	}
	if(getCheckpointType(playerid) == 46 && robbingstore[playerid] >=1) {
    robbingstore[playerid] =0;
    SendClientMessage(playerid,COLOR_ERROR,"Store robbery failed, you left the checkpoint");
	}
	if(getCheckpointType(playerid) == 89 && robbinghall[playerid] >=1) {
    robbinghall[playerid] =0;
    SendClientMessage(playerid,COLOR_ERROR,"LV City Hall robbery failed, you left the checkpoint");
	}
	
	
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
    if(pickupid >= 6 && pickupid <= 12 && GetPlayerWantedLevel(playerid) >=1 && GetPlayerWantedLevel(playerid) <=9 && GotCopBriberecently[playerid] == 0) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_LVPD Bribe Found - Wanted Level Reduced_|");
    SendClientMessage(playerid,0x00C7FFAA,"Your wanted level has been reduced");
    SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)-1);
    GotCopBriberecently[playerid] =250;
    }

	if(pickupid >= 13 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
    new pickuper[30];
    new string[50];
    new cashrnd = random(1000);
    GetPlayerName(playerid,pickuper,30);
    format(string, sizeof(string), "You have found $%d on the ground.",cashrnd);
    SendClientMessage(playerid,0x00C7FFAA,string);
    GivePlayerMoney(playerid,cashrnd);
    DestroyPickup(pickupid);
    printf("(CASH DROP PICKUP) - %s(%d) Has picked up $%d",pickuper,playerid,cashrnd);
    format(string, sizeof(string), "**(CASH DROP PICKUP)** - %s(%d) Has picked up $%d",pickuper,playerid,cashrnd);
    ircSay(EchoConnection, EchoChan,string);
    }

    if(pickupid == 0) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_AutoBahn Car Showroom Information_|");
    SendClientMessage(playerid,0x00C7FFAA,"This business is already owned by a player. It can be purchased from the current owner");
    SendClientMessage(playerid,0x00C7FFAA,"Type /bussinessowners or /bo for ownership details. You can contact the owner if he/she is online");
    }
    else
    if(pickupid == 1) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Fire Extinguisher_|");
    SendClientMessage(playerid,0x00C7FFAA,"Use this to fight the resulting fire from the C4 exploding");
    SendClientMessage(playerid,COLOR_ERROR,"DO NOT use this on other players. You will be kicked if you do");
    GivePlayerWeapon(playerid,42,25);
    }
    else
    if(pickupid == 2) {
    SendClientMessage(playerid, 0xA9A9A9AA, "|_Fire Extinguisher_|");
    SendClientMessage(playerid,0x00C7FFAA,"Use this to fight the resulting fire from the C4 exploding");
    SendClientMessage(playerid,COLOR_ERROR,"DO NOT use this on other players. You will be kicked if you do");
    GivePlayerWeapon(playerid,42,25);
    }
    
    
    
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
/*strtok(const string[], &index)
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
}*/

/*
 *  /register password
 *
 */
  dcmd_register(playerid,params[]) {

    // The command shouldn't work if we already are authed
    if (PLAYERLIST_authed[playerid]) return SystemMsg(playerid,"You are already logged into your account");

    // The command shouldn't work if an account with this
    // nick already exists
    if (udb_Exists(PlayerName(playerid))) return SystemMsg(playerid,"This name is registered, please use /login password to log in.");

    if (RegisterLoginDisabled == 1337) return  SystemMsg(playerid,"New Account Registrations are Disabled. This is due to maintenance");
    // Did he forgot the password?
    if (strlen(params)==0) return SystemMsg(playerid,"Use: /register password to create a new account");

    // We save the money to the accstate
    if (udb_Create(PlayerName(playerid),params)) {
    
    dUserSetINT(PlayerName(playerid)).("money",7500);
    dUserSetINT(PlayerName(playerid)).("bankcash",5000);
    dUserSetINT(PlayerName(playerid)).("loancash",0);
    dUserSetINT(PlayerName(playerid)).("cashinsured",0);
    dUserSetINT(PlayerName(playerid)).("autobahnowner",0);
    dUserSetINT(PlayerName(playerid)).("houseowner",0);
    dUserSetINT(PlayerName(playerid)).("regplayer",0);
    dUserSetINT(PlayerName(playerid)).("carwinner",0);
	dUserSetINT(PlayerName(playerid)).("score",0);
    dUserSetINT(PlayerName(playerid)).("team",0);
    dUserSetINT(PlayerName(playerid)).("skin",0);
    dUserSetINT(PlayerName(playerid)).("jailtime",0);
    dUserSetINT(PlayerName(playerid)).("wallet",0);
    dUserSetINT(PlayerName(playerid)).("drugs",0);
    dUserSetINT(PlayerName(playerid)).("drugbagy",0);
    dUserSetINT(PlayerName(playerid)).("adminlevel",0);
    dUserSetINT(PlayerName(playerid)).("teamkills",0);
    dUserSetINT(PlayerName(playerid)).("innocentkills",0);
    dUserSetINT(PlayerName(playerid)).("lowwantedkills",0);
    dUserSetINT(PlayerName(playerid)).("coprank",0);
    dUserSetINT(PlayerName(playerid)).("robrank",0);
    dUserSetINT(PlayerName(playerid)).("respect",0);
    dUserSetINT(PlayerName(playerid)).("rpabusewar",0);
    dUserSetINT(PlayerName(playerid)).("deaths",0);
    dUserSetINT(PlayerName(playerid)).("casinorob",0);
    dUserSetINT(PlayerName(playerid)).("cashfromcasninorob",0);
    dUserSetINT(PlayerName(playerid)).("atmsrobbed",0);
    dUserSetINT(PlayerName(playerid)).("cashfromatmsrobbed",0);
    dUserSetINT(PlayerName(playerid)).("crimsarrested",0);
    dUserSetINT(PlayerName(playerid)).("timesarrested",0);
    dUserSetINT(PlayerName(playerid)).("totaljailtime",0);
    dUserSetINT(PlayerName(playerid)).("timesparoled",0);
    dUserSetINT(PlayerName(playerid)).("finesissued",0);
    dUserSetINT(PlayerName(playerid)).("finespaid",0);
    dUserSetINT(PlayerName(playerid)).("nameban",0);
    dUserSetINT(PlayerName(playerid)).("timesinfected",0);
    dUserSetINT(PlayerName(playerid)).("timesraped",0);
    dUserSetINT(PlayerName(playerid)).("timesrobbed",0);
    dUserSetINT(PlayerName(playerid)).("timeshealed",0);
    dUserSetINT(PlayerName(playerid)).("timescured",0);
    dUserSetINT(PlayerName(playerid)).("hitsplaced",0);
    dUserSetINT(PlayerName(playerid)).("hitsplacedonyou",0);
    dUserSetINT(PlayerName(playerid)).("timessearched",0);
    dUserSetINT(PlayerName(playerid)).("drugssiezedbycops",0);
    dUserSetINT(PlayerName(playerid)).("connectedminute",0);
    dUserSetINT(PlayerName(playerid)).("connectedhour",0);
    dUserSetINT(PlayerName(playerid)).("timesfuckedoff",0);
    dUserSetINT(PlayerName(playerid)).("storesrobbed",0);
    dUserSetINT(PlayerName(playerid)).("cashfromstorerob",0);
    
	
	return SystemMsg(playerid,"Your Account has been created. Login with /login password now to log in (Before Spawn)");
    
      } 
	return true;

 }


 /*
 *  /login password
 *
 */
  dcmd_login(playerid,params[]) {

	
    // The command shouldn't work if we already are authed
    if (PLAYERLIST_authed[playerid]) return SystemMsg(playerid,"You are already logged in");

    // The command shouldn't work if an account with this
    // nick does not exists
    if (!udb_Exists(PlayerName(playerid))) return SystemMsg(playerid,"Account does not exist, please use /register password");

    // Did he forgot the password?
    if (strlen(params)==0) return SystemMsg(playerid,"Usage: /login password");

    if (udb_CheckLogin(PlayerName(playerid),params)) {
       // Login was correct

       // Following thing is the same like the missing SetPlayerCommand
		GivePlayerMoney(playerid,dUserINT(PlayerName(playerid)).("money")-GetPlayerMoney(playerid));
        SetPlayerScore(playerid,dUserINT(PlayerName(playerid)).("score")-GetPlayerScore(playerid));
        robberrank[playerid] =dUserINT(PlayerName(playerid)).("robrank");
        respect[playerid] =dUserINT(PlayerName(playerid)).("respect");
        //mafia[playerid] =dUserINT(PlayerName(playerid)).("mafia");
        Mafia[playerid] =dUserINT(PlayerName(playerid)).("mafia");
        houseowner[playerid] =dUserINT(PlayerName(playerid)).("houseowner");
        //skin[playerid] =dUserINT(PlayerName(playerid)).("skin");
        //Skin[playerid] =dUserINT(PlayerName(playerid)).("skin");
        teamkiller[playerid] =dUserINT(PlayerName(playerid)).("teamkills");
        innocentkiller[playerid] =dUserINT(PlayerName(playerid)).("innocentkills");
        lowwantedkiller[playerid] =dUserINT(PlayerName(playerid)).("lowwantedkills");
        BankRobInsurance[playerid] =dUserINT(PlayerName(playerid)).("cashinsured");
        PlayerAdminLevel[playerid] =dUserINT(PlayerName(playerid)).("adminlevel");

        PLAYERLIST_authed[playerid]=true;
		
       return SystemMsg(playerid,"You are now logged in. Your stats will be auto-saved when you disconnect");
    }
    // Login was incorrect
    return SystemMsg(playerid,"Login Attempt Failed");
    
    // 84.1.244.48:27015
 }


