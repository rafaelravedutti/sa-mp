#include <a_samp>
#include <xFireworks>

#define FUSE -3
new tm;
public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Filterscript de ano novo RevolutioN!");
	print("--------------------------------------\n");
	tm = SetTimer("Timer",1000,true);
	return 1;
}
new ContagemFogos;
new Float:RF[][] = {
{-656.3039,918.2021,11.9753,293.2457},
{-319.0454,1063.9379,19.7422,278.8813},
{-292.0435,1094.3225,19.5992,10.1667},
{-276.7557,1165.8075,19.5943,357.0693},
{-305.3675,1227.9679,19.7422,33.5834},
{-223.1248,1242.5143,23.2818,276.1032},
{-198.0395,1214.4628,19.7422,220.1414},
{-188.1776,1145.3730,19.5942,179.2614},
{-173.0892,1099.2009,19.5951,230.6117},
{-189.9304,998.2977,19.5667,143.9380},
{-146.0278,952.0915,19.1676,230.4606},
{-109.7281,1037.9553,19.8532,335.6371},
{-101.5857,1097.7333,19.5938,280.4690},
{-39.2494,1034.0713,19.8099,219.7445},
{9.9516,1040.9777,19.8774,284.0411},
{27.4768,1106.5742,19.5938,357.8631},
{47.7063,1160.1182,18.6641,333.6526},
{41.8828,1212.3121,19.0472,46.2840},
{1.7036,1201.0420,19.2109,89.9422},
{-51.6440,1194.8472,19.2109,98.6739},
{-64.4822,1169.1735,19.5864,177.2586},
{172.6187,1226.6484,22.9858,220.6797},
{166.7314,1218.6116,22.1174,220.6797},
{58.1748,1431.1042,12.1338,21.7788},
{0.3368,1687.8514,17.2781,294.7636},
{106.9319,1790.7783,17.4201,329.6685},
{90.6914,1920.8925,17.7307,3.0903},
{180.0883,2056.7793,20.5518,52.6963},
{215.4441,2100.1140,19.5051,257.3901},
{397.7343,2078.8916,17.4195,221.9037},
{396.1669,1908.9519,17.4195,176.1548},
{364.8960,1862.8512,17.4737,133.9585},
{340.3567,1786.6569,17.6324,133.1571},
{313.1126,1817.0114,17.4195,55.8929},
{303.5704,1963.9833,17.4202,4.7212},
{215.3345,2007.2206,17.4202,88.5714},
{205.3023,1969.2996,17.4195,184.8805},
{569.2311,1658.3047,6.7713,268.6458},
{700.9196,1907.4597,5.4065,355.2710},
{739.9766,2081.1157,10.1769,5.8234},
{893.2785,2192.6785,10.5999,303.6776},
{1006.9697,1982.5795,10.4514,180.9768},
{1005.4590,1692.8018,10.5530,179.9658},
{980.9348,1466.3075,10.5767,162.7184}
};

forward Fogos();
public Fogos()
{
	if(ContagemFogos < 3*60*20) {
		ContagemFogos++;
		CriarFogo();
		SetTimer("Fogos",50,false);
	}
	else KillTimer(tm);
}

stock CriarFogo() CreateFirework(RF[random(sizeof RF)][0],RF[random(sizeof RF)][1],RF[random(sizeof RF)][2],60.0,RF[random(sizeof RF)][3] + 90.0,30.0,70,7,100.0);

forward Destd(Text:td);
public Destd(Text:td) TextDrawDestroy(td);

forward Timer();
public Timer()
{
	new hor,minu,seg;
	gettime(hor,minu,seg);
	hor += FUSE;
	if(hor == 23)
	{
	    if(seg == 0)
	    {
			if(minu == 30) {
			    new Text:temp = TextDrawCreate(320,240,"Faltam 30 minutos para o ano novo!");
			    TextDrawFont(temp,3);
				TextDrawSetShadow(temp,2);
				TextDrawSetOutline(temp,2);
				TextDrawLetterSize(temp,1,1.5);
				TextDrawAlignment(temp,2);
				TextDrawShowForAll(temp);
				SetTimerEx("Destd",5000,false,"d",_:temp);
			}
			if(minu == 45) {
			    new Text:temp = TextDrawCreate(320,240,"Faltam 15 minutos para o ano novo!");
			    TextDrawFont(temp,3);
				TextDrawSetShadow(temp,2);
				TextDrawSetOutline(temp,2);
				TextDrawLetterSize(temp,1,1.5);
				TextDrawAlignment(temp,2);
				TextDrawShowForAll(temp);
				SetTimerEx("Destd",5000,false,"d",_:temp);
			}
			if(minu == 50) {
			    new Text:temp = TextDrawCreate(320,240,"Faltam 10 minutos para o ano novo!");
			    TextDrawFont(temp,3);
				TextDrawSetShadow(temp,2);
				TextDrawSetOutline(temp,2);
				TextDrawLetterSize(temp,1,1.5);
				TextDrawAlignment(temp,2);
				TextDrawShowForAll(temp);
				SetTimerEx("Destd",5000,false,"d",_:temp);
			}
			if(minu == 55) {
			    new Text:temp = TextDrawCreate(320,240,"Faltam 5 minutos para o ano novo!");
			    TextDrawFont(temp,3);
				TextDrawSetShadow(temp,2);
				TextDrawSetOutline(temp,2);
				TextDrawLetterSize(temp,1,1.5);
				TextDrawAlignment(temp,2);
				TextDrawShowForAll(temp);
				SetTimerEx("Destd",5000,false,"d",_:temp);
			}
			if(minu == 59) {
			    new Text:temp = TextDrawCreate(320,240,"Falta 1 minuto para o ano novo!");
			    TextDrawFont(temp,3);
				TextDrawSetShadow(temp,2);
				TextDrawSetOutline(temp,2);
				TextDrawLetterSize(temp,1,1.5);
				TextDrawAlignment(temp,2);
				TextDrawShowForAll(temp);
				SetTimerEx("Destd",5000,false,"d",_:temp);
			}
	    }
	    if(minu == 59 && (seg == 54 || seg == 55))
	    {
			ContagemFinal(5);
	    }
	}
}

forward ContagemFinal(n);
public ContagemFinal(n)
{
	if(n == 0)
	{
	    new Text:temp = TextDrawCreate(320,240,"Feliz ano novo!");
	    TextDrawFont(temp,3);
		TextDrawSetShadow(temp,2);
		TextDrawSetOutline(temp,2);
		TextDrawLetterSize(temp,2,2.5);
		TextDrawAlignment(temp,2);
		TextDrawShowForAll(temp);
		SetTimerEx("Destd",5000,false,"d",_:temp);
		Fogos();
	} else {
	    new ft[256];
		format(ft,sizeof ft,"%d...",n);
   	    new Text:temp = TextDrawCreate(320,240,ft);
	    TextDrawFont(temp,3);
		TextDrawSetShadow(temp,2);
		TextDrawSetOutline(temp,2);
		TextDrawLetterSize(temp,2,2.5);
		TextDrawAlignment(temp,2);
		TextDrawShowForAll(temp);
		SetTimerEx("Destd",1000,false,"d",_:temp);
		SetTimerEx("ContagemFinal",1000,false,"d",n-1);
	}
}

public OnPlayerCommandText(playerid,cmdtext[])
{
	if(!strcmp(cmdtext,"/criarfogos",true)) {
		Fogos();
		SendClientMessage(playerid,0xFFFFFFFF,"Fogos criados");
		return 1;
	}
	if(!strcmp(cmdtext,"/pararfogos",true)) {
	    ContagemFogos = 3*60*10;
		SendClientMessage(playerid,0xFFFFFFFF,"Fogos parados");
		return 1;
	}
	return 0;
}

public OnObjectMoved(objectid) xFireworks_OnObjectMoved(objectid);
