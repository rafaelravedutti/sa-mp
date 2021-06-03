//==============================================================================
//   Criado por: Zeruel_Angel
//
//   Si hablas español,  por favor visita  el  foro  en  ESPAÑOL   samp.tilens.com
//   Se Falas  espanhol, por favor visite  o   forum em  ESPANHOL  samp.tilens.com
//
//==============================================================================

#include <a_samp>

#define PRESS          123
#define HOLD           456
#define Braco1         1
#define Braco2         2
#define Perna1         4
#define Perna2         8
#define MAX_ZOMBIES    100

new Ticket[MAX_PLAYERS];

forward HoldingFire();
forward TirarArmasZombie(playerid);
forward DevolverArmasZombie(playerid);
forward CriarZombieAleatorio();
forward ZombieAtacando(playerid);
forward AtacarMaisProximo();

enum weapParts {WeapId,allow,Float:range,Float:wide,
damageMin,damageMax,cutting,instaGib,continua};

new weapL[55][weapParts]= {
//  ID                      allow	range   wide	dMin	dMax	cutting	insGib	continua
	{0,                     true,   1.0,    45.0,    5,		10,    	false,	false,	false},
	{WEAPON_BRASSKNUCKLE,	true,	1.5,	45.0,	5,		15,		false,	false,	false},
	{WEAPON_GOLFCLUB,		true,	2.0,	35.0,	20,		25,		false,	false,	false},
	{WEAPON_NITESTICK,		true,	1.5,	35.0,	10,		15,		false,	false,	false},
	{WEAPON_KNIFE,			true,	1.5,	15.0,	10,		15,		false,	false,	false},
	{WEAPON_BAT,			true,	2.0,	35.0,	10,		15,		false,	false,	false},
	{WEAPON_SHOVEL,			true,	2.0,	35.0,	10,		25,		true,	false,	false},
	{WEAPON_POOLSTICK,		true,	2.0,	35.0,	10,		15,		false,	false,	false},
	{WEAPON_KATANA,			true,	2.0,	45.0,	20,		45,		true,	false,	false},
	{WEAPON_CHAINSAW,		true,	2.5,	35.0,	20,		35,		true,	false,	true},
	{WEAPON_DILDO,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_DILDO2,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_VIBRATOR,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_VIBRATOR2,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_FLOWER,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_CANE,			true,	2.0,	35.0,	10,		15,		false,	false,	false},
	{WEAPON_GRENADE,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_TEARGAS,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_MOLTOV,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_COLT45,			true,	20.0,	7.0,	10,		15,		false,	false,	true},
	{WEAPON_SILENCED,		true,	20.0,	3.0,	10,		15,		false,	false,	false},
	{WEAPON_DEAGLE,			true,	25.0,	3.0,	15,		20,		false,	true,	true},
	{WEAPON_SHOTGUN,		true,	18.0,	7.0,	10,		25,		true,	true,	true},
	{WEAPON_SAWEDOFF,		true,	12.0,	10.0,	12,		18,		true,	true,	true},
	{WEAPON_SHOTGSPA,		true,	18.0,	7.0,	25,		45,		true,	true,	true},
	{WEAPON_UZI,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_MP5,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_AK47,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_M4,				false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_TEC9,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_RIFLE,			true,	50.0,	2.0,	0,		50,		false,	true,	true},
	{WEAPON_SNIPER,			true,	100.0,	1.0,	0,		60,		false,	true,	false},
	{WEAPON_ROCKETLAUNCHER,	false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_HEATSEEKER,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_FLAMETHROWER,	true,	8.0,	15.0,	10,		20,		false,	false,	true},
	{WEAPON_MINIGUN,		true,	25.0,	3.0,	1,		99,		true,	true,	true},
	{WEAPON_SATCHEL,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_BOMB,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_SPRAYCAN,		true,	2.0,	25.0,	10,		0,		false,	false,	true},
	{WEAPON_FIREEXTINGUISHER,true,	3.5,	15.0,	10,		0,		false,	false,	true},
	{WEAPON_CAMERA,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_PARACHUTE,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_VEHICLE,		false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{-1,					false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_DROWN,			false,	0.0,	0.0,	0,		0,		false,	false,	false},
	{WEAPON_COLLISION,		false,	0.0,	0.0,	0,		0,		false,	false,	false}
};

new setNumber = 0;

new set[6][3][2]= {

    {{WEAPON_KATANA,1000},		{WEAPON_SHOTGUN,50},			{WEAPON_FIREEXTINGUISHER,500}},
	{{WEAPON_KATANA,1000},		{WEAPON_SILENCED,100},			{WEAPON_SAWEDOFF,25}},
	{{WEAPON_NITESTICK,1000},	{WEAPON_COLT45,100},			{WEAPON_SHOTGUN,25}},
	{{WEAPON_GOLFCLUB,1000},	{WEAPON_FIREEXTINGUISHER,400},	{WEAPON_FLAMETHROWER,50}},
	{{WEAPON_SHOVEL,1000},		{WEAPON_SHOTGSPA,100},			{WEAPON_RIFLE,25}},
	{{WEAPON_KNIFE,1000},		{WEAPON_SHOTGSPA,100},			{WEAPON_SNIPER,25}}
};

new NOFZombies=0;
new TOTALZombies=10;
new Float:ZVelocidade = 2.0;
new ZTimerVelocidade = 500;
new Float:vaiven = 5.0;
new Float:X,Float:Y,Float:Z;

enum zombiParts {
	BracoDireito,
	BracoEsquerdo,
	PernaDireita,
	PernaEsquerda,
	Cabeca,
	torso,
	Pedacos,
	HP,
	Float:AnguloBraco,
	Float:StatusBraco,
	Float:Angulo,
	Float:Velocidade,
	PernasH,
	undead,
	Alvo
};

new zombie[MAX_ZOMBIES][zombiParts];

enum zombiPos {

	partModel,
	Float:RelX,
	Float:RelY,
	Float:RelZ,
	Float:RelrX,
	Float:RelrY,
	Float:RelrZ
}
enum zpart {

    PernaDireitaZ,
	BracoDireitoZ,
	torsoZ,
	BracoEsquerdoZ,
	CabecaZ,
	PernaEsquerdaZ
}
new z1[zpart][zombiPos]= {

	{2905,-0.115479,-0.023924, -1.280131, -90.000000, 90.000000,0.000000},
	{2906, -0.218995, 0.200928, -0.253135, 0.000000, 180.000000, 0.000000},
	{2907, -0.032227, -0.045897, -0.544213, 270.000000, 0.000000, 0.000000},
	{2906, 0.187987, 0.158448, -0.265793, 0.000000, 0.000000, 0.000000},
	{2908, 0.000000, 0.000000, 0.000000, 270.000000, 90.000000, 0.000000},
	{2905, 0.101074, -0.012694, -1.288253, 270.000000, 90.000000, 0.000000}
};

new z2[6][zombiPos]= {

	{2905, 0.005614, -0.110107, -1.280131, -90.000000, 90.000000, 90.000000},
	{2906, -0.148926, -0.180663, -0.253135, 0.000000, 180.000000, 90.000000},
	{2907, 0.047852, -0.039061, -0.544213, 270.000000, 0.000000, 90.000000},
	{2906, -0.152343, 0.171387, -0.265793, 0.000000, 0.000000, 90.000000},
	{2908, 0.000000, 0.000000, 0.000000, 270.000000, 90.000000, 90.000000},
	{2905, 0.000977, 0.090332, -1.288253, 270.000000, 90.000000, 90.000000}
};
enum zArm {

	Float:AZ,
	Float:AA
};
enum tipo {

	der,
	izq
};
new A1[tipo][zArm]= {

    {-0.253135,0.0},
	{-0.265793,0.0}
};
new A2[tipo][zArm]= {

	{-0.359635, -90.0},
	{-0.338874, -90.0}
};

new TimerAtaca= -1;
new TimerAPO= -1;
new PlayerDeath[MAX_PLAYERS];

new ZombieMode = false;

enum WeaponType {

	pWeapId,
	pAmmo
};

new WeaponList[MAX_PLAYERS][12][WeaponType];
new LastWeaponUsed[MAX_PLAYERS];

new money[MAX_PLAYERS];
new scorez=0;
new scorep=0;

#define delay 500

//==============================================================================

public OnFilterScriptInit() {

	print("||==========================================================||");
	print("||              ..:: Zombie Filter Script ::..              ||");
	print("||           ..:: Zombie Mod: The Apocalipse ::..           ||");
	print("||                                                          ||");
	print("||            ..:: Criado por: Zeruel_Angel ::..            ||");
	print("||            ..:: Re-editado por: [VGS]Mac_OC ::..         ||");
	print("||==========================================================||");
	return 1;
}
public OnGameModeInit() {
	return 1;
}

//==============================================================================

public OnFilterScriptExit() {
	ApagarZombies();
	return 1;
}
public OnGameModeExit() {
    ApagarZombies();
	return 1;
}

//==============================================================================

public AtacarMaisProximo() {

    new Float:pX,Float:pY,Float:pZ;
    new Float:distNew,Float:distOld;
    new candidato;
	for (new j=0;j<TOTALZombies;j++) {
	
	    if (zombie[j][undead]) {
	    
		    distOld=9999.9;
		    candidato=-1;
		    GetObjectPos(zombie[j][Cabeca],X,Y,Z);
			for(new i=0;i<MAX_PLAYERS;i++) {

				if(IsPlayerConnected(i)) {
			        GetPlayerPos(i,pX,pY,pZ);
					distNew = floatabs(pX-X) + floatabs(pY-Y);
					if (distNew<distOld) {
					
					distOld = distNew;
					candidato = i;
					}
			    }
			}
			if (distOld>100.0) {
			
				DestroyObject(zombie[j][Cabeca]);
				DestroyObject(zombie[j][PernaDireita]);
				DestroyObject(zombie[j][PernaEsquerda]);
				DestroyObject(zombie[j][BracoDireito]);
				DestroyObject(zombie[j][BracoEsquerdo]);
				DestroyObject(zombie[j][torso]);
				NOFZombies--;
				zombie[j][undead]=false;
			    SetTimer("CriarZombieAleatorio",1000,0);
			}
			zombie[j][Alvo]=candidato;
		}
	}
}
//==============================================================================
ApagarZombies() {

	for (new j=0;j<TOTALZombies;j++) {
	
	    zombie[j][undead]=false;
		if (IsValidObject(zombie[j][torso]))DestroyObject(zombie[j][torso]);
		if (IsValidObject(zombie[j][Cabeca]))	DestroyObject(zombie[j][Cabeca]);
		if (IsValidObject(zombie[j][PernaDireita]))	DestroyObject(zombie[j][PernaDireita]);
		if (IsValidObject(zombie[j][PernaEsquerda]))	DestroyObject(zombie[j][PernaEsquerda]);
		if (IsValidObject(zombie[j][BracoDireito]))	DestroyObject(zombie[j][BracoDireito]);
		if (IsValidObject(zombie[j][BracoEsquerdo]))	DestroyObject(zombie[j][BracoEsquerdo]);
		NOFZombies--;
	}
	if (TimerAPO!=-1){KillTimer(TimerAPO);
	}
	if (TimerAtaca!=-1){KillTimer(TimerAtaca);
	}
}
//==============================================================================
 strtok(const string[], &index) {
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' ')) {
		index++;
}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1))) {
		result[index - offset] = string[index];
		index++;
}
	result[index - offset] = EOS;
	return result;
}
//==============================================================================
CriarZombie(Float:pX,Float:pY,Float:pZ,Float:angle) {

	new Float:PEPE = floatsin((angle*3.14159/180.0));
	new Float:PIPO = floatcos((angle*3.14159/180.0));
	if (NOFZombies<TOTALZombies) {
	
	    new j=0;
		while ((zombie[j][undead])){j++;}
		if (IsValidObject(zombie[j][torso])) {
		
			DestroyObject(zombie[j][Cabeca]);
			DestroyObject(zombie[j][PernaDireita]);
			DestroyObject(zombie[j][PernaEsquerda]);
			DestroyObject(zombie[j][BracoDireito]);
			DestroyObject(zombie[j][BracoEsquerdo]);
			DestroyObject(zombie[j][torso]);
		}
		zombie[j][Cabeca]=CreateObject(z1[CabecaZ][partModel],pX,pY,pZ,z1[CabecaZ][RelrX],z1[CabecaZ][RelrY],angle);
		zombie[j][torso]=CreateObject(z1[torsoZ][partModel],pX+z1[torsoZ][RelX]*PIPO+PEPE*z2[torsoZ][RelX],pY+z1[torsoZ][RelY]*PIPO+PEPE*z2[torsoZ][RelY],pZ+z1[torsoZ][RelZ],z1[torsoZ][RelrX],z1[torsoZ][RelrY],angle);
        zombie[j][BracoEsquerdo]=CreateObject(z1[BracoEsquerdoZ][partModel],pX+z1[BracoEsquerdoZ][RelX]*PIPO+PEPE*z2[BracoEsquerdoZ][RelX],pY+z1[BracoEsquerdoZ][RelY]*PIPO+PEPE*z2[BracoEsquerdoZ][RelY],pZ+z1[BracoEsquerdoZ][RelZ],z1[BracoEsquerdoZ][RelrX],z1[BracoEsquerdoZ][RelrY],angle);
        zombie[j][BracoDireito]=CreateObject(z1[BracoDireitoZ][partModel],pX+z1[BracoDireitoZ][RelX]*PIPO+PEPE*z2[BracoDireitoZ][RelX],pY+z1[BracoDireitoZ][RelY]*PIPO+PEPE*z2[BracoDireitoZ][RelY],pZ+z1[BracoDireitoZ][RelZ],z1[BracoDireitoZ][RelrX],z1[BracoDireitoZ][RelrY],angle);
		zombie[j][PernaDireita]=CreateObject(z1[PernaDireitaZ][partModel],pX+z1[PernaDireitaZ][RelX]*PIPO+PEPE*z2[PernaDireitaZ][RelX],pY+z1[PernaDireitaZ][RelY]*PIPO+PEPE*z2[PernaDireitaZ][RelY],pZ+z1[PernaDireitaZ][RelZ],z1[PernaDireitaZ][RelrX],z1[PernaDireitaZ][RelrY],angle);
        zombie[j][PernaEsquerda]=CreateObject(z1[PernaEsquerdaZ][partModel],pX+z1[PernaEsquerdaZ][RelX]*PIPO+PEPE*z2[PernaEsquerdaZ][RelX],pY+z1[PernaEsquerdaZ][RelY]*PIPO+PEPE*z2[PernaEsquerdaZ][RelY],pZ+z1[PernaEsquerdaZ][RelZ],z1[PernaEsquerdaZ][RelrX],z1[PernaEsquerdaZ][RelrY],angle);

		zombie[j][PernasH]=true;
		zombie[j][Velocidade]=random(100)+50;
		zombie[j][AnguloBraco]=0;
		zombie[j][StatusBraco]=random(5)+5;
		zombie[j][undead]=true;
		zombie[j][HP]=100;
		zombie[j][Pedacos]= Braco1 + Braco2 + Perna1 + Perna2;
		zombie[j][Angulo]=angle;
		NOFZombies++;
	}
	return 1;
}
//==============================================================================
public ZombieAtacando() {

    new Float:pX,Float:pY,Float:pZ,Float:angle,Float:PEPE,Float:PIPO,Float:AA1,Float:AA2,Float:H;
    new vehicleStatus;
	if (NOFZombies<1 && !ZombieMode) {
	
  		if (TimerAPO!=-1){KillTimer(TimerAPO);}
		if (TimerAtaca!=-1){KillTimer(TimerAtaca);
		}
    }
    HoldingFire();
	for(new j=0;j<TOTALZombies;j++) {
	
		if(zombie[j][undead]&&IsPlayerConnected(zombie[j][Alvo]) && GetPlayerInterior(zombie[j][Alvo])==0) {
		    vehicleStatus = IsPlayerInAnyVehicle(zombie[j][Alvo]);
			GetPlayerPos(zombie[j][Alvo],pX,pY,pZ);
			pZ+=0.7;
			GetObjectPos(zombie[j][Cabeca],X,Y,Z);
			angle = 180.0-atan2(X-pX,Y-pY);
			angle+=vaiven;
			vaiven*=-1;
			PEPE = floatsin((angle*3.14159/180.0));
			PIPO = floatcos((angle*3.14159/180.0));
			zombie[j][Angulo]=angle;
			if(floatabs(zombie[j][AnguloBraco])>10.0){zombie[j][StatusBraco]*=-1;
			}
			zombie[j][AnguloBraco]+=zombie[j][StatusBraco];
			zombie[j][PernasH]=!zombie[j][PernasH];
			
			AA1 = floatcos(zombie[j][AnguloBraco]*3.14159/180.0);
			AA2 = floatsin(zombie[j][AnguloBraco]*3.14159/180.0);

			if((pZ-Z)>3.0) {
   			    Z+=1.0;
		    }
		    else if((pZ-Z)<-3.0) {
		        Z-=1.0;
		    }
			DestroyObject(zombie[j][torso]);
			DestroyObject(zombie[j][Cabeca]);
			if(zombie[j][Pedacos] & Braco1) DestroyObject(zombie[j][BracoDireito]);
			if(zombie[j][Pedacos] & Braco2) DestroyObject(zombie[j][BracoEsquerdo]);
			if(zombie[j][Pedacos] & Perna1) DestroyObject(zombie[j][PernaDireita]);
			if(zombie[j][Pedacos] & Perna2) DestroyObject(zombie[j][PernaEsquerda]);

			zombie[j][Cabeca]=CreateObject(z1[CabecaZ][partModel],X,Y,pZ,z1[CabecaZ][RelrX],z1[CabecaZ][RelrY],angle+vaiven);
			zombie[j][torso]=CreateObject(z1[torsoZ][partModel],X+z1[torsoZ][RelX]*PIPO+PEPE*z2[torsoZ][RelX],Y+z1[torsoZ][RelY]*PIPO+PEPE*z2[torsoZ][RelY],pZ+z1[torsoZ][RelZ],z1[torsoZ][RelrX],z1[torsoZ][RelrY],angle);
            if(zombie[j][Pedacos] & Braco1)
			zombie[j][BracoDireito]=CreateObject(z1[BracoDireitoZ][partModel],X+z1[BracoDireitoZ][RelX]*PIPO+PEPE*z2[BracoDireitoZ][RelX],Y+z1[BracoDireitoZ][RelY]*PIPO+PEPE*z2[BracoDireitoZ][RelY],pZ+A1[der][AZ]*AA1+AA2*A2[der][AZ],(-1)*zombie[j][AnguloBraco],z1[BracoDireitoZ][RelrY],angle);
			if(zombie[j][Pedacos] & Braco2)
			zombie[j][BracoEsquerdo]=CreateObject(z1[BracoEsquerdoZ][partModel],X+z1[BracoEsquerdoZ][RelX]*PIPO+PEPE*z2[BracoEsquerdoZ][RelX],Y+z1[BracoEsquerdoZ][RelY]*PIPO+PEPE*z2[BracoEsquerdoZ][RelY],pZ+A1[izq][AZ]*AA1-AA2*A2[izq][AZ],zombie[j][AnguloBraco],z1[BracoEsquerdoZ][RelrY],angle);
			if(zombie[j][Pedacos] & Perna1)
			zombie[j][PernaDireita]=CreateObject(z1[PernaDireitaZ][partModel],X+z1[PernaDireitaZ][RelX]*PIPO+PEPE*z2[PernaDireitaZ][RelX],Y+z1[PernaDireitaZ][RelY]*PIPO+PEPE*z2[PernaDireitaZ][RelY],pZ+z1[PernaDireitaZ][RelZ]+float(zombie[j][PernasH])*0.2,z1[PernaDireitaZ][RelrX],z1[PernaDireitaZ][RelrY],angle);

            if(zombie[j][Pedacos] & Perna2)
			zombie[j][PernaEsquerda]=CreateObject(z1[PernaEsquerdaZ][partModel],X+z1[PernaEsquerdaZ][RelX]*PIPO+PEPE*z2[PernaEsquerdaZ][RelX],Y+z1[PernaEsquerdaZ][RelY]*PIPO+PEPE*z2[PernaEsquerdaZ][RelY],pZ+z1[PernaEsquerdaZ][RelZ]+float(!zombie[j][PernasH])*0.2,z1[PernaEsquerdaZ][RelrX],z1[PernaEsquerdaZ][RelrY],angle);

			if((floatabs(pX-X) + floatabs(pY-Y) + floatabs(pZ-Z) )>(2.0+6.0*vehicleStatus)) {
				MoveObject(zombie[j][Cabeca],pX,pY,pZ,zombie[j][Velocidade]*0.01*ZVelocidade);
				MoveObject(zombie[j][torso],pX+z1[torsoZ][RelX]*PIPO+PEPE*z2[torsoZ][RelX],pY+z1[torsoZ][RelY]*PIPO+PEPE*z2[torsoZ][RelY],pZ+z1[torsoZ][RelZ],zombie[j][Velocidade]*0.01*ZVelocidade);
                if (zombie[j][Pedacos] & Braco1)
				MoveObject(zombie[j][BracoDireito],pX+z1[BracoDireitoZ][RelX]*PIPO+PEPE*z2[BracoDireitoZ][RelX],pY+z1[BracoDireitoZ][RelY]*PIPO+PEPE*z2[BracoDireitoZ][RelY],pZ+A1[der][AZ]*AA1+AA2*A2[der][AZ],zombie[j][Velocidade]*0.01*ZVelocidade);
				if (zombie[j][Pedacos] & Braco2)
				MoveObject(zombie[j][BracoEsquerdo],pX+z1[BracoEsquerdoZ][RelX]*PIPO+PEPE*z2[BracoEsquerdoZ][RelX],pY+z1[BracoEsquerdoZ][RelY]*PIPO+PEPE*z2[BracoEsquerdoZ][RelY],pZ+A1[izq][AZ]*AA1-AA2*A2[izq][AZ],zombie[j][Velocidade]*0.01*ZVelocidade);
				if (zombie[j][Pedacos] & Perna1)
				MoveObject(zombie[j][PernaDireita],pX+z1[PernaDireitaZ][RelX]*PIPO+PEPE*z2[PernaDireitaZ][RelX],pY+z1[PernaDireitaZ][RelY]*PIPO+PEPE*z2[PernaDireitaZ][RelY],pZ+z1[PernaDireitaZ][RelZ]+float(zombie[j][PernasH])*0.2,zombie[j][Velocidade]*0.01*ZVelocidade);
                if (zombie[j][Pedacos] & Perna2)
				MoveObject(zombie[j][PernaEsquerda],pX+z1[PernaEsquerdaZ][RelX]*PIPO+PEPE*z2[PernaEsquerdaZ][RelX],pY+z1[PernaEsquerdaZ][RelY]*PIPO+PEPE*z2[PernaEsquerdaZ][RelY],pZ+z1[PernaEsquerdaZ][RelZ]+float(!zombie[j][PernasH])*0.2,zombie[j][Velocidade]*0.01*ZVelocidade);
			}else{
			
				StopObject(zombie[j][Cabeca]);
				StopObject(zombie[j][torso]);
				StopObject(zombie[j][BracoDireito]);
				StopObject(zombie[j][BracoEsquerdo]);
				StopObject(zombie[j][PernaDireita]);
				StopObject(zombie[j][PernaEsquerda]);
				GetPlayerHealth(zombie[j][Alvo],H);
				if (!vehicleStatus && !PlayerDeath[zombie[j][Alvo]]) {
					SetPlayerHealth(zombie[j][Alvo],H-5.0);
				}
			}
		}
	}
	return 1;
}
//==============================================================================
public OnPlayerSpawn(playerid) {

    PlayerDeath[playerid]=false;
    if (ZombieMode) {
    
    	ResetPlayerMoney(playerid);
		ResetPlayerWeapons(playerid);
 	 	GivePlayerWeapon(playerid,set[setNumber][0][0],set[setNumber][0][1]);
 	 	GivePlayerWeapon(playerid,set[setNumber][1][0],set[setNumber][1][1]);
 	 	GivePlayerWeapon(playerid,set[setNumber][2][0],set[setNumber][2][1]);
	}
	return 1;
}
//==============================================================================
public OnPlayerDeath(playerid, killerid, reason) {

    PlayerDeath[playerid]=true;
	if (ZombieMode && killerid==INVALID_PLAYER_ID) {
	
	    new tmp[255];
	    format(tmp,255,"~w~PONTOS~n~~r~Zombies~w~: %d ~y~+1 ~n~~b~Humanos~w~: %d",scorez,scorep);
	    scorez++;
	    GameTextForAll(tmp,2000,4);
	    AtacarMaisProximo();
	}

	return 1;
}
//==============================================================================
public OnPlayerConnect(playerid) {

	if (ZombieMode) {
	
	    money[playerid]=GetPlayerMoney(playerid);
	    ResetPlayerMoney(playerid);
	    TirarArmasZombie(playerid);
	}
	return 1;
}
//==============================================================================
public OnPlayerCommandText(playerid, cmdtext[]) {

	new cmd[256];
	new tmp[255];
	new idx;
    cmd = strtok(cmdtext, idx);
    if(IsPlayerAdmin(playerid)) {
    
    if(strcmp(cmdtext, "/zcomandos", true) == 0) {
    
    SendClientMessage(playerid, 0x33AA33AA, "|__________________ZOMBIE MOD THE APOCALIPSE_______________|");
    SendClientMessage(playerid, 0xFFFF00AA, "/zvelocidade  /tempovelozombie  /criarzombie  /ziniciar  /pararzombie  /apagarzombies");
    SendClientMessage(playerid, 0xFFFF00AA, "/temazombie  /ligarzombiemode  /desligarzombiemode");
    return 1;
  }
    
	if(strcmp(cmd, "/zvelocidade", true) == 0) {

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, 0xFFFFFFAA, "/zvelocidade [Velocidade]");
			return 1;
		}
        ZVelocidade=floatstr(tmp);
		return 1;
	}
	
	if(strcmp(cmd, "/tempovelozombie", true) == 0) {
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, 0xFFFFFFAA, "/tempovelozombie [Tempo da velocidade (milisegundos)]");
			return 1;
		}
        ZTimerVelocidade=strval(tmp);
        OnPlayerCommandText(playerid, "/pararzombie");
        OnPlayerCommandText(playerid, "/ziniciar");
		return 1;
	}
	
	if(strcmp(cmd, "/criarzombie", true) == 0) {
	
		new Float:pX,Float:pY,Float:pZ,Float:Ang;
		GetPlayerPos(playerid,pX,pY,pZ);
		GetPlayerFacingAngle(playerid,Ang);
		pX=pX+3.0*floatsin(-Ang,degrees);
		pY=pY+3.0*floatcos(-Ang,degrees);
		pZ=pZ+0.7;
		CriarZombie(pX,pY,pZ,Ang+180.0);
		return 1;
	}
	
	if(strcmp(cmd, "/ziniciar", true) == 0) {
	    if(NOFZombies>0) {
	        new id;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				id = playerid;
			}else{
			    if(!IsPlayerConnected(strval(tmp))) {
			    
			        SendClientMessage(playerid, 0xFFFFFFAA, "Este jogador não está conectado!");
			        return 1;
			    }
			    id = strval(tmp);
			}
			if(TimerAtaca!=-1){KillTimer(TimerAtaca);}
			for (new j=0;j<TOTALZombies;j++){zombie[j][Alvo]=id;}
			TimerAtaca=SetTimer("ZombieAtacando",ZTimerVelocidade,1);
			return 1;
		}
	    SendClientMessage(playerid, 0xFFFFFFAA, "Não tem nenhum zombie para poder iniciar.");
		return 1;
	}
	
	if(strcmp(cmd, "/pararzombie", true) == 0) {
	    if (NOFZombies>0) {
			if (TimerAtaca!=-1) {
			    KillTimer(TimerAtaca);
			}
			for (new j=0;j<TOTALZombies;j++) {
			
			    if (zombie[j][undead]) {
					StopObject(zombie[j][Cabeca]);
					StopObject(zombie[j][torso]);
					StopObject(zombie[j][BracoDireito]);
					StopObject(zombie[j][BracoEsquerdo]);
					StopObject(zombie[j][PernaDireita]);
					StopObject(zombie[j][PernaEsquerda]);
				}
			}
        	return 1;
		}
	    SendClientMessage(playerid, 0xFFFFFFAA, "Não tem nenhum zombie para parar.");
		return 1;
	}
	if (strcmp(cmd, "/apagarzombies", true) == 0) {
	    ApagarZombies();
	    SendClientMessage(playerid, 0xFFFFFFAA, "Não tem nenhum zombie para apagar!");
		return 1;
	}
 	if(strcmp(cmd, "/temazombie", true) == 0) {
	    SetWorldTime(0);
		SetWeather(8);
		return 1;
	}
	if(strcmp(cmd, "/ligarzombiemode", true) == 0) {
	    ZombieMode = true;
	    for (new i=0;i<MAX_PLAYERS;i++) {
			if(IsPlayerConnected(i)) {
				TirarArmasZombie(i);
				money[playerid]=GetPlayerMoney(playerid);
	    		ResetPlayerMoney(playerid);
			}
		}
	    scorez=0;
	    scorep=0;
	    SetWorldTime(0);
		SetWeather(8);
		GameTextForAll("~r~Apocalipse ~w~Mode:~b~ON~w~ ! ~n~~n~~n~~g~ZOMBIES~w~!!!",5000,5);
		if (TimerAPO!=-1){KillTimer(TimerAPO);}
		TimerAPO = SetTimer("AtacarMaisProximo",10000,1);
		if (TimerAtaca!=-1){KillTimer(TimerAtaca);}
		TimerAtaca=SetTimer("ZombieAtacando",ZTimerVelocidade,1);
		while (NOFZombies<TOTALZombies)CriarZombieAleatorio();
		AtacarMaisProximo();
		return 1;
	}
	if(strcmp(cmd, "/desligarzombiemode", true) == 0) {
	    if (ZombieMode) {
			for (new i=0;i<MAX_PLAYERS;i++)if(IsPlayerConnected(i)){DevolverArmasZombie(i);GivePlayerMoney(i,money[i]);}
			format(tmp,255,"~w~PONTOS ~r~Zombies~w~: %d ~b~Humanos~w~: %d~n~~n~~r~apocalipse ~w~mode:~b~off~w~",scorez,scorep);
			GameTextForAll(tmp,6000,4);
			ZombieMode = false;
		    SetWorldTime(12);
			SetWeather(7);
			ApagarZombies();
		}
		if(TimerAPO!=-1){KillTimer(TimerAPO);}
		if(TimerAtaca!=-1){KillTimer(TimerAtaca);}
		return 1;
	}
    }
	return 0;
}
//==============================================================================
Fogo(playerid,STAT) {

    new tmp[250];
    new  weap = GetPlayerWeapon(playerid);
    if(!weapL[weap][allow]) {
        return 1;
    }
    if(!weapL[weap][continua] && STAT==HOLD) {
        return 1;
    }
    Ticket[playerid]=tickcount()+delay;

	new Float:pX,Float:pY,Float:pZ,Float:pA,Float:PEPE,Float:PIPO;
	new Float:zzX,Float:zzY,Float:zzA;
	GetPlayerPos(playerid,pX,pY,pZ);
	GetPlayerFacingAngle(playerid,pA);
	pZ=pZ+0.7;
	new ran;
	for(new j=0;j<TOTALZombies;j++) {
	    if(IsValidObject(zombie[j][torso])) {
	    	GetObjectPos(zombie[j][Cabeca],X,Y,Z);
	    	zzX=X-pX;zzY=Y-pY;zzA=atan2(zzX,zzY);if(zzA>0)zzA-=360.0;
		}
		if(zombie[j][undead]&&(floatsqroot(floatpower(zzX,2)+floatpower(zzY,2)))<weapL[weap][range] && (floatabs(zzA+pA)<weapL[weap][wide])) {
		
		    Z-=1.7;
            zombie[j][HP]-= random(weapL[weap][damageMax]-weapL[weap][damageMin])+weapL[weap][damageMin];
			PEPE = floatsin((zombie[j][Angulo]*3.14159/180.0));
			PIPO = floatcos((zombie[j][Angulo]*3.14159/180.0));
			    
			if(weapL[weap][cutting]) {
                if((zombie[j][Pedacos] & Braco1) || (zombie[j][Pedacos] & Braco2)) {
                    if(ran < 20) {
                    	if(( ran < 10 || !(zombie[j][Pedacos] & Braco2)) && (zombie[j][Pedacos] & Braco1)) {
							zombie[j][Pedacos]-=Braco1;MoveObject(zombie[j][BracoDireito],X+z1[BracoDireitoZ][RelX]*PIPO+PEPE*z2[BracoDireitoZ][RelX],Y+z1[BracoDireitoZ][RelY]*PIPO+PEPE*z2[BracoDireitoZ][RelY],Z,1.0);
						}else{
							zombie[j][Pedacos]-=Braco2;MoveObject(zombie[j][BracoEsquerdo],X+z1[BracoEsquerdoZ][RelX]*PIPO+PEPE*z2[BracoEsquerdoZ][RelX],Y+z1[BracoEsquerdoZ][RelY]*PIPO+PEPE*z2[BracoEsquerdoZ][RelY],Z,1.0);
						}
					}
                }
                else if(zombie[j][HP]<40 && (zombie[j][Pedacos] & Perna1 ) && (zombie[j][Pedacos] & Perna2)) {
                    if(ran < 15){zombie[j][Pedacos]-=Perna1;MoveObject(zombie[j][PernaDireita],X+z1[PernaDireitaZ][RelX]*PIPO+PEPE*z2[PernaDireitaZ][RelX],Y+z1[PernaDireitaZ][RelY]*PIPO+PEPE*z2[PernaDireitaZ][RelY],Z,1.0);}
                    else{zombie[j][Pedacos]-=Perna2;MoveObject(zombie[j][PernaEsquerda],X+z1[PernaEsquerdaZ][RelX]*PIPO+PEPE*z2[PernaEsquerdaZ][RelX],Y+z1[PernaEsquerdaZ][RelY]*PIPO+PEPE*z2[PernaEsquerdaZ][RelY],Z,1.0);}
                    zombie[j][Velocidade]-=float(40);
                }
            }
            if(zombie[j][HP]<0 && zombie[j][undead]) {
            
            	zombie[j][undead]=false;
            	NOFZombies--;
				MoveObject(zombie[j][Cabeca],X,Y,Z,1.5);
				MoveObject(zombie[j][torso],X+z1[torsoZ][RelX]*PIPO+PEPE*z2[torsoZ][RelX],Y+z1[torsoZ][RelY]*PIPO+PEPE*z2[torsoZ][RelY],Z+0.4,1.5);
                if (zombie[j][Pedacos] & Braco1)
				MoveObject(zombie[j][BracoDireito],X+z1[BracoDireitoZ][RelX]*PIPO+PEPE*z2[BracoDireitoZ][RelX],Y+z1[BracoDireitoZ][RelY]*PIPO+PEPE*z2[BracoDireitoZ][RelY],Z,1.5);
				if (zombie[j][Pedacos] & Braco2)
				MoveObject(zombie[j][BracoEsquerdo],X+z1[BracoEsquerdoZ][RelX]*PIPO+PEPE*z2[BracoEsquerdoZ][RelX],Y+z1[BracoEsquerdoZ][RelY]*PIPO+PEPE*z2[BracoEsquerdoZ][RelY],Z,1.5);
				if (zombie[j][Pedacos] & Perna1)
				StopObject(zombie[j][PernaDireita]);
				if (zombie[j][Pedacos] & Perna2)
				StopObject(zombie[j][PernaEsquerda]);
				if (ZombieMode) {
					format(tmp,sizeof(tmp),"~w~PONTOS~n~~r~Zombies~w~: %d ~n~~b~Humanos~w~: %d ~y~+1",scorez,scorep);
					scorep++;
					GameTextForAll(tmp,2000,4);
					ran = random(10);
					SetTimer("CriarZombieAleatorio",ran*1000,0);
					AtacarMaisProximo();
				}
			}
		}
	}
	return 1;
}
//==============================================================================
public HoldingFire() {

	new keys,updown,leftright;
	for(new i=0;i<MAX_PLAYERS;i++) {
	    if(IsPlayerConnected(i)) {
	    	GetPlayerKeys(i,keys,updown,leftright);
	    	if((keys & KEY_FIRE)&&(!IsPlayerInAnyVehicle(i))&&(Ticket[i]<tickcount())) {
		        Fogo(i,HOLD);
		    }
	    }
	}
}
//==============================================================================
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {

	if((NOFZombies>0) && (newkeys & KEY_FIRE)&&(!IsPlayerInAnyVehicle(playerid))&&(Ticket[playerid]<tickcount())) {
        Fogo(playerid,PRESS);
    }
}
//==============================================================================
public CriarZombieAleatorio() {

    new playerid = random(MAX_PLAYERS);
    while (!IsPlayerConnected(playerid)&&GetPlayerInterior(playerid)==0)playerid = random(MAX_PLAYERS);
	new Float:pX,Float:pY,Float:pZ,Float:Ang;
	GetPlayerPos(playerid,pX,pY,pZ);
	Ang=float(random(360));
	pX=pX+50.0*floatsin(Ang,degrees);
	pY=pY+50.0*floatcos(Ang,degrees);
	pZ=pZ+0.7;
	CriarZombie(pX,pY,pZ,Ang);
}
//==============================================================================
public TirarArmasZombie(playerid) {

	LastWeaponUsed[playerid]=GetPlayerWeapon(playerid);GetPlayerWeapon(playerid);
    new WeaponId;
    new ammo;
    for(new i=0;i<11;i++) {
                GetPlayerWeaponData(playerid, i, WeaponId, ammo);
                WeaponList[playerid][i][pWeapId]=WeaponId;
                WeaponList[playerid][i][pAmmo]=ammo;
        }
    ResetPlayerWeapons(playerid);
    return 1;
}
//==============================================================================
public DevolverArmasZombie(playerid) {
    new index;
    for(new i=0;i<11;i++) {
                if(WeaponList[playerid][i][pWeapId]!=0) {
                    if(WeaponList[playerid][i][pWeapId]!=LastWeaponUsed[playerid]) {
                        GivePlayerWeapon(playerid,WeaponList[playerid][i][pWeapId],WeaponList[playerid][i][pAmmo]);
                    }else{
                                index=i;
                        }
        }
        }
    GivePlayerWeapon(playerid,WeaponList[playerid][index][pWeapId],WeaponList[playerid][index][pAmmo]);
    return 1;
}
