#include <a_samp>

#define MAX_MONEY_PICKUPS			100 	// Máximo de pickups de dinheiro que podem ser criadas
#define INVALID_MONEY_PICKUP        -1
#define PICKUP_MODEL                0   	// Modelo da pickup
#define PICKUP_TYPE                 2 		// Tipo da pickup

enum mpInfo
{
	mpId,
	Float:mpX,
	Float:mpY,
	Float:mpZ
}

new MoneyPickups[MAX_MONEY_PICKUPS][mpInfo];
new MPPath[256];

// FUNCTIONS BY DRACOBLUE

stock strtok(const string[], &index, seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[128];
	while ((index < length) && (string[index] != seperator) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	if ((index < length) && (string[index] == seperator))
	{
		index++;
	}
	return result;
}

// --------- -- ---------

public OnGameModeInit()
{
    new count;
    
    MPPath = ("moneypickups.ini");

    if(fexist(MPPath))
    {
        new File:fr;
        new tmp[128];

        while(fread(fr, tmp, sizeof tmp))
        {
            new idx;

            idx = 0;
            MoneyPickups[count][mpX] = floatstr(strtok(tmp, idx));
            MoneyPickups[count][mpY] = floatstr(strtok(tmp, idx));
            MoneyPickups[count][mpZ] = floatstr(strtok(tmp, idx));
            MoneyPickups[count][mpId] = CreatePickup(PICKUP_MODEL, PICKUP_TYPE, MoneyPickups[count][mpX], MoneyPickups[count][mpY], MoneyPickups[count][mpZ]);

			count++;
            if(count >= MAX_MONEY_PICKUPS)
                break;
        }

        fclose(fr);
    }
    
    for(new p = count; p < MAX_MONEY_PICKUPS; p++)
		MoneyPickups[p][mpId] = INVALID_MONEY_PICKUP;
}

public OnGameModeExit()
{
	new File:fw;
	new in[128];
	
	fw = fopen(MPPath, io_write);
	
	for(new p = 0; p < MAX_MONEY_PICKUPS; p++)
	{
	    if(MoneyPickups[p][mpId] != INVALID_MONEY_PICKUP)
	    {
	        format(in, sizeof in, "%.4f %.4f %.4f\r\n", MoneyPickups[p][mpX], MoneyPickups[p][mpY], MoneyPickups[p][mpZ]);
	        fwrite(fw, in);
	    }
	}
	
	fclose(fw);
}

stock CreateMoneyPickup(Float:X, Float:Y, Float:Z)
{
    for(new p = 0; p < MAX_MONEY_PICKUPS; p++)
	{
	    if(MoneyPickups[p][mpId] == INVALID_PICKUP_ID)
	    {
	        MoneyPickups[p][mpX] = X;
	        MoneyPickups[p][mpY] = Y;
	        MoneyPickups[p][mpZ] = Z;
	        MoneyPickups[p][mpId] = CreatePickup(PICKUP_MODEL, PICKUP_TYPE, X, Y, Z);
			return 1;
	    }
	}

	return 0;
}

stock DeleteMoneyPickup(pickupid)
{
	for(new p = 0; p < MAX_MONEY_PICKUPS; p++)
	{
	    if(MoneyPickups[p][mpId] == pickupid)
	    {
	        MoneyPickups[p][mpId] = INVALID_PICKUP_ID;
			return 1;
	    }
	}
	
	return 0;
}
