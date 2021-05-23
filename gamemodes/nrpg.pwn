/*

	Nirvana - RPG
	By Jabba

*/

#include <a_samp>
//DEFINES
#define MAX_STRING 256
#define STR 100

//CORES
#define COR_BRANCO 0xFFFFFFAA
#define COR_VERDEF 0x7FFF00AA
#define COR_AMARELO 0xFFFF00AA
#define COR_GRADIENTE 0xB4B5B7FF

//FORWARDS
forward Tutorial(playerid);
forward SalvarPos(playerid);
forward CameraTipo(playerid,tipo);
forward TextStatus(playerid);
forward FomeSono(playerid);
forward AntiSaude();
forward SpawnJogador(playerid);
forward ConversaAt();
forward Radar(playerid,Float:Pox,Float:Poy);
forward DestruirMPS(playerid);
forward FuncaoPickups(playerid,dinheirox);
//VARIAVEIS
new tempotutorial[MAX_PLAYERS];
new jogando[MAX_PLAYERS];
new Tempohospital[MAX_PLAYERS];
new partetutorial[MAX_PLAYERS];
new Registrado[MAX_PLAYERS];
new Registrando[MAX_PLAYERS];
new Logado[MAX_PLAYERS];
new DigitouSenha[MAX_PLAYERS];
new Viututorial[MAX_PLAYERS];
new FoiMorto[MAX_PLAYERS];
new Interior[MAX_PLAYERS];
new VirtualWorld[MAX_PLAYERS];
new Float:Rotacao[MAX_PLAYERS];
new Float:Sauded[MAX_PLAYERS];
new Float:Coleted[MAX_PLAYERS];
new SalvaPos[MAX_PLAYERS];
new Float:AtSono[MAX_PLAYERS];
new UltimoTexto[200][192];
new Senha[200][192];
new Email[200][192];
new SenhaConfirma[200][192];
new Float:Camtarg[MAX_PLAYERS];
new BarraSC[MAX_PLAYERS];
new MortePick[MAX_PLAYERS];
new DinheiroPick[MAX_PLAYERS];
new TempoPick[MAX_PLAYERS];

//TEXTDRAWS
new Text:Txt0;
new Text:Txt1;
new Text:Txt2;
new Text:Txt3;
new Text:Txt4;
new Text:Txt5;
new Text:Txt6;
new Text:Txt7;
new Text:Txt0i;
new Text:Txt1i;
new Text:Txt2i;
new Text:Txt3i;
new Text:Txt4i;
new Text:Txt5i;
new Text:Txtbb;
new Text:Txt0p;
new Text:Txt1p;
new Text:Txtb0;
new Text:Txtb1[MAX_PLAYERS];
new Text:Txtb2;
new Text:Txtb3[MAX_PLAYERS];
new Text:Txtb4;
new Text:Txtb5[MAX_PLAYERS];
new Text:Txtb6;
new Text:Txtb7[MAX_PLAYERS];
new Text:Txtb8;
new Text:Txtb9;
new Text:Txt0q;
new Text:Txt1q;
new Text:Txt2q;
new Text:Txt3q;
new Text:Txt4q;
new Text:Txt5q;
new Text:Textdraw0rw;
new Text:Textdraw1rw;
new Text:Textdraw2rw;
new Text:Textdraw3rw;
new Text:Textdraw4rw;
new Text:Textdraw5rw;
new Text:Textdraw6rw;
new Text:Textdraw0op;
new Text:Textdraw1op;
new Text:Textdraw2op;
new Text:Textdraw3op;
new Text:Textdraw4op;
new Text:Textdraw5op;
new Text:Textdraw6op;
new Text:Textdraw7op;
new Text:Textdraw0hy;
new Text:Textdraw1hy;
new Text:Textdraw2hy;
new Text:Textdraw3hy;
new Text:Textdraw4hy;
new Text:Textdraw5hy;
new Text:Textdraw6hy;
new Text:Textdraw7hy;
new Text:Textdraw0dw;
new Text:Textdraw1dw;
new Text:Textdraw2dw;
new Text:Textdraw3dw;
new Text:Textdraw4dw;
new Text:Textdraw5dw;
new Text:agindo;
new Text:comofalar;
new Text:ajudaetc;
new Text:regraspun;
new Text:bomjogo;
new Text:Texthig0;
new Text:Texthig1[MAX_PLAYERS];
new Text:Texthig2;

new Menu:RouboCarroM;

//ARRAYS
new skins[269] = {
105,106,107,102,103,104,114,115,116,108,109,110,121,
122,123,173,174,175,117,118,120,100,247,248,254,111,
112,113,124,125,126,127,163,164,165,166,274,275,276,
277,278,279,280,281,282,283,288,284,285,286,287,195,
190,191,192,193,194,138,139,140,145,146,154,251,92,
97,45,18,128,129,130,131,132,133,157,158,159,160,196,
197,198,199,161,162,200,201,202,31,32,33,34,152,178,
237,238,243,244,207,245,246,85,256,257,64,63,87,90,
258,259,26,51,52,80,81,23,96,99,11,141,147,148,150,
153,167,168,171,176,177,172,179,187,189,203,204,155,
205,209,217,211,219,260,16,27,264,70,134,135,137,181,
213,212,224,230,239,249,241,242,252,253,255,29,30,49,
50,57,61,62,66,73,77,78,79,82,83,84,10,101,12,13,136,
14,142,143,144,15,151,156,168,169,17,170,180,182,54,
183,184,263,75,186,185,188,19,216,20,206,21,22,210,
214,215,220,221,225,226,222,223,227,231,228,234,76,
235,236,89,88,24,218,240,25,250,261,28,40,41,35,37,
38,36,44,69,43,46,9,93,39,48,47,262,229,58,59,60,232,
233,67,7,72,55,94,95,98,56,265,266,267,269,270,271,272
};
new Float:AviaoSpawn[5][3] = {
{0.89,30.45,1199.59},
{0.6,27.7,1199.5},
{2.9,26.5,1199.5},
{2.9,28.8,1199.5},
{1.6,33.2,1199.5}
};
new Float:CaiDoAviao[4][3] = {
{-1457.2,-267.9,14.1},
{-1423.0,-287.0,14.1},
{-1402.2,-307.6,14.1},
{-1383.4,-342.5,14.1}
};
new Float:Hospitalspawn[4][3] = {
{-2657.46,695.68,27.94},
{-2643.36,638.79,14.45},
{-2685.75,638.97,14.45},
{-2637.37,695.81,27.94}
};
new Float:CamerasIniciais[18][3] = {
{-1829.8,1620.9,80.98},//POSICAO 1
{-1638.0,865.3,136.6},//POSICAO 2
{-2212.26,656.27,135.82},//POSICAO 3
{-1886.36,839.55,133.62},//POSICAO 4
{-1880.88,1132.77,106.88},//POSICAO 5
{-2768.50,1228.13,60.43},//POSICAO 6
{-1816.55,1309.36,79.0},//LOOKAT 1
{-1525.9,682.9,44.8},//LOOKAT 2
{-1991.28,761.93,85.92},//LOOKAT 3
{-1974.81,904.25,45.20},//LOOKAT 4
{-2041.18,1067.76,61.14},//LOOKAT 5
{-2803.98,1159.33,20.27},//LOOKAT 6
{-1831.61,1661.90,40.98},//PLAYERPOS 1
{-1638.0,865.3,106.6},//PLAYERPOS 2
{-2212.26,656.27,105.82},//PLAYERPOS 3
{-1886.36,839.55,103.62},//PLAYERPOS 4
{-1880.88,1132.77,96.88},//PLAYERPOS 5
{-2768.50,1228.13,50.43}//PLAYERPOS 6
};

new Palavroes[56][256] = {
"Porra","Foda","Fude","Foda-se","Fudendo","Fuder",
"Fudidão","Fudidao","Fudido","Fudida",
"Fodao","Fodi","Fudi","Fode","Fudeu","Fodeu","Puta",
"Putona","Putinha","Vagabundo","Vagabunda",
"Caralho","Caralhudo","Carai","Tomar no cu",
"Tomar no seu cu","Tomar no cú","Buceta","Bucetona",
"Bucetinha","Bucetuda","Bucetudo","Desgraça",
"Desgraca","Desgracado","Desgracada","Viado",
"Viadinho","Gay","Penis","Vagina","Bicha","Bixa",
"Bichona","Bixona","Lascar","Lasquei","Lascado",
"Vadia","Otario","Babaca","Troxa","Traveco",
"Traveca","Homosexual","Homossexual"
};

enum lerjogador
{
	senha[128],skin,dinheiro,chavecarro,chavecasa,
	profissao,banco,carronome[256],procurado,tempohospital,
	tempoprisao,drogas_maconha,drogas_crack,drogas_coca,
	drogas_analg,drogas_merla,drogas_opio,maleta,mochila,
	celular,
	estudo,tempotrabalho,experiencia,Float:sono,Float:higiene,
	Float:fome,Float:saude,Float:colete,Float:UltimoLugarX,
    Float:UltimoLugarY,Float:UltimoLugarZ
}
new InfoJogador[MAX_PLAYERS][lerjogador];

main()
{
    new msg1[14] = {32,32,78,105,114,118,97,110,97,32,82,80,71,0};
    new msg2[11] = {32,32,66,121,32,74,97,98,98,97,0};
    print("--------------------");
	print(" ");
    print(msg1);
    print(" ");
    print(msg2);
    print(" ");
    print("--------------------");
}

public OnGameModeInit()
{
	//DECLARAÇÕES
	SetGameModeText("Testing...");
	LimitGlobalChatRadius(15.0);
	SetTimer("AntiSaude",250,true);
 	SetTimer("ConversaAt",2000,true);
	ShowNameTags(1); //mostrar nomes
	ShowPlayerMarkers(0); //esconder no radar
	AllowInteriorWeapons(1); //Permitir armas nos interiores
	EnableStuntBonusForAll(0); //Desativar Stunts
	EnableTirePopping(1); //Ativar pneu furado
	UsePlayerPedAnims(); //Nao usar animacoes de pedestres
	DisableInteriorEnterExits(); //Desativar a entrada de interiores
	SetDisabledWeapons(43,44,45);//Desativar Cameras fotograficas, visoes noturnas e infra-vermelho
	SetNameTagDrawDistance(15.0); //distancia de mostrar os nomes
	//94 OBJETOS --- ILHA
    /*CreateObject(14387,-2980.379,-3319.266,3.622,0.0,0.0,90.000);
	CreateObject(14387,-2976.026,-3319.269,3.620,0.0,0.0,90.000);
	CreateObject(2773,-2973.846,-3317.552,3.232,-32.659,6.875,0.0);
	CreateObject(2773,-2973.840,-3319.146,4.265,-34.377,6.875,0.0);
	CreateObject(2773,-2982.656,-3317.665,3.301,-36.096,6.875,0.0);
	CreateObject(2773,-2982.625,-3319.208,4.425,-36.096,6.875,0.0);
	CreateObject(8037,-2978.413,-3380.407,4.594,0.0,0.0,0.0);
	CreateObject(3749,-2978.184,-3321.991,10.437,0.0,0.0,0.0);
	CreateObject(3310,-3036.049,-3332.800,6.792,0.0,0.0,-180.000);
	CreateObject(3311,-3036.070,-3357.752,7.665,0.0,0.0,90.000);
	CreateObject(3312,-3036.593,-3382.156,7.693,0.0,0.0,-180.000);
	CreateObject(3313,-3036.643,-3406.823,7.604,0.0,0.0,90.000);
	CreateObject(3445,-3041.564,-3428.061,7.694,0.0,0.0,90.000);
	CreateObject(3485,-3012.170,-3452.677,11.693,0.0,0.0,180.000);
	CreateObject(3486,-2982.192,-3452.579,11.705,0.0,0.0,-180.000);
	CreateObject(3487,-2956.561,-3452.549,11.302,0.0,0.0,-180.000);
	CreateObject(3446,-2937.207,-3449.963,8.205,0.0,0.0,-180.000);
	CreateObject(3485,-2914.470,-3420.628,11.691,0.0,0.0,-90.000);
	CreateObject(3486,-2914.436,-3390.857,11.730,0.0,0.0,-90.000);
	CreateObject(3484,-2911.877,-3361.116,11.377,0.0,0.0,-90.000);
	CreateObject(3315,-2909.962,-3337.551,5.696,0.0,0.0,-90.000);
	CreateObject(7191,-3010.215,-3320.418,6.701,0.0,0.0,90.000);
	CreateObject(7191,-2948.558,-3320.755,6.701,0.0,0.0,90.000);
	CreateObject(17472,-3011.867,-3303.819,1.126,0.0,0.0,4.297);
	CreateObject(17472,-3062.997,-3316.552,4.586,-5.157,0.0,54.145);
	CreateObject(17472,-3064.631,-3358.549,7.446,-5.157,0.0,97.116);
	CreateObject(17472,-3068.068,-3404.041,5.135,-5.157,0.0,93.679);
	CreateObject(17472,-3054.796,-3454.886,8.421,6.016,0.0,142.667);
	CreateObject(17472,-3007.240,-3487.435,7.484,6.016,0.0,183.920);
	CreateObject(17472,-2964.507,-3486.838,10.075,6.016,0.0,189.077);
	CreateObject(17472,-2917.381,-3476.330,4.703,6.016,0.0,220.016);
	CreateObject(17472,-2878.838,-3430.718,7.870,6.016,0.0,265.566);
	CreateObject(17472,-2877.084,-3384.432,9.049,10.313,0.0,275.880);
	CreateObject(17472,-2875.497,-3345.948,9.714,10.313,0.0,271.583);
	CreateObject(17472,-2886.566,-3304.622,0.956,1.719,0.0,341.197);
	CreateObject(17472,-2931.242,-3302.561,3.817,-0.859,0.0,12.137);
	CreateObject(17033,-2957.227,-3307.916,-0.994,0.0,0.0,0.0);
	CreateObject(17033,-2960.922,-3317.774,-1.100,0.0,0.0,-18.908);
	CreateObject(17033,-2959.404,-3315.125,0.232,0.0,-0.859,24.924);
	CreateObject(17033,-3037.135,-3451.075,4.182,0.0,-0.859,-58.442);
	CreateObject(17033,-3042.879,-3444.672,4.394,0.0,-0.859,-53.285);
	CreateObject(17033,-2912.934,-3454.624,-0.136,0.0,-0.859,14.610);
	CreateObject(17033,-2910.731,-3445.805,-0.237,0.0,-0.859,14.610);
	CreateObject(17033,-2917.957,-3447.498,0.593,0.0,-0.859,55.004);
	CreateObject(17033,-2922.172,-3457.024,0.496,0.0,-0.859,55.004);
	CreateObject(17033,-2924.387,-3444.562,1.830,0.0,-0.859,49.847);
	CreateObject(18238,-2978.307,-3336.654,4.600,0.0,0.0,-180.241);
	CreateObject(8209,-2981.531,-3470.042,7.597,0.0,0.0,0.859);
	CreateObject(8209,-2895.579,-3395.570,7.878,0.0,0.0,-91.960);
	CreateObject(8209,-3049.369,-3368.349,8.364,0.0,0.0,-270.723);
	CreateObject(987,-2891.666,-3334.488,5.704,0.0,0.0,-101.414);
	CreateObject(987,-2892.008,-3322.523,5.704,0.0,0.0,-88.522);
	CreateObject(987,-2946.126,-3464.168,4.450,0.0,0.0,-107.430);
	CreateObject(987,-2934.392,-3464.370,4.432,0.0,0.0,-180.482);
	CreateObject(987,-2922.836,-3461.252,4.425,0.0,0.0,-165.012);
	CreateObject(987,-2928.366,-3450.881,4.775,0.0,0.0,-90.241);
	CreateObject(987,-2928.135,-3438.904,4.775,0.0,0.0,-91.100);
	CreateObject(987,-2916.931,-3435.593,4.822,0.0,0.0,-163.293);
	CreateObject(987,-2904.885,-3435.970,4.825,0.0,0.0,-180.482);
	CreateObject(987,-2904.801,-3435.910,4.807,0.0,0.0,0.0);
	CreateObject(987,-3027.221,-3470.998,4.739,0.0,0.0,90.241);
	CreateObject(987,-3027.198,-3458.992,4.739,0.0,0.0,90.241);
	CreateObject(987,-3027.205,-3446.976,4.746,0.0,0.0,90.241);
	CreateObject(987,-3027.083,-3437.012,4.666,0.0,0.0,180.482);
	CreateObject(987,-3039.042,-3437.105,4.641,0.0,0.0,-178.763);
	CreateObject(987,-3057.736,-3426.729,4.678,0.0,0.0,47.269);
	CreateObject(4100,-3038.989,-3320.457,7.447,0.0,0.0,-39.534);
	CreateObject(980,-2978.137,-3322.753,7.351,0.0,0.0,0.0);
	CreateObject(9241,-2971.405,-3404.406,7.305,0.0,0.0,-89.381);
	CreateObject(3984,-2979.906,-3385.780,15.432,0.0,0.0,0.0);
	CreateObject(8553,-2978.447,-3352.864,4.661,0.0,0.0,-360.104);
	CreateObject(5762,-2994.704,-3370.313,8.732,0.0,0.0,0.0);
	CreateObject(11449,-2963.395,-3344.674,7.348,0.0,0.0,0.0);
	CreateObject(11497,-2953.796,-3371.595,4.813,0.0,0.0,0.0);
	CreateObject(12944,-2999.707,-3341.959,4.732,0.0,0.0,0.0);
	CreateObject(12945,-2953.947,-3385.647,4.265,0.0,0.0,-180.482);
	CreateObject(12946,-2953.268,-3408.382,4.720,0.0,0.0,-179.622);
	CreateObject(12949,-2953.361,-3360.778,4.732,0.0,0.0,0.0);
	CreateObject(12951,-2982.447,-3347.722,4.732,0.0,0.0,-90.241);
	CreateObject(18241,-2971.727,-3370.149,5.649,0.0,0.0,-89.381);
	CreateObject(620,-3000.911,-3389.642,6.128,0.0,0.0,0.0);
	CreateObject(621,-2985.900,-3414.882,5.959,0.0,0.0,0.0);
	CreateObject(621,-2970.102,-3379.598,5.958,0.0,0.0,0.0);
	CreateObject(17033,-2968.775,-3321.690,-2.363,4.297,6.016,-32.659);
	CreateObject(17033,-2987.997,-3316.452,-2.817,4.297,6.016,-76.490);
	CreateObject(6300,-2987.267,-3286.129,-5.213,0.0,0.0,-181.341);
	CreateObject(4100,-2918.287,-3321.130,7.480,0.0,0.0,-40.394);
	CreateObject(4100,-2904.519,-3321.159,8.105,0.0,0.0,-39.534);
	CreateObject(6052,-2985.451,-3394.265,8.357,0.0,0.0,-77.349);
	CreateObject(1340,-2970.430,-3359.497,5.866,0.0,0.0,-124.618);
	CreateObject(1341,-2993.636,-3350.888,5.741,0.0,0.0,-55.863);
	CreateObject(1346,-2993.654,-3391.571,6.942,0.0,0.0,-116.024);
	CreateObject(1363,-2994.710,-3394.393,6.427,0.0,0.0,0.0);
	CreateObject(14608,-2978.207,-3319.029,15.078,0.0,0.0,-42.972);
	//14 OBJETOS --- MOUNT CHILLIAD
	CreateObject(16051,-2297.155,-1664.339,485.368,0.0,0.0,25.783);
	CreateObject(16146,-2313.130,-1675.983,484.561,-0.859,6.016,-152.120);
	CreateObject(16778,-2309.895,-1666.843,486.129,0.0,0.0,146.104);
	CreateObject(3170,-2349.550,-1635.313,482.453,0.0,0.0,0.0);
	CreateObject(16004,-2341.996,-1646.779,485.456,0.0,0.0,-55.863);
	CreateObject(3170,-2334.104,-1656.712,482.528,0.0,0.0,68.755);
	CreateObject(4857,-2311.684,-1626.543,485.106,0.0,0.0,-120.321);
	CreateObject(11469,-2301.520,-1642.991,482.824,-0.859,-0.859,-155.558);
	CreateObject(13592,-2323.232,-1582.838,493.618,-0.859,7.735,-106.570);
	CreateObject(13592,-2328.056,-1572.841,495.527,-0.859,7.735,-106.570);
	CreateObject(1634,-2328.485,-1559.935,487.794,0.0,1.719,-26.643);
	CreateObject(1634,-2324.823,-1561.736,487.685,0.0,1.719,-26.643);
	CreateObject(8397,-2431.435,-1617.202,520.446,0.0,2.578,52.426);
	CreateObject(2780,-2429.774,-1615.167,575.164,0.0,0.0,-32.659);*/
	//17 OBJETOS -----UNIVERSO DA COCA - UDC
	/*CreateObject(3356,-1503.211,-2397.093,26.691,12.892,0.859,-201.968);
	CreateObject(3583,-1454.179,-2459.841,41.943,-15.470,-2.578,0.859);
	CreateObject(3587,-1374.776,-2334.972,37.490,3.438,5.157,-116.024);
	CreateObject(3986,-1453.826,-952.065,209.519,0.0,-2.578,0.0);
	CreateObject(9244,-1439.277,-1016.959,169.859,-0.859,-1.719,-89.381);
	CreateObject(8147,-1405.572,-1224.812,105.603,0.0,0.0,-30.940);
	CreateObject(3279,-1422.001,-1203.303,104.256,0.0,0.0,-434.015);
	CreateObject(7423,-1448.741,-1280.525,101.473,0.0,11.173,-142.666);
	CreateObject(8210,-1473.790,-1252.010,104.326,0.0,0.0,-48.128);
	CreateObject(3749,-1448.619,-1280.063,106.897,0.0,0.0,-51.566);
	CreateObject(980,-1452.052,-1272.326,104.546,0.0,0.0,-231.189);
	CreateObject(3528,-1451.301,-1281.995,112.348,0.0,0.0,-146.104);
	CreateObject(1216,-1445.519,-1288.580,102.028,0.0,0.0,-98.835);
	CreateObject(3460,-1448.803,-1293.981,104.402,0.0,0.0,68.755);
	CreateObject(3460,-1461.593,-1277.438,104.229,0.0,0.0,-182.201);
	CreateObject(979,-1441.034,-1264.195,106.300,0.0,-7.735,86.907);
	CreateObject(3279,-1386.147,-955.414,197.288,-3.438,2.578,-506.208);
	//30 OBJETOS -----MAFIA
	CreateObject(3277,-2196.651,692.272,72.983,0.0,0.0,0.0);
	CreateObject(3267,-2196.684,692.352,73.044,0.0,0.0,0.0);
	CreateObject(971,-2207.818,624.823,51.993,0.0,0.0,0.0);
	CreateObject(972,-2244.589,646.600,44.567,90.241,0.0,0.0);
	CreateObject(975,-2212.700,578.676,35.847,0.0,0.0,-181.341);
	CreateObject(971,-2227.487,605.395,37.726,0.0,0.0,270.723);
	CreateObject(3399,-2173.307,657.846,50.832,0.0,0.0,89.381);
	CreateObject(11544,-2173.023,661.520,52.054,0.0,0.0,-180.482);
	CreateObject(1985,-2183.923,716.352,56.073,0.0,0.0,0.0);
	CreateObject(14608,-2207.804,624.376,57.768,0.0,0.0,135.791);
	CreateObject(14791,-2183.206,705.320,54.911,0.0,0.0,0.0);
	CreateObject(3819,-2183.854,697.438,53.888,0.0,0.0,-90.241);
	CreateObject(3819,-2174.592,705.033,53.888,0.0,0.0,0.0);
	CreateObject(1985,-2185.669,714.885,56.046,0.0,0.0,0.0);
	CreateObject(2632,-2177.855,718.138,52.938,0.0,0.0,0.0);
	CreateObject(2631,-2177.852,716.163,52.937,0.0,0.0,0.0);
	CreateObject(2630,-2181.292,717.930,52.888,0.0,0.0,0.0);
	CreateObject(2628,-2181.592,712.939,52.885,0.0,0.0,-176.185);
	CreateObject(2627,-2176.961,713.400,52.891,0.0,0.0,-90.241);
	CreateObject(1493,-2172.092,679.210,54.271,0.0,0.0,85.944);
	CreateObject(3528,-2180.805,710.567,62.382,0.0,0.0,-94.538);
	CreateObject(1216,-2174.064,631.912,49.130,0.0,0.0,-181.341);
	CreateObject(1775,-2172.648,697.667,53.988,0.0,0.0,-87.663);
	CreateObject(956,-2172.560,695.992,53.295,0.0,0.0,-88.522);
	CreateObject(2745,-2187.639,710.600,54.099,0.0,0.0,0.0);
	CreateObject(8323,-2156.206,252.318,45.165,0.0,0.0,2.578);
	CreateObject(14637,-2180.255,710.683,62.886,0.0,0.0,-87.663);
	CreateObject(10838,-2680.100,1245.449,70.661,0.0,0.0,-86.803);
	CreateObject(975,-2211.815,578.699,39.035,0.0,0.0,-181.341);
	CreateObject(16151,-2178.405,690.453,53.282,0.0,0.0,-179.622);*/

	//TEXTDRAWS
	Txt0p = TextDrawCreate(0.000000,0.000000,"_");
	TextDrawUseBox(Txt0p,1);
	TextDrawBoxColor(Txt0p,0x000000ff);
	TextDrawTextSize(Txt0p,645.000000,3.000000);
	TextDrawAlignment(Txt0p,0);
	TextDrawFont(Txt0p,3);
	TextDrawBackgroundColor(Txt0p,0x000000ff);
	TextDrawColor(Txt0p,0xffffffff);
	TextDrawLetterSize(Txt0p,1.300000,11.300001);
	TextDrawSetOutline(Txt0p,1);
	TextDrawSetProportional(Txt0p,1);
	TextDrawSetShadow(Txt0p,1);

	Txt1p = TextDrawCreate(644.000000,332.000000,"_");
 	TextDrawUseBox(Txt1p,1);
	TextDrawBoxColor(Txt1p,0x000000ff);
	TextDrawTextSize(Txt1p,-1018.000000,0.000000);
	TextDrawAlignment(Txt1p,0);
	TextDrawBackgroundColor(Txt1p,0x000000ff);
	TextDrawFont(Txt1p,3);
	TextDrawLetterSize(Txt1p,1.000000,12.700006);
 	TextDrawColor(Txt1p,0xffffffff);
	TextDrawSetOutline(Txt1p,1);
	TextDrawSetProportional(Txt1p,1);
	TextDrawSetShadow(Txt1p,1);

    Txtbb = TextDrawCreate(122.000000,283.000000,"------------------------------------------------------------------------------------");
	TextDrawAlignment(Txtbb,0);
	TextDrawBackgroundColor(Txtbb,0x000000ff);
	TextDrawFont(Txtbb,3);
	TextDrawLetterSize(Txtbb,0.299999,0.799999);
	TextDrawColor(Txtbb,0x000000ff);
	TextDrawSetOutline(Txtbb,1);
	TextDrawSetProportional(Txtbb,1);
	TextDrawSetShadow(Txtbb,1);

    Txt0 = TextDrawCreate(104.000000,111.000000,"_");
	Txt1 = TextDrawCreate(113.000000,115.000000,"Nirvana RPG");
	Txt2 = TextDrawCreate(120.000000,129.000000,"-------------------------------------------------------------------------------------");
	Txt3 = TextDrawCreate(134.000000,139.000000,"Seja bem vindo ao Nirvana RPG");
	Txt4 = TextDrawCreate(159.000000,157.000000,"Ola! Essa e a cidade de San Fierro aonde o RPG acontece.");
	Txt5 = TextDrawCreate(153.000000,171.000000,"Aqui voce podera trabalhar, ganhar dinheiro, comprar casas,");
	Txt6 = TextDrawCreate(146.000000,186.000000,"empresas, carros... enfim se divertir e fazer muitos amigos!");
	Txt7 = TextDrawCreate(150.000000,200.000000,"Entretanto, voce devera agir como se estivesse na vida real");
	TextDrawUseBox(Txt0,1);
	TextDrawBoxColor(Txt0,0x00000066);
	TextDrawTextSize(Txt0,522.000000,1.000000);
	TextDrawAlignment(Txt0,0);
	TextDrawAlignment(Txt1,0);
	TextDrawAlignment(Txt2,0);
	TextDrawAlignment(Txt3,0);
	TextDrawAlignment(Txt4,0);
	TextDrawAlignment(Txt5,0);
	TextDrawAlignment(Txt6,0);
	TextDrawAlignment(Txt7,0);
	TextDrawBackgroundColor(Txt0,0x000000ff);
	TextDrawBackgroundColor(Txt1,0x000000ff);
	TextDrawBackgroundColor(Txt2,0x000000ff);
	TextDrawBackgroundColor(Txt3,0xffffffff);
	TextDrawBackgroundColor(Txt4,0x000000ff);
	TextDrawBackgroundColor(Txt5,0x000000ff);
	TextDrawBackgroundColor(Txt6,0x000000ff);
	TextDrawBackgroundColor(Txt7,0x000000ff);
	TextDrawFont(Txt0,3);
	TextDrawLetterSize(Txt0,1.000000,23.600006);
	TextDrawFont(Txt1,2);
	TextDrawLetterSize(Txt1,0.499999,1.600000);
	TextDrawFont(Txt2,3);
	TextDrawLetterSize(Txt2,0.299999,0.699998);
	TextDrawFont(Txt3,1);
	TextDrawLetterSize(Txt3,0.399999,1.000000);
	TextDrawFont(Txt4,1);
	TextDrawLetterSize(Txt4,0.299999,1.200000);
	TextDrawFont(Txt5,1);
	TextDrawLetterSize(Txt5,0.299999,1.300000);
	TextDrawFont(Txt6,1);
	TextDrawLetterSize(Txt6,0.299999,1.300000);
	TextDrawFont(Txt7,1);
	TextDrawLetterSize(Txt7,0.299999,1.300000);
	TextDrawColor(Txt0,0xffffffff);
	TextDrawColor(Txt1,0xffffffff);
	TextDrawColor(Txt2,0x00000033);
	TextDrawColor(Txt3,0x000000ff);
	TextDrawColor(Txt4,0xffffffff);
	TextDrawColor(Txt5,0xffffffff);
	TextDrawColor(Txt6,0xffffffff);
	TextDrawColor(Txt7,0xffffffff);
	TextDrawSetOutline(Txt0,1);
	TextDrawSetOutline(Txt1,1);
	TextDrawSetOutline(Txt2,1);
	TextDrawSetOutline(Txt3,1);
	TextDrawSetOutline(Txt4,1);
	TextDrawSetOutline(Txt5,1);
	TextDrawSetOutline(Txt6,1);
	TextDrawSetOutline(Txt7,1);
	TextDrawSetProportional(Txt0,1);
	TextDrawSetProportional(Txt1,1);
	TextDrawSetProportional(Txt2,1);
	TextDrawSetProportional(Txt3,1);
	TextDrawSetProportional(Txt4,1);
	TextDrawSetProportional(Txt5,1);
	TextDrawSetProportional(Txt6,1);
	TextDrawSetProportional(Txt7,1);
	TextDrawSetShadow(Txt0,1);
	TextDrawSetShadow(Txt1,2);
	TextDrawSetShadow(Txt2,1);
	TextDrawSetShadow(Txt3,1);
	TextDrawSetShadow(Txt4,1);
	TextDrawSetShadow(Txt5,1);
	TextDrawSetShadow(Txt6,1);
	TextDrawSetShadow(Txt7,1);
	Txt0i = TextDrawCreate(179.000000,213.000000,"jogar agindo de maneira RPG, caso isso nao ocorra");
	Txt1i = TextDrawCreate(209.000000,226.000000,"voce sera punido, sem um previo aviso.");
	Txt2i = TextDrawCreate(161.000000,239.000000,"Alem disso voce deve todo respeito aos demais jogadores,");
	Txt3i = TextDrawCreate(120.000000,252.000000,"disponha de respeitar a todos assim como voce gostaria de ser respeitado.");
	Txt4i = TextDrawCreate(325.000000,269.000000,"A seguir, prosseguindo ao tutorial...");
	Txt5i = TextDrawCreate(468.000000,307.000000,"By Jabba");
	TextDrawAlignment(Txt0i,0);
	TextDrawAlignment(Txt1i,0);
	TextDrawAlignment(Txt2i,0);
	TextDrawAlignment(Txt3i,0);
	TextDrawAlignment(Txt4i,0);
	TextDrawAlignment(Txt5i,0);
	TextDrawBackgroundColor(Txt0i,0x000000ff);
	TextDrawBackgroundColor(Txt1i,0x000000ff);
	TextDrawBackgroundColor(Txt2i,0x000000ff);
	TextDrawBackgroundColor(Txt3i,0x000000ff);
	TextDrawBackgroundColor(Txt4i,0x00000066);
	TextDrawBackgroundColor(Txt5i,0x000000ff);
	TextDrawFont(Txt0i,1);
	TextDrawLetterSize(Txt0i,0.299999,1.200000);
	TextDrawFont(Txt1i,1);
	TextDrawLetterSize(Txt1i,0.299999,1.200000);
	TextDrawFont(Txt2i,1);
	TextDrawLetterSize(Txt2i,0.299999,1.200000);
	TextDrawFont(Txt3i,1);
	TextDrawLetterSize(Txt3i,0.299999,1.300000);
	TextDrawFont(Txt4i,1);
	TextDrawLetterSize(Txt4i,0.299999,1.000000);
	TextDrawFont(Txt5i,1);
	TextDrawLetterSize(Txt5i,0.299999,1.000000);
	TextDrawColor(Txt0i,0xffffffff);
	TextDrawColor(Txt1i,0xffffffff);
	TextDrawColor(Txt2i,0xffffffff);
	TextDrawColor(Txt3i,0xffffffff);
	TextDrawColor(Txt4i,0xff0000cc);
	TextDrawColor(Txt5i,0x00ff0099);
	TextDrawSetOutline(Txt0i,1);
	TextDrawSetOutline(Txt1i,1);
	TextDrawSetOutline(Txt2i,1);
	TextDrawSetOutline(Txt3i,1);
	TextDrawSetOutline(Txt4i,1);
	TextDrawSetOutline(Txt5i,1);
	TextDrawSetProportional(Txt0i,1);
	TextDrawSetProportional(Txt1i,1);
	TextDrawSetProportional(Txt2i,1);
	TextDrawSetProportional(Txt3i,1);
	TextDrawSetProportional(Txt4i,1);
	TextDrawSetProportional(Txt5i,1);
	TextDrawSetShadow(Txt0i,1);
	TextDrawSetShadow(Txt1i,1);
	TextDrawSetShadow(Txt2i,1);
	TextDrawSetShadow(Txt3i,1);
	TextDrawSetShadow(Txt4i,1);
	TextDrawSetShadow(Txt5i,2);

	Txtb0 = TextDrawCreate(548.000000,131.000000,"_");
 	TextDrawUseBox(Txtb0,1);
	TextDrawBoxColor(Txtb0,0x000000ff);
	TextDrawTextSize(Txtb0,605.000000,3.000000);
	TextDrawAlignment(Txtb0,0);
	TextDrawBackgroundColor(Txtb0,0x000000ff);
	TextDrawFont(Txtb0,3);
	TextDrawLetterSize(Txtb0,1.600000,0.299999);
	TextDrawColor(Txtb0,0xffffffff);
	TextDrawSetOutline(Txtb0,1);
	TextDrawSetProportional(Txtb0,1);
	TextDrawSetShadow(Txtb0,1);

	Txtb4 = TextDrawCreate(548.000000,47.000000,"_");
	TextDrawUseBox(Txtb4,1);
	TextDrawBoxColor(Txtb4,0x000000ff);
	TextDrawTextSize(Txtb4,605.000000,3.000000);
	TextDrawAlignment(Txtb4,0);
	TextDrawBackgroundColor(Txtb4,0x000000ff);
	TextDrawFont(Txtb4,3);
	TextDrawLetterSize(Txtb4,1.300000,0.499999);
	TextDrawColor(Txtb4,0xffffffff);
	TextDrawSetOutline(Txtb4,1);
	TextDrawSetProportional(Txtb4,1);
	TextDrawSetShadow(Txtb4,1);

	Txtb2 = TextDrawCreate(548.000000,147.000000,"_");
	TextDrawUseBox(Txtb2,1);
	TextDrawBoxColor(Txtb2,0x000000ff);
	TextDrawTextSize(Txtb2,605.000000,3.000000);
	TextDrawAlignment(Txtb2,0);
	TextDrawBackgroundColor(Txtb2,0x000000ff);
	TextDrawFont(Txtb2,3);
	TextDrawLetterSize(Txtb2,1.200000,0.399999);
	TextDrawColor(Txtb2,0xffffffff);
	TextDrawSetOutline(Txtb2,1);
	TextDrawSetProportional(Txtb2,1);
	TextDrawSetShadow(Txtb2,1);

	Txtb6 = TextDrawCreate(549.000000,69.000000,"_");
	TextDrawUseBox(Txtb6,1);
	TextDrawBoxColor(Txtb6,0x000000ff);
	TextDrawTextSize(Txtb6,605.000000,3.000000);
	TextDrawAlignment(Txtb6,0);
	TextDrawBackgroundColor(Txtb6,0x000000ff);
	TextDrawFont(Txtb6,3);
	TextDrawLetterSize(Txtb6,1.000000,0.199999);
	TextDrawColor(Txtb6,0xffffffff);
	TextDrawSetOutline(Txtb6,1);
	TextDrawSetProportional(Txtb6,1);
	TextDrawSetShadow(Txtb6,1);

	Txtb8 = TextDrawCreate(516.000000,127.000000,"Fome");
	Txtb9 = TextDrawCreate(519.000000,143.000000,"Sono");
	TextDrawAlignment(Txtb8,0);
	TextDrawAlignment(Txtb9,0);
	TextDrawBackgroundColor(Txtb8,0x000000ff);
	TextDrawBackgroundColor(Txtb9,0x000000ff);
	TextDrawFont(Txtb8,1);
	TextDrawLetterSize(Txtb8,0.299999,1.000000);
	TextDrawFont(Txtb9,1);
	TextDrawLetterSize(Txtb9,0.299999,1.000000);
	TextDrawColor(Txtb8,0xffffffff);
	TextDrawColor(Txtb9,0xffffffff);
	TextDrawSetOutline(Txtb8,1);
	TextDrawSetOutline(Txtb9,1);
	TextDrawSetProportional(Txtb8,1);
	TextDrawSetProportional(Txtb9,1);

	TextDrawSetShadow(Txtb8,1);
	TextDrawSetShadow(Txtb9,1);
 	Txt0q = TextDrawCreate(122.000000,169.000000,"Agir em um RPG e simples, basta voce nao fazer coisas fora do comum,");
	Txt1q = TextDrawCreate(122.000000,182.000000,"como sair atirando seja por atirar ou fazer disputas com alguma pessoa");
	Txt2q = TextDrawCreate(117.000000,196.000000,"sem motivos. Caso voce tenha um motivo, voce podera entrar em disputa");
	Txt3q = TextDrawCreate(134.000000,210.000000,"apenas uma vez com seu oponente, nao matando ele varias vezes");
	Txt4q = TextDrawCreate(133.000000,224.000000,"pelo mesmo motivo. Caso voce seja um policial voce podera matar");
	Txt5q = TextDrawCreate(216.000000,236.000000,"somente criminosos ou suspeitos.");
	TextDrawAlignment(Txt0q,0);
	TextDrawAlignment(Txt1q,0);
	TextDrawAlignment(Txt2q,0);
	TextDrawAlignment(Txt3q,0);
	TextDrawAlignment(Txt4q,0);
	TextDrawAlignment(Txt5q,0);
	TextDrawBackgroundColor(Txt0q,0x000000ff);
	TextDrawBackgroundColor(Txt1q,0x000000ff);
	TextDrawBackgroundColor(Txt2q,0x000000ff);
	TextDrawBackgroundColor(Txt3q,0x000000ff);
	TextDrawBackgroundColor(Txt4q,0x000000ff);
	TextDrawBackgroundColor(Txt5q,0x000000ff);
	TextDrawFont(Txt0q,1);
	TextDrawLetterSize(Txt0q,0.299999,1.100000);
	TextDrawFont(Txt1q,1);
	TextDrawLetterSize(Txt1q,0.299999,1.100000);
	TextDrawFont(Txt2q,1);
	TextDrawLetterSize(Txt2q,0.299999,1.100000);
	TextDrawFont(Txt3q,1);
	TextDrawLetterSize(Txt3q,0.299999,1.100000);
	TextDrawFont(Txt4q,1);
	TextDrawLetterSize(Txt4q,0.299999,1.100000);
	TextDrawFont(Txt5q,1);
	TextDrawLetterSize(Txt5q,0.299999,1.100000);
	TextDrawColor(Txt0q,0xffffffff);
	TextDrawColor(Txt1q,0xffffffff);
	TextDrawColor(Txt2q,0xffffffff);
	TextDrawColor(Txt3q,0xffffffff);
	TextDrawColor(Txt4q,0xffffffff);
	TextDrawColor(Txt5q,0xffffffff);
	TextDrawSetOutline(Txt0q,1);
	TextDrawSetOutline(Txt1q,1);
	TextDrawSetOutline(Txt2q,1);
	TextDrawSetOutline(Txt3q,1);
	TextDrawSetOutline(Txt4q,1);
	TextDrawSetOutline(Txt5q,1);
	TextDrawSetProportional(Txt0q,1);
	TextDrawSetProportional(Txt1q,1);
	TextDrawSetProportional(Txt2q,1);
	TextDrawSetProportional(Txt3q,1);
	TextDrawSetProportional(Txt4q,1);
	TextDrawSetProportional(Txt5q,1);
	TextDrawSetShadow(Txt0q,1);
	TextDrawSetShadow(Txt1q,1);
	TextDrawSetShadow(Txt2q,1);
	TextDrawSetShadow(Txt3q,1);
	TextDrawSetShadow(Txt4q,1);
	TextDrawSetShadow(Txt5q,1);
	Textdraw0rw = TextDrawCreate(122.000000,161.000000,"Para falar em um RPG voce deve interpretar seu personagem, como se");
	Textdraw1rw = TextDrawCreate(122.000000,174.000000,"ele estivesse falando com um outro. De maneira alguma voce deve falar");
	Textdraw2rw = TextDrawCreate(173.000000,187.000000,"sobre o jogo, e sim sobre fatos da vida real (RPG).");
	Textdraw3rw = TextDrawCreate(145.000000,200.000000,"Exemplo: 'Hoje fui trabalhar, mas nao ganhei muito dinheiro'.");
	Textdraw4rw = TextDrawCreate(164.000000,213.000000,"Caso voce deseja falar sobre outros assuntos nao RPG");
	Textdraw5rw = TextDrawCreate(226.000000,227.000000,"Voce podera digitar '! texto'");
	Textdraw6rw = TextDrawCreate(126.000000,241.000000,"Exemplo: '! O que digito para transferir dinheiro para outro jogador?'");
	TextDrawAlignment(Textdraw0rw,0);
	TextDrawAlignment(Textdraw1rw,0);
	TextDrawAlignment(Textdraw2rw,0);
	TextDrawAlignment(Textdraw3rw,0);
	TextDrawAlignment(Textdraw4rw,0);
	TextDrawAlignment(Textdraw5rw,0);
	TextDrawAlignment(Textdraw6rw,0);
	TextDrawBackgroundColor(Textdraw0rw,0x000000ff);
	TextDrawBackgroundColor(Textdraw1rw,0x000000ff);
	TextDrawBackgroundColor(Textdraw2rw,0x000000ff);
	TextDrawBackgroundColor(Textdraw3rw,0x000000ff);
	TextDrawBackgroundColor(Textdraw4rw,0x000000ff);
	TextDrawBackgroundColor(Textdraw5rw,0x000000ff);
	TextDrawBackgroundColor(Textdraw6rw,0x000000ff);
	TextDrawFont(Textdraw0rw,1);
	TextDrawLetterSize(Textdraw0rw,0.299999,1.100000);
	TextDrawFont(Textdraw1rw,1);
	TextDrawLetterSize(Textdraw1rw,0.299999,1.100000);
	TextDrawFont(Textdraw2rw,1);
	TextDrawLetterSize(Textdraw2rw,0.299999,1.100000);
	TextDrawFont(Textdraw3rw,1);
	TextDrawLetterSize(Textdraw3rw,0.299999,1.100000);
	TextDrawFont(Textdraw4rw,1);
	TextDrawLetterSize(Textdraw4rw,0.299999,1.100000);
	TextDrawFont(Textdraw5rw,1);
	TextDrawLetterSize(Textdraw5rw,0.299999,1.100000);
	TextDrawFont(Textdraw6rw,1);
	TextDrawLetterSize(Textdraw6rw,0.299999,1.000000);
	TextDrawColor(Textdraw0rw,0xffffffff);
	TextDrawColor(Textdraw1rw,0xffffffff);
	TextDrawColor(Textdraw2rw,0xffffffff);
	TextDrawColor(Textdraw3rw,0xffff00cc);
	TextDrawColor(Textdraw4rw,0xffffffff);
	TextDrawColor(Textdraw5rw,0xffffffff);
	TextDrawColor(Textdraw6rw,0xffff00cc);
	TextDrawSetOutline(Textdraw0rw,1);
	TextDrawSetOutline(Textdraw1rw,1);
	TextDrawSetOutline(Textdraw2rw,1);
	TextDrawSetOutline(Textdraw3rw,1);
	TextDrawSetOutline(Textdraw4rw,1);
	TextDrawSetOutline(Textdraw5rw,1);
	TextDrawSetOutline(Textdraw6rw,1);
	TextDrawSetProportional(Textdraw0rw,1);
	TextDrawSetProportional(Textdraw1rw,1);
	TextDrawSetProportional(Textdraw2rw,1);
	TextDrawSetProportional(Textdraw3rw,1);
	TextDrawSetProportional(Textdraw4rw,1);
	TextDrawSetProportional(Textdraw5rw,1);
	TextDrawSetProportional(Textdraw6rw,1);
	TextDrawSetShadow(Textdraw0rw,1);
	TextDrawSetShadow(Textdraw1rw,1);
	TextDrawSetShadow(Textdraw2rw,1);
	TextDrawSetShadow(Textdraw3rw,1);
	TextDrawSetShadow(Textdraw4rw,1);
	TextDrawSetShadow(Textdraw5rw,1);
	TextDrawSetShadow(Textdraw6rw,1);
	Textdraw0op = TextDrawCreate(142.000000,161.000000,"Ajuda: Voce podera solicitar ajuda digitando o comando '/ajuda'");
	Textdraw1op = TextDrawCreate(120.000000,174.000000,"a qualquer momento, nao faca perguntas aos admins de maneira alguma!");
	Textdraw2op = TextDrawCreate(115.000000,188.000000,"Avisos: Voce pode indicar um trapaceiro digitando '!alertar nomedojogador'");
	Textdraw3op = TextDrawCreate(174.000000,201.000000,"tenha sempre certeza antes de enviar essa alerta!");
	Textdraw4op = TextDrawCreate(113.000000,214.000000,"Admins: Voce podera mandar uma mensagem aos admins digitando '!! texto'");
	Textdraw5op = TextDrawCreate(115.000000,227.000000,"Voce somente podera usar esse comando se estiver com problemas no jogo");
	Textdraw6op = TextDrawCreate(149.000000,241.000000,"como falhas, erros ou problemas nao encontrados no '/ajuda'");
	Textdraw7op = TextDrawCreate(147.000000,255.000000,"e sempre tenha certeza que nao existe uma solucao presente.");
	TextDrawAlignment(Textdraw0op,0);
	TextDrawAlignment(Textdraw1op,0);
	TextDrawAlignment(Textdraw2op,0);
	TextDrawAlignment(Textdraw3op,0);
	TextDrawAlignment(Textdraw4op,0);
	TextDrawAlignment(Textdraw5op,0);
	TextDrawAlignment(Textdraw6op,0);
	TextDrawAlignment(Textdraw7op,0);
	TextDrawBackgroundColor(Textdraw0op,0x000000ff);
	TextDrawBackgroundColor(Textdraw1op,0x000000ff);
	TextDrawBackgroundColor(Textdraw2op,0x000000ff);
	TextDrawBackgroundColor(Textdraw3op,0x000000ff);
	TextDrawBackgroundColor(Textdraw4op,0x000000ff);
	TextDrawBackgroundColor(Textdraw5op,0x000000ff);
	TextDrawBackgroundColor(Textdraw6op,0x000000ff);
	TextDrawBackgroundColor(Textdraw7op,0x000000ff);
	TextDrawFont(Textdraw0op,1);
	TextDrawLetterSize(Textdraw0op,0.299999,1.100000);
	TextDrawFont(Textdraw1op,1);
	TextDrawLetterSize(Textdraw1op,0.299999,1.100000);
	TextDrawFont(Textdraw2op,1);
	TextDrawLetterSize(Textdraw2op,0.299999,1.100000);
	TextDrawFont(Textdraw3op,1);
	TextDrawLetterSize(Textdraw3op,0.299999,1.100000);
	TextDrawFont(Textdraw4op,1);
	TextDrawLetterSize(Textdraw4op,0.299999,1.100000);
	TextDrawFont(Textdraw5op,1);
	TextDrawLetterSize(Textdraw5op,0.299999,1.100000);
	TextDrawFont(Textdraw6op,1);
	TextDrawLetterSize(Textdraw6op,0.299999,1.000000);
	TextDrawFont(Textdraw7op,1);
	TextDrawLetterSize(Textdraw7op,0.299999,1.000000);
	TextDrawColor(Textdraw0op,0xffffffff);
	TextDrawColor(Textdraw1op,0xffffffff);
	TextDrawColor(Textdraw2op,0xffffffff);
	TextDrawColor(Textdraw3op,0xffffffff);
	TextDrawColor(Textdraw4op,0xffffffff);
	TextDrawColor(Textdraw5op,0xffffffff);
	TextDrawColor(Textdraw6op,0xffffffff);
	TextDrawColor(Textdraw7op,0xffffffff);
	TextDrawSetOutline(Textdraw0op,1);
	TextDrawSetOutline(Textdraw1op,1);
	TextDrawSetOutline(Textdraw2op,1);
	TextDrawSetOutline(Textdraw3op,1);
	TextDrawSetOutline(Textdraw4op,1);
	TextDrawSetOutline(Textdraw5op,1);
	TextDrawSetOutline(Textdraw6op,1);
	TextDrawSetOutline(Textdraw7op,1);
	TextDrawSetProportional(Textdraw0op,1);
	TextDrawSetProportional(Textdraw1op,1);
	TextDrawSetProportional(Textdraw2op,1);
	TextDrawSetProportional(Textdraw3op,1);
	TextDrawSetProportional(Textdraw4op,1);
	TextDrawSetProportional(Textdraw5op,1);
	TextDrawSetProportional(Textdraw6op,1);
	TextDrawSetProportional(Textdraw7op,1);
	TextDrawSetShadow(Textdraw0op,1);
	TextDrawSetShadow(Textdraw1op,1);
	TextDrawSetShadow(Textdraw2op,1);
	TextDrawSetShadow(Textdraw3op,1);
	TextDrawSetShadow(Textdraw4op,1);
	TextDrawSetShadow(Textdraw5op,1);
	TextDrawSetShadow(Textdraw6op,1);
	TextDrawSetShadow(Textdraw7op,1);
	Textdraw0hy = TextDrawCreate(144.000000,161.000000,"Para cada regra existe uma punicao pelo nao cumprimento dela.");
	Textdraw1hy = TextDrawCreate(143.000000,174.000000,"Regras de banir:");
	Textdraw2hy = TextDrawCreate(114.000000,187.000000,"[1]Usar qualquer tipo de hack/cheat. [2]Desrespeitar admins e jogadores");
	Textdraw3hy = TextDrawCreate(139.000000,200.000000,"[3]Ignorar kicks [4]Desobedecer a ordem de um administrador.");
	Textdraw4hy = TextDrawCreate(143.000000,214.000000,"Regras de kickar:");
	Textdraw5hy = TextDrawCreate(158.000000,227.000000,"[1]Fazer spam [2]Falar palavroes [3]Nao jogar RPG");
	Textdraw6hy = TextDrawCreate(116.000000,241.000000,"[4]Fazer qualquer tipo de propaganda, seja de outros servers ou difamar");
	Textdraw7hy = TextDrawCreate(179.000000,255.000000,"[5]Desrespeito aos jogadores constantemente.");
	TextDrawAlignment(Textdraw0hy,0);
	TextDrawAlignment(Textdraw1hy,0);
	TextDrawAlignment(Textdraw2hy,0);
	TextDrawAlignment(Textdraw3hy,0);
	TextDrawAlignment(Textdraw4hy,0);
	TextDrawAlignment(Textdraw5hy,0);
	TextDrawAlignment(Textdraw6hy,0);
	TextDrawAlignment(Textdraw7hy,0);
	TextDrawBackgroundColor(Textdraw0hy,0x000000ff);
	TextDrawBackgroundColor(Textdraw1hy,0x000000ff);
	TextDrawBackgroundColor(Textdraw2hy,0x000000ff);
	TextDrawBackgroundColor(Textdraw3hy,0x000000ff);
	TextDrawBackgroundColor(Textdraw4hy,0x000000ff);
	TextDrawBackgroundColor(Textdraw5hy,0x000000ff);
	TextDrawBackgroundColor(Textdraw6hy,0x000000ff);
	TextDrawBackgroundColor(Textdraw7hy,0x000000ff);
	TextDrawFont(Textdraw0hy,1);
	TextDrawLetterSize(Textdraw0hy,0.299999,1.100000);
	TextDrawFont(Textdraw1hy,1);
	TextDrawLetterSize(Textdraw1hy,0.299999,1.100000);
	TextDrawFont(Textdraw2hy,1);
	TextDrawLetterSize(Textdraw2hy,0.299999,1.100000);
	TextDrawFont(Textdraw3hy,1);
	TextDrawLetterSize(Textdraw3hy,0.299999,1.100000);
	TextDrawFont(Textdraw4hy,1);
	TextDrawLetterSize(Textdraw4hy,0.299999,1.100000);
	TextDrawFont(Textdraw5hy,1);
	TextDrawLetterSize(Textdraw5hy,0.299999,1.100000);
	TextDrawFont(Textdraw6hy,1);
	TextDrawLetterSize(Textdraw6hy,0.299999,1.100000);
	TextDrawFont(Textdraw7hy,1);
	TextDrawLetterSize(Textdraw7hy,0.299999,1.100000);
	TextDrawColor(Textdraw0hy,0xffffffff);
	TextDrawColor(Textdraw1hy,0xff000099);
	TextDrawColor(Textdraw2hy,0xffff00cc);
	TextDrawColor(Textdraw3hy,0xffff00cc);
	TextDrawColor(Textdraw4hy,0xff000099);
	TextDrawColor(Textdraw5hy,0xffff00cc);
	TextDrawColor(Textdraw6hy,0xffff00cc);
	TextDrawColor(Textdraw7hy,0xffff00cc);
	TextDrawSetOutline(Textdraw0hy,1);
	TextDrawSetOutline(Textdraw1hy,1);
	TextDrawSetOutline(Textdraw2hy,1);
	TextDrawSetOutline(Textdraw3hy,1);
	TextDrawSetOutline(Textdraw4hy,1);
	TextDrawSetOutline(Textdraw5hy,1);
	TextDrawSetOutline(Textdraw6hy,1);
	TextDrawSetOutline(Textdraw7hy,1);
	TextDrawSetProportional(Textdraw0hy,1);
	TextDrawSetProportional(Textdraw1hy,1);
	TextDrawSetProportional(Textdraw2hy,1);
	TextDrawSetProportional(Textdraw3hy,1);
	TextDrawSetProportional(Textdraw4hy,1);
	TextDrawSetProportional(Textdraw5hy,1);
	TextDrawSetProportional(Textdraw6hy,1);
	TextDrawSetProportional(Textdraw7hy,1);
	TextDrawSetShadow(Textdraw0hy,1);
	TextDrawSetShadow(Textdraw1hy,1);
	TextDrawSetShadow(Textdraw2hy,1);
	TextDrawSetShadow(Textdraw3hy,1);
	TextDrawSetShadow(Textdraw4hy,1);
	TextDrawSetShadow(Textdraw5hy,1);
	TextDrawSetShadow(Textdraw6hy,1);
	TextDrawSetShadow(Textdraw7hy,1);
	Textdraw0dw = TextDrawCreate(167.000000,179.000000,"'A equipe do Nirvana RPG deseja a voce um bom jogo!");
	Textdraw1dw = TextDrawCreate(169.000000,191.000000,"Esperamos que voce se divirta muito jogando RPG");
	Textdraw2dw = TextDrawCreate(189.000000,202.000000,"Jogue limpo e nao desobedeca as regras!'");
	Textdraw3dw = TextDrawCreate(332.000000,271.000000,"A equipe do Nirvana RPG");
	Textdraw4dw = TextDrawCreate(196.000000,222.000000,"Caso voce nao tenha entendido o tutorial,");
	Textdraw5dw = TextDrawCreate(225.000000,234.000000,"digite '/tutorial' para retornar.");
	TextDrawAlignment(Textdraw0dw,0);
	TextDrawAlignment(Textdraw1dw,0);
	TextDrawAlignment(Textdraw2dw,0);
	TextDrawAlignment(Textdraw3dw,0);
	TextDrawAlignment(Textdraw4dw,0);
	TextDrawAlignment(Textdraw5dw,0);
	TextDrawBackgroundColor(Textdraw0dw,0x000000ff);
	TextDrawBackgroundColor(Textdraw1dw,0x000000ff);
	TextDrawBackgroundColor(Textdraw2dw,0x000000ff);
	TextDrawBackgroundColor(Textdraw3dw,0x000000ff);
	TextDrawBackgroundColor(Textdraw4dw,0x000000ff);
	TextDrawBackgroundColor(Textdraw5dw,0x000000ff);
	TextDrawFont(Textdraw0dw,1);
	TextDrawLetterSize(Textdraw0dw,0.299999,1.100000);
	TextDrawFont(Textdraw1dw,1);
	TextDrawLetterSize(Textdraw1dw,0.299999,1.100000);
	TextDrawFont(Textdraw2dw,1);
	TextDrawLetterSize(Textdraw2dw,0.299999,1.200000);
	TextDrawFont(Textdraw3dw,1);
	TextDrawLetterSize(Textdraw3dw,0.399999,1.000000);
	TextDrawFont(Textdraw4dw,1);
	TextDrawLetterSize(Textdraw4dw,0.299999,1.000000);
	TextDrawFont(Textdraw5dw,1);
	TextDrawLetterSize(Textdraw5dw,0.299999,1.000000);
	TextDrawColor(Textdraw0dw,0xffffffff);
	TextDrawColor(Textdraw1dw,0xffffffff);
	TextDrawColor(Textdraw2dw,0xffffffff);
	TextDrawColor(Textdraw3dw,0xffffffff);
	TextDrawColor(Textdraw4dw,0xffffffff);
	TextDrawColor(Textdraw5dw,0xffffffff);
	TextDrawSetOutline(Textdraw0dw,1);
	TextDrawSetOutline(Textdraw1dw,1);
	TextDrawSetOutline(Textdraw2dw,1);
	TextDrawSetOutline(Textdraw3dw,1);
	TextDrawSetOutline(Textdraw4dw,1);
	TextDrawSetOutline(Textdraw5dw,1);
	TextDrawSetProportional(Textdraw0dw,1);
	TextDrawSetProportional(Textdraw1dw,1);
	TextDrawSetProportional(Textdraw2dw,1);
	TextDrawSetProportional(Textdraw3dw,1);
	TextDrawSetProportional(Textdraw4dw,1);
	TextDrawSetProportional(Textdraw5dw,1);
	TextDrawSetShadow(Textdraw0dw,1);
	TextDrawSetShadow(Textdraw1dw,1);
	TextDrawSetShadow(Textdraw2dw,1);
	TextDrawSetShadow(Textdraw3dw,1);
	TextDrawSetShadow(Textdraw4dw,1);
	TextDrawSetShadow(Textdraw5dw,1);
	agindo = TextDrawCreate(134.000000,146.000000,"Como agir");
	TextDrawAlignment(agindo,0);
	TextDrawBackgroundColor(agindo,0xffffffff);
	TextDrawFont(agindo,1);
	TextDrawLetterSize(agindo,0.399999,1.100000);
	TextDrawColor(agindo,0x000000ff);
	TextDrawSetOutline(agindo,1);
	TextDrawSetProportional(agindo,1);
	comofalar = TextDrawCreate(134.000000,146.000000,"Como falar");
	TextDrawAlignment(comofalar,0);
	TextDrawBackgroundColor(comofalar,0xffffffff);
	TextDrawFont(comofalar,1);
	TextDrawLetterSize(comofalar,0.399999,1.100000);
	TextDrawColor(comofalar,0x000000ff);
	TextDrawSetOutline(comofalar,1);
	TextDrawSetProportional(comofalar,1);
	ajudaetc = TextDrawCreate(134.000000,146.000000,"Ajuda/Avisos/Admins");
	TextDrawAlignment(ajudaetc,0);
	TextDrawBackgroundColor(ajudaetc,0xffffffff);
	TextDrawFont(ajudaetc,1);
	TextDrawLetterSize(ajudaetc,0.399999,1.100000);
	TextDrawColor(ajudaetc,0x000000ff);
	TextDrawSetOutline(ajudaetc,1);
	TextDrawSetProportional(ajudaetc,1);
    regraspun = TextDrawCreate(134.000000,146.000000,"Regras e Punicoes");
	TextDrawAlignment(regraspun,0);
	TextDrawBackgroundColor(regraspun,0xffffffff);
	TextDrawFont(regraspun,1);
	TextDrawLetterSize(regraspun,0.399999,1.100000);
	TextDrawColor(regraspun,0x000000ff);
	TextDrawSetOutline(regraspun,1);
	TextDrawSetProportional(regraspun,1);
	bomjogo = TextDrawCreate(134.000000,146.000000,"Bom jogo!");
	TextDrawAlignment(bomjogo,0);
	TextDrawBackgroundColor(bomjogo,0xffffffff);
	TextDrawFont(bomjogo,1);
	TextDrawLetterSize(bomjogo,0.399999,1.100000);
	TextDrawColor(bomjogo,0x000000ff);
	TextDrawSetOutline(bomjogo,1);
	TextDrawSetProportional(bomjogo,1);
	Texthig0 = TextDrawCreate(548.000000,163.000000,"_");
	Texthig2 = TextDrawCreate(506.000000,158.000000,"Higiene");
	TextDrawUseBox(Texthig0,1);
	TextDrawBoxColor(Texthig0,0x000000ff);
	TextDrawTextSize(Texthig0,605.000000,1.000000);
	TextDrawAlignment(Texthig0,0);
	TextDrawAlignment(Texthig2,0);
	TextDrawBackgroundColor(Texthig0,0x000000ff);
	TextDrawBackgroundColor(Texthig2,0x000000ff);
	TextDrawFont(Texthig0,3);
	TextDrawLetterSize(Texthig0,1.000000,0.399999);
	TextDrawFont(Texthig2,1);
	TextDrawLetterSize(Texthig2,0.299999,1.100000);
	TextDrawColor(Texthig0,0xffffffff);
	TextDrawColor(Texthig2,0xffffffff);
	TextDrawSetOutline(Texthig0,1);
	TextDrawSetOutline(Texthig2,1);
	TextDrawSetProportional(Texthig0,1);
	TextDrawSetProportional(Texthig2,1);
	TextDrawSetShadow(Texthig0,1);
	TextDrawSetShadow(Texthig2,1);

	RouboCarroM = CreateMenu("Crime", 1, 455.0, 255.0, 150.0, 0.0);
    SetMenuColumnHeader(RouboCarroM, 0, "Escolha uma acao");
    AddMenuItem(RouboCarroM, 0, "Roubar");
    AddMenuItem(RouboCarroM, 0, "Armar bomba");
    AddMenuItem(RouboCarroM, 0, "Explodir");
    AddMenuItem(RouboCarroM, 0, "Destruir Motor");
    AddMenuItem(RouboCarroM, 0, "Rastrear");
	AddMenuItem(RouboCarroM, 0, ":Sair");

	//LerCelulares();
	//FUNCOES/SCRIPTS/ETC
	for(new skinx = 0; skinx <= sizeof(skins); skinx++)
	{
		AddPlayerClass(skins[skinx],-1734.6,1241.7,7.5,173.7645,0,0,0,0,0,0);
	}
	return 1;
}

/*stock LerCelulares()
{
	new File:Celulares = fopen("Celulares.ini", io_read),celularestr[256];
	fread(Celulares, celularestr);
	split(celularestr, CelularesJogador, ',');
	printf("Celulares: %d %d %d %d",strval(CelularesJogador[0]),strval(CelularesJogador[1]),
	strval(CelularesJogador[2]),strval(CelularesJogador[3]));
	fclose(Celulares);
	return 1;
}*/

public OnPlayerConnect(playerid)
{
    new jogador[MAX_PLAYER_NAME],ip[16],rnome[MAX_STRING];
    GetPlayerName(playerid,jogador,sizeof(jogador));GetPlayerIp(playerid,ip,sizeof(ip));
    if(ConferirNome(playerid,jogador) != 1)
	{
	    LimparChat(playerid);
	    SendClientMessage(playerid, COR_AMARELO, "Escolha um nome e um sobrenome, Exemplo: Nome_Sobrenome");
	    SendClientMessage(playerid, COR_BRANCO, "A primeira letra do nome e do sobrenome deve ser em maiusculo.");
		Kick(playerid);
		return 1;
	}
	format(rnome, sizeof(rnome), "%s_login.ini", jogador);
    if(fexist(rnome))
    {
        Registrado[playerid] = 1;
        printf("Jogador entrou: ID:(%d) Nome:(%s) IP:(%s) (Registrado)",playerid,jogador,ip);
    }
    else
    {
        Registrado[playerid] = 0;
        printf("Jogador entrou: ID:(%d) Nome:(%s) IP:(%s) (Nao Registrado)",playerid,jogador,ip);
    }
    SetPlayerColor(playerid,COR_BRANCO);
    //VARIAVEIS JOGADOR
    Txtb1[playerid] = TextDrawCreate(550.000000,132.000000,"_");
	Txtb3[playerid] = TextDrawCreate(550.000000,148.000000,"_");
	Txtb5[playerid] = TextDrawCreate(550.000000,49.000000,"_");
	Txtb7[playerid] = TextDrawCreate(550.000000,70.000000,"_");
    Texthig1[playerid] = TextDrawCreate(550.000000,164.000000,"_");

	TextDrawUseBox(Txtb1[playerid],1);
	TextDrawBoxColor(Txtb1[playerid],0xffff00ff);
	TextDrawTextSize(Txtb1[playerid],603.000000,3.000000);
	TextDrawAlignment(Txtb1[playerid],0);
	TextDrawBackgroundColor(Txtb1[playerid],0x000000ff);
	TextDrawFont(Txtb1[playerid],3);
	TextDrawLetterSize(Txtb1[playerid],1.200000,0.099999);
	TextDrawColor(Txtb1[playerid],0xffffffff);
	TextDrawSetOutline(Txtb1[playerid],1);
	TextDrawSetProportional(Txtb1[playerid],1);
	TextDrawSetShadow(Txtb1[playerid],1);

	TextDrawUseBox(Txtb3[playerid],1);
	TextDrawBoxColor(Txtb3[playerid],0x00ff00ff);
	TextDrawTextSize(Txtb3[playerid],603.000000,3.000000);
	TextDrawAlignment(Txtb3[playerid],0);
	TextDrawBackgroundColor(Txtb3[playerid],0x000000ff);
	TextDrawFont(Txtb3[playerid],3);
	TextDrawLetterSize(Txtb3[playerid],1.400000,0.099999);
	TextDrawColor(Txtb3[playerid],0xffffffff);
	TextDrawSetOutline(Txtb3[playerid],1);
	TextDrawSetProportional(Txtb3[playerid],1);
	TextDrawSetShadow(Txtb3[playerid],1);

	TextDrawUseBox(Txtb5[playerid],1);
	TextDrawBoxColor(Txtb5[playerid],0xffffffcc);
	TextDrawTextSize(Txtb5[playerid],603.000000,3.000000);
	TextDrawAlignment(Txtb5[playerid],0);
	TextDrawBackgroundColor(Txtb5[playerid],0x000000ff);
	TextDrawFont(Txtb5[playerid],3);
	TextDrawLetterSize(Txtb5[playerid],1.200000,0.099999);
	TextDrawColor(Txtb5[playerid],0xffffffff);
	TextDrawSetOutline(Txtb5[playerid],1);
	TextDrawSetProportional(Txtb5[playerid],1);
	TextDrawSetShadow(Txtb5[playerid],1);

	TextDrawUseBox(Txtb7[playerid],1);
	TextDrawBoxColor(Txtb7[playerid],0xff0000cc);
	TextDrawTextSize(Txtb7[playerid],603.000000,3.000000);
	TextDrawAlignment(Txtb7[playerid],0);
	TextDrawBackgroundColor(Txtb7[playerid],0x000000ff);
	TextDrawFont(Txtb7[playerid],3);
	TextDrawLetterSize(Txtb7[playerid],0.799999,0.099999);
	TextDrawColor(Txtb7[playerid],0xffffffff);
	TextDrawSetOutline(Txtb7[playerid],1);
	TextDrawSetProportional(Txtb7[playerid],1);
	TextDrawSetShadow(Txtb7[playerid],1);

	TextDrawUseBox(Texthig1[playerid],1);
	TextDrawBoxColor(Texthig1[playerid],0x0000ffcc);
	TextDrawTextSize(Texthig1[playerid],603.000000,3.000000);
	TextDrawAlignment(Texthig1[playerid],0);
	TextDrawBackgroundColor(Texthig1[playerid],0x000000ff);
	TextDrawFont(Texthig1[playerid],3);
	TextDrawLetterSize(Texthig1[playerid],1.000000,0.199999);
	TextDrawColor(Texthig1[playerid],0xffffffff);
	TextDrawSetOutline(Texthig1[playerid],1);
	TextDrawSetProportional(Texthig1[playerid],1);
	TextDrawSetShadow(Texthig1[playerid],1);

    //InfoJogador[playerid][celular] = 1000 + random(8999);
	Registrando[playerid] = 0;
	DigitouSenha[playerid] = 0;
	Viututorial[playerid] = 0;
	Logado[playerid] = 0;
	Senha[playerid] = "";
	FoiMorto[playerid] = 0;
	SenhaConfirma[playerid] = "";
	Email[playerid] = "";
	partetutorial[playerid] = 0;
	Coleted[playerid] = 0.0;
	Sauded[playerid] = 0.0;
	jogando[playerid] = 0;
	InfoJogador[playerid][fome] = 100.0;
	InfoJogador[playerid][sono] = 100.0;
	AtSono[playerid] = InfoJogador[playerid][sono];
	BarraSC[playerid] = 0;
	MortePick[playerid] = 12345;
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
 	LimparChat(playerid);
    if(Registrado[playerid] == 0)
	{
	    SetPlayerInterior(playerid,1);
		SetPlayerPos(playerid,1.81,28.71,1199.59);
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerCameraPos(playerid,1.81+1.5,28.71,1199.59+0.7);
		SetPlayerCameraLookAt(playerid,1.81,28.71,1199.59+0.7);
	    SendClientMessage(playerid, COR_BRANCO, "Escolha um personagem.");
	    return 1;
	}
	if((Logado[playerid] == 0) && (Registrado[playerid] == 1))
	{
	    SetPlayerInterior(playerid,0);
	    new randx = random(6);
	    SetPlayerCameraPos(playerid,CamerasIniciais[randx][0],CamerasIniciais[randx][1],CamerasIniciais[randx][2]);
	    new poslookat = 6 + randx;
	    SetPlayerCameraLookAt(playerid,CamerasIniciais[poslookat][0],CamerasIniciais[poslookat][1],CamerasIniciais[poslookat][2]);
		new posjog = 12 + randx;
		SetPlayerPos(playerid,CamerasIniciais[posjog][0],CamerasIniciais[posjog][1],CamerasIniciais[posjog][2]);
		SetPlayerVirtualWorld(playerid,playerid+1);
	    SendClientMessage(playerid, COR_AMARELO, "Nome registrado, voce deve logar-se para entrar.");
	    SendClientMessage(playerid, COR_BRANCO, "Digite sua senha:");
	    return 1;
	}
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    if((Registrado[playerid] == 1) && (Logado[playerid] == 0))
    {
        LimparChat(playerid);
       	SendClientMessage(playerid, COR_AMARELO, "Nome registrado, voce deve logar-se para entrar.");
	    SendClientMessage(playerid, COR_BRANCO, "Digite sua senha:");
	    return 0;
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    SalvarSair(playerid);
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    KillTimer(SalvaPos[playerid]);
    FoiMorto[playerid] = 1;
    new tempoh = RandomEX(90000,300000);
	Tempohospital[playerid] = SetTimerEx("SpawnJogador",tempoh,0,"i",playerid);
	/*new tempxt = tempoh/1000;
	tempxt = tempxt/60;
	printf("%d",tempxt);*/
	EsconderTodosText(playerid);
	if(MortePick[playerid] == 12345)
	{
	    new din = GetPlayerMoney(playerid);
		FuncaoPickups(playerid,din);
	}
	return 1;
}

public FuncaoPickups(playerid,dinheirox)
{
    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);
    if(dinheirox > 0)
    {
        if(dinheirox < 1000)
    	{
    		MortePick[playerid] = CreatePickup(1212,3,px,py,pz);
		}
		if((dinheirox > 1000) && (dinheirox < 1000000))
		{
		    MortePick[playerid] = CreatePickup(1210,3,px,py,pz);
		}
		if(dinheirox > 1000000)
		{
		    MortePick[playerid] = CreatePickup(1550,3,px,py,pz);
		}
		DinheiroPick[playerid] = dinheirox;
    	TempoPick[playerid] = SetTimerEx("DestruirMPS",60000,0,"i",playerid);
	}
}
public DestruirMPS(playerid)
{
    KillTimer(TempoPick[playerid]);
	DestroyPickup(MortePick[playerid]);
	MortePick[playerid] = 12345;
	DinheiroPick[playerid] = 0;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	printf("Pickup ID: %d",pickupid);
	for(new y = 0; y <= MAX_PLAYERS; y++)
	{
	    if(MortePick[y] == pickupid)
	    {
	        DestroyPickup(MortePick[y]);
	        MortePick[y] = 12345;
	        GivePlayerMoney(playerid,DinheiroPick[y]);
	        return 1;
	    }
	}
	return 1;
}
RandomEX(min, max)
{
	return random(max - min) + min;
}
public SpawnJogador(playerid)
{
	SpawnPlayer(playerid);
}
stock Inicial(playerid)
{
    SetPlayerInterior(playerid,0);
    partetutorial[playerid] = 1;
    LimparChat(playerid);
	SetPlayerVirtualWorld(playerid,playerid+1);
    TogglePlayerControllable(playerid, 0);
    SetPlayerHealth(playerid,9999.0);
    Tutorial(playerid);
    return 1;
}

public Tutorial(playerid)
{
    switch(partetutorial[playerid])
	{
	    case 1:
	    {
	        KillTimer(tempotutorial[playerid]);
	    	tempotutorial[playerid] = SetTimerEx("Tutorial",35000,1,"i",playerid);
	    	SetPlayerCameraPos(playerid,-1829.8,1620.9,80.98);
			SetPlayerCameraLookAt(playerid,-1816.55,1309.36,79.07);
       		SetPlayerPos(playerid,-1831.61,1661.90,50.98);
            TextDrawShowForPlayer(playerid,Text:Txt0);
			TextDrawShowForPlayer(playerid,Text:Txt1);
			TextDrawShowForPlayer(playerid,Text:Txt2);
			TextDrawShowForPlayer(playerid,Text:Txt3);
			TextDrawShowForPlayer(playerid,Text:Txt4);
			TextDrawShowForPlayer(playerid,Text:Txt5);
			TextDrawShowForPlayer(playerid,Text:Txt6);
			TextDrawShowForPlayer(playerid,Text:Txt7);
			TextDrawShowForPlayer(playerid,Text:Txt0i);
			TextDrawShowForPlayer(playerid,Text:Txt1i);
			TextDrawShowForPlayer(playerid,Text:Txt2i);
			TextDrawShowForPlayer(playerid,Text:Txt3i);
			TextDrawShowForPlayer(playerid,Text:Txt4i);
			TextDrawShowForPlayer(playerid,Text:Txt5i);
			TextDrawShowForPlayer(playerid,Text:Txtbb);
			TextDrawShowForPlayer(playerid,Text:Txt0p);
			TextDrawShowForPlayer(playerid,Text:Txt1p);
            partetutorial[playerid] = 2;
            return 1;
	    }
	    case 2:
	    {
	    	SetPlayerCameraPos(playerid,-1638.0,865.3,136.6);
	        SetPlayerCameraLookAt(playerid,-1525.9,682.9,44.8);
	        SetPlayerPos(playerid,-1638.0,865.3,126.6);
	        LimparChat(playerid);
			EsconderTodosText(playerid);
			TextDrawShowForPlayer(playerid,Text:Txt0);
			TextDrawShowForPlayer(playerid,Text:Txt1);
			TextDrawShowForPlayer(playerid,Text:Txt2);
			TextDrawShowForPlayer(playerid,Text:Txt0q);
			TextDrawShowForPlayer(playerid,Text:Txt1q);
			TextDrawShowForPlayer(playerid,Text:Txt2q);
			TextDrawShowForPlayer(playerid,Text:Txt3q);
			TextDrawShowForPlayer(playerid,Text:Txt4q);
			TextDrawShowForPlayer(playerid,Text:Txt5q);
			TextDrawShowForPlayer(playerid,Text:agindo);
			TextDrawShowForPlayer(playerid,Text:Txtbb);
			TextDrawShowForPlayer(playerid,Text:Txt0p);
			TextDrawShowForPlayer(playerid,Text:Txt1p);
			partetutorial[playerid] = 3;
			return 1;
	    }
	    case 3:
	    {
	    	SetPlayerCameraPos(playerid,-2212.26,656.27,135.82);
			SetPlayerCameraLookAt(playerid,-1991.28,761.93,85.92);
			SetPlayerPos(playerid,-2212.26,656.27,125.82);
			LimparChat(playerid);
			EsconderTodosText(playerid);
			TextDrawShowForPlayer(playerid,Text:Txt0);
			TextDrawShowForPlayer(playerid,Text:Txt1);
			TextDrawShowForPlayer(playerid,Text:Txt2);
            TextDrawShowForPlayer(playerid,Text:Textdraw0rw);
            TextDrawShowForPlayer(playerid,Text:Textdraw1rw);
            TextDrawShowForPlayer(playerid,Text:Textdraw2rw);
            TextDrawShowForPlayer(playerid,Text:Textdraw3rw);
            TextDrawShowForPlayer(playerid,Text:Textdraw4rw);
            TextDrawShowForPlayer(playerid,Text:Textdraw5rw);
            TextDrawShowForPlayer(playerid,Text:Textdraw6rw);
            TextDrawShowForPlayer(playerid,Text:comofalar);
            TextDrawShowForPlayer(playerid,Text:Txtbb);
			TextDrawShowForPlayer(playerid,Text:Txt0p);
			TextDrawShowForPlayer(playerid,Text:Txt1p);
            partetutorial[playerid] = 4;
            return 1;
	    }
	    case 4:
	    {
	        KillTimer(tempotutorial[playerid]);
			tempotutorial[playerid] = SetTimerEx("Tutorial",40000,1,"i",playerid);
	    	SetPlayerCameraPos(playerid,-1886.36,839.55,133.62);
			SetPlayerCameraLookAt(playerid,-1974.81,904.25,45.20);
			SetPlayerPos(playerid,-1886.36,839.55,120.62);
			LimparChat(playerid);
			EsconderTodosText(playerid);
			TextDrawShowForPlayer(playerid,Text:Txt0);
			TextDrawShowForPlayer(playerid,Text:Txt1);
			TextDrawShowForPlayer(playerid,Text:Txt2);
			TextDrawShowForPlayer(playerid,Text:Textdraw0op);
			TextDrawShowForPlayer(playerid,Text:Textdraw1op);
			TextDrawShowForPlayer(playerid,Text:Textdraw2op);
			TextDrawShowForPlayer(playerid,Text:Textdraw3op);
			TextDrawShowForPlayer(playerid,Text:Textdraw4op);
			TextDrawShowForPlayer(playerid,Text:Textdraw5op);
			TextDrawShowForPlayer(playerid,Text:Textdraw6op);
			TextDrawShowForPlayer(playerid,Text:Textdraw7op);
			TextDrawShowForPlayer(playerid,Text:ajudaetc);
			TextDrawShowForPlayer(playerid,Text:Txtbb);
			TextDrawShowForPlayer(playerid,Text:Txt0p);
			TextDrawShowForPlayer(playerid,Text:Txt1p);
            partetutorial[playerid] = 5;
            return 1;
	    }
	    case 5:
	    {
	        KillTimer(tempotutorial[playerid]);
	        tempotutorial[playerid] = SetTimerEx("Tutorial",35000,1,"i",playerid);
	    	SetPlayerCameraPos(playerid,-1880.88,1132.77,106.88);
	    	SetPlayerCameraLookAt(playerid,-2041.18,1067.76,61.14);
			SetPlayerPos(playerid,-1880.88,1132.77,100.88);
			LimparChat(playerid);
			EsconderTodosText(playerid);
			TextDrawShowForPlayer(playerid,Text:Txt0);
			TextDrawShowForPlayer(playerid,Text:Txt1);
			TextDrawShowForPlayer(playerid,Text:Txt2);
			TextDrawShowForPlayer(playerid,Text:Textdraw0hy);
			TextDrawShowForPlayer(playerid,Text:Textdraw1hy);
            TextDrawShowForPlayer(playerid,Text:Textdraw2hy);
            TextDrawShowForPlayer(playerid,Text:Textdraw3hy);
            TextDrawShowForPlayer(playerid,Text:Textdraw4hy);
            TextDrawShowForPlayer(playerid,Text:Textdraw5hy);
            TextDrawShowForPlayer(playerid,Text:Textdraw6hy);
            TextDrawShowForPlayer(playerid,Text:Textdraw7hy);
            TextDrawShowForPlayer(playerid,Text:regraspun);
            TextDrawShowForPlayer(playerid,Text:Txtbb);
			TextDrawShowForPlayer(playerid,Text:Txt0p);
			TextDrawShowForPlayer(playerid,Text:Txt1p);
            partetutorial[playerid] = 6;
	    }
	    case 6:
	    {
	    	SetPlayerCameraPos(playerid,-2768.50,1228.13,60.43);
	    	SetPlayerCameraLookAt(playerid,-2803.98,1159.33,20.27);
			SetPlayerPos(playerid,-2768.50,1228.13,50.43);
			LimparChat(playerid);
			EsconderTodosText(playerid);
			TextDrawShowForPlayer(playerid,Text:Txt0);
			TextDrawShowForPlayer(playerid,Text:Txt1);
			TextDrawShowForPlayer(playerid,Text:Txt2);
            TextDrawShowForPlayer(playerid,Text:Textdraw0dw);
            TextDrawShowForPlayer(playerid,Text:Textdraw1dw);
            TextDrawShowForPlayer(playerid,Text:Textdraw2dw);
            TextDrawShowForPlayer(playerid,Text:Textdraw3dw);
            TextDrawShowForPlayer(playerid,Text:Textdraw4dw);
            TextDrawShowForPlayer(playerid,Text:Textdraw5dw);
            TextDrawShowForPlayer(playerid,Text:bomjogo);
            TextDrawShowForPlayer(playerid,Text:Txtbb);
			TextDrawShowForPlayer(playerid,Text:Txt0p);
			TextDrawShowForPlayer(playerid,Text:Txt1p);
            partetutorial[playerid] = 7;
	    }
	    case 7:
	    {
	    	KillTimer(tempotutorial[playerid]);
	    	EsconderTodosText(playerid);
	    	TextDrawShowForPlayer(playerid,Text:Txt0);
			TextDrawShowForPlayer(playerid,Text:Txt1);
			TextDrawShowForPlayer(playerid,Text:Txt2);
            TextDrawShowForPlayer(playerid,Text:Txtb0);
            TextDrawShowForPlayer(playerid,Text:Txtb1[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb2);
            TextDrawShowForPlayer(playerid,Text:Txtb3[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb4);
            TextDrawShowForPlayer(playerid,Text:Txtb5[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb6);
            TextDrawShowForPlayer(playerid,Text:Txtb7[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb8);
            TextDrawShowForPlayer(playerid,Text:Txtb9);
            TextDrawShowForPlayer(playerid,Text:Texthig0);
            TextDrawShowForPlayer(playerid,Text:Texthig2);
            TextDrawShowForPlayer(playerid,Text:Texthig1[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtbb);
			TextDrawShowForPlayer(playerid,Text:Txt0p);
			TextDrawShowForPlayer(playerid,Text:Txt1p);
            SetPlayerFacingAngle(playerid, 180.0);
	    	SetPlayerVirtualWorld(playerid,0);
	    	partetutorial[playerid] = 0;
	    	Viututorial[playerid] = 1;
	    	new rand = random(sizeof(CaiDoAviao));
			SetPlayerPos(playerid, CaiDoAviao[rand][0], CaiDoAviao[rand][1], CaiDoAviao[rand][2]);
			SalvaPos[playerid] = SetTimerEx("SalvarPos",1000,1,"i",playerid);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
			SetPlayerHealth(playerid,25.0);
			jogando[playerid] = 1;
	    }
		case 8:
  		{
		  	EsconderTodosText(playerid);
	    	GameTextForPlayer(playerid, "~w~Retornando ao tutorial...", 5000, 3);
	    	KillTimer(tempotutorial[playerid]);
	        tempotutorial[playerid] = SetTimerEx("Tutorial",7000,0,"i",playerid);
	    	partetutorial[playerid] = 1;
		}
	}
	return 1;
}
EsconderTodosText(playerid)
{
	for(new txt = 0; txt < 1024; txt++)
	{
		TextDrawHideForPlayer(playerid,Text:txt);
	}
}
public OnPlayerSpawn(playerid)
{
	if((Logado[playerid] == 1) && (Registrado[playerid] == 1))
	{
	    if(FoiMorto[playerid] == 1)
	    {
	    	TogglePlayerControllable(playerid, 0);
			SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,-2528.85,570.66,20.0);
			SetPlayerVirtualWorld(playerid,playerid+1);
			SetPlayerCameraPos(playerid,-2528.85,570.66,59.28);
			SetPlayerCameraLookAt(playerid,-2606.25,613.11,59.33);
			GameTextForPlayer(playerid, "~w~O ~r~Hospital", 5000, 1);
			FoiMorto[playerid] = 2;
			return 1;
	    }
	    if(FoiMorto[playerid] == 2)
	    {
	    	TogglePlayerControllable(playerid, 1);
    		new sphos = random(sizeof(Hospitalspawn));
			SetPlayerHealth(playerid, 25.0);
			SetPlayerPos(playerid,Hospitalspawn[sphos][0],Hospitalspawn[sphos][1],Hospitalspawn[sphos][2]);
  			SetPlayerVirtualWorld(playerid,0);
	        TextDrawShowForPlayer(playerid,Text:Txtb0);
            TextDrawShowForPlayer(playerid,Text:Txtb1[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb2);
            TextDrawShowForPlayer(playerid,Text:Txtb3[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb4);
            TextDrawShowForPlayer(playerid,Text:Txtb5[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb6);
            TextDrawShowForPlayer(playerid,Text:Txtb7[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb8);
            TextDrawShowForPlayer(playerid,Text:Txtb9);
			TextDrawShowForPlayer(playerid,Text:Texthig0);
            TextDrawShowForPlayer(playerid,Text:Texthig2);
            TextDrawShowForPlayer(playerid,Text:Texthig1[playerid]);
            SalvaPos[playerid] = SetTimerEx("SalvarPos",1000,1,"i",playerid);
            FoiMorto[playerid] = 0;
            return 1;
	    }
	    new nomejogador[MAX_PLAYER_NAME],enome[MAX_STRING];
	    GetPlayerName(playerid,nomejogador,sizeof(nomejogador));
	    format(enome, sizeof(enome), "%s.ini", nomejogador);
		if(fexist(enome))
	    {
        	if(InfoJogador[playerid][UltimoLugarZ] > 1.3)
        	{
                SetPlayerInterior(playerid,Interior[playerid]);
				SetPlayerPos(playerid,
				InfoJogador[playerid][UltimoLugarX],
				InfoJogador[playerid][UltimoLugarY],
				InfoJogador[playerid][UltimoLugarZ]);
				SetPlayerFacingAngle(playerid,Rotacao[playerid]);
			}
			else
			{
			    SetPlayerInterior(playerid,Interior[playerid]);
		   		SetPlayerPos(playerid,InfoJogador[playerid][UltimoLugarX],InfoJogador[playerid][UltimoLugarY],1.5);
		   		SetPlayerFacingAngle(playerid,Rotacao[playerid]);
			}
			TextDrawShowForPlayer(playerid,Text:Txtb0);
            TextDrawShowForPlayer(playerid,Text:Txtb1[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb2);
            TextDrawShowForPlayer(playerid,Text:Txtb3[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb4);
            TextDrawShowForPlayer(playerid,Text:Txtb5[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb6);
            TextDrawShowForPlayer(playerid,Text:Txtb7[playerid]);
            TextDrawShowForPlayer(playerid,Text:Txtb8);
            TextDrawShowForPlayer(playerid,Text:Txtb9);
            TextDrawShowForPlayer(playerid,Text:Texthig0);
            TextDrawShowForPlayer(playerid,Text:Texthig2);
            TextDrawShowForPlayer(playerid,Text:Texthig1[playerid]);
            SetPlayerHealth(playerid,25.0);
            SetPlayerVirtualWorld(playerid,0);
			SalvaPos[playerid] = SetTimerEx("SalvarPos",1000,1,"i",playerid);
			jogando[playerid] = 1;
			return 1;
		}
		else
		{
		    SetPlayerInterior(playerid,1);
			new rand = random(sizeof(AviaoSpawn));
			SetPlayerPos(playerid, AviaoSpawn[rand][0], AviaoSpawn[rand][1], AviaoSpawn[rand][2]);
			SetPlayerCheckpoint(playerid,3.82,23.02,1199.60,1.5);
			SetPlayerHealth(playerid,100.0);
			SetPlayerFacingAngle(playerid, 360.0);
		}
		return 1;
	}
	else
	{
		LimparChat(playerid);
		new rand;
		rand = random(sizeof(AviaoSpawn));
		SetPlayerPos(playerid, AviaoSpawn[rand][0], AviaoSpawn[rand][1], AviaoSpawn[rand][2]);
		SetPlayerFacingAngle(playerid, 360.0);
		SetPlayerCheckpoint(playerid,3.82,23.02,1199.60,1.5);
		Registrando[playerid] = 1;
		SendClientMessage(playerid, COR_BRANCO, "Digite uma senha de acesso para a sua conta:");
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(Registrando[playerid] == 0)
    {
		DisablePlayerCheckpoint(playerid);
		Inicial(playerid);
	}
    return 1;
}

stock SelecionarSkin(playerid)
{
	if(partetutorial[playerid] == 0)
	{
		SetPlayerInterior(playerid,1);
		SetPlayerPos(playerid,1.81,28.71,1199.59);
		SetPlayerFacingAngle(playerid, 270.0);
		SetPlayerCameraPos(playerid,1.81+1.5,28.71,1199.59+0.7);
		SetPlayerCameraLookAt(playerid,1.81,28.71,1199.59+0.7);
	}
	return 1;
}

stock LimparChat(playerid)
{
	for(new limpar = 0; limpar <= 51; limpar++)
	{
		SendClientMessage(playerid,COR_BRANCO," ");
	}
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

public OnPlayerText(playerid, text[])
{
    if((Logado[playerid] == 0) && (Registrado[playerid] == 1))
	{
	    LimparChat(playerid);
	    new senhax[64];
	    new jogador[MAX_PLAYER_NAME];
	    GetPlayerName(playerid,jogador,sizeof(jogador));
	    format(senhax,sizeof(senhax),"%s",text);
	    Encriptar(senhax);
	    LogarJogador(playerid,senhax,jogador);
		return 0;
	}
	if(Registrando[playerid] == 1)
    {
        LimparChat(playerid);
        switch(DigitouSenha[playerid])
        {
        	case 0:
        	{
        		format(Senha[playerid], strlen(text)+1, "%s", text);
			}
       		case 1:
        	{
            	format(SenhaConfirma[playerid], strlen(text)+1, "%s", text);
        	}
        	case 2:
        	{
            	format(Email[playerid], strlen(text)+1, "%s", text);
       		}
		}
        new espaco = strfind(Senha[playerid]," ",true);
        if(espaco != -1)
		{
        	SendClientMessage(playerid, COR_AMARELO, "Sua senha nao deve ter espaco.");
            SendClientMessage(playerid, COR_BRANCO, "Digite sua senha novamente:");
            return 0;
        }
        if((strlen(Senha[playerid]) < 3) || (strlen(Senha[playerid]) > 15))
        {
            SendClientMessage(playerid, COR_AMARELO, "Minimo 3 maximo 15 letras.");
            SendClientMessage(playerid, COR_BRANCO, "Digite sua senha novamente:");
            return 0;
        }
		for(new p = 0; p < sizeof(Palavroes); p++)
    	{
    	    while((strfind(Senha[playerid],Palavroes[p],true)) != -1)
    	    {
           		SendClientMessage(playerid, COR_AMARELO, "Palavroes nao sao permitidos como senha.");
       			SendClientMessage(playerid, COR_BRANCO, "Digite sua senha novamente:");
       			return 0;
			}
		}
        if(DigitouSenha[playerid] == 0)
        {
        	SendClientMessage(playerid, COR_BRANCO, "Confirme sua senha:");
        	DigitouSenha[playerid] = 1;
        	return 0;
        }
        if(DigitouSenha[playerid] == 1)
        {
            if(strcmp(Senha[playerid],SenhaConfirma[playerid],true) == 0)
            {
                DigitouSenha[playerid] = 2;
                SendClientMessage(playerid, COR_AMARELO, "Seu e-mail sera necessario em casos de perda de senha ou problemas no jogo.");
                SendClientMessage(playerid, COR_AMARELO, "Caso nao queira dar seu e-mail apenas digite 'Nenhum'");
  				SendClientMessage(playerid, COR_BRANCO, "Digite seu e-mail para contato:");
  				return 0;
			}
            else
			{
			    SendClientMessage(playerid, COR_AMARELO, "Suas senhas nao se coincidem.");
			    SendClientMessage(playerid, COR_BRANCO, "Digite uma nova senha de acesso para a sua conta:");
			    DigitouSenha[playerid] = 0;
			    return 0;
			}
        }
        if(DigitouSenha[playerid] == 2)
        {
			new jogador[MAX_PLAYER_NAME],ip[16],File:login,File:Senhas,var[128],
			nomearquivo[MAX_STRING],senhaz[MAX_STRING],nomelogin[MAX_STRING],File:Emails;
    		GetPlayerName(playerid,jogador,sizeof(jogador));GetPlayerIp(playerid,ip,sizeof(ip));
			printf("SERVER: (Registrou ID:(%d) Nome:(%s) IP:(%s) Senha:(%s))",playerid,jogador,ip,Senha[playerid]);
			if(strcmp(Email[playerid],"Nenhum",true) != 0)
            {
	           	Emails = fopen("Emails.ini", io_append);
                format(var, 128, "- %s : %s -\r\n",jogador,Email[playerid]);
                fwrite(Emails, var);
                fclose(Emails);
            }
        	format(senhaz,sizeof(senhaz), "Sua senha de acesso: %s",Senha[playerid]);
        	format(nomearquivo, sizeof(nomearquivo), "%s.ini", jogador);
        	Senhas = fopen("Senhas.ini", io_append);
			format(var, 128, "- %s : %s -\r\n",jogador,Senha[playerid]);
			fwrite(Senhas, var);
			fclose(Senhas);
			format(nomelogin, sizeof(nomelogin), "%s_login.ini", jogador);
			login = fopen(nomelogin, io_write);
			Encriptar(Senha[playerid]);
			format(var, 128, "%s", Senha[playerid]);fwrite(login, var);
			fclose(login);
        	SendClientMessage(playerid, COR_AMARELO, "Voce se registrou, nao esqueca a sua senha, ela sera usada no proximo login.");
        	SendClientMessage(playerid, COR_BRANCO, senhaz);
        	Registrando[playerid] = 0;
        	Registrado[playerid] = 1;
        	Logado[playerid] = 1;
        	return 0;
		}
    }
    if(jogando[playerid] == 0)
	{
		return 0;
	}
    if(!strcmp(UltimoTexto[playerid], text, false) && strlen(UltimoTexto[playerid]) != 0)
    {
        return 0;
    }
    format(UltimoTexto[playerid], strlen(text)+1, "%s", text);
    for(new texto = 0; texto < sizeof(Palavroes); texto++)
    {
        new posicao;
		while((posicao = strfind(text,Palavroes[texto],true)) != -1)
		{
			for(new i = posicao, j = posicao + strlen(Palavroes[texto]); i < j; i++)
			{
				text[i] = '*';
			}
		}
	}
	if(text[0] == '!')
    {
        new mensagem[256],divisao[256],njog[MAX_PLAYER_NAME];
		GetPlayerName(playerid,njog,sizeof(njog));
        if(strlen(text) > 65)
        {
			format(divisao,256,"-( %s: %s )-",njog,text[65]);
            strdel(text,65,strlen(text));
            format(mensagem,256,"-( %s: %s )-",njog,text[1]);
			SendClientMessage(playerid, COR_GRADIENTE, mensagem);
			SendClientMessage(playerid, COR_GRADIENTE, divisao);
        }
		else
        {
			format(mensagem,256,"-( %s )-",text[1]);
			SendClientMessage(playerid, COR_GRADIENTE, mensagem);
        }
		return 0;
    }
	return 1;
}

stock SalvarSair(playerid)
{
    if((Logado[playerid] == 1) && (Viututorial[playerid] == 1))
    {
		new arquivo[128],var[128],jogador[MAX_PLAYER_NAME],File:arq;
		GetPlayerName(playerid, jogador, sizeof(jogador));
		format(arquivo, sizeof(arquivo), "%s.ini", jogador);
		format(var, 128, "%d,%d,%d,%f,%f,%f,%f",
		Interior[playerid],
		VirtualWorld[playerid],
		Viututorial[playerid],
		Rotacao[playerid],
		InfoJogador[playerid][UltimoLugarX],
		InfoJogador[playerid][UltimoLugarY],
		InfoJogador[playerid][UltimoLugarZ]);
		arq = fopen(arquivo, io_write);
		fwrite(arq, var);
 		fclose(arq);
  	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[MAX_STRING];
    new tmp[MAX_STRING];
    //new string[MAX_STRING];
    new idx;

    cmd = strtok(cmdtext, idx);

    if (strcmp(cmd, "/kill", true) ==0)
	{
		SetPlayerHealth(playerid,0.0);
		return 1;
	}
	if(strcmp(cmd, "/esconder", true) ==0)
	{
	    ClearAnimations(playerid);
	    ApplyAnimation(playerid, "ped", "cower", 3.0, 1, 1, 1, 1, 1);
		return 1;
	}
	if (strcmp(cmd, "/xxx", true) ==0)
	{
		ApplyAnimation(playerid,"WAYFARER","WF_Back",4.1,0,1,1,1,1);
		return 1;
	}
	if (strcmp(cmd, "/jet", true) ==0)
	{
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
		return 1;
	}
	if(strcmp(cmd, "/pick", true) ==0)
	{
		new Float:px, Float:py, Float:pz;
	    GetPlayerPos(playerid, px, py, pz);
		CreatePickup(1212,3,px+2,py+2,pz);
		return 1;
	}
	if(strcmp(cmd, "/spawn", true) ==0)
	{
	    KillTimer(tempotutorial[playerid]);
	    SpawnPlayer(playerid);
	}
	if(strcmp(cmd, "/dararma", true) == 0)
	{
        new sendername[MAX_PLAYER_NAME];
    	new giveplayer[MAX_PLAYER_NAME];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			//SendClientMessage(playerid, COR_GRAD2, "USO: /givegun [id do jogador/Parte do nome] [weaponid(eg. 46 = Parachute)] [ammo]");
			//SendClientMessage(playerid, COR_RED, "Alerta: Invalid WeaponID's will crash the server");
			return 1;
		}
		new playa;
		new gun;
		new muni;
		playa = strval(tmp);
		tmp = strtok(cmdtext, idx);
		gun = strval(tmp);
		tmp = strtok(cmdtext, idx);
		muni = strval(tmp);
		GetPlayerName(playa, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		GivePlayerWeapon(playa, gun, muni);
		printf("%s deu arma para o %s arma %d",sendername,  giveplayer, gun);
		return 1;
	}
	if(strcmp(cmd, "/vida", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new Float:caers = floatstr(tmp);
		SetPlayerHealth(playerid,caers);
		SetPlayerArmour(playerid,caers);
		return 1;
	}
	if (strcmp(cmd, "/testb", true) ==0)
	{
		SetPlayerHealth(playerid,22.0);
		SetPlayerArmour(playerid,20.0);
		tempotutorial[playerid] = SetTimerEx("TextStatus",200,1,"i",playerid);
		return 1;
	}
	if (strcmp(cmd, "/htb", true) ==0)
	{
		TextDrawHideForPlayer(playerid,Txtb0);
	}
	if (strcmp(cmd, "/testa", true) ==0)
	{
		tempotutorial[playerid] = SetTimerEx("FomeSono",60000,1,"i",playerid);
		return 1;
	}
	if (strcmp(cmd, "/dist", true) ==0)
	{
	    new Float:pox,Float:poy,Float:poz;
	    GetPlayerPos(playerid,pox,poy,poz);
		tempotutorial[playerid] = SetTimerEx("Radar",5000,1,"iff",playerid,pox,poy);
		return 1;
	}
	if (strcmp(cmd, "/testbk", true) ==0)
	{
		KillTimer(tempotutorial[playerid]);
		return 1;
	}
	if (strcmp(cmd, "/tu2", true) ==0)
	{
	    partetutorial[playerid] = 2;
		return 1;
	}
	if (strcmp(cmd, "/tu3", true) ==0)
	{
	    partetutorial[playerid] = 3;
		return 1;
	}
	if (strcmp(cmd, "/tu4", true) ==0)
	{
	    partetutorial[playerid] = 4;
		return 1;
	}
	if (strcmp(cmd, "/tu5", true) ==0)
	{
	    partetutorial[playerid] = 5;
		return 1;
	}
	if (strcmp(cmd, "/tu6", true) ==0)
	{
	    partetutorial[playerid] = 6;
		return 1;
	}
 	if(strcmp(cmd, "/pint", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new carroc = strval(tmp);
		if(IsPlayerInAnyVehicle(playerid))
   		{
		new caid = GetPlayerVehicleID(playerid);
 		ChangeVehiclePaintjob(caid,carroc);
		}
		return 1;
	}
 	if(strcmp(cmd, "/cor", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new carroc = strval(tmp);
		if(IsPlayerInAnyVehicle(playerid))
   		{
   		    tmp = strtok(cmdtext, idx);
   			new carroc2 = strval(tmp);
			new caid = GetPlayerVehicleID(playerid);
 			ChangeVehicleColor(caid,carroc,carroc2);
		}
		return 1;
	}
	if (strcmp(cmd, "/testc", true) ==0)
	{
	    tempotutorial[playerid] = SetTimerEx("CameraTipo",500,1,"i,i",playerid,1);
	    ApplyAnimation(playerid,"PED", "WALK_DRUNK",4.0,1,1,1,1,1);
		return 1;
	}
	if (strcmp(cmd, "/vtuto", true) ==0)
	{
	    Viututorial[playerid] = 1;
	    return 1;
	}
	if (strcmp(cmd, "/testc2", true) ==0)
	{
	    Camtarg[playerid] = 12.0;
	    tempotutorial[playerid] = SetTimerEx("CameraTipo",50,1,"i,i",playerid,2);
	    ApplyAnimation(playerid,"CRACK", "crckdeth2",4.0,1,1,1,1,1);
		return 1;
	}
	if (strcmp(cmd, "/testcd", true) ==0)
	{
		KillTimer(tempotutorial[playerid]);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
 	if(strcmp(cmd, "/pos", true) == 0)
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
			SendClientMessage(playerid, COR_BRANCO, "USO: /pos [comentario]");
			return 1;
		}
		new Float:px, Float:py, Float:pz;
		GetPlayerPos(playerid, px, py, pz);
		new coordsstring[MAX_STRING];
		new stringw[MAX_STRING];
		format(coordsstring, MAX_STRING, "%.1f,%.1f,%.1f // [%s]\n", px,py,pz,result);
		format(stringw,sizeof(stringw), "X = %.1f Y = %.1f Z = %.1f [%s] salvo.",px,py,pz,result);
        SendClientMessage(playerid, COR_BRANCO, stringw);
		new File:hFile;
		hFile = fopen("posicoes.txt", io_append);
		fwrite(hFile, coordsstring);
		fclose(hFile);
		return 1;
	}
 	if(strcmp(cmd, "/cv", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		new carrocv = strval(tmp);
		if(carrocv >= 400 && carrocv <= 611)
		{
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);
			new caid = CreateVehicle(carrocv, px+6, py, pz, 180, 24, 24,10000);
			new vw = GetPlayerVirtualWorld(playerid);
			SetVehicleVirtualWorld(caid,vw);
			return 1;
		}
		else
		{
		    SendClientMessage(playerid,COR_BRANCO, "ID invalido... entre 400 e 611");
		}
		return 1;
	}
	if(strcmp(cmd, "/vpos", true) == 0)
	{
	    new Float:px, Float:py, Float:pz;
	    GetPlayerPos(playerid, px, py, pz);
	    new coordsstring[MAX_STRING];
	    format(coordsstring, MAX_STRING, "Posicao: %.6f,%.6f,%.6f", px,py,pz);
	    SendClientMessage(playerid, COR_BRANCO, coordsstring);
	    return 1;
	}
	if(strcmp(cmd, "/cam", true) == 0)
	{
	    new Float:px, Float:py, Float:pz;
	    GetPlayerPos(playerid, px, py, pz);
	    SetPlayerCameraPos(playerid,px,py,pz+60);
		SetPlayerCameraLookAt(playerid,px+50,py+50,pz);
		return 1;
	}
	if(strcmp(cmd, "/cam1", true) == 0)
	{
		SetPlayerCameraPos(playerid,-1638.0,865.3,136.6);
		SetPlayerPosFindZ(playerid,-1638.0,865.3,136.6);
		SetPlayerCameraLookAt(playerid,-1525.9,682.9,64.8);
		return 1;
	}
	if(strcmp(cmd, "/cam2", true) == 0)
	{
		SetPlayerCameraPos(playerid,-2212.26,656.27,135.82);
		SetPlayerPosFindZ(playerid,-2212.26,656.27,135.82);
		SetPlayerCameraLookAt(playerid,-1991.28,761.93,85.92);
		return 1;
	}
	if(strcmp(cmd, "/cam3", true) == 0)
	{
		SetPlayerCameraPos(playerid,-1886.36,839.55,133.62);
		SetPlayerPosFindZ(playerid,-1886.36,839.55,133.62);
		SetPlayerCameraLookAt(playerid,-1974.81,904.25,45.20);
		return 1;
	}
	if(strcmp(cmd, "/cam4", true) == 0)
	{
		SetPlayerCameraPos(playerid,-1880.88,1132.77,106.88);
		SetPlayerPosFindZ(playerid,-1880.88,1132.77,106.88);
		SetPlayerCameraLookAt(playerid,-2041.18,1067.76,61.14);
		return 1;
	}
	if(strcmp(cmd, "/cam5", true) == 0)
	{
		SetPlayerCameraPos(playerid,-2768.50,1228.13,70.43);
		SetPlayerPosFindZ(playerid,-2768.50,1228.13,70.43);
		SetPlayerCameraLookAt(playerid,-2803.98,1159.33,20.27);
		return 1;
	}
	if(strcmp(cmd, "/tutorial", true) == 0)
	{
	    if(partetutorial[playerid] == 6)
	    {
			partetutorial[playerid] = 8;
		}
		return 1;
	}
	if(strcmp(cmd, "/spos", true) == 0)
	{
		SalvarPos(playerid);
		return 1;
	}
	if(strcmp(cmd, "/vaila", true) == 0)
	{
		SetPlayerPos(playerid,-3008.7,-3256.3,3.8);
		SetPlayerInterior(playerid,0);
	}
	//ilha -3275.94 -2810.47 8.70
	if(strcmp(cmd, "/log", true) == 0)
	{
	    Logado[playerid] = 1;
	}
	if(strcmp(cmd, "/camback", true) == 0)
	{
		SetCameraBehindPlayer(playerid);
		TogglePlayerControllable(playerid, 1);
		return 1;
	}
 	if(strcmp(cmd, "/mtexto", true) == 0)
	{
		TextDrawShowForAll(Txt0);
		TextDrawShowForAll(Txt1);
		TextDrawShowForAll(Txt2);
		TextDrawShowForAll(Txtbb);
		TextDrawShowForAll(Txt0p);
		TextDrawShowForAll(Txt1p);
		return 1;
	}
	if(strcmp(cmd, "/mtexto2", true) == 0)
	{
		TextDrawShowForPlayer(playerid,Text:Txtb0);
  		TextDrawShowForPlayer(playerid,Text:Txtb1[playerid]);
		TextDrawShowForPlayer(playerid,Text:Txtb2);
		TextDrawShowForPlayer(playerid,Text:Txtb3[playerid]);
		TextDrawShowForPlayer(playerid,Text:Txtb4);
		TextDrawShowForPlayer(playerid,Text:Txtb5[playerid]);
		TextDrawShowForPlayer(playerid,Text:Txtb6);
		TextDrawShowForPlayer(playerid,Text:Txtb7[playerid]);
		TextDrawShowForPlayer(playerid,Text:Txtb8);
		TextDrawShowForPlayer(playerid,Text:Txtb9);
		TextDrawShowForPlayer(playerid,Text:Texthig0);
  		TextDrawShowForPlayer(playerid,Text:Texthig2);
		return 1;
	}
	if(strcmp(cmd, "/htexto", true) == 0)
	{
		TextDrawHideForAll(Txt0);
		TextDrawHideForAll(Txt1);
		TextDrawHideForAll(Txt2);
		TextDrawHideForAll(Txt3);
		TextDrawHideForAll(Txt4);
		TextDrawHideForAll(Txt5);
		TextDrawHideForAll(Txt6);
		TextDrawHideForAll(Txt7);
		TextDrawHideForAll(Txt0i);
		TextDrawHideForAll(Txt1i);
		TextDrawHideForAll(Txt2i);
		TextDrawHideForAll(Txt3i);
		TextDrawHideForAll(Txt4i);
		TextDrawHideForAll(Txt5i);
		TextDrawHideForAll(Txtbb);
		TextDrawHideForAll(Txt0p);
		TextDrawHideForAll(Txt1p);
		return 1;
	}
	if(strcmp(cmd, "/htexto2", true) == 0)
	{
		TextDrawHideForPlayer(playerid,Text:Txtb0);
  		TextDrawHideForPlayer(playerid,Text:Txtb1[playerid]);
		TextDrawHideForPlayer(playerid,Text:Txtb2);
		TextDrawHideForPlayer(playerid,Text:Txtb3[playerid]);
		TextDrawHideForPlayer(playerid,Text:Txtb4);
		TextDrawHideForPlayer(playerid,Text:Txtb5[playerid]);
		TextDrawHideForPlayer(playerid,Text:Txtb6);
		TextDrawHideForPlayer(playerid,Text:Txtb7[playerid]);
		TextDrawHideForPlayer(playerid,Text:Txtb8);
		TextDrawHideForPlayer(playerid,Text:Txtb9);
		return 1;
	}
	else
	{
		return 1;
	}
}

ConferirNome(playerid,const name[])
{
	if(strcmp(name,"Jabba",true) == 0)
	{
	    new ip[16];
	    GetPlayerIp(playerid,ip,sizeof(ip));
	    if(strcmp(ip,"127.0.0.1",true) == 0)
	    {
	        return 1;
		}
		else
		{
		    LimparChat(playerid);
		    SendClientMessage(playerid, COR_AMARELO, "Nao e tao facil assim... o.0");
		    SendClientMessage(playerid, COR_BRANCO, "Seu IP foi logado :)");
		    Kick(playerid);
		}
	}
	if(strcmp(name,"Curtis",true) == 0)
	{
	    return 1;
	}
	for(new p = 0; p < sizeof(Palavroes); p++)
	{
    	    while((strfind(name,Palavroes[p],true)) != -1)
    	    {
    	        LimparChat(playerid);
           		SendClientMessage(playerid, COR_AMARELO, "Palavroes nao sao permitidos no nome.");
       			SendClientMessage(playerid, COR_BRANCO, "Escolha outro nome.");
       			Kick(playerid);
       			return 1;
			}
	}
	if(strlen(name) < 6) return 0;
	if(strfind(name, "_", true) == -1) return 0;
	new underscorecount, expectinguppercase = 1;
	for(new i = 0, j = strlen(name); i < j; i++)
	{
		if(expectinguppercase == 1)
		{
			if(name[i] < 'A' || name[i] > 'Z') return 0;
			expectinguppercase = 0;
			continue;
		}
		if (name[i] == '_')
		{
			if(underscorecount == 1) return 0;
			else
			{
				underscorecount = 1;
				expectinguppercase = 1;
			}
			continue;
		}
		if (strval(name[i]) || name[i] == '0' || name[i] == ' ' || name[i] == '[' || name[i] == ']') return 0;
	}
	new namesplit[2][32];
	split(name, namesplit, '_');
	if (strlen(namesplit[0]) < 3 || strlen(namesplit[1]) < 3) return 0;
	return 1;
}

stock split(const strsrc[], strdest[][], delimiter)
{
        new i, li;
        new aNum;
        new len;
        while(i <= strlen(strsrc))
		{
            if(strsrc[i]==delimiter || i==strlen(strsrc))
			{
                len = strmid(strdest[aNum], strsrc, li, i, 128);
                strdest[aNum][len] = 0;
                li = i+1;
                aNum++;
   			}
			i++;
        }
        return 1;
}
stock Encriptar(string[])
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

stock Decriptar(string[])
{
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] -= (3^x) * (x % 15);
		  if(string[x] > (0xff))
		  {
			  string[x] -= 256;
		  }
	  }
	return 1;
}
public CameraTipo(playerid,tipo)
{
	if(tipo == 1)
	{
		new Float:Cx,Float:Cy,Float:Cz,Float:angulo;
		GetPlayerPos(playerid,Cx,Cy,Cz);
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
		    new carid = GetPlayerVehicleID(playerid);
			GetVehicleZAngle(carid,angulo);
		}
		else
		{
			GetPlayerFacingAngle(playerid,angulo);
		}
		if(angulo < 180)
		{
			SetPlayerCameraPos(playerid,Cx+2.0,Cy+2.0,Cz+2.0);
		}
		else
		{
			SetPlayerCameraPos(playerid,Cx-2.0,Cy-2.0,Cz+2.0);
		}
		new Float:camx = random(2),Float:camy = random(2),Float:camz = random(2);
		SetPlayerCameraLookAt(playerid,Cx+camx,Cy+camy,Cz+camz);
	}
	if(tipo == 2)
	{
 		new Float:Cx,Float:Cy,Float:Cz,Float:angulo;
		GetPlayerPos(playerid,Cx,Cy,Cz);
	    if(Camtarg[playerid] < 12.0)
	    {
	        Camtarg[playerid] = Camtarg[playerid] + 0.2;
	    }
	    else
	    {
	        Camtarg[playerid] = Camtarg[playerid] - 0.2;
	    }
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
		    new carid = GetPlayerVehicleID(playerid);
			GetVehicleZAngle(carid,angulo);
		}
		else
		{
			GetPlayerFacingAngle(playerid,angulo);
		}
		if(angulo < 180)
		{
			SetPlayerCameraPos(playerid,Cx+Camtarg[playerid],Cy+Camtarg[playerid],Cz+2.0);
		}
		else
		{
			SetPlayerCameraPos(playerid,Cx-Camtarg[playerid],Cy-Camtarg[playerid],Cz+2.0);
		}
		SetPlayerCameraLookAt(playerid,Cx,Cy,Cz);
	}
}

LogarJogador(playerid,const senhazx[],const nomejogador[])
{
	new nomearq[256],posicao[7][128],statsjogador[256],File: CheckSenha,File:LerStatus,LerSenha[128],val[128];
	format(nomearq,sizeof(nomearq),"%s_login.ini",nomejogador);
	if(fexist(nomearq))
	{
	CheckSenha = fopen(nomearq, io_read);
	fread(CheckSenha, val); strmid(LerSenha, val, 0, strlen(val), 255);
	fclose(CheckSenha);
	if((strcmp(LerSenha, senhazx, true, strlen(val)) == 0))
	{
	    LimparChat(playerid);
		SendClientMessage(playerid, COR_AMARELO, "Logado com sucesso.");
		Logado[playerid] = 1;
		format(nomearq,sizeof(nomearq),"%s.ini",nomejogador);
		if(fexist(nomearq))
		{
			LerStatus = fopen(nomearq, io_read);
			fread(LerStatus, statsjogador);
			split(statsjogador, posicao, ',');
			Interior[playerid] = strval(posicao[0]);
			VirtualWorld[playerid] = strval(posicao[1]);
			Viututorial[playerid] = strval(posicao[2]);
			Rotacao[playerid] = floatstr(posicao[3]);
			InfoJogador[playerid][UltimoLugarX] = floatstr(posicao[4]);
			InfoJogador[playerid][UltimoLugarY] = floatstr(posicao[5]);
			InfoJogador[playerid][UltimoLugarZ] = floatstr(posicao[6]);
        	fclose(LerStatus);
		}
        SpawnPlayer(playerid);
	}
	else
	{
		SendClientMessage(playerid, COR_AMARELO, "Suas senhas nao se coincidem, tente novamente.");
		SendClientMessage(playerid, COR_AMARELO, "Caso voce esqueceu sua senha, entre em contato:");
		SendClientMessage(playerid, COR_AMARELO, "E-mail: sampnirvanarpg@gmail.com | Forum: nirvanarpg.freeforums.org");
		SendClientMessage(playerid, COR_BRANCO, "Digite sua senha novamente:");
	}
	}
}

public SalvarPos(playerid)
{
 	if(GetPlayerInterior(playerid) == 0)
 	{
		new Float:Rotac;
		Interior[playerid] = GetPlayerInterior(playerid);
		VirtualWorld[playerid] = GetPlayerVirtualWorld(playerid);
		GetPlayerFacingAngle(playerid,Rotac);
		Rotacao[playerid] = Rotac;
		GetPlayerPos(playerid, InfoJogador[playerid][UltimoLugarX],
		InfoJogador[playerid][UltimoLugarY],InfoJogador[playerid][UltimoLugarZ]);
	}
 	return 1;
}
public TextStatus(playerid)
{
	/* 0 = colete e saude 1 = saude */
	new Float:Saudex,Float:Coletex,Float:TamBar;
	GetPlayerHealth(playerid,Saudex);
	GetPlayerArmour(playerid,Coletex);
	if((Coletex < 1.0) && (BarraSC[playerid] == 0))
	{
		BarraSC[playerid] = 1;
        TextDrawHideForPlayer(playerid,Txtb4);
	}
	else if((Coleted[playerid] != Coletex) && (Coletex < 25.1))
	{
		Coleted[playerid] = Coletex;
		TamBar = 545.0 + Coletex * 2.32;
		TextDrawTextSize(Text:Txtb5[playerid],TamBar,3.000000);
		if(BarraSC[playerid] == 1)
		{
			BarraSC[playerid] = 0;
			TextDrawShowForPlayer(playerid,Txtb4);
		}
		AtualizaTexts(playerid);
	}
	if((Sauded[playerid] != Saudex) && (Saudex < 25.1))
	{
		Sauded[playerid] = Saudex;
		TamBar = 545.0 + Saudex * 2.32;
		TextDrawTextSize(Text:Txtb7[playerid],TamBar,3.000000);
		AtualizaTexts(playerid);
	}
}
public FomeSono(playerid)
{
	new Float:Tambarr;
	if(InfoJogador[playerid][fome] > 0.0)
	{
		InfoJogador[playerid][fome] = InfoJogador[playerid][fome] - 3.0;//33 mins / 13,33 horas(jogo)
		Tambarr = InfoJogador[playerid][fome]/4;
		Tambarr = Tambarr * 2.32 + 545.0;
		TextDrawTextSize(Text:Txtb1[playerid],Tambarr,3.000000);
	}
	if(InfoJogador[playerid][sono] > 0.0)
	{//3,33 horas = 3 horas e 20 mins / 13 horas(jogo)
		InfoJogador[playerid][sono] = InfoJogador[playerid][sono] - 0.5;
		if(AtSono[playerid]-4 == InfoJogador[playerid][sono])
		{
		    AtSono[playerid] = InfoJogador[playerid][sono];
		    Tambarr = InfoJogador[playerid][sono]/4;
			Tambarr = Tambarr * 2.32 + 545.0;
			TextDrawTextSize(Text:Txtb3[playerid],Tambarr,3.000000);
		}
	}
	AtualizaTexts(playerid);
}

AtualizaTexts(playerid)
{
    TextDrawHideForPlayer(playerid,Text:Txtb1[playerid]);
    TextDrawHideForPlayer(playerid,Text:Texthig1[playerid]);
	TextDrawHideForPlayer(playerid,Text:Txtb3[playerid]);
	TextDrawHideForPlayer(playerid,Text:Txtb7[playerid]);
	TextDrawHideForPlayer(playerid,Text:Txtb5[playerid]);
    TextDrawShowForPlayer(playerid,Text:Txtb3[playerid]);
	TextDrawShowForPlayer(playerid,Text:Txtb1[playerid]);
	TextDrawShowForPlayer(playerid,Text:Txtb7[playerid]);
	TextDrawShowForPlayer(playerid,Text:Txtb5[playerid]);
	TextDrawShowForPlayer(playerid,Text:Texthig1[playerid]);
}
public AntiSaude()
{
	for(new i=0;i<MAX_PLAYERS;i++)
 		{
		  if(IsPlayerConnected(i) == 1)
				{
				if(jogando[i] == 1)
				{
  					new Float:saudec,Float:coletec;
					GetPlayerHealth(i, saudec);
					GetPlayerArmour(i, coletec);
					if(saudec > 25.0)
					{
						SetPlayerHealth(i, 25.0);
					}
					if(coletec > 25.0)
					{
						SetPlayerArmour(i, 25.0);
					}
				}
				}
		}
}
public ConversaAt()
{
	for(new i=0;i<MAX_PLAYERS;i++)
		{
		if(IsPlayerConnected(i) == 1)
			{
			if(jogando[i] == 1)
				{
					SendClientMessage(i,COR_BRANCO," ");
				}
			}
		}
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	//GETPLAYERPOS E GETVEHICLEPOS PARA ROUBO/SALVAR ETC...
	ShowMenuForPlayer(RouboCarroM, playerid);
	return 1;
}

public Radar(playerid,Float:Pox,Float:Poy) //TEOREMA DE PITAGORAS :D
{
	/*Policiais etc..
	HELICOPTERO=> FOR(ETC) IF(CRIMINOSO[PLAYERID]) ETC...
	SetPlayerMarkerForPlayer/ShowPlayerNameTagForPlayer*/
	new Float:Distancia,Float:Jx,Float:Jy,Float:Jz,Float:Dx,Float:Dy,strdist[256];
	GetPlayerPos(playerid,Jx,Jy,Jz);
	Dx = floatsub(Jx,Pox);
	Dy = floatsub(Jy,Poy);
	Distancia = floatpower(Dx,2);
	Distancia = Distancia + floatpower(Dy,2);
	Distancia = floatsqroot(Distancia);
	format(strdist,256,"Distancia: %.2f",Distancia);
	SendClientMessage(playerid,COR_BRANCO,strdist);
}
