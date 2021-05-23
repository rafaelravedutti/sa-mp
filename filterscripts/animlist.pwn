#include <a_samp>
#include <core>
#include <float>
#include <dini>
#include <dutils>
#include <dudb>
#include <a_objects>
#include <time>
#include <string>
#include <file>
#define COLOR_SYSTEM 0xEFEFF7AA
#define COLOR_VIOLET 0x9955DEEE
#define COLOR_LIGHTRED 0xFF99AADD
#define COLOR_SEAGREEN 0x00EEADDF
#define COLOR_GRAYWHITE 0xEEEEFFC4
#define COLOR_LIGHTNEUTRALBLUE 0xabcdef66
#define COLOR_GREENISHGOLD 0xDEAD4370
#define COLOR_LIGHTBLUEGREEN 0x0FFDD349
#define COLOR_NEUTRALBLUE 0xABCDEF01
#define COLOR_LIGHTCYAN 0xAAFFCC33
#define COLOR_LEMON 0xDDDD2357
#define COLOR_MEDIUMBLUE 0x63AFF00A
#define COLOR_NEUTRAL 0xABCDEF97
#define COLOR_BLACK 0x00000000
#define COLOR_NEUTRALGREEN 0x81CFAB00
#define COLOR_DARKGREEN 0x12900BBF
#define COLOR_LIGHTGREEN 0x24FF0AB9
#define COLOR_DARKBLUE 0x300FFAAB
#define COLOR_BLUEGREEN 0x46BBAA00
#define COLOR_PINK 0xFF66FFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_DARKRED 0x660000AA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_PURPLE 0x800080AA
#define COLOR_CYAN  	0x40FFFFFF
#define ApplyAnimation03b(%1) ApplyAnimation(%1, 1)
public OnPlayerCommandText(playerid, cmdtext[])
{
new animationplayed;
new tmp[256];
new cmd[256];
new idx;
cmd = strtok(cmdtext, idx);
 //Анимации
if(strcmp(cmdtext, "/animhelp", true) == 0) {
SendClientMessage(playerid, COLOR_GREEN,">/animped - Анимации пешеходов./dance - Анимация Танцев./handsup - Поднять руки");
SendClientMessage(playerid, COLOR_GREEN,">Остальные анимации: /animairport /animat /animbar /animball /animfire /animbeach");
SendClientMessage(playerid, COLOR_GREEN,">/animbp /animinf /animbiked /animbh /animfood /animbikelp /animms /animbikes /animcar");
SendClientMessage(playerid, COLOR_GREEN,">/animbikev /animbmx /animbikedbz /animchase /animbox /animbomber /animbsp /animcamera ");
SendClientMessage(playerid, COLOR_GREEN,">/animgym /animpara /animgangs /animlookers /animcarchat /animcasino /animbuddy /animbus");
SendClientMessage(playerid, COLOR_GREEN,">/animcarry /animintshop /animjst /animkart /animkissing /animknife /animlapdan /animdend");
SendClientMessage(playerid, COLOR_GREEN,">/animmedic /animmtb /animmusc /animotb /animnevada /animpark /animsaw /animchoppa");
SendClientMessage(playerid, COLOR_GREEN,">/animclothes /animcoach /animcolt /animcopa /animcod /animcrack");
SendClientMessage(playerid, COLOR_GREEN,">/animhelp2 - Вторая Часть Команд Анимаций.");
return 1;
}
if(strcmp(cmdtext, "/animhelp2", true) == 0) {
SendClientMessage(playerid, COLOR_GREEN,">Вторая Часть Команд Анимаций:");
SendClientMessage(playerid, COLOR_GREEN,">/animcrib /animjump /animdealer /animdildo /animdodge /animdozer  /animdrivebys /animfat");
SendClientMessage(playerid, COLOR_GREEN,">/animfightb /animfightc /animfightd /animfighte /animfinale /animfinale2 /animflamef");
SendClientMessage(playerid, COLOR_GREEN,">/animflowers /animghands /animfw /animghetto /animgog /animgraffity /animgreya /animgren");
SendClientMessage(playerid, COLOR_GREEN,">/animhaircut /animheist  /animinthouse /animintoffice /animplayerdbf /animplayidles /animpolice");
SendClientMessage(playerid, COLOR_GREEN,">/animpool /animpoor /animpython /animquad /animquadbz /animrapping  /animrifle /animriot /animrobbank ");
SendClientMessage(playerid, COLOR_GREEN,">/animrocket /animrustler /animryder /animscrat /animshamal /animshop /animskate /animshotgun");
SendClientMessage(playerid, COLOR_GREEN,">/animvortex /animtec /animtrain /animsil /animtattoo  /animsmoking /animsniper /animspray /animstrip");
SendClientMessage(playerid, COLOR_GREEN,">/animbath /animswat /animsweet /animswim /animsword /animtank /animtruck /animuzi  /animvan /animvending");
SendClientMessage(playerid, COLOR_GREEN,">/animway /animweap");
return 1;
}
if(strcmp(cmd, "/animbar", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbar [1-12]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbar [1-12]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BAR","Barcustom_get",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BAR","Barcustom_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BAR","Barcustom_order",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BAR","Barserve_bottle",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BAR","Barserve_give",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BAR","Barserve_glass",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BAR","Barserve_in",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BAR","Barserve_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BAR","Barserve_order",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BAR","dnk_stndF_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BAR","dnk_stndM_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BAR","BARman_idle",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animball", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animball [1-11]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 11) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animball [1-11]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_1",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_2",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_2",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_4",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_block",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_Hit_1",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_Hit_2",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_Hit_3",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_IDLE",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BASEBALL","Bat_M",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BASEBALL","BAT_PART",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfire", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfire [1-13]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfire [1-13]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Fire1",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Fire2",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Fire3",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_GF_Wave",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Panic_01",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Panic_02",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Panic_03",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Panic_04",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BD_FIRE","BD_Panic_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BD_FIRE","M_smklean_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BD_FIRE","M_smklean_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BD_FIRE","Playa_Kiss_03",4.1,0,1,1,1,1);
} else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BD_FIRE","wash_up",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbeach", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbeach [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbeach [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BEACH","bather",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BEACH","Lay_Bac_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BEACH","BD_Fire3",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BEACH","ParkSit_W_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BEACH","SitnWait_loop_W",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animinf", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animinf [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animinf [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BF_injection","BF_getin_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BF_injection","BF_getin_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BF_injection","BF_getout_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BF_injection","BF_getout_RHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbiked", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbiked [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbiked [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Back",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_drivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_drivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_kick",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_passenger",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_shuffle",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbp", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbp [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbp [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"benchpress","gym_bp_celebrate",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"benchpress","gym_bp_down",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"benchpress","gym_bp_getoff",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"benchpress","gym_bp_geton",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"benchpress","gym_bp_up_A",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"benchpress","gym_bp_up_B",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"benchpress","gym_bp_up_smooth",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbh", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbh [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbh [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_drivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_drivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_kick",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_passenger",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animms", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animms [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animms [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_drivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_drivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BIKEH","BIKEh_getoffRHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfood", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfood [1-33]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 33) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfood [1-33]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FOOD","EAT_Burger",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FOOD","EAT_Chicken",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FOOD","EAT_Pizza",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FOOD","EAT_Vomit_P",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"FOOD","EAT_Vomit_SK",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"FOOD","FF_Dam_Bkw",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"FOOD","FF_Dam_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"FOOD","FF_Dam_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"FOOD","FF_Dam_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"FOOD","FF_Die_Bkw",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"FOOD","FF_Die_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"FOOD","FF_Die_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"FOOD","FF_Die_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Eat1",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Eat2",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Eat3",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_In",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_In_L",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_In_R",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Look",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Out_180",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Out_L_180",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"FOOD","FF_Sit_Out_R_180",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"FOOD","SHP_Thank",4.1,0,1,1,1,1);
}else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_In",4.1,0,1,1,1,1);
}else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_Lift",4.1,0,1,1,1,1);
}else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_Lift_In",4.1,0,1,1,1,1);
}else if(animationplayed == 29) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_Lift_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 30) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_Lift_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 31) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 32) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_Pose",4.1,0,1,1,1,1);
}else if(animationplayed == 33) {
ApplyAnimation03b(playerid,"FOOD","SHP_Tray_Return",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animms", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animms [1-41]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 41) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animms [1-41]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"MISC","bitchslap",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"MISC","BMX_celebrate",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"MISC","BMX_comeon",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"MISC","bmx_idleloop_01",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"MISC","bmx_idleloop_02",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"MISC","bmx_talkleft_in",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"MISC","bmx_talkleft_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"MISC","bmx_talkleft_out",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"MISC","bmx_talkright_in",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"MISC","bmx_talkright_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"MISC","bmx_talkright_out",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"MISC","bng_wndw",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"MISC","bng_wndw_02",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"MISC","Case_pickup",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"MISC","door_jet",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"MISC","GRAB_L",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"MISC","GRAB_R",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"MISC","Hiker_Pose",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"MISC","Hiker_Pose_L",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"MISC","Idle_Chat_02",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"MISC","KAT_Throw_K",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"MISC","KAT_Throw_O",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"MISC","KAT_Throw_P",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"MISC","PASS_Rifle_O",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"MISC","PASS_Rifle_Ped",4.1,0,1,1,1,1);
}else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"MISC","PASS_Rifle_Ply",4.1,0,1,1,1,1);
}else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"MISC","pickup_box",4.1,0,1,1,1,1);
}else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"MISC","Plane_door",4.1,0,1,1,1,1);
}else if(animationplayed == 29) {
ApplyAnimation03b(playerid,"MISC","Plane_exit",4.1,0,1,1,1,1);
}else if(animationplayed == 30) {
ApplyAnimation03b(playerid,"MISC","Plane_hijack",4.1,0,1,1,1,1);
}else if(animationplayed == 31) {
ApplyAnimation03b(playerid,"MISC","Plunger_01",4.1,0,1,1,1,1);
}else if(animationplayed == 32) {
ApplyAnimation03b(playerid,"MISC","Plyrlean_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 33) {
ApplyAnimation03b(playerid,"MISC","plyr_shkhead",4.1,0,1,1,1,1);
}else if(animationplayed == 34) {
ApplyAnimation03b(playerid,"MISC","Run_Dive",4.1,0,1,1,1,1);
}else if(animationplayed == 35) {
ApplyAnimation03b(playerid,"MISC","Scratchballs_01",4.1,0,1,1,1,1);
}else if(animationplayed == 36) {
ApplyAnimation03b(playerid,"MISC","SEAT_LR",4.1,0,1,1,1,1);
}else if(animationplayed == 37) {
ApplyAnimation03b(playerid,"MISC","Seat_talk_01",4.1,0,1,1,1,1);
}else if(animationplayed == 38) {
ApplyAnimation03b(playerid,"MISC","Seat_talk_02",4.1,0,1,1,1,1);
}else if(animationplayed == 39) {
ApplyAnimation03b(playerid,"MISC","SEAT_watch",4.1,0,1,1,1,1);
}else if(animationplayed == 40) {
ApplyAnimation03b(playerid,"MISC","smalplane_door",4.1,0,1,1,1,1);
}else if(animationplayed == 41) {
ApplyAnimation03b(playerid,"MISC","smlplane_door",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbikelp", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikelp [1-9]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikelp [1-9]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKELEAP","bk_blnce_in",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKELEAP","bk_blnce_out",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKELEAP","bk_jmp",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKELEAP","bk_rdy_in",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BIKELEAP","bk_rdy_out",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BIKELEAP","struggle_cesar",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BIKELEAP","struggle_driver",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BIKELEAP","truck_driver",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BIKELEAP","truck_getin",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbikes", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikes [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikes [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_Back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_drivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_drivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_kick",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_passenger",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"BIKES","BIKEs_Still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbikev", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikev [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikev [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_Back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_drivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_drivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_kick",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_passenger",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"BIKEV","BIKEv_Still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbmx", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbmx [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbmx [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BMX","BMX_back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BMX","BMX_bunnyhop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BMX","BMX_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BMX","BMX_driveby_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BMX","BMX_driveby_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BMX","BMX_fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BMX","BMX_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BMX","BMX_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BMX","BMX_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BMX","BMX_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BMX","BMX_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BMX","BMX_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BMX","BMX_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"BMX","BMX_pedal",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"BMX","BMX_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"BMX","BMX_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"BMX","BMX_sprint",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"BMX","BMX_still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbikedbz", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikedbz [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbikedbz [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKE_DBZ","Pass_Driveby_BWD",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKE_DBZ","Pass_Driveby_FWD",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKE_DBZ","Pass_Driveby_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKE_DBZ","Pass_Driveby_RHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animchase", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animchase [1-25]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 25) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animchase [1-25]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"MD_CHASE","Carhit_Hangon",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"MD_CHASE","Carhit_Tumble",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"MD_CHASE","donutdrop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"MD_CHASE","Fen_Choppa_L1",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"MD_CHASE","Fen_Choppa_L2",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"MD_CHASE","Fen_Choppa_L3",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"MD_CHASE","Fen_Choppa_R1",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"MD_CHASE","Fen_Choppa_R2",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"MD_CHASE","Fen_Choppa_R3",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"MD_CHASE","Hangon_Stun_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"MD_CHASE","Hangon_Stun_Turn",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_2_HANG",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Jmp_BL",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Jmp_F",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Lnd_BL",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Lnd_Die_BL",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Lnd_Die_F",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Lnd_F",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Lnd_Roll",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Lnd_Roll_F",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Punch",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Punch_F",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_BIKE_Shot_F",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_HANG_Lnd_Roll",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"MD_CHASE","MD_HANG_Loop",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbox", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbox [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbox [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BOX","boxhipin",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BOX","boxhipup",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BOX","boxshdwn",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BOX","boxshup",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BOX","bxhipwlk",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BOX","bxhwlki",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BOX","bxshwlk",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BOX","bxshwlki",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BOX","bxwlko",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BOX","catch_box",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbomber", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbomber [1-6]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbomber [1-6]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BOMBER","BOM_Plant",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BOMBER","BOM_Plant_2Idle",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BOMBER","BOM_Plant_Crouch_In",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BOMBER","BOM_Plant_Crouch_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BOMBER","BOM_Plant_In",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BOMBER","BOM_Plant_Loop",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbsp", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbsp [1-41]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 41) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbsp [1-41]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_def_jump_shot",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_def_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_def_stepL",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_def_stepR",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Dnk",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Dnk_Gli",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Dnk_Gli_O",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Dnk_Lnch",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Dnk_Lnch_O",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Dnk_Lnd",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Dnk_O",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_idle",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_idle2",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_idle2_O",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_idleloop",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_idleloop_O",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_idle_O",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Jump_Cancel",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Jump_Cancel_0",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Jump_End",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Jump_Shot",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Jump_Shot_O",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_Net_Dnk_O",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_pickup",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_pickup_O",4.1,0,1,1,1,1);
}else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_react_miss",4.1,0,1,1,1,1);
}else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_react_score",4.1,0,1,1,1,1);
}else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_run",4.1,0,1,1,1,1);
}else if(animationplayed == 29) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_run_O",4.1,0,1,1,1,1);
}else if(animationplayed == 30) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_SkidStop_L",4.1,0,1,1,1,1);
}else if(animationplayed == 31) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_SkidStop_L_O",4.1,0,1,1,1,1);
}else if(animationplayed == 32) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_SkidStop_R",4.1,0,1,1,1,1);
}else if(animationplayed == 33) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_SkidStop_R_O",4.1,0,1,1,1,1);
}else if(animationplayed == 34) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_walk",4.1,0,1,1,1,1);
}else if(animationplayed == 35) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_WalkStop_L",4.1,0,1,1,1,1);
}else if(animationplayed == 36) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_WalkStop_L_O",4.1,0,1,1,1,1);
}else if(animationplayed == 37) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_WalkStop_R",4.1,0,1,1,1,1);
}else if(animationplayed == 38) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_WalkStop_R_O",4.1,0,1,1,1,1);
}else if(animationplayed == 39) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_walk_O",4.1,0,1,1,1,1);
}else if(animationplayed == 40) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_walk_start",4.1,0,1,1,1,1);
}else if(animationplayed == 41) {
ApplyAnimation03b(playerid,"BSKTBALL","BBALL_walk_start_O",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcamera", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcamera [1-14]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcamera [1-14]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CAMERA","camcrch_cmon",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CAMERA","camcrch_idleloop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CAMERA","camcrch_stay",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CAMERA","camcrch_to_camstnd",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CAMERA","camstnd_cmon",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CAMERA","camstnd_idleloop",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CAMERA","camstnd_lkabt",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CAMERA","camstnd_to_camcrch",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CAMERA","piccrch_in",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"CAMERA","piccrch_out",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"CAMERA","piccrch_take",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"CAMERA","picstnd_in",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"CAMERA","picstnd_out",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"CAMERA","picstnd_take",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animgym", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgym [1-24]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 24) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgym [1-24]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"GYMNASIUM","GYMshadowbox",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_celebrate",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_fast",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_faster",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_getoff",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_geton",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_pedal",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_bike_still",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_jog_falloff",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_shadowbox",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_celebrate",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_falloff",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_getoff",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_geton",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_jog",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_sprint",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_tired",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_tread_walk",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"GYMNASIUM","gym_walk_falloff",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"GYMNASIUM","Pedals_fast",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"GYMNASIUM","Pedals_med",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"GYMNASIUM","Pedals_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"GYMNASIUM","Pedals_still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animpara", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpara [1-22]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 22) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpara [1-22]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"PARACHUTE","FALL_skyDive",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"PARACHUTE","FALL_SkyDive_Accel",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"PARACHUTE","FALL_skyDive_DIE",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"PARACHUTE","FALL_SkyDive_L",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"PARACHUTE","FALL_SkyDive_R",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_decel",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_decel_O",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_float",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_float_O",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_Land",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_Land_O",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_Land_Water",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_Land_Water_O",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_open",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_open_O",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_Rip_Land_O",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_Rip_Loop_O",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_Rip_O",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_steerL",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_steerL_O",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_steerR",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"PARACHUTE","PARA_steerR_O",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animgangs", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgangs [1-22]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 22) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgangs [1-22]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"GANGS","DEALER_DEAL",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"GANGS","DEALER_IDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"GANGS","drnkbr_prtl",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"GANGS","drnkbr_prtl_F",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"GANGS","DRUGS_BUY",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"GANGS","hndshkaa",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"GANGS","hndshkba",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"GANGS","hndshkca",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"GANGS","hndshkcb",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"GANGS","hndshkda",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"GANGS","hndshkea",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"GANGS","hndshkfa",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"GANGS","hndshkfa_swt",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"GANGS","Invite_No",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"GANGS","Invite_Yes",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"GANGS","leanIDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"GANGS","leanIN",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"GANGS","leanOUT",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkA",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkB",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkCt",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkD",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkE",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkF",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkG",4.1,0,1,1,1,1);
}else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"GANGS","prtial_gngtlkH",4.1,0,1,1,1,1);
}else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"GANGS","prtial_hndshk_01",4.1,0,1,1,1,1);
}else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"GANGS","prtial_hndshk_biz_01",4.1,0,1,1,1,1);
}else if(animationplayed == 29) {
ApplyAnimation03b(playerid,"GANGS","shake_cara",4.1,0,1,1,1,1);
}else if(animationplayed == 30) {
ApplyAnimation03b(playerid,"GANGS","shake_carK",4.1,0,1,1,1,1);
}else if(animationplayed == 31) {
ApplyAnimation03b(playerid,"GANGS","shake_carSH",4.1,0,1,1,1,1);
}else if(animationplayed == 32) {
ApplyAnimation03b(playerid,"GANGS","smkcig_prtl",4.1,0,1,1,1,1);
}else if(animationplayed == 33) {
ApplyAnimation03b(playerid,"GANGS","smkcig_prtl_F",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animlowrider", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animlowrider [1-39]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 39) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animlowrider [1-39]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"LOWRIDER","F_smklean_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_bdbnce",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_hair",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_hurry",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_idleloop",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_idle_to_l0",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l0_bnce",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l0_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l0_to_l1",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l12_to_l0",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l1_bnce",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l1_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l1_to_l2",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l2_bnce",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l2_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l2_to_l3",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l345_to_l1",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l3_bnce",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l3_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l3_to_l4",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l4_bnce",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l4_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l4_to_l5",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l5_bnce",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"LOWRIDER","lrgirl_l5_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"LOWRIDER","M_smklean_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"LOWRIDER","M_smkstnd_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"LOWRIDER","prtial_gngtlkB",4.1,0,1,1,1,1);
}else if(animationplayed == 29) {
ApplyAnimation03b(playerid,"LOWRIDER","prtial_gngtlkC",4.1,0,1,1,1,1);
}else if(animationplayed == 30) {
ApplyAnimation03b(playerid,"LOWRIDER","prtial_gngtlkD",4.1,0,1,1,1,1);
}else if(animationplayed == 31) {
ApplyAnimation03b(playerid,"LOWRIDER","prtial_gngtlkE",4.1,0,1,1,1,1);
}else if(animationplayed == 32) {
ApplyAnimation03b(playerid,"LOWRIDER","prtial_gngtlkF",4.1,0,1,1,1,1);
}else if(animationplayed == 33) {
ApplyAnimation03b(playerid,"LOWRIDER","prtial_gngtlkG",4.1,0,1,1,1,1);
}else if(animationplayed == 34) {
ApplyAnimation03b(playerid,"LOWRIDER","prtial_gngtlkH",4.1,0,1,1,1,1);
}else if(animationplayed == 35) {
ApplyAnimation03b(playerid,"LOWRIDER","RAP_A_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 36) {
ApplyAnimation03b(playerid,"LOWRIDER","RAP_B_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 37) {
ApplyAnimation03b(playerid,"LOWRIDER","RAP_C_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 38) {
ApplyAnimation03b(playerid,"LOWRIDER","Sit_relaxed",4.1,0,1,1,1,1);
}else if(animationplayed == 39) {
ApplyAnimation03b(playerid,"LOWRIDER","Tap_hand",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animlookers", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animlookers [1-25]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 25) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animlookers [1-25]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"ON_LOOKERS","lkaround_in",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"ON_LOOKERS","lkaround_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"ON_LOOKERS","lkaround_out",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"ON_LOOKERS","lkup_in",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"ON_LOOKERS","lkup_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"ON_LOOKERS","lkup_out",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"ON_LOOKERS","lkup_point",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"ON_LOOKERS","panic_cower",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"ON_LOOKERS","panic_hide",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"ON_LOOKERS","panic_in",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"ON_LOOKERS","panic_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"ON_LOOKERS","panic_out",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"ON_LOOKERS","panic_point",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"ON_LOOKERS","panic_shout",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"ON_LOOKERS","Pointup_in",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"ON_LOOKERS","Pointup_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"ON_LOOKERS","Pointup_out",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"ON_LOOKERS","Pointup_shout",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"ON_LOOKERS","point_in",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"ON_LOOKERS","point_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"ON_LOOKERS","point_out",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"ON_LOOKERS","shout_01",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"ON_LOOKERS","shout_02",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"ON_LOOKERS","shout_in",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"ON_LOOKERS","shout_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"ON_LOOKERS","shout_out",4.1,0,1,1,1,1);
}else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"ON_LOOKERS","wave_in",4.1,0,1,1,1,1);
}else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"ON_LOOKERS","wave_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"ON_LOOKERS","wave_out",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcarchat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcarchat [1-20]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 20) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcarchat [1-20]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CAR_CHAT","carfone_in",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CAR_CHAT","carfone_loopA",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CAR_CHAT","carfone_loopA_to_B",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CAR_CHAT","carfone_loopB",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CAR_CHAT","carfone_loopB_to_A",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CAR_CHAT","carfone_out",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc1_BR",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc1_FL",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc1_FR",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc2_FL",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc3_BR",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc3_FL",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc3_FR",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc4_BL",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc4_BR",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc4_FL",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"CAR_CHAT","CAR_Sc4_FR",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"CAR_CHAT","car_talkm_in",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"CAR_CHAT","car_talkm_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"CAR_CHAT","car_talkm_out",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcasino", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcasino [1-23]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 23) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcasino [1-23]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CASINO","cards_in",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CASINO","cards_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CASINO","cards_lose",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CASINO","cards_out",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CASINO","cards_pick_01",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CASINO","cards_pick_02",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CASINO","cards_raise",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CASINO","cards_win",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CASINO","manwinb",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"CASINO","manwind",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"CASINO","Roulette_bet",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"CASINO","Roulette_in",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"CASINO","Roulette_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"CASINO","Roulette_lose",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"CASINO","Roulette_out",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"CASINO","Roulette_win",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"CASINO","Slot_bet_02",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"CASINO","Slot_in",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"CASINO","Slot_lose_out",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"CASINO","Slot_Plyr",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"CASINO","Slot_wait",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"CASINO","Slot_win_out",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"CASINO","wof",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbuddy", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbuddy [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbuddy [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BUDDY","buddy_crouchfire",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BUDDY","buddy_crouchreload",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BUDDY","buddy_fire",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BUDDY","buddy_fire_poor",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BUDDY","buddy_reload",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbus", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbus [1-9]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbus [1-9]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BUS","BUS_close",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BUS","BUS_getin_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BUS","BUS_getin_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BUS","BUS_getout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BUS","BUS_getout_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BUS","BUS_jacked_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BUS","BUS_open",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BUS","BUS_open_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BUS","BUS_pullout_LHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcar", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcar [1-11]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 11) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcar [1-11]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CAR","Fixn_Car_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CAR","Fixn_Car_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CAR","flag_drop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CAR","Sit_relaxed",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CAR","Tap_hand",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CAR","Tyd2car_bump",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CAR","Tyd2car_high",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CAR","Tyd2car_low",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CAR","Tyd2car_med",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"CAR","Tyd2car_TurnL",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"CAR","Tyd2car_TurnR",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcarry", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcarry [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcarry [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CARRY","liftup",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CARRY","liftup05",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CARRY","liftup105",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CARRY","putdwn",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CARRY","putdwn05",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CARRY","putdwn105",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animintshop", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animintshop [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animintshop [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_cashier",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_in",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_lookA",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_lookB",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_out",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_pay",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"INT_SHOP","shop_shelf",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animjst", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animjst [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animjst [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"JST_BUISNESS","girl_01",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"JST_BUISNESS","girl_02",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"JST_BUISNESS","player_01",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"JST_BUISNESS","smoke_01",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animkart", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animkart [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animkart [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"KART","KART_getin_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"KART","KART_getin_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"KART","KART_getout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"KART","KART_getout_RHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animkissing", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animkissing [1-14]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animkissing [1-14]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"KISSING","BD_GF_Wave",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"KISSING","gfwave2",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"KISSING","GF_CarArgue_01",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"KISSING","GF_CarArgue_02",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"KISSING","GF_CarSpot",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"KISSING","GF_StreetArgue_01",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"KISSING","GF_StreetArgue_02",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"KISSING","gift_give",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"KISSING","Grlfrd_Kiss_01",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"KISSING","Grlfrd_Kiss_02",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"KISSING","Grlfrd_Kiss_03",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"KISSING","Playa_Kiss_01",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"KISSING","Playa_Kiss_02",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"KISSING","Playa_Kiss_03",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animknife", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animknife [1-14]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animknife [1-14]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"KNIFE","KILL_Knife_Ped_Damage",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"KNIFE","KILL_Knife_Ped_Die",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"KNIFE","KILL_Knife_Player",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"KNIFE","KILL_Partial",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"KNIFE","knife_2",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"KNIFE","knife_3",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"KNIFE","knife_4",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"KNIFE","Knife_G",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"KNIFE","knife_hit_1",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"KNIFE","knife_hit_2",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"KNIFE","knife_IDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"KNIFE","knife_hit_3",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"KNIFE","knife_part",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"KNIFE","WEAPON_knifeidle",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animlapdan", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animlapdan [1-6]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animlapdan [1-6]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"LAPDAN1","LAPDAN_D",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"LAPDAN1","LAPDAN_P",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"LAPDAN2","LAPDAN_D",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"LAPDAN2","LAPDAN_P",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"LAPDAN3","LAPDAN_D",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"LAPDAN3","LAPDAN_P",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animdend", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdend [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdend [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"MD_END","END_SC1_PLY",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"MD_END","END_SC1_RYD",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"MD_END","END_SC1_SMO",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"MD_END","END_SC1_SWE",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"MD_END","END_SC2_PLY",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"MD_END","END_SC2_RYD",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"MD_END","END_SC2_SMO",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"MD_END","END_SC2_SWE",4.1,0,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/animmedic", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animmedic [1]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animmedic [1]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"MEDIC","CPR",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animmtb", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animmtb [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animmtb [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"MTB","MTB_back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"MTB","MTB_bunnyhop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"MTB","MTB_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"MTB","MTB_driveby_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"MTB","MTB_driveby_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"MTB","MTB_fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"MTB","MTB_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"MTB","MTB_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"MTB","MTB_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"MTB","MTB_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"MTB","MTB_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"MTB","MTB_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"MTB","MTB_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"MTB","MTB_pedal",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"MTB","MTB_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"MTB","MTB_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"MTB","MTB_sprint",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"MTB","MTB_still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animmusc", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animmusc [1-17]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animmusc [1-17]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"MUSCULAR","MscleWalkst_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"MUSCULAR","MscleWalkst_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"MUSCULAR","Mscle_rckt_run",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"MUSCULAR","Mscle_rckt_walkst",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"MUSCULAR","Mscle_run_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleIdle",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleIdle_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleIdle_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleIdle_rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleRun",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleRun_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleSprint",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleWalk",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleWalkstart",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"MUSCULAR","MuscleWalk_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"MUSCULAR","Musclewalk_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"MUSCULAR","Musclewalk_rocket",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animotb", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animotb [1-11]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 11) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animotb [1-11]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"OTB","betslp_in",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"OTB","betslp_lkabt",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"OTB","betslp_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"OTB","betslp_out",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"OTB","betslp_tnk",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"OTB","wtchrace_cmon",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"OTB","wtchrace_in",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"OTB","wtchrace_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"OTB","wtchrace_lose",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"OTB","wtchrace_out",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"OTB","wtchrace_win",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animnevada", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animnevada [1-2]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animnevada [1-2]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"NEVADA","NEVADA_getin",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"NEVADA","NEVADA_getout",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animpark", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpark [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpark [1-3]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"PARK","Tai_Chi_in",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"PARK","Tai_Chi_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"PARK","Tai_Chi_Out",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animpaul", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpaul [1-12]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpaul [1-12]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"PAULNMAC","Piss_in",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"PAULNMAC","Piss_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"PAULNMAC","Piss_out",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"PAULNMAC","PnM_Argue1_A",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"PAULNMAC","PnM_Argue1_B",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"PAULNMAC","PnM_Argue2_A",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"PAULNMAC","PnM_Argue2_B",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"PAULNMAC","PnM_Loop_A",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"PAULNMAC","PnM_Loop_B",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"PAULNMAC","wank_in",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"PAULNMAC","wank_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"PAULNMAC","wank_out",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animsaw", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsaw [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsaw [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CHAINSAW","CSAW_1",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CHAINSAW","CSAW_2",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CHAINSAW","CSAW_3",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CHAINSAW","CSAW_G",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CHAINSAW","CSAW_Hit_1",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CHAINSAW","CSAW_Hit_2",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CHAINSAW","CSAW_Hit_3",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CHAINSAW","IDLE_csaw",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CHAINSAW","WEAPON_csaw",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"CHAINSAW","WEAPON_csawlo",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animchoppa", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animchoppa [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animchoppa [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_bunnyhop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_driveby_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_driveby_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_pedal",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_Pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_ride",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_sprint",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"CHOPPA","CHOPPA_Still",4.1,0,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/animclothes", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animclothes [1-13]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animclothes [1-13]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Buy",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_In",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Out",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Hat",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_In",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_In_O",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Legs",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Out",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Out_O",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Shoes",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Torso",4.1,0,1,1,1,1);
} else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"CLOTHES","CLO_Pose_Watch",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcoach", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcoach [1-6]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcoach [1-6]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"COACH","COACH_inL",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"COACH","COACH_inR",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"COACH","COACH_opnL",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"COACH","COACH_opnR",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"COACH","COACH_outL",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"COACH","COACH_outR",4.1,0,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/animcolt", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcolt [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcolt [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"COLT45","2guns_crouchfire",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"COLT45","colt45_crouchfire",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"COLT45","colt45_crouchreload",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"COLT45","colt45_fire",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"COLT45","colt45_fire_2hands",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"COLT45","colt45_reload",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"COLT45","sawnoff_reload",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcopa", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcopa [1-12]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcopa[1-12]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Copbrowse_in",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Copbrowse_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Copbrowse_nod",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Copbrowse_out",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Copbrowse_shake",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Coplook_in",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Coplook_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Coplook_nod",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Coplook_out",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Coplook_shake",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Coplook_think",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"COP_AMBIENT","Coplook_watch",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcod", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcod [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcod [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"COP_DVBYZ","COP_Dvby_B",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"COP_DVBYZ","COP_Dvby_FT",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"COP_DVBYZ","COP_Dvby_L",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"COP_DVBYZ","COP_Dvby_R",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcrack", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcrack[1-9]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcrack [1-9]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CRACK","Bbalbat_Idle_01",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CRACK","Bbalbat_Idle_02",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CRACK","crckdeth1",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CRACK","crckdeth2",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CRACK","crckdeth3",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"CRACK","crckdeth4",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"CRACK","crckidle1",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"CRACK","crckidle2",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"CRACK","crckidle3",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animcrib", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcrib [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animcrib [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"CRIB","CRIB_Console_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"CRIB","CRIB_Use_Switch",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"CRIB","PED_Console_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"CRIB","PED_Console_Loose",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"CRIB","PED_Console_Win",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animjump", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animjump [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animjump [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"DAM_JUMP","DAM_Dive_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"DAM_JUMP","DAM_Land",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"DAM_JUMP","DAM_Launch",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"DAM_JUMP","Jump_Roll",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"DAM_JUMP","SF_JumpWall",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animdance", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdance [1-13]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdance [1-13]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"DANCING","bd_clap",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"DANCING","bd_clap1",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"DANCING","dance_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"DANCING","DAN_Down_A",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"DANCING","DAN_Left_A",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"DANCING","DAN_Loop_A",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"DANCING","DAN_Right_A",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"DANCING","DAN_Up_A",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"DANCING","dnce_M_a",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"DANCING","dnce_M_b",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"DANCING","dnce_M_c",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"DANCING","dnce_M_d",4.1,0,1,1,1,1);
} else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"DANCING","dnce_M_e",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animdealer", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdealer [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdealer [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"DEALER","DEALER_DEAL",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"DEALER","DEALER_IDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"DEALER","DEALER_IDLE_01",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"DEALER","DEALER_IDLE_02",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"DEALER","DEALER_IDLE_03",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"DEALER","DRUGS_BUY",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"DEALER","shop_pay",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animdildo", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdildo [1-9]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdildo [1-9]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"DILDO","DILDO_1",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"DILDO","DILDO_2",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"DILDO","DILDO_3",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"DILDO","DILDO_block",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"DILDO","DILDO_G",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"DILDO","DILDO_Hit_1",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"DILDO","DILDO_Hit_2",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"DILDO","DILDO_Hit_3",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"DILDO","DILDO_IDLE",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animdodge", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdodge [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdodge [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"DODGE","Cover_Dive_01",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"DODGE","Cover_Dive_02",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"DODGE","Crushed",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"DODGE","Crush_Jump",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animdozer", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdozer [1-9]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdozer [1-9]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"DOZER","DOZER_Align_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"DOZER","DOZER_Align_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"DOZER","DOZER_getin_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"DOZER","DOZER_getin_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"DOZER","DOZER_getout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"DOZER","DOZER_getout_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"DOZER","DOZER_Jacked_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"DOZER","DOZER_Jacked_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"DOZER","DOZER_pullout_LHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animdrivebys", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdrivebys [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animdrivebys [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyLHS_Bwd",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyLHS_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyRHS_Bwd",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyRHS_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyTop_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"DRIVEBYS","Gang_DrivebyTop_RHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfat [1-17]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfat [1-17]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FAT","FatIdle",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FAT","FatIdle_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FAT","FatIdle_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FAT","FatIdle_Rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FAT","FatRun",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"FAT","FatRun_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"FAT","FatRun_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"FAT","FatRun_Rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"FAT","FatSprint",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"FAT","FatWalk",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"FAT","FatWalkstart",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"FAT","FatWalkstart_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"FAT","FatWalkSt_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"FAT","FatWalkSt_Rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"FAT","FatWalk_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"FAT","FatWalk_Csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"FAT","FatWalk_Rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"FAT","IDLE_tired",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfightb", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfightb [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfightb [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FIGHT_B","FightB_1",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FIGHT_B","FightB_2",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FIGHT_B","FightB_3",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FIGHT_B","FightB_block",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"FIGHT_B","FightB_G",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"FIGHT_B","FightB_IDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"FIGHT_B","FightB_M",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"FIGHT_B","HitB_1",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"FIGHT_B","HitB_2",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"FIGHT_B","HitB_3",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfightc", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfightc [1-12]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfightc [1-12]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_1",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_2",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_3",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_block",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_blocking",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_G",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_IDLE",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_M",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"FIGHT_C","FightC_Spar",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"FIGHT_C","HitC_1",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"FIGHT_C","HitC_2",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"FIGHT_C","HitC_3",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfightd", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfightd [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfightd [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FIGHT_D","FightD_1",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FIGHT_D","FightD_2",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FIGHT_D","FightD_3",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FIGHT_D","FightD_block",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"FIGHT_D","FightD_G",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"FIGHT_D","FightD_IDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"FIGHT_D","FightD_M",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"FIGHT_D","HitD_1",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"FIGHT_D","HitD_2",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"FIGHT_D","HitD_3",4.1,0,1,1,1,1);
}
return 1;
}

if(strcmp(cmd, "/animfighte", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfighte [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfighte [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FIGHT_E","FightKick",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FIGHT_E","FightKick_B",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FIGHT_E","Hit_fightkick",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FIGHT_E","Hit_fightkick_B",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfinale", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfinale [1-15]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 15) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfinale [1-15]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FINALE","FIN_Climb_In",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FINALE","FIN_Cop1_ClimbOut2",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FINALE","FIN_Cop1_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FINALE","FIN_Cop1_Stomp",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FINALE","FIN_Hang_L",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"FINALE","FIN_Hang_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"FINALE","FIN_Hang_R",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"FINALE","FIN_Hang_L",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"FINALE","FIN_Jump_On",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"FINALE","FIN_Land_Car",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"FINALE","FIN_Land_Die",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"FINALE","FIN_LegsUp",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"FINALE","FIN_LegsUp_L",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"FINALE","FIN_LegsUp_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"FINALE","FIN_LegsUp_R",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"FINALE","FIN_Let_Go",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfinale2", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfinale2 [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfinale2 [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Cop1_ClimbOut",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Cop1_Fall",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Cop1_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Cop1_Shot",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Cop1_Swing",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Cop2_ClimbOut",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Switch_P",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"FINALE2","FIN_Switch_S",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animflamef", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animflamef [1-1]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animflamef [1-1]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"FLAME","FLAME_fire",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animflowers", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animflowers [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animflowers [1-3]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"Flowers","Flower_attack",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"Flowers","Flower_attack_M",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"Flowers","Flower_Hit",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animghands", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animghands [1-20]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 20) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animghands [1-20]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"GHANDS","gsign1",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"GHANDS","gsign1LH",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"GHANDS","gsign2",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"GHANDS","gsign2LH",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"GHANDS","gsign3",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"GHANDS","gsign3LH",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"GHANDS","gsign4",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"GHANDS","gsign4LH",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"GHANDS","gsign5",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"GHANDS","gsign5LH",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"GHANDS","LHGsign1",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"GHANDS","LHGsign2",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"GHANDS","LHGsign3",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"GHANDS","LHGsign4",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"GHANDS","LHGsign5",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"GHANDS","RHGsign1",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"GHANDS","RHGsign2",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"GHANDS","RHGsign3",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"GHANDS","RHGsign4",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"GHANDS","RHGsign5",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animfw", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfw [1-9]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 9) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animfw [1-9]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"Freeweights","gym_barbell",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_A",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_B",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_celebrate",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_down",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_pickup",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_putdown",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"Freeweights","gym_free_up_smooth",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animghetto", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animghetto [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animghetto [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"GHETTO_DB","GDB_Car2_PLY",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"GHETTO_DB","GDB_Car2_SMO",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"GHETTO_DB","GDB_Car2_SWE",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"GHETTO_DB","GDB_Car_PLY",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"GHETTO_DB","GDB_Car_RYD",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"GHETTO_DB","GDB_Car_SMO",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"GHETTO_DB","GDB_Car_SWE",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animgog", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgog [1-1]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgog [1-1]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"goggles","goggles_put_on",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animgraffity", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgraffity [1-2]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgraffity [1-2]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"GRAFFITI","graffiti_Chkout",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"GRAFFITI","spraycan_fire",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animgreya", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgreya [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgreya [1-3]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"GRAVEYARD","mrnF_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"GRAVEYARD","mrnM_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"GRAVEYARD","prst_loopa",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animgren", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgren [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animgren [1-3]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"GRENADE","WEAPON_start_throw",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"GRENADE","WEAPON_throw",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"GRENADE","WEAPON_throwu",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animhaircut", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animhaircut [1-13]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 13) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animhaircut [1-13]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Beard_01",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Buy",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Cut",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Cut_In",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Cut_Out",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Hair_01",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Hair_02",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_In",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Out",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Sit_In",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Sit_Loop",4.1,0,1,1,1,1);
} else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"HAIRCUTS","BRB_Sit_Out",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animheist", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animheist [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animheist [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"HEIST9","CAS_G2_GasKO",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllpk_L",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllpk_L_back",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllpk_R",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllpk_R_back",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllshoot_in_L",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllshoot_in_R",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllshoot_out_L",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"HEIST9","swt_wllshoot_out_R",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"HEIST9","Use_SwipeCard",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animinthouse", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animinthouse [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animinthouse [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"INT_HOUSE","BED_In_L",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"INT_HOUSE","BED_In_R",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"INT_HOUSE","BED_Loop_L",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"INT_HOUSE","BED_Loop_R",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"INT_HOUSE","BED_Out_L",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"INT_HOUSE","BED_Out_R",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"INT_HOUSE","LOU_In",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"INT_HOUSE","LOU_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"INT_HOUSE","LOU_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"INT_HOUSE","wash_up",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animintoffice", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animintoffice [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animintoffice [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"INT_OFFICE","FF_Dam_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_2Idle_180",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_Bored_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_Crash",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_Drink",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_Idle_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_In",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_Read",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_Type_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"INT_OFFICE","OFF_Sit_Watch",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animplayerdbf", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animplayerdbf [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animplayerdbf [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"PLAYER_DVBYS","Plyr_DrivebyBwd",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"PLAYER_DVBYS","Plyr_DrivebyFwd",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"PLAYER_DVBYS","Plyr_DrivebyLHS",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"PLAYER_DVBYS","Plyr_DrivebyRHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animplayidles", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animplayidles [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animplayidles [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"PLAYIDLES","shift",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"PLAYIDLES","shldr",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"PLAYIDLES","stretch",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"PLAYIDLES","strleg",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"PLAYIDLES","time",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animpolice", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpolice [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpolice [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"POLICE","CopTraf_Away",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"POLICE","CopTraf_Come",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"POLICE","CopTraf_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"POLICE","CopTraf_Stop",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"POLICE","COP_getoutcar_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"POLICE","Cop_move_FWD",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"POLICE","crm_drgbst_01",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"POLICE","Door_Kick",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"POLICE","plc_drgbst_01",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"POLICE","plc_drgbst_02",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animpool", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpool [1-21]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 21) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpool [1-21]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"POOL","POOL_ChalkCue",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"POOL","POOL_Idle_Stance",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"POOL","POOL_Long_Shot",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"POOL","POOL_Long_Shot_O",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"POOL","POOL_Long_Start",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"POOL","POOL_Long_Start_O",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"POOL","POOL_Med_Shot",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"POOL","POOL_Med_Shot_O",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"POOL","POOL_Med_Start",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"POOL","POOL_Med_Start_O",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"POOL","POOL_Place_White",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"POOL","POOL_Short_Shot",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"POOL","POOL_Short_Shot_O",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"POOL","POOL_Short_Start",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"POOL","POOL_Short_Start_O",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"POOL","POOL_Walk",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"POOL","POOL_Walk_Start",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"POOL","POOL_XLong_Shot",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"POOL","POOL_XLong_Shot_O",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"POOL","POOL_XLong_Start",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"POOL","POOL_XLong_Start_O",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animpoor", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpoor [1-2]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpoor [1-2]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"POOR","WINWASH_Start",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"POOR","WINWASH_Wash2Beg",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animpython", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpython [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animpython [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"PYTHON","python_crouchfire",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"PYTHON","python_crouchreload",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"PYTHON","python_fire",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"PYTHON","python_fire_poor",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"PYTHON","python_reload",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animquad", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animquad [1-17]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animquad [1-17]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"QUAD","QUAD_back",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"QUAD","QUAD_driveby_FT",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"QUAD","QUAD_driveby_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"QUAD","QUAD_driveby_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"QUAD","QUAD_FWD",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"QUAD","QUAD_getoff_B",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"QUAD","QUAD_getoff_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"QUAD","QUAD_getoff_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"QUAD","QUAD_geton_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"QUAD","QUAD_geton_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"QUAD","QUAD_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"QUAD","QUAD_kick",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"QUAD","QUAD_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"QUAD","QUAD_passenger",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"QUAD","QUAD_reverse",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"QUAD","QUAD_ride",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"QUAD","QUAD_Right",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animquadbz", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animquadbz [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animquadbz [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"QUAD_DBZ","Pass_Driveby_BWD",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"QUAD_DBZ","Pass_Driveby_FWD",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"QUAD_DBZ","Pass_Driveby_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"QUAD_DBZ","Pass_Driveby_RHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animrapping", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrapping [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrapping [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"RAPPING","Laugh_01",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"RAPPING","RAP_A_IN",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"RAPPING","RAP_A_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"RAPPING","RAP_A_OUT",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"RAPPING","RAP_B_IN",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"RAPPING","RAP_B_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"RAPPING","RAP_B_OUT",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"RAPPING","RAP_C_Loop",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animrifle", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrifle [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrifle [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"RIFLE","RIFLE_crouchfire",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"RIFLE","RIFLE_crouchload",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"RIFLE","RIFLE_fire",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"RIFLE","RIFLE_fire_poor",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"RIFLE","RIFLE_load",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animriot", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animriot [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animriot [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"RIOT","RIOT_ANGRY",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"RIOT","RIOT_ANGRY_B",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"RIOT","RIOT_challenge",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"RIOT","RIOT_CHANT",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"RIOT","RIOT_FUKU",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"RIOT","RIOT_PUNCHES",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"RIOT","RIOT_shout",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animrobbank", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrobbank [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrobbank [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"ROB_BANK","CAT_Safe_End",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"ROB_BANK","CAT_Safe_Open",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"ROB_BANK","CAT_Safe_Open_O",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"ROB_BANK","CAT_Safe_Rob",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"ROB_BANK","SHP_HandsUp_Scr",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animrocket", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrocket [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrocket [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"ROCKET","idle_rocket",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"ROCKET","RocketFire",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"ROCKET","run_rocket",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"ROCKET","walk_rocket",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"ROCKET","WALK_start_rocket",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animrustler", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrustler [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animrustler [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"RUSTLER","Plane_align_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"RUSTLER","Plane_close",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"RUSTLER","Plane_getin",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"RUSTLER","Plane_getout",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"RUSTLER","Plane_open",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animbiked", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbiked [1-18]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbiked [1-18]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Back",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_drivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_drivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_kick",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_passenger",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_shuffle",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"BIKED","BIKEd_Still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animryder", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animryder [1-14]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 14) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animryder [1-14]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"RYDER","RYD_Beckon_01",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"RYDER","RYD_Beckon_02",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"RYDER","RYD_Beckon_03",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"RYDER","RYD_Die_PT1",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"RYDER","RYD_Die_PT2",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"RYDER","Van_Crate_L",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"RYDER","Van_Crate_R",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"RYDER","Van_Fall_L",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"RYDER","Van_Fall_R",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"RYDER","Van_Lean_L",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"RYDER","Van_Lean_R",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"RYDER","VAN_PickUp_S",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"RYDER","Van_Stand",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"RYDER","Van_Stand_Crate",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"RYDER","Van_Throw",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animscrat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animscrat [1-12]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animscrat [1-12]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SCRATCHING","scdldlp",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SCRATCHING","scdlulp",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SCRATCHING","scdrdlp",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SCRATCHING","scdrulp",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SCRATCHING","sclng_l",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SCRATCHING","sclng_r",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SCRATCHING","scmid_l",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"SCRATCHING","scmid_r",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"SCRATCHING","scshrtl",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"SCRATCHING","scshrtr",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"SCRATCHING","sc_ltor",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"SCRATCHING","sc_rtol",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animshamal", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animshamal [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animshamal [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SHAMAL","SHAMAL_align",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SHAMAL","SHAMAL_getin_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SHAMAL","SHAMAL_getout_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SHAMAL","SHAMAL_open",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animshop", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animshop [1-24]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 24) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animshop [1-24]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SHOP","ROB_2Idle",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SHOP","ROB_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SHOP","donutdrop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SHOP","ROB_Loop_Threat",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SHOP","ROB_Shifty",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SHOP","ROB_StickUp_In",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SHOP","SHP_Duck_Fire",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"SHOP","SHP_Gun_Aim",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"SHOP","SHP_Gun_Duck",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"SHOP","SHP_Gun_Fire",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"SHOP","SHP_Gun_Grab",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"SHOP","SHP_Gun_Threat",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"SHOP","SHP_HandsUp_Scr",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"SHOP","SHP_Jump_Glide",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"SHOP","SHP_Jump_Land",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"SHOP","SHP_Jump_Launch",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"SHOP","SHP_Rob_GiveCash",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"SHOP","SHP_Rob_HandsUp",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"SHOP","SHP_Rob_React",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"SHOP","SHP_Serve_End",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"SHOP","SHP_Serve_Idle",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"SHOP","SHP_Serve_Loop",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"SHOP","SHP_Serve_Start",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"SHOP","Smoke_RYD",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animshotgun", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animshotgun [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animshotgun [1-3]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SHOTGUN","shotgun_crouchfire",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SHOTGUN","shotgun_fire",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SHOTGUN","shotgun_fire_poor",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animskate", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animskate [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animskate [1-3]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SKATE","skate_idle",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SKATE","skate_run",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SKATE","skate_sprint",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animvortex", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animvortex [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animvortex [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"VORTEX","CAR_jumpin_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"VORTEX","CAR_jumpin_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"VORTEX","vortex_getout_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"VORTEX","vortex_getout_RHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animtec", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtec [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtec [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"TEC","TEC_crouchfire",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"TEC","TEC_crouchreload",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"TEC","TEC_fire",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"TEC","TEC_reload",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animtrain", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtrain [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtrain [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"TRAIN","tran_gtup",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"TRAIN","tran_hng",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"TRAIN","tran_ouch",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"TRAIN","tran_stmb",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animsil", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsil [1-4]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 4) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsil [1-4]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SILENCED","CrouchReload",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SILENCED","SilenceCrouchfire",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SILENCED","Silence_fire",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SILENCED","Silence_reload",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animtattoo", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtattoo [1-56]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 56) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtattoo [1-56]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_In_O",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_In_P",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_In_T",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_Out_O",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"TATTOOS","TA_ArmL_Out_P",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_Out_T",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_Pose_O",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_Pose_P",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmL_Pose_T",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_In_O",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_In_P",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_In_T",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_Out_O",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_Out_P",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_Out_T",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_Pose_O",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_Pose_P",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_ArmR_Pose_T",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_In_O",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_In_P",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_In_T",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Out_O",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Out_P",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Out_T",4.1,0,1,1,1,1);
}else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Pose_O",4.1,0,1,1,1,1);
}else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Pose_P",4.1,0,1,1,1,1);
}else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Pose_T",4.1,0,1,1,1,1);
}else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Sit_In_P",4.1,0,1,1,1,1);
}else if(animationplayed == 29) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Sit_Loop_P",4.1,0,1,1,1,1);
}else if(animationplayed == 30) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Back_Sit_Out_P",4.1,0,1,1,1,1);
}else if(animationplayed == 31) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Bel_In_O",4.1,0,1,1,1,1);
}else if(animationplayed == 32) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Bel_In_T",4.1,0,1,1,1,1);
}else if(animationplayed == 33) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Bel_Out_O",4.1,0,1,1,1,1);
}else if(animationplayed == 34) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Bel_Out_T",4.1,0,1,1,1,1);
}else if(animationplayed == 35) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Bel_Pose_O",4.1,0,1,1,1,1);
}else if(animationplayed == 36) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Bel_Pose_T",4.1,0,1,1,1,1);
}else if(animationplayed == 37) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_In_O",4.1,0,1,1,1,1);
}else if(animationplayed == 38) {
ApplyAnimation03b(playerid,"TATTOOS","Sit_relaxed",4.1,0,1,1,1,1);
}else if(animationplayed == 39) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_In_P",4.1,0,1,1,1,1);
}else if(animationplayed == 40) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_In_T",4.1,0,1,1,1,1);
}else if(animationplayed == 41) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_Out_O",4.1,0,1,1,1,1);
}else if(animationplayed == 41) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_Out_P",4.1,0,1,1,1,1);
}else if(animationplayed == 42) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_Out_T",4.1,0,1,1,1,1);
}else if(animationplayed == 43) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_Pose_O",4.1,0,1,1,1,1);
}else if(animationplayed == 44) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_Pose_P",4.1,0,1,1,1,1);
}else if(animationplayed == 45) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Che_Pose_T",4.1,0,1,1,1,1);
}else if(animationplayed == 46) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Idle_Loop_O",4.1,0,1,1,1,1);
}else if(animationplayed == 47) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Idle_Loop_T",4.1,0,1,1,1,1);
}else if(animationplayed == 48) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_In_O",4.1,0,1,1,1,1);
}else if(animationplayed == 49) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_In_P",4.1,0,1,1,1,1);
}else if(animationplayed == 50) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_In_T",4.1,0,1,1,1,1);
}else if(animationplayed == 51) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_Loop_O",4.1,0,1,1,1,1);
}else if(animationplayed == 52) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_Loop_P",4.1,0,1,1,1,1);
}else if(animationplayed == 53) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_Loop_T",4.1,0,1,1,1,1);
}else if(animationplayed == 54) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_Out_O",4.1,0,1,1,1,1);
}else if(animationplayed == 55) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_Out_P",4.1,0,1,1,1,1);
}else if(animationplayed == 56) {
ApplyAnimation03b(playerid,"TATTOOS","TAT_Sit_Out_T",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animsmoking", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsmoking [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsmoking [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SMOKING","F_smklean_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SMOKING","M_smklean_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SMOKING","M_smkstnd_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SMOKING","M_smk_drag",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SMOKING","M_smk_in",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SMOKING","M_smk_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SMOKING","M_smk_out",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"SMOKING","M_smk_tap",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animsniper", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsniper [1-1]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsniper [1-1]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SNIPER","WEAPON_sniper",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animspray", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animspray [1-2]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 2) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animspray [1-2]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SPRAYCAN","spraycan_fire",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SPRAYCAN","spraycan_full",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animstrip", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animstrip [1-20]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 20) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animstrip [1-20]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"STRIP","PLY_CASH",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"STRIP","PUN_CASH",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"STRIP","PUN_HOLLER",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"STRIP","PUN_LOOP",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"STRIP","strip_A",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"STRIP","strip_B",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"STRIP","strip_C",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"STRIP","strip_D",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"STRIP","strip_E",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"STRIP","strip_F",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"STRIP","strip_G",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"STRIP","STR_A2B",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"STRIP","STR_B2A",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"STRIP","STR_B2C",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"STRIP","STR_C1",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"STRIP","STR_C2",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"STRIP","STR_C2B",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"STRIP","STR_Loop_A",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"STRIP","STR_Loop_B",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"STRIP","STR_Loop_C",4.1,0,1,1,1,1);
}

return 1;
}
if(strcmp(cmd, "/animbath", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbath [1-17]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 18) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animbath [1-17]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SUNBATHE","batherdown",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SUNBATHE","batherup",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SUNBATHE","Lay_Bac_in",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SUNBATHE","Lay_Bac_out",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_M_IdleA",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_M_IdleB",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_M_IdleC",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_M_in",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_M_out",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_W_idleA",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_W_idleB",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_W_idleC",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_W_in",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"SUNBATHE","ParkSit_W_out",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"SUNBATHE","SBATHE_F_LieB2Sit",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"SUNBATHE","SBATHE_F_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"SUNBATHE","SitnWait_in_W",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"SUNBATHE","SitnWait_out_W",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animswat", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animswat [1-24]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 24) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animswat [1-24]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SWAT","gnstwall_injurd",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SWAT","JMP_Wall1m_180",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SWAT","Rail_fall",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SWAT","Rail_fall_crawl",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SWAT","swt_breach_01",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SWAT","cards_pick_02",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SWAT","swt_breach_02",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"SWAT","swt_breach_03",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"SWAT","swt_go",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"SWAT","swt_lkt",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"SWAT","swt_sty",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"SWAT","swt_vent_01",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"SWAT","swt_vent_02",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"SWAT","swt_vnt_sht_die",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"SWAT","swt_vnt_sht_in",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"SWAT","swt_vnt_sht_loop",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"SWAT","swt_wllpk_L",4.1,0,1,1,1,1);
}else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"SWAT","swt_wllpk_L_back",4.1,0,1,1,1,1);
}else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"SWAT","swt_wllpk_R",4.1,0,1,1,1,1);
}else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"SWAT","swt_wllpk_R_back",4.1,0,1,1,1,1);
}else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"SWAT","swt_wllshoot_in_L",4.1,0,1,1,1,1);
}else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"SWAT","swt_wllshoot_in_R",4.1,0,1,1,1,1);
}else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"SWAT","swt_wllshoot_out_L",4.1,0,1,1,1,1);
}else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"SWAT","swt_wllshoot_out_R",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animsweet", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsweet [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsweet [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SWEET","ho_ass_slapped",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SWEET","LaFin_Player",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SWEET","LaFin_Sweet",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SWEET","plyr_hndshldr_01",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SWEET","sweet_ass_slap",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SWEET","sweet_hndshldr_01",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SWEET","Sweet_injuredloop",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animswim", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animswim [1-7]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 7) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animswim [1-7]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SWIM","Swim_Breast",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SWIM","SWIM_crawl",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SWIM","Swim_Dive_Under",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SWIM","Swim_Glide",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SWIM","Swim_jumpout",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SWIM","Swim_Tread",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SWIM","Swim_Under",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animsword", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsword [1-10]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 10) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animsword [1-10]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"SWORD","sword_1",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"SWORD","sword_2",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"SWORD","sword_3",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"SWORD","sword_4",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"SWORD","sword_block",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"SWORD","Sword_Hit_1",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"SWORD","Sword_Hit_2",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"SWORD","Sword_Hit_3",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"SWORD","sword_IDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"SWORD","sword_part",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animtank", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtank [1-6]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtank [1-6]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"TANK","TANK_align_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"TANK","TANK_close_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"TANK","TANK_doorlocked",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"TANK","TANK_getin_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"TANK","TANK_getout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"TANK","TANK_open_LHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animtruck", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtruck [1-17]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animtruck [1-17]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_ALIGN_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_ALIGN_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_closedoor_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_closedoor_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_close_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_close_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_getin_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_getin_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_getout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_getout_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_jackedLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_jackedRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_open_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_open_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_pullout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_pullout_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"TRUCK","TRUCK_Shuffle",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animuzi", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animuzi [1-5]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 5) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animuzi [1-5]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"UZI","UZI_crouchfire",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"UZI","UZI_crouchreload",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"UZI","UZI_fire",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"UZI","UZI_fire_poor",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"UZI","UZI_reload",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animvan", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animvan [1-8]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 8) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animvan [1-8]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"VAN","VAN_close_back_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"VAN","VAN_close_back_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"VAN","VAN_getin_Back_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"VAN","VAN_getin_Back_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"VAN","VAN_getout_back_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"VAN","VAN_getout_back_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"VAN","VAN_open_back_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"VAN","VAN_open_back_RHS",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animvending", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animvending [1-6]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 6) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animvending [1-6]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"VENDING","VEND_Drink2_P",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"VENDING","VEND_Drink_P",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"VENDING","vend_eat1_P",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"VENDING","VEND_Eat_P",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"VENDING","VEND_Use",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"VENDING","VEND_Use_pt2",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animway", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animway [1-17]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animway [1-17]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"WAYFARER","WF_Back",4.1,0,1,1,1,1);
}else if(animationplayed == 1) {
ApplyAnimation03b(playerid,"WAYFARER","WF_drivebyFT",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"WAYFARER","WF_drivebyLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"WAYFARER","WF_drivebyRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"WAYFARER","WF_Fwd",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"WAYFARER","WF_getoffBACK",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"WAYFARER","WF_getoffLHS",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"WAYFARER","WF_getoffRHS",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"WAYFARER","WF_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"WAYFARER","WF_jumponL",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"WAYFARER","WF_jumponR",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"WAYFARER","WF_kick",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"WAYFARER","WF_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"WAYFARER","WF_passenger",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"WAYFARER","WF_pushes",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"WAYFARER","WF_Ride",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"WAYFARER","WF_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"WAYFARER","WF_Still",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animweap", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animweap [1-17]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 17) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animweap [1-17]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_1H_Lift",4.1,0,1,1,1,1);
}else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_1H_Lift_End",4.1,0,1,1,1,1);
}else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_1H_Ret",4.1,0,1,1,1,1);
}else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_1H_Ret_S",4.1,0,1,1,1,1);
}else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_2H_Lift",4.1,0,1,1,1,1);
}else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_2H_Lift_End",4.1,0,1,1,1,1);
}else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_2H_Ret",4.1,0,1,1,1,1);
}else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_2H_Ret_S",4.1,0,1,1,1,1);
}else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_Ar_Lift",4.1,0,1,1,1,1);
}else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_Ar_Lift_End",4.1,0,1,1,1,1);
}else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_Ar_Ret",4.1,0,1,1,1,1);
}else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_Ar_Ret_S",4.1,0,1,1,1,1);
}else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_G_Lift_In",4.1,0,1,1,1,1);
}else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_G_Lift_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_Tray_In",4.1,0,1,1,1,1);
}else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_Tray_Out",4.1,0,1,1,1,1);
}else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"WEAPONS","SHP_Tray_Pose",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animwuzi", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animwuzi [1-12]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 12) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animwuzi [1-12]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"WUZI","CS_Dead_Guy",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"WUZI","CS_Plyr_pt1",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"WUZI","CS_Plyr_pt2",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"WUZI","CS_Wuzi_pt1",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"WUZI","CS_Wuzi_pt2",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"WUZI","Walkstart_Idle_01",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"WUZI","Wuzi_follow",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"WUZI","Wuzi_Greet_Plyr",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"WUZI","Wuzi_Greet_Wuzi",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"WUZI","Wuzi_grnd_chk",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"WUZI","Wuzi_stand_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"WUZI","Wuzi_Walk",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/animat", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animat [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animat [1-3]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"Attractors","Stepsit_in",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"Attractors","Stepsit_loop",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"Attractors","Stepsit_out",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animairport", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animairport [1]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 1) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animairport [1]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"AIRPORT","thrw_barl_thrw",4.1,0,1,1,1,1);
}
return 1;
}
}
if(strcmp(cmd, "/animped", true) == 0) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animped [1-295]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 295) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /animped [1-295]");
return 1;
}
if(animationplayed == 1) {
ApplyAnimation03b(playerid,"PED","IDLE_CHAT",4.1,0,1,1,1,1);
} else if(animationplayed == 2) {
ApplyAnimation03b(playerid,"PED","WALK_DRUNK",4.1,0,1,1,1,1);
} else if(animationplayed == 3) {
ApplyAnimation03b(playerid,"PED","abseil",4.1,0,1,1,1,1);
} else if(animationplayed == 4) {
ApplyAnimation03b(playerid,"PED","ARRESTgun",4.1,0,1,1,1,1);
} else if(animationplayed == 5) {
ApplyAnimation03b(playerid,"PED","ATM",4.1,0,1,1,1,1);
} else if(animationplayed == 6) {
ApplyAnimation03b(playerid,"PED","BIKE_elbowL",4.1,0,1,1,1,1);
} else if(animationplayed == 7) {
ApplyAnimation03b(playerid,"PED","BIKE_fallR",4.1,0,1,1,1,1);
} else if(animationplayed == 8) {
ApplyAnimation03b(playerid,"PED","BIKE_fall_off",4.1,0,1,1,1,1);
} else if(animationplayed == 9) {
ApplyAnimation03b(playerid,"PED","BIKE_pickupL",4.1,0,1,1,1,1);
} else if(animationplayed == 10) {
ApplyAnimation03b(playerid,"PED","BIKE_pickupR",4.1,0,1,1,1,1);
} else if(animationplayed == 11) {
ApplyAnimation03b(playerid,"PED","BIKE_pullupL",4.1,0,1,1,1,1);
} else if(animationplayed == 12) {
ApplyAnimation03b(playerid,"PED","BIKE_pullupR",4.1,0,1,1,1,1);
} else if(animationplayed == 13) {
ApplyAnimation03b(playerid,"PED","bomber",4.1,0,1,1,1,1);
} else if(animationplayed == 14) {
ApplyAnimation03b(playerid,"PED","CAR_alignHI_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 15) {
ApplyAnimation03b(playerid,"PED","CAR_alignHI_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 16) {
ApplyAnimation03b(playerid,"PED","CAR_align_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 17) {
ApplyAnimation03b(playerid,"PED","CAR_align_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 18) {
ApplyAnimation03b(playerid,"PED","CAR_closedoorL_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 19) {
ApplyAnimation03b(playerid,"PED","CAR_closedoorL_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 20) {
ApplyAnimation03b(playerid,"PED","CAR_closedoor_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 21) {
ApplyAnimation03b(playerid,"PED","CAR_closedoor_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 22) {
ApplyAnimation03b(playerid,"PED","CAR_close_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 23) {
ApplyAnimation03b(playerid,"PED","CAR_crawloutRHS",4.1,0,1,1,1,1);
} else if(animationplayed == 24) {
ApplyAnimation03b(playerid,"PED","CAR_dead_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 25) {
ApplyAnimation03b(playerid,"PED","CAR_dead_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 26) {
ApplyAnimation03b(playerid,"PED","CAR_doorlocked_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 27) {
ApplyAnimation03b(playerid,"PED","CAR_fallout_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 28) {
ApplyAnimation03b(playerid,"PED","CAR_fallout_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 29) {
ApplyAnimation03b(playerid,"PED","CAR_getinL_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 30) {
ApplyAnimation03b(playerid,"PED","CAR_getinL_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 31) {
ApplyAnimation03b(playerid,"PED","CAR_getin_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 32) {
ApplyAnimation03b(playerid,"PED","CAR_getin_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 33) {
ApplyAnimation03b(playerid,"PED","CAR_getoutL_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 34) {
ApplyAnimation03b(playerid,"PED","CAR_getout_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 35) {
ApplyAnimation03b(playerid,"PED","CAR_getout_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 36) {
ApplyAnimation03b(playerid,"PED","car_hookertalk",4.1,0,1,1,1,1);
} else if(animationplayed == 37) {
ApplyAnimation03b(playerid,"PED","CAR_jackedLHS",4.1,0,1,1,1,1);
} else if(animationplayed == 38) {
ApplyAnimation03b(playerid,"PED","CAR_jackedRHS",4.1,0,1,1,1,1);
} else if(animationplayed == 39) {
ApplyAnimation03b(playerid,"PED","CAR_jumpin_LHS",4.1,0,1,1,1,1);
} else if(animationplayed == 40) {
ApplyAnimation03b(playerid,"PED","CAR_LB",4.1,0,1,1,1,1);
} else if(animationplayed == 41) {
ApplyAnimation03b(playerid,"PED","CAR_LB_pro",4.1,0,1,1,1,1);
} else if(animationplayed == 42) {
ApplyAnimation03b(playerid,"PED","CAR_LB_weak",4.1,0,1,1,1,1);
} else if(animationplayed == 43) {
ApplyAnimation03b(playerid,"PED","CAR_LjackedLHS",4.1,0,1,1,1,1);
} else if(animationplayed == 44) {
ApplyAnimation03b(playerid,"PED","CAR_Lshuffle_RHS",4.1,0,1,1,1,1);
} else if(animationplayed == 45) {
ApplyAnimation03b(playerid,"PED","CAR_Lsit",4.1,0,1,1,1,1);
} else if(animationplayed == 46) {
ApplyAnimation03b(playerid,"PED","CAR_open_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 47) {
ApplyAnimation03b(playerid,"PED","CAR_open_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 49) {
ApplyAnimation03b(playerid,"PED","CAR_pulloutL_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 50) {
ApplyAnimation03b(playerid,"PED","CAR_pulloutL_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 51) {
ApplyAnimation03b(playerid,"PED","CAR_pullout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 52) {
ApplyAnimation03b(playerid,"PED","CAR_pullout_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 53) {
ApplyAnimation03b(playerid,"PED","CAR_Qjacked",4.1,0,1,1,1,1);
}else if(animationplayed == 54) {
ApplyAnimation03b(playerid,"PED","CAR_rolldoor",4.1,0,1,1,1,1);
}else if(animationplayed == 55) {
ApplyAnimation03b(playerid,"PED","CAR_rolldoorLO",4.1,0,1,1,1,1);
}else if(animationplayed == 56) {
ApplyAnimation03b(playerid,"PED","CAR_rollout_LHS",4.1,0,1,1,1,1);
}else if(animationplayed == 57) {
ApplyAnimation03b(playerid,"PED","CAR_rollout_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 58) {
ApplyAnimation03b(playerid,"PED","CAR_shuffle_RHS",4.1,0,1,1,1,1);
}else if(animationplayed == 59) {
ApplyAnimation03b(playerid,"PED","CAR_sit",4.1,0,1,1,1,1);
}else if(animationplayed == 60) {
ApplyAnimation03b(playerid,"PED","CAR_sitp",4.1,0,1,1,1,1);
}else if(animationplayed == 61) {
ApplyAnimation03b(playerid,"PED","CAR_sitpLO",4.1,0,1,1,1,1);
}else if(animationplayed == 62) {
ApplyAnimation03b(playerid,"PED","CAR_sit_pro",4.1,0,1,1,1,1);
}else if(animationplayed == 63) {
ApplyAnimation03b(playerid,"PED","CAR_sit_weak",4.1,0,1,1,1,1);
}else if(animationplayed == 64) {
ApplyAnimation03b(playerid,"PED","CAR_tune_radio",4.1,0,1,1,1,1);
}else if(animationplayed == 65) {
ApplyAnimation03b(playerid,"PED","CLIMB_idle",4.1,0,1,1,1,1);
}else if(animationplayed == 66) {
ApplyAnimation03b(playerid,"PED","CLIMB_jump",4.1,0,1,1,1,1);
}else if(animationplayed == 67) {
ApplyAnimation03b(playerid,"PED","CLIMB_jump2fall",4.1,0,1,1,1,1);
}else if(animationplayed == 68) {
ApplyAnimation03b(playerid,"PED","CLIMB_jump_B",4.1,0,1,1,1,1);
}else if(animationplayed == 69) {
ApplyAnimation03b(playerid,"PED","CLIMB_Pull",4.1,0,1,1,1,1);
}else if(animationplayed == 70) {
ApplyAnimation03b(playerid,"PED","CLIMB_Stand",4.1,0,1,1,1,1);
}else if(animationplayed == 71) {
ApplyAnimation03b(playerid,"PED","CLIMB_Stand_finish",4.1,0,1,1,1,1);
}else if(animationplayed == 72) {
ApplyAnimation03b(playerid,"PED","cower",4.1,0,1,1,1,1);
}else if(animationplayed == 73) {
ApplyAnimation03b(playerid,"PED","Crouch_Roll_L",4.1,0,1,1,1,1);
}else if(animationplayed == 74) {
ApplyAnimation03b(playerid,"PED","Crouch_Roll_R",4.1,0,1,1,1,1);
}else if(animationplayed == 75) {
ApplyAnimation03b(playerid,"PED","DAM_armL_frmBK",4.1,0,1,1,1,1);
}else if(animationplayed == 76) {
ApplyAnimation03b(playerid,"PED","DAM_armL_frmFT",4.1,0,1,1,1,1);
}else if(animationplayed == 77) {
ApplyAnimation03b(playerid,"PED","DAM_armL_frmLT",4.1,0,1,1,1,1);
}else if(animationplayed == 78) {
ApplyAnimation03b(playerid,"PED","DAM_armR_frmBK",4.1,0,1,1,1,1);
}else if(animationplayed == 79) {
ApplyAnimation03b(playerid,"PED","DAM_armR_frmFT",4.1,0,1,1,1,1);
}else if(animationplayed == 80) {
ApplyAnimation03b(playerid,"PED","DAM_armR_frmRT",4.1,0,1,1,1,1);
}else if(animationplayed == 81) {
ApplyAnimation03b(playerid,"PED","DAM_LegL_frmBK",4.1,0,1,1,1,1);
}else if(animationplayed == 82) {
ApplyAnimation03b(playerid,"PED","DAM_LegL_frmFT",4.1,0,1,1,1,1);
}else if(animationplayed == 83) {
ApplyAnimation03b(playerid,"PED","DAM_LegL_frmLT",4.1,0,1,1,1,1);
}else if(animationplayed == 84) {
ApplyAnimation03b(playerid,"PED","DAM_LegR_frmBK",4.1,0,1,1,1,1);
}else if(animationplayed == 85) {
ApplyAnimation03b(playerid,"PED","DAM_LegR_frmFT",4.1,0,1,1,1,1);
}else if(animationplayed == 86) {
ApplyAnimation03b(playerid,"PED","DAM_LegR_frmRT",4.1,0,1,1,1,1);
}else if(animationplayed == 87) {
ApplyAnimation03b(playerid,"PED","DAM_stomach_frmBK",4.1,0,1,1,1,1);
}else if(animationplayed == 88) {
ApplyAnimation03b(playerid,"PED","DAM_stomach_frmFT",4.1,0,1,1,1,1);
}else if(animationplayed == 89) {
ApplyAnimation03b(playerid,"PED","DAM_stomach_frmLT",4.1,0,1,1,1,1);
}else if(animationplayed == 90) {
ApplyAnimation03b(playerid,"PED","DAM_stomach_frmRT",4.1,0,1,1,1,1);
}else if(animationplayed == 91) {
ApplyAnimation03b(playerid,"PED","DOOR_LHinge_O",4.1,0,1,1,1,1);
}else if(animationplayed == 92) {
ApplyAnimation03b(playerid,"PED","DOOR_RHinge_O",4.1,0,1,1,1,1);
}else if(animationplayed == 93) {
ApplyAnimation03b(playerid,"PED","DrivebyL_L",4.1,0,1,1,1,1);
}else if(animationplayed == 94) {
ApplyAnimation03b(playerid,"PED","DrivebyL_R",4.1,0,1,1,1,1);
}else if(animationplayed == 95) {
ApplyAnimation03b(playerid,"PED","Driveby_L",4.1,0,1,1,1,1);
}else if(animationplayed == 96) {
ApplyAnimation03b(playerid,"PED","Driveby_R",4.1,0,1,1,1,1);
}else if(animationplayed == 97) {
ApplyAnimation03b(playerid,"PED","DRIVE_BOAT",4.1,0,1,1,1,1);
}else if(animationplayed == 98) {
ApplyAnimation03b(playerid,"PED","DRIVE_BOAT_back",4.1,0,1,1,1,1);
}else if(animationplayed == 99) {
ApplyAnimation03b(playerid,"PED","DRIVE_BOAT_L",4.1,0,1,1,1,1);
}else if(animationplayed == 100) {
ApplyAnimation03b(playerid,"PED","DRIVE_BOAT_R",4.1,0,1,1,1,1);
}else if(animationplayed == 101) {
ApplyAnimation03b(playerid,"PED","Drive_L",4.1,0,1,1,1,1);
}else if(animationplayed == 102) {
ApplyAnimation03b(playerid,"PED","Drive_LO_l",4.1,0,1,1,1,1);
}else if(animationplayed == 103) {
ApplyAnimation03b(playerid,"PED","Drive_LO_R",4.1,0,1,1,1,1);
}else if(animationplayed == 104) {
ApplyAnimation03b(playerid,"PED","Drive_L_pro",4.1,0,1,1,1,1);
}else if(animationplayed == 105) {
ApplyAnimation03b(playerid,"PED","Drive_L_pro_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 106) {
ApplyAnimation03b(playerid,"PED","Drive_L_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 107) {
ApplyAnimation03b(playerid,"PED","Drive_L_weak",4.1,0,1,1,1,1);
}else if(animationplayed == 108) {
ApplyAnimation03b(playerid,"PED","Drive_L_weak_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 109) {
ApplyAnimation03b(playerid,"PED","Drive_R",4.1,0,1,1,1,1);
}else if(animationplayed == 110) {
ApplyAnimation03b(playerid,"PED","Drive_R_pro",4.1,0,1,1,1,1);
}else if(animationplayed == 111) {
ApplyAnimation03b(playerid,"PED","Drive_R_pro_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 112) {
ApplyAnimation03b(playerid,"PED","Drive_R_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 113) {
ApplyAnimation03b(playerid,"PED","Drive_R_weak",4.1,0,1,1,1,1);
}else if(animationplayed == 114) {
ApplyAnimation03b(playerid,"PED","Drive_R_weak_slow",4.1,0,1,1,1,1);
}else if(animationplayed == 115) {
ApplyAnimation03b(playerid,"PED","Drive_truck",4.1,0,1,1,1,1);
}else if(animationplayed == 116) {
ApplyAnimation03b(playerid,"PED","DRIVE_truck_back",4.1,0,1,1,1,1);
}else if(animationplayed == 117) {
ApplyAnimation03b(playerid,"PED","DRIVE_truck_L",4.1,0,1,1,1,1);
}else if(animationplayed == 118) {
ApplyAnimation03b(playerid,"PED","DRIVE_truck_R",4.1,0,1,1,1,1);
}else if(animationplayed == 119) {
ApplyAnimation03b(playerid,"PED","Drown",4.1,0,1,1,1,1);
}else if(animationplayed == 120) {
ApplyAnimation03b(playerid,"PED","DUCK_cower",4.1,0,1,1,1,1);
}else if(animationplayed == 121) {
ApplyAnimation03b(playerid,"PED","endchat_01",4.1,0,1,1,1,1);
}else if(animationplayed == 122) {
ApplyAnimation03b(playerid,"PED","endchat_02",4.1,0,1,1,1,1);
}else if(animationplayed == 123) {
ApplyAnimation03b(playerid,"PED","endchat_03",4.1,0,1,1,1,1);
}else if(animationplayed == 124) {
ApplyAnimation03b(playerid,"PED","DRIVE_truck_back",4.1,0,1,1,1,1);
}else if(animationplayed == 125) {
ApplyAnimation03b(playerid,"PED","DRIVE_truck_back",4.1,0,1,1,1,1);
}else if(animationplayed == 126) {
ApplyAnimation03b(playerid,"PED","EV_dive",4.1,0,1,1,1,1);
}else if(animationplayed == 127) {
ApplyAnimation03b(playerid,"PED","EV_step",4.1,0,1,1,1,1);
}else if(animationplayed == 128) {
ApplyAnimation03b(playerid,"PED","facanger",4.1,0,1,1,1,1);
}else if(animationplayed == 129) {
ApplyAnimation03b(playerid,"PED","facanger",4.1,0,1,1,1,1);
}else if(animationplayed == 130) {
ApplyAnimation03b(playerid,"PED","facgum",4.1,0,1,1,1,1);
}else if(animationplayed == 131) {
ApplyAnimation03b(playerid,"PED","facsurp",4.1,0,1,1,1,1);
}else if(animationplayed == 132) {
ApplyAnimation03b(playerid,"PED","facsurpm",4.1,0,1,1,1,1);
}else if(animationplayed == 133) {
ApplyAnimation03b(playerid,"PED","factalk",4.1,0,1,1,1,1);
}else if(animationplayed == 134) {
ApplyAnimation03b(playerid,"PED","facurios",4.1,0,1,1,1,1);
}else if(animationplayed == 135) {
ApplyAnimation03b(playerid,"PED","FALL_back",4.1,0,1,1,1,1);
}else if(animationplayed == 136) {
ApplyAnimation03b(playerid,"PED","FALL_collapse",4.1,0,1,1,1,1);
}else if(animationplayed == 137) {
ApplyAnimation03b(playerid,"PED","FALL_fall",4.1,0,1,1,1,1);
}else if(animationplayed == 138) {
ApplyAnimation03b(playerid,"PED","FALL_front",4.1,0,1,1,1,1);
}else if(animationplayed == 139) {
ApplyAnimation03b(playerid,"PED","FALL_glide",4.1,0,1,1,1,1);
}else if(animationplayed == 140) {
ApplyAnimation03b(playerid,"PED","FALL_land",4.1,0,1,1,1,1);
}else if(animationplayed == 141) {
ApplyAnimation03b(playerid,"PED","FALL_skyDive",4.1,0,1,1,1,1);
}else if(animationplayed == 142) {
ApplyAnimation03b(playerid,"PED","Fight2Idle",4.1,0,1,1,1,1);
}else if(animationplayed == 143) {
ApplyAnimation03b(playerid,"PED","FightA_1",4.1,0,1,1,1,1);
}else if(animationplayed == 144) {
ApplyAnimation03b(playerid,"PED","FightA_2",4.1,0,1,1,1,1);
}else if(animationplayed == 145) {
ApplyAnimation03b(playerid,"PED","FightA_3",4.1,0,1,1,1,1);
}else if(animationplayed == 146) {
ApplyAnimation03b(playerid,"PED","FightA_block",4.1,0,1,1,1,1);
}else if(animationplayed == 147) {
ApplyAnimation03b(playerid,"PED","FightA_G",4.1,0,1,1,1,1);
}else if(animationplayed == 148) {
ApplyAnimation03b(playerid,"PED","FightA_M",4.1,0,1,1,1,1);
}else if(animationplayed == 149) {
ApplyAnimation03b(playerid,"PED","FIGHTIDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 150) {
ApplyAnimation03b(playerid,"PED","FightShB",4.1,0,1,1,1,1);
}else if(animationplayed == 151) {
ApplyAnimation03b(playerid,"PED","FightShF",4.1,0,1,1,1,1);
}else if(animationplayed == 152) {
ApplyAnimation03b(playerid,"PED","FightSh_BWD",4.1,0,1,1,1,1);
}else if(animationplayed == 153) {
ApplyAnimation03b(playerid,"PED","FightSh_FWD",4.1,0,1,1,1,1);
}else if(animationplayed == 154) {
ApplyAnimation03b(playerid,"PED","FightSh_Left",4.1,0,1,1,1,1);
}else if(animationplayed == 155) {
ApplyAnimation03b(playerid,"PED","FightSh_Right",4.1,0,1,1,1,1);
}else if(animationplayed == 156) {
ApplyAnimation03b(playerid,"PED","flee_lkaround_01",4.1,0,1,1,1,1);
}else if(animationplayed == 157) {
ApplyAnimation03b(playerid,"PED","FLOOR_hit",4.1,0,1,1,1,1);
}else if(animationplayed == 158) {
ApplyAnimation03b(playerid,"PED","FLOOR_hit_f",4.1,0,1,1,1,1);
}else if(animationplayed == 159) {
ApplyAnimation03b(playerid,"PED","fucku",4.1,0,1,1,1,1);
}else if(animationplayed == 160) {
ApplyAnimation03b(playerid,"PED","gang_gunstand",4.1,0,1,1,1,1);
}else if(animationplayed == 161) {
ApplyAnimation03b(playerid,"PED","gas_cwr",4.1,0,1,1,1,1);
}else if(animationplayed == 162) {
ApplyAnimation03b(playerid,"PED","getup",4.1,0,1,1,1,1);
}else if(animationplayed == 163) {
ApplyAnimation03b(playerid,"PED","getup_front",4.1,0,1,1,1,1);
}else if(animationplayed == 164) {
ApplyAnimation03b(playerid,"PED","gum_eat",4.1,0,1,1,1,1);
}else if(animationplayed == 165) {
ApplyAnimation03b(playerid,"PED","GunCrouchBwd",4.1,0,1,1,1,1);
}else if(animationplayed == 166) {
ApplyAnimation03b(playerid,"PED","GunCrouchFwd",4.1,0,1,1,1,1);
}else if(animationplayed == 167) {
ApplyAnimation03b(playerid,"PED","GunMove_BWD",4.1,0,1,1,1,1);
}else if(animationplayed == 168) {
ApplyAnimation03b(playerid,"PED","GunMove_FWD",4.1,0,1,1,1,1);
}else if(animationplayed == 169) {
ApplyAnimation03b(playerid,"PED","GunMove_L",4.1,0,1,1,1,1);
}else if(animationplayed == 170) {
ApplyAnimation03b(playerid,"PED","GunMove_R",4.1,0,1,1,1,1);
}else if(animationplayed == 171) {
ApplyAnimation03b(playerid,"PED","Gun_2_IDLE",4.1,0,1,1,1,1);
}else if(animationplayed == 172) {
ApplyAnimation03b(playerid,"PED","GUN_BUTT",4.1,0,1,1,1,1);
}else if(animationplayed == 173) {
ApplyAnimation03b(playerid,"PED","GUN_BUTT_crouch",4.1,0,1,1,1,1);
}else if(animationplayed == 174) {
ApplyAnimation03b(playerid,"PED","Gun_stand",4.1,0,1,1,1,1);
}else if(animationplayed == 175) {
ApplyAnimation03b(playerid,"PED","handscower",4.1,0,1,1,1,1);
}else if(animationplayed == 176) {
ApplyAnimation03b(playerid,"PED","handsup",4.1,0,1,1,1,1);
}else if(animationplayed == 177) {
ApplyAnimation03b(playerid,"PED","HitA_1",4.1,0,1,1,1,1);
}else if(animationplayed == 178) {
ApplyAnimation03b(playerid,"PED","HitA_2",4.1,0,1,1,1,1);
}else if(animationplayed == 179) {
ApplyAnimation03b(playerid,"PED","HitA_3",4.1,0,1,1,1,1);
}else if(animationplayed == 180) {
ApplyAnimation03b(playerid,"PED","HIT_back",4.1,0,1,1,1,1);
}else if(animationplayed == 181) {
ApplyAnimation03b(playerid,"PED","HIT_behind",4.1,0,1,1,1,1);
}else if(animationplayed == 182) {
ApplyAnimation03b(playerid,"PED","HIT_front",4.1,0,1,1,1,1);
}else if(animationplayed == 183) {
ApplyAnimation03b(playerid,"PED","HIT_GUN_BUTT",4.1,0,1,1,1,1);
}else if(animationplayed == 184) {
ApplyAnimation03b(playerid,"PED","HIT_L",4.1,0,1,1,1,1);
}else if(animationplayed == 185) {
ApplyAnimation03b(playerid,"PED","HIT_R",4.1,0,1,1,1,1);
}else if(animationplayed == 186) {
ApplyAnimation03b(playerid,"PED","HIT_walk",4.1,0,1,1,1,1);
}else if(animationplayed == 187) {
ApplyAnimation03b(playerid,"PED","HIT_wall",4.1,0,1,1,1,1);
}else if(animationplayed == 188) {
ApplyAnimation03b(playerid,"PED","Idlestance_fat",4.1,0,1,1,1,1);
}else if(animationplayed == 189) {
ApplyAnimation03b(playerid,"PED","idlestance_old",4.1,0,1,1,1,1);
}else if(animationplayed == 190) {
ApplyAnimation03b(playerid,"PED","IDLE_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 191) {
ApplyAnimation03b(playerid,"PED","IDLE_chat",4.1,0,1,1,1,1);
}else if(animationplayed == 192) {
ApplyAnimation03b(playerid,"PED","IDLE_csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 193) {
ApplyAnimation03b(playerid,"PED","Idle_Gang1",4.1,0,1,1,1,1);
}else if(animationplayed == 194) {
ApplyAnimation03b(playerid,"PED","IDLE_HBHB",4.1,0,1,1,1,1);
}else if(animationplayed == 195) {
ApplyAnimation03b(playerid,"PED","IDLE_ROCKET",4.1,0,1,1,1,1);
}else if(animationplayed == 196) {
ApplyAnimation03b(playerid,"PED","IDLE_stance",4.1,0,1,1,1,1);
}else if(animationplayed == 197) {
ApplyAnimation03b(playerid,"PED","IDLE_taxi",4.1,0,1,1,1,1);
}else if(animationplayed == 198) {
ApplyAnimation03b(playerid,"PED","IDLE_tired",4.1,0,1,1,1,1);
}else if(animationplayed == 199) {
ApplyAnimation03b(playerid,"PED","Jetpack_Idle",4.1,0,1,1,1,1);
}else if(animationplayed == 200) {
ApplyAnimation03b(playerid,"PED","JOG_femaleA",4.1,0,1,1,1,1);
}else if(animationplayed == 201) {
ApplyAnimation03b(playerid,"PED","JOG_maleA",4.1,0,1,1,1,1);
}else if(animationplayed == 202) {
ApplyAnimation03b(playerid,"PED","JUMP_glide",4.1,0,1,1,1,1);
}else if(animationplayed == 203) {
ApplyAnimation03b(playerid,"PED","JUMP_land",4.1,0,1,1,1,1);
}else if(animationplayed == 204) {
ApplyAnimation03b(playerid,"PED","JUMP_launch",4.1,0,1,1,1,1);
}else if(animationplayed == 205) {
ApplyAnimation03b(playerid,"PED","JUMP_launch_R",4.1,0,1,1,1,1);
}else if(animationplayed == 206) {
ApplyAnimation03b(playerid,"PED","KART_drive",4.1,0,1,1,1,1);
}else if(animationplayed == 207) {
ApplyAnimation03b(playerid,"PED","KART_L",4.1,0,1,1,1,1);
}else if(animationplayed == 208) {
ApplyAnimation03b(playerid,"PED","KART_LB",4.1,0,1,1,1,1);
}else if(animationplayed == 209) {
ApplyAnimation03b(playerid,"PED","KART_R",4.1,0,1,1,1,1);
}else if(animationplayed == 210) {
ApplyAnimation03b(playerid,"PED","KD_left",4.1,0,1,1,1,1);
}else if(animationplayed == 211) {
ApplyAnimation03b(playerid,"PED","KD_right",4.1,0,1,1,1,1);
}else if(animationplayed == 212) {
ApplyAnimation03b(playerid,"PED","KO_shot_face",4.1,0,1,1,1,1);
}else if(animationplayed == 213) {
ApplyAnimation03b(playerid,"PED","KO_shot_front",4.1,0,1,1,1,1);
}else if(animationplayed == 214) {
ApplyAnimation03b(playerid,"PED","KO_shot_stom",4.1,0,1,1,1,1);
}else if(animationplayed == 215) {
ApplyAnimation03b(playerid,"PED","KO_skid_back",4.1,0,1,1,1,1);
}else if(animationplayed == 216) {
ApplyAnimation03b(playerid,"PED","KO_skid_front",4.1,0,1,1,1,1);
}else if(animationplayed == 217) {
ApplyAnimation03b(playerid,"PED","KO_spin_L",4.1,0,1,1,1,1);
}else if(animationplayed == 218) {
ApplyAnimation03b(playerid,"PED","KO_spin_R",4.1,0,1,1,1,1);
}else if(animationplayed == 219) {
ApplyAnimation03b(playerid,"PED","pass_Smoke_in_car",4.1,0,1,1,1,1);
}else if(animationplayed == 220) {
ApplyAnimation03b(playerid,"PED","phone_in",4.1,0,1,1,1,1);
}else if(animationplayed == 221) {
ApplyAnimation03b(playerid,"PED","phone_out",4.1,0,1,1,1,1);
}else if(animationplayed == 222) {
ApplyAnimation03b(playerid,"PED","phone_talk",4.1,0,1,1,1,1);
}else if(animationplayed == 223) {
ApplyAnimation03b(playerid,"PED","Player_Sneak",4.1,0,1,1,1,1);
}else if(animationplayed == 224) {
ApplyAnimation03b(playerid,"PED","Player_Sneak_walkstart",4.1,0,1,1,1,1);
}else if(animationplayed == 225) {
ApplyAnimation03b(playerid,"PED","roadcross",4.1,0,1,1,1,1);
}else if(animationplayed == 226) {
ApplyAnimation03b(playerid,"PED","roadcross_female",4.1,0,1,1,1,1);
}else if(animationplayed == 227) {
ApplyAnimation03b(playerid,"PED","roadcross_gang",4.1,0,1,1,1,1);
}else if(animationplayed == 228) {
ApplyAnimation03b(playerid,"PED","roadcross_old",4.1,0,1,1,1,1);
}else if(animationplayed == 229) {
ApplyAnimation03b(playerid,"PED","run_1armed",4.1,0,1,1,1,1);
}else if(animationplayed == 230) {
ApplyAnimation03b(playerid,"PED","run_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 231) {
ApplyAnimation03b(playerid,"PED","run_civi",4.1,0,1,1,1,1);
}else if(animationplayed == 232) {
ApplyAnimation03b(playerid,"PED","run_csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 233) {
ApplyAnimation03b(playerid,"PED","run_fat",4.1,0,1,1,1,1);
}else if(animationplayed == 234) {
ApplyAnimation03b(playerid,"PED","run_fatold",4.1,0,1,1,1,1);
}else if(animationplayed == 235) {
ApplyAnimation03b(playerid,"PED","run_gang1",4.1,0,1,1,1,1);
}else if(animationplayed == 236) {
ApplyAnimation03b(playerid,"PED","run_left",4.1,0,1,1,1,1);
}else if(animationplayed == 237) {
ApplyAnimation03b(playerid,"PED","run_old",4.1,0,1,1,1,1);
}else if(animationplayed == 238) {
ApplyAnimation03b(playerid,"PED","run_player",4.1,0,1,1,1,1);
}else if(animationplayed == 239) {
ApplyAnimation03b(playerid,"PED","run_right",4.1,0,1,1,1,1);
}else if(animationplayed == 240) {
ApplyAnimation03b(playerid,"PED","run_rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 241) {
ApplyAnimation03b(playerid,"PED","Run_stop",4.1,0,1,1,1,1);
}else if(animationplayed == 242) {
ApplyAnimation03b(playerid,"PED","Run_stopR",4.1,0,1,1,1,1);
}else if(animationplayed == 243) {
ApplyAnimation03b(playerid,"PED","Run_Wuzi",4.1,0,1,1,1,1);
}else if(animationplayed == 244) {
ApplyAnimation03b(playerid,"PED","SEAT_down",4.1,0,1,1,1,1);
}else if(animationplayed == 245) {
ApplyAnimation03b(playerid,"PED","SEAT_idle",4.1,0,1,1,1,1);
}else if(animationplayed == 246) {
ApplyAnimation03b(playerid,"PED","SEAT_up",4.1,0,1,1,1,1);
}else if(animationplayed == 247) {
ApplyAnimation03b(playerid,"PED","SHOT_leftP",4.1,0,1,1,1,1);
}else if(animationplayed == 248) {
ApplyAnimation03b(playerid,"PED","SHOT_partial",4.1,0,1,1,1,1);
}else if(animationplayed == 249) {
ApplyAnimation03b(playerid,"PED","SHOT_partial_B",4.1,0,1,1,1,1);
}else if(animationplayed == 250) {
ApplyAnimation03b(playerid,"PED","SHOT_rightP",4.1,0,1,1,1,1);
}else if(animationplayed == 251) {
ApplyAnimation03b(playerid,"PED","Shove_Partial",4.1,0,1,1,1,1);
}else if(animationplayed == 252) {
ApplyAnimation03b(playerid,"PED","Smoke_in_car",4.1,0,1,1,1,1);
}else if(animationplayed == 253) {
ApplyAnimation03b(playerid,"PED","sprint_civi",4.1,0,1,1,1,1);
}else if(animationplayed == 254) {
ApplyAnimation03b(playerid,"PED","sprint_panic",4.1,0,1,1,1,1);
}else if(animationplayed == 255) {
ApplyAnimation03b(playerid,"PED","Sprint_Wuzi",4.1,0,1,1,1,1);
}else if(animationplayed == 256) {
ApplyAnimation03b(playerid,"PED","swat_run",4.1,0,1,1,1,1);
}else if(animationplayed == 257) {
ApplyAnimation03b(playerid,"PED","Swim_Tread",4.1,0,1,1,1,1);
}else if(animationplayed == 258) {
ApplyAnimation03b(playerid,"PED","Tap_hand",4.1,0,1,1,1,1);
}else if(animationplayed == 259) {
ApplyAnimation03b(playerid,"PED","Tap_handP",4.1,0,1,1,1,1);
}else if(animationplayed == 260) {
ApplyAnimation03b(playerid,"PED","turn_180",4.1,0,1,1,1,1);
}else if(animationplayed == 261) {
ApplyAnimation03b(playerid,"PED","Turn_L",4.1,0,1,1,1,1);
}else if(animationplayed == 262) {
ApplyAnimation03b(playerid,"PED","Turn_R",4.1,0,1,1,1,1);
}else if(animationplayed == 263) {
ApplyAnimation03b(playerid,"PED","WALK_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 264) {
ApplyAnimation03b(playerid,"PED","WALK_civi",4.1,0,1,1,1,1);
}else if(animationplayed == 265) {
ApplyAnimation03b(playerid,"PED","WALK_csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 266) {
ApplyAnimation03b(playerid,"PED","Walk_DoorPartial",4.1,0,1,1,1,1);
}else if(animationplayed == 267) {
ApplyAnimation03b(playerid,"PED","WALK_drunk",4.1,0,1,1,1,1);
}else if(animationplayed == 268) {
ApplyAnimation03b(playerid,"PED","WALK_fat",4.1,0,1,1,1,1);
}else if(animationplayed == 269) {
ApplyAnimation03b(playerid,"PED","WALK_fatold",4.1,0,1,1,1,1);
}else if(animationplayed == 270) {
ApplyAnimation03b(playerid,"PED","WALK_gang1",4.1,0,1,1,1,1);
}else if(animationplayed == 271) {
ApplyAnimation03b(playerid,"PED","WALK_gang2",4.1,0,1,1,1,1);
}else if(animationplayed == 272) {
ApplyAnimation03b(playerid,"PED","WALK_old",4.1,0,1,1,1,1);
}else if(animationplayed == 273) {
ApplyAnimation03b(playerid,"PED","WALK_player",4.1,0,1,1,1,1);
}else if(animationplayed == 274) {
ApplyAnimation03b(playerid,"PED","WALK_rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 275) {
ApplyAnimation03b(playerid,"PED","WALK_shuffle",4.1,0,1,1,1,1);
}else if(animationplayed == 276) {
ApplyAnimation03b(playerid,"PED","WALK_start",4.1,0,1,1,1,1);
}else if(animationplayed == 277) {
ApplyAnimation03b(playerid,"PED","WALK_start_armed",4.1,0,1,1,1,1);
}else if(animationplayed == 278) {
ApplyAnimation03b(playerid,"PED","WALK_start_csaw",4.1,0,1,1,1,1);
}else if(animationplayed == 279) {
ApplyAnimation03b(playerid,"PED","WALK_start_rocket",4.1,0,1,1,1,1);
}else if(animationplayed == 280) {
ApplyAnimation03b(playerid,"PED","Walk_Wuzi",4.1,0,1,1,1,1);
}else if(animationplayed == 281) {
ApplyAnimation03b(playerid,"PED","WEAPON_crouch",4.1,0,1,1,1,1);
}else if(animationplayed == 282) {
ApplyAnimation03b(playerid,"PED","woman_idlestance",4.1,0,1,1,1,1);
}else if(animationplayed == 283) {
ApplyAnimation03b(playerid,"PED","woman_run",4.1,0,1,1,1,1);
}else if(animationplayed == 284) {
ApplyAnimation03b(playerid,"PED","WOMAN_runbusy",4.1,0,1,1,1,1);
}else if(animationplayed == 285) {
ApplyAnimation03b(playerid,"PED","WOMAN_runfatold",4.1,0,1,1,1,1);
}else if(animationplayed == 286) {
ApplyAnimation03b(playerid,"PED","woman_runpanic",4.1,0,1,1,1,1);
}else if(animationplayed == 287) {
ApplyAnimation03b(playerid,"PED","WOMAN_runsexy",4.1,0,1,1,1,1);
}else if(animationplayed == 288) {
ApplyAnimation03b(playerid,"PED","WOMAN_walkbusy",4.1,0,1,1,1,1);
}else if(animationplayed == 289) {
ApplyAnimation03b(playerid,"PED","WOMAN_walkfatold",4.1,0,1,1,1,1);
}else if(animationplayed == 290) {
ApplyAnimation03b(playerid,"PED","WOMAN_walknorm",4.1,0,1,1,1,1);
}else if(animationplayed == 291) {
ApplyAnimation03b(playerid,"PED","WOMAN_walkold",4.1,0,1,1,1,1);
}else if(animationplayed == 292) {
ApplyAnimation03b(playerid,"PED","WOMAN_walkpro",4.1,0,1,1,1,1);
}else if(animationplayed == 293) {
ApplyAnimation03b(playerid,"PED","WOMAN_walksexy",4.1,0,1,1,1,1);
}else if(animationplayed == 294) {
ApplyAnimation03b(playerid,"PED","WOMAN_walkshop",4.1,0,1,1,1,1);
}else if(animationplayed == 295) {
ApplyAnimation03b(playerid,"PED","XPRESSscratch",4.1,0,1,1,1,1);
}
return 1;
}
if(strcmp(cmd, "/handsup", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
return 1;
}
}
if(strcmp(cmd, "/dance", true) == 0) {
if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
tmp = strtok(cmdtext, idx);
if(!strlen(tmp)) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /dance [1-3]");
return 1;
}
animationplayed = strval(tmp);
if(animationplayed < 1 || animationplayed > 3) {
SendClientMessage(playerid,0xFF0000FF,">Пишите /dance [1-3]");
return 1;
}
if(animationplayed == 1) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
} else if(animationplayed == 2) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
} else if(animationplayed == 3) {
SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
}
return 1;
}
}
return 0;
}
public OnPlayerConnect(playerid)
{
SendClientMessage(playerid,COLOR_YELLOW,">Anim System by [VLA]Wooz1e Loaded(www.vla-team.com)Write /animhelp");
return 1;
}

