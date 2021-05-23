/*********************************************************************************
 *      					Tuning Filterscript
 *       	  This filterscript allow to you tune any car model in one modshop.
 *
 *                 This code is a part of the Virtual Life RPG source
 *					You have permission to use it and change it
 *
 *              Author: Rafael Ravedutti L. M. <rafael_msn_7@hotmail.com>
 *********************************************************************************/

#include <a_samp>

//Slots
#define SPOILERS                    0
#define ROOFSCOOPS                  1
#define HOODS                       2
#define SIDESKIRTS                  3
#define NITROS                      4
#define LAMPS                       5
#define EXHAUSTS                    6
#define WHEELS                      7
#define STEREO                      8
#define HYDRAULICS                  9
#define BULLBARS                    10
#define REARBULLBARS                11
#define FRONTBULLBARS               12
#define FRONTBUMPERS                13
#define REARBUMPERS                 14
#define VENTS                     	15
#define FRONTSIGN                   16
#define PAINTJOBS                   17

forward TuningHandler();
forward UpdateTuneCamera();

new TunnerID;
new TuneVehicle;
new TuneComponent = 0;
new TuneEntry = 0;
new TuneTimer;
new TuneHTimer;
new Tunes[17];
new RowComponents[20];
new Menu:mCost;
new Menu:mTuning;
new Menu:mCurrentTune;
new bool:IsPaintJob = false;

new Float:TuningLocations[][3] = {
	{1653.8280, -1837.3652, 14.0000},
	{-2037.2894, 178.4451, 28.8359}
};

enum vTuning
{
	tun[17],
	pjobid
}

new VehicleTuning[MAX_VEHICLES][vTuning];

enum TuneInfo
{
	tuneName[64],
	tuneValue,
	tuneSlot
}

new SimilarComponents[][2] = {
	{1007, 1017},
	{1026, 1027},
	{1030, 1031},
	{1036, 1040},
	{1039, 1041},
	{1042, 1099},
	{1047, 1051},
	{1048, 1052},
	{1056, 1062},
	{1057, 1063},
	{1069, 1071},
	{1070, 1072},
	{1090, 1094},
	{1093, 1095},
	{1106, 1124},
	{1107, 1108},
	{1118, 1120},
	{1119, 1121},
	{1122, 1101},
	{1133, 1102},
	{1143, 1142},
	{1145, 1144}
};

new Components[][TuneInfo] = {
	{"Pro", 								900, 				SPOILERS},
	{"Win", 								750, 				SPOILERS},
	{"Drag", 								800, 				SPOILERS},
	{"Alpha", 								600, 				SPOILERS},
	{"Champ Scoop", 						600, 				HOODS},
	{"Fury Scoop", 							800, 				HOODS},
	{"Roof Scoop", 							180, 				ROOFSCOOPS},
	{"Sideskirt", 							400, 				SIDESKIRTS},
	{"Nitro 2x", 							500, 				NITROS},
	{"Nitro 5x", 							1000, 				NITROS},
	{"Nitro 10x", 							2000, 				NITROS},
	{"Race Scoop", 							1300, 				HOODS},
	{"Worx Scoop", 							1250, 				HOODS},
	{"Round Fog", 							650, 				LAMPS},
	{"Champ", 								1600, 				SPOILERS},
	{"Race", 								1580, 				SPOILERS},
	{"Worx", 								1400, 				SPOILERS},
	{"Sideskirt", 							400, 				SIDESKIRTS},
	{"Upswept", 							800, 				EXHAUSTS},
	{"Twin", 								600, 				EXHAUSTS},
	{"Large", 								500, 				EXHAUSTS},
	{"Medium", 								300, 				EXHAUSTS},
	{"Small", 								350, 				EXHAUSTS},
	{"Fury", 								500, 				SPOILERS},
	{"Square Fog", 							500, 				LAMPS},
	{"Off Road", 							1200, 				WHEELS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien Roof", 							800, 				ROOFSCOOPS},
	{"X-Flow Roof", 						600, 				ROOFSCOOPS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"X-Flow Roof", 						600, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien Roof", 							800, 				ROOFSCOOPS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Chrome", 								900, 				SIDESKIRTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"X-Flow", 								600, 				ROOFSCOOPS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"X-Flow", 								600, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"Alien", 								1700, 				EXHAUSTS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"X-Flow", 								600, 				ROOFSCOOPS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Shadow", 								700, 				WHEELS},
	{"Mega", 								1030, 				WHEELS},
	{"Rimshine", 							1800, 				WHEELS},
	{"Wires", 								1560,	 			WHEELS},
	{"Classic", 							1650, 				WHEELS},
	{"Twist", 								1900, 				WHEELS},
	{"Cutter", 								1100, 				WHEELS},
	{"Switch", 								2100, 				WHEELS},
	{"Grove", 								1230, 				WHEELS},
	{"Import", 								1050, 				WHEELS},
	{"Dollar", 								1760, 				WHEELS},
	{"Trancer", 							1350, 				WHEELS},
	{"Atomic", 								1550, 				WHEELS},
	{"Estereo", 							350, 				STEREO},
	{"Hidraulica", 							1600, 				HYDRAULICS},
	{"Alien", 								800, 				ROOFSCOOPS},
	{"X-Flow", 								1300, 				EXHAUSTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow",	 							600, 				ROOFSCOOPS},
	{"Alien", 								1300,		 		EXHAUSTS},
	{"X-Flow", 								750, 				SIDESKIRTS},
	{"Alien", 								900, 				SIDESKIRTS},
	{"X-Flow", 								750,	 			SIDESKIRTS},
	{"Ahab", 								1700, 				WHEELS},
	{"Virtual",								850, 				WHEELS},
	{"Access", 								1200, 				WHEELS},
	{"Chrome", 								900, 				SIDESKIRTS},
	{"Chrome Grill", 						1200, 				BULLBARS},
	{"Chrome Flames", 						1700, 				SIDESKIRTS},
	{"Chrome Strip", 						1400, 				SIDESKIRTS},
	{"Convertible", 						1300, 				ROOFSCOOPS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome Arches", 						1500, 				SIDESKIRTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Chrome", 								2180, 				REARBULLBARS},
	{"Slamin", 								2100, 				REARBULLBARS},
	{"Little Sign 1",					 	1000, 				FRONTSIGN},
	{"Little Sign 2", 						1200, 				FRONTSIGN},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome", 								2200, 				FRONTBULLBARS},
	{"Slamin", 								2100, 				FRONTBULLBARS},
	{"Chrome", 								1800, 				FRONTBUMPERS},
	{"Chrome Trim", 						590, 				SIDESKIRTS},
	{"Wheelcovers", 						750, 				SIDESKIRTS},
	{"Chrome Trim", 						590, 				SIDESKIRTS},
 	{"Wheelcovers", 						750, 				SIDESKIRTS},
 	{"Chrome Flames", 						1700, 				SIDESKIRTS},
 	{"Bullbar Chrome Bars", 				1300,			 	BULLBARS},
 	{"Chrome Arches", 						1500, 				SIDESKIRTS},
	{"Bullbar Chrome Lights", 				1000, 				BULLBARS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Vinyl Hardtop", 						3400, 				ROOFSCOOPS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Hardtop", 							3000, 				ROOFSCOOPS},
	{"Softtop", 							3300, 				ROOFSCOOPS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
 	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Slamin", 								1300, 				EXHAUSTS},
	{"Chrome", 								1700, 				EXHAUSTS},
	{"Chrome Strip", 						1300, 				SIDESKIRTS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1000,		 		SPOILERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Oval", 								900, 				VENTS},
	{"Oval", 								900, 				VENTS},
	{"Square", 								600, 				VENTS},
	{"Square", 								600, 				VENTS},
	{"X-Flow", 								1400, 				SPOILERS},
	{"Alien", 								1000, 				SPOILERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"X-Flow",	 							1800, 				REARBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Alien", 								1800, 				FRONTBUMPERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow",	 							1800, 				REARBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"Alien", 								2200, 				REARBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1000, 				SPOILERS},
	{"Alien", 								1400, 				SPOILERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				REARBUMPERS},
	{"Alien", 								1800, 				REARBUMPERS},
	{"Alien", 								1800, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Alien", 								2200, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"X-Flow", 								1800, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1800, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1800, 				FRONTBUMPERS},
	{"Slamin", 								1800, 				REARBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1300, 				FRONTBUMPERS},
	{"Chrome", 								1200, 				FRONTBUMPERS},
	{"Slamin", 								1300,	 			FRONTBUMPERS},
	{"Chrome", 								2200, 				FRONTBUMPERS},
	{"Chrome", 								2200, 				REARBUMPERS},
	{"Slamin", 								1300, 				REARBUMPERS}
};

new CarMods[][15] = {
	{400, 1018, 1019, 1020, 1021, 1013, 1024, 0,    0,    0,    0,    0,    0,    0,    0},     //Landstalker
	{401, 1001, 1003, 1004, 1005, 1006, 1013, 1019, 1020, 1007, 1017, 1142, 1143, 1144, 1145},  //Bravura
	{404, 1019, 1020, 1021, 1013, 1007, 1017, 1000, 1002, 1016, 0,    0,    0,    0,    0},     //Perenial
	{405, 1018, 1019, 1020, 1021, 1000, 1001, 1014, 1023, 0,    0,    0,    0,    0,    0},     //Sentinel
	{410, 1019, 1020, 1021, 1013, 1024, 1001, 1003, 1023, 1007, 1017, 0,    0,    0,    0},     //Manana
	{415, 1018, 1019, 1001, 1003, 1023, 1007, 1017, 0,    0,    0,    0,    0,    0,    0},     //Cheetah
	{418, 1020, 1021, 1006, 1002, 1016, 0,    0,    0,    0,    0,    0,    0,    0,    0},     //Moonbeam
	{420, 1004, 1005, 1019, 1021, 1001, 1003, 0,    0,    0,    0,    0,    0,    0,    0},     //Taxi
	{421, 1018, 1019, 1020, 1021, 1000, 1014, 1016, 1023, 0,    0,    0,    0,    0,    0},     //Washington
	{422, 1013, 1019, 1020, 1021, 1007, 1017, 0,    0,    0,    0,    0,    0,    0,    0},    	//Bobcat
	{426, 1004, 1005, 1019, 1021, 1001, 1003, 1006, 0,    0,    0,    0,    0,    0,    0},     //Premier
	{436, 1019, 1020, 1021, 1022, 1006, 1013, 1001, 1003, 1007, 1017, 0,    0,    0,    0},     //Previon
	{439, 1142, 1143, 1144, 1145, 1013, 1001, 1003, 1023, 1007, 1017, 0,    0,    0,    0},     //Stallion
	{477, 1018, 1019, 1020, 1021, 1006, 1007, 1017, 0,    0,    0,    0,    0,    0,    0},     //ZR-350
	{478, 1004, 1005, 1012, 1020, 1021, 1022, 1013, 1024, 0,    0,    0,    0,    0,    0},     //Walton
	{489, 1004, 1005, 1018, 1019, 1020, 1013, 1024, 1006, 1000, 1002, 1016, 0,    0,    0},     //Rancher
	{491, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1021, 1003, 1014, 1023, 1007, 1017, 0},     //Virgo
	{492, 1004, 1005, 1000, 1006, 1016, 0,    0,    0,    0,    0,    0,    0,    0,    0},     //Greenwood
	{496, 1001, 1002, 1003, 1006, 1011, 1019, 1020, 1023, 1007, 1017, 1142, 1143, 0,    0},    	//Blista Compact
	{500, 1019, 1020, 1021, 1013, 1024, 0,    0,    0,    0,    0,    0,    0,    0,    0},     //Mesa
	{516, 1004, 1018, 1019, 1020, 1021, 1000, 1002, 1015, 1016, 1007, 1017, 0,    0,    0},     //Nebula
	{517, 1007, 1017, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1002, 1003, 1016, 1023, 0},     //Majestic
	{518, 1001, 1005, 1006, 1013, 1018, 1020, 1023, 1142, 1143, 1144, 1145, 0,    0,    0},     //Buccaneer
	{527, 1018, 1020, 1021, 1001, 1014, 1015, 1007, 1017, 0,    0,    0,    0,    0,    0},     //Cadrona
	{529, 1011, 1012, 1018, 1019, 1020, 1006, 1001, 1003, 1023, 1007, 1017, 0,    0,    0},     //Willard
	{534, 1100, 1101, 1106, 1122, 1123, 1124, 1125, 1126, 1127, 1178, 1179, 1180, 1185, 0},    	//Remington
	{535, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 0},    	//Slamvan
	{536, 1103, 1104, 1105, 1107, 1108, 1128, 1181, 1182, 1183, 1184, 0,    0,    0,    0},    	//Blade
	{540, 1004, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1006, 1024, 1001, 1023, 1007, 1017},  //Vincent
	{542, 1018, 1019, 1020, 1021, 1014, 1015, 1144, 1145, 0,    0,    0,    0,    0,    0},     //Clover
	{546, 1004, 1142, 1143, 1144, 1145, 1018, 1019, 1006, 1024, 1001, 1002, 1023, 1007, 1017},  //Intruder
	{547, 1142, 1143, 1018, 1019, 1020, 1021, 1000, 1003, 1016, 0,    0,    0,    0,    0},     //Primo
	{549, 1011, 1012, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1001, 1003, 1023, 1007, 1017},  //Tampa
	{550, 1004, 1005, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1001, 1003, 1023, 1007, 1017},  //Sunrise
	{551, 1005, 1006, 1018, 1019, 1020, 1021, 1002, 1003, 1016, 1023, 0,    0,    0,    0},     //Merit
	{558, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1163, 1164, 1165, 1168, 0,    0},    	//Uranus
    {559, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1072, 1158, 1159, 1160, 1161, 1162, 1173}, 	//Jester
	{560, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1138, 1139, 1140, 1141, 1169, 1170}, 	//Sultan
	{561, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1154, 1155, 1156, 1157}, 	//Stratum
	{562, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1146, 1147, 1148, 1149, 1171, 1172}, 	//Elegy
	{565, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1150, 1151, 1152, 1153}, 	//Flash
    {567, 1102, 1129, 1130, 1131, 1132, 1133, 1186, 1187, 1188, 1189, 0,    0,    0,    0},    	//Savanna
	{575, 1042, 1043, 1044, 1099, 1074, 1075, 1076, 1077, 0,    0,    0,    0,    0,    0},    	//Broadway
	{576, 1134, 1135, 1136, 1137, 1190, 1191, 1192, 1193, 0,    0,    0,    0,    0,    0},    	//Tornado
	{580, 1018, 1020, 1001, 1006, 1023, 1007, 1017, 0,    0,    0,    0,    0,    0,    0},     //Stafford
	{585, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1013, 1006, 1001, 1003, 1023, 1007, 1017},  //Emperor
	{589, 1004, 1005, 1144, 1145, 1018, 1020, 1013, 1024, 1006, 1000, 1016, 1007, 1017, 0},     //Club
	{600, 1004, 1005, 1018, 1020, 1022, 1006, 1013, 1007, 1017, 0,    0,    0,    0,    0},     //Picador
	{603, 1142, 1143, 1144, 1145, 1018, 1019, 1020, 1013, 1001, 1006, 1023, 1007, 1017, 0}      //Phoenix
};

public OnFilterScriptInit()
{
	TunnerID = -1;
	TuneVehicle = -1;

	TuneHTimer = SetTimer("TuningHandler", 1000, false);
	
	print("* Tuning filterscript loaded.");
	return 1;
}

public OnPlayerDisconnect(playerid)
{
	if(TunnerID == playerid)
	{
	    StopPlayerTune(playerid);
 	}
}

public TuningHandler()
{
	if(TunnerID == -1)
	{
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i))
			{
			    new Float:X, Float:Y, Float:Z;
			    GetVehiclePos(GetPlayerVehicleID(i), X, Y, Z);
			    for(new t = 0; t < sizeof TuningLocations; t++)
			    {
			        if(				floatsqroot(
									floatpower(X - TuningLocations[t][0], 2) +
								   	floatpower(Y - TuningLocations[t][1], 2) +
								   	floatpower(Z - TuningLocations[t][2], 2))
								   	< 10.0)
			        {
			            TuneEntry = t;
			            ShowTuningMainMenu(i);
			            break;
			        }
			    }
			}
		}
	}
	TuneHTimer = SetTimer("TuningHandler", 1000, false);
}

stock ShowTuningMainMenu(playerid)
{
	if(TunnerID != playerid)
	{
    	if(!IsPlayerInAnyVehicle(playerid))
		{
		    SendClientMessage(playerid, 0xE1E2E7AA, "You're not in a vehicle.");
		    return 1;
		}
		if(TunnerID != -1 && TunnerID != playerid)
		{
		    SendClientMessage(playerid, 0xE1E2E7AA, "There is someone modifying a vehicle, wait...");
		    return 1;
		}
		new modelid = GetVehicleModel(GetPlayerVehicleID(playerid));
		if(modelid == 509 || modelid == 581 || modelid == 481 || modelid == 462 || modelid == 521 || modelid == 463 || modelid == 510
		|| modelid == 522 || modelid == 461 || modelid == 448 || modelid == 468 || modelid == 586 || modelid == 523 || modelid == 520
		|| modelid == 435 || modelid == 450 || modelid == 591 || modelid == 606 || modelid == 607 || modelid == 610 || modelid == 584
		|| modelid == 608 || modelid == 611 || modelid == 472 || modelid == 473 || modelid == 493 || modelid == 595 || modelid == 484
		|| modelid == 453 || modelid == 452 || modelid == 446 || modelid == 454 || modelid == 539 || modelid == 538 || modelid == 537
		|| modelid == 590 || modelid == 569 || modelid == 570 || modelid == 449 || modelid == 441 || modelid == 464 || modelid == 594
	 	|| modelid == 501 || modelid == 465 || modelid == 564)
		{
	    	SendClientMessage(playerid, 0xE1E2E7AA, "This vehicle cannot be modified.");
	    	return 1;
		}
		TunnerID = playerid;
		TuneVehicle = GetPlayerVehicleID(playerid);
		InitPlayerTune(playerid);
	}
	new modelid = GetVehicleModel(TuneVehicle);
	new count = 0;
	DestroyMenu(mTuning);
	mTuning = CreateMenu("Components", 2, 2, 150, 100, 20);
	if(!IsValidMenu(mTuning)) return 0;
	if(modelid == 536 || modelid == 575 || modelid == 576 || modelid == 534 || modelid == 535 || modelid == 567 || modelid == 562
	|| modelid == 565 || modelid == 558 || modelid == 559 || modelid == 560 || modelid == 561)
	{
	    AddMenuItem(mTuning, 0, "Paintjob");
	    Tunes[count++] = PAINTJOBS;
	}
	for(new m = 0; m < sizeof CarMods; m++)
	{
	    if(CarMods[m][0] == modelid)
	    {
	        for(new t = 1; t < 15; t++)
	        {
	            new slot = GetComponentSlot(CarMods[m][t]);
	            if(CarMods[m][t] > 999 && CarMods[m][t] < 1194 && slot != WHEELS && slot != NITROS && slot != STEREO && slot != HYDRAULICS)
	            {
					new bool:add = false;
					for(new c = 0; c < count; c++)
					{
					    if(slot == Tunes[c])
					    {
					        add = true;
					    }
					}
					if(!add)
					{
					    if(slot == SPOILERS)
					    {
					    	AddMenuItem(mTuning, 0, "Spoiler");
					    	Tunes[count++] = SPOILERS;
						}
						else if(slot == ROOFSCOOPS)
					    {
					    	AddMenuItem(mTuning, 0, "Roofscoop");
					    	Tunes[count++] = ROOFSCOOPS;
						}
						else if(slot == HOODS)
					    {
					    	AddMenuItem(mTuning, 0, "Hood");
					    	Tunes[count++] = HOODS;
						}
						else if(slot == SIDESKIRTS)
					    {
					    	AddMenuItem(mTuning, 0, "Sideskirt");
					    	Tunes[count++] = SIDESKIRTS;
						}
						else if(slot == LAMPS)
					    {
					    	AddMenuItem(mTuning, 0, "Lamp");
					    	Tunes[count++] = LAMPS;
						}
						else if(slot == EXHAUSTS)
					    {
					    	AddMenuItem(mTuning, 0, "Exhausts");
					    	Tunes[count++] = EXHAUSTS;
						}
						else if(slot == BULLBARS)
					    {
					    	AddMenuItem(mTuning, 0, "Bullbars");
					    	Tunes[count++] = BULLBARS;
						}
						else if(slot == REARBULLBARS)
					    {
					    	AddMenuItem(mTuning, 0, "Rear bullbars");
					    	Tunes[count++] = REARBULLBARS;
						}
						else if(slot == FRONTBULLBARS)
					    {
					    	AddMenuItem(mTuning, 0, "Front bullbars");
					    	Tunes[count++] = FRONTBULLBARS;
						}
						else if(slot == FRONTBUMPERS)
					    {
					        AddMenuItem(mTuning, 0, "Front bumpers");
					        Tunes[count++] = FRONTBUMPERS;
					    }
					    else if(slot == REARBUMPERS)
					    {
					        AddMenuItem(mTuning, 0, "Rear bumpers");
					        Tunes[count++] = REARBUMPERS;
					    }
					    else if(slot == VENTS)
					    {
					        AddMenuItem(mTuning, 0, "Vents");
					        Tunes[count++] = VENTS;
					    }
					    else if(slot == FRONTSIGN)
					    {
					        AddMenuItem(mTuning, 0, "Front sign");
					        Tunes[count++] = FRONTSIGN;
					    }
					}
				}
	        }
	        break;
	    }
	}
	AddMenuItem(mTuning, 0, "Wheels");
	Tunes[count++] = WHEELS;
	AddMenuItem(mTuning, 0, "Nitro");
	Tunes[count++] = NITROS;
	AddMenuItem(mTuning, 0, "Stereo");
	Tunes[count++] = STEREO;
	AddMenuItem(mTuning, 0, "Hydraulic");
	Tunes[count++] = HYDRAULICS;
	AddMenuItem(mTuning, 0, "Cancel");
	for(new ct = count; ct < 17; ct++)
	{
	    Tunes[ct] = -1;
	}
	ShowMenuForPlayer(mTuning, playerid);
	TogglePlayerControllable(playerid, false);
	return 1;
}

stock InitPlayerTune(playerid)
{
    PlayerPlaySound(playerid, 1183, 0, 0, 0);
    SetPlayerInterior(playerid, 1);
    LinkVehicleToInterior(TuneVehicle, 1);
	SetPlayerPos(playerid, 608.7222, -24.7236, 1000.9203);
	SetPlayerFacingAngle(playerid, 0.0);
	SetVehiclePos(TuneVehicle, 615.0339, -3.8868, 1001.0250);
	SetVehicleZAngle(TuneVehicle, 270.2918);
	TogglePlayerControllable(playerid, false);
	TuneTimer = SetTimer("UpdateTuneCamera", 100, false);
}

stock StopPlayerTune(playerid)
{
    PlayerPlaySound(playerid, 1184, 0, 0, 0);
	KillTimer(TuneTimer);
	KillTimer(TuneHTimer);
    SetPlayerInterior(playerid, 0);
    LinkVehicleToInterior(TuneVehicle, 0);
    PutPlayerInVehicle(playerid, TuneVehicle, 0);
    SetVehiclePos(TuneVehicle, TuningLocations[TuneEntry][0], TuningLocations[TuneEntry][1], TuningLocations[TuneEntry][2]);
	TunnerID = -1;
	TuneVehicle = -1;
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, true);
	TuneHTimer = SetTimer("TuningHandler", 15000, false);
}

public UpdateTuneCamera()
{
	KillTimer(TuneTimer);
	if(TuneVehicle == -1 || TunnerID == -1) return ;
	new Float:vPos[3], Float:dis;
	GetVehiclePos(TuneVehicle, vPos[0], vPos[1], vPos[2]);
	new Float:X = 615.0339, Float:Y = -3.8868, Float:Z = 1001.0250, Float:fX, Float:fY, Float:ang;
	dis += floatpower(vPos[0] - X, 2);
	dis += floatpower(vPos[1] - Y, 2);
	dis += floatpower(vPos[2] - Z, 2);
	dis = floatsqroot(dis);
	if(GetPlayerInterior(TunnerID) != 1 || dis > 3)
	{
	    SetPlayerInterior(TunnerID, 1);
    	LinkVehicleToInterior(TuneVehicle, 1);
		SetPlayerPos(TunnerID, 608.7222, -24.7236, 1000.9203);
		SetVehiclePos(TuneVehicle, X, Y, Z);
		SetVehicleZAngle(TuneVehicle, 270.2918);
		TogglePlayerControllable(TunnerID, false);
	}
	GetPlayerFacingAngle(TunnerID, ang);
	fX = X + (7.5 * floatsin(-ang, degrees));
	fY = Y + (7.5 * floatcos(-ang, degrees));
	SetPlayerCameraPos(TunnerID, fX, fY, Z + 1.0);
	SetPlayerCameraLookAt(TunnerID, X, Y, Z);
	SetPlayerFacingAngle(TunnerID, ang + 0.3);
	TuneTimer = SetTimer("UpdateTuneCamera", 5, false);
}

stock ShowPaintjobCostMenu(playerid, paintjobid)
{
	ChangeVehiclePaintjob(TuneVehicle, paintjobid);
    DestroyMenu(mCost);
    mCost = CreateMenu(" ", 2, 2, 150, 100, 20);
    AddMenuItem(mCost, 0, "Paintjob");
    AddMenuItem(mCost, 1, "$1000");
    ShowMenuForPlayer(mCost, playerid);
    TogglePlayerControllable(playerid, false);
    TuneComponent = paintjobid;
    IsPaintJob = true;
}

stock ShowTuningCostMenu(playerid, componentid)
{
    AddVehicleComponent(TuneVehicle, componentid);
	DestroyMenu(mCost);
	mCost = CreateMenu(" ", 2, 2, 150, 100, 20);
	AddMenuItem(mCost, 0, Components[componentid - 1000][tuneName]);
	new s[32];
	format(s, 32, "$%d", GetComponentValue(componentid));
	AddMenuItem(mCost, 1, s);
	AddMenuItem(mCost, 0, "Cancel");
	ShowMenuForPlayer(mCost, playerid);
	TogglePlayerControllable(playerid, false);
	TuneComponent = componentid;
	IsPaintJob = false;
}

stock LoadTuning(vehicleid)
{
	for(new s = 0; s < 17; s++)
	{
	    if(VehicleTuning[vehicleid][tun][s] != 0)
	    {
   			AddVehicleComponent(vehicleid, VehicleTuning[vehicleid][tun][s]);
		}
	}
	RemoveVehiclePaintjob(vehicleid);
	if(VehicleTuning[vehicleid][pjobid] == 0)
	{
		ChangeVehiclePaintjob(vehicleid, VehicleTuning[vehicleid][pjobid] - 1);
	}
}

stock SaveComponent(vehicleid, componentid)
{
	VehicleTuning[vehicleid][tun][GetComponentSlot(componentid)] = componentid;
	LoadTuning(vehicleid);
}

stock SavePaintjob(vehicleid, paintjobid)
{
	VehicleTuning[vehicleid][pjobid] = paintjobid + 1;
}

stock GetComponent(vehicleid, slot)
{
	return VehicleTuning[vehicleid][tun][slot];
}

stock RemoveVehiclePaintjob(vehicleid)
{
	ChangeVehiclePaintjob(vehicleid, -1);
	CallRemoteFunction("OnVehicleRemovePaintjob", "d", vehicleid);
}

stock GetComponentValue(componentid)
{
    if(componentid < 1000 || componentid > 1193) return 0;
	return Components[componentid - 1000][tuneValue];
}

stock GetComponentSlot(componentid)
{
	if(componentid < 1000 || componentid > 1193) return -1;
	return Components[componentid - 1000][tuneSlot];
}

public OnPlayerSelectedMenuRow(playerid, row)
{
    if(GetPlayerMenu(playerid) == mCurrentTune)
	{
		if(RowComponents[row] == 500)
		{
		    DestroyMenu(mCurrentTune);
	    	mCurrentTune = CreateMenu("Components", 2, 2, 150, 100, 20);
		    new w = 0, count = 0;
		    for(new t = 0; t < sizeof Components; t++)
		    {
		        if(Components[t][tuneSlot] == WHEELS)
		        {
					w++;
					if(w > 10)
					{
				    	AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
				    	AddMenuItem(mCurrentTune, 1, " ");
				    	RowComponents[count++] = t + 1000;
					}
				}
		    }
		    AddMenuItem(mCurrentTune, 0, "Previous");
		    AddMenuItem(mCurrentTune, 1, "<-");
		    RowComponents[count++] = 499;
		    ShowMenuForPlayer(mCurrentTune, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		else if(RowComponents[row] == 499)
		{
		    DestroyMenu(mCurrentTune);
	    	mCurrentTune = CreateMenu("Components", 2, 2, 150, 100, 20);
		    new w = 0, count = 0;
		    for(new t = 0; t < sizeof Components; t++)
		    {
		        if(Components[t][tuneSlot] == WHEELS)
		        {
		            AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
		            AddMenuItem(mCurrentTune, 1, " ");
		            RowComponents[count++] = t + 1000;
		            w++;
		            if(w >= 10)
		            {
		                AddMenuItem(mCurrentTune, 0, "Next");
		                AddMenuItem(mCurrentTune, 1, "->");
		                RowComponents[count++] = 500;
		                break;
		            }
		        }
		    }
		    ShowMenuForPlayer(mCurrentTune, playerid);
		    TogglePlayerControllable(playerid, false);
		}
		else
		{
			if(!IsPaintJob)
			{
				ShowTuningCostMenu(playerid, RowComponents[row]);
			}
			else
			{
			    ShowPaintjobCostMenu(playerid, RowComponents[row]);
			}
		}
		return 1;
	}
	if(GetPlayerMenu(playerid) == mCost)
	{
	    switch(row)
	    {
	        case 0:
	        {
	            if(!IsPaintJob)
				{
				    if(GetComponent(TuneVehicle, Components[TuneComponent - 1000][tuneSlot]) == TuneComponent)
					{
					    SendClientMessage(playerid, 0xE1E2E7AA, "This car already have this component.");
					    ShowTuningMainMenu(playerid);
				        return 1;
					}
				    if(GetPlayerMoney(playerid) < Components[TuneComponent - 1000][tuneValue])
				    {
				        SendClientMessage(playerid, 0xE1E2E7AA, "You don't have money.");
				        RemoveVehicleComponent(TuneVehicle, TuneComponent);
				        LoadTuning(TuneVehicle);
				        ShowTuningMainMenu(playerid);
				        return 1;
				    }
				    AddVehicleComponent(TuneVehicle, TuneComponent);
				    SaveComponent(TuneVehicle, TuneComponent);
				    GivePlayerMoney(playerid, -Components[TuneComponent - 1000][tuneValue]);
				    CallRemoteFunction("OnVehicleTuned", "ddd", TuneVehicle, TuneComponent, GetComponentSlot(TuneComponent));
				    ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
				    return 1;
				}
				else
				{
				    if(GetPlayerMoney(playerid) < 1000)
				    {
				        SendClientMessage(playerid, 0xE1E2E7AA, "You don't have money.");
				        RemoveVehiclePaintjob(TuneVehicle);
				        LoadTuning(TuneVehicle);
				        ShowTuningMainMenu(playerid);
				        return 1;
				    }
				    IsPaintJob = false;
				    ChangeVehiclePaintjob(TuneVehicle, TuneComponent);
				    SavePaintjob(TuneVehicle, TuneComponent);
				    GivePlayerMoney(playerid, -1000);
				    ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
				    return 1;
				}
	        }
	        case 1:
	        {
				if(!IsPaintJob)
				{
	            	RemoveVehicleComponent(TuneVehicle, TuneComponent);
	            	ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
	            	LoadTuning(TuneVehicle);
	            	return 1;
				}
				else
				{
				    IsPaintJob = false;
	            	ShowTuningMainMenu(playerid);
	            	TogglePlayerControllable(playerid, false);
				    LoadTuning(TuneVehicle);
				    return 1;
				}
	        }
	    }
	}
	if(GetPlayerMenu(playerid) == mTuning)
	{
	    if(Tunes[row] == -1 || TuneVehicle == -1)
	    {
	        StopPlayerTune(playerid);
			return 1;
	    }
	    DestroyMenu(mCurrentTune);
	    mCurrentTune = CreateMenu("Componentes", 2, 2, 150, 100, 20);
	    if(!IsValidMenu(mCurrentTune))
	    {
	        StopPlayerTune(playerid);
	        return 1;
	    }
		new count = 0;
		new slot = Tunes[row];
		if(slot == WHEELS)
		{
		    new w = 0;
		    for(new t = 0; t < sizeof Components; t++)
		    {
		        if(Components[t][tuneSlot] == slot)
		        {
		            AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
		            AddMenuItem(mCurrentTune, 1, " ");
		            RowComponents[count++] = t + 1000;
		            w++;
		            if(w >= 10)
		            {
		                AddMenuItem(mCurrentTune, 0, "Next");
		                AddMenuItem(mCurrentTune, 1, "->");
		                RowComponents[count++] = 500;
		                break;
		            }
		        }
		    }
		}
		else if(slot == NITROS || slot == STEREO || slot == HYDRAULICS)
		{
			for(new t = 0; t < sizeof Components; t++)
			{
		    	if(Components[t][tuneSlot] == slot)
		    	{
		            AddMenuItem(mCurrentTune, 0, Components[t][tuneName]);
		            RowComponents[count++] = t + 1000;
		    	}
			}
			IsPaintJob = false;
		}
		else if(slot == PAINTJOBS)
		{
			AddMenuItem(mCurrentTune, 0, "Paintjob 1");
			RowComponents[count++] = 0;
			AddMenuItem(mCurrentTune, 0, "Paintjob 2");
			RowComponents[count++] = 1;
			AddMenuItem(mCurrentTune, 0, "Paintjob 3");
			RowComponents[count++] = 2;
		    IsPaintJob = true;
		}
		else
		{
		    new modelid = GetVehicleModel(TuneVehicle);
		    for(new m = 0; m < sizeof CarMods; m++)
		    {
				if(CarMods[m][0] == modelid)
				{
				    for(new t = 1; t < 15; t++)
				    {
				        new comp = CarMods[m][t];
				        if(comp < 1000 || comp > 1193) break;
				        if(Components[comp - 1000][tuneSlot] == slot)
				        {
				        	new bool:issimilar = false;
            				for(new c = 0; c < count; c++)
	           				{
								if(!issimilar)
								{
	              					if(RowComponents[c] == comp)
		                			{
                   						issimilar = true;
			            	    	}
	                				else
			            	    	{
                   						for(new s = 0; s < sizeof SimilarComponents; s++)
	        							{
 							        		if((SimilarComponents[s][0] == comp || SimilarComponents[s][1] == comp) && (SimilarComponents[s][0] == RowComponents[c] || SimilarComponents[s][1] == RowComponents[c]))
 							        		{
 							        		    issimilar = true;
 							        		}
				        				}
              						}
								}
				        	}
							if(!issimilar)
							{
							    AddMenuItem(mCurrentTune, 0, Components[comp - 1000][tuneName]);
		           	 			RowComponents[count++] = comp;
							}
						}
				    }
				    break;
				}
		    }
		    IsPaintJob = false;
		}
		if(count < 1)
		{
		    StopPlayerTune(playerid);
	        return 1;
		}
		ShowMenuForPlayer(mCurrentTune, playerid);
		TogglePlayerControllable(playerid, false);
	}
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	if(GetPlayerMenu(playerid) == mCost || GetPlayerMenu(playerid) == mCurrentTune)
	{
		new Float:x, Float:y, Float:z;
	    GetVehiclePos(TuneVehicle, x, y, z);
	    if(!IsPaintJob)
	    {
	    	RemoveVehicleComponent(TuneVehicle, TuneComponent);
		}
		IsPaintJob = false;
	   	TogglePlayerControllable(playerid, false);
	    ShowTuningMainMenu(playerid);
	    LoadTuning(TuneVehicle);
		return 1;
	}
	if(GetPlayerMenu(playerid) == mTuning)
	{
	    StopPlayerTune(playerid);
	}
	return 1;
}
