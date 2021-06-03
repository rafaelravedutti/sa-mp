#include <a_samp>

#define MAX_DROP_AMOUNT				-1 // special drop-limits like 500 ammo are possible; -1 = all ammo is dropped
#define MAX_DROP_LIFETIME			30 // after 30 seconds the pickup gets destroyed. Note: old pickups will be destroyed anyway.

#define WEAPON_SLOTS				13
#define INVALID_PICKUP				-1
#define MAX_PICKUPS					90
#define PICKUP_TYPE					19

forward DestroyPickupEx( p );

enum pickup
{
	creation_time,
	weapon,
	ammo,
	timer
}
new pickups [ MAX_PICKUPS ][ pickup ];
// Set any of those to -1 to disable dropping of that weapon
new weapons[] =
{
	-1, // no fists
	331, // - Brass Knuckles
	333, // Golf Club
	334, // Night Stick
	335, // Knife
	336, // baseball bat
	337, // shovel
	338, // pool cue
	339, // katama
	341, // chainsaw
	321, // regular dildo
	322, // white dildo
	323, // Medium, white vibrator
	324, // smaill, silver vibrator
	325, // flowers
	326, // cane
	342, // grendade
	343, // tear gas
	344, // molotov
	-1, // RPG rocket - we can't pick up those, do we oO
	-1, // Heat-Seeking Rocket
	-1, // Hydra rocket
	346, // colt 45
	347, // colt 45 + silencer
	348, // deagle
	349, // shotgun
	350, // sawn-off
	351, // spaz
	352, // micro-uzi
	353, // mp5
	355, // ak47
	356, // m4
	372, // tec9
	357, // country rifle
	358, // sniper rifle
	-1, // rocket launcher
	-1, // heat-seeking rocket launcher
	361, // flamethrower
	-1, // minigun
	363, // sachtel charges
	-1, // detonator
	365, // spray can
	366, // fire extinguisher
	-1, // camera
	-1, // night-vision goggles
	-1, // heat-vision goggles
	371 // parachute
};

public OnFilterScriptInit( )
{
	print(" ");
	print("    Weapon Drop Script v1.0");
	print("    by mabako - http://mabako.net/samp/");
	print(" ");
}

public OnFilterScriptExit( )
{
	print(" ");
	print("    Weapon Drop Script unloaded!");
	print(" ");
}

/*
public OnPlayerCommandText( playerid, cmdtext[] )
{
	if( !strcmp(cmdtext,"/drop", true) )
	{
	    DropWeapons( playerid );
	    ResetPlayerWeapons( playerid );
	    return 1;
	}
	return 0;
}*/

public OnPlayerDeath( playerid, killerid, reason )
{
	DropWeapons( playerid );
	return 1;
}

DropWeapons( playerid )
{
	new Float: px, Float: py, Float: pz;
	new hour,minute,second;
	new year, month,day;
	gettime(hour, minute, second);
	getdate(year, month, day);

	GetPlayerPos( playerid, px, py, pz );

	new weapon_slots[WEAPON_SLOTS + 1][2];
	new used_weapon_slots;

	for( new i = 0; i < WEAPON_SLOTS; i ++ )
	{
		GetPlayerWeaponData( playerid, i, weapon_slots[ i ][ 0 ], weapon_slots[ i ][ 1 ]);
		if( i == 0 && weapon_slots[ i ][ 0 ] == 0 ) weapon_slots[ i ][ 1 ] = 0; // no fist...

		if( weapon_slots[ i ][ 1 ] > 0 && weapon_slots[ i ][ 0 ] < sizeof( weapons ) && weapons[ weapon_slots[ i ][ 0 ] ] != -1 )
		{
			used_weapon_slots ++;
		}
		else
		{
		    weapon_slots[ i ][ 0 ] = 0;
		    weapon_slots[ i ][ 1 ] = 0;
		}
	}
	// Create the pickups
	new used_weapon_slots2 = used_weapon_slots;
	for( new i = 0; i < WEAPON_SLOTS; i ++ )
	{
	    if( weapon_slots[ i ][ 1 ] > 0 )
	    {
			new Float:angle = 360.0 - float(used_weapon_slots--) * ( 360.0 / float(used_weapon_slots2) );
			// see... if there's a pickup we create by any chance

			new p = CreatePickup( weapons[ weapon_slots[ i ][ 0 ] ], PICKUP_TYPE, px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz );
			if( p == INVALID_PICKUP )
			{
				new lowest_time;
				new _id;
				for( new j = 0; j < MAX_PICKUPS; j ++ )
				{
					if( pickups[ j ][ creation_time ] < lowest_time )
					{
					    lowest_time = pickups[ j ][ creation_time ];
					    _id = j;
					}
				}

				DestroyPickupEx( _id );
				KillTimer( pickups[ _id ][ timer ] );

				p = CreatePickup( weapons[ weapon_slots[ i ][ 0 ] ], PICKUP_TYPE, px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz );
			}
			pickups[ p ][ creation_time ] = mktime(hour,minute,second,day,month,year);
			pickups[ p ][ weapon ] = weapon_slots[ i ][ 0 ];
			pickups[ p ][ ammo ] = weapon_slots[ i ][ 1 ];
			#if MAX_DROP_AMOUNT != -1
		    if( pickups[ p ][ ammo ] > MAX_DROP_AMOUNT )
		    {
		        pickups[ p ][ ammo ] = MAX_DROP_AMOUNT;
		    }
		    #endif
			pickups[ p ][ timer ] = SetTimerEx("DestroyPickupEx", MAX_DROP_LIFETIME * 1000, 0, "i", p);
		}
	}
}


// by mabako :D
mktime(hour,minute,second,day,month,year) {
	new timestamp;
	timestamp = second;
	timestamp += minute * 60;
	timestamp += hour * 3600;

	new days_of_month[12];
	if(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
		days_of_month = {31,29,31,30,31,30,31,31,30,31,30,31}; // Schaltjahr
	} else {
		days_of_month = {31,28,31,30,31,30,31,31,30,31,30,31}; // keins
	}
	new days_this_year = 0;
	days_this_year = day;
	if(month > 1) { // No January Calculation, because its always the 0 past months
		for(new i=0; i<month-1;i++) {
			days_this_year += days_of_month[i];
		}
	}
	timestamp += days_this_year * 86400;

	for(new j=1970;j<year;j++) {
		timestamp += 31536000;
		if(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) timestamp += 86400; // Schaltjahr + 1 Tag
	}
	return timestamp;
}

public DestroyPickupEx( p )
{
	DestroyPickup( p );
	pickups[ p ][ creation_time ] = 0;
	pickups[ p ][ weapon ] = 0;
	pickups[ p ][ ammo ] = 0;
}




public OnPlayerPickUpPickup( playerid, pickupid )
{
	if( pickups[ pickupid ][ creation_time ] != 0 )
	{
		GivePlayerWeapon( playerid, pickups[ pickupid ][ weapon ], pickups[ pickupid ][ ammo ] );
	}
	return 1;
}

