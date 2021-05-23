//  HDisk Camera System
//  Copyright(c) 2010 Rafael Ravedutti aka HDisk
//  All rights reserved


#include <a_samp>

#define CAMERA_DISABLE_FOR_PLAYERS 		//only administrators can use
#define CAMERA_FILENAME 				"savedcameras.txt"
#define CAMERA_DEFAULT_MOVE_OFFSET   	0.2
#define CAMERA_DEFAULT_LOOKAT_OFFSET   	1.0
#define CAMERA_COORDZ_LIMIT             50.0
#define CAMERA_LOOKAT_DISTANCE      	20.0
#define CAMERA_UPDATE_INTERVAL          2 //miliseconds

new HCamTimer;

enum pCamInfo
{
	Float:camPos[3],
	Float:camAng,
	Float:camLookZ,
	Float:camMoveOffset,
	Float:camLookAtOffset,
	bool:camMode
}

new PlayerCameraState[MAX_PLAYERS][pCamInfo];

forward CamHackProccessKey();

public OnFilterScriptInit()
{
	print("\n--HDisk Camera System Loaded.\n");
	return 1;
}

stock hmove_up(playerid)
{
	new Float:ZANG;
	
	ZANG = PlayerCameraState[playerid][camLookZ] - PlayerCameraState[playerid][camPos][2];
	
	if(ZANG != 0)
	{
	    PlayerCameraState[playerid][camLookZ] += (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT;
	    PlayerCameraState[playerid][camPos][2] += (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT;
	    
	    PlayerCameraState[playerid][camPos][0] += (PlayerCameraState[playerid][camMoveOffset] - (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT) * floatsin(-PlayerCameraState[playerid][camAng], degrees);
		PlayerCameraState[playerid][camPos][1] += (PlayerCameraState[playerid][camMoveOffset] - (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT) * floatcos(-PlayerCameraState[playerid][camAng], degrees);
	}
	
	else
	{
		PlayerCameraState[playerid][camPos][0] += PlayerCameraState[playerid][camMoveOffset] * floatsin(-PlayerCameraState[playerid][camAng], degrees);
		PlayerCameraState[playerid][camPos][1] += PlayerCameraState[playerid][camMoveOffset] * floatcos(-PlayerCameraState[playerid][camAng], degrees);
	}
}

stock hmove_down(playerid)
{
    new Float:ZANG;

	ZANG = PlayerCameraState[playerid][camLookZ] - PlayerCameraState[playerid][camPos][2];

	if(ZANG != 0)
	{
	    PlayerCameraState[playerid][camLookZ] -= (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT;
	    PlayerCameraState[playerid][camPos][2] -= (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT;
	    
	    PlayerCameraState[playerid][camPos][0] -= (PlayerCameraState[playerid][camMoveOffset] - (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT) * floatsin(-PlayerCameraState[playerid][camAng], degrees);
		PlayerCameraState[playerid][camPos][1] -= (PlayerCameraState[playerid][camMoveOffset] - (PlayerCameraState[playerid][camMoveOffset] * ZANG) / CAMERA_COORDZ_LIMIT) * floatcos(-PlayerCameraState[playerid][camAng], degrees);
	}
	
	else
	{
    	PlayerCameraState[playerid][camPos][0] -= PlayerCameraState[playerid][camMoveOffset] * floatsin(-PlayerCameraState[playerid][camAng], degrees);
		PlayerCameraState[playerid][camPos][1] -= PlayerCameraState[playerid][camMoveOffset] * floatcos(-PlayerCameraState[playerid][camAng], degrees);
	}
}

stock hmove_right(playerid)
{
    new Float:ANG;

	ANG = PlayerCameraState[playerid][camAng] + 270.0;
	while(ANG > 360.0)
	{
	    ANG -= 360.0;
 	}

    PlayerCameraState[playerid][camPos][0] += PlayerCameraState[playerid][camMoveOffset] * floatsin(-ANG, degrees);
	PlayerCameraState[playerid][camPos][1] += PlayerCameraState[playerid][camMoveOffset] * floatcos(-ANG, degrees);
}

stock hmove_left(playerid)
{
	new Float:ANG;
	
	ANG = PlayerCameraState[playerid][camAng] + 90.0;
	while(ANG > 360.0)
	{
	    ANG -= 360.0;
 	}
 	
    PlayerCameraState[playerid][camPos][0] += PlayerCameraState[playerid][camMoveOffset] * floatsin(-ANG, degrees);
	PlayerCameraState[playerid][camPos][1] += PlayerCameraState[playerid][camMoveOffset] * floatcos(-ANG, degrees);
}

stock hlook_left(playerid)
{
	PlayerCameraState[playerid][camAng] += PlayerCameraState[playerid][camLookAtOffset];
	
	while(PlayerCameraState[playerid][camAng] >= 360.0)
	{
	    PlayerCameraState[playerid][camAng] -= 360.0;
	}
}

stock hlook_right(playerid)
{
	PlayerCameraState[playerid][camAng] -= PlayerCameraState[playerid][camLookAtOffset];
	
	while(PlayerCameraState[playerid][camAng] < 0)
	{
	    PlayerCameraState[playerid][camAng] += 360.0;
	}
}

stock hlook_up(playerid)
{
	PlayerCameraState[playerid][camLookZ] += PlayerCameraState[playerid][camLookAtOffset];
	
	if(PlayerCameraState[playerid][camLookZ] > PlayerCameraState[playerid][camPos][2] + CAMERA_COORDZ_LIMIT)
	    PlayerCameraState[playerid][camLookZ] = PlayerCameraState[playerid][camPos][2] + CAMERA_COORDZ_LIMIT;
}

stock hlook_down(playerid)
{
    PlayerCameraState[playerid][camLookZ] -= PlayerCameraState[playerid][camLookAtOffset];
    
    if(PlayerCameraState[playerid][camLookZ] < PlayerCameraState[playerid][camPos][2] - CAMERA_COORDZ_LIMIT)
	    PlayerCameraState[playerid][camLookZ] = PlayerCameraState[playerid][camPos][2] - CAMERA_COORDZ_LIMIT;
}

stock hcam_start(playerid)
{
	if(!HCamTimer)
	    HCamTimer = SetTimer("CamHackProccessKey", CAMERA_UPDATE_INTERVAL, true);
	    
    PlayerCameraState[playerid][camMoveOffset] = CAMERA_DEFAULT_MOVE_OFFSET;
    PlayerCameraState[playerid][camLookAtOffset] = CAMERA_DEFAULT_LOOKAT_OFFSET;
    GetPlayerPos(playerid, PlayerCameraState[playerid][camPos][0], PlayerCameraState[playerid][camPos][1], PlayerCameraState[playerid][camPos][2]);
	GetPlayerFacingAngle(playerid, PlayerCameraState[playerid][camAng]);
	PlayerCameraState[playerid][camLookZ] = PlayerCameraState[playerid][camPos][2];
	TogglePlayerControllable(playerid, false);
	hcam_update(playerid);
    PlayerCameraState[playerid][camMode] = true;
}

stock hcam_stop(playerid)
{
    new bool:pfound;
    
    PlayerCameraState[playerid][camMode] = false;
    TogglePlayerControllable(playerid, true);
	SetCameraBehindPlayer(playerid);
	
	pfound = false;
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i) && PlayerCameraState[i][camMode])
	    {
	        pfound = true;
	    }
	}
	
	if(!pfound)
	{
	    KillTimer(HCamTimer);
	    HCamTimer = 0;
	}
}

stock hcam_update(playerid)
{
	new Float:CAMLOOKATX, Float:CAMLOOKATY, Float:CAMANG;

	SetPlayerCameraPos(playerid, PlayerCameraState[playerid][camPos][0], PlayerCameraState[playerid][camPos][1], PlayerCameraState[playerid][camPos][2]);

	CAMANG = PlayerCameraState[playerid][camAng];
	CAMLOOKATX = PlayerCameraState[playerid][camPos][0] + (CAMERA_LOOKAT_DISTANCE * floatsin(-CAMANG, degrees));
	CAMLOOKATY = PlayerCameraState[playerid][camPos][1] + (CAMERA_LOOKAT_DISTANCE * floatcos(-CAMANG, degrees));
	
	SetPlayerCameraLookAt(playerid, CAMLOOKATX, CAMLOOKATY, PlayerCameraState[playerid][camLookZ]);
}

public CamHackProccessKey()
{
	new pkey, pud, plr;
	
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && PlayerCameraState[i][camMode])
		{
	    	GetPlayerKeys(i, pkey, pud, plr);
	        
			if(pud == KEY_UP)
	    		hmove_up(i);
			if(pud == KEY_DOWN)
			    hmove_down(i);
			if(plr == KEY_LEFT)
			    hmove_left(i);
			if(plr == KEY_RIGHT)
			    hmove_right(i);
			if(pkey & KEY_LOOK_BEHIND)
			    hlook_up(i);
			if(pkey & KEY_FIRE)
			    hlook_down(i);
			if(pkey & KEY_ANALOG_LEFT)
			    hlook_left(i);
			if(pkey & KEY_ANALOG_RIGHT)
			    hlook_right(i);
			
			hcam_update(i);
		}
	}
}

public OnPlayerCommandText(playerid, cmdtext[])
{

#if defined CAMERA_DISABLE_FOR_PLAYERS

	if(!IsPlayerAdmin(playerid))
	    return 0;
	    
#endif

	new cmd[128], idx = 0;
	
	while(cmdtext[idx] != ' ' && cmdtext[idx] != '\0')
	{
	    cmd[idx] = cmdtext[idx];
	    ++idx;
	}
	
	cmd[idx] = '\0';
	
	while(cmdtext[idx] == ' ')
		++idx;
	
	if(strcmp(cmd, "/hcamera", true) == 0)
	{
	    if(!PlayerCameraState[playerid][camMode])
	        hcam_start(playerid);

		else
		    hcam_stop(playerid);
		    
		return 1;
	}
	
	if(strcmp(cmd, "/hsave", true) == 0)
	{
	    new File:camfile, wcontent[256], Float:CAMLOOKATX, Float:CAMLOOKATY, Float:CAMANG;
	    
	    if(fexist(CAMERA_FILENAME))
	    	camfile = fopen(CAMERA_FILENAME, io_append);
		else
		    camfile = fopen(CAMERA_FILENAME, io_write);

		CAMANG = PlayerCameraState[playerid][camAng];
		CAMLOOKATX = PlayerCameraState[playerid][camPos][0] + (CAMERA_LOOKAT_DISTANCE * floatsin(-CAMANG, degrees));
		CAMLOOKATY = PlayerCameraState[playerid][camPos][1] + (CAMERA_LOOKAT_DISTANCE * floatcos(-CAMANG, degrees));
		
		format(wcontent, sizeof wcontent, "SetPlayerCameraPos(playerid, %.4f, %.4f, %.4f);\r\nSetPlayerCameraLookAt(playerid, %.4f, %.4f, %.4f);\r\n\r\n",
 			PlayerCameraState[playerid][camPos][0],
		    PlayerCameraState[playerid][camPos][1],
		    PlayerCameraState[playerid][camPos][2],
		    CAMLOOKATX,
		    CAMLOOKATY,
		    PlayerCameraState[playerid][camLookZ]);

		fwrite(camfile, wcontent);
		fclose(camfile);
		return 1;
	}
	
	return 0;
}
