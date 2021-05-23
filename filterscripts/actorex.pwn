#include <a_samp>
#define FILTERSCRIPT

forward OnActorCreate(actorid);

new ActorVehicles[50];

public OnFilterScriptInit()
{
	return 1;
}

public OnPlayerConnect( playerid )
{
	return 1;
}

public OnPlayerDisconnect( playerid )
{

}

public OnActorCreate( actorid )
{
	printf("New actor was created. %u",actorid);
	return 1;
}

Float:floatrand(Float:min, Float:max)
{
	new imin;
	imin = floatround(min);
	return float(random((floatround(max) - imin) * 100) + (imin * 100)) / 100.0;
}

new d;

public OnPlayerCommandText( playerid, cmdtext[] )
{
	new cmd[256], idx;
    new vehicleid;
    new actorid;
    
	cmd = strtok( cmdtext, idx );

  	if ( strcmp( cmd, "/dall", true ) == 0 )
 	{
 		for ( new i = 0; i <= d; i++ ) { DestroyActor(i); }
 		d = 0;
 		return 1;
 	}
 	

  	if(strcmp( cmd, "/dosetup", true ) == 0)
 	{
 	    new x=1;
 	    new pedskin=87;
 	    new Float:fX,Float:fY,Float:fZ;

		fX = 2624.5;
		fY = 2523.0;
		fZ = 6.0;
		
 	    while(x!=20) {
 	         CreateActor(pedskin,fX+5.0,fY,fZ,90,"Haxer");
 	         ActorVehicles[x] = CreateVehicle(409,fX,fY,fZ,0,x,x,-1);
 	         fX+=10.0;
 	         fY-=10.0;
 	         x++;
 	         printf("New Vehicle: %u\n",vehicleid);
		}
 		
 		return 1;
 	}

	if(strcmp( cmd, "/mancars", true ) == 0)
 	{
 	    new x=1;

 	    while(x!=20) {
			 ActorEnterVehicle(x,ActorVehicles[x],0);
			 x++;
 		}
 	
 		return 1;
 	}

	 if(strcmp( cmd, "/gogogo", true ) == 0)
 	{
 	     new x=1;

 	    while(x!=20) {
            vehicleid = GetActorVehicleID(x);
			if(vehicleid != INVALID_VEHICLE_ID) {
		   	 	ActorDriveVehicleTo(x,vehicleid,1579.0,2463.2,6.61,20.0,2);
			}
			x++;
 		}
 		return 1;
 	}

	if ( strcmp( cmd, "/cactor", true ) == 0 )
	{
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos( playerid, X, Y, Z );
		new tmp[256];
		tmp = strtok(cmdtext, idx);

		if ( !strlen(tmp) ) {
			d = CreateActor( 165, X+5,Y+5, Z, 90, "Haxer" );
		} else {
			d = CreateActor( strval(tmp), X+5,Y+5, Z, 90, "Haxer" );
		}

		format(tmp, 246, "Created actor with ID %d", d);
		SendClientMessage(playerid, 0xFFFFFFFF, tmp );
		return 1;
	}
	
	if ( strcmp( cmd, "/getinmycar", true ) == 0 )
	{
		new tmp[256];

		tmp = strtok(cmdtext, idx);
		vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid != INVALID_VEHICLE_ID) {
		    ActorEnterVehicle(strval(tmp),vehicleid,0);
		}
		return 1;
	}

 	if ( strcmp( cmd, "/getoutofcar", true ) == 0 )
	{
		new tmp[256];
		
		tmp = strtok(cmdtext, idx);
		vehicleid = GetActorVehicleID(strval(tmp));
		if(vehicleid != INVALID_VEHICLE_ID) {
		    ActorExitVehicle(strval(tmp),vehicleid);
		}
		return 1;
	}
	
	if ( strcmp( cmd, "/drive", true ) == 0 )
	{
		new tmp[256];

		tmp = strtok(cmdtext, idx);
		actorid = strval(tmp);
		vehicleid = GetActorVehicleID(actorid);
		if(vehicleid != INVALID_VEHICLE_ID) {
		    ActorDriveVehicleTo(actorid,vehicleid,1579.0,2463.2,6.61,30.0,2);
		}
		return 1;
	}
	
	if ( strcmp( cmd, "/dactor", true ) == 0 )
	{
		DestroyActor( strval( strtok( cmdtext, idx ) ) );
		return 1;
	}

	if ( strcmp( cmd, "/moveactor", true ) == 0 )
	{
	    new tmp;
	    tmp = strval( strtok( cmdtext, idx ) );
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos( playerid, X, Y, Z );
	    ActorMoveTo( tmp, 7, X, Y, Z );
	    return 1;
	}

	if ( strcmp( cmd, "/moveall", true ) == 0 )
	{
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos( playerid, X, Y, Z );
	    for(new i = 0; i <= d;i++) { ActorMoveTo( i, 7, X, Y, Z ); }
	    return 1;
	}


	if(strcmp( cmd, "/vehicle", true ) == 0 )
	{
		new Float:X, Float:Y, Float:Z;
		new tmp[256];
		new created_vehicle_id;
		tmp = strtok( cmdtext, idx );

		GetPlayerPos( playerid, X, Y, Z );

		created_vehicle_id = CreateVehicle( strval(tmp), X+2, Y+2, Z, 0, 0, 0, -1 );
		
		new msg[256];
		format(msg,256,"Created vehicle: %d",created_vehicle_id);
		SendClientMessage(playerid,0xAAAAAAAA,msg);
		
		return 1;
	}

	if(strcmp( cmd, "/dvehicle", true ) == 0 )
	{
		new tmp[256];
		tmp = strtok( cmdtext, idx );

		DestroyVehicle( strval(tmp) );

		new msg[256];
		format(msg,256,"Destroyed vehicle: %d",strval(tmp));
		SendClientMessage(playerid,0xAAAAAAAA,msg);
		
		return 1;
	}

	if ( strcmp( cmd, "/goto", true ) == 0 )
	{
	    new tmp[256];

	    tmp = strtok( cmdtext, idx );

	    if ( !strlen( tmp ) ) { return 1; }

	    new Float:X, Float:Y, Float:Z;

	    if ( GetPlayerVehicleID( playerid ) )
	    {
		    GetPlayerPos( strval(tmp), X, Y, Z );
		    SetVehiclePos( GetPlayerVehicleID(playerid), X+2, Y+2, Z );
	    } else {
		    GetPlayerPos( strval(tmp), X, Y, Z );
		    SetPlayerPos( playerid, X+2, Y+2, Z );
	    }

	    return 1;
	}

	if ( strcmp( cmd, "/bring", true ) == 0 )
	{
	    new tmp[256];

	    tmp = strtok( cmdtext, idx );

	    if ( !strlen( tmp ) ) { return 1; }

	    new Float:X, Float:Y, Float:Z;

	    if ( GetPlayerVehicleID( strval(tmp) ) )
	    {
		    GetPlayerPos( playerid, X, Y, Z );
		    SetVehiclePos( GetPlayerVehicleID(strval(tmp)), X+2, Y+2, Z );
	    } else {
		    GetPlayerPos( playerid, X, Y, Z );
		    SetPlayerPos( strval(tmp), X+2, Y+2, Z );
	    }

	    return 1;
	}

	return 0;
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
